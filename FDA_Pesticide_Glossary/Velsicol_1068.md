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
-3.3194, 0.2230902, -0.2300101, 1, 0, 0, 1,
-2.955271, 0.7522871, -2.080918, 1, 0.007843138, 0, 1,
-2.800076, -2.453422, -2.553036, 1, 0.01176471, 0, 1,
-2.724124, 0.6985752, 0.02318536, 1, 0.01960784, 0, 1,
-2.713145, -0.5751126, -2.460149, 1, 0.02352941, 0, 1,
-2.696951, -0.03310156, -1.631214, 1, 0.03137255, 0, 1,
-2.65308, 0.9422904, 0.260207, 1, 0.03529412, 0, 1,
-2.597022, 0.3308102, -0.7750599, 1, 0.04313726, 0, 1,
-2.550262, -1.023695, -1.89863, 1, 0.04705882, 0, 1,
-2.293698, 0.469751, -0.342386, 1, 0.05490196, 0, 1,
-2.279706, 0.3182311, -1.366481, 1, 0.05882353, 0, 1,
-2.272937, -0.08454763, -0.9500675, 1, 0.06666667, 0, 1,
-2.232456, 1.870727, 0.1108389, 1, 0.07058824, 0, 1,
-2.22577, 1.736717, -1.265627, 1, 0.07843138, 0, 1,
-2.215641, 0.642296, -1.649019, 1, 0.08235294, 0, 1,
-2.188527, 1.002301, -0.8422167, 1, 0.09019608, 0, 1,
-2.178338, 0.5853469, -1.405748, 1, 0.09411765, 0, 1,
-2.168726, 1.810913, -1.638659, 1, 0.1019608, 0, 1,
-2.159128, -1.011922, -1.232233, 1, 0.1098039, 0, 1,
-2.144806, 1.212531, -1.621199, 1, 0.1137255, 0, 1,
-2.096082, 0.4356088, -0.6608769, 1, 0.1215686, 0, 1,
-2.036282, 0.1872473, -0.9827467, 1, 0.1254902, 0, 1,
-2.00165, -0.6564907, -0.3830384, 1, 0.1333333, 0, 1,
-1.993554, 1.038203, -1.467724, 1, 0.1372549, 0, 1,
-1.97817, 1.533426, -1.63487, 1, 0.145098, 0, 1,
-1.966249, 0.8586347, -2.321417, 1, 0.1490196, 0, 1,
-1.946815, -0.144095, -1.430111, 1, 0.1568628, 0, 1,
-1.93015, -0.3939751, -2.220777, 1, 0.1607843, 0, 1,
-1.925679, 0.01411016, 0.1299106, 1, 0.1686275, 0, 1,
-1.910045, 1.483313, -1.161503, 1, 0.172549, 0, 1,
-1.906443, 0.7968049, -2.024908, 1, 0.1803922, 0, 1,
-1.902485, -0.1372795, -1.869268, 1, 0.1843137, 0, 1,
-1.889531, -1.008407, -3.01773, 1, 0.1921569, 0, 1,
-1.848482, 0.3691538, -2.401881, 1, 0.1960784, 0, 1,
-1.834394, -1.262951, -0.5100041, 1, 0.2039216, 0, 1,
-1.811602, -0.3811566, -1.461555, 1, 0.2117647, 0, 1,
-1.792894, -1.273621, -2.423503, 1, 0.2156863, 0, 1,
-1.790472, 0.6797856, -0.7268032, 1, 0.2235294, 0, 1,
-1.781438, 0.5735918, -1.971761, 1, 0.227451, 0, 1,
-1.771127, 1.666297, -1.600782, 1, 0.2352941, 0, 1,
-1.752743, -0.7916363, -2.828077, 1, 0.2392157, 0, 1,
-1.746754, -0.3575141, 0.6550109, 1, 0.2470588, 0, 1,
-1.723861, -0.4312087, -2.42369, 1, 0.2509804, 0, 1,
-1.717654, 0.5354456, -1.277154, 1, 0.2588235, 0, 1,
-1.717309, 0.202327, -0.2826214, 1, 0.2627451, 0, 1,
-1.694645, 0.4363156, -1.839328, 1, 0.2705882, 0, 1,
-1.69191, 0.1502529, -2.119132, 1, 0.2745098, 0, 1,
-1.688703, 0.4283182, -2.016114, 1, 0.282353, 0, 1,
-1.665025, -0.2203903, -1.042259, 1, 0.2862745, 0, 1,
-1.656795, 1.000468, 0.6187728, 1, 0.2941177, 0, 1,
-1.656534, -1.160557, -0.9360825, 1, 0.3019608, 0, 1,
-1.629007, -1.571998, -2.596316, 1, 0.3058824, 0, 1,
-1.623427, -1.94464, -3.749241, 1, 0.3137255, 0, 1,
-1.615309, 0.08161788, -0.8960018, 1, 0.3176471, 0, 1,
-1.613659, 0.2038346, -0.9213998, 1, 0.3254902, 0, 1,
-1.600711, -0.7094902, -3.534697, 1, 0.3294118, 0, 1,
-1.597652, 0.7969415, -1.357869, 1, 0.3372549, 0, 1,
-1.591946, -1.065885, -3.334918, 1, 0.3411765, 0, 1,
-1.584275, -1.3984, -1.254435, 1, 0.3490196, 0, 1,
-1.567088, 1.996306, -1.356436, 1, 0.3529412, 0, 1,
-1.552999, -0.355523, -2.877693, 1, 0.3607843, 0, 1,
-1.539757, -2.163846, -0.5869824, 1, 0.3647059, 0, 1,
-1.526143, -0.2173543, -0.3567478, 1, 0.372549, 0, 1,
-1.518761, 1.729118, 0.3992505, 1, 0.3764706, 0, 1,
-1.506187, 0.5754357, 0.3501747, 1, 0.3843137, 0, 1,
-1.497532, -0.727228, -2.914215, 1, 0.3882353, 0, 1,
-1.49267, -0.9781085, -2.3955, 1, 0.3960784, 0, 1,
-1.481788, 0.3312015, 0.08675933, 1, 0.4039216, 0, 1,
-1.477295, 0.3485372, -1.01871, 1, 0.4078431, 0, 1,
-1.474438, 1.277316, 1.204647, 1, 0.4156863, 0, 1,
-1.466095, -0.0780473, -2.05823, 1, 0.4196078, 0, 1,
-1.463837, -0.5674901, -2.285557, 1, 0.427451, 0, 1,
-1.441013, 1.703539, -0.7775304, 1, 0.4313726, 0, 1,
-1.440869, 0.8393164, -2.379097, 1, 0.4392157, 0, 1,
-1.438218, -0.4489274, -0.1759797, 1, 0.4431373, 0, 1,
-1.431129, -0.4458054, -0.9998098, 1, 0.4509804, 0, 1,
-1.419879, 0.4147698, -1.810805, 1, 0.454902, 0, 1,
-1.413043, -0.3406243, -2.768517, 1, 0.4627451, 0, 1,
-1.410828, -0.9960392, -0.2571182, 1, 0.4666667, 0, 1,
-1.407848, -2.274692, -2.850223, 1, 0.4745098, 0, 1,
-1.403628, -0.1306727, 0.1666736, 1, 0.4784314, 0, 1,
-1.38887, -0.7455833, -1.804035, 1, 0.4862745, 0, 1,
-1.378609, 0.221051, -2.086524, 1, 0.4901961, 0, 1,
-1.378359, 0.6192144, -0.6036518, 1, 0.4980392, 0, 1,
-1.375817, 1.866554, -2.464503, 1, 0.5058824, 0, 1,
-1.368561, -0.9147104, -3.460828, 1, 0.509804, 0, 1,
-1.366137, 0.9270685, -2.292885, 1, 0.5176471, 0, 1,
-1.346322, -1.268799, -2.301044, 1, 0.5215687, 0, 1,
-1.326506, 1.260003, -2.039672, 1, 0.5294118, 0, 1,
-1.322639, 0.2874989, -2.403516, 1, 0.5333334, 0, 1,
-1.310881, 2.006878, -1.242363, 1, 0.5411765, 0, 1,
-1.302011, -1.202719, -3.20808, 1, 0.5450981, 0, 1,
-1.297045, 2.028198, -2.726138, 1, 0.5529412, 0, 1,
-1.292829, -1.389222, -2.991259, 1, 0.5568628, 0, 1,
-1.276598, 0.9743678, -1.308758, 1, 0.5647059, 0, 1,
-1.272958, -0.4543244, -2.949566, 1, 0.5686275, 0, 1,
-1.270729, -1.644122, -2.628906, 1, 0.5764706, 0, 1,
-1.270056, -0.4076308, -2.461797, 1, 0.5803922, 0, 1,
-1.26984, 0.6272613, -2.753645, 1, 0.5882353, 0, 1,
-1.267184, 1.083588, -0.1007816, 1, 0.5921569, 0, 1,
-1.26718, -1.403663, -2.322211, 1, 0.6, 0, 1,
-1.261548, 0.2479036, 0.3839639, 1, 0.6078432, 0, 1,
-1.261174, -0.002920828, -1.213685, 1, 0.6117647, 0, 1,
-1.261023, 1.757651e-05, -2.428194, 1, 0.6196079, 0, 1,
-1.260219, 0.02602334, -4.186872, 1, 0.6235294, 0, 1,
-1.251978, -0.896557, -2.249084, 1, 0.6313726, 0, 1,
-1.249757, -0.3874336, -0.53328, 1, 0.6352941, 0, 1,
-1.24886, 0.7185631, -2.915181, 1, 0.6431373, 0, 1,
-1.247183, -0.4290447, -1.757136, 1, 0.6470588, 0, 1,
-1.244395, -1.178816, -3.147933, 1, 0.654902, 0, 1,
-1.235436, 0.5704936, -2.78785, 1, 0.6588235, 0, 1,
-1.22436, -0.177042, -1.737369, 1, 0.6666667, 0, 1,
-1.224172, -1.338976, -1.525016, 1, 0.6705883, 0, 1,
-1.223854, -0.6644088, -2.060704, 1, 0.6784314, 0, 1,
-1.220965, -1.773885, -4.305193, 1, 0.682353, 0, 1,
-1.204544, -0.6236669, -3.25094, 1, 0.6901961, 0, 1,
-1.194506, 0.5565912, -1.040137, 1, 0.6941177, 0, 1,
-1.189385, 1.602852, -0.8573232, 1, 0.7019608, 0, 1,
-1.182304, 0.3673838, -1.49009, 1, 0.7098039, 0, 1,
-1.174644, -2.186064, -2.423193, 1, 0.7137255, 0, 1,
-1.169808, -0.695317, -1.719386, 1, 0.7215686, 0, 1,
-1.167442, 0.1252145, -2.00532, 1, 0.7254902, 0, 1,
-1.161163, -0.7935168, -1.819139, 1, 0.7333333, 0, 1,
-1.154464, 0.7925057, -2.326069, 1, 0.7372549, 0, 1,
-1.150383, 0.5514954, -0.9091834, 1, 0.7450981, 0, 1,
-1.143817, -0.9019086, -1.755223, 1, 0.7490196, 0, 1,
-1.141789, 0.1920105, -0.3872305, 1, 0.7568628, 0, 1,
-1.141206, -1.371659, -1.613495, 1, 0.7607843, 0, 1,
-1.136149, -1.064544, -2.046164, 1, 0.7686275, 0, 1,
-1.13437, -0.3761575, -0.6448032, 1, 0.772549, 0, 1,
-1.131986, 0.5253443, -1.397652, 1, 0.7803922, 0, 1,
-1.128983, 0.1916662, -0.8110056, 1, 0.7843137, 0, 1,
-1.125442, 0.5856509, -2.784828, 1, 0.7921569, 0, 1,
-1.124697, -0.5975935, -1.836113, 1, 0.7960784, 0, 1,
-1.118197, -1.361003, -3.371712, 1, 0.8039216, 0, 1,
-1.115176, -1.909112, -1.894923, 1, 0.8117647, 0, 1,
-1.112437, -1.729231, -2.604089, 1, 0.8156863, 0, 1,
-1.10669, -0.8645977, -1.308991, 1, 0.8235294, 0, 1,
-1.106272, -0.7656365, -2.853347, 1, 0.827451, 0, 1,
-1.104787, 0.4537351, -0.5661093, 1, 0.8352941, 0, 1,
-1.096686, 0.7235716, -0.6640796, 1, 0.8392157, 0, 1,
-1.096467, 0.09849137, -1.274941, 1, 0.8470588, 0, 1,
-1.090291, 0.5937789, -1.710017, 1, 0.8509804, 0, 1,
-1.089982, 0.8828852, -2.081194, 1, 0.8588235, 0, 1,
-1.080313, 0.343834, -2.062603, 1, 0.8627451, 0, 1,
-1.079218, -0.1208917, -0.6710891, 1, 0.8705882, 0, 1,
-1.077935, 0.7395592, 0.2958985, 1, 0.8745098, 0, 1,
-1.070574, -0.7064612, -2.924831, 1, 0.8823529, 0, 1,
-1.069818, 0.09142238, -1.640599, 1, 0.8862745, 0, 1,
-1.040447, -0.2361366, -1.614747, 1, 0.8941177, 0, 1,
-1.040363, 0.4163643, -0.8411915, 1, 0.8980392, 0, 1,
-1.039861, 2.724844, 0.1218012, 1, 0.9058824, 0, 1,
-1.037371, -1.261774, -3.170127, 1, 0.9137255, 0, 1,
-1.033161, 0.2413328, -1.365816, 1, 0.9176471, 0, 1,
-1.031155, -0.3405992, -2.124041, 1, 0.9254902, 0, 1,
-1.031101, -0.4230272, -1.645296, 1, 0.9294118, 0, 1,
-1.029706, -1.271132, -3.522829, 1, 0.9372549, 0, 1,
-1.022243, -0.6134168, -0.78043, 1, 0.9411765, 0, 1,
-1.018699, 0.1930538, -1.475058, 1, 0.9490196, 0, 1,
-1.014928, 0.4505094, -2.091468, 1, 0.9529412, 0, 1,
-1.012449, -0.5608345, -1.377302, 1, 0.9607843, 0, 1,
-1.005825, -0.7534145, -0.7661918, 1, 0.9647059, 0, 1,
-1.001608, -0.4906188, -2.306449, 1, 0.972549, 0, 1,
-0.9997541, 0.3305396, -2.261998, 1, 0.9764706, 0, 1,
-0.9975191, 0.9247096, -1.480554, 1, 0.9843137, 0, 1,
-0.9967861, -0.3241781, -2.292838, 1, 0.9882353, 0, 1,
-0.9958115, 0.1887397, -2.237168, 1, 0.9960784, 0, 1,
-0.9838365, -2.26895, -3.564087, 0.9960784, 1, 0, 1,
-0.9769976, -0.8751413, -0.6003568, 0.9921569, 1, 0, 1,
-0.9769059, -0.370792, -2.571348, 0.9843137, 1, 0, 1,
-0.9702566, 0.6770329, -0.6722897, 0.9803922, 1, 0, 1,
-0.9694416, -0.5483103, -2.027551, 0.972549, 1, 0, 1,
-0.9580985, -1.109005, -1.946614, 0.9686275, 1, 0, 1,
-0.9578745, -0.4939523, -1.460062, 0.9607843, 1, 0, 1,
-0.9546441, 0.4026677, -0.4947023, 0.9568627, 1, 0, 1,
-0.9495615, 1.544076, 0.01775083, 0.9490196, 1, 0, 1,
-0.9494632, -1.450299, -0.6247551, 0.945098, 1, 0, 1,
-0.945746, 1.199202, -0.4753948, 0.9372549, 1, 0, 1,
-0.9358193, -0.3205105, -1.839888, 0.9333333, 1, 0, 1,
-0.9324997, -0.3878914, -3.445394, 0.9254902, 1, 0, 1,
-0.9315425, -1.189282, -2.953221, 0.9215686, 1, 0, 1,
-0.9265352, -0.01302424, 0.790068, 0.9137255, 1, 0, 1,
-0.9257449, 1.056018, -0.4405075, 0.9098039, 1, 0, 1,
-0.9237629, -1.528348, -4.708213, 0.9019608, 1, 0, 1,
-0.923205, -1.716688, -2.48861, 0.8941177, 1, 0, 1,
-0.9220731, -0.2714998, -1.730694, 0.8901961, 1, 0, 1,
-0.9201102, -0.1481934, -2.164492, 0.8823529, 1, 0, 1,
-0.9200063, 0.4082481, -0.4721271, 0.8784314, 1, 0, 1,
-0.9197115, 0.04282549, -0.4055967, 0.8705882, 1, 0, 1,
-0.9177696, 1.053192, 0.1630246, 0.8666667, 1, 0, 1,
-0.9139291, -1.502194, -3.312263, 0.8588235, 1, 0, 1,
-0.9121082, -0.6816374, -0.4916884, 0.854902, 1, 0, 1,
-0.8938804, 0.5478663, -0.8538849, 0.8470588, 1, 0, 1,
-0.8856763, 0.7108948, 0.1222754, 0.8431373, 1, 0, 1,
-0.8836398, 1.402328, 1.347994, 0.8352941, 1, 0, 1,
-0.8800167, 0.2468085, -2.206633, 0.8313726, 1, 0, 1,
-0.8749383, -0.4478739, -0.4968935, 0.8235294, 1, 0, 1,
-0.8710867, -1.062122, -2.833134, 0.8196079, 1, 0, 1,
-0.8697901, -1.869304, -1.936386, 0.8117647, 1, 0, 1,
-0.8693623, -1.081417, -0.5550188, 0.8078431, 1, 0, 1,
-0.8693325, -0.06497928, -0.3098986, 0.8, 1, 0, 1,
-0.8652515, 3.017933, 1.193942, 0.7921569, 1, 0, 1,
-0.8647411, 0.2220192, -0.829086, 0.7882353, 1, 0, 1,
-0.8600916, 0.3033243, -0.0241156, 0.7803922, 1, 0, 1,
-0.8551863, -1.471154, -5.648653, 0.7764706, 1, 0, 1,
-0.8486216, 0.3106441, -0.9116701, 0.7686275, 1, 0, 1,
-0.8446137, -1.054232, -3.954718, 0.7647059, 1, 0, 1,
-0.8397987, 0.1217219, 1.176414, 0.7568628, 1, 0, 1,
-0.8396414, 0.7860413, -1.024314, 0.7529412, 1, 0, 1,
-0.8351288, -0.529858, -2.810386, 0.7450981, 1, 0, 1,
-0.8194271, -1.042161, -3.433809, 0.7411765, 1, 0, 1,
-0.8183604, 0.2763289, -1.955611, 0.7333333, 1, 0, 1,
-0.8175734, 0.9168342, -0.4067761, 0.7294118, 1, 0, 1,
-0.8100723, -0.2907204, -2.929287, 0.7215686, 1, 0, 1,
-0.807723, -0.05872099, -1.287837, 0.7176471, 1, 0, 1,
-0.7857632, -1.144178, 0.4027751, 0.7098039, 1, 0, 1,
-0.7829095, 0.3425115, -1.465859, 0.7058824, 1, 0, 1,
-0.7806342, -1.290284, -1.12477, 0.6980392, 1, 0, 1,
-0.7733539, -0.9770994, -1.160818, 0.6901961, 1, 0, 1,
-0.7668315, 0.01067214, -2.304955, 0.6862745, 1, 0, 1,
-0.7496006, -0.3095304, -3.825443, 0.6784314, 1, 0, 1,
-0.7447335, -1.867918, -3.738549, 0.6745098, 1, 0, 1,
-0.7392451, 1.784316, -0.3685952, 0.6666667, 1, 0, 1,
-0.7375809, -0.1346152, -1.252299, 0.6627451, 1, 0, 1,
-0.735857, -0.06105701, 0.174214, 0.654902, 1, 0, 1,
-0.7330993, -0.6925306, -0.9825595, 0.6509804, 1, 0, 1,
-0.7296265, -0.1925994, -2.110994, 0.6431373, 1, 0, 1,
-0.7250649, 0.7725496, 0.1145931, 0.6392157, 1, 0, 1,
-0.7243908, 0.235014, -1.136426, 0.6313726, 1, 0, 1,
-0.7219352, 1.079031, 1.102742, 0.627451, 1, 0, 1,
-0.7179449, 0.1902069, -1.321965, 0.6196079, 1, 0, 1,
-0.7155129, -0.007674246, -3.294888, 0.6156863, 1, 0, 1,
-0.7078633, 1.186784, 0.2129909, 0.6078432, 1, 0, 1,
-0.6976837, -0.2086389, 0.5007317, 0.6039216, 1, 0, 1,
-0.6976538, -0.09365837, -2.083581, 0.5960785, 1, 0, 1,
-0.6933154, -0.823549, -0.5451244, 0.5882353, 1, 0, 1,
-0.6864569, -0.1730578, -2.827844, 0.5843138, 1, 0, 1,
-0.6824628, 0.2483749, -2.071743, 0.5764706, 1, 0, 1,
-0.6775996, -1.059202, -1.731166, 0.572549, 1, 0, 1,
-0.6727177, 0.1176025, -1.357855, 0.5647059, 1, 0, 1,
-0.6704634, 1.548319, 0.03695222, 0.5607843, 1, 0, 1,
-0.6666972, -1.115354, -2.456848, 0.5529412, 1, 0, 1,
-0.6639896, -0.3686755, -1.891075, 0.5490196, 1, 0, 1,
-0.6578187, 1.936719, -0.08948703, 0.5411765, 1, 0, 1,
-0.6569194, -0.415297, -3.506814, 0.5372549, 1, 0, 1,
-0.6541147, -0.4389542, -3.135283, 0.5294118, 1, 0, 1,
-0.6531371, -0.7773801, -1.881261, 0.5254902, 1, 0, 1,
-0.6512249, -1.646003, -3.527004, 0.5176471, 1, 0, 1,
-0.6489291, -0.3312194, -2.188736, 0.5137255, 1, 0, 1,
-0.6467246, -0.007075708, -1.334601, 0.5058824, 1, 0, 1,
-0.6460879, -0.2421778, -2.411865, 0.5019608, 1, 0, 1,
-0.644244, 0.5432857, 0.6629821, 0.4941176, 1, 0, 1,
-0.6376232, 1.385446, 0.3858669, 0.4862745, 1, 0, 1,
-0.6357846, -0.6790416, -3.853226, 0.4823529, 1, 0, 1,
-0.6329922, -0.3722721, -1.170036, 0.4745098, 1, 0, 1,
-0.6302888, 0.7834276, -0.8057515, 0.4705882, 1, 0, 1,
-0.6247429, -1.797734, -3.219185, 0.4627451, 1, 0, 1,
-0.6246473, 2.0128, -0.02589271, 0.4588235, 1, 0, 1,
-0.6186972, -0.8795976, -2.561514, 0.4509804, 1, 0, 1,
-0.6165531, 0.7083551, -0.02821571, 0.4470588, 1, 0, 1,
-0.6153812, -0.9162379, -2.743037, 0.4392157, 1, 0, 1,
-0.613662, -0.4125456, -2.671605, 0.4352941, 1, 0, 1,
-0.6130698, -0.0941245, -1.543392, 0.427451, 1, 0, 1,
-0.6117725, -0.5741506, -0.7919151, 0.4235294, 1, 0, 1,
-0.6106748, -2.709534, -3.652609, 0.4156863, 1, 0, 1,
-0.6082457, 0.6979275, -1.525325, 0.4117647, 1, 0, 1,
-0.6015068, -1.95181, -3.038226, 0.4039216, 1, 0, 1,
-0.6011898, 2.508903, 2.37498, 0.3960784, 1, 0, 1,
-0.5971867, -0.2510283, -3.232884, 0.3921569, 1, 0, 1,
-0.5933135, -0.4302768, -0.8914669, 0.3843137, 1, 0, 1,
-0.5933043, -1.02596, -1.821469, 0.3803922, 1, 0, 1,
-0.5899305, -0.2949719, -1.37207, 0.372549, 1, 0, 1,
-0.5800964, 1.088194, -0.3965905, 0.3686275, 1, 0, 1,
-0.5784854, -0.4142075, -2.794839, 0.3607843, 1, 0, 1,
-0.5756647, -0.560775, -1.015438, 0.3568628, 1, 0, 1,
-0.573293, -0.1645041, -2.095195, 0.3490196, 1, 0, 1,
-0.5722593, 1.261129, 1.214909, 0.345098, 1, 0, 1,
-0.5719524, 2.256419, -1.396311, 0.3372549, 1, 0, 1,
-0.5631669, 1.551107, 0.3229982, 0.3333333, 1, 0, 1,
-0.5611778, -0.1992666, -0.9414615, 0.3254902, 1, 0, 1,
-0.5576068, -0.9207127, -3.955808, 0.3215686, 1, 0, 1,
-0.5517376, -0.4220354, -2.103101, 0.3137255, 1, 0, 1,
-0.5516171, -0.5775163, -2.483517, 0.3098039, 1, 0, 1,
-0.5495299, -1.944206, -3.188617, 0.3019608, 1, 0, 1,
-0.5474607, 0.1962863, -0.7925479, 0.2941177, 1, 0, 1,
-0.5444801, -1.559026, -3.242972, 0.2901961, 1, 0, 1,
-0.5442545, -1.510564, -2.346853, 0.282353, 1, 0, 1,
-0.5416462, -1.017865, -2.105128, 0.2784314, 1, 0, 1,
-0.5406408, 0.05477417, -2.458038, 0.2705882, 1, 0, 1,
-0.5286474, -1.481979, -3.527736, 0.2666667, 1, 0, 1,
-0.5240993, -0.9646172, -2.489593, 0.2588235, 1, 0, 1,
-0.5235899, 0.5066928, -1.692277, 0.254902, 1, 0, 1,
-0.5226143, 0.1871988, -0.4987329, 0.2470588, 1, 0, 1,
-0.516488, -1.740808, -3.607793, 0.2431373, 1, 0, 1,
-0.5161204, 0.8386859, -1.194739, 0.2352941, 1, 0, 1,
-0.5095909, 0.01740127, -2.433235, 0.2313726, 1, 0, 1,
-0.5087847, 0.8078678, -1.188568, 0.2235294, 1, 0, 1,
-0.5065695, 0.4363693, -0.6126311, 0.2196078, 1, 0, 1,
-0.5001454, -0.4514321, -2.857983, 0.2117647, 1, 0, 1,
-0.4982477, -1.27881, -3.996301, 0.2078431, 1, 0, 1,
-0.4978959, -0.7516517, -1.205631, 0.2, 1, 0, 1,
-0.4975654, -0.692793, -2.508251, 0.1921569, 1, 0, 1,
-0.4961433, 0.06536966, -1.921646, 0.1882353, 1, 0, 1,
-0.492958, 0.3375116, 0.3111343, 0.1803922, 1, 0, 1,
-0.4921009, -2.148518, -2.403239, 0.1764706, 1, 0, 1,
-0.492084, 0.1270197, -3.485402, 0.1686275, 1, 0, 1,
-0.4888239, -0.3264209, -1.499656, 0.1647059, 1, 0, 1,
-0.4866505, 0.883805, -1.285563, 0.1568628, 1, 0, 1,
-0.4857928, 0.2051772, 0.950387, 0.1529412, 1, 0, 1,
-0.4819532, -0.07568205, -0.3437022, 0.145098, 1, 0, 1,
-0.4780841, 1.145019, -0.3335844, 0.1411765, 1, 0, 1,
-0.4755436, -0.5702775, -2.225374, 0.1333333, 1, 0, 1,
-0.4736392, 0.3104759, -1.556717, 0.1294118, 1, 0, 1,
-0.470433, 0.2757525, -0.5712997, 0.1215686, 1, 0, 1,
-0.4693033, -0.1120084, -1.690085, 0.1176471, 1, 0, 1,
-0.4680383, 0.5105487, -1.647953, 0.1098039, 1, 0, 1,
-0.4671993, 0.1728527, 0.2170938, 0.1058824, 1, 0, 1,
-0.4599504, 0.4128191, -0.8257833, 0.09803922, 1, 0, 1,
-0.4596026, 2.77793, 2.270037, 0.09019608, 1, 0, 1,
-0.4584309, -1.96908, -2.508553, 0.08627451, 1, 0, 1,
-0.4546104, -0.7107108, -3.473145, 0.07843138, 1, 0, 1,
-0.4543089, 0.1158099, 0.4961288, 0.07450981, 1, 0, 1,
-0.4542462, -1.134242, -2.529212, 0.06666667, 1, 0, 1,
-0.4489661, 1.466506, 0.07629077, 0.0627451, 1, 0, 1,
-0.4487421, 0.4722829, -1.314278, 0.05490196, 1, 0, 1,
-0.4486647, -0.2154614, -2.185971, 0.05098039, 1, 0, 1,
-0.4479527, 0.9944017, -0.07301878, 0.04313726, 1, 0, 1,
-0.4446052, -0.7459574, -1.492964, 0.03921569, 1, 0, 1,
-0.4445896, 0.4508728, 1.011955, 0.03137255, 1, 0, 1,
-0.4436229, -0.3635178, -1.70118, 0.02745098, 1, 0, 1,
-0.4414104, -0.8529638, -2.394031, 0.01960784, 1, 0, 1,
-0.4390731, -1.588645, -2.9041, 0.01568628, 1, 0, 1,
-0.435367, 0.2918857, 0.4511905, 0.007843138, 1, 0, 1,
-0.4285495, 0.5815414, -0.6260749, 0.003921569, 1, 0, 1,
-0.4268819, 0.127737, -1.485461, 0, 1, 0.003921569, 1,
-0.4248306, 0.07585407, -3.379303, 0, 1, 0.01176471, 1,
-0.422147, -0.6051832, -2.600675, 0, 1, 0.01568628, 1,
-0.4197301, 0.5288983, -1.105469, 0, 1, 0.02352941, 1,
-0.4146431, -1.344696, -3.862246, 0, 1, 0.02745098, 1,
-0.4140465, 1.505313, 0.02330068, 0, 1, 0.03529412, 1,
-0.411144, 1.12264, -2.904274, 0, 1, 0.03921569, 1,
-0.40519, -0.4064255, -4.123555, 0, 1, 0.04705882, 1,
-0.4043259, -0.6036565, -3.321817, 0, 1, 0.05098039, 1,
-0.3975674, -1.294415, -1.731254, 0, 1, 0.05882353, 1,
-0.3931184, -0.2296136, -2.295102, 0, 1, 0.0627451, 1,
-0.3912183, -0.7894132, -4.285564, 0, 1, 0.07058824, 1,
-0.3905297, 1.499341, -0.01907703, 0, 1, 0.07450981, 1,
-0.3883238, 0.2827527, 0.09754445, 0, 1, 0.08235294, 1,
-0.3839658, -0.8054322, -2.148199, 0, 1, 0.08627451, 1,
-0.3833991, -2.327206, -3.075151, 0, 1, 0.09411765, 1,
-0.383351, -0.2458346, -2.52975, 0, 1, 0.1019608, 1,
-0.3830163, -2.372302, -1.816901, 0, 1, 0.1058824, 1,
-0.3804338, 0.5809822, -1.978477, 0, 1, 0.1137255, 1,
-0.379605, 1.141877, -0.7136779, 0, 1, 0.1176471, 1,
-0.379123, 0.5818747, 0.8959328, 0, 1, 0.1254902, 1,
-0.3772233, 0.02078265, -3.299873, 0, 1, 0.1294118, 1,
-0.3694836, 0.7385184, 1.577329, 0, 1, 0.1372549, 1,
-0.3679129, 0.9809668, 0.001963066, 0, 1, 0.1411765, 1,
-0.3662416, 0.4954159, -0.2905037, 0, 1, 0.1490196, 1,
-0.3640068, -0.2238, -1.459948, 0, 1, 0.1529412, 1,
-0.3607145, -1.158716, -3.099847, 0, 1, 0.1607843, 1,
-0.3537346, -0.355898, -3.538447, 0, 1, 0.1647059, 1,
-0.3501799, 1.802482, -0.5775188, 0, 1, 0.172549, 1,
-0.3449751, -1.114792, -3.799634, 0, 1, 0.1764706, 1,
-0.3438594, -0.2494442, -0.3771832, 0, 1, 0.1843137, 1,
-0.3429784, 0.9967465, 0.8262885, 0, 1, 0.1882353, 1,
-0.340798, -0.7199586, -2.219368, 0, 1, 0.1960784, 1,
-0.3402157, -0.4667057, -2.741137, 0, 1, 0.2039216, 1,
-0.3374158, -0.8460571, -1.70247, 0, 1, 0.2078431, 1,
-0.3319615, -0.5703282, -3.861633, 0, 1, 0.2156863, 1,
-0.3313927, 0.8735275, -0.4564774, 0, 1, 0.2196078, 1,
-0.3305495, -0.9524205, -1.80946, 0, 1, 0.227451, 1,
-0.3300194, 0.5709476, -0.758356, 0, 1, 0.2313726, 1,
-0.3298399, -0.5269524, -4.198278, 0, 1, 0.2392157, 1,
-0.3251013, -0.2991054, -2.90521, 0, 1, 0.2431373, 1,
-0.3221228, -0.09217718, -3.720994, 0, 1, 0.2509804, 1,
-0.3205345, -0.6133422, -1.92831, 0, 1, 0.254902, 1,
-0.3200403, 1.028831, -0.4655792, 0, 1, 0.2627451, 1,
-0.3098848, -0.2739949, -2.705924, 0, 1, 0.2666667, 1,
-0.3087866, 1.091981, 0.01402228, 0, 1, 0.2745098, 1,
-0.3046278, -0.2701453, -3.025988, 0, 1, 0.2784314, 1,
-0.3029964, 0.7896332, -1.922538, 0, 1, 0.2862745, 1,
-0.3015213, -0.8008343, -2.557271, 0, 1, 0.2901961, 1,
-0.2970861, -1.379216, -2.368886, 0, 1, 0.2980392, 1,
-0.2924868, 0.5032069, -0.5291284, 0, 1, 0.3058824, 1,
-0.2906208, 0.581601, -1.609908, 0, 1, 0.3098039, 1,
-0.2905133, -0.1628656, -2.37901, 0, 1, 0.3176471, 1,
-0.2896911, -0.6556332, -2.376529, 0, 1, 0.3215686, 1,
-0.2890187, -0.1540101, -2.223676, 0, 1, 0.3294118, 1,
-0.2884567, -1.634496, -1.488336, 0, 1, 0.3333333, 1,
-0.288014, 0.1019918, -1.627461, 0, 1, 0.3411765, 1,
-0.2840583, 0.1605884, -3.863664, 0, 1, 0.345098, 1,
-0.2829661, -0.6342698, -2.204177, 0, 1, 0.3529412, 1,
-0.2826749, -1.25179, -2.414191, 0, 1, 0.3568628, 1,
-0.2825275, -0.03062356, -0.1781309, 0, 1, 0.3647059, 1,
-0.2782125, -1.956801, -2.388644, 0, 1, 0.3686275, 1,
-0.2713251, 0.2056875, -0.4466296, 0, 1, 0.3764706, 1,
-0.2644629, 2.054887, -0.527095, 0, 1, 0.3803922, 1,
-0.2613617, 0.4545346, -0.3879491, 0, 1, 0.3882353, 1,
-0.2606802, 0.5266632, -1.471671, 0, 1, 0.3921569, 1,
-0.2562953, 0.02489894, -3.275264, 0, 1, 0.4, 1,
-0.2538024, -0.5986052, -1.943557, 0, 1, 0.4078431, 1,
-0.2531728, -0.4046168, -2.572522, 0, 1, 0.4117647, 1,
-0.2517644, -0.36439, -3.050663, 0, 1, 0.4196078, 1,
-0.2433446, -2.151283, -3.85567, 0, 1, 0.4235294, 1,
-0.2414033, -0.5541311, -2.775431, 0, 1, 0.4313726, 1,
-0.2398644, 0.5145285, -0.2238747, 0, 1, 0.4352941, 1,
-0.2375285, 0.5830356, -0.8721071, 0, 1, 0.4431373, 1,
-0.2329108, 0.2582541, -0.6949556, 0, 1, 0.4470588, 1,
-0.2326369, 0.1213202, -0.2178043, 0, 1, 0.454902, 1,
-0.2316719, -1.990438, -3.500322, 0, 1, 0.4588235, 1,
-0.2262386, 1.585418, 0.154588, 0, 1, 0.4666667, 1,
-0.2260507, 0.2348262, -1.758361, 0, 1, 0.4705882, 1,
-0.225515, 0.3049974, 0.77292, 0, 1, 0.4784314, 1,
-0.2252208, -0.06619591, -1.38094, 0, 1, 0.4823529, 1,
-0.2223754, 1.518757, -1.564394, 0, 1, 0.4901961, 1,
-0.220248, -2.259965, -2.566476, 0, 1, 0.4941176, 1,
-0.2196952, 2.099979, -1.476742, 0, 1, 0.5019608, 1,
-0.2196746, 0.5943682, 0.1210961, 0, 1, 0.509804, 1,
-0.2193506, 0.02329519, -2.157189, 0, 1, 0.5137255, 1,
-0.2151568, -0.6685233, -3.089934, 0, 1, 0.5215687, 1,
-0.2150959, -0.1088313, -1.38305, 0, 1, 0.5254902, 1,
-0.2146535, 1.008885, 0.3415904, 0, 1, 0.5333334, 1,
-0.2104517, -0.7846172, -4.092131, 0, 1, 0.5372549, 1,
-0.2060209, 1.219423, -0.5852506, 0, 1, 0.5450981, 1,
-0.2043157, -0.1601679, -3.045556, 0, 1, 0.5490196, 1,
-0.2039011, 1.131089, 0.8204999, 0, 1, 0.5568628, 1,
-0.2013476, -1.227206, -3.10097, 0, 1, 0.5607843, 1,
-0.1988182, 1.647295, -0.7371422, 0, 1, 0.5686275, 1,
-0.1968952, -0.7905294, -1.089351, 0, 1, 0.572549, 1,
-0.1927774, 0.9324887, 0.5921535, 0, 1, 0.5803922, 1,
-0.1914219, -0.2097661, -2.949486, 0, 1, 0.5843138, 1,
-0.191333, 0.5734578, -0.9807673, 0, 1, 0.5921569, 1,
-0.1879812, 0.2496294, -0.412992, 0, 1, 0.5960785, 1,
-0.1855626, 0.09866235, -0.5724561, 0, 1, 0.6039216, 1,
-0.1810974, 1.345017, -0.03596949, 0, 1, 0.6117647, 1,
-0.1801038, 0.03896981, -0.9081313, 0, 1, 0.6156863, 1,
-0.1775864, 0.2204198, -0.3830933, 0, 1, 0.6235294, 1,
-0.1766036, -0.7323846, -2.5047, 0, 1, 0.627451, 1,
-0.1672437, 0.3426811, -1.000687, 0, 1, 0.6352941, 1,
-0.1666251, 0.9932525, 0.5742991, 0, 1, 0.6392157, 1,
-0.1581545, 1.024707, -0.3415497, 0, 1, 0.6470588, 1,
-0.1560762, -0.3843389, -3.257906, 0, 1, 0.6509804, 1,
-0.155857, 0.9998739, 0.9224175, 0, 1, 0.6588235, 1,
-0.1558018, 0.3241081, -1.385929, 0, 1, 0.6627451, 1,
-0.1545356, 0.09352694, 0.1979608, 0, 1, 0.6705883, 1,
-0.154407, 0.650196, 0.1187687, 0, 1, 0.6745098, 1,
-0.1534063, -0.8949052, -2.347343, 0, 1, 0.682353, 1,
-0.1473457, 0.1979715, -1.062909, 0, 1, 0.6862745, 1,
-0.146186, -1.412039, -4.133304, 0, 1, 0.6941177, 1,
-0.1454285, 0.8118919, 0.3528368, 0, 1, 0.7019608, 1,
-0.1434572, 0.9920195, -1.574968, 0, 1, 0.7058824, 1,
-0.1392015, -0.03505435, -1.875465, 0, 1, 0.7137255, 1,
-0.1335677, 0.231819, -0.7594572, 0, 1, 0.7176471, 1,
-0.130024, -0.9088206, -2.765738, 0, 1, 0.7254902, 1,
-0.1268499, 1.978309, -0.03220022, 0, 1, 0.7294118, 1,
-0.1262201, -0.8187075, -2.498231, 0, 1, 0.7372549, 1,
-0.1255713, 0.1207184, -0.5791934, 0, 1, 0.7411765, 1,
-0.1112327, -0.2562016, -1.719938, 0, 1, 0.7490196, 1,
-0.1064319, -0.9896078, -3.029796, 0, 1, 0.7529412, 1,
-0.1048991, 0.5357291, -2.036686, 0, 1, 0.7607843, 1,
-0.09789404, -1.391, -3.360634, 0, 1, 0.7647059, 1,
-0.09173677, 0.8613685, 0.3307868, 0, 1, 0.772549, 1,
-0.09105349, -2.653333, -3.185721, 0, 1, 0.7764706, 1,
-0.09083278, -0.5769365, -2.164376, 0, 1, 0.7843137, 1,
-0.09030874, -0.2483963, -3.476249, 0, 1, 0.7882353, 1,
-0.08787242, 2.04535, 1.365609, 0, 1, 0.7960784, 1,
-0.08679431, -0.3609917, -4.759679, 0, 1, 0.8039216, 1,
-0.08561024, -0.8454438, -2.885154, 0, 1, 0.8078431, 1,
-0.08555381, 0.4805658, -1.023595, 0, 1, 0.8156863, 1,
-0.0822626, 0.2509064, -2.174708, 0, 1, 0.8196079, 1,
-0.08118434, -0.1468127, -2.208103, 0, 1, 0.827451, 1,
-0.07477221, -0.01851899, -1.329133, 0, 1, 0.8313726, 1,
-0.07444058, 1.138671, 2.41834, 0, 1, 0.8392157, 1,
-0.06574266, 1.703265, -1.381938, 0, 1, 0.8431373, 1,
-0.06537963, 0.6870096, 0.1133296, 0, 1, 0.8509804, 1,
-0.06167847, 1.370548, -0.0436268, 0, 1, 0.854902, 1,
-0.05811591, -0.4737714, -1.368214, 0, 1, 0.8627451, 1,
-0.05720703, 0.9006993, 1.223098, 0, 1, 0.8666667, 1,
-0.05522115, -0.3108165, -3.865022, 0, 1, 0.8745098, 1,
-0.05346897, 0.5543896, -0.3602598, 0, 1, 0.8784314, 1,
-0.04456808, -0.2936486, -3.455208, 0, 1, 0.8862745, 1,
-0.04454553, -1.104245, -3.193045, 0, 1, 0.8901961, 1,
-0.0387162, 1.682112, -0.2664121, 0, 1, 0.8980392, 1,
-0.03305412, -0.9053403, -3.460948, 0, 1, 0.9058824, 1,
-0.03052887, -1.293766, -3.462749, 0, 1, 0.9098039, 1,
-0.02872979, -0.4902093, -1.690434, 0, 1, 0.9176471, 1,
-0.02494576, 0.2203092, 0.09490814, 0, 1, 0.9215686, 1,
-0.02309777, 0.4460784, 1.146701, 0, 1, 0.9294118, 1,
-0.02055633, 0.4337998, 1.022044, 0, 1, 0.9333333, 1,
-0.01899794, -0.5318285, -3.038665, 0, 1, 0.9411765, 1,
-0.0172155, 1.259347, 1.734735, 0, 1, 0.945098, 1,
-0.01521845, 0.1323993, -0.7868345, 0, 1, 0.9529412, 1,
-0.01425331, -0.7932312, -3.42466, 0, 1, 0.9568627, 1,
-0.01051137, 0.5280247, -1.444938, 0, 1, 0.9647059, 1,
-0.004458821, 2.952481, 0.2247546, 0, 1, 0.9686275, 1,
-0.001481169, -1.62412, -2.410831, 0, 1, 0.9764706, 1,
0.0003284233, -1.602949, -0.2813642, 0, 1, 0.9803922, 1,
0.004508175, -0.262095, 1.977435, 0, 1, 0.9882353, 1,
0.004916899, -0.5416164, 4.347466, 0, 1, 0.9921569, 1,
0.005322041, 0.9418144, 0.201027, 0, 1, 1, 1,
0.006778587, -1.994329, 2.5542, 0, 0.9921569, 1, 1,
0.007211403, -0.9338651, 2.810601, 0, 0.9882353, 1, 1,
0.009606713, 1.393581, -1.771923, 0, 0.9803922, 1, 1,
0.01087067, -0.8292757, 3.47987, 0, 0.9764706, 1, 1,
0.01187537, -0.7264113, 2.548799, 0, 0.9686275, 1, 1,
0.01402728, -0.6318049, 3.186826, 0, 0.9647059, 1, 1,
0.0196821, -0.6831935, 2.21463, 0, 0.9568627, 1, 1,
0.02255381, -0.2588181, 3.767584, 0, 0.9529412, 1, 1,
0.02348225, 0.1542854, 0.04432075, 0, 0.945098, 1, 1,
0.02565314, -1.264554, 3.321384, 0, 0.9411765, 1, 1,
0.02919767, 1.600298, -1.934019, 0, 0.9333333, 1, 1,
0.03417689, 0.2419293, 0.09068757, 0, 0.9294118, 1, 1,
0.0352857, -2.560299, 3.706666, 0, 0.9215686, 1, 1,
0.03617797, 1.41052, 2.241878, 0, 0.9176471, 1, 1,
0.03622328, 0.08969798, 1.745268, 0, 0.9098039, 1, 1,
0.0382926, 1.118066, -0.9441644, 0, 0.9058824, 1, 1,
0.04173904, -0.5894758, 2.524056, 0, 0.8980392, 1, 1,
0.04484467, 2.050309, -0.5921425, 0, 0.8901961, 1, 1,
0.04932012, 0.4689936, -0.02111781, 0, 0.8862745, 1, 1,
0.0529271, -0.6258179, 4.370148, 0, 0.8784314, 1, 1,
0.05293326, -1.547085, 2.69211, 0, 0.8745098, 1, 1,
0.05614171, 1.435545, 0.8624127, 0, 0.8666667, 1, 1,
0.05852294, 0.4412919, -0.5808236, 0, 0.8627451, 1, 1,
0.06240878, -0.5619926, 1.221393, 0, 0.854902, 1, 1,
0.06495895, 0.8952214, -0.1308363, 0, 0.8509804, 1, 1,
0.06719755, 1.14236, -0.0446844, 0, 0.8431373, 1, 1,
0.06746965, 0.8521622, 0.7635812, 0, 0.8392157, 1, 1,
0.07075754, -2.624513, 3.35954, 0, 0.8313726, 1, 1,
0.07173193, 0.7092091, -0.02602869, 0, 0.827451, 1, 1,
0.07277773, 0.849808, -1.086946, 0, 0.8196079, 1, 1,
0.07483422, 0.212107, 2.737075, 0, 0.8156863, 1, 1,
0.07794968, -2.186096, 3.570193, 0, 0.8078431, 1, 1,
0.08387187, 0.2036458, 0.5237964, 0, 0.8039216, 1, 1,
0.08489463, -0.1658481, 2.655593, 0, 0.7960784, 1, 1,
0.08912759, 0.2217043, 1.907487, 0, 0.7882353, 1, 1,
0.09008289, 0.2573122, 0.01913328, 0, 0.7843137, 1, 1,
0.09010074, -0.2214464, 1.980894, 0, 0.7764706, 1, 1,
0.0903397, 0.09926147, 2.30976, 0, 0.772549, 1, 1,
0.09212226, 0.3601216, 0.8818316, 0, 0.7647059, 1, 1,
0.09312387, 0.9215025, 0.1780835, 0, 0.7607843, 1, 1,
0.09472365, 1.988054, 1.699804, 0, 0.7529412, 1, 1,
0.0966725, -0.5212202, 2.172415, 0, 0.7490196, 1, 1,
0.100015, -2.018091, 4.266922, 0, 0.7411765, 1, 1,
0.1021701, -1.350354, 3.537785, 0, 0.7372549, 1, 1,
0.1029559, -0.7952188, 2.664299, 0, 0.7294118, 1, 1,
0.1038401, -0.1343812, 2.942517, 0, 0.7254902, 1, 1,
0.1053011, -0.6669371, 3.319086, 0, 0.7176471, 1, 1,
0.1061877, -0.8731625, 2.724808, 0, 0.7137255, 1, 1,
0.1104465, 0.9077236, -0.3386538, 0, 0.7058824, 1, 1,
0.114253, -2.182816, 3.746017, 0, 0.6980392, 1, 1,
0.1151684, -0.8922039, 3.594425, 0, 0.6941177, 1, 1,
0.1156642, -1.814275, 0.9004053, 0, 0.6862745, 1, 1,
0.1174136, -1.064103, 3.224183, 0, 0.682353, 1, 1,
0.1221999, -0.07874297, 0.4788665, 0, 0.6745098, 1, 1,
0.1266393, 1.040112, 0.4814078, 0, 0.6705883, 1, 1,
0.1313196, -0.04357813, 3.273777, 0, 0.6627451, 1, 1,
0.1361959, -0.475265, 3.058454, 0, 0.6588235, 1, 1,
0.139316, -0.9340032, 3.14546, 0, 0.6509804, 1, 1,
0.1417021, -1.256526, 3.197693, 0, 0.6470588, 1, 1,
0.1431725, -0.6694207, 4.123414, 0, 0.6392157, 1, 1,
0.1436453, -0.6979786, 2.981165, 0, 0.6352941, 1, 1,
0.1444122, 0.001298673, 1.756359, 0, 0.627451, 1, 1,
0.144515, -0.486318, 1.95374, 0, 0.6235294, 1, 1,
0.145265, -0.4830458, 4.337082, 0, 0.6156863, 1, 1,
0.1459371, 1.904892, -0.4308948, 0, 0.6117647, 1, 1,
0.1460125, -0.3243541, 3.600265, 0, 0.6039216, 1, 1,
0.1482208, -0.6401897, 1.678928, 0, 0.5960785, 1, 1,
0.1525651, 0.4399695, -1.434263, 0, 0.5921569, 1, 1,
0.1548029, 0.9908231, 2.032037, 0, 0.5843138, 1, 1,
0.1560971, -0.5429828, 2.692164, 0, 0.5803922, 1, 1,
0.1579154, -0.2552139, 4.025436, 0, 0.572549, 1, 1,
0.1582871, 0.7499583, 0.5596406, 0, 0.5686275, 1, 1,
0.1588925, 0.07878826, 1.412978, 0, 0.5607843, 1, 1,
0.1683932, 1.462547, -0.03963847, 0, 0.5568628, 1, 1,
0.1687738, -1.007679, 3.768894, 0, 0.5490196, 1, 1,
0.1706954, -1.518387, 3.318867, 0, 0.5450981, 1, 1,
0.1801342, 0.4456101, 2.285853, 0, 0.5372549, 1, 1,
0.1839679, 0.6022344, 1.554114, 0, 0.5333334, 1, 1,
0.185075, -0.490463, 3.763052, 0, 0.5254902, 1, 1,
0.1895635, 0.6708184, -0.5827087, 0, 0.5215687, 1, 1,
0.191295, 1.021322, 1.041705, 0, 0.5137255, 1, 1,
0.1967743, -0.3101231, 1.944302, 0, 0.509804, 1, 1,
0.2044172, -0.7290863, 2.669565, 0, 0.5019608, 1, 1,
0.2080276, 0.4183255, -0.03628023, 0, 0.4941176, 1, 1,
0.208526, 0.3102284, 0.8092481, 0, 0.4901961, 1, 1,
0.2089361, -0.007710139, 3.349658, 0, 0.4823529, 1, 1,
0.2179047, -1.178525, 1.842002, 0, 0.4784314, 1, 1,
0.2210998, 0.3823718, 1.049333, 0, 0.4705882, 1, 1,
0.2286732, 1.495894, 1.062301, 0, 0.4666667, 1, 1,
0.230104, -0.3179637, 1.580395, 0, 0.4588235, 1, 1,
0.2332447, 0.7416464, -0.3572842, 0, 0.454902, 1, 1,
0.2362056, -0.6649764, 2.548799, 0, 0.4470588, 1, 1,
0.2387193, -0.6123735, 3.684237, 0, 0.4431373, 1, 1,
0.2393016, 0.9124637, 0.3349032, 0, 0.4352941, 1, 1,
0.2407967, -1.48659, 3.546739, 0, 0.4313726, 1, 1,
0.2447757, 0.908848, -0.8857063, 0, 0.4235294, 1, 1,
0.249883, 1.058643, -0.6697564, 0, 0.4196078, 1, 1,
0.2530541, -0.7671404, 4.198606, 0, 0.4117647, 1, 1,
0.257512, -1.246544, 3.369838, 0, 0.4078431, 1, 1,
0.2603404, -0.3271957, 1.701656, 0, 0.4, 1, 1,
0.2603664, -1.231533, 1.575488, 0, 0.3921569, 1, 1,
0.262123, -0.6201594, 0.4483513, 0, 0.3882353, 1, 1,
0.2629575, 0.3454506, 0.6173635, 0, 0.3803922, 1, 1,
0.2664565, 0.8453038, -0.7262865, 0, 0.3764706, 1, 1,
0.2698636, 0.1706273, 1.409992, 0, 0.3686275, 1, 1,
0.2709854, -0.204583, 2.022501, 0, 0.3647059, 1, 1,
0.2737296, 1.632636, -1.211671, 0, 0.3568628, 1, 1,
0.2771909, -0.817192, 3.25688, 0, 0.3529412, 1, 1,
0.282053, 0.9690722, 0.6160262, 0, 0.345098, 1, 1,
0.2841002, 0.3062495, 0.2650077, 0, 0.3411765, 1, 1,
0.2883949, -1.5534, 2.004919, 0, 0.3333333, 1, 1,
0.2887433, 0.2257238, 2.313514, 0, 0.3294118, 1, 1,
0.2990073, 0.4591301, 1.746203, 0, 0.3215686, 1, 1,
0.3024268, -1.190881, 4.185507, 0, 0.3176471, 1, 1,
0.3053516, -1.726277, 1.998351, 0, 0.3098039, 1, 1,
0.3086918, -0.1161176, 0.8610129, 0, 0.3058824, 1, 1,
0.3119617, 0.1444549, 0.5503589, 0, 0.2980392, 1, 1,
0.3127, -1.538706, 2.977959, 0, 0.2901961, 1, 1,
0.3133922, 0.3537931, -1.29355, 0, 0.2862745, 1, 1,
0.3165787, 1.082368, -1.401361, 0, 0.2784314, 1, 1,
0.3236027, -1.981072, 3.026926, 0, 0.2745098, 1, 1,
0.3241129, -0.6297016, 1.823253, 0, 0.2666667, 1, 1,
0.3241698, -0.8219514, 3.562095, 0, 0.2627451, 1, 1,
0.3266282, 0.4628556, -0.2840446, 0, 0.254902, 1, 1,
0.3272294, 1.05746, -0.07638587, 0, 0.2509804, 1, 1,
0.3318721, 2.020454, -0.07777411, 0, 0.2431373, 1, 1,
0.3333603, 0.106351, 1.200341, 0, 0.2392157, 1, 1,
0.3354526, 0.6807892, -0.681939, 0, 0.2313726, 1, 1,
0.3493744, 0.3749921, 0.802358, 0, 0.227451, 1, 1,
0.3502461, 0.8342559, 2.233714, 0, 0.2196078, 1, 1,
0.3514224, 0.8448684, 0.3229832, 0, 0.2156863, 1, 1,
0.3588722, -1.393246, 3.353694, 0, 0.2078431, 1, 1,
0.3599359, -0.1527833, 3.069449, 0, 0.2039216, 1, 1,
0.3662542, 1.493467, 0.5854371, 0, 0.1960784, 1, 1,
0.3677721, -0.8898801, 1.998479, 0, 0.1882353, 1, 1,
0.3693772, 1.36407, 0.07083387, 0, 0.1843137, 1, 1,
0.3727318, 0.5847479, 0.337216, 0, 0.1764706, 1, 1,
0.3743477, -0.6633325, 1.68451, 0, 0.172549, 1, 1,
0.3762552, -1.134849, 2.663089, 0, 0.1647059, 1, 1,
0.3770203, -0.5595934, 2.359498, 0, 0.1607843, 1, 1,
0.3776004, -0.1412443, 2.427204, 0, 0.1529412, 1, 1,
0.3816267, -0.6891312, 2.06683, 0, 0.1490196, 1, 1,
0.391245, -0.638546, 3.463025, 0, 0.1411765, 1, 1,
0.3925952, 0.6487539, 0.4193691, 0, 0.1372549, 1, 1,
0.4006771, -0.3611107, 3.446868, 0, 0.1294118, 1, 1,
0.404368, -1.86857, 3.243958, 0, 0.1254902, 1, 1,
0.4114086, -0.1039116, 1.963164, 0, 0.1176471, 1, 1,
0.4165557, 0.9337335, 0.7916144, 0, 0.1137255, 1, 1,
0.4168453, 0.7762048, 1.767766, 0, 0.1058824, 1, 1,
0.4174244, 0.9113402, 0.8984651, 0, 0.09803922, 1, 1,
0.4198495, -1.106602, 2.096944, 0, 0.09411765, 1, 1,
0.4227876, -0.08959266, 1.044224, 0, 0.08627451, 1, 1,
0.4258601, 1.129066, 0.6673377, 0, 0.08235294, 1, 1,
0.4264706, -0.6935066, 1.904222, 0, 0.07450981, 1, 1,
0.4265434, -0.8274538, 3.246624, 0, 0.07058824, 1, 1,
0.4346517, -0.1690805, 1.152573, 0, 0.0627451, 1, 1,
0.4457971, -1.182974, 2.889705, 0, 0.05882353, 1, 1,
0.4556229, -0.8814114, 2.752127, 0, 0.05098039, 1, 1,
0.4573574, -0.01506214, 1.470922, 0, 0.04705882, 1, 1,
0.4583962, 0.5906581, 0.4270799, 0, 0.03921569, 1, 1,
0.4596436, -0.8691127, 2.76966, 0, 0.03529412, 1, 1,
0.4609722, 0.2381201, -0.3585427, 0, 0.02745098, 1, 1,
0.4630308, 2.125141, 0.7372837, 0, 0.02352941, 1, 1,
0.4726375, 0.4824085, 0.6756228, 0, 0.01568628, 1, 1,
0.4750069, 0.9101089, 0.3529633, 0, 0.01176471, 1, 1,
0.4799571, 0.5004168, 1.44054, 0, 0.003921569, 1, 1,
0.4807434, -0.3613916, 3.254339, 0.003921569, 0, 1, 1,
0.4826767, -0.2862063, 2.006933, 0.007843138, 0, 1, 1,
0.4832071, -2.08227, 2.757209, 0.01568628, 0, 1, 1,
0.4843323, 0.5690192, 2.791569, 0.01960784, 0, 1, 1,
0.4918336, -1.007213, 1.372554, 0.02745098, 0, 1, 1,
0.5039302, 0.2668685, 0.5629665, 0.03137255, 0, 1, 1,
0.5056021, -0.7801845, 3.472525, 0.03921569, 0, 1, 1,
0.5060375, 0.1613539, 2.031615, 0.04313726, 0, 1, 1,
0.5126274, 2.15406, -0.7923369, 0.05098039, 0, 1, 1,
0.5141349, -1.854523, 2.659204, 0.05490196, 0, 1, 1,
0.5149045, 0.1870648, 1.613089, 0.0627451, 0, 1, 1,
0.5151166, -0.9968442, 2.906032, 0.06666667, 0, 1, 1,
0.5155184, -1.127015, 1.890017, 0.07450981, 0, 1, 1,
0.5213392, 0.7906343, 0.7844935, 0.07843138, 0, 1, 1,
0.5234545, 1.568842, -1.783918, 0.08627451, 0, 1, 1,
0.5327938, 1.237713, -0.1801266, 0.09019608, 0, 1, 1,
0.5340315, 0.8535401, 1.596339, 0.09803922, 0, 1, 1,
0.5343047, 0.8309789, 1.477793, 0.1058824, 0, 1, 1,
0.5367944, -0.7492724, 2.361253, 0.1098039, 0, 1, 1,
0.5381797, 1.222387, 2.028292, 0.1176471, 0, 1, 1,
0.5444754, 0.6406402, 1.782423, 0.1215686, 0, 1, 1,
0.5452508, 0.7865799, 1.311799, 0.1294118, 0, 1, 1,
0.547381, 0.2453827, 1.707853, 0.1333333, 0, 1, 1,
0.5483522, -1.043694, 2.926086, 0.1411765, 0, 1, 1,
0.5557924, -0.8049538, 2.826739, 0.145098, 0, 1, 1,
0.5588247, 0.6612482, 0.764452, 0.1529412, 0, 1, 1,
0.5614346, -0.4869385, 2.755444, 0.1568628, 0, 1, 1,
0.5617219, 0.3151837, 0.4894208, 0.1647059, 0, 1, 1,
0.5684689, 0.7350264, 1.598936, 0.1686275, 0, 1, 1,
0.5699147, 1.27721, 2.039267, 0.1764706, 0, 1, 1,
0.5730632, -0.3735696, 0.7587879, 0.1803922, 0, 1, 1,
0.5735359, -1.052759, 4.082718, 0.1882353, 0, 1, 1,
0.5813779, -1.322093, 2.743221, 0.1921569, 0, 1, 1,
0.5853472, 0.6442019, 0.04509161, 0.2, 0, 1, 1,
0.585474, -1.081921, 2.302757, 0.2078431, 0, 1, 1,
0.5855734, -0.8560538, 3.051857, 0.2117647, 0, 1, 1,
0.5874739, 0.4554695, 1.091597, 0.2196078, 0, 1, 1,
0.5906281, 0.2800339, -0.3394903, 0.2235294, 0, 1, 1,
0.593631, 0.8708424, 1.41959, 0.2313726, 0, 1, 1,
0.5958177, 1.255035, 1.103927, 0.2352941, 0, 1, 1,
0.5988324, -0.08796586, 2.072827, 0.2431373, 0, 1, 1,
0.6012945, 2.07513, 0.02967912, 0.2470588, 0, 1, 1,
0.6054228, 0.4534233, 0.0537043, 0.254902, 0, 1, 1,
0.6061814, -2.003356, 3.791583, 0.2588235, 0, 1, 1,
0.6066868, -0.06404322, 2.156775, 0.2666667, 0, 1, 1,
0.6087918, 0.6627123, 0.7624486, 0.2705882, 0, 1, 1,
0.6106784, 0.1791515, 2.478393, 0.2784314, 0, 1, 1,
0.6135188, 1.085171, -0.8221515, 0.282353, 0, 1, 1,
0.6152241, -0.1696138, 0.653978, 0.2901961, 0, 1, 1,
0.6170262, -0.07731064, 1.481039, 0.2941177, 0, 1, 1,
0.6198328, -0.2181364, 1.015668, 0.3019608, 0, 1, 1,
0.6236256, 0.7047265, 0.7985119, 0.3098039, 0, 1, 1,
0.6239095, -1.186955, 2.420048, 0.3137255, 0, 1, 1,
0.6300827, 0.3953207, 1.385731, 0.3215686, 0, 1, 1,
0.6331788, 1.173488, 0.2692371, 0.3254902, 0, 1, 1,
0.6341928, 0.9704667, -0.9720872, 0.3333333, 0, 1, 1,
0.6351634, -0.4189475, 4.238102, 0.3372549, 0, 1, 1,
0.6364868, 0.01148937, 0.9210893, 0.345098, 0, 1, 1,
0.6405874, -0.5729203, 3.80535, 0.3490196, 0, 1, 1,
0.6445711, -1.329929, 3.368736, 0.3568628, 0, 1, 1,
0.6471214, 0.4421748, 1.799117, 0.3607843, 0, 1, 1,
0.653493, 0.08337904, 2.754454, 0.3686275, 0, 1, 1,
0.6557104, -0.596128, 3.837145, 0.372549, 0, 1, 1,
0.6559322, -0.5817475, 4.211695, 0.3803922, 0, 1, 1,
0.6583106, 0.4823049, 0.472088, 0.3843137, 0, 1, 1,
0.6590602, 0.4749777, 1.243224, 0.3921569, 0, 1, 1,
0.6645337, -1.622437, 4.211046, 0.3960784, 0, 1, 1,
0.6650491, 0.6318868, 1.92286, 0.4039216, 0, 1, 1,
0.6666883, -0.416976, 2.940057, 0.4117647, 0, 1, 1,
0.6811749, -0.1198684, 1.572813, 0.4156863, 0, 1, 1,
0.6812858, -0.3607556, 2.156708, 0.4235294, 0, 1, 1,
0.6849054, -0.3480866, 0.7566788, 0.427451, 0, 1, 1,
0.6860985, 1.27417, 0.5534908, 0.4352941, 0, 1, 1,
0.689672, -1.646871, 2.164941, 0.4392157, 0, 1, 1,
0.6925375, -2.026743, 3.660263, 0.4470588, 0, 1, 1,
0.6971472, -0.8223238, 1.783559, 0.4509804, 0, 1, 1,
0.6980949, 1.076648, -0.2628082, 0.4588235, 0, 1, 1,
0.6983942, 0.9504089, 1.511071, 0.4627451, 0, 1, 1,
0.7006097, -0.6487324, 1.713519, 0.4705882, 0, 1, 1,
0.7023931, 1.723541, -0.8756602, 0.4745098, 0, 1, 1,
0.7033949, -0.1808877, 1.849831, 0.4823529, 0, 1, 1,
0.7042444, 0.5758191, 0.8995866, 0.4862745, 0, 1, 1,
0.7058153, 1.618424, 2.575755, 0.4941176, 0, 1, 1,
0.7069215, -0.5513251, 2.292663, 0.5019608, 0, 1, 1,
0.7070336, -0.9620211, 2.699548, 0.5058824, 0, 1, 1,
0.7101979, -1.609943, 2.401849, 0.5137255, 0, 1, 1,
0.7137659, 0.1353237, -0.3034557, 0.5176471, 0, 1, 1,
0.7192494, -1.59613, 3.037485, 0.5254902, 0, 1, 1,
0.7208962, 1.309516, 1.419782, 0.5294118, 0, 1, 1,
0.7363859, 0.460993, -0.6573832, 0.5372549, 0, 1, 1,
0.7421212, -0.3705178, 1.624833, 0.5411765, 0, 1, 1,
0.7433679, -0.07351422, 1.767732, 0.5490196, 0, 1, 1,
0.7449898, -0.4706514, 2.140605, 0.5529412, 0, 1, 1,
0.7460862, 0.1206259, 1.209935, 0.5607843, 0, 1, 1,
0.7503552, 1.74115, 1.004654, 0.5647059, 0, 1, 1,
0.7529762, 1.185375, -0.7797479, 0.572549, 0, 1, 1,
0.7536954, 0.9739692, 0.1334758, 0.5764706, 0, 1, 1,
0.7573802, -1.423693, 3.120054, 0.5843138, 0, 1, 1,
0.7587324, -0.1325985, 1.81127, 0.5882353, 0, 1, 1,
0.7608291, -0.2934528, 2.133798, 0.5960785, 0, 1, 1,
0.7622065, -0.1225846, 2.362666, 0.6039216, 0, 1, 1,
0.7626684, 0.833836, -0.2042659, 0.6078432, 0, 1, 1,
0.7628969, -1.744776, 3.279383, 0.6156863, 0, 1, 1,
0.7648023, 0.1884755, 2.25091, 0.6196079, 0, 1, 1,
0.7675931, 1.328521, 0.04883864, 0.627451, 0, 1, 1,
0.7719437, 0.2801517, 2.482104, 0.6313726, 0, 1, 1,
0.7769721, -1.028057, 2.026372, 0.6392157, 0, 1, 1,
0.7772299, 0.7617458, -0.6183475, 0.6431373, 0, 1, 1,
0.780198, 1.871032, 0.4567207, 0.6509804, 0, 1, 1,
0.7810572, -0.5800952, 1.257938, 0.654902, 0, 1, 1,
0.7875111, -1.264052, 3.26054, 0.6627451, 0, 1, 1,
0.7960182, -1.530595, 2.776515, 0.6666667, 0, 1, 1,
0.7980776, 0.769743, -0.4972333, 0.6745098, 0, 1, 1,
0.7989128, -1.534213, 5.487547, 0.6784314, 0, 1, 1,
0.8014866, -1.635249, 2.164529, 0.6862745, 0, 1, 1,
0.8050621, 0.2832854, -0.02013429, 0.6901961, 0, 1, 1,
0.8079872, 0.7429652, 0.7045519, 0.6980392, 0, 1, 1,
0.8094056, -0.7009369, 2.329544, 0.7058824, 0, 1, 1,
0.8108746, -2.567749, 2.323891, 0.7098039, 0, 1, 1,
0.8124887, 1.659598, -1.381118, 0.7176471, 0, 1, 1,
0.817424, -0.1760596, 2.911069, 0.7215686, 0, 1, 1,
0.8231637, 0.5650143, 2.0991, 0.7294118, 0, 1, 1,
0.825007, -1.103525, 1.71158, 0.7333333, 0, 1, 1,
0.826548, 0.8343517, 2.218618, 0.7411765, 0, 1, 1,
0.8298371, 0.2985206, 0.7149277, 0.7450981, 0, 1, 1,
0.8335634, 0.9415532, 2.764313, 0.7529412, 0, 1, 1,
0.8349652, 0.541168, 3.869038, 0.7568628, 0, 1, 1,
0.8377712, 1.760895, 0.1223643, 0.7647059, 0, 1, 1,
0.8378969, 0.943337, 1.020864, 0.7686275, 0, 1, 1,
0.8382277, 3.0302, 0.1501903, 0.7764706, 0, 1, 1,
0.8394124, -0.2506781, 1.660538, 0.7803922, 0, 1, 1,
0.8434196, -1.329006, 3.346809, 0.7882353, 0, 1, 1,
0.8439913, -0.7209214, -0.02212225, 0.7921569, 0, 1, 1,
0.8447928, -0.4475239, 2.604995, 0.8, 0, 1, 1,
0.8448249, 0.4761188, 1.263439, 0.8078431, 0, 1, 1,
0.8512032, 0.6445845, 0.9796788, 0.8117647, 0, 1, 1,
0.8531607, 0.1173338, 0.4486732, 0.8196079, 0, 1, 1,
0.8538541, 1.49799, 0.388362, 0.8235294, 0, 1, 1,
0.8542522, 0.707656, 0.9791653, 0.8313726, 0, 1, 1,
0.8558397, -0.01037095, 2.257124, 0.8352941, 0, 1, 1,
0.8561431, -1.390648, 4.738805, 0.8431373, 0, 1, 1,
0.8618701, -2.212224, 2.919484, 0.8470588, 0, 1, 1,
0.8623155, 0.3105468, 1.271773, 0.854902, 0, 1, 1,
0.8649238, -0.8184122, 1.18146, 0.8588235, 0, 1, 1,
0.8683032, 1.012192, -0.4934603, 0.8666667, 0, 1, 1,
0.875772, -0.624792, 1.914553, 0.8705882, 0, 1, 1,
0.8763882, -0.2823133, 1.146054, 0.8784314, 0, 1, 1,
0.8857203, 0.2904268, 0.5124571, 0.8823529, 0, 1, 1,
0.8951019, 1.769012, 0.1467543, 0.8901961, 0, 1, 1,
0.8968009, -0.4212735, 4.169717, 0.8941177, 0, 1, 1,
0.9039748, -0.1406992, 2.191884, 0.9019608, 0, 1, 1,
0.9059466, 1.123217, 1.892185, 0.9098039, 0, 1, 1,
0.9126285, -0.1543842, 3.288867, 0.9137255, 0, 1, 1,
0.913382, 0.5928481, 1.412381, 0.9215686, 0, 1, 1,
0.9214039, -0.5330405, 0.4109168, 0.9254902, 0, 1, 1,
0.9224172, 0.7835658, 1.003771, 0.9333333, 0, 1, 1,
0.9282961, -0.6079062, 3.002908, 0.9372549, 0, 1, 1,
0.9294711, 0.4396217, 1.260982, 0.945098, 0, 1, 1,
0.9357966, -0.5637204, 2.669803, 0.9490196, 0, 1, 1,
0.9439699, -0.1623837, 2.554071, 0.9568627, 0, 1, 1,
0.9481445, 2.289717, -1.356608, 0.9607843, 0, 1, 1,
0.9512229, 0.8465222, 1.672646, 0.9686275, 0, 1, 1,
0.9559891, -0.1727307, 1.117699, 0.972549, 0, 1, 1,
0.9567138, 0.004589065, -0.5793735, 0.9803922, 0, 1, 1,
0.9580008, 0.2135863, 0.7575457, 0.9843137, 0, 1, 1,
0.9630791, 1.222047, 0.2630742, 0.9921569, 0, 1, 1,
0.9686881, 0.8132798, -0.4250356, 0.9960784, 0, 1, 1,
0.9733425, 0.1633731, -0.3271325, 1, 0, 0.9960784, 1,
0.9752162, 0.4306174, 1.771133, 1, 0, 0.9882353, 1,
0.9838809, -0.09383353, 2.57933, 1, 0, 0.9843137, 1,
0.9840974, -0.7394962, 2.516492, 1, 0, 0.9764706, 1,
0.9850718, 0.07646369, 2.9639, 1, 0, 0.972549, 1,
0.9917637, -0.4842505, -0.4491881, 1, 0, 0.9647059, 1,
0.9951882, 0.9175987, -0.342336, 1, 0, 0.9607843, 1,
0.9956571, -0.7325149, 1.624493, 1, 0, 0.9529412, 1,
1.001058, 0.0549982, 1.029698, 1, 0, 0.9490196, 1,
1.00598, -1.376112, 1.331857, 1, 0, 0.9411765, 1,
1.006952, -1.676429, 2.200444, 1, 0, 0.9372549, 1,
1.018872, 0.7355567, 1.500788, 1, 0, 0.9294118, 1,
1.019993, 0.4360794, 0.4940494, 1, 0, 0.9254902, 1,
1.020271, -0.3420261, 2.143583, 1, 0, 0.9176471, 1,
1.026513, -0.3523715, 2.19943, 1, 0, 0.9137255, 1,
1.027075, -0.8183286, 0.9451184, 1, 0, 0.9058824, 1,
1.033972, 1.839514, 0.3787135, 1, 0, 0.9019608, 1,
1.037553, 0.2804658, 0.8579156, 1, 0, 0.8941177, 1,
1.043374, -0.09874413, 0.4089855, 1, 0, 0.8862745, 1,
1.05878, -0.5196539, 1.423896, 1, 0, 0.8823529, 1,
1.067542, 0.7837776, 1.375262, 1, 0, 0.8745098, 1,
1.072886, 1.395645, 0.5552403, 1, 0, 0.8705882, 1,
1.077005, 0.1771358, 2.324482, 1, 0, 0.8627451, 1,
1.083663, -1.259094, 4.501424, 1, 0, 0.8588235, 1,
1.088413, -1.057625, 1.017965, 1, 0, 0.8509804, 1,
1.092933, -0.5589523, 1.905036, 1, 0, 0.8470588, 1,
1.092945, -0.9257878, 2.771519, 1, 0, 0.8392157, 1,
1.093685, 1.384124, 1.370011, 1, 0, 0.8352941, 1,
1.105766, -0.1928913, 1.876382, 1, 0, 0.827451, 1,
1.105894, -1.262077, 2.259091, 1, 0, 0.8235294, 1,
1.109283, 0.5356538, 1.842523, 1, 0, 0.8156863, 1,
1.114069, 1.14981, 0.5494711, 1, 0, 0.8117647, 1,
1.116848, 0.4101705, 2.016976, 1, 0, 0.8039216, 1,
1.122181, 0.4461247, 0.6397597, 1, 0, 0.7960784, 1,
1.123439, -0.05215452, 0.01779639, 1, 0, 0.7921569, 1,
1.125112, 1.861049, 1.385981, 1, 0, 0.7843137, 1,
1.13061, -0.3926658, 1.047135, 1, 0, 0.7803922, 1,
1.133229, 1.538003, 2.378456, 1, 0, 0.772549, 1,
1.133521, -0.1949188, 2.813823, 1, 0, 0.7686275, 1,
1.143842, -1.188676, 4.49992, 1, 0, 0.7607843, 1,
1.158413, 1.327242, -0.531239, 1, 0, 0.7568628, 1,
1.160753, 2.168363, 0.8234776, 1, 0, 0.7490196, 1,
1.172027, 1.903923, -1.949352, 1, 0, 0.7450981, 1,
1.178345, 0.1950871, 1.107518, 1, 0, 0.7372549, 1,
1.178974, -0.6162166, 3.543477, 1, 0, 0.7333333, 1,
1.181005, 0.9538475, 0.4348687, 1, 0, 0.7254902, 1,
1.181055, 0.2829869, 0.8355842, 1, 0, 0.7215686, 1,
1.181828, 0.354335, 1.69418, 1, 0, 0.7137255, 1,
1.183815, -1.549322, 1.33186, 1, 0, 0.7098039, 1,
1.186235, 0.02185841, 1.179708, 1, 0, 0.7019608, 1,
1.186708, -1.607655, 1.602475, 1, 0, 0.6941177, 1,
1.186966, 0.2245685, 0.4193829, 1, 0, 0.6901961, 1,
1.190875, 0.8649578, 2.1157, 1, 0, 0.682353, 1,
1.192253, -0.05276069, -0.7700383, 1, 0, 0.6784314, 1,
1.195904, 0.03554433, 2.585786, 1, 0, 0.6705883, 1,
1.197837, -1.592859, 5.186027, 1, 0, 0.6666667, 1,
1.198933, -0.9181463, 1.877419, 1, 0, 0.6588235, 1,
1.202101, 0.4512436, 1.125605, 1, 0, 0.654902, 1,
1.221407, 0.5205837, 0.07354711, 1, 0, 0.6470588, 1,
1.222782, 1.292066, -0.2748373, 1, 0, 0.6431373, 1,
1.223167, -0.5198201, 1.601303, 1, 0, 0.6352941, 1,
1.223739, -0.7827951, 1.763707, 1, 0, 0.6313726, 1,
1.226483, -0.5070795, 2.503074, 1, 0, 0.6235294, 1,
1.234994, -1.123108, 3.051579, 1, 0, 0.6196079, 1,
1.235685, -0.1310128, 3.358194, 1, 0, 0.6117647, 1,
1.238592, -0.5351222, 2.547564, 1, 0, 0.6078432, 1,
1.240253, -0.5003471, 3.466236, 1, 0, 0.6, 1,
1.247053, -1.093491, 1.939196, 1, 0, 0.5921569, 1,
1.249978, 0.8314369, 1.342925, 1, 0, 0.5882353, 1,
1.26045, -1.728854, 3.547172, 1, 0, 0.5803922, 1,
1.265467, -0.5414876, 3.550501, 1, 0, 0.5764706, 1,
1.268805, -0.5052901, 2.354044, 1, 0, 0.5686275, 1,
1.27272, 0.5399143, 1.681474, 1, 0, 0.5647059, 1,
1.275586, -2.291513, 3.734843, 1, 0, 0.5568628, 1,
1.28353, 0.2375856, 2.146158, 1, 0, 0.5529412, 1,
1.283639, -0.3375492, 1.626674, 1, 0, 0.5450981, 1,
1.299752, -1.284206, 2.350159, 1, 0, 0.5411765, 1,
1.30284, 0.4196312, 2.709619, 1, 0, 0.5333334, 1,
1.311378, 1.18689, 0.9444906, 1, 0, 0.5294118, 1,
1.313995, -0.4226145, 1.221051, 1, 0, 0.5215687, 1,
1.31595, -0.624885, 2.891613, 1, 0, 0.5176471, 1,
1.318778, 0.1403564, 2.609309, 1, 0, 0.509804, 1,
1.321185, 0.09832249, 0.7357785, 1, 0, 0.5058824, 1,
1.323685, 0.2727862, 2.065558, 1, 0, 0.4980392, 1,
1.323799, 0.7914581, 0.1793512, 1, 0, 0.4901961, 1,
1.324261, -1.695932, 2.555936, 1, 0, 0.4862745, 1,
1.333175, 0.7510738, 0.8967552, 1, 0, 0.4784314, 1,
1.384294, -0.4316863, 3.57857, 1, 0, 0.4745098, 1,
1.390818, -1.269246, 1.80144, 1, 0, 0.4666667, 1,
1.398652, -1.065982, 2.869252, 1, 0, 0.4627451, 1,
1.401275, -0.1828073, 0.2079344, 1, 0, 0.454902, 1,
1.406236, -0.1393991, 0.4943253, 1, 0, 0.4509804, 1,
1.41618, -1.202223, 1.701498, 1, 0, 0.4431373, 1,
1.423543, -0.3060458, 2.575628, 1, 0, 0.4392157, 1,
1.429542, 0.1008891, 1.172953, 1, 0, 0.4313726, 1,
1.434581, 1.049196, 0.717485, 1, 0, 0.427451, 1,
1.440071, 0.8046122, -0.02855541, 1, 0, 0.4196078, 1,
1.4778, 0.7880085, -0.2635473, 1, 0, 0.4156863, 1,
1.498256, 1.495993, 2.243311, 1, 0, 0.4078431, 1,
1.499278, -1.16945, 2.01207, 1, 0, 0.4039216, 1,
1.499368, 0.090634, 2.116489, 1, 0, 0.3960784, 1,
1.50219, -1.803065, 3.346798, 1, 0, 0.3882353, 1,
1.503974, 1.125633, 0.210316, 1, 0, 0.3843137, 1,
1.507555, -0.5826803, 1.300508, 1, 0, 0.3764706, 1,
1.51098, -0.4523095, 2.960574, 1, 0, 0.372549, 1,
1.512365, -0.7126374, 0.8779973, 1, 0, 0.3647059, 1,
1.552367, -1.672669, 2.455356, 1, 0, 0.3607843, 1,
1.578566, 1.384795, 2.327029, 1, 0, 0.3529412, 1,
1.582651, 0.08099754, 1.313675, 1, 0, 0.3490196, 1,
1.586324, 0.5540255, 0.8823161, 1, 0, 0.3411765, 1,
1.593969, -0.1757078, 2.439047, 1, 0, 0.3372549, 1,
1.597365, 1.649572, 0.7190425, 1, 0, 0.3294118, 1,
1.599239, -0.1541546, 3.181118, 1, 0, 0.3254902, 1,
1.603097, 0.4991199, -0.0710328, 1, 0, 0.3176471, 1,
1.603664, -1.050702, 2.812833, 1, 0, 0.3137255, 1,
1.62419, 1.212129, 0.9854497, 1, 0, 0.3058824, 1,
1.633156, 0.9854268, -0.440977, 1, 0, 0.2980392, 1,
1.649317, 0.6565954, -0.04279187, 1, 0, 0.2941177, 1,
1.661132, 0.8038831, 1.985236, 1, 0, 0.2862745, 1,
1.669447, -0.01123344, 2.590539, 1, 0, 0.282353, 1,
1.686209, -1.471677, 2.644665, 1, 0, 0.2745098, 1,
1.687983, -0.7767152, 2.195228, 1, 0, 0.2705882, 1,
1.699434, 0.5456611, -0.3118308, 1, 0, 0.2627451, 1,
1.709309, -1.005969, 0.3626643, 1, 0, 0.2588235, 1,
1.712625, -0.3982523, 3.155268, 1, 0, 0.2509804, 1,
1.751574, -0.2161118, 3.162995, 1, 0, 0.2470588, 1,
1.78064, -1.187669, 3.927486, 1, 0, 0.2392157, 1,
1.798529, -1.312846, 0.7812194, 1, 0, 0.2352941, 1,
1.809678, -2.232361, 3.197616, 1, 0, 0.227451, 1,
1.810604, -1.042706, 2.332054, 1, 0, 0.2235294, 1,
1.810769, 1.830046, 0.2106438, 1, 0, 0.2156863, 1,
1.827658, 1.726389, 1.128685, 1, 0, 0.2117647, 1,
1.829562, 0.4696276, 2.435888, 1, 0, 0.2039216, 1,
1.83246, 0.2331948, 3.368949, 1, 0, 0.1960784, 1,
1.832525, -0.9647822, 2.036285, 1, 0, 0.1921569, 1,
1.833474, 0.6571187, 0.5246667, 1, 0, 0.1843137, 1,
1.846229, 2.741355, 0.607313, 1, 0, 0.1803922, 1,
1.847017, -0.3450901, 1.207942, 1, 0, 0.172549, 1,
1.865471, -1.086651, 2.568757, 1, 0, 0.1686275, 1,
1.90813, -1.1694, 3.086937, 1, 0, 0.1607843, 1,
1.985987, -1.148122, 2.640805, 1, 0, 0.1568628, 1,
2.004691, 0.5933267, 1.473837, 1, 0, 0.1490196, 1,
2.016048, -0.5899196, 1.763589, 1, 0, 0.145098, 1,
2.025245, -0.8201841, 2.681834, 1, 0, 0.1372549, 1,
2.02967, 0.4687721, -0.9103707, 1, 0, 0.1333333, 1,
2.043272, 1.214673, 2.164481, 1, 0, 0.1254902, 1,
2.056716, -0.07890069, 0.9273227, 1, 0, 0.1215686, 1,
2.063127, 0.1663808, 1.884573, 1, 0, 0.1137255, 1,
2.085191, 0.2003692, 0.4823886, 1, 0, 0.1098039, 1,
2.114894, 1.259751, 2.876121, 1, 0, 0.1019608, 1,
2.131231, -0.337923, 2.231387, 1, 0, 0.09411765, 1,
2.212177, 0.01548421, 0.1115326, 1, 0, 0.09019608, 1,
2.212682, -1.305289, 1.420369, 1, 0, 0.08235294, 1,
2.227829, -0.3935929, 1.529746, 1, 0, 0.07843138, 1,
2.264289, -2.408393, 1.175911, 1, 0, 0.07058824, 1,
2.312597, -1.050001, 0.9458049, 1, 0, 0.06666667, 1,
2.385254, -1.568652, 2.674508, 1, 0, 0.05882353, 1,
2.385518, 0.152639, 3.052515, 1, 0, 0.05490196, 1,
2.428038, -0.8923543, 3.659055, 1, 0, 0.04705882, 1,
2.435408, 0.2726726, 0.402938, 1, 0, 0.04313726, 1,
2.449167, 1.186647, 2.383332, 1, 0, 0.03529412, 1,
2.545864, 0.7561341, 2.395625, 1, 0, 0.03137255, 1,
2.56251, -0.3931807, 0.7762798, 1, 0, 0.02352941, 1,
2.784958, 0.8448434, 0.02816318, 1, 0, 0.01960784, 1,
2.816352, 0.03152095, 2.760354, 1, 0, 0.01176471, 1,
3.213311, -0.4624045, 2.583863, 1, 0, 0.007843138, 1
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
-0.05304468, -3.682419, -7.536238, 0, -0.5, 0.5, 0.5,
-0.05304468, -3.682419, -7.536238, 1, -0.5, 0.5, 0.5,
-0.05304468, -3.682419, -7.536238, 1, 1.5, 0.5, 0.5,
-0.05304468, -3.682419, -7.536238, 0, 1.5, 0.5, 0.5
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
-4.426694, 0.1603329, -7.536238, 0, -0.5, 0.5, 0.5,
-4.426694, 0.1603329, -7.536238, 1, -0.5, 0.5, 0.5,
-4.426694, 0.1603329, -7.536238, 1, 1.5, 0.5, 0.5,
-4.426694, 0.1603329, -7.536238, 0, 1.5, 0.5, 0.5
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
-4.426694, -3.682419, -0.08055282, 0, -0.5, 0.5, 0.5,
-4.426694, -3.682419, -0.08055282, 1, -0.5, 0.5, 0.5,
-4.426694, -3.682419, -0.08055282, 1, 1.5, 0.5, 0.5,
-4.426694, -3.682419, -0.08055282, 0, 1.5, 0.5, 0.5
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
-3, -2.79563, -5.815696,
3, -2.79563, -5.815696,
-3, -2.79563, -5.815696,
-3, -2.943428, -6.102453,
-2, -2.79563, -5.815696,
-2, -2.943428, -6.102453,
-1, -2.79563, -5.815696,
-1, -2.943428, -6.102453,
0, -2.79563, -5.815696,
0, -2.943428, -6.102453,
1, -2.79563, -5.815696,
1, -2.943428, -6.102453,
2, -2.79563, -5.815696,
2, -2.943428, -6.102453,
3, -2.79563, -5.815696,
3, -2.943428, -6.102453
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
-3, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
-3, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
-3, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
-3, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5,
-2, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
-2, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
-2, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
-2, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5,
-1, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
-1, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
-1, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
-1, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5,
0, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
0, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
0, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
0, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5,
1, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
1, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
1, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
1, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5,
2, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
2, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
2, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
2, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5,
3, -3.239025, -6.675967, 0, -0.5, 0.5, 0.5,
3, -3.239025, -6.675967, 1, -0.5, 0.5, 0.5,
3, -3.239025, -6.675967, 1, 1.5, 0.5, 0.5,
3, -3.239025, -6.675967, 0, 1.5, 0.5, 0.5
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
-3.417391, -2, -5.815696,
-3.417391, 3, -5.815696,
-3.417391, -2, -5.815696,
-3.585608, -2, -6.102453,
-3.417391, -1, -5.815696,
-3.585608, -1, -6.102453,
-3.417391, 0, -5.815696,
-3.585608, 0, -6.102453,
-3.417391, 1, -5.815696,
-3.585608, 1, -6.102453,
-3.417391, 2, -5.815696,
-3.585608, 2, -6.102453,
-3.417391, 3, -5.815696,
-3.585608, 3, -6.102453
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
-3.922043, -2, -6.675967, 0, -0.5, 0.5, 0.5,
-3.922043, -2, -6.675967, 1, -0.5, 0.5, 0.5,
-3.922043, -2, -6.675967, 1, 1.5, 0.5, 0.5,
-3.922043, -2, -6.675967, 0, 1.5, 0.5, 0.5,
-3.922043, -1, -6.675967, 0, -0.5, 0.5, 0.5,
-3.922043, -1, -6.675967, 1, -0.5, 0.5, 0.5,
-3.922043, -1, -6.675967, 1, 1.5, 0.5, 0.5,
-3.922043, -1, -6.675967, 0, 1.5, 0.5, 0.5,
-3.922043, 0, -6.675967, 0, -0.5, 0.5, 0.5,
-3.922043, 0, -6.675967, 1, -0.5, 0.5, 0.5,
-3.922043, 0, -6.675967, 1, 1.5, 0.5, 0.5,
-3.922043, 0, -6.675967, 0, 1.5, 0.5, 0.5,
-3.922043, 1, -6.675967, 0, -0.5, 0.5, 0.5,
-3.922043, 1, -6.675967, 1, -0.5, 0.5, 0.5,
-3.922043, 1, -6.675967, 1, 1.5, 0.5, 0.5,
-3.922043, 1, -6.675967, 0, 1.5, 0.5, 0.5,
-3.922043, 2, -6.675967, 0, -0.5, 0.5, 0.5,
-3.922043, 2, -6.675967, 1, -0.5, 0.5, 0.5,
-3.922043, 2, -6.675967, 1, 1.5, 0.5, 0.5,
-3.922043, 2, -6.675967, 0, 1.5, 0.5, 0.5,
-3.922043, 3, -6.675967, 0, -0.5, 0.5, 0.5,
-3.922043, 3, -6.675967, 1, -0.5, 0.5, 0.5,
-3.922043, 3, -6.675967, 1, 1.5, 0.5, 0.5,
-3.922043, 3, -6.675967, 0, 1.5, 0.5, 0.5
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
-3.417391, -2.79563, -4,
-3.417391, -2.79563, 4,
-3.417391, -2.79563, -4,
-3.585608, -2.943428, -4,
-3.417391, -2.79563, -2,
-3.585608, -2.943428, -2,
-3.417391, -2.79563, 0,
-3.585608, -2.943428, 0,
-3.417391, -2.79563, 2,
-3.585608, -2.943428, 2,
-3.417391, -2.79563, 4,
-3.585608, -2.943428, 4
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
-3.922043, -3.239025, -4, 0, -0.5, 0.5, 0.5,
-3.922043, -3.239025, -4, 1, -0.5, 0.5, 0.5,
-3.922043, -3.239025, -4, 1, 1.5, 0.5, 0.5,
-3.922043, -3.239025, -4, 0, 1.5, 0.5, 0.5,
-3.922043, -3.239025, -2, 0, -0.5, 0.5, 0.5,
-3.922043, -3.239025, -2, 1, -0.5, 0.5, 0.5,
-3.922043, -3.239025, -2, 1, 1.5, 0.5, 0.5,
-3.922043, -3.239025, -2, 0, 1.5, 0.5, 0.5,
-3.922043, -3.239025, 0, 0, -0.5, 0.5, 0.5,
-3.922043, -3.239025, 0, 1, -0.5, 0.5, 0.5,
-3.922043, -3.239025, 0, 1, 1.5, 0.5, 0.5,
-3.922043, -3.239025, 0, 0, 1.5, 0.5, 0.5,
-3.922043, -3.239025, 2, 0, -0.5, 0.5, 0.5,
-3.922043, -3.239025, 2, 1, -0.5, 0.5, 0.5,
-3.922043, -3.239025, 2, 1, 1.5, 0.5, 0.5,
-3.922043, -3.239025, 2, 0, 1.5, 0.5, 0.5,
-3.922043, -3.239025, 4, 0, -0.5, 0.5, 0.5,
-3.922043, -3.239025, 4, 1, -0.5, 0.5, 0.5,
-3.922043, -3.239025, 4, 1, 1.5, 0.5, 0.5,
-3.922043, -3.239025, 4, 0, 1.5, 0.5, 0.5
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
-3.417391, -2.79563, -5.815696,
-3.417391, 3.116296, -5.815696,
-3.417391, -2.79563, 5.65459,
-3.417391, 3.116296, 5.65459,
-3.417391, -2.79563, -5.815696,
-3.417391, -2.79563, 5.65459,
-3.417391, 3.116296, -5.815696,
-3.417391, 3.116296, 5.65459,
-3.417391, -2.79563, -5.815696,
3.311301, -2.79563, -5.815696,
-3.417391, -2.79563, 5.65459,
3.311301, -2.79563, 5.65459,
-3.417391, 3.116296, -5.815696,
3.311301, 3.116296, -5.815696,
-3.417391, 3.116296, 5.65459,
3.311301, 3.116296, 5.65459,
3.311301, -2.79563, -5.815696,
3.311301, 3.116296, -5.815696,
3.311301, -2.79563, 5.65459,
3.311301, 3.116296, 5.65459,
3.311301, -2.79563, -5.815696,
3.311301, -2.79563, 5.65459,
3.311301, 3.116296, -5.815696,
3.311301, 3.116296, 5.65459
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
var radius = 7.771089;
var distance = 34.57446;
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
mvMatrix.translate( 0.05304468, -0.1603329, 0.08055282 );
mvMatrix.scale( 1.24872, 1.421238, 0.7325236 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.57446);
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
Velsicol_1068<-read.table("Velsicol_1068.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Velsicol_1068$V2
```

```
## Error in eval(expr, envir, enclos): object 'Velsicol_1068' not found
```

```r
y<-Velsicol_1068$V3
```

```
## Error in eval(expr, envir, enclos): object 'Velsicol_1068' not found
```

```r
z<-Velsicol_1068$V4
```

```
## Error in eval(expr, envir, enclos): object 'Velsicol_1068' not found
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
-3.3194, 0.2230902, -0.2300101, 0, 0, 1, 1, 1,
-2.955271, 0.7522871, -2.080918, 1, 0, 0, 1, 1,
-2.800076, -2.453422, -2.553036, 1, 0, 0, 1, 1,
-2.724124, 0.6985752, 0.02318536, 1, 0, 0, 1, 1,
-2.713145, -0.5751126, -2.460149, 1, 0, 0, 1, 1,
-2.696951, -0.03310156, -1.631214, 1, 0, 0, 1, 1,
-2.65308, 0.9422904, 0.260207, 0, 0, 0, 1, 1,
-2.597022, 0.3308102, -0.7750599, 0, 0, 0, 1, 1,
-2.550262, -1.023695, -1.89863, 0, 0, 0, 1, 1,
-2.293698, 0.469751, -0.342386, 0, 0, 0, 1, 1,
-2.279706, 0.3182311, -1.366481, 0, 0, 0, 1, 1,
-2.272937, -0.08454763, -0.9500675, 0, 0, 0, 1, 1,
-2.232456, 1.870727, 0.1108389, 0, 0, 0, 1, 1,
-2.22577, 1.736717, -1.265627, 1, 1, 1, 1, 1,
-2.215641, 0.642296, -1.649019, 1, 1, 1, 1, 1,
-2.188527, 1.002301, -0.8422167, 1, 1, 1, 1, 1,
-2.178338, 0.5853469, -1.405748, 1, 1, 1, 1, 1,
-2.168726, 1.810913, -1.638659, 1, 1, 1, 1, 1,
-2.159128, -1.011922, -1.232233, 1, 1, 1, 1, 1,
-2.144806, 1.212531, -1.621199, 1, 1, 1, 1, 1,
-2.096082, 0.4356088, -0.6608769, 1, 1, 1, 1, 1,
-2.036282, 0.1872473, -0.9827467, 1, 1, 1, 1, 1,
-2.00165, -0.6564907, -0.3830384, 1, 1, 1, 1, 1,
-1.993554, 1.038203, -1.467724, 1, 1, 1, 1, 1,
-1.97817, 1.533426, -1.63487, 1, 1, 1, 1, 1,
-1.966249, 0.8586347, -2.321417, 1, 1, 1, 1, 1,
-1.946815, -0.144095, -1.430111, 1, 1, 1, 1, 1,
-1.93015, -0.3939751, -2.220777, 1, 1, 1, 1, 1,
-1.925679, 0.01411016, 0.1299106, 0, 0, 1, 1, 1,
-1.910045, 1.483313, -1.161503, 1, 0, 0, 1, 1,
-1.906443, 0.7968049, -2.024908, 1, 0, 0, 1, 1,
-1.902485, -0.1372795, -1.869268, 1, 0, 0, 1, 1,
-1.889531, -1.008407, -3.01773, 1, 0, 0, 1, 1,
-1.848482, 0.3691538, -2.401881, 1, 0, 0, 1, 1,
-1.834394, -1.262951, -0.5100041, 0, 0, 0, 1, 1,
-1.811602, -0.3811566, -1.461555, 0, 0, 0, 1, 1,
-1.792894, -1.273621, -2.423503, 0, 0, 0, 1, 1,
-1.790472, 0.6797856, -0.7268032, 0, 0, 0, 1, 1,
-1.781438, 0.5735918, -1.971761, 0, 0, 0, 1, 1,
-1.771127, 1.666297, -1.600782, 0, 0, 0, 1, 1,
-1.752743, -0.7916363, -2.828077, 0, 0, 0, 1, 1,
-1.746754, -0.3575141, 0.6550109, 1, 1, 1, 1, 1,
-1.723861, -0.4312087, -2.42369, 1, 1, 1, 1, 1,
-1.717654, 0.5354456, -1.277154, 1, 1, 1, 1, 1,
-1.717309, 0.202327, -0.2826214, 1, 1, 1, 1, 1,
-1.694645, 0.4363156, -1.839328, 1, 1, 1, 1, 1,
-1.69191, 0.1502529, -2.119132, 1, 1, 1, 1, 1,
-1.688703, 0.4283182, -2.016114, 1, 1, 1, 1, 1,
-1.665025, -0.2203903, -1.042259, 1, 1, 1, 1, 1,
-1.656795, 1.000468, 0.6187728, 1, 1, 1, 1, 1,
-1.656534, -1.160557, -0.9360825, 1, 1, 1, 1, 1,
-1.629007, -1.571998, -2.596316, 1, 1, 1, 1, 1,
-1.623427, -1.94464, -3.749241, 1, 1, 1, 1, 1,
-1.615309, 0.08161788, -0.8960018, 1, 1, 1, 1, 1,
-1.613659, 0.2038346, -0.9213998, 1, 1, 1, 1, 1,
-1.600711, -0.7094902, -3.534697, 1, 1, 1, 1, 1,
-1.597652, 0.7969415, -1.357869, 0, 0, 1, 1, 1,
-1.591946, -1.065885, -3.334918, 1, 0, 0, 1, 1,
-1.584275, -1.3984, -1.254435, 1, 0, 0, 1, 1,
-1.567088, 1.996306, -1.356436, 1, 0, 0, 1, 1,
-1.552999, -0.355523, -2.877693, 1, 0, 0, 1, 1,
-1.539757, -2.163846, -0.5869824, 1, 0, 0, 1, 1,
-1.526143, -0.2173543, -0.3567478, 0, 0, 0, 1, 1,
-1.518761, 1.729118, 0.3992505, 0, 0, 0, 1, 1,
-1.506187, 0.5754357, 0.3501747, 0, 0, 0, 1, 1,
-1.497532, -0.727228, -2.914215, 0, 0, 0, 1, 1,
-1.49267, -0.9781085, -2.3955, 0, 0, 0, 1, 1,
-1.481788, 0.3312015, 0.08675933, 0, 0, 0, 1, 1,
-1.477295, 0.3485372, -1.01871, 0, 0, 0, 1, 1,
-1.474438, 1.277316, 1.204647, 1, 1, 1, 1, 1,
-1.466095, -0.0780473, -2.05823, 1, 1, 1, 1, 1,
-1.463837, -0.5674901, -2.285557, 1, 1, 1, 1, 1,
-1.441013, 1.703539, -0.7775304, 1, 1, 1, 1, 1,
-1.440869, 0.8393164, -2.379097, 1, 1, 1, 1, 1,
-1.438218, -0.4489274, -0.1759797, 1, 1, 1, 1, 1,
-1.431129, -0.4458054, -0.9998098, 1, 1, 1, 1, 1,
-1.419879, 0.4147698, -1.810805, 1, 1, 1, 1, 1,
-1.413043, -0.3406243, -2.768517, 1, 1, 1, 1, 1,
-1.410828, -0.9960392, -0.2571182, 1, 1, 1, 1, 1,
-1.407848, -2.274692, -2.850223, 1, 1, 1, 1, 1,
-1.403628, -0.1306727, 0.1666736, 1, 1, 1, 1, 1,
-1.38887, -0.7455833, -1.804035, 1, 1, 1, 1, 1,
-1.378609, 0.221051, -2.086524, 1, 1, 1, 1, 1,
-1.378359, 0.6192144, -0.6036518, 1, 1, 1, 1, 1,
-1.375817, 1.866554, -2.464503, 0, 0, 1, 1, 1,
-1.368561, -0.9147104, -3.460828, 1, 0, 0, 1, 1,
-1.366137, 0.9270685, -2.292885, 1, 0, 0, 1, 1,
-1.346322, -1.268799, -2.301044, 1, 0, 0, 1, 1,
-1.326506, 1.260003, -2.039672, 1, 0, 0, 1, 1,
-1.322639, 0.2874989, -2.403516, 1, 0, 0, 1, 1,
-1.310881, 2.006878, -1.242363, 0, 0, 0, 1, 1,
-1.302011, -1.202719, -3.20808, 0, 0, 0, 1, 1,
-1.297045, 2.028198, -2.726138, 0, 0, 0, 1, 1,
-1.292829, -1.389222, -2.991259, 0, 0, 0, 1, 1,
-1.276598, 0.9743678, -1.308758, 0, 0, 0, 1, 1,
-1.272958, -0.4543244, -2.949566, 0, 0, 0, 1, 1,
-1.270729, -1.644122, -2.628906, 0, 0, 0, 1, 1,
-1.270056, -0.4076308, -2.461797, 1, 1, 1, 1, 1,
-1.26984, 0.6272613, -2.753645, 1, 1, 1, 1, 1,
-1.267184, 1.083588, -0.1007816, 1, 1, 1, 1, 1,
-1.26718, -1.403663, -2.322211, 1, 1, 1, 1, 1,
-1.261548, 0.2479036, 0.3839639, 1, 1, 1, 1, 1,
-1.261174, -0.002920828, -1.213685, 1, 1, 1, 1, 1,
-1.261023, 1.757651e-05, -2.428194, 1, 1, 1, 1, 1,
-1.260219, 0.02602334, -4.186872, 1, 1, 1, 1, 1,
-1.251978, -0.896557, -2.249084, 1, 1, 1, 1, 1,
-1.249757, -0.3874336, -0.53328, 1, 1, 1, 1, 1,
-1.24886, 0.7185631, -2.915181, 1, 1, 1, 1, 1,
-1.247183, -0.4290447, -1.757136, 1, 1, 1, 1, 1,
-1.244395, -1.178816, -3.147933, 1, 1, 1, 1, 1,
-1.235436, 0.5704936, -2.78785, 1, 1, 1, 1, 1,
-1.22436, -0.177042, -1.737369, 1, 1, 1, 1, 1,
-1.224172, -1.338976, -1.525016, 0, 0, 1, 1, 1,
-1.223854, -0.6644088, -2.060704, 1, 0, 0, 1, 1,
-1.220965, -1.773885, -4.305193, 1, 0, 0, 1, 1,
-1.204544, -0.6236669, -3.25094, 1, 0, 0, 1, 1,
-1.194506, 0.5565912, -1.040137, 1, 0, 0, 1, 1,
-1.189385, 1.602852, -0.8573232, 1, 0, 0, 1, 1,
-1.182304, 0.3673838, -1.49009, 0, 0, 0, 1, 1,
-1.174644, -2.186064, -2.423193, 0, 0, 0, 1, 1,
-1.169808, -0.695317, -1.719386, 0, 0, 0, 1, 1,
-1.167442, 0.1252145, -2.00532, 0, 0, 0, 1, 1,
-1.161163, -0.7935168, -1.819139, 0, 0, 0, 1, 1,
-1.154464, 0.7925057, -2.326069, 0, 0, 0, 1, 1,
-1.150383, 0.5514954, -0.9091834, 0, 0, 0, 1, 1,
-1.143817, -0.9019086, -1.755223, 1, 1, 1, 1, 1,
-1.141789, 0.1920105, -0.3872305, 1, 1, 1, 1, 1,
-1.141206, -1.371659, -1.613495, 1, 1, 1, 1, 1,
-1.136149, -1.064544, -2.046164, 1, 1, 1, 1, 1,
-1.13437, -0.3761575, -0.6448032, 1, 1, 1, 1, 1,
-1.131986, 0.5253443, -1.397652, 1, 1, 1, 1, 1,
-1.128983, 0.1916662, -0.8110056, 1, 1, 1, 1, 1,
-1.125442, 0.5856509, -2.784828, 1, 1, 1, 1, 1,
-1.124697, -0.5975935, -1.836113, 1, 1, 1, 1, 1,
-1.118197, -1.361003, -3.371712, 1, 1, 1, 1, 1,
-1.115176, -1.909112, -1.894923, 1, 1, 1, 1, 1,
-1.112437, -1.729231, -2.604089, 1, 1, 1, 1, 1,
-1.10669, -0.8645977, -1.308991, 1, 1, 1, 1, 1,
-1.106272, -0.7656365, -2.853347, 1, 1, 1, 1, 1,
-1.104787, 0.4537351, -0.5661093, 1, 1, 1, 1, 1,
-1.096686, 0.7235716, -0.6640796, 0, 0, 1, 1, 1,
-1.096467, 0.09849137, -1.274941, 1, 0, 0, 1, 1,
-1.090291, 0.5937789, -1.710017, 1, 0, 0, 1, 1,
-1.089982, 0.8828852, -2.081194, 1, 0, 0, 1, 1,
-1.080313, 0.343834, -2.062603, 1, 0, 0, 1, 1,
-1.079218, -0.1208917, -0.6710891, 1, 0, 0, 1, 1,
-1.077935, 0.7395592, 0.2958985, 0, 0, 0, 1, 1,
-1.070574, -0.7064612, -2.924831, 0, 0, 0, 1, 1,
-1.069818, 0.09142238, -1.640599, 0, 0, 0, 1, 1,
-1.040447, -0.2361366, -1.614747, 0, 0, 0, 1, 1,
-1.040363, 0.4163643, -0.8411915, 0, 0, 0, 1, 1,
-1.039861, 2.724844, 0.1218012, 0, 0, 0, 1, 1,
-1.037371, -1.261774, -3.170127, 0, 0, 0, 1, 1,
-1.033161, 0.2413328, -1.365816, 1, 1, 1, 1, 1,
-1.031155, -0.3405992, -2.124041, 1, 1, 1, 1, 1,
-1.031101, -0.4230272, -1.645296, 1, 1, 1, 1, 1,
-1.029706, -1.271132, -3.522829, 1, 1, 1, 1, 1,
-1.022243, -0.6134168, -0.78043, 1, 1, 1, 1, 1,
-1.018699, 0.1930538, -1.475058, 1, 1, 1, 1, 1,
-1.014928, 0.4505094, -2.091468, 1, 1, 1, 1, 1,
-1.012449, -0.5608345, -1.377302, 1, 1, 1, 1, 1,
-1.005825, -0.7534145, -0.7661918, 1, 1, 1, 1, 1,
-1.001608, -0.4906188, -2.306449, 1, 1, 1, 1, 1,
-0.9997541, 0.3305396, -2.261998, 1, 1, 1, 1, 1,
-0.9975191, 0.9247096, -1.480554, 1, 1, 1, 1, 1,
-0.9967861, -0.3241781, -2.292838, 1, 1, 1, 1, 1,
-0.9958115, 0.1887397, -2.237168, 1, 1, 1, 1, 1,
-0.9838365, -2.26895, -3.564087, 1, 1, 1, 1, 1,
-0.9769976, -0.8751413, -0.6003568, 0, 0, 1, 1, 1,
-0.9769059, -0.370792, -2.571348, 1, 0, 0, 1, 1,
-0.9702566, 0.6770329, -0.6722897, 1, 0, 0, 1, 1,
-0.9694416, -0.5483103, -2.027551, 1, 0, 0, 1, 1,
-0.9580985, -1.109005, -1.946614, 1, 0, 0, 1, 1,
-0.9578745, -0.4939523, -1.460062, 1, 0, 0, 1, 1,
-0.9546441, 0.4026677, -0.4947023, 0, 0, 0, 1, 1,
-0.9495615, 1.544076, 0.01775083, 0, 0, 0, 1, 1,
-0.9494632, -1.450299, -0.6247551, 0, 0, 0, 1, 1,
-0.945746, 1.199202, -0.4753948, 0, 0, 0, 1, 1,
-0.9358193, -0.3205105, -1.839888, 0, 0, 0, 1, 1,
-0.9324997, -0.3878914, -3.445394, 0, 0, 0, 1, 1,
-0.9315425, -1.189282, -2.953221, 0, 0, 0, 1, 1,
-0.9265352, -0.01302424, 0.790068, 1, 1, 1, 1, 1,
-0.9257449, 1.056018, -0.4405075, 1, 1, 1, 1, 1,
-0.9237629, -1.528348, -4.708213, 1, 1, 1, 1, 1,
-0.923205, -1.716688, -2.48861, 1, 1, 1, 1, 1,
-0.9220731, -0.2714998, -1.730694, 1, 1, 1, 1, 1,
-0.9201102, -0.1481934, -2.164492, 1, 1, 1, 1, 1,
-0.9200063, 0.4082481, -0.4721271, 1, 1, 1, 1, 1,
-0.9197115, 0.04282549, -0.4055967, 1, 1, 1, 1, 1,
-0.9177696, 1.053192, 0.1630246, 1, 1, 1, 1, 1,
-0.9139291, -1.502194, -3.312263, 1, 1, 1, 1, 1,
-0.9121082, -0.6816374, -0.4916884, 1, 1, 1, 1, 1,
-0.8938804, 0.5478663, -0.8538849, 1, 1, 1, 1, 1,
-0.8856763, 0.7108948, 0.1222754, 1, 1, 1, 1, 1,
-0.8836398, 1.402328, 1.347994, 1, 1, 1, 1, 1,
-0.8800167, 0.2468085, -2.206633, 1, 1, 1, 1, 1,
-0.8749383, -0.4478739, -0.4968935, 0, 0, 1, 1, 1,
-0.8710867, -1.062122, -2.833134, 1, 0, 0, 1, 1,
-0.8697901, -1.869304, -1.936386, 1, 0, 0, 1, 1,
-0.8693623, -1.081417, -0.5550188, 1, 0, 0, 1, 1,
-0.8693325, -0.06497928, -0.3098986, 1, 0, 0, 1, 1,
-0.8652515, 3.017933, 1.193942, 1, 0, 0, 1, 1,
-0.8647411, 0.2220192, -0.829086, 0, 0, 0, 1, 1,
-0.8600916, 0.3033243, -0.0241156, 0, 0, 0, 1, 1,
-0.8551863, -1.471154, -5.648653, 0, 0, 0, 1, 1,
-0.8486216, 0.3106441, -0.9116701, 0, 0, 0, 1, 1,
-0.8446137, -1.054232, -3.954718, 0, 0, 0, 1, 1,
-0.8397987, 0.1217219, 1.176414, 0, 0, 0, 1, 1,
-0.8396414, 0.7860413, -1.024314, 0, 0, 0, 1, 1,
-0.8351288, -0.529858, -2.810386, 1, 1, 1, 1, 1,
-0.8194271, -1.042161, -3.433809, 1, 1, 1, 1, 1,
-0.8183604, 0.2763289, -1.955611, 1, 1, 1, 1, 1,
-0.8175734, 0.9168342, -0.4067761, 1, 1, 1, 1, 1,
-0.8100723, -0.2907204, -2.929287, 1, 1, 1, 1, 1,
-0.807723, -0.05872099, -1.287837, 1, 1, 1, 1, 1,
-0.7857632, -1.144178, 0.4027751, 1, 1, 1, 1, 1,
-0.7829095, 0.3425115, -1.465859, 1, 1, 1, 1, 1,
-0.7806342, -1.290284, -1.12477, 1, 1, 1, 1, 1,
-0.7733539, -0.9770994, -1.160818, 1, 1, 1, 1, 1,
-0.7668315, 0.01067214, -2.304955, 1, 1, 1, 1, 1,
-0.7496006, -0.3095304, -3.825443, 1, 1, 1, 1, 1,
-0.7447335, -1.867918, -3.738549, 1, 1, 1, 1, 1,
-0.7392451, 1.784316, -0.3685952, 1, 1, 1, 1, 1,
-0.7375809, -0.1346152, -1.252299, 1, 1, 1, 1, 1,
-0.735857, -0.06105701, 0.174214, 0, 0, 1, 1, 1,
-0.7330993, -0.6925306, -0.9825595, 1, 0, 0, 1, 1,
-0.7296265, -0.1925994, -2.110994, 1, 0, 0, 1, 1,
-0.7250649, 0.7725496, 0.1145931, 1, 0, 0, 1, 1,
-0.7243908, 0.235014, -1.136426, 1, 0, 0, 1, 1,
-0.7219352, 1.079031, 1.102742, 1, 0, 0, 1, 1,
-0.7179449, 0.1902069, -1.321965, 0, 0, 0, 1, 1,
-0.7155129, -0.007674246, -3.294888, 0, 0, 0, 1, 1,
-0.7078633, 1.186784, 0.2129909, 0, 0, 0, 1, 1,
-0.6976837, -0.2086389, 0.5007317, 0, 0, 0, 1, 1,
-0.6976538, -0.09365837, -2.083581, 0, 0, 0, 1, 1,
-0.6933154, -0.823549, -0.5451244, 0, 0, 0, 1, 1,
-0.6864569, -0.1730578, -2.827844, 0, 0, 0, 1, 1,
-0.6824628, 0.2483749, -2.071743, 1, 1, 1, 1, 1,
-0.6775996, -1.059202, -1.731166, 1, 1, 1, 1, 1,
-0.6727177, 0.1176025, -1.357855, 1, 1, 1, 1, 1,
-0.6704634, 1.548319, 0.03695222, 1, 1, 1, 1, 1,
-0.6666972, -1.115354, -2.456848, 1, 1, 1, 1, 1,
-0.6639896, -0.3686755, -1.891075, 1, 1, 1, 1, 1,
-0.6578187, 1.936719, -0.08948703, 1, 1, 1, 1, 1,
-0.6569194, -0.415297, -3.506814, 1, 1, 1, 1, 1,
-0.6541147, -0.4389542, -3.135283, 1, 1, 1, 1, 1,
-0.6531371, -0.7773801, -1.881261, 1, 1, 1, 1, 1,
-0.6512249, -1.646003, -3.527004, 1, 1, 1, 1, 1,
-0.6489291, -0.3312194, -2.188736, 1, 1, 1, 1, 1,
-0.6467246, -0.007075708, -1.334601, 1, 1, 1, 1, 1,
-0.6460879, -0.2421778, -2.411865, 1, 1, 1, 1, 1,
-0.644244, 0.5432857, 0.6629821, 1, 1, 1, 1, 1,
-0.6376232, 1.385446, 0.3858669, 0, 0, 1, 1, 1,
-0.6357846, -0.6790416, -3.853226, 1, 0, 0, 1, 1,
-0.6329922, -0.3722721, -1.170036, 1, 0, 0, 1, 1,
-0.6302888, 0.7834276, -0.8057515, 1, 0, 0, 1, 1,
-0.6247429, -1.797734, -3.219185, 1, 0, 0, 1, 1,
-0.6246473, 2.0128, -0.02589271, 1, 0, 0, 1, 1,
-0.6186972, -0.8795976, -2.561514, 0, 0, 0, 1, 1,
-0.6165531, 0.7083551, -0.02821571, 0, 0, 0, 1, 1,
-0.6153812, -0.9162379, -2.743037, 0, 0, 0, 1, 1,
-0.613662, -0.4125456, -2.671605, 0, 0, 0, 1, 1,
-0.6130698, -0.0941245, -1.543392, 0, 0, 0, 1, 1,
-0.6117725, -0.5741506, -0.7919151, 0, 0, 0, 1, 1,
-0.6106748, -2.709534, -3.652609, 0, 0, 0, 1, 1,
-0.6082457, 0.6979275, -1.525325, 1, 1, 1, 1, 1,
-0.6015068, -1.95181, -3.038226, 1, 1, 1, 1, 1,
-0.6011898, 2.508903, 2.37498, 1, 1, 1, 1, 1,
-0.5971867, -0.2510283, -3.232884, 1, 1, 1, 1, 1,
-0.5933135, -0.4302768, -0.8914669, 1, 1, 1, 1, 1,
-0.5933043, -1.02596, -1.821469, 1, 1, 1, 1, 1,
-0.5899305, -0.2949719, -1.37207, 1, 1, 1, 1, 1,
-0.5800964, 1.088194, -0.3965905, 1, 1, 1, 1, 1,
-0.5784854, -0.4142075, -2.794839, 1, 1, 1, 1, 1,
-0.5756647, -0.560775, -1.015438, 1, 1, 1, 1, 1,
-0.573293, -0.1645041, -2.095195, 1, 1, 1, 1, 1,
-0.5722593, 1.261129, 1.214909, 1, 1, 1, 1, 1,
-0.5719524, 2.256419, -1.396311, 1, 1, 1, 1, 1,
-0.5631669, 1.551107, 0.3229982, 1, 1, 1, 1, 1,
-0.5611778, -0.1992666, -0.9414615, 1, 1, 1, 1, 1,
-0.5576068, -0.9207127, -3.955808, 0, 0, 1, 1, 1,
-0.5517376, -0.4220354, -2.103101, 1, 0, 0, 1, 1,
-0.5516171, -0.5775163, -2.483517, 1, 0, 0, 1, 1,
-0.5495299, -1.944206, -3.188617, 1, 0, 0, 1, 1,
-0.5474607, 0.1962863, -0.7925479, 1, 0, 0, 1, 1,
-0.5444801, -1.559026, -3.242972, 1, 0, 0, 1, 1,
-0.5442545, -1.510564, -2.346853, 0, 0, 0, 1, 1,
-0.5416462, -1.017865, -2.105128, 0, 0, 0, 1, 1,
-0.5406408, 0.05477417, -2.458038, 0, 0, 0, 1, 1,
-0.5286474, -1.481979, -3.527736, 0, 0, 0, 1, 1,
-0.5240993, -0.9646172, -2.489593, 0, 0, 0, 1, 1,
-0.5235899, 0.5066928, -1.692277, 0, 0, 0, 1, 1,
-0.5226143, 0.1871988, -0.4987329, 0, 0, 0, 1, 1,
-0.516488, -1.740808, -3.607793, 1, 1, 1, 1, 1,
-0.5161204, 0.8386859, -1.194739, 1, 1, 1, 1, 1,
-0.5095909, 0.01740127, -2.433235, 1, 1, 1, 1, 1,
-0.5087847, 0.8078678, -1.188568, 1, 1, 1, 1, 1,
-0.5065695, 0.4363693, -0.6126311, 1, 1, 1, 1, 1,
-0.5001454, -0.4514321, -2.857983, 1, 1, 1, 1, 1,
-0.4982477, -1.27881, -3.996301, 1, 1, 1, 1, 1,
-0.4978959, -0.7516517, -1.205631, 1, 1, 1, 1, 1,
-0.4975654, -0.692793, -2.508251, 1, 1, 1, 1, 1,
-0.4961433, 0.06536966, -1.921646, 1, 1, 1, 1, 1,
-0.492958, 0.3375116, 0.3111343, 1, 1, 1, 1, 1,
-0.4921009, -2.148518, -2.403239, 1, 1, 1, 1, 1,
-0.492084, 0.1270197, -3.485402, 1, 1, 1, 1, 1,
-0.4888239, -0.3264209, -1.499656, 1, 1, 1, 1, 1,
-0.4866505, 0.883805, -1.285563, 1, 1, 1, 1, 1,
-0.4857928, 0.2051772, 0.950387, 0, 0, 1, 1, 1,
-0.4819532, -0.07568205, -0.3437022, 1, 0, 0, 1, 1,
-0.4780841, 1.145019, -0.3335844, 1, 0, 0, 1, 1,
-0.4755436, -0.5702775, -2.225374, 1, 0, 0, 1, 1,
-0.4736392, 0.3104759, -1.556717, 1, 0, 0, 1, 1,
-0.470433, 0.2757525, -0.5712997, 1, 0, 0, 1, 1,
-0.4693033, -0.1120084, -1.690085, 0, 0, 0, 1, 1,
-0.4680383, 0.5105487, -1.647953, 0, 0, 0, 1, 1,
-0.4671993, 0.1728527, 0.2170938, 0, 0, 0, 1, 1,
-0.4599504, 0.4128191, -0.8257833, 0, 0, 0, 1, 1,
-0.4596026, 2.77793, 2.270037, 0, 0, 0, 1, 1,
-0.4584309, -1.96908, -2.508553, 0, 0, 0, 1, 1,
-0.4546104, -0.7107108, -3.473145, 0, 0, 0, 1, 1,
-0.4543089, 0.1158099, 0.4961288, 1, 1, 1, 1, 1,
-0.4542462, -1.134242, -2.529212, 1, 1, 1, 1, 1,
-0.4489661, 1.466506, 0.07629077, 1, 1, 1, 1, 1,
-0.4487421, 0.4722829, -1.314278, 1, 1, 1, 1, 1,
-0.4486647, -0.2154614, -2.185971, 1, 1, 1, 1, 1,
-0.4479527, 0.9944017, -0.07301878, 1, 1, 1, 1, 1,
-0.4446052, -0.7459574, -1.492964, 1, 1, 1, 1, 1,
-0.4445896, 0.4508728, 1.011955, 1, 1, 1, 1, 1,
-0.4436229, -0.3635178, -1.70118, 1, 1, 1, 1, 1,
-0.4414104, -0.8529638, -2.394031, 1, 1, 1, 1, 1,
-0.4390731, -1.588645, -2.9041, 1, 1, 1, 1, 1,
-0.435367, 0.2918857, 0.4511905, 1, 1, 1, 1, 1,
-0.4285495, 0.5815414, -0.6260749, 1, 1, 1, 1, 1,
-0.4268819, 0.127737, -1.485461, 1, 1, 1, 1, 1,
-0.4248306, 0.07585407, -3.379303, 1, 1, 1, 1, 1,
-0.422147, -0.6051832, -2.600675, 0, 0, 1, 1, 1,
-0.4197301, 0.5288983, -1.105469, 1, 0, 0, 1, 1,
-0.4146431, -1.344696, -3.862246, 1, 0, 0, 1, 1,
-0.4140465, 1.505313, 0.02330068, 1, 0, 0, 1, 1,
-0.411144, 1.12264, -2.904274, 1, 0, 0, 1, 1,
-0.40519, -0.4064255, -4.123555, 1, 0, 0, 1, 1,
-0.4043259, -0.6036565, -3.321817, 0, 0, 0, 1, 1,
-0.3975674, -1.294415, -1.731254, 0, 0, 0, 1, 1,
-0.3931184, -0.2296136, -2.295102, 0, 0, 0, 1, 1,
-0.3912183, -0.7894132, -4.285564, 0, 0, 0, 1, 1,
-0.3905297, 1.499341, -0.01907703, 0, 0, 0, 1, 1,
-0.3883238, 0.2827527, 0.09754445, 0, 0, 0, 1, 1,
-0.3839658, -0.8054322, -2.148199, 0, 0, 0, 1, 1,
-0.3833991, -2.327206, -3.075151, 1, 1, 1, 1, 1,
-0.383351, -0.2458346, -2.52975, 1, 1, 1, 1, 1,
-0.3830163, -2.372302, -1.816901, 1, 1, 1, 1, 1,
-0.3804338, 0.5809822, -1.978477, 1, 1, 1, 1, 1,
-0.379605, 1.141877, -0.7136779, 1, 1, 1, 1, 1,
-0.379123, 0.5818747, 0.8959328, 1, 1, 1, 1, 1,
-0.3772233, 0.02078265, -3.299873, 1, 1, 1, 1, 1,
-0.3694836, 0.7385184, 1.577329, 1, 1, 1, 1, 1,
-0.3679129, 0.9809668, 0.001963066, 1, 1, 1, 1, 1,
-0.3662416, 0.4954159, -0.2905037, 1, 1, 1, 1, 1,
-0.3640068, -0.2238, -1.459948, 1, 1, 1, 1, 1,
-0.3607145, -1.158716, -3.099847, 1, 1, 1, 1, 1,
-0.3537346, -0.355898, -3.538447, 1, 1, 1, 1, 1,
-0.3501799, 1.802482, -0.5775188, 1, 1, 1, 1, 1,
-0.3449751, -1.114792, -3.799634, 1, 1, 1, 1, 1,
-0.3438594, -0.2494442, -0.3771832, 0, 0, 1, 1, 1,
-0.3429784, 0.9967465, 0.8262885, 1, 0, 0, 1, 1,
-0.340798, -0.7199586, -2.219368, 1, 0, 0, 1, 1,
-0.3402157, -0.4667057, -2.741137, 1, 0, 0, 1, 1,
-0.3374158, -0.8460571, -1.70247, 1, 0, 0, 1, 1,
-0.3319615, -0.5703282, -3.861633, 1, 0, 0, 1, 1,
-0.3313927, 0.8735275, -0.4564774, 0, 0, 0, 1, 1,
-0.3305495, -0.9524205, -1.80946, 0, 0, 0, 1, 1,
-0.3300194, 0.5709476, -0.758356, 0, 0, 0, 1, 1,
-0.3298399, -0.5269524, -4.198278, 0, 0, 0, 1, 1,
-0.3251013, -0.2991054, -2.90521, 0, 0, 0, 1, 1,
-0.3221228, -0.09217718, -3.720994, 0, 0, 0, 1, 1,
-0.3205345, -0.6133422, -1.92831, 0, 0, 0, 1, 1,
-0.3200403, 1.028831, -0.4655792, 1, 1, 1, 1, 1,
-0.3098848, -0.2739949, -2.705924, 1, 1, 1, 1, 1,
-0.3087866, 1.091981, 0.01402228, 1, 1, 1, 1, 1,
-0.3046278, -0.2701453, -3.025988, 1, 1, 1, 1, 1,
-0.3029964, 0.7896332, -1.922538, 1, 1, 1, 1, 1,
-0.3015213, -0.8008343, -2.557271, 1, 1, 1, 1, 1,
-0.2970861, -1.379216, -2.368886, 1, 1, 1, 1, 1,
-0.2924868, 0.5032069, -0.5291284, 1, 1, 1, 1, 1,
-0.2906208, 0.581601, -1.609908, 1, 1, 1, 1, 1,
-0.2905133, -0.1628656, -2.37901, 1, 1, 1, 1, 1,
-0.2896911, -0.6556332, -2.376529, 1, 1, 1, 1, 1,
-0.2890187, -0.1540101, -2.223676, 1, 1, 1, 1, 1,
-0.2884567, -1.634496, -1.488336, 1, 1, 1, 1, 1,
-0.288014, 0.1019918, -1.627461, 1, 1, 1, 1, 1,
-0.2840583, 0.1605884, -3.863664, 1, 1, 1, 1, 1,
-0.2829661, -0.6342698, -2.204177, 0, 0, 1, 1, 1,
-0.2826749, -1.25179, -2.414191, 1, 0, 0, 1, 1,
-0.2825275, -0.03062356, -0.1781309, 1, 0, 0, 1, 1,
-0.2782125, -1.956801, -2.388644, 1, 0, 0, 1, 1,
-0.2713251, 0.2056875, -0.4466296, 1, 0, 0, 1, 1,
-0.2644629, 2.054887, -0.527095, 1, 0, 0, 1, 1,
-0.2613617, 0.4545346, -0.3879491, 0, 0, 0, 1, 1,
-0.2606802, 0.5266632, -1.471671, 0, 0, 0, 1, 1,
-0.2562953, 0.02489894, -3.275264, 0, 0, 0, 1, 1,
-0.2538024, -0.5986052, -1.943557, 0, 0, 0, 1, 1,
-0.2531728, -0.4046168, -2.572522, 0, 0, 0, 1, 1,
-0.2517644, -0.36439, -3.050663, 0, 0, 0, 1, 1,
-0.2433446, -2.151283, -3.85567, 0, 0, 0, 1, 1,
-0.2414033, -0.5541311, -2.775431, 1, 1, 1, 1, 1,
-0.2398644, 0.5145285, -0.2238747, 1, 1, 1, 1, 1,
-0.2375285, 0.5830356, -0.8721071, 1, 1, 1, 1, 1,
-0.2329108, 0.2582541, -0.6949556, 1, 1, 1, 1, 1,
-0.2326369, 0.1213202, -0.2178043, 1, 1, 1, 1, 1,
-0.2316719, -1.990438, -3.500322, 1, 1, 1, 1, 1,
-0.2262386, 1.585418, 0.154588, 1, 1, 1, 1, 1,
-0.2260507, 0.2348262, -1.758361, 1, 1, 1, 1, 1,
-0.225515, 0.3049974, 0.77292, 1, 1, 1, 1, 1,
-0.2252208, -0.06619591, -1.38094, 1, 1, 1, 1, 1,
-0.2223754, 1.518757, -1.564394, 1, 1, 1, 1, 1,
-0.220248, -2.259965, -2.566476, 1, 1, 1, 1, 1,
-0.2196952, 2.099979, -1.476742, 1, 1, 1, 1, 1,
-0.2196746, 0.5943682, 0.1210961, 1, 1, 1, 1, 1,
-0.2193506, 0.02329519, -2.157189, 1, 1, 1, 1, 1,
-0.2151568, -0.6685233, -3.089934, 0, 0, 1, 1, 1,
-0.2150959, -0.1088313, -1.38305, 1, 0, 0, 1, 1,
-0.2146535, 1.008885, 0.3415904, 1, 0, 0, 1, 1,
-0.2104517, -0.7846172, -4.092131, 1, 0, 0, 1, 1,
-0.2060209, 1.219423, -0.5852506, 1, 0, 0, 1, 1,
-0.2043157, -0.1601679, -3.045556, 1, 0, 0, 1, 1,
-0.2039011, 1.131089, 0.8204999, 0, 0, 0, 1, 1,
-0.2013476, -1.227206, -3.10097, 0, 0, 0, 1, 1,
-0.1988182, 1.647295, -0.7371422, 0, 0, 0, 1, 1,
-0.1968952, -0.7905294, -1.089351, 0, 0, 0, 1, 1,
-0.1927774, 0.9324887, 0.5921535, 0, 0, 0, 1, 1,
-0.1914219, -0.2097661, -2.949486, 0, 0, 0, 1, 1,
-0.191333, 0.5734578, -0.9807673, 0, 0, 0, 1, 1,
-0.1879812, 0.2496294, -0.412992, 1, 1, 1, 1, 1,
-0.1855626, 0.09866235, -0.5724561, 1, 1, 1, 1, 1,
-0.1810974, 1.345017, -0.03596949, 1, 1, 1, 1, 1,
-0.1801038, 0.03896981, -0.9081313, 1, 1, 1, 1, 1,
-0.1775864, 0.2204198, -0.3830933, 1, 1, 1, 1, 1,
-0.1766036, -0.7323846, -2.5047, 1, 1, 1, 1, 1,
-0.1672437, 0.3426811, -1.000687, 1, 1, 1, 1, 1,
-0.1666251, 0.9932525, 0.5742991, 1, 1, 1, 1, 1,
-0.1581545, 1.024707, -0.3415497, 1, 1, 1, 1, 1,
-0.1560762, -0.3843389, -3.257906, 1, 1, 1, 1, 1,
-0.155857, 0.9998739, 0.9224175, 1, 1, 1, 1, 1,
-0.1558018, 0.3241081, -1.385929, 1, 1, 1, 1, 1,
-0.1545356, 0.09352694, 0.1979608, 1, 1, 1, 1, 1,
-0.154407, 0.650196, 0.1187687, 1, 1, 1, 1, 1,
-0.1534063, -0.8949052, -2.347343, 1, 1, 1, 1, 1,
-0.1473457, 0.1979715, -1.062909, 0, 0, 1, 1, 1,
-0.146186, -1.412039, -4.133304, 1, 0, 0, 1, 1,
-0.1454285, 0.8118919, 0.3528368, 1, 0, 0, 1, 1,
-0.1434572, 0.9920195, -1.574968, 1, 0, 0, 1, 1,
-0.1392015, -0.03505435, -1.875465, 1, 0, 0, 1, 1,
-0.1335677, 0.231819, -0.7594572, 1, 0, 0, 1, 1,
-0.130024, -0.9088206, -2.765738, 0, 0, 0, 1, 1,
-0.1268499, 1.978309, -0.03220022, 0, 0, 0, 1, 1,
-0.1262201, -0.8187075, -2.498231, 0, 0, 0, 1, 1,
-0.1255713, 0.1207184, -0.5791934, 0, 0, 0, 1, 1,
-0.1112327, -0.2562016, -1.719938, 0, 0, 0, 1, 1,
-0.1064319, -0.9896078, -3.029796, 0, 0, 0, 1, 1,
-0.1048991, 0.5357291, -2.036686, 0, 0, 0, 1, 1,
-0.09789404, -1.391, -3.360634, 1, 1, 1, 1, 1,
-0.09173677, 0.8613685, 0.3307868, 1, 1, 1, 1, 1,
-0.09105349, -2.653333, -3.185721, 1, 1, 1, 1, 1,
-0.09083278, -0.5769365, -2.164376, 1, 1, 1, 1, 1,
-0.09030874, -0.2483963, -3.476249, 1, 1, 1, 1, 1,
-0.08787242, 2.04535, 1.365609, 1, 1, 1, 1, 1,
-0.08679431, -0.3609917, -4.759679, 1, 1, 1, 1, 1,
-0.08561024, -0.8454438, -2.885154, 1, 1, 1, 1, 1,
-0.08555381, 0.4805658, -1.023595, 1, 1, 1, 1, 1,
-0.0822626, 0.2509064, -2.174708, 1, 1, 1, 1, 1,
-0.08118434, -0.1468127, -2.208103, 1, 1, 1, 1, 1,
-0.07477221, -0.01851899, -1.329133, 1, 1, 1, 1, 1,
-0.07444058, 1.138671, 2.41834, 1, 1, 1, 1, 1,
-0.06574266, 1.703265, -1.381938, 1, 1, 1, 1, 1,
-0.06537963, 0.6870096, 0.1133296, 1, 1, 1, 1, 1,
-0.06167847, 1.370548, -0.0436268, 0, 0, 1, 1, 1,
-0.05811591, -0.4737714, -1.368214, 1, 0, 0, 1, 1,
-0.05720703, 0.9006993, 1.223098, 1, 0, 0, 1, 1,
-0.05522115, -0.3108165, -3.865022, 1, 0, 0, 1, 1,
-0.05346897, 0.5543896, -0.3602598, 1, 0, 0, 1, 1,
-0.04456808, -0.2936486, -3.455208, 1, 0, 0, 1, 1,
-0.04454553, -1.104245, -3.193045, 0, 0, 0, 1, 1,
-0.0387162, 1.682112, -0.2664121, 0, 0, 0, 1, 1,
-0.03305412, -0.9053403, -3.460948, 0, 0, 0, 1, 1,
-0.03052887, -1.293766, -3.462749, 0, 0, 0, 1, 1,
-0.02872979, -0.4902093, -1.690434, 0, 0, 0, 1, 1,
-0.02494576, 0.2203092, 0.09490814, 0, 0, 0, 1, 1,
-0.02309777, 0.4460784, 1.146701, 0, 0, 0, 1, 1,
-0.02055633, 0.4337998, 1.022044, 1, 1, 1, 1, 1,
-0.01899794, -0.5318285, -3.038665, 1, 1, 1, 1, 1,
-0.0172155, 1.259347, 1.734735, 1, 1, 1, 1, 1,
-0.01521845, 0.1323993, -0.7868345, 1, 1, 1, 1, 1,
-0.01425331, -0.7932312, -3.42466, 1, 1, 1, 1, 1,
-0.01051137, 0.5280247, -1.444938, 1, 1, 1, 1, 1,
-0.004458821, 2.952481, 0.2247546, 1, 1, 1, 1, 1,
-0.001481169, -1.62412, -2.410831, 1, 1, 1, 1, 1,
0.0003284233, -1.602949, -0.2813642, 1, 1, 1, 1, 1,
0.004508175, -0.262095, 1.977435, 1, 1, 1, 1, 1,
0.004916899, -0.5416164, 4.347466, 1, 1, 1, 1, 1,
0.005322041, 0.9418144, 0.201027, 1, 1, 1, 1, 1,
0.006778587, -1.994329, 2.5542, 1, 1, 1, 1, 1,
0.007211403, -0.9338651, 2.810601, 1, 1, 1, 1, 1,
0.009606713, 1.393581, -1.771923, 1, 1, 1, 1, 1,
0.01087067, -0.8292757, 3.47987, 0, 0, 1, 1, 1,
0.01187537, -0.7264113, 2.548799, 1, 0, 0, 1, 1,
0.01402728, -0.6318049, 3.186826, 1, 0, 0, 1, 1,
0.0196821, -0.6831935, 2.21463, 1, 0, 0, 1, 1,
0.02255381, -0.2588181, 3.767584, 1, 0, 0, 1, 1,
0.02348225, 0.1542854, 0.04432075, 1, 0, 0, 1, 1,
0.02565314, -1.264554, 3.321384, 0, 0, 0, 1, 1,
0.02919767, 1.600298, -1.934019, 0, 0, 0, 1, 1,
0.03417689, 0.2419293, 0.09068757, 0, 0, 0, 1, 1,
0.0352857, -2.560299, 3.706666, 0, 0, 0, 1, 1,
0.03617797, 1.41052, 2.241878, 0, 0, 0, 1, 1,
0.03622328, 0.08969798, 1.745268, 0, 0, 0, 1, 1,
0.0382926, 1.118066, -0.9441644, 0, 0, 0, 1, 1,
0.04173904, -0.5894758, 2.524056, 1, 1, 1, 1, 1,
0.04484467, 2.050309, -0.5921425, 1, 1, 1, 1, 1,
0.04932012, 0.4689936, -0.02111781, 1, 1, 1, 1, 1,
0.0529271, -0.6258179, 4.370148, 1, 1, 1, 1, 1,
0.05293326, -1.547085, 2.69211, 1, 1, 1, 1, 1,
0.05614171, 1.435545, 0.8624127, 1, 1, 1, 1, 1,
0.05852294, 0.4412919, -0.5808236, 1, 1, 1, 1, 1,
0.06240878, -0.5619926, 1.221393, 1, 1, 1, 1, 1,
0.06495895, 0.8952214, -0.1308363, 1, 1, 1, 1, 1,
0.06719755, 1.14236, -0.0446844, 1, 1, 1, 1, 1,
0.06746965, 0.8521622, 0.7635812, 1, 1, 1, 1, 1,
0.07075754, -2.624513, 3.35954, 1, 1, 1, 1, 1,
0.07173193, 0.7092091, -0.02602869, 1, 1, 1, 1, 1,
0.07277773, 0.849808, -1.086946, 1, 1, 1, 1, 1,
0.07483422, 0.212107, 2.737075, 1, 1, 1, 1, 1,
0.07794968, -2.186096, 3.570193, 0, 0, 1, 1, 1,
0.08387187, 0.2036458, 0.5237964, 1, 0, 0, 1, 1,
0.08489463, -0.1658481, 2.655593, 1, 0, 0, 1, 1,
0.08912759, 0.2217043, 1.907487, 1, 0, 0, 1, 1,
0.09008289, 0.2573122, 0.01913328, 1, 0, 0, 1, 1,
0.09010074, -0.2214464, 1.980894, 1, 0, 0, 1, 1,
0.0903397, 0.09926147, 2.30976, 0, 0, 0, 1, 1,
0.09212226, 0.3601216, 0.8818316, 0, 0, 0, 1, 1,
0.09312387, 0.9215025, 0.1780835, 0, 0, 0, 1, 1,
0.09472365, 1.988054, 1.699804, 0, 0, 0, 1, 1,
0.0966725, -0.5212202, 2.172415, 0, 0, 0, 1, 1,
0.100015, -2.018091, 4.266922, 0, 0, 0, 1, 1,
0.1021701, -1.350354, 3.537785, 0, 0, 0, 1, 1,
0.1029559, -0.7952188, 2.664299, 1, 1, 1, 1, 1,
0.1038401, -0.1343812, 2.942517, 1, 1, 1, 1, 1,
0.1053011, -0.6669371, 3.319086, 1, 1, 1, 1, 1,
0.1061877, -0.8731625, 2.724808, 1, 1, 1, 1, 1,
0.1104465, 0.9077236, -0.3386538, 1, 1, 1, 1, 1,
0.114253, -2.182816, 3.746017, 1, 1, 1, 1, 1,
0.1151684, -0.8922039, 3.594425, 1, 1, 1, 1, 1,
0.1156642, -1.814275, 0.9004053, 1, 1, 1, 1, 1,
0.1174136, -1.064103, 3.224183, 1, 1, 1, 1, 1,
0.1221999, -0.07874297, 0.4788665, 1, 1, 1, 1, 1,
0.1266393, 1.040112, 0.4814078, 1, 1, 1, 1, 1,
0.1313196, -0.04357813, 3.273777, 1, 1, 1, 1, 1,
0.1361959, -0.475265, 3.058454, 1, 1, 1, 1, 1,
0.139316, -0.9340032, 3.14546, 1, 1, 1, 1, 1,
0.1417021, -1.256526, 3.197693, 1, 1, 1, 1, 1,
0.1431725, -0.6694207, 4.123414, 0, 0, 1, 1, 1,
0.1436453, -0.6979786, 2.981165, 1, 0, 0, 1, 1,
0.1444122, 0.001298673, 1.756359, 1, 0, 0, 1, 1,
0.144515, -0.486318, 1.95374, 1, 0, 0, 1, 1,
0.145265, -0.4830458, 4.337082, 1, 0, 0, 1, 1,
0.1459371, 1.904892, -0.4308948, 1, 0, 0, 1, 1,
0.1460125, -0.3243541, 3.600265, 0, 0, 0, 1, 1,
0.1482208, -0.6401897, 1.678928, 0, 0, 0, 1, 1,
0.1525651, 0.4399695, -1.434263, 0, 0, 0, 1, 1,
0.1548029, 0.9908231, 2.032037, 0, 0, 0, 1, 1,
0.1560971, -0.5429828, 2.692164, 0, 0, 0, 1, 1,
0.1579154, -0.2552139, 4.025436, 0, 0, 0, 1, 1,
0.1582871, 0.7499583, 0.5596406, 0, 0, 0, 1, 1,
0.1588925, 0.07878826, 1.412978, 1, 1, 1, 1, 1,
0.1683932, 1.462547, -0.03963847, 1, 1, 1, 1, 1,
0.1687738, -1.007679, 3.768894, 1, 1, 1, 1, 1,
0.1706954, -1.518387, 3.318867, 1, 1, 1, 1, 1,
0.1801342, 0.4456101, 2.285853, 1, 1, 1, 1, 1,
0.1839679, 0.6022344, 1.554114, 1, 1, 1, 1, 1,
0.185075, -0.490463, 3.763052, 1, 1, 1, 1, 1,
0.1895635, 0.6708184, -0.5827087, 1, 1, 1, 1, 1,
0.191295, 1.021322, 1.041705, 1, 1, 1, 1, 1,
0.1967743, -0.3101231, 1.944302, 1, 1, 1, 1, 1,
0.2044172, -0.7290863, 2.669565, 1, 1, 1, 1, 1,
0.2080276, 0.4183255, -0.03628023, 1, 1, 1, 1, 1,
0.208526, 0.3102284, 0.8092481, 1, 1, 1, 1, 1,
0.2089361, -0.007710139, 3.349658, 1, 1, 1, 1, 1,
0.2179047, -1.178525, 1.842002, 1, 1, 1, 1, 1,
0.2210998, 0.3823718, 1.049333, 0, 0, 1, 1, 1,
0.2286732, 1.495894, 1.062301, 1, 0, 0, 1, 1,
0.230104, -0.3179637, 1.580395, 1, 0, 0, 1, 1,
0.2332447, 0.7416464, -0.3572842, 1, 0, 0, 1, 1,
0.2362056, -0.6649764, 2.548799, 1, 0, 0, 1, 1,
0.2387193, -0.6123735, 3.684237, 1, 0, 0, 1, 1,
0.2393016, 0.9124637, 0.3349032, 0, 0, 0, 1, 1,
0.2407967, -1.48659, 3.546739, 0, 0, 0, 1, 1,
0.2447757, 0.908848, -0.8857063, 0, 0, 0, 1, 1,
0.249883, 1.058643, -0.6697564, 0, 0, 0, 1, 1,
0.2530541, -0.7671404, 4.198606, 0, 0, 0, 1, 1,
0.257512, -1.246544, 3.369838, 0, 0, 0, 1, 1,
0.2603404, -0.3271957, 1.701656, 0, 0, 0, 1, 1,
0.2603664, -1.231533, 1.575488, 1, 1, 1, 1, 1,
0.262123, -0.6201594, 0.4483513, 1, 1, 1, 1, 1,
0.2629575, 0.3454506, 0.6173635, 1, 1, 1, 1, 1,
0.2664565, 0.8453038, -0.7262865, 1, 1, 1, 1, 1,
0.2698636, 0.1706273, 1.409992, 1, 1, 1, 1, 1,
0.2709854, -0.204583, 2.022501, 1, 1, 1, 1, 1,
0.2737296, 1.632636, -1.211671, 1, 1, 1, 1, 1,
0.2771909, -0.817192, 3.25688, 1, 1, 1, 1, 1,
0.282053, 0.9690722, 0.6160262, 1, 1, 1, 1, 1,
0.2841002, 0.3062495, 0.2650077, 1, 1, 1, 1, 1,
0.2883949, -1.5534, 2.004919, 1, 1, 1, 1, 1,
0.2887433, 0.2257238, 2.313514, 1, 1, 1, 1, 1,
0.2990073, 0.4591301, 1.746203, 1, 1, 1, 1, 1,
0.3024268, -1.190881, 4.185507, 1, 1, 1, 1, 1,
0.3053516, -1.726277, 1.998351, 1, 1, 1, 1, 1,
0.3086918, -0.1161176, 0.8610129, 0, 0, 1, 1, 1,
0.3119617, 0.1444549, 0.5503589, 1, 0, 0, 1, 1,
0.3127, -1.538706, 2.977959, 1, 0, 0, 1, 1,
0.3133922, 0.3537931, -1.29355, 1, 0, 0, 1, 1,
0.3165787, 1.082368, -1.401361, 1, 0, 0, 1, 1,
0.3236027, -1.981072, 3.026926, 1, 0, 0, 1, 1,
0.3241129, -0.6297016, 1.823253, 0, 0, 0, 1, 1,
0.3241698, -0.8219514, 3.562095, 0, 0, 0, 1, 1,
0.3266282, 0.4628556, -0.2840446, 0, 0, 0, 1, 1,
0.3272294, 1.05746, -0.07638587, 0, 0, 0, 1, 1,
0.3318721, 2.020454, -0.07777411, 0, 0, 0, 1, 1,
0.3333603, 0.106351, 1.200341, 0, 0, 0, 1, 1,
0.3354526, 0.6807892, -0.681939, 0, 0, 0, 1, 1,
0.3493744, 0.3749921, 0.802358, 1, 1, 1, 1, 1,
0.3502461, 0.8342559, 2.233714, 1, 1, 1, 1, 1,
0.3514224, 0.8448684, 0.3229832, 1, 1, 1, 1, 1,
0.3588722, -1.393246, 3.353694, 1, 1, 1, 1, 1,
0.3599359, -0.1527833, 3.069449, 1, 1, 1, 1, 1,
0.3662542, 1.493467, 0.5854371, 1, 1, 1, 1, 1,
0.3677721, -0.8898801, 1.998479, 1, 1, 1, 1, 1,
0.3693772, 1.36407, 0.07083387, 1, 1, 1, 1, 1,
0.3727318, 0.5847479, 0.337216, 1, 1, 1, 1, 1,
0.3743477, -0.6633325, 1.68451, 1, 1, 1, 1, 1,
0.3762552, -1.134849, 2.663089, 1, 1, 1, 1, 1,
0.3770203, -0.5595934, 2.359498, 1, 1, 1, 1, 1,
0.3776004, -0.1412443, 2.427204, 1, 1, 1, 1, 1,
0.3816267, -0.6891312, 2.06683, 1, 1, 1, 1, 1,
0.391245, -0.638546, 3.463025, 1, 1, 1, 1, 1,
0.3925952, 0.6487539, 0.4193691, 0, 0, 1, 1, 1,
0.4006771, -0.3611107, 3.446868, 1, 0, 0, 1, 1,
0.404368, -1.86857, 3.243958, 1, 0, 0, 1, 1,
0.4114086, -0.1039116, 1.963164, 1, 0, 0, 1, 1,
0.4165557, 0.9337335, 0.7916144, 1, 0, 0, 1, 1,
0.4168453, 0.7762048, 1.767766, 1, 0, 0, 1, 1,
0.4174244, 0.9113402, 0.8984651, 0, 0, 0, 1, 1,
0.4198495, -1.106602, 2.096944, 0, 0, 0, 1, 1,
0.4227876, -0.08959266, 1.044224, 0, 0, 0, 1, 1,
0.4258601, 1.129066, 0.6673377, 0, 0, 0, 1, 1,
0.4264706, -0.6935066, 1.904222, 0, 0, 0, 1, 1,
0.4265434, -0.8274538, 3.246624, 0, 0, 0, 1, 1,
0.4346517, -0.1690805, 1.152573, 0, 0, 0, 1, 1,
0.4457971, -1.182974, 2.889705, 1, 1, 1, 1, 1,
0.4556229, -0.8814114, 2.752127, 1, 1, 1, 1, 1,
0.4573574, -0.01506214, 1.470922, 1, 1, 1, 1, 1,
0.4583962, 0.5906581, 0.4270799, 1, 1, 1, 1, 1,
0.4596436, -0.8691127, 2.76966, 1, 1, 1, 1, 1,
0.4609722, 0.2381201, -0.3585427, 1, 1, 1, 1, 1,
0.4630308, 2.125141, 0.7372837, 1, 1, 1, 1, 1,
0.4726375, 0.4824085, 0.6756228, 1, 1, 1, 1, 1,
0.4750069, 0.9101089, 0.3529633, 1, 1, 1, 1, 1,
0.4799571, 0.5004168, 1.44054, 1, 1, 1, 1, 1,
0.4807434, -0.3613916, 3.254339, 1, 1, 1, 1, 1,
0.4826767, -0.2862063, 2.006933, 1, 1, 1, 1, 1,
0.4832071, -2.08227, 2.757209, 1, 1, 1, 1, 1,
0.4843323, 0.5690192, 2.791569, 1, 1, 1, 1, 1,
0.4918336, -1.007213, 1.372554, 1, 1, 1, 1, 1,
0.5039302, 0.2668685, 0.5629665, 0, 0, 1, 1, 1,
0.5056021, -0.7801845, 3.472525, 1, 0, 0, 1, 1,
0.5060375, 0.1613539, 2.031615, 1, 0, 0, 1, 1,
0.5126274, 2.15406, -0.7923369, 1, 0, 0, 1, 1,
0.5141349, -1.854523, 2.659204, 1, 0, 0, 1, 1,
0.5149045, 0.1870648, 1.613089, 1, 0, 0, 1, 1,
0.5151166, -0.9968442, 2.906032, 0, 0, 0, 1, 1,
0.5155184, -1.127015, 1.890017, 0, 0, 0, 1, 1,
0.5213392, 0.7906343, 0.7844935, 0, 0, 0, 1, 1,
0.5234545, 1.568842, -1.783918, 0, 0, 0, 1, 1,
0.5327938, 1.237713, -0.1801266, 0, 0, 0, 1, 1,
0.5340315, 0.8535401, 1.596339, 0, 0, 0, 1, 1,
0.5343047, 0.8309789, 1.477793, 0, 0, 0, 1, 1,
0.5367944, -0.7492724, 2.361253, 1, 1, 1, 1, 1,
0.5381797, 1.222387, 2.028292, 1, 1, 1, 1, 1,
0.5444754, 0.6406402, 1.782423, 1, 1, 1, 1, 1,
0.5452508, 0.7865799, 1.311799, 1, 1, 1, 1, 1,
0.547381, 0.2453827, 1.707853, 1, 1, 1, 1, 1,
0.5483522, -1.043694, 2.926086, 1, 1, 1, 1, 1,
0.5557924, -0.8049538, 2.826739, 1, 1, 1, 1, 1,
0.5588247, 0.6612482, 0.764452, 1, 1, 1, 1, 1,
0.5614346, -0.4869385, 2.755444, 1, 1, 1, 1, 1,
0.5617219, 0.3151837, 0.4894208, 1, 1, 1, 1, 1,
0.5684689, 0.7350264, 1.598936, 1, 1, 1, 1, 1,
0.5699147, 1.27721, 2.039267, 1, 1, 1, 1, 1,
0.5730632, -0.3735696, 0.7587879, 1, 1, 1, 1, 1,
0.5735359, -1.052759, 4.082718, 1, 1, 1, 1, 1,
0.5813779, -1.322093, 2.743221, 1, 1, 1, 1, 1,
0.5853472, 0.6442019, 0.04509161, 0, 0, 1, 1, 1,
0.585474, -1.081921, 2.302757, 1, 0, 0, 1, 1,
0.5855734, -0.8560538, 3.051857, 1, 0, 0, 1, 1,
0.5874739, 0.4554695, 1.091597, 1, 0, 0, 1, 1,
0.5906281, 0.2800339, -0.3394903, 1, 0, 0, 1, 1,
0.593631, 0.8708424, 1.41959, 1, 0, 0, 1, 1,
0.5958177, 1.255035, 1.103927, 0, 0, 0, 1, 1,
0.5988324, -0.08796586, 2.072827, 0, 0, 0, 1, 1,
0.6012945, 2.07513, 0.02967912, 0, 0, 0, 1, 1,
0.6054228, 0.4534233, 0.0537043, 0, 0, 0, 1, 1,
0.6061814, -2.003356, 3.791583, 0, 0, 0, 1, 1,
0.6066868, -0.06404322, 2.156775, 0, 0, 0, 1, 1,
0.6087918, 0.6627123, 0.7624486, 0, 0, 0, 1, 1,
0.6106784, 0.1791515, 2.478393, 1, 1, 1, 1, 1,
0.6135188, 1.085171, -0.8221515, 1, 1, 1, 1, 1,
0.6152241, -0.1696138, 0.653978, 1, 1, 1, 1, 1,
0.6170262, -0.07731064, 1.481039, 1, 1, 1, 1, 1,
0.6198328, -0.2181364, 1.015668, 1, 1, 1, 1, 1,
0.6236256, 0.7047265, 0.7985119, 1, 1, 1, 1, 1,
0.6239095, -1.186955, 2.420048, 1, 1, 1, 1, 1,
0.6300827, 0.3953207, 1.385731, 1, 1, 1, 1, 1,
0.6331788, 1.173488, 0.2692371, 1, 1, 1, 1, 1,
0.6341928, 0.9704667, -0.9720872, 1, 1, 1, 1, 1,
0.6351634, -0.4189475, 4.238102, 1, 1, 1, 1, 1,
0.6364868, 0.01148937, 0.9210893, 1, 1, 1, 1, 1,
0.6405874, -0.5729203, 3.80535, 1, 1, 1, 1, 1,
0.6445711, -1.329929, 3.368736, 1, 1, 1, 1, 1,
0.6471214, 0.4421748, 1.799117, 1, 1, 1, 1, 1,
0.653493, 0.08337904, 2.754454, 0, 0, 1, 1, 1,
0.6557104, -0.596128, 3.837145, 1, 0, 0, 1, 1,
0.6559322, -0.5817475, 4.211695, 1, 0, 0, 1, 1,
0.6583106, 0.4823049, 0.472088, 1, 0, 0, 1, 1,
0.6590602, 0.4749777, 1.243224, 1, 0, 0, 1, 1,
0.6645337, -1.622437, 4.211046, 1, 0, 0, 1, 1,
0.6650491, 0.6318868, 1.92286, 0, 0, 0, 1, 1,
0.6666883, -0.416976, 2.940057, 0, 0, 0, 1, 1,
0.6811749, -0.1198684, 1.572813, 0, 0, 0, 1, 1,
0.6812858, -0.3607556, 2.156708, 0, 0, 0, 1, 1,
0.6849054, -0.3480866, 0.7566788, 0, 0, 0, 1, 1,
0.6860985, 1.27417, 0.5534908, 0, 0, 0, 1, 1,
0.689672, -1.646871, 2.164941, 0, 0, 0, 1, 1,
0.6925375, -2.026743, 3.660263, 1, 1, 1, 1, 1,
0.6971472, -0.8223238, 1.783559, 1, 1, 1, 1, 1,
0.6980949, 1.076648, -0.2628082, 1, 1, 1, 1, 1,
0.6983942, 0.9504089, 1.511071, 1, 1, 1, 1, 1,
0.7006097, -0.6487324, 1.713519, 1, 1, 1, 1, 1,
0.7023931, 1.723541, -0.8756602, 1, 1, 1, 1, 1,
0.7033949, -0.1808877, 1.849831, 1, 1, 1, 1, 1,
0.7042444, 0.5758191, 0.8995866, 1, 1, 1, 1, 1,
0.7058153, 1.618424, 2.575755, 1, 1, 1, 1, 1,
0.7069215, -0.5513251, 2.292663, 1, 1, 1, 1, 1,
0.7070336, -0.9620211, 2.699548, 1, 1, 1, 1, 1,
0.7101979, -1.609943, 2.401849, 1, 1, 1, 1, 1,
0.7137659, 0.1353237, -0.3034557, 1, 1, 1, 1, 1,
0.7192494, -1.59613, 3.037485, 1, 1, 1, 1, 1,
0.7208962, 1.309516, 1.419782, 1, 1, 1, 1, 1,
0.7363859, 0.460993, -0.6573832, 0, 0, 1, 1, 1,
0.7421212, -0.3705178, 1.624833, 1, 0, 0, 1, 1,
0.7433679, -0.07351422, 1.767732, 1, 0, 0, 1, 1,
0.7449898, -0.4706514, 2.140605, 1, 0, 0, 1, 1,
0.7460862, 0.1206259, 1.209935, 1, 0, 0, 1, 1,
0.7503552, 1.74115, 1.004654, 1, 0, 0, 1, 1,
0.7529762, 1.185375, -0.7797479, 0, 0, 0, 1, 1,
0.7536954, 0.9739692, 0.1334758, 0, 0, 0, 1, 1,
0.7573802, -1.423693, 3.120054, 0, 0, 0, 1, 1,
0.7587324, -0.1325985, 1.81127, 0, 0, 0, 1, 1,
0.7608291, -0.2934528, 2.133798, 0, 0, 0, 1, 1,
0.7622065, -0.1225846, 2.362666, 0, 0, 0, 1, 1,
0.7626684, 0.833836, -0.2042659, 0, 0, 0, 1, 1,
0.7628969, -1.744776, 3.279383, 1, 1, 1, 1, 1,
0.7648023, 0.1884755, 2.25091, 1, 1, 1, 1, 1,
0.7675931, 1.328521, 0.04883864, 1, 1, 1, 1, 1,
0.7719437, 0.2801517, 2.482104, 1, 1, 1, 1, 1,
0.7769721, -1.028057, 2.026372, 1, 1, 1, 1, 1,
0.7772299, 0.7617458, -0.6183475, 1, 1, 1, 1, 1,
0.780198, 1.871032, 0.4567207, 1, 1, 1, 1, 1,
0.7810572, -0.5800952, 1.257938, 1, 1, 1, 1, 1,
0.7875111, -1.264052, 3.26054, 1, 1, 1, 1, 1,
0.7960182, -1.530595, 2.776515, 1, 1, 1, 1, 1,
0.7980776, 0.769743, -0.4972333, 1, 1, 1, 1, 1,
0.7989128, -1.534213, 5.487547, 1, 1, 1, 1, 1,
0.8014866, -1.635249, 2.164529, 1, 1, 1, 1, 1,
0.8050621, 0.2832854, -0.02013429, 1, 1, 1, 1, 1,
0.8079872, 0.7429652, 0.7045519, 1, 1, 1, 1, 1,
0.8094056, -0.7009369, 2.329544, 0, 0, 1, 1, 1,
0.8108746, -2.567749, 2.323891, 1, 0, 0, 1, 1,
0.8124887, 1.659598, -1.381118, 1, 0, 0, 1, 1,
0.817424, -0.1760596, 2.911069, 1, 0, 0, 1, 1,
0.8231637, 0.5650143, 2.0991, 1, 0, 0, 1, 1,
0.825007, -1.103525, 1.71158, 1, 0, 0, 1, 1,
0.826548, 0.8343517, 2.218618, 0, 0, 0, 1, 1,
0.8298371, 0.2985206, 0.7149277, 0, 0, 0, 1, 1,
0.8335634, 0.9415532, 2.764313, 0, 0, 0, 1, 1,
0.8349652, 0.541168, 3.869038, 0, 0, 0, 1, 1,
0.8377712, 1.760895, 0.1223643, 0, 0, 0, 1, 1,
0.8378969, 0.943337, 1.020864, 0, 0, 0, 1, 1,
0.8382277, 3.0302, 0.1501903, 0, 0, 0, 1, 1,
0.8394124, -0.2506781, 1.660538, 1, 1, 1, 1, 1,
0.8434196, -1.329006, 3.346809, 1, 1, 1, 1, 1,
0.8439913, -0.7209214, -0.02212225, 1, 1, 1, 1, 1,
0.8447928, -0.4475239, 2.604995, 1, 1, 1, 1, 1,
0.8448249, 0.4761188, 1.263439, 1, 1, 1, 1, 1,
0.8512032, 0.6445845, 0.9796788, 1, 1, 1, 1, 1,
0.8531607, 0.1173338, 0.4486732, 1, 1, 1, 1, 1,
0.8538541, 1.49799, 0.388362, 1, 1, 1, 1, 1,
0.8542522, 0.707656, 0.9791653, 1, 1, 1, 1, 1,
0.8558397, -0.01037095, 2.257124, 1, 1, 1, 1, 1,
0.8561431, -1.390648, 4.738805, 1, 1, 1, 1, 1,
0.8618701, -2.212224, 2.919484, 1, 1, 1, 1, 1,
0.8623155, 0.3105468, 1.271773, 1, 1, 1, 1, 1,
0.8649238, -0.8184122, 1.18146, 1, 1, 1, 1, 1,
0.8683032, 1.012192, -0.4934603, 1, 1, 1, 1, 1,
0.875772, -0.624792, 1.914553, 0, 0, 1, 1, 1,
0.8763882, -0.2823133, 1.146054, 1, 0, 0, 1, 1,
0.8857203, 0.2904268, 0.5124571, 1, 0, 0, 1, 1,
0.8951019, 1.769012, 0.1467543, 1, 0, 0, 1, 1,
0.8968009, -0.4212735, 4.169717, 1, 0, 0, 1, 1,
0.9039748, -0.1406992, 2.191884, 1, 0, 0, 1, 1,
0.9059466, 1.123217, 1.892185, 0, 0, 0, 1, 1,
0.9126285, -0.1543842, 3.288867, 0, 0, 0, 1, 1,
0.913382, 0.5928481, 1.412381, 0, 0, 0, 1, 1,
0.9214039, -0.5330405, 0.4109168, 0, 0, 0, 1, 1,
0.9224172, 0.7835658, 1.003771, 0, 0, 0, 1, 1,
0.9282961, -0.6079062, 3.002908, 0, 0, 0, 1, 1,
0.9294711, 0.4396217, 1.260982, 0, 0, 0, 1, 1,
0.9357966, -0.5637204, 2.669803, 1, 1, 1, 1, 1,
0.9439699, -0.1623837, 2.554071, 1, 1, 1, 1, 1,
0.9481445, 2.289717, -1.356608, 1, 1, 1, 1, 1,
0.9512229, 0.8465222, 1.672646, 1, 1, 1, 1, 1,
0.9559891, -0.1727307, 1.117699, 1, 1, 1, 1, 1,
0.9567138, 0.004589065, -0.5793735, 1, 1, 1, 1, 1,
0.9580008, 0.2135863, 0.7575457, 1, 1, 1, 1, 1,
0.9630791, 1.222047, 0.2630742, 1, 1, 1, 1, 1,
0.9686881, 0.8132798, -0.4250356, 1, 1, 1, 1, 1,
0.9733425, 0.1633731, -0.3271325, 1, 1, 1, 1, 1,
0.9752162, 0.4306174, 1.771133, 1, 1, 1, 1, 1,
0.9838809, -0.09383353, 2.57933, 1, 1, 1, 1, 1,
0.9840974, -0.7394962, 2.516492, 1, 1, 1, 1, 1,
0.9850718, 0.07646369, 2.9639, 1, 1, 1, 1, 1,
0.9917637, -0.4842505, -0.4491881, 1, 1, 1, 1, 1,
0.9951882, 0.9175987, -0.342336, 0, 0, 1, 1, 1,
0.9956571, -0.7325149, 1.624493, 1, 0, 0, 1, 1,
1.001058, 0.0549982, 1.029698, 1, 0, 0, 1, 1,
1.00598, -1.376112, 1.331857, 1, 0, 0, 1, 1,
1.006952, -1.676429, 2.200444, 1, 0, 0, 1, 1,
1.018872, 0.7355567, 1.500788, 1, 0, 0, 1, 1,
1.019993, 0.4360794, 0.4940494, 0, 0, 0, 1, 1,
1.020271, -0.3420261, 2.143583, 0, 0, 0, 1, 1,
1.026513, -0.3523715, 2.19943, 0, 0, 0, 1, 1,
1.027075, -0.8183286, 0.9451184, 0, 0, 0, 1, 1,
1.033972, 1.839514, 0.3787135, 0, 0, 0, 1, 1,
1.037553, 0.2804658, 0.8579156, 0, 0, 0, 1, 1,
1.043374, -0.09874413, 0.4089855, 0, 0, 0, 1, 1,
1.05878, -0.5196539, 1.423896, 1, 1, 1, 1, 1,
1.067542, 0.7837776, 1.375262, 1, 1, 1, 1, 1,
1.072886, 1.395645, 0.5552403, 1, 1, 1, 1, 1,
1.077005, 0.1771358, 2.324482, 1, 1, 1, 1, 1,
1.083663, -1.259094, 4.501424, 1, 1, 1, 1, 1,
1.088413, -1.057625, 1.017965, 1, 1, 1, 1, 1,
1.092933, -0.5589523, 1.905036, 1, 1, 1, 1, 1,
1.092945, -0.9257878, 2.771519, 1, 1, 1, 1, 1,
1.093685, 1.384124, 1.370011, 1, 1, 1, 1, 1,
1.105766, -0.1928913, 1.876382, 1, 1, 1, 1, 1,
1.105894, -1.262077, 2.259091, 1, 1, 1, 1, 1,
1.109283, 0.5356538, 1.842523, 1, 1, 1, 1, 1,
1.114069, 1.14981, 0.5494711, 1, 1, 1, 1, 1,
1.116848, 0.4101705, 2.016976, 1, 1, 1, 1, 1,
1.122181, 0.4461247, 0.6397597, 1, 1, 1, 1, 1,
1.123439, -0.05215452, 0.01779639, 0, 0, 1, 1, 1,
1.125112, 1.861049, 1.385981, 1, 0, 0, 1, 1,
1.13061, -0.3926658, 1.047135, 1, 0, 0, 1, 1,
1.133229, 1.538003, 2.378456, 1, 0, 0, 1, 1,
1.133521, -0.1949188, 2.813823, 1, 0, 0, 1, 1,
1.143842, -1.188676, 4.49992, 1, 0, 0, 1, 1,
1.158413, 1.327242, -0.531239, 0, 0, 0, 1, 1,
1.160753, 2.168363, 0.8234776, 0, 0, 0, 1, 1,
1.172027, 1.903923, -1.949352, 0, 0, 0, 1, 1,
1.178345, 0.1950871, 1.107518, 0, 0, 0, 1, 1,
1.178974, -0.6162166, 3.543477, 0, 0, 0, 1, 1,
1.181005, 0.9538475, 0.4348687, 0, 0, 0, 1, 1,
1.181055, 0.2829869, 0.8355842, 0, 0, 0, 1, 1,
1.181828, 0.354335, 1.69418, 1, 1, 1, 1, 1,
1.183815, -1.549322, 1.33186, 1, 1, 1, 1, 1,
1.186235, 0.02185841, 1.179708, 1, 1, 1, 1, 1,
1.186708, -1.607655, 1.602475, 1, 1, 1, 1, 1,
1.186966, 0.2245685, 0.4193829, 1, 1, 1, 1, 1,
1.190875, 0.8649578, 2.1157, 1, 1, 1, 1, 1,
1.192253, -0.05276069, -0.7700383, 1, 1, 1, 1, 1,
1.195904, 0.03554433, 2.585786, 1, 1, 1, 1, 1,
1.197837, -1.592859, 5.186027, 1, 1, 1, 1, 1,
1.198933, -0.9181463, 1.877419, 1, 1, 1, 1, 1,
1.202101, 0.4512436, 1.125605, 1, 1, 1, 1, 1,
1.221407, 0.5205837, 0.07354711, 1, 1, 1, 1, 1,
1.222782, 1.292066, -0.2748373, 1, 1, 1, 1, 1,
1.223167, -0.5198201, 1.601303, 1, 1, 1, 1, 1,
1.223739, -0.7827951, 1.763707, 1, 1, 1, 1, 1,
1.226483, -0.5070795, 2.503074, 0, 0, 1, 1, 1,
1.234994, -1.123108, 3.051579, 1, 0, 0, 1, 1,
1.235685, -0.1310128, 3.358194, 1, 0, 0, 1, 1,
1.238592, -0.5351222, 2.547564, 1, 0, 0, 1, 1,
1.240253, -0.5003471, 3.466236, 1, 0, 0, 1, 1,
1.247053, -1.093491, 1.939196, 1, 0, 0, 1, 1,
1.249978, 0.8314369, 1.342925, 0, 0, 0, 1, 1,
1.26045, -1.728854, 3.547172, 0, 0, 0, 1, 1,
1.265467, -0.5414876, 3.550501, 0, 0, 0, 1, 1,
1.268805, -0.5052901, 2.354044, 0, 0, 0, 1, 1,
1.27272, 0.5399143, 1.681474, 0, 0, 0, 1, 1,
1.275586, -2.291513, 3.734843, 0, 0, 0, 1, 1,
1.28353, 0.2375856, 2.146158, 0, 0, 0, 1, 1,
1.283639, -0.3375492, 1.626674, 1, 1, 1, 1, 1,
1.299752, -1.284206, 2.350159, 1, 1, 1, 1, 1,
1.30284, 0.4196312, 2.709619, 1, 1, 1, 1, 1,
1.311378, 1.18689, 0.9444906, 1, 1, 1, 1, 1,
1.313995, -0.4226145, 1.221051, 1, 1, 1, 1, 1,
1.31595, -0.624885, 2.891613, 1, 1, 1, 1, 1,
1.318778, 0.1403564, 2.609309, 1, 1, 1, 1, 1,
1.321185, 0.09832249, 0.7357785, 1, 1, 1, 1, 1,
1.323685, 0.2727862, 2.065558, 1, 1, 1, 1, 1,
1.323799, 0.7914581, 0.1793512, 1, 1, 1, 1, 1,
1.324261, -1.695932, 2.555936, 1, 1, 1, 1, 1,
1.333175, 0.7510738, 0.8967552, 1, 1, 1, 1, 1,
1.384294, -0.4316863, 3.57857, 1, 1, 1, 1, 1,
1.390818, -1.269246, 1.80144, 1, 1, 1, 1, 1,
1.398652, -1.065982, 2.869252, 1, 1, 1, 1, 1,
1.401275, -0.1828073, 0.2079344, 0, 0, 1, 1, 1,
1.406236, -0.1393991, 0.4943253, 1, 0, 0, 1, 1,
1.41618, -1.202223, 1.701498, 1, 0, 0, 1, 1,
1.423543, -0.3060458, 2.575628, 1, 0, 0, 1, 1,
1.429542, 0.1008891, 1.172953, 1, 0, 0, 1, 1,
1.434581, 1.049196, 0.717485, 1, 0, 0, 1, 1,
1.440071, 0.8046122, -0.02855541, 0, 0, 0, 1, 1,
1.4778, 0.7880085, -0.2635473, 0, 0, 0, 1, 1,
1.498256, 1.495993, 2.243311, 0, 0, 0, 1, 1,
1.499278, -1.16945, 2.01207, 0, 0, 0, 1, 1,
1.499368, 0.090634, 2.116489, 0, 0, 0, 1, 1,
1.50219, -1.803065, 3.346798, 0, 0, 0, 1, 1,
1.503974, 1.125633, 0.210316, 0, 0, 0, 1, 1,
1.507555, -0.5826803, 1.300508, 1, 1, 1, 1, 1,
1.51098, -0.4523095, 2.960574, 1, 1, 1, 1, 1,
1.512365, -0.7126374, 0.8779973, 1, 1, 1, 1, 1,
1.552367, -1.672669, 2.455356, 1, 1, 1, 1, 1,
1.578566, 1.384795, 2.327029, 1, 1, 1, 1, 1,
1.582651, 0.08099754, 1.313675, 1, 1, 1, 1, 1,
1.586324, 0.5540255, 0.8823161, 1, 1, 1, 1, 1,
1.593969, -0.1757078, 2.439047, 1, 1, 1, 1, 1,
1.597365, 1.649572, 0.7190425, 1, 1, 1, 1, 1,
1.599239, -0.1541546, 3.181118, 1, 1, 1, 1, 1,
1.603097, 0.4991199, -0.0710328, 1, 1, 1, 1, 1,
1.603664, -1.050702, 2.812833, 1, 1, 1, 1, 1,
1.62419, 1.212129, 0.9854497, 1, 1, 1, 1, 1,
1.633156, 0.9854268, -0.440977, 1, 1, 1, 1, 1,
1.649317, 0.6565954, -0.04279187, 1, 1, 1, 1, 1,
1.661132, 0.8038831, 1.985236, 0, 0, 1, 1, 1,
1.669447, -0.01123344, 2.590539, 1, 0, 0, 1, 1,
1.686209, -1.471677, 2.644665, 1, 0, 0, 1, 1,
1.687983, -0.7767152, 2.195228, 1, 0, 0, 1, 1,
1.699434, 0.5456611, -0.3118308, 1, 0, 0, 1, 1,
1.709309, -1.005969, 0.3626643, 1, 0, 0, 1, 1,
1.712625, -0.3982523, 3.155268, 0, 0, 0, 1, 1,
1.751574, -0.2161118, 3.162995, 0, 0, 0, 1, 1,
1.78064, -1.187669, 3.927486, 0, 0, 0, 1, 1,
1.798529, -1.312846, 0.7812194, 0, 0, 0, 1, 1,
1.809678, -2.232361, 3.197616, 0, 0, 0, 1, 1,
1.810604, -1.042706, 2.332054, 0, 0, 0, 1, 1,
1.810769, 1.830046, 0.2106438, 0, 0, 0, 1, 1,
1.827658, 1.726389, 1.128685, 1, 1, 1, 1, 1,
1.829562, 0.4696276, 2.435888, 1, 1, 1, 1, 1,
1.83246, 0.2331948, 3.368949, 1, 1, 1, 1, 1,
1.832525, -0.9647822, 2.036285, 1, 1, 1, 1, 1,
1.833474, 0.6571187, 0.5246667, 1, 1, 1, 1, 1,
1.846229, 2.741355, 0.607313, 1, 1, 1, 1, 1,
1.847017, -0.3450901, 1.207942, 1, 1, 1, 1, 1,
1.865471, -1.086651, 2.568757, 1, 1, 1, 1, 1,
1.90813, -1.1694, 3.086937, 1, 1, 1, 1, 1,
1.985987, -1.148122, 2.640805, 1, 1, 1, 1, 1,
2.004691, 0.5933267, 1.473837, 1, 1, 1, 1, 1,
2.016048, -0.5899196, 1.763589, 1, 1, 1, 1, 1,
2.025245, -0.8201841, 2.681834, 1, 1, 1, 1, 1,
2.02967, 0.4687721, -0.9103707, 1, 1, 1, 1, 1,
2.043272, 1.214673, 2.164481, 1, 1, 1, 1, 1,
2.056716, -0.07890069, 0.9273227, 0, 0, 1, 1, 1,
2.063127, 0.1663808, 1.884573, 1, 0, 0, 1, 1,
2.085191, 0.2003692, 0.4823886, 1, 0, 0, 1, 1,
2.114894, 1.259751, 2.876121, 1, 0, 0, 1, 1,
2.131231, -0.337923, 2.231387, 1, 0, 0, 1, 1,
2.212177, 0.01548421, 0.1115326, 1, 0, 0, 1, 1,
2.212682, -1.305289, 1.420369, 0, 0, 0, 1, 1,
2.227829, -0.3935929, 1.529746, 0, 0, 0, 1, 1,
2.264289, -2.408393, 1.175911, 0, 0, 0, 1, 1,
2.312597, -1.050001, 0.9458049, 0, 0, 0, 1, 1,
2.385254, -1.568652, 2.674508, 0, 0, 0, 1, 1,
2.385518, 0.152639, 3.052515, 0, 0, 0, 1, 1,
2.428038, -0.8923543, 3.659055, 0, 0, 0, 1, 1,
2.435408, 0.2726726, 0.402938, 1, 1, 1, 1, 1,
2.449167, 1.186647, 2.383332, 1, 1, 1, 1, 1,
2.545864, 0.7561341, 2.395625, 1, 1, 1, 1, 1,
2.56251, -0.3931807, 0.7762798, 1, 1, 1, 1, 1,
2.784958, 0.8448434, 0.02816318, 1, 1, 1, 1, 1,
2.816352, 0.03152095, 2.760354, 1, 1, 1, 1, 1,
3.213311, -0.4624045, 2.583863, 1, 1, 1, 1, 1
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
var radius = 9.609594;
var distance = 33.75329;
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
mvMatrix.translate( 0.05304456, -0.1603329, 0.08055282 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75329);
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
