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
-2.838571, -0.8752059, -2.471401, 1, 0, 0, 1,
-2.830076, 0.4303145, -1.02584, 1, 0.007843138, 0, 1,
-2.539879, 2.346366, -0.5437933, 1, 0.01176471, 0, 1,
-2.4994, -0.6719018, -2.60571, 1, 0.01960784, 0, 1,
-2.498682, 0.05605528, -1.633948, 1, 0.02352941, 0, 1,
-2.421722, 1.319009, -1.050375, 1, 0.03137255, 0, 1,
-2.360787, 1.095977, -1.370419, 1, 0.03529412, 0, 1,
-2.342797, -1.15618, -3.801253, 1, 0.04313726, 0, 1,
-2.238063, -0.2968359, -2.054566, 1, 0.04705882, 0, 1,
-2.212809, 1.174121, -1.345724, 1, 0.05490196, 0, 1,
-2.203251, 0.9925696, -1.459223, 1, 0.05882353, 0, 1,
-2.144969, -2.275569, -1.961549, 1, 0.06666667, 0, 1,
-2.127176, 0.09774263, -2.005773, 1, 0.07058824, 0, 1,
-2.12683, 0.3909726, -2.386859, 1, 0.07843138, 0, 1,
-2.124032, 1.160983, -1.788003, 1, 0.08235294, 0, 1,
-2.10182, -0.6098382, -2.571322, 1, 0.09019608, 0, 1,
-2.097666, 0.4413907, -0.1651586, 1, 0.09411765, 0, 1,
-2.096905, 1.198521, -2.480591, 1, 0.1019608, 0, 1,
-2.077385, -0.671944, -2.646905, 1, 0.1098039, 0, 1,
-2.072317, -0.2701244, -2.285748, 1, 0.1137255, 0, 1,
-2.069073, -0.03467844, -0.8392679, 1, 0.1215686, 0, 1,
-2.063616, 0.7159343, -2.881928, 1, 0.1254902, 0, 1,
-2.056924, 0.5070076, -1.893836, 1, 0.1333333, 0, 1,
-2.048538, -1.039028, -2.043118, 1, 0.1372549, 0, 1,
-2.007879, 0.6647643, -1.135985, 1, 0.145098, 0, 1,
-1.97957, 1.291435, 0.4521908, 1, 0.1490196, 0, 1,
-1.94314, 2.279564, 0.3244884, 1, 0.1568628, 0, 1,
-1.924498, -1.09313, -2.810766, 1, 0.1607843, 0, 1,
-1.91446, -0.9099265, -2.021968, 1, 0.1686275, 0, 1,
-1.912514, -0.1669415, -1.614297, 1, 0.172549, 0, 1,
-1.910698, -0.06333186, -2.87567, 1, 0.1803922, 0, 1,
-1.894613, 0.8251062, -1.078092, 1, 0.1843137, 0, 1,
-1.884293, -1.842834, -1.219734, 1, 0.1921569, 0, 1,
-1.8563, -1.056526, -2.811337, 1, 0.1960784, 0, 1,
-1.825303, 0.507102, -0.8370328, 1, 0.2039216, 0, 1,
-1.814641, 1.164184, -0.224737, 1, 0.2117647, 0, 1,
-1.806812, -1.020986, -0.2173012, 1, 0.2156863, 0, 1,
-1.781077, -0.08464936, 0.9102807, 1, 0.2235294, 0, 1,
-1.776966, -0.7539781, -0.5731989, 1, 0.227451, 0, 1,
-1.75911, 0.5621457, -0.6970614, 1, 0.2352941, 0, 1,
-1.728306, -0.1238342, -2.997066, 1, 0.2392157, 0, 1,
-1.725506, -0.1483152, -1.957792, 1, 0.2470588, 0, 1,
-1.712624, 0.3422105, -3.61475, 1, 0.2509804, 0, 1,
-1.71058, 0.09119482, -2.50545, 1, 0.2588235, 0, 1,
-1.710051, -0.03605243, -1.93155, 1, 0.2627451, 0, 1,
-1.692089, 0.4611246, -1.084876, 1, 0.2705882, 0, 1,
-1.684668, 0.5816803, -0.4457485, 1, 0.2745098, 0, 1,
-1.683825, -0.4736411, -3.051203, 1, 0.282353, 0, 1,
-1.673828, 0.06875832, -0.995693, 1, 0.2862745, 0, 1,
-1.67161, 0.8855091, -1.742665, 1, 0.2941177, 0, 1,
-1.662009, 0.3432187, -1.61435, 1, 0.3019608, 0, 1,
-1.65861, 1.852351, -0.7612356, 1, 0.3058824, 0, 1,
-1.627124, 0.0843806, 0.1124596, 1, 0.3137255, 0, 1,
-1.616716, -0.6735776, -1.729488, 1, 0.3176471, 0, 1,
-1.598032, -0.5856789, -3.006277, 1, 0.3254902, 0, 1,
-1.594517, 0.1429328, -1.481569, 1, 0.3294118, 0, 1,
-1.582069, 1.076904, -0.506817, 1, 0.3372549, 0, 1,
-1.58191, 0.7604451, -3.686739, 1, 0.3411765, 0, 1,
-1.579283, -0.2265403, -2.14673, 1, 0.3490196, 0, 1,
-1.571077, 0.769787, 0.569243, 1, 0.3529412, 0, 1,
-1.566669, -1.038064, -1.061109, 1, 0.3607843, 0, 1,
-1.540671, 0.5802323, -0.7499428, 1, 0.3647059, 0, 1,
-1.540468, -0.2717664, -1.525854, 1, 0.372549, 0, 1,
-1.537658, 0.2804026, -0.4854367, 1, 0.3764706, 0, 1,
-1.535454, -1.372512, -3.391125, 1, 0.3843137, 0, 1,
-1.502293, 0.1704144, -2.610949, 1, 0.3882353, 0, 1,
-1.486175, 1.82069, -0.4662448, 1, 0.3960784, 0, 1,
-1.484357, -0.5244241, -0.4239631, 1, 0.4039216, 0, 1,
-1.480992, 0.8741261, -0.05568602, 1, 0.4078431, 0, 1,
-1.474453, 0.7954691, -0.7377977, 1, 0.4156863, 0, 1,
-1.454143, 0.3636367, -2.436427, 1, 0.4196078, 0, 1,
-1.453585, 0.6462523, 0.2678129, 1, 0.427451, 0, 1,
-1.441235, 1.119809, -0.9378538, 1, 0.4313726, 0, 1,
-1.439614, 0.08889374, -2.513462, 1, 0.4392157, 0, 1,
-1.429992, 0.3729596, 0.0334792, 1, 0.4431373, 0, 1,
-1.429827, -1.725509, -3.880202, 1, 0.4509804, 0, 1,
-1.429134, -0.7843935, -0.06277197, 1, 0.454902, 0, 1,
-1.419154, -0.4542029, -0.8713542, 1, 0.4627451, 0, 1,
-1.414335, 0.2674175, -0.7456381, 1, 0.4666667, 0, 1,
-1.413292, -1.535214, -2.32376, 1, 0.4745098, 0, 1,
-1.392058, 0.7673544, -0.894383, 1, 0.4784314, 0, 1,
-1.388728, -0.8647946, -1.500834, 1, 0.4862745, 0, 1,
-1.384723, 2.099769, -0.8673801, 1, 0.4901961, 0, 1,
-1.384256, -0.4936864, -2.757587, 1, 0.4980392, 0, 1,
-1.383552, -0.8616168, -1.455653, 1, 0.5058824, 0, 1,
-1.367161, -0.07180435, -1.909378, 1, 0.509804, 0, 1,
-1.361274, 1.03755, -1.198481, 1, 0.5176471, 0, 1,
-1.361082, 0.5916076, -1.647046, 1, 0.5215687, 0, 1,
-1.349887, -0.6418606, -0.881371, 1, 0.5294118, 0, 1,
-1.342461, -0.2853564, -2.699188, 1, 0.5333334, 0, 1,
-1.337842, 0.6561932, -1.122757, 1, 0.5411765, 0, 1,
-1.337063, 0.0849596, -1.068153, 1, 0.5450981, 0, 1,
-1.32418, 1.484857, -3.589566, 1, 0.5529412, 0, 1,
-1.31687, 0.6894647, -0.7514765, 1, 0.5568628, 0, 1,
-1.302612, -0.5825369, -2.939271, 1, 0.5647059, 0, 1,
-1.297949, 1.047986, -2.789677, 1, 0.5686275, 0, 1,
-1.296484, -0.07262159, -1.286637, 1, 0.5764706, 0, 1,
-1.296114, -1.289011, -2.030745, 1, 0.5803922, 0, 1,
-1.279304, 0.7900786, -1.462411, 1, 0.5882353, 0, 1,
-1.274567, -0.2928357, -1.693472, 1, 0.5921569, 0, 1,
-1.2669, 0.8126203, -0.1103731, 1, 0.6, 0, 1,
-1.254067, 1.265734, -0.3240865, 1, 0.6078432, 0, 1,
-1.245893, 0.508911, -1.223886, 1, 0.6117647, 0, 1,
-1.243678, -0.009360955, -1.362095, 1, 0.6196079, 0, 1,
-1.243028, 0.9743447, -0.7710367, 1, 0.6235294, 0, 1,
-1.242658, -0.3936585, -3.157845, 1, 0.6313726, 0, 1,
-1.241622, 0.7784006, -2.015716, 1, 0.6352941, 0, 1,
-1.23436, 0.9695463, -0.5850648, 1, 0.6431373, 0, 1,
-1.230494, 0.6581188, -2.315841, 1, 0.6470588, 0, 1,
-1.216307, 0.05203568, -1.309763, 1, 0.654902, 0, 1,
-1.213517, -0.003411607, 0.5812477, 1, 0.6588235, 0, 1,
-1.184985, -1.40113, -3.501495, 1, 0.6666667, 0, 1,
-1.184729, -1.528094, -2.043397, 1, 0.6705883, 0, 1,
-1.181811, -1.764181, -1.104533, 1, 0.6784314, 0, 1,
-1.180766, -1.035588, -1.675285, 1, 0.682353, 0, 1,
-1.163279, 0.5379236, -2.063865, 1, 0.6901961, 0, 1,
-1.162365, -0.5638705, -3.20584, 1, 0.6941177, 0, 1,
-1.160824, -0.7112679, -4.159819, 1, 0.7019608, 0, 1,
-1.158474, 1.578637, -1.448401, 1, 0.7098039, 0, 1,
-1.153279, -0.128238, -1.17752, 1, 0.7137255, 0, 1,
-1.1523, 0.2455734, -0.4836521, 1, 0.7215686, 0, 1,
-1.14868, 0.425274, -1.442116, 1, 0.7254902, 0, 1,
-1.148207, 0.06149282, -1.939117, 1, 0.7333333, 0, 1,
-1.14785, 0.9915679, -0.9427577, 1, 0.7372549, 0, 1,
-1.147727, -0.1163938, -2.498533, 1, 0.7450981, 0, 1,
-1.142974, -0.8217544, -2.892396, 1, 0.7490196, 0, 1,
-1.140767, -0.2387457, -0.4114481, 1, 0.7568628, 0, 1,
-1.136042, -0.5244398, -3.512587, 1, 0.7607843, 0, 1,
-1.13567, 1.180424, -1.345016, 1, 0.7686275, 0, 1,
-1.126934, 0.9112428, -0.1698957, 1, 0.772549, 0, 1,
-1.121744, -0.4799564, -1.887424, 1, 0.7803922, 0, 1,
-1.118473, 0.3120261, -1.73745, 1, 0.7843137, 0, 1,
-1.116244, 1.794317, 0.9219689, 1, 0.7921569, 0, 1,
-1.108808, -0.9704535, -2.531599, 1, 0.7960784, 0, 1,
-1.104139, -0.4847652, -1.01289, 1, 0.8039216, 0, 1,
-1.099064, 0.4650407, 0.3908977, 1, 0.8117647, 0, 1,
-1.098459, -0.4293426, -2.307786, 1, 0.8156863, 0, 1,
-1.092294, 0.7433619, -0.5733953, 1, 0.8235294, 0, 1,
-1.089888, -0.3328559, -3.067281, 1, 0.827451, 0, 1,
-1.08725, 0.4719699, -0.5722694, 1, 0.8352941, 0, 1,
-1.081958, -0.3509032, -1.657055, 1, 0.8392157, 0, 1,
-1.077467, -1.014502, -1.366982, 1, 0.8470588, 0, 1,
-1.073283, 0.1189193, -1.787025, 1, 0.8509804, 0, 1,
-1.061663, -0.7612713, -4.204901, 1, 0.8588235, 0, 1,
-1.059715, -0.3034855, -2.1846, 1, 0.8627451, 0, 1,
-1.05655, -0.1945059, -2.321457, 1, 0.8705882, 0, 1,
-1.056181, -0.1917302, -1.583941, 1, 0.8745098, 0, 1,
-1.049213, -0.3050342, 0.5851767, 1, 0.8823529, 0, 1,
-1.048605, -0.007980485, -1.030373, 1, 0.8862745, 0, 1,
-1.045126, 1.044441, 0.08376805, 1, 0.8941177, 0, 1,
-1.03503, 0.05729502, -0.6069926, 1, 0.8980392, 0, 1,
-1.034266, 0.1913651, -0.6765761, 1, 0.9058824, 0, 1,
-1.03282, -0.626318, -1.803522, 1, 0.9137255, 0, 1,
-1.03256, 1.053926, -0.7225302, 1, 0.9176471, 0, 1,
-1.031191, -0.3795822, -0.3812956, 1, 0.9254902, 0, 1,
-1.025333, 1.253909, -0.1479732, 1, 0.9294118, 0, 1,
-1.024276, -0.1540045, -1.445033, 1, 0.9372549, 0, 1,
-1.023235, 1.027649, -1.91445, 1, 0.9411765, 0, 1,
-1.015403, 0.3638985, -0.4883887, 1, 0.9490196, 0, 1,
-1.007579, -0.4017086, -3.090261, 1, 0.9529412, 0, 1,
-1.003715, 0.1251566, -2.028715, 1, 0.9607843, 0, 1,
-1.003299, 0.1675818, -2.191559, 1, 0.9647059, 0, 1,
-0.9830067, 0.2532652, -1.29633, 1, 0.972549, 0, 1,
-0.9811427, -0.6981295, -0.8845838, 1, 0.9764706, 0, 1,
-0.9798373, -0.529286, -2.300549, 1, 0.9843137, 0, 1,
-0.9755483, -0.6617974, -2.114627, 1, 0.9882353, 0, 1,
-0.9742182, 0.8831026, -1.25582, 1, 0.9960784, 0, 1,
-0.9648249, 1.125851, -1.401949, 0.9960784, 1, 0, 1,
-0.962682, -0.2923415, -2.353174, 0.9921569, 1, 0, 1,
-0.9571788, 1.537762, -2.204444, 0.9843137, 1, 0, 1,
-0.9559714, -1.001025, -0.5313899, 0.9803922, 1, 0, 1,
-0.9556469, 0.5096524, -1.652422, 0.972549, 1, 0, 1,
-0.951732, 2.639692, -0.9101664, 0.9686275, 1, 0, 1,
-0.950254, -0.9373184, -3.066578, 0.9607843, 1, 0, 1,
-0.9480406, -0.1151608, -3.436519, 0.9568627, 1, 0, 1,
-0.945385, -1.092752, -5.09234, 0.9490196, 1, 0, 1,
-0.94213, 2.143352, -0.9101866, 0.945098, 1, 0, 1,
-0.9418034, -0.4826908, -1.440052, 0.9372549, 1, 0, 1,
-0.9402235, 0.7093842, -1.26318, 0.9333333, 1, 0, 1,
-0.9379224, 0.5550183, 0.5720856, 0.9254902, 1, 0, 1,
-0.9359085, 0.7317386, 0.1359928, 0.9215686, 1, 0, 1,
-0.9334148, 1.173585, -0.9376944, 0.9137255, 1, 0, 1,
-0.9322504, -1.312452, -2.415862, 0.9098039, 1, 0, 1,
-0.9288039, 0.1418292, -0.3565795, 0.9019608, 1, 0, 1,
-0.9181213, 0.1436528, -0.9298579, 0.8941177, 1, 0, 1,
-0.9169254, -2.23262, -4.067046, 0.8901961, 1, 0, 1,
-0.9138337, -0.530111, -3.606931, 0.8823529, 1, 0, 1,
-0.9113217, 0.03691332, -1.539891, 0.8784314, 1, 0, 1,
-0.9102831, 0.6082189, -2.159659, 0.8705882, 1, 0, 1,
-0.9076034, -1.49206, -2.469328, 0.8666667, 1, 0, 1,
-0.8956897, -0.3856916, -0.6535053, 0.8588235, 1, 0, 1,
-0.8890612, -0.95023, -3.212538, 0.854902, 1, 0, 1,
-0.8868005, 0.3320722, -1.3134, 0.8470588, 1, 0, 1,
-0.883064, 0.1324199, -1.399622, 0.8431373, 1, 0, 1,
-0.8810458, 1.749999, -0.7899168, 0.8352941, 1, 0, 1,
-0.8808666, 0.00378834, -0.7640104, 0.8313726, 1, 0, 1,
-0.8798779, 0.1405823, -0.6320999, 0.8235294, 1, 0, 1,
-0.8736268, -0.9396467, -1.650878, 0.8196079, 1, 0, 1,
-0.873187, -0.1883549, -2.568972, 0.8117647, 1, 0, 1,
-0.8676225, 1.019397, -1.622322, 0.8078431, 1, 0, 1,
-0.8673222, -0.8540137, -0.9514992, 0.8, 1, 0, 1,
-0.8647634, 1.237879, -2.938586, 0.7921569, 1, 0, 1,
-0.864592, -1.224153, -2.555852, 0.7882353, 1, 0, 1,
-0.8641977, 1.730094, -0.7822587, 0.7803922, 1, 0, 1,
-0.8558915, -0.187646, -2.737902, 0.7764706, 1, 0, 1,
-0.8519242, 1.025004, 0.3623433, 0.7686275, 1, 0, 1,
-0.8455965, -0.78682, -0.4075058, 0.7647059, 1, 0, 1,
-0.8436517, -1.580809, -2.631596, 0.7568628, 1, 0, 1,
-0.8423943, -1.679855, -0.4255951, 0.7529412, 1, 0, 1,
-0.8362792, 1.781673, 0.1593342, 0.7450981, 1, 0, 1,
-0.8345404, 0.02465902, -0.2500113, 0.7411765, 1, 0, 1,
-0.8345364, 1.804955, 0.3532366, 0.7333333, 1, 0, 1,
-0.8261371, -1.033143, -3.430061, 0.7294118, 1, 0, 1,
-0.825896, 1.345403, -1.919753, 0.7215686, 1, 0, 1,
-0.8198491, -0.1993058, -2.094123, 0.7176471, 1, 0, 1,
-0.8151603, 0.2009011, -1.443862, 0.7098039, 1, 0, 1,
-0.8105999, -0.0265592, -2.059108, 0.7058824, 1, 0, 1,
-0.8102365, 0.08167502, -2.849132, 0.6980392, 1, 0, 1,
-0.797453, 2.318377, 0.5171117, 0.6901961, 1, 0, 1,
-0.7968993, -1.039594, -1.788299, 0.6862745, 1, 0, 1,
-0.7933909, -1.795743, -1.991138, 0.6784314, 1, 0, 1,
-0.7922292, 2.190835, -0.06160141, 0.6745098, 1, 0, 1,
-0.7849907, -0.1980987, -1.759064, 0.6666667, 1, 0, 1,
-0.781072, -0.01550019, -2.660942, 0.6627451, 1, 0, 1,
-0.777863, -1.29411, -3.593117, 0.654902, 1, 0, 1,
-0.7768228, -1.425911, -3.217731, 0.6509804, 1, 0, 1,
-0.7694579, -0.03381415, -1.96419, 0.6431373, 1, 0, 1,
-0.7676812, -0.5386345, -2.166978, 0.6392157, 1, 0, 1,
-0.7538031, 1.406475, -1.878475, 0.6313726, 1, 0, 1,
-0.7522591, 0.4772473, -1.12278, 0.627451, 1, 0, 1,
-0.7520123, -0.5269435, -0.1405302, 0.6196079, 1, 0, 1,
-0.7360121, -0.1187711, -1.938414, 0.6156863, 1, 0, 1,
-0.7276448, -0.4013898, 0.06420814, 0.6078432, 1, 0, 1,
-0.7251354, 0.1753436, -2.282742, 0.6039216, 1, 0, 1,
-0.7228643, 0.2229445, -1.759161, 0.5960785, 1, 0, 1,
-0.7223179, 0.9049972, 0.2569612, 0.5882353, 1, 0, 1,
-0.7208788, 1.204117, 0.5053666, 0.5843138, 1, 0, 1,
-0.7142708, -0.008672101, -0.9817277, 0.5764706, 1, 0, 1,
-0.7142584, -1.434925, -4.61621, 0.572549, 1, 0, 1,
-0.709005, 0.5467519, -0.5423358, 0.5647059, 1, 0, 1,
-0.7035828, -1.131779, -0.4342475, 0.5607843, 1, 0, 1,
-0.6982892, -0.3273694, -1.418682, 0.5529412, 1, 0, 1,
-0.6948472, 1.926232, -1.311927, 0.5490196, 1, 0, 1,
-0.693872, 1.96434, 0.3265553, 0.5411765, 1, 0, 1,
-0.6932291, -0.449122, -1.939909, 0.5372549, 1, 0, 1,
-0.6925035, 1.485479, -1.535049, 0.5294118, 1, 0, 1,
-0.6908376, -0.5947214, -3.286988, 0.5254902, 1, 0, 1,
-0.6837074, -1.170227, -1.00531, 0.5176471, 1, 0, 1,
-0.68128, 0.9753088, -1.049485, 0.5137255, 1, 0, 1,
-0.6774017, 0.3681235, -0.5603396, 0.5058824, 1, 0, 1,
-0.6713699, -0.2788278, -2.339491, 0.5019608, 1, 0, 1,
-0.6707653, 0.8867889, -1.579548, 0.4941176, 1, 0, 1,
-0.6673751, -0.9360911, -1.405442, 0.4862745, 1, 0, 1,
-0.6661533, 0.09263479, 0.3462403, 0.4823529, 1, 0, 1,
-0.6494608, -0.371733, -3.992179, 0.4745098, 1, 0, 1,
-0.6492181, -0.4138328, -2.05763, 0.4705882, 1, 0, 1,
-0.6447767, 0.5874286, -0.7002446, 0.4627451, 1, 0, 1,
-0.6445404, 0.181511, -2.264994, 0.4588235, 1, 0, 1,
-0.6443392, 1.257916, 1.042623, 0.4509804, 1, 0, 1,
-0.6383857, 0.317199, -1.453627, 0.4470588, 1, 0, 1,
-0.6264974, 0.9634829, -0.3181628, 0.4392157, 1, 0, 1,
-0.6258697, -0.1039061, -0.4318672, 0.4352941, 1, 0, 1,
-0.6245866, -0.1428428, -1.266038, 0.427451, 1, 0, 1,
-0.6218364, -1.117872, -2.068968, 0.4235294, 1, 0, 1,
-0.6209425, 1.724346, -0.3989956, 0.4156863, 1, 0, 1,
-0.6157251, 1.338698, -1.301771, 0.4117647, 1, 0, 1,
-0.6091398, 0.6159951, -3.70268, 0.4039216, 1, 0, 1,
-0.6080693, 1.635121, -0.6332833, 0.3960784, 1, 0, 1,
-0.6070219, 0.4228633, 0.5242751, 0.3921569, 1, 0, 1,
-0.6054134, -0.6049606, -1.832131, 0.3843137, 1, 0, 1,
-0.6051271, -0.04622912, -1.049063, 0.3803922, 1, 0, 1,
-0.6025478, -1.593494, -2.346866, 0.372549, 1, 0, 1,
-0.602104, 0.6847928, -0.5503772, 0.3686275, 1, 0, 1,
-0.6013821, 0.1328352, -0.539723, 0.3607843, 1, 0, 1,
-0.5950084, -0.4139506, -2.977944, 0.3568628, 1, 0, 1,
-0.5944771, -1.33801, -3.469829, 0.3490196, 1, 0, 1,
-0.5921256, 1.235097, -0.5716843, 0.345098, 1, 0, 1,
-0.5888407, 0.8688468, -0.3830772, 0.3372549, 1, 0, 1,
-0.5808676, 1.075557, 0.196788, 0.3333333, 1, 0, 1,
-0.5741501, 0.9029517, -2.07261, 0.3254902, 1, 0, 1,
-0.5725077, 0.0540406, -2.313376, 0.3215686, 1, 0, 1,
-0.5641055, -0.7000967, -1.812047, 0.3137255, 1, 0, 1,
-0.5621973, -0.4673131, -3.056828, 0.3098039, 1, 0, 1,
-0.5554242, -0.1965447, -1.499859, 0.3019608, 1, 0, 1,
-0.5410829, 0.1462692, -0.24544, 0.2941177, 1, 0, 1,
-0.5404441, -0.6469968, -2.31753, 0.2901961, 1, 0, 1,
-0.5396059, -1.513525, -1.431281, 0.282353, 1, 0, 1,
-0.5316636, -0.04247329, -0.5421726, 0.2784314, 1, 0, 1,
-0.5170848, -0.1515603, -2.175769, 0.2705882, 1, 0, 1,
-0.5164134, -0.1711041, -1.681893, 0.2666667, 1, 0, 1,
-0.5161585, -0.7077935, -3.191674, 0.2588235, 1, 0, 1,
-0.5099758, 0.6165401, 0.6982639, 0.254902, 1, 0, 1,
-0.5054397, -1.754546, -2.380943, 0.2470588, 1, 0, 1,
-0.5022504, -0.7992891, -2.346103, 0.2431373, 1, 0, 1,
-0.5019359, -1.849314, -1.723966, 0.2352941, 1, 0, 1,
-0.4901221, -1.7729, -3.331629, 0.2313726, 1, 0, 1,
-0.4774646, -0.207826, -2.209855, 0.2235294, 1, 0, 1,
-0.4763539, -0.07887522, -2.160478, 0.2196078, 1, 0, 1,
-0.4758234, -1.496207, -2.962446, 0.2117647, 1, 0, 1,
-0.4743553, 1.272494, -1.645429, 0.2078431, 1, 0, 1,
-0.4713421, 0.2381271, -1.516806, 0.2, 1, 0, 1,
-0.4705606, 0.1627603, -2.949213, 0.1921569, 1, 0, 1,
-0.4647524, -0.1616331, -1.985294, 0.1882353, 1, 0, 1,
-0.4607352, 0.7475035, 0.6878668, 0.1803922, 1, 0, 1,
-0.4595371, 0.6921671, -0.9650137, 0.1764706, 1, 0, 1,
-0.4564926, 0.2261522, -1.683583, 0.1686275, 1, 0, 1,
-0.4524115, 0.2882734, 0.04747075, 0.1647059, 1, 0, 1,
-0.4489813, 0.04396839, -2.267293, 0.1568628, 1, 0, 1,
-0.444859, -1.314877, -2.011203, 0.1529412, 1, 0, 1,
-0.4399797, 0.09765469, -2.456752, 0.145098, 1, 0, 1,
-0.4386983, 0.5472596, -0.4512928, 0.1411765, 1, 0, 1,
-0.4383038, 1.244044, 0.05850681, 0.1333333, 1, 0, 1,
-0.4360447, -0.9301475, -2.498379, 0.1294118, 1, 0, 1,
-0.4354618, -0.2503899, -2.508815, 0.1215686, 1, 0, 1,
-0.4338185, 0.6812971, -1.053959, 0.1176471, 1, 0, 1,
-0.4337634, 0.05225145, -2.895862, 0.1098039, 1, 0, 1,
-0.4289832, 1.175979, -0.6565242, 0.1058824, 1, 0, 1,
-0.4257962, -0.5889586, -3.739664, 0.09803922, 1, 0, 1,
-0.4240639, -1.310692, -0.8211298, 0.09019608, 1, 0, 1,
-0.4231054, 1.155833, 0.7810751, 0.08627451, 1, 0, 1,
-0.4201496, -1.243008, -4.119204, 0.07843138, 1, 0, 1,
-0.4172635, 0.3546814, -0.3818975, 0.07450981, 1, 0, 1,
-0.41697, -1.043914, -3.17915, 0.06666667, 1, 0, 1,
-0.416274, -0.316252, -0.7959642, 0.0627451, 1, 0, 1,
-0.4124513, -0.6467993, -2.511165, 0.05490196, 1, 0, 1,
-0.4118128, 3.229007, 0.434553, 0.05098039, 1, 0, 1,
-0.4069348, -0.2746818, -0.7784641, 0.04313726, 1, 0, 1,
-0.4026937, 0.1519692, -0.5953987, 0.03921569, 1, 0, 1,
-0.3999256, 0.5991742, -0.1052156, 0.03137255, 1, 0, 1,
-0.3994786, 0.7422368, -1.534441, 0.02745098, 1, 0, 1,
-0.3981501, 0.0835685, -1.366906, 0.01960784, 1, 0, 1,
-0.3973285, 1.705329, -0.9310555, 0.01568628, 1, 0, 1,
-0.3961476, 1.113317, 0.6480065, 0.007843138, 1, 0, 1,
-0.3910217, 0.5250954, -2.286665, 0.003921569, 1, 0, 1,
-0.3889087, -0.03546451, -1.230249, 0, 1, 0.003921569, 1,
-0.3849454, -0.08856258, -3.794893, 0, 1, 0.01176471, 1,
-0.3834612, -0.01989846, -3.744446, 0, 1, 0.01568628, 1,
-0.3821413, 0.3450142, 0.1582394, 0, 1, 0.02352941, 1,
-0.3784049, 1.910673, 0.08834454, 0, 1, 0.02745098, 1,
-0.3782702, 0.9563861, -2.149977, 0, 1, 0.03529412, 1,
-0.3760177, 0.1930925, -3.005177, 0, 1, 0.03921569, 1,
-0.3710767, -0.1387709, -0.2325335, 0, 1, 0.04705882, 1,
-0.367915, -0.8228987, -4.002215, 0, 1, 0.05098039, 1,
-0.3636242, -2.714603, -2.692239, 0, 1, 0.05882353, 1,
-0.3602202, 0.1220266, -0.502784, 0, 1, 0.0627451, 1,
-0.3599435, -0.6693693, -4.417279, 0, 1, 0.07058824, 1,
-0.3572908, -1.263996, -2.377498, 0, 1, 0.07450981, 1,
-0.3524601, 0.3512202, 0.08731356, 0, 1, 0.08235294, 1,
-0.3508909, -2.482833, -3.41036, 0, 1, 0.08627451, 1,
-0.3482054, -0.7932127, -3.016666, 0, 1, 0.09411765, 1,
-0.3481407, -0.4399606, -3.713585, 0, 1, 0.1019608, 1,
-0.3455665, 1.454492, -0.05824314, 0, 1, 0.1058824, 1,
-0.34494, -0.7255414, -3.542407, 0, 1, 0.1137255, 1,
-0.3396975, 0.3097115, -2.515603, 0, 1, 0.1176471, 1,
-0.3344734, 1.603516, -0.1821265, 0, 1, 0.1254902, 1,
-0.3344102, -0.3475918, -2.26597, 0, 1, 0.1294118, 1,
-0.3339989, -0.08641493, -1.732006, 0, 1, 0.1372549, 1,
-0.3294249, -0.04965859, -1.840927, 0, 1, 0.1411765, 1,
-0.3287393, -1.344953, -3.044982, 0, 1, 0.1490196, 1,
-0.3276256, 0.1720615, 0.1104245, 0, 1, 0.1529412, 1,
-0.3272279, -0.2529596, -2.955325, 0, 1, 0.1607843, 1,
-0.3241313, 1.276159, 0.07255147, 0, 1, 0.1647059, 1,
-0.3231821, 0.7922254, -1.205466, 0, 1, 0.172549, 1,
-0.3216711, 1.733873, -0.228293, 0, 1, 0.1764706, 1,
-0.3215739, -0.7042746, -2.886974, 0, 1, 0.1843137, 1,
-0.3212565, -0.01957996, -2.640564, 0, 1, 0.1882353, 1,
-0.3106372, 0.4964351, -2.388016, 0, 1, 0.1960784, 1,
-0.3095378, -0.1796021, -3.186332, 0, 1, 0.2039216, 1,
-0.3086808, 0.2996777, -1.966834, 0, 1, 0.2078431, 1,
-0.3077891, 0.004294598, -1.906347, 0, 1, 0.2156863, 1,
-0.3069796, -0.2292677, -0.2452379, 0, 1, 0.2196078, 1,
-0.3062513, 1.271829, -1.302928, 0, 1, 0.227451, 1,
-0.3005296, -1.2789, -4.271626, 0, 1, 0.2313726, 1,
-0.293482, -0.4403869, -2.305708, 0, 1, 0.2392157, 1,
-0.2923301, 0.03605142, -0.6272081, 0, 1, 0.2431373, 1,
-0.2860168, -2.30664, -3.428568, 0, 1, 0.2509804, 1,
-0.2850753, 2.327341, 0.6296899, 0, 1, 0.254902, 1,
-0.2832036, 0.3308087, -1.645415, 0, 1, 0.2627451, 1,
-0.2745862, 0.9356822, 0.5603452, 0, 1, 0.2666667, 1,
-0.2733918, 0.4514248, -0.4101732, 0, 1, 0.2745098, 1,
-0.2665575, 1.114919, 0.5759319, 0, 1, 0.2784314, 1,
-0.2555368, 1.662377, -1.614113, 0, 1, 0.2862745, 1,
-0.252624, -0.9320323, -1.549708, 0, 1, 0.2901961, 1,
-0.2525975, 0.04875427, -1.209543, 0, 1, 0.2980392, 1,
-0.2497809, -0.08776419, -2.589402, 0, 1, 0.3058824, 1,
-0.2481504, -1.527503, -4.380232, 0, 1, 0.3098039, 1,
-0.2471994, 0.790082, -0.42998, 0, 1, 0.3176471, 1,
-0.2471462, -2.415817, -3.99903, 0, 1, 0.3215686, 1,
-0.246516, -0.8608133, -4.32721, 0, 1, 0.3294118, 1,
-0.244462, 1.135375, 2.001994, 0, 1, 0.3333333, 1,
-0.2436495, -0.0514079, -0.9791057, 0, 1, 0.3411765, 1,
-0.2425841, -1.26294, -3.274144, 0, 1, 0.345098, 1,
-0.2416719, -0.6188963, -2.806745, 0, 1, 0.3529412, 1,
-0.2390204, 0.3187729, -1.972349, 0, 1, 0.3568628, 1,
-0.2389075, -1.327345, -2.777321, 0, 1, 0.3647059, 1,
-0.237802, -0.8187964, -3.666667, 0, 1, 0.3686275, 1,
-0.2366506, 0.1265999, -0.1947752, 0, 1, 0.3764706, 1,
-0.2325348, -0.7487141, -1.138144, 0, 1, 0.3803922, 1,
-0.2297589, -0.1571581, -3.788337, 0, 1, 0.3882353, 1,
-0.2290508, 1.127092, -0.2556756, 0, 1, 0.3921569, 1,
-0.2286787, -0.8335282, -3.460734, 0, 1, 0.4, 1,
-0.2265101, 0.106584, -1.165992, 0, 1, 0.4078431, 1,
-0.2177769, 0.4794023, 0.5080559, 0, 1, 0.4117647, 1,
-0.214261, 0.9759669, -0.4611757, 0, 1, 0.4196078, 1,
-0.2079985, 0.4861287, -0.05604786, 0, 1, 0.4235294, 1,
-0.2021009, -0.1496796, -2.128936, 0, 1, 0.4313726, 1,
-0.1993969, -1.082877, -2.39604, 0, 1, 0.4352941, 1,
-0.1987361, -0.08887832, -3.182874, 0, 1, 0.4431373, 1,
-0.1938233, 0.986605, -0.4997435, 0, 1, 0.4470588, 1,
-0.1922527, 1.085156, -0.2278524, 0, 1, 0.454902, 1,
-0.1863367, 2.318312, 0.227535, 0, 1, 0.4588235, 1,
-0.185455, -0.742838, -3.075366, 0, 1, 0.4666667, 1,
-0.1843905, 0.177153, -1.723813, 0, 1, 0.4705882, 1,
-0.1836636, -0.0593918, -2.863328, 0, 1, 0.4784314, 1,
-0.1726113, 1.472404, -1.163655, 0, 1, 0.4823529, 1,
-0.1717122, 2.025568, -1.380234, 0, 1, 0.4901961, 1,
-0.1684227, -0.5258696, -3.779078, 0, 1, 0.4941176, 1,
-0.1678264, -0.3307608, -2.252192, 0, 1, 0.5019608, 1,
-0.1669783, 0.6694452, -2.199492, 0, 1, 0.509804, 1,
-0.165906, -0.8525079, -2.438331, 0, 1, 0.5137255, 1,
-0.1658691, -0.1957909, -2.739495, 0, 1, 0.5215687, 1,
-0.1655505, -1.030699, -4.29071, 0, 1, 0.5254902, 1,
-0.1623764, 0.4644303, -0.5418196, 0, 1, 0.5333334, 1,
-0.1599039, -0.1743316, -3.857308, 0, 1, 0.5372549, 1,
-0.1593288, -1.206104, -4.064916, 0, 1, 0.5450981, 1,
-0.156424, 1.054106, -1.916614, 0, 1, 0.5490196, 1,
-0.1561554, 1.967536, -0.9075497, 0, 1, 0.5568628, 1,
-0.1561415, 1.945946, -1.137544, 0, 1, 0.5607843, 1,
-0.1509504, -0.2754013, -2.034487, 0, 1, 0.5686275, 1,
-0.1487655, 0.04150922, -2.370022, 0, 1, 0.572549, 1,
-0.1472964, 0.2841879, 0.0988048, 0, 1, 0.5803922, 1,
-0.1452277, -0.7821116, -2.768642, 0, 1, 0.5843138, 1,
-0.1417822, -0.7779732, -3.91102, 0, 1, 0.5921569, 1,
-0.1408461, 0.1845073, -1.512782, 0, 1, 0.5960785, 1,
-0.1402324, -0.7828624, -2.876669, 0, 1, 0.6039216, 1,
-0.1365693, 0.1113981, -1.007231, 0, 1, 0.6117647, 1,
-0.1356946, -0.944814, -2.247354, 0, 1, 0.6156863, 1,
-0.1355196, 0.07661776, 0.6203316, 0, 1, 0.6235294, 1,
-0.1352613, -2.016973, -4.012757, 0, 1, 0.627451, 1,
-0.1347697, 0.8188989, -1.660631, 0, 1, 0.6352941, 1,
-0.132858, -0.1181121, -2.901585, 0, 1, 0.6392157, 1,
-0.1288683, -0.04370683, 0.1025379, 0, 1, 0.6470588, 1,
-0.1279044, -0.1913439, -2.08596, 0, 1, 0.6509804, 1,
-0.1273628, -0.7407275, -3.9695, 0, 1, 0.6588235, 1,
-0.1222677, -1.071634, -0.851003, 0, 1, 0.6627451, 1,
-0.1213981, -0.1835742, -2.26746, 0, 1, 0.6705883, 1,
-0.1209961, -0.5093157, -1.740781, 0, 1, 0.6745098, 1,
-0.11688, 1.047739, 0.06076115, 0, 1, 0.682353, 1,
-0.1161773, 0.2979278, -0.7055001, 0, 1, 0.6862745, 1,
-0.1153041, -1.468848, -4.770184, 0, 1, 0.6941177, 1,
-0.1121356, -0.7045774, -3.66987, 0, 1, 0.7019608, 1,
-0.1119139, -1.529041, -2.55843, 0, 1, 0.7058824, 1,
-0.111206, -0.5241078, -2.213103, 0, 1, 0.7137255, 1,
-0.1085303, -0.6558119, -3.330786, 0, 1, 0.7176471, 1,
-0.101077, 1.341071, -0.7660789, 0, 1, 0.7254902, 1,
-0.1002919, -0.2009724, -4.525319, 0, 1, 0.7294118, 1,
-0.09620717, 0.8147778, -1.439308, 0, 1, 0.7372549, 1,
-0.09583839, 2.272936, 0.1253437, 0, 1, 0.7411765, 1,
-0.09318706, -0.03827784, -1.023763, 0, 1, 0.7490196, 1,
-0.08695335, 0.792036, -0.562694, 0, 1, 0.7529412, 1,
-0.08690793, -0.2905881, -2.685493, 0, 1, 0.7607843, 1,
-0.08649612, -0.1598691, -1.851839, 0, 1, 0.7647059, 1,
-0.08067553, -1.599238, -3.52177, 0, 1, 0.772549, 1,
-0.07324873, -0.3607569, -2.339423, 0, 1, 0.7764706, 1,
-0.06591278, -0.7179121, -3.687994, 0, 1, 0.7843137, 1,
-0.06524201, -0.6138082, -3.681739, 0, 1, 0.7882353, 1,
-0.06380413, -0.002441134, -1.542193, 0, 1, 0.7960784, 1,
-0.05498011, -0.4482608, -4.038472, 0, 1, 0.8039216, 1,
-0.05180689, 0.05126145, -3.801455, 0, 1, 0.8078431, 1,
-0.05038235, 1.632555, 0.07977194, 0, 1, 0.8156863, 1,
-0.04906595, -0.076352, -3.949186, 0, 1, 0.8196079, 1,
-0.04813384, 0.1517129, -0.3465099, 0, 1, 0.827451, 1,
-0.04500931, -0.3106097, -4.011703, 0, 1, 0.8313726, 1,
-0.04220772, 0.6095536, 1.106465, 0, 1, 0.8392157, 1,
-0.04123695, 0.8065286, 1.280161, 0, 1, 0.8431373, 1,
-0.04091179, -1.508963, -2.241374, 0, 1, 0.8509804, 1,
-0.03889274, -0.9689954, -4.424292, 0, 1, 0.854902, 1,
-0.03820141, 2.130876, 0.9554358, 0, 1, 0.8627451, 1,
-0.03787424, 0.0649436, 1.120629, 0, 1, 0.8666667, 1,
-0.03613537, -0.06026133, -2.449069, 0, 1, 0.8745098, 1,
-0.03317596, 0.2103557, -1.345889, 0, 1, 0.8784314, 1,
-0.03282202, 0.29403, 0.5005744, 0, 1, 0.8862745, 1,
-0.03197607, 0.6117845, 1.053638, 0, 1, 0.8901961, 1,
-0.02889129, 2.166362, -0.8296463, 0, 1, 0.8980392, 1,
-0.02820861, 1.05248, 0.08199944, 0, 1, 0.9058824, 1,
-0.02393077, -0.3960401, -2.221006, 0, 1, 0.9098039, 1,
-0.02372269, -0.3790838, -3.10721, 0, 1, 0.9176471, 1,
-0.02367292, -0.6964173, -3.500836, 0, 1, 0.9215686, 1,
-0.02322922, 1.362442, -0.1808102, 0, 1, 0.9294118, 1,
-0.02274528, 0.7591205, -0.2304309, 0, 1, 0.9333333, 1,
-0.02169706, -0.5724469, -2.941573, 0, 1, 0.9411765, 1,
-0.02158141, -0.2820492, -3.190097, 0, 1, 0.945098, 1,
-0.01364105, 0.04777832, 0.6277519, 0, 1, 0.9529412, 1,
-0.007833378, 1.67871, 0.4795038, 0, 1, 0.9568627, 1,
-0.007434095, 0.377027, -1.462524, 0, 1, 0.9647059, 1,
-0.006040145, 0.2291837, 1.288589, 0, 1, 0.9686275, 1,
-7.741912e-06, 0.2139057, -0.6010609, 0, 1, 0.9764706, 1,
0.01137793, -0.9374673, 3.37161, 0, 1, 0.9803922, 1,
0.01184786, -0.5799143, 2.911755, 0, 1, 0.9882353, 1,
0.01585509, 0.861964, -1.135244, 0, 1, 0.9921569, 1,
0.01789476, 1.664454, 0.9964502, 0, 1, 1, 1,
0.02666068, 0.6945958, 1.984045, 0, 0.9921569, 1, 1,
0.02707156, -0.08973494, 2.453149, 0, 0.9882353, 1, 1,
0.02955103, -0.001088741, 1.080592, 0, 0.9803922, 1, 1,
0.03810043, -1.234722, 1.316506, 0, 0.9764706, 1, 1,
0.03888002, 1.212148, 0.5560349, 0, 0.9686275, 1, 1,
0.04814025, 1.338348, -1.405446, 0, 0.9647059, 1, 1,
0.04852286, 0.8565797, -1.568615, 0, 0.9568627, 1, 1,
0.04857434, -0.4231379, 3.925556, 0, 0.9529412, 1, 1,
0.04910516, -1.084902, 2.525164, 0, 0.945098, 1, 1,
0.05116136, 0.5018808, -0.07467517, 0, 0.9411765, 1, 1,
0.05316501, 2.202997, 0.9757738, 0, 0.9333333, 1, 1,
0.05343738, -1.545727, 1.946768, 0, 0.9294118, 1, 1,
0.05533431, 1.080859, 0.17228, 0, 0.9215686, 1, 1,
0.06382295, 0.6819334, 1.061579, 0, 0.9176471, 1, 1,
0.06643329, 1.151296, -0.07687596, 0, 0.9098039, 1, 1,
0.06943136, 0.8771783, 0.841877, 0, 0.9058824, 1, 1,
0.07122868, 1.06695, -0.9404014, 0, 0.8980392, 1, 1,
0.07123506, -0.6535084, 2.618622, 0, 0.8901961, 1, 1,
0.07202006, -2.491602, 2.962057, 0, 0.8862745, 1, 1,
0.07732083, -0.007940701, 1.010445, 0, 0.8784314, 1, 1,
0.09077103, -1.027852, 4.770339, 0, 0.8745098, 1, 1,
0.09265716, -0.3985432, 4.179222, 0, 0.8666667, 1, 1,
0.09390387, 1.633101, 1.421597, 0, 0.8627451, 1, 1,
0.09390502, 1.49114, -1.005822, 0, 0.854902, 1, 1,
0.09489739, 0.999616, 0.2018377, 0, 0.8509804, 1, 1,
0.0950465, 1.990795, 0.8824195, 0, 0.8431373, 1, 1,
0.09563345, 0.7895695, 1.087037, 0, 0.8392157, 1, 1,
0.09716965, -0.5248638, 2.823095, 0, 0.8313726, 1, 1,
0.09724642, 1.767217, 0.04294489, 0, 0.827451, 1, 1,
0.0988337, -2.846967, 3.206834, 0, 0.8196079, 1, 1,
0.1001472, -0.3862847, 4.238724, 0, 0.8156863, 1, 1,
0.1016253, 1.266479, 0.9021087, 0, 0.8078431, 1, 1,
0.1053163, 0.0443432, 1.181128, 0, 0.8039216, 1, 1,
0.1108534, 0.9183226, 0.3893444, 0, 0.7960784, 1, 1,
0.1193325, 0.5739769, 1.594783, 0, 0.7882353, 1, 1,
0.1239598, -0.2514293, 2.246845, 0, 0.7843137, 1, 1,
0.1271293, 2.683136, -0.322847, 0, 0.7764706, 1, 1,
0.130781, -0.2937626, 5.436184, 0, 0.772549, 1, 1,
0.1318745, -0.6040041, 2.041257, 0, 0.7647059, 1, 1,
0.1344016, 0.0909264, 0.6938108, 0, 0.7607843, 1, 1,
0.1348922, 0.278015, -1.465116, 0, 0.7529412, 1, 1,
0.1430089, 0.8741397, 0.1098245, 0, 0.7490196, 1, 1,
0.1448053, -0.9029812, 3.729546, 0, 0.7411765, 1, 1,
0.1459131, 1.996711, 1.385039, 0, 0.7372549, 1, 1,
0.146572, 1.45875, -0.5082752, 0, 0.7294118, 1, 1,
0.1504901, -0.3450705, 2.040658, 0, 0.7254902, 1, 1,
0.1524188, 1.695324, -0.1651556, 0, 0.7176471, 1, 1,
0.1585711, -1.7444, 3.317922, 0, 0.7137255, 1, 1,
0.1593082, -0.01656554, 2.203808, 0, 0.7058824, 1, 1,
0.1609311, -0.6058319, 3.106358, 0, 0.6980392, 1, 1,
0.161951, -0.8717691, 4.137743, 0, 0.6941177, 1, 1,
0.1626322, 1.451294, -0.1062355, 0, 0.6862745, 1, 1,
0.1665104, -0.222396, 1.804039, 0, 0.682353, 1, 1,
0.1675105, -1.01551, 2.355493, 0, 0.6745098, 1, 1,
0.1685584, 1.253208, -0.1221898, 0, 0.6705883, 1, 1,
0.1771596, 0.0308038, 1.491151, 0, 0.6627451, 1, 1,
0.1773656, -2.604573, 3.950675, 0, 0.6588235, 1, 1,
0.1783976, 0.1207352, 1.157682, 0, 0.6509804, 1, 1,
0.1846463, -1.174968, 3.570174, 0, 0.6470588, 1, 1,
0.186417, -0.3174437, 1.527679, 0, 0.6392157, 1, 1,
0.1879994, -0.5943898, 1.810708, 0, 0.6352941, 1, 1,
0.1909797, -1.105714, 4.05522, 0, 0.627451, 1, 1,
0.1939792, -0.7273623, 2.373626, 0, 0.6235294, 1, 1,
0.1951061, 1.580241, -0.7110183, 0, 0.6156863, 1, 1,
0.1958145, -0.7329705, 1.607981, 0, 0.6117647, 1, 1,
0.2018363, 0.5612943, 2.049986, 0, 0.6039216, 1, 1,
0.2027552, 0.2599734, -0.162965, 0, 0.5960785, 1, 1,
0.2046834, -0.463449, 2.017354, 0, 0.5921569, 1, 1,
0.2063536, 0.3422361, 1.281146, 0, 0.5843138, 1, 1,
0.2083146, 1.834196, 0.2795732, 0, 0.5803922, 1, 1,
0.2174463, 0.0126753, 0.03484098, 0, 0.572549, 1, 1,
0.2215241, 1.018656, 0.3048548, 0, 0.5686275, 1, 1,
0.2215316, -1.373586, 3.19802, 0, 0.5607843, 1, 1,
0.2249049, -0.2676758, 3.266334, 0, 0.5568628, 1, 1,
0.2266116, -1.884824, 3.325461, 0, 0.5490196, 1, 1,
0.2285029, 0.00916656, 1.159444, 0, 0.5450981, 1, 1,
0.229737, -1.654956, 4.903473, 0, 0.5372549, 1, 1,
0.2304641, 0.6863081, -0.2104481, 0, 0.5333334, 1, 1,
0.2314921, 0.4424208, -1.918135, 0, 0.5254902, 1, 1,
0.2339945, -0.9706151, 3.298505, 0, 0.5215687, 1, 1,
0.2350562, 0.5517981, 1.148459, 0, 0.5137255, 1, 1,
0.2405284, -0.04471035, 1.641932, 0, 0.509804, 1, 1,
0.243226, -1.592961, 1.437162, 0, 0.5019608, 1, 1,
0.2457308, -0.370531, 1.85125, 0, 0.4941176, 1, 1,
0.2458985, -0.2120806, 1.30331, 0, 0.4901961, 1, 1,
0.2473924, -1.049542, 2.533746, 0, 0.4823529, 1, 1,
0.2478363, -0.5786458, 2.569709, 0, 0.4784314, 1, 1,
0.2580079, 0.04628228, 1.740537, 0, 0.4705882, 1, 1,
0.2592551, 1.1281, 1.378026, 0, 0.4666667, 1, 1,
0.2594245, -1.447207, 0.3217413, 0, 0.4588235, 1, 1,
0.259723, 0.4210944, 1.457983, 0, 0.454902, 1, 1,
0.2617413, -1.167112, 3.572798, 0, 0.4470588, 1, 1,
0.2623199, 1.008888, 0.2922526, 0, 0.4431373, 1, 1,
0.2634621, -1.13253, 5.090729, 0, 0.4352941, 1, 1,
0.2657905, 1.136877, -1.865054, 0, 0.4313726, 1, 1,
0.2680153, -0.3188306, 1.896697, 0, 0.4235294, 1, 1,
0.2685059, 0.6080964, 0.9820846, 0, 0.4196078, 1, 1,
0.271003, 0.3087726, 1.219076, 0, 0.4117647, 1, 1,
0.2742072, -1.86358, 3.115785, 0, 0.4078431, 1, 1,
0.2770293, 1.760738, 0.05941777, 0, 0.4, 1, 1,
0.277908, -2.236531, 3.403272, 0, 0.3921569, 1, 1,
0.2808417, -3.163223, 3.041971, 0, 0.3882353, 1, 1,
0.2823953, 0.2021886, 1.303039, 0, 0.3803922, 1, 1,
0.2893964, -0.453471, 4.022985, 0, 0.3764706, 1, 1,
0.2951838, 0.7565132, 2.157766, 0, 0.3686275, 1, 1,
0.2972156, 0.956866, -2.340911, 0, 0.3647059, 1, 1,
0.2974943, -0.8776378, 2.289453, 0, 0.3568628, 1, 1,
0.3019229, 1.079704, -0.6821114, 0, 0.3529412, 1, 1,
0.3068488, -0.2920494, 2.158822, 0, 0.345098, 1, 1,
0.3084497, 0.3661095, -0.5816071, 0, 0.3411765, 1, 1,
0.3171347, 1.078309, 1.812509, 0, 0.3333333, 1, 1,
0.3197961, 0.3968223, 2.339806, 0, 0.3294118, 1, 1,
0.3357432, 0.5233887, -1.517028, 0, 0.3215686, 1, 1,
0.3386017, 1.658731, 0.5680881, 0, 0.3176471, 1, 1,
0.3386018, 1.240081, 0.9849918, 0, 0.3098039, 1, 1,
0.341545, -0.4190749, 3.56278, 0, 0.3058824, 1, 1,
0.3420028, -0.3666232, 3.882854, 0, 0.2980392, 1, 1,
0.3469203, 0.5031759, 0.2766505, 0, 0.2901961, 1, 1,
0.3482255, -1.381634, 3.841608, 0, 0.2862745, 1, 1,
0.3491422, 1.553296, -0.2682534, 0, 0.2784314, 1, 1,
0.3501937, 0.0738705, 1.592249, 0, 0.2745098, 1, 1,
0.3521243, 0.8954691, -0.5982606, 0, 0.2666667, 1, 1,
0.3594887, -0.43931, 2.994926, 0, 0.2627451, 1, 1,
0.3627409, 1.48581, -0.4847647, 0, 0.254902, 1, 1,
0.36411, 0.1629753, 4.064748, 0, 0.2509804, 1, 1,
0.364289, -0.0860838, 2.176841, 0, 0.2431373, 1, 1,
0.3676195, 0.1973518, 0.2850589, 0, 0.2392157, 1, 1,
0.3717083, -0.6548059, 2.632472, 0, 0.2313726, 1, 1,
0.3725109, 0.1767134, 1.796185, 0, 0.227451, 1, 1,
0.3752785, -0.8476616, 2.633815, 0, 0.2196078, 1, 1,
0.3786778, -0.1369122, 2.251712, 0, 0.2156863, 1, 1,
0.3801604, 0.9814899, 0.2686817, 0, 0.2078431, 1, 1,
0.3846967, -0.5108853, 1.091072, 0, 0.2039216, 1, 1,
0.3864133, -0.02375389, 1.097036, 0, 0.1960784, 1, 1,
0.3886608, -1.07897, 3.612494, 0, 0.1882353, 1, 1,
0.3906617, 0.1110909, 0.1353496, 0, 0.1843137, 1, 1,
0.3928148, 0.9437802, -0.3519409, 0, 0.1764706, 1, 1,
0.3944528, -0.6569738, 1.769859, 0, 0.172549, 1, 1,
0.3982067, 1.739386, -0.5096424, 0, 0.1647059, 1, 1,
0.399317, -0.6457403, 0.8052118, 0, 0.1607843, 1, 1,
0.4032696, 0.002986461, 1.183696, 0, 0.1529412, 1, 1,
0.4036222, -0.1103497, 0.8199138, 0, 0.1490196, 1, 1,
0.4050127, -0.4871301, 3.991076, 0, 0.1411765, 1, 1,
0.412023, 0.4013942, 0.3596205, 0, 0.1372549, 1, 1,
0.4128301, 2.45114, 0.6583156, 0, 0.1294118, 1, 1,
0.4144919, -0.3025183, 3.939058, 0, 0.1254902, 1, 1,
0.4153345, 0.2274521, 1.211275, 0, 0.1176471, 1, 1,
0.415728, 0.403387, 0.253855, 0, 0.1137255, 1, 1,
0.4172502, 2.124127, -0.08635166, 0, 0.1058824, 1, 1,
0.4174928, 0.4636925, 0.07806481, 0, 0.09803922, 1, 1,
0.4199478, 1.52176, -0.3044192, 0, 0.09411765, 1, 1,
0.4247733, 1.661352, -1.186527, 0, 0.08627451, 1, 1,
0.4257781, 0.8434828, 0.8447904, 0, 0.08235294, 1, 1,
0.4323649, 0.0645605, 2.496901, 0, 0.07450981, 1, 1,
0.4324979, -0.5851196, 1.886104, 0, 0.07058824, 1, 1,
0.4369366, -0.1061985, 1.459031, 0, 0.0627451, 1, 1,
0.4388961, -1.396849, 3.085526, 0, 0.05882353, 1, 1,
0.4403097, -0.8076463, 1.25896, 0, 0.05098039, 1, 1,
0.4465961, -2.158054, 3.34622, 0, 0.04705882, 1, 1,
0.4474658, 0.05520068, 0.5314307, 0, 0.03921569, 1, 1,
0.4522227, -0.7034473, 3.614273, 0, 0.03529412, 1, 1,
0.4543791, -0.6721782, 2.575553, 0, 0.02745098, 1, 1,
0.4567382, -0.02996109, 0.2244792, 0, 0.02352941, 1, 1,
0.4628593, 0.1834963, 1.875171, 0, 0.01568628, 1, 1,
0.464805, 0.0762137, 0.6053956, 0, 0.01176471, 1, 1,
0.4658714, -0.7763448, 2.344358, 0, 0.003921569, 1, 1,
0.4701338, -0.3563481, 2.38486, 0.003921569, 0, 1, 1,
0.4701574, -0.3985048, 2.147456, 0.007843138, 0, 1, 1,
0.4748962, 0.8675487, 2.033585, 0.01568628, 0, 1, 1,
0.4772747, -1.677544, 1.107731, 0.01960784, 0, 1, 1,
0.4794054, -0.1056032, 2.714648, 0.02745098, 0, 1, 1,
0.4829619, 0.6828186, 0.4068753, 0.03137255, 0, 1, 1,
0.4857814, -0.6681928, 2.485051, 0.03921569, 0, 1, 1,
0.4883868, 1.07963, -1.908, 0.04313726, 0, 1, 1,
0.4903931, 1.044267, 0.07886088, 0.05098039, 0, 1, 1,
0.4904831, 0.7311871, 0.3071302, 0.05490196, 0, 1, 1,
0.4927942, 0.2812538, 1.305242, 0.0627451, 0, 1, 1,
0.4946105, -0.6437227, 3.918616, 0.06666667, 0, 1, 1,
0.4963148, 0.5974272, 1.633229, 0.07450981, 0, 1, 1,
0.497892, 1.433039, 1.347263, 0.07843138, 0, 1, 1,
0.5013581, 1.622639, 1.304662, 0.08627451, 0, 1, 1,
0.501579, -1.762043, 3.070668, 0.09019608, 0, 1, 1,
0.5056828, -0.5037704, 2.907347, 0.09803922, 0, 1, 1,
0.5118421, -1.92782, 1.720851, 0.1058824, 0, 1, 1,
0.5127801, -0.4002746, 3.820776, 0.1098039, 0, 1, 1,
0.5161813, -0.4994359, 1.196445, 0.1176471, 0, 1, 1,
0.5183703, -0.2139768, 1.149516, 0.1215686, 0, 1, 1,
0.5202321, -0.2314079, 0.9291244, 0.1294118, 0, 1, 1,
0.5229282, 0.204783, 2.440371, 0.1333333, 0, 1, 1,
0.5230942, 1.349925, 0.03859615, 0.1411765, 0, 1, 1,
0.5240142, 1.308681, -0.1990505, 0.145098, 0, 1, 1,
0.5307156, 0.0037461, 3.266443, 0.1529412, 0, 1, 1,
0.531358, -0.3706054, 3.701972, 0.1568628, 0, 1, 1,
0.532078, 0.1017129, -0.09396267, 0.1647059, 0, 1, 1,
0.5321767, -0.04018342, -0.433333, 0.1686275, 0, 1, 1,
0.5345415, 0.5080006, 1.367404, 0.1764706, 0, 1, 1,
0.5352846, 0.9583382, 0.8210922, 0.1803922, 0, 1, 1,
0.5355601, -0.3036875, 2.796947, 0.1882353, 0, 1, 1,
0.5395031, -0.4508213, 2.03877, 0.1921569, 0, 1, 1,
0.5405209, -0.5581787, 2.964023, 0.2, 0, 1, 1,
0.5438237, 0.8528029, 0.3080312, 0.2078431, 0, 1, 1,
0.5473022, -0.6903006, 1.610337, 0.2117647, 0, 1, 1,
0.5498511, 0.9887869, 0.1030473, 0.2196078, 0, 1, 1,
0.562051, 0.1974104, -0.5063288, 0.2235294, 0, 1, 1,
0.5652601, 1.33625, 0.9704161, 0.2313726, 0, 1, 1,
0.5718844, 0.005491281, 0.6155748, 0.2352941, 0, 1, 1,
0.5749593, -2.736415, 2.397078, 0.2431373, 0, 1, 1,
0.5804048, 1.434883, -0.2306338, 0.2470588, 0, 1, 1,
0.584131, 0.3234764, 2.796748, 0.254902, 0, 1, 1,
0.5846798, 0.6384938, -0.09580161, 0.2588235, 0, 1, 1,
0.5875048, -1.037565, 2.64243, 0.2666667, 0, 1, 1,
0.5883449, 1.680099, 0.7904441, 0.2705882, 0, 1, 1,
0.5883688, 1.117928, 0.8712868, 0.2784314, 0, 1, 1,
0.591055, 0.4545099, -0.01362414, 0.282353, 0, 1, 1,
0.5957026, -1.754907, 3.893661, 0.2901961, 0, 1, 1,
0.5966589, 0.3180721, -1.306478, 0.2941177, 0, 1, 1,
0.597854, -0.9115484, 3.593576, 0.3019608, 0, 1, 1,
0.6026692, -0.067132, 1.174399, 0.3098039, 0, 1, 1,
0.6093786, -1.31706, 3.360044, 0.3137255, 0, 1, 1,
0.6182291, -1.947409, 1.702118, 0.3215686, 0, 1, 1,
0.6193144, 1.44548, 0.3025383, 0.3254902, 0, 1, 1,
0.62065, -0.2199868, 1.163153, 0.3333333, 0, 1, 1,
0.6218932, -2.013923, 2.547461, 0.3372549, 0, 1, 1,
0.6241155, -0.07545516, 1.320966, 0.345098, 0, 1, 1,
0.628856, -0.9754313, 1.456461, 0.3490196, 0, 1, 1,
0.6324051, 1.123023, 2.155407, 0.3568628, 0, 1, 1,
0.6347448, -1.305297, 4.062929, 0.3607843, 0, 1, 1,
0.637423, -1.345486, 3.043567, 0.3686275, 0, 1, 1,
0.6401404, 0.6629329, 0.5328715, 0.372549, 0, 1, 1,
0.6510973, 1.884067, 0.9135048, 0.3803922, 0, 1, 1,
0.6511198, 0.7649612, 1.72443, 0.3843137, 0, 1, 1,
0.6531001, -0.6561038, 2.194569, 0.3921569, 0, 1, 1,
0.6574935, -1.86195, 2.469438, 0.3960784, 0, 1, 1,
0.6626008, 1.533514, 0.7805067, 0.4039216, 0, 1, 1,
0.6648229, -0.1038578, 2.410963, 0.4117647, 0, 1, 1,
0.6655964, 0.5049913, -0.3599335, 0.4156863, 0, 1, 1,
0.6739941, -1.193657, 1.297734, 0.4235294, 0, 1, 1,
0.6756463, -0.1717362, 1.86638, 0.427451, 0, 1, 1,
0.6789833, 0.4172593, 2.413003, 0.4352941, 0, 1, 1,
0.6800888, -0.8515103, 3.550997, 0.4392157, 0, 1, 1,
0.684649, -0.5988356, 2.078751, 0.4470588, 0, 1, 1,
0.6905932, 0.9294603, 1.189419, 0.4509804, 0, 1, 1,
0.695638, -1.003215, 2.827351, 0.4588235, 0, 1, 1,
0.6958466, -0.4762137, 1.452449, 0.4627451, 0, 1, 1,
0.7002923, 0.5160306, 0.02146535, 0.4705882, 0, 1, 1,
0.7015243, -1.019242, 2.431888, 0.4745098, 0, 1, 1,
0.7033029, 0.1879896, 1.59083, 0.4823529, 0, 1, 1,
0.7034457, 0.3507526, -0.5679455, 0.4862745, 0, 1, 1,
0.7044449, -0.6306605, 1.73767, 0.4941176, 0, 1, 1,
0.7049363, -0.3631928, 1.459452, 0.5019608, 0, 1, 1,
0.7107679, -0.04750245, 0.7974062, 0.5058824, 0, 1, 1,
0.7111665, -0.2805785, 1.723509, 0.5137255, 0, 1, 1,
0.7155254, 0.7224631, -0.005825755, 0.5176471, 0, 1, 1,
0.7160707, -0.09679289, 3.040043, 0.5254902, 0, 1, 1,
0.7390299, 1.233019, 0.7698733, 0.5294118, 0, 1, 1,
0.7438412, 0.7518637, 1.045663, 0.5372549, 0, 1, 1,
0.7460696, 0.2739871, 1.517889, 0.5411765, 0, 1, 1,
0.7472786, 0.9437093, 0.5148624, 0.5490196, 0, 1, 1,
0.7545288, -2.033604, 2.465509, 0.5529412, 0, 1, 1,
0.7553834, 2.059656, -0.1132285, 0.5607843, 0, 1, 1,
0.7605163, 0.7320753, 0.1244052, 0.5647059, 0, 1, 1,
0.763061, -0.02162338, 1.30549, 0.572549, 0, 1, 1,
0.7686031, 0.6221975, 0.5585956, 0.5764706, 0, 1, 1,
0.770671, 0.5104439, 2.417331, 0.5843138, 0, 1, 1,
0.7709858, 0.7862056, 1.567701, 0.5882353, 0, 1, 1,
0.7710257, -2.138685, 1.860307, 0.5960785, 0, 1, 1,
0.7759616, -0.609688, 3.112711, 0.6039216, 0, 1, 1,
0.7810926, 0.037972, 3.527847, 0.6078432, 0, 1, 1,
0.7819312, -0.5852276, 0.4910307, 0.6156863, 0, 1, 1,
0.7890654, 0.5830464, 1.922635, 0.6196079, 0, 1, 1,
0.7908559, 0.2507198, 2.670303, 0.627451, 0, 1, 1,
0.7954388, 2.701385, -0.7008587, 0.6313726, 0, 1, 1,
0.7955491, -0.4975566, 0.981445, 0.6392157, 0, 1, 1,
0.7967901, 1.354173, 0.1089056, 0.6431373, 0, 1, 1,
0.7968183, -1.899672, 1.021734, 0.6509804, 0, 1, 1,
0.7986549, 1.449983, 0.4528492, 0.654902, 0, 1, 1,
0.8009282, -0.06223931, 1.760714, 0.6627451, 0, 1, 1,
0.8018836, -1.011732, 2.894294, 0.6666667, 0, 1, 1,
0.8032527, 1.125379, -0.5884207, 0.6745098, 0, 1, 1,
0.8046897, 1.290111, 2.284843, 0.6784314, 0, 1, 1,
0.8137215, -1.623454, 2.721358, 0.6862745, 0, 1, 1,
0.8142273, 0.3664907, -0.1293216, 0.6901961, 0, 1, 1,
0.817475, 1.252046, -0.3264793, 0.6980392, 0, 1, 1,
0.8177547, -1.340289, 1.157047, 0.7058824, 0, 1, 1,
0.8211372, 0.2617293, 0.09551506, 0.7098039, 0, 1, 1,
0.8312077, 0.7546859, 1.338446, 0.7176471, 0, 1, 1,
0.8324219, 0.4370846, 1.562018, 0.7215686, 0, 1, 1,
0.8353006, 0.2576116, 1.541054, 0.7294118, 0, 1, 1,
0.853751, -0.08450153, -0.07349641, 0.7333333, 0, 1, 1,
0.8540008, -0.08869959, 1.359134, 0.7411765, 0, 1, 1,
0.8562871, 0.5206475, 2.084064, 0.7450981, 0, 1, 1,
0.8572969, -0.3967099, 3.241008, 0.7529412, 0, 1, 1,
0.8584278, 0.3657824, 0.2031462, 0.7568628, 0, 1, 1,
0.8620749, 0.1775202, 2.344368, 0.7647059, 0, 1, 1,
0.865585, -0.1705429, 1.966909, 0.7686275, 0, 1, 1,
0.8689054, 0.5218607, 0.1807712, 0.7764706, 0, 1, 1,
0.8727317, -0.9118195, 2.026599, 0.7803922, 0, 1, 1,
0.8732952, -0.4090448, 2.269052, 0.7882353, 0, 1, 1,
0.8770258, 1.851596, -0.1460104, 0.7921569, 0, 1, 1,
0.8770298, 1.345681, 1.471141, 0.8, 0, 1, 1,
0.8771288, 0.2002653, 2.332736, 0.8078431, 0, 1, 1,
0.8806444, 0.1061584, 1.870063, 0.8117647, 0, 1, 1,
0.8810477, 0.2336239, 0.006001243, 0.8196079, 0, 1, 1,
0.8851525, -0.6664302, 0.3417212, 0.8235294, 0, 1, 1,
0.8870637, 0.6552144, 3.435003, 0.8313726, 0, 1, 1,
0.8949893, 0.9053285, 0.9332827, 0.8352941, 0, 1, 1,
0.9020997, 1.904309, -0.8028853, 0.8431373, 0, 1, 1,
0.906413, 0.649285, 2.134124, 0.8470588, 0, 1, 1,
0.9204094, -1.132294, -0.001602945, 0.854902, 0, 1, 1,
0.9219614, 0.5783106, -0.3582553, 0.8588235, 0, 1, 1,
0.9224094, 0.2086594, 1.402364, 0.8666667, 0, 1, 1,
0.9392284, 0.9195906, 0.4988568, 0.8705882, 0, 1, 1,
0.9535398, 1.071463, 0.3043481, 0.8784314, 0, 1, 1,
0.9543816, -1.000675, 1.586885, 0.8823529, 0, 1, 1,
0.9546859, -0.6097237, 1.915114, 0.8901961, 0, 1, 1,
0.9633158, -0.6595776, 3.233569, 0.8941177, 0, 1, 1,
0.9649705, 0.4616772, 0.8470818, 0.9019608, 0, 1, 1,
0.9661445, -0.7763162, 0.1841343, 0.9098039, 0, 1, 1,
0.9753813, -2.057058, 3.374471, 0.9137255, 0, 1, 1,
0.9766172, 1.006974, 1.192528, 0.9215686, 0, 1, 1,
0.976711, 0.6224926, 1.37748, 0.9254902, 0, 1, 1,
0.9832422, 0.5559542, 0.7732353, 0.9333333, 0, 1, 1,
0.9853573, 0.210232, 2.530417, 0.9372549, 0, 1, 1,
0.9871277, 1.554092, 0.158373, 0.945098, 0, 1, 1,
0.987817, -0.6686647, 2.49944, 0.9490196, 0, 1, 1,
0.9894794, -0.5638635, 4.043173, 0.9568627, 0, 1, 1,
0.9944996, 0.3934617, -0.270259, 0.9607843, 0, 1, 1,
0.9994259, -0.6654101, 0.6996601, 0.9686275, 0, 1, 1,
1.004534, 0.6273177, 0.4435578, 0.972549, 0, 1, 1,
1.011958, 0.08908404, 2.114726, 0.9803922, 0, 1, 1,
1.015258, 0.191741, 0.8682919, 0.9843137, 0, 1, 1,
1.016258, 0.1801072, 2.74734, 0.9921569, 0, 1, 1,
1.020227, 0.6680068, -0.2667778, 0.9960784, 0, 1, 1,
1.024645, -0.5630235, 1.574417, 1, 0, 0.9960784, 1,
1.025963, 0.4823775, 1.959044, 1, 0, 0.9882353, 1,
1.026226, 1.692475, -1.062354, 1, 0, 0.9843137, 1,
1.04377, 0.6135862, -0.1493889, 1, 0, 0.9764706, 1,
1.060399, -0.6736302, 1.852993, 1, 0, 0.972549, 1,
1.062601, -0.2147887, 0.545044, 1, 0, 0.9647059, 1,
1.062634, -1.722453, 1.454288, 1, 0, 0.9607843, 1,
1.064321, 2.046481, 1.624212, 1, 0, 0.9529412, 1,
1.068515, 0.4500957, 1.169275, 1, 0, 0.9490196, 1,
1.070935, 0.9209849, 0.03960197, 1, 0, 0.9411765, 1,
1.072526, -0.8353498, 2.700761, 1, 0, 0.9372549, 1,
1.076192, 0.4080316, 0.9724019, 1, 0, 0.9294118, 1,
1.076677, 0.04993913, 2.543208, 1, 0, 0.9254902, 1,
1.085138, 0.5589668, -0.4993151, 1, 0, 0.9176471, 1,
1.08985, 1.189855, 1.726945, 1, 0, 0.9137255, 1,
1.095614, 0.8166385, 0.7302428, 1, 0, 0.9058824, 1,
1.10587, 0.5171527, -0.2965046, 1, 0, 0.9019608, 1,
1.107519, -0.8816254, 1.069528, 1, 0, 0.8941177, 1,
1.108063, 0.7792737, 1.817822, 1, 0, 0.8862745, 1,
1.108977, 0.2995467, 2.990145, 1, 0, 0.8823529, 1,
1.110808, 0.5574266, 0.288382, 1, 0, 0.8745098, 1,
1.119731, 0.1019036, 2.26897, 1, 0, 0.8705882, 1,
1.120172, 1.552477, -0.278308, 1, 0, 0.8627451, 1,
1.120892, -0.7750763, 1.051059, 1, 0, 0.8588235, 1,
1.127233, -1.22536, 3.17987, 1, 0, 0.8509804, 1,
1.130002, -1.307452, 3.74083, 1, 0, 0.8470588, 1,
1.132451, 0.6619591, 1.957087, 1, 0, 0.8392157, 1,
1.132993, -0.646785, 1.589565, 1, 0, 0.8352941, 1,
1.137491, 1.291236, 0.710396, 1, 0, 0.827451, 1,
1.139269, -1.455844, 3.489993, 1, 0, 0.8235294, 1,
1.143988, -1.528719, 1.919173, 1, 0, 0.8156863, 1,
1.149172, 1.541835, 0.5290569, 1, 0, 0.8117647, 1,
1.150539, 0.6455924, 1.148984, 1, 0, 0.8039216, 1,
1.153196, 2.017429, 1.146969, 1, 0, 0.7960784, 1,
1.155163, -0.9404609, 4.742509, 1, 0, 0.7921569, 1,
1.155951, -1.757437, 2.326576, 1, 0, 0.7843137, 1,
1.156788, 1.831602, -1.213701, 1, 0, 0.7803922, 1,
1.161237, 0.3854783, 3.180322, 1, 0, 0.772549, 1,
1.162678, -0.8619678, 1.479241, 1, 0, 0.7686275, 1,
1.163016, 0.463803, -0.8944981, 1, 0, 0.7607843, 1,
1.165595, 0.3081135, 2.956237, 1, 0, 0.7568628, 1,
1.172285, 0.01440993, 0.67152, 1, 0, 0.7490196, 1,
1.184745, -0.9337698, 3.177733, 1, 0, 0.7450981, 1,
1.189288, 0.1140397, 2.527309, 1, 0, 0.7372549, 1,
1.196308, -0.7330655, 0.9892085, 1, 0, 0.7333333, 1,
1.196603, 0.1840127, 2.147597, 1, 0, 0.7254902, 1,
1.199593, 0.7244285, 2.066671, 1, 0, 0.7215686, 1,
1.201598, -1.458792, 0.4723997, 1, 0, 0.7137255, 1,
1.20194, 0.7008303, 1.54128, 1, 0, 0.7098039, 1,
1.212598, 0.2197568, 1.671332, 1, 0, 0.7019608, 1,
1.216379, -0.5851021, 3.588574, 1, 0, 0.6941177, 1,
1.221655, -0.3417438, 1.468933, 1, 0, 0.6901961, 1,
1.246916, -0.2234713, 3.748897, 1, 0, 0.682353, 1,
1.256197, 0.1629658, 2.711575, 1, 0, 0.6784314, 1,
1.271698, 2.549347, 0.8491648, 1, 0, 0.6705883, 1,
1.275406, 0.432339, 1.077388, 1, 0, 0.6666667, 1,
1.27598, 0.8138098, 0.6838965, 1, 0, 0.6588235, 1,
1.283748, -0.4766054, 2.662767, 1, 0, 0.654902, 1,
1.290879, 0.6527032, 0.5740225, 1, 0, 0.6470588, 1,
1.292713, -0.1946802, 1.749794, 1, 0, 0.6431373, 1,
1.292993, -0.4651304, 2.58679, 1, 0, 0.6352941, 1,
1.29384, -0.5858839, -0.1136209, 1, 0, 0.6313726, 1,
1.318936, 0.9158258, 0.9872454, 1, 0, 0.6235294, 1,
1.320456, 0.2862262, 1.367088, 1, 0, 0.6196079, 1,
1.324678, -0.6114318, 1.568978, 1, 0, 0.6117647, 1,
1.330221, -0.8187368, 0.5993036, 1, 0, 0.6078432, 1,
1.346424, 1.475725, 1.490691, 1, 0, 0.6, 1,
1.349133, -1.81265, 2.197833, 1, 0, 0.5921569, 1,
1.356904, -0.1651444, 2.029926, 1, 0, 0.5882353, 1,
1.359735, 0.2034231, 2.03829, 1, 0, 0.5803922, 1,
1.361349, -0.6074457, 2.680422, 1, 0, 0.5764706, 1,
1.376262, -0.5768417, 1.760571, 1, 0, 0.5686275, 1,
1.393517, -0.6353624, 0.545607, 1, 0, 0.5647059, 1,
1.39746, 0.559555, -0.112216, 1, 0, 0.5568628, 1,
1.405483, 0.303284, 1.230383, 1, 0, 0.5529412, 1,
1.410357, 0.8845124, 1.372853, 1, 0, 0.5450981, 1,
1.412116, -0.3725428, 1.53915, 1, 0, 0.5411765, 1,
1.414662, 0.3533904, 1.260071, 1, 0, 0.5333334, 1,
1.416444, 0.501523, 1.223587, 1, 0, 0.5294118, 1,
1.425991, -1.101226, 2.031184, 1, 0, 0.5215687, 1,
1.427664, 1.097097, -1.459094, 1, 0, 0.5176471, 1,
1.436159, 0.4648297, 1.227866, 1, 0, 0.509804, 1,
1.437643, -0.05506112, 1.992213, 1, 0, 0.5058824, 1,
1.443914, -0.8524021, 2.716683, 1, 0, 0.4980392, 1,
1.451061, -1.127164, 1.068683, 1, 0, 0.4901961, 1,
1.453222, 1.349041, 1.067528, 1, 0, 0.4862745, 1,
1.460169, -1.003677, 1.778515, 1, 0, 0.4784314, 1,
1.467329, -1.217891, 3.360982, 1, 0, 0.4745098, 1,
1.469997, 0.9283142, 1.179757, 1, 0, 0.4666667, 1,
1.475318, 0.05694595, 0.8152548, 1, 0, 0.4627451, 1,
1.477904, 0.02405216, 0.7174466, 1, 0, 0.454902, 1,
1.479924, 0.7391686, 1.922736, 1, 0, 0.4509804, 1,
1.481487, -0.3647641, 2.452726, 1, 0, 0.4431373, 1,
1.491785, -1.352915, 2.14949, 1, 0, 0.4392157, 1,
1.499803, 0.06770702, 2.469062, 1, 0, 0.4313726, 1,
1.501928, -1.585548, 3.2915, 1, 0, 0.427451, 1,
1.509886, 0.4350796, 0.3442129, 1, 0, 0.4196078, 1,
1.530525, -0.7171741, 3.347199, 1, 0, 0.4156863, 1,
1.530627, -0.692543, 1.848782, 1, 0, 0.4078431, 1,
1.535264, -0.1179424, 0.908086, 1, 0, 0.4039216, 1,
1.543433, -1.069435, 1.49708, 1, 0, 0.3960784, 1,
1.548229, -0.4580533, 2.589531, 1, 0, 0.3882353, 1,
1.551866, -0.4889296, 1.450632, 1, 0, 0.3843137, 1,
1.5562, -2.054449, 2.562488, 1, 0, 0.3764706, 1,
1.576025, -0.8520274, 4.551297, 1, 0, 0.372549, 1,
1.577082, -0.4189134, 1.105487, 1, 0, 0.3647059, 1,
1.590872, 2.223871, 0.1422511, 1, 0, 0.3607843, 1,
1.60255, 1.097316, 0.5900706, 1, 0, 0.3529412, 1,
1.607848, -0.7203638, 1.946494, 1, 0, 0.3490196, 1,
1.628778, 0.08162927, 0.1240222, 1, 0, 0.3411765, 1,
1.669428, 0.471322, 1.858754, 1, 0, 0.3372549, 1,
1.678423, -1.686216, 0.6865043, 1, 0, 0.3294118, 1,
1.682229, 1.175342, 2.663973, 1, 0, 0.3254902, 1,
1.685694, 0.397905, 1.375374, 1, 0, 0.3176471, 1,
1.701607, 0.1235675, 2.516107, 1, 0, 0.3137255, 1,
1.709387, -0.1957622, -0.7034177, 1, 0, 0.3058824, 1,
1.74295, -1.32902, 0.8630649, 1, 0, 0.2980392, 1,
1.748764, -0.5434577, 3.182697, 1, 0, 0.2941177, 1,
1.754802, -0.6016431, 2.189427, 1, 0, 0.2862745, 1,
1.761284, -1.089434, 1.242915, 1, 0, 0.282353, 1,
1.768609, -0.7732501, 3.284755, 1, 0, 0.2745098, 1,
1.773667, 0.6443793, 1.231593, 1, 0, 0.2705882, 1,
1.779788, -1.356037, 3.979119, 1, 0, 0.2627451, 1,
1.843386, 0.3998081, 2.05973, 1, 0, 0.2588235, 1,
1.847477, -0.5600575, 1.96685, 1, 0, 0.2509804, 1,
1.855251, -1.077746, 2.050086, 1, 0, 0.2470588, 1,
1.859472, -1.597521, 1.542222, 1, 0, 0.2392157, 1,
1.892548, -1.090734, 1.667178, 1, 0, 0.2352941, 1,
1.910286, 0.4558539, 2.982599, 1, 0, 0.227451, 1,
1.920169, -0.3198743, 0.4102505, 1, 0, 0.2235294, 1,
1.927859, -0.06276974, 1.316032, 1, 0, 0.2156863, 1,
1.942728, -1.268245, 1.716849, 1, 0, 0.2117647, 1,
1.953973, 0.3687248, 2.765198, 1, 0, 0.2039216, 1,
1.96603, -0.0251411, 1.419922, 1, 0, 0.1960784, 1,
1.973398, 1.735636, 0.9380844, 1, 0, 0.1921569, 1,
1.99565, 2.025031, 0.2411677, 1, 0, 0.1843137, 1,
2.000145, -0.5974169, 2.744881, 1, 0, 0.1803922, 1,
2.000361, -1.513534, 3.169334, 1, 0, 0.172549, 1,
2.005516, 0.3737986, -0.01418028, 1, 0, 0.1686275, 1,
2.036986, 0.1914757, 0.8126156, 1, 0, 0.1607843, 1,
2.051717, -0.3708406, 2.257972, 1, 0, 0.1568628, 1,
2.092631, -0.5577501, 1.721859, 1, 0, 0.1490196, 1,
2.102588, 0.9952166, -1.263172, 1, 0, 0.145098, 1,
2.10955, 0.2587526, 1.360204, 1, 0, 0.1372549, 1,
2.119659, -0.1669552, 0.3586962, 1, 0, 0.1333333, 1,
2.128019, -0.3145896, 2.732453, 1, 0, 0.1254902, 1,
2.15421, -0.6931249, 0.8141074, 1, 0, 0.1215686, 1,
2.179895, -0.3104857, 3.897676, 1, 0, 0.1137255, 1,
2.200877, -0.6463494, 3.487195, 1, 0, 0.1098039, 1,
2.252698, -0.2302946, 0.6284699, 1, 0, 0.1019608, 1,
2.282748, 0.4758482, 1.482415, 1, 0, 0.09411765, 1,
2.283522, -1.933954, 3.177419, 1, 0, 0.09019608, 1,
2.343128, 1.207638, -0.08302741, 1, 0, 0.08235294, 1,
2.374146, 1.379138, 1.495769, 1, 0, 0.07843138, 1,
2.417131, -0.8233864, 2.157732, 1, 0, 0.07058824, 1,
2.428329, 1.130599, 1.437737, 1, 0, 0.06666667, 1,
2.46932, -1.551738, 1.164329, 1, 0, 0.05882353, 1,
2.491076, -0.06569372, 1.479213, 1, 0, 0.05490196, 1,
2.527264, -0.3577471, 1.189959, 1, 0, 0.04705882, 1,
2.563639, 0.6735963, 2.073995, 1, 0, 0.04313726, 1,
2.56414, -0.7420763, 0.6932248, 1, 0, 0.03529412, 1,
2.569479, 0.4204831, 0.6524385, 1, 0, 0.03137255, 1,
2.720896, -0.1695941, 1.85226, 1, 0, 0.02352941, 1,
2.758138, -0.4500598, 0.7543647, 1, 0, 0.01960784, 1,
2.899399, 0.3423275, 1.163026, 1, 0, 0.01176471, 1,
3.505593, 0.1717122, 0.116328, 1, 0, 0.007843138, 1
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
0.333511, -4.246706, -6.876925, 0, -0.5, 0.5, 0.5,
0.333511, -4.246706, -6.876925, 1, -0.5, 0.5, 0.5,
0.333511, -4.246706, -6.876925, 1, 1.5, 0.5, 0.5,
0.333511, -4.246706, -6.876925, 0, 1.5, 0.5, 0.5
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
-3.913907, 0.03289199, -6.876925, 0, -0.5, 0.5, 0.5,
-3.913907, 0.03289199, -6.876925, 1, -0.5, 0.5, 0.5,
-3.913907, 0.03289199, -6.876925, 1, 1.5, 0.5, 0.5,
-3.913907, 0.03289199, -6.876925, 0, 1.5, 0.5, 0.5
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
-3.913907, -4.246706, 0.1719217, 0, -0.5, 0.5, 0.5,
-3.913907, -4.246706, 0.1719217, 1, -0.5, 0.5, 0.5,
-3.913907, -4.246706, 0.1719217, 1, 1.5, 0.5, 0.5,
-3.913907, -4.246706, 0.1719217, 0, 1.5, 0.5, 0.5
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
-2, -3.259106, -5.250268,
3, -3.259106, -5.250268,
-2, -3.259106, -5.250268,
-2, -3.423706, -5.521378,
-1, -3.259106, -5.250268,
-1, -3.423706, -5.521378,
0, -3.259106, -5.250268,
0, -3.423706, -5.521378,
1, -3.259106, -5.250268,
1, -3.423706, -5.521378,
2, -3.259106, -5.250268,
2, -3.423706, -5.521378,
3, -3.259106, -5.250268,
3, -3.423706, -5.521378
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
-2, -3.752906, -6.063597, 0, -0.5, 0.5, 0.5,
-2, -3.752906, -6.063597, 1, -0.5, 0.5, 0.5,
-2, -3.752906, -6.063597, 1, 1.5, 0.5, 0.5,
-2, -3.752906, -6.063597, 0, 1.5, 0.5, 0.5,
-1, -3.752906, -6.063597, 0, -0.5, 0.5, 0.5,
-1, -3.752906, -6.063597, 1, -0.5, 0.5, 0.5,
-1, -3.752906, -6.063597, 1, 1.5, 0.5, 0.5,
-1, -3.752906, -6.063597, 0, 1.5, 0.5, 0.5,
0, -3.752906, -6.063597, 0, -0.5, 0.5, 0.5,
0, -3.752906, -6.063597, 1, -0.5, 0.5, 0.5,
0, -3.752906, -6.063597, 1, 1.5, 0.5, 0.5,
0, -3.752906, -6.063597, 0, 1.5, 0.5, 0.5,
1, -3.752906, -6.063597, 0, -0.5, 0.5, 0.5,
1, -3.752906, -6.063597, 1, -0.5, 0.5, 0.5,
1, -3.752906, -6.063597, 1, 1.5, 0.5, 0.5,
1, -3.752906, -6.063597, 0, 1.5, 0.5, 0.5,
2, -3.752906, -6.063597, 0, -0.5, 0.5, 0.5,
2, -3.752906, -6.063597, 1, -0.5, 0.5, 0.5,
2, -3.752906, -6.063597, 1, 1.5, 0.5, 0.5,
2, -3.752906, -6.063597, 0, 1.5, 0.5, 0.5,
3, -3.752906, -6.063597, 0, -0.5, 0.5, 0.5,
3, -3.752906, -6.063597, 1, -0.5, 0.5, 0.5,
3, -3.752906, -6.063597, 1, 1.5, 0.5, 0.5,
3, -3.752906, -6.063597, 0, 1.5, 0.5, 0.5
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
-2.933733, -3, -5.250268,
-2.933733, 3, -5.250268,
-2.933733, -3, -5.250268,
-3.097096, -3, -5.521378,
-2.933733, -2, -5.250268,
-3.097096, -2, -5.521378,
-2.933733, -1, -5.250268,
-3.097096, -1, -5.521378,
-2.933733, 0, -5.250268,
-3.097096, 0, -5.521378,
-2.933733, 1, -5.250268,
-3.097096, 1, -5.521378,
-2.933733, 2, -5.250268,
-3.097096, 2, -5.521378,
-2.933733, 3, -5.250268,
-3.097096, 3, -5.521378
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
-3.42382, -3, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, -3, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, -3, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, -3, -6.063597, 0, 1.5, 0.5, 0.5,
-3.42382, -2, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, -2, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, -2, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, -2, -6.063597, 0, 1.5, 0.5, 0.5,
-3.42382, -1, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, -1, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, -1, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, -1, -6.063597, 0, 1.5, 0.5, 0.5,
-3.42382, 0, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, 0, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, 0, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, 0, -6.063597, 0, 1.5, 0.5, 0.5,
-3.42382, 1, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, 1, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, 1, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, 1, -6.063597, 0, 1.5, 0.5, 0.5,
-3.42382, 2, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, 2, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, 2, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, 2, -6.063597, 0, 1.5, 0.5, 0.5,
-3.42382, 3, -6.063597, 0, -0.5, 0.5, 0.5,
-3.42382, 3, -6.063597, 1, -0.5, 0.5, 0.5,
-3.42382, 3, -6.063597, 1, 1.5, 0.5, 0.5,
-3.42382, 3, -6.063597, 0, 1.5, 0.5, 0.5
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
-2.933733, -3.259106, -4,
-2.933733, -3.259106, 4,
-2.933733, -3.259106, -4,
-3.097096, -3.423706, -4,
-2.933733, -3.259106, -2,
-3.097096, -3.423706, -2,
-2.933733, -3.259106, 0,
-3.097096, -3.423706, 0,
-2.933733, -3.259106, 2,
-3.097096, -3.423706, 2,
-2.933733, -3.259106, 4,
-3.097096, -3.423706, 4
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
-3.42382, -3.752906, -4, 0, -0.5, 0.5, 0.5,
-3.42382, -3.752906, -4, 1, -0.5, 0.5, 0.5,
-3.42382, -3.752906, -4, 1, 1.5, 0.5, 0.5,
-3.42382, -3.752906, -4, 0, 1.5, 0.5, 0.5,
-3.42382, -3.752906, -2, 0, -0.5, 0.5, 0.5,
-3.42382, -3.752906, -2, 1, -0.5, 0.5, 0.5,
-3.42382, -3.752906, -2, 1, 1.5, 0.5, 0.5,
-3.42382, -3.752906, -2, 0, 1.5, 0.5, 0.5,
-3.42382, -3.752906, 0, 0, -0.5, 0.5, 0.5,
-3.42382, -3.752906, 0, 1, -0.5, 0.5, 0.5,
-3.42382, -3.752906, 0, 1, 1.5, 0.5, 0.5,
-3.42382, -3.752906, 0, 0, 1.5, 0.5, 0.5,
-3.42382, -3.752906, 2, 0, -0.5, 0.5, 0.5,
-3.42382, -3.752906, 2, 1, -0.5, 0.5, 0.5,
-3.42382, -3.752906, 2, 1, 1.5, 0.5, 0.5,
-3.42382, -3.752906, 2, 0, 1.5, 0.5, 0.5,
-3.42382, -3.752906, 4, 0, -0.5, 0.5, 0.5,
-3.42382, -3.752906, 4, 1, -0.5, 0.5, 0.5,
-3.42382, -3.752906, 4, 1, 1.5, 0.5, 0.5,
-3.42382, -3.752906, 4, 0, 1.5, 0.5, 0.5
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
-2.933733, -3.259106, -5.250268,
-2.933733, 3.32489, -5.250268,
-2.933733, -3.259106, 5.594112,
-2.933733, 3.32489, 5.594112,
-2.933733, -3.259106, -5.250268,
-2.933733, -3.259106, 5.594112,
-2.933733, 3.32489, -5.250268,
-2.933733, 3.32489, 5.594112,
-2.933733, -3.259106, -5.250268,
3.600755, -3.259106, -5.250268,
-2.933733, -3.259106, 5.594112,
3.600755, -3.259106, 5.594112,
-2.933733, 3.32489, -5.250268,
3.600755, 3.32489, -5.250268,
-2.933733, 3.32489, 5.594112,
3.600755, 3.32489, 5.594112,
3.600755, -3.259106, -5.250268,
3.600755, 3.32489, -5.250268,
3.600755, -3.259106, 5.594112,
3.600755, 3.32489, 5.594112,
3.600755, -3.259106, -5.250268,
3.600755, -3.259106, 5.594112,
3.600755, 3.32489, -5.250268,
3.600755, 3.32489, 5.594112
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
var radius = 7.620207;
var distance = 33.90316;
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
mvMatrix.translate( -0.333511, -0.03289199, -0.1719217 );
mvMatrix.scale( 1.260866, 1.251385, 0.7597591 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.90316);
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
Stam<-read.table("Stam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Stam$V2
```

```
## Error in eval(expr, envir, enclos): object 'Stam' not found
```

```r
y<-Stam$V3
```

```
## Error in eval(expr, envir, enclos): object 'Stam' not found
```

```r
z<-Stam$V4
```

```
## Error in eval(expr, envir, enclos): object 'Stam' not found
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
-2.838571, -0.8752059, -2.471401, 0, 0, 1, 1, 1,
-2.830076, 0.4303145, -1.02584, 1, 0, 0, 1, 1,
-2.539879, 2.346366, -0.5437933, 1, 0, 0, 1, 1,
-2.4994, -0.6719018, -2.60571, 1, 0, 0, 1, 1,
-2.498682, 0.05605528, -1.633948, 1, 0, 0, 1, 1,
-2.421722, 1.319009, -1.050375, 1, 0, 0, 1, 1,
-2.360787, 1.095977, -1.370419, 0, 0, 0, 1, 1,
-2.342797, -1.15618, -3.801253, 0, 0, 0, 1, 1,
-2.238063, -0.2968359, -2.054566, 0, 0, 0, 1, 1,
-2.212809, 1.174121, -1.345724, 0, 0, 0, 1, 1,
-2.203251, 0.9925696, -1.459223, 0, 0, 0, 1, 1,
-2.144969, -2.275569, -1.961549, 0, 0, 0, 1, 1,
-2.127176, 0.09774263, -2.005773, 0, 0, 0, 1, 1,
-2.12683, 0.3909726, -2.386859, 1, 1, 1, 1, 1,
-2.124032, 1.160983, -1.788003, 1, 1, 1, 1, 1,
-2.10182, -0.6098382, -2.571322, 1, 1, 1, 1, 1,
-2.097666, 0.4413907, -0.1651586, 1, 1, 1, 1, 1,
-2.096905, 1.198521, -2.480591, 1, 1, 1, 1, 1,
-2.077385, -0.671944, -2.646905, 1, 1, 1, 1, 1,
-2.072317, -0.2701244, -2.285748, 1, 1, 1, 1, 1,
-2.069073, -0.03467844, -0.8392679, 1, 1, 1, 1, 1,
-2.063616, 0.7159343, -2.881928, 1, 1, 1, 1, 1,
-2.056924, 0.5070076, -1.893836, 1, 1, 1, 1, 1,
-2.048538, -1.039028, -2.043118, 1, 1, 1, 1, 1,
-2.007879, 0.6647643, -1.135985, 1, 1, 1, 1, 1,
-1.97957, 1.291435, 0.4521908, 1, 1, 1, 1, 1,
-1.94314, 2.279564, 0.3244884, 1, 1, 1, 1, 1,
-1.924498, -1.09313, -2.810766, 1, 1, 1, 1, 1,
-1.91446, -0.9099265, -2.021968, 0, 0, 1, 1, 1,
-1.912514, -0.1669415, -1.614297, 1, 0, 0, 1, 1,
-1.910698, -0.06333186, -2.87567, 1, 0, 0, 1, 1,
-1.894613, 0.8251062, -1.078092, 1, 0, 0, 1, 1,
-1.884293, -1.842834, -1.219734, 1, 0, 0, 1, 1,
-1.8563, -1.056526, -2.811337, 1, 0, 0, 1, 1,
-1.825303, 0.507102, -0.8370328, 0, 0, 0, 1, 1,
-1.814641, 1.164184, -0.224737, 0, 0, 0, 1, 1,
-1.806812, -1.020986, -0.2173012, 0, 0, 0, 1, 1,
-1.781077, -0.08464936, 0.9102807, 0, 0, 0, 1, 1,
-1.776966, -0.7539781, -0.5731989, 0, 0, 0, 1, 1,
-1.75911, 0.5621457, -0.6970614, 0, 0, 0, 1, 1,
-1.728306, -0.1238342, -2.997066, 0, 0, 0, 1, 1,
-1.725506, -0.1483152, -1.957792, 1, 1, 1, 1, 1,
-1.712624, 0.3422105, -3.61475, 1, 1, 1, 1, 1,
-1.71058, 0.09119482, -2.50545, 1, 1, 1, 1, 1,
-1.710051, -0.03605243, -1.93155, 1, 1, 1, 1, 1,
-1.692089, 0.4611246, -1.084876, 1, 1, 1, 1, 1,
-1.684668, 0.5816803, -0.4457485, 1, 1, 1, 1, 1,
-1.683825, -0.4736411, -3.051203, 1, 1, 1, 1, 1,
-1.673828, 0.06875832, -0.995693, 1, 1, 1, 1, 1,
-1.67161, 0.8855091, -1.742665, 1, 1, 1, 1, 1,
-1.662009, 0.3432187, -1.61435, 1, 1, 1, 1, 1,
-1.65861, 1.852351, -0.7612356, 1, 1, 1, 1, 1,
-1.627124, 0.0843806, 0.1124596, 1, 1, 1, 1, 1,
-1.616716, -0.6735776, -1.729488, 1, 1, 1, 1, 1,
-1.598032, -0.5856789, -3.006277, 1, 1, 1, 1, 1,
-1.594517, 0.1429328, -1.481569, 1, 1, 1, 1, 1,
-1.582069, 1.076904, -0.506817, 0, 0, 1, 1, 1,
-1.58191, 0.7604451, -3.686739, 1, 0, 0, 1, 1,
-1.579283, -0.2265403, -2.14673, 1, 0, 0, 1, 1,
-1.571077, 0.769787, 0.569243, 1, 0, 0, 1, 1,
-1.566669, -1.038064, -1.061109, 1, 0, 0, 1, 1,
-1.540671, 0.5802323, -0.7499428, 1, 0, 0, 1, 1,
-1.540468, -0.2717664, -1.525854, 0, 0, 0, 1, 1,
-1.537658, 0.2804026, -0.4854367, 0, 0, 0, 1, 1,
-1.535454, -1.372512, -3.391125, 0, 0, 0, 1, 1,
-1.502293, 0.1704144, -2.610949, 0, 0, 0, 1, 1,
-1.486175, 1.82069, -0.4662448, 0, 0, 0, 1, 1,
-1.484357, -0.5244241, -0.4239631, 0, 0, 0, 1, 1,
-1.480992, 0.8741261, -0.05568602, 0, 0, 0, 1, 1,
-1.474453, 0.7954691, -0.7377977, 1, 1, 1, 1, 1,
-1.454143, 0.3636367, -2.436427, 1, 1, 1, 1, 1,
-1.453585, 0.6462523, 0.2678129, 1, 1, 1, 1, 1,
-1.441235, 1.119809, -0.9378538, 1, 1, 1, 1, 1,
-1.439614, 0.08889374, -2.513462, 1, 1, 1, 1, 1,
-1.429992, 0.3729596, 0.0334792, 1, 1, 1, 1, 1,
-1.429827, -1.725509, -3.880202, 1, 1, 1, 1, 1,
-1.429134, -0.7843935, -0.06277197, 1, 1, 1, 1, 1,
-1.419154, -0.4542029, -0.8713542, 1, 1, 1, 1, 1,
-1.414335, 0.2674175, -0.7456381, 1, 1, 1, 1, 1,
-1.413292, -1.535214, -2.32376, 1, 1, 1, 1, 1,
-1.392058, 0.7673544, -0.894383, 1, 1, 1, 1, 1,
-1.388728, -0.8647946, -1.500834, 1, 1, 1, 1, 1,
-1.384723, 2.099769, -0.8673801, 1, 1, 1, 1, 1,
-1.384256, -0.4936864, -2.757587, 1, 1, 1, 1, 1,
-1.383552, -0.8616168, -1.455653, 0, 0, 1, 1, 1,
-1.367161, -0.07180435, -1.909378, 1, 0, 0, 1, 1,
-1.361274, 1.03755, -1.198481, 1, 0, 0, 1, 1,
-1.361082, 0.5916076, -1.647046, 1, 0, 0, 1, 1,
-1.349887, -0.6418606, -0.881371, 1, 0, 0, 1, 1,
-1.342461, -0.2853564, -2.699188, 1, 0, 0, 1, 1,
-1.337842, 0.6561932, -1.122757, 0, 0, 0, 1, 1,
-1.337063, 0.0849596, -1.068153, 0, 0, 0, 1, 1,
-1.32418, 1.484857, -3.589566, 0, 0, 0, 1, 1,
-1.31687, 0.6894647, -0.7514765, 0, 0, 0, 1, 1,
-1.302612, -0.5825369, -2.939271, 0, 0, 0, 1, 1,
-1.297949, 1.047986, -2.789677, 0, 0, 0, 1, 1,
-1.296484, -0.07262159, -1.286637, 0, 0, 0, 1, 1,
-1.296114, -1.289011, -2.030745, 1, 1, 1, 1, 1,
-1.279304, 0.7900786, -1.462411, 1, 1, 1, 1, 1,
-1.274567, -0.2928357, -1.693472, 1, 1, 1, 1, 1,
-1.2669, 0.8126203, -0.1103731, 1, 1, 1, 1, 1,
-1.254067, 1.265734, -0.3240865, 1, 1, 1, 1, 1,
-1.245893, 0.508911, -1.223886, 1, 1, 1, 1, 1,
-1.243678, -0.009360955, -1.362095, 1, 1, 1, 1, 1,
-1.243028, 0.9743447, -0.7710367, 1, 1, 1, 1, 1,
-1.242658, -0.3936585, -3.157845, 1, 1, 1, 1, 1,
-1.241622, 0.7784006, -2.015716, 1, 1, 1, 1, 1,
-1.23436, 0.9695463, -0.5850648, 1, 1, 1, 1, 1,
-1.230494, 0.6581188, -2.315841, 1, 1, 1, 1, 1,
-1.216307, 0.05203568, -1.309763, 1, 1, 1, 1, 1,
-1.213517, -0.003411607, 0.5812477, 1, 1, 1, 1, 1,
-1.184985, -1.40113, -3.501495, 1, 1, 1, 1, 1,
-1.184729, -1.528094, -2.043397, 0, 0, 1, 1, 1,
-1.181811, -1.764181, -1.104533, 1, 0, 0, 1, 1,
-1.180766, -1.035588, -1.675285, 1, 0, 0, 1, 1,
-1.163279, 0.5379236, -2.063865, 1, 0, 0, 1, 1,
-1.162365, -0.5638705, -3.20584, 1, 0, 0, 1, 1,
-1.160824, -0.7112679, -4.159819, 1, 0, 0, 1, 1,
-1.158474, 1.578637, -1.448401, 0, 0, 0, 1, 1,
-1.153279, -0.128238, -1.17752, 0, 0, 0, 1, 1,
-1.1523, 0.2455734, -0.4836521, 0, 0, 0, 1, 1,
-1.14868, 0.425274, -1.442116, 0, 0, 0, 1, 1,
-1.148207, 0.06149282, -1.939117, 0, 0, 0, 1, 1,
-1.14785, 0.9915679, -0.9427577, 0, 0, 0, 1, 1,
-1.147727, -0.1163938, -2.498533, 0, 0, 0, 1, 1,
-1.142974, -0.8217544, -2.892396, 1, 1, 1, 1, 1,
-1.140767, -0.2387457, -0.4114481, 1, 1, 1, 1, 1,
-1.136042, -0.5244398, -3.512587, 1, 1, 1, 1, 1,
-1.13567, 1.180424, -1.345016, 1, 1, 1, 1, 1,
-1.126934, 0.9112428, -0.1698957, 1, 1, 1, 1, 1,
-1.121744, -0.4799564, -1.887424, 1, 1, 1, 1, 1,
-1.118473, 0.3120261, -1.73745, 1, 1, 1, 1, 1,
-1.116244, 1.794317, 0.9219689, 1, 1, 1, 1, 1,
-1.108808, -0.9704535, -2.531599, 1, 1, 1, 1, 1,
-1.104139, -0.4847652, -1.01289, 1, 1, 1, 1, 1,
-1.099064, 0.4650407, 0.3908977, 1, 1, 1, 1, 1,
-1.098459, -0.4293426, -2.307786, 1, 1, 1, 1, 1,
-1.092294, 0.7433619, -0.5733953, 1, 1, 1, 1, 1,
-1.089888, -0.3328559, -3.067281, 1, 1, 1, 1, 1,
-1.08725, 0.4719699, -0.5722694, 1, 1, 1, 1, 1,
-1.081958, -0.3509032, -1.657055, 0, 0, 1, 1, 1,
-1.077467, -1.014502, -1.366982, 1, 0, 0, 1, 1,
-1.073283, 0.1189193, -1.787025, 1, 0, 0, 1, 1,
-1.061663, -0.7612713, -4.204901, 1, 0, 0, 1, 1,
-1.059715, -0.3034855, -2.1846, 1, 0, 0, 1, 1,
-1.05655, -0.1945059, -2.321457, 1, 0, 0, 1, 1,
-1.056181, -0.1917302, -1.583941, 0, 0, 0, 1, 1,
-1.049213, -0.3050342, 0.5851767, 0, 0, 0, 1, 1,
-1.048605, -0.007980485, -1.030373, 0, 0, 0, 1, 1,
-1.045126, 1.044441, 0.08376805, 0, 0, 0, 1, 1,
-1.03503, 0.05729502, -0.6069926, 0, 0, 0, 1, 1,
-1.034266, 0.1913651, -0.6765761, 0, 0, 0, 1, 1,
-1.03282, -0.626318, -1.803522, 0, 0, 0, 1, 1,
-1.03256, 1.053926, -0.7225302, 1, 1, 1, 1, 1,
-1.031191, -0.3795822, -0.3812956, 1, 1, 1, 1, 1,
-1.025333, 1.253909, -0.1479732, 1, 1, 1, 1, 1,
-1.024276, -0.1540045, -1.445033, 1, 1, 1, 1, 1,
-1.023235, 1.027649, -1.91445, 1, 1, 1, 1, 1,
-1.015403, 0.3638985, -0.4883887, 1, 1, 1, 1, 1,
-1.007579, -0.4017086, -3.090261, 1, 1, 1, 1, 1,
-1.003715, 0.1251566, -2.028715, 1, 1, 1, 1, 1,
-1.003299, 0.1675818, -2.191559, 1, 1, 1, 1, 1,
-0.9830067, 0.2532652, -1.29633, 1, 1, 1, 1, 1,
-0.9811427, -0.6981295, -0.8845838, 1, 1, 1, 1, 1,
-0.9798373, -0.529286, -2.300549, 1, 1, 1, 1, 1,
-0.9755483, -0.6617974, -2.114627, 1, 1, 1, 1, 1,
-0.9742182, 0.8831026, -1.25582, 1, 1, 1, 1, 1,
-0.9648249, 1.125851, -1.401949, 1, 1, 1, 1, 1,
-0.962682, -0.2923415, -2.353174, 0, 0, 1, 1, 1,
-0.9571788, 1.537762, -2.204444, 1, 0, 0, 1, 1,
-0.9559714, -1.001025, -0.5313899, 1, 0, 0, 1, 1,
-0.9556469, 0.5096524, -1.652422, 1, 0, 0, 1, 1,
-0.951732, 2.639692, -0.9101664, 1, 0, 0, 1, 1,
-0.950254, -0.9373184, -3.066578, 1, 0, 0, 1, 1,
-0.9480406, -0.1151608, -3.436519, 0, 0, 0, 1, 1,
-0.945385, -1.092752, -5.09234, 0, 0, 0, 1, 1,
-0.94213, 2.143352, -0.9101866, 0, 0, 0, 1, 1,
-0.9418034, -0.4826908, -1.440052, 0, 0, 0, 1, 1,
-0.9402235, 0.7093842, -1.26318, 0, 0, 0, 1, 1,
-0.9379224, 0.5550183, 0.5720856, 0, 0, 0, 1, 1,
-0.9359085, 0.7317386, 0.1359928, 0, 0, 0, 1, 1,
-0.9334148, 1.173585, -0.9376944, 1, 1, 1, 1, 1,
-0.9322504, -1.312452, -2.415862, 1, 1, 1, 1, 1,
-0.9288039, 0.1418292, -0.3565795, 1, 1, 1, 1, 1,
-0.9181213, 0.1436528, -0.9298579, 1, 1, 1, 1, 1,
-0.9169254, -2.23262, -4.067046, 1, 1, 1, 1, 1,
-0.9138337, -0.530111, -3.606931, 1, 1, 1, 1, 1,
-0.9113217, 0.03691332, -1.539891, 1, 1, 1, 1, 1,
-0.9102831, 0.6082189, -2.159659, 1, 1, 1, 1, 1,
-0.9076034, -1.49206, -2.469328, 1, 1, 1, 1, 1,
-0.8956897, -0.3856916, -0.6535053, 1, 1, 1, 1, 1,
-0.8890612, -0.95023, -3.212538, 1, 1, 1, 1, 1,
-0.8868005, 0.3320722, -1.3134, 1, 1, 1, 1, 1,
-0.883064, 0.1324199, -1.399622, 1, 1, 1, 1, 1,
-0.8810458, 1.749999, -0.7899168, 1, 1, 1, 1, 1,
-0.8808666, 0.00378834, -0.7640104, 1, 1, 1, 1, 1,
-0.8798779, 0.1405823, -0.6320999, 0, 0, 1, 1, 1,
-0.8736268, -0.9396467, -1.650878, 1, 0, 0, 1, 1,
-0.873187, -0.1883549, -2.568972, 1, 0, 0, 1, 1,
-0.8676225, 1.019397, -1.622322, 1, 0, 0, 1, 1,
-0.8673222, -0.8540137, -0.9514992, 1, 0, 0, 1, 1,
-0.8647634, 1.237879, -2.938586, 1, 0, 0, 1, 1,
-0.864592, -1.224153, -2.555852, 0, 0, 0, 1, 1,
-0.8641977, 1.730094, -0.7822587, 0, 0, 0, 1, 1,
-0.8558915, -0.187646, -2.737902, 0, 0, 0, 1, 1,
-0.8519242, 1.025004, 0.3623433, 0, 0, 0, 1, 1,
-0.8455965, -0.78682, -0.4075058, 0, 0, 0, 1, 1,
-0.8436517, -1.580809, -2.631596, 0, 0, 0, 1, 1,
-0.8423943, -1.679855, -0.4255951, 0, 0, 0, 1, 1,
-0.8362792, 1.781673, 0.1593342, 1, 1, 1, 1, 1,
-0.8345404, 0.02465902, -0.2500113, 1, 1, 1, 1, 1,
-0.8345364, 1.804955, 0.3532366, 1, 1, 1, 1, 1,
-0.8261371, -1.033143, -3.430061, 1, 1, 1, 1, 1,
-0.825896, 1.345403, -1.919753, 1, 1, 1, 1, 1,
-0.8198491, -0.1993058, -2.094123, 1, 1, 1, 1, 1,
-0.8151603, 0.2009011, -1.443862, 1, 1, 1, 1, 1,
-0.8105999, -0.0265592, -2.059108, 1, 1, 1, 1, 1,
-0.8102365, 0.08167502, -2.849132, 1, 1, 1, 1, 1,
-0.797453, 2.318377, 0.5171117, 1, 1, 1, 1, 1,
-0.7968993, -1.039594, -1.788299, 1, 1, 1, 1, 1,
-0.7933909, -1.795743, -1.991138, 1, 1, 1, 1, 1,
-0.7922292, 2.190835, -0.06160141, 1, 1, 1, 1, 1,
-0.7849907, -0.1980987, -1.759064, 1, 1, 1, 1, 1,
-0.781072, -0.01550019, -2.660942, 1, 1, 1, 1, 1,
-0.777863, -1.29411, -3.593117, 0, 0, 1, 1, 1,
-0.7768228, -1.425911, -3.217731, 1, 0, 0, 1, 1,
-0.7694579, -0.03381415, -1.96419, 1, 0, 0, 1, 1,
-0.7676812, -0.5386345, -2.166978, 1, 0, 0, 1, 1,
-0.7538031, 1.406475, -1.878475, 1, 0, 0, 1, 1,
-0.7522591, 0.4772473, -1.12278, 1, 0, 0, 1, 1,
-0.7520123, -0.5269435, -0.1405302, 0, 0, 0, 1, 1,
-0.7360121, -0.1187711, -1.938414, 0, 0, 0, 1, 1,
-0.7276448, -0.4013898, 0.06420814, 0, 0, 0, 1, 1,
-0.7251354, 0.1753436, -2.282742, 0, 0, 0, 1, 1,
-0.7228643, 0.2229445, -1.759161, 0, 0, 0, 1, 1,
-0.7223179, 0.9049972, 0.2569612, 0, 0, 0, 1, 1,
-0.7208788, 1.204117, 0.5053666, 0, 0, 0, 1, 1,
-0.7142708, -0.008672101, -0.9817277, 1, 1, 1, 1, 1,
-0.7142584, -1.434925, -4.61621, 1, 1, 1, 1, 1,
-0.709005, 0.5467519, -0.5423358, 1, 1, 1, 1, 1,
-0.7035828, -1.131779, -0.4342475, 1, 1, 1, 1, 1,
-0.6982892, -0.3273694, -1.418682, 1, 1, 1, 1, 1,
-0.6948472, 1.926232, -1.311927, 1, 1, 1, 1, 1,
-0.693872, 1.96434, 0.3265553, 1, 1, 1, 1, 1,
-0.6932291, -0.449122, -1.939909, 1, 1, 1, 1, 1,
-0.6925035, 1.485479, -1.535049, 1, 1, 1, 1, 1,
-0.6908376, -0.5947214, -3.286988, 1, 1, 1, 1, 1,
-0.6837074, -1.170227, -1.00531, 1, 1, 1, 1, 1,
-0.68128, 0.9753088, -1.049485, 1, 1, 1, 1, 1,
-0.6774017, 0.3681235, -0.5603396, 1, 1, 1, 1, 1,
-0.6713699, -0.2788278, -2.339491, 1, 1, 1, 1, 1,
-0.6707653, 0.8867889, -1.579548, 1, 1, 1, 1, 1,
-0.6673751, -0.9360911, -1.405442, 0, 0, 1, 1, 1,
-0.6661533, 0.09263479, 0.3462403, 1, 0, 0, 1, 1,
-0.6494608, -0.371733, -3.992179, 1, 0, 0, 1, 1,
-0.6492181, -0.4138328, -2.05763, 1, 0, 0, 1, 1,
-0.6447767, 0.5874286, -0.7002446, 1, 0, 0, 1, 1,
-0.6445404, 0.181511, -2.264994, 1, 0, 0, 1, 1,
-0.6443392, 1.257916, 1.042623, 0, 0, 0, 1, 1,
-0.6383857, 0.317199, -1.453627, 0, 0, 0, 1, 1,
-0.6264974, 0.9634829, -0.3181628, 0, 0, 0, 1, 1,
-0.6258697, -0.1039061, -0.4318672, 0, 0, 0, 1, 1,
-0.6245866, -0.1428428, -1.266038, 0, 0, 0, 1, 1,
-0.6218364, -1.117872, -2.068968, 0, 0, 0, 1, 1,
-0.6209425, 1.724346, -0.3989956, 0, 0, 0, 1, 1,
-0.6157251, 1.338698, -1.301771, 1, 1, 1, 1, 1,
-0.6091398, 0.6159951, -3.70268, 1, 1, 1, 1, 1,
-0.6080693, 1.635121, -0.6332833, 1, 1, 1, 1, 1,
-0.6070219, 0.4228633, 0.5242751, 1, 1, 1, 1, 1,
-0.6054134, -0.6049606, -1.832131, 1, 1, 1, 1, 1,
-0.6051271, -0.04622912, -1.049063, 1, 1, 1, 1, 1,
-0.6025478, -1.593494, -2.346866, 1, 1, 1, 1, 1,
-0.602104, 0.6847928, -0.5503772, 1, 1, 1, 1, 1,
-0.6013821, 0.1328352, -0.539723, 1, 1, 1, 1, 1,
-0.5950084, -0.4139506, -2.977944, 1, 1, 1, 1, 1,
-0.5944771, -1.33801, -3.469829, 1, 1, 1, 1, 1,
-0.5921256, 1.235097, -0.5716843, 1, 1, 1, 1, 1,
-0.5888407, 0.8688468, -0.3830772, 1, 1, 1, 1, 1,
-0.5808676, 1.075557, 0.196788, 1, 1, 1, 1, 1,
-0.5741501, 0.9029517, -2.07261, 1, 1, 1, 1, 1,
-0.5725077, 0.0540406, -2.313376, 0, 0, 1, 1, 1,
-0.5641055, -0.7000967, -1.812047, 1, 0, 0, 1, 1,
-0.5621973, -0.4673131, -3.056828, 1, 0, 0, 1, 1,
-0.5554242, -0.1965447, -1.499859, 1, 0, 0, 1, 1,
-0.5410829, 0.1462692, -0.24544, 1, 0, 0, 1, 1,
-0.5404441, -0.6469968, -2.31753, 1, 0, 0, 1, 1,
-0.5396059, -1.513525, -1.431281, 0, 0, 0, 1, 1,
-0.5316636, -0.04247329, -0.5421726, 0, 0, 0, 1, 1,
-0.5170848, -0.1515603, -2.175769, 0, 0, 0, 1, 1,
-0.5164134, -0.1711041, -1.681893, 0, 0, 0, 1, 1,
-0.5161585, -0.7077935, -3.191674, 0, 0, 0, 1, 1,
-0.5099758, 0.6165401, 0.6982639, 0, 0, 0, 1, 1,
-0.5054397, -1.754546, -2.380943, 0, 0, 0, 1, 1,
-0.5022504, -0.7992891, -2.346103, 1, 1, 1, 1, 1,
-0.5019359, -1.849314, -1.723966, 1, 1, 1, 1, 1,
-0.4901221, -1.7729, -3.331629, 1, 1, 1, 1, 1,
-0.4774646, -0.207826, -2.209855, 1, 1, 1, 1, 1,
-0.4763539, -0.07887522, -2.160478, 1, 1, 1, 1, 1,
-0.4758234, -1.496207, -2.962446, 1, 1, 1, 1, 1,
-0.4743553, 1.272494, -1.645429, 1, 1, 1, 1, 1,
-0.4713421, 0.2381271, -1.516806, 1, 1, 1, 1, 1,
-0.4705606, 0.1627603, -2.949213, 1, 1, 1, 1, 1,
-0.4647524, -0.1616331, -1.985294, 1, 1, 1, 1, 1,
-0.4607352, 0.7475035, 0.6878668, 1, 1, 1, 1, 1,
-0.4595371, 0.6921671, -0.9650137, 1, 1, 1, 1, 1,
-0.4564926, 0.2261522, -1.683583, 1, 1, 1, 1, 1,
-0.4524115, 0.2882734, 0.04747075, 1, 1, 1, 1, 1,
-0.4489813, 0.04396839, -2.267293, 1, 1, 1, 1, 1,
-0.444859, -1.314877, -2.011203, 0, 0, 1, 1, 1,
-0.4399797, 0.09765469, -2.456752, 1, 0, 0, 1, 1,
-0.4386983, 0.5472596, -0.4512928, 1, 0, 0, 1, 1,
-0.4383038, 1.244044, 0.05850681, 1, 0, 0, 1, 1,
-0.4360447, -0.9301475, -2.498379, 1, 0, 0, 1, 1,
-0.4354618, -0.2503899, -2.508815, 1, 0, 0, 1, 1,
-0.4338185, 0.6812971, -1.053959, 0, 0, 0, 1, 1,
-0.4337634, 0.05225145, -2.895862, 0, 0, 0, 1, 1,
-0.4289832, 1.175979, -0.6565242, 0, 0, 0, 1, 1,
-0.4257962, -0.5889586, -3.739664, 0, 0, 0, 1, 1,
-0.4240639, -1.310692, -0.8211298, 0, 0, 0, 1, 1,
-0.4231054, 1.155833, 0.7810751, 0, 0, 0, 1, 1,
-0.4201496, -1.243008, -4.119204, 0, 0, 0, 1, 1,
-0.4172635, 0.3546814, -0.3818975, 1, 1, 1, 1, 1,
-0.41697, -1.043914, -3.17915, 1, 1, 1, 1, 1,
-0.416274, -0.316252, -0.7959642, 1, 1, 1, 1, 1,
-0.4124513, -0.6467993, -2.511165, 1, 1, 1, 1, 1,
-0.4118128, 3.229007, 0.434553, 1, 1, 1, 1, 1,
-0.4069348, -0.2746818, -0.7784641, 1, 1, 1, 1, 1,
-0.4026937, 0.1519692, -0.5953987, 1, 1, 1, 1, 1,
-0.3999256, 0.5991742, -0.1052156, 1, 1, 1, 1, 1,
-0.3994786, 0.7422368, -1.534441, 1, 1, 1, 1, 1,
-0.3981501, 0.0835685, -1.366906, 1, 1, 1, 1, 1,
-0.3973285, 1.705329, -0.9310555, 1, 1, 1, 1, 1,
-0.3961476, 1.113317, 0.6480065, 1, 1, 1, 1, 1,
-0.3910217, 0.5250954, -2.286665, 1, 1, 1, 1, 1,
-0.3889087, -0.03546451, -1.230249, 1, 1, 1, 1, 1,
-0.3849454, -0.08856258, -3.794893, 1, 1, 1, 1, 1,
-0.3834612, -0.01989846, -3.744446, 0, 0, 1, 1, 1,
-0.3821413, 0.3450142, 0.1582394, 1, 0, 0, 1, 1,
-0.3784049, 1.910673, 0.08834454, 1, 0, 0, 1, 1,
-0.3782702, 0.9563861, -2.149977, 1, 0, 0, 1, 1,
-0.3760177, 0.1930925, -3.005177, 1, 0, 0, 1, 1,
-0.3710767, -0.1387709, -0.2325335, 1, 0, 0, 1, 1,
-0.367915, -0.8228987, -4.002215, 0, 0, 0, 1, 1,
-0.3636242, -2.714603, -2.692239, 0, 0, 0, 1, 1,
-0.3602202, 0.1220266, -0.502784, 0, 0, 0, 1, 1,
-0.3599435, -0.6693693, -4.417279, 0, 0, 0, 1, 1,
-0.3572908, -1.263996, -2.377498, 0, 0, 0, 1, 1,
-0.3524601, 0.3512202, 0.08731356, 0, 0, 0, 1, 1,
-0.3508909, -2.482833, -3.41036, 0, 0, 0, 1, 1,
-0.3482054, -0.7932127, -3.016666, 1, 1, 1, 1, 1,
-0.3481407, -0.4399606, -3.713585, 1, 1, 1, 1, 1,
-0.3455665, 1.454492, -0.05824314, 1, 1, 1, 1, 1,
-0.34494, -0.7255414, -3.542407, 1, 1, 1, 1, 1,
-0.3396975, 0.3097115, -2.515603, 1, 1, 1, 1, 1,
-0.3344734, 1.603516, -0.1821265, 1, 1, 1, 1, 1,
-0.3344102, -0.3475918, -2.26597, 1, 1, 1, 1, 1,
-0.3339989, -0.08641493, -1.732006, 1, 1, 1, 1, 1,
-0.3294249, -0.04965859, -1.840927, 1, 1, 1, 1, 1,
-0.3287393, -1.344953, -3.044982, 1, 1, 1, 1, 1,
-0.3276256, 0.1720615, 0.1104245, 1, 1, 1, 1, 1,
-0.3272279, -0.2529596, -2.955325, 1, 1, 1, 1, 1,
-0.3241313, 1.276159, 0.07255147, 1, 1, 1, 1, 1,
-0.3231821, 0.7922254, -1.205466, 1, 1, 1, 1, 1,
-0.3216711, 1.733873, -0.228293, 1, 1, 1, 1, 1,
-0.3215739, -0.7042746, -2.886974, 0, 0, 1, 1, 1,
-0.3212565, -0.01957996, -2.640564, 1, 0, 0, 1, 1,
-0.3106372, 0.4964351, -2.388016, 1, 0, 0, 1, 1,
-0.3095378, -0.1796021, -3.186332, 1, 0, 0, 1, 1,
-0.3086808, 0.2996777, -1.966834, 1, 0, 0, 1, 1,
-0.3077891, 0.004294598, -1.906347, 1, 0, 0, 1, 1,
-0.3069796, -0.2292677, -0.2452379, 0, 0, 0, 1, 1,
-0.3062513, 1.271829, -1.302928, 0, 0, 0, 1, 1,
-0.3005296, -1.2789, -4.271626, 0, 0, 0, 1, 1,
-0.293482, -0.4403869, -2.305708, 0, 0, 0, 1, 1,
-0.2923301, 0.03605142, -0.6272081, 0, 0, 0, 1, 1,
-0.2860168, -2.30664, -3.428568, 0, 0, 0, 1, 1,
-0.2850753, 2.327341, 0.6296899, 0, 0, 0, 1, 1,
-0.2832036, 0.3308087, -1.645415, 1, 1, 1, 1, 1,
-0.2745862, 0.9356822, 0.5603452, 1, 1, 1, 1, 1,
-0.2733918, 0.4514248, -0.4101732, 1, 1, 1, 1, 1,
-0.2665575, 1.114919, 0.5759319, 1, 1, 1, 1, 1,
-0.2555368, 1.662377, -1.614113, 1, 1, 1, 1, 1,
-0.252624, -0.9320323, -1.549708, 1, 1, 1, 1, 1,
-0.2525975, 0.04875427, -1.209543, 1, 1, 1, 1, 1,
-0.2497809, -0.08776419, -2.589402, 1, 1, 1, 1, 1,
-0.2481504, -1.527503, -4.380232, 1, 1, 1, 1, 1,
-0.2471994, 0.790082, -0.42998, 1, 1, 1, 1, 1,
-0.2471462, -2.415817, -3.99903, 1, 1, 1, 1, 1,
-0.246516, -0.8608133, -4.32721, 1, 1, 1, 1, 1,
-0.244462, 1.135375, 2.001994, 1, 1, 1, 1, 1,
-0.2436495, -0.0514079, -0.9791057, 1, 1, 1, 1, 1,
-0.2425841, -1.26294, -3.274144, 1, 1, 1, 1, 1,
-0.2416719, -0.6188963, -2.806745, 0, 0, 1, 1, 1,
-0.2390204, 0.3187729, -1.972349, 1, 0, 0, 1, 1,
-0.2389075, -1.327345, -2.777321, 1, 0, 0, 1, 1,
-0.237802, -0.8187964, -3.666667, 1, 0, 0, 1, 1,
-0.2366506, 0.1265999, -0.1947752, 1, 0, 0, 1, 1,
-0.2325348, -0.7487141, -1.138144, 1, 0, 0, 1, 1,
-0.2297589, -0.1571581, -3.788337, 0, 0, 0, 1, 1,
-0.2290508, 1.127092, -0.2556756, 0, 0, 0, 1, 1,
-0.2286787, -0.8335282, -3.460734, 0, 0, 0, 1, 1,
-0.2265101, 0.106584, -1.165992, 0, 0, 0, 1, 1,
-0.2177769, 0.4794023, 0.5080559, 0, 0, 0, 1, 1,
-0.214261, 0.9759669, -0.4611757, 0, 0, 0, 1, 1,
-0.2079985, 0.4861287, -0.05604786, 0, 0, 0, 1, 1,
-0.2021009, -0.1496796, -2.128936, 1, 1, 1, 1, 1,
-0.1993969, -1.082877, -2.39604, 1, 1, 1, 1, 1,
-0.1987361, -0.08887832, -3.182874, 1, 1, 1, 1, 1,
-0.1938233, 0.986605, -0.4997435, 1, 1, 1, 1, 1,
-0.1922527, 1.085156, -0.2278524, 1, 1, 1, 1, 1,
-0.1863367, 2.318312, 0.227535, 1, 1, 1, 1, 1,
-0.185455, -0.742838, -3.075366, 1, 1, 1, 1, 1,
-0.1843905, 0.177153, -1.723813, 1, 1, 1, 1, 1,
-0.1836636, -0.0593918, -2.863328, 1, 1, 1, 1, 1,
-0.1726113, 1.472404, -1.163655, 1, 1, 1, 1, 1,
-0.1717122, 2.025568, -1.380234, 1, 1, 1, 1, 1,
-0.1684227, -0.5258696, -3.779078, 1, 1, 1, 1, 1,
-0.1678264, -0.3307608, -2.252192, 1, 1, 1, 1, 1,
-0.1669783, 0.6694452, -2.199492, 1, 1, 1, 1, 1,
-0.165906, -0.8525079, -2.438331, 1, 1, 1, 1, 1,
-0.1658691, -0.1957909, -2.739495, 0, 0, 1, 1, 1,
-0.1655505, -1.030699, -4.29071, 1, 0, 0, 1, 1,
-0.1623764, 0.4644303, -0.5418196, 1, 0, 0, 1, 1,
-0.1599039, -0.1743316, -3.857308, 1, 0, 0, 1, 1,
-0.1593288, -1.206104, -4.064916, 1, 0, 0, 1, 1,
-0.156424, 1.054106, -1.916614, 1, 0, 0, 1, 1,
-0.1561554, 1.967536, -0.9075497, 0, 0, 0, 1, 1,
-0.1561415, 1.945946, -1.137544, 0, 0, 0, 1, 1,
-0.1509504, -0.2754013, -2.034487, 0, 0, 0, 1, 1,
-0.1487655, 0.04150922, -2.370022, 0, 0, 0, 1, 1,
-0.1472964, 0.2841879, 0.0988048, 0, 0, 0, 1, 1,
-0.1452277, -0.7821116, -2.768642, 0, 0, 0, 1, 1,
-0.1417822, -0.7779732, -3.91102, 0, 0, 0, 1, 1,
-0.1408461, 0.1845073, -1.512782, 1, 1, 1, 1, 1,
-0.1402324, -0.7828624, -2.876669, 1, 1, 1, 1, 1,
-0.1365693, 0.1113981, -1.007231, 1, 1, 1, 1, 1,
-0.1356946, -0.944814, -2.247354, 1, 1, 1, 1, 1,
-0.1355196, 0.07661776, 0.6203316, 1, 1, 1, 1, 1,
-0.1352613, -2.016973, -4.012757, 1, 1, 1, 1, 1,
-0.1347697, 0.8188989, -1.660631, 1, 1, 1, 1, 1,
-0.132858, -0.1181121, -2.901585, 1, 1, 1, 1, 1,
-0.1288683, -0.04370683, 0.1025379, 1, 1, 1, 1, 1,
-0.1279044, -0.1913439, -2.08596, 1, 1, 1, 1, 1,
-0.1273628, -0.7407275, -3.9695, 1, 1, 1, 1, 1,
-0.1222677, -1.071634, -0.851003, 1, 1, 1, 1, 1,
-0.1213981, -0.1835742, -2.26746, 1, 1, 1, 1, 1,
-0.1209961, -0.5093157, -1.740781, 1, 1, 1, 1, 1,
-0.11688, 1.047739, 0.06076115, 1, 1, 1, 1, 1,
-0.1161773, 0.2979278, -0.7055001, 0, 0, 1, 1, 1,
-0.1153041, -1.468848, -4.770184, 1, 0, 0, 1, 1,
-0.1121356, -0.7045774, -3.66987, 1, 0, 0, 1, 1,
-0.1119139, -1.529041, -2.55843, 1, 0, 0, 1, 1,
-0.111206, -0.5241078, -2.213103, 1, 0, 0, 1, 1,
-0.1085303, -0.6558119, -3.330786, 1, 0, 0, 1, 1,
-0.101077, 1.341071, -0.7660789, 0, 0, 0, 1, 1,
-0.1002919, -0.2009724, -4.525319, 0, 0, 0, 1, 1,
-0.09620717, 0.8147778, -1.439308, 0, 0, 0, 1, 1,
-0.09583839, 2.272936, 0.1253437, 0, 0, 0, 1, 1,
-0.09318706, -0.03827784, -1.023763, 0, 0, 0, 1, 1,
-0.08695335, 0.792036, -0.562694, 0, 0, 0, 1, 1,
-0.08690793, -0.2905881, -2.685493, 0, 0, 0, 1, 1,
-0.08649612, -0.1598691, -1.851839, 1, 1, 1, 1, 1,
-0.08067553, -1.599238, -3.52177, 1, 1, 1, 1, 1,
-0.07324873, -0.3607569, -2.339423, 1, 1, 1, 1, 1,
-0.06591278, -0.7179121, -3.687994, 1, 1, 1, 1, 1,
-0.06524201, -0.6138082, -3.681739, 1, 1, 1, 1, 1,
-0.06380413, -0.002441134, -1.542193, 1, 1, 1, 1, 1,
-0.05498011, -0.4482608, -4.038472, 1, 1, 1, 1, 1,
-0.05180689, 0.05126145, -3.801455, 1, 1, 1, 1, 1,
-0.05038235, 1.632555, 0.07977194, 1, 1, 1, 1, 1,
-0.04906595, -0.076352, -3.949186, 1, 1, 1, 1, 1,
-0.04813384, 0.1517129, -0.3465099, 1, 1, 1, 1, 1,
-0.04500931, -0.3106097, -4.011703, 1, 1, 1, 1, 1,
-0.04220772, 0.6095536, 1.106465, 1, 1, 1, 1, 1,
-0.04123695, 0.8065286, 1.280161, 1, 1, 1, 1, 1,
-0.04091179, -1.508963, -2.241374, 1, 1, 1, 1, 1,
-0.03889274, -0.9689954, -4.424292, 0, 0, 1, 1, 1,
-0.03820141, 2.130876, 0.9554358, 1, 0, 0, 1, 1,
-0.03787424, 0.0649436, 1.120629, 1, 0, 0, 1, 1,
-0.03613537, -0.06026133, -2.449069, 1, 0, 0, 1, 1,
-0.03317596, 0.2103557, -1.345889, 1, 0, 0, 1, 1,
-0.03282202, 0.29403, 0.5005744, 1, 0, 0, 1, 1,
-0.03197607, 0.6117845, 1.053638, 0, 0, 0, 1, 1,
-0.02889129, 2.166362, -0.8296463, 0, 0, 0, 1, 1,
-0.02820861, 1.05248, 0.08199944, 0, 0, 0, 1, 1,
-0.02393077, -0.3960401, -2.221006, 0, 0, 0, 1, 1,
-0.02372269, -0.3790838, -3.10721, 0, 0, 0, 1, 1,
-0.02367292, -0.6964173, -3.500836, 0, 0, 0, 1, 1,
-0.02322922, 1.362442, -0.1808102, 0, 0, 0, 1, 1,
-0.02274528, 0.7591205, -0.2304309, 1, 1, 1, 1, 1,
-0.02169706, -0.5724469, -2.941573, 1, 1, 1, 1, 1,
-0.02158141, -0.2820492, -3.190097, 1, 1, 1, 1, 1,
-0.01364105, 0.04777832, 0.6277519, 1, 1, 1, 1, 1,
-0.007833378, 1.67871, 0.4795038, 1, 1, 1, 1, 1,
-0.007434095, 0.377027, -1.462524, 1, 1, 1, 1, 1,
-0.006040145, 0.2291837, 1.288589, 1, 1, 1, 1, 1,
-7.741912e-06, 0.2139057, -0.6010609, 1, 1, 1, 1, 1,
0.01137793, -0.9374673, 3.37161, 1, 1, 1, 1, 1,
0.01184786, -0.5799143, 2.911755, 1, 1, 1, 1, 1,
0.01585509, 0.861964, -1.135244, 1, 1, 1, 1, 1,
0.01789476, 1.664454, 0.9964502, 1, 1, 1, 1, 1,
0.02666068, 0.6945958, 1.984045, 1, 1, 1, 1, 1,
0.02707156, -0.08973494, 2.453149, 1, 1, 1, 1, 1,
0.02955103, -0.001088741, 1.080592, 1, 1, 1, 1, 1,
0.03810043, -1.234722, 1.316506, 0, 0, 1, 1, 1,
0.03888002, 1.212148, 0.5560349, 1, 0, 0, 1, 1,
0.04814025, 1.338348, -1.405446, 1, 0, 0, 1, 1,
0.04852286, 0.8565797, -1.568615, 1, 0, 0, 1, 1,
0.04857434, -0.4231379, 3.925556, 1, 0, 0, 1, 1,
0.04910516, -1.084902, 2.525164, 1, 0, 0, 1, 1,
0.05116136, 0.5018808, -0.07467517, 0, 0, 0, 1, 1,
0.05316501, 2.202997, 0.9757738, 0, 0, 0, 1, 1,
0.05343738, -1.545727, 1.946768, 0, 0, 0, 1, 1,
0.05533431, 1.080859, 0.17228, 0, 0, 0, 1, 1,
0.06382295, 0.6819334, 1.061579, 0, 0, 0, 1, 1,
0.06643329, 1.151296, -0.07687596, 0, 0, 0, 1, 1,
0.06943136, 0.8771783, 0.841877, 0, 0, 0, 1, 1,
0.07122868, 1.06695, -0.9404014, 1, 1, 1, 1, 1,
0.07123506, -0.6535084, 2.618622, 1, 1, 1, 1, 1,
0.07202006, -2.491602, 2.962057, 1, 1, 1, 1, 1,
0.07732083, -0.007940701, 1.010445, 1, 1, 1, 1, 1,
0.09077103, -1.027852, 4.770339, 1, 1, 1, 1, 1,
0.09265716, -0.3985432, 4.179222, 1, 1, 1, 1, 1,
0.09390387, 1.633101, 1.421597, 1, 1, 1, 1, 1,
0.09390502, 1.49114, -1.005822, 1, 1, 1, 1, 1,
0.09489739, 0.999616, 0.2018377, 1, 1, 1, 1, 1,
0.0950465, 1.990795, 0.8824195, 1, 1, 1, 1, 1,
0.09563345, 0.7895695, 1.087037, 1, 1, 1, 1, 1,
0.09716965, -0.5248638, 2.823095, 1, 1, 1, 1, 1,
0.09724642, 1.767217, 0.04294489, 1, 1, 1, 1, 1,
0.0988337, -2.846967, 3.206834, 1, 1, 1, 1, 1,
0.1001472, -0.3862847, 4.238724, 1, 1, 1, 1, 1,
0.1016253, 1.266479, 0.9021087, 0, 0, 1, 1, 1,
0.1053163, 0.0443432, 1.181128, 1, 0, 0, 1, 1,
0.1108534, 0.9183226, 0.3893444, 1, 0, 0, 1, 1,
0.1193325, 0.5739769, 1.594783, 1, 0, 0, 1, 1,
0.1239598, -0.2514293, 2.246845, 1, 0, 0, 1, 1,
0.1271293, 2.683136, -0.322847, 1, 0, 0, 1, 1,
0.130781, -0.2937626, 5.436184, 0, 0, 0, 1, 1,
0.1318745, -0.6040041, 2.041257, 0, 0, 0, 1, 1,
0.1344016, 0.0909264, 0.6938108, 0, 0, 0, 1, 1,
0.1348922, 0.278015, -1.465116, 0, 0, 0, 1, 1,
0.1430089, 0.8741397, 0.1098245, 0, 0, 0, 1, 1,
0.1448053, -0.9029812, 3.729546, 0, 0, 0, 1, 1,
0.1459131, 1.996711, 1.385039, 0, 0, 0, 1, 1,
0.146572, 1.45875, -0.5082752, 1, 1, 1, 1, 1,
0.1504901, -0.3450705, 2.040658, 1, 1, 1, 1, 1,
0.1524188, 1.695324, -0.1651556, 1, 1, 1, 1, 1,
0.1585711, -1.7444, 3.317922, 1, 1, 1, 1, 1,
0.1593082, -0.01656554, 2.203808, 1, 1, 1, 1, 1,
0.1609311, -0.6058319, 3.106358, 1, 1, 1, 1, 1,
0.161951, -0.8717691, 4.137743, 1, 1, 1, 1, 1,
0.1626322, 1.451294, -0.1062355, 1, 1, 1, 1, 1,
0.1665104, -0.222396, 1.804039, 1, 1, 1, 1, 1,
0.1675105, -1.01551, 2.355493, 1, 1, 1, 1, 1,
0.1685584, 1.253208, -0.1221898, 1, 1, 1, 1, 1,
0.1771596, 0.0308038, 1.491151, 1, 1, 1, 1, 1,
0.1773656, -2.604573, 3.950675, 1, 1, 1, 1, 1,
0.1783976, 0.1207352, 1.157682, 1, 1, 1, 1, 1,
0.1846463, -1.174968, 3.570174, 1, 1, 1, 1, 1,
0.186417, -0.3174437, 1.527679, 0, 0, 1, 1, 1,
0.1879994, -0.5943898, 1.810708, 1, 0, 0, 1, 1,
0.1909797, -1.105714, 4.05522, 1, 0, 0, 1, 1,
0.1939792, -0.7273623, 2.373626, 1, 0, 0, 1, 1,
0.1951061, 1.580241, -0.7110183, 1, 0, 0, 1, 1,
0.1958145, -0.7329705, 1.607981, 1, 0, 0, 1, 1,
0.2018363, 0.5612943, 2.049986, 0, 0, 0, 1, 1,
0.2027552, 0.2599734, -0.162965, 0, 0, 0, 1, 1,
0.2046834, -0.463449, 2.017354, 0, 0, 0, 1, 1,
0.2063536, 0.3422361, 1.281146, 0, 0, 0, 1, 1,
0.2083146, 1.834196, 0.2795732, 0, 0, 0, 1, 1,
0.2174463, 0.0126753, 0.03484098, 0, 0, 0, 1, 1,
0.2215241, 1.018656, 0.3048548, 0, 0, 0, 1, 1,
0.2215316, -1.373586, 3.19802, 1, 1, 1, 1, 1,
0.2249049, -0.2676758, 3.266334, 1, 1, 1, 1, 1,
0.2266116, -1.884824, 3.325461, 1, 1, 1, 1, 1,
0.2285029, 0.00916656, 1.159444, 1, 1, 1, 1, 1,
0.229737, -1.654956, 4.903473, 1, 1, 1, 1, 1,
0.2304641, 0.6863081, -0.2104481, 1, 1, 1, 1, 1,
0.2314921, 0.4424208, -1.918135, 1, 1, 1, 1, 1,
0.2339945, -0.9706151, 3.298505, 1, 1, 1, 1, 1,
0.2350562, 0.5517981, 1.148459, 1, 1, 1, 1, 1,
0.2405284, -0.04471035, 1.641932, 1, 1, 1, 1, 1,
0.243226, -1.592961, 1.437162, 1, 1, 1, 1, 1,
0.2457308, -0.370531, 1.85125, 1, 1, 1, 1, 1,
0.2458985, -0.2120806, 1.30331, 1, 1, 1, 1, 1,
0.2473924, -1.049542, 2.533746, 1, 1, 1, 1, 1,
0.2478363, -0.5786458, 2.569709, 1, 1, 1, 1, 1,
0.2580079, 0.04628228, 1.740537, 0, 0, 1, 1, 1,
0.2592551, 1.1281, 1.378026, 1, 0, 0, 1, 1,
0.2594245, -1.447207, 0.3217413, 1, 0, 0, 1, 1,
0.259723, 0.4210944, 1.457983, 1, 0, 0, 1, 1,
0.2617413, -1.167112, 3.572798, 1, 0, 0, 1, 1,
0.2623199, 1.008888, 0.2922526, 1, 0, 0, 1, 1,
0.2634621, -1.13253, 5.090729, 0, 0, 0, 1, 1,
0.2657905, 1.136877, -1.865054, 0, 0, 0, 1, 1,
0.2680153, -0.3188306, 1.896697, 0, 0, 0, 1, 1,
0.2685059, 0.6080964, 0.9820846, 0, 0, 0, 1, 1,
0.271003, 0.3087726, 1.219076, 0, 0, 0, 1, 1,
0.2742072, -1.86358, 3.115785, 0, 0, 0, 1, 1,
0.2770293, 1.760738, 0.05941777, 0, 0, 0, 1, 1,
0.277908, -2.236531, 3.403272, 1, 1, 1, 1, 1,
0.2808417, -3.163223, 3.041971, 1, 1, 1, 1, 1,
0.2823953, 0.2021886, 1.303039, 1, 1, 1, 1, 1,
0.2893964, -0.453471, 4.022985, 1, 1, 1, 1, 1,
0.2951838, 0.7565132, 2.157766, 1, 1, 1, 1, 1,
0.2972156, 0.956866, -2.340911, 1, 1, 1, 1, 1,
0.2974943, -0.8776378, 2.289453, 1, 1, 1, 1, 1,
0.3019229, 1.079704, -0.6821114, 1, 1, 1, 1, 1,
0.3068488, -0.2920494, 2.158822, 1, 1, 1, 1, 1,
0.3084497, 0.3661095, -0.5816071, 1, 1, 1, 1, 1,
0.3171347, 1.078309, 1.812509, 1, 1, 1, 1, 1,
0.3197961, 0.3968223, 2.339806, 1, 1, 1, 1, 1,
0.3357432, 0.5233887, -1.517028, 1, 1, 1, 1, 1,
0.3386017, 1.658731, 0.5680881, 1, 1, 1, 1, 1,
0.3386018, 1.240081, 0.9849918, 1, 1, 1, 1, 1,
0.341545, -0.4190749, 3.56278, 0, 0, 1, 1, 1,
0.3420028, -0.3666232, 3.882854, 1, 0, 0, 1, 1,
0.3469203, 0.5031759, 0.2766505, 1, 0, 0, 1, 1,
0.3482255, -1.381634, 3.841608, 1, 0, 0, 1, 1,
0.3491422, 1.553296, -0.2682534, 1, 0, 0, 1, 1,
0.3501937, 0.0738705, 1.592249, 1, 0, 0, 1, 1,
0.3521243, 0.8954691, -0.5982606, 0, 0, 0, 1, 1,
0.3594887, -0.43931, 2.994926, 0, 0, 0, 1, 1,
0.3627409, 1.48581, -0.4847647, 0, 0, 0, 1, 1,
0.36411, 0.1629753, 4.064748, 0, 0, 0, 1, 1,
0.364289, -0.0860838, 2.176841, 0, 0, 0, 1, 1,
0.3676195, 0.1973518, 0.2850589, 0, 0, 0, 1, 1,
0.3717083, -0.6548059, 2.632472, 0, 0, 0, 1, 1,
0.3725109, 0.1767134, 1.796185, 1, 1, 1, 1, 1,
0.3752785, -0.8476616, 2.633815, 1, 1, 1, 1, 1,
0.3786778, -0.1369122, 2.251712, 1, 1, 1, 1, 1,
0.3801604, 0.9814899, 0.2686817, 1, 1, 1, 1, 1,
0.3846967, -0.5108853, 1.091072, 1, 1, 1, 1, 1,
0.3864133, -0.02375389, 1.097036, 1, 1, 1, 1, 1,
0.3886608, -1.07897, 3.612494, 1, 1, 1, 1, 1,
0.3906617, 0.1110909, 0.1353496, 1, 1, 1, 1, 1,
0.3928148, 0.9437802, -0.3519409, 1, 1, 1, 1, 1,
0.3944528, -0.6569738, 1.769859, 1, 1, 1, 1, 1,
0.3982067, 1.739386, -0.5096424, 1, 1, 1, 1, 1,
0.399317, -0.6457403, 0.8052118, 1, 1, 1, 1, 1,
0.4032696, 0.002986461, 1.183696, 1, 1, 1, 1, 1,
0.4036222, -0.1103497, 0.8199138, 1, 1, 1, 1, 1,
0.4050127, -0.4871301, 3.991076, 1, 1, 1, 1, 1,
0.412023, 0.4013942, 0.3596205, 0, 0, 1, 1, 1,
0.4128301, 2.45114, 0.6583156, 1, 0, 0, 1, 1,
0.4144919, -0.3025183, 3.939058, 1, 0, 0, 1, 1,
0.4153345, 0.2274521, 1.211275, 1, 0, 0, 1, 1,
0.415728, 0.403387, 0.253855, 1, 0, 0, 1, 1,
0.4172502, 2.124127, -0.08635166, 1, 0, 0, 1, 1,
0.4174928, 0.4636925, 0.07806481, 0, 0, 0, 1, 1,
0.4199478, 1.52176, -0.3044192, 0, 0, 0, 1, 1,
0.4247733, 1.661352, -1.186527, 0, 0, 0, 1, 1,
0.4257781, 0.8434828, 0.8447904, 0, 0, 0, 1, 1,
0.4323649, 0.0645605, 2.496901, 0, 0, 0, 1, 1,
0.4324979, -0.5851196, 1.886104, 0, 0, 0, 1, 1,
0.4369366, -0.1061985, 1.459031, 0, 0, 0, 1, 1,
0.4388961, -1.396849, 3.085526, 1, 1, 1, 1, 1,
0.4403097, -0.8076463, 1.25896, 1, 1, 1, 1, 1,
0.4465961, -2.158054, 3.34622, 1, 1, 1, 1, 1,
0.4474658, 0.05520068, 0.5314307, 1, 1, 1, 1, 1,
0.4522227, -0.7034473, 3.614273, 1, 1, 1, 1, 1,
0.4543791, -0.6721782, 2.575553, 1, 1, 1, 1, 1,
0.4567382, -0.02996109, 0.2244792, 1, 1, 1, 1, 1,
0.4628593, 0.1834963, 1.875171, 1, 1, 1, 1, 1,
0.464805, 0.0762137, 0.6053956, 1, 1, 1, 1, 1,
0.4658714, -0.7763448, 2.344358, 1, 1, 1, 1, 1,
0.4701338, -0.3563481, 2.38486, 1, 1, 1, 1, 1,
0.4701574, -0.3985048, 2.147456, 1, 1, 1, 1, 1,
0.4748962, 0.8675487, 2.033585, 1, 1, 1, 1, 1,
0.4772747, -1.677544, 1.107731, 1, 1, 1, 1, 1,
0.4794054, -0.1056032, 2.714648, 1, 1, 1, 1, 1,
0.4829619, 0.6828186, 0.4068753, 0, 0, 1, 1, 1,
0.4857814, -0.6681928, 2.485051, 1, 0, 0, 1, 1,
0.4883868, 1.07963, -1.908, 1, 0, 0, 1, 1,
0.4903931, 1.044267, 0.07886088, 1, 0, 0, 1, 1,
0.4904831, 0.7311871, 0.3071302, 1, 0, 0, 1, 1,
0.4927942, 0.2812538, 1.305242, 1, 0, 0, 1, 1,
0.4946105, -0.6437227, 3.918616, 0, 0, 0, 1, 1,
0.4963148, 0.5974272, 1.633229, 0, 0, 0, 1, 1,
0.497892, 1.433039, 1.347263, 0, 0, 0, 1, 1,
0.5013581, 1.622639, 1.304662, 0, 0, 0, 1, 1,
0.501579, -1.762043, 3.070668, 0, 0, 0, 1, 1,
0.5056828, -0.5037704, 2.907347, 0, 0, 0, 1, 1,
0.5118421, -1.92782, 1.720851, 0, 0, 0, 1, 1,
0.5127801, -0.4002746, 3.820776, 1, 1, 1, 1, 1,
0.5161813, -0.4994359, 1.196445, 1, 1, 1, 1, 1,
0.5183703, -0.2139768, 1.149516, 1, 1, 1, 1, 1,
0.5202321, -0.2314079, 0.9291244, 1, 1, 1, 1, 1,
0.5229282, 0.204783, 2.440371, 1, 1, 1, 1, 1,
0.5230942, 1.349925, 0.03859615, 1, 1, 1, 1, 1,
0.5240142, 1.308681, -0.1990505, 1, 1, 1, 1, 1,
0.5307156, 0.0037461, 3.266443, 1, 1, 1, 1, 1,
0.531358, -0.3706054, 3.701972, 1, 1, 1, 1, 1,
0.532078, 0.1017129, -0.09396267, 1, 1, 1, 1, 1,
0.5321767, -0.04018342, -0.433333, 1, 1, 1, 1, 1,
0.5345415, 0.5080006, 1.367404, 1, 1, 1, 1, 1,
0.5352846, 0.9583382, 0.8210922, 1, 1, 1, 1, 1,
0.5355601, -0.3036875, 2.796947, 1, 1, 1, 1, 1,
0.5395031, -0.4508213, 2.03877, 1, 1, 1, 1, 1,
0.5405209, -0.5581787, 2.964023, 0, 0, 1, 1, 1,
0.5438237, 0.8528029, 0.3080312, 1, 0, 0, 1, 1,
0.5473022, -0.6903006, 1.610337, 1, 0, 0, 1, 1,
0.5498511, 0.9887869, 0.1030473, 1, 0, 0, 1, 1,
0.562051, 0.1974104, -0.5063288, 1, 0, 0, 1, 1,
0.5652601, 1.33625, 0.9704161, 1, 0, 0, 1, 1,
0.5718844, 0.005491281, 0.6155748, 0, 0, 0, 1, 1,
0.5749593, -2.736415, 2.397078, 0, 0, 0, 1, 1,
0.5804048, 1.434883, -0.2306338, 0, 0, 0, 1, 1,
0.584131, 0.3234764, 2.796748, 0, 0, 0, 1, 1,
0.5846798, 0.6384938, -0.09580161, 0, 0, 0, 1, 1,
0.5875048, -1.037565, 2.64243, 0, 0, 0, 1, 1,
0.5883449, 1.680099, 0.7904441, 0, 0, 0, 1, 1,
0.5883688, 1.117928, 0.8712868, 1, 1, 1, 1, 1,
0.591055, 0.4545099, -0.01362414, 1, 1, 1, 1, 1,
0.5957026, -1.754907, 3.893661, 1, 1, 1, 1, 1,
0.5966589, 0.3180721, -1.306478, 1, 1, 1, 1, 1,
0.597854, -0.9115484, 3.593576, 1, 1, 1, 1, 1,
0.6026692, -0.067132, 1.174399, 1, 1, 1, 1, 1,
0.6093786, -1.31706, 3.360044, 1, 1, 1, 1, 1,
0.6182291, -1.947409, 1.702118, 1, 1, 1, 1, 1,
0.6193144, 1.44548, 0.3025383, 1, 1, 1, 1, 1,
0.62065, -0.2199868, 1.163153, 1, 1, 1, 1, 1,
0.6218932, -2.013923, 2.547461, 1, 1, 1, 1, 1,
0.6241155, -0.07545516, 1.320966, 1, 1, 1, 1, 1,
0.628856, -0.9754313, 1.456461, 1, 1, 1, 1, 1,
0.6324051, 1.123023, 2.155407, 1, 1, 1, 1, 1,
0.6347448, -1.305297, 4.062929, 1, 1, 1, 1, 1,
0.637423, -1.345486, 3.043567, 0, 0, 1, 1, 1,
0.6401404, 0.6629329, 0.5328715, 1, 0, 0, 1, 1,
0.6510973, 1.884067, 0.9135048, 1, 0, 0, 1, 1,
0.6511198, 0.7649612, 1.72443, 1, 0, 0, 1, 1,
0.6531001, -0.6561038, 2.194569, 1, 0, 0, 1, 1,
0.6574935, -1.86195, 2.469438, 1, 0, 0, 1, 1,
0.6626008, 1.533514, 0.7805067, 0, 0, 0, 1, 1,
0.6648229, -0.1038578, 2.410963, 0, 0, 0, 1, 1,
0.6655964, 0.5049913, -0.3599335, 0, 0, 0, 1, 1,
0.6739941, -1.193657, 1.297734, 0, 0, 0, 1, 1,
0.6756463, -0.1717362, 1.86638, 0, 0, 0, 1, 1,
0.6789833, 0.4172593, 2.413003, 0, 0, 0, 1, 1,
0.6800888, -0.8515103, 3.550997, 0, 0, 0, 1, 1,
0.684649, -0.5988356, 2.078751, 1, 1, 1, 1, 1,
0.6905932, 0.9294603, 1.189419, 1, 1, 1, 1, 1,
0.695638, -1.003215, 2.827351, 1, 1, 1, 1, 1,
0.6958466, -0.4762137, 1.452449, 1, 1, 1, 1, 1,
0.7002923, 0.5160306, 0.02146535, 1, 1, 1, 1, 1,
0.7015243, -1.019242, 2.431888, 1, 1, 1, 1, 1,
0.7033029, 0.1879896, 1.59083, 1, 1, 1, 1, 1,
0.7034457, 0.3507526, -0.5679455, 1, 1, 1, 1, 1,
0.7044449, -0.6306605, 1.73767, 1, 1, 1, 1, 1,
0.7049363, -0.3631928, 1.459452, 1, 1, 1, 1, 1,
0.7107679, -0.04750245, 0.7974062, 1, 1, 1, 1, 1,
0.7111665, -0.2805785, 1.723509, 1, 1, 1, 1, 1,
0.7155254, 0.7224631, -0.005825755, 1, 1, 1, 1, 1,
0.7160707, -0.09679289, 3.040043, 1, 1, 1, 1, 1,
0.7390299, 1.233019, 0.7698733, 1, 1, 1, 1, 1,
0.7438412, 0.7518637, 1.045663, 0, 0, 1, 1, 1,
0.7460696, 0.2739871, 1.517889, 1, 0, 0, 1, 1,
0.7472786, 0.9437093, 0.5148624, 1, 0, 0, 1, 1,
0.7545288, -2.033604, 2.465509, 1, 0, 0, 1, 1,
0.7553834, 2.059656, -0.1132285, 1, 0, 0, 1, 1,
0.7605163, 0.7320753, 0.1244052, 1, 0, 0, 1, 1,
0.763061, -0.02162338, 1.30549, 0, 0, 0, 1, 1,
0.7686031, 0.6221975, 0.5585956, 0, 0, 0, 1, 1,
0.770671, 0.5104439, 2.417331, 0, 0, 0, 1, 1,
0.7709858, 0.7862056, 1.567701, 0, 0, 0, 1, 1,
0.7710257, -2.138685, 1.860307, 0, 0, 0, 1, 1,
0.7759616, -0.609688, 3.112711, 0, 0, 0, 1, 1,
0.7810926, 0.037972, 3.527847, 0, 0, 0, 1, 1,
0.7819312, -0.5852276, 0.4910307, 1, 1, 1, 1, 1,
0.7890654, 0.5830464, 1.922635, 1, 1, 1, 1, 1,
0.7908559, 0.2507198, 2.670303, 1, 1, 1, 1, 1,
0.7954388, 2.701385, -0.7008587, 1, 1, 1, 1, 1,
0.7955491, -0.4975566, 0.981445, 1, 1, 1, 1, 1,
0.7967901, 1.354173, 0.1089056, 1, 1, 1, 1, 1,
0.7968183, -1.899672, 1.021734, 1, 1, 1, 1, 1,
0.7986549, 1.449983, 0.4528492, 1, 1, 1, 1, 1,
0.8009282, -0.06223931, 1.760714, 1, 1, 1, 1, 1,
0.8018836, -1.011732, 2.894294, 1, 1, 1, 1, 1,
0.8032527, 1.125379, -0.5884207, 1, 1, 1, 1, 1,
0.8046897, 1.290111, 2.284843, 1, 1, 1, 1, 1,
0.8137215, -1.623454, 2.721358, 1, 1, 1, 1, 1,
0.8142273, 0.3664907, -0.1293216, 1, 1, 1, 1, 1,
0.817475, 1.252046, -0.3264793, 1, 1, 1, 1, 1,
0.8177547, -1.340289, 1.157047, 0, 0, 1, 1, 1,
0.8211372, 0.2617293, 0.09551506, 1, 0, 0, 1, 1,
0.8312077, 0.7546859, 1.338446, 1, 0, 0, 1, 1,
0.8324219, 0.4370846, 1.562018, 1, 0, 0, 1, 1,
0.8353006, 0.2576116, 1.541054, 1, 0, 0, 1, 1,
0.853751, -0.08450153, -0.07349641, 1, 0, 0, 1, 1,
0.8540008, -0.08869959, 1.359134, 0, 0, 0, 1, 1,
0.8562871, 0.5206475, 2.084064, 0, 0, 0, 1, 1,
0.8572969, -0.3967099, 3.241008, 0, 0, 0, 1, 1,
0.8584278, 0.3657824, 0.2031462, 0, 0, 0, 1, 1,
0.8620749, 0.1775202, 2.344368, 0, 0, 0, 1, 1,
0.865585, -0.1705429, 1.966909, 0, 0, 0, 1, 1,
0.8689054, 0.5218607, 0.1807712, 0, 0, 0, 1, 1,
0.8727317, -0.9118195, 2.026599, 1, 1, 1, 1, 1,
0.8732952, -0.4090448, 2.269052, 1, 1, 1, 1, 1,
0.8770258, 1.851596, -0.1460104, 1, 1, 1, 1, 1,
0.8770298, 1.345681, 1.471141, 1, 1, 1, 1, 1,
0.8771288, 0.2002653, 2.332736, 1, 1, 1, 1, 1,
0.8806444, 0.1061584, 1.870063, 1, 1, 1, 1, 1,
0.8810477, 0.2336239, 0.006001243, 1, 1, 1, 1, 1,
0.8851525, -0.6664302, 0.3417212, 1, 1, 1, 1, 1,
0.8870637, 0.6552144, 3.435003, 1, 1, 1, 1, 1,
0.8949893, 0.9053285, 0.9332827, 1, 1, 1, 1, 1,
0.9020997, 1.904309, -0.8028853, 1, 1, 1, 1, 1,
0.906413, 0.649285, 2.134124, 1, 1, 1, 1, 1,
0.9204094, -1.132294, -0.001602945, 1, 1, 1, 1, 1,
0.9219614, 0.5783106, -0.3582553, 1, 1, 1, 1, 1,
0.9224094, 0.2086594, 1.402364, 1, 1, 1, 1, 1,
0.9392284, 0.9195906, 0.4988568, 0, 0, 1, 1, 1,
0.9535398, 1.071463, 0.3043481, 1, 0, 0, 1, 1,
0.9543816, -1.000675, 1.586885, 1, 0, 0, 1, 1,
0.9546859, -0.6097237, 1.915114, 1, 0, 0, 1, 1,
0.9633158, -0.6595776, 3.233569, 1, 0, 0, 1, 1,
0.9649705, 0.4616772, 0.8470818, 1, 0, 0, 1, 1,
0.9661445, -0.7763162, 0.1841343, 0, 0, 0, 1, 1,
0.9753813, -2.057058, 3.374471, 0, 0, 0, 1, 1,
0.9766172, 1.006974, 1.192528, 0, 0, 0, 1, 1,
0.976711, 0.6224926, 1.37748, 0, 0, 0, 1, 1,
0.9832422, 0.5559542, 0.7732353, 0, 0, 0, 1, 1,
0.9853573, 0.210232, 2.530417, 0, 0, 0, 1, 1,
0.9871277, 1.554092, 0.158373, 0, 0, 0, 1, 1,
0.987817, -0.6686647, 2.49944, 1, 1, 1, 1, 1,
0.9894794, -0.5638635, 4.043173, 1, 1, 1, 1, 1,
0.9944996, 0.3934617, -0.270259, 1, 1, 1, 1, 1,
0.9994259, -0.6654101, 0.6996601, 1, 1, 1, 1, 1,
1.004534, 0.6273177, 0.4435578, 1, 1, 1, 1, 1,
1.011958, 0.08908404, 2.114726, 1, 1, 1, 1, 1,
1.015258, 0.191741, 0.8682919, 1, 1, 1, 1, 1,
1.016258, 0.1801072, 2.74734, 1, 1, 1, 1, 1,
1.020227, 0.6680068, -0.2667778, 1, 1, 1, 1, 1,
1.024645, -0.5630235, 1.574417, 1, 1, 1, 1, 1,
1.025963, 0.4823775, 1.959044, 1, 1, 1, 1, 1,
1.026226, 1.692475, -1.062354, 1, 1, 1, 1, 1,
1.04377, 0.6135862, -0.1493889, 1, 1, 1, 1, 1,
1.060399, -0.6736302, 1.852993, 1, 1, 1, 1, 1,
1.062601, -0.2147887, 0.545044, 1, 1, 1, 1, 1,
1.062634, -1.722453, 1.454288, 0, 0, 1, 1, 1,
1.064321, 2.046481, 1.624212, 1, 0, 0, 1, 1,
1.068515, 0.4500957, 1.169275, 1, 0, 0, 1, 1,
1.070935, 0.9209849, 0.03960197, 1, 0, 0, 1, 1,
1.072526, -0.8353498, 2.700761, 1, 0, 0, 1, 1,
1.076192, 0.4080316, 0.9724019, 1, 0, 0, 1, 1,
1.076677, 0.04993913, 2.543208, 0, 0, 0, 1, 1,
1.085138, 0.5589668, -0.4993151, 0, 0, 0, 1, 1,
1.08985, 1.189855, 1.726945, 0, 0, 0, 1, 1,
1.095614, 0.8166385, 0.7302428, 0, 0, 0, 1, 1,
1.10587, 0.5171527, -0.2965046, 0, 0, 0, 1, 1,
1.107519, -0.8816254, 1.069528, 0, 0, 0, 1, 1,
1.108063, 0.7792737, 1.817822, 0, 0, 0, 1, 1,
1.108977, 0.2995467, 2.990145, 1, 1, 1, 1, 1,
1.110808, 0.5574266, 0.288382, 1, 1, 1, 1, 1,
1.119731, 0.1019036, 2.26897, 1, 1, 1, 1, 1,
1.120172, 1.552477, -0.278308, 1, 1, 1, 1, 1,
1.120892, -0.7750763, 1.051059, 1, 1, 1, 1, 1,
1.127233, -1.22536, 3.17987, 1, 1, 1, 1, 1,
1.130002, -1.307452, 3.74083, 1, 1, 1, 1, 1,
1.132451, 0.6619591, 1.957087, 1, 1, 1, 1, 1,
1.132993, -0.646785, 1.589565, 1, 1, 1, 1, 1,
1.137491, 1.291236, 0.710396, 1, 1, 1, 1, 1,
1.139269, -1.455844, 3.489993, 1, 1, 1, 1, 1,
1.143988, -1.528719, 1.919173, 1, 1, 1, 1, 1,
1.149172, 1.541835, 0.5290569, 1, 1, 1, 1, 1,
1.150539, 0.6455924, 1.148984, 1, 1, 1, 1, 1,
1.153196, 2.017429, 1.146969, 1, 1, 1, 1, 1,
1.155163, -0.9404609, 4.742509, 0, 0, 1, 1, 1,
1.155951, -1.757437, 2.326576, 1, 0, 0, 1, 1,
1.156788, 1.831602, -1.213701, 1, 0, 0, 1, 1,
1.161237, 0.3854783, 3.180322, 1, 0, 0, 1, 1,
1.162678, -0.8619678, 1.479241, 1, 0, 0, 1, 1,
1.163016, 0.463803, -0.8944981, 1, 0, 0, 1, 1,
1.165595, 0.3081135, 2.956237, 0, 0, 0, 1, 1,
1.172285, 0.01440993, 0.67152, 0, 0, 0, 1, 1,
1.184745, -0.9337698, 3.177733, 0, 0, 0, 1, 1,
1.189288, 0.1140397, 2.527309, 0, 0, 0, 1, 1,
1.196308, -0.7330655, 0.9892085, 0, 0, 0, 1, 1,
1.196603, 0.1840127, 2.147597, 0, 0, 0, 1, 1,
1.199593, 0.7244285, 2.066671, 0, 0, 0, 1, 1,
1.201598, -1.458792, 0.4723997, 1, 1, 1, 1, 1,
1.20194, 0.7008303, 1.54128, 1, 1, 1, 1, 1,
1.212598, 0.2197568, 1.671332, 1, 1, 1, 1, 1,
1.216379, -0.5851021, 3.588574, 1, 1, 1, 1, 1,
1.221655, -0.3417438, 1.468933, 1, 1, 1, 1, 1,
1.246916, -0.2234713, 3.748897, 1, 1, 1, 1, 1,
1.256197, 0.1629658, 2.711575, 1, 1, 1, 1, 1,
1.271698, 2.549347, 0.8491648, 1, 1, 1, 1, 1,
1.275406, 0.432339, 1.077388, 1, 1, 1, 1, 1,
1.27598, 0.8138098, 0.6838965, 1, 1, 1, 1, 1,
1.283748, -0.4766054, 2.662767, 1, 1, 1, 1, 1,
1.290879, 0.6527032, 0.5740225, 1, 1, 1, 1, 1,
1.292713, -0.1946802, 1.749794, 1, 1, 1, 1, 1,
1.292993, -0.4651304, 2.58679, 1, 1, 1, 1, 1,
1.29384, -0.5858839, -0.1136209, 1, 1, 1, 1, 1,
1.318936, 0.9158258, 0.9872454, 0, 0, 1, 1, 1,
1.320456, 0.2862262, 1.367088, 1, 0, 0, 1, 1,
1.324678, -0.6114318, 1.568978, 1, 0, 0, 1, 1,
1.330221, -0.8187368, 0.5993036, 1, 0, 0, 1, 1,
1.346424, 1.475725, 1.490691, 1, 0, 0, 1, 1,
1.349133, -1.81265, 2.197833, 1, 0, 0, 1, 1,
1.356904, -0.1651444, 2.029926, 0, 0, 0, 1, 1,
1.359735, 0.2034231, 2.03829, 0, 0, 0, 1, 1,
1.361349, -0.6074457, 2.680422, 0, 0, 0, 1, 1,
1.376262, -0.5768417, 1.760571, 0, 0, 0, 1, 1,
1.393517, -0.6353624, 0.545607, 0, 0, 0, 1, 1,
1.39746, 0.559555, -0.112216, 0, 0, 0, 1, 1,
1.405483, 0.303284, 1.230383, 0, 0, 0, 1, 1,
1.410357, 0.8845124, 1.372853, 1, 1, 1, 1, 1,
1.412116, -0.3725428, 1.53915, 1, 1, 1, 1, 1,
1.414662, 0.3533904, 1.260071, 1, 1, 1, 1, 1,
1.416444, 0.501523, 1.223587, 1, 1, 1, 1, 1,
1.425991, -1.101226, 2.031184, 1, 1, 1, 1, 1,
1.427664, 1.097097, -1.459094, 1, 1, 1, 1, 1,
1.436159, 0.4648297, 1.227866, 1, 1, 1, 1, 1,
1.437643, -0.05506112, 1.992213, 1, 1, 1, 1, 1,
1.443914, -0.8524021, 2.716683, 1, 1, 1, 1, 1,
1.451061, -1.127164, 1.068683, 1, 1, 1, 1, 1,
1.453222, 1.349041, 1.067528, 1, 1, 1, 1, 1,
1.460169, -1.003677, 1.778515, 1, 1, 1, 1, 1,
1.467329, -1.217891, 3.360982, 1, 1, 1, 1, 1,
1.469997, 0.9283142, 1.179757, 1, 1, 1, 1, 1,
1.475318, 0.05694595, 0.8152548, 1, 1, 1, 1, 1,
1.477904, 0.02405216, 0.7174466, 0, 0, 1, 1, 1,
1.479924, 0.7391686, 1.922736, 1, 0, 0, 1, 1,
1.481487, -0.3647641, 2.452726, 1, 0, 0, 1, 1,
1.491785, -1.352915, 2.14949, 1, 0, 0, 1, 1,
1.499803, 0.06770702, 2.469062, 1, 0, 0, 1, 1,
1.501928, -1.585548, 3.2915, 1, 0, 0, 1, 1,
1.509886, 0.4350796, 0.3442129, 0, 0, 0, 1, 1,
1.530525, -0.7171741, 3.347199, 0, 0, 0, 1, 1,
1.530627, -0.692543, 1.848782, 0, 0, 0, 1, 1,
1.535264, -0.1179424, 0.908086, 0, 0, 0, 1, 1,
1.543433, -1.069435, 1.49708, 0, 0, 0, 1, 1,
1.548229, -0.4580533, 2.589531, 0, 0, 0, 1, 1,
1.551866, -0.4889296, 1.450632, 0, 0, 0, 1, 1,
1.5562, -2.054449, 2.562488, 1, 1, 1, 1, 1,
1.576025, -0.8520274, 4.551297, 1, 1, 1, 1, 1,
1.577082, -0.4189134, 1.105487, 1, 1, 1, 1, 1,
1.590872, 2.223871, 0.1422511, 1, 1, 1, 1, 1,
1.60255, 1.097316, 0.5900706, 1, 1, 1, 1, 1,
1.607848, -0.7203638, 1.946494, 1, 1, 1, 1, 1,
1.628778, 0.08162927, 0.1240222, 1, 1, 1, 1, 1,
1.669428, 0.471322, 1.858754, 1, 1, 1, 1, 1,
1.678423, -1.686216, 0.6865043, 1, 1, 1, 1, 1,
1.682229, 1.175342, 2.663973, 1, 1, 1, 1, 1,
1.685694, 0.397905, 1.375374, 1, 1, 1, 1, 1,
1.701607, 0.1235675, 2.516107, 1, 1, 1, 1, 1,
1.709387, -0.1957622, -0.7034177, 1, 1, 1, 1, 1,
1.74295, -1.32902, 0.8630649, 1, 1, 1, 1, 1,
1.748764, -0.5434577, 3.182697, 1, 1, 1, 1, 1,
1.754802, -0.6016431, 2.189427, 0, 0, 1, 1, 1,
1.761284, -1.089434, 1.242915, 1, 0, 0, 1, 1,
1.768609, -0.7732501, 3.284755, 1, 0, 0, 1, 1,
1.773667, 0.6443793, 1.231593, 1, 0, 0, 1, 1,
1.779788, -1.356037, 3.979119, 1, 0, 0, 1, 1,
1.843386, 0.3998081, 2.05973, 1, 0, 0, 1, 1,
1.847477, -0.5600575, 1.96685, 0, 0, 0, 1, 1,
1.855251, -1.077746, 2.050086, 0, 0, 0, 1, 1,
1.859472, -1.597521, 1.542222, 0, 0, 0, 1, 1,
1.892548, -1.090734, 1.667178, 0, 0, 0, 1, 1,
1.910286, 0.4558539, 2.982599, 0, 0, 0, 1, 1,
1.920169, -0.3198743, 0.4102505, 0, 0, 0, 1, 1,
1.927859, -0.06276974, 1.316032, 0, 0, 0, 1, 1,
1.942728, -1.268245, 1.716849, 1, 1, 1, 1, 1,
1.953973, 0.3687248, 2.765198, 1, 1, 1, 1, 1,
1.96603, -0.0251411, 1.419922, 1, 1, 1, 1, 1,
1.973398, 1.735636, 0.9380844, 1, 1, 1, 1, 1,
1.99565, 2.025031, 0.2411677, 1, 1, 1, 1, 1,
2.000145, -0.5974169, 2.744881, 1, 1, 1, 1, 1,
2.000361, -1.513534, 3.169334, 1, 1, 1, 1, 1,
2.005516, 0.3737986, -0.01418028, 1, 1, 1, 1, 1,
2.036986, 0.1914757, 0.8126156, 1, 1, 1, 1, 1,
2.051717, -0.3708406, 2.257972, 1, 1, 1, 1, 1,
2.092631, -0.5577501, 1.721859, 1, 1, 1, 1, 1,
2.102588, 0.9952166, -1.263172, 1, 1, 1, 1, 1,
2.10955, 0.2587526, 1.360204, 1, 1, 1, 1, 1,
2.119659, -0.1669552, 0.3586962, 1, 1, 1, 1, 1,
2.128019, -0.3145896, 2.732453, 1, 1, 1, 1, 1,
2.15421, -0.6931249, 0.8141074, 0, 0, 1, 1, 1,
2.179895, -0.3104857, 3.897676, 1, 0, 0, 1, 1,
2.200877, -0.6463494, 3.487195, 1, 0, 0, 1, 1,
2.252698, -0.2302946, 0.6284699, 1, 0, 0, 1, 1,
2.282748, 0.4758482, 1.482415, 1, 0, 0, 1, 1,
2.283522, -1.933954, 3.177419, 1, 0, 0, 1, 1,
2.343128, 1.207638, -0.08302741, 0, 0, 0, 1, 1,
2.374146, 1.379138, 1.495769, 0, 0, 0, 1, 1,
2.417131, -0.8233864, 2.157732, 0, 0, 0, 1, 1,
2.428329, 1.130599, 1.437737, 0, 0, 0, 1, 1,
2.46932, -1.551738, 1.164329, 0, 0, 0, 1, 1,
2.491076, -0.06569372, 1.479213, 0, 0, 0, 1, 1,
2.527264, -0.3577471, 1.189959, 0, 0, 0, 1, 1,
2.563639, 0.6735963, 2.073995, 1, 1, 1, 1, 1,
2.56414, -0.7420763, 0.6932248, 1, 1, 1, 1, 1,
2.569479, 0.4204831, 0.6524385, 1, 1, 1, 1, 1,
2.720896, -0.1695941, 1.85226, 1, 1, 1, 1, 1,
2.758138, -0.4500598, 0.7543647, 1, 1, 1, 1, 1,
2.899399, 0.3423275, 1.163026, 1, 1, 1, 1, 1,
3.505593, 0.1717122, 0.116328, 1, 1, 1, 1, 1
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
var radius = 9.478824;
var distance = 33.29396;
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
mvMatrix.translate( -0.3335111, -0.03289199, -0.1719217 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29396);
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
