---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.193291, 0.3532054, -2.045586, 1, 0, 0, 1,
-2.706477, -0.6844714, -1.996135, 1, 0.007843138, 0, 1,
-2.60353, -0.365723, -0.4899438, 1, 0.01176471, 0, 1,
-2.444845, -0.8459918, -1.45751, 1, 0.01960784, 0, 1,
-2.426579, 1.172982, -3.934039, 1, 0.02352941, 0, 1,
-2.346686, 0.6358781, -2.319146, 1, 0.03137255, 0, 1,
-2.337493, -0.4103852, -1.169665, 1, 0.03529412, 0, 1,
-2.31995, -0.2361797, -0.4705532, 1, 0.04313726, 0, 1,
-2.314129, 1.31736, -1.594777, 1, 0.04705882, 0, 1,
-2.261428, -0.8547499, -0.5605646, 1, 0.05490196, 0, 1,
-2.233731, -0.6296363, -1.443874, 1, 0.05882353, 0, 1,
-2.169679, -1.042141, -3.569761, 1, 0.06666667, 0, 1,
-2.1666, 0.2000833, -2.749882, 1, 0.07058824, 0, 1,
-2.1543, -0.4379275, -0.9015841, 1, 0.07843138, 0, 1,
-2.101181, -1.927148, -2.613719, 1, 0.08235294, 0, 1,
-2.097232, -0.998238, -2.757183, 1, 0.09019608, 0, 1,
-2.08968, -0.3478421, -2.519094, 1, 0.09411765, 0, 1,
-2.087134, 0.1744909, -2.912859, 1, 0.1019608, 0, 1,
-2.083384, -0.5292863, -2.079396, 1, 0.1098039, 0, 1,
-2.069021, -1.612724, -2.115935, 1, 0.1137255, 0, 1,
-2.037882, 0.04962743, 0.7274812, 1, 0.1215686, 0, 1,
-2.024587, 0.4904938, -1.524568, 1, 0.1254902, 0, 1,
-1.977574, 0.7746637, -1.147285, 1, 0.1333333, 0, 1,
-1.960838, -0.2710288, -0.9968371, 1, 0.1372549, 0, 1,
-1.955123, -0.6046418, -0.4460646, 1, 0.145098, 0, 1,
-1.943044, 0.3641514, -0.8322814, 1, 0.1490196, 0, 1,
-1.903046, 0.7342705, -0.839563, 1, 0.1568628, 0, 1,
-1.877746, -0.2357109, -2.21813, 1, 0.1607843, 0, 1,
-1.873968, -0.2716216, -1.432277, 1, 0.1686275, 0, 1,
-1.872028, -0.7998851, -1.990852, 1, 0.172549, 0, 1,
-1.869344, 0.7424691, -2.675524, 1, 0.1803922, 0, 1,
-1.863204, 0.3277916, -2.113593, 1, 0.1843137, 0, 1,
-1.855772, 0.01967062, -0.9559329, 1, 0.1921569, 0, 1,
-1.838228, -0.3978447, -0.3308913, 1, 0.1960784, 0, 1,
-1.825193, -1.025879, -1.477762, 1, 0.2039216, 0, 1,
-1.823831, 0.6029559, -0.6140255, 1, 0.2117647, 0, 1,
-1.822321, 0.5070819, -2.194364, 1, 0.2156863, 0, 1,
-1.798243, -0.622544, -0.5480275, 1, 0.2235294, 0, 1,
-1.775257, -0.571104, -0.666328, 1, 0.227451, 0, 1,
-1.764689, 0.8245895, -1.473796, 1, 0.2352941, 0, 1,
-1.759324, -0.9052296, -3.094107, 1, 0.2392157, 0, 1,
-1.732006, -0.4551457, -1.470763, 1, 0.2470588, 0, 1,
-1.711112, 0.9601669, -1.279228, 1, 0.2509804, 0, 1,
-1.697175, -0.4414077, -1.979832, 1, 0.2588235, 0, 1,
-1.667237, 0.3944253, -0.9793333, 1, 0.2627451, 0, 1,
-1.663725, 2.057092, -0.5982513, 1, 0.2705882, 0, 1,
-1.657271, -0.01785168, -2.005985, 1, 0.2745098, 0, 1,
-1.656791, 0.3407584, 0.917541, 1, 0.282353, 0, 1,
-1.653657, 0.1666863, -1.11631, 1, 0.2862745, 0, 1,
-1.649005, -0.4926357, -2.666595, 1, 0.2941177, 0, 1,
-1.644452, 2.073324, 1.235278, 1, 0.3019608, 0, 1,
-1.635732, 0.05290259, -0.1178226, 1, 0.3058824, 0, 1,
-1.63292, -0.5718535, -3.273701, 1, 0.3137255, 0, 1,
-1.620408, -0.1968267, -2.248996, 1, 0.3176471, 0, 1,
-1.619445, -1.129628, -4.629851, 1, 0.3254902, 0, 1,
-1.614774, -1.195676, -2.540928, 1, 0.3294118, 0, 1,
-1.613315, 1.199607, -0.9089168, 1, 0.3372549, 0, 1,
-1.609619, 0.4406301, -1.032507, 1, 0.3411765, 0, 1,
-1.606521, 2.355953, 0.0180433, 1, 0.3490196, 0, 1,
-1.557035, 0.6901616, -2.736876, 1, 0.3529412, 0, 1,
-1.547666, -0.9674448, -1.586282, 1, 0.3607843, 0, 1,
-1.547534, 1.317959, -2.256217, 1, 0.3647059, 0, 1,
-1.542431, 0.1856143, -2.382215, 1, 0.372549, 0, 1,
-1.53341, 0.673963, -0.8348858, 1, 0.3764706, 0, 1,
-1.514843, -0.04978378, -1.629805, 1, 0.3843137, 0, 1,
-1.505412, -1.481667, -1.171421, 1, 0.3882353, 0, 1,
-1.505403, -0.6502193, -0.7832027, 1, 0.3960784, 0, 1,
-1.503755, -0.7049759, -1.491865, 1, 0.4039216, 0, 1,
-1.491128, -0.5844364, -2.27597, 1, 0.4078431, 0, 1,
-1.479316, 1.359093, -3.571007, 1, 0.4156863, 0, 1,
-1.476863, 0.07165314, -2.918272, 1, 0.4196078, 0, 1,
-1.470504, 0.1383849, -1.642302, 1, 0.427451, 0, 1,
-1.453104, 0.3968809, 0.3877865, 1, 0.4313726, 0, 1,
-1.449151, -1.479601, -0.7881568, 1, 0.4392157, 0, 1,
-1.441759, -0.6897306, -3.542254, 1, 0.4431373, 0, 1,
-1.426256, 0.8297201, 0.1068477, 1, 0.4509804, 0, 1,
-1.414692, 0.02883262, -0.4716228, 1, 0.454902, 0, 1,
-1.396408, -0.9572554, -2.915071, 1, 0.4627451, 0, 1,
-1.395597, -0.5456223, -0.6543548, 1, 0.4666667, 0, 1,
-1.39359, -1.104344, -1.599945, 1, 0.4745098, 0, 1,
-1.389341, 0.2048865, -3.675281, 1, 0.4784314, 0, 1,
-1.382421, -0.6441485, -2.742176, 1, 0.4862745, 0, 1,
-1.380979, 0.7708625, -0.117325, 1, 0.4901961, 0, 1,
-1.371898, -0.09361491, -1.860565, 1, 0.4980392, 0, 1,
-1.367392, 0.8898104, -0.6552948, 1, 0.5058824, 0, 1,
-1.356552, -0.7425982, -1.305199, 1, 0.509804, 0, 1,
-1.350647, -0.5227715, -0.5284472, 1, 0.5176471, 0, 1,
-1.334716, 0.1816392, -2.533323, 1, 0.5215687, 0, 1,
-1.323318, -1.014269, -1.362137, 1, 0.5294118, 0, 1,
-1.321996, -0.3059705, -1.717723, 1, 0.5333334, 0, 1,
-1.316807, -0.9392979, -0.8119951, 1, 0.5411765, 0, 1,
-1.310699, 0.6790165, -0.711815, 1, 0.5450981, 0, 1,
-1.309638, 0.3763393, -0.952868, 1, 0.5529412, 0, 1,
-1.309014, 0.3980268, -2.599867, 1, 0.5568628, 0, 1,
-1.29452, 0.6381367, -1.328072, 1, 0.5647059, 0, 1,
-1.284937, 0.2150708, -0.574955, 1, 0.5686275, 0, 1,
-1.278813, -0.2380074, -1.435852, 1, 0.5764706, 0, 1,
-1.263062, -0.6978567, 1.005183, 1, 0.5803922, 0, 1,
-1.255306, -0.2393639, -0.937636, 1, 0.5882353, 0, 1,
-1.254034, 0.4053547, -2.487293, 1, 0.5921569, 0, 1,
-1.245212, -0.4195184, -3.361886, 1, 0.6, 0, 1,
-1.24131, 0.9673709, -0.4253866, 1, 0.6078432, 0, 1,
-1.239385, 2.16103, -0.1199166, 1, 0.6117647, 0, 1,
-1.239356, 1.034012, -0.235364, 1, 0.6196079, 0, 1,
-1.231141, -0.5564145, -0.4404712, 1, 0.6235294, 0, 1,
-1.224711, 1.01669, -0.9881899, 1, 0.6313726, 0, 1,
-1.221997, 0.4313951, -1.399234, 1, 0.6352941, 0, 1,
-1.218809, -1.117752, -2.626492, 1, 0.6431373, 0, 1,
-1.218702, -0.2558151, -1.399467, 1, 0.6470588, 0, 1,
-1.218292, 0.1340358, -1.567394, 1, 0.654902, 0, 1,
-1.217253, -1.263764, -3.311055, 1, 0.6588235, 0, 1,
-1.209648, 0.05022784, -1.788988, 1, 0.6666667, 0, 1,
-1.207098, -0.8659868, -1.926876, 1, 0.6705883, 0, 1,
-1.20652, 0.7236158, -2.006414, 1, 0.6784314, 0, 1,
-1.202031, -0.9148039, -1.284766, 1, 0.682353, 0, 1,
-1.193017, 1.103673, -0.1231377, 1, 0.6901961, 0, 1,
-1.189027, 1.549959, -0.3204173, 1, 0.6941177, 0, 1,
-1.183666, -0.06297149, -0.7063746, 1, 0.7019608, 0, 1,
-1.175046, 0.1475818, -1.732767, 1, 0.7098039, 0, 1,
-1.172286, -1.909081, -3.294527, 1, 0.7137255, 0, 1,
-1.167519, -0.03121413, -1.643916, 1, 0.7215686, 0, 1,
-1.161392, -1.00682, -3.785915, 1, 0.7254902, 0, 1,
-1.150426, -0.4718207, -1.81318, 1, 0.7333333, 0, 1,
-1.149017, -0.7628512, -2.012295, 1, 0.7372549, 0, 1,
-1.14777, 0.1894677, -0.5855728, 1, 0.7450981, 0, 1,
-1.147527, 0.148174, -3.245136, 1, 0.7490196, 0, 1,
-1.142322, -0.8691768, -1.544916, 1, 0.7568628, 0, 1,
-1.141075, -0.5780237, -0.46501, 1, 0.7607843, 0, 1,
-1.140375, 0.7645316, 0.254737, 1, 0.7686275, 0, 1,
-1.140065, 0.2271265, -1.929273, 1, 0.772549, 0, 1,
-1.134802, 1.579119, 0.4259495, 1, 0.7803922, 0, 1,
-1.127999, 0.7896535, -1.592436, 1, 0.7843137, 0, 1,
-1.121555, 0.29663, -1.545378, 1, 0.7921569, 0, 1,
-1.115542, -0.08554389, -2.400831, 1, 0.7960784, 0, 1,
-1.110266, -0.01879914, -1.396888, 1, 0.8039216, 0, 1,
-1.109635, -0.379806, -1.528318, 1, 0.8117647, 0, 1,
-1.10715, -0.5219634, -1.981058, 1, 0.8156863, 0, 1,
-1.101453, 0.8460058, -1.066653, 1, 0.8235294, 0, 1,
-1.099846, -1.171098, -2.556553, 1, 0.827451, 0, 1,
-1.096945, 0.8589949, -1.483444, 1, 0.8352941, 0, 1,
-1.095273, -1.059308, -2.342889, 1, 0.8392157, 0, 1,
-1.094925, -0.1060357, -1.750181, 1, 0.8470588, 0, 1,
-1.089727, 0.04820491, -1.705113, 1, 0.8509804, 0, 1,
-1.087679, 0.8935863, -0.9709596, 1, 0.8588235, 0, 1,
-1.085977, 1.598657, -0.8610784, 1, 0.8627451, 0, 1,
-1.072847, 0.4026704, -0.2975133, 1, 0.8705882, 0, 1,
-1.070563, -0.1985135, -1.198731, 1, 0.8745098, 0, 1,
-1.068528, -0.1800932, -2.323332, 1, 0.8823529, 0, 1,
-1.067086, 0.1156163, -1.666572, 1, 0.8862745, 0, 1,
-1.067062, -0.3872202, -1.606537, 1, 0.8941177, 0, 1,
-1.0655, 0.4930309, -1.383519, 1, 0.8980392, 0, 1,
-1.064272, 0.7713483, -1.865168, 1, 0.9058824, 0, 1,
-1.062381, -0.2075697, -0.954934, 1, 0.9137255, 0, 1,
-1.053102, 0.2931094, -1.442524, 1, 0.9176471, 0, 1,
-1.047991, 1.981092, -1.381542, 1, 0.9254902, 0, 1,
-1.042861, 0.6343182, -3.342852, 1, 0.9294118, 0, 1,
-1.041653, -2.020224, -3.918115, 1, 0.9372549, 0, 1,
-1.040053, 0.07189593, 0.2152472, 1, 0.9411765, 0, 1,
-1.030245, -1.105397, -1.178069, 1, 0.9490196, 0, 1,
-1.022072, 0.5680802, -0.4915881, 1, 0.9529412, 0, 1,
-1.012339, -1.252545, -3.310594, 1, 0.9607843, 0, 1,
-1.00881, 1.246463, -1.010562, 1, 0.9647059, 0, 1,
-0.9930007, -0.4709915, -2.028339, 1, 0.972549, 0, 1,
-0.9924043, -0.2880756, -2.865485, 1, 0.9764706, 0, 1,
-0.9921439, -0.181456, -1.84363, 1, 0.9843137, 0, 1,
-0.9915267, 0.3029785, 0.2712135, 1, 0.9882353, 0, 1,
-0.9914956, 2.409908, -0.3891784, 1, 0.9960784, 0, 1,
-0.988691, -0.8900433, -3.964322, 0.9960784, 1, 0, 1,
-0.9811847, -1.250766, -2.168463, 0.9921569, 1, 0, 1,
-0.9756462, 0.4843516, -1.039196, 0.9843137, 1, 0, 1,
-0.9680715, -0.03462308, -1.389156, 0.9803922, 1, 0, 1,
-0.967435, 0.7657167, -1.129242, 0.972549, 1, 0, 1,
-0.9497386, -0.1471697, -2.075698, 0.9686275, 1, 0, 1,
-0.9483184, -0.4639462, -1.192816, 0.9607843, 1, 0, 1,
-0.9357572, -1.758628, -1.455658, 0.9568627, 1, 0, 1,
-0.9335413, -0.3846865, -3.903744, 0.9490196, 1, 0, 1,
-0.928686, -0.9621759, -4.081937, 0.945098, 1, 0, 1,
-0.9248614, -0.723435, -2.938385, 0.9372549, 1, 0, 1,
-0.9243072, -0.1170138, -1.067553, 0.9333333, 1, 0, 1,
-0.9201056, 0.1001351, -0.9404585, 0.9254902, 1, 0, 1,
-0.9076382, 0.6818854, -0.6207152, 0.9215686, 1, 0, 1,
-0.9066834, -0.2047352, -2.139012, 0.9137255, 1, 0, 1,
-0.9056549, -1.239541, -2.871483, 0.9098039, 1, 0, 1,
-0.9022481, -0.7732242, -3.975548, 0.9019608, 1, 0, 1,
-0.9009016, 0.9966184, 0.6262878, 0.8941177, 1, 0, 1,
-0.8966226, -0.8733359, -4.348693, 0.8901961, 1, 0, 1,
-0.8878176, -0.04561022, -2.873039, 0.8823529, 1, 0, 1,
-0.8839259, -0.1114462, -0.9368834, 0.8784314, 1, 0, 1,
-0.8838956, 0.6730112, -0.09583467, 0.8705882, 1, 0, 1,
-0.8824874, 0.3418328, -2.540478, 0.8666667, 1, 0, 1,
-0.8816803, 1.453693, 0.6029187, 0.8588235, 1, 0, 1,
-0.881383, -0.8064455, -0.9656714, 0.854902, 1, 0, 1,
-0.8800334, 0.560624, -0.8352823, 0.8470588, 1, 0, 1,
-0.8701009, 0.02133746, -0.7831788, 0.8431373, 1, 0, 1,
-0.8699677, -0.4439358, -1.011706, 0.8352941, 1, 0, 1,
-0.869768, -0.4856209, -0.1419232, 0.8313726, 1, 0, 1,
-0.8693464, -1.995604, -2.308236, 0.8235294, 1, 0, 1,
-0.8675933, 0.4257716, -1.246898, 0.8196079, 1, 0, 1,
-0.8658836, 0.6224033, -0.5719271, 0.8117647, 1, 0, 1,
-0.865324, -0.3033887, -1.798522, 0.8078431, 1, 0, 1,
-0.8646986, -2.756282, -3.700814, 0.8, 1, 0, 1,
-0.8617859, 0.500428, -0.9722812, 0.7921569, 1, 0, 1,
-0.8532332, 0.3378444, 1.161363, 0.7882353, 1, 0, 1,
-0.8527477, -0.01746069, -1.858718, 0.7803922, 1, 0, 1,
-0.8493341, 1.465917, 1.599937, 0.7764706, 1, 0, 1,
-0.8492444, 0.1021581, -2.621197, 0.7686275, 1, 0, 1,
-0.8448727, 0.4932024, 0.9712669, 0.7647059, 1, 0, 1,
-0.8434805, -0.6611773, -2.044793, 0.7568628, 1, 0, 1,
-0.8397303, -0.6327235, -2.838448, 0.7529412, 1, 0, 1,
-0.8380778, 0.8774428, -1.310029, 0.7450981, 1, 0, 1,
-0.8293792, -0.7514929, -2.340376, 0.7411765, 1, 0, 1,
-0.8257761, 0.5826357, -1.254625, 0.7333333, 1, 0, 1,
-0.8243261, 0.2826359, -0.1825475, 0.7294118, 1, 0, 1,
-0.8184, -0.3616702, -2.979193, 0.7215686, 1, 0, 1,
-0.8164028, 0.8101571, 0.1519676, 0.7176471, 1, 0, 1,
-0.8091204, -1.02483, -3.993315, 0.7098039, 1, 0, 1,
-0.8050131, 0.4645593, -1.094161, 0.7058824, 1, 0, 1,
-0.8046808, 0.0109665, -3.136919, 0.6980392, 1, 0, 1,
-0.8023687, 1.032411, 2.12308, 0.6901961, 1, 0, 1,
-0.7991642, 0.5900146, -1.260806, 0.6862745, 1, 0, 1,
-0.7989367, 1.772517, -1.904012, 0.6784314, 1, 0, 1,
-0.7977485, 1.498516, 0.6390824, 0.6745098, 1, 0, 1,
-0.786323, 0.9637063, 0.8810208, 0.6666667, 1, 0, 1,
-0.7828052, -0.5662569, -3.181553, 0.6627451, 1, 0, 1,
-0.7768514, 1.585038, -1.573965, 0.654902, 1, 0, 1,
-0.7709154, 0.02268478, -1.556516, 0.6509804, 1, 0, 1,
-0.7687452, 1.16985, -0.1807236, 0.6431373, 1, 0, 1,
-0.7656604, -0.5234175, -1.318282, 0.6392157, 1, 0, 1,
-0.7545467, 1.614572, -0.4192268, 0.6313726, 1, 0, 1,
-0.7465842, -0.1602901, -1.494882, 0.627451, 1, 0, 1,
-0.7450213, 0.1792632, -0.6360704, 0.6196079, 1, 0, 1,
-0.7323269, -1.09716, -3.314553, 0.6156863, 1, 0, 1,
-0.7224212, -0.9020593, -3.573026, 0.6078432, 1, 0, 1,
-0.717099, 0.01864902, -0.1070682, 0.6039216, 1, 0, 1,
-0.7162945, 0.1879696, -2.371411, 0.5960785, 1, 0, 1,
-0.7116604, -0.06061623, -1.697249, 0.5882353, 1, 0, 1,
-0.7105175, 0.6851438, 0.4659488, 0.5843138, 1, 0, 1,
-0.6999493, 1.272658, -0.8466465, 0.5764706, 1, 0, 1,
-0.6979499, 0.1800362, -0.7291948, 0.572549, 1, 0, 1,
-0.6952991, -0.2028775, -0.9347239, 0.5647059, 1, 0, 1,
-0.692421, -1.869953, -4.22941, 0.5607843, 1, 0, 1,
-0.6856058, 0.4174227, -0.1241936, 0.5529412, 1, 0, 1,
-0.6838024, 0.5696569, -0.8992544, 0.5490196, 1, 0, 1,
-0.683191, 0.1580867, -2.152819, 0.5411765, 1, 0, 1,
-0.681417, -0.05322595, -2.693866, 0.5372549, 1, 0, 1,
-0.6786893, -1.710407, -1.694958, 0.5294118, 1, 0, 1,
-0.669562, 1.950136, -1.024581, 0.5254902, 1, 0, 1,
-0.6672534, -0.1585612, -2.331091, 0.5176471, 1, 0, 1,
-0.6668254, 0.7180433, -0.216551, 0.5137255, 1, 0, 1,
-0.6654634, -1.433265, -0.1875073, 0.5058824, 1, 0, 1,
-0.6584827, 0.1922368, 1.168845, 0.5019608, 1, 0, 1,
-0.6485686, 1.174797, -2.495692, 0.4941176, 1, 0, 1,
-0.6471836, -1.704509, -2.389266, 0.4862745, 1, 0, 1,
-0.6451578, -0.2928733, -2.351457, 0.4823529, 1, 0, 1,
-0.6435312, 0.4998906, -0.6753205, 0.4745098, 1, 0, 1,
-0.6401449, -0.2432633, -1.898578, 0.4705882, 1, 0, 1,
-0.6346309, 0.359866, 0.1331047, 0.4627451, 1, 0, 1,
-0.6296952, -0.1919096, -1.927895, 0.4588235, 1, 0, 1,
-0.6286808, -0.9475569, -1.176543, 0.4509804, 1, 0, 1,
-0.6240416, 0.5741719, -0.5809499, 0.4470588, 1, 0, 1,
-0.6237759, -0.175737, -2.608694, 0.4392157, 1, 0, 1,
-0.6234668, -0.0227, -0.8472142, 0.4352941, 1, 0, 1,
-0.6181679, 0.4437606, -1.443451, 0.427451, 1, 0, 1,
-0.6120675, -0.3857671, -3.543273, 0.4235294, 1, 0, 1,
-0.6045954, -1.46262, -1.79317, 0.4156863, 1, 0, 1,
-0.6013588, -0.6981517, -0.6908816, 0.4117647, 1, 0, 1,
-0.6005845, -1.593019, -3.86578, 0.4039216, 1, 0, 1,
-0.5983499, -0.3388024, 0.08701999, 0.3960784, 1, 0, 1,
-0.5972007, 0.01286488, -1.653585, 0.3921569, 1, 0, 1,
-0.5959986, 0.1210266, -2.491824, 0.3843137, 1, 0, 1,
-0.5948404, -0.09826626, -2.909236, 0.3803922, 1, 0, 1,
-0.5943596, -0.2807265, -1.078277, 0.372549, 1, 0, 1,
-0.5919504, -1.565302, -2.829397, 0.3686275, 1, 0, 1,
-0.5914617, -0.7637396, -1.744856, 0.3607843, 1, 0, 1,
-0.5910991, -0.6528785, -1.947801, 0.3568628, 1, 0, 1,
-0.5901444, 0.4450963, -0.4805807, 0.3490196, 1, 0, 1,
-0.5866416, -0.5623902, -1.666172, 0.345098, 1, 0, 1,
-0.586243, 2.262704, -1.856846, 0.3372549, 1, 0, 1,
-0.5841953, -0.994479, -1.872064, 0.3333333, 1, 0, 1,
-0.5826887, 0.3757313, -1.173335, 0.3254902, 1, 0, 1,
-0.5765885, -0.3797056, -4.336373, 0.3215686, 1, 0, 1,
-0.5746759, 0.5231052, -0.8828412, 0.3137255, 1, 0, 1,
-0.5647541, -2.381893, -2.407252, 0.3098039, 1, 0, 1,
-0.5640349, 0.5918986, -0.6827781, 0.3019608, 1, 0, 1,
-0.5618376, -0.5410876, -1.599958, 0.2941177, 1, 0, 1,
-0.5608002, 0.09948256, -0.3283139, 0.2901961, 1, 0, 1,
-0.5606749, 1.948049, -1.337168, 0.282353, 1, 0, 1,
-0.558961, -1.709916, -1.535804, 0.2784314, 1, 0, 1,
-0.5570431, -0.8929132, -1.993263, 0.2705882, 1, 0, 1,
-0.5511836, 1.417145, 1.045049, 0.2666667, 1, 0, 1,
-0.542292, -0.2824272, -1.873351, 0.2588235, 1, 0, 1,
-0.5367337, 0.5326003, 0.3679499, 0.254902, 1, 0, 1,
-0.533373, -0.09980594, -0.1768411, 0.2470588, 1, 0, 1,
-0.5315874, -1.097179, -2.895029, 0.2431373, 1, 0, 1,
-0.5302187, 0.8659629, 0.1153432, 0.2352941, 1, 0, 1,
-0.5282251, 0.1948626, -2.272727, 0.2313726, 1, 0, 1,
-0.526004, 0.2742099, -0.6323509, 0.2235294, 1, 0, 1,
-0.5243236, 1.03094, -0.9528911, 0.2196078, 1, 0, 1,
-0.5167111, 0.6990024, -0.9760203, 0.2117647, 1, 0, 1,
-0.5163646, 0.04585684, -2.01631, 0.2078431, 1, 0, 1,
-0.5050644, 1.057006, 0.02177446, 0.2, 1, 0, 1,
-0.5040452, -1.897189, -0.8884206, 0.1921569, 1, 0, 1,
-0.5031765, 0.7839412, -2.085703, 0.1882353, 1, 0, 1,
-0.5021387, 0.7917531, 0.9001299, 0.1803922, 1, 0, 1,
-0.5004066, -2.087643, -3.126645, 0.1764706, 1, 0, 1,
-0.4911373, 0.07200094, -1.489157, 0.1686275, 1, 0, 1,
-0.4854271, -3.296837, -2.944494, 0.1647059, 1, 0, 1,
-0.4853747, 0.3914995, 0.4547726, 0.1568628, 1, 0, 1,
-0.4847158, -2.182709, -2.680919, 0.1529412, 1, 0, 1,
-0.4832425, 0.1693838, -2.927402, 0.145098, 1, 0, 1,
-0.4816357, -1.917806, -1.521406, 0.1411765, 1, 0, 1,
-0.4805482, -0.05080771, -4.78305, 0.1333333, 1, 0, 1,
-0.4744165, -0.3002686, -1.754771, 0.1294118, 1, 0, 1,
-0.4739512, 0.3392377, -0.3578827, 0.1215686, 1, 0, 1,
-0.4638032, 0.03357052, -0.6735481, 0.1176471, 1, 0, 1,
-0.4622599, 0.1704102, -1.50227, 0.1098039, 1, 0, 1,
-0.4595153, -2.253924, -3.911062, 0.1058824, 1, 0, 1,
-0.4585763, 0.06354655, -1.561476, 0.09803922, 1, 0, 1,
-0.447026, 0.34933, -0.4102294, 0.09019608, 1, 0, 1,
-0.4443627, -1.070028, -2.259745, 0.08627451, 1, 0, 1,
-0.4417181, 0.8133779, -0.9832698, 0.07843138, 1, 0, 1,
-0.4380639, -0.7860757, -4.704182, 0.07450981, 1, 0, 1,
-0.4346631, 0.4746157, 0.1831271, 0.06666667, 1, 0, 1,
-0.4257964, -0.4440301, -2.285662, 0.0627451, 1, 0, 1,
-0.419728, -1.096285, -2.270081, 0.05490196, 1, 0, 1,
-0.4189321, 0.4137082, 1.183457, 0.05098039, 1, 0, 1,
-0.4124614, -1.489499, -2.253541, 0.04313726, 1, 0, 1,
-0.4082302, 1.751166, 1.045196, 0.03921569, 1, 0, 1,
-0.4042963, -0.03211337, -0.3770647, 0.03137255, 1, 0, 1,
-0.4027154, -0.06930516, -2.377394, 0.02745098, 1, 0, 1,
-0.3950886, -0.3547192, -2.10819, 0.01960784, 1, 0, 1,
-0.3941036, -0.2580912, -0.1842121, 0.01568628, 1, 0, 1,
-0.3875163, 1.16503, -0.848002, 0.007843138, 1, 0, 1,
-0.3831287, 0.7975369, 0.1563842, 0.003921569, 1, 0, 1,
-0.3809813, 0.8945327, 1.280151, 0, 1, 0.003921569, 1,
-0.3786592, 0.09063434, -1.820001, 0, 1, 0.01176471, 1,
-0.3769512, -0.1827342, -0.7478554, 0, 1, 0.01568628, 1,
-0.3742211, -0.5610593, 0.7997947, 0, 1, 0.02352941, 1,
-0.3722085, -1.37646, -3.189142, 0, 1, 0.02745098, 1,
-0.3708124, 0.8747438, 0.9329762, 0, 1, 0.03529412, 1,
-0.3647942, 1.180713, -1.502876, 0, 1, 0.03921569, 1,
-0.3644013, -1.687511, -3.156469, 0, 1, 0.04705882, 1,
-0.3569585, -0.2032897, -1.838391, 0, 1, 0.05098039, 1,
-0.3520162, -0.3299755, -2.540956, 0, 1, 0.05882353, 1,
-0.3512215, 0.2680739, 1.529415, 0, 1, 0.0627451, 1,
-0.3497281, 0.9169068, -0.7673926, 0, 1, 0.07058824, 1,
-0.3469404, -1.55254, -3.088789, 0, 1, 0.07450981, 1,
-0.3430062, -0.2634506, -2.70023, 0, 1, 0.08235294, 1,
-0.3423765, 1.063537, -1.013605, 0, 1, 0.08627451, 1,
-0.3423283, -0.3375609, -1.823913, 0, 1, 0.09411765, 1,
-0.3400644, -1.988809, -3.854231, 0, 1, 0.1019608, 1,
-0.3395988, 0.5013815, -0.7284279, 0, 1, 0.1058824, 1,
-0.3392423, 0.2655105, -1.164078, 0, 1, 0.1137255, 1,
-0.3378279, 1.658403, 0.1006521, 0, 1, 0.1176471, 1,
-0.3363346, -1.250191, -4.274445, 0, 1, 0.1254902, 1,
-0.3344313, 1.535128, 0.1453021, 0, 1, 0.1294118, 1,
-0.3203065, -0.7239028, -3.136141, 0, 1, 0.1372549, 1,
-0.319264, 0.3059071, -1.054513, 0, 1, 0.1411765, 1,
-0.3185743, -0.878513, -3.328279, 0, 1, 0.1490196, 1,
-0.3100995, -0.2919234, -1.37773, 0, 1, 0.1529412, 1,
-0.3100505, 0.372908, -2.274487, 0, 1, 0.1607843, 1,
-0.3063858, -0.5040175, -0.9859132, 0, 1, 0.1647059, 1,
-0.3061917, 0.0286478, 0.3902508, 0, 1, 0.172549, 1,
-0.3025322, -0.6537728, -5.034654, 0, 1, 0.1764706, 1,
-0.3008761, 0.0418, -2.63085, 0, 1, 0.1843137, 1,
-0.2987813, 0.7862993, -1.388776, 0, 1, 0.1882353, 1,
-0.2955137, 1.243947, -1.959371, 0, 1, 0.1960784, 1,
-0.2947267, 0.5651932, 0.249056, 0, 1, 0.2039216, 1,
-0.294542, 1.061545, -0.2818431, 0, 1, 0.2078431, 1,
-0.2894821, -1.077566, -4.027371, 0, 1, 0.2156863, 1,
-0.2851427, 0.6334112, -0.3238803, 0, 1, 0.2196078, 1,
-0.2841369, 0.4672037, -1.202317, 0, 1, 0.227451, 1,
-0.2832598, 1.51517, -1.511052, 0, 1, 0.2313726, 1,
-0.2753829, 0.5351476, -1.571003, 0, 1, 0.2392157, 1,
-0.268407, -0.8125933, -1.958686, 0, 1, 0.2431373, 1,
-0.2673619, 0.2816103, -1.863769, 0, 1, 0.2509804, 1,
-0.265895, 0.9431645, -1.356853, 0, 1, 0.254902, 1,
-0.2644412, 0.3396816, -1.31492, 0, 1, 0.2627451, 1,
-0.2643807, -1.194883, -2.3159, 0, 1, 0.2666667, 1,
-0.2637, 0.7336586, 0.3619701, 0, 1, 0.2745098, 1,
-0.2618022, 3.01283, -1.063151, 0, 1, 0.2784314, 1,
-0.2533484, -0.01787107, -2.067585, 0, 1, 0.2862745, 1,
-0.2500936, -0.8229817, -4.417094, 0, 1, 0.2901961, 1,
-0.2487463, -0.1834969, -0.7998558, 0, 1, 0.2980392, 1,
-0.2486821, -0.5888227, -2.848232, 0, 1, 0.3058824, 1,
-0.2471137, -0.3596279, -3.350961, 0, 1, 0.3098039, 1,
-0.2416243, 0.1192471, -0.6809462, 0, 1, 0.3176471, 1,
-0.2415019, 1.779979, 0.1020819, 0, 1, 0.3215686, 1,
-0.2395695, 0.494377, -0.6791242, 0, 1, 0.3294118, 1,
-0.23722, 1.445523, -0.2639692, 0, 1, 0.3333333, 1,
-0.236791, -2.171263, -4.082639, 0, 1, 0.3411765, 1,
-0.235979, 0.05305308, -2.535398, 0, 1, 0.345098, 1,
-0.2339359, -0.3527695, -1.533949, 0, 1, 0.3529412, 1,
-0.2277996, -0.5622483, -2.771731, 0, 1, 0.3568628, 1,
-0.2268488, -1.314296, -3.042841, 0, 1, 0.3647059, 1,
-0.2267209, 0.60721, -0.3826289, 0, 1, 0.3686275, 1,
-0.2246535, 0.1794161, -1.196524, 0, 1, 0.3764706, 1,
-0.2196165, -1.859981, -1.95901, 0, 1, 0.3803922, 1,
-0.2153075, 1.821096, 0.3272353, 0, 1, 0.3882353, 1,
-0.2139647, -0.5732274, -2.125169, 0, 1, 0.3921569, 1,
-0.211635, -0.5833996, -2.807329, 0, 1, 0.4, 1,
-0.2070187, -0.6366425, -4.686301, 0, 1, 0.4078431, 1,
-0.2023593, 2.024155, -0.6118491, 0, 1, 0.4117647, 1,
-0.200464, 0.7509526, 0.3837488, 0, 1, 0.4196078, 1,
-0.1976787, -0.5025526, -2.901482, 0, 1, 0.4235294, 1,
-0.193404, -0.5384174, -2.763691, 0, 1, 0.4313726, 1,
-0.1925387, 0.9869714, 0.4258048, 0, 1, 0.4352941, 1,
-0.1918023, 0.3867551, -2.439827, 0, 1, 0.4431373, 1,
-0.1844102, -1.673286, -3.836448, 0, 1, 0.4470588, 1,
-0.1842377, -0.6612847, -1.789265, 0, 1, 0.454902, 1,
-0.1839724, -0.3206877, -2.594673, 0, 1, 0.4588235, 1,
-0.1759782, -0.222916, -1.932283, 0, 1, 0.4666667, 1,
-0.1746121, 1.00494, 0.2576477, 0, 1, 0.4705882, 1,
-0.1687013, -0.1617175, -4.334261, 0, 1, 0.4784314, 1,
-0.1670344, -1.07089, -1.850275, 0, 1, 0.4823529, 1,
-0.16511, 0.2704509, 1.142884, 0, 1, 0.4901961, 1,
-0.1640444, -0.4675507, -2.648232, 0, 1, 0.4941176, 1,
-0.1639918, -0.6328922, -2.850971, 0, 1, 0.5019608, 1,
-0.1623868, -0.1297803, -2.500712, 0, 1, 0.509804, 1,
-0.1614987, 2.444835, -0.08468652, 0, 1, 0.5137255, 1,
-0.1608997, 0.9096979, -0.9030033, 0, 1, 0.5215687, 1,
-0.1543833, 0.5960603, -0.8948108, 0, 1, 0.5254902, 1,
-0.1542464, 0.8299197, -1.397807, 0, 1, 0.5333334, 1,
-0.1525165, 1.288914, -0.06880189, 0, 1, 0.5372549, 1,
-0.1519955, 0.4187593, 0.7991854, 0, 1, 0.5450981, 1,
-0.1512245, -1.185599, -4.384032, 0, 1, 0.5490196, 1,
-0.1505961, 1.546916, 0.2556669, 0, 1, 0.5568628, 1,
-0.1499618, -1.049555, -3.445772, 0, 1, 0.5607843, 1,
-0.1480869, -0.2316708, -4.47443, 0, 1, 0.5686275, 1,
-0.1473498, -0.3100316, -2.936996, 0, 1, 0.572549, 1,
-0.1463881, 0.02464046, -0.9970731, 0, 1, 0.5803922, 1,
-0.1410984, 0.242411, -0.770844, 0, 1, 0.5843138, 1,
-0.1407448, 0.3767576, -0.1896408, 0, 1, 0.5921569, 1,
-0.1365065, -0.6010348, -2.724157, 0, 1, 0.5960785, 1,
-0.1342671, -0.693583, -2.552471, 0, 1, 0.6039216, 1,
-0.1340713, -0.4324156, -3.070317, 0, 1, 0.6117647, 1,
-0.1332902, 2.096406, -1.921924, 0, 1, 0.6156863, 1,
-0.1331721, -0.05018701, -2.427073, 0, 1, 0.6235294, 1,
-0.1330779, 2.933158, -0.9335877, 0, 1, 0.627451, 1,
-0.1278386, -0.4556244, -3.90917, 0, 1, 0.6352941, 1,
-0.1271428, -0.5354421, -4.56632, 0, 1, 0.6392157, 1,
-0.1269081, -0.5763248, -2.860671, 0, 1, 0.6470588, 1,
-0.1246912, -0.004171003, 0.7546303, 0, 1, 0.6509804, 1,
-0.1230321, -2.047394, -3.775672, 0, 1, 0.6588235, 1,
-0.1209648, -0.4912875, -3.901552, 0, 1, 0.6627451, 1,
-0.1197633, 0.3062364, 1.164952, 0, 1, 0.6705883, 1,
-0.113048, -3.495901, -2.954676, 0, 1, 0.6745098, 1,
-0.110207, -0.1963625, -1.483796, 0, 1, 0.682353, 1,
-0.1079789, -0.2011386, -3.616909, 0, 1, 0.6862745, 1,
-0.1061071, -1.294871, -4.386904, 0, 1, 0.6941177, 1,
-0.1032815, 0.4328617, 0.3424555, 0, 1, 0.7019608, 1,
-0.0958454, 1.266389, 0.08045104, 0, 1, 0.7058824, 1,
-0.0904353, 2.521803, 0.06924109, 0, 1, 0.7137255, 1,
-0.08410475, -1.115005, -4.028628, 0, 1, 0.7176471, 1,
-0.08060357, 0.5419807, 0.5909758, 0, 1, 0.7254902, 1,
-0.07986142, -2.360855, -2.571586, 0, 1, 0.7294118, 1,
-0.07939021, -1.176503, -1.4077, 0, 1, 0.7372549, 1,
-0.07525127, -0.08451805, -1.682179, 0, 1, 0.7411765, 1,
-0.07322932, -1.10382, -2.745843, 0, 1, 0.7490196, 1,
-0.06864603, 0.7186896, 0.5766592, 0, 1, 0.7529412, 1,
-0.0613021, 0.01906734, -1.401795, 0, 1, 0.7607843, 1,
-0.06092171, -0.8067264, -2.16395, 0, 1, 0.7647059, 1,
-0.06005766, 0.255437, 0.7105511, 0, 1, 0.772549, 1,
-0.05966927, 0.6429451, 1.079683, 0, 1, 0.7764706, 1,
-0.05955721, 0.5474918, 1.553805, 0, 1, 0.7843137, 1,
-0.05930623, -0.3592583, -3.695068, 0, 1, 0.7882353, 1,
-0.05910847, 1.73974, 0.7432581, 0, 1, 0.7960784, 1,
-0.05792249, -0.7626213, -3.573064, 0, 1, 0.8039216, 1,
-0.04633032, 0.6020381, -0.6905768, 0, 1, 0.8078431, 1,
-0.04133488, 1.583096, 1.853875, 0, 1, 0.8156863, 1,
-0.03584787, 0.004785091, -0.03883301, 0, 1, 0.8196079, 1,
-0.03335029, 0.4567591, 0.226468, 0, 1, 0.827451, 1,
-0.03267492, 0.8926117, 1.296044, 0, 1, 0.8313726, 1,
-0.03025545, 0.8269353, 1.007144, 0, 1, 0.8392157, 1,
-0.02894804, 0.6699364, 0.6166303, 0, 1, 0.8431373, 1,
-0.01619038, 1.686723, -0.003342634, 0, 1, 0.8509804, 1,
-0.01549466, 1.674174, -0.7994301, 0, 1, 0.854902, 1,
-0.01433432, 0.09593777, -1.051302, 0, 1, 0.8627451, 1,
-0.01416391, 0.213351, 0.6207985, 0, 1, 0.8666667, 1,
-0.01169757, 0.8922142, -0.1632315, 0, 1, 0.8745098, 1,
-0.004024031, 0.1885318, 1.704616, 0, 1, 0.8784314, 1,
-0.003626695, 1.188474, -1.425636, 0, 1, 0.8862745, 1,
-0.00321453, -0.8906118, -2.957386, 0, 1, 0.8901961, 1,
-0.00292252, 1.518936, -0.1296856, 0, 1, 0.8980392, 1,
-0.002806517, -0.3802747, -4.599613, 0, 1, 0.9058824, 1,
-0.002107028, 0.03724321, -1.245856, 0, 1, 0.9098039, 1,
-0.001593799, 0.1842877, 1.924704, 0, 1, 0.9176471, 1,
0.0005081227, 0.1299258, -0.005656427, 0, 1, 0.9215686, 1,
0.0007995485, -2.185406, 3.245412, 0, 1, 0.9294118, 1,
0.002078384, 2.241492, 0.2654233, 0, 1, 0.9333333, 1,
0.003070893, 0.3202586, 0.8870484, 0, 1, 0.9411765, 1,
0.003789494, -2.001618, 2.960155, 0, 1, 0.945098, 1,
0.006748429, 2.074792, 0.1482622, 0, 1, 0.9529412, 1,
0.00676584, -0.1187857, 2.683083, 0, 1, 0.9568627, 1,
0.007361059, -0.1699554, 3.909892, 0, 1, 0.9647059, 1,
0.009168281, -0.6656729, 2.355157, 0, 1, 0.9686275, 1,
0.01173283, 1.820942, 0.379922, 0, 1, 0.9764706, 1,
0.01178249, 0.1309334, -2.719061, 0, 1, 0.9803922, 1,
0.01237123, 1.350309, 1.133706, 0, 1, 0.9882353, 1,
0.01534234, -1.080233, 1.929331, 0, 1, 0.9921569, 1,
0.01661391, -2.623808, 4.128144, 0, 1, 1, 1,
0.01919131, 0.06423201, -0.5738913, 0, 0.9921569, 1, 1,
0.02201921, 0.3571193, -1.263662, 0, 0.9882353, 1, 1,
0.02208746, 0.5702525, -1.142427, 0, 0.9803922, 1, 1,
0.02986391, -0.2780124, 1.375704, 0, 0.9764706, 1, 1,
0.0305993, -1.985159, 4.400267, 0, 0.9686275, 1, 1,
0.03555538, 0.5724623, 0.8889486, 0, 0.9647059, 1, 1,
0.03616959, 0.1361747, 1.237805, 0, 0.9568627, 1, 1,
0.03628629, -0.2652186, 3.744538, 0, 0.9529412, 1, 1,
0.04123924, 0.2752125, -1.891716, 0, 0.945098, 1, 1,
0.04421367, 0.451187, 0.5341352, 0, 0.9411765, 1, 1,
0.04654998, -0.6196942, 2.814322, 0, 0.9333333, 1, 1,
0.05209761, 0.6398208, 0.4178391, 0, 0.9294118, 1, 1,
0.05557177, -1.0328, 1.804857, 0, 0.9215686, 1, 1,
0.0582143, 0.7075289, 0.7861732, 0, 0.9176471, 1, 1,
0.05865917, -1.420902, 1.549153, 0, 0.9098039, 1, 1,
0.06181823, -0.6170394, 3.158004, 0, 0.9058824, 1, 1,
0.06650695, 2.49158, 0.2472461, 0, 0.8980392, 1, 1,
0.06807137, -0.2279483, 4.591732, 0, 0.8901961, 1, 1,
0.06808908, 0.2799757, 0.5222859, 0, 0.8862745, 1, 1,
0.06832135, 1.074423, 0.8435747, 0, 0.8784314, 1, 1,
0.07187229, -0.4938225, 4.018461, 0, 0.8745098, 1, 1,
0.07378706, 0.05592786, -0.1412297, 0, 0.8666667, 1, 1,
0.07420558, -1.267545, 2.008725, 0, 0.8627451, 1, 1,
0.07481153, -0.1588765, 3.720354, 0, 0.854902, 1, 1,
0.07797885, -0.8572334, 2.542782, 0, 0.8509804, 1, 1,
0.07957572, 0.09463155, 0.4826089, 0, 0.8431373, 1, 1,
0.08536793, 0.984059, 1.56579, 0, 0.8392157, 1, 1,
0.08859999, 1.411967, -2.446705, 0, 0.8313726, 1, 1,
0.09455584, 1.922049, -0.8683173, 0, 0.827451, 1, 1,
0.1012524, 0.1523469, 0.9200854, 0, 0.8196079, 1, 1,
0.1025019, -0.1524695, 2.710602, 0, 0.8156863, 1, 1,
0.109803, 0.05952529, -0.2659352, 0, 0.8078431, 1, 1,
0.1123354, -2.618277, 3.295901, 0, 0.8039216, 1, 1,
0.1173101, 0.3811582, 0.3903492, 0, 0.7960784, 1, 1,
0.1184654, 0.2062343, 2.410365, 0, 0.7882353, 1, 1,
0.1186715, -0.3320626, 1.970741, 0, 0.7843137, 1, 1,
0.1282066, -0.31185, 2.641024, 0, 0.7764706, 1, 1,
0.1343944, -3.305328, 4.533565, 0, 0.772549, 1, 1,
0.137663, -1.19129, 3.579602, 0, 0.7647059, 1, 1,
0.1401318, 2.654005, 2.374995, 0, 0.7607843, 1, 1,
0.1435636, -1.725745, 1.637124, 0, 0.7529412, 1, 1,
0.1449203, 0.9154515, -0.1722595, 0, 0.7490196, 1, 1,
0.1515289, 0.942075, -0.3050842, 0, 0.7411765, 1, 1,
0.1523522, -0.754945, 3.723935, 0, 0.7372549, 1, 1,
0.1536169, -0.8477037, 3.529021, 0, 0.7294118, 1, 1,
0.1557989, 0.2654194, 0.8272035, 0, 0.7254902, 1, 1,
0.1559577, -0.3760332, 3.337323, 0, 0.7176471, 1, 1,
0.1576086, 1.373252, -1.168776, 0, 0.7137255, 1, 1,
0.1577466, -0.3036799, 2.141476, 0, 0.7058824, 1, 1,
0.1603725, -0.9919813, 3.325601, 0, 0.6980392, 1, 1,
0.1660259, 0.9232375, 0.6674673, 0, 0.6941177, 1, 1,
0.1674984, 0.04724671, 1.654064, 0, 0.6862745, 1, 1,
0.1731572, -1.454294, 2.894136, 0, 0.682353, 1, 1,
0.1824204, -0.3106036, 2.26819, 0, 0.6745098, 1, 1,
0.1842132, 0.9652618, -0.5503408, 0, 0.6705883, 1, 1,
0.1861459, -0.7748447, 2.900206, 0, 0.6627451, 1, 1,
0.1953127, -0.2786801, 3.40416, 0, 0.6588235, 1, 1,
0.1976428, 0.3061282, -1.733701, 0, 0.6509804, 1, 1,
0.1982616, -2.029436, 2.118496, 0, 0.6470588, 1, 1,
0.2016776, 0.5491574, 1.095795, 0, 0.6392157, 1, 1,
0.205887, -0.8079157, 2.363731, 0, 0.6352941, 1, 1,
0.2060004, 1.902895, -0.9399805, 0, 0.627451, 1, 1,
0.2073921, 0.02240948, 4.037248, 0, 0.6235294, 1, 1,
0.2082795, -0.1134469, 2.894211, 0, 0.6156863, 1, 1,
0.2092653, 1.328516, 1.391748, 0, 0.6117647, 1, 1,
0.2164137, 1.39672, -0.07412484, 0, 0.6039216, 1, 1,
0.2209653, 0.5879336, -0.5859382, 0, 0.5960785, 1, 1,
0.2217018, -1.284792, 3.668014, 0, 0.5921569, 1, 1,
0.2299538, -1.484589, 0.763187, 0, 0.5843138, 1, 1,
0.2305274, -0.7563127, 3.395604, 0, 0.5803922, 1, 1,
0.2305582, 1.469173, -0.8721989, 0, 0.572549, 1, 1,
0.2319328, 1.414558, -0.9028509, 0, 0.5686275, 1, 1,
0.2324662, -0.7285538, 3.439167, 0, 0.5607843, 1, 1,
0.233568, -0.4646784, 3.76788, 0, 0.5568628, 1, 1,
0.2344423, 0.2097512, 1.663296, 0, 0.5490196, 1, 1,
0.2348406, -2.782346, 3.547787, 0, 0.5450981, 1, 1,
0.2350255, -0.2946854, 2.764775, 0, 0.5372549, 1, 1,
0.2350609, -0.7646077, 3.266743, 0, 0.5333334, 1, 1,
0.2361517, 0.1909536, 0.8432839, 0, 0.5254902, 1, 1,
0.2373352, -1.086658, 4.636181, 0, 0.5215687, 1, 1,
0.2387597, 0.9012458, 0.639519, 0, 0.5137255, 1, 1,
0.2389686, 0.3328571, -0.02524021, 0, 0.509804, 1, 1,
0.2400488, 0.8864605, 1.442912, 0, 0.5019608, 1, 1,
0.2433193, -0.8636571, 4.061379, 0, 0.4941176, 1, 1,
0.2470791, 0.01972716, 2.751896, 0, 0.4901961, 1, 1,
0.2492178, -0.2606455, 2.949581, 0, 0.4823529, 1, 1,
0.2538163, 1.885477, 2.053252, 0, 0.4784314, 1, 1,
0.2561584, -0.3191604, 1.394151, 0, 0.4705882, 1, 1,
0.2574763, 0.5423784, 0.7850328, 0, 0.4666667, 1, 1,
0.266412, 1.86196, -0.1429455, 0, 0.4588235, 1, 1,
0.2716815, -1.927487, 2.330744, 0, 0.454902, 1, 1,
0.2793269, 1.748135, 0.6195636, 0, 0.4470588, 1, 1,
0.2855047, 0.3965632, 2.036161, 0, 0.4431373, 1, 1,
0.2865834, 0.8824396, -0.8548585, 0, 0.4352941, 1, 1,
0.2871388, -2.11038, 1.376288, 0, 0.4313726, 1, 1,
0.2905363, -1.139363, 2.22192, 0, 0.4235294, 1, 1,
0.2912239, -0.6123818, 2.9725, 0, 0.4196078, 1, 1,
0.2944851, -0.3536126, 0.5554574, 0, 0.4117647, 1, 1,
0.2981272, -0.3295422, 2.041302, 0, 0.4078431, 1, 1,
0.2981552, -0.3921063, 2.330064, 0, 0.4, 1, 1,
0.3010304, -0.5696091, 2.470774, 0, 0.3921569, 1, 1,
0.3023075, 0.3782545, 1.54944, 0, 0.3882353, 1, 1,
0.3041251, -0.178283, 0.7227721, 0, 0.3803922, 1, 1,
0.3081951, 0.2112219, 2.90374, 0, 0.3764706, 1, 1,
0.3124253, -0.1337885, 0.2224958, 0, 0.3686275, 1, 1,
0.3257571, 0.3075293, -0.2915983, 0, 0.3647059, 1, 1,
0.3283375, -0.7217522, 2.52377, 0, 0.3568628, 1, 1,
0.3285143, 0.3926606, 0.5537434, 0, 0.3529412, 1, 1,
0.3295915, 1.028331, 1.620614, 0, 0.345098, 1, 1,
0.3323242, 0.2422276, 1.596262, 0, 0.3411765, 1, 1,
0.3355154, 0.822747, 1.756296, 0, 0.3333333, 1, 1,
0.3359518, -0.560059, 2.31262, 0, 0.3294118, 1, 1,
0.3377029, 0.3969097, -0.2083246, 0, 0.3215686, 1, 1,
0.3385564, -1.101714, 2.661457, 0, 0.3176471, 1, 1,
0.3411816, -0.3482202, 1.628324, 0, 0.3098039, 1, 1,
0.3450815, -0.9577297, 1.832461, 0, 0.3058824, 1, 1,
0.3519688, -2.292604, 2.476951, 0, 0.2980392, 1, 1,
0.3544246, -1.191769, 4.385304, 0, 0.2901961, 1, 1,
0.3574393, 0.639153, -1.254437, 0, 0.2862745, 1, 1,
0.3604038, -1.030314, 3.941125, 0, 0.2784314, 1, 1,
0.3621923, -1.003713, 2.302948, 0, 0.2745098, 1, 1,
0.3647891, -0.3042063, 1.854749, 0, 0.2666667, 1, 1,
0.3671117, 1.068341, 0.03893937, 0, 0.2627451, 1, 1,
0.3700571, -0.701458, 2.48093, 0, 0.254902, 1, 1,
0.3733822, 0.471525, 0.355648, 0, 0.2509804, 1, 1,
0.3791538, 1.502826, 1.574084, 0, 0.2431373, 1, 1,
0.383334, 0.38448, 0.3218211, 0, 0.2392157, 1, 1,
0.3851181, -0.4818694, 2.270573, 0, 0.2313726, 1, 1,
0.3889784, -1.094063, 3.057152, 0, 0.227451, 1, 1,
0.3921365, 1.590239, 0.4616857, 0, 0.2196078, 1, 1,
0.3925794, -1.69864, 3.957081, 0, 0.2156863, 1, 1,
0.3935238, 1.554584, 0.6488767, 0, 0.2078431, 1, 1,
0.3997413, 0.360074, -0.2519478, 0, 0.2039216, 1, 1,
0.4025535, -1.2134, 2.894394, 0, 0.1960784, 1, 1,
0.4092761, 0.4096519, 2.116479, 0, 0.1882353, 1, 1,
0.4114735, 0.3163572, -0.07790635, 0, 0.1843137, 1, 1,
0.4159627, -0.1767124, 2.125174, 0, 0.1764706, 1, 1,
0.4179222, -0.8558394, 3.56776, 0, 0.172549, 1, 1,
0.4200331, -0.8502333, 2.741391, 0, 0.1647059, 1, 1,
0.4208564, -0.5390108, 2.523639, 0, 0.1607843, 1, 1,
0.4229723, 0.7810482, 0.7407028, 0, 0.1529412, 1, 1,
0.4242002, 0.3509669, 1.002469, 0, 0.1490196, 1, 1,
0.4271264, 0.7139467, 0.1873093, 0, 0.1411765, 1, 1,
0.4283177, 0.6219067, 0.6345926, 0, 0.1372549, 1, 1,
0.4286699, -1.465796, 3.211095, 0, 0.1294118, 1, 1,
0.4299313, -0.5766612, 1.430977, 0, 0.1254902, 1, 1,
0.4315394, 0.9338689, -0.1564414, 0, 0.1176471, 1, 1,
0.4320288, -0.5248304, 2.995365, 0, 0.1137255, 1, 1,
0.4365227, 0.7525291, 0.4883848, 0, 0.1058824, 1, 1,
0.4379789, 1.101615, 0.6773401, 0, 0.09803922, 1, 1,
0.4380952, 1.251759, -0.551003, 0, 0.09411765, 1, 1,
0.4387443, -0.7797301, 2.455887, 0, 0.08627451, 1, 1,
0.4415033, -2.454328, 1.933973, 0, 0.08235294, 1, 1,
0.441919, -0.09286267, 2.529131, 0, 0.07450981, 1, 1,
0.4432065, 2.159586, 2.573423, 0, 0.07058824, 1, 1,
0.4456885, -0.3640109, 1.688048, 0, 0.0627451, 1, 1,
0.4477497, -0.4875613, 3.088499, 0, 0.05882353, 1, 1,
0.4481587, -0.08776852, 1.570777, 0, 0.05098039, 1, 1,
0.4514199, 0.5800736, 0.8802083, 0, 0.04705882, 1, 1,
0.4514526, 0.5822431, 2.162559, 0, 0.03921569, 1, 1,
0.4523401, -0.6544635, 2.350342, 0, 0.03529412, 1, 1,
0.4641341, -0.8703303, 2.134079, 0, 0.02745098, 1, 1,
0.4668803, -0.6389328, 2.11158, 0, 0.02352941, 1, 1,
0.4709538, -0.7982025, 3.530221, 0, 0.01568628, 1, 1,
0.4766416, 0.09280095, 0.6835312, 0, 0.01176471, 1, 1,
0.4770872, -2.545315, 3.766004, 0, 0.003921569, 1, 1,
0.4837655, 0.2355233, 0.4823973, 0.003921569, 0, 1, 1,
0.4846654, 1.591814, 0.009053488, 0.007843138, 0, 1, 1,
0.4847337, 0.8843502, 1.083532, 0.01568628, 0, 1, 1,
0.4901439, 1.137772, 0.0266476, 0.01960784, 0, 1, 1,
0.4954792, 1.169273, 2.218167, 0.02745098, 0, 1, 1,
0.4969055, -0.4142973, 3.477642, 0.03137255, 0, 1, 1,
0.5018367, 1.914158, 0.3295981, 0.03921569, 0, 1, 1,
0.5026313, -0.3681115, 2.608896, 0.04313726, 0, 1, 1,
0.5032498, -0.4553409, 2.392274, 0.05098039, 0, 1, 1,
0.5126919, -0.32931, 4.034705, 0.05490196, 0, 1, 1,
0.5144408, 1.405418, -0.3198862, 0.0627451, 0, 1, 1,
0.5154925, -1.176103, 3.606062, 0.06666667, 0, 1, 1,
0.5180328, -0.1040605, 1.656301, 0.07450981, 0, 1, 1,
0.5180402, 0.9948329, -1.295855, 0.07843138, 0, 1, 1,
0.5182438, -0.5290512, 1.562133, 0.08627451, 0, 1, 1,
0.5224787, -0.9330211, 3.733292, 0.09019608, 0, 1, 1,
0.5225669, -0.03455465, 1.265529, 0.09803922, 0, 1, 1,
0.5233883, -0.9052247, 3.356208, 0.1058824, 0, 1, 1,
0.5280834, -0.9881093, 2.990952, 0.1098039, 0, 1, 1,
0.5294906, -0.3782713, 2.511598, 0.1176471, 0, 1, 1,
0.5344252, 1.281352, 0.8362804, 0.1215686, 0, 1, 1,
0.5345923, 0.5145735, 0.9018976, 0.1294118, 0, 1, 1,
0.5368026, -0.2984045, -0.1486601, 0.1333333, 0, 1, 1,
0.5382936, 2.259956, 1.927698, 0.1411765, 0, 1, 1,
0.5397676, -0.7998921, 2.301279, 0.145098, 0, 1, 1,
0.5400771, 1.066949, 0.263583, 0.1529412, 0, 1, 1,
0.5431048, 0.09927677, 2.404725, 0.1568628, 0, 1, 1,
0.5439949, 0.1868556, 1.534818, 0.1647059, 0, 1, 1,
0.5442627, -0.2091787, 0.9743285, 0.1686275, 0, 1, 1,
0.5472094, 0.1452125, 0.5429187, 0.1764706, 0, 1, 1,
0.5477622, 1.369112, -0.7515288, 0.1803922, 0, 1, 1,
0.5483407, -0.1089019, 1.446233, 0.1882353, 0, 1, 1,
0.5573792, -1.439985, 2.564974, 0.1921569, 0, 1, 1,
0.5608023, -0.6669275, 2.438398, 0.2, 0, 1, 1,
0.5635425, 1.064715, 0.4546395, 0.2078431, 0, 1, 1,
0.564908, -1.715663, 3.626721, 0.2117647, 0, 1, 1,
0.5688897, 0.8202676, -0.7017901, 0.2196078, 0, 1, 1,
0.5692437, 0.4159216, 0.02096753, 0.2235294, 0, 1, 1,
0.5726999, 1.494584, 1.006903, 0.2313726, 0, 1, 1,
0.5738042, -1.048901, 1.029383, 0.2352941, 0, 1, 1,
0.5741796, -0.5988362, 2.404723, 0.2431373, 0, 1, 1,
0.5775009, -0.5963579, 3.295541, 0.2470588, 0, 1, 1,
0.5781448, -1.448828, 2.412124, 0.254902, 0, 1, 1,
0.5797458, 1.956001, 0.7811916, 0.2588235, 0, 1, 1,
0.5806226, 1.646515, 1.762113, 0.2666667, 0, 1, 1,
0.5824483, 2.301174, -1.188718, 0.2705882, 0, 1, 1,
0.5828365, -0.01598997, 2.224462, 0.2784314, 0, 1, 1,
0.5829008, -0.0676434, 2.296992, 0.282353, 0, 1, 1,
0.6147597, -0.377202, 1.357049, 0.2901961, 0, 1, 1,
0.6151394, 0.618643, 0.526682, 0.2941177, 0, 1, 1,
0.6219949, 0.07815696, 2.393762, 0.3019608, 0, 1, 1,
0.6283619, 0.6419044, 1.967826, 0.3098039, 0, 1, 1,
0.6296538, 0.5380015, 0.9983534, 0.3137255, 0, 1, 1,
0.6368535, -0.5582942, 3.49805, 0.3215686, 0, 1, 1,
0.6379119, -0.4414133, 3.168793, 0.3254902, 0, 1, 1,
0.6382266, 0.3406272, 0.857699, 0.3333333, 0, 1, 1,
0.6470619, -0.4714726, 2.761475, 0.3372549, 0, 1, 1,
0.6479119, -1.076967, 2.391988, 0.345098, 0, 1, 1,
0.6509997, 0.01220375, 2.509615, 0.3490196, 0, 1, 1,
0.657141, 0.1417453, 2.487459, 0.3568628, 0, 1, 1,
0.6571844, -0.780276, 1.548728, 0.3607843, 0, 1, 1,
0.6592352, 0.5638453, 1.137823, 0.3686275, 0, 1, 1,
0.6592613, -1.05779, 2.881018, 0.372549, 0, 1, 1,
0.663482, -1.179426, 3.019586, 0.3803922, 0, 1, 1,
0.6660907, 1.055326, 0.7039993, 0.3843137, 0, 1, 1,
0.6691596, 0.3184723, 2.140229, 0.3921569, 0, 1, 1,
0.673839, 0.2184971, -0.3933065, 0.3960784, 0, 1, 1,
0.6815741, 2.039905, 1.585654, 0.4039216, 0, 1, 1,
0.6825839, -0.3947378, 0.630563, 0.4117647, 0, 1, 1,
0.6839346, -0.4781713, 2.797055, 0.4156863, 0, 1, 1,
0.6857742, 0.2960177, 1.207927, 0.4235294, 0, 1, 1,
0.6859851, 0.7755434, -0.01507613, 0.427451, 0, 1, 1,
0.6875949, -1.241318, 1.953055, 0.4352941, 0, 1, 1,
0.6906801, 1.521814, 1.98365, 0.4392157, 0, 1, 1,
0.6945722, -1.034494, 2.470063, 0.4470588, 0, 1, 1,
0.7006635, -0.6004871, 3.149145, 0.4509804, 0, 1, 1,
0.7054505, 1.076011, 0.1389323, 0.4588235, 0, 1, 1,
0.7063331, -0.2627503, 2.998622, 0.4627451, 0, 1, 1,
0.707035, 0.7100215, 1.719393, 0.4705882, 0, 1, 1,
0.7232512, -0.06340471, 2.464478, 0.4745098, 0, 1, 1,
0.7245275, 1.142188, -0.5806749, 0.4823529, 0, 1, 1,
0.7306384, 0.712705, 0.8869114, 0.4862745, 0, 1, 1,
0.7332817, -0.085535, 1.017524, 0.4941176, 0, 1, 1,
0.7374967, -0.3577388, 2.081149, 0.5019608, 0, 1, 1,
0.7397037, -1.532522, 2.123658, 0.5058824, 0, 1, 1,
0.7490384, -0.6941831, 2.038679, 0.5137255, 0, 1, 1,
0.7501991, 0.9043685, -1.003381, 0.5176471, 0, 1, 1,
0.750601, -0.4989251, 1.643263, 0.5254902, 0, 1, 1,
0.7514665, -0.08146212, 0.8442677, 0.5294118, 0, 1, 1,
0.7518026, 0.1637991, 0.7075328, 0.5372549, 0, 1, 1,
0.7558216, -1.244596, 1.628151, 0.5411765, 0, 1, 1,
0.7569047, -0.7714434, 2.420817, 0.5490196, 0, 1, 1,
0.7596723, -1.429163, 1.828791, 0.5529412, 0, 1, 1,
0.7642017, 1.718129, -0.7577553, 0.5607843, 0, 1, 1,
0.7686945, 1.153264, 0.04327961, 0.5647059, 0, 1, 1,
0.7811279, -0.1949397, 1.319522, 0.572549, 0, 1, 1,
0.7813112, -1.566047, 2.1298, 0.5764706, 0, 1, 1,
0.7828297, 0.7020938, 0.5342892, 0.5843138, 0, 1, 1,
0.7907163, 0.1241779, 0.8993294, 0.5882353, 0, 1, 1,
0.7922692, 1.635687, -0.2227119, 0.5960785, 0, 1, 1,
0.7941706, 1.130246, -1.029819, 0.6039216, 0, 1, 1,
0.7951251, -1.437297, 1.815757, 0.6078432, 0, 1, 1,
0.797895, -0.09731103, 0.6830854, 0.6156863, 0, 1, 1,
0.8005789, 1.37541, 0.8584977, 0.6196079, 0, 1, 1,
0.8078025, 0.2592201, -0.2993601, 0.627451, 0, 1, 1,
0.8120407, 0.4381362, -0.2403501, 0.6313726, 0, 1, 1,
0.8223242, -1.184599, 2.067693, 0.6392157, 0, 1, 1,
0.8242068, -0.9229017, 3.957571, 0.6431373, 0, 1, 1,
0.8276827, -0.2406341, 2.311389, 0.6509804, 0, 1, 1,
0.8277497, 0.2984843, 1.945493, 0.654902, 0, 1, 1,
0.8313208, -0.7466134, 3.203111, 0.6627451, 0, 1, 1,
0.837137, 0.06529386, 1.47591, 0.6666667, 0, 1, 1,
0.8426626, -0.273231, 1.368417, 0.6745098, 0, 1, 1,
0.8428423, 0.4702875, 0.4713639, 0.6784314, 0, 1, 1,
0.8470566, -1.039541, 1.752563, 0.6862745, 0, 1, 1,
0.8480759, -1.235687, 0.8796861, 0.6901961, 0, 1, 1,
0.8510872, 0.4244545, 2.701273, 0.6980392, 0, 1, 1,
0.8514704, -1.046284, 3.582327, 0.7058824, 0, 1, 1,
0.8563182, 0.134289, 1.989017, 0.7098039, 0, 1, 1,
0.8694372, 0.009732179, 0.9884465, 0.7176471, 0, 1, 1,
0.8721085, 1.336302, -0.1079576, 0.7215686, 0, 1, 1,
0.8738264, 0.3811697, 1.670033, 0.7294118, 0, 1, 1,
0.8741214, -0.3023906, 0.9633518, 0.7333333, 0, 1, 1,
0.877455, -1.24478, 2.223119, 0.7411765, 0, 1, 1,
0.8797857, -1.37924, 4.241065, 0.7450981, 0, 1, 1,
0.8827774, -0.5718976, 1.552117, 0.7529412, 0, 1, 1,
0.886277, 0.4978541, 2.681643, 0.7568628, 0, 1, 1,
0.8864126, -0.030407, 0.8806482, 0.7647059, 0, 1, 1,
0.8893425, 0.6705503, 0.02120046, 0.7686275, 0, 1, 1,
0.8904002, 0.6060191, 0.7216166, 0.7764706, 0, 1, 1,
0.8938512, 1.314823, 1.326493, 0.7803922, 0, 1, 1,
0.8954841, -0.5030938, 1.777015, 0.7882353, 0, 1, 1,
0.8981069, 0.8492917, -0.8424706, 0.7921569, 0, 1, 1,
0.901668, 0.3463269, 1.114211, 0.8, 0, 1, 1,
0.9017999, 0.2416838, 1.576558, 0.8078431, 0, 1, 1,
0.903909, -0.1446458, 1.163191, 0.8117647, 0, 1, 1,
0.9055777, 0.6160738, 1.680988, 0.8196079, 0, 1, 1,
0.9078611, 0.1287061, 0.8908718, 0.8235294, 0, 1, 1,
0.9116179, -0.1525134, 1.688808, 0.8313726, 0, 1, 1,
0.9132494, 0.796665, 1.012756, 0.8352941, 0, 1, 1,
0.9143987, -0.4809777, 3.127512, 0.8431373, 0, 1, 1,
0.9182841, -0.9381918, 4.076204, 0.8470588, 0, 1, 1,
0.9230582, 1.419333, 1.329116, 0.854902, 0, 1, 1,
0.9232566, -0.8139993, 3.085415, 0.8588235, 0, 1, 1,
0.9255999, 1.079812, 0.1490553, 0.8666667, 0, 1, 1,
0.9292861, -0.3936768, 1.963106, 0.8705882, 0, 1, 1,
0.9340378, 2.158115, 2.189252, 0.8784314, 0, 1, 1,
0.9458036, -1.312512, 2.749009, 0.8823529, 0, 1, 1,
0.9546642, 0.9809767, 1.693927, 0.8901961, 0, 1, 1,
0.9547305, 0.5522125, 0.4066502, 0.8941177, 0, 1, 1,
0.9556084, -1.816016, 3.649104, 0.9019608, 0, 1, 1,
0.9583569, -0.6739374, 3.4345, 0.9098039, 0, 1, 1,
0.9657125, -0.6307585, 3.532869, 0.9137255, 0, 1, 1,
0.9663765, -0.01838582, 2.341665, 0.9215686, 0, 1, 1,
0.9675151, -0.1016126, 0.9958423, 0.9254902, 0, 1, 1,
0.9707608, -1.199458, 1.827792, 0.9333333, 0, 1, 1,
0.9715334, -1.146219, 3.135392, 0.9372549, 0, 1, 1,
0.9723682, -0.9289756, 1.622905, 0.945098, 0, 1, 1,
0.9748007, 0.5613105, 0.9964305, 0.9490196, 0, 1, 1,
0.9821345, -1.154906, 2.669413, 0.9568627, 0, 1, 1,
0.9854649, -0.3963164, 1.021609, 0.9607843, 0, 1, 1,
0.9919996, -0.2699169, 0.3258896, 0.9686275, 0, 1, 1,
0.9930471, -0.4246551, 2.158428, 0.972549, 0, 1, 1,
0.993397, 1.210882, 0.3803196, 0.9803922, 0, 1, 1,
0.9953306, -3.636022, 2.378558, 0.9843137, 0, 1, 1,
1.008513, 0.1325449, 1.98961, 0.9921569, 0, 1, 1,
1.008578, -1.269956, 2.769792, 0.9960784, 0, 1, 1,
1.010249, -0.4268304, 3.766634, 1, 0, 0.9960784, 1,
1.012894, 0.3782527, 1.678107, 1, 0, 0.9882353, 1,
1.01911, 0.7538106, -0.766556, 1, 0, 0.9843137, 1,
1.021789, 0.8631701, -0.5138301, 1, 0, 0.9764706, 1,
1.021946, -1.811055, 2.078632, 1, 0, 0.972549, 1,
1.022553, -0.1085596, 2.544161, 1, 0, 0.9647059, 1,
1.035945, -0.2955909, 1.209703, 1, 0, 0.9607843, 1,
1.03828, -0.3997292, 1.819448, 1, 0, 0.9529412, 1,
1.041887, 0.173973, 2.020967, 1, 0, 0.9490196, 1,
1.043776, 1.095133, -0.05940165, 1, 0, 0.9411765, 1,
1.045745, -0.7353764, 1.083699, 1, 0, 0.9372549, 1,
1.05772, -0.03681391, 0.9653633, 1, 0, 0.9294118, 1,
1.064408, 0.9821333, 2.960906, 1, 0, 0.9254902, 1,
1.069703, -0.9287445, 1.428811, 1, 0, 0.9176471, 1,
1.074164, 0.7468743, 1.391805, 1, 0, 0.9137255, 1,
1.074704, -0.9013007, 0.8536482, 1, 0, 0.9058824, 1,
1.074967, 1.140902, 0.2536877, 1, 0, 0.9019608, 1,
1.075334, -0.04895664, 0.4142346, 1, 0, 0.8941177, 1,
1.076224, 2.072051, 0.9353411, 1, 0, 0.8862745, 1,
1.08389, 0.6403591, 0.1372635, 1, 0, 0.8823529, 1,
1.084763, 1.615338, -0.7415376, 1, 0, 0.8745098, 1,
1.085595, -0.9672493, 3.104827, 1, 0, 0.8705882, 1,
1.085922, -0.735354, 2.930519, 1, 0, 0.8627451, 1,
1.086565, -0.6083894, 0.5622854, 1, 0, 0.8588235, 1,
1.092592, 1.189099, 1.483258, 1, 0, 0.8509804, 1,
1.093079, -0.5739753, -0.4485356, 1, 0, 0.8470588, 1,
1.097831, -0.6305546, 0.9759679, 1, 0, 0.8392157, 1,
1.099623, -0.4939789, 1.071919, 1, 0, 0.8352941, 1,
1.100002, 0.3261879, 1.859258, 1, 0, 0.827451, 1,
1.101833, -0.932579, 1.613273, 1, 0, 0.8235294, 1,
1.102216, 0.575416, 0.3706584, 1, 0, 0.8156863, 1,
1.108645, 0.3898273, 1.242531, 1, 0, 0.8117647, 1,
1.109859, -0.21816, 2.87027, 1, 0, 0.8039216, 1,
1.110259, 0.2687577, 2.187896, 1, 0, 0.7960784, 1,
1.113374, -0.7043772, 2.904905, 1, 0, 0.7921569, 1,
1.124768, -0.685438, 1.925637, 1, 0, 0.7843137, 1,
1.127277, -1.820526, 2.524876, 1, 0, 0.7803922, 1,
1.131686, -0.6336412, 1.464479, 1, 0, 0.772549, 1,
1.13689, 0.7182672, 1.990687, 1, 0, 0.7686275, 1,
1.13881, 0.2814935, 0.88972, 1, 0, 0.7607843, 1,
1.13918, -0.5996097, 1.430374, 1, 0, 0.7568628, 1,
1.152115, 0.810217, 1.793614, 1, 0, 0.7490196, 1,
1.153075, 0.5219973, 1.63018, 1, 0, 0.7450981, 1,
1.156763, 1.292111, 1.255217, 1, 0, 0.7372549, 1,
1.167894, -0.1581335, 1.806781, 1, 0, 0.7333333, 1,
1.199303, -0.4979825, 0.4848754, 1, 0, 0.7254902, 1,
1.20955, -0.4156362, 2.871427, 1, 0, 0.7215686, 1,
1.210145, 0.2702231, -1.344775, 1, 0, 0.7137255, 1,
1.212106, -1.301867, 2.368558, 1, 0, 0.7098039, 1,
1.214512, -1.781161, 2.120423, 1, 0, 0.7019608, 1,
1.222817, 0.4122609, 0.120713, 1, 0, 0.6941177, 1,
1.230453, 0.8225197, 1.494378, 1, 0, 0.6901961, 1,
1.233433, -1.381012, 2.753584, 1, 0, 0.682353, 1,
1.233698, -0.01462323, 1.315373, 1, 0, 0.6784314, 1,
1.23711, -0.6160181, 1.13507, 1, 0, 0.6705883, 1,
1.239046, 0.292765, 2.168664, 1, 0, 0.6666667, 1,
1.239694, -1.196665, 2.458378, 1, 0, 0.6588235, 1,
1.244122, -1.87141, 3.896516, 1, 0, 0.654902, 1,
1.24771, -0.4164902, 2.149543, 1, 0, 0.6470588, 1,
1.249301, 0.5248991, -0.07828111, 1, 0, 0.6431373, 1,
1.253309, -0.2941827, 0.8301138, 1, 0, 0.6352941, 1,
1.25702, -0.7337642, 3.00221, 1, 0, 0.6313726, 1,
1.259954, 0.5254245, -0.6127862, 1, 0, 0.6235294, 1,
1.267002, -0.7072061, 1.698877, 1, 0, 0.6196079, 1,
1.287832, -0.3190202, 1.795723, 1, 0, 0.6117647, 1,
1.308255, -1.245095, 1.954843, 1, 0, 0.6078432, 1,
1.313193, -0.1037115, 1.300402, 1, 0, 0.6, 1,
1.314638, -1.553838, 2.08911, 1, 0, 0.5921569, 1,
1.334442, -0.2464279, 2.017103, 1, 0, 0.5882353, 1,
1.341142, 0.5862014, 1.519661, 1, 0, 0.5803922, 1,
1.348891, 0.1700003, 0.4169097, 1, 0, 0.5764706, 1,
1.349205, -0.3478836, 2.142823, 1, 0, 0.5686275, 1,
1.351972, 1.526511, 1.177507, 1, 0, 0.5647059, 1,
1.364143, -0.1868792, 1.850129, 1, 0, 0.5568628, 1,
1.365517, 0.0826413, 0.7934671, 1, 0, 0.5529412, 1,
1.365732, 0.5798876, 2.7628, 1, 0, 0.5450981, 1,
1.377573, -0.7997336, -0.5888841, 1, 0, 0.5411765, 1,
1.378152, -1.276422, 3.881869, 1, 0, 0.5333334, 1,
1.379688, -2.896323, 2.701173, 1, 0, 0.5294118, 1,
1.383275, 0.2585699, 1.430422, 1, 0, 0.5215687, 1,
1.386979, -0.8593498, 1.574893, 1, 0, 0.5176471, 1,
1.390157, 0.1091109, 1.456558, 1, 0, 0.509804, 1,
1.4086, -0.7008759, 1.130228, 1, 0, 0.5058824, 1,
1.413071, -0.7189278, 2.748792, 1, 0, 0.4980392, 1,
1.414252, -0.1682788, 1.170099, 1, 0, 0.4901961, 1,
1.420973, -0.2764292, -0.3591826, 1, 0, 0.4862745, 1,
1.428532, -0.7929186, 2.312876, 1, 0, 0.4784314, 1,
1.428726, -0.01327251, 0.671149, 1, 0, 0.4745098, 1,
1.444234, 0.7899724, 2.739764, 1, 0, 0.4666667, 1,
1.460858, -0.3874941, 1.284132, 1, 0, 0.4627451, 1,
1.467932, 0.006611981, 2.212642, 1, 0, 0.454902, 1,
1.473489, -0.2560094, 2.206962, 1, 0, 0.4509804, 1,
1.507119, -2.262356, 3.693235, 1, 0, 0.4431373, 1,
1.507303, -1.030617, 0.8490798, 1, 0, 0.4392157, 1,
1.509556, -1.082536, 3.591311, 1, 0, 0.4313726, 1,
1.511067, 1.478042, 1.374046, 1, 0, 0.427451, 1,
1.511998, -0.6245881, 1.952548, 1, 0, 0.4196078, 1,
1.514297, -0.9732603, 1.95974, 1, 0, 0.4156863, 1,
1.517366, 0.1001393, 0.873565, 1, 0, 0.4078431, 1,
1.524927, 0.3759626, 0.9800139, 1, 0, 0.4039216, 1,
1.52939, 0.3392048, 1.278928, 1, 0, 0.3960784, 1,
1.539505, 0.52612, 2.65237, 1, 0, 0.3882353, 1,
1.54183, -0.8351588, -0.5640175, 1, 0, 0.3843137, 1,
1.574842, -0.1880861, 1.171067, 1, 0, 0.3764706, 1,
1.57795, -0.3210289, 1.311349, 1, 0, 0.372549, 1,
1.588763, -0.8427519, 1.81212, 1, 0, 0.3647059, 1,
1.608255, -0.1122475, 0.3247315, 1, 0, 0.3607843, 1,
1.623915, 1.311254, 0.670855, 1, 0, 0.3529412, 1,
1.633104, -1.939511, 3.54764, 1, 0, 0.3490196, 1,
1.636178, 0.9263311, 1.0187, 1, 0, 0.3411765, 1,
1.638766, 0.3719466, 2.238333, 1, 0, 0.3372549, 1,
1.643073, 1.382726, 0.2129018, 1, 0, 0.3294118, 1,
1.644223, -1.63347, 2.974059, 1, 0, 0.3254902, 1,
1.653953, 0.729785, 2.32616, 1, 0, 0.3176471, 1,
1.665222, 1.365575, 0.7350293, 1, 0, 0.3137255, 1,
1.665375, -0.1959738, 2.701157, 1, 0, 0.3058824, 1,
1.677944, 0.6737975, 0.2216569, 1, 0, 0.2980392, 1,
1.696755, -1.574942, 2.441576, 1, 0, 0.2941177, 1,
1.710442, -0.3711412, 0.9720922, 1, 0, 0.2862745, 1,
1.732324, -0.4783039, 0.9229996, 1, 0, 0.282353, 1,
1.735293, 0.5435109, 1.758275, 1, 0, 0.2745098, 1,
1.765626, -1.107305, 2.298575, 1, 0, 0.2705882, 1,
1.769332, -0.09872884, 1.165046, 1, 0, 0.2627451, 1,
1.77199, -1.02978, 1.516207, 1, 0, 0.2588235, 1,
1.777792, 0.7806517, 1.55803, 1, 0, 0.2509804, 1,
1.777881, 1.247964, 0.7660037, 1, 0, 0.2470588, 1,
1.789361, 0.6285811, 1.895106, 1, 0, 0.2392157, 1,
1.793212, -0.7461501, 2.961056, 1, 0, 0.2352941, 1,
1.800252, 0.009088813, 3.465466, 1, 0, 0.227451, 1,
1.807492, 0.6346049, 1.121389, 1, 0, 0.2235294, 1,
1.811668, -1.570657, 1.987711, 1, 0, 0.2156863, 1,
1.823142, -1.859442, 2.469754, 1, 0, 0.2117647, 1,
1.843517, 1.328387, 0.6557184, 1, 0, 0.2039216, 1,
1.84536, -0.5710511, 0.4777375, 1, 0, 0.1960784, 1,
1.858297, -0.07773726, 0.9712757, 1, 0, 0.1921569, 1,
1.875612, 1.135415, 1.304947, 1, 0, 0.1843137, 1,
1.896406, 0.2481942, 1.956607, 1, 0, 0.1803922, 1,
1.90229, -1.014687, 1.689849, 1, 0, 0.172549, 1,
1.919814, 0.7163215, -1.234265, 1, 0, 0.1686275, 1,
1.928145, 0.8361205, 0.7977387, 1, 0, 0.1607843, 1,
1.945855, 0.2403048, -0.3712857, 1, 0, 0.1568628, 1,
1.948019, -0.9712726, 1.545597, 1, 0, 0.1490196, 1,
1.97393, -0.1018083, 1.974979, 1, 0, 0.145098, 1,
1.990314, -1.008484, 2.056886, 1, 0, 0.1372549, 1,
2.009326, 0.3249938, 0.2851083, 1, 0, 0.1333333, 1,
2.010364, -1.509214, 0.4728054, 1, 0, 0.1254902, 1,
2.047078, 1.387103, 1.500767, 1, 0, 0.1215686, 1,
2.068735, 0.3992189, 0.7272961, 1, 0, 0.1137255, 1,
2.097924, -1.287962, 2.004623, 1, 0, 0.1098039, 1,
2.104867, 2.111114, 0.260751, 1, 0, 0.1019608, 1,
2.130635, 0.3062528, 1.046677, 1, 0, 0.09411765, 1,
2.247185, -0.6715831, 1.144937, 1, 0, 0.09019608, 1,
2.277719, -0.9347367, 1.939932, 1, 0, 0.08235294, 1,
2.284585, -0.001673847, 2.696792, 1, 0, 0.07843138, 1,
2.336565, -1.927639, 1.345076, 1, 0, 0.07058824, 1,
2.387347, 0.05368069, 1.397495, 1, 0, 0.06666667, 1,
2.399364, -2.216272, 2.378048, 1, 0, 0.05882353, 1,
2.41252, 0.8328595, 1.366347, 1, 0, 0.05490196, 1,
2.494797, -0.3089993, 1.804458, 1, 0, 0.04705882, 1,
2.501639, 1.225117, 1.964488, 1, 0, 0.04313726, 1,
2.589918, 0.7734793, 2.306837, 1, 0, 0.03529412, 1,
2.655241, 2.592517, 0.3966871, 1, 0, 0.03137255, 1,
2.692802, -1.977167, 2.963223, 1, 0, 0.02352941, 1,
2.801324, -1.164042, 2.850094, 1, 0, 0.01960784, 1,
2.857916, -0.5315948, 3.082873, 1, 0, 0.01176471, 1,
3.050201, -0.8301842, 3.119008, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.07154536, -4.763003, -6.67386, 0, -0.5, 0.5, 0.5,
-0.07154536, -4.763003, -6.67386, 1, -0.5, 0.5, 0.5,
-0.07154536, -4.763003, -6.67386, 1, 1.5, 0.5, 0.5,
-0.07154536, -4.763003, -6.67386, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.251564, -0.3115963, -6.67386, 0, -0.5, 0.5, 0.5,
-4.251564, -0.3115963, -6.67386, 1, -0.5, 0.5, 0.5,
-4.251564, -0.3115963, -6.67386, 1, 1.5, 0.5, 0.5,
-4.251564, -0.3115963, -6.67386, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.251564, -4.763003, -0.1992364, 0, -0.5, 0.5, 0.5,
-4.251564, -4.763003, -0.1992364, 1, -0.5, 0.5, 0.5,
-4.251564, -4.763003, -0.1992364, 1, 1.5, 0.5, 0.5,
-4.251564, -4.763003, -0.1992364, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.735755, -5.179716,
3, -3.735755, -5.179716,
-3, -3.735755, -5.179716,
-3, -3.906963, -5.42874,
-2, -3.735755, -5.179716,
-2, -3.906963, -5.42874,
-1, -3.735755, -5.179716,
-1, -3.906963, -5.42874,
0, -3.735755, -5.179716,
0, -3.906963, -5.42874,
1, -3.735755, -5.179716,
1, -3.906963, -5.42874,
2, -3.735755, -5.179716,
2, -3.906963, -5.42874,
3, -3.735755, -5.179716,
3, -3.906963, -5.42874
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
-3, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
-3, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
-3, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5,
-2, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
-2, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
-2, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
-2, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5,
-1, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
-1, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
-1, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
-1, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5,
0, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
0, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
0, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
0, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5,
1, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
1, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
1, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
1, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5,
2, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
2, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
2, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
2, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5,
3, -4.249379, -5.926788, 0, -0.5, 0.5, 0.5,
3, -4.249379, -5.926788, 1, -0.5, 0.5, 0.5,
3, -4.249379, -5.926788, 1, 1.5, 0.5, 0.5,
3, -4.249379, -5.926788, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.286944, -3, -5.179716,
-3.286944, 3, -5.179716,
-3.286944, -3, -5.179716,
-3.447714, -3, -5.42874,
-3.286944, -2, -5.179716,
-3.447714, -2, -5.42874,
-3.286944, -1, -5.179716,
-3.447714, -1, -5.42874,
-3.286944, 0, -5.179716,
-3.447714, 0, -5.42874,
-3.286944, 1, -5.179716,
-3.447714, 1, -5.42874,
-3.286944, 2, -5.179716,
-3.447714, 2, -5.42874,
-3.286944, 3, -5.179716,
-3.447714, 3, -5.42874
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.769253, -3, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, -3, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, -3, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, -3, -5.926788, 0, 1.5, 0.5, 0.5,
-3.769253, -2, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, -2, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, -2, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, -2, -5.926788, 0, 1.5, 0.5, 0.5,
-3.769253, -1, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, -1, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, -1, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, -1, -5.926788, 0, 1.5, 0.5, 0.5,
-3.769253, 0, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, 0, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, 0, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, 0, -5.926788, 0, 1.5, 0.5, 0.5,
-3.769253, 1, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, 1, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, 1, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, 1, -5.926788, 0, 1.5, 0.5, 0.5,
-3.769253, 2, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, 2, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, 2, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, 2, -5.926788, 0, 1.5, 0.5, 0.5,
-3.769253, 3, -5.926788, 0, -0.5, 0.5, 0.5,
-3.769253, 3, -5.926788, 1, -0.5, 0.5, 0.5,
-3.769253, 3, -5.926788, 1, 1.5, 0.5, 0.5,
-3.769253, 3, -5.926788, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.286944, -3.735755, -4,
-3.286944, -3.735755, 4,
-3.286944, -3.735755, -4,
-3.447714, -3.906963, -4,
-3.286944, -3.735755, -2,
-3.447714, -3.906963, -2,
-3.286944, -3.735755, 0,
-3.447714, -3.906963, 0,
-3.286944, -3.735755, 2,
-3.447714, -3.906963, 2,
-3.286944, -3.735755, 4,
-3.447714, -3.906963, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.769253, -4.249379, -4, 0, -0.5, 0.5, 0.5,
-3.769253, -4.249379, -4, 1, -0.5, 0.5, 0.5,
-3.769253, -4.249379, -4, 1, 1.5, 0.5, 0.5,
-3.769253, -4.249379, -4, 0, 1.5, 0.5, 0.5,
-3.769253, -4.249379, -2, 0, -0.5, 0.5, 0.5,
-3.769253, -4.249379, -2, 1, -0.5, 0.5, 0.5,
-3.769253, -4.249379, -2, 1, 1.5, 0.5, 0.5,
-3.769253, -4.249379, -2, 0, 1.5, 0.5, 0.5,
-3.769253, -4.249379, 0, 0, -0.5, 0.5, 0.5,
-3.769253, -4.249379, 0, 1, -0.5, 0.5, 0.5,
-3.769253, -4.249379, 0, 1, 1.5, 0.5, 0.5,
-3.769253, -4.249379, 0, 0, 1.5, 0.5, 0.5,
-3.769253, -4.249379, 2, 0, -0.5, 0.5, 0.5,
-3.769253, -4.249379, 2, 1, -0.5, 0.5, 0.5,
-3.769253, -4.249379, 2, 1, 1.5, 0.5, 0.5,
-3.769253, -4.249379, 2, 0, 1.5, 0.5, 0.5,
-3.769253, -4.249379, 4, 0, -0.5, 0.5, 0.5,
-3.769253, -4.249379, 4, 1, -0.5, 0.5, 0.5,
-3.769253, -4.249379, 4, 1, 1.5, 0.5, 0.5,
-3.769253, -4.249379, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.286944, -3.735755, -5.179716,
-3.286944, 3.112563, -5.179716,
-3.286944, -3.735755, 4.781243,
-3.286944, 3.112563, 4.781243,
-3.286944, -3.735755, -5.179716,
-3.286944, -3.735755, 4.781243,
-3.286944, 3.112563, -5.179716,
-3.286944, 3.112563, 4.781243,
-3.286944, -3.735755, -5.179716,
3.143853, -3.735755, -5.179716,
-3.286944, -3.735755, 4.781243,
3.143853, -3.735755, 4.781243,
-3.286944, 3.112563, -5.179716,
3.143853, 3.112563, -5.179716,
-3.286944, 3.112563, 4.781243,
3.143853, 3.112563, 4.781243,
3.143853, -3.735755, -5.179716,
3.143853, 3.112563, -5.179716,
3.143853, -3.735755, 4.781243,
3.143853, 3.112563, 4.781243,
3.143853, -3.735755, -5.179716,
3.143853, -3.735755, 4.781243,
3.143853, 3.112563, -5.179716,
3.143853, 3.112563, 4.781243
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.311349;
var distance = 32.52902;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.07154536, 0.3115963, 0.1992364 );
mvMatrix.scale( 1.229268, 1.154323, 0.7936157 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.52902);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
imazosulfuron<-read.table("imazosulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazosulfuron' not found
```

```r
y<-imazosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazosulfuron' not found
```

```r
z<-imazosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazosulfuron' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.193291, 0.3532054, -2.045586, 0, 0, 1, 1, 1,
-2.706477, -0.6844714, -1.996135, 1, 0, 0, 1, 1,
-2.60353, -0.365723, -0.4899438, 1, 0, 0, 1, 1,
-2.444845, -0.8459918, -1.45751, 1, 0, 0, 1, 1,
-2.426579, 1.172982, -3.934039, 1, 0, 0, 1, 1,
-2.346686, 0.6358781, -2.319146, 1, 0, 0, 1, 1,
-2.337493, -0.4103852, -1.169665, 0, 0, 0, 1, 1,
-2.31995, -0.2361797, -0.4705532, 0, 0, 0, 1, 1,
-2.314129, 1.31736, -1.594777, 0, 0, 0, 1, 1,
-2.261428, -0.8547499, -0.5605646, 0, 0, 0, 1, 1,
-2.233731, -0.6296363, -1.443874, 0, 0, 0, 1, 1,
-2.169679, -1.042141, -3.569761, 0, 0, 0, 1, 1,
-2.1666, 0.2000833, -2.749882, 0, 0, 0, 1, 1,
-2.1543, -0.4379275, -0.9015841, 1, 1, 1, 1, 1,
-2.101181, -1.927148, -2.613719, 1, 1, 1, 1, 1,
-2.097232, -0.998238, -2.757183, 1, 1, 1, 1, 1,
-2.08968, -0.3478421, -2.519094, 1, 1, 1, 1, 1,
-2.087134, 0.1744909, -2.912859, 1, 1, 1, 1, 1,
-2.083384, -0.5292863, -2.079396, 1, 1, 1, 1, 1,
-2.069021, -1.612724, -2.115935, 1, 1, 1, 1, 1,
-2.037882, 0.04962743, 0.7274812, 1, 1, 1, 1, 1,
-2.024587, 0.4904938, -1.524568, 1, 1, 1, 1, 1,
-1.977574, 0.7746637, -1.147285, 1, 1, 1, 1, 1,
-1.960838, -0.2710288, -0.9968371, 1, 1, 1, 1, 1,
-1.955123, -0.6046418, -0.4460646, 1, 1, 1, 1, 1,
-1.943044, 0.3641514, -0.8322814, 1, 1, 1, 1, 1,
-1.903046, 0.7342705, -0.839563, 1, 1, 1, 1, 1,
-1.877746, -0.2357109, -2.21813, 1, 1, 1, 1, 1,
-1.873968, -0.2716216, -1.432277, 0, 0, 1, 1, 1,
-1.872028, -0.7998851, -1.990852, 1, 0, 0, 1, 1,
-1.869344, 0.7424691, -2.675524, 1, 0, 0, 1, 1,
-1.863204, 0.3277916, -2.113593, 1, 0, 0, 1, 1,
-1.855772, 0.01967062, -0.9559329, 1, 0, 0, 1, 1,
-1.838228, -0.3978447, -0.3308913, 1, 0, 0, 1, 1,
-1.825193, -1.025879, -1.477762, 0, 0, 0, 1, 1,
-1.823831, 0.6029559, -0.6140255, 0, 0, 0, 1, 1,
-1.822321, 0.5070819, -2.194364, 0, 0, 0, 1, 1,
-1.798243, -0.622544, -0.5480275, 0, 0, 0, 1, 1,
-1.775257, -0.571104, -0.666328, 0, 0, 0, 1, 1,
-1.764689, 0.8245895, -1.473796, 0, 0, 0, 1, 1,
-1.759324, -0.9052296, -3.094107, 0, 0, 0, 1, 1,
-1.732006, -0.4551457, -1.470763, 1, 1, 1, 1, 1,
-1.711112, 0.9601669, -1.279228, 1, 1, 1, 1, 1,
-1.697175, -0.4414077, -1.979832, 1, 1, 1, 1, 1,
-1.667237, 0.3944253, -0.9793333, 1, 1, 1, 1, 1,
-1.663725, 2.057092, -0.5982513, 1, 1, 1, 1, 1,
-1.657271, -0.01785168, -2.005985, 1, 1, 1, 1, 1,
-1.656791, 0.3407584, 0.917541, 1, 1, 1, 1, 1,
-1.653657, 0.1666863, -1.11631, 1, 1, 1, 1, 1,
-1.649005, -0.4926357, -2.666595, 1, 1, 1, 1, 1,
-1.644452, 2.073324, 1.235278, 1, 1, 1, 1, 1,
-1.635732, 0.05290259, -0.1178226, 1, 1, 1, 1, 1,
-1.63292, -0.5718535, -3.273701, 1, 1, 1, 1, 1,
-1.620408, -0.1968267, -2.248996, 1, 1, 1, 1, 1,
-1.619445, -1.129628, -4.629851, 1, 1, 1, 1, 1,
-1.614774, -1.195676, -2.540928, 1, 1, 1, 1, 1,
-1.613315, 1.199607, -0.9089168, 0, 0, 1, 1, 1,
-1.609619, 0.4406301, -1.032507, 1, 0, 0, 1, 1,
-1.606521, 2.355953, 0.0180433, 1, 0, 0, 1, 1,
-1.557035, 0.6901616, -2.736876, 1, 0, 0, 1, 1,
-1.547666, -0.9674448, -1.586282, 1, 0, 0, 1, 1,
-1.547534, 1.317959, -2.256217, 1, 0, 0, 1, 1,
-1.542431, 0.1856143, -2.382215, 0, 0, 0, 1, 1,
-1.53341, 0.673963, -0.8348858, 0, 0, 0, 1, 1,
-1.514843, -0.04978378, -1.629805, 0, 0, 0, 1, 1,
-1.505412, -1.481667, -1.171421, 0, 0, 0, 1, 1,
-1.505403, -0.6502193, -0.7832027, 0, 0, 0, 1, 1,
-1.503755, -0.7049759, -1.491865, 0, 0, 0, 1, 1,
-1.491128, -0.5844364, -2.27597, 0, 0, 0, 1, 1,
-1.479316, 1.359093, -3.571007, 1, 1, 1, 1, 1,
-1.476863, 0.07165314, -2.918272, 1, 1, 1, 1, 1,
-1.470504, 0.1383849, -1.642302, 1, 1, 1, 1, 1,
-1.453104, 0.3968809, 0.3877865, 1, 1, 1, 1, 1,
-1.449151, -1.479601, -0.7881568, 1, 1, 1, 1, 1,
-1.441759, -0.6897306, -3.542254, 1, 1, 1, 1, 1,
-1.426256, 0.8297201, 0.1068477, 1, 1, 1, 1, 1,
-1.414692, 0.02883262, -0.4716228, 1, 1, 1, 1, 1,
-1.396408, -0.9572554, -2.915071, 1, 1, 1, 1, 1,
-1.395597, -0.5456223, -0.6543548, 1, 1, 1, 1, 1,
-1.39359, -1.104344, -1.599945, 1, 1, 1, 1, 1,
-1.389341, 0.2048865, -3.675281, 1, 1, 1, 1, 1,
-1.382421, -0.6441485, -2.742176, 1, 1, 1, 1, 1,
-1.380979, 0.7708625, -0.117325, 1, 1, 1, 1, 1,
-1.371898, -0.09361491, -1.860565, 1, 1, 1, 1, 1,
-1.367392, 0.8898104, -0.6552948, 0, 0, 1, 1, 1,
-1.356552, -0.7425982, -1.305199, 1, 0, 0, 1, 1,
-1.350647, -0.5227715, -0.5284472, 1, 0, 0, 1, 1,
-1.334716, 0.1816392, -2.533323, 1, 0, 0, 1, 1,
-1.323318, -1.014269, -1.362137, 1, 0, 0, 1, 1,
-1.321996, -0.3059705, -1.717723, 1, 0, 0, 1, 1,
-1.316807, -0.9392979, -0.8119951, 0, 0, 0, 1, 1,
-1.310699, 0.6790165, -0.711815, 0, 0, 0, 1, 1,
-1.309638, 0.3763393, -0.952868, 0, 0, 0, 1, 1,
-1.309014, 0.3980268, -2.599867, 0, 0, 0, 1, 1,
-1.29452, 0.6381367, -1.328072, 0, 0, 0, 1, 1,
-1.284937, 0.2150708, -0.574955, 0, 0, 0, 1, 1,
-1.278813, -0.2380074, -1.435852, 0, 0, 0, 1, 1,
-1.263062, -0.6978567, 1.005183, 1, 1, 1, 1, 1,
-1.255306, -0.2393639, -0.937636, 1, 1, 1, 1, 1,
-1.254034, 0.4053547, -2.487293, 1, 1, 1, 1, 1,
-1.245212, -0.4195184, -3.361886, 1, 1, 1, 1, 1,
-1.24131, 0.9673709, -0.4253866, 1, 1, 1, 1, 1,
-1.239385, 2.16103, -0.1199166, 1, 1, 1, 1, 1,
-1.239356, 1.034012, -0.235364, 1, 1, 1, 1, 1,
-1.231141, -0.5564145, -0.4404712, 1, 1, 1, 1, 1,
-1.224711, 1.01669, -0.9881899, 1, 1, 1, 1, 1,
-1.221997, 0.4313951, -1.399234, 1, 1, 1, 1, 1,
-1.218809, -1.117752, -2.626492, 1, 1, 1, 1, 1,
-1.218702, -0.2558151, -1.399467, 1, 1, 1, 1, 1,
-1.218292, 0.1340358, -1.567394, 1, 1, 1, 1, 1,
-1.217253, -1.263764, -3.311055, 1, 1, 1, 1, 1,
-1.209648, 0.05022784, -1.788988, 1, 1, 1, 1, 1,
-1.207098, -0.8659868, -1.926876, 0, 0, 1, 1, 1,
-1.20652, 0.7236158, -2.006414, 1, 0, 0, 1, 1,
-1.202031, -0.9148039, -1.284766, 1, 0, 0, 1, 1,
-1.193017, 1.103673, -0.1231377, 1, 0, 0, 1, 1,
-1.189027, 1.549959, -0.3204173, 1, 0, 0, 1, 1,
-1.183666, -0.06297149, -0.7063746, 1, 0, 0, 1, 1,
-1.175046, 0.1475818, -1.732767, 0, 0, 0, 1, 1,
-1.172286, -1.909081, -3.294527, 0, 0, 0, 1, 1,
-1.167519, -0.03121413, -1.643916, 0, 0, 0, 1, 1,
-1.161392, -1.00682, -3.785915, 0, 0, 0, 1, 1,
-1.150426, -0.4718207, -1.81318, 0, 0, 0, 1, 1,
-1.149017, -0.7628512, -2.012295, 0, 0, 0, 1, 1,
-1.14777, 0.1894677, -0.5855728, 0, 0, 0, 1, 1,
-1.147527, 0.148174, -3.245136, 1, 1, 1, 1, 1,
-1.142322, -0.8691768, -1.544916, 1, 1, 1, 1, 1,
-1.141075, -0.5780237, -0.46501, 1, 1, 1, 1, 1,
-1.140375, 0.7645316, 0.254737, 1, 1, 1, 1, 1,
-1.140065, 0.2271265, -1.929273, 1, 1, 1, 1, 1,
-1.134802, 1.579119, 0.4259495, 1, 1, 1, 1, 1,
-1.127999, 0.7896535, -1.592436, 1, 1, 1, 1, 1,
-1.121555, 0.29663, -1.545378, 1, 1, 1, 1, 1,
-1.115542, -0.08554389, -2.400831, 1, 1, 1, 1, 1,
-1.110266, -0.01879914, -1.396888, 1, 1, 1, 1, 1,
-1.109635, -0.379806, -1.528318, 1, 1, 1, 1, 1,
-1.10715, -0.5219634, -1.981058, 1, 1, 1, 1, 1,
-1.101453, 0.8460058, -1.066653, 1, 1, 1, 1, 1,
-1.099846, -1.171098, -2.556553, 1, 1, 1, 1, 1,
-1.096945, 0.8589949, -1.483444, 1, 1, 1, 1, 1,
-1.095273, -1.059308, -2.342889, 0, 0, 1, 1, 1,
-1.094925, -0.1060357, -1.750181, 1, 0, 0, 1, 1,
-1.089727, 0.04820491, -1.705113, 1, 0, 0, 1, 1,
-1.087679, 0.8935863, -0.9709596, 1, 0, 0, 1, 1,
-1.085977, 1.598657, -0.8610784, 1, 0, 0, 1, 1,
-1.072847, 0.4026704, -0.2975133, 1, 0, 0, 1, 1,
-1.070563, -0.1985135, -1.198731, 0, 0, 0, 1, 1,
-1.068528, -0.1800932, -2.323332, 0, 0, 0, 1, 1,
-1.067086, 0.1156163, -1.666572, 0, 0, 0, 1, 1,
-1.067062, -0.3872202, -1.606537, 0, 0, 0, 1, 1,
-1.0655, 0.4930309, -1.383519, 0, 0, 0, 1, 1,
-1.064272, 0.7713483, -1.865168, 0, 0, 0, 1, 1,
-1.062381, -0.2075697, -0.954934, 0, 0, 0, 1, 1,
-1.053102, 0.2931094, -1.442524, 1, 1, 1, 1, 1,
-1.047991, 1.981092, -1.381542, 1, 1, 1, 1, 1,
-1.042861, 0.6343182, -3.342852, 1, 1, 1, 1, 1,
-1.041653, -2.020224, -3.918115, 1, 1, 1, 1, 1,
-1.040053, 0.07189593, 0.2152472, 1, 1, 1, 1, 1,
-1.030245, -1.105397, -1.178069, 1, 1, 1, 1, 1,
-1.022072, 0.5680802, -0.4915881, 1, 1, 1, 1, 1,
-1.012339, -1.252545, -3.310594, 1, 1, 1, 1, 1,
-1.00881, 1.246463, -1.010562, 1, 1, 1, 1, 1,
-0.9930007, -0.4709915, -2.028339, 1, 1, 1, 1, 1,
-0.9924043, -0.2880756, -2.865485, 1, 1, 1, 1, 1,
-0.9921439, -0.181456, -1.84363, 1, 1, 1, 1, 1,
-0.9915267, 0.3029785, 0.2712135, 1, 1, 1, 1, 1,
-0.9914956, 2.409908, -0.3891784, 1, 1, 1, 1, 1,
-0.988691, -0.8900433, -3.964322, 1, 1, 1, 1, 1,
-0.9811847, -1.250766, -2.168463, 0, 0, 1, 1, 1,
-0.9756462, 0.4843516, -1.039196, 1, 0, 0, 1, 1,
-0.9680715, -0.03462308, -1.389156, 1, 0, 0, 1, 1,
-0.967435, 0.7657167, -1.129242, 1, 0, 0, 1, 1,
-0.9497386, -0.1471697, -2.075698, 1, 0, 0, 1, 1,
-0.9483184, -0.4639462, -1.192816, 1, 0, 0, 1, 1,
-0.9357572, -1.758628, -1.455658, 0, 0, 0, 1, 1,
-0.9335413, -0.3846865, -3.903744, 0, 0, 0, 1, 1,
-0.928686, -0.9621759, -4.081937, 0, 0, 0, 1, 1,
-0.9248614, -0.723435, -2.938385, 0, 0, 0, 1, 1,
-0.9243072, -0.1170138, -1.067553, 0, 0, 0, 1, 1,
-0.9201056, 0.1001351, -0.9404585, 0, 0, 0, 1, 1,
-0.9076382, 0.6818854, -0.6207152, 0, 0, 0, 1, 1,
-0.9066834, -0.2047352, -2.139012, 1, 1, 1, 1, 1,
-0.9056549, -1.239541, -2.871483, 1, 1, 1, 1, 1,
-0.9022481, -0.7732242, -3.975548, 1, 1, 1, 1, 1,
-0.9009016, 0.9966184, 0.6262878, 1, 1, 1, 1, 1,
-0.8966226, -0.8733359, -4.348693, 1, 1, 1, 1, 1,
-0.8878176, -0.04561022, -2.873039, 1, 1, 1, 1, 1,
-0.8839259, -0.1114462, -0.9368834, 1, 1, 1, 1, 1,
-0.8838956, 0.6730112, -0.09583467, 1, 1, 1, 1, 1,
-0.8824874, 0.3418328, -2.540478, 1, 1, 1, 1, 1,
-0.8816803, 1.453693, 0.6029187, 1, 1, 1, 1, 1,
-0.881383, -0.8064455, -0.9656714, 1, 1, 1, 1, 1,
-0.8800334, 0.560624, -0.8352823, 1, 1, 1, 1, 1,
-0.8701009, 0.02133746, -0.7831788, 1, 1, 1, 1, 1,
-0.8699677, -0.4439358, -1.011706, 1, 1, 1, 1, 1,
-0.869768, -0.4856209, -0.1419232, 1, 1, 1, 1, 1,
-0.8693464, -1.995604, -2.308236, 0, 0, 1, 1, 1,
-0.8675933, 0.4257716, -1.246898, 1, 0, 0, 1, 1,
-0.8658836, 0.6224033, -0.5719271, 1, 0, 0, 1, 1,
-0.865324, -0.3033887, -1.798522, 1, 0, 0, 1, 1,
-0.8646986, -2.756282, -3.700814, 1, 0, 0, 1, 1,
-0.8617859, 0.500428, -0.9722812, 1, 0, 0, 1, 1,
-0.8532332, 0.3378444, 1.161363, 0, 0, 0, 1, 1,
-0.8527477, -0.01746069, -1.858718, 0, 0, 0, 1, 1,
-0.8493341, 1.465917, 1.599937, 0, 0, 0, 1, 1,
-0.8492444, 0.1021581, -2.621197, 0, 0, 0, 1, 1,
-0.8448727, 0.4932024, 0.9712669, 0, 0, 0, 1, 1,
-0.8434805, -0.6611773, -2.044793, 0, 0, 0, 1, 1,
-0.8397303, -0.6327235, -2.838448, 0, 0, 0, 1, 1,
-0.8380778, 0.8774428, -1.310029, 1, 1, 1, 1, 1,
-0.8293792, -0.7514929, -2.340376, 1, 1, 1, 1, 1,
-0.8257761, 0.5826357, -1.254625, 1, 1, 1, 1, 1,
-0.8243261, 0.2826359, -0.1825475, 1, 1, 1, 1, 1,
-0.8184, -0.3616702, -2.979193, 1, 1, 1, 1, 1,
-0.8164028, 0.8101571, 0.1519676, 1, 1, 1, 1, 1,
-0.8091204, -1.02483, -3.993315, 1, 1, 1, 1, 1,
-0.8050131, 0.4645593, -1.094161, 1, 1, 1, 1, 1,
-0.8046808, 0.0109665, -3.136919, 1, 1, 1, 1, 1,
-0.8023687, 1.032411, 2.12308, 1, 1, 1, 1, 1,
-0.7991642, 0.5900146, -1.260806, 1, 1, 1, 1, 1,
-0.7989367, 1.772517, -1.904012, 1, 1, 1, 1, 1,
-0.7977485, 1.498516, 0.6390824, 1, 1, 1, 1, 1,
-0.786323, 0.9637063, 0.8810208, 1, 1, 1, 1, 1,
-0.7828052, -0.5662569, -3.181553, 1, 1, 1, 1, 1,
-0.7768514, 1.585038, -1.573965, 0, 0, 1, 1, 1,
-0.7709154, 0.02268478, -1.556516, 1, 0, 0, 1, 1,
-0.7687452, 1.16985, -0.1807236, 1, 0, 0, 1, 1,
-0.7656604, -0.5234175, -1.318282, 1, 0, 0, 1, 1,
-0.7545467, 1.614572, -0.4192268, 1, 0, 0, 1, 1,
-0.7465842, -0.1602901, -1.494882, 1, 0, 0, 1, 1,
-0.7450213, 0.1792632, -0.6360704, 0, 0, 0, 1, 1,
-0.7323269, -1.09716, -3.314553, 0, 0, 0, 1, 1,
-0.7224212, -0.9020593, -3.573026, 0, 0, 0, 1, 1,
-0.717099, 0.01864902, -0.1070682, 0, 0, 0, 1, 1,
-0.7162945, 0.1879696, -2.371411, 0, 0, 0, 1, 1,
-0.7116604, -0.06061623, -1.697249, 0, 0, 0, 1, 1,
-0.7105175, 0.6851438, 0.4659488, 0, 0, 0, 1, 1,
-0.6999493, 1.272658, -0.8466465, 1, 1, 1, 1, 1,
-0.6979499, 0.1800362, -0.7291948, 1, 1, 1, 1, 1,
-0.6952991, -0.2028775, -0.9347239, 1, 1, 1, 1, 1,
-0.692421, -1.869953, -4.22941, 1, 1, 1, 1, 1,
-0.6856058, 0.4174227, -0.1241936, 1, 1, 1, 1, 1,
-0.6838024, 0.5696569, -0.8992544, 1, 1, 1, 1, 1,
-0.683191, 0.1580867, -2.152819, 1, 1, 1, 1, 1,
-0.681417, -0.05322595, -2.693866, 1, 1, 1, 1, 1,
-0.6786893, -1.710407, -1.694958, 1, 1, 1, 1, 1,
-0.669562, 1.950136, -1.024581, 1, 1, 1, 1, 1,
-0.6672534, -0.1585612, -2.331091, 1, 1, 1, 1, 1,
-0.6668254, 0.7180433, -0.216551, 1, 1, 1, 1, 1,
-0.6654634, -1.433265, -0.1875073, 1, 1, 1, 1, 1,
-0.6584827, 0.1922368, 1.168845, 1, 1, 1, 1, 1,
-0.6485686, 1.174797, -2.495692, 1, 1, 1, 1, 1,
-0.6471836, -1.704509, -2.389266, 0, 0, 1, 1, 1,
-0.6451578, -0.2928733, -2.351457, 1, 0, 0, 1, 1,
-0.6435312, 0.4998906, -0.6753205, 1, 0, 0, 1, 1,
-0.6401449, -0.2432633, -1.898578, 1, 0, 0, 1, 1,
-0.6346309, 0.359866, 0.1331047, 1, 0, 0, 1, 1,
-0.6296952, -0.1919096, -1.927895, 1, 0, 0, 1, 1,
-0.6286808, -0.9475569, -1.176543, 0, 0, 0, 1, 1,
-0.6240416, 0.5741719, -0.5809499, 0, 0, 0, 1, 1,
-0.6237759, -0.175737, -2.608694, 0, 0, 0, 1, 1,
-0.6234668, -0.0227, -0.8472142, 0, 0, 0, 1, 1,
-0.6181679, 0.4437606, -1.443451, 0, 0, 0, 1, 1,
-0.6120675, -0.3857671, -3.543273, 0, 0, 0, 1, 1,
-0.6045954, -1.46262, -1.79317, 0, 0, 0, 1, 1,
-0.6013588, -0.6981517, -0.6908816, 1, 1, 1, 1, 1,
-0.6005845, -1.593019, -3.86578, 1, 1, 1, 1, 1,
-0.5983499, -0.3388024, 0.08701999, 1, 1, 1, 1, 1,
-0.5972007, 0.01286488, -1.653585, 1, 1, 1, 1, 1,
-0.5959986, 0.1210266, -2.491824, 1, 1, 1, 1, 1,
-0.5948404, -0.09826626, -2.909236, 1, 1, 1, 1, 1,
-0.5943596, -0.2807265, -1.078277, 1, 1, 1, 1, 1,
-0.5919504, -1.565302, -2.829397, 1, 1, 1, 1, 1,
-0.5914617, -0.7637396, -1.744856, 1, 1, 1, 1, 1,
-0.5910991, -0.6528785, -1.947801, 1, 1, 1, 1, 1,
-0.5901444, 0.4450963, -0.4805807, 1, 1, 1, 1, 1,
-0.5866416, -0.5623902, -1.666172, 1, 1, 1, 1, 1,
-0.586243, 2.262704, -1.856846, 1, 1, 1, 1, 1,
-0.5841953, -0.994479, -1.872064, 1, 1, 1, 1, 1,
-0.5826887, 0.3757313, -1.173335, 1, 1, 1, 1, 1,
-0.5765885, -0.3797056, -4.336373, 0, 0, 1, 1, 1,
-0.5746759, 0.5231052, -0.8828412, 1, 0, 0, 1, 1,
-0.5647541, -2.381893, -2.407252, 1, 0, 0, 1, 1,
-0.5640349, 0.5918986, -0.6827781, 1, 0, 0, 1, 1,
-0.5618376, -0.5410876, -1.599958, 1, 0, 0, 1, 1,
-0.5608002, 0.09948256, -0.3283139, 1, 0, 0, 1, 1,
-0.5606749, 1.948049, -1.337168, 0, 0, 0, 1, 1,
-0.558961, -1.709916, -1.535804, 0, 0, 0, 1, 1,
-0.5570431, -0.8929132, -1.993263, 0, 0, 0, 1, 1,
-0.5511836, 1.417145, 1.045049, 0, 0, 0, 1, 1,
-0.542292, -0.2824272, -1.873351, 0, 0, 0, 1, 1,
-0.5367337, 0.5326003, 0.3679499, 0, 0, 0, 1, 1,
-0.533373, -0.09980594, -0.1768411, 0, 0, 0, 1, 1,
-0.5315874, -1.097179, -2.895029, 1, 1, 1, 1, 1,
-0.5302187, 0.8659629, 0.1153432, 1, 1, 1, 1, 1,
-0.5282251, 0.1948626, -2.272727, 1, 1, 1, 1, 1,
-0.526004, 0.2742099, -0.6323509, 1, 1, 1, 1, 1,
-0.5243236, 1.03094, -0.9528911, 1, 1, 1, 1, 1,
-0.5167111, 0.6990024, -0.9760203, 1, 1, 1, 1, 1,
-0.5163646, 0.04585684, -2.01631, 1, 1, 1, 1, 1,
-0.5050644, 1.057006, 0.02177446, 1, 1, 1, 1, 1,
-0.5040452, -1.897189, -0.8884206, 1, 1, 1, 1, 1,
-0.5031765, 0.7839412, -2.085703, 1, 1, 1, 1, 1,
-0.5021387, 0.7917531, 0.9001299, 1, 1, 1, 1, 1,
-0.5004066, -2.087643, -3.126645, 1, 1, 1, 1, 1,
-0.4911373, 0.07200094, -1.489157, 1, 1, 1, 1, 1,
-0.4854271, -3.296837, -2.944494, 1, 1, 1, 1, 1,
-0.4853747, 0.3914995, 0.4547726, 1, 1, 1, 1, 1,
-0.4847158, -2.182709, -2.680919, 0, 0, 1, 1, 1,
-0.4832425, 0.1693838, -2.927402, 1, 0, 0, 1, 1,
-0.4816357, -1.917806, -1.521406, 1, 0, 0, 1, 1,
-0.4805482, -0.05080771, -4.78305, 1, 0, 0, 1, 1,
-0.4744165, -0.3002686, -1.754771, 1, 0, 0, 1, 1,
-0.4739512, 0.3392377, -0.3578827, 1, 0, 0, 1, 1,
-0.4638032, 0.03357052, -0.6735481, 0, 0, 0, 1, 1,
-0.4622599, 0.1704102, -1.50227, 0, 0, 0, 1, 1,
-0.4595153, -2.253924, -3.911062, 0, 0, 0, 1, 1,
-0.4585763, 0.06354655, -1.561476, 0, 0, 0, 1, 1,
-0.447026, 0.34933, -0.4102294, 0, 0, 0, 1, 1,
-0.4443627, -1.070028, -2.259745, 0, 0, 0, 1, 1,
-0.4417181, 0.8133779, -0.9832698, 0, 0, 0, 1, 1,
-0.4380639, -0.7860757, -4.704182, 1, 1, 1, 1, 1,
-0.4346631, 0.4746157, 0.1831271, 1, 1, 1, 1, 1,
-0.4257964, -0.4440301, -2.285662, 1, 1, 1, 1, 1,
-0.419728, -1.096285, -2.270081, 1, 1, 1, 1, 1,
-0.4189321, 0.4137082, 1.183457, 1, 1, 1, 1, 1,
-0.4124614, -1.489499, -2.253541, 1, 1, 1, 1, 1,
-0.4082302, 1.751166, 1.045196, 1, 1, 1, 1, 1,
-0.4042963, -0.03211337, -0.3770647, 1, 1, 1, 1, 1,
-0.4027154, -0.06930516, -2.377394, 1, 1, 1, 1, 1,
-0.3950886, -0.3547192, -2.10819, 1, 1, 1, 1, 1,
-0.3941036, -0.2580912, -0.1842121, 1, 1, 1, 1, 1,
-0.3875163, 1.16503, -0.848002, 1, 1, 1, 1, 1,
-0.3831287, 0.7975369, 0.1563842, 1, 1, 1, 1, 1,
-0.3809813, 0.8945327, 1.280151, 1, 1, 1, 1, 1,
-0.3786592, 0.09063434, -1.820001, 1, 1, 1, 1, 1,
-0.3769512, -0.1827342, -0.7478554, 0, 0, 1, 1, 1,
-0.3742211, -0.5610593, 0.7997947, 1, 0, 0, 1, 1,
-0.3722085, -1.37646, -3.189142, 1, 0, 0, 1, 1,
-0.3708124, 0.8747438, 0.9329762, 1, 0, 0, 1, 1,
-0.3647942, 1.180713, -1.502876, 1, 0, 0, 1, 1,
-0.3644013, -1.687511, -3.156469, 1, 0, 0, 1, 1,
-0.3569585, -0.2032897, -1.838391, 0, 0, 0, 1, 1,
-0.3520162, -0.3299755, -2.540956, 0, 0, 0, 1, 1,
-0.3512215, 0.2680739, 1.529415, 0, 0, 0, 1, 1,
-0.3497281, 0.9169068, -0.7673926, 0, 0, 0, 1, 1,
-0.3469404, -1.55254, -3.088789, 0, 0, 0, 1, 1,
-0.3430062, -0.2634506, -2.70023, 0, 0, 0, 1, 1,
-0.3423765, 1.063537, -1.013605, 0, 0, 0, 1, 1,
-0.3423283, -0.3375609, -1.823913, 1, 1, 1, 1, 1,
-0.3400644, -1.988809, -3.854231, 1, 1, 1, 1, 1,
-0.3395988, 0.5013815, -0.7284279, 1, 1, 1, 1, 1,
-0.3392423, 0.2655105, -1.164078, 1, 1, 1, 1, 1,
-0.3378279, 1.658403, 0.1006521, 1, 1, 1, 1, 1,
-0.3363346, -1.250191, -4.274445, 1, 1, 1, 1, 1,
-0.3344313, 1.535128, 0.1453021, 1, 1, 1, 1, 1,
-0.3203065, -0.7239028, -3.136141, 1, 1, 1, 1, 1,
-0.319264, 0.3059071, -1.054513, 1, 1, 1, 1, 1,
-0.3185743, -0.878513, -3.328279, 1, 1, 1, 1, 1,
-0.3100995, -0.2919234, -1.37773, 1, 1, 1, 1, 1,
-0.3100505, 0.372908, -2.274487, 1, 1, 1, 1, 1,
-0.3063858, -0.5040175, -0.9859132, 1, 1, 1, 1, 1,
-0.3061917, 0.0286478, 0.3902508, 1, 1, 1, 1, 1,
-0.3025322, -0.6537728, -5.034654, 1, 1, 1, 1, 1,
-0.3008761, 0.0418, -2.63085, 0, 0, 1, 1, 1,
-0.2987813, 0.7862993, -1.388776, 1, 0, 0, 1, 1,
-0.2955137, 1.243947, -1.959371, 1, 0, 0, 1, 1,
-0.2947267, 0.5651932, 0.249056, 1, 0, 0, 1, 1,
-0.294542, 1.061545, -0.2818431, 1, 0, 0, 1, 1,
-0.2894821, -1.077566, -4.027371, 1, 0, 0, 1, 1,
-0.2851427, 0.6334112, -0.3238803, 0, 0, 0, 1, 1,
-0.2841369, 0.4672037, -1.202317, 0, 0, 0, 1, 1,
-0.2832598, 1.51517, -1.511052, 0, 0, 0, 1, 1,
-0.2753829, 0.5351476, -1.571003, 0, 0, 0, 1, 1,
-0.268407, -0.8125933, -1.958686, 0, 0, 0, 1, 1,
-0.2673619, 0.2816103, -1.863769, 0, 0, 0, 1, 1,
-0.265895, 0.9431645, -1.356853, 0, 0, 0, 1, 1,
-0.2644412, 0.3396816, -1.31492, 1, 1, 1, 1, 1,
-0.2643807, -1.194883, -2.3159, 1, 1, 1, 1, 1,
-0.2637, 0.7336586, 0.3619701, 1, 1, 1, 1, 1,
-0.2618022, 3.01283, -1.063151, 1, 1, 1, 1, 1,
-0.2533484, -0.01787107, -2.067585, 1, 1, 1, 1, 1,
-0.2500936, -0.8229817, -4.417094, 1, 1, 1, 1, 1,
-0.2487463, -0.1834969, -0.7998558, 1, 1, 1, 1, 1,
-0.2486821, -0.5888227, -2.848232, 1, 1, 1, 1, 1,
-0.2471137, -0.3596279, -3.350961, 1, 1, 1, 1, 1,
-0.2416243, 0.1192471, -0.6809462, 1, 1, 1, 1, 1,
-0.2415019, 1.779979, 0.1020819, 1, 1, 1, 1, 1,
-0.2395695, 0.494377, -0.6791242, 1, 1, 1, 1, 1,
-0.23722, 1.445523, -0.2639692, 1, 1, 1, 1, 1,
-0.236791, -2.171263, -4.082639, 1, 1, 1, 1, 1,
-0.235979, 0.05305308, -2.535398, 1, 1, 1, 1, 1,
-0.2339359, -0.3527695, -1.533949, 0, 0, 1, 1, 1,
-0.2277996, -0.5622483, -2.771731, 1, 0, 0, 1, 1,
-0.2268488, -1.314296, -3.042841, 1, 0, 0, 1, 1,
-0.2267209, 0.60721, -0.3826289, 1, 0, 0, 1, 1,
-0.2246535, 0.1794161, -1.196524, 1, 0, 0, 1, 1,
-0.2196165, -1.859981, -1.95901, 1, 0, 0, 1, 1,
-0.2153075, 1.821096, 0.3272353, 0, 0, 0, 1, 1,
-0.2139647, -0.5732274, -2.125169, 0, 0, 0, 1, 1,
-0.211635, -0.5833996, -2.807329, 0, 0, 0, 1, 1,
-0.2070187, -0.6366425, -4.686301, 0, 0, 0, 1, 1,
-0.2023593, 2.024155, -0.6118491, 0, 0, 0, 1, 1,
-0.200464, 0.7509526, 0.3837488, 0, 0, 0, 1, 1,
-0.1976787, -0.5025526, -2.901482, 0, 0, 0, 1, 1,
-0.193404, -0.5384174, -2.763691, 1, 1, 1, 1, 1,
-0.1925387, 0.9869714, 0.4258048, 1, 1, 1, 1, 1,
-0.1918023, 0.3867551, -2.439827, 1, 1, 1, 1, 1,
-0.1844102, -1.673286, -3.836448, 1, 1, 1, 1, 1,
-0.1842377, -0.6612847, -1.789265, 1, 1, 1, 1, 1,
-0.1839724, -0.3206877, -2.594673, 1, 1, 1, 1, 1,
-0.1759782, -0.222916, -1.932283, 1, 1, 1, 1, 1,
-0.1746121, 1.00494, 0.2576477, 1, 1, 1, 1, 1,
-0.1687013, -0.1617175, -4.334261, 1, 1, 1, 1, 1,
-0.1670344, -1.07089, -1.850275, 1, 1, 1, 1, 1,
-0.16511, 0.2704509, 1.142884, 1, 1, 1, 1, 1,
-0.1640444, -0.4675507, -2.648232, 1, 1, 1, 1, 1,
-0.1639918, -0.6328922, -2.850971, 1, 1, 1, 1, 1,
-0.1623868, -0.1297803, -2.500712, 1, 1, 1, 1, 1,
-0.1614987, 2.444835, -0.08468652, 1, 1, 1, 1, 1,
-0.1608997, 0.9096979, -0.9030033, 0, 0, 1, 1, 1,
-0.1543833, 0.5960603, -0.8948108, 1, 0, 0, 1, 1,
-0.1542464, 0.8299197, -1.397807, 1, 0, 0, 1, 1,
-0.1525165, 1.288914, -0.06880189, 1, 0, 0, 1, 1,
-0.1519955, 0.4187593, 0.7991854, 1, 0, 0, 1, 1,
-0.1512245, -1.185599, -4.384032, 1, 0, 0, 1, 1,
-0.1505961, 1.546916, 0.2556669, 0, 0, 0, 1, 1,
-0.1499618, -1.049555, -3.445772, 0, 0, 0, 1, 1,
-0.1480869, -0.2316708, -4.47443, 0, 0, 0, 1, 1,
-0.1473498, -0.3100316, -2.936996, 0, 0, 0, 1, 1,
-0.1463881, 0.02464046, -0.9970731, 0, 0, 0, 1, 1,
-0.1410984, 0.242411, -0.770844, 0, 0, 0, 1, 1,
-0.1407448, 0.3767576, -0.1896408, 0, 0, 0, 1, 1,
-0.1365065, -0.6010348, -2.724157, 1, 1, 1, 1, 1,
-0.1342671, -0.693583, -2.552471, 1, 1, 1, 1, 1,
-0.1340713, -0.4324156, -3.070317, 1, 1, 1, 1, 1,
-0.1332902, 2.096406, -1.921924, 1, 1, 1, 1, 1,
-0.1331721, -0.05018701, -2.427073, 1, 1, 1, 1, 1,
-0.1330779, 2.933158, -0.9335877, 1, 1, 1, 1, 1,
-0.1278386, -0.4556244, -3.90917, 1, 1, 1, 1, 1,
-0.1271428, -0.5354421, -4.56632, 1, 1, 1, 1, 1,
-0.1269081, -0.5763248, -2.860671, 1, 1, 1, 1, 1,
-0.1246912, -0.004171003, 0.7546303, 1, 1, 1, 1, 1,
-0.1230321, -2.047394, -3.775672, 1, 1, 1, 1, 1,
-0.1209648, -0.4912875, -3.901552, 1, 1, 1, 1, 1,
-0.1197633, 0.3062364, 1.164952, 1, 1, 1, 1, 1,
-0.113048, -3.495901, -2.954676, 1, 1, 1, 1, 1,
-0.110207, -0.1963625, -1.483796, 1, 1, 1, 1, 1,
-0.1079789, -0.2011386, -3.616909, 0, 0, 1, 1, 1,
-0.1061071, -1.294871, -4.386904, 1, 0, 0, 1, 1,
-0.1032815, 0.4328617, 0.3424555, 1, 0, 0, 1, 1,
-0.0958454, 1.266389, 0.08045104, 1, 0, 0, 1, 1,
-0.0904353, 2.521803, 0.06924109, 1, 0, 0, 1, 1,
-0.08410475, -1.115005, -4.028628, 1, 0, 0, 1, 1,
-0.08060357, 0.5419807, 0.5909758, 0, 0, 0, 1, 1,
-0.07986142, -2.360855, -2.571586, 0, 0, 0, 1, 1,
-0.07939021, -1.176503, -1.4077, 0, 0, 0, 1, 1,
-0.07525127, -0.08451805, -1.682179, 0, 0, 0, 1, 1,
-0.07322932, -1.10382, -2.745843, 0, 0, 0, 1, 1,
-0.06864603, 0.7186896, 0.5766592, 0, 0, 0, 1, 1,
-0.0613021, 0.01906734, -1.401795, 0, 0, 0, 1, 1,
-0.06092171, -0.8067264, -2.16395, 1, 1, 1, 1, 1,
-0.06005766, 0.255437, 0.7105511, 1, 1, 1, 1, 1,
-0.05966927, 0.6429451, 1.079683, 1, 1, 1, 1, 1,
-0.05955721, 0.5474918, 1.553805, 1, 1, 1, 1, 1,
-0.05930623, -0.3592583, -3.695068, 1, 1, 1, 1, 1,
-0.05910847, 1.73974, 0.7432581, 1, 1, 1, 1, 1,
-0.05792249, -0.7626213, -3.573064, 1, 1, 1, 1, 1,
-0.04633032, 0.6020381, -0.6905768, 1, 1, 1, 1, 1,
-0.04133488, 1.583096, 1.853875, 1, 1, 1, 1, 1,
-0.03584787, 0.004785091, -0.03883301, 1, 1, 1, 1, 1,
-0.03335029, 0.4567591, 0.226468, 1, 1, 1, 1, 1,
-0.03267492, 0.8926117, 1.296044, 1, 1, 1, 1, 1,
-0.03025545, 0.8269353, 1.007144, 1, 1, 1, 1, 1,
-0.02894804, 0.6699364, 0.6166303, 1, 1, 1, 1, 1,
-0.01619038, 1.686723, -0.003342634, 1, 1, 1, 1, 1,
-0.01549466, 1.674174, -0.7994301, 0, 0, 1, 1, 1,
-0.01433432, 0.09593777, -1.051302, 1, 0, 0, 1, 1,
-0.01416391, 0.213351, 0.6207985, 1, 0, 0, 1, 1,
-0.01169757, 0.8922142, -0.1632315, 1, 0, 0, 1, 1,
-0.004024031, 0.1885318, 1.704616, 1, 0, 0, 1, 1,
-0.003626695, 1.188474, -1.425636, 1, 0, 0, 1, 1,
-0.00321453, -0.8906118, -2.957386, 0, 0, 0, 1, 1,
-0.00292252, 1.518936, -0.1296856, 0, 0, 0, 1, 1,
-0.002806517, -0.3802747, -4.599613, 0, 0, 0, 1, 1,
-0.002107028, 0.03724321, -1.245856, 0, 0, 0, 1, 1,
-0.001593799, 0.1842877, 1.924704, 0, 0, 0, 1, 1,
0.0005081227, 0.1299258, -0.005656427, 0, 0, 0, 1, 1,
0.0007995485, -2.185406, 3.245412, 0, 0, 0, 1, 1,
0.002078384, 2.241492, 0.2654233, 1, 1, 1, 1, 1,
0.003070893, 0.3202586, 0.8870484, 1, 1, 1, 1, 1,
0.003789494, -2.001618, 2.960155, 1, 1, 1, 1, 1,
0.006748429, 2.074792, 0.1482622, 1, 1, 1, 1, 1,
0.00676584, -0.1187857, 2.683083, 1, 1, 1, 1, 1,
0.007361059, -0.1699554, 3.909892, 1, 1, 1, 1, 1,
0.009168281, -0.6656729, 2.355157, 1, 1, 1, 1, 1,
0.01173283, 1.820942, 0.379922, 1, 1, 1, 1, 1,
0.01178249, 0.1309334, -2.719061, 1, 1, 1, 1, 1,
0.01237123, 1.350309, 1.133706, 1, 1, 1, 1, 1,
0.01534234, -1.080233, 1.929331, 1, 1, 1, 1, 1,
0.01661391, -2.623808, 4.128144, 1, 1, 1, 1, 1,
0.01919131, 0.06423201, -0.5738913, 1, 1, 1, 1, 1,
0.02201921, 0.3571193, -1.263662, 1, 1, 1, 1, 1,
0.02208746, 0.5702525, -1.142427, 1, 1, 1, 1, 1,
0.02986391, -0.2780124, 1.375704, 0, 0, 1, 1, 1,
0.0305993, -1.985159, 4.400267, 1, 0, 0, 1, 1,
0.03555538, 0.5724623, 0.8889486, 1, 0, 0, 1, 1,
0.03616959, 0.1361747, 1.237805, 1, 0, 0, 1, 1,
0.03628629, -0.2652186, 3.744538, 1, 0, 0, 1, 1,
0.04123924, 0.2752125, -1.891716, 1, 0, 0, 1, 1,
0.04421367, 0.451187, 0.5341352, 0, 0, 0, 1, 1,
0.04654998, -0.6196942, 2.814322, 0, 0, 0, 1, 1,
0.05209761, 0.6398208, 0.4178391, 0, 0, 0, 1, 1,
0.05557177, -1.0328, 1.804857, 0, 0, 0, 1, 1,
0.0582143, 0.7075289, 0.7861732, 0, 0, 0, 1, 1,
0.05865917, -1.420902, 1.549153, 0, 0, 0, 1, 1,
0.06181823, -0.6170394, 3.158004, 0, 0, 0, 1, 1,
0.06650695, 2.49158, 0.2472461, 1, 1, 1, 1, 1,
0.06807137, -0.2279483, 4.591732, 1, 1, 1, 1, 1,
0.06808908, 0.2799757, 0.5222859, 1, 1, 1, 1, 1,
0.06832135, 1.074423, 0.8435747, 1, 1, 1, 1, 1,
0.07187229, -0.4938225, 4.018461, 1, 1, 1, 1, 1,
0.07378706, 0.05592786, -0.1412297, 1, 1, 1, 1, 1,
0.07420558, -1.267545, 2.008725, 1, 1, 1, 1, 1,
0.07481153, -0.1588765, 3.720354, 1, 1, 1, 1, 1,
0.07797885, -0.8572334, 2.542782, 1, 1, 1, 1, 1,
0.07957572, 0.09463155, 0.4826089, 1, 1, 1, 1, 1,
0.08536793, 0.984059, 1.56579, 1, 1, 1, 1, 1,
0.08859999, 1.411967, -2.446705, 1, 1, 1, 1, 1,
0.09455584, 1.922049, -0.8683173, 1, 1, 1, 1, 1,
0.1012524, 0.1523469, 0.9200854, 1, 1, 1, 1, 1,
0.1025019, -0.1524695, 2.710602, 1, 1, 1, 1, 1,
0.109803, 0.05952529, -0.2659352, 0, 0, 1, 1, 1,
0.1123354, -2.618277, 3.295901, 1, 0, 0, 1, 1,
0.1173101, 0.3811582, 0.3903492, 1, 0, 0, 1, 1,
0.1184654, 0.2062343, 2.410365, 1, 0, 0, 1, 1,
0.1186715, -0.3320626, 1.970741, 1, 0, 0, 1, 1,
0.1282066, -0.31185, 2.641024, 1, 0, 0, 1, 1,
0.1343944, -3.305328, 4.533565, 0, 0, 0, 1, 1,
0.137663, -1.19129, 3.579602, 0, 0, 0, 1, 1,
0.1401318, 2.654005, 2.374995, 0, 0, 0, 1, 1,
0.1435636, -1.725745, 1.637124, 0, 0, 0, 1, 1,
0.1449203, 0.9154515, -0.1722595, 0, 0, 0, 1, 1,
0.1515289, 0.942075, -0.3050842, 0, 0, 0, 1, 1,
0.1523522, -0.754945, 3.723935, 0, 0, 0, 1, 1,
0.1536169, -0.8477037, 3.529021, 1, 1, 1, 1, 1,
0.1557989, 0.2654194, 0.8272035, 1, 1, 1, 1, 1,
0.1559577, -0.3760332, 3.337323, 1, 1, 1, 1, 1,
0.1576086, 1.373252, -1.168776, 1, 1, 1, 1, 1,
0.1577466, -0.3036799, 2.141476, 1, 1, 1, 1, 1,
0.1603725, -0.9919813, 3.325601, 1, 1, 1, 1, 1,
0.1660259, 0.9232375, 0.6674673, 1, 1, 1, 1, 1,
0.1674984, 0.04724671, 1.654064, 1, 1, 1, 1, 1,
0.1731572, -1.454294, 2.894136, 1, 1, 1, 1, 1,
0.1824204, -0.3106036, 2.26819, 1, 1, 1, 1, 1,
0.1842132, 0.9652618, -0.5503408, 1, 1, 1, 1, 1,
0.1861459, -0.7748447, 2.900206, 1, 1, 1, 1, 1,
0.1953127, -0.2786801, 3.40416, 1, 1, 1, 1, 1,
0.1976428, 0.3061282, -1.733701, 1, 1, 1, 1, 1,
0.1982616, -2.029436, 2.118496, 1, 1, 1, 1, 1,
0.2016776, 0.5491574, 1.095795, 0, 0, 1, 1, 1,
0.205887, -0.8079157, 2.363731, 1, 0, 0, 1, 1,
0.2060004, 1.902895, -0.9399805, 1, 0, 0, 1, 1,
0.2073921, 0.02240948, 4.037248, 1, 0, 0, 1, 1,
0.2082795, -0.1134469, 2.894211, 1, 0, 0, 1, 1,
0.2092653, 1.328516, 1.391748, 1, 0, 0, 1, 1,
0.2164137, 1.39672, -0.07412484, 0, 0, 0, 1, 1,
0.2209653, 0.5879336, -0.5859382, 0, 0, 0, 1, 1,
0.2217018, -1.284792, 3.668014, 0, 0, 0, 1, 1,
0.2299538, -1.484589, 0.763187, 0, 0, 0, 1, 1,
0.2305274, -0.7563127, 3.395604, 0, 0, 0, 1, 1,
0.2305582, 1.469173, -0.8721989, 0, 0, 0, 1, 1,
0.2319328, 1.414558, -0.9028509, 0, 0, 0, 1, 1,
0.2324662, -0.7285538, 3.439167, 1, 1, 1, 1, 1,
0.233568, -0.4646784, 3.76788, 1, 1, 1, 1, 1,
0.2344423, 0.2097512, 1.663296, 1, 1, 1, 1, 1,
0.2348406, -2.782346, 3.547787, 1, 1, 1, 1, 1,
0.2350255, -0.2946854, 2.764775, 1, 1, 1, 1, 1,
0.2350609, -0.7646077, 3.266743, 1, 1, 1, 1, 1,
0.2361517, 0.1909536, 0.8432839, 1, 1, 1, 1, 1,
0.2373352, -1.086658, 4.636181, 1, 1, 1, 1, 1,
0.2387597, 0.9012458, 0.639519, 1, 1, 1, 1, 1,
0.2389686, 0.3328571, -0.02524021, 1, 1, 1, 1, 1,
0.2400488, 0.8864605, 1.442912, 1, 1, 1, 1, 1,
0.2433193, -0.8636571, 4.061379, 1, 1, 1, 1, 1,
0.2470791, 0.01972716, 2.751896, 1, 1, 1, 1, 1,
0.2492178, -0.2606455, 2.949581, 1, 1, 1, 1, 1,
0.2538163, 1.885477, 2.053252, 1, 1, 1, 1, 1,
0.2561584, -0.3191604, 1.394151, 0, 0, 1, 1, 1,
0.2574763, 0.5423784, 0.7850328, 1, 0, 0, 1, 1,
0.266412, 1.86196, -0.1429455, 1, 0, 0, 1, 1,
0.2716815, -1.927487, 2.330744, 1, 0, 0, 1, 1,
0.2793269, 1.748135, 0.6195636, 1, 0, 0, 1, 1,
0.2855047, 0.3965632, 2.036161, 1, 0, 0, 1, 1,
0.2865834, 0.8824396, -0.8548585, 0, 0, 0, 1, 1,
0.2871388, -2.11038, 1.376288, 0, 0, 0, 1, 1,
0.2905363, -1.139363, 2.22192, 0, 0, 0, 1, 1,
0.2912239, -0.6123818, 2.9725, 0, 0, 0, 1, 1,
0.2944851, -0.3536126, 0.5554574, 0, 0, 0, 1, 1,
0.2981272, -0.3295422, 2.041302, 0, 0, 0, 1, 1,
0.2981552, -0.3921063, 2.330064, 0, 0, 0, 1, 1,
0.3010304, -0.5696091, 2.470774, 1, 1, 1, 1, 1,
0.3023075, 0.3782545, 1.54944, 1, 1, 1, 1, 1,
0.3041251, -0.178283, 0.7227721, 1, 1, 1, 1, 1,
0.3081951, 0.2112219, 2.90374, 1, 1, 1, 1, 1,
0.3124253, -0.1337885, 0.2224958, 1, 1, 1, 1, 1,
0.3257571, 0.3075293, -0.2915983, 1, 1, 1, 1, 1,
0.3283375, -0.7217522, 2.52377, 1, 1, 1, 1, 1,
0.3285143, 0.3926606, 0.5537434, 1, 1, 1, 1, 1,
0.3295915, 1.028331, 1.620614, 1, 1, 1, 1, 1,
0.3323242, 0.2422276, 1.596262, 1, 1, 1, 1, 1,
0.3355154, 0.822747, 1.756296, 1, 1, 1, 1, 1,
0.3359518, -0.560059, 2.31262, 1, 1, 1, 1, 1,
0.3377029, 0.3969097, -0.2083246, 1, 1, 1, 1, 1,
0.3385564, -1.101714, 2.661457, 1, 1, 1, 1, 1,
0.3411816, -0.3482202, 1.628324, 1, 1, 1, 1, 1,
0.3450815, -0.9577297, 1.832461, 0, 0, 1, 1, 1,
0.3519688, -2.292604, 2.476951, 1, 0, 0, 1, 1,
0.3544246, -1.191769, 4.385304, 1, 0, 0, 1, 1,
0.3574393, 0.639153, -1.254437, 1, 0, 0, 1, 1,
0.3604038, -1.030314, 3.941125, 1, 0, 0, 1, 1,
0.3621923, -1.003713, 2.302948, 1, 0, 0, 1, 1,
0.3647891, -0.3042063, 1.854749, 0, 0, 0, 1, 1,
0.3671117, 1.068341, 0.03893937, 0, 0, 0, 1, 1,
0.3700571, -0.701458, 2.48093, 0, 0, 0, 1, 1,
0.3733822, 0.471525, 0.355648, 0, 0, 0, 1, 1,
0.3791538, 1.502826, 1.574084, 0, 0, 0, 1, 1,
0.383334, 0.38448, 0.3218211, 0, 0, 0, 1, 1,
0.3851181, -0.4818694, 2.270573, 0, 0, 0, 1, 1,
0.3889784, -1.094063, 3.057152, 1, 1, 1, 1, 1,
0.3921365, 1.590239, 0.4616857, 1, 1, 1, 1, 1,
0.3925794, -1.69864, 3.957081, 1, 1, 1, 1, 1,
0.3935238, 1.554584, 0.6488767, 1, 1, 1, 1, 1,
0.3997413, 0.360074, -0.2519478, 1, 1, 1, 1, 1,
0.4025535, -1.2134, 2.894394, 1, 1, 1, 1, 1,
0.4092761, 0.4096519, 2.116479, 1, 1, 1, 1, 1,
0.4114735, 0.3163572, -0.07790635, 1, 1, 1, 1, 1,
0.4159627, -0.1767124, 2.125174, 1, 1, 1, 1, 1,
0.4179222, -0.8558394, 3.56776, 1, 1, 1, 1, 1,
0.4200331, -0.8502333, 2.741391, 1, 1, 1, 1, 1,
0.4208564, -0.5390108, 2.523639, 1, 1, 1, 1, 1,
0.4229723, 0.7810482, 0.7407028, 1, 1, 1, 1, 1,
0.4242002, 0.3509669, 1.002469, 1, 1, 1, 1, 1,
0.4271264, 0.7139467, 0.1873093, 1, 1, 1, 1, 1,
0.4283177, 0.6219067, 0.6345926, 0, 0, 1, 1, 1,
0.4286699, -1.465796, 3.211095, 1, 0, 0, 1, 1,
0.4299313, -0.5766612, 1.430977, 1, 0, 0, 1, 1,
0.4315394, 0.9338689, -0.1564414, 1, 0, 0, 1, 1,
0.4320288, -0.5248304, 2.995365, 1, 0, 0, 1, 1,
0.4365227, 0.7525291, 0.4883848, 1, 0, 0, 1, 1,
0.4379789, 1.101615, 0.6773401, 0, 0, 0, 1, 1,
0.4380952, 1.251759, -0.551003, 0, 0, 0, 1, 1,
0.4387443, -0.7797301, 2.455887, 0, 0, 0, 1, 1,
0.4415033, -2.454328, 1.933973, 0, 0, 0, 1, 1,
0.441919, -0.09286267, 2.529131, 0, 0, 0, 1, 1,
0.4432065, 2.159586, 2.573423, 0, 0, 0, 1, 1,
0.4456885, -0.3640109, 1.688048, 0, 0, 0, 1, 1,
0.4477497, -0.4875613, 3.088499, 1, 1, 1, 1, 1,
0.4481587, -0.08776852, 1.570777, 1, 1, 1, 1, 1,
0.4514199, 0.5800736, 0.8802083, 1, 1, 1, 1, 1,
0.4514526, 0.5822431, 2.162559, 1, 1, 1, 1, 1,
0.4523401, -0.6544635, 2.350342, 1, 1, 1, 1, 1,
0.4641341, -0.8703303, 2.134079, 1, 1, 1, 1, 1,
0.4668803, -0.6389328, 2.11158, 1, 1, 1, 1, 1,
0.4709538, -0.7982025, 3.530221, 1, 1, 1, 1, 1,
0.4766416, 0.09280095, 0.6835312, 1, 1, 1, 1, 1,
0.4770872, -2.545315, 3.766004, 1, 1, 1, 1, 1,
0.4837655, 0.2355233, 0.4823973, 1, 1, 1, 1, 1,
0.4846654, 1.591814, 0.009053488, 1, 1, 1, 1, 1,
0.4847337, 0.8843502, 1.083532, 1, 1, 1, 1, 1,
0.4901439, 1.137772, 0.0266476, 1, 1, 1, 1, 1,
0.4954792, 1.169273, 2.218167, 1, 1, 1, 1, 1,
0.4969055, -0.4142973, 3.477642, 0, 0, 1, 1, 1,
0.5018367, 1.914158, 0.3295981, 1, 0, 0, 1, 1,
0.5026313, -0.3681115, 2.608896, 1, 0, 0, 1, 1,
0.5032498, -0.4553409, 2.392274, 1, 0, 0, 1, 1,
0.5126919, -0.32931, 4.034705, 1, 0, 0, 1, 1,
0.5144408, 1.405418, -0.3198862, 1, 0, 0, 1, 1,
0.5154925, -1.176103, 3.606062, 0, 0, 0, 1, 1,
0.5180328, -0.1040605, 1.656301, 0, 0, 0, 1, 1,
0.5180402, 0.9948329, -1.295855, 0, 0, 0, 1, 1,
0.5182438, -0.5290512, 1.562133, 0, 0, 0, 1, 1,
0.5224787, -0.9330211, 3.733292, 0, 0, 0, 1, 1,
0.5225669, -0.03455465, 1.265529, 0, 0, 0, 1, 1,
0.5233883, -0.9052247, 3.356208, 0, 0, 0, 1, 1,
0.5280834, -0.9881093, 2.990952, 1, 1, 1, 1, 1,
0.5294906, -0.3782713, 2.511598, 1, 1, 1, 1, 1,
0.5344252, 1.281352, 0.8362804, 1, 1, 1, 1, 1,
0.5345923, 0.5145735, 0.9018976, 1, 1, 1, 1, 1,
0.5368026, -0.2984045, -0.1486601, 1, 1, 1, 1, 1,
0.5382936, 2.259956, 1.927698, 1, 1, 1, 1, 1,
0.5397676, -0.7998921, 2.301279, 1, 1, 1, 1, 1,
0.5400771, 1.066949, 0.263583, 1, 1, 1, 1, 1,
0.5431048, 0.09927677, 2.404725, 1, 1, 1, 1, 1,
0.5439949, 0.1868556, 1.534818, 1, 1, 1, 1, 1,
0.5442627, -0.2091787, 0.9743285, 1, 1, 1, 1, 1,
0.5472094, 0.1452125, 0.5429187, 1, 1, 1, 1, 1,
0.5477622, 1.369112, -0.7515288, 1, 1, 1, 1, 1,
0.5483407, -0.1089019, 1.446233, 1, 1, 1, 1, 1,
0.5573792, -1.439985, 2.564974, 1, 1, 1, 1, 1,
0.5608023, -0.6669275, 2.438398, 0, 0, 1, 1, 1,
0.5635425, 1.064715, 0.4546395, 1, 0, 0, 1, 1,
0.564908, -1.715663, 3.626721, 1, 0, 0, 1, 1,
0.5688897, 0.8202676, -0.7017901, 1, 0, 0, 1, 1,
0.5692437, 0.4159216, 0.02096753, 1, 0, 0, 1, 1,
0.5726999, 1.494584, 1.006903, 1, 0, 0, 1, 1,
0.5738042, -1.048901, 1.029383, 0, 0, 0, 1, 1,
0.5741796, -0.5988362, 2.404723, 0, 0, 0, 1, 1,
0.5775009, -0.5963579, 3.295541, 0, 0, 0, 1, 1,
0.5781448, -1.448828, 2.412124, 0, 0, 0, 1, 1,
0.5797458, 1.956001, 0.7811916, 0, 0, 0, 1, 1,
0.5806226, 1.646515, 1.762113, 0, 0, 0, 1, 1,
0.5824483, 2.301174, -1.188718, 0, 0, 0, 1, 1,
0.5828365, -0.01598997, 2.224462, 1, 1, 1, 1, 1,
0.5829008, -0.0676434, 2.296992, 1, 1, 1, 1, 1,
0.6147597, -0.377202, 1.357049, 1, 1, 1, 1, 1,
0.6151394, 0.618643, 0.526682, 1, 1, 1, 1, 1,
0.6219949, 0.07815696, 2.393762, 1, 1, 1, 1, 1,
0.6283619, 0.6419044, 1.967826, 1, 1, 1, 1, 1,
0.6296538, 0.5380015, 0.9983534, 1, 1, 1, 1, 1,
0.6368535, -0.5582942, 3.49805, 1, 1, 1, 1, 1,
0.6379119, -0.4414133, 3.168793, 1, 1, 1, 1, 1,
0.6382266, 0.3406272, 0.857699, 1, 1, 1, 1, 1,
0.6470619, -0.4714726, 2.761475, 1, 1, 1, 1, 1,
0.6479119, -1.076967, 2.391988, 1, 1, 1, 1, 1,
0.6509997, 0.01220375, 2.509615, 1, 1, 1, 1, 1,
0.657141, 0.1417453, 2.487459, 1, 1, 1, 1, 1,
0.6571844, -0.780276, 1.548728, 1, 1, 1, 1, 1,
0.6592352, 0.5638453, 1.137823, 0, 0, 1, 1, 1,
0.6592613, -1.05779, 2.881018, 1, 0, 0, 1, 1,
0.663482, -1.179426, 3.019586, 1, 0, 0, 1, 1,
0.6660907, 1.055326, 0.7039993, 1, 0, 0, 1, 1,
0.6691596, 0.3184723, 2.140229, 1, 0, 0, 1, 1,
0.673839, 0.2184971, -0.3933065, 1, 0, 0, 1, 1,
0.6815741, 2.039905, 1.585654, 0, 0, 0, 1, 1,
0.6825839, -0.3947378, 0.630563, 0, 0, 0, 1, 1,
0.6839346, -0.4781713, 2.797055, 0, 0, 0, 1, 1,
0.6857742, 0.2960177, 1.207927, 0, 0, 0, 1, 1,
0.6859851, 0.7755434, -0.01507613, 0, 0, 0, 1, 1,
0.6875949, -1.241318, 1.953055, 0, 0, 0, 1, 1,
0.6906801, 1.521814, 1.98365, 0, 0, 0, 1, 1,
0.6945722, -1.034494, 2.470063, 1, 1, 1, 1, 1,
0.7006635, -0.6004871, 3.149145, 1, 1, 1, 1, 1,
0.7054505, 1.076011, 0.1389323, 1, 1, 1, 1, 1,
0.7063331, -0.2627503, 2.998622, 1, 1, 1, 1, 1,
0.707035, 0.7100215, 1.719393, 1, 1, 1, 1, 1,
0.7232512, -0.06340471, 2.464478, 1, 1, 1, 1, 1,
0.7245275, 1.142188, -0.5806749, 1, 1, 1, 1, 1,
0.7306384, 0.712705, 0.8869114, 1, 1, 1, 1, 1,
0.7332817, -0.085535, 1.017524, 1, 1, 1, 1, 1,
0.7374967, -0.3577388, 2.081149, 1, 1, 1, 1, 1,
0.7397037, -1.532522, 2.123658, 1, 1, 1, 1, 1,
0.7490384, -0.6941831, 2.038679, 1, 1, 1, 1, 1,
0.7501991, 0.9043685, -1.003381, 1, 1, 1, 1, 1,
0.750601, -0.4989251, 1.643263, 1, 1, 1, 1, 1,
0.7514665, -0.08146212, 0.8442677, 1, 1, 1, 1, 1,
0.7518026, 0.1637991, 0.7075328, 0, 0, 1, 1, 1,
0.7558216, -1.244596, 1.628151, 1, 0, 0, 1, 1,
0.7569047, -0.7714434, 2.420817, 1, 0, 0, 1, 1,
0.7596723, -1.429163, 1.828791, 1, 0, 0, 1, 1,
0.7642017, 1.718129, -0.7577553, 1, 0, 0, 1, 1,
0.7686945, 1.153264, 0.04327961, 1, 0, 0, 1, 1,
0.7811279, -0.1949397, 1.319522, 0, 0, 0, 1, 1,
0.7813112, -1.566047, 2.1298, 0, 0, 0, 1, 1,
0.7828297, 0.7020938, 0.5342892, 0, 0, 0, 1, 1,
0.7907163, 0.1241779, 0.8993294, 0, 0, 0, 1, 1,
0.7922692, 1.635687, -0.2227119, 0, 0, 0, 1, 1,
0.7941706, 1.130246, -1.029819, 0, 0, 0, 1, 1,
0.7951251, -1.437297, 1.815757, 0, 0, 0, 1, 1,
0.797895, -0.09731103, 0.6830854, 1, 1, 1, 1, 1,
0.8005789, 1.37541, 0.8584977, 1, 1, 1, 1, 1,
0.8078025, 0.2592201, -0.2993601, 1, 1, 1, 1, 1,
0.8120407, 0.4381362, -0.2403501, 1, 1, 1, 1, 1,
0.8223242, -1.184599, 2.067693, 1, 1, 1, 1, 1,
0.8242068, -0.9229017, 3.957571, 1, 1, 1, 1, 1,
0.8276827, -0.2406341, 2.311389, 1, 1, 1, 1, 1,
0.8277497, 0.2984843, 1.945493, 1, 1, 1, 1, 1,
0.8313208, -0.7466134, 3.203111, 1, 1, 1, 1, 1,
0.837137, 0.06529386, 1.47591, 1, 1, 1, 1, 1,
0.8426626, -0.273231, 1.368417, 1, 1, 1, 1, 1,
0.8428423, 0.4702875, 0.4713639, 1, 1, 1, 1, 1,
0.8470566, -1.039541, 1.752563, 1, 1, 1, 1, 1,
0.8480759, -1.235687, 0.8796861, 1, 1, 1, 1, 1,
0.8510872, 0.4244545, 2.701273, 1, 1, 1, 1, 1,
0.8514704, -1.046284, 3.582327, 0, 0, 1, 1, 1,
0.8563182, 0.134289, 1.989017, 1, 0, 0, 1, 1,
0.8694372, 0.009732179, 0.9884465, 1, 0, 0, 1, 1,
0.8721085, 1.336302, -0.1079576, 1, 0, 0, 1, 1,
0.8738264, 0.3811697, 1.670033, 1, 0, 0, 1, 1,
0.8741214, -0.3023906, 0.9633518, 1, 0, 0, 1, 1,
0.877455, -1.24478, 2.223119, 0, 0, 0, 1, 1,
0.8797857, -1.37924, 4.241065, 0, 0, 0, 1, 1,
0.8827774, -0.5718976, 1.552117, 0, 0, 0, 1, 1,
0.886277, 0.4978541, 2.681643, 0, 0, 0, 1, 1,
0.8864126, -0.030407, 0.8806482, 0, 0, 0, 1, 1,
0.8893425, 0.6705503, 0.02120046, 0, 0, 0, 1, 1,
0.8904002, 0.6060191, 0.7216166, 0, 0, 0, 1, 1,
0.8938512, 1.314823, 1.326493, 1, 1, 1, 1, 1,
0.8954841, -0.5030938, 1.777015, 1, 1, 1, 1, 1,
0.8981069, 0.8492917, -0.8424706, 1, 1, 1, 1, 1,
0.901668, 0.3463269, 1.114211, 1, 1, 1, 1, 1,
0.9017999, 0.2416838, 1.576558, 1, 1, 1, 1, 1,
0.903909, -0.1446458, 1.163191, 1, 1, 1, 1, 1,
0.9055777, 0.6160738, 1.680988, 1, 1, 1, 1, 1,
0.9078611, 0.1287061, 0.8908718, 1, 1, 1, 1, 1,
0.9116179, -0.1525134, 1.688808, 1, 1, 1, 1, 1,
0.9132494, 0.796665, 1.012756, 1, 1, 1, 1, 1,
0.9143987, -0.4809777, 3.127512, 1, 1, 1, 1, 1,
0.9182841, -0.9381918, 4.076204, 1, 1, 1, 1, 1,
0.9230582, 1.419333, 1.329116, 1, 1, 1, 1, 1,
0.9232566, -0.8139993, 3.085415, 1, 1, 1, 1, 1,
0.9255999, 1.079812, 0.1490553, 1, 1, 1, 1, 1,
0.9292861, -0.3936768, 1.963106, 0, 0, 1, 1, 1,
0.9340378, 2.158115, 2.189252, 1, 0, 0, 1, 1,
0.9458036, -1.312512, 2.749009, 1, 0, 0, 1, 1,
0.9546642, 0.9809767, 1.693927, 1, 0, 0, 1, 1,
0.9547305, 0.5522125, 0.4066502, 1, 0, 0, 1, 1,
0.9556084, -1.816016, 3.649104, 1, 0, 0, 1, 1,
0.9583569, -0.6739374, 3.4345, 0, 0, 0, 1, 1,
0.9657125, -0.6307585, 3.532869, 0, 0, 0, 1, 1,
0.9663765, -0.01838582, 2.341665, 0, 0, 0, 1, 1,
0.9675151, -0.1016126, 0.9958423, 0, 0, 0, 1, 1,
0.9707608, -1.199458, 1.827792, 0, 0, 0, 1, 1,
0.9715334, -1.146219, 3.135392, 0, 0, 0, 1, 1,
0.9723682, -0.9289756, 1.622905, 0, 0, 0, 1, 1,
0.9748007, 0.5613105, 0.9964305, 1, 1, 1, 1, 1,
0.9821345, -1.154906, 2.669413, 1, 1, 1, 1, 1,
0.9854649, -0.3963164, 1.021609, 1, 1, 1, 1, 1,
0.9919996, -0.2699169, 0.3258896, 1, 1, 1, 1, 1,
0.9930471, -0.4246551, 2.158428, 1, 1, 1, 1, 1,
0.993397, 1.210882, 0.3803196, 1, 1, 1, 1, 1,
0.9953306, -3.636022, 2.378558, 1, 1, 1, 1, 1,
1.008513, 0.1325449, 1.98961, 1, 1, 1, 1, 1,
1.008578, -1.269956, 2.769792, 1, 1, 1, 1, 1,
1.010249, -0.4268304, 3.766634, 1, 1, 1, 1, 1,
1.012894, 0.3782527, 1.678107, 1, 1, 1, 1, 1,
1.01911, 0.7538106, -0.766556, 1, 1, 1, 1, 1,
1.021789, 0.8631701, -0.5138301, 1, 1, 1, 1, 1,
1.021946, -1.811055, 2.078632, 1, 1, 1, 1, 1,
1.022553, -0.1085596, 2.544161, 1, 1, 1, 1, 1,
1.035945, -0.2955909, 1.209703, 0, 0, 1, 1, 1,
1.03828, -0.3997292, 1.819448, 1, 0, 0, 1, 1,
1.041887, 0.173973, 2.020967, 1, 0, 0, 1, 1,
1.043776, 1.095133, -0.05940165, 1, 0, 0, 1, 1,
1.045745, -0.7353764, 1.083699, 1, 0, 0, 1, 1,
1.05772, -0.03681391, 0.9653633, 1, 0, 0, 1, 1,
1.064408, 0.9821333, 2.960906, 0, 0, 0, 1, 1,
1.069703, -0.9287445, 1.428811, 0, 0, 0, 1, 1,
1.074164, 0.7468743, 1.391805, 0, 0, 0, 1, 1,
1.074704, -0.9013007, 0.8536482, 0, 0, 0, 1, 1,
1.074967, 1.140902, 0.2536877, 0, 0, 0, 1, 1,
1.075334, -0.04895664, 0.4142346, 0, 0, 0, 1, 1,
1.076224, 2.072051, 0.9353411, 0, 0, 0, 1, 1,
1.08389, 0.6403591, 0.1372635, 1, 1, 1, 1, 1,
1.084763, 1.615338, -0.7415376, 1, 1, 1, 1, 1,
1.085595, -0.9672493, 3.104827, 1, 1, 1, 1, 1,
1.085922, -0.735354, 2.930519, 1, 1, 1, 1, 1,
1.086565, -0.6083894, 0.5622854, 1, 1, 1, 1, 1,
1.092592, 1.189099, 1.483258, 1, 1, 1, 1, 1,
1.093079, -0.5739753, -0.4485356, 1, 1, 1, 1, 1,
1.097831, -0.6305546, 0.9759679, 1, 1, 1, 1, 1,
1.099623, -0.4939789, 1.071919, 1, 1, 1, 1, 1,
1.100002, 0.3261879, 1.859258, 1, 1, 1, 1, 1,
1.101833, -0.932579, 1.613273, 1, 1, 1, 1, 1,
1.102216, 0.575416, 0.3706584, 1, 1, 1, 1, 1,
1.108645, 0.3898273, 1.242531, 1, 1, 1, 1, 1,
1.109859, -0.21816, 2.87027, 1, 1, 1, 1, 1,
1.110259, 0.2687577, 2.187896, 1, 1, 1, 1, 1,
1.113374, -0.7043772, 2.904905, 0, 0, 1, 1, 1,
1.124768, -0.685438, 1.925637, 1, 0, 0, 1, 1,
1.127277, -1.820526, 2.524876, 1, 0, 0, 1, 1,
1.131686, -0.6336412, 1.464479, 1, 0, 0, 1, 1,
1.13689, 0.7182672, 1.990687, 1, 0, 0, 1, 1,
1.13881, 0.2814935, 0.88972, 1, 0, 0, 1, 1,
1.13918, -0.5996097, 1.430374, 0, 0, 0, 1, 1,
1.152115, 0.810217, 1.793614, 0, 0, 0, 1, 1,
1.153075, 0.5219973, 1.63018, 0, 0, 0, 1, 1,
1.156763, 1.292111, 1.255217, 0, 0, 0, 1, 1,
1.167894, -0.1581335, 1.806781, 0, 0, 0, 1, 1,
1.199303, -0.4979825, 0.4848754, 0, 0, 0, 1, 1,
1.20955, -0.4156362, 2.871427, 0, 0, 0, 1, 1,
1.210145, 0.2702231, -1.344775, 1, 1, 1, 1, 1,
1.212106, -1.301867, 2.368558, 1, 1, 1, 1, 1,
1.214512, -1.781161, 2.120423, 1, 1, 1, 1, 1,
1.222817, 0.4122609, 0.120713, 1, 1, 1, 1, 1,
1.230453, 0.8225197, 1.494378, 1, 1, 1, 1, 1,
1.233433, -1.381012, 2.753584, 1, 1, 1, 1, 1,
1.233698, -0.01462323, 1.315373, 1, 1, 1, 1, 1,
1.23711, -0.6160181, 1.13507, 1, 1, 1, 1, 1,
1.239046, 0.292765, 2.168664, 1, 1, 1, 1, 1,
1.239694, -1.196665, 2.458378, 1, 1, 1, 1, 1,
1.244122, -1.87141, 3.896516, 1, 1, 1, 1, 1,
1.24771, -0.4164902, 2.149543, 1, 1, 1, 1, 1,
1.249301, 0.5248991, -0.07828111, 1, 1, 1, 1, 1,
1.253309, -0.2941827, 0.8301138, 1, 1, 1, 1, 1,
1.25702, -0.7337642, 3.00221, 1, 1, 1, 1, 1,
1.259954, 0.5254245, -0.6127862, 0, 0, 1, 1, 1,
1.267002, -0.7072061, 1.698877, 1, 0, 0, 1, 1,
1.287832, -0.3190202, 1.795723, 1, 0, 0, 1, 1,
1.308255, -1.245095, 1.954843, 1, 0, 0, 1, 1,
1.313193, -0.1037115, 1.300402, 1, 0, 0, 1, 1,
1.314638, -1.553838, 2.08911, 1, 0, 0, 1, 1,
1.334442, -0.2464279, 2.017103, 0, 0, 0, 1, 1,
1.341142, 0.5862014, 1.519661, 0, 0, 0, 1, 1,
1.348891, 0.1700003, 0.4169097, 0, 0, 0, 1, 1,
1.349205, -0.3478836, 2.142823, 0, 0, 0, 1, 1,
1.351972, 1.526511, 1.177507, 0, 0, 0, 1, 1,
1.364143, -0.1868792, 1.850129, 0, 0, 0, 1, 1,
1.365517, 0.0826413, 0.7934671, 0, 0, 0, 1, 1,
1.365732, 0.5798876, 2.7628, 1, 1, 1, 1, 1,
1.377573, -0.7997336, -0.5888841, 1, 1, 1, 1, 1,
1.378152, -1.276422, 3.881869, 1, 1, 1, 1, 1,
1.379688, -2.896323, 2.701173, 1, 1, 1, 1, 1,
1.383275, 0.2585699, 1.430422, 1, 1, 1, 1, 1,
1.386979, -0.8593498, 1.574893, 1, 1, 1, 1, 1,
1.390157, 0.1091109, 1.456558, 1, 1, 1, 1, 1,
1.4086, -0.7008759, 1.130228, 1, 1, 1, 1, 1,
1.413071, -0.7189278, 2.748792, 1, 1, 1, 1, 1,
1.414252, -0.1682788, 1.170099, 1, 1, 1, 1, 1,
1.420973, -0.2764292, -0.3591826, 1, 1, 1, 1, 1,
1.428532, -0.7929186, 2.312876, 1, 1, 1, 1, 1,
1.428726, -0.01327251, 0.671149, 1, 1, 1, 1, 1,
1.444234, 0.7899724, 2.739764, 1, 1, 1, 1, 1,
1.460858, -0.3874941, 1.284132, 1, 1, 1, 1, 1,
1.467932, 0.006611981, 2.212642, 0, 0, 1, 1, 1,
1.473489, -0.2560094, 2.206962, 1, 0, 0, 1, 1,
1.507119, -2.262356, 3.693235, 1, 0, 0, 1, 1,
1.507303, -1.030617, 0.8490798, 1, 0, 0, 1, 1,
1.509556, -1.082536, 3.591311, 1, 0, 0, 1, 1,
1.511067, 1.478042, 1.374046, 1, 0, 0, 1, 1,
1.511998, -0.6245881, 1.952548, 0, 0, 0, 1, 1,
1.514297, -0.9732603, 1.95974, 0, 0, 0, 1, 1,
1.517366, 0.1001393, 0.873565, 0, 0, 0, 1, 1,
1.524927, 0.3759626, 0.9800139, 0, 0, 0, 1, 1,
1.52939, 0.3392048, 1.278928, 0, 0, 0, 1, 1,
1.539505, 0.52612, 2.65237, 0, 0, 0, 1, 1,
1.54183, -0.8351588, -0.5640175, 0, 0, 0, 1, 1,
1.574842, -0.1880861, 1.171067, 1, 1, 1, 1, 1,
1.57795, -0.3210289, 1.311349, 1, 1, 1, 1, 1,
1.588763, -0.8427519, 1.81212, 1, 1, 1, 1, 1,
1.608255, -0.1122475, 0.3247315, 1, 1, 1, 1, 1,
1.623915, 1.311254, 0.670855, 1, 1, 1, 1, 1,
1.633104, -1.939511, 3.54764, 1, 1, 1, 1, 1,
1.636178, 0.9263311, 1.0187, 1, 1, 1, 1, 1,
1.638766, 0.3719466, 2.238333, 1, 1, 1, 1, 1,
1.643073, 1.382726, 0.2129018, 1, 1, 1, 1, 1,
1.644223, -1.63347, 2.974059, 1, 1, 1, 1, 1,
1.653953, 0.729785, 2.32616, 1, 1, 1, 1, 1,
1.665222, 1.365575, 0.7350293, 1, 1, 1, 1, 1,
1.665375, -0.1959738, 2.701157, 1, 1, 1, 1, 1,
1.677944, 0.6737975, 0.2216569, 1, 1, 1, 1, 1,
1.696755, -1.574942, 2.441576, 1, 1, 1, 1, 1,
1.710442, -0.3711412, 0.9720922, 0, 0, 1, 1, 1,
1.732324, -0.4783039, 0.9229996, 1, 0, 0, 1, 1,
1.735293, 0.5435109, 1.758275, 1, 0, 0, 1, 1,
1.765626, -1.107305, 2.298575, 1, 0, 0, 1, 1,
1.769332, -0.09872884, 1.165046, 1, 0, 0, 1, 1,
1.77199, -1.02978, 1.516207, 1, 0, 0, 1, 1,
1.777792, 0.7806517, 1.55803, 0, 0, 0, 1, 1,
1.777881, 1.247964, 0.7660037, 0, 0, 0, 1, 1,
1.789361, 0.6285811, 1.895106, 0, 0, 0, 1, 1,
1.793212, -0.7461501, 2.961056, 0, 0, 0, 1, 1,
1.800252, 0.009088813, 3.465466, 0, 0, 0, 1, 1,
1.807492, 0.6346049, 1.121389, 0, 0, 0, 1, 1,
1.811668, -1.570657, 1.987711, 0, 0, 0, 1, 1,
1.823142, -1.859442, 2.469754, 1, 1, 1, 1, 1,
1.843517, 1.328387, 0.6557184, 1, 1, 1, 1, 1,
1.84536, -0.5710511, 0.4777375, 1, 1, 1, 1, 1,
1.858297, -0.07773726, 0.9712757, 1, 1, 1, 1, 1,
1.875612, 1.135415, 1.304947, 1, 1, 1, 1, 1,
1.896406, 0.2481942, 1.956607, 1, 1, 1, 1, 1,
1.90229, -1.014687, 1.689849, 1, 1, 1, 1, 1,
1.919814, 0.7163215, -1.234265, 1, 1, 1, 1, 1,
1.928145, 0.8361205, 0.7977387, 1, 1, 1, 1, 1,
1.945855, 0.2403048, -0.3712857, 1, 1, 1, 1, 1,
1.948019, -0.9712726, 1.545597, 1, 1, 1, 1, 1,
1.97393, -0.1018083, 1.974979, 1, 1, 1, 1, 1,
1.990314, -1.008484, 2.056886, 1, 1, 1, 1, 1,
2.009326, 0.3249938, 0.2851083, 1, 1, 1, 1, 1,
2.010364, -1.509214, 0.4728054, 1, 1, 1, 1, 1,
2.047078, 1.387103, 1.500767, 0, 0, 1, 1, 1,
2.068735, 0.3992189, 0.7272961, 1, 0, 0, 1, 1,
2.097924, -1.287962, 2.004623, 1, 0, 0, 1, 1,
2.104867, 2.111114, 0.260751, 1, 0, 0, 1, 1,
2.130635, 0.3062528, 1.046677, 1, 0, 0, 1, 1,
2.247185, -0.6715831, 1.144937, 1, 0, 0, 1, 1,
2.277719, -0.9347367, 1.939932, 0, 0, 0, 1, 1,
2.284585, -0.001673847, 2.696792, 0, 0, 0, 1, 1,
2.336565, -1.927639, 1.345076, 0, 0, 0, 1, 1,
2.387347, 0.05368069, 1.397495, 0, 0, 0, 1, 1,
2.399364, -2.216272, 2.378048, 0, 0, 0, 1, 1,
2.41252, 0.8328595, 1.366347, 0, 0, 0, 1, 1,
2.494797, -0.3089993, 1.804458, 0, 0, 0, 1, 1,
2.501639, 1.225117, 1.964488, 1, 1, 1, 1, 1,
2.589918, 0.7734793, 2.306837, 1, 1, 1, 1, 1,
2.655241, 2.592517, 0.3966871, 1, 1, 1, 1, 1,
2.692802, -1.977167, 2.963223, 1, 1, 1, 1, 1,
2.801324, -1.164042, 2.850094, 1, 1, 1, 1, 1,
2.857916, -0.5315948, 3.082873, 1, 1, 1, 1, 1,
3.050201, -0.8301842, 3.119008, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.186255;
var distance = 32.26633;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.0715456, 0.3115964, 0.1992364 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.26633);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>