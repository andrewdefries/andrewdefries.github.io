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
-2.613926, -0.4951582, -1.680037, 1, 0, 0, 1,
-2.559983, 0.2608232, -1.982626, 1, 0.007843138, 0, 1,
-2.525217, -0.3169988, -1.180643, 1, 0.01176471, 0, 1,
-2.478995, -0.1753365, -3.540769, 1, 0.01960784, 0, 1,
-2.456816, -0.5178531, -2.731184, 1, 0.02352941, 0, 1,
-2.408598, -0.7073777, -2.059623, 1, 0.03137255, 0, 1,
-2.347917, 2.173398, -0.3803399, 1, 0.03529412, 0, 1,
-2.25127, -0.6640787, -2.652894, 1, 0.04313726, 0, 1,
-2.247052, 0.2062933, -2.801618, 1, 0.04705882, 0, 1,
-2.242913, -1.065027, -1.517374, 1, 0.05490196, 0, 1,
-2.224092, -0.3828497, -0.3465439, 1, 0.05882353, 0, 1,
-2.217536, 1.660079, -0.7915688, 1, 0.06666667, 0, 1,
-2.215801, 1.036869, -0.3038609, 1, 0.07058824, 0, 1,
-2.142976, -1.290238, -3.178786, 1, 0.07843138, 0, 1,
-2.105067, -1.056973, -3.322693, 1, 0.08235294, 0, 1,
-2.091367, -0.1874245, -1.131657, 1, 0.09019608, 0, 1,
-2.066536, 0.4127341, -1.39353, 1, 0.09411765, 0, 1,
-2.059939, -0.05014558, -1.581945, 1, 0.1019608, 0, 1,
-2.016245, 0.006460316, -2.319159, 1, 0.1098039, 0, 1,
-2.003381, -0.8082726, -1.813143, 1, 0.1137255, 0, 1,
-1.974644, 0.1920407, -0.7463982, 1, 0.1215686, 0, 1,
-1.923672, -0.3624326, -1.346363, 1, 0.1254902, 0, 1,
-1.923249, -0.240546, -0.5848206, 1, 0.1333333, 0, 1,
-1.912095, 1.022997, -0.3717926, 1, 0.1372549, 0, 1,
-1.893927, 0.0701332, -1.717024, 1, 0.145098, 0, 1,
-1.887591, 0.8753458, 1.311992, 1, 0.1490196, 0, 1,
-1.88612, -0.8863142, -3.444601, 1, 0.1568628, 0, 1,
-1.879074, 0.03737272, -2.774739, 1, 0.1607843, 0, 1,
-1.873945, -0.8315964, -3.306264, 1, 0.1686275, 0, 1,
-1.853049, -0.4012288, -2.115731, 1, 0.172549, 0, 1,
-1.822684, -1.597172, -3.777276, 1, 0.1803922, 0, 1,
-1.821201, -0.6169069, -2.356852, 1, 0.1843137, 0, 1,
-1.81828, -1.439685, -1.463459, 1, 0.1921569, 0, 1,
-1.817149, -1.809807, -3.489658, 1, 0.1960784, 0, 1,
-1.810004, 1.450107, -1.10988, 1, 0.2039216, 0, 1,
-1.807872, 0.2155933, -0.775891, 1, 0.2117647, 0, 1,
-1.8, 0.861648, -0.3286317, 1, 0.2156863, 0, 1,
-1.783517, 0.2074237, -0.2860006, 1, 0.2235294, 0, 1,
-1.750327, -0.2456228, 0.3522421, 1, 0.227451, 0, 1,
-1.748265, 0.4998702, -1.13465, 1, 0.2352941, 0, 1,
-1.739965, -1.67003, -1.769163, 1, 0.2392157, 0, 1,
-1.726962, -1.902015, -3.650835, 1, 0.2470588, 0, 1,
-1.703962, 0.6090724, -1.530888, 1, 0.2509804, 0, 1,
-1.700954, -0.3590539, -0.8085598, 1, 0.2588235, 0, 1,
-1.687225, 0.4498228, -1.11277, 1, 0.2627451, 0, 1,
-1.661632, 0.1496331, -1.647834, 1, 0.2705882, 0, 1,
-1.647255, -0.2790706, -2.076748, 1, 0.2745098, 0, 1,
-1.641884, -1.270243, -1.367811, 1, 0.282353, 0, 1,
-1.63837, 2.65364, -3.267922, 1, 0.2862745, 0, 1,
-1.631252, -0.2700794, -2.870955, 1, 0.2941177, 0, 1,
-1.624544, -0.3584737, -1.1647, 1, 0.3019608, 0, 1,
-1.622265, -1.034513, -1.748299, 1, 0.3058824, 0, 1,
-1.613983, 0.1420982, 0.1228889, 1, 0.3137255, 0, 1,
-1.603501, 0.07541758, -0.5832471, 1, 0.3176471, 0, 1,
-1.58879, 1.228074, -2.46477, 1, 0.3254902, 0, 1,
-1.56313, -0.6975031, -2.320756, 1, 0.3294118, 0, 1,
-1.558813, -0.2372442, -1.352, 1, 0.3372549, 0, 1,
-1.552355, -0.1567966, -3.039443, 1, 0.3411765, 0, 1,
-1.533701, -0.8313149, -3.116785, 1, 0.3490196, 0, 1,
-1.514019, -1.630305, -2.919408, 1, 0.3529412, 0, 1,
-1.512226, -0.5469359, -1.993526, 1, 0.3607843, 0, 1,
-1.506501, 1.291392, 0.02488814, 1, 0.3647059, 0, 1,
-1.505558, 0.9838639, -0.8932722, 1, 0.372549, 0, 1,
-1.501786, 0.9922686, -0.6774598, 1, 0.3764706, 0, 1,
-1.499892, -1.407781, -2.056169, 1, 0.3843137, 0, 1,
-1.480994, 0.9473044, -2.146884, 1, 0.3882353, 0, 1,
-1.474439, 2.071837, -0.7045665, 1, 0.3960784, 0, 1,
-1.468871, 0.834236, -0.9582813, 1, 0.4039216, 0, 1,
-1.466739, 0.8776013, -0.8516622, 1, 0.4078431, 0, 1,
-1.466703, -0.5508596, -3.197247, 1, 0.4156863, 0, 1,
-1.459709, -0.8892908, -1.286713, 1, 0.4196078, 0, 1,
-1.45817, -0.6063406, -1.838077, 1, 0.427451, 0, 1,
-1.451089, -0.2808758, -0.982897, 1, 0.4313726, 0, 1,
-1.429034, -0.1888406, -1.256442, 1, 0.4392157, 0, 1,
-1.422794, 0.5594494, -2.190009, 1, 0.4431373, 0, 1,
-1.391071, -0.7970979, -2.280012, 1, 0.4509804, 0, 1,
-1.381264, -0.8375302, -3.09045, 1, 0.454902, 0, 1,
-1.381064, 0.2641851, -1.02853, 1, 0.4627451, 0, 1,
-1.37808, 0.4591883, -0.6385176, 1, 0.4666667, 0, 1,
-1.369757, -0.15543, -1.645462, 1, 0.4745098, 0, 1,
-1.368706, 0.3637925, -2.85014, 1, 0.4784314, 0, 1,
-1.368436, 0.6289847, -1.955346, 1, 0.4862745, 0, 1,
-1.365699, 0.2272746, -1.607753, 1, 0.4901961, 0, 1,
-1.365317, 1.277861, -2.27158, 1, 0.4980392, 0, 1,
-1.362131, -0.1393695, -1.85107, 1, 0.5058824, 0, 1,
-1.353686, -0.8580866, -0.7620431, 1, 0.509804, 0, 1,
-1.343061, -0.3709618, -4.561638, 1, 0.5176471, 0, 1,
-1.331846, -0.01777621, -2.989976, 1, 0.5215687, 0, 1,
-1.331489, 2.538368, 0.5086373, 1, 0.5294118, 0, 1,
-1.322601, -0.8974192, -1.561305, 1, 0.5333334, 0, 1,
-1.314138, 1.047973, -0.6684478, 1, 0.5411765, 0, 1,
-1.314119, 0.7200813, -2.809468, 1, 0.5450981, 0, 1,
-1.312466, -0.07123223, -1.119718, 1, 0.5529412, 0, 1,
-1.309096, -0.5516289, -2.850516, 1, 0.5568628, 0, 1,
-1.301939, 1.634093, 0.6551042, 1, 0.5647059, 0, 1,
-1.301775, -0.2433734, -1.67772, 1, 0.5686275, 0, 1,
-1.289981, 0.2724143, -1.200116, 1, 0.5764706, 0, 1,
-1.289979, 0.835458, -0.6865748, 1, 0.5803922, 0, 1,
-1.289242, -0.8586062, -2.164643, 1, 0.5882353, 0, 1,
-1.284531, 0.15462, -1.438907, 1, 0.5921569, 0, 1,
-1.280996, -0.5626498, -1.196333, 1, 0.6, 0, 1,
-1.276407, -0.1821445, -2.465033, 1, 0.6078432, 0, 1,
-1.264651, -1.729187, -2.684121, 1, 0.6117647, 0, 1,
-1.261966, 0.2640538, -2.786953, 1, 0.6196079, 0, 1,
-1.260443, -0.3519688, -1.392435, 1, 0.6235294, 0, 1,
-1.259878, 0.2871183, -1.723831, 1, 0.6313726, 0, 1,
-1.252847, 0.7476564, -2.087858, 1, 0.6352941, 0, 1,
-1.248574, 0.9888669, -1.491869, 1, 0.6431373, 0, 1,
-1.246742, -0.2952146, -1.967413, 1, 0.6470588, 0, 1,
-1.235456, -0.9339157, -1.993618, 1, 0.654902, 0, 1,
-1.234688, 0.4611163, -1.855687, 1, 0.6588235, 0, 1,
-1.232636, -0.2310697, -1.118325, 1, 0.6666667, 0, 1,
-1.220497, 0.6831462, -1.024172, 1, 0.6705883, 0, 1,
-1.218108, -1.570469, -3.162669, 1, 0.6784314, 0, 1,
-1.204192, -0.1279908, -3.039594, 1, 0.682353, 0, 1,
-1.200887, -0.7402546, -2.525799, 1, 0.6901961, 0, 1,
-1.194924, -1.380706, -1.966638, 1, 0.6941177, 0, 1,
-1.187585, 0.3353804, -1.854045, 1, 0.7019608, 0, 1,
-1.186371, 1.964728, -0.6922022, 1, 0.7098039, 0, 1,
-1.180478, 1.193538, -0.6088675, 1, 0.7137255, 0, 1,
-1.179491, -0.9494143, -2.231685, 1, 0.7215686, 0, 1,
-1.178142, -0.01132692, -2.532832, 1, 0.7254902, 0, 1,
-1.176419, 0.5371876, -1.316953, 1, 0.7333333, 0, 1,
-1.172685, -0.4570891, -2.424921, 1, 0.7372549, 0, 1,
-1.167922, -1.138382, -2.356591, 1, 0.7450981, 0, 1,
-1.16417, -0.5704347, -1.974264, 1, 0.7490196, 0, 1,
-1.16237, -1.119585, -3.594713, 1, 0.7568628, 0, 1,
-1.153765, -1.259991, -1.895394, 1, 0.7607843, 0, 1,
-1.149353, 0.08031406, -1.068306, 1, 0.7686275, 0, 1,
-1.141549, 2.023445, -0.6903409, 1, 0.772549, 0, 1,
-1.138367, -0.1418627, -1.943063, 1, 0.7803922, 0, 1,
-1.133072, -1.856487, -2.510957, 1, 0.7843137, 0, 1,
-1.132479, -0.08668993, -0.2022213, 1, 0.7921569, 0, 1,
-1.129851, -1.148986, -1.905709, 1, 0.7960784, 0, 1,
-1.120934, -0.2599948, -2.003726, 1, 0.8039216, 0, 1,
-1.112708, -1.355826, -0.792235, 1, 0.8117647, 0, 1,
-1.106219, -0.4315993, -2.674767, 1, 0.8156863, 0, 1,
-1.105667, -0.8321295, -1.763165, 1, 0.8235294, 0, 1,
-1.105038, -1.354826, -2.40541, 1, 0.827451, 0, 1,
-1.103163, 0.7183008, -0.5990679, 1, 0.8352941, 0, 1,
-1.092574, 1.385041, -0.2658049, 1, 0.8392157, 0, 1,
-1.088707, 0.05423714, -1.551926, 1, 0.8470588, 0, 1,
-1.086103, 1.200853, -1.536952, 1, 0.8509804, 0, 1,
-1.083345, -0.4482298, -2.038023, 1, 0.8588235, 0, 1,
-1.078565, -0.3188974, -1.241758, 1, 0.8627451, 0, 1,
-1.072434, 0.04917737, -1.192668, 1, 0.8705882, 0, 1,
-1.072037, 0.8604144, -0.3978873, 1, 0.8745098, 0, 1,
-1.063261, -0.4138489, -2.774438, 1, 0.8823529, 0, 1,
-1.060889, 0.8659101, -0.292247, 1, 0.8862745, 0, 1,
-1.059068, 0.809333, -2.772147, 1, 0.8941177, 0, 1,
-1.041903, -1.366341, -2.487068, 1, 0.8980392, 0, 1,
-1.038246, 0.9795767, 0.1855297, 1, 0.9058824, 0, 1,
-1.036618, -1.939922, -2.208329, 1, 0.9137255, 0, 1,
-1.03131, -0.2949311, -1.090818, 1, 0.9176471, 0, 1,
-1.030143, 0.3977021, 2.260188, 1, 0.9254902, 0, 1,
-1.028976, 0.7903685, -1.193721, 1, 0.9294118, 0, 1,
-1.024357, 0.6189249, -1.591238, 1, 0.9372549, 0, 1,
-1.02157, 0.564156, -2.396969, 1, 0.9411765, 0, 1,
-1.011796, 1.034908, -0.213909, 1, 0.9490196, 0, 1,
-1.008078, 0.864287, 0.1035471, 1, 0.9529412, 0, 1,
-1.003828, -0.7037142, -2.720969, 1, 0.9607843, 0, 1,
-0.9993046, 1.128683, -1.048062, 1, 0.9647059, 0, 1,
-0.9960343, -0.6263544, -2.248354, 1, 0.972549, 0, 1,
-0.9859682, -0.3660415, -1.953185, 1, 0.9764706, 0, 1,
-0.9845006, -0.4316591, -1.3623, 1, 0.9843137, 0, 1,
-0.9760826, 1.64079, -0.7933354, 1, 0.9882353, 0, 1,
-0.9760576, 0.4844179, -1.876779, 1, 0.9960784, 0, 1,
-0.9711165, -1.928758, -2.669583, 0.9960784, 1, 0, 1,
-0.961166, -0.4581089, -1.810652, 0.9921569, 1, 0, 1,
-0.9595467, 0.2409182, -2.758902, 0.9843137, 1, 0, 1,
-0.9576343, 0.09644734, -1.48986, 0.9803922, 1, 0, 1,
-0.9544381, 0.9872767, -2.073823, 0.972549, 1, 0, 1,
-0.9520747, 0.26932, -2.101046, 0.9686275, 1, 0, 1,
-0.9497209, 2.35517, -0.4165003, 0.9607843, 1, 0, 1,
-0.9478824, -0.002421134, -1.832767, 0.9568627, 1, 0, 1,
-0.9473323, 0.2923559, -2.387698, 0.9490196, 1, 0, 1,
-0.9468961, 0.6450313, -1.754651, 0.945098, 1, 0, 1,
-0.9422769, -0.771419, -1.293634, 0.9372549, 1, 0, 1,
-0.9354845, -1.387192, -1.536135, 0.9333333, 1, 0, 1,
-0.9295655, -1.478344, -2.694315, 0.9254902, 1, 0, 1,
-0.9238889, 0.4644266, -0.6069818, 0.9215686, 1, 0, 1,
-0.9223423, -0.8508385, -1.979246, 0.9137255, 1, 0, 1,
-0.9178665, -0.1912912, -1.992348, 0.9098039, 1, 0, 1,
-0.9140192, 0.05436146, -0.231743, 0.9019608, 1, 0, 1,
-0.9125178, 1.324917, -1.392448, 0.8941177, 1, 0, 1,
-0.911048, 0.4976876, -1.820119, 0.8901961, 1, 0, 1,
-0.9038873, -2.489789, -4.564707, 0.8823529, 1, 0, 1,
-0.9003343, 0.5914325, -0.224903, 0.8784314, 1, 0, 1,
-0.8988227, -2.139843, -2.762926, 0.8705882, 1, 0, 1,
-0.8879983, 0.8205144, 1.399028, 0.8666667, 1, 0, 1,
-0.8871558, 1.767721, -2.70483, 0.8588235, 1, 0, 1,
-0.886621, 0.7444365, -2.026838, 0.854902, 1, 0, 1,
-0.8753995, 0.3395742, -2.700204, 0.8470588, 1, 0, 1,
-0.8751643, -0.5969207, -1.270694, 0.8431373, 1, 0, 1,
-0.8719682, 1.108267, -0.007438253, 0.8352941, 1, 0, 1,
-0.8684235, -0.827875, -3.058913, 0.8313726, 1, 0, 1,
-0.8635516, -0.2582056, -3.657452, 0.8235294, 1, 0, 1,
-0.8539122, -0.7526049, -1.451851, 0.8196079, 1, 0, 1,
-0.8497171, -0.5425998, -2.084909, 0.8117647, 1, 0, 1,
-0.8353625, 1.554792, -1.478176, 0.8078431, 1, 0, 1,
-0.8323295, 0.2982168, -2.113643, 0.8, 1, 0, 1,
-0.8321416, -1.262306, -2.13636, 0.7921569, 1, 0, 1,
-0.8293499, -0.9573079, -3.007844, 0.7882353, 1, 0, 1,
-0.8241627, -0.5706706, -1.66, 0.7803922, 1, 0, 1,
-0.815791, -0.3286958, -0.9045585, 0.7764706, 1, 0, 1,
-0.8143148, -1.460695, -3.394437, 0.7686275, 1, 0, 1,
-0.8139174, 1.813566, -1.08697, 0.7647059, 1, 0, 1,
-0.8129612, 0.7148715, -1.475174, 0.7568628, 1, 0, 1,
-0.8117391, 1.00927, 0.01158475, 0.7529412, 1, 0, 1,
-0.8102415, -0.9317812, -4.515224, 0.7450981, 1, 0, 1,
-0.8080804, 0.3444147, -0.8021663, 0.7411765, 1, 0, 1,
-0.8073953, -0.5067264, -3.588382, 0.7333333, 1, 0, 1,
-0.8070536, 0.3641241, 0.6254764, 0.7294118, 1, 0, 1,
-0.8039296, -1.046351, -1.435911, 0.7215686, 1, 0, 1,
-0.8036415, 1.139766, 2.486745, 0.7176471, 1, 0, 1,
-0.8033528, -0.288318, -1.334291, 0.7098039, 1, 0, 1,
-0.8001333, 1.699226, -0.2995085, 0.7058824, 1, 0, 1,
-0.7979572, -0.1279801, -1.009461, 0.6980392, 1, 0, 1,
-0.7961734, -0.883423, -3.744229, 0.6901961, 1, 0, 1,
-0.7940141, 0.07828401, -2.849638, 0.6862745, 1, 0, 1,
-0.7898339, -1.277657, -1.691797, 0.6784314, 1, 0, 1,
-0.7894691, -0.8621459, -3.246023, 0.6745098, 1, 0, 1,
-0.7879601, 0.5128327, -0.7925635, 0.6666667, 1, 0, 1,
-0.7853345, -0.8715681, -3.191002, 0.6627451, 1, 0, 1,
-0.7762905, -0.6007438, -2.894278, 0.654902, 1, 0, 1,
-0.7707485, -0.6214832, -2.439087, 0.6509804, 1, 0, 1,
-0.7688723, -0.09353868, -1.85148, 0.6431373, 1, 0, 1,
-0.7642338, -1.679287, -2.352938, 0.6392157, 1, 0, 1,
-0.7624457, -1.842688, -1.744576, 0.6313726, 1, 0, 1,
-0.7600555, 0.8705321, -1.50179, 0.627451, 1, 0, 1,
-0.7520503, -0.3834645, -0.9350145, 0.6196079, 1, 0, 1,
-0.7490778, -1.675739, -3.087762, 0.6156863, 1, 0, 1,
-0.7488587, -1.966304, -2.849596, 0.6078432, 1, 0, 1,
-0.742009, 0.6074833, 2.161928, 0.6039216, 1, 0, 1,
-0.7301551, 1.544336, -0.7475931, 0.5960785, 1, 0, 1,
-0.7294036, 2.119505, -2.28599, 0.5882353, 1, 0, 1,
-0.7268428, -0.4532676, -2.696867, 0.5843138, 1, 0, 1,
-0.7247648, 0.9464723, -0.7715786, 0.5764706, 1, 0, 1,
-0.7235424, 0.6377116, -1.143722, 0.572549, 1, 0, 1,
-0.7196489, 0.4491646, -2.892711, 0.5647059, 1, 0, 1,
-0.7154132, 0.237925, -1.863044, 0.5607843, 1, 0, 1,
-0.7120801, -0.1536085, -3.79822, 0.5529412, 1, 0, 1,
-0.7092059, -1.276781, -3.827733, 0.5490196, 1, 0, 1,
-0.7090693, 0.5186436, -0.3048831, 0.5411765, 1, 0, 1,
-0.7050979, 0.6810907, 0.5270122, 0.5372549, 1, 0, 1,
-0.703319, -0.1690162, -3.856159, 0.5294118, 1, 0, 1,
-0.7010952, -1.688553, -2.850275, 0.5254902, 1, 0, 1,
-0.6995927, 0.2355374, -0.7360454, 0.5176471, 1, 0, 1,
-0.6980717, -1.31982, -2.105786, 0.5137255, 1, 0, 1,
-0.6938672, -0.3363228, -0.6896121, 0.5058824, 1, 0, 1,
-0.6892749, 0.7309201, 0.105444, 0.5019608, 1, 0, 1,
-0.6889741, -1.80558, -3.624907, 0.4941176, 1, 0, 1,
-0.6837785, -0.2615024, -2.294734, 0.4862745, 1, 0, 1,
-0.6835318, 0.1247771, -0.3250595, 0.4823529, 1, 0, 1,
-0.6792427, -0.5145808, -2.345801, 0.4745098, 1, 0, 1,
-0.6780791, -0.678256, -2.576676, 0.4705882, 1, 0, 1,
-0.6752015, 1.290071, -0.6940663, 0.4627451, 1, 0, 1,
-0.6740326, -1.38159, -1.961416, 0.4588235, 1, 0, 1,
-0.6647465, 0.1449299, -3.570162, 0.4509804, 1, 0, 1,
-0.661503, -1.501943, -2.384111, 0.4470588, 1, 0, 1,
-0.6572334, -0.9615414, -3.837678, 0.4392157, 1, 0, 1,
-0.6564253, -0.837302, -0.7774546, 0.4352941, 1, 0, 1,
-0.6559073, 0.4451497, -1.01646, 0.427451, 1, 0, 1,
-0.6482551, 1.368684, -0.5156265, 0.4235294, 1, 0, 1,
-0.642515, 0.3399165, 0.4445288, 0.4156863, 1, 0, 1,
-0.6423193, -0.4010771, -1.46927, 0.4117647, 1, 0, 1,
-0.6417478, 1.000645, -1.170586, 0.4039216, 1, 0, 1,
-0.634518, -0.4924898, -1.782613, 0.3960784, 1, 0, 1,
-0.633756, 0.7478839, 0.7131885, 0.3921569, 1, 0, 1,
-0.6322406, 1.094603, -1.077098, 0.3843137, 1, 0, 1,
-0.6298944, -0.03161057, -1.986905, 0.3803922, 1, 0, 1,
-0.6289099, 1.254746, 0.8089854, 0.372549, 1, 0, 1,
-0.6265481, 1.145761, 0.1442786, 0.3686275, 1, 0, 1,
-0.6177378, -0.9043258, -2.47432, 0.3607843, 1, 0, 1,
-0.606746, -0.242452, -1.882197, 0.3568628, 1, 0, 1,
-0.6036681, -0.8507465, -2.894547, 0.3490196, 1, 0, 1,
-0.602302, 0.3059461, -0.4679493, 0.345098, 1, 0, 1,
-0.6022254, -0.4986978, -0.9790944, 0.3372549, 1, 0, 1,
-0.6019627, 1.223395, -1.012444, 0.3333333, 1, 0, 1,
-0.5906523, -1.5232, -2.1608, 0.3254902, 1, 0, 1,
-0.5903635, 0.4946644, -0.4390238, 0.3215686, 1, 0, 1,
-0.5900065, -0.1358328, -1.221844, 0.3137255, 1, 0, 1,
-0.5895064, -0.1864498, -1.089477, 0.3098039, 1, 0, 1,
-0.5836828, -0.4347777, -1.998585, 0.3019608, 1, 0, 1,
-0.5825713, 0.574882, -1.027146, 0.2941177, 1, 0, 1,
-0.5816789, 3.463984, 0.117963, 0.2901961, 1, 0, 1,
-0.5777069, -1.101497, -3.438131, 0.282353, 1, 0, 1,
-0.5734696, -0.4711197, -2.753222, 0.2784314, 1, 0, 1,
-0.5688897, -1.262233, -2.354432, 0.2705882, 1, 0, 1,
-0.5624893, 0.5094014, -1.520596, 0.2666667, 1, 0, 1,
-0.5615163, 0.02418054, -0.1638934, 0.2588235, 1, 0, 1,
-0.559028, -0.5405331, -2.128698, 0.254902, 1, 0, 1,
-0.5442791, 0.5497693, 0.232278, 0.2470588, 1, 0, 1,
-0.5439944, -0.5890296, -1.389989, 0.2431373, 1, 0, 1,
-0.5395176, -0.6622402, -2.542465, 0.2352941, 1, 0, 1,
-0.5368025, -0.05519299, -0.7000564, 0.2313726, 1, 0, 1,
-0.535291, 0.02739088, -1.005881, 0.2235294, 1, 0, 1,
-0.5317527, 0.006085243, 0.0703351, 0.2196078, 1, 0, 1,
-0.5299968, 1.441593, -1.491078, 0.2117647, 1, 0, 1,
-0.5270199, 1.537971, 0.149091, 0.2078431, 1, 0, 1,
-0.5269743, -1.401308, -2.334675, 0.2, 1, 0, 1,
-0.5205719, -1.546864, -0.9318076, 0.1921569, 1, 0, 1,
-0.5182309, 1.09905, -0.01835168, 0.1882353, 1, 0, 1,
-0.5180989, -0.7237367, -2.739481, 0.1803922, 1, 0, 1,
-0.5157908, -0.5192533, -4.201446, 0.1764706, 1, 0, 1,
-0.5151058, 0.7368563, 1.150957, 0.1686275, 1, 0, 1,
-0.5129294, -0.05657541, -3.063328, 0.1647059, 1, 0, 1,
-0.512189, 1.024585, -1.36262, 0.1568628, 1, 0, 1,
-0.5092273, 0.7242673, -0.760174, 0.1529412, 1, 0, 1,
-0.5068505, 1.830325, 0.336991, 0.145098, 1, 0, 1,
-0.506491, -1.141632, -3.29728, 0.1411765, 1, 0, 1,
-0.5048304, 0.2027256, -1.713595, 0.1333333, 1, 0, 1,
-0.5037309, 1.29799, 1.320273, 0.1294118, 1, 0, 1,
-0.498887, 1.55041, -1.131079, 0.1215686, 1, 0, 1,
-0.4949974, 0.9412453, -1.568113, 0.1176471, 1, 0, 1,
-0.4931503, 0.3370424, 0.166622, 0.1098039, 1, 0, 1,
-0.4840281, 0.02837398, -1.202683, 0.1058824, 1, 0, 1,
-0.4835589, -0.05886761, -4.196343, 0.09803922, 1, 0, 1,
-0.4822749, -0.7539727, -1.934328, 0.09019608, 1, 0, 1,
-0.4811857, 0.7122485, -0.2741302, 0.08627451, 1, 0, 1,
-0.479133, 0.3221165, -1.408252, 0.07843138, 1, 0, 1,
-0.4790522, -0.143238, -1.004308, 0.07450981, 1, 0, 1,
-0.4752044, 1.177729, -0.1500755, 0.06666667, 1, 0, 1,
-0.4751074, -0.8010699, -2.799564, 0.0627451, 1, 0, 1,
-0.4744895, 1.102991, 0.4106692, 0.05490196, 1, 0, 1,
-0.4735803, 1.070119, -0.9812606, 0.05098039, 1, 0, 1,
-0.4733381, -0.2781294, -3.156432, 0.04313726, 1, 0, 1,
-0.4723643, -0.6334347, -3.471538, 0.03921569, 1, 0, 1,
-0.4695247, 1.027329, -1.885052, 0.03137255, 1, 0, 1,
-0.4692682, 0.8187711, -1.602948, 0.02745098, 1, 0, 1,
-0.4681688, 0.0412908, -0.2138902, 0.01960784, 1, 0, 1,
-0.4677577, -0.6885937, -1.62747, 0.01568628, 1, 0, 1,
-0.4652201, -0.6007717, -3.572915, 0.007843138, 1, 0, 1,
-0.4604629, 1.693573, -1.653385, 0.003921569, 1, 0, 1,
-0.459449, 1.182327, -1.494837, 0, 1, 0.003921569, 1,
-0.4563496, 0.1346385, -1.796511, 0, 1, 0.01176471, 1,
-0.4561147, 1.437652, -0.04819013, 0, 1, 0.01568628, 1,
-0.4540924, -0.2266018, -1.482608, 0, 1, 0.02352941, 1,
-0.4512066, -0.3439191, -1.216274, 0, 1, 0.02745098, 1,
-0.4481099, 1.509472, -0.5314663, 0, 1, 0.03529412, 1,
-0.4480162, -0.07248843, -2.276276, 0, 1, 0.03921569, 1,
-0.4476255, 1.384007, 0.4327428, 0, 1, 0.04705882, 1,
-0.4443663, -0.0717565, -0.7909337, 0, 1, 0.05098039, 1,
-0.4441462, -1.417297, -2.498777, 0, 1, 0.05882353, 1,
-0.4434597, 0.1678904, 0.6893074, 0, 1, 0.0627451, 1,
-0.4430603, 0.4535726, -0.3725099, 0, 1, 0.07058824, 1,
-0.4420928, 1.385236, -1.137008, 0, 1, 0.07450981, 1,
-0.4379587, 0.04289512, -1.806626, 0, 1, 0.08235294, 1,
-0.4376799, -0.7185065, -3.56893, 0, 1, 0.08627451, 1,
-0.4367941, -0.7756386, -2.444012, 0, 1, 0.09411765, 1,
-0.4354105, 0.4469875, -0.3438975, 0, 1, 0.1019608, 1,
-0.4344302, 0.4834493, 0.08486928, 0, 1, 0.1058824, 1,
-0.4337612, 0.5793473, 0.04744953, 0, 1, 0.1137255, 1,
-0.4293937, -1.038594, -1.969957, 0, 1, 0.1176471, 1,
-0.4288307, 0.6263133, -1.158586, 0, 1, 0.1254902, 1,
-0.4272403, -1.653544, -3.205647, 0, 1, 0.1294118, 1,
-0.4229067, -1.873609, -1.723834, 0, 1, 0.1372549, 1,
-0.4225978, -1.025763, -1.829959, 0, 1, 0.1411765, 1,
-0.4212957, 0.8320426, -0.9512072, 0, 1, 0.1490196, 1,
-0.4184094, 0.6361527, 0.2345011, 0, 1, 0.1529412, 1,
-0.4177014, -2.252112, -3.402022, 0, 1, 0.1607843, 1,
-0.4156181, 1.369259, -1.698598, 0, 1, 0.1647059, 1,
-0.4135917, 0.4966102, -1.556471, 0, 1, 0.172549, 1,
-0.4119888, -1.100656, -3.537702, 0, 1, 0.1764706, 1,
-0.4112094, -0.7598633, -2.728365, 0, 1, 0.1843137, 1,
-0.4104281, -0.5146775, -3.101946, 0, 1, 0.1882353, 1,
-0.3981192, -0.6003909, -2.448035, 0, 1, 0.1960784, 1,
-0.3963219, 1.373085, 0.1952148, 0, 1, 0.2039216, 1,
-0.3929988, -1.064489, -1.727031, 0, 1, 0.2078431, 1,
-0.3929518, 2.10464, 1.163161, 0, 1, 0.2156863, 1,
-0.3890035, 0.672274, -1.779004, 0, 1, 0.2196078, 1,
-0.3869562, 0.3275625, -0.7516843, 0, 1, 0.227451, 1,
-0.3860537, 2.613952, -2.453494, 0, 1, 0.2313726, 1,
-0.3841539, -0.2905928, -1.376902, 0, 1, 0.2392157, 1,
-0.383786, 1.522484, -0.1758209, 0, 1, 0.2431373, 1,
-0.3825292, 1.2021, -0.6982627, 0, 1, 0.2509804, 1,
-0.3801621, -2.092363, -3.608685, 0, 1, 0.254902, 1,
-0.3770939, -0.7929252, -1.688223, 0, 1, 0.2627451, 1,
-0.3761849, -0.425795, -2.530826, 0, 1, 0.2666667, 1,
-0.3705938, 0.6998468, -0.4246518, 0, 1, 0.2745098, 1,
-0.3701659, 0.6009936, -0.6854156, 0, 1, 0.2784314, 1,
-0.3689847, 0.3099398, -2.075646, 0, 1, 0.2862745, 1,
-0.3686419, 0.2106426, -2.650722, 0, 1, 0.2901961, 1,
-0.3680927, 1.56437, -0.2744425, 0, 1, 0.2980392, 1,
-0.3607864, 1.867575, -0.4788919, 0, 1, 0.3058824, 1,
-0.3596148, -0.3978224, -2.385436, 0, 1, 0.3098039, 1,
-0.3565964, 1.09723, -2.367493, 0, 1, 0.3176471, 1,
-0.3527797, -0.2808398, -2.783353, 0, 1, 0.3215686, 1,
-0.3521004, -0.1355964, -2.376913, 0, 1, 0.3294118, 1,
-0.3516125, -0.6092961, -2.772117, 0, 1, 0.3333333, 1,
-0.3508273, 1.412129, 0.2013189, 0, 1, 0.3411765, 1,
-0.3484774, 0.2668568, -2.223575, 0, 1, 0.345098, 1,
-0.3444335, 1.235377, 0.4824863, 0, 1, 0.3529412, 1,
-0.3441583, -1.463978, -2.224796, 0, 1, 0.3568628, 1,
-0.3433362, 1.151466, 0.1507876, 0, 1, 0.3647059, 1,
-0.3424927, 0.830032, -0.4794718, 0, 1, 0.3686275, 1,
-0.3397754, 1.723857, 0.6653598, 0, 1, 0.3764706, 1,
-0.3293182, 1.556105, -0.9713199, 0, 1, 0.3803922, 1,
-0.3263145, -1.23472, -1.850334, 0, 1, 0.3882353, 1,
-0.319591, -1.012068, -2.844832, 0, 1, 0.3921569, 1,
-0.3185513, -0.7504606, -2.860109, 0, 1, 0.4, 1,
-0.3120217, -1.573183, -3.572318, 0, 1, 0.4078431, 1,
-0.3097487, 0.8189182, 0.3839742, 0, 1, 0.4117647, 1,
-0.3075266, -0.9348454, -3.92907, 0, 1, 0.4196078, 1,
-0.3034879, -1.054432, -5.230135, 0, 1, 0.4235294, 1,
-0.2994473, 0.6282058, 0.6459314, 0, 1, 0.4313726, 1,
-0.2972827, 0.7740092, -1.851629, 0, 1, 0.4352941, 1,
-0.2929215, 1.120824, -0.4085257, 0, 1, 0.4431373, 1,
-0.2916594, -0.8157551, -2.050851, 0, 1, 0.4470588, 1,
-0.2909698, -2.346224, -3.711244, 0, 1, 0.454902, 1,
-0.2787455, -0.2096468, -2.435523, 0, 1, 0.4588235, 1,
-0.2766108, -0.9264362, -3.135828, 0, 1, 0.4666667, 1,
-0.2757646, 0.1332393, -1.090938, 0, 1, 0.4705882, 1,
-0.2718559, -0.3385482, -3.929427, 0, 1, 0.4784314, 1,
-0.270185, 0.6678126, -1.092996, 0, 1, 0.4823529, 1,
-0.2691454, 0.2251749, -0.2882921, 0, 1, 0.4901961, 1,
-0.2670729, 0.2134645, -1.530666, 0, 1, 0.4941176, 1,
-0.2649884, -0.1279133, -1.991915, 0, 1, 0.5019608, 1,
-0.2601406, -0.2805265, 0.08144953, 0, 1, 0.509804, 1,
-0.2573094, 1.763836, 0.9774645, 0, 1, 0.5137255, 1,
-0.2569745, -2.423248, -2.897184, 0, 1, 0.5215687, 1,
-0.2567912, -0.5487063, -2.985607, 0, 1, 0.5254902, 1,
-0.2533881, 0.4352859, -0.2221176, 0, 1, 0.5333334, 1,
-0.2527236, -0.2290672, -3.55846, 0, 1, 0.5372549, 1,
-0.2517904, -0.2231801, -2.270318, 0, 1, 0.5450981, 1,
-0.2484424, 0.4294582, 0.2698846, 0, 1, 0.5490196, 1,
-0.2479014, 0.4184579, -0.6519547, 0, 1, 0.5568628, 1,
-0.2426034, 0.3474546, 0.570443, 0, 1, 0.5607843, 1,
-0.2410269, 2.158311, -1.814269, 0, 1, 0.5686275, 1,
-0.2336587, -0.2945185, -0.6074927, 0, 1, 0.572549, 1,
-0.2253353, -0.1222341, -1.349073, 0, 1, 0.5803922, 1,
-0.2140193, 0.1563877, -0.947634, 0, 1, 0.5843138, 1,
-0.2120949, -0.3687355, -3.964564, 0, 1, 0.5921569, 1,
-0.2115155, -0.6704721, -3.804941, 0, 1, 0.5960785, 1,
-0.2093742, 0.4585362, -1.280001, 0, 1, 0.6039216, 1,
-0.2081057, -0.7365651, -4.256085, 0, 1, 0.6117647, 1,
-0.2053342, -1.699783, -4.10182, 0, 1, 0.6156863, 1,
-0.2043811, 0.7654975, -0.3444792, 0, 1, 0.6235294, 1,
-0.1992238, 0.7857361, -0.980174, 0, 1, 0.627451, 1,
-0.197004, 0.2309736, 0.6900462, 0, 1, 0.6352941, 1,
-0.1965234, 0.2504806, -1.248279, 0, 1, 0.6392157, 1,
-0.1952269, -0.9015108, -2.750926, 0, 1, 0.6470588, 1,
-0.1908596, 0.04153796, -0.4326888, 0, 1, 0.6509804, 1,
-0.1901655, -0.2836577, -4.078335, 0, 1, 0.6588235, 1,
-0.1884231, 0.05888996, -2.244776, 0, 1, 0.6627451, 1,
-0.1824529, -0.8530179, -1.467456, 0, 1, 0.6705883, 1,
-0.1803845, -0.8265046, -4.290851, 0, 1, 0.6745098, 1,
-0.1802435, 1.213047, 0.6399007, 0, 1, 0.682353, 1,
-0.1772986, 0.474533, 0.6796646, 0, 1, 0.6862745, 1,
-0.1761456, -1.157649, -3.284717, 0, 1, 0.6941177, 1,
-0.1633216, 0.3963415, 0.6787543, 0, 1, 0.7019608, 1,
-0.1465024, 0.3771257, -0.6566238, 0, 1, 0.7058824, 1,
-0.1436446, -0.1491358, -2.605162, 0, 1, 0.7137255, 1,
-0.1410227, 1.091168, -0.5226858, 0, 1, 0.7176471, 1,
-0.1396487, -0.7973908, -2.72335, 0, 1, 0.7254902, 1,
-0.132383, -0.5701224, -1.990021, 0, 1, 0.7294118, 1,
-0.1317759, -0.4202586, -3.662333, 0, 1, 0.7372549, 1,
-0.1278756, 0.0783402, -1.482371, 0, 1, 0.7411765, 1,
-0.1246493, 0.5537006, 0.8106506, 0, 1, 0.7490196, 1,
-0.1241639, -1.083709, -1.75369, 0, 1, 0.7529412, 1,
-0.1224359, 0.1255488, 0.5229409, 0, 1, 0.7607843, 1,
-0.1213988, 0.4521888, -1.849292, 0, 1, 0.7647059, 1,
-0.1209865, 1.989702, 0.549671, 0, 1, 0.772549, 1,
-0.1203664, 0.6163715, 0.3414187, 0, 1, 0.7764706, 1,
-0.1173902, -3.048932, -2.615075, 0, 1, 0.7843137, 1,
-0.1155779, 0.2292303, -0.9426673, 0, 1, 0.7882353, 1,
-0.1153408, -0.205851, -2.393469, 0, 1, 0.7960784, 1,
-0.1109579, -0.1522266, -1.647615, 0, 1, 0.8039216, 1,
-0.107551, -0.3693149, -3.991344, 0, 1, 0.8078431, 1,
-0.1066482, 0.1143948, -1.775515, 0, 1, 0.8156863, 1,
-0.1060176, 0.09314038, -1.201982, 0, 1, 0.8196079, 1,
-0.1047989, -0.4239917, -3.641226, 0, 1, 0.827451, 1,
-0.1009413, 0.06771847, -1.056263, 0, 1, 0.8313726, 1,
-0.09708431, -0.8977751, -2.978785, 0, 1, 0.8392157, 1,
-0.09122311, 0.6932561, 0.2540529, 0, 1, 0.8431373, 1,
-0.08795156, -0.06922968, -3.40936, 0, 1, 0.8509804, 1,
-0.08414142, 2.405149, 1.216141, 0, 1, 0.854902, 1,
-0.08154842, -0.1021026, -2.97846, 0, 1, 0.8627451, 1,
-0.08104371, -0.9449303, -5.11902, 0, 1, 0.8666667, 1,
-0.07666872, -1.17107, -3.778981, 0, 1, 0.8745098, 1,
-0.0686496, -0.3412746, -2.056867, 0, 1, 0.8784314, 1,
-0.06782907, 0.01893467, -1.152646, 0, 1, 0.8862745, 1,
-0.0644939, 1.010409, 0.9518394, 0, 1, 0.8901961, 1,
-0.06438857, -1.707363, -3.948415, 0, 1, 0.8980392, 1,
-0.0632047, 0.1799188, -1.236765, 0, 1, 0.9058824, 1,
-0.06242592, 0.08059508, 0.3494451, 0, 1, 0.9098039, 1,
-0.05554948, 0.07530273, -1.495112, 0, 1, 0.9176471, 1,
-0.04259999, -2.449107, -2.651032, 0, 1, 0.9215686, 1,
-0.03781284, -1.238227, -3.144522, 0, 1, 0.9294118, 1,
-0.03643011, -0.3059502, -4.762633, 0, 1, 0.9333333, 1,
-0.03496933, -1.256257, -3.531956, 0, 1, 0.9411765, 1,
-0.03431308, 0.6832229, 0.9077682, 0, 1, 0.945098, 1,
-0.0316386, -0.4254004, -2.400004, 0, 1, 0.9529412, 1,
-0.02934732, 1.424086, -0.8335292, 0, 1, 0.9568627, 1,
-0.02546256, 0.6815918, -0.5117246, 0, 1, 0.9647059, 1,
-0.0236654, -0.2350354, -4.496303, 0, 1, 0.9686275, 1,
-0.02273649, -1.070005, -5.538664, 0, 1, 0.9764706, 1,
-0.02259584, 0.03111596, -0.5883018, 0, 1, 0.9803922, 1,
-0.02092897, 1.282858, 0.3654508, 0, 1, 0.9882353, 1,
-0.01852636, 0.01557174, -2.391893, 0, 1, 0.9921569, 1,
-0.01640187, 0.01967441, 0.4273524, 0, 1, 1, 1,
-0.009731987, 0.2058498, 1.149031, 0, 0.9921569, 1, 1,
-0.006336837, 1.214175, -1.31454, 0, 0.9882353, 1, 1,
-0.005852956, -0.7504954, -3.322989, 0, 0.9803922, 1, 1,
-0.004153382, 1.44196, 1.175211, 0, 0.9764706, 1, 1,
-0.00390751, 0.05819383, -0.3152554, 0, 0.9686275, 1, 1,
-0.001228324, -0.1456606, -2.779561, 0, 0.9647059, 1, 1,
-2.48339e-05, -0.2633899, -3.911295, 0, 0.9568627, 1, 1,
0.0004456032, 0.6753982, -0.007529875, 0, 0.9529412, 1, 1,
0.002981249, 1.225124, 0.3249494, 0, 0.945098, 1, 1,
0.006048722, 1.935021, 0.3914212, 0, 0.9411765, 1, 1,
0.006942182, -0.04675926, 3.532785, 0, 0.9333333, 1, 1,
0.00699449, 0.1076452, 0.07456965, 0, 0.9294118, 1, 1,
0.007744652, -0.002936768, 3.763348, 0, 0.9215686, 1, 1,
0.009690463, -0.3880658, 3.705647, 0, 0.9176471, 1, 1,
0.01274526, -0.6418285, 4.981142, 0, 0.9098039, 1, 1,
0.01580484, -0.3011072, 3.391114, 0, 0.9058824, 1, 1,
0.01764023, -0.7212007, 3.020804, 0, 0.8980392, 1, 1,
0.01832167, 0.3278415, -1.177051, 0, 0.8901961, 1, 1,
0.01858415, -0.9252433, 3.684355, 0, 0.8862745, 1, 1,
0.01887904, 0.9706792, -1.984957, 0, 0.8784314, 1, 1,
0.02206715, 2.322106, 0.1365322, 0, 0.8745098, 1, 1,
0.02423338, -1.80861, 2.145741, 0, 0.8666667, 1, 1,
0.02484642, 0.6939538, 0.2431896, 0, 0.8627451, 1, 1,
0.02795034, 0.002123101, 0.9792261, 0, 0.854902, 1, 1,
0.03444891, 0.01986976, 0.2305806, 0, 0.8509804, 1, 1,
0.04104137, 1.367661, -1.542665, 0, 0.8431373, 1, 1,
0.0484001, 0.8412349, -1.105427, 0, 0.8392157, 1, 1,
0.0501185, 1.434794, 0.1407304, 0, 0.8313726, 1, 1,
0.05054887, -0.7234042, 4.523662, 0, 0.827451, 1, 1,
0.05118345, 0.1536889, 1.056166, 0, 0.8196079, 1, 1,
0.05739384, 0.1438167, -0.03126659, 0, 0.8156863, 1, 1,
0.05793246, -0.4692493, 2.451347, 0, 0.8078431, 1, 1,
0.06109718, -0.1883683, 3.678855, 0, 0.8039216, 1, 1,
0.06151772, 1.337533, 0.4512311, 0, 0.7960784, 1, 1,
0.06458284, -0.7428458, 2.247478, 0, 0.7882353, 1, 1,
0.0665063, 0.1783267, -1.180466, 0, 0.7843137, 1, 1,
0.06731633, -0.5877876, 5.932256, 0, 0.7764706, 1, 1,
0.06967358, 0.4417918, -1.449274, 0, 0.772549, 1, 1,
0.06995464, 0.09560516, 1.175606, 0, 0.7647059, 1, 1,
0.07063425, 0.4093175, -1.756801, 0, 0.7607843, 1, 1,
0.07379533, -0.6595048, 2.150491, 0, 0.7529412, 1, 1,
0.08005991, 0.3754874, 0.2581289, 0, 0.7490196, 1, 1,
0.08006858, 2.113946, -0.8715459, 0, 0.7411765, 1, 1,
0.08542424, 0.1482325, 0.709388, 0, 0.7372549, 1, 1,
0.08558885, 0.7268577, 1.164925, 0, 0.7294118, 1, 1,
0.0856241, -0.8763, 1.236593, 0, 0.7254902, 1, 1,
0.08936707, -0.05823963, 2.521949, 0, 0.7176471, 1, 1,
0.0968755, 0.993045, -0.3026714, 0, 0.7137255, 1, 1,
0.09799467, -0.7771646, 3.370039, 0, 0.7058824, 1, 1,
0.09981655, 0.8749866, -1.444474, 0, 0.6980392, 1, 1,
0.1000458, -1.578964, 4.364095, 0, 0.6941177, 1, 1,
0.1017382, -0.924805, 3.00266, 0, 0.6862745, 1, 1,
0.1022579, -1.613192, 4.193347, 0, 0.682353, 1, 1,
0.1025362, 0.1783392, -1.270607, 0, 0.6745098, 1, 1,
0.1041292, 1.0054, 0.8289792, 0, 0.6705883, 1, 1,
0.1052141, 2.262617, 0.5648307, 0, 0.6627451, 1, 1,
0.1098761, 0.7266812, 1.948127, 0, 0.6588235, 1, 1,
0.1129882, -1.777546, 1.831636, 0, 0.6509804, 1, 1,
0.1141172, -0.4360721, 2.194027, 0, 0.6470588, 1, 1,
0.1176219, 0.3703023, 1.485369, 0, 0.6392157, 1, 1,
0.1176618, 1.475154, -1.415314, 0, 0.6352941, 1, 1,
0.1184426, -2.425611, 1.726585, 0, 0.627451, 1, 1,
0.1190864, -1.310702, 3.542594, 0, 0.6235294, 1, 1,
0.1203118, 0.3873547, -0.07949006, 0, 0.6156863, 1, 1,
0.1208404, -1.208364, 2.834997, 0, 0.6117647, 1, 1,
0.1216947, -0.7688841, 2.447735, 0, 0.6039216, 1, 1,
0.1288484, -0.5617498, 4.55476, 0, 0.5960785, 1, 1,
0.1296952, -1.048311, 1.628024, 0, 0.5921569, 1, 1,
0.1359385, 1.824767, -1.147351, 0, 0.5843138, 1, 1,
0.1360261, -1.310559, 3.990125, 0, 0.5803922, 1, 1,
0.1386538, 0.4909033, -0.8361324, 0, 0.572549, 1, 1,
0.1440758, 0.7092133, -0.7956562, 0, 0.5686275, 1, 1,
0.1443404, -0.06481463, 0.9742146, 0, 0.5607843, 1, 1,
0.1470019, 0.5696404, 1.00674, 0, 0.5568628, 1, 1,
0.1470841, -0.1650073, 2.968666, 0, 0.5490196, 1, 1,
0.1479231, -0.8900642, 4.309614, 0, 0.5450981, 1, 1,
0.1489626, -0.6140632, 4.208921, 0, 0.5372549, 1, 1,
0.1534099, 0.4208311, -0.3005033, 0, 0.5333334, 1, 1,
0.1540348, 1.122393, 2.570282, 0, 0.5254902, 1, 1,
0.154106, 0.7354553, 0.1135186, 0, 0.5215687, 1, 1,
0.1545255, -0.5191441, 2.132303, 0, 0.5137255, 1, 1,
0.1559879, -0.5030595, 2.478932, 0, 0.509804, 1, 1,
0.1577796, 0.5985693, -0.05539482, 0, 0.5019608, 1, 1,
0.1608414, 0.587689, -1.628888, 0, 0.4941176, 1, 1,
0.1632368, 1.194235, -1.613677, 0, 0.4901961, 1, 1,
0.1675904, -1.233465, 4.527007, 0, 0.4823529, 1, 1,
0.1694607, -0.9710186, 1.831232, 0, 0.4784314, 1, 1,
0.1731288, -2.209256, 1.593593, 0, 0.4705882, 1, 1,
0.1740103, -1.025483, 4.069482, 0, 0.4666667, 1, 1,
0.1752566, 1.013222, -0.6183749, 0, 0.4588235, 1, 1,
0.1798143, 0.04755672, 0.8351885, 0, 0.454902, 1, 1,
0.1830668, -1.099474, 1.83297, 0, 0.4470588, 1, 1,
0.1834772, 0.4422749, 1.045851, 0, 0.4431373, 1, 1,
0.1888111, -0.7907956, 2.231364, 0, 0.4352941, 1, 1,
0.1920129, -1.182769, 3.932815, 0, 0.4313726, 1, 1,
0.193519, 0.377636, 0.7485743, 0, 0.4235294, 1, 1,
0.195173, 0.9566194, -0.4723505, 0, 0.4196078, 1, 1,
0.1955248, 1.072406, -0.4432571, 0, 0.4117647, 1, 1,
0.1974855, 0.7360654, 1.992011, 0, 0.4078431, 1, 1,
0.2059762, -0.5830669, 3.199023, 0, 0.4, 1, 1,
0.2069839, 0.628868, 0.8160995, 0, 0.3921569, 1, 1,
0.2129389, 1.496195, -1.407773, 0, 0.3882353, 1, 1,
0.2158687, -0.786993, 2.010231, 0, 0.3803922, 1, 1,
0.2184597, -0.8835757, 2.080142, 0, 0.3764706, 1, 1,
0.2185174, 1.177625, 3.003521, 0, 0.3686275, 1, 1,
0.2198559, 0.3601732, 1.854924, 0, 0.3647059, 1, 1,
0.2225025, -0.56761, 1.361548, 0, 0.3568628, 1, 1,
0.2230544, 0.6031196, -0.5262586, 0, 0.3529412, 1, 1,
0.2260909, -1.488475, 2.651065, 0, 0.345098, 1, 1,
0.2296899, 0.2398839, 0.1300967, 0, 0.3411765, 1, 1,
0.2308549, -0.5080231, 2.74804, 0, 0.3333333, 1, 1,
0.2324897, 0.9050404, -0.2426066, 0, 0.3294118, 1, 1,
0.2333145, -0.3397761, 3.982284, 0, 0.3215686, 1, 1,
0.2352585, 1.874656, -0.06437229, 0, 0.3176471, 1, 1,
0.2367096, -0.1221415, 1.012657, 0, 0.3098039, 1, 1,
0.2390109, -2.386942, 3.835886, 0, 0.3058824, 1, 1,
0.2415038, -0.2591692, 0.3757811, 0, 0.2980392, 1, 1,
0.2502696, 0.1928779, 0.6068384, 0, 0.2901961, 1, 1,
0.2537956, 0.2577443, -0.007993075, 0, 0.2862745, 1, 1,
0.25471, 1.052301, 0.9705018, 0, 0.2784314, 1, 1,
0.2557758, 0.5053235, -0.1488794, 0, 0.2745098, 1, 1,
0.2566844, 1.168399, 1.664817, 0, 0.2666667, 1, 1,
0.2641778, -1.072294, 2.347927, 0, 0.2627451, 1, 1,
0.2688122, -0.1061691, 1.381126, 0, 0.254902, 1, 1,
0.2724848, -0.1000942, 1.356296, 0, 0.2509804, 1, 1,
0.2764229, -1.891136, 2.37669, 0, 0.2431373, 1, 1,
0.2773062, 0.0237755, 3.026782, 0, 0.2392157, 1, 1,
0.2785733, -0.292736, 2.569703, 0, 0.2313726, 1, 1,
0.2848891, 0.9860762, -0.6126417, 0, 0.227451, 1, 1,
0.2851838, -0.8836769, 1.417248, 0, 0.2196078, 1, 1,
0.2862996, 0.8296153, 0.04103402, 0, 0.2156863, 1, 1,
0.2885087, 0.859999, 0.3437107, 0, 0.2078431, 1, 1,
0.2889896, -0.1781292, 1.924519, 0, 0.2039216, 1, 1,
0.2896672, -1.535893, 2.920277, 0, 0.1960784, 1, 1,
0.2929845, -0.4618446, 3.823008, 0, 0.1882353, 1, 1,
0.2955405, -0.4586111, 2.993903, 0, 0.1843137, 1, 1,
0.2965827, 0.8124198, 0.4356265, 0, 0.1764706, 1, 1,
0.29681, 1.002908, -0.2756742, 0, 0.172549, 1, 1,
0.3040692, 0.2427626, 2.791277, 0, 0.1647059, 1, 1,
0.3074886, 0.6532116, 0.4581334, 0, 0.1607843, 1, 1,
0.3074932, -0.8116425, 1.477866, 0, 0.1529412, 1, 1,
0.3076912, -0.8413972, 3.210094, 0, 0.1490196, 1, 1,
0.3078669, 0.1188767, 3.183731, 0, 0.1411765, 1, 1,
0.3081462, -0.1979619, 1.436589, 0, 0.1372549, 1, 1,
0.3095802, 1.124298, 1.842092, 0, 0.1294118, 1, 1,
0.3113732, 0.3685215, 1.898711, 0, 0.1254902, 1, 1,
0.3123553, -1.754359, 2.491914, 0, 0.1176471, 1, 1,
0.3131632, 0.08505483, 1.042341, 0, 0.1137255, 1, 1,
0.3158328, -0.4063801, 3.159565, 0, 0.1058824, 1, 1,
0.316772, 1.291071, -0.7793602, 0, 0.09803922, 1, 1,
0.3209913, -1.286608, 2.974443, 0, 0.09411765, 1, 1,
0.3246541, 0.9221308, -1.452959, 0, 0.08627451, 1, 1,
0.3302815, 0.2893562, -0.3722938, 0, 0.08235294, 1, 1,
0.3343191, 0.2726009, -0.2305821, 0, 0.07450981, 1, 1,
0.3372767, -0.8189116, 3.503246, 0, 0.07058824, 1, 1,
0.337975, 0.9082258, -0.2127993, 0, 0.0627451, 1, 1,
0.3444475, -0.6054078, 2.758194, 0, 0.05882353, 1, 1,
0.3466837, -1.226032, 3.958555, 0, 0.05098039, 1, 1,
0.3505555, -1.196357, 4.811778, 0, 0.04705882, 1, 1,
0.3516975, 0.8825731, -0.6378577, 0, 0.03921569, 1, 1,
0.3518255, -1.431846, 2.282485, 0, 0.03529412, 1, 1,
0.3569236, -0.8115938, 1.64879, 0, 0.02745098, 1, 1,
0.3570829, -0.1316108, 1.061988, 0, 0.02352941, 1, 1,
0.3605678, -0.127144, 0.5708352, 0, 0.01568628, 1, 1,
0.3635364, -1.054654, 3.559919, 0, 0.01176471, 1, 1,
0.3674607, -0.643906, 2.051624, 0, 0.003921569, 1, 1,
0.3734158, -0.04645981, 2.089499, 0.003921569, 0, 1, 1,
0.3739299, 0.553147, 0.5482146, 0.007843138, 0, 1, 1,
0.3753443, -0.227366, 2.627697, 0.01568628, 0, 1, 1,
0.3807584, 0.3869045, 0.5720166, 0.01960784, 0, 1, 1,
0.3888611, 1.60329, 0.2812401, 0.02745098, 0, 1, 1,
0.3934844, -0.2943177, 2.243842, 0.03137255, 0, 1, 1,
0.3942183, -1.088433, 2.046524, 0.03921569, 0, 1, 1,
0.3963348, -1.132681, 3.543387, 0.04313726, 0, 1, 1,
0.4048778, 0.8852544, 0.06345922, 0.05098039, 0, 1, 1,
0.4063191, 0.6225615, 0.05279122, 0.05490196, 0, 1, 1,
0.4065259, 1.792467, 0.7108584, 0.0627451, 0, 1, 1,
0.406993, -0.1372009, 1.130624, 0.06666667, 0, 1, 1,
0.4158879, -0.6824425, 3.618723, 0.07450981, 0, 1, 1,
0.4209823, 1.786411, 0.3856355, 0.07843138, 0, 1, 1,
0.4263963, 0.1562113, 2.585458, 0.08627451, 0, 1, 1,
0.4271207, -0.252386, 1.296239, 0.09019608, 0, 1, 1,
0.4279294, 0.4164936, 0.875999, 0.09803922, 0, 1, 1,
0.4290283, 0.5891194, 1.367517, 0.1058824, 0, 1, 1,
0.4352628, -0.2365718, 3.082349, 0.1098039, 0, 1, 1,
0.4390754, -0.3332025, 1.129359, 0.1176471, 0, 1, 1,
0.4393536, -0.6659575, 2.85507, 0.1215686, 0, 1, 1,
0.4427944, -0.6335668, 1.434465, 0.1294118, 0, 1, 1,
0.4448542, -0.5681005, 2.848345, 0.1333333, 0, 1, 1,
0.4472745, -0.8243785, 3.596367, 0.1411765, 0, 1, 1,
0.451078, 1.450536, -0.1831717, 0.145098, 0, 1, 1,
0.454624, 0.5559573, 0.3556424, 0.1529412, 0, 1, 1,
0.4685861, 1.957133, 0.09972525, 0.1568628, 0, 1, 1,
0.469075, -1.506619, 1.078236, 0.1647059, 0, 1, 1,
0.4700103, 0.656428, 0.3027981, 0.1686275, 0, 1, 1,
0.4762381, 1.993285, 2.641177, 0.1764706, 0, 1, 1,
0.476925, 1.594793, -0.7717255, 0.1803922, 0, 1, 1,
0.4793031, 0.7443601, 0.8044077, 0.1882353, 0, 1, 1,
0.4798689, 0.4386642, 2.220098, 0.1921569, 0, 1, 1,
0.4802489, 0.5356549, 3.096149, 0.2, 0, 1, 1,
0.4865434, -0.8431157, 1.854692, 0.2078431, 0, 1, 1,
0.4866256, 0.6066462, 0.4168105, 0.2117647, 0, 1, 1,
0.4872532, -0.6679136, 2.665867, 0.2196078, 0, 1, 1,
0.4873478, 0.3588718, -0.1474334, 0.2235294, 0, 1, 1,
0.4912508, -0.1397637, 2.16197, 0.2313726, 0, 1, 1,
0.4946417, -1.098922, 1.825231, 0.2352941, 0, 1, 1,
0.4968266, 0.2381278, 3.044573, 0.2431373, 0, 1, 1,
0.4987991, 0.5572562, 1.845707, 0.2470588, 0, 1, 1,
0.5019826, -0.1054582, 2.249894, 0.254902, 0, 1, 1,
0.5049008, -0.4908633, 1.488908, 0.2588235, 0, 1, 1,
0.5066747, 0.44542, 1.594014, 0.2666667, 0, 1, 1,
0.5073372, 0.8243871, -0.594268, 0.2705882, 0, 1, 1,
0.5145587, 0.290256, 3.759779, 0.2784314, 0, 1, 1,
0.5162891, 1.113818, 1.143458, 0.282353, 0, 1, 1,
0.5176769, 1.583611, -0.239977, 0.2901961, 0, 1, 1,
0.5224782, 0.4851468, -0.4200761, 0.2941177, 0, 1, 1,
0.5230529, -0.3499496, 0.6749292, 0.3019608, 0, 1, 1,
0.5252491, 0.1712312, 3.410573, 0.3098039, 0, 1, 1,
0.5265767, -0.7706468, 2.997042, 0.3137255, 0, 1, 1,
0.5300513, -1.589734, 2.620085, 0.3215686, 0, 1, 1,
0.5396073, 0.3578008, 0.7211105, 0.3254902, 0, 1, 1,
0.5398573, -0.1626988, 2.625709, 0.3333333, 0, 1, 1,
0.5413837, -0.5465737, 2.139456, 0.3372549, 0, 1, 1,
0.5419259, -0.1945999, 1.449561, 0.345098, 0, 1, 1,
0.5432212, -1.137088, 2.311629, 0.3490196, 0, 1, 1,
0.546077, -0.01468256, 1.485624, 0.3568628, 0, 1, 1,
0.5487114, 0.540715, 2.201861, 0.3607843, 0, 1, 1,
0.5663249, -2.414944, 1.591838, 0.3686275, 0, 1, 1,
0.5667615, 1.750219, -0.2893533, 0.372549, 0, 1, 1,
0.5670344, 0.05408538, -0.3581681, 0.3803922, 0, 1, 1,
0.570805, 1.567833, 0.4319024, 0.3843137, 0, 1, 1,
0.574809, -1.400031, 2.221264, 0.3921569, 0, 1, 1,
0.5751012, 0.05725402, 1.137616, 0.3960784, 0, 1, 1,
0.5765612, 0.9876579, -0.127601, 0.4039216, 0, 1, 1,
0.5836523, -0.4168936, 3.334514, 0.4117647, 0, 1, 1,
0.5854673, 0.2811457, 2.352239, 0.4156863, 0, 1, 1,
0.5866593, 0.9554459, 0.3780404, 0.4235294, 0, 1, 1,
0.5907658, -0.3582158, 0.8730399, 0.427451, 0, 1, 1,
0.5925149, -0.7374879, 2.766271, 0.4352941, 0, 1, 1,
0.5942904, 0.9935634, -0.1467922, 0.4392157, 0, 1, 1,
0.59575, 0.8574313, -0.7099671, 0.4470588, 0, 1, 1,
0.5975503, -0.3635565, 1.268891, 0.4509804, 0, 1, 1,
0.6000639, -0.8178513, 2.759784, 0.4588235, 0, 1, 1,
0.6099936, -0.06173007, 3.992146, 0.4627451, 0, 1, 1,
0.6161726, -0.2305189, 2.907829, 0.4705882, 0, 1, 1,
0.61988, 1.641162, 0.2950293, 0.4745098, 0, 1, 1,
0.6255181, -0.4579504, 0.6240241, 0.4823529, 0, 1, 1,
0.6259863, -0.7866107, 2.471918, 0.4862745, 0, 1, 1,
0.6301329, -0.6328907, 1.489487, 0.4941176, 0, 1, 1,
0.6302552, 0.9291397, 0.6693617, 0.5019608, 0, 1, 1,
0.6306676, 0.4632403, 0.7430565, 0.5058824, 0, 1, 1,
0.6328813, 0.1679676, 0.7958715, 0.5137255, 0, 1, 1,
0.6337734, 0.5931522, 1.600391, 0.5176471, 0, 1, 1,
0.6420219, 1.351068, -0.5602993, 0.5254902, 0, 1, 1,
0.6451431, -0.1761672, 0.7272663, 0.5294118, 0, 1, 1,
0.6456224, -1.991495, 2.530724, 0.5372549, 0, 1, 1,
0.6458442, 0.2084506, -0.5133759, 0.5411765, 0, 1, 1,
0.6628534, -1.565246, 2.27547, 0.5490196, 0, 1, 1,
0.6634361, 0.03576666, 0.390897, 0.5529412, 0, 1, 1,
0.6649396, 0.217445, 1.279968, 0.5607843, 0, 1, 1,
0.6693375, -1.304327, 0.5997815, 0.5647059, 0, 1, 1,
0.6695313, -0.2798823, 1.470629, 0.572549, 0, 1, 1,
0.6748066, -0.9322778, 1.904276, 0.5764706, 0, 1, 1,
0.675213, -1.400582, 1.729549, 0.5843138, 0, 1, 1,
0.6783031, -1.408311, 3.650191, 0.5882353, 0, 1, 1,
0.6783958, 1.58033, 0.03390868, 0.5960785, 0, 1, 1,
0.6824254, 2.534784, -0.3071523, 0.6039216, 0, 1, 1,
0.6826763, -0.5402364, 1.441468, 0.6078432, 0, 1, 1,
0.6838965, 0.7955331, 2.018121, 0.6156863, 0, 1, 1,
0.6854513, 0.8700676, -0.3908782, 0.6196079, 0, 1, 1,
0.6855285, -0.3079055, 2.435072, 0.627451, 0, 1, 1,
0.6868421, 0.05569016, 1.784694, 0.6313726, 0, 1, 1,
0.6914731, 0.03186468, 1.985059, 0.6392157, 0, 1, 1,
0.6916372, -0.5631088, 0.9281229, 0.6431373, 0, 1, 1,
0.6964697, -1.530265, 1.542928, 0.6509804, 0, 1, 1,
0.7027332, 0.3065004, 1.452108, 0.654902, 0, 1, 1,
0.7115065, -0.5608351, 1.871227, 0.6627451, 0, 1, 1,
0.7147343, 0.4938533, 0.5767782, 0.6666667, 0, 1, 1,
0.7234218, -0.7129501, 3.768046, 0.6745098, 0, 1, 1,
0.7245871, -0.7205229, 1.885252, 0.6784314, 0, 1, 1,
0.7291014, 0.2945761, 1.077468, 0.6862745, 0, 1, 1,
0.7347282, 1.041126, -0.5915242, 0.6901961, 0, 1, 1,
0.7369756, -0.1541918, 0.6237189, 0.6980392, 0, 1, 1,
0.7402167, -1.851643, 3.108977, 0.7058824, 0, 1, 1,
0.7417993, 1.737207, 0.01375869, 0.7098039, 0, 1, 1,
0.7424566, 0.5517556, 1.007469, 0.7176471, 0, 1, 1,
0.7467006, -0.1634924, 2.977129, 0.7215686, 0, 1, 1,
0.7509215, -0.2990284, 3.362553, 0.7294118, 0, 1, 1,
0.7520603, -0.6554582, 0.7585075, 0.7333333, 0, 1, 1,
0.7523302, 0.7236255, 0.9074045, 0.7411765, 0, 1, 1,
0.7527748, 0.943983, 0.8798588, 0.7450981, 0, 1, 1,
0.7569391, 1.6547, 0.418364, 0.7529412, 0, 1, 1,
0.7571789, -1.476844, 1.585148, 0.7568628, 0, 1, 1,
0.7634357, 0.3236054, 0.6415439, 0.7647059, 0, 1, 1,
0.7662562, 0.1607182, 1.384762, 0.7686275, 0, 1, 1,
0.7776783, 1.948025, -0.6710552, 0.7764706, 0, 1, 1,
0.781636, 2.166844, -1.383375, 0.7803922, 0, 1, 1,
0.7887691, -0.8254231, 3.487113, 0.7882353, 0, 1, 1,
0.7903081, -0.05012077, 1.968215, 0.7921569, 0, 1, 1,
0.8030732, -0.24589, 3.475939, 0.8, 0, 1, 1,
0.8093905, -0.2699021, 2.343097, 0.8078431, 0, 1, 1,
0.8103215, -0.4382305, 3.58131, 0.8117647, 0, 1, 1,
0.8149486, -0.3307466, 1.728287, 0.8196079, 0, 1, 1,
0.8149505, -0.5893803, 2.632338, 0.8235294, 0, 1, 1,
0.8152647, 0.5855719, 1.83865, 0.8313726, 0, 1, 1,
0.8219712, 0.5733049, -0.2017313, 0.8352941, 0, 1, 1,
0.8307021, 0.5521628, 1.862298, 0.8431373, 0, 1, 1,
0.8356109, -1.30988, 3.33161, 0.8470588, 0, 1, 1,
0.8507829, -1.505545, 1.728596, 0.854902, 0, 1, 1,
0.8512279, 0.7105806, 2.08706, 0.8588235, 0, 1, 1,
0.8646572, -0.04051834, 0.3295631, 0.8666667, 0, 1, 1,
0.8677362, 1.8456, 0.8643407, 0.8705882, 0, 1, 1,
0.8715668, -1.940335, 2.810863, 0.8784314, 0, 1, 1,
0.8758808, 0.3758275, -0.2032616, 0.8823529, 0, 1, 1,
0.8775849, -0.529305, 2.353904, 0.8901961, 0, 1, 1,
0.8802717, 0.7134798, 2.121845, 0.8941177, 0, 1, 1,
0.882299, -0.2963598, 2.436069, 0.9019608, 0, 1, 1,
0.8870001, -0.1887505, 1.79049, 0.9098039, 0, 1, 1,
0.8937891, -0.4484033, 2.297072, 0.9137255, 0, 1, 1,
0.9014781, -0.4900593, 1.964516, 0.9215686, 0, 1, 1,
0.905186, 1.044804, 0.5123316, 0.9254902, 0, 1, 1,
0.9057055, -1.947889, 4.369038, 0.9333333, 0, 1, 1,
0.9151391, 0.1397139, 1.274229, 0.9372549, 0, 1, 1,
0.9235912, -0.03309674, 2.723343, 0.945098, 0, 1, 1,
0.9244287, -0.9912817, 3.730818, 0.9490196, 0, 1, 1,
0.9251938, -1.167849, 2.275983, 0.9568627, 0, 1, 1,
0.9270874, -0.8386478, 3.029091, 0.9607843, 0, 1, 1,
0.9280373, -0.6708355, 2.145969, 0.9686275, 0, 1, 1,
0.9289248, 1.017789, -0.5573518, 0.972549, 0, 1, 1,
0.9338099, 0.0006825225, 4.372849, 0.9803922, 0, 1, 1,
0.934796, -0.1607196, 2.917762, 0.9843137, 0, 1, 1,
0.9411783, -0.1440316, -0.3445476, 0.9921569, 0, 1, 1,
0.9413758, -1.319232, 3.342618, 0.9960784, 0, 1, 1,
0.9425375, 1.798721, 0.1233582, 1, 0, 0.9960784, 1,
0.9560772, -0.9134889, 1.965294, 1, 0, 0.9882353, 1,
0.9596095, -0.9487238, 0.8109128, 1, 0, 0.9843137, 1,
0.9739448, -1.860978, 1.53552, 1, 0, 0.9764706, 1,
0.9762215, -0.5594189, 2.76203, 1, 0, 0.972549, 1,
0.9767059, 0.04953509, -0.787856, 1, 0, 0.9647059, 1,
0.9825609, 0.8820809, 1.542948, 1, 0, 0.9607843, 1,
0.9845098, 1.047404, 0.4853084, 1, 0, 0.9529412, 1,
0.9846229, -0.1013723, 2.139874, 1, 0, 0.9490196, 1,
0.9859133, 0.1587615, 3.074082, 1, 0, 0.9411765, 1,
0.98742, -1.830343, 3.84624, 1, 0, 0.9372549, 1,
0.9893179, -0.1985338, 1.975551, 1, 0, 0.9294118, 1,
0.9950531, -1.919272, 2.912014, 1, 0, 0.9254902, 1,
0.9997647, 0.3350532, 3.481957, 1, 0, 0.9176471, 1,
0.9998719, 1.211574, 0.1465812, 1, 0, 0.9137255, 1,
1.003502, 1.123494, 0.5356473, 1, 0, 0.9058824, 1,
1.004128, 0.1015045, 2.815297, 1, 0, 0.9019608, 1,
1.005759, 1.927275, -0.9373639, 1, 0, 0.8941177, 1,
1.021337, 1.167738, 2.672875, 1, 0, 0.8862745, 1,
1.026458, 0.1356666, 1.067126, 1, 0, 0.8823529, 1,
1.032604, 0.5335988, 1.366505, 1, 0, 0.8745098, 1,
1.040561, 0.2086536, -0.4156354, 1, 0, 0.8705882, 1,
1.052414, 0.4349806, -0.9161983, 1, 0, 0.8627451, 1,
1.057104, -1.165116, 1.753645, 1, 0, 0.8588235, 1,
1.062748, -0.1322432, 1.192761, 1, 0, 0.8509804, 1,
1.07342, 0.6037521, 2.051043, 1, 0, 0.8470588, 1,
1.075371, 0.921683, 0.2086594, 1, 0, 0.8392157, 1,
1.080059, 0.03278418, 1.076578, 1, 0, 0.8352941, 1,
1.081298, 1.018084, -0.1163109, 1, 0, 0.827451, 1,
1.08526, 1.676378, 0.5290681, 1, 0, 0.8235294, 1,
1.088864, 0.0739923, 1.987225, 1, 0, 0.8156863, 1,
1.099205, -0.1352102, 2.025027, 1, 0, 0.8117647, 1,
1.10682, -1.282029, 1.196474, 1, 0, 0.8039216, 1,
1.114083, 0.3965734, 1.26337, 1, 0, 0.7960784, 1,
1.12145, -0.9427034, 1.701747, 1, 0, 0.7921569, 1,
1.122337, 0.03519885, 2.25841, 1, 0, 0.7843137, 1,
1.122775, 0.2234593, 1.430772, 1, 0, 0.7803922, 1,
1.130238, 0.6114796, 2.604249, 1, 0, 0.772549, 1,
1.1323, -0.623085, 1.264621, 1, 0, 0.7686275, 1,
1.140594, 0.5250808, 2.314246, 1, 0, 0.7607843, 1,
1.141278, -0.5939675, 1.796893, 1, 0, 0.7568628, 1,
1.14291, -0.04456814, 1.882294, 1, 0, 0.7490196, 1,
1.147521, 0.2079524, 0.1647384, 1, 0, 0.7450981, 1,
1.158554, 0.3581882, 1.847928, 1, 0, 0.7372549, 1,
1.162369, -0.792051, 2.44173, 1, 0, 0.7333333, 1,
1.16545, -0.1674336, 2.532471, 1, 0, 0.7254902, 1,
1.171765, -0.2293603, 2.151409, 1, 0, 0.7215686, 1,
1.17319, -1.652754, 2.913865, 1, 0, 0.7137255, 1,
1.200459, -0.5161751, 3.742377, 1, 0, 0.7098039, 1,
1.205999, -1.030282, 2.329728, 1, 0, 0.7019608, 1,
1.212246, 0.9564847, 1.674714, 1, 0, 0.6941177, 1,
1.21715, -0.1111666, 2.609773, 1, 0, 0.6901961, 1,
1.22361, 0.02206497, 1.706099, 1, 0, 0.682353, 1,
1.228425, -0.5902736, 1.409014, 1, 0, 0.6784314, 1,
1.235617, 0.3467398, 0.5700104, 1, 0, 0.6705883, 1,
1.244659, 0.9898335, -0.7511252, 1, 0, 0.6666667, 1,
1.245168, -1.523101, 2.573061, 1, 0, 0.6588235, 1,
1.25497, 0.2484855, 0.8072643, 1, 0, 0.654902, 1,
1.27395, 0.2139769, 1.136975, 1, 0, 0.6470588, 1,
1.287927, 0.4978755, 1.924555, 1, 0, 0.6431373, 1,
1.289829, -0.813054, 0.5674949, 1, 0, 0.6352941, 1,
1.292228, -0.7254492, 2.220765, 1, 0, 0.6313726, 1,
1.296319, -1.318301, 3.066251, 1, 0, 0.6235294, 1,
1.30336, -0.3739266, 3.135368, 1, 0, 0.6196079, 1,
1.324535, -1.490563, 2.343753, 1, 0, 0.6117647, 1,
1.325291, 1.318207, 0.4544793, 1, 0, 0.6078432, 1,
1.328654, 1.048695, 0.2448403, 1, 0, 0.6, 1,
1.333707, -1.835928, 3.048151, 1, 0, 0.5921569, 1,
1.337608, 0.02087374, 2.150505, 1, 0, 0.5882353, 1,
1.346735, 0.3731436, 1.17609, 1, 0, 0.5803922, 1,
1.346837, 0.2043843, 1.014589, 1, 0, 0.5764706, 1,
1.351138, -0.3781355, 1.091317, 1, 0, 0.5686275, 1,
1.355443, -0.9020901, 1.877607, 1, 0, 0.5647059, 1,
1.364427, -0.1866539, 1.497063, 1, 0, 0.5568628, 1,
1.37073, -0.8835188, 1.311809, 1, 0, 0.5529412, 1,
1.390115, 0.8315328, -0.3887594, 1, 0, 0.5450981, 1,
1.398166, -1.053537, 1.529757, 1, 0, 0.5411765, 1,
1.409912, 0.09533867, 1.093921, 1, 0, 0.5333334, 1,
1.410409, -0.9351199, 2.218493, 1, 0, 0.5294118, 1,
1.417006, 0.02012278, 1.664736, 1, 0, 0.5215687, 1,
1.418073, 0.8749207, 1.946408, 1, 0, 0.5176471, 1,
1.425314, 1.662389, 0.1214858, 1, 0, 0.509804, 1,
1.446948, -0.9799188, 2.170204, 1, 0, 0.5058824, 1,
1.455685, -0.3607893, 1.409433, 1, 0, 0.4980392, 1,
1.457324, 0.2166715, 2.530634, 1, 0, 0.4901961, 1,
1.46508, -2.046926, 1.840997, 1, 0, 0.4862745, 1,
1.469903, 1.113898, 0.8394452, 1, 0, 0.4784314, 1,
1.48178, -1.742871, 2.271694, 1, 0, 0.4745098, 1,
1.486265, -0.5638086, 3.14454, 1, 0, 0.4666667, 1,
1.493007, -0.2264187, 0.525816, 1, 0, 0.4627451, 1,
1.504185, -0.1646034, 3.169502, 1, 0, 0.454902, 1,
1.511122, -1.103556, 2.782434, 1, 0, 0.4509804, 1,
1.51229, 0.9191851, -0.1139049, 1, 0, 0.4431373, 1,
1.517859, -0.4590747, 1.315213, 1, 0, 0.4392157, 1,
1.527386, 0.09094416, 2.311929, 1, 0, 0.4313726, 1,
1.527466, -1.357843, 2.806932, 1, 0, 0.427451, 1,
1.529061, 1.579933, 2.559092, 1, 0, 0.4196078, 1,
1.531631, 1.038303, 0.7302238, 1, 0, 0.4156863, 1,
1.53788, -0.446508, 2.543444, 1, 0, 0.4078431, 1,
1.538014, 1.188548, 0.9377469, 1, 0, 0.4039216, 1,
1.578784, 0.3763427, 0.4293119, 1, 0, 0.3960784, 1,
1.588157, -0.3602468, 1.117809, 1, 0, 0.3882353, 1,
1.608696, -0.4703433, 2.230577, 1, 0, 0.3843137, 1,
1.60973, 0.09442678, 2.761854, 1, 0, 0.3764706, 1,
1.624462, -1.708624, 2.149036, 1, 0, 0.372549, 1,
1.631, 0.5629882, -0.3989018, 1, 0, 0.3647059, 1,
1.631107, 0.5629125, 1.352056, 1, 0, 0.3607843, 1,
1.631906, 2.129312, 1.939095, 1, 0, 0.3529412, 1,
1.633106, -0.6534814, 1.382111, 1, 0, 0.3490196, 1,
1.636372, -0.5270472, 1.740586, 1, 0, 0.3411765, 1,
1.647704, 0.07562801, 1.813273, 1, 0, 0.3372549, 1,
1.649164, -0.6308709, 1.380639, 1, 0, 0.3294118, 1,
1.659192, -0.7750206, 1.499597, 1, 0, 0.3254902, 1,
1.668833, -1.696712, 1.860236, 1, 0, 0.3176471, 1,
1.694703, -0.9173844, 0.8604827, 1, 0, 0.3137255, 1,
1.71412, 0.2998315, 1.968919, 1, 0, 0.3058824, 1,
1.743328, 0.6743491, 0.4803044, 1, 0, 0.2980392, 1,
1.746638, -1.154604, 1.652476, 1, 0, 0.2941177, 1,
1.747247, -1.183117, 2.788227, 1, 0, 0.2862745, 1,
1.767199, 0.05256202, 0.9432451, 1, 0, 0.282353, 1,
1.773597, -0.02070276, 2.649289, 1, 0, 0.2745098, 1,
1.778385, -1.140375, 2.190546, 1, 0, 0.2705882, 1,
1.779404, 0.891253, -0.7721977, 1, 0, 0.2627451, 1,
1.782944, -0.3582729, 1.494295, 1, 0, 0.2588235, 1,
1.799049, -1.597504, 2.56051, 1, 0, 0.2509804, 1,
1.809734, 0.125624, 0.4002559, 1, 0, 0.2470588, 1,
1.819621, -0.2827419, 1.2221, 1, 0, 0.2392157, 1,
1.829427, -0.3873541, 2.396389, 1, 0, 0.2352941, 1,
1.838645, -0.4070122, -0.6409328, 1, 0, 0.227451, 1,
1.840546, 0.001194901, 0.8574989, 1, 0, 0.2235294, 1,
1.842261, 0.644985, 2.225938, 1, 0, 0.2156863, 1,
1.871462, -0.3344504, 0.2430628, 1, 0, 0.2117647, 1,
1.888043, -0.5577815, 2.519185, 1, 0, 0.2039216, 1,
1.888942, -0.09983456, 0.5232598, 1, 0, 0.1960784, 1,
1.890906, -0.2176831, 3.662644, 1, 0, 0.1921569, 1,
1.929519, 1.406569, 1.813456, 1, 0, 0.1843137, 1,
1.949106, 1.204767, 3.354397, 1, 0, 0.1803922, 1,
1.958462, 2.098585, 1.493772, 1, 0, 0.172549, 1,
1.972225, 0.8702043, 1.733884, 1, 0, 0.1686275, 1,
1.995677, -0.3864168, 1.554351, 1, 0, 0.1607843, 1,
2.003098, 1.639284, 0.9092821, 1, 0, 0.1568628, 1,
2.004936, -0.3947737, 1.825662, 1, 0, 0.1490196, 1,
2.02144, 2.034106, 0.4756596, 1, 0, 0.145098, 1,
2.03279, 0.5424948, 1.550146, 1, 0, 0.1372549, 1,
2.138875, 2.055474, 1.64599, 1, 0, 0.1333333, 1,
2.193437, -0.319715, 1.841047, 1, 0, 0.1254902, 1,
2.222444, 0.2947623, 1.865745, 1, 0, 0.1215686, 1,
2.228188, 0.763011, 1.097625, 1, 0, 0.1137255, 1,
2.253278, 0.6829878, 0.7367661, 1, 0, 0.1098039, 1,
2.274363, 0.4633203, 2.134709, 1, 0, 0.1019608, 1,
2.278902, 0.7275342, 2.598372, 1, 0, 0.09411765, 1,
2.31556, 1.116889, 0.365512, 1, 0, 0.09019608, 1,
2.336938, 1.302293, 1.862638, 1, 0, 0.08235294, 1,
2.361663, -0.07196508, -0.40053, 1, 0, 0.07843138, 1,
2.416904, -1.220492, -0.129246, 1, 0, 0.07058824, 1,
2.423087, -0.079579, 2.868361, 1, 0, 0.06666667, 1,
2.449491, 1.22689, 4.238152, 1, 0, 0.05882353, 1,
2.482474, -1.855803, 0.8753888, 1, 0, 0.05490196, 1,
2.556554, 2.040874, 1.297313, 1, 0, 0.04705882, 1,
2.657819, -0.1552411, 0.1961752, 1, 0, 0.04313726, 1,
2.732212, 1.451295, 0.2320461, 1, 0, 0.03529412, 1,
3.132737, -1.696501, 1.285645, 1, 0, 0.03137255, 1,
3.363398, 0.4154592, 2.926743, 1, 0, 0.02352941, 1,
3.5429, 0.9424585, 1.532452, 1, 0, 0.01960784, 1,
3.811577, 0.393795, 1.120151, 1, 0, 0.01176471, 1,
4.507759, 1.494134, 0.5472555, 1, 0, 0.007843138, 1
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
0.9469163, -4.152871, -7.482985, 0, -0.5, 0.5, 0.5,
0.9469163, -4.152871, -7.482985, 1, -0.5, 0.5, 0.5,
0.9469163, -4.152871, -7.482985, 1, 1.5, 0.5, 0.5,
0.9469163, -4.152871, -7.482985, 0, 1.5, 0.5, 0.5
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
-3.821052, 0.207526, -7.482985, 0, -0.5, 0.5, 0.5,
-3.821052, 0.207526, -7.482985, 1, -0.5, 0.5, 0.5,
-3.821052, 0.207526, -7.482985, 1, 1.5, 0.5, 0.5,
-3.821052, 0.207526, -7.482985, 0, 1.5, 0.5, 0.5
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
-3.821052, -4.152871, 0.1967957, 0, -0.5, 0.5, 0.5,
-3.821052, -4.152871, 0.1967957, 1, -0.5, 0.5, 0.5,
-3.821052, -4.152871, 0.1967957, 1, 1.5, 0.5, 0.5,
-3.821052, -4.152871, 0.1967957, 0, 1.5, 0.5, 0.5
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
-2, -3.146625, -5.710728,
4, -3.146625, -5.710728,
-2, -3.146625, -5.710728,
-2, -3.314333, -6.006104,
0, -3.146625, -5.710728,
0, -3.314333, -6.006104,
2, -3.146625, -5.710728,
2, -3.314333, -6.006104,
4, -3.146625, -5.710728,
4, -3.314333, -6.006104
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
"-2",
"0",
"2",
"4"
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
-2, -3.649748, -6.596857, 0, -0.5, 0.5, 0.5,
-2, -3.649748, -6.596857, 1, -0.5, 0.5, 0.5,
-2, -3.649748, -6.596857, 1, 1.5, 0.5, 0.5,
-2, -3.649748, -6.596857, 0, 1.5, 0.5, 0.5,
0, -3.649748, -6.596857, 0, -0.5, 0.5, 0.5,
0, -3.649748, -6.596857, 1, -0.5, 0.5, 0.5,
0, -3.649748, -6.596857, 1, 1.5, 0.5, 0.5,
0, -3.649748, -6.596857, 0, 1.5, 0.5, 0.5,
2, -3.649748, -6.596857, 0, -0.5, 0.5, 0.5,
2, -3.649748, -6.596857, 1, -0.5, 0.5, 0.5,
2, -3.649748, -6.596857, 1, 1.5, 0.5, 0.5,
2, -3.649748, -6.596857, 0, 1.5, 0.5, 0.5,
4, -3.649748, -6.596857, 0, -0.5, 0.5, 0.5,
4, -3.649748, -6.596857, 1, -0.5, 0.5, 0.5,
4, -3.649748, -6.596857, 1, 1.5, 0.5, 0.5,
4, -3.649748, -6.596857, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.720752, -3, -5.710728,
-2.720752, 3, -5.710728,
-2.720752, -3, -5.710728,
-2.904135, -3, -6.006104,
-2.720752, -2, -5.710728,
-2.904135, -2, -6.006104,
-2.720752, -1, -5.710728,
-2.904135, -1, -6.006104,
-2.720752, 0, -5.710728,
-2.904135, 0, -6.006104,
-2.720752, 1, -5.710728,
-2.904135, 1, -6.006104,
-2.720752, 2, -5.710728,
-2.904135, 2, -6.006104,
-2.720752, 3, -5.710728,
-2.904135, 3, -6.006104
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
-3.270902, -3, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, -3, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, -3, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, -3, -6.596857, 0, 1.5, 0.5, 0.5,
-3.270902, -2, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, -2, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, -2, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, -2, -6.596857, 0, 1.5, 0.5, 0.5,
-3.270902, -1, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, -1, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, -1, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, -1, -6.596857, 0, 1.5, 0.5, 0.5,
-3.270902, 0, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, 0, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, 0, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, 0, -6.596857, 0, 1.5, 0.5, 0.5,
-3.270902, 1, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, 1, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, 1, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, 1, -6.596857, 0, 1.5, 0.5, 0.5,
-3.270902, 2, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, 2, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, 2, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, 2, -6.596857, 0, 1.5, 0.5, 0.5,
-3.270902, 3, -6.596857, 0, -0.5, 0.5, 0.5,
-3.270902, 3, -6.596857, 1, -0.5, 0.5, 0.5,
-3.270902, 3, -6.596857, 1, 1.5, 0.5, 0.5,
-3.270902, 3, -6.596857, 0, 1.5, 0.5, 0.5
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
-2.720752, -3.146625, -4,
-2.720752, -3.146625, 4,
-2.720752, -3.146625, -4,
-2.904135, -3.314333, -4,
-2.720752, -3.146625, -2,
-2.904135, -3.314333, -2,
-2.720752, -3.146625, 0,
-2.904135, -3.314333, 0,
-2.720752, -3.146625, 2,
-2.904135, -3.314333, 2,
-2.720752, -3.146625, 4,
-2.904135, -3.314333, 4
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
-3.270902, -3.649748, -4, 0, -0.5, 0.5, 0.5,
-3.270902, -3.649748, -4, 1, -0.5, 0.5, 0.5,
-3.270902, -3.649748, -4, 1, 1.5, 0.5, 0.5,
-3.270902, -3.649748, -4, 0, 1.5, 0.5, 0.5,
-3.270902, -3.649748, -2, 0, -0.5, 0.5, 0.5,
-3.270902, -3.649748, -2, 1, -0.5, 0.5, 0.5,
-3.270902, -3.649748, -2, 1, 1.5, 0.5, 0.5,
-3.270902, -3.649748, -2, 0, 1.5, 0.5, 0.5,
-3.270902, -3.649748, 0, 0, -0.5, 0.5, 0.5,
-3.270902, -3.649748, 0, 1, -0.5, 0.5, 0.5,
-3.270902, -3.649748, 0, 1, 1.5, 0.5, 0.5,
-3.270902, -3.649748, 0, 0, 1.5, 0.5, 0.5,
-3.270902, -3.649748, 2, 0, -0.5, 0.5, 0.5,
-3.270902, -3.649748, 2, 1, -0.5, 0.5, 0.5,
-3.270902, -3.649748, 2, 1, 1.5, 0.5, 0.5,
-3.270902, -3.649748, 2, 0, 1.5, 0.5, 0.5,
-3.270902, -3.649748, 4, 0, -0.5, 0.5, 0.5,
-3.270902, -3.649748, 4, 1, -0.5, 0.5, 0.5,
-3.270902, -3.649748, 4, 1, 1.5, 0.5, 0.5,
-3.270902, -3.649748, 4, 0, 1.5, 0.5, 0.5
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
-2.720752, -3.146625, -5.710728,
-2.720752, 3.561677, -5.710728,
-2.720752, -3.146625, 6.10432,
-2.720752, 3.561677, 6.10432,
-2.720752, -3.146625, -5.710728,
-2.720752, -3.146625, 6.10432,
-2.720752, 3.561677, -5.710728,
-2.720752, 3.561677, 6.10432,
-2.720752, -3.146625, -5.710728,
4.614584, -3.146625, -5.710728,
-2.720752, -3.146625, 6.10432,
4.614584, -3.146625, 6.10432,
-2.720752, 3.561677, -5.710728,
4.614584, 3.561677, -5.710728,
-2.720752, 3.561677, 6.10432,
4.614584, 3.561677, 6.10432,
4.614584, -3.146625, -5.710728,
4.614584, 3.561677, -5.710728,
4.614584, -3.146625, 6.10432,
4.614584, 3.561677, 6.10432,
4.614584, -3.146625, -5.710728,
4.614584, -3.146625, 6.10432,
4.614584, 3.561677, -5.710728,
4.614584, 3.561677, 6.10432
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
var radius = 8.244837;
var distance = 36.68221;
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
mvMatrix.translate( -0.9469163, -0.207526, -0.1967957 );
mvMatrix.scale( 1.215279, 1.328873, 0.7545022 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.68221);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Polyoxymethylene<-read.table("Polyoxymethylene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Polyoxymethylene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Polyoxymethylene' not found
```

```r
y<-Polyoxymethylene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Polyoxymethylene' not found
```

```r
z<-Polyoxymethylene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Polyoxymethylene' not found
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
-2.613926, -0.4951582, -1.680037, 0, 0, 1, 1, 1,
-2.559983, 0.2608232, -1.982626, 1, 0, 0, 1, 1,
-2.525217, -0.3169988, -1.180643, 1, 0, 0, 1, 1,
-2.478995, -0.1753365, -3.540769, 1, 0, 0, 1, 1,
-2.456816, -0.5178531, -2.731184, 1, 0, 0, 1, 1,
-2.408598, -0.7073777, -2.059623, 1, 0, 0, 1, 1,
-2.347917, 2.173398, -0.3803399, 0, 0, 0, 1, 1,
-2.25127, -0.6640787, -2.652894, 0, 0, 0, 1, 1,
-2.247052, 0.2062933, -2.801618, 0, 0, 0, 1, 1,
-2.242913, -1.065027, -1.517374, 0, 0, 0, 1, 1,
-2.224092, -0.3828497, -0.3465439, 0, 0, 0, 1, 1,
-2.217536, 1.660079, -0.7915688, 0, 0, 0, 1, 1,
-2.215801, 1.036869, -0.3038609, 0, 0, 0, 1, 1,
-2.142976, -1.290238, -3.178786, 1, 1, 1, 1, 1,
-2.105067, -1.056973, -3.322693, 1, 1, 1, 1, 1,
-2.091367, -0.1874245, -1.131657, 1, 1, 1, 1, 1,
-2.066536, 0.4127341, -1.39353, 1, 1, 1, 1, 1,
-2.059939, -0.05014558, -1.581945, 1, 1, 1, 1, 1,
-2.016245, 0.006460316, -2.319159, 1, 1, 1, 1, 1,
-2.003381, -0.8082726, -1.813143, 1, 1, 1, 1, 1,
-1.974644, 0.1920407, -0.7463982, 1, 1, 1, 1, 1,
-1.923672, -0.3624326, -1.346363, 1, 1, 1, 1, 1,
-1.923249, -0.240546, -0.5848206, 1, 1, 1, 1, 1,
-1.912095, 1.022997, -0.3717926, 1, 1, 1, 1, 1,
-1.893927, 0.0701332, -1.717024, 1, 1, 1, 1, 1,
-1.887591, 0.8753458, 1.311992, 1, 1, 1, 1, 1,
-1.88612, -0.8863142, -3.444601, 1, 1, 1, 1, 1,
-1.879074, 0.03737272, -2.774739, 1, 1, 1, 1, 1,
-1.873945, -0.8315964, -3.306264, 0, 0, 1, 1, 1,
-1.853049, -0.4012288, -2.115731, 1, 0, 0, 1, 1,
-1.822684, -1.597172, -3.777276, 1, 0, 0, 1, 1,
-1.821201, -0.6169069, -2.356852, 1, 0, 0, 1, 1,
-1.81828, -1.439685, -1.463459, 1, 0, 0, 1, 1,
-1.817149, -1.809807, -3.489658, 1, 0, 0, 1, 1,
-1.810004, 1.450107, -1.10988, 0, 0, 0, 1, 1,
-1.807872, 0.2155933, -0.775891, 0, 0, 0, 1, 1,
-1.8, 0.861648, -0.3286317, 0, 0, 0, 1, 1,
-1.783517, 0.2074237, -0.2860006, 0, 0, 0, 1, 1,
-1.750327, -0.2456228, 0.3522421, 0, 0, 0, 1, 1,
-1.748265, 0.4998702, -1.13465, 0, 0, 0, 1, 1,
-1.739965, -1.67003, -1.769163, 0, 0, 0, 1, 1,
-1.726962, -1.902015, -3.650835, 1, 1, 1, 1, 1,
-1.703962, 0.6090724, -1.530888, 1, 1, 1, 1, 1,
-1.700954, -0.3590539, -0.8085598, 1, 1, 1, 1, 1,
-1.687225, 0.4498228, -1.11277, 1, 1, 1, 1, 1,
-1.661632, 0.1496331, -1.647834, 1, 1, 1, 1, 1,
-1.647255, -0.2790706, -2.076748, 1, 1, 1, 1, 1,
-1.641884, -1.270243, -1.367811, 1, 1, 1, 1, 1,
-1.63837, 2.65364, -3.267922, 1, 1, 1, 1, 1,
-1.631252, -0.2700794, -2.870955, 1, 1, 1, 1, 1,
-1.624544, -0.3584737, -1.1647, 1, 1, 1, 1, 1,
-1.622265, -1.034513, -1.748299, 1, 1, 1, 1, 1,
-1.613983, 0.1420982, 0.1228889, 1, 1, 1, 1, 1,
-1.603501, 0.07541758, -0.5832471, 1, 1, 1, 1, 1,
-1.58879, 1.228074, -2.46477, 1, 1, 1, 1, 1,
-1.56313, -0.6975031, -2.320756, 1, 1, 1, 1, 1,
-1.558813, -0.2372442, -1.352, 0, 0, 1, 1, 1,
-1.552355, -0.1567966, -3.039443, 1, 0, 0, 1, 1,
-1.533701, -0.8313149, -3.116785, 1, 0, 0, 1, 1,
-1.514019, -1.630305, -2.919408, 1, 0, 0, 1, 1,
-1.512226, -0.5469359, -1.993526, 1, 0, 0, 1, 1,
-1.506501, 1.291392, 0.02488814, 1, 0, 0, 1, 1,
-1.505558, 0.9838639, -0.8932722, 0, 0, 0, 1, 1,
-1.501786, 0.9922686, -0.6774598, 0, 0, 0, 1, 1,
-1.499892, -1.407781, -2.056169, 0, 0, 0, 1, 1,
-1.480994, 0.9473044, -2.146884, 0, 0, 0, 1, 1,
-1.474439, 2.071837, -0.7045665, 0, 0, 0, 1, 1,
-1.468871, 0.834236, -0.9582813, 0, 0, 0, 1, 1,
-1.466739, 0.8776013, -0.8516622, 0, 0, 0, 1, 1,
-1.466703, -0.5508596, -3.197247, 1, 1, 1, 1, 1,
-1.459709, -0.8892908, -1.286713, 1, 1, 1, 1, 1,
-1.45817, -0.6063406, -1.838077, 1, 1, 1, 1, 1,
-1.451089, -0.2808758, -0.982897, 1, 1, 1, 1, 1,
-1.429034, -0.1888406, -1.256442, 1, 1, 1, 1, 1,
-1.422794, 0.5594494, -2.190009, 1, 1, 1, 1, 1,
-1.391071, -0.7970979, -2.280012, 1, 1, 1, 1, 1,
-1.381264, -0.8375302, -3.09045, 1, 1, 1, 1, 1,
-1.381064, 0.2641851, -1.02853, 1, 1, 1, 1, 1,
-1.37808, 0.4591883, -0.6385176, 1, 1, 1, 1, 1,
-1.369757, -0.15543, -1.645462, 1, 1, 1, 1, 1,
-1.368706, 0.3637925, -2.85014, 1, 1, 1, 1, 1,
-1.368436, 0.6289847, -1.955346, 1, 1, 1, 1, 1,
-1.365699, 0.2272746, -1.607753, 1, 1, 1, 1, 1,
-1.365317, 1.277861, -2.27158, 1, 1, 1, 1, 1,
-1.362131, -0.1393695, -1.85107, 0, 0, 1, 1, 1,
-1.353686, -0.8580866, -0.7620431, 1, 0, 0, 1, 1,
-1.343061, -0.3709618, -4.561638, 1, 0, 0, 1, 1,
-1.331846, -0.01777621, -2.989976, 1, 0, 0, 1, 1,
-1.331489, 2.538368, 0.5086373, 1, 0, 0, 1, 1,
-1.322601, -0.8974192, -1.561305, 1, 0, 0, 1, 1,
-1.314138, 1.047973, -0.6684478, 0, 0, 0, 1, 1,
-1.314119, 0.7200813, -2.809468, 0, 0, 0, 1, 1,
-1.312466, -0.07123223, -1.119718, 0, 0, 0, 1, 1,
-1.309096, -0.5516289, -2.850516, 0, 0, 0, 1, 1,
-1.301939, 1.634093, 0.6551042, 0, 0, 0, 1, 1,
-1.301775, -0.2433734, -1.67772, 0, 0, 0, 1, 1,
-1.289981, 0.2724143, -1.200116, 0, 0, 0, 1, 1,
-1.289979, 0.835458, -0.6865748, 1, 1, 1, 1, 1,
-1.289242, -0.8586062, -2.164643, 1, 1, 1, 1, 1,
-1.284531, 0.15462, -1.438907, 1, 1, 1, 1, 1,
-1.280996, -0.5626498, -1.196333, 1, 1, 1, 1, 1,
-1.276407, -0.1821445, -2.465033, 1, 1, 1, 1, 1,
-1.264651, -1.729187, -2.684121, 1, 1, 1, 1, 1,
-1.261966, 0.2640538, -2.786953, 1, 1, 1, 1, 1,
-1.260443, -0.3519688, -1.392435, 1, 1, 1, 1, 1,
-1.259878, 0.2871183, -1.723831, 1, 1, 1, 1, 1,
-1.252847, 0.7476564, -2.087858, 1, 1, 1, 1, 1,
-1.248574, 0.9888669, -1.491869, 1, 1, 1, 1, 1,
-1.246742, -0.2952146, -1.967413, 1, 1, 1, 1, 1,
-1.235456, -0.9339157, -1.993618, 1, 1, 1, 1, 1,
-1.234688, 0.4611163, -1.855687, 1, 1, 1, 1, 1,
-1.232636, -0.2310697, -1.118325, 1, 1, 1, 1, 1,
-1.220497, 0.6831462, -1.024172, 0, 0, 1, 1, 1,
-1.218108, -1.570469, -3.162669, 1, 0, 0, 1, 1,
-1.204192, -0.1279908, -3.039594, 1, 0, 0, 1, 1,
-1.200887, -0.7402546, -2.525799, 1, 0, 0, 1, 1,
-1.194924, -1.380706, -1.966638, 1, 0, 0, 1, 1,
-1.187585, 0.3353804, -1.854045, 1, 0, 0, 1, 1,
-1.186371, 1.964728, -0.6922022, 0, 0, 0, 1, 1,
-1.180478, 1.193538, -0.6088675, 0, 0, 0, 1, 1,
-1.179491, -0.9494143, -2.231685, 0, 0, 0, 1, 1,
-1.178142, -0.01132692, -2.532832, 0, 0, 0, 1, 1,
-1.176419, 0.5371876, -1.316953, 0, 0, 0, 1, 1,
-1.172685, -0.4570891, -2.424921, 0, 0, 0, 1, 1,
-1.167922, -1.138382, -2.356591, 0, 0, 0, 1, 1,
-1.16417, -0.5704347, -1.974264, 1, 1, 1, 1, 1,
-1.16237, -1.119585, -3.594713, 1, 1, 1, 1, 1,
-1.153765, -1.259991, -1.895394, 1, 1, 1, 1, 1,
-1.149353, 0.08031406, -1.068306, 1, 1, 1, 1, 1,
-1.141549, 2.023445, -0.6903409, 1, 1, 1, 1, 1,
-1.138367, -0.1418627, -1.943063, 1, 1, 1, 1, 1,
-1.133072, -1.856487, -2.510957, 1, 1, 1, 1, 1,
-1.132479, -0.08668993, -0.2022213, 1, 1, 1, 1, 1,
-1.129851, -1.148986, -1.905709, 1, 1, 1, 1, 1,
-1.120934, -0.2599948, -2.003726, 1, 1, 1, 1, 1,
-1.112708, -1.355826, -0.792235, 1, 1, 1, 1, 1,
-1.106219, -0.4315993, -2.674767, 1, 1, 1, 1, 1,
-1.105667, -0.8321295, -1.763165, 1, 1, 1, 1, 1,
-1.105038, -1.354826, -2.40541, 1, 1, 1, 1, 1,
-1.103163, 0.7183008, -0.5990679, 1, 1, 1, 1, 1,
-1.092574, 1.385041, -0.2658049, 0, 0, 1, 1, 1,
-1.088707, 0.05423714, -1.551926, 1, 0, 0, 1, 1,
-1.086103, 1.200853, -1.536952, 1, 0, 0, 1, 1,
-1.083345, -0.4482298, -2.038023, 1, 0, 0, 1, 1,
-1.078565, -0.3188974, -1.241758, 1, 0, 0, 1, 1,
-1.072434, 0.04917737, -1.192668, 1, 0, 0, 1, 1,
-1.072037, 0.8604144, -0.3978873, 0, 0, 0, 1, 1,
-1.063261, -0.4138489, -2.774438, 0, 0, 0, 1, 1,
-1.060889, 0.8659101, -0.292247, 0, 0, 0, 1, 1,
-1.059068, 0.809333, -2.772147, 0, 0, 0, 1, 1,
-1.041903, -1.366341, -2.487068, 0, 0, 0, 1, 1,
-1.038246, 0.9795767, 0.1855297, 0, 0, 0, 1, 1,
-1.036618, -1.939922, -2.208329, 0, 0, 0, 1, 1,
-1.03131, -0.2949311, -1.090818, 1, 1, 1, 1, 1,
-1.030143, 0.3977021, 2.260188, 1, 1, 1, 1, 1,
-1.028976, 0.7903685, -1.193721, 1, 1, 1, 1, 1,
-1.024357, 0.6189249, -1.591238, 1, 1, 1, 1, 1,
-1.02157, 0.564156, -2.396969, 1, 1, 1, 1, 1,
-1.011796, 1.034908, -0.213909, 1, 1, 1, 1, 1,
-1.008078, 0.864287, 0.1035471, 1, 1, 1, 1, 1,
-1.003828, -0.7037142, -2.720969, 1, 1, 1, 1, 1,
-0.9993046, 1.128683, -1.048062, 1, 1, 1, 1, 1,
-0.9960343, -0.6263544, -2.248354, 1, 1, 1, 1, 1,
-0.9859682, -0.3660415, -1.953185, 1, 1, 1, 1, 1,
-0.9845006, -0.4316591, -1.3623, 1, 1, 1, 1, 1,
-0.9760826, 1.64079, -0.7933354, 1, 1, 1, 1, 1,
-0.9760576, 0.4844179, -1.876779, 1, 1, 1, 1, 1,
-0.9711165, -1.928758, -2.669583, 1, 1, 1, 1, 1,
-0.961166, -0.4581089, -1.810652, 0, 0, 1, 1, 1,
-0.9595467, 0.2409182, -2.758902, 1, 0, 0, 1, 1,
-0.9576343, 0.09644734, -1.48986, 1, 0, 0, 1, 1,
-0.9544381, 0.9872767, -2.073823, 1, 0, 0, 1, 1,
-0.9520747, 0.26932, -2.101046, 1, 0, 0, 1, 1,
-0.9497209, 2.35517, -0.4165003, 1, 0, 0, 1, 1,
-0.9478824, -0.002421134, -1.832767, 0, 0, 0, 1, 1,
-0.9473323, 0.2923559, -2.387698, 0, 0, 0, 1, 1,
-0.9468961, 0.6450313, -1.754651, 0, 0, 0, 1, 1,
-0.9422769, -0.771419, -1.293634, 0, 0, 0, 1, 1,
-0.9354845, -1.387192, -1.536135, 0, 0, 0, 1, 1,
-0.9295655, -1.478344, -2.694315, 0, 0, 0, 1, 1,
-0.9238889, 0.4644266, -0.6069818, 0, 0, 0, 1, 1,
-0.9223423, -0.8508385, -1.979246, 1, 1, 1, 1, 1,
-0.9178665, -0.1912912, -1.992348, 1, 1, 1, 1, 1,
-0.9140192, 0.05436146, -0.231743, 1, 1, 1, 1, 1,
-0.9125178, 1.324917, -1.392448, 1, 1, 1, 1, 1,
-0.911048, 0.4976876, -1.820119, 1, 1, 1, 1, 1,
-0.9038873, -2.489789, -4.564707, 1, 1, 1, 1, 1,
-0.9003343, 0.5914325, -0.224903, 1, 1, 1, 1, 1,
-0.8988227, -2.139843, -2.762926, 1, 1, 1, 1, 1,
-0.8879983, 0.8205144, 1.399028, 1, 1, 1, 1, 1,
-0.8871558, 1.767721, -2.70483, 1, 1, 1, 1, 1,
-0.886621, 0.7444365, -2.026838, 1, 1, 1, 1, 1,
-0.8753995, 0.3395742, -2.700204, 1, 1, 1, 1, 1,
-0.8751643, -0.5969207, -1.270694, 1, 1, 1, 1, 1,
-0.8719682, 1.108267, -0.007438253, 1, 1, 1, 1, 1,
-0.8684235, -0.827875, -3.058913, 1, 1, 1, 1, 1,
-0.8635516, -0.2582056, -3.657452, 0, 0, 1, 1, 1,
-0.8539122, -0.7526049, -1.451851, 1, 0, 0, 1, 1,
-0.8497171, -0.5425998, -2.084909, 1, 0, 0, 1, 1,
-0.8353625, 1.554792, -1.478176, 1, 0, 0, 1, 1,
-0.8323295, 0.2982168, -2.113643, 1, 0, 0, 1, 1,
-0.8321416, -1.262306, -2.13636, 1, 0, 0, 1, 1,
-0.8293499, -0.9573079, -3.007844, 0, 0, 0, 1, 1,
-0.8241627, -0.5706706, -1.66, 0, 0, 0, 1, 1,
-0.815791, -0.3286958, -0.9045585, 0, 0, 0, 1, 1,
-0.8143148, -1.460695, -3.394437, 0, 0, 0, 1, 1,
-0.8139174, 1.813566, -1.08697, 0, 0, 0, 1, 1,
-0.8129612, 0.7148715, -1.475174, 0, 0, 0, 1, 1,
-0.8117391, 1.00927, 0.01158475, 0, 0, 0, 1, 1,
-0.8102415, -0.9317812, -4.515224, 1, 1, 1, 1, 1,
-0.8080804, 0.3444147, -0.8021663, 1, 1, 1, 1, 1,
-0.8073953, -0.5067264, -3.588382, 1, 1, 1, 1, 1,
-0.8070536, 0.3641241, 0.6254764, 1, 1, 1, 1, 1,
-0.8039296, -1.046351, -1.435911, 1, 1, 1, 1, 1,
-0.8036415, 1.139766, 2.486745, 1, 1, 1, 1, 1,
-0.8033528, -0.288318, -1.334291, 1, 1, 1, 1, 1,
-0.8001333, 1.699226, -0.2995085, 1, 1, 1, 1, 1,
-0.7979572, -0.1279801, -1.009461, 1, 1, 1, 1, 1,
-0.7961734, -0.883423, -3.744229, 1, 1, 1, 1, 1,
-0.7940141, 0.07828401, -2.849638, 1, 1, 1, 1, 1,
-0.7898339, -1.277657, -1.691797, 1, 1, 1, 1, 1,
-0.7894691, -0.8621459, -3.246023, 1, 1, 1, 1, 1,
-0.7879601, 0.5128327, -0.7925635, 1, 1, 1, 1, 1,
-0.7853345, -0.8715681, -3.191002, 1, 1, 1, 1, 1,
-0.7762905, -0.6007438, -2.894278, 0, 0, 1, 1, 1,
-0.7707485, -0.6214832, -2.439087, 1, 0, 0, 1, 1,
-0.7688723, -0.09353868, -1.85148, 1, 0, 0, 1, 1,
-0.7642338, -1.679287, -2.352938, 1, 0, 0, 1, 1,
-0.7624457, -1.842688, -1.744576, 1, 0, 0, 1, 1,
-0.7600555, 0.8705321, -1.50179, 1, 0, 0, 1, 1,
-0.7520503, -0.3834645, -0.9350145, 0, 0, 0, 1, 1,
-0.7490778, -1.675739, -3.087762, 0, 0, 0, 1, 1,
-0.7488587, -1.966304, -2.849596, 0, 0, 0, 1, 1,
-0.742009, 0.6074833, 2.161928, 0, 0, 0, 1, 1,
-0.7301551, 1.544336, -0.7475931, 0, 0, 0, 1, 1,
-0.7294036, 2.119505, -2.28599, 0, 0, 0, 1, 1,
-0.7268428, -0.4532676, -2.696867, 0, 0, 0, 1, 1,
-0.7247648, 0.9464723, -0.7715786, 1, 1, 1, 1, 1,
-0.7235424, 0.6377116, -1.143722, 1, 1, 1, 1, 1,
-0.7196489, 0.4491646, -2.892711, 1, 1, 1, 1, 1,
-0.7154132, 0.237925, -1.863044, 1, 1, 1, 1, 1,
-0.7120801, -0.1536085, -3.79822, 1, 1, 1, 1, 1,
-0.7092059, -1.276781, -3.827733, 1, 1, 1, 1, 1,
-0.7090693, 0.5186436, -0.3048831, 1, 1, 1, 1, 1,
-0.7050979, 0.6810907, 0.5270122, 1, 1, 1, 1, 1,
-0.703319, -0.1690162, -3.856159, 1, 1, 1, 1, 1,
-0.7010952, -1.688553, -2.850275, 1, 1, 1, 1, 1,
-0.6995927, 0.2355374, -0.7360454, 1, 1, 1, 1, 1,
-0.6980717, -1.31982, -2.105786, 1, 1, 1, 1, 1,
-0.6938672, -0.3363228, -0.6896121, 1, 1, 1, 1, 1,
-0.6892749, 0.7309201, 0.105444, 1, 1, 1, 1, 1,
-0.6889741, -1.80558, -3.624907, 1, 1, 1, 1, 1,
-0.6837785, -0.2615024, -2.294734, 0, 0, 1, 1, 1,
-0.6835318, 0.1247771, -0.3250595, 1, 0, 0, 1, 1,
-0.6792427, -0.5145808, -2.345801, 1, 0, 0, 1, 1,
-0.6780791, -0.678256, -2.576676, 1, 0, 0, 1, 1,
-0.6752015, 1.290071, -0.6940663, 1, 0, 0, 1, 1,
-0.6740326, -1.38159, -1.961416, 1, 0, 0, 1, 1,
-0.6647465, 0.1449299, -3.570162, 0, 0, 0, 1, 1,
-0.661503, -1.501943, -2.384111, 0, 0, 0, 1, 1,
-0.6572334, -0.9615414, -3.837678, 0, 0, 0, 1, 1,
-0.6564253, -0.837302, -0.7774546, 0, 0, 0, 1, 1,
-0.6559073, 0.4451497, -1.01646, 0, 0, 0, 1, 1,
-0.6482551, 1.368684, -0.5156265, 0, 0, 0, 1, 1,
-0.642515, 0.3399165, 0.4445288, 0, 0, 0, 1, 1,
-0.6423193, -0.4010771, -1.46927, 1, 1, 1, 1, 1,
-0.6417478, 1.000645, -1.170586, 1, 1, 1, 1, 1,
-0.634518, -0.4924898, -1.782613, 1, 1, 1, 1, 1,
-0.633756, 0.7478839, 0.7131885, 1, 1, 1, 1, 1,
-0.6322406, 1.094603, -1.077098, 1, 1, 1, 1, 1,
-0.6298944, -0.03161057, -1.986905, 1, 1, 1, 1, 1,
-0.6289099, 1.254746, 0.8089854, 1, 1, 1, 1, 1,
-0.6265481, 1.145761, 0.1442786, 1, 1, 1, 1, 1,
-0.6177378, -0.9043258, -2.47432, 1, 1, 1, 1, 1,
-0.606746, -0.242452, -1.882197, 1, 1, 1, 1, 1,
-0.6036681, -0.8507465, -2.894547, 1, 1, 1, 1, 1,
-0.602302, 0.3059461, -0.4679493, 1, 1, 1, 1, 1,
-0.6022254, -0.4986978, -0.9790944, 1, 1, 1, 1, 1,
-0.6019627, 1.223395, -1.012444, 1, 1, 1, 1, 1,
-0.5906523, -1.5232, -2.1608, 1, 1, 1, 1, 1,
-0.5903635, 0.4946644, -0.4390238, 0, 0, 1, 1, 1,
-0.5900065, -0.1358328, -1.221844, 1, 0, 0, 1, 1,
-0.5895064, -0.1864498, -1.089477, 1, 0, 0, 1, 1,
-0.5836828, -0.4347777, -1.998585, 1, 0, 0, 1, 1,
-0.5825713, 0.574882, -1.027146, 1, 0, 0, 1, 1,
-0.5816789, 3.463984, 0.117963, 1, 0, 0, 1, 1,
-0.5777069, -1.101497, -3.438131, 0, 0, 0, 1, 1,
-0.5734696, -0.4711197, -2.753222, 0, 0, 0, 1, 1,
-0.5688897, -1.262233, -2.354432, 0, 0, 0, 1, 1,
-0.5624893, 0.5094014, -1.520596, 0, 0, 0, 1, 1,
-0.5615163, 0.02418054, -0.1638934, 0, 0, 0, 1, 1,
-0.559028, -0.5405331, -2.128698, 0, 0, 0, 1, 1,
-0.5442791, 0.5497693, 0.232278, 0, 0, 0, 1, 1,
-0.5439944, -0.5890296, -1.389989, 1, 1, 1, 1, 1,
-0.5395176, -0.6622402, -2.542465, 1, 1, 1, 1, 1,
-0.5368025, -0.05519299, -0.7000564, 1, 1, 1, 1, 1,
-0.535291, 0.02739088, -1.005881, 1, 1, 1, 1, 1,
-0.5317527, 0.006085243, 0.0703351, 1, 1, 1, 1, 1,
-0.5299968, 1.441593, -1.491078, 1, 1, 1, 1, 1,
-0.5270199, 1.537971, 0.149091, 1, 1, 1, 1, 1,
-0.5269743, -1.401308, -2.334675, 1, 1, 1, 1, 1,
-0.5205719, -1.546864, -0.9318076, 1, 1, 1, 1, 1,
-0.5182309, 1.09905, -0.01835168, 1, 1, 1, 1, 1,
-0.5180989, -0.7237367, -2.739481, 1, 1, 1, 1, 1,
-0.5157908, -0.5192533, -4.201446, 1, 1, 1, 1, 1,
-0.5151058, 0.7368563, 1.150957, 1, 1, 1, 1, 1,
-0.5129294, -0.05657541, -3.063328, 1, 1, 1, 1, 1,
-0.512189, 1.024585, -1.36262, 1, 1, 1, 1, 1,
-0.5092273, 0.7242673, -0.760174, 0, 0, 1, 1, 1,
-0.5068505, 1.830325, 0.336991, 1, 0, 0, 1, 1,
-0.506491, -1.141632, -3.29728, 1, 0, 0, 1, 1,
-0.5048304, 0.2027256, -1.713595, 1, 0, 0, 1, 1,
-0.5037309, 1.29799, 1.320273, 1, 0, 0, 1, 1,
-0.498887, 1.55041, -1.131079, 1, 0, 0, 1, 1,
-0.4949974, 0.9412453, -1.568113, 0, 0, 0, 1, 1,
-0.4931503, 0.3370424, 0.166622, 0, 0, 0, 1, 1,
-0.4840281, 0.02837398, -1.202683, 0, 0, 0, 1, 1,
-0.4835589, -0.05886761, -4.196343, 0, 0, 0, 1, 1,
-0.4822749, -0.7539727, -1.934328, 0, 0, 0, 1, 1,
-0.4811857, 0.7122485, -0.2741302, 0, 0, 0, 1, 1,
-0.479133, 0.3221165, -1.408252, 0, 0, 0, 1, 1,
-0.4790522, -0.143238, -1.004308, 1, 1, 1, 1, 1,
-0.4752044, 1.177729, -0.1500755, 1, 1, 1, 1, 1,
-0.4751074, -0.8010699, -2.799564, 1, 1, 1, 1, 1,
-0.4744895, 1.102991, 0.4106692, 1, 1, 1, 1, 1,
-0.4735803, 1.070119, -0.9812606, 1, 1, 1, 1, 1,
-0.4733381, -0.2781294, -3.156432, 1, 1, 1, 1, 1,
-0.4723643, -0.6334347, -3.471538, 1, 1, 1, 1, 1,
-0.4695247, 1.027329, -1.885052, 1, 1, 1, 1, 1,
-0.4692682, 0.8187711, -1.602948, 1, 1, 1, 1, 1,
-0.4681688, 0.0412908, -0.2138902, 1, 1, 1, 1, 1,
-0.4677577, -0.6885937, -1.62747, 1, 1, 1, 1, 1,
-0.4652201, -0.6007717, -3.572915, 1, 1, 1, 1, 1,
-0.4604629, 1.693573, -1.653385, 1, 1, 1, 1, 1,
-0.459449, 1.182327, -1.494837, 1, 1, 1, 1, 1,
-0.4563496, 0.1346385, -1.796511, 1, 1, 1, 1, 1,
-0.4561147, 1.437652, -0.04819013, 0, 0, 1, 1, 1,
-0.4540924, -0.2266018, -1.482608, 1, 0, 0, 1, 1,
-0.4512066, -0.3439191, -1.216274, 1, 0, 0, 1, 1,
-0.4481099, 1.509472, -0.5314663, 1, 0, 0, 1, 1,
-0.4480162, -0.07248843, -2.276276, 1, 0, 0, 1, 1,
-0.4476255, 1.384007, 0.4327428, 1, 0, 0, 1, 1,
-0.4443663, -0.0717565, -0.7909337, 0, 0, 0, 1, 1,
-0.4441462, -1.417297, -2.498777, 0, 0, 0, 1, 1,
-0.4434597, 0.1678904, 0.6893074, 0, 0, 0, 1, 1,
-0.4430603, 0.4535726, -0.3725099, 0, 0, 0, 1, 1,
-0.4420928, 1.385236, -1.137008, 0, 0, 0, 1, 1,
-0.4379587, 0.04289512, -1.806626, 0, 0, 0, 1, 1,
-0.4376799, -0.7185065, -3.56893, 0, 0, 0, 1, 1,
-0.4367941, -0.7756386, -2.444012, 1, 1, 1, 1, 1,
-0.4354105, 0.4469875, -0.3438975, 1, 1, 1, 1, 1,
-0.4344302, 0.4834493, 0.08486928, 1, 1, 1, 1, 1,
-0.4337612, 0.5793473, 0.04744953, 1, 1, 1, 1, 1,
-0.4293937, -1.038594, -1.969957, 1, 1, 1, 1, 1,
-0.4288307, 0.6263133, -1.158586, 1, 1, 1, 1, 1,
-0.4272403, -1.653544, -3.205647, 1, 1, 1, 1, 1,
-0.4229067, -1.873609, -1.723834, 1, 1, 1, 1, 1,
-0.4225978, -1.025763, -1.829959, 1, 1, 1, 1, 1,
-0.4212957, 0.8320426, -0.9512072, 1, 1, 1, 1, 1,
-0.4184094, 0.6361527, 0.2345011, 1, 1, 1, 1, 1,
-0.4177014, -2.252112, -3.402022, 1, 1, 1, 1, 1,
-0.4156181, 1.369259, -1.698598, 1, 1, 1, 1, 1,
-0.4135917, 0.4966102, -1.556471, 1, 1, 1, 1, 1,
-0.4119888, -1.100656, -3.537702, 1, 1, 1, 1, 1,
-0.4112094, -0.7598633, -2.728365, 0, 0, 1, 1, 1,
-0.4104281, -0.5146775, -3.101946, 1, 0, 0, 1, 1,
-0.3981192, -0.6003909, -2.448035, 1, 0, 0, 1, 1,
-0.3963219, 1.373085, 0.1952148, 1, 0, 0, 1, 1,
-0.3929988, -1.064489, -1.727031, 1, 0, 0, 1, 1,
-0.3929518, 2.10464, 1.163161, 1, 0, 0, 1, 1,
-0.3890035, 0.672274, -1.779004, 0, 0, 0, 1, 1,
-0.3869562, 0.3275625, -0.7516843, 0, 0, 0, 1, 1,
-0.3860537, 2.613952, -2.453494, 0, 0, 0, 1, 1,
-0.3841539, -0.2905928, -1.376902, 0, 0, 0, 1, 1,
-0.383786, 1.522484, -0.1758209, 0, 0, 0, 1, 1,
-0.3825292, 1.2021, -0.6982627, 0, 0, 0, 1, 1,
-0.3801621, -2.092363, -3.608685, 0, 0, 0, 1, 1,
-0.3770939, -0.7929252, -1.688223, 1, 1, 1, 1, 1,
-0.3761849, -0.425795, -2.530826, 1, 1, 1, 1, 1,
-0.3705938, 0.6998468, -0.4246518, 1, 1, 1, 1, 1,
-0.3701659, 0.6009936, -0.6854156, 1, 1, 1, 1, 1,
-0.3689847, 0.3099398, -2.075646, 1, 1, 1, 1, 1,
-0.3686419, 0.2106426, -2.650722, 1, 1, 1, 1, 1,
-0.3680927, 1.56437, -0.2744425, 1, 1, 1, 1, 1,
-0.3607864, 1.867575, -0.4788919, 1, 1, 1, 1, 1,
-0.3596148, -0.3978224, -2.385436, 1, 1, 1, 1, 1,
-0.3565964, 1.09723, -2.367493, 1, 1, 1, 1, 1,
-0.3527797, -0.2808398, -2.783353, 1, 1, 1, 1, 1,
-0.3521004, -0.1355964, -2.376913, 1, 1, 1, 1, 1,
-0.3516125, -0.6092961, -2.772117, 1, 1, 1, 1, 1,
-0.3508273, 1.412129, 0.2013189, 1, 1, 1, 1, 1,
-0.3484774, 0.2668568, -2.223575, 1, 1, 1, 1, 1,
-0.3444335, 1.235377, 0.4824863, 0, 0, 1, 1, 1,
-0.3441583, -1.463978, -2.224796, 1, 0, 0, 1, 1,
-0.3433362, 1.151466, 0.1507876, 1, 0, 0, 1, 1,
-0.3424927, 0.830032, -0.4794718, 1, 0, 0, 1, 1,
-0.3397754, 1.723857, 0.6653598, 1, 0, 0, 1, 1,
-0.3293182, 1.556105, -0.9713199, 1, 0, 0, 1, 1,
-0.3263145, -1.23472, -1.850334, 0, 0, 0, 1, 1,
-0.319591, -1.012068, -2.844832, 0, 0, 0, 1, 1,
-0.3185513, -0.7504606, -2.860109, 0, 0, 0, 1, 1,
-0.3120217, -1.573183, -3.572318, 0, 0, 0, 1, 1,
-0.3097487, 0.8189182, 0.3839742, 0, 0, 0, 1, 1,
-0.3075266, -0.9348454, -3.92907, 0, 0, 0, 1, 1,
-0.3034879, -1.054432, -5.230135, 0, 0, 0, 1, 1,
-0.2994473, 0.6282058, 0.6459314, 1, 1, 1, 1, 1,
-0.2972827, 0.7740092, -1.851629, 1, 1, 1, 1, 1,
-0.2929215, 1.120824, -0.4085257, 1, 1, 1, 1, 1,
-0.2916594, -0.8157551, -2.050851, 1, 1, 1, 1, 1,
-0.2909698, -2.346224, -3.711244, 1, 1, 1, 1, 1,
-0.2787455, -0.2096468, -2.435523, 1, 1, 1, 1, 1,
-0.2766108, -0.9264362, -3.135828, 1, 1, 1, 1, 1,
-0.2757646, 0.1332393, -1.090938, 1, 1, 1, 1, 1,
-0.2718559, -0.3385482, -3.929427, 1, 1, 1, 1, 1,
-0.270185, 0.6678126, -1.092996, 1, 1, 1, 1, 1,
-0.2691454, 0.2251749, -0.2882921, 1, 1, 1, 1, 1,
-0.2670729, 0.2134645, -1.530666, 1, 1, 1, 1, 1,
-0.2649884, -0.1279133, -1.991915, 1, 1, 1, 1, 1,
-0.2601406, -0.2805265, 0.08144953, 1, 1, 1, 1, 1,
-0.2573094, 1.763836, 0.9774645, 1, 1, 1, 1, 1,
-0.2569745, -2.423248, -2.897184, 0, 0, 1, 1, 1,
-0.2567912, -0.5487063, -2.985607, 1, 0, 0, 1, 1,
-0.2533881, 0.4352859, -0.2221176, 1, 0, 0, 1, 1,
-0.2527236, -0.2290672, -3.55846, 1, 0, 0, 1, 1,
-0.2517904, -0.2231801, -2.270318, 1, 0, 0, 1, 1,
-0.2484424, 0.4294582, 0.2698846, 1, 0, 0, 1, 1,
-0.2479014, 0.4184579, -0.6519547, 0, 0, 0, 1, 1,
-0.2426034, 0.3474546, 0.570443, 0, 0, 0, 1, 1,
-0.2410269, 2.158311, -1.814269, 0, 0, 0, 1, 1,
-0.2336587, -0.2945185, -0.6074927, 0, 0, 0, 1, 1,
-0.2253353, -0.1222341, -1.349073, 0, 0, 0, 1, 1,
-0.2140193, 0.1563877, -0.947634, 0, 0, 0, 1, 1,
-0.2120949, -0.3687355, -3.964564, 0, 0, 0, 1, 1,
-0.2115155, -0.6704721, -3.804941, 1, 1, 1, 1, 1,
-0.2093742, 0.4585362, -1.280001, 1, 1, 1, 1, 1,
-0.2081057, -0.7365651, -4.256085, 1, 1, 1, 1, 1,
-0.2053342, -1.699783, -4.10182, 1, 1, 1, 1, 1,
-0.2043811, 0.7654975, -0.3444792, 1, 1, 1, 1, 1,
-0.1992238, 0.7857361, -0.980174, 1, 1, 1, 1, 1,
-0.197004, 0.2309736, 0.6900462, 1, 1, 1, 1, 1,
-0.1965234, 0.2504806, -1.248279, 1, 1, 1, 1, 1,
-0.1952269, -0.9015108, -2.750926, 1, 1, 1, 1, 1,
-0.1908596, 0.04153796, -0.4326888, 1, 1, 1, 1, 1,
-0.1901655, -0.2836577, -4.078335, 1, 1, 1, 1, 1,
-0.1884231, 0.05888996, -2.244776, 1, 1, 1, 1, 1,
-0.1824529, -0.8530179, -1.467456, 1, 1, 1, 1, 1,
-0.1803845, -0.8265046, -4.290851, 1, 1, 1, 1, 1,
-0.1802435, 1.213047, 0.6399007, 1, 1, 1, 1, 1,
-0.1772986, 0.474533, 0.6796646, 0, 0, 1, 1, 1,
-0.1761456, -1.157649, -3.284717, 1, 0, 0, 1, 1,
-0.1633216, 0.3963415, 0.6787543, 1, 0, 0, 1, 1,
-0.1465024, 0.3771257, -0.6566238, 1, 0, 0, 1, 1,
-0.1436446, -0.1491358, -2.605162, 1, 0, 0, 1, 1,
-0.1410227, 1.091168, -0.5226858, 1, 0, 0, 1, 1,
-0.1396487, -0.7973908, -2.72335, 0, 0, 0, 1, 1,
-0.132383, -0.5701224, -1.990021, 0, 0, 0, 1, 1,
-0.1317759, -0.4202586, -3.662333, 0, 0, 0, 1, 1,
-0.1278756, 0.0783402, -1.482371, 0, 0, 0, 1, 1,
-0.1246493, 0.5537006, 0.8106506, 0, 0, 0, 1, 1,
-0.1241639, -1.083709, -1.75369, 0, 0, 0, 1, 1,
-0.1224359, 0.1255488, 0.5229409, 0, 0, 0, 1, 1,
-0.1213988, 0.4521888, -1.849292, 1, 1, 1, 1, 1,
-0.1209865, 1.989702, 0.549671, 1, 1, 1, 1, 1,
-0.1203664, 0.6163715, 0.3414187, 1, 1, 1, 1, 1,
-0.1173902, -3.048932, -2.615075, 1, 1, 1, 1, 1,
-0.1155779, 0.2292303, -0.9426673, 1, 1, 1, 1, 1,
-0.1153408, -0.205851, -2.393469, 1, 1, 1, 1, 1,
-0.1109579, -0.1522266, -1.647615, 1, 1, 1, 1, 1,
-0.107551, -0.3693149, -3.991344, 1, 1, 1, 1, 1,
-0.1066482, 0.1143948, -1.775515, 1, 1, 1, 1, 1,
-0.1060176, 0.09314038, -1.201982, 1, 1, 1, 1, 1,
-0.1047989, -0.4239917, -3.641226, 1, 1, 1, 1, 1,
-0.1009413, 0.06771847, -1.056263, 1, 1, 1, 1, 1,
-0.09708431, -0.8977751, -2.978785, 1, 1, 1, 1, 1,
-0.09122311, 0.6932561, 0.2540529, 1, 1, 1, 1, 1,
-0.08795156, -0.06922968, -3.40936, 1, 1, 1, 1, 1,
-0.08414142, 2.405149, 1.216141, 0, 0, 1, 1, 1,
-0.08154842, -0.1021026, -2.97846, 1, 0, 0, 1, 1,
-0.08104371, -0.9449303, -5.11902, 1, 0, 0, 1, 1,
-0.07666872, -1.17107, -3.778981, 1, 0, 0, 1, 1,
-0.0686496, -0.3412746, -2.056867, 1, 0, 0, 1, 1,
-0.06782907, 0.01893467, -1.152646, 1, 0, 0, 1, 1,
-0.0644939, 1.010409, 0.9518394, 0, 0, 0, 1, 1,
-0.06438857, -1.707363, -3.948415, 0, 0, 0, 1, 1,
-0.0632047, 0.1799188, -1.236765, 0, 0, 0, 1, 1,
-0.06242592, 0.08059508, 0.3494451, 0, 0, 0, 1, 1,
-0.05554948, 0.07530273, -1.495112, 0, 0, 0, 1, 1,
-0.04259999, -2.449107, -2.651032, 0, 0, 0, 1, 1,
-0.03781284, -1.238227, -3.144522, 0, 0, 0, 1, 1,
-0.03643011, -0.3059502, -4.762633, 1, 1, 1, 1, 1,
-0.03496933, -1.256257, -3.531956, 1, 1, 1, 1, 1,
-0.03431308, 0.6832229, 0.9077682, 1, 1, 1, 1, 1,
-0.0316386, -0.4254004, -2.400004, 1, 1, 1, 1, 1,
-0.02934732, 1.424086, -0.8335292, 1, 1, 1, 1, 1,
-0.02546256, 0.6815918, -0.5117246, 1, 1, 1, 1, 1,
-0.0236654, -0.2350354, -4.496303, 1, 1, 1, 1, 1,
-0.02273649, -1.070005, -5.538664, 1, 1, 1, 1, 1,
-0.02259584, 0.03111596, -0.5883018, 1, 1, 1, 1, 1,
-0.02092897, 1.282858, 0.3654508, 1, 1, 1, 1, 1,
-0.01852636, 0.01557174, -2.391893, 1, 1, 1, 1, 1,
-0.01640187, 0.01967441, 0.4273524, 1, 1, 1, 1, 1,
-0.009731987, 0.2058498, 1.149031, 1, 1, 1, 1, 1,
-0.006336837, 1.214175, -1.31454, 1, 1, 1, 1, 1,
-0.005852956, -0.7504954, -3.322989, 1, 1, 1, 1, 1,
-0.004153382, 1.44196, 1.175211, 0, 0, 1, 1, 1,
-0.00390751, 0.05819383, -0.3152554, 1, 0, 0, 1, 1,
-0.001228324, -0.1456606, -2.779561, 1, 0, 0, 1, 1,
-2.48339e-05, -0.2633899, -3.911295, 1, 0, 0, 1, 1,
0.0004456032, 0.6753982, -0.007529875, 1, 0, 0, 1, 1,
0.002981249, 1.225124, 0.3249494, 1, 0, 0, 1, 1,
0.006048722, 1.935021, 0.3914212, 0, 0, 0, 1, 1,
0.006942182, -0.04675926, 3.532785, 0, 0, 0, 1, 1,
0.00699449, 0.1076452, 0.07456965, 0, 0, 0, 1, 1,
0.007744652, -0.002936768, 3.763348, 0, 0, 0, 1, 1,
0.009690463, -0.3880658, 3.705647, 0, 0, 0, 1, 1,
0.01274526, -0.6418285, 4.981142, 0, 0, 0, 1, 1,
0.01580484, -0.3011072, 3.391114, 0, 0, 0, 1, 1,
0.01764023, -0.7212007, 3.020804, 1, 1, 1, 1, 1,
0.01832167, 0.3278415, -1.177051, 1, 1, 1, 1, 1,
0.01858415, -0.9252433, 3.684355, 1, 1, 1, 1, 1,
0.01887904, 0.9706792, -1.984957, 1, 1, 1, 1, 1,
0.02206715, 2.322106, 0.1365322, 1, 1, 1, 1, 1,
0.02423338, -1.80861, 2.145741, 1, 1, 1, 1, 1,
0.02484642, 0.6939538, 0.2431896, 1, 1, 1, 1, 1,
0.02795034, 0.002123101, 0.9792261, 1, 1, 1, 1, 1,
0.03444891, 0.01986976, 0.2305806, 1, 1, 1, 1, 1,
0.04104137, 1.367661, -1.542665, 1, 1, 1, 1, 1,
0.0484001, 0.8412349, -1.105427, 1, 1, 1, 1, 1,
0.0501185, 1.434794, 0.1407304, 1, 1, 1, 1, 1,
0.05054887, -0.7234042, 4.523662, 1, 1, 1, 1, 1,
0.05118345, 0.1536889, 1.056166, 1, 1, 1, 1, 1,
0.05739384, 0.1438167, -0.03126659, 1, 1, 1, 1, 1,
0.05793246, -0.4692493, 2.451347, 0, 0, 1, 1, 1,
0.06109718, -0.1883683, 3.678855, 1, 0, 0, 1, 1,
0.06151772, 1.337533, 0.4512311, 1, 0, 0, 1, 1,
0.06458284, -0.7428458, 2.247478, 1, 0, 0, 1, 1,
0.0665063, 0.1783267, -1.180466, 1, 0, 0, 1, 1,
0.06731633, -0.5877876, 5.932256, 1, 0, 0, 1, 1,
0.06967358, 0.4417918, -1.449274, 0, 0, 0, 1, 1,
0.06995464, 0.09560516, 1.175606, 0, 0, 0, 1, 1,
0.07063425, 0.4093175, -1.756801, 0, 0, 0, 1, 1,
0.07379533, -0.6595048, 2.150491, 0, 0, 0, 1, 1,
0.08005991, 0.3754874, 0.2581289, 0, 0, 0, 1, 1,
0.08006858, 2.113946, -0.8715459, 0, 0, 0, 1, 1,
0.08542424, 0.1482325, 0.709388, 0, 0, 0, 1, 1,
0.08558885, 0.7268577, 1.164925, 1, 1, 1, 1, 1,
0.0856241, -0.8763, 1.236593, 1, 1, 1, 1, 1,
0.08936707, -0.05823963, 2.521949, 1, 1, 1, 1, 1,
0.0968755, 0.993045, -0.3026714, 1, 1, 1, 1, 1,
0.09799467, -0.7771646, 3.370039, 1, 1, 1, 1, 1,
0.09981655, 0.8749866, -1.444474, 1, 1, 1, 1, 1,
0.1000458, -1.578964, 4.364095, 1, 1, 1, 1, 1,
0.1017382, -0.924805, 3.00266, 1, 1, 1, 1, 1,
0.1022579, -1.613192, 4.193347, 1, 1, 1, 1, 1,
0.1025362, 0.1783392, -1.270607, 1, 1, 1, 1, 1,
0.1041292, 1.0054, 0.8289792, 1, 1, 1, 1, 1,
0.1052141, 2.262617, 0.5648307, 1, 1, 1, 1, 1,
0.1098761, 0.7266812, 1.948127, 1, 1, 1, 1, 1,
0.1129882, -1.777546, 1.831636, 1, 1, 1, 1, 1,
0.1141172, -0.4360721, 2.194027, 1, 1, 1, 1, 1,
0.1176219, 0.3703023, 1.485369, 0, 0, 1, 1, 1,
0.1176618, 1.475154, -1.415314, 1, 0, 0, 1, 1,
0.1184426, -2.425611, 1.726585, 1, 0, 0, 1, 1,
0.1190864, -1.310702, 3.542594, 1, 0, 0, 1, 1,
0.1203118, 0.3873547, -0.07949006, 1, 0, 0, 1, 1,
0.1208404, -1.208364, 2.834997, 1, 0, 0, 1, 1,
0.1216947, -0.7688841, 2.447735, 0, 0, 0, 1, 1,
0.1288484, -0.5617498, 4.55476, 0, 0, 0, 1, 1,
0.1296952, -1.048311, 1.628024, 0, 0, 0, 1, 1,
0.1359385, 1.824767, -1.147351, 0, 0, 0, 1, 1,
0.1360261, -1.310559, 3.990125, 0, 0, 0, 1, 1,
0.1386538, 0.4909033, -0.8361324, 0, 0, 0, 1, 1,
0.1440758, 0.7092133, -0.7956562, 0, 0, 0, 1, 1,
0.1443404, -0.06481463, 0.9742146, 1, 1, 1, 1, 1,
0.1470019, 0.5696404, 1.00674, 1, 1, 1, 1, 1,
0.1470841, -0.1650073, 2.968666, 1, 1, 1, 1, 1,
0.1479231, -0.8900642, 4.309614, 1, 1, 1, 1, 1,
0.1489626, -0.6140632, 4.208921, 1, 1, 1, 1, 1,
0.1534099, 0.4208311, -0.3005033, 1, 1, 1, 1, 1,
0.1540348, 1.122393, 2.570282, 1, 1, 1, 1, 1,
0.154106, 0.7354553, 0.1135186, 1, 1, 1, 1, 1,
0.1545255, -0.5191441, 2.132303, 1, 1, 1, 1, 1,
0.1559879, -0.5030595, 2.478932, 1, 1, 1, 1, 1,
0.1577796, 0.5985693, -0.05539482, 1, 1, 1, 1, 1,
0.1608414, 0.587689, -1.628888, 1, 1, 1, 1, 1,
0.1632368, 1.194235, -1.613677, 1, 1, 1, 1, 1,
0.1675904, -1.233465, 4.527007, 1, 1, 1, 1, 1,
0.1694607, -0.9710186, 1.831232, 1, 1, 1, 1, 1,
0.1731288, -2.209256, 1.593593, 0, 0, 1, 1, 1,
0.1740103, -1.025483, 4.069482, 1, 0, 0, 1, 1,
0.1752566, 1.013222, -0.6183749, 1, 0, 0, 1, 1,
0.1798143, 0.04755672, 0.8351885, 1, 0, 0, 1, 1,
0.1830668, -1.099474, 1.83297, 1, 0, 0, 1, 1,
0.1834772, 0.4422749, 1.045851, 1, 0, 0, 1, 1,
0.1888111, -0.7907956, 2.231364, 0, 0, 0, 1, 1,
0.1920129, -1.182769, 3.932815, 0, 0, 0, 1, 1,
0.193519, 0.377636, 0.7485743, 0, 0, 0, 1, 1,
0.195173, 0.9566194, -0.4723505, 0, 0, 0, 1, 1,
0.1955248, 1.072406, -0.4432571, 0, 0, 0, 1, 1,
0.1974855, 0.7360654, 1.992011, 0, 0, 0, 1, 1,
0.2059762, -0.5830669, 3.199023, 0, 0, 0, 1, 1,
0.2069839, 0.628868, 0.8160995, 1, 1, 1, 1, 1,
0.2129389, 1.496195, -1.407773, 1, 1, 1, 1, 1,
0.2158687, -0.786993, 2.010231, 1, 1, 1, 1, 1,
0.2184597, -0.8835757, 2.080142, 1, 1, 1, 1, 1,
0.2185174, 1.177625, 3.003521, 1, 1, 1, 1, 1,
0.2198559, 0.3601732, 1.854924, 1, 1, 1, 1, 1,
0.2225025, -0.56761, 1.361548, 1, 1, 1, 1, 1,
0.2230544, 0.6031196, -0.5262586, 1, 1, 1, 1, 1,
0.2260909, -1.488475, 2.651065, 1, 1, 1, 1, 1,
0.2296899, 0.2398839, 0.1300967, 1, 1, 1, 1, 1,
0.2308549, -0.5080231, 2.74804, 1, 1, 1, 1, 1,
0.2324897, 0.9050404, -0.2426066, 1, 1, 1, 1, 1,
0.2333145, -0.3397761, 3.982284, 1, 1, 1, 1, 1,
0.2352585, 1.874656, -0.06437229, 1, 1, 1, 1, 1,
0.2367096, -0.1221415, 1.012657, 1, 1, 1, 1, 1,
0.2390109, -2.386942, 3.835886, 0, 0, 1, 1, 1,
0.2415038, -0.2591692, 0.3757811, 1, 0, 0, 1, 1,
0.2502696, 0.1928779, 0.6068384, 1, 0, 0, 1, 1,
0.2537956, 0.2577443, -0.007993075, 1, 0, 0, 1, 1,
0.25471, 1.052301, 0.9705018, 1, 0, 0, 1, 1,
0.2557758, 0.5053235, -0.1488794, 1, 0, 0, 1, 1,
0.2566844, 1.168399, 1.664817, 0, 0, 0, 1, 1,
0.2641778, -1.072294, 2.347927, 0, 0, 0, 1, 1,
0.2688122, -0.1061691, 1.381126, 0, 0, 0, 1, 1,
0.2724848, -0.1000942, 1.356296, 0, 0, 0, 1, 1,
0.2764229, -1.891136, 2.37669, 0, 0, 0, 1, 1,
0.2773062, 0.0237755, 3.026782, 0, 0, 0, 1, 1,
0.2785733, -0.292736, 2.569703, 0, 0, 0, 1, 1,
0.2848891, 0.9860762, -0.6126417, 1, 1, 1, 1, 1,
0.2851838, -0.8836769, 1.417248, 1, 1, 1, 1, 1,
0.2862996, 0.8296153, 0.04103402, 1, 1, 1, 1, 1,
0.2885087, 0.859999, 0.3437107, 1, 1, 1, 1, 1,
0.2889896, -0.1781292, 1.924519, 1, 1, 1, 1, 1,
0.2896672, -1.535893, 2.920277, 1, 1, 1, 1, 1,
0.2929845, -0.4618446, 3.823008, 1, 1, 1, 1, 1,
0.2955405, -0.4586111, 2.993903, 1, 1, 1, 1, 1,
0.2965827, 0.8124198, 0.4356265, 1, 1, 1, 1, 1,
0.29681, 1.002908, -0.2756742, 1, 1, 1, 1, 1,
0.3040692, 0.2427626, 2.791277, 1, 1, 1, 1, 1,
0.3074886, 0.6532116, 0.4581334, 1, 1, 1, 1, 1,
0.3074932, -0.8116425, 1.477866, 1, 1, 1, 1, 1,
0.3076912, -0.8413972, 3.210094, 1, 1, 1, 1, 1,
0.3078669, 0.1188767, 3.183731, 1, 1, 1, 1, 1,
0.3081462, -0.1979619, 1.436589, 0, 0, 1, 1, 1,
0.3095802, 1.124298, 1.842092, 1, 0, 0, 1, 1,
0.3113732, 0.3685215, 1.898711, 1, 0, 0, 1, 1,
0.3123553, -1.754359, 2.491914, 1, 0, 0, 1, 1,
0.3131632, 0.08505483, 1.042341, 1, 0, 0, 1, 1,
0.3158328, -0.4063801, 3.159565, 1, 0, 0, 1, 1,
0.316772, 1.291071, -0.7793602, 0, 0, 0, 1, 1,
0.3209913, -1.286608, 2.974443, 0, 0, 0, 1, 1,
0.3246541, 0.9221308, -1.452959, 0, 0, 0, 1, 1,
0.3302815, 0.2893562, -0.3722938, 0, 0, 0, 1, 1,
0.3343191, 0.2726009, -0.2305821, 0, 0, 0, 1, 1,
0.3372767, -0.8189116, 3.503246, 0, 0, 0, 1, 1,
0.337975, 0.9082258, -0.2127993, 0, 0, 0, 1, 1,
0.3444475, -0.6054078, 2.758194, 1, 1, 1, 1, 1,
0.3466837, -1.226032, 3.958555, 1, 1, 1, 1, 1,
0.3505555, -1.196357, 4.811778, 1, 1, 1, 1, 1,
0.3516975, 0.8825731, -0.6378577, 1, 1, 1, 1, 1,
0.3518255, -1.431846, 2.282485, 1, 1, 1, 1, 1,
0.3569236, -0.8115938, 1.64879, 1, 1, 1, 1, 1,
0.3570829, -0.1316108, 1.061988, 1, 1, 1, 1, 1,
0.3605678, -0.127144, 0.5708352, 1, 1, 1, 1, 1,
0.3635364, -1.054654, 3.559919, 1, 1, 1, 1, 1,
0.3674607, -0.643906, 2.051624, 1, 1, 1, 1, 1,
0.3734158, -0.04645981, 2.089499, 1, 1, 1, 1, 1,
0.3739299, 0.553147, 0.5482146, 1, 1, 1, 1, 1,
0.3753443, -0.227366, 2.627697, 1, 1, 1, 1, 1,
0.3807584, 0.3869045, 0.5720166, 1, 1, 1, 1, 1,
0.3888611, 1.60329, 0.2812401, 1, 1, 1, 1, 1,
0.3934844, -0.2943177, 2.243842, 0, 0, 1, 1, 1,
0.3942183, -1.088433, 2.046524, 1, 0, 0, 1, 1,
0.3963348, -1.132681, 3.543387, 1, 0, 0, 1, 1,
0.4048778, 0.8852544, 0.06345922, 1, 0, 0, 1, 1,
0.4063191, 0.6225615, 0.05279122, 1, 0, 0, 1, 1,
0.4065259, 1.792467, 0.7108584, 1, 0, 0, 1, 1,
0.406993, -0.1372009, 1.130624, 0, 0, 0, 1, 1,
0.4158879, -0.6824425, 3.618723, 0, 0, 0, 1, 1,
0.4209823, 1.786411, 0.3856355, 0, 0, 0, 1, 1,
0.4263963, 0.1562113, 2.585458, 0, 0, 0, 1, 1,
0.4271207, -0.252386, 1.296239, 0, 0, 0, 1, 1,
0.4279294, 0.4164936, 0.875999, 0, 0, 0, 1, 1,
0.4290283, 0.5891194, 1.367517, 0, 0, 0, 1, 1,
0.4352628, -0.2365718, 3.082349, 1, 1, 1, 1, 1,
0.4390754, -0.3332025, 1.129359, 1, 1, 1, 1, 1,
0.4393536, -0.6659575, 2.85507, 1, 1, 1, 1, 1,
0.4427944, -0.6335668, 1.434465, 1, 1, 1, 1, 1,
0.4448542, -0.5681005, 2.848345, 1, 1, 1, 1, 1,
0.4472745, -0.8243785, 3.596367, 1, 1, 1, 1, 1,
0.451078, 1.450536, -0.1831717, 1, 1, 1, 1, 1,
0.454624, 0.5559573, 0.3556424, 1, 1, 1, 1, 1,
0.4685861, 1.957133, 0.09972525, 1, 1, 1, 1, 1,
0.469075, -1.506619, 1.078236, 1, 1, 1, 1, 1,
0.4700103, 0.656428, 0.3027981, 1, 1, 1, 1, 1,
0.4762381, 1.993285, 2.641177, 1, 1, 1, 1, 1,
0.476925, 1.594793, -0.7717255, 1, 1, 1, 1, 1,
0.4793031, 0.7443601, 0.8044077, 1, 1, 1, 1, 1,
0.4798689, 0.4386642, 2.220098, 1, 1, 1, 1, 1,
0.4802489, 0.5356549, 3.096149, 0, 0, 1, 1, 1,
0.4865434, -0.8431157, 1.854692, 1, 0, 0, 1, 1,
0.4866256, 0.6066462, 0.4168105, 1, 0, 0, 1, 1,
0.4872532, -0.6679136, 2.665867, 1, 0, 0, 1, 1,
0.4873478, 0.3588718, -0.1474334, 1, 0, 0, 1, 1,
0.4912508, -0.1397637, 2.16197, 1, 0, 0, 1, 1,
0.4946417, -1.098922, 1.825231, 0, 0, 0, 1, 1,
0.4968266, 0.2381278, 3.044573, 0, 0, 0, 1, 1,
0.4987991, 0.5572562, 1.845707, 0, 0, 0, 1, 1,
0.5019826, -0.1054582, 2.249894, 0, 0, 0, 1, 1,
0.5049008, -0.4908633, 1.488908, 0, 0, 0, 1, 1,
0.5066747, 0.44542, 1.594014, 0, 0, 0, 1, 1,
0.5073372, 0.8243871, -0.594268, 0, 0, 0, 1, 1,
0.5145587, 0.290256, 3.759779, 1, 1, 1, 1, 1,
0.5162891, 1.113818, 1.143458, 1, 1, 1, 1, 1,
0.5176769, 1.583611, -0.239977, 1, 1, 1, 1, 1,
0.5224782, 0.4851468, -0.4200761, 1, 1, 1, 1, 1,
0.5230529, -0.3499496, 0.6749292, 1, 1, 1, 1, 1,
0.5252491, 0.1712312, 3.410573, 1, 1, 1, 1, 1,
0.5265767, -0.7706468, 2.997042, 1, 1, 1, 1, 1,
0.5300513, -1.589734, 2.620085, 1, 1, 1, 1, 1,
0.5396073, 0.3578008, 0.7211105, 1, 1, 1, 1, 1,
0.5398573, -0.1626988, 2.625709, 1, 1, 1, 1, 1,
0.5413837, -0.5465737, 2.139456, 1, 1, 1, 1, 1,
0.5419259, -0.1945999, 1.449561, 1, 1, 1, 1, 1,
0.5432212, -1.137088, 2.311629, 1, 1, 1, 1, 1,
0.546077, -0.01468256, 1.485624, 1, 1, 1, 1, 1,
0.5487114, 0.540715, 2.201861, 1, 1, 1, 1, 1,
0.5663249, -2.414944, 1.591838, 0, 0, 1, 1, 1,
0.5667615, 1.750219, -0.2893533, 1, 0, 0, 1, 1,
0.5670344, 0.05408538, -0.3581681, 1, 0, 0, 1, 1,
0.570805, 1.567833, 0.4319024, 1, 0, 0, 1, 1,
0.574809, -1.400031, 2.221264, 1, 0, 0, 1, 1,
0.5751012, 0.05725402, 1.137616, 1, 0, 0, 1, 1,
0.5765612, 0.9876579, -0.127601, 0, 0, 0, 1, 1,
0.5836523, -0.4168936, 3.334514, 0, 0, 0, 1, 1,
0.5854673, 0.2811457, 2.352239, 0, 0, 0, 1, 1,
0.5866593, 0.9554459, 0.3780404, 0, 0, 0, 1, 1,
0.5907658, -0.3582158, 0.8730399, 0, 0, 0, 1, 1,
0.5925149, -0.7374879, 2.766271, 0, 0, 0, 1, 1,
0.5942904, 0.9935634, -0.1467922, 0, 0, 0, 1, 1,
0.59575, 0.8574313, -0.7099671, 1, 1, 1, 1, 1,
0.5975503, -0.3635565, 1.268891, 1, 1, 1, 1, 1,
0.6000639, -0.8178513, 2.759784, 1, 1, 1, 1, 1,
0.6099936, -0.06173007, 3.992146, 1, 1, 1, 1, 1,
0.6161726, -0.2305189, 2.907829, 1, 1, 1, 1, 1,
0.61988, 1.641162, 0.2950293, 1, 1, 1, 1, 1,
0.6255181, -0.4579504, 0.6240241, 1, 1, 1, 1, 1,
0.6259863, -0.7866107, 2.471918, 1, 1, 1, 1, 1,
0.6301329, -0.6328907, 1.489487, 1, 1, 1, 1, 1,
0.6302552, 0.9291397, 0.6693617, 1, 1, 1, 1, 1,
0.6306676, 0.4632403, 0.7430565, 1, 1, 1, 1, 1,
0.6328813, 0.1679676, 0.7958715, 1, 1, 1, 1, 1,
0.6337734, 0.5931522, 1.600391, 1, 1, 1, 1, 1,
0.6420219, 1.351068, -0.5602993, 1, 1, 1, 1, 1,
0.6451431, -0.1761672, 0.7272663, 1, 1, 1, 1, 1,
0.6456224, -1.991495, 2.530724, 0, 0, 1, 1, 1,
0.6458442, 0.2084506, -0.5133759, 1, 0, 0, 1, 1,
0.6628534, -1.565246, 2.27547, 1, 0, 0, 1, 1,
0.6634361, 0.03576666, 0.390897, 1, 0, 0, 1, 1,
0.6649396, 0.217445, 1.279968, 1, 0, 0, 1, 1,
0.6693375, -1.304327, 0.5997815, 1, 0, 0, 1, 1,
0.6695313, -0.2798823, 1.470629, 0, 0, 0, 1, 1,
0.6748066, -0.9322778, 1.904276, 0, 0, 0, 1, 1,
0.675213, -1.400582, 1.729549, 0, 0, 0, 1, 1,
0.6783031, -1.408311, 3.650191, 0, 0, 0, 1, 1,
0.6783958, 1.58033, 0.03390868, 0, 0, 0, 1, 1,
0.6824254, 2.534784, -0.3071523, 0, 0, 0, 1, 1,
0.6826763, -0.5402364, 1.441468, 0, 0, 0, 1, 1,
0.6838965, 0.7955331, 2.018121, 1, 1, 1, 1, 1,
0.6854513, 0.8700676, -0.3908782, 1, 1, 1, 1, 1,
0.6855285, -0.3079055, 2.435072, 1, 1, 1, 1, 1,
0.6868421, 0.05569016, 1.784694, 1, 1, 1, 1, 1,
0.6914731, 0.03186468, 1.985059, 1, 1, 1, 1, 1,
0.6916372, -0.5631088, 0.9281229, 1, 1, 1, 1, 1,
0.6964697, -1.530265, 1.542928, 1, 1, 1, 1, 1,
0.7027332, 0.3065004, 1.452108, 1, 1, 1, 1, 1,
0.7115065, -0.5608351, 1.871227, 1, 1, 1, 1, 1,
0.7147343, 0.4938533, 0.5767782, 1, 1, 1, 1, 1,
0.7234218, -0.7129501, 3.768046, 1, 1, 1, 1, 1,
0.7245871, -0.7205229, 1.885252, 1, 1, 1, 1, 1,
0.7291014, 0.2945761, 1.077468, 1, 1, 1, 1, 1,
0.7347282, 1.041126, -0.5915242, 1, 1, 1, 1, 1,
0.7369756, -0.1541918, 0.6237189, 1, 1, 1, 1, 1,
0.7402167, -1.851643, 3.108977, 0, 0, 1, 1, 1,
0.7417993, 1.737207, 0.01375869, 1, 0, 0, 1, 1,
0.7424566, 0.5517556, 1.007469, 1, 0, 0, 1, 1,
0.7467006, -0.1634924, 2.977129, 1, 0, 0, 1, 1,
0.7509215, -0.2990284, 3.362553, 1, 0, 0, 1, 1,
0.7520603, -0.6554582, 0.7585075, 1, 0, 0, 1, 1,
0.7523302, 0.7236255, 0.9074045, 0, 0, 0, 1, 1,
0.7527748, 0.943983, 0.8798588, 0, 0, 0, 1, 1,
0.7569391, 1.6547, 0.418364, 0, 0, 0, 1, 1,
0.7571789, -1.476844, 1.585148, 0, 0, 0, 1, 1,
0.7634357, 0.3236054, 0.6415439, 0, 0, 0, 1, 1,
0.7662562, 0.1607182, 1.384762, 0, 0, 0, 1, 1,
0.7776783, 1.948025, -0.6710552, 0, 0, 0, 1, 1,
0.781636, 2.166844, -1.383375, 1, 1, 1, 1, 1,
0.7887691, -0.8254231, 3.487113, 1, 1, 1, 1, 1,
0.7903081, -0.05012077, 1.968215, 1, 1, 1, 1, 1,
0.8030732, -0.24589, 3.475939, 1, 1, 1, 1, 1,
0.8093905, -0.2699021, 2.343097, 1, 1, 1, 1, 1,
0.8103215, -0.4382305, 3.58131, 1, 1, 1, 1, 1,
0.8149486, -0.3307466, 1.728287, 1, 1, 1, 1, 1,
0.8149505, -0.5893803, 2.632338, 1, 1, 1, 1, 1,
0.8152647, 0.5855719, 1.83865, 1, 1, 1, 1, 1,
0.8219712, 0.5733049, -0.2017313, 1, 1, 1, 1, 1,
0.8307021, 0.5521628, 1.862298, 1, 1, 1, 1, 1,
0.8356109, -1.30988, 3.33161, 1, 1, 1, 1, 1,
0.8507829, -1.505545, 1.728596, 1, 1, 1, 1, 1,
0.8512279, 0.7105806, 2.08706, 1, 1, 1, 1, 1,
0.8646572, -0.04051834, 0.3295631, 1, 1, 1, 1, 1,
0.8677362, 1.8456, 0.8643407, 0, 0, 1, 1, 1,
0.8715668, -1.940335, 2.810863, 1, 0, 0, 1, 1,
0.8758808, 0.3758275, -0.2032616, 1, 0, 0, 1, 1,
0.8775849, -0.529305, 2.353904, 1, 0, 0, 1, 1,
0.8802717, 0.7134798, 2.121845, 1, 0, 0, 1, 1,
0.882299, -0.2963598, 2.436069, 1, 0, 0, 1, 1,
0.8870001, -0.1887505, 1.79049, 0, 0, 0, 1, 1,
0.8937891, -0.4484033, 2.297072, 0, 0, 0, 1, 1,
0.9014781, -0.4900593, 1.964516, 0, 0, 0, 1, 1,
0.905186, 1.044804, 0.5123316, 0, 0, 0, 1, 1,
0.9057055, -1.947889, 4.369038, 0, 0, 0, 1, 1,
0.9151391, 0.1397139, 1.274229, 0, 0, 0, 1, 1,
0.9235912, -0.03309674, 2.723343, 0, 0, 0, 1, 1,
0.9244287, -0.9912817, 3.730818, 1, 1, 1, 1, 1,
0.9251938, -1.167849, 2.275983, 1, 1, 1, 1, 1,
0.9270874, -0.8386478, 3.029091, 1, 1, 1, 1, 1,
0.9280373, -0.6708355, 2.145969, 1, 1, 1, 1, 1,
0.9289248, 1.017789, -0.5573518, 1, 1, 1, 1, 1,
0.9338099, 0.0006825225, 4.372849, 1, 1, 1, 1, 1,
0.934796, -0.1607196, 2.917762, 1, 1, 1, 1, 1,
0.9411783, -0.1440316, -0.3445476, 1, 1, 1, 1, 1,
0.9413758, -1.319232, 3.342618, 1, 1, 1, 1, 1,
0.9425375, 1.798721, 0.1233582, 1, 1, 1, 1, 1,
0.9560772, -0.9134889, 1.965294, 1, 1, 1, 1, 1,
0.9596095, -0.9487238, 0.8109128, 1, 1, 1, 1, 1,
0.9739448, -1.860978, 1.53552, 1, 1, 1, 1, 1,
0.9762215, -0.5594189, 2.76203, 1, 1, 1, 1, 1,
0.9767059, 0.04953509, -0.787856, 1, 1, 1, 1, 1,
0.9825609, 0.8820809, 1.542948, 0, 0, 1, 1, 1,
0.9845098, 1.047404, 0.4853084, 1, 0, 0, 1, 1,
0.9846229, -0.1013723, 2.139874, 1, 0, 0, 1, 1,
0.9859133, 0.1587615, 3.074082, 1, 0, 0, 1, 1,
0.98742, -1.830343, 3.84624, 1, 0, 0, 1, 1,
0.9893179, -0.1985338, 1.975551, 1, 0, 0, 1, 1,
0.9950531, -1.919272, 2.912014, 0, 0, 0, 1, 1,
0.9997647, 0.3350532, 3.481957, 0, 0, 0, 1, 1,
0.9998719, 1.211574, 0.1465812, 0, 0, 0, 1, 1,
1.003502, 1.123494, 0.5356473, 0, 0, 0, 1, 1,
1.004128, 0.1015045, 2.815297, 0, 0, 0, 1, 1,
1.005759, 1.927275, -0.9373639, 0, 0, 0, 1, 1,
1.021337, 1.167738, 2.672875, 0, 0, 0, 1, 1,
1.026458, 0.1356666, 1.067126, 1, 1, 1, 1, 1,
1.032604, 0.5335988, 1.366505, 1, 1, 1, 1, 1,
1.040561, 0.2086536, -0.4156354, 1, 1, 1, 1, 1,
1.052414, 0.4349806, -0.9161983, 1, 1, 1, 1, 1,
1.057104, -1.165116, 1.753645, 1, 1, 1, 1, 1,
1.062748, -0.1322432, 1.192761, 1, 1, 1, 1, 1,
1.07342, 0.6037521, 2.051043, 1, 1, 1, 1, 1,
1.075371, 0.921683, 0.2086594, 1, 1, 1, 1, 1,
1.080059, 0.03278418, 1.076578, 1, 1, 1, 1, 1,
1.081298, 1.018084, -0.1163109, 1, 1, 1, 1, 1,
1.08526, 1.676378, 0.5290681, 1, 1, 1, 1, 1,
1.088864, 0.0739923, 1.987225, 1, 1, 1, 1, 1,
1.099205, -0.1352102, 2.025027, 1, 1, 1, 1, 1,
1.10682, -1.282029, 1.196474, 1, 1, 1, 1, 1,
1.114083, 0.3965734, 1.26337, 1, 1, 1, 1, 1,
1.12145, -0.9427034, 1.701747, 0, 0, 1, 1, 1,
1.122337, 0.03519885, 2.25841, 1, 0, 0, 1, 1,
1.122775, 0.2234593, 1.430772, 1, 0, 0, 1, 1,
1.130238, 0.6114796, 2.604249, 1, 0, 0, 1, 1,
1.1323, -0.623085, 1.264621, 1, 0, 0, 1, 1,
1.140594, 0.5250808, 2.314246, 1, 0, 0, 1, 1,
1.141278, -0.5939675, 1.796893, 0, 0, 0, 1, 1,
1.14291, -0.04456814, 1.882294, 0, 0, 0, 1, 1,
1.147521, 0.2079524, 0.1647384, 0, 0, 0, 1, 1,
1.158554, 0.3581882, 1.847928, 0, 0, 0, 1, 1,
1.162369, -0.792051, 2.44173, 0, 0, 0, 1, 1,
1.16545, -0.1674336, 2.532471, 0, 0, 0, 1, 1,
1.171765, -0.2293603, 2.151409, 0, 0, 0, 1, 1,
1.17319, -1.652754, 2.913865, 1, 1, 1, 1, 1,
1.200459, -0.5161751, 3.742377, 1, 1, 1, 1, 1,
1.205999, -1.030282, 2.329728, 1, 1, 1, 1, 1,
1.212246, 0.9564847, 1.674714, 1, 1, 1, 1, 1,
1.21715, -0.1111666, 2.609773, 1, 1, 1, 1, 1,
1.22361, 0.02206497, 1.706099, 1, 1, 1, 1, 1,
1.228425, -0.5902736, 1.409014, 1, 1, 1, 1, 1,
1.235617, 0.3467398, 0.5700104, 1, 1, 1, 1, 1,
1.244659, 0.9898335, -0.7511252, 1, 1, 1, 1, 1,
1.245168, -1.523101, 2.573061, 1, 1, 1, 1, 1,
1.25497, 0.2484855, 0.8072643, 1, 1, 1, 1, 1,
1.27395, 0.2139769, 1.136975, 1, 1, 1, 1, 1,
1.287927, 0.4978755, 1.924555, 1, 1, 1, 1, 1,
1.289829, -0.813054, 0.5674949, 1, 1, 1, 1, 1,
1.292228, -0.7254492, 2.220765, 1, 1, 1, 1, 1,
1.296319, -1.318301, 3.066251, 0, 0, 1, 1, 1,
1.30336, -0.3739266, 3.135368, 1, 0, 0, 1, 1,
1.324535, -1.490563, 2.343753, 1, 0, 0, 1, 1,
1.325291, 1.318207, 0.4544793, 1, 0, 0, 1, 1,
1.328654, 1.048695, 0.2448403, 1, 0, 0, 1, 1,
1.333707, -1.835928, 3.048151, 1, 0, 0, 1, 1,
1.337608, 0.02087374, 2.150505, 0, 0, 0, 1, 1,
1.346735, 0.3731436, 1.17609, 0, 0, 0, 1, 1,
1.346837, 0.2043843, 1.014589, 0, 0, 0, 1, 1,
1.351138, -0.3781355, 1.091317, 0, 0, 0, 1, 1,
1.355443, -0.9020901, 1.877607, 0, 0, 0, 1, 1,
1.364427, -0.1866539, 1.497063, 0, 0, 0, 1, 1,
1.37073, -0.8835188, 1.311809, 0, 0, 0, 1, 1,
1.390115, 0.8315328, -0.3887594, 1, 1, 1, 1, 1,
1.398166, -1.053537, 1.529757, 1, 1, 1, 1, 1,
1.409912, 0.09533867, 1.093921, 1, 1, 1, 1, 1,
1.410409, -0.9351199, 2.218493, 1, 1, 1, 1, 1,
1.417006, 0.02012278, 1.664736, 1, 1, 1, 1, 1,
1.418073, 0.8749207, 1.946408, 1, 1, 1, 1, 1,
1.425314, 1.662389, 0.1214858, 1, 1, 1, 1, 1,
1.446948, -0.9799188, 2.170204, 1, 1, 1, 1, 1,
1.455685, -0.3607893, 1.409433, 1, 1, 1, 1, 1,
1.457324, 0.2166715, 2.530634, 1, 1, 1, 1, 1,
1.46508, -2.046926, 1.840997, 1, 1, 1, 1, 1,
1.469903, 1.113898, 0.8394452, 1, 1, 1, 1, 1,
1.48178, -1.742871, 2.271694, 1, 1, 1, 1, 1,
1.486265, -0.5638086, 3.14454, 1, 1, 1, 1, 1,
1.493007, -0.2264187, 0.525816, 1, 1, 1, 1, 1,
1.504185, -0.1646034, 3.169502, 0, 0, 1, 1, 1,
1.511122, -1.103556, 2.782434, 1, 0, 0, 1, 1,
1.51229, 0.9191851, -0.1139049, 1, 0, 0, 1, 1,
1.517859, -0.4590747, 1.315213, 1, 0, 0, 1, 1,
1.527386, 0.09094416, 2.311929, 1, 0, 0, 1, 1,
1.527466, -1.357843, 2.806932, 1, 0, 0, 1, 1,
1.529061, 1.579933, 2.559092, 0, 0, 0, 1, 1,
1.531631, 1.038303, 0.7302238, 0, 0, 0, 1, 1,
1.53788, -0.446508, 2.543444, 0, 0, 0, 1, 1,
1.538014, 1.188548, 0.9377469, 0, 0, 0, 1, 1,
1.578784, 0.3763427, 0.4293119, 0, 0, 0, 1, 1,
1.588157, -0.3602468, 1.117809, 0, 0, 0, 1, 1,
1.608696, -0.4703433, 2.230577, 0, 0, 0, 1, 1,
1.60973, 0.09442678, 2.761854, 1, 1, 1, 1, 1,
1.624462, -1.708624, 2.149036, 1, 1, 1, 1, 1,
1.631, 0.5629882, -0.3989018, 1, 1, 1, 1, 1,
1.631107, 0.5629125, 1.352056, 1, 1, 1, 1, 1,
1.631906, 2.129312, 1.939095, 1, 1, 1, 1, 1,
1.633106, -0.6534814, 1.382111, 1, 1, 1, 1, 1,
1.636372, -0.5270472, 1.740586, 1, 1, 1, 1, 1,
1.647704, 0.07562801, 1.813273, 1, 1, 1, 1, 1,
1.649164, -0.6308709, 1.380639, 1, 1, 1, 1, 1,
1.659192, -0.7750206, 1.499597, 1, 1, 1, 1, 1,
1.668833, -1.696712, 1.860236, 1, 1, 1, 1, 1,
1.694703, -0.9173844, 0.8604827, 1, 1, 1, 1, 1,
1.71412, 0.2998315, 1.968919, 1, 1, 1, 1, 1,
1.743328, 0.6743491, 0.4803044, 1, 1, 1, 1, 1,
1.746638, -1.154604, 1.652476, 1, 1, 1, 1, 1,
1.747247, -1.183117, 2.788227, 0, 0, 1, 1, 1,
1.767199, 0.05256202, 0.9432451, 1, 0, 0, 1, 1,
1.773597, -0.02070276, 2.649289, 1, 0, 0, 1, 1,
1.778385, -1.140375, 2.190546, 1, 0, 0, 1, 1,
1.779404, 0.891253, -0.7721977, 1, 0, 0, 1, 1,
1.782944, -0.3582729, 1.494295, 1, 0, 0, 1, 1,
1.799049, -1.597504, 2.56051, 0, 0, 0, 1, 1,
1.809734, 0.125624, 0.4002559, 0, 0, 0, 1, 1,
1.819621, -0.2827419, 1.2221, 0, 0, 0, 1, 1,
1.829427, -0.3873541, 2.396389, 0, 0, 0, 1, 1,
1.838645, -0.4070122, -0.6409328, 0, 0, 0, 1, 1,
1.840546, 0.001194901, 0.8574989, 0, 0, 0, 1, 1,
1.842261, 0.644985, 2.225938, 0, 0, 0, 1, 1,
1.871462, -0.3344504, 0.2430628, 1, 1, 1, 1, 1,
1.888043, -0.5577815, 2.519185, 1, 1, 1, 1, 1,
1.888942, -0.09983456, 0.5232598, 1, 1, 1, 1, 1,
1.890906, -0.2176831, 3.662644, 1, 1, 1, 1, 1,
1.929519, 1.406569, 1.813456, 1, 1, 1, 1, 1,
1.949106, 1.204767, 3.354397, 1, 1, 1, 1, 1,
1.958462, 2.098585, 1.493772, 1, 1, 1, 1, 1,
1.972225, 0.8702043, 1.733884, 1, 1, 1, 1, 1,
1.995677, -0.3864168, 1.554351, 1, 1, 1, 1, 1,
2.003098, 1.639284, 0.9092821, 1, 1, 1, 1, 1,
2.004936, -0.3947737, 1.825662, 1, 1, 1, 1, 1,
2.02144, 2.034106, 0.4756596, 1, 1, 1, 1, 1,
2.03279, 0.5424948, 1.550146, 1, 1, 1, 1, 1,
2.138875, 2.055474, 1.64599, 1, 1, 1, 1, 1,
2.193437, -0.319715, 1.841047, 1, 1, 1, 1, 1,
2.222444, 0.2947623, 1.865745, 0, 0, 1, 1, 1,
2.228188, 0.763011, 1.097625, 1, 0, 0, 1, 1,
2.253278, 0.6829878, 0.7367661, 1, 0, 0, 1, 1,
2.274363, 0.4633203, 2.134709, 1, 0, 0, 1, 1,
2.278902, 0.7275342, 2.598372, 1, 0, 0, 1, 1,
2.31556, 1.116889, 0.365512, 1, 0, 0, 1, 1,
2.336938, 1.302293, 1.862638, 0, 0, 0, 1, 1,
2.361663, -0.07196508, -0.40053, 0, 0, 0, 1, 1,
2.416904, -1.220492, -0.129246, 0, 0, 0, 1, 1,
2.423087, -0.079579, 2.868361, 0, 0, 0, 1, 1,
2.449491, 1.22689, 4.238152, 0, 0, 0, 1, 1,
2.482474, -1.855803, 0.8753888, 0, 0, 0, 1, 1,
2.556554, 2.040874, 1.297313, 0, 0, 0, 1, 1,
2.657819, -0.1552411, 0.1961752, 1, 1, 1, 1, 1,
2.732212, 1.451295, 0.2320461, 1, 1, 1, 1, 1,
3.132737, -1.696501, 1.285645, 1, 1, 1, 1, 1,
3.363398, 0.4154592, 2.926743, 1, 1, 1, 1, 1,
3.5429, 0.9424585, 1.532452, 1, 1, 1, 1, 1,
3.811577, 0.393795, 1.120151, 1, 1, 1, 1, 1,
4.507759, 1.494134, 0.5472555, 1, 1, 1, 1, 1
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
var radius = 10.09876;
var distance = 35.47148;
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
mvMatrix.translate( -0.9469163, -0.207526, -0.1967957 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.47148);
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