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
-3.035613, -1.237312, -1.133982, 1, 0, 0, 1,
-2.984753, 0.5125709, -1.059441, 1, 0.007843138, 0, 1,
-2.862954, 1.7011, -1.114014, 1, 0.01176471, 0, 1,
-2.619433, -0.6406502, -0.5890241, 1, 0.01960784, 0, 1,
-2.596642, -2.453688, -1.593102, 1, 0.02352941, 0, 1,
-2.549494, -1.454189, -1.770043, 1, 0.03137255, 0, 1,
-2.543097, -0.6825519, -1.638199, 1, 0.03529412, 0, 1,
-2.373434, -1.433446, -1.031922, 1, 0.04313726, 0, 1,
-2.370705, -0.3839424, -2.891787, 1, 0.04705882, 0, 1,
-2.369992, 0.7876926, -2.039831, 1, 0.05490196, 0, 1,
-2.351271, 0.1954592, -1.955599, 1, 0.05882353, 0, 1,
-2.337581, 0.05608407, -1.663556, 1, 0.06666667, 0, 1,
-2.268634, -0.245868, -2.06796, 1, 0.07058824, 0, 1,
-2.224068, 0.341435, -1.717913, 1, 0.07843138, 0, 1,
-2.085001, -0.7210249, -1.312431, 1, 0.08235294, 0, 1,
-2.057644, 0.8848836, -2.463616, 1, 0.09019608, 0, 1,
-2.024442, 0.1554686, -0.6474006, 1, 0.09411765, 0, 1,
-2.018309, 0.9335892, -0.3472536, 1, 0.1019608, 0, 1,
-1.98424, 1.633483, -0.2529203, 1, 0.1098039, 0, 1,
-1.98338, 1.072434, -1.131228, 1, 0.1137255, 0, 1,
-1.973225, -0.04859671, -1.094555, 1, 0.1215686, 0, 1,
-1.947888, -0.3120115, -2.927305, 1, 0.1254902, 0, 1,
-1.945016, 0.2219262, -2.366447, 1, 0.1333333, 0, 1,
-1.919317, 0.2093125, -1.830543, 1, 0.1372549, 0, 1,
-1.905963, -1.095181, -2.207592, 1, 0.145098, 0, 1,
-1.890611, -1.141058, -2.596431, 1, 0.1490196, 0, 1,
-1.865441, 0.7451175, -0.3048949, 1, 0.1568628, 0, 1,
-1.864305, 2.251246, -0.2171253, 1, 0.1607843, 0, 1,
-1.85273, -1.123588, -0.5836526, 1, 0.1686275, 0, 1,
-1.84339, -0.7051155, -0.4402699, 1, 0.172549, 0, 1,
-1.837423, -0.4141541, -2.063557, 1, 0.1803922, 0, 1,
-1.835963, -0.09323335, -0.8947296, 1, 0.1843137, 0, 1,
-1.795559, 0.2934478, -1.311481, 1, 0.1921569, 0, 1,
-1.75361, -0.658924, -0.003111631, 1, 0.1960784, 0, 1,
-1.750154, 0.9756365, -0.994831, 1, 0.2039216, 0, 1,
-1.713999, 1.479856, -2.435705, 1, 0.2117647, 0, 1,
-1.712721, -0.6580839, -1.931701, 1, 0.2156863, 0, 1,
-1.68672, 0.503733, -3.76358, 1, 0.2235294, 0, 1,
-1.686439, 1.361919, -3.728964, 1, 0.227451, 0, 1,
-1.683236, -0.9446807, -2.812279, 1, 0.2352941, 0, 1,
-1.681792, -0.2224602, -1.326959, 1, 0.2392157, 0, 1,
-1.677458, 1.745406, -1.610996, 1, 0.2470588, 0, 1,
-1.669551, -0.6333976, -2.447142, 1, 0.2509804, 0, 1,
-1.65043, -0.2789082, -2.535319, 1, 0.2588235, 0, 1,
-1.643073, 0.6886999, -1.487518, 1, 0.2627451, 0, 1,
-1.606363, -1.656309, -2.639445, 1, 0.2705882, 0, 1,
-1.606311, -0.3283355, -3.344221, 1, 0.2745098, 0, 1,
-1.592543, 0.9220266, -1.146224, 1, 0.282353, 0, 1,
-1.591985, 1.42629, -0.3205293, 1, 0.2862745, 0, 1,
-1.563765, -0.2065286, -1.323788, 1, 0.2941177, 0, 1,
-1.537018, 0.6608434, 0.2394245, 1, 0.3019608, 0, 1,
-1.534701, 0.1998414, -0.6559608, 1, 0.3058824, 0, 1,
-1.524768, 0.8514003, -1.674704, 1, 0.3137255, 0, 1,
-1.519006, -1.001957, 0.5006036, 1, 0.3176471, 0, 1,
-1.507012, -0.4750793, -2.273372, 1, 0.3254902, 0, 1,
-1.501497, 1.510035, -0.9960037, 1, 0.3294118, 0, 1,
-1.466531, -1.140158, -2.135705, 1, 0.3372549, 0, 1,
-1.46402, 1.290428, -2.577945, 1, 0.3411765, 0, 1,
-1.453192, -0.2894207, -1.576488, 1, 0.3490196, 0, 1,
-1.451757, 0.7240113, -1.907837, 1, 0.3529412, 0, 1,
-1.442328, 1.438585, -0.379796, 1, 0.3607843, 0, 1,
-1.430889, -1.524507, -3.158167, 1, 0.3647059, 0, 1,
-1.428999, -1.235594, -3.044881, 1, 0.372549, 0, 1,
-1.416489, 1.096978, -0.8336321, 1, 0.3764706, 0, 1,
-1.410418, -1.006928, -1.794203, 1, 0.3843137, 0, 1,
-1.409326, -0.7981294, -2.487707, 1, 0.3882353, 0, 1,
-1.381531, -1.001858, -1.431054, 1, 0.3960784, 0, 1,
-1.375436, 1.013445, -3.008872, 1, 0.4039216, 0, 1,
-1.361407, 0.8603946, -0.02647212, 1, 0.4078431, 0, 1,
-1.357576, -1.11026, -1.971714, 1, 0.4156863, 0, 1,
-1.354467, -0.9936087, -1.698931, 1, 0.4196078, 0, 1,
-1.353551, -0.3317718, -0.5279589, 1, 0.427451, 0, 1,
-1.351523, 1.888543, 0.03084873, 1, 0.4313726, 0, 1,
-1.349391, 0.977978, -1.736705, 1, 0.4392157, 0, 1,
-1.341491, 0.7487637, -0.01005592, 1, 0.4431373, 0, 1,
-1.338263, -0.3562267, -2.245813, 1, 0.4509804, 0, 1,
-1.331999, 0.1730283, -2.53507, 1, 0.454902, 0, 1,
-1.330858, -0.3538641, -1.28592, 1, 0.4627451, 0, 1,
-1.328394, -1.628949, -2.013023, 1, 0.4666667, 0, 1,
-1.324912, 1.195713, -1.321237, 1, 0.4745098, 0, 1,
-1.323968, 0.8164285, -1.078025, 1, 0.4784314, 0, 1,
-1.319931, 0.205247, -3.18409, 1, 0.4862745, 0, 1,
-1.315842, -0.05721137, -0.3114608, 1, 0.4901961, 0, 1,
-1.313046, 1.854732, 0.03497174, 1, 0.4980392, 0, 1,
-1.312923, -0.3970964, -1.940271, 1, 0.5058824, 0, 1,
-1.30974, 0.6058313, -1.621295, 1, 0.509804, 0, 1,
-1.307092, -0.9168465, -0.8521158, 1, 0.5176471, 0, 1,
-1.30291, -0.6467813, -1.321559, 1, 0.5215687, 0, 1,
-1.297921, 0.3607923, -1.653931, 1, 0.5294118, 0, 1,
-1.294282, -0.8043447, -2.913444, 1, 0.5333334, 0, 1,
-1.284979, -0.6560252, -3.599175, 1, 0.5411765, 0, 1,
-1.282403, -1.607833, -3.348615, 1, 0.5450981, 0, 1,
-1.279691, 0.5951631, -1.583871, 1, 0.5529412, 0, 1,
-1.269222, 0.1207761, 0.3672533, 1, 0.5568628, 0, 1,
-1.266108, -0.459195, -3.035227, 1, 0.5647059, 0, 1,
-1.26227, -0.1544824, -2.585416, 1, 0.5686275, 0, 1,
-1.259944, 1.49933, -1.251873, 1, 0.5764706, 0, 1,
-1.256143, -0.1113581, -0.09576696, 1, 0.5803922, 0, 1,
-1.254144, -0.8516128, -2.925943, 1, 0.5882353, 0, 1,
-1.242967, 0.6877605, 0.310419, 1, 0.5921569, 0, 1,
-1.240832, 0.7348605, -0.2372327, 1, 0.6, 0, 1,
-1.23588, -0.7452924, -0.9808698, 1, 0.6078432, 0, 1,
-1.228736, -0.004741816, -1.72478, 1, 0.6117647, 0, 1,
-1.220052, 0.2491175, -0.7048219, 1, 0.6196079, 0, 1,
-1.218096, 2.552811, -1.770037, 1, 0.6235294, 0, 1,
-1.216987, 1.890305, -2.012499, 1, 0.6313726, 0, 1,
-1.21335, 1.649026, -1.656747, 1, 0.6352941, 0, 1,
-1.200425, -1.121265, -3.355635, 1, 0.6431373, 0, 1,
-1.190783, -0.8717352, -4.016901, 1, 0.6470588, 0, 1,
-1.189296, 1.87315, 0.4346408, 1, 0.654902, 0, 1,
-1.188563, -0.1991552, -1.394557, 1, 0.6588235, 0, 1,
-1.176454, 1.355583, -1.148669, 1, 0.6666667, 0, 1,
-1.171415, 0.5999042, -1.032014, 1, 0.6705883, 0, 1,
-1.167146, 0.5381822, -2.477365, 1, 0.6784314, 0, 1,
-1.166975, -1.230079, -2.37338, 1, 0.682353, 0, 1,
-1.166095, 0.9212189, 0.641484, 1, 0.6901961, 0, 1,
-1.159996, 0.5897416, -1.391872, 1, 0.6941177, 0, 1,
-1.155878, 1.68843, 1.088993, 1, 0.7019608, 0, 1,
-1.142389, -0.08690365, -1.926288, 1, 0.7098039, 0, 1,
-1.125064, 1.047883, -1.576924, 1, 0.7137255, 0, 1,
-1.12334, 1.397454, -2.577002, 1, 0.7215686, 0, 1,
-1.123111, -0.9469889, -1.137617, 1, 0.7254902, 0, 1,
-1.119107, 0.1841355, 0.4182922, 1, 0.7333333, 0, 1,
-1.110213, -0.07847212, -1.944008, 1, 0.7372549, 0, 1,
-1.107804, 0.247331, -1.483881, 1, 0.7450981, 0, 1,
-1.090715, 0.9378217, -3.730318, 1, 0.7490196, 0, 1,
-1.072487, -0.1905752, -1.475042, 1, 0.7568628, 0, 1,
-1.070097, -0.8797638, -3.484618, 1, 0.7607843, 0, 1,
-1.06018, -0.1998234, -2.714228, 1, 0.7686275, 0, 1,
-1.054512, 1.437321, 1.228403, 1, 0.772549, 0, 1,
-1.036641, 0.03449805, -1.600816, 1, 0.7803922, 0, 1,
-1.034364, 1.614279, -0.3673804, 1, 0.7843137, 0, 1,
-1.02872, 0.3052149, -1.891111, 1, 0.7921569, 0, 1,
-1.011391, 1.169052, 0.4716347, 1, 0.7960784, 0, 1,
-1.005777, -1.297977, -3.905927, 1, 0.8039216, 0, 1,
-0.9986926, -0.9421415, -3.810768, 1, 0.8117647, 0, 1,
-0.9968259, -0.1530966, -1.024454, 1, 0.8156863, 0, 1,
-0.9948526, 0.4196478, -1.511575, 1, 0.8235294, 0, 1,
-0.9870319, -1.067107, -2.537359, 1, 0.827451, 0, 1,
-0.9835242, -0.532241, -2.285927, 1, 0.8352941, 0, 1,
-0.9834642, -0.2769865, -2.71595, 1, 0.8392157, 0, 1,
-0.9824297, -0.0990865, -2.015899, 1, 0.8470588, 0, 1,
-0.9765171, 1.089134, 0.4508283, 1, 0.8509804, 0, 1,
-0.9738189, 0.9828014, -1.57731, 1, 0.8588235, 0, 1,
-0.9714434, -1.117177, -2.884547, 1, 0.8627451, 0, 1,
-0.9553607, 0.3884797, -1.576198, 1, 0.8705882, 0, 1,
-0.9526308, -1.680417, -4.55133, 1, 0.8745098, 0, 1,
-0.9496624, -1.618694, -2.628075, 1, 0.8823529, 0, 1,
-0.9472647, -0.5952895, -2.395159, 1, 0.8862745, 0, 1,
-0.9449343, 0.9889053, -3.260136, 1, 0.8941177, 0, 1,
-0.942824, 1.415416, 0.3935004, 1, 0.8980392, 0, 1,
-0.9427336, -0.3619704, -0.3194011, 1, 0.9058824, 0, 1,
-0.9416651, -0.8872362, -1.551046, 1, 0.9137255, 0, 1,
-0.9282097, 0.8425502, 1.502526, 1, 0.9176471, 0, 1,
-0.9251094, 0.2288191, -0.1570555, 1, 0.9254902, 0, 1,
-0.9240764, 0.05119057, -1.86327, 1, 0.9294118, 0, 1,
-0.9168168, -0.1052749, -3.740421, 1, 0.9372549, 0, 1,
-0.9153562, -0.6399408, -0.7064924, 1, 0.9411765, 0, 1,
-0.9075431, 0.00405601, -0.9516813, 1, 0.9490196, 0, 1,
-0.9000825, -0.6899197, -1.492898, 1, 0.9529412, 0, 1,
-0.8943661, -1.33906, -3.222597, 1, 0.9607843, 0, 1,
-0.8930446, 1.353661, -0.3030988, 1, 0.9647059, 0, 1,
-0.8895396, 1.386771, 0.1109654, 1, 0.972549, 0, 1,
-0.8894562, -0.2518618, -1.890398, 1, 0.9764706, 0, 1,
-0.8850329, 1.042372, -0.9801683, 1, 0.9843137, 0, 1,
-0.8846874, -1.146466, -3.367824, 1, 0.9882353, 0, 1,
-0.8710498, -1.119293, -0.9804539, 1, 0.9960784, 0, 1,
-0.8709259, -1.131877, -4.000275, 0.9960784, 1, 0, 1,
-0.8684068, -2.138834, -1.123002, 0.9921569, 1, 0, 1,
-0.8633671, -0.9701406, -2.355449, 0.9843137, 1, 0, 1,
-0.8568323, -0.5848885, 0.3784438, 0.9803922, 1, 0, 1,
-0.8560314, 1.07411, -1.229481, 0.972549, 1, 0, 1,
-0.8510585, -2.145756, -2.853761, 0.9686275, 1, 0, 1,
-0.8507481, 1.874185, -0.5362431, 0.9607843, 1, 0, 1,
-0.8472773, 0.8105726, -1.771847, 0.9568627, 1, 0, 1,
-0.8423615, 1.003038, -0.9200748, 0.9490196, 1, 0, 1,
-0.8418396, -0.6456773, -2.666152, 0.945098, 1, 0, 1,
-0.8414482, -1.006531, -2.893648, 0.9372549, 1, 0, 1,
-0.8389601, 0.4938975, 0.1946901, 0.9333333, 1, 0, 1,
-0.8381094, 2.898383, -0.8217328, 0.9254902, 1, 0, 1,
-0.8337942, 2.948334, 0.8947338, 0.9215686, 1, 0, 1,
-0.8329186, 0.9972481, 0.5207804, 0.9137255, 1, 0, 1,
-0.8310069, 0.1462335, -0.005033482, 0.9098039, 1, 0, 1,
-0.8306711, 0.5571617, -1.257597, 0.9019608, 1, 0, 1,
-0.8292838, -0.08748523, -3.206257, 0.8941177, 1, 0, 1,
-0.8288645, -0.7489272, -2.274812, 0.8901961, 1, 0, 1,
-0.823006, -1.277524, -2.421366, 0.8823529, 1, 0, 1,
-0.8170872, 1.335856, -1.749155, 0.8784314, 1, 0, 1,
-0.8091127, 1.466628, -0.8973887, 0.8705882, 1, 0, 1,
-0.781103, -0.268646, -2.14143, 0.8666667, 1, 0, 1,
-0.7773238, 0.3364169, 0.2396978, 0.8588235, 1, 0, 1,
-0.7727127, -0.838799, -4.116945, 0.854902, 1, 0, 1,
-0.7560046, 0.9436625, 0.2896006, 0.8470588, 1, 0, 1,
-0.7548442, -1.239635, -2.556142, 0.8431373, 1, 0, 1,
-0.7528365, -1.387816, -3.175545, 0.8352941, 1, 0, 1,
-0.7522835, 0.1847856, -0.9686606, 0.8313726, 1, 0, 1,
-0.7400556, 1.385587, -1.42621, 0.8235294, 1, 0, 1,
-0.7377797, -0.3218952, -1.163415, 0.8196079, 1, 0, 1,
-0.7320669, -1.662693, -3.830065, 0.8117647, 1, 0, 1,
-0.7269642, 0.4134395, -0.6669185, 0.8078431, 1, 0, 1,
-0.7196296, 0.9130071, -0.897359, 0.8, 1, 0, 1,
-0.7135787, -0.6556301, -3.208013, 0.7921569, 1, 0, 1,
-0.7131792, 0.5564648, -0.858822, 0.7882353, 1, 0, 1,
-0.7128158, 0.1717675, -0.2292366, 0.7803922, 1, 0, 1,
-0.7126774, 0.2107793, -1.205666, 0.7764706, 1, 0, 1,
-0.7104931, 3.321475, -0.3622046, 0.7686275, 1, 0, 1,
-0.7075716, 0.8083576, -0.9337461, 0.7647059, 1, 0, 1,
-0.7070321, -0.5287898, -1.434184, 0.7568628, 1, 0, 1,
-0.7054437, -1.503678, -3.731129, 0.7529412, 1, 0, 1,
-0.6961273, -0.9855896, -3.979049, 0.7450981, 1, 0, 1,
-0.6959878, 0.1354032, 0.3287441, 0.7411765, 1, 0, 1,
-0.6953803, -0.04585214, -0.9424899, 0.7333333, 1, 0, 1,
-0.6924894, -1.288473, -3.174403, 0.7294118, 1, 0, 1,
-0.6921958, 0.4001253, -0.688144, 0.7215686, 1, 0, 1,
-0.6864533, -0.2818292, -1.896896, 0.7176471, 1, 0, 1,
-0.6769592, -1.691462, -2.099509, 0.7098039, 1, 0, 1,
-0.6714571, 0.2622498, -1.868347, 0.7058824, 1, 0, 1,
-0.6683427, -0.1670952, -2.736543, 0.6980392, 1, 0, 1,
-0.6641028, -0.1891679, -0.4924644, 0.6901961, 1, 0, 1,
-0.6537878, 2.54754, 0.7560495, 0.6862745, 1, 0, 1,
-0.6521912, 0.1861881, 0.445778, 0.6784314, 1, 0, 1,
-0.6495678, -0.5101101, -2.959555, 0.6745098, 1, 0, 1,
-0.6466026, 0.7586951, -0.9266504, 0.6666667, 1, 0, 1,
-0.6430373, -0.1745265, -1.11271, 0.6627451, 1, 0, 1,
-0.6428437, -1.336122, -3.318295, 0.654902, 1, 0, 1,
-0.6409693, 0.3211152, -1.547675, 0.6509804, 1, 0, 1,
-0.6362371, 0.7622112, -0.1040726, 0.6431373, 1, 0, 1,
-0.6337555, 0.7100735, 1.014239, 0.6392157, 1, 0, 1,
-0.6212826, -0.320333, -1.520042, 0.6313726, 1, 0, 1,
-0.6165105, -1.073619, -3.002664, 0.627451, 1, 0, 1,
-0.6108128, -0.8350016, -3.303038, 0.6196079, 1, 0, 1,
-0.6056883, 0.3983897, -2.833519, 0.6156863, 1, 0, 1,
-0.6039726, -0.6586013, -3.29716, 0.6078432, 1, 0, 1,
-0.603878, 0.917466, -0.4628703, 0.6039216, 1, 0, 1,
-0.6000555, 0.4637837, -0.6933483, 0.5960785, 1, 0, 1,
-0.5995052, -0.9053586, -2.757558, 0.5882353, 1, 0, 1,
-0.5959303, -0.1162066, -2.301903, 0.5843138, 1, 0, 1,
-0.5942231, 0.9054373, -1.939154, 0.5764706, 1, 0, 1,
-0.5915164, 0.176302, -1.545449, 0.572549, 1, 0, 1,
-0.5906289, -0.5118535, -2.907218, 0.5647059, 1, 0, 1,
-0.5832988, -0.2355119, -1.683455, 0.5607843, 1, 0, 1,
-0.5813575, 0.871554, -1.115191, 0.5529412, 1, 0, 1,
-0.5787162, -0.05876345, -2.464992, 0.5490196, 1, 0, 1,
-0.5705135, -0.3549094, -1.173845, 0.5411765, 1, 0, 1,
-0.5703784, -1.659721, -4.832429, 0.5372549, 1, 0, 1,
-0.561787, -0.1755307, -1.031033, 0.5294118, 1, 0, 1,
-0.5609205, -0.614996, -3.975065, 0.5254902, 1, 0, 1,
-0.559375, -0.2241985, -0.9126526, 0.5176471, 1, 0, 1,
-0.5575247, -0.4305826, -2.844685, 0.5137255, 1, 0, 1,
-0.5555629, -0.8037602, -1.169724, 0.5058824, 1, 0, 1,
-0.5521013, 0.4510971, -1.769525, 0.5019608, 1, 0, 1,
-0.5507104, 1.458901, -0.8741067, 0.4941176, 1, 0, 1,
-0.5458134, 1.735533, 0.2983572, 0.4862745, 1, 0, 1,
-0.5452473, 0.6750311, -2.39727, 0.4823529, 1, 0, 1,
-0.5416021, -0.2442797, -3.73368, 0.4745098, 1, 0, 1,
-0.5413312, -0.1057574, -2.868618, 0.4705882, 1, 0, 1,
-0.541137, 0.6915929, -0.4409808, 0.4627451, 1, 0, 1,
-0.5399601, -0.5941069, -3.051341, 0.4588235, 1, 0, 1,
-0.5399357, 2.032609, 0.8436404, 0.4509804, 1, 0, 1,
-0.5384245, -0.3114213, -2.014106, 0.4470588, 1, 0, 1,
-0.5245757, -0.2864701, -1.555456, 0.4392157, 1, 0, 1,
-0.5196075, 2.746451, -0.7604191, 0.4352941, 1, 0, 1,
-0.5079206, 0.6173702, 0.8505477, 0.427451, 1, 0, 1,
-0.5055065, 1.004777, -0.146284, 0.4235294, 1, 0, 1,
-0.4989484, -0.934481, -1.134837, 0.4156863, 1, 0, 1,
-0.4929449, -0.2652952, -3.23952, 0.4117647, 1, 0, 1,
-0.4922357, -0.7616348, -3.785816, 0.4039216, 1, 0, 1,
-0.4897916, -1.037402, -3.530956, 0.3960784, 1, 0, 1,
-0.4882973, -0.05840751, -2.909863, 0.3921569, 1, 0, 1,
-0.4868551, -0.6691235, -3.770155, 0.3843137, 1, 0, 1,
-0.4844765, -0.4570318, -1.266532, 0.3803922, 1, 0, 1,
-0.4790086, -1.05021, 0.1908624, 0.372549, 1, 0, 1,
-0.4762875, -1.056589, -4.093603, 0.3686275, 1, 0, 1,
-0.4752767, -0.2077771, -0.1121955, 0.3607843, 1, 0, 1,
-0.4671316, -0.5634124, -3.740664, 0.3568628, 1, 0, 1,
-0.4665253, 0.5750924, -2.464681, 0.3490196, 1, 0, 1,
-0.4602887, -0.5516701, -2.349013, 0.345098, 1, 0, 1,
-0.4597331, -0.7082204, -1.735245, 0.3372549, 1, 0, 1,
-0.4574464, 1.198811, -0.666786, 0.3333333, 1, 0, 1,
-0.4572392, -1.059015, -2.532246, 0.3254902, 1, 0, 1,
-0.455401, 1.029377, -1.06101, 0.3215686, 1, 0, 1,
-0.4551134, -0.3258945, -4.054945, 0.3137255, 1, 0, 1,
-0.4510577, -0.141929, -1.022276, 0.3098039, 1, 0, 1,
-0.4496866, -0.3813615, -2.41086, 0.3019608, 1, 0, 1,
-0.4452705, 0.1196667, -0.2876889, 0.2941177, 1, 0, 1,
-0.443236, -0.122823, -3.026012, 0.2901961, 1, 0, 1,
-0.4413569, 1.053186, -0.4527977, 0.282353, 1, 0, 1,
-0.4393505, -0.04217546, -0.4691934, 0.2784314, 1, 0, 1,
-0.4385439, -0.09287447, -1.212744, 0.2705882, 1, 0, 1,
-0.4382841, 1.879333, 0.6971922, 0.2666667, 1, 0, 1,
-0.4292293, -0.8485551, -3.10996, 0.2588235, 1, 0, 1,
-0.4269438, 0.6547995, -2.896803, 0.254902, 1, 0, 1,
-0.4257819, -0.9593316, -1.79315, 0.2470588, 1, 0, 1,
-0.425772, 1.035437, 0.2416847, 0.2431373, 1, 0, 1,
-0.4243181, 0.3885161, -2.974328, 0.2352941, 1, 0, 1,
-0.4239806, 0.4415537, -1.24207, 0.2313726, 1, 0, 1,
-0.4217019, 1.00819, -0.7888701, 0.2235294, 1, 0, 1,
-0.4198729, 0.3911782, 1.1252, 0.2196078, 1, 0, 1,
-0.4116335, 0.2263785, -0.2812325, 0.2117647, 1, 0, 1,
-0.4111742, -0.1158761, -0.8587126, 0.2078431, 1, 0, 1,
-0.4099379, -1.662202, -2.839929, 0.2, 1, 0, 1,
-0.409023, 1.822543, -0.02622266, 0.1921569, 1, 0, 1,
-0.4079051, -0.5591215, -1.656671, 0.1882353, 1, 0, 1,
-0.406678, 0.05844793, -0.9630575, 0.1803922, 1, 0, 1,
-0.4028232, 0.06385598, -0.8288708, 0.1764706, 1, 0, 1,
-0.4007469, 0.3977598, -0.5579654, 0.1686275, 1, 0, 1,
-0.4002276, 0.01118185, -1.58131, 0.1647059, 1, 0, 1,
-0.3974045, -1.101601, -3.162658, 0.1568628, 1, 0, 1,
-0.3938912, -0.2168096, -2.983062, 0.1529412, 1, 0, 1,
-0.3934849, 0.2392291, -1.822943, 0.145098, 1, 0, 1,
-0.3930955, 0.3026631, -1.39962, 0.1411765, 1, 0, 1,
-0.3905743, -0.9194438, -1.989527, 0.1333333, 1, 0, 1,
-0.3894476, -1.596214, -3.324537, 0.1294118, 1, 0, 1,
-0.3892005, 1.311666, -1.454021, 0.1215686, 1, 0, 1,
-0.3849269, -0.08213994, -1.379933, 0.1176471, 1, 0, 1,
-0.3797942, -0.2829651, -1.526026, 0.1098039, 1, 0, 1,
-0.3795418, 1.099982, 0.7200722, 0.1058824, 1, 0, 1,
-0.3765992, -0.3030101, -1.664705, 0.09803922, 1, 0, 1,
-0.3731399, -1.563157, -4.33064, 0.09019608, 1, 0, 1,
-0.3689598, 0.2566874, 0.8164391, 0.08627451, 1, 0, 1,
-0.3647798, 0.0742431, -2.503989, 0.07843138, 1, 0, 1,
-0.3619457, -1.635862, -3.026825, 0.07450981, 1, 0, 1,
-0.3552592, 0.5014119, -0.9055575, 0.06666667, 1, 0, 1,
-0.3487865, -0.2133445, -0.6977727, 0.0627451, 1, 0, 1,
-0.3483332, 0.7155457, -1.277808, 0.05490196, 1, 0, 1,
-0.3435621, 0.1324397, -0.61027, 0.05098039, 1, 0, 1,
-0.3423611, 1.324879, -0.6306273, 0.04313726, 1, 0, 1,
-0.3408333, -1.838091, -0.6495198, 0.03921569, 1, 0, 1,
-0.3341913, -0.1506419, -2.187308, 0.03137255, 1, 0, 1,
-0.3324904, -0.2395716, -2.920579, 0.02745098, 1, 0, 1,
-0.3317506, 1.267793, -1.215574, 0.01960784, 1, 0, 1,
-0.3288359, 0.3631651, -1.706924, 0.01568628, 1, 0, 1,
-0.3278234, 0.4653681, 0.2372195, 0.007843138, 1, 0, 1,
-0.327098, -0.9913822, -1.410591, 0.003921569, 1, 0, 1,
-0.3261402, 0.5929888, -0.7462589, 0, 1, 0.003921569, 1,
-0.3258992, 1.82209, -0.5930912, 0, 1, 0.01176471, 1,
-0.3252206, 0.05171769, -1.73869, 0, 1, 0.01568628, 1,
-0.3237485, 1.255305, 0.6741947, 0, 1, 0.02352941, 1,
-0.3198927, -1.293408, -2.268825, 0, 1, 0.02745098, 1,
-0.3174393, 1.299106, -2.932746, 0, 1, 0.03529412, 1,
-0.316953, -0.08654051, -2.999058, 0, 1, 0.03921569, 1,
-0.3166108, 1.728195, 0.5824282, 0, 1, 0.04705882, 1,
-0.3148723, 0.9579183, -0.7754939, 0, 1, 0.05098039, 1,
-0.3099937, 0.2448008, -1.831218, 0, 1, 0.05882353, 1,
-0.3086838, -0.5092831, -1.992212, 0, 1, 0.0627451, 1,
-0.3055139, 0.760687, -0.0996729, 0, 1, 0.07058824, 1,
-0.3044981, 0.2678919, -0.3897469, 0, 1, 0.07450981, 1,
-0.2959537, 1.288065, -0.2192927, 0, 1, 0.08235294, 1,
-0.2869567, 1.928467, 0.3374221, 0, 1, 0.08627451, 1,
-0.2857718, 0.9615629, -0.985402, 0, 1, 0.09411765, 1,
-0.2849672, -1.634518, -1.869781, 0, 1, 0.1019608, 1,
-0.2847118, -0.1603552, -1.860372, 0, 1, 0.1058824, 1,
-0.2841097, 0.3492223, -0.7896639, 0, 1, 0.1137255, 1,
-0.2833467, 1.173353, -1.265345, 0, 1, 0.1176471, 1,
-0.2828135, -0.4557782, -1.294285, 0, 1, 0.1254902, 1,
-0.2822908, -0.205567, -2.468122, 0, 1, 0.1294118, 1,
-0.2813583, 1.613912, 0.8362647, 0, 1, 0.1372549, 1,
-0.2807149, 0.5029706, -1.298985, 0, 1, 0.1411765, 1,
-0.2721141, 0.7983534, -0.754545, 0, 1, 0.1490196, 1,
-0.2680012, 0.5954672, -0.2131751, 0, 1, 0.1529412, 1,
-0.267936, -1.061307, -4.494284, 0, 1, 0.1607843, 1,
-0.2660013, 0.3053417, -1.339502, 0, 1, 0.1647059, 1,
-0.2586407, -1.55356, -3.196074, 0, 1, 0.172549, 1,
-0.2568264, -0.1980363, -2.662451, 0, 1, 0.1764706, 1,
-0.2500205, 0.1107903, -3.036953, 0, 1, 0.1843137, 1,
-0.2489291, -0.9429082, -3.280049, 0, 1, 0.1882353, 1,
-0.240729, 1.964667, -0.1918879, 0, 1, 0.1960784, 1,
-0.2373915, 1.081706, -1.437484, 0, 1, 0.2039216, 1,
-0.2360751, 1.050605, -1.049075, 0, 1, 0.2078431, 1,
-0.2320957, -1.31226, -3.361617, 0, 1, 0.2156863, 1,
-0.2286702, -1.587825, 0.358804, 0, 1, 0.2196078, 1,
-0.2283329, 0.4647793, -0.03229709, 0, 1, 0.227451, 1,
-0.2283237, -2.023773, -3.175831, 0, 1, 0.2313726, 1,
-0.226472, -0.007875518, -2.416156, 0, 1, 0.2392157, 1,
-0.2263511, 1.037917, 0.2406525, 0, 1, 0.2431373, 1,
-0.2233845, -0.9763525, -3.043365, 0, 1, 0.2509804, 1,
-0.2224163, 1.07007, -1.241815, 0, 1, 0.254902, 1,
-0.2214944, 0.2186638, -1.644583, 0, 1, 0.2627451, 1,
-0.2169934, -0.9798672, -4.177742, 0, 1, 0.2666667, 1,
-0.2168883, -0.8197427, -3.697965, 0, 1, 0.2745098, 1,
-0.2125331, -0.5998939, -0.8929183, 0, 1, 0.2784314, 1,
-0.2123093, 0.4262463, -0.5100201, 0, 1, 0.2862745, 1,
-0.2100415, -0.1902011, -0.5096996, 0, 1, 0.2901961, 1,
-0.2087489, 0.9730732, -0.0512928, 0, 1, 0.2980392, 1,
-0.2085502, -0.4759882, -2.683228, 0, 1, 0.3058824, 1,
-0.2073402, 0.7541034, -1.873021, 0, 1, 0.3098039, 1,
-0.2003394, 1.250018, -1.466856, 0, 1, 0.3176471, 1,
-0.1955416, 0.9951183, 0.3427989, 0, 1, 0.3215686, 1,
-0.195457, -0.2618071, -2.413132, 0, 1, 0.3294118, 1,
-0.1933018, -0.7176387, -2.509619, 0, 1, 0.3333333, 1,
-0.1930437, 1.182154, 1.214092, 0, 1, 0.3411765, 1,
-0.1899412, 0.1637882, 1.247497, 0, 1, 0.345098, 1,
-0.1727294, 1.013307, -1.242209, 0, 1, 0.3529412, 1,
-0.1719661, -0.434376, -3.038292, 0, 1, 0.3568628, 1,
-0.1718193, 0.7484303, -0.1301136, 0, 1, 0.3647059, 1,
-0.1640337, 0.7476129, 0.5040146, 0, 1, 0.3686275, 1,
-0.1620347, -0.5162504, -3.47362, 0, 1, 0.3764706, 1,
-0.1595593, -0.848102, -2.297936, 0, 1, 0.3803922, 1,
-0.1592269, -0.8929402, -1.76011, 0, 1, 0.3882353, 1,
-0.1571138, -0.7586108, -3.74846, 0, 1, 0.3921569, 1,
-0.1521814, 2.423988, 0.4831851, 0, 1, 0.4, 1,
-0.1499631, -0.1378928, -3.260339, 0, 1, 0.4078431, 1,
-0.1476354, 0.6998848, 0.6476659, 0, 1, 0.4117647, 1,
-0.1448232, -1.013576, -2.922638, 0, 1, 0.4196078, 1,
-0.1390104, 2.323203, -0.220565, 0, 1, 0.4235294, 1,
-0.1389096, 0.6070915, -2.225657, 0, 1, 0.4313726, 1,
-0.1365377, -0.4918884, -3.472906, 0, 1, 0.4352941, 1,
-0.1362253, 1.019461, 0.2275644, 0, 1, 0.4431373, 1,
-0.1289361, 0.7915552, -0.1172556, 0, 1, 0.4470588, 1,
-0.1284357, 0.119758, -0.1705868, 0, 1, 0.454902, 1,
-0.1270436, -1.185149, -5.82786, 0, 1, 0.4588235, 1,
-0.1265623, -2.65104, -4.183622, 0, 1, 0.4666667, 1,
-0.1235329, 0.7225663, -0.9226454, 0, 1, 0.4705882, 1,
-0.1178943, -1.405056, -2.812271, 0, 1, 0.4784314, 1,
-0.1154734, -2.830731, -3.185304, 0, 1, 0.4823529, 1,
-0.1148638, -2.303342, -2.699898, 0, 1, 0.4901961, 1,
-0.1115668, 0.5222631, 0.9821331, 0, 1, 0.4941176, 1,
-0.1109188, -0.1917512, -2.315902, 0, 1, 0.5019608, 1,
-0.1074924, -1.543512, -2.985184, 0, 1, 0.509804, 1,
-0.1067864, 0.4626577, -0.2009987, 0, 1, 0.5137255, 1,
-0.1050636, 0.08150794, -0.6547198, 0, 1, 0.5215687, 1,
-0.1046102, 1.013473, -1.814696, 0, 1, 0.5254902, 1,
-0.1029341, -0.8845605, -3.122959, 0, 1, 0.5333334, 1,
-0.1022793, 0.6355792, -0.308703, 0, 1, 0.5372549, 1,
-0.09967321, 1.271558, -1.491238, 0, 1, 0.5450981, 1,
-0.09943021, -0.8487552, -3.453532, 0, 1, 0.5490196, 1,
-0.09794776, -1.313491, -4.373532, 0, 1, 0.5568628, 1,
-0.09703501, 0.5794977, 0.01343184, 0, 1, 0.5607843, 1,
-0.09182806, -0.1010313, -2.948998, 0, 1, 0.5686275, 1,
-0.08822154, -0.4573715, -2.663632, 0, 1, 0.572549, 1,
-0.08812303, 2.229294, 0.1773276, 0, 1, 0.5803922, 1,
-0.08716667, -0.5897561, -3.3503, 0, 1, 0.5843138, 1,
-0.08715726, 0.7881199, 2.264914, 0, 1, 0.5921569, 1,
-0.08668865, -0.4751066, -2.012866, 0, 1, 0.5960785, 1,
-0.08287583, -1.014187, -3.48231, 0, 1, 0.6039216, 1,
-0.0817647, 0.9804046, -0.3526179, 0, 1, 0.6117647, 1,
-0.08116253, -0.9401075, -2.557442, 0, 1, 0.6156863, 1,
-0.08112402, 0.2581916, -1.992097, 0, 1, 0.6235294, 1,
-0.07934596, -0.2031463, -3.978965, 0, 1, 0.627451, 1,
-0.07685937, 0.6887173, 1.349195, 0, 1, 0.6352941, 1,
-0.07578439, -0.9545522, -3.293819, 0, 1, 0.6392157, 1,
-0.07464502, -0.5180179, -3.678371, 0, 1, 0.6470588, 1,
-0.07404947, 0.3185451, 0.5077102, 0, 1, 0.6509804, 1,
-0.07197443, -0.7065932, -2.65113, 0, 1, 0.6588235, 1,
-0.07158182, -0.1686991, -2.636878, 0, 1, 0.6627451, 1,
-0.07045912, 0.7589235, 1.368865, 0, 1, 0.6705883, 1,
-0.0669694, -0.8002908, -3.574878, 0, 1, 0.6745098, 1,
-0.06612597, 0.7920228, 1.586988, 0, 1, 0.682353, 1,
-0.06590307, 0.6478238, -0.7064682, 0, 1, 0.6862745, 1,
-0.06123612, -0.9973404, -1.219183, 0, 1, 0.6941177, 1,
-0.05682408, 0.8239291, 2.137324, 0, 1, 0.7019608, 1,
-0.05272473, 0.5346745, -0.01453832, 0, 1, 0.7058824, 1,
-0.05170796, -1.039864, -2.843199, 0, 1, 0.7137255, 1,
-0.05025188, -0.2602627, -3.332073, 0, 1, 0.7176471, 1,
-0.04716131, 1.424889, -0.4692152, 0, 1, 0.7254902, 1,
-0.04154171, -3.591519, -3.788444, 0, 1, 0.7294118, 1,
-0.03961166, -0.6009713, -2.57572, 0, 1, 0.7372549, 1,
-0.0360548, 1.011373, -0.7818087, 0, 1, 0.7411765, 1,
-0.03507911, 1.052929, -0.1106749, 0, 1, 0.7490196, 1,
-0.03291875, -1.537094, -3.884705, 0, 1, 0.7529412, 1,
-0.03177641, -0.969794, -2.767128, 0, 1, 0.7607843, 1,
-0.03065889, -1.186154, -2.566747, 0, 1, 0.7647059, 1,
-0.02958242, 1.598538, -1.879031, 0, 1, 0.772549, 1,
-0.02744886, 0.3740015, 1.574174, 0, 1, 0.7764706, 1,
-0.02634158, 0.3779591, 1.303004, 0, 1, 0.7843137, 1,
-0.02533505, -0.04203772, -1.833234, 0, 1, 0.7882353, 1,
-0.02356422, -0.06074255, -1.688854, 0, 1, 0.7960784, 1,
-0.02085901, -0.9025705, -4.712079, 0, 1, 0.8039216, 1,
-0.02031446, 0.05296071, -1.444165, 0, 1, 0.8078431, 1,
-0.01893761, -0.6093246, -3.495131, 0, 1, 0.8156863, 1,
-0.01197712, 1.459635, 0.1531698, 0, 1, 0.8196079, 1,
-0.00881933, -0.4146446, -3.174998, 0, 1, 0.827451, 1,
-0.008040136, 1.934223, -0.7894543, 0, 1, 0.8313726, 1,
-0.006288914, 1.104992, -0.04928197, 0, 1, 0.8392157, 1,
-0.002039569, -1.648928, -2.670638, 0, 1, 0.8431373, 1,
-0.002036884, -0.6598257, -2.918454, 0, 1, 0.8509804, 1,
0.003252017, 0.05421787, 0.1630385, 0, 1, 0.854902, 1,
0.004783589, -0.3281749, 3.337316, 0, 1, 0.8627451, 1,
0.005543451, -0.07994282, 3.072727, 0, 1, 0.8666667, 1,
0.00826018, 0.4196416, -0.9383381, 0, 1, 0.8745098, 1,
0.008908284, -0.3676225, 3.704015, 0, 1, 0.8784314, 1,
0.01519121, 0.1689851, -0.2091043, 0, 1, 0.8862745, 1,
0.01773594, 0.4632371, -0.4997441, 0, 1, 0.8901961, 1,
0.01855496, -0.01228422, 1.246113, 0, 1, 0.8980392, 1,
0.01961922, -0.149664, 3.659348, 0, 1, 0.9058824, 1,
0.02079719, -0.3400072, 2.874956, 0, 1, 0.9098039, 1,
0.02445079, 0.1929918, -1.094836, 0, 1, 0.9176471, 1,
0.02473359, 0.02893731, 2.716227, 0, 1, 0.9215686, 1,
0.02829107, -0.1271717, 2.746257, 0, 1, 0.9294118, 1,
0.02851168, -0.9021024, 1.772108, 0, 1, 0.9333333, 1,
0.02974296, 0.4338896, -0.8818406, 0, 1, 0.9411765, 1,
0.03353882, -0.05869214, 2.468313, 0, 1, 0.945098, 1,
0.03610817, 0.6535339, -0.7081795, 0, 1, 0.9529412, 1,
0.03631941, -1.697113, 2.138317, 0, 1, 0.9568627, 1,
0.03914688, -0.3640423, 3.292044, 0, 1, 0.9647059, 1,
0.04309461, -0.3032449, 1.144106, 0, 1, 0.9686275, 1,
0.0467461, 0.9464613, -0.9539878, 0, 1, 0.9764706, 1,
0.04820785, -1.648111, 2.508902, 0, 1, 0.9803922, 1,
0.04838667, -1.064958, 3.346015, 0, 1, 0.9882353, 1,
0.05085769, -0.5116619, 4.074089, 0, 1, 0.9921569, 1,
0.05515457, -0.02769533, 1.991125, 0, 1, 1, 1,
0.05743503, 0.1913747, 0.3715991, 0, 0.9921569, 1, 1,
0.05745013, 0.05001989, 0.1532214, 0, 0.9882353, 1, 1,
0.05807684, -0.5430507, 2.645141, 0, 0.9803922, 1, 1,
0.06076296, -0.1006525, 4.00236, 0, 0.9764706, 1, 1,
0.06726246, 0.0438993, 2.411034, 0, 0.9686275, 1, 1,
0.06829031, -0.9273669, 2.858463, 0, 0.9647059, 1, 1,
0.0683904, 0.3879985, 1.192314, 0, 0.9568627, 1, 1,
0.06840266, -0.1330809, 2.745062, 0, 0.9529412, 1, 1,
0.0690806, -0.532518, 4.262069, 0, 0.945098, 1, 1,
0.07264593, 0.1496239, 0.05112454, 0, 0.9411765, 1, 1,
0.08112529, -0.4439725, 3.312749, 0, 0.9333333, 1, 1,
0.08212576, 0.5611822, 2.120222, 0, 0.9294118, 1, 1,
0.08270979, 0.4155241, 0.6018955, 0, 0.9215686, 1, 1,
0.082716, -0.6535326, 1.90768, 0, 0.9176471, 1, 1,
0.08544478, 1.296911, 1.242386, 0, 0.9098039, 1, 1,
0.09092514, -1.491824, 3.591158, 0, 0.9058824, 1, 1,
0.09239386, -3.175173, 3.313444, 0, 0.8980392, 1, 1,
0.09573296, 1.343597, 1.29506, 0, 0.8901961, 1, 1,
0.09955585, -0.2103561, 2.963419, 0, 0.8862745, 1, 1,
0.09999865, 0.2299397, -0.213656, 0, 0.8784314, 1, 1,
0.1016966, -0.8404138, 4.311087, 0, 0.8745098, 1, 1,
0.1025008, -0.8595909, 3.84606, 0, 0.8666667, 1, 1,
0.1041691, 1.302436, -0.7279274, 0, 0.8627451, 1, 1,
0.1059231, -1.216472, 2.365942, 0, 0.854902, 1, 1,
0.106005, 0.04018974, 0.4528288, 0, 0.8509804, 1, 1,
0.1082572, -0.1208942, 3.497691, 0, 0.8431373, 1, 1,
0.1100791, -0.1178327, 2.223752, 0, 0.8392157, 1, 1,
0.1107693, -0.9104658, 2.250422, 0, 0.8313726, 1, 1,
0.1114393, -1.075223, 2.742867, 0, 0.827451, 1, 1,
0.1138926, 0.5088608, 0.9987537, 0, 0.8196079, 1, 1,
0.114299, 0.2150244, 0.5129012, 0, 0.8156863, 1, 1,
0.1162911, 0.1267469, 0.6061593, 0, 0.8078431, 1, 1,
0.1171811, -0.9626558, 3.57875, 0, 0.8039216, 1, 1,
0.1178649, -0.662683, 2.357286, 0, 0.7960784, 1, 1,
0.1258328, -0.4762501, 2.290977, 0, 0.7882353, 1, 1,
0.1268216, -0.676999, 3.804696, 0, 0.7843137, 1, 1,
0.1319204, -1.514214, 3.404731, 0, 0.7764706, 1, 1,
0.1394456, 0.2546207, 0.637005, 0, 0.772549, 1, 1,
0.1439717, -0.01822572, 2.107567, 0, 0.7647059, 1, 1,
0.1460963, -0.5678645, 2.427202, 0, 0.7607843, 1, 1,
0.1529518, -0.9674981, 3.255392, 0, 0.7529412, 1, 1,
0.1558621, -1.344214, 2.29867, 0, 0.7490196, 1, 1,
0.1562133, 1.259317, -0.5814384, 0, 0.7411765, 1, 1,
0.1570273, 0.2143278, 1.055624, 0, 0.7372549, 1, 1,
0.1608409, 1.688478, 0.5340952, 0, 0.7294118, 1, 1,
0.1628593, 1.499152, -1.06985, 0, 0.7254902, 1, 1,
0.1647842, 1.09663, -0.354137, 0, 0.7176471, 1, 1,
0.165864, -1.517068, 2.969429, 0, 0.7137255, 1, 1,
0.1690423, -1.193873, 2.515606, 0, 0.7058824, 1, 1,
0.1778531, -0.1916093, 2.421221, 0, 0.6980392, 1, 1,
0.1815837, 0.3769011, -0.1872199, 0, 0.6941177, 1, 1,
0.1837415, -0.6971629, 4.941319, 0, 0.6862745, 1, 1,
0.1852431, -0.2320658, 1.870531, 0, 0.682353, 1, 1,
0.1944852, -2.262069, 3.758787, 0, 0.6745098, 1, 1,
0.1973099, 0.1206507, 2.023962, 0, 0.6705883, 1, 1,
0.199868, -0.3549657, 1.158111, 0, 0.6627451, 1, 1,
0.2013736, 0.5414529, -1.300084, 0, 0.6588235, 1, 1,
0.2015937, -0.3308654, 3.31263, 0, 0.6509804, 1, 1,
0.2066766, 0.5701008, -0.4253683, 0, 0.6470588, 1, 1,
0.2072023, -0.08746848, 3.629511, 0, 0.6392157, 1, 1,
0.2147075, -0.5159867, 1.150821, 0, 0.6352941, 1, 1,
0.2150666, 0.4703974, 0.1850779, 0, 0.627451, 1, 1,
0.2168463, 1.162897, -0.2857403, 0, 0.6235294, 1, 1,
0.2179867, 1.275453, 1.254258, 0, 0.6156863, 1, 1,
0.2206308, 0.5194243, 1.049271, 0, 0.6117647, 1, 1,
0.2210422, 0.5736721, 1.78165, 0, 0.6039216, 1, 1,
0.2223738, -0.2258458, 1.990181, 0, 0.5960785, 1, 1,
0.2250632, -0.05961636, 2.492778, 0, 0.5921569, 1, 1,
0.2267961, -0.9411696, 3.019902, 0, 0.5843138, 1, 1,
0.227477, 0.03537851, -0.7526911, 0, 0.5803922, 1, 1,
0.2297378, -1.008947, 2.452712, 0, 0.572549, 1, 1,
0.2310554, 0.4368432, 0.9806282, 0, 0.5686275, 1, 1,
0.2310764, 0.5016857, -0.3666942, 0, 0.5607843, 1, 1,
0.2323046, 2.347898, -0.4339395, 0, 0.5568628, 1, 1,
0.2358585, -0.2593503, 2.117087, 0, 0.5490196, 1, 1,
0.2371926, 0.3006642, 0.4161804, 0, 0.5450981, 1, 1,
0.2385179, 1.04636, -1.225811, 0, 0.5372549, 1, 1,
0.2416723, -0.4670407, 2.209695, 0, 0.5333334, 1, 1,
0.2466513, -0.719567, 3.668889, 0, 0.5254902, 1, 1,
0.2478633, -0.9183592, 3.699765, 0, 0.5215687, 1, 1,
0.2480526, -0.6489437, 2.721554, 0, 0.5137255, 1, 1,
0.250373, -0.4865467, 4.149704, 0, 0.509804, 1, 1,
0.2513644, -0.01583636, 1.843916, 0, 0.5019608, 1, 1,
0.2564124, -2.682023, 3.795849, 0, 0.4941176, 1, 1,
0.2607778, 0.06656089, 1.317357, 0, 0.4901961, 1, 1,
0.2649334, -0.2368995, 2.521162, 0, 0.4823529, 1, 1,
0.265933, -1.201072, 4.384939, 0, 0.4784314, 1, 1,
0.2683367, 1.734247, -0.5765819, 0, 0.4705882, 1, 1,
0.2689182, 0.9270861, -2.387605, 0, 0.4666667, 1, 1,
0.2699576, -1.213227, 1.496272, 0, 0.4588235, 1, 1,
0.2711369, 1.09647, 0.8307658, 0, 0.454902, 1, 1,
0.2714063, 0.133795, 0.6093212, 0, 0.4470588, 1, 1,
0.2779691, -1.599792, 3.138612, 0, 0.4431373, 1, 1,
0.2784878, 0.01093561, 1.538105, 0, 0.4352941, 1, 1,
0.2806024, -0.7605703, 1.823014, 0, 0.4313726, 1, 1,
0.286244, 0.3362113, -0.9370019, 0, 0.4235294, 1, 1,
0.2870466, 0.7156342, -0.01974648, 0, 0.4196078, 1, 1,
0.2910446, -1.199386, 4.679815, 0, 0.4117647, 1, 1,
0.2943203, 1.258085, 0.41552, 0, 0.4078431, 1, 1,
0.2974366, 2.365997, -0.106486, 0, 0.4, 1, 1,
0.3113772, -1.037172, 2.09838, 0, 0.3921569, 1, 1,
0.3158622, 0.6598288, -0.07489381, 0, 0.3882353, 1, 1,
0.322587, 0.9033625, 1.067427, 0, 0.3803922, 1, 1,
0.3258998, 0.974484, -1.402536, 0, 0.3764706, 1, 1,
0.3259938, -0.07927886, 0.9229465, 0, 0.3686275, 1, 1,
0.3263936, 1.479965, 1.194479, 0, 0.3647059, 1, 1,
0.3277735, 0.3204351, 2.115057, 0, 0.3568628, 1, 1,
0.327834, 0.2268595, 0.8348033, 0, 0.3529412, 1, 1,
0.3323105, 0.3823582, 1.397692, 0, 0.345098, 1, 1,
0.3324489, 1.788208, 2.163534, 0, 0.3411765, 1, 1,
0.3325835, -2.339776, 4.342167, 0, 0.3333333, 1, 1,
0.3332413, 0.3070784, -0.0555791, 0, 0.3294118, 1, 1,
0.3333012, -0.3475788, 2.317832, 0, 0.3215686, 1, 1,
0.3373106, 1.291028, 1.483883, 0, 0.3176471, 1, 1,
0.3381711, 0.8054211, -0.71023, 0, 0.3098039, 1, 1,
0.3409347, -0.704844, 2.553424, 0, 0.3058824, 1, 1,
0.3433518, -0.7421505, 0.8576764, 0, 0.2980392, 1, 1,
0.3442487, -0.7136188, 2.245796, 0, 0.2901961, 1, 1,
0.3445933, -0.4105092, 2.783483, 0, 0.2862745, 1, 1,
0.3451876, 0.323063, -0.2798862, 0, 0.2784314, 1, 1,
0.3461976, 1.208201, 1.571532, 0, 0.2745098, 1, 1,
0.3503836, 0.5987893, 0.04091233, 0, 0.2666667, 1, 1,
0.3558414, -0.1450928, 0.6143556, 0, 0.2627451, 1, 1,
0.3617192, 0.03085427, 0.3779234, 0, 0.254902, 1, 1,
0.3621003, -0.1022232, 1.803327, 0, 0.2509804, 1, 1,
0.3675707, 0.5069631, -1.012492, 0, 0.2431373, 1, 1,
0.3716919, 0.5343652, -0.150374, 0, 0.2392157, 1, 1,
0.372021, 0.4028272, 0.8572114, 0, 0.2313726, 1, 1,
0.3754969, 0.4942029, -0.09809099, 0, 0.227451, 1, 1,
0.3758809, 1.40686, 0.6027149, 0, 0.2196078, 1, 1,
0.3790454, 0.7781001, -0.4255585, 0, 0.2156863, 1, 1,
0.379599, -0.959514, 3.807556, 0, 0.2078431, 1, 1,
0.3828459, -1.898091, 1.685513, 0, 0.2039216, 1, 1,
0.3848448, -0.2360351, 1.793733, 0, 0.1960784, 1, 1,
0.3882216, -0.5235633, 0.8496864, 0, 0.1882353, 1, 1,
0.3909163, 0.7694284, 0.9453292, 0, 0.1843137, 1, 1,
0.3985732, -1.989588, 2.476909, 0, 0.1764706, 1, 1,
0.4050858, 0.0101845, 2.17005, 0, 0.172549, 1, 1,
0.4062002, -1.68466, 2.482404, 0, 0.1647059, 1, 1,
0.4078002, -1.744016, 3.029478, 0, 0.1607843, 1, 1,
0.4096143, -0.7472863, 3.530587, 0, 0.1529412, 1, 1,
0.4101315, -0.8428187, 3.841303, 0, 0.1490196, 1, 1,
0.4136373, -0.6674498, 3.9385, 0, 0.1411765, 1, 1,
0.4147459, 0.4571329, 0.1314114, 0, 0.1372549, 1, 1,
0.4183097, -0.5508689, 2.057798, 0, 0.1294118, 1, 1,
0.4184846, -0.7557438, 4.647259, 0, 0.1254902, 1, 1,
0.4203588, 0.08492751, 1.191184, 0, 0.1176471, 1, 1,
0.4264746, -0.4022343, 1.035965, 0, 0.1137255, 1, 1,
0.4304483, 0.4639629, 2.458736, 0, 0.1058824, 1, 1,
0.4425453, -0.8754797, 2.925498, 0, 0.09803922, 1, 1,
0.4430023, 1.244288, -0.2817278, 0, 0.09411765, 1, 1,
0.4448134, 0.4891278, 1.807679, 0, 0.08627451, 1, 1,
0.4452934, 1.074491, 0.1524983, 0, 0.08235294, 1, 1,
0.4491815, -0.9018928, 2.511558, 0, 0.07450981, 1, 1,
0.4504339, 0.1281117, 1.947686, 0, 0.07058824, 1, 1,
0.4506381, -0.4548714, 2.604657, 0, 0.0627451, 1, 1,
0.4510166, -0.04288391, 2.446059, 0, 0.05882353, 1, 1,
0.4511306, 1.666388, 1.574943, 0, 0.05098039, 1, 1,
0.4560043, 0.5882517, 0.5229914, 0, 0.04705882, 1, 1,
0.4709097, 0.7541977, 0.7044884, 0, 0.03921569, 1, 1,
0.4713471, -0.8474178, 2.928522, 0, 0.03529412, 1, 1,
0.4734347, -1.536368, 1.741162, 0, 0.02745098, 1, 1,
0.4753713, -0.9685403, 2.476897, 0, 0.02352941, 1, 1,
0.4803447, -0.524583, 2.149832, 0, 0.01568628, 1, 1,
0.4808089, 0.1705699, 0.570883, 0, 0.01176471, 1, 1,
0.4818402, 1.947582, 1.297825, 0, 0.003921569, 1, 1,
0.4847609, -0.9297167, 1.081773, 0.003921569, 0, 1, 1,
0.4864747, 0.1848029, -0.9438477, 0.007843138, 0, 1, 1,
0.4901376, 0.0737422, 1.729535, 0.01568628, 0, 1, 1,
0.4901844, 0.2461079, 1.496159, 0.01960784, 0, 1, 1,
0.4921755, -1.010749, 2.977241, 0.02745098, 0, 1, 1,
0.4943747, 1.159611, -1.297274, 0.03137255, 0, 1, 1,
0.4988574, -0.5610517, 2.485521, 0.03921569, 0, 1, 1,
0.5005562, 0.2450933, 0.9048977, 0.04313726, 0, 1, 1,
0.5009216, -1.264096, 3.613246, 0.05098039, 0, 1, 1,
0.5031477, 0.4773156, 2.33352, 0.05490196, 0, 1, 1,
0.5035239, 1.899871, 1.299276, 0.0627451, 0, 1, 1,
0.5107388, 0.1648132, 1.20583, 0.06666667, 0, 1, 1,
0.5151917, -0.2008723, 0.414793, 0.07450981, 0, 1, 1,
0.5158913, 1.837469, 0.1964147, 0.07843138, 0, 1, 1,
0.5218318, -0.3775019, 3.51641, 0.08627451, 0, 1, 1,
0.527585, 0.8636298, 2.611626, 0.09019608, 0, 1, 1,
0.5293294, -1.401962, 3.095411, 0.09803922, 0, 1, 1,
0.5335619, -1.147275, 0.5186818, 0.1058824, 0, 1, 1,
0.5401334, 0.3484685, 2.889301, 0.1098039, 0, 1, 1,
0.5409684, 1.146394, 1.045201, 0.1176471, 0, 1, 1,
0.5438684, 0.6514237, 0.8982878, 0.1215686, 0, 1, 1,
0.5448111, -0.1262725, 2.920397, 0.1294118, 0, 1, 1,
0.5451667, 0.7207193, 1.005916, 0.1333333, 0, 1, 1,
0.5498905, 1.557587, 1.102849, 0.1411765, 0, 1, 1,
0.5559727, 0.5190898, 0.0718348, 0.145098, 0, 1, 1,
0.5578554, -0.4956128, 3.253241, 0.1529412, 0, 1, 1,
0.5618597, 1.061908, 0.508792, 0.1568628, 0, 1, 1,
0.5619866, 0.2988693, 0.7693148, 0.1647059, 0, 1, 1,
0.5636484, 1.183349, 1.931326, 0.1686275, 0, 1, 1,
0.5637338, -0.2060717, 1.453254, 0.1764706, 0, 1, 1,
0.5645469, -0.2551035, 2.579431, 0.1803922, 0, 1, 1,
0.5710285, 0.4210769, 0.3995258, 0.1882353, 0, 1, 1,
0.5717509, -0.4786458, 2.997257, 0.1921569, 0, 1, 1,
0.5743138, -1.369853, 2.628469, 0.2, 0, 1, 1,
0.5790887, 0.7928008, 0.4595101, 0.2078431, 0, 1, 1,
0.582879, 0.4719093, 0.4711579, 0.2117647, 0, 1, 1,
0.5829595, 2.326235, 1.219733, 0.2196078, 0, 1, 1,
0.5874698, 2.149416, 1.538811, 0.2235294, 0, 1, 1,
0.5878434, 0.162536, 0.7748452, 0.2313726, 0, 1, 1,
0.5885146, -1.634279, 2.759037, 0.2352941, 0, 1, 1,
0.596191, -0.2563869, 3.276112, 0.2431373, 0, 1, 1,
0.59901, 1.13038, -1.110929, 0.2470588, 0, 1, 1,
0.6041493, 0.2546371, 0.891602, 0.254902, 0, 1, 1,
0.6066728, -2.161685, 3.562984, 0.2588235, 0, 1, 1,
0.611096, -0.02426617, 0.2847817, 0.2666667, 0, 1, 1,
0.6117705, -1.433543, 3.293136, 0.2705882, 0, 1, 1,
0.611989, -0.376628, 2.428527, 0.2784314, 0, 1, 1,
0.616854, -1.216585, 3.322083, 0.282353, 0, 1, 1,
0.6177379, 0.07682218, 2.249954, 0.2901961, 0, 1, 1,
0.6183429, -0.3555227, 4.286862, 0.2941177, 0, 1, 1,
0.6204756, 0.4221087, 2.072559, 0.3019608, 0, 1, 1,
0.6232831, 0.8549361, 0.1186716, 0.3098039, 0, 1, 1,
0.6248394, 0.4177917, 0.7776878, 0.3137255, 0, 1, 1,
0.6314827, -1.037438, 2.653529, 0.3215686, 0, 1, 1,
0.6359316, 0.01394888, 0.6247329, 0.3254902, 0, 1, 1,
0.6414301, 1.51141, 0.9359665, 0.3333333, 0, 1, 1,
0.6415687, -0.02184057, 0.6505836, 0.3372549, 0, 1, 1,
0.6433638, 2.664906, 0.1911498, 0.345098, 0, 1, 1,
0.6437338, 0.5678726, 1.933725, 0.3490196, 0, 1, 1,
0.644449, -0.7826775, 2.815648, 0.3568628, 0, 1, 1,
0.6461103, -1.535723, 1.604153, 0.3607843, 0, 1, 1,
0.6473038, 0.7592425, 1.70983, 0.3686275, 0, 1, 1,
0.6491699, -0.06424958, 2.198214, 0.372549, 0, 1, 1,
0.6493241, 0.3932025, 2.417015, 0.3803922, 0, 1, 1,
0.6583475, 1.212131, -0.1975335, 0.3843137, 0, 1, 1,
0.6609802, -0.03805145, 3.109533, 0.3921569, 0, 1, 1,
0.6651722, 0.458507, 0.2822629, 0.3960784, 0, 1, 1,
0.6705192, 0.9770809, 1.979476, 0.4039216, 0, 1, 1,
0.6706764, -0.452897, 2.263392, 0.4117647, 0, 1, 1,
0.6796438, 0.3691046, 1.988691, 0.4156863, 0, 1, 1,
0.6806769, -0.09026984, 1.033898, 0.4235294, 0, 1, 1,
0.6809462, 1.018856, -0.7119452, 0.427451, 0, 1, 1,
0.6854962, 1.747007, 0.1548246, 0.4352941, 0, 1, 1,
0.6897463, 0.6976689, 0.6841208, 0.4392157, 0, 1, 1,
0.6944183, -0.3498777, 1.737929, 0.4470588, 0, 1, 1,
0.6985448, 0.429052, 1.013304, 0.4509804, 0, 1, 1,
0.699766, -0.9014838, 2.247366, 0.4588235, 0, 1, 1,
0.6999318, -1.126135, 1.739419, 0.4627451, 0, 1, 1,
0.7028433, -0.4675698, 2.49493, 0.4705882, 0, 1, 1,
0.7043161, -0.1948271, 2.197457, 0.4745098, 0, 1, 1,
0.7083931, 0.6918155, 2.202587, 0.4823529, 0, 1, 1,
0.7086176, -0.2495372, 2.415187, 0.4862745, 0, 1, 1,
0.7111278, 0.716216, 0.3502838, 0.4941176, 0, 1, 1,
0.7120066, -0.7392388, 2.241603, 0.5019608, 0, 1, 1,
0.7190529, -0.2309842, 1.568031, 0.5058824, 0, 1, 1,
0.7309887, 0.6679376, -1.424115, 0.5137255, 0, 1, 1,
0.7391202, 0.8418221, 0.6527024, 0.5176471, 0, 1, 1,
0.740103, 1.764422, 0.208418, 0.5254902, 0, 1, 1,
0.7413562, -0.7244763, 1.42428, 0.5294118, 0, 1, 1,
0.743045, -0.3532751, 1.811792, 0.5372549, 0, 1, 1,
0.7498436, -1.785885, 3.169034, 0.5411765, 0, 1, 1,
0.7501519, 0.6237596, 0.01109013, 0.5490196, 0, 1, 1,
0.7511013, -1.399922, 2.05709, 0.5529412, 0, 1, 1,
0.7524008, 0.4159765, 2.430378, 0.5607843, 0, 1, 1,
0.7529257, -0.8813777, 3.406221, 0.5647059, 0, 1, 1,
0.7534085, 0.8182244, 1.232343, 0.572549, 0, 1, 1,
0.7626545, 0.06539713, 3.247705, 0.5764706, 0, 1, 1,
0.7641876, -0.4066664, 1.114272, 0.5843138, 0, 1, 1,
0.7659838, -0.2545727, 1.847983, 0.5882353, 0, 1, 1,
0.7676259, -0.7988325, 2.50088, 0.5960785, 0, 1, 1,
0.7681237, 0.139331, 2.945896, 0.6039216, 0, 1, 1,
0.7731877, -1.040003, 2.146651, 0.6078432, 0, 1, 1,
0.7749722, -1.068012, 3.616611, 0.6156863, 0, 1, 1,
0.7766749, 0.3761234, 0.08788497, 0.6196079, 0, 1, 1,
0.7771993, 0.6986486, 1.110143, 0.627451, 0, 1, 1,
0.777768, -1.312484, 2.557449, 0.6313726, 0, 1, 1,
0.7792228, -0.6075172, 2.724749, 0.6392157, 0, 1, 1,
0.7823489, -0.7459651, 4.50314, 0.6431373, 0, 1, 1,
0.7921915, -0.4938084, 3.094079, 0.6509804, 0, 1, 1,
0.7935306, -0.9016793, 3.004712, 0.654902, 0, 1, 1,
0.7967364, -0.689868, 3.533229, 0.6627451, 0, 1, 1,
0.8033423, 2.195928, -0.678876, 0.6666667, 0, 1, 1,
0.8058942, 0.3171276, 1.611788, 0.6745098, 0, 1, 1,
0.8073515, -0.374256, 1.667468, 0.6784314, 0, 1, 1,
0.8170214, 0.674866, 0.8356463, 0.6862745, 0, 1, 1,
0.8260881, 2.204093, 0.4634466, 0.6901961, 0, 1, 1,
0.8294746, -0.2434549, 1.098015, 0.6980392, 0, 1, 1,
0.8361285, 0.8148443, 1.69265, 0.7058824, 0, 1, 1,
0.8405747, 0.4714189, 2.003235, 0.7098039, 0, 1, 1,
0.8410785, -0.04664601, 1.473829, 0.7176471, 0, 1, 1,
0.8420997, -1.972088, 3.178616, 0.7215686, 0, 1, 1,
0.8466145, 0.5649952, 1.358685, 0.7294118, 0, 1, 1,
0.8646846, -0.7679521, 3.333627, 0.7333333, 0, 1, 1,
0.8678551, 1.482576, 3.003691, 0.7411765, 0, 1, 1,
0.8763205, 1.080764, 1.762812, 0.7450981, 0, 1, 1,
0.8770694, 0.7711782, 0.6776328, 0.7529412, 0, 1, 1,
0.8830731, 0.8370057, -1.027068, 0.7568628, 0, 1, 1,
0.8845621, 0.8085419, 1.653812, 0.7647059, 0, 1, 1,
0.8847474, -0.4161017, 2.6905, 0.7686275, 0, 1, 1,
0.8856591, -2.239202, 3.692454, 0.7764706, 0, 1, 1,
0.8967327, 2.086817, 1.352895, 0.7803922, 0, 1, 1,
0.8976239, -0.1346513, 1.656199, 0.7882353, 0, 1, 1,
0.904738, -1.583852, 1.428478, 0.7921569, 0, 1, 1,
0.9078136, -1.005133, 2.369411, 0.8, 0, 1, 1,
0.9079626, -0.2165834, 4.976403, 0.8078431, 0, 1, 1,
0.9118086, -1.922974, 2.59876, 0.8117647, 0, 1, 1,
0.9140437, -0.005327296, 1.686235, 0.8196079, 0, 1, 1,
0.9174721, 1.312393, -0.4648706, 0.8235294, 0, 1, 1,
0.9178696, 0.5811518, 1.240912, 0.8313726, 0, 1, 1,
0.9198812, 0.002986512, 0.8200983, 0.8352941, 0, 1, 1,
0.921994, 0.8914218, 3.384092, 0.8431373, 0, 1, 1,
0.9221016, 1.094692, 1.818257, 0.8470588, 0, 1, 1,
0.9312018, -1.385658, 2.004709, 0.854902, 0, 1, 1,
0.9516265, 1.657172, 0.7325588, 0.8588235, 0, 1, 1,
0.9521891, -0.5792553, 2.285247, 0.8666667, 0, 1, 1,
0.9568304, -0.2502644, 0.8965906, 0.8705882, 0, 1, 1,
0.9734926, -0.5814951, 2.110654, 0.8784314, 0, 1, 1,
0.9860353, 0.715194, 1.858086, 0.8823529, 0, 1, 1,
0.9864556, 1.243198, -1.64304, 0.8901961, 0, 1, 1,
0.9891931, 1.080411, 1.927147, 0.8941177, 0, 1, 1,
0.9896494, 2.551723, -1.029987, 0.9019608, 0, 1, 1,
0.9909285, 0.08300192, 1.995532, 0.9098039, 0, 1, 1,
0.9916959, -0.7595251, 1.369648, 0.9137255, 0, 1, 1,
0.9982333, 0.2052816, 2.947494, 0.9215686, 0, 1, 1,
0.9996629, 0.4051282, 0.4918052, 0.9254902, 0, 1, 1,
1.002662, 0.293202, 0.6313907, 0.9333333, 0, 1, 1,
1.00981, 1.445678, -0.09358936, 0.9372549, 0, 1, 1,
1.01836, -0.4255856, 3.419024, 0.945098, 0, 1, 1,
1.020968, -1.531682, 2.958442, 0.9490196, 0, 1, 1,
1.027707, 0.2449315, 0.5023959, 0.9568627, 0, 1, 1,
1.03071, 0.8044971, 1.813383, 0.9607843, 0, 1, 1,
1.033098, 0.05815245, -0.316385, 0.9686275, 0, 1, 1,
1.033566, -1.19109, 1.121019, 0.972549, 0, 1, 1,
1.035783, 0.2424118, 1.650888, 0.9803922, 0, 1, 1,
1.036636, 0.1202298, 1.620739, 0.9843137, 0, 1, 1,
1.036643, -0.1291277, 0.7832903, 0.9921569, 0, 1, 1,
1.046962, -0.1174628, 1.926993, 0.9960784, 0, 1, 1,
1.053545, -0.689921, 1.628722, 1, 0, 0.9960784, 1,
1.054998, 0.2576017, 3.632384, 1, 0, 0.9882353, 1,
1.057925, 1.142952, 2.401188, 1, 0, 0.9843137, 1,
1.062218, 1.088684, 0.7404594, 1, 0, 0.9764706, 1,
1.064851, -0.2317909, 0.6152396, 1, 0, 0.972549, 1,
1.080849, -0.009296926, 1.003822, 1, 0, 0.9647059, 1,
1.08912, -0.2390401, 2.218756, 1, 0, 0.9607843, 1,
1.089738, 0.1110066, 1.761072, 1, 0, 0.9529412, 1,
1.091352, 0.8512037, 0.4322865, 1, 0, 0.9490196, 1,
1.094418, 0.2058237, 1.972032, 1, 0, 0.9411765, 1,
1.103914, 1.044333, -0.4696129, 1, 0, 0.9372549, 1,
1.104442, 0.5394232, 1.036742, 1, 0, 0.9294118, 1,
1.109219, -0.1061761, 2.243617, 1, 0, 0.9254902, 1,
1.11083, -1.202548, 2.727351, 1, 0, 0.9176471, 1,
1.114479, 1.482716, 2.113108, 1, 0, 0.9137255, 1,
1.125068, -0.8966933, 1.270214, 1, 0, 0.9058824, 1,
1.128475, -0.8260052, 2.634858, 1, 0, 0.9019608, 1,
1.131405, 0.2898742, 1.658908, 1, 0, 0.8941177, 1,
1.131736, 1.394381, -0.418799, 1, 0, 0.8862745, 1,
1.13338, 0.8841305, 1.014401, 1, 0, 0.8823529, 1,
1.139533, 0.7689651, 1.395898, 1, 0, 0.8745098, 1,
1.148235, -0.2930525, 1.976102, 1, 0, 0.8705882, 1,
1.152402, -1.669972, 1.112984, 1, 0, 0.8627451, 1,
1.155398, 0.5374813, -0.4865676, 1, 0, 0.8588235, 1,
1.158619, 1.011885, 0.237912, 1, 0, 0.8509804, 1,
1.163378, -0.169082, 1.651271, 1, 0, 0.8470588, 1,
1.168583, 0.5751144, 0.3091797, 1, 0, 0.8392157, 1,
1.170359, -1.079222, 3.403146, 1, 0, 0.8352941, 1,
1.18014, -0.9727092, 2.972536, 1, 0, 0.827451, 1,
1.18062, 0.3027701, 1.558674, 1, 0, 0.8235294, 1,
1.182352, 1.754286, -0.07444324, 1, 0, 0.8156863, 1,
1.192487, 0.7066011, 1.736564, 1, 0, 0.8117647, 1,
1.198978, 0.07299499, 1.419284, 1, 0, 0.8039216, 1,
1.200323, 0.9422004, 0.7653598, 1, 0, 0.7960784, 1,
1.200662, 0.0545163, 1.283969, 1, 0, 0.7921569, 1,
1.20688, 0.9540088, 1.744718, 1, 0, 0.7843137, 1,
1.213012, 0.04799435, 1.498492, 1, 0, 0.7803922, 1,
1.222311, 1.729818, 0.4157121, 1, 0, 0.772549, 1,
1.241729, 0.6785526, 2.154096, 1, 0, 0.7686275, 1,
1.250125, -0.2782662, 0.6697361, 1, 0, 0.7607843, 1,
1.251206, 1.615275, 1.136762, 1, 0, 0.7568628, 1,
1.260896, 1.018127, 1.691017, 1, 0, 0.7490196, 1,
1.261054, -0.3091486, 2.059945, 1, 0, 0.7450981, 1,
1.262402, -1.17682, 2.5705, 1, 0, 0.7372549, 1,
1.269249, 0.8271435, 1.904617, 1, 0, 0.7333333, 1,
1.269466, -0.2890457, 0.1627693, 1, 0, 0.7254902, 1,
1.271301, 0.292416, 0.5724661, 1, 0, 0.7215686, 1,
1.273184, -0.795516, 4.001609, 1, 0, 0.7137255, 1,
1.276595, 0.09624398, 2.223656, 1, 0, 0.7098039, 1,
1.30296, -0.2047937, 1.729287, 1, 0, 0.7019608, 1,
1.305236, 1.841406, 2.23475, 1, 0, 0.6941177, 1,
1.309358, -1.183196, 1.513551, 1, 0, 0.6901961, 1,
1.328209, -1.115649, 1.356328, 1, 0, 0.682353, 1,
1.333333, 0.2626563, 1.72003, 1, 0, 0.6784314, 1,
1.341431, -1.541446, 2.842489, 1, 0, 0.6705883, 1,
1.342136, 0.2847415, 1.285385, 1, 0, 0.6666667, 1,
1.349228, 0.1928314, 2.811415, 1, 0, 0.6588235, 1,
1.35283, 0.8928521, 1.694361, 1, 0, 0.654902, 1,
1.356693, -0.1240167, 0.6506087, 1, 0, 0.6470588, 1,
1.360618, -0.9596786, 0.9364032, 1, 0, 0.6431373, 1,
1.361808, -1.545812, 3.82673, 1, 0, 0.6352941, 1,
1.362651, 0.3025192, 2.077557, 1, 0, 0.6313726, 1,
1.364741, 0.7885236, 0.05134669, 1, 0, 0.6235294, 1,
1.365306, 0.9716504, 3.17141, 1, 0, 0.6196079, 1,
1.36797, 0.6135648, 2.200397, 1, 0, 0.6117647, 1,
1.369673, 1.870701, 0.08212306, 1, 0, 0.6078432, 1,
1.372703, 1.31854, 2.321091, 1, 0, 0.6, 1,
1.373231, -0.09502154, 1.658838, 1, 0, 0.5921569, 1,
1.37526, -0.8148669, 2.143782, 1, 0, 0.5882353, 1,
1.3759, -0.3041158, 1.63888, 1, 0, 0.5803922, 1,
1.383198, 1.841014, -0.400416, 1, 0, 0.5764706, 1,
1.38541, -1.060417, 2.310816, 1, 0, 0.5686275, 1,
1.396561, -1.184929, 3.481319, 1, 0, 0.5647059, 1,
1.407186, 1.505824, 1.615134, 1, 0, 0.5568628, 1,
1.407932, -0.7549056, 2.082066, 1, 0, 0.5529412, 1,
1.413951, 0.290029, 3.635076, 1, 0, 0.5450981, 1,
1.414839, 1.51003, -0.0172494, 1, 0, 0.5411765, 1,
1.415623, -0.3861375, 3.098435, 1, 0, 0.5333334, 1,
1.420876, 0.806633, 1.246086, 1, 0, 0.5294118, 1,
1.423849, -0.5506323, 3.56573, 1, 0, 0.5215687, 1,
1.424155, 1.97909, -0.02606113, 1, 0, 0.5176471, 1,
1.431405, 0.9258699, 1.314873, 1, 0, 0.509804, 1,
1.432574, 1.143594, 1.281454, 1, 0, 0.5058824, 1,
1.446056, 0.8948935, 0.6572865, 1, 0, 0.4980392, 1,
1.449603, 0.4500566, -0.1529228, 1, 0, 0.4901961, 1,
1.451393, 0.9521216, -0.4737399, 1, 0, 0.4862745, 1,
1.464891, -2.267944, 2.52567, 1, 0, 0.4784314, 1,
1.474873, 0.3973631, 0.06000436, 1, 0, 0.4745098, 1,
1.495345, 0.03240391, 2.904767, 1, 0, 0.4666667, 1,
1.505623, 0.2047142, 2.813456, 1, 0, 0.4627451, 1,
1.511435, 2.031158, 0.1269031, 1, 0, 0.454902, 1,
1.524831, -0.1454639, 0.5115591, 1, 0, 0.4509804, 1,
1.530757, 0.642278, -0.0449784, 1, 0, 0.4431373, 1,
1.533673, 0.8993984, 1.717251, 1, 0, 0.4392157, 1,
1.542655, -0.521593, 2.433707, 1, 0, 0.4313726, 1,
1.544117, 0.1137753, 2.69351, 1, 0, 0.427451, 1,
1.54548, -0.3547668, 0.5450773, 1, 0, 0.4196078, 1,
1.548753, 0.6798934, 3.735072, 1, 0, 0.4156863, 1,
1.557112, -0.9018305, 1.174793, 1, 0, 0.4078431, 1,
1.562619, -1.20995, 2.565533, 1, 0, 0.4039216, 1,
1.577906, -0.6259767, 1.797555, 1, 0, 0.3960784, 1,
1.580335, 0.3456367, 1.896193, 1, 0, 0.3882353, 1,
1.587972, 0.2742564, 2.109549, 1, 0, 0.3843137, 1,
1.592502, 0.1388083, 2.453345, 1, 0, 0.3764706, 1,
1.593534, 2.295995, 1.006784, 1, 0, 0.372549, 1,
1.601575, 0.8268172, 1.122562, 1, 0, 0.3647059, 1,
1.604741, -0.6920416, 0.7581244, 1, 0, 0.3607843, 1,
1.605803, 0.3535593, 2.301318, 1, 0, 0.3529412, 1,
1.639072, 0.4643114, 2.747137, 1, 0, 0.3490196, 1,
1.642365, -2.281734, 0.8087581, 1, 0, 0.3411765, 1,
1.647885, -1.120017, 4.311247, 1, 0, 0.3372549, 1,
1.650292, -0.3545808, 3.531476, 1, 0, 0.3294118, 1,
1.653629, -0.8002997, 1.457339, 1, 0, 0.3254902, 1,
1.671947, 1.003777, 1.613149, 1, 0, 0.3176471, 1,
1.674866, 2.07002, -1.942717, 1, 0, 0.3137255, 1,
1.675129, -0.06054729, 1.802594, 1, 0, 0.3058824, 1,
1.678195, -0.04858062, 0.6093495, 1, 0, 0.2980392, 1,
1.689731, 0.7062234, 0.3573452, 1, 0, 0.2941177, 1,
1.696866, -0.1952534, 2.533363, 1, 0, 0.2862745, 1,
1.703728, -0.3246633, 1.463029, 1, 0, 0.282353, 1,
1.706631, -0.08839146, 0.2184617, 1, 0, 0.2745098, 1,
1.710949, 1.387487, 1.64538, 1, 0, 0.2705882, 1,
1.720664, -1.379807, 1.754847, 1, 0, 0.2627451, 1,
1.733105, 0.2677628, 0.9420177, 1, 0, 0.2588235, 1,
1.774906, 0.3126741, 0.7695744, 1, 0, 0.2509804, 1,
1.794325, 0.4555197, 0.5947713, 1, 0, 0.2470588, 1,
1.798158, -0.3888287, 2.280462, 1, 0, 0.2392157, 1,
1.806098, 0.7832952, -0.8022766, 1, 0, 0.2352941, 1,
1.807907, 0.350421, 1.683939, 1, 0, 0.227451, 1,
1.822194, -1.049048, 0.2939596, 1, 0, 0.2235294, 1,
1.839518, -0.8173866, 3.169512, 1, 0, 0.2156863, 1,
1.849919, 0.100727, 0.1288708, 1, 0, 0.2117647, 1,
1.862574, 0.9689056, 1.30875, 1, 0, 0.2039216, 1,
1.938145, -0.9441545, 1.366162, 1, 0, 0.1960784, 1,
1.966189, 0.4775748, 1.19841, 1, 0, 0.1921569, 1,
1.967679, -0.4631159, 3.60518, 1, 0, 0.1843137, 1,
1.968526, 0.1626394, 1.277707, 1, 0, 0.1803922, 1,
2.000246, -0.1790381, 0.2008152, 1, 0, 0.172549, 1,
2.013272, -0.3254639, 1.596914, 1, 0, 0.1686275, 1,
2.019416, 0.4178299, 2.078841, 1, 0, 0.1607843, 1,
2.022233, -0.86283, 3.306997, 1, 0, 0.1568628, 1,
2.027709, -1.474608, 1.977569, 1, 0, 0.1490196, 1,
2.073305, 0.7683079, 0.07932106, 1, 0, 0.145098, 1,
2.117487, -1.904465, 2.707237, 1, 0, 0.1372549, 1,
2.15522, 2.924203, 1.756464, 1, 0, 0.1333333, 1,
2.180915, -0.2676783, 1.821131, 1, 0, 0.1254902, 1,
2.185893, -0.4533114, 1.729998, 1, 0, 0.1215686, 1,
2.192723, -1.993141, 2.962919, 1, 0, 0.1137255, 1,
2.202077, -2.048476, 2.444888, 1, 0, 0.1098039, 1,
2.206879, -0.1560545, 1.808116, 1, 0, 0.1019608, 1,
2.23052, 0.01838757, 1.079075, 1, 0, 0.09411765, 1,
2.260845, -0.1095528, 1.256471, 1, 0, 0.09019608, 1,
2.262369, 0.4372644, 0.1694533, 1, 0, 0.08235294, 1,
2.301264, -0.7920894, 0.6359142, 1, 0, 0.07843138, 1,
2.32677, -0.8296213, 1.360318, 1, 0, 0.07058824, 1,
2.335413, 0.7948769, 1.459738, 1, 0, 0.06666667, 1,
2.41756, 0.6224173, -0.721248, 1, 0, 0.05882353, 1,
2.431555, -0.3768962, 2.19473, 1, 0, 0.05490196, 1,
2.474942, 1.59685, -2.365815, 1, 0, 0.04705882, 1,
2.560259, 0.09615418, 1.562505, 1, 0, 0.04313726, 1,
2.607552, -0.7167057, 2.195923, 1, 0, 0.03529412, 1,
2.640334, -0.1482125, 1.880443, 1, 0, 0.03137255, 1,
2.679603, -1.772869, 0.9271758, 1, 0, 0.02352941, 1,
2.856579, 1.227906, 1.186366, 1, 0, 0.01960784, 1,
2.917234, 0.7569248, 1.061007, 1, 0, 0.01176471, 1,
3.91025, -1.514534, 2.727418, 1, 0, 0.007843138, 1
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
0.4373188, -4.763271, -7.659183, 0, -0.5, 0.5, 0.5,
0.4373188, -4.763271, -7.659183, 1, -0.5, 0.5, 0.5,
0.4373188, -4.763271, -7.659183, 1, 1.5, 0.5, 0.5,
0.4373188, -4.763271, -7.659183, 0, 1.5, 0.5, 0.5
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
-4.212936, -0.1350219, -7.659183, 0, -0.5, 0.5, 0.5,
-4.212936, -0.1350219, -7.659183, 1, -0.5, 0.5, 0.5,
-4.212936, -0.1350219, -7.659183, 1, 1.5, 0.5, 0.5,
-4.212936, -0.1350219, -7.659183, 0, 1.5, 0.5, 0.5
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
-4.212936, -4.763271, -0.4257283, 0, -0.5, 0.5, 0.5,
-4.212936, -4.763271, -0.4257283, 1, -0.5, 0.5, 0.5,
-4.212936, -4.763271, -0.4257283, 1, 1.5, 0.5, 0.5,
-4.212936, -4.763271, -0.4257283, 0, 1.5, 0.5, 0.5
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
-3, -3.695214, -5.989924,
3, -3.695214, -5.989924,
-3, -3.695214, -5.989924,
-3, -3.873223, -6.268134,
-2, -3.695214, -5.989924,
-2, -3.873223, -6.268134,
-1, -3.695214, -5.989924,
-1, -3.873223, -6.268134,
0, -3.695214, -5.989924,
0, -3.873223, -6.268134,
1, -3.695214, -5.989924,
1, -3.873223, -6.268134,
2, -3.695214, -5.989924,
2, -3.873223, -6.268134,
3, -3.695214, -5.989924,
3, -3.873223, -6.268134
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
-3, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
-3, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
-3, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
-3, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5,
-2, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
-2, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
-2, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
-2, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5,
-1, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
-1, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
-1, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
-1, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5,
0, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
0, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
0, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
0, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5,
1, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
1, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
1, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
1, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5,
2, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
2, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
2, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
2, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5,
3, -4.229243, -6.824553, 0, -0.5, 0.5, 0.5,
3, -4.229243, -6.824553, 1, -0.5, 0.5, 0.5,
3, -4.229243, -6.824553, 1, 1.5, 0.5, 0.5,
3, -4.229243, -6.824553, 0, 1.5, 0.5, 0.5
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
-3.139801, -3, -5.989924,
-3.139801, 3, -5.989924,
-3.139801, -3, -5.989924,
-3.318656, -3, -6.268134,
-3.139801, -2, -5.989924,
-3.318656, -2, -6.268134,
-3.139801, -1, -5.989924,
-3.318656, -1, -6.268134,
-3.139801, 0, -5.989924,
-3.318656, 0, -6.268134,
-3.139801, 1, -5.989924,
-3.318656, 1, -6.268134,
-3.139801, 2, -5.989924,
-3.318656, 2, -6.268134,
-3.139801, 3, -5.989924,
-3.318656, 3, -6.268134
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
-3.676368, -3, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, -3, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, -3, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, -3, -6.824553, 0, 1.5, 0.5, 0.5,
-3.676368, -2, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, -2, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, -2, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, -2, -6.824553, 0, 1.5, 0.5, 0.5,
-3.676368, -1, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, -1, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, -1, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, -1, -6.824553, 0, 1.5, 0.5, 0.5,
-3.676368, 0, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, 0, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, 0, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, 0, -6.824553, 0, 1.5, 0.5, 0.5,
-3.676368, 1, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, 1, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, 1, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, 1, -6.824553, 0, 1.5, 0.5, 0.5,
-3.676368, 2, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, 2, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, 2, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, 2, -6.824553, 0, 1.5, 0.5, 0.5,
-3.676368, 3, -6.824553, 0, -0.5, 0.5, 0.5,
-3.676368, 3, -6.824553, 1, -0.5, 0.5, 0.5,
-3.676368, 3, -6.824553, 1, 1.5, 0.5, 0.5,
-3.676368, 3, -6.824553, 0, 1.5, 0.5, 0.5
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
-3.139801, -3.695214, -4,
-3.139801, -3.695214, 4,
-3.139801, -3.695214, -4,
-3.318656, -3.873223, -4,
-3.139801, -3.695214, -2,
-3.318656, -3.873223, -2,
-3.139801, -3.695214, 0,
-3.318656, -3.873223, 0,
-3.139801, -3.695214, 2,
-3.318656, -3.873223, 2,
-3.139801, -3.695214, 4,
-3.318656, -3.873223, 4
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
-3.676368, -4.229243, -4, 0, -0.5, 0.5, 0.5,
-3.676368, -4.229243, -4, 1, -0.5, 0.5, 0.5,
-3.676368, -4.229243, -4, 1, 1.5, 0.5, 0.5,
-3.676368, -4.229243, -4, 0, 1.5, 0.5, 0.5,
-3.676368, -4.229243, -2, 0, -0.5, 0.5, 0.5,
-3.676368, -4.229243, -2, 1, -0.5, 0.5, 0.5,
-3.676368, -4.229243, -2, 1, 1.5, 0.5, 0.5,
-3.676368, -4.229243, -2, 0, 1.5, 0.5, 0.5,
-3.676368, -4.229243, 0, 0, -0.5, 0.5, 0.5,
-3.676368, -4.229243, 0, 1, -0.5, 0.5, 0.5,
-3.676368, -4.229243, 0, 1, 1.5, 0.5, 0.5,
-3.676368, -4.229243, 0, 0, 1.5, 0.5, 0.5,
-3.676368, -4.229243, 2, 0, -0.5, 0.5, 0.5,
-3.676368, -4.229243, 2, 1, -0.5, 0.5, 0.5,
-3.676368, -4.229243, 2, 1, 1.5, 0.5, 0.5,
-3.676368, -4.229243, 2, 0, 1.5, 0.5, 0.5,
-3.676368, -4.229243, 4, 0, -0.5, 0.5, 0.5,
-3.676368, -4.229243, 4, 1, -0.5, 0.5, 0.5,
-3.676368, -4.229243, 4, 1, 1.5, 0.5, 0.5,
-3.676368, -4.229243, 4, 0, 1.5, 0.5, 0.5
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
-3.139801, -3.695214, -5.989924,
-3.139801, 3.42517, -5.989924,
-3.139801, -3.695214, 5.138467,
-3.139801, 3.42517, 5.138467,
-3.139801, -3.695214, -5.989924,
-3.139801, -3.695214, 5.138467,
-3.139801, 3.42517, -5.989924,
-3.139801, 3.42517, 5.138467,
-3.139801, -3.695214, -5.989924,
4.014438, -3.695214, -5.989924,
-3.139801, -3.695214, 5.138467,
4.014438, -3.695214, 5.138467,
-3.139801, 3.42517, -5.989924,
4.014438, 3.42517, -5.989924,
-3.139801, 3.42517, 5.138467,
4.014438, 3.42517, 5.138467,
4.014438, -3.695214, -5.989924,
4.014438, 3.42517, -5.989924,
4.014438, -3.695214, 5.138467,
4.014438, 3.42517, 5.138467,
4.014438, -3.695214, -5.989924,
4.014438, -3.695214, 5.138467,
4.014438, 3.42517, -5.989924,
4.014438, 3.42517, 5.138467
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
var radius = 8.022587;
var distance = 35.6934;
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
mvMatrix.translate( -0.4373188, 0.1350219, 0.4257283 );
mvMatrix.scale( 1.212453, 1.218218, 0.7794638 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.6934);
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
N-ethylsulfonyl-2-ni<-read.table("N-ethylsulfonyl-2-ni.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-ethylsulfonyl-2-ni$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-ethylsulfonyl-2-ni$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-ethylsulfonyl-2-ni$V4
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
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
-3.035613, -1.237312, -1.133982, 0, 0, 1, 1, 1,
-2.984753, 0.5125709, -1.059441, 1, 0, 0, 1, 1,
-2.862954, 1.7011, -1.114014, 1, 0, 0, 1, 1,
-2.619433, -0.6406502, -0.5890241, 1, 0, 0, 1, 1,
-2.596642, -2.453688, -1.593102, 1, 0, 0, 1, 1,
-2.549494, -1.454189, -1.770043, 1, 0, 0, 1, 1,
-2.543097, -0.6825519, -1.638199, 0, 0, 0, 1, 1,
-2.373434, -1.433446, -1.031922, 0, 0, 0, 1, 1,
-2.370705, -0.3839424, -2.891787, 0, 0, 0, 1, 1,
-2.369992, 0.7876926, -2.039831, 0, 0, 0, 1, 1,
-2.351271, 0.1954592, -1.955599, 0, 0, 0, 1, 1,
-2.337581, 0.05608407, -1.663556, 0, 0, 0, 1, 1,
-2.268634, -0.245868, -2.06796, 0, 0, 0, 1, 1,
-2.224068, 0.341435, -1.717913, 1, 1, 1, 1, 1,
-2.085001, -0.7210249, -1.312431, 1, 1, 1, 1, 1,
-2.057644, 0.8848836, -2.463616, 1, 1, 1, 1, 1,
-2.024442, 0.1554686, -0.6474006, 1, 1, 1, 1, 1,
-2.018309, 0.9335892, -0.3472536, 1, 1, 1, 1, 1,
-1.98424, 1.633483, -0.2529203, 1, 1, 1, 1, 1,
-1.98338, 1.072434, -1.131228, 1, 1, 1, 1, 1,
-1.973225, -0.04859671, -1.094555, 1, 1, 1, 1, 1,
-1.947888, -0.3120115, -2.927305, 1, 1, 1, 1, 1,
-1.945016, 0.2219262, -2.366447, 1, 1, 1, 1, 1,
-1.919317, 0.2093125, -1.830543, 1, 1, 1, 1, 1,
-1.905963, -1.095181, -2.207592, 1, 1, 1, 1, 1,
-1.890611, -1.141058, -2.596431, 1, 1, 1, 1, 1,
-1.865441, 0.7451175, -0.3048949, 1, 1, 1, 1, 1,
-1.864305, 2.251246, -0.2171253, 1, 1, 1, 1, 1,
-1.85273, -1.123588, -0.5836526, 0, 0, 1, 1, 1,
-1.84339, -0.7051155, -0.4402699, 1, 0, 0, 1, 1,
-1.837423, -0.4141541, -2.063557, 1, 0, 0, 1, 1,
-1.835963, -0.09323335, -0.8947296, 1, 0, 0, 1, 1,
-1.795559, 0.2934478, -1.311481, 1, 0, 0, 1, 1,
-1.75361, -0.658924, -0.003111631, 1, 0, 0, 1, 1,
-1.750154, 0.9756365, -0.994831, 0, 0, 0, 1, 1,
-1.713999, 1.479856, -2.435705, 0, 0, 0, 1, 1,
-1.712721, -0.6580839, -1.931701, 0, 0, 0, 1, 1,
-1.68672, 0.503733, -3.76358, 0, 0, 0, 1, 1,
-1.686439, 1.361919, -3.728964, 0, 0, 0, 1, 1,
-1.683236, -0.9446807, -2.812279, 0, 0, 0, 1, 1,
-1.681792, -0.2224602, -1.326959, 0, 0, 0, 1, 1,
-1.677458, 1.745406, -1.610996, 1, 1, 1, 1, 1,
-1.669551, -0.6333976, -2.447142, 1, 1, 1, 1, 1,
-1.65043, -0.2789082, -2.535319, 1, 1, 1, 1, 1,
-1.643073, 0.6886999, -1.487518, 1, 1, 1, 1, 1,
-1.606363, -1.656309, -2.639445, 1, 1, 1, 1, 1,
-1.606311, -0.3283355, -3.344221, 1, 1, 1, 1, 1,
-1.592543, 0.9220266, -1.146224, 1, 1, 1, 1, 1,
-1.591985, 1.42629, -0.3205293, 1, 1, 1, 1, 1,
-1.563765, -0.2065286, -1.323788, 1, 1, 1, 1, 1,
-1.537018, 0.6608434, 0.2394245, 1, 1, 1, 1, 1,
-1.534701, 0.1998414, -0.6559608, 1, 1, 1, 1, 1,
-1.524768, 0.8514003, -1.674704, 1, 1, 1, 1, 1,
-1.519006, -1.001957, 0.5006036, 1, 1, 1, 1, 1,
-1.507012, -0.4750793, -2.273372, 1, 1, 1, 1, 1,
-1.501497, 1.510035, -0.9960037, 1, 1, 1, 1, 1,
-1.466531, -1.140158, -2.135705, 0, 0, 1, 1, 1,
-1.46402, 1.290428, -2.577945, 1, 0, 0, 1, 1,
-1.453192, -0.2894207, -1.576488, 1, 0, 0, 1, 1,
-1.451757, 0.7240113, -1.907837, 1, 0, 0, 1, 1,
-1.442328, 1.438585, -0.379796, 1, 0, 0, 1, 1,
-1.430889, -1.524507, -3.158167, 1, 0, 0, 1, 1,
-1.428999, -1.235594, -3.044881, 0, 0, 0, 1, 1,
-1.416489, 1.096978, -0.8336321, 0, 0, 0, 1, 1,
-1.410418, -1.006928, -1.794203, 0, 0, 0, 1, 1,
-1.409326, -0.7981294, -2.487707, 0, 0, 0, 1, 1,
-1.381531, -1.001858, -1.431054, 0, 0, 0, 1, 1,
-1.375436, 1.013445, -3.008872, 0, 0, 0, 1, 1,
-1.361407, 0.8603946, -0.02647212, 0, 0, 0, 1, 1,
-1.357576, -1.11026, -1.971714, 1, 1, 1, 1, 1,
-1.354467, -0.9936087, -1.698931, 1, 1, 1, 1, 1,
-1.353551, -0.3317718, -0.5279589, 1, 1, 1, 1, 1,
-1.351523, 1.888543, 0.03084873, 1, 1, 1, 1, 1,
-1.349391, 0.977978, -1.736705, 1, 1, 1, 1, 1,
-1.341491, 0.7487637, -0.01005592, 1, 1, 1, 1, 1,
-1.338263, -0.3562267, -2.245813, 1, 1, 1, 1, 1,
-1.331999, 0.1730283, -2.53507, 1, 1, 1, 1, 1,
-1.330858, -0.3538641, -1.28592, 1, 1, 1, 1, 1,
-1.328394, -1.628949, -2.013023, 1, 1, 1, 1, 1,
-1.324912, 1.195713, -1.321237, 1, 1, 1, 1, 1,
-1.323968, 0.8164285, -1.078025, 1, 1, 1, 1, 1,
-1.319931, 0.205247, -3.18409, 1, 1, 1, 1, 1,
-1.315842, -0.05721137, -0.3114608, 1, 1, 1, 1, 1,
-1.313046, 1.854732, 0.03497174, 1, 1, 1, 1, 1,
-1.312923, -0.3970964, -1.940271, 0, 0, 1, 1, 1,
-1.30974, 0.6058313, -1.621295, 1, 0, 0, 1, 1,
-1.307092, -0.9168465, -0.8521158, 1, 0, 0, 1, 1,
-1.30291, -0.6467813, -1.321559, 1, 0, 0, 1, 1,
-1.297921, 0.3607923, -1.653931, 1, 0, 0, 1, 1,
-1.294282, -0.8043447, -2.913444, 1, 0, 0, 1, 1,
-1.284979, -0.6560252, -3.599175, 0, 0, 0, 1, 1,
-1.282403, -1.607833, -3.348615, 0, 0, 0, 1, 1,
-1.279691, 0.5951631, -1.583871, 0, 0, 0, 1, 1,
-1.269222, 0.1207761, 0.3672533, 0, 0, 0, 1, 1,
-1.266108, -0.459195, -3.035227, 0, 0, 0, 1, 1,
-1.26227, -0.1544824, -2.585416, 0, 0, 0, 1, 1,
-1.259944, 1.49933, -1.251873, 0, 0, 0, 1, 1,
-1.256143, -0.1113581, -0.09576696, 1, 1, 1, 1, 1,
-1.254144, -0.8516128, -2.925943, 1, 1, 1, 1, 1,
-1.242967, 0.6877605, 0.310419, 1, 1, 1, 1, 1,
-1.240832, 0.7348605, -0.2372327, 1, 1, 1, 1, 1,
-1.23588, -0.7452924, -0.9808698, 1, 1, 1, 1, 1,
-1.228736, -0.004741816, -1.72478, 1, 1, 1, 1, 1,
-1.220052, 0.2491175, -0.7048219, 1, 1, 1, 1, 1,
-1.218096, 2.552811, -1.770037, 1, 1, 1, 1, 1,
-1.216987, 1.890305, -2.012499, 1, 1, 1, 1, 1,
-1.21335, 1.649026, -1.656747, 1, 1, 1, 1, 1,
-1.200425, -1.121265, -3.355635, 1, 1, 1, 1, 1,
-1.190783, -0.8717352, -4.016901, 1, 1, 1, 1, 1,
-1.189296, 1.87315, 0.4346408, 1, 1, 1, 1, 1,
-1.188563, -0.1991552, -1.394557, 1, 1, 1, 1, 1,
-1.176454, 1.355583, -1.148669, 1, 1, 1, 1, 1,
-1.171415, 0.5999042, -1.032014, 0, 0, 1, 1, 1,
-1.167146, 0.5381822, -2.477365, 1, 0, 0, 1, 1,
-1.166975, -1.230079, -2.37338, 1, 0, 0, 1, 1,
-1.166095, 0.9212189, 0.641484, 1, 0, 0, 1, 1,
-1.159996, 0.5897416, -1.391872, 1, 0, 0, 1, 1,
-1.155878, 1.68843, 1.088993, 1, 0, 0, 1, 1,
-1.142389, -0.08690365, -1.926288, 0, 0, 0, 1, 1,
-1.125064, 1.047883, -1.576924, 0, 0, 0, 1, 1,
-1.12334, 1.397454, -2.577002, 0, 0, 0, 1, 1,
-1.123111, -0.9469889, -1.137617, 0, 0, 0, 1, 1,
-1.119107, 0.1841355, 0.4182922, 0, 0, 0, 1, 1,
-1.110213, -0.07847212, -1.944008, 0, 0, 0, 1, 1,
-1.107804, 0.247331, -1.483881, 0, 0, 0, 1, 1,
-1.090715, 0.9378217, -3.730318, 1, 1, 1, 1, 1,
-1.072487, -0.1905752, -1.475042, 1, 1, 1, 1, 1,
-1.070097, -0.8797638, -3.484618, 1, 1, 1, 1, 1,
-1.06018, -0.1998234, -2.714228, 1, 1, 1, 1, 1,
-1.054512, 1.437321, 1.228403, 1, 1, 1, 1, 1,
-1.036641, 0.03449805, -1.600816, 1, 1, 1, 1, 1,
-1.034364, 1.614279, -0.3673804, 1, 1, 1, 1, 1,
-1.02872, 0.3052149, -1.891111, 1, 1, 1, 1, 1,
-1.011391, 1.169052, 0.4716347, 1, 1, 1, 1, 1,
-1.005777, -1.297977, -3.905927, 1, 1, 1, 1, 1,
-0.9986926, -0.9421415, -3.810768, 1, 1, 1, 1, 1,
-0.9968259, -0.1530966, -1.024454, 1, 1, 1, 1, 1,
-0.9948526, 0.4196478, -1.511575, 1, 1, 1, 1, 1,
-0.9870319, -1.067107, -2.537359, 1, 1, 1, 1, 1,
-0.9835242, -0.532241, -2.285927, 1, 1, 1, 1, 1,
-0.9834642, -0.2769865, -2.71595, 0, 0, 1, 1, 1,
-0.9824297, -0.0990865, -2.015899, 1, 0, 0, 1, 1,
-0.9765171, 1.089134, 0.4508283, 1, 0, 0, 1, 1,
-0.9738189, 0.9828014, -1.57731, 1, 0, 0, 1, 1,
-0.9714434, -1.117177, -2.884547, 1, 0, 0, 1, 1,
-0.9553607, 0.3884797, -1.576198, 1, 0, 0, 1, 1,
-0.9526308, -1.680417, -4.55133, 0, 0, 0, 1, 1,
-0.9496624, -1.618694, -2.628075, 0, 0, 0, 1, 1,
-0.9472647, -0.5952895, -2.395159, 0, 0, 0, 1, 1,
-0.9449343, 0.9889053, -3.260136, 0, 0, 0, 1, 1,
-0.942824, 1.415416, 0.3935004, 0, 0, 0, 1, 1,
-0.9427336, -0.3619704, -0.3194011, 0, 0, 0, 1, 1,
-0.9416651, -0.8872362, -1.551046, 0, 0, 0, 1, 1,
-0.9282097, 0.8425502, 1.502526, 1, 1, 1, 1, 1,
-0.9251094, 0.2288191, -0.1570555, 1, 1, 1, 1, 1,
-0.9240764, 0.05119057, -1.86327, 1, 1, 1, 1, 1,
-0.9168168, -0.1052749, -3.740421, 1, 1, 1, 1, 1,
-0.9153562, -0.6399408, -0.7064924, 1, 1, 1, 1, 1,
-0.9075431, 0.00405601, -0.9516813, 1, 1, 1, 1, 1,
-0.9000825, -0.6899197, -1.492898, 1, 1, 1, 1, 1,
-0.8943661, -1.33906, -3.222597, 1, 1, 1, 1, 1,
-0.8930446, 1.353661, -0.3030988, 1, 1, 1, 1, 1,
-0.8895396, 1.386771, 0.1109654, 1, 1, 1, 1, 1,
-0.8894562, -0.2518618, -1.890398, 1, 1, 1, 1, 1,
-0.8850329, 1.042372, -0.9801683, 1, 1, 1, 1, 1,
-0.8846874, -1.146466, -3.367824, 1, 1, 1, 1, 1,
-0.8710498, -1.119293, -0.9804539, 1, 1, 1, 1, 1,
-0.8709259, -1.131877, -4.000275, 1, 1, 1, 1, 1,
-0.8684068, -2.138834, -1.123002, 0, 0, 1, 1, 1,
-0.8633671, -0.9701406, -2.355449, 1, 0, 0, 1, 1,
-0.8568323, -0.5848885, 0.3784438, 1, 0, 0, 1, 1,
-0.8560314, 1.07411, -1.229481, 1, 0, 0, 1, 1,
-0.8510585, -2.145756, -2.853761, 1, 0, 0, 1, 1,
-0.8507481, 1.874185, -0.5362431, 1, 0, 0, 1, 1,
-0.8472773, 0.8105726, -1.771847, 0, 0, 0, 1, 1,
-0.8423615, 1.003038, -0.9200748, 0, 0, 0, 1, 1,
-0.8418396, -0.6456773, -2.666152, 0, 0, 0, 1, 1,
-0.8414482, -1.006531, -2.893648, 0, 0, 0, 1, 1,
-0.8389601, 0.4938975, 0.1946901, 0, 0, 0, 1, 1,
-0.8381094, 2.898383, -0.8217328, 0, 0, 0, 1, 1,
-0.8337942, 2.948334, 0.8947338, 0, 0, 0, 1, 1,
-0.8329186, 0.9972481, 0.5207804, 1, 1, 1, 1, 1,
-0.8310069, 0.1462335, -0.005033482, 1, 1, 1, 1, 1,
-0.8306711, 0.5571617, -1.257597, 1, 1, 1, 1, 1,
-0.8292838, -0.08748523, -3.206257, 1, 1, 1, 1, 1,
-0.8288645, -0.7489272, -2.274812, 1, 1, 1, 1, 1,
-0.823006, -1.277524, -2.421366, 1, 1, 1, 1, 1,
-0.8170872, 1.335856, -1.749155, 1, 1, 1, 1, 1,
-0.8091127, 1.466628, -0.8973887, 1, 1, 1, 1, 1,
-0.781103, -0.268646, -2.14143, 1, 1, 1, 1, 1,
-0.7773238, 0.3364169, 0.2396978, 1, 1, 1, 1, 1,
-0.7727127, -0.838799, -4.116945, 1, 1, 1, 1, 1,
-0.7560046, 0.9436625, 0.2896006, 1, 1, 1, 1, 1,
-0.7548442, -1.239635, -2.556142, 1, 1, 1, 1, 1,
-0.7528365, -1.387816, -3.175545, 1, 1, 1, 1, 1,
-0.7522835, 0.1847856, -0.9686606, 1, 1, 1, 1, 1,
-0.7400556, 1.385587, -1.42621, 0, 0, 1, 1, 1,
-0.7377797, -0.3218952, -1.163415, 1, 0, 0, 1, 1,
-0.7320669, -1.662693, -3.830065, 1, 0, 0, 1, 1,
-0.7269642, 0.4134395, -0.6669185, 1, 0, 0, 1, 1,
-0.7196296, 0.9130071, -0.897359, 1, 0, 0, 1, 1,
-0.7135787, -0.6556301, -3.208013, 1, 0, 0, 1, 1,
-0.7131792, 0.5564648, -0.858822, 0, 0, 0, 1, 1,
-0.7128158, 0.1717675, -0.2292366, 0, 0, 0, 1, 1,
-0.7126774, 0.2107793, -1.205666, 0, 0, 0, 1, 1,
-0.7104931, 3.321475, -0.3622046, 0, 0, 0, 1, 1,
-0.7075716, 0.8083576, -0.9337461, 0, 0, 0, 1, 1,
-0.7070321, -0.5287898, -1.434184, 0, 0, 0, 1, 1,
-0.7054437, -1.503678, -3.731129, 0, 0, 0, 1, 1,
-0.6961273, -0.9855896, -3.979049, 1, 1, 1, 1, 1,
-0.6959878, 0.1354032, 0.3287441, 1, 1, 1, 1, 1,
-0.6953803, -0.04585214, -0.9424899, 1, 1, 1, 1, 1,
-0.6924894, -1.288473, -3.174403, 1, 1, 1, 1, 1,
-0.6921958, 0.4001253, -0.688144, 1, 1, 1, 1, 1,
-0.6864533, -0.2818292, -1.896896, 1, 1, 1, 1, 1,
-0.6769592, -1.691462, -2.099509, 1, 1, 1, 1, 1,
-0.6714571, 0.2622498, -1.868347, 1, 1, 1, 1, 1,
-0.6683427, -0.1670952, -2.736543, 1, 1, 1, 1, 1,
-0.6641028, -0.1891679, -0.4924644, 1, 1, 1, 1, 1,
-0.6537878, 2.54754, 0.7560495, 1, 1, 1, 1, 1,
-0.6521912, 0.1861881, 0.445778, 1, 1, 1, 1, 1,
-0.6495678, -0.5101101, -2.959555, 1, 1, 1, 1, 1,
-0.6466026, 0.7586951, -0.9266504, 1, 1, 1, 1, 1,
-0.6430373, -0.1745265, -1.11271, 1, 1, 1, 1, 1,
-0.6428437, -1.336122, -3.318295, 0, 0, 1, 1, 1,
-0.6409693, 0.3211152, -1.547675, 1, 0, 0, 1, 1,
-0.6362371, 0.7622112, -0.1040726, 1, 0, 0, 1, 1,
-0.6337555, 0.7100735, 1.014239, 1, 0, 0, 1, 1,
-0.6212826, -0.320333, -1.520042, 1, 0, 0, 1, 1,
-0.6165105, -1.073619, -3.002664, 1, 0, 0, 1, 1,
-0.6108128, -0.8350016, -3.303038, 0, 0, 0, 1, 1,
-0.6056883, 0.3983897, -2.833519, 0, 0, 0, 1, 1,
-0.6039726, -0.6586013, -3.29716, 0, 0, 0, 1, 1,
-0.603878, 0.917466, -0.4628703, 0, 0, 0, 1, 1,
-0.6000555, 0.4637837, -0.6933483, 0, 0, 0, 1, 1,
-0.5995052, -0.9053586, -2.757558, 0, 0, 0, 1, 1,
-0.5959303, -0.1162066, -2.301903, 0, 0, 0, 1, 1,
-0.5942231, 0.9054373, -1.939154, 1, 1, 1, 1, 1,
-0.5915164, 0.176302, -1.545449, 1, 1, 1, 1, 1,
-0.5906289, -0.5118535, -2.907218, 1, 1, 1, 1, 1,
-0.5832988, -0.2355119, -1.683455, 1, 1, 1, 1, 1,
-0.5813575, 0.871554, -1.115191, 1, 1, 1, 1, 1,
-0.5787162, -0.05876345, -2.464992, 1, 1, 1, 1, 1,
-0.5705135, -0.3549094, -1.173845, 1, 1, 1, 1, 1,
-0.5703784, -1.659721, -4.832429, 1, 1, 1, 1, 1,
-0.561787, -0.1755307, -1.031033, 1, 1, 1, 1, 1,
-0.5609205, -0.614996, -3.975065, 1, 1, 1, 1, 1,
-0.559375, -0.2241985, -0.9126526, 1, 1, 1, 1, 1,
-0.5575247, -0.4305826, -2.844685, 1, 1, 1, 1, 1,
-0.5555629, -0.8037602, -1.169724, 1, 1, 1, 1, 1,
-0.5521013, 0.4510971, -1.769525, 1, 1, 1, 1, 1,
-0.5507104, 1.458901, -0.8741067, 1, 1, 1, 1, 1,
-0.5458134, 1.735533, 0.2983572, 0, 0, 1, 1, 1,
-0.5452473, 0.6750311, -2.39727, 1, 0, 0, 1, 1,
-0.5416021, -0.2442797, -3.73368, 1, 0, 0, 1, 1,
-0.5413312, -0.1057574, -2.868618, 1, 0, 0, 1, 1,
-0.541137, 0.6915929, -0.4409808, 1, 0, 0, 1, 1,
-0.5399601, -0.5941069, -3.051341, 1, 0, 0, 1, 1,
-0.5399357, 2.032609, 0.8436404, 0, 0, 0, 1, 1,
-0.5384245, -0.3114213, -2.014106, 0, 0, 0, 1, 1,
-0.5245757, -0.2864701, -1.555456, 0, 0, 0, 1, 1,
-0.5196075, 2.746451, -0.7604191, 0, 0, 0, 1, 1,
-0.5079206, 0.6173702, 0.8505477, 0, 0, 0, 1, 1,
-0.5055065, 1.004777, -0.146284, 0, 0, 0, 1, 1,
-0.4989484, -0.934481, -1.134837, 0, 0, 0, 1, 1,
-0.4929449, -0.2652952, -3.23952, 1, 1, 1, 1, 1,
-0.4922357, -0.7616348, -3.785816, 1, 1, 1, 1, 1,
-0.4897916, -1.037402, -3.530956, 1, 1, 1, 1, 1,
-0.4882973, -0.05840751, -2.909863, 1, 1, 1, 1, 1,
-0.4868551, -0.6691235, -3.770155, 1, 1, 1, 1, 1,
-0.4844765, -0.4570318, -1.266532, 1, 1, 1, 1, 1,
-0.4790086, -1.05021, 0.1908624, 1, 1, 1, 1, 1,
-0.4762875, -1.056589, -4.093603, 1, 1, 1, 1, 1,
-0.4752767, -0.2077771, -0.1121955, 1, 1, 1, 1, 1,
-0.4671316, -0.5634124, -3.740664, 1, 1, 1, 1, 1,
-0.4665253, 0.5750924, -2.464681, 1, 1, 1, 1, 1,
-0.4602887, -0.5516701, -2.349013, 1, 1, 1, 1, 1,
-0.4597331, -0.7082204, -1.735245, 1, 1, 1, 1, 1,
-0.4574464, 1.198811, -0.666786, 1, 1, 1, 1, 1,
-0.4572392, -1.059015, -2.532246, 1, 1, 1, 1, 1,
-0.455401, 1.029377, -1.06101, 0, 0, 1, 1, 1,
-0.4551134, -0.3258945, -4.054945, 1, 0, 0, 1, 1,
-0.4510577, -0.141929, -1.022276, 1, 0, 0, 1, 1,
-0.4496866, -0.3813615, -2.41086, 1, 0, 0, 1, 1,
-0.4452705, 0.1196667, -0.2876889, 1, 0, 0, 1, 1,
-0.443236, -0.122823, -3.026012, 1, 0, 0, 1, 1,
-0.4413569, 1.053186, -0.4527977, 0, 0, 0, 1, 1,
-0.4393505, -0.04217546, -0.4691934, 0, 0, 0, 1, 1,
-0.4385439, -0.09287447, -1.212744, 0, 0, 0, 1, 1,
-0.4382841, 1.879333, 0.6971922, 0, 0, 0, 1, 1,
-0.4292293, -0.8485551, -3.10996, 0, 0, 0, 1, 1,
-0.4269438, 0.6547995, -2.896803, 0, 0, 0, 1, 1,
-0.4257819, -0.9593316, -1.79315, 0, 0, 0, 1, 1,
-0.425772, 1.035437, 0.2416847, 1, 1, 1, 1, 1,
-0.4243181, 0.3885161, -2.974328, 1, 1, 1, 1, 1,
-0.4239806, 0.4415537, -1.24207, 1, 1, 1, 1, 1,
-0.4217019, 1.00819, -0.7888701, 1, 1, 1, 1, 1,
-0.4198729, 0.3911782, 1.1252, 1, 1, 1, 1, 1,
-0.4116335, 0.2263785, -0.2812325, 1, 1, 1, 1, 1,
-0.4111742, -0.1158761, -0.8587126, 1, 1, 1, 1, 1,
-0.4099379, -1.662202, -2.839929, 1, 1, 1, 1, 1,
-0.409023, 1.822543, -0.02622266, 1, 1, 1, 1, 1,
-0.4079051, -0.5591215, -1.656671, 1, 1, 1, 1, 1,
-0.406678, 0.05844793, -0.9630575, 1, 1, 1, 1, 1,
-0.4028232, 0.06385598, -0.8288708, 1, 1, 1, 1, 1,
-0.4007469, 0.3977598, -0.5579654, 1, 1, 1, 1, 1,
-0.4002276, 0.01118185, -1.58131, 1, 1, 1, 1, 1,
-0.3974045, -1.101601, -3.162658, 1, 1, 1, 1, 1,
-0.3938912, -0.2168096, -2.983062, 0, 0, 1, 1, 1,
-0.3934849, 0.2392291, -1.822943, 1, 0, 0, 1, 1,
-0.3930955, 0.3026631, -1.39962, 1, 0, 0, 1, 1,
-0.3905743, -0.9194438, -1.989527, 1, 0, 0, 1, 1,
-0.3894476, -1.596214, -3.324537, 1, 0, 0, 1, 1,
-0.3892005, 1.311666, -1.454021, 1, 0, 0, 1, 1,
-0.3849269, -0.08213994, -1.379933, 0, 0, 0, 1, 1,
-0.3797942, -0.2829651, -1.526026, 0, 0, 0, 1, 1,
-0.3795418, 1.099982, 0.7200722, 0, 0, 0, 1, 1,
-0.3765992, -0.3030101, -1.664705, 0, 0, 0, 1, 1,
-0.3731399, -1.563157, -4.33064, 0, 0, 0, 1, 1,
-0.3689598, 0.2566874, 0.8164391, 0, 0, 0, 1, 1,
-0.3647798, 0.0742431, -2.503989, 0, 0, 0, 1, 1,
-0.3619457, -1.635862, -3.026825, 1, 1, 1, 1, 1,
-0.3552592, 0.5014119, -0.9055575, 1, 1, 1, 1, 1,
-0.3487865, -0.2133445, -0.6977727, 1, 1, 1, 1, 1,
-0.3483332, 0.7155457, -1.277808, 1, 1, 1, 1, 1,
-0.3435621, 0.1324397, -0.61027, 1, 1, 1, 1, 1,
-0.3423611, 1.324879, -0.6306273, 1, 1, 1, 1, 1,
-0.3408333, -1.838091, -0.6495198, 1, 1, 1, 1, 1,
-0.3341913, -0.1506419, -2.187308, 1, 1, 1, 1, 1,
-0.3324904, -0.2395716, -2.920579, 1, 1, 1, 1, 1,
-0.3317506, 1.267793, -1.215574, 1, 1, 1, 1, 1,
-0.3288359, 0.3631651, -1.706924, 1, 1, 1, 1, 1,
-0.3278234, 0.4653681, 0.2372195, 1, 1, 1, 1, 1,
-0.327098, -0.9913822, -1.410591, 1, 1, 1, 1, 1,
-0.3261402, 0.5929888, -0.7462589, 1, 1, 1, 1, 1,
-0.3258992, 1.82209, -0.5930912, 1, 1, 1, 1, 1,
-0.3252206, 0.05171769, -1.73869, 0, 0, 1, 1, 1,
-0.3237485, 1.255305, 0.6741947, 1, 0, 0, 1, 1,
-0.3198927, -1.293408, -2.268825, 1, 0, 0, 1, 1,
-0.3174393, 1.299106, -2.932746, 1, 0, 0, 1, 1,
-0.316953, -0.08654051, -2.999058, 1, 0, 0, 1, 1,
-0.3166108, 1.728195, 0.5824282, 1, 0, 0, 1, 1,
-0.3148723, 0.9579183, -0.7754939, 0, 0, 0, 1, 1,
-0.3099937, 0.2448008, -1.831218, 0, 0, 0, 1, 1,
-0.3086838, -0.5092831, -1.992212, 0, 0, 0, 1, 1,
-0.3055139, 0.760687, -0.0996729, 0, 0, 0, 1, 1,
-0.3044981, 0.2678919, -0.3897469, 0, 0, 0, 1, 1,
-0.2959537, 1.288065, -0.2192927, 0, 0, 0, 1, 1,
-0.2869567, 1.928467, 0.3374221, 0, 0, 0, 1, 1,
-0.2857718, 0.9615629, -0.985402, 1, 1, 1, 1, 1,
-0.2849672, -1.634518, -1.869781, 1, 1, 1, 1, 1,
-0.2847118, -0.1603552, -1.860372, 1, 1, 1, 1, 1,
-0.2841097, 0.3492223, -0.7896639, 1, 1, 1, 1, 1,
-0.2833467, 1.173353, -1.265345, 1, 1, 1, 1, 1,
-0.2828135, -0.4557782, -1.294285, 1, 1, 1, 1, 1,
-0.2822908, -0.205567, -2.468122, 1, 1, 1, 1, 1,
-0.2813583, 1.613912, 0.8362647, 1, 1, 1, 1, 1,
-0.2807149, 0.5029706, -1.298985, 1, 1, 1, 1, 1,
-0.2721141, 0.7983534, -0.754545, 1, 1, 1, 1, 1,
-0.2680012, 0.5954672, -0.2131751, 1, 1, 1, 1, 1,
-0.267936, -1.061307, -4.494284, 1, 1, 1, 1, 1,
-0.2660013, 0.3053417, -1.339502, 1, 1, 1, 1, 1,
-0.2586407, -1.55356, -3.196074, 1, 1, 1, 1, 1,
-0.2568264, -0.1980363, -2.662451, 1, 1, 1, 1, 1,
-0.2500205, 0.1107903, -3.036953, 0, 0, 1, 1, 1,
-0.2489291, -0.9429082, -3.280049, 1, 0, 0, 1, 1,
-0.240729, 1.964667, -0.1918879, 1, 0, 0, 1, 1,
-0.2373915, 1.081706, -1.437484, 1, 0, 0, 1, 1,
-0.2360751, 1.050605, -1.049075, 1, 0, 0, 1, 1,
-0.2320957, -1.31226, -3.361617, 1, 0, 0, 1, 1,
-0.2286702, -1.587825, 0.358804, 0, 0, 0, 1, 1,
-0.2283329, 0.4647793, -0.03229709, 0, 0, 0, 1, 1,
-0.2283237, -2.023773, -3.175831, 0, 0, 0, 1, 1,
-0.226472, -0.007875518, -2.416156, 0, 0, 0, 1, 1,
-0.2263511, 1.037917, 0.2406525, 0, 0, 0, 1, 1,
-0.2233845, -0.9763525, -3.043365, 0, 0, 0, 1, 1,
-0.2224163, 1.07007, -1.241815, 0, 0, 0, 1, 1,
-0.2214944, 0.2186638, -1.644583, 1, 1, 1, 1, 1,
-0.2169934, -0.9798672, -4.177742, 1, 1, 1, 1, 1,
-0.2168883, -0.8197427, -3.697965, 1, 1, 1, 1, 1,
-0.2125331, -0.5998939, -0.8929183, 1, 1, 1, 1, 1,
-0.2123093, 0.4262463, -0.5100201, 1, 1, 1, 1, 1,
-0.2100415, -0.1902011, -0.5096996, 1, 1, 1, 1, 1,
-0.2087489, 0.9730732, -0.0512928, 1, 1, 1, 1, 1,
-0.2085502, -0.4759882, -2.683228, 1, 1, 1, 1, 1,
-0.2073402, 0.7541034, -1.873021, 1, 1, 1, 1, 1,
-0.2003394, 1.250018, -1.466856, 1, 1, 1, 1, 1,
-0.1955416, 0.9951183, 0.3427989, 1, 1, 1, 1, 1,
-0.195457, -0.2618071, -2.413132, 1, 1, 1, 1, 1,
-0.1933018, -0.7176387, -2.509619, 1, 1, 1, 1, 1,
-0.1930437, 1.182154, 1.214092, 1, 1, 1, 1, 1,
-0.1899412, 0.1637882, 1.247497, 1, 1, 1, 1, 1,
-0.1727294, 1.013307, -1.242209, 0, 0, 1, 1, 1,
-0.1719661, -0.434376, -3.038292, 1, 0, 0, 1, 1,
-0.1718193, 0.7484303, -0.1301136, 1, 0, 0, 1, 1,
-0.1640337, 0.7476129, 0.5040146, 1, 0, 0, 1, 1,
-0.1620347, -0.5162504, -3.47362, 1, 0, 0, 1, 1,
-0.1595593, -0.848102, -2.297936, 1, 0, 0, 1, 1,
-0.1592269, -0.8929402, -1.76011, 0, 0, 0, 1, 1,
-0.1571138, -0.7586108, -3.74846, 0, 0, 0, 1, 1,
-0.1521814, 2.423988, 0.4831851, 0, 0, 0, 1, 1,
-0.1499631, -0.1378928, -3.260339, 0, 0, 0, 1, 1,
-0.1476354, 0.6998848, 0.6476659, 0, 0, 0, 1, 1,
-0.1448232, -1.013576, -2.922638, 0, 0, 0, 1, 1,
-0.1390104, 2.323203, -0.220565, 0, 0, 0, 1, 1,
-0.1389096, 0.6070915, -2.225657, 1, 1, 1, 1, 1,
-0.1365377, -0.4918884, -3.472906, 1, 1, 1, 1, 1,
-0.1362253, 1.019461, 0.2275644, 1, 1, 1, 1, 1,
-0.1289361, 0.7915552, -0.1172556, 1, 1, 1, 1, 1,
-0.1284357, 0.119758, -0.1705868, 1, 1, 1, 1, 1,
-0.1270436, -1.185149, -5.82786, 1, 1, 1, 1, 1,
-0.1265623, -2.65104, -4.183622, 1, 1, 1, 1, 1,
-0.1235329, 0.7225663, -0.9226454, 1, 1, 1, 1, 1,
-0.1178943, -1.405056, -2.812271, 1, 1, 1, 1, 1,
-0.1154734, -2.830731, -3.185304, 1, 1, 1, 1, 1,
-0.1148638, -2.303342, -2.699898, 1, 1, 1, 1, 1,
-0.1115668, 0.5222631, 0.9821331, 1, 1, 1, 1, 1,
-0.1109188, -0.1917512, -2.315902, 1, 1, 1, 1, 1,
-0.1074924, -1.543512, -2.985184, 1, 1, 1, 1, 1,
-0.1067864, 0.4626577, -0.2009987, 1, 1, 1, 1, 1,
-0.1050636, 0.08150794, -0.6547198, 0, 0, 1, 1, 1,
-0.1046102, 1.013473, -1.814696, 1, 0, 0, 1, 1,
-0.1029341, -0.8845605, -3.122959, 1, 0, 0, 1, 1,
-0.1022793, 0.6355792, -0.308703, 1, 0, 0, 1, 1,
-0.09967321, 1.271558, -1.491238, 1, 0, 0, 1, 1,
-0.09943021, -0.8487552, -3.453532, 1, 0, 0, 1, 1,
-0.09794776, -1.313491, -4.373532, 0, 0, 0, 1, 1,
-0.09703501, 0.5794977, 0.01343184, 0, 0, 0, 1, 1,
-0.09182806, -0.1010313, -2.948998, 0, 0, 0, 1, 1,
-0.08822154, -0.4573715, -2.663632, 0, 0, 0, 1, 1,
-0.08812303, 2.229294, 0.1773276, 0, 0, 0, 1, 1,
-0.08716667, -0.5897561, -3.3503, 0, 0, 0, 1, 1,
-0.08715726, 0.7881199, 2.264914, 0, 0, 0, 1, 1,
-0.08668865, -0.4751066, -2.012866, 1, 1, 1, 1, 1,
-0.08287583, -1.014187, -3.48231, 1, 1, 1, 1, 1,
-0.0817647, 0.9804046, -0.3526179, 1, 1, 1, 1, 1,
-0.08116253, -0.9401075, -2.557442, 1, 1, 1, 1, 1,
-0.08112402, 0.2581916, -1.992097, 1, 1, 1, 1, 1,
-0.07934596, -0.2031463, -3.978965, 1, 1, 1, 1, 1,
-0.07685937, 0.6887173, 1.349195, 1, 1, 1, 1, 1,
-0.07578439, -0.9545522, -3.293819, 1, 1, 1, 1, 1,
-0.07464502, -0.5180179, -3.678371, 1, 1, 1, 1, 1,
-0.07404947, 0.3185451, 0.5077102, 1, 1, 1, 1, 1,
-0.07197443, -0.7065932, -2.65113, 1, 1, 1, 1, 1,
-0.07158182, -0.1686991, -2.636878, 1, 1, 1, 1, 1,
-0.07045912, 0.7589235, 1.368865, 1, 1, 1, 1, 1,
-0.0669694, -0.8002908, -3.574878, 1, 1, 1, 1, 1,
-0.06612597, 0.7920228, 1.586988, 1, 1, 1, 1, 1,
-0.06590307, 0.6478238, -0.7064682, 0, 0, 1, 1, 1,
-0.06123612, -0.9973404, -1.219183, 1, 0, 0, 1, 1,
-0.05682408, 0.8239291, 2.137324, 1, 0, 0, 1, 1,
-0.05272473, 0.5346745, -0.01453832, 1, 0, 0, 1, 1,
-0.05170796, -1.039864, -2.843199, 1, 0, 0, 1, 1,
-0.05025188, -0.2602627, -3.332073, 1, 0, 0, 1, 1,
-0.04716131, 1.424889, -0.4692152, 0, 0, 0, 1, 1,
-0.04154171, -3.591519, -3.788444, 0, 0, 0, 1, 1,
-0.03961166, -0.6009713, -2.57572, 0, 0, 0, 1, 1,
-0.0360548, 1.011373, -0.7818087, 0, 0, 0, 1, 1,
-0.03507911, 1.052929, -0.1106749, 0, 0, 0, 1, 1,
-0.03291875, -1.537094, -3.884705, 0, 0, 0, 1, 1,
-0.03177641, -0.969794, -2.767128, 0, 0, 0, 1, 1,
-0.03065889, -1.186154, -2.566747, 1, 1, 1, 1, 1,
-0.02958242, 1.598538, -1.879031, 1, 1, 1, 1, 1,
-0.02744886, 0.3740015, 1.574174, 1, 1, 1, 1, 1,
-0.02634158, 0.3779591, 1.303004, 1, 1, 1, 1, 1,
-0.02533505, -0.04203772, -1.833234, 1, 1, 1, 1, 1,
-0.02356422, -0.06074255, -1.688854, 1, 1, 1, 1, 1,
-0.02085901, -0.9025705, -4.712079, 1, 1, 1, 1, 1,
-0.02031446, 0.05296071, -1.444165, 1, 1, 1, 1, 1,
-0.01893761, -0.6093246, -3.495131, 1, 1, 1, 1, 1,
-0.01197712, 1.459635, 0.1531698, 1, 1, 1, 1, 1,
-0.00881933, -0.4146446, -3.174998, 1, 1, 1, 1, 1,
-0.008040136, 1.934223, -0.7894543, 1, 1, 1, 1, 1,
-0.006288914, 1.104992, -0.04928197, 1, 1, 1, 1, 1,
-0.002039569, -1.648928, -2.670638, 1, 1, 1, 1, 1,
-0.002036884, -0.6598257, -2.918454, 1, 1, 1, 1, 1,
0.003252017, 0.05421787, 0.1630385, 0, 0, 1, 1, 1,
0.004783589, -0.3281749, 3.337316, 1, 0, 0, 1, 1,
0.005543451, -0.07994282, 3.072727, 1, 0, 0, 1, 1,
0.00826018, 0.4196416, -0.9383381, 1, 0, 0, 1, 1,
0.008908284, -0.3676225, 3.704015, 1, 0, 0, 1, 1,
0.01519121, 0.1689851, -0.2091043, 1, 0, 0, 1, 1,
0.01773594, 0.4632371, -0.4997441, 0, 0, 0, 1, 1,
0.01855496, -0.01228422, 1.246113, 0, 0, 0, 1, 1,
0.01961922, -0.149664, 3.659348, 0, 0, 0, 1, 1,
0.02079719, -0.3400072, 2.874956, 0, 0, 0, 1, 1,
0.02445079, 0.1929918, -1.094836, 0, 0, 0, 1, 1,
0.02473359, 0.02893731, 2.716227, 0, 0, 0, 1, 1,
0.02829107, -0.1271717, 2.746257, 0, 0, 0, 1, 1,
0.02851168, -0.9021024, 1.772108, 1, 1, 1, 1, 1,
0.02974296, 0.4338896, -0.8818406, 1, 1, 1, 1, 1,
0.03353882, -0.05869214, 2.468313, 1, 1, 1, 1, 1,
0.03610817, 0.6535339, -0.7081795, 1, 1, 1, 1, 1,
0.03631941, -1.697113, 2.138317, 1, 1, 1, 1, 1,
0.03914688, -0.3640423, 3.292044, 1, 1, 1, 1, 1,
0.04309461, -0.3032449, 1.144106, 1, 1, 1, 1, 1,
0.0467461, 0.9464613, -0.9539878, 1, 1, 1, 1, 1,
0.04820785, -1.648111, 2.508902, 1, 1, 1, 1, 1,
0.04838667, -1.064958, 3.346015, 1, 1, 1, 1, 1,
0.05085769, -0.5116619, 4.074089, 1, 1, 1, 1, 1,
0.05515457, -0.02769533, 1.991125, 1, 1, 1, 1, 1,
0.05743503, 0.1913747, 0.3715991, 1, 1, 1, 1, 1,
0.05745013, 0.05001989, 0.1532214, 1, 1, 1, 1, 1,
0.05807684, -0.5430507, 2.645141, 1, 1, 1, 1, 1,
0.06076296, -0.1006525, 4.00236, 0, 0, 1, 1, 1,
0.06726246, 0.0438993, 2.411034, 1, 0, 0, 1, 1,
0.06829031, -0.9273669, 2.858463, 1, 0, 0, 1, 1,
0.0683904, 0.3879985, 1.192314, 1, 0, 0, 1, 1,
0.06840266, -0.1330809, 2.745062, 1, 0, 0, 1, 1,
0.0690806, -0.532518, 4.262069, 1, 0, 0, 1, 1,
0.07264593, 0.1496239, 0.05112454, 0, 0, 0, 1, 1,
0.08112529, -0.4439725, 3.312749, 0, 0, 0, 1, 1,
0.08212576, 0.5611822, 2.120222, 0, 0, 0, 1, 1,
0.08270979, 0.4155241, 0.6018955, 0, 0, 0, 1, 1,
0.082716, -0.6535326, 1.90768, 0, 0, 0, 1, 1,
0.08544478, 1.296911, 1.242386, 0, 0, 0, 1, 1,
0.09092514, -1.491824, 3.591158, 0, 0, 0, 1, 1,
0.09239386, -3.175173, 3.313444, 1, 1, 1, 1, 1,
0.09573296, 1.343597, 1.29506, 1, 1, 1, 1, 1,
0.09955585, -0.2103561, 2.963419, 1, 1, 1, 1, 1,
0.09999865, 0.2299397, -0.213656, 1, 1, 1, 1, 1,
0.1016966, -0.8404138, 4.311087, 1, 1, 1, 1, 1,
0.1025008, -0.8595909, 3.84606, 1, 1, 1, 1, 1,
0.1041691, 1.302436, -0.7279274, 1, 1, 1, 1, 1,
0.1059231, -1.216472, 2.365942, 1, 1, 1, 1, 1,
0.106005, 0.04018974, 0.4528288, 1, 1, 1, 1, 1,
0.1082572, -0.1208942, 3.497691, 1, 1, 1, 1, 1,
0.1100791, -0.1178327, 2.223752, 1, 1, 1, 1, 1,
0.1107693, -0.9104658, 2.250422, 1, 1, 1, 1, 1,
0.1114393, -1.075223, 2.742867, 1, 1, 1, 1, 1,
0.1138926, 0.5088608, 0.9987537, 1, 1, 1, 1, 1,
0.114299, 0.2150244, 0.5129012, 1, 1, 1, 1, 1,
0.1162911, 0.1267469, 0.6061593, 0, 0, 1, 1, 1,
0.1171811, -0.9626558, 3.57875, 1, 0, 0, 1, 1,
0.1178649, -0.662683, 2.357286, 1, 0, 0, 1, 1,
0.1258328, -0.4762501, 2.290977, 1, 0, 0, 1, 1,
0.1268216, -0.676999, 3.804696, 1, 0, 0, 1, 1,
0.1319204, -1.514214, 3.404731, 1, 0, 0, 1, 1,
0.1394456, 0.2546207, 0.637005, 0, 0, 0, 1, 1,
0.1439717, -0.01822572, 2.107567, 0, 0, 0, 1, 1,
0.1460963, -0.5678645, 2.427202, 0, 0, 0, 1, 1,
0.1529518, -0.9674981, 3.255392, 0, 0, 0, 1, 1,
0.1558621, -1.344214, 2.29867, 0, 0, 0, 1, 1,
0.1562133, 1.259317, -0.5814384, 0, 0, 0, 1, 1,
0.1570273, 0.2143278, 1.055624, 0, 0, 0, 1, 1,
0.1608409, 1.688478, 0.5340952, 1, 1, 1, 1, 1,
0.1628593, 1.499152, -1.06985, 1, 1, 1, 1, 1,
0.1647842, 1.09663, -0.354137, 1, 1, 1, 1, 1,
0.165864, -1.517068, 2.969429, 1, 1, 1, 1, 1,
0.1690423, -1.193873, 2.515606, 1, 1, 1, 1, 1,
0.1778531, -0.1916093, 2.421221, 1, 1, 1, 1, 1,
0.1815837, 0.3769011, -0.1872199, 1, 1, 1, 1, 1,
0.1837415, -0.6971629, 4.941319, 1, 1, 1, 1, 1,
0.1852431, -0.2320658, 1.870531, 1, 1, 1, 1, 1,
0.1944852, -2.262069, 3.758787, 1, 1, 1, 1, 1,
0.1973099, 0.1206507, 2.023962, 1, 1, 1, 1, 1,
0.199868, -0.3549657, 1.158111, 1, 1, 1, 1, 1,
0.2013736, 0.5414529, -1.300084, 1, 1, 1, 1, 1,
0.2015937, -0.3308654, 3.31263, 1, 1, 1, 1, 1,
0.2066766, 0.5701008, -0.4253683, 1, 1, 1, 1, 1,
0.2072023, -0.08746848, 3.629511, 0, 0, 1, 1, 1,
0.2147075, -0.5159867, 1.150821, 1, 0, 0, 1, 1,
0.2150666, 0.4703974, 0.1850779, 1, 0, 0, 1, 1,
0.2168463, 1.162897, -0.2857403, 1, 0, 0, 1, 1,
0.2179867, 1.275453, 1.254258, 1, 0, 0, 1, 1,
0.2206308, 0.5194243, 1.049271, 1, 0, 0, 1, 1,
0.2210422, 0.5736721, 1.78165, 0, 0, 0, 1, 1,
0.2223738, -0.2258458, 1.990181, 0, 0, 0, 1, 1,
0.2250632, -0.05961636, 2.492778, 0, 0, 0, 1, 1,
0.2267961, -0.9411696, 3.019902, 0, 0, 0, 1, 1,
0.227477, 0.03537851, -0.7526911, 0, 0, 0, 1, 1,
0.2297378, -1.008947, 2.452712, 0, 0, 0, 1, 1,
0.2310554, 0.4368432, 0.9806282, 0, 0, 0, 1, 1,
0.2310764, 0.5016857, -0.3666942, 1, 1, 1, 1, 1,
0.2323046, 2.347898, -0.4339395, 1, 1, 1, 1, 1,
0.2358585, -0.2593503, 2.117087, 1, 1, 1, 1, 1,
0.2371926, 0.3006642, 0.4161804, 1, 1, 1, 1, 1,
0.2385179, 1.04636, -1.225811, 1, 1, 1, 1, 1,
0.2416723, -0.4670407, 2.209695, 1, 1, 1, 1, 1,
0.2466513, -0.719567, 3.668889, 1, 1, 1, 1, 1,
0.2478633, -0.9183592, 3.699765, 1, 1, 1, 1, 1,
0.2480526, -0.6489437, 2.721554, 1, 1, 1, 1, 1,
0.250373, -0.4865467, 4.149704, 1, 1, 1, 1, 1,
0.2513644, -0.01583636, 1.843916, 1, 1, 1, 1, 1,
0.2564124, -2.682023, 3.795849, 1, 1, 1, 1, 1,
0.2607778, 0.06656089, 1.317357, 1, 1, 1, 1, 1,
0.2649334, -0.2368995, 2.521162, 1, 1, 1, 1, 1,
0.265933, -1.201072, 4.384939, 1, 1, 1, 1, 1,
0.2683367, 1.734247, -0.5765819, 0, 0, 1, 1, 1,
0.2689182, 0.9270861, -2.387605, 1, 0, 0, 1, 1,
0.2699576, -1.213227, 1.496272, 1, 0, 0, 1, 1,
0.2711369, 1.09647, 0.8307658, 1, 0, 0, 1, 1,
0.2714063, 0.133795, 0.6093212, 1, 0, 0, 1, 1,
0.2779691, -1.599792, 3.138612, 1, 0, 0, 1, 1,
0.2784878, 0.01093561, 1.538105, 0, 0, 0, 1, 1,
0.2806024, -0.7605703, 1.823014, 0, 0, 0, 1, 1,
0.286244, 0.3362113, -0.9370019, 0, 0, 0, 1, 1,
0.2870466, 0.7156342, -0.01974648, 0, 0, 0, 1, 1,
0.2910446, -1.199386, 4.679815, 0, 0, 0, 1, 1,
0.2943203, 1.258085, 0.41552, 0, 0, 0, 1, 1,
0.2974366, 2.365997, -0.106486, 0, 0, 0, 1, 1,
0.3113772, -1.037172, 2.09838, 1, 1, 1, 1, 1,
0.3158622, 0.6598288, -0.07489381, 1, 1, 1, 1, 1,
0.322587, 0.9033625, 1.067427, 1, 1, 1, 1, 1,
0.3258998, 0.974484, -1.402536, 1, 1, 1, 1, 1,
0.3259938, -0.07927886, 0.9229465, 1, 1, 1, 1, 1,
0.3263936, 1.479965, 1.194479, 1, 1, 1, 1, 1,
0.3277735, 0.3204351, 2.115057, 1, 1, 1, 1, 1,
0.327834, 0.2268595, 0.8348033, 1, 1, 1, 1, 1,
0.3323105, 0.3823582, 1.397692, 1, 1, 1, 1, 1,
0.3324489, 1.788208, 2.163534, 1, 1, 1, 1, 1,
0.3325835, -2.339776, 4.342167, 1, 1, 1, 1, 1,
0.3332413, 0.3070784, -0.0555791, 1, 1, 1, 1, 1,
0.3333012, -0.3475788, 2.317832, 1, 1, 1, 1, 1,
0.3373106, 1.291028, 1.483883, 1, 1, 1, 1, 1,
0.3381711, 0.8054211, -0.71023, 1, 1, 1, 1, 1,
0.3409347, -0.704844, 2.553424, 0, 0, 1, 1, 1,
0.3433518, -0.7421505, 0.8576764, 1, 0, 0, 1, 1,
0.3442487, -0.7136188, 2.245796, 1, 0, 0, 1, 1,
0.3445933, -0.4105092, 2.783483, 1, 0, 0, 1, 1,
0.3451876, 0.323063, -0.2798862, 1, 0, 0, 1, 1,
0.3461976, 1.208201, 1.571532, 1, 0, 0, 1, 1,
0.3503836, 0.5987893, 0.04091233, 0, 0, 0, 1, 1,
0.3558414, -0.1450928, 0.6143556, 0, 0, 0, 1, 1,
0.3617192, 0.03085427, 0.3779234, 0, 0, 0, 1, 1,
0.3621003, -0.1022232, 1.803327, 0, 0, 0, 1, 1,
0.3675707, 0.5069631, -1.012492, 0, 0, 0, 1, 1,
0.3716919, 0.5343652, -0.150374, 0, 0, 0, 1, 1,
0.372021, 0.4028272, 0.8572114, 0, 0, 0, 1, 1,
0.3754969, 0.4942029, -0.09809099, 1, 1, 1, 1, 1,
0.3758809, 1.40686, 0.6027149, 1, 1, 1, 1, 1,
0.3790454, 0.7781001, -0.4255585, 1, 1, 1, 1, 1,
0.379599, -0.959514, 3.807556, 1, 1, 1, 1, 1,
0.3828459, -1.898091, 1.685513, 1, 1, 1, 1, 1,
0.3848448, -0.2360351, 1.793733, 1, 1, 1, 1, 1,
0.3882216, -0.5235633, 0.8496864, 1, 1, 1, 1, 1,
0.3909163, 0.7694284, 0.9453292, 1, 1, 1, 1, 1,
0.3985732, -1.989588, 2.476909, 1, 1, 1, 1, 1,
0.4050858, 0.0101845, 2.17005, 1, 1, 1, 1, 1,
0.4062002, -1.68466, 2.482404, 1, 1, 1, 1, 1,
0.4078002, -1.744016, 3.029478, 1, 1, 1, 1, 1,
0.4096143, -0.7472863, 3.530587, 1, 1, 1, 1, 1,
0.4101315, -0.8428187, 3.841303, 1, 1, 1, 1, 1,
0.4136373, -0.6674498, 3.9385, 1, 1, 1, 1, 1,
0.4147459, 0.4571329, 0.1314114, 0, 0, 1, 1, 1,
0.4183097, -0.5508689, 2.057798, 1, 0, 0, 1, 1,
0.4184846, -0.7557438, 4.647259, 1, 0, 0, 1, 1,
0.4203588, 0.08492751, 1.191184, 1, 0, 0, 1, 1,
0.4264746, -0.4022343, 1.035965, 1, 0, 0, 1, 1,
0.4304483, 0.4639629, 2.458736, 1, 0, 0, 1, 1,
0.4425453, -0.8754797, 2.925498, 0, 0, 0, 1, 1,
0.4430023, 1.244288, -0.2817278, 0, 0, 0, 1, 1,
0.4448134, 0.4891278, 1.807679, 0, 0, 0, 1, 1,
0.4452934, 1.074491, 0.1524983, 0, 0, 0, 1, 1,
0.4491815, -0.9018928, 2.511558, 0, 0, 0, 1, 1,
0.4504339, 0.1281117, 1.947686, 0, 0, 0, 1, 1,
0.4506381, -0.4548714, 2.604657, 0, 0, 0, 1, 1,
0.4510166, -0.04288391, 2.446059, 1, 1, 1, 1, 1,
0.4511306, 1.666388, 1.574943, 1, 1, 1, 1, 1,
0.4560043, 0.5882517, 0.5229914, 1, 1, 1, 1, 1,
0.4709097, 0.7541977, 0.7044884, 1, 1, 1, 1, 1,
0.4713471, -0.8474178, 2.928522, 1, 1, 1, 1, 1,
0.4734347, -1.536368, 1.741162, 1, 1, 1, 1, 1,
0.4753713, -0.9685403, 2.476897, 1, 1, 1, 1, 1,
0.4803447, -0.524583, 2.149832, 1, 1, 1, 1, 1,
0.4808089, 0.1705699, 0.570883, 1, 1, 1, 1, 1,
0.4818402, 1.947582, 1.297825, 1, 1, 1, 1, 1,
0.4847609, -0.9297167, 1.081773, 1, 1, 1, 1, 1,
0.4864747, 0.1848029, -0.9438477, 1, 1, 1, 1, 1,
0.4901376, 0.0737422, 1.729535, 1, 1, 1, 1, 1,
0.4901844, 0.2461079, 1.496159, 1, 1, 1, 1, 1,
0.4921755, -1.010749, 2.977241, 1, 1, 1, 1, 1,
0.4943747, 1.159611, -1.297274, 0, 0, 1, 1, 1,
0.4988574, -0.5610517, 2.485521, 1, 0, 0, 1, 1,
0.5005562, 0.2450933, 0.9048977, 1, 0, 0, 1, 1,
0.5009216, -1.264096, 3.613246, 1, 0, 0, 1, 1,
0.5031477, 0.4773156, 2.33352, 1, 0, 0, 1, 1,
0.5035239, 1.899871, 1.299276, 1, 0, 0, 1, 1,
0.5107388, 0.1648132, 1.20583, 0, 0, 0, 1, 1,
0.5151917, -0.2008723, 0.414793, 0, 0, 0, 1, 1,
0.5158913, 1.837469, 0.1964147, 0, 0, 0, 1, 1,
0.5218318, -0.3775019, 3.51641, 0, 0, 0, 1, 1,
0.527585, 0.8636298, 2.611626, 0, 0, 0, 1, 1,
0.5293294, -1.401962, 3.095411, 0, 0, 0, 1, 1,
0.5335619, -1.147275, 0.5186818, 0, 0, 0, 1, 1,
0.5401334, 0.3484685, 2.889301, 1, 1, 1, 1, 1,
0.5409684, 1.146394, 1.045201, 1, 1, 1, 1, 1,
0.5438684, 0.6514237, 0.8982878, 1, 1, 1, 1, 1,
0.5448111, -0.1262725, 2.920397, 1, 1, 1, 1, 1,
0.5451667, 0.7207193, 1.005916, 1, 1, 1, 1, 1,
0.5498905, 1.557587, 1.102849, 1, 1, 1, 1, 1,
0.5559727, 0.5190898, 0.0718348, 1, 1, 1, 1, 1,
0.5578554, -0.4956128, 3.253241, 1, 1, 1, 1, 1,
0.5618597, 1.061908, 0.508792, 1, 1, 1, 1, 1,
0.5619866, 0.2988693, 0.7693148, 1, 1, 1, 1, 1,
0.5636484, 1.183349, 1.931326, 1, 1, 1, 1, 1,
0.5637338, -0.2060717, 1.453254, 1, 1, 1, 1, 1,
0.5645469, -0.2551035, 2.579431, 1, 1, 1, 1, 1,
0.5710285, 0.4210769, 0.3995258, 1, 1, 1, 1, 1,
0.5717509, -0.4786458, 2.997257, 1, 1, 1, 1, 1,
0.5743138, -1.369853, 2.628469, 0, 0, 1, 1, 1,
0.5790887, 0.7928008, 0.4595101, 1, 0, 0, 1, 1,
0.582879, 0.4719093, 0.4711579, 1, 0, 0, 1, 1,
0.5829595, 2.326235, 1.219733, 1, 0, 0, 1, 1,
0.5874698, 2.149416, 1.538811, 1, 0, 0, 1, 1,
0.5878434, 0.162536, 0.7748452, 1, 0, 0, 1, 1,
0.5885146, -1.634279, 2.759037, 0, 0, 0, 1, 1,
0.596191, -0.2563869, 3.276112, 0, 0, 0, 1, 1,
0.59901, 1.13038, -1.110929, 0, 0, 0, 1, 1,
0.6041493, 0.2546371, 0.891602, 0, 0, 0, 1, 1,
0.6066728, -2.161685, 3.562984, 0, 0, 0, 1, 1,
0.611096, -0.02426617, 0.2847817, 0, 0, 0, 1, 1,
0.6117705, -1.433543, 3.293136, 0, 0, 0, 1, 1,
0.611989, -0.376628, 2.428527, 1, 1, 1, 1, 1,
0.616854, -1.216585, 3.322083, 1, 1, 1, 1, 1,
0.6177379, 0.07682218, 2.249954, 1, 1, 1, 1, 1,
0.6183429, -0.3555227, 4.286862, 1, 1, 1, 1, 1,
0.6204756, 0.4221087, 2.072559, 1, 1, 1, 1, 1,
0.6232831, 0.8549361, 0.1186716, 1, 1, 1, 1, 1,
0.6248394, 0.4177917, 0.7776878, 1, 1, 1, 1, 1,
0.6314827, -1.037438, 2.653529, 1, 1, 1, 1, 1,
0.6359316, 0.01394888, 0.6247329, 1, 1, 1, 1, 1,
0.6414301, 1.51141, 0.9359665, 1, 1, 1, 1, 1,
0.6415687, -0.02184057, 0.6505836, 1, 1, 1, 1, 1,
0.6433638, 2.664906, 0.1911498, 1, 1, 1, 1, 1,
0.6437338, 0.5678726, 1.933725, 1, 1, 1, 1, 1,
0.644449, -0.7826775, 2.815648, 1, 1, 1, 1, 1,
0.6461103, -1.535723, 1.604153, 1, 1, 1, 1, 1,
0.6473038, 0.7592425, 1.70983, 0, 0, 1, 1, 1,
0.6491699, -0.06424958, 2.198214, 1, 0, 0, 1, 1,
0.6493241, 0.3932025, 2.417015, 1, 0, 0, 1, 1,
0.6583475, 1.212131, -0.1975335, 1, 0, 0, 1, 1,
0.6609802, -0.03805145, 3.109533, 1, 0, 0, 1, 1,
0.6651722, 0.458507, 0.2822629, 1, 0, 0, 1, 1,
0.6705192, 0.9770809, 1.979476, 0, 0, 0, 1, 1,
0.6706764, -0.452897, 2.263392, 0, 0, 0, 1, 1,
0.6796438, 0.3691046, 1.988691, 0, 0, 0, 1, 1,
0.6806769, -0.09026984, 1.033898, 0, 0, 0, 1, 1,
0.6809462, 1.018856, -0.7119452, 0, 0, 0, 1, 1,
0.6854962, 1.747007, 0.1548246, 0, 0, 0, 1, 1,
0.6897463, 0.6976689, 0.6841208, 0, 0, 0, 1, 1,
0.6944183, -0.3498777, 1.737929, 1, 1, 1, 1, 1,
0.6985448, 0.429052, 1.013304, 1, 1, 1, 1, 1,
0.699766, -0.9014838, 2.247366, 1, 1, 1, 1, 1,
0.6999318, -1.126135, 1.739419, 1, 1, 1, 1, 1,
0.7028433, -0.4675698, 2.49493, 1, 1, 1, 1, 1,
0.7043161, -0.1948271, 2.197457, 1, 1, 1, 1, 1,
0.7083931, 0.6918155, 2.202587, 1, 1, 1, 1, 1,
0.7086176, -0.2495372, 2.415187, 1, 1, 1, 1, 1,
0.7111278, 0.716216, 0.3502838, 1, 1, 1, 1, 1,
0.7120066, -0.7392388, 2.241603, 1, 1, 1, 1, 1,
0.7190529, -0.2309842, 1.568031, 1, 1, 1, 1, 1,
0.7309887, 0.6679376, -1.424115, 1, 1, 1, 1, 1,
0.7391202, 0.8418221, 0.6527024, 1, 1, 1, 1, 1,
0.740103, 1.764422, 0.208418, 1, 1, 1, 1, 1,
0.7413562, -0.7244763, 1.42428, 1, 1, 1, 1, 1,
0.743045, -0.3532751, 1.811792, 0, 0, 1, 1, 1,
0.7498436, -1.785885, 3.169034, 1, 0, 0, 1, 1,
0.7501519, 0.6237596, 0.01109013, 1, 0, 0, 1, 1,
0.7511013, -1.399922, 2.05709, 1, 0, 0, 1, 1,
0.7524008, 0.4159765, 2.430378, 1, 0, 0, 1, 1,
0.7529257, -0.8813777, 3.406221, 1, 0, 0, 1, 1,
0.7534085, 0.8182244, 1.232343, 0, 0, 0, 1, 1,
0.7626545, 0.06539713, 3.247705, 0, 0, 0, 1, 1,
0.7641876, -0.4066664, 1.114272, 0, 0, 0, 1, 1,
0.7659838, -0.2545727, 1.847983, 0, 0, 0, 1, 1,
0.7676259, -0.7988325, 2.50088, 0, 0, 0, 1, 1,
0.7681237, 0.139331, 2.945896, 0, 0, 0, 1, 1,
0.7731877, -1.040003, 2.146651, 0, 0, 0, 1, 1,
0.7749722, -1.068012, 3.616611, 1, 1, 1, 1, 1,
0.7766749, 0.3761234, 0.08788497, 1, 1, 1, 1, 1,
0.7771993, 0.6986486, 1.110143, 1, 1, 1, 1, 1,
0.777768, -1.312484, 2.557449, 1, 1, 1, 1, 1,
0.7792228, -0.6075172, 2.724749, 1, 1, 1, 1, 1,
0.7823489, -0.7459651, 4.50314, 1, 1, 1, 1, 1,
0.7921915, -0.4938084, 3.094079, 1, 1, 1, 1, 1,
0.7935306, -0.9016793, 3.004712, 1, 1, 1, 1, 1,
0.7967364, -0.689868, 3.533229, 1, 1, 1, 1, 1,
0.8033423, 2.195928, -0.678876, 1, 1, 1, 1, 1,
0.8058942, 0.3171276, 1.611788, 1, 1, 1, 1, 1,
0.8073515, -0.374256, 1.667468, 1, 1, 1, 1, 1,
0.8170214, 0.674866, 0.8356463, 1, 1, 1, 1, 1,
0.8260881, 2.204093, 0.4634466, 1, 1, 1, 1, 1,
0.8294746, -0.2434549, 1.098015, 1, 1, 1, 1, 1,
0.8361285, 0.8148443, 1.69265, 0, 0, 1, 1, 1,
0.8405747, 0.4714189, 2.003235, 1, 0, 0, 1, 1,
0.8410785, -0.04664601, 1.473829, 1, 0, 0, 1, 1,
0.8420997, -1.972088, 3.178616, 1, 0, 0, 1, 1,
0.8466145, 0.5649952, 1.358685, 1, 0, 0, 1, 1,
0.8646846, -0.7679521, 3.333627, 1, 0, 0, 1, 1,
0.8678551, 1.482576, 3.003691, 0, 0, 0, 1, 1,
0.8763205, 1.080764, 1.762812, 0, 0, 0, 1, 1,
0.8770694, 0.7711782, 0.6776328, 0, 0, 0, 1, 1,
0.8830731, 0.8370057, -1.027068, 0, 0, 0, 1, 1,
0.8845621, 0.8085419, 1.653812, 0, 0, 0, 1, 1,
0.8847474, -0.4161017, 2.6905, 0, 0, 0, 1, 1,
0.8856591, -2.239202, 3.692454, 0, 0, 0, 1, 1,
0.8967327, 2.086817, 1.352895, 1, 1, 1, 1, 1,
0.8976239, -0.1346513, 1.656199, 1, 1, 1, 1, 1,
0.904738, -1.583852, 1.428478, 1, 1, 1, 1, 1,
0.9078136, -1.005133, 2.369411, 1, 1, 1, 1, 1,
0.9079626, -0.2165834, 4.976403, 1, 1, 1, 1, 1,
0.9118086, -1.922974, 2.59876, 1, 1, 1, 1, 1,
0.9140437, -0.005327296, 1.686235, 1, 1, 1, 1, 1,
0.9174721, 1.312393, -0.4648706, 1, 1, 1, 1, 1,
0.9178696, 0.5811518, 1.240912, 1, 1, 1, 1, 1,
0.9198812, 0.002986512, 0.8200983, 1, 1, 1, 1, 1,
0.921994, 0.8914218, 3.384092, 1, 1, 1, 1, 1,
0.9221016, 1.094692, 1.818257, 1, 1, 1, 1, 1,
0.9312018, -1.385658, 2.004709, 1, 1, 1, 1, 1,
0.9516265, 1.657172, 0.7325588, 1, 1, 1, 1, 1,
0.9521891, -0.5792553, 2.285247, 1, 1, 1, 1, 1,
0.9568304, -0.2502644, 0.8965906, 0, 0, 1, 1, 1,
0.9734926, -0.5814951, 2.110654, 1, 0, 0, 1, 1,
0.9860353, 0.715194, 1.858086, 1, 0, 0, 1, 1,
0.9864556, 1.243198, -1.64304, 1, 0, 0, 1, 1,
0.9891931, 1.080411, 1.927147, 1, 0, 0, 1, 1,
0.9896494, 2.551723, -1.029987, 1, 0, 0, 1, 1,
0.9909285, 0.08300192, 1.995532, 0, 0, 0, 1, 1,
0.9916959, -0.7595251, 1.369648, 0, 0, 0, 1, 1,
0.9982333, 0.2052816, 2.947494, 0, 0, 0, 1, 1,
0.9996629, 0.4051282, 0.4918052, 0, 0, 0, 1, 1,
1.002662, 0.293202, 0.6313907, 0, 0, 0, 1, 1,
1.00981, 1.445678, -0.09358936, 0, 0, 0, 1, 1,
1.01836, -0.4255856, 3.419024, 0, 0, 0, 1, 1,
1.020968, -1.531682, 2.958442, 1, 1, 1, 1, 1,
1.027707, 0.2449315, 0.5023959, 1, 1, 1, 1, 1,
1.03071, 0.8044971, 1.813383, 1, 1, 1, 1, 1,
1.033098, 0.05815245, -0.316385, 1, 1, 1, 1, 1,
1.033566, -1.19109, 1.121019, 1, 1, 1, 1, 1,
1.035783, 0.2424118, 1.650888, 1, 1, 1, 1, 1,
1.036636, 0.1202298, 1.620739, 1, 1, 1, 1, 1,
1.036643, -0.1291277, 0.7832903, 1, 1, 1, 1, 1,
1.046962, -0.1174628, 1.926993, 1, 1, 1, 1, 1,
1.053545, -0.689921, 1.628722, 1, 1, 1, 1, 1,
1.054998, 0.2576017, 3.632384, 1, 1, 1, 1, 1,
1.057925, 1.142952, 2.401188, 1, 1, 1, 1, 1,
1.062218, 1.088684, 0.7404594, 1, 1, 1, 1, 1,
1.064851, -0.2317909, 0.6152396, 1, 1, 1, 1, 1,
1.080849, -0.009296926, 1.003822, 1, 1, 1, 1, 1,
1.08912, -0.2390401, 2.218756, 0, 0, 1, 1, 1,
1.089738, 0.1110066, 1.761072, 1, 0, 0, 1, 1,
1.091352, 0.8512037, 0.4322865, 1, 0, 0, 1, 1,
1.094418, 0.2058237, 1.972032, 1, 0, 0, 1, 1,
1.103914, 1.044333, -0.4696129, 1, 0, 0, 1, 1,
1.104442, 0.5394232, 1.036742, 1, 0, 0, 1, 1,
1.109219, -0.1061761, 2.243617, 0, 0, 0, 1, 1,
1.11083, -1.202548, 2.727351, 0, 0, 0, 1, 1,
1.114479, 1.482716, 2.113108, 0, 0, 0, 1, 1,
1.125068, -0.8966933, 1.270214, 0, 0, 0, 1, 1,
1.128475, -0.8260052, 2.634858, 0, 0, 0, 1, 1,
1.131405, 0.2898742, 1.658908, 0, 0, 0, 1, 1,
1.131736, 1.394381, -0.418799, 0, 0, 0, 1, 1,
1.13338, 0.8841305, 1.014401, 1, 1, 1, 1, 1,
1.139533, 0.7689651, 1.395898, 1, 1, 1, 1, 1,
1.148235, -0.2930525, 1.976102, 1, 1, 1, 1, 1,
1.152402, -1.669972, 1.112984, 1, 1, 1, 1, 1,
1.155398, 0.5374813, -0.4865676, 1, 1, 1, 1, 1,
1.158619, 1.011885, 0.237912, 1, 1, 1, 1, 1,
1.163378, -0.169082, 1.651271, 1, 1, 1, 1, 1,
1.168583, 0.5751144, 0.3091797, 1, 1, 1, 1, 1,
1.170359, -1.079222, 3.403146, 1, 1, 1, 1, 1,
1.18014, -0.9727092, 2.972536, 1, 1, 1, 1, 1,
1.18062, 0.3027701, 1.558674, 1, 1, 1, 1, 1,
1.182352, 1.754286, -0.07444324, 1, 1, 1, 1, 1,
1.192487, 0.7066011, 1.736564, 1, 1, 1, 1, 1,
1.198978, 0.07299499, 1.419284, 1, 1, 1, 1, 1,
1.200323, 0.9422004, 0.7653598, 1, 1, 1, 1, 1,
1.200662, 0.0545163, 1.283969, 0, 0, 1, 1, 1,
1.20688, 0.9540088, 1.744718, 1, 0, 0, 1, 1,
1.213012, 0.04799435, 1.498492, 1, 0, 0, 1, 1,
1.222311, 1.729818, 0.4157121, 1, 0, 0, 1, 1,
1.241729, 0.6785526, 2.154096, 1, 0, 0, 1, 1,
1.250125, -0.2782662, 0.6697361, 1, 0, 0, 1, 1,
1.251206, 1.615275, 1.136762, 0, 0, 0, 1, 1,
1.260896, 1.018127, 1.691017, 0, 0, 0, 1, 1,
1.261054, -0.3091486, 2.059945, 0, 0, 0, 1, 1,
1.262402, -1.17682, 2.5705, 0, 0, 0, 1, 1,
1.269249, 0.8271435, 1.904617, 0, 0, 0, 1, 1,
1.269466, -0.2890457, 0.1627693, 0, 0, 0, 1, 1,
1.271301, 0.292416, 0.5724661, 0, 0, 0, 1, 1,
1.273184, -0.795516, 4.001609, 1, 1, 1, 1, 1,
1.276595, 0.09624398, 2.223656, 1, 1, 1, 1, 1,
1.30296, -0.2047937, 1.729287, 1, 1, 1, 1, 1,
1.305236, 1.841406, 2.23475, 1, 1, 1, 1, 1,
1.309358, -1.183196, 1.513551, 1, 1, 1, 1, 1,
1.328209, -1.115649, 1.356328, 1, 1, 1, 1, 1,
1.333333, 0.2626563, 1.72003, 1, 1, 1, 1, 1,
1.341431, -1.541446, 2.842489, 1, 1, 1, 1, 1,
1.342136, 0.2847415, 1.285385, 1, 1, 1, 1, 1,
1.349228, 0.1928314, 2.811415, 1, 1, 1, 1, 1,
1.35283, 0.8928521, 1.694361, 1, 1, 1, 1, 1,
1.356693, -0.1240167, 0.6506087, 1, 1, 1, 1, 1,
1.360618, -0.9596786, 0.9364032, 1, 1, 1, 1, 1,
1.361808, -1.545812, 3.82673, 1, 1, 1, 1, 1,
1.362651, 0.3025192, 2.077557, 1, 1, 1, 1, 1,
1.364741, 0.7885236, 0.05134669, 0, 0, 1, 1, 1,
1.365306, 0.9716504, 3.17141, 1, 0, 0, 1, 1,
1.36797, 0.6135648, 2.200397, 1, 0, 0, 1, 1,
1.369673, 1.870701, 0.08212306, 1, 0, 0, 1, 1,
1.372703, 1.31854, 2.321091, 1, 0, 0, 1, 1,
1.373231, -0.09502154, 1.658838, 1, 0, 0, 1, 1,
1.37526, -0.8148669, 2.143782, 0, 0, 0, 1, 1,
1.3759, -0.3041158, 1.63888, 0, 0, 0, 1, 1,
1.383198, 1.841014, -0.400416, 0, 0, 0, 1, 1,
1.38541, -1.060417, 2.310816, 0, 0, 0, 1, 1,
1.396561, -1.184929, 3.481319, 0, 0, 0, 1, 1,
1.407186, 1.505824, 1.615134, 0, 0, 0, 1, 1,
1.407932, -0.7549056, 2.082066, 0, 0, 0, 1, 1,
1.413951, 0.290029, 3.635076, 1, 1, 1, 1, 1,
1.414839, 1.51003, -0.0172494, 1, 1, 1, 1, 1,
1.415623, -0.3861375, 3.098435, 1, 1, 1, 1, 1,
1.420876, 0.806633, 1.246086, 1, 1, 1, 1, 1,
1.423849, -0.5506323, 3.56573, 1, 1, 1, 1, 1,
1.424155, 1.97909, -0.02606113, 1, 1, 1, 1, 1,
1.431405, 0.9258699, 1.314873, 1, 1, 1, 1, 1,
1.432574, 1.143594, 1.281454, 1, 1, 1, 1, 1,
1.446056, 0.8948935, 0.6572865, 1, 1, 1, 1, 1,
1.449603, 0.4500566, -0.1529228, 1, 1, 1, 1, 1,
1.451393, 0.9521216, -0.4737399, 1, 1, 1, 1, 1,
1.464891, -2.267944, 2.52567, 1, 1, 1, 1, 1,
1.474873, 0.3973631, 0.06000436, 1, 1, 1, 1, 1,
1.495345, 0.03240391, 2.904767, 1, 1, 1, 1, 1,
1.505623, 0.2047142, 2.813456, 1, 1, 1, 1, 1,
1.511435, 2.031158, 0.1269031, 0, 0, 1, 1, 1,
1.524831, -0.1454639, 0.5115591, 1, 0, 0, 1, 1,
1.530757, 0.642278, -0.0449784, 1, 0, 0, 1, 1,
1.533673, 0.8993984, 1.717251, 1, 0, 0, 1, 1,
1.542655, -0.521593, 2.433707, 1, 0, 0, 1, 1,
1.544117, 0.1137753, 2.69351, 1, 0, 0, 1, 1,
1.54548, -0.3547668, 0.5450773, 0, 0, 0, 1, 1,
1.548753, 0.6798934, 3.735072, 0, 0, 0, 1, 1,
1.557112, -0.9018305, 1.174793, 0, 0, 0, 1, 1,
1.562619, -1.20995, 2.565533, 0, 0, 0, 1, 1,
1.577906, -0.6259767, 1.797555, 0, 0, 0, 1, 1,
1.580335, 0.3456367, 1.896193, 0, 0, 0, 1, 1,
1.587972, 0.2742564, 2.109549, 0, 0, 0, 1, 1,
1.592502, 0.1388083, 2.453345, 1, 1, 1, 1, 1,
1.593534, 2.295995, 1.006784, 1, 1, 1, 1, 1,
1.601575, 0.8268172, 1.122562, 1, 1, 1, 1, 1,
1.604741, -0.6920416, 0.7581244, 1, 1, 1, 1, 1,
1.605803, 0.3535593, 2.301318, 1, 1, 1, 1, 1,
1.639072, 0.4643114, 2.747137, 1, 1, 1, 1, 1,
1.642365, -2.281734, 0.8087581, 1, 1, 1, 1, 1,
1.647885, -1.120017, 4.311247, 1, 1, 1, 1, 1,
1.650292, -0.3545808, 3.531476, 1, 1, 1, 1, 1,
1.653629, -0.8002997, 1.457339, 1, 1, 1, 1, 1,
1.671947, 1.003777, 1.613149, 1, 1, 1, 1, 1,
1.674866, 2.07002, -1.942717, 1, 1, 1, 1, 1,
1.675129, -0.06054729, 1.802594, 1, 1, 1, 1, 1,
1.678195, -0.04858062, 0.6093495, 1, 1, 1, 1, 1,
1.689731, 0.7062234, 0.3573452, 1, 1, 1, 1, 1,
1.696866, -0.1952534, 2.533363, 0, 0, 1, 1, 1,
1.703728, -0.3246633, 1.463029, 1, 0, 0, 1, 1,
1.706631, -0.08839146, 0.2184617, 1, 0, 0, 1, 1,
1.710949, 1.387487, 1.64538, 1, 0, 0, 1, 1,
1.720664, -1.379807, 1.754847, 1, 0, 0, 1, 1,
1.733105, 0.2677628, 0.9420177, 1, 0, 0, 1, 1,
1.774906, 0.3126741, 0.7695744, 0, 0, 0, 1, 1,
1.794325, 0.4555197, 0.5947713, 0, 0, 0, 1, 1,
1.798158, -0.3888287, 2.280462, 0, 0, 0, 1, 1,
1.806098, 0.7832952, -0.8022766, 0, 0, 0, 1, 1,
1.807907, 0.350421, 1.683939, 0, 0, 0, 1, 1,
1.822194, -1.049048, 0.2939596, 0, 0, 0, 1, 1,
1.839518, -0.8173866, 3.169512, 0, 0, 0, 1, 1,
1.849919, 0.100727, 0.1288708, 1, 1, 1, 1, 1,
1.862574, 0.9689056, 1.30875, 1, 1, 1, 1, 1,
1.938145, -0.9441545, 1.366162, 1, 1, 1, 1, 1,
1.966189, 0.4775748, 1.19841, 1, 1, 1, 1, 1,
1.967679, -0.4631159, 3.60518, 1, 1, 1, 1, 1,
1.968526, 0.1626394, 1.277707, 1, 1, 1, 1, 1,
2.000246, -0.1790381, 0.2008152, 1, 1, 1, 1, 1,
2.013272, -0.3254639, 1.596914, 1, 1, 1, 1, 1,
2.019416, 0.4178299, 2.078841, 1, 1, 1, 1, 1,
2.022233, -0.86283, 3.306997, 1, 1, 1, 1, 1,
2.027709, -1.474608, 1.977569, 1, 1, 1, 1, 1,
2.073305, 0.7683079, 0.07932106, 1, 1, 1, 1, 1,
2.117487, -1.904465, 2.707237, 1, 1, 1, 1, 1,
2.15522, 2.924203, 1.756464, 1, 1, 1, 1, 1,
2.180915, -0.2676783, 1.821131, 1, 1, 1, 1, 1,
2.185893, -0.4533114, 1.729998, 0, 0, 1, 1, 1,
2.192723, -1.993141, 2.962919, 1, 0, 0, 1, 1,
2.202077, -2.048476, 2.444888, 1, 0, 0, 1, 1,
2.206879, -0.1560545, 1.808116, 1, 0, 0, 1, 1,
2.23052, 0.01838757, 1.079075, 1, 0, 0, 1, 1,
2.260845, -0.1095528, 1.256471, 1, 0, 0, 1, 1,
2.262369, 0.4372644, 0.1694533, 0, 0, 0, 1, 1,
2.301264, -0.7920894, 0.6359142, 0, 0, 0, 1, 1,
2.32677, -0.8296213, 1.360318, 0, 0, 0, 1, 1,
2.335413, 0.7948769, 1.459738, 0, 0, 0, 1, 1,
2.41756, 0.6224173, -0.721248, 0, 0, 0, 1, 1,
2.431555, -0.3768962, 2.19473, 0, 0, 0, 1, 1,
2.474942, 1.59685, -2.365815, 0, 0, 0, 1, 1,
2.560259, 0.09615418, 1.562505, 1, 1, 1, 1, 1,
2.607552, -0.7167057, 2.195923, 1, 1, 1, 1, 1,
2.640334, -0.1482125, 1.880443, 1, 1, 1, 1, 1,
2.679603, -1.772869, 0.9271758, 1, 1, 1, 1, 1,
2.856579, 1.227906, 1.186366, 1, 1, 1, 1, 1,
2.917234, 0.7569248, 1.061007, 1, 1, 1, 1, 1,
3.91025, -1.514534, 2.727418, 1, 1, 1, 1, 1
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
var radius = 9.891121;
var distance = 34.74214;
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
mvMatrix.translate( -0.4373188, 0.1350219, 0.4257283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74214);
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
