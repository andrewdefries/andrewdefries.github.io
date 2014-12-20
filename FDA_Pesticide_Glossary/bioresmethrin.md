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
-2.673636, 0.3922708, -4.046202, 1, 0, 0, 1,
-2.665371, 0.6189502, -1.910825, 1, 0.007843138, 0, 1,
-2.557911, -0.1294502, -1.321532, 1, 0.01176471, 0, 1,
-2.505617, 1.132022, -0.7618789, 1, 0.01960784, 0, 1,
-2.442739, 1.860933, -1.369584, 1, 0.02352941, 0, 1,
-2.41185, -1.716623, -2.534001, 1, 0.03137255, 0, 1,
-2.400363, -0.1920244, -1.390708, 1, 0.03529412, 0, 1,
-2.392745, 0.9029704, -1.939412, 1, 0.04313726, 0, 1,
-2.38851, -0.04816241, -2.380778, 1, 0.04705882, 0, 1,
-2.304682, -0.02859049, -1.456244, 1, 0.05490196, 0, 1,
-2.298455, -0.6545303, -2.78712, 1, 0.05882353, 0, 1,
-2.292312, -0.3976323, -0.7712782, 1, 0.06666667, 0, 1,
-2.272995, 0.6710189, -1.238869, 1, 0.07058824, 0, 1,
-2.26305, 2.412575, -1.565989, 1, 0.07843138, 0, 1,
-2.229761, -0.8374661, -1.610407, 1, 0.08235294, 0, 1,
-2.217247, 0.133435, -1.492948, 1, 0.09019608, 0, 1,
-2.205402, -0.7845168, -1.61818, 1, 0.09411765, 0, 1,
-2.189425, 0.9076023, -1.329796, 1, 0.1019608, 0, 1,
-2.140543, 0.5596592, -3.147567, 1, 0.1098039, 0, 1,
-2.123386, 0.957164, -0.3163501, 1, 0.1137255, 0, 1,
-2.117261, 1.012007, 0.3308952, 1, 0.1215686, 0, 1,
-2.104831, 0.8920823, -1.483888, 1, 0.1254902, 0, 1,
-2.089248, -0.2747232, -0.1296093, 1, 0.1333333, 0, 1,
-2.089232, 1.446031, -1.789548, 1, 0.1372549, 0, 1,
-2.081504, -0.0009454666, -0.1523215, 1, 0.145098, 0, 1,
-2.062942, 0.2243628, -2.183191, 1, 0.1490196, 0, 1,
-2.042522, -0.8398958, -2.289659, 1, 0.1568628, 0, 1,
-2.026179, -0.1946887, -2.332029, 1, 0.1607843, 0, 1,
-1.981773, -1.577762, -1.714948, 1, 0.1686275, 0, 1,
-1.963866, 1.366185, -0.7355728, 1, 0.172549, 0, 1,
-1.954915, 0.6788463, -0.5932667, 1, 0.1803922, 0, 1,
-1.939559, 0.3159752, -1.61509, 1, 0.1843137, 0, 1,
-1.938796, 0.8617727, -2.195388, 1, 0.1921569, 0, 1,
-1.924399, -2.428716, -2.93038, 1, 0.1960784, 0, 1,
-1.912822, 1.289416, -2.388321, 1, 0.2039216, 0, 1,
-1.906191, -1.107601, -3.080979, 1, 0.2117647, 0, 1,
-1.877146, 0.6757398, -1.603691, 1, 0.2156863, 0, 1,
-1.855503, 0.8887864, -1.117585, 1, 0.2235294, 0, 1,
-1.850244, 0.5279174, -1.981185, 1, 0.227451, 0, 1,
-1.847412, 0.3034845, -2.187766, 1, 0.2352941, 0, 1,
-1.804958, -0.7019628, -1.761374, 1, 0.2392157, 0, 1,
-1.795932, 1.035486, 0.7751064, 1, 0.2470588, 0, 1,
-1.765531, 0.06572665, -1.778685, 1, 0.2509804, 0, 1,
-1.757346, -0.6904955, -0.8762073, 1, 0.2588235, 0, 1,
-1.724447, 0.2890767, -1.040457, 1, 0.2627451, 0, 1,
-1.702275, 1.238172, -1.157704, 1, 0.2705882, 0, 1,
-1.691801, 0.7469095, -2.924692, 1, 0.2745098, 0, 1,
-1.67467, -0.393477, -2.448564, 1, 0.282353, 0, 1,
-1.671867, 0.05909413, -1.629902, 1, 0.2862745, 0, 1,
-1.65273, 0.9535317, -0.781618, 1, 0.2941177, 0, 1,
-1.650459, -2.776145, -2.205405, 1, 0.3019608, 0, 1,
-1.63742, -0.6563797, -0.9674411, 1, 0.3058824, 0, 1,
-1.636126, -0.4050522, -1.844033, 1, 0.3137255, 0, 1,
-1.628719, 0.742873, 0.2622066, 1, 0.3176471, 0, 1,
-1.621309, 1.21805, -1.457883, 1, 0.3254902, 0, 1,
-1.618573, -0.6879632, -1.86169, 1, 0.3294118, 0, 1,
-1.618457, 0.2547766, -3.703211, 1, 0.3372549, 0, 1,
-1.614836, -0.4531221, -4.579766, 1, 0.3411765, 0, 1,
-1.595457, 1.086186, -2.228933, 1, 0.3490196, 0, 1,
-1.594515, 1.552047, -1.688041, 1, 0.3529412, 0, 1,
-1.581132, -1.542547, -2.669134, 1, 0.3607843, 0, 1,
-1.571129, -1.060231, -2.40538, 1, 0.3647059, 0, 1,
-1.561355, -0.4174528, -0.9519755, 1, 0.372549, 0, 1,
-1.559793, 0.6502815, -2.823857, 1, 0.3764706, 0, 1,
-1.539749, 1.966992, -0.3562881, 1, 0.3843137, 0, 1,
-1.515727, 0.3581516, -0.393476, 1, 0.3882353, 0, 1,
-1.51185, 1.461715, -0.5842223, 1, 0.3960784, 0, 1,
-1.48937, 0.01425322, -1.350598, 1, 0.4039216, 0, 1,
-1.48834, -0.6437781, -1.175034, 1, 0.4078431, 0, 1,
-1.478351, -0.2450242, -2.502058, 1, 0.4156863, 0, 1,
-1.475687, -0.10481, -1.248635, 1, 0.4196078, 0, 1,
-1.46713, -0.7705197, -2.588252, 1, 0.427451, 0, 1,
-1.457766, 0.08156371, -1.838167, 1, 0.4313726, 0, 1,
-1.455417, 2.878859, -1.664518, 1, 0.4392157, 0, 1,
-1.449145, -0.1728471, -2.144519, 1, 0.4431373, 0, 1,
-1.444912, -0.2107757, -0.8751217, 1, 0.4509804, 0, 1,
-1.442991, -1.11127, -2.849902, 1, 0.454902, 0, 1,
-1.442404, 0.1737009, -2.921689, 1, 0.4627451, 0, 1,
-1.436527, -0.3024388, -2.299048, 1, 0.4666667, 0, 1,
-1.431946, 0.156724, -2.850662, 1, 0.4745098, 0, 1,
-1.431786, 0.4954099, -0.090919, 1, 0.4784314, 0, 1,
-1.430083, -0.5632462, -1.43329, 1, 0.4862745, 0, 1,
-1.424236, 0.2779351, -1.338467, 1, 0.4901961, 0, 1,
-1.417166, 2.853155, -0.2256538, 1, 0.4980392, 0, 1,
-1.416015, -0.543858, -0.7628555, 1, 0.5058824, 0, 1,
-1.409134, -1.111294, -3.456751, 1, 0.509804, 0, 1,
-1.406286, -0.4634831, -1.300864, 1, 0.5176471, 0, 1,
-1.39351, -0.7601032, -3.353894, 1, 0.5215687, 0, 1,
-1.377698, 1.763676, -0.6030286, 1, 0.5294118, 0, 1,
-1.377467, -0.774761, -3.158743, 1, 0.5333334, 0, 1,
-1.375594, -1.807158, -4.454787, 1, 0.5411765, 0, 1,
-1.371461, -1.434524, -0.7865213, 1, 0.5450981, 0, 1,
-1.367083, -0.3750595, -1.565038, 1, 0.5529412, 0, 1,
-1.364957, -0.1958119, -0.5454525, 1, 0.5568628, 0, 1,
-1.364873, -0.3255279, -1.115667, 1, 0.5647059, 0, 1,
-1.363186, 0.2298505, -1.251026, 1, 0.5686275, 0, 1,
-1.360397, -0.7130486, -2.754751, 1, 0.5764706, 0, 1,
-1.359186, -0.4597807, -1.283054, 1, 0.5803922, 0, 1,
-1.359053, -0.4676172, -2.565624, 1, 0.5882353, 0, 1,
-1.355257, 0.8038124, -0.9952949, 1, 0.5921569, 0, 1,
-1.341895, -0.9167286, -2.584317, 1, 0.6, 0, 1,
-1.330862, 2.152589, -2.306753, 1, 0.6078432, 0, 1,
-1.329175, 0.05933107, -1.844884, 1, 0.6117647, 0, 1,
-1.319788, -1.100075, -1.692261, 1, 0.6196079, 0, 1,
-1.317061, -1.755877, -3.08413, 1, 0.6235294, 0, 1,
-1.307967, -1.87989, -2.493619, 1, 0.6313726, 0, 1,
-1.303318, -1.537669, -2.949391, 1, 0.6352941, 0, 1,
-1.292801, 0.05355568, -1.391009, 1, 0.6431373, 0, 1,
-1.288382, -1.588678, -2.401599, 1, 0.6470588, 0, 1,
-1.281027, 0.1824438, -1.289948, 1, 0.654902, 0, 1,
-1.280177, -0.6447106, -1.954111, 1, 0.6588235, 0, 1,
-1.2678, -1.068745, -3.4555, 1, 0.6666667, 0, 1,
-1.267419, -0.9527884, -2.121907, 1, 0.6705883, 0, 1,
-1.266041, 1.831604, -0.6210946, 1, 0.6784314, 0, 1,
-1.265866, 1.07012, -2.522315, 1, 0.682353, 0, 1,
-1.262061, -1.090394, -0.7960505, 1, 0.6901961, 0, 1,
-1.253293, -0.3790411, -0.5775085, 1, 0.6941177, 0, 1,
-1.250664, -0.6844682, -1.899631, 1, 0.7019608, 0, 1,
-1.239336, 0.3786666, -1.354096, 1, 0.7098039, 0, 1,
-1.236364, -0.3182441, -0.3339041, 1, 0.7137255, 0, 1,
-1.236291, -0.5003506, -2.053503, 1, 0.7215686, 0, 1,
-1.233577, -0.8039571, -3.213879, 1, 0.7254902, 0, 1,
-1.233344, 0.6839058, -1.036018, 1, 0.7333333, 0, 1,
-1.231561, 1.174039, -0.9348806, 1, 0.7372549, 0, 1,
-1.22924, -0.07103055, -1.012834, 1, 0.7450981, 0, 1,
-1.227361, -0.3493625, -1.774491, 1, 0.7490196, 0, 1,
-1.222787, 1.300094, -1.36004, 1, 0.7568628, 0, 1,
-1.221793, -1.494255, -1.12011, 1, 0.7607843, 0, 1,
-1.220366, -0.8042492, -2.188445, 1, 0.7686275, 0, 1,
-1.210362, 0.9181897, 0.5314935, 1, 0.772549, 0, 1,
-1.202259, -0.4161512, -0.6943251, 1, 0.7803922, 0, 1,
-1.190644, -0.9932874, -1.684358, 1, 0.7843137, 0, 1,
-1.179675, -0.9536965, -2.775257, 1, 0.7921569, 0, 1,
-1.173652, -0.2936187, -1.595446, 1, 0.7960784, 0, 1,
-1.170071, 0.7777618, 0.1015023, 1, 0.8039216, 0, 1,
-1.169862, -1.047998, -3.68133, 1, 0.8117647, 0, 1,
-1.16943, -0.8107003, -4.609405, 1, 0.8156863, 0, 1,
-1.158463, 0.3368329, 0.1877961, 1, 0.8235294, 0, 1,
-1.157645, -1.031454, -3.328534, 1, 0.827451, 0, 1,
-1.152288, -1.766132, -3.254929, 1, 0.8352941, 0, 1,
-1.150122, -1.82631, -2.239677, 1, 0.8392157, 0, 1,
-1.147822, 1.068811, -0.4982417, 1, 0.8470588, 0, 1,
-1.146893, -0.368616, -1.158984, 1, 0.8509804, 0, 1,
-1.143137, 0.3338559, -1.360134, 1, 0.8588235, 0, 1,
-1.137428, -0.2124678, -0.6592169, 1, 0.8627451, 0, 1,
-1.12702, 1.406079, -2.352536, 1, 0.8705882, 0, 1,
-1.123849, 0.6593847, -1.887738, 1, 0.8745098, 0, 1,
-1.118493, -0.279449, -1.384685, 1, 0.8823529, 0, 1,
-1.115187, 0.8041028, -1.107084, 1, 0.8862745, 0, 1,
-1.115, 0.259173, 0.6648695, 1, 0.8941177, 0, 1,
-1.113025, -1.971447, -3.144289, 1, 0.8980392, 0, 1,
-1.111901, -0.7858951, -1.894928, 1, 0.9058824, 0, 1,
-1.107144, 0.478964, -0.6108825, 1, 0.9137255, 0, 1,
-1.106682, -0.645963, -1.679383, 1, 0.9176471, 0, 1,
-1.100907, -0.2207126, -2.245626, 1, 0.9254902, 0, 1,
-1.098402, -0.7821319, -2.353604, 1, 0.9294118, 0, 1,
-1.093311, 0.2182638, -2.141435, 1, 0.9372549, 0, 1,
-1.088363, -0.8097039, -3.026297, 1, 0.9411765, 0, 1,
-1.080532, 1.491954, 0.2027561, 1, 0.9490196, 0, 1,
-1.079826, -0.6572888, -0.2126523, 1, 0.9529412, 0, 1,
-1.078189, -0.04338488, 0.1097168, 1, 0.9607843, 0, 1,
-1.073804, 0.3710397, -2.24653, 1, 0.9647059, 0, 1,
-1.069453, -0.7148068, -2.329594, 1, 0.972549, 0, 1,
-1.057277, -0.3205898, -1.839077, 1, 0.9764706, 0, 1,
-1.050404, 1.149069, -0.9155195, 1, 0.9843137, 0, 1,
-1.037304, -0.2178763, -1.826118, 1, 0.9882353, 0, 1,
-1.036768, 1.513848, -0.6750336, 1, 0.9960784, 0, 1,
-1.032287, 0.951497, -1.198925, 0.9960784, 1, 0, 1,
-1.025951, 1.395149, -0.5330822, 0.9921569, 1, 0, 1,
-1.019015, -0.7694024, -2.977728, 0.9843137, 1, 0, 1,
-1.001913, 0.4810874, -1.970896, 0.9803922, 1, 0, 1,
-0.9968681, -0.9636273, -0.2305956, 0.972549, 1, 0, 1,
-0.9886376, -0.02106819, -1.044111, 0.9686275, 1, 0, 1,
-0.9846517, -1.026924, -0.9478855, 0.9607843, 1, 0, 1,
-0.9748822, -0.7916216, -0.3691074, 0.9568627, 1, 0, 1,
-0.9709257, -2.549502, -3.479269, 0.9490196, 1, 0, 1,
-0.9649121, -0.03331809, -0.9499913, 0.945098, 1, 0, 1,
-0.959919, -0.2147758, -0.1289572, 0.9372549, 1, 0, 1,
-0.9555207, 0.36009, 0.532759, 0.9333333, 1, 0, 1,
-0.9544482, -0.2185191, -0.9044222, 0.9254902, 1, 0, 1,
-0.9456924, -1.341594, -0.9632711, 0.9215686, 1, 0, 1,
-0.9445158, 1.241204, 0.3482037, 0.9137255, 1, 0, 1,
-0.9402272, -0.2362908, -2.083441, 0.9098039, 1, 0, 1,
-0.9366287, 0.8632926, -0.9142644, 0.9019608, 1, 0, 1,
-0.9290621, -0.1584805, -2.292615, 0.8941177, 1, 0, 1,
-0.9200253, -0.01410666, -1.424587, 0.8901961, 1, 0, 1,
-0.9106151, -0.2873401, -2.030034, 0.8823529, 1, 0, 1,
-0.9099641, -1.361654, -2.029536, 0.8784314, 1, 0, 1,
-0.8974292, -0.4581084, -2.868613, 0.8705882, 1, 0, 1,
-0.8966838, -0.2258132, -2.101074, 0.8666667, 1, 0, 1,
-0.8950625, -1.108416, -2.382796, 0.8588235, 1, 0, 1,
-0.8932826, -0.2090265, -1.127385, 0.854902, 1, 0, 1,
-0.889765, 0.7095594, 1.393443, 0.8470588, 1, 0, 1,
-0.8895082, -0.1139623, 0.4081702, 0.8431373, 1, 0, 1,
-0.8847942, -1.576276, -1.87581, 0.8352941, 1, 0, 1,
-0.8810143, -0.5172637, -0.874202, 0.8313726, 1, 0, 1,
-0.8810018, -0.4038602, -0.6443106, 0.8235294, 1, 0, 1,
-0.8766812, -0.3465818, -2.09301, 0.8196079, 1, 0, 1,
-0.8730485, 1.230471, -1.008087, 0.8117647, 1, 0, 1,
-0.8709062, 0.3731345, -0.8180671, 0.8078431, 1, 0, 1,
-0.8699097, 1.272513, 2.022618, 0.8, 1, 0, 1,
-0.8629265, -0.4503208, -1.945103, 0.7921569, 1, 0, 1,
-0.8607151, 0.2828294, -1.453099, 0.7882353, 1, 0, 1,
-0.8592974, 0.1940722, -3.954163, 0.7803922, 1, 0, 1,
-0.856901, -0.5904059, -1.167075, 0.7764706, 1, 0, 1,
-0.8562872, -0.7654845, -3.51479, 0.7686275, 1, 0, 1,
-0.8508297, 0.3244057, -1.824609, 0.7647059, 1, 0, 1,
-0.8439942, -0.3295904, -1.422774, 0.7568628, 1, 0, 1,
-0.8421341, 0.1578124, -1.496275, 0.7529412, 1, 0, 1,
-0.8383983, 1.024927, -1.266207, 0.7450981, 1, 0, 1,
-0.8332403, 0.6056787, -1.033571, 0.7411765, 1, 0, 1,
-0.8278574, -0.5004286, -0.5416545, 0.7333333, 1, 0, 1,
-0.8272887, 0.9414725, -1.280216, 0.7294118, 1, 0, 1,
-0.8234186, -0.7595303, -0.6707271, 0.7215686, 1, 0, 1,
-0.8056536, -0.6904091, -2.406221, 0.7176471, 1, 0, 1,
-0.7987714, 1.443416, 0.9433305, 0.7098039, 1, 0, 1,
-0.7934263, 1.109561, -2.089892, 0.7058824, 1, 0, 1,
-0.7889605, -1.20821, -2.33883, 0.6980392, 1, 0, 1,
-0.7889544, 0.4295636, -3.128916, 0.6901961, 1, 0, 1,
-0.7884551, 0.9808453, 0.4390627, 0.6862745, 1, 0, 1,
-0.7752857, 1.542956, 1.395431, 0.6784314, 1, 0, 1,
-0.7650131, 1.700789, -0.8823974, 0.6745098, 1, 0, 1,
-0.763723, -1.006223, -1.892914, 0.6666667, 1, 0, 1,
-0.7607008, 0.4154334, 0.3633601, 0.6627451, 1, 0, 1,
-0.7601728, 1.427929, -0.4363129, 0.654902, 1, 0, 1,
-0.755394, -1.042438, -2.084621, 0.6509804, 1, 0, 1,
-0.7471281, 1.002317, 0.5037447, 0.6431373, 1, 0, 1,
-0.7371258, 0.8546631, -1.027438, 0.6392157, 1, 0, 1,
-0.7299831, -1.719761, -2.261743, 0.6313726, 1, 0, 1,
-0.7292004, 0.864509, -0.6015365, 0.627451, 1, 0, 1,
-0.7253772, 0.6356946, -1.73445, 0.6196079, 1, 0, 1,
-0.721982, 0.6668665, -0.9362496, 0.6156863, 1, 0, 1,
-0.7212331, -0.2321699, -1.38285, 0.6078432, 1, 0, 1,
-0.720627, 1.471349, 0.2176776, 0.6039216, 1, 0, 1,
-0.7160433, -0.8707131, -4.135817, 0.5960785, 1, 0, 1,
-0.7038172, 0.9553307, -1.1311, 0.5882353, 1, 0, 1,
-0.70053, -2.027337, -2.530389, 0.5843138, 1, 0, 1,
-0.6979311, -0.3556139, -1.098262, 0.5764706, 1, 0, 1,
-0.6935602, 0.3863911, -1.240995, 0.572549, 1, 0, 1,
-0.6895511, 0.322944, -0.196305, 0.5647059, 1, 0, 1,
-0.6872483, -1.526479, -3.6893, 0.5607843, 1, 0, 1,
-0.6864262, 0.179319, -0.8948053, 0.5529412, 1, 0, 1,
-0.6847968, 0.6784777, -2.501523, 0.5490196, 1, 0, 1,
-0.684674, -0.9523312, -2.586947, 0.5411765, 1, 0, 1,
-0.6827932, -1.416215, -2.900053, 0.5372549, 1, 0, 1,
-0.6827128, 0.5375716, 0.1356809, 0.5294118, 1, 0, 1,
-0.6802874, -0.778819, -3.992205, 0.5254902, 1, 0, 1,
-0.680054, 0.4650902, 0.3538297, 0.5176471, 1, 0, 1,
-0.675748, -1.044646, -1.402444, 0.5137255, 1, 0, 1,
-0.6729694, 0.5394837, -2.356984, 0.5058824, 1, 0, 1,
-0.6681408, 0.1855772, -2.215745, 0.5019608, 1, 0, 1,
-0.6621875, 0.08381363, -0.9615418, 0.4941176, 1, 0, 1,
-0.6606892, -1.051759, -3.452805, 0.4862745, 1, 0, 1,
-0.6434419, 0.122043, -1.999768, 0.4823529, 1, 0, 1,
-0.6423765, -0.3613965, -3.20918, 0.4745098, 1, 0, 1,
-0.6369621, 0.880177, -0.3473038, 0.4705882, 1, 0, 1,
-0.6369074, 0.1350692, -0.3344298, 0.4627451, 1, 0, 1,
-0.6359093, 0.02206184, -1.509601, 0.4588235, 1, 0, 1,
-0.634789, -0.6441025, -4.049963, 0.4509804, 1, 0, 1,
-0.6310196, 0.6821096, 0.2539841, 0.4470588, 1, 0, 1,
-0.6301122, 1.169057, -0.8424764, 0.4392157, 1, 0, 1,
-0.6291285, 0.5565362, -1.493819, 0.4352941, 1, 0, 1,
-0.6288206, 0.2782561, -0.3559557, 0.427451, 1, 0, 1,
-0.628247, -1.573967, -3.685547, 0.4235294, 1, 0, 1,
-0.6279739, -0.543379, -1.868195, 0.4156863, 1, 0, 1,
-0.6257539, -0.6360741, -3.138816, 0.4117647, 1, 0, 1,
-0.6218001, 0.2785378, 0.6048458, 0.4039216, 1, 0, 1,
-0.6215795, 0.9551202, -1.910099, 0.3960784, 1, 0, 1,
-0.6191045, 0.7038043, -0.9008544, 0.3921569, 1, 0, 1,
-0.617465, -0.1888113, -2.122662, 0.3843137, 1, 0, 1,
-0.6167586, 1.054866, -1.502215, 0.3803922, 1, 0, 1,
-0.6163147, -0.07295993, -0.4368668, 0.372549, 1, 0, 1,
-0.6097621, 0.6357719, -2.125216, 0.3686275, 1, 0, 1,
-0.6076112, -0.9818198, -1.863324, 0.3607843, 1, 0, 1,
-0.6073263, 0.491308, -0.6551341, 0.3568628, 1, 0, 1,
-0.5954682, -1.510521, -3.841085, 0.3490196, 1, 0, 1,
-0.5949945, 1.040621, -2.269961, 0.345098, 1, 0, 1,
-0.5928982, -0.8796232, -3.642072, 0.3372549, 1, 0, 1,
-0.5905915, -0.5509944, -2.294938, 0.3333333, 1, 0, 1,
-0.5902848, 2.778717, 1.536751, 0.3254902, 1, 0, 1,
-0.5864868, -0.7768039, -3.267219, 0.3215686, 1, 0, 1,
-0.5853752, -1.070339, -3.529707, 0.3137255, 1, 0, 1,
-0.5821599, 0.6130519, -0.1248595, 0.3098039, 1, 0, 1,
-0.5815415, -0.4806439, -1.891676, 0.3019608, 1, 0, 1,
-0.5809538, -0.5587177, -1.379649, 0.2941177, 1, 0, 1,
-0.5804229, -1.375585, -3.621558, 0.2901961, 1, 0, 1,
-0.5795471, 1.41145, 0.1909299, 0.282353, 1, 0, 1,
-0.577378, 0.5300809, -2.160941, 0.2784314, 1, 0, 1,
-0.5754373, 1.229805, -0.01706389, 0.2705882, 1, 0, 1,
-0.5731955, 1.060244, 0.6797579, 0.2666667, 1, 0, 1,
-0.571798, 0.05819153, -0.1773615, 0.2588235, 1, 0, 1,
-0.5655059, 2.452715, -0.3508017, 0.254902, 1, 0, 1,
-0.56069, -0.3785342, -3.024617, 0.2470588, 1, 0, 1,
-0.5596548, -0.8605184, -3.511117, 0.2431373, 1, 0, 1,
-0.5593554, -1.828622, -2.259681, 0.2352941, 1, 0, 1,
-0.5578769, -1.26535, -1.605982, 0.2313726, 1, 0, 1,
-0.556327, 2.053705, 0.2171542, 0.2235294, 1, 0, 1,
-0.555435, -0.5775775, -0.557515, 0.2196078, 1, 0, 1,
-0.5535218, 0.5465254, 0.01886467, 0.2117647, 1, 0, 1,
-0.5491396, -1.055682, -3.296355, 0.2078431, 1, 0, 1,
-0.5446876, 0.04256149, -1.003243, 0.2, 1, 0, 1,
-0.5425298, -1.073704, -2.249987, 0.1921569, 1, 0, 1,
-0.5418584, 0.5834641, 0.7318394, 0.1882353, 1, 0, 1,
-0.5413705, -0.5972328, -2.508782, 0.1803922, 1, 0, 1,
-0.5409546, -0.0363468, -2.198922, 0.1764706, 1, 0, 1,
-0.5384079, -1.680622, -0.9924214, 0.1686275, 1, 0, 1,
-0.5369205, 1.394826, 0.5865661, 0.1647059, 1, 0, 1,
-0.5366209, 0.2901981, 0.2595478, 0.1568628, 1, 0, 1,
-0.5350474, -0.6315657, -2.480932, 0.1529412, 1, 0, 1,
-0.5310264, -0.9660463, -2.587233, 0.145098, 1, 0, 1,
-0.5299614, -0.3256257, -2.257631, 0.1411765, 1, 0, 1,
-0.5233374, -1.862523, -3.701168, 0.1333333, 1, 0, 1,
-0.5228838, -2.064306, -2.958553, 0.1294118, 1, 0, 1,
-0.5219279, 0.8418109, -1.361761, 0.1215686, 1, 0, 1,
-0.5207996, -2.700134, -2.193419, 0.1176471, 1, 0, 1,
-0.5171362, -0.3964322, -2.772899, 0.1098039, 1, 0, 1,
-0.5120977, 0.2647729, -0.8359525, 0.1058824, 1, 0, 1,
-0.5065693, 0.1874451, -1.186973, 0.09803922, 1, 0, 1,
-0.5042345, -0.7684212, -2.892709, 0.09019608, 1, 0, 1,
-0.4974434, 0.939884, 0.04216714, 0.08627451, 1, 0, 1,
-0.4961918, 0.2275742, 0.5566558, 0.07843138, 1, 0, 1,
-0.4946222, 0.5280858, -1.459758, 0.07450981, 1, 0, 1,
-0.4942991, -0.8718351, -3.374949, 0.06666667, 1, 0, 1,
-0.4936754, 1.51489, -1.542683, 0.0627451, 1, 0, 1,
-0.4892598, -0.2244735, -1.780808, 0.05490196, 1, 0, 1,
-0.4861036, 0.2708004, -0.08955818, 0.05098039, 1, 0, 1,
-0.4854765, 1.391631, 0.635834, 0.04313726, 1, 0, 1,
-0.483097, 0.4851676, -0.6866005, 0.03921569, 1, 0, 1,
-0.482373, -1.121846, -3.36135, 0.03137255, 1, 0, 1,
-0.4818152, 0.2330825, -1.236768, 0.02745098, 1, 0, 1,
-0.4766303, 0.7164148, -2.066239, 0.01960784, 1, 0, 1,
-0.470027, -0.1634804, -3.245079, 0.01568628, 1, 0, 1,
-0.4670271, -0.5298218, -3.28095, 0.007843138, 1, 0, 1,
-0.462469, 1.526932, -1.727882, 0.003921569, 1, 0, 1,
-0.459355, 0.4639717, -1.134127, 0, 1, 0.003921569, 1,
-0.459264, -1.706833, -2.63168, 0, 1, 0.01176471, 1,
-0.4592143, -0.7274321, -3.19797, 0, 1, 0.01568628, 1,
-0.458763, 1.785405, -1.587081, 0, 1, 0.02352941, 1,
-0.4584782, -1.351259, -2.988595, 0, 1, 0.02745098, 1,
-0.4580868, 0.9651756, -0.6589478, 0, 1, 0.03529412, 1,
-0.4550179, 0.2389661, 0.3442916, 0, 1, 0.03921569, 1,
-0.4522834, 0.4578371, -3.002025, 0, 1, 0.04705882, 1,
-0.4490238, -0.7029064, -3.06126, 0, 1, 0.05098039, 1,
-0.4461775, 0.3226086, -1.885495, 0, 1, 0.05882353, 1,
-0.4420559, 0.1562778, -1.951673, 0, 1, 0.0627451, 1,
-0.4362171, 0.4185339, -1.578722, 0, 1, 0.07058824, 1,
-0.4349017, 0.9641923, -2.130914, 0, 1, 0.07450981, 1,
-0.4326017, 1.53403, 0.2879775, 0, 1, 0.08235294, 1,
-0.4263044, -0.7471955, -3.832805, 0, 1, 0.08627451, 1,
-0.4256406, 1.199976, 0.005919732, 0, 1, 0.09411765, 1,
-0.4247952, -0.4453438, -0.5041668, 0, 1, 0.1019608, 1,
-0.4237933, 0.6052423, -0.5049638, 0, 1, 0.1058824, 1,
-0.4236306, 0.1478005, -0.1839523, 0, 1, 0.1137255, 1,
-0.4216419, -0.09134044, -2.433364, 0, 1, 0.1176471, 1,
-0.4145911, -0.3164115, -4.050274, 0, 1, 0.1254902, 1,
-0.4130655, 0.01223144, -2.676526, 0, 1, 0.1294118, 1,
-0.4124171, 2.66627, 1.078506, 0, 1, 0.1372549, 1,
-0.4113958, 0.6978413, 0.9892727, 0, 1, 0.1411765, 1,
-0.4112867, 0.07360831, -0.8776975, 0, 1, 0.1490196, 1,
-0.4105409, -0.2245014, -2.141167, 0, 1, 0.1529412, 1,
-0.410328, -0.7892173, -3.358124, 0, 1, 0.1607843, 1,
-0.4075441, 0.7378113, 0.2355556, 0, 1, 0.1647059, 1,
-0.3982025, 0.8000224, -2.754725, 0, 1, 0.172549, 1,
-0.3973169, 0.03145882, -0.49466, 0, 1, 0.1764706, 1,
-0.3971548, -0.1773417, -3.741416, 0, 1, 0.1843137, 1,
-0.3902138, -0.7584082, -3.582231, 0, 1, 0.1882353, 1,
-0.3840949, 0.6892121, -4.024911, 0, 1, 0.1960784, 1,
-0.3838274, 1.535947, 0.1915661, 0, 1, 0.2039216, 1,
-0.3833949, -0.6612913, -3.857283, 0, 1, 0.2078431, 1,
-0.3807957, 0.2545207, -0.6403283, 0, 1, 0.2156863, 1,
-0.3790704, -1.354104, -4.903963, 0, 1, 0.2196078, 1,
-0.378617, 0.2357532, 0.5283515, 0, 1, 0.227451, 1,
-0.377682, 0.4805781, -0.6781331, 0, 1, 0.2313726, 1,
-0.3755153, 0.3815988, -1.260586, 0, 1, 0.2392157, 1,
-0.3729022, 0.06487527, -4.14498, 0, 1, 0.2431373, 1,
-0.3715363, 0.8894411, -1.608726, 0, 1, 0.2509804, 1,
-0.3673996, -0.1490077, -2.083353, 0, 1, 0.254902, 1,
-0.3643075, -1.043552, -2.534924, 0, 1, 0.2627451, 1,
-0.3633766, -1.279362, -2.56184, 0, 1, 0.2666667, 1,
-0.3628488, 0.2790873, -1.815784, 0, 1, 0.2745098, 1,
-0.3624157, 1.136195, -0.04528615, 0, 1, 0.2784314, 1,
-0.3619327, 0.7458352, 0.7281006, 0, 1, 0.2862745, 1,
-0.3595316, -1.386515, -2.845132, 0, 1, 0.2901961, 1,
-0.3582554, -0.03842915, -3.566354, 0, 1, 0.2980392, 1,
-0.357756, 0.2684298, -0.5319343, 0, 1, 0.3058824, 1,
-0.3500569, 0.0237967, -2.266998, 0, 1, 0.3098039, 1,
-0.3500258, 3.06623, 0.6223603, 0, 1, 0.3176471, 1,
-0.346625, 0.5199262, 0.2582347, 0, 1, 0.3215686, 1,
-0.3440545, 0.780145, -0.1911763, 0, 1, 0.3294118, 1,
-0.3355578, 1.145613, -1.104695, 0, 1, 0.3333333, 1,
-0.3335791, 0.2472304, -0.5561182, 0, 1, 0.3411765, 1,
-0.3293531, -0.3742761, -2.511602, 0, 1, 0.345098, 1,
-0.3285081, -1.589225, -2.9348, 0, 1, 0.3529412, 1,
-0.3282408, 1.073832, -0.7066617, 0, 1, 0.3568628, 1,
-0.3265642, -0.5275369, -3.950201, 0, 1, 0.3647059, 1,
-0.3256392, -0.2013263, -2.641757, 0, 1, 0.3686275, 1,
-0.3222524, 1.299996, -0.2191624, 0, 1, 0.3764706, 1,
-0.3152147, 0.5931573, 1.18986, 0, 1, 0.3803922, 1,
-0.3104164, 1.516699, -1.599706, 0, 1, 0.3882353, 1,
-0.3011878, 0.3301542, 0.369946, 0, 1, 0.3921569, 1,
-0.2987068, -2.212241, -1.349804, 0, 1, 0.4, 1,
-0.295919, 2.253786, 0.5734851, 0, 1, 0.4078431, 1,
-0.2954119, -0.938218, -2.140604, 0, 1, 0.4117647, 1,
-0.2917216, -0.02717151, -1.366098, 0, 1, 0.4196078, 1,
-0.2906726, -0.6960417, -2.670452, 0, 1, 0.4235294, 1,
-0.2876472, 0.060594, 0.411201, 0, 1, 0.4313726, 1,
-0.2862951, -0.2267997, -3.408966, 0, 1, 0.4352941, 1,
-0.2849975, -0.2416892, -1.156804, 0, 1, 0.4431373, 1,
-0.2815651, 0.1850574, -1.604648, 0, 1, 0.4470588, 1,
-0.2785324, -0.3026933, -2.842492, 0, 1, 0.454902, 1,
-0.2775741, -1.546103, -3.16979, 0, 1, 0.4588235, 1,
-0.2769845, 0.152653, 0.6574368, 0, 1, 0.4666667, 1,
-0.2766861, 2.183127, -0.3519656, 0, 1, 0.4705882, 1,
-0.2719532, 1.231246, 0.6296366, 0, 1, 0.4784314, 1,
-0.2671901, 1.130146, -1.656141, 0, 1, 0.4823529, 1,
-0.2564102, -0.712891, -1.097898, 0, 1, 0.4901961, 1,
-0.2499745, -0.1108983, -2.004643, 0, 1, 0.4941176, 1,
-0.2475941, -0.8281664, -0.651455, 0, 1, 0.5019608, 1,
-0.2391812, -0.2165312, -2.87161, 0, 1, 0.509804, 1,
-0.2329933, -0.9318535, -3.684884, 0, 1, 0.5137255, 1,
-0.2311368, 0.7703318, 0.4304527, 0, 1, 0.5215687, 1,
-0.2273248, 1.314348, -1.258411, 0, 1, 0.5254902, 1,
-0.2236715, 0.6892317, 0.000686095, 0, 1, 0.5333334, 1,
-0.2215814, 2.225289, -0.291973, 0, 1, 0.5372549, 1,
-0.2209992, 0.7485605, 0.1619122, 0, 1, 0.5450981, 1,
-0.2169205, -0.00991324, -2.503164, 0, 1, 0.5490196, 1,
-0.2118003, 0.7771679, -0.1545635, 0, 1, 0.5568628, 1,
-0.2107182, 1.894831, -1.073255, 0, 1, 0.5607843, 1,
-0.2033845, 0.1581023, -0.7085919, 0, 1, 0.5686275, 1,
-0.1982285, 1.102276, -2.645358, 0, 1, 0.572549, 1,
-0.1962102, -0.6240199, -1.269155, 0, 1, 0.5803922, 1,
-0.1939471, 2.056434, 0.7923197, 0, 1, 0.5843138, 1,
-0.1933688, -0.2235244, -2.145832, 0, 1, 0.5921569, 1,
-0.1923868, -0.7353508, -5.28971, 0, 1, 0.5960785, 1,
-0.1923602, 1.188111, -0.4512639, 0, 1, 0.6039216, 1,
-0.1922584, -0.4522372, -1.958629, 0, 1, 0.6117647, 1,
-0.1896072, -0.0606779, -4.427393, 0, 1, 0.6156863, 1,
-0.1863949, -1.042241, -2.53581, 0, 1, 0.6235294, 1,
-0.1818773, 1.099687, -1.344123, 0, 1, 0.627451, 1,
-0.179942, -0.4941098, -2.443158, 0, 1, 0.6352941, 1,
-0.1792418, -1.243745, -3.583434, 0, 1, 0.6392157, 1,
-0.1781517, -0.7503051, -2.574773, 0, 1, 0.6470588, 1,
-0.1745851, -0.5670946, -4.500226, 0, 1, 0.6509804, 1,
-0.1723737, 0.1344873, -0.2865885, 0, 1, 0.6588235, 1,
-0.1685811, -0.9780122, -1.877008, 0, 1, 0.6627451, 1,
-0.1680038, -0.7322317, -2.215312, 0, 1, 0.6705883, 1,
-0.1671976, 1.25518, 0.02544213, 0, 1, 0.6745098, 1,
-0.164523, -0.2734412, -1.644972, 0, 1, 0.682353, 1,
-0.163607, -0.5153247, -2.991779, 0, 1, 0.6862745, 1,
-0.1629807, -0.9337531, -1.950163, 0, 1, 0.6941177, 1,
-0.1626824, 0.6097049, -0.1672679, 0, 1, 0.7019608, 1,
-0.1613998, -0.5325631, -2.100651, 0, 1, 0.7058824, 1,
-0.1591095, -1.052129, -4.273706, 0, 1, 0.7137255, 1,
-0.1568175, -0.2873738, -3.729075, 0, 1, 0.7176471, 1,
-0.1536138, 0.5913934, -0.3243649, 0, 1, 0.7254902, 1,
-0.1511777, 0.7102017, -1.664198, 0, 1, 0.7294118, 1,
-0.1483337, -0.6673267, -2.382818, 0, 1, 0.7372549, 1,
-0.1473532, 0.4914889, 0.09801251, 0, 1, 0.7411765, 1,
-0.1470786, 0.6701356, -1.593275, 0, 1, 0.7490196, 1,
-0.145887, -0.3989243, -1.597084, 0, 1, 0.7529412, 1,
-0.143181, 1.132897, -0.3366897, 0, 1, 0.7607843, 1,
-0.1409253, -0.7132218, -2.89312, 0, 1, 0.7647059, 1,
-0.1283439, -0.4148082, -3.25408, 0, 1, 0.772549, 1,
-0.1228617, 0.9964426, 1.301854, 0, 1, 0.7764706, 1,
-0.1223406, -0.6440806, -3.746477, 0, 1, 0.7843137, 1,
-0.1196193, -0.7382324, -2.645176, 0, 1, 0.7882353, 1,
-0.1098232, -1.048036, -3.830199, 0, 1, 0.7960784, 1,
-0.1077658, -0.5195469, -2.975164, 0, 1, 0.8039216, 1,
-0.1037573, -0.6768675, -2.741307, 0, 1, 0.8078431, 1,
-0.1028974, 0.6368589, -0.503475, 0, 1, 0.8156863, 1,
-0.100727, -0.2177396, -2.282375, 0, 1, 0.8196079, 1,
-0.0993316, 0.836081, 1.169071, 0, 1, 0.827451, 1,
-0.09918322, 0.142637, -1.396775, 0, 1, 0.8313726, 1,
-0.09455762, -0.5981494, -2.068014, 0, 1, 0.8392157, 1,
-0.09360893, 0.8339697, -0.5724643, 0, 1, 0.8431373, 1,
-0.09041697, 0.4061424, 0.9768258, 0, 1, 0.8509804, 1,
-0.09023049, 0.2085895, -0.688617, 0, 1, 0.854902, 1,
-0.08779552, 0.3540691, -1.09873, 0, 1, 0.8627451, 1,
-0.0877106, 1.30804, -1.505459, 0, 1, 0.8666667, 1,
-0.0856915, 0.2589097, 1.543011, 0, 1, 0.8745098, 1,
-0.0833233, 0.04122823, -0.2637731, 0, 1, 0.8784314, 1,
-0.08243029, -1.709892, -2.126134, 0, 1, 0.8862745, 1,
-0.07604685, 0.3170949, 1.370508, 0, 1, 0.8901961, 1,
-0.07400905, -1.637187, -4.449223, 0, 1, 0.8980392, 1,
-0.0708035, -1.030666, -2.641228, 0, 1, 0.9058824, 1,
-0.0703341, 0.8451828, -1.125586, 0, 1, 0.9098039, 1,
-0.06952142, -0.9661326, -2.416036, 0, 1, 0.9176471, 1,
-0.06930254, -0.4558835, -5.565047, 0, 1, 0.9215686, 1,
-0.06838741, -0.3557189, -1.171323, 0, 1, 0.9294118, 1,
-0.06659321, 1.841048, 0.3055728, 0, 1, 0.9333333, 1,
-0.06141137, 0.8326148, 1.7459, 0, 1, 0.9411765, 1,
-0.06125302, 2.469088, -1.337189, 0, 1, 0.945098, 1,
-0.05832978, 1.116932, -0.7333132, 0, 1, 0.9529412, 1,
-0.05340011, 0.577928, 0.4623637, 0, 1, 0.9568627, 1,
-0.05321229, -0.1723373, -1.711617, 0, 1, 0.9647059, 1,
-0.04316646, -0.3153961, -1.588846, 0, 1, 0.9686275, 1,
-0.03803336, -0.6771517, -2.248853, 0, 1, 0.9764706, 1,
-0.03780754, -0.2651775, -2.337385, 0, 1, 0.9803922, 1,
-0.03468838, -1.984448, -3.208034, 0, 1, 0.9882353, 1,
-0.03296156, 1.148962, -0.1533471, 0, 1, 0.9921569, 1,
-0.03021132, -1.071804, -4.483586, 0, 1, 1, 1,
-0.02877387, -0.9821194, -4.040053, 0, 0.9921569, 1, 1,
-0.02586313, -0.6219529, -2.818719, 0, 0.9882353, 1, 1,
-0.02199339, 0.3290093, -0.9597432, 0, 0.9803922, 1, 1,
-0.02009822, -1.143252, -3.653294, 0, 0.9764706, 1, 1,
-0.0195677, 0.4913652, 1.260172, 0, 0.9686275, 1, 1,
-0.01184972, 1.084763, 0.7909997, 0, 0.9647059, 1, 1,
-0.008949413, -0.04050357, -3.938577, 0, 0.9568627, 1, 1,
-0.008606891, -1.16476, -3.019261, 0, 0.9529412, 1, 1,
-0.00491271, 1.397359, -0.5097324, 0, 0.945098, 1, 1,
-0.002970728, -0.6130908, -3.406314, 0, 0.9411765, 1, 1,
-0.001839112, -0.6023068, -4.925431, 0, 0.9333333, 1, 1,
-0.0003698114, 0.03654193, -1.134067, 0, 0.9294118, 1, 1,
0.00120155, 0.3605372, -0.2026176, 0, 0.9215686, 1, 1,
0.00318916, -0.614878, 1.836861, 0, 0.9176471, 1, 1,
0.008642841, -0.06874797, 3.663133, 0, 0.9098039, 1, 1,
0.01076051, -0.5577955, 3.639995, 0, 0.9058824, 1, 1,
0.01085766, 2.163924, 1.000488, 0, 0.8980392, 1, 1,
0.01150041, -0.3433878, 2.783447, 0, 0.8901961, 1, 1,
0.01362799, 1.378245, 0.4035779, 0, 0.8862745, 1, 1,
0.0142798, 0.0628097, 9.419115e-05, 0, 0.8784314, 1, 1,
0.02134179, -0.02484181, 4.345842, 0, 0.8745098, 1, 1,
0.02240916, 1.22063, 0.001268927, 0, 0.8666667, 1, 1,
0.0256437, 1.458966, -0.002905335, 0, 0.8627451, 1, 1,
0.0275468, 1.24446, 0.5937545, 0, 0.854902, 1, 1,
0.02755942, -0.02982184, 1.003236, 0, 0.8509804, 1, 1,
0.0283038, -0.8934028, 4.72366, 0, 0.8431373, 1, 1,
0.03058221, 0.7350526, 0.7323009, 0, 0.8392157, 1, 1,
0.0328575, 0.3267913, -0.7178356, 0, 0.8313726, 1, 1,
0.04241355, 0.2943685, 0.7511483, 0, 0.827451, 1, 1,
0.04457032, -0.08675651, 2.196726, 0, 0.8196079, 1, 1,
0.05356365, -0.8513659, 1.487961, 0, 0.8156863, 1, 1,
0.06192858, 1.498948, 1.012399, 0, 0.8078431, 1, 1,
0.06379375, -0.3862246, 2.86655, 0, 0.8039216, 1, 1,
0.06604094, 0.8958307, -0.3043914, 0, 0.7960784, 1, 1,
0.07235833, 0.5151325, -0.7198096, 0, 0.7882353, 1, 1,
0.07341252, 0.2102612, -0.8233632, 0, 0.7843137, 1, 1,
0.0740158, -0.2601172, 2.425953, 0, 0.7764706, 1, 1,
0.07403688, -1.1475, 3.269432, 0, 0.772549, 1, 1,
0.07414214, 1.387572, 1.378094, 0, 0.7647059, 1, 1,
0.08064768, -0.3901513, 3.916855, 0, 0.7607843, 1, 1,
0.08272208, 0.8025759, 0.7563245, 0, 0.7529412, 1, 1,
0.08511308, -1.328494, 4.008474, 0, 0.7490196, 1, 1,
0.08522732, -0.06036453, 2.358995, 0, 0.7411765, 1, 1,
0.08599325, 2.510599, -0.1398386, 0, 0.7372549, 1, 1,
0.08847856, 0.763473, -0.2374894, 0, 0.7294118, 1, 1,
0.09046718, -0.1986297, 2.645319, 0, 0.7254902, 1, 1,
0.0951553, 0.08214515, 0.4729082, 0, 0.7176471, 1, 1,
0.1005324, -0.9191706, 2.364716, 0, 0.7137255, 1, 1,
0.1127319, 0.1632806, 1.543875, 0, 0.7058824, 1, 1,
0.1195885, 1.177889, -0.5872625, 0, 0.6980392, 1, 1,
0.121422, 0.3980186, 0.4413811, 0, 0.6941177, 1, 1,
0.1226092, -1.244501, 1.22642, 0, 0.6862745, 1, 1,
0.1321157, 0.4520918, 0.8180529, 0, 0.682353, 1, 1,
0.1333035, 0.6228967, -0.5367538, 0, 0.6745098, 1, 1,
0.1435977, 1.149874, -0.7705049, 0, 0.6705883, 1, 1,
0.1438431, 0.8020142, 0.1604293, 0, 0.6627451, 1, 1,
0.1442946, 0.9354233, 1.16809, 0, 0.6588235, 1, 1,
0.1452194, -0.6494765, 3.42003, 0, 0.6509804, 1, 1,
0.1463329, 1.696926, 1.132043, 0, 0.6470588, 1, 1,
0.1564879, -2.552994, 3.80057, 0, 0.6392157, 1, 1,
0.1608968, 0.200513, 1.42516, 0, 0.6352941, 1, 1,
0.1638865, -2.228736, 3.802738, 0, 0.627451, 1, 1,
0.1684714, -1.804763, 2.907133, 0, 0.6235294, 1, 1,
0.1701242, 0.3466659, -0.4577201, 0, 0.6156863, 1, 1,
0.1717046, 0.2437241, -0.2212055, 0, 0.6117647, 1, 1,
0.1722489, 2.90585, 1.531108, 0, 0.6039216, 1, 1,
0.1741878, -0.7629494, 2.342888, 0, 0.5960785, 1, 1,
0.1765055, -1.083892, 4.098954, 0, 0.5921569, 1, 1,
0.1766073, 0.7715263, -1.352635, 0, 0.5843138, 1, 1,
0.1816037, 0.9146424, 1.100472, 0, 0.5803922, 1, 1,
0.1834235, -0.5676275, 1.987644, 0, 0.572549, 1, 1,
0.1852277, 0.4911846, -1.212565, 0, 0.5686275, 1, 1,
0.1884158, -0.9221014, 2.05589, 0, 0.5607843, 1, 1,
0.1886271, 1.809805, 0.3736291, 0, 0.5568628, 1, 1,
0.1887828, -0.9453723, 2.948121, 0, 0.5490196, 1, 1,
0.189682, -0.6062943, 2.867294, 0, 0.5450981, 1, 1,
0.189922, -2.31079, 3.603791, 0, 0.5372549, 1, 1,
0.1938285, 0.7344109, -0.06193423, 0, 0.5333334, 1, 1,
0.194929, 0.2602276, 1.120569, 0, 0.5254902, 1, 1,
0.2039971, 0.1355657, -0.1769822, 0, 0.5215687, 1, 1,
0.2052581, 0.03178572, 1.029414, 0, 0.5137255, 1, 1,
0.2055478, 0.8922679, 1.592401, 0, 0.509804, 1, 1,
0.2110536, 0.4355823, 1.109004, 0, 0.5019608, 1, 1,
0.2165625, 1.430143, -0.7474479, 0, 0.4941176, 1, 1,
0.2220224, -0.01564918, 2.033115, 0, 0.4901961, 1, 1,
0.2273434, 0.5540544, 0.4526333, 0, 0.4823529, 1, 1,
0.2287088, 2.292486, -0.1772798, 0, 0.4784314, 1, 1,
0.2318276, -2.518613, 3.734508, 0, 0.4705882, 1, 1,
0.2357456, -0.1799172, 0.4971553, 0, 0.4666667, 1, 1,
0.2366007, -1.915379, 2.080041, 0, 0.4588235, 1, 1,
0.2386181, 0.1219698, 0.6418151, 0, 0.454902, 1, 1,
0.2415369, 0.2152567, -0.02594746, 0, 0.4470588, 1, 1,
0.2425777, -0.7774219, 2.917331, 0, 0.4431373, 1, 1,
0.2442338, -1.141864, 2.398176, 0, 0.4352941, 1, 1,
0.2451858, 0.03522104, 2.940943, 0, 0.4313726, 1, 1,
0.2471564, 1.383869, 1.172614, 0, 0.4235294, 1, 1,
0.2508785, -0.3737987, 3.107956, 0, 0.4196078, 1, 1,
0.2546278, 0.2266356, 1.431999, 0, 0.4117647, 1, 1,
0.2548614, 0.01944122, -0.5398229, 0, 0.4078431, 1, 1,
0.2559532, 0.03722164, -0.2627954, 0, 0.4, 1, 1,
0.260735, -0.2497225, 3.015953, 0, 0.3921569, 1, 1,
0.2656944, 0.3128223, 0.968906, 0, 0.3882353, 1, 1,
0.2663272, -0.6105174, 3.393795, 0, 0.3803922, 1, 1,
0.2761876, -0.7578239, 1.714106, 0, 0.3764706, 1, 1,
0.2857666, -0.121672, 1.497946, 0, 0.3686275, 1, 1,
0.2882104, -0.2723207, 3.74098, 0, 0.3647059, 1, 1,
0.2967668, -0.9666885, 2.352743, 0, 0.3568628, 1, 1,
0.2983901, 0.4838033, 0.2049887, 0, 0.3529412, 1, 1,
0.3001502, 0.4062418, 1.483057, 0, 0.345098, 1, 1,
0.3041221, 0.4032508, 0.6139109, 0, 0.3411765, 1, 1,
0.3046972, 0.9107226, 0.6311131, 0, 0.3333333, 1, 1,
0.306407, -0.1871015, 3.772185, 0, 0.3294118, 1, 1,
0.3088712, 0.5567017, 0.5365868, 0, 0.3215686, 1, 1,
0.3123158, 0.6613283, 0.07362279, 0, 0.3176471, 1, 1,
0.3175316, -0.1903201, 3.56607, 0, 0.3098039, 1, 1,
0.3179907, 0.6873518, 0.2788973, 0, 0.3058824, 1, 1,
0.3183257, -1.540134, 4.683095, 0, 0.2980392, 1, 1,
0.3207015, 0.6457945, 0.04667143, 0, 0.2901961, 1, 1,
0.3289165, 1.260493, 0.1423609, 0, 0.2862745, 1, 1,
0.3296659, 1.344609, -1.066299, 0, 0.2784314, 1, 1,
0.3296726, -1.606925, 1.669399, 0, 0.2745098, 1, 1,
0.3298333, -1.537802, 1.828843, 0, 0.2666667, 1, 1,
0.3315575, -1.135319, 3.782218, 0, 0.2627451, 1, 1,
0.3327988, 0.123261, 0.2161827, 0, 0.254902, 1, 1,
0.3347682, 0.6523518, 0.6878645, 0, 0.2509804, 1, 1,
0.3374859, -1.467892, 7.44233, 0, 0.2431373, 1, 1,
0.3376884, -1.647437, 3.595415, 0, 0.2392157, 1, 1,
0.3395973, 0.2317493, 2.523153, 0, 0.2313726, 1, 1,
0.3546191, 0.5765316, -0.5374919, 0, 0.227451, 1, 1,
0.3560764, -0.5265142, 3.627393, 0, 0.2196078, 1, 1,
0.3586354, -1.011336, 1.30594, 0, 0.2156863, 1, 1,
0.3591484, 0.6341801, 0.8758649, 0, 0.2078431, 1, 1,
0.3626242, 0.5631765, -1.622826, 0, 0.2039216, 1, 1,
0.3628966, 0.7374952, 1.868221, 0, 0.1960784, 1, 1,
0.3654744, -0.01082018, 2.379811, 0, 0.1882353, 1, 1,
0.3680338, 0.05582664, 3.54336, 0, 0.1843137, 1, 1,
0.3697733, 0.1062183, -0.3751155, 0, 0.1764706, 1, 1,
0.3706063, -0.9012749, 2.565274, 0, 0.172549, 1, 1,
0.3723666, 1.017886, 1.848849, 0, 0.1647059, 1, 1,
0.3788847, 0.2398565, 1.792524, 0, 0.1607843, 1, 1,
0.3793062, -0.8095533, 1.912648, 0, 0.1529412, 1, 1,
0.3794404, 0.215253, 0.5507612, 0, 0.1490196, 1, 1,
0.3838996, 0.1705934, 2.009698, 0, 0.1411765, 1, 1,
0.3911142, -1.21526, 3.440913, 0, 0.1372549, 1, 1,
0.3916878, -0.2324533, 0.6810011, 0, 0.1294118, 1, 1,
0.3920553, -1.317289, 2.430122, 0, 0.1254902, 1, 1,
0.392449, -2.839547, 2.046804, 0, 0.1176471, 1, 1,
0.393729, 1.033449, 0.4304709, 0, 0.1137255, 1, 1,
0.394622, -1.896421, 1.583712, 0, 0.1058824, 1, 1,
0.4030344, 0.5166805, 0.1755823, 0, 0.09803922, 1, 1,
0.4068988, 0.3873539, 0.7250414, 0, 0.09411765, 1, 1,
0.4074129, 1.314675, -0.1633578, 0, 0.08627451, 1, 1,
0.4078886, -0.3884694, 1.707132, 0, 0.08235294, 1, 1,
0.4163162, 2.525829, -0.5819951, 0, 0.07450981, 1, 1,
0.4206433, 0.3754218, 0.3285986, 0, 0.07058824, 1, 1,
0.4251066, 1.1982, -0.2543328, 0, 0.0627451, 1, 1,
0.4279814, 0.1551277, 1.71497, 0, 0.05882353, 1, 1,
0.4284593, 0.6812224, 2.427232, 0, 0.05098039, 1, 1,
0.4284637, -2.235315, 2.97306, 0, 0.04705882, 1, 1,
0.4293237, 1.171943, 1.045539, 0, 0.03921569, 1, 1,
0.4316633, 0.09748427, 1.399405, 0, 0.03529412, 1, 1,
0.4332932, -0.732446, 1.208138, 0, 0.02745098, 1, 1,
0.4333566, -1.338656, 1.160526, 0, 0.02352941, 1, 1,
0.4427223, -0.232762, 1.416537, 0, 0.01568628, 1, 1,
0.4429652, 0.7142279, 1.235417, 0, 0.01176471, 1, 1,
0.4454568, 2.020425, -0.6279895, 0, 0.003921569, 1, 1,
0.4455779, -0.2383474, 0.9092121, 0.003921569, 0, 1, 1,
0.4573482, 0.4713506, 0.2523556, 0.007843138, 0, 1, 1,
0.4583052, -0.551568, 2.824647, 0.01568628, 0, 1, 1,
0.4598264, -0.5929896, 2.590124, 0.01960784, 0, 1, 1,
0.461917, -0.3771609, 2.185307, 0.02745098, 0, 1, 1,
0.4689554, -0.5806855, 3.83242, 0.03137255, 0, 1, 1,
0.4716069, 0.1425731, 1.135874, 0.03921569, 0, 1, 1,
0.476882, 0.08676036, 3.067122, 0.04313726, 0, 1, 1,
0.4781276, 1.181858, -1.404019, 0.05098039, 0, 1, 1,
0.4781513, 1.371222, -1.165867, 0.05490196, 0, 1, 1,
0.4809943, -3.160232, 2.271119, 0.0627451, 0, 1, 1,
0.4828506, -0.6119888, 3.108812, 0.06666667, 0, 1, 1,
0.4871275, -1.219197, 1.610799, 0.07450981, 0, 1, 1,
0.4898594, 1.270404, -2.030013, 0.07843138, 0, 1, 1,
0.4959755, -0.2944566, 0.893691, 0.08627451, 0, 1, 1,
0.4968256, 1.025807, 0.5812775, 0.09019608, 0, 1, 1,
0.497826, 0.9015006, 0.1918081, 0.09803922, 0, 1, 1,
0.4988425, 0.3641624, -0.423194, 0.1058824, 0, 1, 1,
0.5068567, 0.09841184, 2.413738, 0.1098039, 0, 1, 1,
0.5091181, -0.4924215, 2.264918, 0.1176471, 0, 1, 1,
0.512527, 0.6324154, 0.3426429, 0.1215686, 0, 1, 1,
0.5126752, 0.1420833, 1.715097, 0.1294118, 0, 1, 1,
0.5150678, 0.139931, 1.099354, 0.1333333, 0, 1, 1,
0.5171013, 0.9743086, 1.13368, 0.1411765, 0, 1, 1,
0.5209812, 0.7970408, 0.9004887, 0.145098, 0, 1, 1,
0.5306067, 0.001516777, 2.733845, 0.1529412, 0, 1, 1,
0.5333891, -1.347737, 4.883878, 0.1568628, 0, 1, 1,
0.5370418, -0.8345078, 2.460909, 0.1647059, 0, 1, 1,
0.5379089, -1.052226, 2.860036, 0.1686275, 0, 1, 1,
0.5423015, 1.812447, -0.4075733, 0.1764706, 0, 1, 1,
0.543709, 0.1409478, 0.5498745, 0.1803922, 0, 1, 1,
0.5451715, 1.00085, -0.9281172, 0.1882353, 0, 1, 1,
0.547811, 0.3523352, -0.6354052, 0.1921569, 0, 1, 1,
0.5537049, -0.4019163, 1.762286, 0.2, 0, 1, 1,
0.5545616, -1.970826, 2.94289, 0.2078431, 0, 1, 1,
0.5637379, 1.000843, -0.6925593, 0.2117647, 0, 1, 1,
0.5653175, -0.5894145, 0.4139988, 0.2196078, 0, 1, 1,
0.5666286, -0.5682827, -0.3316498, 0.2235294, 0, 1, 1,
0.5680444, 1.069654, 1.920904, 0.2313726, 0, 1, 1,
0.5708857, -0.9113067, 2.163466, 0.2352941, 0, 1, 1,
0.5711854, 1.037335, 1.056595, 0.2431373, 0, 1, 1,
0.5757515, 1.194488, -0.08375125, 0.2470588, 0, 1, 1,
0.5770026, 0.6047123, 1.275214, 0.254902, 0, 1, 1,
0.5804887, 0.4568357, 0.8386021, 0.2588235, 0, 1, 1,
0.5832978, 1.055288, 1.248641, 0.2666667, 0, 1, 1,
0.584446, 1.205025, -0.02765477, 0.2705882, 0, 1, 1,
0.5873033, -0.5682355, 2.472442, 0.2784314, 0, 1, 1,
0.5901711, -0.415094, 1.269377, 0.282353, 0, 1, 1,
0.5930414, -0.7383239, 1.680392, 0.2901961, 0, 1, 1,
0.5950471, -0.6347045, 1.216037, 0.2941177, 0, 1, 1,
0.5958405, 2.017004, 0.6879984, 0.3019608, 0, 1, 1,
0.5976531, 1.271606, -0.1200927, 0.3098039, 0, 1, 1,
0.5998339, -0.5865569, 3.706524, 0.3137255, 0, 1, 1,
0.6004078, 0.4816889, 1.666947, 0.3215686, 0, 1, 1,
0.6021625, -1.48423, 1.653007, 0.3254902, 0, 1, 1,
0.6036465, -0.4344712, 1.348602, 0.3333333, 0, 1, 1,
0.6041467, 1.966741, 1.756729, 0.3372549, 0, 1, 1,
0.6059623, 0.8983771, 2.049261, 0.345098, 0, 1, 1,
0.611714, -0.01883701, 1.697276, 0.3490196, 0, 1, 1,
0.6118808, 0.3554583, 1.618759, 0.3568628, 0, 1, 1,
0.6129382, -0.8365131, 1.066635, 0.3607843, 0, 1, 1,
0.6131825, 1.293411, 1.310353, 0.3686275, 0, 1, 1,
0.6135526, -0.5502201, 2.781943, 0.372549, 0, 1, 1,
0.6170552, -0.2138437, 0.3144045, 0.3803922, 0, 1, 1,
0.6172761, -0.372455, 2.594131, 0.3843137, 0, 1, 1,
0.6197836, -0.1253374, 3.96849, 0.3921569, 0, 1, 1,
0.6225958, 0.9699908, -0.2326794, 0.3960784, 0, 1, 1,
0.6231866, -1.656138, 4.018957, 0.4039216, 0, 1, 1,
0.6278429, 0.338976, 1.005759, 0.4117647, 0, 1, 1,
0.6297624, -0.2356724, 2.10867, 0.4156863, 0, 1, 1,
0.630697, 0.2844293, 1.783302, 0.4235294, 0, 1, 1,
0.6337767, 0.5716557, 0.1654549, 0.427451, 0, 1, 1,
0.6346048, -0.07421856, 2.524775, 0.4352941, 0, 1, 1,
0.6359021, -1.060809, 1.132742, 0.4392157, 0, 1, 1,
0.6395096, -2.247242, 3.788688, 0.4470588, 0, 1, 1,
0.640902, -0.7690949, 1.872504, 0.4509804, 0, 1, 1,
0.6533992, 1.211883, 0.5154837, 0.4588235, 0, 1, 1,
0.6575062, -0.5795079, 1.887387, 0.4627451, 0, 1, 1,
0.662735, 0.6963973, -0.06991193, 0.4705882, 0, 1, 1,
0.6628041, 0.8996944, 2.545785, 0.4745098, 0, 1, 1,
0.6720836, 0.7322872, 3.102814, 0.4823529, 0, 1, 1,
0.6726204, 0.4113439, 1.800005, 0.4862745, 0, 1, 1,
0.6754977, -0.06965972, 1.918889, 0.4941176, 0, 1, 1,
0.6777749, -2.06329, 3.944149, 0.5019608, 0, 1, 1,
0.6868855, -0.2801149, 2.58056, 0.5058824, 0, 1, 1,
0.688317, 2.647609, 0.9323277, 0.5137255, 0, 1, 1,
0.6889869, -0.1822992, 0.3706935, 0.5176471, 0, 1, 1,
0.6934952, 0.1809328, 0.7311699, 0.5254902, 0, 1, 1,
0.6936693, 0.123999, 1.715269, 0.5294118, 0, 1, 1,
0.6940693, 1.629522, 0.1618728, 0.5372549, 0, 1, 1,
0.694319, 0.4012171, 0.2421896, 0.5411765, 0, 1, 1,
0.6970685, 1.938437, -1.626967, 0.5490196, 0, 1, 1,
0.6988631, 0.3807445, -1.515978, 0.5529412, 0, 1, 1,
0.6989519, -0.8531877, 2.799686, 0.5607843, 0, 1, 1,
0.7053781, 1.079321, 1.059372, 0.5647059, 0, 1, 1,
0.7075422, -0.3858923, 1.3245, 0.572549, 0, 1, 1,
0.7089972, 0.08502109, 1.328748, 0.5764706, 0, 1, 1,
0.710075, -0.5389782, 1.646469, 0.5843138, 0, 1, 1,
0.732374, -0.8547832, 3.743417, 0.5882353, 0, 1, 1,
0.7364162, 2.07733, 0.1872594, 0.5960785, 0, 1, 1,
0.7406539, -0.1137704, 1.068322, 0.6039216, 0, 1, 1,
0.7466114, 0.03857641, 1.109697, 0.6078432, 0, 1, 1,
0.7506526, 0.1820879, 1.844079, 0.6156863, 0, 1, 1,
0.7507931, 0.3391769, 1.814092, 0.6196079, 0, 1, 1,
0.751403, 1.41303, 0.8529103, 0.627451, 0, 1, 1,
0.7527205, 0.4125831, 2.515723, 0.6313726, 0, 1, 1,
0.7681919, 0.1060821, 0.6748121, 0.6392157, 0, 1, 1,
0.7782955, 0.2544833, 1.405148, 0.6431373, 0, 1, 1,
0.780644, 1.415733, 1.305516, 0.6509804, 0, 1, 1,
0.7813815, -0.1116652, 0.6756519, 0.654902, 0, 1, 1,
0.7869239, -1.120962, 2.304407, 0.6627451, 0, 1, 1,
0.7871727, -1.465428, 1.921895, 0.6666667, 0, 1, 1,
0.788491, -0.6924728, 1.622359, 0.6745098, 0, 1, 1,
0.791835, 1.610279, -0.1618209, 0.6784314, 0, 1, 1,
0.7930657, -0.8920522, 5.68471, 0.6862745, 0, 1, 1,
0.7953038, 1.195185, 0.01577811, 0.6901961, 0, 1, 1,
0.7983136, 0.814913, 1.664234, 0.6980392, 0, 1, 1,
0.8008436, 0.6799319, 0.5830362, 0.7058824, 0, 1, 1,
0.8023836, -0.3519823, 2.442636, 0.7098039, 0, 1, 1,
0.8093706, -0.02753889, 0.1043712, 0.7176471, 0, 1, 1,
0.8111124, -1.088699, 2.932121, 0.7215686, 0, 1, 1,
0.8118159, 0.5890005, 1.011498, 0.7294118, 0, 1, 1,
0.8124625, 0.1106776, -0.3714844, 0.7333333, 0, 1, 1,
0.8162447, -0.2903417, 1.053391, 0.7411765, 0, 1, 1,
0.8164518, -0.7121837, 2.478808, 0.7450981, 0, 1, 1,
0.8295607, 2.136456, 2.216484, 0.7529412, 0, 1, 1,
0.8461917, 0.7634398, 2.337714, 0.7568628, 0, 1, 1,
0.8478469, 0.6573939, 0.7776222, 0.7647059, 0, 1, 1,
0.8515369, -0.9870819, 3.326261, 0.7686275, 0, 1, 1,
0.8560702, -0.7244636, 1.840763, 0.7764706, 0, 1, 1,
0.8595542, -0.3450373, 2.632716, 0.7803922, 0, 1, 1,
0.8603555, 0.7638553, 0.01634347, 0.7882353, 0, 1, 1,
0.8628024, -0.3646027, 1.819734, 0.7921569, 0, 1, 1,
0.8636442, -1.952456, 3.375205, 0.8, 0, 1, 1,
0.8654339, -1.476402, 1.357897, 0.8078431, 0, 1, 1,
0.8701582, 2.762969, -0.6623853, 0.8117647, 0, 1, 1,
0.8718261, 2.091891, 0.5546771, 0.8196079, 0, 1, 1,
0.8811514, -0.2158112, 3.414327, 0.8235294, 0, 1, 1,
0.8831428, -0.5527832, 3.033397, 0.8313726, 0, 1, 1,
0.8869848, 0.5545666, 1.207286, 0.8352941, 0, 1, 1,
0.8877636, -1.633094, 2.506887, 0.8431373, 0, 1, 1,
0.8939099, -0.2773805, 1.32355, 0.8470588, 0, 1, 1,
0.9012842, 0.2560805, 1.900961, 0.854902, 0, 1, 1,
0.901531, 0.4908278, 0.4903117, 0.8588235, 0, 1, 1,
0.9019465, 0.2099936, 2.502144, 0.8666667, 0, 1, 1,
0.9087202, -0.0581249, 1.22838, 0.8705882, 0, 1, 1,
0.9114394, 0.6079738, 2.574506, 0.8784314, 0, 1, 1,
0.9115815, 0.08826368, -0.3818026, 0.8823529, 0, 1, 1,
0.9131169, 1.135675, -1.227055, 0.8901961, 0, 1, 1,
0.9233799, -1.085016, 1.00529, 0.8941177, 0, 1, 1,
0.9286668, -2.338573, 3.719682, 0.9019608, 0, 1, 1,
0.9288214, 0.8593413, 1.741521, 0.9098039, 0, 1, 1,
0.9305134, -1.033486, 1.822032, 0.9137255, 0, 1, 1,
0.9309428, 1.672195, -0.7657908, 0.9215686, 0, 1, 1,
0.9355975, -0.3775038, 2.098885, 0.9254902, 0, 1, 1,
0.9372752, -0.3946956, 2.950332, 0.9333333, 0, 1, 1,
0.9408114, -0.7712376, 3.254568, 0.9372549, 0, 1, 1,
0.9453056, -1.112679, 2.23545, 0.945098, 0, 1, 1,
0.9490211, 1.1293, 1.745272, 0.9490196, 0, 1, 1,
0.9564558, -0.1908374, 2.700468, 0.9568627, 0, 1, 1,
0.9612907, -0.7408775, 2.89454, 0.9607843, 0, 1, 1,
0.9692718, -0.8532357, 0.9389222, 0.9686275, 0, 1, 1,
0.9714026, -0.3527462, 2.764799, 0.972549, 0, 1, 1,
0.9715017, 0.9652548, 1.467564, 0.9803922, 0, 1, 1,
0.976935, 0.3020834, 1.400798, 0.9843137, 0, 1, 1,
0.9793574, -0.920108, 2.763936, 0.9921569, 0, 1, 1,
0.987152, -1.14658, 2.429903, 0.9960784, 0, 1, 1,
0.9902208, -0.3853666, 2.801401, 1, 0, 0.9960784, 1,
0.9930615, 0.05862701, 3.407083, 1, 0, 0.9882353, 1,
0.9983846, -1.365482, 2.896961, 1, 0, 0.9843137, 1,
1.002226, -0.2806796, 0.2938364, 1, 0, 0.9764706, 1,
1.01312, 0.3317105, 0.6248797, 1, 0, 0.972549, 1,
1.018622, 0.7625156, 1.195707, 1, 0, 0.9647059, 1,
1.020638, -1.072552, 1.988451, 1, 0, 0.9607843, 1,
1.025242, -2.002832, 1.423277, 1, 0, 0.9529412, 1,
1.033237, -1.796665, 2.061799, 1, 0, 0.9490196, 1,
1.03757, -1.082278, 3.763204, 1, 0, 0.9411765, 1,
1.043242, -0.3305285, 0.4257995, 1, 0, 0.9372549, 1,
1.04576, -1.745212, 1.481761, 1, 0, 0.9294118, 1,
1.048228, 2.80223, 1.217852, 1, 0, 0.9254902, 1,
1.052646, -0.5525903, 1.780625, 1, 0, 0.9176471, 1,
1.053419, 0.1329403, 3.885505, 1, 0, 0.9137255, 1,
1.057391, 3.120606, 0.7187877, 1, 0, 0.9058824, 1,
1.058883, 0.2521522, 0.4115485, 1, 0, 0.9019608, 1,
1.061263, -0.4173393, 2.105143, 1, 0, 0.8941177, 1,
1.063297, 1.663786, -0.3372907, 1, 0, 0.8862745, 1,
1.068941, 1.244278, 0.3921347, 1, 0, 0.8823529, 1,
1.087702, -0.4927633, 1.388978, 1, 0, 0.8745098, 1,
1.088638, -1.632917, 2.777799, 1, 0, 0.8705882, 1,
1.092956, -0.01412027, 1.640585, 1, 0, 0.8627451, 1,
1.093567, -1.115859, 3.19871, 1, 0, 0.8588235, 1,
1.095216, -0.01649816, 1.897494, 1, 0, 0.8509804, 1,
1.099491, 1.685843, -1.241135, 1, 0, 0.8470588, 1,
1.106075, -0.7051643, 3.81712, 1, 0, 0.8392157, 1,
1.106951, 1.134999, 0.3607021, 1, 0, 0.8352941, 1,
1.109431, 0.1763446, 3.844683, 1, 0, 0.827451, 1,
1.111746, 1.31739, 0.1194916, 1, 0, 0.8235294, 1,
1.114504, 0.3669255, 1.78588, 1, 0, 0.8156863, 1,
1.117219, -0.1302698, 1.095104, 1, 0, 0.8117647, 1,
1.118464, -0.3245219, 4.690267, 1, 0, 0.8039216, 1,
1.120297, 0.7132411, 0.1357405, 1, 0, 0.7960784, 1,
1.12215, 1.645571, 0.4425625, 1, 0, 0.7921569, 1,
1.12768, 0.4585793, 1.108311, 1, 0, 0.7843137, 1,
1.12795, 0.1972506, 0.3099229, 1, 0, 0.7803922, 1,
1.138727, 1.404956, 0.04084107, 1, 0, 0.772549, 1,
1.140449, -0.171696, 0.7266048, 1, 0, 0.7686275, 1,
1.141032, 1.248217, -0.2606991, 1, 0, 0.7607843, 1,
1.143353, 0.2461521, 1.466411, 1, 0, 0.7568628, 1,
1.145541, 2.03988, 0.3998344, 1, 0, 0.7490196, 1,
1.145968, 0.4884706, 1.044107, 1, 0, 0.7450981, 1,
1.151438, -1.177077, 2.391671, 1, 0, 0.7372549, 1,
1.15226, 0.8531939, 0.7331823, 1, 0, 0.7333333, 1,
1.162815, 0.6909985, 1.642731, 1, 0, 0.7254902, 1,
1.184235, -0.5809523, 1.368533, 1, 0, 0.7215686, 1,
1.185544, 1.20923, 0.7852693, 1, 0, 0.7137255, 1,
1.188796, 0.2764875, 2.600197, 1, 0, 0.7098039, 1,
1.194107, 1.838291, 0.05577556, 1, 0, 0.7019608, 1,
1.201405, 0.3043205, 1.126659, 1, 0, 0.6941177, 1,
1.204211, -0.1201932, 2.525934, 1, 0, 0.6901961, 1,
1.221942, 1.501643, 0.8758348, 1, 0, 0.682353, 1,
1.222034, 1.134908, -0.1929341, 1, 0, 0.6784314, 1,
1.223861, -0.5844731, 3.479872, 1, 0, 0.6705883, 1,
1.225401, 0.8101785, 1.550352, 1, 0, 0.6666667, 1,
1.22822, -0.4732053, -0.7532358, 1, 0, 0.6588235, 1,
1.230905, 0.8331881, 1.119142, 1, 0, 0.654902, 1,
1.232127, -1.904988, 0.1724737, 1, 0, 0.6470588, 1,
1.235448, 1.941201, 0.9790902, 1, 0, 0.6431373, 1,
1.241585, -0.4698928, 0.8820843, 1, 0, 0.6352941, 1,
1.24683, 1.015604, 0.2402952, 1, 0, 0.6313726, 1,
1.253625, 2.848811, -0.1405325, 1, 0, 0.6235294, 1,
1.254658, -0.1242244, 2.263162, 1, 0, 0.6196079, 1,
1.260334, 0.7252425, 2.205751, 1, 0, 0.6117647, 1,
1.264639, -1.683909, 2.647605, 1, 0, 0.6078432, 1,
1.274343, 0.6125797, 1.1546, 1, 0, 0.6, 1,
1.278292, -0.09560636, 4.614344, 1, 0, 0.5921569, 1,
1.283432, 0.1330045, -0.6254371, 1, 0, 0.5882353, 1,
1.286601, -0.8205229, 1.056319, 1, 0, 0.5803922, 1,
1.289307, 0.7204469, 1.29615, 1, 0, 0.5764706, 1,
1.289947, -0.7827127, 3.029093, 1, 0, 0.5686275, 1,
1.308711, -1.753299, 3.378992, 1, 0, 0.5647059, 1,
1.310455, 1.484312, 0.4263389, 1, 0, 0.5568628, 1,
1.310519, 0.4067055, 1.221383, 1, 0, 0.5529412, 1,
1.313911, -2.715075, 3.465866, 1, 0, 0.5450981, 1,
1.329394, 1.374942, -0.3492864, 1, 0, 0.5411765, 1,
1.334666, -0.7921313, 1.321841, 1, 0, 0.5333334, 1,
1.33927, 1.675389, 0.7589304, 1, 0, 0.5294118, 1,
1.341607, 0.4711908, 0.5330129, 1, 0, 0.5215687, 1,
1.347248, -0.01265022, 0.6487043, 1, 0, 0.5176471, 1,
1.361951, -1.217236, 2.669484, 1, 0, 0.509804, 1,
1.385134, -0.8237813, 0.8247502, 1, 0, 0.5058824, 1,
1.385432, -0.6285734, 3.99264, 1, 0, 0.4980392, 1,
1.386105, -0.4078636, 1.69042, 1, 0, 0.4901961, 1,
1.395415, 0.4386617, 1.886016, 1, 0, 0.4862745, 1,
1.403922, 0.8491849, 0.6508863, 1, 0, 0.4784314, 1,
1.416404, 1.890935, 0.113517, 1, 0, 0.4745098, 1,
1.425172, -0.6464075, 1.849337, 1, 0, 0.4666667, 1,
1.426699, -0.8437406, 1.422926, 1, 0, 0.4627451, 1,
1.431112, 0.3428923, 1.613683, 1, 0, 0.454902, 1,
1.433191, -0.2181252, 3.027122, 1, 0, 0.4509804, 1,
1.455135, 0.2480073, 2.226439, 1, 0, 0.4431373, 1,
1.459698, 0.3104511, 0.6217682, 1, 0, 0.4392157, 1,
1.463705, -0.9541637, 0.8674048, 1, 0, 0.4313726, 1,
1.468036, -1.493293, 2.918769, 1, 0, 0.427451, 1,
1.469224, 2.186064, 0.1222409, 1, 0, 0.4196078, 1,
1.470831, 0.7589153, 0.1617706, 1, 0, 0.4156863, 1,
1.484013, -1.368077, 0.861893, 1, 0, 0.4078431, 1,
1.486497, -0.4789581, 1.79973, 1, 0, 0.4039216, 1,
1.494485, 0.3455207, 1.498368, 1, 0, 0.3960784, 1,
1.515162, 0.135741, 1.738518, 1, 0, 0.3882353, 1,
1.520814, -0.1320948, 2.669106, 1, 0, 0.3843137, 1,
1.52843, -0.5992272, 1.960932, 1, 0, 0.3764706, 1,
1.533376, -1.46508, 1.224277, 1, 0, 0.372549, 1,
1.533728, 1.121447, 0.6307358, 1, 0, 0.3647059, 1,
1.579275, 1.165689, 0.4323792, 1, 0, 0.3607843, 1,
1.580553, 0.3584743, 0.6969617, 1, 0, 0.3529412, 1,
1.581271, -1.13209, 1.858085, 1, 0, 0.3490196, 1,
1.598157, 0.5590421, 1.117189, 1, 0, 0.3411765, 1,
1.630071, 0.8354562, -0.1123229, 1, 0, 0.3372549, 1,
1.631593, 0.9946776, 1.06104, 1, 0, 0.3294118, 1,
1.652411, 0.5074469, 0.4857019, 1, 0, 0.3254902, 1,
1.672162, 1.247781, 1.411323, 1, 0, 0.3176471, 1,
1.672222, -0.5921156, 0.800764, 1, 0, 0.3137255, 1,
1.673578, -1.394252, 2.296515, 1, 0, 0.3058824, 1,
1.674104, -0.004862321, 1.809819, 1, 0, 0.2980392, 1,
1.67496, 0.6504775, 0.7709033, 1, 0, 0.2941177, 1,
1.681355, 2.218718, -0.1691486, 1, 0, 0.2862745, 1,
1.691283, -1.842648, 2.889969, 1, 0, 0.282353, 1,
1.706037, 0.3882307, 2.97434, 1, 0, 0.2745098, 1,
1.706609, -0.7909964, 1.565169, 1, 0, 0.2705882, 1,
1.710882, -1.201881, 2.298165, 1, 0, 0.2627451, 1,
1.719777, -1.989912, 0.9231922, 1, 0, 0.2588235, 1,
1.724225, 1.372449, 2.074125, 1, 0, 0.2509804, 1,
1.726256, -0.5901656, 2.278625, 1, 0, 0.2470588, 1,
1.735862, 0.1114461, 3.560481, 1, 0, 0.2392157, 1,
1.762116, -0.1364262, 1.319031, 1, 0, 0.2352941, 1,
1.781007, -0.05585494, 2.108872, 1, 0, 0.227451, 1,
1.825128, 0.3664282, 3.072201, 1, 0, 0.2235294, 1,
1.838255, 0.1063478, 1.603672, 1, 0, 0.2156863, 1,
1.842026, 0.2284464, 1.897047, 1, 0, 0.2117647, 1,
1.843461, 1.396598, 1.809698, 1, 0, 0.2039216, 1,
1.850455, 0.2366544, 2.055298, 1, 0, 0.1960784, 1,
1.854233, -0.8783127, 2.692257, 1, 0, 0.1921569, 1,
1.872633, 0.6193624, 0.5205873, 1, 0, 0.1843137, 1,
1.91117, -0.002121469, 0.6779917, 1, 0, 0.1803922, 1,
1.928056, -0.5069273, 0.9860428, 1, 0, 0.172549, 1,
1.933634, -0.626325, 1.307344, 1, 0, 0.1686275, 1,
1.943429, 0.6262197, 1.158159, 1, 0, 0.1607843, 1,
1.963187, 0.301742, 0.7710909, 1, 0, 0.1568628, 1,
1.965627, -0.07041466, 1.336303, 1, 0, 0.1490196, 1,
1.981858, 0.6860124, 1.544958, 1, 0, 0.145098, 1,
1.986912, 0.6163018, 2.387106, 1, 0, 0.1372549, 1,
2.008965, -0.6344743, 1.955694, 1, 0, 0.1333333, 1,
2.018808, -1.206009, 1.435987, 1, 0, 0.1254902, 1,
2.053012, 0.3173198, 2.691744, 1, 0, 0.1215686, 1,
2.062748, -0.8091912, 2.125283, 1, 0, 0.1137255, 1,
2.127301, -0.7751881, 2.707182, 1, 0, 0.1098039, 1,
2.129131, 0.2045778, 1.376862, 1, 0, 0.1019608, 1,
2.154974, 1.723195, 1.435646, 1, 0, 0.09411765, 1,
2.15562, -0.3926742, 2.062102, 1, 0, 0.09019608, 1,
2.160482, -0.5688352, 2.053588, 1, 0, 0.08235294, 1,
2.214547, -0.4729259, 2.991807, 1, 0, 0.07843138, 1,
2.223547, 1.679182, 0.6637281, 1, 0, 0.07058824, 1,
2.283587, -0.8395808, 1.548406, 1, 0, 0.06666667, 1,
2.29321, 1.162464, 2.435607, 1, 0, 0.05882353, 1,
2.373678, -2.237285, 1.041891, 1, 0, 0.05490196, 1,
2.380774, 1.672661, 0.24869, 1, 0, 0.04705882, 1,
2.385304, 0.2450708, 1.407116, 1, 0, 0.04313726, 1,
2.457123, 1.396995, 1.922309, 1, 0, 0.03529412, 1,
2.614011, 0.5493763, 2.326487, 1, 0, 0.03137255, 1,
2.765729, -0.08556693, 1.885602, 1, 0, 0.02352941, 1,
3.298485, 0.09208898, 0.7281625, 1, 0, 0.01960784, 1,
3.373929, -0.8981637, 2.821215, 1, 0, 0.01176471, 1,
3.692551, 0.2319564, 1.988222, 1, 0, 0.007843138, 1
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
0.5094572, -4.224834, -7.769798, 0, -0.5, 0.5, 0.5,
0.5094572, -4.224834, -7.769798, 1, -0.5, 0.5, 0.5,
0.5094572, -4.224834, -7.769798, 1, 1.5, 0.5, 0.5,
0.5094572, -4.224834, -7.769798, 0, 1.5, 0.5, 0.5
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
-3.752705, -0.01981306, -7.769798, 0, -0.5, 0.5, 0.5,
-3.752705, -0.01981306, -7.769798, 1, -0.5, 0.5, 0.5,
-3.752705, -0.01981306, -7.769798, 1, 1.5, 0.5, 0.5,
-3.752705, -0.01981306, -7.769798, 0, 1.5, 0.5, 0.5
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
-3.752705, -4.224834, 0.9386413, 0, -0.5, 0.5, 0.5,
-3.752705, -4.224834, 0.9386413, 1, -0.5, 0.5, 0.5,
-3.752705, -4.224834, 0.9386413, 1, 1.5, 0.5, 0.5,
-3.752705, -4.224834, 0.9386413, 0, 1.5, 0.5, 0.5
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
-2, -3.254445, -5.760158,
3, -3.254445, -5.760158,
-2, -3.254445, -5.760158,
-2, -3.416177, -6.095098,
-1, -3.254445, -5.760158,
-1, -3.416177, -6.095098,
0, -3.254445, -5.760158,
0, -3.416177, -6.095098,
1, -3.254445, -5.760158,
1, -3.416177, -6.095098,
2, -3.254445, -5.760158,
2, -3.416177, -6.095098,
3, -3.254445, -5.760158,
3, -3.416177, -6.095098
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
-2, -3.73964, -6.764978, 0, -0.5, 0.5, 0.5,
-2, -3.73964, -6.764978, 1, -0.5, 0.5, 0.5,
-2, -3.73964, -6.764978, 1, 1.5, 0.5, 0.5,
-2, -3.73964, -6.764978, 0, 1.5, 0.5, 0.5,
-1, -3.73964, -6.764978, 0, -0.5, 0.5, 0.5,
-1, -3.73964, -6.764978, 1, -0.5, 0.5, 0.5,
-1, -3.73964, -6.764978, 1, 1.5, 0.5, 0.5,
-1, -3.73964, -6.764978, 0, 1.5, 0.5, 0.5,
0, -3.73964, -6.764978, 0, -0.5, 0.5, 0.5,
0, -3.73964, -6.764978, 1, -0.5, 0.5, 0.5,
0, -3.73964, -6.764978, 1, 1.5, 0.5, 0.5,
0, -3.73964, -6.764978, 0, 1.5, 0.5, 0.5,
1, -3.73964, -6.764978, 0, -0.5, 0.5, 0.5,
1, -3.73964, -6.764978, 1, -0.5, 0.5, 0.5,
1, -3.73964, -6.764978, 1, 1.5, 0.5, 0.5,
1, -3.73964, -6.764978, 0, 1.5, 0.5, 0.5,
2, -3.73964, -6.764978, 0, -0.5, 0.5, 0.5,
2, -3.73964, -6.764978, 1, -0.5, 0.5, 0.5,
2, -3.73964, -6.764978, 1, 1.5, 0.5, 0.5,
2, -3.73964, -6.764978, 0, 1.5, 0.5, 0.5,
3, -3.73964, -6.764978, 0, -0.5, 0.5, 0.5,
3, -3.73964, -6.764978, 1, -0.5, 0.5, 0.5,
3, -3.73964, -6.764978, 1, 1.5, 0.5, 0.5,
3, -3.73964, -6.764978, 0, 1.5, 0.5, 0.5
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
-2.769129, -3, -5.760158,
-2.769129, 3, -5.760158,
-2.769129, -3, -5.760158,
-2.933059, -3, -6.095098,
-2.769129, -2, -5.760158,
-2.933059, -2, -6.095098,
-2.769129, -1, -5.760158,
-2.933059, -1, -6.095098,
-2.769129, 0, -5.760158,
-2.933059, 0, -6.095098,
-2.769129, 1, -5.760158,
-2.933059, 1, -6.095098,
-2.769129, 2, -5.760158,
-2.933059, 2, -6.095098,
-2.769129, 3, -5.760158,
-2.933059, 3, -6.095098
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
-3.260917, -3, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, -3, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, -3, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, -3, -6.764978, 0, 1.5, 0.5, 0.5,
-3.260917, -2, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, -2, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, -2, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, -2, -6.764978, 0, 1.5, 0.5, 0.5,
-3.260917, -1, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, -1, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, -1, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, -1, -6.764978, 0, 1.5, 0.5, 0.5,
-3.260917, 0, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, 0, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, 0, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, 0, -6.764978, 0, 1.5, 0.5, 0.5,
-3.260917, 1, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, 1, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, 1, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, 1, -6.764978, 0, 1.5, 0.5, 0.5,
-3.260917, 2, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, 2, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, 2, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, 2, -6.764978, 0, 1.5, 0.5, 0.5,
-3.260917, 3, -6.764978, 0, -0.5, 0.5, 0.5,
-3.260917, 3, -6.764978, 1, -0.5, 0.5, 0.5,
-3.260917, 3, -6.764978, 1, 1.5, 0.5, 0.5,
-3.260917, 3, -6.764978, 0, 1.5, 0.5, 0.5
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
-2.769129, -3.254445, -4,
-2.769129, -3.254445, 6,
-2.769129, -3.254445, -4,
-2.933059, -3.416177, -4,
-2.769129, -3.254445, -2,
-2.933059, -3.416177, -2,
-2.769129, -3.254445, 0,
-2.933059, -3.416177, 0,
-2.769129, -3.254445, 2,
-2.933059, -3.416177, 2,
-2.769129, -3.254445, 4,
-2.933059, -3.416177, 4,
-2.769129, -3.254445, 6,
-2.933059, -3.416177, 6
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
-3.260917, -3.73964, -4, 0, -0.5, 0.5, 0.5,
-3.260917, -3.73964, -4, 1, -0.5, 0.5, 0.5,
-3.260917, -3.73964, -4, 1, 1.5, 0.5, 0.5,
-3.260917, -3.73964, -4, 0, 1.5, 0.5, 0.5,
-3.260917, -3.73964, -2, 0, -0.5, 0.5, 0.5,
-3.260917, -3.73964, -2, 1, -0.5, 0.5, 0.5,
-3.260917, -3.73964, -2, 1, 1.5, 0.5, 0.5,
-3.260917, -3.73964, -2, 0, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 0, 0, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 0, 1, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 0, 1, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 0, 0, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 2, 0, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 2, 1, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 2, 1, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 2, 0, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 4, 0, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 4, 1, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 4, 1, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 4, 0, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 6, 0, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 6, 1, -0.5, 0.5, 0.5,
-3.260917, -3.73964, 6, 1, 1.5, 0.5, 0.5,
-3.260917, -3.73964, 6, 0, 1.5, 0.5, 0.5
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
-2.769129, -3.254445, -5.760158,
-2.769129, 3.214819, -5.760158,
-2.769129, -3.254445, 7.637441,
-2.769129, 3.214819, 7.637441,
-2.769129, -3.254445, -5.760158,
-2.769129, -3.254445, 7.637441,
-2.769129, 3.214819, -5.760158,
-2.769129, 3.214819, 7.637441,
-2.769129, -3.254445, -5.760158,
3.788044, -3.254445, -5.760158,
-2.769129, -3.254445, 7.637441,
3.788044, -3.254445, 7.637441,
-2.769129, 3.214819, -5.760158,
3.788044, 3.214819, -5.760158,
-2.769129, 3.214819, 7.637441,
3.788044, 3.214819, 7.637441,
3.788044, -3.254445, -5.760158,
3.788044, 3.214819, -5.760158,
3.788044, -3.254445, 7.637441,
3.788044, 3.214819, 7.637441,
3.788044, -3.254445, -5.760158,
3.788044, -3.254445, 7.637441,
3.788044, 3.214819, -5.760158,
3.788044, 3.214819, 7.637441
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
var radius = 8.681801;
var distance = 38.62631;
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
mvMatrix.translate( -0.5094572, 0.01981306, -0.9386413 );
mvMatrix.scale( 1.431552, 1.451005, 0.7006429 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.62631);
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
bioresmethrin<-read.table("bioresmethrin.xyz")
```

```
## Error in read.table("bioresmethrin.xyz"): no lines available in input
```

```r
x<-bioresmethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'bioresmethrin' not found
```

```r
y<-bioresmethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'bioresmethrin' not found
```

```r
z<-bioresmethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'bioresmethrin' not found
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
-2.673636, 0.3922708, -4.046202, 0, 0, 1, 1, 1,
-2.665371, 0.6189502, -1.910825, 1, 0, 0, 1, 1,
-2.557911, -0.1294502, -1.321532, 1, 0, 0, 1, 1,
-2.505617, 1.132022, -0.7618789, 1, 0, 0, 1, 1,
-2.442739, 1.860933, -1.369584, 1, 0, 0, 1, 1,
-2.41185, -1.716623, -2.534001, 1, 0, 0, 1, 1,
-2.400363, -0.1920244, -1.390708, 0, 0, 0, 1, 1,
-2.392745, 0.9029704, -1.939412, 0, 0, 0, 1, 1,
-2.38851, -0.04816241, -2.380778, 0, 0, 0, 1, 1,
-2.304682, -0.02859049, -1.456244, 0, 0, 0, 1, 1,
-2.298455, -0.6545303, -2.78712, 0, 0, 0, 1, 1,
-2.292312, -0.3976323, -0.7712782, 0, 0, 0, 1, 1,
-2.272995, 0.6710189, -1.238869, 0, 0, 0, 1, 1,
-2.26305, 2.412575, -1.565989, 1, 1, 1, 1, 1,
-2.229761, -0.8374661, -1.610407, 1, 1, 1, 1, 1,
-2.217247, 0.133435, -1.492948, 1, 1, 1, 1, 1,
-2.205402, -0.7845168, -1.61818, 1, 1, 1, 1, 1,
-2.189425, 0.9076023, -1.329796, 1, 1, 1, 1, 1,
-2.140543, 0.5596592, -3.147567, 1, 1, 1, 1, 1,
-2.123386, 0.957164, -0.3163501, 1, 1, 1, 1, 1,
-2.117261, 1.012007, 0.3308952, 1, 1, 1, 1, 1,
-2.104831, 0.8920823, -1.483888, 1, 1, 1, 1, 1,
-2.089248, -0.2747232, -0.1296093, 1, 1, 1, 1, 1,
-2.089232, 1.446031, -1.789548, 1, 1, 1, 1, 1,
-2.081504, -0.0009454666, -0.1523215, 1, 1, 1, 1, 1,
-2.062942, 0.2243628, -2.183191, 1, 1, 1, 1, 1,
-2.042522, -0.8398958, -2.289659, 1, 1, 1, 1, 1,
-2.026179, -0.1946887, -2.332029, 1, 1, 1, 1, 1,
-1.981773, -1.577762, -1.714948, 0, 0, 1, 1, 1,
-1.963866, 1.366185, -0.7355728, 1, 0, 0, 1, 1,
-1.954915, 0.6788463, -0.5932667, 1, 0, 0, 1, 1,
-1.939559, 0.3159752, -1.61509, 1, 0, 0, 1, 1,
-1.938796, 0.8617727, -2.195388, 1, 0, 0, 1, 1,
-1.924399, -2.428716, -2.93038, 1, 0, 0, 1, 1,
-1.912822, 1.289416, -2.388321, 0, 0, 0, 1, 1,
-1.906191, -1.107601, -3.080979, 0, 0, 0, 1, 1,
-1.877146, 0.6757398, -1.603691, 0, 0, 0, 1, 1,
-1.855503, 0.8887864, -1.117585, 0, 0, 0, 1, 1,
-1.850244, 0.5279174, -1.981185, 0, 0, 0, 1, 1,
-1.847412, 0.3034845, -2.187766, 0, 0, 0, 1, 1,
-1.804958, -0.7019628, -1.761374, 0, 0, 0, 1, 1,
-1.795932, 1.035486, 0.7751064, 1, 1, 1, 1, 1,
-1.765531, 0.06572665, -1.778685, 1, 1, 1, 1, 1,
-1.757346, -0.6904955, -0.8762073, 1, 1, 1, 1, 1,
-1.724447, 0.2890767, -1.040457, 1, 1, 1, 1, 1,
-1.702275, 1.238172, -1.157704, 1, 1, 1, 1, 1,
-1.691801, 0.7469095, -2.924692, 1, 1, 1, 1, 1,
-1.67467, -0.393477, -2.448564, 1, 1, 1, 1, 1,
-1.671867, 0.05909413, -1.629902, 1, 1, 1, 1, 1,
-1.65273, 0.9535317, -0.781618, 1, 1, 1, 1, 1,
-1.650459, -2.776145, -2.205405, 1, 1, 1, 1, 1,
-1.63742, -0.6563797, -0.9674411, 1, 1, 1, 1, 1,
-1.636126, -0.4050522, -1.844033, 1, 1, 1, 1, 1,
-1.628719, 0.742873, 0.2622066, 1, 1, 1, 1, 1,
-1.621309, 1.21805, -1.457883, 1, 1, 1, 1, 1,
-1.618573, -0.6879632, -1.86169, 1, 1, 1, 1, 1,
-1.618457, 0.2547766, -3.703211, 0, 0, 1, 1, 1,
-1.614836, -0.4531221, -4.579766, 1, 0, 0, 1, 1,
-1.595457, 1.086186, -2.228933, 1, 0, 0, 1, 1,
-1.594515, 1.552047, -1.688041, 1, 0, 0, 1, 1,
-1.581132, -1.542547, -2.669134, 1, 0, 0, 1, 1,
-1.571129, -1.060231, -2.40538, 1, 0, 0, 1, 1,
-1.561355, -0.4174528, -0.9519755, 0, 0, 0, 1, 1,
-1.559793, 0.6502815, -2.823857, 0, 0, 0, 1, 1,
-1.539749, 1.966992, -0.3562881, 0, 0, 0, 1, 1,
-1.515727, 0.3581516, -0.393476, 0, 0, 0, 1, 1,
-1.51185, 1.461715, -0.5842223, 0, 0, 0, 1, 1,
-1.48937, 0.01425322, -1.350598, 0, 0, 0, 1, 1,
-1.48834, -0.6437781, -1.175034, 0, 0, 0, 1, 1,
-1.478351, -0.2450242, -2.502058, 1, 1, 1, 1, 1,
-1.475687, -0.10481, -1.248635, 1, 1, 1, 1, 1,
-1.46713, -0.7705197, -2.588252, 1, 1, 1, 1, 1,
-1.457766, 0.08156371, -1.838167, 1, 1, 1, 1, 1,
-1.455417, 2.878859, -1.664518, 1, 1, 1, 1, 1,
-1.449145, -0.1728471, -2.144519, 1, 1, 1, 1, 1,
-1.444912, -0.2107757, -0.8751217, 1, 1, 1, 1, 1,
-1.442991, -1.11127, -2.849902, 1, 1, 1, 1, 1,
-1.442404, 0.1737009, -2.921689, 1, 1, 1, 1, 1,
-1.436527, -0.3024388, -2.299048, 1, 1, 1, 1, 1,
-1.431946, 0.156724, -2.850662, 1, 1, 1, 1, 1,
-1.431786, 0.4954099, -0.090919, 1, 1, 1, 1, 1,
-1.430083, -0.5632462, -1.43329, 1, 1, 1, 1, 1,
-1.424236, 0.2779351, -1.338467, 1, 1, 1, 1, 1,
-1.417166, 2.853155, -0.2256538, 1, 1, 1, 1, 1,
-1.416015, -0.543858, -0.7628555, 0, 0, 1, 1, 1,
-1.409134, -1.111294, -3.456751, 1, 0, 0, 1, 1,
-1.406286, -0.4634831, -1.300864, 1, 0, 0, 1, 1,
-1.39351, -0.7601032, -3.353894, 1, 0, 0, 1, 1,
-1.377698, 1.763676, -0.6030286, 1, 0, 0, 1, 1,
-1.377467, -0.774761, -3.158743, 1, 0, 0, 1, 1,
-1.375594, -1.807158, -4.454787, 0, 0, 0, 1, 1,
-1.371461, -1.434524, -0.7865213, 0, 0, 0, 1, 1,
-1.367083, -0.3750595, -1.565038, 0, 0, 0, 1, 1,
-1.364957, -0.1958119, -0.5454525, 0, 0, 0, 1, 1,
-1.364873, -0.3255279, -1.115667, 0, 0, 0, 1, 1,
-1.363186, 0.2298505, -1.251026, 0, 0, 0, 1, 1,
-1.360397, -0.7130486, -2.754751, 0, 0, 0, 1, 1,
-1.359186, -0.4597807, -1.283054, 1, 1, 1, 1, 1,
-1.359053, -0.4676172, -2.565624, 1, 1, 1, 1, 1,
-1.355257, 0.8038124, -0.9952949, 1, 1, 1, 1, 1,
-1.341895, -0.9167286, -2.584317, 1, 1, 1, 1, 1,
-1.330862, 2.152589, -2.306753, 1, 1, 1, 1, 1,
-1.329175, 0.05933107, -1.844884, 1, 1, 1, 1, 1,
-1.319788, -1.100075, -1.692261, 1, 1, 1, 1, 1,
-1.317061, -1.755877, -3.08413, 1, 1, 1, 1, 1,
-1.307967, -1.87989, -2.493619, 1, 1, 1, 1, 1,
-1.303318, -1.537669, -2.949391, 1, 1, 1, 1, 1,
-1.292801, 0.05355568, -1.391009, 1, 1, 1, 1, 1,
-1.288382, -1.588678, -2.401599, 1, 1, 1, 1, 1,
-1.281027, 0.1824438, -1.289948, 1, 1, 1, 1, 1,
-1.280177, -0.6447106, -1.954111, 1, 1, 1, 1, 1,
-1.2678, -1.068745, -3.4555, 1, 1, 1, 1, 1,
-1.267419, -0.9527884, -2.121907, 0, 0, 1, 1, 1,
-1.266041, 1.831604, -0.6210946, 1, 0, 0, 1, 1,
-1.265866, 1.07012, -2.522315, 1, 0, 0, 1, 1,
-1.262061, -1.090394, -0.7960505, 1, 0, 0, 1, 1,
-1.253293, -0.3790411, -0.5775085, 1, 0, 0, 1, 1,
-1.250664, -0.6844682, -1.899631, 1, 0, 0, 1, 1,
-1.239336, 0.3786666, -1.354096, 0, 0, 0, 1, 1,
-1.236364, -0.3182441, -0.3339041, 0, 0, 0, 1, 1,
-1.236291, -0.5003506, -2.053503, 0, 0, 0, 1, 1,
-1.233577, -0.8039571, -3.213879, 0, 0, 0, 1, 1,
-1.233344, 0.6839058, -1.036018, 0, 0, 0, 1, 1,
-1.231561, 1.174039, -0.9348806, 0, 0, 0, 1, 1,
-1.22924, -0.07103055, -1.012834, 0, 0, 0, 1, 1,
-1.227361, -0.3493625, -1.774491, 1, 1, 1, 1, 1,
-1.222787, 1.300094, -1.36004, 1, 1, 1, 1, 1,
-1.221793, -1.494255, -1.12011, 1, 1, 1, 1, 1,
-1.220366, -0.8042492, -2.188445, 1, 1, 1, 1, 1,
-1.210362, 0.9181897, 0.5314935, 1, 1, 1, 1, 1,
-1.202259, -0.4161512, -0.6943251, 1, 1, 1, 1, 1,
-1.190644, -0.9932874, -1.684358, 1, 1, 1, 1, 1,
-1.179675, -0.9536965, -2.775257, 1, 1, 1, 1, 1,
-1.173652, -0.2936187, -1.595446, 1, 1, 1, 1, 1,
-1.170071, 0.7777618, 0.1015023, 1, 1, 1, 1, 1,
-1.169862, -1.047998, -3.68133, 1, 1, 1, 1, 1,
-1.16943, -0.8107003, -4.609405, 1, 1, 1, 1, 1,
-1.158463, 0.3368329, 0.1877961, 1, 1, 1, 1, 1,
-1.157645, -1.031454, -3.328534, 1, 1, 1, 1, 1,
-1.152288, -1.766132, -3.254929, 1, 1, 1, 1, 1,
-1.150122, -1.82631, -2.239677, 0, 0, 1, 1, 1,
-1.147822, 1.068811, -0.4982417, 1, 0, 0, 1, 1,
-1.146893, -0.368616, -1.158984, 1, 0, 0, 1, 1,
-1.143137, 0.3338559, -1.360134, 1, 0, 0, 1, 1,
-1.137428, -0.2124678, -0.6592169, 1, 0, 0, 1, 1,
-1.12702, 1.406079, -2.352536, 1, 0, 0, 1, 1,
-1.123849, 0.6593847, -1.887738, 0, 0, 0, 1, 1,
-1.118493, -0.279449, -1.384685, 0, 0, 0, 1, 1,
-1.115187, 0.8041028, -1.107084, 0, 0, 0, 1, 1,
-1.115, 0.259173, 0.6648695, 0, 0, 0, 1, 1,
-1.113025, -1.971447, -3.144289, 0, 0, 0, 1, 1,
-1.111901, -0.7858951, -1.894928, 0, 0, 0, 1, 1,
-1.107144, 0.478964, -0.6108825, 0, 0, 0, 1, 1,
-1.106682, -0.645963, -1.679383, 1, 1, 1, 1, 1,
-1.100907, -0.2207126, -2.245626, 1, 1, 1, 1, 1,
-1.098402, -0.7821319, -2.353604, 1, 1, 1, 1, 1,
-1.093311, 0.2182638, -2.141435, 1, 1, 1, 1, 1,
-1.088363, -0.8097039, -3.026297, 1, 1, 1, 1, 1,
-1.080532, 1.491954, 0.2027561, 1, 1, 1, 1, 1,
-1.079826, -0.6572888, -0.2126523, 1, 1, 1, 1, 1,
-1.078189, -0.04338488, 0.1097168, 1, 1, 1, 1, 1,
-1.073804, 0.3710397, -2.24653, 1, 1, 1, 1, 1,
-1.069453, -0.7148068, -2.329594, 1, 1, 1, 1, 1,
-1.057277, -0.3205898, -1.839077, 1, 1, 1, 1, 1,
-1.050404, 1.149069, -0.9155195, 1, 1, 1, 1, 1,
-1.037304, -0.2178763, -1.826118, 1, 1, 1, 1, 1,
-1.036768, 1.513848, -0.6750336, 1, 1, 1, 1, 1,
-1.032287, 0.951497, -1.198925, 1, 1, 1, 1, 1,
-1.025951, 1.395149, -0.5330822, 0, 0, 1, 1, 1,
-1.019015, -0.7694024, -2.977728, 1, 0, 0, 1, 1,
-1.001913, 0.4810874, -1.970896, 1, 0, 0, 1, 1,
-0.9968681, -0.9636273, -0.2305956, 1, 0, 0, 1, 1,
-0.9886376, -0.02106819, -1.044111, 1, 0, 0, 1, 1,
-0.9846517, -1.026924, -0.9478855, 1, 0, 0, 1, 1,
-0.9748822, -0.7916216, -0.3691074, 0, 0, 0, 1, 1,
-0.9709257, -2.549502, -3.479269, 0, 0, 0, 1, 1,
-0.9649121, -0.03331809, -0.9499913, 0, 0, 0, 1, 1,
-0.959919, -0.2147758, -0.1289572, 0, 0, 0, 1, 1,
-0.9555207, 0.36009, 0.532759, 0, 0, 0, 1, 1,
-0.9544482, -0.2185191, -0.9044222, 0, 0, 0, 1, 1,
-0.9456924, -1.341594, -0.9632711, 0, 0, 0, 1, 1,
-0.9445158, 1.241204, 0.3482037, 1, 1, 1, 1, 1,
-0.9402272, -0.2362908, -2.083441, 1, 1, 1, 1, 1,
-0.9366287, 0.8632926, -0.9142644, 1, 1, 1, 1, 1,
-0.9290621, -0.1584805, -2.292615, 1, 1, 1, 1, 1,
-0.9200253, -0.01410666, -1.424587, 1, 1, 1, 1, 1,
-0.9106151, -0.2873401, -2.030034, 1, 1, 1, 1, 1,
-0.9099641, -1.361654, -2.029536, 1, 1, 1, 1, 1,
-0.8974292, -0.4581084, -2.868613, 1, 1, 1, 1, 1,
-0.8966838, -0.2258132, -2.101074, 1, 1, 1, 1, 1,
-0.8950625, -1.108416, -2.382796, 1, 1, 1, 1, 1,
-0.8932826, -0.2090265, -1.127385, 1, 1, 1, 1, 1,
-0.889765, 0.7095594, 1.393443, 1, 1, 1, 1, 1,
-0.8895082, -0.1139623, 0.4081702, 1, 1, 1, 1, 1,
-0.8847942, -1.576276, -1.87581, 1, 1, 1, 1, 1,
-0.8810143, -0.5172637, -0.874202, 1, 1, 1, 1, 1,
-0.8810018, -0.4038602, -0.6443106, 0, 0, 1, 1, 1,
-0.8766812, -0.3465818, -2.09301, 1, 0, 0, 1, 1,
-0.8730485, 1.230471, -1.008087, 1, 0, 0, 1, 1,
-0.8709062, 0.3731345, -0.8180671, 1, 0, 0, 1, 1,
-0.8699097, 1.272513, 2.022618, 1, 0, 0, 1, 1,
-0.8629265, -0.4503208, -1.945103, 1, 0, 0, 1, 1,
-0.8607151, 0.2828294, -1.453099, 0, 0, 0, 1, 1,
-0.8592974, 0.1940722, -3.954163, 0, 0, 0, 1, 1,
-0.856901, -0.5904059, -1.167075, 0, 0, 0, 1, 1,
-0.8562872, -0.7654845, -3.51479, 0, 0, 0, 1, 1,
-0.8508297, 0.3244057, -1.824609, 0, 0, 0, 1, 1,
-0.8439942, -0.3295904, -1.422774, 0, 0, 0, 1, 1,
-0.8421341, 0.1578124, -1.496275, 0, 0, 0, 1, 1,
-0.8383983, 1.024927, -1.266207, 1, 1, 1, 1, 1,
-0.8332403, 0.6056787, -1.033571, 1, 1, 1, 1, 1,
-0.8278574, -0.5004286, -0.5416545, 1, 1, 1, 1, 1,
-0.8272887, 0.9414725, -1.280216, 1, 1, 1, 1, 1,
-0.8234186, -0.7595303, -0.6707271, 1, 1, 1, 1, 1,
-0.8056536, -0.6904091, -2.406221, 1, 1, 1, 1, 1,
-0.7987714, 1.443416, 0.9433305, 1, 1, 1, 1, 1,
-0.7934263, 1.109561, -2.089892, 1, 1, 1, 1, 1,
-0.7889605, -1.20821, -2.33883, 1, 1, 1, 1, 1,
-0.7889544, 0.4295636, -3.128916, 1, 1, 1, 1, 1,
-0.7884551, 0.9808453, 0.4390627, 1, 1, 1, 1, 1,
-0.7752857, 1.542956, 1.395431, 1, 1, 1, 1, 1,
-0.7650131, 1.700789, -0.8823974, 1, 1, 1, 1, 1,
-0.763723, -1.006223, -1.892914, 1, 1, 1, 1, 1,
-0.7607008, 0.4154334, 0.3633601, 1, 1, 1, 1, 1,
-0.7601728, 1.427929, -0.4363129, 0, 0, 1, 1, 1,
-0.755394, -1.042438, -2.084621, 1, 0, 0, 1, 1,
-0.7471281, 1.002317, 0.5037447, 1, 0, 0, 1, 1,
-0.7371258, 0.8546631, -1.027438, 1, 0, 0, 1, 1,
-0.7299831, -1.719761, -2.261743, 1, 0, 0, 1, 1,
-0.7292004, 0.864509, -0.6015365, 1, 0, 0, 1, 1,
-0.7253772, 0.6356946, -1.73445, 0, 0, 0, 1, 1,
-0.721982, 0.6668665, -0.9362496, 0, 0, 0, 1, 1,
-0.7212331, -0.2321699, -1.38285, 0, 0, 0, 1, 1,
-0.720627, 1.471349, 0.2176776, 0, 0, 0, 1, 1,
-0.7160433, -0.8707131, -4.135817, 0, 0, 0, 1, 1,
-0.7038172, 0.9553307, -1.1311, 0, 0, 0, 1, 1,
-0.70053, -2.027337, -2.530389, 0, 0, 0, 1, 1,
-0.6979311, -0.3556139, -1.098262, 1, 1, 1, 1, 1,
-0.6935602, 0.3863911, -1.240995, 1, 1, 1, 1, 1,
-0.6895511, 0.322944, -0.196305, 1, 1, 1, 1, 1,
-0.6872483, -1.526479, -3.6893, 1, 1, 1, 1, 1,
-0.6864262, 0.179319, -0.8948053, 1, 1, 1, 1, 1,
-0.6847968, 0.6784777, -2.501523, 1, 1, 1, 1, 1,
-0.684674, -0.9523312, -2.586947, 1, 1, 1, 1, 1,
-0.6827932, -1.416215, -2.900053, 1, 1, 1, 1, 1,
-0.6827128, 0.5375716, 0.1356809, 1, 1, 1, 1, 1,
-0.6802874, -0.778819, -3.992205, 1, 1, 1, 1, 1,
-0.680054, 0.4650902, 0.3538297, 1, 1, 1, 1, 1,
-0.675748, -1.044646, -1.402444, 1, 1, 1, 1, 1,
-0.6729694, 0.5394837, -2.356984, 1, 1, 1, 1, 1,
-0.6681408, 0.1855772, -2.215745, 1, 1, 1, 1, 1,
-0.6621875, 0.08381363, -0.9615418, 1, 1, 1, 1, 1,
-0.6606892, -1.051759, -3.452805, 0, 0, 1, 1, 1,
-0.6434419, 0.122043, -1.999768, 1, 0, 0, 1, 1,
-0.6423765, -0.3613965, -3.20918, 1, 0, 0, 1, 1,
-0.6369621, 0.880177, -0.3473038, 1, 0, 0, 1, 1,
-0.6369074, 0.1350692, -0.3344298, 1, 0, 0, 1, 1,
-0.6359093, 0.02206184, -1.509601, 1, 0, 0, 1, 1,
-0.634789, -0.6441025, -4.049963, 0, 0, 0, 1, 1,
-0.6310196, 0.6821096, 0.2539841, 0, 0, 0, 1, 1,
-0.6301122, 1.169057, -0.8424764, 0, 0, 0, 1, 1,
-0.6291285, 0.5565362, -1.493819, 0, 0, 0, 1, 1,
-0.6288206, 0.2782561, -0.3559557, 0, 0, 0, 1, 1,
-0.628247, -1.573967, -3.685547, 0, 0, 0, 1, 1,
-0.6279739, -0.543379, -1.868195, 0, 0, 0, 1, 1,
-0.6257539, -0.6360741, -3.138816, 1, 1, 1, 1, 1,
-0.6218001, 0.2785378, 0.6048458, 1, 1, 1, 1, 1,
-0.6215795, 0.9551202, -1.910099, 1, 1, 1, 1, 1,
-0.6191045, 0.7038043, -0.9008544, 1, 1, 1, 1, 1,
-0.617465, -0.1888113, -2.122662, 1, 1, 1, 1, 1,
-0.6167586, 1.054866, -1.502215, 1, 1, 1, 1, 1,
-0.6163147, -0.07295993, -0.4368668, 1, 1, 1, 1, 1,
-0.6097621, 0.6357719, -2.125216, 1, 1, 1, 1, 1,
-0.6076112, -0.9818198, -1.863324, 1, 1, 1, 1, 1,
-0.6073263, 0.491308, -0.6551341, 1, 1, 1, 1, 1,
-0.5954682, -1.510521, -3.841085, 1, 1, 1, 1, 1,
-0.5949945, 1.040621, -2.269961, 1, 1, 1, 1, 1,
-0.5928982, -0.8796232, -3.642072, 1, 1, 1, 1, 1,
-0.5905915, -0.5509944, -2.294938, 1, 1, 1, 1, 1,
-0.5902848, 2.778717, 1.536751, 1, 1, 1, 1, 1,
-0.5864868, -0.7768039, -3.267219, 0, 0, 1, 1, 1,
-0.5853752, -1.070339, -3.529707, 1, 0, 0, 1, 1,
-0.5821599, 0.6130519, -0.1248595, 1, 0, 0, 1, 1,
-0.5815415, -0.4806439, -1.891676, 1, 0, 0, 1, 1,
-0.5809538, -0.5587177, -1.379649, 1, 0, 0, 1, 1,
-0.5804229, -1.375585, -3.621558, 1, 0, 0, 1, 1,
-0.5795471, 1.41145, 0.1909299, 0, 0, 0, 1, 1,
-0.577378, 0.5300809, -2.160941, 0, 0, 0, 1, 1,
-0.5754373, 1.229805, -0.01706389, 0, 0, 0, 1, 1,
-0.5731955, 1.060244, 0.6797579, 0, 0, 0, 1, 1,
-0.571798, 0.05819153, -0.1773615, 0, 0, 0, 1, 1,
-0.5655059, 2.452715, -0.3508017, 0, 0, 0, 1, 1,
-0.56069, -0.3785342, -3.024617, 0, 0, 0, 1, 1,
-0.5596548, -0.8605184, -3.511117, 1, 1, 1, 1, 1,
-0.5593554, -1.828622, -2.259681, 1, 1, 1, 1, 1,
-0.5578769, -1.26535, -1.605982, 1, 1, 1, 1, 1,
-0.556327, 2.053705, 0.2171542, 1, 1, 1, 1, 1,
-0.555435, -0.5775775, -0.557515, 1, 1, 1, 1, 1,
-0.5535218, 0.5465254, 0.01886467, 1, 1, 1, 1, 1,
-0.5491396, -1.055682, -3.296355, 1, 1, 1, 1, 1,
-0.5446876, 0.04256149, -1.003243, 1, 1, 1, 1, 1,
-0.5425298, -1.073704, -2.249987, 1, 1, 1, 1, 1,
-0.5418584, 0.5834641, 0.7318394, 1, 1, 1, 1, 1,
-0.5413705, -0.5972328, -2.508782, 1, 1, 1, 1, 1,
-0.5409546, -0.0363468, -2.198922, 1, 1, 1, 1, 1,
-0.5384079, -1.680622, -0.9924214, 1, 1, 1, 1, 1,
-0.5369205, 1.394826, 0.5865661, 1, 1, 1, 1, 1,
-0.5366209, 0.2901981, 0.2595478, 1, 1, 1, 1, 1,
-0.5350474, -0.6315657, -2.480932, 0, 0, 1, 1, 1,
-0.5310264, -0.9660463, -2.587233, 1, 0, 0, 1, 1,
-0.5299614, -0.3256257, -2.257631, 1, 0, 0, 1, 1,
-0.5233374, -1.862523, -3.701168, 1, 0, 0, 1, 1,
-0.5228838, -2.064306, -2.958553, 1, 0, 0, 1, 1,
-0.5219279, 0.8418109, -1.361761, 1, 0, 0, 1, 1,
-0.5207996, -2.700134, -2.193419, 0, 0, 0, 1, 1,
-0.5171362, -0.3964322, -2.772899, 0, 0, 0, 1, 1,
-0.5120977, 0.2647729, -0.8359525, 0, 0, 0, 1, 1,
-0.5065693, 0.1874451, -1.186973, 0, 0, 0, 1, 1,
-0.5042345, -0.7684212, -2.892709, 0, 0, 0, 1, 1,
-0.4974434, 0.939884, 0.04216714, 0, 0, 0, 1, 1,
-0.4961918, 0.2275742, 0.5566558, 0, 0, 0, 1, 1,
-0.4946222, 0.5280858, -1.459758, 1, 1, 1, 1, 1,
-0.4942991, -0.8718351, -3.374949, 1, 1, 1, 1, 1,
-0.4936754, 1.51489, -1.542683, 1, 1, 1, 1, 1,
-0.4892598, -0.2244735, -1.780808, 1, 1, 1, 1, 1,
-0.4861036, 0.2708004, -0.08955818, 1, 1, 1, 1, 1,
-0.4854765, 1.391631, 0.635834, 1, 1, 1, 1, 1,
-0.483097, 0.4851676, -0.6866005, 1, 1, 1, 1, 1,
-0.482373, -1.121846, -3.36135, 1, 1, 1, 1, 1,
-0.4818152, 0.2330825, -1.236768, 1, 1, 1, 1, 1,
-0.4766303, 0.7164148, -2.066239, 1, 1, 1, 1, 1,
-0.470027, -0.1634804, -3.245079, 1, 1, 1, 1, 1,
-0.4670271, -0.5298218, -3.28095, 1, 1, 1, 1, 1,
-0.462469, 1.526932, -1.727882, 1, 1, 1, 1, 1,
-0.459355, 0.4639717, -1.134127, 1, 1, 1, 1, 1,
-0.459264, -1.706833, -2.63168, 1, 1, 1, 1, 1,
-0.4592143, -0.7274321, -3.19797, 0, 0, 1, 1, 1,
-0.458763, 1.785405, -1.587081, 1, 0, 0, 1, 1,
-0.4584782, -1.351259, -2.988595, 1, 0, 0, 1, 1,
-0.4580868, 0.9651756, -0.6589478, 1, 0, 0, 1, 1,
-0.4550179, 0.2389661, 0.3442916, 1, 0, 0, 1, 1,
-0.4522834, 0.4578371, -3.002025, 1, 0, 0, 1, 1,
-0.4490238, -0.7029064, -3.06126, 0, 0, 0, 1, 1,
-0.4461775, 0.3226086, -1.885495, 0, 0, 0, 1, 1,
-0.4420559, 0.1562778, -1.951673, 0, 0, 0, 1, 1,
-0.4362171, 0.4185339, -1.578722, 0, 0, 0, 1, 1,
-0.4349017, 0.9641923, -2.130914, 0, 0, 0, 1, 1,
-0.4326017, 1.53403, 0.2879775, 0, 0, 0, 1, 1,
-0.4263044, -0.7471955, -3.832805, 0, 0, 0, 1, 1,
-0.4256406, 1.199976, 0.005919732, 1, 1, 1, 1, 1,
-0.4247952, -0.4453438, -0.5041668, 1, 1, 1, 1, 1,
-0.4237933, 0.6052423, -0.5049638, 1, 1, 1, 1, 1,
-0.4236306, 0.1478005, -0.1839523, 1, 1, 1, 1, 1,
-0.4216419, -0.09134044, -2.433364, 1, 1, 1, 1, 1,
-0.4145911, -0.3164115, -4.050274, 1, 1, 1, 1, 1,
-0.4130655, 0.01223144, -2.676526, 1, 1, 1, 1, 1,
-0.4124171, 2.66627, 1.078506, 1, 1, 1, 1, 1,
-0.4113958, 0.6978413, 0.9892727, 1, 1, 1, 1, 1,
-0.4112867, 0.07360831, -0.8776975, 1, 1, 1, 1, 1,
-0.4105409, -0.2245014, -2.141167, 1, 1, 1, 1, 1,
-0.410328, -0.7892173, -3.358124, 1, 1, 1, 1, 1,
-0.4075441, 0.7378113, 0.2355556, 1, 1, 1, 1, 1,
-0.3982025, 0.8000224, -2.754725, 1, 1, 1, 1, 1,
-0.3973169, 0.03145882, -0.49466, 1, 1, 1, 1, 1,
-0.3971548, -0.1773417, -3.741416, 0, 0, 1, 1, 1,
-0.3902138, -0.7584082, -3.582231, 1, 0, 0, 1, 1,
-0.3840949, 0.6892121, -4.024911, 1, 0, 0, 1, 1,
-0.3838274, 1.535947, 0.1915661, 1, 0, 0, 1, 1,
-0.3833949, -0.6612913, -3.857283, 1, 0, 0, 1, 1,
-0.3807957, 0.2545207, -0.6403283, 1, 0, 0, 1, 1,
-0.3790704, -1.354104, -4.903963, 0, 0, 0, 1, 1,
-0.378617, 0.2357532, 0.5283515, 0, 0, 0, 1, 1,
-0.377682, 0.4805781, -0.6781331, 0, 0, 0, 1, 1,
-0.3755153, 0.3815988, -1.260586, 0, 0, 0, 1, 1,
-0.3729022, 0.06487527, -4.14498, 0, 0, 0, 1, 1,
-0.3715363, 0.8894411, -1.608726, 0, 0, 0, 1, 1,
-0.3673996, -0.1490077, -2.083353, 0, 0, 0, 1, 1,
-0.3643075, -1.043552, -2.534924, 1, 1, 1, 1, 1,
-0.3633766, -1.279362, -2.56184, 1, 1, 1, 1, 1,
-0.3628488, 0.2790873, -1.815784, 1, 1, 1, 1, 1,
-0.3624157, 1.136195, -0.04528615, 1, 1, 1, 1, 1,
-0.3619327, 0.7458352, 0.7281006, 1, 1, 1, 1, 1,
-0.3595316, -1.386515, -2.845132, 1, 1, 1, 1, 1,
-0.3582554, -0.03842915, -3.566354, 1, 1, 1, 1, 1,
-0.357756, 0.2684298, -0.5319343, 1, 1, 1, 1, 1,
-0.3500569, 0.0237967, -2.266998, 1, 1, 1, 1, 1,
-0.3500258, 3.06623, 0.6223603, 1, 1, 1, 1, 1,
-0.346625, 0.5199262, 0.2582347, 1, 1, 1, 1, 1,
-0.3440545, 0.780145, -0.1911763, 1, 1, 1, 1, 1,
-0.3355578, 1.145613, -1.104695, 1, 1, 1, 1, 1,
-0.3335791, 0.2472304, -0.5561182, 1, 1, 1, 1, 1,
-0.3293531, -0.3742761, -2.511602, 1, 1, 1, 1, 1,
-0.3285081, -1.589225, -2.9348, 0, 0, 1, 1, 1,
-0.3282408, 1.073832, -0.7066617, 1, 0, 0, 1, 1,
-0.3265642, -0.5275369, -3.950201, 1, 0, 0, 1, 1,
-0.3256392, -0.2013263, -2.641757, 1, 0, 0, 1, 1,
-0.3222524, 1.299996, -0.2191624, 1, 0, 0, 1, 1,
-0.3152147, 0.5931573, 1.18986, 1, 0, 0, 1, 1,
-0.3104164, 1.516699, -1.599706, 0, 0, 0, 1, 1,
-0.3011878, 0.3301542, 0.369946, 0, 0, 0, 1, 1,
-0.2987068, -2.212241, -1.349804, 0, 0, 0, 1, 1,
-0.295919, 2.253786, 0.5734851, 0, 0, 0, 1, 1,
-0.2954119, -0.938218, -2.140604, 0, 0, 0, 1, 1,
-0.2917216, -0.02717151, -1.366098, 0, 0, 0, 1, 1,
-0.2906726, -0.6960417, -2.670452, 0, 0, 0, 1, 1,
-0.2876472, 0.060594, 0.411201, 1, 1, 1, 1, 1,
-0.2862951, -0.2267997, -3.408966, 1, 1, 1, 1, 1,
-0.2849975, -0.2416892, -1.156804, 1, 1, 1, 1, 1,
-0.2815651, 0.1850574, -1.604648, 1, 1, 1, 1, 1,
-0.2785324, -0.3026933, -2.842492, 1, 1, 1, 1, 1,
-0.2775741, -1.546103, -3.16979, 1, 1, 1, 1, 1,
-0.2769845, 0.152653, 0.6574368, 1, 1, 1, 1, 1,
-0.2766861, 2.183127, -0.3519656, 1, 1, 1, 1, 1,
-0.2719532, 1.231246, 0.6296366, 1, 1, 1, 1, 1,
-0.2671901, 1.130146, -1.656141, 1, 1, 1, 1, 1,
-0.2564102, -0.712891, -1.097898, 1, 1, 1, 1, 1,
-0.2499745, -0.1108983, -2.004643, 1, 1, 1, 1, 1,
-0.2475941, -0.8281664, -0.651455, 1, 1, 1, 1, 1,
-0.2391812, -0.2165312, -2.87161, 1, 1, 1, 1, 1,
-0.2329933, -0.9318535, -3.684884, 1, 1, 1, 1, 1,
-0.2311368, 0.7703318, 0.4304527, 0, 0, 1, 1, 1,
-0.2273248, 1.314348, -1.258411, 1, 0, 0, 1, 1,
-0.2236715, 0.6892317, 0.000686095, 1, 0, 0, 1, 1,
-0.2215814, 2.225289, -0.291973, 1, 0, 0, 1, 1,
-0.2209992, 0.7485605, 0.1619122, 1, 0, 0, 1, 1,
-0.2169205, -0.00991324, -2.503164, 1, 0, 0, 1, 1,
-0.2118003, 0.7771679, -0.1545635, 0, 0, 0, 1, 1,
-0.2107182, 1.894831, -1.073255, 0, 0, 0, 1, 1,
-0.2033845, 0.1581023, -0.7085919, 0, 0, 0, 1, 1,
-0.1982285, 1.102276, -2.645358, 0, 0, 0, 1, 1,
-0.1962102, -0.6240199, -1.269155, 0, 0, 0, 1, 1,
-0.1939471, 2.056434, 0.7923197, 0, 0, 0, 1, 1,
-0.1933688, -0.2235244, -2.145832, 0, 0, 0, 1, 1,
-0.1923868, -0.7353508, -5.28971, 1, 1, 1, 1, 1,
-0.1923602, 1.188111, -0.4512639, 1, 1, 1, 1, 1,
-0.1922584, -0.4522372, -1.958629, 1, 1, 1, 1, 1,
-0.1896072, -0.0606779, -4.427393, 1, 1, 1, 1, 1,
-0.1863949, -1.042241, -2.53581, 1, 1, 1, 1, 1,
-0.1818773, 1.099687, -1.344123, 1, 1, 1, 1, 1,
-0.179942, -0.4941098, -2.443158, 1, 1, 1, 1, 1,
-0.1792418, -1.243745, -3.583434, 1, 1, 1, 1, 1,
-0.1781517, -0.7503051, -2.574773, 1, 1, 1, 1, 1,
-0.1745851, -0.5670946, -4.500226, 1, 1, 1, 1, 1,
-0.1723737, 0.1344873, -0.2865885, 1, 1, 1, 1, 1,
-0.1685811, -0.9780122, -1.877008, 1, 1, 1, 1, 1,
-0.1680038, -0.7322317, -2.215312, 1, 1, 1, 1, 1,
-0.1671976, 1.25518, 0.02544213, 1, 1, 1, 1, 1,
-0.164523, -0.2734412, -1.644972, 1, 1, 1, 1, 1,
-0.163607, -0.5153247, -2.991779, 0, 0, 1, 1, 1,
-0.1629807, -0.9337531, -1.950163, 1, 0, 0, 1, 1,
-0.1626824, 0.6097049, -0.1672679, 1, 0, 0, 1, 1,
-0.1613998, -0.5325631, -2.100651, 1, 0, 0, 1, 1,
-0.1591095, -1.052129, -4.273706, 1, 0, 0, 1, 1,
-0.1568175, -0.2873738, -3.729075, 1, 0, 0, 1, 1,
-0.1536138, 0.5913934, -0.3243649, 0, 0, 0, 1, 1,
-0.1511777, 0.7102017, -1.664198, 0, 0, 0, 1, 1,
-0.1483337, -0.6673267, -2.382818, 0, 0, 0, 1, 1,
-0.1473532, 0.4914889, 0.09801251, 0, 0, 0, 1, 1,
-0.1470786, 0.6701356, -1.593275, 0, 0, 0, 1, 1,
-0.145887, -0.3989243, -1.597084, 0, 0, 0, 1, 1,
-0.143181, 1.132897, -0.3366897, 0, 0, 0, 1, 1,
-0.1409253, -0.7132218, -2.89312, 1, 1, 1, 1, 1,
-0.1283439, -0.4148082, -3.25408, 1, 1, 1, 1, 1,
-0.1228617, 0.9964426, 1.301854, 1, 1, 1, 1, 1,
-0.1223406, -0.6440806, -3.746477, 1, 1, 1, 1, 1,
-0.1196193, -0.7382324, -2.645176, 1, 1, 1, 1, 1,
-0.1098232, -1.048036, -3.830199, 1, 1, 1, 1, 1,
-0.1077658, -0.5195469, -2.975164, 1, 1, 1, 1, 1,
-0.1037573, -0.6768675, -2.741307, 1, 1, 1, 1, 1,
-0.1028974, 0.6368589, -0.503475, 1, 1, 1, 1, 1,
-0.100727, -0.2177396, -2.282375, 1, 1, 1, 1, 1,
-0.0993316, 0.836081, 1.169071, 1, 1, 1, 1, 1,
-0.09918322, 0.142637, -1.396775, 1, 1, 1, 1, 1,
-0.09455762, -0.5981494, -2.068014, 1, 1, 1, 1, 1,
-0.09360893, 0.8339697, -0.5724643, 1, 1, 1, 1, 1,
-0.09041697, 0.4061424, 0.9768258, 1, 1, 1, 1, 1,
-0.09023049, 0.2085895, -0.688617, 0, 0, 1, 1, 1,
-0.08779552, 0.3540691, -1.09873, 1, 0, 0, 1, 1,
-0.0877106, 1.30804, -1.505459, 1, 0, 0, 1, 1,
-0.0856915, 0.2589097, 1.543011, 1, 0, 0, 1, 1,
-0.0833233, 0.04122823, -0.2637731, 1, 0, 0, 1, 1,
-0.08243029, -1.709892, -2.126134, 1, 0, 0, 1, 1,
-0.07604685, 0.3170949, 1.370508, 0, 0, 0, 1, 1,
-0.07400905, -1.637187, -4.449223, 0, 0, 0, 1, 1,
-0.0708035, -1.030666, -2.641228, 0, 0, 0, 1, 1,
-0.0703341, 0.8451828, -1.125586, 0, 0, 0, 1, 1,
-0.06952142, -0.9661326, -2.416036, 0, 0, 0, 1, 1,
-0.06930254, -0.4558835, -5.565047, 0, 0, 0, 1, 1,
-0.06838741, -0.3557189, -1.171323, 0, 0, 0, 1, 1,
-0.06659321, 1.841048, 0.3055728, 1, 1, 1, 1, 1,
-0.06141137, 0.8326148, 1.7459, 1, 1, 1, 1, 1,
-0.06125302, 2.469088, -1.337189, 1, 1, 1, 1, 1,
-0.05832978, 1.116932, -0.7333132, 1, 1, 1, 1, 1,
-0.05340011, 0.577928, 0.4623637, 1, 1, 1, 1, 1,
-0.05321229, -0.1723373, -1.711617, 1, 1, 1, 1, 1,
-0.04316646, -0.3153961, -1.588846, 1, 1, 1, 1, 1,
-0.03803336, -0.6771517, -2.248853, 1, 1, 1, 1, 1,
-0.03780754, -0.2651775, -2.337385, 1, 1, 1, 1, 1,
-0.03468838, -1.984448, -3.208034, 1, 1, 1, 1, 1,
-0.03296156, 1.148962, -0.1533471, 1, 1, 1, 1, 1,
-0.03021132, -1.071804, -4.483586, 1, 1, 1, 1, 1,
-0.02877387, -0.9821194, -4.040053, 1, 1, 1, 1, 1,
-0.02586313, -0.6219529, -2.818719, 1, 1, 1, 1, 1,
-0.02199339, 0.3290093, -0.9597432, 1, 1, 1, 1, 1,
-0.02009822, -1.143252, -3.653294, 0, 0, 1, 1, 1,
-0.0195677, 0.4913652, 1.260172, 1, 0, 0, 1, 1,
-0.01184972, 1.084763, 0.7909997, 1, 0, 0, 1, 1,
-0.008949413, -0.04050357, -3.938577, 1, 0, 0, 1, 1,
-0.008606891, -1.16476, -3.019261, 1, 0, 0, 1, 1,
-0.00491271, 1.397359, -0.5097324, 1, 0, 0, 1, 1,
-0.002970728, -0.6130908, -3.406314, 0, 0, 0, 1, 1,
-0.001839112, -0.6023068, -4.925431, 0, 0, 0, 1, 1,
-0.0003698114, 0.03654193, -1.134067, 0, 0, 0, 1, 1,
0.00120155, 0.3605372, -0.2026176, 0, 0, 0, 1, 1,
0.00318916, -0.614878, 1.836861, 0, 0, 0, 1, 1,
0.008642841, -0.06874797, 3.663133, 0, 0, 0, 1, 1,
0.01076051, -0.5577955, 3.639995, 0, 0, 0, 1, 1,
0.01085766, 2.163924, 1.000488, 1, 1, 1, 1, 1,
0.01150041, -0.3433878, 2.783447, 1, 1, 1, 1, 1,
0.01362799, 1.378245, 0.4035779, 1, 1, 1, 1, 1,
0.0142798, 0.0628097, 9.419115e-05, 1, 1, 1, 1, 1,
0.02134179, -0.02484181, 4.345842, 1, 1, 1, 1, 1,
0.02240916, 1.22063, 0.001268927, 1, 1, 1, 1, 1,
0.0256437, 1.458966, -0.002905335, 1, 1, 1, 1, 1,
0.0275468, 1.24446, 0.5937545, 1, 1, 1, 1, 1,
0.02755942, -0.02982184, 1.003236, 1, 1, 1, 1, 1,
0.0283038, -0.8934028, 4.72366, 1, 1, 1, 1, 1,
0.03058221, 0.7350526, 0.7323009, 1, 1, 1, 1, 1,
0.0328575, 0.3267913, -0.7178356, 1, 1, 1, 1, 1,
0.04241355, 0.2943685, 0.7511483, 1, 1, 1, 1, 1,
0.04457032, -0.08675651, 2.196726, 1, 1, 1, 1, 1,
0.05356365, -0.8513659, 1.487961, 1, 1, 1, 1, 1,
0.06192858, 1.498948, 1.012399, 0, 0, 1, 1, 1,
0.06379375, -0.3862246, 2.86655, 1, 0, 0, 1, 1,
0.06604094, 0.8958307, -0.3043914, 1, 0, 0, 1, 1,
0.07235833, 0.5151325, -0.7198096, 1, 0, 0, 1, 1,
0.07341252, 0.2102612, -0.8233632, 1, 0, 0, 1, 1,
0.0740158, -0.2601172, 2.425953, 1, 0, 0, 1, 1,
0.07403688, -1.1475, 3.269432, 0, 0, 0, 1, 1,
0.07414214, 1.387572, 1.378094, 0, 0, 0, 1, 1,
0.08064768, -0.3901513, 3.916855, 0, 0, 0, 1, 1,
0.08272208, 0.8025759, 0.7563245, 0, 0, 0, 1, 1,
0.08511308, -1.328494, 4.008474, 0, 0, 0, 1, 1,
0.08522732, -0.06036453, 2.358995, 0, 0, 0, 1, 1,
0.08599325, 2.510599, -0.1398386, 0, 0, 0, 1, 1,
0.08847856, 0.763473, -0.2374894, 1, 1, 1, 1, 1,
0.09046718, -0.1986297, 2.645319, 1, 1, 1, 1, 1,
0.0951553, 0.08214515, 0.4729082, 1, 1, 1, 1, 1,
0.1005324, -0.9191706, 2.364716, 1, 1, 1, 1, 1,
0.1127319, 0.1632806, 1.543875, 1, 1, 1, 1, 1,
0.1195885, 1.177889, -0.5872625, 1, 1, 1, 1, 1,
0.121422, 0.3980186, 0.4413811, 1, 1, 1, 1, 1,
0.1226092, -1.244501, 1.22642, 1, 1, 1, 1, 1,
0.1321157, 0.4520918, 0.8180529, 1, 1, 1, 1, 1,
0.1333035, 0.6228967, -0.5367538, 1, 1, 1, 1, 1,
0.1435977, 1.149874, -0.7705049, 1, 1, 1, 1, 1,
0.1438431, 0.8020142, 0.1604293, 1, 1, 1, 1, 1,
0.1442946, 0.9354233, 1.16809, 1, 1, 1, 1, 1,
0.1452194, -0.6494765, 3.42003, 1, 1, 1, 1, 1,
0.1463329, 1.696926, 1.132043, 1, 1, 1, 1, 1,
0.1564879, -2.552994, 3.80057, 0, 0, 1, 1, 1,
0.1608968, 0.200513, 1.42516, 1, 0, 0, 1, 1,
0.1638865, -2.228736, 3.802738, 1, 0, 0, 1, 1,
0.1684714, -1.804763, 2.907133, 1, 0, 0, 1, 1,
0.1701242, 0.3466659, -0.4577201, 1, 0, 0, 1, 1,
0.1717046, 0.2437241, -0.2212055, 1, 0, 0, 1, 1,
0.1722489, 2.90585, 1.531108, 0, 0, 0, 1, 1,
0.1741878, -0.7629494, 2.342888, 0, 0, 0, 1, 1,
0.1765055, -1.083892, 4.098954, 0, 0, 0, 1, 1,
0.1766073, 0.7715263, -1.352635, 0, 0, 0, 1, 1,
0.1816037, 0.9146424, 1.100472, 0, 0, 0, 1, 1,
0.1834235, -0.5676275, 1.987644, 0, 0, 0, 1, 1,
0.1852277, 0.4911846, -1.212565, 0, 0, 0, 1, 1,
0.1884158, -0.9221014, 2.05589, 1, 1, 1, 1, 1,
0.1886271, 1.809805, 0.3736291, 1, 1, 1, 1, 1,
0.1887828, -0.9453723, 2.948121, 1, 1, 1, 1, 1,
0.189682, -0.6062943, 2.867294, 1, 1, 1, 1, 1,
0.189922, -2.31079, 3.603791, 1, 1, 1, 1, 1,
0.1938285, 0.7344109, -0.06193423, 1, 1, 1, 1, 1,
0.194929, 0.2602276, 1.120569, 1, 1, 1, 1, 1,
0.2039971, 0.1355657, -0.1769822, 1, 1, 1, 1, 1,
0.2052581, 0.03178572, 1.029414, 1, 1, 1, 1, 1,
0.2055478, 0.8922679, 1.592401, 1, 1, 1, 1, 1,
0.2110536, 0.4355823, 1.109004, 1, 1, 1, 1, 1,
0.2165625, 1.430143, -0.7474479, 1, 1, 1, 1, 1,
0.2220224, -0.01564918, 2.033115, 1, 1, 1, 1, 1,
0.2273434, 0.5540544, 0.4526333, 1, 1, 1, 1, 1,
0.2287088, 2.292486, -0.1772798, 1, 1, 1, 1, 1,
0.2318276, -2.518613, 3.734508, 0, 0, 1, 1, 1,
0.2357456, -0.1799172, 0.4971553, 1, 0, 0, 1, 1,
0.2366007, -1.915379, 2.080041, 1, 0, 0, 1, 1,
0.2386181, 0.1219698, 0.6418151, 1, 0, 0, 1, 1,
0.2415369, 0.2152567, -0.02594746, 1, 0, 0, 1, 1,
0.2425777, -0.7774219, 2.917331, 1, 0, 0, 1, 1,
0.2442338, -1.141864, 2.398176, 0, 0, 0, 1, 1,
0.2451858, 0.03522104, 2.940943, 0, 0, 0, 1, 1,
0.2471564, 1.383869, 1.172614, 0, 0, 0, 1, 1,
0.2508785, -0.3737987, 3.107956, 0, 0, 0, 1, 1,
0.2546278, 0.2266356, 1.431999, 0, 0, 0, 1, 1,
0.2548614, 0.01944122, -0.5398229, 0, 0, 0, 1, 1,
0.2559532, 0.03722164, -0.2627954, 0, 0, 0, 1, 1,
0.260735, -0.2497225, 3.015953, 1, 1, 1, 1, 1,
0.2656944, 0.3128223, 0.968906, 1, 1, 1, 1, 1,
0.2663272, -0.6105174, 3.393795, 1, 1, 1, 1, 1,
0.2761876, -0.7578239, 1.714106, 1, 1, 1, 1, 1,
0.2857666, -0.121672, 1.497946, 1, 1, 1, 1, 1,
0.2882104, -0.2723207, 3.74098, 1, 1, 1, 1, 1,
0.2967668, -0.9666885, 2.352743, 1, 1, 1, 1, 1,
0.2983901, 0.4838033, 0.2049887, 1, 1, 1, 1, 1,
0.3001502, 0.4062418, 1.483057, 1, 1, 1, 1, 1,
0.3041221, 0.4032508, 0.6139109, 1, 1, 1, 1, 1,
0.3046972, 0.9107226, 0.6311131, 1, 1, 1, 1, 1,
0.306407, -0.1871015, 3.772185, 1, 1, 1, 1, 1,
0.3088712, 0.5567017, 0.5365868, 1, 1, 1, 1, 1,
0.3123158, 0.6613283, 0.07362279, 1, 1, 1, 1, 1,
0.3175316, -0.1903201, 3.56607, 1, 1, 1, 1, 1,
0.3179907, 0.6873518, 0.2788973, 0, 0, 1, 1, 1,
0.3183257, -1.540134, 4.683095, 1, 0, 0, 1, 1,
0.3207015, 0.6457945, 0.04667143, 1, 0, 0, 1, 1,
0.3289165, 1.260493, 0.1423609, 1, 0, 0, 1, 1,
0.3296659, 1.344609, -1.066299, 1, 0, 0, 1, 1,
0.3296726, -1.606925, 1.669399, 1, 0, 0, 1, 1,
0.3298333, -1.537802, 1.828843, 0, 0, 0, 1, 1,
0.3315575, -1.135319, 3.782218, 0, 0, 0, 1, 1,
0.3327988, 0.123261, 0.2161827, 0, 0, 0, 1, 1,
0.3347682, 0.6523518, 0.6878645, 0, 0, 0, 1, 1,
0.3374859, -1.467892, 7.44233, 0, 0, 0, 1, 1,
0.3376884, -1.647437, 3.595415, 0, 0, 0, 1, 1,
0.3395973, 0.2317493, 2.523153, 0, 0, 0, 1, 1,
0.3546191, 0.5765316, -0.5374919, 1, 1, 1, 1, 1,
0.3560764, -0.5265142, 3.627393, 1, 1, 1, 1, 1,
0.3586354, -1.011336, 1.30594, 1, 1, 1, 1, 1,
0.3591484, 0.6341801, 0.8758649, 1, 1, 1, 1, 1,
0.3626242, 0.5631765, -1.622826, 1, 1, 1, 1, 1,
0.3628966, 0.7374952, 1.868221, 1, 1, 1, 1, 1,
0.3654744, -0.01082018, 2.379811, 1, 1, 1, 1, 1,
0.3680338, 0.05582664, 3.54336, 1, 1, 1, 1, 1,
0.3697733, 0.1062183, -0.3751155, 1, 1, 1, 1, 1,
0.3706063, -0.9012749, 2.565274, 1, 1, 1, 1, 1,
0.3723666, 1.017886, 1.848849, 1, 1, 1, 1, 1,
0.3788847, 0.2398565, 1.792524, 1, 1, 1, 1, 1,
0.3793062, -0.8095533, 1.912648, 1, 1, 1, 1, 1,
0.3794404, 0.215253, 0.5507612, 1, 1, 1, 1, 1,
0.3838996, 0.1705934, 2.009698, 1, 1, 1, 1, 1,
0.3911142, -1.21526, 3.440913, 0, 0, 1, 1, 1,
0.3916878, -0.2324533, 0.6810011, 1, 0, 0, 1, 1,
0.3920553, -1.317289, 2.430122, 1, 0, 0, 1, 1,
0.392449, -2.839547, 2.046804, 1, 0, 0, 1, 1,
0.393729, 1.033449, 0.4304709, 1, 0, 0, 1, 1,
0.394622, -1.896421, 1.583712, 1, 0, 0, 1, 1,
0.4030344, 0.5166805, 0.1755823, 0, 0, 0, 1, 1,
0.4068988, 0.3873539, 0.7250414, 0, 0, 0, 1, 1,
0.4074129, 1.314675, -0.1633578, 0, 0, 0, 1, 1,
0.4078886, -0.3884694, 1.707132, 0, 0, 0, 1, 1,
0.4163162, 2.525829, -0.5819951, 0, 0, 0, 1, 1,
0.4206433, 0.3754218, 0.3285986, 0, 0, 0, 1, 1,
0.4251066, 1.1982, -0.2543328, 0, 0, 0, 1, 1,
0.4279814, 0.1551277, 1.71497, 1, 1, 1, 1, 1,
0.4284593, 0.6812224, 2.427232, 1, 1, 1, 1, 1,
0.4284637, -2.235315, 2.97306, 1, 1, 1, 1, 1,
0.4293237, 1.171943, 1.045539, 1, 1, 1, 1, 1,
0.4316633, 0.09748427, 1.399405, 1, 1, 1, 1, 1,
0.4332932, -0.732446, 1.208138, 1, 1, 1, 1, 1,
0.4333566, -1.338656, 1.160526, 1, 1, 1, 1, 1,
0.4427223, -0.232762, 1.416537, 1, 1, 1, 1, 1,
0.4429652, 0.7142279, 1.235417, 1, 1, 1, 1, 1,
0.4454568, 2.020425, -0.6279895, 1, 1, 1, 1, 1,
0.4455779, -0.2383474, 0.9092121, 1, 1, 1, 1, 1,
0.4573482, 0.4713506, 0.2523556, 1, 1, 1, 1, 1,
0.4583052, -0.551568, 2.824647, 1, 1, 1, 1, 1,
0.4598264, -0.5929896, 2.590124, 1, 1, 1, 1, 1,
0.461917, -0.3771609, 2.185307, 1, 1, 1, 1, 1,
0.4689554, -0.5806855, 3.83242, 0, 0, 1, 1, 1,
0.4716069, 0.1425731, 1.135874, 1, 0, 0, 1, 1,
0.476882, 0.08676036, 3.067122, 1, 0, 0, 1, 1,
0.4781276, 1.181858, -1.404019, 1, 0, 0, 1, 1,
0.4781513, 1.371222, -1.165867, 1, 0, 0, 1, 1,
0.4809943, -3.160232, 2.271119, 1, 0, 0, 1, 1,
0.4828506, -0.6119888, 3.108812, 0, 0, 0, 1, 1,
0.4871275, -1.219197, 1.610799, 0, 0, 0, 1, 1,
0.4898594, 1.270404, -2.030013, 0, 0, 0, 1, 1,
0.4959755, -0.2944566, 0.893691, 0, 0, 0, 1, 1,
0.4968256, 1.025807, 0.5812775, 0, 0, 0, 1, 1,
0.497826, 0.9015006, 0.1918081, 0, 0, 0, 1, 1,
0.4988425, 0.3641624, -0.423194, 0, 0, 0, 1, 1,
0.5068567, 0.09841184, 2.413738, 1, 1, 1, 1, 1,
0.5091181, -0.4924215, 2.264918, 1, 1, 1, 1, 1,
0.512527, 0.6324154, 0.3426429, 1, 1, 1, 1, 1,
0.5126752, 0.1420833, 1.715097, 1, 1, 1, 1, 1,
0.5150678, 0.139931, 1.099354, 1, 1, 1, 1, 1,
0.5171013, 0.9743086, 1.13368, 1, 1, 1, 1, 1,
0.5209812, 0.7970408, 0.9004887, 1, 1, 1, 1, 1,
0.5306067, 0.001516777, 2.733845, 1, 1, 1, 1, 1,
0.5333891, -1.347737, 4.883878, 1, 1, 1, 1, 1,
0.5370418, -0.8345078, 2.460909, 1, 1, 1, 1, 1,
0.5379089, -1.052226, 2.860036, 1, 1, 1, 1, 1,
0.5423015, 1.812447, -0.4075733, 1, 1, 1, 1, 1,
0.543709, 0.1409478, 0.5498745, 1, 1, 1, 1, 1,
0.5451715, 1.00085, -0.9281172, 1, 1, 1, 1, 1,
0.547811, 0.3523352, -0.6354052, 1, 1, 1, 1, 1,
0.5537049, -0.4019163, 1.762286, 0, 0, 1, 1, 1,
0.5545616, -1.970826, 2.94289, 1, 0, 0, 1, 1,
0.5637379, 1.000843, -0.6925593, 1, 0, 0, 1, 1,
0.5653175, -0.5894145, 0.4139988, 1, 0, 0, 1, 1,
0.5666286, -0.5682827, -0.3316498, 1, 0, 0, 1, 1,
0.5680444, 1.069654, 1.920904, 1, 0, 0, 1, 1,
0.5708857, -0.9113067, 2.163466, 0, 0, 0, 1, 1,
0.5711854, 1.037335, 1.056595, 0, 0, 0, 1, 1,
0.5757515, 1.194488, -0.08375125, 0, 0, 0, 1, 1,
0.5770026, 0.6047123, 1.275214, 0, 0, 0, 1, 1,
0.5804887, 0.4568357, 0.8386021, 0, 0, 0, 1, 1,
0.5832978, 1.055288, 1.248641, 0, 0, 0, 1, 1,
0.584446, 1.205025, -0.02765477, 0, 0, 0, 1, 1,
0.5873033, -0.5682355, 2.472442, 1, 1, 1, 1, 1,
0.5901711, -0.415094, 1.269377, 1, 1, 1, 1, 1,
0.5930414, -0.7383239, 1.680392, 1, 1, 1, 1, 1,
0.5950471, -0.6347045, 1.216037, 1, 1, 1, 1, 1,
0.5958405, 2.017004, 0.6879984, 1, 1, 1, 1, 1,
0.5976531, 1.271606, -0.1200927, 1, 1, 1, 1, 1,
0.5998339, -0.5865569, 3.706524, 1, 1, 1, 1, 1,
0.6004078, 0.4816889, 1.666947, 1, 1, 1, 1, 1,
0.6021625, -1.48423, 1.653007, 1, 1, 1, 1, 1,
0.6036465, -0.4344712, 1.348602, 1, 1, 1, 1, 1,
0.6041467, 1.966741, 1.756729, 1, 1, 1, 1, 1,
0.6059623, 0.8983771, 2.049261, 1, 1, 1, 1, 1,
0.611714, -0.01883701, 1.697276, 1, 1, 1, 1, 1,
0.6118808, 0.3554583, 1.618759, 1, 1, 1, 1, 1,
0.6129382, -0.8365131, 1.066635, 1, 1, 1, 1, 1,
0.6131825, 1.293411, 1.310353, 0, 0, 1, 1, 1,
0.6135526, -0.5502201, 2.781943, 1, 0, 0, 1, 1,
0.6170552, -0.2138437, 0.3144045, 1, 0, 0, 1, 1,
0.6172761, -0.372455, 2.594131, 1, 0, 0, 1, 1,
0.6197836, -0.1253374, 3.96849, 1, 0, 0, 1, 1,
0.6225958, 0.9699908, -0.2326794, 1, 0, 0, 1, 1,
0.6231866, -1.656138, 4.018957, 0, 0, 0, 1, 1,
0.6278429, 0.338976, 1.005759, 0, 0, 0, 1, 1,
0.6297624, -0.2356724, 2.10867, 0, 0, 0, 1, 1,
0.630697, 0.2844293, 1.783302, 0, 0, 0, 1, 1,
0.6337767, 0.5716557, 0.1654549, 0, 0, 0, 1, 1,
0.6346048, -0.07421856, 2.524775, 0, 0, 0, 1, 1,
0.6359021, -1.060809, 1.132742, 0, 0, 0, 1, 1,
0.6395096, -2.247242, 3.788688, 1, 1, 1, 1, 1,
0.640902, -0.7690949, 1.872504, 1, 1, 1, 1, 1,
0.6533992, 1.211883, 0.5154837, 1, 1, 1, 1, 1,
0.6575062, -0.5795079, 1.887387, 1, 1, 1, 1, 1,
0.662735, 0.6963973, -0.06991193, 1, 1, 1, 1, 1,
0.6628041, 0.8996944, 2.545785, 1, 1, 1, 1, 1,
0.6720836, 0.7322872, 3.102814, 1, 1, 1, 1, 1,
0.6726204, 0.4113439, 1.800005, 1, 1, 1, 1, 1,
0.6754977, -0.06965972, 1.918889, 1, 1, 1, 1, 1,
0.6777749, -2.06329, 3.944149, 1, 1, 1, 1, 1,
0.6868855, -0.2801149, 2.58056, 1, 1, 1, 1, 1,
0.688317, 2.647609, 0.9323277, 1, 1, 1, 1, 1,
0.6889869, -0.1822992, 0.3706935, 1, 1, 1, 1, 1,
0.6934952, 0.1809328, 0.7311699, 1, 1, 1, 1, 1,
0.6936693, 0.123999, 1.715269, 1, 1, 1, 1, 1,
0.6940693, 1.629522, 0.1618728, 0, 0, 1, 1, 1,
0.694319, 0.4012171, 0.2421896, 1, 0, 0, 1, 1,
0.6970685, 1.938437, -1.626967, 1, 0, 0, 1, 1,
0.6988631, 0.3807445, -1.515978, 1, 0, 0, 1, 1,
0.6989519, -0.8531877, 2.799686, 1, 0, 0, 1, 1,
0.7053781, 1.079321, 1.059372, 1, 0, 0, 1, 1,
0.7075422, -0.3858923, 1.3245, 0, 0, 0, 1, 1,
0.7089972, 0.08502109, 1.328748, 0, 0, 0, 1, 1,
0.710075, -0.5389782, 1.646469, 0, 0, 0, 1, 1,
0.732374, -0.8547832, 3.743417, 0, 0, 0, 1, 1,
0.7364162, 2.07733, 0.1872594, 0, 0, 0, 1, 1,
0.7406539, -0.1137704, 1.068322, 0, 0, 0, 1, 1,
0.7466114, 0.03857641, 1.109697, 0, 0, 0, 1, 1,
0.7506526, 0.1820879, 1.844079, 1, 1, 1, 1, 1,
0.7507931, 0.3391769, 1.814092, 1, 1, 1, 1, 1,
0.751403, 1.41303, 0.8529103, 1, 1, 1, 1, 1,
0.7527205, 0.4125831, 2.515723, 1, 1, 1, 1, 1,
0.7681919, 0.1060821, 0.6748121, 1, 1, 1, 1, 1,
0.7782955, 0.2544833, 1.405148, 1, 1, 1, 1, 1,
0.780644, 1.415733, 1.305516, 1, 1, 1, 1, 1,
0.7813815, -0.1116652, 0.6756519, 1, 1, 1, 1, 1,
0.7869239, -1.120962, 2.304407, 1, 1, 1, 1, 1,
0.7871727, -1.465428, 1.921895, 1, 1, 1, 1, 1,
0.788491, -0.6924728, 1.622359, 1, 1, 1, 1, 1,
0.791835, 1.610279, -0.1618209, 1, 1, 1, 1, 1,
0.7930657, -0.8920522, 5.68471, 1, 1, 1, 1, 1,
0.7953038, 1.195185, 0.01577811, 1, 1, 1, 1, 1,
0.7983136, 0.814913, 1.664234, 1, 1, 1, 1, 1,
0.8008436, 0.6799319, 0.5830362, 0, 0, 1, 1, 1,
0.8023836, -0.3519823, 2.442636, 1, 0, 0, 1, 1,
0.8093706, -0.02753889, 0.1043712, 1, 0, 0, 1, 1,
0.8111124, -1.088699, 2.932121, 1, 0, 0, 1, 1,
0.8118159, 0.5890005, 1.011498, 1, 0, 0, 1, 1,
0.8124625, 0.1106776, -0.3714844, 1, 0, 0, 1, 1,
0.8162447, -0.2903417, 1.053391, 0, 0, 0, 1, 1,
0.8164518, -0.7121837, 2.478808, 0, 0, 0, 1, 1,
0.8295607, 2.136456, 2.216484, 0, 0, 0, 1, 1,
0.8461917, 0.7634398, 2.337714, 0, 0, 0, 1, 1,
0.8478469, 0.6573939, 0.7776222, 0, 0, 0, 1, 1,
0.8515369, -0.9870819, 3.326261, 0, 0, 0, 1, 1,
0.8560702, -0.7244636, 1.840763, 0, 0, 0, 1, 1,
0.8595542, -0.3450373, 2.632716, 1, 1, 1, 1, 1,
0.8603555, 0.7638553, 0.01634347, 1, 1, 1, 1, 1,
0.8628024, -0.3646027, 1.819734, 1, 1, 1, 1, 1,
0.8636442, -1.952456, 3.375205, 1, 1, 1, 1, 1,
0.8654339, -1.476402, 1.357897, 1, 1, 1, 1, 1,
0.8701582, 2.762969, -0.6623853, 1, 1, 1, 1, 1,
0.8718261, 2.091891, 0.5546771, 1, 1, 1, 1, 1,
0.8811514, -0.2158112, 3.414327, 1, 1, 1, 1, 1,
0.8831428, -0.5527832, 3.033397, 1, 1, 1, 1, 1,
0.8869848, 0.5545666, 1.207286, 1, 1, 1, 1, 1,
0.8877636, -1.633094, 2.506887, 1, 1, 1, 1, 1,
0.8939099, -0.2773805, 1.32355, 1, 1, 1, 1, 1,
0.9012842, 0.2560805, 1.900961, 1, 1, 1, 1, 1,
0.901531, 0.4908278, 0.4903117, 1, 1, 1, 1, 1,
0.9019465, 0.2099936, 2.502144, 1, 1, 1, 1, 1,
0.9087202, -0.0581249, 1.22838, 0, 0, 1, 1, 1,
0.9114394, 0.6079738, 2.574506, 1, 0, 0, 1, 1,
0.9115815, 0.08826368, -0.3818026, 1, 0, 0, 1, 1,
0.9131169, 1.135675, -1.227055, 1, 0, 0, 1, 1,
0.9233799, -1.085016, 1.00529, 1, 0, 0, 1, 1,
0.9286668, -2.338573, 3.719682, 1, 0, 0, 1, 1,
0.9288214, 0.8593413, 1.741521, 0, 0, 0, 1, 1,
0.9305134, -1.033486, 1.822032, 0, 0, 0, 1, 1,
0.9309428, 1.672195, -0.7657908, 0, 0, 0, 1, 1,
0.9355975, -0.3775038, 2.098885, 0, 0, 0, 1, 1,
0.9372752, -0.3946956, 2.950332, 0, 0, 0, 1, 1,
0.9408114, -0.7712376, 3.254568, 0, 0, 0, 1, 1,
0.9453056, -1.112679, 2.23545, 0, 0, 0, 1, 1,
0.9490211, 1.1293, 1.745272, 1, 1, 1, 1, 1,
0.9564558, -0.1908374, 2.700468, 1, 1, 1, 1, 1,
0.9612907, -0.7408775, 2.89454, 1, 1, 1, 1, 1,
0.9692718, -0.8532357, 0.9389222, 1, 1, 1, 1, 1,
0.9714026, -0.3527462, 2.764799, 1, 1, 1, 1, 1,
0.9715017, 0.9652548, 1.467564, 1, 1, 1, 1, 1,
0.976935, 0.3020834, 1.400798, 1, 1, 1, 1, 1,
0.9793574, -0.920108, 2.763936, 1, 1, 1, 1, 1,
0.987152, -1.14658, 2.429903, 1, 1, 1, 1, 1,
0.9902208, -0.3853666, 2.801401, 1, 1, 1, 1, 1,
0.9930615, 0.05862701, 3.407083, 1, 1, 1, 1, 1,
0.9983846, -1.365482, 2.896961, 1, 1, 1, 1, 1,
1.002226, -0.2806796, 0.2938364, 1, 1, 1, 1, 1,
1.01312, 0.3317105, 0.6248797, 1, 1, 1, 1, 1,
1.018622, 0.7625156, 1.195707, 1, 1, 1, 1, 1,
1.020638, -1.072552, 1.988451, 0, 0, 1, 1, 1,
1.025242, -2.002832, 1.423277, 1, 0, 0, 1, 1,
1.033237, -1.796665, 2.061799, 1, 0, 0, 1, 1,
1.03757, -1.082278, 3.763204, 1, 0, 0, 1, 1,
1.043242, -0.3305285, 0.4257995, 1, 0, 0, 1, 1,
1.04576, -1.745212, 1.481761, 1, 0, 0, 1, 1,
1.048228, 2.80223, 1.217852, 0, 0, 0, 1, 1,
1.052646, -0.5525903, 1.780625, 0, 0, 0, 1, 1,
1.053419, 0.1329403, 3.885505, 0, 0, 0, 1, 1,
1.057391, 3.120606, 0.7187877, 0, 0, 0, 1, 1,
1.058883, 0.2521522, 0.4115485, 0, 0, 0, 1, 1,
1.061263, -0.4173393, 2.105143, 0, 0, 0, 1, 1,
1.063297, 1.663786, -0.3372907, 0, 0, 0, 1, 1,
1.068941, 1.244278, 0.3921347, 1, 1, 1, 1, 1,
1.087702, -0.4927633, 1.388978, 1, 1, 1, 1, 1,
1.088638, -1.632917, 2.777799, 1, 1, 1, 1, 1,
1.092956, -0.01412027, 1.640585, 1, 1, 1, 1, 1,
1.093567, -1.115859, 3.19871, 1, 1, 1, 1, 1,
1.095216, -0.01649816, 1.897494, 1, 1, 1, 1, 1,
1.099491, 1.685843, -1.241135, 1, 1, 1, 1, 1,
1.106075, -0.7051643, 3.81712, 1, 1, 1, 1, 1,
1.106951, 1.134999, 0.3607021, 1, 1, 1, 1, 1,
1.109431, 0.1763446, 3.844683, 1, 1, 1, 1, 1,
1.111746, 1.31739, 0.1194916, 1, 1, 1, 1, 1,
1.114504, 0.3669255, 1.78588, 1, 1, 1, 1, 1,
1.117219, -0.1302698, 1.095104, 1, 1, 1, 1, 1,
1.118464, -0.3245219, 4.690267, 1, 1, 1, 1, 1,
1.120297, 0.7132411, 0.1357405, 1, 1, 1, 1, 1,
1.12215, 1.645571, 0.4425625, 0, 0, 1, 1, 1,
1.12768, 0.4585793, 1.108311, 1, 0, 0, 1, 1,
1.12795, 0.1972506, 0.3099229, 1, 0, 0, 1, 1,
1.138727, 1.404956, 0.04084107, 1, 0, 0, 1, 1,
1.140449, -0.171696, 0.7266048, 1, 0, 0, 1, 1,
1.141032, 1.248217, -0.2606991, 1, 0, 0, 1, 1,
1.143353, 0.2461521, 1.466411, 0, 0, 0, 1, 1,
1.145541, 2.03988, 0.3998344, 0, 0, 0, 1, 1,
1.145968, 0.4884706, 1.044107, 0, 0, 0, 1, 1,
1.151438, -1.177077, 2.391671, 0, 0, 0, 1, 1,
1.15226, 0.8531939, 0.7331823, 0, 0, 0, 1, 1,
1.162815, 0.6909985, 1.642731, 0, 0, 0, 1, 1,
1.184235, -0.5809523, 1.368533, 0, 0, 0, 1, 1,
1.185544, 1.20923, 0.7852693, 1, 1, 1, 1, 1,
1.188796, 0.2764875, 2.600197, 1, 1, 1, 1, 1,
1.194107, 1.838291, 0.05577556, 1, 1, 1, 1, 1,
1.201405, 0.3043205, 1.126659, 1, 1, 1, 1, 1,
1.204211, -0.1201932, 2.525934, 1, 1, 1, 1, 1,
1.221942, 1.501643, 0.8758348, 1, 1, 1, 1, 1,
1.222034, 1.134908, -0.1929341, 1, 1, 1, 1, 1,
1.223861, -0.5844731, 3.479872, 1, 1, 1, 1, 1,
1.225401, 0.8101785, 1.550352, 1, 1, 1, 1, 1,
1.22822, -0.4732053, -0.7532358, 1, 1, 1, 1, 1,
1.230905, 0.8331881, 1.119142, 1, 1, 1, 1, 1,
1.232127, -1.904988, 0.1724737, 1, 1, 1, 1, 1,
1.235448, 1.941201, 0.9790902, 1, 1, 1, 1, 1,
1.241585, -0.4698928, 0.8820843, 1, 1, 1, 1, 1,
1.24683, 1.015604, 0.2402952, 1, 1, 1, 1, 1,
1.253625, 2.848811, -0.1405325, 0, 0, 1, 1, 1,
1.254658, -0.1242244, 2.263162, 1, 0, 0, 1, 1,
1.260334, 0.7252425, 2.205751, 1, 0, 0, 1, 1,
1.264639, -1.683909, 2.647605, 1, 0, 0, 1, 1,
1.274343, 0.6125797, 1.1546, 1, 0, 0, 1, 1,
1.278292, -0.09560636, 4.614344, 1, 0, 0, 1, 1,
1.283432, 0.1330045, -0.6254371, 0, 0, 0, 1, 1,
1.286601, -0.8205229, 1.056319, 0, 0, 0, 1, 1,
1.289307, 0.7204469, 1.29615, 0, 0, 0, 1, 1,
1.289947, -0.7827127, 3.029093, 0, 0, 0, 1, 1,
1.308711, -1.753299, 3.378992, 0, 0, 0, 1, 1,
1.310455, 1.484312, 0.4263389, 0, 0, 0, 1, 1,
1.310519, 0.4067055, 1.221383, 0, 0, 0, 1, 1,
1.313911, -2.715075, 3.465866, 1, 1, 1, 1, 1,
1.329394, 1.374942, -0.3492864, 1, 1, 1, 1, 1,
1.334666, -0.7921313, 1.321841, 1, 1, 1, 1, 1,
1.33927, 1.675389, 0.7589304, 1, 1, 1, 1, 1,
1.341607, 0.4711908, 0.5330129, 1, 1, 1, 1, 1,
1.347248, -0.01265022, 0.6487043, 1, 1, 1, 1, 1,
1.361951, -1.217236, 2.669484, 1, 1, 1, 1, 1,
1.385134, -0.8237813, 0.8247502, 1, 1, 1, 1, 1,
1.385432, -0.6285734, 3.99264, 1, 1, 1, 1, 1,
1.386105, -0.4078636, 1.69042, 1, 1, 1, 1, 1,
1.395415, 0.4386617, 1.886016, 1, 1, 1, 1, 1,
1.403922, 0.8491849, 0.6508863, 1, 1, 1, 1, 1,
1.416404, 1.890935, 0.113517, 1, 1, 1, 1, 1,
1.425172, -0.6464075, 1.849337, 1, 1, 1, 1, 1,
1.426699, -0.8437406, 1.422926, 1, 1, 1, 1, 1,
1.431112, 0.3428923, 1.613683, 0, 0, 1, 1, 1,
1.433191, -0.2181252, 3.027122, 1, 0, 0, 1, 1,
1.455135, 0.2480073, 2.226439, 1, 0, 0, 1, 1,
1.459698, 0.3104511, 0.6217682, 1, 0, 0, 1, 1,
1.463705, -0.9541637, 0.8674048, 1, 0, 0, 1, 1,
1.468036, -1.493293, 2.918769, 1, 0, 0, 1, 1,
1.469224, 2.186064, 0.1222409, 0, 0, 0, 1, 1,
1.470831, 0.7589153, 0.1617706, 0, 0, 0, 1, 1,
1.484013, -1.368077, 0.861893, 0, 0, 0, 1, 1,
1.486497, -0.4789581, 1.79973, 0, 0, 0, 1, 1,
1.494485, 0.3455207, 1.498368, 0, 0, 0, 1, 1,
1.515162, 0.135741, 1.738518, 0, 0, 0, 1, 1,
1.520814, -0.1320948, 2.669106, 0, 0, 0, 1, 1,
1.52843, -0.5992272, 1.960932, 1, 1, 1, 1, 1,
1.533376, -1.46508, 1.224277, 1, 1, 1, 1, 1,
1.533728, 1.121447, 0.6307358, 1, 1, 1, 1, 1,
1.579275, 1.165689, 0.4323792, 1, 1, 1, 1, 1,
1.580553, 0.3584743, 0.6969617, 1, 1, 1, 1, 1,
1.581271, -1.13209, 1.858085, 1, 1, 1, 1, 1,
1.598157, 0.5590421, 1.117189, 1, 1, 1, 1, 1,
1.630071, 0.8354562, -0.1123229, 1, 1, 1, 1, 1,
1.631593, 0.9946776, 1.06104, 1, 1, 1, 1, 1,
1.652411, 0.5074469, 0.4857019, 1, 1, 1, 1, 1,
1.672162, 1.247781, 1.411323, 1, 1, 1, 1, 1,
1.672222, -0.5921156, 0.800764, 1, 1, 1, 1, 1,
1.673578, -1.394252, 2.296515, 1, 1, 1, 1, 1,
1.674104, -0.004862321, 1.809819, 1, 1, 1, 1, 1,
1.67496, 0.6504775, 0.7709033, 1, 1, 1, 1, 1,
1.681355, 2.218718, -0.1691486, 0, 0, 1, 1, 1,
1.691283, -1.842648, 2.889969, 1, 0, 0, 1, 1,
1.706037, 0.3882307, 2.97434, 1, 0, 0, 1, 1,
1.706609, -0.7909964, 1.565169, 1, 0, 0, 1, 1,
1.710882, -1.201881, 2.298165, 1, 0, 0, 1, 1,
1.719777, -1.989912, 0.9231922, 1, 0, 0, 1, 1,
1.724225, 1.372449, 2.074125, 0, 0, 0, 1, 1,
1.726256, -0.5901656, 2.278625, 0, 0, 0, 1, 1,
1.735862, 0.1114461, 3.560481, 0, 0, 0, 1, 1,
1.762116, -0.1364262, 1.319031, 0, 0, 0, 1, 1,
1.781007, -0.05585494, 2.108872, 0, 0, 0, 1, 1,
1.825128, 0.3664282, 3.072201, 0, 0, 0, 1, 1,
1.838255, 0.1063478, 1.603672, 0, 0, 0, 1, 1,
1.842026, 0.2284464, 1.897047, 1, 1, 1, 1, 1,
1.843461, 1.396598, 1.809698, 1, 1, 1, 1, 1,
1.850455, 0.2366544, 2.055298, 1, 1, 1, 1, 1,
1.854233, -0.8783127, 2.692257, 1, 1, 1, 1, 1,
1.872633, 0.6193624, 0.5205873, 1, 1, 1, 1, 1,
1.91117, -0.002121469, 0.6779917, 1, 1, 1, 1, 1,
1.928056, -0.5069273, 0.9860428, 1, 1, 1, 1, 1,
1.933634, -0.626325, 1.307344, 1, 1, 1, 1, 1,
1.943429, 0.6262197, 1.158159, 1, 1, 1, 1, 1,
1.963187, 0.301742, 0.7710909, 1, 1, 1, 1, 1,
1.965627, -0.07041466, 1.336303, 1, 1, 1, 1, 1,
1.981858, 0.6860124, 1.544958, 1, 1, 1, 1, 1,
1.986912, 0.6163018, 2.387106, 1, 1, 1, 1, 1,
2.008965, -0.6344743, 1.955694, 1, 1, 1, 1, 1,
2.018808, -1.206009, 1.435987, 1, 1, 1, 1, 1,
2.053012, 0.3173198, 2.691744, 0, 0, 1, 1, 1,
2.062748, -0.8091912, 2.125283, 1, 0, 0, 1, 1,
2.127301, -0.7751881, 2.707182, 1, 0, 0, 1, 1,
2.129131, 0.2045778, 1.376862, 1, 0, 0, 1, 1,
2.154974, 1.723195, 1.435646, 1, 0, 0, 1, 1,
2.15562, -0.3926742, 2.062102, 1, 0, 0, 1, 1,
2.160482, -0.5688352, 2.053588, 0, 0, 0, 1, 1,
2.214547, -0.4729259, 2.991807, 0, 0, 0, 1, 1,
2.223547, 1.679182, 0.6637281, 0, 0, 0, 1, 1,
2.283587, -0.8395808, 1.548406, 0, 0, 0, 1, 1,
2.29321, 1.162464, 2.435607, 0, 0, 0, 1, 1,
2.373678, -2.237285, 1.041891, 0, 0, 0, 1, 1,
2.380774, 1.672661, 0.24869, 0, 0, 0, 1, 1,
2.385304, 0.2450708, 1.407116, 1, 1, 1, 1, 1,
2.457123, 1.396995, 1.922309, 1, 1, 1, 1, 1,
2.614011, 0.5493763, 2.326487, 1, 1, 1, 1, 1,
2.765729, -0.08556693, 1.885602, 1, 1, 1, 1, 1,
3.298485, 0.09208898, 0.7281625, 1, 1, 1, 1, 1,
3.373929, -0.8981637, 2.821215, 1, 1, 1, 1, 1,
3.692551, 0.2319564, 1.988222, 1, 1, 1, 1, 1
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
var radius = 10.49026;
var distance = 36.84658;
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
mvMatrix.translate( -0.5094571, 0.01981306, -0.9386411 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.84658);
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
