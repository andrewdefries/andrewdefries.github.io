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
-3.411942, 0.1992161, -0.4608788, 1, 0, 0, 1,
-2.909009, 1.136377, -1.45458, 1, 0.007843138, 0, 1,
-2.671955, -0.6497813, -0.9221697, 1, 0.01176471, 0, 1,
-2.646307, 1.550688, -0.3149767, 1, 0.01960784, 0, 1,
-2.616621, -0.6963674, -0.9538284, 1, 0.02352941, 0, 1,
-2.545358, 0.3256699, -1.0809, 1, 0.03137255, 0, 1,
-2.527127, 1.071425, -0.08005577, 1, 0.03529412, 0, 1,
-2.5098, -0.06051438, -1.604704, 1, 0.04313726, 0, 1,
-2.476602, -1.149559, -1.294311, 1, 0.04705882, 0, 1,
-2.471545, -0.6191126, -3.271981, 1, 0.05490196, 0, 1,
-2.428374, -0.2843134, -1.522473, 1, 0.05882353, 0, 1,
-2.333628, -0.6694949, -1.641122, 1, 0.06666667, 0, 1,
-2.333553, 1.389441, -0.398179, 1, 0.07058824, 0, 1,
-2.26368, -0.5103239, 0.07024056, 1, 0.07843138, 0, 1,
-2.198725, 0.1119704, -1.500938, 1, 0.08235294, 0, 1,
-2.170257, -0.1055007, -2.262009, 1, 0.09019608, 0, 1,
-2.154047, 0.2902229, -1.613595, 1, 0.09411765, 0, 1,
-2.112732, 0.01817778, -1.41762, 1, 0.1019608, 0, 1,
-2.106026, 0.7913675, -1.8473, 1, 0.1098039, 0, 1,
-2.089015, -0.80507, -2.660755, 1, 0.1137255, 0, 1,
-2.059526, 0.1117981, -2.35296, 1, 0.1215686, 0, 1,
-2.058882, -0.8696827, -1.470595, 1, 0.1254902, 0, 1,
-2.03963, 0.05804791, -2.028482, 1, 0.1333333, 0, 1,
-2.022125, 0.1908812, -0.4374034, 1, 0.1372549, 0, 1,
-2.01065, -0.9106273, -0.6346937, 1, 0.145098, 0, 1,
-2.003206, -0.251099, -1.287589, 1, 0.1490196, 0, 1,
-1.976977, 0.3017184, -0.8181589, 1, 0.1568628, 0, 1,
-1.969098, -0.712921, -3.404555, 1, 0.1607843, 0, 1,
-1.923418, 0.9721081, -0.931913, 1, 0.1686275, 0, 1,
-1.918661, 0.7056521, -1.066291, 1, 0.172549, 0, 1,
-1.89093, 0.0244807, -0.8913735, 1, 0.1803922, 0, 1,
-1.865915, -0.5114738, -3.647993, 1, 0.1843137, 0, 1,
-1.861741, 0.5955287, -3.034372, 1, 0.1921569, 0, 1,
-1.854511, -0.7562795, -2.281329, 1, 0.1960784, 0, 1,
-1.835974, 0.0281934, -0.9708387, 1, 0.2039216, 0, 1,
-1.833268, -1.817876, -3.301744, 1, 0.2117647, 0, 1,
-1.831423, -0.7479328, -1.40674, 1, 0.2156863, 0, 1,
-1.821918, -0.9348739, -3.703713, 1, 0.2235294, 0, 1,
-1.820994, 2.118153, 0.1042919, 1, 0.227451, 0, 1,
-1.783793, -2.465321, -2.277759, 1, 0.2352941, 0, 1,
-1.783372, 1.043715, -1.633454, 1, 0.2392157, 0, 1,
-1.776221, -0.8316307, -2.296462, 1, 0.2470588, 0, 1,
-1.751822, -0.8183283, -2.504055, 1, 0.2509804, 0, 1,
-1.705079, 0.2558391, -0.4988383, 1, 0.2588235, 0, 1,
-1.698434, -0.3595119, -2.386954, 1, 0.2627451, 0, 1,
-1.688018, -1.57386, -4.314239, 1, 0.2705882, 0, 1,
-1.662889, 0.07496614, -3.151829, 1, 0.2745098, 0, 1,
-1.661068, 1.759889, -0.4352447, 1, 0.282353, 0, 1,
-1.651012, 0.3282997, 0.3143318, 1, 0.2862745, 0, 1,
-1.642526, -0.8023885, -1.414237, 1, 0.2941177, 0, 1,
-1.642032, 1.533052, 0.684705, 1, 0.3019608, 0, 1,
-1.637719, 1.39041, -0.9556127, 1, 0.3058824, 0, 1,
-1.613629, 1.06471, -0.7288854, 1, 0.3137255, 0, 1,
-1.604644, -0.4239033, -0.9003295, 1, 0.3176471, 0, 1,
-1.588978, 1.021903, 1.280215, 1, 0.3254902, 0, 1,
-1.575536, -1.078697, -2.687052, 1, 0.3294118, 0, 1,
-1.570259, 0.4335089, -3.273852, 1, 0.3372549, 0, 1,
-1.550213, -0.1174154, -1.406641, 1, 0.3411765, 0, 1,
-1.54901, -1.194945, -1.070736, 1, 0.3490196, 0, 1,
-1.538074, 0.607556, -2.523235, 1, 0.3529412, 0, 1,
-1.527584, 1.715423, -0.810779, 1, 0.3607843, 0, 1,
-1.522548, 0.4083121, -0.1612376, 1, 0.3647059, 0, 1,
-1.520969, -1.169499, -0.5971803, 1, 0.372549, 0, 1,
-1.518599, -0.9106084, -3.135337, 1, 0.3764706, 0, 1,
-1.518276, -0.96467, -1.729129, 1, 0.3843137, 0, 1,
-1.514138, -0.7877443, -3.018702, 1, 0.3882353, 0, 1,
-1.508477, 1.018824, -0.5590808, 1, 0.3960784, 0, 1,
-1.495818, -1.430708, -0.3748049, 1, 0.4039216, 0, 1,
-1.494581, 1.134176, -2.77985, 1, 0.4078431, 0, 1,
-1.491901, 1.21797, -1.414592, 1, 0.4156863, 0, 1,
-1.491338, 0.9423996, -0.9232115, 1, 0.4196078, 0, 1,
-1.491299, 0.4180825, -1.647838, 1, 0.427451, 0, 1,
-1.485621, 0.8242187, -1.046101, 1, 0.4313726, 0, 1,
-1.482849, 0.3749284, -1.341341, 1, 0.4392157, 0, 1,
-1.470116, 0.2476449, -1.157327, 1, 0.4431373, 0, 1,
-1.463155, 0.67258, -1.773789, 1, 0.4509804, 0, 1,
-1.460519, 0.9824174, -1.099854, 1, 0.454902, 0, 1,
-1.458173, -0.1051509, -1.784924, 1, 0.4627451, 0, 1,
-1.448801, -1.38289, -1.729516, 1, 0.4666667, 0, 1,
-1.448696, 0.5473613, 0.382583, 1, 0.4745098, 0, 1,
-1.446017, 0.9462325, 0.1401718, 1, 0.4784314, 0, 1,
-1.445415, 0.8087032, -0.8509926, 1, 0.4862745, 0, 1,
-1.432659, 0.8071028, -1.173613, 1, 0.4901961, 0, 1,
-1.420156, -0.5994059, -2.646526, 1, 0.4980392, 0, 1,
-1.402764, 2.25078, -0.8968227, 1, 0.5058824, 0, 1,
-1.392234, -0.3052791, -3.00084, 1, 0.509804, 0, 1,
-1.38509, -1.926421, -1.571731, 1, 0.5176471, 0, 1,
-1.373049, -0.7207912, -1.283137, 1, 0.5215687, 0, 1,
-1.367035, 0.006472758, -1.313107, 1, 0.5294118, 0, 1,
-1.365016, -0.2325509, -0.1241049, 1, 0.5333334, 0, 1,
-1.336833, 1.123263, 0.3102761, 1, 0.5411765, 0, 1,
-1.335579, 0.2041571, -2.18787, 1, 0.5450981, 0, 1,
-1.317929, 0.5103559, -2.63958, 1, 0.5529412, 0, 1,
-1.307767, 0.02842959, -0.802283, 1, 0.5568628, 0, 1,
-1.303534, -0.867866, -2.442621, 1, 0.5647059, 0, 1,
-1.299576, -0.03085448, -1.44609, 1, 0.5686275, 0, 1,
-1.294211, 0.900798, -1.702971, 1, 0.5764706, 0, 1,
-1.29289, 0.05325793, -0.9289258, 1, 0.5803922, 0, 1,
-1.286867, -0.1805484, -1.505971, 1, 0.5882353, 0, 1,
-1.283633, 0.3201594, -0.6632096, 1, 0.5921569, 0, 1,
-1.272737, 0.8234937, 0.1036333, 1, 0.6, 0, 1,
-1.271723, 0.7400107, 0.1414998, 1, 0.6078432, 0, 1,
-1.26941, -0.2576914, -2.397976, 1, 0.6117647, 0, 1,
-1.262183, 1.37075, -2.811823, 1, 0.6196079, 0, 1,
-1.256057, -0.1591914, -0.713995, 1, 0.6235294, 0, 1,
-1.253288, -0.6938272, -2.187728, 1, 0.6313726, 0, 1,
-1.244791, -1.85101, -2.702479, 1, 0.6352941, 0, 1,
-1.240926, -1.998787, -1.526572, 1, 0.6431373, 0, 1,
-1.240542, 0.8333418, -0.9563238, 1, 0.6470588, 0, 1,
-1.23205, -0.3016685, -1.38555, 1, 0.654902, 0, 1,
-1.226855, 0.8585362, -0.4592418, 1, 0.6588235, 0, 1,
-1.221871, 0.9665813, 0.8294846, 1, 0.6666667, 0, 1,
-1.221368, 0.8147793, 0.7332611, 1, 0.6705883, 0, 1,
-1.196406, 0.938657, -0.8171102, 1, 0.6784314, 0, 1,
-1.193636, 0.5736262, -0.7784886, 1, 0.682353, 0, 1,
-1.190261, 0.3925902, 1.182391, 1, 0.6901961, 0, 1,
-1.189584, -0.8802176, -4.553855, 1, 0.6941177, 0, 1,
-1.18388, -1.156104, -3.093869, 1, 0.7019608, 0, 1,
-1.177284, -1.075282, -0.4610685, 1, 0.7098039, 0, 1,
-1.175105, 1.316394, -0.7687339, 1, 0.7137255, 0, 1,
-1.17414, -0.02989849, -1.480421, 1, 0.7215686, 0, 1,
-1.171369, -1.838421, -2.390354, 1, 0.7254902, 0, 1,
-1.168749, 1.25078, -0.5879864, 1, 0.7333333, 0, 1,
-1.168021, 0.3971297, -0.3989839, 1, 0.7372549, 0, 1,
-1.167604, -0.3964092, -1.991408, 1, 0.7450981, 0, 1,
-1.165183, 1.708262, 1.144758, 1, 0.7490196, 0, 1,
-1.163402, 0.9357098, -2.650645, 1, 0.7568628, 0, 1,
-1.153578, 0.2880726, 0.3896927, 1, 0.7607843, 0, 1,
-1.153146, -1.196395, -0.5205933, 1, 0.7686275, 0, 1,
-1.150328, -1.595993, -2.805734, 1, 0.772549, 0, 1,
-1.144855, -0.3417878, -2.256089, 1, 0.7803922, 0, 1,
-1.142759, -1.180782, -2.095196, 1, 0.7843137, 0, 1,
-1.137182, -0.9279416, -3.413042, 1, 0.7921569, 0, 1,
-1.136485, 0.4136773, -1.29322, 1, 0.7960784, 0, 1,
-1.123869, 0.7737738, 0.6743451, 1, 0.8039216, 0, 1,
-1.117802, -1.660628, -1.324127, 1, 0.8117647, 0, 1,
-1.113913, -0.7347465, -0.7649475, 1, 0.8156863, 0, 1,
-1.10879, -0.7730601, -1.311608, 1, 0.8235294, 0, 1,
-1.105587, 0.5838355, -1.515346, 1, 0.827451, 0, 1,
-1.104792, 0.104384, -2.194358, 1, 0.8352941, 0, 1,
-1.102791, -1.460613, -3.374762, 1, 0.8392157, 0, 1,
-1.092018, -0.3007756, -0.7641932, 1, 0.8470588, 0, 1,
-1.091147, -0.5002028, 0.8708802, 1, 0.8509804, 0, 1,
-1.090655, 0.5585934, -0.7524579, 1, 0.8588235, 0, 1,
-1.086436, -1.094571, -3.036768, 1, 0.8627451, 0, 1,
-1.085461, -0.7046338, -3.059293, 1, 0.8705882, 0, 1,
-1.083438, 0.04278221, -0.8874961, 1, 0.8745098, 0, 1,
-1.073796, -0.2515387, -2.006094, 1, 0.8823529, 0, 1,
-1.061856, -0.8017216, -0.5415107, 1, 0.8862745, 0, 1,
-1.059739, -1.231841, -3.49836, 1, 0.8941177, 0, 1,
-1.055358, 0.7290817, -0.05029324, 1, 0.8980392, 0, 1,
-1.055051, -1.215313, -1.117992, 1, 0.9058824, 0, 1,
-1.052506, -2.214978, -2.064469, 1, 0.9137255, 0, 1,
-1.046139, 0.577685, -1.561159, 1, 0.9176471, 0, 1,
-1.043816, 0.7052147, -1.507375, 1, 0.9254902, 0, 1,
-1.039973, 0.6615388, -2.513811, 1, 0.9294118, 0, 1,
-1.026718, 0.9418165, -0.4573494, 1, 0.9372549, 0, 1,
-1.020183, -0.4831827, -1.528014, 1, 0.9411765, 0, 1,
-1.015328, -1.566714, -3.719135, 1, 0.9490196, 0, 1,
-1.012989, -2.537488, -2.792829, 1, 0.9529412, 0, 1,
-1.00795, 1.105783, -0.5238366, 1, 0.9607843, 0, 1,
-1.00767, -0.1169037, -1.728241, 1, 0.9647059, 0, 1,
-1.00251, -1.051299, -1.548103, 1, 0.972549, 0, 1,
-1.001998, 0.1587126, -2.955719, 1, 0.9764706, 0, 1,
-1.000967, -0.405414, -2.647445, 1, 0.9843137, 0, 1,
-0.998094, -2.236711, -1.286104, 1, 0.9882353, 0, 1,
-0.9969974, 0.0672278, -0.5826199, 1, 0.9960784, 0, 1,
-0.9963835, 0.06391147, -2.539832, 0.9960784, 1, 0, 1,
-0.9897175, 0.3721253, -0.1288247, 0.9921569, 1, 0, 1,
-0.9810405, -0.3531646, -1.798371, 0.9843137, 1, 0, 1,
-0.9627702, -0.9840812, -5.037647, 0.9803922, 1, 0, 1,
-0.9587, -0.277436, -4.468263, 0.972549, 1, 0, 1,
-0.958485, 0.2895518, -1.769099, 0.9686275, 1, 0, 1,
-0.9537784, -0.9568737, -0.1003741, 0.9607843, 1, 0, 1,
-0.9491634, -2.445904, -3.332494, 0.9568627, 1, 0, 1,
-0.9462771, 1.578559, -0.5070094, 0.9490196, 1, 0, 1,
-0.9437549, -0.8120611, -1.990604, 0.945098, 1, 0, 1,
-0.9391657, 2.011431, -1.615006, 0.9372549, 1, 0, 1,
-0.9362491, -1.55328, -2.291823, 0.9333333, 1, 0, 1,
-0.9350316, -1.415962, -1.408418, 0.9254902, 1, 0, 1,
-0.9311236, -0.07971578, 1.016966, 0.9215686, 1, 0, 1,
-0.9270207, 0.1704571, -2.035131, 0.9137255, 1, 0, 1,
-0.9260286, 0.4283, -0.3178797, 0.9098039, 1, 0, 1,
-0.9253815, -1.383693, -2.434376, 0.9019608, 1, 0, 1,
-0.9208099, -0.6891353, -2.208642, 0.8941177, 1, 0, 1,
-0.9168893, -0.8854312, -2.840652, 0.8901961, 1, 0, 1,
-0.9151151, 1.413643, 0.6861386, 0.8823529, 1, 0, 1,
-0.9109546, 0.04415512, -0.7256508, 0.8784314, 1, 0, 1,
-0.9108117, -0.5298547, -2.083742, 0.8705882, 1, 0, 1,
-0.9050459, 0.1717197, -1.591707, 0.8666667, 1, 0, 1,
-0.9033645, -0.6443443, -3.24719, 0.8588235, 1, 0, 1,
-0.9028075, 2.401264, -1.658417, 0.854902, 1, 0, 1,
-0.8980699, -0.1691352, -0.3186724, 0.8470588, 1, 0, 1,
-0.8969951, -0.05266207, -0.4289312, 0.8431373, 1, 0, 1,
-0.8957922, 0.2513135, -1.024526, 0.8352941, 1, 0, 1,
-0.8951203, 0.8625016, -0.2508373, 0.8313726, 1, 0, 1,
-0.8947884, -1.06616, -3.105851, 0.8235294, 1, 0, 1,
-0.8943983, -1.232922, -2.107637, 0.8196079, 1, 0, 1,
-0.894035, -1.197408, -1.055465, 0.8117647, 1, 0, 1,
-0.8877674, 3.115178, -0.3718971, 0.8078431, 1, 0, 1,
-0.8859934, -0.3898337, -2.085521, 0.8, 1, 0, 1,
-0.8829526, 1.841637, -1.245369, 0.7921569, 1, 0, 1,
-0.8600798, -2.322534, -2.794132, 0.7882353, 1, 0, 1,
-0.8577684, -2.178198, -3.769616, 0.7803922, 1, 0, 1,
-0.8521772, 0.5520431, 1.395796, 0.7764706, 1, 0, 1,
-0.8521035, -0.4242815, -1.459532, 0.7686275, 1, 0, 1,
-0.8515884, 0.2951641, -2.564762, 0.7647059, 1, 0, 1,
-0.8471768, -0.1969426, -1.817911, 0.7568628, 1, 0, 1,
-0.8433707, -0.8669576, -1.543824, 0.7529412, 1, 0, 1,
-0.8377168, 0.7420381, -1.570167, 0.7450981, 1, 0, 1,
-0.8240839, 0.4981945, -0.8739252, 0.7411765, 1, 0, 1,
-0.8081495, -0.4808626, -3.10132, 0.7333333, 1, 0, 1,
-0.8050084, -1.29831, -3.445594, 0.7294118, 1, 0, 1,
-0.8022242, -0.7246929, -2.663064, 0.7215686, 1, 0, 1,
-0.7990924, 0.4844523, -1.797984, 0.7176471, 1, 0, 1,
-0.7977788, -0.2426867, -2.658318, 0.7098039, 1, 0, 1,
-0.7976792, 0.2566626, -0.8993025, 0.7058824, 1, 0, 1,
-0.7954804, -0.7386841, -0.05258375, 0.6980392, 1, 0, 1,
-0.7848093, -0.01243985, -2.583583, 0.6901961, 1, 0, 1,
-0.7761686, -0.7324548, -2.686529, 0.6862745, 1, 0, 1,
-0.7741143, 0.1939168, -1.537063, 0.6784314, 1, 0, 1,
-0.76773, -1.304321, -2.720251, 0.6745098, 1, 0, 1,
-0.766535, -0.8739126, -2.572337, 0.6666667, 1, 0, 1,
-0.7638688, 0.4636984, -0.8285294, 0.6627451, 1, 0, 1,
-0.7638667, -0.3805348, -1.240158, 0.654902, 1, 0, 1,
-0.7601174, -0.02917163, -2.808425, 0.6509804, 1, 0, 1,
-0.7559975, 1.743687, -1.368778, 0.6431373, 1, 0, 1,
-0.7557341, -0.4143934, -3.76903, 0.6392157, 1, 0, 1,
-0.7536979, -0.7186457, -2.552383, 0.6313726, 1, 0, 1,
-0.7498133, -2.053498, -2.649002, 0.627451, 1, 0, 1,
-0.7495202, -1.451517, -3.164231, 0.6196079, 1, 0, 1,
-0.7408762, 0.2919424, -0.8476207, 0.6156863, 1, 0, 1,
-0.7381672, -0.5840873, -3.75426, 0.6078432, 1, 0, 1,
-0.7375519, -0.7502854, -3.193054, 0.6039216, 1, 0, 1,
-0.7364387, 1.191579, -1.028637, 0.5960785, 1, 0, 1,
-0.7313133, -1.534007, -3.127004, 0.5882353, 1, 0, 1,
-0.7289455, 0.2193718, -0.06500949, 0.5843138, 1, 0, 1,
-0.7268304, -0.505988, -3.262304, 0.5764706, 1, 0, 1,
-0.722394, -0.429476, -2.149192, 0.572549, 1, 0, 1,
-0.7211884, 0.06623865, -1.780623, 0.5647059, 1, 0, 1,
-0.7211262, 3.036794, -1.469543, 0.5607843, 1, 0, 1,
-0.7167357, -3.998125, -1.95623, 0.5529412, 1, 0, 1,
-0.7133271, -1.976972, -3.403798, 0.5490196, 1, 0, 1,
-0.7104809, 0.8146603, -2.266862, 0.5411765, 1, 0, 1,
-0.706319, 0.7921354, -0.7582282, 0.5372549, 1, 0, 1,
-0.7018396, 0.4682781, -1.166461, 0.5294118, 1, 0, 1,
-0.6812548, -0.6367257, -2.829187, 0.5254902, 1, 0, 1,
-0.6811424, 1.262613, -0.4747678, 0.5176471, 1, 0, 1,
-0.6727382, 0.1574973, -1.915147, 0.5137255, 1, 0, 1,
-0.6720111, -0.7112759, -1.109531, 0.5058824, 1, 0, 1,
-0.6700338, -0.05863613, -3.143275, 0.5019608, 1, 0, 1,
-0.6663698, -2.242891, -1.767787, 0.4941176, 1, 0, 1,
-0.6555393, -1.297598, -2.945116, 0.4862745, 1, 0, 1,
-0.648867, 1.335421, 0.4283928, 0.4823529, 1, 0, 1,
-0.645048, 0.738016, -0.3091082, 0.4745098, 1, 0, 1,
-0.6392707, -1.106301, -2.277017, 0.4705882, 1, 0, 1,
-0.637998, -0.5293815, -2.925336, 0.4627451, 1, 0, 1,
-0.6372236, -0.09995864, -1.053016, 0.4588235, 1, 0, 1,
-0.6345063, 0.04243092, -0.1875847, 0.4509804, 1, 0, 1,
-0.6303462, 0.5262313, -0.3693588, 0.4470588, 1, 0, 1,
-0.6195753, -0.03986115, -1.060325, 0.4392157, 1, 0, 1,
-0.6130823, 0.4847835, -1.14367, 0.4352941, 1, 0, 1,
-0.6079785, 0.4586023, -3.230423, 0.427451, 1, 0, 1,
-0.6039366, -0.4399313, -3.359577, 0.4235294, 1, 0, 1,
-0.5934173, -1.419571, -2.356046, 0.4156863, 1, 0, 1,
-0.5929342, -0.03188339, -1.948997, 0.4117647, 1, 0, 1,
-0.592826, 1.073158, -1.027813, 0.4039216, 1, 0, 1,
-0.5862419, -1.647729, -2.500282, 0.3960784, 1, 0, 1,
-0.5862039, -1.997365, -2.445979, 0.3921569, 1, 0, 1,
-0.5819526, 1.049707, 1.058047, 0.3843137, 1, 0, 1,
-0.5673885, 0.9599846, -1.145835, 0.3803922, 1, 0, 1,
-0.5655334, -0.6113063, -2.360736, 0.372549, 1, 0, 1,
-0.5638319, 1.090159, -0.4703345, 0.3686275, 1, 0, 1,
-0.5637423, -0.772019, -1.702798, 0.3607843, 1, 0, 1,
-0.5584682, 0.5894611, 0.08592353, 0.3568628, 1, 0, 1,
-0.5577929, 0.1134195, -0.7922743, 0.3490196, 1, 0, 1,
-0.5551193, -0.07327301, -1.173325, 0.345098, 1, 0, 1,
-0.5514559, -0.3135823, -1.275775, 0.3372549, 1, 0, 1,
-0.5491526, 1.876001, -1.33425, 0.3333333, 1, 0, 1,
-0.5402564, -0.4639381, -4.281882, 0.3254902, 1, 0, 1,
-0.5392417, -0.2193661, -0.3288194, 0.3215686, 1, 0, 1,
-0.5353769, -0.4278043, -2.818443, 0.3137255, 1, 0, 1,
-0.5332747, -0.492219, -1.000884, 0.3098039, 1, 0, 1,
-0.5331774, 0.008437898, -3.226779, 0.3019608, 1, 0, 1,
-0.5297969, 0.1415931, -0.3436661, 0.2941177, 1, 0, 1,
-0.5289335, 0.1695309, -1.048512, 0.2901961, 1, 0, 1,
-0.5273035, -1.194094, -2.64221, 0.282353, 1, 0, 1,
-0.5249822, -0.6676198, -2.398368, 0.2784314, 1, 0, 1,
-0.5243784, 0.4118035, -2.779245, 0.2705882, 1, 0, 1,
-0.5207514, -1.194496, -1.134621, 0.2666667, 1, 0, 1,
-0.5163181, 0.8817808, 0.2041297, 0.2588235, 1, 0, 1,
-0.5160037, 0.8380319, -1.334353, 0.254902, 1, 0, 1,
-0.5155124, 0.2799897, -0.5911369, 0.2470588, 1, 0, 1,
-0.5106118, 0.4418441, 0.05287334, 0.2431373, 1, 0, 1,
-0.5056802, 0.1575142, -0.1773409, 0.2352941, 1, 0, 1,
-0.5051284, 1.33765, -0.6907974, 0.2313726, 1, 0, 1,
-0.5041618, -0.8349931, -2.374926, 0.2235294, 1, 0, 1,
-0.5040592, -0.5924985, -3.853714, 0.2196078, 1, 0, 1,
-0.5026903, -0.1331744, -2.978473, 0.2117647, 1, 0, 1,
-0.5010737, 1.051734, -0.3627689, 0.2078431, 1, 0, 1,
-0.4991866, -0.6110266, -3.277325, 0.2, 1, 0, 1,
-0.4958401, 0.1613182, -1.349997, 0.1921569, 1, 0, 1,
-0.4958161, -0.3929711, -4.236479, 0.1882353, 1, 0, 1,
-0.4900545, -2.133454, -1.277934, 0.1803922, 1, 0, 1,
-0.4869384, -0.287214, -2.118236, 0.1764706, 1, 0, 1,
-0.4860973, 0.6987367, 1.701027, 0.1686275, 1, 0, 1,
-0.484901, -0.1866084, -3.123174, 0.1647059, 1, 0, 1,
-0.4817642, 1.971992, -0.4493065, 0.1568628, 1, 0, 1,
-0.4808812, -0.4838824, -1.714373, 0.1529412, 1, 0, 1,
-0.4774721, -1.641245, -3.238204, 0.145098, 1, 0, 1,
-0.4694815, 0.05954144, -0.8544202, 0.1411765, 1, 0, 1,
-0.4675971, 0.136039, 0.1974862, 0.1333333, 1, 0, 1,
-0.4668311, -0.9827269, -4.607276, 0.1294118, 1, 0, 1,
-0.4666456, -0.7832893, -1.447094, 0.1215686, 1, 0, 1,
-0.465835, 2.123762, 0.8063364, 0.1176471, 1, 0, 1,
-0.465102, -0.2128238, -1.371921, 0.1098039, 1, 0, 1,
-0.462947, 0.49696, -0.1257239, 0.1058824, 1, 0, 1,
-0.4563314, 0.2964284, -0.9225473, 0.09803922, 1, 0, 1,
-0.4549868, 0.6912679, -0.9362314, 0.09019608, 1, 0, 1,
-0.4530249, -1.371988, -2.86647, 0.08627451, 1, 0, 1,
-0.4526457, -1.343895, -2.037442, 0.07843138, 1, 0, 1,
-0.4440534, 0.9974692, 1.584684, 0.07450981, 1, 0, 1,
-0.4439387, 0.8643402, 0.8466662, 0.06666667, 1, 0, 1,
-0.4438819, -1.046008, -1.89327, 0.0627451, 1, 0, 1,
-0.4320627, -0.9539243, -2.412191, 0.05490196, 1, 0, 1,
-0.4256785, -1.226453, -2.106338, 0.05098039, 1, 0, 1,
-0.4171108, 0.7783902, 0.2424487, 0.04313726, 1, 0, 1,
-0.4157892, -0.6058276, -3.025376, 0.03921569, 1, 0, 1,
-0.4113787, 0.5776695, -2.671586, 0.03137255, 1, 0, 1,
-0.409123, -0.2722451, -3.452195, 0.02745098, 1, 0, 1,
-0.4087675, -0.08256624, -3.016741, 0.01960784, 1, 0, 1,
-0.4047226, -0.2777522, -1.194032, 0.01568628, 1, 0, 1,
-0.3992053, -0.1193854, -2.495809, 0.007843138, 1, 0, 1,
-0.3964832, -2.730278, -2.977529, 0.003921569, 1, 0, 1,
-0.3964686, 0.532078, -1.919921, 0, 1, 0.003921569, 1,
-0.3927746, -1.724188, -3.592981, 0, 1, 0.01176471, 1,
-0.3875555, -0.5784804, -2.585468, 0, 1, 0.01568628, 1,
-0.3863842, -0.6140097, -2.832463, 0, 1, 0.02352941, 1,
-0.3847107, -1.104994, -3.895687, 0, 1, 0.02745098, 1,
-0.384571, 1.368486, 0.4277643, 0, 1, 0.03529412, 1,
-0.3842752, -0.3750617, -2.771954, 0, 1, 0.03921569, 1,
-0.3828189, 2.003, -0.001428815, 0, 1, 0.04705882, 1,
-0.3813086, -1.280968, -4.998402, 0, 1, 0.05098039, 1,
-0.3806212, -0.3827502, -4.135602, 0, 1, 0.05882353, 1,
-0.3777816, 2.17261, 0.7310182, 0, 1, 0.0627451, 1,
-0.3759316, 0.06548496, -2.648583, 0, 1, 0.07058824, 1,
-0.3757628, 0.7227097, -1.429847, 0, 1, 0.07450981, 1,
-0.3699102, -0.5038362, -3.894455, 0, 1, 0.08235294, 1,
-0.3696356, -0.01894356, -0.7396331, 0, 1, 0.08627451, 1,
-0.3644546, -0.03395448, -1.325363, 0, 1, 0.09411765, 1,
-0.363814, 0.7335905, -1.41845, 0, 1, 0.1019608, 1,
-0.3584831, -0.03671988, -0.6237284, 0, 1, 0.1058824, 1,
-0.3560509, -0.1381172, -2.806789, 0, 1, 0.1137255, 1,
-0.3542058, -1.132148, -2.684974, 0, 1, 0.1176471, 1,
-0.3535574, -0.3445696, -2.216647, 0, 1, 0.1254902, 1,
-0.3484945, 0.1068476, -1.99263, 0, 1, 0.1294118, 1,
-0.3462355, -0.5519599, -0.6109002, 0, 1, 0.1372549, 1,
-0.3459818, 0.005523036, -1.517898, 0, 1, 0.1411765, 1,
-0.3421313, 1.09483, -0.7610767, 0, 1, 0.1490196, 1,
-0.3395484, 1.260324, -1.599783, 0, 1, 0.1529412, 1,
-0.3380717, 0.9246004, 0.2811474, 0, 1, 0.1607843, 1,
-0.3378494, -2.180798, -1.862342, 0, 1, 0.1647059, 1,
-0.3370077, -0.8504394, -2.368111, 0, 1, 0.172549, 1,
-0.3353257, -0.2160704, -1.046509, 0, 1, 0.1764706, 1,
-0.3222201, -0.1209989, -3.103985, 0, 1, 0.1843137, 1,
-0.3153953, 1.370414, -1.471814, 0, 1, 0.1882353, 1,
-0.3108962, -0.8375663, -4.419368, 0, 1, 0.1960784, 1,
-0.3108502, -1.121122, -2.124446, 0, 1, 0.2039216, 1,
-0.305358, 0.465682, -0.3349633, 0, 1, 0.2078431, 1,
-0.3051821, 1.311357, -1.309377, 0, 1, 0.2156863, 1,
-0.3050096, -0.1243107, -1.978549, 0, 1, 0.2196078, 1,
-0.3043697, -1.365755, -1.96007, 0, 1, 0.227451, 1,
-0.3024113, -0.2716841, -0.9188735, 0, 1, 0.2313726, 1,
-0.3018793, -1.686206, -4.489635, 0, 1, 0.2392157, 1,
-0.3010489, -0.6601015, -2.780479, 0, 1, 0.2431373, 1,
-0.2991954, 0.9835322, 0.9540426, 0, 1, 0.2509804, 1,
-0.2981804, 0.2158633, -0.4956658, 0, 1, 0.254902, 1,
-0.2941217, 1.805452, -0.1532219, 0, 1, 0.2627451, 1,
-0.2927661, -0.3657739, -1.619694, 0, 1, 0.2666667, 1,
-0.2875114, -0.4301108, -2.205251, 0, 1, 0.2745098, 1,
-0.2838211, -0.5437205, -1.051756, 0, 1, 0.2784314, 1,
-0.2806814, 0.1981547, 1.908283, 0, 1, 0.2862745, 1,
-0.2775524, -1.448246, -3.528451, 0, 1, 0.2901961, 1,
-0.2746256, 0.9287203, 0.6317173, 0, 1, 0.2980392, 1,
-0.2736742, -1.422251, -3.099049, 0, 1, 0.3058824, 1,
-0.2733598, -1.002992, -2.714149, 0, 1, 0.3098039, 1,
-0.2716976, -0.2968864, -1.625315, 0, 1, 0.3176471, 1,
-0.2711694, -1.704581, -2.098947, 0, 1, 0.3215686, 1,
-0.2704756, -0.293655, -2.648081, 0, 1, 0.3294118, 1,
-0.270108, 0.3442516, -2.364983, 0, 1, 0.3333333, 1,
-0.2691501, -1.640708, -3.339102, 0, 1, 0.3411765, 1,
-0.2648744, 0.2706415, -1.028003, 0, 1, 0.345098, 1,
-0.2636342, 0.994837, 0.2189932, 0, 1, 0.3529412, 1,
-0.259392, -0.7955817, -2.251477, 0, 1, 0.3568628, 1,
-0.2528504, 0.3886434, -1.713086, 0, 1, 0.3647059, 1,
-0.2515859, 0.7705576, -0.8619284, 0, 1, 0.3686275, 1,
-0.2436205, -0.9773267, -3.874184, 0, 1, 0.3764706, 1,
-0.2422158, -1.12508, -2.230883, 0, 1, 0.3803922, 1,
-0.23927, 1.630154, -1.680372, 0, 1, 0.3882353, 1,
-0.2368848, 0.5272861, 0.1465252, 0, 1, 0.3921569, 1,
-0.235907, 0.924721, 0.1849507, 0, 1, 0.4, 1,
-0.2344574, 0.8115854, 1.070612, 0, 1, 0.4078431, 1,
-0.2259787, 1.18638, 0.559451, 0, 1, 0.4117647, 1,
-0.2252655, -0.929226, -4.355645, 0, 1, 0.4196078, 1,
-0.2229218, 0.6848009, -0.2691422, 0, 1, 0.4235294, 1,
-0.2215117, -1.071916, -1.663943, 0, 1, 0.4313726, 1,
-0.2207868, 0.7482452, 3.312803, 0, 1, 0.4352941, 1,
-0.2137999, -0.8936577, -5.091581, 0, 1, 0.4431373, 1,
-0.2117194, -1.158382, -3.721976, 0, 1, 0.4470588, 1,
-0.2096129, 0.9915969, 0.2556442, 0, 1, 0.454902, 1,
-0.2020058, -0.1963412, -2.899402, 0, 1, 0.4588235, 1,
-0.1991934, -1.131989, -3.664128, 0, 1, 0.4666667, 1,
-0.1954524, -0.7295862, -1.895858, 0, 1, 0.4705882, 1,
-0.1890791, 1.502044, -0.6127898, 0, 1, 0.4784314, 1,
-0.1870348, 0.3879931, -1.104334, 0, 1, 0.4823529, 1,
-0.1855006, -1.001043, -3.70207, 0, 1, 0.4901961, 1,
-0.18523, 1.44677, 0.3912984, 0, 1, 0.4941176, 1,
-0.1828616, 1.212553, 0.03717536, 0, 1, 0.5019608, 1,
-0.1806136, 0.09278601, 0.09603886, 0, 1, 0.509804, 1,
-0.1797828, 1.18626, 1.073296, 0, 1, 0.5137255, 1,
-0.1783881, 0.5291626, 1.306866, 0, 1, 0.5215687, 1,
-0.1730181, -1.032562, -3.124702, 0, 1, 0.5254902, 1,
-0.1724019, 2.312309, -0.6689661, 0, 1, 0.5333334, 1,
-0.1668137, -1.548769, -3.420453, 0, 1, 0.5372549, 1,
-0.1656045, -0.451025, -3.221349, 0, 1, 0.5450981, 1,
-0.1623578, 0.7155235, -1.52489, 0, 1, 0.5490196, 1,
-0.1609786, 0.9191103, 0.8761356, 0, 1, 0.5568628, 1,
-0.1591543, 0.4949585, -0.7999812, 0, 1, 0.5607843, 1,
-0.1550493, -0.6296762, -2.30037, 0, 1, 0.5686275, 1,
-0.1538229, -0.8025475, -3.717699, 0, 1, 0.572549, 1,
-0.1498923, 0.03640028, -1.071415, 0, 1, 0.5803922, 1,
-0.1449699, -0.2360858, -3.513644, 0, 1, 0.5843138, 1,
-0.1443286, 1.26825, 1.75251, 0, 1, 0.5921569, 1,
-0.1442969, 1.043476, 1.520913, 0, 1, 0.5960785, 1,
-0.1422427, -0.6580786, -3.325203, 0, 1, 0.6039216, 1,
-0.1348074, -0.7914677, -3.969311, 0, 1, 0.6117647, 1,
-0.1344981, -0.6265284, -2.371705, 0, 1, 0.6156863, 1,
-0.1329139, -0.043539, -1.741011, 0, 1, 0.6235294, 1,
-0.1316065, 0.1401597, -0.4214935, 0, 1, 0.627451, 1,
-0.1203326, -1.335145, -3.956275, 0, 1, 0.6352941, 1,
-0.117462, -0.7287838, -1.066651, 0, 1, 0.6392157, 1,
-0.1149318, 0.496002, -0.3411609, 0, 1, 0.6470588, 1,
-0.1137131, 0.6311435, -0.3511519, 0, 1, 0.6509804, 1,
-0.1133396, -0.1294497, -1.779274, 0, 1, 0.6588235, 1,
-0.1129388, -0.05381986, -2.211333, 0, 1, 0.6627451, 1,
-0.1112711, 0.03409252, -2.091771, 0, 1, 0.6705883, 1,
-0.1076334, 0.8992618, 1.630906, 0, 1, 0.6745098, 1,
-0.1048578, 1.105025, 1.166654, 0, 1, 0.682353, 1,
-0.102683, 0.854941, -1.468599, 0, 1, 0.6862745, 1,
-0.1000998, -0.4746963, -2.37065, 0, 1, 0.6941177, 1,
-0.09889655, 0.801765, -0.2162254, 0, 1, 0.7019608, 1,
-0.09752545, -0.0131111, -0.4530928, 0, 1, 0.7058824, 1,
-0.09548707, -0.2318958, -2.576484, 0, 1, 0.7137255, 1,
-0.09092048, -0.2138774, -2.5638, 0, 1, 0.7176471, 1,
-0.08788159, -0.2320721, -3.415392, 0, 1, 0.7254902, 1,
-0.08345155, 0.0842545, -2.093008, 0, 1, 0.7294118, 1,
-0.08255936, 1.203688, 0.8987996, 0, 1, 0.7372549, 1,
-0.08131512, -2.216855, -3.137989, 0, 1, 0.7411765, 1,
-0.08126672, -0.01379379, -2.154141, 0, 1, 0.7490196, 1,
-0.07880894, -1.335636, -3.526277, 0, 1, 0.7529412, 1,
-0.07548695, -1.373324, -1.451011, 0, 1, 0.7607843, 1,
-0.07238528, -0.1857041, -2.747579, 0, 1, 0.7647059, 1,
-0.07086722, 0.5431678, -0.6723889, 0, 1, 0.772549, 1,
-0.06843068, 0.1843899, 1.029283, 0, 1, 0.7764706, 1,
-0.06651986, 0.5475694, 1.050245, 0, 1, 0.7843137, 1,
-0.06340671, 0.869085, 0.4484061, 0, 1, 0.7882353, 1,
-0.06253862, -0.7025825, -2.442368, 0, 1, 0.7960784, 1,
-0.06241369, -1.758585, -2.354615, 0, 1, 0.8039216, 1,
-0.06144367, -1.883011, -2.512274, 0, 1, 0.8078431, 1,
-0.05828518, -1.140459, -1.913285, 0, 1, 0.8156863, 1,
-0.0568787, 0.4214597, -0.4234881, 0, 1, 0.8196079, 1,
-0.05441922, 1.276705, -0.1723288, 0, 1, 0.827451, 1,
-0.05379452, -0.04704297, -0.9049219, 0, 1, 0.8313726, 1,
-0.05170523, 1.505883, -0.04848814, 0, 1, 0.8392157, 1,
-0.05166289, 0.1525662, -0.7327943, 0, 1, 0.8431373, 1,
-0.04971065, -1.688203, -3.804912, 0, 1, 0.8509804, 1,
-0.04792384, 2.016415, -0.2371057, 0, 1, 0.854902, 1,
-0.04761734, -0.2867979, -2.557113, 0, 1, 0.8627451, 1,
-0.04366493, -0.4921456, -3.30873, 0, 1, 0.8666667, 1,
-0.04098899, 0.626065, -1.688478, 0, 1, 0.8745098, 1,
-0.03824926, 0.2950951, 0.417341, 0, 1, 0.8784314, 1,
-0.03350817, -0.2783302, -2.40043, 0, 1, 0.8862745, 1,
-0.03323815, -1.425146, -4.08649, 0, 1, 0.8901961, 1,
-0.02805479, 0.4585266, -0.2798629, 0, 1, 0.8980392, 1,
-0.02419399, -0.2058556, -2.25299, 0, 1, 0.9058824, 1,
-0.02285003, -0.1428183, -4.047746, 0, 1, 0.9098039, 1,
-0.0208819, -1.371004, -4.578314, 0, 1, 0.9176471, 1,
-0.01021366, 0.6031914, 0.9049068, 0, 1, 0.9215686, 1,
-0.009192277, -0.7403212, -3.703885, 0, 1, 0.9294118, 1,
-0.007584203, 0.01051505, -0.1963662, 0, 1, 0.9333333, 1,
-0.006135684, -0.6114671, -3.423428, 0, 1, 0.9411765, 1,
-0.005549527, 1.51767, 0.0430114, 0, 1, 0.945098, 1,
-2.974907e-05, 0.3745948, -0.287403, 0, 1, 0.9529412, 1,
0.0008326493, 0.6562773, 0.02564579, 0, 1, 0.9568627, 1,
0.010578, -0.6286408, 2.400029, 0, 1, 0.9647059, 1,
0.01208754, -0.5144405, 3.250362, 0, 1, 0.9686275, 1,
0.014419, 1.877813, -0.7942772, 0, 1, 0.9764706, 1,
0.01527949, -0.746823, 3.637612, 0, 1, 0.9803922, 1,
0.01618519, -0.9754272, 3.561033, 0, 1, 0.9882353, 1,
0.02738411, -1.229947, 1.815743, 0, 1, 0.9921569, 1,
0.03623963, 0.9344656, 1.696286, 0, 1, 1, 1,
0.03701743, -1.151303, 3.686708, 0, 0.9921569, 1, 1,
0.04193406, 0.5225299, 0.7742859, 0, 0.9882353, 1, 1,
0.04254293, -0.6840641, 2.916429, 0, 0.9803922, 1, 1,
0.04801637, -0.53974, 1.432251, 0, 0.9764706, 1, 1,
0.04997804, 0.1430095, 0.08542316, 0, 0.9686275, 1, 1,
0.05215038, 0.7562249, 1.674163, 0, 0.9647059, 1, 1,
0.05291785, 1.086318, -1.155832, 0, 0.9568627, 1, 1,
0.05356809, 1.261187, -1.653758, 0, 0.9529412, 1, 1,
0.05809708, -0.5951627, 3.626662, 0, 0.945098, 1, 1,
0.06098533, 0.2672385, 0.2255167, 0, 0.9411765, 1, 1,
0.0627052, -0.678738, 2.261481, 0, 0.9333333, 1, 1,
0.06279872, 0.5602322, 1.439076, 0, 0.9294118, 1, 1,
0.06304883, -0.5541937, 1.587967, 0, 0.9215686, 1, 1,
0.06395641, 0.5685617, 0.8057696, 0, 0.9176471, 1, 1,
0.06623956, -0.2882063, 2.139297, 0, 0.9098039, 1, 1,
0.06673229, -0.1161544, 4.150556, 0, 0.9058824, 1, 1,
0.07368997, 0.5764719, -0.345242, 0, 0.8980392, 1, 1,
0.07913537, 0.5460703, 1.165751, 0, 0.8901961, 1, 1,
0.08631198, -1.950681, 4.444435, 0, 0.8862745, 1, 1,
0.08776274, -1.747464, 3.15612, 0, 0.8784314, 1, 1,
0.08855464, 0.2750547, 0.155616, 0, 0.8745098, 1, 1,
0.09055226, -0.0909941, 1.085487, 0, 0.8666667, 1, 1,
0.09400906, 0.2207945, 0.8984492, 0, 0.8627451, 1, 1,
0.0968696, 0.2393352, 0.8542454, 0, 0.854902, 1, 1,
0.09900534, 0.7337947, 1.432444, 0, 0.8509804, 1, 1,
0.1046778, -0.08452617, 3.04992, 0, 0.8431373, 1, 1,
0.1109043, -1.568159, 2.626629, 0, 0.8392157, 1, 1,
0.1111475, -0.4156701, 4.261836, 0, 0.8313726, 1, 1,
0.1136071, -1.008992, 2.01291, 0, 0.827451, 1, 1,
0.1155939, -0.610662, 4.891298, 0, 0.8196079, 1, 1,
0.1164546, 0.1048985, 0.8337275, 0, 0.8156863, 1, 1,
0.1171116, 1.747065, -1.641077, 0, 0.8078431, 1, 1,
0.1219217, -0.4076528, 2.60636, 0, 0.8039216, 1, 1,
0.1234979, -0.0701472, 2.284311, 0, 0.7960784, 1, 1,
0.1256555, -0.550249, 2.417402, 0, 0.7882353, 1, 1,
0.1288366, -1.322621, 3.064575, 0, 0.7843137, 1, 1,
0.1322022, -0.1311544, 2.53829, 0, 0.7764706, 1, 1,
0.1335632, 0.4433411, -3.651121, 0, 0.772549, 1, 1,
0.1349745, -0.5736899, 1.647602, 0, 0.7647059, 1, 1,
0.140142, -0.241233, 1.401159, 0, 0.7607843, 1, 1,
0.1452257, 0.101796, 0.5178401, 0, 0.7529412, 1, 1,
0.1453181, 0.9506397, 0.08888783, 0, 0.7490196, 1, 1,
0.1621088, 0.3805378, -1.303284, 0, 0.7411765, 1, 1,
0.1642882, 0.6032183, -0.09513599, 0, 0.7372549, 1, 1,
0.1646423, -1.143606, 2.046445, 0, 0.7294118, 1, 1,
0.1729579, -0.1192853, 0.007151831, 0, 0.7254902, 1, 1,
0.1732405, 1.035349, 1.716567, 0, 0.7176471, 1, 1,
0.1758179, -1.838964, 5.19687, 0, 0.7137255, 1, 1,
0.17647, -1.032402, 2.697675, 0, 0.7058824, 1, 1,
0.1764962, -2.285931, 2.739745, 0, 0.6980392, 1, 1,
0.1765821, -1.516756, 3.293589, 0, 0.6941177, 1, 1,
0.1793338, -0.5468187, 4.180506, 0, 0.6862745, 1, 1,
0.179764, -1.307113, 2.781444, 0, 0.682353, 1, 1,
0.1911256, 0.2099905, -0.9427915, 0, 0.6745098, 1, 1,
0.1912699, 1.15853, 0.815156, 0, 0.6705883, 1, 1,
0.1926282, -0.04688321, 3.025337, 0, 0.6627451, 1, 1,
0.1940335, 2.10727, -0.0239368, 0, 0.6588235, 1, 1,
0.1946798, -0.3323105, 1.804449, 0, 0.6509804, 1, 1,
0.1976827, 1.007684, -1.135755, 0, 0.6470588, 1, 1,
0.1998329, -3.153447, 2.394533, 0, 0.6392157, 1, 1,
0.2075111, 0.1220589, 1.528955, 0, 0.6352941, 1, 1,
0.2114927, 0.09638336, -1.019234, 0, 0.627451, 1, 1,
0.2158371, -0.6928769, 3.514169, 0, 0.6235294, 1, 1,
0.2168605, 0.01810935, 1.193886, 0, 0.6156863, 1, 1,
0.2183319, -0.5911382, 2.933687, 0, 0.6117647, 1, 1,
0.2204501, -1.346139, 2.944153, 0, 0.6039216, 1, 1,
0.2217937, 1.068389, 0.7230658, 0, 0.5960785, 1, 1,
0.2231279, -1.205295, 1.500118, 0, 0.5921569, 1, 1,
0.2271156, -0.222379, 0.9576789, 0, 0.5843138, 1, 1,
0.2311818, 1.58589, -0.460638, 0, 0.5803922, 1, 1,
0.2336849, 0.4118873, 0.5973597, 0, 0.572549, 1, 1,
0.2342067, -0.09338397, 0.7020927, 0, 0.5686275, 1, 1,
0.2343462, 1.296818, -0.2123953, 0, 0.5607843, 1, 1,
0.2347104, 0.9114587, -0.1557203, 0, 0.5568628, 1, 1,
0.2431089, -0.1040002, 2.018086, 0, 0.5490196, 1, 1,
0.2433396, -0.7298914, 3.191085, 0, 0.5450981, 1, 1,
0.2483798, 0.6237196, 0.1856417, 0, 0.5372549, 1, 1,
0.2510372, 1.403685, -1.548091, 0, 0.5333334, 1, 1,
0.2519212, -0.683782, 1.880333, 0, 0.5254902, 1, 1,
0.2528065, 0.6362858, 1.010607, 0, 0.5215687, 1, 1,
0.25358, -0.944015, 2.714436, 0, 0.5137255, 1, 1,
0.2618959, 0.4156883, 0.9971643, 0, 0.509804, 1, 1,
0.2619101, 0.790958, -0.3978835, 0, 0.5019608, 1, 1,
0.2670784, -1.744071, 2.624264, 0, 0.4941176, 1, 1,
0.2684349, 0.3511752, -0.2879616, 0, 0.4901961, 1, 1,
0.2709962, -0.4668452, 1.703845, 0, 0.4823529, 1, 1,
0.2726023, 0.9046758, 1.296273, 0, 0.4784314, 1, 1,
0.273734, -0.1787795, 1.175953, 0, 0.4705882, 1, 1,
0.2741251, 0.1506477, 0.9472705, 0, 0.4666667, 1, 1,
0.2742875, -1.259797, 4.352282, 0, 0.4588235, 1, 1,
0.2777953, 1.441703, -0.8685122, 0, 0.454902, 1, 1,
0.2814439, -0.9589677, 2.797018, 0, 0.4470588, 1, 1,
0.2848585, -1.567183, 3.794758, 0, 0.4431373, 1, 1,
0.2849391, -2.302207, 0.7909947, 0, 0.4352941, 1, 1,
0.2852222, 1.382962, 0.1031397, 0, 0.4313726, 1, 1,
0.2857993, -1.061713, 2.743016, 0, 0.4235294, 1, 1,
0.2908477, 0.6437319, 0.4220383, 0, 0.4196078, 1, 1,
0.2960508, -1.144599, 1.711889, 0, 0.4117647, 1, 1,
0.2960669, 0.3351237, 1.477597, 0, 0.4078431, 1, 1,
0.3003874, -0.1052996, 1.044056, 0, 0.4, 1, 1,
0.3014398, 0.713886, -0.7847224, 0, 0.3921569, 1, 1,
0.301883, -0.7724273, 2.25501, 0, 0.3882353, 1, 1,
0.3021719, 0.06056183, 1.753431, 0, 0.3803922, 1, 1,
0.3029677, 0.2367605, 1.081808, 0, 0.3764706, 1, 1,
0.3047952, 0.5268442, 1.585178, 0, 0.3686275, 1, 1,
0.3050773, -0.7061468, 3.825207, 0, 0.3647059, 1, 1,
0.3057637, 0.02083306, -0.03496951, 0, 0.3568628, 1, 1,
0.30714, 0.2175814, 0.6369513, 0, 0.3529412, 1, 1,
0.3154824, -0.129387, 0.6600705, 0, 0.345098, 1, 1,
0.3166277, -1.542043, 3.369911, 0, 0.3411765, 1, 1,
0.3182178, -0.7880245, 2.946071, 0, 0.3333333, 1, 1,
0.3189069, -0.03893537, 1.274943, 0, 0.3294118, 1, 1,
0.3195843, 0.1651736, 0.7561095, 0, 0.3215686, 1, 1,
0.320402, -1.358002, 3.388691, 0, 0.3176471, 1, 1,
0.3209912, 0.3714475, 1.651353, 0, 0.3098039, 1, 1,
0.322195, -0.9586844, 2.359464, 0, 0.3058824, 1, 1,
0.3233954, -0.1905738, 1.626395, 0, 0.2980392, 1, 1,
0.3245856, -0.1186551, 0.8720223, 0, 0.2901961, 1, 1,
0.3270376, -0.5362905, 1.127371, 0, 0.2862745, 1, 1,
0.3347705, 0.7284132, 0.1306193, 0, 0.2784314, 1, 1,
0.3420071, -0.1437228, 2.11792, 0, 0.2745098, 1, 1,
0.3475634, -0.9074957, 1.948325, 0, 0.2666667, 1, 1,
0.347743, 1.979137, 0.8024874, 0, 0.2627451, 1, 1,
0.3496441, 0.6112915, 1.818302, 0, 0.254902, 1, 1,
0.349694, -0.1110362, 1.776671, 0, 0.2509804, 1, 1,
0.3507731, -0.3410068, 2.097201, 0, 0.2431373, 1, 1,
0.3526319, -0.5882622, 3.506994, 0, 0.2392157, 1, 1,
0.3584148, -1.694167, 3.259778, 0, 0.2313726, 1, 1,
0.3586107, 0.5315444, 0.9964876, 0, 0.227451, 1, 1,
0.360091, -0.3359396, 2.078834, 0, 0.2196078, 1, 1,
0.3634825, -1.051534, 2.034948, 0, 0.2156863, 1, 1,
0.3650039, -1.595419, 2.84551, 0, 0.2078431, 1, 1,
0.3670695, -1.458897, 1.090671, 0, 0.2039216, 1, 1,
0.3704345, -0.9932583, 1.578043, 0, 0.1960784, 1, 1,
0.3715886, 1.382788, -3.833521, 0, 0.1882353, 1, 1,
0.3742459, 1.915979, 0.9110224, 0, 0.1843137, 1, 1,
0.3745936, -1.383762, 3.541184, 0, 0.1764706, 1, 1,
0.3751135, 0.08659124, 0.9609014, 0, 0.172549, 1, 1,
0.3762948, -1.458151, 2.904518, 0, 0.1647059, 1, 1,
0.3803124, -0.4218234, 3.019835, 0, 0.1607843, 1, 1,
0.3843567, -0.1397314, 3.150828, 0, 0.1529412, 1, 1,
0.3852156, -0.1114455, 3.090353, 0, 0.1490196, 1, 1,
0.3870873, 0.1858394, -0.1240755, 0, 0.1411765, 1, 1,
0.3874709, 1.348083, 0.1126402, 0, 0.1372549, 1, 1,
0.3880082, -0.3906971, 2.865115, 0, 0.1294118, 1, 1,
0.390373, -1.783182, 2.495382, 0, 0.1254902, 1, 1,
0.3921867, -0.3566475, 0.04921648, 0, 0.1176471, 1, 1,
0.3952811, -0.9505662, 2.623698, 0, 0.1137255, 1, 1,
0.3958211, -0.2084473, 1.434695, 0, 0.1058824, 1, 1,
0.3973513, -0.1384557, 2.924964, 0, 0.09803922, 1, 1,
0.3997465, 0.0888178, 2.686024, 0, 0.09411765, 1, 1,
0.403237, -0.2698506, 1.777488, 0, 0.08627451, 1, 1,
0.4142432, -1.074479, 2.540943, 0, 0.08235294, 1, 1,
0.4152639, -1.793933, 3.407649, 0, 0.07450981, 1, 1,
0.4163327, -0.2711429, 1.91744, 0, 0.07058824, 1, 1,
0.4272782, 0.5573551, 0.4237828, 0, 0.0627451, 1, 1,
0.4275055, 0.5940858, 0.6083735, 0, 0.05882353, 1, 1,
0.4294686, -0.4474486, 2.947993, 0, 0.05098039, 1, 1,
0.4325238, 1.195414, -0.6311755, 0, 0.04705882, 1, 1,
0.445405, 0.4487908, 1.050084, 0, 0.03921569, 1, 1,
0.4468687, -0.6315751, 2.138192, 0, 0.03529412, 1, 1,
0.4498274, 0.6057169, 1.023879, 0, 0.02745098, 1, 1,
0.4512942, 0.4372716, 0.2948515, 0, 0.02352941, 1, 1,
0.4535785, -1.1359, 2.232182, 0, 0.01568628, 1, 1,
0.4547813, 0.88133, 0.7179874, 0, 0.01176471, 1, 1,
0.4548685, -0.8354741, 2.05314, 0, 0.003921569, 1, 1,
0.4591777, 0.1302925, 2.950577, 0.003921569, 0, 1, 1,
0.4593916, 0.384174, 1.583109, 0.007843138, 0, 1, 1,
0.459547, 1.154897, 0.6719329, 0.01568628, 0, 1, 1,
0.4611667, -1.057856, 2.1969, 0.01960784, 0, 1, 1,
0.4629741, -0.07269135, 1.035009, 0.02745098, 0, 1, 1,
0.4631064, 1.194534, 0.7061002, 0.03137255, 0, 1, 1,
0.4632227, 0.03695012, 0.3991102, 0.03921569, 0, 1, 1,
0.4659081, -1.299256, 3.446892, 0.04313726, 0, 1, 1,
0.4669518, 1.069981, -0.9529978, 0.05098039, 0, 1, 1,
0.4682851, 1.497612, 0.5491894, 0.05490196, 0, 1, 1,
0.4716977, 0.1474141, 1.606525, 0.0627451, 0, 1, 1,
0.4761575, 0.7591641, 0.679126, 0.06666667, 0, 1, 1,
0.4860021, -0.9355793, 1.877487, 0.07450981, 0, 1, 1,
0.4915428, 1.080209, 0.04787255, 0.07843138, 0, 1, 1,
0.4924416, -0.07415153, 2.557364, 0.08627451, 0, 1, 1,
0.4929235, 0.2032926, 0.8741398, 0.09019608, 0, 1, 1,
0.4934217, 0.4257202, 1.124949, 0.09803922, 0, 1, 1,
0.495227, -0.6428783, 2.072968, 0.1058824, 0, 1, 1,
0.5014473, 0.1468185, 2.918379, 0.1098039, 0, 1, 1,
0.5014944, -0.5922897, 1.365649, 0.1176471, 0, 1, 1,
0.5017652, 0.07517634, 2.634438, 0.1215686, 0, 1, 1,
0.5085472, -0.1773257, 2.767312, 0.1294118, 0, 1, 1,
0.5102833, -1.221824, 0.850816, 0.1333333, 0, 1, 1,
0.510361, 0.306171, 0.9817306, 0.1411765, 0, 1, 1,
0.5143133, 0.475234, 0.8056621, 0.145098, 0, 1, 1,
0.5144055, -2.112157, 3.096587, 0.1529412, 0, 1, 1,
0.5159446, -0.4544817, 3.227398, 0.1568628, 0, 1, 1,
0.5165372, 0.5675683, 1.040829, 0.1647059, 0, 1, 1,
0.5180213, 0.1135352, 1.278287, 0.1686275, 0, 1, 1,
0.5184324, 0.1528752, 1.628155, 0.1764706, 0, 1, 1,
0.5196256, 0.3522711, 0.4613683, 0.1803922, 0, 1, 1,
0.5266052, -0.855016, 3.604806, 0.1882353, 0, 1, 1,
0.5267467, -0.2298481, 2.402169, 0.1921569, 0, 1, 1,
0.5288607, 0.119353, 0.0110062, 0.2, 0, 1, 1,
0.529081, -1.590102, 3.002629, 0.2078431, 0, 1, 1,
0.5303843, 1.650468, -0.6228347, 0.2117647, 0, 1, 1,
0.5315078, -0.39631, 1.878941, 0.2196078, 0, 1, 1,
0.5332531, -1.258401, 3.457201, 0.2235294, 0, 1, 1,
0.5358821, 0.2324584, 1.00623, 0.2313726, 0, 1, 1,
0.5362517, 0.6316367, 0.5935621, 0.2352941, 0, 1, 1,
0.5469556, 1.307921, 0.7412226, 0.2431373, 0, 1, 1,
0.552124, -0.07051937, 1.984081, 0.2470588, 0, 1, 1,
0.5540377, -0.5731377, 0.7752832, 0.254902, 0, 1, 1,
0.5548115, -0.2694197, 0.8694101, 0.2588235, 0, 1, 1,
0.5567024, 0.2187831, 0.9990952, 0.2666667, 0, 1, 1,
0.5606468, 0.2497852, 3.079112, 0.2705882, 0, 1, 1,
0.5616908, 0.9885254, 1.279844, 0.2784314, 0, 1, 1,
0.5622529, 0.2733028, 1.371456, 0.282353, 0, 1, 1,
0.5633643, -0.3331529, 1.813127, 0.2901961, 0, 1, 1,
0.5639657, 0.08501032, 1.075173, 0.2941177, 0, 1, 1,
0.5664561, -1.172827, 2.565647, 0.3019608, 0, 1, 1,
0.5688091, 0.4372419, 0.6215985, 0.3098039, 0, 1, 1,
0.5718476, 1.672577, 0.820531, 0.3137255, 0, 1, 1,
0.5756851, 0.4525135, 1.129363, 0.3215686, 0, 1, 1,
0.5819472, 0.3086568, 1.093301, 0.3254902, 0, 1, 1,
0.5911675, -0.9736384, 3.379437, 0.3333333, 0, 1, 1,
0.5931188, -1.253126, 2.092148, 0.3372549, 0, 1, 1,
0.5950416, 0.6892256, 1.513174, 0.345098, 0, 1, 1,
0.5950925, 1.647297, 1.252034, 0.3490196, 0, 1, 1,
0.6014185, 0.07819915, 0.4198567, 0.3568628, 0, 1, 1,
0.601559, -0.3028378, 1.792524, 0.3607843, 0, 1, 1,
0.6019468, -0.1867839, 1.644469, 0.3686275, 0, 1, 1,
0.6051782, -0.4607868, 4.471489, 0.372549, 0, 1, 1,
0.6087, -0.5649058, 1.442184, 0.3803922, 0, 1, 1,
0.6137013, -0.6156576, 0.1231812, 0.3843137, 0, 1, 1,
0.6145068, -2.26085, 2.576445, 0.3921569, 0, 1, 1,
0.6156026, -1.065462, 2.337541, 0.3960784, 0, 1, 1,
0.6168759, 0.5899822, 0.9642263, 0.4039216, 0, 1, 1,
0.6186401, -2.037156, 2.505977, 0.4117647, 0, 1, 1,
0.6225217, -0.253605, 0.8729976, 0.4156863, 0, 1, 1,
0.6288509, 0.2386262, 0.3988411, 0.4235294, 0, 1, 1,
0.6379827, -0.900457, 3.36463, 0.427451, 0, 1, 1,
0.6398803, -0.6361026, 3.221249, 0.4352941, 0, 1, 1,
0.6415932, -0.08877065, 0.8332731, 0.4392157, 0, 1, 1,
0.6468264, -2.806211, 2.323906, 0.4470588, 0, 1, 1,
0.6492787, 0.04086814, 1.226998, 0.4509804, 0, 1, 1,
0.6494926, 1.504449, -0.2742426, 0.4588235, 0, 1, 1,
0.6507167, -1.078938, 2.943039, 0.4627451, 0, 1, 1,
0.664722, -0.177401, 3.960125, 0.4705882, 0, 1, 1,
0.6673651, -0.7369752, 1.326826, 0.4745098, 0, 1, 1,
0.6685457, -0.9750195, 3.001594, 0.4823529, 0, 1, 1,
0.6733299, -0.9237324, 0.2286599, 0.4862745, 0, 1, 1,
0.6834074, -0.9067104, 3.397992, 0.4941176, 0, 1, 1,
0.6934666, -0.3261233, 1.387114, 0.5019608, 0, 1, 1,
0.6963187, -0.06175942, 2.910948, 0.5058824, 0, 1, 1,
0.7064525, -0.5689887, 3.000633, 0.5137255, 0, 1, 1,
0.706623, -0.01241697, 2.791852, 0.5176471, 0, 1, 1,
0.7129407, 0.8579287, 0.7418849, 0.5254902, 0, 1, 1,
0.7141867, 0.9433871, 1.971181, 0.5294118, 0, 1, 1,
0.7161348, -0.03459016, 0.5546486, 0.5372549, 0, 1, 1,
0.7171368, -0.03694869, 1.234895, 0.5411765, 0, 1, 1,
0.7174885, -0.3316921, 1.88716, 0.5490196, 0, 1, 1,
0.7205411, -0.139274, 1.881159, 0.5529412, 0, 1, 1,
0.7213089, 0.254556, -0.1660739, 0.5607843, 0, 1, 1,
0.7221354, -1.271788, 2.769176, 0.5647059, 0, 1, 1,
0.7270187, -0.9240041, 1.198237, 0.572549, 0, 1, 1,
0.7308999, 0.1115079, 0.1160868, 0.5764706, 0, 1, 1,
0.7361037, -0.07323085, 2.80328, 0.5843138, 0, 1, 1,
0.7412586, 1.135777, 0.6402364, 0.5882353, 0, 1, 1,
0.7419866, 0.4847784, 0.4672359, 0.5960785, 0, 1, 1,
0.7423345, 0.918425, -0.002712741, 0.6039216, 0, 1, 1,
0.7428616, 0.7264154, 0.9713426, 0.6078432, 0, 1, 1,
0.7456104, -0.5002655, 0.7050849, 0.6156863, 0, 1, 1,
0.7460726, 1.131098, 0.4497175, 0.6196079, 0, 1, 1,
0.7490182, -1.319199, 2.249105, 0.627451, 0, 1, 1,
0.749186, 0.6471803, 1.677852, 0.6313726, 0, 1, 1,
0.7527215, -0.1343049, 2.176695, 0.6392157, 0, 1, 1,
0.7608325, 0.2678002, 1.597189, 0.6431373, 0, 1, 1,
0.7714174, -1.29618, 3.166324, 0.6509804, 0, 1, 1,
0.7786288, -1.056041, 1.086, 0.654902, 0, 1, 1,
0.7824138, -1.699167, 3.576077, 0.6627451, 0, 1, 1,
0.783585, 1.308265, 0.8604062, 0.6666667, 0, 1, 1,
0.7852647, -0.8948422, 0.4752686, 0.6745098, 0, 1, 1,
0.797447, 1.876511, 0.7928705, 0.6784314, 0, 1, 1,
0.7977242, -0.2223897, 3.34177, 0.6862745, 0, 1, 1,
0.7989363, 1.249002, 0.3224654, 0.6901961, 0, 1, 1,
0.8009319, 0.7656104, -0.1210973, 0.6980392, 0, 1, 1,
0.8011262, 0.09280197, 0.5287464, 0.7058824, 0, 1, 1,
0.8059882, 0.2951204, 1.568925, 0.7098039, 0, 1, 1,
0.8086337, -0.6325506, 2.851222, 0.7176471, 0, 1, 1,
0.8088212, 1.231785, 0.421645, 0.7215686, 0, 1, 1,
0.8131061, 0.6596209, 1.77859, 0.7294118, 0, 1, 1,
0.814024, -0.4445707, 3.966317, 0.7333333, 0, 1, 1,
0.8145592, 0.9955846, -0.5567204, 0.7411765, 0, 1, 1,
0.8146859, -0.3632829, 1.454429, 0.7450981, 0, 1, 1,
0.8170385, -0.1091832, 1.242592, 0.7529412, 0, 1, 1,
0.820121, -1.366191, 2.127113, 0.7568628, 0, 1, 1,
0.830668, 0.7495201, 0.4594114, 0.7647059, 0, 1, 1,
0.8408892, 0.7124607, 1.461516, 0.7686275, 0, 1, 1,
0.8425965, -0.5669087, 1.774324, 0.7764706, 0, 1, 1,
0.8500817, 0.7677587, 2.948302, 0.7803922, 0, 1, 1,
0.8558175, -0.468967, 2.134235, 0.7882353, 0, 1, 1,
0.858165, 1.409759, 0.5348161, 0.7921569, 0, 1, 1,
0.8686057, 3.297122e-05, 0.3334401, 0.8, 0, 1, 1,
0.874719, -0.4069526, 2.575238, 0.8078431, 0, 1, 1,
0.8755619, -1.202346, 2.661514, 0.8117647, 0, 1, 1,
0.8813458, -0.7673628, 1.240695, 0.8196079, 0, 1, 1,
0.8828376, 0.1488372, 1.419527, 0.8235294, 0, 1, 1,
0.8842624, 0.1477324, 2.062706, 0.8313726, 0, 1, 1,
0.8852639, 1.735042, 0.1458546, 0.8352941, 0, 1, 1,
0.885668, -1.078427, 2.283294, 0.8431373, 0, 1, 1,
0.890999, 0.06740566, 2.249734, 0.8470588, 0, 1, 1,
0.8968871, 0.01000015, 3.433038, 0.854902, 0, 1, 1,
0.9036208, -0.7922936, 1.186378, 0.8588235, 0, 1, 1,
0.903909, 1.159262, -0.6138191, 0.8666667, 0, 1, 1,
0.9080569, -0.8194246, 2.346607, 0.8705882, 0, 1, 1,
0.9080704, 1.111525, 0.4452, 0.8784314, 0, 1, 1,
0.9091243, -0.181153, 1.903837, 0.8823529, 0, 1, 1,
0.917244, -1.201178, 4.34108, 0.8901961, 0, 1, 1,
0.9217438, -0.3298962, 3.076238, 0.8941177, 0, 1, 1,
0.9261801, 1.161083, 1.700704, 0.9019608, 0, 1, 1,
0.9359416, -1.899376, 3.004106, 0.9098039, 0, 1, 1,
0.9363443, 0.3139687, 0.1680342, 0.9137255, 0, 1, 1,
0.9482469, -0.9960461, 1.660894, 0.9215686, 0, 1, 1,
0.9550324, -1.361244, 2.990786, 0.9254902, 0, 1, 1,
0.9635994, 0.4593937, 1.539167, 0.9333333, 0, 1, 1,
0.9709685, -1.081016, 0.728465, 0.9372549, 0, 1, 1,
0.9720398, 0.8716283, 1.777799, 0.945098, 0, 1, 1,
0.9818991, 0.8964764, 0.9732982, 0.9490196, 0, 1, 1,
0.9822124, 0.4561172, -0.3960377, 0.9568627, 0, 1, 1,
0.9836268, -1.206221, 2.998102, 0.9607843, 0, 1, 1,
0.9865263, -0.3764206, 0.7191826, 0.9686275, 0, 1, 1,
0.9967957, 0.5826448, 2.635147, 0.972549, 0, 1, 1,
0.9969617, 0.6877288, 0.3074458, 0.9803922, 0, 1, 1,
1.007404, 1.307132, 0.2848046, 0.9843137, 0, 1, 1,
1.009195, 0.2497132, -0.2268679, 0.9921569, 0, 1, 1,
1.012174, -0.6187735, 1.566633, 0.9960784, 0, 1, 1,
1.01622, -0.2416726, 2.311144, 1, 0, 0.9960784, 1,
1.020025, 0.3814927, 0.6733703, 1, 0, 0.9882353, 1,
1.022467, 0.2555248, 2.63109, 1, 0, 0.9843137, 1,
1.023113, 1.273547, 1.188199, 1, 0, 0.9764706, 1,
1.023372, 1.271827, 1.73483, 1, 0, 0.972549, 1,
1.024659, -0.7469156, 3.23081, 1, 0, 0.9647059, 1,
1.026397, 1.789615, -0.9269093, 1, 0, 0.9607843, 1,
1.028098, -0.192405, 2.492329, 1, 0, 0.9529412, 1,
1.033885, 0.7551359, 0.7554392, 1, 0, 0.9490196, 1,
1.041973, 0.4921362, 0.314816, 1, 0, 0.9411765, 1,
1.051737, 0.5938494, 1.400504, 1, 0, 0.9372549, 1,
1.058398, 1.962952, -1.452913, 1, 0, 0.9294118, 1,
1.067675, -0.7149956, 2.998617, 1, 0, 0.9254902, 1,
1.076581, -0.543721, 2.465961, 1, 0, 0.9176471, 1,
1.082327, 0.3529136, 0.451016, 1, 0, 0.9137255, 1,
1.084015, -0.09107266, 2.758432, 1, 0, 0.9058824, 1,
1.092355, -0.3886238, 0.2394823, 1, 0, 0.9019608, 1,
1.092487, -0.7188726, 2.421868, 1, 0, 0.8941177, 1,
1.096414, -1.78563, 1.331596, 1, 0, 0.8862745, 1,
1.101946, -1.420647, 3.772699, 1, 0, 0.8823529, 1,
1.110271, -1.49364, 2.78102, 1, 0, 0.8745098, 1,
1.118251, 0.4740388, 3.088571, 1, 0, 0.8705882, 1,
1.121428, -0.9284254, 3.451307, 1, 0, 0.8627451, 1,
1.12337, -0.6961194, 2.180142, 1, 0, 0.8588235, 1,
1.132885, 2.123996, 1.217699, 1, 0, 0.8509804, 1,
1.135321, 2.780131, 1.55161, 1, 0, 0.8470588, 1,
1.142456, -2.003016, 2.225586, 1, 0, 0.8392157, 1,
1.148292, 1.70927, 2.10567, 1, 0, 0.8352941, 1,
1.148463, -0.1920191, 3.255144, 1, 0, 0.827451, 1,
1.149664, 0.2963852, 1.200482, 1, 0, 0.8235294, 1,
1.152721, -0.526712, 1.824734, 1, 0, 0.8156863, 1,
1.15534, 2.030965, -1.621086, 1, 0, 0.8117647, 1,
1.156721, 0.3230604, 1.99077, 1, 0, 0.8039216, 1,
1.159641, -2.000926, 2.413656, 1, 0, 0.7960784, 1,
1.159848, -1.288653, 2.598804, 1, 0, 0.7921569, 1,
1.169523, 0.6666074, 1.66837, 1, 0, 0.7843137, 1,
1.172142, -0.353673, 2.665565, 1, 0, 0.7803922, 1,
1.172516, -0.04603694, 2.905385, 1, 0, 0.772549, 1,
1.175624, -1.511623, 1.87314, 1, 0, 0.7686275, 1,
1.199227, 1.279498, 1.931576, 1, 0, 0.7607843, 1,
1.201826, -0.003885243, 0.9077372, 1, 0, 0.7568628, 1,
1.202483, -0.2317335, 2.178675, 1, 0, 0.7490196, 1,
1.205124, 1.60541, 1.314517, 1, 0, 0.7450981, 1,
1.215921, -1.560448, 2.833437, 1, 0, 0.7372549, 1,
1.22612, -0.2558529, 3.893908, 1, 0, 0.7333333, 1,
1.231164, -0.7557015, 2.028567, 1, 0, 0.7254902, 1,
1.231893, 0.9658208, 1.333929, 1, 0, 0.7215686, 1,
1.23194, -0.04912926, 2.112591, 1, 0, 0.7137255, 1,
1.233744, -0.6445038, 0.4760804, 1, 0, 0.7098039, 1,
1.244347, -0.7524093, -0.7113454, 1, 0, 0.7019608, 1,
1.247038, 0.1850579, 3.326307, 1, 0, 0.6941177, 1,
1.247983, 0.4590492, 0.5976312, 1, 0, 0.6901961, 1,
1.256018, -0.2410824, 0.4904578, 1, 0, 0.682353, 1,
1.261582, 1.217103, 0.3414246, 1, 0, 0.6784314, 1,
1.267079, 1.727684, 1.661317, 1, 0, 0.6705883, 1,
1.283074, -0.2245703, 1.221259, 1, 0, 0.6666667, 1,
1.290329, 0.4546169, 2.373092, 1, 0, 0.6588235, 1,
1.291876, -0.7748039, -0.06143668, 1, 0, 0.654902, 1,
1.297953, 1.167776, 1.115612, 1, 0, 0.6470588, 1,
1.298676, -2.612704, 2.147441, 1, 0, 0.6431373, 1,
1.303465, -1.280641, 1.212709, 1, 0, 0.6352941, 1,
1.304281, 0.2898219, -0.2362663, 1, 0, 0.6313726, 1,
1.305343, -0.9825174, 2.079258, 1, 0, 0.6235294, 1,
1.306046, 0.2921466, 1.45089, 1, 0, 0.6196079, 1,
1.319789, 0.3540153, 1.766327, 1, 0, 0.6117647, 1,
1.32598, -0.2754412, 2.850427, 1, 0, 0.6078432, 1,
1.335729, 1.118359, 0.01406884, 1, 0, 0.6, 1,
1.339386, 0.374419, 0.8648085, 1, 0, 0.5921569, 1,
1.340907, 0.6021487, 1.25214, 1, 0, 0.5882353, 1,
1.347403, 2.224101, 2.659963, 1, 0, 0.5803922, 1,
1.347427, 0.2656125, 1.415712, 1, 0, 0.5764706, 1,
1.349385, -0.02731971, 1.712702, 1, 0, 0.5686275, 1,
1.358519, -0.08316248, 2.092078, 1, 0, 0.5647059, 1,
1.359797, -1.732619, 4.338371, 1, 0, 0.5568628, 1,
1.362838, -1.076045, 1.855176, 1, 0, 0.5529412, 1,
1.364994, -1.665866, 3.473253, 1, 0, 0.5450981, 1,
1.371001, -1.165599, 2.297826, 1, 0, 0.5411765, 1,
1.388721, -0.9468889, 2.603159, 1, 0, 0.5333334, 1,
1.388865, -0.1737347, 1.492918, 1, 0, 0.5294118, 1,
1.394644, -0.2498129, 2.116994, 1, 0, 0.5215687, 1,
1.404914, -0.3318466, 1.68225, 1, 0, 0.5176471, 1,
1.407885, 0.4166793, -1.521297, 1, 0, 0.509804, 1,
1.418506, -0.7440363, 2.35274, 1, 0, 0.5058824, 1,
1.419459, 0.949873, 0.2599213, 1, 0, 0.4980392, 1,
1.426919, 1.843244, 0.4256612, 1, 0, 0.4901961, 1,
1.427243, 0.4970937, 2.928125, 1, 0, 0.4862745, 1,
1.42859, 1.811802, -0.6093454, 1, 0, 0.4784314, 1,
1.430476, 1.040688, 1.230384, 1, 0, 0.4745098, 1,
1.431541, -0.08672115, 1.486259, 1, 0, 0.4666667, 1,
1.435149, -0.4079268, 3.610542, 1, 0, 0.4627451, 1,
1.437653, -1.940269, 2.048083, 1, 0, 0.454902, 1,
1.441618, 0.851922, 1.271763, 1, 0, 0.4509804, 1,
1.456034, -0.9585603, 2.828028, 1, 0, 0.4431373, 1,
1.457616, 0.8889874, -0.7487539, 1, 0, 0.4392157, 1,
1.461436, -0.8698379, 1.936769, 1, 0, 0.4313726, 1,
1.462512, -0.5055344, 2.749188, 1, 0, 0.427451, 1,
1.469293, -0.4044435, 3.460261, 1, 0, 0.4196078, 1,
1.474065, 0.6733742, 1.589926, 1, 0, 0.4156863, 1,
1.474726, 1.053549, 0.2802909, 1, 0, 0.4078431, 1,
1.478983, 0.8709174, -0.6022822, 1, 0, 0.4039216, 1,
1.482114, 0.4768995, 2.445285, 1, 0, 0.3960784, 1,
1.487909, 1.165854, 0.3171479, 1, 0, 0.3882353, 1,
1.495183, 0.139948, 2.060013, 1, 0, 0.3843137, 1,
1.496591, -1.530159, 2.320563, 1, 0, 0.3764706, 1,
1.524956, -0.6958239, 1.584339, 1, 0, 0.372549, 1,
1.537503, 1.370699, 0.7082936, 1, 0, 0.3647059, 1,
1.544651, -1.099429, 2.567305, 1, 0, 0.3607843, 1,
1.552604, -1.647308, 3.837039, 1, 0, 0.3529412, 1,
1.559298, 0.4597956, 1.345604, 1, 0, 0.3490196, 1,
1.561039, -1.531933, 1.144613, 1, 0, 0.3411765, 1,
1.564446, -1.128102, -1.223904, 1, 0, 0.3372549, 1,
1.578594, 0.1105451, 1.424289, 1, 0, 0.3294118, 1,
1.579138, -0.8674832, 1.407158, 1, 0, 0.3254902, 1,
1.59113, 0.7639465, 1.510141, 1, 0, 0.3176471, 1,
1.599603, -1.49311, 1.575936, 1, 0, 0.3137255, 1,
1.613837, -0.4981419, 3.419027, 1, 0, 0.3058824, 1,
1.616777, -2.336654, 3.579963, 1, 0, 0.2980392, 1,
1.64356, -1.16541, 1.415961, 1, 0, 0.2941177, 1,
1.643596, -0.9679903, 1.291361, 1, 0, 0.2862745, 1,
1.649228, 1.873247, 1.220483, 1, 0, 0.282353, 1,
1.652428, -1.519463, 0.6938443, 1, 0, 0.2745098, 1,
1.662024, -0.4920964, 2.245515, 1, 0, 0.2705882, 1,
1.670862, -1.419759, 1.807557, 1, 0, 0.2627451, 1,
1.671684, 1.216311, 0.6406189, 1, 0, 0.2588235, 1,
1.686627, 0.850961, 0.8756522, 1, 0, 0.2509804, 1,
1.705649, -0.5238516, 0.9122476, 1, 0, 0.2470588, 1,
1.708589, -1.573324, 1.45778, 1, 0, 0.2392157, 1,
1.711745, 0.07727885, -0.5911893, 1, 0, 0.2352941, 1,
1.730576, -1.027483, 1.365436, 1, 0, 0.227451, 1,
1.778259, 1.256335, 1.965091, 1, 0, 0.2235294, 1,
1.805827, -0.1822363, 0.698532, 1, 0, 0.2156863, 1,
1.843572, -1.762961, 1.621196, 1, 0, 0.2117647, 1,
1.846027, -1.475714, 2.192547, 1, 0, 0.2039216, 1,
1.847816, 1.206787, 0.2006192, 1, 0, 0.1960784, 1,
1.852838, 0.09898974, 1.831065, 1, 0, 0.1921569, 1,
1.871997, -0.0223719, 0.434734, 1, 0, 0.1843137, 1,
1.878287, -1.08685, 1.590003, 1, 0, 0.1803922, 1,
1.888492, -0.4969233, 1.278191, 1, 0, 0.172549, 1,
1.910441, 0.138041, 1.254626, 1, 0, 0.1686275, 1,
1.923074, 0.1079194, 2.885073, 1, 0, 0.1607843, 1,
1.933036, 0.2008575, 1.631028, 1, 0, 0.1568628, 1,
1.938016, 0.596168, 0.2820502, 1, 0, 0.1490196, 1,
1.950373, 1.114571, 1.759197, 1, 0, 0.145098, 1,
1.959785, -0.2116226, 2.077862, 1, 0, 0.1372549, 1,
1.975028, 0.4056607, 1.552711, 1, 0, 0.1333333, 1,
1.986125, -0.6491296, 3.233477, 1, 0, 0.1254902, 1,
2.011734, 1.001993, 1.80142, 1, 0, 0.1215686, 1,
2.01712, -0.4329565, 0.5864955, 1, 0, 0.1137255, 1,
2.02357, 0.004565252, 1.443408, 1, 0, 0.1098039, 1,
2.031046, -0.638984, 0.6220666, 1, 0, 0.1019608, 1,
2.080245, 0.8863069, 0.5756165, 1, 0, 0.09411765, 1,
2.086259, 1.861034, 0.4327287, 1, 0, 0.09019608, 1,
2.090702, -1.580256, 3.37467, 1, 0, 0.08235294, 1,
2.113839, -0.8222856, 2.28679, 1, 0, 0.07843138, 1,
2.183025, -0.6006492, 3.867987, 1, 0, 0.07058824, 1,
2.197161, -0.1381904, 2.048791, 1, 0, 0.06666667, 1,
2.22491, 1.354567, 0.2131886, 1, 0, 0.05882353, 1,
2.23406, -1.728433, 2.607936, 1, 0, 0.05490196, 1,
2.277529, 1.369418, 2.571869, 1, 0, 0.04705882, 1,
2.300434, 1.024179, 2.004318, 1, 0, 0.04313726, 1,
2.408859, -2.611013, 0.8451802, 1, 0, 0.03529412, 1,
2.451382, 0.9346014, 0.7081253, 1, 0, 0.03137255, 1,
2.565942, 0.7665702, 1.384763, 1, 0, 0.02352941, 1,
2.591044, 0.1624975, 2.235384, 1, 0, 0.01960784, 1,
2.648889, 0.5287219, 2.396858, 1, 0, 0.01176471, 1,
2.822619, 0.5912992, 2.209163, 1, 0, 0.007843138, 1
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
-0.2946614, -5.20383, -6.835474, 0, -0.5, 0.5, 0.5,
-0.2946614, -5.20383, -6.835474, 1, -0.5, 0.5, 0.5,
-0.2946614, -5.20383, -6.835474, 1, 1.5, 0.5, 0.5,
-0.2946614, -5.20383, -6.835474, 0, 1.5, 0.5, 0.5
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
-4.468699, -0.4414735, -6.835474, 0, -0.5, 0.5, 0.5,
-4.468699, -0.4414735, -6.835474, 1, -0.5, 0.5, 0.5,
-4.468699, -0.4414735, -6.835474, 1, 1.5, 0.5, 0.5,
-4.468699, -0.4414735, -6.835474, 0, 1.5, 0.5, 0.5
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
-4.468699, -5.20383, 0.05264425, 0, -0.5, 0.5, 0.5,
-4.468699, -5.20383, 0.05264425, 1, -0.5, 0.5, 0.5,
-4.468699, -5.20383, 0.05264425, 1, 1.5, 0.5, 0.5,
-4.468699, -5.20383, 0.05264425, 0, 1.5, 0.5, 0.5
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
-3, -4.104825, -5.245908,
2, -4.104825, -5.245908,
-3, -4.104825, -5.245908,
-3, -4.287992, -5.510836,
-2, -4.104825, -5.245908,
-2, -4.287992, -5.510836,
-1, -4.104825, -5.245908,
-1, -4.287992, -5.510836,
0, -4.104825, -5.245908,
0, -4.287992, -5.510836,
1, -4.104825, -5.245908,
1, -4.287992, -5.510836,
2, -4.104825, -5.245908,
2, -4.287992, -5.510836
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
"2"
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
-3, -4.654327, -6.040691, 0, -0.5, 0.5, 0.5,
-3, -4.654327, -6.040691, 1, -0.5, 0.5, 0.5,
-3, -4.654327, -6.040691, 1, 1.5, 0.5, 0.5,
-3, -4.654327, -6.040691, 0, 1.5, 0.5, 0.5,
-2, -4.654327, -6.040691, 0, -0.5, 0.5, 0.5,
-2, -4.654327, -6.040691, 1, -0.5, 0.5, 0.5,
-2, -4.654327, -6.040691, 1, 1.5, 0.5, 0.5,
-2, -4.654327, -6.040691, 0, 1.5, 0.5, 0.5,
-1, -4.654327, -6.040691, 0, -0.5, 0.5, 0.5,
-1, -4.654327, -6.040691, 1, -0.5, 0.5, 0.5,
-1, -4.654327, -6.040691, 1, 1.5, 0.5, 0.5,
-1, -4.654327, -6.040691, 0, 1.5, 0.5, 0.5,
0, -4.654327, -6.040691, 0, -0.5, 0.5, 0.5,
0, -4.654327, -6.040691, 1, -0.5, 0.5, 0.5,
0, -4.654327, -6.040691, 1, 1.5, 0.5, 0.5,
0, -4.654327, -6.040691, 0, 1.5, 0.5, 0.5,
1, -4.654327, -6.040691, 0, -0.5, 0.5, 0.5,
1, -4.654327, -6.040691, 1, -0.5, 0.5, 0.5,
1, -4.654327, -6.040691, 1, 1.5, 0.5, 0.5,
1, -4.654327, -6.040691, 0, 1.5, 0.5, 0.5,
2, -4.654327, -6.040691, 0, -0.5, 0.5, 0.5,
2, -4.654327, -6.040691, 1, -0.5, 0.5, 0.5,
2, -4.654327, -6.040691, 1, 1.5, 0.5, 0.5,
2, -4.654327, -6.040691, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.50546, -2, -5.245908,
-3.50546, 2, -5.245908,
-3.50546, -2, -5.245908,
-3.666, -2, -5.510836,
-3.50546, 0, -5.245908,
-3.666, 0, -5.510836,
-3.50546, 2, -5.245908,
-3.666, 2, -5.510836
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
"-2",
"0",
"2"
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
-3.98708, -2, -6.040691, 0, -0.5, 0.5, 0.5,
-3.98708, -2, -6.040691, 1, -0.5, 0.5, 0.5,
-3.98708, -2, -6.040691, 1, 1.5, 0.5, 0.5,
-3.98708, -2, -6.040691, 0, 1.5, 0.5, 0.5,
-3.98708, 0, -6.040691, 0, -0.5, 0.5, 0.5,
-3.98708, 0, -6.040691, 1, -0.5, 0.5, 0.5,
-3.98708, 0, -6.040691, 1, 1.5, 0.5, 0.5,
-3.98708, 0, -6.040691, 0, 1.5, 0.5, 0.5,
-3.98708, 2, -6.040691, 0, -0.5, 0.5, 0.5,
-3.98708, 2, -6.040691, 1, -0.5, 0.5, 0.5,
-3.98708, 2, -6.040691, 1, 1.5, 0.5, 0.5,
-3.98708, 2, -6.040691, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.50546, -4.104825, -4,
-3.50546, -4.104825, 4,
-3.50546, -4.104825, -4,
-3.666, -4.287992, -4,
-3.50546, -4.104825, -2,
-3.666, -4.287992, -2,
-3.50546, -4.104825, 0,
-3.666, -4.287992, 0,
-3.50546, -4.104825, 2,
-3.666, -4.287992, 2,
-3.50546, -4.104825, 4,
-3.666, -4.287992, 4
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
-3.98708, -4.654327, -4, 0, -0.5, 0.5, 0.5,
-3.98708, -4.654327, -4, 1, -0.5, 0.5, 0.5,
-3.98708, -4.654327, -4, 1, 1.5, 0.5, 0.5,
-3.98708, -4.654327, -4, 0, 1.5, 0.5, 0.5,
-3.98708, -4.654327, -2, 0, -0.5, 0.5, 0.5,
-3.98708, -4.654327, -2, 1, -0.5, 0.5, 0.5,
-3.98708, -4.654327, -2, 1, 1.5, 0.5, 0.5,
-3.98708, -4.654327, -2, 0, 1.5, 0.5, 0.5,
-3.98708, -4.654327, 0, 0, -0.5, 0.5, 0.5,
-3.98708, -4.654327, 0, 1, -0.5, 0.5, 0.5,
-3.98708, -4.654327, 0, 1, 1.5, 0.5, 0.5,
-3.98708, -4.654327, 0, 0, 1.5, 0.5, 0.5,
-3.98708, -4.654327, 2, 0, -0.5, 0.5, 0.5,
-3.98708, -4.654327, 2, 1, -0.5, 0.5, 0.5,
-3.98708, -4.654327, 2, 1, 1.5, 0.5, 0.5,
-3.98708, -4.654327, 2, 0, 1.5, 0.5, 0.5,
-3.98708, -4.654327, 4, 0, -0.5, 0.5, 0.5,
-3.98708, -4.654327, 4, 1, -0.5, 0.5, 0.5,
-3.98708, -4.654327, 4, 1, 1.5, 0.5, 0.5,
-3.98708, -4.654327, 4, 0, 1.5, 0.5, 0.5
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
-3.50546, -4.104825, -5.245908,
-3.50546, 3.221877, -5.245908,
-3.50546, -4.104825, 5.351197,
-3.50546, 3.221877, 5.351197,
-3.50546, -4.104825, -5.245908,
-3.50546, -4.104825, 5.351197,
-3.50546, 3.221877, -5.245908,
-3.50546, 3.221877, 5.351197,
-3.50546, -4.104825, -5.245908,
2.916137, -4.104825, -5.245908,
-3.50546, -4.104825, 5.351197,
2.916137, -4.104825, 5.351197,
-3.50546, 3.221877, -5.245908,
2.916137, 3.221877, -5.245908,
-3.50546, 3.221877, 5.351197,
2.916137, 3.221877, 5.351197,
2.916137, -4.104825, -5.245908,
2.916137, 3.221877, -5.245908,
2.916137, -4.104825, 5.351197,
2.916137, 3.221877, 5.351197,
2.916137, -4.104825, -5.245908,
2.916137, -4.104825, 5.351197,
2.916137, 3.221877, -5.245908,
2.916137, 3.221877, 5.351197
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
var radius = 7.686652;
var distance = 34.19878;
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
mvMatrix.translate( 0.2946614, 0.4414735, -0.05264425 );
mvMatrix.scale( 1.29422, 1.134338, 0.7842669 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19878);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Phenothrin<-read.table("Phenothrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
```

```r
y<-Phenothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
```

```r
z<-Phenothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenothrin' not found
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
-3.411942, 0.1992161, -0.4608788, 0, 0, 1, 1, 1,
-2.909009, 1.136377, -1.45458, 1, 0, 0, 1, 1,
-2.671955, -0.6497813, -0.9221697, 1, 0, 0, 1, 1,
-2.646307, 1.550688, -0.3149767, 1, 0, 0, 1, 1,
-2.616621, -0.6963674, -0.9538284, 1, 0, 0, 1, 1,
-2.545358, 0.3256699, -1.0809, 1, 0, 0, 1, 1,
-2.527127, 1.071425, -0.08005577, 0, 0, 0, 1, 1,
-2.5098, -0.06051438, -1.604704, 0, 0, 0, 1, 1,
-2.476602, -1.149559, -1.294311, 0, 0, 0, 1, 1,
-2.471545, -0.6191126, -3.271981, 0, 0, 0, 1, 1,
-2.428374, -0.2843134, -1.522473, 0, 0, 0, 1, 1,
-2.333628, -0.6694949, -1.641122, 0, 0, 0, 1, 1,
-2.333553, 1.389441, -0.398179, 0, 0, 0, 1, 1,
-2.26368, -0.5103239, 0.07024056, 1, 1, 1, 1, 1,
-2.198725, 0.1119704, -1.500938, 1, 1, 1, 1, 1,
-2.170257, -0.1055007, -2.262009, 1, 1, 1, 1, 1,
-2.154047, 0.2902229, -1.613595, 1, 1, 1, 1, 1,
-2.112732, 0.01817778, -1.41762, 1, 1, 1, 1, 1,
-2.106026, 0.7913675, -1.8473, 1, 1, 1, 1, 1,
-2.089015, -0.80507, -2.660755, 1, 1, 1, 1, 1,
-2.059526, 0.1117981, -2.35296, 1, 1, 1, 1, 1,
-2.058882, -0.8696827, -1.470595, 1, 1, 1, 1, 1,
-2.03963, 0.05804791, -2.028482, 1, 1, 1, 1, 1,
-2.022125, 0.1908812, -0.4374034, 1, 1, 1, 1, 1,
-2.01065, -0.9106273, -0.6346937, 1, 1, 1, 1, 1,
-2.003206, -0.251099, -1.287589, 1, 1, 1, 1, 1,
-1.976977, 0.3017184, -0.8181589, 1, 1, 1, 1, 1,
-1.969098, -0.712921, -3.404555, 1, 1, 1, 1, 1,
-1.923418, 0.9721081, -0.931913, 0, 0, 1, 1, 1,
-1.918661, 0.7056521, -1.066291, 1, 0, 0, 1, 1,
-1.89093, 0.0244807, -0.8913735, 1, 0, 0, 1, 1,
-1.865915, -0.5114738, -3.647993, 1, 0, 0, 1, 1,
-1.861741, 0.5955287, -3.034372, 1, 0, 0, 1, 1,
-1.854511, -0.7562795, -2.281329, 1, 0, 0, 1, 1,
-1.835974, 0.0281934, -0.9708387, 0, 0, 0, 1, 1,
-1.833268, -1.817876, -3.301744, 0, 0, 0, 1, 1,
-1.831423, -0.7479328, -1.40674, 0, 0, 0, 1, 1,
-1.821918, -0.9348739, -3.703713, 0, 0, 0, 1, 1,
-1.820994, 2.118153, 0.1042919, 0, 0, 0, 1, 1,
-1.783793, -2.465321, -2.277759, 0, 0, 0, 1, 1,
-1.783372, 1.043715, -1.633454, 0, 0, 0, 1, 1,
-1.776221, -0.8316307, -2.296462, 1, 1, 1, 1, 1,
-1.751822, -0.8183283, -2.504055, 1, 1, 1, 1, 1,
-1.705079, 0.2558391, -0.4988383, 1, 1, 1, 1, 1,
-1.698434, -0.3595119, -2.386954, 1, 1, 1, 1, 1,
-1.688018, -1.57386, -4.314239, 1, 1, 1, 1, 1,
-1.662889, 0.07496614, -3.151829, 1, 1, 1, 1, 1,
-1.661068, 1.759889, -0.4352447, 1, 1, 1, 1, 1,
-1.651012, 0.3282997, 0.3143318, 1, 1, 1, 1, 1,
-1.642526, -0.8023885, -1.414237, 1, 1, 1, 1, 1,
-1.642032, 1.533052, 0.684705, 1, 1, 1, 1, 1,
-1.637719, 1.39041, -0.9556127, 1, 1, 1, 1, 1,
-1.613629, 1.06471, -0.7288854, 1, 1, 1, 1, 1,
-1.604644, -0.4239033, -0.9003295, 1, 1, 1, 1, 1,
-1.588978, 1.021903, 1.280215, 1, 1, 1, 1, 1,
-1.575536, -1.078697, -2.687052, 1, 1, 1, 1, 1,
-1.570259, 0.4335089, -3.273852, 0, 0, 1, 1, 1,
-1.550213, -0.1174154, -1.406641, 1, 0, 0, 1, 1,
-1.54901, -1.194945, -1.070736, 1, 0, 0, 1, 1,
-1.538074, 0.607556, -2.523235, 1, 0, 0, 1, 1,
-1.527584, 1.715423, -0.810779, 1, 0, 0, 1, 1,
-1.522548, 0.4083121, -0.1612376, 1, 0, 0, 1, 1,
-1.520969, -1.169499, -0.5971803, 0, 0, 0, 1, 1,
-1.518599, -0.9106084, -3.135337, 0, 0, 0, 1, 1,
-1.518276, -0.96467, -1.729129, 0, 0, 0, 1, 1,
-1.514138, -0.7877443, -3.018702, 0, 0, 0, 1, 1,
-1.508477, 1.018824, -0.5590808, 0, 0, 0, 1, 1,
-1.495818, -1.430708, -0.3748049, 0, 0, 0, 1, 1,
-1.494581, 1.134176, -2.77985, 0, 0, 0, 1, 1,
-1.491901, 1.21797, -1.414592, 1, 1, 1, 1, 1,
-1.491338, 0.9423996, -0.9232115, 1, 1, 1, 1, 1,
-1.491299, 0.4180825, -1.647838, 1, 1, 1, 1, 1,
-1.485621, 0.8242187, -1.046101, 1, 1, 1, 1, 1,
-1.482849, 0.3749284, -1.341341, 1, 1, 1, 1, 1,
-1.470116, 0.2476449, -1.157327, 1, 1, 1, 1, 1,
-1.463155, 0.67258, -1.773789, 1, 1, 1, 1, 1,
-1.460519, 0.9824174, -1.099854, 1, 1, 1, 1, 1,
-1.458173, -0.1051509, -1.784924, 1, 1, 1, 1, 1,
-1.448801, -1.38289, -1.729516, 1, 1, 1, 1, 1,
-1.448696, 0.5473613, 0.382583, 1, 1, 1, 1, 1,
-1.446017, 0.9462325, 0.1401718, 1, 1, 1, 1, 1,
-1.445415, 0.8087032, -0.8509926, 1, 1, 1, 1, 1,
-1.432659, 0.8071028, -1.173613, 1, 1, 1, 1, 1,
-1.420156, -0.5994059, -2.646526, 1, 1, 1, 1, 1,
-1.402764, 2.25078, -0.8968227, 0, 0, 1, 1, 1,
-1.392234, -0.3052791, -3.00084, 1, 0, 0, 1, 1,
-1.38509, -1.926421, -1.571731, 1, 0, 0, 1, 1,
-1.373049, -0.7207912, -1.283137, 1, 0, 0, 1, 1,
-1.367035, 0.006472758, -1.313107, 1, 0, 0, 1, 1,
-1.365016, -0.2325509, -0.1241049, 1, 0, 0, 1, 1,
-1.336833, 1.123263, 0.3102761, 0, 0, 0, 1, 1,
-1.335579, 0.2041571, -2.18787, 0, 0, 0, 1, 1,
-1.317929, 0.5103559, -2.63958, 0, 0, 0, 1, 1,
-1.307767, 0.02842959, -0.802283, 0, 0, 0, 1, 1,
-1.303534, -0.867866, -2.442621, 0, 0, 0, 1, 1,
-1.299576, -0.03085448, -1.44609, 0, 0, 0, 1, 1,
-1.294211, 0.900798, -1.702971, 0, 0, 0, 1, 1,
-1.29289, 0.05325793, -0.9289258, 1, 1, 1, 1, 1,
-1.286867, -0.1805484, -1.505971, 1, 1, 1, 1, 1,
-1.283633, 0.3201594, -0.6632096, 1, 1, 1, 1, 1,
-1.272737, 0.8234937, 0.1036333, 1, 1, 1, 1, 1,
-1.271723, 0.7400107, 0.1414998, 1, 1, 1, 1, 1,
-1.26941, -0.2576914, -2.397976, 1, 1, 1, 1, 1,
-1.262183, 1.37075, -2.811823, 1, 1, 1, 1, 1,
-1.256057, -0.1591914, -0.713995, 1, 1, 1, 1, 1,
-1.253288, -0.6938272, -2.187728, 1, 1, 1, 1, 1,
-1.244791, -1.85101, -2.702479, 1, 1, 1, 1, 1,
-1.240926, -1.998787, -1.526572, 1, 1, 1, 1, 1,
-1.240542, 0.8333418, -0.9563238, 1, 1, 1, 1, 1,
-1.23205, -0.3016685, -1.38555, 1, 1, 1, 1, 1,
-1.226855, 0.8585362, -0.4592418, 1, 1, 1, 1, 1,
-1.221871, 0.9665813, 0.8294846, 1, 1, 1, 1, 1,
-1.221368, 0.8147793, 0.7332611, 0, 0, 1, 1, 1,
-1.196406, 0.938657, -0.8171102, 1, 0, 0, 1, 1,
-1.193636, 0.5736262, -0.7784886, 1, 0, 0, 1, 1,
-1.190261, 0.3925902, 1.182391, 1, 0, 0, 1, 1,
-1.189584, -0.8802176, -4.553855, 1, 0, 0, 1, 1,
-1.18388, -1.156104, -3.093869, 1, 0, 0, 1, 1,
-1.177284, -1.075282, -0.4610685, 0, 0, 0, 1, 1,
-1.175105, 1.316394, -0.7687339, 0, 0, 0, 1, 1,
-1.17414, -0.02989849, -1.480421, 0, 0, 0, 1, 1,
-1.171369, -1.838421, -2.390354, 0, 0, 0, 1, 1,
-1.168749, 1.25078, -0.5879864, 0, 0, 0, 1, 1,
-1.168021, 0.3971297, -0.3989839, 0, 0, 0, 1, 1,
-1.167604, -0.3964092, -1.991408, 0, 0, 0, 1, 1,
-1.165183, 1.708262, 1.144758, 1, 1, 1, 1, 1,
-1.163402, 0.9357098, -2.650645, 1, 1, 1, 1, 1,
-1.153578, 0.2880726, 0.3896927, 1, 1, 1, 1, 1,
-1.153146, -1.196395, -0.5205933, 1, 1, 1, 1, 1,
-1.150328, -1.595993, -2.805734, 1, 1, 1, 1, 1,
-1.144855, -0.3417878, -2.256089, 1, 1, 1, 1, 1,
-1.142759, -1.180782, -2.095196, 1, 1, 1, 1, 1,
-1.137182, -0.9279416, -3.413042, 1, 1, 1, 1, 1,
-1.136485, 0.4136773, -1.29322, 1, 1, 1, 1, 1,
-1.123869, 0.7737738, 0.6743451, 1, 1, 1, 1, 1,
-1.117802, -1.660628, -1.324127, 1, 1, 1, 1, 1,
-1.113913, -0.7347465, -0.7649475, 1, 1, 1, 1, 1,
-1.10879, -0.7730601, -1.311608, 1, 1, 1, 1, 1,
-1.105587, 0.5838355, -1.515346, 1, 1, 1, 1, 1,
-1.104792, 0.104384, -2.194358, 1, 1, 1, 1, 1,
-1.102791, -1.460613, -3.374762, 0, 0, 1, 1, 1,
-1.092018, -0.3007756, -0.7641932, 1, 0, 0, 1, 1,
-1.091147, -0.5002028, 0.8708802, 1, 0, 0, 1, 1,
-1.090655, 0.5585934, -0.7524579, 1, 0, 0, 1, 1,
-1.086436, -1.094571, -3.036768, 1, 0, 0, 1, 1,
-1.085461, -0.7046338, -3.059293, 1, 0, 0, 1, 1,
-1.083438, 0.04278221, -0.8874961, 0, 0, 0, 1, 1,
-1.073796, -0.2515387, -2.006094, 0, 0, 0, 1, 1,
-1.061856, -0.8017216, -0.5415107, 0, 0, 0, 1, 1,
-1.059739, -1.231841, -3.49836, 0, 0, 0, 1, 1,
-1.055358, 0.7290817, -0.05029324, 0, 0, 0, 1, 1,
-1.055051, -1.215313, -1.117992, 0, 0, 0, 1, 1,
-1.052506, -2.214978, -2.064469, 0, 0, 0, 1, 1,
-1.046139, 0.577685, -1.561159, 1, 1, 1, 1, 1,
-1.043816, 0.7052147, -1.507375, 1, 1, 1, 1, 1,
-1.039973, 0.6615388, -2.513811, 1, 1, 1, 1, 1,
-1.026718, 0.9418165, -0.4573494, 1, 1, 1, 1, 1,
-1.020183, -0.4831827, -1.528014, 1, 1, 1, 1, 1,
-1.015328, -1.566714, -3.719135, 1, 1, 1, 1, 1,
-1.012989, -2.537488, -2.792829, 1, 1, 1, 1, 1,
-1.00795, 1.105783, -0.5238366, 1, 1, 1, 1, 1,
-1.00767, -0.1169037, -1.728241, 1, 1, 1, 1, 1,
-1.00251, -1.051299, -1.548103, 1, 1, 1, 1, 1,
-1.001998, 0.1587126, -2.955719, 1, 1, 1, 1, 1,
-1.000967, -0.405414, -2.647445, 1, 1, 1, 1, 1,
-0.998094, -2.236711, -1.286104, 1, 1, 1, 1, 1,
-0.9969974, 0.0672278, -0.5826199, 1, 1, 1, 1, 1,
-0.9963835, 0.06391147, -2.539832, 1, 1, 1, 1, 1,
-0.9897175, 0.3721253, -0.1288247, 0, 0, 1, 1, 1,
-0.9810405, -0.3531646, -1.798371, 1, 0, 0, 1, 1,
-0.9627702, -0.9840812, -5.037647, 1, 0, 0, 1, 1,
-0.9587, -0.277436, -4.468263, 1, 0, 0, 1, 1,
-0.958485, 0.2895518, -1.769099, 1, 0, 0, 1, 1,
-0.9537784, -0.9568737, -0.1003741, 1, 0, 0, 1, 1,
-0.9491634, -2.445904, -3.332494, 0, 0, 0, 1, 1,
-0.9462771, 1.578559, -0.5070094, 0, 0, 0, 1, 1,
-0.9437549, -0.8120611, -1.990604, 0, 0, 0, 1, 1,
-0.9391657, 2.011431, -1.615006, 0, 0, 0, 1, 1,
-0.9362491, -1.55328, -2.291823, 0, 0, 0, 1, 1,
-0.9350316, -1.415962, -1.408418, 0, 0, 0, 1, 1,
-0.9311236, -0.07971578, 1.016966, 0, 0, 0, 1, 1,
-0.9270207, 0.1704571, -2.035131, 1, 1, 1, 1, 1,
-0.9260286, 0.4283, -0.3178797, 1, 1, 1, 1, 1,
-0.9253815, -1.383693, -2.434376, 1, 1, 1, 1, 1,
-0.9208099, -0.6891353, -2.208642, 1, 1, 1, 1, 1,
-0.9168893, -0.8854312, -2.840652, 1, 1, 1, 1, 1,
-0.9151151, 1.413643, 0.6861386, 1, 1, 1, 1, 1,
-0.9109546, 0.04415512, -0.7256508, 1, 1, 1, 1, 1,
-0.9108117, -0.5298547, -2.083742, 1, 1, 1, 1, 1,
-0.9050459, 0.1717197, -1.591707, 1, 1, 1, 1, 1,
-0.9033645, -0.6443443, -3.24719, 1, 1, 1, 1, 1,
-0.9028075, 2.401264, -1.658417, 1, 1, 1, 1, 1,
-0.8980699, -0.1691352, -0.3186724, 1, 1, 1, 1, 1,
-0.8969951, -0.05266207, -0.4289312, 1, 1, 1, 1, 1,
-0.8957922, 0.2513135, -1.024526, 1, 1, 1, 1, 1,
-0.8951203, 0.8625016, -0.2508373, 1, 1, 1, 1, 1,
-0.8947884, -1.06616, -3.105851, 0, 0, 1, 1, 1,
-0.8943983, -1.232922, -2.107637, 1, 0, 0, 1, 1,
-0.894035, -1.197408, -1.055465, 1, 0, 0, 1, 1,
-0.8877674, 3.115178, -0.3718971, 1, 0, 0, 1, 1,
-0.8859934, -0.3898337, -2.085521, 1, 0, 0, 1, 1,
-0.8829526, 1.841637, -1.245369, 1, 0, 0, 1, 1,
-0.8600798, -2.322534, -2.794132, 0, 0, 0, 1, 1,
-0.8577684, -2.178198, -3.769616, 0, 0, 0, 1, 1,
-0.8521772, 0.5520431, 1.395796, 0, 0, 0, 1, 1,
-0.8521035, -0.4242815, -1.459532, 0, 0, 0, 1, 1,
-0.8515884, 0.2951641, -2.564762, 0, 0, 0, 1, 1,
-0.8471768, -0.1969426, -1.817911, 0, 0, 0, 1, 1,
-0.8433707, -0.8669576, -1.543824, 0, 0, 0, 1, 1,
-0.8377168, 0.7420381, -1.570167, 1, 1, 1, 1, 1,
-0.8240839, 0.4981945, -0.8739252, 1, 1, 1, 1, 1,
-0.8081495, -0.4808626, -3.10132, 1, 1, 1, 1, 1,
-0.8050084, -1.29831, -3.445594, 1, 1, 1, 1, 1,
-0.8022242, -0.7246929, -2.663064, 1, 1, 1, 1, 1,
-0.7990924, 0.4844523, -1.797984, 1, 1, 1, 1, 1,
-0.7977788, -0.2426867, -2.658318, 1, 1, 1, 1, 1,
-0.7976792, 0.2566626, -0.8993025, 1, 1, 1, 1, 1,
-0.7954804, -0.7386841, -0.05258375, 1, 1, 1, 1, 1,
-0.7848093, -0.01243985, -2.583583, 1, 1, 1, 1, 1,
-0.7761686, -0.7324548, -2.686529, 1, 1, 1, 1, 1,
-0.7741143, 0.1939168, -1.537063, 1, 1, 1, 1, 1,
-0.76773, -1.304321, -2.720251, 1, 1, 1, 1, 1,
-0.766535, -0.8739126, -2.572337, 1, 1, 1, 1, 1,
-0.7638688, 0.4636984, -0.8285294, 1, 1, 1, 1, 1,
-0.7638667, -0.3805348, -1.240158, 0, 0, 1, 1, 1,
-0.7601174, -0.02917163, -2.808425, 1, 0, 0, 1, 1,
-0.7559975, 1.743687, -1.368778, 1, 0, 0, 1, 1,
-0.7557341, -0.4143934, -3.76903, 1, 0, 0, 1, 1,
-0.7536979, -0.7186457, -2.552383, 1, 0, 0, 1, 1,
-0.7498133, -2.053498, -2.649002, 1, 0, 0, 1, 1,
-0.7495202, -1.451517, -3.164231, 0, 0, 0, 1, 1,
-0.7408762, 0.2919424, -0.8476207, 0, 0, 0, 1, 1,
-0.7381672, -0.5840873, -3.75426, 0, 0, 0, 1, 1,
-0.7375519, -0.7502854, -3.193054, 0, 0, 0, 1, 1,
-0.7364387, 1.191579, -1.028637, 0, 0, 0, 1, 1,
-0.7313133, -1.534007, -3.127004, 0, 0, 0, 1, 1,
-0.7289455, 0.2193718, -0.06500949, 0, 0, 0, 1, 1,
-0.7268304, -0.505988, -3.262304, 1, 1, 1, 1, 1,
-0.722394, -0.429476, -2.149192, 1, 1, 1, 1, 1,
-0.7211884, 0.06623865, -1.780623, 1, 1, 1, 1, 1,
-0.7211262, 3.036794, -1.469543, 1, 1, 1, 1, 1,
-0.7167357, -3.998125, -1.95623, 1, 1, 1, 1, 1,
-0.7133271, -1.976972, -3.403798, 1, 1, 1, 1, 1,
-0.7104809, 0.8146603, -2.266862, 1, 1, 1, 1, 1,
-0.706319, 0.7921354, -0.7582282, 1, 1, 1, 1, 1,
-0.7018396, 0.4682781, -1.166461, 1, 1, 1, 1, 1,
-0.6812548, -0.6367257, -2.829187, 1, 1, 1, 1, 1,
-0.6811424, 1.262613, -0.4747678, 1, 1, 1, 1, 1,
-0.6727382, 0.1574973, -1.915147, 1, 1, 1, 1, 1,
-0.6720111, -0.7112759, -1.109531, 1, 1, 1, 1, 1,
-0.6700338, -0.05863613, -3.143275, 1, 1, 1, 1, 1,
-0.6663698, -2.242891, -1.767787, 1, 1, 1, 1, 1,
-0.6555393, -1.297598, -2.945116, 0, 0, 1, 1, 1,
-0.648867, 1.335421, 0.4283928, 1, 0, 0, 1, 1,
-0.645048, 0.738016, -0.3091082, 1, 0, 0, 1, 1,
-0.6392707, -1.106301, -2.277017, 1, 0, 0, 1, 1,
-0.637998, -0.5293815, -2.925336, 1, 0, 0, 1, 1,
-0.6372236, -0.09995864, -1.053016, 1, 0, 0, 1, 1,
-0.6345063, 0.04243092, -0.1875847, 0, 0, 0, 1, 1,
-0.6303462, 0.5262313, -0.3693588, 0, 0, 0, 1, 1,
-0.6195753, -0.03986115, -1.060325, 0, 0, 0, 1, 1,
-0.6130823, 0.4847835, -1.14367, 0, 0, 0, 1, 1,
-0.6079785, 0.4586023, -3.230423, 0, 0, 0, 1, 1,
-0.6039366, -0.4399313, -3.359577, 0, 0, 0, 1, 1,
-0.5934173, -1.419571, -2.356046, 0, 0, 0, 1, 1,
-0.5929342, -0.03188339, -1.948997, 1, 1, 1, 1, 1,
-0.592826, 1.073158, -1.027813, 1, 1, 1, 1, 1,
-0.5862419, -1.647729, -2.500282, 1, 1, 1, 1, 1,
-0.5862039, -1.997365, -2.445979, 1, 1, 1, 1, 1,
-0.5819526, 1.049707, 1.058047, 1, 1, 1, 1, 1,
-0.5673885, 0.9599846, -1.145835, 1, 1, 1, 1, 1,
-0.5655334, -0.6113063, -2.360736, 1, 1, 1, 1, 1,
-0.5638319, 1.090159, -0.4703345, 1, 1, 1, 1, 1,
-0.5637423, -0.772019, -1.702798, 1, 1, 1, 1, 1,
-0.5584682, 0.5894611, 0.08592353, 1, 1, 1, 1, 1,
-0.5577929, 0.1134195, -0.7922743, 1, 1, 1, 1, 1,
-0.5551193, -0.07327301, -1.173325, 1, 1, 1, 1, 1,
-0.5514559, -0.3135823, -1.275775, 1, 1, 1, 1, 1,
-0.5491526, 1.876001, -1.33425, 1, 1, 1, 1, 1,
-0.5402564, -0.4639381, -4.281882, 1, 1, 1, 1, 1,
-0.5392417, -0.2193661, -0.3288194, 0, 0, 1, 1, 1,
-0.5353769, -0.4278043, -2.818443, 1, 0, 0, 1, 1,
-0.5332747, -0.492219, -1.000884, 1, 0, 0, 1, 1,
-0.5331774, 0.008437898, -3.226779, 1, 0, 0, 1, 1,
-0.5297969, 0.1415931, -0.3436661, 1, 0, 0, 1, 1,
-0.5289335, 0.1695309, -1.048512, 1, 0, 0, 1, 1,
-0.5273035, -1.194094, -2.64221, 0, 0, 0, 1, 1,
-0.5249822, -0.6676198, -2.398368, 0, 0, 0, 1, 1,
-0.5243784, 0.4118035, -2.779245, 0, 0, 0, 1, 1,
-0.5207514, -1.194496, -1.134621, 0, 0, 0, 1, 1,
-0.5163181, 0.8817808, 0.2041297, 0, 0, 0, 1, 1,
-0.5160037, 0.8380319, -1.334353, 0, 0, 0, 1, 1,
-0.5155124, 0.2799897, -0.5911369, 0, 0, 0, 1, 1,
-0.5106118, 0.4418441, 0.05287334, 1, 1, 1, 1, 1,
-0.5056802, 0.1575142, -0.1773409, 1, 1, 1, 1, 1,
-0.5051284, 1.33765, -0.6907974, 1, 1, 1, 1, 1,
-0.5041618, -0.8349931, -2.374926, 1, 1, 1, 1, 1,
-0.5040592, -0.5924985, -3.853714, 1, 1, 1, 1, 1,
-0.5026903, -0.1331744, -2.978473, 1, 1, 1, 1, 1,
-0.5010737, 1.051734, -0.3627689, 1, 1, 1, 1, 1,
-0.4991866, -0.6110266, -3.277325, 1, 1, 1, 1, 1,
-0.4958401, 0.1613182, -1.349997, 1, 1, 1, 1, 1,
-0.4958161, -0.3929711, -4.236479, 1, 1, 1, 1, 1,
-0.4900545, -2.133454, -1.277934, 1, 1, 1, 1, 1,
-0.4869384, -0.287214, -2.118236, 1, 1, 1, 1, 1,
-0.4860973, 0.6987367, 1.701027, 1, 1, 1, 1, 1,
-0.484901, -0.1866084, -3.123174, 1, 1, 1, 1, 1,
-0.4817642, 1.971992, -0.4493065, 1, 1, 1, 1, 1,
-0.4808812, -0.4838824, -1.714373, 0, 0, 1, 1, 1,
-0.4774721, -1.641245, -3.238204, 1, 0, 0, 1, 1,
-0.4694815, 0.05954144, -0.8544202, 1, 0, 0, 1, 1,
-0.4675971, 0.136039, 0.1974862, 1, 0, 0, 1, 1,
-0.4668311, -0.9827269, -4.607276, 1, 0, 0, 1, 1,
-0.4666456, -0.7832893, -1.447094, 1, 0, 0, 1, 1,
-0.465835, 2.123762, 0.8063364, 0, 0, 0, 1, 1,
-0.465102, -0.2128238, -1.371921, 0, 0, 0, 1, 1,
-0.462947, 0.49696, -0.1257239, 0, 0, 0, 1, 1,
-0.4563314, 0.2964284, -0.9225473, 0, 0, 0, 1, 1,
-0.4549868, 0.6912679, -0.9362314, 0, 0, 0, 1, 1,
-0.4530249, -1.371988, -2.86647, 0, 0, 0, 1, 1,
-0.4526457, -1.343895, -2.037442, 0, 0, 0, 1, 1,
-0.4440534, 0.9974692, 1.584684, 1, 1, 1, 1, 1,
-0.4439387, 0.8643402, 0.8466662, 1, 1, 1, 1, 1,
-0.4438819, -1.046008, -1.89327, 1, 1, 1, 1, 1,
-0.4320627, -0.9539243, -2.412191, 1, 1, 1, 1, 1,
-0.4256785, -1.226453, -2.106338, 1, 1, 1, 1, 1,
-0.4171108, 0.7783902, 0.2424487, 1, 1, 1, 1, 1,
-0.4157892, -0.6058276, -3.025376, 1, 1, 1, 1, 1,
-0.4113787, 0.5776695, -2.671586, 1, 1, 1, 1, 1,
-0.409123, -0.2722451, -3.452195, 1, 1, 1, 1, 1,
-0.4087675, -0.08256624, -3.016741, 1, 1, 1, 1, 1,
-0.4047226, -0.2777522, -1.194032, 1, 1, 1, 1, 1,
-0.3992053, -0.1193854, -2.495809, 1, 1, 1, 1, 1,
-0.3964832, -2.730278, -2.977529, 1, 1, 1, 1, 1,
-0.3964686, 0.532078, -1.919921, 1, 1, 1, 1, 1,
-0.3927746, -1.724188, -3.592981, 1, 1, 1, 1, 1,
-0.3875555, -0.5784804, -2.585468, 0, 0, 1, 1, 1,
-0.3863842, -0.6140097, -2.832463, 1, 0, 0, 1, 1,
-0.3847107, -1.104994, -3.895687, 1, 0, 0, 1, 1,
-0.384571, 1.368486, 0.4277643, 1, 0, 0, 1, 1,
-0.3842752, -0.3750617, -2.771954, 1, 0, 0, 1, 1,
-0.3828189, 2.003, -0.001428815, 1, 0, 0, 1, 1,
-0.3813086, -1.280968, -4.998402, 0, 0, 0, 1, 1,
-0.3806212, -0.3827502, -4.135602, 0, 0, 0, 1, 1,
-0.3777816, 2.17261, 0.7310182, 0, 0, 0, 1, 1,
-0.3759316, 0.06548496, -2.648583, 0, 0, 0, 1, 1,
-0.3757628, 0.7227097, -1.429847, 0, 0, 0, 1, 1,
-0.3699102, -0.5038362, -3.894455, 0, 0, 0, 1, 1,
-0.3696356, -0.01894356, -0.7396331, 0, 0, 0, 1, 1,
-0.3644546, -0.03395448, -1.325363, 1, 1, 1, 1, 1,
-0.363814, 0.7335905, -1.41845, 1, 1, 1, 1, 1,
-0.3584831, -0.03671988, -0.6237284, 1, 1, 1, 1, 1,
-0.3560509, -0.1381172, -2.806789, 1, 1, 1, 1, 1,
-0.3542058, -1.132148, -2.684974, 1, 1, 1, 1, 1,
-0.3535574, -0.3445696, -2.216647, 1, 1, 1, 1, 1,
-0.3484945, 0.1068476, -1.99263, 1, 1, 1, 1, 1,
-0.3462355, -0.5519599, -0.6109002, 1, 1, 1, 1, 1,
-0.3459818, 0.005523036, -1.517898, 1, 1, 1, 1, 1,
-0.3421313, 1.09483, -0.7610767, 1, 1, 1, 1, 1,
-0.3395484, 1.260324, -1.599783, 1, 1, 1, 1, 1,
-0.3380717, 0.9246004, 0.2811474, 1, 1, 1, 1, 1,
-0.3378494, -2.180798, -1.862342, 1, 1, 1, 1, 1,
-0.3370077, -0.8504394, -2.368111, 1, 1, 1, 1, 1,
-0.3353257, -0.2160704, -1.046509, 1, 1, 1, 1, 1,
-0.3222201, -0.1209989, -3.103985, 0, 0, 1, 1, 1,
-0.3153953, 1.370414, -1.471814, 1, 0, 0, 1, 1,
-0.3108962, -0.8375663, -4.419368, 1, 0, 0, 1, 1,
-0.3108502, -1.121122, -2.124446, 1, 0, 0, 1, 1,
-0.305358, 0.465682, -0.3349633, 1, 0, 0, 1, 1,
-0.3051821, 1.311357, -1.309377, 1, 0, 0, 1, 1,
-0.3050096, -0.1243107, -1.978549, 0, 0, 0, 1, 1,
-0.3043697, -1.365755, -1.96007, 0, 0, 0, 1, 1,
-0.3024113, -0.2716841, -0.9188735, 0, 0, 0, 1, 1,
-0.3018793, -1.686206, -4.489635, 0, 0, 0, 1, 1,
-0.3010489, -0.6601015, -2.780479, 0, 0, 0, 1, 1,
-0.2991954, 0.9835322, 0.9540426, 0, 0, 0, 1, 1,
-0.2981804, 0.2158633, -0.4956658, 0, 0, 0, 1, 1,
-0.2941217, 1.805452, -0.1532219, 1, 1, 1, 1, 1,
-0.2927661, -0.3657739, -1.619694, 1, 1, 1, 1, 1,
-0.2875114, -0.4301108, -2.205251, 1, 1, 1, 1, 1,
-0.2838211, -0.5437205, -1.051756, 1, 1, 1, 1, 1,
-0.2806814, 0.1981547, 1.908283, 1, 1, 1, 1, 1,
-0.2775524, -1.448246, -3.528451, 1, 1, 1, 1, 1,
-0.2746256, 0.9287203, 0.6317173, 1, 1, 1, 1, 1,
-0.2736742, -1.422251, -3.099049, 1, 1, 1, 1, 1,
-0.2733598, -1.002992, -2.714149, 1, 1, 1, 1, 1,
-0.2716976, -0.2968864, -1.625315, 1, 1, 1, 1, 1,
-0.2711694, -1.704581, -2.098947, 1, 1, 1, 1, 1,
-0.2704756, -0.293655, -2.648081, 1, 1, 1, 1, 1,
-0.270108, 0.3442516, -2.364983, 1, 1, 1, 1, 1,
-0.2691501, -1.640708, -3.339102, 1, 1, 1, 1, 1,
-0.2648744, 0.2706415, -1.028003, 1, 1, 1, 1, 1,
-0.2636342, 0.994837, 0.2189932, 0, 0, 1, 1, 1,
-0.259392, -0.7955817, -2.251477, 1, 0, 0, 1, 1,
-0.2528504, 0.3886434, -1.713086, 1, 0, 0, 1, 1,
-0.2515859, 0.7705576, -0.8619284, 1, 0, 0, 1, 1,
-0.2436205, -0.9773267, -3.874184, 1, 0, 0, 1, 1,
-0.2422158, -1.12508, -2.230883, 1, 0, 0, 1, 1,
-0.23927, 1.630154, -1.680372, 0, 0, 0, 1, 1,
-0.2368848, 0.5272861, 0.1465252, 0, 0, 0, 1, 1,
-0.235907, 0.924721, 0.1849507, 0, 0, 0, 1, 1,
-0.2344574, 0.8115854, 1.070612, 0, 0, 0, 1, 1,
-0.2259787, 1.18638, 0.559451, 0, 0, 0, 1, 1,
-0.2252655, -0.929226, -4.355645, 0, 0, 0, 1, 1,
-0.2229218, 0.6848009, -0.2691422, 0, 0, 0, 1, 1,
-0.2215117, -1.071916, -1.663943, 1, 1, 1, 1, 1,
-0.2207868, 0.7482452, 3.312803, 1, 1, 1, 1, 1,
-0.2137999, -0.8936577, -5.091581, 1, 1, 1, 1, 1,
-0.2117194, -1.158382, -3.721976, 1, 1, 1, 1, 1,
-0.2096129, 0.9915969, 0.2556442, 1, 1, 1, 1, 1,
-0.2020058, -0.1963412, -2.899402, 1, 1, 1, 1, 1,
-0.1991934, -1.131989, -3.664128, 1, 1, 1, 1, 1,
-0.1954524, -0.7295862, -1.895858, 1, 1, 1, 1, 1,
-0.1890791, 1.502044, -0.6127898, 1, 1, 1, 1, 1,
-0.1870348, 0.3879931, -1.104334, 1, 1, 1, 1, 1,
-0.1855006, -1.001043, -3.70207, 1, 1, 1, 1, 1,
-0.18523, 1.44677, 0.3912984, 1, 1, 1, 1, 1,
-0.1828616, 1.212553, 0.03717536, 1, 1, 1, 1, 1,
-0.1806136, 0.09278601, 0.09603886, 1, 1, 1, 1, 1,
-0.1797828, 1.18626, 1.073296, 1, 1, 1, 1, 1,
-0.1783881, 0.5291626, 1.306866, 0, 0, 1, 1, 1,
-0.1730181, -1.032562, -3.124702, 1, 0, 0, 1, 1,
-0.1724019, 2.312309, -0.6689661, 1, 0, 0, 1, 1,
-0.1668137, -1.548769, -3.420453, 1, 0, 0, 1, 1,
-0.1656045, -0.451025, -3.221349, 1, 0, 0, 1, 1,
-0.1623578, 0.7155235, -1.52489, 1, 0, 0, 1, 1,
-0.1609786, 0.9191103, 0.8761356, 0, 0, 0, 1, 1,
-0.1591543, 0.4949585, -0.7999812, 0, 0, 0, 1, 1,
-0.1550493, -0.6296762, -2.30037, 0, 0, 0, 1, 1,
-0.1538229, -0.8025475, -3.717699, 0, 0, 0, 1, 1,
-0.1498923, 0.03640028, -1.071415, 0, 0, 0, 1, 1,
-0.1449699, -0.2360858, -3.513644, 0, 0, 0, 1, 1,
-0.1443286, 1.26825, 1.75251, 0, 0, 0, 1, 1,
-0.1442969, 1.043476, 1.520913, 1, 1, 1, 1, 1,
-0.1422427, -0.6580786, -3.325203, 1, 1, 1, 1, 1,
-0.1348074, -0.7914677, -3.969311, 1, 1, 1, 1, 1,
-0.1344981, -0.6265284, -2.371705, 1, 1, 1, 1, 1,
-0.1329139, -0.043539, -1.741011, 1, 1, 1, 1, 1,
-0.1316065, 0.1401597, -0.4214935, 1, 1, 1, 1, 1,
-0.1203326, -1.335145, -3.956275, 1, 1, 1, 1, 1,
-0.117462, -0.7287838, -1.066651, 1, 1, 1, 1, 1,
-0.1149318, 0.496002, -0.3411609, 1, 1, 1, 1, 1,
-0.1137131, 0.6311435, -0.3511519, 1, 1, 1, 1, 1,
-0.1133396, -0.1294497, -1.779274, 1, 1, 1, 1, 1,
-0.1129388, -0.05381986, -2.211333, 1, 1, 1, 1, 1,
-0.1112711, 0.03409252, -2.091771, 1, 1, 1, 1, 1,
-0.1076334, 0.8992618, 1.630906, 1, 1, 1, 1, 1,
-0.1048578, 1.105025, 1.166654, 1, 1, 1, 1, 1,
-0.102683, 0.854941, -1.468599, 0, 0, 1, 1, 1,
-0.1000998, -0.4746963, -2.37065, 1, 0, 0, 1, 1,
-0.09889655, 0.801765, -0.2162254, 1, 0, 0, 1, 1,
-0.09752545, -0.0131111, -0.4530928, 1, 0, 0, 1, 1,
-0.09548707, -0.2318958, -2.576484, 1, 0, 0, 1, 1,
-0.09092048, -0.2138774, -2.5638, 1, 0, 0, 1, 1,
-0.08788159, -0.2320721, -3.415392, 0, 0, 0, 1, 1,
-0.08345155, 0.0842545, -2.093008, 0, 0, 0, 1, 1,
-0.08255936, 1.203688, 0.8987996, 0, 0, 0, 1, 1,
-0.08131512, -2.216855, -3.137989, 0, 0, 0, 1, 1,
-0.08126672, -0.01379379, -2.154141, 0, 0, 0, 1, 1,
-0.07880894, -1.335636, -3.526277, 0, 0, 0, 1, 1,
-0.07548695, -1.373324, -1.451011, 0, 0, 0, 1, 1,
-0.07238528, -0.1857041, -2.747579, 1, 1, 1, 1, 1,
-0.07086722, 0.5431678, -0.6723889, 1, 1, 1, 1, 1,
-0.06843068, 0.1843899, 1.029283, 1, 1, 1, 1, 1,
-0.06651986, 0.5475694, 1.050245, 1, 1, 1, 1, 1,
-0.06340671, 0.869085, 0.4484061, 1, 1, 1, 1, 1,
-0.06253862, -0.7025825, -2.442368, 1, 1, 1, 1, 1,
-0.06241369, -1.758585, -2.354615, 1, 1, 1, 1, 1,
-0.06144367, -1.883011, -2.512274, 1, 1, 1, 1, 1,
-0.05828518, -1.140459, -1.913285, 1, 1, 1, 1, 1,
-0.0568787, 0.4214597, -0.4234881, 1, 1, 1, 1, 1,
-0.05441922, 1.276705, -0.1723288, 1, 1, 1, 1, 1,
-0.05379452, -0.04704297, -0.9049219, 1, 1, 1, 1, 1,
-0.05170523, 1.505883, -0.04848814, 1, 1, 1, 1, 1,
-0.05166289, 0.1525662, -0.7327943, 1, 1, 1, 1, 1,
-0.04971065, -1.688203, -3.804912, 1, 1, 1, 1, 1,
-0.04792384, 2.016415, -0.2371057, 0, 0, 1, 1, 1,
-0.04761734, -0.2867979, -2.557113, 1, 0, 0, 1, 1,
-0.04366493, -0.4921456, -3.30873, 1, 0, 0, 1, 1,
-0.04098899, 0.626065, -1.688478, 1, 0, 0, 1, 1,
-0.03824926, 0.2950951, 0.417341, 1, 0, 0, 1, 1,
-0.03350817, -0.2783302, -2.40043, 1, 0, 0, 1, 1,
-0.03323815, -1.425146, -4.08649, 0, 0, 0, 1, 1,
-0.02805479, 0.4585266, -0.2798629, 0, 0, 0, 1, 1,
-0.02419399, -0.2058556, -2.25299, 0, 0, 0, 1, 1,
-0.02285003, -0.1428183, -4.047746, 0, 0, 0, 1, 1,
-0.0208819, -1.371004, -4.578314, 0, 0, 0, 1, 1,
-0.01021366, 0.6031914, 0.9049068, 0, 0, 0, 1, 1,
-0.009192277, -0.7403212, -3.703885, 0, 0, 0, 1, 1,
-0.007584203, 0.01051505, -0.1963662, 1, 1, 1, 1, 1,
-0.006135684, -0.6114671, -3.423428, 1, 1, 1, 1, 1,
-0.005549527, 1.51767, 0.0430114, 1, 1, 1, 1, 1,
-2.974907e-05, 0.3745948, -0.287403, 1, 1, 1, 1, 1,
0.0008326493, 0.6562773, 0.02564579, 1, 1, 1, 1, 1,
0.010578, -0.6286408, 2.400029, 1, 1, 1, 1, 1,
0.01208754, -0.5144405, 3.250362, 1, 1, 1, 1, 1,
0.014419, 1.877813, -0.7942772, 1, 1, 1, 1, 1,
0.01527949, -0.746823, 3.637612, 1, 1, 1, 1, 1,
0.01618519, -0.9754272, 3.561033, 1, 1, 1, 1, 1,
0.02738411, -1.229947, 1.815743, 1, 1, 1, 1, 1,
0.03623963, 0.9344656, 1.696286, 1, 1, 1, 1, 1,
0.03701743, -1.151303, 3.686708, 1, 1, 1, 1, 1,
0.04193406, 0.5225299, 0.7742859, 1, 1, 1, 1, 1,
0.04254293, -0.6840641, 2.916429, 1, 1, 1, 1, 1,
0.04801637, -0.53974, 1.432251, 0, 0, 1, 1, 1,
0.04997804, 0.1430095, 0.08542316, 1, 0, 0, 1, 1,
0.05215038, 0.7562249, 1.674163, 1, 0, 0, 1, 1,
0.05291785, 1.086318, -1.155832, 1, 0, 0, 1, 1,
0.05356809, 1.261187, -1.653758, 1, 0, 0, 1, 1,
0.05809708, -0.5951627, 3.626662, 1, 0, 0, 1, 1,
0.06098533, 0.2672385, 0.2255167, 0, 0, 0, 1, 1,
0.0627052, -0.678738, 2.261481, 0, 0, 0, 1, 1,
0.06279872, 0.5602322, 1.439076, 0, 0, 0, 1, 1,
0.06304883, -0.5541937, 1.587967, 0, 0, 0, 1, 1,
0.06395641, 0.5685617, 0.8057696, 0, 0, 0, 1, 1,
0.06623956, -0.2882063, 2.139297, 0, 0, 0, 1, 1,
0.06673229, -0.1161544, 4.150556, 0, 0, 0, 1, 1,
0.07368997, 0.5764719, -0.345242, 1, 1, 1, 1, 1,
0.07913537, 0.5460703, 1.165751, 1, 1, 1, 1, 1,
0.08631198, -1.950681, 4.444435, 1, 1, 1, 1, 1,
0.08776274, -1.747464, 3.15612, 1, 1, 1, 1, 1,
0.08855464, 0.2750547, 0.155616, 1, 1, 1, 1, 1,
0.09055226, -0.0909941, 1.085487, 1, 1, 1, 1, 1,
0.09400906, 0.2207945, 0.8984492, 1, 1, 1, 1, 1,
0.0968696, 0.2393352, 0.8542454, 1, 1, 1, 1, 1,
0.09900534, 0.7337947, 1.432444, 1, 1, 1, 1, 1,
0.1046778, -0.08452617, 3.04992, 1, 1, 1, 1, 1,
0.1109043, -1.568159, 2.626629, 1, 1, 1, 1, 1,
0.1111475, -0.4156701, 4.261836, 1, 1, 1, 1, 1,
0.1136071, -1.008992, 2.01291, 1, 1, 1, 1, 1,
0.1155939, -0.610662, 4.891298, 1, 1, 1, 1, 1,
0.1164546, 0.1048985, 0.8337275, 1, 1, 1, 1, 1,
0.1171116, 1.747065, -1.641077, 0, 0, 1, 1, 1,
0.1219217, -0.4076528, 2.60636, 1, 0, 0, 1, 1,
0.1234979, -0.0701472, 2.284311, 1, 0, 0, 1, 1,
0.1256555, -0.550249, 2.417402, 1, 0, 0, 1, 1,
0.1288366, -1.322621, 3.064575, 1, 0, 0, 1, 1,
0.1322022, -0.1311544, 2.53829, 1, 0, 0, 1, 1,
0.1335632, 0.4433411, -3.651121, 0, 0, 0, 1, 1,
0.1349745, -0.5736899, 1.647602, 0, 0, 0, 1, 1,
0.140142, -0.241233, 1.401159, 0, 0, 0, 1, 1,
0.1452257, 0.101796, 0.5178401, 0, 0, 0, 1, 1,
0.1453181, 0.9506397, 0.08888783, 0, 0, 0, 1, 1,
0.1621088, 0.3805378, -1.303284, 0, 0, 0, 1, 1,
0.1642882, 0.6032183, -0.09513599, 0, 0, 0, 1, 1,
0.1646423, -1.143606, 2.046445, 1, 1, 1, 1, 1,
0.1729579, -0.1192853, 0.007151831, 1, 1, 1, 1, 1,
0.1732405, 1.035349, 1.716567, 1, 1, 1, 1, 1,
0.1758179, -1.838964, 5.19687, 1, 1, 1, 1, 1,
0.17647, -1.032402, 2.697675, 1, 1, 1, 1, 1,
0.1764962, -2.285931, 2.739745, 1, 1, 1, 1, 1,
0.1765821, -1.516756, 3.293589, 1, 1, 1, 1, 1,
0.1793338, -0.5468187, 4.180506, 1, 1, 1, 1, 1,
0.179764, -1.307113, 2.781444, 1, 1, 1, 1, 1,
0.1911256, 0.2099905, -0.9427915, 1, 1, 1, 1, 1,
0.1912699, 1.15853, 0.815156, 1, 1, 1, 1, 1,
0.1926282, -0.04688321, 3.025337, 1, 1, 1, 1, 1,
0.1940335, 2.10727, -0.0239368, 1, 1, 1, 1, 1,
0.1946798, -0.3323105, 1.804449, 1, 1, 1, 1, 1,
0.1976827, 1.007684, -1.135755, 1, 1, 1, 1, 1,
0.1998329, -3.153447, 2.394533, 0, 0, 1, 1, 1,
0.2075111, 0.1220589, 1.528955, 1, 0, 0, 1, 1,
0.2114927, 0.09638336, -1.019234, 1, 0, 0, 1, 1,
0.2158371, -0.6928769, 3.514169, 1, 0, 0, 1, 1,
0.2168605, 0.01810935, 1.193886, 1, 0, 0, 1, 1,
0.2183319, -0.5911382, 2.933687, 1, 0, 0, 1, 1,
0.2204501, -1.346139, 2.944153, 0, 0, 0, 1, 1,
0.2217937, 1.068389, 0.7230658, 0, 0, 0, 1, 1,
0.2231279, -1.205295, 1.500118, 0, 0, 0, 1, 1,
0.2271156, -0.222379, 0.9576789, 0, 0, 0, 1, 1,
0.2311818, 1.58589, -0.460638, 0, 0, 0, 1, 1,
0.2336849, 0.4118873, 0.5973597, 0, 0, 0, 1, 1,
0.2342067, -0.09338397, 0.7020927, 0, 0, 0, 1, 1,
0.2343462, 1.296818, -0.2123953, 1, 1, 1, 1, 1,
0.2347104, 0.9114587, -0.1557203, 1, 1, 1, 1, 1,
0.2431089, -0.1040002, 2.018086, 1, 1, 1, 1, 1,
0.2433396, -0.7298914, 3.191085, 1, 1, 1, 1, 1,
0.2483798, 0.6237196, 0.1856417, 1, 1, 1, 1, 1,
0.2510372, 1.403685, -1.548091, 1, 1, 1, 1, 1,
0.2519212, -0.683782, 1.880333, 1, 1, 1, 1, 1,
0.2528065, 0.6362858, 1.010607, 1, 1, 1, 1, 1,
0.25358, -0.944015, 2.714436, 1, 1, 1, 1, 1,
0.2618959, 0.4156883, 0.9971643, 1, 1, 1, 1, 1,
0.2619101, 0.790958, -0.3978835, 1, 1, 1, 1, 1,
0.2670784, -1.744071, 2.624264, 1, 1, 1, 1, 1,
0.2684349, 0.3511752, -0.2879616, 1, 1, 1, 1, 1,
0.2709962, -0.4668452, 1.703845, 1, 1, 1, 1, 1,
0.2726023, 0.9046758, 1.296273, 1, 1, 1, 1, 1,
0.273734, -0.1787795, 1.175953, 0, 0, 1, 1, 1,
0.2741251, 0.1506477, 0.9472705, 1, 0, 0, 1, 1,
0.2742875, -1.259797, 4.352282, 1, 0, 0, 1, 1,
0.2777953, 1.441703, -0.8685122, 1, 0, 0, 1, 1,
0.2814439, -0.9589677, 2.797018, 1, 0, 0, 1, 1,
0.2848585, -1.567183, 3.794758, 1, 0, 0, 1, 1,
0.2849391, -2.302207, 0.7909947, 0, 0, 0, 1, 1,
0.2852222, 1.382962, 0.1031397, 0, 0, 0, 1, 1,
0.2857993, -1.061713, 2.743016, 0, 0, 0, 1, 1,
0.2908477, 0.6437319, 0.4220383, 0, 0, 0, 1, 1,
0.2960508, -1.144599, 1.711889, 0, 0, 0, 1, 1,
0.2960669, 0.3351237, 1.477597, 0, 0, 0, 1, 1,
0.3003874, -0.1052996, 1.044056, 0, 0, 0, 1, 1,
0.3014398, 0.713886, -0.7847224, 1, 1, 1, 1, 1,
0.301883, -0.7724273, 2.25501, 1, 1, 1, 1, 1,
0.3021719, 0.06056183, 1.753431, 1, 1, 1, 1, 1,
0.3029677, 0.2367605, 1.081808, 1, 1, 1, 1, 1,
0.3047952, 0.5268442, 1.585178, 1, 1, 1, 1, 1,
0.3050773, -0.7061468, 3.825207, 1, 1, 1, 1, 1,
0.3057637, 0.02083306, -0.03496951, 1, 1, 1, 1, 1,
0.30714, 0.2175814, 0.6369513, 1, 1, 1, 1, 1,
0.3154824, -0.129387, 0.6600705, 1, 1, 1, 1, 1,
0.3166277, -1.542043, 3.369911, 1, 1, 1, 1, 1,
0.3182178, -0.7880245, 2.946071, 1, 1, 1, 1, 1,
0.3189069, -0.03893537, 1.274943, 1, 1, 1, 1, 1,
0.3195843, 0.1651736, 0.7561095, 1, 1, 1, 1, 1,
0.320402, -1.358002, 3.388691, 1, 1, 1, 1, 1,
0.3209912, 0.3714475, 1.651353, 1, 1, 1, 1, 1,
0.322195, -0.9586844, 2.359464, 0, 0, 1, 1, 1,
0.3233954, -0.1905738, 1.626395, 1, 0, 0, 1, 1,
0.3245856, -0.1186551, 0.8720223, 1, 0, 0, 1, 1,
0.3270376, -0.5362905, 1.127371, 1, 0, 0, 1, 1,
0.3347705, 0.7284132, 0.1306193, 1, 0, 0, 1, 1,
0.3420071, -0.1437228, 2.11792, 1, 0, 0, 1, 1,
0.3475634, -0.9074957, 1.948325, 0, 0, 0, 1, 1,
0.347743, 1.979137, 0.8024874, 0, 0, 0, 1, 1,
0.3496441, 0.6112915, 1.818302, 0, 0, 0, 1, 1,
0.349694, -0.1110362, 1.776671, 0, 0, 0, 1, 1,
0.3507731, -0.3410068, 2.097201, 0, 0, 0, 1, 1,
0.3526319, -0.5882622, 3.506994, 0, 0, 0, 1, 1,
0.3584148, -1.694167, 3.259778, 0, 0, 0, 1, 1,
0.3586107, 0.5315444, 0.9964876, 1, 1, 1, 1, 1,
0.360091, -0.3359396, 2.078834, 1, 1, 1, 1, 1,
0.3634825, -1.051534, 2.034948, 1, 1, 1, 1, 1,
0.3650039, -1.595419, 2.84551, 1, 1, 1, 1, 1,
0.3670695, -1.458897, 1.090671, 1, 1, 1, 1, 1,
0.3704345, -0.9932583, 1.578043, 1, 1, 1, 1, 1,
0.3715886, 1.382788, -3.833521, 1, 1, 1, 1, 1,
0.3742459, 1.915979, 0.9110224, 1, 1, 1, 1, 1,
0.3745936, -1.383762, 3.541184, 1, 1, 1, 1, 1,
0.3751135, 0.08659124, 0.9609014, 1, 1, 1, 1, 1,
0.3762948, -1.458151, 2.904518, 1, 1, 1, 1, 1,
0.3803124, -0.4218234, 3.019835, 1, 1, 1, 1, 1,
0.3843567, -0.1397314, 3.150828, 1, 1, 1, 1, 1,
0.3852156, -0.1114455, 3.090353, 1, 1, 1, 1, 1,
0.3870873, 0.1858394, -0.1240755, 1, 1, 1, 1, 1,
0.3874709, 1.348083, 0.1126402, 0, 0, 1, 1, 1,
0.3880082, -0.3906971, 2.865115, 1, 0, 0, 1, 1,
0.390373, -1.783182, 2.495382, 1, 0, 0, 1, 1,
0.3921867, -0.3566475, 0.04921648, 1, 0, 0, 1, 1,
0.3952811, -0.9505662, 2.623698, 1, 0, 0, 1, 1,
0.3958211, -0.2084473, 1.434695, 1, 0, 0, 1, 1,
0.3973513, -0.1384557, 2.924964, 0, 0, 0, 1, 1,
0.3997465, 0.0888178, 2.686024, 0, 0, 0, 1, 1,
0.403237, -0.2698506, 1.777488, 0, 0, 0, 1, 1,
0.4142432, -1.074479, 2.540943, 0, 0, 0, 1, 1,
0.4152639, -1.793933, 3.407649, 0, 0, 0, 1, 1,
0.4163327, -0.2711429, 1.91744, 0, 0, 0, 1, 1,
0.4272782, 0.5573551, 0.4237828, 0, 0, 0, 1, 1,
0.4275055, 0.5940858, 0.6083735, 1, 1, 1, 1, 1,
0.4294686, -0.4474486, 2.947993, 1, 1, 1, 1, 1,
0.4325238, 1.195414, -0.6311755, 1, 1, 1, 1, 1,
0.445405, 0.4487908, 1.050084, 1, 1, 1, 1, 1,
0.4468687, -0.6315751, 2.138192, 1, 1, 1, 1, 1,
0.4498274, 0.6057169, 1.023879, 1, 1, 1, 1, 1,
0.4512942, 0.4372716, 0.2948515, 1, 1, 1, 1, 1,
0.4535785, -1.1359, 2.232182, 1, 1, 1, 1, 1,
0.4547813, 0.88133, 0.7179874, 1, 1, 1, 1, 1,
0.4548685, -0.8354741, 2.05314, 1, 1, 1, 1, 1,
0.4591777, 0.1302925, 2.950577, 1, 1, 1, 1, 1,
0.4593916, 0.384174, 1.583109, 1, 1, 1, 1, 1,
0.459547, 1.154897, 0.6719329, 1, 1, 1, 1, 1,
0.4611667, -1.057856, 2.1969, 1, 1, 1, 1, 1,
0.4629741, -0.07269135, 1.035009, 1, 1, 1, 1, 1,
0.4631064, 1.194534, 0.7061002, 0, 0, 1, 1, 1,
0.4632227, 0.03695012, 0.3991102, 1, 0, 0, 1, 1,
0.4659081, -1.299256, 3.446892, 1, 0, 0, 1, 1,
0.4669518, 1.069981, -0.9529978, 1, 0, 0, 1, 1,
0.4682851, 1.497612, 0.5491894, 1, 0, 0, 1, 1,
0.4716977, 0.1474141, 1.606525, 1, 0, 0, 1, 1,
0.4761575, 0.7591641, 0.679126, 0, 0, 0, 1, 1,
0.4860021, -0.9355793, 1.877487, 0, 0, 0, 1, 1,
0.4915428, 1.080209, 0.04787255, 0, 0, 0, 1, 1,
0.4924416, -0.07415153, 2.557364, 0, 0, 0, 1, 1,
0.4929235, 0.2032926, 0.8741398, 0, 0, 0, 1, 1,
0.4934217, 0.4257202, 1.124949, 0, 0, 0, 1, 1,
0.495227, -0.6428783, 2.072968, 0, 0, 0, 1, 1,
0.5014473, 0.1468185, 2.918379, 1, 1, 1, 1, 1,
0.5014944, -0.5922897, 1.365649, 1, 1, 1, 1, 1,
0.5017652, 0.07517634, 2.634438, 1, 1, 1, 1, 1,
0.5085472, -0.1773257, 2.767312, 1, 1, 1, 1, 1,
0.5102833, -1.221824, 0.850816, 1, 1, 1, 1, 1,
0.510361, 0.306171, 0.9817306, 1, 1, 1, 1, 1,
0.5143133, 0.475234, 0.8056621, 1, 1, 1, 1, 1,
0.5144055, -2.112157, 3.096587, 1, 1, 1, 1, 1,
0.5159446, -0.4544817, 3.227398, 1, 1, 1, 1, 1,
0.5165372, 0.5675683, 1.040829, 1, 1, 1, 1, 1,
0.5180213, 0.1135352, 1.278287, 1, 1, 1, 1, 1,
0.5184324, 0.1528752, 1.628155, 1, 1, 1, 1, 1,
0.5196256, 0.3522711, 0.4613683, 1, 1, 1, 1, 1,
0.5266052, -0.855016, 3.604806, 1, 1, 1, 1, 1,
0.5267467, -0.2298481, 2.402169, 1, 1, 1, 1, 1,
0.5288607, 0.119353, 0.0110062, 0, 0, 1, 1, 1,
0.529081, -1.590102, 3.002629, 1, 0, 0, 1, 1,
0.5303843, 1.650468, -0.6228347, 1, 0, 0, 1, 1,
0.5315078, -0.39631, 1.878941, 1, 0, 0, 1, 1,
0.5332531, -1.258401, 3.457201, 1, 0, 0, 1, 1,
0.5358821, 0.2324584, 1.00623, 1, 0, 0, 1, 1,
0.5362517, 0.6316367, 0.5935621, 0, 0, 0, 1, 1,
0.5469556, 1.307921, 0.7412226, 0, 0, 0, 1, 1,
0.552124, -0.07051937, 1.984081, 0, 0, 0, 1, 1,
0.5540377, -0.5731377, 0.7752832, 0, 0, 0, 1, 1,
0.5548115, -0.2694197, 0.8694101, 0, 0, 0, 1, 1,
0.5567024, 0.2187831, 0.9990952, 0, 0, 0, 1, 1,
0.5606468, 0.2497852, 3.079112, 0, 0, 0, 1, 1,
0.5616908, 0.9885254, 1.279844, 1, 1, 1, 1, 1,
0.5622529, 0.2733028, 1.371456, 1, 1, 1, 1, 1,
0.5633643, -0.3331529, 1.813127, 1, 1, 1, 1, 1,
0.5639657, 0.08501032, 1.075173, 1, 1, 1, 1, 1,
0.5664561, -1.172827, 2.565647, 1, 1, 1, 1, 1,
0.5688091, 0.4372419, 0.6215985, 1, 1, 1, 1, 1,
0.5718476, 1.672577, 0.820531, 1, 1, 1, 1, 1,
0.5756851, 0.4525135, 1.129363, 1, 1, 1, 1, 1,
0.5819472, 0.3086568, 1.093301, 1, 1, 1, 1, 1,
0.5911675, -0.9736384, 3.379437, 1, 1, 1, 1, 1,
0.5931188, -1.253126, 2.092148, 1, 1, 1, 1, 1,
0.5950416, 0.6892256, 1.513174, 1, 1, 1, 1, 1,
0.5950925, 1.647297, 1.252034, 1, 1, 1, 1, 1,
0.6014185, 0.07819915, 0.4198567, 1, 1, 1, 1, 1,
0.601559, -0.3028378, 1.792524, 1, 1, 1, 1, 1,
0.6019468, -0.1867839, 1.644469, 0, 0, 1, 1, 1,
0.6051782, -0.4607868, 4.471489, 1, 0, 0, 1, 1,
0.6087, -0.5649058, 1.442184, 1, 0, 0, 1, 1,
0.6137013, -0.6156576, 0.1231812, 1, 0, 0, 1, 1,
0.6145068, -2.26085, 2.576445, 1, 0, 0, 1, 1,
0.6156026, -1.065462, 2.337541, 1, 0, 0, 1, 1,
0.6168759, 0.5899822, 0.9642263, 0, 0, 0, 1, 1,
0.6186401, -2.037156, 2.505977, 0, 0, 0, 1, 1,
0.6225217, -0.253605, 0.8729976, 0, 0, 0, 1, 1,
0.6288509, 0.2386262, 0.3988411, 0, 0, 0, 1, 1,
0.6379827, -0.900457, 3.36463, 0, 0, 0, 1, 1,
0.6398803, -0.6361026, 3.221249, 0, 0, 0, 1, 1,
0.6415932, -0.08877065, 0.8332731, 0, 0, 0, 1, 1,
0.6468264, -2.806211, 2.323906, 1, 1, 1, 1, 1,
0.6492787, 0.04086814, 1.226998, 1, 1, 1, 1, 1,
0.6494926, 1.504449, -0.2742426, 1, 1, 1, 1, 1,
0.6507167, -1.078938, 2.943039, 1, 1, 1, 1, 1,
0.664722, -0.177401, 3.960125, 1, 1, 1, 1, 1,
0.6673651, -0.7369752, 1.326826, 1, 1, 1, 1, 1,
0.6685457, -0.9750195, 3.001594, 1, 1, 1, 1, 1,
0.6733299, -0.9237324, 0.2286599, 1, 1, 1, 1, 1,
0.6834074, -0.9067104, 3.397992, 1, 1, 1, 1, 1,
0.6934666, -0.3261233, 1.387114, 1, 1, 1, 1, 1,
0.6963187, -0.06175942, 2.910948, 1, 1, 1, 1, 1,
0.7064525, -0.5689887, 3.000633, 1, 1, 1, 1, 1,
0.706623, -0.01241697, 2.791852, 1, 1, 1, 1, 1,
0.7129407, 0.8579287, 0.7418849, 1, 1, 1, 1, 1,
0.7141867, 0.9433871, 1.971181, 1, 1, 1, 1, 1,
0.7161348, -0.03459016, 0.5546486, 0, 0, 1, 1, 1,
0.7171368, -0.03694869, 1.234895, 1, 0, 0, 1, 1,
0.7174885, -0.3316921, 1.88716, 1, 0, 0, 1, 1,
0.7205411, -0.139274, 1.881159, 1, 0, 0, 1, 1,
0.7213089, 0.254556, -0.1660739, 1, 0, 0, 1, 1,
0.7221354, -1.271788, 2.769176, 1, 0, 0, 1, 1,
0.7270187, -0.9240041, 1.198237, 0, 0, 0, 1, 1,
0.7308999, 0.1115079, 0.1160868, 0, 0, 0, 1, 1,
0.7361037, -0.07323085, 2.80328, 0, 0, 0, 1, 1,
0.7412586, 1.135777, 0.6402364, 0, 0, 0, 1, 1,
0.7419866, 0.4847784, 0.4672359, 0, 0, 0, 1, 1,
0.7423345, 0.918425, -0.002712741, 0, 0, 0, 1, 1,
0.7428616, 0.7264154, 0.9713426, 0, 0, 0, 1, 1,
0.7456104, -0.5002655, 0.7050849, 1, 1, 1, 1, 1,
0.7460726, 1.131098, 0.4497175, 1, 1, 1, 1, 1,
0.7490182, -1.319199, 2.249105, 1, 1, 1, 1, 1,
0.749186, 0.6471803, 1.677852, 1, 1, 1, 1, 1,
0.7527215, -0.1343049, 2.176695, 1, 1, 1, 1, 1,
0.7608325, 0.2678002, 1.597189, 1, 1, 1, 1, 1,
0.7714174, -1.29618, 3.166324, 1, 1, 1, 1, 1,
0.7786288, -1.056041, 1.086, 1, 1, 1, 1, 1,
0.7824138, -1.699167, 3.576077, 1, 1, 1, 1, 1,
0.783585, 1.308265, 0.8604062, 1, 1, 1, 1, 1,
0.7852647, -0.8948422, 0.4752686, 1, 1, 1, 1, 1,
0.797447, 1.876511, 0.7928705, 1, 1, 1, 1, 1,
0.7977242, -0.2223897, 3.34177, 1, 1, 1, 1, 1,
0.7989363, 1.249002, 0.3224654, 1, 1, 1, 1, 1,
0.8009319, 0.7656104, -0.1210973, 1, 1, 1, 1, 1,
0.8011262, 0.09280197, 0.5287464, 0, 0, 1, 1, 1,
0.8059882, 0.2951204, 1.568925, 1, 0, 0, 1, 1,
0.8086337, -0.6325506, 2.851222, 1, 0, 0, 1, 1,
0.8088212, 1.231785, 0.421645, 1, 0, 0, 1, 1,
0.8131061, 0.6596209, 1.77859, 1, 0, 0, 1, 1,
0.814024, -0.4445707, 3.966317, 1, 0, 0, 1, 1,
0.8145592, 0.9955846, -0.5567204, 0, 0, 0, 1, 1,
0.8146859, -0.3632829, 1.454429, 0, 0, 0, 1, 1,
0.8170385, -0.1091832, 1.242592, 0, 0, 0, 1, 1,
0.820121, -1.366191, 2.127113, 0, 0, 0, 1, 1,
0.830668, 0.7495201, 0.4594114, 0, 0, 0, 1, 1,
0.8408892, 0.7124607, 1.461516, 0, 0, 0, 1, 1,
0.8425965, -0.5669087, 1.774324, 0, 0, 0, 1, 1,
0.8500817, 0.7677587, 2.948302, 1, 1, 1, 1, 1,
0.8558175, -0.468967, 2.134235, 1, 1, 1, 1, 1,
0.858165, 1.409759, 0.5348161, 1, 1, 1, 1, 1,
0.8686057, 3.297122e-05, 0.3334401, 1, 1, 1, 1, 1,
0.874719, -0.4069526, 2.575238, 1, 1, 1, 1, 1,
0.8755619, -1.202346, 2.661514, 1, 1, 1, 1, 1,
0.8813458, -0.7673628, 1.240695, 1, 1, 1, 1, 1,
0.8828376, 0.1488372, 1.419527, 1, 1, 1, 1, 1,
0.8842624, 0.1477324, 2.062706, 1, 1, 1, 1, 1,
0.8852639, 1.735042, 0.1458546, 1, 1, 1, 1, 1,
0.885668, -1.078427, 2.283294, 1, 1, 1, 1, 1,
0.890999, 0.06740566, 2.249734, 1, 1, 1, 1, 1,
0.8968871, 0.01000015, 3.433038, 1, 1, 1, 1, 1,
0.9036208, -0.7922936, 1.186378, 1, 1, 1, 1, 1,
0.903909, 1.159262, -0.6138191, 1, 1, 1, 1, 1,
0.9080569, -0.8194246, 2.346607, 0, 0, 1, 1, 1,
0.9080704, 1.111525, 0.4452, 1, 0, 0, 1, 1,
0.9091243, -0.181153, 1.903837, 1, 0, 0, 1, 1,
0.917244, -1.201178, 4.34108, 1, 0, 0, 1, 1,
0.9217438, -0.3298962, 3.076238, 1, 0, 0, 1, 1,
0.9261801, 1.161083, 1.700704, 1, 0, 0, 1, 1,
0.9359416, -1.899376, 3.004106, 0, 0, 0, 1, 1,
0.9363443, 0.3139687, 0.1680342, 0, 0, 0, 1, 1,
0.9482469, -0.9960461, 1.660894, 0, 0, 0, 1, 1,
0.9550324, -1.361244, 2.990786, 0, 0, 0, 1, 1,
0.9635994, 0.4593937, 1.539167, 0, 0, 0, 1, 1,
0.9709685, -1.081016, 0.728465, 0, 0, 0, 1, 1,
0.9720398, 0.8716283, 1.777799, 0, 0, 0, 1, 1,
0.9818991, 0.8964764, 0.9732982, 1, 1, 1, 1, 1,
0.9822124, 0.4561172, -0.3960377, 1, 1, 1, 1, 1,
0.9836268, -1.206221, 2.998102, 1, 1, 1, 1, 1,
0.9865263, -0.3764206, 0.7191826, 1, 1, 1, 1, 1,
0.9967957, 0.5826448, 2.635147, 1, 1, 1, 1, 1,
0.9969617, 0.6877288, 0.3074458, 1, 1, 1, 1, 1,
1.007404, 1.307132, 0.2848046, 1, 1, 1, 1, 1,
1.009195, 0.2497132, -0.2268679, 1, 1, 1, 1, 1,
1.012174, -0.6187735, 1.566633, 1, 1, 1, 1, 1,
1.01622, -0.2416726, 2.311144, 1, 1, 1, 1, 1,
1.020025, 0.3814927, 0.6733703, 1, 1, 1, 1, 1,
1.022467, 0.2555248, 2.63109, 1, 1, 1, 1, 1,
1.023113, 1.273547, 1.188199, 1, 1, 1, 1, 1,
1.023372, 1.271827, 1.73483, 1, 1, 1, 1, 1,
1.024659, -0.7469156, 3.23081, 1, 1, 1, 1, 1,
1.026397, 1.789615, -0.9269093, 0, 0, 1, 1, 1,
1.028098, -0.192405, 2.492329, 1, 0, 0, 1, 1,
1.033885, 0.7551359, 0.7554392, 1, 0, 0, 1, 1,
1.041973, 0.4921362, 0.314816, 1, 0, 0, 1, 1,
1.051737, 0.5938494, 1.400504, 1, 0, 0, 1, 1,
1.058398, 1.962952, -1.452913, 1, 0, 0, 1, 1,
1.067675, -0.7149956, 2.998617, 0, 0, 0, 1, 1,
1.076581, -0.543721, 2.465961, 0, 0, 0, 1, 1,
1.082327, 0.3529136, 0.451016, 0, 0, 0, 1, 1,
1.084015, -0.09107266, 2.758432, 0, 0, 0, 1, 1,
1.092355, -0.3886238, 0.2394823, 0, 0, 0, 1, 1,
1.092487, -0.7188726, 2.421868, 0, 0, 0, 1, 1,
1.096414, -1.78563, 1.331596, 0, 0, 0, 1, 1,
1.101946, -1.420647, 3.772699, 1, 1, 1, 1, 1,
1.110271, -1.49364, 2.78102, 1, 1, 1, 1, 1,
1.118251, 0.4740388, 3.088571, 1, 1, 1, 1, 1,
1.121428, -0.9284254, 3.451307, 1, 1, 1, 1, 1,
1.12337, -0.6961194, 2.180142, 1, 1, 1, 1, 1,
1.132885, 2.123996, 1.217699, 1, 1, 1, 1, 1,
1.135321, 2.780131, 1.55161, 1, 1, 1, 1, 1,
1.142456, -2.003016, 2.225586, 1, 1, 1, 1, 1,
1.148292, 1.70927, 2.10567, 1, 1, 1, 1, 1,
1.148463, -0.1920191, 3.255144, 1, 1, 1, 1, 1,
1.149664, 0.2963852, 1.200482, 1, 1, 1, 1, 1,
1.152721, -0.526712, 1.824734, 1, 1, 1, 1, 1,
1.15534, 2.030965, -1.621086, 1, 1, 1, 1, 1,
1.156721, 0.3230604, 1.99077, 1, 1, 1, 1, 1,
1.159641, -2.000926, 2.413656, 1, 1, 1, 1, 1,
1.159848, -1.288653, 2.598804, 0, 0, 1, 1, 1,
1.169523, 0.6666074, 1.66837, 1, 0, 0, 1, 1,
1.172142, -0.353673, 2.665565, 1, 0, 0, 1, 1,
1.172516, -0.04603694, 2.905385, 1, 0, 0, 1, 1,
1.175624, -1.511623, 1.87314, 1, 0, 0, 1, 1,
1.199227, 1.279498, 1.931576, 1, 0, 0, 1, 1,
1.201826, -0.003885243, 0.9077372, 0, 0, 0, 1, 1,
1.202483, -0.2317335, 2.178675, 0, 0, 0, 1, 1,
1.205124, 1.60541, 1.314517, 0, 0, 0, 1, 1,
1.215921, -1.560448, 2.833437, 0, 0, 0, 1, 1,
1.22612, -0.2558529, 3.893908, 0, 0, 0, 1, 1,
1.231164, -0.7557015, 2.028567, 0, 0, 0, 1, 1,
1.231893, 0.9658208, 1.333929, 0, 0, 0, 1, 1,
1.23194, -0.04912926, 2.112591, 1, 1, 1, 1, 1,
1.233744, -0.6445038, 0.4760804, 1, 1, 1, 1, 1,
1.244347, -0.7524093, -0.7113454, 1, 1, 1, 1, 1,
1.247038, 0.1850579, 3.326307, 1, 1, 1, 1, 1,
1.247983, 0.4590492, 0.5976312, 1, 1, 1, 1, 1,
1.256018, -0.2410824, 0.4904578, 1, 1, 1, 1, 1,
1.261582, 1.217103, 0.3414246, 1, 1, 1, 1, 1,
1.267079, 1.727684, 1.661317, 1, 1, 1, 1, 1,
1.283074, -0.2245703, 1.221259, 1, 1, 1, 1, 1,
1.290329, 0.4546169, 2.373092, 1, 1, 1, 1, 1,
1.291876, -0.7748039, -0.06143668, 1, 1, 1, 1, 1,
1.297953, 1.167776, 1.115612, 1, 1, 1, 1, 1,
1.298676, -2.612704, 2.147441, 1, 1, 1, 1, 1,
1.303465, -1.280641, 1.212709, 1, 1, 1, 1, 1,
1.304281, 0.2898219, -0.2362663, 1, 1, 1, 1, 1,
1.305343, -0.9825174, 2.079258, 0, 0, 1, 1, 1,
1.306046, 0.2921466, 1.45089, 1, 0, 0, 1, 1,
1.319789, 0.3540153, 1.766327, 1, 0, 0, 1, 1,
1.32598, -0.2754412, 2.850427, 1, 0, 0, 1, 1,
1.335729, 1.118359, 0.01406884, 1, 0, 0, 1, 1,
1.339386, 0.374419, 0.8648085, 1, 0, 0, 1, 1,
1.340907, 0.6021487, 1.25214, 0, 0, 0, 1, 1,
1.347403, 2.224101, 2.659963, 0, 0, 0, 1, 1,
1.347427, 0.2656125, 1.415712, 0, 0, 0, 1, 1,
1.349385, -0.02731971, 1.712702, 0, 0, 0, 1, 1,
1.358519, -0.08316248, 2.092078, 0, 0, 0, 1, 1,
1.359797, -1.732619, 4.338371, 0, 0, 0, 1, 1,
1.362838, -1.076045, 1.855176, 0, 0, 0, 1, 1,
1.364994, -1.665866, 3.473253, 1, 1, 1, 1, 1,
1.371001, -1.165599, 2.297826, 1, 1, 1, 1, 1,
1.388721, -0.9468889, 2.603159, 1, 1, 1, 1, 1,
1.388865, -0.1737347, 1.492918, 1, 1, 1, 1, 1,
1.394644, -0.2498129, 2.116994, 1, 1, 1, 1, 1,
1.404914, -0.3318466, 1.68225, 1, 1, 1, 1, 1,
1.407885, 0.4166793, -1.521297, 1, 1, 1, 1, 1,
1.418506, -0.7440363, 2.35274, 1, 1, 1, 1, 1,
1.419459, 0.949873, 0.2599213, 1, 1, 1, 1, 1,
1.426919, 1.843244, 0.4256612, 1, 1, 1, 1, 1,
1.427243, 0.4970937, 2.928125, 1, 1, 1, 1, 1,
1.42859, 1.811802, -0.6093454, 1, 1, 1, 1, 1,
1.430476, 1.040688, 1.230384, 1, 1, 1, 1, 1,
1.431541, -0.08672115, 1.486259, 1, 1, 1, 1, 1,
1.435149, -0.4079268, 3.610542, 1, 1, 1, 1, 1,
1.437653, -1.940269, 2.048083, 0, 0, 1, 1, 1,
1.441618, 0.851922, 1.271763, 1, 0, 0, 1, 1,
1.456034, -0.9585603, 2.828028, 1, 0, 0, 1, 1,
1.457616, 0.8889874, -0.7487539, 1, 0, 0, 1, 1,
1.461436, -0.8698379, 1.936769, 1, 0, 0, 1, 1,
1.462512, -0.5055344, 2.749188, 1, 0, 0, 1, 1,
1.469293, -0.4044435, 3.460261, 0, 0, 0, 1, 1,
1.474065, 0.6733742, 1.589926, 0, 0, 0, 1, 1,
1.474726, 1.053549, 0.2802909, 0, 0, 0, 1, 1,
1.478983, 0.8709174, -0.6022822, 0, 0, 0, 1, 1,
1.482114, 0.4768995, 2.445285, 0, 0, 0, 1, 1,
1.487909, 1.165854, 0.3171479, 0, 0, 0, 1, 1,
1.495183, 0.139948, 2.060013, 0, 0, 0, 1, 1,
1.496591, -1.530159, 2.320563, 1, 1, 1, 1, 1,
1.524956, -0.6958239, 1.584339, 1, 1, 1, 1, 1,
1.537503, 1.370699, 0.7082936, 1, 1, 1, 1, 1,
1.544651, -1.099429, 2.567305, 1, 1, 1, 1, 1,
1.552604, -1.647308, 3.837039, 1, 1, 1, 1, 1,
1.559298, 0.4597956, 1.345604, 1, 1, 1, 1, 1,
1.561039, -1.531933, 1.144613, 1, 1, 1, 1, 1,
1.564446, -1.128102, -1.223904, 1, 1, 1, 1, 1,
1.578594, 0.1105451, 1.424289, 1, 1, 1, 1, 1,
1.579138, -0.8674832, 1.407158, 1, 1, 1, 1, 1,
1.59113, 0.7639465, 1.510141, 1, 1, 1, 1, 1,
1.599603, -1.49311, 1.575936, 1, 1, 1, 1, 1,
1.613837, -0.4981419, 3.419027, 1, 1, 1, 1, 1,
1.616777, -2.336654, 3.579963, 1, 1, 1, 1, 1,
1.64356, -1.16541, 1.415961, 1, 1, 1, 1, 1,
1.643596, -0.9679903, 1.291361, 0, 0, 1, 1, 1,
1.649228, 1.873247, 1.220483, 1, 0, 0, 1, 1,
1.652428, -1.519463, 0.6938443, 1, 0, 0, 1, 1,
1.662024, -0.4920964, 2.245515, 1, 0, 0, 1, 1,
1.670862, -1.419759, 1.807557, 1, 0, 0, 1, 1,
1.671684, 1.216311, 0.6406189, 1, 0, 0, 1, 1,
1.686627, 0.850961, 0.8756522, 0, 0, 0, 1, 1,
1.705649, -0.5238516, 0.9122476, 0, 0, 0, 1, 1,
1.708589, -1.573324, 1.45778, 0, 0, 0, 1, 1,
1.711745, 0.07727885, -0.5911893, 0, 0, 0, 1, 1,
1.730576, -1.027483, 1.365436, 0, 0, 0, 1, 1,
1.778259, 1.256335, 1.965091, 0, 0, 0, 1, 1,
1.805827, -0.1822363, 0.698532, 0, 0, 0, 1, 1,
1.843572, -1.762961, 1.621196, 1, 1, 1, 1, 1,
1.846027, -1.475714, 2.192547, 1, 1, 1, 1, 1,
1.847816, 1.206787, 0.2006192, 1, 1, 1, 1, 1,
1.852838, 0.09898974, 1.831065, 1, 1, 1, 1, 1,
1.871997, -0.0223719, 0.434734, 1, 1, 1, 1, 1,
1.878287, -1.08685, 1.590003, 1, 1, 1, 1, 1,
1.888492, -0.4969233, 1.278191, 1, 1, 1, 1, 1,
1.910441, 0.138041, 1.254626, 1, 1, 1, 1, 1,
1.923074, 0.1079194, 2.885073, 1, 1, 1, 1, 1,
1.933036, 0.2008575, 1.631028, 1, 1, 1, 1, 1,
1.938016, 0.596168, 0.2820502, 1, 1, 1, 1, 1,
1.950373, 1.114571, 1.759197, 1, 1, 1, 1, 1,
1.959785, -0.2116226, 2.077862, 1, 1, 1, 1, 1,
1.975028, 0.4056607, 1.552711, 1, 1, 1, 1, 1,
1.986125, -0.6491296, 3.233477, 1, 1, 1, 1, 1,
2.011734, 1.001993, 1.80142, 0, 0, 1, 1, 1,
2.01712, -0.4329565, 0.5864955, 1, 0, 0, 1, 1,
2.02357, 0.004565252, 1.443408, 1, 0, 0, 1, 1,
2.031046, -0.638984, 0.6220666, 1, 0, 0, 1, 1,
2.080245, 0.8863069, 0.5756165, 1, 0, 0, 1, 1,
2.086259, 1.861034, 0.4327287, 1, 0, 0, 1, 1,
2.090702, -1.580256, 3.37467, 0, 0, 0, 1, 1,
2.113839, -0.8222856, 2.28679, 0, 0, 0, 1, 1,
2.183025, -0.6006492, 3.867987, 0, 0, 0, 1, 1,
2.197161, -0.1381904, 2.048791, 0, 0, 0, 1, 1,
2.22491, 1.354567, 0.2131886, 0, 0, 0, 1, 1,
2.23406, -1.728433, 2.607936, 0, 0, 0, 1, 1,
2.277529, 1.369418, 2.571869, 0, 0, 0, 1, 1,
2.300434, 1.024179, 2.004318, 1, 1, 1, 1, 1,
2.408859, -2.611013, 0.8451802, 1, 1, 1, 1, 1,
2.451382, 0.9346014, 0.7081253, 1, 1, 1, 1, 1,
2.565942, 0.7665702, 1.384763, 1, 1, 1, 1, 1,
2.591044, 0.1624975, 2.235384, 1, 1, 1, 1, 1,
2.648889, 0.5287219, 2.396858, 1, 1, 1, 1, 1,
2.822619, 0.5912992, 2.209163, 1, 1, 1, 1, 1
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
var radius = 9.555865;
var distance = 33.56457;
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
mvMatrix.translate( 0.2946614, 0.4414735, -0.05264425 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56457);
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
