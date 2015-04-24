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
-2.800921, 0.3759975, -1.371994, 1, 0, 0, 1,
-2.697, 0.7654899, -3.326544, 1, 0.007843138, 0, 1,
-2.666818, 0.2540073, -1.592967, 1, 0.01176471, 0, 1,
-2.65633, -0.5526741, -3.104485, 1, 0.01960784, 0, 1,
-2.595026, -1.665204, -2.021942, 1, 0.02352941, 0, 1,
-2.529166, -0.09621154, -2.600328, 1, 0.03137255, 0, 1,
-2.525177, -1.263556, -1.461348, 1, 0.03529412, 0, 1,
-2.509104, 0.06911454, -1.221878, 1, 0.04313726, 0, 1,
-2.45973, 0.2677577, -0.6250739, 1, 0.04705882, 0, 1,
-2.283737, 0.002089276, -4.921829, 1, 0.05490196, 0, 1,
-2.254497, 2.426824, -0.1297491, 1, 0.05882353, 0, 1,
-2.213147, -0.4472034, -2.166218, 1, 0.06666667, 0, 1,
-2.208356, -0.3073849, -2.906807, 1, 0.07058824, 0, 1,
-2.166547, -0.4843598, -1.690426, 1, 0.07843138, 0, 1,
-2.149407, -0.006241343, -1.280362, 1, 0.08235294, 0, 1,
-2.146102, 1.341464, -0.5736206, 1, 0.09019608, 0, 1,
-2.140401, -0.2368926, -2.672257, 1, 0.09411765, 0, 1,
-2.094823, 0.07656856, -0.2701104, 1, 0.1019608, 0, 1,
-2.058411, 0.9930094, -2.209967, 1, 0.1098039, 0, 1,
-2.054111, -0.4706759, -0.9760804, 1, 0.1137255, 0, 1,
-2.029307, 1.627423, -1.09483, 1, 0.1215686, 0, 1,
-2.015023, -0.3225338, -2.152939, 1, 0.1254902, 0, 1,
-2.013274, 0.46323, -1.197911, 1, 0.1333333, 0, 1,
-2.00107, -0.93579, -2.294428, 1, 0.1372549, 0, 1,
-1.986258, -0.07081308, -1.449661, 1, 0.145098, 0, 1,
-1.958569, -1.058941, -2.094317, 1, 0.1490196, 0, 1,
-1.953887, 0.5256674, -1.093988, 1, 0.1568628, 0, 1,
-1.943215, -0.7668694, -1.60999, 1, 0.1607843, 0, 1,
-1.942617, -0.8576968, -2.322237, 1, 0.1686275, 0, 1,
-1.912608, 0.3959732, -2.21622, 1, 0.172549, 0, 1,
-1.895162, 1.355208, -1.689668, 1, 0.1803922, 0, 1,
-1.893411, -0.2612379, -2.829127, 1, 0.1843137, 0, 1,
-1.888731, -0.2105161, 0.07241191, 1, 0.1921569, 0, 1,
-1.878764, 1.913231, -1.702748, 1, 0.1960784, 0, 1,
-1.85775, 0.1844238, -1.675353, 1, 0.2039216, 0, 1,
-1.850416, 0.9703569, -2.972496, 1, 0.2117647, 0, 1,
-1.834178, 0.8226886, -0.7063254, 1, 0.2156863, 0, 1,
-1.828702, -0.1364888, -2.034257, 1, 0.2235294, 0, 1,
-1.82623, 0.3280465, 0.4146411, 1, 0.227451, 0, 1,
-1.825048, -0.5929604, -2.06021, 1, 0.2352941, 0, 1,
-1.818456, -0.9593027, -2.622462, 1, 0.2392157, 0, 1,
-1.789003, -0.6683121, -3.403463, 1, 0.2470588, 0, 1,
-1.785941, -0.4614152, -1.660001, 1, 0.2509804, 0, 1,
-1.780612, 1.447179, 0.1022919, 1, 0.2588235, 0, 1,
-1.779051, -0.2199528, -1.644258, 1, 0.2627451, 0, 1,
-1.753136, 0.8867684, -1.659838, 1, 0.2705882, 0, 1,
-1.749997, -0.9013693, -4.115259, 1, 0.2745098, 0, 1,
-1.745332, -0.4948543, -0.04725179, 1, 0.282353, 0, 1,
-1.738668, -0.2730281, -0.7229144, 1, 0.2862745, 0, 1,
-1.706024, -0.1241605, -2.831575, 1, 0.2941177, 0, 1,
-1.685095, -0.8960478, -2.375497, 1, 0.3019608, 0, 1,
-1.675382, -0.2109647, -3.406169, 1, 0.3058824, 0, 1,
-1.672438, 0.2298633, -0.1136562, 1, 0.3137255, 0, 1,
-1.668317, -0.3575214, -2.642679, 1, 0.3176471, 0, 1,
-1.666933, 0.09606855, -1.97089, 1, 0.3254902, 0, 1,
-1.661686, 0.2723969, -0.4757884, 1, 0.3294118, 0, 1,
-1.642942, -1.31496, -2.597681, 1, 0.3372549, 0, 1,
-1.636403, 0.01980942, -1.650516, 1, 0.3411765, 0, 1,
-1.636181, -0.03938043, -1.22031, 1, 0.3490196, 0, 1,
-1.610059, 1.308982, -1.569107, 1, 0.3529412, 0, 1,
-1.574923, -0.7745575, -1.436721, 1, 0.3607843, 0, 1,
-1.555784, 0.1990507, -3.261806, 1, 0.3647059, 0, 1,
-1.55438, 1.294861, -0.8881741, 1, 0.372549, 0, 1,
-1.548607, -0.8068627, -1.958229, 1, 0.3764706, 0, 1,
-1.545508, -3.017424, -3.587854, 1, 0.3843137, 0, 1,
-1.537743, 0.2494297, -0.5901314, 1, 0.3882353, 0, 1,
-1.536593, -1.083633, -1.588448, 1, 0.3960784, 0, 1,
-1.53161, 1.006361, 0.03442398, 1, 0.4039216, 0, 1,
-1.51828, -0.3564863, -3.662386, 1, 0.4078431, 0, 1,
-1.493034, -0.6149164, -0.9905234, 1, 0.4156863, 0, 1,
-1.492548, -0.1276022, -1.955397, 1, 0.4196078, 0, 1,
-1.492374, -0.6025252, -2.298653, 1, 0.427451, 0, 1,
-1.468832, -1.297003, -3.02165, 1, 0.4313726, 0, 1,
-1.465645, 1.519149, -0.9907307, 1, 0.4392157, 0, 1,
-1.464026, -0.005763594, -2.006794, 1, 0.4431373, 0, 1,
-1.454478, 0.1412036, -2.148762, 1, 0.4509804, 0, 1,
-1.445781, -1.897752, -4.11445, 1, 0.454902, 0, 1,
-1.444484, 0.7420561, -0.2727259, 1, 0.4627451, 0, 1,
-1.426432, -0.579178, -0.3349881, 1, 0.4666667, 0, 1,
-1.414311, 0.6723745, -0.9862754, 1, 0.4745098, 0, 1,
-1.407807, 0.02126019, -1.295062, 1, 0.4784314, 0, 1,
-1.399069, 1.815705, -1.802068, 1, 0.4862745, 0, 1,
-1.392535, -0.08993485, -1.74688, 1, 0.4901961, 0, 1,
-1.391144, 0.1084816, -2.221191, 1, 0.4980392, 0, 1,
-1.385826, -1.149638, -1.650675, 1, 0.5058824, 0, 1,
-1.385129, -0.8169484, -2.433119, 1, 0.509804, 0, 1,
-1.37232, 1.288445, -0.9508287, 1, 0.5176471, 0, 1,
-1.371735, -0.04639016, -0.9321083, 1, 0.5215687, 0, 1,
-1.371034, -1.047655, -2.074033, 1, 0.5294118, 0, 1,
-1.361341, -0.2139707, -1.792539, 1, 0.5333334, 0, 1,
-1.35782, 0.3305935, 2.127551, 1, 0.5411765, 0, 1,
-1.349411, -1.074661, -1.628492, 1, 0.5450981, 0, 1,
-1.320803, 1.303867, -0.3633579, 1, 0.5529412, 0, 1,
-1.317375, -0.6743026, -0.5006801, 1, 0.5568628, 0, 1,
-1.310498, -0.1494625, -0.8451447, 1, 0.5647059, 0, 1,
-1.300828, -0.4377878, -4.071467, 1, 0.5686275, 0, 1,
-1.296543, 0.3350993, -1.03628, 1, 0.5764706, 0, 1,
-1.28588, -0.4603691, -1.055206, 1, 0.5803922, 0, 1,
-1.281581, -0.9964423, -3.753583, 1, 0.5882353, 0, 1,
-1.280585, 0.3601732, -2.68264, 1, 0.5921569, 0, 1,
-1.279709, -0.6404975, -1.414943, 1, 0.6, 0, 1,
-1.272719, 0.4073096, -1.564807, 1, 0.6078432, 0, 1,
-1.271435, 1.561812, -1.093699, 1, 0.6117647, 0, 1,
-1.271417, 0.7277365, -2.760647, 1, 0.6196079, 0, 1,
-1.270021, -0.45303, -1.96928, 1, 0.6235294, 0, 1,
-1.262395, -0.3560012, -0.9848256, 1, 0.6313726, 0, 1,
-1.260349, -0.3166339, -1.291093, 1, 0.6352941, 0, 1,
-1.25981, 0.6315331, -0.6621075, 1, 0.6431373, 0, 1,
-1.252759, -1.107152, -2.661579, 1, 0.6470588, 0, 1,
-1.233149, -1.119076, -3.368835, 1, 0.654902, 0, 1,
-1.231418, 0.7447755, -0.7530711, 1, 0.6588235, 0, 1,
-1.229317, -0.1376871, -1.440266, 1, 0.6666667, 0, 1,
-1.223048, -0.332755, -2.423865, 1, 0.6705883, 0, 1,
-1.216722, -1.067942, -2.948136, 1, 0.6784314, 0, 1,
-1.214784, -0.1618572, -2.170768, 1, 0.682353, 0, 1,
-1.212394, -1.167619, -2.923027, 1, 0.6901961, 0, 1,
-1.20451, 1.293361, -1.168126, 1, 0.6941177, 0, 1,
-1.201021, 0.5143149, -2.00405, 1, 0.7019608, 0, 1,
-1.187774, 0.1455974, -1.788628, 1, 0.7098039, 0, 1,
-1.171332, -0.9478042, -2.678796, 1, 0.7137255, 0, 1,
-1.168471, 0.4659362, -1.38917, 1, 0.7215686, 0, 1,
-1.16778, -0.3049492, -0.09414704, 1, 0.7254902, 0, 1,
-1.166821, -0.06900004, -2.814935, 1, 0.7333333, 0, 1,
-1.161633, 0.9410726, 0.5463046, 1, 0.7372549, 0, 1,
-1.159598, -1.351047, -1.513922, 1, 0.7450981, 0, 1,
-1.158652, -1.499132, -3.32844, 1, 0.7490196, 0, 1,
-1.151795, -0.06450396, -1.588533, 1, 0.7568628, 0, 1,
-1.146875, -0.1281489, -1.692078, 1, 0.7607843, 0, 1,
-1.146368, 0.1399961, -0.7032837, 1, 0.7686275, 0, 1,
-1.141399, 1.120304, 1.209179, 1, 0.772549, 0, 1,
-1.138668, -0.002619556, -0.7859241, 1, 0.7803922, 0, 1,
-1.137977, 0.8535608, -2.191765, 1, 0.7843137, 0, 1,
-1.128958, -0.7445118, -1.710811, 1, 0.7921569, 0, 1,
-1.124547, -0.5084873, -1.181825, 1, 0.7960784, 0, 1,
-1.122542, -1.905959, -3.11202, 1, 0.8039216, 0, 1,
-1.119367, -1.079713, -2.458515, 1, 0.8117647, 0, 1,
-1.117188, 0.8116591, -0.6075848, 1, 0.8156863, 0, 1,
-1.113475, 0.7090489, 0.5149964, 1, 0.8235294, 0, 1,
-1.105585, -1.070975, -0.9723905, 1, 0.827451, 0, 1,
-1.09568, -0.2801703, -3.302114, 1, 0.8352941, 0, 1,
-1.077347, -1.339255, -2.295452, 1, 0.8392157, 0, 1,
-1.077165, -0.6456022, -2.430809, 1, 0.8470588, 0, 1,
-1.069741, -1.708912, -1.935935, 1, 0.8509804, 0, 1,
-1.060685, -1.062244, -2.407729, 1, 0.8588235, 0, 1,
-1.0596, 0.152325, -0.3248171, 1, 0.8627451, 0, 1,
-1.059388, 1.075094, -0.9064011, 1, 0.8705882, 0, 1,
-1.055507, 0.4704241, 0.3036961, 1, 0.8745098, 0, 1,
-1.052465, -2.105644, -1.027534, 1, 0.8823529, 0, 1,
-1.048929, -0.529319, -1.831715, 1, 0.8862745, 0, 1,
-1.031534, -0.8598673, -4.223467, 1, 0.8941177, 0, 1,
-1.031426, -0.818029, -2.840641, 1, 0.8980392, 0, 1,
-1.00853, 0.4109423, -2.353191, 1, 0.9058824, 0, 1,
-1.005205, -0.968838, -3.034371, 1, 0.9137255, 0, 1,
-0.9958414, 2.354749, -0.8853293, 1, 0.9176471, 0, 1,
-0.9908597, -1.818366, -3.086587, 1, 0.9254902, 0, 1,
-0.9905115, 0.966449, -1.112232, 1, 0.9294118, 0, 1,
-0.9809143, 2.190986, -0.5367746, 1, 0.9372549, 0, 1,
-0.9802967, 0.9197332, -1.661737, 1, 0.9411765, 0, 1,
-0.9797622, 0.6544985, -0.7452385, 1, 0.9490196, 0, 1,
-0.9787306, 1.151742, -1.288847, 1, 0.9529412, 0, 1,
-0.9755693, -0.2671983, -2.547679, 1, 0.9607843, 0, 1,
-0.9729073, 0.3101675, -0.2589738, 1, 0.9647059, 0, 1,
-0.9676881, 0.02357008, -1.584438, 1, 0.972549, 0, 1,
-0.9619352, -1.522467, -1.980654, 1, 0.9764706, 0, 1,
-0.9601779, 0.9701042, -0.02394624, 1, 0.9843137, 0, 1,
-0.9591606, 0.3708513, -1.527049, 1, 0.9882353, 0, 1,
-0.9424153, -1.007513, -3.452841, 1, 0.9960784, 0, 1,
-0.9398018, 1.160121, -2.691358, 0.9960784, 1, 0, 1,
-0.9390896, 0.8737515, 1.132622, 0.9921569, 1, 0, 1,
-0.9281686, 0.7279526, -1.340231, 0.9843137, 1, 0, 1,
-0.9234514, 0.702298, -3.294739, 0.9803922, 1, 0, 1,
-0.9212726, -0.8875417, -3.134717, 0.972549, 1, 0, 1,
-0.9206822, 0.558346, -0.9636688, 0.9686275, 1, 0, 1,
-0.9028843, -0.09433221, -1.435534, 0.9607843, 1, 0, 1,
-0.8999988, -0.09628142, -1.352452, 0.9568627, 1, 0, 1,
-0.8994446, 1.137408, -0.8508015, 0.9490196, 1, 0, 1,
-0.8983822, 0.3075378, -1.308059, 0.945098, 1, 0, 1,
-0.893744, 0.4414969, -1.0286, 0.9372549, 1, 0, 1,
-0.8805844, 1.429474, -0.7356793, 0.9333333, 1, 0, 1,
-0.8760327, 0.9186737, -1.373309, 0.9254902, 1, 0, 1,
-0.8673404, -0.03466213, -2.428661, 0.9215686, 1, 0, 1,
-0.8604724, -0.5743006, -1.021214, 0.9137255, 1, 0, 1,
-0.8593358, 0.1656468, -0.8890831, 0.9098039, 1, 0, 1,
-0.8556052, 0.5482623, -3.122314, 0.9019608, 1, 0, 1,
-0.8501887, -2.389011, -3.523595, 0.8941177, 1, 0, 1,
-0.843901, 1.361001, -0.97155, 0.8901961, 1, 0, 1,
-0.8391658, 2.276542, -0.1814244, 0.8823529, 1, 0, 1,
-0.8339597, -0.38106, -1.671126, 0.8784314, 1, 0, 1,
-0.8274723, 0.1130416, -3.276507, 0.8705882, 1, 0, 1,
-0.8257875, 0.3016197, -1.026852, 0.8666667, 1, 0, 1,
-0.8257624, -0.01835616, 0.3758121, 0.8588235, 1, 0, 1,
-0.8203782, 0.4036022, -2.198825, 0.854902, 1, 0, 1,
-0.8202254, -0.07322314, -3.667237, 0.8470588, 1, 0, 1,
-0.8155458, 0.06714356, -1.647767, 0.8431373, 1, 0, 1,
-0.8130836, -0.146334, -1.367528, 0.8352941, 1, 0, 1,
-0.8114248, -1.317892, -3.317895, 0.8313726, 1, 0, 1,
-0.8085463, -0.7192817, -3.265038, 0.8235294, 1, 0, 1,
-0.8056978, 1.320763, -1.108324, 0.8196079, 1, 0, 1,
-0.8051027, 0.2622248, 2.207262, 0.8117647, 1, 0, 1,
-0.8029224, -0.9785268, -1.996399, 0.8078431, 1, 0, 1,
-0.8027689, -0.9299057, -2.351948, 0.8, 1, 0, 1,
-0.797285, -0.4068861, -3.500406, 0.7921569, 1, 0, 1,
-0.7971101, -0.8938516, -3.984384, 0.7882353, 1, 0, 1,
-0.7829247, -0.2571634, -3.947238, 0.7803922, 1, 0, 1,
-0.7773482, -0.8457805, -3.809304, 0.7764706, 1, 0, 1,
-0.7739196, -0.5987002, -2.499025, 0.7686275, 1, 0, 1,
-0.7711958, -0.2398402, -1.926113, 0.7647059, 1, 0, 1,
-0.7697293, -0.1653371, -2.357276, 0.7568628, 1, 0, 1,
-0.7696515, -0.710412, 0.5077882, 0.7529412, 1, 0, 1,
-0.7669108, -0.2850454, -2.119162, 0.7450981, 1, 0, 1,
-0.7651517, 1.2419, 0.3178331, 0.7411765, 1, 0, 1,
-0.7645007, 0.5771159, -2.257171, 0.7333333, 1, 0, 1,
-0.7620382, 0.267391, -0.1033772, 0.7294118, 1, 0, 1,
-0.7597469, -0.1705348, -1.840723, 0.7215686, 1, 0, 1,
-0.758824, -2.104242, -3.029902, 0.7176471, 1, 0, 1,
-0.7553322, 1.591822, -0.8999335, 0.7098039, 1, 0, 1,
-0.7529097, 1.582722, 0.71886, 0.7058824, 1, 0, 1,
-0.7500011, -0.7595171, -2.720815, 0.6980392, 1, 0, 1,
-0.7475268, 0.9257487, 1.56742, 0.6901961, 1, 0, 1,
-0.7462429, 0.07395551, -0.128918, 0.6862745, 1, 0, 1,
-0.7441234, -1.494766, -0.4694418, 0.6784314, 1, 0, 1,
-0.7392018, -0.2489837, -2.949314, 0.6745098, 1, 0, 1,
-0.7386486, 0.7491452, -2.559299, 0.6666667, 1, 0, 1,
-0.7385173, 0.9177391, -1.481092, 0.6627451, 1, 0, 1,
-0.7304758, -0.5198375, -2.025808, 0.654902, 1, 0, 1,
-0.7268699, 1.662259, 0.7080336, 0.6509804, 1, 0, 1,
-0.7267376, 0.6217294, -0.1554514, 0.6431373, 1, 0, 1,
-0.7255364, -0.003275123, -0.2441481, 0.6392157, 1, 0, 1,
-0.7244325, -1.17773, -2.892908, 0.6313726, 1, 0, 1,
-0.7159701, -1.548269, -0.9221711, 0.627451, 1, 0, 1,
-0.7159644, -0.3615748, -1.832902, 0.6196079, 1, 0, 1,
-0.7127818, -1.174259, -2.759842, 0.6156863, 1, 0, 1,
-0.7123695, -0.3224473, -1.543807, 0.6078432, 1, 0, 1,
-0.7044604, -1.933636, -2.085553, 0.6039216, 1, 0, 1,
-0.7013971, 1.339811, -1.447245, 0.5960785, 1, 0, 1,
-0.6996163, 1.088597, -0.7438247, 0.5882353, 1, 0, 1,
-0.6952382, 1.313623, 0.6665939, 0.5843138, 1, 0, 1,
-0.6940839, -0.2046779, -0.02667079, 0.5764706, 1, 0, 1,
-0.6915353, 2.992141, -0.06532127, 0.572549, 1, 0, 1,
-0.6874145, 0.2419744, -2.11447, 0.5647059, 1, 0, 1,
-0.6855812, 1.116537, -0.07878678, 0.5607843, 1, 0, 1,
-0.6846483, -0.5623336, -2.048954, 0.5529412, 1, 0, 1,
-0.6789151, -0.544706, -1.646969, 0.5490196, 1, 0, 1,
-0.6761279, 1.5005, 0.2286504, 0.5411765, 1, 0, 1,
-0.6700624, -1.515554, -4.180623, 0.5372549, 1, 0, 1,
-0.6679599, -0.4020837, -1.409737, 0.5294118, 1, 0, 1,
-0.6649605, 1.273137, -2.056152, 0.5254902, 1, 0, 1,
-0.6617988, -0.3174596, 0.7981581, 0.5176471, 1, 0, 1,
-0.6601934, -0.7784761, -2.91328, 0.5137255, 1, 0, 1,
-0.6599724, -0.5684009, -2.244697, 0.5058824, 1, 0, 1,
-0.6589331, 1.072369, 0.2917199, 0.5019608, 1, 0, 1,
-0.6530616, 0.7520679, -1.915495, 0.4941176, 1, 0, 1,
-0.6503137, 0.0339431, -1.686305, 0.4862745, 1, 0, 1,
-0.6474475, -1.672532, -3.181012, 0.4823529, 1, 0, 1,
-0.6468518, -0.8855374, -4.670917, 0.4745098, 1, 0, 1,
-0.6466008, -0.9028546, -1.845879, 0.4705882, 1, 0, 1,
-0.6381875, -1.483684, -1.576303, 0.4627451, 1, 0, 1,
-0.6348329, -0.9239506, -3.223538, 0.4588235, 1, 0, 1,
-0.6293842, 0.7675102, 1.596828, 0.4509804, 1, 0, 1,
-0.6290925, -1.358827, -3.123222, 0.4470588, 1, 0, 1,
-0.6277485, -0.3453352, -2.722258, 0.4392157, 1, 0, 1,
-0.626101, -0.5178457, -2.718379, 0.4352941, 1, 0, 1,
-0.6251296, 0.7672513, -0.2574365, 0.427451, 1, 0, 1,
-0.6208612, -0.5654784, -1.239027, 0.4235294, 1, 0, 1,
-0.6180838, 0.6111659, -2.323308, 0.4156863, 1, 0, 1,
-0.6173732, -0.6528555, -2.462915, 0.4117647, 1, 0, 1,
-0.6160282, -0.09500478, -1.875249, 0.4039216, 1, 0, 1,
-0.6136492, -0.1285071, -0.913555, 0.3960784, 1, 0, 1,
-0.601443, -0.8772491, -1.700469, 0.3921569, 1, 0, 1,
-0.5990039, -0.2189772, -2.230146, 0.3843137, 1, 0, 1,
-0.5950275, 0.5992664, -0.6615334, 0.3803922, 1, 0, 1,
-0.5929084, -1.719623, -2.825937, 0.372549, 1, 0, 1,
-0.5876981, 0.8470207, 0.1564685, 0.3686275, 1, 0, 1,
-0.5846657, -0.5891811, -0.7508496, 0.3607843, 1, 0, 1,
-0.5823127, -0.07386358, -1.018605, 0.3568628, 1, 0, 1,
-0.5786554, 0.02816166, -0.7794803, 0.3490196, 1, 0, 1,
-0.5735949, -1.185034, -1.494499, 0.345098, 1, 0, 1,
-0.5672135, 0.6316969, -0.6161694, 0.3372549, 1, 0, 1,
-0.5657423, -0.7579036, -2.144299, 0.3333333, 1, 0, 1,
-0.564765, -0.8445796, -3.450471, 0.3254902, 1, 0, 1,
-0.561947, 0.5709572, -1.932532, 0.3215686, 1, 0, 1,
-0.5591959, -1.057537, -4.022904, 0.3137255, 1, 0, 1,
-0.553498, 0.28642, -2.489972, 0.3098039, 1, 0, 1,
-0.5529572, 1.449242, 0.07139805, 0.3019608, 1, 0, 1,
-0.5520054, -0.2434428, -1.244279, 0.2941177, 1, 0, 1,
-0.5481039, 0.4780963, -2.6581, 0.2901961, 1, 0, 1,
-0.5433479, 0.3308571, -2.501266, 0.282353, 1, 0, 1,
-0.5378659, 0.2010533, -1.243515, 0.2784314, 1, 0, 1,
-0.537657, 0.5403188, -0.4765154, 0.2705882, 1, 0, 1,
-0.5373421, -0.1440678, -2.417583, 0.2666667, 1, 0, 1,
-0.5362325, -1.137094, -0.4682942, 0.2588235, 1, 0, 1,
-0.5354767, 0.3047946, -2.492146, 0.254902, 1, 0, 1,
-0.5324436, 0.7232317, -0.9843608, 0.2470588, 1, 0, 1,
-0.5276199, -1.662711, -4.114397, 0.2431373, 1, 0, 1,
-0.5235519, -0.278774, -1.679808, 0.2352941, 1, 0, 1,
-0.5192789, 0.8971932, 0.4552556, 0.2313726, 1, 0, 1,
-0.5179241, -1.32386, -4.360238, 0.2235294, 1, 0, 1,
-0.512375, 0.08139247, -0.7148973, 0.2196078, 1, 0, 1,
-0.5080279, -0.3907874, -3.40628, 0.2117647, 1, 0, 1,
-0.5075299, -0.7651377, -2.232773, 0.2078431, 1, 0, 1,
-0.5040772, -0.2985953, -2.079836, 0.2, 1, 0, 1,
-0.4988089, -0.8173358, -2.184207, 0.1921569, 1, 0, 1,
-0.495194, 0.9695811, -0.191908, 0.1882353, 1, 0, 1,
-0.4921118, -0.6482975, -2.745647, 0.1803922, 1, 0, 1,
-0.4913282, 0.2963444, -0.7952831, 0.1764706, 1, 0, 1,
-0.4855039, 1.072349, -0.4221884, 0.1686275, 1, 0, 1,
-0.482769, 0.3717678, -1.683908, 0.1647059, 1, 0, 1,
-0.4794168, -1.112413, -3.523275, 0.1568628, 1, 0, 1,
-0.4772249, 0.506265, -0.7294308, 0.1529412, 1, 0, 1,
-0.4769974, -0.590759, -3.032529, 0.145098, 1, 0, 1,
-0.4711058, -0.006916573, -1.090417, 0.1411765, 1, 0, 1,
-0.4689449, 0.2269086, -0.6611123, 0.1333333, 1, 0, 1,
-0.4681263, -0.3982925, -2.125915, 0.1294118, 1, 0, 1,
-0.4671885, 1.780214, 0.2660177, 0.1215686, 1, 0, 1,
-0.4661054, 1.315673, -1.742325, 0.1176471, 1, 0, 1,
-0.4632746, -1.319101, -2.446185, 0.1098039, 1, 0, 1,
-0.4624955, 0.4703094, -1.136585, 0.1058824, 1, 0, 1,
-0.4592422, 0.3505222, -0.02749391, 0.09803922, 1, 0, 1,
-0.4524663, 0.4900132, -1.689997, 0.09019608, 1, 0, 1,
-0.4515541, 0.05917641, -1.415984, 0.08627451, 1, 0, 1,
-0.4512914, 0.5141548, -1.342095, 0.07843138, 1, 0, 1,
-0.450545, -0.8489432, -2.649871, 0.07450981, 1, 0, 1,
-0.447506, -1.377063, -3.636332, 0.06666667, 1, 0, 1,
-0.4441451, 0.6499904, 0.2250844, 0.0627451, 1, 0, 1,
-0.4420926, -0.2975853, -3.743467, 0.05490196, 1, 0, 1,
-0.4347701, -0.1448201, -2.279799, 0.05098039, 1, 0, 1,
-0.4294854, 0.2884241, -0.09888466, 0.04313726, 1, 0, 1,
-0.4282925, -0.9649708, -3.921764, 0.03921569, 1, 0, 1,
-0.4211067, -0.4202875, -1.963905, 0.03137255, 1, 0, 1,
-0.4144308, 0.09131664, -1.857785, 0.02745098, 1, 0, 1,
-0.4141542, -0.2154261, -2.108324, 0.01960784, 1, 0, 1,
-0.4131847, -0.8984776, -4.226284, 0.01568628, 1, 0, 1,
-0.4119785, 0.1319858, -1.901985, 0.007843138, 1, 0, 1,
-0.409404, -1.262918, -5.700919, 0.003921569, 1, 0, 1,
-0.404587, -1.660218, -2.029058, 0, 1, 0.003921569, 1,
-0.403186, 0.2859628, 0.6758149, 0, 1, 0.01176471, 1,
-0.4025282, -2.015785, -3.115292, 0, 1, 0.01568628, 1,
-0.4021007, 0.627491, 0.6428848, 0, 1, 0.02352941, 1,
-0.3980509, -0.3576427, -1.947336, 0, 1, 0.02745098, 1,
-0.3939343, -1.395827, -3.024701, 0, 1, 0.03529412, 1,
-0.3919662, 0.2287529, 0.04273001, 0, 1, 0.03921569, 1,
-0.3902168, 0.5080283, 0.6471437, 0, 1, 0.04705882, 1,
-0.3899162, 0.03087933, -0.4515665, 0, 1, 0.05098039, 1,
-0.3899126, 0.01485292, -1.828878, 0, 1, 0.05882353, 1,
-0.3897323, -0.5410723, -3.231987, 0, 1, 0.0627451, 1,
-0.3868181, 0.1689762, -1.738249, 0, 1, 0.07058824, 1,
-0.3860716, 0.1205439, 0.8906492, 0, 1, 0.07450981, 1,
-0.3822688, -1.788274, -4.160643, 0, 1, 0.08235294, 1,
-0.3768863, 1.048482, -0.2000911, 0, 1, 0.08627451, 1,
-0.3725115, 0.4334476, 0.5204394, 0, 1, 0.09411765, 1,
-0.3718239, -1.415533, -1.967573, 0, 1, 0.1019608, 1,
-0.3688138, -0.9101034, -3.549107, 0, 1, 0.1058824, 1,
-0.3619825, 0.3671969, -0.9423528, 0, 1, 0.1137255, 1,
-0.3602257, -0.2188721, -3.057949, 0, 1, 0.1176471, 1,
-0.3490131, 0.1153429, -0.988013, 0, 1, 0.1254902, 1,
-0.3489406, 1.112509, -1.996384, 0, 1, 0.1294118, 1,
-0.3476063, 0.9388039, -1.04953, 0, 1, 0.1372549, 1,
-0.3346517, 0.8474678, 0.8157782, 0, 1, 0.1411765, 1,
-0.3315597, -1.510052, -3.748431, 0, 1, 0.1490196, 1,
-0.328214, -0.05485664, -2.918984, 0, 1, 0.1529412, 1,
-0.3276867, -0.9401273, -2.324324, 0, 1, 0.1607843, 1,
-0.3261764, 0.5310342, 0.1689701, 0, 1, 0.1647059, 1,
-0.3161171, 1.142285, -0.4292903, 0, 1, 0.172549, 1,
-0.3110619, 0.6596785, -0.5108929, 0, 1, 0.1764706, 1,
-0.3098717, 1.1829, -1.830188, 0, 1, 0.1843137, 1,
-0.3083213, 0.2802804, -0.1029602, 0, 1, 0.1882353, 1,
-0.305051, -0.6688968, -1.225589, 0, 1, 0.1960784, 1,
-0.3049382, 0.4333156, -0.2043159, 0, 1, 0.2039216, 1,
-0.302022, -0.7877132, -3.188995, 0, 1, 0.2078431, 1,
-0.3007964, 0.4831666, -1.844608, 0, 1, 0.2156863, 1,
-0.2996668, 0.3831527, -2.787806, 0, 1, 0.2196078, 1,
-0.2985017, -1.017368, -3.519698, 0, 1, 0.227451, 1,
-0.2976992, 0.6058114, 1.256988, 0, 1, 0.2313726, 1,
-0.2975099, -0.03913646, -1.060069, 0, 1, 0.2392157, 1,
-0.2972035, -0.1255338, -3.038789, 0, 1, 0.2431373, 1,
-0.296143, 0.498241, -0.1267068, 0, 1, 0.2509804, 1,
-0.2957393, -0.3665943, -2.775443, 0, 1, 0.254902, 1,
-0.2937357, -0.4764576, -1.534492, 0, 1, 0.2627451, 1,
-0.2929733, -0.4560828, -1.632095, 0, 1, 0.2666667, 1,
-0.2897162, -0.1147659, -1.379089, 0, 1, 0.2745098, 1,
-0.2880938, 1.610546, 1.024717, 0, 1, 0.2784314, 1,
-0.2824868, 0.5924473, 0.42467, 0, 1, 0.2862745, 1,
-0.278408, -0.4614438, -4.146433, 0, 1, 0.2901961, 1,
-0.2772234, -0.2088354, -3.266221, 0, 1, 0.2980392, 1,
-0.2753176, -0.542003, -3.326793, 0, 1, 0.3058824, 1,
-0.2749787, -0.9560912, -3.181294, 0, 1, 0.3098039, 1,
-0.2664757, -0.3758827, -0.9779567, 0, 1, 0.3176471, 1,
-0.2634427, 0.3470968, -0.2686707, 0, 1, 0.3215686, 1,
-0.2628932, -0.6076249, -4.101274, 0, 1, 0.3294118, 1,
-0.2585495, -0.2299424, -1.519584, 0, 1, 0.3333333, 1,
-0.250484, 0.7796055, 0.3488463, 0, 1, 0.3411765, 1,
-0.2496203, -0.2391718, -2.773497, 0, 1, 0.345098, 1,
-0.2480617, -1.322201, -3.154954, 0, 1, 0.3529412, 1,
-0.2479054, -0.2938414, -2.853119, 0, 1, 0.3568628, 1,
-0.2455482, -0.07269038, -1.507681, 0, 1, 0.3647059, 1,
-0.2453381, -0.2676986, -3.660706, 0, 1, 0.3686275, 1,
-0.2428297, 0.750728, -1.115553, 0, 1, 0.3764706, 1,
-0.2371783, 1.658024, 0.9594015, 0, 1, 0.3803922, 1,
-0.2367146, -0.01695632, -0.1776247, 0, 1, 0.3882353, 1,
-0.2347709, 0.1001373, -0.3392562, 0, 1, 0.3921569, 1,
-0.2339154, -0.7993692, -1.626344, 0, 1, 0.4, 1,
-0.2338936, 1.389467, 1.749264, 0, 1, 0.4078431, 1,
-0.2334379, -1.492922, -3.012399, 0, 1, 0.4117647, 1,
-0.2330134, -1.007086, -5.556076, 0, 1, 0.4196078, 1,
-0.2305078, -0.04300155, -3.126852, 0, 1, 0.4235294, 1,
-0.2278912, -1.107653, -4.415978, 0, 1, 0.4313726, 1,
-0.2261111, -0.1726318, -3.094496, 0, 1, 0.4352941, 1,
-0.2228478, -0.4797263, -3.909776, 0, 1, 0.4431373, 1,
-0.2226731, 0.09254275, -1.306169, 0, 1, 0.4470588, 1,
-0.2207973, 0.8527344, -1.939427, 0, 1, 0.454902, 1,
-0.2185968, -0.03122951, -1.909034, 0, 1, 0.4588235, 1,
-0.2177899, -1.264745, -3.103187, 0, 1, 0.4666667, 1,
-0.2162902, 1.345619, 0.7352087, 0, 1, 0.4705882, 1,
-0.2160635, 0.3291355, -1.379108, 0, 1, 0.4784314, 1,
-0.2149333, -1.4174, -1.562156, 0, 1, 0.4823529, 1,
-0.2139035, 0.228985, -0.9578359, 0, 1, 0.4901961, 1,
-0.2109845, -2.225589, -3.831239, 0, 1, 0.4941176, 1,
-0.2095371, -0.1086486, -2.736407, 0, 1, 0.5019608, 1,
-0.2087199, -1.01811, -3.632111, 0, 1, 0.509804, 1,
-0.2069895, 1.825706, -0.2114926, 0, 1, 0.5137255, 1,
-0.2062924, -0.5275155, -1.620975, 0, 1, 0.5215687, 1,
-0.2051474, -1.323638, -3.296269, 0, 1, 0.5254902, 1,
-0.2027338, 0.8315279, -1.33651, 0, 1, 0.5333334, 1,
-0.2025982, -0.8621058, -2.589389, 0, 1, 0.5372549, 1,
-0.2009772, 0.6155617, -0.7888556, 0, 1, 0.5450981, 1,
-0.1965943, -0.5341791, -2.853696, 0, 1, 0.5490196, 1,
-0.1921975, -0.2902378, -2.202655, 0, 1, 0.5568628, 1,
-0.1920187, -0.2883228, -2.784664, 0, 1, 0.5607843, 1,
-0.1915018, 1.51534, 0.8077232, 0, 1, 0.5686275, 1,
-0.1900641, -0.1399218, -2.327059, 0, 1, 0.572549, 1,
-0.1862867, -0.0356661, -1.96466, 0, 1, 0.5803922, 1,
-0.1838742, 3.371357, 0.08174659, 0, 1, 0.5843138, 1,
-0.1764925, -0.9482, -3.912161, 0, 1, 0.5921569, 1,
-0.1755108, 1.130458, 0.280119, 0, 1, 0.5960785, 1,
-0.1703934, 1.164513, 0.533916, 0, 1, 0.6039216, 1,
-0.1606002, 0.003359508, -1.383904, 0, 1, 0.6117647, 1,
-0.1585439, 1.500275, -0.2259375, 0, 1, 0.6156863, 1,
-0.1577685, -0.2583337, -3.049138, 0, 1, 0.6235294, 1,
-0.1566565, -0.8824549, -2.166118, 0, 1, 0.627451, 1,
-0.1561782, 1.169416, -0.3326924, 0, 1, 0.6352941, 1,
-0.1524437, 2.177089, -0.01712076, 0, 1, 0.6392157, 1,
-0.1514045, 2.269925, 1.228082, 0, 1, 0.6470588, 1,
-0.1506495, 2.168248, 1.907326, 0, 1, 0.6509804, 1,
-0.1411145, 0.7733071, -1.916186, 0, 1, 0.6588235, 1,
-0.1404331, -0.3877305, -2.973018, 0, 1, 0.6627451, 1,
-0.1379531, -1.534181, -3.500769, 0, 1, 0.6705883, 1,
-0.126836, 0.2838525, 0.04919213, 0, 1, 0.6745098, 1,
-0.1237383, -0.3979826, -3.886679, 0, 1, 0.682353, 1,
-0.1198123, -0.009012789, -0.4547005, 0, 1, 0.6862745, 1,
-0.1189361, -0.2572825, -4.159298, 0, 1, 0.6941177, 1,
-0.1165408, 0.2559149, 0.2351057, 0, 1, 0.7019608, 1,
-0.1159278, 0.07665785, -2.307451, 0, 1, 0.7058824, 1,
-0.113557, 0.0791018, -1.725472, 0, 1, 0.7137255, 1,
-0.1123359, -0.268295, -2.327903, 0, 1, 0.7176471, 1,
-0.1123193, -0.6428688, -2.192595, 0, 1, 0.7254902, 1,
-0.1058913, 0.6632297, -0.3843035, 0, 1, 0.7294118, 1,
-0.09855942, -1.054532, -2.798951, 0, 1, 0.7372549, 1,
-0.09819099, -0.3619862, 0.9918851, 0, 1, 0.7411765, 1,
-0.09374462, -2.498915, -1.276619, 0, 1, 0.7490196, 1,
-0.08648819, 0.8449867, -0.136625, 0, 1, 0.7529412, 1,
-0.08248138, 0.6649252, -0.1240031, 0, 1, 0.7607843, 1,
-0.07850002, 0.2683941, 1.40788, 0, 1, 0.7647059, 1,
-0.07833143, -1.369883, -5.352184, 0, 1, 0.772549, 1,
-0.07705581, 0.709249, -0.06844058, 0, 1, 0.7764706, 1,
-0.07618305, 0.1048012, 0.4659947, 0, 1, 0.7843137, 1,
-0.07576833, -0.8227662, -1.626504, 0, 1, 0.7882353, 1,
-0.07415066, -0.3742166, -2.624895, 0, 1, 0.7960784, 1,
-0.07120591, 1.221267, -0.1154108, 0, 1, 0.8039216, 1,
-0.07010063, -0.9249111, -1.859144, 0, 1, 0.8078431, 1,
-0.06884829, 0.6498293, 0.4644356, 0, 1, 0.8156863, 1,
-0.06836577, -0.713826, -4.432489, 0, 1, 0.8196079, 1,
-0.06817129, -0.8336713, -4.189709, 0, 1, 0.827451, 1,
-0.06779759, -1.866878, -3.441687, 0, 1, 0.8313726, 1,
-0.06742428, -1.568677, -3.486336, 0, 1, 0.8392157, 1,
-0.06648843, -1.094229, -2.877934, 0, 1, 0.8431373, 1,
-0.06564543, -0.118016, -1.525163, 0, 1, 0.8509804, 1,
-0.06355863, -0.3564104, -3.899634, 0, 1, 0.854902, 1,
-0.06159799, -0.8761343, -3.017389, 0, 1, 0.8627451, 1,
-0.06116801, 1.2575, -0.1921577, 0, 1, 0.8666667, 1,
-0.05888967, -0.6019291, -3.188553, 0, 1, 0.8745098, 1,
-0.05438875, 0.04305824, -1.59681, 0, 1, 0.8784314, 1,
-0.05097064, -2.706794, -3.729444, 0, 1, 0.8862745, 1,
-0.04889199, 2.787198, 2.202737, 0, 1, 0.8901961, 1,
-0.0483941, 0.4643183, -0.282137, 0, 1, 0.8980392, 1,
-0.04715854, 2.351805, 0.7203836, 0, 1, 0.9058824, 1,
-0.04404965, -1.198918, -4.292355, 0, 1, 0.9098039, 1,
-0.04323855, -1.008839, -2.853877, 0, 1, 0.9176471, 1,
-0.03707298, 0.4570194, -0.1700193, 0, 1, 0.9215686, 1,
-0.03652519, -0.644407, -1.096619, 0, 1, 0.9294118, 1,
-0.03483534, -0.2480533, -3.990634, 0, 1, 0.9333333, 1,
-0.03416652, -1.000828, -3.423739, 0, 1, 0.9411765, 1,
-0.03194171, -1.416912, -4.334519, 0, 1, 0.945098, 1,
-0.02985493, -0.1808222, -2.786782, 0, 1, 0.9529412, 1,
-0.02825592, 1.251842, 2.009717, 0, 1, 0.9568627, 1,
-0.02534423, 0.1595102, 1.406374, 0, 1, 0.9647059, 1,
-0.02384109, 2.292528, 0.6199002, 0, 1, 0.9686275, 1,
-0.02063977, -1.141561, -1.897282, 0, 1, 0.9764706, 1,
-0.0138076, -1.572371, -2.936486, 0, 1, 0.9803922, 1,
-0.01276966, -0.4440783, -3.251118, 0, 1, 0.9882353, 1,
-0.009473373, -0.01448899, -3.462738, 0, 1, 0.9921569, 1,
-0.008842337, 1.341621, -0.08842316, 0, 1, 1, 1,
-0.007915862, -2.358984, -1.027605, 0, 0.9921569, 1, 1,
-0.006319893, 0.9491454, 0.4107522, 0, 0.9882353, 1, 1,
-0.006126679, -0.7139044, -2.146118, 0, 0.9803922, 1, 1,
-0.003500005, -1.982985, -3.644778, 0, 0.9764706, 1, 1,
-0.001920505, 0.3660204, -0.7643301, 0, 0.9686275, 1, 1,
-0.001836636, 0.3413173, 1.888751, 0, 0.9647059, 1, 1,
-0.00167998, 0.00144709, 0.08534402, 0, 0.9568627, 1, 1,
-0.0005434844, -1.147794, -2.543164, 0, 0.9529412, 1, 1,
0.0005770219, 0.773616, -0.7681652, 0, 0.945098, 1, 1,
0.001057965, -3.066679, 2.157171, 0, 0.9411765, 1, 1,
0.001798753, 0.3890371, -0.6096822, 0, 0.9333333, 1, 1,
0.004363917, 0.2526568, 0.2402737, 0, 0.9294118, 1, 1,
0.0052782, -0.1718909, 5.012952, 0, 0.9215686, 1, 1,
0.006635648, 1.483031, 1.455113, 0, 0.9176471, 1, 1,
0.01314221, -0.2819781, 3.25969, 0, 0.9098039, 1, 1,
0.01320293, 0.009704807, 0.6991066, 0, 0.9058824, 1, 1,
0.0150629, -0.04271542, 2.572937, 0, 0.8980392, 1, 1,
0.01616417, -0.5154044, 3.635343, 0, 0.8901961, 1, 1,
0.01731505, -2.453876, 4.67444, 0, 0.8862745, 1, 1,
0.02145223, -2.466136, 4.205594, 0, 0.8784314, 1, 1,
0.02325238, -0.2255219, 3.016801, 0, 0.8745098, 1, 1,
0.02362567, 1.707828, 0.715603, 0, 0.8666667, 1, 1,
0.02449235, 0.2253565, 0.1600895, 0, 0.8627451, 1, 1,
0.03105723, -0.1012448, 4.08778, 0, 0.854902, 1, 1,
0.03252218, 1.465708, -1.88588, 0, 0.8509804, 1, 1,
0.03295783, -0.1773669, 2.157578, 0, 0.8431373, 1, 1,
0.03301815, 0.1466874, 0.06326193, 0, 0.8392157, 1, 1,
0.03383888, -0.7268021, 3.349043, 0, 0.8313726, 1, 1,
0.03455063, -1.696172, 2.421835, 0, 0.827451, 1, 1,
0.03550476, -0.1108727, 3.328254, 0, 0.8196079, 1, 1,
0.03718165, -0.1787102, 1.625284, 0, 0.8156863, 1, 1,
0.03925964, -1.340794, 1.994259, 0, 0.8078431, 1, 1,
0.04280886, -0.4685161, 3.891516, 0, 0.8039216, 1, 1,
0.04386283, -1.268056, 4.770156, 0, 0.7960784, 1, 1,
0.04539167, 1.236564, 2.113791, 0, 0.7882353, 1, 1,
0.04932454, 1.200562, 1.079871, 0, 0.7843137, 1, 1,
0.04992305, -1.172514, 3.744728, 0, 0.7764706, 1, 1,
0.05092642, 0.003144596, -0.9009289, 0, 0.772549, 1, 1,
0.05261425, 0.8202767, -0.2306169, 0, 0.7647059, 1, 1,
0.05336922, -1.954914, 4.129694, 0, 0.7607843, 1, 1,
0.05490838, -0.5457567, 3.166961, 0, 0.7529412, 1, 1,
0.05511213, -0.138605, 0.9738222, 0, 0.7490196, 1, 1,
0.06487654, -0.5349177, 0.9577824, 0, 0.7411765, 1, 1,
0.0661173, 0.09431063, 0.8534418, 0, 0.7372549, 1, 1,
0.07188363, -0.06966707, 3.888792, 0, 0.7294118, 1, 1,
0.07244691, 1.261156, 1.419472, 0, 0.7254902, 1, 1,
0.08089915, -0.03282008, 0.6571338, 0, 0.7176471, 1, 1,
0.08215705, 1.385418, 3.693948, 0, 0.7137255, 1, 1,
0.0822649, 0.3192258, 1.791016, 0, 0.7058824, 1, 1,
0.08290475, 0.3434145, -1.364251, 0, 0.6980392, 1, 1,
0.08636747, 0.2279736, -1.245091, 0, 0.6941177, 1, 1,
0.09192398, -0.3511642, 1.977387, 0, 0.6862745, 1, 1,
0.09279162, -1.52557, 4.045733, 0, 0.682353, 1, 1,
0.09491719, 0.3575826, 0.2125428, 0, 0.6745098, 1, 1,
0.1009441, 2.14992, -0.4617641, 0, 0.6705883, 1, 1,
0.1024535, -0.09198493, 1.697293, 0, 0.6627451, 1, 1,
0.1043909, -1.246431, 2.57426, 0, 0.6588235, 1, 1,
0.1079659, 0.3858967, -1.15, 0, 0.6509804, 1, 1,
0.1085205, -0.3721948, 3.715375, 0, 0.6470588, 1, 1,
0.1151131, 0.008840351, 0.05933556, 0, 0.6392157, 1, 1,
0.1186568, 0.9610978, 0.2622261, 0, 0.6352941, 1, 1,
0.1200094, 0.1131586, 0.1325536, 0, 0.627451, 1, 1,
0.1210003, -0.02063064, 3.705313, 0, 0.6235294, 1, 1,
0.1231661, -0.4749874, 2.085009, 0, 0.6156863, 1, 1,
0.1256873, 1.035955, 0.2755255, 0, 0.6117647, 1, 1,
0.1307386, -1.439865, 1.952586, 0, 0.6039216, 1, 1,
0.1317571, 1.895243, 0.5670453, 0, 0.5960785, 1, 1,
0.132897, -1.580197, 2.652857, 0, 0.5921569, 1, 1,
0.1342164, -0.7421744, 3.436071, 0, 0.5843138, 1, 1,
0.1350445, 0.01369808, 0.3102079, 0, 0.5803922, 1, 1,
0.1370235, -0.5942933, 2.806264, 0, 0.572549, 1, 1,
0.1377763, -1.910923, 2.609689, 0, 0.5686275, 1, 1,
0.1416343, -0.9712821, 4.599589, 0, 0.5607843, 1, 1,
0.1426126, -0.3342936, 3.698614, 0, 0.5568628, 1, 1,
0.151085, -0.7420316, 4.587989, 0, 0.5490196, 1, 1,
0.151725, -2.522039, 3.199267, 0, 0.5450981, 1, 1,
0.1531641, 0.125083, -0.3832658, 0, 0.5372549, 1, 1,
0.1559456, 0.6861697, 1.390666, 0, 0.5333334, 1, 1,
0.1639353, -0.3330188, 4.531985, 0, 0.5254902, 1, 1,
0.165693, 0.113474, 2.731196, 0, 0.5215687, 1, 1,
0.1703712, -0.3366785, 2.804926, 0, 0.5137255, 1, 1,
0.1718673, 0.7953768, -0.4954961, 0, 0.509804, 1, 1,
0.1725129, -0.7765535, 4.345397, 0, 0.5019608, 1, 1,
0.1731759, 0.4586929, 1.986972, 0, 0.4941176, 1, 1,
0.1737286, -0.3828812, 2.245931, 0, 0.4901961, 1, 1,
0.1758542, -0.3276971, 3.481985, 0, 0.4823529, 1, 1,
0.1781796, -0.8728216, 1.442173, 0, 0.4784314, 1, 1,
0.1803935, 0.3472683, 1.508443, 0, 0.4705882, 1, 1,
0.1828588, -1.199426, 3.787605, 0, 0.4666667, 1, 1,
0.1842049, -0.2452934, 3.207597, 0, 0.4588235, 1, 1,
0.1870421, -0.05942078, 3.469523, 0, 0.454902, 1, 1,
0.191016, -0.04576214, 1.714311, 0, 0.4470588, 1, 1,
0.193962, 0.03072701, 1.130066, 0, 0.4431373, 1, 1,
0.1979481, -0.1503591, 0.7890921, 0, 0.4352941, 1, 1,
0.2014783, 1.192947, 0.1132113, 0, 0.4313726, 1, 1,
0.2023351, -0.797403, 2.877957, 0, 0.4235294, 1, 1,
0.2116086, -0.4418144, 4.620448, 0, 0.4196078, 1, 1,
0.2118497, -1.838043, 2.89373, 0, 0.4117647, 1, 1,
0.2166973, -1.478606, 3.237295, 0, 0.4078431, 1, 1,
0.2200926, 0.5103951, 0.9764775, 0, 0.4, 1, 1,
0.2215107, 0.2494233, 1.407239, 0, 0.3921569, 1, 1,
0.222344, -0.4140856, 2.0646, 0, 0.3882353, 1, 1,
0.22656, -0.6122783, 3.065518, 0, 0.3803922, 1, 1,
0.2312099, -1.125757, 3.512585, 0, 0.3764706, 1, 1,
0.2312331, 0.2072101, 1.227399, 0, 0.3686275, 1, 1,
0.2354934, 0.3756427, 0.8033022, 0, 0.3647059, 1, 1,
0.2371704, 1.320829, 1.45341, 0, 0.3568628, 1, 1,
0.2406119, -0.05687038, 1.429052, 0, 0.3529412, 1, 1,
0.2427635, -0.326619, 2.640697, 0, 0.345098, 1, 1,
0.2461157, 1.447832, 1.016546, 0, 0.3411765, 1, 1,
0.2471922, 0.9925982, -0.6842724, 0, 0.3333333, 1, 1,
0.2533477, 0.8359328, 0.1665833, 0, 0.3294118, 1, 1,
0.2543857, -0.9695278, 3.245743, 0, 0.3215686, 1, 1,
0.2570301, -0.6833959, 2.761332, 0, 0.3176471, 1, 1,
0.2591964, 1.190265, 1.117727, 0, 0.3098039, 1, 1,
0.2616291, 0.5830168, -0.3406439, 0, 0.3058824, 1, 1,
0.2718271, 0.2613214, 0.4779814, 0, 0.2980392, 1, 1,
0.2732705, -0.5464289, 2.591702, 0, 0.2901961, 1, 1,
0.2753356, -0.486246, 4.106621, 0, 0.2862745, 1, 1,
0.2754937, -0.6252967, 4.521282, 0, 0.2784314, 1, 1,
0.2797163, -1.037163, 3.492719, 0, 0.2745098, 1, 1,
0.2814757, 1.384202, 0.559664, 0, 0.2666667, 1, 1,
0.2869037, 1.213478, -0.4388442, 0, 0.2627451, 1, 1,
0.2870874, -1.027905, 2.509813, 0, 0.254902, 1, 1,
0.2876089, -0.08258973, 4.326777, 0, 0.2509804, 1, 1,
0.2934366, 0.4804052, -0.9777536, 0, 0.2431373, 1, 1,
0.2946491, -0.6828414, 3.220941, 0, 0.2392157, 1, 1,
0.2969082, -1.149922, 2.055074, 0, 0.2313726, 1, 1,
0.29971, -0.9499675, 3.141968, 0, 0.227451, 1, 1,
0.3016638, 1.373352, 1.251328, 0, 0.2196078, 1, 1,
0.3053399, 0.6743724, -1.195801, 0, 0.2156863, 1, 1,
0.3077069, 0.2263535, 3.242936, 0, 0.2078431, 1, 1,
0.3089394, 2.047795, 0.1258855, 0, 0.2039216, 1, 1,
0.3094174, -0.5384029, 2.193556, 0, 0.1960784, 1, 1,
0.3106495, 0.516316, -0.2876368, 0, 0.1882353, 1, 1,
0.3164614, -0.2248796, 1.817437, 0, 0.1843137, 1, 1,
0.3169279, 1.046422, 0.5175416, 0, 0.1764706, 1, 1,
0.3202064, -0.3037265, 2.646028, 0, 0.172549, 1, 1,
0.3204546, 0.5828636, 0.9979213, 0, 0.1647059, 1, 1,
0.3237148, -0.9863586, 2.222527, 0, 0.1607843, 1, 1,
0.3248184, -1.036589, 2.699515, 0, 0.1529412, 1, 1,
0.3284384, 0.03307618, 1.094928, 0, 0.1490196, 1, 1,
0.3310629, 0.5763106, 1.799607, 0, 0.1411765, 1, 1,
0.3312336, -0.6362168, 2.766837, 0, 0.1372549, 1, 1,
0.3330388, 1.327485, -0.2309372, 0, 0.1294118, 1, 1,
0.334936, 0.6580527, 0.5114447, 0, 0.1254902, 1, 1,
0.3372038, 1.647941, 0.4041435, 0, 0.1176471, 1, 1,
0.338922, 0.7883903, 0.9580465, 0, 0.1137255, 1, 1,
0.339491, 0.2280494, 1.94962, 0, 0.1058824, 1, 1,
0.3466707, 0.5183648, 0.2719048, 0, 0.09803922, 1, 1,
0.3490689, -0.006907137, 0.6182691, 0, 0.09411765, 1, 1,
0.3498753, -0.09029859, 1.86299, 0, 0.08627451, 1, 1,
0.3512528, -1.499357, 3.64226, 0, 0.08235294, 1, 1,
0.3532777, 1.550962, -0.3280595, 0, 0.07450981, 1, 1,
0.3551253, 0.2313693, 1.147762, 0, 0.07058824, 1, 1,
0.3575008, -0.3743834, 2.102039, 0, 0.0627451, 1, 1,
0.3594361, 1.047266, 1.669597, 0, 0.05882353, 1, 1,
0.3635981, 0.9064293, -1.529376, 0, 0.05098039, 1, 1,
0.3653932, 1.208889, 1.435103, 0, 0.04705882, 1, 1,
0.3666373, 0.7452174, 0.4519087, 0, 0.03921569, 1, 1,
0.3679469, -0.2146742, 3.232902, 0, 0.03529412, 1, 1,
0.3685033, -0.6657636, 4.64613, 0, 0.02745098, 1, 1,
0.3705712, -0.04831178, 1.69611, 0, 0.02352941, 1, 1,
0.3747836, -0.4380312, 2.824645, 0, 0.01568628, 1, 1,
0.3773106, 0.3862439, 0.563842, 0, 0.01176471, 1, 1,
0.378265, -0.09181707, 1.296108, 0, 0.003921569, 1, 1,
0.3786038, 0.1818326, 1.093331, 0.003921569, 0, 1, 1,
0.3792287, 0.9957134, 0.6722746, 0.007843138, 0, 1, 1,
0.3793456, 0.2384354, -0.1403134, 0.01568628, 0, 1, 1,
0.3799824, 1.220516, 0.7321524, 0.01960784, 0, 1, 1,
0.3835673, -1.439792, 1.500861, 0.02745098, 0, 1, 1,
0.3864356, 2.323953, 1.84156, 0.03137255, 0, 1, 1,
0.3875884, 0.3508538, 1.420273, 0.03921569, 0, 1, 1,
0.3895826, 0.1703236, 0.4679694, 0.04313726, 0, 1, 1,
0.3902769, -0.9063129, 2.337928, 0.05098039, 0, 1, 1,
0.3916821, -0.7993167, 2.260787, 0.05490196, 0, 1, 1,
0.3984278, -0.7268534, 3.095213, 0.0627451, 0, 1, 1,
0.3986309, 0.001985822, 0.8629287, 0.06666667, 0, 1, 1,
0.4046319, 0.6121657, 0.549126, 0.07450981, 0, 1, 1,
0.4075566, 0.8892558, 1.481186, 0.07843138, 0, 1, 1,
0.4078924, -1.687763, 2.446187, 0.08627451, 0, 1, 1,
0.410777, 1.511485, -0.8344525, 0.09019608, 0, 1, 1,
0.4115269, -0.3030862, 0.3338391, 0.09803922, 0, 1, 1,
0.4123658, -0.7856399, 2.167932, 0.1058824, 0, 1, 1,
0.4136423, -0.1066183, 0.784404, 0.1098039, 0, 1, 1,
0.415162, 1.444844, -0.0361634, 0.1176471, 0, 1, 1,
0.4162158, -0.9490369, 2.863454, 0.1215686, 0, 1, 1,
0.4189844, -0.2963751, 0.7891052, 0.1294118, 0, 1, 1,
0.4190878, 0.04910495, 0.7115793, 0.1333333, 0, 1, 1,
0.419535, -0.3103504, 1.039706, 0.1411765, 0, 1, 1,
0.4199957, 0.5050606, 2.113841, 0.145098, 0, 1, 1,
0.4202724, -0.6949344, 1.43671, 0.1529412, 0, 1, 1,
0.4230393, 1.000333, -0.7191558, 0.1568628, 0, 1, 1,
0.4236257, -0.7982142, 3.091054, 0.1647059, 0, 1, 1,
0.4238471, -0.6467351, 2.134706, 0.1686275, 0, 1, 1,
0.4263707, 0.9124784, 0.4900917, 0.1764706, 0, 1, 1,
0.4278866, 0.4965665, -0.5070249, 0.1803922, 0, 1, 1,
0.4323699, -0.7278751, 2.963433, 0.1882353, 0, 1, 1,
0.4387464, -0.02864095, -0.3364498, 0.1921569, 0, 1, 1,
0.4394302, -0.1246683, 1.484254, 0.2, 0, 1, 1,
0.4403269, 0.854149, 1.204342, 0.2078431, 0, 1, 1,
0.4404571, 0.5919035, -0.1839161, 0.2117647, 0, 1, 1,
0.4432177, 0.1787798, 2.233141, 0.2196078, 0, 1, 1,
0.4456178, -1.401615, 4.582988, 0.2235294, 0, 1, 1,
0.4486686, -0.5587183, 3.016647, 0.2313726, 0, 1, 1,
0.4488816, -1.461151, 0.6769993, 0.2352941, 0, 1, 1,
0.456463, 2.337909, 1.26547, 0.2431373, 0, 1, 1,
0.4570901, 0.01616402, 1.571532, 0.2470588, 0, 1, 1,
0.4580809, 0.8392428, 1.497386, 0.254902, 0, 1, 1,
0.4585233, 0.5236148, -0.2355382, 0.2588235, 0, 1, 1,
0.4591173, -1.536883, 3.97847, 0.2666667, 0, 1, 1,
0.4671585, -0.4903332, 1.434516, 0.2705882, 0, 1, 1,
0.4752442, -0.534439, 2.856823, 0.2784314, 0, 1, 1,
0.4758458, 0.7918651, 0.2061233, 0.282353, 0, 1, 1,
0.4759061, -0.4423608, 1.374734, 0.2901961, 0, 1, 1,
0.4762874, 0.3356923, -0.7082185, 0.2941177, 0, 1, 1,
0.4836853, 0.1541636, 1.687729, 0.3019608, 0, 1, 1,
0.4889993, 0.1874568, 2.093724, 0.3098039, 0, 1, 1,
0.4892719, 1.73, -0.153129, 0.3137255, 0, 1, 1,
0.4913757, -2.437588, 2.511454, 0.3215686, 0, 1, 1,
0.4917035, -0.6166596, 3.279506, 0.3254902, 0, 1, 1,
0.493995, 1.73349, -0.09360483, 0.3333333, 0, 1, 1,
0.4968972, 0.914432, 1.038659, 0.3372549, 0, 1, 1,
0.5007429, -1.806979, 1.588096, 0.345098, 0, 1, 1,
0.5013403, 0.2838835, 1.379596, 0.3490196, 0, 1, 1,
0.504105, -2.251832, 4.531845, 0.3568628, 0, 1, 1,
0.5052269, 0.4991128, 0.8851211, 0.3607843, 0, 1, 1,
0.5088468, -0.9364358, 2.803539, 0.3686275, 0, 1, 1,
0.5182402, -0.0550314, 0.5411007, 0.372549, 0, 1, 1,
0.5188094, -0.4942871, 1.154242, 0.3803922, 0, 1, 1,
0.5190719, -0.5988699, 2.973224, 0.3843137, 0, 1, 1,
0.5245169, 0.2013518, 1.135767, 0.3921569, 0, 1, 1,
0.5253839, -0.4007339, 3.385928, 0.3960784, 0, 1, 1,
0.5290917, -0.09705992, 1.258801, 0.4039216, 0, 1, 1,
0.5334588, -0.5069126, 3.46214, 0.4117647, 0, 1, 1,
0.5375716, 0.5958283, 1.656694, 0.4156863, 0, 1, 1,
0.538719, -0.9712512, 2.250926, 0.4235294, 0, 1, 1,
0.5393156, 0.2535644, 0.4309162, 0.427451, 0, 1, 1,
0.5403109, -1.302008, 1.831793, 0.4352941, 0, 1, 1,
0.5409251, -0.08203673, 1.85953, 0.4392157, 0, 1, 1,
0.5417214, 0.9567592, 1.267769, 0.4470588, 0, 1, 1,
0.5462891, -0.3694072, 2.846888, 0.4509804, 0, 1, 1,
0.5478919, 0.2683966, 0.6571872, 0.4588235, 0, 1, 1,
0.5528205, 0.333195, 2.122602, 0.4627451, 0, 1, 1,
0.5620198, -0.2511669, 0.1982206, 0.4705882, 0, 1, 1,
0.5620632, 0.06532214, 3.52067, 0.4745098, 0, 1, 1,
0.5652087, 0.7579233, 0.5745155, 0.4823529, 0, 1, 1,
0.5738115, 1.131674, 0.2810754, 0.4862745, 0, 1, 1,
0.574429, -0.3992236, 2.118426, 0.4941176, 0, 1, 1,
0.5771685, -1.028121, 2.130644, 0.5019608, 0, 1, 1,
0.5780054, 1.236262, -0.4186552, 0.5058824, 0, 1, 1,
0.581544, 0.1434685, 1.256471, 0.5137255, 0, 1, 1,
0.5829009, -0.6912799, 2.502971, 0.5176471, 0, 1, 1,
0.5863799, 2.017833, -0.4400159, 0.5254902, 0, 1, 1,
0.5901736, -1.484498, 1.727061, 0.5294118, 0, 1, 1,
0.6057022, 1.553454, 0.726785, 0.5372549, 0, 1, 1,
0.6065844, -0.2554896, 2.766213, 0.5411765, 0, 1, 1,
0.6109452, 0.8434931, 1.230085, 0.5490196, 0, 1, 1,
0.6114471, 0.1861515, 1.05525, 0.5529412, 0, 1, 1,
0.612305, -1.635021, 2.31522, 0.5607843, 0, 1, 1,
0.6126624, 0.1641888, -0.8605993, 0.5647059, 0, 1, 1,
0.6127575, -1.646916, -0.1908179, 0.572549, 0, 1, 1,
0.6136138, 0.0006560941, 0.05589274, 0.5764706, 0, 1, 1,
0.6136707, -1.677638, 2.978918, 0.5843138, 0, 1, 1,
0.6142463, 1.64113, 0.3008548, 0.5882353, 0, 1, 1,
0.6144557, -0.0540018, 1.799597, 0.5960785, 0, 1, 1,
0.6192819, -0.0622219, -0.7024471, 0.6039216, 0, 1, 1,
0.6223142, 1.018446, 1.146501, 0.6078432, 0, 1, 1,
0.6256886, 0.0275833, 1.721952, 0.6156863, 0, 1, 1,
0.6285765, 1.417366, -0.01432136, 0.6196079, 0, 1, 1,
0.632364, -1.094933, 2.60926, 0.627451, 0, 1, 1,
0.6330646, 0.0713236, 0.6617617, 0.6313726, 0, 1, 1,
0.6359168, -0.1896448, 1.648375, 0.6392157, 0, 1, 1,
0.6457342, -0.3225522, 1.473135, 0.6431373, 0, 1, 1,
0.6477343, 1.501879, 1.067948, 0.6509804, 0, 1, 1,
0.6513754, 0.6655814, 1.477629, 0.654902, 0, 1, 1,
0.6555606, 0.8634977, -0.2154925, 0.6627451, 0, 1, 1,
0.6577287, -2.088834, 1.488128, 0.6666667, 0, 1, 1,
0.6587204, -0.08581316, 1.044076, 0.6745098, 0, 1, 1,
0.6625479, 1.67596, 0.6457384, 0.6784314, 0, 1, 1,
0.670663, 1.322302, 0.03438377, 0.6862745, 0, 1, 1,
0.6765054, -0.1691571, 2.942471, 0.6901961, 0, 1, 1,
0.6765092, -0.4596731, 1.204012, 0.6980392, 0, 1, 1,
0.6770518, -0.1547568, 2.935068, 0.7058824, 0, 1, 1,
0.6779, 1.61244, 1.261626, 0.7098039, 0, 1, 1,
0.6800793, -0.7705836, 0.06533431, 0.7176471, 0, 1, 1,
0.6850513, 0.405931, 1.390732, 0.7215686, 0, 1, 1,
0.6864846, -0.7082564, 2.038376, 0.7294118, 0, 1, 1,
0.6866301, 0.7604935, 1.150354, 0.7333333, 0, 1, 1,
0.6928404, 0.2543536, 3.120048, 0.7411765, 0, 1, 1,
0.6932303, -0.7734271, 2.707905, 0.7450981, 0, 1, 1,
0.69908, 0.8913222, 1.543138, 0.7529412, 0, 1, 1,
0.7008095, 0.7238196, 0.6299789, 0.7568628, 0, 1, 1,
0.7013544, -1.628041, 3.16259, 0.7647059, 0, 1, 1,
0.7017515, 1.846771, 0.14672, 0.7686275, 0, 1, 1,
0.7057487, -1.612977, 2.487525, 0.7764706, 0, 1, 1,
0.7074305, 0.05867794, 0.9288803, 0.7803922, 0, 1, 1,
0.7125468, 0.4210238, 1.845773, 0.7882353, 0, 1, 1,
0.7195464, 0.892657, 1.599971, 0.7921569, 0, 1, 1,
0.7214703, 0.4261402, 2.159325, 0.8, 0, 1, 1,
0.7327853, 0.6986339, 1.662326, 0.8078431, 0, 1, 1,
0.7334978, -1.369552, 5.037191, 0.8117647, 0, 1, 1,
0.7417558, 0.7973179, -0.02933467, 0.8196079, 0, 1, 1,
0.7428523, 0.6047842, 0.7631537, 0.8235294, 0, 1, 1,
0.746278, 2.35698, 2.427426, 0.8313726, 0, 1, 1,
0.7538046, 0.430901, 1.303034, 0.8352941, 0, 1, 1,
0.7540299, -1.315943, 2.279099, 0.8431373, 0, 1, 1,
0.7569904, -2.969202, 3.152419, 0.8470588, 0, 1, 1,
0.7580726, 1.106037, 0.7500678, 0.854902, 0, 1, 1,
0.758485, 2.47452, 1.87867, 0.8588235, 0, 1, 1,
0.7657412, 0.008247625, 2.263903, 0.8666667, 0, 1, 1,
0.7676817, -1.546154, 3.731258, 0.8705882, 0, 1, 1,
0.7684422, -0.1553674, 1.42538, 0.8784314, 0, 1, 1,
0.7697961, -0.8880462, 2.687533, 0.8823529, 0, 1, 1,
0.7774884, -0.2717432, 0.4890026, 0.8901961, 0, 1, 1,
0.7797015, -0.7535251, 3.653977, 0.8941177, 0, 1, 1,
0.7820524, 0.8245205, 1.087054, 0.9019608, 0, 1, 1,
0.7984086, 0.01831741, 1.712797, 0.9098039, 0, 1, 1,
0.7997719, -0.3600689, 2.525208, 0.9137255, 0, 1, 1,
0.8044912, -1.541028, 2.298532, 0.9215686, 0, 1, 1,
0.811657, -1.125214, 4.890892, 0.9254902, 0, 1, 1,
0.8121845, 0.6979224, 2.007493, 0.9333333, 0, 1, 1,
0.8324225, 0.3493552, 2.912586, 0.9372549, 0, 1, 1,
0.8415396, 1.190171, 0.1583851, 0.945098, 0, 1, 1,
0.8464659, -0.8763505, 3.413524, 0.9490196, 0, 1, 1,
0.848159, -0.3256398, 1.874246, 0.9568627, 0, 1, 1,
0.8507555, -0.5907142, 2.383761, 0.9607843, 0, 1, 1,
0.8547071, 0.512626, 1.668748, 0.9686275, 0, 1, 1,
0.8608412, 0.9770845, -1.700903, 0.972549, 0, 1, 1,
0.8658299, -0.7644576, 2.60357, 0.9803922, 0, 1, 1,
0.8675442, -0.3513732, 3.329098, 0.9843137, 0, 1, 1,
0.8710101, -1.22596, 4.248018, 0.9921569, 0, 1, 1,
0.876819, -0.6260864, 1.205037, 0.9960784, 0, 1, 1,
0.8855481, -0.2678689, 0.5118417, 1, 0, 0.9960784, 1,
0.8970216, -0.04293671, 1.238268, 1, 0, 0.9882353, 1,
0.8982406, 1.578304, 1.444536, 1, 0, 0.9843137, 1,
0.9033374, 0.50563, 0.389717, 1, 0, 0.9764706, 1,
0.9081997, -0.4320599, 2.531447, 1, 0, 0.972549, 1,
0.913111, 1.32676, 2.255471, 1, 0, 0.9647059, 1,
0.9142034, -1.312954, 3.684189, 1, 0, 0.9607843, 1,
0.9233482, -1.492959, 1.54091, 1, 0, 0.9529412, 1,
0.9312321, 1.935126, -0.0262739, 1, 0, 0.9490196, 1,
0.9326159, -0.6589032, 2.029124, 1, 0, 0.9411765, 1,
0.9359092, 0.435076, 3.25233, 1, 0, 0.9372549, 1,
0.9404249, -0.7503225, 2.835393, 1, 0, 0.9294118, 1,
0.9508607, -2.154471, 3.756932, 1, 0, 0.9254902, 1,
0.9545766, 0.1465506, 2.088658, 1, 0, 0.9176471, 1,
0.958686, -0.1964125, 1.705621, 1, 0, 0.9137255, 1,
0.9605018, 1.467929, -1.277502, 1, 0, 0.9058824, 1,
0.9650034, 0.327947, 2.490617, 1, 0, 0.9019608, 1,
0.9709236, -0.3277651, -0.01064114, 1, 0, 0.8941177, 1,
0.9788809, -1.4671, 4.074248, 1, 0, 0.8862745, 1,
0.9892258, 1.850584, 0.6010448, 1, 0, 0.8823529, 1,
0.9916275, 0.5199356, 1.239536, 1, 0, 0.8745098, 1,
0.9968523, 1.483269, 1.968564, 1, 0, 0.8705882, 1,
0.9980715, 1.132375, 1.083684, 1, 0, 0.8627451, 1,
0.9989452, -1.000487, 2.569667, 1, 0, 0.8588235, 1,
1.000633, 0.7536334, 0.01440728, 1, 0, 0.8509804, 1,
1.002448, -1.31103, 3.140062, 1, 0, 0.8470588, 1,
1.013823, 0.1650699, 0.6659895, 1, 0, 0.8392157, 1,
1.015548, -1.004151, 1.188417, 1, 0, 0.8352941, 1,
1.023801, 0.6476544, -0.2720583, 1, 0, 0.827451, 1,
1.025419, 0.6721945, 1.533665, 1, 0, 0.8235294, 1,
1.025668, 1.063803, 2.111566, 1, 0, 0.8156863, 1,
1.028172, 0.03875225, 1.905323, 1, 0, 0.8117647, 1,
1.030466, -1.74843, 3.50421, 1, 0, 0.8039216, 1,
1.03252, 1.424425, 1.311096, 1, 0, 0.7960784, 1,
1.033568, -0.5876756, 2.06679, 1, 0, 0.7921569, 1,
1.036436, -0.9613482, 3.372572, 1, 0, 0.7843137, 1,
1.046054, 2.014693, -0.1082425, 1, 0, 0.7803922, 1,
1.053003, -0.5304815, 2.289363, 1, 0, 0.772549, 1,
1.054121, -2.706543, 1.891248, 1, 0, 0.7686275, 1,
1.058017, 0.3034675, 1.425956, 1, 0, 0.7607843, 1,
1.065366, 1.259983, 0.05402866, 1, 0, 0.7568628, 1,
1.066448, 0.9013221, -0.7266967, 1, 0, 0.7490196, 1,
1.067417, -0.1438059, 1.408482, 1, 0, 0.7450981, 1,
1.074442, 0.3364552, 1.252896, 1, 0, 0.7372549, 1,
1.076751, -0.3555188, 1.98789, 1, 0, 0.7333333, 1,
1.078587, -0.2937948, 0.4381535, 1, 0, 0.7254902, 1,
1.086296, 0.2202257, 1.910234, 1, 0, 0.7215686, 1,
1.089967, -0.3946496, 3.239686, 1, 0, 0.7137255, 1,
1.093119, -0.2039451, 3.0751, 1, 0, 0.7098039, 1,
1.094831, 1.616827, 0.06845964, 1, 0, 0.7019608, 1,
1.100701, 1.585044, -0.002039637, 1, 0, 0.6941177, 1,
1.105005, 2.25527, 0.2115411, 1, 0, 0.6901961, 1,
1.11052, -0.3353357, 1.855595, 1, 0, 0.682353, 1,
1.121556, 0.6033477, 1.49803, 1, 0, 0.6784314, 1,
1.121984, -0.4678991, 1.981023, 1, 0, 0.6705883, 1,
1.125017, 0.5072672, 2.836111, 1, 0, 0.6666667, 1,
1.125076, -0.6365837, 2.455842, 1, 0, 0.6588235, 1,
1.126089, -0.6925431, 3.026286, 1, 0, 0.654902, 1,
1.128247, 0.2457284, 0.2981319, 1, 0, 0.6470588, 1,
1.131512, 1.200831, -1.048618, 1, 0, 0.6431373, 1,
1.142328, 0.5130726, 2.153674, 1, 0, 0.6352941, 1,
1.14243, -0.6863755, 1.313414, 1, 0, 0.6313726, 1,
1.144536, -1.46927, 2.427338, 1, 0, 0.6235294, 1,
1.146221, -0.7302511, 1.061904, 1, 0, 0.6196079, 1,
1.147563, 0.07968605, 0.3630945, 1, 0, 0.6117647, 1,
1.152205, -1.024603, 2.119509, 1, 0, 0.6078432, 1,
1.153116, -0.1298068, -0.08245295, 1, 0, 0.6, 1,
1.156681, -0.6118594, 1.99894, 1, 0, 0.5921569, 1,
1.172116, -0.8326241, 1.360994, 1, 0, 0.5882353, 1,
1.179404, -0.6848444, -0.05772373, 1, 0, 0.5803922, 1,
1.186881, 1.688889, -0.7293538, 1, 0, 0.5764706, 1,
1.187749, 0.8605567, 0.03638538, 1, 0, 0.5686275, 1,
1.188387, -0.7663328, 3.218672, 1, 0, 0.5647059, 1,
1.188884, -0.7955334, 2.836926, 1, 0, 0.5568628, 1,
1.194813, -0.8487014, 1.407205, 1, 0, 0.5529412, 1,
1.196346, 1.192747, 0.9034851, 1, 0, 0.5450981, 1,
1.201935, 0.9394891, -0.3602356, 1, 0, 0.5411765, 1,
1.227263, -0.7883679, 2.254627, 1, 0, 0.5333334, 1,
1.22795, 0.08001806, 2.942645, 1, 0, 0.5294118, 1,
1.234109, -0.9619648, 1.633037, 1, 0, 0.5215687, 1,
1.236207, -1.15059, 2.685659, 1, 0, 0.5176471, 1,
1.240457, 1.788053, 0.2512369, 1, 0, 0.509804, 1,
1.243279, -0.8008643, 2.754246, 1, 0, 0.5058824, 1,
1.246918, 0.1553116, 1.454069, 1, 0, 0.4980392, 1,
1.251271, -1.737126, 1.344446, 1, 0, 0.4901961, 1,
1.283084, 1.881785, 1.176771, 1, 0, 0.4862745, 1,
1.298037, 1.661245, -1.060551, 1, 0, 0.4784314, 1,
1.300199, 0.1145062, 0.02237375, 1, 0, 0.4745098, 1,
1.301122, 0.0801894, 2.400062, 1, 0, 0.4666667, 1,
1.305728, -0.6479272, 1.78078, 1, 0, 0.4627451, 1,
1.323633, 0.3419735, 1.85434, 1, 0, 0.454902, 1,
1.331846, -0.3606275, 0.4345426, 1, 0, 0.4509804, 1,
1.332606, 0.3852727, 2.962324, 1, 0, 0.4431373, 1,
1.340287, -1.273499, 0.5251024, 1, 0, 0.4392157, 1,
1.348475, -0.5845178, 2.621833, 1, 0, 0.4313726, 1,
1.358512, 2.534409, 1.102913, 1, 0, 0.427451, 1,
1.366987, 1.554253, 1.254919, 1, 0, 0.4196078, 1,
1.368314, 0.199645, 0.6473513, 1, 0, 0.4156863, 1,
1.368578, 0.6208599, 1.442297, 1, 0, 0.4078431, 1,
1.373779, -0.9756537, 1.981977, 1, 0, 0.4039216, 1,
1.378075, -0.1244558, 1.739633, 1, 0, 0.3960784, 1,
1.385051, -0.3514358, 2.436194, 1, 0, 0.3882353, 1,
1.38597, 0.7958448, -0.1685783, 1, 0, 0.3843137, 1,
1.386635, 0.5730389, 0.9668061, 1, 0, 0.3764706, 1,
1.421403, 0.3560605, 1.795883, 1, 0, 0.372549, 1,
1.421843, 0.2892666, 1.311315, 1, 0, 0.3647059, 1,
1.43464, -0.4029664, 1.825784, 1, 0, 0.3607843, 1,
1.435765, -0.4971554, 0.4901766, 1, 0, 0.3529412, 1,
1.436078, -1.304605, 1.224372, 1, 0, 0.3490196, 1,
1.442516, 1.05894, 0.3801176, 1, 0, 0.3411765, 1,
1.443096, -0.3422555, 1.920512, 1, 0, 0.3372549, 1,
1.447946, -1.448544, 4.198124, 1, 0, 0.3294118, 1,
1.449164, 0.2866246, 2.399042, 1, 0, 0.3254902, 1,
1.488412, -1.665231, 2.327823, 1, 0, 0.3176471, 1,
1.510429, -0.7452412, 2.998114, 1, 0, 0.3137255, 1,
1.542407, 1.252584, -0.3654611, 1, 0, 0.3058824, 1,
1.553457, 0.5979045, 1.036054, 1, 0, 0.2980392, 1,
1.554249, 0.2805156, 0.2054845, 1, 0, 0.2941177, 1,
1.566214, -0.2939027, 2.859709, 1, 0, 0.2862745, 1,
1.569072, 0.289967, 0.5776145, 1, 0, 0.282353, 1,
1.626715, 1.515818, 0.6656533, 1, 0, 0.2745098, 1,
1.645928, -0.5497724, 1.872684, 1, 0, 0.2705882, 1,
1.66054, -0.8052622, 3.735397, 1, 0, 0.2627451, 1,
1.663575, 1.632302, -0.08646944, 1, 0, 0.2588235, 1,
1.670305, -0.2545928, 0.6096085, 1, 0, 0.2509804, 1,
1.679714, -0.7776715, 0.9662302, 1, 0, 0.2470588, 1,
1.690616, -0.7411513, 1.903378, 1, 0, 0.2392157, 1,
1.698825, 1.503141, -1.714885, 1, 0, 0.2352941, 1,
1.71111, 0.5817359, 0.2372604, 1, 0, 0.227451, 1,
1.734767, -0.1327858, 0.1821015, 1, 0, 0.2235294, 1,
1.743539, -1.222402, 1.370491, 1, 0, 0.2156863, 1,
1.749264, -0.2381576, 2.767334, 1, 0, 0.2117647, 1,
1.751894, -0.2467662, 2.491737, 1, 0, 0.2039216, 1,
1.755619, 0.6273817, 2.91298, 1, 0, 0.1960784, 1,
1.773665, 0.8027852, 2.118415, 1, 0, 0.1921569, 1,
1.784111, -0.3575449, 2.28804, 1, 0, 0.1843137, 1,
1.801681, -0.7026159, -0.3049684, 1, 0, 0.1803922, 1,
1.822647, 0.1483593, 1.103945, 1, 0, 0.172549, 1,
1.825164, 0.4139264, 2.161135, 1, 0, 0.1686275, 1,
1.859022, 0.1350253, 0.1032405, 1, 0, 0.1607843, 1,
1.891353, 0.06891696, 2.482793, 1, 0, 0.1568628, 1,
1.891652, 0.3255942, 1.14689, 1, 0, 0.1490196, 1,
1.905973, 1.882061, -0.2221881, 1, 0, 0.145098, 1,
1.917482, 0.352587, -0.7331457, 1, 0, 0.1372549, 1,
1.930395, -0.6572573, 1.33699, 1, 0, 0.1333333, 1,
1.939974, 0.1423311, 0.2966401, 1, 0, 0.1254902, 1,
1.940485, -1.023092, 2.409963, 1, 0, 0.1215686, 1,
1.966326, 0.4067175, 0.4839913, 1, 0, 0.1137255, 1,
1.971875, -1.933675, 4.298781, 1, 0, 0.1098039, 1,
1.994361, -0.7073165, 0.755065, 1, 0, 0.1019608, 1,
2.018133, -1.155786, 2.452026, 1, 0, 0.09411765, 1,
2.054866, 2.066025, 1.206393, 1, 0, 0.09019608, 1,
2.138818, 1.100349, 0.1646507, 1, 0, 0.08235294, 1,
2.148071, -0.4381636, -0.8057107, 1, 0, 0.07843138, 1,
2.290833, -0.05342989, 1.410868, 1, 0, 0.07058824, 1,
2.317767, -0.4985943, 1.945411, 1, 0, 0.06666667, 1,
2.330649, -1.56277, 3.337582, 1, 0, 0.05882353, 1,
2.432511, 1.062687, 0.7389936, 1, 0, 0.05490196, 1,
2.444983, -0.1237829, 2.168617, 1, 0, 0.04705882, 1,
2.521617, 0.2754396, 0.999498, 1, 0, 0.04313726, 1,
2.555165, 0.771778, 1.493436, 1, 0, 0.03529412, 1,
2.636096, -1.440296, 1.756934, 1, 0, 0.03137255, 1,
2.693208, 0.07755926, 1.479728, 1, 0, 0.02352941, 1,
2.881422, -0.9428776, 3.143879, 1, 0, 0.01960784, 1,
2.932349, -2.320657, 2.939037, 1, 0, 0.01176471, 1,
3.044147, 1.745013, 0.8802419, 1, 0, 0.007843138, 1
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
0.1216128, -4.157926, -7.521029, 0, -0.5, 0.5, 0.5,
0.1216128, -4.157926, -7.521029, 1, -0.5, 0.5, 0.5,
0.1216128, -4.157926, -7.521029, 1, 1.5, 0.5, 0.5,
0.1216128, -4.157926, -7.521029, 0, 1.5, 0.5, 0.5
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
-3.79166, 0.1523392, -7.521029, 0, -0.5, 0.5, 0.5,
-3.79166, 0.1523392, -7.521029, 1, -0.5, 0.5, 0.5,
-3.79166, 0.1523392, -7.521029, 1, 1.5, 0.5, 0.5,
-3.79166, 0.1523392, -7.521029, 0, 1.5, 0.5, 0.5
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
-3.79166, -4.157926, -0.3318639, 0, -0.5, 0.5, 0.5,
-3.79166, -4.157926, -0.3318639, 1, -0.5, 0.5, 0.5,
-3.79166, -4.157926, -0.3318639, 1, 1.5, 0.5, 0.5,
-3.79166, -4.157926, -0.3318639, 0, 1.5, 0.5, 0.5
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
-2, -3.163249, -5.861991,
3, -3.163249, -5.861991,
-2, -3.163249, -5.861991,
-2, -3.329028, -6.138497,
-1, -3.163249, -5.861991,
-1, -3.329028, -6.138497,
0, -3.163249, -5.861991,
0, -3.329028, -6.138497,
1, -3.163249, -5.861991,
1, -3.329028, -6.138497,
2, -3.163249, -5.861991,
2, -3.329028, -6.138497,
3, -3.163249, -5.861991,
3, -3.329028, -6.138497
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
-2, -3.660587, -6.69151, 0, -0.5, 0.5, 0.5,
-2, -3.660587, -6.69151, 1, -0.5, 0.5, 0.5,
-2, -3.660587, -6.69151, 1, 1.5, 0.5, 0.5,
-2, -3.660587, -6.69151, 0, 1.5, 0.5, 0.5,
-1, -3.660587, -6.69151, 0, -0.5, 0.5, 0.5,
-1, -3.660587, -6.69151, 1, -0.5, 0.5, 0.5,
-1, -3.660587, -6.69151, 1, 1.5, 0.5, 0.5,
-1, -3.660587, -6.69151, 0, 1.5, 0.5, 0.5,
0, -3.660587, -6.69151, 0, -0.5, 0.5, 0.5,
0, -3.660587, -6.69151, 1, -0.5, 0.5, 0.5,
0, -3.660587, -6.69151, 1, 1.5, 0.5, 0.5,
0, -3.660587, -6.69151, 0, 1.5, 0.5, 0.5,
1, -3.660587, -6.69151, 0, -0.5, 0.5, 0.5,
1, -3.660587, -6.69151, 1, -0.5, 0.5, 0.5,
1, -3.660587, -6.69151, 1, 1.5, 0.5, 0.5,
1, -3.660587, -6.69151, 0, 1.5, 0.5, 0.5,
2, -3.660587, -6.69151, 0, -0.5, 0.5, 0.5,
2, -3.660587, -6.69151, 1, -0.5, 0.5, 0.5,
2, -3.660587, -6.69151, 1, 1.5, 0.5, 0.5,
2, -3.660587, -6.69151, 0, 1.5, 0.5, 0.5,
3, -3.660587, -6.69151, 0, -0.5, 0.5, 0.5,
3, -3.660587, -6.69151, 1, -0.5, 0.5, 0.5,
3, -3.660587, -6.69151, 1, 1.5, 0.5, 0.5,
3, -3.660587, -6.69151, 0, 1.5, 0.5, 0.5
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
-2.888597, -3, -5.861991,
-2.888597, 3, -5.861991,
-2.888597, -3, -5.861991,
-3.039108, -3, -6.138497,
-2.888597, -2, -5.861991,
-3.039108, -2, -6.138497,
-2.888597, -1, -5.861991,
-3.039108, -1, -6.138497,
-2.888597, 0, -5.861991,
-3.039108, 0, -6.138497,
-2.888597, 1, -5.861991,
-3.039108, 1, -6.138497,
-2.888597, 2, -5.861991,
-3.039108, 2, -6.138497,
-2.888597, 3, -5.861991,
-3.039108, 3, -6.138497
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
-3.340128, -3, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, -3, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, -3, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, -3, -6.69151, 0, 1.5, 0.5, 0.5,
-3.340128, -2, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, -2, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, -2, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, -2, -6.69151, 0, 1.5, 0.5, 0.5,
-3.340128, -1, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, -1, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, -1, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, -1, -6.69151, 0, 1.5, 0.5, 0.5,
-3.340128, 0, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, 0, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, 0, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, 0, -6.69151, 0, 1.5, 0.5, 0.5,
-3.340128, 1, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, 1, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, 1, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, 1, -6.69151, 0, 1.5, 0.5, 0.5,
-3.340128, 2, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, 2, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, 2, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, 2, -6.69151, 0, 1.5, 0.5, 0.5,
-3.340128, 3, -6.69151, 0, -0.5, 0.5, 0.5,
-3.340128, 3, -6.69151, 1, -0.5, 0.5, 0.5,
-3.340128, 3, -6.69151, 1, 1.5, 0.5, 0.5,
-3.340128, 3, -6.69151, 0, 1.5, 0.5, 0.5
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
-2.888597, -3.163249, -4,
-2.888597, -3.163249, 4,
-2.888597, -3.163249, -4,
-3.039108, -3.329028, -4,
-2.888597, -3.163249, -2,
-3.039108, -3.329028, -2,
-2.888597, -3.163249, 0,
-3.039108, -3.329028, 0,
-2.888597, -3.163249, 2,
-3.039108, -3.329028, 2,
-2.888597, -3.163249, 4,
-3.039108, -3.329028, 4
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
-3.340128, -3.660587, -4, 0, -0.5, 0.5, 0.5,
-3.340128, -3.660587, -4, 1, -0.5, 0.5, 0.5,
-3.340128, -3.660587, -4, 1, 1.5, 0.5, 0.5,
-3.340128, -3.660587, -4, 0, 1.5, 0.5, 0.5,
-3.340128, -3.660587, -2, 0, -0.5, 0.5, 0.5,
-3.340128, -3.660587, -2, 1, -0.5, 0.5, 0.5,
-3.340128, -3.660587, -2, 1, 1.5, 0.5, 0.5,
-3.340128, -3.660587, -2, 0, 1.5, 0.5, 0.5,
-3.340128, -3.660587, 0, 0, -0.5, 0.5, 0.5,
-3.340128, -3.660587, 0, 1, -0.5, 0.5, 0.5,
-3.340128, -3.660587, 0, 1, 1.5, 0.5, 0.5,
-3.340128, -3.660587, 0, 0, 1.5, 0.5, 0.5,
-3.340128, -3.660587, 2, 0, -0.5, 0.5, 0.5,
-3.340128, -3.660587, 2, 1, -0.5, 0.5, 0.5,
-3.340128, -3.660587, 2, 1, 1.5, 0.5, 0.5,
-3.340128, -3.660587, 2, 0, 1.5, 0.5, 0.5,
-3.340128, -3.660587, 4, 0, -0.5, 0.5, 0.5,
-3.340128, -3.660587, 4, 1, -0.5, 0.5, 0.5,
-3.340128, -3.660587, 4, 1, 1.5, 0.5, 0.5,
-3.340128, -3.660587, 4, 0, 1.5, 0.5, 0.5
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
-2.888597, -3.163249, -5.861991,
-2.888597, 3.467927, -5.861991,
-2.888597, -3.163249, 5.198263,
-2.888597, 3.467927, 5.198263,
-2.888597, -3.163249, -5.861991,
-2.888597, -3.163249, 5.198263,
-2.888597, 3.467927, -5.861991,
-2.888597, 3.467927, 5.198263,
-2.888597, -3.163249, -5.861991,
3.131823, -3.163249, -5.861991,
-2.888597, -3.163249, 5.198263,
3.131823, -3.163249, 5.198263,
-2.888597, 3.467927, -5.861991,
3.131823, 3.467927, -5.861991,
-2.888597, 3.467927, 5.198263,
3.131823, 3.467927, 5.198263,
3.131823, -3.163249, -5.861991,
3.131823, 3.467927, -5.861991,
3.131823, -3.163249, 5.198263,
3.131823, 3.467927, 5.198263,
3.131823, -3.163249, -5.861991,
3.131823, -3.163249, 5.198263,
3.131823, 3.467927, -5.861991,
3.131823, 3.467927, 5.198263
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
var radius = 7.599562;
var distance = 33.81131;
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
mvMatrix.translate( -0.1216128, -0.1523392, 0.3318639 );
mvMatrix.scale( 1.364821, 1.239116, 0.742912 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81131);
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
bensultap<-read.table("bensultap.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bensultap$V2
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
```

```r
y<-bensultap$V3
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
```

```r
z<-bensultap$V4
```

```
## Error in eval(expr, envir, enclos): object 'bensultap' not found
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
-2.800921, 0.3759975, -1.371994, 0, 0, 1, 1, 1,
-2.697, 0.7654899, -3.326544, 1, 0, 0, 1, 1,
-2.666818, 0.2540073, -1.592967, 1, 0, 0, 1, 1,
-2.65633, -0.5526741, -3.104485, 1, 0, 0, 1, 1,
-2.595026, -1.665204, -2.021942, 1, 0, 0, 1, 1,
-2.529166, -0.09621154, -2.600328, 1, 0, 0, 1, 1,
-2.525177, -1.263556, -1.461348, 0, 0, 0, 1, 1,
-2.509104, 0.06911454, -1.221878, 0, 0, 0, 1, 1,
-2.45973, 0.2677577, -0.6250739, 0, 0, 0, 1, 1,
-2.283737, 0.002089276, -4.921829, 0, 0, 0, 1, 1,
-2.254497, 2.426824, -0.1297491, 0, 0, 0, 1, 1,
-2.213147, -0.4472034, -2.166218, 0, 0, 0, 1, 1,
-2.208356, -0.3073849, -2.906807, 0, 0, 0, 1, 1,
-2.166547, -0.4843598, -1.690426, 1, 1, 1, 1, 1,
-2.149407, -0.006241343, -1.280362, 1, 1, 1, 1, 1,
-2.146102, 1.341464, -0.5736206, 1, 1, 1, 1, 1,
-2.140401, -0.2368926, -2.672257, 1, 1, 1, 1, 1,
-2.094823, 0.07656856, -0.2701104, 1, 1, 1, 1, 1,
-2.058411, 0.9930094, -2.209967, 1, 1, 1, 1, 1,
-2.054111, -0.4706759, -0.9760804, 1, 1, 1, 1, 1,
-2.029307, 1.627423, -1.09483, 1, 1, 1, 1, 1,
-2.015023, -0.3225338, -2.152939, 1, 1, 1, 1, 1,
-2.013274, 0.46323, -1.197911, 1, 1, 1, 1, 1,
-2.00107, -0.93579, -2.294428, 1, 1, 1, 1, 1,
-1.986258, -0.07081308, -1.449661, 1, 1, 1, 1, 1,
-1.958569, -1.058941, -2.094317, 1, 1, 1, 1, 1,
-1.953887, 0.5256674, -1.093988, 1, 1, 1, 1, 1,
-1.943215, -0.7668694, -1.60999, 1, 1, 1, 1, 1,
-1.942617, -0.8576968, -2.322237, 0, 0, 1, 1, 1,
-1.912608, 0.3959732, -2.21622, 1, 0, 0, 1, 1,
-1.895162, 1.355208, -1.689668, 1, 0, 0, 1, 1,
-1.893411, -0.2612379, -2.829127, 1, 0, 0, 1, 1,
-1.888731, -0.2105161, 0.07241191, 1, 0, 0, 1, 1,
-1.878764, 1.913231, -1.702748, 1, 0, 0, 1, 1,
-1.85775, 0.1844238, -1.675353, 0, 0, 0, 1, 1,
-1.850416, 0.9703569, -2.972496, 0, 0, 0, 1, 1,
-1.834178, 0.8226886, -0.7063254, 0, 0, 0, 1, 1,
-1.828702, -0.1364888, -2.034257, 0, 0, 0, 1, 1,
-1.82623, 0.3280465, 0.4146411, 0, 0, 0, 1, 1,
-1.825048, -0.5929604, -2.06021, 0, 0, 0, 1, 1,
-1.818456, -0.9593027, -2.622462, 0, 0, 0, 1, 1,
-1.789003, -0.6683121, -3.403463, 1, 1, 1, 1, 1,
-1.785941, -0.4614152, -1.660001, 1, 1, 1, 1, 1,
-1.780612, 1.447179, 0.1022919, 1, 1, 1, 1, 1,
-1.779051, -0.2199528, -1.644258, 1, 1, 1, 1, 1,
-1.753136, 0.8867684, -1.659838, 1, 1, 1, 1, 1,
-1.749997, -0.9013693, -4.115259, 1, 1, 1, 1, 1,
-1.745332, -0.4948543, -0.04725179, 1, 1, 1, 1, 1,
-1.738668, -0.2730281, -0.7229144, 1, 1, 1, 1, 1,
-1.706024, -0.1241605, -2.831575, 1, 1, 1, 1, 1,
-1.685095, -0.8960478, -2.375497, 1, 1, 1, 1, 1,
-1.675382, -0.2109647, -3.406169, 1, 1, 1, 1, 1,
-1.672438, 0.2298633, -0.1136562, 1, 1, 1, 1, 1,
-1.668317, -0.3575214, -2.642679, 1, 1, 1, 1, 1,
-1.666933, 0.09606855, -1.97089, 1, 1, 1, 1, 1,
-1.661686, 0.2723969, -0.4757884, 1, 1, 1, 1, 1,
-1.642942, -1.31496, -2.597681, 0, 0, 1, 1, 1,
-1.636403, 0.01980942, -1.650516, 1, 0, 0, 1, 1,
-1.636181, -0.03938043, -1.22031, 1, 0, 0, 1, 1,
-1.610059, 1.308982, -1.569107, 1, 0, 0, 1, 1,
-1.574923, -0.7745575, -1.436721, 1, 0, 0, 1, 1,
-1.555784, 0.1990507, -3.261806, 1, 0, 0, 1, 1,
-1.55438, 1.294861, -0.8881741, 0, 0, 0, 1, 1,
-1.548607, -0.8068627, -1.958229, 0, 0, 0, 1, 1,
-1.545508, -3.017424, -3.587854, 0, 0, 0, 1, 1,
-1.537743, 0.2494297, -0.5901314, 0, 0, 0, 1, 1,
-1.536593, -1.083633, -1.588448, 0, 0, 0, 1, 1,
-1.53161, 1.006361, 0.03442398, 0, 0, 0, 1, 1,
-1.51828, -0.3564863, -3.662386, 0, 0, 0, 1, 1,
-1.493034, -0.6149164, -0.9905234, 1, 1, 1, 1, 1,
-1.492548, -0.1276022, -1.955397, 1, 1, 1, 1, 1,
-1.492374, -0.6025252, -2.298653, 1, 1, 1, 1, 1,
-1.468832, -1.297003, -3.02165, 1, 1, 1, 1, 1,
-1.465645, 1.519149, -0.9907307, 1, 1, 1, 1, 1,
-1.464026, -0.005763594, -2.006794, 1, 1, 1, 1, 1,
-1.454478, 0.1412036, -2.148762, 1, 1, 1, 1, 1,
-1.445781, -1.897752, -4.11445, 1, 1, 1, 1, 1,
-1.444484, 0.7420561, -0.2727259, 1, 1, 1, 1, 1,
-1.426432, -0.579178, -0.3349881, 1, 1, 1, 1, 1,
-1.414311, 0.6723745, -0.9862754, 1, 1, 1, 1, 1,
-1.407807, 0.02126019, -1.295062, 1, 1, 1, 1, 1,
-1.399069, 1.815705, -1.802068, 1, 1, 1, 1, 1,
-1.392535, -0.08993485, -1.74688, 1, 1, 1, 1, 1,
-1.391144, 0.1084816, -2.221191, 1, 1, 1, 1, 1,
-1.385826, -1.149638, -1.650675, 0, 0, 1, 1, 1,
-1.385129, -0.8169484, -2.433119, 1, 0, 0, 1, 1,
-1.37232, 1.288445, -0.9508287, 1, 0, 0, 1, 1,
-1.371735, -0.04639016, -0.9321083, 1, 0, 0, 1, 1,
-1.371034, -1.047655, -2.074033, 1, 0, 0, 1, 1,
-1.361341, -0.2139707, -1.792539, 1, 0, 0, 1, 1,
-1.35782, 0.3305935, 2.127551, 0, 0, 0, 1, 1,
-1.349411, -1.074661, -1.628492, 0, 0, 0, 1, 1,
-1.320803, 1.303867, -0.3633579, 0, 0, 0, 1, 1,
-1.317375, -0.6743026, -0.5006801, 0, 0, 0, 1, 1,
-1.310498, -0.1494625, -0.8451447, 0, 0, 0, 1, 1,
-1.300828, -0.4377878, -4.071467, 0, 0, 0, 1, 1,
-1.296543, 0.3350993, -1.03628, 0, 0, 0, 1, 1,
-1.28588, -0.4603691, -1.055206, 1, 1, 1, 1, 1,
-1.281581, -0.9964423, -3.753583, 1, 1, 1, 1, 1,
-1.280585, 0.3601732, -2.68264, 1, 1, 1, 1, 1,
-1.279709, -0.6404975, -1.414943, 1, 1, 1, 1, 1,
-1.272719, 0.4073096, -1.564807, 1, 1, 1, 1, 1,
-1.271435, 1.561812, -1.093699, 1, 1, 1, 1, 1,
-1.271417, 0.7277365, -2.760647, 1, 1, 1, 1, 1,
-1.270021, -0.45303, -1.96928, 1, 1, 1, 1, 1,
-1.262395, -0.3560012, -0.9848256, 1, 1, 1, 1, 1,
-1.260349, -0.3166339, -1.291093, 1, 1, 1, 1, 1,
-1.25981, 0.6315331, -0.6621075, 1, 1, 1, 1, 1,
-1.252759, -1.107152, -2.661579, 1, 1, 1, 1, 1,
-1.233149, -1.119076, -3.368835, 1, 1, 1, 1, 1,
-1.231418, 0.7447755, -0.7530711, 1, 1, 1, 1, 1,
-1.229317, -0.1376871, -1.440266, 1, 1, 1, 1, 1,
-1.223048, -0.332755, -2.423865, 0, 0, 1, 1, 1,
-1.216722, -1.067942, -2.948136, 1, 0, 0, 1, 1,
-1.214784, -0.1618572, -2.170768, 1, 0, 0, 1, 1,
-1.212394, -1.167619, -2.923027, 1, 0, 0, 1, 1,
-1.20451, 1.293361, -1.168126, 1, 0, 0, 1, 1,
-1.201021, 0.5143149, -2.00405, 1, 0, 0, 1, 1,
-1.187774, 0.1455974, -1.788628, 0, 0, 0, 1, 1,
-1.171332, -0.9478042, -2.678796, 0, 0, 0, 1, 1,
-1.168471, 0.4659362, -1.38917, 0, 0, 0, 1, 1,
-1.16778, -0.3049492, -0.09414704, 0, 0, 0, 1, 1,
-1.166821, -0.06900004, -2.814935, 0, 0, 0, 1, 1,
-1.161633, 0.9410726, 0.5463046, 0, 0, 0, 1, 1,
-1.159598, -1.351047, -1.513922, 0, 0, 0, 1, 1,
-1.158652, -1.499132, -3.32844, 1, 1, 1, 1, 1,
-1.151795, -0.06450396, -1.588533, 1, 1, 1, 1, 1,
-1.146875, -0.1281489, -1.692078, 1, 1, 1, 1, 1,
-1.146368, 0.1399961, -0.7032837, 1, 1, 1, 1, 1,
-1.141399, 1.120304, 1.209179, 1, 1, 1, 1, 1,
-1.138668, -0.002619556, -0.7859241, 1, 1, 1, 1, 1,
-1.137977, 0.8535608, -2.191765, 1, 1, 1, 1, 1,
-1.128958, -0.7445118, -1.710811, 1, 1, 1, 1, 1,
-1.124547, -0.5084873, -1.181825, 1, 1, 1, 1, 1,
-1.122542, -1.905959, -3.11202, 1, 1, 1, 1, 1,
-1.119367, -1.079713, -2.458515, 1, 1, 1, 1, 1,
-1.117188, 0.8116591, -0.6075848, 1, 1, 1, 1, 1,
-1.113475, 0.7090489, 0.5149964, 1, 1, 1, 1, 1,
-1.105585, -1.070975, -0.9723905, 1, 1, 1, 1, 1,
-1.09568, -0.2801703, -3.302114, 1, 1, 1, 1, 1,
-1.077347, -1.339255, -2.295452, 0, 0, 1, 1, 1,
-1.077165, -0.6456022, -2.430809, 1, 0, 0, 1, 1,
-1.069741, -1.708912, -1.935935, 1, 0, 0, 1, 1,
-1.060685, -1.062244, -2.407729, 1, 0, 0, 1, 1,
-1.0596, 0.152325, -0.3248171, 1, 0, 0, 1, 1,
-1.059388, 1.075094, -0.9064011, 1, 0, 0, 1, 1,
-1.055507, 0.4704241, 0.3036961, 0, 0, 0, 1, 1,
-1.052465, -2.105644, -1.027534, 0, 0, 0, 1, 1,
-1.048929, -0.529319, -1.831715, 0, 0, 0, 1, 1,
-1.031534, -0.8598673, -4.223467, 0, 0, 0, 1, 1,
-1.031426, -0.818029, -2.840641, 0, 0, 0, 1, 1,
-1.00853, 0.4109423, -2.353191, 0, 0, 0, 1, 1,
-1.005205, -0.968838, -3.034371, 0, 0, 0, 1, 1,
-0.9958414, 2.354749, -0.8853293, 1, 1, 1, 1, 1,
-0.9908597, -1.818366, -3.086587, 1, 1, 1, 1, 1,
-0.9905115, 0.966449, -1.112232, 1, 1, 1, 1, 1,
-0.9809143, 2.190986, -0.5367746, 1, 1, 1, 1, 1,
-0.9802967, 0.9197332, -1.661737, 1, 1, 1, 1, 1,
-0.9797622, 0.6544985, -0.7452385, 1, 1, 1, 1, 1,
-0.9787306, 1.151742, -1.288847, 1, 1, 1, 1, 1,
-0.9755693, -0.2671983, -2.547679, 1, 1, 1, 1, 1,
-0.9729073, 0.3101675, -0.2589738, 1, 1, 1, 1, 1,
-0.9676881, 0.02357008, -1.584438, 1, 1, 1, 1, 1,
-0.9619352, -1.522467, -1.980654, 1, 1, 1, 1, 1,
-0.9601779, 0.9701042, -0.02394624, 1, 1, 1, 1, 1,
-0.9591606, 0.3708513, -1.527049, 1, 1, 1, 1, 1,
-0.9424153, -1.007513, -3.452841, 1, 1, 1, 1, 1,
-0.9398018, 1.160121, -2.691358, 1, 1, 1, 1, 1,
-0.9390896, 0.8737515, 1.132622, 0, 0, 1, 1, 1,
-0.9281686, 0.7279526, -1.340231, 1, 0, 0, 1, 1,
-0.9234514, 0.702298, -3.294739, 1, 0, 0, 1, 1,
-0.9212726, -0.8875417, -3.134717, 1, 0, 0, 1, 1,
-0.9206822, 0.558346, -0.9636688, 1, 0, 0, 1, 1,
-0.9028843, -0.09433221, -1.435534, 1, 0, 0, 1, 1,
-0.8999988, -0.09628142, -1.352452, 0, 0, 0, 1, 1,
-0.8994446, 1.137408, -0.8508015, 0, 0, 0, 1, 1,
-0.8983822, 0.3075378, -1.308059, 0, 0, 0, 1, 1,
-0.893744, 0.4414969, -1.0286, 0, 0, 0, 1, 1,
-0.8805844, 1.429474, -0.7356793, 0, 0, 0, 1, 1,
-0.8760327, 0.9186737, -1.373309, 0, 0, 0, 1, 1,
-0.8673404, -0.03466213, -2.428661, 0, 0, 0, 1, 1,
-0.8604724, -0.5743006, -1.021214, 1, 1, 1, 1, 1,
-0.8593358, 0.1656468, -0.8890831, 1, 1, 1, 1, 1,
-0.8556052, 0.5482623, -3.122314, 1, 1, 1, 1, 1,
-0.8501887, -2.389011, -3.523595, 1, 1, 1, 1, 1,
-0.843901, 1.361001, -0.97155, 1, 1, 1, 1, 1,
-0.8391658, 2.276542, -0.1814244, 1, 1, 1, 1, 1,
-0.8339597, -0.38106, -1.671126, 1, 1, 1, 1, 1,
-0.8274723, 0.1130416, -3.276507, 1, 1, 1, 1, 1,
-0.8257875, 0.3016197, -1.026852, 1, 1, 1, 1, 1,
-0.8257624, -0.01835616, 0.3758121, 1, 1, 1, 1, 1,
-0.8203782, 0.4036022, -2.198825, 1, 1, 1, 1, 1,
-0.8202254, -0.07322314, -3.667237, 1, 1, 1, 1, 1,
-0.8155458, 0.06714356, -1.647767, 1, 1, 1, 1, 1,
-0.8130836, -0.146334, -1.367528, 1, 1, 1, 1, 1,
-0.8114248, -1.317892, -3.317895, 1, 1, 1, 1, 1,
-0.8085463, -0.7192817, -3.265038, 0, 0, 1, 1, 1,
-0.8056978, 1.320763, -1.108324, 1, 0, 0, 1, 1,
-0.8051027, 0.2622248, 2.207262, 1, 0, 0, 1, 1,
-0.8029224, -0.9785268, -1.996399, 1, 0, 0, 1, 1,
-0.8027689, -0.9299057, -2.351948, 1, 0, 0, 1, 1,
-0.797285, -0.4068861, -3.500406, 1, 0, 0, 1, 1,
-0.7971101, -0.8938516, -3.984384, 0, 0, 0, 1, 1,
-0.7829247, -0.2571634, -3.947238, 0, 0, 0, 1, 1,
-0.7773482, -0.8457805, -3.809304, 0, 0, 0, 1, 1,
-0.7739196, -0.5987002, -2.499025, 0, 0, 0, 1, 1,
-0.7711958, -0.2398402, -1.926113, 0, 0, 0, 1, 1,
-0.7697293, -0.1653371, -2.357276, 0, 0, 0, 1, 1,
-0.7696515, -0.710412, 0.5077882, 0, 0, 0, 1, 1,
-0.7669108, -0.2850454, -2.119162, 1, 1, 1, 1, 1,
-0.7651517, 1.2419, 0.3178331, 1, 1, 1, 1, 1,
-0.7645007, 0.5771159, -2.257171, 1, 1, 1, 1, 1,
-0.7620382, 0.267391, -0.1033772, 1, 1, 1, 1, 1,
-0.7597469, -0.1705348, -1.840723, 1, 1, 1, 1, 1,
-0.758824, -2.104242, -3.029902, 1, 1, 1, 1, 1,
-0.7553322, 1.591822, -0.8999335, 1, 1, 1, 1, 1,
-0.7529097, 1.582722, 0.71886, 1, 1, 1, 1, 1,
-0.7500011, -0.7595171, -2.720815, 1, 1, 1, 1, 1,
-0.7475268, 0.9257487, 1.56742, 1, 1, 1, 1, 1,
-0.7462429, 0.07395551, -0.128918, 1, 1, 1, 1, 1,
-0.7441234, -1.494766, -0.4694418, 1, 1, 1, 1, 1,
-0.7392018, -0.2489837, -2.949314, 1, 1, 1, 1, 1,
-0.7386486, 0.7491452, -2.559299, 1, 1, 1, 1, 1,
-0.7385173, 0.9177391, -1.481092, 1, 1, 1, 1, 1,
-0.7304758, -0.5198375, -2.025808, 0, 0, 1, 1, 1,
-0.7268699, 1.662259, 0.7080336, 1, 0, 0, 1, 1,
-0.7267376, 0.6217294, -0.1554514, 1, 0, 0, 1, 1,
-0.7255364, -0.003275123, -0.2441481, 1, 0, 0, 1, 1,
-0.7244325, -1.17773, -2.892908, 1, 0, 0, 1, 1,
-0.7159701, -1.548269, -0.9221711, 1, 0, 0, 1, 1,
-0.7159644, -0.3615748, -1.832902, 0, 0, 0, 1, 1,
-0.7127818, -1.174259, -2.759842, 0, 0, 0, 1, 1,
-0.7123695, -0.3224473, -1.543807, 0, 0, 0, 1, 1,
-0.7044604, -1.933636, -2.085553, 0, 0, 0, 1, 1,
-0.7013971, 1.339811, -1.447245, 0, 0, 0, 1, 1,
-0.6996163, 1.088597, -0.7438247, 0, 0, 0, 1, 1,
-0.6952382, 1.313623, 0.6665939, 0, 0, 0, 1, 1,
-0.6940839, -0.2046779, -0.02667079, 1, 1, 1, 1, 1,
-0.6915353, 2.992141, -0.06532127, 1, 1, 1, 1, 1,
-0.6874145, 0.2419744, -2.11447, 1, 1, 1, 1, 1,
-0.6855812, 1.116537, -0.07878678, 1, 1, 1, 1, 1,
-0.6846483, -0.5623336, -2.048954, 1, 1, 1, 1, 1,
-0.6789151, -0.544706, -1.646969, 1, 1, 1, 1, 1,
-0.6761279, 1.5005, 0.2286504, 1, 1, 1, 1, 1,
-0.6700624, -1.515554, -4.180623, 1, 1, 1, 1, 1,
-0.6679599, -0.4020837, -1.409737, 1, 1, 1, 1, 1,
-0.6649605, 1.273137, -2.056152, 1, 1, 1, 1, 1,
-0.6617988, -0.3174596, 0.7981581, 1, 1, 1, 1, 1,
-0.6601934, -0.7784761, -2.91328, 1, 1, 1, 1, 1,
-0.6599724, -0.5684009, -2.244697, 1, 1, 1, 1, 1,
-0.6589331, 1.072369, 0.2917199, 1, 1, 1, 1, 1,
-0.6530616, 0.7520679, -1.915495, 1, 1, 1, 1, 1,
-0.6503137, 0.0339431, -1.686305, 0, 0, 1, 1, 1,
-0.6474475, -1.672532, -3.181012, 1, 0, 0, 1, 1,
-0.6468518, -0.8855374, -4.670917, 1, 0, 0, 1, 1,
-0.6466008, -0.9028546, -1.845879, 1, 0, 0, 1, 1,
-0.6381875, -1.483684, -1.576303, 1, 0, 0, 1, 1,
-0.6348329, -0.9239506, -3.223538, 1, 0, 0, 1, 1,
-0.6293842, 0.7675102, 1.596828, 0, 0, 0, 1, 1,
-0.6290925, -1.358827, -3.123222, 0, 0, 0, 1, 1,
-0.6277485, -0.3453352, -2.722258, 0, 0, 0, 1, 1,
-0.626101, -0.5178457, -2.718379, 0, 0, 0, 1, 1,
-0.6251296, 0.7672513, -0.2574365, 0, 0, 0, 1, 1,
-0.6208612, -0.5654784, -1.239027, 0, 0, 0, 1, 1,
-0.6180838, 0.6111659, -2.323308, 0, 0, 0, 1, 1,
-0.6173732, -0.6528555, -2.462915, 1, 1, 1, 1, 1,
-0.6160282, -0.09500478, -1.875249, 1, 1, 1, 1, 1,
-0.6136492, -0.1285071, -0.913555, 1, 1, 1, 1, 1,
-0.601443, -0.8772491, -1.700469, 1, 1, 1, 1, 1,
-0.5990039, -0.2189772, -2.230146, 1, 1, 1, 1, 1,
-0.5950275, 0.5992664, -0.6615334, 1, 1, 1, 1, 1,
-0.5929084, -1.719623, -2.825937, 1, 1, 1, 1, 1,
-0.5876981, 0.8470207, 0.1564685, 1, 1, 1, 1, 1,
-0.5846657, -0.5891811, -0.7508496, 1, 1, 1, 1, 1,
-0.5823127, -0.07386358, -1.018605, 1, 1, 1, 1, 1,
-0.5786554, 0.02816166, -0.7794803, 1, 1, 1, 1, 1,
-0.5735949, -1.185034, -1.494499, 1, 1, 1, 1, 1,
-0.5672135, 0.6316969, -0.6161694, 1, 1, 1, 1, 1,
-0.5657423, -0.7579036, -2.144299, 1, 1, 1, 1, 1,
-0.564765, -0.8445796, -3.450471, 1, 1, 1, 1, 1,
-0.561947, 0.5709572, -1.932532, 0, 0, 1, 1, 1,
-0.5591959, -1.057537, -4.022904, 1, 0, 0, 1, 1,
-0.553498, 0.28642, -2.489972, 1, 0, 0, 1, 1,
-0.5529572, 1.449242, 0.07139805, 1, 0, 0, 1, 1,
-0.5520054, -0.2434428, -1.244279, 1, 0, 0, 1, 1,
-0.5481039, 0.4780963, -2.6581, 1, 0, 0, 1, 1,
-0.5433479, 0.3308571, -2.501266, 0, 0, 0, 1, 1,
-0.5378659, 0.2010533, -1.243515, 0, 0, 0, 1, 1,
-0.537657, 0.5403188, -0.4765154, 0, 0, 0, 1, 1,
-0.5373421, -0.1440678, -2.417583, 0, 0, 0, 1, 1,
-0.5362325, -1.137094, -0.4682942, 0, 0, 0, 1, 1,
-0.5354767, 0.3047946, -2.492146, 0, 0, 0, 1, 1,
-0.5324436, 0.7232317, -0.9843608, 0, 0, 0, 1, 1,
-0.5276199, -1.662711, -4.114397, 1, 1, 1, 1, 1,
-0.5235519, -0.278774, -1.679808, 1, 1, 1, 1, 1,
-0.5192789, 0.8971932, 0.4552556, 1, 1, 1, 1, 1,
-0.5179241, -1.32386, -4.360238, 1, 1, 1, 1, 1,
-0.512375, 0.08139247, -0.7148973, 1, 1, 1, 1, 1,
-0.5080279, -0.3907874, -3.40628, 1, 1, 1, 1, 1,
-0.5075299, -0.7651377, -2.232773, 1, 1, 1, 1, 1,
-0.5040772, -0.2985953, -2.079836, 1, 1, 1, 1, 1,
-0.4988089, -0.8173358, -2.184207, 1, 1, 1, 1, 1,
-0.495194, 0.9695811, -0.191908, 1, 1, 1, 1, 1,
-0.4921118, -0.6482975, -2.745647, 1, 1, 1, 1, 1,
-0.4913282, 0.2963444, -0.7952831, 1, 1, 1, 1, 1,
-0.4855039, 1.072349, -0.4221884, 1, 1, 1, 1, 1,
-0.482769, 0.3717678, -1.683908, 1, 1, 1, 1, 1,
-0.4794168, -1.112413, -3.523275, 1, 1, 1, 1, 1,
-0.4772249, 0.506265, -0.7294308, 0, 0, 1, 1, 1,
-0.4769974, -0.590759, -3.032529, 1, 0, 0, 1, 1,
-0.4711058, -0.006916573, -1.090417, 1, 0, 0, 1, 1,
-0.4689449, 0.2269086, -0.6611123, 1, 0, 0, 1, 1,
-0.4681263, -0.3982925, -2.125915, 1, 0, 0, 1, 1,
-0.4671885, 1.780214, 0.2660177, 1, 0, 0, 1, 1,
-0.4661054, 1.315673, -1.742325, 0, 0, 0, 1, 1,
-0.4632746, -1.319101, -2.446185, 0, 0, 0, 1, 1,
-0.4624955, 0.4703094, -1.136585, 0, 0, 0, 1, 1,
-0.4592422, 0.3505222, -0.02749391, 0, 0, 0, 1, 1,
-0.4524663, 0.4900132, -1.689997, 0, 0, 0, 1, 1,
-0.4515541, 0.05917641, -1.415984, 0, 0, 0, 1, 1,
-0.4512914, 0.5141548, -1.342095, 0, 0, 0, 1, 1,
-0.450545, -0.8489432, -2.649871, 1, 1, 1, 1, 1,
-0.447506, -1.377063, -3.636332, 1, 1, 1, 1, 1,
-0.4441451, 0.6499904, 0.2250844, 1, 1, 1, 1, 1,
-0.4420926, -0.2975853, -3.743467, 1, 1, 1, 1, 1,
-0.4347701, -0.1448201, -2.279799, 1, 1, 1, 1, 1,
-0.4294854, 0.2884241, -0.09888466, 1, 1, 1, 1, 1,
-0.4282925, -0.9649708, -3.921764, 1, 1, 1, 1, 1,
-0.4211067, -0.4202875, -1.963905, 1, 1, 1, 1, 1,
-0.4144308, 0.09131664, -1.857785, 1, 1, 1, 1, 1,
-0.4141542, -0.2154261, -2.108324, 1, 1, 1, 1, 1,
-0.4131847, -0.8984776, -4.226284, 1, 1, 1, 1, 1,
-0.4119785, 0.1319858, -1.901985, 1, 1, 1, 1, 1,
-0.409404, -1.262918, -5.700919, 1, 1, 1, 1, 1,
-0.404587, -1.660218, -2.029058, 1, 1, 1, 1, 1,
-0.403186, 0.2859628, 0.6758149, 1, 1, 1, 1, 1,
-0.4025282, -2.015785, -3.115292, 0, 0, 1, 1, 1,
-0.4021007, 0.627491, 0.6428848, 1, 0, 0, 1, 1,
-0.3980509, -0.3576427, -1.947336, 1, 0, 0, 1, 1,
-0.3939343, -1.395827, -3.024701, 1, 0, 0, 1, 1,
-0.3919662, 0.2287529, 0.04273001, 1, 0, 0, 1, 1,
-0.3902168, 0.5080283, 0.6471437, 1, 0, 0, 1, 1,
-0.3899162, 0.03087933, -0.4515665, 0, 0, 0, 1, 1,
-0.3899126, 0.01485292, -1.828878, 0, 0, 0, 1, 1,
-0.3897323, -0.5410723, -3.231987, 0, 0, 0, 1, 1,
-0.3868181, 0.1689762, -1.738249, 0, 0, 0, 1, 1,
-0.3860716, 0.1205439, 0.8906492, 0, 0, 0, 1, 1,
-0.3822688, -1.788274, -4.160643, 0, 0, 0, 1, 1,
-0.3768863, 1.048482, -0.2000911, 0, 0, 0, 1, 1,
-0.3725115, 0.4334476, 0.5204394, 1, 1, 1, 1, 1,
-0.3718239, -1.415533, -1.967573, 1, 1, 1, 1, 1,
-0.3688138, -0.9101034, -3.549107, 1, 1, 1, 1, 1,
-0.3619825, 0.3671969, -0.9423528, 1, 1, 1, 1, 1,
-0.3602257, -0.2188721, -3.057949, 1, 1, 1, 1, 1,
-0.3490131, 0.1153429, -0.988013, 1, 1, 1, 1, 1,
-0.3489406, 1.112509, -1.996384, 1, 1, 1, 1, 1,
-0.3476063, 0.9388039, -1.04953, 1, 1, 1, 1, 1,
-0.3346517, 0.8474678, 0.8157782, 1, 1, 1, 1, 1,
-0.3315597, -1.510052, -3.748431, 1, 1, 1, 1, 1,
-0.328214, -0.05485664, -2.918984, 1, 1, 1, 1, 1,
-0.3276867, -0.9401273, -2.324324, 1, 1, 1, 1, 1,
-0.3261764, 0.5310342, 0.1689701, 1, 1, 1, 1, 1,
-0.3161171, 1.142285, -0.4292903, 1, 1, 1, 1, 1,
-0.3110619, 0.6596785, -0.5108929, 1, 1, 1, 1, 1,
-0.3098717, 1.1829, -1.830188, 0, 0, 1, 1, 1,
-0.3083213, 0.2802804, -0.1029602, 1, 0, 0, 1, 1,
-0.305051, -0.6688968, -1.225589, 1, 0, 0, 1, 1,
-0.3049382, 0.4333156, -0.2043159, 1, 0, 0, 1, 1,
-0.302022, -0.7877132, -3.188995, 1, 0, 0, 1, 1,
-0.3007964, 0.4831666, -1.844608, 1, 0, 0, 1, 1,
-0.2996668, 0.3831527, -2.787806, 0, 0, 0, 1, 1,
-0.2985017, -1.017368, -3.519698, 0, 0, 0, 1, 1,
-0.2976992, 0.6058114, 1.256988, 0, 0, 0, 1, 1,
-0.2975099, -0.03913646, -1.060069, 0, 0, 0, 1, 1,
-0.2972035, -0.1255338, -3.038789, 0, 0, 0, 1, 1,
-0.296143, 0.498241, -0.1267068, 0, 0, 0, 1, 1,
-0.2957393, -0.3665943, -2.775443, 0, 0, 0, 1, 1,
-0.2937357, -0.4764576, -1.534492, 1, 1, 1, 1, 1,
-0.2929733, -0.4560828, -1.632095, 1, 1, 1, 1, 1,
-0.2897162, -0.1147659, -1.379089, 1, 1, 1, 1, 1,
-0.2880938, 1.610546, 1.024717, 1, 1, 1, 1, 1,
-0.2824868, 0.5924473, 0.42467, 1, 1, 1, 1, 1,
-0.278408, -0.4614438, -4.146433, 1, 1, 1, 1, 1,
-0.2772234, -0.2088354, -3.266221, 1, 1, 1, 1, 1,
-0.2753176, -0.542003, -3.326793, 1, 1, 1, 1, 1,
-0.2749787, -0.9560912, -3.181294, 1, 1, 1, 1, 1,
-0.2664757, -0.3758827, -0.9779567, 1, 1, 1, 1, 1,
-0.2634427, 0.3470968, -0.2686707, 1, 1, 1, 1, 1,
-0.2628932, -0.6076249, -4.101274, 1, 1, 1, 1, 1,
-0.2585495, -0.2299424, -1.519584, 1, 1, 1, 1, 1,
-0.250484, 0.7796055, 0.3488463, 1, 1, 1, 1, 1,
-0.2496203, -0.2391718, -2.773497, 1, 1, 1, 1, 1,
-0.2480617, -1.322201, -3.154954, 0, 0, 1, 1, 1,
-0.2479054, -0.2938414, -2.853119, 1, 0, 0, 1, 1,
-0.2455482, -0.07269038, -1.507681, 1, 0, 0, 1, 1,
-0.2453381, -0.2676986, -3.660706, 1, 0, 0, 1, 1,
-0.2428297, 0.750728, -1.115553, 1, 0, 0, 1, 1,
-0.2371783, 1.658024, 0.9594015, 1, 0, 0, 1, 1,
-0.2367146, -0.01695632, -0.1776247, 0, 0, 0, 1, 1,
-0.2347709, 0.1001373, -0.3392562, 0, 0, 0, 1, 1,
-0.2339154, -0.7993692, -1.626344, 0, 0, 0, 1, 1,
-0.2338936, 1.389467, 1.749264, 0, 0, 0, 1, 1,
-0.2334379, -1.492922, -3.012399, 0, 0, 0, 1, 1,
-0.2330134, -1.007086, -5.556076, 0, 0, 0, 1, 1,
-0.2305078, -0.04300155, -3.126852, 0, 0, 0, 1, 1,
-0.2278912, -1.107653, -4.415978, 1, 1, 1, 1, 1,
-0.2261111, -0.1726318, -3.094496, 1, 1, 1, 1, 1,
-0.2228478, -0.4797263, -3.909776, 1, 1, 1, 1, 1,
-0.2226731, 0.09254275, -1.306169, 1, 1, 1, 1, 1,
-0.2207973, 0.8527344, -1.939427, 1, 1, 1, 1, 1,
-0.2185968, -0.03122951, -1.909034, 1, 1, 1, 1, 1,
-0.2177899, -1.264745, -3.103187, 1, 1, 1, 1, 1,
-0.2162902, 1.345619, 0.7352087, 1, 1, 1, 1, 1,
-0.2160635, 0.3291355, -1.379108, 1, 1, 1, 1, 1,
-0.2149333, -1.4174, -1.562156, 1, 1, 1, 1, 1,
-0.2139035, 0.228985, -0.9578359, 1, 1, 1, 1, 1,
-0.2109845, -2.225589, -3.831239, 1, 1, 1, 1, 1,
-0.2095371, -0.1086486, -2.736407, 1, 1, 1, 1, 1,
-0.2087199, -1.01811, -3.632111, 1, 1, 1, 1, 1,
-0.2069895, 1.825706, -0.2114926, 1, 1, 1, 1, 1,
-0.2062924, -0.5275155, -1.620975, 0, 0, 1, 1, 1,
-0.2051474, -1.323638, -3.296269, 1, 0, 0, 1, 1,
-0.2027338, 0.8315279, -1.33651, 1, 0, 0, 1, 1,
-0.2025982, -0.8621058, -2.589389, 1, 0, 0, 1, 1,
-0.2009772, 0.6155617, -0.7888556, 1, 0, 0, 1, 1,
-0.1965943, -0.5341791, -2.853696, 1, 0, 0, 1, 1,
-0.1921975, -0.2902378, -2.202655, 0, 0, 0, 1, 1,
-0.1920187, -0.2883228, -2.784664, 0, 0, 0, 1, 1,
-0.1915018, 1.51534, 0.8077232, 0, 0, 0, 1, 1,
-0.1900641, -0.1399218, -2.327059, 0, 0, 0, 1, 1,
-0.1862867, -0.0356661, -1.96466, 0, 0, 0, 1, 1,
-0.1838742, 3.371357, 0.08174659, 0, 0, 0, 1, 1,
-0.1764925, -0.9482, -3.912161, 0, 0, 0, 1, 1,
-0.1755108, 1.130458, 0.280119, 1, 1, 1, 1, 1,
-0.1703934, 1.164513, 0.533916, 1, 1, 1, 1, 1,
-0.1606002, 0.003359508, -1.383904, 1, 1, 1, 1, 1,
-0.1585439, 1.500275, -0.2259375, 1, 1, 1, 1, 1,
-0.1577685, -0.2583337, -3.049138, 1, 1, 1, 1, 1,
-0.1566565, -0.8824549, -2.166118, 1, 1, 1, 1, 1,
-0.1561782, 1.169416, -0.3326924, 1, 1, 1, 1, 1,
-0.1524437, 2.177089, -0.01712076, 1, 1, 1, 1, 1,
-0.1514045, 2.269925, 1.228082, 1, 1, 1, 1, 1,
-0.1506495, 2.168248, 1.907326, 1, 1, 1, 1, 1,
-0.1411145, 0.7733071, -1.916186, 1, 1, 1, 1, 1,
-0.1404331, -0.3877305, -2.973018, 1, 1, 1, 1, 1,
-0.1379531, -1.534181, -3.500769, 1, 1, 1, 1, 1,
-0.126836, 0.2838525, 0.04919213, 1, 1, 1, 1, 1,
-0.1237383, -0.3979826, -3.886679, 1, 1, 1, 1, 1,
-0.1198123, -0.009012789, -0.4547005, 0, 0, 1, 1, 1,
-0.1189361, -0.2572825, -4.159298, 1, 0, 0, 1, 1,
-0.1165408, 0.2559149, 0.2351057, 1, 0, 0, 1, 1,
-0.1159278, 0.07665785, -2.307451, 1, 0, 0, 1, 1,
-0.113557, 0.0791018, -1.725472, 1, 0, 0, 1, 1,
-0.1123359, -0.268295, -2.327903, 1, 0, 0, 1, 1,
-0.1123193, -0.6428688, -2.192595, 0, 0, 0, 1, 1,
-0.1058913, 0.6632297, -0.3843035, 0, 0, 0, 1, 1,
-0.09855942, -1.054532, -2.798951, 0, 0, 0, 1, 1,
-0.09819099, -0.3619862, 0.9918851, 0, 0, 0, 1, 1,
-0.09374462, -2.498915, -1.276619, 0, 0, 0, 1, 1,
-0.08648819, 0.8449867, -0.136625, 0, 0, 0, 1, 1,
-0.08248138, 0.6649252, -0.1240031, 0, 0, 0, 1, 1,
-0.07850002, 0.2683941, 1.40788, 1, 1, 1, 1, 1,
-0.07833143, -1.369883, -5.352184, 1, 1, 1, 1, 1,
-0.07705581, 0.709249, -0.06844058, 1, 1, 1, 1, 1,
-0.07618305, 0.1048012, 0.4659947, 1, 1, 1, 1, 1,
-0.07576833, -0.8227662, -1.626504, 1, 1, 1, 1, 1,
-0.07415066, -0.3742166, -2.624895, 1, 1, 1, 1, 1,
-0.07120591, 1.221267, -0.1154108, 1, 1, 1, 1, 1,
-0.07010063, -0.9249111, -1.859144, 1, 1, 1, 1, 1,
-0.06884829, 0.6498293, 0.4644356, 1, 1, 1, 1, 1,
-0.06836577, -0.713826, -4.432489, 1, 1, 1, 1, 1,
-0.06817129, -0.8336713, -4.189709, 1, 1, 1, 1, 1,
-0.06779759, -1.866878, -3.441687, 1, 1, 1, 1, 1,
-0.06742428, -1.568677, -3.486336, 1, 1, 1, 1, 1,
-0.06648843, -1.094229, -2.877934, 1, 1, 1, 1, 1,
-0.06564543, -0.118016, -1.525163, 1, 1, 1, 1, 1,
-0.06355863, -0.3564104, -3.899634, 0, 0, 1, 1, 1,
-0.06159799, -0.8761343, -3.017389, 1, 0, 0, 1, 1,
-0.06116801, 1.2575, -0.1921577, 1, 0, 0, 1, 1,
-0.05888967, -0.6019291, -3.188553, 1, 0, 0, 1, 1,
-0.05438875, 0.04305824, -1.59681, 1, 0, 0, 1, 1,
-0.05097064, -2.706794, -3.729444, 1, 0, 0, 1, 1,
-0.04889199, 2.787198, 2.202737, 0, 0, 0, 1, 1,
-0.0483941, 0.4643183, -0.282137, 0, 0, 0, 1, 1,
-0.04715854, 2.351805, 0.7203836, 0, 0, 0, 1, 1,
-0.04404965, -1.198918, -4.292355, 0, 0, 0, 1, 1,
-0.04323855, -1.008839, -2.853877, 0, 0, 0, 1, 1,
-0.03707298, 0.4570194, -0.1700193, 0, 0, 0, 1, 1,
-0.03652519, -0.644407, -1.096619, 0, 0, 0, 1, 1,
-0.03483534, -0.2480533, -3.990634, 1, 1, 1, 1, 1,
-0.03416652, -1.000828, -3.423739, 1, 1, 1, 1, 1,
-0.03194171, -1.416912, -4.334519, 1, 1, 1, 1, 1,
-0.02985493, -0.1808222, -2.786782, 1, 1, 1, 1, 1,
-0.02825592, 1.251842, 2.009717, 1, 1, 1, 1, 1,
-0.02534423, 0.1595102, 1.406374, 1, 1, 1, 1, 1,
-0.02384109, 2.292528, 0.6199002, 1, 1, 1, 1, 1,
-0.02063977, -1.141561, -1.897282, 1, 1, 1, 1, 1,
-0.0138076, -1.572371, -2.936486, 1, 1, 1, 1, 1,
-0.01276966, -0.4440783, -3.251118, 1, 1, 1, 1, 1,
-0.009473373, -0.01448899, -3.462738, 1, 1, 1, 1, 1,
-0.008842337, 1.341621, -0.08842316, 1, 1, 1, 1, 1,
-0.007915862, -2.358984, -1.027605, 1, 1, 1, 1, 1,
-0.006319893, 0.9491454, 0.4107522, 1, 1, 1, 1, 1,
-0.006126679, -0.7139044, -2.146118, 1, 1, 1, 1, 1,
-0.003500005, -1.982985, -3.644778, 0, 0, 1, 1, 1,
-0.001920505, 0.3660204, -0.7643301, 1, 0, 0, 1, 1,
-0.001836636, 0.3413173, 1.888751, 1, 0, 0, 1, 1,
-0.00167998, 0.00144709, 0.08534402, 1, 0, 0, 1, 1,
-0.0005434844, -1.147794, -2.543164, 1, 0, 0, 1, 1,
0.0005770219, 0.773616, -0.7681652, 1, 0, 0, 1, 1,
0.001057965, -3.066679, 2.157171, 0, 0, 0, 1, 1,
0.001798753, 0.3890371, -0.6096822, 0, 0, 0, 1, 1,
0.004363917, 0.2526568, 0.2402737, 0, 0, 0, 1, 1,
0.0052782, -0.1718909, 5.012952, 0, 0, 0, 1, 1,
0.006635648, 1.483031, 1.455113, 0, 0, 0, 1, 1,
0.01314221, -0.2819781, 3.25969, 0, 0, 0, 1, 1,
0.01320293, 0.009704807, 0.6991066, 0, 0, 0, 1, 1,
0.0150629, -0.04271542, 2.572937, 1, 1, 1, 1, 1,
0.01616417, -0.5154044, 3.635343, 1, 1, 1, 1, 1,
0.01731505, -2.453876, 4.67444, 1, 1, 1, 1, 1,
0.02145223, -2.466136, 4.205594, 1, 1, 1, 1, 1,
0.02325238, -0.2255219, 3.016801, 1, 1, 1, 1, 1,
0.02362567, 1.707828, 0.715603, 1, 1, 1, 1, 1,
0.02449235, 0.2253565, 0.1600895, 1, 1, 1, 1, 1,
0.03105723, -0.1012448, 4.08778, 1, 1, 1, 1, 1,
0.03252218, 1.465708, -1.88588, 1, 1, 1, 1, 1,
0.03295783, -0.1773669, 2.157578, 1, 1, 1, 1, 1,
0.03301815, 0.1466874, 0.06326193, 1, 1, 1, 1, 1,
0.03383888, -0.7268021, 3.349043, 1, 1, 1, 1, 1,
0.03455063, -1.696172, 2.421835, 1, 1, 1, 1, 1,
0.03550476, -0.1108727, 3.328254, 1, 1, 1, 1, 1,
0.03718165, -0.1787102, 1.625284, 1, 1, 1, 1, 1,
0.03925964, -1.340794, 1.994259, 0, 0, 1, 1, 1,
0.04280886, -0.4685161, 3.891516, 1, 0, 0, 1, 1,
0.04386283, -1.268056, 4.770156, 1, 0, 0, 1, 1,
0.04539167, 1.236564, 2.113791, 1, 0, 0, 1, 1,
0.04932454, 1.200562, 1.079871, 1, 0, 0, 1, 1,
0.04992305, -1.172514, 3.744728, 1, 0, 0, 1, 1,
0.05092642, 0.003144596, -0.9009289, 0, 0, 0, 1, 1,
0.05261425, 0.8202767, -0.2306169, 0, 0, 0, 1, 1,
0.05336922, -1.954914, 4.129694, 0, 0, 0, 1, 1,
0.05490838, -0.5457567, 3.166961, 0, 0, 0, 1, 1,
0.05511213, -0.138605, 0.9738222, 0, 0, 0, 1, 1,
0.06487654, -0.5349177, 0.9577824, 0, 0, 0, 1, 1,
0.0661173, 0.09431063, 0.8534418, 0, 0, 0, 1, 1,
0.07188363, -0.06966707, 3.888792, 1, 1, 1, 1, 1,
0.07244691, 1.261156, 1.419472, 1, 1, 1, 1, 1,
0.08089915, -0.03282008, 0.6571338, 1, 1, 1, 1, 1,
0.08215705, 1.385418, 3.693948, 1, 1, 1, 1, 1,
0.0822649, 0.3192258, 1.791016, 1, 1, 1, 1, 1,
0.08290475, 0.3434145, -1.364251, 1, 1, 1, 1, 1,
0.08636747, 0.2279736, -1.245091, 1, 1, 1, 1, 1,
0.09192398, -0.3511642, 1.977387, 1, 1, 1, 1, 1,
0.09279162, -1.52557, 4.045733, 1, 1, 1, 1, 1,
0.09491719, 0.3575826, 0.2125428, 1, 1, 1, 1, 1,
0.1009441, 2.14992, -0.4617641, 1, 1, 1, 1, 1,
0.1024535, -0.09198493, 1.697293, 1, 1, 1, 1, 1,
0.1043909, -1.246431, 2.57426, 1, 1, 1, 1, 1,
0.1079659, 0.3858967, -1.15, 1, 1, 1, 1, 1,
0.1085205, -0.3721948, 3.715375, 1, 1, 1, 1, 1,
0.1151131, 0.008840351, 0.05933556, 0, 0, 1, 1, 1,
0.1186568, 0.9610978, 0.2622261, 1, 0, 0, 1, 1,
0.1200094, 0.1131586, 0.1325536, 1, 0, 0, 1, 1,
0.1210003, -0.02063064, 3.705313, 1, 0, 0, 1, 1,
0.1231661, -0.4749874, 2.085009, 1, 0, 0, 1, 1,
0.1256873, 1.035955, 0.2755255, 1, 0, 0, 1, 1,
0.1307386, -1.439865, 1.952586, 0, 0, 0, 1, 1,
0.1317571, 1.895243, 0.5670453, 0, 0, 0, 1, 1,
0.132897, -1.580197, 2.652857, 0, 0, 0, 1, 1,
0.1342164, -0.7421744, 3.436071, 0, 0, 0, 1, 1,
0.1350445, 0.01369808, 0.3102079, 0, 0, 0, 1, 1,
0.1370235, -0.5942933, 2.806264, 0, 0, 0, 1, 1,
0.1377763, -1.910923, 2.609689, 0, 0, 0, 1, 1,
0.1416343, -0.9712821, 4.599589, 1, 1, 1, 1, 1,
0.1426126, -0.3342936, 3.698614, 1, 1, 1, 1, 1,
0.151085, -0.7420316, 4.587989, 1, 1, 1, 1, 1,
0.151725, -2.522039, 3.199267, 1, 1, 1, 1, 1,
0.1531641, 0.125083, -0.3832658, 1, 1, 1, 1, 1,
0.1559456, 0.6861697, 1.390666, 1, 1, 1, 1, 1,
0.1639353, -0.3330188, 4.531985, 1, 1, 1, 1, 1,
0.165693, 0.113474, 2.731196, 1, 1, 1, 1, 1,
0.1703712, -0.3366785, 2.804926, 1, 1, 1, 1, 1,
0.1718673, 0.7953768, -0.4954961, 1, 1, 1, 1, 1,
0.1725129, -0.7765535, 4.345397, 1, 1, 1, 1, 1,
0.1731759, 0.4586929, 1.986972, 1, 1, 1, 1, 1,
0.1737286, -0.3828812, 2.245931, 1, 1, 1, 1, 1,
0.1758542, -0.3276971, 3.481985, 1, 1, 1, 1, 1,
0.1781796, -0.8728216, 1.442173, 1, 1, 1, 1, 1,
0.1803935, 0.3472683, 1.508443, 0, 0, 1, 1, 1,
0.1828588, -1.199426, 3.787605, 1, 0, 0, 1, 1,
0.1842049, -0.2452934, 3.207597, 1, 0, 0, 1, 1,
0.1870421, -0.05942078, 3.469523, 1, 0, 0, 1, 1,
0.191016, -0.04576214, 1.714311, 1, 0, 0, 1, 1,
0.193962, 0.03072701, 1.130066, 1, 0, 0, 1, 1,
0.1979481, -0.1503591, 0.7890921, 0, 0, 0, 1, 1,
0.2014783, 1.192947, 0.1132113, 0, 0, 0, 1, 1,
0.2023351, -0.797403, 2.877957, 0, 0, 0, 1, 1,
0.2116086, -0.4418144, 4.620448, 0, 0, 0, 1, 1,
0.2118497, -1.838043, 2.89373, 0, 0, 0, 1, 1,
0.2166973, -1.478606, 3.237295, 0, 0, 0, 1, 1,
0.2200926, 0.5103951, 0.9764775, 0, 0, 0, 1, 1,
0.2215107, 0.2494233, 1.407239, 1, 1, 1, 1, 1,
0.222344, -0.4140856, 2.0646, 1, 1, 1, 1, 1,
0.22656, -0.6122783, 3.065518, 1, 1, 1, 1, 1,
0.2312099, -1.125757, 3.512585, 1, 1, 1, 1, 1,
0.2312331, 0.2072101, 1.227399, 1, 1, 1, 1, 1,
0.2354934, 0.3756427, 0.8033022, 1, 1, 1, 1, 1,
0.2371704, 1.320829, 1.45341, 1, 1, 1, 1, 1,
0.2406119, -0.05687038, 1.429052, 1, 1, 1, 1, 1,
0.2427635, -0.326619, 2.640697, 1, 1, 1, 1, 1,
0.2461157, 1.447832, 1.016546, 1, 1, 1, 1, 1,
0.2471922, 0.9925982, -0.6842724, 1, 1, 1, 1, 1,
0.2533477, 0.8359328, 0.1665833, 1, 1, 1, 1, 1,
0.2543857, -0.9695278, 3.245743, 1, 1, 1, 1, 1,
0.2570301, -0.6833959, 2.761332, 1, 1, 1, 1, 1,
0.2591964, 1.190265, 1.117727, 1, 1, 1, 1, 1,
0.2616291, 0.5830168, -0.3406439, 0, 0, 1, 1, 1,
0.2718271, 0.2613214, 0.4779814, 1, 0, 0, 1, 1,
0.2732705, -0.5464289, 2.591702, 1, 0, 0, 1, 1,
0.2753356, -0.486246, 4.106621, 1, 0, 0, 1, 1,
0.2754937, -0.6252967, 4.521282, 1, 0, 0, 1, 1,
0.2797163, -1.037163, 3.492719, 1, 0, 0, 1, 1,
0.2814757, 1.384202, 0.559664, 0, 0, 0, 1, 1,
0.2869037, 1.213478, -0.4388442, 0, 0, 0, 1, 1,
0.2870874, -1.027905, 2.509813, 0, 0, 0, 1, 1,
0.2876089, -0.08258973, 4.326777, 0, 0, 0, 1, 1,
0.2934366, 0.4804052, -0.9777536, 0, 0, 0, 1, 1,
0.2946491, -0.6828414, 3.220941, 0, 0, 0, 1, 1,
0.2969082, -1.149922, 2.055074, 0, 0, 0, 1, 1,
0.29971, -0.9499675, 3.141968, 1, 1, 1, 1, 1,
0.3016638, 1.373352, 1.251328, 1, 1, 1, 1, 1,
0.3053399, 0.6743724, -1.195801, 1, 1, 1, 1, 1,
0.3077069, 0.2263535, 3.242936, 1, 1, 1, 1, 1,
0.3089394, 2.047795, 0.1258855, 1, 1, 1, 1, 1,
0.3094174, -0.5384029, 2.193556, 1, 1, 1, 1, 1,
0.3106495, 0.516316, -0.2876368, 1, 1, 1, 1, 1,
0.3164614, -0.2248796, 1.817437, 1, 1, 1, 1, 1,
0.3169279, 1.046422, 0.5175416, 1, 1, 1, 1, 1,
0.3202064, -0.3037265, 2.646028, 1, 1, 1, 1, 1,
0.3204546, 0.5828636, 0.9979213, 1, 1, 1, 1, 1,
0.3237148, -0.9863586, 2.222527, 1, 1, 1, 1, 1,
0.3248184, -1.036589, 2.699515, 1, 1, 1, 1, 1,
0.3284384, 0.03307618, 1.094928, 1, 1, 1, 1, 1,
0.3310629, 0.5763106, 1.799607, 1, 1, 1, 1, 1,
0.3312336, -0.6362168, 2.766837, 0, 0, 1, 1, 1,
0.3330388, 1.327485, -0.2309372, 1, 0, 0, 1, 1,
0.334936, 0.6580527, 0.5114447, 1, 0, 0, 1, 1,
0.3372038, 1.647941, 0.4041435, 1, 0, 0, 1, 1,
0.338922, 0.7883903, 0.9580465, 1, 0, 0, 1, 1,
0.339491, 0.2280494, 1.94962, 1, 0, 0, 1, 1,
0.3466707, 0.5183648, 0.2719048, 0, 0, 0, 1, 1,
0.3490689, -0.006907137, 0.6182691, 0, 0, 0, 1, 1,
0.3498753, -0.09029859, 1.86299, 0, 0, 0, 1, 1,
0.3512528, -1.499357, 3.64226, 0, 0, 0, 1, 1,
0.3532777, 1.550962, -0.3280595, 0, 0, 0, 1, 1,
0.3551253, 0.2313693, 1.147762, 0, 0, 0, 1, 1,
0.3575008, -0.3743834, 2.102039, 0, 0, 0, 1, 1,
0.3594361, 1.047266, 1.669597, 1, 1, 1, 1, 1,
0.3635981, 0.9064293, -1.529376, 1, 1, 1, 1, 1,
0.3653932, 1.208889, 1.435103, 1, 1, 1, 1, 1,
0.3666373, 0.7452174, 0.4519087, 1, 1, 1, 1, 1,
0.3679469, -0.2146742, 3.232902, 1, 1, 1, 1, 1,
0.3685033, -0.6657636, 4.64613, 1, 1, 1, 1, 1,
0.3705712, -0.04831178, 1.69611, 1, 1, 1, 1, 1,
0.3747836, -0.4380312, 2.824645, 1, 1, 1, 1, 1,
0.3773106, 0.3862439, 0.563842, 1, 1, 1, 1, 1,
0.378265, -0.09181707, 1.296108, 1, 1, 1, 1, 1,
0.3786038, 0.1818326, 1.093331, 1, 1, 1, 1, 1,
0.3792287, 0.9957134, 0.6722746, 1, 1, 1, 1, 1,
0.3793456, 0.2384354, -0.1403134, 1, 1, 1, 1, 1,
0.3799824, 1.220516, 0.7321524, 1, 1, 1, 1, 1,
0.3835673, -1.439792, 1.500861, 1, 1, 1, 1, 1,
0.3864356, 2.323953, 1.84156, 0, 0, 1, 1, 1,
0.3875884, 0.3508538, 1.420273, 1, 0, 0, 1, 1,
0.3895826, 0.1703236, 0.4679694, 1, 0, 0, 1, 1,
0.3902769, -0.9063129, 2.337928, 1, 0, 0, 1, 1,
0.3916821, -0.7993167, 2.260787, 1, 0, 0, 1, 1,
0.3984278, -0.7268534, 3.095213, 1, 0, 0, 1, 1,
0.3986309, 0.001985822, 0.8629287, 0, 0, 0, 1, 1,
0.4046319, 0.6121657, 0.549126, 0, 0, 0, 1, 1,
0.4075566, 0.8892558, 1.481186, 0, 0, 0, 1, 1,
0.4078924, -1.687763, 2.446187, 0, 0, 0, 1, 1,
0.410777, 1.511485, -0.8344525, 0, 0, 0, 1, 1,
0.4115269, -0.3030862, 0.3338391, 0, 0, 0, 1, 1,
0.4123658, -0.7856399, 2.167932, 0, 0, 0, 1, 1,
0.4136423, -0.1066183, 0.784404, 1, 1, 1, 1, 1,
0.415162, 1.444844, -0.0361634, 1, 1, 1, 1, 1,
0.4162158, -0.9490369, 2.863454, 1, 1, 1, 1, 1,
0.4189844, -0.2963751, 0.7891052, 1, 1, 1, 1, 1,
0.4190878, 0.04910495, 0.7115793, 1, 1, 1, 1, 1,
0.419535, -0.3103504, 1.039706, 1, 1, 1, 1, 1,
0.4199957, 0.5050606, 2.113841, 1, 1, 1, 1, 1,
0.4202724, -0.6949344, 1.43671, 1, 1, 1, 1, 1,
0.4230393, 1.000333, -0.7191558, 1, 1, 1, 1, 1,
0.4236257, -0.7982142, 3.091054, 1, 1, 1, 1, 1,
0.4238471, -0.6467351, 2.134706, 1, 1, 1, 1, 1,
0.4263707, 0.9124784, 0.4900917, 1, 1, 1, 1, 1,
0.4278866, 0.4965665, -0.5070249, 1, 1, 1, 1, 1,
0.4323699, -0.7278751, 2.963433, 1, 1, 1, 1, 1,
0.4387464, -0.02864095, -0.3364498, 1, 1, 1, 1, 1,
0.4394302, -0.1246683, 1.484254, 0, 0, 1, 1, 1,
0.4403269, 0.854149, 1.204342, 1, 0, 0, 1, 1,
0.4404571, 0.5919035, -0.1839161, 1, 0, 0, 1, 1,
0.4432177, 0.1787798, 2.233141, 1, 0, 0, 1, 1,
0.4456178, -1.401615, 4.582988, 1, 0, 0, 1, 1,
0.4486686, -0.5587183, 3.016647, 1, 0, 0, 1, 1,
0.4488816, -1.461151, 0.6769993, 0, 0, 0, 1, 1,
0.456463, 2.337909, 1.26547, 0, 0, 0, 1, 1,
0.4570901, 0.01616402, 1.571532, 0, 0, 0, 1, 1,
0.4580809, 0.8392428, 1.497386, 0, 0, 0, 1, 1,
0.4585233, 0.5236148, -0.2355382, 0, 0, 0, 1, 1,
0.4591173, -1.536883, 3.97847, 0, 0, 0, 1, 1,
0.4671585, -0.4903332, 1.434516, 0, 0, 0, 1, 1,
0.4752442, -0.534439, 2.856823, 1, 1, 1, 1, 1,
0.4758458, 0.7918651, 0.2061233, 1, 1, 1, 1, 1,
0.4759061, -0.4423608, 1.374734, 1, 1, 1, 1, 1,
0.4762874, 0.3356923, -0.7082185, 1, 1, 1, 1, 1,
0.4836853, 0.1541636, 1.687729, 1, 1, 1, 1, 1,
0.4889993, 0.1874568, 2.093724, 1, 1, 1, 1, 1,
0.4892719, 1.73, -0.153129, 1, 1, 1, 1, 1,
0.4913757, -2.437588, 2.511454, 1, 1, 1, 1, 1,
0.4917035, -0.6166596, 3.279506, 1, 1, 1, 1, 1,
0.493995, 1.73349, -0.09360483, 1, 1, 1, 1, 1,
0.4968972, 0.914432, 1.038659, 1, 1, 1, 1, 1,
0.5007429, -1.806979, 1.588096, 1, 1, 1, 1, 1,
0.5013403, 0.2838835, 1.379596, 1, 1, 1, 1, 1,
0.504105, -2.251832, 4.531845, 1, 1, 1, 1, 1,
0.5052269, 0.4991128, 0.8851211, 1, 1, 1, 1, 1,
0.5088468, -0.9364358, 2.803539, 0, 0, 1, 1, 1,
0.5182402, -0.0550314, 0.5411007, 1, 0, 0, 1, 1,
0.5188094, -0.4942871, 1.154242, 1, 0, 0, 1, 1,
0.5190719, -0.5988699, 2.973224, 1, 0, 0, 1, 1,
0.5245169, 0.2013518, 1.135767, 1, 0, 0, 1, 1,
0.5253839, -0.4007339, 3.385928, 1, 0, 0, 1, 1,
0.5290917, -0.09705992, 1.258801, 0, 0, 0, 1, 1,
0.5334588, -0.5069126, 3.46214, 0, 0, 0, 1, 1,
0.5375716, 0.5958283, 1.656694, 0, 0, 0, 1, 1,
0.538719, -0.9712512, 2.250926, 0, 0, 0, 1, 1,
0.5393156, 0.2535644, 0.4309162, 0, 0, 0, 1, 1,
0.5403109, -1.302008, 1.831793, 0, 0, 0, 1, 1,
0.5409251, -0.08203673, 1.85953, 0, 0, 0, 1, 1,
0.5417214, 0.9567592, 1.267769, 1, 1, 1, 1, 1,
0.5462891, -0.3694072, 2.846888, 1, 1, 1, 1, 1,
0.5478919, 0.2683966, 0.6571872, 1, 1, 1, 1, 1,
0.5528205, 0.333195, 2.122602, 1, 1, 1, 1, 1,
0.5620198, -0.2511669, 0.1982206, 1, 1, 1, 1, 1,
0.5620632, 0.06532214, 3.52067, 1, 1, 1, 1, 1,
0.5652087, 0.7579233, 0.5745155, 1, 1, 1, 1, 1,
0.5738115, 1.131674, 0.2810754, 1, 1, 1, 1, 1,
0.574429, -0.3992236, 2.118426, 1, 1, 1, 1, 1,
0.5771685, -1.028121, 2.130644, 1, 1, 1, 1, 1,
0.5780054, 1.236262, -0.4186552, 1, 1, 1, 1, 1,
0.581544, 0.1434685, 1.256471, 1, 1, 1, 1, 1,
0.5829009, -0.6912799, 2.502971, 1, 1, 1, 1, 1,
0.5863799, 2.017833, -0.4400159, 1, 1, 1, 1, 1,
0.5901736, -1.484498, 1.727061, 1, 1, 1, 1, 1,
0.6057022, 1.553454, 0.726785, 0, 0, 1, 1, 1,
0.6065844, -0.2554896, 2.766213, 1, 0, 0, 1, 1,
0.6109452, 0.8434931, 1.230085, 1, 0, 0, 1, 1,
0.6114471, 0.1861515, 1.05525, 1, 0, 0, 1, 1,
0.612305, -1.635021, 2.31522, 1, 0, 0, 1, 1,
0.6126624, 0.1641888, -0.8605993, 1, 0, 0, 1, 1,
0.6127575, -1.646916, -0.1908179, 0, 0, 0, 1, 1,
0.6136138, 0.0006560941, 0.05589274, 0, 0, 0, 1, 1,
0.6136707, -1.677638, 2.978918, 0, 0, 0, 1, 1,
0.6142463, 1.64113, 0.3008548, 0, 0, 0, 1, 1,
0.6144557, -0.0540018, 1.799597, 0, 0, 0, 1, 1,
0.6192819, -0.0622219, -0.7024471, 0, 0, 0, 1, 1,
0.6223142, 1.018446, 1.146501, 0, 0, 0, 1, 1,
0.6256886, 0.0275833, 1.721952, 1, 1, 1, 1, 1,
0.6285765, 1.417366, -0.01432136, 1, 1, 1, 1, 1,
0.632364, -1.094933, 2.60926, 1, 1, 1, 1, 1,
0.6330646, 0.0713236, 0.6617617, 1, 1, 1, 1, 1,
0.6359168, -0.1896448, 1.648375, 1, 1, 1, 1, 1,
0.6457342, -0.3225522, 1.473135, 1, 1, 1, 1, 1,
0.6477343, 1.501879, 1.067948, 1, 1, 1, 1, 1,
0.6513754, 0.6655814, 1.477629, 1, 1, 1, 1, 1,
0.6555606, 0.8634977, -0.2154925, 1, 1, 1, 1, 1,
0.6577287, -2.088834, 1.488128, 1, 1, 1, 1, 1,
0.6587204, -0.08581316, 1.044076, 1, 1, 1, 1, 1,
0.6625479, 1.67596, 0.6457384, 1, 1, 1, 1, 1,
0.670663, 1.322302, 0.03438377, 1, 1, 1, 1, 1,
0.6765054, -0.1691571, 2.942471, 1, 1, 1, 1, 1,
0.6765092, -0.4596731, 1.204012, 1, 1, 1, 1, 1,
0.6770518, -0.1547568, 2.935068, 0, 0, 1, 1, 1,
0.6779, 1.61244, 1.261626, 1, 0, 0, 1, 1,
0.6800793, -0.7705836, 0.06533431, 1, 0, 0, 1, 1,
0.6850513, 0.405931, 1.390732, 1, 0, 0, 1, 1,
0.6864846, -0.7082564, 2.038376, 1, 0, 0, 1, 1,
0.6866301, 0.7604935, 1.150354, 1, 0, 0, 1, 1,
0.6928404, 0.2543536, 3.120048, 0, 0, 0, 1, 1,
0.6932303, -0.7734271, 2.707905, 0, 0, 0, 1, 1,
0.69908, 0.8913222, 1.543138, 0, 0, 0, 1, 1,
0.7008095, 0.7238196, 0.6299789, 0, 0, 0, 1, 1,
0.7013544, -1.628041, 3.16259, 0, 0, 0, 1, 1,
0.7017515, 1.846771, 0.14672, 0, 0, 0, 1, 1,
0.7057487, -1.612977, 2.487525, 0, 0, 0, 1, 1,
0.7074305, 0.05867794, 0.9288803, 1, 1, 1, 1, 1,
0.7125468, 0.4210238, 1.845773, 1, 1, 1, 1, 1,
0.7195464, 0.892657, 1.599971, 1, 1, 1, 1, 1,
0.7214703, 0.4261402, 2.159325, 1, 1, 1, 1, 1,
0.7327853, 0.6986339, 1.662326, 1, 1, 1, 1, 1,
0.7334978, -1.369552, 5.037191, 1, 1, 1, 1, 1,
0.7417558, 0.7973179, -0.02933467, 1, 1, 1, 1, 1,
0.7428523, 0.6047842, 0.7631537, 1, 1, 1, 1, 1,
0.746278, 2.35698, 2.427426, 1, 1, 1, 1, 1,
0.7538046, 0.430901, 1.303034, 1, 1, 1, 1, 1,
0.7540299, -1.315943, 2.279099, 1, 1, 1, 1, 1,
0.7569904, -2.969202, 3.152419, 1, 1, 1, 1, 1,
0.7580726, 1.106037, 0.7500678, 1, 1, 1, 1, 1,
0.758485, 2.47452, 1.87867, 1, 1, 1, 1, 1,
0.7657412, 0.008247625, 2.263903, 1, 1, 1, 1, 1,
0.7676817, -1.546154, 3.731258, 0, 0, 1, 1, 1,
0.7684422, -0.1553674, 1.42538, 1, 0, 0, 1, 1,
0.7697961, -0.8880462, 2.687533, 1, 0, 0, 1, 1,
0.7774884, -0.2717432, 0.4890026, 1, 0, 0, 1, 1,
0.7797015, -0.7535251, 3.653977, 1, 0, 0, 1, 1,
0.7820524, 0.8245205, 1.087054, 1, 0, 0, 1, 1,
0.7984086, 0.01831741, 1.712797, 0, 0, 0, 1, 1,
0.7997719, -0.3600689, 2.525208, 0, 0, 0, 1, 1,
0.8044912, -1.541028, 2.298532, 0, 0, 0, 1, 1,
0.811657, -1.125214, 4.890892, 0, 0, 0, 1, 1,
0.8121845, 0.6979224, 2.007493, 0, 0, 0, 1, 1,
0.8324225, 0.3493552, 2.912586, 0, 0, 0, 1, 1,
0.8415396, 1.190171, 0.1583851, 0, 0, 0, 1, 1,
0.8464659, -0.8763505, 3.413524, 1, 1, 1, 1, 1,
0.848159, -0.3256398, 1.874246, 1, 1, 1, 1, 1,
0.8507555, -0.5907142, 2.383761, 1, 1, 1, 1, 1,
0.8547071, 0.512626, 1.668748, 1, 1, 1, 1, 1,
0.8608412, 0.9770845, -1.700903, 1, 1, 1, 1, 1,
0.8658299, -0.7644576, 2.60357, 1, 1, 1, 1, 1,
0.8675442, -0.3513732, 3.329098, 1, 1, 1, 1, 1,
0.8710101, -1.22596, 4.248018, 1, 1, 1, 1, 1,
0.876819, -0.6260864, 1.205037, 1, 1, 1, 1, 1,
0.8855481, -0.2678689, 0.5118417, 1, 1, 1, 1, 1,
0.8970216, -0.04293671, 1.238268, 1, 1, 1, 1, 1,
0.8982406, 1.578304, 1.444536, 1, 1, 1, 1, 1,
0.9033374, 0.50563, 0.389717, 1, 1, 1, 1, 1,
0.9081997, -0.4320599, 2.531447, 1, 1, 1, 1, 1,
0.913111, 1.32676, 2.255471, 1, 1, 1, 1, 1,
0.9142034, -1.312954, 3.684189, 0, 0, 1, 1, 1,
0.9233482, -1.492959, 1.54091, 1, 0, 0, 1, 1,
0.9312321, 1.935126, -0.0262739, 1, 0, 0, 1, 1,
0.9326159, -0.6589032, 2.029124, 1, 0, 0, 1, 1,
0.9359092, 0.435076, 3.25233, 1, 0, 0, 1, 1,
0.9404249, -0.7503225, 2.835393, 1, 0, 0, 1, 1,
0.9508607, -2.154471, 3.756932, 0, 0, 0, 1, 1,
0.9545766, 0.1465506, 2.088658, 0, 0, 0, 1, 1,
0.958686, -0.1964125, 1.705621, 0, 0, 0, 1, 1,
0.9605018, 1.467929, -1.277502, 0, 0, 0, 1, 1,
0.9650034, 0.327947, 2.490617, 0, 0, 0, 1, 1,
0.9709236, -0.3277651, -0.01064114, 0, 0, 0, 1, 1,
0.9788809, -1.4671, 4.074248, 0, 0, 0, 1, 1,
0.9892258, 1.850584, 0.6010448, 1, 1, 1, 1, 1,
0.9916275, 0.5199356, 1.239536, 1, 1, 1, 1, 1,
0.9968523, 1.483269, 1.968564, 1, 1, 1, 1, 1,
0.9980715, 1.132375, 1.083684, 1, 1, 1, 1, 1,
0.9989452, -1.000487, 2.569667, 1, 1, 1, 1, 1,
1.000633, 0.7536334, 0.01440728, 1, 1, 1, 1, 1,
1.002448, -1.31103, 3.140062, 1, 1, 1, 1, 1,
1.013823, 0.1650699, 0.6659895, 1, 1, 1, 1, 1,
1.015548, -1.004151, 1.188417, 1, 1, 1, 1, 1,
1.023801, 0.6476544, -0.2720583, 1, 1, 1, 1, 1,
1.025419, 0.6721945, 1.533665, 1, 1, 1, 1, 1,
1.025668, 1.063803, 2.111566, 1, 1, 1, 1, 1,
1.028172, 0.03875225, 1.905323, 1, 1, 1, 1, 1,
1.030466, -1.74843, 3.50421, 1, 1, 1, 1, 1,
1.03252, 1.424425, 1.311096, 1, 1, 1, 1, 1,
1.033568, -0.5876756, 2.06679, 0, 0, 1, 1, 1,
1.036436, -0.9613482, 3.372572, 1, 0, 0, 1, 1,
1.046054, 2.014693, -0.1082425, 1, 0, 0, 1, 1,
1.053003, -0.5304815, 2.289363, 1, 0, 0, 1, 1,
1.054121, -2.706543, 1.891248, 1, 0, 0, 1, 1,
1.058017, 0.3034675, 1.425956, 1, 0, 0, 1, 1,
1.065366, 1.259983, 0.05402866, 0, 0, 0, 1, 1,
1.066448, 0.9013221, -0.7266967, 0, 0, 0, 1, 1,
1.067417, -0.1438059, 1.408482, 0, 0, 0, 1, 1,
1.074442, 0.3364552, 1.252896, 0, 0, 0, 1, 1,
1.076751, -0.3555188, 1.98789, 0, 0, 0, 1, 1,
1.078587, -0.2937948, 0.4381535, 0, 0, 0, 1, 1,
1.086296, 0.2202257, 1.910234, 0, 0, 0, 1, 1,
1.089967, -0.3946496, 3.239686, 1, 1, 1, 1, 1,
1.093119, -0.2039451, 3.0751, 1, 1, 1, 1, 1,
1.094831, 1.616827, 0.06845964, 1, 1, 1, 1, 1,
1.100701, 1.585044, -0.002039637, 1, 1, 1, 1, 1,
1.105005, 2.25527, 0.2115411, 1, 1, 1, 1, 1,
1.11052, -0.3353357, 1.855595, 1, 1, 1, 1, 1,
1.121556, 0.6033477, 1.49803, 1, 1, 1, 1, 1,
1.121984, -0.4678991, 1.981023, 1, 1, 1, 1, 1,
1.125017, 0.5072672, 2.836111, 1, 1, 1, 1, 1,
1.125076, -0.6365837, 2.455842, 1, 1, 1, 1, 1,
1.126089, -0.6925431, 3.026286, 1, 1, 1, 1, 1,
1.128247, 0.2457284, 0.2981319, 1, 1, 1, 1, 1,
1.131512, 1.200831, -1.048618, 1, 1, 1, 1, 1,
1.142328, 0.5130726, 2.153674, 1, 1, 1, 1, 1,
1.14243, -0.6863755, 1.313414, 1, 1, 1, 1, 1,
1.144536, -1.46927, 2.427338, 0, 0, 1, 1, 1,
1.146221, -0.7302511, 1.061904, 1, 0, 0, 1, 1,
1.147563, 0.07968605, 0.3630945, 1, 0, 0, 1, 1,
1.152205, -1.024603, 2.119509, 1, 0, 0, 1, 1,
1.153116, -0.1298068, -0.08245295, 1, 0, 0, 1, 1,
1.156681, -0.6118594, 1.99894, 1, 0, 0, 1, 1,
1.172116, -0.8326241, 1.360994, 0, 0, 0, 1, 1,
1.179404, -0.6848444, -0.05772373, 0, 0, 0, 1, 1,
1.186881, 1.688889, -0.7293538, 0, 0, 0, 1, 1,
1.187749, 0.8605567, 0.03638538, 0, 0, 0, 1, 1,
1.188387, -0.7663328, 3.218672, 0, 0, 0, 1, 1,
1.188884, -0.7955334, 2.836926, 0, 0, 0, 1, 1,
1.194813, -0.8487014, 1.407205, 0, 0, 0, 1, 1,
1.196346, 1.192747, 0.9034851, 1, 1, 1, 1, 1,
1.201935, 0.9394891, -0.3602356, 1, 1, 1, 1, 1,
1.227263, -0.7883679, 2.254627, 1, 1, 1, 1, 1,
1.22795, 0.08001806, 2.942645, 1, 1, 1, 1, 1,
1.234109, -0.9619648, 1.633037, 1, 1, 1, 1, 1,
1.236207, -1.15059, 2.685659, 1, 1, 1, 1, 1,
1.240457, 1.788053, 0.2512369, 1, 1, 1, 1, 1,
1.243279, -0.8008643, 2.754246, 1, 1, 1, 1, 1,
1.246918, 0.1553116, 1.454069, 1, 1, 1, 1, 1,
1.251271, -1.737126, 1.344446, 1, 1, 1, 1, 1,
1.283084, 1.881785, 1.176771, 1, 1, 1, 1, 1,
1.298037, 1.661245, -1.060551, 1, 1, 1, 1, 1,
1.300199, 0.1145062, 0.02237375, 1, 1, 1, 1, 1,
1.301122, 0.0801894, 2.400062, 1, 1, 1, 1, 1,
1.305728, -0.6479272, 1.78078, 1, 1, 1, 1, 1,
1.323633, 0.3419735, 1.85434, 0, 0, 1, 1, 1,
1.331846, -0.3606275, 0.4345426, 1, 0, 0, 1, 1,
1.332606, 0.3852727, 2.962324, 1, 0, 0, 1, 1,
1.340287, -1.273499, 0.5251024, 1, 0, 0, 1, 1,
1.348475, -0.5845178, 2.621833, 1, 0, 0, 1, 1,
1.358512, 2.534409, 1.102913, 1, 0, 0, 1, 1,
1.366987, 1.554253, 1.254919, 0, 0, 0, 1, 1,
1.368314, 0.199645, 0.6473513, 0, 0, 0, 1, 1,
1.368578, 0.6208599, 1.442297, 0, 0, 0, 1, 1,
1.373779, -0.9756537, 1.981977, 0, 0, 0, 1, 1,
1.378075, -0.1244558, 1.739633, 0, 0, 0, 1, 1,
1.385051, -0.3514358, 2.436194, 0, 0, 0, 1, 1,
1.38597, 0.7958448, -0.1685783, 0, 0, 0, 1, 1,
1.386635, 0.5730389, 0.9668061, 1, 1, 1, 1, 1,
1.421403, 0.3560605, 1.795883, 1, 1, 1, 1, 1,
1.421843, 0.2892666, 1.311315, 1, 1, 1, 1, 1,
1.43464, -0.4029664, 1.825784, 1, 1, 1, 1, 1,
1.435765, -0.4971554, 0.4901766, 1, 1, 1, 1, 1,
1.436078, -1.304605, 1.224372, 1, 1, 1, 1, 1,
1.442516, 1.05894, 0.3801176, 1, 1, 1, 1, 1,
1.443096, -0.3422555, 1.920512, 1, 1, 1, 1, 1,
1.447946, -1.448544, 4.198124, 1, 1, 1, 1, 1,
1.449164, 0.2866246, 2.399042, 1, 1, 1, 1, 1,
1.488412, -1.665231, 2.327823, 1, 1, 1, 1, 1,
1.510429, -0.7452412, 2.998114, 1, 1, 1, 1, 1,
1.542407, 1.252584, -0.3654611, 1, 1, 1, 1, 1,
1.553457, 0.5979045, 1.036054, 1, 1, 1, 1, 1,
1.554249, 0.2805156, 0.2054845, 1, 1, 1, 1, 1,
1.566214, -0.2939027, 2.859709, 0, 0, 1, 1, 1,
1.569072, 0.289967, 0.5776145, 1, 0, 0, 1, 1,
1.626715, 1.515818, 0.6656533, 1, 0, 0, 1, 1,
1.645928, -0.5497724, 1.872684, 1, 0, 0, 1, 1,
1.66054, -0.8052622, 3.735397, 1, 0, 0, 1, 1,
1.663575, 1.632302, -0.08646944, 1, 0, 0, 1, 1,
1.670305, -0.2545928, 0.6096085, 0, 0, 0, 1, 1,
1.679714, -0.7776715, 0.9662302, 0, 0, 0, 1, 1,
1.690616, -0.7411513, 1.903378, 0, 0, 0, 1, 1,
1.698825, 1.503141, -1.714885, 0, 0, 0, 1, 1,
1.71111, 0.5817359, 0.2372604, 0, 0, 0, 1, 1,
1.734767, -0.1327858, 0.1821015, 0, 0, 0, 1, 1,
1.743539, -1.222402, 1.370491, 0, 0, 0, 1, 1,
1.749264, -0.2381576, 2.767334, 1, 1, 1, 1, 1,
1.751894, -0.2467662, 2.491737, 1, 1, 1, 1, 1,
1.755619, 0.6273817, 2.91298, 1, 1, 1, 1, 1,
1.773665, 0.8027852, 2.118415, 1, 1, 1, 1, 1,
1.784111, -0.3575449, 2.28804, 1, 1, 1, 1, 1,
1.801681, -0.7026159, -0.3049684, 1, 1, 1, 1, 1,
1.822647, 0.1483593, 1.103945, 1, 1, 1, 1, 1,
1.825164, 0.4139264, 2.161135, 1, 1, 1, 1, 1,
1.859022, 0.1350253, 0.1032405, 1, 1, 1, 1, 1,
1.891353, 0.06891696, 2.482793, 1, 1, 1, 1, 1,
1.891652, 0.3255942, 1.14689, 1, 1, 1, 1, 1,
1.905973, 1.882061, -0.2221881, 1, 1, 1, 1, 1,
1.917482, 0.352587, -0.7331457, 1, 1, 1, 1, 1,
1.930395, -0.6572573, 1.33699, 1, 1, 1, 1, 1,
1.939974, 0.1423311, 0.2966401, 1, 1, 1, 1, 1,
1.940485, -1.023092, 2.409963, 0, 0, 1, 1, 1,
1.966326, 0.4067175, 0.4839913, 1, 0, 0, 1, 1,
1.971875, -1.933675, 4.298781, 1, 0, 0, 1, 1,
1.994361, -0.7073165, 0.755065, 1, 0, 0, 1, 1,
2.018133, -1.155786, 2.452026, 1, 0, 0, 1, 1,
2.054866, 2.066025, 1.206393, 1, 0, 0, 1, 1,
2.138818, 1.100349, 0.1646507, 0, 0, 0, 1, 1,
2.148071, -0.4381636, -0.8057107, 0, 0, 0, 1, 1,
2.290833, -0.05342989, 1.410868, 0, 0, 0, 1, 1,
2.317767, -0.4985943, 1.945411, 0, 0, 0, 1, 1,
2.330649, -1.56277, 3.337582, 0, 0, 0, 1, 1,
2.432511, 1.062687, 0.7389936, 0, 0, 0, 1, 1,
2.444983, -0.1237829, 2.168617, 0, 0, 0, 1, 1,
2.521617, 0.2754396, 0.999498, 1, 1, 1, 1, 1,
2.555165, 0.771778, 1.493436, 1, 1, 1, 1, 1,
2.636096, -1.440296, 1.756934, 1, 1, 1, 1, 1,
2.693208, 0.07755926, 1.479728, 1, 1, 1, 1, 1,
2.881422, -0.9428776, 3.143879, 1, 1, 1, 1, 1,
2.932349, -2.320657, 2.939037, 1, 1, 1, 1, 1,
3.044147, 1.745013, 0.8802419, 1, 1, 1, 1, 1
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
var radius = 9.44664;
var distance = 33.18092;
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
mvMatrix.translate( -0.1216128, -0.1523392, 0.3318639 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18092);
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