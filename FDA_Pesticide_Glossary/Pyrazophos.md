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
-2.778403, 0.4333403, -0.9402228, 1, 0, 0, 1,
-2.559655, 0.1518216, -2.660194, 1, 0.007843138, 0, 1,
-2.472407, -1.560142, -0.9212887, 1, 0.01176471, 0, 1,
-2.468811, 0.3849598, -1.257356, 1, 0.01960784, 0, 1,
-2.326629, -0.5232124, -3.322492, 1, 0.02352941, 0, 1,
-2.300728, -2.258438, -1.293261, 1, 0.03137255, 0, 1,
-2.300137, 1.219614, -0.8889908, 1, 0.03529412, 0, 1,
-2.253765, -0.4413815, -0.5536707, 1, 0.04313726, 0, 1,
-2.245114, -1.399043, -0.6329682, 1, 0.04705882, 0, 1,
-2.244549, 0.8042682, -0.4748981, 1, 0.05490196, 0, 1,
-2.206426, 1.036736, -2.794238, 1, 0.05882353, 0, 1,
-2.118558, 0.4894778, -0.8401769, 1, 0.06666667, 0, 1,
-2.114357, 0.4268022, -0.08158994, 1, 0.07058824, 0, 1,
-2.100811, 0.841349, -1.810081, 1, 0.07843138, 0, 1,
-2.097074, -0.2051418, -2.052336, 1, 0.08235294, 0, 1,
-2.04781, 1.844119, -0.05669668, 1, 0.09019608, 0, 1,
-2.00282, -0.6237547, -1.488289, 1, 0.09411765, 0, 1,
-1.977584, -1.000045, -2.785231, 1, 0.1019608, 0, 1,
-1.977097, -0.8435766, -1.327009, 1, 0.1098039, 0, 1,
-1.940464, 0.3169287, -2.891177, 1, 0.1137255, 0, 1,
-1.9331, -0.7630509, -1.82818, 1, 0.1215686, 0, 1,
-1.907208, -0.7226315, -2.924373, 1, 0.1254902, 0, 1,
-1.885415, 1.410595, -0.2419479, 1, 0.1333333, 0, 1,
-1.8737, -1.46159, -2.077208, 1, 0.1372549, 0, 1,
-1.873539, -0.6875102, -2.445798, 1, 0.145098, 0, 1,
-1.871439, 0.4554723, -1.086766, 1, 0.1490196, 0, 1,
-1.818907, 1.543905, -0.1171383, 1, 0.1568628, 0, 1,
-1.810812, 0.5223077, -2.964905, 1, 0.1607843, 0, 1,
-1.804872, -0.7601842, -2.476671, 1, 0.1686275, 0, 1,
-1.793718, 0.3212189, -2.256549, 1, 0.172549, 0, 1,
-1.788789, 0.003281298, -2.129734, 1, 0.1803922, 0, 1,
-1.755566, -0.02485043, -2.599391, 1, 0.1843137, 0, 1,
-1.745586, -0.843799, -1.993468, 1, 0.1921569, 0, 1,
-1.739073, 0.9153419, -2.630192, 1, 0.1960784, 0, 1,
-1.735864, -0.131922, -2.27892, 1, 0.2039216, 0, 1,
-1.72918, 1.193891, -0.09460393, 1, 0.2117647, 0, 1,
-1.693854, 0.9942337, -3.034172, 1, 0.2156863, 0, 1,
-1.692443, 0.06223463, -3.72169, 1, 0.2235294, 0, 1,
-1.681744, 0.5451044, -3.033454, 1, 0.227451, 0, 1,
-1.648655, -1.08176, -1.473898, 1, 0.2352941, 0, 1,
-1.643009, 0.4688159, -2.097661, 1, 0.2392157, 0, 1,
-1.637612, -1.64874, -0.8964662, 1, 0.2470588, 0, 1,
-1.634921, -1.153197, -3.192127, 1, 0.2509804, 0, 1,
-1.633884, -0.5216645, -2.673167, 1, 0.2588235, 0, 1,
-1.633398, 2.028649, -0.9988869, 1, 0.2627451, 0, 1,
-1.631757, 0.2912677, -2.165348, 1, 0.2705882, 0, 1,
-1.628674, -1.426473, -1.527086, 1, 0.2745098, 0, 1,
-1.625997, -0.5318576, -1.312968, 1, 0.282353, 0, 1,
-1.622883, -0.1090307, -1.273908, 1, 0.2862745, 0, 1,
-1.59833, 0.6042908, -0.6470475, 1, 0.2941177, 0, 1,
-1.597282, -1.662786, -2.79678, 1, 0.3019608, 0, 1,
-1.522395, 0.1222008, -1.452674, 1, 0.3058824, 0, 1,
-1.521536, 0.6403388, -0.3967561, 1, 0.3137255, 0, 1,
-1.521253, 0.5688564, -0.2776485, 1, 0.3176471, 0, 1,
-1.519935, -1.523251, -2.243325, 1, 0.3254902, 0, 1,
-1.51761, 0.6087342, -1.053085, 1, 0.3294118, 0, 1,
-1.509972, -0.2705396, -1.920377, 1, 0.3372549, 0, 1,
-1.504253, -1.351533, -1.742365, 1, 0.3411765, 0, 1,
-1.492148, -0.2157371, -2.195899, 1, 0.3490196, 0, 1,
-1.475543, -0.1715263, 0.5251264, 1, 0.3529412, 0, 1,
-1.471352, -0.4626647, -1.859607, 1, 0.3607843, 0, 1,
-1.436354, -0.8975109, -4.109561, 1, 0.3647059, 0, 1,
-1.430753, 0.05888519, -0.6016423, 1, 0.372549, 0, 1,
-1.427739, 0.8063074, -1.521396, 1, 0.3764706, 0, 1,
-1.427264, -1.82612, -3.461073, 1, 0.3843137, 0, 1,
-1.416549, -1.507046, -2.352875, 1, 0.3882353, 0, 1,
-1.414563, 0.01788868, -0.6993378, 1, 0.3960784, 0, 1,
-1.413207, 0.09084764, -1.847535, 1, 0.4039216, 0, 1,
-1.410849, 0.3281232, 0.5008196, 1, 0.4078431, 0, 1,
-1.393262, 0.6622816, -0.3305442, 1, 0.4156863, 0, 1,
-1.388906, 0.3101362, -0.6213117, 1, 0.4196078, 0, 1,
-1.372409, 0.131087, -2.273066, 1, 0.427451, 0, 1,
-1.372194, 0.5481375, -0.06217979, 1, 0.4313726, 0, 1,
-1.367664, -1.204893, -2.036631, 1, 0.4392157, 0, 1,
-1.359655, -0.3263818, -1.770925, 1, 0.4431373, 0, 1,
-1.35411, 0.8263913, -1.287732, 1, 0.4509804, 0, 1,
-1.352972, 1.162035, -2.554816, 1, 0.454902, 0, 1,
-1.350225, -1.21806, -1.883225, 1, 0.4627451, 0, 1,
-1.341302, 1.020793, -0.4062919, 1, 0.4666667, 0, 1,
-1.338247, -1.492414, -3.524403, 1, 0.4745098, 0, 1,
-1.33713, -0.3575704, -2.236748, 1, 0.4784314, 0, 1,
-1.334647, -0.1554891, -3.986319, 1, 0.4862745, 0, 1,
-1.328239, -0.1088988, -2.299129, 1, 0.4901961, 0, 1,
-1.291349, 0.4985493, -1.749432, 1, 0.4980392, 0, 1,
-1.281139, -0.9750326, -1.243941, 1, 0.5058824, 0, 1,
-1.272006, 1.754679, -0.1816607, 1, 0.509804, 0, 1,
-1.262244, -1.052183, -3.159228, 1, 0.5176471, 0, 1,
-1.256551, -0.2232355, -2.17599, 1, 0.5215687, 0, 1,
-1.251657, 1.360255, -1.380745, 1, 0.5294118, 0, 1,
-1.247727, 1.112216, 0.04974432, 1, 0.5333334, 0, 1,
-1.246577, 0.9001752, -0.7578982, 1, 0.5411765, 0, 1,
-1.237587, -0.8140441, -1.391309, 1, 0.5450981, 0, 1,
-1.235458, 1.2861, -1.560824, 1, 0.5529412, 0, 1,
-1.233216, -1.229702, -2.147208, 1, 0.5568628, 0, 1,
-1.230775, 0.6212009, -1.74481, 1, 0.5647059, 0, 1,
-1.227132, 1.138275, -0.1787586, 1, 0.5686275, 0, 1,
-1.2233, -0.7494844, -2.416072, 1, 0.5764706, 0, 1,
-1.222606, 0.8928818, -1.763538, 1, 0.5803922, 0, 1,
-1.221093, -0.8018336, -2.906081, 1, 0.5882353, 0, 1,
-1.217407, -0.2487324, -0.1727144, 1, 0.5921569, 0, 1,
-1.213052, 0.695566, -2.021468, 1, 0.6, 0, 1,
-1.207259, 0.7716462, -1.370731, 1, 0.6078432, 0, 1,
-1.194487, -0.8783559, -3.781627, 1, 0.6117647, 0, 1,
-1.193313, -0.4358139, -1.63, 1, 0.6196079, 0, 1,
-1.187525, -0.1430417, -1.204378, 1, 0.6235294, 0, 1,
-1.183994, -1.114506, -0.0416153, 1, 0.6313726, 0, 1,
-1.18042, 1.491498, 1.309115, 1, 0.6352941, 0, 1,
-1.178771, -0.03370536, -1.565185, 1, 0.6431373, 0, 1,
-1.176409, 0.3282745, -2.930055, 1, 0.6470588, 0, 1,
-1.173566, 1.858936, 0.7022442, 1, 0.654902, 0, 1,
-1.171218, -0.3767644, -1.911816, 1, 0.6588235, 0, 1,
-1.169317, -0.5884913, -1.358099, 1, 0.6666667, 0, 1,
-1.163123, -0.001877147, -1.777381, 1, 0.6705883, 0, 1,
-1.156107, 0.5915184, -1.464078, 1, 0.6784314, 0, 1,
-1.152558, -1.045596, -1.227885, 1, 0.682353, 0, 1,
-1.150509, 1.784365, -0.01666942, 1, 0.6901961, 0, 1,
-1.145596, -1.721442, -1.986919, 1, 0.6941177, 0, 1,
-1.131268, -0.5498728, -2.788586, 1, 0.7019608, 0, 1,
-1.130239, -2.896024, -0.721432, 1, 0.7098039, 0, 1,
-1.127009, -1.603389, -3.151665, 1, 0.7137255, 0, 1,
-1.125579, -1.312033, -3.099456, 1, 0.7215686, 0, 1,
-1.118694, -0.5000604, -1.209111, 1, 0.7254902, 0, 1,
-1.108656, -0.6993297, -2.512215, 1, 0.7333333, 0, 1,
-1.099048, -0.8031725, -1.614404, 1, 0.7372549, 0, 1,
-1.088363, -0.4897585, -2.449385, 1, 0.7450981, 0, 1,
-1.087566, -1.768679, -2.174724, 1, 0.7490196, 0, 1,
-1.085837, 1.007424, -0.9704687, 1, 0.7568628, 0, 1,
-1.077225, 0.2637677, -1.580051, 1, 0.7607843, 0, 1,
-1.06873, -0.5675671, -1.655933, 1, 0.7686275, 0, 1,
-1.067726, 0.01979585, -1.442518, 1, 0.772549, 0, 1,
-1.058041, 1.406982, 0.4652714, 1, 0.7803922, 0, 1,
-1.056619, 1.550036, -0.08855166, 1, 0.7843137, 0, 1,
-1.055553, -0.4727189, -2.920275, 1, 0.7921569, 0, 1,
-1.055511, -1.018079, 1.098778, 1, 0.7960784, 0, 1,
-1.051004, 1.319071, -0.8970922, 1, 0.8039216, 0, 1,
-1.048834, -1.026062, -1.979381, 1, 0.8117647, 0, 1,
-1.037029, -1.315632, -3.856933, 1, 0.8156863, 0, 1,
-1.035176, -0.9050269, -1.331258, 1, 0.8235294, 0, 1,
-1.034312, 1.839364, -1.120402, 1, 0.827451, 0, 1,
-1.022002, 0.4728578, -1.349086, 1, 0.8352941, 0, 1,
-1.018582, 0.2357943, -2.458769, 1, 0.8392157, 0, 1,
-1.017246, -0.8123432, -3.078313, 1, 0.8470588, 0, 1,
-1.014236, -0.7362152, -2.821381, 1, 0.8509804, 0, 1,
-1.011864, 0.5910226, -1.993579, 1, 0.8588235, 0, 1,
-1.008512, -0.6940539, -1.788157, 1, 0.8627451, 0, 1,
-1.002633, 0.1480458, -0.8872527, 1, 0.8705882, 0, 1,
-0.9966298, 0.9456231, -2.075812, 1, 0.8745098, 0, 1,
-0.9930354, -0.240483, -1.59098, 1, 0.8823529, 0, 1,
-0.9899214, 1.004415, -0.646039, 1, 0.8862745, 0, 1,
-0.9868316, 0.4188119, -2.22938, 1, 0.8941177, 0, 1,
-0.9864147, 0.2234964, -0.777013, 1, 0.8980392, 0, 1,
-0.9837027, 1.215891, -1.270253, 1, 0.9058824, 0, 1,
-0.9795527, -0.3296671, -0.07040582, 1, 0.9137255, 0, 1,
-0.9701064, 0.2263236, -1.552881, 1, 0.9176471, 0, 1,
-0.9600502, 0.4052855, 0.7750452, 1, 0.9254902, 0, 1,
-0.9590497, 0.2086828, -0.9475909, 1, 0.9294118, 0, 1,
-0.9548687, 1.521465, -0.374212, 1, 0.9372549, 0, 1,
-0.9536589, 1.265321, -0.8332896, 1, 0.9411765, 0, 1,
-0.9515424, 0.8875735, 0.09710919, 1, 0.9490196, 0, 1,
-0.9455625, 0.1634793, -1.483509, 1, 0.9529412, 0, 1,
-0.9407509, 1.561662, -1.968194, 1, 0.9607843, 0, 1,
-0.9384872, -1.20959, -0.9555915, 1, 0.9647059, 0, 1,
-0.9383524, -0.2575951, -2.185242, 1, 0.972549, 0, 1,
-0.9358399, 2.33127, -1.849963, 1, 0.9764706, 0, 1,
-0.9237279, -0.7884859, -4.245459, 1, 0.9843137, 0, 1,
-0.9212661, 0.9217315, 0.0653168, 1, 0.9882353, 0, 1,
-0.9124316, -0.4361629, -2.264342, 1, 0.9960784, 0, 1,
-0.9102316, 1.114359, -0.5432923, 0.9960784, 1, 0, 1,
-0.8979198, 0.2837727, -1.987618, 0.9921569, 1, 0, 1,
-0.8973945, -0.171139, -1.512353, 0.9843137, 1, 0, 1,
-0.8934531, 2.051864, -1.619172, 0.9803922, 1, 0, 1,
-0.8933402, 1.558342, -0.5760852, 0.972549, 1, 0, 1,
-0.8837526, 1.096912, 0.1383059, 0.9686275, 1, 0, 1,
-0.8753594, 0.9023986, -0.6553888, 0.9607843, 1, 0, 1,
-0.8721228, -0.5508777, -2.456289, 0.9568627, 1, 0, 1,
-0.8691072, 0.09963343, -3.65485, 0.9490196, 1, 0, 1,
-0.8681743, 1.430848, 0.2439703, 0.945098, 1, 0, 1,
-0.8607169, 0.9865246, -1.561569, 0.9372549, 1, 0, 1,
-0.8590515, -0.3045202, -0.5581574, 0.9333333, 1, 0, 1,
-0.8548218, 0.04959312, -1.153438, 0.9254902, 1, 0, 1,
-0.8491675, -0.5782696, -3.478273, 0.9215686, 1, 0, 1,
-0.8489848, 0.9431621, -1.403906, 0.9137255, 1, 0, 1,
-0.8470061, 0.5755832, -0.06480053, 0.9098039, 1, 0, 1,
-0.8432323, -1.340526, -4.124803, 0.9019608, 1, 0, 1,
-0.8419308, 1.861232, -0.5155246, 0.8941177, 1, 0, 1,
-0.838306, -1.181089, -3.068099, 0.8901961, 1, 0, 1,
-0.8361729, 0.6331123, -0.3947734, 0.8823529, 1, 0, 1,
-0.8358079, 0.03755789, -1.707283, 0.8784314, 1, 0, 1,
-0.8310583, 0.2415225, -1.223429, 0.8705882, 1, 0, 1,
-0.8273603, 0.3734614, -0.2777017, 0.8666667, 1, 0, 1,
-0.8108547, -2.18648, -5.005567, 0.8588235, 1, 0, 1,
-0.8007992, -0.3722596, -0.6902426, 0.854902, 1, 0, 1,
-0.7984419, 1.871544, -0.3738984, 0.8470588, 1, 0, 1,
-0.7932183, 0.5436513, -0.5966128, 0.8431373, 1, 0, 1,
-0.7902576, -1.017539, -2.716738, 0.8352941, 1, 0, 1,
-0.7826114, -0.1278287, -2.531448, 0.8313726, 1, 0, 1,
-0.7743276, 0.9826874, -1.069742, 0.8235294, 1, 0, 1,
-0.7722613, 0.209866, -2.317193, 0.8196079, 1, 0, 1,
-0.7708715, -0.6036676, -0.6734059, 0.8117647, 1, 0, 1,
-0.7702748, 1.218614, -1.781171, 0.8078431, 1, 0, 1,
-0.7685961, -0.8781915, -2.870423, 0.8, 1, 0, 1,
-0.7676217, 0.6683601, -0.7772658, 0.7921569, 1, 0, 1,
-0.7661838, -0.008232313, -2.232007, 0.7882353, 1, 0, 1,
-0.7588685, 0.9239752, 0.9507289, 0.7803922, 1, 0, 1,
-0.7576668, -0.0967098, -4.061628, 0.7764706, 1, 0, 1,
-0.755823, -0.108852, -1.75077, 0.7686275, 1, 0, 1,
-0.7511603, 0.3608392, -1.031039, 0.7647059, 1, 0, 1,
-0.7467892, 1.262019, -0.5546864, 0.7568628, 1, 0, 1,
-0.7451848, 0.7131103, 0.8216115, 0.7529412, 1, 0, 1,
-0.7386834, -1.335598, -2.743239, 0.7450981, 1, 0, 1,
-0.7335159, -0.4115279, -2.471853, 0.7411765, 1, 0, 1,
-0.7327046, -0.08274709, -2.211888, 0.7333333, 1, 0, 1,
-0.731652, 0.7495881, -1.24148, 0.7294118, 1, 0, 1,
-0.7294784, 0.3440364, -1.03119, 0.7215686, 1, 0, 1,
-0.723646, 1.044119, 0.4086943, 0.7176471, 1, 0, 1,
-0.7193425, 1.616467, 0.1705329, 0.7098039, 1, 0, 1,
-0.7177482, -0.8205677, -2.065903, 0.7058824, 1, 0, 1,
-0.7157266, 0.3309233, 0.08566155, 0.6980392, 1, 0, 1,
-0.7152057, 0.481145, -0.8050407, 0.6901961, 1, 0, 1,
-0.713811, -1.020015, -3.806523, 0.6862745, 1, 0, 1,
-0.71297, -0.4852788, -2.550436, 0.6784314, 1, 0, 1,
-0.7125694, -0.4606338, -2.679252, 0.6745098, 1, 0, 1,
-0.7106538, -0.8243037, -0.7545611, 0.6666667, 1, 0, 1,
-0.7094877, -1.40357, -2.85754, 0.6627451, 1, 0, 1,
-0.7040978, 0.4503297, -0.3856217, 0.654902, 1, 0, 1,
-0.6948742, 0.7436758, -1.197654, 0.6509804, 1, 0, 1,
-0.6944937, 0.2421978, -1.90938, 0.6431373, 1, 0, 1,
-0.6852154, 0.3353456, -2.121836, 0.6392157, 1, 0, 1,
-0.6785717, -0.8230077, -2.998776, 0.6313726, 1, 0, 1,
-0.6767877, -1.562318, -3.133064, 0.627451, 1, 0, 1,
-0.6743804, -0.8979542, -1.802402, 0.6196079, 1, 0, 1,
-0.6695912, -0.5229493, -2.337011, 0.6156863, 1, 0, 1,
-0.6677895, 0.1927171, -1.69247, 0.6078432, 1, 0, 1,
-0.664645, 1.602247, -0.2056606, 0.6039216, 1, 0, 1,
-0.6625409, -0.08657739, 0.1889084, 0.5960785, 1, 0, 1,
-0.6619469, -0.9711133, -2.996214, 0.5882353, 1, 0, 1,
-0.6618384, -1.038731, -2.450612, 0.5843138, 1, 0, 1,
-0.6602409, -0.1763525, -3.198646, 0.5764706, 1, 0, 1,
-0.6582823, 2.04991, -0.8533725, 0.572549, 1, 0, 1,
-0.6563873, -1.513468, -0.8903458, 0.5647059, 1, 0, 1,
-0.6502485, -1.17572, -2.198337, 0.5607843, 1, 0, 1,
-0.6395791, 0.09765533, -0.5020825, 0.5529412, 1, 0, 1,
-0.6368925, 1.451119, 0.0016683, 0.5490196, 1, 0, 1,
-0.6343166, 0.8872744, -1.538288, 0.5411765, 1, 0, 1,
-0.6326588, 0.5021002, -0.7893795, 0.5372549, 1, 0, 1,
-0.6319934, -1.730067, -3.025128, 0.5294118, 1, 0, 1,
-0.6316734, 0.4183798, 0.7507458, 0.5254902, 1, 0, 1,
-0.6313935, 0.1860217, -0.5092635, 0.5176471, 1, 0, 1,
-0.622787, -1.27029, -2.617342, 0.5137255, 1, 0, 1,
-0.6191678, 0.3814947, 0.2869377, 0.5058824, 1, 0, 1,
-0.6167622, 0.5798916, -1.521329, 0.5019608, 1, 0, 1,
-0.61272, 0.3506191, -0.6277367, 0.4941176, 1, 0, 1,
-0.6105512, -1.488717, -3.025136, 0.4862745, 1, 0, 1,
-0.608999, -0.6985717, -1.557944, 0.4823529, 1, 0, 1,
-0.6079424, -1.023258, -2.731448, 0.4745098, 1, 0, 1,
-0.5941543, -0.3324864, -0.819614, 0.4705882, 1, 0, 1,
-0.5936273, 0.3897011, -2.473274, 0.4627451, 1, 0, 1,
-0.5934255, -0.007605431, -0.07143111, 0.4588235, 1, 0, 1,
-0.5833583, 0.1037297, -2.989043, 0.4509804, 1, 0, 1,
-0.5800892, -0.8736829, -3.630428, 0.4470588, 1, 0, 1,
-0.5780174, 0.9050274, -0.9324262, 0.4392157, 1, 0, 1,
-0.5777137, 1.297109, -0.1589275, 0.4352941, 1, 0, 1,
-0.5604853, 0.6959952, 0.3004684, 0.427451, 1, 0, 1,
-0.5444097, -0.203391, -0.6345003, 0.4235294, 1, 0, 1,
-0.5431411, -0.4381304, -0.7232448, 0.4156863, 1, 0, 1,
-0.5420793, -0.6357312, -1.425068, 0.4117647, 1, 0, 1,
-0.5398792, 1.315018, 0.4364378, 0.4039216, 1, 0, 1,
-0.5398607, -1.110019, -4.009393, 0.3960784, 1, 0, 1,
-0.5371753, -0.7451784, -1.845894, 0.3921569, 1, 0, 1,
-0.5357167, 0.4058558, -1.9038, 0.3843137, 1, 0, 1,
-0.5338899, 2.424001, -2.042652, 0.3803922, 1, 0, 1,
-0.52926, -0.8977768, -3.194416, 0.372549, 1, 0, 1,
-0.5231346, 0.03881091, -0.8068142, 0.3686275, 1, 0, 1,
-0.5165837, 0.378374, -1.277062, 0.3607843, 1, 0, 1,
-0.5149559, 1.502319, 0.08118217, 0.3568628, 1, 0, 1,
-0.5107445, -1.650465, -3.240254, 0.3490196, 1, 0, 1,
-0.510619, 0.6616377, -1.313186, 0.345098, 1, 0, 1,
-0.5104985, 0.4818558, -1.058198, 0.3372549, 1, 0, 1,
-0.5103403, 0.0895475, -3.087176, 0.3333333, 1, 0, 1,
-0.505922, 0.06833857, 0.01777728, 0.3254902, 1, 0, 1,
-0.4917263, -0.7053425, -3.228606, 0.3215686, 1, 0, 1,
-0.4852172, 1.323714, -1.129862, 0.3137255, 1, 0, 1,
-0.4842686, 0.09777931, -1.478143, 0.3098039, 1, 0, 1,
-0.473031, 0.3092248, -0.6530269, 0.3019608, 1, 0, 1,
-0.4698149, 1.032912, -1.403983, 0.2941177, 1, 0, 1,
-0.4694107, 0.2165581, 0.8127086, 0.2901961, 1, 0, 1,
-0.467834, -0.215638, -1.568226, 0.282353, 1, 0, 1,
-0.4678249, 0.5696062, -0.8214825, 0.2784314, 1, 0, 1,
-0.4674193, 0.4580627, -0.3765658, 0.2705882, 1, 0, 1,
-0.4653456, -0.004294502, -1.180101, 0.2666667, 1, 0, 1,
-0.4653161, 1.596119, -0.7090812, 0.2588235, 1, 0, 1,
-0.4608999, -1.024936, -3.107955, 0.254902, 1, 0, 1,
-0.4529288, -0.1393029, -2.186918, 0.2470588, 1, 0, 1,
-0.4503578, 0.5733851, -1.141594, 0.2431373, 1, 0, 1,
-0.446553, -0.1711244, -4.905126, 0.2352941, 1, 0, 1,
-0.4462669, 1.79075, 1.076106, 0.2313726, 1, 0, 1,
-0.4417504, 0.1253835, -0.9260089, 0.2235294, 1, 0, 1,
-0.4371346, 0.1260186, -0.3452465, 0.2196078, 1, 0, 1,
-0.435871, 0.8775008, 0.1305704, 0.2117647, 1, 0, 1,
-0.4344846, 0.07451198, -4.52423, 0.2078431, 1, 0, 1,
-0.4337791, -0.4880456, -1.445916, 0.2, 1, 0, 1,
-0.4316375, -1.274708, -1.59673, 0.1921569, 1, 0, 1,
-0.4290355, -0.2598076, -1.190093, 0.1882353, 1, 0, 1,
-0.4265627, 0.5394924, -1.050732, 0.1803922, 1, 0, 1,
-0.42388, 0.6455276, -1.25979, 0.1764706, 1, 0, 1,
-0.4205199, -0.9033281, -3.61097, 0.1686275, 1, 0, 1,
-0.4202087, 1.855877, 0.218027, 0.1647059, 1, 0, 1,
-0.4150018, -0.3934783, -3.011888, 0.1568628, 1, 0, 1,
-0.4077075, 1.373812, 0.9361005, 0.1529412, 1, 0, 1,
-0.403093, -0.5421263, -2.392577, 0.145098, 1, 0, 1,
-0.4027674, -0.2479277, -2.641696, 0.1411765, 1, 0, 1,
-0.3953317, -0.4203785, -1.551584, 0.1333333, 1, 0, 1,
-0.394518, -1.63337, -2.208328, 0.1294118, 1, 0, 1,
-0.3915293, 0.1867716, -0.5738127, 0.1215686, 1, 0, 1,
-0.3888454, 0.9454048, -0.402268, 0.1176471, 1, 0, 1,
-0.3854141, 0.5124753, -1.071791, 0.1098039, 1, 0, 1,
-0.3841183, 2.220056, -0.01597583, 0.1058824, 1, 0, 1,
-0.3788104, 0.1965215, -0.172755, 0.09803922, 1, 0, 1,
-0.3712646, -1.279092, -3.178888, 0.09019608, 1, 0, 1,
-0.3676859, 0.1813192, -1.535761, 0.08627451, 1, 0, 1,
-0.367469, -0.03353367, -1.669952, 0.07843138, 1, 0, 1,
-0.3616931, -1.871473, -1.508943, 0.07450981, 1, 0, 1,
-0.3601825, 1.673755, -0.8957459, 0.06666667, 1, 0, 1,
-0.3572873, -1.26759, -1.277675, 0.0627451, 1, 0, 1,
-0.3545486, 0.6106843, -2.181795, 0.05490196, 1, 0, 1,
-0.3485394, -0.331168, -2.851892, 0.05098039, 1, 0, 1,
-0.3434279, -1.458399, -3.139266, 0.04313726, 1, 0, 1,
-0.3382741, -0.7222611, -1.749039, 0.03921569, 1, 0, 1,
-0.3376929, 0.5239215, -1.306599, 0.03137255, 1, 0, 1,
-0.3368053, 0.6695137, 0.4550203, 0.02745098, 1, 0, 1,
-0.3311441, -0.1568493, -0.3150199, 0.01960784, 1, 0, 1,
-0.3286236, 0.8133809, -1.275505, 0.01568628, 1, 0, 1,
-0.3275116, 1.600174, -0.8134037, 0.007843138, 1, 0, 1,
-0.3215971, -0.149581, -2.465515, 0.003921569, 1, 0, 1,
-0.3210689, -0.5406382, -2.689428, 0, 1, 0.003921569, 1,
-0.3188735, -1.852533, -3.73532, 0, 1, 0.01176471, 1,
-0.3182087, -0.4184212, -2.132228, 0, 1, 0.01568628, 1,
-0.3138171, -2.584845, -1.990484, 0, 1, 0.02352941, 1,
-0.3092313, 0.5591735, -0.5165982, 0, 1, 0.02745098, 1,
-0.3074124, -1.018764, -1.95529, 0, 1, 0.03529412, 1,
-0.3061822, -0.01696975, -2.097836, 0, 1, 0.03921569, 1,
-0.3041148, -0.727783, -4.236927, 0, 1, 0.04705882, 1,
-0.3039075, 0.2274389, -0.4348944, 0, 1, 0.05098039, 1,
-0.3035235, -0.2334299, -1.935949, 0, 1, 0.05882353, 1,
-0.3034641, 0.8211762, -0.8793367, 0, 1, 0.0627451, 1,
-0.3014903, 1.512869, -1.728426, 0, 1, 0.07058824, 1,
-0.3004297, 1.220503, 0.6858469, 0, 1, 0.07450981, 1,
-0.2997071, 0.6037084, -0.8608167, 0, 1, 0.08235294, 1,
-0.2976417, -0.4145061, -1.619162, 0, 1, 0.08627451, 1,
-0.2975548, -2.134374, -3.516381, 0, 1, 0.09411765, 1,
-0.2967563, 0.7752847, -0.465333, 0, 1, 0.1019608, 1,
-0.2919004, -0.4876706, -1.992816, 0, 1, 0.1058824, 1,
-0.2904885, 0.6097271, -1.292259, 0, 1, 0.1137255, 1,
-0.2904532, 0.3370186, 1.251932, 0, 1, 0.1176471, 1,
-0.2860979, 0.2193285, -0.7302606, 0, 1, 0.1254902, 1,
-0.2809928, 1.43304, -0.2198796, 0, 1, 0.1294118, 1,
-0.2809814, -1.2946, -3.56162, 0, 1, 0.1372549, 1,
-0.2789173, 0.8162363, 0.9306072, 0, 1, 0.1411765, 1,
-0.2786916, 0.4174176, -0.2202137, 0, 1, 0.1490196, 1,
-0.2771312, 0.5236602, -0.237414, 0, 1, 0.1529412, 1,
-0.2702998, -1.453615, -2.797004, 0, 1, 0.1607843, 1,
-0.2648363, -1.22173, -3.556096, 0, 1, 0.1647059, 1,
-0.2635278, -0.707172, -3.833232, 0, 1, 0.172549, 1,
-0.2615983, -0.2823733, -2.83653, 0, 1, 0.1764706, 1,
-0.2584561, -0.5242473, -4.08956, 0, 1, 0.1843137, 1,
-0.2533962, -0.5567113, -2.380981, 0, 1, 0.1882353, 1,
-0.2483664, -0.3973698, -3.137492, 0, 1, 0.1960784, 1,
-0.2455972, -0.1510914, -1.686014, 0, 1, 0.2039216, 1,
-0.2452019, -0.8384721, -1.495611, 0, 1, 0.2078431, 1,
-0.2427104, 1.624024, -0.7665205, 0, 1, 0.2156863, 1,
-0.2407223, 0.3045303, -0.7269557, 0, 1, 0.2196078, 1,
-0.2402966, 0.9921425, 0.2651814, 0, 1, 0.227451, 1,
-0.2390777, -0.608007, -4.304566, 0, 1, 0.2313726, 1,
-0.2381056, -1.04384, -3.078727, 0, 1, 0.2392157, 1,
-0.2304298, -0.3314413, -4.67525, 0, 1, 0.2431373, 1,
-0.2292205, 0.1452027, 0.3050802, 0, 1, 0.2509804, 1,
-0.2273648, -0.3870042, -2.352842, 0, 1, 0.254902, 1,
-0.2250701, 0.2543007, -1.100186, 0, 1, 0.2627451, 1,
-0.2231146, 0.06453715, -2.36096, 0, 1, 0.2666667, 1,
-0.2228691, 1.012153, -0.2825235, 0, 1, 0.2745098, 1,
-0.2157038, 0.9259543, -0.4405951, 0, 1, 0.2784314, 1,
-0.2144004, -0.9069753, -3.374832, 0, 1, 0.2862745, 1,
-0.2080857, 0.7816198, -0.9673565, 0, 1, 0.2901961, 1,
-0.1994182, 0.7103354, -0.04310817, 0, 1, 0.2980392, 1,
-0.1960566, -1.04337, -2.294691, 0, 1, 0.3058824, 1,
-0.1911057, 0.1550682, -1.996763, 0, 1, 0.3098039, 1,
-0.1857253, -1.550318, -1.80288, 0, 1, 0.3176471, 1,
-0.1829216, 1.150283, 0.2343284, 0, 1, 0.3215686, 1,
-0.1820111, -0.7187099, -3.363147, 0, 1, 0.3294118, 1,
-0.1788413, -1.33811, -2.713304, 0, 1, 0.3333333, 1,
-0.1782792, -0.006299789, -1.619755, 0, 1, 0.3411765, 1,
-0.1763262, 0.2421418, -1.640493, 0, 1, 0.345098, 1,
-0.1749346, -0.3052213, -1.527816, 0, 1, 0.3529412, 1,
-0.1715877, 0.9932171, -0.4245936, 0, 1, 0.3568628, 1,
-0.1670843, -0.7068884, -4.558148, 0, 1, 0.3647059, 1,
-0.1664161, -0.3372604, -2.033065, 0, 1, 0.3686275, 1,
-0.1662336, -0.1241711, -1.023773, 0, 1, 0.3764706, 1,
-0.1611793, 0.8821789, -0.8078793, 0, 1, 0.3803922, 1,
-0.160357, -1.029495, -4.555102, 0, 1, 0.3882353, 1,
-0.1595077, 0.09727427, -1.048749, 0, 1, 0.3921569, 1,
-0.1541088, -0.7721737, -1.99165, 0, 1, 0.4, 1,
-0.1540726, 0.7479303, 0.09216856, 0, 1, 0.4078431, 1,
-0.1508669, 0.9427914, -1.169977, 0, 1, 0.4117647, 1,
-0.1467347, 0.9066738, 1.039227, 0, 1, 0.4196078, 1,
-0.1466672, 1.001474, -0.3384836, 0, 1, 0.4235294, 1,
-0.1464219, -1.44595, -2.561842, 0, 1, 0.4313726, 1,
-0.1445254, 0.2893171, -1.239171, 0, 1, 0.4352941, 1,
-0.141361, 0.6648496, 1.529747, 0, 1, 0.4431373, 1,
-0.1361715, 1.835774, -0.9397951, 0, 1, 0.4470588, 1,
-0.1345372, -0.5842786, -3.998869, 0, 1, 0.454902, 1,
-0.1319303, 0.779721, -0.4338013, 0, 1, 0.4588235, 1,
-0.1315238, -0.9976274, -2.940875, 0, 1, 0.4666667, 1,
-0.1250826, 0.1091354, -1.058008, 0, 1, 0.4705882, 1,
-0.1175407, -0.2112965, -2.202355, 0, 1, 0.4784314, 1,
-0.1151376, 0.7277474, -1.096712, 0, 1, 0.4823529, 1,
-0.1114432, 0.8115435, 0.8917859, 0, 1, 0.4901961, 1,
-0.1101947, 0.7200258, 2.137452, 0, 1, 0.4941176, 1,
-0.110075, 0.1973014, 0.1289473, 0, 1, 0.5019608, 1,
-0.1090162, 1.518241, 1.738833, 0, 1, 0.509804, 1,
-0.1042077, 0.06106872, -1.150835, 0, 1, 0.5137255, 1,
-0.09627176, 1.235543, 1.398441, 0, 1, 0.5215687, 1,
-0.09291665, -0.8222629, -3.296241, 0, 1, 0.5254902, 1,
-0.08930692, 0.9327673, 0.04057251, 0, 1, 0.5333334, 1,
-0.08258021, 0.8540514, -0.5546231, 0, 1, 0.5372549, 1,
-0.08217131, -0.1293019, -2.689828, 0, 1, 0.5450981, 1,
-0.07563906, 1.454679, 0.2946625, 0, 1, 0.5490196, 1,
-0.07457594, -1.351719, -2.3739, 0, 1, 0.5568628, 1,
-0.06849464, 1.603555, -1.227195, 0, 1, 0.5607843, 1,
-0.06838835, 1.683089, -1.942416, 0, 1, 0.5686275, 1,
-0.0680396, -0.108792, -1.238534, 0, 1, 0.572549, 1,
-0.0673056, 1.845768, 0.06565192, 0, 1, 0.5803922, 1,
-0.06688946, -0.5295163, -1.94927, 0, 1, 0.5843138, 1,
-0.06147934, -1.676527, -3.555562, 0, 1, 0.5921569, 1,
-0.06005162, 0.5982142, 0.2740448, 0, 1, 0.5960785, 1,
-0.05920262, 0.9366686, 1.114885, 0, 1, 0.6039216, 1,
-0.05673631, -0.1166472, -4.298662, 0, 1, 0.6117647, 1,
-0.05596123, -0.6933231, -2.40362, 0, 1, 0.6156863, 1,
-0.0547022, -0.5099911, -4.71922, 0, 1, 0.6235294, 1,
-0.05401203, 1.180383, 0.4948018, 0, 1, 0.627451, 1,
-0.05227031, -0.05738904, -1.567215, 0, 1, 0.6352941, 1,
-0.04964096, -0.4355735, -2.822189, 0, 1, 0.6392157, 1,
-0.04471775, 0.03836014, -1.889756, 0, 1, 0.6470588, 1,
-0.04368724, 1.888614, 1.038536, 0, 1, 0.6509804, 1,
-0.04330392, -0.1613909, -2.679759, 0, 1, 0.6588235, 1,
-0.04234262, -0.6382672, -2.533705, 0, 1, 0.6627451, 1,
-0.04123111, -0.4531168, -4.121204, 0, 1, 0.6705883, 1,
-0.03743548, 0.4621954, -2.073433, 0, 1, 0.6745098, 1,
-0.03578315, -2.380069, -3.158622, 0, 1, 0.682353, 1,
-0.03384705, -1.247011, -1.643238, 0, 1, 0.6862745, 1,
-0.03338189, 0.02709296, -2.332099, 0, 1, 0.6941177, 1,
-0.03272481, -1.309384, -3.589164, 0, 1, 0.7019608, 1,
-0.02470009, 1.681506, -0.4088064, 0, 1, 0.7058824, 1,
-0.02170027, -1.696552, -3.247954, 0, 1, 0.7137255, 1,
-0.01905026, 0.853918, 1.027116, 0, 1, 0.7176471, 1,
-0.01163089, -2.327152, -1.185302, 0, 1, 0.7254902, 1,
-0.01072371, -0.6490014, -3.697038, 0, 1, 0.7294118, 1,
-0.009517098, -0.4760024, -2.533417, 0, 1, 0.7372549, 1,
-0.008106946, -0.8158489, -3.646574, 0, 1, 0.7411765, 1,
-0.007813616, 1.823797, -0.5967605, 0, 1, 0.7490196, 1,
-0.006890754, 1.352521, 0.01575585, 0, 1, 0.7529412, 1,
-0.005134668, 0.1732084, -1.77639, 0, 1, 0.7607843, 1,
-0.004884667, -0.08524176, -1.946842, 0, 1, 0.7647059, 1,
-0.001894866, -0.7324702, -1.331209, 0, 1, 0.772549, 1,
0.0006701992, -0.1914665, 3.450469, 0, 1, 0.7764706, 1,
0.006187094, -0.0121164, 1.929962, 0, 1, 0.7843137, 1,
0.008540618, 0.319412, 1.006071, 0, 1, 0.7882353, 1,
0.01313561, 0.06205704, 0.9370219, 0, 1, 0.7960784, 1,
0.01354326, -1.304832, 4.061179, 0, 1, 0.8039216, 1,
0.01736758, 0.1957462, -0.479861, 0, 1, 0.8078431, 1,
0.02004116, -0.4915875, 2.710039, 0, 1, 0.8156863, 1,
0.02107759, 0.8131489, 0.8678402, 0, 1, 0.8196079, 1,
0.02789826, 2.248781, 2.966105, 0, 1, 0.827451, 1,
0.03238242, -2.171047, 4.014965, 0, 1, 0.8313726, 1,
0.03542608, 0.2124926, 0.2340741, 0, 1, 0.8392157, 1,
0.03746812, 1.851073, 0.5630856, 0, 1, 0.8431373, 1,
0.03804395, 0.4430493, -1.051127, 0, 1, 0.8509804, 1,
0.0422198, -0.6747965, 2.884949, 0, 1, 0.854902, 1,
0.04331663, 0.494341, -0.7482311, 0, 1, 0.8627451, 1,
0.04340419, 0.6308139, 1.619131, 0, 1, 0.8666667, 1,
0.04518928, 0.2412136, 0.3368365, 0, 1, 0.8745098, 1,
0.04744767, 0.2276016, -0.8328, 0, 1, 0.8784314, 1,
0.05100083, -1.524806, 3.542283, 0, 1, 0.8862745, 1,
0.05171825, -1.124913, 2.995512, 0, 1, 0.8901961, 1,
0.0529381, 0.9537054, -0.7778906, 0, 1, 0.8980392, 1,
0.05440056, 1.614395, 0.4950444, 0, 1, 0.9058824, 1,
0.05583714, -0.8293508, 3.252801, 0, 1, 0.9098039, 1,
0.0561042, -1.358853, 1.64783, 0, 1, 0.9176471, 1,
0.05831802, -1.272745, 3.609136, 0, 1, 0.9215686, 1,
0.05865967, 0.06926307, 2.554186, 0, 1, 0.9294118, 1,
0.06110134, -0.2173213, 3.986661, 0, 1, 0.9333333, 1,
0.06347979, -0.4537762, 3.297295, 0, 1, 0.9411765, 1,
0.06638332, -1.08787, 3.343821, 0, 1, 0.945098, 1,
0.06678288, -0.1096446, 2.201435, 0, 1, 0.9529412, 1,
0.06812006, -0.6254042, 3.66451, 0, 1, 0.9568627, 1,
0.06843135, 0.7589118, 0.0192638, 0, 1, 0.9647059, 1,
0.07451655, -0.5944217, 5.042545, 0, 1, 0.9686275, 1,
0.07473462, -1.073055, 3.992424, 0, 1, 0.9764706, 1,
0.07699399, 1.292729, -0.04029555, 0, 1, 0.9803922, 1,
0.07784865, -0.3109729, 3.793898, 0, 1, 0.9882353, 1,
0.0791781, -1.165834, 2.649332, 0, 1, 0.9921569, 1,
0.08133039, 1.353023, 0.4690293, 0, 1, 1, 1,
0.08292524, -0.008920834, 0.6826012, 0, 0.9921569, 1, 1,
0.09449603, 0.3713146, 0.5488353, 0, 0.9882353, 1, 1,
0.09724461, -0.1058349, 0.8958712, 0, 0.9803922, 1, 1,
0.1012606, -0.6962416, 2.351538, 0, 0.9764706, 1, 1,
0.1044148, -0.8222368, 2.578625, 0, 0.9686275, 1, 1,
0.1083424, 1.333603, -0.3693699, 0, 0.9647059, 1, 1,
0.1162612, -0.6040738, 2.985333, 0, 0.9568627, 1, 1,
0.1195244, -0.6872488, 1.669066, 0, 0.9529412, 1, 1,
0.1252748, -0.0572811, 0.3756023, 0, 0.945098, 1, 1,
0.1286851, 1.092075, -2.104626, 0, 0.9411765, 1, 1,
0.1309527, 0.2386665, 0.002262308, 0, 0.9333333, 1, 1,
0.1342589, 1.26897, -0.3341466, 0, 0.9294118, 1, 1,
0.1352292, -1.400302, 3.942725, 0, 0.9215686, 1, 1,
0.1381964, 0.1117256, -0.1672881, 0, 0.9176471, 1, 1,
0.143155, 2.399711, -0.451943, 0, 0.9098039, 1, 1,
0.1436163, 0.06102761, 0.1240298, 0, 0.9058824, 1, 1,
0.1443027, 0.3588986, 3.006868, 0, 0.8980392, 1, 1,
0.1446624, 0.2922667, -1.747696, 0, 0.8901961, 1, 1,
0.1471087, -0.91953, 3.013887, 0, 0.8862745, 1, 1,
0.1496963, -0.3323764, 1.690363, 0, 0.8784314, 1, 1,
0.1521102, 1.298021, -0.6097919, 0, 0.8745098, 1, 1,
0.1593589, -0.3467213, 4.156847, 0, 0.8666667, 1, 1,
0.1600233, -0.9874598, 4.783968, 0, 0.8627451, 1, 1,
0.1631911, 0.4866125, -1.437322, 0, 0.854902, 1, 1,
0.1669081, -1.414687, 2.204443, 0, 0.8509804, 1, 1,
0.1670373, 1.14508, 1.303148, 0, 0.8431373, 1, 1,
0.1676086, 0.06298011, 2.360361, 0, 0.8392157, 1, 1,
0.1754278, 0.8651884, -0.3875656, 0, 0.8313726, 1, 1,
0.1758347, 2.342102, 0.4373866, 0, 0.827451, 1, 1,
0.1775957, -0.7831157, 3.023611, 0, 0.8196079, 1, 1,
0.1803057, 0.9314763, 0.1947311, 0, 0.8156863, 1, 1,
0.1813079, -0.4646449, 2.595013, 0, 0.8078431, 1, 1,
0.1839149, 0.1127775, 0.6830927, 0, 0.8039216, 1, 1,
0.1930017, 0.8373107, -0.4147627, 0, 0.7960784, 1, 1,
0.1958336, 0.1254502, 2.956386, 0, 0.7882353, 1, 1,
0.197994, 0.3427627, 1.71268, 0, 0.7843137, 1, 1,
0.2004192, 0.1352602, -0.5373985, 0, 0.7764706, 1, 1,
0.2007175, -0.04907991, 2.168996, 0, 0.772549, 1, 1,
0.2008599, 0.05753696, 1.365354, 0, 0.7647059, 1, 1,
0.2022262, 0.0941252, 0.7862651, 0, 0.7607843, 1, 1,
0.2028435, -0.4072833, 2.844136, 0, 0.7529412, 1, 1,
0.2041336, 0.6722736, -0.7004481, 0, 0.7490196, 1, 1,
0.2043136, 0.4189979, 0.224447, 0, 0.7411765, 1, 1,
0.2089837, -0.9680488, 1.471426, 0, 0.7372549, 1, 1,
0.2108226, 0.08981937, 1.713583, 0, 0.7294118, 1, 1,
0.2122162, 0.01985349, 1.645551, 0, 0.7254902, 1, 1,
0.2131749, 0.1834832, 0.450306, 0, 0.7176471, 1, 1,
0.214158, -0.4458408, 1.50225, 0, 0.7137255, 1, 1,
0.2153785, -0.7444994, 3.280879, 0, 0.7058824, 1, 1,
0.2169307, 0.2693792, 1.532779, 0, 0.6980392, 1, 1,
0.2173936, 0.08549748, 2.232987, 0, 0.6941177, 1, 1,
0.2182138, 1.04893, -0.2321636, 0, 0.6862745, 1, 1,
0.2226475, 1.340591, -2.246245, 0, 0.682353, 1, 1,
0.224849, -0.0649169, 3.44648, 0, 0.6745098, 1, 1,
0.2263966, -0.9328791, 0.7016885, 0, 0.6705883, 1, 1,
0.2280601, 1.864755, 0.6087233, 0, 0.6627451, 1, 1,
0.230129, -1.103675, -0.01234916, 0, 0.6588235, 1, 1,
0.230563, -0.8412474, 1.672738, 0, 0.6509804, 1, 1,
0.2329788, -0.01552767, 0.4401751, 0, 0.6470588, 1, 1,
0.2336212, -0.5358906, 1.898655, 0, 0.6392157, 1, 1,
0.238714, 0.5835856, 1.29253, 0, 0.6352941, 1, 1,
0.2444922, -0.16332, 1.866112, 0, 0.627451, 1, 1,
0.2460321, 0.7604102, 0.8824847, 0, 0.6235294, 1, 1,
0.2503334, -0.003043551, -0.1227624, 0, 0.6156863, 1, 1,
0.2505318, -0.8786417, 4.497631, 0, 0.6117647, 1, 1,
0.2535051, 0.6911547, -0.4290877, 0, 0.6039216, 1, 1,
0.2641133, 0.48643, -0.07895993, 0, 0.5960785, 1, 1,
0.2648646, -1.272243, 3.927944, 0, 0.5921569, 1, 1,
0.2681704, 0.3531576, -0.3227034, 0, 0.5843138, 1, 1,
0.2710774, -0.4792027, 2.635787, 0, 0.5803922, 1, 1,
0.2780271, -0.105858, 2.236768, 0, 0.572549, 1, 1,
0.2784198, -1.081528, 3.11375, 0, 0.5686275, 1, 1,
0.2798053, -0.9100743, 1.782164, 0, 0.5607843, 1, 1,
0.2827741, 0.9601405, 1.073897, 0, 0.5568628, 1, 1,
0.284402, -0.2482303, 3.075865, 0, 0.5490196, 1, 1,
0.2884254, -1.345705, 2.034726, 0, 0.5450981, 1, 1,
0.2905295, -0.6484495, 3.880371, 0, 0.5372549, 1, 1,
0.2912755, 0.950892, 0.4948905, 0, 0.5333334, 1, 1,
0.2921604, -0.5523981, 1.98645, 0, 0.5254902, 1, 1,
0.2942871, 0.03271539, 0.901198, 0, 0.5215687, 1, 1,
0.2951991, -2.063436, 4.097947, 0, 0.5137255, 1, 1,
0.2963327, 1.143091, -1.434066, 0, 0.509804, 1, 1,
0.3057924, -0.3749733, 3.186922, 0, 0.5019608, 1, 1,
0.3080978, -0.5892801, 3.140995, 0, 0.4941176, 1, 1,
0.3082064, -1.653966, 3.761126, 0, 0.4901961, 1, 1,
0.308467, -1.192348, 2.7562, 0, 0.4823529, 1, 1,
0.3095132, -0.2821549, 1.001974, 0, 0.4784314, 1, 1,
0.3127318, -0.7410735, 5.110817, 0, 0.4705882, 1, 1,
0.316418, -0.9932155, 1.02738, 0, 0.4666667, 1, 1,
0.316977, 0.3023865, 1.239861, 0, 0.4588235, 1, 1,
0.3172731, 0.03214175, 0.8788056, 0, 0.454902, 1, 1,
0.3197685, 0.4266048, 1.048528, 0, 0.4470588, 1, 1,
0.3202507, 0.3207236, 0.2189797, 0, 0.4431373, 1, 1,
0.3215667, -0.08792784, 1.544163, 0, 0.4352941, 1, 1,
0.3219593, -0.8469034, 2.60365, 0, 0.4313726, 1, 1,
0.3259106, 0.9906179, -0.009751143, 0, 0.4235294, 1, 1,
0.3271984, -0.8846608, 2.656087, 0, 0.4196078, 1, 1,
0.3276171, -1.401285, 0.4965542, 0, 0.4117647, 1, 1,
0.3288023, -0.7421904, 3.922924, 0, 0.4078431, 1, 1,
0.3317207, -0.684985, 2.045184, 0, 0.4, 1, 1,
0.3335662, 0.9462596, -0.2985092, 0, 0.3921569, 1, 1,
0.33481, -0.2885813, 1.01687, 0, 0.3882353, 1, 1,
0.3370338, -1.552219, 4.964106, 0, 0.3803922, 1, 1,
0.337408, 0.09005641, 0.3760966, 0, 0.3764706, 1, 1,
0.3374602, 0.3975919, 0.532702, 0, 0.3686275, 1, 1,
0.3385451, 1.154043, 0.2468668, 0, 0.3647059, 1, 1,
0.3434507, -0.5257532, 3.415996, 0, 0.3568628, 1, 1,
0.343523, -2.063633, 4.105163, 0, 0.3529412, 1, 1,
0.3445495, -0.2901408, 0.9132361, 0, 0.345098, 1, 1,
0.354088, -0.1401746, 2.416823, 0, 0.3411765, 1, 1,
0.3541915, 0.1667336, 0.6609719, 0, 0.3333333, 1, 1,
0.3572423, 0.9956311, 0.8194066, 0, 0.3294118, 1, 1,
0.3592111, 0.4937041, 1.320831, 0, 0.3215686, 1, 1,
0.3600451, -1.134681, 2.741565, 0, 0.3176471, 1, 1,
0.3678783, -2.271953, 1.237807, 0, 0.3098039, 1, 1,
0.3683819, 0.516978, -0.2231502, 0, 0.3058824, 1, 1,
0.3701556, -0.9111554, 1.618044, 0, 0.2980392, 1, 1,
0.3707732, 1.022998, 0.5483568, 0, 0.2901961, 1, 1,
0.3710793, 0.1081089, -0.8090156, 0, 0.2862745, 1, 1,
0.3713768, 0.6836653, 1.629394, 0, 0.2784314, 1, 1,
0.3718571, 0.9430107, 2.33155, 0, 0.2745098, 1, 1,
0.3747345, -0.502946, 2.682756, 0, 0.2666667, 1, 1,
0.3852617, 1.144499, 0.4806487, 0, 0.2627451, 1, 1,
0.385852, -1.372942, 2.775476, 0, 0.254902, 1, 1,
0.3881395, -0.6458901, 2.243163, 0, 0.2509804, 1, 1,
0.3910463, -0.4540695, 2.757779, 0, 0.2431373, 1, 1,
0.3918512, -0.1064759, 2.743861, 0, 0.2392157, 1, 1,
0.392711, 2.906427, 1.946417, 0, 0.2313726, 1, 1,
0.3959278, -0.3615966, 2.43574, 0, 0.227451, 1, 1,
0.4004718, 0.5628211, -0.5048854, 0, 0.2196078, 1, 1,
0.4075234, -0.857052, 4.142405, 0, 0.2156863, 1, 1,
0.4089081, -0.8675143, 3.151039, 0, 0.2078431, 1, 1,
0.412893, 0.06936359, 1.469994, 0, 0.2039216, 1, 1,
0.4147485, -0.2869563, 3.285393, 0, 0.1960784, 1, 1,
0.4277717, 1.496097, -2.596916, 0, 0.1882353, 1, 1,
0.4316527, 0.5521334, 0.9599825, 0, 0.1843137, 1, 1,
0.4337622, 0.01326641, 1.637893, 0, 0.1764706, 1, 1,
0.4353411, -0.5783096, 2.271045, 0, 0.172549, 1, 1,
0.4473729, -1.524478, 3.330358, 0, 0.1647059, 1, 1,
0.4506715, 0.4965336, -0.2054818, 0, 0.1607843, 1, 1,
0.4522234, 0.4222998, 1.820501, 0, 0.1529412, 1, 1,
0.4526609, 1.344354, 2.237471, 0, 0.1490196, 1, 1,
0.4568499, -0.9253491, 4.025699, 0, 0.1411765, 1, 1,
0.4596226, -1.906207, 2.154841, 0, 0.1372549, 1, 1,
0.460699, -0.1378848, 1.262472, 0, 0.1294118, 1, 1,
0.4610429, 0.2370465, 1.739408, 0, 0.1254902, 1, 1,
0.4645516, -1.136292, 4.151068, 0, 0.1176471, 1, 1,
0.4654825, 0.02010706, 0.8434492, 0, 0.1137255, 1, 1,
0.4673162, 0.8369089, 0.3621196, 0, 0.1058824, 1, 1,
0.4706502, -0.222208, 1.708019, 0, 0.09803922, 1, 1,
0.4798714, -0.6468299, 1.854524, 0, 0.09411765, 1, 1,
0.4892178, -0.110632, 1.334663, 0, 0.08627451, 1, 1,
0.4892605, -0.4452514, 2.191888, 0, 0.08235294, 1, 1,
0.49206, 1.502421, 1.056408, 0, 0.07450981, 1, 1,
0.4931378, -0.7834124, 1.6224, 0, 0.07058824, 1, 1,
0.493412, 0.5127014, 0.1772525, 0, 0.0627451, 1, 1,
0.4937527, -1.296148, 3.141437, 0, 0.05882353, 1, 1,
0.4939616, 1.941075, -1.081651, 0, 0.05098039, 1, 1,
0.4988332, 0.7793531, 0.5933346, 0, 0.04705882, 1, 1,
0.5016414, -0.1583023, 1.935903, 0, 0.03921569, 1, 1,
0.5049993, -1.624103, 3.503363, 0, 0.03529412, 1, 1,
0.5058129, 0.9686893, -0.3059575, 0, 0.02745098, 1, 1,
0.5085849, -1.183161, 1.519248, 0, 0.02352941, 1, 1,
0.5093722, -0.3528478, 1.237316, 0, 0.01568628, 1, 1,
0.5096809, -0.1189274, 1.661943, 0, 0.01176471, 1, 1,
0.5110877, 0.7207934, 0.4629, 0, 0.003921569, 1, 1,
0.5160342, 0.3135488, 0.2950152, 0.003921569, 0, 1, 1,
0.5166896, 0.8247767, 1.896493, 0.007843138, 0, 1, 1,
0.5182133, 0.7134736, 1.29169, 0.01568628, 0, 1, 1,
0.5203586, -0.2700511, 1.585017, 0.01960784, 0, 1, 1,
0.5215088, 0.1482484, 2.569471, 0.02745098, 0, 1, 1,
0.5215698, -0.32115, 2.336721, 0.03137255, 0, 1, 1,
0.5250098, 0.3421522, -0.6124628, 0.03921569, 0, 1, 1,
0.5280254, -1.158829, 0.02658253, 0.04313726, 0, 1, 1,
0.5284954, -0.3617414, 1.683408, 0.05098039, 0, 1, 1,
0.530968, 2.29978, -1.457855, 0.05490196, 0, 1, 1,
0.5324566, 0.2444588, -1.162177, 0.0627451, 0, 1, 1,
0.5348166, 0.7100443, -0.9335329, 0.06666667, 0, 1, 1,
0.5404609, 1.511112, 1.924245, 0.07450981, 0, 1, 1,
0.5442103, -1.385841, 2.223098, 0.07843138, 0, 1, 1,
0.5465155, -2.145469, 0.3512446, 0.08627451, 0, 1, 1,
0.5478606, -1.079668, 3.049031, 0.09019608, 0, 1, 1,
0.5525466, 1.644174, 0.9642355, 0.09803922, 0, 1, 1,
0.5532377, -0.3869568, 2.232185, 0.1058824, 0, 1, 1,
0.5591711, -1.701755, 2.197806, 0.1098039, 0, 1, 1,
0.5618674, 1.381235, -0.1316114, 0.1176471, 0, 1, 1,
0.5681013, -1.411399, 4.394865, 0.1215686, 0, 1, 1,
0.5690256, 1.76932, -0.6473069, 0.1294118, 0, 1, 1,
0.5695673, -0.2984691, 2.681206, 0.1333333, 0, 1, 1,
0.5707741, 0.6509244, 2.797541, 0.1411765, 0, 1, 1,
0.5778575, 0.763332, 0.8073331, 0.145098, 0, 1, 1,
0.5783954, 0.591724, -1.372994, 0.1529412, 0, 1, 1,
0.5814196, 0.6805481, -0.3704926, 0.1568628, 0, 1, 1,
0.5827342, 0.5886891, -0.01681596, 0.1647059, 0, 1, 1,
0.5840611, 1.101291, -0.02885179, 0.1686275, 0, 1, 1,
0.5889444, 0.3723477, 0.7628388, 0.1764706, 0, 1, 1,
0.5889702, 3.619786, 0.8392095, 0.1803922, 0, 1, 1,
0.5914977, 0.7857323, 0.2487686, 0.1882353, 0, 1, 1,
0.5932738, -0.2570144, 2.958494, 0.1921569, 0, 1, 1,
0.5939251, 1.423511, -0.6253628, 0.2, 0, 1, 1,
0.6007636, -0.7752095, 2.393064, 0.2078431, 0, 1, 1,
0.605263, 0.6955079, 1.942008, 0.2117647, 0, 1, 1,
0.6060445, 1.217776, 0.1724297, 0.2196078, 0, 1, 1,
0.6088193, -0.9016194, 2.532645, 0.2235294, 0, 1, 1,
0.6096676, 0.7519088, 1.576116, 0.2313726, 0, 1, 1,
0.6098345, -0.590451, 0.50016, 0.2352941, 0, 1, 1,
0.6121046, 0.3765648, 1.548955, 0.2431373, 0, 1, 1,
0.6123708, -0.1977988, 1.759109, 0.2470588, 0, 1, 1,
0.6174237, 0.7859674, 1.593574, 0.254902, 0, 1, 1,
0.6198171, -0.6570634, 1.495685, 0.2588235, 0, 1, 1,
0.6225728, 0.08494409, 0.6727825, 0.2666667, 0, 1, 1,
0.6252711, 0.959621, 0.1421415, 0.2705882, 0, 1, 1,
0.6274474, -0.4773481, 2.394297, 0.2784314, 0, 1, 1,
0.6299343, 0.2412565, 1.322819, 0.282353, 0, 1, 1,
0.6347793, 1.325756, 1.625839, 0.2901961, 0, 1, 1,
0.6401026, -0.5087681, 1.182266, 0.2941177, 0, 1, 1,
0.6408232, -1.000309, 0.9757429, 0.3019608, 0, 1, 1,
0.6460198, 1.070048, 0.7048244, 0.3098039, 0, 1, 1,
0.6470466, -0.2809592, 1.532428, 0.3137255, 0, 1, 1,
0.6481097, 0.002683575, 0.8003663, 0.3215686, 0, 1, 1,
0.6526012, 0.7563634, 1.261089, 0.3254902, 0, 1, 1,
0.6615458, 0.1084465, 2.28039, 0.3333333, 0, 1, 1,
0.6667582, 2.936285, 2.222154, 0.3372549, 0, 1, 1,
0.6698477, 1.184933, 3.142578, 0.345098, 0, 1, 1,
0.6705309, -1.187482, 3.05026, 0.3490196, 0, 1, 1,
0.67229, -0.01884953, 2.317553, 0.3568628, 0, 1, 1,
0.6725631, -0.06725474, 0.9694508, 0.3607843, 0, 1, 1,
0.6738726, -1.206096, 3.056748, 0.3686275, 0, 1, 1,
0.6741781, -0.7407146, 2.825378, 0.372549, 0, 1, 1,
0.6790067, 1.108286, -0.2383302, 0.3803922, 0, 1, 1,
0.6811017, -1.573042, 2.861058, 0.3843137, 0, 1, 1,
0.6830792, 0.9246188, 0.8280774, 0.3921569, 0, 1, 1,
0.6989698, 0.9032456, 1.067831, 0.3960784, 0, 1, 1,
0.7025969, -2.213546, 4.488209, 0.4039216, 0, 1, 1,
0.7048297, 0.160831, 0.3775788, 0.4117647, 0, 1, 1,
0.7094729, -0.539549, 4.32303, 0.4156863, 0, 1, 1,
0.714006, 0.7930941, -0.4857735, 0.4235294, 0, 1, 1,
0.7187723, -1.233304, 2.630323, 0.427451, 0, 1, 1,
0.721131, 1.497406, 0.6444966, 0.4352941, 0, 1, 1,
0.7215613, -0.08899284, 1.249864, 0.4392157, 0, 1, 1,
0.726007, 0.05983214, 1.308676, 0.4470588, 0, 1, 1,
0.7283098, 0.2427803, 0.4533377, 0.4509804, 0, 1, 1,
0.7337661, 0.7804695, 1.471935, 0.4588235, 0, 1, 1,
0.7365631, -0.7125756, 1.377777, 0.4627451, 0, 1, 1,
0.7372167, 1.615878, -0.1894369, 0.4705882, 0, 1, 1,
0.7444527, -0.6483122, 2.615733, 0.4745098, 0, 1, 1,
0.7462574, -1.83449, 2.933928, 0.4823529, 0, 1, 1,
0.7515041, 0.2696026, -0.5813407, 0.4862745, 0, 1, 1,
0.7571065, -0.6086, 1.273679, 0.4941176, 0, 1, 1,
0.7627268, -0.02646348, 0.7010605, 0.5019608, 0, 1, 1,
0.7633238, 1.001219, -1.036457, 0.5058824, 0, 1, 1,
0.7635695, 0.5426075, 0.2687078, 0.5137255, 0, 1, 1,
0.7736014, -0.1033605, 0.997992, 0.5176471, 0, 1, 1,
0.773656, -0.3063468, 0.8864119, 0.5254902, 0, 1, 1,
0.774582, 0.3658787, 0.8074019, 0.5294118, 0, 1, 1,
0.782686, -0.2912368, 1.019337, 0.5372549, 0, 1, 1,
0.7828559, -0.7442291, 2.807651, 0.5411765, 0, 1, 1,
0.7863789, -0.304031, 1.647027, 0.5490196, 0, 1, 1,
0.7958041, 0.589845, 0.6941265, 0.5529412, 0, 1, 1,
0.7980756, 0.6188945, 0.7109097, 0.5607843, 0, 1, 1,
0.7994257, -0.1524126, 1.723927, 0.5647059, 0, 1, 1,
0.7996611, 0.8303505, 1.367495, 0.572549, 0, 1, 1,
0.800059, -0.565558, 2.093403, 0.5764706, 0, 1, 1,
0.8038737, -0.1220891, 1.230197, 0.5843138, 0, 1, 1,
0.8055981, -0.3125808, 3.139462, 0.5882353, 0, 1, 1,
0.8067064, 0.5169936, 2.45811, 0.5960785, 0, 1, 1,
0.8091099, 0.749862, -0.4621108, 0.6039216, 0, 1, 1,
0.809175, 0.1588818, 3.080664, 0.6078432, 0, 1, 1,
0.8128982, -1.430064, 3.277064, 0.6156863, 0, 1, 1,
0.8177549, -0.8238069, 1.942872, 0.6196079, 0, 1, 1,
0.8182123, 0.5984327, 0.5790639, 0.627451, 0, 1, 1,
0.8190239, -0.6452295, 0.1348327, 0.6313726, 0, 1, 1,
0.8228025, -0.138588, 2.942283, 0.6392157, 0, 1, 1,
0.8244638, -0.03900201, 0.7266869, 0.6431373, 0, 1, 1,
0.8246531, 0.7632558, 1.762014, 0.6509804, 0, 1, 1,
0.824773, 0.5199824, -0.08348411, 0.654902, 0, 1, 1,
0.8269563, -0.3527722, 1.38463, 0.6627451, 0, 1, 1,
0.827466, -0.03839688, 0.6015407, 0.6666667, 0, 1, 1,
0.8323368, 0.5445581, 2.412855, 0.6745098, 0, 1, 1,
0.8381191, -0.6055116, 0.6347895, 0.6784314, 0, 1, 1,
0.8388811, 0.6619256, 0.1346236, 0.6862745, 0, 1, 1,
0.841328, -1.600839, 2.344951, 0.6901961, 0, 1, 1,
0.8473848, 0.4462299, 3.136093, 0.6980392, 0, 1, 1,
0.8497092, 0.1160456, 2.428808, 0.7058824, 0, 1, 1,
0.8551409, -1.027932, 2.310003, 0.7098039, 0, 1, 1,
0.8565026, -0.04216057, 1.913906, 0.7176471, 0, 1, 1,
0.8589748, 1.377553, 0.103211, 0.7215686, 0, 1, 1,
0.8620499, -1.989141, 2.566647, 0.7294118, 0, 1, 1,
0.871036, -0.6222608, 2.344125, 0.7333333, 0, 1, 1,
0.8797842, -0.5681481, 1.773304, 0.7411765, 0, 1, 1,
0.8864237, -2.373358, 3.444369, 0.7450981, 0, 1, 1,
0.8963628, 0.597407, 2.123317, 0.7529412, 0, 1, 1,
0.8979328, 0.5376632, 2.340818, 0.7568628, 0, 1, 1,
0.89996, 0.3070081, 0.5885602, 0.7647059, 0, 1, 1,
0.9030721, 0.9692701, 0.7545847, 0.7686275, 0, 1, 1,
0.9056315, 1.73883, 1.665247, 0.7764706, 0, 1, 1,
0.9098337, 0.08734116, 0.6909788, 0.7803922, 0, 1, 1,
0.9107822, -1.088803, 3.48443, 0.7882353, 0, 1, 1,
0.9120138, -0.09947147, 0.463026, 0.7921569, 0, 1, 1,
0.9135891, 0.6444808, -0.08401191, 0.8, 0, 1, 1,
0.9139802, 0.4688988, -0.03494182, 0.8078431, 0, 1, 1,
0.9158887, 0.7844325, 1.580716, 0.8117647, 0, 1, 1,
0.9191906, 0.9579555, 1.167332, 0.8196079, 0, 1, 1,
0.9214588, 0.2468013, -1.127389, 0.8235294, 0, 1, 1,
0.9286428, -2.208992, 1.26765, 0.8313726, 0, 1, 1,
0.9304234, -1.06643, 3.429208, 0.8352941, 0, 1, 1,
0.93221, 1.739451, 0.1649757, 0.8431373, 0, 1, 1,
0.9337164, -0.348687, 3.003748, 0.8470588, 0, 1, 1,
0.9389541, 0.6687216, 0.0246984, 0.854902, 0, 1, 1,
0.9411196, 0.08403649, -0.586141, 0.8588235, 0, 1, 1,
0.944199, 0.6437773, 0.5549347, 0.8666667, 0, 1, 1,
0.9450082, 1.673362, 1.128875, 0.8705882, 0, 1, 1,
0.9456114, 0.3723381, 1.013233, 0.8784314, 0, 1, 1,
0.9555804, -1.167901, 3.157072, 0.8823529, 0, 1, 1,
0.9570983, -1.148053, 1.052391, 0.8901961, 0, 1, 1,
0.9595591, -0.5681543, 3.696036, 0.8941177, 0, 1, 1,
0.9673107, 0.8149905, 1.158375, 0.9019608, 0, 1, 1,
0.9674534, 1.392455, -0.3495928, 0.9098039, 0, 1, 1,
0.9675388, -1.511271, 2.345232, 0.9137255, 0, 1, 1,
0.9735541, 1.596306, 1.079882, 0.9215686, 0, 1, 1,
0.9785261, -1.501524, 4.422406, 0.9254902, 0, 1, 1,
0.9838142, 0.9036906, 0.6174173, 0.9333333, 0, 1, 1,
0.985096, 0.9956875, 2.229, 0.9372549, 0, 1, 1,
0.9888333, -0.7239304, 1.387889, 0.945098, 0, 1, 1,
0.9898416, -0.4705102, 0.2031064, 0.9490196, 0, 1, 1,
0.9906751, 0.9940301, 0.454442, 0.9568627, 0, 1, 1,
0.9936217, 0.4339676, 0.563894, 0.9607843, 0, 1, 1,
0.9963905, 0.1889793, 0.6509303, 0.9686275, 0, 1, 1,
0.9985488, 0.5370423, 1.450893, 0.972549, 0, 1, 1,
1.000512, 0.9828857, 1.080634, 0.9803922, 0, 1, 1,
1.011463, -1.840683, 2.054122, 0.9843137, 0, 1, 1,
1.016789, 0.08298857, 0.9801983, 0.9921569, 0, 1, 1,
1.016798, -0.3783742, 1.522679, 0.9960784, 0, 1, 1,
1.02151, -0.8442692, 3.132039, 1, 0, 0.9960784, 1,
1.02785, -1.929648, 3.177662, 1, 0, 0.9882353, 1,
1.032283, 0.6447638, 2.839144, 1, 0, 0.9843137, 1,
1.038891, -1.169499, 2.575386, 1, 0, 0.9764706, 1,
1.043339, -0.3238487, 1.739457, 1, 0, 0.972549, 1,
1.049601, 1.285031, 3.803806, 1, 0, 0.9647059, 1,
1.050142, -0.1247484, 1.701113, 1, 0, 0.9607843, 1,
1.050357, 0.546534, 1.255084, 1, 0, 0.9529412, 1,
1.051068, 1.08532, 1.194609, 1, 0, 0.9490196, 1,
1.061162, 0.5166608, 1.364843, 1, 0, 0.9411765, 1,
1.065131, -1.786532, 1.894595, 1, 0, 0.9372549, 1,
1.067005, -0.05892808, 0.563745, 1, 0, 0.9294118, 1,
1.069088, 0.8174846, 0.5287006, 1, 0, 0.9254902, 1,
1.070489, -0.007544658, 1.210734, 1, 0, 0.9176471, 1,
1.079292, 0.366895, 1.417438, 1, 0, 0.9137255, 1,
1.081152, -0.178945, 2.439037, 1, 0, 0.9058824, 1,
1.085818, -0.1489628, 1.143866, 1, 0, 0.9019608, 1,
1.0878, 1.996226, 0.4419279, 1, 0, 0.8941177, 1,
1.094556, -2.055485, 0.2290939, 1, 0, 0.8862745, 1,
1.102278, 0.8805068, 0.2954645, 1, 0, 0.8823529, 1,
1.106718, -0.03071383, 3.190469, 1, 0, 0.8745098, 1,
1.111405, 0.9917072, -0.03575709, 1, 0, 0.8705882, 1,
1.129805, -1.813846, 2.716671, 1, 0, 0.8627451, 1,
1.134976, -0.5708366, 1.548411, 1, 0, 0.8588235, 1,
1.142462, 0.1324314, 3.751106, 1, 0, 0.8509804, 1,
1.146191, -0.2161923, 1.625157, 1, 0, 0.8470588, 1,
1.146888, 0.2776833, 2.73547, 1, 0, 0.8392157, 1,
1.153031, -1.13562, 3.424545, 1, 0, 0.8352941, 1,
1.155213, 0.7643238, 0.3979763, 1, 0, 0.827451, 1,
1.155299, -0.8319874, 2.508976, 1, 0, 0.8235294, 1,
1.159872, 1.338742, -0.5872089, 1, 0, 0.8156863, 1,
1.163595, 1.445595, -0.256015, 1, 0, 0.8117647, 1,
1.164551, -0.5801352, 1.18366, 1, 0, 0.8039216, 1,
1.17094, -2.365813, 1.173503, 1, 0, 0.7960784, 1,
1.174299, -0.9312962, 2.02883, 1, 0, 0.7921569, 1,
1.176363, -0.7081407, 1.866088, 1, 0, 0.7843137, 1,
1.178316, 0.4336015, 0.716253, 1, 0, 0.7803922, 1,
1.184991, -0.09225312, 1.689829, 1, 0, 0.772549, 1,
1.202993, 1.265729, 1.333083, 1, 0, 0.7686275, 1,
1.203631, 0.3293381, 2.212737, 1, 0, 0.7607843, 1,
1.203837, -0.2172729, 1.52237, 1, 0, 0.7568628, 1,
1.207144, 0.09046961, 0.9046384, 1, 0, 0.7490196, 1,
1.214757, 1.218299, 1.225973, 1, 0, 0.7450981, 1,
1.214971, 0.4330142, 1.512912, 1, 0, 0.7372549, 1,
1.21958, -0.8564193, 2.562055, 1, 0, 0.7333333, 1,
1.224172, -0.919163, 1.861883, 1, 0, 0.7254902, 1,
1.230486, -0.4599543, 2.671612, 1, 0, 0.7215686, 1,
1.23855, 0.2238821, 3.450279, 1, 0, 0.7137255, 1,
1.238791, 0.6600318, 2.077225, 1, 0, 0.7098039, 1,
1.240427, -0.4514802, 1.9693, 1, 0, 0.7019608, 1,
1.24196, 0.9755009, 2.595209, 1, 0, 0.6941177, 1,
1.252729, -1.438187, 2.748504, 1, 0, 0.6901961, 1,
1.253582, 0.8924776, 1.859613, 1, 0, 0.682353, 1,
1.260159, -1.503351, 3.152782, 1, 0, 0.6784314, 1,
1.263018, 1.008253, 2.411394, 1, 0, 0.6705883, 1,
1.263051, 0.7499775, 3.74668, 1, 0, 0.6666667, 1,
1.268033, -1.259144, 3.131343, 1, 0, 0.6588235, 1,
1.270419, 0.01907467, 1.261363, 1, 0, 0.654902, 1,
1.271024, 0.2817642, 1.368782, 1, 0, 0.6470588, 1,
1.276697, -0.434016, 1.532155, 1, 0, 0.6431373, 1,
1.284174, 0.122101, 2.042498, 1, 0, 0.6352941, 1,
1.291158, 0.2683551, 1.962585, 1, 0, 0.6313726, 1,
1.291334, -1.056129, -0.1139138, 1, 0, 0.6235294, 1,
1.295344, -2.267864, 2.833951, 1, 0, 0.6196079, 1,
1.303588, -2.011508, 1.575861, 1, 0, 0.6117647, 1,
1.305254, -1.063443, 2.290612, 1, 0, 0.6078432, 1,
1.305556, -0.803627, 1.866087, 1, 0, 0.6, 1,
1.309182, 2.000277, -0.6208036, 1, 0, 0.5921569, 1,
1.311052, -0.6230025, 0.4305583, 1, 0, 0.5882353, 1,
1.313934, -1.119671, 1.738799, 1, 0, 0.5803922, 1,
1.314606, -2.441962, 2.324885, 1, 0, 0.5764706, 1,
1.314919, 0.4426467, 2.923069, 1, 0, 0.5686275, 1,
1.325601, 0.7770361, 2.084134, 1, 0, 0.5647059, 1,
1.326292, 0.9917877, 0.6600863, 1, 0, 0.5568628, 1,
1.330594, 0.03414348, 0.3126878, 1, 0, 0.5529412, 1,
1.332384, -2.711235, 2.09041, 1, 0, 0.5450981, 1,
1.346285, 1.234429, 1.459209, 1, 0, 0.5411765, 1,
1.347135, -0.2472956, 2.66609, 1, 0, 0.5333334, 1,
1.355406, 0.09349092, 1.248474, 1, 0, 0.5294118, 1,
1.376415, -0.4029095, 3.458437, 1, 0, 0.5215687, 1,
1.385891, -1.115255, 1.475406, 1, 0, 0.5176471, 1,
1.389203, 1.665657, 1.160875, 1, 0, 0.509804, 1,
1.394767, -0.387936, 1.101708, 1, 0, 0.5058824, 1,
1.39629, -0.6325066, 3.086942, 1, 0, 0.4980392, 1,
1.411606, 0.2958253, 1.319938, 1, 0, 0.4901961, 1,
1.418773, -0.6982056, 2.456542, 1, 0, 0.4862745, 1,
1.429472, -2.914222, 3.314165, 1, 0, 0.4784314, 1,
1.429642, 0.6575608, 1.831618, 1, 0, 0.4745098, 1,
1.451763, 0.1248565, 0.01760989, 1, 0, 0.4666667, 1,
1.462867, 0.563992, 3.813182, 1, 0, 0.4627451, 1,
1.464653, -0.04909048, 0.9690632, 1, 0, 0.454902, 1,
1.481694, 0.9054093, 0.6727291, 1, 0, 0.4509804, 1,
1.483368, -1.166516, 1.105301, 1, 0, 0.4431373, 1,
1.488327, 0.7528082, 2.063002, 1, 0, 0.4392157, 1,
1.494722, 1.134422, -0.3475933, 1, 0, 0.4313726, 1,
1.500034, -0.6903276, 2.183003, 1, 0, 0.427451, 1,
1.512652, -1.332684, 0.7608414, 1, 0, 0.4196078, 1,
1.515051, -0.8897452, 1.424307, 1, 0, 0.4156863, 1,
1.529023, -0.04205081, 0.88757, 1, 0, 0.4078431, 1,
1.531171, 0.01792387, 1.517931, 1, 0, 0.4039216, 1,
1.540014, 0.08739593, 2.573883, 1, 0, 0.3960784, 1,
1.541958, -0.6877267, 2.732418, 1, 0, 0.3882353, 1,
1.550602, 0.5918912, 1.274096, 1, 0, 0.3843137, 1,
1.591048, 1.050637, 1.247705, 1, 0, 0.3764706, 1,
1.594324, 0.4904178, 3.023936, 1, 0, 0.372549, 1,
1.598631, 0.2965035, 2.677888, 1, 0, 0.3647059, 1,
1.605744, -0.5875371, 0.2565883, 1, 0, 0.3607843, 1,
1.60927, -0.2706961, 2.417756, 1, 0, 0.3529412, 1,
1.625594, -1.26003, 1.84697, 1, 0, 0.3490196, 1,
1.629747, -0.5760479, 3.68727, 1, 0, 0.3411765, 1,
1.63114, 0.7992489, -0.08156967, 1, 0, 0.3372549, 1,
1.639018, 1.161611, -0.9587356, 1, 0, 0.3294118, 1,
1.64742, -1.539207, 2.523217, 1, 0, 0.3254902, 1,
1.650349, 1.174096, 2.210197, 1, 0, 0.3176471, 1,
1.658181, -0.8574795, 1.689174, 1, 0, 0.3137255, 1,
1.664762, -2.421474, 2.694728, 1, 0, 0.3058824, 1,
1.668929, 0.7694694, 1.531356, 1, 0, 0.2980392, 1,
1.715764, 0.1183596, 0.5665479, 1, 0, 0.2941177, 1,
1.728245, -0.2580207, 3.171643, 1, 0, 0.2862745, 1,
1.734064, -0.4613935, 1.405683, 1, 0, 0.282353, 1,
1.745506, 0.5249486, 1.171878, 1, 0, 0.2745098, 1,
1.757777, 0.951111, 1.254975, 1, 0, 0.2705882, 1,
1.808299, -0.8858565, 3.042184, 1, 0, 0.2627451, 1,
1.812581, 1.040977, 2.97432, 1, 0, 0.2588235, 1,
1.817398, -0.1142733, 1.098119, 1, 0, 0.2509804, 1,
1.820978, -1.554436, 1.658859, 1, 0, 0.2470588, 1,
1.828145, -0.923532, -0.3661934, 1, 0, 0.2392157, 1,
1.833305, -0.8348947, 2.405103, 1, 0, 0.2352941, 1,
1.842657, 1.377407, 0.7413317, 1, 0, 0.227451, 1,
1.850802, -0.4142849, 1.975822, 1, 0, 0.2235294, 1,
1.851213, 0.8981897, 1.145501, 1, 0, 0.2156863, 1,
1.86542, 0.5420066, 0.8317789, 1, 0, 0.2117647, 1,
1.891836, -0.705673, 3.537154, 1, 0, 0.2039216, 1,
1.895362, 0.4887744, 0.7919763, 1, 0, 0.1960784, 1,
1.912464, 0.9059865, 0.7966818, 1, 0, 0.1921569, 1,
1.9194, 0.5172017, 2.052053, 1, 0, 0.1843137, 1,
1.924241, -0.6497124, 1.454469, 1, 0, 0.1803922, 1,
1.925169, -0.4694456, 1.598164, 1, 0, 0.172549, 1,
1.966416, -0.3751161, 1.84177, 1, 0, 0.1686275, 1,
2.002857, 0.6229496, 2.965497, 1, 0, 0.1607843, 1,
2.007522, 0.9367194, 0.824447, 1, 0, 0.1568628, 1,
2.033636, -0.3678581, 0.9024915, 1, 0, 0.1490196, 1,
2.043555, 0.1789782, 1.096283, 1, 0, 0.145098, 1,
2.152954, 0.02511906, 2.043267, 1, 0, 0.1372549, 1,
2.155579, 0.679547, 2.07041, 1, 0, 0.1333333, 1,
2.206199, -0.8557228, 1.691153, 1, 0, 0.1254902, 1,
2.20844, 0.173281, -0.78115, 1, 0, 0.1215686, 1,
2.232444, -0.1939041, 2.031832, 1, 0, 0.1137255, 1,
2.240554, 0.3861878, 0.3476868, 1, 0, 0.1098039, 1,
2.246941, 2.102666, 0.576662, 1, 0, 0.1019608, 1,
2.253372, -0.8368784, 2.810158, 1, 0, 0.09411765, 1,
2.262124, 0.7494599, 0.8469037, 1, 0, 0.09019608, 1,
2.289006, 0.5875809, 0.09761366, 1, 0, 0.08235294, 1,
2.343529, -1.098341, 2.021291, 1, 0, 0.07843138, 1,
2.365124, -1.439188, 2.058276, 1, 0, 0.07058824, 1,
2.369275, 0.1950423, 0.4649457, 1, 0, 0.06666667, 1,
2.419233, 0.6274527, 0.4399387, 1, 0, 0.05882353, 1,
2.458136, -0.31977, 1.361984, 1, 0, 0.05490196, 1,
2.580141, 1.099559, 2.465779, 1, 0, 0.04705882, 1,
2.626076, -0.3988582, -0.4685713, 1, 0, 0.04313726, 1,
2.669261, 0.279145, 1.597536, 1, 0, 0.03529412, 1,
2.6768, 1.219859, 2.019094, 1, 0, 0.03137255, 1,
2.803167, 0.01690903, 1.110785, 1, 0, 0.02352941, 1,
2.812937, 0.5628743, 1.333347, 1, 0, 0.01960784, 1,
3.041016, 1.314513, 0.6476948, 1, 0, 0.01176471, 1,
3.579194, 0.4640778, 2.149312, 1, 0, 0.007843138, 1
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
0.4003958, -4.021737, -6.720294, 0, -0.5, 0.5, 0.5,
0.4003958, -4.021737, -6.720294, 1, -0.5, 0.5, 0.5,
0.4003958, -4.021737, -6.720294, 1, 1.5, 0.5, 0.5,
0.4003958, -4.021737, -6.720294, 0, 1.5, 0.5, 0.5
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
-3.856015, 0.3527817, -6.720294, 0, -0.5, 0.5, 0.5,
-3.856015, 0.3527817, -6.720294, 1, -0.5, 0.5, 0.5,
-3.856015, 0.3527817, -6.720294, 1, 1.5, 0.5, 0.5,
-3.856015, 0.3527817, -6.720294, 0, 1.5, 0.5, 0.5
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
-3.856015, -4.021737, 0.05262542, 0, -0.5, 0.5, 0.5,
-3.856015, -4.021737, 0.05262542, 1, -0.5, 0.5, 0.5,
-3.856015, -4.021737, 0.05262542, 1, 1.5, 0.5, 0.5,
-3.856015, -4.021737, 0.05262542, 0, 1.5, 0.5, 0.5
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
-2, -3.012233, -5.157312,
3, -3.012233, -5.157312,
-2, -3.012233, -5.157312,
-2, -3.180483, -5.417809,
-1, -3.012233, -5.157312,
-1, -3.180483, -5.417809,
0, -3.012233, -5.157312,
0, -3.180483, -5.417809,
1, -3.012233, -5.157312,
1, -3.180483, -5.417809,
2, -3.012233, -5.157312,
2, -3.180483, -5.417809,
3, -3.012233, -5.157312,
3, -3.180483, -5.417809
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
-2, -3.516985, -5.938803, 0, -0.5, 0.5, 0.5,
-2, -3.516985, -5.938803, 1, -0.5, 0.5, 0.5,
-2, -3.516985, -5.938803, 1, 1.5, 0.5, 0.5,
-2, -3.516985, -5.938803, 0, 1.5, 0.5, 0.5,
-1, -3.516985, -5.938803, 0, -0.5, 0.5, 0.5,
-1, -3.516985, -5.938803, 1, -0.5, 0.5, 0.5,
-1, -3.516985, -5.938803, 1, 1.5, 0.5, 0.5,
-1, -3.516985, -5.938803, 0, 1.5, 0.5, 0.5,
0, -3.516985, -5.938803, 0, -0.5, 0.5, 0.5,
0, -3.516985, -5.938803, 1, -0.5, 0.5, 0.5,
0, -3.516985, -5.938803, 1, 1.5, 0.5, 0.5,
0, -3.516985, -5.938803, 0, 1.5, 0.5, 0.5,
1, -3.516985, -5.938803, 0, -0.5, 0.5, 0.5,
1, -3.516985, -5.938803, 1, -0.5, 0.5, 0.5,
1, -3.516985, -5.938803, 1, 1.5, 0.5, 0.5,
1, -3.516985, -5.938803, 0, 1.5, 0.5, 0.5,
2, -3.516985, -5.938803, 0, -0.5, 0.5, 0.5,
2, -3.516985, -5.938803, 1, -0.5, 0.5, 0.5,
2, -3.516985, -5.938803, 1, 1.5, 0.5, 0.5,
2, -3.516985, -5.938803, 0, 1.5, 0.5, 0.5,
3, -3.516985, -5.938803, 0, -0.5, 0.5, 0.5,
3, -3.516985, -5.938803, 1, -0.5, 0.5, 0.5,
3, -3.516985, -5.938803, 1, 1.5, 0.5, 0.5,
3, -3.516985, -5.938803, 0, 1.5, 0.5, 0.5
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
-2.873766, -2, -5.157312,
-2.873766, 3, -5.157312,
-2.873766, -2, -5.157312,
-3.037475, -2, -5.417809,
-2.873766, -1, -5.157312,
-3.037475, -1, -5.417809,
-2.873766, 0, -5.157312,
-3.037475, 0, -5.417809,
-2.873766, 1, -5.157312,
-3.037475, 1, -5.417809,
-2.873766, 2, -5.157312,
-3.037475, 2, -5.417809,
-2.873766, 3, -5.157312,
-3.037475, 3, -5.417809
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
-3.364891, -2, -5.938803, 0, -0.5, 0.5, 0.5,
-3.364891, -2, -5.938803, 1, -0.5, 0.5, 0.5,
-3.364891, -2, -5.938803, 1, 1.5, 0.5, 0.5,
-3.364891, -2, -5.938803, 0, 1.5, 0.5, 0.5,
-3.364891, -1, -5.938803, 0, -0.5, 0.5, 0.5,
-3.364891, -1, -5.938803, 1, -0.5, 0.5, 0.5,
-3.364891, -1, -5.938803, 1, 1.5, 0.5, 0.5,
-3.364891, -1, -5.938803, 0, 1.5, 0.5, 0.5,
-3.364891, 0, -5.938803, 0, -0.5, 0.5, 0.5,
-3.364891, 0, -5.938803, 1, -0.5, 0.5, 0.5,
-3.364891, 0, -5.938803, 1, 1.5, 0.5, 0.5,
-3.364891, 0, -5.938803, 0, 1.5, 0.5, 0.5,
-3.364891, 1, -5.938803, 0, -0.5, 0.5, 0.5,
-3.364891, 1, -5.938803, 1, -0.5, 0.5, 0.5,
-3.364891, 1, -5.938803, 1, 1.5, 0.5, 0.5,
-3.364891, 1, -5.938803, 0, 1.5, 0.5, 0.5,
-3.364891, 2, -5.938803, 0, -0.5, 0.5, 0.5,
-3.364891, 2, -5.938803, 1, -0.5, 0.5, 0.5,
-3.364891, 2, -5.938803, 1, 1.5, 0.5, 0.5,
-3.364891, 2, -5.938803, 0, 1.5, 0.5, 0.5,
-3.364891, 3, -5.938803, 0, -0.5, 0.5, 0.5,
-3.364891, 3, -5.938803, 1, -0.5, 0.5, 0.5,
-3.364891, 3, -5.938803, 1, 1.5, 0.5, 0.5,
-3.364891, 3, -5.938803, 0, 1.5, 0.5, 0.5
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
-2.873766, -3.012233, -4,
-2.873766, -3.012233, 4,
-2.873766, -3.012233, -4,
-3.037475, -3.180483, -4,
-2.873766, -3.012233, -2,
-3.037475, -3.180483, -2,
-2.873766, -3.012233, 0,
-3.037475, -3.180483, 0,
-2.873766, -3.012233, 2,
-3.037475, -3.180483, 2,
-2.873766, -3.012233, 4,
-3.037475, -3.180483, 4
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
-3.364891, -3.516985, -4, 0, -0.5, 0.5, 0.5,
-3.364891, -3.516985, -4, 1, -0.5, 0.5, 0.5,
-3.364891, -3.516985, -4, 1, 1.5, 0.5, 0.5,
-3.364891, -3.516985, -4, 0, 1.5, 0.5, 0.5,
-3.364891, -3.516985, -2, 0, -0.5, 0.5, 0.5,
-3.364891, -3.516985, -2, 1, -0.5, 0.5, 0.5,
-3.364891, -3.516985, -2, 1, 1.5, 0.5, 0.5,
-3.364891, -3.516985, -2, 0, 1.5, 0.5, 0.5,
-3.364891, -3.516985, 0, 0, -0.5, 0.5, 0.5,
-3.364891, -3.516985, 0, 1, -0.5, 0.5, 0.5,
-3.364891, -3.516985, 0, 1, 1.5, 0.5, 0.5,
-3.364891, -3.516985, 0, 0, 1.5, 0.5, 0.5,
-3.364891, -3.516985, 2, 0, -0.5, 0.5, 0.5,
-3.364891, -3.516985, 2, 1, -0.5, 0.5, 0.5,
-3.364891, -3.516985, 2, 1, 1.5, 0.5, 0.5,
-3.364891, -3.516985, 2, 0, 1.5, 0.5, 0.5,
-3.364891, -3.516985, 4, 0, -0.5, 0.5, 0.5,
-3.364891, -3.516985, 4, 1, -0.5, 0.5, 0.5,
-3.364891, -3.516985, 4, 1, 1.5, 0.5, 0.5,
-3.364891, -3.516985, 4, 0, 1.5, 0.5, 0.5
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
-2.873766, -3.012233, -5.157312,
-2.873766, 3.717796, -5.157312,
-2.873766, -3.012233, 5.262563,
-2.873766, 3.717796, 5.262563,
-2.873766, -3.012233, -5.157312,
-2.873766, -3.012233, 5.262563,
-2.873766, 3.717796, -5.157312,
-2.873766, 3.717796, 5.262563,
-2.873766, -3.012233, -5.157312,
3.674558, -3.012233, -5.157312,
-2.873766, -3.012233, 5.262563,
3.674558, -3.012233, 5.262563,
-2.873766, 3.717796, -5.157312,
3.674558, 3.717796, -5.157312,
-2.873766, 3.717796, 5.262563,
3.674558, 3.717796, 5.262563,
3.674558, -3.012233, -5.157312,
3.674558, 3.717796, -5.157312,
3.674558, -3.012233, 5.262563,
3.674558, 3.717796, 5.262563,
3.674558, -3.012233, -5.157312,
3.674558, -3.012233, 5.262563,
3.674558, 3.717796, -5.157312,
3.674558, 3.717796, 5.262563
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
var radius = 7.489973;
var distance = 33.32373;
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
mvMatrix.translate( -0.4003958, -0.3527817, -0.05262542 );
mvMatrix.scale( 1.236699, 1.203309, 0.7771979 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.32373);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Pyrazophos<-read.table("Pyrazophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyrazophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
```

```r
y<-Pyrazophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
```

```r
z<-Pyrazophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyrazophos' not found
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
-2.778403, 0.4333403, -0.9402228, 0, 0, 1, 1, 1,
-2.559655, 0.1518216, -2.660194, 1, 0, 0, 1, 1,
-2.472407, -1.560142, -0.9212887, 1, 0, 0, 1, 1,
-2.468811, 0.3849598, -1.257356, 1, 0, 0, 1, 1,
-2.326629, -0.5232124, -3.322492, 1, 0, 0, 1, 1,
-2.300728, -2.258438, -1.293261, 1, 0, 0, 1, 1,
-2.300137, 1.219614, -0.8889908, 0, 0, 0, 1, 1,
-2.253765, -0.4413815, -0.5536707, 0, 0, 0, 1, 1,
-2.245114, -1.399043, -0.6329682, 0, 0, 0, 1, 1,
-2.244549, 0.8042682, -0.4748981, 0, 0, 0, 1, 1,
-2.206426, 1.036736, -2.794238, 0, 0, 0, 1, 1,
-2.118558, 0.4894778, -0.8401769, 0, 0, 0, 1, 1,
-2.114357, 0.4268022, -0.08158994, 0, 0, 0, 1, 1,
-2.100811, 0.841349, -1.810081, 1, 1, 1, 1, 1,
-2.097074, -0.2051418, -2.052336, 1, 1, 1, 1, 1,
-2.04781, 1.844119, -0.05669668, 1, 1, 1, 1, 1,
-2.00282, -0.6237547, -1.488289, 1, 1, 1, 1, 1,
-1.977584, -1.000045, -2.785231, 1, 1, 1, 1, 1,
-1.977097, -0.8435766, -1.327009, 1, 1, 1, 1, 1,
-1.940464, 0.3169287, -2.891177, 1, 1, 1, 1, 1,
-1.9331, -0.7630509, -1.82818, 1, 1, 1, 1, 1,
-1.907208, -0.7226315, -2.924373, 1, 1, 1, 1, 1,
-1.885415, 1.410595, -0.2419479, 1, 1, 1, 1, 1,
-1.8737, -1.46159, -2.077208, 1, 1, 1, 1, 1,
-1.873539, -0.6875102, -2.445798, 1, 1, 1, 1, 1,
-1.871439, 0.4554723, -1.086766, 1, 1, 1, 1, 1,
-1.818907, 1.543905, -0.1171383, 1, 1, 1, 1, 1,
-1.810812, 0.5223077, -2.964905, 1, 1, 1, 1, 1,
-1.804872, -0.7601842, -2.476671, 0, 0, 1, 1, 1,
-1.793718, 0.3212189, -2.256549, 1, 0, 0, 1, 1,
-1.788789, 0.003281298, -2.129734, 1, 0, 0, 1, 1,
-1.755566, -0.02485043, -2.599391, 1, 0, 0, 1, 1,
-1.745586, -0.843799, -1.993468, 1, 0, 0, 1, 1,
-1.739073, 0.9153419, -2.630192, 1, 0, 0, 1, 1,
-1.735864, -0.131922, -2.27892, 0, 0, 0, 1, 1,
-1.72918, 1.193891, -0.09460393, 0, 0, 0, 1, 1,
-1.693854, 0.9942337, -3.034172, 0, 0, 0, 1, 1,
-1.692443, 0.06223463, -3.72169, 0, 0, 0, 1, 1,
-1.681744, 0.5451044, -3.033454, 0, 0, 0, 1, 1,
-1.648655, -1.08176, -1.473898, 0, 0, 0, 1, 1,
-1.643009, 0.4688159, -2.097661, 0, 0, 0, 1, 1,
-1.637612, -1.64874, -0.8964662, 1, 1, 1, 1, 1,
-1.634921, -1.153197, -3.192127, 1, 1, 1, 1, 1,
-1.633884, -0.5216645, -2.673167, 1, 1, 1, 1, 1,
-1.633398, 2.028649, -0.9988869, 1, 1, 1, 1, 1,
-1.631757, 0.2912677, -2.165348, 1, 1, 1, 1, 1,
-1.628674, -1.426473, -1.527086, 1, 1, 1, 1, 1,
-1.625997, -0.5318576, -1.312968, 1, 1, 1, 1, 1,
-1.622883, -0.1090307, -1.273908, 1, 1, 1, 1, 1,
-1.59833, 0.6042908, -0.6470475, 1, 1, 1, 1, 1,
-1.597282, -1.662786, -2.79678, 1, 1, 1, 1, 1,
-1.522395, 0.1222008, -1.452674, 1, 1, 1, 1, 1,
-1.521536, 0.6403388, -0.3967561, 1, 1, 1, 1, 1,
-1.521253, 0.5688564, -0.2776485, 1, 1, 1, 1, 1,
-1.519935, -1.523251, -2.243325, 1, 1, 1, 1, 1,
-1.51761, 0.6087342, -1.053085, 1, 1, 1, 1, 1,
-1.509972, -0.2705396, -1.920377, 0, 0, 1, 1, 1,
-1.504253, -1.351533, -1.742365, 1, 0, 0, 1, 1,
-1.492148, -0.2157371, -2.195899, 1, 0, 0, 1, 1,
-1.475543, -0.1715263, 0.5251264, 1, 0, 0, 1, 1,
-1.471352, -0.4626647, -1.859607, 1, 0, 0, 1, 1,
-1.436354, -0.8975109, -4.109561, 1, 0, 0, 1, 1,
-1.430753, 0.05888519, -0.6016423, 0, 0, 0, 1, 1,
-1.427739, 0.8063074, -1.521396, 0, 0, 0, 1, 1,
-1.427264, -1.82612, -3.461073, 0, 0, 0, 1, 1,
-1.416549, -1.507046, -2.352875, 0, 0, 0, 1, 1,
-1.414563, 0.01788868, -0.6993378, 0, 0, 0, 1, 1,
-1.413207, 0.09084764, -1.847535, 0, 0, 0, 1, 1,
-1.410849, 0.3281232, 0.5008196, 0, 0, 0, 1, 1,
-1.393262, 0.6622816, -0.3305442, 1, 1, 1, 1, 1,
-1.388906, 0.3101362, -0.6213117, 1, 1, 1, 1, 1,
-1.372409, 0.131087, -2.273066, 1, 1, 1, 1, 1,
-1.372194, 0.5481375, -0.06217979, 1, 1, 1, 1, 1,
-1.367664, -1.204893, -2.036631, 1, 1, 1, 1, 1,
-1.359655, -0.3263818, -1.770925, 1, 1, 1, 1, 1,
-1.35411, 0.8263913, -1.287732, 1, 1, 1, 1, 1,
-1.352972, 1.162035, -2.554816, 1, 1, 1, 1, 1,
-1.350225, -1.21806, -1.883225, 1, 1, 1, 1, 1,
-1.341302, 1.020793, -0.4062919, 1, 1, 1, 1, 1,
-1.338247, -1.492414, -3.524403, 1, 1, 1, 1, 1,
-1.33713, -0.3575704, -2.236748, 1, 1, 1, 1, 1,
-1.334647, -0.1554891, -3.986319, 1, 1, 1, 1, 1,
-1.328239, -0.1088988, -2.299129, 1, 1, 1, 1, 1,
-1.291349, 0.4985493, -1.749432, 1, 1, 1, 1, 1,
-1.281139, -0.9750326, -1.243941, 0, 0, 1, 1, 1,
-1.272006, 1.754679, -0.1816607, 1, 0, 0, 1, 1,
-1.262244, -1.052183, -3.159228, 1, 0, 0, 1, 1,
-1.256551, -0.2232355, -2.17599, 1, 0, 0, 1, 1,
-1.251657, 1.360255, -1.380745, 1, 0, 0, 1, 1,
-1.247727, 1.112216, 0.04974432, 1, 0, 0, 1, 1,
-1.246577, 0.9001752, -0.7578982, 0, 0, 0, 1, 1,
-1.237587, -0.8140441, -1.391309, 0, 0, 0, 1, 1,
-1.235458, 1.2861, -1.560824, 0, 0, 0, 1, 1,
-1.233216, -1.229702, -2.147208, 0, 0, 0, 1, 1,
-1.230775, 0.6212009, -1.74481, 0, 0, 0, 1, 1,
-1.227132, 1.138275, -0.1787586, 0, 0, 0, 1, 1,
-1.2233, -0.7494844, -2.416072, 0, 0, 0, 1, 1,
-1.222606, 0.8928818, -1.763538, 1, 1, 1, 1, 1,
-1.221093, -0.8018336, -2.906081, 1, 1, 1, 1, 1,
-1.217407, -0.2487324, -0.1727144, 1, 1, 1, 1, 1,
-1.213052, 0.695566, -2.021468, 1, 1, 1, 1, 1,
-1.207259, 0.7716462, -1.370731, 1, 1, 1, 1, 1,
-1.194487, -0.8783559, -3.781627, 1, 1, 1, 1, 1,
-1.193313, -0.4358139, -1.63, 1, 1, 1, 1, 1,
-1.187525, -0.1430417, -1.204378, 1, 1, 1, 1, 1,
-1.183994, -1.114506, -0.0416153, 1, 1, 1, 1, 1,
-1.18042, 1.491498, 1.309115, 1, 1, 1, 1, 1,
-1.178771, -0.03370536, -1.565185, 1, 1, 1, 1, 1,
-1.176409, 0.3282745, -2.930055, 1, 1, 1, 1, 1,
-1.173566, 1.858936, 0.7022442, 1, 1, 1, 1, 1,
-1.171218, -0.3767644, -1.911816, 1, 1, 1, 1, 1,
-1.169317, -0.5884913, -1.358099, 1, 1, 1, 1, 1,
-1.163123, -0.001877147, -1.777381, 0, 0, 1, 1, 1,
-1.156107, 0.5915184, -1.464078, 1, 0, 0, 1, 1,
-1.152558, -1.045596, -1.227885, 1, 0, 0, 1, 1,
-1.150509, 1.784365, -0.01666942, 1, 0, 0, 1, 1,
-1.145596, -1.721442, -1.986919, 1, 0, 0, 1, 1,
-1.131268, -0.5498728, -2.788586, 1, 0, 0, 1, 1,
-1.130239, -2.896024, -0.721432, 0, 0, 0, 1, 1,
-1.127009, -1.603389, -3.151665, 0, 0, 0, 1, 1,
-1.125579, -1.312033, -3.099456, 0, 0, 0, 1, 1,
-1.118694, -0.5000604, -1.209111, 0, 0, 0, 1, 1,
-1.108656, -0.6993297, -2.512215, 0, 0, 0, 1, 1,
-1.099048, -0.8031725, -1.614404, 0, 0, 0, 1, 1,
-1.088363, -0.4897585, -2.449385, 0, 0, 0, 1, 1,
-1.087566, -1.768679, -2.174724, 1, 1, 1, 1, 1,
-1.085837, 1.007424, -0.9704687, 1, 1, 1, 1, 1,
-1.077225, 0.2637677, -1.580051, 1, 1, 1, 1, 1,
-1.06873, -0.5675671, -1.655933, 1, 1, 1, 1, 1,
-1.067726, 0.01979585, -1.442518, 1, 1, 1, 1, 1,
-1.058041, 1.406982, 0.4652714, 1, 1, 1, 1, 1,
-1.056619, 1.550036, -0.08855166, 1, 1, 1, 1, 1,
-1.055553, -0.4727189, -2.920275, 1, 1, 1, 1, 1,
-1.055511, -1.018079, 1.098778, 1, 1, 1, 1, 1,
-1.051004, 1.319071, -0.8970922, 1, 1, 1, 1, 1,
-1.048834, -1.026062, -1.979381, 1, 1, 1, 1, 1,
-1.037029, -1.315632, -3.856933, 1, 1, 1, 1, 1,
-1.035176, -0.9050269, -1.331258, 1, 1, 1, 1, 1,
-1.034312, 1.839364, -1.120402, 1, 1, 1, 1, 1,
-1.022002, 0.4728578, -1.349086, 1, 1, 1, 1, 1,
-1.018582, 0.2357943, -2.458769, 0, 0, 1, 1, 1,
-1.017246, -0.8123432, -3.078313, 1, 0, 0, 1, 1,
-1.014236, -0.7362152, -2.821381, 1, 0, 0, 1, 1,
-1.011864, 0.5910226, -1.993579, 1, 0, 0, 1, 1,
-1.008512, -0.6940539, -1.788157, 1, 0, 0, 1, 1,
-1.002633, 0.1480458, -0.8872527, 1, 0, 0, 1, 1,
-0.9966298, 0.9456231, -2.075812, 0, 0, 0, 1, 1,
-0.9930354, -0.240483, -1.59098, 0, 0, 0, 1, 1,
-0.9899214, 1.004415, -0.646039, 0, 0, 0, 1, 1,
-0.9868316, 0.4188119, -2.22938, 0, 0, 0, 1, 1,
-0.9864147, 0.2234964, -0.777013, 0, 0, 0, 1, 1,
-0.9837027, 1.215891, -1.270253, 0, 0, 0, 1, 1,
-0.9795527, -0.3296671, -0.07040582, 0, 0, 0, 1, 1,
-0.9701064, 0.2263236, -1.552881, 1, 1, 1, 1, 1,
-0.9600502, 0.4052855, 0.7750452, 1, 1, 1, 1, 1,
-0.9590497, 0.2086828, -0.9475909, 1, 1, 1, 1, 1,
-0.9548687, 1.521465, -0.374212, 1, 1, 1, 1, 1,
-0.9536589, 1.265321, -0.8332896, 1, 1, 1, 1, 1,
-0.9515424, 0.8875735, 0.09710919, 1, 1, 1, 1, 1,
-0.9455625, 0.1634793, -1.483509, 1, 1, 1, 1, 1,
-0.9407509, 1.561662, -1.968194, 1, 1, 1, 1, 1,
-0.9384872, -1.20959, -0.9555915, 1, 1, 1, 1, 1,
-0.9383524, -0.2575951, -2.185242, 1, 1, 1, 1, 1,
-0.9358399, 2.33127, -1.849963, 1, 1, 1, 1, 1,
-0.9237279, -0.7884859, -4.245459, 1, 1, 1, 1, 1,
-0.9212661, 0.9217315, 0.0653168, 1, 1, 1, 1, 1,
-0.9124316, -0.4361629, -2.264342, 1, 1, 1, 1, 1,
-0.9102316, 1.114359, -0.5432923, 1, 1, 1, 1, 1,
-0.8979198, 0.2837727, -1.987618, 0, 0, 1, 1, 1,
-0.8973945, -0.171139, -1.512353, 1, 0, 0, 1, 1,
-0.8934531, 2.051864, -1.619172, 1, 0, 0, 1, 1,
-0.8933402, 1.558342, -0.5760852, 1, 0, 0, 1, 1,
-0.8837526, 1.096912, 0.1383059, 1, 0, 0, 1, 1,
-0.8753594, 0.9023986, -0.6553888, 1, 0, 0, 1, 1,
-0.8721228, -0.5508777, -2.456289, 0, 0, 0, 1, 1,
-0.8691072, 0.09963343, -3.65485, 0, 0, 0, 1, 1,
-0.8681743, 1.430848, 0.2439703, 0, 0, 0, 1, 1,
-0.8607169, 0.9865246, -1.561569, 0, 0, 0, 1, 1,
-0.8590515, -0.3045202, -0.5581574, 0, 0, 0, 1, 1,
-0.8548218, 0.04959312, -1.153438, 0, 0, 0, 1, 1,
-0.8491675, -0.5782696, -3.478273, 0, 0, 0, 1, 1,
-0.8489848, 0.9431621, -1.403906, 1, 1, 1, 1, 1,
-0.8470061, 0.5755832, -0.06480053, 1, 1, 1, 1, 1,
-0.8432323, -1.340526, -4.124803, 1, 1, 1, 1, 1,
-0.8419308, 1.861232, -0.5155246, 1, 1, 1, 1, 1,
-0.838306, -1.181089, -3.068099, 1, 1, 1, 1, 1,
-0.8361729, 0.6331123, -0.3947734, 1, 1, 1, 1, 1,
-0.8358079, 0.03755789, -1.707283, 1, 1, 1, 1, 1,
-0.8310583, 0.2415225, -1.223429, 1, 1, 1, 1, 1,
-0.8273603, 0.3734614, -0.2777017, 1, 1, 1, 1, 1,
-0.8108547, -2.18648, -5.005567, 1, 1, 1, 1, 1,
-0.8007992, -0.3722596, -0.6902426, 1, 1, 1, 1, 1,
-0.7984419, 1.871544, -0.3738984, 1, 1, 1, 1, 1,
-0.7932183, 0.5436513, -0.5966128, 1, 1, 1, 1, 1,
-0.7902576, -1.017539, -2.716738, 1, 1, 1, 1, 1,
-0.7826114, -0.1278287, -2.531448, 1, 1, 1, 1, 1,
-0.7743276, 0.9826874, -1.069742, 0, 0, 1, 1, 1,
-0.7722613, 0.209866, -2.317193, 1, 0, 0, 1, 1,
-0.7708715, -0.6036676, -0.6734059, 1, 0, 0, 1, 1,
-0.7702748, 1.218614, -1.781171, 1, 0, 0, 1, 1,
-0.7685961, -0.8781915, -2.870423, 1, 0, 0, 1, 1,
-0.7676217, 0.6683601, -0.7772658, 1, 0, 0, 1, 1,
-0.7661838, -0.008232313, -2.232007, 0, 0, 0, 1, 1,
-0.7588685, 0.9239752, 0.9507289, 0, 0, 0, 1, 1,
-0.7576668, -0.0967098, -4.061628, 0, 0, 0, 1, 1,
-0.755823, -0.108852, -1.75077, 0, 0, 0, 1, 1,
-0.7511603, 0.3608392, -1.031039, 0, 0, 0, 1, 1,
-0.7467892, 1.262019, -0.5546864, 0, 0, 0, 1, 1,
-0.7451848, 0.7131103, 0.8216115, 0, 0, 0, 1, 1,
-0.7386834, -1.335598, -2.743239, 1, 1, 1, 1, 1,
-0.7335159, -0.4115279, -2.471853, 1, 1, 1, 1, 1,
-0.7327046, -0.08274709, -2.211888, 1, 1, 1, 1, 1,
-0.731652, 0.7495881, -1.24148, 1, 1, 1, 1, 1,
-0.7294784, 0.3440364, -1.03119, 1, 1, 1, 1, 1,
-0.723646, 1.044119, 0.4086943, 1, 1, 1, 1, 1,
-0.7193425, 1.616467, 0.1705329, 1, 1, 1, 1, 1,
-0.7177482, -0.8205677, -2.065903, 1, 1, 1, 1, 1,
-0.7157266, 0.3309233, 0.08566155, 1, 1, 1, 1, 1,
-0.7152057, 0.481145, -0.8050407, 1, 1, 1, 1, 1,
-0.713811, -1.020015, -3.806523, 1, 1, 1, 1, 1,
-0.71297, -0.4852788, -2.550436, 1, 1, 1, 1, 1,
-0.7125694, -0.4606338, -2.679252, 1, 1, 1, 1, 1,
-0.7106538, -0.8243037, -0.7545611, 1, 1, 1, 1, 1,
-0.7094877, -1.40357, -2.85754, 1, 1, 1, 1, 1,
-0.7040978, 0.4503297, -0.3856217, 0, 0, 1, 1, 1,
-0.6948742, 0.7436758, -1.197654, 1, 0, 0, 1, 1,
-0.6944937, 0.2421978, -1.90938, 1, 0, 0, 1, 1,
-0.6852154, 0.3353456, -2.121836, 1, 0, 0, 1, 1,
-0.6785717, -0.8230077, -2.998776, 1, 0, 0, 1, 1,
-0.6767877, -1.562318, -3.133064, 1, 0, 0, 1, 1,
-0.6743804, -0.8979542, -1.802402, 0, 0, 0, 1, 1,
-0.6695912, -0.5229493, -2.337011, 0, 0, 0, 1, 1,
-0.6677895, 0.1927171, -1.69247, 0, 0, 0, 1, 1,
-0.664645, 1.602247, -0.2056606, 0, 0, 0, 1, 1,
-0.6625409, -0.08657739, 0.1889084, 0, 0, 0, 1, 1,
-0.6619469, -0.9711133, -2.996214, 0, 0, 0, 1, 1,
-0.6618384, -1.038731, -2.450612, 0, 0, 0, 1, 1,
-0.6602409, -0.1763525, -3.198646, 1, 1, 1, 1, 1,
-0.6582823, 2.04991, -0.8533725, 1, 1, 1, 1, 1,
-0.6563873, -1.513468, -0.8903458, 1, 1, 1, 1, 1,
-0.6502485, -1.17572, -2.198337, 1, 1, 1, 1, 1,
-0.6395791, 0.09765533, -0.5020825, 1, 1, 1, 1, 1,
-0.6368925, 1.451119, 0.0016683, 1, 1, 1, 1, 1,
-0.6343166, 0.8872744, -1.538288, 1, 1, 1, 1, 1,
-0.6326588, 0.5021002, -0.7893795, 1, 1, 1, 1, 1,
-0.6319934, -1.730067, -3.025128, 1, 1, 1, 1, 1,
-0.6316734, 0.4183798, 0.7507458, 1, 1, 1, 1, 1,
-0.6313935, 0.1860217, -0.5092635, 1, 1, 1, 1, 1,
-0.622787, -1.27029, -2.617342, 1, 1, 1, 1, 1,
-0.6191678, 0.3814947, 0.2869377, 1, 1, 1, 1, 1,
-0.6167622, 0.5798916, -1.521329, 1, 1, 1, 1, 1,
-0.61272, 0.3506191, -0.6277367, 1, 1, 1, 1, 1,
-0.6105512, -1.488717, -3.025136, 0, 0, 1, 1, 1,
-0.608999, -0.6985717, -1.557944, 1, 0, 0, 1, 1,
-0.6079424, -1.023258, -2.731448, 1, 0, 0, 1, 1,
-0.5941543, -0.3324864, -0.819614, 1, 0, 0, 1, 1,
-0.5936273, 0.3897011, -2.473274, 1, 0, 0, 1, 1,
-0.5934255, -0.007605431, -0.07143111, 1, 0, 0, 1, 1,
-0.5833583, 0.1037297, -2.989043, 0, 0, 0, 1, 1,
-0.5800892, -0.8736829, -3.630428, 0, 0, 0, 1, 1,
-0.5780174, 0.9050274, -0.9324262, 0, 0, 0, 1, 1,
-0.5777137, 1.297109, -0.1589275, 0, 0, 0, 1, 1,
-0.5604853, 0.6959952, 0.3004684, 0, 0, 0, 1, 1,
-0.5444097, -0.203391, -0.6345003, 0, 0, 0, 1, 1,
-0.5431411, -0.4381304, -0.7232448, 0, 0, 0, 1, 1,
-0.5420793, -0.6357312, -1.425068, 1, 1, 1, 1, 1,
-0.5398792, 1.315018, 0.4364378, 1, 1, 1, 1, 1,
-0.5398607, -1.110019, -4.009393, 1, 1, 1, 1, 1,
-0.5371753, -0.7451784, -1.845894, 1, 1, 1, 1, 1,
-0.5357167, 0.4058558, -1.9038, 1, 1, 1, 1, 1,
-0.5338899, 2.424001, -2.042652, 1, 1, 1, 1, 1,
-0.52926, -0.8977768, -3.194416, 1, 1, 1, 1, 1,
-0.5231346, 0.03881091, -0.8068142, 1, 1, 1, 1, 1,
-0.5165837, 0.378374, -1.277062, 1, 1, 1, 1, 1,
-0.5149559, 1.502319, 0.08118217, 1, 1, 1, 1, 1,
-0.5107445, -1.650465, -3.240254, 1, 1, 1, 1, 1,
-0.510619, 0.6616377, -1.313186, 1, 1, 1, 1, 1,
-0.5104985, 0.4818558, -1.058198, 1, 1, 1, 1, 1,
-0.5103403, 0.0895475, -3.087176, 1, 1, 1, 1, 1,
-0.505922, 0.06833857, 0.01777728, 1, 1, 1, 1, 1,
-0.4917263, -0.7053425, -3.228606, 0, 0, 1, 1, 1,
-0.4852172, 1.323714, -1.129862, 1, 0, 0, 1, 1,
-0.4842686, 0.09777931, -1.478143, 1, 0, 0, 1, 1,
-0.473031, 0.3092248, -0.6530269, 1, 0, 0, 1, 1,
-0.4698149, 1.032912, -1.403983, 1, 0, 0, 1, 1,
-0.4694107, 0.2165581, 0.8127086, 1, 0, 0, 1, 1,
-0.467834, -0.215638, -1.568226, 0, 0, 0, 1, 1,
-0.4678249, 0.5696062, -0.8214825, 0, 0, 0, 1, 1,
-0.4674193, 0.4580627, -0.3765658, 0, 0, 0, 1, 1,
-0.4653456, -0.004294502, -1.180101, 0, 0, 0, 1, 1,
-0.4653161, 1.596119, -0.7090812, 0, 0, 0, 1, 1,
-0.4608999, -1.024936, -3.107955, 0, 0, 0, 1, 1,
-0.4529288, -0.1393029, -2.186918, 0, 0, 0, 1, 1,
-0.4503578, 0.5733851, -1.141594, 1, 1, 1, 1, 1,
-0.446553, -0.1711244, -4.905126, 1, 1, 1, 1, 1,
-0.4462669, 1.79075, 1.076106, 1, 1, 1, 1, 1,
-0.4417504, 0.1253835, -0.9260089, 1, 1, 1, 1, 1,
-0.4371346, 0.1260186, -0.3452465, 1, 1, 1, 1, 1,
-0.435871, 0.8775008, 0.1305704, 1, 1, 1, 1, 1,
-0.4344846, 0.07451198, -4.52423, 1, 1, 1, 1, 1,
-0.4337791, -0.4880456, -1.445916, 1, 1, 1, 1, 1,
-0.4316375, -1.274708, -1.59673, 1, 1, 1, 1, 1,
-0.4290355, -0.2598076, -1.190093, 1, 1, 1, 1, 1,
-0.4265627, 0.5394924, -1.050732, 1, 1, 1, 1, 1,
-0.42388, 0.6455276, -1.25979, 1, 1, 1, 1, 1,
-0.4205199, -0.9033281, -3.61097, 1, 1, 1, 1, 1,
-0.4202087, 1.855877, 0.218027, 1, 1, 1, 1, 1,
-0.4150018, -0.3934783, -3.011888, 1, 1, 1, 1, 1,
-0.4077075, 1.373812, 0.9361005, 0, 0, 1, 1, 1,
-0.403093, -0.5421263, -2.392577, 1, 0, 0, 1, 1,
-0.4027674, -0.2479277, -2.641696, 1, 0, 0, 1, 1,
-0.3953317, -0.4203785, -1.551584, 1, 0, 0, 1, 1,
-0.394518, -1.63337, -2.208328, 1, 0, 0, 1, 1,
-0.3915293, 0.1867716, -0.5738127, 1, 0, 0, 1, 1,
-0.3888454, 0.9454048, -0.402268, 0, 0, 0, 1, 1,
-0.3854141, 0.5124753, -1.071791, 0, 0, 0, 1, 1,
-0.3841183, 2.220056, -0.01597583, 0, 0, 0, 1, 1,
-0.3788104, 0.1965215, -0.172755, 0, 0, 0, 1, 1,
-0.3712646, -1.279092, -3.178888, 0, 0, 0, 1, 1,
-0.3676859, 0.1813192, -1.535761, 0, 0, 0, 1, 1,
-0.367469, -0.03353367, -1.669952, 0, 0, 0, 1, 1,
-0.3616931, -1.871473, -1.508943, 1, 1, 1, 1, 1,
-0.3601825, 1.673755, -0.8957459, 1, 1, 1, 1, 1,
-0.3572873, -1.26759, -1.277675, 1, 1, 1, 1, 1,
-0.3545486, 0.6106843, -2.181795, 1, 1, 1, 1, 1,
-0.3485394, -0.331168, -2.851892, 1, 1, 1, 1, 1,
-0.3434279, -1.458399, -3.139266, 1, 1, 1, 1, 1,
-0.3382741, -0.7222611, -1.749039, 1, 1, 1, 1, 1,
-0.3376929, 0.5239215, -1.306599, 1, 1, 1, 1, 1,
-0.3368053, 0.6695137, 0.4550203, 1, 1, 1, 1, 1,
-0.3311441, -0.1568493, -0.3150199, 1, 1, 1, 1, 1,
-0.3286236, 0.8133809, -1.275505, 1, 1, 1, 1, 1,
-0.3275116, 1.600174, -0.8134037, 1, 1, 1, 1, 1,
-0.3215971, -0.149581, -2.465515, 1, 1, 1, 1, 1,
-0.3210689, -0.5406382, -2.689428, 1, 1, 1, 1, 1,
-0.3188735, -1.852533, -3.73532, 1, 1, 1, 1, 1,
-0.3182087, -0.4184212, -2.132228, 0, 0, 1, 1, 1,
-0.3138171, -2.584845, -1.990484, 1, 0, 0, 1, 1,
-0.3092313, 0.5591735, -0.5165982, 1, 0, 0, 1, 1,
-0.3074124, -1.018764, -1.95529, 1, 0, 0, 1, 1,
-0.3061822, -0.01696975, -2.097836, 1, 0, 0, 1, 1,
-0.3041148, -0.727783, -4.236927, 1, 0, 0, 1, 1,
-0.3039075, 0.2274389, -0.4348944, 0, 0, 0, 1, 1,
-0.3035235, -0.2334299, -1.935949, 0, 0, 0, 1, 1,
-0.3034641, 0.8211762, -0.8793367, 0, 0, 0, 1, 1,
-0.3014903, 1.512869, -1.728426, 0, 0, 0, 1, 1,
-0.3004297, 1.220503, 0.6858469, 0, 0, 0, 1, 1,
-0.2997071, 0.6037084, -0.8608167, 0, 0, 0, 1, 1,
-0.2976417, -0.4145061, -1.619162, 0, 0, 0, 1, 1,
-0.2975548, -2.134374, -3.516381, 1, 1, 1, 1, 1,
-0.2967563, 0.7752847, -0.465333, 1, 1, 1, 1, 1,
-0.2919004, -0.4876706, -1.992816, 1, 1, 1, 1, 1,
-0.2904885, 0.6097271, -1.292259, 1, 1, 1, 1, 1,
-0.2904532, 0.3370186, 1.251932, 1, 1, 1, 1, 1,
-0.2860979, 0.2193285, -0.7302606, 1, 1, 1, 1, 1,
-0.2809928, 1.43304, -0.2198796, 1, 1, 1, 1, 1,
-0.2809814, -1.2946, -3.56162, 1, 1, 1, 1, 1,
-0.2789173, 0.8162363, 0.9306072, 1, 1, 1, 1, 1,
-0.2786916, 0.4174176, -0.2202137, 1, 1, 1, 1, 1,
-0.2771312, 0.5236602, -0.237414, 1, 1, 1, 1, 1,
-0.2702998, -1.453615, -2.797004, 1, 1, 1, 1, 1,
-0.2648363, -1.22173, -3.556096, 1, 1, 1, 1, 1,
-0.2635278, -0.707172, -3.833232, 1, 1, 1, 1, 1,
-0.2615983, -0.2823733, -2.83653, 1, 1, 1, 1, 1,
-0.2584561, -0.5242473, -4.08956, 0, 0, 1, 1, 1,
-0.2533962, -0.5567113, -2.380981, 1, 0, 0, 1, 1,
-0.2483664, -0.3973698, -3.137492, 1, 0, 0, 1, 1,
-0.2455972, -0.1510914, -1.686014, 1, 0, 0, 1, 1,
-0.2452019, -0.8384721, -1.495611, 1, 0, 0, 1, 1,
-0.2427104, 1.624024, -0.7665205, 1, 0, 0, 1, 1,
-0.2407223, 0.3045303, -0.7269557, 0, 0, 0, 1, 1,
-0.2402966, 0.9921425, 0.2651814, 0, 0, 0, 1, 1,
-0.2390777, -0.608007, -4.304566, 0, 0, 0, 1, 1,
-0.2381056, -1.04384, -3.078727, 0, 0, 0, 1, 1,
-0.2304298, -0.3314413, -4.67525, 0, 0, 0, 1, 1,
-0.2292205, 0.1452027, 0.3050802, 0, 0, 0, 1, 1,
-0.2273648, -0.3870042, -2.352842, 0, 0, 0, 1, 1,
-0.2250701, 0.2543007, -1.100186, 1, 1, 1, 1, 1,
-0.2231146, 0.06453715, -2.36096, 1, 1, 1, 1, 1,
-0.2228691, 1.012153, -0.2825235, 1, 1, 1, 1, 1,
-0.2157038, 0.9259543, -0.4405951, 1, 1, 1, 1, 1,
-0.2144004, -0.9069753, -3.374832, 1, 1, 1, 1, 1,
-0.2080857, 0.7816198, -0.9673565, 1, 1, 1, 1, 1,
-0.1994182, 0.7103354, -0.04310817, 1, 1, 1, 1, 1,
-0.1960566, -1.04337, -2.294691, 1, 1, 1, 1, 1,
-0.1911057, 0.1550682, -1.996763, 1, 1, 1, 1, 1,
-0.1857253, -1.550318, -1.80288, 1, 1, 1, 1, 1,
-0.1829216, 1.150283, 0.2343284, 1, 1, 1, 1, 1,
-0.1820111, -0.7187099, -3.363147, 1, 1, 1, 1, 1,
-0.1788413, -1.33811, -2.713304, 1, 1, 1, 1, 1,
-0.1782792, -0.006299789, -1.619755, 1, 1, 1, 1, 1,
-0.1763262, 0.2421418, -1.640493, 1, 1, 1, 1, 1,
-0.1749346, -0.3052213, -1.527816, 0, 0, 1, 1, 1,
-0.1715877, 0.9932171, -0.4245936, 1, 0, 0, 1, 1,
-0.1670843, -0.7068884, -4.558148, 1, 0, 0, 1, 1,
-0.1664161, -0.3372604, -2.033065, 1, 0, 0, 1, 1,
-0.1662336, -0.1241711, -1.023773, 1, 0, 0, 1, 1,
-0.1611793, 0.8821789, -0.8078793, 1, 0, 0, 1, 1,
-0.160357, -1.029495, -4.555102, 0, 0, 0, 1, 1,
-0.1595077, 0.09727427, -1.048749, 0, 0, 0, 1, 1,
-0.1541088, -0.7721737, -1.99165, 0, 0, 0, 1, 1,
-0.1540726, 0.7479303, 0.09216856, 0, 0, 0, 1, 1,
-0.1508669, 0.9427914, -1.169977, 0, 0, 0, 1, 1,
-0.1467347, 0.9066738, 1.039227, 0, 0, 0, 1, 1,
-0.1466672, 1.001474, -0.3384836, 0, 0, 0, 1, 1,
-0.1464219, -1.44595, -2.561842, 1, 1, 1, 1, 1,
-0.1445254, 0.2893171, -1.239171, 1, 1, 1, 1, 1,
-0.141361, 0.6648496, 1.529747, 1, 1, 1, 1, 1,
-0.1361715, 1.835774, -0.9397951, 1, 1, 1, 1, 1,
-0.1345372, -0.5842786, -3.998869, 1, 1, 1, 1, 1,
-0.1319303, 0.779721, -0.4338013, 1, 1, 1, 1, 1,
-0.1315238, -0.9976274, -2.940875, 1, 1, 1, 1, 1,
-0.1250826, 0.1091354, -1.058008, 1, 1, 1, 1, 1,
-0.1175407, -0.2112965, -2.202355, 1, 1, 1, 1, 1,
-0.1151376, 0.7277474, -1.096712, 1, 1, 1, 1, 1,
-0.1114432, 0.8115435, 0.8917859, 1, 1, 1, 1, 1,
-0.1101947, 0.7200258, 2.137452, 1, 1, 1, 1, 1,
-0.110075, 0.1973014, 0.1289473, 1, 1, 1, 1, 1,
-0.1090162, 1.518241, 1.738833, 1, 1, 1, 1, 1,
-0.1042077, 0.06106872, -1.150835, 1, 1, 1, 1, 1,
-0.09627176, 1.235543, 1.398441, 0, 0, 1, 1, 1,
-0.09291665, -0.8222629, -3.296241, 1, 0, 0, 1, 1,
-0.08930692, 0.9327673, 0.04057251, 1, 0, 0, 1, 1,
-0.08258021, 0.8540514, -0.5546231, 1, 0, 0, 1, 1,
-0.08217131, -0.1293019, -2.689828, 1, 0, 0, 1, 1,
-0.07563906, 1.454679, 0.2946625, 1, 0, 0, 1, 1,
-0.07457594, -1.351719, -2.3739, 0, 0, 0, 1, 1,
-0.06849464, 1.603555, -1.227195, 0, 0, 0, 1, 1,
-0.06838835, 1.683089, -1.942416, 0, 0, 0, 1, 1,
-0.0680396, -0.108792, -1.238534, 0, 0, 0, 1, 1,
-0.0673056, 1.845768, 0.06565192, 0, 0, 0, 1, 1,
-0.06688946, -0.5295163, -1.94927, 0, 0, 0, 1, 1,
-0.06147934, -1.676527, -3.555562, 0, 0, 0, 1, 1,
-0.06005162, 0.5982142, 0.2740448, 1, 1, 1, 1, 1,
-0.05920262, 0.9366686, 1.114885, 1, 1, 1, 1, 1,
-0.05673631, -0.1166472, -4.298662, 1, 1, 1, 1, 1,
-0.05596123, -0.6933231, -2.40362, 1, 1, 1, 1, 1,
-0.0547022, -0.5099911, -4.71922, 1, 1, 1, 1, 1,
-0.05401203, 1.180383, 0.4948018, 1, 1, 1, 1, 1,
-0.05227031, -0.05738904, -1.567215, 1, 1, 1, 1, 1,
-0.04964096, -0.4355735, -2.822189, 1, 1, 1, 1, 1,
-0.04471775, 0.03836014, -1.889756, 1, 1, 1, 1, 1,
-0.04368724, 1.888614, 1.038536, 1, 1, 1, 1, 1,
-0.04330392, -0.1613909, -2.679759, 1, 1, 1, 1, 1,
-0.04234262, -0.6382672, -2.533705, 1, 1, 1, 1, 1,
-0.04123111, -0.4531168, -4.121204, 1, 1, 1, 1, 1,
-0.03743548, 0.4621954, -2.073433, 1, 1, 1, 1, 1,
-0.03578315, -2.380069, -3.158622, 1, 1, 1, 1, 1,
-0.03384705, -1.247011, -1.643238, 0, 0, 1, 1, 1,
-0.03338189, 0.02709296, -2.332099, 1, 0, 0, 1, 1,
-0.03272481, -1.309384, -3.589164, 1, 0, 0, 1, 1,
-0.02470009, 1.681506, -0.4088064, 1, 0, 0, 1, 1,
-0.02170027, -1.696552, -3.247954, 1, 0, 0, 1, 1,
-0.01905026, 0.853918, 1.027116, 1, 0, 0, 1, 1,
-0.01163089, -2.327152, -1.185302, 0, 0, 0, 1, 1,
-0.01072371, -0.6490014, -3.697038, 0, 0, 0, 1, 1,
-0.009517098, -0.4760024, -2.533417, 0, 0, 0, 1, 1,
-0.008106946, -0.8158489, -3.646574, 0, 0, 0, 1, 1,
-0.007813616, 1.823797, -0.5967605, 0, 0, 0, 1, 1,
-0.006890754, 1.352521, 0.01575585, 0, 0, 0, 1, 1,
-0.005134668, 0.1732084, -1.77639, 0, 0, 0, 1, 1,
-0.004884667, -0.08524176, -1.946842, 1, 1, 1, 1, 1,
-0.001894866, -0.7324702, -1.331209, 1, 1, 1, 1, 1,
0.0006701992, -0.1914665, 3.450469, 1, 1, 1, 1, 1,
0.006187094, -0.0121164, 1.929962, 1, 1, 1, 1, 1,
0.008540618, 0.319412, 1.006071, 1, 1, 1, 1, 1,
0.01313561, 0.06205704, 0.9370219, 1, 1, 1, 1, 1,
0.01354326, -1.304832, 4.061179, 1, 1, 1, 1, 1,
0.01736758, 0.1957462, -0.479861, 1, 1, 1, 1, 1,
0.02004116, -0.4915875, 2.710039, 1, 1, 1, 1, 1,
0.02107759, 0.8131489, 0.8678402, 1, 1, 1, 1, 1,
0.02789826, 2.248781, 2.966105, 1, 1, 1, 1, 1,
0.03238242, -2.171047, 4.014965, 1, 1, 1, 1, 1,
0.03542608, 0.2124926, 0.2340741, 1, 1, 1, 1, 1,
0.03746812, 1.851073, 0.5630856, 1, 1, 1, 1, 1,
0.03804395, 0.4430493, -1.051127, 1, 1, 1, 1, 1,
0.0422198, -0.6747965, 2.884949, 0, 0, 1, 1, 1,
0.04331663, 0.494341, -0.7482311, 1, 0, 0, 1, 1,
0.04340419, 0.6308139, 1.619131, 1, 0, 0, 1, 1,
0.04518928, 0.2412136, 0.3368365, 1, 0, 0, 1, 1,
0.04744767, 0.2276016, -0.8328, 1, 0, 0, 1, 1,
0.05100083, -1.524806, 3.542283, 1, 0, 0, 1, 1,
0.05171825, -1.124913, 2.995512, 0, 0, 0, 1, 1,
0.0529381, 0.9537054, -0.7778906, 0, 0, 0, 1, 1,
0.05440056, 1.614395, 0.4950444, 0, 0, 0, 1, 1,
0.05583714, -0.8293508, 3.252801, 0, 0, 0, 1, 1,
0.0561042, -1.358853, 1.64783, 0, 0, 0, 1, 1,
0.05831802, -1.272745, 3.609136, 0, 0, 0, 1, 1,
0.05865967, 0.06926307, 2.554186, 0, 0, 0, 1, 1,
0.06110134, -0.2173213, 3.986661, 1, 1, 1, 1, 1,
0.06347979, -0.4537762, 3.297295, 1, 1, 1, 1, 1,
0.06638332, -1.08787, 3.343821, 1, 1, 1, 1, 1,
0.06678288, -0.1096446, 2.201435, 1, 1, 1, 1, 1,
0.06812006, -0.6254042, 3.66451, 1, 1, 1, 1, 1,
0.06843135, 0.7589118, 0.0192638, 1, 1, 1, 1, 1,
0.07451655, -0.5944217, 5.042545, 1, 1, 1, 1, 1,
0.07473462, -1.073055, 3.992424, 1, 1, 1, 1, 1,
0.07699399, 1.292729, -0.04029555, 1, 1, 1, 1, 1,
0.07784865, -0.3109729, 3.793898, 1, 1, 1, 1, 1,
0.0791781, -1.165834, 2.649332, 1, 1, 1, 1, 1,
0.08133039, 1.353023, 0.4690293, 1, 1, 1, 1, 1,
0.08292524, -0.008920834, 0.6826012, 1, 1, 1, 1, 1,
0.09449603, 0.3713146, 0.5488353, 1, 1, 1, 1, 1,
0.09724461, -0.1058349, 0.8958712, 1, 1, 1, 1, 1,
0.1012606, -0.6962416, 2.351538, 0, 0, 1, 1, 1,
0.1044148, -0.8222368, 2.578625, 1, 0, 0, 1, 1,
0.1083424, 1.333603, -0.3693699, 1, 0, 0, 1, 1,
0.1162612, -0.6040738, 2.985333, 1, 0, 0, 1, 1,
0.1195244, -0.6872488, 1.669066, 1, 0, 0, 1, 1,
0.1252748, -0.0572811, 0.3756023, 1, 0, 0, 1, 1,
0.1286851, 1.092075, -2.104626, 0, 0, 0, 1, 1,
0.1309527, 0.2386665, 0.002262308, 0, 0, 0, 1, 1,
0.1342589, 1.26897, -0.3341466, 0, 0, 0, 1, 1,
0.1352292, -1.400302, 3.942725, 0, 0, 0, 1, 1,
0.1381964, 0.1117256, -0.1672881, 0, 0, 0, 1, 1,
0.143155, 2.399711, -0.451943, 0, 0, 0, 1, 1,
0.1436163, 0.06102761, 0.1240298, 0, 0, 0, 1, 1,
0.1443027, 0.3588986, 3.006868, 1, 1, 1, 1, 1,
0.1446624, 0.2922667, -1.747696, 1, 1, 1, 1, 1,
0.1471087, -0.91953, 3.013887, 1, 1, 1, 1, 1,
0.1496963, -0.3323764, 1.690363, 1, 1, 1, 1, 1,
0.1521102, 1.298021, -0.6097919, 1, 1, 1, 1, 1,
0.1593589, -0.3467213, 4.156847, 1, 1, 1, 1, 1,
0.1600233, -0.9874598, 4.783968, 1, 1, 1, 1, 1,
0.1631911, 0.4866125, -1.437322, 1, 1, 1, 1, 1,
0.1669081, -1.414687, 2.204443, 1, 1, 1, 1, 1,
0.1670373, 1.14508, 1.303148, 1, 1, 1, 1, 1,
0.1676086, 0.06298011, 2.360361, 1, 1, 1, 1, 1,
0.1754278, 0.8651884, -0.3875656, 1, 1, 1, 1, 1,
0.1758347, 2.342102, 0.4373866, 1, 1, 1, 1, 1,
0.1775957, -0.7831157, 3.023611, 1, 1, 1, 1, 1,
0.1803057, 0.9314763, 0.1947311, 1, 1, 1, 1, 1,
0.1813079, -0.4646449, 2.595013, 0, 0, 1, 1, 1,
0.1839149, 0.1127775, 0.6830927, 1, 0, 0, 1, 1,
0.1930017, 0.8373107, -0.4147627, 1, 0, 0, 1, 1,
0.1958336, 0.1254502, 2.956386, 1, 0, 0, 1, 1,
0.197994, 0.3427627, 1.71268, 1, 0, 0, 1, 1,
0.2004192, 0.1352602, -0.5373985, 1, 0, 0, 1, 1,
0.2007175, -0.04907991, 2.168996, 0, 0, 0, 1, 1,
0.2008599, 0.05753696, 1.365354, 0, 0, 0, 1, 1,
0.2022262, 0.0941252, 0.7862651, 0, 0, 0, 1, 1,
0.2028435, -0.4072833, 2.844136, 0, 0, 0, 1, 1,
0.2041336, 0.6722736, -0.7004481, 0, 0, 0, 1, 1,
0.2043136, 0.4189979, 0.224447, 0, 0, 0, 1, 1,
0.2089837, -0.9680488, 1.471426, 0, 0, 0, 1, 1,
0.2108226, 0.08981937, 1.713583, 1, 1, 1, 1, 1,
0.2122162, 0.01985349, 1.645551, 1, 1, 1, 1, 1,
0.2131749, 0.1834832, 0.450306, 1, 1, 1, 1, 1,
0.214158, -0.4458408, 1.50225, 1, 1, 1, 1, 1,
0.2153785, -0.7444994, 3.280879, 1, 1, 1, 1, 1,
0.2169307, 0.2693792, 1.532779, 1, 1, 1, 1, 1,
0.2173936, 0.08549748, 2.232987, 1, 1, 1, 1, 1,
0.2182138, 1.04893, -0.2321636, 1, 1, 1, 1, 1,
0.2226475, 1.340591, -2.246245, 1, 1, 1, 1, 1,
0.224849, -0.0649169, 3.44648, 1, 1, 1, 1, 1,
0.2263966, -0.9328791, 0.7016885, 1, 1, 1, 1, 1,
0.2280601, 1.864755, 0.6087233, 1, 1, 1, 1, 1,
0.230129, -1.103675, -0.01234916, 1, 1, 1, 1, 1,
0.230563, -0.8412474, 1.672738, 1, 1, 1, 1, 1,
0.2329788, -0.01552767, 0.4401751, 1, 1, 1, 1, 1,
0.2336212, -0.5358906, 1.898655, 0, 0, 1, 1, 1,
0.238714, 0.5835856, 1.29253, 1, 0, 0, 1, 1,
0.2444922, -0.16332, 1.866112, 1, 0, 0, 1, 1,
0.2460321, 0.7604102, 0.8824847, 1, 0, 0, 1, 1,
0.2503334, -0.003043551, -0.1227624, 1, 0, 0, 1, 1,
0.2505318, -0.8786417, 4.497631, 1, 0, 0, 1, 1,
0.2535051, 0.6911547, -0.4290877, 0, 0, 0, 1, 1,
0.2641133, 0.48643, -0.07895993, 0, 0, 0, 1, 1,
0.2648646, -1.272243, 3.927944, 0, 0, 0, 1, 1,
0.2681704, 0.3531576, -0.3227034, 0, 0, 0, 1, 1,
0.2710774, -0.4792027, 2.635787, 0, 0, 0, 1, 1,
0.2780271, -0.105858, 2.236768, 0, 0, 0, 1, 1,
0.2784198, -1.081528, 3.11375, 0, 0, 0, 1, 1,
0.2798053, -0.9100743, 1.782164, 1, 1, 1, 1, 1,
0.2827741, 0.9601405, 1.073897, 1, 1, 1, 1, 1,
0.284402, -0.2482303, 3.075865, 1, 1, 1, 1, 1,
0.2884254, -1.345705, 2.034726, 1, 1, 1, 1, 1,
0.2905295, -0.6484495, 3.880371, 1, 1, 1, 1, 1,
0.2912755, 0.950892, 0.4948905, 1, 1, 1, 1, 1,
0.2921604, -0.5523981, 1.98645, 1, 1, 1, 1, 1,
0.2942871, 0.03271539, 0.901198, 1, 1, 1, 1, 1,
0.2951991, -2.063436, 4.097947, 1, 1, 1, 1, 1,
0.2963327, 1.143091, -1.434066, 1, 1, 1, 1, 1,
0.3057924, -0.3749733, 3.186922, 1, 1, 1, 1, 1,
0.3080978, -0.5892801, 3.140995, 1, 1, 1, 1, 1,
0.3082064, -1.653966, 3.761126, 1, 1, 1, 1, 1,
0.308467, -1.192348, 2.7562, 1, 1, 1, 1, 1,
0.3095132, -0.2821549, 1.001974, 1, 1, 1, 1, 1,
0.3127318, -0.7410735, 5.110817, 0, 0, 1, 1, 1,
0.316418, -0.9932155, 1.02738, 1, 0, 0, 1, 1,
0.316977, 0.3023865, 1.239861, 1, 0, 0, 1, 1,
0.3172731, 0.03214175, 0.8788056, 1, 0, 0, 1, 1,
0.3197685, 0.4266048, 1.048528, 1, 0, 0, 1, 1,
0.3202507, 0.3207236, 0.2189797, 1, 0, 0, 1, 1,
0.3215667, -0.08792784, 1.544163, 0, 0, 0, 1, 1,
0.3219593, -0.8469034, 2.60365, 0, 0, 0, 1, 1,
0.3259106, 0.9906179, -0.009751143, 0, 0, 0, 1, 1,
0.3271984, -0.8846608, 2.656087, 0, 0, 0, 1, 1,
0.3276171, -1.401285, 0.4965542, 0, 0, 0, 1, 1,
0.3288023, -0.7421904, 3.922924, 0, 0, 0, 1, 1,
0.3317207, -0.684985, 2.045184, 0, 0, 0, 1, 1,
0.3335662, 0.9462596, -0.2985092, 1, 1, 1, 1, 1,
0.33481, -0.2885813, 1.01687, 1, 1, 1, 1, 1,
0.3370338, -1.552219, 4.964106, 1, 1, 1, 1, 1,
0.337408, 0.09005641, 0.3760966, 1, 1, 1, 1, 1,
0.3374602, 0.3975919, 0.532702, 1, 1, 1, 1, 1,
0.3385451, 1.154043, 0.2468668, 1, 1, 1, 1, 1,
0.3434507, -0.5257532, 3.415996, 1, 1, 1, 1, 1,
0.343523, -2.063633, 4.105163, 1, 1, 1, 1, 1,
0.3445495, -0.2901408, 0.9132361, 1, 1, 1, 1, 1,
0.354088, -0.1401746, 2.416823, 1, 1, 1, 1, 1,
0.3541915, 0.1667336, 0.6609719, 1, 1, 1, 1, 1,
0.3572423, 0.9956311, 0.8194066, 1, 1, 1, 1, 1,
0.3592111, 0.4937041, 1.320831, 1, 1, 1, 1, 1,
0.3600451, -1.134681, 2.741565, 1, 1, 1, 1, 1,
0.3678783, -2.271953, 1.237807, 1, 1, 1, 1, 1,
0.3683819, 0.516978, -0.2231502, 0, 0, 1, 1, 1,
0.3701556, -0.9111554, 1.618044, 1, 0, 0, 1, 1,
0.3707732, 1.022998, 0.5483568, 1, 0, 0, 1, 1,
0.3710793, 0.1081089, -0.8090156, 1, 0, 0, 1, 1,
0.3713768, 0.6836653, 1.629394, 1, 0, 0, 1, 1,
0.3718571, 0.9430107, 2.33155, 1, 0, 0, 1, 1,
0.3747345, -0.502946, 2.682756, 0, 0, 0, 1, 1,
0.3852617, 1.144499, 0.4806487, 0, 0, 0, 1, 1,
0.385852, -1.372942, 2.775476, 0, 0, 0, 1, 1,
0.3881395, -0.6458901, 2.243163, 0, 0, 0, 1, 1,
0.3910463, -0.4540695, 2.757779, 0, 0, 0, 1, 1,
0.3918512, -0.1064759, 2.743861, 0, 0, 0, 1, 1,
0.392711, 2.906427, 1.946417, 0, 0, 0, 1, 1,
0.3959278, -0.3615966, 2.43574, 1, 1, 1, 1, 1,
0.4004718, 0.5628211, -0.5048854, 1, 1, 1, 1, 1,
0.4075234, -0.857052, 4.142405, 1, 1, 1, 1, 1,
0.4089081, -0.8675143, 3.151039, 1, 1, 1, 1, 1,
0.412893, 0.06936359, 1.469994, 1, 1, 1, 1, 1,
0.4147485, -0.2869563, 3.285393, 1, 1, 1, 1, 1,
0.4277717, 1.496097, -2.596916, 1, 1, 1, 1, 1,
0.4316527, 0.5521334, 0.9599825, 1, 1, 1, 1, 1,
0.4337622, 0.01326641, 1.637893, 1, 1, 1, 1, 1,
0.4353411, -0.5783096, 2.271045, 1, 1, 1, 1, 1,
0.4473729, -1.524478, 3.330358, 1, 1, 1, 1, 1,
0.4506715, 0.4965336, -0.2054818, 1, 1, 1, 1, 1,
0.4522234, 0.4222998, 1.820501, 1, 1, 1, 1, 1,
0.4526609, 1.344354, 2.237471, 1, 1, 1, 1, 1,
0.4568499, -0.9253491, 4.025699, 1, 1, 1, 1, 1,
0.4596226, -1.906207, 2.154841, 0, 0, 1, 1, 1,
0.460699, -0.1378848, 1.262472, 1, 0, 0, 1, 1,
0.4610429, 0.2370465, 1.739408, 1, 0, 0, 1, 1,
0.4645516, -1.136292, 4.151068, 1, 0, 0, 1, 1,
0.4654825, 0.02010706, 0.8434492, 1, 0, 0, 1, 1,
0.4673162, 0.8369089, 0.3621196, 1, 0, 0, 1, 1,
0.4706502, -0.222208, 1.708019, 0, 0, 0, 1, 1,
0.4798714, -0.6468299, 1.854524, 0, 0, 0, 1, 1,
0.4892178, -0.110632, 1.334663, 0, 0, 0, 1, 1,
0.4892605, -0.4452514, 2.191888, 0, 0, 0, 1, 1,
0.49206, 1.502421, 1.056408, 0, 0, 0, 1, 1,
0.4931378, -0.7834124, 1.6224, 0, 0, 0, 1, 1,
0.493412, 0.5127014, 0.1772525, 0, 0, 0, 1, 1,
0.4937527, -1.296148, 3.141437, 1, 1, 1, 1, 1,
0.4939616, 1.941075, -1.081651, 1, 1, 1, 1, 1,
0.4988332, 0.7793531, 0.5933346, 1, 1, 1, 1, 1,
0.5016414, -0.1583023, 1.935903, 1, 1, 1, 1, 1,
0.5049993, -1.624103, 3.503363, 1, 1, 1, 1, 1,
0.5058129, 0.9686893, -0.3059575, 1, 1, 1, 1, 1,
0.5085849, -1.183161, 1.519248, 1, 1, 1, 1, 1,
0.5093722, -0.3528478, 1.237316, 1, 1, 1, 1, 1,
0.5096809, -0.1189274, 1.661943, 1, 1, 1, 1, 1,
0.5110877, 0.7207934, 0.4629, 1, 1, 1, 1, 1,
0.5160342, 0.3135488, 0.2950152, 1, 1, 1, 1, 1,
0.5166896, 0.8247767, 1.896493, 1, 1, 1, 1, 1,
0.5182133, 0.7134736, 1.29169, 1, 1, 1, 1, 1,
0.5203586, -0.2700511, 1.585017, 1, 1, 1, 1, 1,
0.5215088, 0.1482484, 2.569471, 1, 1, 1, 1, 1,
0.5215698, -0.32115, 2.336721, 0, 0, 1, 1, 1,
0.5250098, 0.3421522, -0.6124628, 1, 0, 0, 1, 1,
0.5280254, -1.158829, 0.02658253, 1, 0, 0, 1, 1,
0.5284954, -0.3617414, 1.683408, 1, 0, 0, 1, 1,
0.530968, 2.29978, -1.457855, 1, 0, 0, 1, 1,
0.5324566, 0.2444588, -1.162177, 1, 0, 0, 1, 1,
0.5348166, 0.7100443, -0.9335329, 0, 0, 0, 1, 1,
0.5404609, 1.511112, 1.924245, 0, 0, 0, 1, 1,
0.5442103, -1.385841, 2.223098, 0, 0, 0, 1, 1,
0.5465155, -2.145469, 0.3512446, 0, 0, 0, 1, 1,
0.5478606, -1.079668, 3.049031, 0, 0, 0, 1, 1,
0.5525466, 1.644174, 0.9642355, 0, 0, 0, 1, 1,
0.5532377, -0.3869568, 2.232185, 0, 0, 0, 1, 1,
0.5591711, -1.701755, 2.197806, 1, 1, 1, 1, 1,
0.5618674, 1.381235, -0.1316114, 1, 1, 1, 1, 1,
0.5681013, -1.411399, 4.394865, 1, 1, 1, 1, 1,
0.5690256, 1.76932, -0.6473069, 1, 1, 1, 1, 1,
0.5695673, -0.2984691, 2.681206, 1, 1, 1, 1, 1,
0.5707741, 0.6509244, 2.797541, 1, 1, 1, 1, 1,
0.5778575, 0.763332, 0.8073331, 1, 1, 1, 1, 1,
0.5783954, 0.591724, -1.372994, 1, 1, 1, 1, 1,
0.5814196, 0.6805481, -0.3704926, 1, 1, 1, 1, 1,
0.5827342, 0.5886891, -0.01681596, 1, 1, 1, 1, 1,
0.5840611, 1.101291, -0.02885179, 1, 1, 1, 1, 1,
0.5889444, 0.3723477, 0.7628388, 1, 1, 1, 1, 1,
0.5889702, 3.619786, 0.8392095, 1, 1, 1, 1, 1,
0.5914977, 0.7857323, 0.2487686, 1, 1, 1, 1, 1,
0.5932738, -0.2570144, 2.958494, 1, 1, 1, 1, 1,
0.5939251, 1.423511, -0.6253628, 0, 0, 1, 1, 1,
0.6007636, -0.7752095, 2.393064, 1, 0, 0, 1, 1,
0.605263, 0.6955079, 1.942008, 1, 0, 0, 1, 1,
0.6060445, 1.217776, 0.1724297, 1, 0, 0, 1, 1,
0.6088193, -0.9016194, 2.532645, 1, 0, 0, 1, 1,
0.6096676, 0.7519088, 1.576116, 1, 0, 0, 1, 1,
0.6098345, -0.590451, 0.50016, 0, 0, 0, 1, 1,
0.6121046, 0.3765648, 1.548955, 0, 0, 0, 1, 1,
0.6123708, -0.1977988, 1.759109, 0, 0, 0, 1, 1,
0.6174237, 0.7859674, 1.593574, 0, 0, 0, 1, 1,
0.6198171, -0.6570634, 1.495685, 0, 0, 0, 1, 1,
0.6225728, 0.08494409, 0.6727825, 0, 0, 0, 1, 1,
0.6252711, 0.959621, 0.1421415, 0, 0, 0, 1, 1,
0.6274474, -0.4773481, 2.394297, 1, 1, 1, 1, 1,
0.6299343, 0.2412565, 1.322819, 1, 1, 1, 1, 1,
0.6347793, 1.325756, 1.625839, 1, 1, 1, 1, 1,
0.6401026, -0.5087681, 1.182266, 1, 1, 1, 1, 1,
0.6408232, -1.000309, 0.9757429, 1, 1, 1, 1, 1,
0.6460198, 1.070048, 0.7048244, 1, 1, 1, 1, 1,
0.6470466, -0.2809592, 1.532428, 1, 1, 1, 1, 1,
0.6481097, 0.002683575, 0.8003663, 1, 1, 1, 1, 1,
0.6526012, 0.7563634, 1.261089, 1, 1, 1, 1, 1,
0.6615458, 0.1084465, 2.28039, 1, 1, 1, 1, 1,
0.6667582, 2.936285, 2.222154, 1, 1, 1, 1, 1,
0.6698477, 1.184933, 3.142578, 1, 1, 1, 1, 1,
0.6705309, -1.187482, 3.05026, 1, 1, 1, 1, 1,
0.67229, -0.01884953, 2.317553, 1, 1, 1, 1, 1,
0.6725631, -0.06725474, 0.9694508, 1, 1, 1, 1, 1,
0.6738726, -1.206096, 3.056748, 0, 0, 1, 1, 1,
0.6741781, -0.7407146, 2.825378, 1, 0, 0, 1, 1,
0.6790067, 1.108286, -0.2383302, 1, 0, 0, 1, 1,
0.6811017, -1.573042, 2.861058, 1, 0, 0, 1, 1,
0.6830792, 0.9246188, 0.8280774, 1, 0, 0, 1, 1,
0.6989698, 0.9032456, 1.067831, 1, 0, 0, 1, 1,
0.7025969, -2.213546, 4.488209, 0, 0, 0, 1, 1,
0.7048297, 0.160831, 0.3775788, 0, 0, 0, 1, 1,
0.7094729, -0.539549, 4.32303, 0, 0, 0, 1, 1,
0.714006, 0.7930941, -0.4857735, 0, 0, 0, 1, 1,
0.7187723, -1.233304, 2.630323, 0, 0, 0, 1, 1,
0.721131, 1.497406, 0.6444966, 0, 0, 0, 1, 1,
0.7215613, -0.08899284, 1.249864, 0, 0, 0, 1, 1,
0.726007, 0.05983214, 1.308676, 1, 1, 1, 1, 1,
0.7283098, 0.2427803, 0.4533377, 1, 1, 1, 1, 1,
0.7337661, 0.7804695, 1.471935, 1, 1, 1, 1, 1,
0.7365631, -0.7125756, 1.377777, 1, 1, 1, 1, 1,
0.7372167, 1.615878, -0.1894369, 1, 1, 1, 1, 1,
0.7444527, -0.6483122, 2.615733, 1, 1, 1, 1, 1,
0.7462574, -1.83449, 2.933928, 1, 1, 1, 1, 1,
0.7515041, 0.2696026, -0.5813407, 1, 1, 1, 1, 1,
0.7571065, -0.6086, 1.273679, 1, 1, 1, 1, 1,
0.7627268, -0.02646348, 0.7010605, 1, 1, 1, 1, 1,
0.7633238, 1.001219, -1.036457, 1, 1, 1, 1, 1,
0.7635695, 0.5426075, 0.2687078, 1, 1, 1, 1, 1,
0.7736014, -0.1033605, 0.997992, 1, 1, 1, 1, 1,
0.773656, -0.3063468, 0.8864119, 1, 1, 1, 1, 1,
0.774582, 0.3658787, 0.8074019, 1, 1, 1, 1, 1,
0.782686, -0.2912368, 1.019337, 0, 0, 1, 1, 1,
0.7828559, -0.7442291, 2.807651, 1, 0, 0, 1, 1,
0.7863789, -0.304031, 1.647027, 1, 0, 0, 1, 1,
0.7958041, 0.589845, 0.6941265, 1, 0, 0, 1, 1,
0.7980756, 0.6188945, 0.7109097, 1, 0, 0, 1, 1,
0.7994257, -0.1524126, 1.723927, 1, 0, 0, 1, 1,
0.7996611, 0.8303505, 1.367495, 0, 0, 0, 1, 1,
0.800059, -0.565558, 2.093403, 0, 0, 0, 1, 1,
0.8038737, -0.1220891, 1.230197, 0, 0, 0, 1, 1,
0.8055981, -0.3125808, 3.139462, 0, 0, 0, 1, 1,
0.8067064, 0.5169936, 2.45811, 0, 0, 0, 1, 1,
0.8091099, 0.749862, -0.4621108, 0, 0, 0, 1, 1,
0.809175, 0.1588818, 3.080664, 0, 0, 0, 1, 1,
0.8128982, -1.430064, 3.277064, 1, 1, 1, 1, 1,
0.8177549, -0.8238069, 1.942872, 1, 1, 1, 1, 1,
0.8182123, 0.5984327, 0.5790639, 1, 1, 1, 1, 1,
0.8190239, -0.6452295, 0.1348327, 1, 1, 1, 1, 1,
0.8228025, -0.138588, 2.942283, 1, 1, 1, 1, 1,
0.8244638, -0.03900201, 0.7266869, 1, 1, 1, 1, 1,
0.8246531, 0.7632558, 1.762014, 1, 1, 1, 1, 1,
0.824773, 0.5199824, -0.08348411, 1, 1, 1, 1, 1,
0.8269563, -0.3527722, 1.38463, 1, 1, 1, 1, 1,
0.827466, -0.03839688, 0.6015407, 1, 1, 1, 1, 1,
0.8323368, 0.5445581, 2.412855, 1, 1, 1, 1, 1,
0.8381191, -0.6055116, 0.6347895, 1, 1, 1, 1, 1,
0.8388811, 0.6619256, 0.1346236, 1, 1, 1, 1, 1,
0.841328, -1.600839, 2.344951, 1, 1, 1, 1, 1,
0.8473848, 0.4462299, 3.136093, 1, 1, 1, 1, 1,
0.8497092, 0.1160456, 2.428808, 0, 0, 1, 1, 1,
0.8551409, -1.027932, 2.310003, 1, 0, 0, 1, 1,
0.8565026, -0.04216057, 1.913906, 1, 0, 0, 1, 1,
0.8589748, 1.377553, 0.103211, 1, 0, 0, 1, 1,
0.8620499, -1.989141, 2.566647, 1, 0, 0, 1, 1,
0.871036, -0.6222608, 2.344125, 1, 0, 0, 1, 1,
0.8797842, -0.5681481, 1.773304, 0, 0, 0, 1, 1,
0.8864237, -2.373358, 3.444369, 0, 0, 0, 1, 1,
0.8963628, 0.597407, 2.123317, 0, 0, 0, 1, 1,
0.8979328, 0.5376632, 2.340818, 0, 0, 0, 1, 1,
0.89996, 0.3070081, 0.5885602, 0, 0, 0, 1, 1,
0.9030721, 0.9692701, 0.7545847, 0, 0, 0, 1, 1,
0.9056315, 1.73883, 1.665247, 0, 0, 0, 1, 1,
0.9098337, 0.08734116, 0.6909788, 1, 1, 1, 1, 1,
0.9107822, -1.088803, 3.48443, 1, 1, 1, 1, 1,
0.9120138, -0.09947147, 0.463026, 1, 1, 1, 1, 1,
0.9135891, 0.6444808, -0.08401191, 1, 1, 1, 1, 1,
0.9139802, 0.4688988, -0.03494182, 1, 1, 1, 1, 1,
0.9158887, 0.7844325, 1.580716, 1, 1, 1, 1, 1,
0.9191906, 0.9579555, 1.167332, 1, 1, 1, 1, 1,
0.9214588, 0.2468013, -1.127389, 1, 1, 1, 1, 1,
0.9286428, -2.208992, 1.26765, 1, 1, 1, 1, 1,
0.9304234, -1.06643, 3.429208, 1, 1, 1, 1, 1,
0.93221, 1.739451, 0.1649757, 1, 1, 1, 1, 1,
0.9337164, -0.348687, 3.003748, 1, 1, 1, 1, 1,
0.9389541, 0.6687216, 0.0246984, 1, 1, 1, 1, 1,
0.9411196, 0.08403649, -0.586141, 1, 1, 1, 1, 1,
0.944199, 0.6437773, 0.5549347, 1, 1, 1, 1, 1,
0.9450082, 1.673362, 1.128875, 0, 0, 1, 1, 1,
0.9456114, 0.3723381, 1.013233, 1, 0, 0, 1, 1,
0.9555804, -1.167901, 3.157072, 1, 0, 0, 1, 1,
0.9570983, -1.148053, 1.052391, 1, 0, 0, 1, 1,
0.9595591, -0.5681543, 3.696036, 1, 0, 0, 1, 1,
0.9673107, 0.8149905, 1.158375, 1, 0, 0, 1, 1,
0.9674534, 1.392455, -0.3495928, 0, 0, 0, 1, 1,
0.9675388, -1.511271, 2.345232, 0, 0, 0, 1, 1,
0.9735541, 1.596306, 1.079882, 0, 0, 0, 1, 1,
0.9785261, -1.501524, 4.422406, 0, 0, 0, 1, 1,
0.9838142, 0.9036906, 0.6174173, 0, 0, 0, 1, 1,
0.985096, 0.9956875, 2.229, 0, 0, 0, 1, 1,
0.9888333, -0.7239304, 1.387889, 0, 0, 0, 1, 1,
0.9898416, -0.4705102, 0.2031064, 1, 1, 1, 1, 1,
0.9906751, 0.9940301, 0.454442, 1, 1, 1, 1, 1,
0.9936217, 0.4339676, 0.563894, 1, 1, 1, 1, 1,
0.9963905, 0.1889793, 0.6509303, 1, 1, 1, 1, 1,
0.9985488, 0.5370423, 1.450893, 1, 1, 1, 1, 1,
1.000512, 0.9828857, 1.080634, 1, 1, 1, 1, 1,
1.011463, -1.840683, 2.054122, 1, 1, 1, 1, 1,
1.016789, 0.08298857, 0.9801983, 1, 1, 1, 1, 1,
1.016798, -0.3783742, 1.522679, 1, 1, 1, 1, 1,
1.02151, -0.8442692, 3.132039, 1, 1, 1, 1, 1,
1.02785, -1.929648, 3.177662, 1, 1, 1, 1, 1,
1.032283, 0.6447638, 2.839144, 1, 1, 1, 1, 1,
1.038891, -1.169499, 2.575386, 1, 1, 1, 1, 1,
1.043339, -0.3238487, 1.739457, 1, 1, 1, 1, 1,
1.049601, 1.285031, 3.803806, 1, 1, 1, 1, 1,
1.050142, -0.1247484, 1.701113, 0, 0, 1, 1, 1,
1.050357, 0.546534, 1.255084, 1, 0, 0, 1, 1,
1.051068, 1.08532, 1.194609, 1, 0, 0, 1, 1,
1.061162, 0.5166608, 1.364843, 1, 0, 0, 1, 1,
1.065131, -1.786532, 1.894595, 1, 0, 0, 1, 1,
1.067005, -0.05892808, 0.563745, 1, 0, 0, 1, 1,
1.069088, 0.8174846, 0.5287006, 0, 0, 0, 1, 1,
1.070489, -0.007544658, 1.210734, 0, 0, 0, 1, 1,
1.079292, 0.366895, 1.417438, 0, 0, 0, 1, 1,
1.081152, -0.178945, 2.439037, 0, 0, 0, 1, 1,
1.085818, -0.1489628, 1.143866, 0, 0, 0, 1, 1,
1.0878, 1.996226, 0.4419279, 0, 0, 0, 1, 1,
1.094556, -2.055485, 0.2290939, 0, 0, 0, 1, 1,
1.102278, 0.8805068, 0.2954645, 1, 1, 1, 1, 1,
1.106718, -0.03071383, 3.190469, 1, 1, 1, 1, 1,
1.111405, 0.9917072, -0.03575709, 1, 1, 1, 1, 1,
1.129805, -1.813846, 2.716671, 1, 1, 1, 1, 1,
1.134976, -0.5708366, 1.548411, 1, 1, 1, 1, 1,
1.142462, 0.1324314, 3.751106, 1, 1, 1, 1, 1,
1.146191, -0.2161923, 1.625157, 1, 1, 1, 1, 1,
1.146888, 0.2776833, 2.73547, 1, 1, 1, 1, 1,
1.153031, -1.13562, 3.424545, 1, 1, 1, 1, 1,
1.155213, 0.7643238, 0.3979763, 1, 1, 1, 1, 1,
1.155299, -0.8319874, 2.508976, 1, 1, 1, 1, 1,
1.159872, 1.338742, -0.5872089, 1, 1, 1, 1, 1,
1.163595, 1.445595, -0.256015, 1, 1, 1, 1, 1,
1.164551, -0.5801352, 1.18366, 1, 1, 1, 1, 1,
1.17094, -2.365813, 1.173503, 1, 1, 1, 1, 1,
1.174299, -0.9312962, 2.02883, 0, 0, 1, 1, 1,
1.176363, -0.7081407, 1.866088, 1, 0, 0, 1, 1,
1.178316, 0.4336015, 0.716253, 1, 0, 0, 1, 1,
1.184991, -0.09225312, 1.689829, 1, 0, 0, 1, 1,
1.202993, 1.265729, 1.333083, 1, 0, 0, 1, 1,
1.203631, 0.3293381, 2.212737, 1, 0, 0, 1, 1,
1.203837, -0.2172729, 1.52237, 0, 0, 0, 1, 1,
1.207144, 0.09046961, 0.9046384, 0, 0, 0, 1, 1,
1.214757, 1.218299, 1.225973, 0, 0, 0, 1, 1,
1.214971, 0.4330142, 1.512912, 0, 0, 0, 1, 1,
1.21958, -0.8564193, 2.562055, 0, 0, 0, 1, 1,
1.224172, -0.919163, 1.861883, 0, 0, 0, 1, 1,
1.230486, -0.4599543, 2.671612, 0, 0, 0, 1, 1,
1.23855, 0.2238821, 3.450279, 1, 1, 1, 1, 1,
1.238791, 0.6600318, 2.077225, 1, 1, 1, 1, 1,
1.240427, -0.4514802, 1.9693, 1, 1, 1, 1, 1,
1.24196, 0.9755009, 2.595209, 1, 1, 1, 1, 1,
1.252729, -1.438187, 2.748504, 1, 1, 1, 1, 1,
1.253582, 0.8924776, 1.859613, 1, 1, 1, 1, 1,
1.260159, -1.503351, 3.152782, 1, 1, 1, 1, 1,
1.263018, 1.008253, 2.411394, 1, 1, 1, 1, 1,
1.263051, 0.7499775, 3.74668, 1, 1, 1, 1, 1,
1.268033, -1.259144, 3.131343, 1, 1, 1, 1, 1,
1.270419, 0.01907467, 1.261363, 1, 1, 1, 1, 1,
1.271024, 0.2817642, 1.368782, 1, 1, 1, 1, 1,
1.276697, -0.434016, 1.532155, 1, 1, 1, 1, 1,
1.284174, 0.122101, 2.042498, 1, 1, 1, 1, 1,
1.291158, 0.2683551, 1.962585, 1, 1, 1, 1, 1,
1.291334, -1.056129, -0.1139138, 0, 0, 1, 1, 1,
1.295344, -2.267864, 2.833951, 1, 0, 0, 1, 1,
1.303588, -2.011508, 1.575861, 1, 0, 0, 1, 1,
1.305254, -1.063443, 2.290612, 1, 0, 0, 1, 1,
1.305556, -0.803627, 1.866087, 1, 0, 0, 1, 1,
1.309182, 2.000277, -0.6208036, 1, 0, 0, 1, 1,
1.311052, -0.6230025, 0.4305583, 0, 0, 0, 1, 1,
1.313934, -1.119671, 1.738799, 0, 0, 0, 1, 1,
1.314606, -2.441962, 2.324885, 0, 0, 0, 1, 1,
1.314919, 0.4426467, 2.923069, 0, 0, 0, 1, 1,
1.325601, 0.7770361, 2.084134, 0, 0, 0, 1, 1,
1.326292, 0.9917877, 0.6600863, 0, 0, 0, 1, 1,
1.330594, 0.03414348, 0.3126878, 0, 0, 0, 1, 1,
1.332384, -2.711235, 2.09041, 1, 1, 1, 1, 1,
1.346285, 1.234429, 1.459209, 1, 1, 1, 1, 1,
1.347135, -0.2472956, 2.66609, 1, 1, 1, 1, 1,
1.355406, 0.09349092, 1.248474, 1, 1, 1, 1, 1,
1.376415, -0.4029095, 3.458437, 1, 1, 1, 1, 1,
1.385891, -1.115255, 1.475406, 1, 1, 1, 1, 1,
1.389203, 1.665657, 1.160875, 1, 1, 1, 1, 1,
1.394767, -0.387936, 1.101708, 1, 1, 1, 1, 1,
1.39629, -0.6325066, 3.086942, 1, 1, 1, 1, 1,
1.411606, 0.2958253, 1.319938, 1, 1, 1, 1, 1,
1.418773, -0.6982056, 2.456542, 1, 1, 1, 1, 1,
1.429472, -2.914222, 3.314165, 1, 1, 1, 1, 1,
1.429642, 0.6575608, 1.831618, 1, 1, 1, 1, 1,
1.451763, 0.1248565, 0.01760989, 1, 1, 1, 1, 1,
1.462867, 0.563992, 3.813182, 1, 1, 1, 1, 1,
1.464653, -0.04909048, 0.9690632, 0, 0, 1, 1, 1,
1.481694, 0.9054093, 0.6727291, 1, 0, 0, 1, 1,
1.483368, -1.166516, 1.105301, 1, 0, 0, 1, 1,
1.488327, 0.7528082, 2.063002, 1, 0, 0, 1, 1,
1.494722, 1.134422, -0.3475933, 1, 0, 0, 1, 1,
1.500034, -0.6903276, 2.183003, 1, 0, 0, 1, 1,
1.512652, -1.332684, 0.7608414, 0, 0, 0, 1, 1,
1.515051, -0.8897452, 1.424307, 0, 0, 0, 1, 1,
1.529023, -0.04205081, 0.88757, 0, 0, 0, 1, 1,
1.531171, 0.01792387, 1.517931, 0, 0, 0, 1, 1,
1.540014, 0.08739593, 2.573883, 0, 0, 0, 1, 1,
1.541958, -0.6877267, 2.732418, 0, 0, 0, 1, 1,
1.550602, 0.5918912, 1.274096, 0, 0, 0, 1, 1,
1.591048, 1.050637, 1.247705, 1, 1, 1, 1, 1,
1.594324, 0.4904178, 3.023936, 1, 1, 1, 1, 1,
1.598631, 0.2965035, 2.677888, 1, 1, 1, 1, 1,
1.605744, -0.5875371, 0.2565883, 1, 1, 1, 1, 1,
1.60927, -0.2706961, 2.417756, 1, 1, 1, 1, 1,
1.625594, -1.26003, 1.84697, 1, 1, 1, 1, 1,
1.629747, -0.5760479, 3.68727, 1, 1, 1, 1, 1,
1.63114, 0.7992489, -0.08156967, 1, 1, 1, 1, 1,
1.639018, 1.161611, -0.9587356, 1, 1, 1, 1, 1,
1.64742, -1.539207, 2.523217, 1, 1, 1, 1, 1,
1.650349, 1.174096, 2.210197, 1, 1, 1, 1, 1,
1.658181, -0.8574795, 1.689174, 1, 1, 1, 1, 1,
1.664762, -2.421474, 2.694728, 1, 1, 1, 1, 1,
1.668929, 0.7694694, 1.531356, 1, 1, 1, 1, 1,
1.715764, 0.1183596, 0.5665479, 1, 1, 1, 1, 1,
1.728245, -0.2580207, 3.171643, 0, 0, 1, 1, 1,
1.734064, -0.4613935, 1.405683, 1, 0, 0, 1, 1,
1.745506, 0.5249486, 1.171878, 1, 0, 0, 1, 1,
1.757777, 0.951111, 1.254975, 1, 0, 0, 1, 1,
1.808299, -0.8858565, 3.042184, 1, 0, 0, 1, 1,
1.812581, 1.040977, 2.97432, 1, 0, 0, 1, 1,
1.817398, -0.1142733, 1.098119, 0, 0, 0, 1, 1,
1.820978, -1.554436, 1.658859, 0, 0, 0, 1, 1,
1.828145, -0.923532, -0.3661934, 0, 0, 0, 1, 1,
1.833305, -0.8348947, 2.405103, 0, 0, 0, 1, 1,
1.842657, 1.377407, 0.7413317, 0, 0, 0, 1, 1,
1.850802, -0.4142849, 1.975822, 0, 0, 0, 1, 1,
1.851213, 0.8981897, 1.145501, 0, 0, 0, 1, 1,
1.86542, 0.5420066, 0.8317789, 1, 1, 1, 1, 1,
1.891836, -0.705673, 3.537154, 1, 1, 1, 1, 1,
1.895362, 0.4887744, 0.7919763, 1, 1, 1, 1, 1,
1.912464, 0.9059865, 0.7966818, 1, 1, 1, 1, 1,
1.9194, 0.5172017, 2.052053, 1, 1, 1, 1, 1,
1.924241, -0.6497124, 1.454469, 1, 1, 1, 1, 1,
1.925169, -0.4694456, 1.598164, 1, 1, 1, 1, 1,
1.966416, -0.3751161, 1.84177, 1, 1, 1, 1, 1,
2.002857, 0.6229496, 2.965497, 1, 1, 1, 1, 1,
2.007522, 0.9367194, 0.824447, 1, 1, 1, 1, 1,
2.033636, -0.3678581, 0.9024915, 1, 1, 1, 1, 1,
2.043555, 0.1789782, 1.096283, 1, 1, 1, 1, 1,
2.152954, 0.02511906, 2.043267, 1, 1, 1, 1, 1,
2.155579, 0.679547, 2.07041, 1, 1, 1, 1, 1,
2.206199, -0.8557228, 1.691153, 1, 1, 1, 1, 1,
2.20844, 0.173281, -0.78115, 0, 0, 1, 1, 1,
2.232444, -0.1939041, 2.031832, 1, 0, 0, 1, 1,
2.240554, 0.3861878, 0.3476868, 1, 0, 0, 1, 1,
2.246941, 2.102666, 0.576662, 1, 0, 0, 1, 1,
2.253372, -0.8368784, 2.810158, 1, 0, 0, 1, 1,
2.262124, 0.7494599, 0.8469037, 1, 0, 0, 1, 1,
2.289006, 0.5875809, 0.09761366, 0, 0, 0, 1, 1,
2.343529, -1.098341, 2.021291, 0, 0, 0, 1, 1,
2.365124, -1.439188, 2.058276, 0, 0, 0, 1, 1,
2.369275, 0.1950423, 0.4649457, 0, 0, 0, 1, 1,
2.419233, 0.6274527, 0.4399387, 0, 0, 0, 1, 1,
2.458136, -0.31977, 1.361984, 0, 0, 0, 1, 1,
2.580141, 1.099559, 2.465779, 0, 0, 0, 1, 1,
2.626076, -0.3988582, -0.4685713, 1, 1, 1, 1, 1,
2.669261, 0.279145, 1.597536, 1, 1, 1, 1, 1,
2.6768, 1.219859, 2.019094, 1, 1, 1, 1, 1,
2.803167, 0.01690903, 1.110785, 1, 1, 1, 1, 1,
2.812937, 0.5628743, 1.333347, 1, 1, 1, 1, 1,
3.041016, 1.314513, 0.6476948, 1, 1, 1, 1, 1,
3.579194, 0.4640778, 2.149312, 1, 1, 1, 1, 1
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
var radius = 9.35785;
var distance = 32.86905;
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
mvMatrix.translate( -0.4003958, -0.3527817, -0.05262542 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.86905);
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