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
-3.749279, 0.2177763, -2.047606, 1, 0, 0, 1,
-2.847171, -0.4828995, 0.5388078, 1, 0.007843138, 0, 1,
-2.732697, 0.6062422, 0.5677338, 1, 0.01176471, 0, 1,
-2.725819, 0.04683492, -1.187545, 1, 0.01960784, 0, 1,
-2.669314, 1.038966, -1.844591, 1, 0.02352941, 0, 1,
-2.617509, 1.200801, -1.346725, 1, 0.03137255, 0, 1,
-2.525147, 1.423692, -1.604287, 1, 0.03529412, 0, 1,
-2.439582, 0.6849156, -1.285679, 1, 0.04313726, 0, 1,
-2.386875, 0.07522328, -0.9470843, 1, 0.04705882, 0, 1,
-2.3826, -2.212438, -1.720062, 1, 0.05490196, 0, 1,
-2.349076, 0.8959091, -2.665881, 1, 0.05882353, 0, 1,
-2.312165, -0.02676544, -2.675721, 1, 0.06666667, 0, 1,
-2.284428, 1.469572, -2.709957, 1, 0.07058824, 0, 1,
-2.274796, 0.07689223, -3.220613, 1, 0.07843138, 0, 1,
-2.238513, 0.5133181, -2.913273, 1, 0.08235294, 0, 1,
-2.224887, -1.297303, -0.6956507, 1, 0.09019608, 0, 1,
-2.210453, -0.8782877, -3.142177, 1, 0.09411765, 0, 1,
-2.153061, -0.2973321, -2.89604, 1, 0.1019608, 0, 1,
-2.106525, -1.586633, -2.825968, 1, 0.1098039, 0, 1,
-2.094151, -2.046904, -3.113367, 1, 0.1137255, 0, 1,
-2.073928, 1.904943, -0.9988997, 1, 0.1215686, 0, 1,
-2.05643, 0.6797504, 0.04993787, 1, 0.1254902, 0, 1,
-1.983543, -1.109692, -1.419841, 1, 0.1333333, 0, 1,
-1.965394, 0.8868917, -1.390315, 1, 0.1372549, 0, 1,
-1.924999, 1.150039, -1.985809, 1, 0.145098, 0, 1,
-1.920535, 0.02875235, -0.9618955, 1, 0.1490196, 0, 1,
-1.908116, 0.5716045, -2.364569, 1, 0.1568628, 0, 1,
-1.902603, 0.298532, -1.287172, 1, 0.1607843, 0, 1,
-1.89589, -2.711747, -0.8723002, 1, 0.1686275, 0, 1,
-1.894258, -2.293181, -3.640967, 1, 0.172549, 0, 1,
-1.881306, -0.2007103, -1.957102, 1, 0.1803922, 0, 1,
-1.868507, 0.7275447, -2.282464, 1, 0.1843137, 0, 1,
-1.864936, 0.4257573, 1.223776, 1, 0.1921569, 0, 1,
-1.858269, 0.9777139, -0.655989, 1, 0.1960784, 0, 1,
-1.847372, -0.1732, -2.661803, 1, 0.2039216, 0, 1,
-1.84245, 0.705007, -2.299633, 1, 0.2117647, 0, 1,
-1.840359, 1.922092, -1.921433, 1, 0.2156863, 0, 1,
-1.830189, 1.198067, -2.385535, 1, 0.2235294, 0, 1,
-1.826943, -1.453381, -1.930071, 1, 0.227451, 0, 1,
-1.821207, 0.2903055, -2.927378, 1, 0.2352941, 0, 1,
-1.810195, -0.1725227, -0.7014012, 1, 0.2392157, 0, 1,
-1.803943, 0.2330496, -1.782919, 1, 0.2470588, 0, 1,
-1.787549, 0.8263378, -0.9644143, 1, 0.2509804, 0, 1,
-1.767606, 2.840291, -1.499634, 1, 0.2588235, 0, 1,
-1.738393, 1.009927, -1.401489, 1, 0.2627451, 0, 1,
-1.707062, -0.0887632, -1.214231, 1, 0.2705882, 0, 1,
-1.697015, 0.004325446, -3.169266, 1, 0.2745098, 0, 1,
-1.689456, -0.4674959, -2.614516, 1, 0.282353, 0, 1,
-1.68614, 0.1896981, -2.684792, 1, 0.2862745, 0, 1,
-1.677652, 0.1501628, -2.569636, 1, 0.2941177, 0, 1,
-1.676246, -0.9843255, -1.845697, 1, 0.3019608, 0, 1,
-1.665597, -0.7294163, -2.005647, 1, 0.3058824, 0, 1,
-1.656069, -0.1246138, -1.156889, 1, 0.3137255, 0, 1,
-1.649202, -0.4100155, -1.873001, 1, 0.3176471, 0, 1,
-1.647426, 0.2480424, -1.95991, 1, 0.3254902, 0, 1,
-1.644549, -0.2808271, -0.9698537, 1, 0.3294118, 0, 1,
-1.629871, 0.9560657, -1.025939, 1, 0.3372549, 0, 1,
-1.628339, 0.5458074, -0.6670924, 1, 0.3411765, 0, 1,
-1.608543, 0.3437048, -1.927994, 1, 0.3490196, 0, 1,
-1.588675, 0.05840468, -1.212245, 1, 0.3529412, 0, 1,
-1.582323, -2.840317, -0.9349847, 1, 0.3607843, 0, 1,
-1.570982, 0.9846918, -0.4002945, 1, 0.3647059, 0, 1,
-1.558562, 0.8853803, -1.418748, 1, 0.372549, 0, 1,
-1.558221, -0.093281, -1.724626, 1, 0.3764706, 0, 1,
-1.546811, 1.088448, -0.5909566, 1, 0.3843137, 0, 1,
-1.543289, 0.08805191, -1.896925, 1, 0.3882353, 0, 1,
-1.535513, 1.578683, -1.794435, 1, 0.3960784, 0, 1,
-1.534287, -0.6598294, -4.859117, 1, 0.4039216, 0, 1,
-1.522781, -1.611879, -1.417242, 1, 0.4078431, 0, 1,
-1.513981, 0.4776455, -1.111245, 1, 0.4156863, 0, 1,
-1.507317, 0.6767487, -0.02739167, 1, 0.4196078, 0, 1,
-1.503815, -1.458118, -2.993677, 1, 0.427451, 0, 1,
-1.48322, 0.116638, -0.6819398, 1, 0.4313726, 0, 1,
-1.482202, -0.821786, -3.42635, 1, 0.4392157, 0, 1,
-1.47864, -2.002031, -4.067033, 1, 0.4431373, 0, 1,
-1.478494, 1.437577, 0.5926048, 1, 0.4509804, 0, 1,
-1.4753, -1.328901, -2.885056, 1, 0.454902, 0, 1,
-1.474448, 1.205672, 0.1727539, 1, 0.4627451, 0, 1,
-1.472249, 0.2490231, -0.5274487, 1, 0.4666667, 0, 1,
-1.469876, 1.740252, -0.9366421, 1, 0.4745098, 0, 1,
-1.457363, 0.163084, -0.5154574, 1, 0.4784314, 0, 1,
-1.451728, 0.5864906, -1.293609, 1, 0.4862745, 0, 1,
-1.445166, -0.8761763, -3.578475, 1, 0.4901961, 0, 1,
-1.443772, -0.1492169, -1.331157, 1, 0.4980392, 0, 1,
-1.425253, 1.029764, -1.053183, 1, 0.5058824, 0, 1,
-1.424783, -2.503992, -4.076089, 1, 0.509804, 0, 1,
-1.413334, 0.5178233, -0.6446263, 1, 0.5176471, 0, 1,
-1.405889, -2.043953, -3.168792, 1, 0.5215687, 0, 1,
-1.405169, -0.3435511, -2.534793, 1, 0.5294118, 0, 1,
-1.400389, -0.1067147, -2.012127, 1, 0.5333334, 0, 1,
-1.376344, 0.8079652, -2.077086, 1, 0.5411765, 0, 1,
-1.371571, -0.3364358, -1.762941, 1, 0.5450981, 0, 1,
-1.359509, -0.3885864, -1.884784, 1, 0.5529412, 0, 1,
-1.356403, 0.09064975, -0.3220835, 1, 0.5568628, 0, 1,
-1.349403, 0.07481369, -0.8996983, 1, 0.5647059, 0, 1,
-1.344402, -0.1777239, -1.595435, 1, 0.5686275, 0, 1,
-1.344007, -0.1139647, -0.3779721, 1, 0.5764706, 0, 1,
-1.338153, 2.033955, 0.7787609, 1, 0.5803922, 0, 1,
-1.335618, 0.8430787, -1.950015, 1, 0.5882353, 0, 1,
-1.321607, -0.5651771, -3.247625, 1, 0.5921569, 0, 1,
-1.305715, -0.09990578, -0.9662236, 1, 0.6, 0, 1,
-1.303477, -0.02519471, -1.133457, 1, 0.6078432, 0, 1,
-1.303091, -1.177229, -1.887015, 1, 0.6117647, 0, 1,
-1.292224, -0.3491052, -0.3338273, 1, 0.6196079, 0, 1,
-1.290042, 0.8577226, -0.7299845, 1, 0.6235294, 0, 1,
-1.285246, 1.397049, 0.6806923, 1, 0.6313726, 0, 1,
-1.281122, -0.8920282, -1.747573, 1, 0.6352941, 0, 1,
-1.272379, 1.178202, -0.09856357, 1, 0.6431373, 0, 1,
-1.270094, 1.028601, -0.3719513, 1, 0.6470588, 0, 1,
-1.26763, -0.825872, -2.467959, 1, 0.654902, 0, 1,
-1.263813, -0.006691872, -1.957692, 1, 0.6588235, 0, 1,
-1.256231, 0.5298076, -0.9628462, 1, 0.6666667, 0, 1,
-1.252766, -0.4873807, 1.596381, 1, 0.6705883, 0, 1,
-1.244691, -1.241289, -2.394098, 1, 0.6784314, 0, 1,
-1.243592, 0.4118087, -0.9519875, 1, 0.682353, 0, 1,
-1.242971, -2.519719, -1.719056, 1, 0.6901961, 0, 1,
-1.240637, 1.884007, -0.5311494, 1, 0.6941177, 0, 1,
-1.214702, -1.620201, -1.314434, 1, 0.7019608, 0, 1,
-1.212796, 0.9947883, -1.288508, 1, 0.7098039, 0, 1,
-1.211392, 1.583268, -0.8928019, 1, 0.7137255, 0, 1,
-1.207181, -0.5481555, -3.579886, 1, 0.7215686, 0, 1,
-1.206997, 0.634726, -2.351189, 1, 0.7254902, 0, 1,
-1.206523, 0.8981209, -0.4884568, 1, 0.7333333, 0, 1,
-1.203606, 0.4299764, -0.7510336, 1, 0.7372549, 0, 1,
-1.19464, 0.1753908, -1.422447, 1, 0.7450981, 0, 1,
-1.192637, -0.505881, -1.539496, 1, 0.7490196, 0, 1,
-1.19008, -2.615532, -4.519918, 1, 0.7568628, 0, 1,
-1.189241, -1.776575, -3.051212, 1, 0.7607843, 0, 1,
-1.179374, 0.4332943, -3.117824, 1, 0.7686275, 0, 1,
-1.174182, 0.561448, -0.9019088, 1, 0.772549, 0, 1,
-1.170452, -0.2329236, -0.9085624, 1, 0.7803922, 0, 1,
-1.169449, 1.527091, -1.384925, 1, 0.7843137, 0, 1,
-1.163488, -1.502727, -2.498233, 1, 0.7921569, 0, 1,
-1.159605, 1.538613, -0.6285351, 1, 0.7960784, 0, 1,
-1.157642, -0.8262171, -3.3467, 1, 0.8039216, 0, 1,
-1.156407, 0.5720198, -2.519786, 1, 0.8117647, 0, 1,
-1.152866, 1.002506, -1.457904, 1, 0.8156863, 0, 1,
-1.141651, 0.5976679, -2.107468, 1, 0.8235294, 0, 1,
-1.140681, 0.2469693, -1.328956, 1, 0.827451, 0, 1,
-1.134516, -1.392847, -3.117197, 1, 0.8352941, 0, 1,
-1.129062, -0.04839262, 0.6827461, 1, 0.8392157, 0, 1,
-1.122476, -0.2455948, -2.884637, 1, 0.8470588, 0, 1,
-1.122158, 1.836327, -1.725624, 1, 0.8509804, 0, 1,
-1.119323, -1.482642, -2.509051, 1, 0.8588235, 0, 1,
-1.11606, -0.1117697, -1.34978, 1, 0.8627451, 0, 1,
-1.113729, -0.7072977, -4.012106, 1, 0.8705882, 0, 1,
-1.111424, -0.4743836, -0.9476762, 1, 0.8745098, 0, 1,
-1.109641, 0.3053259, -0.1649011, 1, 0.8823529, 0, 1,
-1.108527, -0.3027827, -0.9977565, 1, 0.8862745, 0, 1,
-1.107584, 0.4560625, -1.431989, 1, 0.8941177, 0, 1,
-1.107138, 0.9381098, -1.338734, 1, 0.8980392, 0, 1,
-1.103828, -0.301637, -0.6387008, 1, 0.9058824, 0, 1,
-1.083578, -0.2946606, -1.8747, 1, 0.9137255, 0, 1,
-1.076933, 0.2867765, 0.1150236, 1, 0.9176471, 0, 1,
-1.072364, -1.466635, -1.762319, 1, 0.9254902, 0, 1,
-1.070258, 1.358688, -1.518167, 1, 0.9294118, 0, 1,
-1.066609, 1.162782, 1.027729, 1, 0.9372549, 0, 1,
-1.060987, -1.487108, -2.677568, 1, 0.9411765, 0, 1,
-1.058314, -2.018745, -2.045728, 1, 0.9490196, 0, 1,
-1.05362, 0.2046669, -1.715745, 1, 0.9529412, 0, 1,
-1.043963, 0.215892, -1.727048, 1, 0.9607843, 0, 1,
-1.041322, 0.2184299, -2.018253, 1, 0.9647059, 0, 1,
-1.041175, -1.526225, -3.49279, 1, 0.972549, 0, 1,
-1.041033, -0.2869892, -2.126238, 1, 0.9764706, 0, 1,
-1.039658, 1.503978, -0.0575063, 1, 0.9843137, 0, 1,
-1.035049, 1.360764, -0.1866474, 1, 0.9882353, 0, 1,
-1.032664, -1.382658, -0.4773363, 1, 0.9960784, 0, 1,
-1.02594, -2.244693, -1.397632, 0.9960784, 1, 0, 1,
-1.018082, -0.5887989, -2.621831, 0.9921569, 1, 0, 1,
-1.014746, 0.288474, -1.735485, 0.9843137, 1, 0, 1,
-1.014278, -0.08974349, 1.378137, 0.9803922, 1, 0, 1,
-1.013914, 1.361044, -1.184087, 0.972549, 1, 0, 1,
-1.007443, 1.482842, -2.907948, 0.9686275, 1, 0, 1,
-1.007213, -0.7725423, -1.148792, 0.9607843, 1, 0, 1,
-1.006673, 2.196244, -1.190462, 0.9568627, 1, 0, 1,
-1.004728, -0.222655, -0.7604923, 0.9490196, 1, 0, 1,
-1.000856, 1.02482, -1.568398, 0.945098, 1, 0, 1,
-0.9998232, -0.6339158, -1.195366, 0.9372549, 1, 0, 1,
-0.9989557, 0.00142346, -1.060915, 0.9333333, 1, 0, 1,
-0.9927543, -0.8888678, -1.119479, 0.9254902, 1, 0, 1,
-0.9925836, 1.168116, -0.3779325, 0.9215686, 1, 0, 1,
-0.9907179, -0.7602813, -2.674937, 0.9137255, 1, 0, 1,
-0.9836962, -0.07721457, -0.8420625, 0.9098039, 1, 0, 1,
-0.9748592, -0.4678085, -2.116528, 0.9019608, 1, 0, 1,
-0.9720888, 1.510199, -0.8643039, 0.8941177, 1, 0, 1,
-0.970017, 0.234403, 0.2203936, 0.8901961, 1, 0, 1,
-0.9649827, -0.1754209, -0.5316866, 0.8823529, 1, 0, 1,
-0.9624871, 0.8166422, 0.4957089, 0.8784314, 1, 0, 1,
-0.9537781, 2.172624, 0.2428658, 0.8705882, 1, 0, 1,
-0.9469747, -0.9211989, -0.974535, 0.8666667, 1, 0, 1,
-0.9410347, 1.180247, -0.0628386, 0.8588235, 1, 0, 1,
-0.9348768, 1.105826, -1.420565, 0.854902, 1, 0, 1,
-0.9297307, -0.2892095, -1.887103, 0.8470588, 1, 0, 1,
-0.9274652, 0.2578492, -2.337164, 0.8431373, 1, 0, 1,
-0.9241246, -0.2019357, -1.853649, 0.8352941, 1, 0, 1,
-0.9220313, -1.865628, -3.3404, 0.8313726, 1, 0, 1,
-0.9182033, -1.538326, -1.878653, 0.8235294, 1, 0, 1,
-0.9140447, -1.242349, -3.043004, 0.8196079, 1, 0, 1,
-0.911523, -1.300892, -3.342197, 0.8117647, 1, 0, 1,
-0.9072021, -0.2860636, -2.970442, 0.8078431, 1, 0, 1,
-0.9044171, 0.1603148, -1.87814, 0.8, 1, 0, 1,
-0.9033843, 0.7049503, 2.067748, 0.7921569, 1, 0, 1,
-0.8945428, -1.712107, -2.556879, 0.7882353, 1, 0, 1,
-0.8920715, -1.213144, -1.229812, 0.7803922, 1, 0, 1,
-0.8919338, 1.060584, 1.404385, 0.7764706, 1, 0, 1,
-0.8836234, -0.8545579, -2.028341, 0.7686275, 1, 0, 1,
-0.8825165, 0.07875357, -2.256418, 0.7647059, 1, 0, 1,
-0.8809091, -0.3512439, -0.2981796, 0.7568628, 1, 0, 1,
-0.879716, 0.7662455, 0.4172254, 0.7529412, 1, 0, 1,
-0.8796653, 0.133281, -0.4686675, 0.7450981, 1, 0, 1,
-0.8796587, 0.4934544, -1.304776, 0.7411765, 1, 0, 1,
-0.876695, 2.955644, 1.051718, 0.7333333, 1, 0, 1,
-0.8756352, 0.3363206, -1.564105, 0.7294118, 1, 0, 1,
-0.874145, 0.4156182, -2.19699, 0.7215686, 1, 0, 1,
-0.872329, -1.476989, -1.772796, 0.7176471, 1, 0, 1,
-0.8712975, 0.1256728, -2.489868, 0.7098039, 1, 0, 1,
-0.8613391, 2.587182, -1.938805, 0.7058824, 1, 0, 1,
-0.860867, 1.236018, -1.802454, 0.6980392, 1, 0, 1,
-0.8593036, -0.1008564, -3.243501, 0.6901961, 1, 0, 1,
-0.8579472, -0.5219376, -3.468613, 0.6862745, 1, 0, 1,
-0.8573526, -0.01065663, -2.653331, 0.6784314, 1, 0, 1,
-0.8559739, -0.009081842, -3.208095, 0.6745098, 1, 0, 1,
-0.8550051, -0.5746927, -3.373348, 0.6666667, 1, 0, 1,
-0.854459, -0.07764162, -2.915196, 0.6627451, 1, 0, 1,
-0.8489543, -0.8882493, -2.60901, 0.654902, 1, 0, 1,
-0.8479704, 0.245088, -2.324874, 0.6509804, 1, 0, 1,
-0.841648, 0.9776103, -0.08371027, 0.6431373, 1, 0, 1,
-0.8388222, -0.9614899, -1.214357, 0.6392157, 1, 0, 1,
-0.8382967, 0.4779103, -0.6561889, 0.6313726, 1, 0, 1,
-0.8374124, -0.4467143, -0.7461461, 0.627451, 1, 0, 1,
-0.8366573, 0.04289534, -1.884632, 0.6196079, 1, 0, 1,
-0.8361337, -1.524792, -3.408181, 0.6156863, 1, 0, 1,
-0.8358131, 0.6588646, -0.3333163, 0.6078432, 1, 0, 1,
-0.8316281, -0.7707812, -2.257484, 0.6039216, 1, 0, 1,
-0.8302315, 0.3458302, -0.6643898, 0.5960785, 1, 0, 1,
-0.8298404, -0.05009635, -1.472669, 0.5882353, 1, 0, 1,
-0.818641, -0.4203179, -3.517295, 0.5843138, 1, 0, 1,
-0.8180601, -0.1788778, -1.863792, 0.5764706, 1, 0, 1,
-0.8164042, 1.104376, -0.2233212, 0.572549, 1, 0, 1,
-0.8110723, -0.3344767, -3.319112, 0.5647059, 1, 0, 1,
-0.8083983, -1.129707, -1.848485, 0.5607843, 1, 0, 1,
-0.8068152, 0.4942272, -1.073665, 0.5529412, 1, 0, 1,
-0.8044974, 0.9210218, -0.6469674, 0.5490196, 1, 0, 1,
-0.7990682, 1.940953, 0.3493252, 0.5411765, 1, 0, 1,
-0.7859567, 0.1507887, -0.3602606, 0.5372549, 1, 0, 1,
-0.7791443, -0.4681947, -1.367391, 0.5294118, 1, 0, 1,
-0.776112, 0.171455, -0.1345702, 0.5254902, 1, 0, 1,
-0.7753213, -0.2723887, -3.019677, 0.5176471, 1, 0, 1,
-0.7727576, -0.384874, -2.934248, 0.5137255, 1, 0, 1,
-0.7695806, 0.2231182, 0.5510641, 0.5058824, 1, 0, 1,
-0.7634461, 0.3073614, -1.010322, 0.5019608, 1, 0, 1,
-0.7619222, -0.3443769, -2.096398, 0.4941176, 1, 0, 1,
-0.7503075, 1.932793, 1.207904, 0.4862745, 1, 0, 1,
-0.750139, -0.2519454, -2.441, 0.4823529, 1, 0, 1,
-0.7471212, -1.318819, -3.138014, 0.4745098, 1, 0, 1,
-0.7397894, 0.1871727, -1.305444, 0.4705882, 1, 0, 1,
-0.7360974, 0.8969009, 0.1933095, 0.4627451, 1, 0, 1,
-0.7329004, -0.3506796, -0.7520567, 0.4588235, 1, 0, 1,
-0.7239131, -0.4108413, -1.480133, 0.4509804, 1, 0, 1,
-0.7196788, 1.62394, 1.039577, 0.4470588, 1, 0, 1,
-0.7193067, -0.7775007, -4.196346, 0.4392157, 1, 0, 1,
-0.7190114, -0.2041442, -2.415247, 0.4352941, 1, 0, 1,
-0.7180678, -0.2620612, 0.07463668, 0.427451, 1, 0, 1,
-0.7155002, 0.8344479, -2.215719, 0.4235294, 1, 0, 1,
-0.7108001, -0.1435443, -1.824722, 0.4156863, 1, 0, 1,
-0.7101291, 0.7509201, -0.39602, 0.4117647, 1, 0, 1,
-0.7077677, -1.719052, -2.90082, 0.4039216, 1, 0, 1,
-0.707702, -0.5345765, -0.7815853, 0.3960784, 1, 0, 1,
-0.7006176, 0.3318939, -2.495709, 0.3921569, 1, 0, 1,
-0.6978668, -0.08029185, -2.879502, 0.3843137, 1, 0, 1,
-0.6929495, -1.166024, -2.330308, 0.3803922, 1, 0, 1,
-0.6927145, -0.2790448, -2.004717, 0.372549, 1, 0, 1,
-0.6921324, 1.192214, -2.265992, 0.3686275, 1, 0, 1,
-0.691398, -0.5415995, -2.08165, 0.3607843, 1, 0, 1,
-0.6835928, 0.2383198, -2.178907, 0.3568628, 1, 0, 1,
-0.682952, 0.3893603, -0.2552541, 0.3490196, 1, 0, 1,
-0.6825312, 1.237396, 0.5637497, 0.345098, 1, 0, 1,
-0.6822399, -0.8720918, -2.52976, 0.3372549, 1, 0, 1,
-0.6743233, 0.9507648, 1.271168, 0.3333333, 1, 0, 1,
-0.6742086, 2.088777, -0.3557994, 0.3254902, 1, 0, 1,
-0.6702807, 0.3607759, -0.1501443, 0.3215686, 1, 0, 1,
-0.6635802, -0.3343992, -1.349341, 0.3137255, 1, 0, 1,
-0.6596404, -0.6405582, -3.182406, 0.3098039, 1, 0, 1,
-0.658805, 0.6388332, -0.1755009, 0.3019608, 1, 0, 1,
-0.6534613, 2.680829, -0.6006033, 0.2941177, 1, 0, 1,
-0.6519008, -0.7974012, -2.964331, 0.2901961, 1, 0, 1,
-0.6500789, 0.3616923, -1.60118, 0.282353, 1, 0, 1,
-0.6488917, -0.4064642, -2.004025, 0.2784314, 1, 0, 1,
-0.641508, -0.007141656, -0.3027868, 0.2705882, 1, 0, 1,
-0.640922, -1.587207, -2.854844, 0.2666667, 1, 0, 1,
-0.6371347, 0.7103551, 0.4949903, 0.2588235, 1, 0, 1,
-0.634815, 0.8206028, -2.091232, 0.254902, 1, 0, 1,
-0.6314887, -0.6305792, -2.469271, 0.2470588, 1, 0, 1,
-0.6314778, 0.5661612, -1.124075, 0.2431373, 1, 0, 1,
-0.6281481, -0.424734, -1.01411, 0.2352941, 1, 0, 1,
-0.6250058, -0.8120199, -3.502373, 0.2313726, 1, 0, 1,
-0.6217158, 0.155577, -1.500118, 0.2235294, 1, 0, 1,
-0.6166051, 1.758117, -2.589086, 0.2196078, 1, 0, 1,
-0.6162987, -0.114113, -0.7877368, 0.2117647, 1, 0, 1,
-0.6152794, 1.316484, -1.20713, 0.2078431, 1, 0, 1,
-0.6121116, -0.1771655, -0.9151564, 0.2, 1, 0, 1,
-0.6094143, 0.4905576, -1.17759, 0.1921569, 1, 0, 1,
-0.6084231, 0.6230367, -0.8893747, 0.1882353, 1, 0, 1,
-0.6055074, -1.730214, -1.428655, 0.1803922, 1, 0, 1,
-0.6009933, 1.917926, 0.2947541, 0.1764706, 1, 0, 1,
-0.5981706, 0.1820772, -2.450877, 0.1686275, 1, 0, 1,
-0.5943323, 0.3024993, 0.3697448, 0.1647059, 1, 0, 1,
-0.5894579, 1.118956, -0.840849, 0.1568628, 1, 0, 1,
-0.5869086, 0.05710557, -2.428685, 0.1529412, 1, 0, 1,
-0.5845666, -1.490113, -3.553403, 0.145098, 1, 0, 1,
-0.5819317, 1.015011, 0.009857594, 0.1411765, 1, 0, 1,
-0.5807613, -1.609009, -3.678781, 0.1333333, 1, 0, 1,
-0.5783014, -2.190504, -1.836777, 0.1294118, 1, 0, 1,
-0.5779337, -0.3125365, -4.218604, 0.1215686, 1, 0, 1,
-0.5722815, 1.142083, -0.1452955, 0.1176471, 1, 0, 1,
-0.5720683, 0.03379748, -2.844223, 0.1098039, 1, 0, 1,
-0.5691039, -0.01911853, -0.9948049, 0.1058824, 1, 0, 1,
-0.5658631, 0.1207407, -0.4065516, 0.09803922, 1, 0, 1,
-0.5597786, -0.7688146, -2.128576, 0.09019608, 1, 0, 1,
-0.5567624, 1.289126, -1.463193, 0.08627451, 1, 0, 1,
-0.5524846, -0.8928847, -1.549466, 0.07843138, 1, 0, 1,
-0.5508602, 0.6856331, 0.315241, 0.07450981, 1, 0, 1,
-0.5502056, -1.36362, -4.08998, 0.06666667, 1, 0, 1,
-0.5446705, -0.07172433, -0.7913187, 0.0627451, 1, 0, 1,
-0.540386, 1.359228, -0.05064223, 0.05490196, 1, 0, 1,
-0.5377889, 1.420732, 0.4499491, 0.05098039, 1, 0, 1,
-0.5377026, -0.02638986, -1.710272, 0.04313726, 1, 0, 1,
-0.5373718, -0.1647165, -0.4654149, 0.03921569, 1, 0, 1,
-0.5245666, 0.6367268, -1.227128, 0.03137255, 1, 0, 1,
-0.5212913, -2.029391, -3.21509, 0.02745098, 1, 0, 1,
-0.520429, 0.5131489, -1.798752, 0.01960784, 1, 0, 1,
-0.518591, -0.6184182, -1.475236, 0.01568628, 1, 0, 1,
-0.5160287, 0.03374526, -1.818844, 0.007843138, 1, 0, 1,
-0.5153173, -1.256106, -3.661806, 0.003921569, 1, 0, 1,
-0.5148391, -1.237027, -1.60555, 0, 1, 0.003921569, 1,
-0.5133264, -0.9594471, -2.068737, 0, 1, 0.01176471, 1,
-0.5107313, 0.3095008, -0.7668757, 0, 1, 0.01568628, 1,
-0.5095332, 0.2256033, -1.928018, 0, 1, 0.02352941, 1,
-0.5085285, 2.286155, -1.716374, 0, 1, 0.02745098, 1,
-0.4992709, 0.04281069, -1.287679, 0, 1, 0.03529412, 1,
-0.4977564, 0.4798884, -1.263143, 0, 1, 0.03921569, 1,
-0.4961805, 0.7564463, -1.38565, 0, 1, 0.04705882, 1,
-0.4942856, -1.377322, -1.773406, 0, 1, 0.05098039, 1,
-0.4926715, -0.7254534, -2.735842, 0, 1, 0.05882353, 1,
-0.488539, 0.07946439, -2.443676, 0, 1, 0.0627451, 1,
-0.4873109, -0.1649111, -1.838167, 0, 1, 0.07058824, 1,
-0.4864986, -1.569345, -2.358244, 0, 1, 0.07450981, 1,
-0.4855795, 1.116818, -1.185392, 0, 1, 0.08235294, 1,
-0.4791818, -1.137559, -4.746326, 0, 1, 0.08627451, 1,
-0.4784577, 1.14952, -0.845365, 0, 1, 0.09411765, 1,
-0.4734685, 1.070946, -1.292553, 0, 1, 0.1019608, 1,
-0.4658774, 0.281409, -2.920059, 0, 1, 0.1058824, 1,
-0.4641429, -1.032711, -2.672498, 0, 1, 0.1137255, 1,
-0.4625726, -0.8463871, -2.099534, 0, 1, 0.1176471, 1,
-0.4624989, 1.508951, 0.655399, 0, 1, 0.1254902, 1,
-0.4579181, 0.08962641, -0.1717205, 0, 1, 0.1294118, 1,
-0.4503362, 0.5586882, -1.110552, 0, 1, 0.1372549, 1,
-0.4501776, 0.02764114, -2.425822, 0, 1, 0.1411765, 1,
-0.4497043, -1.974146, -3.444953, 0, 1, 0.1490196, 1,
-0.445702, -1.582214, -2.548426, 0, 1, 0.1529412, 1,
-0.4455853, 1.063891, 0.09200555, 0, 1, 0.1607843, 1,
-0.4455113, -0.09345761, -0.9988984, 0, 1, 0.1647059, 1,
-0.4387206, -0.3090582, -0.9343719, 0, 1, 0.172549, 1,
-0.4352783, -2.461363, -1.953239, 0, 1, 0.1764706, 1,
-0.4318735, -1.460405, -1.909689, 0, 1, 0.1843137, 1,
-0.4307344, 0.7988605, -0.2098024, 0, 1, 0.1882353, 1,
-0.4302448, -1.789962, -2.320607, 0, 1, 0.1960784, 1,
-0.4299453, 0.3537161, -1.143794, 0, 1, 0.2039216, 1,
-0.4265558, 0.6941159, -0.004725565, 0, 1, 0.2078431, 1,
-0.4255656, 0.5407175, -1.843297, 0, 1, 0.2156863, 1,
-0.4246264, 0.576617, -0.7642209, 0, 1, 0.2196078, 1,
-0.4237523, -0.7918168, -2.50775, 0, 1, 0.227451, 1,
-0.4227575, 1.770532, -0.3780209, 0, 1, 0.2313726, 1,
-0.4217574, 0.08685006, -1.345663, 0, 1, 0.2392157, 1,
-0.4209486, -0.2808714, -2.327009, 0, 1, 0.2431373, 1,
-0.4178844, -1.043277, -2.775194, 0, 1, 0.2509804, 1,
-0.4121057, -0.890233, -2.943481, 0, 1, 0.254902, 1,
-0.40804, 0.5163281, -1.526041, 0, 1, 0.2627451, 1,
-0.4065025, -0.124897, -1.817802, 0, 1, 0.2666667, 1,
-0.4022553, 0.7691454, 0.5338509, 0, 1, 0.2745098, 1,
-0.4018471, -0.06781999, -1.084615, 0, 1, 0.2784314, 1,
-0.3961329, 0.7795931, -0.7315753, 0, 1, 0.2862745, 1,
-0.3919377, -0.1772599, -2.044136, 0, 1, 0.2901961, 1,
-0.3917709, 1.856379, -1.593921, 0, 1, 0.2980392, 1,
-0.3897994, -0.8646577, -2.961171, 0, 1, 0.3058824, 1,
-0.3877068, 1.113435, 1.124465, 0, 1, 0.3098039, 1,
-0.3847364, 0.6200203, -0.1430855, 0, 1, 0.3176471, 1,
-0.3824806, 0.1465059, -1.046024, 0, 1, 0.3215686, 1,
-0.3793118, -0.0001529352, -1.915986, 0, 1, 0.3294118, 1,
-0.3775247, 0.2598799, -1.837261, 0, 1, 0.3333333, 1,
-0.3740082, -0.4586011, -2.971341, 0, 1, 0.3411765, 1,
-0.3687955, -0.3242467, -0.8626368, 0, 1, 0.345098, 1,
-0.3673489, -0.7688349, -1.7487, 0, 1, 0.3529412, 1,
-0.3622968, 0.6316063, 0.3736855, 0, 1, 0.3568628, 1,
-0.3597825, -0.8105521, -1.115405, 0, 1, 0.3647059, 1,
-0.3590972, 0.3393185, -2.125372, 0, 1, 0.3686275, 1,
-0.3578109, 0.4385534, -1.015941, 0, 1, 0.3764706, 1,
-0.3551177, -0.919403, -1.373639, 0, 1, 0.3803922, 1,
-0.3543564, -0.2826989, -2.466458, 0, 1, 0.3882353, 1,
-0.3521815, -1.291617, -3.074368, 0, 1, 0.3921569, 1,
-0.3460686, 0.5140209, -0.8349041, 0, 1, 0.4, 1,
-0.3458871, -0.005875396, -2.059413, 0, 1, 0.4078431, 1,
-0.3400257, 1.598045, -1.016815, 0, 1, 0.4117647, 1,
-0.3390839, -1.90812, -2.94284, 0, 1, 0.4196078, 1,
-0.3380089, 1.307349, -1.293509, 0, 1, 0.4235294, 1,
-0.3376385, 0.04384518, -2.767845, 0, 1, 0.4313726, 1,
-0.3325419, 1.099675, 0.2999249, 0, 1, 0.4352941, 1,
-0.3284463, -0.7616367, -2.309964, 0, 1, 0.4431373, 1,
-0.3277015, 0.1853893, -0.962332, 0, 1, 0.4470588, 1,
-0.3268836, -0.8280389, -2.512393, 0, 1, 0.454902, 1,
-0.322001, 0.5924095, -1.985665, 0, 1, 0.4588235, 1,
-0.3197072, 1.851681, 1.347043, 0, 1, 0.4666667, 1,
-0.3143088, 0.9477944, -0.7138195, 0, 1, 0.4705882, 1,
-0.310753, 0.5551616, -0.4202469, 0, 1, 0.4784314, 1,
-0.31056, 1.393169, 1.149461, 0, 1, 0.4823529, 1,
-0.3105474, 0.1289575, -0.8606176, 0, 1, 0.4901961, 1,
-0.3097519, -0.5414673, -3.166425, 0, 1, 0.4941176, 1,
-0.3033225, -0.1098875, -0.7134774, 0, 1, 0.5019608, 1,
-0.3031782, 0.1742247, -2.600698, 0, 1, 0.509804, 1,
-0.303034, -0.1501212, -2.204419, 0, 1, 0.5137255, 1,
-0.2992543, 0.06498919, -1.998692, 0, 1, 0.5215687, 1,
-0.2988504, -0.7267795, -2.390586, 0, 1, 0.5254902, 1,
-0.2987074, -1.441211, -2.091004, 0, 1, 0.5333334, 1,
-0.2973552, -1.966091, -4.079435, 0, 1, 0.5372549, 1,
-0.2965379, 0.3281198, -0.6027849, 0, 1, 0.5450981, 1,
-0.2922086, 0.5136343, -1.766895, 0, 1, 0.5490196, 1,
-0.2877217, -0.2651312, -3.80775, 0, 1, 0.5568628, 1,
-0.285862, 1.66305, -0.02554398, 0, 1, 0.5607843, 1,
-0.2823257, -1.505024, -2.415676, 0, 1, 0.5686275, 1,
-0.2818342, 0.09236719, -0.42782, 0, 1, 0.572549, 1,
-0.280306, 0.7605049, 0.009183967, 0, 1, 0.5803922, 1,
-0.2735049, 0.9846517, 0.577956, 0, 1, 0.5843138, 1,
-0.2609218, -0.3814702, -2.879082, 0, 1, 0.5921569, 1,
-0.2608822, -0.1529739, -3.4879, 0, 1, 0.5960785, 1,
-0.2568023, 1.205159, 0.3244464, 0, 1, 0.6039216, 1,
-0.2562191, 1.040477, -1.22001, 0, 1, 0.6117647, 1,
-0.2487499, 0.7406961, -0.1195716, 0, 1, 0.6156863, 1,
-0.2460301, 0.7383293, -0.9233033, 0, 1, 0.6235294, 1,
-0.2432273, 0.7962337, -0.8572502, 0, 1, 0.627451, 1,
-0.2429454, 0.5829001, -0.8533463, 0, 1, 0.6352941, 1,
-0.2423529, -0.2056636, -4.129348, 0, 1, 0.6392157, 1,
-0.2395979, 0.3001148, -0.8767101, 0, 1, 0.6470588, 1,
-0.2352729, 0.04860912, -0.4124025, 0, 1, 0.6509804, 1,
-0.2283676, -1.241131, -2.676777, 0, 1, 0.6588235, 1,
-0.2263833, -2.106093, -1.062524, 0, 1, 0.6627451, 1,
-0.2229262, -0.9148243, -2.386892, 0, 1, 0.6705883, 1,
-0.222821, 0.08439027, -3.298916, 0, 1, 0.6745098, 1,
-0.220626, 0.5300816, -2.387979, 0, 1, 0.682353, 1,
-0.2098732, -1.027797, -3.092023, 0, 1, 0.6862745, 1,
-0.2052783, 0.06954998, -2.551753, 0, 1, 0.6941177, 1,
-0.2004531, 0.6924698, -1.678275, 0, 1, 0.7019608, 1,
-0.1919204, -0.3031594, -1.468763, 0, 1, 0.7058824, 1,
-0.1912173, 1.208591, 0.5958091, 0, 1, 0.7137255, 1,
-0.1883238, -0.9167386, -2.678331, 0, 1, 0.7176471, 1,
-0.1843, 1.578601, -0.645878, 0, 1, 0.7254902, 1,
-0.1812331, -0.4186672, -2.752517, 0, 1, 0.7294118, 1,
-0.1803621, -0.8188428, -2.902005, 0, 1, 0.7372549, 1,
-0.1797671, -0.07879608, -1.461906, 0, 1, 0.7411765, 1,
-0.1786198, 1.786284, -1.254997, 0, 1, 0.7490196, 1,
-0.1779967, -0.2059461, -1.628672, 0, 1, 0.7529412, 1,
-0.1753154, -0.8840952, -4.145269, 0, 1, 0.7607843, 1,
-0.1750833, 1.159674, 1.243368, 0, 1, 0.7647059, 1,
-0.174984, 1.206123, 0.7255745, 0, 1, 0.772549, 1,
-0.1704385, -0.677555, -2.756057, 0, 1, 0.7764706, 1,
-0.1704065, 2.033457, 1.604136, 0, 1, 0.7843137, 1,
-0.1700568, -1.188971, -2.015805, 0, 1, 0.7882353, 1,
-0.1632662, -0.799181, -3.106487, 0, 1, 0.7960784, 1,
-0.1629972, -1.571554, -3.288996, 0, 1, 0.8039216, 1,
-0.1605409, 0.1766178, -0.2197101, 0, 1, 0.8078431, 1,
-0.158173, -2.81078, -5.6021, 0, 1, 0.8156863, 1,
-0.1549609, 1.851111, -1.518395, 0, 1, 0.8196079, 1,
-0.1504217, 0.9567063, 0.03424601, 0, 1, 0.827451, 1,
-0.1454696, -0.8842838, -2.413327, 0, 1, 0.8313726, 1,
-0.1445762, -1.563226, -4.487821, 0, 1, 0.8392157, 1,
-0.1437894, 0.03687187, -1.919881, 0, 1, 0.8431373, 1,
-0.1408461, -0.09484431, -2.344756, 0, 1, 0.8509804, 1,
-0.1396418, -1.656948, -2.872204, 0, 1, 0.854902, 1,
-0.1386699, 2.026739, -1.641388, 0, 1, 0.8627451, 1,
-0.1379543, 0.07598527, 0.384114, 0, 1, 0.8666667, 1,
-0.1329141, -2.370453, -3.949749, 0, 1, 0.8745098, 1,
-0.126946, 0.4671119, -0.8486636, 0, 1, 0.8784314, 1,
-0.1259328, -0.9100958, -3.130743, 0, 1, 0.8862745, 1,
-0.1211913, -0.3716502, -2.878042, 0, 1, 0.8901961, 1,
-0.1177693, 1.751066, -0.3413348, 0, 1, 0.8980392, 1,
-0.1161293, -1.594141, -0.8532949, 0, 1, 0.9058824, 1,
-0.1160887, 0.7557288, 0.8160276, 0, 1, 0.9098039, 1,
-0.116003, 0.3761986, 1.545176, 0, 1, 0.9176471, 1,
-0.115584, -0.4796992, -1.527699, 0, 1, 0.9215686, 1,
-0.1140686, 0.1472148, -0.2881193, 0, 1, 0.9294118, 1,
-0.1127348, 0.5809416, -0.1712358, 0, 1, 0.9333333, 1,
-0.1124867, 0.5884894, -0.9822644, 0, 1, 0.9411765, 1,
-0.1118571, -0.7637355, -2.559724, 0, 1, 0.945098, 1,
-0.1109227, -1.789058, -2.685043, 0, 1, 0.9529412, 1,
-0.1086013, 0.4581453, -1.889977, 0, 1, 0.9568627, 1,
-0.1078546, -0.6302468, -2.498476, 0, 1, 0.9647059, 1,
-0.1059061, -0.5031003, -4.125867, 0, 1, 0.9686275, 1,
-0.1058119, -0.2558336, -2.341573, 0, 1, 0.9764706, 1,
-0.103958, 0.8326011, -1.170035, 0, 1, 0.9803922, 1,
-0.1025357, 0.1498773, 0.1618784, 0, 1, 0.9882353, 1,
-0.09459537, -0.1268481, -1.566056, 0, 1, 0.9921569, 1,
-0.08684858, 0.07153541, -1.224484, 0, 1, 1, 1,
-0.08298638, 1.007929, -0.3389123, 0, 0.9921569, 1, 1,
-0.07038099, 0.4696531, 0.5253147, 0, 0.9882353, 1, 1,
-0.06619453, 1.30763, 0.3994515, 0, 0.9803922, 1, 1,
-0.06530295, 1.529732, -1.403527, 0, 0.9764706, 1, 1,
-0.06515853, -0.2970772, -3.090397, 0, 0.9686275, 1, 1,
-0.06270394, 0.3463881, -0.4008723, 0, 0.9647059, 1, 1,
-0.05976434, 0.6705814, 0.5183851, 0, 0.9568627, 1, 1,
-0.05891515, 0.5829182, -1.347311, 0, 0.9529412, 1, 1,
-0.05379971, -1.923599, -2.254262, 0, 0.945098, 1, 1,
-0.05011724, -0.4134331, -3.249574, 0, 0.9411765, 1, 1,
-0.04889474, 0.1984363, -0.3646332, 0, 0.9333333, 1, 1,
-0.04096136, 0.9267698, 2.064967, 0, 0.9294118, 1, 1,
-0.03684686, 1.318074, 0.7597564, 0, 0.9215686, 1, 1,
-0.03602958, -1.214247, -3.950577, 0, 0.9176471, 1, 1,
-0.03502062, -1.415875, -4.201815, 0, 0.9098039, 1, 1,
-0.03104471, 0.2968112, -0.03773726, 0, 0.9058824, 1, 1,
-0.02934322, -0.01149842, -1.810539, 0, 0.8980392, 1, 1,
-0.02598753, 0.1438111, 0.5523387, 0, 0.8901961, 1, 1,
-0.02273312, -0.2932258, -5.345008, 0, 0.8862745, 1, 1,
-0.02182931, -0.5551863, -3.776046, 0, 0.8784314, 1, 1,
-0.01958225, 0.2806407, -0.1259167, 0, 0.8745098, 1, 1,
-0.01933745, 1.507033, -0.2148701, 0, 0.8666667, 1, 1,
-0.01522552, 0.473851, 0.6318609, 0, 0.8627451, 1, 1,
-0.01434476, -0.5010889, -4.504504, 0, 0.854902, 1, 1,
-0.01291875, 0.1548882, -1.104908, 0, 0.8509804, 1, 1,
-0.01041539, 0.02526102, -1.03592, 0, 0.8431373, 1, 1,
-0.01029213, -0.6481825, -4.353428, 0, 0.8392157, 1, 1,
-0.008292608, -1.845544, -2.023181, 0, 0.8313726, 1, 1,
-0.00704144, 0.3143299, -1.198087, 0, 0.827451, 1, 1,
-0.0048589, -0.3821665, -3.91006, 0, 0.8196079, 1, 1,
-0.004448661, 0.3283985, 1.259865, 0, 0.8156863, 1, 1,
-0.002312696, 0.9794622, -1.780034, 0, 0.8078431, 1, 1,
-0.0008413121, -0.4322108, -1.16368, 0, 0.8039216, 1, 1,
0.006345248, 0.1426913, 0.05591791, 0, 0.7960784, 1, 1,
0.00685558, 1.943006, -0.6991397, 0, 0.7882353, 1, 1,
0.007855156, 0.6079549, 0.6779817, 0, 0.7843137, 1, 1,
0.01001819, 1.234697, 1.37778, 0, 0.7764706, 1, 1,
0.01199745, 1.351736, 0.75198, 0, 0.772549, 1, 1,
0.02516118, -0.6171221, 3.254085, 0, 0.7647059, 1, 1,
0.02859704, 1.909834, -0.3324287, 0, 0.7607843, 1, 1,
0.02945128, -0.8983396, 3.144841, 0, 0.7529412, 1, 1,
0.03095333, 0.08390725, 0.6429574, 0, 0.7490196, 1, 1,
0.03735963, 0.0150058, 1.23724, 0, 0.7411765, 1, 1,
0.03994162, 0.8586777, 0.3482134, 0, 0.7372549, 1, 1,
0.04436571, 0.7833556, -1.567594, 0, 0.7294118, 1, 1,
0.04671159, -1.37358, 5.009517, 0, 0.7254902, 1, 1,
0.04927015, -2.259753, 2.927235, 0, 0.7176471, 1, 1,
0.04968483, -0.03415132, 2.436958, 0, 0.7137255, 1, 1,
0.05181626, -0.6808884, 2.435545, 0, 0.7058824, 1, 1,
0.05182747, 0.01254294, 0.5343131, 0, 0.6980392, 1, 1,
0.05543483, 0.298781, 1.49156, 0, 0.6941177, 1, 1,
0.05623426, 1.244946, 1.061915, 0, 0.6862745, 1, 1,
0.06555452, 0.1866035, 0.4025077, 0, 0.682353, 1, 1,
0.07147546, -0.1799629, 3.085016, 0, 0.6745098, 1, 1,
0.07219129, -0.9347388, 2.940436, 0, 0.6705883, 1, 1,
0.0725012, 0.5484588, 0.8388823, 0, 0.6627451, 1, 1,
0.07607109, -1.925917, 1.573521, 0, 0.6588235, 1, 1,
0.07630222, -0.06824293, 1.166713, 0, 0.6509804, 1, 1,
0.07665747, 0.357905, 1.531791, 0, 0.6470588, 1, 1,
0.07696855, -0.3176574, 3.265126, 0, 0.6392157, 1, 1,
0.07715771, 1.284994, 1.611452, 0, 0.6352941, 1, 1,
0.07819613, -0.4057639, 2.028782, 0, 0.627451, 1, 1,
0.0782361, 1.207344, -1.040516, 0, 0.6235294, 1, 1,
0.07859231, -0.7178184, 1.631208, 0, 0.6156863, 1, 1,
0.07892228, -0.519237, 2.601279, 0, 0.6117647, 1, 1,
0.08650429, -1.575388, 4.515105, 0, 0.6039216, 1, 1,
0.09454442, 0.5420716, 0.8669979, 0, 0.5960785, 1, 1,
0.09821261, 0.8075232, -0.4913391, 0, 0.5921569, 1, 1,
0.1014275, -0.4490606, 2.261194, 0, 0.5843138, 1, 1,
0.1029054, 0.5516086, 0.7359999, 0, 0.5803922, 1, 1,
0.1079624, 0.4682226, -0.837869, 0, 0.572549, 1, 1,
0.111755, -0.2056211, 3.163025, 0, 0.5686275, 1, 1,
0.1139879, -1.869288, 3.376366, 0, 0.5607843, 1, 1,
0.1142924, -0.8733186, 2.873455, 0, 0.5568628, 1, 1,
0.1184356, 0.387681, 0.2566408, 0, 0.5490196, 1, 1,
0.1194188, -0.305306, 2.91331, 0, 0.5450981, 1, 1,
0.1209357, -2.203066, 3.050228, 0, 0.5372549, 1, 1,
0.1317344, 1.368606, -0.9242892, 0, 0.5333334, 1, 1,
0.1366291, -0.9435302, 4.789336, 0, 0.5254902, 1, 1,
0.1412092, -0.3020565, 3.450301, 0, 0.5215687, 1, 1,
0.1449721, 0.3117905, 1.282343, 0, 0.5137255, 1, 1,
0.1459613, -0.2634254, 1.767965, 0, 0.509804, 1, 1,
0.1460003, 0.1869438, 0.1786853, 0, 0.5019608, 1, 1,
0.1516337, 0.2324971, -0.06278325, 0, 0.4941176, 1, 1,
0.1573787, 0.935518, 1.143797, 0, 0.4901961, 1, 1,
0.1574732, -0.9395404, 3.866502, 0, 0.4823529, 1, 1,
0.1609373, 0.2614454, -1.565911, 0, 0.4784314, 1, 1,
0.1612107, -1.86243, 2.00251, 0, 0.4705882, 1, 1,
0.1614749, 0.7803921, 1.376723, 0, 0.4666667, 1, 1,
0.1645038, 1.183798, 1.362262, 0, 0.4588235, 1, 1,
0.1658864, 0.2712629, 1.364268, 0, 0.454902, 1, 1,
0.1693311, -0.208668, 1.352534, 0, 0.4470588, 1, 1,
0.1756752, 2.035514, 1.152716, 0, 0.4431373, 1, 1,
0.1758432, -0.798024, 4.186762, 0, 0.4352941, 1, 1,
0.1844487, -1.411055, 3.903713, 0, 0.4313726, 1, 1,
0.185985, 0.05372011, 1.40682, 0, 0.4235294, 1, 1,
0.1882173, 1.740093, 0.08656354, 0, 0.4196078, 1, 1,
0.1918828, -0.3699312, 2.024182, 0, 0.4117647, 1, 1,
0.1986029, -1.144285, 2.077303, 0, 0.4078431, 1, 1,
0.2000763, 1.523093, -0.4221949, 0, 0.4, 1, 1,
0.2042497, 1.392091, -0.4275688, 0, 0.3921569, 1, 1,
0.2049371, 0.03106783, 3.559987, 0, 0.3882353, 1, 1,
0.2101154, -0.1696371, 2.281216, 0, 0.3803922, 1, 1,
0.2117369, 0.168798, 0.2789797, 0, 0.3764706, 1, 1,
0.2127108, 0.576488, 0.04209978, 0, 0.3686275, 1, 1,
0.2143338, 0.5788726, 1.541602, 0, 0.3647059, 1, 1,
0.2151929, 0.9888828, -0.9018362, 0, 0.3568628, 1, 1,
0.2160342, 0.3723084, 2.233844, 0, 0.3529412, 1, 1,
0.2177411, 0.4057847, 0.8546355, 0, 0.345098, 1, 1,
0.2180549, 0.3123315, 0.2476731, 0, 0.3411765, 1, 1,
0.2247362, 1.486261, -0.1353667, 0, 0.3333333, 1, 1,
0.2260099, 1.698011, 1.492652, 0, 0.3294118, 1, 1,
0.2300656, 0.823767, 0.08583675, 0, 0.3215686, 1, 1,
0.2312067, -1.064784, 2.746884, 0, 0.3176471, 1, 1,
0.2338204, -0.5575376, 2.177288, 0, 0.3098039, 1, 1,
0.2341748, 0.7341442, 0.1171009, 0, 0.3058824, 1, 1,
0.2379733, 0.6811096, 0.4536798, 0, 0.2980392, 1, 1,
0.2382157, -0.7482123, 1.372793, 0, 0.2901961, 1, 1,
0.2410695, -0.8305398, 2.163154, 0, 0.2862745, 1, 1,
0.2454521, 0.001012088, 1.371136, 0, 0.2784314, 1, 1,
0.2459968, -1.798129, 2.302804, 0, 0.2745098, 1, 1,
0.2465538, -0.4705405, 3.370573, 0, 0.2666667, 1, 1,
0.2480982, 0.3768359, 0.8864419, 0, 0.2627451, 1, 1,
0.248611, 0.3477765, 0.4096742, 0, 0.254902, 1, 1,
0.2496679, 0.6055135, 0.8153068, 0, 0.2509804, 1, 1,
0.2512202, -1.594561, 1.322133, 0, 0.2431373, 1, 1,
0.253244, -0.4556833, 1.946597, 0, 0.2392157, 1, 1,
0.2565738, 0.008929844, 0.4862737, 0, 0.2313726, 1, 1,
0.2587865, 1.048293, 0.9299425, 0, 0.227451, 1, 1,
0.2636592, 1.419308, -0.6390545, 0, 0.2196078, 1, 1,
0.2693645, -0.3592159, 4.802334, 0, 0.2156863, 1, 1,
0.2695575, 0.330022, 1.16584, 0, 0.2078431, 1, 1,
0.2706906, 0.4095342, 1.456047, 0, 0.2039216, 1, 1,
0.2722221, 0.1880005, 2.287546, 0, 0.1960784, 1, 1,
0.2768547, 0.3142589, 0.3818226, 0, 0.1882353, 1, 1,
0.2784538, -0.1590689, 2.976911, 0, 0.1843137, 1, 1,
0.2785893, 0.07033049, 0.8948937, 0, 0.1764706, 1, 1,
0.2833034, 0.5071061, 0.7861025, 0, 0.172549, 1, 1,
0.2876575, -0.6449919, 0.5443494, 0, 0.1647059, 1, 1,
0.2896086, 1.972952, -0.6557745, 0, 0.1607843, 1, 1,
0.2906483, -0.8010112, 0.7195967, 0, 0.1529412, 1, 1,
0.2913707, 2.425931, -1.402698, 0, 0.1490196, 1, 1,
0.3027034, -1.026162, 2.684525, 0, 0.1411765, 1, 1,
0.3043376, -0.2760462, 3.551853, 0, 0.1372549, 1, 1,
0.3049668, -0.5349279, 0.6987427, 0, 0.1294118, 1, 1,
0.3050208, -0.290877, 3.156248, 0, 0.1254902, 1, 1,
0.3069859, -0.03710993, 0.7229208, 0, 0.1176471, 1, 1,
0.3071556, -1.681884, 2.920372, 0, 0.1137255, 1, 1,
0.3104027, -2.830638, 1.577632, 0, 0.1058824, 1, 1,
0.310645, -0.7892456, 2.151367, 0, 0.09803922, 1, 1,
0.3125375, -1.451035, 1.338881, 0, 0.09411765, 1, 1,
0.3132661, 0.3795069, 0.6545569, 0, 0.08627451, 1, 1,
0.3186453, 0.2300233, 1.492239, 0, 0.08235294, 1, 1,
0.3203695, 0.09890634, -0.5119829, 0, 0.07450981, 1, 1,
0.3207267, -1.500019, 3.111636, 0, 0.07058824, 1, 1,
0.3240744, 1.583448, 2.833249, 0, 0.0627451, 1, 1,
0.3253007, 0.8676696, -0.8904414, 0, 0.05882353, 1, 1,
0.3336621, -0.4503241, 3.985316, 0, 0.05098039, 1, 1,
0.3369935, -1.722324, 2.984969, 0, 0.04705882, 1, 1,
0.3403064, -0.5463157, 2.156168, 0, 0.03921569, 1, 1,
0.3422814, 0.2443926, 1.199673, 0, 0.03529412, 1, 1,
0.346627, -0.8911325, 2.744414, 0, 0.02745098, 1, 1,
0.3518355, -1.170773, 2.191773, 0, 0.02352941, 1, 1,
0.353536, 0.06849647, 1.466585, 0, 0.01568628, 1, 1,
0.3581071, 0.08555067, 2.183699, 0, 0.01176471, 1, 1,
0.360671, -0.2650798, 2.467608, 0, 0.003921569, 1, 1,
0.3607638, 1.448803, -0.2244149, 0.003921569, 0, 1, 1,
0.362241, 0.1314385, 1.010365, 0.007843138, 0, 1, 1,
0.3630726, 1.224088, -0.7825016, 0.01568628, 0, 1, 1,
0.3696208, -0.5878025, 4.123778, 0.01960784, 0, 1, 1,
0.3710661, 0.7167732, 0.9574693, 0.02745098, 0, 1, 1,
0.371179, -0.3410732, 1.950462, 0.03137255, 0, 1, 1,
0.3736975, -0.4851639, 3.017423, 0.03921569, 0, 1, 1,
0.3740905, -0.1702973, 1.316183, 0.04313726, 0, 1, 1,
0.3764259, 0.7528294, -1.407843, 0.05098039, 0, 1, 1,
0.3784601, -0.1892913, 1.415696, 0.05490196, 0, 1, 1,
0.379669, 0.1313631, 0.5612085, 0.0627451, 0, 1, 1,
0.3844286, -0.500805, 2.057186, 0.06666667, 0, 1, 1,
0.3861491, -0.3426162, 1.822659, 0.07450981, 0, 1, 1,
0.3884043, -1.997794, 2.476661, 0.07843138, 0, 1, 1,
0.393991, 0.288795, 1.908332, 0.08627451, 0, 1, 1,
0.3959993, 0.9737774, -0.5474365, 0.09019608, 0, 1, 1,
0.3973165, 0.9199286, -0.1960324, 0.09803922, 0, 1, 1,
0.3975476, -1.050335, 1.980304, 0.1058824, 0, 1, 1,
0.4043946, 1.436739, 1.308888, 0.1098039, 0, 1, 1,
0.4060351, 0.6815822, 0.7585914, 0.1176471, 0, 1, 1,
0.4086715, 0.2475557, 0.05652453, 0.1215686, 0, 1, 1,
0.4087827, 0.08480644, 2.612109, 0.1294118, 0, 1, 1,
0.4089377, -0.5719875, 2.11956, 0.1333333, 0, 1, 1,
0.414867, 0.1427159, 2.317984, 0.1411765, 0, 1, 1,
0.4167161, -0.8890423, 3.693575, 0.145098, 0, 1, 1,
0.4188101, -0.2773369, 2.075605, 0.1529412, 0, 1, 1,
0.419156, -1.099116, 2.453138, 0.1568628, 0, 1, 1,
0.4207912, 0.05069847, 0.3196984, 0.1647059, 0, 1, 1,
0.4208947, -0.4876515, 2.165922, 0.1686275, 0, 1, 1,
0.4223922, 0.2676897, -0.5617861, 0.1764706, 0, 1, 1,
0.4236146, 0.1409658, 1.471244, 0.1803922, 0, 1, 1,
0.4239518, 1.422704, 0.3161237, 0.1882353, 0, 1, 1,
0.4257542, -0.03620869, 2.482466, 0.1921569, 0, 1, 1,
0.4261869, -1.385746, 4.078176, 0.2, 0, 1, 1,
0.4278924, 0.5478553, 0.1623605, 0.2078431, 0, 1, 1,
0.4288231, -0.3773853, 3.151277, 0.2117647, 0, 1, 1,
0.4375632, -1.322603, 4.220284, 0.2196078, 0, 1, 1,
0.4392363, 2.642569, 1.598378, 0.2235294, 0, 1, 1,
0.4404976, 0.9719697, -0.02618052, 0.2313726, 0, 1, 1,
0.4421718, 0.0450913, 0.128206, 0.2352941, 0, 1, 1,
0.444676, -0.8954052, 3.532904, 0.2431373, 0, 1, 1,
0.4496113, -0.8953811, 3.67362, 0.2470588, 0, 1, 1,
0.4564179, 0.7939255, 0.8315597, 0.254902, 0, 1, 1,
0.4591173, 0.6859964, -2.071133, 0.2588235, 0, 1, 1,
0.4646584, 1.390856, 0.9226482, 0.2666667, 0, 1, 1,
0.4653793, 0.01677391, 0.866834, 0.2705882, 0, 1, 1,
0.4658637, -1.394432, 3.78486, 0.2784314, 0, 1, 1,
0.4701777, 0.6638186, -0.7781247, 0.282353, 0, 1, 1,
0.4702378, -1.966596, 2.875579, 0.2901961, 0, 1, 1,
0.4720268, 0.9504563, 1.995622, 0.2941177, 0, 1, 1,
0.4755033, -0.5703381, 2.792707, 0.3019608, 0, 1, 1,
0.477965, 1.664882, 0.9679925, 0.3098039, 0, 1, 1,
0.4853848, 1.040781, 0.1610135, 0.3137255, 0, 1, 1,
0.4868543, -0.4331394, 1.98035, 0.3215686, 0, 1, 1,
0.4936273, 0.4489083, 0.2595037, 0.3254902, 0, 1, 1,
0.4956375, -1.365409, 3.422092, 0.3333333, 0, 1, 1,
0.4986819, -1.236696, 2.844581, 0.3372549, 0, 1, 1,
0.5016781, -0.8246347, 3.78437, 0.345098, 0, 1, 1,
0.5047489, -0.4300838, 2.522627, 0.3490196, 0, 1, 1,
0.5071364, 1.047974, -0.01872775, 0.3568628, 0, 1, 1,
0.5073531, 1.513175, 0.3941742, 0.3607843, 0, 1, 1,
0.5190003, 0.6516016, 0.6734192, 0.3686275, 0, 1, 1,
0.5206379, -1.740369, 2.899345, 0.372549, 0, 1, 1,
0.5216529, 0.5850654, 0.8959035, 0.3803922, 0, 1, 1,
0.5244635, 0.5096158, 2.727819, 0.3843137, 0, 1, 1,
0.5244724, 0.15679, 0.4320721, 0.3921569, 0, 1, 1,
0.5255919, 0.2869213, 0.8893048, 0.3960784, 0, 1, 1,
0.527528, 0.8561049, -2.366777, 0.4039216, 0, 1, 1,
0.5295846, -0.005001233, 0.5068155, 0.4117647, 0, 1, 1,
0.5325564, 2.18018, 2.531879, 0.4156863, 0, 1, 1,
0.542514, 0.2160716, 1.022733, 0.4235294, 0, 1, 1,
0.5435298, 0.5978224, 1.096642, 0.427451, 0, 1, 1,
0.5443876, 0.7886353, 1.607914, 0.4352941, 0, 1, 1,
0.5462762, -0.05141129, 2.730033, 0.4392157, 0, 1, 1,
0.5571583, -0.324671, 1.168162, 0.4470588, 0, 1, 1,
0.558533, -1.214668, 1.935346, 0.4509804, 0, 1, 1,
0.56321, -0.8762074, 1.965006, 0.4588235, 0, 1, 1,
0.5709133, -0.677561, 1.623212, 0.4627451, 0, 1, 1,
0.5712336, 1.389095, -1.807863, 0.4705882, 0, 1, 1,
0.5732065, 1.454136, 0.7378888, 0.4745098, 0, 1, 1,
0.5748038, -1.816599, 1.487702, 0.4823529, 0, 1, 1,
0.5801093, -2.823334, 3.684614, 0.4862745, 0, 1, 1,
0.5865495, -1.854483, 1.517087, 0.4941176, 0, 1, 1,
0.5872922, -0.8858624, 2.571903, 0.5019608, 0, 1, 1,
0.5883079, 1.495475, 1.44354, 0.5058824, 0, 1, 1,
0.588724, 0.8079812, 1.149378, 0.5137255, 0, 1, 1,
0.5915644, 0.5224084, 0.7163876, 0.5176471, 0, 1, 1,
0.6025248, -1.141727, 3.968035, 0.5254902, 0, 1, 1,
0.6050116, 0.2864617, 1.410969, 0.5294118, 0, 1, 1,
0.6143989, -0.3296776, 1.870427, 0.5372549, 0, 1, 1,
0.623129, -0.4844656, 3.481126, 0.5411765, 0, 1, 1,
0.6286325, -1.62889, 2.290586, 0.5490196, 0, 1, 1,
0.630682, 0.3822061, 0.954092, 0.5529412, 0, 1, 1,
0.6337134, -0.9304239, 2.425487, 0.5607843, 0, 1, 1,
0.6531129, 0.126804, 1.271503, 0.5647059, 0, 1, 1,
0.6553453, 0.8126134, -0.3578341, 0.572549, 0, 1, 1,
0.6566262, 0.9031651, 0.1096222, 0.5764706, 0, 1, 1,
0.6579458, -0.4190204, 0.9106213, 0.5843138, 0, 1, 1,
0.6652339, -0.5579365, 1.805689, 0.5882353, 0, 1, 1,
0.6749523, 0.0752569, 2.24148, 0.5960785, 0, 1, 1,
0.6776671, 0.8418704, 0.4784819, 0.6039216, 0, 1, 1,
0.6780302, 0.02420224, 1.868174, 0.6078432, 0, 1, 1,
0.6812868, 0.2373077, 0.7576922, 0.6156863, 0, 1, 1,
0.6832863, 0.1198256, 0.6440571, 0.6196079, 0, 1, 1,
0.6841509, -0.1050882, 2.776946, 0.627451, 0, 1, 1,
0.6866554, 0.4380952, 1.64439, 0.6313726, 0, 1, 1,
0.6963407, -0.3153519, 1.918197, 0.6392157, 0, 1, 1,
0.7007169, 1.348103, 0.3135905, 0.6431373, 0, 1, 1,
0.7021382, 0.9494756, 2.677745, 0.6509804, 0, 1, 1,
0.703232, -0.1912609, 1.139243, 0.654902, 0, 1, 1,
0.7067125, 0.6997378, 0.6431115, 0.6627451, 0, 1, 1,
0.7080517, -1.549434, 0.5250058, 0.6666667, 0, 1, 1,
0.7120767, 1.172906, 1.113905, 0.6745098, 0, 1, 1,
0.722119, 0.2884156, 1.023229, 0.6784314, 0, 1, 1,
0.7282864, -0.8080884, 2.215132, 0.6862745, 0, 1, 1,
0.7299549, -1.398828, 1.665041, 0.6901961, 0, 1, 1,
0.7363663, 0.3250776, 0.4285484, 0.6980392, 0, 1, 1,
0.736564, 0.258655, 1.068249, 0.7058824, 0, 1, 1,
0.7385437, -1.425267, 2.599193, 0.7098039, 0, 1, 1,
0.7416577, 1.484799, -1.074538, 0.7176471, 0, 1, 1,
0.7482584, 0.5538333, 1.639434, 0.7215686, 0, 1, 1,
0.7484776, 0.8219609, 1.095843, 0.7294118, 0, 1, 1,
0.7494189, 0.4516889, 1.449776, 0.7333333, 0, 1, 1,
0.7531499, -0.4571167, 1.416871, 0.7411765, 0, 1, 1,
0.7589834, 0.7191383, -1.284684, 0.7450981, 0, 1, 1,
0.764647, 0.2474469, 0.5704145, 0.7529412, 0, 1, 1,
0.7650287, -0.1993346, 1.269112, 0.7568628, 0, 1, 1,
0.7661029, 1.216207, 0.08532691, 0.7647059, 0, 1, 1,
0.7685418, -1.248252, 2.875702, 0.7686275, 0, 1, 1,
0.7753562, -1.459957, 3.090789, 0.7764706, 0, 1, 1,
0.7760035, -0.4364631, 2.407353, 0.7803922, 0, 1, 1,
0.7784179, -0.2008761, 1.74464, 0.7882353, 0, 1, 1,
0.7791672, -0.4005621, 3.596659, 0.7921569, 0, 1, 1,
0.7840567, 0.02497865, 1.199962, 0.8, 0, 1, 1,
0.785223, -0.6985441, 3.518347, 0.8078431, 0, 1, 1,
0.7870342, 1.77948, 1.817183, 0.8117647, 0, 1, 1,
0.78851, -0.1620362, 2.651781, 0.8196079, 0, 1, 1,
0.791805, -0.3651302, 0.9546688, 0.8235294, 0, 1, 1,
0.7918681, -0.0721114, 3.332484, 0.8313726, 0, 1, 1,
0.7975991, -1.055344, 2.979094, 0.8352941, 0, 1, 1,
0.8054874, -1.781547, 2.485304, 0.8431373, 0, 1, 1,
0.8100899, -0.5668349, 0.2096904, 0.8470588, 0, 1, 1,
0.8154405, -0.524904, 2.789787, 0.854902, 0, 1, 1,
0.8226136, -0.2254939, 3.234167, 0.8588235, 0, 1, 1,
0.8226371, -0.08636705, 0.4622836, 0.8666667, 0, 1, 1,
0.8286253, 0.4700796, 2.189948, 0.8705882, 0, 1, 1,
0.8318736, 0.7354965, 1.090364, 0.8784314, 0, 1, 1,
0.8320479, 0.9541798, 1.819487, 0.8823529, 0, 1, 1,
0.8380812, -0.7656561, 2.813588, 0.8901961, 0, 1, 1,
0.8395702, 0.4644411, 0.9021137, 0.8941177, 0, 1, 1,
0.840995, -0.05534934, 0.9143878, 0.9019608, 0, 1, 1,
0.845045, 1.191692, -0.5064449, 0.9098039, 0, 1, 1,
0.8468603, -1.22248, 3.20131, 0.9137255, 0, 1, 1,
0.8598345, 0.7097083, 1.218097, 0.9215686, 0, 1, 1,
0.8634992, -0.3278159, 1.33982, 0.9254902, 0, 1, 1,
0.865251, -0.4535409, 2.200928, 0.9333333, 0, 1, 1,
0.8762986, 1.335789, -0.01434618, 0.9372549, 0, 1, 1,
0.8767576, -0.4608459, 1.422279, 0.945098, 0, 1, 1,
0.8793105, 0.3447681, 0.2834071, 0.9490196, 0, 1, 1,
0.8810077, 0.5201041, 1.565297, 0.9568627, 0, 1, 1,
0.8828978, -1.598924, 3.601826, 0.9607843, 0, 1, 1,
0.8850487, -1.349728, 3.356562, 0.9686275, 0, 1, 1,
0.8900908, 0.9471477, 0.6694964, 0.972549, 0, 1, 1,
0.8938928, 1.031605, 1.781315, 0.9803922, 0, 1, 1,
0.8967649, -0.5116217, 1.569358, 0.9843137, 0, 1, 1,
0.898711, -1.427655, 2.163789, 0.9921569, 0, 1, 1,
0.8990517, 1.091955, 0.168111, 0.9960784, 0, 1, 1,
0.9046862, -0.4555722, 2.107142, 1, 0, 0.9960784, 1,
0.9120243, 0.5769977, 0.1536302, 1, 0, 0.9882353, 1,
0.9238052, -0.3783198, 2.551391, 1, 0, 0.9843137, 1,
0.9243533, 0.3781321, 1.235194, 1, 0, 0.9764706, 1,
0.9278216, 1.561841, 0.1745937, 1, 0, 0.972549, 1,
0.9351611, 0.01436134, 1.374966, 1, 0, 0.9647059, 1,
0.9364827, 0.6438707, 1.55828, 1, 0, 0.9607843, 1,
0.9365866, 0.16019, 1.997046, 1, 0, 0.9529412, 1,
0.9424063, -1.395248, 3.150305, 1, 0, 0.9490196, 1,
0.9427906, -0.9658377, 3.805389, 1, 0, 0.9411765, 1,
0.9432155, -1.095597, 3.466824, 1, 0, 0.9372549, 1,
0.9484462, -0.8504214, 1.861468, 1, 0, 0.9294118, 1,
0.9489763, 0.3242488, 1.665753, 1, 0, 0.9254902, 1,
0.9553075, -1.325531, 2.199769, 1, 0, 0.9176471, 1,
0.9603597, 1.767534, 0.4178972, 1, 0, 0.9137255, 1,
0.9728041, -1.538356, 1.257311, 1, 0, 0.9058824, 1,
0.976036, -2.203115, 2.272107, 1, 0, 0.9019608, 1,
0.9797451, -1.332102, 2.567238, 1, 0, 0.8941177, 1,
0.9815023, -0.2245781, 2.319659, 1, 0, 0.8862745, 1,
0.987433, 1.120096, 0.5792615, 1, 0, 0.8823529, 1,
0.9877138, 0.6449743, -0.1528378, 1, 0, 0.8745098, 1,
0.9891416, -1.082623, 2.091744, 1, 0, 0.8705882, 1,
0.9921005, 0.3094633, 1.47672, 1, 0, 0.8627451, 1,
0.9950885, 1.015922, -0.1288214, 1, 0, 0.8588235, 1,
0.9957415, 1.034873, 1.586944, 1, 0, 0.8509804, 1,
0.9963923, -1.480977, 3.183323, 1, 0, 0.8470588, 1,
1.003716, -0.3305511, 1.576204, 1, 0, 0.8392157, 1,
1.00564, -0.4041646, 1.982352, 1, 0, 0.8352941, 1,
1.007806, 1.4097, -0.9249596, 1, 0, 0.827451, 1,
1.013049, 2.678067, -1.302496, 1, 0, 0.8235294, 1,
1.014597, 1.902109, 0.8097461, 1, 0, 0.8156863, 1,
1.017212, -0.6122315, 1.244369, 1, 0, 0.8117647, 1,
1.017829, 1.435804, -1.519857, 1, 0, 0.8039216, 1,
1.020218, 1.137016, 1.98719, 1, 0, 0.7960784, 1,
1.02188, -0.08793739, 2.070237, 1, 0, 0.7921569, 1,
1.026092, -0.4305247, 2.813101, 1, 0, 0.7843137, 1,
1.028603, 0.01085537, 1.201599, 1, 0, 0.7803922, 1,
1.029061, -1.024068, 0.9371324, 1, 0, 0.772549, 1,
1.038577, -0.2148459, 2.348802, 1, 0, 0.7686275, 1,
1.047325, -0.6820493, 4.237176, 1, 0, 0.7607843, 1,
1.048567, -0.2236435, 1.110854, 1, 0, 0.7568628, 1,
1.04937, 0.3662175, 1.504399, 1, 0, 0.7490196, 1,
1.050511, -0.06306136, 1.722356, 1, 0, 0.7450981, 1,
1.056397, -1.292754, 1.956458, 1, 0, 0.7372549, 1,
1.062524, 0.1283566, -0.8362964, 1, 0, 0.7333333, 1,
1.06285, 0.2115512, 2.300969, 1, 0, 0.7254902, 1,
1.073709, 0.8145117, 1.092426, 1, 0, 0.7215686, 1,
1.074321, 0.4126369, 0.2493443, 1, 0, 0.7137255, 1,
1.076392, -0.0713055, 1.360856, 1, 0, 0.7098039, 1,
1.08219, -1.307472, 2.639359, 1, 0, 0.7019608, 1,
1.082852, 0.943593, -0.2229663, 1, 0, 0.6941177, 1,
1.08391, -0.2449674, 0.9969042, 1, 0, 0.6901961, 1,
1.099935, -0.8193005, 1.385042, 1, 0, 0.682353, 1,
1.108065, 1.209167, 1.136926, 1, 0, 0.6784314, 1,
1.109614, -0.1897501, 0.9291959, 1, 0, 0.6705883, 1,
1.115606, 0.9670951, 0.04272071, 1, 0, 0.6666667, 1,
1.119999, -0.5178088, 2.275175, 1, 0, 0.6588235, 1,
1.120698, 0.04058374, 1.715109, 1, 0, 0.654902, 1,
1.123604, -0.9049769, -0.5460297, 1, 0, 0.6470588, 1,
1.142408, -0.8153363, 2.462026, 1, 0, 0.6431373, 1,
1.14415, -0.2569636, 1.459541, 1, 0, 0.6352941, 1,
1.147925, 0.5227185, 2.159613, 1, 0, 0.6313726, 1,
1.151456, 0.1669032, 0.7504011, 1, 0, 0.6235294, 1,
1.154012, -1.011402, 1.513212, 1, 0, 0.6196079, 1,
1.16128, -0.7501501, 3.562813, 1, 0, 0.6117647, 1,
1.165779, 0.7805214, 1.944366, 1, 0, 0.6078432, 1,
1.166113, 0.1099198, 2.782034, 1, 0, 0.6, 1,
1.179567, -0.7808371, 1.824962, 1, 0, 0.5921569, 1,
1.197461, -2.176574, 1.550386, 1, 0, 0.5882353, 1,
1.203209, -0.6017433, 3.349287, 1, 0, 0.5803922, 1,
1.21445, 0.8240317, 1.365061, 1, 0, 0.5764706, 1,
1.219997, 0.7115442, 3.255091, 1, 0, 0.5686275, 1,
1.223878, -0.6314579, 1.082382, 1, 0, 0.5647059, 1,
1.224438, -0.2812455, 2.300025, 1, 0, 0.5568628, 1,
1.232756, -0.9910058, 3.24408, 1, 0, 0.5529412, 1,
1.23483, -0.08438329, 1.032462, 1, 0, 0.5450981, 1,
1.237332, -0.5757906, 0.5524159, 1, 0, 0.5411765, 1,
1.239196, 1.514401, -0.09778965, 1, 0, 0.5333334, 1,
1.241565, 0.05283717, 1.419847, 1, 0, 0.5294118, 1,
1.246962, -1.554269, 1.615299, 1, 0, 0.5215687, 1,
1.251671, 0.9315608, 0.8102053, 1, 0, 0.5176471, 1,
1.251701, -1.229482, 3.408415, 1, 0, 0.509804, 1,
1.276546, 0.2371706, 1.191516, 1, 0, 0.5058824, 1,
1.278795, -0.6614609, 2.035495, 1, 0, 0.4980392, 1,
1.283984, -0.3614009, 1.000523, 1, 0, 0.4901961, 1,
1.304344, 0.5084219, 0.1649048, 1, 0, 0.4862745, 1,
1.310507, -1.082193, 3.060167, 1, 0, 0.4784314, 1,
1.32207, -0.906711, 3.470529, 1, 0, 0.4745098, 1,
1.323478, -0.01895798, -0.141032, 1, 0, 0.4666667, 1,
1.329676, -0.293728, 0.9177665, 1, 0, 0.4627451, 1,
1.334454, 0.1401838, -0.5726259, 1, 0, 0.454902, 1,
1.334692, -0.8320561, 1.959355, 1, 0, 0.4509804, 1,
1.338894, 0.9311739, -0.2106238, 1, 0, 0.4431373, 1,
1.34926, 1.993584, -0.2843576, 1, 0, 0.4392157, 1,
1.367426, -0.125005, 3.292314, 1, 0, 0.4313726, 1,
1.374766, -1.811095, 1.494269, 1, 0, 0.427451, 1,
1.379838, -1.085882, 3.26436, 1, 0, 0.4196078, 1,
1.392471, -0.825253, 1.70787, 1, 0, 0.4156863, 1,
1.403588, -0.06591541, 1.117088, 1, 0, 0.4078431, 1,
1.408033, 0.4241899, 2.313062, 1, 0, 0.4039216, 1,
1.44262, -0.4712833, 1.541706, 1, 0, 0.3960784, 1,
1.447201, -1.318572, 3.737705, 1, 0, 0.3882353, 1,
1.453389, -0.3732026, 1.599216, 1, 0, 0.3843137, 1,
1.460829, 1.745697, 1.325215, 1, 0, 0.3764706, 1,
1.460982, -0.9887604, 1.346944, 1, 0, 0.372549, 1,
1.474237, -1.567407, 1.50472, 1, 0, 0.3647059, 1,
1.476075, 1.053224, -0.9150353, 1, 0, 0.3607843, 1,
1.487621, -2.333637, 2.942791, 1, 0, 0.3529412, 1,
1.495499, -1.208308, 0.7446829, 1, 0, 0.3490196, 1,
1.501356, 0.4436415, 2.050038, 1, 0, 0.3411765, 1,
1.517417, -0.2399581, -0.6422836, 1, 0, 0.3372549, 1,
1.524842, -1.108957, 1.532957, 1, 0, 0.3294118, 1,
1.532835, -0.1266712, 2.722497, 1, 0, 0.3254902, 1,
1.533873, -0.4422774, 3.334543, 1, 0, 0.3176471, 1,
1.540624, 0.4726854, -1.220066, 1, 0, 0.3137255, 1,
1.573579, -0.6847327, 3.248404, 1, 0, 0.3058824, 1,
1.591742, 0.328119, 0.8081012, 1, 0, 0.2980392, 1,
1.594423, -0.09344602, 2.998269, 1, 0, 0.2941177, 1,
1.622362, 1.153906, 2.45299, 1, 0, 0.2862745, 1,
1.625182, 1.509637, 1.426324, 1, 0, 0.282353, 1,
1.654725, 0.6661762, -0.2548281, 1, 0, 0.2745098, 1,
1.660197, -0.5074262, 1.96775, 1, 0, 0.2705882, 1,
1.663835, 0.8809857, 2.467913, 1, 0, 0.2627451, 1,
1.668455, -1.086596, 2.046502, 1, 0, 0.2588235, 1,
1.695989, -1.4637, 1.137044, 1, 0, 0.2509804, 1,
1.70281, 1.12142, 1.889701, 1, 0, 0.2470588, 1,
1.729716, -0.07583632, 2.348993, 1, 0, 0.2392157, 1,
1.754207, -0.719572, 2.375697, 1, 0, 0.2352941, 1,
1.755589, 0.8198879, 1.146737, 1, 0, 0.227451, 1,
1.764861, 0.7555975, -0.277574, 1, 0, 0.2235294, 1,
1.768556, 0.9375401, 1.471732, 1, 0, 0.2156863, 1,
1.771303, -1.112218, 2.960374, 1, 0, 0.2117647, 1,
1.773062, 0.6362441, 1.526433, 1, 0, 0.2039216, 1,
1.77781, -0.8242099, 1.990061, 1, 0, 0.1960784, 1,
1.786094, 1.123636, 0.431262, 1, 0, 0.1921569, 1,
1.817539, 0.3242233, 0.3339961, 1, 0, 0.1843137, 1,
1.830683, -0.315839, 1.131182, 1, 0, 0.1803922, 1,
1.835558, -0.1480753, 2.564358, 1, 0, 0.172549, 1,
1.836446, 0.5742817, 1.367616, 1, 0, 0.1686275, 1,
1.836593, 1.341172, 1.517819, 1, 0, 0.1607843, 1,
1.838349, 0.3943713, 2.318522, 1, 0, 0.1568628, 1,
1.874103, 1.281983, -0.7377598, 1, 0, 0.1490196, 1,
1.877861, 0.4257118, 2.093609, 1, 0, 0.145098, 1,
1.890209, 1.279285, 0.9999344, 1, 0, 0.1372549, 1,
1.907612, 1.642976, 0.2997213, 1, 0, 0.1333333, 1,
1.933379, -1.068823, 1.14165, 1, 0, 0.1254902, 1,
1.991901, 0.4392326, 0.3876432, 1, 0, 0.1215686, 1,
2.029603, 1.111659, 1.188798, 1, 0, 0.1137255, 1,
2.039966, -0.3408717, 3.000923, 1, 0, 0.1098039, 1,
2.042473, -2.526575, 1.774623, 1, 0, 0.1019608, 1,
2.088334, 0.2652369, 3.659358, 1, 0, 0.09411765, 1,
2.093632, -0.1290605, 3.466734, 1, 0, 0.09019608, 1,
2.151077, -0.3482964, 1.274985, 1, 0, 0.08235294, 1,
2.250314, 1.691313, 1.702881, 1, 0, 0.07843138, 1,
2.262395, -0.08383003, 1.789241, 1, 0, 0.07058824, 1,
2.266293, -0.3552282, 2.367394, 1, 0, 0.06666667, 1,
2.304587, 1.184282, 0.3617584, 1, 0, 0.05882353, 1,
2.321086, -1.087989, -1.110415, 1, 0, 0.05490196, 1,
2.503596, -0.1365039, 1.395713, 1, 0, 0.04705882, 1,
2.512082, -0.4725902, 1.474431, 1, 0, 0.04313726, 1,
2.525449, 0.005852211, 1.96097, 1, 0, 0.03529412, 1,
2.607792, 0.07144177, 0.587495, 1, 0, 0.03137255, 1,
2.611437, 1.470085, 2.443867, 1, 0, 0.02352941, 1,
2.621118, -0.9424952, 1.799934, 1, 0, 0.01960784, 1,
2.940991, 0.4120032, 0.5412863, 1, 0, 0.01176471, 1,
2.954445, 0.7834091, -0.2850493, 1, 0, 0.007843138, 1
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
-0.3974168, -3.822732, -7.400769, 0, -0.5, 0.5, 0.5,
-0.3974168, -3.822732, -7.400769, 1, -0.5, 0.5, 0.5,
-0.3974168, -3.822732, -7.400769, 1, 1.5, 0.5, 0.5,
-0.3974168, -3.822732, -7.400769, 0, 1.5, 0.5, 0.5
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
-4.88556, 0.05766368, -7.400769, 0, -0.5, 0.5, 0.5,
-4.88556, 0.05766368, -7.400769, 1, -0.5, 0.5, 0.5,
-4.88556, 0.05766368, -7.400769, 1, 1.5, 0.5, 0.5,
-4.88556, 0.05766368, -7.400769, 0, 1.5, 0.5, 0.5
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
-4.88556, -3.822732, -0.2962918, 0, -0.5, 0.5, 0.5,
-4.88556, -3.822732, -0.2962918, 1, -0.5, 0.5, 0.5,
-4.88556, -3.822732, -0.2962918, 1, 1.5, 0.5, 0.5,
-4.88556, -3.822732, -0.2962918, 0, 1.5, 0.5, 0.5
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
-3, -2.927256, -5.761275,
2, -2.927256, -5.761275,
-3, -2.927256, -5.761275,
-3, -3.076502, -6.034524,
-2, -2.927256, -5.761275,
-2, -3.076502, -6.034524,
-1, -2.927256, -5.761275,
-1, -3.076502, -6.034524,
0, -2.927256, -5.761275,
0, -3.076502, -6.034524,
1, -2.927256, -5.761275,
1, -3.076502, -6.034524,
2, -2.927256, -5.761275,
2, -3.076502, -6.034524
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
-3, -3.374995, -6.581022, 0, -0.5, 0.5, 0.5,
-3, -3.374995, -6.581022, 1, -0.5, 0.5, 0.5,
-3, -3.374995, -6.581022, 1, 1.5, 0.5, 0.5,
-3, -3.374995, -6.581022, 0, 1.5, 0.5, 0.5,
-2, -3.374995, -6.581022, 0, -0.5, 0.5, 0.5,
-2, -3.374995, -6.581022, 1, -0.5, 0.5, 0.5,
-2, -3.374995, -6.581022, 1, 1.5, 0.5, 0.5,
-2, -3.374995, -6.581022, 0, 1.5, 0.5, 0.5,
-1, -3.374995, -6.581022, 0, -0.5, 0.5, 0.5,
-1, -3.374995, -6.581022, 1, -0.5, 0.5, 0.5,
-1, -3.374995, -6.581022, 1, 1.5, 0.5, 0.5,
-1, -3.374995, -6.581022, 0, 1.5, 0.5, 0.5,
0, -3.374995, -6.581022, 0, -0.5, 0.5, 0.5,
0, -3.374995, -6.581022, 1, -0.5, 0.5, 0.5,
0, -3.374995, -6.581022, 1, 1.5, 0.5, 0.5,
0, -3.374995, -6.581022, 0, 1.5, 0.5, 0.5,
1, -3.374995, -6.581022, 0, -0.5, 0.5, 0.5,
1, -3.374995, -6.581022, 1, -0.5, 0.5, 0.5,
1, -3.374995, -6.581022, 1, 1.5, 0.5, 0.5,
1, -3.374995, -6.581022, 0, 1.5, 0.5, 0.5,
2, -3.374995, -6.581022, 0, -0.5, 0.5, 0.5,
2, -3.374995, -6.581022, 1, -0.5, 0.5, 0.5,
2, -3.374995, -6.581022, 1, 1.5, 0.5, 0.5,
2, -3.374995, -6.581022, 0, 1.5, 0.5, 0.5
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
-3.849835, -2, -5.761275,
-3.849835, 2, -5.761275,
-3.849835, -2, -5.761275,
-4.022456, -2, -6.034524,
-3.849835, -1, -5.761275,
-4.022456, -1, -6.034524,
-3.849835, 0, -5.761275,
-4.022456, 0, -6.034524,
-3.849835, 1, -5.761275,
-4.022456, 1, -6.034524,
-3.849835, 2, -5.761275,
-4.022456, 2, -6.034524
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
-4.367697, -2, -6.581022, 0, -0.5, 0.5, 0.5,
-4.367697, -2, -6.581022, 1, -0.5, 0.5, 0.5,
-4.367697, -2, -6.581022, 1, 1.5, 0.5, 0.5,
-4.367697, -2, -6.581022, 0, 1.5, 0.5, 0.5,
-4.367697, -1, -6.581022, 0, -0.5, 0.5, 0.5,
-4.367697, -1, -6.581022, 1, -0.5, 0.5, 0.5,
-4.367697, -1, -6.581022, 1, 1.5, 0.5, 0.5,
-4.367697, -1, -6.581022, 0, 1.5, 0.5, 0.5,
-4.367697, 0, -6.581022, 0, -0.5, 0.5, 0.5,
-4.367697, 0, -6.581022, 1, -0.5, 0.5, 0.5,
-4.367697, 0, -6.581022, 1, 1.5, 0.5, 0.5,
-4.367697, 0, -6.581022, 0, 1.5, 0.5, 0.5,
-4.367697, 1, -6.581022, 0, -0.5, 0.5, 0.5,
-4.367697, 1, -6.581022, 1, -0.5, 0.5, 0.5,
-4.367697, 1, -6.581022, 1, 1.5, 0.5, 0.5,
-4.367697, 1, -6.581022, 0, 1.5, 0.5, 0.5,
-4.367697, 2, -6.581022, 0, -0.5, 0.5, 0.5,
-4.367697, 2, -6.581022, 1, -0.5, 0.5, 0.5,
-4.367697, 2, -6.581022, 1, 1.5, 0.5, 0.5,
-4.367697, 2, -6.581022, 0, 1.5, 0.5, 0.5
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
-3.849835, -2.927256, -4,
-3.849835, -2.927256, 4,
-3.849835, -2.927256, -4,
-4.022456, -3.076502, -4,
-3.849835, -2.927256, -2,
-4.022456, -3.076502, -2,
-3.849835, -2.927256, 0,
-4.022456, -3.076502, 0,
-3.849835, -2.927256, 2,
-4.022456, -3.076502, 2,
-3.849835, -2.927256, 4,
-4.022456, -3.076502, 4
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
-4.367697, -3.374995, -4, 0, -0.5, 0.5, 0.5,
-4.367697, -3.374995, -4, 1, -0.5, 0.5, 0.5,
-4.367697, -3.374995, -4, 1, 1.5, 0.5, 0.5,
-4.367697, -3.374995, -4, 0, 1.5, 0.5, 0.5,
-4.367697, -3.374995, -2, 0, -0.5, 0.5, 0.5,
-4.367697, -3.374995, -2, 1, -0.5, 0.5, 0.5,
-4.367697, -3.374995, -2, 1, 1.5, 0.5, 0.5,
-4.367697, -3.374995, -2, 0, 1.5, 0.5, 0.5,
-4.367697, -3.374995, 0, 0, -0.5, 0.5, 0.5,
-4.367697, -3.374995, 0, 1, -0.5, 0.5, 0.5,
-4.367697, -3.374995, 0, 1, 1.5, 0.5, 0.5,
-4.367697, -3.374995, 0, 0, 1.5, 0.5, 0.5,
-4.367697, -3.374995, 2, 0, -0.5, 0.5, 0.5,
-4.367697, -3.374995, 2, 1, -0.5, 0.5, 0.5,
-4.367697, -3.374995, 2, 1, 1.5, 0.5, 0.5,
-4.367697, -3.374995, 2, 0, 1.5, 0.5, 0.5,
-4.367697, -3.374995, 4, 0, -0.5, 0.5, 0.5,
-4.367697, -3.374995, 4, 1, -0.5, 0.5, 0.5,
-4.367697, -3.374995, 4, 1, 1.5, 0.5, 0.5,
-4.367697, -3.374995, 4, 0, 1.5, 0.5, 0.5
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
-3.849835, -2.927256, -5.761275,
-3.849835, 3.042584, -5.761275,
-3.849835, -2.927256, 5.168691,
-3.849835, 3.042584, 5.168691,
-3.849835, -2.927256, -5.761275,
-3.849835, -2.927256, 5.168691,
-3.849835, 3.042584, -5.761275,
-3.849835, 3.042584, 5.168691,
-3.849835, -2.927256, -5.761275,
3.055001, -2.927256, -5.761275,
-3.849835, -2.927256, 5.168691,
3.055001, -2.927256, 5.168691,
-3.849835, 3.042584, -5.761275,
3.055001, 3.042584, -5.761275,
-3.849835, 3.042584, 5.168691,
3.055001, 3.042584, 5.168691,
3.055001, -2.927256, -5.761275,
3.055001, 3.042584, -5.761275,
3.055001, -2.927256, 5.168691,
3.055001, 3.042584, 5.168691,
3.055001, -2.927256, -5.761275,
3.055001, -2.927256, 5.168691,
3.055001, 3.042584, -5.761275,
3.055001, 3.042584, 5.168691
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
var radius = 7.603926;
var distance = 33.83073;
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
mvMatrix.translate( 0.3974168, -0.05766368, 0.2962918 );
mvMatrix.scale( 1.190689, 1.377175, 0.7521995 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83073);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
alloxydim-sodium<-read.table("alloxydim-sodium.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-alloxydim-sodium$V2
```

```
## Error in eval(expr, envir, enclos): object 'alloxydim' not found
```

```r
y<-alloxydim-sodium$V3
```

```
## Error in eval(expr, envir, enclos): object 'alloxydim' not found
```

```r
z<-alloxydim-sodium$V4
```

```
## Error in eval(expr, envir, enclos): object 'alloxydim' not found
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
-3.749279, 0.2177763, -2.047606, 0, 0, 1, 1, 1,
-2.847171, -0.4828995, 0.5388078, 1, 0, 0, 1, 1,
-2.732697, 0.6062422, 0.5677338, 1, 0, 0, 1, 1,
-2.725819, 0.04683492, -1.187545, 1, 0, 0, 1, 1,
-2.669314, 1.038966, -1.844591, 1, 0, 0, 1, 1,
-2.617509, 1.200801, -1.346725, 1, 0, 0, 1, 1,
-2.525147, 1.423692, -1.604287, 0, 0, 0, 1, 1,
-2.439582, 0.6849156, -1.285679, 0, 0, 0, 1, 1,
-2.386875, 0.07522328, -0.9470843, 0, 0, 0, 1, 1,
-2.3826, -2.212438, -1.720062, 0, 0, 0, 1, 1,
-2.349076, 0.8959091, -2.665881, 0, 0, 0, 1, 1,
-2.312165, -0.02676544, -2.675721, 0, 0, 0, 1, 1,
-2.284428, 1.469572, -2.709957, 0, 0, 0, 1, 1,
-2.274796, 0.07689223, -3.220613, 1, 1, 1, 1, 1,
-2.238513, 0.5133181, -2.913273, 1, 1, 1, 1, 1,
-2.224887, -1.297303, -0.6956507, 1, 1, 1, 1, 1,
-2.210453, -0.8782877, -3.142177, 1, 1, 1, 1, 1,
-2.153061, -0.2973321, -2.89604, 1, 1, 1, 1, 1,
-2.106525, -1.586633, -2.825968, 1, 1, 1, 1, 1,
-2.094151, -2.046904, -3.113367, 1, 1, 1, 1, 1,
-2.073928, 1.904943, -0.9988997, 1, 1, 1, 1, 1,
-2.05643, 0.6797504, 0.04993787, 1, 1, 1, 1, 1,
-1.983543, -1.109692, -1.419841, 1, 1, 1, 1, 1,
-1.965394, 0.8868917, -1.390315, 1, 1, 1, 1, 1,
-1.924999, 1.150039, -1.985809, 1, 1, 1, 1, 1,
-1.920535, 0.02875235, -0.9618955, 1, 1, 1, 1, 1,
-1.908116, 0.5716045, -2.364569, 1, 1, 1, 1, 1,
-1.902603, 0.298532, -1.287172, 1, 1, 1, 1, 1,
-1.89589, -2.711747, -0.8723002, 0, 0, 1, 1, 1,
-1.894258, -2.293181, -3.640967, 1, 0, 0, 1, 1,
-1.881306, -0.2007103, -1.957102, 1, 0, 0, 1, 1,
-1.868507, 0.7275447, -2.282464, 1, 0, 0, 1, 1,
-1.864936, 0.4257573, 1.223776, 1, 0, 0, 1, 1,
-1.858269, 0.9777139, -0.655989, 1, 0, 0, 1, 1,
-1.847372, -0.1732, -2.661803, 0, 0, 0, 1, 1,
-1.84245, 0.705007, -2.299633, 0, 0, 0, 1, 1,
-1.840359, 1.922092, -1.921433, 0, 0, 0, 1, 1,
-1.830189, 1.198067, -2.385535, 0, 0, 0, 1, 1,
-1.826943, -1.453381, -1.930071, 0, 0, 0, 1, 1,
-1.821207, 0.2903055, -2.927378, 0, 0, 0, 1, 1,
-1.810195, -0.1725227, -0.7014012, 0, 0, 0, 1, 1,
-1.803943, 0.2330496, -1.782919, 1, 1, 1, 1, 1,
-1.787549, 0.8263378, -0.9644143, 1, 1, 1, 1, 1,
-1.767606, 2.840291, -1.499634, 1, 1, 1, 1, 1,
-1.738393, 1.009927, -1.401489, 1, 1, 1, 1, 1,
-1.707062, -0.0887632, -1.214231, 1, 1, 1, 1, 1,
-1.697015, 0.004325446, -3.169266, 1, 1, 1, 1, 1,
-1.689456, -0.4674959, -2.614516, 1, 1, 1, 1, 1,
-1.68614, 0.1896981, -2.684792, 1, 1, 1, 1, 1,
-1.677652, 0.1501628, -2.569636, 1, 1, 1, 1, 1,
-1.676246, -0.9843255, -1.845697, 1, 1, 1, 1, 1,
-1.665597, -0.7294163, -2.005647, 1, 1, 1, 1, 1,
-1.656069, -0.1246138, -1.156889, 1, 1, 1, 1, 1,
-1.649202, -0.4100155, -1.873001, 1, 1, 1, 1, 1,
-1.647426, 0.2480424, -1.95991, 1, 1, 1, 1, 1,
-1.644549, -0.2808271, -0.9698537, 1, 1, 1, 1, 1,
-1.629871, 0.9560657, -1.025939, 0, 0, 1, 1, 1,
-1.628339, 0.5458074, -0.6670924, 1, 0, 0, 1, 1,
-1.608543, 0.3437048, -1.927994, 1, 0, 0, 1, 1,
-1.588675, 0.05840468, -1.212245, 1, 0, 0, 1, 1,
-1.582323, -2.840317, -0.9349847, 1, 0, 0, 1, 1,
-1.570982, 0.9846918, -0.4002945, 1, 0, 0, 1, 1,
-1.558562, 0.8853803, -1.418748, 0, 0, 0, 1, 1,
-1.558221, -0.093281, -1.724626, 0, 0, 0, 1, 1,
-1.546811, 1.088448, -0.5909566, 0, 0, 0, 1, 1,
-1.543289, 0.08805191, -1.896925, 0, 0, 0, 1, 1,
-1.535513, 1.578683, -1.794435, 0, 0, 0, 1, 1,
-1.534287, -0.6598294, -4.859117, 0, 0, 0, 1, 1,
-1.522781, -1.611879, -1.417242, 0, 0, 0, 1, 1,
-1.513981, 0.4776455, -1.111245, 1, 1, 1, 1, 1,
-1.507317, 0.6767487, -0.02739167, 1, 1, 1, 1, 1,
-1.503815, -1.458118, -2.993677, 1, 1, 1, 1, 1,
-1.48322, 0.116638, -0.6819398, 1, 1, 1, 1, 1,
-1.482202, -0.821786, -3.42635, 1, 1, 1, 1, 1,
-1.47864, -2.002031, -4.067033, 1, 1, 1, 1, 1,
-1.478494, 1.437577, 0.5926048, 1, 1, 1, 1, 1,
-1.4753, -1.328901, -2.885056, 1, 1, 1, 1, 1,
-1.474448, 1.205672, 0.1727539, 1, 1, 1, 1, 1,
-1.472249, 0.2490231, -0.5274487, 1, 1, 1, 1, 1,
-1.469876, 1.740252, -0.9366421, 1, 1, 1, 1, 1,
-1.457363, 0.163084, -0.5154574, 1, 1, 1, 1, 1,
-1.451728, 0.5864906, -1.293609, 1, 1, 1, 1, 1,
-1.445166, -0.8761763, -3.578475, 1, 1, 1, 1, 1,
-1.443772, -0.1492169, -1.331157, 1, 1, 1, 1, 1,
-1.425253, 1.029764, -1.053183, 0, 0, 1, 1, 1,
-1.424783, -2.503992, -4.076089, 1, 0, 0, 1, 1,
-1.413334, 0.5178233, -0.6446263, 1, 0, 0, 1, 1,
-1.405889, -2.043953, -3.168792, 1, 0, 0, 1, 1,
-1.405169, -0.3435511, -2.534793, 1, 0, 0, 1, 1,
-1.400389, -0.1067147, -2.012127, 1, 0, 0, 1, 1,
-1.376344, 0.8079652, -2.077086, 0, 0, 0, 1, 1,
-1.371571, -0.3364358, -1.762941, 0, 0, 0, 1, 1,
-1.359509, -0.3885864, -1.884784, 0, 0, 0, 1, 1,
-1.356403, 0.09064975, -0.3220835, 0, 0, 0, 1, 1,
-1.349403, 0.07481369, -0.8996983, 0, 0, 0, 1, 1,
-1.344402, -0.1777239, -1.595435, 0, 0, 0, 1, 1,
-1.344007, -0.1139647, -0.3779721, 0, 0, 0, 1, 1,
-1.338153, 2.033955, 0.7787609, 1, 1, 1, 1, 1,
-1.335618, 0.8430787, -1.950015, 1, 1, 1, 1, 1,
-1.321607, -0.5651771, -3.247625, 1, 1, 1, 1, 1,
-1.305715, -0.09990578, -0.9662236, 1, 1, 1, 1, 1,
-1.303477, -0.02519471, -1.133457, 1, 1, 1, 1, 1,
-1.303091, -1.177229, -1.887015, 1, 1, 1, 1, 1,
-1.292224, -0.3491052, -0.3338273, 1, 1, 1, 1, 1,
-1.290042, 0.8577226, -0.7299845, 1, 1, 1, 1, 1,
-1.285246, 1.397049, 0.6806923, 1, 1, 1, 1, 1,
-1.281122, -0.8920282, -1.747573, 1, 1, 1, 1, 1,
-1.272379, 1.178202, -0.09856357, 1, 1, 1, 1, 1,
-1.270094, 1.028601, -0.3719513, 1, 1, 1, 1, 1,
-1.26763, -0.825872, -2.467959, 1, 1, 1, 1, 1,
-1.263813, -0.006691872, -1.957692, 1, 1, 1, 1, 1,
-1.256231, 0.5298076, -0.9628462, 1, 1, 1, 1, 1,
-1.252766, -0.4873807, 1.596381, 0, 0, 1, 1, 1,
-1.244691, -1.241289, -2.394098, 1, 0, 0, 1, 1,
-1.243592, 0.4118087, -0.9519875, 1, 0, 0, 1, 1,
-1.242971, -2.519719, -1.719056, 1, 0, 0, 1, 1,
-1.240637, 1.884007, -0.5311494, 1, 0, 0, 1, 1,
-1.214702, -1.620201, -1.314434, 1, 0, 0, 1, 1,
-1.212796, 0.9947883, -1.288508, 0, 0, 0, 1, 1,
-1.211392, 1.583268, -0.8928019, 0, 0, 0, 1, 1,
-1.207181, -0.5481555, -3.579886, 0, 0, 0, 1, 1,
-1.206997, 0.634726, -2.351189, 0, 0, 0, 1, 1,
-1.206523, 0.8981209, -0.4884568, 0, 0, 0, 1, 1,
-1.203606, 0.4299764, -0.7510336, 0, 0, 0, 1, 1,
-1.19464, 0.1753908, -1.422447, 0, 0, 0, 1, 1,
-1.192637, -0.505881, -1.539496, 1, 1, 1, 1, 1,
-1.19008, -2.615532, -4.519918, 1, 1, 1, 1, 1,
-1.189241, -1.776575, -3.051212, 1, 1, 1, 1, 1,
-1.179374, 0.4332943, -3.117824, 1, 1, 1, 1, 1,
-1.174182, 0.561448, -0.9019088, 1, 1, 1, 1, 1,
-1.170452, -0.2329236, -0.9085624, 1, 1, 1, 1, 1,
-1.169449, 1.527091, -1.384925, 1, 1, 1, 1, 1,
-1.163488, -1.502727, -2.498233, 1, 1, 1, 1, 1,
-1.159605, 1.538613, -0.6285351, 1, 1, 1, 1, 1,
-1.157642, -0.8262171, -3.3467, 1, 1, 1, 1, 1,
-1.156407, 0.5720198, -2.519786, 1, 1, 1, 1, 1,
-1.152866, 1.002506, -1.457904, 1, 1, 1, 1, 1,
-1.141651, 0.5976679, -2.107468, 1, 1, 1, 1, 1,
-1.140681, 0.2469693, -1.328956, 1, 1, 1, 1, 1,
-1.134516, -1.392847, -3.117197, 1, 1, 1, 1, 1,
-1.129062, -0.04839262, 0.6827461, 0, 0, 1, 1, 1,
-1.122476, -0.2455948, -2.884637, 1, 0, 0, 1, 1,
-1.122158, 1.836327, -1.725624, 1, 0, 0, 1, 1,
-1.119323, -1.482642, -2.509051, 1, 0, 0, 1, 1,
-1.11606, -0.1117697, -1.34978, 1, 0, 0, 1, 1,
-1.113729, -0.7072977, -4.012106, 1, 0, 0, 1, 1,
-1.111424, -0.4743836, -0.9476762, 0, 0, 0, 1, 1,
-1.109641, 0.3053259, -0.1649011, 0, 0, 0, 1, 1,
-1.108527, -0.3027827, -0.9977565, 0, 0, 0, 1, 1,
-1.107584, 0.4560625, -1.431989, 0, 0, 0, 1, 1,
-1.107138, 0.9381098, -1.338734, 0, 0, 0, 1, 1,
-1.103828, -0.301637, -0.6387008, 0, 0, 0, 1, 1,
-1.083578, -0.2946606, -1.8747, 0, 0, 0, 1, 1,
-1.076933, 0.2867765, 0.1150236, 1, 1, 1, 1, 1,
-1.072364, -1.466635, -1.762319, 1, 1, 1, 1, 1,
-1.070258, 1.358688, -1.518167, 1, 1, 1, 1, 1,
-1.066609, 1.162782, 1.027729, 1, 1, 1, 1, 1,
-1.060987, -1.487108, -2.677568, 1, 1, 1, 1, 1,
-1.058314, -2.018745, -2.045728, 1, 1, 1, 1, 1,
-1.05362, 0.2046669, -1.715745, 1, 1, 1, 1, 1,
-1.043963, 0.215892, -1.727048, 1, 1, 1, 1, 1,
-1.041322, 0.2184299, -2.018253, 1, 1, 1, 1, 1,
-1.041175, -1.526225, -3.49279, 1, 1, 1, 1, 1,
-1.041033, -0.2869892, -2.126238, 1, 1, 1, 1, 1,
-1.039658, 1.503978, -0.0575063, 1, 1, 1, 1, 1,
-1.035049, 1.360764, -0.1866474, 1, 1, 1, 1, 1,
-1.032664, -1.382658, -0.4773363, 1, 1, 1, 1, 1,
-1.02594, -2.244693, -1.397632, 1, 1, 1, 1, 1,
-1.018082, -0.5887989, -2.621831, 0, 0, 1, 1, 1,
-1.014746, 0.288474, -1.735485, 1, 0, 0, 1, 1,
-1.014278, -0.08974349, 1.378137, 1, 0, 0, 1, 1,
-1.013914, 1.361044, -1.184087, 1, 0, 0, 1, 1,
-1.007443, 1.482842, -2.907948, 1, 0, 0, 1, 1,
-1.007213, -0.7725423, -1.148792, 1, 0, 0, 1, 1,
-1.006673, 2.196244, -1.190462, 0, 0, 0, 1, 1,
-1.004728, -0.222655, -0.7604923, 0, 0, 0, 1, 1,
-1.000856, 1.02482, -1.568398, 0, 0, 0, 1, 1,
-0.9998232, -0.6339158, -1.195366, 0, 0, 0, 1, 1,
-0.9989557, 0.00142346, -1.060915, 0, 0, 0, 1, 1,
-0.9927543, -0.8888678, -1.119479, 0, 0, 0, 1, 1,
-0.9925836, 1.168116, -0.3779325, 0, 0, 0, 1, 1,
-0.9907179, -0.7602813, -2.674937, 1, 1, 1, 1, 1,
-0.9836962, -0.07721457, -0.8420625, 1, 1, 1, 1, 1,
-0.9748592, -0.4678085, -2.116528, 1, 1, 1, 1, 1,
-0.9720888, 1.510199, -0.8643039, 1, 1, 1, 1, 1,
-0.970017, 0.234403, 0.2203936, 1, 1, 1, 1, 1,
-0.9649827, -0.1754209, -0.5316866, 1, 1, 1, 1, 1,
-0.9624871, 0.8166422, 0.4957089, 1, 1, 1, 1, 1,
-0.9537781, 2.172624, 0.2428658, 1, 1, 1, 1, 1,
-0.9469747, -0.9211989, -0.974535, 1, 1, 1, 1, 1,
-0.9410347, 1.180247, -0.0628386, 1, 1, 1, 1, 1,
-0.9348768, 1.105826, -1.420565, 1, 1, 1, 1, 1,
-0.9297307, -0.2892095, -1.887103, 1, 1, 1, 1, 1,
-0.9274652, 0.2578492, -2.337164, 1, 1, 1, 1, 1,
-0.9241246, -0.2019357, -1.853649, 1, 1, 1, 1, 1,
-0.9220313, -1.865628, -3.3404, 1, 1, 1, 1, 1,
-0.9182033, -1.538326, -1.878653, 0, 0, 1, 1, 1,
-0.9140447, -1.242349, -3.043004, 1, 0, 0, 1, 1,
-0.911523, -1.300892, -3.342197, 1, 0, 0, 1, 1,
-0.9072021, -0.2860636, -2.970442, 1, 0, 0, 1, 1,
-0.9044171, 0.1603148, -1.87814, 1, 0, 0, 1, 1,
-0.9033843, 0.7049503, 2.067748, 1, 0, 0, 1, 1,
-0.8945428, -1.712107, -2.556879, 0, 0, 0, 1, 1,
-0.8920715, -1.213144, -1.229812, 0, 0, 0, 1, 1,
-0.8919338, 1.060584, 1.404385, 0, 0, 0, 1, 1,
-0.8836234, -0.8545579, -2.028341, 0, 0, 0, 1, 1,
-0.8825165, 0.07875357, -2.256418, 0, 0, 0, 1, 1,
-0.8809091, -0.3512439, -0.2981796, 0, 0, 0, 1, 1,
-0.879716, 0.7662455, 0.4172254, 0, 0, 0, 1, 1,
-0.8796653, 0.133281, -0.4686675, 1, 1, 1, 1, 1,
-0.8796587, 0.4934544, -1.304776, 1, 1, 1, 1, 1,
-0.876695, 2.955644, 1.051718, 1, 1, 1, 1, 1,
-0.8756352, 0.3363206, -1.564105, 1, 1, 1, 1, 1,
-0.874145, 0.4156182, -2.19699, 1, 1, 1, 1, 1,
-0.872329, -1.476989, -1.772796, 1, 1, 1, 1, 1,
-0.8712975, 0.1256728, -2.489868, 1, 1, 1, 1, 1,
-0.8613391, 2.587182, -1.938805, 1, 1, 1, 1, 1,
-0.860867, 1.236018, -1.802454, 1, 1, 1, 1, 1,
-0.8593036, -0.1008564, -3.243501, 1, 1, 1, 1, 1,
-0.8579472, -0.5219376, -3.468613, 1, 1, 1, 1, 1,
-0.8573526, -0.01065663, -2.653331, 1, 1, 1, 1, 1,
-0.8559739, -0.009081842, -3.208095, 1, 1, 1, 1, 1,
-0.8550051, -0.5746927, -3.373348, 1, 1, 1, 1, 1,
-0.854459, -0.07764162, -2.915196, 1, 1, 1, 1, 1,
-0.8489543, -0.8882493, -2.60901, 0, 0, 1, 1, 1,
-0.8479704, 0.245088, -2.324874, 1, 0, 0, 1, 1,
-0.841648, 0.9776103, -0.08371027, 1, 0, 0, 1, 1,
-0.8388222, -0.9614899, -1.214357, 1, 0, 0, 1, 1,
-0.8382967, 0.4779103, -0.6561889, 1, 0, 0, 1, 1,
-0.8374124, -0.4467143, -0.7461461, 1, 0, 0, 1, 1,
-0.8366573, 0.04289534, -1.884632, 0, 0, 0, 1, 1,
-0.8361337, -1.524792, -3.408181, 0, 0, 0, 1, 1,
-0.8358131, 0.6588646, -0.3333163, 0, 0, 0, 1, 1,
-0.8316281, -0.7707812, -2.257484, 0, 0, 0, 1, 1,
-0.8302315, 0.3458302, -0.6643898, 0, 0, 0, 1, 1,
-0.8298404, -0.05009635, -1.472669, 0, 0, 0, 1, 1,
-0.818641, -0.4203179, -3.517295, 0, 0, 0, 1, 1,
-0.8180601, -0.1788778, -1.863792, 1, 1, 1, 1, 1,
-0.8164042, 1.104376, -0.2233212, 1, 1, 1, 1, 1,
-0.8110723, -0.3344767, -3.319112, 1, 1, 1, 1, 1,
-0.8083983, -1.129707, -1.848485, 1, 1, 1, 1, 1,
-0.8068152, 0.4942272, -1.073665, 1, 1, 1, 1, 1,
-0.8044974, 0.9210218, -0.6469674, 1, 1, 1, 1, 1,
-0.7990682, 1.940953, 0.3493252, 1, 1, 1, 1, 1,
-0.7859567, 0.1507887, -0.3602606, 1, 1, 1, 1, 1,
-0.7791443, -0.4681947, -1.367391, 1, 1, 1, 1, 1,
-0.776112, 0.171455, -0.1345702, 1, 1, 1, 1, 1,
-0.7753213, -0.2723887, -3.019677, 1, 1, 1, 1, 1,
-0.7727576, -0.384874, -2.934248, 1, 1, 1, 1, 1,
-0.7695806, 0.2231182, 0.5510641, 1, 1, 1, 1, 1,
-0.7634461, 0.3073614, -1.010322, 1, 1, 1, 1, 1,
-0.7619222, -0.3443769, -2.096398, 1, 1, 1, 1, 1,
-0.7503075, 1.932793, 1.207904, 0, 0, 1, 1, 1,
-0.750139, -0.2519454, -2.441, 1, 0, 0, 1, 1,
-0.7471212, -1.318819, -3.138014, 1, 0, 0, 1, 1,
-0.7397894, 0.1871727, -1.305444, 1, 0, 0, 1, 1,
-0.7360974, 0.8969009, 0.1933095, 1, 0, 0, 1, 1,
-0.7329004, -0.3506796, -0.7520567, 1, 0, 0, 1, 1,
-0.7239131, -0.4108413, -1.480133, 0, 0, 0, 1, 1,
-0.7196788, 1.62394, 1.039577, 0, 0, 0, 1, 1,
-0.7193067, -0.7775007, -4.196346, 0, 0, 0, 1, 1,
-0.7190114, -0.2041442, -2.415247, 0, 0, 0, 1, 1,
-0.7180678, -0.2620612, 0.07463668, 0, 0, 0, 1, 1,
-0.7155002, 0.8344479, -2.215719, 0, 0, 0, 1, 1,
-0.7108001, -0.1435443, -1.824722, 0, 0, 0, 1, 1,
-0.7101291, 0.7509201, -0.39602, 1, 1, 1, 1, 1,
-0.7077677, -1.719052, -2.90082, 1, 1, 1, 1, 1,
-0.707702, -0.5345765, -0.7815853, 1, 1, 1, 1, 1,
-0.7006176, 0.3318939, -2.495709, 1, 1, 1, 1, 1,
-0.6978668, -0.08029185, -2.879502, 1, 1, 1, 1, 1,
-0.6929495, -1.166024, -2.330308, 1, 1, 1, 1, 1,
-0.6927145, -0.2790448, -2.004717, 1, 1, 1, 1, 1,
-0.6921324, 1.192214, -2.265992, 1, 1, 1, 1, 1,
-0.691398, -0.5415995, -2.08165, 1, 1, 1, 1, 1,
-0.6835928, 0.2383198, -2.178907, 1, 1, 1, 1, 1,
-0.682952, 0.3893603, -0.2552541, 1, 1, 1, 1, 1,
-0.6825312, 1.237396, 0.5637497, 1, 1, 1, 1, 1,
-0.6822399, -0.8720918, -2.52976, 1, 1, 1, 1, 1,
-0.6743233, 0.9507648, 1.271168, 1, 1, 1, 1, 1,
-0.6742086, 2.088777, -0.3557994, 1, 1, 1, 1, 1,
-0.6702807, 0.3607759, -0.1501443, 0, 0, 1, 1, 1,
-0.6635802, -0.3343992, -1.349341, 1, 0, 0, 1, 1,
-0.6596404, -0.6405582, -3.182406, 1, 0, 0, 1, 1,
-0.658805, 0.6388332, -0.1755009, 1, 0, 0, 1, 1,
-0.6534613, 2.680829, -0.6006033, 1, 0, 0, 1, 1,
-0.6519008, -0.7974012, -2.964331, 1, 0, 0, 1, 1,
-0.6500789, 0.3616923, -1.60118, 0, 0, 0, 1, 1,
-0.6488917, -0.4064642, -2.004025, 0, 0, 0, 1, 1,
-0.641508, -0.007141656, -0.3027868, 0, 0, 0, 1, 1,
-0.640922, -1.587207, -2.854844, 0, 0, 0, 1, 1,
-0.6371347, 0.7103551, 0.4949903, 0, 0, 0, 1, 1,
-0.634815, 0.8206028, -2.091232, 0, 0, 0, 1, 1,
-0.6314887, -0.6305792, -2.469271, 0, 0, 0, 1, 1,
-0.6314778, 0.5661612, -1.124075, 1, 1, 1, 1, 1,
-0.6281481, -0.424734, -1.01411, 1, 1, 1, 1, 1,
-0.6250058, -0.8120199, -3.502373, 1, 1, 1, 1, 1,
-0.6217158, 0.155577, -1.500118, 1, 1, 1, 1, 1,
-0.6166051, 1.758117, -2.589086, 1, 1, 1, 1, 1,
-0.6162987, -0.114113, -0.7877368, 1, 1, 1, 1, 1,
-0.6152794, 1.316484, -1.20713, 1, 1, 1, 1, 1,
-0.6121116, -0.1771655, -0.9151564, 1, 1, 1, 1, 1,
-0.6094143, 0.4905576, -1.17759, 1, 1, 1, 1, 1,
-0.6084231, 0.6230367, -0.8893747, 1, 1, 1, 1, 1,
-0.6055074, -1.730214, -1.428655, 1, 1, 1, 1, 1,
-0.6009933, 1.917926, 0.2947541, 1, 1, 1, 1, 1,
-0.5981706, 0.1820772, -2.450877, 1, 1, 1, 1, 1,
-0.5943323, 0.3024993, 0.3697448, 1, 1, 1, 1, 1,
-0.5894579, 1.118956, -0.840849, 1, 1, 1, 1, 1,
-0.5869086, 0.05710557, -2.428685, 0, 0, 1, 1, 1,
-0.5845666, -1.490113, -3.553403, 1, 0, 0, 1, 1,
-0.5819317, 1.015011, 0.009857594, 1, 0, 0, 1, 1,
-0.5807613, -1.609009, -3.678781, 1, 0, 0, 1, 1,
-0.5783014, -2.190504, -1.836777, 1, 0, 0, 1, 1,
-0.5779337, -0.3125365, -4.218604, 1, 0, 0, 1, 1,
-0.5722815, 1.142083, -0.1452955, 0, 0, 0, 1, 1,
-0.5720683, 0.03379748, -2.844223, 0, 0, 0, 1, 1,
-0.5691039, -0.01911853, -0.9948049, 0, 0, 0, 1, 1,
-0.5658631, 0.1207407, -0.4065516, 0, 0, 0, 1, 1,
-0.5597786, -0.7688146, -2.128576, 0, 0, 0, 1, 1,
-0.5567624, 1.289126, -1.463193, 0, 0, 0, 1, 1,
-0.5524846, -0.8928847, -1.549466, 0, 0, 0, 1, 1,
-0.5508602, 0.6856331, 0.315241, 1, 1, 1, 1, 1,
-0.5502056, -1.36362, -4.08998, 1, 1, 1, 1, 1,
-0.5446705, -0.07172433, -0.7913187, 1, 1, 1, 1, 1,
-0.540386, 1.359228, -0.05064223, 1, 1, 1, 1, 1,
-0.5377889, 1.420732, 0.4499491, 1, 1, 1, 1, 1,
-0.5377026, -0.02638986, -1.710272, 1, 1, 1, 1, 1,
-0.5373718, -0.1647165, -0.4654149, 1, 1, 1, 1, 1,
-0.5245666, 0.6367268, -1.227128, 1, 1, 1, 1, 1,
-0.5212913, -2.029391, -3.21509, 1, 1, 1, 1, 1,
-0.520429, 0.5131489, -1.798752, 1, 1, 1, 1, 1,
-0.518591, -0.6184182, -1.475236, 1, 1, 1, 1, 1,
-0.5160287, 0.03374526, -1.818844, 1, 1, 1, 1, 1,
-0.5153173, -1.256106, -3.661806, 1, 1, 1, 1, 1,
-0.5148391, -1.237027, -1.60555, 1, 1, 1, 1, 1,
-0.5133264, -0.9594471, -2.068737, 1, 1, 1, 1, 1,
-0.5107313, 0.3095008, -0.7668757, 0, 0, 1, 1, 1,
-0.5095332, 0.2256033, -1.928018, 1, 0, 0, 1, 1,
-0.5085285, 2.286155, -1.716374, 1, 0, 0, 1, 1,
-0.4992709, 0.04281069, -1.287679, 1, 0, 0, 1, 1,
-0.4977564, 0.4798884, -1.263143, 1, 0, 0, 1, 1,
-0.4961805, 0.7564463, -1.38565, 1, 0, 0, 1, 1,
-0.4942856, -1.377322, -1.773406, 0, 0, 0, 1, 1,
-0.4926715, -0.7254534, -2.735842, 0, 0, 0, 1, 1,
-0.488539, 0.07946439, -2.443676, 0, 0, 0, 1, 1,
-0.4873109, -0.1649111, -1.838167, 0, 0, 0, 1, 1,
-0.4864986, -1.569345, -2.358244, 0, 0, 0, 1, 1,
-0.4855795, 1.116818, -1.185392, 0, 0, 0, 1, 1,
-0.4791818, -1.137559, -4.746326, 0, 0, 0, 1, 1,
-0.4784577, 1.14952, -0.845365, 1, 1, 1, 1, 1,
-0.4734685, 1.070946, -1.292553, 1, 1, 1, 1, 1,
-0.4658774, 0.281409, -2.920059, 1, 1, 1, 1, 1,
-0.4641429, -1.032711, -2.672498, 1, 1, 1, 1, 1,
-0.4625726, -0.8463871, -2.099534, 1, 1, 1, 1, 1,
-0.4624989, 1.508951, 0.655399, 1, 1, 1, 1, 1,
-0.4579181, 0.08962641, -0.1717205, 1, 1, 1, 1, 1,
-0.4503362, 0.5586882, -1.110552, 1, 1, 1, 1, 1,
-0.4501776, 0.02764114, -2.425822, 1, 1, 1, 1, 1,
-0.4497043, -1.974146, -3.444953, 1, 1, 1, 1, 1,
-0.445702, -1.582214, -2.548426, 1, 1, 1, 1, 1,
-0.4455853, 1.063891, 0.09200555, 1, 1, 1, 1, 1,
-0.4455113, -0.09345761, -0.9988984, 1, 1, 1, 1, 1,
-0.4387206, -0.3090582, -0.9343719, 1, 1, 1, 1, 1,
-0.4352783, -2.461363, -1.953239, 1, 1, 1, 1, 1,
-0.4318735, -1.460405, -1.909689, 0, 0, 1, 1, 1,
-0.4307344, 0.7988605, -0.2098024, 1, 0, 0, 1, 1,
-0.4302448, -1.789962, -2.320607, 1, 0, 0, 1, 1,
-0.4299453, 0.3537161, -1.143794, 1, 0, 0, 1, 1,
-0.4265558, 0.6941159, -0.004725565, 1, 0, 0, 1, 1,
-0.4255656, 0.5407175, -1.843297, 1, 0, 0, 1, 1,
-0.4246264, 0.576617, -0.7642209, 0, 0, 0, 1, 1,
-0.4237523, -0.7918168, -2.50775, 0, 0, 0, 1, 1,
-0.4227575, 1.770532, -0.3780209, 0, 0, 0, 1, 1,
-0.4217574, 0.08685006, -1.345663, 0, 0, 0, 1, 1,
-0.4209486, -0.2808714, -2.327009, 0, 0, 0, 1, 1,
-0.4178844, -1.043277, -2.775194, 0, 0, 0, 1, 1,
-0.4121057, -0.890233, -2.943481, 0, 0, 0, 1, 1,
-0.40804, 0.5163281, -1.526041, 1, 1, 1, 1, 1,
-0.4065025, -0.124897, -1.817802, 1, 1, 1, 1, 1,
-0.4022553, 0.7691454, 0.5338509, 1, 1, 1, 1, 1,
-0.4018471, -0.06781999, -1.084615, 1, 1, 1, 1, 1,
-0.3961329, 0.7795931, -0.7315753, 1, 1, 1, 1, 1,
-0.3919377, -0.1772599, -2.044136, 1, 1, 1, 1, 1,
-0.3917709, 1.856379, -1.593921, 1, 1, 1, 1, 1,
-0.3897994, -0.8646577, -2.961171, 1, 1, 1, 1, 1,
-0.3877068, 1.113435, 1.124465, 1, 1, 1, 1, 1,
-0.3847364, 0.6200203, -0.1430855, 1, 1, 1, 1, 1,
-0.3824806, 0.1465059, -1.046024, 1, 1, 1, 1, 1,
-0.3793118, -0.0001529352, -1.915986, 1, 1, 1, 1, 1,
-0.3775247, 0.2598799, -1.837261, 1, 1, 1, 1, 1,
-0.3740082, -0.4586011, -2.971341, 1, 1, 1, 1, 1,
-0.3687955, -0.3242467, -0.8626368, 1, 1, 1, 1, 1,
-0.3673489, -0.7688349, -1.7487, 0, 0, 1, 1, 1,
-0.3622968, 0.6316063, 0.3736855, 1, 0, 0, 1, 1,
-0.3597825, -0.8105521, -1.115405, 1, 0, 0, 1, 1,
-0.3590972, 0.3393185, -2.125372, 1, 0, 0, 1, 1,
-0.3578109, 0.4385534, -1.015941, 1, 0, 0, 1, 1,
-0.3551177, -0.919403, -1.373639, 1, 0, 0, 1, 1,
-0.3543564, -0.2826989, -2.466458, 0, 0, 0, 1, 1,
-0.3521815, -1.291617, -3.074368, 0, 0, 0, 1, 1,
-0.3460686, 0.5140209, -0.8349041, 0, 0, 0, 1, 1,
-0.3458871, -0.005875396, -2.059413, 0, 0, 0, 1, 1,
-0.3400257, 1.598045, -1.016815, 0, 0, 0, 1, 1,
-0.3390839, -1.90812, -2.94284, 0, 0, 0, 1, 1,
-0.3380089, 1.307349, -1.293509, 0, 0, 0, 1, 1,
-0.3376385, 0.04384518, -2.767845, 1, 1, 1, 1, 1,
-0.3325419, 1.099675, 0.2999249, 1, 1, 1, 1, 1,
-0.3284463, -0.7616367, -2.309964, 1, 1, 1, 1, 1,
-0.3277015, 0.1853893, -0.962332, 1, 1, 1, 1, 1,
-0.3268836, -0.8280389, -2.512393, 1, 1, 1, 1, 1,
-0.322001, 0.5924095, -1.985665, 1, 1, 1, 1, 1,
-0.3197072, 1.851681, 1.347043, 1, 1, 1, 1, 1,
-0.3143088, 0.9477944, -0.7138195, 1, 1, 1, 1, 1,
-0.310753, 0.5551616, -0.4202469, 1, 1, 1, 1, 1,
-0.31056, 1.393169, 1.149461, 1, 1, 1, 1, 1,
-0.3105474, 0.1289575, -0.8606176, 1, 1, 1, 1, 1,
-0.3097519, -0.5414673, -3.166425, 1, 1, 1, 1, 1,
-0.3033225, -0.1098875, -0.7134774, 1, 1, 1, 1, 1,
-0.3031782, 0.1742247, -2.600698, 1, 1, 1, 1, 1,
-0.303034, -0.1501212, -2.204419, 1, 1, 1, 1, 1,
-0.2992543, 0.06498919, -1.998692, 0, 0, 1, 1, 1,
-0.2988504, -0.7267795, -2.390586, 1, 0, 0, 1, 1,
-0.2987074, -1.441211, -2.091004, 1, 0, 0, 1, 1,
-0.2973552, -1.966091, -4.079435, 1, 0, 0, 1, 1,
-0.2965379, 0.3281198, -0.6027849, 1, 0, 0, 1, 1,
-0.2922086, 0.5136343, -1.766895, 1, 0, 0, 1, 1,
-0.2877217, -0.2651312, -3.80775, 0, 0, 0, 1, 1,
-0.285862, 1.66305, -0.02554398, 0, 0, 0, 1, 1,
-0.2823257, -1.505024, -2.415676, 0, 0, 0, 1, 1,
-0.2818342, 0.09236719, -0.42782, 0, 0, 0, 1, 1,
-0.280306, 0.7605049, 0.009183967, 0, 0, 0, 1, 1,
-0.2735049, 0.9846517, 0.577956, 0, 0, 0, 1, 1,
-0.2609218, -0.3814702, -2.879082, 0, 0, 0, 1, 1,
-0.2608822, -0.1529739, -3.4879, 1, 1, 1, 1, 1,
-0.2568023, 1.205159, 0.3244464, 1, 1, 1, 1, 1,
-0.2562191, 1.040477, -1.22001, 1, 1, 1, 1, 1,
-0.2487499, 0.7406961, -0.1195716, 1, 1, 1, 1, 1,
-0.2460301, 0.7383293, -0.9233033, 1, 1, 1, 1, 1,
-0.2432273, 0.7962337, -0.8572502, 1, 1, 1, 1, 1,
-0.2429454, 0.5829001, -0.8533463, 1, 1, 1, 1, 1,
-0.2423529, -0.2056636, -4.129348, 1, 1, 1, 1, 1,
-0.2395979, 0.3001148, -0.8767101, 1, 1, 1, 1, 1,
-0.2352729, 0.04860912, -0.4124025, 1, 1, 1, 1, 1,
-0.2283676, -1.241131, -2.676777, 1, 1, 1, 1, 1,
-0.2263833, -2.106093, -1.062524, 1, 1, 1, 1, 1,
-0.2229262, -0.9148243, -2.386892, 1, 1, 1, 1, 1,
-0.222821, 0.08439027, -3.298916, 1, 1, 1, 1, 1,
-0.220626, 0.5300816, -2.387979, 1, 1, 1, 1, 1,
-0.2098732, -1.027797, -3.092023, 0, 0, 1, 1, 1,
-0.2052783, 0.06954998, -2.551753, 1, 0, 0, 1, 1,
-0.2004531, 0.6924698, -1.678275, 1, 0, 0, 1, 1,
-0.1919204, -0.3031594, -1.468763, 1, 0, 0, 1, 1,
-0.1912173, 1.208591, 0.5958091, 1, 0, 0, 1, 1,
-0.1883238, -0.9167386, -2.678331, 1, 0, 0, 1, 1,
-0.1843, 1.578601, -0.645878, 0, 0, 0, 1, 1,
-0.1812331, -0.4186672, -2.752517, 0, 0, 0, 1, 1,
-0.1803621, -0.8188428, -2.902005, 0, 0, 0, 1, 1,
-0.1797671, -0.07879608, -1.461906, 0, 0, 0, 1, 1,
-0.1786198, 1.786284, -1.254997, 0, 0, 0, 1, 1,
-0.1779967, -0.2059461, -1.628672, 0, 0, 0, 1, 1,
-0.1753154, -0.8840952, -4.145269, 0, 0, 0, 1, 1,
-0.1750833, 1.159674, 1.243368, 1, 1, 1, 1, 1,
-0.174984, 1.206123, 0.7255745, 1, 1, 1, 1, 1,
-0.1704385, -0.677555, -2.756057, 1, 1, 1, 1, 1,
-0.1704065, 2.033457, 1.604136, 1, 1, 1, 1, 1,
-0.1700568, -1.188971, -2.015805, 1, 1, 1, 1, 1,
-0.1632662, -0.799181, -3.106487, 1, 1, 1, 1, 1,
-0.1629972, -1.571554, -3.288996, 1, 1, 1, 1, 1,
-0.1605409, 0.1766178, -0.2197101, 1, 1, 1, 1, 1,
-0.158173, -2.81078, -5.6021, 1, 1, 1, 1, 1,
-0.1549609, 1.851111, -1.518395, 1, 1, 1, 1, 1,
-0.1504217, 0.9567063, 0.03424601, 1, 1, 1, 1, 1,
-0.1454696, -0.8842838, -2.413327, 1, 1, 1, 1, 1,
-0.1445762, -1.563226, -4.487821, 1, 1, 1, 1, 1,
-0.1437894, 0.03687187, -1.919881, 1, 1, 1, 1, 1,
-0.1408461, -0.09484431, -2.344756, 1, 1, 1, 1, 1,
-0.1396418, -1.656948, -2.872204, 0, 0, 1, 1, 1,
-0.1386699, 2.026739, -1.641388, 1, 0, 0, 1, 1,
-0.1379543, 0.07598527, 0.384114, 1, 0, 0, 1, 1,
-0.1329141, -2.370453, -3.949749, 1, 0, 0, 1, 1,
-0.126946, 0.4671119, -0.8486636, 1, 0, 0, 1, 1,
-0.1259328, -0.9100958, -3.130743, 1, 0, 0, 1, 1,
-0.1211913, -0.3716502, -2.878042, 0, 0, 0, 1, 1,
-0.1177693, 1.751066, -0.3413348, 0, 0, 0, 1, 1,
-0.1161293, -1.594141, -0.8532949, 0, 0, 0, 1, 1,
-0.1160887, 0.7557288, 0.8160276, 0, 0, 0, 1, 1,
-0.116003, 0.3761986, 1.545176, 0, 0, 0, 1, 1,
-0.115584, -0.4796992, -1.527699, 0, 0, 0, 1, 1,
-0.1140686, 0.1472148, -0.2881193, 0, 0, 0, 1, 1,
-0.1127348, 0.5809416, -0.1712358, 1, 1, 1, 1, 1,
-0.1124867, 0.5884894, -0.9822644, 1, 1, 1, 1, 1,
-0.1118571, -0.7637355, -2.559724, 1, 1, 1, 1, 1,
-0.1109227, -1.789058, -2.685043, 1, 1, 1, 1, 1,
-0.1086013, 0.4581453, -1.889977, 1, 1, 1, 1, 1,
-0.1078546, -0.6302468, -2.498476, 1, 1, 1, 1, 1,
-0.1059061, -0.5031003, -4.125867, 1, 1, 1, 1, 1,
-0.1058119, -0.2558336, -2.341573, 1, 1, 1, 1, 1,
-0.103958, 0.8326011, -1.170035, 1, 1, 1, 1, 1,
-0.1025357, 0.1498773, 0.1618784, 1, 1, 1, 1, 1,
-0.09459537, -0.1268481, -1.566056, 1, 1, 1, 1, 1,
-0.08684858, 0.07153541, -1.224484, 1, 1, 1, 1, 1,
-0.08298638, 1.007929, -0.3389123, 1, 1, 1, 1, 1,
-0.07038099, 0.4696531, 0.5253147, 1, 1, 1, 1, 1,
-0.06619453, 1.30763, 0.3994515, 1, 1, 1, 1, 1,
-0.06530295, 1.529732, -1.403527, 0, 0, 1, 1, 1,
-0.06515853, -0.2970772, -3.090397, 1, 0, 0, 1, 1,
-0.06270394, 0.3463881, -0.4008723, 1, 0, 0, 1, 1,
-0.05976434, 0.6705814, 0.5183851, 1, 0, 0, 1, 1,
-0.05891515, 0.5829182, -1.347311, 1, 0, 0, 1, 1,
-0.05379971, -1.923599, -2.254262, 1, 0, 0, 1, 1,
-0.05011724, -0.4134331, -3.249574, 0, 0, 0, 1, 1,
-0.04889474, 0.1984363, -0.3646332, 0, 0, 0, 1, 1,
-0.04096136, 0.9267698, 2.064967, 0, 0, 0, 1, 1,
-0.03684686, 1.318074, 0.7597564, 0, 0, 0, 1, 1,
-0.03602958, -1.214247, -3.950577, 0, 0, 0, 1, 1,
-0.03502062, -1.415875, -4.201815, 0, 0, 0, 1, 1,
-0.03104471, 0.2968112, -0.03773726, 0, 0, 0, 1, 1,
-0.02934322, -0.01149842, -1.810539, 1, 1, 1, 1, 1,
-0.02598753, 0.1438111, 0.5523387, 1, 1, 1, 1, 1,
-0.02273312, -0.2932258, -5.345008, 1, 1, 1, 1, 1,
-0.02182931, -0.5551863, -3.776046, 1, 1, 1, 1, 1,
-0.01958225, 0.2806407, -0.1259167, 1, 1, 1, 1, 1,
-0.01933745, 1.507033, -0.2148701, 1, 1, 1, 1, 1,
-0.01522552, 0.473851, 0.6318609, 1, 1, 1, 1, 1,
-0.01434476, -0.5010889, -4.504504, 1, 1, 1, 1, 1,
-0.01291875, 0.1548882, -1.104908, 1, 1, 1, 1, 1,
-0.01041539, 0.02526102, -1.03592, 1, 1, 1, 1, 1,
-0.01029213, -0.6481825, -4.353428, 1, 1, 1, 1, 1,
-0.008292608, -1.845544, -2.023181, 1, 1, 1, 1, 1,
-0.00704144, 0.3143299, -1.198087, 1, 1, 1, 1, 1,
-0.0048589, -0.3821665, -3.91006, 1, 1, 1, 1, 1,
-0.004448661, 0.3283985, 1.259865, 1, 1, 1, 1, 1,
-0.002312696, 0.9794622, -1.780034, 0, 0, 1, 1, 1,
-0.0008413121, -0.4322108, -1.16368, 1, 0, 0, 1, 1,
0.006345248, 0.1426913, 0.05591791, 1, 0, 0, 1, 1,
0.00685558, 1.943006, -0.6991397, 1, 0, 0, 1, 1,
0.007855156, 0.6079549, 0.6779817, 1, 0, 0, 1, 1,
0.01001819, 1.234697, 1.37778, 1, 0, 0, 1, 1,
0.01199745, 1.351736, 0.75198, 0, 0, 0, 1, 1,
0.02516118, -0.6171221, 3.254085, 0, 0, 0, 1, 1,
0.02859704, 1.909834, -0.3324287, 0, 0, 0, 1, 1,
0.02945128, -0.8983396, 3.144841, 0, 0, 0, 1, 1,
0.03095333, 0.08390725, 0.6429574, 0, 0, 0, 1, 1,
0.03735963, 0.0150058, 1.23724, 0, 0, 0, 1, 1,
0.03994162, 0.8586777, 0.3482134, 0, 0, 0, 1, 1,
0.04436571, 0.7833556, -1.567594, 1, 1, 1, 1, 1,
0.04671159, -1.37358, 5.009517, 1, 1, 1, 1, 1,
0.04927015, -2.259753, 2.927235, 1, 1, 1, 1, 1,
0.04968483, -0.03415132, 2.436958, 1, 1, 1, 1, 1,
0.05181626, -0.6808884, 2.435545, 1, 1, 1, 1, 1,
0.05182747, 0.01254294, 0.5343131, 1, 1, 1, 1, 1,
0.05543483, 0.298781, 1.49156, 1, 1, 1, 1, 1,
0.05623426, 1.244946, 1.061915, 1, 1, 1, 1, 1,
0.06555452, 0.1866035, 0.4025077, 1, 1, 1, 1, 1,
0.07147546, -0.1799629, 3.085016, 1, 1, 1, 1, 1,
0.07219129, -0.9347388, 2.940436, 1, 1, 1, 1, 1,
0.0725012, 0.5484588, 0.8388823, 1, 1, 1, 1, 1,
0.07607109, -1.925917, 1.573521, 1, 1, 1, 1, 1,
0.07630222, -0.06824293, 1.166713, 1, 1, 1, 1, 1,
0.07665747, 0.357905, 1.531791, 1, 1, 1, 1, 1,
0.07696855, -0.3176574, 3.265126, 0, 0, 1, 1, 1,
0.07715771, 1.284994, 1.611452, 1, 0, 0, 1, 1,
0.07819613, -0.4057639, 2.028782, 1, 0, 0, 1, 1,
0.0782361, 1.207344, -1.040516, 1, 0, 0, 1, 1,
0.07859231, -0.7178184, 1.631208, 1, 0, 0, 1, 1,
0.07892228, -0.519237, 2.601279, 1, 0, 0, 1, 1,
0.08650429, -1.575388, 4.515105, 0, 0, 0, 1, 1,
0.09454442, 0.5420716, 0.8669979, 0, 0, 0, 1, 1,
0.09821261, 0.8075232, -0.4913391, 0, 0, 0, 1, 1,
0.1014275, -0.4490606, 2.261194, 0, 0, 0, 1, 1,
0.1029054, 0.5516086, 0.7359999, 0, 0, 0, 1, 1,
0.1079624, 0.4682226, -0.837869, 0, 0, 0, 1, 1,
0.111755, -0.2056211, 3.163025, 0, 0, 0, 1, 1,
0.1139879, -1.869288, 3.376366, 1, 1, 1, 1, 1,
0.1142924, -0.8733186, 2.873455, 1, 1, 1, 1, 1,
0.1184356, 0.387681, 0.2566408, 1, 1, 1, 1, 1,
0.1194188, -0.305306, 2.91331, 1, 1, 1, 1, 1,
0.1209357, -2.203066, 3.050228, 1, 1, 1, 1, 1,
0.1317344, 1.368606, -0.9242892, 1, 1, 1, 1, 1,
0.1366291, -0.9435302, 4.789336, 1, 1, 1, 1, 1,
0.1412092, -0.3020565, 3.450301, 1, 1, 1, 1, 1,
0.1449721, 0.3117905, 1.282343, 1, 1, 1, 1, 1,
0.1459613, -0.2634254, 1.767965, 1, 1, 1, 1, 1,
0.1460003, 0.1869438, 0.1786853, 1, 1, 1, 1, 1,
0.1516337, 0.2324971, -0.06278325, 1, 1, 1, 1, 1,
0.1573787, 0.935518, 1.143797, 1, 1, 1, 1, 1,
0.1574732, -0.9395404, 3.866502, 1, 1, 1, 1, 1,
0.1609373, 0.2614454, -1.565911, 1, 1, 1, 1, 1,
0.1612107, -1.86243, 2.00251, 0, 0, 1, 1, 1,
0.1614749, 0.7803921, 1.376723, 1, 0, 0, 1, 1,
0.1645038, 1.183798, 1.362262, 1, 0, 0, 1, 1,
0.1658864, 0.2712629, 1.364268, 1, 0, 0, 1, 1,
0.1693311, -0.208668, 1.352534, 1, 0, 0, 1, 1,
0.1756752, 2.035514, 1.152716, 1, 0, 0, 1, 1,
0.1758432, -0.798024, 4.186762, 0, 0, 0, 1, 1,
0.1844487, -1.411055, 3.903713, 0, 0, 0, 1, 1,
0.185985, 0.05372011, 1.40682, 0, 0, 0, 1, 1,
0.1882173, 1.740093, 0.08656354, 0, 0, 0, 1, 1,
0.1918828, -0.3699312, 2.024182, 0, 0, 0, 1, 1,
0.1986029, -1.144285, 2.077303, 0, 0, 0, 1, 1,
0.2000763, 1.523093, -0.4221949, 0, 0, 0, 1, 1,
0.2042497, 1.392091, -0.4275688, 1, 1, 1, 1, 1,
0.2049371, 0.03106783, 3.559987, 1, 1, 1, 1, 1,
0.2101154, -0.1696371, 2.281216, 1, 1, 1, 1, 1,
0.2117369, 0.168798, 0.2789797, 1, 1, 1, 1, 1,
0.2127108, 0.576488, 0.04209978, 1, 1, 1, 1, 1,
0.2143338, 0.5788726, 1.541602, 1, 1, 1, 1, 1,
0.2151929, 0.9888828, -0.9018362, 1, 1, 1, 1, 1,
0.2160342, 0.3723084, 2.233844, 1, 1, 1, 1, 1,
0.2177411, 0.4057847, 0.8546355, 1, 1, 1, 1, 1,
0.2180549, 0.3123315, 0.2476731, 1, 1, 1, 1, 1,
0.2247362, 1.486261, -0.1353667, 1, 1, 1, 1, 1,
0.2260099, 1.698011, 1.492652, 1, 1, 1, 1, 1,
0.2300656, 0.823767, 0.08583675, 1, 1, 1, 1, 1,
0.2312067, -1.064784, 2.746884, 1, 1, 1, 1, 1,
0.2338204, -0.5575376, 2.177288, 1, 1, 1, 1, 1,
0.2341748, 0.7341442, 0.1171009, 0, 0, 1, 1, 1,
0.2379733, 0.6811096, 0.4536798, 1, 0, 0, 1, 1,
0.2382157, -0.7482123, 1.372793, 1, 0, 0, 1, 1,
0.2410695, -0.8305398, 2.163154, 1, 0, 0, 1, 1,
0.2454521, 0.001012088, 1.371136, 1, 0, 0, 1, 1,
0.2459968, -1.798129, 2.302804, 1, 0, 0, 1, 1,
0.2465538, -0.4705405, 3.370573, 0, 0, 0, 1, 1,
0.2480982, 0.3768359, 0.8864419, 0, 0, 0, 1, 1,
0.248611, 0.3477765, 0.4096742, 0, 0, 0, 1, 1,
0.2496679, 0.6055135, 0.8153068, 0, 0, 0, 1, 1,
0.2512202, -1.594561, 1.322133, 0, 0, 0, 1, 1,
0.253244, -0.4556833, 1.946597, 0, 0, 0, 1, 1,
0.2565738, 0.008929844, 0.4862737, 0, 0, 0, 1, 1,
0.2587865, 1.048293, 0.9299425, 1, 1, 1, 1, 1,
0.2636592, 1.419308, -0.6390545, 1, 1, 1, 1, 1,
0.2693645, -0.3592159, 4.802334, 1, 1, 1, 1, 1,
0.2695575, 0.330022, 1.16584, 1, 1, 1, 1, 1,
0.2706906, 0.4095342, 1.456047, 1, 1, 1, 1, 1,
0.2722221, 0.1880005, 2.287546, 1, 1, 1, 1, 1,
0.2768547, 0.3142589, 0.3818226, 1, 1, 1, 1, 1,
0.2784538, -0.1590689, 2.976911, 1, 1, 1, 1, 1,
0.2785893, 0.07033049, 0.8948937, 1, 1, 1, 1, 1,
0.2833034, 0.5071061, 0.7861025, 1, 1, 1, 1, 1,
0.2876575, -0.6449919, 0.5443494, 1, 1, 1, 1, 1,
0.2896086, 1.972952, -0.6557745, 1, 1, 1, 1, 1,
0.2906483, -0.8010112, 0.7195967, 1, 1, 1, 1, 1,
0.2913707, 2.425931, -1.402698, 1, 1, 1, 1, 1,
0.3027034, -1.026162, 2.684525, 1, 1, 1, 1, 1,
0.3043376, -0.2760462, 3.551853, 0, 0, 1, 1, 1,
0.3049668, -0.5349279, 0.6987427, 1, 0, 0, 1, 1,
0.3050208, -0.290877, 3.156248, 1, 0, 0, 1, 1,
0.3069859, -0.03710993, 0.7229208, 1, 0, 0, 1, 1,
0.3071556, -1.681884, 2.920372, 1, 0, 0, 1, 1,
0.3104027, -2.830638, 1.577632, 1, 0, 0, 1, 1,
0.310645, -0.7892456, 2.151367, 0, 0, 0, 1, 1,
0.3125375, -1.451035, 1.338881, 0, 0, 0, 1, 1,
0.3132661, 0.3795069, 0.6545569, 0, 0, 0, 1, 1,
0.3186453, 0.2300233, 1.492239, 0, 0, 0, 1, 1,
0.3203695, 0.09890634, -0.5119829, 0, 0, 0, 1, 1,
0.3207267, -1.500019, 3.111636, 0, 0, 0, 1, 1,
0.3240744, 1.583448, 2.833249, 0, 0, 0, 1, 1,
0.3253007, 0.8676696, -0.8904414, 1, 1, 1, 1, 1,
0.3336621, -0.4503241, 3.985316, 1, 1, 1, 1, 1,
0.3369935, -1.722324, 2.984969, 1, 1, 1, 1, 1,
0.3403064, -0.5463157, 2.156168, 1, 1, 1, 1, 1,
0.3422814, 0.2443926, 1.199673, 1, 1, 1, 1, 1,
0.346627, -0.8911325, 2.744414, 1, 1, 1, 1, 1,
0.3518355, -1.170773, 2.191773, 1, 1, 1, 1, 1,
0.353536, 0.06849647, 1.466585, 1, 1, 1, 1, 1,
0.3581071, 0.08555067, 2.183699, 1, 1, 1, 1, 1,
0.360671, -0.2650798, 2.467608, 1, 1, 1, 1, 1,
0.3607638, 1.448803, -0.2244149, 1, 1, 1, 1, 1,
0.362241, 0.1314385, 1.010365, 1, 1, 1, 1, 1,
0.3630726, 1.224088, -0.7825016, 1, 1, 1, 1, 1,
0.3696208, -0.5878025, 4.123778, 1, 1, 1, 1, 1,
0.3710661, 0.7167732, 0.9574693, 1, 1, 1, 1, 1,
0.371179, -0.3410732, 1.950462, 0, 0, 1, 1, 1,
0.3736975, -0.4851639, 3.017423, 1, 0, 0, 1, 1,
0.3740905, -0.1702973, 1.316183, 1, 0, 0, 1, 1,
0.3764259, 0.7528294, -1.407843, 1, 0, 0, 1, 1,
0.3784601, -0.1892913, 1.415696, 1, 0, 0, 1, 1,
0.379669, 0.1313631, 0.5612085, 1, 0, 0, 1, 1,
0.3844286, -0.500805, 2.057186, 0, 0, 0, 1, 1,
0.3861491, -0.3426162, 1.822659, 0, 0, 0, 1, 1,
0.3884043, -1.997794, 2.476661, 0, 0, 0, 1, 1,
0.393991, 0.288795, 1.908332, 0, 0, 0, 1, 1,
0.3959993, 0.9737774, -0.5474365, 0, 0, 0, 1, 1,
0.3973165, 0.9199286, -0.1960324, 0, 0, 0, 1, 1,
0.3975476, -1.050335, 1.980304, 0, 0, 0, 1, 1,
0.4043946, 1.436739, 1.308888, 1, 1, 1, 1, 1,
0.4060351, 0.6815822, 0.7585914, 1, 1, 1, 1, 1,
0.4086715, 0.2475557, 0.05652453, 1, 1, 1, 1, 1,
0.4087827, 0.08480644, 2.612109, 1, 1, 1, 1, 1,
0.4089377, -0.5719875, 2.11956, 1, 1, 1, 1, 1,
0.414867, 0.1427159, 2.317984, 1, 1, 1, 1, 1,
0.4167161, -0.8890423, 3.693575, 1, 1, 1, 1, 1,
0.4188101, -0.2773369, 2.075605, 1, 1, 1, 1, 1,
0.419156, -1.099116, 2.453138, 1, 1, 1, 1, 1,
0.4207912, 0.05069847, 0.3196984, 1, 1, 1, 1, 1,
0.4208947, -0.4876515, 2.165922, 1, 1, 1, 1, 1,
0.4223922, 0.2676897, -0.5617861, 1, 1, 1, 1, 1,
0.4236146, 0.1409658, 1.471244, 1, 1, 1, 1, 1,
0.4239518, 1.422704, 0.3161237, 1, 1, 1, 1, 1,
0.4257542, -0.03620869, 2.482466, 1, 1, 1, 1, 1,
0.4261869, -1.385746, 4.078176, 0, 0, 1, 1, 1,
0.4278924, 0.5478553, 0.1623605, 1, 0, 0, 1, 1,
0.4288231, -0.3773853, 3.151277, 1, 0, 0, 1, 1,
0.4375632, -1.322603, 4.220284, 1, 0, 0, 1, 1,
0.4392363, 2.642569, 1.598378, 1, 0, 0, 1, 1,
0.4404976, 0.9719697, -0.02618052, 1, 0, 0, 1, 1,
0.4421718, 0.0450913, 0.128206, 0, 0, 0, 1, 1,
0.444676, -0.8954052, 3.532904, 0, 0, 0, 1, 1,
0.4496113, -0.8953811, 3.67362, 0, 0, 0, 1, 1,
0.4564179, 0.7939255, 0.8315597, 0, 0, 0, 1, 1,
0.4591173, 0.6859964, -2.071133, 0, 0, 0, 1, 1,
0.4646584, 1.390856, 0.9226482, 0, 0, 0, 1, 1,
0.4653793, 0.01677391, 0.866834, 0, 0, 0, 1, 1,
0.4658637, -1.394432, 3.78486, 1, 1, 1, 1, 1,
0.4701777, 0.6638186, -0.7781247, 1, 1, 1, 1, 1,
0.4702378, -1.966596, 2.875579, 1, 1, 1, 1, 1,
0.4720268, 0.9504563, 1.995622, 1, 1, 1, 1, 1,
0.4755033, -0.5703381, 2.792707, 1, 1, 1, 1, 1,
0.477965, 1.664882, 0.9679925, 1, 1, 1, 1, 1,
0.4853848, 1.040781, 0.1610135, 1, 1, 1, 1, 1,
0.4868543, -0.4331394, 1.98035, 1, 1, 1, 1, 1,
0.4936273, 0.4489083, 0.2595037, 1, 1, 1, 1, 1,
0.4956375, -1.365409, 3.422092, 1, 1, 1, 1, 1,
0.4986819, -1.236696, 2.844581, 1, 1, 1, 1, 1,
0.5016781, -0.8246347, 3.78437, 1, 1, 1, 1, 1,
0.5047489, -0.4300838, 2.522627, 1, 1, 1, 1, 1,
0.5071364, 1.047974, -0.01872775, 1, 1, 1, 1, 1,
0.5073531, 1.513175, 0.3941742, 1, 1, 1, 1, 1,
0.5190003, 0.6516016, 0.6734192, 0, 0, 1, 1, 1,
0.5206379, -1.740369, 2.899345, 1, 0, 0, 1, 1,
0.5216529, 0.5850654, 0.8959035, 1, 0, 0, 1, 1,
0.5244635, 0.5096158, 2.727819, 1, 0, 0, 1, 1,
0.5244724, 0.15679, 0.4320721, 1, 0, 0, 1, 1,
0.5255919, 0.2869213, 0.8893048, 1, 0, 0, 1, 1,
0.527528, 0.8561049, -2.366777, 0, 0, 0, 1, 1,
0.5295846, -0.005001233, 0.5068155, 0, 0, 0, 1, 1,
0.5325564, 2.18018, 2.531879, 0, 0, 0, 1, 1,
0.542514, 0.2160716, 1.022733, 0, 0, 0, 1, 1,
0.5435298, 0.5978224, 1.096642, 0, 0, 0, 1, 1,
0.5443876, 0.7886353, 1.607914, 0, 0, 0, 1, 1,
0.5462762, -0.05141129, 2.730033, 0, 0, 0, 1, 1,
0.5571583, -0.324671, 1.168162, 1, 1, 1, 1, 1,
0.558533, -1.214668, 1.935346, 1, 1, 1, 1, 1,
0.56321, -0.8762074, 1.965006, 1, 1, 1, 1, 1,
0.5709133, -0.677561, 1.623212, 1, 1, 1, 1, 1,
0.5712336, 1.389095, -1.807863, 1, 1, 1, 1, 1,
0.5732065, 1.454136, 0.7378888, 1, 1, 1, 1, 1,
0.5748038, -1.816599, 1.487702, 1, 1, 1, 1, 1,
0.5801093, -2.823334, 3.684614, 1, 1, 1, 1, 1,
0.5865495, -1.854483, 1.517087, 1, 1, 1, 1, 1,
0.5872922, -0.8858624, 2.571903, 1, 1, 1, 1, 1,
0.5883079, 1.495475, 1.44354, 1, 1, 1, 1, 1,
0.588724, 0.8079812, 1.149378, 1, 1, 1, 1, 1,
0.5915644, 0.5224084, 0.7163876, 1, 1, 1, 1, 1,
0.6025248, -1.141727, 3.968035, 1, 1, 1, 1, 1,
0.6050116, 0.2864617, 1.410969, 1, 1, 1, 1, 1,
0.6143989, -0.3296776, 1.870427, 0, 0, 1, 1, 1,
0.623129, -0.4844656, 3.481126, 1, 0, 0, 1, 1,
0.6286325, -1.62889, 2.290586, 1, 0, 0, 1, 1,
0.630682, 0.3822061, 0.954092, 1, 0, 0, 1, 1,
0.6337134, -0.9304239, 2.425487, 1, 0, 0, 1, 1,
0.6531129, 0.126804, 1.271503, 1, 0, 0, 1, 1,
0.6553453, 0.8126134, -0.3578341, 0, 0, 0, 1, 1,
0.6566262, 0.9031651, 0.1096222, 0, 0, 0, 1, 1,
0.6579458, -0.4190204, 0.9106213, 0, 0, 0, 1, 1,
0.6652339, -0.5579365, 1.805689, 0, 0, 0, 1, 1,
0.6749523, 0.0752569, 2.24148, 0, 0, 0, 1, 1,
0.6776671, 0.8418704, 0.4784819, 0, 0, 0, 1, 1,
0.6780302, 0.02420224, 1.868174, 0, 0, 0, 1, 1,
0.6812868, 0.2373077, 0.7576922, 1, 1, 1, 1, 1,
0.6832863, 0.1198256, 0.6440571, 1, 1, 1, 1, 1,
0.6841509, -0.1050882, 2.776946, 1, 1, 1, 1, 1,
0.6866554, 0.4380952, 1.64439, 1, 1, 1, 1, 1,
0.6963407, -0.3153519, 1.918197, 1, 1, 1, 1, 1,
0.7007169, 1.348103, 0.3135905, 1, 1, 1, 1, 1,
0.7021382, 0.9494756, 2.677745, 1, 1, 1, 1, 1,
0.703232, -0.1912609, 1.139243, 1, 1, 1, 1, 1,
0.7067125, 0.6997378, 0.6431115, 1, 1, 1, 1, 1,
0.7080517, -1.549434, 0.5250058, 1, 1, 1, 1, 1,
0.7120767, 1.172906, 1.113905, 1, 1, 1, 1, 1,
0.722119, 0.2884156, 1.023229, 1, 1, 1, 1, 1,
0.7282864, -0.8080884, 2.215132, 1, 1, 1, 1, 1,
0.7299549, -1.398828, 1.665041, 1, 1, 1, 1, 1,
0.7363663, 0.3250776, 0.4285484, 1, 1, 1, 1, 1,
0.736564, 0.258655, 1.068249, 0, 0, 1, 1, 1,
0.7385437, -1.425267, 2.599193, 1, 0, 0, 1, 1,
0.7416577, 1.484799, -1.074538, 1, 0, 0, 1, 1,
0.7482584, 0.5538333, 1.639434, 1, 0, 0, 1, 1,
0.7484776, 0.8219609, 1.095843, 1, 0, 0, 1, 1,
0.7494189, 0.4516889, 1.449776, 1, 0, 0, 1, 1,
0.7531499, -0.4571167, 1.416871, 0, 0, 0, 1, 1,
0.7589834, 0.7191383, -1.284684, 0, 0, 0, 1, 1,
0.764647, 0.2474469, 0.5704145, 0, 0, 0, 1, 1,
0.7650287, -0.1993346, 1.269112, 0, 0, 0, 1, 1,
0.7661029, 1.216207, 0.08532691, 0, 0, 0, 1, 1,
0.7685418, -1.248252, 2.875702, 0, 0, 0, 1, 1,
0.7753562, -1.459957, 3.090789, 0, 0, 0, 1, 1,
0.7760035, -0.4364631, 2.407353, 1, 1, 1, 1, 1,
0.7784179, -0.2008761, 1.74464, 1, 1, 1, 1, 1,
0.7791672, -0.4005621, 3.596659, 1, 1, 1, 1, 1,
0.7840567, 0.02497865, 1.199962, 1, 1, 1, 1, 1,
0.785223, -0.6985441, 3.518347, 1, 1, 1, 1, 1,
0.7870342, 1.77948, 1.817183, 1, 1, 1, 1, 1,
0.78851, -0.1620362, 2.651781, 1, 1, 1, 1, 1,
0.791805, -0.3651302, 0.9546688, 1, 1, 1, 1, 1,
0.7918681, -0.0721114, 3.332484, 1, 1, 1, 1, 1,
0.7975991, -1.055344, 2.979094, 1, 1, 1, 1, 1,
0.8054874, -1.781547, 2.485304, 1, 1, 1, 1, 1,
0.8100899, -0.5668349, 0.2096904, 1, 1, 1, 1, 1,
0.8154405, -0.524904, 2.789787, 1, 1, 1, 1, 1,
0.8226136, -0.2254939, 3.234167, 1, 1, 1, 1, 1,
0.8226371, -0.08636705, 0.4622836, 1, 1, 1, 1, 1,
0.8286253, 0.4700796, 2.189948, 0, 0, 1, 1, 1,
0.8318736, 0.7354965, 1.090364, 1, 0, 0, 1, 1,
0.8320479, 0.9541798, 1.819487, 1, 0, 0, 1, 1,
0.8380812, -0.7656561, 2.813588, 1, 0, 0, 1, 1,
0.8395702, 0.4644411, 0.9021137, 1, 0, 0, 1, 1,
0.840995, -0.05534934, 0.9143878, 1, 0, 0, 1, 1,
0.845045, 1.191692, -0.5064449, 0, 0, 0, 1, 1,
0.8468603, -1.22248, 3.20131, 0, 0, 0, 1, 1,
0.8598345, 0.7097083, 1.218097, 0, 0, 0, 1, 1,
0.8634992, -0.3278159, 1.33982, 0, 0, 0, 1, 1,
0.865251, -0.4535409, 2.200928, 0, 0, 0, 1, 1,
0.8762986, 1.335789, -0.01434618, 0, 0, 0, 1, 1,
0.8767576, -0.4608459, 1.422279, 0, 0, 0, 1, 1,
0.8793105, 0.3447681, 0.2834071, 1, 1, 1, 1, 1,
0.8810077, 0.5201041, 1.565297, 1, 1, 1, 1, 1,
0.8828978, -1.598924, 3.601826, 1, 1, 1, 1, 1,
0.8850487, -1.349728, 3.356562, 1, 1, 1, 1, 1,
0.8900908, 0.9471477, 0.6694964, 1, 1, 1, 1, 1,
0.8938928, 1.031605, 1.781315, 1, 1, 1, 1, 1,
0.8967649, -0.5116217, 1.569358, 1, 1, 1, 1, 1,
0.898711, -1.427655, 2.163789, 1, 1, 1, 1, 1,
0.8990517, 1.091955, 0.168111, 1, 1, 1, 1, 1,
0.9046862, -0.4555722, 2.107142, 1, 1, 1, 1, 1,
0.9120243, 0.5769977, 0.1536302, 1, 1, 1, 1, 1,
0.9238052, -0.3783198, 2.551391, 1, 1, 1, 1, 1,
0.9243533, 0.3781321, 1.235194, 1, 1, 1, 1, 1,
0.9278216, 1.561841, 0.1745937, 1, 1, 1, 1, 1,
0.9351611, 0.01436134, 1.374966, 1, 1, 1, 1, 1,
0.9364827, 0.6438707, 1.55828, 0, 0, 1, 1, 1,
0.9365866, 0.16019, 1.997046, 1, 0, 0, 1, 1,
0.9424063, -1.395248, 3.150305, 1, 0, 0, 1, 1,
0.9427906, -0.9658377, 3.805389, 1, 0, 0, 1, 1,
0.9432155, -1.095597, 3.466824, 1, 0, 0, 1, 1,
0.9484462, -0.8504214, 1.861468, 1, 0, 0, 1, 1,
0.9489763, 0.3242488, 1.665753, 0, 0, 0, 1, 1,
0.9553075, -1.325531, 2.199769, 0, 0, 0, 1, 1,
0.9603597, 1.767534, 0.4178972, 0, 0, 0, 1, 1,
0.9728041, -1.538356, 1.257311, 0, 0, 0, 1, 1,
0.976036, -2.203115, 2.272107, 0, 0, 0, 1, 1,
0.9797451, -1.332102, 2.567238, 0, 0, 0, 1, 1,
0.9815023, -0.2245781, 2.319659, 0, 0, 0, 1, 1,
0.987433, 1.120096, 0.5792615, 1, 1, 1, 1, 1,
0.9877138, 0.6449743, -0.1528378, 1, 1, 1, 1, 1,
0.9891416, -1.082623, 2.091744, 1, 1, 1, 1, 1,
0.9921005, 0.3094633, 1.47672, 1, 1, 1, 1, 1,
0.9950885, 1.015922, -0.1288214, 1, 1, 1, 1, 1,
0.9957415, 1.034873, 1.586944, 1, 1, 1, 1, 1,
0.9963923, -1.480977, 3.183323, 1, 1, 1, 1, 1,
1.003716, -0.3305511, 1.576204, 1, 1, 1, 1, 1,
1.00564, -0.4041646, 1.982352, 1, 1, 1, 1, 1,
1.007806, 1.4097, -0.9249596, 1, 1, 1, 1, 1,
1.013049, 2.678067, -1.302496, 1, 1, 1, 1, 1,
1.014597, 1.902109, 0.8097461, 1, 1, 1, 1, 1,
1.017212, -0.6122315, 1.244369, 1, 1, 1, 1, 1,
1.017829, 1.435804, -1.519857, 1, 1, 1, 1, 1,
1.020218, 1.137016, 1.98719, 1, 1, 1, 1, 1,
1.02188, -0.08793739, 2.070237, 0, 0, 1, 1, 1,
1.026092, -0.4305247, 2.813101, 1, 0, 0, 1, 1,
1.028603, 0.01085537, 1.201599, 1, 0, 0, 1, 1,
1.029061, -1.024068, 0.9371324, 1, 0, 0, 1, 1,
1.038577, -0.2148459, 2.348802, 1, 0, 0, 1, 1,
1.047325, -0.6820493, 4.237176, 1, 0, 0, 1, 1,
1.048567, -0.2236435, 1.110854, 0, 0, 0, 1, 1,
1.04937, 0.3662175, 1.504399, 0, 0, 0, 1, 1,
1.050511, -0.06306136, 1.722356, 0, 0, 0, 1, 1,
1.056397, -1.292754, 1.956458, 0, 0, 0, 1, 1,
1.062524, 0.1283566, -0.8362964, 0, 0, 0, 1, 1,
1.06285, 0.2115512, 2.300969, 0, 0, 0, 1, 1,
1.073709, 0.8145117, 1.092426, 0, 0, 0, 1, 1,
1.074321, 0.4126369, 0.2493443, 1, 1, 1, 1, 1,
1.076392, -0.0713055, 1.360856, 1, 1, 1, 1, 1,
1.08219, -1.307472, 2.639359, 1, 1, 1, 1, 1,
1.082852, 0.943593, -0.2229663, 1, 1, 1, 1, 1,
1.08391, -0.2449674, 0.9969042, 1, 1, 1, 1, 1,
1.099935, -0.8193005, 1.385042, 1, 1, 1, 1, 1,
1.108065, 1.209167, 1.136926, 1, 1, 1, 1, 1,
1.109614, -0.1897501, 0.9291959, 1, 1, 1, 1, 1,
1.115606, 0.9670951, 0.04272071, 1, 1, 1, 1, 1,
1.119999, -0.5178088, 2.275175, 1, 1, 1, 1, 1,
1.120698, 0.04058374, 1.715109, 1, 1, 1, 1, 1,
1.123604, -0.9049769, -0.5460297, 1, 1, 1, 1, 1,
1.142408, -0.8153363, 2.462026, 1, 1, 1, 1, 1,
1.14415, -0.2569636, 1.459541, 1, 1, 1, 1, 1,
1.147925, 0.5227185, 2.159613, 1, 1, 1, 1, 1,
1.151456, 0.1669032, 0.7504011, 0, 0, 1, 1, 1,
1.154012, -1.011402, 1.513212, 1, 0, 0, 1, 1,
1.16128, -0.7501501, 3.562813, 1, 0, 0, 1, 1,
1.165779, 0.7805214, 1.944366, 1, 0, 0, 1, 1,
1.166113, 0.1099198, 2.782034, 1, 0, 0, 1, 1,
1.179567, -0.7808371, 1.824962, 1, 0, 0, 1, 1,
1.197461, -2.176574, 1.550386, 0, 0, 0, 1, 1,
1.203209, -0.6017433, 3.349287, 0, 0, 0, 1, 1,
1.21445, 0.8240317, 1.365061, 0, 0, 0, 1, 1,
1.219997, 0.7115442, 3.255091, 0, 0, 0, 1, 1,
1.223878, -0.6314579, 1.082382, 0, 0, 0, 1, 1,
1.224438, -0.2812455, 2.300025, 0, 0, 0, 1, 1,
1.232756, -0.9910058, 3.24408, 0, 0, 0, 1, 1,
1.23483, -0.08438329, 1.032462, 1, 1, 1, 1, 1,
1.237332, -0.5757906, 0.5524159, 1, 1, 1, 1, 1,
1.239196, 1.514401, -0.09778965, 1, 1, 1, 1, 1,
1.241565, 0.05283717, 1.419847, 1, 1, 1, 1, 1,
1.246962, -1.554269, 1.615299, 1, 1, 1, 1, 1,
1.251671, 0.9315608, 0.8102053, 1, 1, 1, 1, 1,
1.251701, -1.229482, 3.408415, 1, 1, 1, 1, 1,
1.276546, 0.2371706, 1.191516, 1, 1, 1, 1, 1,
1.278795, -0.6614609, 2.035495, 1, 1, 1, 1, 1,
1.283984, -0.3614009, 1.000523, 1, 1, 1, 1, 1,
1.304344, 0.5084219, 0.1649048, 1, 1, 1, 1, 1,
1.310507, -1.082193, 3.060167, 1, 1, 1, 1, 1,
1.32207, -0.906711, 3.470529, 1, 1, 1, 1, 1,
1.323478, -0.01895798, -0.141032, 1, 1, 1, 1, 1,
1.329676, -0.293728, 0.9177665, 1, 1, 1, 1, 1,
1.334454, 0.1401838, -0.5726259, 0, 0, 1, 1, 1,
1.334692, -0.8320561, 1.959355, 1, 0, 0, 1, 1,
1.338894, 0.9311739, -0.2106238, 1, 0, 0, 1, 1,
1.34926, 1.993584, -0.2843576, 1, 0, 0, 1, 1,
1.367426, -0.125005, 3.292314, 1, 0, 0, 1, 1,
1.374766, -1.811095, 1.494269, 1, 0, 0, 1, 1,
1.379838, -1.085882, 3.26436, 0, 0, 0, 1, 1,
1.392471, -0.825253, 1.70787, 0, 0, 0, 1, 1,
1.403588, -0.06591541, 1.117088, 0, 0, 0, 1, 1,
1.408033, 0.4241899, 2.313062, 0, 0, 0, 1, 1,
1.44262, -0.4712833, 1.541706, 0, 0, 0, 1, 1,
1.447201, -1.318572, 3.737705, 0, 0, 0, 1, 1,
1.453389, -0.3732026, 1.599216, 0, 0, 0, 1, 1,
1.460829, 1.745697, 1.325215, 1, 1, 1, 1, 1,
1.460982, -0.9887604, 1.346944, 1, 1, 1, 1, 1,
1.474237, -1.567407, 1.50472, 1, 1, 1, 1, 1,
1.476075, 1.053224, -0.9150353, 1, 1, 1, 1, 1,
1.487621, -2.333637, 2.942791, 1, 1, 1, 1, 1,
1.495499, -1.208308, 0.7446829, 1, 1, 1, 1, 1,
1.501356, 0.4436415, 2.050038, 1, 1, 1, 1, 1,
1.517417, -0.2399581, -0.6422836, 1, 1, 1, 1, 1,
1.524842, -1.108957, 1.532957, 1, 1, 1, 1, 1,
1.532835, -0.1266712, 2.722497, 1, 1, 1, 1, 1,
1.533873, -0.4422774, 3.334543, 1, 1, 1, 1, 1,
1.540624, 0.4726854, -1.220066, 1, 1, 1, 1, 1,
1.573579, -0.6847327, 3.248404, 1, 1, 1, 1, 1,
1.591742, 0.328119, 0.8081012, 1, 1, 1, 1, 1,
1.594423, -0.09344602, 2.998269, 1, 1, 1, 1, 1,
1.622362, 1.153906, 2.45299, 0, 0, 1, 1, 1,
1.625182, 1.509637, 1.426324, 1, 0, 0, 1, 1,
1.654725, 0.6661762, -0.2548281, 1, 0, 0, 1, 1,
1.660197, -0.5074262, 1.96775, 1, 0, 0, 1, 1,
1.663835, 0.8809857, 2.467913, 1, 0, 0, 1, 1,
1.668455, -1.086596, 2.046502, 1, 0, 0, 1, 1,
1.695989, -1.4637, 1.137044, 0, 0, 0, 1, 1,
1.70281, 1.12142, 1.889701, 0, 0, 0, 1, 1,
1.729716, -0.07583632, 2.348993, 0, 0, 0, 1, 1,
1.754207, -0.719572, 2.375697, 0, 0, 0, 1, 1,
1.755589, 0.8198879, 1.146737, 0, 0, 0, 1, 1,
1.764861, 0.7555975, -0.277574, 0, 0, 0, 1, 1,
1.768556, 0.9375401, 1.471732, 0, 0, 0, 1, 1,
1.771303, -1.112218, 2.960374, 1, 1, 1, 1, 1,
1.773062, 0.6362441, 1.526433, 1, 1, 1, 1, 1,
1.77781, -0.8242099, 1.990061, 1, 1, 1, 1, 1,
1.786094, 1.123636, 0.431262, 1, 1, 1, 1, 1,
1.817539, 0.3242233, 0.3339961, 1, 1, 1, 1, 1,
1.830683, -0.315839, 1.131182, 1, 1, 1, 1, 1,
1.835558, -0.1480753, 2.564358, 1, 1, 1, 1, 1,
1.836446, 0.5742817, 1.367616, 1, 1, 1, 1, 1,
1.836593, 1.341172, 1.517819, 1, 1, 1, 1, 1,
1.838349, 0.3943713, 2.318522, 1, 1, 1, 1, 1,
1.874103, 1.281983, -0.7377598, 1, 1, 1, 1, 1,
1.877861, 0.4257118, 2.093609, 1, 1, 1, 1, 1,
1.890209, 1.279285, 0.9999344, 1, 1, 1, 1, 1,
1.907612, 1.642976, 0.2997213, 1, 1, 1, 1, 1,
1.933379, -1.068823, 1.14165, 1, 1, 1, 1, 1,
1.991901, 0.4392326, 0.3876432, 0, 0, 1, 1, 1,
2.029603, 1.111659, 1.188798, 1, 0, 0, 1, 1,
2.039966, -0.3408717, 3.000923, 1, 0, 0, 1, 1,
2.042473, -2.526575, 1.774623, 1, 0, 0, 1, 1,
2.088334, 0.2652369, 3.659358, 1, 0, 0, 1, 1,
2.093632, -0.1290605, 3.466734, 1, 0, 0, 1, 1,
2.151077, -0.3482964, 1.274985, 0, 0, 0, 1, 1,
2.250314, 1.691313, 1.702881, 0, 0, 0, 1, 1,
2.262395, -0.08383003, 1.789241, 0, 0, 0, 1, 1,
2.266293, -0.3552282, 2.367394, 0, 0, 0, 1, 1,
2.304587, 1.184282, 0.3617584, 0, 0, 0, 1, 1,
2.321086, -1.087989, -1.110415, 0, 0, 0, 1, 1,
2.503596, -0.1365039, 1.395713, 0, 0, 0, 1, 1,
2.512082, -0.4725902, 1.474431, 1, 1, 1, 1, 1,
2.525449, 0.005852211, 1.96097, 1, 1, 1, 1, 1,
2.607792, 0.07144177, 0.587495, 1, 1, 1, 1, 1,
2.611437, 1.470085, 2.443867, 1, 1, 1, 1, 1,
2.621118, -0.9424952, 1.799934, 1, 1, 1, 1, 1,
2.940991, 0.4120032, 0.5412863, 1, 1, 1, 1, 1,
2.954445, 0.7834091, -0.2850493, 1, 1, 1, 1, 1
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
var radius = 9.455918;
var distance = 33.21351;
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
mvMatrix.translate( 0.3974169, -0.05766368, 0.2962918 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21351);
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
