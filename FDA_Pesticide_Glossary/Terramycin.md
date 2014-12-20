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
-4.013275, 1.431611, -0.6560915, 1, 0, 0, 1,
-3.059001, 0.5552548, -0.1910497, 1, 0.007843138, 0, 1,
-2.906595, 0.8917844, -0.1237862, 1, 0.01176471, 0, 1,
-2.733054, 1.898437, -1.420694, 1, 0.01960784, 0, 1,
-2.703533, 0.5286809, 0.4162227, 1, 0.02352941, 0, 1,
-2.692205, 1.031629, -1.034733, 1, 0.03137255, 0, 1,
-2.622085, -0.4201852, -1.504853, 1, 0.03529412, 0, 1,
-2.457991, 1.083838, -1.237169, 1, 0.04313726, 0, 1,
-2.427418, -0.4615915, -1.793163, 1, 0.04705882, 0, 1,
-2.403845, -0.7311239, -2.393309, 1, 0.05490196, 0, 1,
-2.399314, -0.2044738, -1.356297, 1, 0.05882353, 0, 1,
-2.388936, -0.04047477, -1.065317, 1, 0.06666667, 0, 1,
-2.375421, -0.2653085, -2.068545, 1, 0.07058824, 0, 1,
-2.345131, 0.4276161, -2.345167, 1, 0.07843138, 0, 1,
-2.291511, -0.9537141, -2.762656, 1, 0.08235294, 0, 1,
-2.252563, -1.728732, -2.048133, 1, 0.09019608, 0, 1,
-2.24562, 1.512447, 0.124847, 1, 0.09411765, 0, 1,
-2.235386, -0.8141295, -2.233465, 1, 0.1019608, 0, 1,
-2.210929, 0.7797053, -0.7633268, 1, 0.1098039, 0, 1,
-2.196048, -0.4884, -1.408079, 1, 0.1137255, 0, 1,
-2.138056, 1.093277, 0.08185559, 1, 0.1215686, 0, 1,
-2.12014, -0.737339, -2.549455, 1, 0.1254902, 0, 1,
-2.077361, -0.07153636, -2.029149, 1, 0.1333333, 0, 1,
-2.000039, 1.043483, 0.1086215, 1, 0.1372549, 0, 1,
-1.973525, -0.5398591, -3.003456, 1, 0.145098, 0, 1,
-1.969231, 0.2635857, -1.771311, 1, 0.1490196, 0, 1,
-1.95975, 1.934839, 1.297659, 1, 0.1568628, 0, 1,
-1.94427, -0.08300675, -1.223519, 1, 0.1607843, 0, 1,
-1.938845, 0.1264166, -0.3693266, 1, 0.1686275, 0, 1,
-1.9267, -0.6968967, -0.4953032, 1, 0.172549, 0, 1,
-1.913871, 1.258212, 0.1093103, 1, 0.1803922, 0, 1,
-1.907971, 1.373623, -0.6088999, 1, 0.1843137, 0, 1,
-1.89196, 1.962039, 0.4319217, 1, 0.1921569, 0, 1,
-1.86822, -0.8265943, -1.836066, 1, 0.1960784, 0, 1,
-1.865931, -0.03710422, -1.405968, 1, 0.2039216, 0, 1,
-1.863352, -1.378907, -2.340953, 1, 0.2117647, 0, 1,
-1.819526, -1.757491, -1.389917, 1, 0.2156863, 0, 1,
-1.804945, -0.1066879, -2.509235, 1, 0.2235294, 0, 1,
-1.798429, 0.840438, -1.029657, 1, 0.227451, 0, 1,
-1.784695, 0.2405953, 0.8291931, 1, 0.2352941, 0, 1,
-1.780056, 0.8253191, -1.23787, 1, 0.2392157, 0, 1,
-1.77477, 0.4581007, -2.136283, 1, 0.2470588, 0, 1,
-1.765065, 0.4087769, -2.527775, 1, 0.2509804, 0, 1,
-1.758496, -0.9019018, -1.831196, 1, 0.2588235, 0, 1,
-1.725866, -1.079666, -2.512926, 1, 0.2627451, 0, 1,
-1.720938, 0.6635982, -1.77423, 1, 0.2705882, 0, 1,
-1.707359, 0.1924437, -1.392415, 1, 0.2745098, 0, 1,
-1.701554, -1.927128, -0.7923045, 1, 0.282353, 0, 1,
-1.700874, 0.5665907, -0.8049225, 1, 0.2862745, 0, 1,
-1.699903, -0.02001889, -0.2813163, 1, 0.2941177, 0, 1,
-1.68179, -1.637829, -2.087579, 1, 0.3019608, 0, 1,
-1.681758, 0.5462497, -1.955793, 1, 0.3058824, 0, 1,
-1.67592, 0.3843297, -1.66354, 1, 0.3137255, 0, 1,
-1.671547, 1.717017, 0.1391985, 1, 0.3176471, 0, 1,
-1.66578, 0.1687456, -1.078367, 1, 0.3254902, 0, 1,
-1.644353, 1.92911, -2.189793, 1, 0.3294118, 0, 1,
-1.640702, 0.3026804, -1.214045, 1, 0.3372549, 0, 1,
-1.633426, -0.1653893, -2.471629, 1, 0.3411765, 0, 1,
-1.621326, -0.5569165, -2.692425, 1, 0.3490196, 0, 1,
-1.614663, 0.2504747, 0.1461743, 1, 0.3529412, 0, 1,
-1.613176, 1.527495, -2.198092, 1, 0.3607843, 0, 1,
-1.60122, 0.0104957, -2.450803, 1, 0.3647059, 0, 1,
-1.572099, -0.198278, -1.624209, 1, 0.372549, 0, 1,
-1.566316, -0.7075543, -1.136842, 1, 0.3764706, 0, 1,
-1.553054, 1.109032, -0.2234052, 1, 0.3843137, 0, 1,
-1.543086, -1.620921, -1.876833, 1, 0.3882353, 0, 1,
-1.542837, 0.1371602, -0.2913069, 1, 0.3960784, 0, 1,
-1.542009, 1.116827, -0.5808437, 1, 0.4039216, 0, 1,
-1.541807, 0.8241788, 1.000267, 1, 0.4078431, 0, 1,
-1.510087, -0.7599197, -1.120952, 1, 0.4156863, 0, 1,
-1.496696, 0.048196, -1.349121, 1, 0.4196078, 0, 1,
-1.495532, 0.4986182, -0.2521667, 1, 0.427451, 0, 1,
-1.476855, -0.1096151, -2.658323, 1, 0.4313726, 0, 1,
-1.474011, 1.733634, -1.336806, 1, 0.4392157, 0, 1,
-1.470555, -0.7718622, -2.253983, 1, 0.4431373, 0, 1,
-1.470231, 0.4633334, -1.311301, 1, 0.4509804, 0, 1,
-1.467549, 0.4881957, -1.840727, 1, 0.454902, 0, 1,
-1.459918, -1.541116, -2.1598, 1, 0.4627451, 0, 1,
-1.45329, 0.7293627, 0.04136824, 1, 0.4666667, 0, 1,
-1.432387, -0.8688821, -1.680579, 1, 0.4745098, 0, 1,
-1.428158, -0.3964377, -2.673189, 1, 0.4784314, 0, 1,
-1.422397, 0.300845, -0.2716249, 1, 0.4862745, 0, 1,
-1.418086, -0.7839319, -2.087335, 1, 0.4901961, 0, 1,
-1.413846, -1.061026, -0.97057, 1, 0.4980392, 0, 1,
-1.406614, 0.3077908, 0.8465427, 1, 0.5058824, 0, 1,
-1.398246, 0.2647433, -2.041308, 1, 0.509804, 0, 1,
-1.386491, -0.3562575, -1.951339, 1, 0.5176471, 0, 1,
-1.369003, 0.3426579, -1.216087, 1, 0.5215687, 0, 1,
-1.364174, 0.6181641, -0.657927, 1, 0.5294118, 0, 1,
-1.350856, 0.5002055, -1.205028, 1, 0.5333334, 0, 1,
-1.348879, 0.7376509, -1.047957, 1, 0.5411765, 0, 1,
-1.343872, 1.68604, 1.405853, 1, 0.5450981, 0, 1,
-1.338405, 2.200039, -0.234799, 1, 0.5529412, 0, 1,
-1.338319, -1.668587, -3.70357, 1, 0.5568628, 0, 1,
-1.338186, -1.125672, 0.2194044, 1, 0.5647059, 0, 1,
-1.335563, 1.03056, 1.024542, 1, 0.5686275, 0, 1,
-1.334758, -1.675803, -2.954463, 1, 0.5764706, 0, 1,
-1.330133, 0.1096555, -0.3681688, 1, 0.5803922, 0, 1,
-1.298788, 0.6902848, -3.33851, 1, 0.5882353, 0, 1,
-1.293954, 0.7735617, -0.6783803, 1, 0.5921569, 0, 1,
-1.287589, 0.6337309, -0.6085342, 1, 0.6, 0, 1,
-1.287367, 0.04309783, -1.654289, 1, 0.6078432, 0, 1,
-1.27714, -0.1362003, -1.955647, 1, 0.6117647, 0, 1,
-1.277063, -0.5872679, -1.900919, 1, 0.6196079, 0, 1,
-1.275796, 0.9728898, 1.701461, 1, 0.6235294, 0, 1,
-1.273356, -1.678126, -1.392016, 1, 0.6313726, 0, 1,
-1.259265, -0.9048689, -1.1764, 1, 0.6352941, 0, 1,
-1.25675, -1.007711, -4.562949, 1, 0.6431373, 0, 1,
-1.255262, -0.9345217, -1.385658, 1, 0.6470588, 0, 1,
-1.245785, -0.6367184, 0.5924437, 1, 0.654902, 0, 1,
-1.242388, 0.7215289, -1.3294, 1, 0.6588235, 0, 1,
-1.233714, -0.003059578, -0.2695302, 1, 0.6666667, 0, 1,
-1.218486, -0.8658222, -0.8357689, 1, 0.6705883, 0, 1,
-1.211249, -0.7752234, -2.966938, 1, 0.6784314, 0, 1,
-1.21119, 0.008258609, -1.998217, 1, 0.682353, 0, 1,
-1.20755, 0.394731, -0.8007136, 1, 0.6901961, 0, 1,
-1.20519, -0.2882088, -2.760818, 1, 0.6941177, 0, 1,
-1.19724, 0.1472034, -0.6568832, 1, 0.7019608, 0, 1,
-1.19551, -0.2111313, -2.497419, 1, 0.7098039, 0, 1,
-1.185102, 2.319805, 0.2192692, 1, 0.7137255, 0, 1,
-1.182245, 1.984129, 0.1236371, 1, 0.7215686, 0, 1,
-1.178376, -0.2587979, -0.8328317, 1, 0.7254902, 0, 1,
-1.175322, -2.464997, -2.71658, 1, 0.7333333, 0, 1,
-1.175162, 0.7100846, -1.165242, 1, 0.7372549, 0, 1,
-1.167206, 0.683946, -0.1914261, 1, 0.7450981, 0, 1,
-1.167193, 0.1503557, -2.027987, 1, 0.7490196, 0, 1,
-1.164172, -0.1920051, -1.49698, 1, 0.7568628, 0, 1,
-1.164106, 0.8951443, -0.4329108, 1, 0.7607843, 0, 1,
-1.161287, 0.2221194, -0.9664291, 1, 0.7686275, 0, 1,
-1.161038, -0.9667643, -3.811531, 1, 0.772549, 0, 1,
-1.159647, -0.1922332, 0.1105091, 1, 0.7803922, 0, 1,
-1.157205, 1.410689, -1.204494, 1, 0.7843137, 0, 1,
-1.148195, 1.179245, -1.042157, 1, 0.7921569, 0, 1,
-1.144913, -0.810428, -2.161279, 1, 0.7960784, 0, 1,
-1.142581, -0.355201, -1.325972, 1, 0.8039216, 0, 1,
-1.141184, 0.1020144, -1.963639, 1, 0.8117647, 0, 1,
-1.135156, 0.8056782, -1.056083, 1, 0.8156863, 0, 1,
-1.134679, -0.863614, -2.375927, 1, 0.8235294, 0, 1,
-1.134092, -0.5745473, -2.089174, 1, 0.827451, 0, 1,
-1.132691, 0.8700688, 0.4719738, 1, 0.8352941, 0, 1,
-1.123268, -0.6590533, -2.292276, 1, 0.8392157, 0, 1,
-1.122275, -1.920304, -2.738707, 1, 0.8470588, 0, 1,
-1.121962, -1.611594, -2.141819, 1, 0.8509804, 0, 1,
-1.119789, -1.007625, -4.24849, 1, 0.8588235, 0, 1,
-1.116209, -0.4531787, -2.919882, 1, 0.8627451, 0, 1,
-1.11475, 1.067128, -0.8935212, 1, 0.8705882, 0, 1,
-1.111485, 0.4363718, -1.353091, 1, 0.8745098, 0, 1,
-1.109486, 0.09168743, -1.001787, 1, 0.8823529, 0, 1,
-1.105636, -0.403616, -1.887599, 1, 0.8862745, 0, 1,
-1.100681, 1.793555, -1.405648, 1, 0.8941177, 0, 1,
-1.095251, 0.2221091, -1.402656, 1, 0.8980392, 0, 1,
-1.093544, -0.04914211, -0.8733655, 1, 0.9058824, 0, 1,
-1.093055, 1.411276, -1.762691, 1, 0.9137255, 0, 1,
-1.091749, 1.338409, -0.6479324, 1, 0.9176471, 0, 1,
-1.085107, -0.5027381, -0.6700262, 1, 0.9254902, 0, 1,
-1.081541, -0.9012765, -3.109989, 1, 0.9294118, 0, 1,
-1.0715, -0.3269907, -2.831885, 1, 0.9372549, 0, 1,
-1.071258, 0.1368518, -2.10253, 1, 0.9411765, 0, 1,
-1.068228, -0.5923436, -2.087799, 1, 0.9490196, 0, 1,
-1.058483, -0.1183581, -2.276463, 1, 0.9529412, 0, 1,
-1.052458, -0.1505548, -1.786512, 1, 0.9607843, 0, 1,
-1.049706, 0.2861765, -1.170157, 1, 0.9647059, 0, 1,
-1.034994, -2.006968, -3.043746, 1, 0.972549, 0, 1,
-1.034809, -0.2513299, -1.874435, 1, 0.9764706, 0, 1,
-1.03343, 1.198876, -2.360869, 1, 0.9843137, 0, 1,
-1.029422, 2.181391, -0.8419823, 1, 0.9882353, 0, 1,
-1.02923, -0.05227185, -2.624346, 1, 0.9960784, 0, 1,
-1.018648, -0.308221, -1.210829, 0.9960784, 1, 0, 1,
-1.010484, 1.576725, -0.6674418, 0.9921569, 1, 0, 1,
-0.998603, 0.6474005, -2.028724, 0.9843137, 1, 0, 1,
-0.9967911, -2.28573, -2.488719, 0.9803922, 1, 0, 1,
-0.9960149, 0.665311, -1.782964, 0.972549, 1, 0, 1,
-0.9956447, 0.9797017, -0.6469821, 0.9686275, 1, 0, 1,
-0.9953943, 0.03682445, -1.207936, 0.9607843, 1, 0, 1,
-0.9951702, 1.027531, -1.167884, 0.9568627, 1, 0, 1,
-0.9942166, -0.5533481, -4.566761, 0.9490196, 1, 0, 1,
-0.9858899, -0.7920594, -1.392155, 0.945098, 1, 0, 1,
-0.9807044, -0.5245923, -3.10044, 0.9372549, 1, 0, 1,
-0.9749942, 0.5197771, -0.6599759, 0.9333333, 1, 0, 1,
-0.9698334, -0.6118652, -1.560554, 0.9254902, 1, 0, 1,
-0.968038, 1.082722, 0.2948773, 0.9215686, 1, 0, 1,
-0.9667821, -0.3331473, -2.780745, 0.9137255, 1, 0, 1,
-0.9666525, -0.6131357, -1.42853, 0.9098039, 1, 0, 1,
-0.963083, -0.8005584, -0.8764594, 0.9019608, 1, 0, 1,
-0.9505047, -0.8597903, -1.77162, 0.8941177, 1, 0, 1,
-0.9430929, -0.9619498, -3.061118, 0.8901961, 1, 0, 1,
-0.9352012, 0.05561115, -1.048224, 0.8823529, 1, 0, 1,
-0.9273143, 0.3082226, -1.189736, 0.8784314, 1, 0, 1,
-0.9228514, 1.336417, -1.082853, 0.8705882, 1, 0, 1,
-0.9228364, -1.566846, -3.552574, 0.8666667, 1, 0, 1,
-0.9218561, 1.323488, -0.2449347, 0.8588235, 1, 0, 1,
-0.9210699, 1.206669, -0.7354144, 0.854902, 1, 0, 1,
-0.9147862, -1.497666, 0.03871972, 0.8470588, 1, 0, 1,
-0.9123333, 0.8836363, -2.133109, 0.8431373, 1, 0, 1,
-0.9090824, 1.02786, -0.9213861, 0.8352941, 1, 0, 1,
-0.9013816, 0.7718617, -3.042448, 0.8313726, 1, 0, 1,
-0.900133, 0.03025612, -2.462156, 0.8235294, 1, 0, 1,
-0.8919019, -1.121284, -1.270159, 0.8196079, 1, 0, 1,
-0.8890119, -1.018691, -0.73462, 0.8117647, 1, 0, 1,
-0.8871225, 0.5486235, -1.523896, 0.8078431, 1, 0, 1,
-0.8823661, -0.8139606, -0.6772442, 0.8, 1, 0, 1,
-0.8801483, 0.6489997, -0.5316359, 0.7921569, 1, 0, 1,
-0.8743863, -1.079984, -3.118251, 0.7882353, 1, 0, 1,
-0.8724559, 0.7545244, -2.195558, 0.7803922, 1, 0, 1,
-0.8712747, -2.708515, -3.742263, 0.7764706, 1, 0, 1,
-0.8671781, 0.7542638, -1.259504, 0.7686275, 1, 0, 1,
-0.8643371, -1.099097, -0.9271609, 0.7647059, 1, 0, 1,
-0.8605871, -1.672198, -2.743711, 0.7568628, 1, 0, 1,
-0.8544465, -0.008443471, -0.7058929, 0.7529412, 1, 0, 1,
-0.8542895, -1.016851, -0.7997873, 0.7450981, 1, 0, 1,
-0.8538108, -1.457661, -1.436168, 0.7411765, 1, 0, 1,
-0.8509151, -1.500433, -2.98412, 0.7333333, 1, 0, 1,
-0.846644, -2.030313, -3.344706, 0.7294118, 1, 0, 1,
-0.8462743, -0.9118966, -1.184298, 0.7215686, 1, 0, 1,
-0.8457649, 1.584381, -0.2955619, 0.7176471, 1, 0, 1,
-0.8425387, -1.841503, -3.073243, 0.7098039, 1, 0, 1,
-0.8401105, 0.2587961, -0.6172181, 0.7058824, 1, 0, 1,
-0.8380079, -0.06068205, 0.5770026, 0.6980392, 1, 0, 1,
-0.8352659, -1.121845, -1.736719, 0.6901961, 1, 0, 1,
-0.831063, -0.3033431, -1.330712, 0.6862745, 1, 0, 1,
-0.8307507, -0.4362592, -3.442605, 0.6784314, 1, 0, 1,
-0.8277906, -0.2977563, -2.922189, 0.6745098, 1, 0, 1,
-0.8271997, 0.13605, -1.664361, 0.6666667, 1, 0, 1,
-0.8233328, -1.71005, -3.949531, 0.6627451, 1, 0, 1,
-0.8152898, 0.05446341, -1.655465, 0.654902, 1, 0, 1,
-0.8126454, 0.1740163, -0.9351819, 0.6509804, 1, 0, 1,
-0.8067974, 1.742983, 0.4530458, 0.6431373, 1, 0, 1,
-0.8067926, -0.5930662, -3.624418, 0.6392157, 1, 0, 1,
-0.8047456, 2.643339, 0.3840811, 0.6313726, 1, 0, 1,
-0.804172, 0.3978598, -2.177998, 0.627451, 1, 0, 1,
-0.7911268, -1.490232, -1.827546, 0.6196079, 1, 0, 1,
-0.7836578, -0.9518137, -3.646035, 0.6156863, 1, 0, 1,
-0.7824699, 0.793569, -0.1430696, 0.6078432, 1, 0, 1,
-0.7736884, 2.388779, -1.3308, 0.6039216, 1, 0, 1,
-0.7684245, -1.316777, -3.425355, 0.5960785, 1, 0, 1,
-0.7680539, 0.2940057, -1.175941, 0.5882353, 1, 0, 1,
-0.7613471, 0.9094374, 0.01853512, 0.5843138, 1, 0, 1,
-0.7599563, 0.5011935, -0.1712127, 0.5764706, 1, 0, 1,
-0.7553132, -0.4886879, -2.264044, 0.572549, 1, 0, 1,
-0.7551043, -0.5764846, -1.352092, 0.5647059, 1, 0, 1,
-0.7497448, 0.05955498, -1.029362, 0.5607843, 1, 0, 1,
-0.748965, -0.6269074, -3.260044, 0.5529412, 1, 0, 1,
-0.7381909, 0.8937937, -4.034017, 0.5490196, 1, 0, 1,
-0.735817, 0.2642931, -1.393055, 0.5411765, 1, 0, 1,
-0.7252362, 0.1905677, -2.17068, 0.5372549, 1, 0, 1,
-0.7230666, 2.562147, 2.045563, 0.5294118, 1, 0, 1,
-0.7221402, 2.003401, 0.3709329, 0.5254902, 1, 0, 1,
-0.7063324, -0.5678959, -1.954554, 0.5176471, 1, 0, 1,
-0.70443, -0.3660694, -1.845216, 0.5137255, 1, 0, 1,
-0.7010823, 0.6566746, -2.246243, 0.5058824, 1, 0, 1,
-0.6985312, 0.03272365, -1.159885, 0.5019608, 1, 0, 1,
-0.6948939, 0.7942493, -0.2166494, 0.4941176, 1, 0, 1,
-0.6899284, -0.2856835, -2.723045, 0.4862745, 1, 0, 1,
-0.6892475, -1.189454, -3.790753, 0.4823529, 1, 0, 1,
-0.6892048, 1.484153, -1.103486, 0.4745098, 1, 0, 1,
-0.6866165, 0.1074831, -0.2388926, 0.4705882, 1, 0, 1,
-0.6856936, 1.211596, -0.782719, 0.4627451, 1, 0, 1,
-0.6853786, 0.7764236, -2.385867, 0.4588235, 1, 0, 1,
-0.6803715, 1.028817, 1.145441, 0.4509804, 1, 0, 1,
-0.6730692, -0.4805138, -2.870774, 0.4470588, 1, 0, 1,
-0.6723092, -0.5621763, -0.8374413, 0.4392157, 1, 0, 1,
-0.6707443, -0.1563127, -2.83058, 0.4352941, 1, 0, 1,
-0.6647772, -0.08824959, -0.9894716, 0.427451, 1, 0, 1,
-0.6646155, -0.3633298, -1.659404, 0.4235294, 1, 0, 1,
-0.6642832, -0.2762074, -2.656018, 0.4156863, 1, 0, 1,
-0.6568317, -0.1671117, 0.3450526, 0.4117647, 1, 0, 1,
-0.6472707, 0.8381688, -1.695694, 0.4039216, 1, 0, 1,
-0.6459928, 0.1365687, -1.86579, 0.3960784, 1, 0, 1,
-0.6435344, 0.2442388, -1.563496, 0.3921569, 1, 0, 1,
-0.6413439, -0.6423833, -0.8698912, 0.3843137, 1, 0, 1,
-0.6411818, 0.9074383, -0.6935523, 0.3803922, 1, 0, 1,
-0.6406311, 0.6560366, 0.8766663, 0.372549, 1, 0, 1,
-0.640215, -0.006293116, -1.787899, 0.3686275, 1, 0, 1,
-0.6356605, 0.2883846, -1.057368, 0.3607843, 1, 0, 1,
-0.633382, -1.747748, -3.561359, 0.3568628, 1, 0, 1,
-0.6272835, 1.508349, 0.4143492, 0.3490196, 1, 0, 1,
-0.6247321, -2.236517, -2.198214, 0.345098, 1, 0, 1,
-0.6227968, 0.03353493, -1.176616, 0.3372549, 1, 0, 1,
-0.6227889, 0.7473981, -0.464317, 0.3333333, 1, 0, 1,
-0.6190199, 2.021367, 0.6059834, 0.3254902, 1, 0, 1,
-0.6176572, 0.7589063, -0.2269146, 0.3215686, 1, 0, 1,
-0.6092974, 1.540805, 0.6135347, 0.3137255, 1, 0, 1,
-0.6087654, -0.4128246, -0.7060194, 0.3098039, 1, 0, 1,
-0.6074268, 0.1221949, -1.590268, 0.3019608, 1, 0, 1,
-0.6037083, 0.5913833, -1.616003, 0.2941177, 1, 0, 1,
-0.6007267, -1.251814, -4.30912, 0.2901961, 1, 0, 1,
-0.5975043, 0.07010397, -1.991583, 0.282353, 1, 0, 1,
-0.5974163, 0.6664845, 0.06894186, 0.2784314, 1, 0, 1,
-0.590249, -0.554877, -2.225292, 0.2705882, 1, 0, 1,
-0.5902024, -1.89192, -2.137674, 0.2666667, 1, 0, 1,
-0.5892573, -3.955375, -3.634951, 0.2588235, 1, 0, 1,
-0.589018, -0.3844846, 0.0004035826, 0.254902, 1, 0, 1,
-0.5873305, -0.02710309, -3.77421, 0.2470588, 1, 0, 1,
-0.5864504, -0.5371296, -3.185307, 0.2431373, 1, 0, 1,
-0.5861311, 1.009804, -1.791764, 0.2352941, 1, 0, 1,
-0.5826997, 0.7676048, -0.4156016, 0.2313726, 1, 0, 1,
-0.582482, -0.2461384, -2.497372, 0.2235294, 1, 0, 1,
-0.5795082, -0.3767211, -3.681067, 0.2196078, 1, 0, 1,
-0.5724818, 0.01110603, -1.386016, 0.2117647, 1, 0, 1,
-0.5682794, -0.449094, -1.443053, 0.2078431, 1, 0, 1,
-0.5671523, -0.4864126, -3.719887, 0.2, 1, 0, 1,
-0.5659169, 0.7904375, -1.254065, 0.1921569, 1, 0, 1,
-0.5645848, -1.050663, -2.254852, 0.1882353, 1, 0, 1,
-0.5641548, 0.7939568, -0.9023008, 0.1803922, 1, 0, 1,
-0.5620446, 0.2513809, -2.535614, 0.1764706, 1, 0, 1,
-0.5616271, 1.291345, 0.8611141, 0.1686275, 1, 0, 1,
-0.561313, 0.2357747, -1.268726, 0.1647059, 1, 0, 1,
-0.5611159, -0.5205413, -2.805605, 0.1568628, 1, 0, 1,
-0.558063, 1.416059, 1.178112, 0.1529412, 1, 0, 1,
-0.5577334, 1.680481, 0.4473302, 0.145098, 1, 0, 1,
-0.5570022, 0.4801539, 0.7618828, 0.1411765, 1, 0, 1,
-0.5465333, -0.07278261, -2.719199, 0.1333333, 1, 0, 1,
-0.5355092, -1.034908, -4.618094, 0.1294118, 1, 0, 1,
-0.5322369, -0.003681062, -2.410181, 0.1215686, 1, 0, 1,
-0.5262992, 1.739682, 1.101368, 0.1176471, 1, 0, 1,
-0.5259112, 1.754058, -1.051834, 0.1098039, 1, 0, 1,
-0.5244064, -1.258767, -2.717362, 0.1058824, 1, 0, 1,
-0.5139614, 1.321613, -0.03307357, 0.09803922, 1, 0, 1,
-0.5132819, -0.5563071, -3.524371, 0.09019608, 1, 0, 1,
-0.5087863, -1.167822, -4.416226, 0.08627451, 1, 0, 1,
-0.5005324, -0.01731753, -1.681011, 0.07843138, 1, 0, 1,
-0.4998724, -0.1763894, -1.164371, 0.07450981, 1, 0, 1,
-0.4981943, -1.448317, -4.214953, 0.06666667, 1, 0, 1,
-0.4952158, -0.6278985, -3.745233, 0.0627451, 1, 0, 1,
-0.4931143, 0.6648843, -0.769361, 0.05490196, 1, 0, 1,
-0.4895743, -1.725394, -2.764698, 0.05098039, 1, 0, 1,
-0.4880446, 1.024033, -0.3703725, 0.04313726, 1, 0, 1,
-0.4853011, -0.5975365, -3.741671, 0.03921569, 1, 0, 1,
-0.4831654, 1.859647, -0.4401687, 0.03137255, 1, 0, 1,
-0.4824721, -0.2757315, -1.151494, 0.02745098, 1, 0, 1,
-0.4743236, -0.759176, -3.098491, 0.01960784, 1, 0, 1,
-0.4739723, 1.375043, -0.260124, 0.01568628, 1, 0, 1,
-0.4660489, 0.2173652, -1.147353, 0.007843138, 1, 0, 1,
-0.4655777, -1.100574, -2.99393, 0.003921569, 1, 0, 1,
-0.4652476, 1.495392, -0.4603353, 0, 1, 0.003921569, 1,
-0.4633987, 0.1954391, 0.003477551, 0, 1, 0.01176471, 1,
-0.461669, 1.470938, -1.889135, 0, 1, 0.01568628, 1,
-0.4547108, -0.920361, -4.195915, 0, 1, 0.02352941, 1,
-0.4543507, -1.551114, -1.375435, 0, 1, 0.02745098, 1,
-0.4529291, 1.060781, 0.9191217, 0, 1, 0.03529412, 1,
-0.452545, 0.7619563, -0.6689287, 0, 1, 0.03921569, 1,
-0.4522921, -2.010696, -1.674619, 0, 1, 0.04705882, 1,
-0.4512475, -0.3682029, -3.666523, 0, 1, 0.05098039, 1,
-0.4433055, -0.5118783, -1.402718, 0, 1, 0.05882353, 1,
-0.4393224, -0.3617974, -2.989185, 0, 1, 0.0627451, 1,
-0.4330792, 0.4799109, 0.6805184, 0, 1, 0.07058824, 1,
-0.4321847, 0.1883131, -2.066765, 0, 1, 0.07450981, 1,
-0.4308007, -0.3770117, -2.81344, 0, 1, 0.08235294, 1,
-0.4288611, 0.2894965, -2.488466, 0, 1, 0.08627451, 1,
-0.4274688, 2.394242, -0.2814051, 0, 1, 0.09411765, 1,
-0.4237258, -1.824429, -2.293527, 0, 1, 0.1019608, 1,
-0.4230493, -0.6979359, -3.330119, 0, 1, 0.1058824, 1,
-0.4161508, -0.4520284, -2.407269, 0, 1, 0.1137255, 1,
-0.4151375, -0.03223465, -1.073484, 0, 1, 0.1176471, 1,
-0.4124677, 0.6302885, 0.5126683, 0, 1, 0.1254902, 1,
-0.4101866, 1.090751, 0.9882153, 0, 1, 0.1294118, 1,
-0.4097049, -0.6405666, -2.856711, 0, 1, 0.1372549, 1,
-0.4004196, -0.9278269, -2.146028, 0, 1, 0.1411765, 1,
-0.3999061, -0.6796888, -2.717536, 0, 1, 0.1490196, 1,
-0.3996884, 1.600069, -1.761112, 0, 1, 0.1529412, 1,
-0.3995127, 0.5864604, -1.453295, 0, 1, 0.1607843, 1,
-0.3936529, 0.5919297, 0.05416821, 0, 1, 0.1647059, 1,
-0.3894008, -0.862606, -2.076196, 0, 1, 0.172549, 1,
-0.3846269, -2.690117, -3.589025, 0, 1, 0.1764706, 1,
-0.3837132, 1.076935, -0.2725413, 0, 1, 0.1843137, 1,
-0.3763044, 0.1038979, -1.458808, 0, 1, 0.1882353, 1,
-0.3740607, -1.117709, -3.74073, 0, 1, 0.1960784, 1,
-0.3713684, 1.107204, -0.3811226, 0, 1, 0.2039216, 1,
-0.3702502, 0.7842268, -1.263366, 0, 1, 0.2078431, 1,
-0.3685175, 2.110444, -0.8270876, 0, 1, 0.2156863, 1,
-0.3684567, 0.3672761, -0.7476436, 0, 1, 0.2196078, 1,
-0.3657657, 0.742605, -1.521049, 0, 1, 0.227451, 1,
-0.3633312, 1.73107, 1.399355, 0, 1, 0.2313726, 1,
-0.359918, -0.08712662, -2.283858, 0, 1, 0.2392157, 1,
-0.35582, -0.997445, -2.774183, 0, 1, 0.2431373, 1,
-0.3534544, 1.153755, -1.507547, 0, 1, 0.2509804, 1,
-0.353216, 0.7626483, 1.411161, 0, 1, 0.254902, 1,
-0.3528892, -0.3426698, -2.16994, 0, 1, 0.2627451, 1,
-0.351868, -1.369634, -2.73839, 0, 1, 0.2666667, 1,
-0.3469274, -0.120176, -0.7163782, 0, 1, 0.2745098, 1,
-0.3467138, -0.1140729, -3.513575, 0, 1, 0.2784314, 1,
-0.3395586, -0.3000262, -1.788408, 0, 1, 0.2862745, 1,
-0.338351, -0.8352694, -3.598633, 0, 1, 0.2901961, 1,
-0.3380159, -0.1350207, -1.147884, 0, 1, 0.2980392, 1,
-0.3354193, 0.7047266, 1.262289, 0, 1, 0.3058824, 1,
-0.332173, -0.7566267, -2.115053, 0, 1, 0.3098039, 1,
-0.3318885, 1.727139, -0.01382484, 0, 1, 0.3176471, 1,
-0.3313522, 0.3066052, -1.070944, 0, 1, 0.3215686, 1,
-0.324097, -0.6109721, -1.72708, 0, 1, 0.3294118, 1,
-0.3222807, -0.2453774, -0.9686522, 0, 1, 0.3333333, 1,
-0.3203994, 1.544021, -0.3736615, 0, 1, 0.3411765, 1,
-0.3203229, 1.220304, -0.02167143, 0, 1, 0.345098, 1,
-0.3194099, -0.8477364, -2.970232, 0, 1, 0.3529412, 1,
-0.3190177, 0.892015, -2.023842, 0, 1, 0.3568628, 1,
-0.3187647, 0.2455997, -0.6758895, 0, 1, 0.3647059, 1,
-0.3137821, -0.6363871, -1.935035, 0, 1, 0.3686275, 1,
-0.3125585, 0.8422379, -0.5087282, 0, 1, 0.3764706, 1,
-0.3100711, 0.6691902, -0.576445, 0, 1, 0.3803922, 1,
-0.3087988, -2.410928, -2.363544, 0, 1, 0.3882353, 1,
-0.3061249, 0.5666964, -1.01352, 0, 1, 0.3921569, 1,
-0.3043974, -0.55019, -2.087202, 0, 1, 0.4, 1,
-0.2992047, -1.247579, -4.2985, 0, 1, 0.4078431, 1,
-0.2981367, 1.044569, 1.251953, 0, 1, 0.4117647, 1,
-0.2958049, 0.3710586, -0.5206108, 0, 1, 0.4196078, 1,
-0.2915427, 0.255366, -0.06692222, 0, 1, 0.4235294, 1,
-0.2889731, 0.3116024, -1.107943, 0, 1, 0.4313726, 1,
-0.2817242, -0.7848932, -3.608387, 0, 1, 0.4352941, 1,
-0.2721639, -0.02568244, -0.6824067, 0, 1, 0.4431373, 1,
-0.2688923, 1.848297, -0.4633653, 0, 1, 0.4470588, 1,
-0.2680325, -0.7412608, -2.360852, 0, 1, 0.454902, 1,
-0.2640178, 1.210178, -0.6753312, 0, 1, 0.4588235, 1,
-0.2635361, 0.1233141, -0.8305062, 0, 1, 0.4666667, 1,
-0.2583144, 0.1214347, -0.111659, 0, 1, 0.4705882, 1,
-0.2580812, -0.8873799, -2.658992, 0, 1, 0.4784314, 1,
-0.2525853, -0.434317, -1.189242, 0, 1, 0.4823529, 1,
-0.2472577, 0.4870798, -0.1398032, 0, 1, 0.4901961, 1,
-0.2470479, 1.862771, 1.013234, 0, 1, 0.4941176, 1,
-0.2425248, -0.8779129, -2.509167, 0, 1, 0.5019608, 1,
-0.2372312, 0.7287675, -0.6056883, 0, 1, 0.509804, 1,
-0.2362036, 0.8545711, -1.294036, 0, 1, 0.5137255, 1,
-0.2351888, -0.9023131, -2.595886, 0, 1, 0.5215687, 1,
-0.2284014, -1.208424, -2.47672, 0, 1, 0.5254902, 1,
-0.2255571, 1.153971, -1.082878, 0, 1, 0.5333334, 1,
-0.2185311, 0.1221889, -1.547955, 0, 1, 0.5372549, 1,
-0.2175945, 1.858001, -1.282465, 0, 1, 0.5450981, 1,
-0.2121672, 0.8118763, 0.55941, 0, 1, 0.5490196, 1,
-0.2075022, -1.450228, -2.522388, 0, 1, 0.5568628, 1,
-0.2041872, 1.378947, 0.5626798, 0, 1, 0.5607843, 1,
-0.2037185, 0.1137427, -1.363628, 0, 1, 0.5686275, 1,
-0.2036971, -1.954582, -3.721318, 0, 1, 0.572549, 1,
-0.2008727, -0.1988484, -2.639052, 0, 1, 0.5803922, 1,
-0.2001316, 0.1223406, -0.3443571, 0, 1, 0.5843138, 1,
-0.1989533, -0.7557231, -1.682457, 0, 1, 0.5921569, 1,
-0.198917, -1.428601, -4.120333, 0, 1, 0.5960785, 1,
-0.1966048, -0.5332152, -3.644256, 0, 1, 0.6039216, 1,
-0.1957418, 0.1026522, -0.5367399, 0, 1, 0.6117647, 1,
-0.1942673, -0.9385241, -3.34019, 0, 1, 0.6156863, 1,
-0.1939739, -0.9245984, -3.131986, 0, 1, 0.6235294, 1,
-0.1938842, 1.240833, -0.3331954, 0, 1, 0.627451, 1,
-0.1900295, -1.78297, -4.518757, 0, 1, 0.6352941, 1,
-0.1780712, 1.29678, -0.2981357, 0, 1, 0.6392157, 1,
-0.1721735, -1.434251, -3.360786, 0, 1, 0.6470588, 1,
-0.1675867, -0.09094772, -3.674426, 0, 1, 0.6509804, 1,
-0.1589971, 1.525091, -0.7229502, 0, 1, 0.6588235, 1,
-0.1585738, 0.09294824, -1.4413, 0, 1, 0.6627451, 1,
-0.1473162, -1.042994, -3.302611, 0, 1, 0.6705883, 1,
-0.1419903, 0.1297756, -0.5718784, 0, 1, 0.6745098, 1,
-0.1329333, -0.5410057, -3.760439, 0, 1, 0.682353, 1,
-0.1321023, -0.5614558, -1.366408, 0, 1, 0.6862745, 1,
-0.1303297, 0.5566683, 0.1959786, 0, 1, 0.6941177, 1,
-0.1297598, 0.5144837, -0.223776, 0, 1, 0.7019608, 1,
-0.1231622, -0.09469715, -2.029631, 0, 1, 0.7058824, 1,
-0.1209515, 0.7225815, 1.065914, 0, 1, 0.7137255, 1,
-0.1182898, -1.997312, -1.850653, 0, 1, 0.7176471, 1,
-0.1152628, -0.6930764, -2.337087, 0, 1, 0.7254902, 1,
-0.1150219, -1.169965, -3.247369, 0, 1, 0.7294118, 1,
-0.1146128, 0.670512, -0.8889045, 0, 1, 0.7372549, 1,
-0.1139835, -1.073973, -3.483309, 0, 1, 0.7411765, 1,
-0.1139367, -1.319306, -2.384179, 0, 1, 0.7490196, 1,
-0.1103648, -0.3121555, -2.691452, 0, 1, 0.7529412, 1,
-0.109185, 0.6281436, -0.7490507, 0, 1, 0.7607843, 1,
-0.1081098, -0.5618169, -1.129476, 0, 1, 0.7647059, 1,
-0.1064455, -1.113945, -3.047323, 0, 1, 0.772549, 1,
-0.1061998, 0.7525967, 0.02068595, 0, 1, 0.7764706, 1,
-0.1037101, 0.8471879, 0.14108, 0, 1, 0.7843137, 1,
-0.1013752, -0.006414552, -1.529419, 0, 1, 0.7882353, 1,
-0.1013582, 0.7557658, -0.6311764, 0, 1, 0.7960784, 1,
-0.1008406, 1.249472, 0.4909738, 0, 1, 0.8039216, 1,
-0.09283268, 0.2089202, -1.84113, 0, 1, 0.8078431, 1,
-0.08641763, 0.415933, -0.9387177, 0, 1, 0.8156863, 1,
-0.08627298, -0.004659197, -1.600282, 0, 1, 0.8196079, 1,
-0.08420757, -0.2720278, -2.919274, 0, 1, 0.827451, 1,
-0.08254385, 1.386826, 1.545777, 0, 1, 0.8313726, 1,
-0.08223827, 2.477351, 0.1150596, 0, 1, 0.8392157, 1,
-0.08094565, -1.505211, -1.815773, 0, 1, 0.8431373, 1,
-0.07654564, -1.605211, -1.454871, 0, 1, 0.8509804, 1,
-0.06945842, -0.4501294, -2.757272, 0, 1, 0.854902, 1,
-0.06353063, -0.6983632, -2.486548, 0, 1, 0.8627451, 1,
-0.06125441, 1.752467, 1.718101, 0, 1, 0.8666667, 1,
-0.06023074, -1.517108, -3.123839, 0, 1, 0.8745098, 1,
-0.05899587, 0.5364474, 0.4765063, 0, 1, 0.8784314, 1,
-0.05782854, 1.71229, -0.2837935, 0, 1, 0.8862745, 1,
-0.05695047, 1.298847, 1.021674, 0, 1, 0.8901961, 1,
-0.04960047, -0.7259358, -3.011919, 0, 1, 0.8980392, 1,
-0.04327714, -0.4030842, -3.11983, 0, 1, 0.9058824, 1,
-0.03843942, -0.6078327, -2.050438, 0, 1, 0.9098039, 1,
-0.03624959, -2.000677, -3.41797, 0, 1, 0.9176471, 1,
-0.02675916, -0.3850622, -2.075492, 0, 1, 0.9215686, 1,
-0.02634574, 0.1759944, -0.821941, 0, 1, 0.9294118, 1,
-0.02516158, 2.431186, -1.358812, 0, 1, 0.9333333, 1,
-0.02382161, -1.355491, -3.494435, 0, 1, 0.9411765, 1,
-0.02291288, -0.8324159, -4.078991, 0, 1, 0.945098, 1,
-0.02285117, 0.1966366, -0.4843792, 0, 1, 0.9529412, 1,
-0.02248056, 0.9098608, 1.602775, 0, 1, 0.9568627, 1,
-0.0181148, -0.4734807, -2.745625, 0, 1, 0.9647059, 1,
-0.01711464, -0.6049757, -1.869717, 0, 1, 0.9686275, 1,
-0.0114528, -0.7093773, -3.026165, 0, 1, 0.9764706, 1,
-0.006044967, -1.068267, -3.67867, 0, 1, 0.9803922, 1,
-0.002716533, -0.6412429, -1.957686, 0, 1, 0.9882353, 1,
-0.001854906, 0.1475225, 0.5977899, 0, 1, 0.9921569, 1,
0.003886486, 0.7711602, 1.271948, 0, 1, 1, 1,
0.007063394, -0.4716187, 1.848352, 0, 0.9921569, 1, 1,
0.008208954, 0.4750727, 0.08347613, 0, 0.9882353, 1, 1,
0.008890066, 0.2219714, 0.4293688, 0, 0.9803922, 1, 1,
0.01238743, -0.254265, 3.928289, 0, 0.9764706, 1, 1,
0.01436654, 0.5539233, 1.211057, 0, 0.9686275, 1, 1,
0.01457185, 1.70196, -2.218663, 0, 0.9647059, 1, 1,
0.01666936, 0.3744866, -0.5459444, 0, 0.9568627, 1, 1,
0.01693744, -0.1226357, 2.543425, 0, 0.9529412, 1, 1,
0.01943064, 1.42512, -0.2449877, 0, 0.945098, 1, 1,
0.02003537, 0.7365615, -0.6896458, 0, 0.9411765, 1, 1,
0.0217443, -0.1874934, 2.093148, 0, 0.9333333, 1, 1,
0.02356274, -0.2317229, 3.785603, 0, 0.9294118, 1, 1,
0.02580268, -0.5719666, 3.812344, 0, 0.9215686, 1, 1,
0.02605793, -0.09499195, 4.749191, 0, 0.9176471, 1, 1,
0.02743232, 1.38395, 0.9633511, 0, 0.9098039, 1, 1,
0.03055713, -0.5011954, 3.491062, 0, 0.9058824, 1, 1,
0.03392225, -1.064461, 2.959374, 0, 0.8980392, 1, 1,
0.04259693, 0.4821763, -1.731517, 0, 0.8901961, 1, 1,
0.04414548, 0.6129372, 1.261401, 0, 0.8862745, 1, 1,
0.04586674, 1.402603, -0.3975396, 0, 0.8784314, 1, 1,
0.05619286, 0.4487505, -0.5011523, 0, 0.8745098, 1, 1,
0.05998224, 0.4018914, -0.6660668, 0, 0.8666667, 1, 1,
0.06131857, -0.2708572, 3.495742, 0, 0.8627451, 1, 1,
0.06173556, -0.7602602, 6.566589, 0, 0.854902, 1, 1,
0.0621165, 0.5191992, 1.525967, 0, 0.8509804, 1, 1,
0.06327471, -1.19349, 3.908369, 0, 0.8431373, 1, 1,
0.06401782, -0.3531202, 3.234782, 0, 0.8392157, 1, 1,
0.06506491, 0.06951676, 0.4719892, 0, 0.8313726, 1, 1,
0.07015673, -1.52185, 6.01938, 0, 0.827451, 1, 1,
0.07206859, 0.8657326, -0.9387398, 0, 0.8196079, 1, 1,
0.07695218, -1.000155, 2.519009, 0, 0.8156863, 1, 1,
0.07948385, -3.226893, 3.183213, 0, 0.8078431, 1, 1,
0.08264361, -2.067673, 2.070544, 0, 0.8039216, 1, 1,
0.08493987, 0.04614402, 1.776543, 0, 0.7960784, 1, 1,
0.08709291, 0.78667, -0.7107129, 0, 0.7882353, 1, 1,
0.0916431, 1.560069, -0.01818543, 0, 0.7843137, 1, 1,
0.09364562, -0.6032963, 0.1967506, 0, 0.7764706, 1, 1,
0.09583434, -1.149838, 2.230299, 0, 0.772549, 1, 1,
0.09594402, 0.2437138, 1.102441, 0, 0.7647059, 1, 1,
0.09671684, -0.02170334, 2.408887, 0, 0.7607843, 1, 1,
0.09776599, 0.1780183, 1.595555, 0, 0.7529412, 1, 1,
0.101978, -2.17763, 3.921404, 0, 0.7490196, 1, 1,
0.1020842, -0.1151324, 2.044755, 0, 0.7411765, 1, 1,
0.1026658, -0.102746, 3.915342, 0, 0.7372549, 1, 1,
0.1032819, -0.8742744, 2.809451, 0, 0.7294118, 1, 1,
0.1052665, 0.8092421, 0.2495105, 0, 0.7254902, 1, 1,
0.1060892, 0.6522401, -0.9436571, 0, 0.7176471, 1, 1,
0.1106671, -1.762387, 2.937996, 0, 0.7137255, 1, 1,
0.1123078, 0.9228929, 0.4369363, 0, 0.7058824, 1, 1,
0.1135329, 0.07056454, -0.9931376, 0, 0.6980392, 1, 1,
0.114521, 1.629624, -0.7103715, 0, 0.6941177, 1, 1,
0.1166425, -0.5412448, 1.957645, 0, 0.6862745, 1, 1,
0.1171188, 1.480412, -0.8469412, 0, 0.682353, 1, 1,
0.1222196, 0.6641959, -0.07847136, 0, 0.6745098, 1, 1,
0.1242212, 0.9389495, -0.3640253, 0, 0.6705883, 1, 1,
0.1271954, 0.1674635, 1.725834, 0, 0.6627451, 1, 1,
0.1340498, -0.2311335, 3.085709, 0, 0.6588235, 1, 1,
0.1401757, -0.3818713, 2.224955, 0, 0.6509804, 1, 1,
0.1404765, -2.235301, 3.948005, 0, 0.6470588, 1, 1,
0.1450412, -0.2798997, 4.489364, 0, 0.6392157, 1, 1,
0.1462247, 1.017242, 1.283738, 0, 0.6352941, 1, 1,
0.1490061, -0.1986036, 1.467726, 0, 0.627451, 1, 1,
0.1512141, 0.9402981, 0.126983, 0, 0.6235294, 1, 1,
0.1512396, 1.209498, -0.0870533, 0, 0.6156863, 1, 1,
0.1521534, -0.3273958, 1.067215, 0, 0.6117647, 1, 1,
0.1569399, -0.01326877, 2.653549, 0, 0.6039216, 1, 1,
0.1572308, -0.02683518, 0.5255697, 0, 0.5960785, 1, 1,
0.1625255, -1.25703, 2.888095, 0, 0.5921569, 1, 1,
0.1672654, -1.507538, 2.796713, 0, 0.5843138, 1, 1,
0.1691332, -1.934139, 4.152301, 0, 0.5803922, 1, 1,
0.1719881, 0.02387301, -1.382372, 0, 0.572549, 1, 1,
0.1755217, 1.107116, 0.1866975, 0, 0.5686275, 1, 1,
0.1762934, -0.1842627, 4.325827, 0, 0.5607843, 1, 1,
0.1777807, 1.125929, 1.323187, 0, 0.5568628, 1, 1,
0.1837662, -0.4972902, 3.794874, 0, 0.5490196, 1, 1,
0.1839654, 0.1158294, 1.537672, 0, 0.5450981, 1, 1,
0.1892622, -0.06775112, 0.9762609, 0, 0.5372549, 1, 1,
0.1948471, 1.331434, 0.6771016, 0, 0.5333334, 1, 1,
0.2016598, 0.27067, -0.1347245, 0, 0.5254902, 1, 1,
0.2135248, -0.2934399, 2.653578, 0, 0.5215687, 1, 1,
0.2139309, 1.550957, -0.3462185, 0, 0.5137255, 1, 1,
0.2173343, 0.8854347, 0.6212932, 0, 0.509804, 1, 1,
0.2186426, 0.9211391, -0.1329856, 0, 0.5019608, 1, 1,
0.2192267, -0.0540689, 4.657829, 0, 0.4941176, 1, 1,
0.2237869, 0.7516983, 1.065029, 0, 0.4901961, 1, 1,
0.2282783, 2.218112, 0.0621259, 0, 0.4823529, 1, 1,
0.2316744, 0.7915442, -0.1287061, 0, 0.4784314, 1, 1,
0.2326691, 0.6255007, 1.643888, 0, 0.4705882, 1, 1,
0.2329039, -1.342379, 3.028974, 0, 0.4666667, 1, 1,
0.2371082, -0.9063809, 2.318893, 0, 0.4588235, 1, 1,
0.2383536, -0.5813591, 3.198801, 0, 0.454902, 1, 1,
0.2403005, 0.3517327, -0.123054, 0, 0.4470588, 1, 1,
0.2503064, -0.735509, 2.897682, 0, 0.4431373, 1, 1,
0.2527585, -0.3319189, 2.932343, 0, 0.4352941, 1, 1,
0.2546851, 2.421424, 0.746415, 0, 0.4313726, 1, 1,
0.2575098, 1.395314, -0.6988919, 0, 0.4235294, 1, 1,
0.2620498, 0.4070318, 1.09225, 0, 0.4196078, 1, 1,
0.2625913, -1.078249, 2.476952, 0, 0.4117647, 1, 1,
0.26338, -0.7886435, 3.69629, 0, 0.4078431, 1, 1,
0.2634909, -2.337554, 3.564758, 0, 0.4, 1, 1,
0.2639439, 0.6769804, 0.8835505, 0, 0.3921569, 1, 1,
0.2644982, 1.724253, -0.3843664, 0, 0.3882353, 1, 1,
0.264685, -0.03421672, 2.736951, 0, 0.3803922, 1, 1,
0.2675861, -0.5244358, 2.003908, 0, 0.3764706, 1, 1,
0.2703446, 0.1014659, 2.456722, 0, 0.3686275, 1, 1,
0.2706659, -1.566974, 2.472443, 0, 0.3647059, 1, 1,
0.2808914, -0.2270631, 1.494813, 0, 0.3568628, 1, 1,
0.281743, 1.325284, 0.07190944, 0, 0.3529412, 1, 1,
0.285277, 0.3256914, 1.062028, 0, 0.345098, 1, 1,
0.2858743, -1.993016, 3.383198, 0, 0.3411765, 1, 1,
0.2859602, -0.1313121, 2.811544, 0, 0.3333333, 1, 1,
0.286586, 0.5322141, 2.011108, 0, 0.3294118, 1, 1,
0.2915399, -0.7854323, 2.18517, 0, 0.3215686, 1, 1,
0.2956091, -0.1836111, 2.596075, 0, 0.3176471, 1, 1,
0.2965496, -0.4059016, 2.818622, 0, 0.3098039, 1, 1,
0.3016452, -0.4952803, 2.155768, 0, 0.3058824, 1, 1,
0.302216, -1.605197, 2.740445, 0, 0.2980392, 1, 1,
0.3061666, -1.402755, 4.451898, 0, 0.2901961, 1, 1,
0.3091113, 0.6513125, 1.156188, 0, 0.2862745, 1, 1,
0.3094598, 0.1968758, -0.8144411, 0, 0.2784314, 1, 1,
0.3135522, 1.281046, -0.4468428, 0, 0.2745098, 1, 1,
0.3159765, -0.3372306, 1.488538, 0, 0.2666667, 1, 1,
0.3196705, -1.877291, 1.495641, 0, 0.2627451, 1, 1,
0.3207957, 1.590149, 0.2092875, 0, 0.254902, 1, 1,
0.3225357, 0.9921965, 0.0639004, 0, 0.2509804, 1, 1,
0.3249716, -0.4064038, 3.305984, 0, 0.2431373, 1, 1,
0.3273502, -0.1275079, 2.486624, 0, 0.2392157, 1, 1,
0.3298755, 0.6533424, -0.2518638, 0, 0.2313726, 1, 1,
0.3332886, -0.5144437, 4.096664, 0, 0.227451, 1, 1,
0.334671, 0.6919196, -1.82596, 0, 0.2196078, 1, 1,
0.3347639, -0.4784415, 2.065596, 0, 0.2156863, 1, 1,
0.3347733, 0.07465105, 0.359392, 0, 0.2078431, 1, 1,
0.3388219, 0.2761235, 1.281707, 0, 0.2039216, 1, 1,
0.3390318, -1.204381, 3.44468, 0, 0.1960784, 1, 1,
0.3394932, 1.712503, 0.991555, 0, 0.1882353, 1, 1,
0.3465302, 0.243992, 2.43942, 0, 0.1843137, 1, 1,
0.3469599, 0.3302165, 0.2490915, 0, 0.1764706, 1, 1,
0.3476207, 1.221128, 1.05986, 0, 0.172549, 1, 1,
0.3497277, 0.1817919, 1.416792, 0, 0.1647059, 1, 1,
0.3499472, 0.4742297, -1.729754, 0, 0.1607843, 1, 1,
0.3534361, 1.210606, 0.2843727, 0, 0.1529412, 1, 1,
0.3592665, 0.8315179, -1.236417, 0, 0.1490196, 1, 1,
0.3594032, 0.7271919, -0.540652, 0, 0.1411765, 1, 1,
0.3663616, 0.3871655, 1.770878, 0, 0.1372549, 1, 1,
0.3699597, 0.2875283, -0.1234617, 0, 0.1294118, 1, 1,
0.3733967, 0.7617531, 1.603658, 0, 0.1254902, 1, 1,
0.3785353, 0.5653933, 0.8473819, 0, 0.1176471, 1, 1,
0.3799725, -0.668677, 2.859342, 0, 0.1137255, 1, 1,
0.3833866, -1.015624, 1.341825, 0, 0.1058824, 1, 1,
0.3833923, -0.5257621, 0.6402344, 0, 0.09803922, 1, 1,
0.3872599, 0.009036355, 2.352121, 0, 0.09411765, 1, 1,
0.3949795, -1.338226, 1.841791, 0, 0.08627451, 1, 1,
0.3976185, 1.108639, -0.9210621, 0, 0.08235294, 1, 1,
0.3985817, 0.0225915, 0.6209803, 0, 0.07450981, 1, 1,
0.3988543, -0.5075418, 2.36939, 0, 0.07058824, 1, 1,
0.4051956, -0.2609842, 1.008107, 0, 0.0627451, 1, 1,
0.4118019, 0.4604619, 2.138039, 0, 0.05882353, 1, 1,
0.4144321, 1.272859, -1.878335, 0, 0.05098039, 1, 1,
0.4158626, 2.870525, 0.02638587, 0, 0.04705882, 1, 1,
0.4172158, 0.7622801, 2.108641, 0, 0.03921569, 1, 1,
0.4182106, 0.776323, -1.784636, 0, 0.03529412, 1, 1,
0.4189889, -0.6271197, 2.842033, 0, 0.02745098, 1, 1,
0.4197078, -0.09595531, 0.7976049, 0, 0.02352941, 1, 1,
0.4229846, 0.642607, 0.5226013, 0, 0.01568628, 1, 1,
0.4260141, -1.556858, 4.55812, 0, 0.01176471, 1, 1,
0.4263549, -1.042108, 2.623354, 0, 0.003921569, 1, 1,
0.4296113, 1.290141, -0.2639959, 0.003921569, 0, 1, 1,
0.4361646, 1.197948, 0.7728939, 0.007843138, 0, 1, 1,
0.4395426, 0.2283169, 2.877259, 0.01568628, 0, 1, 1,
0.4447459, -1.9661, 3.629536, 0.01960784, 0, 1, 1,
0.4485733, 0.6806404, 0.0545525, 0.02745098, 0, 1, 1,
0.4522807, -2.82883, 2.104602, 0.03137255, 0, 1, 1,
0.4543905, -1.117686, 1.716624, 0.03921569, 0, 1, 1,
0.459139, 2.909505, -0.9576347, 0.04313726, 0, 1, 1,
0.4611827, 0.436981, -0.01686084, 0.05098039, 0, 1, 1,
0.4633034, -0.1391848, 2.819641, 0.05490196, 0, 1, 1,
0.4637068, 2.892826, -0.4294107, 0.0627451, 0, 1, 1,
0.4725968, -0.1763564, 2.559153, 0.06666667, 0, 1, 1,
0.4740894, 1.203686, 0.3413528, 0.07450981, 0, 1, 1,
0.4760597, -0.5125736, 2.293149, 0.07843138, 0, 1, 1,
0.4815214, -0.9457606, 1.748229, 0.08627451, 0, 1, 1,
0.4836553, -0.900007, 2.04564, 0.09019608, 0, 1, 1,
0.4846345, -0.4503758, 1.600605, 0.09803922, 0, 1, 1,
0.4907967, -0.6508405, 3.400802, 0.1058824, 0, 1, 1,
0.4920592, 0.09278367, 1.980865, 0.1098039, 0, 1, 1,
0.4945077, 0.5727537, 0.5020821, 0.1176471, 0, 1, 1,
0.4974587, 1.684044, -0.5103168, 0.1215686, 0, 1, 1,
0.5022193, -0.510453, 1.224379, 0.1294118, 0, 1, 1,
0.5026833, -0.7514433, 3.174968, 0.1333333, 0, 1, 1,
0.5068251, 0.2877618, 1.634374, 0.1411765, 0, 1, 1,
0.5097636, 0.3053654, 1.171036, 0.145098, 0, 1, 1,
0.5106065, 2.271995, 0.7166654, 0.1529412, 0, 1, 1,
0.5141609, 1.032471, -0.3778971, 0.1568628, 0, 1, 1,
0.5149096, -0.6848724, 3.282106, 0.1647059, 0, 1, 1,
0.5164047, 0.9484254, -0.3101029, 0.1686275, 0, 1, 1,
0.5164141, 0.5859023, -0.9432806, 0.1764706, 0, 1, 1,
0.5184649, -0.7700137, 2.807215, 0.1803922, 0, 1, 1,
0.5236042, -2.471751, 1.299213, 0.1882353, 0, 1, 1,
0.5247041, -1.661157, 2.942862, 0.1921569, 0, 1, 1,
0.5248423, 0.5470949, 0.6895187, 0.2, 0, 1, 1,
0.5263509, 1.350531, 0.7185411, 0.2078431, 0, 1, 1,
0.5277368, 1.505607, -0.8663096, 0.2117647, 0, 1, 1,
0.5369532, -1.619444, 2.800928, 0.2196078, 0, 1, 1,
0.539538, -0.04345504, 0.9348434, 0.2235294, 0, 1, 1,
0.5424981, -0.0755195, 1.621949, 0.2313726, 0, 1, 1,
0.5436148, 0.6561878, 1.932573, 0.2352941, 0, 1, 1,
0.5465637, 0.5406767, -0.3371953, 0.2431373, 0, 1, 1,
0.5516992, 0.8011925, 1.462325, 0.2470588, 0, 1, 1,
0.5577074, 1.034645, -0.6984572, 0.254902, 0, 1, 1,
0.5585355, -0.05558027, 1.668324, 0.2588235, 0, 1, 1,
0.568715, 0.1746568, 0.8300675, 0.2666667, 0, 1, 1,
0.5696161, 0.05697948, 1.90652, 0.2705882, 0, 1, 1,
0.5733457, 2.107281, 0.3810325, 0.2784314, 0, 1, 1,
0.5734826, -1.206677, 3.894158, 0.282353, 0, 1, 1,
0.5771282, 0.6309807, 1.275198, 0.2901961, 0, 1, 1,
0.577702, -1.71862, 1.783944, 0.2941177, 0, 1, 1,
0.5807061, 1.669695, -0.04688966, 0.3019608, 0, 1, 1,
0.5813966, 1.114116, 0.9497736, 0.3098039, 0, 1, 1,
0.5866582, -0.7306833, 3.258626, 0.3137255, 0, 1, 1,
0.5886984, -0.1662608, 2.102479, 0.3215686, 0, 1, 1,
0.5981146, 1.502074, 1.322575, 0.3254902, 0, 1, 1,
0.6016842, -1.364905, 2.690191, 0.3333333, 0, 1, 1,
0.603034, 1.581884, 1.349163, 0.3372549, 0, 1, 1,
0.6043026, 1.752408, 1.746166, 0.345098, 0, 1, 1,
0.6071249, -1.869583, 2.391759, 0.3490196, 0, 1, 1,
0.6082382, -0.004597665, 1.664232, 0.3568628, 0, 1, 1,
0.6144658, -0.8189139, 1.387622, 0.3607843, 0, 1, 1,
0.6152133, 2.4089, 0.93446, 0.3686275, 0, 1, 1,
0.6170798, -2.314709, 1.768391, 0.372549, 0, 1, 1,
0.6175449, 0.4101746, 1.018076, 0.3803922, 0, 1, 1,
0.6184184, -0.2603772, 2.056173, 0.3843137, 0, 1, 1,
0.6186367, -0.9303554, 4.414676, 0.3921569, 0, 1, 1,
0.6229231, 0.3473696, -0.15529, 0.3960784, 0, 1, 1,
0.623064, 0.4030282, 0.9870236, 0.4039216, 0, 1, 1,
0.6266167, 0.6039967, 0.3889613, 0.4117647, 0, 1, 1,
0.6274308, -0.6676729, 1.186262, 0.4156863, 0, 1, 1,
0.6319662, 0.05005928, 1.074941, 0.4235294, 0, 1, 1,
0.6322764, -0.3664009, 2.720356, 0.427451, 0, 1, 1,
0.6347281, -1.592734, 1.16063, 0.4352941, 0, 1, 1,
0.6353577, -0.288898, 0.8040663, 0.4392157, 0, 1, 1,
0.6354464, 0.4663127, 2.121255, 0.4470588, 0, 1, 1,
0.6425233, -0.4320955, 3.661598, 0.4509804, 0, 1, 1,
0.6443148, -0.07775684, 2.023769, 0.4588235, 0, 1, 1,
0.6465387, -0.9200941, 4.510335, 0.4627451, 0, 1, 1,
0.6469005, 0.3701862, 0.1035658, 0.4705882, 0, 1, 1,
0.6501287, -0.9255881, 3.974657, 0.4745098, 0, 1, 1,
0.6521011, -0.3360953, 2.866497, 0.4823529, 0, 1, 1,
0.6608368, -0.4972716, 1.679333, 0.4862745, 0, 1, 1,
0.6643426, -0.1997797, 2.985135, 0.4941176, 0, 1, 1,
0.6647955, -0.5622666, 0.9982035, 0.5019608, 0, 1, 1,
0.6671001, 1.223272, 1.249397, 0.5058824, 0, 1, 1,
0.6701549, -0.425641, 3.435335, 0.5137255, 0, 1, 1,
0.6701677, -0.2762675, 3.096243, 0.5176471, 0, 1, 1,
0.6726343, 0.1652127, 3.166135, 0.5254902, 0, 1, 1,
0.679051, -0.1874283, 3.506648, 0.5294118, 0, 1, 1,
0.6811379, 0.7785658, 2.80632, 0.5372549, 0, 1, 1,
0.6919724, -0.7196681, 0.8382388, 0.5411765, 0, 1, 1,
0.6943716, -0.3358451, 2.217048, 0.5490196, 0, 1, 1,
0.6951531, -0.8844398, 4.150044, 0.5529412, 0, 1, 1,
0.6965699, -2.138411, 1.296838, 0.5607843, 0, 1, 1,
0.7007258, 0.4016934, 1.04516, 0.5647059, 0, 1, 1,
0.7015009, 0.2525601, -0.8438598, 0.572549, 0, 1, 1,
0.7021323, -0.7358641, 0.9392937, 0.5764706, 0, 1, 1,
0.7048293, 0.7806895, 1.633849, 0.5843138, 0, 1, 1,
0.706835, 0.9316207, 1.024433, 0.5882353, 0, 1, 1,
0.7104791, 0.8708733, 0.681978, 0.5960785, 0, 1, 1,
0.7120706, 0.8586007, -0.1623193, 0.6039216, 0, 1, 1,
0.7179035, -0.08736832, 3.535986, 0.6078432, 0, 1, 1,
0.7188997, -1.460018, 1.566224, 0.6156863, 0, 1, 1,
0.7198837, 0.4070223, -0.335116, 0.6196079, 0, 1, 1,
0.7241524, 0.4419262, 0.3838642, 0.627451, 0, 1, 1,
0.7247512, -0.7019612, 1.631176, 0.6313726, 0, 1, 1,
0.7267921, 1.66312, 2.049138, 0.6392157, 0, 1, 1,
0.7398872, -0.2315153, 3.554784, 0.6431373, 0, 1, 1,
0.7408862, -0.1035167, 1.774503, 0.6509804, 0, 1, 1,
0.7443978, -0.6909551, 1.305899, 0.654902, 0, 1, 1,
0.745019, -0.8628141, 2.758649, 0.6627451, 0, 1, 1,
0.7460172, -0.1449364, 1.943931, 0.6666667, 0, 1, 1,
0.7482375, 0.2841116, 0.5981092, 0.6745098, 0, 1, 1,
0.7488315, 1.135321, -0.5127952, 0.6784314, 0, 1, 1,
0.7522738, -1.398159, 3.022779, 0.6862745, 0, 1, 1,
0.7535533, -0.8400557, 3.283691, 0.6901961, 0, 1, 1,
0.7558265, 0.6343003, -0.06148478, 0.6980392, 0, 1, 1,
0.7582552, -0.8796712, 1.564252, 0.7058824, 0, 1, 1,
0.7588006, 0.0218059, 1.928586, 0.7098039, 0, 1, 1,
0.7640961, 0.2803593, 0.5921795, 0.7176471, 0, 1, 1,
0.7662198, 2.669446, 0.1062561, 0.7215686, 0, 1, 1,
0.7708, 0.4671058, 0.8203997, 0.7294118, 0, 1, 1,
0.775839, 1.078181, -0.4076457, 0.7333333, 0, 1, 1,
0.7780997, -0.6259471, 1.906017, 0.7411765, 0, 1, 1,
0.7802232, -0.119599, 1.257098, 0.7450981, 0, 1, 1,
0.780243, -0.277243, 1.88067, 0.7529412, 0, 1, 1,
0.7832859, -0.501003, 0.9249228, 0.7568628, 0, 1, 1,
0.7865434, -0.1297226, 0.9534961, 0.7647059, 0, 1, 1,
0.7875776, 0.7348408, -0.8570128, 0.7686275, 0, 1, 1,
0.7901107, 0.8364186, 2.538043, 0.7764706, 0, 1, 1,
0.7945467, 2.163412, -0.1699559, 0.7803922, 0, 1, 1,
0.7957642, -0.965303, 1.59861, 0.7882353, 0, 1, 1,
0.8074658, 2.293841, 1.283791, 0.7921569, 0, 1, 1,
0.8147101, -0.4226404, 2.335349, 0.8, 0, 1, 1,
0.8191388, 0.695886, 1.119905, 0.8078431, 0, 1, 1,
0.8314495, 1.380696, 0.5532625, 0.8117647, 0, 1, 1,
0.8315897, -0.3532311, 2.420559, 0.8196079, 0, 1, 1,
0.8361682, -0.1065344, 0.8726439, 0.8235294, 0, 1, 1,
0.8376087, 0.04459653, 3.198463, 0.8313726, 0, 1, 1,
0.8376104, -0.7189357, 1.294877, 0.8352941, 0, 1, 1,
0.8402446, 0.6410276, -0.3646144, 0.8431373, 0, 1, 1,
0.8402702, -0.5893182, 1.342331, 0.8470588, 0, 1, 1,
0.841567, -1.456586, 1.884704, 0.854902, 0, 1, 1,
0.8431522, -2.463128, 4.05196, 0.8588235, 0, 1, 1,
0.8456881, -1.627575, 1.940039, 0.8666667, 0, 1, 1,
0.8464667, 1.581519, 1.789498, 0.8705882, 0, 1, 1,
0.8511589, 0.625273, 2.228496, 0.8784314, 0, 1, 1,
0.8567966, 1.090181, -0.04481057, 0.8823529, 0, 1, 1,
0.8568663, 0.9509913, 0.7394934, 0.8901961, 0, 1, 1,
0.8582951, -0.2257463, 2.794216, 0.8941177, 0, 1, 1,
0.8627947, -1.761111, 1.821989, 0.9019608, 0, 1, 1,
0.8643194, -0.2760442, 4.208752, 0.9098039, 0, 1, 1,
0.8659052, -0.3313226, 1.8053, 0.9137255, 0, 1, 1,
0.8681151, 1.017539, 1.811229, 0.9215686, 0, 1, 1,
0.8706285, 1.439297, 0.1693581, 0.9254902, 0, 1, 1,
0.8728973, 0.3881528, 0.2386145, 0.9333333, 0, 1, 1,
0.8777714, 0.2891383, 1.289094, 0.9372549, 0, 1, 1,
0.8782974, -2.035574, 2.690161, 0.945098, 0, 1, 1,
0.8884546, 0.2783791, 1.445816, 0.9490196, 0, 1, 1,
0.8902488, -0.8088998, 2.482551, 0.9568627, 0, 1, 1,
0.8966868, 0.282034, 2.965743, 0.9607843, 0, 1, 1,
0.896908, -1.250549, 2.291238, 0.9686275, 0, 1, 1,
0.8988168, -1.134245, 3.871115, 0.972549, 0, 1, 1,
0.9000401, 1.263525, 1.826889, 0.9803922, 0, 1, 1,
0.9043235, -1.122311, 0.364362, 0.9843137, 0, 1, 1,
0.9158074, 0.227807, 1.911227, 0.9921569, 0, 1, 1,
0.9168199, -0.849393, 1.916866, 0.9960784, 0, 1, 1,
0.92269, 1.237296, 0.5518776, 1, 0, 0.9960784, 1,
0.9319171, 1.388956, -0.5580819, 1, 0, 0.9882353, 1,
0.9366577, -0.1583081, 1.514461, 1, 0, 0.9843137, 1,
0.9379518, 0.2575622, 0.6857728, 1, 0, 0.9764706, 1,
0.955051, -0.3906321, 0.2436375, 1, 0, 0.972549, 1,
0.9553373, 0.2978982, 1.145469, 1, 0, 0.9647059, 1,
0.9569167, -0.2248956, 0.7052706, 1, 0, 0.9607843, 1,
0.9577218, 0.4348944, 2.554832, 1, 0, 0.9529412, 1,
0.9723395, 2.832444, 0.581789, 1, 0, 0.9490196, 1,
0.9791688, 0.3483119, 1.155698, 1, 0, 0.9411765, 1,
0.9811101, -0.1996918, 3.23511, 1, 0, 0.9372549, 1,
0.9821666, 0.2947775, 1.868751, 1, 0, 0.9294118, 1,
0.9936268, -1.437171, 2.204145, 1, 0, 0.9254902, 1,
0.9958316, -0.6399004, 1.248261, 1, 0, 0.9176471, 1,
0.9992784, -2.19259, 2.195279, 1, 0, 0.9137255, 1,
1.005496, 0.2516026, 1.420645, 1, 0, 0.9058824, 1,
1.013753, 0.7932149, 2.778624, 1, 0, 0.9019608, 1,
1.022316, -0.6513463, 3.081935, 1, 0, 0.8941177, 1,
1.024926, 0.3046953, 1.46041, 1, 0, 0.8862745, 1,
1.029084, -0.1754479, 3.017959, 1, 0, 0.8823529, 1,
1.035197, 0.3977816, 2.203336, 1, 0, 0.8745098, 1,
1.042814, 2.181918, -0.3878581, 1, 0, 0.8705882, 1,
1.044097, 0.7836251, -0.04281221, 1, 0, 0.8627451, 1,
1.04556, -0.7109168, 2.82922, 1, 0, 0.8588235, 1,
1.051338, 0.1778904, 2.989732, 1, 0, 0.8509804, 1,
1.055788, -0.4266077, 2.637631, 1, 0, 0.8470588, 1,
1.065721, -0.7033434, 3.276483, 1, 0, 0.8392157, 1,
1.074773, -1.713554, 0.2140897, 1, 0, 0.8352941, 1,
1.086276, 0.1699855, 1.315075, 1, 0, 0.827451, 1,
1.090961, -0.6277394, 2.042354, 1, 0, 0.8235294, 1,
1.095788, -0.6251808, 3.056425, 1, 0, 0.8156863, 1,
1.100439, -0.4451783, 1.951322, 1, 0, 0.8117647, 1,
1.100922, -1.274714, 1.289551, 1, 0, 0.8039216, 1,
1.10111, 0.9916597, 0.3771021, 1, 0, 0.7960784, 1,
1.101758, 1.852202, 1.360647, 1, 0, 0.7921569, 1,
1.106827, -0.9596134, 1.745652, 1, 0, 0.7843137, 1,
1.108143, -0.7051569, 0.6452549, 1, 0, 0.7803922, 1,
1.126089, 1.236514, 1.296292, 1, 0, 0.772549, 1,
1.127455, -0.5052348, 1.839622, 1, 0, 0.7686275, 1,
1.129814, -0.4162618, 0.2197737, 1, 0, 0.7607843, 1,
1.133304, -0.4409539, 0.7299397, 1, 0, 0.7568628, 1,
1.133936, 1.254902, 0.283434, 1, 0, 0.7490196, 1,
1.136585, -0.005208856, 2.32707, 1, 0, 0.7450981, 1,
1.136823, 0.2951282, 0.8411292, 1, 0, 0.7372549, 1,
1.139755, -0.1712552, 1.651637, 1, 0, 0.7333333, 1,
1.14271, -0.7664573, 2.174294, 1, 0, 0.7254902, 1,
1.150063, -1.185326, 0.6243929, 1, 0, 0.7215686, 1,
1.164067, -0.04902194, 2.027271, 1, 0, 0.7137255, 1,
1.174655, 0.4897492, 2.495243, 1, 0, 0.7098039, 1,
1.175746, -1.246645, 2.656414, 1, 0, 0.7019608, 1,
1.176083, -1.078688, 0.1352266, 1, 0, 0.6941177, 1,
1.179452, 0.04895523, 1.580237, 1, 0, 0.6901961, 1,
1.185257, 1.842636, 2.361803, 1, 0, 0.682353, 1,
1.189971, -0.2440588, 2.378268, 1, 0, 0.6784314, 1,
1.195179, -0.6652187, -0.04044529, 1, 0, 0.6705883, 1,
1.200394, 0.6524276, 2.606464, 1, 0, 0.6666667, 1,
1.200528, 0.145377, 0.789596, 1, 0, 0.6588235, 1,
1.200624, -0.538753, 2.394424, 1, 0, 0.654902, 1,
1.202537, -0.546971, 2.53706, 1, 0, 0.6470588, 1,
1.205588, 0.546407, 1.339799, 1, 0, 0.6431373, 1,
1.209425, -0.5065876, 0.5599834, 1, 0, 0.6352941, 1,
1.217731, -0.1839909, 1.505805, 1, 0, 0.6313726, 1,
1.218206, 2.171752, 1.661132, 1, 0, 0.6235294, 1,
1.220751, 0.3397637, 3.520579, 1, 0, 0.6196079, 1,
1.220946, -2.151481, 1.464427, 1, 0, 0.6117647, 1,
1.221202, -2.019146, 3.581931, 1, 0, 0.6078432, 1,
1.226722, -0.4540536, 1.271572, 1, 0, 0.6, 1,
1.232201, 0.7466923, 1.277331, 1, 0, 0.5921569, 1,
1.233737, 0.4292069, 0.3946162, 1, 0, 0.5882353, 1,
1.236219, -1.028621, 2.312279, 1, 0, 0.5803922, 1,
1.240975, 1.097054, 0.5171141, 1, 0, 0.5764706, 1,
1.241732, -1.86625, 2.035843, 1, 0, 0.5686275, 1,
1.241779, 1.024809, -1.602624, 1, 0, 0.5647059, 1,
1.244873, 1.711133, -0.06503855, 1, 0, 0.5568628, 1,
1.245103, -1.461557, 1.488299, 1, 0, 0.5529412, 1,
1.256201, -0.9649941, 2.390543, 1, 0, 0.5450981, 1,
1.264238, -0.04020656, 1.758688, 1, 0, 0.5411765, 1,
1.264488, -0.9792514, 2.314769, 1, 0, 0.5333334, 1,
1.26605, 0.7843435, -0.5645878, 1, 0, 0.5294118, 1,
1.274951, -1.608614, 2.088419, 1, 0, 0.5215687, 1,
1.290734, -0.9968631, 1.424505, 1, 0, 0.5176471, 1,
1.309858, -0.4033035, 3.542326, 1, 0, 0.509804, 1,
1.314155, -1.267181, 2.458554, 1, 0, 0.5058824, 1,
1.316834, -0.3693023, 0.2811545, 1, 0, 0.4980392, 1,
1.318982, -2.032848, 1.597698, 1, 0, 0.4901961, 1,
1.319514, 0.2457737, 2.843326, 1, 0, 0.4862745, 1,
1.322736, 0.3787232, -0.1408061, 1, 0, 0.4784314, 1,
1.329399, 1.809676, 0.4281446, 1, 0, 0.4745098, 1,
1.330374, -1.845796, 2.430734, 1, 0, 0.4666667, 1,
1.332531, -0.3004925, 2.250319, 1, 0, 0.4627451, 1,
1.333006, -1.349946, 4.045082, 1, 0, 0.454902, 1,
1.342027, -0.5917442, 0.5220783, 1, 0, 0.4509804, 1,
1.350605, 1.198533, 0.8758312, 1, 0, 0.4431373, 1,
1.36075, 0.2153378, 0.029515, 1, 0, 0.4392157, 1,
1.366693, -0.9486118, 1.357414, 1, 0, 0.4313726, 1,
1.382435, -1.119502, 2.618193, 1, 0, 0.427451, 1,
1.383225, -1.676431, 0.6033163, 1, 0, 0.4196078, 1,
1.386498, 1.864363, 0.1487215, 1, 0, 0.4156863, 1,
1.392079, -0.9741441, 2.57271, 1, 0, 0.4078431, 1,
1.392231, -1.423515, 1.24454, 1, 0, 0.4039216, 1,
1.398223, 0.4860636, 0.6548715, 1, 0, 0.3960784, 1,
1.40879, 1.569704, 1.022064, 1, 0, 0.3882353, 1,
1.428614, 1.089221, 1.367355, 1, 0, 0.3843137, 1,
1.428856, 0.9177695, 2.748828, 1, 0, 0.3764706, 1,
1.439099, 1.172075, 1.409743, 1, 0, 0.372549, 1,
1.447345, 0.1488005, 1.221518, 1, 0, 0.3647059, 1,
1.45348, -0.9552895, 1.9561, 1, 0, 0.3607843, 1,
1.465883, -0.4696357, 1.931564, 1, 0, 0.3529412, 1,
1.466085, 1.211503, 1.457307, 1, 0, 0.3490196, 1,
1.498514, 1.047704, 0.8963969, 1, 0, 0.3411765, 1,
1.501458, 1.136048, 1.83051, 1, 0, 0.3372549, 1,
1.506462, -0.5825336, 3.23947, 1, 0, 0.3294118, 1,
1.527339, 0.1918597, 1.884214, 1, 0, 0.3254902, 1,
1.533949, -2.925309, 3.797015, 1, 0, 0.3176471, 1,
1.541962, 1.295143, 1.617593, 1, 0, 0.3137255, 1,
1.546345, -0.7689634, 1.33675, 1, 0, 0.3058824, 1,
1.566225, -0.5089015, 2.507076, 1, 0, 0.2980392, 1,
1.569104, 0.4562306, 0.9072461, 1, 0, 0.2941177, 1,
1.574157, 0.0305931, 3.033766, 1, 0, 0.2862745, 1,
1.575368, 1.133019, 3.426061, 1, 0, 0.282353, 1,
1.576677, -0.06158008, 1.629773, 1, 0, 0.2745098, 1,
1.57703, 0.8867139, 0.2277211, 1, 0, 0.2705882, 1,
1.588398, 1.600078, 1.761221, 1, 0, 0.2627451, 1,
1.601257, 0.1218253, 2.28007, 1, 0, 0.2588235, 1,
1.626472, -0.7693133, 2.059925, 1, 0, 0.2509804, 1,
1.631863, -0.345199, 2.663451, 1, 0, 0.2470588, 1,
1.651858, 0.809059, -0.2082014, 1, 0, 0.2392157, 1,
1.662333, 0.2326001, 1.903801, 1, 0, 0.2352941, 1,
1.66556, 0.571645, 1.126161, 1, 0, 0.227451, 1,
1.676767, -0.6922356, 1.792035, 1, 0, 0.2235294, 1,
1.684046, 0.1362962, 2.471025, 1, 0, 0.2156863, 1,
1.705366, 0.219024, -0.3028493, 1, 0, 0.2117647, 1,
1.712699, 0.3693318, -0.1403671, 1, 0, 0.2039216, 1,
1.724787, -0.9859614, 2.72503, 1, 0, 0.1960784, 1,
1.742713, 1.218338, 3.331432, 1, 0, 0.1921569, 1,
1.7503, -0.9733074, 2.54124, 1, 0, 0.1843137, 1,
1.755555, -0.08154126, 1.20068, 1, 0, 0.1803922, 1,
1.797027, -1.594674, 3.0221, 1, 0, 0.172549, 1,
1.804437, -1.462175, 2.15942, 1, 0, 0.1686275, 1,
1.815112, 0.9463905, 0.5646209, 1, 0, 0.1607843, 1,
1.825768, 1.746214, 0.9695774, 1, 0, 0.1568628, 1,
1.872695, -0.197428, -0.7272522, 1, 0, 0.1490196, 1,
1.882867, -0.9403782, 1.642953, 1, 0, 0.145098, 1,
1.886686, -1.030748, 2.085338, 1, 0, 0.1372549, 1,
1.922766, 1.601194, 0.4208974, 1, 0, 0.1333333, 1,
1.933107, -2.082329, 1.999622, 1, 0, 0.1254902, 1,
1.93572, -0.8854842, 2.223357, 1, 0, 0.1215686, 1,
1.939123, -0.05603853, 1.832573, 1, 0, 0.1137255, 1,
1.940406, -1.61876, 2.105934, 1, 0, 0.1098039, 1,
1.972289, -0.07035097, 3.340625, 1, 0, 0.1019608, 1,
2.024655, 0.2967884, 1.113621, 1, 0, 0.09411765, 1,
2.087932, -0.1593002, -0.4131705, 1, 0, 0.09019608, 1,
2.105837, -0.719844, 1.116931, 1, 0, 0.08235294, 1,
2.146427, -0.5326678, 2.467973, 1, 0, 0.07843138, 1,
2.226245, -1.360362, 1.833434, 1, 0, 0.07058824, 1,
2.237018, 0.6618682, 1.397318, 1, 0, 0.06666667, 1,
2.261054, -0.8632219, 0.9601303, 1, 0, 0.05882353, 1,
2.268944, 0.1074755, 1.711133, 1, 0, 0.05490196, 1,
2.407653, -1.184193, 3.42419, 1, 0, 0.04705882, 1,
2.453851, -2.222576, 1.790516, 1, 0, 0.04313726, 1,
2.500993, 0.1338477, 4.815246, 1, 0, 0.03529412, 1,
2.502659, -1.424194, 2.659515, 1, 0, 0.03137255, 1,
2.55652, 1.157509, 3.179968, 1, 0, 0.02352941, 1,
2.589358, -0.9053349, 0.6974816, 1, 0, 0.01960784, 1,
2.778256, -1.937191, 2.754799, 1, 0, 0.01176471, 1,
2.855314, -0.8253564, 1.041681, 1, 0, 0.007843138, 1
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
-0.5789804, -5.118972, -6.513898, 0, -0.5, 0.5, 0.5,
-0.5789804, -5.118972, -6.513898, 1, -0.5, 0.5, 0.5,
-0.5789804, -5.118972, -6.513898, 1, 1.5, 0.5, 0.5,
-0.5789804, -5.118972, -6.513898, 0, 1.5, 0.5, 0.5
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
-5.1775, -0.5229349, -6.513898, 0, -0.5, 0.5, 0.5,
-5.1775, -0.5229349, -6.513898, 1, -0.5, 0.5, 0.5,
-5.1775, -0.5229349, -6.513898, 1, 1.5, 0.5, 0.5,
-5.1775, -0.5229349, -6.513898, 0, 1.5, 0.5, 0.5
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
-5.1775, -5.118972, 0.9742475, 0, -0.5, 0.5, 0.5,
-5.1775, -5.118972, 0.9742475, 1, -0.5, 0.5, 0.5,
-5.1775, -5.118972, 0.9742475, 1, 1.5, 0.5, 0.5,
-5.1775, -5.118972, 0.9742475, 0, 1.5, 0.5, 0.5
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
-4, -4.058348, -4.785864,
2, -4.058348, -4.785864,
-4, -4.058348, -4.785864,
-4, -4.235119, -5.07387,
-3, -4.058348, -4.785864,
-3, -4.235119, -5.07387,
-2, -4.058348, -4.785864,
-2, -4.235119, -5.07387,
-1, -4.058348, -4.785864,
-1, -4.235119, -5.07387,
0, -4.058348, -4.785864,
0, -4.235119, -5.07387,
1, -4.058348, -4.785864,
1, -4.235119, -5.07387,
2, -4.058348, -4.785864,
2, -4.235119, -5.07387
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
"-4",
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
-4, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
-4, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
-4, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
-4, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5,
-3, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
-3, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
-3, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
-3, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5,
-2, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
-2, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
-2, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
-2, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5,
-1, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
-1, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
-1, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
-1, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5,
0, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
0, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
0, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
0, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5,
1, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
1, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
1, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
1, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5,
2, -4.58866, -5.649881, 0, -0.5, 0.5, 0.5,
2, -4.58866, -5.649881, 1, -0.5, 0.5, 0.5,
2, -4.58866, -5.649881, 1, 1.5, 0.5, 0.5,
2, -4.58866, -5.649881, 0, 1.5, 0.5, 0.5
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
-4.116303, -3, -4.785864,
-4.116303, 2, -4.785864,
-4.116303, -3, -4.785864,
-4.293169, -3, -5.07387,
-4.116303, -2, -4.785864,
-4.293169, -2, -5.07387,
-4.116303, -1, -4.785864,
-4.293169, -1, -5.07387,
-4.116303, 0, -4.785864,
-4.293169, 0, -5.07387,
-4.116303, 1, -4.785864,
-4.293169, 1, -5.07387,
-4.116303, 2, -4.785864,
-4.293169, 2, -5.07387
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
-4.646902, -3, -5.649881, 0, -0.5, 0.5, 0.5,
-4.646902, -3, -5.649881, 1, -0.5, 0.5, 0.5,
-4.646902, -3, -5.649881, 1, 1.5, 0.5, 0.5,
-4.646902, -3, -5.649881, 0, 1.5, 0.5, 0.5,
-4.646902, -2, -5.649881, 0, -0.5, 0.5, 0.5,
-4.646902, -2, -5.649881, 1, -0.5, 0.5, 0.5,
-4.646902, -2, -5.649881, 1, 1.5, 0.5, 0.5,
-4.646902, -2, -5.649881, 0, 1.5, 0.5, 0.5,
-4.646902, -1, -5.649881, 0, -0.5, 0.5, 0.5,
-4.646902, -1, -5.649881, 1, -0.5, 0.5, 0.5,
-4.646902, -1, -5.649881, 1, 1.5, 0.5, 0.5,
-4.646902, -1, -5.649881, 0, 1.5, 0.5, 0.5,
-4.646902, 0, -5.649881, 0, -0.5, 0.5, 0.5,
-4.646902, 0, -5.649881, 1, -0.5, 0.5, 0.5,
-4.646902, 0, -5.649881, 1, 1.5, 0.5, 0.5,
-4.646902, 0, -5.649881, 0, 1.5, 0.5, 0.5,
-4.646902, 1, -5.649881, 0, -0.5, 0.5, 0.5,
-4.646902, 1, -5.649881, 1, -0.5, 0.5, 0.5,
-4.646902, 1, -5.649881, 1, 1.5, 0.5, 0.5,
-4.646902, 1, -5.649881, 0, 1.5, 0.5, 0.5,
-4.646902, 2, -5.649881, 0, -0.5, 0.5, 0.5,
-4.646902, 2, -5.649881, 1, -0.5, 0.5, 0.5,
-4.646902, 2, -5.649881, 1, 1.5, 0.5, 0.5,
-4.646902, 2, -5.649881, 0, 1.5, 0.5, 0.5
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
-4.116303, -4.058348, -4,
-4.116303, -4.058348, 6,
-4.116303, -4.058348, -4,
-4.293169, -4.235119, -4,
-4.116303, -4.058348, -2,
-4.293169, -4.235119, -2,
-4.116303, -4.058348, 0,
-4.293169, -4.235119, 0,
-4.116303, -4.058348, 2,
-4.293169, -4.235119, 2,
-4.116303, -4.058348, 4,
-4.293169, -4.235119, 4,
-4.116303, -4.058348, 6,
-4.293169, -4.235119, 6
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
"4",
"6"
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
-4.646902, -4.58866, -4, 0, -0.5, 0.5, 0.5,
-4.646902, -4.58866, -4, 1, -0.5, 0.5, 0.5,
-4.646902, -4.58866, -4, 1, 1.5, 0.5, 0.5,
-4.646902, -4.58866, -4, 0, 1.5, 0.5, 0.5,
-4.646902, -4.58866, -2, 0, -0.5, 0.5, 0.5,
-4.646902, -4.58866, -2, 1, -0.5, 0.5, 0.5,
-4.646902, -4.58866, -2, 1, 1.5, 0.5, 0.5,
-4.646902, -4.58866, -2, 0, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 0, 0, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 0, 1, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 0, 1, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 0, 0, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 2, 0, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 2, 1, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 2, 1, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 2, 0, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 4, 0, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 4, 1, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 4, 1, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 4, 0, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 6, 0, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 6, 1, -0.5, 0.5, 0.5,
-4.646902, -4.58866, 6, 1, 1.5, 0.5, 0.5,
-4.646902, -4.58866, 6, 0, 1.5, 0.5, 0.5
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
-4.116303, -4.058348, -4.785864,
-4.116303, 3.012478, -4.785864,
-4.116303, -4.058348, 6.734359,
-4.116303, 3.012478, 6.734359,
-4.116303, -4.058348, -4.785864,
-4.116303, -4.058348, 6.734359,
-4.116303, 3.012478, -4.785864,
-4.116303, 3.012478, 6.734359,
-4.116303, -4.058348, -4.785864,
2.958343, -4.058348, -4.785864,
-4.116303, -4.058348, 6.734359,
2.958343, -4.058348, 6.734359,
-4.116303, 3.012478, -4.785864,
2.958343, 3.012478, -4.785864,
-4.116303, 3.012478, 6.734359,
2.958343, 3.012478, 6.734359,
2.958343, -4.058348, -4.785864,
2.958343, 3.012478, -4.785864,
2.958343, -4.058348, 6.734359,
2.958343, 3.012478, 6.734359,
2.958343, -4.058348, -4.785864,
2.958343, -4.058348, 6.734359,
2.958343, 3.012478, -4.785864,
2.958343, 3.012478, 6.734359
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
var radius = 8.146709;
var distance = 36.24563;
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
mvMatrix.translate( 0.5789804, 0.5229349, -0.9742475 );
mvMatrix.scale( 1.245063, 1.245736, 0.7646016 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.24563);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Terramycin<-read.table("Terramycin.xyz")
```

```
## Error in read.table("Terramycin.xyz"): no lines available in input
```

```r
x<-Terramycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Terramycin' not found
```

```r
y<-Terramycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Terramycin' not found
```

```r
z<-Terramycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Terramycin' not found
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
-4.013275, 1.431611, -0.6560915, 0, 0, 1, 1, 1,
-3.059001, 0.5552548, -0.1910497, 1, 0, 0, 1, 1,
-2.906595, 0.8917844, -0.1237862, 1, 0, 0, 1, 1,
-2.733054, 1.898437, -1.420694, 1, 0, 0, 1, 1,
-2.703533, 0.5286809, 0.4162227, 1, 0, 0, 1, 1,
-2.692205, 1.031629, -1.034733, 1, 0, 0, 1, 1,
-2.622085, -0.4201852, -1.504853, 0, 0, 0, 1, 1,
-2.457991, 1.083838, -1.237169, 0, 0, 0, 1, 1,
-2.427418, -0.4615915, -1.793163, 0, 0, 0, 1, 1,
-2.403845, -0.7311239, -2.393309, 0, 0, 0, 1, 1,
-2.399314, -0.2044738, -1.356297, 0, 0, 0, 1, 1,
-2.388936, -0.04047477, -1.065317, 0, 0, 0, 1, 1,
-2.375421, -0.2653085, -2.068545, 0, 0, 0, 1, 1,
-2.345131, 0.4276161, -2.345167, 1, 1, 1, 1, 1,
-2.291511, -0.9537141, -2.762656, 1, 1, 1, 1, 1,
-2.252563, -1.728732, -2.048133, 1, 1, 1, 1, 1,
-2.24562, 1.512447, 0.124847, 1, 1, 1, 1, 1,
-2.235386, -0.8141295, -2.233465, 1, 1, 1, 1, 1,
-2.210929, 0.7797053, -0.7633268, 1, 1, 1, 1, 1,
-2.196048, -0.4884, -1.408079, 1, 1, 1, 1, 1,
-2.138056, 1.093277, 0.08185559, 1, 1, 1, 1, 1,
-2.12014, -0.737339, -2.549455, 1, 1, 1, 1, 1,
-2.077361, -0.07153636, -2.029149, 1, 1, 1, 1, 1,
-2.000039, 1.043483, 0.1086215, 1, 1, 1, 1, 1,
-1.973525, -0.5398591, -3.003456, 1, 1, 1, 1, 1,
-1.969231, 0.2635857, -1.771311, 1, 1, 1, 1, 1,
-1.95975, 1.934839, 1.297659, 1, 1, 1, 1, 1,
-1.94427, -0.08300675, -1.223519, 1, 1, 1, 1, 1,
-1.938845, 0.1264166, -0.3693266, 0, 0, 1, 1, 1,
-1.9267, -0.6968967, -0.4953032, 1, 0, 0, 1, 1,
-1.913871, 1.258212, 0.1093103, 1, 0, 0, 1, 1,
-1.907971, 1.373623, -0.6088999, 1, 0, 0, 1, 1,
-1.89196, 1.962039, 0.4319217, 1, 0, 0, 1, 1,
-1.86822, -0.8265943, -1.836066, 1, 0, 0, 1, 1,
-1.865931, -0.03710422, -1.405968, 0, 0, 0, 1, 1,
-1.863352, -1.378907, -2.340953, 0, 0, 0, 1, 1,
-1.819526, -1.757491, -1.389917, 0, 0, 0, 1, 1,
-1.804945, -0.1066879, -2.509235, 0, 0, 0, 1, 1,
-1.798429, 0.840438, -1.029657, 0, 0, 0, 1, 1,
-1.784695, 0.2405953, 0.8291931, 0, 0, 0, 1, 1,
-1.780056, 0.8253191, -1.23787, 0, 0, 0, 1, 1,
-1.77477, 0.4581007, -2.136283, 1, 1, 1, 1, 1,
-1.765065, 0.4087769, -2.527775, 1, 1, 1, 1, 1,
-1.758496, -0.9019018, -1.831196, 1, 1, 1, 1, 1,
-1.725866, -1.079666, -2.512926, 1, 1, 1, 1, 1,
-1.720938, 0.6635982, -1.77423, 1, 1, 1, 1, 1,
-1.707359, 0.1924437, -1.392415, 1, 1, 1, 1, 1,
-1.701554, -1.927128, -0.7923045, 1, 1, 1, 1, 1,
-1.700874, 0.5665907, -0.8049225, 1, 1, 1, 1, 1,
-1.699903, -0.02001889, -0.2813163, 1, 1, 1, 1, 1,
-1.68179, -1.637829, -2.087579, 1, 1, 1, 1, 1,
-1.681758, 0.5462497, -1.955793, 1, 1, 1, 1, 1,
-1.67592, 0.3843297, -1.66354, 1, 1, 1, 1, 1,
-1.671547, 1.717017, 0.1391985, 1, 1, 1, 1, 1,
-1.66578, 0.1687456, -1.078367, 1, 1, 1, 1, 1,
-1.644353, 1.92911, -2.189793, 1, 1, 1, 1, 1,
-1.640702, 0.3026804, -1.214045, 0, 0, 1, 1, 1,
-1.633426, -0.1653893, -2.471629, 1, 0, 0, 1, 1,
-1.621326, -0.5569165, -2.692425, 1, 0, 0, 1, 1,
-1.614663, 0.2504747, 0.1461743, 1, 0, 0, 1, 1,
-1.613176, 1.527495, -2.198092, 1, 0, 0, 1, 1,
-1.60122, 0.0104957, -2.450803, 1, 0, 0, 1, 1,
-1.572099, -0.198278, -1.624209, 0, 0, 0, 1, 1,
-1.566316, -0.7075543, -1.136842, 0, 0, 0, 1, 1,
-1.553054, 1.109032, -0.2234052, 0, 0, 0, 1, 1,
-1.543086, -1.620921, -1.876833, 0, 0, 0, 1, 1,
-1.542837, 0.1371602, -0.2913069, 0, 0, 0, 1, 1,
-1.542009, 1.116827, -0.5808437, 0, 0, 0, 1, 1,
-1.541807, 0.8241788, 1.000267, 0, 0, 0, 1, 1,
-1.510087, -0.7599197, -1.120952, 1, 1, 1, 1, 1,
-1.496696, 0.048196, -1.349121, 1, 1, 1, 1, 1,
-1.495532, 0.4986182, -0.2521667, 1, 1, 1, 1, 1,
-1.476855, -0.1096151, -2.658323, 1, 1, 1, 1, 1,
-1.474011, 1.733634, -1.336806, 1, 1, 1, 1, 1,
-1.470555, -0.7718622, -2.253983, 1, 1, 1, 1, 1,
-1.470231, 0.4633334, -1.311301, 1, 1, 1, 1, 1,
-1.467549, 0.4881957, -1.840727, 1, 1, 1, 1, 1,
-1.459918, -1.541116, -2.1598, 1, 1, 1, 1, 1,
-1.45329, 0.7293627, 0.04136824, 1, 1, 1, 1, 1,
-1.432387, -0.8688821, -1.680579, 1, 1, 1, 1, 1,
-1.428158, -0.3964377, -2.673189, 1, 1, 1, 1, 1,
-1.422397, 0.300845, -0.2716249, 1, 1, 1, 1, 1,
-1.418086, -0.7839319, -2.087335, 1, 1, 1, 1, 1,
-1.413846, -1.061026, -0.97057, 1, 1, 1, 1, 1,
-1.406614, 0.3077908, 0.8465427, 0, 0, 1, 1, 1,
-1.398246, 0.2647433, -2.041308, 1, 0, 0, 1, 1,
-1.386491, -0.3562575, -1.951339, 1, 0, 0, 1, 1,
-1.369003, 0.3426579, -1.216087, 1, 0, 0, 1, 1,
-1.364174, 0.6181641, -0.657927, 1, 0, 0, 1, 1,
-1.350856, 0.5002055, -1.205028, 1, 0, 0, 1, 1,
-1.348879, 0.7376509, -1.047957, 0, 0, 0, 1, 1,
-1.343872, 1.68604, 1.405853, 0, 0, 0, 1, 1,
-1.338405, 2.200039, -0.234799, 0, 0, 0, 1, 1,
-1.338319, -1.668587, -3.70357, 0, 0, 0, 1, 1,
-1.338186, -1.125672, 0.2194044, 0, 0, 0, 1, 1,
-1.335563, 1.03056, 1.024542, 0, 0, 0, 1, 1,
-1.334758, -1.675803, -2.954463, 0, 0, 0, 1, 1,
-1.330133, 0.1096555, -0.3681688, 1, 1, 1, 1, 1,
-1.298788, 0.6902848, -3.33851, 1, 1, 1, 1, 1,
-1.293954, 0.7735617, -0.6783803, 1, 1, 1, 1, 1,
-1.287589, 0.6337309, -0.6085342, 1, 1, 1, 1, 1,
-1.287367, 0.04309783, -1.654289, 1, 1, 1, 1, 1,
-1.27714, -0.1362003, -1.955647, 1, 1, 1, 1, 1,
-1.277063, -0.5872679, -1.900919, 1, 1, 1, 1, 1,
-1.275796, 0.9728898, 1.701461, 1, 1, 1, 1, 1,
-1.273356, -1.678126, -1.392016, 1, 1, 1, 1, 1,
-1.259265, -0.9048689, -1.1764, 1, 1, 1, 1, 1,
-1.25675, -1.007711, -4.562949, 1, 1, 1, 1, 1,
-1.255262, -0.9345217, -1.385658, 1, 1, 1, 1, 1,
-1.245785, -0.6367184, 0.5924437, 1, 1, 1, 1, 1,
-1.242388, 0.7215289, -1.3294, 1, 1, 1, 1, 1,
-1.233714, -0.003059578, -0.2695302, 1, 1, 1, 1, 1,
-1.218486, -0.8658222, -0.8357689, 0, 0, 1, 1, 1,
-1.211249, -0.7752234, -2.966938, 1, 0, 0, 1, 1,
-1.21119, 0.008258609, -1.998217, 1, 0, 0, 1, 1,
-1.20755, 0.394731, -0.8007136, 1, 0, 0, 1, 1,
-1.20519, -0.2882088, -2.760818, 1, 0, 0, 1, 1,
-1.19724, 0.1472034, -0.6568832, 1, 0, 0, 1, 1,
-1.19551, -0.2111313, -2.497419, 0, 0, 0, 1, 1,
-1.185102, 2.319805, 0.2192692, 0, 0, 0, 1, 1,
-1.182245, 1.984129, 0.1236371, 0, 0, 0, 1, 1,
-1.178376, -0.2587979, -0.8328317, 0, 0, 0, 1, 1,
-1.175322, -2.464997, -2.71658, 0, 0, 0, 1, 1,
-1.175162, 0.7100846, -1.165242, 0, 0, 0, 1, 1,
-1.167206, 0.683946, -0.1914261, 0, 0, 0, 1, 1,
-1.167193, 0.1503557, -2.027987, 1, 1, 1, 1, 1,
-1.164172, -0.1920051, -1.49698, 1, 1, 1, 1, 1,
-1.164106, 0.8951443, -0.4329108, 1, 1, 1, 1, 1,
-1.161287, 0.2221194, -0.9664291, 1, 1, 1, 1, 1,
-1.161038, -0.9667643, -3.811531, 1, 1, 1, 1, 1,
-1.159647, -0.1922332, 0.1105091, 1, 1, 1, 1, 1,
-1.157205, 1.410689, -1.204494, 1, 1, 1, 1, 1,
-1.148195, 1.179245, -1.042157, 1, 1, 1, 1, 1,
-1.144913, -0.810428, -2.161279, 1, 1, 1, 1, 1,
-1.142581, -0.355201, -1.325972, 1, 1, 1, 1, 1,
-1.141184, 0.1020144, -1.963639, 1, 1, 1, 1, 1,
-1.135156, 0.8056782, -1.056083, 1, 1, 1, 1, 1,
-1.134679, -0.863614, -2.375927, 1, 1, 1, 1, 1,
-1.134092, -0.5745473, -2.089174, 1, 1, 1, 1, 1,
-1.132691, 0.8700688, 0.4719738, 1, 1, 1, 1, 1,
-1.123268, -0.6590533, -2.292276, 0, 0, 1, 1, 1,
-1.122275, -1.920304, -2.738707, 1, 0, 0, 1, 1,
-1.121962, -1.611594, -2.141819, 1, 0, 0, 1, 1,
-1.119789, -1.007625, -4.24849, 1, 0, 0, 1, 1,
-1.116209, -0.4531787, -2.919882, 1, 0, 0, 1, 1,
-1.11475, 1.067128, -0.8935212, 1, 0, 0, 1, 1,
-1.111485, 0.4363718, -1.353091, 0, 0, 0, 1, 1,
-1.109486, 0.09168743, -1.001787, 0, 0, 0, 1, 1,
-1.105636, -0.403616, -1.887599, 0, 0, 0, 1, 1,
-1.100681, 1.793555, -1.405648, 0, 0, 0, 1, 1,
-1.095251, 0.2221091, -1.402656, 0, 0, 0, 1, 1,
-1.093544, -0.04914211, -0.8733655, 0, 0, 0, 1, 1,
-1.093055, 1.411276, -1.762691, 0, 0, 0, 1, 1,
-1.091749, 1.338409, -0.6479324, 1, 1, 1, 1, 1,
-1.085107, -0.5027381, -0.6700262, 1, 1, 1, 1, 1,
-1.081541, -0.9012765, -3.109989, 1, 1, 1, 1, 1,
-1.0715, -0.3269907, -2.831885, 1, 1, 1, 1, 1,
-1.071258, 0.1368518, -2.10253, 1, 1, 1, 1, 1,
-1.068228, -0.5923436, -2.087799, 1, 1, 1, 1, 1,
-1.058483, -0.1183581, -2.276463, 1, 1, 1, 1, 1,
-1.052458, -0.1505548, -1.786512, 1, 1, 1, 1, 1,
-1.049706, 0.2861765, -1.170157, 1, 1, 1, 1, 1,
-1.034994, -2.006968, -3.043746, 1, 1, 1, 1, 1,
-1.034809, -0.2513299, -1.874435, 1, 1, 1, 1, 1,
-1.03343, 1.198876, -2.360869, 1, 1, 1, 1, 1,
-1.029422, 2.181391, -0.8419823, 1, 1, 1, 1, 1,
-1.02923, -0.05227185, -2.624346, 1, 1, 1, 1, 1,
-1.018648, -0.308221, -1.210829, 1, 1, 1, 1, 1,
-1.010484, 1.576725, -0.6674418, 0, 0, 1, 1, 1,
-0.998603, 0.6474005, -2.028724, 1, 0, 0, 1, 1,
-0.9967911, -2.28573, -2.488719, 1, 0, 0, 1, 1,
-0.9960149, 0.665311, -1.782964, 1, 0, 0, 1, 1,
-0.9956447, 0.9797017, -0.6469821, 1, 0, 0, 1, 1,
-0.9953943, 0.03682445, -1.207936, 1, 0, 0, 1, 1,
-0.9951702, 1.027531, -1.167884, 0, 0, 0, 1, 1,
-0.9942166, -0.5533481, -4.566761, 0, 0, 0, 1, 1,
-0.9858899, -0.7920594, -1.392155, 0, 0, 0, 1, 1,
-0.9807044, -0.5245923, -3.10044, 0, 0, 0, 1, 1,
-0.9749942, 0.5197771, -0.6599759, 0, 0, 0, 1, 1,
-0.9698334, -0.6118652, -1.560554, 0, 0, 0, 1, 1,
-0.968038, 1.082722, 0.2948773, 0, 0, 0, 1, 1,
-0.9667821, -0.3331473, -2.780745, 1, 1, 1, 1, 1,
-0.9666525, -0.6131357, -1.42853, 1, 1, 1, 1, 1,
-0.963083, -0.8005584, -0.8764594, 1, 1, 1, 1, 1,
-0.9505047, -0.8597903, -1.77162, 1, 1, 1, 1, 1,
-0.9430929, -0.9619498, -3.061118, 1, 1, 1, 1, 1,
-0.9352012, 0.05561115, -1.048224, 1, 1, 1, 1, 1,
-0.9273143, 0.3082226, -1.189736, 1, 1, 1, 1, 1,
-0.9228514, 1.336417, -1.082853, 1, 1, 1, 1, 1,
-0.9228364, -1.566846, -3.552574, 1, 1, 1, 1, 1,
-0.9218561, 1.323488, -0.2449347, 1, 1, 1, 1, 1,
-0.9210699, 1.206669, -0.7354144, 1, 1, 1, 1, 1,
-0.9147862, -1.497666, 0.03871972, 1, 1, 1, 1, 1,
-0.9123333, 0.8836363, -2.133109, 1, 1, 1, 1, 1,
-0.9090824, 1.02786, -0.9213861, 1, 1, 1, 1, 1,
-0.9013816, 0.7718617, -3.042448, 1, 1, 1, 1, 1,
-0.900133, 0.03025612, -2.462156, 0, 0, 1, 1, 1,
-0.8919019, -1.121284, -1.270159, 1, 0, 0, 1, 1,
-0.8890119, -1.018691, -0.73462, 1, 0, 0, 1, 1,
-0.8871225, 0.5486235, -1.523896, 1, 0, 0, 1, 1,
-0.8823661, -0.8139606, -0.6772442, 1, 0, 0, 1, 1,
-0.8801483, 0.6489997, -0.5316359, 1, 0, 0, 1, 1,
-0.8743863, -1.079984, -3.118251, 0, 0, 0, 1, 1,
-0.8724559, 0.7545244, -2.195558, 0, 0, 0, 1, 1,
-0.8712747, -2.708515, -3.742263, 0, 0, 0, 1, 1,
-0.8671781, 0.7542638, -1.259504, 0, 0, 0, 1, 1,
-0.8643371, -1.099097, -0.9271609, 0, 0, 0, 1, 1,
-0.8605871, -1.672198, -2.743711, 0, 0, 0, 1, 1,
-0.8544465, -0.008443471, -0.7058929, 0, 0, 0, 1, 1,
-0.8542895, -1.016851, -0.7997873, 1, 1, 1, 1, 1,
-0.8538108, -1.457661, -1.436168, 1, 1, 1, 1, 1,
-0.8509151, -1.500433, -2.98412, 1, 1, 1, 1, 1,
-0.846644, -2.030313, -3.344706, 1, 1, 1, 1, 1,
-0.8462743, -0.9118966, -1.184298, 1, 1, 1, 1, 1,
-0.8457649, 1.584381, -0.2955619, 1, 1, 1, 1, 1,
-0.8425387, -1.841503, -3.073243, 1, 1, 1, 1, 1,
-0.8401105, 0.2587961, -0.6172181, 1, 1, 1, 1, 1,
-0.8380079, -0.06068205, 0.5770026, 1, 1, 1, 1, 1,
-0.8352659, -1.121845, -1.736719, 1, 1, 1, 1, 1,
-0.831063, -0.3033431, -1.330712, 1, 1, 1, 1, 1,
-0.8307507, -0.4362592, -3.442605, 1, 1, 1, 1, 1,
-0.8277906, -0.2977563, -2.922189, 1, 1, 1, 1, 1,
-0.8271997, 0.13605, -1.664361, 1, 1, 1, 1, 1,
-0.8233328, -1.71005, -3.949531, 1, 1, 1, 1, 1,
-0.8152898, 0.05446341, -1.655465, 0, 0, 1, 1, 1,
-0.8126454, 0.1740163, -0.9351819, 1, 0, 0, 1, 1,
-0.8067974, 1.742983, 0.4530458, 1, 0, 0, 1, 1,
-0.8067926, -0.5930662, -3.624418, 1, 0, 0, 1, 1,
-0.8047456, 2.643339, 0.3840811, 1, 0, 0, 1, 1,
-0.804172, 0.3978598, -2.177998, 1, 0, 0, 1, 1,
-0.7911268, -1.490232, -1.827546, 0, 0, 0, 1, 1,
-0.7836578, -0.9518137, -3.646035, 0, 0, 0, 1, 1,
-0.7824699, 0.793569, -0.1430696, 0, 0, 0, 1, 1,
-0.7736884, 2.388779, -1.3308, 0, 0, 0, 1, 1,
-0.7684245, -1.316777, -3.425355, 0, 0, 0, 1, 1,
-0.7680539, 0.2940057, -1.175941, 0, 0, 0, 1, 1,
-0.7613471, 0.9094374, 0.01853512, 0, 0, 0, 1, 1,
-0.7599563, 0.5011935, -0.1712127, 1, 1, 1, 1, 1,
-0.7553132, -0.4886879, -2.264044, 1, 1, 1, 1, 1,
-0.7551043, -0.5764846, -1.352092, 1, 1, 1, 1, 1,
-0.7497448, 0.05955498, -1.029362, 1, 1, 1, 1, 1,
-0.748965, -0.6269074, -3.260044, 1, 1, 1, 1, 1,
-0.7381909, 0.8937937, -4.034017, 1, 1, 1, 1, 1,
-0.735817, 0.2642931, -1.393055, 1, 1, 1, 1, 1,
-0.7252362, 0.1905677, -2.17068, 1, 1, 1, 1, 1,
-0.7230666, 2.562147, 2.045563, 1, 1, 1, 1, 1,
-0.7221402, 2.003401, 0.3709329, 1, 1, 1, 1, 1,
-0.7063324, -0.5678959, -1.954554, 1, 1, 1, 1, 1,
-0.70443, -0.3660694, -1.845216, 1, 1, 1, 1, 1,
-0.7010823, 0.6566746, -2.246243, 1, 1, 1, 1, 1,
-0.6985312, 0.03272365, -1.159885, 1, 1, 1, 1, 1,
-0.6948939, 0.7942493, -0.2166494, 1, 1, 1, 1, 1,
-0.6899284, -0.2856835, -2.723045, 0, 0, 1, 1, 1,
-0.6892475, -1.189454, -3.790753, 1, 0, 0, 1, 1,
-0.6892048, 1.484153, -1.103486, 1, 0, 0, 1, 1,
-0.6866165, 0.1074831, -0.2388926, 1, 0, 0, 1, 1,
-0.6856936, 1.211596, -0.782719, 1, 0, 0, 1, 1,
-0.6853786, 0.7764236, -2.385867, 1, 0, 0, 1, 1,
-0.6803715, 1.028817, 1.145441, 0, 0, 0, 1, 1,
-0.6730692, -0.4805138, -2.870774, 0, 0, 0, 1, 1,
-0.6723092, -0.5621763, -0.8374413, 0, 0, 0, 1, 1,
-0.6707443, -0.1563127, -2.83058, 0, 0, 0, 1, 1,
-0.6647772, -0.08824959, -0.9894716, 0, 0, 0, 1, 1,
-0.6646155, -0.3633298, -1.659404, 0, 0, 0, 1, 1,
-0.6642832, -0.2762074, -2.656018, 0, 0, 0, 1, 1,
-0.6568317, -0.1671117, 0.3450526, 1, 1, 1, 1, 1,
-0.6472707, 0.8381688, -1.695694, 1, 1, 1, 1, 1,
-0.6459928, 0.1365687, -1.86579, 1, 1, 1, 1, 1,
-0.6435344, 0.2442388, -1.563496, 1, 1, 1, 1, 1,
-0.6413439, -0.6423833, -0.8698912, 1, 1, 1, 1, 1,
-0.6411818, 0.9074383, -0.6935523, 1, 1, 1, 1, 1,
-0.6406311, 0.6560366, 0.8766663, 1, 1, 1, 1, 1,
-0.640215, -0.006293116, -1.787899, 1, 1, 1, 1, 1,
-0.6356605, 0.2883846, -1.057368, 1, 1, 1, 1, 1,
-0.633382, -1.747748, -3.561359, 1, 1, 1, 1, 1,
-0.6272835, 1.508349, 0.4143492, 1, 1, 1, 1, 1,
-0.6247321, -2.236517, -2.198214, 1, 1, 1, 1, 1,
-0.6227968, 0.03353493, -1.176616, 1, 1, 1, 1, 1,
-0.6227889, 0.7473981, -0.464317, 1, 1, 1, 1, 1,
-0.6190199, 2.021367, 0.6059834, 1, 1, 1, 1, 1,
-0.6176572, 0.7589063, -0.2269146, 0, 0, 1, 1, 1,
-0.6092974, 1.540805, 0.6135347, 1, 0, 0, 1, 1,
-0.6087654, -0.4128246, -0.7060194, 1, 0, 0, 1, 1,
-0.6074268, 0.1221949, -1.590268, 1, 0, 0, 1, 1,
-0.6037083, 0.5913833, -1.616003, 1, 0, 0, 1, 1,
-0.6007267, -1.251814, -4.30912, 1, 0, 0, 1, 1,
-0.5975043, 0.07010397, -1.991583, 0, 0, 0, 1, 1,
-0.5974163, 0.6664845, 0.06894186, 0, 0, 0, 1, 1,
-0.590249, -0.554877, -2.225292, 0, 0, 0, 1, 1,
-0.5902024, -1.89192, -2.137674, 0, 0, 0, 1, 1,
-0.5892573, -3.955375, -3.634951, 0, 0, 0, 1, 1,
-0.589018, -0.3844846, 0.0004035826, 0, 0, 0, 1, 1,
-0.5873305, -0.02710309, -3.77421, 0, 0, 0, 1, 1,
-0.5864504, -0.5371296, -3.185307, 1, 1, 1, 1, 1,
-0.5861311, 1.009804, -1.791764, 1, 1, 1, 1, 1,
-0.5826997, 0.7676048, -0.4156016, 1, 1, 1, 1, 1,
-0.582482, -0.2461384, -2.497372, 1, 1, 1, 1, 1,
-0.5795082, -0.3767211, -3.681067, 1, 1, 1, 1, 1,
-0.5724818, 0.01110603, -1.386016, 1, 1, 1, 1, 1,
-0.5682794, -0.449094, -1.443053, 1, 1, 1, 1, 1,
-0.5671523, -0.4864126, -3.719887, 1, 1, 1, 1, 1,
-0.5659169, 0.7904375, -1.254065, 1, 1, 1, 1, 1,
-0.5645848, -1.050663, -2.254852, 1, 1, 1, 1, 1,
-0.5641548, 0.7939568, -0.9023008, 1, 1, 1, 1, 1,
-0.5620446, 0.2513809, -2.535614, 1, 1, 1, 1, 1,
-0.5616271, 1.291345, 0.8611141, 1, 1, 1, 1, 1,
-0.561313, 0.2357747, -1.268726, 1, 1, 1, 1, 1,
-0.5611159, -0.5205413, -2.805605, 1, 1, 1, 1, 1,
-0.558063, 1.416059, 1.178112, 0, 0, 1, 1, 1,
-0.5577334, 1.680481, 0.4473302, 1, 0, 0, 1, 1,
-0.5570022, 0.4801539, 0.7618828, 1, 0, 0, 1, 1,
-0.5465333, -0.07278261, -2.719199, 1, 0, 0, 1, 1,
-0.5355092, -1.034908, -4.618094, 1, 0, 0, 1, 1,
-0.5322369, -0.003681062, -2.410181, 1, 0, 0, 1, 1,
-0.5262992, 1.739682, 1.101368, 0, 0, 0, 1, 1,
-0.5259112, 1.754058, -1.051834, 0, 0, 0, 1, 1,
-0.5244064, -1.258767, -2.717362, 0, 0, 0, 1, 1,
-0.5139614, 1.321613, -0.03307357, 0, 0, 0, 1, 1,
-0.5132819, -0.5563071, -3.524371, 0, 0, 0, 1, 1,
-0.5087863, -1.167822, -4.416226, 0, 0, 0, 1, 1,
-0.5005324, -0.01731753, -1.681011, 0, 0, 0, 1, 1,
-0.4998724, -0.1763894, -1.164371, 1, 1, 1, 1, 1,
-0.4981943, -1.448317, -4.214953, 1, 1, 1, 1, 1,
-0.4952158, -0.6278985, -3.745233, 1, 1, 1, 1, 1,
-0.4931143, 0.6648843, -0.769361, 1, 1, 1, 1, 1,
-0.4895743, -1.725394, -2.764698, 1, 1, 1, 1, 1,
-0.4880446, 1.024033, -0.3703725, 1, 1, 1, 1, 1,
-0.4853011, -0.5975365, -3.741671, 1, 1, 1, 1, 1,
-0.4831654, 1.859647, -0.4401687, 1, 1, 1, 1, 1,
-0.4824721, -0.2757315, -1.151494, 1, 1, 1, 1, 1,
-0.4743236, -0.759176, -3.098491, 1, 1, 1, 1, 1,
-0.4739723, 1.375043, -0.260124, 1, 1, 1, 1, 1,
-0.4660489, 0.2173652, -1.147353, 1, 1, 1, 1, 1,
-0.4655777, -1.100574, -2.99393, 1, 1, 1, 1, 1,
-0.4652476, 1.495392, -0.4603353, 1, 1, 1, 1, 1,
-0.4633987, 0.1954391, 0.003477551, 1, 1, 1, 1, 1,
-0.461669, 1.470938, -1.889135, 0, 0, 1, 1, 1,
-0.4547108, -0.920361, -4.195915, 1, 0, 0, 1, 1,
-0.4543507, -1.551114, -1.375435, 1, 0, 0, 1, 1,
-0.4529291, 1.060781, 0.9191217, 1, 0, 0, 1, 1,
-0.452545, 0.7619563, -0.6689287, 1, 0, 0, 1, 1,
-0.4522921, -2.010696, -1.674619, 1, 0, 0, 1, 1,
-0.4512475, -0.3682029, -3.666523, 0, 0, 0, 1, 1,
-0.4433055, -0.5118783, -1.402718, 0, 0, 0, 1, 1,
-0.4393224, -0.3617974, -2.989185, 0, 0, 0, 1, 1,
-0.4330792, 0.4799109, 0.6805184, 0, 0, 0, 1, 1,
-0.4321847, 0.1883131, -2.066765, 0, 0, 0, 1, 1,
-0.4308007, -0.3770117, -2.81344, 0, 0, 0, 1, 1,
-0.4288611, 0.2894965, -2.488466, 0, 0, 0, 1, 1,
-0.4274688, 2.394242, -0.2814051, 1, 1, 1, 1, 1,
-0.4237258, -1.824429, -2.293527, 1, 1, 1, 1, 1,
-0.4230493, -0.6979359, -3.330119, 1, 1, 1, 1, 1,
-0.4161508, -0.4520284, -2.407269, 1, 1, 1, 1, 1,
-0.4151375, -0.03223465, -1.073484, 1, 1, 1, 1, 1,
-0.4124677, 0.6302885, 0.5126683, 1, 1, 1, 1, 1,
-0.4101866, 1.090751, 0.9882153, 1, 1, 1, 1, 1,
-0.4097049, -0.6405666, -2.856711, 1, 1, 1, 1, 1,
-0.4004196, -0.9278269, -2.146028, 1, 1, 1, 1, 1,
-0.3999061, -0.6796888, -2.717536, 1, 1, 1, 1, 1,
-0.3996884, 1.600069, -1.761112, 1, 1, 1, 1, 1,
-0.3995127, 0.5864604, -1.453295, 1, 1, 1, 1, 1,
-0.3936529, 0.5919297, 0.05416821, 1, 1, 1, 1, 1,
-0.3894008, -0.862606, -2.076196, 1, 1, 1, 1, 1,
-0.3846269, -2.690117, -3.589025, 1, 1, 1, 1, 1,
-0.3837132, 1.076935, -0.2725413, 0, 0, 1, 1, 1,
-0.3763044, 0.1038979, -1.458808, 1, 0, 0, 1, 1,
-0.3740607, -1.117709, -3.74073, 1, 0, 0, 1, 1,
-0.3713684, 1.107204, -0.3811226, 1, 0, 0, 1, 1,
-0.3702502, 0.7842268, -1.263366, 1, 0, 0, 1, 1,
-0.3685175, 2.110444, -0.8270876, 1, 0, 0, 1, 1,
-0.3684567, 0.3672761, -0.7476436, 0, 0, 0, 1, 1,
-0.3657657, 0.742605, -1.521049, 0, 0, 0, 1, 1,
-0.3633312, 1.73107, 1.399355, 0, 0, 0, 1, 1,
-0.359918, -0.08712662, -2.283858, 0, 0, 0, 1, 1,
-0.35582, -0.997445, -2.774183, 0, 0, 0, 1, 1,
-0.3534544, 1.153755, -1.507547, 0, 0, 0, 1, 1,
-0.353216, 0.7626483, 1.411161, 0, 0, 0, 1, 1,
-0.3528892, -0.3426698, -2.16994, 1, 1, 1, 1, 1,
-0.351868, -1.369634, -2.73839, 1, 1, 1, 1, 1,
-0.3469274, -0.120176, -0.7163782, 1, 1, 1, 1, 1,
-0.3467138, -0.1140729, -3.513575, 1, 1, 1, 1, 1,
-0.3395586, -0.3000262, -1.788408, 1, 1, 1, 1, 1,
-0.338351, -0.8352694, -3.598633, 1, 1, 1, 1, 1,
-0.3380159, -0.1350207, -1.147884, 1, 1, 1, 1, 1,
-0.3354193, 0.7047266, 1.262289, 1, 1, 1, 1, 1,
-0.332173, -0.7566267, -2.115053, 1, 1, 1, 1, 1,
-0.3318885, 1.727139, -0.01382484, 1, 1, 1, 1, 1,
-0.3313522, 0.3066052, -1.070944, 1, 1, 1, 1, 1,
-0.324097, -0.6109721, -1.72708, 1, 1, 1, 1, 1,
-0.3222807, -0.2453774, -0.9686522, 1, 1, 1, 1, 1,
-0.3203994, 1.544021, -0.3736615, 1, 1, 1, 1, 1,
-0.3203229, 1.220304, -0.02167143, 1, 1, 1, 1, 1,
-0.3194099, -0.8477364, -2.970232, 0, 0, 1, 1, 1,
-0.3190177, 0.892015, -2.023842, 1, 0, 0, 1, 1,
-0.3187647, 0.2455997, -0.6758895, 1, 0, 0, 1, 1,
-0.3137821, -0.6363871, -1.935035, 1, 0, 0, 1, 1,
-0.3125585, 0.8422379, -0.5087282, 1, 0, 0, 1, 1,
-0.3100711, 0.6691902, -0.576445, 1, 0, 0, 1, 1,
-0.3087988, -2.410928, -2.363544, 0, 0, 0, 1, 1,
-0.3061249, 0.5666964, -1.01352, 0, 0, 0, 1, 1,
-0.3043974, -0.55019, -2.087202, 0, 0, 0, 1, 1,
-0.2992047, -1.247579, -4.2985, 0, 0, 0, 1, 1,
-0.2981367, 1.044569, 1.251953, 0, 0, 0, 1, 1,
-0.2958049, 0.3710586, -0.5206108, 0, 0, 0, 1, 1,
-0.2915427, 0.255366, -0.06692222, 0, 0, 0, 1, 1,
-0.2889731, 0.3116024, -1.107943, 1, 1, 1, 1, 1,
-0.2817242, -0.7848932, -3.608387, 1, 1, 1, 1, 1,
-0.2721639, -0.02568244, -0.6824067, 1, 1, 1, 1, 1,
-0.2688923, 1.848297, -0.4633653, 1, 1, 1, 1, 1,
-0.2680325, -0.7412608, -2.360852, 1, 1, 1, 1, 1,
-0.2640178, 1.210178, -0.6753312, 1, 1, 1, 1, 1,
-0.2635361, 0.1233141, -0.8305062, 1, 1, 1, 1, 1,
-0.2583144, 0.1214347, -0.111659, 1, 1, 1, 1, 1,
-0.2580812, -0.8873799, -2.658992, 1, 1, 1, 1, 1,
-0.2525853, -0.434317, -1.189242, 1, 1, 1, 1, 1,
-0.2472577, 0.4870798, -0.1398032, 1, 1, 1, 1, 1,
-0.2470479, 1.862771, 1.013234, 1, 1, 1, 1, 1,
-0.2425248, -0.8779129, -2.509167, 1, 1, 1, 1, 1,
-0.2372312, 0.7287675, -0.6056883, 1, 1, 1, 1, 1,
-0.2362036, 0.8545711, -1.294036, 1, 1, 1, 1, 1,
-0.2351888, -0.9023131, -2.595886, 0, 0, 1, 1, 1,
-0.2284014, -1.208424, -2.47672, 1, 0, 0, 1, 1,
-0.2255571, 1.153971, -1.082878, 1, 0, 0, 1, 1,
-0.2185311, 0.1221889, -1.547955, 1, 0, 0, 1, 1,
-0.2175945, 1.858001, -1.282465, 1, 0, 0, 1, 1,
-0.2121672, 0.8118763, 0.55941, 1, 0, 0, 1, 1,
-0.2075022, -1.450228, -2.522388, 0, 0, 0, 1, 1,
-0.2041872, 1.378947, 0.5626798, 0, 0, 0, 1, 1,
-0.2037185, 0.1137427, -1.363628, 0, 0, 0, 1, 1,
-0.2036971, -1.954582, -3.721318, 0, 0, 0, 1, 1,
-0.2008727, -0.1988484, -2.639052, 0, 0, 0, 1, 1,
-0.2001316, 0.1223406, -0.3443571, 0, 0, 0, 1, 1,
-0.1989533, -0.7557231, -1.682457, 0, 0, 0, 1, 1,
-0.198917, -1.428601, -4.120333, 1, 1, 1, 1, 1,
-0.1966048, -0.5332152, -3.644256, 1, 1, 1, 1, 1,
-0.1957418, 0.1026522, -0.5367399, 1, 1, 1, 1, 1,
-0.1942673, -0.9385241, -3.34019, 1, 1, 1, 1, 1,
-0.1939739, -0.9245984, -3.131986, 1, 1, 1, 1, 1,
-0.1938842, 1.240833, -0.3331954, 1, 1, 1, 1, 1,
-0.1900295, -1.78297, -4.518757, 1, 1, 1, 1, 1,
-0.1780712, 1.29678, -0.2981357, 1, 1, 1, 1, 1,
-0.1721735, -1.434251, -3.360786, 1, 1, 1, 1, 1,
-0.1675867, -0.09094772, -3.674426, 1, 1, 1, 1, 1,
-0.1589971, 1.525091, -0.7229502, 1, 1, 1, 1, 1,
-0.1585738, 0.09294824, -1.4413, 1, 1, 1, 1, 1,
-0.1473162, -1.042994, -3.302611, 1, 1, 1, 1, 1,
-0.1419903, 0.1297756, -0.5718784, 1, 1, 1, 1, 1,
-0.1329333, -0.5410057, -3.760439, 1, 1, 1, 1, 1,
-0.1321023, -0.5614558, -1.366408, 0, 0, 1, 1, 1,
-0.1303297, 0.5566683, 0.1959786, 1, 0, 0, 1, 1,
-0.1297598, 0.5144837, -0.223776, 1, 0, 0, 1, 1,
-0.1231622, -0.09469715, -2.029631, 1, 0, 0, 1, 1,
-0.1209515, 0.7225815, 1.065914, 1, 0, 0, 1, 1,
-0.1182898, -1.997312, -1.850653, 1, 0, 0, 1, 1,
-0.1152628, -0.6930764, -2.337087, 0, 0, 0, 1, 1,
-0.1150219, -1.169965, -3.247369, 0, 0, 0, 1, 1,
-0.1146128, 0.670512, -0.8889045, 0, 0, 0, 1, 1,
-0.1139835, -1.073973, -3.483309, 0, 0, 0, 1, 1,
-0.1139367, -1.319306, -2.384179, 0, 0, 0, 1, 1,
-0.1103648, -0.3121555, -2.691452, 0, 0, 0, 1, 1,
-0.109185, 0.6281436, -0.7490507, 0, 0, 0, 1, 1,
-0.1081098, -0.5618169, -1.129476, 1, 1, 1, 1, 1,
-0.1064455, -1.113945, -3.047323, 1, 1, 1, 1, 1,
-0.1061998, 0.7525967, 0.02068595, 1, 1, 1, 1, 1,
-0.1037101, 0.8471879, 0.14108, 1, 1, 1, 1, 1,
-0.1013752, -0.006414552, -1.529419, 1, 1, 1, 1, 1,
-0.1013582, 0.7557658, -0.6311764, 1, 1, 1, 1, 1,
-0.1008406, 1.249472, 0.4909738, 1, 1, 1, 1, 1,
-0.09283268, 0.2089202, -1.84113, 1, 1, 1, 1, 1,
-0.08641763, 0.415933, -0.9387177, 1, 1, 1, 1, 1,
-0.08627298, -0.004659197, -1.600282, 1, 1, 1, 1, 1,
-0.08420757, -0.2720278, -2.919274, 1, 1, 1, 1, 1,
-0.08254385, 1.386826, 1.545777, 1, 1, 1, 1, 1,
-0.08223827, 2.477351, 0.1150596, 1, 1, 1, 1, 1,
-0.08094565, -1.505211, -1.815773, 1, 1, 1, 1, 1,
-0.07654564, -1.605211, -1.454871, 1, 1, 1, 1, 1,
-0.06945842, -0.4501294, -2.757272, 0, 0, 1, 1, 1,
-0.06353063, -0.6983632, -2.486548, 1, 0, 0, 1, 1,
-0.06125441, 1.752467, 1.718101, 1, 0, 0, 1, 1,
-0.06023074, -1.517108, -3.123839, 1, 0, 0, 1, 1,
-0.05899587, 0.5364474, 0.4765063, 1, 0, 0, 1, 1,
-0.05782854, 1.71229, -0.2837935, 1, 0, 0, 1, 1,
-0.05695047, 1.298847, 1.021674, 0, 0, 0, 1, 1,
-0.04960047, -0.7259358, -3.011919, 0, 0, 0, 1, 1,
-0.04327714, -0.4030842, -3.11983, 0, 0, 0, 1, 1,
-0.03843942, -0.6078327, -2.050438, 0, 0, 0, 1, 1,
-0.03624959, -2.000677, -3.41797, 0, 0, 0, 1, 1,
-0.02675916, -0.3850622, -2.075492, 0, 0, 0, 1, 1,
-0.02634574, 0.1759944, -0.821941, 0, 0, 0, 1, 1,
-0.02516158, 2.431186, -1.358812, 1, 1, 1, 1, 1,
-0.02382161, -1.355491, -3.494435, 1, 1, 1, 1, 1,
-0.02291288, -0.8324159, -4.078991, 1, 1, 1, 1, 1,
-0.02285117, 0.1966366, -0.4843792, 1, 1, 1, 1, 1,
-0.02248056, 0.9098608, 1.602775, 1, 1, 1, 1, 1,
-0.0181148, -0.4734807, -2.745625, 1, 1, 1, 1, 1,
-0.01711464, -0.6049757, -1.869717, 1, 1, 1, 1, 1,
-0.0114528, -0.7093773, -3.026165, 1, 1, 1, 1, 1,
-0.006044967, -1.068267, -3.67867, 1, 1, 1, 1, 1,
-0.002716533, -0.6412429, -1.957686, 1, 1, 1, 1, 1,
-0.001854906, 0.1475225, 0.5977899, 1, 1, 1, 1, 1,
0.003886486, 0.7711602, 1.271948, 1, 1, 1, 1, 1,
0.007063394, -0.4716187, 1.848352, 1, 1, 1, 1, 1,
0.008208954, 0.4750727, 0.08347613, 1, 1, 1, 1, 1,
0.008890066, 0.2219714, 0.4293688, 1, 1, 1, 1, 1,
0.01238743, -0.254265, 3.928289, 0, 0, 1, 1, 1,
0.01436654, 0.5539233, 1.211057, 1, 0, 0, 1, 1,
0.01457185, 1.70196, -2.218663, 1, 0, 0, 1, 1,
0.01666936, 0.3744866, -0.5459444, 1, 0, 0, 1, 1,
0.01693744, -0.1226357, 2.543425, 1, 0, 0, 1, 1,
0.01943064, 1.42512, -0.2449877, 1, 0, 0, 1, 1,
0.02003537, 0.7365615, -0.6896458, 0, 0, 0, 1, 1,
0.0217443, -0.1874934, 2.093148, 0, 0, 0, 1, 1,
0.02356274, -0.2317229, 3.785603, 0, 0, 0, 1, 1,
0.02580268, -0.5719666, 3.812344, 0, 0, 0, 1, 1,
0.02605793, -0.09499195, 4.749191, 0, 0, 0, 1, 1,
0.02743232, 1.38395, 0.9633511, 0, 0, 0, 1, 1,
0.03055713, -0.5011954, 3.491062, 0, 0, 0, 1, 1,
0.03392225, -1.064461, 2.959374, 1, 1, 1, 1, 1,
0.04259693, 0.4821763, -1.731517, 1, 1, 1, 1, 1,
0.04414548, 0.6129372, 1.261401, 1, 1, 1, 1, 1,
0.04586674, 1.402603, -0.3975396, 1, 1, 1, 1, 1,
0.05619286, 0.4487505, -0.5011523, 1, 1, 1, 1, 1,
0.05998224, 0.4018914, -0.6660668, 1, 1, 1, 1, 1,
0.06131857, -0.2708572, 3.495742, 1, 1, 1, 1, 1,
0.06173556, -0.7602602, 6.566589, 1, 1, 1, 1, 1,
0.0621165, 0.5191992, 1.525967, 1, 1, 1, 1, 1,
0.06327471, -1.19349, 3.908369, 1, 1, 1, 1, 1,
0.06401782, -0.3531202, 3.234782, 1, 1, 1, 1, 1,
0.06506491, 0.06951676, 0.4719892, 1, 1, 1, 1, 1,
0.07015673, -1.52185, 6.01938, 1, 1, 1, 1, 1,
0.07206859, 0.8657326, -0.9387398, 1, 1, 1, 1, 1,
0.07695218, -1.000155, 2.519009, 1, 1, 1, 1, 1,
0.07948385, -3.226893, 3.183213, 0, 0, 1, 1, 1,
0.08264361, -2.067673, 2.070544, 1, 0, 0, 1, 1,
0.08493987, 0.04614402, 1.776543, 1, 0, 0, 1, 1,
0.08709291, 0.78667, -0.7107129, 1, 0, 0, 1, 1,
0.0916431, 1.560069, -0.01818543, 1, 0, 0, 1, 1,
0.09364562, -0.6032963, 0.1967506, 1, 0, 0, 1, 1,
0.09583434, -1.149838, 2.230299, 0, 0, 0, 1, 1,
0.09594402, 0.2437138, 1.102441, 0, 0, 0, 1, 1,
0.09671684, -0.02170334, 2.408887, 0, 0, 0, 1, 1,
0.09776599, 0.1780183, 1.595555, 0, 0, 0, 1, 1,
0.101978, -2.17763, 3.921404, 0, 0, 0, 1, 1,
0.1020842, -0.1151324, 2.044755, 0, 0, 0, 1, 1,
0.1026658, -0.102746, 3.915342, 0, 0, 0, 1, 1,
0.1032819, -0.8742744, 2.809451, 1, 1, 1, 1, 1,
0.1052665, 0.8092421, 0.2495105, 1, 1, 1, 1, 1,
0.1060892, 0.6522401, -0.9436571, 1, 1, 1, 1, 1,
0.1106671, -1.762387, 2.937996, 1, 1, 1, 1, 1,
0.1123078, 0.9228929, 0.4369363, 1, 1, 1, 1, 1,
0.1135329, 0.07056454, -0.9931376, 1, 1, 1, 1, 1,
0.114521, 1.629624, -0.7103715, 1, 1, 1, 1, 1,
0.1166425, -0.5412448, 1.957645, 1, 1, 1, 1, 1,
0.1171188, 1.480412, -0.8469412, 1, 1, 1, 1, 1,
0.1222196, 0.6641959, -0.07847136, 1, 1, 1, 1, 1,
0.1242212, 0.9389495, -0.3640253, 1, 1, 1, 1, 1,
0.1271954, 0.1674635, 1.725834, 1, 1, 1, 1, 1,
0.1340498, -0.2311335, 3.085709, 1, 1, 1, 1, 1,
0.1401757, -0.3818713, 2.224955, 1, 1, 1, 1, 1,
0.1404765, -2.235301, 3.948005, 1, 1, 1, 1, 1,
0.1450412, -0.2798997, 4.489364, 0, 0, 1, 1, 1,
0.1462247, 1.017242, 1.283738, 1, 0, 0, 1, 1,
0.1490061, -0.1986036, 1.467726, 1, 0, 0, 1, 1,
0.1512141, 0.9402981, 0.126983, 1, 0, 0, 1, 1,
0.1512396, 1.209498, -0.0870533, 1, 0, 0, 1, 1,
0.1521534, -0.3273958, 1.067215, 1, 0, 0, 1, 1,
0.1569399, -0.01326877, 2.653549, 0, 0, 0, 1, 1,
0.1572308, -0.02683518, 0.5255697, 0, 0, 0, 1, 1,
0.1625255, -1.25703, 2.888095, 0, 0, 0, 1, 1,
0.1672654, -1.507538, 2.796713, 0, 0, 0, 1, 1,
0.1691332, -1.934139, 4.152301, 0, 0, 0, 1, 1,
0.1719881, 0.02387301, -1.382372, 0, 0, 0, 1, 1,
0.1755217, 1.107116, 0.1866975, 0, 0, 0, 1, 1,
0.1762934, -0.1842627, 4.325827, 1, 1, 1, 1, 1,
0.1777807, 1.125929, 1.323187, 1, 1, 1, 1, 1,
0.1837662, -0.4972902, 3.794874, 1, 1, 1, 1, 1,
0.1839654, 0.1158294, 1.537672, 1, 1, 1, 1, 1,
0.1892622, -0.06775112, 0.9762609, 1, 1, 1, 1, 1,
0.1948471, 1.331434, 0.6771016, 1, 1, 1, 1, 1,
0.2016598, 0.27067, -0.1347245, 1, 1, 1, 1, 1,
0.2135248, -0.2934399, 2.653578, 1, 1, 1, 1, 1,
0.2139309, 1.550957, -0.3462185, 1, 1, 1, 1, 1,
0.2173343, 0.8854347, 0.6212932, 1, 1, 1, 1, 1,
0.2186426, 0.9211391, -0.1329856, 1, 1, 1, 1, 1,
0.2192267, -0.0540689, 4.657829, 1, 1, 1, 1, 1,
0.2237869, 0.7516983, 1.065029, 1, 1, 1, 1, 1,
0.2282783, 2.218112, 0.0621259, 1, 1, 1, 1, 1,
0.2316744, 0.7915442, -0.1287061, 1, 1, 1, 1, 1,
0.2326691, 0.6255007, 1.643888, 0, 0, 1, 1, 1,
0.2329039, -1.342379, 3.028974, 1, 0, 0, 1, 1,
0.2371082, -0.9063809, 2.318893, 1, 0, 0, 1, 1,
0.2383536, -0.5813591, 3.198801, 1, 0, 0, 1, 1,
0.2403005, 0.3517327, -0.123054, 1, 0, 0, 1, 1,
0.2503064, -0.735509, 2.897682, 1, 0, 0, 1, 1,
0.2527585, -0.3319189, 2.932343, 0, 0, 0, 1, 1,
0.2546851, 2.421424, 0.746415, 0, 0, 0, 1, 1,
0.2575098, 1.395314, -0.6988919, 0, 0, 0, 1, 1,
0.2620498, 0.4070318, 1.09225, 0, 0, 0, 1, 1,
0.2625913, -1.078249, 2.476952, 0, 0, 0, 1, 1,
0.26338, -0.7886435, 3.69629, 0, 0, 0, 1, 1,
0.2634909, -2.337554, 3.564758, 0, 0, 0, 1, 1,
0.2639439, 0.6769804, 0.8835505, 1, 1, 1, 1, 1,
0.2644982, 1.724253, -0.3843664, 1, 1, 1, 1, 1,
0.264685, -0.03421672, 2.736951, 1, 1, 1, 1, 1,
0.2675861, -0.5244358, 2.003908, 1, 1, 1, 1, 1,
0.2703446, 0.1014659, 2.456722, 1, 1, 1, 1, 1,
0.2706659, -1.566974, 2.472443, 1, 1, 1, 1, 1,
0.2808914, -0.2270631, 1.494813, 1, 1, 1, 1, 1,
0.281743, 1.325284, 0.07190944, 1, 1, 1, 1, 1,
0.285277, 0.3256914, 1.062028, 1, 1, 1, 1, 1,
0.2858743, -1.993016, 3.383198, 1, 1, 1, 1, 1,
0.2859602, -0.1313121, 2.811544, 1, 1, 1, 1, 1,
0.286586, 0.5322141, 2.011108, 1, 1, 1, 1, 1,
0.2915399, -0.7854323, 2.18517, 1, 1, 1, 1, 1,
0.2956091, -0.1836111, 2.596075, 1, 1, 1, 1, 1,
0.2965496, -0.4059016, 2.818622, 1, 1, 1, 1, 1,
0.3016452, -0.4952803, 2.155768, 0, 0, 1, 1, 1,
0.302216, -1.605197, 2.740445, 1, 0, 0, 1, 1,
0.3061666, -1.402755, 4.451898, 1, 0, 0, 1, 1,
0.3091113, 0.6513125, 1.156188, 1, 0, 0, 1, 1,
0.3094598, 0.1968758, -0.8144411, 1, 0, 0, 1, 1,
0.3135522, 1.281046, -0.4468428, 1, 0, 0, 1, 1,
0.3159765, -0.3372306, 1.488538, 0, 0, 0, 1, 1,
0.3196705, -1.877291, 1.495641, 0, 0, 0, 1, 1,
0.3207957, 1.590149, 0.2092875, 0, 0, 0, 1, 1,
0.3225357, 0.9921965, 0.0639004, 0, 0, 0, 1, 1,
0.3249716, -0.4064038, 3.305984, 0, 0, 0, 1, 1,
0.3273502, -0.1275079, 2.486624, 0, 0, 0, 1, 1,
0.3298755, 0.6533424, -0.2518638, 0, 0, 0, 1, 1,
0.3332886, -0.5144437, 4.096664, 1, 1, 1, 1, 1,
0.334671, 0.6919196, -1.82596, 1, 1, 1, 1, 1,
0.3347639, -0.4784415, 2.065596, 1, 1, 1, 1, 1,
0.3347733, 0.07465105, 0.359392, 1, 1, 1, 1, 1,
0.3388219, 0.2761235, 1.281707, 1, 1, 1, 1, 1,
0.3390318, -1.204381, 3.44468, 1, 1, 1, 1, 1,
0.3394932, 1.712503, 0.991555, 1, 1, 1, 1, 1,
0.3465302, 0.243992, 2.43942, 1, 1, 1, 1, 1,
0.3469599, 0.3302165, 0.2490915, 1, 1, 1, 1, 1,
0.3476207, 1.221128, 1.05986, 1, 1, 1, 1, 1,
0.3497277, 0.1817919, 1.416792, 1, 1, 1, 1, 1,
0.3499472, 0.4742297, -1.729754, 1, 1, 1, 1, 1,
0.3534361, 1.210606, 0.2843727, 1, 1, 1, 1, 1,
0.3592665, 0.8315179, -1.236417, 1, 1, 1, 1, 1,
0.3594032, 0.7271919, -0.540652, 1, 1, 1, 1, 1,
0.3663616, 0.3871655, 1.770878, 0, 0, 1, 1, 1,
0.3699597, 0.2875283, -0.1234617, 1, 0, 0, 1, 1,
0.3733967, 0.7617531, 1.603658, 1, 0, 0, 1, 1,
0.3785353, 0.5653933, 0.8473819, 1, 0, 0, 1, 1,
0.3799725, -0.668677, 2.859342, 1, 0, 0, 1, 1,
0.3833866, -1.015624, 1.341825, 1, 0, 0, 1, 1,
0.3833923, -0.5257621, 0.6402344, 0, 0, 0, 1, 1,
0.3872599, 0.009036355, 2.352121, 0, 0, 0, 1, 1,
0.3949795, -1.338226, 1.841791, 0, 0, 0, 1, 1,
0.3976185, 1.108639, -0.9210621, 0, 0, 0, 1, 1,
0.3985817, 0.0225915, 0.6209803, 0, 0, 0, 1, 1,
0.3988543, -0.5075418, 2.36939, 0, 0, 0, 1, 1,
0.4051956, -0.2609842, 1.008107, 0, 0, 0, 1, 1,
0.4118019, 0.4604619, 2.138039, 1, 1, 1, 1, 1,
0.4144321, 1.272859, -1.878335, 1, 1, 1, 1, 1,
0.4158626, 2.870525, 0.02638587, 1, 1, 1, 1, 1,
0.4172158, 0.7622801, 2.108641, 1, 1, 1, 1, 1,
0.4182106, 0.776323, -1.784636, 1, 1, 1, 1, 1,
0.4189889, -0.6271197, 2.842033, 1, 1, 1, 1, 1,
0.4197078, -0.09595531, 0.7976049, 1, 1, 1, 1, 1,
0.4229846, 0.642607, 0.5226013, 1, 1, 1, 1, 1,
0.4260141, -1.556858, 4.55812, 1, 1, 1, 1, 1,
0.4263549, -1.042108, 2.623354, 1, 1, 1, 1, 1,
0.4296113, 1.290141, -0.2639959, 1, 1, 1, 1, 1,
0.4361646, 1.197948, 0.7728939, 1, 1, 1, 1, 1,
0.4395426, 0.2283169, 2.877259, 1, 1, 1, 1, 1,
0.4447459, -1.9661, 3.629536, 1, 1, 1, 1, 1,
0.4485733, 0.6806404, 0.0545525, 1, 1, 1, 1, 1,
0.4522807, -2.82883, 2.104602, 0, 0, 1, 1, 1,
0.4543905, -1.117686, 1.716624, 1, 0, 0, 1, 1,
0.459139, 2.909505, -0.9576347, 1, 0, 0, 1, 1,
0.4611827, 0.436981, -0.01686084, 1, 0, 0, 1, 1,
0.4633034, -0.1391848, 2.819641, 1, 0, 0, 1, 1,
0.4637068, 2.892826, -0.4294107, 1, 0, 0, 1, 1,
0.4725968, -0.1763564, 2.559153, 0, 0, 0, 1, 1,
0.4740894, 1.203686, 0.3413528, 0, 0, 0, 1, 1,
0.4760597, -0.5125736, 2.293149, 0, 0, 0, 1, 1,
0.4815214, -0.9457606, 1.748229, 0, 0, 0, 1, 1,
0.4836553, -0.900007, 2.04564, 0, 0, 0, 1, 1,
0.4846345, -0.4503758, 1.600605, 0, 0, 0, 1, 1,
0.4907967, -0.6508405, 3.400802, 0, 0, 0, 1, 1,
0.4920592, 0.09278367, 1.980865, 1, 1, 1, 1, 1,
0.4945077, 0.5727537, 0.5020821, 1, 1, 1, 1, 1,
0.4974587, 1.684044, -0.5103168, 1, 1, 1, 1, 1,
0.5022193, -0.510453, 1.224379, 1, 1, 1, 1, 1,
0.5026833, -0.7514433, 3.174968, 1, 1, 1, 1, 1,
0.5068251, 0.2877618, 1.634374, 1, 1, 1, 1, 1,
0.5097636, 0.3053654, 1.171036, 1, 1, 1, 1, 1,
0.5106065, 2.271995, 0.7166654, 1, 1, 1, 1, 1,
0.5141609, 1.032471, -0.3778971, 1, 1, 1, 1, 1,
0.5149096, -0.6848724, 3.282106, 1, 1, 1, 1, 1,
0.5164047, 0.9484254, -0.3101029, 1, 1, 1, 1, 1,
0.5164141, 0.5859023, -0.9432806, 1, 1, 1, 1, 1,
0.5184649, -0.7700137, 2.807215, 1, 1, 1, 1, 1,
0.5236042, -2.471751, 1.299213, 1, 1, 1, 1, 1,
0.5247041, -1.661157, 2.942862, 1, 1, 1, 1, 1,
0.5248423, 0.5470949, 0.6895187, 0, 0, 1, 1, 1,
0.5263509, 1.350531, 0.7185411, 1, 0, 0, 1, 1,
0.5277368, 1.505607, -0.8663096, 1, 0, 0, 1, 1,
0.5369532, -1.619444, 2.800928, 1, 0, 0, 1, 1,
0.539538, -0.04345504, 0.9348434, 1, 0, 0, 1, 1,
0.5424981, -0.0755195, 1.621949, 1, 0, 0, 1, 1,
0.5436148, 0.6561878, 1.932573, 0, 0, 0, 1, 1,
0.5465637, 0.5406767, -0.3371953, 0, 0, 0, 1, 1,
0.5516992, 0.8011925, 1.462325, 0, 0, 0, 1, 1,
0.5577074, 1.034645, -0.6984572, 0, 0, 0, 1, 1,
0.5585355, -0.05558027, 1.668324, 0, 0, 0, 1, 1,
0.568715, 0.1746568, 0.8300675, 0, 0, 0, 1, 1,
0.5696161, 0.05697948, 1.90652, 0, 0, 0, 1, 1,
0.5733457, 2.107281, 0.3810325, 1, 1, 1, 1, 1,
0.5734826, -1.206677, 3.894158, 1, 1, 1, 1, 1,
0.5771282, 0.6309807, 1.275198, 1, 1, 1, 1, 1,
0.577702, -1.71862, 1.783944, 1, 1, 1, 1, 1,
0.5807061, 1.669695, -0.04688966, 1, 1, 1, 1, 1,
0.5813966, 1.114116, 0.9497736, 1, 1, 1, 1, 1,
0.5866582, -0.7306833, 3.258626, 1, 1, 1, 1, 1,
0.5886984, -0.1662608, 2.102479, 1, 1, 1, 1, 1,
0.5981146, 1.502074, 1.322575, 1, 1, 1, 1, 1,
0.6016842, -1.364905, 2.690191, 1, 1, 1, 1, 1,
0.603034, 1.581884, 1.349163, 1, 1, 1, 1, 1,
0.6043026, 1.752408, 1.746166, 1, 1, 1, 1, 1,
0.6071249, -1.869583, 2.391759, 1, 1, 1, 1, 1,
0.6082382, -0.004597665, 1.664232, 1, 1, 1, 1, 1,
0.6144658, -0.8189139, 1.387622, 1, 1, 1, 1, 1,
0.6152133, 2.4089, 0.93446, 0, 0, 1, 1, 1,
0.6170798, -2.314709, 1.768391, 1, 0, 0, 1, 1,
0.6175449, 0.4101746, 1.018076, 1, 0, 0, 1, 1,
0.6184184, -0.2603772, 2.056173, 1, 0, 0, 1, 1,
0.6186367, -0.9303554, 4.414676, 1, 0, 0, 1, 1,
0.6229231, 0.3473696, -0.15529, 1, 0, 0, 1, 1,
0.623064, 0.4030282, 0.9870236, 0, 0, 0, 1, 1,
0.6266167, 0.6039967, 0.3889613, 0, 0, 0, 1, 1,
0.6274308, -0.6676729, 1.186262, 0, 0, 0, 1, 1,
0.6319662, 0.05005928, 1.074941, 0, 0, 0, 1, 1,
0.6322764, -0.3664009, 2.720356, 0, 0, 0, 1, 1,
0.6347281, -1.592734, 1.16063, 0, 0, 0, 1, 1,
0.6353577, -0.288898, 0.8040663, 0, 0, 0, 1, 1,
0.6354464, 0.4663127, 2.121255, 1, 1, 1, 1, 1,
0.6425233, -0.4320955, 3.661598, 1, 1, 1, 1, 1,
0.6443148, -0.07775684, 2.023769, 1, 1, 1, 1, 1,
0.6465387, -0.9200941, 4.510335, 1, 1, 1, 1, 1,
0.6469005, 0.3701862, 0.1035658, 1, 1, 1, 1, 1,
0.6501287, -0.9255881, 3.974657, 1, 1, 1, 1, 1,
0.6521011, -0.3360953, 2.866497, 1, 1, 1, 1, 1,
0.6608368, -0.4972716, 1.679333, 1, 1, 1, 1, 1,
0.6643426, -0.1997797, 2.985135, 1, 1, 1, 1, 1,
0.6647955, -0.5622666, 0.9982035, 1, 1, 1, 1, 1,
0.6671001, 1.223272, 1.249397, 1, 1, 1, 1, 1,
0.6701549, -0.425641, 3.435335, 1, 1, 1, 1, 1,
0.6701677, -0.2762675, 3.096243, 1, 1, 1, 1, 1,
0.6726343, 0.1652127, 3.166135, 1, 1, 1, 1, 1,
0.679051, -0.1874283, 3.506648, 1, 1, 1, 1, 1,
0.6811379, 0.7785658, 2.80632, 0, 0, 1, 1, 1,
0.6919724, -0.7196681, 0.8382388, 1, 0, 0, 1, 1,
0.6943716, -0.3358451, 2.217048, 1, 0, 0, 1, 1,
0.6951531, -0.8844398, 4.150044, 1, 0, 0, 1, 1,
0.6965699, -2.138411, 1.296838, 1, 0, 0, 1, 1,
0.7007258, 0.4016934, 1.04516, 1, 0, 0, 1, 1,
0.7015009, 0.2525601, -0.8438598, 0, 0, 0, 1, 1,
0.7021323, -0.7358641, 0.9392937, 0, 0, 0, 1, 1,
0.7048293, 0.7806895, 1.633849, 0, 0, 0, 1, 1,
0.706835, 0.9316207, 1.024433, 0, 0, 0, 1, 1,
0.7104791, 0.8708733, 0.681978, 0, 0, 0, 1, 1,
0.7120706, 0.8586007, -0.1623193, 0, 0, 0, 1, 1,
0.7179035, -0.08736832, 3.535986, 0, 0, 0, 1, 1,
0.7188997, -1.460018, 1.566224, 1, 1, 1, 1, 1,
0.7198837, 0.4070223, -0.335116, 1, 1, 1, 1, 1,
0.7241524, 0.4419262, 0.3838642, 1, 1, 1, 1, 1,
0.7247512, -0.7019612, 1.631176, 1, 1, 1, 1, 1,
0.7267921, 1.66312, 2.049138, 1, 1, 1, 1, 1,
0.7398872, -0.2315153, 3.554784, 1, 1, 1, 1, 1,
0.7408862, -0.1035167, 1.774503, 1, 1, 1, 1, 1,
0.7443978, -0.6909551, 1.305899, 1, 1, 1, 1, 1,
0.745019, -0.8628141, 2.758649, 1, 1, 1, 1, 1,
0.7460172, -0.1449364, 1.943931, 1, 1, 1, 1, 1,
0.7482375, 0.2841116, 0.5981092, 1, 1, 1, 1, 1,
0.7488315, 1.135321, -0.5127952, 1, 1, 1, 1, 1,
0.7522738, -1.398159, 3.022779, 1, 1, 1, 1, 1,
0.7535533, -0.8400557, 3.283691, 1, 1, 1, 1, 1,
0.7558265, 0.6343003, -0.06148478, 1, 1, 1, 1, 1,
0.7582552, -0.8796712, 1.564252, 0, 0, 1, 1, 1,
0.7588006, 0.0218059, 1.928586, 1, 0, 0, 1, 1,
0.7640961, 0.2803593, 0.5921795, 1, 0, 0, 1, 1,
0.7662198, 2.669446, 0.1062561, 1, 0, 0, 1, 1,
0.7708, 0.4671058, 0.8203997, 1, 0, 0, 1, 1,
0.775839, 1.078181, -0.4076457, 1, 0, 0, 1, 1,
0.7780997, -0.6259471, 1.906017, 0, 0, 0, 1, 1,
0.7802232, -0.119599, 1.257098, 0, 0, 0, 1, 1,
0.780243, -0.277243, 1.88067, 0, 0, 0, 1, 1,
0.7832859, -0.501003, 0.9249228, 0, 0, 0, 1, 1,
0.7865434, -0.1297226, 0.9534961, 0, 0, 0, 1, 1,
0.7875776, 0.7348408, -0.8570128, 0, 0, 0, 1, 1,
0.7901107, 0.8364186, 2.538043, 0, 0, 0, 1, 1,
0.7945467, 2.163412, -0.1699559, 1, 1, 1, 1, 1,
0.7957642, -0.965303, 1.59861, 1, 1, 1, 1, 1,
0.8074658, 2.293841, 1.283791, 1, 1, 1, 1, 1,
0.8147101, -0.4226404, 2.335349, 1, 1, 1, 1, 1,
0.8191388, 0.695886, 1.119905, 1, 1, 1, 1, 1,
0.8314495, 1.380696, 0.5532625, 1, 1, 1, 1, 1,
0.8315897, -0.3532311, 2.420559, 1, 1, 1, 1, 1,
0.8361682, -0.1065344, 0.8726439, 1, 1, 1, 1, 1,
0.8376087, 0.04459653, 3.198463, 1, 1, 1, 1, 1,
0.8376104, -0.7189357, 1.294877, 1, 1, 1, 1, 1,
0.8402446, 0.6410276, -0.3646144, 1, 1, 1, 1, 1,
0.8402702, -0.5893182, 1.342331, 1, 1, 1, 1, 1,
0.841567, -1.456586, 1.884704, 1, 1, 1, 1, 1,
0.8431522, -2.463128, 4.05196, 1, 1, 1, 1, 1,
0.8456881, -1.627575, 1.940039, 1, 1, 1, 1, 1,
0.8464667, 1.581519, 1.789498, 0, 0, 1, 1, 1,
0.8511589, 0.625273, 2.228496, 1, 0, 0, 1, 1,
0.8567966, 1.090181, -0.04481057, 1, 0, 0, 1, 1,
0.8568663, 0.9509913, 0.7394934, 1, 0, 0, 1, 1,
0.8582951, -0.2257463, 2.794216, 1, 0, 0, 1, 1,
0.8627947, -1.761111, 1.821989, 1, 0, 0, 1, 1,
0.8643194, -0.2760442, 4.208752, 0, 0, 0, 1, 1,
0.8659052, -0.3313226, 1.8053, 0, 0, 0, 1, 1,
0.8681151, 1.017539, 1.811229, 0, 0, 0, 1, 1,
0.8706285, 1.439297, 0.1693581, 0, 0, 0, 1, 1,
0.8728973, 0.3881528, 0.2386145, 0, 0, 0, 1, 1,
0.8777714, 0.2891383, 1.289094, 0, 0, 0, 1, 1,
0.8782974, -2.035574, 2.690161, 0, 0, 0, 1, 1,
0.8884546, 0.2783791, 1.445816, 1, 1, 1, 1, 1,
0.8902488, -0.8088998, 2.482551, 1, 1, 1, 1, 1,
0.8966868, 0.282034, 2.965743, 1, 1, 1, 1, 1,
0.896908, -1.250549, 2.291238, 1, 1, 1, 1, 1,
0.8988168, -1.134245, 3.871115, 1, 1, 1, 1, 1,
0.9000401, 1.263525, 1.826889, 1, 1, 1, 1, 1,
0.9043235, -1.122311, 0.364362, 1, 1, 1, 1, 1,
0.9158074, 0.227807, 1.911227, 1, 1, 1, 1, 1,
0.9168199, -0.849393, 1.916866, 1, 1, 1, 1, 1,
0.92269, 1.237296, 0.5518776, 1, 1, 1, 1, 1,
0.9319171, 1.388956, -0.5580819, 1, 1, 1, 1, 1,
0.9366577, -0.1583081, 1.514461, 1, 1, 1, 1, 1,
0.9379518, 0.2575622, 0.6857728, 1, 1, 1, 1, 1,
0.955051, -0.3906321, 0.2436375, 1, 1, 1, 1, 1,
0.9553373, 0.2978982, 1.145469, 1, 1, 1, 1, 1,
0.9569167, -0.2248956, 0.7052706, 0, 0, 1, 1, 1,
0.9577218, 0.4348944, 2.554832, 1, 0, 0, 1, 1,
0.9723395, 2.832444, 0.581789, 1, 0, 0, 1, 1,
0.9791688, 0.3483119, 1.155698, 1, 0, 0, 1, 1,
0.9811101, -0.1996918, 3.23511, 1, 0, 0, 1, 1,
0.9821666, 0.2947775, 1.868751, 1, 0, 0, 1, 1,
0.9936268, -1.437171, 2.204145, 0, 0, 0, 1, 1,
0.9958316, -0.6399004, 1.248261, 0, 0, 0, 1, 1,
0.9992784, -2.19259, 2.195279, 0, 0, 0, 1, 1,
1.005496, 0.2516026, 1.420645, 0, 0, 0, 1, 1,
1.013753, 0.7932149, 2.778624, 0, 0, 0, 1, 1,
1.022316, -0.6513463, 3.081935, 0, 0, 0, 1, 1,
1.024926, 0.3046953, 1.46041, 0, 0, 0, 1, 1,
1.029084, -0.1754479, 3.017959, 1, 1, 1, 1, 1,
1.035197, 0.3977816, 2.203336, 1, 1, 1, 1, 1,
1.042814, 2.181918, -0.3878581, 1, 1, 1, 1, 1,
1.044097, 0.7836251, -0.04281221, 1, 1, 1, 1, 1,
1.04556, -0.7109168, 2.82922, 1, 1, 1, 1, 1,
1.051338, 0.1778904, 2.989732, 1, 1, 1, 1, 1,
1.055788, -0.4266077, 2.637631, 1, 1, 1, 1, 1,
1.065721, -0.7033434, 3.276483, 1, 1, 1, 1, 1,
1.074773, -1.713554, 0.2140897, 1, 1, 1, 1, 1,
1.086276, 0.1699855, 1.315075, 1, 1, 1, 1, 1,
1.090961, -0.6277394, 2.042354, 1, 1, 1, 1, 1,
1.095788, -0.6251808, 3.056425, 1, 1, 1, 1, 1,
1.100439, -0.4451783, 1.951322, 1, 1, 1, 1, 1,
1.100922, -1.274714, 1.289551, 1, 1, 1, 1, 1,
1.10111, 0.9916597, 0.3771021, 1, 1, 1, 1, 1,
1.101758, 1.852202, 1.360647, 0, 0, 1, 1, 1,
1.106827, -0.9596134, 1.745652, 1, 0, 0, 1, 1,
1.108143, -0.7051569, 0.6452549, 1, 0, 0, 1, 1,
1.126089, 1.236514, 1.296292, 1, 0, 0, 1, 1,
1.127455, -0.5052348, 1.839622, 1, 0, 0, 1, 1,
1.129814, -0.4162618, 0.2197737, 1, 0, 0, 1, 1,
1.133304, -0.4409539, 0.7299397, 0, 0, 0, 1, 1,
1.133936, 1.254902, 0.283434, 0, 0, 0, 1, 1,
1.136585, -0.005208856, 2.32707, 0, 0, 0, 1, 1,
1.136823, 0.2951282, 0.8411292, 0, 0, 0, 1, 1,
1.139755, -0.1712552, 1.651637, 0, 0, 0, 1, 1,
1.14271, -0.7664573, 2.174294, 0, 0, 0, 1, 1,
1.150063, -1.185326, 0.6243929, 0, 0, 0, 1, 1,
1.164067, -0.04902194, 2.027271, 1, 1, 1, 1, 1,
1.174655, 0.4897492, 2.495243, 1, 1, 1, 1, 1,
1.175746, -1.246645, 2.656414, 1, 1, 1, 1, 1,
1.176083, -1.078688, 0.1352266, 1, 1, 1, 1, 1,
1.179452, 0.04895523, 1.580237, 1, 1, 1, 1, 1,
1.185257, 1.842636, 2.361803, 1, 1, 1, 1, 1,
1.189971, -0.2440588, 2.378268, 1, 1, 1, 1, 1,
1.195179, -0.6652187, -0.04044529, 1, 1, 1, 1, 1,
1.200394, 0.6524276, 2.606464, 1, 1, 1, 1, 1,
1.200528, 0.145377, 0.789596, 1, 1, 1, 1, 1,
1.200624, -0.538753, 2.394424, 1, 1, 1, 1, 1,
1.202537, -0.546971, 2.53706, 1, 1, 1, 1, 1,
1.205588, 0.546407, 1.339799, 1, 1, 1, 1, 1,
1.209425, -0.5065876, 0.5599834, 1, 1, 1, 1, 1,
1.217731, -0.1839909, 1.505805, 1, 1, 1, 1, 1,
1.218206, 2.171752, 1.661132, 0, 0, 1, 1, 1,
1.220751, 0.3397637, 3.520579, 1, 0, 0, 1, 1,
1.220946, -2.151481, 1.464427, 1, 0, 0, 1, 1,
1.221202, -2.019146, 3.581931, 1, 0, 0, 1, 1,
1.226722, -0.4540536, 1.271572, 1, 0, 0, 1, 1,
1.232201, 0.7466923, 1.277331, 1, 0, 0, 1, 1,
1.233737, 0.4292069, 0.3946162, 0, 0, 0, 1, 1,
1.236219, -1.028621, 2.312279, 0, 0, 0, 1, 1,
1.240975, 1.097054, 0.5171141, 0, 0, 0, 1, 1,
1.241732, -1.86625, 2.035843, 0, 0, 0, 1, 1,
1.241779, 1.024809, -1.602624, 0, 0, 0, 1, 1,
1.244873, 1.711133, -0.06503855, 0, 0, 0, 1, 1,
1.245103, -1.461557, 1.488299, 0, 0, 0, 1, 1,
1.256201, -0.9649941, 2.390543, 1, 1, 1, 1, 1,
1.264238, -0.04020656, 1.758688, 1, 1, 1, 1, 1,
1.264488, -0.9792514, 2.314769, 1, 1, 1, 1, 1,
1.26605, 0.7843435, -0.5645878, 1, 1, 1, 1, 1,
1.274951, -1.608614, 2.088419, 1, 1, 1, 1, 1,
1.290734, -0.9968631, 1.424505, 1, 1, 1, 1, 1,
1.309858, -0.4033035, 3.542326, 1, 1, 1, 1, 1,
1.314155, -1.267181, 2.458554, 1, 1, 1, 1, 1,
1.316834, -0.3693023, 0.2811545, 1, 1, 1, 1, 1,
1.318982, -2.032848, 1.597698, 1, 1, 1, 1, 1,
1.319514, 0.2457737, 2.843326, 1, 1, 1, 1, 1,
1.322736, 0.3787232, -0.1408061, 1, 1, 1, 1, 1,
1.329399, 1.809676, 0.4281446, 1, 1, 1, 1, 1,
1.330374, -1.845796, 2.430734, 1, 1, 1, 1, 1,
1.332531, -0.3004925, 2.250319, 1, 1, 1, 1, 1,
1.333006, -1.349946, 4.045082, 0, 0, 1, 1, 1,
1.342027, -0.5917442, 0.5220783, 1, 0, 0, 1, 1,
1.350605, 1.198533, 0.8758312, 1, 0, 0, 1, 1,
1.36075, 0.2153378, 0.029515, 1, 0, 0, 1, 1,
1.366693, -0.9486118, 1.357414, 1, 0, 0, 1, 1,
1.382435, -1.119502, 2.618193, 1, 0, 0, 1, 1,
1.383225, -1.676431, 0.6033163, 0, 0, 0, 1, 1,
1.386498, 1.864363, 0.1487215, 0, 0, 0, 1, 1,
1.392079, -0.9741441, 2.57271, 0, 0, 0, 1, 1,
1.392231, -1.423515, 1.24454, 0, 0, 0, 1, 1,
1.398223, 0.4860636, 0.6548715, 0, 0, 0, 1, 1,
1.40879, 1.569704, 1.022064, 0, 0, 0, 1, 1,
1.428614, 1.089221, 1.367355, 0, 0, 0, 1, 1,
1.428856, 0.9177695, 2.748828, 1, 1, 1, 1, 1,
1.439099, 1.172075, 1.409743, 1, 1, 1, 1, 1,
1.447345, 0.1488005, 1.221518, 1, 1, 1, 1, 1,
1.45348, -0.9552895, 1.9561, 1, 1, 1, 1, 1,
1.465883, -0.4696357, 1.931564, 1, 1, 1, 1, 1,
1.466085, 1.211503, 1.457307, 1, 1, 1, 1, 1,
1.498514, 1.047704, 0.8963969, 1, 1, 1, 1, 1,
1.501458, 1.136048, 1.83051, 1, 1, 1, 1, 1,
1.506462, -0.5825336, 3.23947, 1, 1, 1, 1, 1,
1.527339, 0.1918597, 1.884214, 1, 1, 1, 1, 1,
1.533949, -2.925309, 3.797015, 1, 1, 1, 1, 1,
1.541962, 1.295143, 1.617593, 1, 1, 1, 1, 1,
1.546345, -0.7689634, 1.33675, 1, 1, 1, 1, 1,
1.566225, -0.5089015, 2.507076, 1, 1, 1, 1, 1,
1.569104, 0.4562306, 0.9072461, 1, 1, 1, 1, 1,
1.574157, 0.0305931, 3.033766, 0, 0, 1, 1, 1,
1.575368, 1.133019, 3.426061, 1, 0, 0, 1, 1,
1.576677, -0.06158008, 1.629773, 1, 0, 0, 1, 1,
1.57703, 0.8867139, 0.2277211, 1, 0, 0, 1, 1,
1.588398, 1.600078, 1.761221, 1, 0, 0, 1, 1,
1.601257, 0.1218253, 2.28007, 1, 0, 0, 1, 1,
1.626472, -0.7693133, 2.059925, 0, 0, 0, 1, 1,
1.631863, -0.345199, 2.663451, 0, 0, 0, 1, 1,
1.651858, 0.809059, -0.2082014, 0, 0, 0, 1, 1,
1.662333, 0.2326001, 1.903801, 0, 0, 0, 1, 1,
1.66556, 0.571645, 1.126161, 0, 0, 0, 1, 1,
1.676767, -0.6922356, 1.792035, 0, 0, 0, 1, 1,
1.684046, 0.1362962, 2.471025, 0, 0, 0, 1, 1,
1.705366, 0.219024, -0.3028493, 1, 1, 1, 1, 1,
1.712699, 0.3693318, -0.1403671, 1, 1, 1, 1, 1,
1.724787, -0.9859614, 2.72503, 1, 1, 1, 1, 1,
1.742713, 1.218338, 3.331432, 1, 1, 1, 1, 1,
1.7503, -0.9733074, 2.54124, 1, 1, 1, 1, 1,
1.755555, -0.08154126, 1.20068, 1, 1, 1, 1, 1,
1.797027, -1.594674, 3.0221, 1, 1, 1, 1, 1,
1.804437, -1.462175, 2.15942, 1, 1, 1, 1, 1,
1.815112, 0.9463905, 0.5646209, 1, 1, 1, 1, 1,
1.825768, 1.746214, 0.9695774, 1, 1, 1, 1, 1,
1.872695, -0.197428, -0.7272522, 1, 1, 1, 1, 1,
1.882867, -0.9403782, 1.642953, 1, 1, 1, 1, 1,
1.886686, -1.030748, 2.085338, 1, 1, 1, 1, 1,
1.922766, 1.601194, 0.4208974, 1, 1, 1, 1, 1,
1.933107, -2.082329, 1.999622, 1, 1, 1, 1, 1,
1.93572, -0.8854842, 2.223357, 0, 0, 1, 1, 1,
1.939123, -0.05603853, 1.832573, 1, 0, 0, 1, 1,
1.940406, -1.61876, 2.105934, 1, 0, 0, 1, 1,
1.972289, -0.07035097, 3.340625, 1, 0, 0, 1, 1,
2.024655, 0.2967884, 1.113621, 1, 0, 0, 1, 1,
2.087932, -0.1593002, -0.4131705, 1, 0, 0, 1, 1,
2.105837, -0.719844, 1.116931, 0, 0, 0, 1, 1,
2.146427, -0.5326678, 2.467973, 0, 0, 0, 1, 1,
2.226245, -1.360362, 1.833434, 0, 0, 0, 1, 1,
2.237018, 0.6618682, 1.397318, 0, 0, 0, 1, 1,
2.261054, -0.8632219, 0.9601303, 0, 0, 0, 1, 1,
2.268944, 0.1074755, 1.711133, 0, 0, 0, 1, 1,
2.407653, -1.184193, 3.42419, 0, 0, 0, 1, 1,
2.453851, -2.222576, 1.790516, 1, 1, 1, 1, 1,
2.500993, 0.1338477, 4.815246, 1, 1, 1, 1, 1,
2.502659, -1.424194, 2.659515, 1, 1, 1, 1, 1,
2.55652, 1.157509, 3.179968, 1, 1, 1, 1, 1,
2.589358, -0.9053349, 0.6974816, 1, 1, 1, 1, 1,
2.778256, -1.937191, 2.754799, 1, 1, 1, 1, 1,
2.855314, -0.8253564, 1.041681, 1, 1, 1, 1, 1
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
var radius = 10.00749;
var distance = 35.15088;
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
mvMatrix.translate( 0.5789804, 0.5229348, -0.9742475 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.15088);
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
