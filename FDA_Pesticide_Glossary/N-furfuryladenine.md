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
-3.101148, 1.117583, -0.9133735, 1, 0, 0, 1,
-2.952941, 0.1185063, -1.106657, 1, 0.007843138, 0, 1,
-2.555502, -0.8151274, -1.848944, 1, 0.01176471, 0, 1,
-2.497823, 0.4515021, -0.6297281, 1, 0.01960784, 0, 1,
-2.481676, 0.4238004, -1.851735, 1, 0.02352941, 0, 1,
-2.477737, 1.354008, -2.958119, 1, 0.03137255, 0, 1,
-2.477244, 0.2039929, -2.716797, 1, 0.03529412, 0, 1,
-2.46966, 0.2095528, -0.375789, 1, 0.04313726, 0, 1,
-2.365997, 0.5936821, -1.092005, 1, 0.04705882, 0, 1,
-2.321468, 0.02228017, -1.841495, 1, 0.05490196, 0, 1,
-2.276061, 0.7941998, 0.7407828, 1, 0.05882353, 0, 1,
-2.274678, -1.483665, -1.44119, 1, 0.06666667, 0, 1,
-2.256087, -1.642945, -3.145899, 1, 0.07058824, 0, 1,
-2.210832, 0.5620779, -1.909014, 1, 0.07843138, 0, 1,
-2.210753, 0.3301995, -1.589351, 1, 0.08235294, 0, 1,
-2.178177, -0.02224886, -1.508098, 1, 0.09019608, 0, 1,
-2.176974, -1.539081, -2.859359, 1, 0.09411765, 0, 1,
-2.175508, 0.1926824, -1.7753, 1, 0.1019608, 0, 1,
-2.156594, -2.269397, -2.727829, 1, 0.1098039, 0, 1,
-2.152082, -1.397449, -3.214822, 1, 0.1137255, 0, 1,
-2.137251, -1.124391, -0.5278763, 1, 0.1215686, 0, 1,
-2.134733, -0.7262725, -2.950379, 1, 0.1254902, 0, 1,
-2.130694, 0.3205034, -1.345837, 1, 0.1333333, 0, 1,
-2.104099, -0.3017031, 0.356074, 1, 0.1372549, 0, 1,
-2.093649, 2.425617, -0.5107009, 1, 0.145098, 0, 1,
-2.057281, 1.87199, 0.3072916, 1, 0.1490196, 0, 1,
-2.030473, -0.2303551, -2.990486, 1, 0.1568628, 0, 1,
-2.02225, -0.6640309, -1.26404, 1, 0.1607843, 0, 1,
-2.019905, -0.2544606, -0.6313391, 1, 0.1686275, 0, 1,
-1.983556, 1.670412, -1.770899, 1, 0.172549, 0, 1,
-1.983457, -0.6290528, -0.9295413, 1, 0.1803922, 0, 1,
-1.983216, 0.08310887, -1.678242, 1, 0.1843137, 0, 1,
-1.980519, -1.432791, -3.393997, 1, 0.1921569, 0, 1,
-1.976707, -0.1901504, -1.822016, 1, 0.1960784, 0, 1,
-1.959658, -0.6940851, -1.839508, 1, 0.2039216, 0, 1,
-1.939527, -0.1647434, -1.108221, 1, 0.2117647, 0, 1,
-1.930922, 0.2297155, -0.6123129, 1, 0.2156863, 0, 1,
-1.917435, -2.350557, -2.608098, 1, 0.2235294, 0, 1,
-1.908894, -1.437046, -0.6010748, 1, 0.227451, 0, 1,
-1.897498, -0.1106226, -2.68718, 1, 0.2352941, 0, 1,
-1.879909, -1.031061, -0.2793884, 1, 0.2392157, 0, 1,
-1.879901, 0.8230248, -0.891516, 1, 0.2470588, 0, 1,
-1.869341, -0.006127432, -0.65254, 1, 0.2509804, 0, 1,
-1.851986, -0.481897, -1.827783, 1, 0.2588235, 0, 1,
-1.834543, -1.039026, -0.7681429, 1, 0.2627451, 0, 1,
-1.829115, -0.5316735, -3.545665, 1, 0.2705882, 0, 1,
-1.816424, 0.2933366, 0.946808, 1, 0.2745098, 0, 1,
-1.802899, 0.2440052, -2.605108, 1, 0.282353, 0, 1,
-1.787855, -1.214145, -1.256199, 1, 0.2862745, 0, 1,
-1.784959, -0.2397158, -1.753483, 1, 0.2941177, 0, 1,
-1.784758, -0.2776735, -2.041698, 1, 0.3019608, 0, 1,
-1.773899, -0.4060204, -2.050314, 1, 0.3058824, 0, 1,
-1.74988, -0.2035789, -1.257777, 1, 0.3137255, 0, 1,
-1.743613, 0.3990909, -0.3287698, 1, 0.3176471, 0, 1,
-1.735001, -0.7205038, -2.097311, 1, 0.3254902, 0, 1,
-1.733756, 0.2092953, -1.132423, 1, 0.3294118, 0, 1,
-1.730082, 1.054074, -1.851004, 1, 0.3372549, 0, 1,
-1.729256, 0.6330507, -1.896509, 1, 0.3411765, 0, 1,
-1.727275, 0.1415479, -0.7097778, 1, 0.3490196, 0, 1,
-1.726071, 0.8692561, -2.565567, 1, 0.3529412, 0, 1,
-1.715153, 1.45996, -2.323728, 1, 0.3607843, 0, 1,
-1.692219, -1.71731, -3.38687, 1, 0.3647059, 0, 1,
-1.69173, -1.049288, -2.046353, 1, 0.372549, 0, 1,
-1.691201, 0.3951755, -1.487615, 1, 0.3764706, 0, 1,
-1.665275, 0.3199247, -0.2935968, 1, 0.3843137, 0, 1,
-1.660784, -0.370579, -2.784691, 1, 0.3882353, 0, 1,
-1.660492, -0.3576933, -1.972137, 1, 0.3960784, 0, 1,
-1.65975, 0.7173632, -0.4169303, 1, 0.4039216, 0, 1,
-1.656936, -0.09569455, -1.972767, 1, 0.4078431, 0, 1,
-1.630712, 1.136674, -1.435876, 1, 0.4156863, 0, 1,
-1.625986, -1.156862, -1.718614, 1, 0.4196078, 0, 1,
-1.595948, -1.494665, -2.718853, 1, 0.427451, 0, 1,
-1.593443, 0.09340101, -0.3729964, 1, 0.4313726, 0, 1,
-1.589278, 0.5195867, -1.384033, 1, 0.4392157, 0, 1,
-1.585716, -0.5095004, -2.288523, 1, 0.4431373, 0, 1,
-1.578476, -0.9880918, -1.912065, 1, 0.4509804, 0, 1,
-1.568268, -0.4968269, -2.599276, 1, 0.454902, 0, 1,
-1.55911, -0.427991, -2.587605, 1, 0.4627451, 0, 1,
-1.536159, -0.61385, -1.200002, 1, 0.4666667, 0, 1,
-1.533872, -0.7713268, -1.398828, 1, 0.4745098, 0, 1,
-1.523794, -0.3362418, -2.031884, 1, 0.4784314, 0, 1,
-1.508025, -1.139205, -3.291293, 1, 0.4862745, 0, 1,
-1.507435, -0.434456, -0.9121135, 1, 0.4901961, 0, 1,
-1.505035, 0.3174236, -1.13616, 1, 0.4980392, 0, 1,
-1.500405, 1.062452, -1.796187, 1, 0.5058824, 0, 1,
-1.499887, -0.9063439, -2.593523, 1, 0.509804, 0, 1,
-1.498556, -1.358174, -3.275281, 1, 0.5176471, 0, 1,
-1.497498, -0.9575613, -3.282975, 1, 0.5215687, 0, 1,
-1.483772, -0.2271991, -2.0545, 1, 0.5294118, 0, 1,
-1.483635, -0.6404665, -1.689164, 1, 0.5333334, 0, 1,
-1.462479, 0.6170821, -1.326634, 1, 0.5411765, 0, 1,
-1.45619, 0.5595399, -2.104497, 1, 0.5450981, 0, 1,
-1.455874, -0.6087335, -3.047878, 1, 0.5529412, 0, 1,
-1.444872, 2.269416, -2.615198, 1, 0.5568628, 0, 1,
-1.439709, -1.512427, -0.8304711, 1, 0.5647059, 0, 1,
-1.432088, -0.9320275, -0.8786995, 1, 0.5686275, 0, 1,
-1.427572, 2.647407, -1.920386, 1, 0.5764706, 0, 1,
-1.413674, -0.2613332, -2.092981, 1, 0.5803922, 0, 1,
-1.412619, -1.078627, -2.583008, 1, 0.5882353, 0, 1,
-1.411076, -0.5349599, -0.2891791, 1, 0.5921569, 0, 1,
-1.397481, 1.382882, 0.6307546, 1, 0.6, 0, 1,
-1.396926, -2.252699, -3.239653, 1, 0.6078432, 0, 1,
-1.387365, -0.2510437, -2.504449, 1, 0.6117647, 0, 1,
-1.386988, 0.9633095, -0.1977385, 1, 0.6196079, 0, 1,
-1.383093, -0.2840345, -1.01607, 1, 0.6235294, 0, 1,
-1.382699, 0.2144919, -1.963053, 1, 0.6313726, 0, 1,
-1.370994, 0.02533665, -1.228582, 1, 0.6352941, 0, 1,
-1.365462, -1.496958, -2.628294, 1, 0.6431373, 0, 1,
-1.346502, -2.037768, -2.449604, 1, 0.6470588, 0, 1,
-1.334736, 0.2428733, -2.349189, 1, 0.654902, 0, 1,
-1.334697, 1.581545, -1.192235, 1, 0.6588235, 0, 1,
-1.332365, -0.6400437, -1.064073, 1, 0.6666667, 0, 1,
-1.328981, 1.38949, -1.204115, 1, 0.6705883, 0, 1,
-1.328749, 2.226568, -0.4663944, 1, 0.6784314, 0, 1,
-1.324673, -1.234718, -2.524889, 1, 0.682353, 0, 1,
-1.31797, -0.06717492, -2.321195, 1, 0.6901961, 0, 1,
-1.313249, 0.4404778, -1.686287, 1, 0.6941177, 0, 1,
-1.312245, 0.8977082, -1.258572, 1, 0.7019608, 0, 1,
-1.30488, 0.3215143, -2.253601, 1, 0.7098039, 0, 1,
-1.300612, -1.335388, -1.846621, 1, 0.7137255, 0, 1,
-1.289791, 0.824294, 0.0589033, 1, 0.7215686, 0, 1,
-1.275033, -0.7663335, -3.735142, 1, 0.7254902, 0, 1,
-1.247304, -0.8016917, -0.6106869, 1, 0.7333333, 0, 1,
-1.24709, 0.2262646, -1.276816, 1, 0.7372549, 0, 1,
-1.244363, 1.050205, -0.790324, 1, 0.7450981, 0, 1,
-1.238406, -1.002207, -1.414495, 1, 0.7490196, 0, 1,
-1.23596, 0.4046637, -1.94281, 1, 0.7568628, 0, 1,
-1.2234, -1.296865, -3.008825, 1, 0.7607843, 0, 1,
-1.212366, 0.5404011, 0.03899678, 1, 0.7686275, 0, 1,
-1.207247, -1.913677, -2.856879, 1, 0.772549, 0, 1,
-1.202315, -2.032384, -2.310082, 1, 0.7803922, 0, 1,
-1.188104, 0.2479798, -3.719199, 1, 0.7843137, 0, 1,
-1.172163, 0.01404938, 0.4924015, 1, 0.7921569, 0, 1,
-1.171813, -0.4059477, -2.767954, 1, 0.7960784, 0, 1,
-1.171219, -0.6018167, -1.836763, 1, 0.8039216, 0, 1,
-1.169646, 1.700605, -0.1058403, 1, 0.8117647, 0, 1,
-1.166163, -1.092664, -1.811665, 1, 0.8156863, 0, 1,
-1.140436, -0.08365919, -2.82125, 1, 0.8235294, 0, 1,
-1.135863, 2.03189, 0.8526726, 1, 0.827451, 0, 1,
-1.121287, 2.260074, -0.1821266, 1, 0.8352941, 0, 1,
-1.118964, 1.892077, -0.2463349, 1, 0.8392157, 0, 1,
-1.118334, -1.283983, -1.992238, 1, 0.8470588, 0, 1,
-1.108879, 0.06961311, -1.065564, 1, 0.8509804, 0, 1,
-1.1032, -2.512141, -4.618698, 1, 0.8588235, 0, 1,
-1.098318, 0.0002284527, -2.25037, 1, 0.8627451, 0, 1,
-1.096106, 0.562018, 0.2095386, 1, 0.8705882, 0, 1,
-1.093181, -0.5949172, -1.634089, 1, 0.8745098, 0, 1,
-1.089778, -0.3477854, -3.370561, 1, 0.8823529, 0, 1,
-1.08474, 0.4231328, -1.553441, 1, 0.8862745, 0, 1,
-1.084139, -1.124794, -3.080784, 1, 0.8941177, 0, 1,
-1.079502, 0.1265953, -3.378742, 1, 0.8980392, 0, 1,
-1.072346, 0.9782718, 0.4695576, 1, 0.9058824, 0, 1,
-1.056765, -1.169074, -0.5641932, 1, 0.9137255, 0, 1,
-1.053843, 0.382467, -2.730407, 1, 0.9176471, 0, 1,
-1.046968, 0.08657745, -0.3914888, 1, 0.9254902, 0, 1,
-1.042046, -2.158022, -2.227377, 1, 0.9294118, 0, 1,
-1.026824, -0.4868238, -1.389835, 1, 0.9372549, 0, 1,
-1.024414, -1.360984, -0.6168768, 1, 0.9411765, 0, 1,
-1.010749, 0.3664048, -0.7306719, 1, 0.9490196, 0, 1,
-1.006718, 1.229384, 0.4307152, 1, 0.9529412, 0, 1,
-1.002674, 0.9314622, -1.43564, 1, 0.9607843, 0, 1,
-1.000195, 0.02952414, -2.780846, 1, 0.9647059, 0, 1,
-0.9856918, 1.735157, -0.3706793, 1, 0.972549, 0, 1,
-0.9834041, 0.9369445, -0.3304248, 1, 0.9764706, 0, 1,
-0.9817664, -1.371716, -2.797767, 1, 0.9843137, 0, 1,
-0.9802366, -1.105214, -3.339069, 1, 0.9882353, 0, 1,
-0.9652765, 0.2497001, -1.748531, 1, 0.9960784, 0, 1,
-0.9640693, 0.9412015, -0.7720133, 0.9960784, 1, 0, 1,
-0.954082, -1.317717, -3.083539, 0.9921569, 1, 0, 1,
-0.9537982, 1.116503, 0.7750467, 0.9843137, 1, 0, 1,
-0.9509609, -1.294763, -2.960932, 0.9803922, 1, 0, 1,
-0.9362912, -0.1247239, -1.543912, 0.972549, 1, 0, 1,
-0.9300523, 0.08554647, -2.410096, 0.9686275, 1, 0, 1,
-0.9293849, 0.3770671, -1.680143, 0.9607843, 1, 0, 1,
-0.9265495, 0.9950554, -0.9267974, 0.9568627, 1, 0, 1,
-0.9261575, -1.579474, -2.756521, 0.9490196, 1, 0, 1,
-0.9194909, 1.347811, -0.1733362, 0.945098, 1, 0, 1,
-0.9185145, 1.7762, 1.464716, 0.9372549, 1, 0, 1,
-0.9152442, 0.7103039, 1.376673, 0.9333333, 1, 0, 1,
-0.9116238, -2.221329, -2.652693, 0.9254902, 1, 0, 1,
-0.907131, -0.7126799, -1.551171, 0.9215686, 1, 0, 1,
-0.9005952, 0.03820812, -0.8614764, 0.9137255, 1, 0, 1,
-0.8991866, 0.6273822, -0.5343451, 0.9098039, 1, 0, 1,
-0.8974938, 1.386461, -0.3507467, 0.9019608, 1, 0, 1,
-0.8927115, 0.1842398, -0.9302554, 0.8941177, 1, 0, 1,
-0.891752, 1.144904, -1.567668, 0.8901961, 1, 0, 1,
-0.8868626, -0.8173114, -1.217138, 0.8823529, 1, 0, 1,
-0.8858811, -0.9257032, -2.105004, 0.8784314, 1, 0, 1,
-0.8820314, 0.4481334, -2.022414, 0.8705882, 1, 0, 1,
-0.8815906, 1.024653, -3.37541, 0.8666667, 1, 0, 1,
-0.8815342, -0.7148443, -0.6146123, 0.8588235, 1, 0, 1,
-0.8792952, 0.3957016, -2.62868, 0.854902, 1, 0, 1,
-0.8764868, 0.4587959, -2.168161, 0.8470588, 1, 0, 1,
-0.8755862, 0.9735734, -1.518793, 0.8431373, 1, 0, 1,
-0.8741333, 1.101634, -1.34033, 0.8352941, 1, 0, 1,
-0.8732918, -2.452664, -1.897149, 0.8313726, 1, 0, 1,
-0.8705111, 0.7418128, -1.246688, 0.8235294, 1, 0, 1,
-0.8632188, 0.724817, -0.3029133, 0.8196079, 1, 0, 1,
-0.8606908, 0.5646627, -0.9876496, 0.8117647, 1, 0, 1,
-0.8592725, -0.3470226, -2.840464, 0.8078431, 1, 0, 1,
-0.8540524, -0.2217912, -0.870059, 0.8, 1, 0, 1,
-0.8531837, -1.329509, -2.051842, 0.7921569, 1, 0, 1,
-0.8514646, -1.827008, -2.868113, 0.7882353, 1, 0, 1,
-0.8507286, 0.7488253, -1.282046, 0.7803922, 1, 0, 1,
-0.8417626, 1.7109, 1.334793, 0.7764706, 1, 0, 1,
-0.8354526, -1.082218, -0.6473113, 0.7686275, 1, 0, 1,
-0.8304957, 0.4920866, -0.9893769, 0.7647059, 1, 0, 1,
-0.822623, 0.961971, -2.404366, 0.7568628, 1, 0, 1,
-0.8207194, -0.8891037, -1.470251, 0.7529412, 1, 0, 1,
-0.8191258, -1.116922, -1.896877, 0.7450981, 1, 0, 1,
-0.8154706, -2.297999, -2.273583, 0.7411765, 1, 0, 1,
-0.8093528, -0.1037534, -0.3549646, 0.7333333, 1, 0, 1,
-0.8075544, 0.9580731, -1.646606, 0.7294118, 1, 0, 1,
-0.8009367, -3.068371, -2.709463, 0.7215686, 1, 0, 1,
-0.7990236, -1.487829, -0.4644674, 0.7176471, 1, 0, 1,
-0.7980962, 0.5458367, 0.1236495, 0.7098039, 1, 0, 1,
-0.7980238, -1.676005, -2.649368, 0.7058824, 1, 0, 1,
-0.7911112, 0.02431817, -1.995104, 0.6980392, 1, 0, 1,
-0.7814868, 2.813697, -0.589888, 0.6901961, 1, 0, 1,
-0.7802272, 1.629313, 0.2210056, 0.6862745, 1, 0, 1,
-0.7798907, 1.246537, -1.370749, 0.6784314, 1, 0, 1,
-0.779519, -1.949139, -2.142478, 0.6745098, 1, 0, 1,
-0.7750288, -1.218392, -3.97983, 0.6666667, 1, 0, 1,
-0.7694542, -0.7403886, -2.623527, 0.6627451, 1, 0, 1,
-0.7653674, 0.3491406, -1.598083, 0.654902, 1, 0, 1,
-0.7645187, -1.326929, -2.713271, 0.6509804, 1, 0, 1,
-0.7627759, 1.410952, -1.335186, 0.6431373, 1, 0, 1,
-0.7605958, 1.0597, 1.146925, 0.6392157, 1, 0, 1,
-0.7579644, 0.3951243, 0.5100978, 0.6313726, 1, 0, 1,
-0.7477949, -1.362202, -1.523402, 0.627451, 1, 0, 1,
-0.7381496, -1.090474, -2.385581, 0.6196079, 1, 0, 1,
-0.7314985, -0.4303094, -3.15194, 0.6156863, 1, 0, 1,
-0.7286684, -0.1213144, -2.481277, 0.6078432, 1, 0, 1,
-0.7240222, 0.150592, -1.834311, 0.6039216, 1, 0, 1,
-0.7237656, -0.3648776, -3.221521, 0.5960785, 1, 0, 1,
-0.7213597, -1.12178, -3.114385, 0.5882353, 1, 0, 1,
-0.7122843, 0.6589715, -1.236209, 0.5843138, 1, 0, 1,
-0.7120427, -0.1526129, -0.8717228, 0.5764706, 1, 0, 1,
-0.7118834, 1.927383, 0.220307, 0.572549, 1, 0, 1,
-0.7081386, 0.6358916, -1.121238, 0.5647059, 1, 0, 1,
-0.7023264, 0.09679081, -1.478159, 0.5607843, 1, 0, 1,
-0.6979238, -0.1680382, -0.5416916, 0.5529412, 1, 0, 1,
-0.6889621, -0.8390634, -2.608892, 0.5490196, 1, 0, 1,
-0.6747975, -0.05380179, -0.1751907, 0.5411765, 1, 0, 1,
-0.66662, 0.2035102, 0.3333887, 0.5372549, 1, 0, 1,
-0.6647536, -1.231839, -0.5748804, 0.5294118, 1, 0, 1,
-0.663478, -1.247303, -3.964437, 0.5254902, 1, 0, 1,
-0.6539035, -0.6828654, -1.641165, 0.5176471, 1, 0, 1,
-0.6535513, 0.1818279, -3.023919, 0.5137255, 1, 0, 1,
-0.6534881, 1.402671, -2.474982, 0.5058824, 1, 0, 1,
-0.6507298, 0.2885564, -0.6967253, 0.5019608, 1, 0, 1,
-0.650416, -0.5337849, -1.322381, 0.4941176, 1, 0, 1,
-0.6479026, -0.02742502, -1.932966, 0.4862745, 1, 0, 1,
-0.6461542, 0.6123913, -0.7778681, 0.4823529, 1, 0, 1,
-0.6429976, -2.762291, -4.307444, 0.4745098, 1, 0, 1,
-0.633887, 1.576753, -0.3710679, 0.4705882, 1, 0, 1,
-0.6330174, 0.4715622, -2.050396, 0.4627451, 1, 0, 1,
-0.6329554, -1.474241, -1.6323, 0.4588235, 1, 0, 1,
-0.6326863, -0.6727746, -2.773978, 0.4509804, 1, 0, 1,
-0.6317608, 1.264293, -1.694484, 0.4470588, 1, 0, 1,
-0.6316634, 1.27576, 0.8255771, 0.4392157, 1, 0, 1,
-0.6264917, -0.03496689, -0.6485112, 0.4352941, 1, 0, 1,
-0.6257976, 0.4634772, -1.801742, 0.427451, 1, 0, 1,
-0.6246499, -1.29647, -2.47995, 0.4235294, 1, 0, 1,
-0.6161156, -0.3164954, -2.509826, 0.4156863, 1, 0, 1,
-0.6104479, -0.7843859, -2.357066, 0.4117647, 1, 0, 1,
-0.6062088, 0.1473699, -1.255162, 0.4039216, 1, 0, 1,
-0.6030399, -0.02813708, -2.049564, 0.3960784, 1, 0, 1,
-0.6014375, -1.11982, -1.801185, 0.3921569, 1, 0, 1,
-0.6000833, 1.037634, -0.9838653, 0.3843137, 1, 0, 1,
-0.5988863, 0.443249, -1.494206, 0.3803922, 1, 0, 1,
-0.595643, 1.663756, 0.4091952, 0.372549, 1, 0, 1,
-0.5939735, -0.5088044, -2.677623, 0.3686275, 1, 0, 1,
-0.5932121, -0.3686444, -1.6951, 0.3607843, 1, 0, 1,
-0.592639, 1.430278, -1.458625, 0.3568628, 1, 0, 1,
-0.588856, 0.7187094, 0.4363155, 0.3490196, 1, 0, 1,
-0.5883812, -0.7463844, -0.8287901, 0.345098, 1, 0, 1,
-0.5854768, -0.2347087, -1.677487, 0.3372549, 1, 0, 1,
-0.5709279, 0.4303998, -1.218783, 0.3333333, 1, 0, 1,
-0.5690843, -0.2282559, -3.939255, 0.3254902, 1, 0, 1,
-0.5679241, -0.1601709, -1.658159, 0.3215686, 1, 0, 1,
-0.5653699, 1.1265, -1.72367, 0.3137255, 1, 0, 1,
-0.5587493, 0.8711141, 0.712074, 0.3098039, 1, 0, 1,
-0.5567791, -1.033469, -2.159127, 0.3019608, 1, 0, 1,
-0.5540933, -0.2243192, -1.423417, 0.2941177, 1, 0, 1,
-0.5490479, 0.1184101, -3.691285, 0.2901961, 1, 0, 1,
-0.5386688, -0.7942196, -2.96637, 0.282353, 1, 0, 1,
-0.5381663, -0.3684406, -2.609656, 0.2784314, 1, 0, 1,
-0.537648, 2.144923, -1.78003, 0.2705882, 1, 0, 1,
-0.5235298, 1.321427, 0.103457, 0.2666667, 1, 0, 1,
-0.5202154, -1.699702, -2.000512, 0.2588235, 1, 0, 1,
-0.5145528, 0.3071473, -2.473058, 0.254902, 1, 0, 1,
-0.5095996, 1.220099, -1.813122, 0.2470588, 1, 0, 1,
-0.5081799, -0.7725222, -4.503106, 0.2431373, 1, 0, 1,
-0.5042561, 0.8559752, -1.208397, 0.2352941, 1, 0, 1,
-0.5031527, -0.7890684, -0.2542135, 0.2313726, 1, 0, 1,
-0.5010129, 1.033415, -0.4132597, 0.2235294, 1, 0, 1,
-0.5005869, 0.408234, 0.5661901, 0.2196078, 1, 0, 1,
-0.4990437, 1.689904, -1.557423, 0.2117647, 1, 0, 1,
-0.4939191, -0.50036, -2.86215, 0.2078431, 1, 0, 1,
-0.4905504, 1.337516, -0.04977739, 0.2, 1, 0, 1,
-0.4843779, 0.6371172, 0.7447143, 0.1921569, 1, 0, 1,
-0.4802175, -0.02542896, -1.570985, 0.1882353, 1, 0, 1,
-0.4798115, 0.4791462, -1.340528, 0.1803922, 1, 0, 1,
-0.4792098, -0.775555, -1.376691, 0.1764706, 1, 0, 1,
-0.4748406, 1.607279, 0.754835, 0.1686275, 1, 0, 1,
-0.4696005, 0.6357345, -1.391415, 0.1647059, 1, 0, 1,
-0.4675177, -0.6337105, -1.795823, 0.1568628, 1, 0, 1,
-0.4671715, -0.426367, -2.620595, 0.1529412, 1, 0, 1,
-0.4669079, -0.5350792, -4.619974, 0.145098, 1, 0, 1,
-0.4637969, -0.3993934, -3.134437, 0.1411765, 1, 0, 1,
-0.4620842, 0.3719104, -1.31309, 0.1333333, 1, 0, 1,
-0.4618961, -1.692461, -2.620864, 0.1294118, 1, 0, 1,
-0.4568979, -1.712884, -2.672845, 0.1215686, 1, 0, 1,
-0.4555252, 1.208182, 1.891742, 0.1176471, 1, 0, 1,
-0.4530585, -0.579694, -1.893139, 0.1098039, 1, 0, 1,
-0.4489656, -1.000522, -2.751461, 0.1058824, 1, 0, 1,
-0.4488639, 1.415178, -0.6382229, 0.09803922, 1, 0, 1,
-0.4393884, -0.4363002, -1.964712, 0.09019608, 1, 0, 1,
-0.4393213, 0.07246611, -0.841566, 0.08627451, 1, 0, 1,
-0.4352113, -0.03153165, -1.496977, 0.07843138, 1, 0, 1,
-0.4343834, -0.0412325, -0.9650044, 0.07450981, 1, 0, 1,
-0.4339616, 0.3731731, 0.5635668, 0.06666667, 1, 0, 1,
-0.433399, -0.8045725, -3.437228, 0.0627451, 1, 0, 1,
-0.4295866, -1.105062, -1.730081, 0.05490196, 1, 0, 1,
-0.4288643, 1.124361, -1.186484, 0.05098039, 1, 0, 1,
-0.4280764, -1.137491, -3.376358, 0.04313726, 1, 0, 1,
-0.4253055, 0.6521038, -1.780518, 0.03921569, 1, 0, 1,
-0.419277, -0.2739596, 0.02580206, 0.03137255, 1, 0, 1,
-0.4184545, -1.445661, -3.684837, 0.02745098, 1, 0, 1,
-0.4170054, 1.559587, -0.5408413, 0.01960784, 1, 0, 1,
-0.4123424, -0.1686492, -2.096447, 0.01568628, 1, 0, 1,
-0.4109822, 0.7545961, -1.578253, 0.007843138, 1, 0, 1,
-0.4099869, 0.9953911, -1.14418, 0.003921569, 1, 0, 1,
-0.4092616, -1.220524, -3.235777, 0, 1, 0.003921569, 1,
-0.4060743, -0.5831319, -1.70982, 0, 1, 0.01176471, 1,
-0.4052787, 1.07809, -1.658067, 0, 1, 0.01568628, 1,
-0.4051834, 0.7558619, -1.372527, 0, 1, 0.02352941, 1,
-0.4021968, -1.085426, -3.824493, 0, 1, 0.02745098, 1,
-0.3971646, 0.159039, -2.685207, 0, 1, 0.03529412, 1,
-0.3963706, 0.4130326, -1.372046, 0, 1, 0.03921569, 1,
-0.395383, -1.649874, -1.648478, 0, 1, 0.04705882, 1,
-0.3946784, 1.271533, -0.7119105, 0, 1, 0.05098039, 1,
-0.3923019, 0.8144382, 0.708334, 0, 1, 0.05882353, 1,
-0.3886477, -0.4254917, -2.991009, 0, 1, 0.0627451, 1,
-0.3861016, 0.6207547, -0.443232, 0, 1, 0.07058824, 1,
-0.3837441, 1.617813, -1.074007, 0, 1, 0.07450981, 1,
-0.3805633, 0.4180948, -0.1094162, 0, 1, 0.08235294, 1,
-0.3792913, -1.495679, -2.544791, 0, 1, 0.08627451, 1,
-0.378642, 1.466435, 0.4122894, 0, 1, 0.09411765, 1,
-0.3733399, 0.1035096, -0.09910025, 0, 1, 0.1019608, 1,
-0.3722827, -0.1072349, -3.765402, 0, 1, 0.1058824, 1,
-0.3710578, -1.14907, -3.805887, 0, 1, 0.1137255, 1,
-0.3699174, 0.8248433, 1.058826, 0, 1, 0.1176471, 1,
-0.3660984, 0.2915807, -1.781956, 0, 1, 0.1254902, 1,
-0.3589315, 0.2418811, -0.427844, 0, 1, 0.1294118, 1,
-0.3540106, -0.645759, -3.934906, 0, 1, 0.1372549, 1,
-0.3538366, -1.400388, -4.243604, 0, 1, 0.1411765, 1,
-0.3505387, -0.2491811, -2.211402, 0, 1, 0.1490196, 1,
-0.3490671, 1.290049, -0.7061327, 0, 1, 0.1529412, 1,
-0.3472412, -0.1471519, -3.860255, 0, 1, 0.1607843, 1,
-0.3470626, -0.3518439, -2.425225, 0, 1, 0.1647059, 1,
-0.3452604, 1.185265, -2.33891, 0, 1, 0.172549, 1,
-0.3389939, -0.6309312, -2.006652, 0, 1, 0.1764706, 1,
-0.3325699, -0.9386576, -3.420676, 0, 1, 0.1843137, 1,
-0.3303861, 0.8271787, -1.282381, 0, 1, 0.1882353, 1,
-0.3296105, -1.296122, -3.072011, 0, 1, 0.1960784, 1,
-0.3281193, 0.2999019, -1.755013, 0, 1, 0.2039216, 1,
-0.3275551, -0.289272, -3.376758, 0, 1, 0.2078431, 1,
-0.3271209, -0.06434756, -0.3283042, 0, 1, 0.2156863, 1,
-0.3239765, 2.816367, -1.754046, 0, 1, 0.2196078, 1,
-0.3203698, 0.04564012, -1.547835, 0, 1, 0.227451, 1,
-0.3118138, -1.988661, -1.50717, 0, 1, 0.2313726, 1,
-0.3068748, 1.742672, 1.034042, 0, 1, 0.2392157, 1,
-0.3059083, 1.085031, -1.411437, 0, 1, 0.2431373, 1,
-0.3058727, 1.396244, -1.343899, 0, 1, 0.2509804, 1,
-0.3005002, 0.5576327, -2.309424, 0, 1, 0.254902, 1,
-0.2992835, -0.7385521, -1.342009, 0, 1, 0.2627451, 1,
-0.2962056, 0.7699764, -0.5831142, 0, 1, 0.2666667, 1,
-0.2950123, -1.844666, -3.18788, 0, 1, 0.2745098, 1,
-0.2949216, -1.275556, -3.572244, 0, 1, 0.2784314, 1,
-0.2915254, -0.9460249, -3.191843, 0, 1, 0.2862745, 1,
-0.2890145, -0.2380302, -2.739758, 0, 1, 0.2901961, 1,
-0.2879913, 0.1972328, -0.5664726, 0, 1, 0.2980392, 1,
-0.2867617, 0.4233514, 0.2912723, 0, 1, 0.3058824, 1,
-0.2865856, 0.980391, 1.823767, 0, 1, 0.3098039, 1,
-0.2823644, -0.5387487, -2.784284, 0, 1, 0.3176471, 1,
-0.2784553, -0.2329064, -1.560347, 0, 1, 0.3215686, 1,
-0.2783553, -0.71579, -5.672441, 0, 1, 0.3294118, 1,
-0.2777713, 0.02234362, -2.017991, 0, 1, 0.3333333, 1,
-0.2752094, 1.466682, 0.537904, 0, 1, 0.3411765, 1,
-0.2731455, 0.4210112, 0.7244855, 0, 1, 0.345098, 1,
-0.2722306, -1.747638, -3.658321, 0, 1, 0.3529412, 1,
-0.2683506, -0.1121746, -2.596901, 0, 1, 0.3568628, 1,
-0.2665932, 0.2235639, -3.150725, 0, 1, 0.3647059, 1,
-0.2583243, -1.097678, -3.303529, 0, 1, 0.3686275, 1,
-0.2519514, 1.541565, -0.6614881, 0, 1, 0.3764706, 1,
-0.2475076, -0.156084, -3.7097, 0, 1, 0.3803922, 1,
-0.2473812, -1.514598, -2.564409, 0, 1, 0.3882353, 1,
-0.2466863, 0.8024733, -1.207658, 0, 1, 0.3921569, 1,
-0.2411, -1.757603, -1.931335, 0, 1, 0.4, 1,
-0.2402356, 0.3161128, 0.2834894, 0, 1, 0.4078431, 1,
-0.2395728, 0.2021669, -1.533038, 0, 1, 0.4117647, 1,
-0.2341985, 0.5985154, 0.5796634, 0, 1, 0.4196078, 1,
-0.2310239, 0.1782037, -1.273787, 0, 1, 0.4235294, 1,
-0.2308802, 1.095896, -0.2245143, 0, 1, 0.4313726, 1,
-0.2271902, 1.017594, -0.6377377, 0, 1, 0.4352941, 1,
-0.2249909, 0.2080673, -0.554329, 0, 1, 0.4431373, 1,
-0.2233582, 0.5082798, -0.3990722, 0, 1, 0.4470588, 1,
-0.221755, -0.9120148, -1.975413, 0, 1, 0.454902, 1,
-0.2215399, 0.4975509, -0.02274344, 0, 1, 0.4588235, 1,
-0.2184065, 0.5243888, -1.611089, 0, 1, 0.4666667, 1,
-0.2114243, -0.6698128, -3.680818, 0, 1, 0.4705882, 1,
-0.2094049, -0.03398118, -3.232864, 0, 1, 0.4784314, 1,
-0.208844, 0.1774737, -0.7679464, 0, 1, 0.4823529, 1,
-0.2044545, -1.223572, -2.225857, 0, 1, 0.4901961, 1,
-0.2013751, -0.7047803, -3.853652, 0, 1, 0.4941176, 1,
-0.1985086, 2.120505, -2.258868, 0, 1, 0.5019608, 1,
-0.1968523, 0.316193, -1.375921, 0, 1, 0.509804, 1,
-0.1959824, 0.2415071, 1.33435, 0, 1, 0.5137255, 1,
-0.1958334, -1.491535, -2.155889, 0, 1, 0.5215687, 1,
-0.1937712, 0.2939979, -0.2837016, 0, 1, 0.5254902, 1,
-0.1854597, 0.7768478, -2.705526, 0, 1, 0.5333334, 1,
-0.1827813, -0.007638359, -1.239461, 0, 1, 0.5372549, 1,
-0.1813681, 0.1067128, -3.080456, 0, 1, 0.5450981, 1,
-0.1790479, -0.2461859, -1.991287, 0, 1, 0.5490196, 1,
-0.178904, 1.164671, -0.4988002, 0, 1, 0.5568628, 1,
-0.1788194, -0.9261865, -3.318791, 0, 1, 0.5607843, 1,
-0.1784171, 0.341071, -1.549982, 0, 1, 0.5686275, 1,
-0.1770165, 1.15696, 1.381053, 0, 1, 0.572549, 1,
-0.1737237, 1.360546, 1.613324, 0, 1, 0.5803922, 1,
-0.1716828, 0.9683256, -0.3460053, 0, 1, 0.5843138, 1,
-0.165123, -0.7838709, -2.97774, 0, 1, 0.5921569, 1,
-0.1644186, 0.07624394, 0.577074, 0, 1, 0.5960785, 1,
-0.1604155, 2.179543, -0.8710983, 0, 1, 0.6039216, 1,
-0.1574343, -0.2574832, -2.990745, 0, 1, 0.6117647, 1,
-0.1557435, 0.7934278, -0.01402056, 0, 1, 0.6156863, 1,
-0.1516984, 2.647209, 1.227062, 0, 1, 0.6235294, 1,
-0.1484969, -1.1512, -5.122027, 0, 1, 0.627451, 1,
-0.1457005, 1.056021, 0.3786092, 0, 1, 0.6352941, 1,
-0.1417107, 1.805995, 0.9494701, 0, 1, 0.6392157, 1,
-0.1408486, 0.7764058, -0.5121954, 0, 1, 0.6470588, 1,
-0.1391473, -0.5092204, -3.083886, 0, 1, 0.6509804, 1,
-0.1289994, 1.736453, 0.6583558, 0, 1, 0.6588235, 1,
-0.1255611, 0.02256373, -1.483107, 0, 1, 0.6627451, 1,
-0.1246536, 0.5032629, -1.200081, 0, 1, 0.6705883, 1,
-0.1243068, 0.1828263, -1.061622, 0, 1, 0.6745098, 1,
-0.1239448, -1.09639, -2.899691, 0, 1, 0.682353, 1,
-0.1216456, 0.6030526, 0.6138975, 0, 1, 0.6862745, 1,
-0.1180807, -1.664834, -4.422527, 0, 1, 0.6941177, 1,
-0.1125144, -0.2597162, -3.160807, 0, 1, 0.7019608, 1,
-0.1115881, 0.923752, -0.8713612, 0, 1, 0.7058824, 1,
-0.1099016, 1.41804, 0.5637801, 0, 1, 0.7137255, 1,
-0.108885, -0.5754223, -4.274254, 0, 1, 0.7176471, 1,
-0.1076743, 0.3659868, 0.4242872, 0, 1, 0.7254902, 1,
-0.107595, -0.587564, -2.43262, 0, 1, 0.7294118, 1,
-0.1052208, -1.411566, -2.285157, 0, 1, 0.7372549, 1,
-0.1041169, 1.788259, -0.6073443, 0, 1, 0.7411765, 1,
-0.09384536, -2.398247, -3.475689, 0, 1, 0.7490196, 1,
-0.09355009, 1.707506, -0.001293781, 0, 1, 0.7529412, 1,
-0.09015445, 0.4288569, -0.3076901, 0, 1, 0.7607843, 1,
-0.08950698, -0.3875163, -3.454256, 0, 1, 0.7647059, 1,
-0.08266348, 0.08829976, -0.860965, 0, 1, 0.772549, 1,
-0.0797948, 0.2627731, -0.2120268, 0, 1, 0.7764706, 1,
-0.07792334, 0.2823704, -0.2876993, 0, 1, 0.7843137, 1,
-0.0761489, 0.7510778, -0.1386877, 0, 1, 0.7882353, 1,
-0.07278214, 0.4111212, 0.01097686, 0, 1, 0.7960784, 1,
-0.06849806, -0.246421, -2.275905, 0, 1, 0.8039216, 1,
-0.06121808, -1.307383, -3.022007, 0, 1, 0.8078431, 1,
-0.05940107, -0.2978685, -3.697921, 0, 1, 0.8156863, 1,
-0.04732645, 0.261163, -0.06099474, 0, 1, 0.8196079, 1,
-0.04704481, -0.7369321, -1.373057, 0, 1, 0.827451, 1,
-0.04565378, -0.259149, -3.175458, 0, 1, 0.8313726, 1,
-0.04457885, 0.1302904, -2.307177, 0, 1, 0.8392157, 1,
-0.03926421, 2.356309, -1.258204, 0, 1, 0.8431373, 1,
-0.03804566, 1.705125, -1.631045, 0, 1, 0.8509804, 1,
-0.03266064, 2.073686, 0.09838013, 0, 1, 0.854902, 1,
-0.03187567, -1.015739, -4.197173, 0, 1, 0.8627451, 1,
-0.02795621, 0.9897327, 0.3607986, 0, 1, 0.8666667, 1,
-0.02516992, -0.8985643, -3.186287, 0, 1, 0.8745098, 1,
-0.02387519, -1.543052, -4.144919, 0, 1, 0.8784314, 1,
-0.01969724, -0.4146958, -3.102148, 0, 1, 0.8862745, 1,
-0.01808799, 1.220074, -0.6821927, 0, 1, 0.8901961, 1,
-0.01594311, -1.51509, -2.531377, 0, 1, 0.8980392, 1,
-0.01231641, 1.343021, 0.5709462, 0, 1, 0.9058824, 1,
-0.01148752, 1.334864, -0.2250308, 0, 1, 0.9098039, 1,
-0.0069109, -0.2326736, -4.276725, 0, 1, 0.9176471, 1,
-0.006908699, 0.8827622, 0.7627124, 0, 1, 0.9215686, 1,
-0.004689008, 1.350845, 0.5317775, 0, 1, 0.9294118, 1,
-0.001832773, -1.227877, -3.196443, 0, 1, 0.9333333, 1,
-0.001509286, 0.3441274, -0.3302781, 0, 1, 0.9411765, 1,
0.001052424, -0.2568741, 2.172092, 0, 1, 0.945098, 1,
0.001482938, -2.39067, 3.23324, 0, 1, 0.9529412, 1,
0.004575218, 0.1107163, 1.37367, 0, 1, 0.9568627, 1,
0.005942706, -0.9478875, 3.21504, 0, 1, 0.9647059, 1,
0.008869422, -1.070033, 2.598078, 0, 1, 0.9686275, 1,
0.0109227, 1.269447, -0.08297105, 0, 1, 0.9764706, 1,
0.0112807, 2.034234, 0.3161985, 0, 1, 0.9803922, 1,
0.01541162, -0.8087304, 2.108466, 0, 1, 0.9882353, 1,
0.02034234, -0.3829677, 2.665927, 0, 1, 0.9921569, 1,
0.02600164, 0.1755198, 1.268894, 0, 1, 1, 1,
0.02687783, 1.136306, 1.276643, 0, 0.9921569, 1, 1,
0.03393663, -1.456633, 2.344379, 0, 0.9882353, 1, 1,
0.03478343, 0.03172648, 1.891906, 0, 0.9803922, 1, 1,
0.03797562, -1.244883, 2.876008, 0, 0.9764706, 1, 1,
0.04392643, 0.8192157, 0.2044203, 0, 0.9686275, 1, 1,
0.04530168, -1.503391, 0.9126269, 0, 0.9647059, 1, 1,
0.04822052, -1.80838, 3.407917, 0, 0.9568627, 1, 1,
0.04845123, -0.9922936, 2.587187, 0, 0.9529412, 1, 1,
0.04919223, -0.3081039, 2.687308, 0, 0.945098, 1, 1,
0.05039454, -2.01802, 3.907858, 0, 0.9411765, 1, 1,
0.05212539, -1.301253, 2.83555, 0, 0.9333333, 1, 1,
0.05855004, -0.1770974, 2.645629, 0, 0.9294118, 1, 1,
0.0587904, -0.3558763, 3.662179, 0, 0.9215686, 1, 1,
0.05922897, 0.9085583, 1.116254, 0, 0.9176471, 1, 1,
0.06325569, -0.8583016, 3.449894, 0, 0.9098039, 1, 1,
0.06481667, -0.6769978, 2.842642, 0, 0.9058824, 1, 1,
0.06671795, -0.1529975, 1.066021, 0, 0.8980392, 1, 1,
0.07045873, 1.531333, 0.6821285, 0, 0.8901961, 1, 1,
0.07414333, 0.4718998, 2.256896, 0, 0.8862745, 1, 1,
0.07719693, -0.5528558, 3.564007, 0, 0.8784314, 1, 1,
0.07931863, 0.6289732, 0.9986315, 0, 0.8745098, 1, 1,
0.07945398, 0.2721606, -1.89753, 0, 0.8666667, 1, 1,
0.07968219, -0.08681021, 1.707451, 0, 0.8627451, 1, 1,
0.08005909, -0.1501743, 3.564615, 0, 0.854902, 1, 1,
0.08153695, -0.0164736, 0.2939272, 0, 0.8509804, 1, 1,
0.08437591, 0.2533796, -0.3079558, 0, 0.8431373, 1, 1,
0.08699107, 0.3627537, 1.851036, 0, 0.8392157, 1, 1,
0.08834532, -0.2464515, 2.679798, 0, 0.8313726, 1, 1,
0.09309807, -0.8137341, 1.84055, 0, 0.827451, 1, 1,
0.09416153, 1.538723, 0.5251603, 0, 0.8196079, 1, 1,
0.09437844, -1.270336, 3.104949, 0, 0.8156863, 1, 1,
0.09500746, 0.3631836, -0.5093896, 0, 0.8078431, 1, 1,
0.09749818, -1.151663, 2.870981, 0, 0.8039216, 1, 1,
0.09899546, -0.1745623, 2.446395, 0, 0.7960784, 1, 1,
0.1026465, 0.9903006, -1.912548, 0, 0.7882353, 1, 1,
0.1035075, -0.009699361, 1.536642, 0, 0.7843137, 1, 1,
0.1070566, -1.015823, 3.330703, 0, 0.7764706, 1, 1,
0.1080089, 0.2302135, 2.276146, 0, 0.772549, 1, 1,
0.1080246, 0.9194114, 0.7419708, 0, 0.7647059, 1, 1,
0.1097129, -0.7545137, 1.287904, 0, 0.7607843, 1, 1,
0.1146278, 0.5068169, 0.7703515, 0, 0.7529412, 1, 1,
0.1181851, -0.6125445, 1.086572, 0, 0.7490196, 1, 1,
0.1195723, -0.5411544, 0.009190796, 0, 0.7411765, 1, 1,
0.1198158, -0.7923515, 2.93373, 0, 0.7372549, 1, 1,
0.1214453, -2.010679, 2.578754, 0, 0.7294118, 1, 1,
0.1253498, -2.091199, 3.049526, 0, 0.7254902, 1, 1,
0.1270739, -0.3718799, 2.958927, 0, 0.7176471, 1, 1,
0.1272114, 1.304085, -2.100867, 0, 0.7137255, 1, 1,
0.1276778, -0.8839822, 3.684719, 0, 0.7058824, 1, 1,
0.1280634, -0.6507332, 4.812503, 0, 0.6980392, 1, 1,
0.1289893, 0.8850273, 2.246295, 0, 0.6941177, 1, 1,
0.1290088, -0.09054783, 3.60146, 0, 0.6862745, 1, 1,
0.1388842, 0.902992, 0.4725685, 0, 0.682353, 1, 1,
0.1420423, 0.6105533, 0.8628756, 0, 0.6745098, 1, 1,
0.1445846, 1.728541, -0.5137562, 0, 0.6705883, 1, 1,
0.1446388, -0.2553485, 1.590066, 0, 0.6627451, 1, 1,
0.1543257, 0.4741033, 0.2434147, 0, 0.6588235, 1, 1,
0.1548198, -1.788463, 4.402848, 0, 0.6509804, 1, 1,
0.1576376, 0.5107315, -0.4342811, 0, 0.6470588, 1, 1,
0.1631861, 0.5264016, -1.885082, 0, 0.6392157, 1, 1,
0.1674714, -0.5112606, 1.693215, 0, 0.6352941, 1, 1,
0.1689045, 1.628752, -1.089393, 0, 0.627451, 1, 1,
0.1697031, -2.483846, 2.231339, 0, 0.6235294, 1, 1,
0.1735073, 1.422372, -0.1428527, 0, 0.6156863, 1, 1,
0.1736667, -1.025289, 2.66211, 0, 0.6117647, 1, 1,
0.1750714, 0.9863446, -2.447991, 0, 0.6039216, 1, 1,
0.1763571, 0.6791481, 0.3752949, 0, 0.5960785, 1, 1,
0.1775556, 0.03902798, 0.8599425, 0, 0.5921569, 1, 1,
0.1776625, -1.865254, 3.941837, 0, 0.5843138, 1, 1,
0.1813443, 0.1983939, 1.452808, 0, 0.5803922, 1, 1,
0.186845, -0.1749789, 2.056678, 0, 0.572549, 1, 1,
0.1877473, 1.278591, 0.5593373, 0, 0.5686275, 1, 1,
0.1913792, 1.398169, -0.756843, 0, 0.5607843, 1, 1,
0.1914243, 0.08958761, 2.827268, 0, 0.5568628, 1, 1,
0.192651, 0.5991749, 0.2405593, 0, 0.5490196, 1, 1,
0.1946444, -0.4504405, 4.056984, 0, 0.5450981, 1, 1,
0.1993777, -0.4853253, 2.548276, 0, 0.5372549, 1, 1,
0.2050449, -0.08689676, 3.336421, 0, 0.5333334, 1, 1,
0.2059137, 0.8159028, -0.09482799, 0, 0.5254902, 1, 1,
0.2067966, -1.551216, 3.615944, 0, 0.5215687, 1, 1,
0.2133884, -0.5109518, 2.942367, 0, 0.5137255, 1, 1,
0.214821, -0.5424024, 2.846026, 0, 0.509804, 1, 1,
0.2175613, -0.8037124, 2.475557, 0, 0.5019608, 1, 1,
0.2191863, 0.2896755, -0.04238245, 0, 0.4941176, 1, 1,
0.2257208, 0.5959185, 0.4238496, 0, 0.4901961, 1, 1,
0.2275913, 0.3825414, -0.6697736, 0, 0.4823529, 1, 1,
0.2283951, -2.794803, 2.898077, 0, 0.4784314, 1, 1,
0.2332034, -2.073775, 2.053864, 0, 0.4705882, 1, 1,
0.2350007, 0.5431684, 1.073626, 0, 0.4666667, 1, 1,
0.2350946, 0.8858188, -0.1467521, 0, 0.4588235, 1, 1,
0.2368843, 0.8231537, -0.1732166, 0, 0.454902, 1, 1,
0.2370803, -0.4406226, 3.581373, 0, 0.4470588, 1, 1,
0.2375849, -1.120941, 2.261758, 0, 0.4431373, 1, 1,
0.2407854, 1.444862, 0.2257588, 0, 0.4352941, 1, 1,
0.2470624, -0.3101754, 1.746336, 0, 0.4313726, 1, 1,
0.2471081, -0.9271462, 4.226069, 0, 0.4235294, 1, 1,
0.2505521, 1.355061, 0.5006961, 0, 0.4196078, 1, 1,
0.2530124, -0.2345153, 3.057618, 0, 0.4117647, 1, 1,
0.2543017, -1.779734, 2.188494, 0, 0.4078431, 1, 1,
0.2574903, -0.1213248, 1.114109, 0, 0.4, 1, 1,
0.2589288, -0.6154203, 1.704336, 0, 0.3921569, 1, 1,
0.2644019, 0.3055016, 0.03448014, 0, 0.3882353, 1, 1,
0.2679571, -0.1031545, 2.835597, 0, 0.3803922, 1, 1,
0.2710118, -1.072825, 2.575365, 0, 0.3764706, 1, 1,
0.2739606, -0.3391332, 2.211965, 0, 0.3686275, 1, 1,
0.2771384, -0.6769852, 1.402828, 0, 0.3647059, 1, 1,
0.279245, -0.7535246, 3.200204, 0, 0.3568628, 1, 1,
0.295423, 0.6791894, 2.071201, 0, 0.3529412, 1, 1,
0.299505, 0.6511927, -0.9751441, 0, 0.345098, 1, 1,
0.2996983, -0.2473985, 2.497016, 0, 0.3411765, 1, 1,
0.3028277, 0.4578955, 1.610734, 0, 0.3333333, 1, 1,
0.3080025, -1.259134, 3.04707, 0, 0.3294118, 1, 1,
0.3085392, 0.2735794, 0.7380161, 0, 0.3215686, 1, 1,
0.308592, -1.033217, 4.701756, 0, 0.3176471, 1, 1,
0.3136103, -0.727922, 2.41421, 0, 0.3098039, 1, 1,
0.3149699, 1.510363, 0.04869571, 0, 0.3058824, 1, 1,
0.3155219, -0.4462924, 1.697734, 0, 0.2980392, 1, 1,
0.317516, 0.4361836, 0.4950471, 0, 0.2901961, 1, 1,
0.3178362, -0.2618064, 3.344135, 0, 0.2862745, 1, 1,
0.3186717, 0.9663086, 1.293076, 0, 0.2784314, 1, 1,
0.3239012, -0.6953368, 2.809479, 0, 0.2745098, 1, 1,
0.3260024, -1.76054, 3.546951, 0, 0.2666667, 1, 1,
0.3263909, -0.8517092, 2.689783, 0, 0.2627451, 1, 1,
0.3292307, -0.5646985, 2.207087, 0, 0.254902, 1, 1,
0.3345046, 1.410856, 1.640577, 0, 0.2509804, 1, 1,
0.3387849, -0.04131306, 0.1197233, 0, 0.2431373, 1, 1,
0.3396389, 0.7366741, 0.8708426, 0, 0.2392157, 1, 1,
0.3404305, -0.5639595, 2.676785, 0, 0.2313726, 1, 1,
0.3404658, -0.7754658, 2.474527, 0, 0.227451, 1, 1,
0.341819, -0.5629756, 2.753076, 0, 0.2196078, 1, 1,
0.3484541, -0.3903675, 0.6355814, 0, 0.2156863, 1, 1,
0.348471, -0.2601039, 1.785883, 0, 0.2078431, 1, 1,
0.3500705, 0.1802389, 1.478577, 0, 0.2039216, 1, 1,
0.350346, -0.08098599, 2.542662, 0, 0.1960784, 1, 1,
0.3516532, -0.8048493, 3.292729, 0, 0.1882353, 1, 1,
0.3585896, 0.7213979, -0.02830077, 0, 0.1843137, 1, 1,
0.3605501, -0.3426069, 1.355097, 0, 0.1764706, 1, 1,
0.361311, -0.1964415, 0.8526786, 0, 0.172549, 1, 1,
0.364401, 0.5280468, 1.003302, 0, 0.1647059, 1, 1,
0.3685708, 0.7225885, -1.763729, 0, 0.1607843, 1, 1,
0.3706103, 0.4676415, -0.02366851, 0, 0.1529412, 1, 1,
0.3730706, -1.089378, 2.696696, 0, 0.1490196, 1, 1,
0.3799078, -0.529196, 4.2457, 0, 0.1411765, 1, 1,
0.380485, 0.3683036, -0.5233452, 0, 0.1372549, 1, 1,
0.3841107, -0.2875001, 2.011411, 0, 0.1294118, 1, 1,
0.3854474, -0.01996771, 3.398718, 0, 0.1254902, 1, 1,
0.390704, 1.820907, 0.4084249, 0, 0.1176471, 1, 1,
0.3960997, 0.02917068, 0.2205126, 0, 0.1137255, 1, 1,
0.3962453, -0.5949874, 2.625897, 0, 0.1058824, 1, 1,
0.3967985, 1.074996, -0.4682117, 0, 0.09803922, 1, 1,
0.3994705, 2.138835, 2.787428, 0, 0.09411765, 1, 1,
0.4046353, -0.1222796, 1.543734, 0, 0.08627451, 1, 1,
0.4076551, 0.5442422, 1.539405, 0, 0.08235294, 1, 1,
0.4079158, 1.227335, 0.4184038, 0, 0.07450981, 1, 1,
0.4115222, 0.1310096, 0.6529973, 0, 0.07058824, 1, 1,
0.4193233, -0.4976457, 2.933659, 0, 0.0627451, 1, 1,
0.4218571, -0.0853261, 0.5732384, 0, 0.05882353, 1, 1,
0.4364299, 0.7786937, -0.1107169, 0, 0.05098039, 1, 1,
0.4416623, -0.3176777, 1.804416, 0, 0.04705882, 1, 1,
0.4446539, 1.804491, 1.911853, 0, 0.03921569, 1, 1,
0.4448669, 0.7419755, 2.766024, 0, 0.03529412, 1, 1,
0.4461777, 0.2454911, 0.2865197, 0, 0.02745098, 1, 1,
0.4536597, 0.7199011, 0.1043649, 0, 0.02352941, 1, 1,
0.4544159, 0.6433342, 0.7636033, 0, 0.01568628, 1, 1,
0.4562077, -0.7022792, 1.908965, 0, 0.01176471, 1, 1,
0.457425, 0.3404337, 0.7002313, 0, 0.003921569, 1, 1,
0.4590903, -0.9968745, 4.335919, 0.003921569, 0, 1, 1,
0.460962, -0.08268875, 2.400137, 0.007843138, 0, 1, 1,
0.4641021, 1.077757, 1.173367, 0.01568628, 0, 1, 1,
0.4642667, 2.637483, 0.6802918, 0.01960784, 0, 1, 1,
0.4654133, -0.4136213, 2.392529, 0.02745098, 0, 1, 1,
0.4660357, -0.6059011, 4.30722, 0.03137255, 0, 1, 1,
0.4706303, 0.4070874, -0.02723264, 0.03921569, 0, 1, 1,
0.4716687, -0.9036949, 3.353936, 0.04313726, 0, 1, 1,
0.4731773, 0.4776011, 2.325548, 0.05098039, 0, 1, 1,
0.4736429, -2.001188, 3.288565, 0.05490196, 0, 1, 1,
0.4738106, -0.2194401, 1.057589, 0.0627451, 0, 1, 1,
0.4749435, -0.7462551, 0.7550572, 0.06666667, 0, 1, 1,
0.4776245, 1.180655, 0.9197673, 0.07450981, 0, 1, 1,
0.4824423, 0.6222526, 0.6008329, 0.07843138, 0, 1, 1,
0.4825253, -0.1675955, 0.1048191, 0.08627451, 0, 1, 1,
0.4862461, -0.151826, 0.3890497, 0.09019608, 0, 1, 1,
0.4908925, -0.4099405, 1.620412, 0.09803922, 0, 1, 1,
0.4929785, 0.8407747, -0.4180731, 0.1058824, 0, 1, 1,
0.4943877, 0.767134, -0.05561714, 0.1098039, 0, 1, 1,
0.5003392, -1.068913, 2.781427, 0.1176471, 0, 1, 1,
0.502856, -0.3008794, 3.818213, 0.1215686, 0, 1, 1,
0.5088495, 1.020926, -0.4956841, 0.1294118, 0, 1, 1,
0.5135159, -0.085921, -0.9567568, 0.1333333, 0, 1, 1,
0.5170434, 1.286499, 1.474654, 0.1411765, 0, 1, 1,
0.518586, -0.6098282, 1.971786, 0.145098, 0, 1, 1,
0.5191969, -0.03163146, -0.5661203, 0.1529412, 0, 1, 1,
0.5213946, 1.792567, 1.469583, 0.1568628, 0, 1, 1,
0.5233032, -1.972953, 2.568893, 0.1647059, 0, 1, 1,
0.5276787, 0.8833178, 0.7087639, 0.1686275, 0, 1, 1,
0.5316394, 0.4385688, 2.38998, 0.1764706, 0, 1, 1,
0.5344127, 0.5124651, -0.03527898, 0.1803922, 0, 1, 1,
0.5366067, -0.8407986, 2.427244, 0.1882353, 0, 1, 1,
0.5375041, -1.146475, 3.384594, 0.1921569, 0, 1, 1,
0.5411952, -1.194084, 3.375815, 0.2, 0, 1, 1,
0.5415159, -2.445977, 5.252836, 0.2078431, 0, 1, 1,
0.5447678, -1.534851, 2.836275, 0.2117647, 0, 1, 1,
0.5461755, -1.211901, 3.08771, 0.2196078, 0, 1, 1,
0.5461792, -1.003289, 1.087265, 0.2235294, 0, 1, 1,
0.5465866, 0.6462721, -1.12076, 0.2313726, 0, 1, 1,
0.5470915, -0.6953605, 3.144173, 0.2352941, 0, 1, 1,
0.5513576, 0.8283002, 2.154128, 0.2431373, 0, 1, 1,
0.5525915, 0.04046068, -0.5281584, 0.2470588, 0, 1, 1,
0.5584833, 0.07758377, 0.817627, 0.254902, 0, 1, 1,
0.5596089, -0.8893694, 0.1729766, 0.2588235, 0, 1, 1,
0.5606345, 0.8181114, -1.144549, 0.2666667, 0, 1, 1,
0.5613697, -0.9432693, 1.860931, 0.2705882, 0, 1, 1,
0.5632253, -1.527327, 2.108176, 0.2784314, 0, 1, 1,
0.5641898, -0.4911304, 1.611381, 0.282353, 0, 1, 1,
0.5670871, -0.1425322, 2.499201, 0.2901961, 0, 1, 1,
0.5702931, 0.709588, 0.2997274, 0.2941177, 0, 1, 1,
0.5756469, -0.7566509, 2.926717, 0.3019608, 0, 1, 1,
0.5807087, -0.07865516, 1.868114, 0.3098039, 0, 1, 1,
0.5853078, 0.7769863, 0.366146, 0.3137255, 0, 1, 1,
0.5860581, -0.6967248, 2.27712, 0.3215686, 0, 1, 1,
0.5888475, 0.5253137, -1.721913, 0.3254902, 0, 1, 1,
0.5893726, -0.7880536, 0.9371503, 0.3333333, 0, 1, 1,
0.591705, 1.194158, 0.5334091, 0.3372549, 0, 1, 1,
0.5993345, 1.209156, 1.001355, 0.345098, 0, 1, 1,
0.6006897, -1.013322, 1.780344, 0.3490196, 0, 1, 1,
0.6011726, -0.9650615, 2.832196, 0.3568628, 0, 1, 1,
0.6086124, 0.8812875, -1.447224, 0.3607843, 0, 1, 1,
0.611045, 3.475302, -0.1374395, 0.3686275, 0, 1, 1,
0.6187765, -0.5503471, 2.829057, 0.372549, 0, 1, 1,
0.6196026, 0.8765855, 0.08726498, 0.3803922, 0, 1, 1,
0.6241329, 0.2739917, 0.5951582, 0.3843137, 0, 1, 1,
0.6267507, 0.02304103, 1.851988, 0.3921569, 0, 1, 1,
0.6320665, 0.1559208, 0.6664404, 0.3960784, 0, 1, 1,
0.636142, -0.7966402, 1.439662, 0.4039216, 0, 1, 1,
0.6365264, 0.26897, 1.652658, 0.4117647, 0, 1, 1,
0.6412695, -0.6486778, 2.172832, 0.4156863, 0, 1, 1,
0.646821, -1.651296, 3.227076, 0.4235294, 0, 1, 1,
0.6568828, 1.492446, 0.6823144, 0.427451, 0, 1, 1,
0.6597929, 0.726284, -0.1462265, 0.4352941, 0, 1, 1,
0.660783, 0.3861897, 1.12331, 0.4392157, 0, 1, 1,
0.6645252, -0.5696386, 1.055834, 0.4470588, 0, 1, 1,
0.6651269, -1.529275, 3.344912, 0.4509804, 0, 1, 1,
0.6675217, 0.5131493, 0.1531216, 0.4588235, 0, 1, 1,
0.6693625, 0.2317933, 0.8239104, 0.4627451, 0, 1, 1,
0.6737033, 0.5594603, 1.304365, 0.4705882, 0, 1, 1,
0.6763973, 1.400348, -0.3057535, 0.4745098, 0, 1, 1,
0.6765531, -1.283176, 0.2927631, 0.4823529, 0, 1, 1,
0.677462, 0.7100978, -0.3791589, 0.4862745, 0, 1, 1,
0.6799331, 1.536174, 0.1694474, 0.4941176, 0, 1, 1,
0.6810007, -0.8880273, 2.929686, 0.5019608, 0, 1, 1,
0.685683, 0.5029247, 1.660922, 0.5058824, 0, 1, 1,
0.6873733, 0.5634425, 1.232, 0.5137255, 0, 1, 1,
0.6883398, 1.458951, 1.777263, 0.5176471, 0, 1, 1,
0.6885626, -0.5481735, 3.090539, 0.5254902, 0, 1, 1,
0.6904951, -2.035506, 4.852245, 0.5294118, 0, 1, 1,
0.6979117, 0.194117, 0.6938057, 0.5372549, 0, 1, 1,
0.6989803, -1.287848, 2.567971, 0.5411765, 0, 1, 1,
0.7020845, -0.2767949, 1.800596, 0.5490196, 0, 1, 1,
0.7024981, 1.412552, 0.3631655, 0.5529412, 0, 1, 1,
0.7160261, -1.805903, 3.744249, 0.5607843, 0, 1, 1,
0.7167758, 1.588058, 1.678789, 0.5647059, 0, 1, 1,
0.7169895, 0.2516015, 0.7521718, 0.572549, 0, 1, 1,
0.7176172, -0.07142085, 2.823149, 0.5764706, 0, 1, 1,
0.7178357, 0.95453, 0.9761153, 0.5843138, 0, 1, 1,
0.7218077, -2.33483, 1.601719, 0.5882353, 0, 1, 1,
0.7219902, -0.2905793, 1.059562, 0.5960785, 0, 1, 1,
0.7220925, -1.102619, 2.944376, 0.6039216, 0, 1, 1,
0.7267684, -0.9933348, 2.210126, 0.6078432, 0, 1, 1,
0.7268455, 0.2494757, 1.037977, 0.6156863, 0, 1, 1,
0.7318584, 0.4988022, 0.1670592, 0.6196079, 0, 1, 1,
0.7328622, -0.9813687, 0.2825877, 0.627451, 0, 1, 1,
0.7371766, -0.9850188, 2.838728, 0.6313726, 0, 1, 1,
0.7408297, 0.828132, 0.01596244, 0.6392157, 0, 1, 1,
0.7424151, 0.04235746, 0.5073698, 0.6431373, 0, 1, 1,
0.7431531, -0.2264009, 1.888951, 0.6509804, 0, 1, 1,
0.747252, 1.32009, 0.4056084, 0.654902, 0, 1, 1,
0.7497844, -0.1977879, 3.254197, 0.6627451, 0, 1, 1,
0.7517106, 0.8371881, 0.3198611, 0.6666667, 0, 1, 1,
0.7527363, -0.8263423, 2.35239, 0.6745098, 0, 1, 1,
0.7527888, -0.1331787, 0.8574749, 0.6784314, 0, 1, 1,
0.7564036, -0.8071371, 3.174814, 0.6862745, 0, 1, 1,
0.7588932, 0.938239, 0.7625816, 0.6901961, 0, 1, 1,
0.760893, 0.6355751, 1.030796, 0.6980392, 0, 1, 1,
0.7643341, -1.116428, 1.704258, 0.7058824, 0, 1, 1,
0.7656859, 0.3774104, 1.231502, 0.7098039, 0, 1, 1,
0.7669813, -0.2169953, 2.187655, 0.7176471, 0, 1, 1,
0.7680746, 0.818407, 1.632874, 0.7215686, 0, 1, 1,
0.7727197, 0.2498368, 2.443005, 0.7294118, 0, 1, 1,
0.774869, -0.2076762, 1.110965, 0.7333333, 0, 1, 1,
0.7805983, 0.8045955, 0.1309848, 0.7411765, 0, 1, 1,
0.7824481, -2.109815, 3.678178, 0.7450981, 0, 1, 1,
0.7825434, -0.6059899, 3.860715, 0.7529412, 0, 1, 1,
0.7856075, -0.2581315, 0.151545, 0.7568628, 0, 1, 1,
0.7861022, -0.6238433, 2.076294, 0.7647059, 0, 1, 1,
0.7951961, -0.4346915, 1.493816, 0.7686275, 0, 1, 1,
0.7992449, -0.8216158, 1.458495, 0.7764706, 0, 1, 1,
0.799334, 1.817182, 0.8842831, 0.7803922, 0, 1, 1,
0.8000407, 0.2096746, 1.671335, 0.7882353, 0, 1, 1,
0.8006064, 0.4701701, 0.4944569, 0.7921569, 0, 1, 1,
0.8026027, -0.8160729, 3.106526, 0.8, 0, 1, 1,
0.8056536, -2.097106, 2.377835, 0.8078431, 0, 1, 1,
0.8066549, -0.701372, 2.413066, 0.8117647, 0, 1, 1,
0.8074754, 1.4467, 1.7451, 0.8196079, 0, 1, 1,
0.8183631, -0.1681197, 0.4936495, 0.8235294, 0, 1, 1,
0.8249772, 1.679919, 0.8601447, 0.8313726, 0, 1, 1,
0.8267475, -0.3778103, 1.176557, 0.8352941, 0, 1, 1,
0.8382753, -0.03240263, 1.044654, 0.8431373, 0, 1, 1,
0.8431424, 2.39589, 1.730534, 0.8470588, 0, 1, 1,
0.8448016, -0.9770064, 1.413036, 0.854902, 0, 1, 1,
0.8515775, -0.1776398, 0.4796851, 0.8588235, 0, 1, 1,
0.8523833, 0.9962985, 1.781282, 0.8666667, 0, 1, 1,
0.8529207, -0.967036, 2.369277, 0.8705882, 0, 1, 1,
0.8535966, 1.247028, 0.2919353, 0.8784314, 0, 1, 1,
0.8553515, 0.8782054, 0.3485407, 0.8823529, 0, 1, 1,
0.8571944, 1.930291, 2.024933, 0.8901961, 0, 1, 1,
0.8629705, 1.405631, 1.667081, 0.8941177, 0, 1, 1,
0.872377, 1.263472, 0.7620423, 0.9019608, 0, 1, 1,
0.8849677, 0.1358793, 2.884891, 0.9098039, 0, 1, 1,
0.8870307, 0.3191033, 0.4170056, 0.9137255, 0, 1, 1,
0.8901597, 0.279093, 0.1148544, 0.9215686, 0, 1, 1,
0.8928746, -0.1879226, 3.43254, 0.9254902, 0, 1, 1,
0.895364, 0.8500434, 1.219964, 0.9333333, 0, 1, 1,
0.896877, 0.3685736, -0.5736464, 0.9372549, 0, 1, 1,
0.8978685, 0.6891817, 0.1559651, 0.945098, 0, 1, 1,
0.9001092, -0.3286423, 2.898005, 0.9490196, 0, 1, 1,
0.9007391, 0.3171558, 1.754999, 0.9568627, 0, 1, 1,
0.901731, 1.545653, 0.5424056, 0.9607843, 0, 1, 1,
0.9066333, 0.5022963, 1.190883, 0.9686275, 0, 1, 1,
0.9101426, 2.058234, -0.1336649, 0.972549, 0, 1, 1,
0.9105083, 1.953739, 0.9060081, 0.9803922, 0, 1, 1,
0.9108142, 0.01813171, 0.09971795, 0.9843137, 0, 1, 1,
0.9121587, -0.00252947, 0.002279067, 0.9921569, 0, 1, 1,
0.9130095, 0.7712907, 1.590471, 0.9960784, 0, 1, 1,
0.9160268, -0.3127677, 2.336694, 1, 0, 0.9960784, 1,
0.9198883, -0.8366714, 0.884551, 1, 0, 0.9882353, 1,
0.9234627, 1.534981, 1.09077, 1, 0, 0.9843137, 1,
0.9256403, 0.5164191, 3.304613, 1, 0, 0.9764706, 1,
0.9279791, -0.1356616, 2.1365, 1, 0, 0.972549, 1,
0.9297659, 0.9663025, 0.5406689, 1, 0, 0.9647059, 1,
0.929769, -1.131008, 2.480511, 1, 0, 0.9607843, 1,
0.9374515, 0.3305583, 2.188615, 1, 0, 0.9529412, 1,
0.9436269, 0.8676199, 1.782422, 1, 0, 0.9490196, 1,
0.945053, -0.2919473, 2.773941, 1, 0, 0.9411765, 1,
0.9461243, 0.2915728, 0.1965209, 1, 0, 0.9372549, 1,
0.9526909, -0.6399541, 3.008502, 1, 0, 0.9294118, 1,
0.9581562, 0.4622106, 2.04566, 1, 0, 0.9254902, 1,
0.9583815, 0.9675586, 0.8124642, 1, 0, 0.9176471, 1,
0.9630808, 0.6963267, 1.761934, 1, 0, 0.9137255, 1,
0.965318, -0.1576552, 2.102329, 1, 0, 0.9058824, 1,
0.9671054, -0.0067478, -0.2974633, 1, 0, 0.9019608, 1,
0.9732263, -0.7568557, 1.800815, 1, 0, 0.8941177, 1,
0.9810709, 0.5857911, 2.198322, 1, 0, 0.8862745, 1,
0.982967, -0.9400906, 1.59762, 1, 0, 0.8823529, 1,
0.9831582, 0.5999505, 1.158649, 1, 0, 0.8745098, 1,
0.986166, 1.009537, -0.5680247, 1, 0, 0.8705882, 1,
0.9867939, 0.6067087, 0.441375, 1, 0, 0.8627451, 1,
0.9869832, 1.415749, 0.2013553, 1, 0, 0.8588235, 1,
0.9895055, -0.736949, 1.169164, 1, 0, 0.8509804, 1,
0.9900373, -0.8333505, 2.03122, 1, 0, 0.8470588, 1,
0.9915463, 0.6292141, -0.6786383, 1, 0, 0.8392157, 1,
0.9986215, 1.13143, 1.096407, 1, 0, 0.8352941, 1,
1.000237, 1.385772, 2.457461, 1, 0, 0.827451, 1,
1.013777, -1.490875, 2.967787, 1, 0, 0.8235294, 1,
1.01419, -0.09402002, 1.495485, 1, 0, 0.8156863, 1,
1.021907, 0.01915227, 2.665238, 1, 0, 0.8117647, 1,
1.02247, -2.361096, 3.590697, 1, 0, 0.8039216, 1,
1.025214, 1.286372, -0.339917, 1, 0, 0.7960784, 1,
1.0259, 0.07602568, 0.1368294, 1, 0, 0.7921569, 1,
1.047057, 0.0981258, 1.320407, 1, 0, 0.7843137, 1,
1.061494, 1.759196, 1.273259, 1, 0, 0.7803922, 1,
1.062948, -0.3711813, 1.714927, 1, 0, 0.772549, 1,
1.068596, -1.395003, 2.773297, 1, 0, 0.7686275, 1,
1.070092, 1.044819, 3.419737, 1, 0, 0.7607843, 1,
1.076969, 1.003255, 0.3310845, 1, 0, 0.7568628, 1,
1.083379, 0.6067325, 2.099173, 1, 0, 0.7490196, 1,
1.083657, -0.7257172, 1.23767, 1, 0, 0.7450981, 1,
1.090427, -0.8577436, 4.386014, 1, 0, 0.7372549, 1,
1.091713, 1.240176, -0.02222658, 1, 0, 0.7333333, 1,
1.091993, 0.4523578, 1.190276, 1, 0, 0.7254902, 1,
1.093585, 0.9675192, 1.366503, 1, 0, 0.7215686, 1,
1.100143, 0.277285, 2.031296, 1, 0, 0.7137255, 1,
1.107315, 0.985318, 1.039507, 1, 0, 0.7098039, 1,
1.109183, -0.9499984, 1.75084, 1, 0, 0.7019608, 1,
1.109621, 0.1989753, 1.437859, 1, 0, 0.6941177, 1,
1.114771, 0.4959081, 0.7471693, 1, 0, 0.6901961, 1,
1.126457, -0.3454538, 2.988499, 1, 0, 0.682353, 1,
1.128631, -0.5673751, 3.176031, 1, 0, 0.6784314, 1,
1.137443, -1.301195, 2.378056, 1, 0, 0.6705883, 1,
1.138349, -0.1011553, 3.925244, 1, 0, 0.6666667, 1,
1.143912, 0.7598852, 2.139398, 1, 0, 0.6588235, 1,
1.146231, -0.7049108, 1.005266, 1, 0, 0.654902, 1,
1.148014, 0.6371483, 1.057155, 1, 0, 0.6470588, 1,
1.15042, 0.3812477, 0.623023, 1, 0, 0.6431373, 1,
1.161244, -0.7896658, 3.709497, 1, 0, 0.6352941, 1,
1.165848, -0.6561656, 2.480141, 1, 0, 0.6313726, 1,
1.170375, 0.7987947, 0.5033031, 1, 0, 0.6235294, 1,
1.185427, 1.584164, 0.4254966, 1, 0, 0.6196079, 1,
1.191151, -0.8543513, 3.587741, 1, 0, 0.6117647, 1,
1.199481, -0.509932, 2.320036, 1, 0, 0.6078432, 1,
1.202988, -1.901298, 2.28253, 1, 0, 0.6, 1,
1.204993, -2.131546, 2.698054, 1, 0, 0.5921569, 1,
1.211431, 1.091663, -1.028049, 1, 0, 0.5882353, 1,
1.212048, 0.2217595, 2.078072, 1, 0, 0.5803922, 1,
1.217784, 0.2918081, 2.153979, 1, 0, 0.5764706, 1,
1.229402, 1.020615, 0.4666023, 1, 0, 0.5686275, 1,
1.238847, -0.4556381, 2.878909, 1, 0, 0.5647059, 1,
1.248898, -0.9528795, 1.705486, 1, 0, 0.5568628, 1,
1.250226, 0.04788142, 1.553937, 1, 0, 0.5529412, 1,
1.251709, -0.02045925, 3.424166, 1, 0, 0.5450981, 1,
1.274185, 1.117437, 1.938193, 1, 0, 0.5411765, 1,
1.276509, 1.052694, 1.452596, 1, 0, 0.5333334, 1,
1.306199, -2.047389, 1.258171, 1, 0, 0.5294118, 1,
1.311495, -1.03496, 1.055916, 1, 0, 0.5215687, 1,
1.315077, -0.3714496, 0.0330813, 1, 0, 0.5176471, 1,
1.318295, -0.2025975, 1.806828, 1, 0, 0.509804, 1,
1.322992, -0.210067, 2.115285, 1, 0, 0.5058824, 1,
1.329436, 0.07313678, 1.502542, 1, 0, 0.4980392, 1,
1.334288, 0.6343194, 1.246225, 1, 0, 0.4901961, 1,
1.34084, 0.9910541, 0.7736005, 1, 0, 0.4862745, 1,
1.356351, 0.1657024, 1.497275, 1, 0, 0.4784314, 1,
1.363046, 0.3921338, 0.8034263, 1, 0, 0.4745098, 1,
1.3646, 0.4667536, 1.476064, 1, 0, 0.4666667, 1,
1.371265, -0.2966321, 3.128255, 1, 0, 0.4627451, 1,
1.379714, 0.4157471, 1.743291, 1, 0, 0.454902, 1,
1.388288, 0.2426515, 2.399171, 1, 0, 0.4509804, 1,
1.39213, -0.7410761, 4.371119, 1, 0, 0.4431373, 1,
1.394324, 1.006005, 1.0967, 1, 0, 0.4392157, 1,
1.396095, 0.04455984, 0.8456452, 1, 0, 0.4313726, 1,
1.399856, 0.9175731, -0.2099196, 1, 0, 0.427451, 1,
1.417385, -0.4654219, 1.183503, 1, 0, 0.4196078, 1,
1.4351, 0.4778855, 1.815434, 1, 0, 0.4156863, 1,
1.435933, 1.249953, 1.226951, 1, 0, 0.4078431, 1,
1.441749, 0.814311, 0.3790963, 1, 0, 0.4039216, 1,
1.450826, -0.05942744, 1.053779, 1, 0, 0.3960784, 1,
1.457938, 0.20269, 0.9093368, 1, 0, 0.3882353, 1,
1.458495, 0.5448159, 0.9000767, 1, 0, 0.3843137, 1,
1.458603, 0.4303609, 1.659726, 1, 0, 0.3764706, 1,
1.460396, -0.04064216, 0.8439096, 1, 0, 0.372549, 1,
1.477788, -1.275079, 2.184199, 1, 0, 0.3647059, 1,
1.477839, -0.5237377, 2.266111, 1, 0, 0.3607843, 1,
1.479455, -0.4026008, 0.1340682, 1, 0, 0.3529412, 1,
1.512347, 0.406393, -0.9672337, 1, 0, 0.3490196, 1,
1.515274, -0.8108943, 2.408485, 1, 0, 0.3411765, 1,
1.52787, 0.6484019, -0.9127915, 1, 0, 0.3372549, 1,
1.537726, -0.2109233, 1.018773, 1, 0, 0.3294118, 1,
1.553061, -0.455818, 3.369103, 1, 0, 0.3254902, 1,
1.56243, 0.6611714, 2.777545, 1, 0, 0.3176471, 1,
1.570454, 1.048579, 0.6814778, 1, 0, 0.3137255, 1,
1.577047, 0.09719242, 1.707133, 1, 0, 0.3058824, 1,
1.578451, 1.704819, 0.08008211, 1, 0, 0.2980392, 1,
1.584123, -0.7639377, 1.725863, 1, 0, 0.2941177, 1,
1.589433, 1.372246, 1.125507, 1, 0, 0.2862745, 1,
1.600917, -0.3417207, 3.302814, 1, 0, 0.282353, 1,
1.601572, -0.9554488, 1.111578, 1, 0, 0.2745098, 1,
1.606603, -0.9754709, 3.20918, 1, 0, 0.2705882, 1,
1.616739, -0.4925732, -0.5899789, 1, 0, 0.2627451, 1,
1.632309, 0.445343, 1.415977, 1, 0, 0.2588235, 1,
1.636832, 0.364879, 3.64414, 1, 0, 0.2509804, 1,
1.64694, 0.3417549, -0.6325878, 1, 0, 0.2470588, 1,
1.653176, -0.5963302, 4.87116, 1, 0, 0.2392157, 1,
1.683617, 0.9240365, 1.739079, 1, 0, 0.2352941, 1,
1.715359, -0.5489835, 2.216058, 1, 0, 0.227451, 1,
1.72949, 0.3293821, 1.041276, 1, 0, 0.2235294, 1,
1.731497, 1.334027, 2.361745, 1, 0, 0.2156863, 1,
1.741573, -0.4829392, 1.528615, 1, 0, 0.2117647, 1,
1.743184, -0.113596, 1.74821, 1, 0, 0.2039216, 1,
1.751475, 0.08600105, 1.255465, 1, 0, 0.1960784, 1,
1.775326, -0.0708563, 1.554935, 1, 0, 0.1921569, 1,
1.814103, 0.3404102, 1.906043, 1, 0, 0.1843137, 1,
1.817422, 2.463304, 2.02442, 1, 0, 0.1803922, 1,
1.883304, -0.9853066, 1.863075, 1, 0, 0.172549, 1,
1.908607, -0.5531042, 2.110086, 1, 0, 0.1686275, 1,
1.943212, -0.2992311, 2.62121, 1, 0, 0.1607843, 1,
2.012795, -0.9076839, 1.552935, 1, 0, 0.1568628, 1,
2.019697, -1.533104, -0.7211218, 1, 0, 0.1490196, 1,
2.040182, -0.1208304, 1.941323, 1, 0, 0.145098, 1,
2.064677, 1.276595, -0.7546191, 1, 0, 0.1372549, 1,
2.079374, 0.7183717, 0.6292364, 1, 0, 0.1333333, 1,
2.079623, 0.3816863, 0.1085745, 1, 0, 0.1254902, 1,
2.100402, 0.2835332, 2.559655, 1, 0, 0.1215686, 1,
2.117997, -0.0860901, 2.322567, 1, 0, 0.1137255, 1,
2.133685, -0.8284035, 1.592847, 1, 0, 0.1098039, 1,
2.135849, -0.4115013, 0.9350961, 1, 0, 0.1019608, 1,
2.149332, 1.015344, 1.18033, 1, 0, 0.09411765, 1,
2.176437, 0.8337034, 1.01015, 1, 0, 0.09019608, 1,
2.180957, -0.3311526, 1.853938, 1, 0, 0.08235294, 1,
2.227309, 1.240313, 0.4396804, 1, 0, 0.07843138, 1,
2.251952, -0.6201448, 3.654819, 1, 0, 0.07058824, 1,
2.252868, -0.6250775, 2.577907, 1, 0, 0.06666667, 1,
2.269834, -0.9017594, 0.951291, 1, 0, 0.05882353, 1,
2.347329, 0.5256855, 1.69374, 1, 0, 0.05490196, 1,
2.352998, 0.02676509, 1.540717, 1, 0, 0.04705882, 1,
2.386228, 2.354219, -0.146512, 1, 0, 0.04313726, 1,
2.418426, -0.538761, 0.3585134, 1, 0, 0.03529412, 1,
2.446711, 0.1193375, 0.9255882, 1, 0, 0.03137255, 1,
2.582103, -0.8842834, 1.870204, 1, 0, 0.02352941, 1,
2.713543, -0.4248407, 1.385441, 1, 0, 0.01960784, 1,
2.806283, -0.3397601, 0.4672751, 1, 0, 0.01176471, 1,
3.414297, -0.8531564, 2.776905, 1, 0, 0.007843138, 1
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
0.1565744, -4.177524, -7.524275, 0, -0.5, 0.5, 0.5,
0.1565744, -4.177524, -7.524275, 1, -0.5, 0.5, 0.5,
0.1565744, -4.177524, -7.524275, 1, 1.5, 0.5, 0.5,
0.1565744, -4.177524, -7.524275, 0, 1.5, 0.5, 0.5
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
-4.205516, 0.2034651, -7.524275, 0, -0.5, 0.5, 0.5,
-4.205516, 0.2034651, -7.524275, 1, -0.5, 0.5, 0.5,
-4.205516, 0.2034651, -7.524275, 1, 1.5, 0.5, 0.5,
-4.205516, 0.2034651, -7.524275, 0, 1.5, 0.5, 0.5
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
-4.205516, -4.177524, -0.2098024, 0, -0.5, 0.5, 0.5,
-4.205516, -4.177524, -0.2098024, 1, -0.5, 0.5, 0.5,
-4.205516, -4.177524, -0.2098024, 1, 1.5, 0.5, 0.5,
-4.205516, -4.177524, -0.2098024, 0, 1.5, 0.5, 0.5
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
-3, -3.166526, -5.836319,
3, -3.166526, -5.836319,
-3, -3.166526, -5.836319,
-3, -3.335026, -6.117646,
-2, -3.166526, -5.836319,
-2, -3.335026, -6.117646,
-1, -3.166526, -5.836319,
-1, -3.335026, -6.117646,
0, -3.166526, -5.836319,
0, -3.335026, -6.117646,
1, -3.166526, -5.836319,
1, -3.335026, -6.117646,
2, -3.166526, -5.836319,
2, -3.335026, -6.117646,
3, -3.166526, -5.836319,
3, -3.335026, -6.117646
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
-3, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
-3, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
-3, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
-3, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5,
-2, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
-2, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
-2, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
-2, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5,
-1, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
-1, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
-1, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
-1, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5,
0, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
0, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
0, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
0, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5,
1, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
1, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
1, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
1, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5,
2, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
2, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
2, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
2, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5,
3, -3.672025, -6.680297, 0, -0.5, 0.5, 0.5,
3, -3.672025, -6.680297, 1, -0.5, 0.5, 0.5,
3, -3.672025, -6.680297, 1, 1.5, 0.5, 0.5,
3, -3.672025, -6.680297, 0, 1.5, 0.5, 0.5
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
-3.19888, -3, -5.836319,
-3.19888, 3, -5.836319,
-3.19888, -3, -5.836319,
-3.366653, -3, -6.117646,
-3.19888, -2, -5.836319,
-3.366653, -2, -6.117646,
-3.19888, -1, -5.836319,
-3.366653, -1, -6.117646,
-3.19888, 0, -5.836319,
-3.366653, 0, -6.117646,
-3.19888, 1, -5.836319,
-3.366653, 1, -6.117646,
-3.19888, 2, -5.836319,
-3.366653, 2, -6.117646,
-3.19888, 3, -5.836319,
-3.366653, 3, -6.117646
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
-3.702198, -3, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, -3, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, -3, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, -3, -6.680297, 0, 1.5, 0.5, 0.5,
-3.702198, -2, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, -2, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, -2, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, -2, -6.680297, 0, 1.5, 0.5, 0.5,
-3.702198, -1, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, -1, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, -1, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, -1, -6.680297, 0, 1.5, 0.5, 0.5,
-3.702198, 0, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, 0, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, 0, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, 0, -6.680297, 0, 1.5, 0.5, 0.5,
-3.702198, 1, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, 1, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, 1, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, 1, -6.680297, 0, 1.5, 0.5, 0.5,
-3.702198, 2, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, 2, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, 2, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, 2, -6.680297, 0, 1.5, 0.5, 0.5,
-3.702198, 3, -6.680297, 0, -0.5, 0.5, 0.5,
-3.702198, 3, -6.680297, 1, -0.5, 0.5, 0.5,
-3.702198, 3, -6.680297, 1, 1.5, 0.5, 0.5,
-3.702198, 3, -6.680297, 0, 1.5, 0.5, 0.5
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
-3.19888, -3.166526, -4,
-3.19888, -3.166526, 4,
-3.19888, -3.166526, -4,
-3.366653, -3.335026, -4,
-3.19888, -3.166526, -2,
-3.366653, -3.335026, -2,
-3.19888, -3.166526, 0,
-3.366653, -3.335026, 0,
-3.19888, -3.166526, 2,
-3.366653, -3.335026, 2,
-3.19888, -3.166526, 4,
-3.366653, -3.335026, 4
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
-3.702198, -3.672025, -4, 0, -0.5, 0.5, 0.5,
-3.702198, -3.672025, -4, 1, -0.5, 0.5, 0.5,
-3.702198, -3.672025, -4, 1, 1.5, 0.5, 0.5,
-3.702198, -3.672025, -4, 0, 1.5, 0.5, 0.5,
-3.702198, -3.672025, -2, 0, -0.5, 0.5, 0.5,
-3.702198, -3.672025, -2, 1, -0.5, 0.5, 0.5,
-3.702198, -3.672025, -2, 1, 1.5, 0.5, 0.5,
-3.702198, -3.672025, -2, 0, 1.5, 0.5, 0.5,
-3.702198, -3.672025, 0, 0, -0.5, 0.5, 0.5,
-3.702198, -3.672025, 0, 1, -0.5, 0.5, 0.5,
-3.702198, -3.672025, 0, 1, 1.5, 0.5, 0.5,
-3.702198, -3.672025, 0, 0, 1.5, 0.5, 0.5,
-3.702198, -3.672025, 2, 0, -0.5, 0.5, 0.5,
-3.702198, -3.672025, 2, 1, -0.5, 0.5, 0.5,
-3.702198, -3.672025, 2, 1, 1.5, 0.5, 0.5,
-3.702198, -3.672025, 2, 0, 1.5, 0.5, 0.5,
-3.702198, -3.672025, 4, 0, -0.5, 0.5, 0.5,
-3.702198, -3.672025, 4, 1, -0.5, 0.5, 0.5,
-3.702198, -3.672025, 4, 1, 1.5, 0.5, 0.5,
-3.702198, -3.672025, 4, 0, 1.5, 0.5, 0.5
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
-3.19888, -3.166526, -5.836319,
-3.19888, 3.573457, -5.836319,
-3.19888, -3.166526, 5.416715,
-3.19888, 3.573457, 5.416715,
-3.19888, -3.166526, -5.836319,
-3.19888, -3.166526, 5.416715,
-3.19888, 3.573457, -5.836319,
-3.19888, 3.573457, 5.416715,
-3.19888, -3.166526, -5.836319,
3.512029, -3.166526, -5.836319,
-3.19888, -3.166526, 5.416715,
3.512029, -3.166526, 5.416715,
-3.19888, 3.573457, -5.836319,
3.512029, 3.573457, -5.836319,
-3.19888, 3.573457, 5.416715,
3.512029, 3.573457, 5.416715,
3.512029, -3.166526, -5.836319,
3.512029, 3.573457, -5.836319,
3.512029, -3.166526, 5.416715,
3.512029, 3.573457, 5.416715,
3.512029, -3.166526, -5.836319,
3.512029, -3.166526, 5.416715,
3.512029, 3.573457, -5.836319,
3.512029, 3.573457, 5.416715
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
var radius = 7.867737;
var distance = 35.00445;
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
mvMatrix.translate( -0.1565744, -0.2034651, 0.2098024 );
mvMatrix.scale( 1.267601, 1.262132, 0.7559518 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.00445);
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
N-furfuryladenine<-read.table("N-furfuryladenine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-furfuryladenine$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-furfuryladenine$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-furfuryladenine$V4
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
-3.101148, 1.117583, -0.9133735, 0, 0, 1, 1, 1,
-2.952941, 0.1185063, -1.106657, 1, 0, 0, 1, 1,
-2.555502, -0.8151274, -1.848944, 1, 0, 0, 1, 1,
-2.497823, 0.4515021, -0.6297281, 1, 0, 0, 1, 1,
-2.481676, 0.4238004, -1.851735, 1, 0, 0, 1, 1,
-2.477737, 1.354008, -2.958119, 1, 0, 0, 1, 1,
-2.477244, 0.2039929, -2.716797, 0, 0, 0, 1, 1,
-2.46966, 0.2095528, -0.375789, 0, 0, 0, 1, 1,
-2.365997, 0.5936821, -1.092005, 0, 0, 0, 1, 1,
-2.321468, 0.02228017, -1.841495, 0, 0, 0, 1, 1,
-2.276061, 0.7941998, 0.7407828, 0, 0, 0, 1, 1,
-2.274678, -1.483665, -1.44119, 0, 0, 0, 1, 1,
-2.256087, -1.642945, -3.145899, 0, 0, 0, 1, 1,
-2.210832, 0.5620779, -1.909014, 1, 1, 1, 1, 1,
-2.210753, 0.3301995, -1.589351, 1, 1, 1, 1, 1,
-2.178177, -0.02224886, -1.508098, 1, 1, 1, 1, 1,
-2.176974, -1.539081, -2.859359, 1, 1, 1, 1, 1,
-2.175508, 0.1926824, -1.7753, 1, 1, 1, 1, 1,
-2.156594, -2.269397, -2.727829, 1, 1, 1, 1, 1,
-2.152082, -1.397449, -3.214822, 1, 1, 1, 1, 1,
-2.137251, -1.124391, -0.5278763, 1, 1, 1, 1, 1,
-2.134733, -0.7262725, -2.950379, 1, 1, 1, 1, 1,
-2.130694, 0.3205034, -1.345837, 1, 1, 1, 1, 1,
-2.104099, -0.3017031, 0.356074, 1, 1, 1, 1, 1,
-2.093649, 2.425617, -0.5107009, 1, 1, 1, 1, 1,
-2.057281, 1.87199, 0.3072916, 1, 1, 1, 1, 1,
-2.030473, -0.2303551, -2.990486, 1, 1, 1, 1, 1,
-2.02225, -0.6640309, -1.26404, 1, 1, 1, 1, 1,
-2.019905, -0.2544606, -0.6313391, 0, 0, 1, 1, 1,
-1.983556, 1.670412, -1.770899, 1, 0, 0, 1, 1,
-1.983457, -0.6290528, -0.9295413, 1, 0, 0, 1, 1,
-1.983216, 0.08310887, -1.678242, 1, 0, 0, 1, 1,
-1.980519, -1.432791, -3.393997, 1, 0, 0, 1, 1,
-1.976707, -0.1901504, -1.822016, 1, 0, 0, 1, 1,
-1.959658, -0.6940851, -1.839508, 0, 0, 0, 1, 1,
-1.939527, -0.1647434, -1.108221, 0, 0, 0, 1, 1,
-1.930922, 0.2297155, -0.6123129, 0, 0, 0, 1, 1,
-1.917435, -2.350557, -2.608098, 0, 0, 0, 1, 1,
-1.908894, -1.437046, -0.6010748, 0, 0, 0, 1, 1,
-1.897498, -0.1106226, -2.68718, 0, 0, 0, 1, 1,
-1.879909, -1.031061, -0.2793884, 0, 0, 0, 1, 1,
-1.879901, 0.8230248, -0.891516, 1, 1, 1, 1, 1,
-1.869341, -0.006127432, -0.65254, 1, 1, 1, 1, 1,
-1.851986, -0.481897, -1.827783, 1, 1, 1, 1, 1,
-1.834543, -1.039026, -0.7681429, 1, 1, 1, 1, 1,
-1.829115, -0.5316735, -3.545665, 1, 1, 1, 1, 1,
-1.816424, 0.2933366, 0.946808, 1, 1, 1, 1, 1,
-1.802899, 0.2440052, -2.605108, 1, 1, 1, 1, 1,
-1.787855, -1.214145, -1.256199, 1, 1, 1, 1, 1,
-1.784959, -0.2397158, -1.753483, 1, 1, 1, 1, 1,
-1.784758, -0.2776735, -2.041698, 1, 1, 1, 1, 1,
-1.773899, -0.4060204, -2.050314, 1, 1, 1, 1, 1,
-1.74988, -0.2035789, -1.257777, 1, 1, 1, 1, 1,
-1.743613, 0.3990909, -0.3287698, 1, 1, 1, 1, 1,
-1.735001, -0.7205038, -2.097311, 1, 1, 1, 1, 1,
-1.733756, 0.2092953, -1.132423, 1, 1, 1, 1, 1,
-1.730082, 1.054074, -1.851004, 0, 0, 1, 1, 1,
-1.729256, 0.6330507, -1.896509, 1, 0, 0, 1, 1,
-1.727275, 0.1415479, -0.7097778, 1, 0, 0, 1, 1,
-1.726071, 0.8692561, -2.565567, 1, 0, 0, 1, 1,
-1.715153, 1.45996, -2.323728, 1, 0, 0, 1, 1,
-1.692219, -1.71731, -3.38687, 1, 0, 0, 1, 1,
-1.69173, -1.049288, -2.046353, 0, 0, 0, 1, 1,
-1.691201, 0.3951755, -1.487615, 0, 0, 0, 1, 1,
-1.665275, 0.3199247, -0.2935968, 0, 0, 0, 1, 1,
-1.660784, -0.370579, -2.784691, 0, 0, 0, 1, 1,
-1.660492, -0.3576933, -1.972137, 0, 0, 0, 1, 1,
-1.65975, 0.7173632, -0.4169303, 0, 0, 0, 1, 1,
-1.656936, -0.09569455, -1.972767, 0, 0, 0, 1, 1,
-1.630712, 1.136674, -1.435876, 1, 1, 1, 1, 1,
-1.625986, -1.156862, -1.718614, 1, 1, 1, 1, 1,
-1.595948, -1.494665, -2.718853, 1, 1, 1, 1, 1,
-1.593443, 0.09340101, -0.3729964, 1, 1, 1, 1, 1,
-1.589278, 0.5195867, -1.384033, 1, 1, 1, 1, 1,
-1.585716, -0.5095004, -2.288523, 1, 1, 1, 1, 1,
-1.578476, -0.9880918, -1.912065, 1, 1, 1, 1, 1,
-1.568268, -0.4968269, -2.599276, 1, 1, 1, 1, 1,
-1.55911, -0.427991, -2.587605, 1, 1, 1, 1, 1,
-1.536159, -0.61385, -1.200002, 1, 1, 1, 1, 1,
-1.533872, -0.7713268, -1.398828, 1, 1, 1, 1, 1,
-1.523794, -0.3362418, -2.031884, 1, 1, 1, 1, 1,
-1.508025, -1.139205, -3.291293, 1, 1, 1, 1, 1,
-1.507435, -0.434456, -0.9121135, 1, 1, 1, 1, 1,
-1.505035, 0.3174236, -1.13616, 1, 1, 1, 1, 1,
-1.500405, 1.062452, -1.796187, 0, 0, 1, 1, 1,
-1.499887, -0.9063439, -2.593523, 1, 0, 0, 1, 1,
-1.498556, -1.358174, -3.275281, 1, 0, 0, 1, 1,
-1.497498, -0.9575613, -3.282975, 1, 0, 0, 1, 1,
-1.483772, -0.2271991, -2.0545, 1, 0, 0, 1, 1,
-1.483635, -0.6404665, -1.689164, 1, 0, 0, 1, 1,
-1.462479, 0.6170821, -1.326634, 0, 0, 0, 1, 1,
-1.45619, 0.5595399, -2.104497, 0, 0, 0, 1, 1,
-1.455874, -0.6087335, -3.047878, 0, 0, 0, 1, 1,
-1.444872, 2.269416, -2.615198, 0, 0, 0, 1, 1,
-1.439709, -1.512427, -0.8304711, 0, 0, 0, 1, 1,
-1.432088, -0.9320275, -0.8786995, 0, 0, 0, 1, 1,
-1.427572, 2.647407, -1.920386, 0, 0, 0, 1, 1,
-1.413674, -0.2613332, -2.092981, 1, 1, 1, 1, 1,
-1.412619, -1.078627, -2.583008, 1, 1, 1, 1, 1,
-1.411076, -0.5349599, -0.2891791, 1, 1, 1, 1, 1,
-1.397481, 1.382882, 0.6307546, 1, 1, 1, 1, 1,
-1.396926, -2.252699, -3.239653, 1, 1, 1, 1, 1,
-1.387365, -0.2510437, -2.504449, 1, 1, 1, 1, 1,
-1.386988, 0.9633095, -0.1977385, 1, 1, 1, 1, 1,
-1.383093, -0.2840345, -1.01607, 1, 1, 1, 1, 1,
-1.382699, 0.2144919, -1.963053, 1, 1, 1, 1, 1,
-1.370994, 0.02533665, -1.228582, 1, 1, 1, 1, 1,
-1.365462, -1.496958, -2.628294, 1, 1, 1, 1, 1,
-1.346502, -2.037768, -2.449604, 1, 1, 1, 1, 1,
-1.334736, 0.2428733, -2.349189, 1, 1, 1, 1, 1,
-1.334697, 1.581545, -1.192235, 1, 1, 1, 1, 1,
-1.332365, -0.6400437, -1.064073, 1, 1, 1, 1, 1,
-1.328981, 1.38949, -1.204115, 0, 0, 1, 1, 1,
-1.328749, 2.226568, -0.4663944, 1, 0, 0, 1, 1,
-1.324673, -1.234718, -2.524889, 1, 0, 0, 1, 1,
-1.31797, -0.06717492, -2.321195, 1, 0, 0, 1, 1,
-1.313249, 0.4404778, -1.686287, 1, 0, 0, 1, 1,
-1.312245, 0.8977082, -1.258572, 1, 0, 0, 1, 1,
-1.30488, 0.3215143, -2.253601, 0, 0, 0, 1, 1,
-1.300612, -1.335388, -1.846621, 0, 0, 0, 1, 1,
-1.289791, 0.824294, 0.0589033, 0, 0, 0, 1, 1,
-1.275033, -0.7663335, -3.735142, 0, 0, 0, 1, 1,
-1.247304, -0.8016917, -0.6106869, 0, 0, 0, 1, 1,
-1.24709, 0.2262646, -1.276816, 0, 0, 0, 1, 1,
-1.244363, 1.050205, -0.790324, 0, 0, 0, 1, 1,
-1.238406, -1.002207, -1.414495, 1, 1, 1, 1, 1,
-1.23596, 0.4046637, -1.94281, 1, 1, 1, 1, 1,
-1.2234, -1.296865, -3.008825, 1, 1, 1, 1, 1,
-1.212366, 0.5404011, 0.03899678, 1, 1, 1, 1, 1,
-1.207247, -1.913677, -2.856879, 1, 1, 1, 1, 1,
-1.202315, -2.032384, -2.310082, 1, 1, 1, 1, 1,
-1.188104, 0.2479798, -3.719199, 1, 1, 1, 1, 1,
-1.172163, 0.01404938, 0.4924015, 1, 1, 1, 1, 1,
-1.171813, -0.4059477, -2.767954, 1, 1, 1, 1, 1,
-1.171219, -0.6018167, -1.836763, 1, 1, 1, 1, 1,
-1.169646, 1.700605, -0.1058403, 1, 1, 1, 1, 1,
-1.166163, -1.092664, -1.811665, 1, 1, 1, 1, 1,
-1.140436, -0.08365919, -2.82125, 1, 1, 1, 1, 1,
-1.135863, 2.03189, 0.8526726, 1, 1, 1, 1, 1,
-1.121287, 2.260074, -0.1821266, 1, 1, 1, 1, 1,
-1.118964, 1.892077, -0.2463349, 0, 0, 1, 1, 1,
-1.118334, -1.283983, -1.992238, 1, 0, 0, 1, 1,
-1.108879, 0.06961311, -1.065564, 1, 0, 0, 1, 1,
-1.1032, -2.512141, -4.618698, 1, 0, 0, 1, 1,
-1.098318, 0.0002284527, -2.25037, 1, 0, 0, 1, 1,
-1.096106, 0.562018, 0.2095386, 1, 0, 0, 1, 1,
-1.093181, -0.5949172, -1.634089, 0, 0, 0, 1, 1,
-1.089778, -0.3477854, -3.370561, 0, 0, 0, 1, 1,
-1.08474, 0.4231328, -1.553441, 0, 0, 0, 1, 1,
-1.084139, -1.124794, -3.080784, 0, 0, 0, 1, 1,
-1.079502, 0.1265953, -3.378742, 0, 0, 0, 1, 1,
-1.072346, 0.9782718, 0.4695576, 0, 0, 0, 1, 1,
-1.056765, -1.169074, -0.5641932, 0, 0, 0, 1, 1,
-1.053843, 0.382467, -2.730407, 1, 1, 1, 1, 1,
-1.046968, 0.08657745, -0.3914888, 1, 1, 1, 1, 1,
-1.042046, -2.158022, -2.227377, 1, 1, 1, 1, 1,
-1.026824, -0.4868238, -1.389835, 1, 1, 1, 1, 1,
-1.024414, -1.360984, -0.6168768, 1, 1, 1, 1, 1,
-1.010749, 0.3664048, -0.7306719, 1, 1, 1, 1, 1,
-1.006718, 1.229384, 0.4307152, 1, 1, 1, 1, 1,
-1.002674, 0.9314622, -1.43564, 1, 1, 1, 1, 1,
-1.000195, 0.02952414, -2.780846, 1, 1, 1, 1, 1,
-0.9856918, 1.735157, -0.3706793, 1, 1, 1, 1, 1,
-0.9834041, 0.9369445, -0.3304248, 1, 1, 1, 1, 1,
-0.9817664, -1.371716, -2.797767, 1, 1, 1, 1, 1,
-0.9802366, -1.105214, -3.339069, 1, 1, 1, 1, 1,
-0.9652765, 0.2497001, -1.748531, 1, 1, 1, 1, 1,
-0.9640693, 0.9412015, -0.7720133, 1, 1, 1, 1, 1,
-0.954082, -1.317717, -3.083539, 0, 0, 1, 1, 1,
-0.9537982, 1.116503, 0.7750467, 1, 0, 0, 1, 1,
-0.9509609, -1.294763, -2.960932, 1, 0, 0, 1, 1,
-0.9362912, -0.1247239, -1.543912, 1, 0, 0, 1, 1,
-0.9300523, 0.08554647, -2.410096, 1, 0, 0, 1, 1,
-0.9293849, 0.3770671, -1.680143, 1, 0, 0, 1, 1,
-0.9265495, 0.9950554, -0.9267974, 0, 0, 0, 1, 1,
-0.9261575, -1.579474, -2.756521, 0, 0, 0, 1, 1,
-0.9194909, 1.347811, -0.1733362, 0, 0, 0, 1, 1,
-0.9185145, 1.7762, 1.464716, 0, 0, 0, 1, 1,
-0.9152442, 0.7103039, 1.376673, 0, 0, 0, 1, 1,
-0.9116238, -2.221329, -2.652693, 0, 0, 0, 1, 1,
-0.907131, -0.7126799, -1.551171, 0, 0, 0, 1, 1,
-0.9005952, 0.03820812, -0.8614764, 1, 1, 1, 1, 1,
-0.8991866, 0.6273822, -0.5343451, 1, 1, 1, 1, 1,
-0.8974938, 1.386461, -0.3507467, 1, 1, 1, 1, 1,
-0.8927115, 0.1842398, -0.9302554, 1, 1, 1, 1, 1,
-0.891752, 1.144904, -1.567668, 1, 1, 1, 1, 1,
-0.8868626, -0.8173114, -1.217138, 1, 1, 1, 1, 1,
-0.8858811, -0.9257032, -2.105004, 1, 1, 1, 1, 1,
-0.8820314, 0.4481334, -2.022414, 1, 1, 1, 1, 1,
-0.8815906, 1.024653, -3.37541, 1, 1, 1, 1, 1,
-0.8815342, -0.7148443, -0.6146123, 1, 1, 1, 1, 1,
-0.8792952, 0.3957016, -2.62868, 1, 1, 1, 1, 1,
-0.8764868, 0.4587959, -2.168161, 1, 1, 1, 1, 1,
-0.8755862, 0.9735734, -1.518793, 1, 1, 1, 1, 1,
-0.8741333, 1.101634, -1.34033, 1, 1, 1, 1, 1,
-0.8732918, -2.452664, -1.897149, 1, 1, 1, 1, 1,
-0.8705111, 0.7418128, -1.246688, 0, 0, 1, 1, 1,
-0.8632188, 0.724817, -0.3029133, 1, 0, 0, 1, 1,
-0.8606908, 0.5646627, -0.9876496, 1, 0, 0, 1, 1,
-0.8592725, -0.3470226, -2.840464, 1, 0, 0, 1, 1,
-0.8540524, -0.2217912, -0.870059, 1, 0, 0, 1, 1,
-0.8531837, -1.329509, -2.051842, 1, 0, 0, 1, 1,
-0.8514646, -1.827008, -2.868113, 0, 0, 0, 1, 1,
-0.8507286, 0.7488253, -1.282046, 0, 0, 0, 1, 1,
-0.8417626, 1.7109, 1.334793, 0, 0, 0, 1, 1,
-0.8354526, -1.082218, -0.6473113, 0, 0, 0, 1, 1,
-0.8304957, 0.4920866, -0.9893769, 0, 0, 0, 1, 1,
-0.822623, 0.961971, -2.404366, 0, 0, 0, 1, 1,
-0.8207194, -0.8891037, -1.470251, 0, 0, 0, 1, 1,
-0.8191258, -1.116922, -1.896877, 1, 1, 1, 1, 1,
-0.8154706, -2.297999, -2.273583, 1, 1, 1, 1, 1,
-0.8093528, -0.1037534, -0.3549646, 1, 1, 1, 1, 1,
-0.8075544, 0.9580731, -1.646606, 1, 1, 1, 1, 1,
-0.8009367, -3.068371, -2.709463, 1, 1, 1, 1, 1,
-0.7990236, -1.487829, -0.4644674, 1, 1, 1, 1, 1,
-0.7980962, 0.5458367, 0.1236495, 1, 1, 1, 1, 1,
-0.7980238, -1.676005, -2.649368, 1, 1, 1, 1, 1,
-0.7911112, 0.02431817, -1.995104, 1, 1, 1, 1, 1,
-0.7814868, 2.813697, -0.589888, 1, 1, 1, 1, 1,
-0.7802272, 1.629313, 0.2210056, 1, 1, 1, 1, 1,
-0.7798907, 1.246537, -1.370749, 1, 1, 1, 1, 1,
-0.779519, -1.949139, -2.142478, 1, 1, 1, 1, 1,
-0.7750288, -1.218392, -3.97983, 1, 1, 1, 1, 1,
-0.7694542, -0.7403886, -2.623527, 1, 1, 1, 1, 1,
-0.7653674, 0.3491406, -1.598083, 0, 0, 1, 1, 1,
-0.7645187, -1.326929, -2.713271, 1, 0, 0, 1, 1,
-0.7627759, 1.410952, -1.335186, 1, 0, 0, 1, 1,
-0.7605958, 1.0597, 1.146925, 1, 0, 0, 1, 1,
-0.7579644, 0.3951243, 0.5100978, 1, 0, 0, 1, 1,
-0.7477949, -1.362202, -1.523402, 1, 0, 0, 1, 1,
-0.7381496, -1.090474, -2.385581, 0, 0, 0, 1, 1,
-0.7314985, -0.4303094, -3.15194, 0, 0, 0, 1, 1,
-0.7286684, -0.1213144, -2.481277, 0, 0, 0, 1, 1,
-0.7240222, 0.150592, -1.834311, 0, 0, 0, 1, 1,
-0.7237656, -0.3648776, -3.221521, 0, 0, 0, 1, 1,
-0.7213597, -1.12178, -3.114385, 0, 0, 0, 1, 1,
-0.7122843, 0.6589715, -1.236209, 0, 0, 0, 1, 1,
-0.7120427, -0.1526129, -0.8717228, 1, 1, 1, 1, 1,
-0.7118834, 1.927383, 0.220307, 1, 1, 1, 1, 1,
-0.7081386, 0.6358916, -1.121238, 1, 1, 1, 1, 1,
-0.7023264, 0.09679081, -1.478159, 1, 1, 1, 1, 1,
-0.6979238, -0.1680382, -0.5416916, 1, 1, 1, 1, 1,
-0.6889621, -0.8390634, -2.608892, 1, 1, 1, 1, 1,
-0.6747975, -0.05380179, -0.1751907, 1, 1, 1, 1, 1,
-0.66662, 0.2035102, 0.3333887, 1, 1, 1, 1, 1,
-0.6647536, -1.231839, -0.5748804, 1, 1, 1, 1, 1,
-0.663478, -1.247303, -3.964437, 1, 1, 1, 1, 1,
-0.6539035, -0.6828654, -1.641165, 1, 1, 1, 1, 1,
-0.6535513, 0.1818279, -3.023919, 1, 1, 1, 1, 1,
-0.6534881, 1.402671, -2.474982, 1, 1, 1, 1, 1,
-0.6507298, 0.2885564, -0.6967253, 1, 1, 1, 1, 1,
-0.650416, -0.5337849, -1.322381, 1, 1, 1, 1, 1,
-0.6479026, -0.02742502, -1.932966, 0, 0, 1, 1, 1,
-0.6461542, 0.6123913, -0.7778681, 1, 0, 0, 1, 1,
-0.6429976, -2.762291, -4.307444, 1, 0, 0, 1, 1,
-0.633887, 1.576753, -0.3710679, 1, 0, 0, 1, 1,
-0.6330174, 0.4715622, -2.050396, 1, 0, 0, 1, 1,
-0.6329554, -1.474241, -1.6323, 1, 0, 0, 1, 1,
-0.6326863, -0.6727746, -2.773978, 0, 0, 0, 1, 1,
-0.6317608, 1.264293, -1.694484, 0, 0, 0, 1, 1,
-0.6316634, 1.27576, 0.8255771, 0, 0, 0, 1, 1,
-0.6264917, -0.03496689, -0.6485112, 0, 0, 0, 1, 1,
-0.6257976, 0.4634772, -1.801742, 0, 0, 0, 1, 1,
-0.6246499, -1.29647, -2.47995, 0, 0, 0, 1, 1,
-0.6161156, -0.3164954, -2.509826, 0, 0, 0, 1, 1,
-0.6104479, -0.7843859, -2.357066, 1, 1, 1, 1, 1,
-0.6062088, 0.1473699, -1.255162, 1, 1, 1, 1, 1,
-0.6030399, -0.02813708, -2.049564, 1, 1, 1, 1, 1,
-0.6014375, -1.11982, -1.801185, 1, 1, 1, 1, 1,
-0.6000833, 1.037634, -0.9838653, 1, 1, 1, 1, 1,
-0.5988863, 0.443249, -1.494206, 1, 1, 1, 1, 1,
-0.595643, 1.663756, 0.4091952, 1, 1, 1, 1, 1,
-0.5939735, -0.5088044, -2.677623, 1, 1, 1, 1, 1,
-0.5932121, -0.3686444, -1.6951, 1, 1, 1, 1, 1,
-0.592639, 1.430278, -1.458625, 1, 1, 1, 1, 1,
-0.588856, 0.7187094, 0.4363155, 1, 1, 1, 1, 1,
-0.5883812, -0.7463844, -0.8287901, 1, 1, 1, 1, 1,
-0.5854768, -0.2347087, -1.677487, 1, 1, 1, 1, 1,
-0.5709279, 0.4303998, -1.218783, 1, 1, 1, 1, 1,
-0.5690843, -0.2282559, -3.939255, 1, 1, 1, 1, 1,
-0.5679241, -0.1601709, -1.658159, 0, 0, 1, 1, 1,
-0.5653699, 1.1265, -1.72367, 1, 0, 0, 1, 1,
-0.5587493, 0.8711141, 0.712074, 1, 0, 0, 1, 1,
-0.5567791, -1.033469, -2.159127, 1, 0, 0, 1, 1,
-0.5540933, -0.2243192, -1.423417, 1, 0, 0, 1, 1,
-0.5490479, 0.1184101, -3.691285, 1, 0, 0, 1, 1,
-0.5386688, -0.7942196, -2.96637, 0, 0, 0, 1, 1,
-0.5381663, -0.3684406, -2.609656, 0, 0, 0, 1, 1,
-0.537648, 2.144923, -1.78003, 0, 0, 0, 1, 1,
-0.5235298, 1.321427, 0.103457, 0, 0, 0, 1, 1,
-0.5202154, -1.699702, -2.000512, 0, 0, 0, 1, 1,
-0.5145528, 0.3071473, -2.473058, 0, 0, 0, 1, 1,
-0.5095996, 1.220099, -1.813122, 0, 0, 0, 1, 1,
-0.5081799, -0.7725222, -4.503106, 1, 1, 1, 1, 1,
-0.5042561, 0.8559752, -1.208397, 1, 1, 1, 1, 1,
-0.5031527, -0.7890684, -0.2542135, 1, 1, 1, 1, 1,
-0.5010129, 1.033415, -0.4132597, 1, 1, 1, 1, 1,
-0.5005869, 0.408234, 0.5661901, 1, 1, 1, 1, 1,
-0.4990437, 1.689904, -1.557423, 1, 1, 1, 1, 1,
-0.4939191, -0.50036, -2.86215, 1, 1, 1, 1, 1,
-0.4905504, 1.337516, -0.04977739, 1, 1, 1, 1, 1,
-0.4843779, 0.6371172, 0.7447143, 1, 1, 1, 1, 1,
-0.4802175, -0.02542896, -1.570985, 1, 1, 1, 1, 1,
-0.4798115, 0.4791462, -1.340528, 1, 1, 1, 1, 1,
-0.4792098, -0.775555, -1.376691, 1, 1, 1, 1, 1,
-0.4748406, 1.607279, 0.754835, 1, 1, 1, 1, 1,
-0.4696005, 0.6357345, -1.391415, 1, 1, 1, 1, 1,
-0.4675177, -0.6337105, -1.795823, 1, 1, 1, 1, 1,
-0.4671715, -0.426367, -2.620595, 0, 0, 1, 1, 1,
-0.4669079, -0.5350792, -4.619974, 1, 0, 0, 1, 1,
-0.4637969, -0.3993934, -3.134437, 1, 0, 0, 1, 1,
-0.4620842, 0.3719104, -1.31309, 1, 0, 0, 1, 1,
-0.4618961, -1.692461, -2.620864, 1, 0, 0, 1, 1,
-0.4568979, -1.712884, -2.672845, 1, 0, 0, 1, 1,
-0.4555252, 1.208182, 1.891742, 0, 0, 0, 1, 1,
-0.4530585, -0.579694, -1.893139, 0, 0, 0, 1, 1,
-0.4489656, -1.000522, -2.751461, 0, 0, 0, 1, 1,
-0.4488639, 1.415178, -0.6382229, 0, 0, 0, 1, 1,
-0.4393884, -0.4363002, -1.964712, 0, 0, 0, 1, 1,
-0.4393213, 0.07246611, -0.841566, 0, 0, 0, 1, 1,
-0.4352113, -0.03153165, -1.496977, 0, 0, 0, 1, 1,
-0.4343834, -0.0412325, -0.9650044, 1, 1, 1, 1, 1,
-0.4339616, 0.3731731, 0.5635668, 1, 1, 1, 1, 1,
-0.433399, -0.8045725, -3.437228, 1, 1, 1, 1, 1,
-0.4295866, -1.105062, -1.730081, 1, 1, 1, 1, 1,
-0.4288643, 1.124361, -1.186484, 1, 1, 1, 1, 1,
-0.4280764, -1.137491, -3.376358, 1, 1, 1, 1, 1,
-0.4253055, 0.6521038, -1.780518, 1, 1, 1, 1, 1,
-0.419277, -0.2739596, 0.02580206, 1, 1, 1, 1, 1,
-0.4184545, -1.445661, -3.684837, 1, 1, 1, 1, 1,
-0.4170054, 1.559587, -0.5408413, 1, 1, 1, 1, 1,
-0.4123424, -0.1686492, -2.096447, 1, 1, 1, 1, 1,
-0.4109822, 0.7545961, -1.578253, 1, 1, 1, 1, 1,
-0.4099869, 0.9953911, -1.14418, 1, 1, 1, 1, 1,
-0.4092616, -1.220524, -3.235777, 1, 1, 1, 1, 1,
-0.4060743, -0.5831319, -1.70982, 1, 1, 1, 1, 1,
-0.4052787, 1.07809, -1.658067, 0, 0, 1, 1, 1,
-0.4051834, 0.7558619, -1.372527, 1, 0, 0, 1, 1,
-0.4021968, -1.085426, -3.824493, 1, 0, 0, 1, 1,
-0.3971646, 0.159039, -2.685207, 1, 0, 0, 1, 1,
-0.3963706, 0.4130326, -1.372046, 1, 0, 0, 1, 1,
-0.395383, -1.649874, -1.648478, 1, 0, 0, 1, 1,
-0.3946784, 1.271533, -0.7119105, 0, 0, 0, 1, 1,
-0.3923019, 0.8144382, 0.708334, 0, 0, 0, 1, 1,
-0.3886477, -0.4254917, -2.991009, 0, 0, 0, 1, 1,
-0.3861016, 0.6207547, -0.443232, 0, 0, 0, 1, 1,
-0.3837441, 1.617813, -1.074007, 0, 0, 0, 1, 1,
-0.3805633, 0.4180948, -0.1094162, 0, 0, 0, 1, 1,
-0.3792913, -1.495679, -2.544791, 0, 0, 0, 1, 1,
-0.378642, 1.466435, 0.4122894, 1, 1, 1, 1, 1,
-0.3733399, 0.1035096, -0.09910025, 1, 1, 1, 1, 1,
-0.3722827, -0.1072349, -3.765402, 1, 1, 1, 1, 1,
-0.3710578, -1.14907, -3.805887, 1, 1, 1, 1, 1,
-0.3699174, 0.8248433, 1.058826, 1, 1, 1, 1, 1,
-0.3660984, 0.2915807, -1.781956, 1, 1, 1, 1, 1,
-0.3589315, 0.2418811, -0.427844, 1, 1, 1, 1, 1,
-0.3540106, -0.645759, -3.934906, 1, 1, 1, 1, 1,
-0.3538366, -1.400388, -4.243604, 1, 1, 1, 1, 1,
-0.3505387, -0.2491811, -2.211402, 1, 1, 1, 1, 1,
-0.3490671, 1.290049, -0.7061327, 1, 1, 1, 1, 1,
-0.3472412, -0.1471519, -3.860255, 1, 1, 1, 1, 1,
-0.3470626, -0.3518439, -2.425225, 1, 1, 1, 1, 1,
-0.3452604, 1.185265, -2.33891, 1, 1, 1, 1, 1,
-0.3389939, -0.6309312, -2.006652, 1, 1, 1, 1, 1,
-0.3325699, -0.9386576, -3.420676, 0, 0, 1, 1, 1,
-0.3303861, 0.8271787, -1.282381, 1, 0, 0, 1, 1,
-0.3296105, -1.296122, -3.072011, 1, 0, 0, 1, 1,
-0.3281193, 0.2999019, -1.755013, 1, 0, 0, 1, 1,
-0.3275551, -0.289272, -3.376758, 1, 0, 0, 1, 1,
-0.3271209, -0.06434756, -0.3283042, 1, 0, 0, 1, 1,
-0.3239765, 2.816367, -1.754046, 0, 0, 0, 1, 1,
-0.3203698, 0.04564012, -1.547835, 0, 0, 0, 1, 1,
-0.3118138, -1.988661, -1.50717, 0, 0, 0, 1, 1,
-0.3068748, 1.742672, 1.034042, 0, 0, 0, 1, 1,
-0.3059083, 1.085031, -1.411437, 0, 0, 0, 1, 1,
-0.3058727, 1.396244, -1.343899, 0, 0, 0, 1, 1,
-0.3005002, 0.5576327, -2.309424, 0, 0, 0, 1, 1,
-0.2992835, -0.7385521, -1.342009, 1, 1, 1, 1, 1,
-0.2962056, 0.7699764, -0.5831142, 1, 1, 1, 1, 1,
-0.2950123, -1.844666, -3.18788, 1, 1, 1, 1, 1,
-0.2949216, -1.275556, -3.572244, 1, 1, 1, 1, 1,
-0.2915254, -0.9460249, -3.191843, 1, 1, 1, 1, 1,
-0.2890145, -0.2380302, -2.739758, 1, 1, 1, 1, 1,
-0.2879913, 0.1972328, -0.5664726, 1, 1, 1, 1, 1,
-0.2867617, 0.4233514, 0.2912723, 1, 1, 1, 1, 1,
-0.2865856, 0.980391, 1.823767, 1, 1, 1, 1, 1,
-0.2823644, -0.5387487, -2.784284, 1, 1, 1, 1, 1,
-0.2784553, -0.2329064, -1.560347, 1, 1, 1, 1, 1,
-0.2783553, -0.71579, -5.672441, 1, 1, 1, 1, 1,
-0.2777713, 0.02234362, -2.017991, 1, 1, 1, 1, 1,
-0.2752094, 1.466682, 0.537904, 1, 1, 1, 1, 1,
-0.2731455, 0.4210112, 0.7244855, 1, 1, 1, 1, 1,
-0.2722306, -1.747638, -3.658321, 0, 0, 1, 1, 1,
-0.2683506, -0.1121746, -2.596901, 1, 0, 0, 1, 1,
-0.2665932, 0.2235639, -3.150725, 1, 0, 0, 1, 1,
-0.2583243, -1.097678, -3.303529, 1, 0, 0, 1, 1,
-0.2519514, 1.541565, -0.6614881, 1, 0, 0, 1, 1,
-0.2475076, -0.156084, -3.7097, 1, 0, 0, 1, 1,
-0.2473812, -1.514598, -2.564409, 0, 0, 0, 1, 1,
-0.2466863, 0.8024733, -1.207658, 0, 0, 0, 1, 1,
-0.2411, -1.757603, -1.931335, 0, 0, 0, 1, 1,
-0.2402356, 0.3161128, 0.2834894, 0, 0, 0, 1, 1,
-0.2395728, 0.2021669, -1.533038, 0, 0, 0, 1, 1,
-0.2341985, 0.5985154, 0.5796634, 0, 0, 0, 1, 1,
-0.2310239, 0.1782037, -1.273787, 0, 0, 0, 1, 1,
-0.2308802, 1.095896, -0.2245143, 1, 1, 1, 1, 1,
-0.2271902, 1.017594, -0.6377377, 1, 1, 1, 1, 1,
-0.2249909, 0.2080673, -0.554329, 1, 1, 1, 1, 1,
-0.2233582, 0.5082798, -0.3990722, 1, 1, 1, 1, 1,
-0.221755, -0.9120148, -1.975413, 1, 1, 1, 1, 1,
-0.2215399, 0.4975509, -0.02274344, 1, 1, 1, 1, 1,
-0.2184065, 0.5243888, -1.611089, 1, 1, 1, 1, 1,
-0.2114243, -0.6698128, -3.680818, 1, 1, 1, 1, 1,
-0.2094049, -0.03398118, -3.232864, 1, 1, 1, 1, 1,
-0.208844, 0.1774737, -0.7679464, 1, 1, 1, 1, 1,
-0.2044545, -1.223572, -2.225857, 1, 1, 1, 1, 1,
-0.2013751, -0.7047803, -3.853652, 1, 1, 1, 1, 1,
-0.1985086, 2.120505, -2.258868, 1, 1, 1, 1, 1,
-0.1968523, 0.316193, -1.375921, 1, 1, 1, 1, 1,
-0.1959824, 0.2415071, 1.33435, 1, 1, 1, 1, 1,
-0.1958334, -1.491535, -2.155889, 0, 0, 1, 1, 1,
-0.1937712, 0.2939979, -0.2837016, 1, 0, 0, 1, 1,
-0.1854597, 0.7768478, -2.705526, 1, 0, 0, 1, 1,
-0.1827813, -0.007638359, -1.239461, 1, 0, 0, 1, 1,
-0.1813681, 0.1067128, -3.080456, 1, 0, 0, 1, 1,
-0.1790479, -0.2461859, -1.991287, 1, 0, 0, 1, 1,
-0.178904, 1.164671, -0.4988002, 0, 0, 0, 1, 1,
-0.1788194, -0.9261865, -3.318791, 0, 0, 0, 1, 1,
-0.1784171, 0.341071, -1.549982, 0, 0, 0, 1, 1,
-0.1770165, 1.15696, 1.381053, 0, 0, 0, 1, 1,
-0.1737237, 1.360546, 1.613324, 0, 0, 0, 1, 1,
-0.1716828, 0.9683256, -0.3460053, 0, 0, 0, 1, 1,
-0.165123, -0.7838709, -2.97774, 0, 0, 0, 1, 1,
-0.1644186, 0.07624394, 0.577074, 1, 1, 1, 1, 1,
-0.1604155, 2.179543, -0.8710983, 1, 1, 1, 1, 1,
-0.1574343, -0.2574832, -2.990745, 1, 1, 1, 1, 1,
-0.1557435, 0.7934278, -0.01402056, 1, 1, 1, 1, 1,
-0.1516984, 2.647209, 1.227062, 1, 1, 1, 1, 1,
-0.1484969, -1.1512, -5.122027, 1, 1, 1, 1, 1,
-0.1457005, 1.056021, 0.3786092, 1, 1, 1, 1, 1,
-0.1417107, 1.805995, 0.9494701, 1, 1, 1, 1, 1,
-0.1408486, 0.7764058, -0.5121954, 1, 1, 1, 1, 1,
-0.1391473, -0.5092204, -3.083886, 1, 1, 1, 1, 1,
-0.1289994, 1.736453, 0.6583558, 1, 1, 1, 1, 1,
-0.1255611, 0.02256373, -1.483107, 1, 1, 1, 1, 1,
-0.1246536, 0.5032629, -1.200081, 1, 1, 1, 1, 1,
-0.1243068, 0.1828263, -1.061622, 1, 1, 1, 1, 1,
-0.1239448, -1.09639, -2.899691, 1, 1, 1, 1, 1,
-0.1216456, 0.6030526, 0.6138975, 0, 0, 1, 1, 1,
-0.1180807, -1.664834, -4.422527, 1, 0, 0, 1, 1,
-0.1125144, -0.2597162, -3.160807, 1, 0, 0, 1, 1,
-0.1115881, 0.923752, -0.8713612, 1, 0, 0, 1, 1,
-0.1099016, 1.41804, 0.5637801, 1, 0, 0, 1, 1,
-0.108885, -0.5754223, -4.274254, 1, 0, 0, 1, 1,
-0.1076743, 0.3659868, 0.4242872, 0, 0, 0, 1, 1,
-0.107595, -0.587564, -2.43262, 0, 0, 0, 1, 1,
-0.1052208, -1.411566, -2.285157, 0, 0, 0, 1, 1,
-0.1041169, 1.788259, -0.6073443, 0, 0, 0, 1, 1,
-0.09384536, -2.398247, -3.475689, 0, 0, 0, 1, 1,
-0.09355009, 1.707506, -0.001293781, 0, 0, 0, 1, 1,
-0.09015445, 0.4288569, -0.3076901, 0, 0, 0, 1, 1,
-0.08950698, -0.3875163, -3.454256, 1, 1, 1, 1, 1,
-0.08266348, 0.08829976, -0.860965, 1, 1, 1, 1, 1,
-0.0797948, 0.2627731, -0.2120268, 1, 1, 1, 1, 1,
-0.07792334, 0.2823704, -0.2876993, 1, 1, 1, 1, 1,
-0.0761489, 0.7510778, -0.1386877, 1, 1, 1, 1, 1,
-0.07278214, 0.4111212, 0.01097686, 1, 1, 1, 1, 1,
-0.06849806, -0.246421, -2.275905, 1, 1, 1, 1, 1,
-0.06121808, -1.307383, -3.022007, 1, 1, 1, 1, 1,
-0.05940107, -0.2978685, -3.697921, 1, 1, 1, 1, 1,
-0.04732645, 0.261163, -0.06099474, 1, 1, 1, 1, 1,
-0.04704481, -0.7369321, -1.373057, 1, 1, 1, 1, 1,
-0.04565378, -0.259149, -3.175458, 1, 1, 1, 1, 1,
-0.04457885, 0.1302904, -2.307177, 1, 1, 1, 1, 1,
-0.03926421, 2.356309, -1.258204, 1, 1, 1, 1, 1,
-0.03804566, 1.705125, -1.631045, 1, 1, 1, 1, 1,
-0.03266064, 2.073686, 0.09838013, 0, 0, 1, 1, 1,
-0.03187567, -1.015739, -4.197173, 1, 0, 0, 1, 1,
-0.02795621, 0.9897327, 0.3607986, 1, 0, 0, 1, 1,
-0.02516992, -0.8985643, -3.186287, 1, 0, 0, 1, 1,
-0.02387519, -1.543052, -4.144919, 1, 0, 0, 1, 1,
-0.01969724, -0.4146958, -3.102148, 1, 0, 0, 1, 1,
-0.01808799, 1.220074, -0.6821927, 0, 0, 0, 1, 1,
-0.01594311, -1.51509, -2.531377, 0, 0, 0, 1, 1,
-0.01231641, 1.343021, 0.5709462, 0, 0, 0, 1, 1,
-0.01148752, 1.334864, -0.2250308, 0, 0, 0, 1, 1,
-0.0069109, -0.2326736, -4.276725, 0, 0, 0, 1, 1,
-0.006908699, 0.8827622, 0.7627124, 0, 0, 0, 1, 1,
-0.004689008, 1.350845, 0.5317775, 0, 0, 0, 1, 1,
-0.001832773, -1.227877, -3.196443, 1, 1, 1, 1, 1,
-0.001509286, 0.3441274, -0.3302781, 1, 1, 1, 1, 1,
0.001052424, -0.2568741, 2.172092, 1, 1, 1, 1, 1,
0.001482938, -2.39067, 3.23324, 1, 1, 1, 1, 1,
0.004575218, 0.1107163, 1.37367, 1, 1, 1, 1, 1,
0.005942706, -0.9478875, 3.21504, 1, 1, 1, 1, 1,
0.008869422, -1.070033, 2.598078, 1, 1, 1, 1, 1,
0.0109227, 1.269447, -0.08297105, 1, 1, 1, 1, 1,
0.0112807, 2.034234, 0.3161985, 1, 1, 1, 1, 1,
0.01541162, -0.8087304, 2.108466, 1, 1, 1, 1, 1,
0.02034234, -0.3829677, 2.665927, 1, 1, 1, 1, 1,
0.02600164, 0.1755198, 1.268894, 1, 1, 1, 1, 1,
0.02687783, 1.136306, 1.276643, 1, 1, 1, 1, 1,
0.03393663, -1.456633, 2.344379, 1, 1, 1, 1, 1,
0.03478343, 0.03172648, 1.891906, 1, 1, 1, 1, 1,
0.03797562, -1.244883, 2.876008, 0, 0, 1, 1, 1,
0.04392643, 0.8192157, 0.2044203, 1, 0, 0, 1, 1,
0.04530168, -1.503391, 0.9126269, 1, 0, 0, 1, 1,
0.04822052, -1.80838, 3.407917, 1, 0, 0, 1, 1,
0.04845123, -0.9922936, 2.587187, 1, 0, 0, 1, 1,
0.04919223, -0.3081039, 2.687308, 1, 0, 0, 1, 1,
0.05039454, -2.01802, 3.907858, 0, 0, 0, 1, 1,
0.05212539, -1.301253, 2.83555, 0, 0, 0, 1, 1,
0.05855004, -0.1770974, 2.645629, 0, 0, 0, 1, 1,
0.0587904, -0.3558763, 3.662179, 0, 0, 0, 1, 1,
0.05922897, 0.9085583, 1.116254, 0, 0, 0, 1, 1,
0.06325569, -0.8583016, 3.449894, 0, 0, 0, 1, 1,
0.06481667, -0.6769978, 2.842642, 0, 0, 0, 1, 1,
0.06671795, -0.1529975, 1.066021, 1, 1, 1, 1, 1,
0.07045873, 1.531333, 0.6821285, 1, 1, 1, 1, 1,
0.07414333, 0.4718998, 2.256896, 1, 1, 1, 1, 1,
0.07719693, -0.5528558, 3.564007, 1, 1, 1, 1, 1,
0.07931863, 0.6289732, 0.9986315, 1, 1, 1, 1, 1,
0.07945398, 0.2721606, -1.89753, 1, 1, 1, 1, 1,
0.07968219, -0.08681021, 1.707451, 1, 1, 1, 1, 1,
0.08005909, -0.1501743, 3.564615, 1, 1, 1, 1, 1,
0.08153695, -0.0164736, 0.2939272, 1, 1, 1, 1, 1,
0.08437591, 0.2533796, -0.3079558, 1, 1, 1, 1, 1,
0.08699107, 0.3627537, 1.851036, 1, 1, 1, 1, 1,
0.08834532, -0.2464515, 2.679798, 1, 1, 1, 1, 1,
0.09309807, -0.8137341, 1.84055, 1, 1, 1, 1, 1,
0.09416153, 1.538723, 0.5251603, 1, 1, 1, 1, 1,
0.09437844, -1.270336, 3.104949, 1, 1, 1, 1, 1,
0.09500746, 0.3631836, -0.5093896, 0, 0, 1, 1, 1,
0.09749818, -1.151663, 2.870981, 1, 0, 0, 1, 1,
0.09899546, -0.1745623, 2.446395, 1, 0, 0, 1, 1,
0.1026465, 0.9903006, -1.912548, 1, 0, 0, 1, 1,
0.1035075, -0.009699361, 1.536642, 1, 0, 0, 1, 1,
0.1070566, -1.015823, 3.330703, 1, 0, 0, 1, 1,
0.1080089, 0.2302135, 2.276146, 0, 0, 0, 1, 1,
0.1080246, 0.9194114, 0.7419708, 0, 0, 0, 1, 1,
0.1097129, -0.7545137, 1.287904, 0, 0, 0, 1, 1,
0.1146278, 0.5068169, 0.7703515, 0, 0, 0, 1, 1,
0.1181851, -0.6125445, 1.086572, 0, 0, 0, 1, 1,
0.1195723, -0.5411544, 0.009190796, 0, 0, 0, 1, 1,
0.1198158, -0.7923515, 2.93373, 0, 0, 0, 1, 1,
0.1214453, -2.010679, 2.578754, 1, 1, 1, 1, 1,
0.1253498, -2.091199, 3.049526, 1, 1, 1, 1, 1,
0.1270739, -0.3718799, 2.958927, 1, 1, 1, 1, 1,
0.1272114, 1.304085, -2.100867, 1, 1, 1, 1, 1,
0.1276778, -0.8839822, 3.684719, 1, 1, 1, 1, 1,
0.1280634, -0.6507332, 4.812503, 1, 1, 1, 1, 1,
0.1289893, 0.8850273, 2.246295, 1, 1, 1, 1, 1,
0.1290088, -0.09054783, 3.60146, 1, 1, 1, 1, 1,
0.1388842, 0.902992, 0.4725685, 1, 1, 1, 1, 1,
0.1420423, 0.6105533, 0.8628756, 1, 1, 1, 1, 1,
0.1445846, 1.728541, -0.5137562, 1, 1, 1, 1, 1,
0.1446388, -0.2553485, 1.590066, 1, 1, 1, 1, 1,
0.1543257, 0.4741033, 0.2434147, 1, 1, 1, 1, 1,
0.1548198, -1.788463, 4.402848, 1, 1, 1, 1, 1,
0.1576376, 0.5107315, -0.4342811, 1, 1, 1, 1, 1,
0.1631861, 0.5264016, -1.885082, 0, 0, 1, 1, 1,
0.1674714, -0.5112606, 1.693215, 1, 0, 0, 1, 1,
0.1689045, 1.628752, -1.089393, 1, 0, 0, 1, 1,
0.1697031, -2.483846, 2.231339, 1, 0, 0, 1, 1,
0.1735073, 1.422372, -0.1428527, 1, 0, 0, 1, 1,
0.1736667, -1.025289, 2.66211, 1, 0, 0, 1, 1,
0.1750714, 0.9863446, -2.447991, 0, 0, 0, 1, 1,
0.1763571, 0.6791481, 0.3752949, 0, 0, 0, 1, 1,
0.1775556, 0.03902798, 0.8599425, 0, 0, 0, 1, 1,
0.1776625, -1.865254, 3.941837, 0, 0, 0, 1, 1,
0.1813443, 0.1983939, 1.452808, 0, 0, 0, 1, 1,
0.186845, -0.1749789, 2.056678, 0, 0, 0, 1, 1,
0.1877473, 1.278591, 0.5593373, 0, 0, 0, 1, 1,
0.1913792, 1.398169, -0.756843, 1, 1, 1, 1, 1,
0.1914243, 0.08958761, 2.827268, 1, 1, 1, 1, 1,
0.192651, 0.5991749, 0.2405593, 1, 1, 1, 1, 1,
0.1946444, -0.4504405, 4.056984, 1, 1, 1, 1, 1,
0.1993777, -0.4853253, 2.548276, 1, 1, 1, 1, 1,
0.2050449, -0.08689676, 3.336421, 1, 1, 1, 1, 1,
0.2059137, 0.8159028, -0.09482799, 1, 1, 1, 1, 1,
0.2067966, -1.551216, 3.615944, 1, 1, 1, 1, 1,
0.2133884, -0.5109518, 2.942367, 1, 1, 1, 1, 1,
0.214821, -0.5424024, 2.846026, 1, 1, 1, 1, 1,
0.2175613, -0.8037124, 2.475557, 1, 1, 1, 1, 1,
0.2191863, 0.2896755, -0.04238245, 1, 1, 1, 1, 1,
0.2257208, 0.5959185, 0.4238496, 1, 1, 1, 1, 1,
0.2275913, 0.3825414, -0.6697736, 1, 1, 1, 1, 1,
0.2283951, -2.794803, 2.898077, 1, 1, 1, 1, 1,
0.2332034, -2.073775, 2.053864, 0, 0, 1, 1, 1,
0.2350007, 0.5431684, 1.073626, 1, 0, 0, 1, 1,
0.2350946, 0.8858188, -0.1467521, 1, 0, 0, 1, 1,
0.2368843, 0.8231537, -0.1732166, 1, 0, 0, 1, 1,
0.2370803, -0.4406226, 3.581373, 1, 0, 0, 1, 1,
0.2375849, -1.120941, 2.261758, 1, 0, 0, 1, 1,
0.2407854, 1.444862, 0.2257588, 0, 0, 0, 1, 1,
0.2470624, -0.3101754, 1.746336, 0, 0, 0, 1, 1,
0.2471081, -0.9271462, 4.226069, 0, 0, 0, 1, 1,
0.2505521, 1.355061, 0.5006961, 0, 0, 0, 1, 1,
0.2530124, -0.2345153, 3.057618, 0, 0, 0, 1, 1,
0.2543017, -1.779734, 2.188494, 0, 0, 0, 1, 1,
0.2574903, -0.1213248, 1.114109, 0, 0, 0, 1, 1,
0.2589288, -0.6154203, 1.704336, 1, 1, 1, 1, 1,
0.2644019, 0.3055016, 0.03448014, 1, 1, 1, 1, 1,
0.2679571, -0.1031545, 2.835597, 1, 1, 1, 1, 1,
0.2710118, -1.072825, 2.575365, 1, 1, 1, 1, 1,
0.2739606, -0.3391332, 2.211965, 1, 1, 1, 1, 1,
0.2771384, -0.6769852, 1.402828, 1, 1, 1, 1, 1,
0.279245, -0.7535246, 3.200204, 1, 1, 1, 1, 1,
0.295423, 0.6791894, 2.071201, 1, 1, 1, 1, 1,
0.299505, 0.6511927, -0.9751441, 1, 1, 1, 1, 1,
0.2996983, -0.2473985, 2.497016, 1, 1, 1, 1, 1,
0.3028277, 0.4578955, 1.610734, 1, 1, 1, 1, 1,
0.3080025, -1.259134, 3.04707, 1, 1, 1, 1, 1,
0.3085392, 0.2735794, 0.7380161, 1, 1, 1, 1, 1,
0.308592, -1.033217, 4.701756, 1, 1, 1, 1, 1,
0.3136103, -0.727922, 2.41421, 1, 1, 1, 1, 1,
0.3149699, 1.510363, 0.04869571, 0, 0, 1, 1, 1,
0.3155219, -0.4462924, 1.697734, 1, 0, 0, 1, 1,
0.317516, 0.4361836, 0.4950471, 1, 0, 0, 1, 1,
0.3178362, -0.2618064, 3.344135, 1, 0, 0, 1, 1,
0.3186717, 0.9663086, 1.293076, 1, 0, 0, 1, 1,
0.3239012, -0.6953368, 2.809479, 1, 0, 0, 1, 1,
0.3260024, -1.76054, 3.546951, 0, 0, 0, 1, 1,
0.3263909, -0.8517092, 2.689783, 0, 0, 0, 1, 1,
0.3292307, -0.5646985, 2.207087, 0, 0, 0, 1, 1,
0.3345046, 1.410856, 1.640577, 0, 0, 0, 1, 1,
0.3387849, -0.04131306, 0.1197233, 0, 0, 0, 1, 1,
0.3396389, 0.7366741, 0.8708426, 0, 0, 0, 1, 1,
0.3404305, -0.5639595, 2.676785, 0, 0, 0, 1, 1,
0.3404658, -0.7754658, 2.474527, 1, 1, 1, 1, 1,
0.341819, -0.5629756, 2.753076, 1, 1, 1, 1, 1,
0.3484541, -0.3903675, 0.6355814, 1, 1, 1, 1, 1,
0.348471, -0.2601039, 1.785883, 1, 1, 1, 1, 1,
0.3500705, 0.1802389, 1.478577, 1, 1, 1, 1, 1,
0.350346, -0.08098599, 2.542662, 1, 1, 1, 1, 1,
0.3516532, -0.8048493, 3.292729, 1, 1, 1, 1, 1,
0.3585896, 0.7213979, -0.02830077, 1, 1, 1, 1, 1,
0.3605501, -0.3426069, 1.355097, 1, 1, 1, 1, 1,
0.361311, -0.1964415, 0.8526786, 1, 1, 1, 1, 1,
0.364401, 0.5280468, 1.003302, 1, 1, 1, 1, 1,
0.3685708, 0.7225885, -1.763729, 1, 1, 1, 1, 1,
0.3706103, 0.4676415, -0.02366851, 1, 1, 1, 1, 1,
0.3730706, -1.089378, 2.696696, 1, 1, 1, 1, 1,
0.3799078, -0.529196, 4.2457, 1, 1, 1, 1, 1,
0.380485, 0.3683036, -0.5233452, 0, 0, 1, 1, 1,
0.3841107, -0.2875001, 2.011411, 1, 0, 0, 1, 1,
0.3854474, -0.01996771, 3.398718, 1, 0, 0, 1, 1,
0.390704, 1.820907, 0.4084249, 1, 0, 0, 1, 1,
0.3960997, 0.02917068, 0.2205126, 1, 0, 0, 1, 1,
0.3962453, -0.5949874, 2.625897, 1, 0, 0, 1, 1,
0.3967985, 1.074996, -0.4682117, 0, 0, 0, 1, 1,
0.3994705, 2.138835, 2.787428, 0, 0, 0, 1, 1,
0.4046353, -0.1222796, 1.543734, 0, 0, 0, 1, 1,
0.4076551, 0.5442422, 1.539405, 0, 0, 0, 1, 1,
0.4079158, 1.227335, 0.4184038, 0, 0, 0, 1, 1,
0.4115222, 0.1310096, 0.6529973, 0, 0, 0, 1, 1,
0.4193233, -0.4976457, 2.933659, 0, 0, 0, 1, 1,
0.4218571, -0.0853261, 0.5732384, 1, 1, 1, 1, 1,
0.4364299, 0.7786937, -0.1107169, 1, 1, 1, 1, 1,
0.4416623, -0.3176777, 1.804416, 1, 1, 1, 1, 1,
0.4446539, 1.804491, 1.911853, 1, 1, 1, 1, 1,
0.4448669, 0.7419755, 2.766024, 1, 1, 1, 1, 1,
0.4461777, 0.2454911, 0.2865197, 1, 1, 1, 1, 1,
0.4536597, 0.7199011, 0.1043649, 1, 1, 1, 1, 1,
0.4544159, 0.6433342, 0.7636033, 1, 1, 1, 1, 1,
0.4562077, -0.7022792, 1.908965, 1, 1, 1, 1, 1,
0.457425, 0.3404337, 0.7002313, 1, 1, 1, 1, 1,
0.4590903, -0.9968745, 4.335919, 1, 1, 1, 1, 1,
0.460962, -0.08268875, 2.400137, 1, 1, 1, 1, 1,
0.4641021, 1.077757, 1.173367, 1, 1, 1, 1, 1,
0.4642667, 2.637483, 0.6802918, 1, 1, 1, 1, 1,
0.4654133, -0.4136213, 2.392529, 1, 1, 1, 1, 1,
0.4660357, -0.6059011, 4.30722, 0, 0, 1, 1, 1,
0.4706303, 0.4070874, -0.02723264, 1, 0, 0, 1, 1,
0.4716687, -0.9036949, 3.353936, 1, 0, 0, 1, 1,
0.4731773, 0.4776011, 2.325548, 1, 0, 0, 1, 1,
0.4736429, -2.001188, 3.288565, 1, 0, 0, 1, 1,
0.4738106, -0.2194401, 1.057589, 1, 0, 0, 1, 1,
0.4749435, -0.7462551, 0.7550572, 0, 0, 0, 1, 1,
0.4776245, 1.180655, 0.9197673, 0, 0, 0, 1, 1,
0.4824423, 0.6222526, 0.6008329, 0, 0, 0, 1, 1,
0.4825253, -0.1675955, 0.1048191, 0, 0, 0, 1, 1,
0.4862461, -0.151826, 0.3890497, 0, 0, 0, 1, 1,
0.4908925, -0.4099405, 1.620412, 0, 0, 0, 1, 1,
0.4929785, 0.8407747, -0.4180731, 0, 0, 0, 1, 1,
0.4943877, 0.767134, -0.05561714, 1, 1, 1, 1, 1,
0.5003392, -1.068913, 2.781427, 1, 1, 1, 1, 1,
0.502856, -0.3008794, 3.818213, 1, 1, 1, 1, 1,
0.5088495, 1.020926, -0.4956841, 1, 1, 1, 1, 1,
0.5135159, -0.085921, -0.9567568, 1, 1, 1, 1, 1,
0.5170434, 1.286499, 1.474654, 1, 1, 1, 1, 1,
0.518586, -0.6098282, 1.971786, 1, 1, 1, 1, 1,
0.5191969, -0.03163146, -0.5661203, 1, 1, 1, 1, 1,
0.5213946, 1.792567, 1.469583, 1, 1, 1, 1, 1,
0.5233032, -1.972953, 2.568893, 1, 1, 1, 1, 1,
0.5276787, 0.8833178, 0.7087639, 1, 1, 1, 1, 1,
0.5316394, 0.4385688, 2.38998, 1, 1, 1, 1, 1,
0.5344127, 0.5124651, -0.03527898, 1, 1, 1, 1, 1,
0.5366067, -0.8407986, 2.427244, 1, 1, 1, 1, 1,
0.5375041, -1.146475, 3.384594, 1, 1, 1, 1, 1,
0.5411952, -1.194084, 3.375815, 0, 0, 1, 1, 1,
0.5415159, -2.445977, 5.252836, 1, 0, 0, 1, 1,
0.5447678, -1.534851, 2.836275, 1, 0, 0, 1, 1,
0.5461755, -1.211901, 3.08771, 1, 0, 0, 1, 1,
0.5461792, -1.003289, 1.087265, 1, 0, 0, 1, 1,
0.5465866, 0.6462721, -1.12076, 1, 0, 0, 1, 1,
0.5470915, -0.6953605, 3.144173, 0, 0, 0, 1, 1,
0.5513576, 0.8283002, 2.154128, 0, 0, 0, 1, 1,
0.5525915, 0.04046068, -0.5281584, 0, 0, 0, 1, 1,
0.5584833, 0.07758377, 0.817627, 0, 0, 0, 1, 1,
0.5596089, -0.8893694, 0.1729766, 0, 0, 0, 1, 1,
0.5606345, 0.8181114, -1.144549, 0, 0, 0, 1, 1,
0.5613697, -0.9432693, 1.860931, 0, 0, 0, 1, 1,
0.5632253, -1.527327, 2.108176, 1, 1, 1, 1, 1,
0.5641898, -0.4911304, 1.611381, 1, 1, 1, 1, 1,
0.5670871, -0.1425322, 2.499201, 1, 1, 1, 1, 1,
0.5702931, 0.709588, 0.2997274, 1, 1, 1, 1, 1,
0.5756469, -0.7566509, 2.926717, 1, 1, 1, 1, 1,
0.5807087, -0.07865516, 1.868114, 1, 1, 1, 1, 1,
0.5853078, 0.7769863, 0.366146, 1, 1, 1, 1, 1,
0.5860581, -0.6967248, 2.27712, 1, 1, 1, 1, 1,
0.5888475, 0.5253137, -1.721913, 1, 1, 1, 1, 1,
0.5893726, -0.7880536, 0.9371503, 1, 1, 1, 1, 1,
0.591705, 1.194158, 0.5334091, 1, 1, 1, 1, 1,
0.5993345, 1.209156, 1.001355, 1, 1, 1, 1, 1,
0.6006897, -1.013322, 1.780344, 1, 1, 1, 1, 1,
0.6011726, -0.9650615, 2.832196, 1, 1, 1, 1, 1,
0.6086124, 0.8812875, -1.447224, 1, 1, 1, 1, 1,
0.611045, 3.475302, -0.1374395, 0, 0, 1, 1, 1,
0.6187765, -0.5503471, 2.829057, 1, 0, 0, 1, 1,
0.6196026, 0.8765855, 0.08726498, 1, 0, 0, 1, 1,
0.6241329, 0.2739917, 0.5951582, 1, 0, 0, 1, 1,
0.6267507, 0.02304103, 1.851988, 1, 0, 0, 1, 1,
0.6320665, 0.1559208, 0.6664404, 1, 0, 0, 1, 1,
0.636142, -0.7966402, 1.439662, 0, 0, 0, 1, 1,
0.6365264, 0.26897, 1.652658, 0, 0, 0, 1, 1,
0.6412695, -0.6486778, 2.172832, 0, 0, 0, 1, 1,
0.646821, -1.651296, 3.227076, 0, 0, 0, 1, 1,
0.6568828, 1.492446, 0.6823144, 0, 0, 0, 1, 1,
0.6597929, 0.726284, -0.1462265, 0, 0, 0, 1, 1,
0.660783, 0.3861897, 1.12331, 0, 0, 0, 1, 1,
0.6645252, -0.5696386, 1.055834, 1, 1, 1, 1, 1,
0.6651269, -1.529275, 3.344912, 1, 1, 1, 1, 1,
0.6675217, 0.5131493, 0.1531216, 1, 1, 1, 1, 1,
0.6693625, 0.2317933, 0.8239104, 1, 1, 1, 1, 1,
0.6737033, 0.5594603, 1.304365, 1, 1, 1, 1, 1,
0.6763973, 1.400348, -0.3057535, 1, 1, 1, 1, 1,
0.6765531, -1.283176, 0.2927631, 1, 1, 1, 1, 1,
0.677462, 0.7100978, -0.3791589, 1, 1, 1, 1, 1,
0.6799331, 1.536174, 0.1694474, 1, 1, 1, 1, 1,
0.6810007, -0.8880273, 2.929686, 1, 1, 1, 1, 1,
0.685683, 0.5029247, 1.660922, 1, 1, 1, 1, 1,
0.6873733, 0.5634425, 1.232, 1, 1, 1, 1, 1,
0.6883398, 1.458951, 1.777263, 1, 1, 1, 1, 1,
0.6885626, -0.5481735, 3.090539, 1, 1, 1, 1, 1,
0.6904951, -2.035506, 4.852245, 1, 1, 1, 1, 1,
0.6979117, 0.194117, 0.6938057, 0, 0, 1, 1, 1,
0.6989803, -1.287848, 2.567971, 1, 0, 0, 1, 1,
0.7020845, -0.2767949, 1.800596, 1, 0, 0, 1, 1,
0.7024981, 1.412552, 0.3631655, 1, 0, 0, 1, 1,
0.7160261, -1.805903, 3.744249, 1, 0, 0, 1, 1,
0.7167758, 1.588058, 1.678789, 1, 0, 0, 1, 1,
0.7169895, 0.2516015, 0.7521718, 0, 0, 0, 1, 1,
0.7176172, -0.07142085, 2.823149, 0, 0, 0, 1, 1,
0.7178357, 0.95453, 0.9761153, 0, 0, 0, 1, 1,
0.7218077, -2.33483, 1.601719, 0, 0, 0, 1, 1,
0.7219902, -0.2905793, 1.059562, 0, 0, 0, 1, 1,
0.7220925, -1.102619, 2.944376, 0, 0, 0, 1, 1,
0.7267684, -0.9933348, 2.210126, 0, 0, 0, 1, 1,
0.7268455, 0.2494757, 1.037977, 1, 1, 1, 1, 1,
0.7318584, 0.4988022, 0.1670592, 1, 1, 1, 1, 1,
0.7328622, -0.9813687, 0.2825877, 1, 1, 1, 1, 1,
0.7371766, -0.9850188, 2.838728, 1, 1, 1, 1, 1,
0.7408297, 0.828132, 0.01596244, 1, 1, 1, 1, 1,
0.7424151, 0.04235746, 0.5073698, 1, 1, 1, 1, 1,
0.7431531, -0.2264009, 1.888951, 1, 1, 1, 1, 1,
0.747252, 1.32009, 0.4056084, 1, 1, 1, 1, 1,
0.7497844, -0.1977879, 3.254197, 1, 1, 1, 1, 1,
0.7517106, 0.8371881, 0.3198611, 1, 1, 1, 1, 1,
0.7527363, -0.8263423, 2.35239, 1, 1, 1, 1, 1,
0.7527888, -0.1331787, 0.8574749, 1, 1, 1, 1, 1,
0.7564036, -0.8071371, 3.174814, 1, 1, 1, 1, 1,
0.7588932, 0.938239, 0.7625816, 1, 1, 1, 1, 1,
0.760893, 0.6355751, 1.030796, 1, 1, 1, 1, 1,
0.7643341, -1.116428, 1.704258, 0, 0, 1, 1, 1,
0.7656859, 0.3774104, 1.231502, 1, 0, 0, 1, 1,
0.7669813, -0.2169953, 2.187655, 1, 0, 0, 1, 1,
0.7680746, 0.818407, 1.632874, 1, 0, 0, 1, 1,
0.7727197, 0.2498368, 2.443005, 1, 0, 0, 1, 1,
0.774869, -0.2076762, 1.110965, 1, 0, 0, 1, 1,
0.7805983, 0.8045955, 0.1309848, 0, 0, 0, 1, 1,
0.7824481, -2.109815, 3.678178, 0, 0, 0, 1, 1,
0.7825434, -0.6059899, 3.860715, 0, 0, 0, 1, 1,
0.7856075, -0.2581315, 0.151545, 0, 0, 0, 1, 1,
0.7861022, -0.6238433, 2.076294, 0, 0, 0, 1, 1,
0.7951961, -0.4346915, 1.493816, 0, 0, 0, 1, 1,
0.7992449, -0.8216158, 1.458495, 0, 0, 0, 1, 1,
0.799334, 1.817182, 0.8842831, 1, 1, 1, 1, 1,
0.8000407, 0.2096746, 1.671335, 1, 1, 1, 1, 1,
0.8006064, 0.4701701, 0.4944569, 1, 1, 1, 1, 1,
0.8026027, -0.8160729, 3.106526, 1, 1, 1, 1, 1,
0.8056536, -2.097106, 2.377835, 1, 1, 1, 1, 1,
0.8066549, -0.701372, 2.413066, 1, 1, 1, 1, 1,
0.8074754, 1.4467, 1.7451, 1, 1, 1, 1, 1,
0.8183631, -0.1681197, 0.4936495, 1, 1, 1, 1, 1,
0.8249772, 1.679919, 0.8601447, 1, 1, 1, 1, 1,
0.8267475, -0.3778103, 1.176557, 1, 1, 1, 1, 1,
0.8382753, -0.03240263, 1.044654, 1, 1, 1, 1, 1,
0.8431424, 2.39589, 1.730534, 1, 1, 1, 1, 1,
0.8448016, -0.9770064, 1.413036, 1, 1, 1, 1, 1,
0.8515775, -0.1776398, 0.4796851, 1, 1, 1, 1, 1,
0.8523833, 0.9962985, 1.781282, 1, 1, 1, 1, 1,
0.8529207, -0.967036, 2.369277, 0, 0, 1, 1, 1,
0.8535966, 1.247028, 0.2919353, 1, 0, 0, 1, 1,
0.8553515, 0.8782054, 0.3485407, 1, 0, 0, 1, 1,
0.8571944, 1.930291, 2.024933, 1, 0, 0, 1, 1,
0.8629705, 1.405631, 1.667081, 1, 0, 0, 1, 1,
0.872377, 1.263472, 0.7620423, 1, 0, 0, 1, 1,
0.8849677, 0.1358793, 2.884891, 0, 0, 0, 1, 1,
0.8870307, 0.3191033, 0.4170056, 0, 0, 0, 1, 1,
0.8901597, 0.279093, 0.1148544, 0, 0, 0, 1, 1,
0.8928746, -0.1879226, 3.43254, 0, 0, 0, 1, 1,
0.895364, 0.8500434, 1.219964, 0, 0, 0, 1, 1,
0.896877, 0.3685736, -0.5736464, 0, 0, 0, 1, 1,
0.8978685, 0.6891817, 0.1559651, 0, 0, 0, 1, 1,
0.9001092, -0.3286423, 2.898005, 1, 1, 1, 1, 1,
0.9007391, 0.3171558, 1.754999, 1, 1, 1, 1, 1,
0.901731, 1.545653, 0.5424056, 1, 1, 1, 1, 1,
0.9066333, 0.5022963, 1.190883, 1, 1, 1, 1, 1,
0.9101426, 2.058234, -0.1336649, 1, 1, 1, 1, 1,
0.9105083, 1.953739, 0.9060081, 1, 1, 1, 1, 1,
0.9108142, 0.01813171, 0.09971795, 1, 1, 1, 1, 1,
0.9121587, -0.00252947, 0.002279067, 1, 1, 1, 1, 1,
0.9130095, 0.7712907, 1.590471, 1, 1, 1, 1, 1,
0.9160268, -0.3127677, 2.336694, 1, 1, 1, 1, 1,
0.9198883, -0.8366714, 0.884551, 1, 1, 1, 1, 1,
0.9234627, 1.534981, 1.09077, 1, 1, 1, 1, 1,
0.9256403, 0.5164191, 3.304613, 1, 1, 1, 1, 1,
0.9279791, -0.1356616, 2.1365, 1, 1, 1, 1, 1,
0.9297659, 0.9663025, 0.5406689, 1, 1, 1, 1, 1,
0.929769, -1.131008, 2.480511, 0, 0, 1, 1, 1,
0.9374515, 0.3305583, 2.188615, 1, 0, 0, 1, 1,
0.9436269, 0.8676199, 1.782422, 1, 0, 0, 1, 1,
0.945053, -0.2919473, 2.773941, 1, 0, 0, 1, 1,
0.9461243, 0.2915728, 0.1965209, 1, 0, 0, 1, 1,
0.9526909, -0.6399541, 3.008502, 1, 0, 0, 1, 1,
0.9581562, 0.4622106, 2.04566, 0, 0, 0, 1, 1,
0.9583815, 0.9675586, 0.8124642, 0, 0, 0, 1, 1,
0.9630808, 0.6963267, 1.761934, 0, 0, 0, 1, 1,
0.965318, -0.1576552, 2.102329, 0, 0, 0, 1, 1,
0.9671054, -0.0067478, -0.2974633, 0, 0, 0, 1, 1,
0.9732263, -0.7568557, 1.800815, 0, 0, 0, 1, 1,
0.9810709, 0.5857911, 2.198322, 0, 0, 0, 1, 1,
0.982967, -0.9400906, 1.59762, 1, 1, 1, 1, 1,
0.9831582, 0.5999505, 1.158649, 1, 1, 1, 1, 1,
0.986166, 1.009537, -0.5680247, 1, 1, 1, 1, 1,
0.9867939, 0.6067087, 0.441375, 1, 1, 1, 1, 1,
0.9869832, 1.415749, 0.2013553, 1, 1, 1, 1, 1,
0.9895055, -0.736949, 1.169164, 1, 1, 1, 1, 1,
0.9900373, -0.8333505, 2.03122, 1, 1, 1, 1, 1,
0.9915463, 0.6292141, -0.6786383, 1, 1, 1, 1, 1,
0.9986215, 1.13143, 1.096407, 1, 1, 1, 1, 1,
1.000237, 1.385772, 2.457461, 1, 1, 1, 1, 1,
1.013777, -1.490875, 2.967787, 1, 1, 1, 1, 1,
1.01419, -0.09402002, 1.495485, 1, 1, 1, 1, 1,
1.021907, 0.01915227, 2.665238, 1, 1, 1, 1, 1,
1.02247, -2.361096, 3.590697, 1, 1, 1, 1, 1,
1.025214, 1.286372, -0.339917, 1, 1, 1, 1, 1,
1.0259, 0.07602568, 0.1368294, 0, 0, 1, 1, 1,
1.047057, 0.0981258, 1.320407, 1, 0, 0, 1, 1,
1.061494, 1.759196, 1.273259, 1, 0, 0, 1, 1,
1.062948, -0.3711813, 1.714927, 1, 0, 0, 1, 1,
1.068596, -1.395003, 2.773297, 1, 0, 0, 1, 1,
1.070092, 1.044819, 3.419737, 1, 0, 0, 1, 1,
1.076969, 1.003255, 0.3310845, 0, 0, 0, 1, 1,
1.083379, 0.6067325, 2.099173, 0, 0, 0, 1, 1,
1.083657, -0.7257172, 1.23767, 0, 0, 0, 1, 1,
1.090427, -0.8577436, 4.386014, 0, 0, 0, 1, 1,
1.091713, 1.240176, -0.02222658, 0, 0, 0, 1, 1,
1.091993, 0.4523578, 1.190276, 0, 0, 0, 1, 1,
1.093585, 0.9675192, 1.366503, 0, 0, 0, 1, 1,
1.100143, 0.277285, 2.031296, 1, 1, 1, 1, 1,
1.107315, 0.985318, 1.039507, 1, 1, 1, 1, 1,
1.109183, -0.9499984, 1.75084, 1, 1, 1, 1, 1,
1.109621, 0.1989753, 1.437859, 1, 1, 1, 1, 1,
1.114771, 0.4959081, 0.7471693, 1, 1, 1, 1, 1,
1.126457, -0.3454538, 2.988499, 1, 1, 1, 1, 1,
1.128631, -0.5673751, 3.176031, 1, 1, 1, 1, 1,
1.137443, -1.301195, 2.378056, 1, 1, 1, 1, 1,
1.138349, -0.1011553, 3.925244, 1, 1, 1, 1, 1,
1.143912, 0.7598852, 2.139398, 1, 1, 1, 1, 1,
1.146231, -0.7049108, 1.005266, 1, 1, 1, 1, 1,
1.148014, 0.6371483, 1.057155, 1, 1, 1, 1, 1,
1.15042, 0.3812477, 0.623023, 1, 1, 1, 1, 1,
1.161244, -0.7896658, 3.709497, 1, 1, 1, 1, 1,
1.165848, -0.6561656, 2.480141, 1, 1, 1, 1, 1,
1.170375, 0.7987947, 0.5033031, 0, 0, 1, 1, 1,
1.185427, 1.584164, 0.4254966, 1, 0, 0, 1, 1,
1.191151, -0.8543513, 3.587741, 1, 0, 0, 1, 1,
1.199481, -0.509932, 2.320036, 1, 0, 0, 1, 1,
1.202988, -1.901298, 2.28253, 1, 0, 0, 1, 1,
1.204993, -2.131546, 2.698054, 1, 0, 0, 1, 1,
1.211431, 1.091663, -1.028049, 0, 0, 0, 1, 1,
1.212048, 0.2217595, 2.078072, 0, 0, 0, 1, 1,
1.217784, 0.2918081, 2.153979, 0, 0, 0, 1, 1,
1.229402, 1.020615, 0.4666023, 0, 0, 0, 1, 1,
1.238847, -0.4556381, 2.878909, 0, 0, 0, 1, 1,
1.248898, -0.9528795, 1.705486, 0, 0, 0, 1, 1,
1.250226, 0.04788142, 1.553937, 0, 0, 0, 1, 1,
1.251709, -0.02045925, 3.424166, 1, 1, 1, 1, 1,
1.274185, 1.117437, 1.938193, 1, 1, 1, 1, 1,
1.276509, 1.052694, 1.452596, 1, 1, 1, 1, 1,
1.306199, -2.047389, 1.258171, 1, 1, 1, 1, 1,
1.311495, -1.03496, 1.055916, 1, 1, 1, 1, 1,
1.315077, -0.3714496, 0.0330813, 1, 1, 1, 1, 1,
1.318295, -0.2025975, 1.806828, 1, 1, 1, 1, 1,
1.322992, -0.210067, 2.115285, 1, 1, 1, 1, 1,
1.329436, 0.07313678, 1.502542, 1, 1, 1, 1, 1,
1.334288, 0.6343194, 1.246225, 1, 1, 1, 1, 1,
1.34084, 0.9910541, 0.7736005, 1, 1, 1, 1, 1,
1.356351, 0.1657024, 1.497275, 1, 1, 1, 1, 1,
1.363046, 0.3921338, 0.8034263, 1, 1, 1, 1, 1,
1.3646, 0.4667536, 1.476064, 1, 1, 1, 1, 1,
1.371265, -0.2966321, 3.128255, 1, 1, 1, 1, 1,
1.379714, 0.4157471, 1.743291, 0, 0, 1, 1, 1,
1.388288, 0.2426515, 2.399171, 1, 0, 0, 1, 1,
1.39213, -0.7410761, 4.371119, 1, 0, 0, 1, 1,
1.394324, 1.006005, 1.0967, 1, 0, 0, 1, 1,
1.396095, 0.04455984, 0.8456452, 1, 0, 0, 1, 1,
1.399856, 0.9175731, -0.2099196, 1, 0, 0, 1, 1,
1.417385, -0.4654219, 1.183503, 0, 0, 0, 1, 1,
1.4351, 0.4778855, 1.815434, 0, 0, 0, 1, 1,
1.435933, 1.249953, 1.226951, 0, 0, 0, 1, 1,
1.441749, 0.814311, 0.3790963, 0, 0, 0, 1, 1,
1.450826, -0.05942744, 1.053779, 0, 0, 0, 1, 1,
1.457938, 0.20269, 0.9093368, 0, 0, 0, 1, 1,
1.458495, 0.5448159, 0.9000767, 0, 0, 0, 1, 1,
1.458603, 0.4303609, 1.659726, 1, 1, 1, 1, 1,
1.460396, -0.04064216, 0.8439096, 1, 1, 1, 1, 1,
1.477788, -1.275079, 2.184199, 1, 1, 1, 1, 1,
1.477839, -0.5237377, 2.266111, 1, 1, 1, 1, 1,
1.479455, -0.4026008, 0.1340682, 1, 1, 1, 1, 1,
1.512347, 0.406393, -0.9672337, 1, 1, 1, 1, 1,
1.515274, -0.8108943, 2.408485, 1, 1, 1, 1, 1,
1.52787, 0.6484019, -0.9127915, 1, 1, 1, 1, 1,
1.537726, -0.2109233, 1.018773, 1, 1, 1, 1, 1,
1.553061, -0.455818, 3.369103, 1, 1, 1, 1, 1,
1.56243, 0.6611714, 2.777545, 1, 1, 1, 1, 1,
1.570454, 1.048579, 0.6814778, 1, 1, 1, 1, 1,
1.577047, 0.09719242, 1.707133, 1, 1, 1, 1, 1,
1.578451, 1.704819, 0.08008211, 1, 1, 1, 1, 1,
1.584123, -0.7639377, 1.725863, 1, 1, 1, 1, 1,
1.589433, 1.372246, 1.125507, 0, 0, 1, 1, 1,
1.600917, -0.3417207, 3.302814, 1, 0, 0, 1, 1,
1.601572, -0.9554488, 1.111578, 1, 0, 0, 1, 1,
1.606603, -0.9754709, 3.20918, 1, 0, 0, 1, 1,
1.616739, -0.4925732, -0.5899789, 1, 0, 0, 1, 1,
1.632309, 0.445343, 1.415977, 1, 0, 0, 1, 1,
1.636832, 0.364879, 3.64414, 0, 0, 0, 1, 1,
1.64694, 0.3417549, -0.6325878, 0, 0, 0, 1, 1,
1.653176, -0.5963302, 4.87116, 0, 0, 0, 1, 1,
1.683617, 0.9240365, 1.739079, 0, 0, 0, 1, 1,
1.715359, -0.5489835, 2.216058, 0, 0, 0, 1, 1,
1.72949, 0.3293821, 1.041276, 0, 0, 0, 1, 1,
1.731497, 1.334027, 2.361745, 0, 0, 0, 1, 1,
1.741573, -0.4829392, 1.528615, 1, 1, 1, 1, 1,
1.743184, -0.113596, 1.74821, 1, 1, 1, 1, 1,
1.751475, 0.08600105, 1.255465, 1, 1, 1, 1, 1,
1.775326, -0.0708563, 1.554935, 1, 1, 1, 1, 1,
1.814103, 0.3404102, 1.906043, 1, 1, 1, 1, 1,
1.817422, 2.463304, 2.02442, 1, 1, 1, 1, 1,
1.883304, -0.9853066, 1.863075, 1, 1, 1, 1, 1,
1.908607, -0.5531042, 2.110086, 1, 1, 1, 1, 1,
1.943212, -0.2992311, 2.62121, 1, 1, 1, 1, 1,
2.012795, -0.9076839, 1.552935, 1, 1, 1, 1, 1,
2.019697, -1.533104, -0.7211218, 1, 1, 1, 1, 1,
2.040182, -0.1208304, 1.941323, 1, 1, 1, 1, 1,
2.064677, 1.276595, -0.7546191, 1, 1, 1, 1, 1,
2.079374, 0.7183717, 0.6292364, 1, 1, 1, 1, 1,
2.079623, 0.3816863, 0.1085745, 1, 1, 1, 1, 1,
2.100402, 0.2835332, 2.559655, 0, 0, 1, 1, 1,
2.117997, -0.0860901, 2.322567, 1, 0, 0, 1, 1,
2.133685, -0.8284035, 1.592847, 1, 0, 0, 1, 1,
2.135849, -0.4115013, 0.9350961, 1, 0, 0, 1, 1,
2.149332, 1.015344, 1.18033, 1, 0, 0, 1, 1,
2.176437, 0.8337034, 1.01015, 1, 0, 0, 1, 1,
2.180957, -0.3311526, 1.853938, 0, 0, 0, 1, 1,
2.227309, 1.240313, 0.4396804, 0, 0, 0, 1, 1,
2.251952, -0.6201448, 3.654819, 0, 0, 0, 1, 1,
2.252868, -0.6250775, 2.577907, 0, 0, 0, 1, 1,
2.269834, -0.9017594, 0.951291, 0, 0, 0, 1, 1,
2.347329, 0.5256855, 1.69374, 0, 0, 0, 1, 1,
2.352998, 0.02676509, 1.540717, 0, 0, 0, 1, 1,
2.386228, 2.354219, -0.146512, 1, 1, 1, 1, 1,
2.418426, -0.538761, 0.3585134, 1, 1, 1, 1, 1,
2.446711, 0.1193375, 0.9255882, 1, 1, 1, 1, 1,
2.582103, -0.8842834, 1.870204, 1, 1, 1, 1, 1,
2.713543, -0.4248407, 1.385441, 1, 1, 1, 1, 1,
2.806283, -0.3397601, 0.4672751, 1, 1, 1, 1, 1,
3.414297, -0.8531564, 2.776905, 1, 1, 1, 1, 1
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
var radius = 9.723806;
var distance = 34.15446;
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
mvMatrix.translate( -0.1565742, -0.2034652, 0.2098024 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15446);
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
