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
-3.410435, 1.20266, -2.560078, 1, 0, 0, 1,
-3.341159, 1.448658, -0.743077, 1, 0.007843138, 0, 1,
-3.037894, 1.313285, -2.194607, 1, 0.01176471, 0, 1,
-2.961768, -0.7729101, -3.635842, 1, 0.01960784, 0, 1,
-2.828311, 1.681539, -2.006755, 1, 0.02352941, 0, 1,
-2.783024, -2.209437, -1.476341, 1, 0.03137255, 0, 1,
-2.551143, 0.6911212, -2.273099, 1, 0.03529412, 0, 1,
-2.543052, -0.2263229, -1.530143, 1, 0.04313726, 0, 1,
-2.495927, 0.4641982, -1.731461, 1, 0.04705882, 0, 1,
-2.448771, 1.071837, -1.052235, 1, 0.05490196, 0, 1,
-2.430769, 0.01821407, 0.4845614, 1, 0.05882353, 0, 1,
-2.427489, -0.5041552, -1.47594, 1, 0.06666667, 0, 1,
-2.374388, -0.6980374, -2.07603, 1, 0.07058824, 0, 1,
-2.301157, -2.040743, -3.095556, 1, 0.07843138, 0, 1,
-2.179785, -0.2449151, -1.687011, 1, 0.08235294, 0, 1,
-2.169955, 0.7651657, 0.3671866, 1, 0.09019608, 0, 1,
-2.092762, 0.4735491, -0.9689878, 1, 0.09411765, 0, 1,
-2.083671, -0.1622255, -1.563852, 1, 0.1019608, 0, 1,
-2.03734, 1.050815, -1.622936, 1, 0.1098039, 0, 1,
-2.035999, -0.109375, -1.816674, 1, 0.1137255, 0, 1,
-1.984569, -1.039092, -1.220717, 1, 0.1215686, 0, 1,
-1.9808, -1.922003, -0.8422045, 1, 0.1254902, 0, 1,
-1.958288, -0.2817265, 0.8225849, 1, 0.1333333, 0, 1,
-1.945912, -1.316656, -1.167723, 1, 0.1372549, 0, 1,
-1.930874, -1.308853, -3.256362, 1, 0.145098, 0, 1,
-1.925548, 0.186324, -2.747587, 1, 0.1490196, 0, 1,
-1.923285, -0.5961795, -0.5006295, 1, 0.1568628, 0, 1,
-1.886528, -0.3336664, -1.94978, 1, 0.1607843, 0, 1,
-1.884563, -0.03549728, -1.848315, 1, 0.1686275, 0, 1,
-1.883587, 0.9579518, 0.1901728, 1, 0.172549, 0, 1,
-1.844772, 0.005831962, -2.446339, 1, 0.1803922, 0, 1,
-1.83981, -0.5761275, -1.409404, 1, 0.1843137, 0, 1,
-1.831185, -0.8433322, -2.089614, 1, 0.1921569, 0, 1,
-1.798918, 0.4220078, -2.99795, 1, 0.1960784, 0, 1,
-1.785835, -0.499445, -0.7215609, 1, 0.2039216, 0, 1,
-1.784685, -0.09442082, -0.801012, 1, 0.2117647, 0, 1,
-1.772493, 0.9354498, -0.1684581, 1, 0.2156863, 0, 1,
-1.770772, -0.113439, -1.211812, 1, 0.2235294, 0, 1,
-1.769718, -1.115936, -1.430551, 1, 0.227451, 0, 1,
-1.767698, 0.2525666, -0.0540022, 1, 0.2352941, 0, 1,
-1.762397, -2.013043, -0.7584042, 1, 0.2392157, 0, 1,
-1.724033, 0.7440295, -1.014926, 1, 0.2470588, 0, 1,
-1.721778, -0.09955011, -3.25139, 1, 0.2509804, 0, 1,
-1.714329, -0.0387607, -1.941422, 1, 0.2588235, 0, 1,
-1.70032, 1.563591, -1.03799, 1, 0.2627451, 0, 1,
-1.684102, 1.742966, -2.181168, 1, 0.2705882, 0, 1,
-1.680171, 1.128525, -1.016995, 1, 0.2745098, 0, 1,
-1.670552, -2.221603, -2.759663, 1, 0.282353, 0, 1,
-1.667773, -0.07221411, -2.321105, 1, 0.2862745, 0, 1,
-1.65421, -0.5121987, -0.1890052, 1, 0.2941177, 0, 1,
-1.653057, 1.359954, -2.267458, 1, 0.3019608, 0, 1,
-1.635924, -0.189166, -0.6132579, 1, 0.3058824, 0, 1,
-1.62318, -1.818068, -2.227349, 1, 0.3137255, 0, 1,
-1.616602, 0.1893942, -0.9881729, 1, 0.3176471, 0, 1,
-1.612329, 0.1672555, -1.226597, 1, 0.3254902, 0, 1,
-1.59494, -0.212419, -1.800659, 1, 0.3294118, 0, 1,
-1.589573, -0.6762242, -1.627042, 1, 0.3372549, 0, 1,
-1.579529, -0.762336, -2.925016, 1, 0.3411765, 0, 1,
-1.578806, -1.160303, -0.166994, 1, 0.3490196, 0, 1,
-1.577256, -0.9523649, -3.39516, 1, 0.3529412, 0, 1,
-1.57465, -1.303542, -3.193814, 1, 0.3607843, 0, 1,
-1.556691, -1.2017, -3.253934, 1, 0.3647059, 0, 1,
-1.555105, 0.05070345, -0.9492881, 1, 0.372549, 0, 1,
-1.544932, -0.6589971, -2.087384, 1, 0.3764706, 0, 1,
-1.541285, 1.238424, 0.5452566, 1, 0.3843137, 0, 1,
-1.524006, -0.7600647, -2.821356, 1, 0.3882353, 0, 1,
-1.51318, 0.9777853, -0.1326418, 1, 0.3960784, 0, 1,
-1.500196, -1.086936, -2.733471, 1, 0.4039216, 0, 1,
-1.47246, 0.7838386, -0.6662464, 1, 0.4078431, 0, 1,
-1.472405, 0.482168, -1.717775, 1, 0.4156863, 0, 1,
-1.471586, 1.256139, -0.1960478, 1, 0.4196078, 0, 1,
-1.469048, -0.553863, -1.257898, 1, 0.427451, 0, 1,
-1.448899, -0.3940165, -2.197511, 1, 0.4313726, 0, 1,
-1.438632, 0.6306877, 0.3256907, 1, 0.4392157, 0, 1,
-1.438585, 0.9212826, 0.9057226, 1, 0.4431373, 0, 1,
-1.421395, -0.327926, -2.095122, 1, 0.4509804, 0, 1,
-1.407753, 1.119144, -0.4587698, 1, 0.454902, 0, 1,
-1.39147, -1.073944, -2.80667, 1, 0.4627451, 0, 1,
-1.38922, 0.6964817, -2.003175, 1, 0.4666667, 0, 1,
-1.387029, -1.368812, -3.111607, 1, 0.4745098, 0, 1,
-1.386014, -2.01868, -1.694611, 1, 0.4784314, 0, 1,
-1.382442, -1.159634, -0.84785, 1, 0.4862745, 0, 1,
-1.373562, -1.153501, -3.042509, 1, 0.4901961, 0, 1,
-1.361495, -0.6955917, -1.53069, 1, 0.4980392, 0, 1,
-1.359929, 0.4635903, -0.4962679, 1, 0.5058824, 0, 1,
-1.356601, 0.08059555, 0.8947123, 1, 0.509804, 0, 1,
-1.353539, -0.7726463, -1.989652, 1, 0.5176471, 0, 1,
-1.349534, -0.4818756, -1.569222, 1, 0.5215687, 0, 1,
-1.336072, -0.1696416, -1.095072, 1, 0.5294118, 0, 1,
-1.335765, -0.7816442, -0.5747448, 1, 0.5333334, 0, 1,
-1.323504, 0.9721434, -1.980473, 1, 0.5411765, 0, 1,
-1.302962, -0.3793536, -2.806991, 1, 0.5450981, 0, 1,
-1.294165, -2.594577, -0.6225196, 1, 0.5529412, 0, 1,
-1.293561, -1.446237, -3.585328, 1, 0.5568628, 0, 1,
-1.285663, 0.5720515, -1.063223, 1, 0.5647059, 0, 1,
-1.28168, 1.603629, -0.6984439, 1, 0.5686275, 0, 1,
-1.278783, 0.1798494, -1.158636, 1, 0.5764706, 0, 1,
-1.273795, 0.7399436, -2.053038, 1, 0.5803922, 0, 1,
-1.272815, 0.1491712, -0.6466029, 1, 0.5882353, 0, 1,
-1.26963, 0.4786612, -1.90603, 1, 0.5921569, 0, 1,
-1.266501, -0.4894938, -1.931189, 1, 0.6, 0, 1,
-1.262071, -0.4113693, -1.72414, 1, 0.6078432, 0, 1,
-1.259902, -0.9954276, -2.019406, 1, 0.6117647, 0, 1,
-1.250618, 0.2040895, -3.005987, 1, 0.6196079, 0, 1,
-1.242672, 1.060105, -1.120225, 1, 0.6235294, 0, 1,
-1.240113, -0.08019805, -1.099323, 1, 0.6313726, 0, 1,
-1.238361, -1.260071, -3.060006, 1, 0.6352941, 0, 1,
-1.235484, -0.419774, -1.201085, 1, 0.6431373, 0, 1,
-1.231478, 0.1601681, -1.930258, 1, 0.6470588, 0, 1,
-1.220981, -0.5584873, -2.462615, 1, 0.654902, 0, 1,
-1.206294, -0.02992658, -1.241964, 1, 0.6588235, 0, 1,
-1.20462, -0.9219723, -2.854488, 1, 0.6666667, 0, 1,
-1.198181, -1.28694, -2.19555, 1, 0.6705883, 0, 1,
-1.197067, -0.132149, -1.381731, 1, 0.6784314, 0, 1,
-1.179228, 1.341403, -0.7166559, 1, 0.682353, 0, 1,
-1.173499, -0.9714404, -1.976978, 1, 0.6901961, 0, 1,
-1.171586, 0.2248272, -0.9304951, 1, 0.6941177, 0, 1,
-1.164106, -0.9485898, -3.495011, 1, 0.7019608, 0, 1,
-1.154754, -0.9770508, -1.687942, 1, 0.7098039, 0, 1,
-1.143547, -0.02815126, -0.7215887, 1, 0.7137255, 0, 1,
-1.133816, -1.931387, -2.295303, 1, 0.7215686, 0, 1,
-1.131242, -0.05701704, -0.9395896, 1, 0.7254902, 0, 1,
-1.130753, -0.6736721, -0.4527099, 1, 0.7333333, 0, 1,
-1.129997, 0.3176479, -2.18362, 1, 0.7372549, 0, 1,
-1.125682, 0.3942327, -1.652862, 1, 0.7450981, 0, 1,
-1.11634, 0.3700804, -2.125782, 1, 0.7490196, 0, 1,
-1.113244, -0.4604923, -3.239129, 1, 0.7568628, 0, 1,
-1.101236, -0.7935261, -1.510221, 1, 0.7607843, 0, 1,
-1.084623, 0.03495884, -2.623687, 1, 0.7686275, 0, 1,
-1.082549, -0.2492068, -2.824036, 1, 0.772549, 0, 1,
-1.073344, -2.393299, -1.171728, 1, 0.7803922, 0, 1,
-1.066484, -2.054079, -2.599837, 1, 0.7843137, 0, 1,
-1.066131, -0.1163108, -2.707908, 1, 0.7921569, 0, 1,
-1.062492, -0.3683566, -3.960167, 1, 0.7960784, 0, 1,
-1.059661, -0.08030174, -0.964655, 1, 0.8039216, 0, 1,
-1.053943, -2.235993, -3.458668, 1, 0.8117647, 0, 1,
-1.045233, -0.6809871, -3.538544, 1, 0.8156863, 0, 1,
-1.044339, 0.103299, -2.598987, 1, 0.8235294, 0, 1,
-1.043798, -0.5976355, -2.928807, 1, 0.827451, 0, 1,
-1.043561, -0.4292084, 0.8409637, 1, 0.8352941, 0, 1,
-1.043118, 0.6453513, -1.065688, 1, 0.8392157, 0, 1,
-1.038332, -0.1140172, -3.090125, 1, 0.8470588, 0, 1,
-1.031593, 1.541161, -1.281465, 1, 0.8509804, 0, 1,
-1.031325, 0.04251171, -2.039813, 1, 0.8588235, 0, 1,
-1.028093, 0.7436431, -1.094166, 1, 0.8627451, 0, 1,
-1.0183, 0.3898554, -3.493432, 1, 0.8705882, 0, 1,
-1.017247, -0.6064715, -1.815467, 1, 0.8745098, 0, 1,
-1.010802, 0.9071442, -0.6873154, 1, 0.8823529, 0, 1,
-1.00178, 0.8329099, -1.793099, 1, 0.8862745, 0, 1,
-0.9976749, -1.041471, -2.086092, 1, 0.8941177, 0, 1,
-0.9776629, -0.5008067, -0.8559746, 1, 0.8980392, 0, 1,
-0.9762444, -1.420695, -2.186072, 1, 0.9058824, 0, 1,
-0.9738662, -0.314564, -1.311084, 1, 0.9137255, 0, 1,
-0.9737992, -0.4762916, -2.026597, 1, 0.9176471, 0, 1,
-0.9682554, 0.7459747, -2.221575, 1, 0.9254902, 0, 1,
-0.9675336, -1.816332, -2.308208, 1, 0.9294118, 0, 1,
-0.9638609, -0.09581102, -1.653876, 1, 0.9372549, 0, 1,
-0.9627413, 0.7884042, -0.2679739, 1, 0.9411765, 0, 1,
-0.9607873, 0.8156785, 0.05599699, 1, 0.9490196, 0, 1,
-0.9589636, -1.099148, -1.330502, 1, 0.9529412, 0, 1,
-0.9586886, 0.4717132, 0.1273201, 1, 0.9607843, 0, 1,
-0.9575889, -0.7120656, -4.386992, 1, 0.9647059, 0, 1,
-0.9559197, -0.6102157, -2.002985, 1, 0.972549, 0, 1,
-0.9517054, 0.2881526, -2.186104, 1, 0.9764706, 0, 1,
-0.9476858, 0.9712541, -1.08375, 1, 0.9843137, 0, 1,
-0.9463351, 0.9585077, -0.1751969, 1, 0.9882353, 0, 1,
-0.9423313, -1.066256, -2.086221, 1, 0.9960784, 0, 1,
-0.9415532, 0.4544891, -1.783363, 0.9960784, 1, 0, 1,
-0.940739, 1.465643, -0.838336, 0.9921569, 1, 0, 1,
-0.9393514, 0.05173205, -0.3586038, 0.9843137, 1, 0, 1,
-0.9343484, -1.172068, -2.448449, 0.9803922, 1, 0, 1,
-0.9328486, 0.4750175, 0.7418966, 0.972549, 1, 0, 1,
-0.932672, 1.341357, 0.8590921, 0.9686275, 1, 0, 1,
-0.9282069, 0.646431, -1.325348, 0.9607843, 1, 0, 1,
-0.925698, -0.974674, -2.760899, 0.9568627, 1, 0, 1,
-0.921527, -1.034251, -3.176276, 0.9490196, 1, 0, 1,
-0.9179488, 0.7234825, -0.3982539, 0.945098, 1, 0, 1,
-0.906615, 0.02933796, -1.055213, 0.9372549, 1, 0, 1,
-0.9033409, 0.5860689, -2.358944, 0.9333333, 1, 0, 1,
-0.9027822, -0.5078487, -0.8710063, 0.9254902, 1, 0, 1,
-0.9018086, 1.450275, 1.028221, 0.9215686, 1, 0, 1,
-0.89898, -0.5885268, -2.888294, 0.9137255, 1, 0, 1,
-0.8967026, -1.965806, -3.97842, 0.9098039, 1, 0, 1,
-0.8953325, 0.4990547, -1.728569, 0.9019608, 1, 0, 1,
-0.8921563, -0.07701343, -1.999928, 0.8941177, 1, 0, 1,
-0.8733929, -1.352885, -4.08201, 0.8901961, 1, 0, 1,
-0.8697446, 0.05315514, -0.8235415, 0.8823529, 1, 0, 1,
-0.8694279, -0.7975533, -0.08020109, 0.8784314, 1, 0, 1,
-0.8668481, 0.6022195, -1.837359, 0.8705882, 1, 0, 1,
-0.8635556, 0.08293761, -1.827309, 0.8666667, 1, 0, 1,
-0.8541715, 1.184682, -1.528509, 0.8588235, 1, 0, 1,
-0.8403619, 0.1535122, -2.533849, 0.854902, 1, 0, 1,
-0.8402147, 0.4331359, -0.1312196, 0.8470588, 1, 0, 1,
-0.8374884, 1.351816, -0.08678862, 0.8431373, 1, 0, 1,
-0.8335558, 0.1568497, -0.5588517, 0.8352941, 1, 0, 1,
-0.8316659, 1.304171, -0.9753155, 0.8313726, 1, 0, 1,
-0.82784, 0.09262195, -3.076611, 0.8235294, 1, 0, 1,
-0.8222777, -0.8974395, -1.39206, 0.8196079, 1, 0, 1,
-0.8160104, -1.492032, -2.898899, 0.8117647, 1, 0, 1,
-0.8132458, 0.08296091, -2.156441, 0.8078431, 1, 0, 1,
-0.8121815, -0.4011383, -3.766962, 0.8, 1, 0, 1,
-0.8116314, 1.889592, -0.6604151, 0.7921569, 1, 0, 1,
-0.8088765, -1.100037, -2.097688, 0.7882353, 1, 0, 1,
-0.8058398, -1.646123, -2.263619, 0.7803922, 1, 0, 1,
-0.7907618, 0.8537178, -0.100991, 0.7764706, 1, 0, 1,
-0.7888598, -0.2675958, -3.731458, 0.7686275, 1, 0, 1,
-0.7865559, -1.302715, -3.555452, 0.7647059, 1, 0, 1,
-0.7825162, -0.8605508, -1.507885, 0.7568628, 1, 0, 1,
-0.7744601, -1.397801, -1.963976, 0.7529412, 1, 0, 1,
-0.7706996, 0.5919068, -3.273603, 0.7450981, 1, 0, 1,
-0.7634294, -0.6199471, -1.006162, 0.7411765, 1, 0, 1,
-0.7630761, -0.5968978, -1.983337, 0.7333333, 1, 0, 1,
-0.7586542, -0.9072345, -3.016027, 0.7294118, 1, 0, 1,
-0.7550856, 0.2354381, -0.3198015, 0.7215686, 1, 0, 1,
-0.7535821, -1.367063, -4.454892, 0.7176471, 1, 0, 1,
-0.7510673, 0.08793768, -1.257334, 0.7098039, 1, 0, 1,
-0.7489313, 0.04040391, -1.416865, 0.7058824, 1, 0, 1,
-0.7468101, 0.1066993, -0.7635677, 0.6980392, 1, 0, 1,
-0.7436423, -0.09771869, -3.317901, 0.6901961, 1, 0, 1,
-0.7399589, 1.348923, 0.3522872, 0.6862745, 1, 0, 1,
-0.7382556, 0.1751129, -3.035476, 0.6784314, 1, 0, 1,
-0.7352506, -0.5361066, -2.525004, 0.6745098, 1, 0, 1,
-0.7279832, -0.9144777, -2.991955, 0.6666667, 1, 0, 1,
-0.7274987, -0.7541535, -1.520312, 0.6627451, 1, 0, 1,
-0.725236, -1.887439, -2.937993, 0.654902, 1, 0, 1,
-0.721859, 0.6376743, 0.6831087, 0.6509804, 1, 0, 1,
-0.7215573, 0.5166277, 0.1388206, 0.6431373, 1, 0, 1,
-0.7194214, -0.5668864, -3.279886, 0.6392157, 1, 0, 1,
-0.7189382, 0.9910764, -0.579307, 0.6313726, 1, 0, 1,
-0.7130736, -0.3441903, -1.6815, 0.627451, 1, 0, 1,
-0.7128073, 0.08656011, -2.15368, 0.6196079, 1, 0, 1,
-0.710443, 0.571153, -0.5639302, 0.6156863, 1, 0, 1,
-0.7064253, 1.087775, -0.8300664, 0.6078432, 1, 0, 1,
-0.7028928, -0.1644035, -1.609693, 0.6039216, 1, 0, 1,
-0.7028353, 0.05320877, -1.037857, 0.5960785, 1, 0, 1,
-0.6984134, 0.4743884, -0.1555673, 0.5882353, 1, 0, 1,
-0.6980052, -0.1380385, -1.666197, 0.5843138, 1, 0, 1,
-0.6975836, 0.4123892, -0.8319054, 0.5764706, 1, 0, 1,
-0.6966818, 0.5787508, -1.651468, 0.572549, 1, 0, 1,
-0.6952478, -1.473395, -2.184888, 0.5647059, 1, 0, 1,
-0.6894031, 0.9727824, 0.2422369, 0.5607843, 1, 0, 1,
-0.6871127, 0.1522799, -1.444987, 0.5529412, 1, 0, 1,
-0.6843328, -0.2012464, -3.717212, 0.5490196, 1, 0, 1,
-0.6838455, 1.206691, -0.5620767, 0.5411765, 1, 0, 1,
-0.6801735, -0.6956443, -3.655649, 0.5372549, 1, 0, 1,
-0.6687769, 0.8056668, 0.282554, 0.5294118, 1, 0, 1,
-0.6671656, -0.07203634, -1.876295, 0.5254902, 1, 0, 1,
-0.666612, -0.4439089, -1.625974, 0.5176471, 1, 0, 1,
-0.6663877, 0.1315678, -0.6534135, 0.5137255, 1, 0, 1,
-0.665095, 0.6677026, -0.8222685, 0.5058824, 1, 0, 1,
-0.6597546, 0.4827968, -0.08110932, 0.5019608, 1, 0, 1,
-0.6575283, -0.7378256, -3.137724, 0.4941176, 1, 0, 1,
-0.6502948, 0.335628, -2.099714, 0.4862745, 1, 0, 1,
-0.6409519, -0.4781813, -3.904885, 0.4823529, 1, 0, 1,
-0.6359853, 0.8571869, -0.533644, 0.4745098, 1, 0, 1,
-0.6346371, 1.196128, -1.916017, 0.4705882, 1, 0, 1,
-0.6244581, -1.384201, -2.898239, 0.4627451, 1, 0, 1,
-0.6236888, 0.3575698, 0.7424495, 0.4588235, 1, 0, 1,
-0.6155692, 0.2633793, -1.071621, 0.4509804, 1, 0, 1,
-0.6139343, 2.209301, -1.697866, 0.4470588, 1, 0, 1,
-0.6083293, 0.9756405, -0.5686954, 0.4392157, 1, 0, 1,
-0.6059601, -0.1114263, -1.367758, 0.4352941, 1, 0, 1,
-0.6057353, -1.11035, -2.338162, 0.427451, 1, 0, 1,
-0.6042939, -2.012522, -2.180942, 0.4235294, 1, 0, 1,
-0.5980269, 0.2336839, -0.9009529, 0.4156863, 1, 0, 1,
-0.5976124, -0.4351209, -0.8984709, 0.4117647, 1, 0, 1,
-0.5903267, -0.1049701, -0.7845066, 0.4039216, 1, 0, 1,
-0.5901201, -1.395469, -1.853822, 0.3960784, 1, 0, 1,
-0.5826555, 1.518957, -1.287407, 0.3921569, 1, 0, 1,
-0.5824252, -0.9916834, -1.849015, 0.3843137, 1, 0, 1,
-0.5760914, 0.2285715, -1.117485, 0.3803922, 1, 0, 1,
-0.5744886, 0.3035824, -2.003307, 0.372549, 1, 0, 1,
-0.5675557, -0.5939887, -1.955102, 0.3686275, 1, 0, 1,
-0.5672476, 1.112291, -0.07323084, 0.3607843, 1, 0, 1,
-0.5600489, 0.7693859, -2.119522, 0.3568628, 1, 0, 1,
-0.5599751, 0.9766479, -1.099709, 0.3490196, 1, 0, 1,
-0.5534345, -0.3713241, -1.162137, 0.345098, 1, 0, 1,
-0.5519851, -1.24189, -3.204802, 0.3372549, 1, 0, 1,
-0.5425589, -0.9304261, -3.867688, 0.3333333, 1, 0, 1,
-0.5421544, 0.1465283, 0.1398702, 0.3254902, 1, 0, 1,
-0.5303173, 0.7335547, -1.262351, 0.3215686, 1, 0, 1,
-0.5301825, 0.4954859, 0.4022458, 0.3137255, 1, 0, 1,
-0.5281702, 0.2938047, -1.492933, 0.3098039, 1, 0, 1,
-0.526572, -0.595678, -3.112912, 0.3019608, 1, 0, 1,
-0.525014, -0.6024933, -2.946516, 0.2941177, 1, 0, 1,
-0.5221263, 0.5587323, 0.4328939, 0.2901961, 1, 0, 1,
-0.5176612, 0.534977, -0.1407057, 0.282353, 1, 0, 1,
-0.5082831, -0.3845116, -1.646859, 0.2784314, 1, 0, 1,
-0.5065299, -0.3620067, 1.385185, 0.2705882, 1, 0, 1,
-0.505247, 0.3186851, -1.447116, 0.2666667, 1, 0, 1,
-0.50485, -1.109606, -2.063398, 0.2588235, 1, 0, 1,
-0.5043591, 0.6075596, -2.380457, 0.254902, 1, 0, 1,
-0.5020301, -0.3134523, -2.314334, 0.2470588, 1, 0, 1,
-0.5000158, 1.966163, -0.3441505, 0.2431373, 1, 0, 1,
-0.495281, -0.4074221, -1.283823, 0.2352941, 1, 0, 1,
-0.4948134, 0.6723303, -2.263657, 0.2313726, 1, 0, 1,
-0.4925993, -1.100747, -2.478081, 0.2235294, 1, 0, 1,
-0.492592, -0.6533074, -0.8866739, 0.2196078, 1, 0, 1,
-0.4870879, -0.2009642, -1.235983, 0.2117647, 1, 0, 1,
-0.4834748, 0.4241425, -1.077718, 0.2078431, 1, 0, 1,
-0.4804836, 1.61456, -1.040181, 0.2, 1, 0, 1,
-0.4791462, -1.875889, -3.421911, 0.1921569, 1, 0, 1,
-0.4783677, 0.6249004, 0.7019779, 0.1882353, 1, 0, 1,
-0.4783035, -0.03196469, -2.439596, 0.1803922, 1, 0, 1,
-0.4782851, 0.5592934, -0.6613696, 0.1764706, 1, 0, 1,
-0.47292, -0.07200816, -3.024114, 0.1686275, 1, 0, 1,
-0.4700213, -0.9135562, -0.9354456, 0.1647059, 1, 0, 1,
-0.4651797, 0.077407, -1.20244, 0.1568628, 1, 0, 1,
-0.4649765, -0.09218361, -2.442276, 0.1529412, 1, 0, 1,
-0.4637851, 0.4094428, -0.2350928, 0.145098, 1, 0, 1,
-0.4620779, -0.1511394, -0.6644117, 0.1411765, 1, 0, 1,
-0.4612019, -0.3172504, -0.5269434, 0.1333333, 1, 0, 1,
-0.4532138, -0.9404145, -2.482162, 0.1294118, 1, 0, 1,
-0.4527429, 0.3764431, 0.3427352, 0.1215686, 1, 0, 1,
-0.452678, 0.1679382, -0.5207468, 0.1176471, 1, 0, 1,
-0.4467504, -0.253031, -1.540407, 0.1098039, 1, 0, 1,
-0.4460853, 1.303594, 1.020108, 0.1058824, 1, 0, 1,
-0.4433216, -0.02899395, -1.486854, 0.09803922, 1, 0, 1,
-0.4430355, -0.08507161, -2.773698, 0.09019608, 1, 0, 1,
-0.4421678, 2.184286, -0.117563, 0.08627451, 1, 0, 1,
-0.4354819, 0.2229792, -1.500376, 0.07843138, 1, 0, 1,
-0.4318268, 2.318852, 0.6206009, 0.07450981, 1, 0, 1,
-0.4310525, 0.4190603, 0.5548543, 0.06666667, 1, 0, 1,
-0.4256636, 0.9272091, -0.3288517, 0.0627451, 1, 0, 1,
-0.4221545, -1.292289, -3.011041, 0.05490196, 1, 0, 1,
-0.4219868, 0.3351501, 1.027779, 0.05098039, 1, 0, 1,
-0.4189147, 1.152298, -0.777084, 0.04313726, 1, 0, 1,
-0.4174641, -1.826709, -3.224474, 0.03921569, 1, 0, 1,
-0.4127962, 0.05637281, 0.3116637, 0.03137255, 1, 0, 1,
-0.4127464, -1.501291, -3.554686, 0.02745098, 1, 0, 1,
-0.4127418, -0.6886032, -1.250438, 0.01960784, 1, 0, 1,
-0.4123661, -1.08963, -0.7378318, 0.01568628, 1, 0, 1,
-0.4118763, 2.848365, -0.3122533, 0.007843138, 1, 0, 1,
-0.4112644, -0.3216645, -2.140752, 0.003921569, 1, 0, 1,
-0.4110884, 1.492526, -0.7074283, 0, 1, 0.003921569, 1,
-0.4107198, 0.226804, 0.1368393, 0, 1, 0.01176471, 1,
-0.4087729, 0.6174153, -0.3957588, 0, 1, 0.01568628, 1,
-0.4081793, 1.67741, -0.1835818, 0, 1, 0.02352941, 1,
-0.4058804, 0.9540734, 0.8236063, 0, 1, 0.02745098, 1,
-0.403211, -0.8930659, -1.794004, 0, 1, 0.03529412, 1,
-0.4031652, -2.074429, -2.421765, 0, 1, 0.03921569, 1,
-0.4013179, -0.2350631, -1.705719, 0, 1, 0.04705882, 1,
-0.3970829, 0.1176312, 0.01155574, 0, 1, 0.05098039, 1,
-0.3968715, 1.329549, -0.5817575, 0, 1, 0.05882353, 1,
-0.3966783, -0.6246802, -3.055198, 0, 1, 0.0627451, 1,
-0.3867306, -1.332535, -4.116751, 0, 1, 0.07058824, 1,
-0.38455, 0.7656271, -0.6940401, 0, 1, 0.07450981, 1,
-0.3841077, 1.102509, -1.737844, 0, 1, 0.08235294, 1,
-0.3839604, -0.8966253, -1.641291, 0, 1, 0.08627451, 1,
-0.3826529, -1.005835, -3.959394, 0, 1, 0.09411765, 1,
-0.3822749, 0.6806554, 0.2520487, 0, 1, 0.1019608, 1,
-0.3747075, -0.5990226, -4.106096, 0, 1, 0.1058824, 1,
-0.3724682, -1.957142, -3.444607, 0, 1, 0.1137255, 1,
-0.3682439, -1.422029, -3.84263, 0, 1, 0.1176471, 1,
-0.3629371, -0.2214133, -0.5700639, 0, 1, 0.1254902, 1,
-0.3613533, -0.5902497, -2.34558, 0, 1, 0.1294118, 1,
-0.3569556, -1.090347, -2.935524, 0, 1, 0.1372549, 1,
-0.3514911, 0.1800212, -0.6298509, 0, 1, 0.1411765, 1,
-0.3507694, 0.1840009, -2.498805, 0, 1, 0.1490196, 1,
-0.3490679, 0.9931285, 1.02162, 0, 1, 0.1529412, 1,
-0.3480242, 0.1892886, -1.873943, 0, 1, 0.1607843, 1,
-0.3448591, 0.2052367, -2.747872, 0, 1, 0.1647059, 1,
-0.3421183, -1.470897, -3.636439, 0, 1, 0.172549, 1,
-0.3350933, 0.9585081, 0.7347658, 0, 1, 0.1764706, 1,
-0.328556, -0.5063315, -2.204101, 0, 1, 0.1843137, 1,
-0.3215585, -0.09917327, -2.579285, 0, 1, 0.1882353, 1,
-0.3214367, 0.3790138, -1.980681, 0, 1, 0.1960784, 1,
-0.3172648, -0.4791028, -1.853615, 0, 1, 0.2039216, 1,
-0.3137379, -0.4016309, -2.547304, 0, 1, 0.2078431, 1,
-0.3095748, -1.510678, -2.307238, 0, 1, 0.2156863, 1,
-0.3041561, 0.4877352, -1.882858, 0, 1, 0.2196078, 1,
-0.3025054, 0.3030134, 0.2171364, 0, 1, 0.227451, 1,
-0.2998256, 0.7086936, -0.6657419, 0, 1, 0.2313726, 1,
-0.2923808, -0.2200037, -1.460697, 0, 1, 0.2392157, 1,
-0.2889793, -2.375379, -1.274784, 0, 1, 0.2431373, 1,
-0.2854583, -1.383759, -3.156176, 0, 1, 0.2509804, 1,
-0.2817753, -1.029152, -3.921658, 0, 1, 0.254902, 1,
-0.2811459, 0.2990485, 1.213546, 0, 1, 0.2627451, 1,
-0.275758, 0.04106806, -0.7121809, 0, 1, 0.2666667, 1,
-0.2754514, 2.020287, 1.091129, 0, 1, 0.2745098, 1,
-0.2749851, -1.076794, -2.77001, 0, 1, 0.2784314, 1,
-0.2724237, 1.042679, -0.4632623, 0, 1, 0.2862745, 1,
-0.2703344, 1.132461, 2.027633, 0, 1, 0.2901961, 1,
-0.2645234, 0.9319199, 0.4730524, 0, 1, 0.2980392, 1,
-0.2643049, -0.4098708, -1.682469, 0, 1, 0.3058824, 1,
-0.2629156, -1.077046, -3.27383, 0, 1, 0.3098039, 1,
-0.2613194, 0.1335755, -1.170915, 0, 1, 0.3176471, 1,
-0.2610789, 0.1782287, 0.02199621, 0, 1, 0.3215686, 1,
-0.2610283, -1.698234, -2.350132, 0, 1, 0.3294118, 1,
-0.2588701, -0.6725403, -2.766513, 0, 1, 0.3333333, 1,
-0.2575715, 1.858476, -1.034721, 0, 1, 0.3411765, 1,
-0.2503328, 0.1293773, 0.1458245, 0, 1, 0.345098, 1,
-0.247752, 0.4507086, -0.281013, 0, 1, 0.3529412, 1,
-0.2399802, 0.1940619, -2.303346, 0, 1, 0.3568628, 1,
-0.2361248, -1.049629, -1.14975, 0, 1, 0.3647059, 1,
-0.234703, 0.4338593, -0.3225356, 0, 1, 0.3686275, 1,
-0.2341116, 1.102971, -0.6002769, 0, 1, 0.3764706, 1,
-0.2287558, -0.2116882, -2.109345, 0, 1, 0.3803922, 1,
-0.2272744, -0.6590462, -2.403985, 0, 1, 0.3882353, 1,
-0.2270562, 1.292107, -1.085647, 0, 1, 0.3921569, 1,
-0.2253146, -1.128653, -2.132497, 0, 1, 0.4, 1,
-0.2186946, 1.376056, -2.121664, 0, 1, 0.4078431, 1,
-0.2176692, -0.2080721, -2.335239, 0, 1, 0.4117647, 1,
-0.2135255, 1.246928, 0.2505094, 0, 1, 0.4196078, 1,
-0.2113079, -0.430804, -2.926159, 0, 1, 0.4235294, 1,
-0.2106889, -1.493301, -4.542077, 0, 1, 0.4313726, 1,
-0.2033753, -1.16204, -2.210865, 0, 1, 0.4352941, 1,
-0.2027647, 1.233858, -0.1615061, 0, 1, 0.4431373, 1,
-0.1985376, -0.4355792, -2.937475, 0, 1, 0.4470588, 1,
-0.1962187, -1.508149, -3.215717, 0, 1, 0.454902, 1,
-0.1955809, 0.8928823, -0.306922, 0, 1, 0.4588235, 1,
-0.1940724, -1.795874, -2.918108, 0, 1, 0.4666667, 1,
-0.1934049, -1.107587, -2.030837, 0, 1, 0.4705882, 1,
-0.189773, -0.1197966, -2.938071, 0, 1, 0.4784314, 1,
-0.1872965, -0.1421, -2.834006, 0, 1, 0.4823529, 1,
-0.1803421, 1.019961, -1.801582, 0, 1, 0.4901961, 1,
-0.1768512, -0.953546, -3.182922, 0, 1, 0.4941176, 1,
-0.1728528, -2.350963, -3.841887, 0, 1, 0.5019608, 1,
-0.1714229, 0.7292167, -0.524999, 0, 1, 0.509804, 1,
-0.1701193, -0.6805034, -2.8678, 0, 1, 0.5137255, 1,
-0.1700084, -1.209567, -4.607677, 0, 1, 0.5215687, 1,
-0.16941, -0.1699181, -1.453254, 0, 1, 0.5254902, 1,
-0.1674924, 0.4147614, 0.6978613, 0, 1, 0.5333334, 1,
-0.1668331, -0.6643865, -1.656928, 0, 1, 0.5372549, 1,
-0.1655456, -0.8054016, -3.346404, 0, 1, 0.5450981, 1,
-0.1636618, 0.7651522, 0.5551578, 0, 1, 0.5490196, 1,
-0.1618042, -0.1588206, -2.104513, 0, 1, 0.5568628, 1,
-0.1600793, 0.589639, -1.474053, 0, 1, 0.5607843, 1,
-0.1537656, -0.9429323, -3.397394, 0, 1, 0.5686275, 1,
-0.1503617, -0.1503722, -2.424793, 0, 1, 0.572549, 1,
-0.1455117, 0.4113428, -0.7151048, 0, 1, 0.5803922, 1,
-0.1400827, -0.2718402, -3.849661, 0, 1, 0.5843138, 1,
-0.1371883, -0.4151608, -2.474272, 0, 1, 0.5921569, 1,
-0.1371107, 1.434315, 0.5166803, 0, 1, 0.5960785, 1,
-0.1284858, -0.232704, -2.309786, 0, 1, 0.6039216, 1,
-0.1274538, -1.149686, -3.199225, 0, 1, 0.6117647, 1,
-0.1257199, 1.425085, 0.3278273, 0, 1, 0.6156863, 1,
-0.1216491, -1.659755, -1.600506, 0, 1, 0.6235294, 1,
-0.1189157, 1.785047, 0.1333529, 0, 1, 0.627451, 1,
-0.1176128, -0.6759332, -3.187992, 0, 1, 0.6352941, 1,
-0.1175649, 0.9177553, -1.148572, 0, 1, 0.6392157, 1,
-0.1157031, 0.3812539, 1.1496, 0, 1, 0.6470588, 1,
-0.1153946, -1.459248, -1.628862, 0, 1, 0.6509804, 1,
-0.1131829, -1.395778, -2.846254, 0, 1, 0.6588235, 1,
-0.107516, -0.208924, -1.828749, 0, 1, 0.6627451, 1,
-0.1070516, -1.805263, -3.885614, 0, 1, 0.6705883, 1,
-0.1055047, 0.37627, -0.5679283, 0, 1, 0.6745098, 1,
-0.1033343, 0.3830572, -1.047181, 0, 1, 0.682353, 1,
-0.09949394, 0.4717751, 0.2647164, 0, 1, 0.6862745, 1,
-0.09234268, -0.7801217, -3.099124, 0, 1, 0.6941177, 1,
-0.09212604, -0.3029517, -3.355846, 0, 1, 0.7019608, 1,
-0.08711325, -1.153525, -1.958173, 0, 1, 0.7058824, 1,
-0.08375049, 0.4884388, -0.7891864, 0, 1, 0.7137255, 1,
-0.08140723, -0.7990375, -5.277608, 0, 1, 0.7176471, 1,
-0.07982139, -0.9723606, -2.318756, 0, 1, 0.7254902, 1,
-0.07893214, 0.2971777, -0.1083909, 0, 1, 0.7294118, 1,
-0.07055432, -0.7204838, -3.989723, 0, 1, 0.7372549, 1,
-0.06692398, -0.4712236, -3.11767, 0, 1, 0.7411765, 1,
-0.06542833, 0.8335502, -0.1654536, 0, 1, 0.7490196, 1,
-0.06518873, -0.2206444, -3.738515, 0, 1, 0.7529412, 1,
-0.06430817, -0.3797654, -3.315449, 0, 1, 0.7607843, 1,
-0.06145871, 1.239634, 0.647884, 0, 1, 0.7647059, 1,
-0.06140238, -1.17747, -4.79357, 0, 1, 0.772549, 1,
-0.06077576, -0.9911276, -1.747333, 0, 1, 0.7764706, 1,
-0.06009113, -2.442622, -2.26543, 0, 1, 0.7843137, 1,
-0.05746821, 0.9987617, -1.487516, 0, 1, 0.7882353, 1,
-0.05423058, 0.4932332, -0.05044064, 0, 1, 0.7960784, 1,
-0.04962118, -1.678292, -3.11008, 0, 1, 0.8039216, 1,
-0.04434995, 2.232121, 0.2954328, 0, 1, 0.8078431, 1,
-0.03840579, 0.4745612, -0.8420818, 0, 1, 0.8156863, 1,
-0.03517986, 1.592962, -0.2085523, 0, 1, 0.8196079, 1,
-0.03402001, 0.2888296, 0.8905901, 0, 1, 0.827451, 1,
-0.03099779, 1.925275, 0.4523114, 0, 1, 0.8313726, 1,
-0.02618557, 0.3138153, 0.8311401, 0, 1, 0.8392157, 1,
-0.02480393, -0.4171043, -4.681301, 0, 1, 0.8431373, 1,
-0.02464945, 0.8239035, -0.00586007, 0, 1, 0.8509804, 1,
-0.02405241, -0.6039504, -2.957489, 0, 1, 0.854902, 1,
-0.02333975, 1.940691, -0.5255905, 0, 1, 0.8627451, 1,
-0.01806863, -0.4491057, -3.60605, 0, 1, 0.8666667, 1,
-0.01782327, 0.5916064, 2.710896, 0, 1, 0.8745098, 1,
-0.01142969, 0.3203996, 0.3711905, 0, 1, 0.8784314, 1,
-0.00543768, -0.932182, -3.30563, 0, 1, 0.8862745, 1,
-0.003586016, 0.2806834, -0.7861865, 0, 1, 0.8901961, 1,
-0.0007469512, 0.1056976, -1.157967, 0, 1, 0.8980392, 1,
0.008674247, 0.06338067, 0.1544656, 0, 1, 0.9058824, 1,
0.01217251, 2.129926, -0.8002051, 0, 1, 0.9098039, 1,
0.01319049, 0.1617518, -0.8556527, 0, 1, 0.9176471, 1,
0.01555016, 0.301815, -1.144015, 0, 1, 0.9215686, 1,
0.01578377, 0.342696, -0.7262189, 0, 1, 0.9294118, 1,
0.01819686, 0.384282, -0.4992076, 0, 1, 0.9333333, 1,
0.01949428, 0.05000575, 0.1080633, 0, 1, 0.9411765, 1,
0.02138615, -0.3340539, 3.759466, 0, 1, 0.945098, 1,
0.02186175, 1.951742, -0.1203714, 0, 1, 0.9529412, 1,
0.02229475, 0.1912103, 1.709008, 0, 1, 0.9568627, 1,
0.02275204, -0.2952946, 1.517792, 0, 1, 0.9647059, 1,
0.02756758, 0.4824883, 0.1828956, 0, 1, 0.9686275, 1,
0.02795303, -0.7985514, 4.290903, 0, 1, 0.9764706, 1,
0.0288482, 0.04616061, 1.540249, 0, 1, 0.9803922, 1,
0.03223049, 0.3921454, -0.0349261, 0, 1, 0.9882353, 1,
0.04223394, -1.215526, 3.455878, 0, 1, 0.9921569, 1,
0.04557482, -0.801142, 2.631528, 0, 1, 1, 1,
0.05142882, 0.6099723, 0.3101307, 0, 0.9921569, 1, 1,
0.05238764, 0.1903353, -1.691085, 0, 0.9882353, 1, 1,
0.06063516, -1.414838, 3.07373, 0, 0.9803922, 1, 1,
0.06219923, 0.6786058, -0.8430035, 0, 0.9764706, 1, 1,
0.06254573, -0.04473539, 1.094892, 0, 0.9686275, 1, 1,
0.06448404, 2.444689, -0.3520076, 0, 0.9647059, 1, 1,
0.0663855, 0.8138723, -0.0934904, 0, 0.9568627, 1, 1,
0.0675751, -0.1624692, 3.171621, 0, 0.9529412, 1, 1,
0.06907295, -0.04856391, 0.6400884, 0, 0.945098, 1, 1,
0.07309258, 0.7718221, 0.2533301, 0, 0.9411765, 1, 1,
0.08011604, -2.163193, 3.162141, 0, 0.9333333, 1, 1,
0.08150891, 1.082425, -1.31097, 0, 0.9294118, 1, 1,
0.08236679, 0.3783749, 0.53966, 0, 0.9215686, 1, 1,
0.08721431, 0.1748969, -0.2987532, 0, 0.9176471, 1, 1,
0.09376602, 1.030926, -0.3579993, 0, 0.9098039, 1, 1,
0.09450409, 0.4733446, 0.6334804, 0, 0.9058824, 1, 1,
0.09687681, -0.2138596, 2.985525, 0, 0.8980392, 1, 1,
0.09738477, -0.8281153, 2.969148, 0, 0.8901961, 1, 1,
0.1001523, 0.342351, 1.394325, 0, 0.8862745, 1, 1,
0.1044508, 1.535547, -1.19035, 0, 0.8784314, 1, 1,
0.1045107, 0.904927, 0.959796, 0, 0.8745098, 1, 1,
0.1069809, 1.795742, 0.5514633, 0, 0.8666667, 1, 1,
0.1070554, -0.4406253, 2.900205, 0, 0.8627451, 1, 1,
0.108405, 0.6334327, 1.1364, 0, 0.854902, 1, 1,
0.1100286, 0.2222966, 2.620208, 0, 0.8509804, 1, 1,
0.110153, -1.124122, 1.064416, 0, 0.8431373, 1, 1,
0.1104677, -0.8051146, 2.732154, 0, 0.8392157, 1, 1,
0.1121302, -0.8220015, 2.3582, 0, 0.8313726, 1, 1,
0.1121879, 2.247522, -0.1291078, 0, 0.827451, 1, 1,
0.1127631, 0.1756288, 0.2641566, 0, 0.8196079, 1, 1,
0.114832, 1.893404, 2.081759, 0, 0.8156863, 1, 1,
0.1150388, 0.4521945, 0.227865, 0, 0.8078431, 1, 1,
0.118836, 0.2796513, 0.6892329, 0, 0.8039216, 1, 1,
0.120959, 1.473076, 1.693248, 0, 0.7960784, 1, 1,
0.1220877, -2.068676, 3.474998, 0, 0.7882353, 1, 1,
0.124653, 0.9616773, 0.3787599, 0, 0.7843137, 1, 1,
0.1257233, 0.828341, -0.8726289, 0, 0.7764706, 1, 1,
0.1267647, 1.04624, -0.167621, 0, 0.772549, 1, 1,
0.1275124, -0.980288, 3.327845, 0, 0.7647059, 1, 1,
0.1311152, 1.402754, -0.213859, 0, 0.7607843, 1, 1,
0.1322053, 0.5854366, 0.7767825, 0, 0.7529412, 1, 1,
0.1402038, 1.994515, -0.6159071, 0, 0.7490196, 1, 1,
0.1451393, 0.4065931, 0.9233124, 0, 0.7411765, 1, 1,
0.1502124, 0.5005343, 0.5920427, 0, 0.7372549, 1, 1,
0.1517362, 0.6972923, 3.129471, 0, 0.7294118, 1, 1,
0.1523573, 0.4433225, -1.049427, 0, 0.7254902, 1, 1,
0.1586207, -3.12934, 1.726578, 0, 0.7176471, 1, 1,
0.1589547, -1.539847, 4.530533, 0, 0.7137255, 1, 1,
0.1664986, -0.3987888, 3.512854, 0, 0.7058824, 1, 1,
0.1687282, -1.687587, 1.906511, 0, 0.6980392, 1, 1,
0.1726388, -1.461393, 1.756913, 0, 0.6941177, 1, 1,
0.1729264, -0.5528676, 3.359356, 0, 0.6862745, 1, 1,
0.1741928, 0.1491035, 0.593987, 0, 0.682353, 1, 1,
0.1742055, 0.6472884, -0.6366353, 0, 0.6745098, 1, 1,
0.1774485, 0.6936447, 0.4949725, 0, 0.6705883, 1, 1,
0.17836, -0.7011353, 4.109757, 0, 0.6627451, 1, 1,
0.1820172, 2.022026, 1.086653, 0, 0.6588235, 1, 1,
0.1828194, 2.717774, 0.6450311, 0, 0.6509804, 1, 1,
0.1839302, -0.1388501, 2.570386, 0, 0.6470588, 1, 1,
0.1839612, 0.4837817, 1.152116, 0, 0.6392157, 1, 1,
0.1862828, -0.08935153, 0.4669674, 0, 0.6352941, 1, 1,
0.1888474, -0.8632463, 3.254992, 0, 0.627451, 1, 1,
0.1942767, -0.246585, 0.7538569, 0, 0.6235294, 1, 1,
0.1951672, -0.08568791, 1.986779, 0, 0.6156863, 1, 1,
0.1978431, -1.307613, 4.443668, 0, 0.6117647, 1, 1,
0.2053115, -1.352712, 2.826158, 0, 0.6039216, 1, 1,
0.2073953, 0.6848462, 1.642478, 0, 0.5960785, 1, 1,
0.2109785, -0.2720678, 2.475654, 0, 0.5921569, 1, 1,
0.2114673, 0.09052876, 1.032739, 0, 0.5843138, 1, 1,
0.2125311, 1.074936, -0.06420267, 0, 0.5803922, 1, 1,
0.2135098, 0.4828353, 1.029024, 0, 0.572549, 1, 1,
0.2160949, 0.9419084, 1.04505, 0, 0.5686275, 1, 1,
0.2167497, 0.4419494, 0.05474885, 0, 0.5607843, 1, 1,
0.2176942, 1.156237, 0.408437, 0, 0.5568628, 1, 1,
0.2188925, 0.5336831, -0.6748349, 0, 0.5490196, 1, 1,
0.2241511, -0.7035431, 3.020937, 0, 0.5450981, 1, 1,
0.2292725, -0.01839094, 2.225903, 0, 0.5372549, 1, 1,
0.230407, 1.327935, 0.7979373, 0, 0.5333334, 1, 1,
0.2336348, -1.699057, 4.425124, 0, 0.5254902, 1, 1,
0.2390836, -0.5598536, 2.973346, 0, 0.5215687, 1, 1,
0.2417243, 1.371413, 1.086778, 0, 0.5137255, 1, 1,
0.2482682, 1.821353, -1.446451, 0, 0.509804, 1, 1,
0.2483543, -0.6224864, 3.423792, 0, 0.5019608, 1, 1,
0.2542949, 1.190842, -0.3418093, 0, 0.4941176, 1, 1,
0.2559628, 0.7098151, 0.659656, 0, 0.4901961, 1, 1,
0.2571131, 2.070883, -1.130388, 0, 0.4823529, 1, 1,
0.2584421, 0.9226729, -1.091961, 0, 0.4784314, 1, 1,
0.2611326, -0.09491886, 3.349534, 0, 0.4705882, 1, 1,
0.2628316, -1.110035, 1.052257, 0, 0.4666667, 1, 1,
0.265042, -0.655965, 4.868319, 0, 0.4588235, 1, 1,
0.2684868, 0.2825285, 3.69494, 0, 0.454902, 1, 1,
0.2695518, 0.1657369, 3.372812, 0, 0.4470588, 1, 1,
0.2735463, 0.9505184, -0.4497763, 0, 0.4431373, 1, 1,
0.2750708, -0.8902735, 3.08868, 0, 0.4352941, 1, 1,
0.2796391, 0.4600705, 1.386092, 0, 0.4313726, 1, 1,
0.279693, 0.5881857, 0.1615423, 0, 0.4235294, 1, 1,
0.2797035, -0.7345804, 3.518079, 0, 0.4196078, 1, 1,
0.282561, 1.603485, -0.1613944, 0, 0.4117647, 1, 1,
0.2843272, 0.7719994, 0.1866535, 0, 0.4078431, 1, 1,
0.2854445, -0.4293767, 2.746748, 0, 0.4, 1, 1,
0.2886457, 0.03137207, 3.195063, 0, 0.3921569, 1, 1,
0.2891321, 0.2589659, 1.7426, 0, 0.3882353, 1, 1,
0.2904156, 2.057926, -0.8747799, 0, 0.3803922, 1, 1,
0.292105, -0.1134887, 1.657664, 0, 0.3764706, 1, 1,
0.3021572, -0.2075906, 3.518368, 0, 0.3686275, 1, 1,
0.3023903, 0.6104181, 0.4947585, 0, 0.3647059, 1, 1,
0.3040634, -1.57766, 3.43917, 0, 0.3568628, 1, 1,
0.3053523, -0.7912142, 5.424113, 0, 0.3529412, 1, 1,
0.3059917, 2.25815, -0.5036713, 0, 0.345098, 1, 1,
0.3060981, 0.2796545, 0.09764294, 0, 0.3411765, 1, 1,
0.3075479, -2.945728, 2.508433, 0, 0.3333333, 1, 1,
0.3102089, 0.6456429, 0.6900317, 0, 0.3294118, 1, 1,
0.3139252, 0.8436238, 0.6222802, 0, 0.3215686, 1, 1,
0.3153158, 0.4712012, -0.141832, 0, 0.3176471, 1, 1,
0.3167792, 1.179883, -0.3124018, 0, 0.3098039, 1, 1,
0.3247826, 1.96291, -0.6017284, 0, 0.3058824, 1, 1,
0.3275987, 0.5974216, 0.1141565, 0, 0.2980392, 1, 1,
0.3293739, -2.527062, 2.924867, 0, 0.2901961, 1, 1,
0.3317705, -0.4870365, 2.395151, 0, 0.2862745, 1, 1,
0.3318734, 0.8639696, 1.205381, 0, 0.2784314, 1, 1,
0.3322625, 0.7237132, 0.7810842, 0, 0.2745098, 1, 1,
0.334671, 0.6629925, -0.1630249, 0, 0.2666667, 1, 1,
0.3372188, 0.4355064, 0.2189618, 0, 0.2627451, 1, 1,
0.337326, -0.9923241, 2.349081, 0, 0.254902, 1, 1,
0.3396604, -0.001180532, 0.7286268, 0, 0.2509804, 1, 1,
0.3401911, 0.4761607, 0.09751381, 0, 0.2431373, 1, 1,
0.3405048, -0.6568337, 4.121081, 0, 0.2392157, 1, 1,
0.3412682, -0.7480261, 3.245188, 0, 0.2313726, 1, 1,
0.3435721, -0.2637977, 2.79705, 0, 0.227451, 1, 1,
0.3506673, 0.5160356, 1.106281, 0, 0.2196078, 1, 1,
0.354481, 1.293272, 0.5665722, 0, 0.2156863, 1, 1,
0.3549629, 0.07578219, 1.050376, 0, 0.2078431, 1, 1,
0.3555959, 1.452931, -1.848302, 0, 0.2039216, 1, 1,
0.3570822, -0.767727, 3.124461, 0, 0.1960784, 1, 1,
0.3618526, -1.0541, 3.213057, 0, 0.1882353, 1, 1,
0.3635498, 0.4658157, -1.345845, 0, 0.1843137, 1, 1,
0.3656152, 0.798278, 0.4688371, 0, 0.1764706, 1, 1,
0.3677787, 1.162162, -0.6370048, 0, 0.172549, 1, 1,
0.3716195, -0.1891613, 2.173398, 0, 0.1647059, 1, 1,
0.3740691, -0.7747604, 3.368238, 0, 0.1607843, 1, 1,
0.3748431, 1.667023, 0.5623826, 0, 0.1529412, 1, 1,
0.3775564, -0.5895854, 2.088828, 0, 0.1490196, 1, 1,
0.3797292, -1.825859, 3.051716, 0, 0.1411765, 1, 1,
0.3834907, -0.9147667, 1.98052, 0, 0.1372549, 1, 1,
0.3851027, -1.346444, 2.884678, 0, 0.1294118, 1, 1,
0.3855545, 0.2169355, -0.2198134, 0, 0.1254902, 1, 1,
0.3897873, -1.975004, 5.088671, 0, 0.1176471, 1, 1,
0.4050636, 1.775038, 0.9800256, 0, 0.1137255, 1, 1,
0.4052746, -0.8607287, 3.427598, 0, 0.1058824, 1, 1,
0.4068123, 1.186676, -0.4064651, 0, 0.09803922, 1, 1,
0.4155444, -0.8143723, 2.817557, 0, 0.09411765, 1, 1,
0.4206911, 0.6980579, 1.237551, 0, 0.08627451, 1, 1,
0.4285695, -0.05172021, 0.0277918, 0, 0.08235294, 1, 1,
0.4319274, 0.06207259, 3.12086, 0, 0.07450981, 1, 1,
0.4374711, 0.2745691, 0.2211891, 0, 0.07058824, 1, 1,
0.4401143, 1.112209, 0.841329, 0, 0.0627451, 1, 1,
0.4408621, 0.6170798, 1.144042, 0, 0.05882353, 1, 1,
0.44449, -0.2297888, 2.745405, 0, 0.05098039, 1, 1,
0.4498793, -0.3745728, 3.181239, 0, 0.04705882, 1, 1,
0.4501282, -1.59147, 4.430179, 0, 0.03921569, 1, 1,
0.451088, 0.8538228, 1.684398, 0, 0.03529412, 1, 1,
0.4511893, 0.3917974, -1.296562, 0, 0.02745098, 1, 1,
0.4535119, 1.466694, -0.0618544, 0, 0.02352941, 1, 1,
0.4562266, -0.5298864, 0.9746361, 0, 0.01568628, 1, 1,
0.4613581, -0.4717104, 3.325894, 0, 0.01176471, 1, 1,
0.4618783, 0.6934085, -0.005823797, 0, 0.003921569, 1, 1,
0.4650247, 1.702107, -0.2473965, 0.003921569, 0, 1, 1,
0.4695523, 1.467341, 1.90687, 0.007843138, 0, 1, 1,
0.4715041, 1.530242, 0.5267302, 0.01568628, 0, 1, 1,
0.4738161, 1.940905, 2.459295, 0.01960784, 0, 1, 1,
0.4746407, -1.226403, 1.247183, 0.02745098, 0, 1, 1,
0.4753265, -1.220291, 2.507751, 0.03137255, 0, 1, 1,
0.4758268, 0.4878539, 2.218364, 0.03921569, 0, 1, 1,
0.4761338, 2.111435, -0.7286204, 0.04313726, 0, 1, 1,
0.4766442, -0.7927787, 1.721277, 0.05098039, 0, 1, 1,
0.4781425, 0.7713974, 1.199702, 0.05490196, 0, 1, 1,
0.4790219, -0.3721034, 3.539428, 0.0627451, 0, 1, 1,
0.4799269, -1.51168, 1.733728, 0.06666667, 0, 1, 1,
0.4803754, -0.3008755, 2.184455, 0.07450981, 0, 1, 1,
0.48122, 0.07083636, 1.733755, 0.07843138, 0, 1, 1,
0.4824061, 0.07765719, 1.9888, 0.08627451, 0, 1, 1,
0.4859743, -0.03444152, 0.7842714, 0.09019608, 0, 1, 1,
0.4928018, 1.944852, 0.4894866, 0.09803922, 0, 1, 1,
0.4935834, -0.5796709, 1.402641, 0.1058824, 0, 1, 1,
0.4938295, -0.6996605, 1.411727, 0.1098039, 0, 1, 1,
0.4960853, 1.131711, -0.4665174, 0.1176471, 0, 1, 1,
0.4990818, 1.105289, -0.6796004, 0.1215686, 0, 1, 1,
0.5003424, -0.05174984, 2.189562, 0.1294118, 0, 1, 1,
0.5032184, -2.429393, 2.524055, 0.1333333, 0, 1, 1,
0.5085258, 1.533585, 0.6696727, 0.1411765, 0, 1, 1,
0.5093861, -0.6073248, 2.755647, 0.145098, 0, 1, 1,
0.5115811, -0.841467, 3.794721, 0.1529412, 0, 1, 1,
0.511798, -0.5852171, 1.668649, 0.1568628, 0, 1, 1,
0.5142053, -0.627422, 1.90423, 0.1647059, 0, 1, 1,
0.514351, -1.350721, 3.759343, 0.1686275, 0, 1, 1,
0.5152529, -0.6462132, 3.084062, 0.1764706, 0, 1, 1,
0.5152989, 0.7962195, 2.093381, 0.1803922, 0, 1, 1,
0.5166291, -2.576802, 3.290043, 0.1882353, 0, 1, 1,
0.5253653, 0.8933232, 0.007943066, 0.1921569, 0, 1, 1,
0.52623, -0.4012494, 1.8883, 0.2, 0, 1, 1,
0.5293764, -0.6641843, 3.570375, 0.2078431, 0, 1, 1,
0.5297316, 0.7865743, -0.1098617, 0.2117647, 0, 1, 1,
0.5317595, 2.35661, 0.9353061, 0.2196078, 0, 1, 1,
0.5323315, -1.766169, 3.515, 0.2235294, 0, 1, 1,
0.5328506, 0.3526911, 1.519445, 0.2313726, 0, 1, 1,
0.5449963, -1.646625, 2.963792, 0.2352941, 0, 1, 1,
0.5462881, 0.4007218, 0.05899669, 0.2431373, 0, 1, 1,
0.5465502, 0.3130235, 0.7381942, 0.2470588, 0, 1, 1,
0.5498646, 1.681594, 0.5960928, 0.254902, 0, 1, 1,
0.5522832, 0.2845482, 1.152105, 0.2588235, 0, 1, 1,
0.5545934, 0.1600163, 2.182072, 0.2666667, 0, 1, 1,
0.5571701, -0.03576445, 2.895893, 0.2705882, 0, 1, 1,
0.5584137, 0.8416037, 1.442499, 0.2784314, 0, 1, 1,
0.5673428, 0.9418632, 0.3964216, 0.282353, 0, 1, 1,
0.5686352, 1.058386, 0.5551941, 0.2901961, 0, 1, 1,
0.5692, 1.896729, -0.3315537, 0.2941177, 0, 1, 1,
0.5706016, 0.2286562, 0.7024197, 0.3019608, 0, 1, 1,
0.5713052, -0.2862344, 0.5802668, 0.3098039, 0, 1, 1,
0.5812083, 0.3879817, 2.493624, 0.3137255, 0, 1, 1,
0.5837961, 0.485982, 1.264036, 0.3215686, 0, 1, 1,
0.594941, 1.21196, 0.7591331, 0.3254902, 0, 1, 1,
0.5975187, 0.3523572, 1.450946, 0.3333333, 0, 1, 1,
0.5997387, -1.300218, 2.077943, 0.3372549, 0, 1, 1,
0.6005232, -0.08967226, 2.654173, 0.345098, 0, 1, 1,
0.6034272, 1.007557, 1.851734, 0.3490196, 0, 1, 1,
0.6044657, -0.3958452, 4.045733, 0.3568628, 0, 1, 1,
0.6060548, 1.100854, 0.2207472, 0.3607843, 0, 1, 1,
0.6099852, -0.7588316, 3.171096, 0.3686275, 0, 1, 1,
0.6203339, 0.7579396, 2.938917, 0.372549, 0, 1, 1,
0.6258671, -0.1146485, 1.674598, 0.3803922, 0, 1, 1,
0.6267289, -1.152699, 1.183426, 0.3843137, 0, 1, 1,
0.6411022, -0.8903502, 4.642633, 0.3921569, 0, 1, 1,
0.6445463, -0.8115054, 2.736487, 0.3960784, 0, 1, 1,
0.6495876, 1.214977, 0.3448564, 0.4039216, 0, 1, 1,
0.6635005, 0.03837615, 1.865052, 0.4117647, 0, 1, 1,
0.6642392, 0.08162969, 1.119039, 0.4156863, 0, 1, 1,
0.6665695, 0.6614386, 0.1751108, 0.4235294, 0, 1, 1,
0.6731546, -0.1244361, 2.260527, 0.427451, 0, 1, 1,
0.673178, 0.5136055, 1.564506, 0.4352941, 0, 1, 1,
0.6743475, -0.9744318, 3.294979, 0.4392157, 0, 1, 1,
0.676755, 0.8939039, -0.001542993, 0.4470588, 0, 1, 1,
0.6889109, -0.007406594, 1.669727, 0.4509804, 0, 1, 1,
0.6902115, -0.1384381, 3.146545, 0.4588235, 0, 1, 1,
0.6925093, -0.2676592, 2.930488, 0.4627451, 0, 1, 1,
0.6945151, -0.3997746, 2.727214, 0.4705882, 0, 1, 1,
0.6989745, 1.194915, 2.505808, 0.4745098, 0, 1, 1,
0.7045158, 2.468298, 1.205551, 0.4823529, 0, 1, 1,
0.7045895, 2.249342, 0.5634648, 0.4862745, 0, 1, 1,
0.7068938, -0.3665795, 1.775921, 0.4941176, 0, 1, 1,
0.7070987, -1.582621, 1.619646, 0.5019608, 0, 1, 1,
0.7093231, 0.6748363, 0.2769172, 0.5058824, 0, 1, 1,
0.7107792, 0.7146761, 0.5325949, 0.5137255, 0, 1, 1,
0.7128397, 0.8287607, 0.6854941, 0.5176471, 0, 1, 1,
0.7159462, -1.060624, 2.998675, 0.5254902, 0, 1, 1,
0.7165385, 2.2022, 1.259553, 0.5294118, 0, 1, 1,
0.7172458, 1.787401, 1.179382, 0.5372549, 0, 1, 1,
0.7172669, 0.7665522, 0.1868886, 0.5411765, 0, 1, 1,
0.724988, 0.7085331, -0.3050951, 0.5490196, 0, 1, 1,
0.725599, -0.2950923, 1.086645, 0.5529412, 0, 1, 1,
0.7271069, -0.2383528, 3.019408, 0.5607843, 0, 1, 1,
0.7277669, -0.4513455, 1.38221, 0.5647059, 0, 1, 1,
0.739453, 2.048198, 0.2725547, 0.572549, 0, 1, 1,
0.7415876, 1.560271, 0.2523424, 0.5764706, 0, 1, 1,
0.7567293, 0.384708, -0.9066787, 0.5843138, 0, 1, 1,
0.7575049, -1.49747, 2.194237, 0.5882353, 0, 1, 1,
0.7583973, -1.227475, 3.009767, 0.5960785, 0, 1, 1,
0.7592524, -0.3900616, 2.201965, 0.6039216, 0, 1, 1,
0.7606425, -1.119983, 0.3776503, 0.6078432, 0, 1, 1,
0.7609866, 1.315148, 0.5005481, 0.6156863, 0, 1, 1,
0.7615991, 2.5256, -0.7370825, 0.6196079, 0, 1, 1,
0.764566, 0.8992503, 0.0346608, 0.627451, 0, 1, 1,
0.7671132, -0.3682741, 3.204017, 0.6313726, 0, 1, 1,
0.7688266, 0.3167216, 2.087305, 0.6392157, 0, 1, 1,
0.7703411, 0.4699736, 1.464866, 0.6431373, 0, 1, 1,
0.7711446, 0.2804709, -0.1894247, 0.6509804, 0, 1, 1,
0.7784761, -0.1063406, 1.946755, 0.654902, 0, 1, 1,
0.7823157, 2.041536, -0.9567832, 0.6627451, 0, 1, 1,
0.7846349, 1.402978, -0.5302526, 0.6666667, 0, 1, 1,
0.7854346, 0.4113078, 0.8276998, 0.6745098, 0, 1, 1,
0.786872, 1.071252, 0.9561502, 0.6784314, 0, 1, 1,
0.7885085, 0.8083701, -1.066059, 0.6862745, 0, 1, 1,
0.7894744, -1.15269, 5.022595, 0.6901961, 0, 1, 1,
0.7954893, -1.531055, 4.562236, 0.6980392, 0, 1, 1,
0.7964876, -0.3429837, 0.8727539, 0.7058824, 0, 1, 1,
0.8091231, 0.1294242, 1.206064, 0.7098039, 0, 1, 1,
0.8111586, 0.05631958, 2.192252, 0.7176471, 0, 1, 1,
0.8113985, 0.3288281, 0.2578403, 0.7215686, 0, 1, 1,
0.8143877, 0.2364982, 0.8874553, 0.7294118, 0, 1, 1,
0.814489, -0.4805404, 1.247371, 0.7333333, 0, 1, 1,
0.8207101, -0.8951403, 2.486628, 0.7411765, 0, 1, 1,
0.8218214, -0.6733445, 2.773827, 0.7450981, 0, 1, 1,
0.8251712, 0.5295774, 0.1858889, 0.7529412, 0, 1, 1,
0.8265643, 1.896869, 0.9787904, 0.7568628, 0, 1, 1,
0.8295426, -2.004321, 2.734302, 0.7647059, 0, 1, 1,
0.8295906, 0.511726, -1.220742, 0.7686275, 0, 1, 1,
0.8311861, -1.35757, 3.873274, 0.7764706, 0, 1, 1,
0.8316207, 1.125357, -0.2921059, 0.7803922, 0, 1, 1,
0.8321196, -1.091069, 1.609492, 0.7882353, 0, 1, 1,
0.8321372, 1.416568, 1.114693, 0.7921569, 0, 1, 1,
0.8321968, 2.010948, -1.844526, 0.8, 0, 1, 1,
0.8331085, -0.6877657, 3.715476, 0.8078431, 0, 1, 1,
0.8365902, 0.6997864, -1.079527, 0.8117647, 0, 1, 1,
0.8377818, 1.49072, -0.1318243, 0.8196079, 0, 1, 1,
0.8402942, 0.1650693, -0.23128, 0.8235294, 0, 1, 1,
0.8410771, -0.6923348, 1.959572, 0.8313726, 0, 1, 1,
0.8412853, -0.9570648, 1.895503, 0.8352941, 0, 1, 1,
0.8421378, -0.7567246, 3.708793, 0.8431373, 0, 1, 1,
0.8476521, -0.6483816, 1.824306, 0.8470588, 0, 1, 1,
0.8566518, 1.125735, 0.5834919, 0.854902, 0, 1, 1,
0.8577671, 2.074476, 0.05844124, 0.8588235, 0, 1, 1,
0.8703721, -1.273364, 2.417503, 0.8666667, 0, 1, 1,
0.8787076, 0.8730142, -0.4721586, 0.8705882, 0, 1, 1,
0.8803367, -0.6204324, 1.384479, 0.8784314, 0, 1, 1,
0.8804269, 3.591979, -1.699955, 0.8823529, 0, 1, 1,
0.8824695, -0.9902765, 2.898319, 0.8901961, 0, 1, 1,
0.885672, -2.823832, 2.394769, 0.8941177, 0, 1, 1,
0.8961905, -0.7376091, 1.99817, 0.9019608, 0, 1, 1,
0.9013374, -1.531194, 1.222643, 0.9098039, 0, 1, 1,
0.9024675, -0.8841876, 1.684146, 0.9137255, 0, 1, 1,
0.9055162, -0.1736576, 1.195092, 0.9215686, 0, 1, 1,
0.905964, -2.186033, 1.94548, 0.9254902, 0, 1, 1,
0.9078612, -0.7595117, 3.040742, 0.9333333, 0, 1, 1,
0.9177904, -1.211657, 2.17518, 0.9372549, 0, 1, 1,
0.9198818, -0.7788699, 2.384469, 0.945098, 0, 1, 1,
0.9236841, -0.03933503, 1.122226, 0.9490196, 0, 1, 1,
0.9292752, 1.487584, 0.2432713, 0.9568627, 0, 1, 1,
0.9338011, 0.05492532, 1.901122, 0.9607843, 0, 1, 1,
0.9346842, -0.7776437, 2.256196, 0.9686275, 0, 1, 1,
0.9391954, -1.194046, 0.003405184, 0.972549, 0, 1, 1,
0.9524408, 0.4582701, 2.844028, 0.9803922, 0, 1, 1,
0.9565569, -0.1649256, 1.24098, 0.9843137, 0, 1, 1,
0.9646944, 1.436288, -0.5566922, 0.9921569, 0, 1, 1,
0.9675858, 1.608394, 3.714217, 0.9960784, 0, 1, 1,
0.9704272, -1.030769, 3.213855, 1, 0, 0.9960784, 1,
0.9712499, -0.394222, 0.6128287, 1, 0, 0.9882353, 1,
0.9786033, -0.6025172, 4.330027, 1, 0, 0.9843137, 1,
0.9840771, 1.652293, 1.21134, 1, 0, 0.9764706, 1,
0.9842911, 0.2674941, 2.383478, 1, 0, 0.972549, 1,
0.9853415, -2.323915, 2.586219, 1, 0, 0.9647059, 1,
0.9933546, -1.668249, 1.958294, 1, 0, 0.9607843, 1,
0.9933839, -1.110173, 2.083933, 1, 0, 0.9529412, 1,
0.9941744, -0.4525203, 1.254566, 1, 0, 0.9490196, 1,
0.9947079, 0.9236853, 1.941817, 1, 0, 0.9411765, 1,
0.9998434, -1.686051, 1.88724, 1, 0, 0.9372549, 1,
1.004018, 0.1776042, 1.648316, 1, 0, 0.9294118, 1,
1.006902, -0.514547, 1.374908, 1, 0, 0.9254902, 1,
1.012465, 1.453281, -0.03568385, 1, 0, 0.9176471, 1,
1.030253, -0.4778393, 1.334148, 1, 0, 0.9137255, 1,
1.032377, -1.2199, 2.750179, 1, 0, 0.9058824, 1,
1.034413, -0.3576972, 2.183588, 1, 0, 0.9019608, 1,
1.036041, -0.0004164928, 2.430944, 1, 0, 0.8941177, 1,
1.036078, 0.8752297, 0.8949799, 1, 0, 0.8862745, 1,
1.03708, 0.2223053, 1.733805, 1, 0, 0.8823529, 1,
1.041633, -0.742614, 2.022032, 1, 0, 0.8745098, 1,
1.042335, 0.6221499, 0.318464, 1, 0, 0.8705882, 1,
1.046465, 0.4396535, 1.105042, 1, 0, 0.8627451, 1,
1.058269, -0.7920401, 2.304617, 1, 0, 0.8588235, 1,
1.06388, 0.5245973, 1.262486, 1, 0, 0.8509804, 1,
1.071958, 0.5224798, 0.8804492, 1, 0, 0.8470588, 1,
1.086703, -0.8453909, 1.477183, 1, 0, 0.8392157, 1,
1.087444, -0.4651925, 2.381502, 1, 0, 0.8352941, 1,
1.089129, 1.748851, 0.2884734, 1, 0, 0.827451, 1,
1.096639, 1.175979, 2.462219, 1, 0, 0.8235294, 1,
1.110127, 0.4102428, 2.164966, 1, 0, 0.8156863, 1,
1.122238, 0.4449168, 0.3314252, 1, 0, 0.8117647, 1,
1.123468, 0.8026178, 2.226456, 1, 0, 0.8039216, 1,
1.124062, 1.758456, 0.8625837, 1, 0, 0.7960784, 1,
1.125616, -0.4745814, 2.246943, 1, 0, 0.7921569, 1,
1.12923, -0.7618818, 2.105605, 1, 0, 0.7843137, 1,
1.13497, 0.006730841, 1.526055, 1, 0, 0.7803922, 1,
1.146571, -0.5886686, 0.4452449, 1, 0, 0.772549, 1,
1.162098, -1.821496, 1.250407, 1, 0, 0.7686275, 1,
1.181229, 0.430072, 1.392069, 1, 0, 0.7607843, 1,
1.186846, -1.511639, 2.253459, 1, 0, 0.7568628, 1,
1.203863, 1.644588, 0.5535481, 1, 0, 0.7490196, 1,
1.207578, 0.3677353, -0.002502864, 1, 0, 0.7450981, 1,
1.21646, -0.7190074, 2.558266, 1, 0, 0.7372549, 1,
1.220415, -1.216921, 3.87103, 1, 0, 0.7333333, 1,
1.221959, 0.4930572, 0.8156369, 1, 0, 0.7254902, 1,
1.223869, -0.004825172, 2.889835, 1, 0, 0.7215686, 1,
1.225506, 0.6147074, 1.335622, 1, 0, 0.7137255, 1,
1.225509, -1.234568, 1.517649, 1, 0, 0.7098039, 1,
1.229644, 0.06894408, 1.166212, 1, 0, 0.7019608, 1,
1.239564, 0.01907525, 2.447247, 1, 0, 0.6941177, 1,
1.260896, -0.414697, 1.935041, 1, 0, 0.6901961, 1,
1.261053, -2.36732, 1.825318, 1, 0, 0.682353, 1,
1.263385, 0.8568175, 0.104079, 1, 0, 0.6784314, 1,
1.267232, -0.9121115, 2.227735, 1, 0, 0.6705883, 1,
1.270989, 1.428064, -0.6502129, 1, 0, 0.6666667, 1,
1.273338, 0.6083966, 2.228539, 1, 0, 0.6588235, 1,
1.274554, -1.261819, 2.409216, 1, 0, 0.654902, 1,
1.274821, 0.6867481, 1.068048, 1, 0, 0.6470588, 1,
1.278408, -2.974213, 2.904234, 1, 0, 0.6431373, 1,
1.285452, 0.4623361, 1.49103, 1, 0, 0.6352941, 1,
1.29098, -0.4388167, 3.665299, 1, 0, 0.6313726, 1,
1.300971, -2.183392, 1.02769, 1, 0, 0.6235294, 1,
1.303237, -0.1240525, 4.18117, 1, 0, 0.6196079, 1,
1.308097, -1.166513, 2.312776, 1, 0, 0.6117647, 1,
1.316013, -0.4706973, 2.228703, 1, 0, 0.6078432, 1,
1.317711, 0.5632432, 0.9540219, 1, 0, 0.6, 1,
1.323386, 0.4889317, 0.5856045, 1, 0, 0.5921569, 1,
1.326319, -1.509416, 2.23175, 1, 0, 0.5882353, 1,
1.328841, 0.0009444895, 1.433933, 1, 0, 0.5803922, 1,
1.337625, -0.2375183, 2.847493, 1, 0, 0.5764706, 1,
1.339482, -0.4120541, 0.9310319, 1, 0, 0.5686275, 1,
1.344928, -0.2704926, 1.498991, 1, 0, 0.5647059, 1,
1.353383, 1.848442, 1.612583, 1, 0, 0.5568628, 1,
1.354772, 0.648751, -1.028638, 1, 0, 0.5529412, 1,
1.362498, 0.656638, 1.885427, 1, 0, 0.5450981, 1,
1.366323, 0.412704, 1.378731, 1, 0, 0.5411765, 1,
1.36666, -1.636333, 2.795745, 1, 0, 0.5333334, 1,
1.366861, 0.7469621, -0.04230133, 1, 0, 0.5294118, 1,
1.371014, 1.38762, 1.220909, 1, 0, 0.5215687, 1,
1.373574, 0.420215, 1.381663, 1, 0, 0.5176471, 1,
1.374919, -1.632473, 2.860143, 1, 0, 0.509804, 1,
1.389059, -1.016378, 2.58116, 1, 0, 0.5058824, 1,
1.394101, -1.849821, 3.862762, 1, 0, 0.4980392, 1,
1.401939, -0.9743267, 3.854209, 1, 0, 0.4901961, 1,
1.405434, 0.9643777, 0.4316748, 1, 0, 0.4862745, 1,
1.412032, 0.7729796, 2.171779, 1, 0, 0.4784314, 1,
1.426124, -0.8978313, 4.092752, 1, 0, 0.4745098, 1,
1.431895, -0.2079225, 3.303238, 1, 0, 0.4666667, 1,
1.449538, 1.479337, 1.682028, 1, 0, 0.4627451, 1,
1.452939, 0.9682205, 1.646915, 1, 0, 0.454902, 1,
1.475129, 0.9854801, 1.860672, 1, 0, 0.4509804, 1,
1.483191, 1.436028, 0.4757051, 1, 0, 0.4431373, 1,
1.484541, -0.5958202, 2.014507, 1, 0, 0.4392157, 1,
1.485778, -0.8726043, 1.461018, 1, 0, 0.4313726, 1,
1.490057, -1.278911, 3.725968, 1, 0, 0.427451, 1,
1.49244, 1.286126, 1.869373, 1, 0, 0.4196078, 1,
1.504369, -0.519509, 1.566732, 1, 0, 0.4156863, 1,
1.518002, 0.7289211, 1.505738, 1, 0, 0.4078431, 1,
1.521496, 0.2347931, 1.672253, 1, 0, 0.4039216, 1,
1.530104, -1.212367, 2.83691, 1, 0, 0.3960784, 1,
1.539321, 0.8188032, -0.8566895, 1, 0, 0.3882353, 1,
1.54336, -1.424717, 2.13076, 1, 0, 0.3843137, 1,
1.544003, -0.9215657, 3.45777, 1, 0, 0.3764706, 1,
1.596978, 0.6031305, 0.6162996, 1, 0, 0.372549, 1,
1.601547, 0.8765444, 2.270389, 1, 0, 0.3647059, 1,
1.615358, -1.696899, 3.404548, 1, 0, 0.3607843, 1,
1.617082, 1.188776, 0.9681734, 1, 0, 0.3529412, 1,
1.634854, -0.9650851, 2.473021, 1, 0, 0.3490196, 1,
1.638294, 1.471954, 0.2319921, 1, 0, 0.3411765, 1,
1.639598, 1.865362, 2.678711, 1, 0, 0.3372549, 1,
1.644106, -0.4318543, 1.68604, 1, 0, 0.3294118, 1,
1.64542, 2.265309, 1.251775, 1, 0, 0.3254902, 1,
1.649376, -0.4289255, 1.870531, 1, 0, 0.3176471, 1,
1.65398, -0.2843645, 1.537906, 1, 0, 0.3137255, 1,
1.662375, 0.8662, 0.1363047, 1, 0, 0.3058824, 1,
1.678293, 0.09714624, 1.030527, 1, 0, 0.2980392, 1,
1.7135, 1.396168, 2.881573, 1, 0, 0.2941177, 1,
1.723455, 1.609871, -0.2167277, 1, 0, 0.2862745, 1,
1.737181, -0.3963726, 1.699072, 1, 0, 0.282353, 1,
1.750757, -1.721054, 3.687722, 1, 0, 0.2745098, 1,
1.750793, -1.291069, 1.58328, 1, 0, 0.2705882, 1,
1.764517, -0.8695964, 1.895774, 1, 0, 0.2627451, 1,
1.771176, 0.3054984, 1.773227, 1, 0, 0.2588235, 1,
1.774672, -1.223668, 1.668809, 1, 0, 0.2509804, 1,
1.794435, -0.9493159, 0.9624726, 1, 0, 0.2470588, 1,
1.79827, 0.8362775, 0.4873664, 1, 0, 0.2392157, 1,
1.813135, 0.7639162, 0.2834008, 1, 0, 0.2352941, 1,
1.83073, 0.4910602, 2.869779, 1, 0, 0.227451, 1,
1.831849, 0.7157816, 1.521867, 1, 0, 0.2235294, 1,
1.863707, 0.8894345, 1.753311, 1, 0, 0.2156863, 1,
1.875282, 0.9777628, 1.168183, 1, 0, 0.2117647, 1,
1.889579, 0.7125279, 1.8998, 1, 0, 0.2039216, 1,
1.89447, -0.3711641, 1.723441, 1, 0, 0.1960784, 1,
1.895461, 0.3101608, 1.754806, 1, 0, 0.1921569, 1,
1.919144, -1.410848, 2.472732, 1, 0, 0.1843137, 1,
1.919492, 0.6450369, -0.2076537, 1, 0, 0.1803922, 1,
1.943303, -1.35658, 1.969984, 1, 0, 0.172549, 1,
1.958852, 2.186008, 1.512814, 1, 0, 0.1686275, 1,
1.965462, -0.7796018, 2.175979, 1, 0, 0.1607843, 1,
1.989275, 0.1231774, -0.304157, 1, 0, 0.1568628, 1,
2.000709, -1.110737, 2.339568, 1, 0, 0.1490196, 1,
2.012184, 1.47821, -0.5159241, 1, 0, 0.145098, 1,
2.069391, -0.05535612, 2.299672, 1, 0, 0.1372549, 1,
2.075217, 2.013135, -1.597594, 1, 0, 0.1333333, 1,
2.076548, -0.2710102, 2.481885, 1, 0, 0.1254902, 1,
2.080108, -0.1434444, 2.387452, 1, 0, 0.1215686, 1,
2.197192, 0.8765761, 1.349704, 1, 0, 0.1137255, 1,
2.203512, -0.7457862, 1.750484, 1, 0, 0.1098039, 1,
2.20391, -0.9456698, 1.891182, 1, 0, 0.1019608, 1,
2.245454, 1.099227, 1.311699, 1, 0, 0.09411765, 1,
2.291095, -1.40252, 1.634125, 1, 0, 0.09019608, 1,
2.30767, -1.030579, 3.796861, 1, 0, 0.08235294, 1,
2.331379, -0.6825618, 2.497463, 1, 0, 0.07843138, 1,
2.352084, 2.048216, -0.5872172, 1, 0, 0.07058824, 1,
2.395873, 0.647866, 1.903072, 1, 0, 0.06666667, 1,
2.414516, 0.1041033, 2.317237, 1, 0, 0.05882353, 1,
2.445093, -0.04625475, 1.625728, 1, 0, 0.05490196, 1,
2.48136, 1.532877, 0.228694, 1, 0, 0.04705882, 1,
2.581328, 1.093481, 0.2570471, 1, 0, 0.04313726, 1,
2.803966, -0.06976687, 1.064168, 1, 0, 0.03529412, 1,
2.908984, 0.7977416, 3.207489, 1, 0, 0.03137255, 1,
2.964307, -1.129533, 1.342072, 1, 0, 0.02352941, 1,
3.032002, 1.482221, 2.483839, 1, 0, 0.01960784, 1,
3.289663, -0.6204054, 1.515196, 1, 0, 0.01176471, 1,
3.327482, -1.004963, 4.299779, 1, 0, 0.007843138, 1
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
-0.04147696, -4.268603, -7.09155, 0, -0.5, 0.5, 0.5,
-0.04147696, -4.268603, -7.09155, 1, -0.5, 0.5, 0.5,
-0.04147696, -4.268603, -7.09155, 1, 1.5, 0.5, 0.5,
-0.04147696, -4.268603, -7.09155, 0, 1.5, 0.5, 0.5
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
-4.552512, 0.2313197, -7.09155, 0, -0.5, 0.5, 0.5,
-4.552512, 0.2313197, -7.09155, 1, -0.5, 0.5, 0.5,
-4.552512, 0.2313197, -7.09155, 1, 1.5, 0.5, 0.5,
-4.552512, 0.2313197, -7.09155, 0, 1.5, 0.5, 0.5
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
-4.552512, -4.268603, 0.07325268, 0, -0.5, 0.5, 0.5,
-4.552512, -4.268603, 0.07325268, 1, -0.5, 0.5, 0.5,
-4.552512, -4.268603, 0.07325268, 1, 1.5, 0.5, 0.5,
-4.552512, -4.268603, 0.07325268, 0, 1.5, 0.5, 0.5
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
-3, -3.23016, -5.438134,
3, -3.23016, -5.438134,
-3, -3.23016, -5.438134,
-3, -3.403234, -5.713703,
-2, -3.23016, -5.438134,
-2, -3.403234, -5.713703,
-1, -3.23016, -5.438134,
-1, -3.403234, -5.713703,
0, -3.23016, -5.438134,
0, -3.403234, -5.713703,
1, -3.23016, -5.438134,
1, -3.403234, -5.713703,
2, -3.23016, -5.438134,
2, -3.403234, -5.713703,
3, -3.23016, -5.438134,
3, -3.403234, -5.713703
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
-3, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
-3, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
-3, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
-3, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5,
-2, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
-2, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
-2, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
-2, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5,
-1, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
-1, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
-1, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
-1, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5,
0, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
0, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
0, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
0, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5,
1, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
1, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
1, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
1, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5,
2, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
2, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
2, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
2, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5,
3, -3.749381, -6.264842, 0, -0.5, 0.5, 0.5,
3, -3.749381, -6.264842, 1, -0.5, 0.5, 0.5,
3, -3.749381, -6.264842, 1, 1.5, 0.5, 0.5,
3, -3.749381, -6.264842, 0, 1.5, 0.5, 0.5
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
-3.511504, -3, -5.438134,
-3.511504, 3, -5.438134,
-3.511504, -3, -5.438134,
-3.685006, -3, -5.713703,
-3.511504, -2, -5.438134,
-3.685006, -2, -5.713703,
-3.511504, -1, -5.438134,
-3.685006, -1, -5.713703,
-3.511504, 0, -5.438134,
-3.685006, 0, -5.713703,
-3.511504, 1, -5.438134,
-3.685006, 1, -5.713703,
-3.511504, 2, -5.438134,
-3.685006, 2, -5.713703,
-3.511504, 3, -5.438134,
-3.685006, 3, -5.713703
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
-4.032008, -3, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, -3, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, -3, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, -3, -6.264842, 0, 1.5, 0.5, 0.5,
-4.032008, -2, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, -2, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, -2, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, -2, -6.264842, 0, 1.5, 0.5, 0.5,
-4.032008, -1, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, -1, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, -1, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, -1, -6.264842, 0, 1.5, 0.5, 0.5,
-4.032008, 0, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, 0, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, 0, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, 0, -6.264842, 0, 1.5, 0.5, 0.5,
-4.032008, 1, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, 1, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, 1, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, 1, -6.264842, 0, 1.5, 0.5, 0.5,
-4.032008, 2, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, 2, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, 2, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, 2, -6.264842, 0, 1.5, 0.5, 0.5,
-4.032008, 3, -6.264842, 0, -0.5, 0.5, 0.5,
-4.032008, 3, -6.264842, 1, -0.5, 0.5, 0.5,
-4.032008, 3, -6.264842, 1, 1.5, 0.5, 0.5,
-4.032008, 3, -6.264842, 0, 1.5, 0.5, 0.5
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
-3.511504, -3.23016, -4,
-3.511504, -3.23016, 4,
-3.511504, -3.23016, -4,
-3.685006, -3.403234, -4,
-3.511504, -3.23016, -2,
-3.685006, -3.403234, -2,
-3.511504, -3.23016, 0,
-3.685006, -3.403234, 0,
-3.511504, -3.23016, 2,
-3.685006, -3.403234, 2,
-3.511504, -3.23016, 4,
-3.685006, -3.403234, 4
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
-4.032008, -3.749381, -4, 0, -0.5, 0.5, 0.5,
-4.032008, -3.749381, -4, 1, -0.5, 0.5, 0.5,
-4.032008, -3.749381, -4, 1, 1.5, 0.5, 0.5,
-4.032008, -3.749381, -4, 0, 1.5, 0.5, 0.5,
-4.032008, -3.749381, -2, 0, -0.5, 0.5, 0.5,
-4.032008, -3.749381, -2, 1, -0.5, 0.5, 0.5,
-4.032008, -3.749381, -2, 1, 1.5, 0.5, 0.5,
-4.032008, -3.749381, -2, 0, 1.5, 0.5, 0.5,
-4.032008, -3.749381, 0, 0, -0.5, 0.5, 0.5,
-4.032008, -3.749381, 0, 1, -0.5, 0.5, 0.5,
-4.032008, -3.749381, 0, 1, 1.5, 0.5, 0.5,
-4.032008, -3.749381, 0, 0, 1.5, 0.5, 0.5,
-4.032008, -3.749381, 2, 0, -0.5, 0.5, 0.5,
-4.032008, -3.749381, 2, 1, -0.5, 0.5, 0.5,
-4.032008, -3.749381, 2, 1, 1.5, 0.5, 0.5,
-4.032008, -3.749381, 2, 0, 1.5, 0.5, 0.5,
-4.032008, -3.749381, 4, 0, -0.5, 0.5, 0.5,
-4.032008, -3.749381, 4, 1, -0.5, 0.5, 0.5,
-4.032008, -3.749381, 4, 1, 1.5, 0.5, 0.5,
-4.032008, -3.749381, 4, 0, 1.5, 0.5, 0.5
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
-3.511504, -3.23016, -5.438134,
-3.511504, 3.692799, -5.438134,
-3.511504, -3.23016, 5.584639,
-3.511504, 3.692799, 5.584639,
-3.511504, -3.23016, -5.438134,
-3.511504, -3.23016, 5.584639,
-3.511504, 3.692799, -5.438134,
-3.511504, 3.692799, 5.584639,
-3.511504, -3.23016, -5.438134,
3.42855, -3.23016, -5.438134,
-3.511504, -3.23016, 5.584639,
3.42855, -3.23016, 5.584639,
-3.511504, 3.692799, -5.438134,
3.42855, 3.692799, -5.438134,
-3.511504, 3.692799, 5.584639,
3.42855, 3.692799, 5.584639,
3.42855, -3.23016, -5.438134,
3.42855, 3.692799, -5.438134,
3.42855, -3.23016, 5.584639,
3.42855, 3.692799, 5.584639,
3.42855, -3.23016, -5.438134,
3.42855, -3.23016, 5.584639,
3.42855, 3.692799, -5.438134,
3.42855, 3.692799, 5.584639
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
var radius = 7.87677;
var distance = 35.04464;
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
mvMatrix.translate( 0.04147696, -0.2313197, -0.07325268 );
mvMatrix.scale( 1.227154, 1.230185, 0.7726294 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.04464);
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
Octopamine<-read.table("Octopamine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Octopamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Octopamine' not found
```

```r
y<-Octopamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Octopamine' not found
```

```r
z<-Octopamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Octopamine' not found
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
-3.410435, 1.20266, -2.560078, 0, 0, 1, 1, 1,
-3.341159, 1.448658, -0.743077, 1, 0, 0, 1, 1,
-3.037894, 1.313285, -2.194607, 1, 0, 0, 1, 1,
-2.961768, -0.7729101, -3.635842, 1, 0, 0, 1, 1,
-2.828311, 1.681539, -2.006755, 1, 0, 0, 1, 1,
-2.783024, -2.209437, -1.476341, 1, 0, 0, 1, 1,
-2.551143, 0.6911212, -2.273099, 0, 0, 0, 1, 1,
-2.543052, -0.2263229, -1.530143, 0, 0, 0, 1, 1,
-2.495927, 0.4641982, -1.731461, 0, 0, 0, 1, 1,
-2.448771, 1.071837, -1.052235, 0, 0, 0, 1, 1,
-2.430769, 0.01821407, 0.4845614, 0, 0, 0, 1, 1,
-2.427489, -0.5041552, -1.47594, 0, 0, 0, 1, 1,
-2.374388, -0.6980374, -2.07603, 0, 0, 0, 1, 1,
-2.301157, -2.040743, -3.095556, 1, 1, 1, 1, 1,
-2.179785, -0.2449151, -1.687011, 1, 1, 1, 1, 1,
-2.169955, 0.7651657, 0.3671866, 1, 1, 1, 1, 1,
-2.092762, 0.4735491, -0.9689878, 1, 1, 1, 1, 1,
-2.083671, -0.1622255, -1.563852, 1, 1, 1, 1, 1,
-2.03734, 1.050815, -1.622936, 1, 1, 1, 1, 1,
-2.035999, -0.109375, -1.816674, 1, 1, 1, 1, 1,
-1.984569, -1.039092, -1.220717, 1, 1, 1, 1, 1,
-1.9808, -1.922003, -0.8422045, 1, 1, 1, 1, 1,
-1.958288, -0.2817265, 0.8225849, 1, 1, 1, 1, 1,
-1.945912, -1.316656, -1.167723, 1, 1, 1, 1, 1,
-1.930874, -1.308853, -3.256362, 1, 1, 1, 1, 1,
-1.925548, 0.186324, -2.747587, 1, 1, 1, 1, 1,
-1.923285, -0.5961795, -0.5006295, 1, 1, 1, 1, 1,
-1.886528, -0.3336664, -1.94978, 1, 1, 1, 1, 1,
-1.884563, -0.03549728, -1.848315, 0, 0, 1, 1, 1,
-1.883587, 0.9579518, 0.1901728, 1, 0, 0, 1, 1,
-1.844772, 0.005831962, -2.446339, 1, 0, 0, 1, 1,
-1.83981, -0.5761275, -1.409404, 1, 0, 0, 1, 1,
-1.831185, -0.8433322, -2.089614, 1, 0, 0, 1, 1,
-1.798918, 0.4220078, -2.99795, 1, 0, 0, 1, 1,
-1.785835, -0.499445, -0.7215609, 0, 0, 0, 1, 1,
-1.784685, -0.09442082, -0.801012, 0, 0, 0, 1, 1,
-1.772493, 0.9354498, -0.1684581, 0, 0, 0, 1, 1,
-1.770772, -0.113439, -1.211812, 0, 0, 0, 1, 1,
-1.769718, -1.115936, -1.430551, 0, 0, 0, 1, 1,
-1.767698, 0.2525666, -0.0540022, 0, 0, 0, 1, 1,
-1.762397, -2.013043, -0.7584042, 0, 0, 0, 1, 1,
-1.724033, 0.7440295, -1.014926, 1, 1, 1, 1, 1,
-1.721778, -0.09955011, -3.25139, 1, 1, 1, 1, 1,
-1.714329, -0.0387607, -1.941422, 1, 1, 1, 1, 1,
-1.70032, 1.563591, -1.03799, 1, 1, 1, 1, 1,
-1.684102, 1.742966, -2.181168, 1, 1, 1, 1, 1,
-1.680171, 1.128525, -1.016995, 1, 1, 1, 1, 1,
-1.670552, -2.221603, -2.759663, 1, 1, 1, 1, 1,
-1.667773, -0.07221411, -2.321105, 1, 1, 1, 1, 1,
-1.65421, -0.5121987, -0.1890052, 1, 1, 1, 1, 1,
-1.653057, 1.359954, -2.267458, 1, 1, 1, 1, 1,
-1.635924, -0.189166, -0.6132579, 1, 1, 1, 1, 1,
-1.62318, -1.818068, -2.227349, 1, 1, 1, 1, 1,
-1.616602, 0.1893942, -0.9881729, 1, 1, 1, 1, 1,
-1.612329, 0.1672555, -1.226597, 1, 1, 1, 1, 1,
-1.59494, -0.212419, -1.800659, 1, 1, 1, 1, 1,
-1.589573, -0.6762242, -1.627042, 0, 0, 1, 1, 1,
-1.579529, -0.762336, -2.925016, 1, 0, 0, 1, 1,
-1.578806, -1.160303, -0.166994, 1, 0, 0, 1, 1,
-1.577256, -0.9523649, -3.39516, 1, 0, 0, 1, 1,
-1.57465, -1.303542, -3.193814, 1, 0, 0, 1, 1,
-1.556691, -1.2017, -3.253934, 1, 0, 0, 1, 1,
-1.555105, 0.05070345, -0.9492881, 0, 0, 0, 1, 1,
-1.544932, -0.6589971, -2.087384, 0, 0, 0, 1, 1,
-1.541285, 1.238424, 0.5452566, 0, 0, 0, 1, 1,
-1.524006, -0.7600647, -2.821356, 0, 0, 0, 1, 1,
-1.51318, 0.9777853, -0.1326418, 0, 0, 0, 1, 1,
-1.500196, -1.086936, -2.733471, 0, 0, 0, 1, 1,
-1.47246, 0.7838386, -0.6662464, 0, 0, 0, 1, 1,
-1.472405, 0.482168, -1.717775, 1, 1, 1, 1, 1,
-1.471586, 1.256139, -0.1960478, 1, 1, 1, 1, 1,
-1.469048, -0.553863, -1.257898, 1, 1, 1, 1, 1,
-1.448899, -0.3940165, -2.197511, 1, 1, 1, 1, 1,
-1.438632, 0.6306877, 0.3256907, 1, 1, 1, 1, 1,
-1.438585, 0.9212826, 0.9057226, 1, 1, 1, 1, 1,
-1.421395, -0.327926, -2.095122, 1, 1, 1, 1, 1,
-1.407753, 1.119144, -0.4587698, 1, 1, 1, 1, 1,
-1.39147, -1.073944, -2.80667, 1, 1, 1, 1, 1,
-1.38922, 0.6964817, -2.003175, 1, 1, 1, 1, 1,
-1.387029, -1.368812, -3.111607, 1, 1, 1, 1, 1,
-1.386014, -2.01868, -1.694611, 1, 1, 1, 1, 1,
-1.382442, -1.159634, -0.84785, 1, 1, 1, 1, 1,
-1.373562, -1.153501, -3.042509, 1, 1, 1, 1, 1,
-1.361495, -0.6955917, -1.53069, 1, 1, 1, 1, 1,
-1.359929, 0.4635903, -0.4962679, 0, 0, 1, 1, 1,
-1.356601, 0.08059555, 0.8947123, 1, 0, 0, 1, 1,
-1.353539, -0.7726463, -1.989652, 1, 0, 0, 1, 1,
-1.349534, -0.4818756, -1.569222, 1, 0, 0, 1, 1,
-1.336072, -0.1696416, -1.095072, 1, 0, 0, 1, 1,
-1.335765, -0.7816442, -0.5747448, 1, 0, 0, 1, 1,
-1.323504, 0.9721434, -1.980473, 0, 0, 0, 1, 1,
-1.302962, -0.3793536, -2.806991, 0, 0, 0, 1, 1,
-1.294165, -2.594577, -0.6225196, 0, 0, 0, 1, 1,
-1.293561, -1.446237, -3.585328, 0, 0, 0, 1, 1,
-1.285663, 0.5720515, -1.063223, 0, 0, 0, 1, 1,
-1.28168, 1.603629, -0.6984439, 0, 0, 0, 1, 1,
-1.278783, 0.1798494, -1.158636, 0, 0, 0, 1, 1,
-1.273795, 0.7399436, -2.053038, 1, 1, 1, 1, 1,
-1.272815, 0.1491712, -0.6466029, 1, 1, 1, 1, 1,
-1.26963, 0.4786612, -1.90603, 1, 1, 1, 1, 1,
-1.266501, -0.4894938, -1.931189, 1, 1, 1, 1, 1,
-1.262071, -0.4113693, -1.72414, 1, 1, 1, 1, 1,
-1.259902, -0.9954276, -2.019406, 1, 1, 1, 1, 1,
-1.250618, 0.2040895, -3.005987, 1, 1, 1, 1, 1,
-1.242672, 1.060105, -1.120225, 1, 1, 1, 1, 1,
-1.240113, -0.08019805, -1.099323, 1, 1, 1, 1, 1,
-1.238361, -1.260071, -3.060006, 1, 1, 1, 1, 1,
-1.235484, -0.419774, -1.201085, 1, 1, 1, 1, 1,
-1.231478, 0.1601681, -1.930258, 1, 1, 1, 1, 1,
-1.220981, -0.5584873, -2.462615, 1, 1, 1, 1, 1,
-1.206294, -0.02992658, -1.241964, 1, 1, 1, 1, 1,
-1.20462, -0.9219723, -2.854488, 1, 1, 1, 1, 1,
-1.198181, -1.28694, -2.19555, 0, 0, 1, 1, 1,
-1.197067, -0.132149, -1.381731, 1, 0, 0, 1, 1,
-1.179228, 1.341403, -0.7166559, 1, 0, 0, 1, 1,
-1.173499, -0.9714404, -1.976978, 1, 0, 0, 1, 1,
-1.171586, 0.2248272, -0.9304951, 1, 0, 0, 1, 1,
-1.164106, -0.9485898, -3.495011, 1, 0, 0, 1, 1,
-1.154754, -0.9770508, -1.687942, 0, 0, 0, 1, 1,
-1.143547, -0.02815126, -0.7215887, 0, 0, 0, 1, 1,
-1.133816, -1.931387, -2.295303, 0, 0, 0, 1, 1,
-1.131242, -0.05701704, -0.9395896, 0, 0, 0, 1, 1,
-1.130753, -0.6736721, -0.4527099, 0, 0, 0, 1, 1,
-1.129997, 0.3176479, -2.18362, 0, 0, 0, 1, 1,
-1.125682, 0.3942327, -1.652862, 0, 0, 0, 1, 1,
-1.11634, 0.3700804, -2.125782, 1, 1, 1, 1, 1,
-1.113244, -0.4604923, -3.239129, 1, 1, 1, 1, 1,
-1.101236, -0.7935261, -1.510221, 1, 1, 1, 1, 1,
-1.084623, 0.03495884, -2.623687, 1, 1, 1, 1, 1,
-1.082549, -0.2492068, -2.824036, 1, 1, 1, 1, 1,
-1.073344, -2.393299, -1.171728, 1, 1, 1, 1, 1,
-1.066484, -2.054079, -2.599837, 1, 1, 1, 1, 1,
-1.066131, -0.1163108, -2.707908, 1, 1, 1, 1, 1,
-1.062492, -0.3683566, -3.960167, 1, 1, 1, 1, 1,
-1.059661, -0.08030174, -0.964655, 1, 1, 1, 1, 1,
-1.053943, -2.235993, -3.458668, 1, 1, 1, 1, 1,
-1.045233, -0.6809871, -3.538544, 1, 1, 1, 1, 1,
-1.044339, 0.103299, -2.598987, 1, 1, 1, 1, 1,
-1.043798, -0.5976355, -2.928807, 1, 1, 1, 1, 1,
-1.043561, -0.4292084, 0.8409637, 1, 1, 1, 1, 1,
-1.043118, 0.6453513, -1.065688, 0, 0, 1, 1, 1,
-1.038332, -0.1140172, -3.090125, 1, 0, 0, 1, 1,
-1.031593, 1.541161, -1.281465, 1, 0, 0, 1, 1,
-1.031325, 0.04251171, -2.039813, 1, 0, 0, 1, 1,
-1.028093, 0.7436431, -1.094166, 1, 0, 0, 1, 1,
-1.0183, 0.3898554, -3.493432, 1, 0, 0, 1, 1,
-1.017247, -0.6064715, -1.815467, 0, 0, 0, 1, 1,
-1.010802, 0.9071442, -0.6873154, 0, 0, 0, 1, 1,
-1.00178, 0.8329099, -1.793099, 0, 0, 0, 1, 1,
-0.9976749, -1.041471, -2.086092, 0, 0, 0, 1, 1,
-0.9776629, -0.5008067, -0.8559746, 0, 0, 0, 1, 1,
-0.9762444, -1.420695, -2.186072, 0, 0, 0, 1, 1,
-0.9738662, -0.314564, -1.311084, 0, 0, 0, 1, 1,
-0.9737992, -0.4762916, -2.026597, 1, 1, 1, 1, 1,
-0.9682554, 0.7459747, -2.221575, 1, 1, 1, 1, 1,
-0.9675336, -1.816332, -2.308208, 1, 1, 1, 1, 1,
-0.9638609, -0.09581102, -1.653876, 1, 1, 1, 1, 1,
-0.9627413, 0.7884042, -0.2679739, 1, 1, 1, 1, 1,
-0.9607873, 0.8156785, 0.05599699, 1, 1, 1, 1, 1,
-0.9589636, -1.099148, -1.330502, 1, 1, 1, 1, 1,
-0.9586886, 0.4717132, 0.1273201, 1, 1, 1, 1, 1,
-0.9575889, -0.7120656, -4.386992, 1, 1, 1, 1, 1,
-0.9559197, -0.6102157, -2.002985, 1, 1, 1, 1, 1,
-0.9517054, 0.2881526, -2.186104, 1, 1, 1, 1, 1,
-0.9476858, 0.9712541, -1.08375, 1, 1, 1, 1, 1,
-0.9463351, 0.9585077, -0.1751969, 1, 1, 1, 1, 1,
-0.9423313, -1.066256, -2.086221, 1, 1, 1, 1, 1,
-0.9415532, 0.4544891, -1.783363, 1, 1, 1, 1, 1,
-0.940739, 1.465643, -0.838336, 0, 0, 1, 1, 1,
-0.9393514, 0.05173205, -0.3586038, 1, 0, 0, 1, 1,
-0.9343484, -1.172068, -2.448449, 1, 0, 0, 1, 1,
-0.9328486, 0.4750175, 0.7418966, 1, 0, 0, 1, 1,
-0.932672, 1.341357, 0.8590921, 1, 0, 0, 1, 1,
-0.9282069, 0.646431, -1.325348, 1, 0, 0, 1, 1,
-0.925698, -0.974674, -2.760899, 0, 0, 0, 1, 1,
-0.921527, -1.034251, -3.176276, 0, 0, 0, 1, 1,
-0.9179488, 0.7234825, -0.3982539, 0, 0, 0, 1, 1,
-0.906615, 0.02933796, -1.055213, 0, 0, 0, 1, 1,
-0.9033409, 0.5860689, -2.358944, 0, 0, 0, 1, 1,
-0.9027822, -0.5078487, -0.8710063, 0, 0, 0, 1, 1,
-0.9018086, 1.450275, 1.028221, 0, 0, 0, 1, 1,
-0.89898, -0.5885268, -2.888294, 1, 1, 1, 1, 1,
-0.8967026, -1.965806, -3.97842, 1, 1, 1, 1, 1,
-0.8953325, 0.4990547, -1.728569, 1, 1, 1, 1, 1,
-0.8921563, -0.07701343, -1.999928, 1, 1, 1, 1, 1,
-0.8733929, -1.352885, -4.08201, 1, 1, 1, 1, 1,
-0.8697446, 0.05315514, -0.8235415, 1, 1, 1, 1, 1,
-0.8694279, -0.7975533, -0.08020109, 1, 1, 1, 1, 1,
-0.8668481, 0.6022195, -1.837359, 1, 1, 1, 1, 1,
-0.8635556, 0.08293761, -1.827309, 1, 1, 1, 1, 1,
-0.8541715, 1.184682, -1.528509, 1, 1, 1, 1, 1,
-0.8403619, 0.1535122, -2.533849, 1, 1, 1, 1, 1,
-0.8402147, 0.4331359, -0.1312196, 1, 1, 1, 1, 1,
-0.8374884, 1.351816, -0.08678862, 1, 1, 1, 1, 1,
-0.8335558, 0.1568497, -0.5588517, 1, 1, 1, 1, 1,
-0.8316659, 1.304171, -0.9753155, 1, 1, 1, 1, 1,
-0.82784, 0.09262195, -3.076611, 0, 0, 1, 1, 1,
-0.8222777, -0.8974395, -1.39206, 1, 0, 0, 1, 1,
-0.8160104, -1.492032, -2.898899, 1, 0, 0, 1, 1,
-0.8132458, 0.08296091, -2.156441, 1, 0, 0, 1, 1,
-0.8121815, -0.4011383, -3.766962, 1, 0, 0, 1, 1,
-0.8116314, 1.889592, -0.6604151, 1, 0, 0, 1, 1,
-0.8088765, -1.100037, -2.097688, 0, 0, 0, 1, 1,
-0.8058398, -1.646123, -2.263619, 0, 0, 0, 1, 1,
-0.7907618, 0.8537178, -0.100991, 0, 0, 0, 1, 1,
-0.7888598, -0.2675958, -3.731458, 0, 0, 0, 1, 1,
-0.7865559, -1.302715, -3.555452, 0, 0, 0, 1, 1,
-0.7825162, -0.8605508, -1.507885, 0, 0, 0, 1, 1,
-0.7744601, -1.397801, -1.963976, 0, 0, 0, 1, 1,
-0.7706996, 0.5919068, -3.273603, 1, 1, 1, 1, 1,
-0.7634294, -0.6199471, -1.006162, 1, 1, 1, 1, 1,
-0.7630761, -0.5968978, -1.983337, 1, 1, 1, 1, 1,
-0.7586542, -0.9072345, -3.016027, 1, 1, 1, 1, 1,
-0.7550856, 0.2354381, -0.3198015, 1, 1, 1, 1, 1,
-0.7535821, -1.367063, -4.454892, 1, 1, 1, 1, 1,
-0.7510673, 0.08793768, -1.257334, 1, 1, 1, 1, 1,
-0.7489313, 0.04040391, -1.416865, 1, 1, 1, 1, 1,
-0.7468101, 0.1066993, -0.7635677, 1, 1, 1, 1, 1,
-0.7436423, -0.09771869, -3.317901, 1, 1, 1, 1, 1,
-0.7399589, 1.348923, 0.3522872, 1, 1, 1, 1, 1,
-0.7382556, 0.1751129, -3.035476, 1, 1, 1, 1, 1,
-0.7352506, -0.5361066, -2.525004, 1, 1, 1, 1, 1,
-0.7279832, -0.9144777, -2.991955, 1, 1, 1, 1, 1,
-0.7274987, -0.7541535, -1.520312, 1, 1, 1, 1, 1,
-0.725236, -1.887439, -2.937993, 0, 0, 1, 1, 1,
-0.721859, 0.6376743, 0.6831087, 1, 0, 0, 1, 1,
-0.7215573, 0.5166277, 0.1388206, 1, 0, 0, 1, 1,
-0.7194214, -0.5668864, -3.279886, 1, 0, 0, 1, 1,
-0.7189382, 0.9910764, -0.579307, 1, 0, 0, 1, 1,
-0.7130736, -0.3441903, -1.6815, 1, 0, 0, 1, 1,
-0.7128073, 0.08656011, -2.15368, 0, 0, 0, 1, 1,
-0.710443, 0.571153, -0.5639302, 0, 0, 0, 1, 1,
-0.7064253, 1.087775, -0.8300664, 0, 0, 0, 1, 1,
-0.7028928, -0.1644035, -1.609693, 0, 0, 0, 1, 1,
-0.7028353, 0.05320877, -1.037857, 0, 0, 0, 1, 1,
-0.6984134, 0.4743884, -0.1555673, 0, 0, 0, 1, 1,
-0.6980052, -0.1380385, -1.666197, 0, 0, 0, 1, 1,
-0.6975836, 0.4123892, -0.8319054, 1, 1, 1, 1, 1,
-0.6966818, 0.5787508, -1.651468, 1, 1, 1, 1, 1,
-0.6952478, -1.473395, -2.184888, 1, 1, 1, 1, 1,
-0.6894031, 0.9727824, 0.2422369, 1, 1, 1, 1, 1,
-0.6871127, 0.1522799, -1.444987, 1, 1, 1, 1, 1,
-0.6843328, -0.2012464, -3.717212, 1, 1, 1, 1, 1,
-0.6838455, 1.206691, -0.5620767, 1, 1, 1, 1, 1,
-0.6801735, -0.6956443, -3.655649, 1, 1, 1, 1, 1,
-0.6687769, 0.8056668, 0.282554, 1, 1, 1, 1, 1,
-0.6671656, -0.07203634, -1.876295, 1, 1, 1, 1, 1,
-0.666612, -0.4439089, -1.625974, 1, 1, 1, 1, 1,
-0.6663877, 0.1315678, -0.6534135, 1, 1, 1, 1, 1,
-0.665095, 0.6677026, -0.8222685, 1, 1, 1, 1, 1,
-0.6597546, 0.4827968, -0.08110932, 1, 1, 1, 1, 1,
-0.6575283, -0.7378256, -3.137724, 1, 1, 1, 1, 1,
-0.6502948, 0.335628, -2.099714, 0, 0, 1, 1, 1,
-0.6409519, -0.4781813, -3.904885, 1, 0, 0, 1, 1,
-0.6359853, 0.8571869, -0.533644, 1, 0, 0, 1, 1,
-0.6346371, 1.196128, -1.916017, 1, 0, 0, 1, 1,
-0.6244581, -1.384201, -2.898239, 1, 0, 0, 1, 1,
-0.6236888, 0.3575698, 0.7424495, 1, 0, 0, 1, 1,
-0.6155692, 0.2633793, -1.071621, 0, 0, 0, 1, 1,
-0.6139343, 2.209301, -1.697866, 0, 0, 0, 1, 1,
-0.6083293, 0.9756405, -0.5686954, 0, 0, 0, 1, 1,
-0.6059601, -0.1114263, -1.367758, 0, 0, 0, 1, 1,
-0.6057353, -1.11035, -2.338162, 0, 0, 0, 1, 1,
-0.6042939, -2.012522, -2.180942, 0, 0, 0, 1, 1,
-0.5980269, 0.2336839, -0.9009529, 0, 0, 0, 1, 1,
-0.5976124, -0.4351209, -0.8984709, 1, 1, 1, 1, 1,
-0.5903267, -0.1049701, -0.7845066, 1, 1, 1, 1, 1,
-0.5901201, -1.395469, -1.853822, 1, 1, 1, 1, 1,
-0.5826555, 1.518957, -1.287407, 1, 1, 1, 1, 1,
-0.5824252, -0.9916834, -1.849015, 1, 1, 1, 1, 1,
-0.5760914, 0.2285715, -1.117485, 1, 1, 1, 1, 1,
-0.5744886, 0.3035824, -2.003307, 1, 1, 1, 1, 1,
-0.5675557, -0.5939887, -1.955102, 1, 1, 1, 1, 1,
-0.5672476, 1.112291, -0.07323084, 1, 1, 1, 1, 1,
-0.5600489, 0.7693859, -2.119522, 1, 1, 1, 1, 1,
-0.5599751, 0.9766479, -1.099709, 1, 1, 1, 1, 1,
-0.5534345, -0.3713241, -1.162137, 1, 1, 1, 1, 1,
-0.5519851, -1.24189, -3.204802, 1, 1, 1, 1, 1,
-0.5425589, -0.9304261, -3.867688, 1, 1, 1, 1, 1,
-0.5421544, 0.1465283, 0.1398702, 1, 1, 1, 1, 1,
-0.5303173, 0.7335547, -1.262351, 0, 0, 1, 1, 1,
-0.5301825, 0.4954859, 0.4022458, 1, 0, 0, 1, 1,
-0.5281702, 0.2938047, -1.492933, 1, 0, 0, 1, 1,
-0.526572, -0.595678, -3.112912, 1, 0, 0, 1, 1,
-0.525014, -0.6024933, -2.946516, 1, 0, 0, 1, 1,
-0.5221263, 0.5587323, 0.4328939, 1, 0, 0, 1, 1,
-0.5176612, 0.534977, -0.1407057, 0, 0, 0, 1, 1,
-0.5082831, -0.3845116, -1.646859, 0, 0, 0, 1, 1,
-0.5065299, -0.3620067, 1.385185, 0, 0, 0, 1, 1,
-0.505247, 0.3186851, -1.447116, 0, 0, 0, 1, 1,
-0.50485, -1.109606, -2.063398, 0, 0, 0, 1, 1,
-0.5043591, 0.6075596, -2.380457, 0, 0, 0, 1, 1,
-0.5020301, -0.3134523, -2.314334, 0, 0, 0, 1, 1,
-0.5000158, 1.966163, -0.3441505, 1, 1, 1, 1, 1,
-0.495281, -0.4074221, -1.283823, 1, 1, 1, 1, 1,
-0.4948134, 0.6723303, -2.263657, 1, 1, 1, 1, 1,
-0.4925993, -1.100747, -2.478081, 1, 1, 1, 1, 1,
-0.492592, -0.6533074, -0.8866739, 1, 1, 1, 1, 1,
-0.4870879, -0.2009642, -1.235983, 1, 1, 1, 1, 1,
-0.4834748, 0.4241425, -1.077718, 1, 1, 1, 1, 1,
-0.4804836, 1.61456, -1.040181, 1, 1, 1, 1, 1,
-0.4791462, -1.875889, -3.421911, 1, 1, 1, 1, 1,
-0.4783677, 0.6249004, 0.7019779, 1, 1, 1, 1, 1,
-0.4783035, -0.03196469, -2.439596, 1, 1, 1, 1, 1,
-0.4782851, 0.5592934, -0.6613696, 1, 1, 1, 1, 1,
-0.47292, -0.07200816, -3.024114, 1, 1, 1, 1, 1,
-0.4700213, -0.9135562, -0.9354456, 1, 1, 1, 1, 1,
-0.4651797, 0.077407, -1.20244, 1, 1, 1, 1, 1,
-0.4649765, -0.09218361, -2.442276, 0, 0, 1, 1, 1,
-0.4637851, 0.4094428, -0.2350928, 1, 0, 0, 1, 1,
-0.4620779, -0.1511394, -0.6644117, 1, 0, 0, 1, 1,
-0.4612019, -0.3172504, -0.5269434, 1, 0, 0, 1, 1,
-0.4532138, -0.9404145, -2.482162, 1, 0, 0, 1, 1,
-0.4527429, 0.3764431, 0.3427352, 1, 0, 0, 1, 1,
-0.452678, 0.1679382, -0.5207468, 0, 0, 0, 1, 1,
-0.4467504, -0.253031, -1.540407, 0, 0, 0, 1, 1,
-0.4460853, 1.303594, 1.020108, 0, 0, 0, 1, 1,
-0.4433216, -0.02899395, -1.486854, 0, 0, 0, 1, 1,
-0.4430355, -0.08507161, -2.773698, 0, 0, 0, 1, 1,
-0.4421678, 2.184286, -0.117563, 0, 0, 0, 1, 1,
-0.4354819, 0.2229792, -1.500376, 0, 0, 0, 1, 1,
-0.4318268, 2.318852, 0.6206009, 1, 1, 1, 1, 1,
-0.4310525, 0.4190603, 0.5548543, 1, 1, 1, 1, 1,
-0.4256636, 0.9272091, -0.3288517, 1, 1, 1, 1, 1,
-0.4221545, -1.292289, -3.011041, 1, 1, 1, 1, 1,
-0.4219868, 0.3351501, 1.027779, 1, 1, 1, 1, 1,
-0.4189147, 1.152298, -0.777084, 1, 1, 1, 1, 1,
-0.4174641, -1.826709, -3.224474, 1, 1, 1, 1, 1,
-0.4127962, 0.05637281, 0.3116637, 1, 1, 1, 1, 1,
-0.4127464, -1.501291, -3.554686, 1, 1, 1, 1, 1,
-0.4127418, -0.6886032, -1.250438, 1, 1, 1, 1, 1,
-0.4123661, -1.08963, -0.7378318, 1, 1, 1, 1, 1,
-0.4118763, 2.848365, -0.3122533, 1, 1, 1, 1, 1,
-0.4112644, -0.3216645, -2.140752, 1, 1, 1, 1, 1,
-0.4110884, 1.492526, -0.7074283, 1, 1, 1, 1, 1,
-0.4107198, 0.226804, 0.1368393, 1, 1, 1, 1, 1,
-0.4087729, 0.6174153, -0.3957588, 0, 0, 1, 1, 1,
-0.4081793, 1.67741, -0.1835818, 1, 0, 0, 1, 1,
-0.4058804, 0.9540734, 0.8236063, 1, 0, 0, 1, 1,
-0.403211, -0.8930659, -1.794004, 1, 0, 0, 1, 1,
-0.4031652, -2.074429, -2.421765, 1, 0, 0, 1, 1,
-0.4013179, -0.2350631, -1.705719, 1, 0, 0, 1, 1,
-0.3970829, 0.1176312, 0.01155574, 0, 0, 0, 1, 1,
-0.3968715, 1.329549, -0.5817575, 0, 0, 0, 1, 1,
-0.3966783, -0.6246802, -3.055198, 0, 0, 0, 1, 1,
-0.3867306, -1.332535, -4.116751, 0, 0, 0, 1, 1,
-0.38455, 0.7656271, -0.6940401, 0, 0, 0, 1, 1,
-0.3841077, 1.102509, -1.737844, 0, 0, 0, 1, 1,
-0.3839604, -0.8966253, -1.641291, 0, 0, 0, 1, 1,
-0.3826529, -1.005835, -3.959394, 1, 1, 1, 1, 1,
-0.3822749, 0.6806554, 0.2520487, 1, 1, 1, 1, 1,
-0.3747075, -0.5990226, -4.106096, 1, 1, 1, 1, 1,
-0.3724682, -1.957142, -3.444607, 1, 1, 1, 1, 1,
-0.3682439, -1.422029, -3.84263, 1, 1, 1, 1, 1,
-0.3629371, -0.2214133, -0.5700639, 1, 1, 1, 1, 1,
-0.3613533, -0.5902497, -2.34558, 1, 1, 1, 1, 1,
-0.3569556, -1.090347, -2.935524, 1, 1, 1, 1, 1,
-0.3514911, 0.1800212, -0.6298509, 1, 1, 1, 1, 1,
-0.3507694, 0.1840009, -2.498805, 1, 1, 1, 1, 1,
-0.3490679, 0.9931285, 1.02162, 1, 1, 1, 1, 1,
-0.3480242, 0.1892886, -1.873943, 1, 1, 1, 1, 1,
-0.3448591, 0.2052367, -2.747872, 1, 1, 1, 1, 1,
-0.3421183, -1.470897, -3.636439, 1, 1, 1, 1, 1,
-0.3350933, 0.9585081, 0.7347658, 1, 1, 1, 1, 1,
-0.328556, -0.5063315, -2.204101, 0, 0, 1, 1, 1,
-0.3215585, -0.09917327, -2.579285, 1, 0, 0, 1, 1,
-0.3214367, 0.3790138, -1.980681, 1, 0, 0, 1, 1,
-0.3172648, -0.4791028, -1.853615, 1, 0, 0, 1, 1,
-0.3137379, -0.4016309, -2.547304, 1, 0, 0, 1, 1,
-0.3095748, -1.510678, -2.307238, 1, 0, 0, 1, 1,
-0.3041561, 0.4877352, -1.882858, 0, 0, 0, 1, 1,
-0.3025054, 0.3030134, 0.2171364, 0, 0, 0, 1, 1,
-0.2998256, 0.7086936, -0.6657419, 0, 0, 0, 1, 1,
-0.2923808, -0.2200037, -1.460697, 0, 0, 0, 1, 1,
-0.2889793, -2.375379, -1.274784, 0, 0, 0, 1, 1,
-0.2854583, -1.383759, -3.156176, 0, 0, 0, 1, 1,
-0.2817753, -1.029152, -3.921658, 0, 0, 0, 1, 1,
-0.2811459, 0.2990485, 1.213546, 1, 1, 1, 1, 1,
-0.275758, 0.04106806, -0.7121809, 1, 1, 1, 1, 1,
-0.2754514, 2.020287, 1.091129, 1, 1, 1, 1, 1,
-0.2749851, -1.076794, -2.77001, 1, 1, 1, 1, 1,
-0.2724237, 1.042679, -0.4632623, 1, 1, 1, 1, 1,
-0.2703344, 1.132461, 2.027633, 1, 1, 1, 1, 1,
-0.2645234, 0.9319199, 0.4730524, 1, 1, 1, 1, 1,
-0.2643049, -0.4098708, -1.682469, 1, 1, 1, 1, 1,
-0.2629156, -1.077046, -3.27383, 1, 1, 1, 1, 1,
-0.2613194, 0.1335755, -1.170915, 1, 1, 1, 1, 1,
-0.2610789, 0.1782287, 0.02199621, 1, 1, 1, 1, 1,
-0.2610283, -1.698234, -2.350132, 1, 1, 1, 1, 1,
-0.2588701, -0.6725403, -2.766513, 1, 1, 1, 1, 1,
-0.2575715, 1.858476, -1.034721, 1, 1, 1, 1, 1,
-0.2503328, 0.1293773, 0.1458245, 1, 1, 1, 1, 1,
-0.247752, 0.4507086, -0.281013, 0, 0, 1, 1, 1,
-0.2399802, 0.1940619, -2.303346, 1, 0, 0, 1, 1,
-0.2361248, -1.049629, -1.14975, 1, 0, 0, 1, 1,
-0.234703, 0.4338593, -0.3225356, 1, 0, 0, 1, 1,
-0.2341116, 1.102971, -0.6002769, 1, 0, 0, 1, 1,
-0.2287558, -0.2116882, -2.109345, 1, 0, 0, 1, 1,
-0.2272744, -0.6590462, -2.403985, 0, 0, 0, 1, 1,
-0.2270562, 1.292107, -1.085647, 0, 0, 0, 1, 1,
-0.2253146, -1.128653, -2.132497, 0, 0, 0, 1, 1,
-0.2186946, 1.376056, -2.121664, 0, 0, 0, 1, 1,
-0.2176692, -0.2080721, -2.335239, 0, 0, 0, 1, 1,
-0.2135255, 1.246928, 0.2505094, 0, 0, 0, 1, 1,
-0.2113079, -0.430804, -2.926159, 0, 0, 0, 1, 1,
-0.2106889, -1.493301, -4.542077, 1, 1, 1, 1, 1,
-0.2033753, -1.16204, -2.210865, 1, 1, 1, 1, 1,
-0.2027647, 1.233858, -0.1615061, 1, 1, 1, 1, 1,
-0.1985376, -0.4355792, -2.937475, 1, 1, 1, 1, 1,
-0.1962187, -1.508149, -3.215717, 1, 1, 1, 1, 1,
-0.1955809, 0.8928823, -0.306922, 1, 1, 1, 1, 1,
-0.1940724, -1.795874, -2.918108, 1, 1, 1, 1, 1,
-0.1934049, -1.107587, -2.030837, 1, 1, 1, 1, 1,
-0.189773, -0.1197966, -2.938071, 1, 1, 1, 1, 1,
-0.1872965, -0.1421, -2.834006, 1, 1, 1, 1, 1,
-0.1803421, 1.019961, -1.801582, 1, 1, 1, 1, 1,
-0.1768512, -0.953546, -3.182922, 1, 1, 1, 1, 1,
-0.1728528, -2.350963, -3.841887, 1, 1, 1, 1, 1,
-0.1714229, 0.7292167, -0.524999, 1, 1, 1, 1, 1,
-0.1701193, -0.6805034, -2.8678, 1, 1, 1, 1, 1,
-0.1700084, -1.209567, -4.607677, 0, 0, 1, 1, 1,
-0.16941, -0.1699181, -1.453254, 1, 0, 0, 1, 1,
-0.1674924, 0.4147614, 0.6978613, 1, 0, 0, 1, 1,
-0.1668331, -0.6643865, -1.656928, 1, 0, 0, 1, 1,
-0.1655456, -0.8054016, -3.346404, 1, 0, 0, 1, 1,
-0.1636618, 0.7651522, 0.5551578, 1, 0, 0, 1, 1,
-0.1618042, -0.1588206, -2.104513, 0, 0, 0, 1, 1,
-0.1600793, 0.589639, -1.474053, 0, 0, 0, 1, 1,
-0.1537656, -0.9429323, -3.397394, 0, 0, 0, 1, 1,
-0.1503617, -0.1503722, -2.424793, 0, 0, 0, 1, 1,
-0.1455117, 0.4113428, -0.7151048, 0, 0, 0, 1, 1,
-0.1400827, -0.2718402, -3.849661, 0, 0, 0, 1, 1,
-0.1371883, -0.4151608, -2.474272, 0, 0, 0, 1, 1,
-0.1371107, 1.434315, 0.5166803, 1, 1, 1, 1, 1,
-0.1284858, -0.232704, -2.309786, 1, 1, 1, 1, 1,
-0.1274538, -1.149686, -3.199225, 1, 1, 1, 1, 1,
-0.1257199, 1.425085, 0.3278273, 1, 1, 1, 1, 1,
-0.1216491, -1.659755, -1.600506, 1, 1, 1, 1, 1,
-0.1189157, 1.785047, 0.1333529, 1, 1, 1, 1, 1,
-0.1176128, -0.6759332, -3.187992, 1, 1, 1, 1, 1,
-0.1175649, 0.9177553, -1.148572, 1, 1, 1, 1, 1,
-0.1157031, 0.3812539, 1.1496, 1, 1, 1, 1, 1,
-0.1153946, -1.459248, -1.628862, 1, 1, 1, 1, 1,
-0.1131829, -1.395778, -2.846254, 1, 1, 1, 1, 1,
-0.107516, -0.208924, -1.828749, 1, 1, 1, 1, 1,
-0.1070516, -1.805263, -3.885614, 1, 1, 1, 1, 1,
-0.1055047, 0.37627, -0.5679283, 1, 1, 1, 1, 1,
-0.1033343, 0.3830572, -1.047181, 1, 1, 1, 1, 1,
-0.09949394, 0.4717751, 0.2647164, 0, 0, 1, 1, 1,
-0.09234268, -0.7801217, -3.099124, 1, 0, 0, 1, 1,
-0.09212604, -0.3029517, -3.355846, 1, 0, 0, 1, 1,
-0.08711325, -1.153525, -1.958173, 1, 0, 0, 1, 1,
-0.08375049, 0.4884388, -0.7891864, 1, 0, 0, 1, 1,
-0.08140723, -0.7990375, -5.277608, 1, 0, 0, 1, 1,
-0.07982139, -0.9723606, -2.318756, 0, 0, 0, 1, 1,
-0.07893214, 0.2971777, -0.1083909, 0, 0, 0, 1, 1,
-0.07055432, -0.7204838, -3.989723, 0, 0, 0, 1, 1,
-0.06692398, -0.4712236, -3.11767, 0, 0, 0, 1, 1,
-0.06542833, 0.8335502, -0.1654536, 0, 0, 0, 1, 1,
-0.06518873, -0.2206444, -3.738515, 0, 0, 0, 1, 1,
-0.06430817, -0.3797654, -3.315449, 0, 0, 0, 1, 1,
-0.06145871, 1.239634, 0.647884, 1, 1, 1, 1, 1,
-0.06140238, -1.17747, -4.79357, 1, 1, 1, 1, 1,
-0.06077576, -0.9911276, -1.747333, 1, 1, 1, 1, 1,
-0.06009113, -2.442622, -2.26543, 1, 1, 1, 1, 1,
-0.05746821, 0.9987617, -1.487516, 1, 1, 1, 1, 1,
-0.05423058, 0.4932332, -0.05044064, 1, 1, 1, 1, 1,
-0.04962118, -1.678292, -3.11008, 1, 1, 1, 1, 1,
-0.04434995, 2.232121, 0.2954328, 1, 1, 1, 1, 1,
-0.03840579, 0.4745612, -0.8420818, 1, 1, 1, 1, 1,
-0.03517986, 1.592962, -0.2085523, 1, 1, 1, 1, 1,
-0.03402001, 0.2888296, 0.8905901, 1, 1, 1, 1, 1,
-0.03099779, 1.925275, 0.4523114, 1, 1, 1, 1, 1,
-0.02618557, 0.3138153, 0.8311401, 1, 1, 1, 1, 1,
-0.02480393, -0.4171043, -4.681301, 1, 1, 1, 1, 1,
-0.02464945, 0.8239035, -0.00586007, 1, 1, 1, 1, 1,
-0.02405241, -0.6039504, -2.957489, 0, 0, 1, 1, 1,
-0.02333975, 1.940691, -0.5255905, 1, 0, 0, 1, 1,
-0.01806863, -0.4491057, -3.60605, 1, 0, 0, 1, 1,
-0.01782327, 0.5916064, 2.710896, 1, 0, 0, 1, 1,
-0.01142969, 0.3203996, 0.3711905, 1, 0, 0, 1, 1,
-0.00543768, -0.932182, -3.30563, 1, 0, 0, 1, 1,
-0.003586016, 0.2806834, -0.7861865, 0, 0, 0, 1, 1,
-0.0007469512, 0.1056976, -1.157967, 0, 0, 0, 1, 1,
0.008674247, 0.06338067, 0.1544656, 0, 0, 0, 1, 1,
0.01217251, 2.129926, -0.8002051, 0, 0, 0, 1, 1,
0.01319049, 0.1617518, -0.8556527, 0, 0, 0, 1, 1,
0.01555016, 0.301815, -1.144015, 0, 0, 0, 1, 1,
0.01578377, 0.342696, -0.7262189, 0, 0, 0, 1, 1,
0.01819686, 0.384282, -0.4992076, 1, 1, 1, 1, 1,
0.01949428, 0.05000575, 0.1080633, 1, 1, 1, 1, 1,
0.02138615, -0.3340539, 3.759466, 1, 1, 1, 1, 1,
0.02186175, 1.951742, -0.1203714, 1, 1, 1, 1, 1,
0.02229475, 0.1912103, 1.709008, 1, 1, 1, 1, 1,
0.02275204, -0.2952946, 1.517792, 1, 1, 1, 1, 1,
0.02756758, 0.4824883, 0.1828956, 1, 1, 1, 1, 1,
0.02795303, -0.7985514, 4.290903, 1, 1, 1, 1, 1,
0.0288482, 0.04616061, 1.540249, 1, 1, 1, 1, 1,
0.03223049, 0.3921454, -0.0349261, 1, 1, 1, 1, 1,
0.04223394, -1.215526, 3.455878, 1, 1, 1, 1, 1,
0.04557482, -0.801142, 2.631528, 1, 1, 1, 1, 1,
0.05142882, 0.6099723, 0.3101307, 1, 1, 1, 1, 1,
0.05238764, 0.1903353, -1.691085, 1, 1, 1, 1, 1,
0.06063516, -1.414838, 3.07373, 1, 1, 1, 1, 1,
0.06219923, 0.6786058, -0.8430035, 0, 0, 1, 1, 1,
0.06254573, -0.04473539, 1.094892, 1, 0, 0, 1, 1,
0.06448404, 2.444689, -0.3520076, 1, 0, 0, 1, 1,
0.0663855, 0.8138723, -0.0934904, 1, 0, 0, 1, 1,
0.0675751, -0.1624692, 3.171621, 1, 0, 0, 1, 1,
0.06907295, -0.04856391, 0.6400884, 1, 0, 0, 1, 1,
0.07309258, 0.7718221, 0.2533301, 0, 0, 0, 1, 1,
0.08011604, -2.163193, 3.162141, 0, 0, 0, 1, 1,
0.08150891, 1.082425, -1.31097, 0, 0, 0, 1, 1,
0.08236679, 0.3783749, 0.53966, 0, 0, 0, 1, 1,
0.08721431, 0.1748969, -0.2987532, 0, 0, 0, 1, 1,
0.09376602, 1.030926, -0.3579993, 0, 0, 0, 1, 1,
0.09450409, 0.4733446, 0.6334804, 0, 0, 0, 1, 1,
0.09687681, -0.2138596, 2.985525, 1, 1, 1, 1, 1,
0.09738477, -0.8281153, 2.969148, 1, 1, 1, 1, 1,
0.1001523, 0.342351, 1.394325, 1, 1, 1, 1, 1,
0.1044508, 1.535547, -1.19035, 1, 1, 1, 1, 1,
0.1045107, 0.904927, 0.959796, 1, 1, 1, 1, 1,
0.1069809, 1.795742, 0.5514633, 1, 1, 1, 1, 1,
0.1070554, -0.4406253, 2.900205, 1, 1, 1, 1, 1,
0.108405, 0.6334327, 1.1364, 1, 1, 1, 1, 1,
0.1100286, 0.2222966, 2.620208, 1, 1, 1, 1, 1,
0.110153, -1.124122, 1.064416, 1, 1, 1, 1, 1,
0.1104677, -0.8051146, 2.732154, 1, 1, 1, 1, 1,
0.1121302, -0.8220015, 2.3582, 1, 1, 1, 1, 1,
0.1121879, 2.247522, -0.1291078, 1, 1, 1, 1, 1,
0.1127631, 0.1756288, 0.2641566, 1, 1, 1, 1, 1,
0.114832, 1.893404, 2.081759, 1, 1, 1, 1, 1,
0.1150388, 0.4521945, 0.227865, 0, 0, 1, 1, 1,
0.118836, 0.2796513, 0.6892329, 1, 0, 0, 1, 1,
0.120959, 1.473076, 1.693248, 1, 0, 0, 1, 1,
0.1220877, -2.068676, 3.474998, 1, 0, 0, 1, 1,
0.124653, 0.9616773, 0.3787599, 1, 0, 0, 1, 1,
0.1257233, 0.828341, -0.8726289, 1, 0, 0, 1, 1,
0.1267647, 1.04624, -0.167621, 0, 0, 0, 1, 1,
0.1275124, -0.980288, 3.327845, 0, 0, 0, 1, 1,
0.1311152, 1.402754, -0.213859, 0, 0, 0, 1, 1,
0.1322053, 0.5854366, 0.7767825, 0, 0, 0, 1, 1,
0.1402038, 1.994515, -0.6159071, 0, 0, 0, 1, 1,
0.1451393, 0.4065931, 0.9233124, 0, 0, 0, 1, 1,
0.1502124, 0.5005343, 0.5920427, 0, 0, 0, 1, 1,
0.1517362, 0.6972923, 3.129471, 1, 1, 1, 1, 1,
0.1523573, 0.4433225, -1.049427, 1, 1, 1, 1, 1,
0.1586207, -3.12934, 1.726578, 1, 1, 1, 1, 1,
0.1589547, -1.539847, 4.530533, 1, 1, 1, 1, 1,
0.1664986, -0.3987888, 3.512854, 1, 1, 1, 1, 1,
0.1687282, -1.687587, 1.906511, 1, 1, 1, 1, 1,
0.1726388, -1.461393, 1.756913, 1, 1, 1, 1, 1,
0.1729264, -0.5528676, 3.359356, 1, 1, 1, 1, 1,
0.1741928, 0.1491035, 0.593987, 1, 1, 1, 1, 1,
0.1742055, 0.6472884, -0.6366353, 1, 1, 1, 1, 1,
0.1774485, 0.6936447, 0.4949725, 1, 1, 1, 1, 1,
0.17836, -0.7011353, 4.109757, 1, 1, 1, 1, 1,
0.1820172, 2.022026, 1.086653, 1, 1, 1, 1, 1,
0.1828194, 2.717774, 0.6450311, 1, 1, 1, 1, 1,
0.1839302, -0.1388501, 2.570386, 1, 1, 1, 1, 1,
0.1839612, 0.4837817, 1.152116, 0, 0, 1, 1, 1,
0.1862828, -0.08935153, 0.4669674, 1, 0, 0, 1, 1,
0.1888474, -0.8632463, 3.254992, 1, 0, 0, 1, 1,
0.1942767, -0.246585, 0.7538569, 1, 0, 0, 1, 1,
0.1951672, -0.08568791, 1.986779, 1, 0, 0, 1, 1,
0.1978431, -1.307613, 4.443668, 1, 0, 0, 1, 1,
0.2053115, -1.352712, 2.826158, 0, 0, 0, 1, 1,
0.2073953, 0.6848462, 1.642478, 0, 0, 0, 1, 1,
0.2109785, -0.2720678, 2.475654, 0, 0, 0, 1, 1,
0.2114673, 0.09052876, 1.032739, 0, 0, 0, 1, 1,
0.2125311, 1.074936, -0.06420267, 0, 0, 0, 1, 1,
0.2135098, 0.4828353, 1.029024, 0, 0, 0, 1, 1,
0.2160949, 0.9419084, 1.04505, 0, 0, 0, 1, 1,
0.2167497, 0.4419494, 0.05474885, 1, 1, 1, 1, 1,
0.2176942, 1.156237, 0.408437, 1, 1, 1, 1, 1,
0.2188925, 0.5336831, -0.6748349, 1, 1, 1, 1, 1,
0.2241511, -0.7035431, 3.020937, 1, 1, 1, 1, 1,
0.2292725, -0.01839094, 2.225903, 1, 1, 1, 1, 1,
0.230407, 1.327935, 0.7979373, 1, 1, 1, 1, 1,
0.2336348, -1.699057, 4.425124, 1, 1, 1, 1, 1,
0.2390836, -0.5598536, 2.973346, 1, 1, 1, 1, 1,
0.2417243, 1.371413, 1.086778, 1, 1, 1, 1, 1,
0.2482682, 1.821353, -1.446451, 1, 1, 1, 1, 1,
0.2483543, -0.6224864, 3.423792, 1, 1, 1, 1, 1,
0.2542949, 1.190842, -0.3418093, 1, 1, 1, 1, 1,
0.2559628, 0.7098151, 0.659656, 1, 1, 1, 1, 1,
0.2571131, 2.070883, -1.130388, 1, 1, 1, 1, 1,
0.2584421, 0.9226729, -1.091961, 1, 1, 1, 1, 1,
0.2611326, -0.09491886, 3.349534, 0, 0, 1, 1, 1,
0.2628316, -1.110035, 1.052257, 1, 0, 0, 1, 1,
0.265042, -0.655965, 4.868319, 1, 0, 0, 1, 1,
0.2684868, 0.2825285, 3.69494, 1, 0, 0, 1, 1,
0.2695518, 0.1657369, 3.372812, 1, 0, 0, 1, 1,
0.2735463, 0.9505184, -0.4497763, 1, 0, 0, 1, 1,
0.2750708, -0.8902735, 3.08868, 0, 0, 0, 1, 1,
0.2796391, 0.4600705, 1.386092, 0, 0, 0, 1, 1,
0.279693, 0.5881857, 0.1615423, 0, 0, 0, 1, 1,
0.2797035, -0.7345804, 3.518079, 0, 0, 0, 1, 1,
0.282561, 1.603485, -0.1613944, 0, 0, 0, 1, 1,
0.2843272, 0.7719994, 0.1866535, 0, 0, 0, 1, 1,
0.2854445, -0.4293767, 2.746748, 0, 0, 0, 1, 1,
0.2886457, 0.03137207, 3.195063, 1, 1, 1, 1, 1,
0.2891321, 0.2589659, 1.7426, 1, 1, 1, 1, 1,
0.2904156, 2.057926, -0.8747799, 1, 1, 1, 1, 1,
0.292105, -0.1134887, 1.657664, 1, 1, 1, 1, 1,
0.3021572, -0.2075906, 3.518368, 1, 1, 1, 1, 1,
0.3023903, 0.6104181, 0.4947585, 1, 1, 1, 1, 1,
0.3040634, -1.57766, 3.43917, 1, 1, 1, 1, 1,
0.3053523, -0.7912142, 5.424113, 1, 1, 1, 1, 1,
0.3059917, 2.25815, -0.5036713, 1, 1, 1, 1, 1,
0.3060981, 0.2796545, 0.09764294, 1, 1, 1, 1, 1,
0.3075479, -2.945728, 2.508433, 1, 1, 1, 1, 1,
0.3102089, 0.6456429, 0.6900317, 1, 1, 1, 1, 1,
0.3139252, 0.8436238, 0.6222802, 1, 1, 1, 1, 1,
0.3153158, 0.4712012, -0.141832, 1, 1, 1, 1, 1,
0.3167792, 1.179883, -0.3124018, 1, 1, 1, 1, 1,
0.3247826, 1.96291, -0.6017284, 0, 0, 1, 1, 1,
0.3275987, 0.5974216, 0.1141565, 1, 0, 0, 1, 1,
0.3293739, -2.527062, 2.924867, 1, 0, 0, 1, 1,
0.3317705, -0.4870365, 2.395151, 1, 0, 0, 1, 1,
0.3318734, 0.8639696, 1.205381, 1, 0, 0, 1, 1,
0.3322625, 0.7237132, 0.7810842, 1, 0, 0, 1, 1,
0.334671, 0.6629925, -0.1630249, 0, 0, 0, 1, 1,
0.3372188, 0.4355064, 0.2189618, 0, 0, 0, 1, 1,
0.337326, -0.9923241, 2.349081, 0, 0, 0, 1, 1,
0.3396604, -0.001180532, 0.7286268, 0, 0, 0, 1, 1,
0.3401911, 0.4761607, 0.09751381, 0, 0, 0, 1, 1,
0.3405048, -0.6568337, 4.121081, 0, 0, 0, 1, 1,
0.3412682, -0.7480261, 3.245188, 0, 0, 0, 1, 1,
0.3435721, -0.2637977, 2.79705, 1, 1, 1, 1, 1,
0.3506673, 0.5160356, 1.106281, 1, 1, 1, 1, 1,
0.354481, 1.293272, 0.5665722, 1, 1, 1, 1, 1,
0.3549629, 0.07578219, 1.050376, 1, 1, 1, 1, 1,
0.3555959, 1.452931, -1.848302, 1, 1, 1, 1, 1,
0.3570822, -0.767727, 3.124461, 1, 1, 1, 1, 1,
0.3618526, -1.0541, 3.213057, 1, 1, 1, 1, 1,
0.3635498, 0.4658157, -1.345845, 1, 1, 1, 1, 1,
0.3656152, 0.798278, 0.4688371, 1, 1, 1, 1, 1,
0.3677787, 1.162162, -0.6370048, 1, 1, 1, 1, 1,
0.3716195, -0.1891613, 2.173398, 1, 1, 1, 1, 1,
0.3740691, -0.7747604, 3.368238, 1, 1, 1, 1, 1,
0.3748431, 1.667023, 0.5623826, 1, 1, 1, 1, 1,
0.3775564, -0.5895854, 2.088828, 1, 1, 1, 1, 1,
0.3797292, -1.825859, 3.051716, 1, 1, 1, 1, 1,
0.3834907, -0.9147667, 1.98052, 0, 0, 1, 1, 1,
0.3851027, -1.346444, 2.884678, 1, 0, 0, 1, 1,
0.3855545, 0.2169355, -0.2198134, 1, 0, 0, 1, 1,
0.3897873, -1.975004, 5.088671, 1, 0, 0, 1, 1,
0.4050636, 1.775038, 0.9800256, 1, 0, 0, 1, 1,
0.4052746, -0.8607287, 3.427598, 1, 0, 0, 1, 1,
0.4068123, 1.186676, -0.4064651, 0, 0, 0, 1, 1,
0.4155444, -0.8143723, 2.817557, 0, 0, 0, 1, 1,
0.4206911, 0.6980579, 1.237551, 0, 0, 0, 1, 1,
0.4285695, -0.05172021, 0.0277918, 0, 0, 0, 1, 1,
0.4319274, 0.06207259, 3.12086, 0, 0, 0, 1, 1,
0.4374711, 0.2745691, 0.2211891, 0, 0, 0, 1, 1,
0.4401143, 1.112209, 0.841329, 0, 0, 0, 1, 1,
0.4408621, 0.6170798, 1.144042, 1, 1, 1, 1, 1,
0.44449, -0.2297888, 2.745405, 1, 1, 1, 1, 1,
0.4498793, -0.3745728, 3.181239, 1, 1, 1, 1, 1,
0.4501282, -1.59147, 4.430179, 1, 1, 1, 1, 1,
0.451088, 0.8538228, 1.684398, 1, 1, 1, 1, 1,
0.4511893, 0.3917974, -1.296562, 1, 1, 1, 1, 1,
0.4535119, 1.466694, -0.0618544, 1, 1, 1, 1, 1,
0.4562266, -0.5298864, 0.9746361, 1, 1, 1, 1, 1,
0.4613581, -0.4717104, 3.325894, 1, 1, 1, 1, 1,
0.4618783, 0.6934085, -0.005823797, 1, 1, 1, 1, 1,
0.4650247, 1.702107, -0.2473965, 1, 1, 1, 1, 1,
0.4695523, 1.467341, 1.90687, 1, 1, 1, 1, 1,
0.4715041, 1.530242, 0.5267302, 1, 1, 1, 1, 1,
0.4738161, 1.940905, 2.459295, 1, 1, 1, 1, 1,
0.4746407, -1.226403, 1.247183, 1, 1, 1, 1, 1,
0.4753265, -1.220291, 2.507751, 0, 0, 1, 1, 1,
0.4758268, 0.4878539, 2.218364, 1, 0, 0, 1, 1,
0.4761338, 2.111435, -0.7286204, 1, 0, 0, 1, 1,
0.4766442, -0.7927787, 1.721277, 1, 0, 0, 1, 1,
0.4781425, 0.7713974, 1.199702, 1, 0, 0, 1, 1,
0.4790219, -0.3721034, 3.539428, 1, 0, 0, 1, 1,
0.4799269, -1.51168, 1.733728, 0, 0, 0, 1, 1,
0.4803754, -0.3008755, 2.184455, 0, 0, 0, 1, 1,
0.48122, 0.07083636, 1.733755, 0, 0, 0, 1, 1,
0.4824061, 0.07765719, 1.9888, 0, 0, 0, 1, 1,
0.4859743, -0.03444152, 0.7842714, 0, 0, 0, 1, 1,
0.4928018, 1.944852, 0.4894866, 0, 0, 0, 1, 1,
0.4935834, -0.5796709, 1.402641, 0, 0, 0, 1, 1,
0.4938295, -0.6996605, 1.411727, 1, 1, 1, 1, 1,
0.4960853, 1.131711, -0.4665174, 1, 1, 1, 1, 1,
0.4990818, 1.105289, -0.6796004, 1, 1, 1, 1, 1,
0.5003424, -0.05174984, 2.189562, 1, 1, 1, 1, 1,
0.5032184, -2.429393, 2.524055, 1, 1, 1, 1, 1,
0.5085258, 1.533585, 0.6696727, 1, 1, 1, 1, 1,
0.5093861, -0.6073248, 2.755647, 1, 1, 1, 1, 1,
0.5115811, -0.841467, 3.794721, 1, 1, 1, 1, 1,
0.511798, -0.5852171, 1.668649, 1, 1, 1, 1, 1,
0.5142053, -0.627422, 1.90423, 1, 1, 1, 1, 1,
0.514351, -1.350721, 3.759343, 1, 1, 1, 1, 1,
0.5152529, -0.6462132, 3.084062, 1, 1, 1, 1, 1,
0.5152989, 0.7962195, 2.093381, 1, 1, 1, 1, 1,
0.5166291, -2.576802, 3.290043, 1, 1, 1, 1, 1,
0.5253653, 0.8933232, 0.007943066, 1, 1, 1, 1, 1,
0.52623, -0.4012494, 1.8883, 0, 0, 1, 1, 1,
0.5293764, -0.6641843, 3.570375, 1, 0, 0, 1, 1,
0.5297316, 0.7865743, -0.1098617, 1, 0, 0, 1, 1,
0.5317595, 2.35661, 0.9353061, 1, 0, 0, 1, 1,
0.5323315, -1.766169, 3.515, 1, 0, 0, 1, 1,
0.5328506, 0.3526911, 1.519445, 1, 0, 0, 1, 1,
0.5449963, -1.646625, 2.963792, 0, 0, 0, 1, 1,
0.5462881, 0.4007218, 0.05899669, 0, 0, 0, 1, 1,
0.5465502, 0.3130235, 0.7381942, 0, 0, 0, 1, 1,
0.5498646, 1.681594, 0.5960928, 0, 0, 0, 1, 1,
0.5522832, 0.2845482, 1.152105, 0, 0, 0, 1, 1,
0.5545934, 0.1600163, 2.182072, 0, 0, 0, 1, 1,
0.5571701, -0.03576445, 2.895893, 0, 0, 0, 1, 1,
0.5584137, 0.8416037, 1.442499, 1, 1, 1, 1, 1,
0.5673428, 0.9418632, 0.3964216, 1, 1, 1, 1, 1,
0.5686352, 1.058386, 0.5551941, 1, 1, 1, 1, 1,
0.5692, 1.896729, -0.3315537, 1, 1, 1, 1, 1,
0.5706016, 0.2286562, 0.7024197, 1, 1, 1, 1, 1,
0.5713052, -0.2862344, 0.5802668, 1, 1, 1, 1, 1,
0.5812083, 0.3879817, 2.493624, 1, 1, 1, 1, 1,
0.5837961, 0.485982, 1.264036, 1, 1, 1, 1, 1,
0.594941, 1.21196, 0.7591331, 1, 1, 1, 1, 1,
0.5975187, 0.3523572, 1.450946, 1, 1, 1, 1, 1,
0.5997387, -1.300218, 2.077943, 1, 1, 1, 1, 1,
0.6005232, -0.08967226, 2.654173, 1, 1, 1, 1, 1,
0.6034272, 1.007557, 1.851734, 1, 1, 1, 1, 1,
0.6044657, -0.3958452, 4.045733, 1, 1, 1, 1, 1,
0.6060548, 1.100854, 0.2207472, 1, 1, 1, 1, 1,
0.6099852, -0.7588316, 3.171096, 0, 0, 1, 1, 1,
0.6203339, 0.7579396, 2.938917, 1, 0, 0, 1, 1,
0.6258671, -0.1146485, 1.674598, 1, 0, 0, 1, 1,
0.6267289, -1.152699, 1.183426, 1, 0, 0, 1, 1,
0.6411022, -0.8903502, 4.642633, 1, 0, 0, 1, 1,
0.6445463, -0.8115054, 2.736487, 1, 0, 0, 1, 1,
0.6495876, 1.214977, 0.3448564, 0, 0, 0, 1, 1,
0.6635005, 0.03837615, 1.865052, 0, 0, 0, 1, 1,
0.6642392, 0.08162969, 1.119039, 0, 0, 0, 1, 1,
0.6665695, 0.6614386, 0.1751108, 0, 0, 0, 1, 1,
0.6731546, -0.1244361, 2.260527, 0, 0, 0, 1, 1,
0.673178, 0.5136055, 1.564506, 0, 0, 0, 1, 1,
0.6743475, -0.9744318, 3.294979, 0, 0, 0, 1, 1,
0.676755, 0.8939039, -0.001542993, 1, 1, 1, 1, 1,
0.6889109, -0.007406594, 1.669727, 1, 1, 1, 1, 1,
0.6902115, -0.1384381, 3.146545, 1, 1, 1, 1, 1,
0.6925093, -0.2676592, 2.930488, 1, 1, 1, 1, 1,
0.6945151, -0.3997746, 2.727214, 1, 1, 1, 1, 1,
0.6989745, 1.194915, 2.505808, 1, 1, 1, 1, 1,
0.7045158, 2.468298, 1.205551, 1, 1, 1, 1, 1,
0.7045895, 2.249342, 0.5634648, 1, 1, 1, 1, 1,
0.7068938, -0.3665795, 1.775921, 1, 1, 1, 1, 1,
0.7070987, -1.582621, 1.619646, 1, 1, 1, 1, 1,
0.7093231, 0.6748363, 0.2769172, 1, 1, 1, 1, 1,
0.7107792, 0.7146761, 0.5325949, 1, 1, 1, 1, 1,
0.7128397, 0.8287607, 0.6854941, 1, 1, 1, 1, 1,
0.7159462, -1.060624, 2.998675, 1, 1, 1, 1, 1,
0.7165385, 2.2022, 1.259553, 1, 1, 1, 1, 1,
0.7172458, 1.787401, 1.179382, 0, 0, 1, 1, 1,
0.7172669, 0.7665522, 0.1868886, 1, 0, 0, 1, 1,
0.724988, 0.7085331, -0.3050951, 1, 0, 0, 1, 1,
0.725599, -0.2950923, 1.086645, 1, 0, 0, 1, 1,
0.7271069, -0.2383528, 3.019408, 1, 0, 0, 1, 1,
0.7277669, -0.4513455, 1.38221, 1, 0, 0, 1, 1,
0.739453, 2.048198, 0.2725547, 0, 0, 0, 1, 1,
0.7415876, 1.560271, 0.2523424, 0, 0, 0, 1, 1,
0.7567293, 0.384708, -0.9066787, 0, 0, 0, 1, 1,
0.7575049, -1.49747, 2.194237, 0, 0, 0, 1, 1,
0.7583973, -1.227475, 3.009767, 0, 0, 0, 1, 1,
0.7592524, -0.3900616, 2.201965, 0, 0, 0, 1, 1,
0.7606425, -1.119983, 0.3776503, 0, 0, 0, 1, 1,
0.7609866, 1.315148, 0.5005481, 1, 1, 1, 1, 1,
0.7615991, 2.5256, -0.7370825, 1, 1, 1, 1, 1,
0.764566, 0.8992503, 0.0346608, 1, 1, 1, 1, 1,
0.7671132, -0.3682741, 3.204017, 1, 1, 1, 1, 1,
0.7688266, 0.3167216, 2.087305, 1, 1, 1, 1, 1,
0.7703411, 0.4699736, 1.464866, 1, 1, 1, 1, 1,
0.7711446, 0.2804709, -0.1894247, 1, 1, 1, 1, 1,
0.7784761, -0.1063406, 1.946755, 1, 1, 1, 1, 1,
0.7823157, 2.041536, -0.9567832, 1, 1, 1, 1, 1,
0.7846349, 1.402978, -0.5302526, 1, 1, 1, 1, 1,
0.7854346, 0.4113078, 0.8276998, 1, 1, 1, 1, 1,
0.786872, 1.071252, 0.9561502, 1, 1, 1, 1, 1,
0.7885085, 0.8083701, -1.066059, 1, 1, 1, 1, 1,
0.7894744, -1.15269, 5.022595, 1, 1, 1, 1, 1,
0.7954893, -1.531055, 4.562236, 1, 1, 1, 1, 1,
0.7964876, -0.3429837, 0.8727539, 0, 0, 1, 1, 1,
0.8091231, 0.1294242, 1.206064, 1, 0, 0, 1, 1,
0.8111586, 0.05631958, 2.192252, 1, 0, 0, 1, 1,
0.8113985, 0.3288281, 0.2578403, 1, 0, 0, 1, 1,
0.8143877, 0.2364982, 0.8874553, 1, 0, 0, 1, 1,
0.814489, -0.4805404, 1.247371, 1, 0, 0, 1, 1,
0.8207101, -0.8951403, 2.486628, 0, 0, 0, 1, 1,
0.8218214, -0.6733445, 2.773827, 0, 0, 0, 1, 1,
0.8251712, 0.5295774, 0.1858889, 0, 0, 0, 1, 1,
0.8265643, 1.896869, 0.9787904, 0, 0, 0, 1, 1,
0.8295426, -2.004321, 2.734302, 0, 0, 0, 1, 1,
0.8295906, 0.511726, -1.220742, 0, 0, 0, 1, 1,
0.8311861, -1.35757, 3.873274, 0, 0, 0, 1, 1,
0.8316207, 1.125357, -0.2921059, 1, 1, 1, 1, 1,
0.8321196, -1.091069, 1.609492, 1, 1, 1, 1, 1,
0.8321372, 1.416568, 1.114693, 1, 1, 1, 1, 1,
0.8321968, 2.010948, -1.844526, 1, 1, 1, 1, 1,
0.8331085, -0.6877657, 3.715476, 1, 1, 1, 1, 1,
0.8365902, 0.6997864, -1.079527, 1, 1, 1, 1, 1,
0.8377818, 1.49072, -0.1318243, 1, 1, 1, 1, 1,
0.8402942, 0.1650693, -0.23128, 1, 1, 1, 1, 1,
0.8410771, -0.6923348, 1.959572, 1, 1, 1, 1, 1,
0.8412853, -0.9570648, 1.895503, 1, 1, 1, 1, 1,
0.8421378, -0.7567246, 3.708793, 1, 1, 1, 1, 1,
0.8476521, -0.6483816, 1.824306, 1, 1, 1, 1, 1,
0.8566518, 1.125735, 0.5834919, 1, 1, 1, 1, 1,
0.8577671, 2.074476, 0.05844124, 1, 1, 1, 1, 1,
0.8703721, -1.273364, 2.417503, 1, 1, 1, 1, 1,
0.8787076, 0.8730142, -0.4721586, 0, 0, 1, 1, 1,
0.8803367, -0.6204324, 1.384479, 1, 0, 0, 1, 1,
0.8804269, 3.591979, -1.699955, 1, 0, 0, 1, 1,
0.8824695, -0.9902765, 2.898319, 1, 0, 0, 1, 1,
0.885672, -2.823832, 2.394769, 1, 0, 0, 1, 1,
0.8961905, -0.7376091, 1.99817, 1, 0, 0, 1, 1,
0.9013374, -1.531194, 1.222643, 0, 0, 0, 1, 1,
0.9024675, -0.8841876, 1.684146, 0, 0, 0, 1, 1,
0.9055162, -0.1736576, 1.195092, 0, 0, 0, 1, 1,
0.905964, -2.186033, 1.94548, 0, 0, 0, 1, 1,
0.9078612, -0.7595117, 3.040742, 0, 0, 0, 1, 1,
0.9177904, -1.211657, 2.17518, 0, 0, 0, 1, 1,
0.9198818, -0.7788699, 2.384469, 0, 0, 0, 1, 1,
0.9236841, -0.03933503, 1.122226, 1, 1, 1, 1, 1,
0.9292752, 1.487584, 0.2432713, 1, 1, 1, 1, 1,
0.9338011, 0.05492532, 1.901122, 1, 1, 1, 1, 1,
0.9346842, -0.7776437, 2.256196, 1, 1, 1, 1, 1,
0.9391954, -1.194046, 0.003405184, 1, 1, 1, 1, 1,
0.9524408, 0.4582701, 2.844028, 1, 1, 1, 1, 1,
0.9565569, -0.1649256, 1.24098, 1, 1, 1, 1, 1,
0.9646944, 1.436288, -0.5566922, 1, 1, 1, 1, 1,
0.9675858, 1.608394, 3.714217, 1, 1, 1, 1, 1,
0.9704272, -1.030769, 3.213855, 1, 1, 1, 1, 1,
0.9712499, -0.394222, 0.6128287, 1, 1, 1, 1, 1,
0.9786033, -0.6025172, 4.330027, 1, 1, 1, 1, 1,
0.9840771, 1.652293, 1.21134, 1, 1, 1, 1, 1,
0.9842911, 0.2674941, 2.383478, 1, 1, 1, 1, 1,
0.9853415, -2.323915, 2.586219, 1, 1, 1, 1, 1,
0.9933546, -1.668249, 1.958294, 0, 0, 1, 1, 1,
0.9933839, -1.110173, 2.083933, 1, 0, 0, 1, 1,
0.9941744, -0.4525203, 1.254566, 1, 0, 0, 1, 1,
0.9947079, 0.9236853, 1.941817, 1, 0, 0, 1, 1,
0.9998434, -1.686051, 1.88724, 1, 0, 0, 1, 1,
1.004018, 0.1776042, 1.648316, 1, 0, 0, 1, 1,
1.006902, -0.514547, 1.374908, 0, 0, 0, 1, 1,
1.012465, 1.453281, -0.03568385, 0, 0, 0, 1, 1,
1.030253, -0.4778393, 1.334148, 0, 0, 0, 1, 1,
1.032377, -1.2199, 2.750179, 0, 0, 0, 1, 1,
1.034413, -0.3576972, 2.183588, 0, 0, 0, 1, 1,
1.036041, -0.0004164928, 2.430944, 0, 0, 0, 1, 1,
1.036078, 0.8752297, 0.8949799, 0, 0, 0, 1, 1,
1.03708, 0.2223053, 1.733805, 1, 1, 1, 1, 1,
1.041633, -0.742614, 2.022032, 1, 1, 1, 1, 1,
1.042335, 0.6221499, 0.318464, 1, 1, 1, 1, 1,
1.046465, 0.4396535, 1.105042, 1, 1, 1, 1, 1,
1.058269, -0.7920401, 2.304617, 1, 1, 1, 1, 1,
1.06388, 0.5245973, 1.262486, 1, 1, 1, 1, 1,
1.071958, 0.5224798, 0.8804492, 1, 1, 1, 1, 1,
1.086703, -0.8453909, 1.477183, 1, 1, 1, 1, 1,
1.087444, -0.4651925, 2.381502, 1, 1, 1, 1, 1,
1.089129, 1.748851, 0.2884734, 1, 1, 1, 1, 1,
1.096639, 1.175979, 2.462219, 1, 1, 1, 1, 1,
1.110127, 0.4102428, 2.164966, 1, 1, 1, 1, 1,
1.122238, 0.4449168, 0.3314252, 1, 1, 1, 1, 1,
1.123468, 0.8026178, 2.226456, 1, 1, 1, 1, 1,
1.124062, 1.758456, 0.8625837, 1, 1, 1, 1, 1,
1.125616, -0.4745814, 2.246943, 0, 0, 1, 1, 1,
1.12923, -0.7618818, 2.105605, 1, 0, 0, 1, 1,
1.13497, 0.006730841, 1.526055, 1, 0, 0, 1, 1,
1.146571, -0.5886686, 0.4452449, 1, 0, 0, 1, 1,
1.162098, -1.821496, 1.250407, 1, 0, 0, 1, 1,
1.181229, 0.430072, 1.392069, 1, 0, 0, 1, 1,
1.186846, -1.511639, 2.253459, 0, 0, 0, 1, 1,
1.203863, 1.644588, 0.5535481, 0, 0, 0, 1, 1,
1.207578, 0.3677353, -0.002502864, 0, 0, 0, 1, 1,
1.21646, -0.7190074, 2.558266, 0, 0, 0, 1, 1,
1.220415, -1.216921, 3.87103, 0, 0, 0, 1, 1,
1.221959, 0.4930572, 0.8156369, 0, 0, 0, 1, 1,
1.223869, -0.004825172, 2.889835, 0, 0, 0, 1, 1,
1.225506, 0.6147074, 1.335622, 1, 1, 1, 1, 1,
1.225509, -1.234568, 1.517649, 1, 1, 1, 1, 1,
1.229644, 0.06894408, 1.166212, 1, 1, 1, 1, 1,
1.239564, 0.01907525, 2.447247, 1, 1, 1, 1, 1,
1.260896, -0.414697, 1.935041, 1, 1, 1, 1, 1,
1.261053, -2.36732, 1.825318, 1, 1, 1, 1, 1,
1.263385, 0.8568175, 0.104079, 1, 1, 1, 1, 1,
1.267232, -0.9121115, 2.227735, 1, 1, 1, 1, 1,
1.270989, 1.428064, -0.6502129, 1, 1, 1, 1, 1,
1.273338, 0.6083966, 2.228539, 1, 1, 1, 1, 1,
1.274554, -1.261819, 2.409216, 1, 1, 1, 1, 1,
1.274821, 0.6867481, 1.068048, 1, 1, 1, 1, 1,
1.278408, -2.974213, 2.904234, 1, 1, 1, 1, 1,
1.285452, 0.4623361, 1.49103, 1, 1, 1, 1, 1,
1.29098, -0.4388167, 3.665299, 1, 1, 1, 1, 1,
1.300971, -2.183392, 1.02769, 0, 0, 1, 1, 1,
1.303237, -0.1240525, 4.18117, 1, 0, 0, 1, 1,
1.308097, -1.166513, 2.312776, 1, 0, 0, 1, 1,
1.316013, -0.4706973, 2.228703, 1, 0, 0, 1, 1,
1.317711, 0.5632432, 0.9540219, 1, 0, 0, 1, 1,
1.323386, 0.4889317, 0.5856045, 1, 0, 0, 1, 1,
1.326319, -1.509416, 2.23175, 0, 0, 0, 1, 1,
1.328841, 0.0009444895, 1.433933, 0, 0, 0, 1, 1,
1.337625, -0.2375183, 2.847493, 0, 0, 0, 1, 1,
1.339482, -0.4120541, 0.9310319, 0, 0, 0, 1, 1,
1.344928, -0.2704926, 1.498991, 0, 0, 0, 1, 1,
1.353383, 1.848442, 1.612583, 0, 0, 0, 1, 1,
1.354772, 0.648751, -1.028638, 0, 0, 0, 1, 1,
1.362498, 0.656638, 1.885427, 1, 1, 1, 1, 1,
1.366323, 0.412704, 1.378731, 1, 1, 1, 1, 1,
1.36666, -1.636333, 2.795745, 1, 1, 1, 1, 1,
1.366861, 0.7469621, -0.04230133, 1, 1, 1, 1, 1,
1.371014, 1.38762, 1.220909, 1, 1, 1, 1, 1,
1.373574, 0.420215, 1.381663, 1, 1, 1, 1, 1,
1.374919, -1.632473, 2.860143, 1, 1, 1, 1, 1,
1.389059, -1.016378, 2.58116, 1, 1, 1, 1, 1,
1.394101, -1.849821, 3.862762, 1, 1, 1, 1, 1,
1.401939, -0.9743267, 3.854209, 1, 1, 1, 1, 1,
1.405434, 0.9643777, 0.4316748, 1, 1, 1, 1, 1,
1.412032, 0.7729796, 2.171779, 1, 1, 1, 1, 1,
1.426124, -0.8978313, 4.092752, 1, 1, 1, 1, 1,
1.431895, -0.2079225, 3.303238, 1, 1, 1, 1, 1,
1.449538, 1.479337, 1.682028, 1, 1, 1, 1, 1,
1.452939, 0.9682205, 1.646915, 0, 0, 1, 1, 1,
1.475129, 0.9854801, 1.860672, 1, 0, 0, 1, 1,
1.483191, 1.436028, 0.4757051, 1, 0, 0, 1, 1,
1.484541, -0.5958202, 2.014507, 1, 0, 0, 1, 1,
1.485778, -0.8726043, 1.461018, 1, 0, 0, 1, 1,
1.490057, -1.278911, 3.725968, 1, 0, 0, 1, 1,
1.49244, 1.286126, 1.869373, 0, 0, 0, 1, 1,
1.504369, -0.519509, 1.566732, 0, 0, 0, 1, 1,
1.518002, 0.7289211, 1.505738, 0, 0, 0, 1, 1,
1.521496, 0.2347931, 1.672253, 0, 0, 0, 1, 1,
1.530104, -1.212367, 2.83691, 0, 0, 0, 1, 1,
1.539321, 0.8188032, -0.8566895, 0, 0, 0, 1, 1,
1.54336, -1.424717, 2.13076, 0, 0, 0, 1, 1,
1.544003, -0.9215657, 3.45777, 1, 1, 1, 1, 1,
1.596978, 0.6031305, 0.6162996, 1, 1, 1, 1, 1,
1.601547, 0.8765444, 2.270389, 1, 1, 1, 1, 1,
1.615358, -1.696899, 3.404548, 1, 1, 1, 1, 1,
1.617082, 1.188776, 0.9681734, 1, 1, 1, 1, 1,
1.634854, -0.9650851, 2.473021, 1, 1, 1, 1, 1,
1.638294, 1.471954, 0.2319921, 1, 1, 1, 1, 1,
1.639598, 1.865362, 2.678711, 1, 1, 1, 1, 1,
1.644106, -0.4318543, 1.68604, 1, 1, 1, 1, 1,
1.64542, 2.265309, 1.251775, 1, 1, 1, 1, 1,
1.649376, -0.4289255, 1.870531, 1, 1, 1, 1, 1,
1.65398, -0.2843645, 1.537906, 1, 1, 1, 1, 1,
1.662375, 0.8662, 0.1363047, 1, 1, 1, 1, 1,
1.678293, 0.09714624, 1.030527, 1, 1, 1, 1, 1,
1.7135, 1.396168, 2.881573, 1, 1, 1, 1, 1,
1.723455, 1.609871, -0.2167277, 0, 0, 1, 1, 1,
1.737181, -0.3963726, 1.699072, 1, 0, 0, 1, 1,
1.750757, -1.721054, 3.687722, 1, 0, 0, 1, 1,
1.750793, -1.291069, 1.58328, 1, 0, 0, 1, 1,
1.764517, -0.8695964, 1.895774, 1, 0, 0, 1, 1,
1.771176, 0.3054984, 1.773227, 1, 0, 0, 1, 1,
1.774672, -1.223668, 1.668809, 0, 0, 0, 1, 1,
1.794435, -0.9493159, 0.9624726, 0, 0, 0, 1, 1,
1.79827, 0.8362775, 0.4873664, 0, 0, 0, 1, 1,
1.813135, 0.7639162, 0.2834008, 0, 0, 0, 1, 1,
1.83073, 0.4910602, 2.869779, 0, 0, 0, 1, 1,
1.831849, 0.7157816, 1.521867, 0, 0, 0, 1, 1,
1.863707, 0.8894345, 1.753311, 0, 0, 0, 1, 1,
1.875282, 0.9777628, 1.168183, 1, 1, 1, 1, 1,
1.889579, 0.7125279, 1.8998, 1, 1, 1, 1, 1,
1.89447, -0.3711641, 1.723441, 1, 1, 1, 1, 1,
1.895461, 0.3101608, 1.754806, 1, 1, 1, 1, 1,
1.919144, -1.410848, 2.472732, 1, 1, 1, 1, 1,
1.919492, 0.6450369, -0.2076537, 1, 1, 1, 1, 1,
1.943303, -1.35658, 1.969984, 1, 1, 1, 1, 1,
1.958852, 2.186008, 1.512814, 1, 1, 1, 1, 1,
1.965462, -0.7796018, 2.175979, 1, 1, 1, 1, 1,
1.989275, 0.1231774, -0.304157, 1, 1, 1, 1, 1,
2.000709, -1.110737, 2.339568, 1, 1, 1, 1, 1,
2.012184, 1.47821, -0.5159241, 1, 1, 1, 1, 1,
2.069391, -0.05535612, 2.299672, 1, 1, 1, 1, 1,
2.075217, 2.013135, -1.597594, 1, 1, 1, 1, 1,
2.076548, -0.2710102, 2.481885, 1, 1, 1, 1, 1,
2.080108, -0.1434444, 2.387452, 0, 0, 1, 1, 1,
2.197192, 0.8765761, 1.349704, 1, 0, 0, 1, 1,
2.203512, -0.7457862, 1.750484, 1, 0, 0, 1, 1,
2.20391, -0.9456698, 1.891182, 1, 0, 0, 1, 1,
2.245454, 1.099227, 1.311699, 1, 0, 0, 1, 1,
2.291095, -1.40252, 1.634125, 1, 0, 0, 1, 1,
2.30767, -1.030579, 3.796861, 0, 0, 0, 1, 1,
2.331379, -0.6825618, 2.497463, 0, 0, 0, 1, 1,
2.352084, 2.048216, -0.5872172, 0, 0, 0, 1, 1,
2.395873, 0.647866, 1.903072, 0, 0, 0, 1, 1,
2.414516, 0.1041033, 2.317237, 0, 0, 0, 1, 1,
2.445093, -0.04625475, 1.625728, 0, 0, 0, 1, 1,
2.48136, 1.532877, 0.228694, 0, 0, 0, 1, 1,
2.581328, 1.093481, 0.2570471, 1, 1, 1, 1, 1,
2.803966, -0.06976687, 1.064168, 1, 1, 1, 1, 1,
2.908984, 0.7977416, 3.207489, 1, 1, 1, 1, 1,
2.964307, -1.129533, 1.342072, 1, 1, 1, 1, 1,
3.032002, 1.482221, 2.483839, 1, 1, 1, 1, 1,
3.289663, -0.6204054, 1.515196, 1, 1, 1, 1, 1,
3.327482, -1.004963, 4.299779, 1, 1, 1, 1, 1
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
var radius = 9.742087;
var distance = 34.21867;
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
mvMatrix.translate( 0.0414772, -0.2313197, -0.07325268 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21867);
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