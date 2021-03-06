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
-3.49291, 2.016985, -3.004125, 1, 0, 0, 1,
-3.002728, -0.3842328, -0.3747168, 1, 0.007843138, 0, 1,
-3.000389, 1.117792, -1.170007, 1, 0.01176471, 0, 1,
-2.824696, -0.2377245, -2.078006, 1, 0.01960784, 0, 1,
-2.774527, 0.9403831, -1.467972, 1, 0.02352941, 0, 1,
-2.759073, 0.2231117, -3.169619, 1, 0.03137255, 0, 1,
-2.58169, 0.1622225, -0.27505, 1, 0.03529412, 0, 1,
-2.572133, 1.773275, -0.6490794, 1, 0.04313726, 0, 1,
-2.522331, -0.8067048, -1.778184, 1, 0.04705882, 0, 1,
-2.510031, 0.2925424, -1.340322, 1, 0.05490196, 0, 1,
-2.453026, 0.9701549, -1.508619, 1, 0.05882353, 0, 1,
-2.305005, -1.439563, -3.343519, 1, 0.06666667, 0, 1,
-2.296679, 0.5910169, -1.023468, 1, 0.07058824, 0, 1,
-2.283402, 0.7401904, -1.595634, 1, 0.07843138, 0, 1,
-2.282146, -0.7055896, -1.848415, 1, 0.08235294, 0, 1,
-2.2565, -0.3935474, 0.5723252, 1, 0.09019608, 0, 1,
-2.254889, 0.07713136, -0.5567228, 1, 0.09411765, 0, 1,
-2.219155, 1.354314, -0.3501553, 1, 0.1019608, 0, 1,
-2.179609, 1.415028, -0.9354246, 1, 0.1098039, 0, 1,
-2.177935, 0.7459985, -0.6039035, 1, 0.1137255, 0, 1,
-2.139804, -0.6712615, -1.638559, 1, 0.1215686, 0, 1,
-2.126382, 1.056014, -2.255243, 1, 0.1254902, 0, 1,
-2.109114, 0.7977186, -0.5135363, 1, 0.1333333, 0, 1,
-2.108359, 0.3663972, 0.1020618, 1, 0.1372549, 0, 1,
-2.081854, -1.325434, -1.370715, 1, 0.145098, 0, 1,
-2.049292, 1.656906, -1.263354, 1, 0.1490196, 0, 1,
-2.015568, 1.105606, -0.3231483, 1, 0.1568628, 0, 1,
-1.99003, 2.363314, -0.6808349, 1, 0.1607843, 0, 1,
-1.98848, -0.389835, -0.4624466, 1, 0.1686275, 0, 1,
-1.95323, 0.9180135, 0.2378433, 1, 0.172549, 0, 1,
-1.95258, 1.024271, -3.610902, 1, 0.1803922, 0, 1,
-1.939435, 1.497998, -2.321601, 1, 0.1843137, 0, 1,
-1.932977, 2.062144, -0.4902104, 1, 0.1921569, 0, 1,
-1.89759, 0.7132863, -0.6222789, 1, 0.1960784, 0, 1,
-1.892977, -1.022456, -1.696522, 1, 0.2039216, 0, 1,
-1.860978, 1.068771, 0.7442194, 1, 0.2117647, 0, 1,
-1.859971, 0.3637203, -0.3581444, 1, 0.2156863, 0, 1,
-1.844513, -0.1188046, -1.952656, 1, 0.2235294, 0, 1,
-1.840297, 1.40137, 0.408583, 1, 0.227451, 0, 1,
-1.825852, 0.626343, -1.919125, 1, 0.2352941, 0, 1,
-1.815586, -0.1266393, -2.487576, 1, 0.2392157, 0, 1,
-1.815044, -0.6740335, -1.164401, 1, 0.2470588, 0, 1,
-1.814777, -1.719941, -3.179557, 1, 0.2509804, 0, 1,
-1.80582, -0.1216402, -0.9182082, 1, 0.2588235, 0, 1,
-1.763676, 1.506012, -0.5699027, 1, 0.2627451, 0, 1,
-1.742124, -0.251288, -1.961839, 1, 0.2705882, 0, 1,
-1.739473, 0.9269099, -1.312683, 1, 0.2745098, 0, 1,
-1.707203, -0.7783883, -1.408706, 1, 0.282353, 0, 1,
-1.704358, -0.9100535, -2.240889, 1, 0.2862745, 0, 1,
-1.697521, 0.1020658, -1.828892, 1, 0.2941177, 0, 1,
-1.693808, 0.8103237, -1.259706, 1, 0.3019608, 0, 1,
-1.686163, 0.7735645, 0.05268239, 1, 0.3058824, 0, 1,
-1.676207, -0.2926629, -1.74849, 1, 0.3137255, 0, 1,
-1.66707, 1.884689, -0.1649411, 1, 0.3176471, 0, 1,
-1.664469, -1.635187, -2.142791, 1, 0.3254902, 0, 1,
-1.653932, -0.42224, -1.883077, 1, 0.3294118, 0, 1,
-1.651265, 0.2686229, -1.738324, 1, 0.3372549, 0, 1,
-1.632693, -0.3804395, -1.003118, 1, 0.3411765, 0, 1,
-1.63118, 0.3756355, 0.1489963, 1, 0.3490196, 0, 1,
-1.593285, 0.2781539, -1.276809, 1, 0.3529412, 0, 1,
-1.590154, 1.000586, -1.721462, 1, 0.3607843, 0, 1,
-1.574423, -2.591045, -2.070217, 1, 0.3647059, 0, 1,
-1.566378, -0.1270998, -0.9993795, 1, 0.372549, 0, 1,
-1.564883, 0.8847927, 0.9911574, 1, 0.3764706, 0, 1,
-1.564122, 0.4231568, -3.510462, 1, 0.3843137, 0, 1,
-1.563488, 0.6584867, -1.067991, 1, 0.3882353, 0, 1,
-1.550096, -0.6287081, -1.707631, 1, 0.3960784, 0, 1,
-1.531478, -1.589889, -1.624913, 1, 0.4039216, 0, 1,
-1.525302, 0.5526556, -0.2009417, 1, 0.4078431, 0, 1,
-1.510873, -0.1394981, -4.007915, 1, 0.4156863, 0, 1,
-1.504692, -0.1071815, -3.086337, 1, 0.4196078, 0, 1,
-1.497424, 0.2455243, -1.191959, 1, 0.427451, 0, 1,
-1.486206, -0.03860193, -2.166292, 1, 0.4313726, 0, 1,
-1.481696, -2.277131, -2.575193, 1, 0.4392157, 0, 1,
-1.467287, 0.09018623, -0.9107057, 1, 0.4431373, 0, 1,
-1.451731, 0.2871644, -1.272619, 1, 0.4509804, 0, 1,
-1.446396, -0.1370051, -0.6380099, 1, 0.454902, 0, 1,
-1.438205, 0.2544229, -1.899123, 1, 0.4627451, 0, 1,
-1.421583, 0.5219191, -0.9925573, 1, 0.4666667, 0, 1,
-1.42157, -0.4738093, -3.400055, 1, 0.4745098, 0, 1,
-1.419002, -2.582486, -3.121801, 1, 0.4784314, 0, 1,
-1.406719, -1.643635, -2.53813, 1, 0.4862745, 0, 1,
-1.406659, -0.3967564, 0.03509118, 1, 0.4901961, 0, 1,
-1.402907, 2.836205, -0.8082726, 1, 0.4980392, 0, 1,
-1.392585, 1.375943, 0.671196, 1, 0.5058824, 0, 1,
-1.381358, 2.123264, -2.474432, 1, 0.509804, 0, 1,
-1.375422, -1.188111, -1.768621, 1, 0.5176471, 0, 1,
-1.370294, 0.05206082, -2.513629, 1, 0.5215687, 0, 1,
-1.369483, -0.4463508, -1.933061, 1, 0.5294118, 0, 1,
-1.365118, -0.732353, -1.008618, 1, 0.5333334, 0, 1,
-1.348057, -0.3136647, -2.499897, 1, 0.5411765, 0, 1,
-1.344218, -0.0499969, -1.395684, 1, 0.5450981, 0, 1,
-1.343192, -0.4527985, -3.713181, 1, 0.5529412, 0, 1,
-1.321246, 0.9227051, -1.124912, 1, 0.5568628, 0, 1,
-1.314142, 0.7345383, -2.28469, 1, 0.5647059, 0, 1,
-1.313258, 0.8053146, -1.367377, 1, 0.5686275, 0, 1,
-1.310078, 0.3535678, -0.5188527, 1, 0.5764706, 0, 1,
-1.301279, -1.12773, -3.238619, 1, 0.5803922, 0, 1,
-1.30025, -0.9790798, -2.284425, 1, 0.5882353, 0, 1,
-1.295415, -0.5370617, -1.702339, 1, 0.5921569, 0, 1,
-1.288213, -0.1636511, -2.161413, 1, 0.6, 0, 1,
-1.281546, 2.000867, -0.5260041, 1, 0.6078432, 0, 1,
-1.280372, 1.474647, -1.122944, 1, 0.6117647, 0, 1,
-1.270699, 1.794354, -1.713439, 1, 0.6196079, 0, 1,
-1.262528, -0.4639218, -1.614939, 1, 0.6235294, 0, 1,
-1.261826, -1.763962, -2.372483, 1, 0.6313726, 0, 1,
-1.253708, -1.610997, -2.033415, 1, 0.6352941, 0, 1,
-1.24775, -0.8142658, -1.196367, 1, 0.6431373, 0, 1,
-1.245869, 0.2123626, -1.407429, 1, 0.6470588, 0, 1,
-1.240963, 0.2852062, -1.624497, 1, 0.654902, 0, 1,
-1.237105, 0.6438549, -0.8002861, 1, 0.6588235, 0, 1,
-1.226577, -0.3363356, -1.501793, 1, 0.6666667, 0, 1,
-1.213265, 0.4047908, 0.2644715, 1, 0.6705883, 0, 1,
-1.213189, 0.2089652, -0.6179172, 1, 0.6784314, 0, 1,
-1.207246, 1.013926, -1.20343, 1, 0.682353, 0, 1,
-1.205236, 0.4049736, -0.8262264, 1, 0.6901961, 0, 1,
-1.198149, -2.318242, -2.217698, 1, 0.6941177, 0, 1,
-1.197744, 0.3774777, -1.051657, 1, 0.7019608, 0, 1,
-1.193475, -0.3546745, -2.566734, 1, 0.7098039, 0, 1,
-1.190251, 0.6256204, 0.00324488, 1, 0.7137255, 0, 1,
-1.18768, 0.984579, 0.08088158, 1, 0.7215686, 0, 1,
-1.185175, -2.21415, -2.156923, 1, 0.7254902, 0, 1,
-1.184554, -0.6281003, -0.8331622, 1, 0.7333333, 0, 1,
-1.180467, -1.395383, -1.89187, 1, 0.7372549, 0, 1,
-1.179187, 1.44113, -1.786865, 1, 0.7450981, 0, 1,
-1.175739, 0.1029131, -0.6951389, 1, 0.7490196, 0, 1,
-1.175075, -0.5588359, -0.1804228, 1, 0.7568628, 0, 1,
-1.171781, 0.001635994, -2.079909, 1, 0.7607843, 0, 1,
-1.162006, 0.4385124, -2.427225, 1, 0.7686275, 0, 1,
-1.156746, 0.6714794, 0.4688618, 1, 0.772549, 0, 1,
-1.155638, -1.765042, -1.964485, 1, 0.7803922, 0, 1,
-1.152992, 0.04371065, -2.204501, 1, 0.7843137, 0, 1,
-1.150711, 1.215753, 1.084898, 1, 0.7921569, 0, 1,
-1.143562, -1.691625, -2.624828, 1, 0.7960784, 0, 1,
-1.139743, -0.8370874, -0.3422726, 1, 0.8039216, 0, 1,
-1.131429, -0.258507, -0.9999906, 1, 0.8117647, 0, 1,
-1.127728, -2.41424, -2.990339, 1, 0.8156863, 0, 1,
-1.127355, 1.682351, 0.6806564, 1, 0.8235294, 0, 1,
-1.126519, 1.407103, -1.496308, 1, 0.827451, 0, 1,
-1.125429, 1.705554, -0.7442256, 1, 0.8352941, 0, 1,
-1.125414, -1.15815, -5.002781, 1, 0.8392157, 0, 1,
-1.123425, 2.089366, 0.1364508, 1, 0.8470588, 0, 1,
-1.119638, 1.049466, -0.4605789, 1, 0.8509804, 0, 1,
-1.113919, 0.9597912, -1.334367, 1, 0.8588235, 0, 1,
-1.111107, -0.4306299, -1.176017, 1, 0.8627451, 0, 1,
-1.10599, -0.2716178, -1.842226, 1, 0.8705882, 0, 1,
-1.104046, -0.5711094, -1.029204, 1, 0.8745098, 0, 1,
-1.086241, -0.1163166, -0.2083163, 1, 0.8823529, 0, 1,
-1.069664, -1.378356, -0.760254, 1, 0.8862745, 0, 1,
-1.060784, -2.563623, -0.4775105, 1, 0.8941177, 0, 1,
-1.056917, -0.08121969, 0.07582843, 1, 0.8980392, 0, 1,
-1.056834, -0.2388989, -3.332012, 1, 0.9058824, 0, 1,
-1.053159, -0.4482799, -3.087113, 1, 0.9137255, 0, 1,
-1.038566, -0.06895456, -1.270663, 1, 0.9176471, 0, 1,
-1.037519, -0.5619208, -1.676294, 1, 0.9254902, 0, 1,
-1.032734, 0.02763345, -3.665839, 1, 0.9294118, 0, 1,
-1.021974, 0.02011251, -0.3651096, 1, 0.9372549, 0, 1,
-1.006039, 0.007932705, -0.8486364, 1, 0.9411765, 0, 1,
-1.005111, -0.5594009, -2.791136, 1, 0.9490196, 0, 1,
-1.004429, 0.5410047, -2.136436, 1, 0.9529412, 0, 1,
-1.001934, -0.06708299, -3.548394, 1, 0.9607843, 0, 1,
-0.9965757, -0.690559, -3.638344, 1, 0.9647059, 0, 1,
-0.9960316, -0.1303619, -1.095967, 1, 0.972549, 0, 1,
-0.9953279, -0.007593442, 0.0136188, 1, 0.9764706, 0, 1,
-0.9916084, 0.8751827, 0.1876071, 1, 0.9843137, 0, 1,
-0.9853241, -0.183763, 0.5550077, 1, 0.9882353, 0, 1,
-0.9830438, 1.210984, -3.522326, 1, 0.9960784, 0, 1,
-0.9723591, -0.9611328, 0.249998, 0.9960784, 1, 0, 1,
-0.9720196, -0.7129775, -2.042567, 0.9921569, 1, 0, 1,
-0.970066, -0.001458755, -2.336253, 0.9843137, 1, 0, 1,
-0.9602682, -0.8000236, -2.765817, 0.9803922, 1, 0, 1,
-0.9585695, -0.8750637, -1.121958, 0.972549, 1, 0, 1,
-0.9584885, 0.8940895, 0.5091969, 0.9686275, 1, 0, 1,
-0.9512563, 0.4866861, -1.543819, 0.9607843, 1, 0, 1,
-0.9468247, 1.164753, -2.952121, 0.9568627, 1, 0, 1,
-0.9388562, -0.1583533, -3.038587, 0.9490196, 1, 0, 1,
-0.935909, -0.1040593, -3.36447, 0.945098, 1, 0, 1,
-0.9348266, -0.5646101, -2.738503, 0.9372549, 1, 0, 1,
-0.9255795, 1.028512, -0.7914566, 0.9333333, 1, 0, 1,
-0.9244549, 0.4982851, -1.135837, 0.9254902, 1, 0, 1,
-0.9163259, -0.5389259, -2.616628, 0.9215686, 1, 0, 1,
-0.9112476, 1.917661, -1.192366, 0.9137255, 1, 0, 1,
-0.9103923, -1.213797, -3.795057, 0.9098039, 1, 0, 1,
-0.9063831, 0.6408123, -0.8979036, 0.9019608, 1, 0, 1,
-0.9049069, 0.54581, -1.556848, 0.8941177, 1, 0, 1,
-0.9048671, -0.5194526, -2.615349, 0.8901961, 1, 0, 1,
-0.901806, -0.113404, -2.264968, 0.8823529, 1, 0, 1,
-0.8985658, 0.1797442, -1.397913, 0.8784314, 1, 0, 1,
-0.8938146, 0.1267073, -4.00375, 0.8705882, 1, 0, 1,
-0.8908075, -0.5734941, -1.616104, 0.8666667, 1, 0, 1,
-0.8905956, 0.9717207, -1.434046, 0.8588235, 1, 0, 1,
-0.888114, -0.7761042, -2.468485, 0.854902, 1, 0, 1,
-0.8874644, -0.3219608, -3.237852, 0.8470588, 1, 0, 1,
-0.8827146, -0.2256205, -2.856914, 0.8431373, 1, 0, 1,
-0.88251, 0.9065453, 0.1700869, 0.8352941, 1, 0, 1,
-0.8809918, 1.256171, 0.2066534, 0.8313726, 1, 0, 1,
-0.8678626, -0.01577983, -2.250619, 0.8235294, 1, 0, 1,
-0.8638967, 0.2618476, -2.24437, 0.8196079, 1, 0, 1,
-0.854127, 0.09155742, -3.090592, 0.8117647, 1, 0, 1,
-0.8493769, -1.471185, -2.607844, 0.8078431, 1, 0, 1,
-0.8479399, 0.5218959, -1.352705, 0.8, 1, 0, 1,
-0.8434787, -0.3368877, -1.604163, 0.7921569, 1, 0, 1,
-0.8376563, -0.7605824, -2.574431, 0.7882353, 1, 0, 1,
-0.8360307, -2.704387, -1.29092, 0.7803922, 1, 0, 1,
-0.8283321, -0.327184, -2.164484, 0.7764706, 1, 0, 1,
-0.8260789, 0.3031368, -1.158937, 0.7686275, 1, 0, 1,
-0.8252441, 0.7846712, -0.885703, 0.7647059, 1, 0, 1,
-0.8202997, -0.8322546, -1.879525, 0.7568628, 1, 0, 1,
-0.8151618, 0.1845386, -0.138788, 0.7529412, 1, 0, 1,
-0.8110206, -0.8407412, -1.933313, 0.7450981, 1, 0, 1,
-0.8097481, 0.9680808, -1.847876, 0.7411765, 1, 0, 1,
-0.8093684, -1.095187, -1.84142, 0.7333333, 1, 0, 1,
-0.8052234, 0.2013295, -2.376546, 0.7294118, 1, 0, 1,
-0.8046015, 0.1148197, 1.695438, 0.7215686, 1, 0, 1,
-0.8027231, 0.2910494, -0.2320746, 0.7176471, 1, 0, 1,
-0.7995411, -1.334625, -0.1074348, 0.7098039, 1, 0, 1,
-0.794567, -2.732077, -3.693927, 0.7058824, 1, 0, 1,
-0.7858297, -0.05820667, -3.380412, 0.6980392, 1, 0, 1,
-0.7837361, -0.3919635, -3.981635, 0.6901961, 1, 0, 1,
-0.7731388, -0.03592663, -2.445241, 0.6862745, 1, 0, 1,
-0.769398, -1.028806, -4.018473, 0.6784314, 1, 0, 1,
-0.7636715, -0.339491, -2.969259, 0.6745098, 1, 0, 1,
-0.7610789, -0.835585, -3.3799, 0.6666667, 1, 0, 1,
-0.7530842, 0.8513885, -1.230054, 0.6627451, 1, 0, 1,
-0.7464131, -0.5095215, -3.014322, 0.654902, 1, 0, 1,
-0.7449366, -1.72756, -3.519341, 0.6509804, 1, 0, 1,
-0.7400087, -0.1190141, -0.9150369, 0.6431373, 1, 0, 1,
-0.7397145, 0.6707957, 1.632498, 0.6392157, 1, 0, 1,
-0.7306554, -0.09188426, -1.534199, 0.6313726, 1, 0, 1,
-0.7297608, 0.08538239, -1.187686, 0.627451, 1, 0, 1,
-0.7277986, 0.1149069, -2.610375, 0.6196079, 1, 0, 1,
-0.7266368, -0.9063141, -3.34495, 0.6156863, 1, 0, 1,
-0.7195333, 1.818609, -0.7414849, 0.6078432, 1, 0, 1,
-0.7147064, -1.420647, -2.665729, 0.6039216, 1, 0, 1,
-0.7094632, -2.252703, -3.182996, 0.5960785, 1, 0, 1,
-0.7040373, 0.5925286, -1.2325, 0.5882353, 1, 0, 1,
-0.7011732, -1.174621, -1.841372, 0.5843138, 1, 0, 1,
-0.6976961, -1.488748, -3.118806, 0.5764706, 1, 0, 1,
-0.6876045, 0.0408283, -3.676787, 0.572549, 1, 0, 1,
-0.6860323, -1.596365, -3.023992, 0.5647059, 1, 0, 1,
-0.6837204, -0.03709187, -1.730685, 0.5607843, 1, 0, 1,
-0.679646, -0.2894905, -3.854335, 0.5529412, 1, 0, 1,
-0.6735711, -0.22025, -2.540146, 0.5490196, 1, 0, 1,
-0.669445, -2.297254, -2.866665, 0.5411765, 1, 0, 1,
-0.6661441, 1.040845, -0.7133048, 0.5372549, 1, 0, 1,
-0.6630774, -1.17441, -1.26957, 0.5294118, 1, 0, 1,
-0.6541814, 0.127591, -1.514335, 0.5254902, 1, 0, 1,
-0.6507684, -1.127084, -0.9468824, 0.5176471, 1, 0, 1,
-0.6402169, 1.767885, -0.2605363, 0.5137255, 1, 0, 1,
-0.6340351, -0.5021805, -1.681793, 0.5058824, 1, 0, 1,
-0.6333353, -0.2028737, -2.113369, 0.5019608, 1, 0, 1,
-0.6328978, -0.2827487, -2.150269, 0.4941176, 1, 0, 1,
-0.6325075, -1.039844, -3.218471, 0.4862745, 1, 0, 1,
-0.6301131, -0.09488959, -2.26316, 0.4823529, 1, 0, 1,
-0.6300145, 0.5807653, -0.4599087, 0.4745098, 1, 0, 1,
-0.6255156, -0.1067477, -0.967927, 0.4705882, 1, 0, 1,
-0.6233828, -1.215233, -2.4676, 0.4627451, 1, 0, 1,
-0.6204688, -0.03942577, 0.6014932, 0.4588235, 1, 0, 1,
-0.6159971, -2.00176, -3.121015, 0.4509804, 1, 0, 1,
-0.6036097, -0.8810932, -2.637816, 0.4470588, 1, 0, 1,
-0.6026425, 0.1082992, -1.259061, 0.4392157, 1, 0, 1,
-0.6010842, 1.504192, 0.4162425, 0.4352941, 1, 0, 1,
-0.5984994, -1.730085, -1.29136, 0.427451, 1, 0, 1,
-0.5942141, 0.2061141, -1.778414, 0.4235294, 1, 0, 1,
-0.5936039, -1.542632, -1.688734, 0.4156863, 1, 0, 1,
-0.591586, 0.1375298, -2.202759, 0.4117647, 1, 0, 1,
-0.5845379, -0.1355866, -1.066187, 0.4039216, 1, 0, 1,
-0.5811646, -0.7891319, -1.767565, 0.3960784, 1, 0, 1,
-0.5801852, -0.5746281, -3.754504, 0.3921569, 1, 0, 1,
-0.5728952, 0.2669072, -1.346647, 0.3843137, 1, 0, 1,
-0.5665916, -0.4911372, -2.787288, 0.3803922, 1, 0, 1,
-0.5656642, -1.612013, -1.628771, 0.372549, 1, 0, 1,
-0.5647172, 0.9859539, -0.03074535, 0.3686275, 1, 0, 1,
-0.5602078, 0.8410884, -1.11645, 0.3607843, 1, 0, 1,
-0.5588721, 0.6527876, -0.4458572, 0.3568628, 1, 0, 1,
-0.5575536, -2.260841, -5.43983, 0.3490196, 1, 0, 1,
-0.5567778, 1.437825, -1.013085, 0.345098, 1, 0, 1,
-0.5505468, -0.4892938, -1.553628, 0.3372549, 1, 0, 1,
-0.5505196, -1.613571, -2.100248, 0.3333333, 1, 0, 1,
-0.5479511, 0.5693598, -0.5238079, 0.3254902, 1, 0, 1,
-0.5440406, -1.421434, -3.317992, 0.3215686, 1, 0, 1,
-0.5434127, 0.3047072, -0.4308021, 0.3137255, 1, 0, 1,
-0.5424542, 1.602474, 0.5852679, 0.3098039, 1, 0, 1,
-0.5391536, 0.9384728, -0.4990491, 0.3019608, 1, 0, 1,
-0.5390292, 0.01750804, -1.834194, 0.2941177, 1, 0, 1,
-0.5300433, 1.597259, -0.7647983, 0.2901961, 1, 0, 1,
-0.5292575, 0.1485874, -0.2764305, 0.282353, 1, 0, 1,
-0.5264694, -0.1959065, -1.373634, 0.2784314, 1, 0, 1,
-0.5235755, 1.665398, 0.6227257, 0.2705882, 1, 0, 1,
-0.5199685, 0.08944266, -2.053335, 0.2666667, 1, 0, 1,
-0.5174026, 1.21896, -0.9160903, 0.2588235, 1, 0, 1,
-0.51632, 0.2920329, -0.01513134, 0.254902, 1, 0, 1,
-0.5057788, 0.04198619, -0.04545919, 0.2470588, 1, 0, 1,
-0.4991735, 0.6539859, -1.368615, 0.2431373, 1, 0, 1,
-0.4969879, 0.1393492, -2.557051, 0.2352941, 1, 0, 1,
-0.4886441, 0.4391744, -2.16386, 0.2313726, 1, 0, 1,
-0.48026, -0.3763647, -3.135757, 0.2235294, 1, 0, 1,
-0.4778332, 0.2058845, -1.240541, 0.2196078, 1, 0, 1,
-0.4777032, -0.8895161, -2.827019, 0.2117647, 1, 0, 1,
-0.4707537, 0.8383609, -0.6807278, 0.2078431, 1, 0, 1,
-0.4702072, 0.6514032, -1.677095, 0.2, 1, 0, 1,
-0.4678314, 0.8712088, -0.001920929, 0.1921569, 1, 0, 1,
-0.4673675, -0.5110103, -2.05428, 0.1882353, 1, 0, 1,
-0.4671848, 0.4691162, -2.485286, 0.1803922, 1, 0, 1,
-0.4618466, 0.7749907, -0.5803056, 0.1764706, 1, 0, 1,
-0.4614137, -1.582838, -2.604112, 0.1686275, 1, 0, 1,
-0.4586694, 0.3920893, -1.37175, 0.1647059, 1, 0, 1,
-0.4557172, 1.312004, 0.6749623, 0.1568628, 1, 0, 1,
-0.4501308, 0.2158022, 0.3340951, 0.1529412, 1, 0, 1,
-0.4455591, -1.276302, -3.166378, 0.145098, 1, 0, 1,
-0.4406774, -0.02462988, -1.050618, 0.1411765, 1, 0, 1,
-0.4405374, -1.109238, -3.315981, 0.1333333, 1, 0, 1,
-0.4357353, 0.08788529, -1.608684, 0.1294118, 1, 0, 1,
-0.4344082, -0.2466167, -3.128335, 0.1215686, 1, 0, 1,
-0.434219, -0.4496734, -1.602297, 0.1176471, 1, 0, 1,
-0.4335127, 0.1588232, -3.08774, 0.1098039, 1, 0, 1,
-0.4326723, -0.6663933, -3.961725, 0.1058824, 1, 0, 1,
-0.4306397, 1.204138, -0.5955549, 0.09803922, 1, 0, 1,
-0.4295282, 0.4657363, -1.751642, 0.09019608, 1, 0, 1,
-0.4276091, -0.7541956, -3.587229, 0.08627451, 1, 0, 1,
-0.4273292, -0.08317053, -4.04151, 0.07843138, 1, 0, 1,
-0.4261706, 0.9077309, 1.206635, 0.07450981, 1, 0, 1,
-0.4252176, -1.501991, -2.794204, 0.06666667, 1, 0, 1,
-0.4250605, -1.549427, -3.927457, 0.0627451, 1, 0, 1,
-0.4242533, -1.029548, -4.205734, 0.05490196, 1, 0, 1,
-0.4229549, 0.4726177, -0.7923675, 0.05098039, 1, 0, 1,
-0.4199899, 0.2511843, -1.555427, 0.04313726, 1, 0, 1,
-0.41569, 0.8559989, -1.228288, 0.03921569, 1, 0, 1,
-0.4143234, 0.9855691, -0.1313284, 0.03137255, 1, 0, 1,
-0.4041404, 1.201723, -0.2851202, 0.02745098, 1, 0, 1,
-0.402256, 1.911835, -0.5922075, 0.01960784, 1, 0, 1,
-0.4004247, -0.7321837, -3.95382, 0.01568628, 1, 0, 1,
-0.399546, -0.7121252, -4.318761, 0.007843138, 1, 0, 1,
-0.3974376, -0.3297734, -2.504812, 0.003921569, 1, 0, 1,
-0.391899, -1.749187, -4.255425, 0, 1, 0.003921569, 1,
-0.3912855, -0.2666642, -4.134975, 0, 1, 0.01176471, 1,
-0.3908507, -0.7753112, -2.315509, 0, 1, 0.01568628, 1,
-0.3901065, -0.1097744, -2.767855, 0, 1, 0.02352941, 1,
-0.389531, -0.4294582, -0.4368017, 0, 1, 0.02745098, 1,
-0.3881454, 0.01823557, -0.3641159, 0, 1, 0.03529412, 1,
-0.3863523, -0.6322584, -2.100716, 0, 1, 0.03921569, 1,
-0.3855863, -1.019247, -1.99547, 0, 1, 0.04705882, 1,
-0.3806899, -0.2253509, -2.350017, 0, 1, 0.05098039, 1,
-0.3806108, 0.09097318, -1.082832, 0, 1, 0.05882353, 1,
-0.3705863, 0.2221142, -0.7839897, 0, 1, 0.0627451, 1,
-0.3689541, -0.001632297, -0.7994355, 0, 1, 0.07058824, 1,
-0.3660679, -0.9563096, -3.490734, 0, 1, 0.07450981, 1,
-0.3630977, 0.8000715, 0.2898043, 0, 1, 0.08235294, 1,
-0.3620791, 0.2500953, -3.368571, 0, 1, 0.08627451, 1,
-0.3619792, 0.0914136, 1.982435, 0, 1, 0.09411765, 1,
-0.3552274, 0.07741552, -1.255042, 0, 1, 0.1019608, 1,
-0.3512012, 2.50411, 0.7458019, 0, 1, 0.1058824, 1,
-0.3508928, -1.09745, -3.939257, 0, 1, 0.1137255, 1,
-0.3502896, 1.093177, -0.4708002, 0, 1, 0.1176471, 1,
-0.3468844, 1.174102, -1.773476, 0, 1, 0.1254902, 1,
-0.3444327, 1.497416, -0.7898654, 0, 1, 0.1294118, 1,
-0.3426818, 0.09458455, -1.137649, 0, 1, 0.1372549, 1,
-0.3402492, 0.3478239, -0.3905954, 0, 1, 0.1411765, 1,
-0.3377289, 0.1444565, -1.768611, 0, 1, 0.1490196, 1,
-0.3376905, 0.3493073, -2.071945, 0, 1, 0.1529412, 1,
-0.3359815, -0.8529704, -1.813361, 0, 1, 0.1607843, 1,
-0.3348163, -1.353763, -1.405071, 0, 1, 0.1647059, 1,
-0.3340084, 2.113038, -0.9903703, 0, 1, 0.172549, 1,
-0.3329884, -1.457098, -2.635361, 0, 1, 0.1764706, 1,
-0.3305256, -0.1034106, -2.62012, 0, 1, 0.1843137, 1,
-0.3285505, 1.096974, 0.9336872, 0, 1, 0.1882353, 1,
-0.3231878, -0.6346573, -3.03371, 0, 1, 0.1960784, 1,
-0.3212468, 1.093971, -0.4493265, 0, 1, 0.2039216, 1,
-0.3199307, -1.044826, -4.202229, 0, 1, 0.2078431, 1,
-0.3189571, -0.6978827, -1.927911, 0, 1, 0.2156863, 1,
-0.3154588, -0.5533577, -2.930706, 0, 1, 0.2196078, 1,
-0.3124042, 0.5584009, 0.6646667, 0, 1, 0.227451, 1,
-0.3106035, 0.249947, 0.2598983, 0, 1, 0.2313726, 1,
-0.3078684, -0.00558735, -2.134643, 0, 1, 0.2392157, 1,
-0.3072698, -0.9209745, -0.6284254, 0, 1, 0.2431373, 1,
-0.3068088, -0.2658654, -1.183568, 0, 1, 0.2509804, 1,
-0.2986661, -0.2538251, -3.150383, 0, 1, 0.254902, 1,
-0.2969928, -0.006996798, -1.519982, 0, 1, 0.2627451, 1,
-0.2930518, -0.5028353, -1.440465, 0, 1, 0.2666667, 1,
-0.2926836, 0.4410897, 0.3639624, 0, 1, 0.2745098, 1,
-0.2870805, -1.900347, -4.7575, 0, 1, 0.2784314, 1,
-0.2778042, 1.780184, -1.535084, 0, 1, 0.2862745, 1,
-0.2772795, 1.195994, 1.192343, 0, 1, 0.2901961, 1,
-0.2767363, -0.06189737, -1.520627, 0, 1, 0.2980392, 1,
-0.2766391, 0.1958525, -1.481998, 0, 1, 0.3058824, 1,
-0.2717536, -1.49859, -2.901114, 0, 1, 0.3098039, 1,
-0.2620257, -1.813936, -4.122424, 0, 1, 0.3176471, 1,
-0.259482, -0.6052564, -2.654643, 0, 1, 0.3215686, 1,
-0.2592106, 0.3237965, -1.225435, 0, 1, 0.3294118, 1,
-0.2549412, -1.643543, -2.269013, 0, 1, 0.3333333, 1,
-0.252029, 0.545965, -1.155376, 0, 1, 0.3411765, 1,
-0.2507705, -1.059468, -2.811615, 0, 1, 0.345098, 1,
-0.2495104, -1.774316, -4.249941, 0, 1, 0.3529412, 1,
-0.2485865, -1.064446, -4.817648, 0, 1, 0.3568628, 1,
-0.2485741, 0.4198956, -1.610407, 0, 1, 0.3647059, 1,
-0.2457435, 0.4676492, -1.406972, 0, 1, 0.3686275, 1,
-0.2436994, 1.696634, -0.8146513, 0, 1, 0.3764706, 1,
-0.2361671, 0.08294719, -2.674141, 0, 1, 0.3803922, 1,
-0.235812, 0.9415662, -1.798322, 0, 1, 0.3882353, 1,
-0.2344903, -0.10179, 0.004220196, 0, 1, 0.3921569, 1,
-0.2312372, 0.2562758, -2.10691, 0, 1, 0.4, 1,
-0.2231228, -0.2396792, -1.788424, 0, 1, 0.4078431, 1,
-0.2227365, -0.4112376, -3.769529, 0, 1, 0.4117647, 1,
-0.2219718, -0.2167846, -2.641927, 0, 1, 0.4196078, 1,
-0.2214966, -0.9384558, -3.586523, 0, 1, 0.4235294, 1,
-0.2213098, -0.9956358, -1.405467, 0, 1, 0.4313726, 1,
-0.2173239, 3.275891, -1.125968, 0, 1, 0.4352941, 1,
-0.2076446, -0.4558908, -4.570044, 0, 1, 0.4431373, 1,
-0.2075095, -1.783605, -3.933377, 0, 1, 0.4470588, 1,
-0.202729, 1.808987, 0.498054, 0, 1, 0.454902, 1,
-0.198926, 1.340696, -0.1123576, 0, 1, 0.4588235, 1,
-0.1976459, -0.6117489, -1.707606, 0, 1, 0.4666667, 1,
-0.1950803, -0.2345898, -2.851918, 0, 1, 0.4705882, 1,
-0.1947284, -0.03158421, -2.301171, 0, 1, 0.4784314, 1,
-0.1923316, -1.824899, -4.168077, 0, 1, 0.4823529, 1,
-0.1905672, 0.5000094, 2.318403, 0, 1, 0.4901961, 1,
-0.1882381, -0.9467196, -1.590269, 0, 1, 0.4941176, 1,
-0.1828102, 0.6795051, 1.953025, 0, 1, 0.5019608, 1,
-0.1804549, -0.05612104, -2.418609, 0, 1, 0.509804, 1,
-0.1794951, -0.3007012, -2.920566, 0, 1, 0.5137255, 1,
-0.1774791, -0.4446653, -0.7893825, 0, 1, 0.5215687, 1,
-0.1764144, 0.2883961, -0.75344, 0, 1, 0.5254902, 1,
-0.1750527, 0.2876, -1.12609, 0, 1, 0.5333334, 1,
-0.1744904, 2.601443, 1.056066, 0, 1, 0.5372549, 1,
-0.1737103, -1.67859, -3.665882, 0, 1, 0.5450981, 1,
-0.1724903, -0.2366586, -2.990704, 0, 1, 0.5490196, 1,
-0.1724428, -0.3898726, -1.323314, 0, 1, 0.5568628, 1,
-0.169347, -0.3391845, -2.023062, 0, 1, 0.5607843, 1,
-0.1689874, -1.312148, -4.34527, 0, 1, 0.5686275, 1,
-0.1688171, 0.5029306, -0.4065251, 0, 1, 0.572549, 1,
-0.1631965, -0.5012102, -2.615121, 0, 1, 0.5803922, 1,
-0.1630482, 1.54189, -0.7765867, 0, 1, 0.5843138, 1,
-0.1581531, -0.9697474, -2.303826, 0, 1, 0.5921569, 1,
-0.1549967, -0.2609731, -2.974955, 0, 1, 0.5960785, 1,
-0.1528128, -1.341784, -2.305706, 0, 1, 0.6039216, 1,
-0.1521417, 0.6235616, -1.126685, 0, 1, 0.6117647, 1,
-0.150859, -0.5050012, -4.224513, 0, 1, 0.6156863, 1,
-0.1491778, -0.8182728, -2.204962, 0, 1, 0.6235294, 1,
-0.1431404, 1.382786, 0.31863, 0, 1, 0.627451, 1,
-0.1427171, -0.501644, -2.394088, 0, 1, 0.6352941, 1,
-0.1423753, -0.1136162, -1.368641, 0, 1, 0.6392157, 1,
-0.1394224, -1.463293, -3.010806, 0, 1, 0.6470588, 1,
-0.1348242, 0.1333202, -2.753489, 0, 1, 0.6509804, 1,
-0.1329472, -1.932778, -4.967167, 0, 1, 0.6588235, 1,
-0.1309864, -1.150481, -3.417193, 0, 1, 0.6627451, 1,
-0.1288618, 0.385513, -1.100757, 0, 1, 0.6705883, 1,
-0.1283416, 0.8501428, -2.158403, 0, 1, 0.6745098, 1,
-0.1228646, 0.5454534, -1.1664, 0, 1, 0.682353, 1,
-0.1219848, 0.4811454, -0.1941694, 0, 1, 0.6862745, 1,
-0.117062, -0.1109017, -1.677307, 0, 1, 0.6941177, 1,
-0.1139381, -1.246277, -4.561988, 0, 1, 0.7019608, 1,
-0.1014311, 0.8797181, 0.6165959, 0, 1, 0.7058824, 1,
-0.09822588, -1.045563, -3.561175, 0, 1, 0.7137255, 1,
-0.09763393, -0.5995075, -2.777894, 0, 1, 0.7176471, 1,
-0.09659313, 0.5898951, 1.057339, 0, 1, 0.7254902, 1,
-0.09485084, 1.803894, 1.572057, 0, 1, 0.7294118, 1,
-0.09468566, 1.751269, -0.01251921, 0, 1, 0.7372549, 1,
-0.09321675, 0.2806242, -0.9554048, 0, 1, 0.7411765, 1,
-0.09274442, -0.3172213, -2.834237, 0, 1, 0.7490196, 1,
-0.08950128, 1.368052, -1.916961, 0, 1, 0.7529412, 1,
-0.08728996, 0.2320222, -2.21911, 0, 1, 0.7607843, 1,
-0.087165, -1.639313, -3.874257, 0, 1, 0.7647059, 1,
-0.083449, -0.8224198, -3.101433, 0, 1, 0.772549, 1,
-0.08341935, 0.02902383, -3.102193, 0, 1, 0.7764706, 1,
-0.08327997, 1.110648, -1.576176, 0, 1, 0.7843137, 1,
-0.07933491, -0.9348214, -2.179429, 0, 1, 0.7882353, 1,
-0.07817039, 2.082088, -0.3506044, 0, 1, 0.7960784, 1,
-0.07564509, -0.8498102, -3.36032, 0, 1, 0.8039216, 1,
-0.06849886, 1.041105, -1.848596, 0, 1, 0.8078431, 1,
-0.06654426, 0.1346204, -0.9025869, 0, 1, 0.8156863, 1,
-0.06583061, 0.3439208, -0.3851928, 0, 1, 0.8196079, 1,
-0.06337771, 0.5254608, 0.2216233, 0, 1, 0.827451, 1,
-0.06321988, -0.449881, -1.897278, 0, 1, 0.8313726, 1,
-0.05792976, 1.247087, -0.4267894, 0, 1, 0.8392157, 1,
-0.05295328, -0.1853102, -3.651351, 0, 1, 0.8431373, 1,
-0.04893643, -1.219442, -2.217347, 0, 1, 0.8509804, 1,
-0.04146401, -2.424081, -2.591129, 0, 1, 0.854902, 1,
-0.04124784, -1.552836, -1.879664, 0, 1, 0.8627451, 1,
-0.04064088, 0.76867, -0.7221972, 0, 1, 0.8666667, 1,
-0.04027079, -1.313601, -2.382308, 0, 1, 0.8745098, 1,
-0.03848717, 1.660311, 0.07991371, 0, 1, 0.8784314, 1,
-0.03642148, -1.133287, -3.049975, 0, 1, 0.8862745, 1,
-0.02729357, 1.005065, -0.8566216, 0, 1, 0.8901961, 1,
-0.0253077, 0.047638, -1.089266, 0, 1, 0.8980392, 1,
-0.02460039, 0.7060328, 1.190985, 0, 1, 0.9058824, 1,
-0.0221225, 0.1822797, 0.9097199, 0, 1, 0.9098039, 1,
-0.02151924, -0.7985461, -2.110215, 0, 1, 0.9176471, 1,
-0.01724049, -0.02675752, -2.216879, 0, 1, 0.9215686, 1,
-0.01401896, -1.738736, -4.047302, 0, 1, 0.9294118, 1,
-0.01314733, 0.5443286, -0.07868922, 0, 1, 0.9333333, 1,
-0.01146979, 0.005788651, -1.677729, 0, 1, 0.9411765, 1,
-0.009510758, -1.340695, -2.665234, 0, 1, 0.945098, 1,
-0.006648658, -0.5433972, -5.317158, 0, 1, 0.9529412, 1,
-0.001504161, 0.9295577, -1.517567, 0, 1, 0.9568627, 1,
-0.0003309055, -0.2349773, -5.082064, 0, 1, 0.9647059, 1,
0.002364972, -0.9507528, 3.938213, 0, 1, 0.9686275, 1,
0.002583218, 0.6492661, -0.4845796, 0, 1, 0.9764706, 1,
0.005845878, 0.182821, -1.272488, 0, 1, 0.9803922, 1,
0.01169096, -0.2558261, 5.556132, 0, 1, 0.9882353, 1,
0.01586044, -0.462443, 3.093595, 0, 1, 0.9921569, 1,
0.01674082, 0.6342809, -0.635357, 0, 1, 1, 1,
0.01862982, -0.7589927, 2.96492, 0, 0.9921569, 1, 1,
0.01872474, 0.8411434, -2.146724, 0, 0.9882353, 1, 1,
0.01900013, -1.52643, 2.815599, 0, 0.9803922, 1, 1,
0.02139778, 0.2399809, 0.1679776, 0, 0.9764706, 1, 1,
0.02639112, 1.590495, 1.108272, 0, 0.9686275, 1, 1,
0.02664392, -1.130953, 3.58714, 0, 0.9647059, 1, 1,
0.02755138, 0.9226826, 1.598311, 0, 0.9568627, 1, 1,
0.02845177, -0.2171156, 3.541469, 0, 0.9529412, 1, 1,
0.03000349, -0.7143811, 3.576971, 0, 0.945098, 1, 1,
0.03171734, 0.4166878, -0.09412368, 0, 0.9411765, 1, 1,
0.03848926, 0.4888584, 0.136871, 0, 0.9333333, 1, 1,
0.03911715, -0.5068993, 2.301697, 0, 0.9294118, 1, 1,
0.03998167, -0.8105133, 4.54683, 0, 0.9215686, 1, 1,
0.04014903, 1.307671, 1.349419, 0, 0.9176471, 1, 1,
0.0408034, 1.110976, -0.2967874, 0, 0.9098039, 1, 1,
0.04145911, 0.1428228, 0.7721744, 0, 0.9058824, 1, 1,
0.04388084, 0.8672928, -0.01199044, 0, 0.8980392, 1, 1,
0.04433336, -0.1047573, 0.9172124, 0, 0.8901961, 1, 1,
0.04457582, 0.1396512, 0.3196361, 0, 0.8862745, 1, 1,
0.04466695, -1.28163, 3.37786, 0, 0.8784314, 1, 1,
0.05036256, 0.7696377, -0.1635033, 0, 0.8745098, 1, 1,
0.05260307, 0.8019465, -1.951693, 0, 0.8666667, 1, 1,
0.05485457, 0.4991914, -0.3475085, 0, 0.8627451, 1, 1,
0.05678682, 1.495063, 0.941346, 0, 0.854902, 1, 1,
0.0600488, -1.111448, 2.539968, 0, 0.8509804, 1, 1,
0.06502381, 0.6294085, -0.2871106, 0, 0.8431373, 1, 1,
0.06636878, 1.527137, -1.036669, 0, 0.8392157, 1, 1,
0.06841941, 0.6492257, -1.667116, 0, 0.8313726, 1, 1,
0.07180909, 0.6128283, 0.9811004, 0, 0.827451, 1, 1,
0.07541247, -0.8995912, 2.401204, 0, 0.8196079, 1, 1,
0.07542747, 1.372597, 0.2481962, 0, 0.8156863, 1, 1,
0.08154882, 0.5365782, 0.1970056, 0, 0.8078431, 1, 1,
0.08867535, 1.825129, 1.068415, 0, 0.8039216, 1, 1,
0.08891883, -1.048331, 0.8577525, 0, 0.7960784, 1, 1,
0.09107561, 1.53379, 0.04143615, 0, 0.7882353, 1, 1,
0.09282751, 0.28427, 0.1724022, 0, 0.7843137, 1, 1,
0.09375068, -0.3782465, 1.933625, 0, 0.7764706, 1, 1,
0.09448032, 1.190076, -0.2554245, 0, 0.772549, 1, 1,
0.09640654, -0.267492, 2.562033, 0, 0.7647059, 1, 1,
0.09737846, 0.5048912, 0.294786, 0, 0.7607843, 1, 1,
0.09806601, -1.320313, 2.997068, 0, 0.7529412, 1, 1,
0.09838349, -2.217405, 3.609825, 0, 0.7490196, 1, 1,
0.09928488, 0.001324958, 1.486025, 0, 0.7411765, 1, 1,
0.1061012, -2.226509, 4.12659, 0, 0.7372549, 1, 1,
0.1081677, 1.403296, -0.9098825, 0, 0.7294118, 1, 1,
0.1090143, -1.344929, 2.472626, 0, 0.7254902, 1, 1,
0.1106756, 1.003741, -1.194353, 0, 0.7176471, 1, 1,
0.1164516, 0.7241209, -0.5950277, 0, 0.7137255, 1, 1,
0.1185311, -2.337312, 2.78612, 0, 0.7058824, 1, 1,
0.1193821, 1.290982, -0.3136734, 0, 0.6980392, 1, 1,
0.1229916, 0.2518918, -1.202807, 0, 0.6941177, 1, 1,
0.1268876, 2.159447, 0.07343226, 0, 0.6862745, 1, 1,
0.1272911, 0.8705931, -0.6950706, 0, 0.682353, 1, 1,
0.1274967, -0.6427708, 4.251573, 0, 0.6745098, 1, 1,
0.1283442, 0.3605277, 1.688649, 0, 0.6705883, 1, 1,
0.1306982, -1.138619, 2.474732, 0, 0.6627451, 1, 1,
0.1411152, -0.5350934, 5.820707, 0, 0.6588235, 1, 1,
0.144655, 0.1279874, 0.5563983, 0, 0.6509804, 1, 1,
0.1486705, 0.1260638, 1.348096, 0, 0.6470588, 1, 1,
0.1490503, -0.4521744, 4.483721, 0, 0.6392157, 1, 1,
0.1491569, -1.113479, 2.052589, 0, 0.6352941, 1, 1,
0.1499447, 0.6270586, 1.345033, 0, 0.627451, 1, 1,
0.1505668, 0.729871, 2.161775, 0, 0.6235294, 1, 1,
0.1576129, 0.9814017, -0.6856044, 0, 0.6156863, 1, 1,
0.1593624, -0.607038, 5.611757, 0, 0.6117647, 1, 1,
0.159583, 1.215905, -0.1835225, 0, 0.6039216, 1, 1,
0.1636461, 1.159236, 0.2479253, 0, 0.5960785, 1, 1,
0.1643411, 0.7187842, 0.3907501, 0, 0.5921569, 1, 1,
0.1691645, -1.128381, 2.524325, 0, 0.5843138, 1, 1,
0.1701099, -1.26003, 3.053302, 0, 0.5803922, 1, 1,
0.170758, -0.2295756, 3.684847, 0, 0.572549, 1, 1,
0.1714846, 0.3725387, -0.1404033, 0, 0.5686275, 1, 1,
0.1853263, -0.2687198, 2.370777, 0, 0.5607843, 1, 1,
0.1939962, -1.88632, 7.525027, 0, 0.5568628, 1, 1,
0.1949212, -0.9702499, 3.685274, 0, 0.5490196, 1, 1,
0.1963378, 0.4967313, -0.2819096, 0, 0.5450981, 1, 1,
0.1970796, -0.23237, 2.756478, 0, 0.5372549, 1, 1,
0.1984891, -0.2403732, 2.960999, 0, 0.5333334, 1, 1,
0.199412, -0.2546342, 0.7037323, 0, 0.5254902, 1, 1,
0.2001875, -1.027035, 3.144344, 0, 0.5215687, 1, 1,
0.2022842, 0.783861, -0.3274929, 0, 0.5137255, 1, 1,
0.2039977, -0.5832149, 4.434032, 0, 0.509804, 1, 1,
0.2101222, -2.323763, 2.435462, 0, 0.5019608, 1, 1,
0.21255, 0.5245994, -0.9379017, 0, 0.4941176, 1, 1,
0.2130838, 1.797927, -0.6639303, 0, 0.4901961, 1, 1,
0.2130925, 1.279016, -0.7265944, 0, 0.4823529, 1, 1,
0.2140012, -0.4366623, 2.839652, 0, 0.4784314, 1, 1,
0.2144383, 0.260882, -0.939617, 0, 0.4705882, 1, 1,
0.2161789, -0.6815431, 5.155231, 0, 0.4666667, 1, 1,
0.2191375, -0.05640643, 1.76274, 0, 0.4588235, 1, 1,
0.2225297, 0.3827474, 0.1369292, 0, 0.454902, 1, 1,
0.2244304, 1.384228, -0.3154205, 0, 0.4470588, 1, 1,
0.2249482, 0.6371495, 0.1238333, 0, 0.4431373, 1, 1,
0.2288036, -0.0591523, 1.847952, 0, 0.4352941, 1, 1,
0.2325299, 0.3167289, 1.900217, 0, 0.4313726, 1, 1,
0.2332476, -1.135509, 3.095974, 0, 0.4235294, 1, 1,
0.2350567, 0.4262847, 1.240789, 0, 0.4196078, 1, 1,
0.2400195, 1.106411, 1.976962, 0, 0.4117647, 1, 1,
0.2419825, 0.09429362, 1.783856, 0, 0.4078431, 1, 1,
0.2432369, 2.092959, 0.2493557, 0, 0.4, 1, 1,
0.245832, -0.1913569, 1.980664, 0, 0.3921569, 1, 1,
0.2543449, -0.9115364, 2.202828, 0, 0.3882353, 1, 1,
0.2554101, -1.977847, 3.838371, 0, 0.3803922, 1, 1,
0.2608389, 0.2732854, 1.242637, 0, 0.3764706, 1, 1,
0.2654518, 0.6351905, -0.4510618, 0, 0.3686275, 1, 1,
0.2689668, -0.8785673, 2.189533, 0, 0.3647059, 1, 1,
0.2718278, 0.5887542, -0.8999529, 0, 0.3568628, 1, 1,
0.2732799, 1.147979, 1.342998, 0, 0.3529412, 1, 1,
0.2755373, 0.2745911, 2.45524, 0, 0.345098, 1, 1,
0.2820391, 0.515173, -0.05439555, 0, 0.3411765, 1, 1,
0.2845364, -0.7155667, 2.763539, 0, 0.3333333, 1, 1,
0.2853077, 0.2836047, 0.6182513, 0, 0.3294118, 1, 1,
0.2860754, 1.589683, -0.8488188, 0, 0.3215686, 1, 1,
0.2862586, -2.340246, 2.686824, 0, 0.3176471, 1, 1,
0.2900784, 0.7143848, 1.464331, 0, 0.3098039, 1, 1,
0.2919596, 0.3269832, 2.441815, 0, 0.3058824, 1, 1,
0.2935089, -0.7760762, 2.59689, 0, 0.2980392, 1, 1,
0.3003782, 0.1972952, 1.407977, 0, 0.2901961, 1, 1,
0.3093926, -0.01660433, 1.175625, 0, 0.2862745, 1, 1,
0.3106005, 0.09199239, 2.60389, 0, 0.2784314, 1, 1,
0.3120495, -0.923566, 2.966698, 0, 0.2745098, 1, 1,
0.3129785, -0.329073, 0.3069946, 0, 0.2666667, 1, 1,
0.3132996, 0.5529175, 1.71706, 0, 0.2627451, 1, 1,
0.3133238, -1.740173, 3.820383, 0, 0.254902, 1, 1,
0.3142549, 0.2471695, 0.5210047, 0, 0.2509804, 1, 1,
0.317772, -0.3317573, 3.391571, 0, 0.2431373, 1, 1,
0.3189121, 1.93973, 0.06917162, 0, 0.2392157, 1, 1,
0.320361, -0.04412961, 1.578174, 0, 0.2313726, 1, 1,
0.3228227, 0.5227306, 0.08872914, 0, 0.227451, 1, 1,
0.3254718, -0.2673982, 2.662111, 0, 0.2196078, 1, 1,
0.3370969, 0.209925, -0.1813957, 0, 0.2156863, 1, 1,
0.3419218, -0.650328, 1.672747, 0, 0.2078431, 1, 1,
0.3498115, 0.9491621, -0.2481505, 0, 0.2039216, 1, 1,
0.3498753, -0.4917457, 2.396792, 0, 0.1960784, 1, 1,
0.354214, 0.9900315, 2.328787, 0, 0.1882353, 1, 1,
0.3543639, 0.6789613, 1.25114, 0, 0.1843137, 1, 1,
0.3586405, 1.854605, 1.620454, 0, 0.1764706, 1, 1,
0.3612281, 0.007149382, 1.573942, 0, 0.172549, 1, 1,
0.371608, -1.314597, 3.238668, 0, 0.1647059, 1, 1,
0.3743058, 2.140689, 0.8738688, 0, 0.1607843, 1, 1,
0.3765939, -0.04364352, -0.05861236, 0, 0.1529412, 1, 1,
0.3780516, 1.235382, 0.790969, 0, 0.1490196, 1, 1,
0.3783187, 0.5645254, 1.424402, 0, 0.1411765, 1, 1,
0.3798452, -0.6514958, 2.077778, 0, 0.1372549, 1, 1,
0.3805344, -0.6610617, 2.999199, 0, 0.1294118, 1, 1,
0.3816841, -1.460952, 1.61988, 0, 0.1254902, 1, 1,
0.3924986, 1.371224, 0.3519328, 0, 0.1176471, 1, 1,
0.3939251, 0.8390747, -0.8409762, 0, 0.1137255, 1, 1,
0.39542, 0.5468088, 0.3455191, 0, 0.1058824, 1, 1,
0.4000448, -0.2214662, 2.483294, 0, 0.09803922, 1, 1,
0.4002715, -0.1257624, 2.431334, 0, 0.09411765, 1, 1,
0.4005733, -0.08012927, 2.602238, 0, 0.08627451, 1, 1,
0.4040841, 0.8342421, -0.7577208, 0, 0.08235294, 1, 1,
0.4044146, 0.0001006977, 1.04356, 0, 0.07450981, 1, 1,
0.4058577, 1.184355, 0.1267203, 0, 0.07058824, 1, 1,
0.4066131, 0.7683047, -0.1194526, 0, 0.0627451, 1, 1,
0.4112491, -0.6078531, 3.378605, 0, 0.05882353, 1, 1,
0.4132628, -1.124754, 2.560366, 0, 0.05098039, 1, 1,
0.4151798, 1.47895, 0.8155898, 0, 0.04705882, 1, 1,
0.4172132, 1.272585, -0.5900019, 0, 0.03921569, 1, 1,
0.4258657, 0.8894325, 1.294417, 0, 0.03529412, 1, 1,
0.4339462, 0.269885, -0.2435667, 0, 0.02745098, 1, 1,
0.4353833, 1.723416, -0.002317124, 0, 0.02352941, 1, 1,
0.4359296, 0.2432364, 1.483312, 0, 0.01568628, 1, 1,
0.4361293, -0.007323082, 0.7073272, 0, 0.01176471, 1, 1,
0.4363384, -0.6353008, 2.034311, 0, 0.003921569, 1, 1,
0.438029, -0.5190342, 1.626213, 0.003921569, 0, 1, 1,
0.4442055, -1.228462, 2.193292, 0.007843138, 0, 1, 1,
0.4465593, -0.1673603, 2.25897, 0.01568628, 0, 1, 1,
0.4509145, 0.8109512, 0.4469526, 0.01960784, 0, 1, 1,
0.4561769, -0.2294337, 0.9447596, 0.02745098, 0, 1, 1,
0.4578766, 0.3460521, 1.208911, 0.03137255, 0, 1, 1,
0.4586234, -0.3779511, 1.737283, 0.03921569, 0, 1, 1,
0.4627357, 0.3902434, 0.5291734, 0.04313726, 0, 1, 1,
0.4628509, -0.2695324, 2.711001, 0.05098039, 0, 1, 1,
0.4638523, -0.6151444, 2.468069, 0.05490196, 0, 1, 1,
0.4671336, -0.4457974, 2.71487, 0.0627451, 0, 1, 1,
0.4704557, 0.2272485, -0.1975063, 0.06666667, 0, 1, 1,
0.476806, -0.2956186, 1.453844, 0.07450981, 0, 1, 1,
0.4800579, 0.4787953, -1.352114, 0.07843138, 0, 1, 1,
0.4810146, -0.7508497, 3.397505, 0.08627451, 0, 1, 1,
0.4844116, 1.740869, -0.5655809, 0.09019608, 0, 1, 1,
0.4885921, 1.51456, 1.240772, 0.09803922, 0, 1, 1,
0.4895982, -0.9090394, 2.003204, 0.1058824, 0, 1, 1,
0.5090908, 0.3639051, 2.713473, 0.1098039, 0, 1, 1,
0.5124255, 0.7587764, 1.14809, 0.1176471, 0, 1, 1,
0.5148039, -0.9354244, 1.783201, 0.1215686, 0, 1, 1,
0.5157589, -1.846008, 3.183422, 0.1294118, 0, 1, 1,
0.5170937, 0.5333108, -0.3217489, 0.1333333, 0, 1, 1,
0.5210081, 1.141366, -0.8926535, 0.1411765, 0, 1, 1,
0.5229182, -1.141469, 2.287234, 0.145098, 0, 1, 1,
0.5233199, 1.547973, -0.9334834, 0.1529412, 0, 1, 1,
0.5249898, 1.093574, -1.266905, 0.1568628, 0, 1, 1,
0.5327571, -0.1609069, 2.221112, 0.1647059, 0, 1, 1,
0.5475531, 0.05776634, 1.260436, 0.1686275, 0, 1, 1,
0.5509568, -0.8353303, 1.389278, 0.1764706, 0, 1, 1,
0.5538012, -0.4425438, 1.822668, 0.1803922, 0, 1, 1,
0.5550674, 0.1077452, 2.648581, 0.1882353, 0, 1, 1,
0.5576038, 0.6132267, 0.2813811, 0.1921569, 0, 1, 1,
0.5609224, 1.311003, -2.530256, 0.2, 0, 1, 1,
0.5616699, -0.1074786, 3.372361, 0.2078431, 0, 1, 1,
0.5670866, -1.819947, 1.753039, 0.2117647, 0, 1, 1,
0.5680487, -0.03178083, 1.324175, 0.2196078, 0, 1, 1,
0.5688025, 0.3063674, 0.5761524, 0.2235294, 0, 1, 1,
0.5727417, 0.1369318, 1.86805, 0.2313726, 0, 1, 1,
0.5759172, 1.27515, 1.011236, 0.2352941, 0, 1, 1,
0.5803572, -0.239672, 1.728661, 0.2431373, 0, 1, 1,
0.5804235, 0.8107048, 0.3266457, 0.2470588, 0, 1, 1,
0.58218, 0.08223373, 2.687959, 0.254902, 0, 1, 1,
0.5825703, 0.01188169, 0.2447265, 0.2588235, 0, 1, 1,
0.5830485, 0.0876747, 0.9746764, 0.2666667, 0, 1, 1,
0.5921172, 0.7276412, 0.7809797, 0.2705882, 0, 1, 1,
0.594693, 0.7055795, 1.75065, 0.2784314, 0, 1, 1,
0.6001874, -0.03198927, 0.05968161, 0.282353, 0, 1, 1,
0.609264, -0.2629313, 0.8259515, 0.2901961, 0, 1, 1,
0.6100534, -1.084387, 3.370243, 0.2941177, 0, 1, 1,
0.6159436, -0.08953257, 1.869145, 0.3019608, 0, 1, 1,
0.6220461, -0.08689412, -0.1261955, 0.3098039, 0, 1, 1,
0.6323332, 0.2655734, 1.448178, 0.3137255, 0, 1, 1,
0.6360044, 1.696851, 0.0787702, 0.3215686, 0, 1, 1,
0.6387917, 0.263966, 1.109177, 0.3254902, 0, 1, 1,
0.644778, 0.8582432, 1.232121, 0.3333333, 0, 1, 1,
0.6463885, -0.2202352, 0.9818094, 0.3372549, 0, 1, 1,
0.6469806, 0.821901, 1.895259, 0.345098, 0, 1, 1,
0.6505345, 0.6204006, 2.071579, 0.3490196, 0, 1, 1,
0.654829, 0.4066648, 1.846266, 0.3568628, 0, 1, 1,
0.6560911, -0.7831051, 3.436279, 0.3607843, 0, 1, 1,
0.6586374, -1.172567, 3.339255, 0.3686275, 0, 1, 1,
0.6605688, 0.0998227, 1.843883, 0.372549, 0, 1, 1,
0.6666337, -1.334449, 4.296355, 0.3803922, 0, 1, 1,
0.6687675, -0.3425609, 2.427814, 0.3843137, 0, 1, 1,
0.676301, 0.298688, 0.6968483, 0.3921569, 0, 1, 1,
0.6784138, -0.5628528, 3.156836, 0.3960784, 0, 1, 1,
0.6812726, 0.9156088, 0.6847242, 0.4039216, 0, 1, 1,
0.6823147, -0.2451727, 1.275428, 0.4117647, 0, 1, 1,
0.6835986, -0.8768233, 1.968111, 0.4156863, 0, 1, 1,
0.6903263, -0.5454175, 0.6631725, 0.4235294, 0, 1, 1,
0.6914923, -0.8639616, 3.415395, 0.427451, 0, 1, 1,
0.6931756, 1.446993, 0.1859781, 0.4352941, 0, 1, 1,
0.696907, -1.614758, 3.583208, 0.4392157, 0, 1, 1,
0.6995234, -1.648607, 2.652192, 0.4470588, 0, 1, 1,
0.7008131, -1.985123, 2.607643, 0.4509804, 0, 1, 1,
0.7027518, -0.1905926, 2.856186, 0.4588235, 0, 1, 1,
0.7036365, -0.9152535, 2.737542, 0.4627451, 0, 1, 1,
0.7041963, 0.1219367, 1.350442, 0.4705882, 0, 1, 1,
0.7154423, 0.03800601, -0.1591761, 0.4745098, 0, 1, 1,
0.7160835, 1.783324, 0.999035, 0.4823529, 0, 1, 1,
0.7282101, -0.9479514, 3.480635, 0.4862745, 0, 1, 1,
0.7295247, 0.8971696, 1.017333, 0.4941176, 0, 1, 1,
0.7329571, 0.7228104, 1.744962, 0.5019608, 0, 1, 1,
0.7349966, -0.3715735, 1.522715, 0.5058824, 0, 1, 1,
0.7414233, -0.2225239, 0.7098131, 0.5137255, 0, 1, 1,
0.7477431, 0.1400178, 2.1464, 0.5176471, 0, 1, 1,
0.7516657, 1.40603, -0.1233574, 0.5254902, 0, 1, 1,
0.7690632, -0.7235932, 3.01896, 0.5294118, 0, 1, 1,
0.7705513, -1.216201, 3.438118, 0.5372549, 0, 1, 1,
0.7786218, 0.6767838, 0.5296542, 0.5411765, 0, 1, 1,
0.781956, 2.247335, -0.2266733, 0.5490196, 0, 1, 1,
0.7873398, 0.4109277, 1.182472, 0.5529412, 0, 1, 1,
0.7879614, 1.03984, 0.8552521, 0.5607843, 0, 1, 1,
0.7890445, -0.3383165, 3.1047, 0.5647059, 0, 1, 1,
0.7891656, -0.1228961, 2.875285, 0.572549, 0, 1, 1,
0.7925453, 0.1142408, 1.619984, 0.5764706, 0, 1, 1,
0.7957848, -1.190377, 3.116496, 0.5843138, 0, 1, 1,
0.8010741, -0.1900799, 2.369397, 0.5882353, 0, 1, 1,
0.8035841, -1.509549, 3.342412, 0.5960785, 0, 1, 1,
0.8079123, 0.01093207, 0.1742177, 0.6039216, 0, 1, 1,
0.8121557, 0.4388574, 1.833279, 0.6078432, 0, 1, 1,
0.812929, 0.3762222, -0.01809502, 0.6156863, 0, 1, 1,
0.8150015, -0.1666317, 2.927264, 0.6196079, 0, 1, 1,
0.8214067, -1.289204, 2.508595, 0.627451, 0, 1, 1,
0.8232483, 2.548273, -0.9247276, 0.6313726, 0, 1, 1,
0.8234199, -0.1386619, 1.106279, 0.6392157, 0, 1, 1,
0.8235988, -0.5887583, 1.419547, 0.6431373, 0, 1, 1,
0.8257902, -1.208621, 3.920943, 0.6509804, 0, 1, 1,
0.8315231, 0.2735971, -0.07070852, 0.654902, 0, 1, 1,
0.8325976, -0.955524, 2.659441, 0.6627451, 0, 1, 1,
0.8347254, 0.6062135, 3.688131, 0.6666667, 0, 1, 1,
0.8470392, -0.9311253, 2.173008, 0.6745098, 0, 1, 1,
0.8481835, -0.4190639, 1.518062, 0.6784314, 0, 1, 1,
0.8566858, -1.415087, 2.444882, 0.6862745, 0, 1, 1,
0.8569523, 0.6532663, 1.699479, 0.6901961, 0, 1, 1,
0.8595043, -0.9301913, 1.836948, 0.6980392, 0, 1, 1,
0.8619776, -1.954404, 1.964577, 0.7058824, 0, 1, 1,
0.8643953, -0.5395662, 1.673991, 0.7098039, 0, 1, 1,
0.8687051, -0.2587827, 1.207908, 0.7176471, 0, 1, 1,
0.8717633, -0.4319768, 1.80379, 0.7215686, 0, 1, 1,
0.8738397, 1.895317, -0.660306, 0.7294118, 0, 1, 1,
0.8766267, 0.06701131, 2.34591, 0.7333333, 0, 1, 1,
0.88052, 0.2092796, 1.10083, 0.7411765, 0, 1, 1,
0.8845817, -0.362023, 1.03712, 0.7450981, 0, 1, 1,
0.8871946, 0.1208636, 2.779484, 0.7529412, 0, 1, 1,
0.8904285, 1.38701, 0.4242065, 0.7568628, 0, 1, 1,
0.8956489, 0.05900646, 2.290235, 0.7647059, 0, 1, 1,
0.9026122, -1.13622, 2.13964, 0.7686275, 0, 1, 1,
0.9052441, -0.1405475, 2.571077, 0.7764706, 0, 1, 1,
0.9069749, 0.4967794, -0.1817969, 0.7803922, 0, 1, 1,
0.9072307, -0.5607944, 2.529302, 0.7882353, 0, 1, 1,
0.911903, -0.8922467, 1.561616, 0.7921569, 0, 1, 1,
0.9136129, -0.8098742, 2.724114, 0.8, 0, 1, 1,
0.9159126, 0.5290383, 1.954053, 0.8078431, 0, 1, 1,
0.9236933, 0.5645533, 1.000811, 0.8117647, 0, 1, 1,
0.9237838, -0.7334797, 3.849825, 0.8196079, 0, 1, 1,
0.9280905, -1.041462, 1.58066, 0.8235294, 0, 1, 1,
0.9328444, -0.11524, 0.8356335, 0.8313726, 0, 1, 1,
0.9398889, -0.379219, 1.730629, 0.8352941, 0, 1, 1,
0.9419109, 0.3267515, -0.02387106, 0.8431373, 0, 1, 1,
0.9440022, 0.1277067, 3.821574, 0.8470588, 0, 1, 1,
0.9443548, 0.122055, 0.8429335, 0.854902, 0, 1, 1,
0.9475229, 0.7542799, -1.237282, 0.8588235, 0, 1, 1,
0.9508565, 0.1746357, 1.473158, 0.8666667, 0, 1, 1,
0.9510991, 0.7121077, 1.834337, 0.8705882, 0, 1, 1,
0.95257, 1.424211, 1.928976, 0.8784314, 0, 1, 1,
0.9537861, -0.8537933, 1.48483, 0.8823529, 0, 1, 1,
0.9557946, 1.094607, -0.3012744, 0.8901961, 0, 1, 1,
0.9562942, 0.2798541, 1.41219, 0.8941177, 0, 1, 1,
0.9578816, -0.988498, 2.989765, 0.9019608, 0, 1, 1,
0.9627157, 1.722265, -0.8070678, 0.9098039, 0, 1, 1,
0.970206, 0.2503145, 0.1205085, 0.9137255, 0, 1, 1,
0.9807059, -0.9258003, 3.317961, 0.9215686, 0, 1, 1,
0.985424, 0.4070501, 2.782859, 0.9254902, 0, 1, 1,
0.9879545, -1.430699, 2.900713, 0.9333333, 0, 1, 1,
0.9909751, 1.553741, 0.9713117, 0.9372549, 0, 1, 1,
0.9920132, 0.9497084, 1.461071, 0.945098, 0, 1, 1,
0.9920397, 1.000021, 2.06446, 0.9490196, 0, 1, 1,
1.005311, 0.9186245, 1.583142, 0.9568627, 0, 1, 1,
1.006377, 0.5338385, 0.9872391, 0.9607843, 0, 1, 1,
1.006535, -0.004017127, 0.6267747, 0.9686275, 0, 1, 1,
1.011519, 0.007947148, -0.4826602, 0.972549, 0, 1, 1,
1.011994, 2.357348, -0.4099299, 0.9803922, 0, 1, 1,
1.0125, 0.4311597, 2.807799, 0.9843137, 0, 1, 1,
1.018262, -0.1666024, 1.294914, 0.9921569, 0, 1, 1,
1.02555, -0.6607484, 0.6426218, 0.9960784, 0, 1, 1,
1.029134, -0.9697919, 4.099815, 1, 0, 0.9960784, 1,
1.029895, 1.91977, 1.241323, 1, 0, 0.9882353, 1,
1.031297, 1.803764, -0.0261392, 1, 0, 0.9843137, 1,
1.031825, -0.6317002, 2.065771, 1, 0, 0.9764706, 1,
1.032627, 0.5073968, 0.3786136, 1, 0, 0.972549, 1,
1.036699, -0.4527171, 3.084539, 1, 0, 0.9647059, 1,
1.039221, -1.280149, 1.635377, 1, 0, 0.9607843, 1,
1.039678, -0.4430654, 0.6602465, 1, 0, 0.9529412, 1,
1.040763, 0.2073823, 1.490663, 1, 0, 0.9490196, 1,
1.041851, 0.3689126, 0.991357, 1, 0, 0.9411765, 1,
1.042827, 0.9563568, 3.059298, 1, 0, 0.9372549, 1,
1.043379, 1.373707, -0.7350615, 1, 0, 0.9294118, 1,
1.044778, -0.04254926, 1.410211, 1, 0, 0.9254902, 1,
1.049795, -1.345334, 2.599046, 1, 0, 0.9176471, 1,
1.051213, -0.5700712, 1.603524, 1, 0, 0.9137255, 1,
1.057197, -0.6566604, 3.509273, 1, 0, 0.9058824, 1,
1.070137, 0.233476, 2.016291, 1, 0, 0.9019608, 1,
1.07443, 0.3809407, 2.057991, 1, 0, 0.8941177, 1,
1.076614, 0.4707098, 0.5348664, 1, 0, 0.8862745, 1,
1.093233, -0.6481538, 3.689634, 1, 0, 0.8823529, 1,
1.10604, 0.7717717, 2.225865, 1, 0, 0.8745098, 1,
1.10655, 0.6493276, -0.818234, 1, 0, 0.8705882, 1,
1.115624, -1.160922, 4.496152, 1, 0, 0.8627451, 1,
1.117137, 0.2953081, 1.81983, 1, 0, 0.8588235, 1,
1.117932, 0.06442458, 2.513363, 1, 0, 0.8509804, 1,
1.120062, -0.6923494, 2.883457, 1, 0, 0.8470588, 1,
1.121851, 0.03095816, 1.555434, 1, 0, 0.8392157, 1,
1.129152, -1.112399, 2.029978, 1, 0, 0.8352941, 1,
1.132912, -1.124366, 0.5573077, 1, 0, 0.827451, 1,
1.137907, -0.17136, 0.8437389, 1, 0, 0.8235294, 1,
1.138618, 0.4417664, 1.016668, 1, 0, 0.8156863, 1,
1.139828, 0.3230389, 2.357643, 1, 0, 0.8117647, 1,
1.141369, 3.467188, 1.588945, 1, 0, 0.8039216, 1,
1.142745, 0.7616755, 1.535244, 1, 0, 0.7960784, 1,
1.146915, -1.296841, 2.026341, 1, 0, 0.7921569, 1,
1.150081, -0.7991111, 2.868629, 1, 0, 0.7843137, 1,
1.167897, -1.110745, 4.983974, 1, 0, 0.7803922, 1,
1.174816, -1.188637, 1.402243, 1, 0, 0.772549, 1,
1.178137, 0.8485119, 0.9262375, 1, 0, 0.7686275, 1,
1.184227, -0.7349786, 4.66818, 1, 0, 0.7607843, 1,
1.185364, 0.5926192, 1.354299, 1, 0, 0.7568628, 1,
1.192471, 1.080569, 0.4390224, 1, 0, 0.7490196, 1,
1.202155, -0.4331302, 2.277811, 1, 0, 0.7450981, 1,
1.206022, -0.1081086, 2.295003, 1, 0, 0.7372549, 1,
1.209353, -1.387593, 3.581133, 1, 0, 0.7333333, 1,
1.219696, -0.08614477, 0.4381417, 1, 0, 0.7254902, 1,
1.233309, 1.254845, 3.24068, 1, 0, 0.7215686, 1,
1.236546, -0.1445944, 1.283321, 1, 0, 0.7137255, 1,
1.239136, 1.609299, 1.459981, 1, 0, 0.7098039, 1,
1.242981, -0.09626409, 1.133812, 1, 0, 0.7019608, 1,
1.250942, -1.285743, 0.9597448, 1, 0, 0.6941177, 1,
1.25363, -0.9544548, 3.704986, 1, 0, 0.6901961, 1,
1.254465, -0.3679997, 2.270101, 1, 0, 0.682353, 1,
1.257831, -0.3270855, 2.828977, 1, 0, 0.6784314, 1,
1.26007, 0.2124833, 2.122828, 1, 0, 0.6705883, 1,
1.270096, 1.087203, 0.8326775, 1, 0, 0.6666667, 1,
1.287974, 1.174271, 1.373531, 1, 0, 0.6588235, 1,
1.289282, -1.087507, 4.259304, 1, 0, 0.654902, 1,
1.294001, -0.3350397, 1.188319, 1, 0, 0.6470588, 1,
1.296577, -0.9676577, 2.378235, 1, 0, 0.6431373, 1,
1.300935, -0.2790388, 2.057313, 1, 0, 0.6352941, 1,
1.306333, -0.5170381, 0.8098817, 1, 0, 0.6313726, 1,
1.309439, -0.6631548, 1.447479, 1, 0, 0.6235294, 1,
1.31143, 0.2727607, 0.9158884, 1, 0, 0.6196079, 1,
1.325778, -1.842303, 1.423305, 1, 0, 0.6117647, 1,
1.326982, 0.0945603, 0.3940481, 1, 0, 0.6078432, 1,
1.328074, -0.5825801, 1.217267, 1, 0, 0.6, 1,
1.337746, 0.06820025, 2.960878, 1, 0, 0.5921569, 1,
1.339475, -0.7147527, 3.154811, 1, 0, 0.5882353, 1,
1.342018, 1.358809, 2.746943, 1, 0, 0.5803922, 1,
1.34964, 0.8409118, 3.065158, 1, 0, 0.5764706, 1,
1.357132, -0.5987293, 1.894304, 1, 0, 0.5686275, 1,
1.367251, 0.03867685, 2.684222, 1, 0, 0.5647059, 1,
1.369329, -1.131371, 1.209388, 1, 0, 0.5568628, 1,
1.369951, 1.710866, 0.298128, 1, 0, 0.5529412, 1,
1.371529, -1.757357, 1.812674, 1, 0, 0.5450981, 1,
1.376777, -0.5922542, 1.325125, 1, 0, 0.5411765, 1,
1.386629, -0.3685507, 0.5591908, 1, 0, 0.5333334, 1,
1.38803, 1.561714, 0.4495253, 1, 0, 0.5294118, 1,
1.388068, 0.8606545, 0.3028434, 1, 0, 0.5215687, 1,
1.391079, 1.612066, 1.508788, 1, 0, 0.5176471, 1,
1.400764, 1.084472, 0.2646567, 1, 0, 0.509804, 1,
1.402334, 0.4461738, 0.7274253, 1, 0, 0.5058824, 1,
1.40781, 0.209137, 1.790014, 1, 0, 0.4980392, 1,
1.421065, 1.429702, 0.8108668, 1, 0, 0.4901961, 1,
1.433804, -1.668083, 1.487546, 1, 0, 0.4862745, 1,
1.439588, -0.238683, 3.089263, 1, 0, 0.4784314, 1,
1.440342, -0.4570717, 0.2357771, 1, 0, 0.4745098, 1,
1.440417, 0.311918, 0.6828463, 1, 0, 0.4666667, 1,
1.441188, 1.018374, 1.611397, 1, 0, 0.4627451, 1,
1.463229, -0.3543466, 1.143819, 1, 0, 0.454902, 1,
1.463993, 0.2786596, 0.335597, 1, 0, 0.4509804, 1,
1.477987, -0.3014137, 2.103033, 1, 0, 0.4431373, 1,
1.498916, -0.5647073, 1.443071, 1, 0, 0.4392157, 1,
1.509856, -0.3527147, 1.221861, 1, 0, 0.4313726, 1,
1.522366, 1.563656, 0.1573539, 1, 0, 0.427451, 1,
1.561904, -0.4485078, 2.159157, 1, 0, 0.4196078, 1,
1.572807, 0.808521, -0.455612, 1, 0, 0.4156863, 1,
1.585991, 1.151528, 1.587409, 1, 0, 0.4078431, 1,
1.590983, -0.9822079, 2.208001, 1, 0, 0.4039216, 1,
1.599875, -1.023051, 1.345605, 1, 0, 0.3960784, 1,
1.606113, -0.3942432, 1.481191, 1, 0, 0.3882353, 1,
1.608112, -0.3121233, 2.285754, 1, 0, 0.3843137, 1,
1.628283, -2.288779, 2.977885, 1, 0, 0.3764706, 1,
1.629648, 1.589744, 2.22729, 1, 0, 0.372549, 1,
1.652522, -1.379713, 2.559103, 1, 0, 0.3647059, 1,
1.652852, 0.1833515, 0.9814683, 1, 0, 0.3607843, 1,
1.662586, -0.2370111, 2.331134, 1, 0, 0.3529412, 1,
1.664921, -0.1419003, 2.499564, 1, 0, 0.3490196, 1,
1.668419, -0.6002939, 2.694119, 1, 0, 0.3411765, 1,
1.670778, 1.216831, 0.901558, 1, 0, 0.3372549, 1,
1.696013, 0.5750973, 1.416634, 1, 0, 0.3294118, 1,
1.700265, -0.694123, 2.471864, 1, 0, 0.3254902, 1,
1.718912, 1.007183, 0.1542506, 1, 0, 0.3176471, 1,
1.734849, -1.248774, 2.986946, 1, 0, 0.3137255, 1,
1.73621, -2.188728, 2.29488, 1, 0, 0.3058824, 1,
1.742337, -0.4336973, 3.005471, 1, 0, 0.2980392, 1,
1.742563, 1.960337, 2.220778, 1, 0, 0.2941177, 1,
1.74679, -0.5137782, 1.199453, 1, 0, 0.2862745, 1,
1.764236, -0.3644007, 2.377269, 1, 0, 0.282353, 1,
1.780442, 0.6889765, 1.023797, 1, 0, 0.2745098, 1,
1.79036, 0.7615864, 0.7253492, 1, 0, 0.2705882, 1,
1.798777, -0.1095183, 0.7171949, 1, 0, 0.2627451, 1,
1.802825, 0.1859255, 2.622289, 1, 0, 0.2588235, 1,
1.80486, -0.2927403, 1.00559, 1, 0, 0.2509804, 1,
1.806148, 0.02823673, 1.792462, 1, 0, 0.2470588, 1,
1.824822, 0.5548116, 3.141237, 1, 0, 0.2392157, 1,
1.83532, 1.12621, 2.253136, 1, 0, 0.2352941, 1,
1.839691, 1.428277, 1.073768, 1, 0, 0.227451, 1,
1.85749, 1.699729, 1.950612, 1, 0, 0.2235294, 1,
1.878445, -0.7318424, 1.783331, 1, 0, 0.2156863, 1,
1.882367, 2.140237, 1.1585, 1, 0, 0.2117647, 1,
1.882573, 0.5748147, 2.146351, 1, 0, 0.2039216, 1,
1.885545, 0.1288542, 3.204521, 1, 0, 0.1960784, 1,
1.893429, -0.7534191, 2.51715, 1, 0, 0.1921569, 1,
1.903854, 1.079822, 1.923921, 1, 0, 0.1843137, 1,
1.904684, -0.3074462, 1.044011, 1, 0, 0.1803922, 1,
1.912993, -0.8835015, 3.403028, 1, 0, 0.172549, 1,
1.925379, 1.054667, 2.220449, 1, 0, 0.1686275, 1,
1.938117, -0.01488858, 0.1339968, 1, 0, 0.1607843, 1,
1.946958, -0.4395123, 1.752489, 1, 0, 0.1568628, 1,
1.975186, 0.8529614, 0.9191739, 1, 0, 0.1490196, 1,
1.993431, 0.8021348, -0.3561879, 1, 0, 0.145098, 1,
1.997945, -0.1532733, 2.17388, 1, 0, 0.1372549, 1,
2.008576, -0.1864401, 1.142631, 1, 0, 0.1333333, 1,
2.017453, -0.4256327, 0.9545538, 1, 0, 0.1254902, 1,
2.048021, 0.4464235, 1.376927, 1, 0, 0.1215686, 1,
2.081729, -1.373545, 0.5803735, 1, 0, 0.1137255, 1,
2.102572, 0.7510631, 2.437672, 1, 0, 0.1098039, 1,
2.130198, 0.8129054, 1.805509, 1, 0, 0.1019608, 1,
2.160792, -0.304334, 1.759451, 1, 0, 0.09411765, 1,
2.174394, -0.5514359, 0.4095183, 1, 0, 0.09019608, 1,
2.191789, -0.4471841, 1.639949, 1, 0, 0.08235294, 1,
2.197559, 1.304644, 1.017453, 1, 0, 0.07843138, 1,
2.199407, -0.6872373, 3.305681, 1, 0, 0.07058824, 1,
2.206333, -0.9578417, 0.7212341, 1, 0, 0.06666667, 1,
2.233027, -0.9540636, 3.033354, 1, 0, 0.05882353, 1,
2.342794, 0.3179562, 2.389812, 1, 0, 0.05490196, 1,
2.35196, -1.037102, 0.6166973, 1, 0, 0.04705882, 1,
2.367712, 0.2075301, 1.046275, 1, 0, 0.04313726, 1,
2.504332, -0.5237432, 1.226305, 1, 0, 0.03529412, 1,
2.531791, -0.1745613, 1.424929, 1, 0, 0.03137255, 1,
2.544748, 0.4709381, 2.249043, 1, 0, 0.02352941, 1,
2.618271, -0.006532128, 1.347116, 1, 0, 0.01960784, 1,
2.670419, -0.08077415, 3.289845, 1, 0, 0.01176471, 1,
3.148881, -0.4319066, 1.924562, 1, 0, 0.007843138, 1
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
-0.1720148, -3.782853, -7.637373, 0, -0.5, 0.5, 0.5,
-0.1720148, -3.782853, -7.637373, 1, -0.5, 0.5, 0.5,
-0.1720148, -3.782853, -7.637373, 1, 1.5, 0.5, 0.5,
-0.1720148, -3.782853, -7.637373, 0, 1.5, 0.5, 0.5
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
-4.618694, 0.3675554, -7.637373, 0, -0.5, 0.5, 0.5,
-4.618694, 0.3675554, -7.637373, 1, -0.5, 0.5, 0.5,
-4.618694, 0.3675554, -7.637373, 1, 1.5, 0.5, 0.5,
-4.618694, 0.3675554, -7.637373, 0, 1.5, 0.5, 0.5
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
-4.618694, -3.782853, 1.042598, 0, -0.5, 0.5, 0.5,
-4.618694, -3.782853, 1.042598, 1, -0.5, 0.5, 0.5,
-4.618694, -3.782853, 1.042598, 1, 1.5, 0.5, 0.5,
-4.618694, -3.782853, 1.042598, 0, 1.5, 0.5, 0.5
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
-3, -2.825066, -5.634303,
3, -2.825066, -5.634303,
-3, -2.825066, -5.634303,
-3, -2.984697, -5.968148,
-2, -2.825066, -5.634303,
-2, -2.984697, -5.968148,
-1, -2.825066, -5.634303,
-1, -2.984697, -5.968148,
0, -2.825066, -5.634303,
0, -2.984697, -5.968148,
1, -2.825066, -5.634303,
1, -2.984697, -5.968148,
2, -2.825066, -5.634303,
2, -2.984697, -5.968148,
3, -2.825066, -5.634303,
3, -2.984697, -5.968148
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
-3, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
-3, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
-3, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
-3, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5,
-2, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
-2, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
-2, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
-2, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5,
-1, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
-1, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
-1, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
-1, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5,
0, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
0, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
0, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
0, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5,
1, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
1, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
1, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
1, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5,
2, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
2, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
2, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
2, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5,
3, -3.30396, -6.635839, 0, -0.5, 0.5, 0.5,
3, -3.30396, -6.635839, 1, -0.5, 0.5, 0.5,
3, -3.30396, -6.635839, 1, 1.5, 0.5, 0.5,
3, -3.30396, -6.635839, 0, 1.5, 0.5, 0.5
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
-3.592537, -2, -5.634303,
-3.592537, 3, -5.634303,
-3.592537, -2, -5.634303,
-3.763563, -2, -5.968148,
-3.592537, -1, -5.634303,
-3.763563, -1, -5.968148,
-3.592537, 0, -5.634303,
-3.763563, 0, -5.968148,
-3.592537, 1, -5.634303,
-3.763563, 1, -5.968148,
-3.592537, 2, -5.634303,
-3.763563, 2, -5.968148,
-3.592537, 3, -5.634303,
-3.763563, 3, -5.968148
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
-4.105616, -2, -6.635839, 0, -0.5, 0.5, 0.5,
-4.105616, -2, -6.635839, 1, -0.5, 0.5, 0.5,
-4.105616, -2, -6.635839, 1, 1.5, 0.5, 0.5,
-4.105616, -2, -6.635839, 0, 1.5, 0.5, 0.5,
-4.105616, -1, -6.635839, 0, -0.5, 0.5, 0.5,
-4.105616, -1, -6.635839, 1, -0.5, 0.5, 0.5,
-4.105616, -1, -6.635839, 1, 1.5, 0.5, 0.5,
-4.105616, -1, -6.635839, 0, 1.5, 0.5, 0.5,
-4.105616, 0, -6.635839, 0, -0.5, 0.5, 0.5,
-4.105616, 0, -6.635839, 1, -0.5, 0.5, 0.5,
-4.105616, 0, -6.635839, 1, 1.5, 0.5, 0.5,
-4.105616, 0, -6.635839, 0, 1.5, 0.5, 0.5,
-4.105616, 1, -6.635839, 0, -0.5, 0.5, 0.5,
-4.105616, 1, -6.635839, 1, -0.5, 0.5, 0.5,
-4.105616, 1, -6.635839, 1, 1.5, 0.5, 0.5,
-4.105616, 1, -6.635839, 0, 1.5, 0.5, 0.5,
-4.105616, 2, -6.635839, 0, -0.5, 0.5, 0.5,
-4.105616, 2, -6.635839, 1, -0.5, 0.5, 0.5,
-4.105616, 2, -6.635839, 1, 1.5, 0.5, 0.5,
-4.105616, 2, -6.635839, 0, 1.5, 0.5, 0.5,
-4.105616, 3, -6.635839, 0, -0.5, 0.5, 0.5,
-4.105616, 3, -6.635839, 1, -0.5, 0.5, 0.5,
-4.105616, 3, -6.635839, 1, 1.5, 0.5, 0.5,
-4.105616, 3, -6.635839, 0, 1.5, 0.5, 0.5
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
-3.592537, -2.825066, -4,
-3.592537, -2.825066, 6,
-3.592537, -2.825066, -4,
-3.763563, -2.984697, -4,
-3.592537, -2.825066, -2,
-3.763563, -2.984697, -2,
-3.592537, -2.825066, 0,
-3.763563, -2.984697, 0,
-3.592537, -2.825066, 2,
-3.763563, -2.984697, 2,
-3.592537, -2.825066, 4,
-3.763563, -2.984697, 4,
-3.592537, -2.825066, 6,
-3.763563, -2.984697, 6
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
-4.105616, -3.30396, -4, 0, -0.5, 0.5, 0.5,
-4.105616, -3.30396, -4, 1, -0.5, 0.5, 0.5,
-4.105616, -3.30396, -4, 1, 1.5, 0.5, 0.5,
-4.105616, -3.30396, -4, 0, 1.5, 0.5, 0.5,
-4.105616, -3.30396, -2, 0, -0.5, 0.5, 0.5,
-4.105616, -3.30396, -2, 1, -0.5, 0.5, 0.5,
-4.105616, -3.30396, -2, 1, 1.5, 0.5, 0.5,
-4.105616, -3.30396, -2, 0, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 0, 0, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 0, 1, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 0, 1, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 0, 0, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 2, 0, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 2, 1, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 2, 1, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 2, 0, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 4, 0, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 4, 1, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 4, 1, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 4, 0, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 6, 0, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 6, 1, -0.5, 0.5, 0.5,
-4.105616, -3.30396, 6, 1, 1.5, 0.5, 0.5,
-4.105616, -3.30396, 6, 0, 1.5, 0.5, 0.5
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
-3.592537, -2.825066, -5.634303,
-3.592537, 3.560177, -5.634303,
-3.592537, -2.825066, 7.7195,
-3.592537, 3.560177, 7.7195,
-3.592537, -2.825066, -5.634303,
-3.592537, -2.825066, 7.7195,
-3.592537, 3.560177, -5.634303,
-3.592537, 3.560177, 7.7195,
-3.592537, -2.825066, -5.634303,
3.248507, -2.825066, -5.634303,
-3.592537, -2.825066, 7.7195,
3.248507, -2.825066, 7.7195,
-3.592537, 3.560177, -5.634303,
3.248507, 3.560177, -5.634303,
-3.592537, 3.560177, 7.7195,
3.248507, 3.560177, 7.7195,
3.248507, -2.825066, -5.634303,
3.248507, 3.560177, -5.634303,
3.248507, -2.825066, 7.7195,
3.248507, 3.560177, 7.7195,
3.248507, -2.825066, -5.634303,
3.248507, -2.825066, 7.7195,
3.248507, 3.560177, -5.634303,
3.248507, 3.560177, 7.7195
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
var radius = 8.707245;
var distance = 38.73952;
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
mvMatrix.translate( 0.1720148, -0.3675554, -1.042598 );
mvMatrix.scale( 1.376171, 1.474406, 0.705001 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.73952);
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
acetanilide<-read.table("acetanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acetanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetanilide' not found
```

```r
y<-acetanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetanilide' not found
```

```r
z<-acetanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetanilide' not found
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
-3.49291, 2.016985, -3.004125, 0, 0, 1, 1, 1,
-3.002728, -0.3842328, -0.3747168, 1, 0, 0, 1, 1,
-3.000389, 1.117792, -1.170007, 1, 0, 0, 1, 1,
-2.824696, -0.2377245, -2.078006, 1, 0, 0, 1, 1,
-2.774527, 0.9403831, -1.467972, 1, 0, 0, 1, 1,
-2.759073, 0.2231117, -3.169619, 1, 0, 0, 1, 1,
-2.58169, 0.1622225, -0.27505, 0, 0, 0, 1, 1,
-2.572133, 1.773275, -0.6490794, 0, 0, 0, 1, 1,
-2.522331, -0.8067048, -1.778184, 0, 0, 0, 1, 1,
-2.510031, 0.2925424, -1.340322, 0, 0, 0, 1, 1,
-2.453026, 0.9701549, -1.508619, 0, 0, 0, 1, 1,
-2.305005, -1.439563, -3.343519, 0, 0, 0, 1, 1,
-2.296679, 0.5910169, -1.023468, 0, 0, 0, 1, 1,
-2.283402, 0.7401904, -1.595634, 1, 1, 1, 1, 1,
-2.282146, -0.7055896, -1.848415, 1, 1, 1, 1, 1,
-2.2565, -0.3935474, 0.5723252, 1, 1, 1, 1, 1,
-2.254889, 0.07713136, -0.5567228, 1, 1, 1, 1, 1,
-2.219155, 1.354314, -0.3501553, 1, 1, 1, 1, 1,
-2.179609, 1.415028, -0.9354246, 1, 1, 1, 1, 1,
-2.177935, 0.7459985, -0.6039035, 1, 1, 1, 1, 1,
-2.139804, -0.6712615, -1.638559, 1, 1, 1, 1, 1,
-2.126382, 1.056014, -2.255243, 1, 1, 1, 1, 1,
-2.109114, 0.7977186, -0.5135363, 1, 1, 1, 1, 1,
-2.108359, 0.3663972, 0.1020618, 1, 1, 1, 1, 1,
-2.081854, -1.325434, -1.370715, 1, 1, 1, 1, 1,
-2.049292, 1.656906, -1.263354, 1, 1, 1, 1, 1,
-2.015568, 1.105606, -0.3231483, 1, 1, 1, 1, 1,
-1.99003, 2.363314, -0.6808349, 1, 1, 1, 1, 1,
-1.98848, -0.389835, -0.4624466, 0, 0, 1, 1, 1,
-1.95323, 0.9180135, 0.2378433, 1, 0, 0, 1, 1,
-1.95258, 1.024271, -3.610902, 1, 0, 0, 1, 1,
-1.939435, 1.497998, -2.321601, 1, 0, 0, 1, 1,
-1.932977, 2.062144, -0.4902104, 1, 0, 0, 1, 1,
-1.89759, 0.7132863, -0.6222789, 1, 0, 0, 1, 1,
-1.892977, -1.022456, -1.696522, 0, 0, 0, 1, 1,
-1.860978, 1.068771, 0.7442194, 0, 0, 0, 1, 1,
-1.859971, 0.3637203, -0.3581444, 0, 0, 0, 1, 1,
-1.844513, -0.1188046, -1.952656, 0, 0, 0, 1, 1,
-1.840297, 1.40137, 0.408583, 0, 0, 0, 1, 1,
-1.825852, 0.626343, -1.919125, 0, 0, 0, 1, 1,
-1.815586, -0.1266393, -2.487576, 0, 0, 0, 1, 1,
-1.815044, -0.6740335, -1.164401, 1, 1, 1, 1, 1,
-1.814777, -1.719941, -3.179557, 1, 1, 1, 1, 1,
-1.80582, -0.1216402, -0.9182082, 1, 1, 1, 1, 1,
-1.763676, 1.506012, -0.5699027, 1, 1, 1, 1, 1,
-1.742124, -0.251288, -1.961839, 1, 1, 1, 1, 1,
-1.739473, 0.9269099, -1.312683, 1, 1, 1, 1, 1,
-1.707203, -0.7783883, -1.408706, 1, 1, 1, 1, 1,
-1.704358, -0.9100535, -2.240889, 1, 1, 1, 1, 1,
-1.697521, 0.1020658, -1.828892, 1, 1, 1, 1, 1,
-1.693808, 0.8103237, -1.259706, 1, 1, 1, 1, 1,
-1.686163, 0.7735645, 0.05268239, 1, 1, 1, 1, 1,
-1.676207, -0.2926629, -1.74849, 1, 1, 1, 1, 1,
-1.66707, 1.884689, -0.1649411, 1, 1, 1, 1, 1,
-1.664469, -1.635187, -2.142791, 1, 1, 1, 1, 1,
-1.653932, -0.42224, -1.883077, 1, 1, 1, 1, 1,
-1.651265, 0.2686229, -1.738324, 0, 0, 1, 1, 1,
-1.632693, -0.3804395, -1.003118, 1, 0, 0, 1, 1,
-1.63118, 0.3756355, 0.1489963, 1, 0, 0, 1, 1,
-1.593285, 0.2781539, -1.276809, 1, 0, 0, 1, 1,
-1.590154, 1.000586, -1.721462, 1, 0, 0, 1, 1,
-1.574423, -2.591045, -2.070217, 1, 0, 0, 1, 1,
-1.566378, -0.1270998, -0.9993795, 0, 0, 0, 1, 1,
-1.564883, 0.8847927, 0.9911574, 0, 0, 0, 1, 1,
-1.564122, 0.4231568, -3.510462, 0, 0, 0, 1, 1,
-1.563488, 0.6584867, -1.067991, 0, 0, 0, 1, 1,
-1.550096, -0.6287081, -1.707631, 0, 0, 0, 1, 1,
-1.531478, -1.589889, -1.624913, 0, 0, 0, 1, 1,
-1.525302, 0.5526556, -0.2009417, 0, 0, 0, 1, 1,
-1.510873, -0.1394981, -4.007915, 1, 1, 1, 1, 1,
-1.504692, -0.1071815, -3.086337, 1, 1, 1, 1, 1,
-1.497424, 0.2455243, -1.191959, 1, 1, 1, 1, 1,
-1.486206, -0.03860193, -2.166292, 1, 1, 1, 1, 1,
-1.481696, -2.277131, -2.575193, 1, 1, 1, 1, 1,
-1.467287, 0.09018623, -0.9107057, 1, 1, 1, 1, 1,
-1.451731, 0.2871644, -1.272619, 1, 1, 1, 1, 1,
-1.446396, -0.1370051, -0.6380099, 1, 1, 1, 1, 1,
-1.438205, 0.2544229, -1.899123, 1, 1, 1, 1, 1,
-1.421583, 0.5219191, -0.9925573, 1, 1, 1, 1, 1,
-1.42157, -0.4738093, -3.400055, 1, 1, 1, 1, 1,
-1.419002, -2.582486, -3.121801, 1, 1, 1, 1, 1,
-1.406719, -1.643635, -2.53813, 1, 1, 1, 1, 1,
-1.406659, -0.3967564, 0.03509118, 1, 1, 1, 1, 1,
-1.402907, 2.836205, -0.8082726, 1, 1, 1, 1, 1,
-1.392585, 1.375943, 0.671196, 0, 0, 1, 1, 1,
-1.381358, 2.123264, -2.474432, 1, 0, 0, 1, 1,
-1.375422, -1.188111, -1.768621, 1, 0, 0, 1, 1,
-1.370294, 0.05206082, -2.513629, 1, 0, 0, 1, 1,
-1.369483, -0.4463508, -1.933061, 1, 0, 0, 1, 1,
-1.365118, -0.732353, -1.008618, 1, 0, 0, 1, 1,
-1.348057, -0.3136647, -2.499897, 0, 0, 0, 1, 1,
-1.344218, -0.0499969, -1.395684, 0, 0, 0, 1, 1,
-1.343192, -0.4527985, -3.713181, 0, 0, 0, 1, 1,
-1.321246, 0.9227051, -1.124912, 0, 0, 0, 1, 1,
-1.314142, 0.7345383, -2.28469, 0, 0, 0, 1, 1,
-1.313258, 0.8053146, -1.367377, 0, 0, 0, 1, 1,
-1.310078, 0.3535678, -0.5188527, 0, 0, 0, 1, 1,
-1.301279, -1.12773, -3.238619, 1, 1, 1, 1, 1,
-1.30025, -0.9790798, -2.284425, 1, 1, 1, 1, 1,
-1.295415, -0.5370617, -1.702339, 1, 1, 1, 1, 1,
-1.288213, -0.1636511, -2.161413, 1, 1, 1, 1, 1,
-1.281546, 2.000867, -0.5260041, 1, 1, 1, 1, 1,
-1.280372, 1.474647, -1.122944, 1, 1, 1, 1, 1,
-1.270699, 1.794354, -1.713439, 1, 1, 1, 1, 1,
-1.262528, -0.4639218, -1.614939, 1, 1, 1, 1, 1,
-1.261826, -1.763962, -2.372483, 1, 1, 1, 1, 1,
-1.253708, -1.610997, -2.033415, 1, 1, 1, 1, 1,
-1.24775, -0.8142658, -1.196367, 1, 1, 1, 1, 1,
-1.245869, 0.2123626, -1.407429, 1, 1, 1, 1, 1,
-1.240963, 0.2852062, -1.624497, 1, 1, 1, 1, 1,
-1.237105, 0.6438549, -0.8002861, 1, 1, 1, 1, 1,
-1.226577, -0.3363356, -1.501793, 1, 1, 1, 1, 1,
-1.213265, 0.4047908, 0.2644715, 0, 0, 1, 1, 1,
-1.213189, 0.2089652, -0.6179172, 1, 0, 0, 1, 1,
-1.207246, 1.013926, -1.20343, 1, 0, 0, 1, 1,
-1.205236, 0.4049736, -0.8262264, 1, 0, 0, 1, 1,
-1.198149, -2.318242, -2.217698, 1, 0, 0, 1, 1,
-1.197744, 0.3774777, -1.051657, 1, 0, 0, 1, 1,
-1.193475, -0.3546745, -2.566734, 0, 0, 0, 1, 1,
-1.190251, 0.6256204, 0.00324488, 0, 0, 0, 1, 1,
-1.18768, 0.984579, 0.08088158, 0, 0, 0, 1, 1,
-1.185175, -2.21415, -2.156923, 0, 0, 0, 1, 1,
-1.184554, -0.6281003, -0.8331622, 0, 0, 0, 1, 1,
-1.180467, -1.395383, -1.89187, 0, 0, 0, 1, 1,
-1.179187, 1.44113, -1.786865, 0, 0, 0, 1, 1,
-1.175739, 0.1029131, -0.6951389, 1, 1, 1, 1, 1,
-1.175075, -0.5588359, -0.1804228, 1, 1, 1, 1, 1,
-1.171781, 0.001635994, -2.079909, 1, 1, 1, 1, 1,
-1.162006, 0.4385124, -2.427225, 1, 1, 1, 1, 1,
-1.156746, 0.6714794, 0.4688618, 1, 1, 1, 1, 1,
-1.155638, -1.765042, -1.964485, 1, 1, 1, 1, 1,
-1.152992, 0.04371065, -2.204501, 1, 1, 1, 1, 1,
-1.150711, 1.215753, 1.084898, 1, 1, 1, 1, 1,
-1.143562, -1.691625, -2.624828, 1, 1, 1, 1, 1,
-1.139743, -0.8370874, -0.3422726, 1, 1, 1, 1, 1,
-1.131429, -0.258507, -0.9999906, 1, 1, 1, 1, 1,
-1.127728, -2.41424, -2.990339, 1, 1, 1, 1, 1,
-1.127355, 1.682351, 0.6806564, 1, 1, 1, 1, 1,
-1.126519, 1.407103, -1.496308, 1, 1, 1, 1, 1,
-1.125429, 1.705554, -0.7442256, 1, 1, 1, 1, 1,
-1.125414, -1.15815, -5.002781, 0, 0, 1, 1, 1,
-1.123425, 2.089366, 0.1364508, 1, 0, 0, 1, 1,
-1.119638, 1.049466, -0.4605789, 1, 0, 0, 1, 1,
-1.113919, 0.9597912, -1.334367, 1, 0, 0, 1, 1,
-1.111107, -0.4306299, -1.176017, 1, 0, 0, 1, 1,
-1.10599, -0.2716178, -1.842226, 1, 0, 0, 1, 1,
-1.104046, -0.5711094, -1.029204, 0, 0, 0, 1, 1,
-1.086241, -0.1163166, -0.2083163, 0, 0, 0, 1, 1,
-1.069664, -1.378356, -0.760254, 0, 0, 0, 1, 1,
-1.060784, -2.563623, -0.4775105, 0, 0, 0, 1, 1,
-1.056917, -0.08121969, 0.07582843, 0, 0, 0, 1, 1,
-1.056834, -0.2388989, -3.332012, 0, 0, 0, 1, 1,
-1.053159, -0.4482799, -3.087113, 0, 0, 0, 1, 1,
-1.038566, -0.06895456, -1.270663, 1, 1, 1, 1, 1,
-1.037519, -0.5619208, -1.676294, 1, 1, 1, 1, 1,
-1.032734, 0.02763345, -3.665839, 1, 1, 1, 1, 1,
-1.021974, 0.02011251, -0.3651096, 1, 1, 1, 1, 1,
-1.006039, 0.007932705, -0.8486364, 1, 1, 1, 1, 1,
-1.005111, -0.5594009, -2.791136, 1, 1, 1, 1, 1,
-1.004429, 0.5410047, -2.136436, 1, 1, 1, 1, 1,
-1.001934, -0.06708299, -3.548394, 1, 1, 1, 1, 1,
-0.9965757, -0.690559, -3.638344, 1, 1, 1, 1, 1,
-0.9960316, -0.1303619, -1.095967, 1, 1, 1, 1, 1,
-0.9953279, -0.007593442, 0.0136188, 1, 1, 1, 1, 1,
-0.9916084, 0.8751827, 0.1876071, 1, 1, 1, 1, 1,
-0.9853241, -0.183763, 0.5550077, 1, 1, 1, 1, 1,
-0.9830438, 1.210984, -3.522326, 1, 1, 1, 1, 1,
-0.9723591, -0.9611328, 0.249998, 1, 1, 1, 1, 1,
-0.9720196, -0.7129775, -2.042567, 0, 0, 1, 1, 1,
-0.970066, -0.001458755, -2.336253, 1, 0, 0, 1, 1,
-0.9602682, -0.8000236, -2.765817, 1, 0, 0, 1, 1,
-0.9585695, -0.8750637, -1.121958, 1, 0, 0, 1, 1,
-0.9584885, 0.8940895, 0.5091969, 1, 0, 0, 1, 1,
-0.9512563, 0.4866861, -1.543819, 1, 0, 0, 1, 1,
-0.9468247, 1.164753, -2.952121, 0, 0, 0, 1, 1,
-0.9388562, -0.1583533, -3.038587, 0, 0, 0, 1, 1,
-0.935909, -0.1040593, -3.36447, 0, 0, 0, 1, 1,
-0.9348266, -0.5646101, -2.738503, 0, 0, 0, 1, 1,
-0.9255795, 1.028512, -0.7914566, 0, 0, 0, 1, 1,
-0.9244549, 0.4982851, -1.135837, 0, 0, 0, 1, 1,
-0.9163259, -0.5389259, -2.616628, 0, 0, 0, 1, 1,
-0.9112476, 1.917661, -1.192366, 1, 1, 1, 1, 1,
-0.9103923, -1.213797, -3.795057, 1, 1, 1, 1, 1,
-0.9063831, 0.6408123, -0.8979036, 1, 1, 1, 1, 1,
-0.9049069, 0.54581, -1.556848, 1, 1, 1, 1, 1,
-0.9048671, -0.5194526, -2.615349, 1, 1, 1, 1, 1,
-0.901806, -0.113404, -2.264968, 1, 1, 1, 1, 1,
-0.8985658, 0.1797442, -1.397913, 1, 1, 1, 1, 1,
-0.8938146, 0.1267073, -4.00375, 1, 1, 1, 1, 1,
-0.8908075, -0.5734941, -1.616104, 1, 1, 1, 1, 1,
-0.8905956, 0.9717207, -1.434046, 1, 1, 1, 1, 1,
-0.888114, -0.7761042, -2.468485, 1, 1, 1, 1, 1,
-0.8874644, -0.3219608, -3.237852, 1, 1, 1, 1, 1,
-0.8827146, -0.2256205, -2.856914, 1, 1, 1, 1, 1,
-0.88251, 0.9065453, 0.1700869, 1, 1, 1, 1, 1,
-0.8809918, 1.256171, 0.2066534, 1, 1, 1, 1, 1,
-0.8678626, -0.01577983, -2.250619, 0, 0, 1, 1, 1,
-0.8638967, 0.2618476, -2.24437, 1, 0, 0, 1, 1,
-0.854127, 0.09155742, -3.090592, 1, 0, 0, 1, 1,
-0.8493769, -1.471185, -2.607844, 1, 0, 0, 1, 1,
-0.8479399, 0.5218959, -1.352705, 1, 0, 0, 1, 1,
-0.8434787, -0.3368877, -1.604163, 1, 0, 0, 1, 1,
-0.8376563, -0.7605824, -2.574431, 0, 0, 0, 1, 1,
-0.8360307, -2.704387, -1.29092, 0, 0, 0, 1, 1,
-0.8283321, -0.327184, -2.164484, 0, 0, 0, 1, 1,
-0.8260789, 0.3031368, -1.158937, 0, 0, 0, 1, 1,
-0.8252441, 0.7846712, -0.885703, 0, 0, 0, 1, 1,
-0.8202997, -0.8322546, -1.879525, 0, 0, 0, 1, 1,
-0.8151618, 0.1845386, -0.138788, 0, 0, 0, 1, 1,
-0.8110206, -0.8407412, -1.933313, 1, 1, 1, 1, 1,
-0.8097481, 0.9680808, -1.847876, 1, 1, 1, 1, 1,
-0.8093684, -1.095187, -1.84142, 1, 1, 1, 1, 1,
-0.8052234, 0.2013295, -2.376546, 1, 1, 1, 1, 1,
-0.8046015, 0.1148197, 1.695438, 1, 1, 1, 1, 1,
-0.8027231, 0.2910494, -0.2320746, 1, 1, 1, 1, 1,
-0.7995411, -1.334625, -0.1074348, 1, 1, 1, 1, 1,
-0.794567, -2.732077, -3.693927, 1, 1, 1, 1, 1,
-0.7858297, -0.05820667, -3.380412, 1, 1, 1, 1, 1,
-0.7837361, -0.3919635, -3.981635, 1, 1, 1, 1, 1,
-0.7731388, -0.03592663, -2.445241, 1, 1, 1, 1, 1,
-0.769398, -1.028806, -4.018473, 1, 1, 1, 1, 1,
-0.7636715, -0.339491, -2.969259, 1, 1, 1, 1, 1,
-0.7610789, -0.835585, -3.3799, 1, 1, 1, 1, 1,
-0.7530842, 0.8513885, -1.230054, 1, 1, 1, 1, 1,
-0.7464131, -0.5095215, -3.014322, 0, 0, 1, 1, 1,
-0.7449366, -1.72756, -3.519341, 1, 0, 0, 1, 1,
-0.7400087, -0.1190141, -0.9150369, 1, 0, 0, 1, 1,
-0.7397145, 0.6707957, 1.632498, 1, 0, 0, 1, 1,
-0.7306554, -0.09188426, -1.534199, 1, 0, 0, 1, 1,
-0.7297608, 0.08538239, -1.187686, 1, 0, 0, 1, 1,
-0.7277986, 0.1149069, -2.610375, 0, 0, 0, 1, 1,
-0.7266368, -0.9063141, -3.34495, 0, 0, 0, 1, 1,
-0.7195333, 1.818609, -0.7414849, 0, 0, 0, 1, 1,
-0.7147064, -1.420647, -2.665729, 0, 0, 0, 1, 1,
-0.7094632, -2.252703, -3.182996, 0, 0, 0, 1, 1,
-0.7040373, 0.5925286, -1.2325, 0, 0, 0, 1, 1,
-0.7011732, -1.174621, -1.841372, 0, 0, 0, 1, 1,
-0.6976961, -1.488748, -3.118806, 1, 1, 1, 1, 1,
-0.6876045, 0.0408283, -3.676787, 1, 1, 1, 1, 1,
-0.6860323, -1.596365, -3.023992, 1, 1, 1, 1, 1,
-0.6837204, -0.03709187, -1.730685, 1, 1, 1, 1, 1,
-0.679646, -0.2894905, -3.854335, 1, 1, 1, 1, 1,
-0.6735711, -0.22025, -2.540146, 1, 1, 1, 1, 1,
-0.669445, -2.297254, -2.866665, 1, 1, 1, 1, 1,
-0.6661441, 1.040845, -0.7133048, 1, 1, 1, 1, 1,
-0.6630774, -1.17441, -1.26957, 1, 1, 1, 1, 1,
-0.6541814, 0.127591, -1.514335, 1, 1, 1, 1, 1,
-0.6507684, -1.127084, -0.9468824, 1, 1, 1, 1, 1,
-0.6402169, 1.767885, -0.2605363, 1, 1, 1, 1, 1,
-0.6340351, -0.5021805, -1.681793, 1, 1, 1, 1, 1,
-0.6333353, -0.2028737, -2.113369, 1, 1, 1, 1, 1,
-0.6328978, -0.2827487, -2.150269, 1, 1, 1, 1, 1,
-0.6325075, -1.039844, -3.218471, 0, 0, 1, 1, 1,
-0.6301131, -0.09488959, -2.26316, 1, 0, 0, 1, 1,
-0.6300145, 0.5807653, -0.4599087, 1, 0, 0, 1, 1,
-0.6255156, -0.1067477, -0.967927, 1, 0, 0, 1, 1,
-0.6233828, -1.215233, -2.4676, 1, 0, 0, 1, 1,
-0.6204688, -0.03942577, 0.6014932, 1, 0, 0, 1, 1,
-0.6159971, -2.00176, -3.121015, 0, 0, 0, 1, 1,
-0.6036097, -0.8810932, -2.637816, 0, 0, 0, 1, 1,
-0.6026425, 0.1082992, -1.259061, 0, 0, 0, 1, 1,
-0.6010842, 1.504192, 0.4162425, 0, 0, 0, 1, 1,
-0.5984994, -1.730085, -1.29136, 0, 0, 0, 1, 1,
-0.5942141, 0.2061141, -1.778414, 0, 0, 0, 1, 1,
-0.5936039, -1.542632, -1.688734, 0, 0, 0, 1, 1,
-0.591586, 0.1375298, -2.202759, 1, 1, 1, 1, 1,
-0.5845379, -0.1355866, -1.066187, 1, 1, 1, 1, 1,
-0.5811646, -0.7891319, -1.767565, 1, 1, 1, 1, 1,
-0.5801852, -0.5746281, -3.754504, 1, 1, 1, 1, 1,
-0.5728952, 0.2669072, -1.346647, 1, 1, 1, 1, 1,
-0.5665916, -0.4911372, -2.787288, 1, 1, 1, 1, 1,
-0.5656642, -1.612013, -1.628771, 1, 1, 1, 1, 1,
-0.5647172, 0.9859539, -0.03074535, 1, 1, 1, 1, 1,
-0.5602078, 0.8410884, -1.11645, 1, 1, 1, 1, 1,
-0.5588721, 0.6527876, -0.4458572, 1, 1, 1, 1, 1,
-0.5575536, -2.260841, -5.43983, 1, 1, 1, 1, 1,
-0.5567778, 1.437825, -1.013085, 1, 1, 1, 1, 1,
-0.5505468, -0.4892938, -1.553628, 1, 1, 1, 1, 1,
-0.5505196, -1.613571, -2.100248, 1, 1, 1, 1, 1,
-0.5479511, 0.5693598, -0.5238079, 1, 1, 1, 1, 1,
-0.5440406, -1.421434, -3.317992, 0, 0, 1, 1, 1,
-0.5434127, 0.3047072, -0.4308021, 1, 0, 0, 1, 1,
-0.5424542, 1.602474, 0.5852679, 1, 0, 0, 1, 1,
-0.5391536, 0.9384728, -0.4990491, 1, 0, 0, 1, 1,
-0.5390292, 0.01750804, -1.834194, 1, 0, 0, 1, 1,
-0.5300433, 1.597259, -0.7647983, 1, 0, 0, 1, 1,
-0.5292575, 0.1485874, -0.2764305, 0, 0, 0, 1, 1,
-0.5264694, -0.1959065, -1.373634, 0, 0, 0, 1, 1,
-0.5235755, 1.665398, 0.6227257, 0, 0, 0, 1, 1,
-0.5199685, 0.08944266, -2.053335, 0, 0, 0, 1, 1,
-0.5174026, 1.21896, -0.9160903, 0, 0, 0, 1, 1,
-0.51632, 0.2920329, -0.01513134, 0, 0, 0, 1, 1,
-0.5057788, 0.04198619, -0.04545919, 0, 0, 0, 1, 1,
-0.4991735, 0.6539859, -1.368615, 1, 1, 1, 1, 1,
-0.4969879, 0.1393492, -2.557051, 1, 1, 1, 1, 1,
-0.4886441, 0.4391744, -2.16386, 1, 1, 1, 1, 1,
-0.48026, -0.3763647, -3.135757, 1, 1, 1, 1, 1,
-0.4778332, 0.2058845, -1.240541, 1, 1, 1, 1, 1,
-0.4777032, -0.8895161, -2.827019, 1, 1, 1, 1, 1,
-0.4707537, 0.8383609, -0.6807278, 1, 1, 1, 1, 1,
-0.4702072, 0.6514032, -1.677095, 1, 1, 1, 1, 1,
-0.4678314, 0.8712088, -0.001920929, 1, 1, 1, 1, 1,
-0.4673675, -0.5110103, -2.05428, 1, 1, 1, 1, 1,
-0.4671848, 0.4691162, -2.485286, 1, 1, 1, 1, 1,
-0.4618466, 0.7749907, -0.5803056, 1, 1, 1, 1, 1,
-0.4614137, -1.582838, -2.604112, 1, 1, 1, 1, 1,
-0.4586694, 0.3920893, -1.37175, 1, 1, 1, 1, 1,
-0.4557172, 1.312004, 0.6749623, 1, 1, 1, 1, 1,
-0.4501308, 0.2158022, 0.3340951, 0, 0, 1, 1, 1,
-0.4455591, -1.276302, -3.166378, 1, 0, 0, 1, 1,
-0.4406774, -0.02462988, -1.050618, 1, 0, 0, 1, 1,
-0.4405374, -1.109238, -3.315981, 1, 0, 0, 1, 1,
-0.4357353, 0.08788529, -1.608684, 1, 0, 0, 1, 1,
-0.4344082, -0.2466167, -3.128335, 1, 0, 0, 1, 1,
-0.434219, -0.4496734, -1.602297, 0, 0, 0, 1, 1,
-0.4335127, 0.1588232, -3.08774, 0, 0, 0, 1, 1,
-0.4326723, -0.6663933, -3.961725, 0, 0, 0, 1, 1,
-0.4306397, 1.204138, -0.5955549, 0, 0, 0, 1, 1,
-0.4295282, 0.4657363, -1.751642, 0, 0, 0, 1, 1,
-0.4276091, -0.7541956, -3.587229, 0, 0, 0, 1, 1,
-0.4273292, -0.08317053, -4.04151, 0, 0, 0, 1, 1,
-0.4261706, 0.9077309, 1.206635, 1, 1, 1, 1, 1,
-0.4252176, -1.501991, -2.794204, 1, 1, 1, 1, 1,
-0.4250605, -1.549427, -3.927457, 1, 1, 1, 1, 1,
-0.4242533, -1.029548, -4.205734, 1, 1, 1, 1, 1,
-0.4229549, 0.4726177, -0.7923675, 1, 1, 1, 1, 1,
-0.4199899, 0.2511843, -1.555427, 1, 1, 1, 1, 1,
-0.41569, 0.8559989, -1.228288, 1, 1, 1, 1, 1,
-0.4143234, 0.9855691, -0.1313284, 1, 1, 1, 1, 1,
-0.4041404, 1.201723, -0.2851202, 1, 1, 1, 1, 1,
-0.402256, 1.911835, -0.5922075, 1, 1, 1, 1, 1,
-0.4004247, -0.7321837, -3.95382, 1, 1, 1, 1, 1,
-0.399546, -0.7121252, -4.318761, 1, 1, 1, 1, 1,
-0.3974376, -0.3297734, -2.504812, 1, 1, 1, 1, 1,
-0.391899, -1.749187, -4.255425, 1, 1, 1, 1, 1,
-0.3912855, -0.2666642, -4.134975, 1, 1, 1, 1, 1,
-0.3908507, -0.7753112, -2.315509, 0, 0, 1, 1, 1,
-0.3901065, -0.1097744, -2.767855, 1, 0, 0, 1, 1,
-0.389531, -0.4294582, -0.4368017, 1, 0, 0, 1, 1,
-0.3881454, 0.01823557, -0.3641159, 1, 0, 0, 1, 1,
-0.3863523, -0.6322584, -2.100716, 1, 0, 0, 1, 1,
-0.3855863, -1.019247, -1.99547, 1, 0, 0, 1, 1,
-0.3806899, -0.2253509, -2.350017, 0, 0, 0, 1, 1,
-0.3806108, 0.09097318, -1.082832, 0, 0, 0, 1, 1,
-0.3705863, 0.2221142, -0.7839897, 0, 0, 0, 1, 1,
-0.3689541, -0.001632297, -0.7994355, 0, 0, 0, 1, 1,
-0.3660679, -0.9563096, -3.490734, 0, 0, 0, 1, 1,
-0.3630977, 0.8000715, 0.2898043, 0, 0, 0, 1, 1,
-0.3620791, 0.2500953, -3.368571, 0, 0, 0, 1, 1,
-0.3619792, 0.0914136, 1.982435, 1, 1, 1, 1, 1,
-0.3552274, 0.07741552, -1.255042, 1, 1, 1, 1, 1,
-0.3512012, 2.50411, 0.7458019, 1, 1, 1, 1, 1,
-0.3508928, -1.09745, -3.939257, 1, 1, 1, 1, 1,
-0.3502896, 1.093177, -0.4708002, 1, 1, 1, 1, 1,
-0.3468844, 1.174102, -1.773476, 1, 1, 1, 1, 1,
-0.3444327, 1.497416, -0.7898654, 1, 1, 1, 1, 1,
-0.3426818, 0.09458455, -1.137649, 1, 1, 1, 1, 1,
-0.3402492, 0.3478239, -0.3905954, 1, 1, 1, 1, 1,
-0.3377289, 0.1444565, -1.768611, 1, 1, 1, 1, 1,
-0.3376905, 0.3493073, -2.071945, 1, 1, 1, 1, 1,
-0.3359815, -0.8529704, -1.813361, 1, 1, 1, 1, 1,
-0.3348163, -1.353763, -1.405071, 1, 1, 1, 1, 1,
-0.3340084, 2.113038, -0.9903703, 1, 1, 1, 1, 1,
-0.3329884, -1.457098, -2.635361, 1, 1, 1, 1, 1,
-0.3305256, -0.1034106, -2.62012, 0, 0, 1, 1, 1,
-0.3285505, 1.096974, 0.9336872, 1, 0, 0, 1, 1,
-0.3231878, -0.6346573, -3.03371, 1, 0, 0, 1, 1,
-0.3212468, 1.093971, -0.4493265, 1, 0, 0, 1, 1,
-0.3199307, -1.044826, -4.202229, 1, 0, 0, 1, 1,
-0.3189571, -0.6978827, -1.927911, 1, 0, 0, 1, 1,
-0.3154588, -0.5533577, -2.930706, 0, 0, 0, 1, 1,
-0.3124042, 0.5584009, 0.6646667, 0, 0, 0, 1, 1,
-0.3106035, 0.249947, 0.2598983, 0, 0, 0, 1, 1,
-0.3078684, -0.00558735, -2.134643, 0, 0, 0, 1, 1,
-0.3072698, -0.9209745, -0.6284254, 0, 0, 0, 1, 1,
-0.3068088, -0.2658654, -1.183568, 0, 0, 0, 1, 1,
-0.2986661, -0.2538251, -3.150383, 0, 0, 0, 1, 1,
-0.2969928, -0.006996798, -1.519982, 1, 1, 1, 1, 1,
-0.2930518, -0.5028353, -1.440465, 1, 1, 1, 1, 1,
-0.2926836, 0.4410897, 0.3639624, 1, 1, 1, 1, 1,
-0.2870805, -1.900347, -4.7575, 1, 1, 1, 1, 1,
-0.2778042, 1.780184, -1.535084, 1, 1, 1, 1, 1,
-0.2772795, 1.195994, 1.192343, 1, 1, 1, 1, 1,
-0.2767363, -0.06189737, -1.520627, 1, 1, 1, 1, 1,
-0.2766391, 0.1958525, -1.481998, 1, 1, 1, 1, 1,
-0.2717536, -1.49859, -2.901114, 1, 1, 1, 1, 1,
-0.2620257, -1.813936, -4.122424, 1, 1, 1, 1, 1,
-0.259482, -0.6052564, -2.654643, 1, 1, 1, 1, 1,
-0.2592106, 0.3237965, -1.225435, 1, 1, 1, 1, 1,
-0.2549412, -1.643543, -2.269013, 1, 1, 1, 1, 1,
-0.252029, 0.545965, -1.155376, 1, 1, 1, 1, 1,
-0.2507705, -1.059468, -2.811615, 1, 1, 1, 1, 1,
-0.2495104, -1.774316, -4.249941, 0, 0, 1, 1, 1,
-0.2485865, -1.064446, -4.817648, 1, 0, 0, 1, 1,
-0.2485741, 0.4198956, -1.610407, 1, 0, 0, 1, 1,
-0.2457435, 0.4676492, -1.406972, 1, 0, 0, 1, 1,
-0.2436994, 1.696634, -0.8146513, 1, 0, 0, 1, 1,
-0.2361671, 0.08294719, -2.674141, 1, 0, 0, 1, 1,
-0.235812, 0.9415662, -1.798322, 0, 0, 0, 1, 1,
-0.2344903, -0.10179, 0.004220196, 0, 0, 0, 1, 1,
-0.2312372, 0.2562758, -2.10691, 0, 0, 0, 1, 1,
-0.2231228, -0.2396792, -1.788424, 0, 0, 0, 1, 1,
-0.2227365, -0.4112376, -3.769529, 0, 0, 0, 1, 1,
-0.2219718, -0.2167846, -2.641927, 0, 0, 0, 1, 1,
-0.2214966, -0.9384558, -3.586523, 0, 0, 0, 1, 1,
-0.2213098, -0.9956358, -1.405467, 1, 1, 1, 1, 1,
-0.2173239, 3.275891, -1.125968, 1, 1, 1, 1, 1,
-0.2076446, -0.4558908, -4.570044, 1, 1, 1, 1, 1,
-0.2075095, -1.783605, -3.933377, 1, 1, 1, 1, 1,
-0.202729, 1.808987, 0.498054, 1, 1, 1, 1, 1,
-0.198926, 1.340696, -0.1123576, 1, 1, 1, 1, 1,
-0.1976459, -0.6117489, -1.707606, 1, 1, 1, 1, 1,
-0.1950803, -0.2345898, -2.851918, 1, 1, 1, 1, 1,
-0.1947284, -0.03158421, -2.301171, 1, 1, 1, 1, 1,
-0.1923316, -1.824899, -4.168077, 1, 1, 1, 1, 1,
-0.1905672, 0.5000094, 2.318403, 1, 1, 1, 1, 1,
-0.1882381, -0.9467196, -1.590269, 1, 1, 1, 1, 1,
-0.1828102, 0.6795051, 1.953025, 1, 1, 1, 1, 1,
-0.1804549, -0.05612104, -2.418609, 1, 1, 1, 1, 1,
-0.1794951, -0.3007012, -2.920566, 1, 1, 1, 1, 1,
-0.1774791, -0.4446653, -0.7893825, 0, 0, 1, 1, 1,
-0.1764144, 0.2883961, -0.75344, 1, 0, 0, 1, 1,
-0.1750527, 0.2876, -1.12609, 1, 0, 0, 1, 1,
-0.1744904, 2.601443, 1.056066, 1, 0, 0, 1, 1,
-0.1737103, -1.67859, -3.665882, 1, 0, 0, 1, 1,
-0.1724903, -0.2366586, -2.990704, 1, 0, 0, 1, 1,
-0.1724428, -0.3898726, -1.323314, 0, 0, 0, 1, 1,
-0.169347, -0.3391845, -2.023062, 0, 0, 0, 1, 1,
-0.1689874, -1.312148, -4.34527, 0, 0, 0, 1, 1,
-0.1688171, 0.5029306, -0.4065251, 0, 0, 0, 1, 1,
-0.1631965, -0.5012102, -2.615121, 0, 0, 0, 1, 1,
-0.1630482, 1.54189, -0.7765867, 0, 0, 0, 1, 1,
-0.1581531, -0.9697474, -2.303826, 0, 0, 0, 1, 1,
-0.1549967, -0.2609731, -2.974955, 1, 1, 1, 1, 1,
-0.1528128, -1.341784, -2.305706, 1, 1, 1, 1, 1,
-0.1521417, 0.6235616, -1.126685, 1, 1, 1, 1, 1,
-0.150859, -0.5050012, -4.224513, 1, 1, 1, 1, 1,
-0.1491778, -0.8182728, -2.204962, 1, 1, 1, 1, 1,
-0.1431404, 1.382786, 0.31863, 1, 1, 1, 1, 1,
-0.1427171, -0.501644, -2.394088, 1, 1, 1, 1, 1,
-0.1423753, -0.1136162, -1.368641, 1, 1, 1, 1, 1,
-0.1394224, -1.463293, -3.010806, 1, 1, 1, 1, 1,
-0.1348242, 0.1333202, -2.753489, 1, 1, 1, 1, 1,
-0.1329472, -1.932778, -4.967167, 1, 1, 1, 1, 1,
-0.1309864, -1.150481, -3.417193, 1, 1, 1, 1, 1,
-0.1288618, 0.385513, -1.100757, 1, 1, 1, 1, 1,
-0.1283416, 0.8501428, -2.158403, 1, 1, 1, 1, 1,
-0.1228646, 0.5454534, -1.1664, 1, 1, 1, 1, 1,
-0.1219848, 0.4811454, -0.1941694, 0, 0, 1, 1, 1,
-0.117062, -0.1109017, -1.677307, 1, 0, 0, 1, 1,
-0.1139381, -1.246277, -4.561988, 1, 0, 0, 1, 1,
-0.1014311, 0.8797181, 0.6165959, 1, 0, 0, 1, 1,
-0.09822588, -1.045563, -3.561175, 1, 0, 0, 1, 1,
-0.09763393, -0.5995075, -2.777894, 1, 0, 0, 1, 1,
-0.09659313, 0.5898951, 1.057339, 0, 0, 0, 1, 1,
-0.09485084, 1.803894, 1.572057, 0, 0, 0, 1, 1,
-0.09468566, 1.751269, -0.01251921, 0, 0, 0, 1, 1,
-0.09321675, 0.2806242, -0.9554048, 0, 0, 0, 1, 1,
-0.09274442, -0.3172213, -2.834237, 0, 0, 0, 1, 1,
-0.08950128, 1.368052, -1.916961, 0, 0, 0, 1, 1,
-0.08728996, 0.2320222, -2.21911, 0, 0, 0, 1, 1,
-0.087165, -1.639313, -3.874257, 1, 1, 1, 1, 1,
-0.083449, -0.8224198, -3.101433, 1, 1, 1, 1, 1,
-0.08341935, 0.02902383, -3.102193, 1, 1, 1, 1, 1,
-0.08327997, 1.110648, -1.576176, 1, 1, 1, 1, 1,
-0.07933491, -0.9348214, -2.179429, 1, 1, 1, 1, 1,
-0.07817039, 2.082088, -0.3506044, 1, 1, 1, 1, 1,
-0.07564509, -0.8498102, -3.36032, 1, 1, 1, 1, 1,
-0.06849886, 1.041105, -1.848596, 1, 1, 1, 1, 1,
-0.06654426, 0.1346204, -0.9025869, 1, 1, 1, 1, 1,
-0.06583061, 0.3439208, -0.3851928, 1, 1, 1, 1, 1,
-0.06337771, 0.5254608, 0.2216233, 1, 1, 1, 1, 1,
-0.06321988, -0.449881, -1.897278, 1, 1, 1, 1, 1,
-0.05792976, 1.247087, -0.4267894, 1, 1, 1, 1, 1,
-0.05295328, -0.1853102, -3.651351, 1, 1, 1, 1, 1,
-0.04893643, -1.219442, -2.217347, 1, 1, 1, 1, 1,
-0.04146401, -2.424081, -2.591129, 0, 0, 1, 1, 1,
-0.04124784, -1.552836, -1.879664, 1, 0, 0, 1, 1,
-0.04064088, 0.76867, -0.7221972, 1, 0, 0, 1, 1,
-0.04027079, -1.313601, -2.382308, 1, 0, 0, 1, 1,
-0.03848717, 1.660311, 0.07991371, 1, 0, 0, 1, 1,
-0.03642148, -1.133287, -3.049975, 1, 0, 0, 1, 1,
-0.02729357, 1.005065, -0.8566216, 0, 0, 0, 1, 1,
-0.0253077, 0.047638, -1.089266, 0, 0, 0, 1, 1,
-0.02460039, 0.7060328, 1.190985, 0, 0, 0, 1, 1,
-0.0221225, 0.1822797, 0.9097199, 0, 0, 0, 1, 1,
-0.02151924, -0.7985461, -2.110215, 0, 0, 0, 1, 1,
-0.01724049, -0.02675752, -2.216879, 0, 0, 0, 1, 1,
-0.01401896, -1.738736, -4.047302, 0, 0, 0, 1, 1,
-0.01314733, 0.5443286, -0.07868922, 1, 1, 1, 1, 1,
-0.01146979, 0.005788651, -1.677729, 1, 1, 1, 1, 1,
-0.009510758, -1.340695, -2.665234, 1, 1, 1, 1, 1,
-0.006648658, -0.5433972, -5.317158, 1, 1, 1, 1, 1,
-0.001504161, 0.9295577, -1.517567, 1, 1, 1, 1, 1,
-0.0003309055, -0.2349773, -5.082064, 1, 1, 1, 1, 1,
0.002364972, -0.9507528, 3.938213, 1, 1, 1, 1, 1,
0.002583218, 0.6492661, -0.4845796, 1, 1, 1, 1, 1,
0.005845878, 0.182821, -1.272488, 1, 1, 1, 1, 1,
0.01169096, -0.2558261, 5.556132, 1, 1, 1, 1, 1,
0.01586044, -0.462443, 3.093595, 1, 1, 1, 1, 1,
0.01674082, 0.6342809, -0.635357, 1, 1, 1, 1, 1,
0.01862982, -0.7589927, 2.96492, 1, 1, 1, 1, 1,
0.01872474, 0.8411434, -2.146724, 1, 1, 1, 1, 1,
0.01900013, -1.52643, 2.815599, 1, 1, 1, 1, 1,
0.02139778, 0.2399809, 0.1679776, 0, 0, 1, 1, 1,
0.02639112, 1.590495, 1.108272, 1, 0, 0, 1, 1,
0.02664392, -1.130953, 3.58714, 1, 0, 0, 1, 1,
0.02755138, 0.9226826, 1.598311, 1, 0, 0, 1, 1,
0.02845177, -0.2171156, 3.541469, 1, 0, 0, 1, 1,
0.03000349, -0.7143811, 3.576971, 1, 0, 0, 1, 1,
0.03171734, 0.4166878, -0.09412368, 0, 0, 0, 1, 1,
0.03848926, 0.4888584, 0.136871, 0, 0, 0, 1, 1,
0.03911715, -0.5068993, 2.301697, 0, 0, 0, 1, 1,
0.03998167, -0.8105133, 4.54683, 0, 0, 0, 1, 1,
0.04014903, 1.307671, 1.349419, 0, 0, 0, 1, 1,
0.0408034, 1.110976, -0.2967874, 0, 0, 0, 1, 1,
0.04145911, 0.1428228, 0.7721744, 0, 0, 0, 1, 1,
0.04388084, 0.8672928, -0.01199044, 1, 1, 1, 1, 1,
0.04433336, -0.1047573, 0.9172124, 1, 1, 1, 1, 1,
0.04457582, 0.1396512, 0.3196361, 1, 1, 1, 1, 1,
0.04466695, -1.28163, 3.37786, 1, 1, 1, 1, 1,
0.05036256, 0.7696377, -0.1635033, 1, 1, 1, 1, 1,
0.05260307, 0.8019465, -1.951693, 1, 1, 1, 1, 1,
0.05485457, 0.4991914, -0.3475085, 1, 1, 1, 1, 1,
0.05678682, 1.495063, 0.941346, 1, 1, 1, 1, 1,
0.0600488, -1.111448, 2.539968, 1, 1, 1, 1, 1,
0.06502381, 0.6294085, -0.2871106, 1, 1, 1, 1, 1,
0.06636878, 1.527137, -1.036669, 1, 1, 1, 1, 1,
0.06841941, 0.6492257, -1.667116, 1, 1, 1, 1, 1,
0.07180909, 0.6128283, 0.9811004, 1, 1, 1, 1, 1,
0.07541247, -0.8995912, 2.401204, 1, 1, 1, 1, 1,
0.07542747, 1.372597, 0.2481962, 1, 1, 1, 1, 1,
0.08154882, 0.5365782, 0.1970056, 0, 0, 1, 1, 1,
0.08867535, 1.825129, 1.068415, 1, 0, 0, 1, 1,
0.08891883, -1.048331, 0.8577525, 1, 0, 0, 1, 1,
0.09107561, 1.53379, 0.04143615, 1, 0, 0, 1, 1,
0.09282751, 0.28427, 0.1724022, 1, 0, 0, 1, 1,
0.09375068, -0.3782465, 1.933625, 1, 0, 0, 1, 1,
0.09448032, 1.190076, -0.2554245, 0, 0, 0, 1, 1,
0.09640654, -0.267492, 2.562033, 0, 0, 0, 1, 1,
0.09737846, 0.5048912, 0.294786, 0, 0, 0, 1, 1,
0.09806601, -1.320313, 2.997068, 0, 0, 0, 1, 1,
0.09838349, -2.217405, 3.609825, 0, 0, 0, 1, 1,
0.09928488, 0.001324958, 1.486025, 0, 0, 0, 1, 1,
0.1061012, -2.226509, 4.12659, 0, 0, 0, 1, 1,
0.1081677, 1.403296, -0.9098825, 1, 1, 1, 1, 1,
0.1090143, -1.344929, 2.472626, 1, 1, 1, 1, 1,
0.1106756, 1.003741, -1.194353, 1, 1, 1, 1, 1,
0.1164516, 0.7241209, -0.5950277, 1, 1, 1, 1, 1,
0.1185311, -2.337312, 2.78612, 1, 1, 1, 1, 1,
0.1193821, 1.290982, -0.3136734, 1, 1, 1, 1, 1,
0.1229916, 0.2518918, -1.202807, 1, 1, 1, 1, 1,
0.1268876, 2.159447, 0.07343226, 1, 1, 1, 1, 1,
0.1272911, 0.8705931, -0.6950706, 1, 1, 1, 1, 1,
0.1274967, -0.6427708, 4.251573, 1, 1, 1, 1, 1,
0.1283442, 0.3605277, 1.688649, 1, 1, 1, 1, 1,
0.1306982, -1.138619, 2.474732, 1, 1, 1, 1, 1,
0.1411152, -0.5350934, 5.820707, 1, 1, 1, 1, 1,
0.144655, 0.1279874, 0.5563983, 1, 1, 1, 1, 1,
0.1486705, 0.1260638, 1.348096, 1, 1, 1, 1, 1,
0.1490503, -0.4521744, 4.483721, 0, 0, 1, 1, 1,
0.1491569, -1.113479, 2.052589, 1, 0, 0, 1, 1,
0.1499447, 0.6270586, 1.345033, 1, 0, 0, 1, 1,
0.1505668, 0.729871, 2.161775, 1, 0, 0, 1, 1,
0.1576129, 0.9814017, -0.6856044, 1, 0, 0, 1, 1,
0.1593624, -0.607038, 5.611757, 1, 0, 0, 1, 1,
0.159583, 1.215905, -0.1835225, 0, 0, 0, 1, 1,
0.1636461, 1.159236, 0.2479253, 0, 0, 0, 1, 1,
0.1643411, 0.7187842, 0.3907501, 0, 0, 0, 1, 1,
0.1691645, -1.128381, 2.524325, 0, 0, 0, 1, 1,
0.1701099, -1.26003, 3.053302, 0, 0, 0, 1, 1,
0.170758, -0.2295756, 3.684847, 0, 0, 0, 1, 1,
0.1714846, 0.3725387, -0.1404033, 0, 0, 0, 1, 1,
0.1853263, -0.2687198, 2.370777, 1, 1, 1, 1, 1,
0.1939962, -1.88632, 7.525027, 1, 1, 1, 1, 1,
0.1949212, -0.9702499, 3.685274, 1, 1, 1, 1, 1,
0.1963378, 0.4967313, -0.2819096, 1, 1, 1, 1, 1,
0.1970796, -0.23237, 2.756478, 1, 1, 1, 1, 1,
0.1984891, -0.2403732, 2.960999, 1, 1, 1, 1, 1,
0.199412, -0.2546342, 0.7037323, 1, 1, 1, 1, 1,
0.2001875, -1.027035, 3.144344, 1, 1, 1, 1, 1,
0.2022842, 0.783861, -0.3274929, 1, 1, 1, 1, 1,
0.2039977, -0.5832149, 4.434032, 1, 1, 1, 1, 1,
0.2101222, -2.323763, 2.435462, 1, 1, 1, 1, 1,
0.21255, 0.5245994, -0.9379017, 1, 1, 1, 1, 1,
0.2130838, 1.797927, -0.6639303, 1, 1, 1, 1, 1,
0.2130925, 1.279016, -0.7265944, 1, 1, 1, 1, 1,
0.2140012, -0.4366623, 2.839652, 1, 1, 1, 1, 1,
0.2144383, 0.260882, -0.939617, 0, 0, 1, 1, 1,
0.2161789, -0.6815431, 5.155231, 1, 0, 0, 1, 1,
0.2191375, -0.05640643, 1.76274, 1, 0, 0, 1, 1,
0.2225297, 0.3827474, 0.1369292, 1, 0, 0, 1, 1,
0.2244304, 1.384228, -0.3154205, 1, 0, 0, 1, 1,
0.2249482, 0.6371495, 0.1238333, 1, 0, 0, 1, 1,
0.2288036, -0.0591523, 1.847952, 0, 0, 0, 1, 1,
0.2325299, 0.3167289, 1.900217, 0, 0, 0, 1, 1,
0.2332476, -1.135509, 3.095974, 0, 0, 0, 1, 1,
0.2350567, 0.4262847, 1.240789, 0, 0, 0, 1, 1,
0.2400195, 1.106411, 1.976962, 0, 0, 0, 1, 1,
0.2419825, 0.09429362, 1.783856, 0, 0, 0, 1, 1,
0.2432369, 2.092959, 0.2493557, 0, 0, 0, 1, 1,
0.245832, -0.1913569, 1.980664, 1, 1, 1, 1, 1,
0.2543449, -0.9115364, 2.202828, 1, 1, 1, 1, 1,
0.2554101, -1.977847, 3.838371, 1, 1, 1, 1, 1,
0.2608389, 0.2732854, 1.242637, 1, 1, 1, 1, 1,
0.2654518, 0.6351905, -0.4510618, 1, 1, 1, 1, 1,
0.2689668, -0.8785673, 2.189533, 1, 1, 1, 1, 1,
0.2718278, 0.5887542, -0.8999529, 1, 1, 1, 1, 1,
0.2732799, 1.147979, 1.342998, 1, 1, 1, 1, 1,
0.2755373, 0.2745911, 2.45524, 1, 1, 1, 1, 1,
0.2820391, 0.515173, -0.05439555, 1, 1, 1, 1, 1,
0.2845364, -0.7155667, 2.763539, 1, 1, 1, 1, 1,
0.2853077, 0.2836047, 0.6182513, 1, 1, 1, 1, 1,
0.2860754, 1.589683, -0.8488188, 1, 1, 1, 1, 1,
0.2862586, -2.340246, 2.686824, 1, 1, 1, 1, 1,
0.2900784, 0.7143848, 1.464331, 1, 1, 1, 1, 1,
0.2919596, 0.3269832, 2.441815, 0, 0, 1, 1, 1,
0.2935089, -0.7760762, 2.59689, 1, 0, 0, 1, 1,
0.3003782, 0.1972952, 1.407977, 1, 0, 0, 1, 1,
0.3093926, -0.01660433, 1.175625, 1, 0, 0, 1, 1,
0.3106005, 0.09199239, 2.60389, 1, 0, 0, 1, 1,
0.3120495, -0.923566, 2.966698, 1, 0, 0, 1, 1,
0.3129785, -0.329073, 0.3069946, 0, 0, 0, 1, 1,
0.3132996, 0.5529175, 1.71706, 0, 0, 0, 1, 1,
0.3133238, -1.740173, 3.820383, 0, 0, 0, 1, 1,
0.3142549, 0.2471695, 0.5210047, 0, 0, 0, 1, 1,
0.317772, -0.3317573, 3.391571, 0, 0, 0, 1, 1,
0.3189121, 1.93973, 0.06917162, 0, 0, 0, 1, 1,
0.320361, -0.04412961, 1.578174, 0, 0, 0, 1, 1,
0.3228227, 0.5227306, 0.08872914, 1, 1, 1, 1, 1,
0.3254718, -0.2673982, 2.662111, 1, 1, 1, 1, 1,
0.3370969, 0.209925, -0.1813957, 1, 1, 1, 1, 1,
0.3419218, -0.650328, 1.672747, 1, 1, 1, 1, 1,
0.3498115, 0.9491621, -0.2481505, 1, 1, 1, 1, 1,
0.3498753, -0.4917457, 2.396792, 1, 1, 1, 1, 1,
0.354214, 0.9900315, 2.328787, 1, 1, 1, 1, 1,
0.3543639, 0.6789613, 1.25114, 1, 1, 1, 1, 1,
0.3586405, 1.854605, 1.620454, 1, 1, 1, 1, 1,
0.3612281, 0.007149382, 1.573942, 1, 1, 1, 1, 1,
0.371608, -1.314597, 3.238668, 1, 1, 1, 1, 1,
0.3743058, 2.140689, 0.8738688, 1, 1, 1, 1, 1,
0.3765939, -0.04364352, -0.05861236, 1, 1, 1, 1, 1,
0.3780516, 1.235382, 0.790969, 1, 1, 1, 1, 1,
0.3783187, 0.5645254, 1.424402, 1, 1, 1, 1, 1,
0.3798452, -0.6514958, 2.077778, 0, 0, 1, 1, 1,
0.3805344, -0.6610617, 2.999199, 1, 0, 0, 1, 1,
0.3816841, -1.460952, 1.61988, 1, 0, 0, 1, 1,
0.3924986, 1.371224, 0.3519328, 1, 0, 0, 1, 1,
0.3939251, 0.8390747, -0.8409762, 1, 0, 0, 1, 1,
0.39542, 0.5468088, 0.3455191, 1, 0, 0, 1, 1,
0.4000448, -0.2214662, 2.483294, 0, 0, 0, 1, 1,
0.4002715, -0.1257624, 2.431334, 0, 0, 0, 1, 1,
0.4005733, -0.08012927, 2.602238, 0, 0, 0, 1, 1,
0.4040841, 0.8342421, -0.7577208, 0, 0, 0, 1, 1,
0.4044146, 0.0001006977, 1.04356, 0, 0, 0, 1, 1,
0.4058577, 1.184355, 0.1267203, 0, 0, 0, 1, 1,
0.4066131, 0.7683047, -0.1194526, 0, 0, 0, 1, 1,
0.4112491, -0.6078531, 3.378605, 1, 1, 1, 1, 1,
0.4132628, -1.124754, 2.560366, 1, 1, 1, 1, 1,
0.4151798, 1.47895, 0.8155898, 1, 1, 1, 1, 1,
0.4172132, 1.272585, -0.5900019, 1, 1, 1, 1, 1,
0.4258657, 0.8894325, 1.294417, 1, 1, 1, 1, 1,
0.4339462, 0.269885, -0.2435667, 1, 1, 1, 1, 1,
0.4353833, 1.723416, -0.002317124, 1, 1, 1, 1, 1,
0.4359296, 0.2432364, 1.483312, 1, 1, 1, 1, 1,
0.4361293, -0.007323082, 0.7073272, 1, 1, 1, 1, 1,
0.4363384, -0.6353008, 2.034311, 1, 1, 1, 1, 1,
0.438029, -0.5190342, 1.626213, 1, 1, 1, 1, 1,
0.4442055, -1.228462, 2.193292, 1, 1, 1, 1, 1,
0.4465593, -0.1673603, 2.25897, 1, 1, 1, 1, 1,
0.4509145, 0.8109512, 0.4469526, 1, 1, 1, 1, 1,
0.4561769, -0.2294337, 0.9447596, 1, 1, 1, 1, 1,
0.4578766, 0.3460521, 1.208911, 0, 0, 1, 1, 1,
0.4586234, -0.3779511, 1.737283, 1, 0, 0, 1, 1,
0.4627357, 0.3902434, 0.5291734, 1, 0, 0, 1, 1,
0.4628509, -0.2695324, 2.711001, 1, 0, 0, 1, 1,
0.4638523, -0.6151444, 2.468069, 1, 0, 0, 1, 1,
0.4671336, -0.4457974, 2.71487, 1, 0, 0, 1, 1,
0.4704557, 0.2272485, -0.1975063, 0, 0, 0, 1, 1,
0.476806, -0.2956186, 1.453844, 0, 0, 0, 1, 1,
0.4800579, 0.4787953, -1.352114, 0, 0, 0, 1, 1,
0.4810146, -0.7508497, 3.397505, 0, 0, 0, 1, 1,
0.4844116, 1.740869, -0.5655809, 0, 0, 0, 1, 1,
0.4885921, 1.51456, 1.240772, 0, 0, 0, 1, 1,
0.4895982, -0.9090394, 2.003204, 0, 0, 0, 1, 1,
0.5090908, 0.3639051, 2.713473, 1, 1, 1, 1, 1,
0.5124255, 0.7587764, 1.14809, 1, 1, 1, 1, 1,
0.5148039, -0.9354244, 1.783201, 1, 1, 1, 1, 1,
0.5157589, -1.846008, 3.183422, 1, 1, 1, 1, 1,
0.5170937, 0.5333108, -0.3217489, 1, 1, 1, 1, 1,
0.5210081, 1.141366, -0.8926535, 1, 1, 1, 1, 1,
0.5229182, -1.141469, 2.287234, 1, 1, 1, 1, 1,
0.5233199, 1.547973, -0.9334834, 1, 1, 1, 1, 1,
0.5249898, 1.093574, -1.266905, 1, 1, 1, 1, 1,
0.5327571, -0.1609069, 2.221112, 1, 1, 1, 1, 1,
0.5475531, 0.05776634, 1.260436, 1, 1, 1, 1, 1,
0.5509568, -0.8353303, 1.389278, 1, 1, 1, 1, 1,
0.5538012, -0.4425438, 1.822668, 1, 1, 1, 1, 1,
0.5550674, 0.1077452, 2.648581, 1, 1, 1, 1, 1,
0.5576038, 0.6132267, 0.2813811, 1, 1, 1, 1, 1,
0.5609224, 1.311003, -2.530256, 0, 0, 1, 1, 1,
0.5616699, -0.1074786, 3.372361, 1, 0, 0, 1, 1,
0.5670866, -1.819947, 1.753039, 1, 0, 0, 1, 1,
0.5680487, -0.03178083, 1.324175, 1, 0, 0, 1, 1,
0.5688025, 0.3063674, 0.5761524, 1, 0, 0, 1, 1,
0.5727417, 0.1369318, 1.86805, 1, 0, 0, 1, 1,
0.5759172, 1.27515, 1.011236, 0, 0, 0, 1, 1,
0.5803572, -0.239672, 1.728661, 0, 0, 0, 1, 1,
0.5804235, 0.8107048, 0.3266457, 0, 0, 0, 1, 1,
0.58218, 0.08223373, 2.687959, 0, 0, 0, 1, 1,
0.5825703, 0.01188169, 0.2447265, 0, 0, 0, 1, 1,
0.5830485, 0.0876747, 0.9746764, 0, 0, 0, 1, 1,
0.5921172, 0.7276412, 0.7809797, 0, 0, 0, 1, 1,
0.594693, 0.7055795, 1.75065, 1, 1, 1, 1, 1,
0.6001874, -0.03198927, 0.05968161, 1, 1, 1, 1, 1,
0.609264, -0.2629313, 0.8259515, 1, 1, 1, 1, 1,
0.6100534, -1.084387, 3.370243, 1, 1, 1, 1, 1,
0.6159436, -0.08953257, 1.869145, 1, 1, 1, 1, 1,
0.6220461, -0.08689412, -0.1261955, 1, 1, 1, 1, 1,
0.6323332, 0.2655734, 1.448178, 1, 1, 1, 1, 1,
0.6360044, 1.696851, 0.0787702, 1, 1, 1, 1, 1,
0.6387917, 0.263966, 1.109177, 1, 1, 1, 1, 1,
0.644778, 0.8582432, 1.232121, 1, 1, 1, 1, 1,
0.6463885, -0.2202352, 0.9818094, 1, 1, 1, 1, 1,
0.6469806, 0.821901, 1.895259, 1, 1, 1, 1, 1,
0.6505345, 0.6204006, 2.071579, 1, 1, 1, 1, 1,
0.654829, 0.4066648, 1.846266, 1, 1, 1, 1, 1,
0.6560911, -0.7831051, 3.436279, 1, 1, 1, 1, 1,
0.6586374, -1.172567, 3.339255, 0, 0, 1, 1, 1,
0.6605688, 0.0998227, 1.843883, 1, 0, 0, 1, 1,
0.6666337, -1.334449, 4.296355, 1, 0, 0, 1, 1,
0.6687675, -0.3425609, 2.427814, 1, 0, 0, 1, 1,
0.676301, 0.298688, 0.6968483, 1, 0, 0, 1, 1,
0.6784138, -0.5628528, 3.156836, 1, 0, 0, 1, 1,
0.6812726, 0.9156088, 0.6847242, 0, 0, 0, 1, 1,
0.6823147, -0.2451727, 1.275428, 0, 0, 0, 1, 1,
0.6835986, -0.8768233, 1.968111, 0, 0, 0, 1, 1,
0.6903263, -0.5454175, 0.6631725, 0, 0, 0, 1, 1,
0.6914923, -0.8639616, 3.415395, 0, 0, 0, 1, 1,
0.6931756, 1.446993, 0.1859781, 0, 0, 0, 1, 1,
0.696907, -1.614758, 3.583208, 0, 0, 0, 1, 1,
0.6995234, -1.648607, 2.652192, 1, 1, 1, 1, 1,
0.7008131, -1.985123, 2.607643, 1, 1, 1, 1, 1,
0.7027518, -0.1905926, 2.856186, 1, 1, 1, 1, 1,
0.7036365, -0.9152535, 2.737542, 1, 1, 1, 1, 1,
0.7041963, 0.1219367, 1.350442, 1, 1, 1, 1, 1,
0.7154423, 0.03800601, -0.1591761, 1, 1, 1, 1, 1,
0.7160835, 1.783324, 0.999035, 1, 1, 1, 1, 1,
0.7282101, -0.9479514, 3.480635, 1, 1, 1, 1, 1,
0.7295247, 0.8971696, 1.017333, 1, 1, 1, 1, 1,
0.7329571, 0.7228104, 1.744962, 1, 1, 1, 1, 1,
0.7349966, -0.3715735, 1.522715, 1, 1, 1, 1, 1,
0.7414233, -0.2225239, 0.7098131, 1, 1, 1, 1, 1,
0.7477431, 0.1400178, 2.1464, 1, 1, 1, 1, 1,
0.7516657, 1.40603, -0.1233574, 1, 1, 1, 1, 1,
0.7690632, -0.7235932, 3.01896, 1, 1, 1, 1, 1,
0.7705513, -1.216201, 3.438118, 0, 0, 1, 1, 1,
0.7786218, 0.6767838, 0.5296542, 1, 0, 0, 1, 1,
0.781956, 2.247335, -0.2266733, 1, 0, 0, 1, 1,
0.7873398, 0.4109277, 1.182472, 1, 0, 0, 1, 1,
0.7879614, 1.03984, 0.8552521, 1, 0, 0, 1, 1,
0.7890445, -0.3383165, 3.1047, 1, 0, 0, 1, 1,
0.7891656, -0.1228961, 2.875285, 0, 0, 0, 1, 1,
0.7925453, 0.1142408, 1.619984, 0, 0, 0, 1, 1,
0.7957848, -1.190377, 3.116496, 0, 0, 0, 1, 1,
0.8010741, -0.1900799, 2.369397, 0, 0, 0, 1, 1,
0.8035841, -1.509549, 3.342412, 0, 0, 0, 1, 1,
0.8079123, 0.01093207, 0.1742177, 0, 0, 0, 1, 1,
0.8121557, 0.4388574, 1.833279, 0, 0, 0, 1, 1,
0.812929, 0.3762222, -0.01809502, 1, 1, 1, 1, 1,
0.8150015, -0.1666317, 2.927264, 1, 1, 1, 1, 1,
0.8214067, -1.289204, 2.508595, 1, 1, 1, 1, 1,
0.8232483, 2.548273, -0.9247276, 1, 1, 1, 1, 1,
0.8234199, -0.1386619, 1.106279, 1, 1, 1, 1, 1,
0.8235988, -0.5887583, 1.419547, 1, 1, 1, 1, 1,
0.8257902, -1.208621, 3.920943, 1, 1, 1, 1, 1,
0.8315231, 0.2735971, -0.07070852, 1, 1, 1, 1, 1,
0.8325976, -0.955524, 2.659441, 1, 1, 1, 1, 1,
0.8347254, 0.6062135, 3.688131, 1, 1, 1, 1, 1,
0.8470392, -0.9311253, 2.173008, 1, 1, 1, 1, 1,
0.8481835, -0.4190639, 1.518062, 1, 1, 1, 1, 1,
0.8566858, -1.415087, 2.444882, 1, 1, 1, 1, 1,
0.8569523, 0.6532663, 1.699479, 1, 1, 1, 1, 1,
0.8595043, -0.9301913, 1.836948, 1, 1, 1, 1, 1,
0.8619776, -1.954404, 1.964577, 0, 0, 1, 1, 1,
0.8643953, -0.5395662, 1.673991, 1, 0, 0, 1, 1,
0.8687051, -0.2587827, 1.207908, 1, 0, 0, 1, 1,
0.8717633, -0.4319768, 1.80379, 1, 0, 0, 1, 1,
0.8738397, 1.895317, -0.660306, 1, 0, 0, 1, 1,
0.8766267, 0.06701131, 2.34591, 1, 0, 0, 1, 1,
0.88052, 0.2092796, 1.10083, 0, 0, 0, 1, 1,
0.8845817, -0.362023, 1.03712, 0, 0, 0, 1, 1,
0.8871946, 0.1208636, 2.779484, 0, 0, 0, 1, 1,
0.8904285, 1.38701, 0.4242065, 0, 0, 0, 1, 1,
0.8956489, 0.05900646, 2.290235, 0, 0, 0, 1, 1,
0.9026122, -1.13622, 2.13964, 0, 0, 0, 1, 1,
0.9052441, -0.1405475, 2.571077, 0, 0, 0, 1, 1,
0.9069749, 0.4967794, -0.1817969, 1, 1, 1, 1, 1,
0.9072307, -0.5607944, 2.529302, 1, 1, 1, 1, 1,
0.911903, -0.8922467, 1.561616, 1, 1, 1, 1, 1,
0.9136129, -0.8098742, 2.724114, 1, 1, 1, 1, 1,
0.9159126, 0.5290383, 1.954053, 1, 1, 1, 1, 1,
0.9236933, 0.5645533, 1.000811, 1, 1, 1, 1, 1,
0.9237838, -0.7334797, 3.849825, 1, 1, 1, 1, 1,
0.9280905, -1.041462, 1.58066, 1, 1, 1, 1, 1,
0.9328444, -0.11524, 0.8356335, 1, 1, 1, 1, 1,
0.9398889, -0.379219, 1.730629, 1, 1, 1, 1, 1,
0.9419109, 0.3267515, -0.02387106, 1, 1, 1, 1, 1,
0.9440022, 0.1277067, 3.821574, 1, 1, 1, 1, 1,
0.9443548, 0.122055, 0.8429335, 1, 1, 1, 1, 1,
0.9475229, 0.7542799, -1.237282, 1, 1, 1, 1, 1,
0.9508565, 0.1746357, 1.473158, 1, 1, 1, 1, 1,
0.9510991, 0.7121077, 1.834337, 0, 0, 1, 1, 1,
0.95257, 1.424211, 1.928976, 1, 0, 0, 1, 1,
0.9537861, -0.8537933, 1.48483, 1, 0, 0, 1, 1,
0.9557946, 1.094607, -0.3012744, 1, 0, 0, 1, 1,
0.9562942, 0.2798541, 1.41219, 1, 0, 0, 1, 1,
0.9578816, -0.988498, 2.989765, 1, 0, 0, 1, 1,
0.9627157, 1.722265, -0.8070678, 0, 0, 0, 1, 1,
0.970206, 0.2503145, 0.1205085, 0, 0, 0, 1, 1,
0.9807059, -0.9258003, 3.317961, 0, 0, 0, 1, 1,
0.985424, 0.4070501, 2.782859, 0, 0, 0, 1, 1,
0.9879545, -1.430699, 2.900713, 0, 0, 0, 1, 1,
0.9909751, 1.553741, 0.9713117, 0, 0, 0, 1, 1,
0.9920132, 0.9497084, 1.461071, 0, 0, 0, 1, 1,
0.9920397, 1.000021, 2.06446, 1, 1, 1, 1, 1,
1.005311, 0.9186245, 1.583142, 1, 1, 1, 1, 1,
1.006377, 0.5338385, 0.9872391, 1, 1, 1, 1, 1,
1.006535, -0.004017127, 0.6267747, 1, 1, 1, 1, 1,
1.011519, 0.007947148, -0.4826602, 1, 1, 1, 1, 1,
1.011994, 2.357348, -0.4099299, 1, 1, 1, 1, 1,
1.0125, 0.4311597, 2.807799, 1, 1, 1, 1, 1,
1.018262, -0.1666024, 1.294914, 1, 1, 1, 1, 1,
1.02555, -0.6607484, 0.6426218, 1, 1, 1, 1, 1,
1.029134, -0.9697919, 4.099815, 1, 1, 1, 1, 1,
1.029895, 1.91977, 1.241323, 1, 1, 1, 1, 1,
1.031297, 1.803764, -0.0261392, 1, 1, 1, 1, 1,
1.031825, -0.6317002, 2.065771, 1, 1, 1, 1, 1,
1.032627, 0.5073968, 0.3786136, 1, 1, 1, 1, 1,
1.036699, -0.4527171, 3.084539, 1, 1, 1, 1, 1,
1.039221, -1.280149, 1.635377, 0, 0, 1, 1, 1,
1.039678, -0.4430654, 0.6602465, 1, 0, 0, 1, 1,
1.040763, 0.2073823, 1.490663, 1, 0, 0, 1, 1,
1.041851, 0.3689126, 0.991357, 1, 0, 0, 1, 1,
1.042827, 0.9563568, 3.059298, 1, 0, 0, 1, 1,
1.043379, 1.373707, -0.7350615, 1, 0, 0, 1, 1,
1.044778, -0.04254926, 1.410211, 0, 0, 0, 1, 1,
1.049795, -1.345334, 2.599046, 0, 0, 0, 1, 1,
1.051213, -0.5700712, 1.603524, 0, 0, 0, 1, 1,
1.057197, -0.6566604, 3.509273, 0, 0, 0, 1, 1,
1.070137, 0.233476, 2.016291, 0, 0, 0, 1, 1,
1.07443, 0.3809407, 2.057991, 0, 0, 0, 1, 1,
1.076614, 0.4707098, 0.5348664, 0, 0, 0, 1, 1,
1.093233, -0.6481538, 3.689634, 1, 1, 1, 1, 1,
1.10604, 0.7717717, 2.225865, 1, 1, 1, 1, 1,
1.10655, 0.6493276, -0.818234, 1, 1, 1, 1, 1,
1.115624, -1.160922, 4.496152, 1, 1, 1, 1, 1,
1.117137, 0.2953081, 1.81983, 1, 1, 1, 1, 1,
1.117932, 0.06442458, 2.513363, 1, 1, 1, 1, 1,
1.120062, -0.6923494, 2.883457, 1, 1, 1, 1, 1,
1.121851, 0.03095816, 1.555434, 1, 1, 1, 1, 1,
1.129152, -1.112399, 2.029978, 1, 1, 1, 1, 1,
1.132912, -1.124366, 0.5573077, 1, 1, 1, 1, 1,
1.137907, -0.17136, 0.8437389, 1, 1, 1, 1, 1,
1.138618, 0.4417664, 1.016668, 1, 1, 1, 1, 1,
1.139828, 0.3230389, 2.357643, 1, 1, 1, 1, 1,
1.141369, 3.467188, 1.588945, 1, 1, 1, 1, 1,
1.142745, 0.7616755, 1.535244, 1, 1, 1, 1, 1,
1.146915, -1.296841, 2.026341, 0, 0, 1, 1, 1,
1.150081, -0.7991111, 2.868629, 1, 0, 0, 1, 1,
1.167897, -1.110745, 4.983974, 1, 0, 0, 1, 1,
1.174816, -1.188637, 1.402243, 1, 0, 0, 1, 1,
1.178137, 0.8485119, 0.9262375, 1, 0, 0, 1, 1,
1.184227, -0.7349786, 4.66818, 1, 0, 0, 1, 1,
1.185364, 0.5926192, 1.354299, 0, 0, 0, 1, 1,
1.192471, 1.080569, 0.4390224, 0, 0, 0, 1, 1,
1.202155, -0.4331302, 2.277811, 0, 0, 0, 1, 1,
1.206022, -0.1081086, 2.295003, 0, 0, 0, 1, 1,
1.209353, -1.387593, 3.581133, 0, 0, 0, 1, 1,
1.219696, -0.08614477, 0.4381417, 0, 0, 0, 1, 1,
1.233309, 1.254845, 3.24068, 0, 0, 0, 1, 1,
1.236546, -0.1445944, 1.283321, 1, 1, 1, 1, 1,
1.239136, 1.609299, 1.459981, 1, 1, 1, 1, 1,
1.242981, -0.09626409, 1.133812, 1, 1, 1, 1, 1,
1.250942, -1.285743, 0.9597448, 1, 1, 1, 1, 1,
1.25363, -0.9544548, 3.704986, 1, 1, 1, 1, 1,
1.254465, -0.3679997, 2.270101, 1, 1, 1, 1, 1,
1.257831, -0.3270855, 2.828977, 1, 1, 1, 1, 1,
1.26007, 0.2124833, 2.122828, 1, 1, 1, 1, 1,
1.270096, 1.087203, 0.8326775, 1, 1, 1, 1, 1,
1.287974, 1.174271, 1.373531, 1, 1, 1, 1, 1,
1.289282, -1.087507, 4.259304, 1, 1, 1, 1, 1,
1.294001, -0.3350397, 1.188319, 1, 1, 1, 1, 1,
1.296577, -0.9676577, 2.378235, 1, 1, 1, 1, 1,
1.300935, -0.2790388, 2.057313, 1, 1, 1, 1, 1,
1.306333, -0.5170381, 0.8098817, 1, 1, 1, 1, 1,
1.309439, -0.6631548, 1.447479, 0, 0, 1, 1, 1,
1.31143, 0.2727607, 0.9158884, 1, 0, 0, 1, 1,
1.325778, -1.842303, 1.423305, 1, 0, 0, 1, 1,
1.326982, 0.0945603, 0.3940481, 1, 0, 0, 1, 1,
1.328074, -0.5825801, 1.217267, 1, 0, 0, 1, 1,
1.337746, 0.06820025, 2.960878, 1, 0, 0, 1, 1,
1.339475, -0.7147527, 3.154811, 0, 0, 0, 1, 1,
1.342018, 1.358809, 2.746943, 0, 0, 0, 1, 1,
1.34964, 0.8409118, 3.065158, 0, 0, 0, 1, 1,
1.357132, -0.5987293, 1.894304, 0, 0, 0, 1, 1,
1.367251, 0.03867685, 2.684222, 0, 0, 0, 1, 1,
1.369329, -1.131371, 1.209388, 0, 0, 0, 1, 1,
1.369951, 1.710866, 0.298128, 0, 0, 0, 1, 1,
1.371529, -1.757357, 1.812674, 1, 1, 1, 1, 1,
1.376777, -0.5922542, 1.325125, 1, 1, 1, 1, 1,
1.386629, -0.3685507, 0.5591908, 1, 1, 1, 1, 1,
1.38803, 1.561714, 0.4495253, 1, 1, 1, 1, 1,
1.388068, 0.8606545, 0.3028434, 1, 1, 1, 1, 1,
1.391079, 1.612066, 1.508788, 1, 1, 1, 1, 1,
1.400764, 1.084472, 0.2646567, 1, 1, 1, 1, 1,
1.402334, 0.4461738, 0.7274253, 1, 1, 1, 1, 1,
1.40781, 0.209137, 1.790014, 1, 1, 1, 1, 1,
1.421065, 1.429702, 0.8108668, 1, 1, 1, 1, 1,
1.433804, -1.668083, 1.487546, 1, 1, 1, 1, 1,
1.439588, -0.238683, 3.089263, 1, 1, 1, 1, 1,
1.440342, -0.4570717, 0.2357771, 1, 1, 1, 1, 1,
1.440417, 0.311918, 0.6828463, 1, 1, 1, 1, 1,
1.441188, 1.018374, 1.611397, 1, 1, 1, 1, 1,
1.463229, -0.3543466, 1.143819, 0, 0, 1, 1, 1,
1.463993, 0.2786596, 0.335597, 1, 0, 0, 1, 1,
1.477987, -0.3014137, 2.103033, 1, 0, 0, 1, 1,
1.498916, -0.5647073, 1.443071, 1, 0, 0, 1, 1,
1.509856, -0.3527147, 1.221861, 1, 0, 0, 1, 1,
1.522366, 1.563656, 0.1573539, 1, 0, 0, 1, 1,
1.561904, -0.4485078, 2.159157, 0, 0, 0, 1, 1,
1.572807, 0.808521, -0.455612, 0, 0, 0, 1, 1,
1.585991, 1.151528, 1.587409, 0, 0, 0, 1, 1,
1.590983, -0.9822079, 2.208001, 0, 0, 0, 1, 1,
1.599875, -1.023051, 1.345605, 0, 0, 0, 1, 1,
1.606113, -0.3942432, 1.481191, 0, 0, 0, 1, 1,
1.608112, -0.3121233, 2.285754, 0, 0, 0, 1, 1,
1.628283, -2.288779, 2.977885, 1, 1, 1, 1, 1,
1.629648, 1.589744, 2.22729, 1, 1, 1, 1, 1,
1.652522, -1.379713, 2.559103, 1, 1, 1, 1, 1,
1.652852, 0.1833515, 0.9814683, 1, 1, 1, 1, 1,
1.662586, -0.2370111, 2.331134, 1, 1, 1, 1, 1,
1.664921, -0.1419003, 2.499564, 1, 1, 1, 1, 1,
1.668419, -0.6002939, 2.694119, 1, 1, 1, 1, 1,
1.670778, 1.216831, 0.901558, 1, 1, 1, 1, 1,
1.696013, 0.5750973, 1.416634, 1, 1, 1, 1, 1,
1.700265, -0.694123, 2.471864, 1, 1, 1, 1, 1,
1.718912, 1.007183, 0.1542506, 1, 1, 1, 1, 1,
1.734849, -1.248774, 2.986946, 1, 1, 1, 1, 1,
1.73621, -2.188728, 2.29488, 1, 1, 1, 1, 1,
1.742337, -0.4336973, 3.005471, 1, 1, 1, 1, 1,
1.742563, 1.960337, 2.220778, 1, 1, 1, 1, 1,
1.74679, -0.5137782, 1.199453, 0, 0, 1, 1, 1,
1.764236, -0.3644007, 2.377269, 1, 0, 0, 1, 1,
1.780442, 0.6889765, 1.023797, 1, 0, 0, 1, 1,
1.79036, 0.7615864, 0.7253492, 1, 0, 0, 1, 1,
1.798777, -0.1095183, 0.7171949, 1, 0, 0, 1, 1,
1.802825, 0.1859255, 2.622289, 1, 0, 0, 1, 1,
1.80486, -0.2927403, 1.00559, 0, 0, 0, 1, 1,
1.806148, 0.02823673, 1.792462, 0, 0, 0, 1, 1,
1.824822, 0.5548116, 3.141237, 0, 0, 0, 1, 1,
1.83532, 1.12621, 2.253136, 0, 0, 0, 1, 1,
1.839691, 1.428277, 1.073768, 0, 0, 0, 1, 1,
1.85749, 1.699729, 1.950612, 0, 0, 0, 1, 1,
1.878445, -0.7318424, 1.783331, 0, 0, 0, 1, 1,
1.882367, 2.140237, 1.1585, 1, 1, 1, 1, 1,
1.882573, 0.5748147, 2.146351, 1, 1, 1, 1, 1,
1.885545, 0.1288542, 3.204521, 1, 1, 1, 1, 1,
1.893429, -0.7534191, 2.51715, 1, 1, 1, 1, 1,
1.903854, 1.079822, 1.923921, 1, 1, 1, 1, 1,
1.904684, -0.3074462, 1.044011, 1, 1, 1, 1, 1,
1.912993, -0.8835015, 3.403028, 1, 1, 1, 1, 1,
1.925379, 1.054667, 2.220449, 1, 1, 1, 1, 1,
1.938117, -0.01488858, 0.1339968, 1, 1, 1, 1, 1,
1.946958, -0.4395123, 1.752489, 1, 1, 1, 1, 1,
1.975186, 0.8529614, 0.9191739, 1, 1, 1, 1, 1,
1.993431, 0.8021348, -0.3561879, 1, 1, 1, 1, 1,
1.997945, -0.1532733, 2.17388, 1, 1, 1, 1, 1,
2.008576, -0.1864401, 1.142631, 1, 1, 1, 1, 1,
2.017453, -0.4256327, 0.9545538, 1, 1, 1, 1, 1,
2.048021, 0.4464235, 1.376927, 0, 0, 1, 1, 1,
2.081729, -1.373545, 0.5803735, 1, 0, 0, 1, 1,
2.102572, 0.7510631, 2.437672, 1, 0, 0, 1, 1,
2.130198, 0.8129054, 1.805509, 1, 0, 0, 1, 1,
2.160792, -0.304334, 1.759451, 1, 0, 0, 1, 1,
2.174394, -0.5514359, 0.4095183, 1, 0, 0, 1, 1,
2.191789, -0.4471841, 1.639949, 0, 0, 0, 1, 1,
2.197559, 1.304644, 1.017453, 0, 0, 0, 1, 1,
2.199407, -0.6872373, 3.305681, 0, 0, 0, 1, 1,
2.206333, -0.9578417, 0.7212341, 0, 0, 0, 1, 1,
2.233027, -0.9540636, 3.033354, 0, 0, 0, 1, 1,
2.342794, 0.3179562, 2.389812, 0, 0, 0, 1, 1,
2.35196, -1.037102, 0.6166973, 0, 0, 0, 1, 1,
2.367712, 0.2075301, 1.046275, 1, 1, 1, 1, 1,
2.504332, -0.5237432, 1.226305, 1, 1, 1, 1, 1,
2.531791, -0.1745613, 1.424929, 1, 1, 1, 1, 1,
2.544748, 0.4709381, 2.249043, 1, 1, 1, 1, 1,
2.618271, -0.006532128, 1.347116, 1, 1, 1, 1, 1,
2.670419, -0.08077415, 3.289845, 1, 1, 1, 1, 1,
3.148881, -0.4319066, 1.924562, 1, 1, 1, 1, 1
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
var radius = 10.52004;
var distance = 36.9512;
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
mvMatrix.translate( 0.1720147, -0.3675553, -1.042598 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.9512);
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
