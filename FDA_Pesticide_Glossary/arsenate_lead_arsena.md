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
-3.115643, -1.522232, -0.9488231, 1, 0, 0, 1,
-2.743075, -1.047962, -3.248374, 1, 0.007843138, 0, 1,
-2.632741, -2.145916, -3.412011, 1, 0.01176471, 0, 1,
-2.541908, 1.183604, -0.3611391, 1, 0.01960784, 0, 1,
-2.41867, 0.5235957, -0.7556822, 1, 0.02352941, 0, 1,
-2.413517, -0.2512864, -0.7753939, 1, 0.03137255, 0, 1,
-2.371922, -0.4206358, -2.420741, 1, 0.03529412, 0, 1,
-2.333005, 1.318913, -1.277538, 1, 0.04313726, 0, 1,
-2.284171, 0.02143622, -1.717516, 1, 0.04705882, 0, 1,
-2.18918, 1.135078, -1.110436, 1, 0.05490196, 0, 1,
-2.139986, 0.4516921, -1.322939, 1, 0.05882353, 0, 1,
-2.113106, 0.8585533, -1.687772, 1, 0.06666667, 0, 1,
-2.087267, -0.9977357, -1.094482, 1, 0.07058824, 0, 1,
-2.034342, 0.6690859, 0.01422709, 1, 0.07843138, 0, 1,
-2.027135, -1.478679, -1.723796, 1, 0.08235294, 0, 1,
-2.00491, -0.6736644, -2.888619, 1, 0.09019608, 0, 1,
-1.993458, -0.7031134, -0.6221136, 1, 0.09411765, 0, 1,
-1.956048, -0.5061216, -0.7676146, 1, 0.1019608, 0, 1,
-1.949813, -1.823998, -2.489627, 1, 0.1098039, 0, 1,
-1.927671, 0.8740432, -0.8058724, 1, 0.1137255, 0, 1,
-1.921099, 0.01300586, -0.4506003, 1, 0.1215686, 0, 1,
-1.913448, 0.1288128, -1.282614, 1, 0.1254902, 0, 1,
-1.854107, -0.4946715, -1.636101, 1, 0.1333333, 0, 1,
-1.843177, 0.7256761, 0.5533358, 1, 0.1372549, 0, 1,
-1.827723, -0.7009249, -2.896836, 1, 0.145098, 0, 1,
-1.826975, -1.17636, -2.468312, 1, 0.1490196, 0, 1,
-1.82288, -0.4428654, -0.3655527, 1, 0.1568628, 0, 1,
-1.820531, -0.1092911, -0.3108199, 1, 0.1607843, 0, 1,
-1.815765, -0.3343053, -2.305211, 1, 0.1686275, 0, 1,
-1.810426, 0.09572276, -2.41228, 1, 0.172549, 0, 1,
-1.803996, -1.048855, -2.590228, 1, 0.1803922, 0, 1,
-1.784116, -0.8778012, -2.081556, 1, 0.1843137, 0, 1,
-1.784116, -0.9881773, -2.708182, 1, 0.1921569, 0, 1,
-1.77116, -1.202743, -3.387081, 1, 0.1960784, 0, 1,
-1.759684, 0.2879702, -0.5990872, 1, 0.2039216, 0, 1,
-1.757894, 0.6025223, -1.059444, 1, 0.2117647, 0, 1,
-1.746875, -0.1949121, 0.1872071, 1, 0.2156863, 0, 1,
-1.740597, -0.7401808, -1.269072, 1, 0.2235294, 0, 1,
-1.738841, -1.118489, -2.90902, 1, 0.227451, 0, 1,
-1.727199, -0.4533336, -1.527194, 1, 0.2352941, 0, 1,
-1.710253, -0.9271964, -2.564187, 1, 0.2392157, 0, 1,
-1.658266, -0.3587975, -0.1053089, 1, 0.2470588, 0, 1,
-1.65565, 0.2141877, -0.6043478, 1, 0.2509804, 0, 1,
-1.647754, -0.8674517, -2.382639, 1, 0.2588235, 0, 1,
-1.647476, -0.2657244, -1.872754, 1, 0.2627451, 0, 1,
-1.646037, -0.8072301, -1.196743, 1, 0.2705882, 0, 1,
-1.643256, 2.292485, -0.02700039, 1, 0.2745098, 0, 1,
-1.636161, 1.317718, -1.096341, 1, 0.282353, 0, 1,
-1.602864, 0.1423766, -1.646541, 1, 0.2862745, 0, 1,
-1.595961, -0.6407753, -1.040744, 1, 0.2941177, 0, 1,
-1.574826, -0.1812069, -0.6095397, 1, 0.3019608, 0, 1,
-1.574823, -1.118253, -3.511462, 1, 0.3058824, 0, 1,
-1.574351, -0.2114789, -2.860243, 1, 0.3137255, 0, 1,
-1.570364, -0.3696556, -3.035347, 1, 0.3176471, 0, 1,
-1.569395, 0.2707206, -1.83819, 1, 0.3254902, 0, 1,
-1.557437, -0.7953861, -2.819037, 1, 0.3294118, 0, 1,
-1.549649, -0.07610179, -2.251464, 1, 0.3372549, 0, 1,
-1.51676, -0.381688, -3.126918, 1, 0.3411765, 0, 1,
-1.507256, 1.31965, -0.2600796, 1, 0.3490196, 0, 1,
-1.506119, -0.1260051, -0.5023814, 1, 0.3529412, 0, 1,
-1.501508, 0.8385734, -1.053313, 1, 0.3607843, 0, 1,
-1.497502, 0.8434939, -1.436474, 1, 0.3647059, 0, 1,
-1.485732, 0.3623687, -1.953977, 1, 0.372549, 0, 1,
-1.467828, -1.652392, -2.91059, 1, 0.3764706, 0, 1,
-1.467703, 1.640506, -0.7134621, 1, 0.3843137, 0, 1,
-1.465437, -0.6511157, -2.901611, 1, 0.3882353, 0, 1,
-1.464877, 1.112048, -0.7438762, 1, 0.3960784, 0, 1,
-1.456275, 0.4376646, -0.1116941, 1, 0.4039216, 0, 1,
-1.445536, -0.5993733, -2.896074, 1, 0.4078431, 0, 1,
-1.432729, 0.002777662, -0.8643341, 1, 0.4156863, 0, 1,
-1.40488, 0.7682207, -1.427366, 1, 0.4196078, 0, 1,
-1.372488, 0.3594991, -1.088493, 1, 0.427451, 0, 1,
-1.372103, 2.665365, -1.044335, 1, 0.4313726, 0, 1,
-1.37187, -1.135947, -1.64951, 1, 0.4392157, 0, 1,
-1.367459, -1.450563, -2.361626, 1, 0.4431373, 0, 1,
-1.358537, -0.3958397, -2.197915, 1, 0.4509804, 0, 1,
-1.353658, 0.03389633, -0.5822415, 1, 0.454902, 0, 1,
-1.347921, 0.5339247, -1.618146, 1, 0.4627451, 0, 1,
-1.345406, 0.6318092, -2.002362, 1, 0.4666667, 0, 1,
-1.344389, 0.01470158, -1.081935, 1, 0.4745098, 0, 1,
-1.33863, 1.123583, -0.2331498, 1, 0.4784314, 0, 1,
-1.329112, -0.9065945, -1.623164, 1, 0.4862745, 0, 1,
-1.326921, 1.412984, 0.1358613, 1, 0.4901961, 0, 1,
-1.325925, -1.34789, -3.198713, 1, 0.4980392, 0, 1,
-1.313942, -0.6826081, -1.928012, 1, 0.5058824, 0, 1,
-1.310837, -0.3331304, -0.64617, 1, 0.509804, 0, 1,
-1.300777, -0.6273283, -3.346437, 1, 0.5176471, 0, 1,
-1.293255, -0.4028521, -1.280135, 1, 0.5215687, 0, 1,
-1.289967, 0.7688782, -1.849377, 1, 0.5294118, 0, 1,
-1.276323, 0.9752207, 0.1320433, 1, 0.5333334, 0, 1,
-1.26544, 0.3303254, -1.06266, 1, 0.5411765, 0, 1,
-1.260145, -1.082556, -2.474966, 1, 0.5450981, 0, 1,
-1.242144, -0.2454133, -1.753584, 1, 0.5529412, 0, 1,
-1.229458, 1.833323, -0.305084, 1, 0.5568628, 0, 1,
-1.221478, -0.6247714, -2.887666, 1, 0.5647059, 0, 1,
-1.219553, -0.04782034, 0.09068025, 1, 0.5686275, 0, 1,
-1.210696, -0.2678469, -1.526911, 1, 0.5764706, 0, 1,
-1.207559, 0.7098778, -1.816271, 1, 0.5803922, 0, 1,
-1.203639, -1.16172, -2.757869, 1, 0.5882353, 0, 1,
-1.20195, 0.2823776, -0.7803643, 1, 0.5921569, 0, 1,
-1.195593, -0.2098499, -1.697593, 1, 0.6, 0, 1,
-1.18944, 0.3125017, 0.560751, 1, 0.6078432, 0, 1,
-1.188982, -1.83397, -2.013874, 1, 0.6117647, 0, 1,
-1.186218, -1.800632, -3.245548, 1, 0.6196079, 0, 1,
-1.182335, -0.2959346, -2.989218, 1, 0.6235294, 0, 1,
-1.180891, 0.26833, -0.6295698, 1, 0.6313726, 0, 1,
-1.156423, -0.1162881, -1.575736, 1, 0.6352941, 0, 1,
-1.156399, 0.06040718, 0.5982363, 1, 0.6431373, 0, 1,
-1.152349, 1.77565, 1.0174, 1, 0.6470588, 0, 1,
-1.145952, 1.482352, -0.4212315, 1, 0.654902, 0, 1,
-1.145325, 0.4011852, -2.668585, 1, 0.6588235, 0, 1,
-1.143985, -0.6751561, -2.184671, 1, 0.6666667, 0, 1,
-1.14296, 0.5944403, -0.8188777, 1, 0.6705883, 0, 1,
-1.119869, 0.9996448, -0.9789765, 1, 0.6784314, 0, 1,
-1.119492, 0.3030055, -2.243701, 1, 0.682353, 0, 1,
-1.115711, -0.3635477, -1.143486, 1, 0.6901961, 0, 1,
-1.114874, 0.1912258, -2.098425, 1, 0.6941177, 0, 1,
-1.114128, 0.4043414, -0.9435087, 1, 0.7019608, 0, 1,
-1.113343, 0.1222598, -1.914127, 1, 0.7098039, 0, 1,
-1.110247, 0.05879813, -0.2933101, 1, 0.7137255, 0, 1,
-1.109801, 0.3204609, 0.08727363, 1, 0.7215686, 0, 1,
-1.107561, 0.8140171, -0.2088975, 1, 0.7254902, 0, 1,
-1.105232, -0.1169304, -1.514074, 1, 0.7333333, 0, 1,
-1.103631, -0.07133459, -1.46104, 1, 0.7372549, 0, 1,
-1.093868, -0.5839581, -1.898866, 1, 0.7450981, 0, 1,
-1.093815, -0.7844788, -0.7738025, 1, 0.7490196, 0, 1,
-1.089853, -1.294652, -2.7354, 1, 0.7568628, 0, 1,
-1.083805, -0.3759972, -1.976406, 1, 0.7607843, 0, 1,
-1.083371, -0.0221581, -1.32034, 1, 0.7686275, 0, 1,
-1.077335, -0.7427808, -2.78415, 1, 0.772549, 0, 1,
-1.070152, -1.13193, -1.64819, 1, 0.7803922, 0, 1,
-1.066975, -1.395535, -1.81125, 1, 0.7843137, 0, 1,
-1.061713, -0.06809643, 0.3161327, 1, 0.7921569, 0, 1,
-1.0587, 0.2407149, -0.9189398, 1, 0.7960784, 0, 1,
-1.056909, 0.9282709, -0.1940999, 1, 0.8039216, 0, 1,
-1.043363, -0.2346353, -1.292309, 1, 0.8117647, 0, 1,
-1.039692, -0.6808159, 0.01674616, 1, 0.8156863, 0, 1,
-1.037855, 0.6974044, 0.453665, 1, 0.8235294, 0, 1,
-1.035222, 0.2399451, -2.005767, 1, 0.827451, 0, 1,
-1.031293, 0.536845, -0.4881364, 1, 0.8352941, 0, 1,
-1.028924, -0.9870901, -2.063613, 1, 0.8392157, 0, 1,
-1.014746, -0.1037217, -1.060375, 1, 0.8470588, 0, 1,
-1.012501, -0.4019414, -3.977037, 1, 0.8509804, 0, 1,
-1.012362, 1.518061, -0.5659983, 1, 0.8588235, 0, 1,
-1.010623, 0.5021148, -0.7811071, 1, 0.8627451, 0, 1,
-1.004436, 2.128579, 0.08300802, 1, 0.8705882, 0, 1,
-0.9978703, 0.8177001, 0.8309402, 1, 0.8745098, 0, 1,
-0.9916493, 1.294827, -1.230721, 1, 0.8823529, 0, 1,
-0.9904499, -0.5341674, -2.858571, 1, 0.8862745, 0, 1,
-0.9893221, -0.7335638, -2.029521, 1, 0.8941177, 0, 1,
-0.982005, 0.02039036, -2.066631, 1, 0.8980392, 0, 1,
-0.9650347, 0.7248372, -1.573159, 1, 0.9058824, 0, 1,
-0.9578146, -0.4339125, -3.864877, 1, 0.9137255, 0, 1,
-0.9576786, 0.1778184, -2.459206, 1, 0.9176471, 0, 1,
-0.9427817, 0.6167927, -2.156894, 1, 0.9254902, 0, 1,
-0.9426314, 0.05628025, -2.267006, 1, 0.9294118, 0, 1,
-0.9416895, 0.2263856, -1.624584, 1, 0.9372549, 0, 1,
-0.937678, 2.130396, 0.0341646, 1, 0.9411765, 0, 1,
-0.9342421, 1.006514, 0.4572271, 1, 0.9490196, 0, 1,
-0.9298454, 0.5868632, -1.555769, 1, 0.9529412, 0, 1,
-0.9274888, -0.02870342, -0.493319, 1, 0.9607843, 0, 1,
-0.9273331, 1.021146, -0.1628195, 1, 0.9647059, 0, 1,
-0.9263162, 0.1155331, -1.77929, 1, 0.972549, 0, 1,
-0.9259043, 0.1873756, -1.624484, 1, 0.9764706, 0, 1,
-0.9258379, 0.2960508, -1.228156, 1, 0.9843137, 0, 1,
-0.9250306, 1.191629, 0.3918917, 1, 0.9882353, 0, 1,
-0.9141302, -0.9147694, -2.872647, 1, 0.9960784, 0, 1,
-0.912205, -1.167986, -2.655799, 0.9960784, 1, 0, 1,
-0.9090267, 0.4394458, -2.207999, 0.9921569, 1, 0, 1,
-0.9076775, -1.115142, -2.008273, 0.9843137, 1, 0, 1,
-0.9023954, -0.151494, -1.566074, 0.9803922, 1, 0, 1,
-0.8973671, 0.6409282, -2.478451, 0.972549, 1, 0, 1,
-0.8912638, 0.3247296, -1.239155, 0.9686275, 1, 0, 1,
-0.8897388, 1.587919, -0.2999026, 0.9607843, 1, 0, 1,
-0.8880817, -0.4580199, -2.403823, 0.9568627, 1, 0, 1,
-0.8860946, -1.504954, -2.551903, 0.9490196, 1, 0, 1,
-0.877598, -0.09231082, -0.7288248, 0.945098, 1, 0, 1,
-0.8765718, 0.3790598, -0.4110422, 0.9372549, 1, 0, 1,
-0.8728091, -1.478944, -3.605397, 0.9333333, 1, 0, 1,
-0.866241, 0.1726035, -0.46672, 0.9254902, 1, 0, 1,
-0.8635322, -0.7621254, -1.16371, 0.9215686, 1, 0, 1,
-0.8603324, -2.092361, -4.394259, 0.9137255, 1, 0, 1,
-0.8602759, 1.052071, -1.397648, 0.9098039, 1, 0, 1,
-0.854118, 0.3611026, -0.8982536, 0.9019608, 1, 0, 1,
-0.8537802, -1.293938, -0.6911296, 0.8941177, 1, 0, 1,
-0.8511268, -2.019596, -3.616258, 0.8901961, 1, 0, 1,
-0.8499424, 0.3220147, -1.487077, 0.8823529, 1, 0, 1,
-0.8489671, -1.791077, -2.56539, 0.8784314, 1, 0, 1,
-0.847827, -1.330949, -1.096646, 0.8705882, 1, 0, 1,
-0.8398663, -0.3340293, -3.953305, 0.8666667, 1, 0, 1,
-0.8310499, 0.02895807, -1.246912, 0.8588235, 1, 0, 1,
-0.830811, -0.3778429, -2.33618, 0.854902, 1, 0, 1,
-0.829499, 1.010532, 1.4878, 0.8470588, 1, 0, 1,
-0.828877, 0.03862045, -1.606446, 0.8431373, 1, 0, 1,
-0.8288428, 3.141383, -0.4088439, 0.8352941, 1, 0, 1,
-0.8177411, 1.513806, -1.566914, 0.8313726, 1, 0, 1,
-0.8147025, -0.4966718, -4.583025, 0.8235294, 1, 0, 1,
-0.8117003, 0.7992589, -2.457945, 0.8196079, 1, 0, 1,
-0.809177, -0.1549969, -0.4150403, 0.8117647, 1, 0, 1,
-0.8070599, -0.02532643, -3.313845, 0.8078431, 1, 0, 1,
-0.8017709, -0.7401867, -1.506957, 0.8, 1, 0, 1,
-0.7986161, -0.8712151, -3.369003, 0.7921569, 1, 0, 1,
-0.7965639, -0.3753907, -2.777474, 0.7882353, 1, 0, 1,
-0.7951598, -0.9012437, -2.699205, 0.7803922, 1, 0, 1,
-0.782623, -0.2266267, -2.161055, 0.7764706, 1, 0, 1,
-0.7785411, -1.41329, -2.794749, 0.7686275, 1, 0, 1,
-0.7783533, 0.02441244, -1.253306, 0.7647059, 1, 0, 1,
-0.7744124, 0.47833, -1.476705, 0.7568628, 1, 0, 1,
-0.7742602, 0.500501, -0.2222059, 0.7529412, 1, 0, 1,
-0.7706116, 0.1634478, -0.5691533, 0.7450981, 1, 0, 1,
-0.7680526, -0.8202142, -4.99395, 0.7411765, 1, 0, 1,
-0.7656074, 0.9255313, -0.9568488, 0.7333333, 1, 0, 1,
-0.7634295, -0.8088511, -1.942863, 0.7294118, 1, 0, 1,
-0.7604865, 0.2013895, -1.131162, 0.7215686, 1, 0, 1,
-0.7538407, 2.709943, -0.8127005, 0.7176471, 1, 0, 1,
-0.7470204, 0.3602274, -3.202379, 0.7098039, 1, 0, 1,
-0.7436684, -0.751438, -0.9901333, 0.7058824, 1, 0, 1,
-0.7338192, -0.2035352, -0.7790048, 0.6980392, 1, 0, 1,
-0.7336603, 0.3915335, -0.7576827, 0.6901961, 1, 0, 1,
-0.7298605, 1.887669, -1.240868, 0.6862745, 1, 0, 1,
-0.728681, 1.916521, -0.9114904, 0.6784314, 1, 0, 1,
-0.727974, 0.6150229, -1.379389, 0.6745098, 1, 0, 1,
-0.7274295, -1.183565, -3.105575, 0.6666667, 1, 0, 1,
-0.723846, 1.873397, 1.282756, 0.6627451, 1, 0, 1,
-0.72351, -0.9575177, -2.733398, 0.654902, 1, 0, 1,
-0.7231131, -0.1391561, -1.811666, 0.6509804, 1, 0, 1,
-0.7203456, 0.5097843, -2.17727, 0.6431373, 1, 0, 1,
-0.7197413, -0.4367661, -0.5839021, 0.6392157, 1, 0, 1,
-0.7134791, 0.245572, 0.4379653, 0.6313726, 1, 0, 1,
-0.711858, -1.011582, -4.285361, 0.627451, 1, 0, 1,
-0.7086797, -0.7606165, -3.802308, 0.6196079, 1, 0, 1,
-0.7076707, 2.048419, -0.1200391, 0.6156863, 1, 0, 1,
-0.7039779, 0.5762523, -1.368285, 0.6078432, 1, 0, 1,
-0.7024746, -0.1778712, -1.196216, 0.6039216, 1, 0, 1,
-0.70029, 0.5682888, 0.1912327, 0.5960785, 1, 0, 1,
-0.6955034, -1.176801, -3.783061, 0.5882353, 1, 0, 1,
-0.6948788, -0.2213411, -0.5587099, 0.5843138, 1, 0, 1,
-0.6898016, 0.7773509, -0.6933346, 0.5764706, 1, 0, 1,
-0.6889325, 0.3958969, -2.331173, 0.572549, 1, 0, 1,
-0.6868618, -1.548671, -2.293622, 0.5647059, 1, 0, 1,
-0.6845115, -0.4387212, -1.096069, 0.5607843, 1, 0, 1,
-0.6811393, 1.263182, -0.716032, 0.5529412, 1, 0, 1,
-0.675399, 0.9521986, -1.132758, 0.5490196, 1, 0, 1,
-0.6712279, -0.5482407, -1.174202, 0.5411765, 1, 0, 1,
-0.6700415, -0.2629944, -1.531711, 0.5372549, 1, 0, 1,
-0.6653978, 1.212713, -1.28417, 0.5294118, 1, 0, 1,
-0.6647931, -0.2726139, -1.547169, 0.5254902, 1, 0, 1,
-0.6627066, 1.050071, -0.7443396, 0.5176471, 1, 0, 1,
-0.6615855, 1.426433, -0.9457465, 0.5137255, 1, 0, 1,
-0.6609651, 0.0137504, -2.03351, 0.5058824, 1, 0, 1,
-0.6601111, 0.1153979, 0.173979, 0.5019608, 1, 0, 1,
-0.6555535, -0.4958884, -3.648996, 0.4941176, 1, 0, 1,
-0.6548827, 1.157584, 1.037347, 0.4862745, 1, 0, 1,
-0.6522723, -0.683778, -2.838386, 0.4823529, 1, 0, 1,
-0.6508593, 1.662201, -0.9122, 0.4745098, 1, 0, 1,
-0.6480963, 0.1990937, -2.816561, 0.4705882, 1, 0, 1,
-0.6476843, -2.597727, -3.217067, 0.4627451, 1, 0, 1,
-0.6471047, -1.051783, -1.284157, 0.4588235, 1, 0, 1,
-0.6463987, 0.105116, -0.7265522, 0.4509804, 1, 0, 1,
-0.6437752, 0.1596511, -1.016856, 0.4470588, 1, 0, 1,
-0.6390413, -0.8518612, -0.212543, 0.4392157, 1, 0, 1,
-0.6361586, -0.2028667, -2.20692, 0.4352941, 1, 0, 1,
-0.6351088, 1.375809, 0.1453322, 0.427451, 1, 0, 1,
-0.6342608, 0.1474377, -2.676672, 0.4235294, 1, 0, 1,
-0.6331896, -1.023676, -2.97124, 0.4156863, 1, 0, 1,
-0.6324813, 0.6629569, 0.7844015, 0.4117647, 1, 0, 1,
-0.6308401, 0.7856257, 0.1927819, 0.4039216, 1, 0, 1,
-0.6243866, -0.8526972, -3.399244, 0.3960784, 1, 0, 1,
-0.6242501, 0.6817223, 1.414495, 0.3921569, 1, 0, 1,
-0.6241823, -0.3136548, -1.919533, 0.3843137, 1, 0, 1,
-0.6235387, 0.7435398, -0.6384816, 0.3803922, 1, 0, 1,
-0.6222371, 1.121511, -2.086304, 0.372549, 1, 0, 1,
-0.6220049, 0.9501123, -2.555923, 0.3686275, 1, 0, 1,
-0.6159331, 0.8560396, -1.009963, 0.3607843, 1, 0, 1,
-0.6118668, -0.05945187, -0.6953617, 0.3568628, 1, 0, 1,
-0.610728, 0.0001956378, -2.395324, 0.3490196, 1, 0, 1,
-0.6067207, 0.07663176, -0.8579317, 0.345098, 1, 0, 1,
-0.5969671, -0.5836198, -2.930024, 0.3372549, 1, 0, 1,
-0.5950451, -0.3704906, -0.7317227, 0.3333333, 1, 0, 1,
-0.5919744, 1.158389, -0.711836, 0.3254902, 1, 0, 1,
-0.5874563, 1.022422, -2.366446, 0.3215686, 1, 0, 1,
-0.5873439, -2.052392, -2.987614, 0.3137255, 1, 0, 1,
-0.5793414, 0.4244717, -1.668427, 0.3098039, 1, 0, 1,
-0.5764917, -0.3259178, -1.399096, 0.3019608, 1, 0, 1,
-0.574322, 0.05238007, -1.127703, 0.2941177, 1, 0, 1,
-0.5732879, 0.8079965, -0.9963962, 0.2901961, 1, 0, 1,
-0.5713281, -0.307087, -1.296716, 0.282353, 1, 0, 1,
-0.5704691, 0.3207971, -1.03462, 0.2784314, 1, 0, 1,
-0.5660881, 0.4430016, 0.1861053, 0.2705882, 1, 0, 1,
-0.5615119, -2.005831, -3.180142, 0.2666667, 1, 0, 1,
-0.5609345, 1.034364, 0.4107221, 0.2588235, 1, 0, 1,
-0.5595829, 1.209227, -0.9676627, 0.254902, 1, 0, 1,
-0.5576751, 0.2375755, -1.217513, 0.2470588, 1, 0, 1,
-0.5542306, 1.117859, -0.145779, 0.2431373, 1, 0, 1,
-0.5477749, 0.06312376, -2.392586, 0.2352941, 1, 0, 1,
-0.5475816, -0.3526164, -1.630701, 0.2313726, 1, 0, 1,
-0.5464341, 0.4470027, -1.889737, 0.2235294, 1, 0, 1,
-0.5417983, -0.3834864, -1.04655, 0.2196078, 1, 0, 1,
-0.539779, 2.214703, 0.1708097, 0.2117647, 1, 0, 1,
-0.5384326, -0.31015, -2.998522, 0.2078431, 1, 0, 1,
-0.5337407, 1.366197, -0.6360005, 0.2, 1, 0, 1,
-0.5315213, -1.656478, -2.117797, 0.1921569, 1, 0, 1,
-0.5308781, -1.871382, -1.900711, 0.1882353, 1, 0, 1,
-0.5297076, -0.5476671, -2.671532, 0.1803922, 1, 0, 1,
-0.5268609, 0.2777055, -0.7335683, 0.1764706, 1, 0, 1,
-0.5044301, 0.1183803, -0.1930751, 0.1686275, 1, 0, 1,
-0.5043558, 0.3013406, -1.953339, 0.1647059, 1, 0, 1,
-0.5029336, 0.2393023, -0.6077183, 0.1568628, 1, 0, 1,
-0.4991382, 1.17482, 0.9811536, 0.1529412, 1, 0, 1,
-0.4940527, -0.7240692, -1.330687, 0.145098, 1, 0, 1,
-0.491902, -1.391511, -3.312893, 0.1411765, 1, 0, 1,
-0.4856365, -0.4022435, -1.012799, 0.1333333, 1, 0, 1,
-0.4831069, 0.2208483, -1.180807, 0.1294118, 1, 0, 1,
-0.4826245, 2.078652, -0.7405844, 0.1215686, 1, 0, 1,
-0.4822034, 0.1326598, -0.1317882, 0.1176471, 1, 0, 1,
-0.4814291, 0.5962597, -2.316178, 0.1098039, 1, 0, 1,
-0.4808671, -0.5275403, -3.962864, 0.1058824, 1, 0, 1,
-0.4806524, 1.832223, 0.6424812, 0.09803922, 1, 0, 1,
-0.4784933, -1.256469, -3.165286, 0.09019608, 1, 0, 1,
-0.4779017, 0.6708049, 0.2263802, 0.08627451, 1, 0, 1,
-0.4776343, -0.7882851, -3.595504, 0.07843138, 1, 0, 1,
-0.4748259, 1.072403, 1.449451, 0.07450981, 1, 0, 1,
-0.4736603, 1.554279, -0.524666, 0.06666667, 1, 0, 1,
-0.4727834, -1.28674, -2.234888, 0.0627451, 1, 0, 1,
-0.4718545, 0.8865851, -0.8578143, 0.05490196, 1, 0, 1,
-0.4683033, 0.06855363, -1.5312, 0.05098039, 1, 0, 1,
-0.4657921, 0.9418088, -1.330667, 0.04313726, 1, 0, 1,
-0.4650339, 1.034435, 0.3770516, 0.03921569, 1, 0, 1,
-0.4648497, -0.3973817, 0.4549444, 0.03137255, 1, 0, 1,
-0.4631665, -0.251042, 0.1253139, 0.02745098, 1, 0, 1,
-0.4536696, 0.1110557, -1.217066, 0.01960784, 1, 0, 1,
-0.4403714, -0.03099394, -1.599166, 0.01568628, 1, 0, 1,
-0.4344081, -0.8175454, -3.252599, 0.007843138, 1, 0, 1,
-0.4317236, -1.05722, -0.5511447, 0.003921569, 1, 0, 1,
-0.4313486, -0.9619785, -1.717032, 0, 1, 0.003921569, 1,
-0.4301591, 0.1590102, -1.66354, 0, 1, 0.01176471, 1,
-0.4285324, 0.03806027, -1.958801, 0, 1, 0.01568628, 1,
-0.427199, -1.284573, -4.258111, 0, 1, 0.02352941, 1,
-0.4269488, 0.7904952, -1.116122, 0, 1, 0.02745098, 1,
-0.4184184, -0.5439587, -3.265781, 0, 1, 0.03529412, 1,
-0.4176002, 1.10208, -1.153142, 0, 1, 0.03921569, 1,
-0.4158948, 0.9647739, -0.857515, 0, 1, 0.04705882, 1,
-0.415635, -0.8791628, -2.956047, 0, 1, 0.05098039, 1,
-0.4152507, 0.1041901, 0.1794123, 0, 1, 0.05882353, 1,
-0.4079088, -1.107279, -2.268584, 0, 1, 0.0627451, 1,
-0.4050805, 0.4837024, -1.444201, 0, 1, 0.07058824, 1,
-0.4024253, 0.4852114, -0.8846213, 0, 1, 0.07450981, 1,
-0.3963195, -1.481077, -0.701466, 0, 1, 0.08235294, 1,
-0.3954898, 0.4627485, -1.657858, 0, 1, 0.08627451, 1,
-0.3915607, -0.3671982, -3.585561, 0, 1, 0.09411765, 1,
-0.3913423, -0.2129406, -1.139943, 0, 1, 0.1019608, 1,
-0.3902588, 0.4377749, -0.1301131, 0, 1, 0.1058824, 1,
-0.3899696, 0.6780666, 0.03587176, 0, 1, 0.1137255, 1,
-0.3800174, -0.8704239, -3.334646, 0, 1, 0.1176471, 1,
-0.3756977, -1.339677, -4.936435, 0, 1, 0.1254902, 1,
-0.372867, -0.2859556, -3.069953, 0, 1, 0.1294118, 1,
-0.3672911, 0.667785, -0.2788732, 0, 1, 0.1372549, 1,
-0.3659142, -0.2129563, -2.252334, 0, 1, 0.1411765, 1,
-0.3630423, -1.850778, -3.838154, 0, 1, 0.1490196, 1,
-0.3630244, -0.7560458, -2.055189, 0, 1, 0.1529412, 1,
-0.359125, -0.398337, -3.251986, 0, 1, 0.1607843, 1,
-0.352823, 0.3689802, -0.3869143, 0, 1, 0.1647059, 1,
-0.3500831, -0.2847492, -2.317139, 0, 1, 0.172549, 1,
-0.34909, -0.7492453, -3.058182, 0, 1, 0.1764706, 1,
-0.3484021, 0.4861396, -1.804717, 0, 1, 0.1843137, 1,
-0.3482514, 0.6337129, -1.521619, 0, 1, 0.1882353, 1,
-0.3449224, 1.113906, -0.006546036, 0, 1, 0.1960784, 1,
-0.3412448, -0.6708794, -2.048244, 0, 1, 0.2039216, 1,
-0.3408508, -0.3201858, -1.580515, 0, 1, 0.2078431, 1,
-0.3376901, -0.8281702, -3.798103, 0, 1, 0.2156863, 1,
-0.3351087, -0.1476122, -4.098656, 0, 1, 0.2196078, 1,
-0.3344928, -0.06499222, -2.377846, 0, 1, 0.227451, 1,
-0.3342802, 1.642882, 0.6495249, 0, 1, 0.2313726, 1,
-0.3320422, -2.158117, -1.838585, 0, 1, 0.2392157, 1,
-0.3315263, -0.4465791, -2.241438, 0, 1, 0.2431373, 1,
-0.3308621, 0.06708542, -1.905043, 0, 1, 0.2509804, 1,
-0.330229, -0.05403674, -2.471337, 0, 1, 0.254902, 1,
-0.328628, -0.5800717, -2.357848, 0, 1, 0.2627451, 1,
-0.3249612, 0.7798651, 0.09535266, 0, 1, 0.2666667, 1,
-0.3216012, -1.746091, -2.209056, 0, 1, 0.2745098, 1,
-0.3201222, -0.003062454, -1.609172, 0, 1, 0.2784314, 1,
-0.3188643, 1.479048, -0.1871523, 0, 1, 0.2862745, 1,
-0.3184927, -0.07483342, -2.543095, 0, 1, 0.2901961, 1,
-0.3181813, -1.527769, -2.566968, 0, 1, 0.2980392, 1,
-0.3162694, -0.06581695, -0.4014965, 0, 1, 0.3058824, 1,
-0.3143142, 0.1777669, -0.6841306, 0, 1, 0.3098039, 1,
-0.3083393, 0.115251, 0.6908171, 0, 1, 0.3176471, 1,
-0.3065549, -0.6128426, -1.581777, 0, 1, 0.3215686, 1,
-0.3054748, 0.9991862, -1.292127, 0, 1, 0.3294118, 1,
-0.2984772, -0.1903139, -2.899134, 0, 1, 0.3333333, 1,
-0.2937791, 0.4622699, -1.594745, 0, 1, 0.3411765, 1,
-0.2855009, 0.6867164, -1.090241, 0, 1, 0.345098, 1,
-0.2848639, 0.4911023, -0.8557011, 0, 1, 0.3529412, 1,
-0.2804568, -0.4079083, -1.91663, 0, 1, 0.3568628, 1,
-0.2778764, 2.00113, 1.292945, 0, 1, 0.3647059, 1,
-0.2732939, 0.67283, 0.207537, 0, 1, 0.3686275, 1,
-0.2709016, -0.5563652, -3.061939, 0, 1, 0.3764706, 1,
-0.2666169, 0.3702764, -0.935906, 0, 1, 0.3803922, 1,
-0.2629078, 2.003744, 0.2052597, 0, 1, 0.3882353, 1,
-0.2619579, 0.298036, -0.586417, 0, 1, 0.3921569, 1,
-0.2592359, -0.5051185, -3.060361, 0, 1, 0.4, 1,
-0.2584954, -0.07225648, -2.333739, 0, 1, 0.4078431, 1,
-0.2576425, -0.3281221, -1.257081, 0, 1, 0.4117647, 1,
-0.2524152, 1.437622, 1.155557, 0, 1, 0.4196078, 1,
-0.2507155, 0.8341234, -1.302118, 0, 1, 0.4235294, 1,
-0.2502846, -1.383222, -0.9054133, 0, 1, 0.4313726, 1,
-0.2360293, 1.543298, -1.163812, 0, 1, 0.4352941, 1,
-0.2347299, 0.1975363, -1.444588, 0, 1, 0.4431373, 1,
-0.2311638, -0.4965466, -2.905031, 0, 1, 0.4470588, 1,
-0.2264809, -0.5377473, -3.092315, 0, 1, 0.454902, 1,
-0.2263487, 1.434301, -2.226233, 0, 1, 0.4588235, 1,
-0.2183052, 0.3876602, -0.2024702, 0, 1, 0.4666667, 1,
-0.2144233, -0.7815659, -1.294811, 0, 1, 0.4705882, 1,
-0.2071129, 1.674542, 2.160602, 0, 1, 0.4784314, 1,
-0.2049114, -0.8787246, -4.336521, 0, 1, 0.4823529, 1,
-0.2037635, -0.8411205, -4.288636, 0, 1, 0.4901961, 1,
-0.1978833, 0.5648637, -1.435928, 0, 1, 0.4941176, 1,
-0.1917267, -0.7458779, -2.925581, 0, 1, 0.5019608, 1,
-0.1885504, -0.2069442, -2.258368, 0, 1, 0.509804, 1,
-0.1861031, -0.5712116, -3.853517, 0, 1, 0.5137255, 1,
-0.1820948, 2.436904, -1.192751, 0, 1, 0.5215687, 1,
-0.1807237, -0.1389279, -3.815646, 0, 1, 0.5254902, 1,
-0.1805431, -2.162953, -3.650408, 0, 1, 0.5333334, 1,
-0.1769855, -0.3434464, -3.388961, 0, 1, 0.5372549, 1,
-0.1729596, 0.269702, 0.8301688, 0, 1, 0.5450981, 1,
-0.1724548, 0.5238493, -1.445837, 0, 1, 0.5490196, 1,
-0.1714027, -0.6837173, -2.053996, 0, 1, 0.5568628, 1,
-0.1709722, -0.1125735, -0.8689579, 0, 1, 0.5607843, 1,
-0.1696808, 0.05870983, -1.29325, 0, 1, 0.5686275, 1,
-0.167974, 1.241719, 0.8205177, 0, 1, 0.572549, 1,
-0.1665932, -0.163927, -1.074201, 0, 1, 0.5803922, 1,
-0.1650217, 1.637296, 0.8195972, 0, 1, 0.5843138, 1,
-0.1621384, 0.5941713, -0.8834644, 0, 1, 0.5921569, 1,
-0.1610318, -1.203339, -3.34974, 0, 1, 0.5960785, 1,
-0.1579097, 0.9352912, -0.3964269, 0, 1, 0.6039216, 1,
-0.1569283, -0.9815144, -2.366955, 0, 1, 0.6117647, 1,
-0.1563829, 1.205073, 0.1138749, 0, 1, 0.6156863, 1,
-0.155478, -0.4487015, -3.487014, 0, 1, 0.6235294, 1,
-0.1543273, -0.4444724, -2.793524, 0, 1, 0.627451, 1,
-0.1527809, 0.4989406, -0.2356738, 0, 1, 0.6352941, 1,
-0.1509489, -0.4552363, -3.020188, 0, 1, 0.6392157, 1,
-0.1501101, -1.048066, -2.68673, 0, 1, 0.6470588, 1,
-0.1485303, -0.529973, -4.331509, 0, 1, 0.6509804, 1,
-0.1447466, 0.05807612, -0.1046536, 0, 1, 0.6588235, 1,
-0.1446959, -0.5917365, -2.528652, 0, 1, 0.6627451, 1,
-0.1416442, -0.2827424, -2.723743, 0, 1, 0.6705883, 1,
-0.1403351, 0.7715192, 0.1486107, 0, 1, 0.6745098, 1,
-0.1394016, 1.128045, -0.2274709, 0, 1, 0.682353, 1,
-0.1392767, -0.212473, -3.13111, 0, 1, 0.6862745, 1,
-0.1389877, 0.3281862, 0.145174, 0, 1, 0.6941177, 1,
-0.1388507, 1.485034, -1.367868, 0, 1, 0.7019608, 1,
-0.1328231, -0.8973505, -2.325046, 0, 1, 0.7058824, 1,
-0.1325056, 0.8133997, -0.2954765, 0, 1, 0.7137255, 1,
-0.1303114, -1.083295, -2.830556, 0, 1, 0.7176471, 1,
-0.1209968, -1.461324, -1.861561, 0, 1, 0.7254902, 1,
-0.12027, -0.6418959, -3.241233, 0, 1, 0.7294118, 1,
-0.1200377, 0.8808174, 0.6069111, 0, 1, 0.7372549, 1,
-0.1197611, 1.008781, -1.562438, 0, 1, 0.7411765, 1,
-0.1139151, 1.445923, 0.8546181, 0, 1, 0.7490196, 1,
-0.1136129, 0.6452714, 0.1930562, 0, 1, 0.7529412, 1,
-0.1040033, -1.151731, -1.42723, 0, 1, 0.7607843, 1,
-0.09713782, 1.686295, -1.447287, 0, 1, 0.7647059, 1,
-0.09616405, -0.3971721, -2.382592, 0, 1, 0.772549, 1,
-0.09423859, -0.417162, -3.632921, 0, 1, 0.7764706, 1,
-0.09161276, 0.01374351, -2.898751, 0, 1, 0.7843137, 1,
-0.09131736, -1.001676, -4.407967, 0, 1, 0.7882353, 1,
-0.08765383, -0.254132, -5.141998, 0, 1, 0.7960784, 1,
-0.08666028, -0.5148644, -3.378927, 0, 1, 0.8039216, 1,
-0.08245295, -0.4805286, -2.336234, 0, 1, 0.8078431, 1,
-0.08137289, -0.153721, -4.097281, 0, 1, 0.8156863, 1,
-0.07914554, 0.4908478, -0.9345505, 0, 1, 0.8196079, 1,
-0.07852583, 0.6899175, 1.525745, 0, 1, 0.827451, 1,
-0.07810716, -0.3052237, -3.591352, 0, 1, 0.8313726, 1,
-0.07342514, 2.108502, -0.08619248, 0, 1, 0.8392157, 1,
-0.07234851, 0.5326145, 0.906988, 0, 1, 0.8431373, 1,
-0.07225003, -1.104067, -3.377414, 0, 1, 0.8509804, 1,
-0.07103334, -1.130581, -3.495205, 0, 1, 0.854902, 1,
-0.0698574, -0.7363262, -2.507863, 0, 1, 0.8627451, 1,
-0.06723326, 1.221885, -0.5545655, 0, 1, 0.8666667, 1,
-0.06496194, -1.431799, -1.524332, 0, 1, 0.8745098, 1,
-0.06042544, 0.6945069, 1.828005, 0, 1, 0.8784314, 1,
-0.05928862, -1.849644, -4.487012, 0, 1, 0.8862745, 1,
-0.05884352, 0.4517696, -0.3220354, 0, 1, 0.8901961, 1,
-0.05850317, -1.187374, -4.938948, 0, 1, 0.8980392, 1,
-0.05708153, 2.620822, 2.210394, 0, 1, 0.9058824, 1,
-0.05588208, 1.394604, 0.09293419, 0, 1, 0.9098039, 1,
-0.05225085, -0.2718951, -2.552408, 0, 1, 0.9176471, 1,
-0.04672907, 0.03086966, -1.098958, 0, 1, 0.9215686, 1,
-0.04190388, 0.3256137, 1.44591, 0, 1, 0.9294118, 1,
-0.039472, 0.379986, -1.634633, 0, 1, 0.9333333, 1,
-0.03472941, -1.298869, -4.043189, 0, 1, 0.9411765, 1,
-0.03439671, 0.2235162, -0.3078647, 0, 1, 0.945098, 1,
-0.03312112, -0.7084215, -3.035602, 0, 1, 0.9529412, 1,
-0.0254212, 0.7849658, -1.126394, 0, 1, 0.9568627, 1,
-0.01937426, 1.552344, 1.459584, 0, 1, 0.9647059, 1,
-0.0187411, -0.552197, -3.889801, 0, 1, 0.9686275, 1,
-0.01646369, 0.8875331, -0.02880372, 0, 1, 0.9764706, 1,
-0.01498158, -2.586923, -3.125701, 0, 1, 0.9803922, 1,
-0.009724192, 0.9572409, 0.07419258, 0, 1, 0.9882353, 1,
-0.004445826, 2.046026, -0.3261421, 0, 1, 0.9921569, 1,
-0.001926811, 0.4937252, -1.560618, 0, 1, 1, 1,
0.004865292, -0.6200372, 4.501641, 0, 0.9921569, 1, 1,
0.007862922, -0.9058376, 2.224438, 0, 0.9882353, 1, 1,
0.008658516, 0.5628, 0.3452929, 0, 0.9803922, 1, 1,
0.01160469, -0.5426658, 2.373792, 0, 0.9764706, 1, 1,
0.0117906, -1.453977, 3.135042, 0, 0.9686275, 1, 1,
0.01273761, -0.3821984, 2.633641, 0, 0.9647059, 1, 1,
0.01652934, -1.433132, 3.893292, 0, 0.9568627, 1, 1,
0.02112313, 0.4685593, 1.50202, 0, 0.9529412, 1, 1,
0.02243702, -1.093516, 1.029259, 0, 0.945098, 1, 1,
0.02330131, 0.03956993, -0.1207783, 0, 0.9411765, 1, 1,
0.03214431, 0.1616421, 0.8106523, 0, 0.9333333, 1, 1,
0.03477578, -1.927992, 2.765837, 0, 0.9294118, 1, 1,
0.03758037, 2.539817, -0.7076547, 0, 0.9215686, 1, 1,
0.03891835, 0.6746534, 0.1483719, 0, 0.9176471, 1, 1,
0.0416622, -2.549698, 0.8327522, 0, 0.9098039, 1, 1,
0.04295414, 1.305523, 0.1213996, 0, 0.9058824, 1, 1,
0.04350996, 0.4994907, 2.094774, 0, 0.8980392, 1, 1,
0.04394912, 1.430683, 1.170104, 0, 0.8901961, 1, 1,
0.04865373, 0.5961908, -1.327824, 0, 0.8862745, 1, 1,
0.05314706, -0.4312378, 2.951173, 0, 0.8784314, 1, 1,
0.06075929, 1.607687, -1.651878, 0, 0.8745098, 1, 1,
0.06102708, -1.91803, 3.369633, 0, 0.8666667, 1, 1,
0.06443433, 1.558633, -1.668199, 0, 0.8627451, 1, 1,
0.06456365, -0.4073236, 3.97802, 0, 0.854902, 1, 1,
0.0679648, 1.092018, -0.6402597, 0, 0.8509804, 1, 1,
0.07006263, -1.471712, 2.981073, 0, 0.8431373, 1, 1,
0.07281147, -0.7201685, 1.505145, 0, 0.8392157, 1, 1,
0.07641296, -0.7147344, 2.561992, 0, 0.8313726, 1, 1,
0.07758015, -0.1713339, 3.217562, 0, 0.827451, 1, 1,
0.07975935, 0.6238145, -0.2894168, 0, 0.8196079, 1, 1,
0.08054497, 0.09095683, 0.2561419, 0, 0.8156863, 1, 1,
0.08570997, -0.2352154, 4.72825, 0, 0.8078431, 1, 1,
0.08579703, 0.5987208, 0.4679224, 0, 0.8039216, 1, 1,
0.08978603, -1.262813, 2.909698, 0, 0.7960784, 1, 1,
0.09479214, -1.412208, 0.4851966, 0, 0.7882353, 1, 1,
0.1037314, 1.162646, 0.397724, 0, 0.7843137, 1, 1,
0.1130896, -0.2355721, 4.890698, 0, 0.7764706, 1, 1,
0.1181146, -0.0438377, 1.148169, 0, 0.772549, 1, 1,
0.1190239, -0.6886322, 2.763801, 0, 0.7647059, 1, 1,
0.1226485, -0.3116427, 2.969425, 0, 0.7607843, 1, 1,
0.1250811, -0.5523921, 3.159471, 0, 0.7529412, 1, 1,
0.1279937, 0.6251212, -0.1833533, 0, 0.7490196, 1, 1,
0.128931, 0.5319957, -0.9479215, 0, 0.7411765, 1, 1,
0.134179, -0.0004991667, 1.803972, 0, 0.7372549, 1, 1,
0.1360255, 1.830348, -1.080485, 0, 0.7294118, 1, 1,
0.1371813, -0.3957006, 2.818044, 0, 0.7254902, 1, 1,
0.1392443, 0.03682295, 2.377288, 0, 0.7176471, 1, 1,
0.1480095, -0.07172775, 2.918457, 0, 0.7137255, 1, 1,
0.1497512, -0.2438048, 2.840888, 0, 0.7058824, 1, 1,
0.1499087, -1.063532, 4.652876, 0, 0.6980392, 1, 1,
0.1530935, 0.5595414, 1.446913, 0, 0.6941177, 1, 1,
0.1548082, 0.8082445, -0.7242309, 0, 0.6862745, 1, 1,
0.1566804, -0.01527911, 0.9642459, 0, 0.682353, 1, 1,
0.1669658, 0.6851065, 1.809882, 0, 0.6745098, 1, 1,
0.1781562, 0.2059742, 2.268146, 0, 0.6705883, 1, 1,
0.1793167, -0.2697452, 1.458923, 0, 0.6627451, 1, 1,
0.180933, -0.4540833, 2.608886, 0, 0.6588235, 1, 1,
0.1812142, 1.495724, -0.4323163, 0, 0.6509804, 1, 1,
0.1847111, 0.4467187, -0.005939628, 0, 0.6470588, 1, 1,
0.1847594, -1.763085, 4.314544, 0, 0.6392157, 1, 1,
0.1854764, -1.166819, 3.080457, 0, 0.6352941, 1, 1,
0.1858243, 1.674921, 0.9922183, 0, 0.627451, 1, 1,
0.1902155, 0.3438074, 1.982043, 0, 0.6235294, 1, 1,
0.193719, 0.8818871, 0.4893271, 0, 0.6156863, 1, 1,
0.1937323, -0.4814077, 2.33278, 0, 0.6117647, 1, 1,
0.1955193, 0.9427233, -0.545423, 0, 0.6039216, 1, 1,
0.1966389, 0.628984, -1.293895, 0, 0.5960785, 1, 1,
0.196766, -2.192355, 3.729833, 0, 0.5921569, 1, 1,
0.1968939, 1.420175, -0.6547164, 0, 0.5843138, 1, 1,
0.1971753, 0.3763167, -0.6977174, 0, 0.5803922, 1, 1,
0.1971969, 1.040474, 0.5526667, 0, 0.572549, 1, 1,
0.1999401, -0.4694717, 2.497507, 0, 0.5686275, 1, 1,
0.2001585, -0.9291443, 4.622242, 0, 0.5607843, 1, 1,
0.2006681, -1.03651, 3.406407, 0, 0.5568628, 1, 1,
0.2010875, -0.2949439, 1.461131, 0, 0.5490196, 1, 1,
0.2090958, 0.0272987, 0.8736406, 0, 0.5450981, 1, 1,
0.2155638, -0.4697412, 5.246348, 0, 0.5372549, 1, 1,
0.2184561, 0.9823166, 1.472794, 0, 0.5333334, 1, 1,
0.2195958, 0.4963716, -0.2480176, 0, 0.5254902, 1, 1,
0.224024, 0.07989629, 2.781336, 0, 0.5215687, 1, 1,
0.2262174, 0.4093787, 1.198236, 0, 0.5137255, 1, 1,
0.2275848, 0.6122294, 0.2996021, 0, 0.509804, 1, 1,
0.2335655, -0.3576983, 3.466217, 0, 0.5019608, 1, 1,
0.2337624, 0.5997785, 0.6503286, 0, 0.4941176, 1, 1,
0.2371461, 2.046618, -0.1119854, 0, 0.4901961, 1, 1,
0.2398545, 0.4489349, -0.5369418, 0, 0.4823529, 1, 1,
0.2411133, 0.9629641, -0.332256, 0, 0.4784314, 1, 1,
0.2419037, -2.034018, 3.754068, 0, 0.4705882, 1, 1,
0.242968, 1.163375, 0.2867913, 0, 0.4666667, 1, 1,
0.2450984, -0.216204, 2.854161, 0, 0.4588235, 1, 1,
0.2456363, 1.346141, 2.436644, 0, 0.454902, 1, 1,
0.2457166, -0.8688291, 3.03221, 0, 0.4470588, 1, 1,
0.2518618, -2.349577, 4.424306, 0, 0.4431373, 1, 1,
0.2538781, -1.442469, 0.8855314, 0, 0.4352941, 1, 1,
0.2543977, -0.4350925, 1.173733, 0, 0.4313726, 1, 1,
0.2558616, -1.802509, 3.459781, 0, 0.4235294, 1, 1,
0.2566755, -0.4794147, 2.895802, 0, 0.4196078, 1, 1,
0.2604859, -1.917142, 3.065419, 0, 0.4117647, 1, 1,
0.2604878, -1.034293, 2.001977, 0, 0.4078431, 1, 1,
0.2645819, -1.486431, 2.807119, 0, 0.4, 1, 1,
0.2657977, -1.000111, 3.58238, 0, 0.3921569, 1, 1,
0.2659079, 0.7427796, 0.4682096, 0, 0.3882353, 1, 1,
0.2659813, 0.1553451, 2.431004, 0, 0.3803922, 1, 1,
0.2718957, 0.9967069, 1.77228, 0, 0.3764706, 1, 1,
0.2722234, 1.002244, -0.02703895, 0, 0.3686275, 1, 1,
0.2734281, 0.3856752, -0.08666048, 0, 0.3647059, 1, 1,
0.2742386, -0.5252301, 2.870967, 0, 0.3568628, 1, 1,
0.2744766, 0.9682804, 1.683112, 0, 0.3529412, 1, 1,
0.2753235, 0.111941, 2.106242, 0, 0.345098, 1, 1,
0.2763749, -0.4732585, 2.594846, 0, 0.3411765, 1, 1,
0.27696, 0.3205247, 1.28106, 0, 0.3333333, 1, 1,
0.2829176, 0.5530894, 0.2093944, 0, 0.3294118, 1, 1,
0.2896495, 0.552848, 1.746378, 0, 0.3215686, 1, 1,
0.2904364, -2.490299, 3.952459, 0, 0.3176471, 1, 1,
0.2954671, 0.7256454, 1.108641, 0, 0.3098039, 1, 1,
0.2956198, -0.0002003466, 2.013615, 0, 0.3058824, 1, 1,
0.2968691, 0.7755831, 0.3715309, 0, 0.2980392, 1, 1,
0.2976913, -0.1186763, 1.206539, 0, 0.2901961, 1, 1,
0.3023709, 0.3480924, 1.552427, 0, 0.2862745, 1, 1,
0.3061932, -0.6730579, 3.115015, 0, 0.2784314, 1, 1,
0.3072328, 0.1367424, 1.437764, 0, 0.2745098, 1, 1,
0.3081551, 0.423811, -0.3878665, 0, 0.2666667, 1, 1,
0.3172204, -0.3107308, 4.448831, 0, 0.2627451, 1, 1,
0.3243674, -0.1222642, 2.455041, 0, 0.254902, 1, 1,
0.3285683, 1.099582, 0.6757576, 0, 0.2509804, 1, 1,
0.3301367, 0.9161699, 0.9393161, 0, 0.2431373, 1, 1,
0.3332663, 0.4284387, 0.7770663, 0, 0.2392157, 1, 1,
0.334382, -0.85948, 2.808911, 0, 0.2313726, 1, 1,
0.3345167, -1.461961, 2.299144, 0, 0.227451, 1, 1,
0.3433388, 0.0169336, 2.221751, 0, 0.2196078, 1, 1,
0.3479705, 1.395, -1.826205, 0, 0.2156863, 1, 1,
0.3513075, -0.5642762, 1.985613, 0, 0.2078431, 1, 1,
0.3543471, -0.6341818, 0.7536366, 0, 0.2039216, 1, 1,
0.3560131, -0.5114866, 4.333896, 0, 0.1960784, 1, 1,
0.3602484, 0.8200408, -0.6089267, 0, 0.1882353, 1, 1,
0.3620705, 0.158514, -0.653741, 0, 0.1843137, 1, 1,
0.3622276, -0.2597689, 2.067679, 0, 0.1764706, 1, 1,
0.3632099, -0.08582495, 0.829662, 0, 0.172549, 1, 1,
0.3632108, 0.09022482, 2.060467, 0, 0.1647059, 1, 1,
0.3641039, 0.9089641, 1.672733, 0, 0.1607843, 1, 1,
0.3672474, -0.4714758, 3.144082, 0, 0.1529412, 1, 1,
0.3679122, 0.6788612, -0.2676115, 0, 0.1490196, 1, 1,
0.3691031, 0.6169881, -1.916514, 0, 0.1411765, 1, 1,
0.3719704, 1.182246, -0.2258461, 0, 0.1372549, 1, 1,
0.3827195, -0.5007176, 2.734363, 0, 0.1294118, 1, 1,
0.3829777, -0.4835771, 2.52693, 0, 0.1254902, 1, 1,
0.3840764, 0.3273559, -0.2734557, 0, 0.1176471, 1, 1,
0.3873492, -0.6471407, 2.539447, 0, 0.1137255, 1, 1,
0.3887455, 0.7437564, 0.5226745, 0, 0.1058824, 1, 1,
0.3980831, 1.962869, -0.438706, 0, 0.09803922, 1, 1,
0.4025374, 0.146998, 0.8783189, 0, 0.09411765, 1, 1,
0.4055955, -0.9039145, 3.289421, 0, 0.08627451, 1, 1,
0.4069796, -0.4010146, 0.5692961, 0, 0.08235294, 1, 1,
0.4073691, -0.3810509, 1.535836, 0, 0.07450981, 1, 1,
0.4084848, -1.006353, 3.389032, 0, 0.07058824, 1, 1,
0.4121274, -1.305784, 3.446445, 0, 0.0627451, 1, 1,
0.4193279, -0.6373539, 2.950205, 0, 0.05882353, 1, 1,
0.4218182, -1.445013, 4.771894, 0, 0.05098039, 1, 1,
0.4238023, -0.2593216, 2.721344, 0, 0.04705882, 1, 1,
0.4287718, -0.06003121, 1.552704, 0, 0.03921569, 1, 1,
0.4288122, 0.5889928, 0.4737296, 0, 0.03529412, 1, 1,
0.4309205, -0.8659644, 1.770847, 0, 0.02745098, 1, 1,
0.4318909, 1.31878, 1.010086, 0, 0.02352941, 1, 1,
0.4330905, -0.6728327, 0.2738701, 0, 0.01568628, 1, 1,
0.4338168, -0.5268238, 1.55385, 0, 0.01176471, 1, 1,
0.4365731, 2.087564, 1.353477, 0, 0.003921569, 1, 1,
0.4409254, -0.01894275, 0.8541604, 0.003921569, 0, 1, 1,
0.4414281, -0.0891692, -0.4292469, 0.007843138, 0, 1, 1,
0.4431771, -0.08783241, 3.144428, 0.01568628, 0, 1, 1,
0.4448197, 0.2065408, 1.081667, 0.01960784, 0, 1, 1,
0.4468963, 0.4340303, -0.1091983, 0.02745098, 0, 1, 1,
0.4484164, 0.6450446, 0.04094946, 0.03137255, 0, 1, 1,
0.450529, 1.022902, -0.8408806, 0.03921569, 0, 1, 1,
0.4507, -0.138341, 1.112006, 0.04313726, 0, 1, 1,
0.4548964, -0.6000524, 3.140312, 0.05098039, 0, 1, 1,
0.4549542, 0.8231116, 1.643873, 0.05490196, 0, 1, 1,
0.4571404, 0.3326471, 1.287187, 0.0627451, 0, 1, 1,
0.4586028, 0.1362299, 1.696622, 0.06666667, 0, 1, 1,
0.4602064, -1.89839, 2.237968, 0.07450981, 0, 1, 1,
0.4625999, -1.85224, 2.958498, 0.07843138, 0, 1, 1,
0.4640881, -1.113843, 2.764712, 0.08627451, 0, 1, 1,
0.4649277, 0.1969939, 1.867624, 0.09019608, 0, 1, 1,
0.4660866, 0.3433541, 1.941868, 0.09803922, 0, 1, 1,
0.4696615, -0.1887538, 1.490695, 0.1058824, 0, 1, 1,
0.4700424, 0.3879004, 1.039386, 0.1098039, 0, 1, 1,
0.471375, -1.182221, 1.568178, 0.1176471, 0, 1, 1,
0.4763564, 0.4141172, 2.204963, 0.1215686, 0, 1, 1,
0.4770528, 1.077489, -0.9296014, 0.1294118, 0, 1, 1,
0.4773003, -2.280805, 2.506685, 0.1333333, 0, 1, 1,
0.4788924, 0.1127007, 0.7601693, 0.1411765, 0, 1, 1,
0.4805434, 1.276515, -0.0393724, 0.145098, 0, 1, 1,
0.4821852, 1.173892, -1.375367, 0.1529412, 0, 1, 1,
0.4822126, -1.009024, 3.337988, 0.1568628, 0, 1, 1,
0.4850639, -1.487684, 3.937547, 0.1647059, 0, 1, 1,
0.4894667, -1.465405, 2.143967, 0.1686275, 0, 1, 1,
0.492182, 0.8875101, 1.092686, 0.1764706, 0, 1, 1,
0.4927731, 0.4022974, 0.6260202, 0.1803922, 0, 1, 1,
0.4944641, 0.2265414, 1.131371, 0.1882353, 0, 1, 1,
0.4969181, -0.7778431, 0.6012941, 0.1921569, 0, 1, 1,
0.5014565, -0.5845763, 0.7832815, 0.2, 0, 1, 1,
0.5043557, 1.148618, -0.9608226, 0.2078431, 0, 1, 1,
0.5049514, -0.7977436, 3.517309, 0.2117647, 0, 1, 1,
0.5050256, -1.083587, 1.249126, 0.2196078, 0, 1, 1,
0.5105875, -2.167651, 3.2035, 0.2235294, 0, 1, 1,
0.5122305, -1.494501, 3.354126, 0.2313726, 0, 1, 1,
0.5165225, -2.560616, 0.04233107, 0.2352941, 0, 1, 1,
0.5208828, -1.104038, 3.097276, 0.2431373, 0, 1, 1,
0.5227759, 0.07155647, 0.1236956, 0.2470588, 0, 1, 1,
0.5231029, 0.4404533, 2.116656, 0.254902, 0, 1, 1,
0.5241693, -1.686266, 3.375674, 0.2588235, 0, 1, 1,
0.5272404, 0.4601365, 2.093317, 0.2666667, 0, 1, 1,
0.5310875, 0.5608007, 1.287009, 0.2705882, 0, 1, 1,
0.5320933, -1.708836, 3.801184, 0.2784314, 0, 1, 1,
0.5357174, -1.239654, 2.591741, 0.282353, 0, 1, 1,
0.5383472, -1.2401, 1.590818, 0.2901961, 0, 1, 1,
0.5399508, 1.152606, 1.328595, 0.2941177, 0, 1, 1,
0.5422077, -1.46561, 2.832249, 0.3019608, 0, 1, 1,
0.5430717, -0.05464947, 0.657459, 0.3098039, 0, 1, 1,
0.5489153, 0.7061509, 0.9193234, 0.3137255, 0, 1, 1,
0.5509014, -0.521659, 1.646331, 0.3215686, 0, 1, 1,
0.5520657, 0.5703108, 2.27981, 0.3254902, 0, 1, 1,
0.5548414, 0.3018341, 0.7643941, 0.3333333, 0, 1, 1,
0.5579039, -0.8771052, 1.926857, 0.3372549, 0, 1, 1,
0.5606322, -1.10505, 4.276398, 0.345098, 0, 1, 1,
0.5625362, 0.2313858, -0.2627158, 0.3490196, 0, 1, 1,
0.5672184, 0.09815356, 1.693829, 0.3568628, 0, 1, 1,
0.5678399, -1.334363, 0.6721336, 0.3607843, 0, 1, 1,
0.5686556, -0.6006696, 3.640978, 0.3686275, 0, 1, 1,
0.5692524, 0.6118743, 1.190739, 0.372549, 0, 1, 1,
0.5736587, -0.2018582, 0.5744828, 0.3803922, 0, 1, 1,
0.5737512, 1.059204, 0.9396132, 0.3843137, 0, 1, 1,
0.5768979, -0.8836538, 2.926582, 0.3921569, 0, 1, 1,
0.5780277, 1.123686, -0.4141869, 0.3960784, 0, 1, 1,
0.5802647, -1.605184, 1.513151, 0.4039216, 0, 1, 1,
0.5804152, 0.3763325, 0.2343984, 0.4117647, 0, 1, 1,
0.580528, 0.5372372, -0.01524573, 0.4156863, 0, 1, 1,
0.5846253, -1.295322, 3.070843, 0.4235294, 0, 1, 1,
0.5960525, 1.101533, -0.08495253, 0.427451, 0, 1, 1,
0.5986156, 1.00684, 0.7595838, 0.4352941, 0, 1, 1,
0.6010281, 0.5603862, 1.074425, 0.4392157, 0, 1, 1,
0.6027583, -0.8798858, 2.320633, 0.4470588, 0, 1, 1,
0.6071879, -3.079197, 5.046766, 0.4509804, 0, 1, 1,
0.6137105, -1.085319, 4.740754, 0.4588235, 0, 1, 1,
0.6163557, 0.4852122, 0.4949848, 0.4627451, 0, 1, 1,
0.6187158, 0.2353188, 0.9967242, 0.4705882, 0, 1, 1,
0.6205435, -1.152389, 1.252492, 0.4745098, 0, 1, 1,
0.6375615, -1.598364, 0.3446696, 0.4823529, 0, 1, 1,
0.6377038, 0.4369836, 1.139993, 0.4862745, 0, 1, 1,
0.6386769, 1.678151, -0.07658868, 0.4941176, 0, 1, 1,
0.6418437, -0.2547807, 3.799869, 0.5019608, 0, 1, 1,
0.6428137, -0.4605058, 1.711451, 0.5058824, 0, 1, 1,
0.647058, -1.500956, 2.751727, 0.5137255, 0, 1, 1,
0.6496671, 0.1328008, 1.252609, 0.5176471, 0, 1, 1,
0.6528369, -1.457646, 3.099461, 0.5254902, 0, 1, 1,
0.6550874, -2.162946, 3.063004, 0.5294118, 0, 1, 1,
0.6558695, -0.3653679, 2.254313, 0.5372549, 0, 1, 1,
0.6567681, 0.0899566, 1.170688, 0.5411765, 0, 1, 1,
0.6592405, -1.068351, 2.312694, 0.5490196, 0, 1, 1,
0.6622152, -0.1353258, 2.377939, 0.5529412, 0, 1, 1,
0.676292, -0.3086636, 1.602438, 0.5607843, 0, 1, 1,
0.6774273, -0.6017832, 1.753821, 0.5647059, 0, 1, 1,
0.6846607, 0.7928462, -1.368093, 0.572549, 0, 1, 1,
0.6848835, -0.3810543, 2.615768, 0.5764706, 0, 1, 1,
0.6920783, -0.7459178, 3.28263, 0.5843138, 0, 1, 1,
0.7060066, -1.300017, 5.597024, 0.5882353, 0, 1, 1,
0.7146552, -0.6867092, 4.222691, 0.5960785, 0, 1, 1,
0.7160487, -0.2221095, 0.7683499, 0.6039216, 0, 1, 1,
0.7191291, -0.3977036, 1.751018, 0.6078432, 0, 1, 1,
0.7259167, 0.2233717, 0.9433461, 0.6156863, 0, 1, 1,
0.7362415, -0.7909168, 2.308422, 0.6196079, 0, 1, 1,
0.737251, 0.9727838, 1.609197, 0.627451, 0, 1, 1,
0.7446747, 0.8971959, 1.410696, 0.6313726, 0, 1, 1,
0.7459653, 0.08434478, 0.5301919, 0.6392157, 0, 1, 1,
0.7484681, 0.2620431, 2.217276, 0.6431373, 0, 1, 1,
0.7529192, 0.425093, 2.225072, 0.6509804, 0, 1, 1,
0.7590223, 0.4532208, -0.6447374, 0.654902, 0, 1, 1,
0.760768, 0.2871151, 2.364891, 0.6627451, 0, 1, 1,
0.7639264, -0.4611179, 3.30198, 0.6666667, 0, 1, 1,
0.7640568, -0.5724264, 1.684711, 0.6745098, 0, 1, 1,
0.7658272, -1.111703, 2.837694, 0.6784314, 0, 1, 1,
0.7689126, 0.6944606, 0.5255114, 0.6862745, 0, 1, 1,
0.7690087, 1.095465, 0.8272631, 0.6901961, 0, 1, 1,
0.7735424, -0.07082833, 1.146234, 0.6980392, 0, 1, 1,
0.7746594, -0.1078801, 2.240657, 0.7058824, 0, 1, 1,
0.7771938, -0.2278258, 1.82819, 0.7098039, 0, 1, 1,
0.7778683, 0.4682426, -1.004585, 0.7176471, 0, 1, 1,
0.7841239, 0.6875092, 1.881847, 0.7215686, 0, 1, 1,
0.7854341, -2.732317, 2.844146, 0.7294118, 0, 1, 1,
0.7873904, -1.672801, 3.270574, 0.7333333, 0, 1, 1,
0.7874439, -0.9097456, 3.492705, 0.7411765, 0, 1, 1,
0.7903784, -0.4789845, 1.732588, 0.7450981, 0, 1, 1,
0.7968423, 0.6261262, -0.2935676, 0.7529412, 0, 1, 1,
0.7990945, -1.368478, 2.038911, 0.7568628, 0, 1, 1,
0.7998217, -0.4250593, 0.6841334, 0.7647059, 0, 1, 1,
0.8035161, -0.2244547, 0.4828272, 0.7686275, 0, 1, 1,
0.8038983, -0.1617094, 1.04286, 0.7764706, 0, 1, 1,
0.8046433, -2.247803, 2.781748, 0.7803922, 0, 1, 1,
0.8107908, -0.4935307, 3.858414, 0.7882353, 0, 1, 1,
0.8150065, 1.297251, 0.350545, 0.7921569, 0, 1, 1,
0.8152036, -1.332661, 2.427236, 0.8, 0, 1, 1,
0.8162138, -0.8131787, 1.581171, 0.8078431, 0, 1, 1,
0.826997, 0.05645107, 1.539304, 0.8117647, 0, 1, 1,
0.8287202, 0.3596584, 1.094091, 0.8196079, 0, 1, 1,
0.8303206, -0.4724607, 1.140321, 0.8235294, 0, 1, 1,
0.8333403, 1.555532, 0.9860136, 0.8313726, 0, 1, 1,
0.8371258, 1.645091, -0.1249772, 0.8352941, 0, 1, 1,
0.8426638, 0.6354553, -0.01870288, 0.8431373, 0, 1, 1,
0.8484921, -2.108788, 0.9372699, 0.8470588, 0, 1, 1,
0.8487769, -0.1119397, 0.1509643, 0.854902, 0, 1, 1,
0.85052, -1.61543, 0.02449385, 0.8588235, 0, 1, 1,
0.8517776, -1.229362, 2.79841, 0.8666667, 0, 1, 1,
0.8518113, 0.2066333, -0.1548919, 0.8705882, 0, 1, 1,
0.852422, -1.391044, 3.325039, 0.8784314, 0, 1, 1,
0.862049, -0.1321836, 2.934237, 0.8823529, 0, 1, 1,
0.8637841, -0.4738233, 0.9803628, 0.8901961, 0, 1, 1,
0.8667483, -0.5523199, 0.7212207, 0.8941177, 0, 1, 1,
0.8735926, -0.6861936, 2.2486, 0.9019608, 0, 1, 1,
0.874805, -0.5508652, 2.398583, 0.9098039, 0, 1, 1,
0.8766834, 1.567119, 0.9510406, 0.9137255, 0, 1, 1,
0.8774254, -0.1101509, 3.582501, 0.9215686, 0, 1, 1,
0.8840131, -1.400817, 3.089227, 0.9254902, 0, 1, 1,
0.8848475, 0.916055, -0.4873185, 0.9333333, 0, 1, 1,
0.8889384, 1.338114, 1.483563, 0.9372549, 0, 1, 1,
0.8901573, -0.3053198, 1.502172, 0.945098, 0, 1, 1,
0.8984498, 2.009142, 0.228866, 0.9490196, 0, 1, 1,
0.8989775, 0.8783757, 2.719884, 0.9568627, 0, 1, 1,
0.9006276, 0.1733539, 1.044585, 0.9607843, 0, 1, 1,
0.904721, -1.106202, 3.212791, 0.9686275, 0, 1, 1,
0.9083929, -1.05958, 1.898258, 0.972549, 0, 1, 1,
0.9088548, -0.6587346, 1.730921, 0.9803922, 0, 1, 1,
0.9088792, -0.3275072, 3.442443, 0.9843137, 0, 1, 1,
0.9103847, 0.7537636, -0.6527584, 0.9921569, 0, 1, 1,
0.9120467, 0.2906746, -0.9237858, 0.9960784, 0, 1, 1,
0.9142098, -0.5693101, 0.9779014, 1, 0, 0.9960784, 1,
0.9171401, -0.2041337, 1.593234, 1, 0, 0.9882353, 1,
0.9207469, -0.656777, 2.186975, 1, 0, 0.9843137, 1,
0.9214259, -2.076095, 1.043126, 1, 0, 0.9764706, 1,
0.9317512, -0.3679064, 2.459927, 1, 0, 0.972549, 1,
0.9322292, -1.993759, 2.80376, 1, 0, 0.9647059, 1,
0.9458606, -0.5693568, 3.517741, 1, 0, 0.9607843, 1,
0.9485322, 0.4630127, -0.9733596, 1, 0, 0.9529412, 1,
0.9672483, 0.3617609, 0.8646712, 1, 0, 0.9490196, 1,
0.9702618, -0.1620415, 2.690878, 1, 0, 0.9411765, 1,
0.9720362, 0.4389406, 0.35959, 1, 0, 0.9372549, 1,
0.9820206, 0.1873204, -0.03367099, 1, 0, 0.9294118, 1,
0.9858891, 2.536891, 1.332818, 1, 0, 0.9254902, 1,
0.9998699, 0.5114596, 1.552382, 1, 0, 0.9176471, 1,
1.010468, -1.002172, 3.904074, 1, 0, 0.9137255, 1,
1.017376, 1.787615, 1.75705, 1, 0, 0.9058824, 1,
1.0181, 1.487808, -0.05015922, 1, 0, 0.9019608, 1,
1.022384, -0.3017861, 2.659756, 1, 0, 0.8941177, 1,
1.028327, 0.6508281, 1.710614, 1, 0, 0.8862745, 1,
1.036468, 0.6680413, 0.9810066, 1, 0, 0.8823529, 1,
1.036848, 1.118756, -1.285855, 1, 0, 0.8745098, 1,
1.040369, -0.8346853, 2.648393, 1, 0, 0.8705882, 1,
1.046393, -1.274972, 1.713595, 1, 0, 0.8627451, 1,
1.053892, 0.4165913, 1.788608, 1, 0, 0.8588235, 1,
1.054124, -0.8035104, 1.635803, 1, 0, 0.8509804, 1,
1.060909, 0.770146, 1.914498, 1, 0, 0.8470588, 1,
1.06986, -1.573048, 3.107471, 1, 0, 0.8392157, 1,
1.071486, 0.3236234, 0.4321232, 1, 0, 0.8352941, 1,
1.072644, -1.7084, 2.536414, 1, 0, 0.827451, 1,
1.078085, -1.053818, 2.062428, 1, 0, 0.8235294, 1,
1.078537, 0.2282028, 0.8846559, 1, 0, 0.8156863, 1,
1.094317, 1.12801, 0.01232471, 1, 0, 0.8117647, 1,
1.096702, -0.7299405, 3.102931, 1, 0, 0.8039216, 1,
1.11257, -0.4075057, 2.5943, 1, 0, 0.7960784, 1,
1.116721, 0.1864509, 0.3792241, 1, 0, 0.7921569, 1,
1.116776, 1.043043, 2.536857, 1, 0, 0.7843137, 1,
1.126895, 0.04200928, 1.326993, 1, 0, 0.7803922, 1,
1.127337, -1.796132, 1.733501, 1, 0, 0.772549, 1,
1.135247, 0.07662447, 1.295604, 1, 0, 0.7686275, 1,
1.136325, -0.7885852, 1.272352, 1, 0, 0.7607843, 1,
1.140237, 0.7034925, 1.497962, 1, 0, 0.7568628, 1,
1.152584, 0.8848946, 0.7643737, 1, 0, 0.7490196, 1,
1.153046, 0.8364229, 1.039232, 1, 0, 0.7450981, 1,
1.153304, 0.313216, 2.667128, 1, 0, 0.7372549, 1,
1.15629, -1.413955, 1.465919, 1, 0, 0.7333333, 1,
1.165281, -0.8547655, 4.780815, 1, 0, 0.7254902, 1,
1.171211, -1.016997, 3.640528, 1, 0, 0.7215686, 1,
1.179314, 0.8039889, 1.685742, 1, 0, 0.7137255, 1,
1.189603, 2.126786, 0.5332462, 1, 0, 0.7098039, 1,
1.192604, -1.502782, 1.793417, 1, 0, 0.7019608, 1,
1.193841, 0.4439153, 0.1091489, 1, 0, 0.6941177, 1,
1.195327, 2.028307, 1.064606, 1, 0, 0.6901961, 1,
1.210089, -2.438636, 2.402833, 1, 0, 0.682353, 1,
1.215386, -0.267575, 0.4608908, 1, 0, 0.6784314, 1,
1.216388, -1.70081, 0.942001, 1, 0, 0.6705883, 1,
1.225271, 0.6252902, 1.366827, 1, 0, 0.6666667, 1,
1.225507, 0.4383107, 2.793777, 1, 0, 0.6588235, 1,
1.226798, -1.237999, 4.457661, 1, 0, 0.654902, 1,
1.230933, 0.2043299, 1.420352, 1, 0, 0.6470588, 1,
1.232134, -0.6672232, 2.401562, 1, 0, 0.6431373, 1,
1.234831, 0.3812653, 2.032558, 1, 0, 0.6352941, 1,
1.236617, 0.7925767, 2.501351, 1, 0, 0.6313726, 1,
1.237986, 0.6575091, -0.01157935, 1, 0, 0.6235294, 1,
1.238117, -1.406404, 2.598196, 1, 0, 0.6196079, 1,
1.250705, 0.001606675, 3.007793, 1, 0, 0.6117647, 1,
1.251896, -0.8548989, 2.960137, 1, 0, 0.6078432, 1,
1.252414, 0.5498561, 2.878217, 1, 0, 0.6, 1,
1.25992, -1.121303, 2.159714, 1, 0, 0.5921569, 1,
1.264497, -0.5944825, 3.369984, 1, 0, 0.5882353, 1,
1.272463, -2.023108, 3.655689, 1, 0, 0.5803922, 1,
1.282533, -1.587351, 2.50258, 1, 0, 0.5764706, 1,
1.288382, 1.208866, 0.4236658, 1, 0, 0.5686275, 1,
1.297311, -1.02011, 1.139176, 1, 0, 0.5647059, 1,
1.304437, 1.524515, 2.029578, 1, 0, 0.5568628, 1,
1.306351, -1.288715, 1.670587, 1, 0, 0.5529412, 1,
1.313496, 0.3121829, 1.815783, 1, 0, 0.5450981, 1,
1.317975, 0.0256111, 1.453848, 1, 0, 0.5411765, 1,
1.319281, -1.256115, 2.01362, 1, 0, 0.5333334, 1,
1.32143, -1.365353, 0.3691328, 1, 0, 0.5294118, 1,
1.342595, 1.95227, -0.2919887, 1, 0, 0.5215687, 1,
1.344014, 1.314336, 0.9475501, 1, 0, 0.5176471, 1,
1.34518, 0.6199341, 1.550867, 1, 0, 0.509804, 1,
1.361398, 0.00657133, 0.08669328, 1, 0, 0.5058824, 1,
1.37549, 0.3295851, 2.772195, 1, 0, 0.4980392, 1,
1.395607, 0.04919967, 1.296041, 1, 0, 0.4901961, 1,
1.396147, 2.053224, -0.6021514, 1, 0, 0.4862745, 1,
1.406887, -0.1142667, 1.545693, 1, 0, 0.4784314, 1,
1.41743, 0.7678484, 0.1851762, 1, 0, 0.4745098, 1,
1.41772, -0.4305902, 2.287766, 1, 0, 0.4666667, 1,
1.424186, 0.8940479, 2.534158, 1, 0, 0.4627451, 1,
1.438071, -1.086757, 1.998559, 1, 0, 0.454902, 1,
1.438138, 0.2354279, 2.955507, 1, 0, 0.4509804, 1,
1.438676, 1.639234, 1.464241, 1, 0, 0.4431373, 1,
1.443117, 1.149455, 1.719862, 1, 0, 0.4392157, 1,
1.445735, -0.08724469, 1.570529, 1, 0, 0.4313726, 1,
1.457547, 0.5504676, 0.1487161, 1, 0, 0.427451, 1,
1.466621, 0.6793007, -1.095021, 1, 0, 0.4196078, 1,
1.472988, 1.490232, 0.705626, 1, 0, 0.4156863, 1,
1.485968, 0.689377, 3.923678, 1, 0, 0.4078431, 1,
1.498424, -0.178192, 2.386484, 1, 0, 0.4039216, 1,
1.507177, -0.4933937, 0.5467384, 1, 0, 0.3960784, 1,
1.507625, -1.070089, 2.521035, 1, 0, 0.3882353, 1,
1.513542, 0.5883693, 3.221239, 1, 0, 0.3843137, 1,
1.517222, -0.8796531, 2.003948, 1, 0, 0.3764706, 1,
1.518823, -0.7040454, 0.2565203, 1, 0, 0.372549, 1,
1.527218, 0.05673445, 1.491246, 1, 0, 0.3647059, 1,
1.532059, 0.4879031, 2.958506, 1, 0, 0.3607843, 1,
1.534783, -0.3135473, 2.341375, 1, 0, 0.3529412, 1,
1.535844, 0.006661207, 2.520755, 1, 0, 0.3490196, 1,
1.556468, -1.328415, 2.0712, 1, 0, 0.3411765, 1,
1.557553, 0.9665185, 1.144168, 1, 0, 0.3372549, 1,
1.563838, -0.6032938, 2.009881, 1, 0, 0.3294118, 1,
1.589782, -1.616565, 2.19517, 1, 0, 0.3254902, 1,
1.602712, 0.6670153, 1.765258, 1, 0, 0.3176471, 1,
1.612313, 0.2403309, 1.848351, 1, 0, 0.3137255, 1,
1.613469, 1.278739, 2.153396, 1, 0, 0.3058824, 1,
1.620378, 0.2998526, 0.5013033, 1, 0, 0.2980392, 1,
1.624721, -0.3085957, 1.136915, 1, 0, 0.2941177, 1,
1.626761, 0.4254563, 0.1375288, 1, 0, 0.2862745, 1,
1.64193, 0.3019615, 2.30359, 1, 0, 0.282353, 1,
1.649188, -1.349261, 2.003663, 1, 0, 0.2745098, 1,
1.65296, 0.2523707, 0.6976853, 1, 0, 0.2705882, 1,
1.653218, 0.6348924, 1.151269, 1, 0, 0.2627451, 1,
1.65918, 0.674093, 1.17338, 1, 0, 0.2588235, 1,
1.66736, -0.08415086, 3.183789, 1, 0, 0.2509804, 1,
1.671191, 0.6930431, 0.2848533, 1, 0, 0.2470588, 1,
1.671303, 0.5307107, -0.0863196, 1, 0, 0.2392157, 1,
1.671712, -2.132071, 3.077523, 1, 0, 0.2352941, 1,
1.679892, 1.869067, 0.8446596, 1, 0, 0.227451, 1,
1.682038, 0.5488131, 1.02149, 1, 0, 0.2235294, 1,
1.716579, -1.068419, 1.400466, 1, 0, 0.2156863, 1,
1.716739, -0.05137255, 2.212987, 1, 0, 0.2117647, 1,
1.733837, 0.3106681, 1.778633, 1, 0, 0.2039216, 1,
1.767969, -0.5172333, -0.08951914, 1, 0, 0.1960784, 1,
1.785395, 1.964882, 0.93853, 1, 0, 0.1921569, 1,
1.788867, -0.1338999, 1.959819, 1, 0, 0.1843137, 1,
1.822799, -0.07776646, 2.943919, 1, 0, 0.1803922, 1,
1.843148, 0.04464905, 1.045153, 1, 0, 0.172549, 1,
1.903664, 0.3301897, 2.147382, 1, 0, 0.1686275, 1,
1.922082, -1.325658, 1.780767, 1, 0, 0.1607843, 1,
1.925807, 0.2129212, -0.21994, 1, 0, 0.1568628, 1,
1.948602, -0.4232423, 1.63075, 1, 0, 0.1490196, 1,
1.963416, -0.7513776, 1.556914, 1, 0, 0.145098, 1,
1.965729, -0.01721307, 1.868269, 1, 0, 0.1372549, 1,
1.967069, -1.270706, 3.476144, 1, 0, 0.1333333, 1,
1.974651, 0.1075998, 1.488109, 1, 0, 0.1254902, 1,
2.023146, 0.1173914, 1.478079, 1, 0, 0.1215686, 1,
2.07476, -0.4178009, 1.210737, 1, 0, 0.1137255, 1,
2.07492, -0.9679371, 2.193758, 1, 0, 0.1098039, 1,
2.086206, -0.0318842, 1.348391, 1, 0, 0.1019608, 1,
2.097081, 1.103295, 1.060311, 1, 0, 0.09411765, 1,
2.097834, 2.534247, 0.2910755, 1, 0, 0.09019608, 1,
2.137648, -1.447562, 3.078223, 1, 0, 0.08235294, 1,
2.195942, 1.185225, 1.266275, 1, 0, 0.07843138, 1,
2.207034, -0.9814166, 3.768668, 1, 0, 0.07058824, 1,
2.208009, 0.7000002, 0.1869603, 1, 0, 0.06666667, 1,
2.216733, 2.06522, 2.121536, 1, 0, 0.05882353, 1,
2.233113, 1.044852, 0.01611842, 1, 0, 0.05490196, 1,
2.24807, 1.202203, -0.231156, 1, 0, 0.04705882, 1,
2.296639, -2.437621, 1.435612, 1, 0, 0.04313726, 1,
2.460437, 0.1152422, 2.478629, 1, 0, 0.03529412, 1,
2.558727, 0.6524297, 2.19602, 1, 0, 0.03137255, 1,
2.581913, -0.9500673, 2.235901, 1, 0, 0.02352941, 1,
2.637115, -0.7522505, 2.267032, 1, 0, 0.01960784, 1,
2.683121, -0.003915468, 0.7104056, 1, 0, 0.01176471, 1,
3.444092, -0.758451, 2.097129, 1, 0, 0.007843138, 1
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
0.1642249, -4.133586, -6.962263, 0, -0.5, 0.5, 0.5,
0.1642249, -4.133586, -6.962263, 1, -0.5, 0.5, 0.5,
0.1642249, -4.133586, -6.962263, 1, 1.5, 0.5, 0.5,
0.1642249, -4.133586, -6.962263, 0, 1.5, 0.5, 0.5
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
-4.227518, 0.03109264, -6.962263, 0, -0.5, 0.5, 0.5,
-4.227518, 0.03109264, -6.962263, 1, -0.5, 0.5, 0.5,
-4.227518, 0.03109264, -6.962263, 1, 1.5, 0.5, 0.5,
-4.227518, 0.03109264, -6.962263, 0, 1.5, 0.5, 0.5
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
-4.227518, -4.133586, 0.2275128, 0, -0.5, 0.5, 0.5,
-4.227518, -4.133586, 0.2275128, 1, -0.5, 0.5, 0.5,
-4.227518, -4.133586, 0.2275128, 1, 1.5, 0.5, 0.5,
-4.227518, -4.133586, 0.2275128, 0, 1.5, 0.5, 0.5
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
-3, -3.172506, -5.303083,
3, -3.172506, -5.303083,
-3, -3.172506, -5.303083,
-3, -3.332686, -5.579614,
-2, -3.172506, -5.303083,
-2, -3.332686, -5.579614,
-1, -3.172506, -5.303083,
-1, -3.332686, -5.579614,
0, -3.172506, -5.303083,
0, -3.332686, -5.579614,
1, -3.172506, -5.303083,
1, -3.332686, -5.579614,
2, -3.172506, -5.303083,
2, -3.332686, -5.579614,
3, -3.172506, -5.303083,
3, -3.332686, -5.579614
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
-3, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
-3, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
-3, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
-3, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5,
-2, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
-2, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
-2, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
-2, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5,
-1, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
-1, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
-1, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
-1, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5,
0, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
0, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
0, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
0, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5,
1, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
1, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
1, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
1, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5,
2, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
2, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
2, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
2, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5,
3, -3.653046, -6.132673, 0, -0.5, 0.5, 0.5,
3, -3.653046, -6.132673, 1, -0.5, 0.5, 0.5,
3, -3.653046, -6.132673, 1, 1.5, 0.5, 0.5,
3, -3.653046, -6.132673, 0, 1.5, 0.5, 0.5
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
-3.214039, -3, -5.303083,
-3.214039, 3, -5.303083,
-3.214039, -3, -5.303083,
-3.382952, -3, -5.579614,
-3.214039, -2, -5.303083,
-3.382952, -2, -5.579614,
-3.214039, -1, -5.303083,
-3.382952, -1, -5.579614,
-3.214039, 0, -5.303083,
-3.382952, 0, -5.579614,
-3.214039, 1, -5.303083,
-3.382952, 1, -5.579614,
-3.214039, 2, -5.303083,
-3.382952, 2, -5.579614,
-3.214039, 3, -5.303083,
-3.382952, 3, -5.579614
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
-3.720778, -3, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, -3, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, -3, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, -3, -6.132673, 0, 1.5, 0.5, 0.5,
-3.720778, -2, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, -2, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, -2, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, -2, -6.132673, 0, 1.5, 0.5, 0.5,
-3.720778, -1, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, -1, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, -1, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, -1, -6.132673, 0, 1.5, 0.5, 0.5,
-3.720778, 0, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, 0, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, 0, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, 0, -6.132673, 0, 1.5, 0.5, 0.5,
-3.720778, 1, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, 1, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, 1, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, 1, -6.132673, 0, 1.5, 0.5, 0.5,
-3.720778, 2, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, 2, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, 2, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, 2, -6.132673, 0, 1.5, 0.5, 0.5,
-3.720778, 3, -6.132673, 0, -0.5, 0.5, 0.5,
-3.720778, 3, -6.132673, 1, -0.5, 0.5, 0.5,
-3.720778, 3, -6.132673, 1, 1.5, 0.5, 0.5,
-3.720778, 3, -6.132673, 0, 1.5, 0.5, 0.5
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
-3.214039, -3.172506, -4,
-3.214039, -3.172506, 4,
-3.214039, -3.172506, -4,
-3.382952, -3.332686, -4,
-3.214039, -3.172506, -2,
-3.382952, -3.332686, -2,
-3.214039, -3.172506, 0,
-3.382952, -3.332686, 0,
-3.214039, -3.172506, 2,
-3.382952, -3.332686, 2,
-3.214039, -3.172506, 4,
-3.382952, -3.332686, 4
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
-3.720778, -3.653046, -4, 0, -0.5, 0.5, 0.5,
-3.720778, -3.653046, -4, 1, -0.5, 0.5, 0.5,
-3.720778, -3.653046, -4, 1, 1.5, 0.5, 0.5,
-3.720778, -3.653046, -4, 0, 1.5, 0.5, 0.5,
-3.720778, -3.653046, -2, 0, -0.5, 0.5, 0.5,
-3.720778, -3.653046, -2, 1, -0.5, 0.5, 0.5,
-3.720778, -3.653046, -2, 1, 1.5, 0.5, 0.5,
-3.720778, -3.653046, -2, 0, 1.5, 0.5, 0.5,
-3.720778, -3.653046, 0, 0, -0.5, 0.5, 0.5,
-3.720778, -3.653046, 0, 1, -0.5, 0.5, 0.5,
-3.720778, -3.653046, 0, 1, 1.5, 0.5, 0.5,
-3.720778, -3.653046, 0, 0, 1.5, 0.5, 0.5,
-3.720778, -3.653046, 2, 0, -0.5, 0.5, 0.5,
-3.720778, -3.653046, 2, 1, -0.5, 0.5, 0.5,
-3.720778, -3.653046, 2, 1, 1.5, 0.5, 0.5,
-3.720778, -3.653046, 2, 0, 1.5, 0.5, 0.5,
-3.720778, -3.653046, 4, 0, -0.5, 0.5, 0.5,
-3.720778, -3.653046, 4, 1, -0.5, 0.5, 0.5,
-3.720778, -3.653046, 4, 1, 1.5, 0.5, 0.5,
-3.720778, -3.653046, 4, 0, 1.5, 0.5, 0.5
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
-3.214039, -3.172506, -5.303083,
-3.214039, 3.234691, -5.303083,
-3.214039, -3.172506, 5.758109,
-3.214039, 3.234691, 5.758109,
-3.214039, -3.172506, -5.303083,
-3.214039, -3.172506, 5.758109,
-3.214039, 3.234691, -5.303083,
-3.214039, 3.234691, 5.758109,
-3.214039, -3.172506, -5.303083,
3.542488, -3.172506, -5.303083,
-3.214039, -3.172506, 5.758109,
3.542488, -3.172506, 5.758109,
-3.214039, 3.234691, -5.303083,
3.542488, 3.234691, -5.303083,
-3.214039, 3.234691, 5.758109,
3.542488, 3.234691, 5.758109,
3.542488, -3.172506, -5.303083,
3.542488, 3.234691, -5.303083,
3.542488, -3.172506, 5.758109,
3.542488, 3.234691, 5.758109,
3.542488, -3.172506, -5.303083,
3.542488, -3.172506, 5.758109,
3.542488, 3.234691, -5.303083,
3.542488, 3.234691, 5.758109
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
var radius = 7.720643;
var distance = 34.35001;
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
mvMatrix.translate( -0.1642249, -0.03109264, -0.2275128 );
mvMatrix.scale( 1.235503, 1.302865, 0.7546845 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.35001);
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
arsenate_lead_arsena<-read.table("arsenate_lead_arsena.xyz")
```

```
## Error in read.table("arsenate_lead_arsena.xyz"): no lines available in input
```

```r
x<-arsenate_lead_arsena$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsenate_lead_arsena' not found
```

```r
y<-arsenate_lead_arsena$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsenate_lead_arsena' not found
```

```r
z<-arsenate_lead_arsena$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsenate_lead_arsena' not found
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
-3.115643, -1.522232, -0.9488231, 0, 0, 1, 1, 1,
-2.743075, -1.047962, -3.248374, 1, 0, 0, 1, 1,
-2.632741, -2.145916, -3.412011, 1, 0, 0, 1, 1,
-2.541908, 1.183604, -0.3611391, 1, 0, 0, 1, 1,
-2.41867, 0.5235957, -0.7556822, 1, 0, 0, 1, 1,
-2.413517, -0.2512864, -0.7753939, 1, 0, 0, 1, 1,
-2.371922, -0.4206358, -2.420741, 0, 0, 0, 1, 1,
-2.333005, 1.318913, -1.277538, 0, 0, 0, 1, 1,
-2.284171, 0.02143622, -1.717516, 0, 0, 0, 1, 1,
-2.18918, 1.135078, -1.110436, 0, 0, 0, 1, 1,
-2.139986, 0.4516921, -1.322939, 0, 0, 0, 1, 1,
-2.113106, 0.8585533, -1.687772, 0, 0, 0, 1, 1,
-2.087267, -0.9977357, -1.094482, 0, 0, 0, 1, 1,
-2.034342, 0.6690859, 0.01422709, 1, 1, 1, 1, 1,
-2.027135, -1.478679, -1.723796, 1, 1, 1, 1, 1,
-2.00491, -0.6736644, -2.888619, 1, 1, 1, 1, 1,
-1.993458, -0.7031134, -0.6221136, 1, 1, 1, 1, 1,
-1.956048, -0.5061216, -0.7676146, 1, 1, 1, 1, 1,
-1.949813, -1.823998, -2.489627, 1, 1, 1, 1, 1,
-1.927671, 0.8740432, -0.8058724, 1, 1, 1, 1, 1,
-1.921099, 0.01300586, -0.4506003, 1, 1, 1, 1, 1,
-1.913448, 0.1288128, -1.282614, 1, 1, 1, 1, 1,
-1.854107, -0.4946715, -1.636101, 1, 1, 1, 1, 1,
-1.843177, 0.7256761, 0.5533358, 1, 1, 1, 1, 1,
-1.827723, -0.7009249, -2.896836, 1, 1, 1, 1, 1,
-1.826975, -1.17636, -2.468312, 1, 1, 1, 1, 1,
-1.82288, -0.4428654, -0.3655527, 1, 1, 1, 1, 1,
-1.820531, -0.1092911, -0.3108199, 1, 1, 1, 1, 1,
-1.815765, -0.3343053, -2.305211, 0, 0, 1, 1, 1,
-1.810426, 0.09572276, -2.41228, 1, 0, 0, 1, 1,
-1.803996, -1.048855, -2.590228, 1, 0, 0, 1, 1,
-1.784116, -0.8778012, -2.081556, 1, 0, 0, 1, 1,
-1.784116, -0.9881773, -2.708182, 1, 0, 0, 1, 1,
-1.77116, -1.202743, -3.387081, 1, 0, 0, 1, 1,
-1.759684, 0.2879702, -0.5990872, 0, 0, 0, 1, 1,
-1.757894, 0.6025223, -1.059444, 0, 0, 0, 1, 1,
-1.746875, -0.1949121, 0.1872071, 0, 0, 0, 1, 1,
-1.740597, -0.7401808, -1.269072, 0, 0, 0, 1, 1,
-1.738841, -1.118489, -2.90902, 0, 0, 0, 1, 1,
-1.727199, -0.4533336, -1.527194, 0, 0, 0, 1, 1,
-1.710253, -0.9271964, -2.564187, 0, 0, 0, 1, 1,
-1.658266, -0.3587975, -0.1053089, 1, 1, 1, 1, 1,
-1.65565, 0.2141877, -0.6043478, 1, 1, 1, 1, 1,
-1.647754, -0.8674517, -2.382639, 1, 1, 1, 1, 1,
-1.647476, -0.2657244, -1.872754, 1, 1, 1, 1, 1,
-1.646037, -0.8072301, -1.196743, 1, 1, 1, 1, 1,
-1.643256, 2.292485, -0.02700039, 1, 1, 1, 1, 1,
-1.636161, 1.317718, -1.096341, 1, 1, 1, 1, 1,
-1.602864, 0.1423766, -1.646541, 1, 1, 1, 1, 1,
-1.595961, -0.6407753, -1.040744, 1, 1, 1, 1, 1,
-1.574826, -0.1812069, -0.6095397, 1, 1, 1, 1, 1,
-1.574823, -1.118253, -3.511462, 1, 1, 1, 1, 1,
-1.574351, -0.2114789, -2.860243, 1, 1, 1, 1, 1,
-1.570364, -0.3696556, -3.035347, 1, 1, 1, 1, 1,
-1.569395, 0.2707206, -1.83819, 1, 1, 1, 1, 1,
-1.557437, -0.7953861, -2.819037, 1, 1, 1, 1, 1,
-1.549649, -0.07610179, -2.251464, 0, 0, 1, 1, 1,
-1.51676, -0.381688, -3.126918, 1, 0, 0, 1, 1,
-1.507256, 1.31965, -0.2600796, 1, 0, 0, 1, 1,
-1.506119, -0.1260051, -0.5023814, 1, 0, 0, 1, 1,
-1.501508, 0.8385734, -1.053313, 1, 0, 0, 1, 1,
-1.497502, 0.8434939, -1.436474, 1, 0, 0, 1, 1,
-1.485732, 0.3623687, -1.953977, 0, 0, 0, 1, 1,
-1.467828, -1.652392, -2.91059, 0, 0, 0, 1, 1,
-1.467703, 1.640506, -0.7134621, 0, 0, 0, 1, 1,
-1.465437, -0.6511157, -2.901611, 0, 0, 0, 1, 1,
-1.464877, 1.112048, -0.7438762, 0, 0, 0, 1, 1,
-1.456275, 0.4376646, -0.1116941, 0, 0, 0, 1, 1,
-1.445536, -0.5993733, -2.896074, 0, 0, 0, 1, 1,
-1.432729, 0.002777662, -0.8643341, 1, 1, 1, 1, 1,
-1.40488, 0.7682207, -1.427366, 1, 1, 1, 1, 1,
-1.372488, 0.3594991, -1.088493, 1, 1, 1, 1, 1,
-1.372103, 2.665365, -1.044335, 1, 1, 1, 1, 1,
-1.37187, -1.135947, -1.64951, 1, 1, 1, 1, 1,
-1.367459, -1.450563, -2.361626, 1, 1, 1, 1, 1,
-1.358537, -0.3958397, -2.197915, 1, 1, 1, 1, 1,
-1.353658, 0.03389633, -0.5822415, 1, 1, 1, 1, 1,
-1.347921, 0.5339247, -1.618146, 1, 1, 1, 1, 1,
-1.345406, 0.6318092, -2.002362, 1, 1, 1, 1, 1,
-1.344389, 0.01470158, -1.081935, 1, 1, 1, 1, 1,
-1.33863, 1.123583, -0.2331498, 1, 1, 1, 1, 1,
-1.329112, -0.9065945, -1.623164, 1, 1, 1, 1, 1,
-1.326921, 1.412984, 0.1358613, 1, 1, 1, 1, 1,
-1.325925, -1.34789, -3.198713, 1, 1, 1, 1, 1,
-1.313942, -0.6826081, -1.928012, 0, 0, 1, 1, 1,
-1.310837, -0.3331304, -0.64617, 1, 0, 0, 1, 1,
-1.300777, -0.6273283, -3.346437, 1, 0, 0, 1, 1,
-1.293255, -0.4028521, -1.280135, 1, 0, 0, 1, 1,
-1.289967, 0.7688782, -1.849377, 1, 0, 0, 1, 1,
-1.276323, 0.9752207, 0.1320433, 1, 0, 0, 1, 1,
-1.26544, 0.3303254, -1.06266, 0, 0, 0, 1, 1,
-1.260145, -1.082556, -2.474966, 0, 0, 0, 1, 1,
-1.242144, -0.2454133, -1.753584, 0, 0, 0, 1, 1,
-1.229458, 1.833323, -0.305084, 0, 0, 0, 1, 1,
-1.221478, -0.6247714, -2.887666, 0, 0, 0, 1, 1,
-1.219553, -0.04782034, 0.09068025, 0, 0, 0, 1, 1,
-1.210696, -0.2678469, -1.526911, 0, 0, 0, 1, 1,
-1.207559, 0.7098778, -1.816271, 1, 1, 1, 1, 1,
-1.203639, -1.16172, -2.757869, 1, 1, 1, 1, 1,
-1.20195, 0.2823776, -0.7803643, 1, 1, 1, 1, 1,
-1.195593, -0.2098499, -1.697593, 1, 1, 1, 1, 1,
-1.18944, 0.3125017, 0.560751, 1, 1, 1, 1, 1,
-1.188982, -1.83397, -2.013874, 1, 1, 1, 1, 1,
-1.186218, -1.800632, -3.245548, 1, 1, 1, 1, 1,
-1.182335, -0.2959346, -2.989218, 1, 1, 1, 1, 1,
-1.180891, 0.26833, -0.6295698, 1, 1, 1, 1, 1,
-1.156423, -0.1162881, -1.575736, 1, 1, 1, 1, 1,
-1.156399, 0.06040718, 0.5982363, 1, 1, 1, 1, 1,
-1.152349, 1.77565, 1.0174, 1, 1, 1, 1, 1,
-1.145952, 1.482352, -0.4212315, 1, 1, 1, 1, 1,
-1.145325, 0.4011852, -2.668585, 1, 1, 1, 1, 1,
-1.143985, -0.6751561, -2.184671, 1, 1, 1, 1, 1,
-1.14296, 0.5944403, -0.8188777, 0, 0, 1, 1, 1,
-1.119869, 0.9996448, -0.9789765, 1, 0, 0, 1, 1,
-1.119492, 0.3030055, -2.243701, 1, 0, 0, 1, 1,
-1.115711, -0.3635477, -1.143486, 1, 0, 0, 1, 1,
-1.114874, 0.1912258, -2.098425, 1, 0, 0, 1, 1,
-1.114128, 0.4043414, -0.9435087, 1, 0, 0, 1, 1,
-1.113343, 0.1222598, -1.914127, 0, 0, 0, 1, 1,
-1.110247, 0.05879813, -0.2933101, 0, 0, 0, 1, 1,
-1.109801, 0.3204609, 0.08727363, 0, 0, 0, 1, 1,
-1.107561, 0.8140171, -0.2088975, 0, 0, 0, 1, 1,
-1.105232, -0.1169304, -1.514074, 0, 0, 0, 1, 1,
-1.103631, -0.07133459, -1.46104, 0, 0, 0, 1, 1,
-1.093868, -0.5839581, -1.898866, 0, 0, 0, 1, 1,
-1.093815, -0.7844788, -0.7738025, 1, 1, 1, 1, 1,
-1.089853, -1.294652, -2.7354, 1, 1, 1, 1, 1,
-1.083805, -0.3759972, -1.976406, 1, 1, 1, 1, 1,
-1.083371, -0.0221581, -1.32034, 1, 1, 1, 1, 1,
-1.077335, -0.7427808, -2.78415, 1, 1, 1, 1, 1,
-1.070152, -1.13193, -1.64819, 1, 1, 1, 1, 1,
-1.066975, -1.395535, -1.81125, 1, 1, 1, 1, 1,
-1.061713, -0.06809643, 0.3161327, 1, 1, 1, 1, 1,
-1.0587, 0.2407149, -0.9189398, 1, 1, 1, 1, 1,
-1.056909, 0.9282709, -0.1940999, 1, 1, 1, 1, 1,
-1.043363, -0.2346353, -1.292309, 1, 1, 1, 1, 1,
-1.039692, -0.6808159, 0.01674616, 1, 1, 1, 1, 1,
-1.037855, 0.6974044, 0.453665, 1, 1, 1, 1, 1,
-1.035222, 0.2399451, -2.005767, 1, 1, 1, 1, 1,
-1.031293, 0.536845, -0.4881364, 1, 1, 1, 1, 1,
-1.028924, -0.9870901, -2.063613, 0, 0, 1, 1, 1,
-1.014746, -0.1037217, -1.060375, 1, 0, 0, 1, 1,
-1.012501, -0.4019414, -3.977037, 1, 0, 0, 1, 1,
-1.012362, 1.518061, -0.5659983, 1, 0, 0, 1, 1,
-1.010623, 0.5021148, -0.7811071, 1, 0, 0, 1, 1,
-1.004436, 2.128579, 0.08300802, 1, 0, 0, 1, 1,
-0.9978703, 0.8177001, 0.8309402, 0, 0, 0, 1, 1,
-0.9916493, 1.294827, -1.230721, 0, 0, 0, 1, 1,
-0.9904499, -0.5341674, -2.858571, 0, 0, 0, 1, 1,
-0.9893221, -0.7335638, -2.029521, 0, 0, 0, 1, 1,
-0.982005, 0.02039036, -2.066631, 0, 0, 0, 1, 1,
-0.9650347, 0.7248372, -1.573159, 0, 0, 0, 1, 1,
-0.9578146, -0.4339125, -3.864877, 0, 0, 0, 1, 1,
-0.9576786, 0.1778184, -2.459206, 1, 1, 1, 1, 1,
-0.9427817, 0.6167927, -2.156894, 1, 1, 1, 1, 1,
-0.9426314, 0.05628025, -2.267006, 1, 1, 1, 1, 1,
-0.9416895, 0.2263856, -1.624584, 1, 1, 1, 1, 1,
-0.937678, 2.130396, 0.0341646, 1, 1, 1, 1, 1,
-0.9342421, 1.006514, 0.4572271, 1, 1, 1, 1, 1,
-0.9298454, 0.5868632, -1.555769, 1, 1, 1, 1, 1,
-0.9274888, -0.02870342, -0.493319, 1, 1, 1, 1, 1,
-0.9273331, 1.021146, -0.1628195, 1, 1, 1, 1, 1,
-0.9263162, 0.1155331, -1.77929, 1, 1, 1, 1, 1,
-0.9259043, 0.1873756, -1.624484, 1, 1, 1, 1, 1,
-0.9258379, 0.2960508, -1.228156, 1, 1, 1, 1, 1,
-0.9250306, 1.191629, 0.3918917, 1, 1, 1, 1, 1,
-0.9141302, -0.9147694, -2.872647, 1, 1, 1, 1, 1,
-0.912205, -1.167986, -2.655799, 1, 1, 1, 1, 1,
-0.9090267, 0.4394458, -2.207999, 0, 0, 1, 1, 1,
-0.9076775, -1.115142, -2.008273, 1, 0, 0, 1, 1,
-0.9023954, -0.151494, -1.566074, 1, 0, 0, 1, 1,
-0.8973671, 0.6409282, -2.478451, 1, 0, 0, 1, 1,
-0.8912638, 0.3247296, -1.239155, 1, 0, 0, 1, 1,
-0.8897388, 1.587919, -0.2999026, 1, 0, 0, 1, 1,
-0.8880817, -0.4580199, -2.403823, 0, 0, 0, 1, 1,
-0.8860946, -1.504954, -2.551903, 0, 0, 0, 1, 1,
-0.877598, -0.09231082, -0.7288248, 0, 0, 0, 1, 1,
-0.8765718, 0.3790598, -0.4110422, 0, 0, 0, 1, 1,
-0.8728091, -1.478944, -3.605397, 0, 0, 0, 1, 1,
-0.866241, 0.1726035, -0.46672, 0, 0, 0, 1, 1,
-0.8635322, -0.7621254, -1.16371, 0, 0, 0, 1, 1,
-0.8603324, -2.092361, -4.394259, 1, 1, 1, 1, 1,
-0.8602759, 1.052071, -1.397648, 1, 1, 1, 1, 1,
-0.854118, 0.3611026, -0.8982536, 1, 1, 1, 1, 1,
-0.8537802, -1.293938, -0.6911296, 1, 1, 1, 1, 1,
-0.8511268, -2.019596, -3.616258, 1, 1, 1, 1, 1,
-0.8499424, 0.3220147, -1.487077, 1, 1, 1, 1, 1,
-0.8489671, -1.791077, -2.56539, 1, 1, 1, 1, 1,
-0.847827, -1.330949, -1.096646, 1, 1, 1, 1, 1,
-0.8398663, -0.3340293, -3.953305, 1, 1, 1, 1, 1,
-0.8310499, 0.02895807, -1.246912, 1, 1, 1, 1, 1,
-0.830811, -0.3778429, -2.33618, 1, 1, 1, 1, 1,
-0.829499, 1.010532, 1.4878, 1, 1, 1, 1, 1,
-0.828877, 0.03862045, -1.606446, 1, 1, 1, 1, 1,
-0.8288428, 3.141383, -0.4088439, 1, 1, 1, 1, 1,
-0.8177411, 1.513806, -1.566914, 1, 1, 1, 1, 1,
-0.8147025, -0.4966718, -4.583025, 0, 0, 1, 1, 1,
-0.8117003, 0.7992589, -2.457945, 1, 0, 0, 1, 1,
-0.809177, -0.1549969, -0.4150403, 1, 0, 0, 1, 1,
-0.8070599, -0.02532643, -3.313845, 1, 0, 0, 1, 1,
-0.8017709, -0.7401867, -1.506957, 1, 0, 0, 1, 1,
-0.7986161, -0.8712151, -3.369003, 1, 0, 0, 1, 1,
-0.7965639, -0.3753907, -2.777474, 0, 0, 0, 1, 1,
-0.7951598, -0.9012437, -2.699205, 0, 0, 0, 1, 1,
-0.782623, -0.2266267, -2.161055, 0, 0, 0, 1, 1,
-0.7785411, -1.41329, -2.794749, 0, 0, 0, 1, 1,
-0.7783533, 0.02441244, -1.253306, 0, 0, 0, 1, 1,
-0.7744124, 0.47833, -1.476705, 0, 0, 0, 1, 1,
-0.7742602, 0.500501, -0.2222059, 0, 0, 0, 1, 1,
-0.7706116, 0.1634478, -0.5691533, 1, 1, 1, 1, 1,
-0.7680526, -0.8202142, -4.99395, 1, 1, 1, 1, 1,
-0.7656074, 0.9255313, -0.9568488, 1, 1, 1, 1, 1,
-0.7634295, -0.8088511, -1.942863, 1, 1, 1, 1, 1,
-0.7604865, 0.2013895, -1.131162, 1, 1, 1, 1, 1,
-0.7538407, 2.709943, -0.8127005, 1, 1, 1, 1, 1,
-0.7470204, 0.3602274, -3.202379, 1, 1, 1, 1, 1,
-0.7436684, -0.751438, -0.9901333, 1, 1, 1, 1, 1,
-0.7338192, -0.2035352, -0.7790048, 1, 1, 1, 1, 1,
-0.7336603, 0.3915335, -0.7576827, 1, 1, 1, 1, 1,
-0.7298605, 1.887669, -1.240868, 1, 1, 1, 1, 1,
-0.728681, 1.916521, -0.9114904, 1, 1, 1, 1, 1,
-0.727974, 0.6150229, -1.379389, 1, 1, 1, 1, 1,
-0.7274295, -1.183565, -3.105575, 1, 1, 1, 1, 1,
-0.723846, 1.873397, 1.282756, 1, 1, 1, 1, 1,
-0.72351, -0.9575177, -2.733398, 0, 0, 1, 1, 1,
-0.7231131, -0.1391561, -1.811666, 1, 0, 0, 1, 1,
-0.7203456, 0.5097843, -2.17727, 1, 0, 0, 1, 1,
-0.7197413, -0.4367661, -0.5839021, 1, 0, 0, 1, 1,
-0.7134791, 0.245572, 0.4379653, 1, 0, 0, 1, 1,
-0.711858, -1.011582, -4.285361, 1, 0, 0, 1, 1,
-0.7086797, -0.7606165, -3.802308, 0, 0, 0, 1, 1,
-0.7076707, 2.048419, -0.1200391, 0, 0, 0, 1, 1,
-0.7039779, 0.5762523, -1.368285, 0, 0, 0, 1, 1,
-0.7024746, -0.1778712, -1.196216, 0, 0, 0, 1, 1,
-0.70029, 0.5682888, 0.1912327, 0, 0, 0, 1, 1,
-0.6955034, -1.176801, -3.783061, 0, 0, 0, 1, 1,
-0.6948788, -0.2213411, -0.5587099, 0, 0, 0, 1, 1,
-0.6898016, 0.7773509, -0.6933346, 1, 1, 1, 1, 1,
-0.6889325, 0.3958969, -2.331173, 1, 1, 1, 1, 1,
-0.6868618, -1.548671, -2.293622, 1, 1, 1, 1, 1,
-0.6845115, -0.4387212, -1.096069, 1, 1, 1, 1, 1,
-0.6811393, 1.263182, -0.716032, 1, 1, 1, 1, 1,
-0.675399, 0.9521986, -1.132758, 1, 1, 1, 1, 1,
-0.6712279, -0.5482407, -1.174202, 1, 1, 1, 1, 1,
-0.6700415, -0.2629944, -1.531711, 1, 1, 1, 1, 1,
-0.6653978, 1.212713, -1.28417, 1, 1, 1, 1, 1,
-0.6647931, -0.2726139, -1.547169, 1, 1, 1, 1, 1,
-0.6627066, 1.050071, -0.7443396, 1, 1, 1, 1, 1,
-0.6615855, 1.426433, -0.9457465, 1, 1, 1, 1, 1,
-0.6609651, 0.0137504, -2.03351, 1, 1, 1, 1, 1,
-0.6601111, 0.1153979, 0.173979, 1, 1, 1, 1, 1,
-0.6555535, -0.4958884, -3.648996, 1, 1, 1, 1, 1,
-0.6548827, 1.157584, 1.037347, 0, 0, 1, 1, 1,
-0.6522723, -0.683778, -2.838386, 1, 0, 0, 1, 1,
-0.6508593, 1.662201, -0.9122, 1, 0, 0, 1, 1,
-0.6480963, 0.1990937, -2.816561, 1, 0, 0, 1, 1,
-0.6476843, -2.597727, -3.217067, 1, 0, 0, 1, 1,
-0.6471047, -1.051783, -1.284157, 1, 0, 0, 1, 1,
-0.6463987, 0.105116, -0.7265522, 0, 0, 0, 1, 1,
-0.6437752, 0.1596511, -1.016856, 0, 0, 0, 1, 1,
-0.6390413, -0.8518612, -0.212543, 0, 0, 0, 1, 1,
-0.6361586, -0.2028667, -2.20692, 0, 0, 0, 1, 1,
-0.6351088, 1.375809, 0.1453322, 0, 0, 0, 1, 1,
-0.6342608, 0.1474377, -2.676672, 0, 0, 0, 1, 1,
-0.6331896, -1.023676, -2.97124, 0, 0, 0, 1, 1,
-0.6324813, 0.6629569, 0.7844015, 1, 1, 1, 1, 1,
-0.6308401, 0.7856257, 0.1927819, 1, 1, 1, 1, 1,
-0.6243866, -0.8526972, -3.399244, 1, 1, 1, 1, 1,
-0.6242501, 0.6817223, 1.414495, 1, 1, 1, 1, 1,
-0.6241823, -0.3136548, -1.919533, 1, 1, 1, 1, 1,
-0.6235387, 0.7435398, -0.6384816, 1, 1, 1, 1, 1,
-0.6222371, 1.121511, -2.086304, 1, 1, 1, 1, 1,
-0.6220049, 0.9501123, -2.555923, 1, 1, 1, 1, 1,
-0.6159331, 0.8560396, -1.009963, 1, 1, 1, 1, 1,
-0.6118668, -0.05945187, -0.6953617, 1, 1, 1, 1, 1,
-0.610728, 0.0001956378, -2.395324, 1, 1, 1, 1, 1,
-0.6067207, 0.07663176, -0.8579317, 1, 1, 1, 1, 1,
-0.5969671, -0.5836198, -2.930024, 1, 1, 1, 1, 1,
-0.5950451, -0.3704906, -0.7317227, 1, 1, 1, 1, 1,
-0.5919744, 1.158389, -0.711836, 1, 1, 1, 1, 1,
-0.5874563, 1.022422, -2.366446, 0, 0, 1, 1, 1,
-0.5873439, -2.052392, -2.987614, 1, 0, 0, 1, 1,
-0.5793414, 0.4244717, -1.668427, 1, 0, 0, 1, 1,
-0.5764917, -0.3259178, -1.399096, 1, 0, 0, 1, 1,
-0.574322, 0.05238007, -1.127703, 1, 0, 0, 1, 1,
-0.5732879, 0.8079965, -0.9963962, 1, 0, 0, 1, 1,
-0.5713281, -0.307087, -1.296716, 0, 0, 0, 1, 1,
-0.5704691, 0.3207971, -1.03462, 0, 0, 0, 1, 1,
-0.5660881, 0.4430016, 0.1861053, 0, 0, 0, 1, 1,
-0.5615119, -2.005831, -3.180142, 0, 0, 0, 1, 1,
-0.5609345, 1.034364, 0.4107221, 0, 0, 0, 1, 1,
-0.5595829, 1.209227, -0.9676627, 0, 0, 0, 1, 1,
-0.5576751, 0.2375755, -1.217513, 0, 0, 0, 1, 1,
-0.5542306, 1.117859, -0.145779, 1, 1, 1, 1, 1,
-0.5477749, 0.06312376, -2.392586, 1, 1, 1, 1, 1,
-0.5475816, -0.3526164, -1.630701, 1, 1, 1, 1, 1,
-0.5464341, 0.4470027, -1.889737, 1, 1, 1, 1, 1,
-0.5417983, -0.3834864, -1.04655, 1, 1, 1, 1, 1,
-0.539779, 2.214703, 0.1708097, 1, 1, 1, 1, 1,
-0.5384326, -0.31015, -2.998522, 1, 1, 1, 1, 1,
-0.5337407, 1.366197, -0.6360005, 1, 1, 1, 1, 1,
-0.5315213, -1.656478, -2.117797, 1, 1, 1, 1, 1,
-0.5308781, -1.871382, -1.900711, 1, 1, 1, 1, 1,
-0.5297076, -0.5476671, -2.671532, 1, 1, 1, 1, 1,
-0.5268609, 0.2777055, -0.7335683, 1, 1, 1, 1, 1,
-0.5044301, 0.1183803, -0.1930751, 1, 1, 1, 1, 1,
-0.5043558, 0.3013406, -1.953339, 1, 1, 1, 1, 1,
-0.5029336, 0.2393023, -0.6077183, 1, 1, 1, 1, 1,
-0.4991382, 1.17482, 0.9811536, 0, 0, 1, 1, 1,
-0.4940527, -0.7240692, -1.330687, 1, 0, 0, 1, 1,
-0.491902, -1.391511, -3.312893, 1, 0, 0, 1, 1,
-0.4856365, -0.4022435, -1.012799, 1, 0, 0, 1, 1,
-0.4831069, 0.2208483, -1.180807, 1, 0, 0, 1, 1,
-0.4826245, 2.078652, -0.7405844, 1, 0, 0, 1, 1,
-0.4822034, 0.1326598, -0.1317882, 0, 0, 0, 1, 1,
-0.4814291, 0.5962597, -2.316178, 0, 0, 0, 1, 1,
-0.4808671, -0.5275403, -3.962864, 0, 0, 0, 1, 1,
-0.4806524, 1.832223, 0.6424812, 0, 0, 0, 1, 1,
-0.4784933, -1.256469, -3.165286, 0, 0, 0, 1, 1,
-0.4779017, 0.6708049, 0.2263802, 0, 0, 0, 1, 1,
-0.4776343, -0.7882851, -3.595504, 0, 0, 0, 1, 1,
-0.4748259, 1.072403, 1.449451, 1, 1, 1, 1, 1,
-0.4736603, 1.554279, -0.524666, 1, 1, 1, 1, 1,
-0.4727834, -1.28674, -2.234888, 1, 1, 1, 1, 1,
-0.4718545, 0.8865851, -0.8578143, 1, 1, 1, 1, 1,
-0.4683033, 0.06855363, -1.5312, 1, 1, 1, 1, 1,
-0.4657921, 0.9418088, -1.330667, 1, 1, 1, 1, 1,
-0.4650339, 1.034435, 0.3770516, 1, 1, 1, 1, 1,
-0.4648497, -0.3973817, 0.4549444, 1, 1, 1, 1, 1,
-0.4631665, -0.251042, 0.1253139, 1, 1, 1, 1, 1,
-0.4536696, 0.1110557, -1.217066, 1, 1, 1, 1, 1,
-0.4403714, -0.03099394, -1.599166, 1, 1, 1, 1, 1,
-0.4344081, -0.8175454, -3.252599, 1, 1, 1, 1, 1,
-0.4317236, -1.05722, -0.5511447, 1, 1, 1, 1, 1,
-0.4313486, -0.9619785, -1.717032, 1, 1, 1, 1, 1,
-0.4301591, 0.1590102, -1.66354, 1, 1, 1, 1, 1,
-0.4285324, 0.03806027, -1.958801, 0, 0, 1, 1, 1,
-0.427199, -1.284573, -4.258111, 1, 0, 0, 1, 1,
-0.4269488, 0.7904952, -1.116122, 1, 0, 0, 1, 1,
-0.4184184, -0.5439587, -3.265781, 1, 0, 0, 1, 1,
-0.4176002, 1.10208, -1.153142, 1, 0, 0, 1, 1,
-0.4158948, 0.9647739, -0.857515, 1, 0, 0, 1, 1,
-0.415635, -0.8791628, -2.956047, 0, 0, 0, 1, 1,
-0.4152507, 0.1041901, 0.1794123, 0, 0, 0, 1, 1,
-0.4079088, -1.107279, -2.268584, 0, 0, 0, 1, 1,
-0.4050805, 0.4837024, -1.444201, 0, 0, 0, 1, 1,
-0.4024253, 0.4852114, -0.8846213, 0, 0, 0, 1, 1,
-0.3963195, -1.481077, -0.701466, 0, 0, 0, 1, 1,
-0.3954898, 0.4627485, -1.657858, 0, 0, 0, 1, 1,
-0.3915607, -0.3671982, -3.585561, 1, 1, 1, 1, 1,
-0.3913423, -0.2129406, -1.139943, 1, 1, 1, 1, 1,
-0.3902588, 0.4377749, -0.1301131, 1, 1, 1, 1, 1,
-0.3899696, 0.6780666, 0.03587176, 1, 1, 1, 1, 1,
-0.3800174, -0.8704239, -3.334646, 1, 1, 1, 1, 1,
-0.3756977, -1.339677, -4.936435, 1, 1, 1, 1, 1,
-0.372867, -0.2859556, -3.069953, 1, 1, 1, 1, 1,
-0.3672911, 0.667785, -0.2788732, 1, 1, 1, 1, 1,
-0.3659142, -0.2129563, -2.252334, 1, 1, 1, 1, 1,
-0.3630423, -1.850778, -3.838154, 1, 1, 1, 1, 1,
-0.3630244, -0.7560458, -2.055189, 1, 1, 1, 1, 1,
-0.359125, -0.398337, -3.251986, 1, 1, 1, 1, 1,
-0.352823, 0.3689802, -0.3869143, 1, 1, 1, 1, 1,
-0.3500831, -0.2847492, -2.317139, 1, 1, 1, 1, 1,
-0.34909, -0.7492453, -3.058182, 1, 1, 1, 1, 1,
-0.3484021, 0.4861396, -1.804717, 0, 0, 1, 1, 1,
-0.3482514, 0.6337129, -1.521619, 1, 0, 0, 1, 1,
-0.3449224, 1.113906, -0.006546036, 1, 0, 0, 1, 1,
-0.3412448, -0.6708794, -2.048244, 1, 0, 0, 1, 1,
-0.3408508, -0.3201858, -1.580515, 1, 0, 0, 1, 1,
-0.3376901, -0.8281702, -3.798103, 1, 0, 0, 1, 1,
-0.3351087, -0.1476122, -4.098656, 0, 0, 0, 1, 1,
-0.3344928, -0.06499222, -2.377846, 0, 0, 0, 1, 1,
-0.3342802, 1.642882, 0.6495249, 0, 0, 0, 1, 1,
-0.3320422, -2.158117, -1.838585, 0, 0, 0, 1, 1,
-0.3315263, -0.4465791, -2.241438, 0, 0, 0, 1, 1,
-0.3308621, 0.06708542, -1.905043, 0, 0, 0, 1, 1,
-0.330229, -0.05403674, -2.471337, 0, 0, 0, 1, 1,
-0.328628, -0.5800717, -2.357848, 1, 1, 1, 1, 1,
-0.3249612, 0.7798651, 0.09535266, 1, 1, 1, 1, 1,
-0.3216012, -1.746091, -2.209056, 1, 1, 1, 1, 1,
-0.3201222, -0.003062454, -1.609172, 1, 1, 1, 1, 1,
-0.3188643, 1.479048, -0.1871523, 1, 1, 1, 1, 1,
-0.3184927, -0.07483342, -2.543095, 1, 1, 1, 1, 1,
-0.3181813, -1.527769, -2.566968, 1, 1, 1, 1, 1,
-0.3162694, -0.06581695, -0.4014965, 1, 1, 1, 1, 1,
-0.3143142, 0.1777669, -0.6841306, 1, 1, 1, 1, 1,
-0.3083393, 0.115251, 0.6908171, 1, 1, 1, 1, 1,
-0.3065549, -0.6128426, -1.581777, 1, 1, 1, 1, 1,
-0.3054748, 0.9991862, -1.292127, 1, 1, 1, 1, 1,
-0.2984772, -0.1903139, -2.899134, 1, 1, 1, 1, 1,
-0.2937791, 0.4622699, -1.594745, 1, 1, 1, 1, 1,
-0.2855009, 0.6867164, -1.090241, 1, 1, 1, 1, 1,
-0.2848639, 0.4911023, -0.8557011, 0, 0, 1, 1, 1,
-0.2804568, -0.4079083, -1.91663, 1, 0, 0, 1, 1,
-0.2778764, 2.00113, 1.292945, 1, 0, 0, 1, 1,
-0.2732939, 0.67283, 0.207537, 1, 0, 0, 1, 1,
-0.2709016, -0.5563652, -3.061939, 1, 0, 0, 1, 1,
-0.2666169, 0.3702764, -0.935906, 1, 0, 0, 1, 1,
-0.2629078, 2.003744, 0.2052597, 0, 0, 0, 1, 1,
-0.2619579, 0.298036, -0.586417, 0, 0, 0, 1, 1,
-0.2592359, -0.5051185, -3.060361, 0, 0, 0, 1, 1,
-0.2584954, -0.07225648, -2.333739, 0, 0, 0, 1, 1,
-0.2576425, -0.3281221, -1.257081, 0, 0, 0, 1, 1,
-0.2524152, 1.437622, 1.155557, 0, 0, 0, 1, 1,
-0.2507155, 0.8341234, -1.302118, 0, 0, 0, 1, 1,
-0.2502846, -1.383222, -0.9054133, 1, 1, 1, 1, 1,
-0.2360293, 1.543298, -1.163812, 1, 1, 1, 1, 1,
-0.2347299, 0.1975363, -1.444588, 1, 1, 1, 1, 1,
-0.2311638, -0.4965466, -2.905031, 1, 1, 1, 1, 1,
-0.2264809, -0.5377473, -3.092315, 1, 1, 1, 1, 1,
-0.2263487, 1.434301, -2.226233, 1, 1, 1, 1, 1,
-0.2183052, 0.3876602, -0.2024702, 1, 1, 1, 1, 1,
-0.2144233, -0.7815659, -1.294811, 1, 1, 1, 1, 1,
-0.2071129, 1.674542, 2.160602, 1, 1, 1, 1, 1,
-0.2049114, -0.8787246, -4.336521, 1, 1, 1, 1, 1,
-0.2037635, -0.8411205, -4.288636, 1, 1, 1, 1, 1,
-0.1978833, 0.5648637, -1.435928, 1, 1, 1, 1, 1,
-0.1917267, -0.7458779, -2.925581, 1, 1, 1, 1, 1,
-0.1885504, -0.2069442, -2.258368, 1, 1, 1, 1, 1,
-0.1861031, -0.5712116, -3.853517, 1, 1, 1, 1, 1,
-0.1820948, 2.436904, -1.192751, 0, 0, 1, 1, 1,
-0.1807237, -0.1389279, -3.815646, 1, 0, 0, 1, 1,
-0.1805431, -2.162953, -3.650408, 1, 0, 0, 1, 1,
-0.1769855, -0.3434464, -3.388961, 1, 0, 0, 1, 1,
-0.1729596, 0.269702, 0.8301688, 1, 0, 0, 1, 1,
-0.1724548, 0.5238493, -1.445837, 1, 0, 0, 1, 1,
-0.1714027, -0.6837173, -2.053996, 0, 0, 0, 1, 1,
-0.1709722, -0.1125735, -0.8689579, 0, 0, 0, 1, 1,
-0.1696808, 0.05870983, -1.29325, 0, 0, 0, 1, 1,
-0.167974, 1.241719, 0.8205177, 0, 0, 0, 1, 1,
-0.1665932, -0.163927, -1.074201, 0, 0, 0, 1, 1,
-0.1650217, 1.637296, 0.8195972, 0, 0, 0, 1, 1,
-0.1621384, 0.5941713, -0.8834644, 0, 0, 0, 1, 1,
-0.1610318, -1.203339, -3.34974, 1, 1, 1, 1, 1,
-0.1579097, 0.9352912, -0.3964269, 1, 1, 1, 1, 1,
-0.1569283, -0.9815144, -2.366955, 1, 1, 1, 1, 1,
-0.1563829, 1.205073, 0.1138749, 1, 1, 1, 1, 1,
-0.155478, -0.4487015, -3.487014, 1, 1, 1, 1, 1,
-0.1543273, -0.4444724, -2.793524, 1, 1, 1, 1, 1,
-0.1527809, 0.4989406, -0.2356738, 1, 1, 1, 1, 1,
-0.1509489, -0.4552363, -3.020188, 1, 1, 1, 1, 1,
-0.1501101, -1.048066, -2.68673, 1, 1, 1, 1, 1,
-0.1485303, -0.529973, -4.331509, 1, 1, 1, 1, 1,
-0.1447466, 0.05807612, -0.1046536, 1, 1, 1, 1, 1,
-0.1446959, -0.5917365, -2.528652, 1, 1, 1, 1, 1,
-0.1416442, -0.2827424, -2.723743, 1, 1, 1, 1, 1,
-0.1403351, 0.7715192, 0.1486107, 1, 1, 1, 1, 1,
-0.1394016, 1.128045, -0.2274709, 1, 1, 1, 1, 1,
-0.1392767, -0.212473, -3.13111, 0, 0, 1, 1, 1,
-0.1389877, 0.3281862, 0.145174, 1, 0, 0, 1, 1,
-0.1388507, 1.485034, -1.367868, 1, 0, 0, 1, 1,
-0.1328231, -0.8973505, -2.325046, 1, 0, 0, 1, 1,
-0.1325056, 0.8133997, -0.2954765, 1, 0, 0, 1, 1,
-0.1303114, -1.083295, -2.830556, 1, 0, 0, 1, 1,
-0.1209968, -1.461324, -1.861561, 0, 0, 0, 1, 1,
-0.12027, -0.6418959, -3.241233, 0, 0, 0, 1, 1,
-0.1200377, 0.8808174, 0.6069111, 0, 0, 0, 1, 1,
-0.1197611, 1.008781, -1.562438, 0, 0, 0, 1, 1,
-0.1139151, 1.445923, 0.8546181, 0, 0, 0, 1, 1,
-0.1136129, 0.6452714, 0.1930562, 0, 0, 0, 1, 1,
-0.1040033, -1.151731, -1.42723, 0, 0, 0, 1, 1,
-0.09713782, 1.686295, -1.447287, 1, 1, 1, 1, 1,
-0.09616405, -0.3971721, -2.382592, 1, 1, 1, 1, 1,
-0.09423859, -0.417162, -3.632921, 1, 1, 1, 1, 1,
-0.09161276, 0.01374351, -2.898751, 1, 1, 1, 1, 1,
-0.09131736, -1.001676, -4.407967, 1, 1, 1, 1, 1,
-0.08765383, -0.254132, -5.141998, 1, 1, 1, 1, 1,
-0.08666028, -0.5148644, -3.378927, 1, 1, 1, 1, 1,
-0.08245295, -0.4805286, -2.336234, 1, 1, 1, 1, 1,
-0.08137289, -0.153721, -4.097281, 1, 1, 1, 1, 1,
-0.07914554, 0.4908478, -0.9345505, 1, 1, 1, 1, 1,
-0.07852583, 0.6899175, 1.525745, 1, 1, 1, 1, 1,
-0.07810716, -0.3052237, -3.591352, 1, 1, 1, 1, 1,
-0.07342514, 2.108502, -0.08619248, 1, 1, 1, 1, 1,
-0.07234851, 0.5326145, 0.906988, 1, 1, 1, 1, 1,
-0.07225003, -1.104067, -3.377414, 1, 1, 1, 1, 1,
-0.07103334, -1.130581, -3.495205, 0, 0, 1, 1, 1,
-0.0698574, -0.7363262, -2.507863, 1, 0, 0, 1, 1,
-0.06723326, 1.221885, -0.5545655, 1, 0, 0, 1, 1,
-0.06496194, -1.431799, -1.524332, 1, 0, 0, 1, 1,
-0.06042544, 0.6945069, 1.828005, 1, 0, 0, 1, 1,
-0.05928862, -1.849644, -4.487012, 1, 0, 0, 1, 1,
-0.05884352, 0.4517696, -0.3220354, 0, 0, 0, 1, 1,
-0.05850317, -1.187374, -4.938948, 0, 0, 0, 1, 1,
-0.05708153, 2.620822, 2.210394, 0, 0, 0, 1, 1,
-0.05588208, 1.394604, 0.09293419, 0, 0, 0, 1, 1,
-0.05225085, -0.2718951, -2.552408, 0, 0, 0, 1, 1,
-0.04672907, 0.03086966, -1.098958, 0, 0, 0, 1, 1,
-0.04190388, 0.3256137, 1.44591, 0, 0, 0, 1, 1,
-0.039472, 0.379986, -1.634633, 1, 1, 1, 1, 1,
-0.03472941, -1.298869, -4.043189, 1, 1, 1, 1, 1,
-0.03439671, 0.2235162, -0.3078647, 1, 1, 1, 1, 1,
-0.03312112, -0.7084215, -3.035602, 1, 1, 1, 1, 1,
-0.0254212, 0.7849658, -1.126394, 1, 1, 1, 1, 1,
-0.01937426, 1.552344, 1.459584, 1, 1, 1, 1, 1,
-0.0187411, -0.552197, -3.889801, 1, 1, 1, 1, 1,
-0.01646369, 0.8875331, -0.02880372, 1, 1, 1, 1, 1,
-0.01498158, -2.586923, -3.125701, 1, 1, 1, 1, 1,
-0.009724192, 0.9572409, 0.07419258, 1, 1, 1, 1, 1,
-0.004445826, 2.046026, -0.3261421, 1, 1, 1, 1, 1,
-0.001926811, 0.4937252, -1.560618, 1, 1, 1, 1, 1,
0.004865292, -0.6200372, 4.501641, 1, 1, 1, 1, 1,
0.007862922, -0.9058376, 2.224438, 1, 1, 1, 1, 1,
0.008658516, 0.5628, 0.3452929, 1, 1, 1, 1, 1,
0.01160469, -0.5426658, 2.373792, 0, 0, 1, 1, 1,
0.0117906, -1.453977, 3.135042, 1, 0, 0, 1, 1,
0.01273761, -0.3821984, 2.633641, 1, 0, 0, 1, 1,
0.01652934, -1.433132, 3.893292, 1, 0, 0, 1, 1,
0.02112313, 0.4685593, 1.50202, 1, 0, 0, 1, 1,
0.02243702, -1.093516, 1.029259, 1, 0, 0, 1, 1,
0.02330131, 0.03956993, -0.1207783, 0, 0, 0, 1, 1,
0.03214431, 0.1616421, 0.8106523, 0, 0, 0, 1, 1,
0.03477578, -1.927992, 2.765837, 0, 0, 0, 1, 1,
0.03758037, 2.539817, -0.7076547, 0, 0, 0, 1, 1,
0.03891835, 0.6746534, 0.1483719, 0, 0, 0, 1, 1,
0.0416622, -2.549698, 0.8327522, 0, 0, 0, 1, 1,
0.04295414, 1.305523, 0.1213996, 0, 0, 0, 1, 1,
0.04350996, 0.4994907, 2.094774, 1, 1, 1, 1, 1,
0.04394912, 1.430683, 1.170104, 1, 1, 1, 1, 1,
0.04865373, 0.5961908, -1.327824, 1, 1, 1, 1, 1,
0.05314706, -0.4312378, 2.951173, 1, 1, 1, 1, 1,
0.06075929, 1.607687, -1.651878, 1, 1, 1, 1, 1,
0.06102708, -1.91803, 3.369633, 1, 1, 1, 1, 1,
0.06443433, 1.558633, -1.668199, 1, 1, 1, 1, 1,
0.06456365, -0.4073236, 3.97802, 1, 1, 1, 1, 1,
0.0679648, 1.092018, -0.6402597, 1, 1, 1, 1, 1,
0.07006263, -1.471712, 2.981073, 1, 1, 1, 1, 1,
0.07281147, -0.7201685, 1.505145, 1, 1, 1, 1, 1,
0.07641296, -0.7147344, 2.561992, 1, 1, 1, 1, 1,
0.07758015, -0.1713339, 3.217562, 1, 1, 1, 1, 1,
0.07975935, 0.6238145, -0.2894168, 1, 1, 1, 1, 1,
0.08054497, 0.09095683, 0.2561419, 1, 1, 1, 1, 1,
0.08570997, -0.2352154, 4.72825, 0, 0, 1, 1, 1,
0.08579703, 0.5987208, 0.4679224, 1, 0, 0, 1, 1,
0.08978603, -1.262813, 2.909698, 1, 0, 0, 1, 1,
0.09479214, -1.412208, 0.4851966, 1, 0, 0, 1, 1,
0.1037314, 1.162646, 0.397724, 1, 0, 0, 1, 1,
0.1130896, -0.2355721, 4.890698, 1, 0, 0, 1, 1,
0.1181146, -0.0438377, 1.148169, 0, 0, 0, 1, 1,
0.1190239, -0.6886322, 2.763801, 0, 0, 0, 1, 1,
0.1226485, -0.3116427, 2.969425, 0, 0, 0, 1, 1,
0.1250811, -0.5523921, 3.159471, 0, 0, 0, 1, 1,
0.1279937, 0.6251212, -0.1833533, 0, 0, 0, 1, 1,
0.128931, 0.5319957, -0.9479215, 0, 0, 0, 1, 1,
0.134179, -0.0004991667, 1.803972, 0, 0, 0, 1, 1,
0.1360255, 1.830348, -1.080485, 1, 1, 1, 1, 1,
0.1371813, -0.3957006, 2.818044, 1, 1, 1, 1, 1,
0.1392443, 0.03682295, 2.377288, 1, 1, 1, 1, 1,
0.1480095, -0.07172775, 2.918457, 1, 1, 1, 1, 1,
0.1497512, -0.2438048, 2.840888, 1, 1, 1, 1, 1,
0.1499087, -1.063532, 4.652876, 1, 1, 1, 1, 1,
0.1530935, 0.5595414, 1.446913, 1, 1, 1, 1, 1,
0.1548082, 0.8082445, -0.7242309, 1, 1, 1, 1, 1,
0.1566804, -0.01527911, 0.9642459, 1, 1, 1, 1, 1,
0.1669658, 0.6851065, 1.809882, 1, 1, 1, 1, 1,
0.1781562, 0.2059742, 2.268146, 1, 1, 1, 1, 1,
0.1793167, -0.2697452, 1.458923, 1, 1, 1, 1, 1,
0.180933, -0.4540833, 2.608886, 1, 1, 1, 1, 1,
0.1812142, 1.495724, -0.4323163, 1, 1, 1, 1, 1,
0.1847111, 0.4467187, -0.005939628, 1, 1, 1, 1, 1,
0.1847594, -1.763085, 4.314544, 0, 0, 1, 1, 1,
0.1854764, -1.166819, 3.080457, 1, 0, 0, 1, 1,
0.1858243, 1.674921, 0.9922183, 1, 0, 0, 1, 1,
0.1902155, 0.3438074, 1.982043, 1, 0, 0, 1, 1,
0.193719, 0.8818871, 0.4893271, 1, 0, 0, 1, 1,
0.1937323, -0.4814077, 2.33278, 1, 0, 0, 1, 1,
0.1955193, 0.9427233, -0.545423, 0, 0, 0, 1, 1,
0.1966389, 0.628984, -1.293895, 0, 0, 0, 1, 1,
0.196766, -2.192355, 3.729833, 0, 0, 0, 1, 1,
0.1968939, 1.420175, -0.6547164, 0, 0, 0, 1, 1,
0.1971753, 0.3763167, -0.6977174, 0, 0, 0, 1, 1,
0.1971969, 1.040474, 0.5526667, 0, 0, 0, 1, 1,
0.1999401, -0.4694717, 2.497507, 0, 0, 0, 1, 1,
0.2001585, -0.9291443, 4.622242, 1, 1, 1, 1, 1,
0.2006681, -1.03651, 3.406407, 1, 1, 1, 1, 1,
0.2010875, -0.2949439, 1.461131, 1, 1, 1, 1, 1,
0.2090958, 0.0272987, 0.8736406, 1, 1, 1, 1, 1,
0.2155638, -0.4697412, 5.246348, 1, 1, 1, 1, 1,
0.2184561, 0.9823166, 1.472794, 1, 1, 1, 1, 1,
0.2195958, 0.4963716, -0.2480176, 1, 1, 1, 1, 1,
0.224024, 0.07989629, 2.781336, 1, 1, 1, 1, 1,
0.2262174, 0.4093787, 1.198236, 1, 1, 1, 1, 1,
0.2275848, 0.6122294, 0.2996021, 1, 1, 1, 1, 1,
0.2335655, -0.3576983, 3.466217, 1, 1, 1, 1, 1,
0.2337624, 0.5997785, 0.6503286, 1, 1, 1, 1, 1,
0.2371461, 2.046618, -0.1119854, 1, 1, 1, 1, 1,
0.2398545, 0.4489349, -0.5369418, 1, 1, 1, 1, 1,
0.2411133, 0.9629641, -0.332256, 1, 1, 1, 1, 1,
0.2419037, -2.034018, 3.754068, 0, 0, 1, 1, 1,
0.242968, 1.163375, 0.2867913, 1, 0, 0, 1, 1,
0.2450984, -0.216204, 2.854161, 1, 0, 0, 1, 1,
0.2456363, 1.346141, 2.436644, 1, 0, 0, 1, 1,
0.2457166, -0.8688291, 3.03221, 1, 0, 0, 1, 1,
0.2518618, -2.349577, 4.424306, 1, 0, 0, 1, 1,
0.2538781, -1.442469, 0.8855314, 0, 0, 0, 1, 1,
0.2543977, -0.4350925, 1.173733, 0, 0, 0, 1, 1,
0.2558616, -1.802509, 3.459781, 0, 0, 0, 1, 1,
0.2566755, -0.4794147, 2.895802, 0, 0, 0, 1, 1,
0.2604859, -1.917142, 3.065419, 0, 0, 0, 1, 1,
0.2604878, -1.034293, 2.001977, 0, 0, 0, 1, 1,
0.2645819, -1.486431, 2.807119, 0, 0, 0, 1, 1,
0.2657977, -1.000111, 3.58238, 1, 1, 1, 1, 1,
0.2659079, 0.7427796, 0.4682096, 1, 1, 1, 1, 1,
0.2659813, 0.1553451, 2.431004, 1, 1, 1, 1, 1,
0.2718957, 0.9967069, 1.77228, 1, 1, 1, 1, 1,
0.2722234, 1.002244, -0.02703895, 1, 1, 1, 1, 1,
0.2734281, 0.3856752, -0.08666048, 1, 1, 1, 1, 1,
0.2742386, -0.5252301, 2.870967, 1, 1, 1, 1, 1,
0.2744766, 0.9682804, 1.683112, 1, 1, 1, 1, 1,
0.2753235, 0.111941, 2.106242, 1, 1, 1, 1, 1,
0.2763749, -0.4732585, 2.594846, 1, 1, 1, 1, 1,
0.27696, 0.3205247, 1.28106, 1, 1, 1, 1, 1,
0.2829176, 0.5530894, 0.2093944, 1, 1, 1, 1, 1,
0.2896495, 0.552848, 1.746378, 1, 1, 1, 1, 1,
0.2904364, -2.490299, 3.952459, 1, 1, 1, 1, 1,
0.2954671, 0.7256454, 1.108641, 1, 1, 1, 1, 1,
0.2956198, -0.0002003466, 2.013615, 0, 0, 1, 1, 1,
0.2968691, 0.7755831, 0.3715309, 1, 0, 0, 1, 1,
0.2976913, -0.1186763, 1.206539, 1, 0, 0, 1, 1,
0.3023709, 0.3480924, 1.552427, 1, 0, 0, 1, 1,
0.3061932, -0.6730579, 3.115015, 1, 0, 0, 1, 1,
0.3072328, 0.1367424, 1.437764, 1, 0, 0, 1, 1,
0.3081551, 0.423811, -0.3878665, 0, 0, 0, 1, 1,
0.3172204, -0.3107308, 4.448831, 0, 0, 0, 1, 1,
0.3243674, -0.1222642, 2.455041, 0, 0, 0, 1, 1,
0.3285683, 1.099582, 0.6757576, 0, 0, 0, 1, 1,
0.3301367, 0.9161699, 0.9393161, 0, 0, 0, 1, 1,
0.3332663, 0.4284387, 0.7770663, 0, 0, 0, 1, 1,
0.334382, -0.85948, 2.808911, 0, 0, 0, 1, 1,
0.3345167, -1.461961, 2.299144, 1, 1, 1, 1, 1,
0.3433388, 0.0169336, 2.221751, 1, 1, 1, 1, 1,
0.3479705, 1.395, -1.826205, 1, 1, 1, 1, 1,
0.3513075, -0.5642762, 1.985613, 1, 1, 1, 1, 1,
0.3543471, -0.6341818, 0.7536366, 1, 1, 1, 1, 1,
0.3560131, -0.5114866, 4.333896, 1, 1, 1, 1, 1,
0.3602484, 0.8200408, -0.6089267, 1, 1, 1, 1, 1,
0.3620705, 0.158514, -0.653741, 1, 1, 1, 1, 1,
0.3622276, -0.2597689, 2.067679, 1, 1, 1, 1, 1,
0.3632099, -0.08582495, 0.829662, 1, 1, 1, 1, 1,
0.3632108, 0.09022482, 2.060467, 1, 1, 1, 1, 1,
0.3641039, 0.9089641, 1.672733, 1, 1, 1, 1, 1,
0.3672474, -0.4714758, 3.144082, 1, 1, 1, 1, 1,
0.3679122, 0.6788612, -0.2676115, 1, 1, 1, 1, 1,
0.3691031, 0.6169881, -1.916514, 1, 1, 1, 1, 1,
0.3719704, 1.182246, -0.2258461, 0, 0, 1, 1, 1,
0.3827195, -0.5007176, 2.734363, 1, 0, 0, 1, 1,
0.3829777, -0.4835771, 2.52693, 1, 0, 0, 1, 1,
0.3840764, 0.3273559, -0.2734557, 1, 0, 0, 1, 1,
0.3873492, -0.6471407, 2.539447, 1, 0, 0, 1, 1,
0.3887455, 0.7437564, 0.5226745, 1, 0, 0, 1, 1,
0.3980831, 1.962869, -0.438706, 0, 0, 0, 1, 1,
0.4025374, 0.146998, 0.8783189, 0, 0, 0, 1, 1,
0.4055955, -0.9039145, 3.289421, 0, 0, 0, 1, 1,
0.4069796, -0.4010146, 0.5692961, 0, 0, 0, 1, 1,
0.4073691, -0.3810509, 1.535836, 0, 0, 0, 1, 1,
0.4084848, -1.006353, 3.389032, 0, 0, 0, 1, 1,
0.4121274, -1.305784, 3.446445, 0, 0, 0, 1, 1,
0.4193279, -0.6373539, 2.950205, 1, 1, 1, 1, 1,
0.4218182, -1.445013, 4.771894, 1, 1, 1, 1, 1,
0.4238023, -0.2593216, 2.721344, 1, 1, 1, 1, 1,
0.4287718, -0.06003121, 1.552704, 1, 1, 1, 1, 1,
0.4288122, 0.5889928, 0.4737296, 1, 1, 1, 1, 1,
0.4309205, -0.8659644, 1.770847, 1, 1, 1, 1, 1,
0.4318909, 1.31878, 1.010086, 1, 1, 1, 1, 1,
0.4330905, -0.6728327, 0.2738701, 1, 1, 1, 1, 1,
0.4338168, -0.5268238, 1.55385, 1, 1, 1, 1, 1,
0.4365731, 2.087564, 1.353477, 1, 1, 1, 1, 1,
0.4409254, -0.01894275, 0.8541604, 1, 1, 1, 1, 1,
0.4414281, -0.0891692, -0.4292469, 1, 1, 1, 1, 1,
0.4431771, -0.08783241, 3.144428, 1, 1, 1, 1, 1,
0.4448197, 0.2065408, 1.081667, 1, 1, 1, 1, 1,
0.4468963, 0.4340303, -0.1091983, 1, 1, 1, 1, 1,
0.4484164, 0.6450446, 0.04094946, 0, 0, 1, 1, 1,
0.450529, 1.022902, -0.8408806, 1, 0, 0, 1, 1,
0.4507, -0.138341, 1.112006, 1, 0, 0, 1, 1,
0.4548964, -0.6000524, 3.140312, 1, 0, 0, 1, 1,
0.4549542, 0.8231116, 1.643873, 1, 0, 0, 1, 1,
0.4571404, 0.3326471, 1.287187, 1, 0, 0, 1, 1,
0.4586028, 0.1362299, 1.696622, 0, 0, 0, 1, 1,
0.4602064, -1.89839, 2.237968, 0, 0, 0, 1, 1,
0.4625999, -1.85224, 2.958498, 0, 0, 0, 1, 1,
0.4640881, -1.113843, 2.764712, 0, 0, 0, 1, 1,
0.4649277, 0.1969939, 1.867624, 0, 0, 0, 1, 1,
0.4660866, 0.3433541, 1.941868, 0, 0, 0, 1, 1,
0.4696615, -0.1887538, 1.490695, 0, 0, 0, 1, 1,
0.4700424, 0.3879004, 1.039386, 1, 1, 1, 1, 1,
0.471375, -1.182221, 1.568178, 1, 1, 1, 1, 1,
0.4763564, 0.4141172, 2.204963, 1, 1, 1, 1, 1,
0.4770528, 1.077489, -0.9296014, 1, 1, 1, 1, 1,
0.4773003, -2.280805, 2.506685, 1, 1, 1, 1, 1,
0.4788924, 0.1127007, 0.7601693, 1, 1, 1, 1, 1,
0.4805434, 1.276515, -0.0393724, 1, 1, 1, 1, 1,
0.4821852, 1.173892, -1.375367, 1, 1, 1, 1, 1,
0.4822126, -1.009024, 3.337988, 1, 1, 1, 1, 1,
0.4850639, -1.487684, 3.937547, 1, 1, 1, 1, 1,
0.4894667, -1.465405, 2.143967, 1, 1, 1, 1, 1,
0.492182, 0.8875101, 1.092686, 1, 1, 1, 1, 1,
0.4927731, 0.4022974, 0.6260202, 1, 1, 1, 1, 1,
0.4944641, 0.2265414, 1.131371, 1, 1, 1, 1, 1,
0.4969181, -0.7778431, 0.6012941, 1, 1, 1, 1, 1,
0.5014565, -0.5845763, 0.7832815, 0, 0, 1, 1, 1,
0.5043557, 1.148618, -0.9608226, 1, 0, 0, 1, 1,
0.5049514, -0.7977436, 3.517309, 1, 0, 0, 1, 1,
0.5050256, -1.083587, 1.249126, 1, 0, 0, 1, 1,
0.5105875, -2.167651, 3.2035, 1, 0, 0, 1, 1,
0.5122305, -1.494501, 3.354126, 1, 0, 0, 1, 1,
0.5165225, -2.560616, 0.04233107, 0, 0, 0, 1, 1,
0.5208828, -1.104038, 3.097276, 0, 0, 0, 1, 1,
0.5227759, 0.07155647, 0.1236956, 0, 0, 0, 1, 1,
0.5231029, 0.4404533, 2.116656, 0, 0, 0, 1, 1,
0.5241693, -1.686266, 3.375674, 0, 0, 0, 1, 1,
0.5272404, 0.4601365, 2.093317, 0, 0, 0, 1, 1,
0.5310875, 0.5608007, 1.287009, 0, 0, 0, 1, 1,
0.5320933, -1.708836, 3.801184, 1, 1, 1, 1, 1,
0.5357174, -1.239654, 2.591741, 1, 1, 1, 1, 1,
0.5383472, -1.2401, 1.590818, 1, 1, 1, 1, 1,
0.5399508, 1.152606, 1.328595, 1, 1, 1, 1, 1,
0.5422077, -1.46561, 2.832249, 1, 1, 1, 1, 1,
0.5430717, -0.05464947, 0.657459, 1, 1, 1, 1, 1,
0.5489153, 0.7061509, 0.9193234, 1, 1, 1, 1, 1,
0.5509014, -0.521659, 1.646331, 1, 1, 1, 1, 1,
0.5520657, 0.5703108, 2.27981, 1, 1, 1, 1, 1,
0.5548414, 0.3018341, 0.7643941, 1, 1, 1, 1, 1,
0.5579039, -0.8771052, 1.926857, 1, 1, 1, 1, 1,
0.5606322, -1.10505, 4.276398, 1, 1, 1, 1, 1,
0.5625362, 0.2313858, -0.2627158, 1, 1, 1, 1, 1,
0.5672184, 0.09815356, 1.693829, 1, 1, 1, 1, 1,
0.5678399, -1.334363, 0.6721336, 1, 1, 1, 1, 1,
0.5686556, -0.6006696, 3.640978, 0, 0, 1, 1, 1,
0.5692524, 0.6118743, 1.190739, 1, 0, 0, 1, 1,
0.5736587, -0.2018582, 0.5744828, 1, 0, 0, 1, 1,
0.5737512, 1.059204, 0.9396132, 1, 0, 0, 1, 1,
0.5768979, -0.8836538, 2.926582, 1, 0, 0, 1, 1,
0.5780277, 1.123686, -0.4141869, 1, 0, 0, 1, 1,
0.5802647, -1.605184, 1.513151, 0, 0, 0, 1, 1,
0.5804152, 0.3763325, 0.2343984, 0, 0, 0, 1, 1,
0.580528, 0.5372372, -0.01524573, 0, 0, 0, 1, 1,
0.5846253, -1.295322, 3.070843, 0, 0, 0, 1, 1,
0.5960525, 1.101533, -0.08495253, 0, 0, 0, 1, 1,
0.5986156, 1.00684, 0.7595838, 0, 0, 0, 1, 1,
0.6010281, 0.5603862, 1.074425, 0, 0, 0, 1, 1,
0.6027583, -0.8798858, 2.320633, 1, 1, 1, 1, 1,
0.6071879, -3.079197, 5.046766, 1, 1, 1, 1, 1,
0.6137105, -1.085319, 4.740754, 1, 1, 1, 1, 1,
0.6163557, 0.4852122, 0.4949848, 1, 1, 1, 1, 1,
0.6187158, 0.2353188, 0.9967242, 1, 1, 1, 1, 1,
0.6205435, -1.152389, 1.252492, 1, 1, 1, 1, 1,
0.6375615, -1.598364, 0.3446696, 1, 1, 1, 1, 1,
0.6377038, 0.4369836, 1.139993, 1, 1, 1, 1, 1,
0.6386769, 1.678151, -0.07658868, 1, 1, 1, 1, 1,
0.6418437, -0.2547807, 3.799869, 1, 1, 1, 1, 1,
0.6428137, -0.4605058, 1.711451, 1, 1, 1, 1, 1,
0.647058, -1.500956, 2.751727, 1, 1, 1, 1, 1,
0.6496671, 0.1328008, 1.252609, 1, 1, 1, 1, 1,
0.6528369, -1.457646, 3.099461, 1, 1, 1, 1, 1,
0.6550874, -2.162946, 3.063004, 1, 1, 1, 1, 1,
0.6558695, -0.3653679, 2.254313, 0, 0, 1, 1, 1,
0.6567681, 0.0899566, 1.170688, 1, 0, 0, 1, 1,
0.6592405, -1.068351, 2.312694, 1, 0, 0, 1, 1,
0.6622152, -0.1353258, 2.377939, 1, 0, 0, 1, 1,
0.676292, -0.3086636, 1.602438, 1, 0, 0, 1, 1,
0.6774273, -0.6017832, 1.753821, 1, 0, 0, 1, 1,
0.6846607, 0.7928462, -1.368093, 0, 0, 0, 1, 1,
0.6848835, -0.3810543, 2.615768, 0, 0, 0, 1, 1,
0.6920783, -0.7459178, 3.28263, 0, 0, 0, 1, 1,
0.7060066, -1.300017, 5.597024, 0, 0, 0, 1, 1,
0.7146552, -0.6867092, 4.222691, 0, 0, 0, 1, 1,
0.7160487, -0.2221095, 0.7683499, 0, 0, 0, 1, 1,
0.7191291, -0.3977036, 1.751018, 0, 0, 0, 1, 1,
0.7259167, 0.2233717, 0.9433461, 1, 1, 1, 1, 1,
0.7362415, -0.7909168, 2.308422, 1, 1, 1, 1, 1,
0.737251, 0.9727838, 1.609197, 1, 1, 1, 1, 1,
0.7446747, 0.8971959, 1.410696, 1, 1, 1, 1, 1,
0.7459653, 0.08434478, 0.5301919, 1, 1, 1, 1, 1,
0.7484681, 0.2620431, 2.217276, 1, 1, 1, 1, 1,
0.7529192, 0.425093, 2.225072, 1, 1, 1, 1, 1,
0.7590223, 0.4532208, -0.6447374, 1, 1, 1, 1, 1,
0.760768, 0.2871151, 2.364891, 1, 1, 1, 1, 1,
0.7639264, -0.4611179, 3.30198, 1, 1, 1, 1, 1,
0.7640568, -0.5724264, 1.684711, 1, 1, 1, 1, 1,
0.7658272, -1.111703, 2.837694, 1, 1, 1, 1, 1,
0.7689126, 0.6944606, 0.5255114, 1, 1, 1, 1, 1,
0.7690087, 1.095465, 0.8272631, 1, 1, 1, 1, 1,
0.7735424, -0.07082833, 1.146234, 1, 1, 1, 1, 1,
0.7746594, -0.1078801, 2.240657, 0, 0, 1, 1, 1,
0.7771938, -0.2278258, 1.82819, 1, 0, 0, 1, 1,
0.7778683, 0.4682426, -1.004585, 1, 0, 0, 1, 1,
0.7841239, 0.6875092, 1.881847, 1, 0, 0, 1, 1,
0.7854341, -2.732317, 2.844146, 1, 0, 0, 1, 1,
0.7873904, -1.672801, 3.270574, 1, 0, 0, 1, 1,
0.7874439, -0.9097456, 3.492705, 0, 0, 0, 1, 1,
0.7903784, -0.4789845, 1.732588, 0, 0, 0, 1, 1,
0.7968423, 0.6261262, -0.2935676, 0, 0, 0, 1, 1,
0.7990945, -1.368478, 2.038911, 0, 0, 0, 1, 1,
0.7998217, -0.4250593, 0.6841334, 0, 0, 0, 1, 1,
0.8035161, -0.2244547, 0.4828272, 0, 0, 0, 1, 1,
0.8038983, -0.1617094, 1.04286, 0, 0, 0, 1, 1,
0.8046433, -2.247803, 2.781748, 1, 1, 1, 1, 1,
0.8107908, -0.4935307, 3.858414, 1, 1, 1, 1, 1,
0.8150065, 1.297251, 0.350545, 1, 1, 1, 1, 1,
0.8152036, -1.332661, 2.427236, 1, 1, 1, 1, 1,
0.8162138, -0.8131787, 1.581171, 1, 1, 1, 1, 1,
0.826997, 0.05645107, 1.539304, 1, 1, 1, 1, 1,
0.8287202, 0.3596584, 1.094091, 1, 1, 1, 1, 1,
0.8303206, -0.4724607, 1.140321, 1, 1, 1, 1, 1,
0.8333403, 1.555532, 0.9860136, 1, 1, 1, 1, 1,
0.8371258, 1.645091, -0.1249772, 1, 1, 1, 1, 1,
0.8426638, 0.6354553, -0.01870288, 1, 1, 1, 1, 1,
0.8484921, -2.108788, 0.9372699, 1, 1, 1, 1, 1,
0.8487769, -0.1119397, 0.1509643, 1, 1, 1, 1, 1,
0.85052, -1.61543, 0.02449385, 1, 1, 1, 1, 1,
0.8517776, -1.229362, 2.79841, 1, 1, 1, 1, 1,
0.8518113, 0.2066333, -0.1548919, 0, 0, 1, 1, 1,
0.852422, -1.391044, 3.325039, 1, 0, 0, 1, 1,
0.862049, -0.1321836, 2.934237, 1, 0, 0, 1, 1,
0.8637841, -0.4738233, 0.9803628, 1, 0, 0, 1, 1,
0.8667483, -0.5523199, 0.7212207, 1, 0, 0, 1, 1,
0.8735926, -0.6861936, 2.2486, 1, 0, 0, 1, 1,
0.874805, -0.5508652, 2.398583, 0, 0, 0, 1, 1,
0.8766834, 1.567119, 0.9510406, 0, 0, 0, 1, 1,
0.8774254, -0.1101509, 3.582501, 0, 0, 0, 1, 1,
0.8840131, -1.400817, 3.089227, 0, 0, 0, 1, 1,
0.8848475, 0.916055, -0.4873185, 0, 0, 0, 1, 1,
0.8889384, 1.338114, 1.483563, 0, 0, 0, 1, 1,
0.8901573, -0.3053198, 1.502172, 0, 0, 0, 1, 1,
0.8984498, 2.009142, 0.228866, 1, 1, 1, 1, 1,
0.8989775, 0.8783757, 2.719884, 1, 1, 1, 1, 1,
0.9006276, 0.1733539, 1.044585, 1, 1, 1, 1, 1,
0.904721, -1.106202, 3.212791, 1, 1, 1, 1, 1,
0.9083929, -1.05958, 1.898258, 1, 1, 1, 1, 1,
0.9088548, -0.6587346, 1.730921, 1, 1, 1, 1, 1,
0.9088792, -0.3275072, 3.442443, 1, 1, 1, 1, 1,
0.9103847, 0.7537636, -0.6527584, 1, 1, 1, 1, 1,
0.9120467, 0.2906746, -0.9237858, 1, 1, 1, 1, 1,
0.9142098, -0.5693101, 0.9779014, 1, 1, 1, 1, 1,
0.9171401, -0.2041337, 1.593234, 1, 1, 1, 1, 1,
0.9207469, -0.656777, 2.186975, 1, 1, 1, 1, 1,
0.9214259, -2.076095, 1.043126, 1, 1, 1, 1, 1,
0.9317512, -0.3679064, 2.459927, 1, 1, 1, 1, 1,
0.9322292, -1.993759, 2.80376, 1, 1, 1, 1, 1,
0.9458606, -0.5693568, 3.517741, 0, 0, 1, 1, 1,
0.9485322, 0.4630127, -0.9733596, 1, 0, 0, 1, 1,
0.9672483, 0.3617609, 0.8646712, 1, 0, 0, 1, 1,
0.9702618, -0.1620415, 2.690878, 1, 0, 0, 1, 1,
0.9720362, 0.4389406, 0.35959, 1, 0, 0, 1, 1,
0.9820206, 0.1873204, -0.03367099, 1, 0, 0, 1, 1,
0.9858891, 2.536891, 1.332818, 0, 0, 0, 1, 1,
0.9998699, 0.5114596, 1.552382, 0, 0, 0, 1, 1,
1.010468, -1.002172, 3.904074, 0, 0, 0, 1, 1,
1.017376, 1.787615, 1.75705, 0, 0, 0, 1, 1,
1.0181, 1.487808, -0.05015922, 0, 0, 0, 1, 1,
1.022384, -0.3017861, 2.659756, 0, 0, 0, 1, 1,
1.028327, 0.6508281, 1.710614, 0, 0, 0, 1, 1,
1.036468, 0.6680413, 0.9810066, 1, 1, 1, 1, 1,
1.036848, 1.118756, -1.285855, 1, 1, 1, 1, 1,
1.040369, -0.8346853, 2.648393, 1, 1, 1, 1, 1,
1.046393, -1.274972, 1.713595, 1, 1, 1, 1, 1,
1.053892, 0.4165913, 1.788608, 1, 1, 1, 1, 1,
1.054124, -0.8035104, 1.635803, 1, 1, 1, 1, 1,
1.060909, 0.770146, 1.914498, 1, 1, 1, 1, 1,
1.06986, -1.573048, 3.107471, 1, 1, 1, 1, 1,
1.071486, 0.3236234, 0.4321232, 1, 1, 1, 1, 1,
1.072644, -1.7084, 2.536414, 1, 1, 1, 1, 1,
1.078085, -1.053818, 2.062428, 1, 1, 1, 1, 1,
1.078537, 0.2282028, 0.8846559, 1, 1, 1, 1, 1,
1.094317, 1.12801, 0.01232471, 1, 1, 1, 1, 1,
1.096702, -0.7299405, 3.102931, 1, 1, 1, 1, 1,
1.11257, -0.4075057, 2.5943, 1, 1, 1, 1, 1,
1.116721, 0.1864509, 0.3792241, 0, 0, 1, 1, 1,
1.116776, 1.043043, 2.536857, 1, 0, 0, 1, 1,
1.126895, 0.04200928, 1.326993, 1, 0, 0, 1, 1,
1.127337, -1.796132, 1.733501, 1, 0, 0, 1, 1,
1.135247, 0.07662447, 1.295604, 1, 0, 0, 1, 1,
1.136325, -0.7885852, 1.272352, 1, 0, 0, 1, 1,
1.140237, 0.7034925, 1.497962, 0, 0, 0, 1, 1,
1.152584, 0.8848946, 0.7643737, 0, 0, 0, 1, 1,
1.153046, 0.8364229, 1.039232, 0, 0, 0, 1, 1,
1.153304, 0.313216, 2.667128, 0, 0, 0, 1, 1,
1.15629, -1.413955, 1.465919, 0, 0, 0, 1, 1,
1.165281, -0.8547655, 4.780815, 0, 0, 0, 1, 1,
1.171211, -1.016997, 3.640528, 0, 0, 0, 1, 1,
1.179314, 0.8039889, 1.685742, 1, 1, 1, 1, 1,
1.189603, 2.126786, 0.5332462, 1, 1, 1, 1, 1,
1.192604, -1.502782, 1.793417, 1, 1, 1, 1, 1,
1.193841, 0.4439153, 0.1091489, 1, 1, 1, 1, 1,
1.195327, 2.028307, 1.064606, 1, 1, 1, 1, 1,
1.210089, -2.438636, 2.402833, 1, 1, 1, 1, 1,
1.215386, -0.267575, 0.4608908, 1, 1, 1, 1, 1,
1.216388, -1.70081, 0.942001, 1, 1, 1, 1, 1,
1.225271, 0.6252902, 1.366827, 1, 1, 1, 1, 1,
1.225507, 0.4383107, 2.793777, 1, 1, 1, 1, 1,
1.226798, -1.237999, 4.457661, 1, 1, 1, 1, 1,
1.230933, 0.2043299, 1.420352, 1, 1, 1, 1, 1,
1.232134, -0.6672232, 2.401562, 1, 1, 1, 1, 1,
1.234831, 0.3812653, 2.032558, 1, 1, 1, 1, 1,
1.236617, 0.7925767, 2.501351, 1, 1, 1, 1, 1,
1.237986, 0.6575091, -0.01157935, 0, 0, 1, 1, 1,
1.238117, -1.406404, 2.598196, 1, 0, 0, 1, 1,
1.250705, 0.001606675, 3.007793, 1, 0, 0, 1, 1,
1.251896, -0.8548989, 2.960137, 1, 0, 0, 1, 1,
1.252414, 0.5498561, 2.878217, 1, 0, 0, 1, 1,
1.25992, -1.121303, 2.159714, 1, 0, 0, 1, 1,
1.264497, -0.5944825, 3.369984, 0, 0, 0, 1, 1,
1.272463, -2.023108, 3.655689, 0, 0, 0, 1, 1,
1.282533, -1.587351, 2.50258, 0, 0, 0, 1, 1,
1.288382, 1.208866, 0.4236658, 0, 0, 0, 1, 1,
1.297311, -1.02011, 1.139176, 0, 0, 0, 1, 1,
1.304437, 1.524515, 2.029578, 0, 0, 0, 1, 1,
1.306351, -1.288715, 1.670587, 0, 0, 0, 1, 1,
1.313496, 0.3121829, 1.815783, 1, 1, 1, 1, 1,
1.317975, 0.0256111, 1.453848, 1, 1, 1, 1, 1,
1.319281, -1.256115, 2.01362, 1, 1, 1, 1, 1,
1.32143, -1.365353, 0.3691328, 1, 1, 1, 1, 1,
1.342595, 1.95227, -0.2919887, 1, 1, 1, 1, 1,
1.344014, 1.314336, 0.9475501, 1, 1, 1, 1, 1,
1.34518, 0.6199341, 1.550867, 1, 1, 1, 1, 1,
1.361398, 0.00657133, 0.08669328, 1, 1, 1, 1, 1,
1.37549, 0.3295851, 2.772195, 1, 1, 1, 1, 1,
1.395607, 0.04919967, 1.296041, 1, 1, 1, 1, 1,
1.396147, 2.053224, -0.6021514, 1, 1, 1, 1, 1,
1.406887, -0.1142667, 1.545693, 1, 1, 1, 1, 1,
1.41743, 0.7678484, 0.1851762, 1, 1, 1, 1, 1,
1.41772, -0.4305902, 2.287766, 1, 1, 1, 1, 1,
1.424186, 0.8940479, 2.534158, 1, 1, 1, 1, 1,
1.438071, -1.086757, 1.998559, 0, 0, 1, 1, 1,
1.438138, 0.2354279, 2.955507, 1, 0, 0, 1, 1,
1.438676, 1.639234, 1.464241, 1, 0, 0, 1, 1,
1.443117, 1.149455, 1.719862, 1, 0, 0, 1, 1,
1.445735, -0.08724469, 1.570529, 1, 0, 0, 1, 1,
1.457547, 0.5504676, 0.1487161, 1, 0, 0, 1, 1,
1.466621, 0.6793007, -1.095021, 0, 0, 0, 1, 1,
1.472988, 1.490232, 0.705626, 0, 0, 0, 1, 1,
1.485968, 0.689377, 3.923678, 0, 0, 0, 1, 1,
1.498424, -0.178192, 2.386484, 0, 0, 0, 1, 1,
1.507177, -0.4933937, 0.5467384, 0, 0, 0, 1, 1,
1.507625, -1.070089, 2.521035, 0, 0, 0, 1, 1,
1.513542, 0.5883693, 3.221239, 0, 0, 0, 1, 1,
1.517222, -0.8796531, 2.003948, 1, 1, 1, 1, 1,
1.518823, -0.7040454, 0.2565203, 1, 1, 1, 1, 1,
1.527218, 0.05673445, 1.491246, 1, 1, 1, 1, 1,
1.532059, 0.4879031, 2.958506, 1, 1, 1, 1, 1,
1.534783, -0.3135473, 2.341375, 1, 1, 1, 1, 1,
1.535844, 0.006661207, 2.520755, 1, 1, 1, 1, 1,
1.556468, -1.328415, 2.0712, 1, 1, 1, 1, 1,
1.557553, 0.9665185, 1.144168, 1, 1, 1, 1, 1,
1.563838, -0.6032938, 2.009881, 1, 1, 1, 1, 1,
1.589782, -1.616565, 2.19517, 1, 1, 1, 1, 1,
1.602712, 0.6670153, 1.765258, 1, 1, 1, 1, 1,
1.612313, 0.2403309, 1.848351, 1, 1, 1, 1, 1,
1.613469, 1.278739, 2.153396, 1, 1, 1, 1, 1,
1.620378, 0.2998526, 0.5013033, 1, 1, 1, 1, 1,
1.624721, -0.3085957, 1.136915, 1, 1, 1, 1, 1,
1.626761, 0.4254563, 0.1375288, 0, 0, 1, 1, 1,
1.64193, 0.3019615, 2.30359, 1, 0, 0, 1, 1,
1.649188, -1.349261, 2.003663, 1, 0, 0, 1, 1,
1.65296, 0.2523707, 0.6976853, 1, 0, 0, 1, 1,
1.653218, 0.6348924, 1.151269, 1, 0, 0, 1, 1,
1.65918, 0.674093, 1.17338, 1, 0, 0, 1, 1,
1.66736, -0.08415086, 3.183789, 0, 0, 0, 1, 1,
1.671191, 0.6930431, 0.2848533, 0, 0, 0, 1, 1,
1.671303, 0.5307107, -0.0863196, 0, 0, 0, 1, 1,
1.671712, -2.132071, 3.077523, 0, 0, 0, 1, 1,
1.679892, 1.869067, 0.8446596, 0, 0, 0, 1, 1,
1.682038, 0.5488131, 1.02149, 0, 0, 0, 1, 1,
1.716579, -1.068419, 1.400466, 0, 0, 0, 1, 1,
1.716739, -0.05137255, 2.212987, 1, 1, 1, 1, 1,
1.733837, 0.3106681, 1.778633, 1, 1, 1, 1, 1,
1.767969, -0.5172333, -0.08951914, 1, 1, 1, 1, 1,
1.785395, 1.964882, 0.93853, 1, 1, 1, 1, 1,
1.788867, -0.1338999, 1.959819, 1, 1, 1, 1, 1,
1.822799, -0.07776646, 2.943919, 1, 1, 1, 1, 1,
1.843148, 0.04464905, 1.045153, 1, 1, 1, 1, 1,
1.903664, 0.3301897, 2.147382, 1, 1, 1, 1, 1,
1.922082, -1.325658, 1.780767, 1, 1, 1, 1, 1,
1.925807, 0.2129212, -0.21994, 1, 1, 1, 1, 1,
1.948602, -0.4232423, 1.63075, 1, 1, 1, 1, 1,
1.963416, -0.7513776, 1.556914, 1, 1, 1, 1, 1,
1.965729, -0.01721307, 1.868269, 1, 1, 1, 1, 1,
1.967069, -1.270706, 3.476144, 1, 1, 1, 1, 1,
1.974651, 0.1075998, 1.488109, 1, 1, 1, 1, 1,
2.023146, 0.1173914, 1.478079, 0, 0, 1, 1, 1,
2.07476, -0.4178009, 1.210737, 1, 0, 0, 1, 1,
2.07492, -0.9679371, 2.193758, 1, 0, 0, 1, 1,
2.086206, -0.0318842, 1.348391, 1, 0, 0, 1, 1,
2.097081, 1.103295, 1.060311, 1, 0, 0, 1, 1,
2.097834, 2.534247, 0.2910755, 1, 0, 0, 1, 1,
2.137648, -1.447562, 3.078223, 0, 0, 0, 1, 1,
2.195942, 1.185225, 1.266275, 0, 0, 0, 1, 1,
2.207034, -0.9814166, 3.768668, 0, 0, 0, 1, 1,
2.208009, 0.7000002, 0.1869603, 0, 0, 0, 1, 1,
2.216733, 2.06522, 2.121536, 0, 0, 0, 1, 1,
2.233113, 1.044852, 0.01611842, 0, 0, 0, 1, 1,
2.24807, 1.202203, -0.231156, 0, 0, 0, 1, 1,
2.296639, -2.437621, 1.435612, 1, 1, 1, 1, 1,
2.460437, 0.1152422, 2.478629, 1, 1, 1, 1, 1,
2.558727, 0.6524297, 2.19602, 1, 1, 1, 1, 1,
2.581913, -0.9500673, 2.235901, 1, 1, 1, 1, 1,
2.637115, -0.7522505, 2.267032, 1, 1, 1, 1, 1,
2.683121, -0.003915468, 0.7104056, 1, 1, 1, 1, 1,
3.444092, -0.758451, 2.097129, 1, 1, 1, 1, 1
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
var radius = 9.575841;
var distance = 33.63474;
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
mvMatrix.translate( -0.1642249, -0.03109264, -0.2275128 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.63474);
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
