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
-3.710376, 0.9174703, -1.039982, 1, 0, 0, 1,
-3.316413, 1.532798, -0.7867807, 1, 0.007843138, 0, 1,
-3.068453, 1.008852, -1.782006, 1, 0.01176471, 0, 1,
-3.020407, 0.05478779, -1.746085, 1, 0.01960784, 0, 1,
-2.983537, -0.13481, 1.750782, 1, 0.02352941, 0, 1,
-2.890582, -0.5204784, -2.15933, 1, 0.03137255, 0, 1,
-2.811435, -0.4630054, -0.2025729, 1, 0.03529412, 0, 1,
-2.717838, -0.4823237, -2.023474, 1, 0.04313726, 0, 1,
-2.691392, 0.5063256, -0.8523144, 1, 0.04705882, 0, 1,
-2.418916, 1.770361, -2.81954, 1, 0.05490196, 0, 1,
-2.413727, -0.2388927, -0.5119452, 1, 0.05882353, 0, 1,
-2.403376, 0.4367962, -1.524397, 1, 0.06666667, 0, 1,
-2.388643, -0.545785, -0.8647542, 1, 0.07058824, 0, 1,
-2.37816, 0.4370853, -2.069004, 1, 0.07843138, 0, 1,
-2.35528, 0.2162097, -3.705701, 1, 0.08235294, 0, 1,
-2.278291, -0.7949467, -2.48088, 1, 0.09019608, 0, 1,
-2.193372, -0.410117, 0.04126973, 1, 0.09411765, 0, 1,
-2.179487, -0.3088332, -0.7460487, 1, 0.1019608, 0, 1,
-2.151848, 0.6452748, -1.020904, 1, 0.1098039, 0, 1,
-1.974762, 0.3135482, -2.468576, 1, 0.1137255, 0, 1,
-1.960973, 0.02592378, -1.053281, 1, 0.1215686, 0, 1,
-1.95467, -0.6357462, -1.254756, 1, 0.1254902, 0, 1,
-1.92773, -1.031827, -3.245529, 1, 0.1333333, 0, 1,
-1.911218, -0.1459073, -2.094279, 1, 0.1372549, 0, 1,
-1.901206, -1.65765, -1.613209, 1, 0.145098, 0, 1,
-1.896808, 0.2574157, -1.899344, 1, 0.1490196, 0, 1,
-1.890971, 0.2282479, -2.029247, 1, 0.1568628, 0, 1,
-1.876977, 1.550319, -1.341351, 1, 0.1607843, 0, 1,
-1.873123, 0.09402131, -2.057224, 1, 0.1686275, 0, 1,
-1.868767, -0.3133545, -1.421358, 1, 0.172549, 0, 1,
-1.825693, 0.06266823, -2.218363, 1, 0.1803922, 0, 1,
-1.818536, 0.05994831, -0.6799502, 1, 0.1843137, 0, 1,
-1.817355, 0.03068474, -1.66868, 1, 0.1921569, 0, 1,
-1.810554, -0.6479099, -0.1613192, 1, 0.1960784, 0, 1,
-1.781704, -0.5339555, -2.025081, 1, 0.2039216, 0, 1,
-1.779042, 0.1148904, -1.699347, 1, 0.2117647, 0, 1,
-1.768911, 0.2983778, -1.579766, 1, 0.2156863, 0, 1,
-1.764746, -0.6934379, -3.042286, 1, 0.2235294, 0, 1,
-1.761875, -0.772381, -0.700246, 1, 0.227451, 0, 1,
-1.751836, 2.14686, 0.5478998, 1, 0.2352941, 0, 1,
-1.749634, -0.02146687, 0.05145604, 1, 0.2392157, 0, 1,
-1.7339, -0.616977, -3.006291, 1, 0.2470588, 0, 1,
-1.71523, -0.2713207, -1.41266, 1, 0.2509804, 0, 1,
-1.70314, 1.123796, -1.004505, 1, 0.2588235, 0, 1,
-1.698382, 0.8094193, -3.410034, 1, 0.2627451, 0, 1,
-1.696849, -0.9775486, -1.689302, 1, 0.2705882, 0, 1,
-1.694755, -0.4171562, -0.9049797, 1, 0.2745098, 0, 1,
-1.68699, 0.3980566, -0.8624833, 1, 0.282353, 0, 1,
-1.675702, -0.523041, -1.755469, 1, 0.2862745, 0, 1,
-1.672789, -1.74673, -3.808722, 1, 0.2941177, 0, 1,
-1.660729, 1.291248, -2.151279, 1, 0.3019608, 0, 1,
-1.659311, 1.307969, -1.08978, 1, 0.3058824, 0, 1,
-1.655799, 0.6813337, -2.668745, 1, 0.3137255, 0, 1,
-1.651252, 1.553654, -1.179109, 1, 0.3176471, 0, 1,
-1.646984, -1.344976, -1.944087, 1, 0.3254902, 0, 1,
-1.625458, 0.3506406, -1.063325, 1, 0.3294118, 0, 1,
-1.625433, 0.9365535, -0.6280906, 1, 0.3372549, 0, 1,
-1.624278, 2.041873, -1.002138, 1, 0.3411765, 0, 1,
-1.616842, 1.526006, -3.317406, 1, 0.3490196, 0, 1,
-1.605183, -0.9635543, -1.781509, 1, 0.3529412, 0, 1,
-1.581151, 1.865823, -2.30735, 1, 0.3607843, 0, 1,
-1.579554, -0.09362538, -1.0182, 1, 0.3647059, 0, 1,
-1.563496, 0.4575148, -0.8248871, 1, 0.372549, 0, 1,
-1.562616, -0.3548932, -0.9477648, 1, 0.3764706, 0, 1,
-1.548716, -0.1683512, -2.880583, 1, 0.3843137, 0, 1,
-1.54404, 0.06425395, -3.010128, 1, 0.3882353, 0, 1,
-1.534715, 0.7652092, 0.3674945, 1, 0.3960784, 0, 1,
-1.529938, 0.879222, -1.118385, 1, 0.4039216, 0, 1,
-1.515393, 0.8538526, -0.4548368, 1, 0.4078431, 0, 1,
-1.499394, 1.197918, -0.6806971, 1, 0.4156863, 0, 1,
-1.491125, 1.30941, -0.15014, 1, 0.4196078, 0, 1,
-1.488966, -0.9495531, -1.910487, 1, 0.427451, 0, 1,
-1.472693, 0.2105072, -0.1112623, 1, 0.4313726, 0, 1,
-1.47213, -0.2379202, -2.834551, 1, 0.4392157, 0, 1,
-1.469564, -0.5972345, 1.05554, 1, 0.4431373, 0, 1,
-1.461241, 0.5586782, -2.064158, 1, 0.4509804, 0, 1,
-1.451692, -1.073418, -2.148909, 1, 0.454902, 0, 1,
-1.444684, 1.228343, -0.764979, 1, 0.4627451, 0, 1,
-1.444242, -2.323166, -1.246651, 1, 0.4666667, 0, 1,
-1.440794, 0.4411795, -0.5481735, 1, 0.4745098, 0, 1,
-1.440283, 0.3164234, 0.02118748, 1, 0.4784314, 0, 1,
-1.421138, -1.351434, -2.497736, 1, 0.4862745, 0, 1,
-1.419118, 0.8985227, -1.465536, 1, 0.4901961, 0, 1,
-1.40786, -0.975452, -3.50891, 1, 0.4980392, 0, 1,
-1.407158, 1.015097, 0.3196921, 1, 0.5058824, 0, 1,
-1.406701, 0.04903046, -1.641672, 1, 0.509804, 0, 1,
-1.403349, 1.153051, -1.636898, 1, 0.5176471, 0, 1,
-1.382507, -1.070202, -2.141047, 1, 0.5215687, 0, 1,
-1.379939, 0.4891445, -1.301424, 1, 0.5294118, 0, 1,
-1.377374, -0.3503232, -3.048852, 1, 0.5333334, 0, 1,
-1.375327, -0.2107151, -1.406485, 1, 0.5411765, 0, 1,
-1.371127, 0.08985469, -1.054539, 1, 0.5450981, 0, 1,
-1.359447, -1.148059, -2.966196, 1, 0.5529412, 0, 1,
-1.357049, 1.441677, -0.6458505, 1, 0.5568628, 0, 1,
-1.356251, -0.6946553, -1.11727, 1, 0.5647059, 0, 1,
-1.354165, 0.7935085, -2.359507, 1, 0.5686275, 0, 1,
-1.347764, 0.7002153, -2.347095, 1, 0.5764706, 0, 1,
-1.328484, -0.2697713, -1.175429, 1, 0.5803922, 0, 1,
-1.325421, 1.28456, -1.313568, 1, 0.5882353, 0, 1,
-1.321818, -0.1866689, -0.8996649, 1, 0.5921569, 0, 1,
-1.314695, -1.066841, -2.020698, 1, 0.6, 0, 1,
-1.311221, 0.2985229, -2.542032, 1, 0.6078432, 0, 1,
-1.306552, 0.4601779, -2.666926, 1, 0.6117647, 0, 1,
-1.285885, 0.4140586, -2.176992, 1, 0.6196079, 0, 1,
-1.284402, -1.636811, -1.954285, 1, 0.6235294, 0, 1,
-1.276116, -0.6571096, -3.081167, 1, 0.6313726, 0, 1,
-1.275414, -0.981096, -0.5929399, 1, 0.6352941, 0, 1,
-1.270905, 0.5987071, -0.1978153, 1, 0.6431373, 0, 1,
-1.268677, -0.3609282, -2.24445, 1, 0.6470588, 0, 1,
-1.268407, 1.044982, -2.261744, 1, 0.654902, 0, 1,
-1.266621, 0.4182562, -3.484965, 1, 0.6588235, 0, 1,
-1.26358, 0.956829, -2.432577, 1, 0.6666667, 0, 1,
-1.262244, 0.4404763, -0.9721323, 1, 0.6705883, 0, 1,
-1.260648, 0.2148465, -1.629294, 1, 0.6784314, 0, 1,
-1.25569, -1.043795, -2.463257, 1, 0.682353, 0, 1,
-1.251833, -0.3144417, -3.006234, 1, 0.6901961, 0, 1,
-1.249011, -1.500373, -2.506895, 1, 0.6941177, 0, 1,
-1.246248, -1.594987, -4.032949, 1, 0.7019608, 0, 1,
-1.244129, -0.09793611, -1.776993, 1, 0.7098039, 0, 1,
-1.235352, -1.335873, -3.433884, 1, 0.7137255, 0, 1,
-1.227608, -2.384006, -1.227879, 1, 0.7215686, 0, 1,
-1.221607, 1.243479, -0.05634608, 1, 0.7254902, 0, 1,
-1.220775, -0.1542976, -1.504662, 1, 0.7333333, 0, 1,
-1.216481, -0.941618, -2.387768, 1, 0.7372549, 0, 1,
-1.213072, -0.2191712, -2.647301, 1, 0.7450981, 0, 1,
-1.212879, 0.931132, -0.9811105, 1, 0.7490196, 0, 1,
-1.203205, 0.8734173, -0.7366412, 1, 0.7568628, 0, 1,
-1.200341, 0.6540275, -1.227879, 1, 0.7607843, 0, 1,
-1.199921, -0.1591412, -3.709476, 1, 0.7686275, 0, 1,
-1.197458, 0.4699535, -1.115744, 1, 0.772549, 0, 1,
-1.187966, -2.102748, -2.132381, 1, 0.7803922, 0, 1,
-1.183544, -0.1919398, -0.99399, 1, 0.7843137, 0, 1,
-1.178009, -1.318594, -1.365112, 1, 0.7921569, 0, 1,
-1.17652, -0.9836238, -2.359369, 1, 0.7960784, 0, 1,
-1.17088, 1.309743, -1.000497, 1, 0.8039216, 0, 1,
-1.148141, 0.3140627, -3.218513, 1, 0.8117647, 0, 1,
-1.140167, 0.4170873, -2.143324, 1, 0.8156863, 0, 1,
-1.135128, 0.9601713, -0.6787714, 1, 0.8235294, 0, 1,
-1.134042, -1.107138, -1.845812, 1, 0.827451, 0, 1,
-1.133049, 0.879717, -1.879717, 1, 0.8352941, 0, 1,
-1.129527, 0.2648776, -0.5177773, 1, 0.8392157, 0, 1,
-1.122873, -0.2907343, -1.108078, 1, 0.8470588, 0, 1,
-1.12213, -0.002314243, -2.269172, 1, 0.8509804, 0, 1,
-1.118314, -0.9416876, -2.052263, 1, 0.8588235, 0, 1,
-1.117718, 1.200136, -2.859709, 1, 0.8627451, 0, 1,
-1.099725, 0.5902771, -0.8137028, 1, 0.8705882, 0, 1,
-1.096832, -0.07061464, -0.9714175, 1, 0.8745098, 0, 1,
-1.09485, 0.4722169, -2.645935, 1, 0.8823529, 0, 1,
-1.084339, 1.211147, -2.318525, 1, 0.8862745, 0, 1,
-1.078882, 1.061184, 0.12151, 1, 0.8941177, 0, 1,
-1.077322, -0.03514535, 0.07637325, 1, 0.8980392, 0, 1,
-1.06726, -0.7836305, -1.911228, 1, 0.9058824, 0, 1,
-1.059257, -0.5883939, -4.271497, 1, 0.9137255, 0, 1,
-1.04115, -1.592722, -2.243591, 1, 0.9176471, 0, 1,
-1.040997, 1.296804, -0.5093259, 1, 0.9254902, 0, 1,
-1.03844, -0.006648046, -0.7611736, 1, 0.9294118, 0, 1,
-1.037147, -0.9350644, -2.916175, 1, 0.9372549, 0, 1,
-1.03422, 0.6222376, -0.4600358, 1, 0.9411765, 0, 1,
-1.02712, 0.463818, -1.851464, 1, 0.9490196, 0, 1,
-1.023086, 0.1220704, -1.339499, 1, 0.9529412, 0, 1,
-1.020642, -0.700018, -1.144359, 1, 0.9607843, 0, 1,
-1.012949, -0.7972677, -1.485279, 1, 0.9647059, 0, 1,
-1.010292, 1.392106, -0.2917559, 1, 0.972549, 0, 1,
-0.997874, 2.107066, 0.4767832, 1, 0.9764706, 0, 1,
-0.9911077, -0.351328, -1.790261, 1, 0.9843137, 0, 1,
-0.9865882, 2.172311, -0.03728676, 1, 0.9882353, 0, 1,
-0.9797023, -1.032512, -3.312551, 1, 0.9960784, 0, 1,
-0.9748733, 0.9017575, -1.298049, 0.9960784, 1, 0, 1,
-0.9748545, 2.255699, 0.2619712, 0.9921569, 1, 0, 1,
-0.9743239, -0.05760185, -1.923556, 0.9843137, 1, 0, 1,
-0.9740162, -0.3771064, -0.7157425, 0.9803922, 1, 0, 1,
-0.963136, 0.8793446, -0.7245864, 0.972549, 1, 0, 1,
-0.94641, 1.514654, -0.7273566, 0.9686275, 1, 0, 1,
-0.9439393, -0.13821, -2.168694, 0.9607843, 1, 0, 1,
-0.9401554, -0.5502693, -3.355552, 0.9568627, 1, 0, 1,
-0.932676, -0.2670224, -0.07243413, 0.9490196, 1, 0, 1,
-0.9276914, -2.016293, -2.860188, 0.945098, 1, 0, 1,
-0.9265277, 1.654429, -0.5947247, 0.9372549, 1, 0, 1,
-0.9205291, -0.2851932, -0.4472999, 0.9333333, 1, 0, 1,
-0.9178159, -0.6258536, -4.099206, 0.9254902, 1, 0, 1,
-0.910478, 0.06644903, -0.4077691, 0.9215686, 1, 0, 1,
-0.910127, 1.208083, 0.8520316, 0.9137255, 1, 0, 1,
-0.9072878, -0.3482484, -1.185504, 0.9098039, 1, 0, 1,
-0.9072636, 0.9296341, -1.748412, 0.9019608, 1, 0, 1,
-0.9067466, -0.6277658, -1.778064, 0.8941177, 1, 0, 1,
-0.9010552, 0.1130748, -0.9909807, 0.8901961, 1, 0, 1,
-0.8971323, -1.201489, -2.544853, 0.8823529, 1, 0, 1,
-0.8957223, 0.4801252, -1.280978, 0.8784314, 1, 0, 1,
-0.8925868, 0.9990035, -1.643392, 0.8705882, 1, 0, 1,
-0.8918341, 0.5506302, -0.6075268, 0.8666667, 1, 0, 1,
-0.8905351, 0.9837976, -0.5815578, 0.8588235, 1, 0, 1,
-0.880782, -1.076905, -2.824267, 0.854902, 1, 0, 1,
-0.8798464, 1.11005, -1.106762, 0.8470588, 1, 0, 1,
-0.8730872, 0.584426, -1.312737, 0.8431373, 1, 0, 1,
-0.8666002, 1.922348, -0.6040335, 0.8352941, 1, 0, 1,
-0.8650004, 2.410747, -1.899869, 0.8313726, 1, 0, 1,
-0.8599343, -0.2405023, -2.69828, 0.8235294, 1, 0, 1,
-0.8598147, 1.014611, -3.071199, 0.8196079, 1, 0, 1,
-0.857158, 0.07847886, -1.050023, 0.8117647, 1, 0, 1,
-0.8567445, -0.781348, -3.159886, 0.8078431, 1, 0, 1,
-0.8564442, -2.357987, -2.719158, 0.8, 1, 0, 1,
-0.8560669, -0.6764472, -0.6934686, 0.7921569, 1, 0, 1,
-0.8556502, 0.297404, -1.10754, 0.7882353, 1, 0, 1,
-0.8504875, 0.7621608, -2.215082, 0.7803922, 1, 0, 1,
-0.8427712, -0.3072523, -2.68558, 0.7764706, 1, 0, 1,
-0.8417224, -0.4215924, -2.682552, 0.7686275, 1, 0, 1,
-0.8380703, 1.08557, -1.25412, 0.7647059, 1, 0, 1,
-0.8380609, -0.5190219, -2.77958, 0.7568628, 1, 0, 1,
-0.837086, 1.571235, 0.314898, 0.7529412, 1, 0, 1,
-0.8331475, -0.4805968, -2.446197, 0.7450981, 1, 0, 1,
-0.8294718, 1.80193, -1.194968, 0.7411765, 1, 0, 1,
-0.8291854, 0.08180146, -0.6424378, 0.7333333, 1, 0, 1,
-0.82736, -0.3143563, -0.9703868, 0.7294118, 1, 0, 1,
-0.8255647, 2.005095, 0.2767864, 0.7215686, 1, 0, 1,
-0.8178244, -1.351435, -2.457432, 0.7176471, 1, 0, 1,
-0.8104035, -0.02390873, -1.340018, 0.7098039, 1, 0, 1,
-0.8085756, 0.32774, -2.794976, 0.7058824, 1, 0, 1,
-0.7928445, 0.3522986, -1.336992, 0.6980392, 1, 0, 1,
-0.7861762, 0.4029866, -0.859298, 0.6901961, 1, 0, 1,
-0.7851617, -0.8880117, -3.275956, 0.6862745, 1, 0, 1,
-0.7827556, -0.4761127, -3.087828, 0.6784314, 1, 0, 1,
-0.7815008, 1.115316, -1.790723, 0.6745098, 1, 0, 1,
-0.7751912, -1.303264, -2.611476, 0.6666667, 1, 0, 1,
-0.7730532, 1.586259, -1.045115, 0.6627451, 1, 0, 1,
-0.7709976, -0.5048708, -3.093418, 0.654902, 1, 0, 1,
-0.7697051, 1.075681, -1.414609, 0.6509804, 1, 0, 1,
-0.7643627, 1.202718, -2.116413, 0.6431373, 1, 0, 1,
-0.7603806, -0.2061976, -2.419801, 0.6392157, 1, 0, 1,
-0.7566708, -0.8161374, -2.827999, 0.6313726, 1, 0, 1,
-0.7561688, -0.7092699, -3.709235, 0.627451, 1, 0, 1,
-0.7499377, 1.026068, -1.018484, 0.6196079, 1, 0, 1,
-0.7492349, -1.824481, -2.193141, 0.6156863, 1, 0, 1,
-0.7419344, -0.2136035, -2.667952, 0.6078432, 1, 0, 1,
-0.7403105, 0.8718166, -2.787964, 0.6039216, 1, 0, 1,
-0.7390731, 0.2519223, -1.10383, 0.5960785, 1, 0, 1,
-0.7350126, -2.403028, -2.825688, 0.5882353, 1, 0, 1,
-0.7342387, -0.4582147, -2.409209, 0.5843138, 1, 0, 1,
-0.7250193, -0.1275291, -0.4716615, 0.5764706, 1, 0, 1,
-0.7245661, 1.893956, -0.2411367, 0.572549, 1, 0, 1,
-0.7238338, -0.5165146, -1.607594, 0.5647059, 1, 0, 1,
-0.7212066, -0.07894884, -1.743003, 0.5607843, 1, 0, 1,
-0.720286, 1.02036, 0.4155202, 0.5529412, 1, 0, 1,
-0.7160589, 0.554048, 0.9295351, 0.5490196, 1, 0, 1,
-0.7158858, -0.5936736, -2.664525, 0.5411765, 1, 0, 1,
-0.7141927, 1.122279, -0.9856184, 0.5372549, 1, 0, 1,
-0.7137883, 0.1573092, -2.214327, 0.5294118, 1, 0, 1,
-0.7126209, -0.9481904, -1.337153, 0.5254902, 1, 0, 1,
-0.7116932, -1.060621, -2.174992, 0.5176471, 1, 0, 1,
-0.7076886, 1.152467, -0.8298188, 0.5137255, 1, 0, 1,
-0.703872, -0.6527218, -3.291371, 0.5058824, 1, 0, 1,
-0.6976888, -1.525308, -4.5145, 0.5019608, 1, 0, 1,
-0.6968334, -0.4887748, -2.164139, 0.4941176, 1, 0, 1,
-0.6949281, 0.5769049, -0.1475286, 0.4862745, 1, 0, 1,
-0.6936366, 0.6016172, -2.081274, 0.4823529, 1, 0, 1,
-0.6871444, 0.4039114, -0.7141635, 0.4745098, 1, 0, 1,
-0.6804726, 0.878711, -0.79246, 0.4705882, 1, 0, 1,
-0.6775163, 1.561704, 0.2076636, 0.4627451, 1, 0, 1,
-0.6742577, 0.7283391, 0.438858, 0.4588235, 1, 0, 1,
-0.6665786, 1.513384, -0.4134466, 0.4509804, 1, 0, 1,
-0.6587449, 1.153301, -0.7351184, 0.4470588, 1, 0, 1,
-0.658504, -2.124247, -3.543483, 0.4392157, 1, 0, 1,
-0.6559049, -0.3680714, -2.265147, 0.4352941, 1, 0, 1,
-0.655036, 0.7522628, -0.2944591, 0.427451, 1, 0, 1,
-0.6541448, -1.615845, -0.6575946, 0.4235294, 1, 0, 1,
-0.6535412, -1.28027, -2.211197, 0.4156863, 1, 0, 1,
-0.6524085, 0.3864848, -2.253016, 0.4117647, 1, 0, 1,
-0.645213, 0.3161065, 0.5266767, 0.4039216, 1, 0, 1,
-0.6312903, -0.7267063, -3.214264, 0.3960784, 1, 0, 1,
-0.6255772, 0.4656411, -0.5752757, 0.3921569, 1, 0, 1,
-0.624795, 1.628659, -0.49773, 0.3843137, 1, 0, 1,
-0.6235623, 0.6392783, -0.7332035, 0.3803922, 1, 0, 1,
-0.6207917, 0.8720232, -1.316435, 0.372549, 1, 0, 1,
-0.614491, 2.791685, -0.6385962, 0.3686275, 1, 0, 1,
-0.6144843, 0.165477, -0.519447, 0.3607843, 1, 0, 1,
-0.6046064, -0.6910841, -2.857825, 0.3568628, 1, 0, 1,
-0.5986938, -0.2774323, -1.707359, 0.3490196, 1, 0, 1,
-0.5945371, -0.6119181, -2.503469, 0.345098, 1, 0, 1,
-0.5935249, -0.05996431, -1.641813, 0.3372549, 1, 0, 1,
-0.5922999, 0.6835577, -0.6428631, 0.3333333, 1, 0, 1,
-0.5887368, -1.794551, -3.365488, 0.3254902, 1, 0, 1,
-0.5864353, 1.193525, 0.6988471, 0.3215686, 1, 0, 1,
-0.5843915, -0.1218334, -1.297508, 0.3137255, 1, 0, 1,
-0.5796095, -0.8175212, -2.693176, 0.3098039, 1, 0, 1,
-0.5789431, 2.079828, -0.9406846, 0.3019608, 1, 0, 1,
-0.5768653, 1.32724, 0.4985002, 0.2941177, 1, 0, 1,
-0.5748911, -0.3554682, -2.369603, 0.2901961, 1, 0, 1,
-0.5707753, 0.2510523, 0.4124264, 0.282353, 1, 0, 1,
-0.5694845, 0.4450066, -0.9685521, 0.2784314, 1, 0, 1,
-0.5693449, 0.8656778, -1.821717, 0.2705882, 1, 0, 1,
-0.5670139, -0.08847423, -2.033297, 0.2666667, 1, 0, 1,
-0.5655171, -0.6481864, -0.5308688, 0.2588235, 1, 0, 1,
-0.5579265, -0.9311895, -1.633093, 0.254902, 1, 0, 1,
-0.5560124, -0.2597074, -3.245543, 0.2470588, 1, 0, 1,
-0.5541201, 0.3931066, -1.697456, 0.2431373, 1, 0, 1,
-0.5514458, -0.04646324, -2.075314, 0.2352941, 1, 0, 1,
-0.5504236, 0.3483127, -1.353862, 0.2313726, 1, 0, 1,
-0.5503226, 0.4484662, -1.441724, 0.2235294, 1, 0, 1,
-0.5473118, 1.211075, -1.442221, 0.2196078, 1, 0, 1,
-0.5458974, 1.223393, 0.7368073, 0.2117647, 1, 0, 1,
-0.5438268, 1.178824, -1.39908, 0.2078431, 1, 0, 1,
-0.541169, 1.361318, -0.6600011, 0.2, 1, 0, 1,
-0.5386574, -0.6521471, -1.435567, 0.1921569, 1, 0, 1,
-0.5283318, 0.308271, -2.712685, 0.1882353, 1, 0, 1,
-0.522939, 0.4270527, -1.376204, 0.1803922, 1, 0, 1,
-0.5195854, -1.139784, -2.921572, 0.1764706, 1, 0, 1,
-0.5165805, -0.7535523, -2.37084, 0.1686275, 1, 0, 1,
-0.5091652, -0.03522431, -2.00232, 0.1647059, 1, 0, 1,
-0.505431, -0.7800789, -3.316376, 0.1568628, 1, 0, 1,
-0.5051022, -0.03767166, -1.720263, 0.1529412, 1, 0, 1,
-0.502592, 0.1020507, -1.879348, 0.145098, 1, 0, 1,
-0.502586, 0.9819964, -0.9268489, 0.1411765, 1, 0, 1,
-0.4951991, 1.184089, -1.595287, 0.1333333, 1, 0, 1,
-0.4938147, 0.2620293, 0.01008262, 0.1294118, 1, 0, 1,
-0.4917547, 1.922354, 0.4056232, 0.1215686, 1, 0, 1,
-0.4913422, 1.254672, 0.454345, 0.1176471, 1, 0, 1,
-0.4911251, -0.3440769, -1.509732, 0.1098039, 1, 0, 1,
-0.4895768, 1.632201, -0.64348, 0.1058824, 1, 0, 1,
-0.4889798, -1.412026, -1.789569, 0.09803922, 1, 0, 1,
-0.4798763, -1.771161, -3.321347, 0.09019608, 1, 0, 1,
-0.4798301, 0.3689527, -2.983909, 0.08627451, 1, 0, 1,
-0.4788129, -0.3768361, -1.24888, 0.07843138, 1, 0, 1,
-0.4781935, -0.150073, -0.6521558, 0.07450981, 1, 0, 1,
-0.4744087, -1.272641, -0.9488909, 0.06666667, 1, 0, 1,
-0.4648843, -0.3783322, -2.687277, 0.0627451, 1, 0, 1,
-0.4639771, 0.645629, -1.539972, 0.05490196, 1, 0, 1,
-0.4630795, -0.03905442, -1.408844, 0.05098039, 1, 0, 1,
-0.4595563, -1.585625, -2.543543, 0.04313726, 1, 0, 1,
-0.4579892, -0.4850008, -3.211898, 0.03921569, 1, 0, 1,
-0.4554472, -0.4170105, -1.7946, 0.03137255, 1, 0, 1,
-0.4540538, -1.454964, -1.558703, 0.02745098, 1, 0, 1,
-0.4538873, -0.5803325, -2.362928, 0.01960784, 1, 0, 1,
-0.4538615, 0.1106708, -1.26997, 0.01568628, 1, 0, 1,
-0.4479482, -0.7873917, -2.201015, 0.007843138, 1, 0, 1,
-0.4470347, 0.05241127, -2.164521, 0.003921569, 1, 0, 1,
-0.4468001, 0.5428586, 0.3947172, 0, 1, 0.003921569, 1,
-0.4451936, 0.9029884, -0.5458846, 0, 1, 0.01176471, 1,
-0.4443972, -1.131307, -3.581315, 0, 1, 0.01568628, 1,
-0.4440103, 0.8394351, -0.9958416, 0, 1, 0.02352941, 1,
-0.4436283, -1.832953, -3.043802, 0, 1, 0.02745098, 1,
-0.4388094, 0.3730872, -1.523943, 0, 1, 0.03529412, 1,
-0.4352744, 0.7443342, -0.1429991, 0, 1, 0.03921569, 1,
-0.4333775, 0.7144499, -0.4876185, 0, 1, 0.04705882, 1,
-0.4329917, 0.2479307, 0.6911613, 0, 1, 0.05098039, 1,
-0.4328916, -2.405066, -0.6860052, 0, 1, 0.05882353, 1,
-0.4322626, 0.3023905, -2.216648, 0, 1, 0.0627451, 1,
-0.4290719, -0.1964395, 0.009281377, 0, 1, 0.07058824, 1,
-0.4284246, -1.032484, -3.338286, 0, 1, 0.07450981, 1,
-0.4138464, 1.209118, -0.0001978037, 0, 1, 0.08235294, 1,
-0.4134709, -2.105937, -3.03366, 0, 1, 0.08627451, 1,
-0.407737, -1.326748, -2.971534, 0, 1, 0.09411765, 1,
-0.4074562, -0.2682906, -1.503159, 0, 1, 0.1019608, 1,
-0.3969055, -0.8914825, -2.200599, 0, 1, 0.1058824, 1,
-0.3951699, 0.09948483, -1.036722, 0, 1, 0.1137255, 1,
-0.3933845, -1.498397, -2.146915, 0, 1, 0.1176471, 1,
-0.3924462, -1.556724, -2.70753, 0, 1, 0.1254902, 1,
-0.3911213, 0.007183009, -2.991529, 0, 1, 0.1294118, 1,
-0.3896754, -1.324058, -3.999531, 0, 1, 0.1372549, 1,
-0.3888681, -0.8553078, -2.853665, 0, 1, 0.1411765, 1,
-0.3888308, -0.6025885, -2.877354, 0, 1, 0.1490196, 1,
-0.3843835, -0.8342584, -4.627494, 0, 1, 0.1529412, 1,
-0.3762153, 0.8829503, 0.1351992, 0, 1, 0.1607843, 1,
-0.3727121, -0.08770319, -2.936739, 0, 1, 0.1647059, 1,
-0.3711399, 0.3294127, -1.0486, 0, 1, 0.172549, 1,
-0.3684106, 0.4388863, -2.483686, 0, 1, 0.1764706, 1,
-0.3657076, 0.3214787, -0.3083385, 0, 1, 0.1843137, 1,
-0.3617828, 0.5930169, 0.05013654, 0, 1, 0.1882353, 1,
-0.3616754, 1.634768, 0.5648535, 0, 1, 0.1960784, 1,
-0.354916, -0.385517, -2.041739, 0, 1, 0.2039216, 1,
-0.3429087, -0.5076219, -3.325649, 0, 1, 0.2078431, 1,
-0.3376653, -0.3697746, -1.417287, 0, 1, 0.2156863, 1,
-0.3347946, 0.72405, -1.129422, 0, 1, 0.2196078, 1,
-0.3309137, -0.09219014, -3.069576, 0, 1, 0.227451, 1,
-0.3294061, 0.193293, 0.2685014, 0, 1, 0.2313726, 1,
-0.315867, 1.464702, -1.053701, 0, 1, 0.2392157, 1,
-0.3132894, 0.2104906, -0.7570307, 0, 1, 0.2431373, 1,
-0.3094953, -0.765103, -2.385227, 0, 1, 0.2509804, 1,
-0.3008376, -0.9224415, -1.624488, 0, 1, 0.254902, 1,
-0.2909597, 1.279754, -0.4467087, 0, 1, 0.2627451, 1,
-0.2888086, -0.9334695, -3.617537, 0, 1, 0.2666667, 1,
-0.2876283, -1.165182, -3.385846, 0, 1, 0.2745098, 1,
-0.2818574, 0.5189326, -2.221671, 0, 1, 0.2784314, 1,
-0.2816918, -0.1829628, -2.865975, 0, 1, 0.2862745, 1,
-0.2785623, -0.8986916, -3.249573, 0, 1, 0.2901961, 1,
-0.2778378, -1.45597, -4.703009, 0, 1, 0.2980392, 1,
-0.2755994, 0.4245403, 0.7098349, 0, 1, 0.3058824, 1,
-0.2734767, -0.4355486, -3.231395, 0, 1, 0.3098039, 1,
-0.2710606, -0.7446793, -3.151195, 0, 1, 0.3176471, 1,
-0.2675236, -0.8464492, -1.982033, 0, 1, 0.3215686, 1,
-0.2661377, 2.339447, -1.210923, 0, 1, 0.3294118, 1,
-0.2611932, 0.08192543, -1.094599, 0, 1, 0.3333333, 1,
-0.2605359, 0.9686686, -0.6137633, 0, 1, 0.3411765, 1,
-0.2563372, 1.464174, -0.8022633, 0, 1, 0.345098, 1,
-0.2516269, -0.8956723, -3.495915, 0, 1, 0.3529412, 1,
-0.2503262, -0.4277765, -1.37971, 0, 1, 0.3568628, 1,
-0.2501204, -0.6524479, -2.462435, 0, 1, 0.3647059, 1,
-0.2493006, 1.01012, -0.6637947, 0, 1, 0.3686275, 1,
-0.2449917, -0.3287362, -2.736467, 0, 1, 0.3764706, 1,
-0.2441319, 0.7982534, -0.3915513, 0, 1, 0.3803922, 1,
-0.2440016, -0.1107761, -3.316369, 0, 1, 0.3882353, 1,
-0.2344541, 0.3634834, -0.2604857, 0, 1, 0.3921569, 1,
-0.2338511, 0.3273625, -0.2800586, 0, 1, 0.4, 1,
-0.2300949, -0.5254996, -4.008766, 0, 1, 0.4078431, 1,
-0.2293917, -0.1233575, -0.8644196, 0, 1, 0.4117647, 1,
-0.2221306, 0.43254, -1.583837, 0, 1, 0.4196078, 1,
-0.2207435, 1.698345, -1.589839, 0, 1, 0.4235294, 1,
-0.21952, -2.061277, -3.219682, 0, 1, 0.4313726, 1,
-0.2175196, -0.7394974, -3.620636, 0, 1, 0.4352941, 1,
-0.2121638, -0.2709606, -2.690086, 0, 1, 0.4431373, 1,
-0.2111292, 1.477462, 0.3073812, 0, 1, 0.4470588, 1,
-0.2036388, 1.450818, 1.937088, 0, 1, 0.454902, 1,
-0.2017234, 0.3726305, 0.008639629, 0, 1, 0.4588235, 1,
-0.1995747, 0.3133337, -1.287369, 0, 1, 0.4666667, 1,
-0.1981113, -0.1705409, -2.13253, 0, 1, 0.4705882, 1,
-0.1975324, -0.7115592, -2.89122, 0, 1, 0.4784314, 1,
-0.1974968, -0.09655887, -0.8870148, 0, 1, 0.4823529, 1,
-0.1964297, -0.401719, -3.124048, 0, 1, 0.4901961, 1,
-0.1959381, -0.0824704, -0.2881487, 0, 1, 0.4941176, 1,
-0.1953919, 0.9432579, -0.9475297, 0, 1, 0.5019608, 1,
-0.1932815, 1.104891, -0.5456222, 0, 1, 0.509804, 1,
-0.1927645, 0.3363458, -1.264748, 0, 1, 0.5137255, 1,
-0.1904499, 0.1412975, -1.686193, 0, 1, 0.5215687, 1,
-0.1839445, -1.469562, -5.046237, 0, 1, 0.5254902, 1,
-0.1776754, -1.467496, -4.589543, 0, 1, 0.5333334, 1,
-0.1680193, 0.9873371, -1.074784, 0, 1, 0.5372549, 1,
-0.1643073, 1.3465, -1.272406, 0, 1, 0.5450981, 1,
-0.1615722, -0.8795043, -2.321341, 0, 1, 0.5490196, 1,
-0.1579283, 0.4707119, 1.944965, 0, 1, 0.5568628, 1,
-0.153729, 0.9576001, -2.564025, 0, 1, 0.5607843, 1,
-0.1502311, 0.8259638, -0.3834932, 0, 1, 0.5686275, 1,
-0.1488076, 0.6053646, -1.364072, 0, 1, 0.572549, 1,
-0.1467955, 2.096092, 0.2829797, 0, 1, 0.5803922, 1,
-0.1458496, -0.7556501, -4.747496, 0, 1, 0.5843138, 1,
-0.1447349, 0.4355532, 1.516398, 0, 1, 0.5921569, 1,
-0.1425561, 1.307971, -0.5812297, 0, 1, 0.5960785, 1,
-0.137897, -0.7083313, -3.024385, 0, 1, 0.6039216, 1,
-0.1369538, 0.3141623, -1.2408, 0, 1, 0.6117647, 1,
-0.1363448, 2.411124, 0.9890375, 0, 1, 0.6156863, 1,
-0.1339083, -0.1364564, -3.689205, 0, 1, 0.6235294, 1,
-0.1171952, -0.111789, -2.67931, 0, 1, 0.627451, 1,
-0.1060602, 1.016869, -0.459079, 0, 1, 0.6352941, 1,
-0.1039316, 0.3937467, 0.08507121, 0, 1, 0.6392157, 1,
-0.0983309, 1.096433, 0.548604, 0, 1, 0.6470588, 1,
-0.09480786, 1.144945, 0.9702162, 0, 1, 0.6509804, 1,
-0.093658, 0.04099447, -3.505471, 0, 1, 0.6588235, 1,
-0.09202263, -0.1883671, -4.461764, 0, 1, 0.6627451, 1,
-0.08620283, 0.4189912, 0.1696423, 0, 1, 0.6705883, 1,
-0.08479743, -0.1199124, -2.440866, 0, 1, 0.6745098, 1,
-0.08343738, 0.1067716, 0.107173, 0, 1, 0.682353, 1,
-0.08166201, 0.8841799, -0.2076904, 0, 1, 0.6862745, 1,
-0.07909209, 1.99387, -0.2755424, 0, 1, 0.6941177, 1,
-0.07459664, 0.9795408, -1.961129, 0, 1, 0.7019608, 1,
-0.07290503, -1.015733, -2.778894, 0, 1, 0.7058824, 1,
-0.07009766, 0.5720229, -1.401911, 0, 1, 0.7137255, 1,
-0.06874269, -1.490893, -4.15366, 0, 1, 0.7176471, 1,
-0.06671628, -0.4694684, -2.323109, 0, 1, 0.7254902, 1,
-0.05770618, -0.4966234, -1.888544, 0, 1, 0.7294118, 1,
-0.05744396, 1.532724, -0.5950284, 0, 1, 0.7372549, 1,
-0.05075386, -0.6638251, -4.436096, 0, 1, 0.7411765, 1,
-0.05040728, -1.053783, -2.988771, 0, 1, 0.7490196, 1,
-0.0479183, -0.4638938, -2.246482, 0, 1, 0.7529412, 1,
-0.0437344, 0.9089937, 0.5580717, 0, 1, 0.7607843, 1,
-0.03639664, -1.929096, -4.712863, 0, 1, 0.7647059, 1,
-0.03255588, 0.07653309, 1.376241, 0, 1, 0.772549, 1,
-0.03113041, -0.2227828, -2.630711, 0, 1, 0.7764706, 1,
-0.02969397, 1.371689, 1.560485, 0, 1, 0.7843137, 1,
-0.02711875, 1.046416, -0.133449, 0, 1, 0.7882353, 1,
-0.02555705, -1.590112, -2.14262, 0, 1, 0.7960784, 1,
-0.0245514, -0.2841755, -3.113403, 0, 1, 0.8039216, 1,
-0.0238274, -1.775559, -5.503802, 0, 1, 0.8078431, 1,
-0.02295269, 0.3248141, 0.5267405, 0, 1, 0.8156863, 1,
-0.02146112, 0.2004749, -2.528416, 0, 1, 0.8196079, 1,
-0.01616628, 1.169833, 0.4591296, 0, 1, 0.827451, 1,
-0.01346232, -0.5346978, -3.10905, 0, 1, 0.8313726, 1,
-0.01113989, -0.2724358, -4.041207, 0, 1, 0.8392157, 1,
-0.008705563, -0.1749648, -2.04317, 0, 1, 0.8431373, 1,
-0.007773349, -1.093333, -3.18431, 0, 1, 0.8509804, 1,
-0.003934888, 0.2445159, 0.09691051, 0, 1, 0.854902, 1,
0.0002144821, -0.2699961, 2.224858, 0, 1, 0.8627451, 1,
0.0009663184, 0.5924299, 1.03504, 0, 1, 0.8666667, 1,
0.001927303, 0.07723857, 2.031835, 0, 1, 0.8745098, 1,
0.003119394, 0.5693236, 0.7808003, 0, 1, 0.8784314, 1,
0.003972878, -0.5712605, 1.292413, 0, 1, 0.8862745, 1,
0.008465859, 2.103572, -0.5234466, 0, 1, 0.8901961, 1,
0.01259432, -0.3265459, 2.448293, 0, 1, 0.8980392, 1,
0.01357551, -0.9581783, 2.385368, 0, 1, 0.9058824, 1,
0.01508499, 0.3788462, 0.9045581, 0, 1, 0.9098039, 1,
0.01613799, -0.3127311, 0.438242, 0, 1, 0.9176471, 1,
0.02671442, 0.9213818, -1.12892, 0, 1, 0.9215686, 1,
0.02961663, 0.4011264, -1.137631, 0, 1, 0.9294118, 1,
0.03391976, 1.167654, -0.2096147, 0, 1, 0.9333333, 1,
0.03494653, 0.2894953, -1.813757, 0, 1, 0.9411765, 1,
0.03514722, 0.8655078, 0.306301, 0, 1, 0.945098, 1,
0.03697008, 1.24077, -0.4564447, 0, 1, 0.9529412, 1,
0.03815296, 0.9840215, 0.4086183, 0, 1, 0.9568627, 1,
0.04005326, -0.3587763, 1.18733, 0, 1, 0.9647059, 1,
0.04187687, 1.776229, 0.5610792, 0, 1, 0.9686275, 1,
0.05067487, 1.890596, 0.3841503, 0, 1, 0.9764706, 1,
0.05187326, -0.06563932, 3.756727, 0, 1, 0.9803922, 1,
0.05278068, -0.1438864, 3.81244, 0, 1, 0.9882353, 1,
0.05410358, 0.5172095, 0.3751349, 0, 1, 0.9921569, 1,
0.05927357, -1.055269, 3.542872, 0, 1, 1, 1,
0.06003856, -0.129037, 3.771029, 0, 0.9921569, 1, 1,
0.0650234, -0.4147904, 1.04109, 0, 0.9882353, 1, 1,
0.06668584, 0.06733362, -0.1145066, 0, 0.9803922, 1, 1,
0.0687187, -1.487848, 3.225255, 0, 0.9764706, 1, 1,
0.06940673, -0.202823, 2.671698, 0, 0.9686275, 1, 1,
0.07008859, -0.4899263, 1.209526, 0, 0.9647059, 1, 1,
0.07108648, -1.994858, 2.595623, 0, 0.9568627, 1, 1,
0.07229707, 0.02849861, 1.074024, 0, 0.9529412, 1, 1,
0.07316592, 0.7395473, -0.092871, 0, 0.945098, 1, 1,
0.08122796, 0.2908706, -0.3381063, 0, 0.9411765, 1, 1,
0.08218285, 0.310847, 1.973586, 0, 0.9333333, 1, 1,
0.08243038, -1.648909, 3.422457, 0, 0.9294118, 1, 1,
0.08838376, 0.3359032, -0.1752485, 0, 0.9215686, 1, 1,
0.09050095, 0.1203263, 1.864211, 0, 0.9176471, 1, 1,
0.09206386, 1.442717, 1.584959, 0, 0.9098039, 1, 1,
0.09486368, -2.402493, 3.634607, 0, 0.9058824, 1, 1,
0.09645337, 0.4574547, 1.799557, 0, 0.8980392, 1, 1,
0.1021345, 1.136643, -0.3013682, 0, 0.8901961, 1, 1,
0.1078671, 0.6449111, -0.01876272, 0, 0.8862745, 1, 1,
0.1080238, -0.01344604, 1.374626, 0, 0.8784314, 1, 1,
0.1082052, -1.025188, 0.5781788, 0, 0.8745098, 1, 1,
0.1100561, 1.21245, 1.478471, 0, 0.8666667, 1, 1,
0.1111063, -0.6427162, 2.550586, 0, 0.8627451, 1, 1,
0.1145763, 0.789111, -0.9699434, 0, 0.854902, 1, 1,
0.1221856, 1.603721, 0.1288552, 0, 0.8509804, 1, 1,
0.1247903, -0.9895633, 2.687687, 0, 0.8431373, 1, 1,
0.1249168, -0.6451031, 1.993848, 0, 0.8392157, 1, 1,
0.1282003, -0.8738358, 4.60962, 0, 0.8313726, 1, 1,
0.1292565, 1.089191, -0.9550745, 0, 0.827451, 1, 1,
0.1336721, 1.227734, 1.65194, 0, 0.8196079, 1, 1,
0.1344395, 1.152948, 2.16402, 0, 0.8156863, 1, 1,
0.1347158, 1.961685, 0.01404732, 0, 0.8078431, 1, 1,
0.1359937, 0.928302, 0.140307, 0, 0.8039216, 1, 1,
0.1364569, 0.3314284, 1.667001, 0, 0.7960784, 1, 1,
0.1369196, -1.320232, 3.598918, 0, 0.7882353, 1, 1,
0.138316, 1.162874, -0.3298641, 0, 0.7843137, 1, 1,
0.1390109, 1.688992, 0.1333394, 0, 0.7764706, 1, 1,
0.1395323, -1.100677, 3.171264, 0, 0.772549, 1, 1,
0.1436817, -0.144972, 3.664376, 0, 0.7647059, 1, 1,
0.1466864, -1.345385, 1.318488, 0, 0.7607843, 1, 1,
0.1473043, 0.9194442, 0.893628, 0, 0.7529412, 1, 1,
0.1478871, -1.69692, 2.182918, 0, 0.7490196, 1, 1,
0.1498013, -0.06244322, 1.471593, 0, 0.7411765, 1, 1,
0.1583523, 1.172873, 0.2012251, 0, 0.7372549, 1, 1,
0.159159, 0.8536322, 1.696673, 0, 0.7294118, 1, 1,
0.1598352, 0.1134034, 2.411134, 0, 0.7254902, 1, 1,
0.1603825, -0.5087991, 3.375272, 0, 0.7176471, 1, 1,
0.160484, 1.52341, 1.045138, 0, 0.7137255, 1, 1,
0.1607554, -1.587472, 3.971027, 0, 0.7058824, 1, 1,
0.1650633, 1.902196, 1.482093, 0, 0.6980392, 1, 1,
0.1659342, 2.395622, -0.6202419, 0, 0.6941177, 1, 1,
0.1674975, 0.729437, 1.517455, 0, 0.6862745, 1, 1,
0.170549, -1.00499, 2.621012, 0, 0.682353, 1, 1,
0.1750135, 0.6644315, 1.079313, 0, 0.6745098, 1, 1,
0.1752787, 0.4508454, 1.03955, 0, 0.6705883, 1, 1,
0.175975, 1.543665, -0.1086466, 0, 0.6627451, 1, 1,
0.1815486, 1.279317, 1.067793, 0, 0.6588235, 1, 1,
0.1816583, 0.9062108, -0.4351273, 0, 0.6509804, 1, 1,
0.1817408, -0.2392785, 2.173709, 0, 0.6470588, 1, 1,
0.183077, 1.625287, 1.195516, 0, 0.6392157, 1, 1,
0.1872902, -0.1413279, 4.718919, 0, 0.6352941, 1, 1,
0.1920732, -0.004087043, 0.2613887, 0, 0.627451, 1, 1,
0.1934813, 0.06083541, 0.7541314, 0, 0.6235294, 1, 1,
0.1951182, -0.4289779, 1.341817, 0, 0.6156863, 1, 1,
0.2005159, 0.5503219, 0.4017851, 0, 0.6117647, 1, 1,
0.2011202, -3.041365, 3.005511, 0, 0.6039216, 1, 1,
0.2084164, 1.164158, 0.5234202, 0, 0.5960785, 1, 1,
0.2101998, 0.8022375, 0.5192599, 0, 0.5921569, 1, 1,
0.2150948, 1.730068, 0.5408328, 0, 0.5843138, 1, 1,
0.2178417, -1.571674, 2.040371, 0, 0.5803922, 1, 1,
0.2186124, -0.1444236, 0.9562685, 0, 0.572549, 1, 1,
0.2187658, 1.887935, -0.7739614, 0, 0.5686275, 1, 1,
0.2222969, -0.5408023, 1.113118, 0, 0.5607843, 1, 1,
0.2234062, 0.949696, 1.148703, 0, 0.5568628, 1, 1,
0.2284377, -0.8261456, 2.336245, 0, 0.5490196, 1, 1,
0.2297615, 0.4499949, 0.7481649, 0, 0.5450981, 1, 1,
0.2311344, 0.8437214, 2.304818, 0, 0.5372549, 1, 1,
0.2333302, 0.1831544, 0.6698015, 0, 0.5333334, 1, 1,
0.2411938, -1.004224, 3.117336, 0, 0.5254902, 1, 1,
0.2413944, 0.9388817, -0.1506937, 0, 0.5215687, 1, 1,
0.2439547, 1.133726, 0.231476, 0, 0.5137255, 1, 1,
0.248456, 0.785185, 1.708226, 0, 0.509804, 1, 1,
0.2495389, -0.125909, 1.583337, 0, 0.5019608, 1, 1,
0.2533961, 0.2279714, -1.211946, 0, 0.4941176, 1, 1,
0.2556861, -0.6803394, 1.686062, 0, 0.4901961, 1, 1,
0.2606007, -0.5989817, 2.034189, 0, 0.4823529, 1, 1,
0.2612132, -0.5223528, 2.552906, 0, 0.4784314, 1, 1,
0.2624846, -0.4596557, 2.357774, 0, 0.4705882, 1, 1,
0.2637163, -0.6615047, 2.528128, 0, 0.4666667, 1, 1,
0.2695185, -2.738996, 3.786952, 0, 0.4588235, 1, 1,
0.2723688, -0.9222454, 2.864055, 0, 0.454902, 1, 1,
0.2724276, -0.3669837, 0.9415135, 0, 0.4470588, 1, 1,
0.2749803, 0.03362247, 2.471718, 0, 0.4431373, 1, 1,
0.2751155, 1.197047, 0.1310162, 0, 0.4352941, 1, 1,
0.2783783, -0.8112725, 5.953949, 0, 0.4313726, 1, 1,
0.2793725, 0.9666266, -0.0925689, 0, 0.4235294, 1, 1,
0.2807277, -1.634439, 1.475156, 0, 0.4196078, 1, 1,
0.2807953, 0.4313912, -0.9977924, 0, 0.4117647, 1, 1,
0.2824945, 0.7785354, -0.2786865, 0, 0.4078431, 1, 1,
0.2848641, -1.264224, 3.649241, 0, 0.4, 1, 1,
0.2893765, -0.0007991975, 1.57094, 0, 0.3921569, 1, 1,
0.29314, 0.5152403, -0.02455988, 0, 0.3882353, 1, 1,
0.2957421, 0.8030035, 1.191549, 0, 0.3803922, 1, 1,
0.2962285, 0.9945447, 1.383204, 0, 0.3764706, 1, 1,
0.2963421, -2.867384, 3.854184, 0, 0.3686275, 1, 1,
0.2974026, -0.8823454, 2.18164, 0, 0.3647059, 1, 1,
0.2983062, -0.004944059, -0.5871635, 0, 0.3568628, 1, 1,
0.2984889, -0.4266107, 4.059313, 0, 0.3529412, 1, 1,
0.299391, 0.9602217, 0.5347551, 0, 0.345098, 1, 1,
0.3030567, -0.7006434, 1.809726, 0, 0.3411765, 1, 1,
0.3057723, 0.3293689, -0.4625891, 0, 0.3333333, 1, 1,
0.3058338, 0.3912382, 0.4669787, 0, 0.3294118, 1, 1,
0.308069, 1.646883, -1.393677, 0, 0.3215686, 1, 1,
0.3126818, -1.705035, 4.328873, 0, 0.3176471, 1, 1,
0.3155057, 0.3666789, 3.074826, 0, 0.3098039, 1, 1,
0.3166133, -0.8027713, 2.853517, 0, 0.3058824, 1, 1,
0.3177771, -0.4808743, 3.312708, 0, 0.2980392, 1, 1,
0.3183625, 0.6576388, 1.798759, 0, 0.2901961, 1, 1,
0.3220491, 0.04366993, 1.882271, 0, 0.2862745, 1, 1,
0.3227912, 0.3604063, -0.003094607, 0, 0.2784314, 1, 1,
0.3228732, -1.532664, 2.05746, 0, 0.2745098, 1, 1,
0.3270862, -0.9151899, 2.121343, 0, 0.2666667, 1, 1,
0.3284502, -1.351179, 2.916383, 0, 0.2627451, 1, 1,
0.329596, -0.6968136, 0.9771074, 0, 0.254902, 1, 1,
0.3323443, 1.252861, -0.6658657, 0, 0.2509804, 1, 1,
0.3373679, -0.03127834, 1.745325, 0, 0.2431373, 1, 1,
0.342566, -0.8366238, 2.344436, 0, 0.2392157, 1, 1,
0.3484381, 0.6697052, 1.628884, 0, 0.2313726, 1, 1,
0.3536618, -0.7750257, 2.976265, 0, 0.227451, 1, 1,
0.358424, -0.2911274, 3.731988, 0, 0.2196078, 1, 1,
0.359676, -0.3392096, 2.713823, 0, 0.2156863, 1, 1,
0.367227, 0.1439967, 2.054448, 0, 0.2078431, 1, 1,
0.3704972, 0.131801, -0.5537952, 0, 0.2039216, 1, 1,
0.3709252, -1.315041, 2.456588, 0, 0.1960784, 1, 1,
0.3727921, -2.034347, 3.743649, 0, 0.1882353, 1, 1,
0.3728285, -1.635139, 1.937269, 0, 0.1843137, 1, 1,
0.3733356, -0.7922167, 3.118259, 0, 0.1764706, 1, 1,
0.3737425, -0.6031164, 2.18354, 0, 0.172549, 1, 1,
0.3742269, -0.8410814, 1.387776, 0, 0.1647059, 1, 1,
0.3778454, -1.081867, 2.591481, 0, 0.1607843, 1, 1,
0.3797997, -0.601049, 2.334884, 0, 0.1529412, 1, 1,
0.380394, 0.3273608, 0.9046026, 0, 0.1490196, 1, 1,
0.3816165, 1.047498, 0.6607087, 0, 0.1411765, 1, 1,
0.3818483, 1.100831, 1.859036, 0, 0.1372549, 1, 1,
0.3848553, 1.119223, 1.289648, 0, 0.1294118, 1, 1,
0.3902655, 0.8043824, -0.8945668, 0, 0.1254902, 1, 1,
0.3987871, -0.002234621, 1.22366, 0, 0.1176471, 1, 1,
0.4020017, -1.085244, 3.082041, 0, 0.1137255, 1, 1,
0.4048241, 1.228972, 1.522436, 0, 0.1058824, 1, 1,
0.4065008, 0.04074101, 2.943743, 0, 0.09803922, 1, 1,
0.4084107, -0.1419755, 2.31902, 0, 0.09411765, 1, 1,
0.4093436, 0.2665137, 1.148975, 0, 0.08627451, 1, 1,
0.4169735, -0.8490734, 3.420957, 0, 0.08235294, 1, 1,
0.4204768, 0.8141034, 3.491724, 0, 0.07450981, 1, 1,
0.4218727, -0.1195109, 0.5354443, 0, 0.07058824, 1, 1,
0.422998, -0.8688863, 2.081799, 0, 0.0627451, 1, 1,
0.4272008, -1.841949, 3.325629, 0, 0.05882353, 1, 1,
0.4375217, -0.8096633, 2.410877, 0, 0.05098039, 1, 1,
0.440141, 1.566941, 1.918873, 0, 0.04705882, 1, 1,
0.4416776, 0.4947162, 0.3287551, 0, 0.03921569, 1, 1,
0.4438771, 0.1334309, 1.216646, 0, 0.03529412, 1, 1,
0.4455345, 0.2056781, 3.731334, 0, 0.02745098, 1, 1,
0.4465018, -0.3193035, 2.966743, 0, 0.02352941, 1, 1,
0.4474198, 0.7765241, 0.5895317, 0, 0.01568628, 1, 1,
0.4498514, 0.245586, 1.012547, 0, 0.01176471, 1, 1,
0.4513357, 0.04372548, 2.550461, 0, 0.003921569, 1, 1,
0.4555237, 0.2986516, 0.009138969, 0.003921569, 0, 1, 1,
0.4618685, -0.8605508, 1.937245, 0.007843138, 0, 1, 1,
0.4620253, 0.4500083, -0.4088983, 0.01568628, 0, 1, 1,
0.4649898, 0.5275523, -2.045178, 0.01960784, 0, 1, 1,
0.4665141, 0.8051074, -1.90833, 0.02745098, 0, 1, 1,
0.4698788, -0.2951741, 2.049742, 0.03137255, 0, 1, 1,
0.4706432, 0.9365196, 0.2247553, 0.03921569, 0, 1, 1,
0.472759, 0.01395291, 2.363611, 0.04313726, 0, 1, 1,
0.4774113, -2.706984, 2.711973, 0.05098039, 0, 1, 1,
0.4783408, 2.183889, -1.022055, 0.05490196, 0, 1, 1,
0.478412, 1.488933, 1.859292, 0.0627451, 0, 1, 1,
0.478419, 0.3884007, 1.232979, 0.06666667, 0, 1, 1,
0.4786846, 0.03806064, 2.415919, 0.07450981, 0, 1, 1,
0.4840939, 1.916803, 0.4951607, 0.07843138, 0, 1, 1,
0.4910269, 0.9834751, 0.146803, 0.08627451, 0, 1, 1,
0.4911025, 0.5580685, 0.3026999, 0.09019608, 0, 1, 1,
0.4921816, 1.073705, 0.2087502, 0.09803922, 0, 1, 1,
0.4956637, -0.3278157, 0.8074296, 0.1058824, 0, 1, 1,
0.4974653, -0.109764, 1.367848, 0.1098039, 0, 1, 1,
0.4983802, 0.07597189, 1.273036, 0.1176471, 0, 1, 1,
0.4998502, -0.8543146, 2.424976, 0.1215686, 0, 1, 1,
0.5007118, -1.611544, 3.769697, 0.1294118, 0, 1, 1,
0.5010605, -0.3894831, 0.2890397, 0.1333333, 0, 1, 1,
0.5041689, -0.5789828, 1.41016, 0.1411765, 0, 1, 1,
0.5093615, -1.672699, 2.976019, 0.145098, 0, 1, 1,
0.5114148, 0.3194041, 1.364043, 0.1529412, 0, 1, 1,
0.5167649, 1.065859, -0.1423448, 0.1568628, 0, 1, 1,
0.5197488, 0.2889822, 0.7160717, 0.1647059, 0, 1, 1,
0.5253199, -1.286908, 2.716872, 0.1686275, 0, 1, 1,
0.5261758, 0.9724749, 0.3476471, 0.1764706, 0, 1, 1,
0.5272781, 1.827426, 0.3906869, 0.1803922, 0, 1, 1,
0.527932, 0.5732359, 0.06952918, 0.1882353, 0, 1, 1,
0.532927, -0.2286011, 3.26654, 0.1921569, 0, 1, 1,
0.5337462, -0.4186914, 0.9281077, 0.2, 0, 1, 1,
0.5338234, -0.7251288, 1.989552, 0.2078431, 0, 1, 1,
0.5343125, 0.6017598, -0.579155, 0.2117647, 0, 1, 1,
0.5359548, -0.3671373, 0.9308214, 0.2196078, 0, 1, 1,
0.5387108, -0.5180817, 1.395381, 0.2235294, 0, 1, 1,
0.5400002, 1.183746, 1.026411, 0.2313726, 0, 1, 1,
0.5403179, 1.118815, -0.7334777, 0.2352941, 0, 1, 1,
0.540389, 1.493949, 0.0263129, 0.2431373, 0, 1, 1,
0.5446001, 2.336716, 0.7669811, 0.2470588, 0, 1, 1,
0.5450425, -1.08239, 0.2363351, 0.254902, 0, 1, 1,
0.5467281, 1.02089, 0.1605332, 0.2588235, 0, 1, 1,
0.5488875, 1.83089, -1.083873, 0.2666667, 0, 1, 1,
0.5508986, 1.702701, 0.5280294, 0.2705882, 0, 1, 1,
0.5519623, -2.969747, 3.02327, 0.2784314, 0, 1, 1,
0.5537257, 0.5136454, -0.1623248, 0.282353, 0, 1, 1,
0.561454, -0.5286211, 2.027161, 0.2901961, 0, 1, 1,
0.5640792, -0.4174898, 3.686723, 0.2941177, 0, 1, 1,
0.5648119, -0.8914699, 3.056851, 0.3019608, 0, 1, 1,
0.5695226, 0.2520668, 0.7541546, 0.3098039, 0, 1, 1,
0.5697867, -0.1637548, 2.584285, 0.3137255, 0, 1, 1,
0.5829327, 0.5009522, -0.3081021, 0.3215686, 0, 1, 1,
0.5855989, -0.1164482, 1.427569, 0.3254902, 0, 1, 1,
0.5864094, -0.647694, 1.992772, 0.3333333, 0, 1, 1,
0.5872362, 1.234554, 3.173224, 0.3372549, 0, 1, 1,
0.5890769, -0.2141129, 1.824331, 0.345098, 0, 1, 1,
0.5943867, -0.231044, 1.301815, 0.3490196, 0, 1, 1,
0.6067189, 0.1684454, 2.275703, 0.3568628, 0, 1, 1,
0.6085932, -0.769972, 2.93944, 0.3607843, 0, 1, 1,
0.6149676, 0.008446734, 0.125951, 0.3686275, 0, 1, 1,
0.6197515, -0.4830442, 2.86245, 0.372549, 0, 1, 1,
0.6237059, -0.3751526, 2.203972, 0.3803922, 0, 1, 1,
0.6265629, -0.02449757, 2.062512, 0.3843137, 0, 1, 1,
0.6265805, -1.245454, 3.053739, 0.3921569, 0, 1, 1,
0.6296674, -0.5886732, 2.450399, 0.3960784, 0, 1, 1,
0.6300291, -1.108316, 1.342195, 0.4039216, 0, 1, 1,
0.6308903, -0.9769819, 1.845213, 0.4117647, 0, 1, 1,
0.6370871, 0.7554558, 0.6419947, 0.4156863, 0, 1, 1,
0.6383702, -0.2535858, 1.692025, 0.4235294, 0, 1, 1,
0.6429055, 0.6412951, 0.7357233, 0.427451, 0, 1, 1,
0.6444424, 1.927771, 0.7409469, 0.4352941, 0, 1, 1,
0.6502732, -0.2301627, 1.854429, 0.4392157, 0, 1, 1,
0.652432, 0.38273, 1.4905, 0.4470588, 0, 1, 1,
0.6580365, 1.425181, -1.25643, 0.4509804, 0, 1, 1,
0.6704869, 0.5459729, 1.38401, 0.4588235, 0, 1, 1,
0.6716611, 0.7263026, 2.364238, 0.4627451, 0, 1, 1,
0.6740883, 0.7229636, -0.1075763, 0.4705882, 0, 1, 1,
0.6763033, 0.7510514, 2.048815, 0.4745098, 0, 1, 1,
0.6804302, -1.918585, 3.519913, 0.4823529, 0, 1, 1,
0.6823003, 0.7464319, 1.677081, 0.4862745, 0, 1, 1,
0.6828136, -0.2382003, 0.8633481, 0.4941176, 0, 1, 1,
0.6892912, -0.2455988, 2.094429, 0.5019608, 0, 1, 1,
0.6913905, 0.3689539, 1.848482, 0.5058824, 0, 1, 1,
0.6925925, 0.07138094, 1.280447, 0.5137255, 0, 1, 1,
0.6945168, -0.5603573, 3.581189, 0.5176471, 0, 1, 1,
0.6954758, 0.8679433, 1.16004, 0.5254902, 0, 1, 1,
0.7018613, 0.6692266, -0.2157801, 0.5294118, 0, 1, 1,
0.7032376, 0.8297905, 0.8795533, 0.5372549, 0, 1, 1,
0.7062658, 0.7805517, -0.6834494, 0.5411765, 0, 1, 1,
0.7085324, -2.752695, 3.251868, 0.5490196, 0, 1, 1,
0.7193508, -0.6182936, 2.052034, 0.5529412, 0, 1, 1,
0.7208382, -2.230741, 3.016213, 0.5607843, 0, 1, 1,
0.7220212, 1.605868, 2.479755, 0.5647059, 0, 1, 1,
0.7240536, -1.259582, 1.725726, 0.572549, 0, 1, 1,
0.7288249, 1.368469, 0.23925, 0.5764706, 0, 1, 1,
0.7313795, -0.7844108, 1.053954, 0.5843138, 0, 1, 1,
0.7328792, 0.3932743, -0.4871451, 0.5882353, 0, 1, 1,
0.7331433, 0.2619751, 2.234143, 0.5960785, 0, 1, 1,
0.7359742, -0.5364702, 2.648446, 0.6039216, 0, 1, 1,
0.738131, 0.9021245, 1.659961, 0.6078432, 0, 1, 1,
0.7387626, 0.6533725, -1.302899, 0.6156863, 0, 1, 1,
0.7457506, 2.353813, -0.3030794, 0.6196079, 0, 1, 1,
0.7480534, -0.7494996, 3.498502, 0.627451, 0, 1, 1,
0.7489901, 1.795697, -1.244848, 0.6313726, 0, 1, 1,
0.7544184, 1.499161, 0.57822, 0.6392157, 0, 1, 1,
0.7630959, 0.7850062, 0.3955063, 0.6431373, 0, 1, 1,
0.7672356, -0.08481385, 0.12698, 0.6509804, 0, 1, 1,
0.771273, 0.470084, 0.6198, 0.654902, 0, 1, 1,
0.7723446, 0.228831, 1.172326, 0.6627451, 0, 1, 1,
0.7772903, 0.8145446, -0.0177573, 0.6666667, 0, 1, 1,
0.7824129, -0.9382187, 0.9007447, 0.6745098, 0, 1, 1,
0.7840486, -0.04285699, 2.280335, 0.6784314, 0, 1, 1,
0.7894236, 1.558822, 0.3741344, 0.6862745, 0, 1, 1,
0.7902497, 0.6399019, -0.9709904, 0.6901961, 0, 1, 1,
0.7960183, -0.7237546, 1.297124, 0.6980392, 0, 1, 1,
0.8010311, 0.3690304, 0.07925808, 0.7058824, 0, 1, 1,
0.8052496, -0.8394557, 1.652598, 0.7098039, 0, 1, 1,
0.8108495, 1.009817, 3.022125, 0.7176471, 0, 1, 1,
0.8112561, 0.8687316, -0.1246036, 0.7215686, 0, 1, 1,
0.8126682, 0.1040345, 0.6504917, 0.7294118, 0, 1, 1,
0.8187382, -2.926968, 3.303997, 0.7333333, 0, 1, 1,
0.8250567, 1.209231, 2.471144, 0.7411765, 0, 1, 1,
0.8269891, -0.3213089, 0.1597012, 0.7450981, 0, 1, 1,
0.8318428, -0.4667147, 0.6690303, 0.7529412, 0, 1, 1,
0.8321638, 0.8475524, 0.01985234, 0.7568628, 0, 1, 1,
0.8363783, 0.9505859, -0.2873918, 0.7647059, 0, 1, 1,
0.8392122, 0.07022292, 0.7541735, 0.7686275, 0, 1, 1,
0.8409967, 1.022818, 0.8384312, 0.7764706, 0, 1, 1,
0.8446949, 0.1497196, 0.5968229, 0.7803922, 0, 1, 1,
0.8451225, -0.2642013, 2.115844, 0.7882353, 0, 1, 1,
0.8497007, -0.377224, 3.084257, 0.7921569, 0, 1, 1,
0.8540509, 0.1632223, 1.978869, 0.8, 0, 1, 1,
0.8614985, -1.153662, 3.206167, 0.8078431, 0, 1, 1,
0.8617811, 0.8133534, 2.012437, 0.8117647, 0, 1, 1,
0.8625455, 0.8181468, -0.1056733, 0.8196079, 0, 1, 1,
0.8628002, 0.6397095, -0.01838576, 0.8235294, 0, 1, 1,
0.8784755, 0.5370659, 1.38206, 0.8313726, 0, 1, 1,
0.8785518, -0.1936278, 1.391354, 0.8352941, 0, 1, 1,
0.8789379, -0.3942909, 0.1869046, 0.8431373, 0, 1, 1,
0.8886698, -1.013358, 1.743715, 0.8470588, 0, 1, 1,
0.8908958, -0.7464947, 3.138448, 0.854902, 0, 1, 1,
0.8951132, 0.8638366, 1.425841, 0.8588235, 0, 1, 1,
0.9036813, 0.1316157, 0.3346187, 0.8666667, 0, 1, 1,
0.9040955, -2.278823, 3.862821, 0.8705882, 0, 1, 1,
0.9060665, -0.6542939, 2.249754, 0.8784314, 0, 1, 1,
0.912613, 0.09361324, 3.981172, 0.8823529, 0, 1, 1,
0.9128953, -0.1685828, 0.7852654, 0.8901961, 0, 1, 1,
0.9149532, 0.4738881, 1.418852, 0.8941177, 0, 1, 1,
0.9214031, 0.1933029, 1.841371, 0.9019608, 0, 1, 1,
0.9220023, 0.2818133, 1.276492, 0.9098039, 0, 1, 1,
0.9263531, -0.7002548, 2.263737, 0.9137255, 0, 1, 1,
0.9266811, 1.897321, 1.290132, 0.9215686, 0, 1, 1,
0.931184, -1.147781, 1.776215, 0.9254902, 0, 1, 1,
0.9395239, -0.08488944, 1.933375, 0.9333333, 0, 1, 1,
0.9444568, -0.5813854, 2.977559, 0.9372549, 0, 1, 1,
0.9456999, -1.463313, 1.861921, 0.945098, 0, 1, 1,
0.9473474, 1.55486, 0.5315554, 0.9490196, 0, 1, 1,
0.9481803, -0.2728804, 1.577019, 0.9568627, 0, 1, 1,
0.9492328, 1.245904, -0.3938268, 0.9607843, 0, 1, 1,
0.9531374, -0.6159515, 2.858634, 0.9686275, 0, 1, 1,
0.959946, 0.3040834, 1.615913, 0.972549, 0, 1, 1,
0.9599943, -0.09061459, 1.28371, 0.9803922, 0, 1, 1,
0.9670226, -1.627702, 1.466448, 0.9843137, 0, 1, 1,
0.9699354, -0.3006381, 2.038157, 0.9921569, 0, 1, 1,
0.9717138, -0.5754232, 2.227371, 0.9960784, 0, 1, 1,
0.9734588, -1.259473, 3.200408, 1, 0, 0.9960784, 1,
0.97377, -0.2885695, 0.9042505, 1, 0, 0.9882353, 1,
0.9747525, -0.5195015, 1.415945, 1, 0, 0.9843137, 1,
0.9871575, -0.5955981, 1.355591, 1, 0, 0.9764706, 1,
0.9911177, -0.06720731, 1.010334, 1, 0, 0.972549, 1,
0.9993962, -1.891188, 1.645926, 1, 0, 0.9647059, 1,
1.004898, -0.2600535, 1.502759, 1, 0, 0.9607843, 1,
1.008944, 0.549181, -0.5335321, 1, 0, 0.9529412, 1,
1.011143, 1.709785, 0.3461062, 1, 0, 0.9490196, 1,
1.012355, 1.697482, 0.1254553, 1, 0, 0.9411765, 1,
1.019, -0.1214951, 1.332569, 1, 0, 0.9372549, 1,
1.021576, -0.06412111, 2.869759, 1, 0, 0.9294118, 1,
1.027448, -1.397789, 3.339914, 1, 0, 0.9254902, 1,
1.031348, 0.6585183, 0.6174759, 1, 0, 0.9176471, 1,
1.036997, -0.3484174, -0.7134883, 1, 0, 0.9137255, 1,
1.039004, -0.1116233, 0.3756302, 1, 0, 0.9058824, 1,
1.060432, 0.5509118, -1.271455, 1, 0, 0.9019608, 1,
1.064199, 1.553361, -1.552701, 1, 0, 0.8941177, 1,
1.071509, 0.2662041, 1.966024, 1, 0, 0.8862745, 1,
1.072843, -0.1783697, 2.495592, 1, 0, 0.8823529, 1,
1.076735, -1.501479, 3.450948, 1, 0, 0.8745098, 1,
1.078231, 0.09445688, 0.9929233, 1, 0, 0.8705882, 1,
1.081658, -0.343775, 0.8242047, 1, 0, 0.8627451, 1,
1.083448, -0.5411469, 1.92769, 1, 0, 0.8588235, 1,
1.09715, 1.241914, 0.6459544, 1, 0, 0.8509804, 1,
1.101556, 0.6307945, -0.2727636, 1, 0, 0.8470588, 1,
1.105603, -0.8353698, 1.956717, 1, 0, 0.8392157, 1,
1.11565, -0.6418684, 2.693454, 1, 0, 0.8352941, 1,
1.121342, -0.5075631, 2.393042, 1, 0, 0.827451, 1,
1.122043, -0.3201014, 1.490295, 1, 0, 0.8235294, 1,
1.125307, -0.6491119, 1.094774, 1, 0, 0.8156863, 1,
1.126617, -0.6228377, 1.00646, 1, 0, 0.8117647, 1,
1.135409, 1.636931, 0.6826875, 1, 0, 0.8039216, 1,
1.137335, -1.094711, 2.300482, 1, 0, 0.7960784, 1,
1.142689, -0.517495, 3.035419, 1, 0, 0.7921569, 1,
1.145511, -0.7103273, 1.867087, 1, 0, 0.7843137, 1,
1.150466, 0.5903847, -0.2357573, 1, 0, 0.7803922, 1,
1.158519, -2.078106, 4.975822, 1, 0, 0.772549, 1,
1.15853, -0.4315054, 2.122661, 1, 0, 0.7686275, 1,
1.159531, 0.1052447, 2.091339, 1, 0, 0.7607843, 1,
1.165417, -1.62326, 1.492981, 1, 0, 0.7568628, 1,
1.167391, -0.2409985, 0.599371, 1, 0, 0.7490196, 1,
1.171899, -1.762239, 3.384843, 1, 0, 0.7450981, 1,
1.175739, 0.8516032, 2.45979, 1, 0, 0.7372549, 1,
1.177824, -0.8946386, 2.636049, 1, 0, 0.7333333, 1,
1.18264, 1.232849, 1.060805, 1, 0, 0.7254902, 1,
1.184267, -0.1039245, -0.2654874, 1, 0, 0.7215686, 1,
1.185405, 1.140219, 1.048345, 1, 0, 0.7137255, 1,
1.187196, -0.8078979, 2.847699, 1, 0, 0.7098039, 1,
1.194208, -0.2456343, 1.757975, 1, 0, 0.7019608, 1,
1.212002, 1.372911, 1.370025, 1, 0, 0.6941177, 1,
1.213218, -0.4449913, 3.500323, 1, 0, 0.6901961, 1,
1.215029, -1.000582, 1.524926, 1, 0, 0.682353, 1,
1.21982, 1.340807, -0.2471213, 1, 0, 0.6784314, 1,
1.220464, 0.170747, 1.710764, 1, 0, 0.6705883, 1,
1.227028, 0.4561998, 2.89752, 1, 0, 0.6666667, 1,
1.231036, 0.3552063, 1.561684, 1, 0, 0.6588235, 1,
1.233728, 1.068603, 1.280477, 1, 0, 0.654902, 1,
1.234341, -1.03361, 3.56057, 1, 0, 0.6470588, 1,
1.234557, 0.2670044, 0.814823, 1, 0, 0.6431373, 1,
1.247517, -1.169021, 1.642586, 1, 0, 0.6352941, 1,
1.248443, 0.1177152, 1.904882, 1, 0, 0.6313726, 1,
1.248878, 0.551945, -1.154557, 1, 0, 0.6235294, 1,
1.269745, 0.4594014, 1.647747, 1, 0, 0.6196079, 1,
1.270303, 0.2050032, 0.5751517, 1, 0, 0.6117647, 1,
1.274477, 0.06399109, 1.150205, 1, 0, 0.6078432, 1,
1.275993, -0.2827643, 2.926598, 1, 0, 0.6, 1,
1.279543, 0.4368041, 0.1744475, 1, 0, 0.5921569, 1,
1.289288, -0.6899027, 3.092759, 1, 0, 0.5882353, 1,
1.29046, 0.3680335, 0.6219532, 1, 0, 0.5803922, 1,
1.299685, -0.2134356, 1.960038, 1, 0, 0.5764706, 1,
1.300187, -0.0171856, 1.041422, 1, 0, 0.5686275, 1,
1.320719, 0.8141627, -0.2501907, 1, 0, 0.5647059, 1,
1.327111, 0.2323486, 3.444114, 1, 0, 0.5568628, 1,
1.329645, 1.337212, 0.009427075, 1, 0, 0.5529412, 1,
1.331116, 0.4164626, 0.5970874, 1, 0, 0.5450981, 1,
1.338523, -0.2936393, 2.097689, 1, 0, 0.5411765, 1,
1.340276, -0.04926684, 0.4081673, 1, 0, 0.5333334, 1,
1.350173, -0.4723337, 2.314795, 1, 0, 0.5294118, 1,
1.350825, 0.9063304, 0.8349725, 1, 0, 0.5215687, 1,
1.35259, 0.9089848, 2.900079, 1, 0, 0.5176471, 1,
1.371612, -0.5855372, 3.591491, 1, 0, 0.509804, 1,
1.371826, -0.3012973, 2.32033, 1, 0, 0.5058824, 1,
1.373264, 0.8986875, -1.249258, 1, 0, 0.4980392, 1,
1.377012, 2.356868, -1.530777, 1, 0, 0.4901961, 1,
1.378201, -0.5737113, 1.562009, 1, 0, 0.4862745, 1,
1.397947, 0.1880011, -0.5045204, 1, 0, 0.4784314, 1,
1.40179, -1.232071, 1.447205, 1, 0, 0.4745098, 1,
1.411593, 0.1363728, 2.876874, 1, 0, 0.4666667, 1,
1.429665, 0.3197567, 0.6772779, 1, 0, 0.4627451, 1,
1.43016, 1.449189, 2.006655, 1, 0, 0.454902, 1,
1.433603, 0.3728224, 2.251915, 1, 0, 0.4509804, 1,
1.441581, -1.388692, 1.586641, 1, 0, 0.4431373, 1,
1.442017, 0.183669, 2.06069, 1, 0, 0.4392157, 1,
1.458309, 0.5654389, 2.457007, 1, 0, 0.4313726, 1,
1.460038, 0.1009527, 1.876982, 1, 0, 0.427451, 1,
1.466993, 0.07181251, 1.664774, 1, 0, 0.4196078, 1,
1.470773, -0.01924882, 2.996178, 1, 0, 0.4156863, 1,
1.472765, -1.438917, 1.280007, 1, 0, 0.4078431, 1,
1.477764, 1.366231, 1.163875, 1, 0, 0.4039216, 1,
1.494237, 0.1792067, 2.028698, 1, 0, 0.3960784, 1,
1.498863, -0.4951244, 4.201127, 1, 0, 0.3882353, 1,
1.502344, -1.235369, 2.346597, 1, 0, 0.3843137, 1,
1.505664, -0.4566162, 3.743472, 1, 0, 0.3764706, 1,
1.522177, -1.072522, 3.576255, 1, 0, 0.372549, 1,
1.523993, 0.3572552, 1.892921, 1, 0, 0.3647059, 1,
1.533364, 1.083968, 1.274633, 1, 0, 0.3607843, 1,
1.57585, -1.324476, 2.004611, 1, 0, 0.3529412, 1,
1.584958, -0.7011735, 3.03019, 1, 0, 0.3490196, 1,
1.586264, 2.660604, 0.8182536, 1, 0, 0.3411765, 1,
1.589752, -0.6954819, 1.62448, 1, 0, 0.3372549, 1,
1.607476, -0.03451963, 1.254551, 1, 0, 0.3294118, 1,
1.610445, 0.2088237, 1.067897, 1, 0, 0.3254902, 1,
1.617665, 0.654208, 1.308607, 1, 0, 0.3176471, 1,
1.618212, 1.032703, 1.333375, 1, 0, 0.3137255, 1,
1.622719, -0.9165372, 2.970771, 1, 0, 0.3058824, 1,
1.654986, -0.2242704, -0.06465009, 1, 0, 0.2980392, 1,
1.669395, 0.3636428, 0.8568602, 1, 0, 0.2941177, 1,
1.670158, -1.334738, 1.067334, 1, 0, 0.2862745, 1,
1.670168, -0.0860035, 1.999154, 1, 0, 0.282353, 1,
1.694147, 0.525175, 2.362411, 1, 0, 0.2745098, 1,
1.69456, -0.5506082, -0.5204825, 1, 0, 0.2705882, 1,
1.70199, -0.4743664, 3.518646, 1, 0, 0.2627451, 1,
1.718004, 1.411734, 1.706438, 1, 0, 0.2588235, 1,
1.726202, -0.4311349, 1.436378, 1, 0, 0.2509804, 1,
1.730075, 0.05906975, 0.8616766, 1, 0, 0.2470588, 1,
1.733646, 0.867335, -0.462973, 1, 0, 0.2392157, 1,
1.734841, -0.7201652, 1.707104, 1, 0, 0.2352941, 1,
1.789773, -1.273997, 2.17197, 1, 0, 0.227451, 1,
1.802621, 1.88155, 0.5329769, 1, 0, 0.2235294, 1,
1.828774, 0.01384065, 2.569378, 1, 0, 0.2156863, 1,
1.885445, 2.180618, 1.251143, 1, 0, 0.2117647, 1,
1.891742, 2.083629, 0.8560653, 1, 0, 0.2039216, 1,
1.900826, 0.3459429, 1.972214, 1, 0, 0.1960784, 1,
1.907042, 0.6975406, 2.013885, 1, 0, 0.1921569, 1,
1.923589, -0.05272691, 1.760315, 1, 0, 0.1843137, 1,
1.94109, 0.4733053, 2.103634, 1, 0, 0.1803922, 1,
1.955008, 0.2315262, 3.276314, 1, 0, 0.172549, 1,
1.978372, -0.3949187, 1.676594, 1, 0, 0.1686275, 1,
1.993018, -0.990272, 1.614888, 1, 0, 0.1607843, 1,
2.018938, 0.4384514, 1.822209, 1, 0, 0.1568628, 1,
2.023411, -0.4303443, 2.613368, 1, 0, 0.1490196, 1,
2.093436, -1.38148, 0.3626061, 1, 0, 0.145098, 1,
2.094535, 0.9947259, 1.435707, 1, 0, 0.1372549, 1,
2.105769, 0.2411145, 0.4279041, 1, 0, 0.1333333, 1,
2.127935, -0.2529787, 1.988802, 1, 0, 0.1254902, 1,
2.138533, 0.1223659, 1.081594, 1, 0, 0.1215686, 1,
2.150049, 0.3173764, -0.008563669, 1, 0, 0.1137255, 1,
2.150762, 0.9221343, 0.04706126, 1, 0, 0.1098039, 1,
2.15134, 0.3204532, 1.794661, 1, 0, 0.1019608, 1,
2.165717, -0.6156007, 2.097304, 1, 0, 0.09411765, 1,
2.166859, 0.3822175, 2.809147, 1, 0, 0.09019608, 1,
2.170461, -1.23425, 1.827123, 1, 0, 0.08235294, 1,
2.170841, 0.2390143, 1.733765, 1, 0, 0.07843138, 1,
2.192337, 0.2464503, -0.6012471, 1, 0, 0.07058824, 1,
2.196659, -3.024858, 3.584511, 1, 0, 0.06666667, 1,
2.235523, 0.26608, 1.276102, 1, 0, 0.05882353, 1,
2.321832, 1.78713, 1.053182, 1, 0, 0.05490196, 1,
2.381648, 1.222146, 0.7591438, 1, 0, 0.04705882, 1,
2.466083, 2.050748, 0.6194311, 1, 0, 0.04313726, 1,
2.476672, -0.8498791, -0.3756225, 1, 0, 0.03529412, 1,
2.522457, 0.553403, 1.691085, 1, 0, 0.03137255, 1,
2.661212, -0.06417921, 0.9399842, 1, 0, 0.02352941, 1,
2.67575, -0.6590704, 0.01089277, 1, 0, 0.01960784, 1,
2.808644, -1.109834, 1.807132, 1, 0, 0.01176471, 1,
3.909016, 1.818514, 0.6757234, 1, 0, 0.007843138, 1
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
0.09932017, -4.030066, -7.44589, 0, -0.5, 0.5, 0.5,
0.09932017, -4.030066, -7.44589, 1, -0.5, 0.5, 0.5,
0.09932017, -4.030066, -7.44589, 1, 1.5, 0.5, 0.5,
0.09932017, -4.030066, -7.44589, 0, 1.5, 0.5, 0.5
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
-5.001863, -0.1248397, -7.44589, 0, -0.5, 0.5, 0.5,
-5.001863, -0.1248397, -7.44589, 1, -0.5, 0.5, 0.5,
-5.001863, -0.1248397, -7.44589, 1, 1.5, 0.5, 0.5,
-5.001863, -0.1248397, -7.44589, 0, 1.5, 0.5, 0.5
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
-5.001863, -4.030066, 0.2250738, 0, -0.5, 0.5, 0.5,
-5.001863, -4.030066, 0.2250738, 1, -0.5, 0.5, 0.5,
-5.001863, -4.030066, 0.2250738, 1, 1.5, 0.5, 0.5,
-5.001863, -4.030066, 0.2250738, 0, 1.5, 0.5, 0.5
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
-2, -3.12886, -5.675668,
2, -3.12886, -5.675668,
-2, -3.12886, -5.675668,
-2, -3.279062, -5.970705,
0, -3.12886, -5.675668,
0, -3.279062, -5.970705,
2, -3.12886, -5.675668,
2, -3.279062, -5.970705
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
-2, -3.579463, -6.56078, 0, -0.5, 0.5, 0.5,
-2, -3.579463, -6.56078, 1, -0.5, 0.5, 0.5,
-2, -3.579463, -6.56078, 1, 1.5, 0.5, 0.5,
-2, -3.579463, -6.56078, 0, 1.5, 0.5, 0.5,
0, -3.579463, -6.56078, 0, -0.5, 0.5, 0.5,
0, -3.579463, -6.56078, 1, -0.5, 0.5, 0.5,
0, -3.579463, -6.56078, 1, 1.5, 0.5, 0.5,
0, -3.579463, -6.56078, 0, 1.5, 0.5, 0.5,
2, -3.579463, -6.56078, 0, -0.5, 0.5, 0.5,
2, -3.579463, -6.56078, 1, -0.5, 0.5, 0.5,
2, -3.579463, -6.56078, 1, 1.5, 0.5, 0.5,
2, -3.579463, -6.56078, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.824667, -3, -5.675668,
-3.824667, 2, -5.675668,
-3.824667, -3, -5.675668,
-4.020866, -3, -5.970705,
-3.824667, -2, -5.675668,
-4.020866, -2, -5.970705,
-3.824667, -1, -5.675668,
-4.020866, -1, -5.970705,
-3.824667, 0, -5.675668,
-4.020866, 0, -5.970705,
-3.824667, 1, -5.675668,
-4.020866, 1, -5.970705,
-3.824667, 2, -5.675668,
-4.020866, 2, -5.970705
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
-4.413265, -3, -6.56078, 0, -0.5, 0.5, 0.5,
-4.413265, -3, -6.56078, 1, -0.5, 0.5, 0.5,
-4.413265, -3, -6.56078, 1, 1.5, 0.5, 0.5,
-4.413265, -3, -6.56078, 0, 1.5, 0.5, 0.5,
-4.413265, -2, -6.56078, 0, -0.5, 0.5, 0.5,
-4.413265, -2, -6.56078, 1, -0.5, 0.5, 0.5,
-4.413265, -2, -6.56078, 1, 1.5, 0.5, 0.5,
-4.413265, -2, -6.56078, 0, 1.5, 0.5, 0.5,
-4.413265, -1, -6.56078, 0, -0.5, 0.5, 0.5,
-4.413265, -1, -6.56078, 1, -0.5, 0.5, 0.5,
-4.413265, -1, -6.56078, 1, 1.5, 0.5, 0.5,
-4.413265, -1, -6.56078, 0, 1.5, 0.5, 0.5,
-4.413265, 0, -6.56078, 0, -0.5, 0.5, 0.5,
-4.413265, 0, -6.56078, 1, -0.5, 0.5, 0.5,
-4.413265, 0, -6.56078, 1, 1.5, 0.5, 0.5,
-4.413265, 0, -6.56078, 0, 1.5, 0.5, 0.5,
-4.413265, 1, -6.56078, 0, -0.5, 0.5, 0.5,
-4.413265, 1, -6.56078, 1, -0.5, 0.5, 0.5,
-4.413265, 1, -6.56078, 1, 1.5, 0.5, 0.5,
-4.413265, 1, -6.56078, 0, 1.5, 0.5, 0.5,
-4.413265, 2, -6.56078, 0, -0.5, 0.5, 0.5,
-4.413265, 2, -6.56078, 1, -0.5, 0.5, 0.5,
-4.413265, 2, -6.56078, 1, 1.5, 0.5, 0.5,
-4.413265, 2, -6.56078, 0, 1.5, 0.5, 0.5
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
-3.824667, -3.12886, -4,
-3.824667, -3.12886, 4,
-3.824667, -3.12886, -4,
-4.020866, -3.279062, -4,
-3.824667, -3.12886, -2,
-4.020866, -3.279062, -2,
-3.824667, -3.12886, 0,
-4.020866, -3.279062, 0,
-3.824667, -3.12886, 2,
-4.020866, -3.279062, 2,
-3.824667, -3.12886, 4,
-4.020866, -3.279062, 4
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
-4.413265, -3.579463, -4, 0, -0.5, 0.5, 0.5,
-4.413265, -3.579463, -4, 1, -0.5, 0.5, 0.5,
-4.413265, -3.579463, -4, 1, 1.5, 0.5, 0.5,
-4.413265, -3.579463, -4, 0, 1.5, 0.5, 0.5,
-4.413265, -3.579463, -2, 0, -0.5, 0.5, 0.5,
-4.413265, -3.579463, -2, 1, -0.5, 0.5, 0.5,
-4.413265, -3.579463, -2, 1, 1.5, 0.5, 0.5,
-4.413265, -3.579463, -2, 0, 1.5, 0.5, 0.5,
-4.413265, -3.579463, 0, 0, -0.5, 0.5, 0.5,
-4.413265, -3.579463, 0, 1, -0.5, 0.5, 0.5,
-4.413265, -3.579463, 0, 1, 1.5, 0.5, 0.5,
-4.413265, -3.579463, 0, 0, 1.5, 0.5, 0.5,
-4.413265, -3.579463, 2, 0, -0.5, 0.5, 0.5,
-4.413265, -3.579463, 2, 1, -0.5, 0.5, 0.5,
-4.413265, -3.579463, 2, 1, 1.5, 0.5, 0.5,
-4.413265, -3.579463, 2, 0, 1.5, 0.5, 0.5,
-4.413265, -3.579463, 4, 0, -0.5, 0.5, 0.5,
-4.413265, -3.579463, 4, 1, -0.5, 0.5, 0.5,
-4.413265, -3.579463, 4, 1, 1.5, 0.5, 0.5,
-4.413265, -3.579463, 4, 0, 1.5, 0.5, 0.5
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
-3.824667, -3.12886, -5.675668,
-3.824667, 2.879181, -5.675668,
-3.824667, -3.12886, 6.125816,
-3.824667, 2.879181, 6.125816,
-3.824667, -3.12886, -5.675668,
-3.824667, -3.12886, 6.125816,
-3.824667, 2.879181, -5.675668,
-3.824667, 2.879181, 6.125816,
-3.824667, -3.12886, -5.675668,
4.023307, -3.12886, -5.675668,
-3.824667, -3.12886, 6.125816,
4.023307, -3.12886, 6.125816,
-3.824667, 2.879181, -5.675668,
4.023307, 2.879181, -5.675668,
-3.824667, 2.879181, 6.125816,
4.023307, 2.879181, 6.125816,
4.023307, -3.12886, -5.675668,
4.023307, 2.879181, -5.675668,
4.023307, -3.12886, 6.125816,
4.023307, 2.879181, 6.125816,
4.023307, -3.12886, -5.675668,
4.023307, -3.12886, 6.125816,
4.023307, 2.879181, -5.675668,
4.023307, 2.879181, 6.125816
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
var radius = 8.219872;
var distance = 36.57114;
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
mvMatrix.translate( -0.09932017, 0.1248397, -0.2250738 );
mvMatrix.scale( 1.132456, 1.479265, 0.7530822 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.57114);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
buprofezin<-read.table("buprofezin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-buprofezin$V2
```

```
## Error in eval(expr, envir, enclos): object 'buprofezin' not found
```

```r
y<-buprofezin$V3
```

```
## Error in eval(expr, envir, enclos): object 'buprofezin' not found
```

```r
z<-buprofezin$V4
```

```
## Error in eval(expr, envir, enclos): object 'buprofezin' not found
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
-3.710376, 0.9174703, -1.039982, 0, 0, 1, 1, 1,
-3.316413, 1.532798, -0.7867807, 1, 0, 0, 1, 1,
-3.068453, 1.008852, -1.782006, 1, 0, 0, 1, 1,
-3.020407, 0.05478779, -1.746085, 1, 0, 0, 1, 1,
-2.983537, -0.13481, 1.750782, 1, 0, 0, 1, 1,
-2.890582, -0.5204784, -2.15933, 1, 0, 0, 1, 1,
-2.811435, -0.4630054, -0.2025729, 0, 0, 0, 1, 1,
-2.717838, -0.4823237, -2.023474, 0, 0, 0, 1, 1,
-2.691392, 0.5063256, -0.8523144, 0, 0, 0, 1, 1,
-2.418916, 1.770361, -2.81954, 0, 0, 0, 1, 1,
-2.413727, -0.2388927, -0.5119452, 0, 0, 0, 1, 1,
-2.403376, 0.4367962, -1.524397, 0, 0, 0, 1, 1,
-2.388643, -0.545785, -0.8647542, 0, 0, 0, 1, 1,
-2.37816, 0.4370853, -2.069004, 1, 1, 1, 1, 1,
-2.35528, 0.2162097, -3.705701, 1, 1, 1, 1, 1,
-2.278291, -0.7949467, -2.48088, 1, 1, 1, 1, 1,
-2.193372, -0.410117, 0.04126973, 1, 1, 1, 1, 1,
-2.179487, -0.3088332, -0.7460487, 1, 1, 1, 1, 1,
-2.151848, 0.6452748, -1.020904, 1, 1, 1, 1, 1,
-1.974762, 0.3135482, -2.468576, 1, 1, 1, 1, 1,
-1.960973, 0.02592378, -1.053281, 1, 1, 1, 1, 1,
-1.95467, -0.6357462, -1.254756, 1, 1, 1, 1, 1,
-1.92773, -1.031827, -3.245529, 1, 1, 1, 1, 1,
-1.911218, -0.1459073, -2.094279, 1, 1, 1, 1, 1,
-1.901206, -1.65765, -1.613209, 1, 1, 1, 1, 1,
-1.896808, 0.2574157, -1.899344, 1, 1, 1, 1, 1,
-1.890971, 0.2282479, -2.029247, 1, 1, 1, 1, 1,
-1.876977, 1.550319, -1.341351, 1, 1, 1, 1, 1,
-1.873123, 0.09402131, -2.057224, 0, 0, 1, 1, 1,
-1.868767, -0.3133545, -1.421358, 1, 0, 0, 1, 1,
-1.825693, 0.06266823, -2.218363, 1, 0, 0, 1, 1,
-1.818536, 0.05994831, -0.6799502, 1, 0, 0, 1, 1,
-1.817355, 0.03068474, -1.66868, 1, 0, 0, 1, 1,
-1.810554, -0.6479099, -0.1613192, 1, 0, 0, 1, 1,
-1.781704, -0.5339555, -2.025081, 0, 0, 0, 1, 1,
-1.779042, 0.1148904, -1.699347, 0, 0, 0, 1, 1,
-1.768911, 0.2983778, -1.579766, 0, 0, 0, 1, 1,
-1.764746, -0.6934379, -3.042286, 0, 0, 0, 1, 1,
-1.761875, -0.772381, -0.700246, 0, 0, 0, 1, 1,
-1.751836, 2.14686, 0.5478998, 0, 0, 0, 1, 1,
-1.749634, -0.02146687, 0.05145604, 0, 0, 0, 1, 1,
-1.7339, -0.616977, -3.006291, 1, 1, 1, 1, 1,
-1.71523, -0.2713207, -1.41266, 1, 1, 1, 1, 1,
-1.70314, 1.123796, -1.004505, 1, 1, 1, 1, 1,
-1.698382, 0.8094193, -3.410034, 1, 1, 1, 1, 1,
-1.696849, -0.9775486, -1.689302, 1, 1, 1, 1, 1,
-1.694755, -0.4171562, -0.9049797, 1, 1, 1, 1, 1,
-1.68699, 0.3980566, -0.8624833, 1, 1, 1, 1, 1,
-1.675702, -0.523041, -1.755469, 1, 1, 1, 1, 1,
-1.672789, -1.74673, -3.808722, 1, 1, 1, 1, 1,
-1.660729, 1.291248, -2.151279, 1, 1, 1, 1, 1,
-1.659311, 1.307969, -1.08978, 1, 1, 1, 1, 1,
-1.655799, 0.6813337, -2.668745, 1, 1, 1, 1, 1,
-1.651252, 1.553654, -1.179109, 1, 1, 1, 1, 1,
-1.646984, -1.344976, -1.944087, 1, 1, 1, 1, 1,
-1.625458, 0.3506406, -1.063325, 1, 1, 1, 1, 1,
-1.625433, 0.9365535, -0.6280906, 0, 0, 1, 1, 1,
-1.624278, 2.041873, -1.002138, 1, 0, 0, 1, 1,
-1.616842, 1.526006, -3.317406, 1, 0, 0, 1, 1,
-1.605183, -0.9635543, -1.781509, 1, 0, 0, 1, 1,
-1.581151, 1.865823, -2.30735, 1, 0, 0, 1, 1,
-1.579554, -0.09362538, -1.0182, 1, 0, 0, 1, 1,
-1.563496, 0.4575148, -0.8248871, 0, 0, 0, 1, 1,
-1.562616, -0.3548932, -0.9477648, 0, 0, 0, 1, 1,
-1.548716, -0.1683512, -2.880583, 0, 0, 0, 1, 1,
-1.54404, 0.06425395, -3.010128, 0, 0, 0, 1, 1,
-1.534715, 0.7652092, 0.3674945, 0, 0, 0, 1, 1,
-1.529938, 0.879222, -1.118385, 0, 0, 0, 1, 1,
-1.515393, 0.8538526, -0.4548368, 0, 0, 0, 1, 1,
-1.499394, 1.197918, -0.6806971, 1, 1, 1, 1, 1,
-1.491125, 1.30941, -0.15014, 1, 1, 1, 1, 1,
-1.488966, -0.9495531, -1.910487, 1, 1, 1, 1, 1,
-1.472693, 0.2105072, -0.1112623, 1, 1, 1, 1, 1,
-1.47213, -0.2379202, -2.834551, 1, 1, 1, 1, 1,
-1.469564, -0.5972345, 1.05554, 1, 1, 1, 1, 1,
-1.461241, 0.5586782, -2.064158, 1, 1, 1, 1, 1,
-1.451692, -1.073418, -2.148909, 1, 1, 1, 1, 1,
-1.444684, 1.228343, -0.764979, 1, 1, 1, 1, 1,
-1.444242, -2.323166, -1.246651, 1, 1, 1, 1, 1,
-1.440794, 0.4411795, -0.5481735, 1, 1, 1, 1, 1,
-1.440283, 0.3164234, 0.02118748, 1, 1, 1, 1, 1,
-1.421138, -1.351434, -2.497736, 1, 1, 1, 1, 1,
-1.419118, 0.8985227, -1.465536, 1, 1, 1, 1, 1,
-1.40786, -0.975452, -3.50891, 1, 1, 1, 1, 1,
-1.407158, 1.015097, 0.3196921, 0, 0, 1, 1, 1,
-1.406701, 0.04903046, -1.641672, 1, 0, 0, 1, 1,
-1.403349, 1.153051, -1.636898, 1, 0, 0, 1, 1,
-1.382507, -1.070202, -2.141047, 1, 0, 0, 1, 1,
-1.379939, 0.4891445, -1.301424, 1, 0, 0, 1, 1,
-1.377374, -0.3503232, -3.048852, 1, 0, 0, 1, 1,
-1.375327, -0.2107151, -1.406485, 0, 0, 0, 1, 1,
-1.371127, 0.08985469, -1.054539, 0, 0, 0, 1, 1,
-1.359447, -1.148059, -2.966196, 0, 0, 0, 1, 1,
-1.357049, 1.441677, -0.6458505, 0, 0, 0, 1, 1,
-1.356251, -0.6946553, -1.11727, 0, 0, 0, 1, 1,
-1.354165, 0.7935085, -2.359507, 0, 0, 0, 1, 1,
-1.347764, 0.7002153, -2.347095, 0, 0, 0, 1, 1,
-1.328484, -0.2697713, -1.175429, 1, 1, 1, 1, 1,
-1.325421, 1.28456, -1.313568, 1, 1, 1, 1, 1,
-1.321818, -0.1866689, -0.8996649, 1, 1, 1, 1, 1,
-1.314695, -1.066841, -2.020698, 1, 1, 1, 1, 1,
-1.311221, 0.2985229, -2.542032, 1, 1, 1, 1, 1,
-1.306552, 0.4601779, -2.666926, 1, 1, 1, 1, 1,
-1.285885, 0.4140586, -2.176992, 1, 1, 1, 1, 1,
-1.284402, -1.636811, -1.954285, 1, 1, 1, 1, 1,
-1.276116, -0.6571096, -3.081167, 1, 1, 1, 1, 1,
-1.275414, -0.981096, -0.5929399, 1, 1, 1, 1, 1,
-1.270905, 0.5987071, -0.1978153, 1, 1, 1, 1, 1,
-1.268677, -0.3609282, -2.24445, 1, 1, 1, 1, 1,
-1.268407, 1.044982, -2.261744, 1, 1, 1, 1, 1,
-1.266621, 0.4182562, -3.484965, 1, 1, 1, 1, 1,
-1.26358, 0.956829, -2.432577, 1, 1, 1, 1, 1,
-1.262244, 0.4404763, -0.9721323, 0, 0, 1, 1, 1,
-1.260648, 0.2148465, -1.629294, 1, 0, 0, 1, 1,
-1.25569, -1.043795, -2.463257, 1, 0, 0, 1, 1,
-1.251833, -0.3144417, -3.006234, 1, 0, 0, 1, 1,
-1.249011, -1.500373, -2.506895, 1, 0, 0, 1, 1,
-1.246248, -1.594987, -4.032949, 1, 0, 0, 1, 1,
-1.244129, -0.09793611, -1.776993, 0, 0, 0, 1, 1,
-1.235352, -1.335873, -3.433884, 0, 0, 0, 1, 1,
-1.227608, -2.384006, -1.227879, 0, 0, 0, 1, 1,
-1.221607, 1.243479, -0.05634608, 0, 0, 0, 1, 1,
-1.220775, -0.1542976, -1.504662, 0, 0, 0, 1, 1,
-1.216481, -0.941618, -2.387768, 0, 0, 0, 1, 1,
-1.213072, -0.2191712, -2.647301, 0, 0, 0, 1, 1,
-1.212879, 0.931132, -0.9811105, 1, 1, 1, 1, 1,
-1.203205, 0.8734173, -0.7366412, 1, 1, 1, 1, 1,
-1.200341, 0.6540275, -1.227879, 1, 1, 1, 1, 1,
-1.199921, -0.1591412, -3.709476, 1, 1, 1, 1, 1,
-1.197458, 0.4699535, -1.115744, 1, 1, 1, 1, 1,
-1.187966, -2.102748, -2.132381, 1, 1, 1, 1, 1,
-1.183544, -0.1919398, -0.99399, 1, 1, 1, 1, 1,
-1.178009, -1.318594, -1.365112, 1, 1, 1, 1, 1,
-1.17652, -0.9836238, -2.359369, 1, 1, 1, 1, 1,
-1.17088, 1.309743, -1.000497, 1, 1, 1, 1, 1,
-1.148141, 0.3140627, -3.218513, 1, 1, 1, 1, 1,
-1.140167, 0.4170873, -2.143324, 1, 1, 1, 1, 1,
-1.135128, 0.9601713, -0.6787714, 1, 1, 1, 1, 1,
-1.134042, -1.107138, -1.845812, 1, 1, 1, 1, 1,
-1.133049, 0.879717, -1.879717, 1, 1, 1, 1, 1,
-1.129527, 0.2648776, -0.5177773, 0, 0, 1, 1, 1,
-1.122873, -0.2907343, -1.108078, 1, 0, 0, 1, 1,
-1.12213, -0.002314243, -2.269172, 1, 0, 0, 1, 1,
-1.118314, -0.9416876, -2.052263, 1, 0, 0, 1, 1,
-1.117718, 1.200136, -2.859709, 1, 0, 0, 1, 1,
-1.099725, 0.5902771, -0.8137028, 1, 0, 0, 1, 1,
-1.096832, -0.07061464, -0.9714175, 0, 0, 0, 1, 1,
-1.09485, 0.4722169, -2.645935, 0, 0, 0, 1, 1,
-1.084339, 1.211147, -2.318525, 0, 0, 0, 1, 1,
-1.078882, 1.061184, 0.12151, 0, 0, 0, 1, 1,
-1.077322, -0.03514535, 0.07637325, 0, 0, 0, 1, 1,
-1.06726, -0.7836305, -1.911228, 0, 0, 0, 1, 1,
-1.059257, -0.5883939, -4.271497, 0, 0, 0, 1, 1,
-1.04115, -1.592722, -2.243591, 1, 1, 1, 1, 1,
-1.040997, 1.296804, -0.5093259, 1, 1, 1, 1, 1,
-1.03844, -0.006648046, -0.7611736, 1, 1, 1, 1, 1,
-1.037147, -0.9350644, -2.916175, 1, 1, 1, 1, 1,
-1.03422, 0.6222376, -0.4600358, 1, 1, 1, 1, 1,
-1.02712, 0.463818, -1.851464, 1, 1, 1, 1, 1,
-1.023086, 0.1220704, -1.339499, 1, 1, 1, 1, 1,
-1.020642, -0.700018, -1.144359, 1, 1, 1, 1, 1,
-1.012949, -0.7972677, -1.485279, 1, 1, 1, 1, 1,
-1.010292, 1.392106, -0.2917559, 1, 1, 1, 1, 1,
-0.997874, 2.107066, 0.4767832, 1, 1, 1, 1, 1,
-0.9911077, -0.351328, -1.790261, 1, 1, 1, 1, 1,
-0.9865882, 2.172311, -0.03728676, 1, 1, 1, 1, 1,
-0.9797023, -1.032512, -3.312551, 1, 1, 1, 1, 1,
-0.9748733, 0.9017575, -1.298049, 1, 1, 1, 1, 1,
-0.9748545, 2.255699, 0.2619712, 0, 0, 1, 1, 1,
-0.9743239, -0.05760185, -1.923556, 1, 0, 0, 1, 1,
-0.9740162, -0.3771064, -0.7157425, 1, 0, 0, 1, 1,
-0.963136, 0.8793446, -0.7245864, 1, 0, 0, 1, 1,
-0.94641, 1.514654, -0.7273566, 1, 0, 0, 1, 1,
-0.9439393, -0.13821, -2.168694, 1, 0, 0, 1, 1,
-0.9401554, -0.5502693, -3.355552, 0, 0, 0, 1, 1,
-0.932676, -0.2670224, -0.07243413, 0, 0, 0, 1, 1,
-0.9276914, -2.016293, -2.860188, 0, 0, 0, 1, 1,
-0.9265277, 1.654429, -0.5947247, 0, 0, 0, 1, 1,
-0.9205291, -0.2851932, -0.4472999, 0, 0, 0, 1, 1,
-0.9178159, -0.6258536, -4.099206, 0, 0, 0, 1, 1,
-0.910478, 0.06644903, -0.4077691, 0, 0, 0, 1, 1,
-0.910127, 1.208083, 0.8520316, 1, 1, 1, 1, 1,
-0.9072878, -0.3482484, -1.185504, 1, 1, 1, 1, 1,
-0.9072636, 0.9296341, -1.748412, 1, 1, 1, 1, 1,
-0.9067466, -0.6277658, -1.778064, 1, 1, 1, 1, 1,
-0.9010552, 0.1130748, -0.9909807, 1, 1, 1, 1, 1,
-0.8971323, -1.201489, -2.544853, 1, 1, 1, 1, 1,
-0.8957223, 0.4801252, -1.280978, 1, 1, 1, 1, 1,
-0.8925868, 0.9990035, -1.643392, 1, 1, 1, 1, 1,
-0.8918341, 0.5506302, -0.6075268, 1, 1, 1, 1, 1,
-0.8905351, 0.9837976, -0.5815578, 1, 1, 1, 1, 1,
-0.880782, -1.076905, -2.824267, 1, 1, 1, 1, 1,
-0.8798464, 1.11005, -1.106762, 1, 1, 1, 1, 1,
-0.8730872, 0.584426, -1.312737, 1, 1, 1, 1, 1,
-0.8666002, 1.922348, -0.6040335, 1, 1, 1, 1, 1,
-0.8650004, 2.410747, -1.899869, 1, 1, 1, 1, 1,
-0.8599343, -0.2405023, -2.69828, 0, 0, 1, 1, 1,
-0.8598147, 1.014611, -3.071199, 1, 0, 0, 1, 1,
-0.857158, 0.07847886, -1.050023, 1, 0, 0, 1, 1,
-0.8567445, -0.781348, -3.159886, 1, 0, 0, 1, 1,
-0.8564442, -2.357987, -2.719158, 1, 0, 0, 1, 1,
-0.8560669, -0.6764472, -0.6934686, 1, 0, 0, 1, 1,
-0.8556502, 0.297404, -1.10754, 0, 0, 0, 1, 1,
-0.8504875, 0.7621608, -2.215082, 0, 0, 0, 1, 1,
-0.8427712, -0.3072523, -2.68558, 0, 0, 0, 1, 1,
-0.8417224, -0.4215924, -2.682552, 0, 0, 0, 1, 1,
-0.8380703, 1.08557, -1.25412, 0, 0, 0, 1, 1,
-0.8380609, -0.5190219, -2.77958, 0, 0, 0, 1, 1,
-0.837086, 1.571235, 0.314898, 0, 0, 0, 1, 1,
-0.8331475, -0.4805968, -2.446197, 1, 1, 1, 1, 1,
-0.8294718, 1.80193, -1.194968, 1, 1, 1, 1, 1,
-0.8291854, 0.08180146, -0.6424378, 1, 1, 1, 1, 1,
-0.82736, -0.3143563, -0.9703868, 1, 1, 1, 1, 1,
-0.8255647, 2.005095, 0.2767864, 1, 1, 1, 1, 1,
-0.8178244, -1.351435, -2.457432, 1, 1, 1, 1, 1,
-0.8104035, -0.02390873, -1.340018, 1, 1, 1, 1, 1,
-0.8085756, 0.32774, -2.794976, 1, 1, 1, 1, 1,
-0.7928445, 0.3522986, -1.336992, 1, 1, 1, 1, 1,
-0.7861762, 0.4029866, -0.859298, 1, 1, 1, 1, 1,
-0.7851617, -0.8880117, -3.275956, 1, 1, 1, 1, 1,
-0.7827556, -0.4761127, -3.087828, 1, 1, 1, 1, 1,
-0.7815008, 1.115316, -1.790723, 1, 1, 1, 1, 1,
-0.7751912, -1.303264, -2.611476, 1, 1, 1, 1, 1,
-0.7730532, 1.586259, -1.045115, 1, 1, 1, 1, 1,
-0.7709976, -0.5048708, -3.093418, 0, 0, 1, 1, 1,
-0.7697051, 1.075681, -1.414609, 1, 0, 0, 1, 1,
-0.7643627, 1.202718, -2.116413, 1, 0, 0, 1, 1,
-0.7603806, -0.2061976, -2.419801, 1, 0, 0, 1, 1,
-0.7566708, -0.8161374, -2.827999, 1, 0, 0, 1, 1,
-0.7561688, -0.7092699, -3.709235, 1, 0, 0, 1, 1,
-0.7499377, 1.026068, -1.018484, 0, 0, 0, 1, 1,
-0.7492349, -1.824481, -2.193141, 0, 0, 0, 1, 1,
-0.7419344, -0.2136035, -2.667952, 0, 0, 0, 1, 1,
-0.7403105, 0.8718166, -2.787964, 0, 0, 0, 1, 1,
-0.7390731, 0.2519223, -1.10383, 0, 0, 0, 1, 1,
-0.7350126, -2.403028, -2.825688, 0, 0, 0, 1, 1,
-0.7342387, -0.4582147, -2.409209, 0, 0, 0, 1, 1,
-0.7250193, -0.1275291, -0.4716615, 1, 1, 1, 1, 1,
-0.7245661, 1.893956, -0.2411367, 1, 1, 1, 1, 1,
-0.7238338, -0.5165146, -1.607594, 1, 1, 1, 1, 1,
-0.7212066, -0.07894884, -1.743003, 1, 1, 1, 1, 1,
-0.720286, 1.02036, 0.4155202, 1, 1, 1, 1, 1,
-0.7160589, 0.554048, 0.9295351, 1, 1, 1, 1, 1,
-0.7158858, -0.5936736, -2.664525, 1, 1, 1, 1, 1,
-0.7141927, 1.122279, -0.9856184, 1, 1, 1, 1, 1,
-0.7137883, 0.1573092, -2.214327, 1, 1, 1, 1, 1,
-0.7126209, -0.9481904, -1.337153, 1, 1, 1, 1, 1,
-0.7116932, -1.060621, -2.174992, 1, 1, 1, 1, 1,
-0.7076886, 1.152467, -0.8298188, 1, 1, 1, 1, 1,
-0.703872, -0.6527218, -3.291371, 1, 1, 1, 1, 1,
-0.6976888, -1.525308, -4.5145, 1, 1, 1, 1, 1,
-0.6968334, -0.4887748, -2.164139, 1, 1, 1, 1, 1,
-0.6949281, 0.5769049, -0.1475286, 0, 0, 1, 1, 1,
-0.6936366, 0.6016172, -2.081274, 1, 0, 0, 1, 1,
-0.6871444, 0.4039114, -0.7141635, 1, 0, 0, 1, 1,
-0.6804726, 0.878711, -0.79246, 1, 0, 0, 1, 1,
-0.6775163, 1.561704, 0.2076636, 1, 0, 0, 1, 1,
-0.6742577, 0.7283391, 0.438858, 1, 0, 0, 1, 1,
-0.6665786, 1.513384, -0.4134466, 0, 0, 0, 1, 1,
-0.6587449, 1.153301, -0.7351184, 0, 0, 0, 1, 1,
-0.658504, -2.124247, -3.543483, 0, 0, 0, 1, 1,
-0.6559049, -0.3680714, -2.265147, 0, 0, 0, 1, 1,
-0.655036, 0.7522628, -0.2944591, 0, 0, 0, 1, 1,
-0.6541448, -1.615845, -0.6575946, 0, 0, 0, 1, 1,
-0.6535412, -1.28027, -2.211197, 0, 0, 0, 1, 1,
-0.6524085, 0.3864848, -2.253016, 1, 1, 1, 1, 1,
-0.645213, 0.3161065, 0.5266767, 1, 1, 1, 1, 1,
-0.6312903, -0.7267063, -3.214264, 1, 1, 1, 1, 1,
-0.6255772, 0.4656411, -0.5752757, 1, 1, 1, 1, 1,
-0.624795, 1.628659, -0.49773, 1, 1, 1, 1, 1,
-0.6235623, 0.6392783, -0.7332035, 1, 1, 1, 1, 1,
-0.6207917, 0.8720232, -1.316435, 1, 1, 1, 1, 1,
-0.614491, 2.791685, -0.6385962, 1, 1, 1, 1, 1,
-0.6144843, 0.165477, -0.519447, 1, 1, 1, 1, 1,
-0.6046064, -0.6910841, -2.857825, 1, 1, 1, 1, 1,
-0.5986938, -0.2774323, -1.707359, 1, 1, 1, 1, 1,
-0.5945371, -0.6119181, -2.503469, 1, 1, 1, 1, 1,
-0.5935249, -0.05996431, -1.641813, 1, 1, 1, 1, 1,
-0.5922999, 0.6835577, -0.6428631, 1, 1, 1, 1, 1,
-0.5887368, -1.794551, -3.365488, 1, 1, 1, 1, 1,
-0.5864353, 1.193525, 0.6988471, 0, 0, 1, 1, 1,
-0.5843915, -0.1218334, -1.297508, 1, 0, 0, 1, 1,
-0.5796095, -0.8175212, -2.693176, 1, 0, 0, 1, 1,
-0.5789431, 2.079828, -0.9406846, 1, 0, 0, 1, 1,
-0.5768653, 1.32724, 0.4985002, 1, 0, 0, 1, 1,
-0.5748911, -0.3554682, -2.369603, 1, 0, 0, 1, 1,
-0.5707753, 0.2510523, 0.4124264, 0, 0, 0, 1, 1,
-0.5694845, 0.4450066, -0.9685521, 0, 0, 0, 1, 1,
-0.5693449, 0.8656778, -1.821717, 0, 0, 0, 1, 1,
-0.5670139, -0.08847423, -2.033297, 0, 0, 0, 1, 1,
-0.5655171, -0.6481864, -0.5308688, 0, 0, 0, 1, 1,
-0.5579265, -0.9311895, -1.633093, 0, 0, 0, 1, 1,
-0.5560124, -0.2597074, -3.245543, 0, 0, 0, 1, 1,
-0.5541201, 0.3931066, -1.697456, 1, 1, 1, 1, 1,
-0.5514458, -0.04646324, -2.075314, 1, 1, 1, 1, 1,
-0.5504236, 0.3483127, -1.353862, 1, 1, 1, 1, 1,
-0.5503226, 0.4484662, -1.441724, 1, 1, 1, 1, 1,
-0.5473118, 1.211075, -1.442221, 1, 1, 1, 1, 1,
-0.5458974, 1.223393, 0.7368073, 1, 1, 1, 1, 1,
-0.5438268, 1.178824, -1.39908, 1, 1, 1, 1, 1,
-0.541169, 1.361318, -0.6600011, 1, 1, 1, 1, 1,
-0.5386574, -0.6521471, -1.435567, 1, 1, 1, 1, 1,
-0.5283318, 0.308271, -2.712685, 1, 1, 1, 1, 1,
-0.522939, 0.4270527, -1.376204, 1, 1, 1, 1, 1,
-0.5195854, -1.139784, -2.921572, 1, 1, 1, 1, 1,
-0.5165805, -0.7535523, -2.37084, 1, 1, 1, 1, 1,
-0.5091652, -0.03522431, -2.00232, 1, 1, 1, 1, 1,
-0.505431, -0.7800789, -3.316376, 1, 1, 1, 1, 1,
-0.5051022, -0.03767166, -1.720263, 0, 0, 1, 1, 1,
-0.502592, 0.1020507, -1.879348, 1, 0, 0, 1, 1,
-0.502586, 0.9819964, -0.9268489, 1, 0, 0, 1, 1,
-0.4951991, 1.184089, -1.595287, 1, 0, 0, 1, 1,
-0.4938147, 0.2620293, 0.01008262, 1, 0, 0, 1, 1,
-0.4917547, 1.922354, 0.4056232, 1, 0, 0, 1, 1,
-0.4913422, 1.254672, 0.454345, 0, 0, 0, 1, 1,
-0.4911251, -0.3440769, -1.509732, 0, 0, 0, 1, 1,
-0.4895768, 1.632201, -0.64348, 0, 0, 0, 1, 1,
-0.4889798, -1.412026, -1.789569, 0, 0, 0, 1, 1,
-0.4798763, -1.771161, -3.321347, 0, 0, 0, 1, 1,
-0.4798301, 0.3689527, -2.983909, 0, 0, 0, 1, 1,
-0.4788129, -0.3768361, -1.24888, 0, 0, 0, 1, 1,
-0.4781935, -0.150073, -0.6521558, 1, 1, 1, 1, 1,
-0.4744087, -1.272641, -0.9488909, 1, 1, 1, 1, 1,
-0.4648843, -0.3783322, -2.687277, 1, 1, 1, 1, 1,
-0.4639771, 0.645629, -1.539972, 1, 1, 1, 1, 1,
-0.4630795, -0.03905442, -1.408844, 1, 1, 1, 1, 1,
-0.4595563, -1.585625, -2.543543, 1, 1, 1, 1, 1,
-0.4579892, -0.4850008, -3.211898, 1, 1, 1, 1, 1,
-0.4554472, -0.4170105, -1.7946, 1, 1, 1, 1, 1,
-0.4540538, -1.454964, -1.558703, 1, 1, 1, 1, 1,
-0.4538873, -0.5803325, -2.362928, 1, 1, 1, 1, 1,
-0.4538615, 0.1106708, -1.26997, 1, 1, 1, 1, 1,
-0.4479482, -0.7873917, -2.201015, 1, 1, 1, 1, 1,
-0.4470347, 0.05241127, -2.164521, 1, 1, 1, 1, 1,
-0.4468001, 0.5428586, 0.3947172, 1, 1, 1, 1, 1,
-0.4451936, 0.9029884, -0.5458846, 1, 1, 1, 1, 1,
-0.4443972, -1.131307, -3.581315, 0, 0, 1, 1, 1,
-0.4440103, 0.8394351, -0.9958416, 1, 0, 0, 1, 1,
-0.4436283, -1.832953, -3.043802, 1, 0, 0, 1, 1,
-0.4388094, 0.3730872, -1.523943, 1, 0, 0, 1, 1,
-0.4352744, 0.7443342, -0.1429991, 1, 0, 0, 1, 1,
-0.4333775, 0.7144499, -0.4876185, 1, 0, 0, 1, 1,
-0.4329917, 0.2479307, 0.6911613, 0, 0, 0, 1, 1,
-0.4328916, -2.405066, -0.6860052, 0, 0, 0, 1, 1,
-0.4322626, 0.3023905, -2.216648, 0, 0, 0, 1, 1,
-0.4290719, -0.1964395, 0.009281377, 0, 0, 0, 1, 1,
-0.4284246, -1.032484, -3.338286, 0, 0, 0, 1, 1,
-0.4138464, 1.209118, -0.0001978037, 0, 0, 0, 1, 1,
-0.4134709, -2.105937, -3.03366, 0, 0, 0, 1, 1,
-0.407737, -1.326748, -2.971534, 1, 1, 1, 1, 1,
-0.4074562, -0.2682906, -1.503159, 1, 1, 1, 1, 1,
-0.3969055, -0.8914825, -2.200599, 1, 1, 1, 1, 1,
-0.3951699, 0.09948483, -1.036722, 1, 1, 1, 1, 1,
-0.3933845, -1.498397, -2.146915, 1, 1, 1, 1, 1,
-0.3924462, -1.556724, -2.70753, 1, 1, 1, 1, 1,
-0.3911213, 0.007183009, -2.991529, 1, 1, 1, 1, 1,
-0.3896754, -1.324058, -3.999531, 1, 1, 1, 1, 1,
-0.3888681, -0.8553078, -2.853665, 1, 1, 1, 1, 1,
-0.3888308, -0.6025885, -2.877354, 1, 1, 1, 1, 1,
-0.3843835, -0.8342584, -4.627494, 1, 1, 1, 1, 1,
-0.3762153, 0.8829503, 0.1351992, 1, 1, 1, 1, 1,
-0.3727121, -0.08770319, -2.936739, 1, 1, 1, 1, 1,
-0.3711399, 0.3294127, -1.0486, 1, 1, 1, 1, 1,
-0.3684106, 0.4388863, -2.483686, 1, 1, 1, 1, 1,
-0.3657076, 0.3214787, -0.3083385, 0, 0, 1, 1, 1,
-0.3617828, 0.5930169, 0.05013654, 1, 0, 0, 1, 1,
-0.3616754, 1.634768, 0.5648535, 1, 0, 0, 1, 1,
-0.354916, -0.385517, -2.041739, 1, 0, 0, 1, 1,
-0.3429087, -0.5076219, -3.325649, 1, 0, 0, 1, 1,
-0.3376653, -0.3697746, -1.417287, 1, 0, 0, 1, 1,
-0.3347946, 0.72405, -1.129422, 0, 0, 0, 1, 1,
-0.3309137, -0.09219014, -3.069576, 0, 0, 0, 1, 1,
-0.3294061, 0.193293, 0.2685014, 0, 0, 0, 1, 1,
-0.315867, 1.464702, -1.053701, 0, 0, 0, 1, 1,
-0.3132894, 0.2104906, -0.7570307, 0, 0, 0, 1, 1,
-0.3094953, -0.765103, -2.385227, 0, 0, 0, 1, 1,
-0.3008376, -0.9224415, -1.624488, 0, 0, 0, 1, 1,
-0.2909597, 1.279754, -0.4467087, 1, 1, 1, 1, 1,
-0.2888086, -0.9334695, -3.617537, 1, 1, 1, 1, 1,
-0.2876283, -1.165182, -3.385846, 1, 1, 1, 1, 1,
-0.2818574, 0.5189326, -2.221671, 1, 1, 1, 1, 1,
-0.2816918, -0.1829628, -2.865975, 1, 1, 1, 1, 1,
-0.2785623, -0.8986916, -3.249573, 1, 1, 1, 1, 1,
-0.2778378, -1.45597, -4.703009, 1, 1, 1, 1, 1,
-0.2755994, 0.4245403, 0.7098349, 1, 1, 1, 1, 1,
-0.2734767, -0.4355486, -3.231395, 1, 1, 1, 1, 1,
-0.2710606, -0.7446793, -3.151195, 1, 1, 1, 1, 1,
-0.2675236, -0.8464492, -1.982033, 1, 1, 1, 1, 1,
-0.2661377, 2.339447, -1.210923, 1, 1, 1, 1, 1,
-0.2611932, 0.08192543, -1.094599, 1, 1, 1, 1, 1,
-0.2605359, 0.9686686, -0.6137633, 1, 1, 1, 1, 1,
-0.2563372, 1.464174, -0.8022633, 1, 1, 1, 1, 1,
-0.2516269, -0.8956723, -3.495915, 0, 0, 1, 1, 1,
-0.2503262, -0.4277765, -1.37971, 1, 0, 0, 1, 1,
-0.2501204, -0.6524479, -2.462435, 1, 0, 0, 1, 1,
-0.2493006, 1.01012, -0.6637947, 1, 0, 0, 1, 1,
-0.2449917, -0.3287362, -2.736467, 1, 0, 0, 1, 1,
-0.2441319, 0.7982534, -0.3915513, 1, 0, 0, 1, 1,
-0.2440016, -0.1107761, -3.316369, 0, 0, 0, 1, 1,
-0.2344541, 0.3634834, -0.2604857, 0, 0, 0, 1, 1,
-0.2338511, 0.3273625, -0.2800586, 0, 0, 0, 1, 1,
-0.2300949, -0.5254996, -4.008766, 0, 0, 0, 1, 1,
-0.2293917, -0.1233575, -0.8644196, 0, 0, 0, 1, 1,
-0.2221306, 0.43254, -1.583837, 0, 0, 0, 1, 1,
-0.2207435, 1.698345, -1.589839, 0, 0, 0, 1, 1,
-0.21952, -2.061277, -3.219682, 1, 1, 1, 1, 1,
-0.2175196, -0.7394974, -3.620636, 1, 1, 1, 1, 1,
-0.2121638, -0.2709606, -2.690086, 1, 1, 1, 1, 1,
-0.2111292, 1.477462, 0.3073812, 1, 1, 1, 1, 1,
-0.2036388, 1.450818, 1.937088, 1, 1, 1, 1, 1,
-0.2017234, 0.3726305, 0.008639629, 1, 1, 1, 1, 1,
-0.1995747, 0.3133337, -1.287369, 1, 1, 1, 1, 1,
-0.1981113, -0.1705409, -2.13253, 1, 1, 1, 1, 1,
-0.1975324, -0.7115592, -2.89122, 1, 1, 1, 1, 1,
-0.1974968, -0.09655887, -0.8870148, 1, 1, 1, 1, 1,
-0.1964297, -0.401719, -3.124048, 1, 1, 1, 1, 1,
-0.1959381, -0.0824704, -0.2881487, 1, 1, 1, 1, 1,
-0.1953919, 0.9432579, -0.9475297, 1, 1, 1, 1, 1,
-0.1932815, 1.104891, -0.5456222, 1, 1, 1, 1, 1,
-0.1927645, 0.3363458, -1.264748, 1, 1, 1, 1, 1,
-0.1904499, 0.1412975, -1.686193, 0, 0, 1, 1, 1,
-0.1839445, -1.469562, -5.046237, 1, 0, 0, 1, 1,
-0.1776754, -1.467496, -4.589543, 1, 0, 0, 1, 1,
-0.1680193, 0.9873371, -1.074784, 1, 0, 0, 1, 1,
-0.1643073, 1.3465, -1.272406, 1, 0, 0, 1, 1,
-0.1615722, -0.8795043, -2.321341, 1, 0, 0, 1, 1,
-0.1579283, 0.4707119, 1.944965, 0, 0, 0, 1, 1,
-0.153729, 0.9576001, -2.564025, 0, 0, 0, 1, 1,
-0.1502311, 0.8259638, -0.3834932, 0, 0, 0, 1, 1,
-0.1488076, 0.6053646, -1.364072, 0, 0, 0, 1, 1,
-0.1467955, 2.096092, 0.2829797, 0, 0, 0, 1, 1,
-0.1458496, -0.7556501, -4.747496, 0, 0, 0, 1, 1,
-0.1447349, 0.4355532, 1.516398, 0, 0, 0, 1, 1,
-0.1425561, 1.307971, -0.5812297, 1, 1, 1, 1, 1,
-0.137897, -0.7083313, -3.024385, 1, 1, 1, 1, 1,
-0.1369538, 0.3141623, -1.2408, 1, 1, 1, 1, 1,
-0.1363448, 2.411124, 0.9890375, 1, 1, 1, 1, 1,
-0.1339083, -0.1364564, -3.689205, 1, 1, 1, 1, 1,
-0.1171952, -0.111789, -2.67931, 1, 1, 1, 1, 1,
-0.1060602, 1.016869, -0.459079, 1, 1, 1, 1, 1,
-0.1039316, 0.3937467, 0.08507121, 1, 1, 1, 1, 1,
-0.0983309, 1.096433, 0.548604, 1, 1, 1, 1, 1,
-0.09480786, 1.144945, 0.9702162, 1, 1, 1, 1, 1,
-0.093658, 0.04099447, -3.505471, 1, 1, 1, 1, 1,
-0.09202263, -0.1883671, -4.461764, 1, 1, 1, 1, 1,
-0.08620283, 0.4189912, 0.1696423, 1, 1, 1, 1, 1,
-0.08479743, -0.1199124, -2.440866, 1, 1, 1, 1, 1,
-0.08343738, 0.1067716, 0.107173, 1, 1, 1, 1, 1,
-0.08166201, 0.8841799, -0.2076904, 0, 0, 1, 1, 1,
-0.07909209, 1.99387, -0.2755424, 1, 0, 0, 1, 1,
-0.07459664, 0.9795408, -1.961129, 1, 0, 0, 1, 1,
-0.07290503, -1.015733, -2.778894, 1, 0, 0, 1, 1,
-0.07009766, 0.5720229, -1.401911, 1, 0, 0, 1, 1,
-0.06874269, -1.490893, -4.15366, 1, 0, 0, 1, 1,
-0.06671628, -0.4694684, -2.323109, 0, 0, 0, 1, 1,
-0.05770618, -0.4966234, -1.888544, 0, 0, 0, 1, 1,
-0.05744396, 1.532724, -0.5950284, 0, 0, 0, 1, 1,
-0.05075386, -0.6638251, -4.436096, 0, 0, 0, 1, 1,
-0.05040728, -1.053783, -2.988771, 0, 0, 0, 1, 1,
-0.0479183, -0.4638938, -2.246482, 0, 0, 0, 1, 1,
-0.0437344, 0.9089937, 0.5580717, 0, 0, 0, 1, 1,
-0.03639664, -1.929096, -4.712863, 1, 1, 1, 1, 1,
-0.03255588, 0.07653309, 1.376241, 1, 1, 1, 1, 1,
-0.03113041, -0.2227828, -2.630711, 1, 1, 1, 1, 1,
-0.02969397, 1.371689, 1.560485, 1, 1, 1, 1, 1,
-0.02711875, 1.046416, -0.133449, 1, 1, 1, 1, 1,
-0.02555705, -1.590112, -2.14262, 1, 1, 1, 1, 1,
-0.0245514, -0.2841755, -3.113403, 1, 1, 1, 1, 1,
-0.0238274, -1.775559, -5.503802, 1, 1, 1, 1, 1,
-0.02295269, 0.3248141, 0.5267405, 1, 1, 1, 1, 1,
-0.02146112, 0.2004749, -2.528416, 1, 1, 1, 1, 1,
-0.01616628, 1.169833, 0.4591296, 1, 1, 1, 1, 1,
-0.01346232, -0.5346978, -3.10905, 1, 1, 1, 1, 1,
-0.01113989, -0.2724358, -4.041207, 1, 1, 1, 1, 1,
-0.008705563, -0.1749648, -2.04317, 1, 1, 1, 1, 1,
-0.007773349, -1.093333, -3.18431, 1, 1, 1, 1, 1,
-0.003934888, 0.2445159, 0.09691051, 0, 0, 1, 1, 1,
0.0002144821, -0.2699961, 2.224858, 1, 0, 0, 1, 1,
0.0009663184, 0.5924299, 1.03504, 1, 0, 0, 1, 1,
0.001927303, 0.07723857, 2.031835, 1, 0, 0, 1, 1,
0.003119394, 0.5693236, 0.7808003, 1, 0, 0, 1, 1,
0.003972878, -0.5712605, 1.292413, 1, 0, 0, 1, 1,
0.008465859, 2.103572, -0.5234466, 0, 0, 0, 1, 1,
0.01259432, -0.3265459, 2.448293, 0, 0, 0, 1, 1,
0.01357551, -0.9581783, 2.385368, 0, 0, 0, 1, 1,
0.01508499, 0.3788462, 0.9045581, 0, 0, 0, 1, 1,
0.01613799, -0.3127311, 0.438242, 0, 0, 0, 1, 1,
0.02671442, 0.9213818, -1.12892, 0, 0, 0, 1, 1,
0.02961663, 0.4011264, -1.137631, 0, 0, 0, 1, 1,
0.03391976, 1.167654, -0.2096147, 1, 1, 1, 1, 1,
0.03494653, 0.2894953, -1.813757, 1, 1, 1, 1, 1,
0.03514722, 0.8655078, 0.306301, 1, 1, 1, 1, 1,
0.03697008, 1.24077, -0.4564447, 1, 1, 1, 1, 1,
0.03815296, 0.9840215, 0.4086183, 1, 1, 1, 1, 1,
0.04005326, -0.3587763, 1.18733, 1, 1, 1, 1, 1,
0.04187687, 1.776229, 0.5610792, 1, 1, 1, 1, 1,
0.05067487, 1.890596, 0.3841503, 1, 1, 1, 1, 1,
0.05187326, -0.06563932, 3.756727, 1, 1, 1, 1, 1,
0.05278068, -0.1438864, 3.81244, 1, 1, 1, 1, 1,
0.05410358, 0.5172095, 0.3751349, 1, 1, 1, 1, 1,
0.05927357, -1.055269, 3.542872, 1, 1, 1, 1, 1,
0.06003856, -0.129037, 3.771029, 1, 1, 1, 1, 1,
0.0650234, -0.4147904, 1.04109, 1, 1, 1, 1, 1,
0.06668584, 0.06733362, -0.1145066, 1, 1, 1, 1, 1,
0.0687187, -1.487848, 3.225255, 0, 0, 1, 1, 1,
0.06940673, -0.202823, 2.671698, 1, 0, 0, 1, 1,
0.07008859, -0.4899263, 1.209526, 1, 0, 0, 1, 1,
0.07108648, -1.994858, 2.595623, 1, 0, 0, 1, 1,
0.07229707, 0.02849861, 1.074024, 1, 0, 0, 1, 1,
0.07316592, 0.7395473, -0.092871, 1, 0, 0, 1, 1,
0.08122796, 0.2908706, -0.3381063, 0, 0, 0, 1, 1,
0.08218285, 0.310847, 1.973586, 0, 0, 0, 1, 1,
0.08243038, -1.648909, 3.422457, 0, 0, 0, 1, 1,
0.08838376, 0.3359032, -0.1752485, 0, 0, 0, 1, 1,
0.09050095, 0.1203263, 1.864211, 0, 0, 0, 1, 1,
0.09206386, 1.442717, 1.584959, 0, 0, 0, 1, 1,
0.09486368, -2.402493, 3.634607, 0, 0, 0, 1, 1,
0.09645337, 0.4574547, 1.799557, 1, 1, 1, 1, 1,
0.1021345, 1.136643, -0.3013682, 1, 1, 1, 1, 1,
0.1078671, 0.6449111, -0.01876272, 1, 1, 1, 1, 1,
0.1080238, -0.01344604, 1.374626, 1, 1, 1, 1, 1,
0.1082052, -1.025188, 0.5781788, 1, 1, 1, 1, 1,
0.1100561, 1.21245, 1.478471, 1, 1, 1, 1, 1,
0.1111063, -0.6427162, 2.550586, 1, 1, 1, 1, 1,
0.1145763, 0.789111, -0.9699434, 1, 1, 1, 1, 1,
0.1221856, 1.603721, 0.1288552, 1, 1, 1, 1, 1,
0.1247903, -0.9895633, 2.687687, 1, 1, 1, 1, 1,
0.1249168, -0.6451031, 1.993848, 1, 1, 1, 1, 1,
0.1282003, -0.8738358, 4.60962, 1, 1, 1, 1, 1,
0.1292565, 1.089191, -0.9550745, 1, 1, 1, 1, 1,
0.1336721, 1.227734, 1.65194, 1, 1, 1, 1, 1,
0.1344395, 1.152948, 2.16402, 1, 1, 1, 1, 1,
0.1347158, 1.961685, 0.01404732, 0, 0, 1, 1, 1,
0.1359937, 0.928302, 0.140307, 1, 0, 0, 1, 1,
0.1364569, 0.3314284, 1.667001, 1, 0, 0, 1, 1,
0.1369196, -1.320232, 3.598918, 1, 0, 0, 1, 1,
0.138316, 1.162874, -0.3298641, 1, 0, 0, 1, 1,
0.1390109, 1.688992, 0.1333394, 1, 0, 0, 1, 1,
0.1395323, -1.100677, 3.171264, 0, 0, 0, 1, 1,
0.1436817, -0.144972, 3.664376, 0, 0, 0, 1, 1,
0.1466864, -1.345385, 1.318488, 0, 0, 0, 1, 1,
0.1473043, 0.9194442, 0.893628, 0, 0, 0, 1, 1,
0.1478871, -1.69692, 2.182918, 0, 0, 0, 1, 1,
0.1498013, -0.06244322, 1.471593, 0, 0, 0, 1, 1,
0.1583523, 1.172873, 0.2012251, 0, 0, 0, 1, 1,
0.159159, 0.8536322, 1.696673, 1, 1, 1, 1, 1,
0.1598352, 0.1134034, 2.411134, 1, 1, 1, 1, 1,
0.1603825, -0.5087991, 3.375272, 1, 1, 1, 1, 1,
0.160484, 1.52341, 1.045138, 1, 1, 1, 1, 1,
0.1607554, -1.587472, 3.971027, 1, 1, 1, 1, 1,
0.1650633, 1.902196, 1.482093, 1, 1, 1, 1, 1,
0.1659342, 2.395622, -0.6202419, 1, 1, 1, 1, 1,
0.1674975, 0.729437, 1.517455, 1, 1, 1, 1, 1,
0.170549, -1.00499, 2.621012, 1, 1, 1, 1, 1,
0.1750135, 0.6644315, 1.079313, 1, 1, 1, 1, 1,
0.1752787, 0.4508454, 1.03955, 1, 1, 1, 1, 1,
0.175975, 1.543665, -0.1086466, 1, 1, 1, 1, 1,
0.1815486, 1.279317, 1.067793, 1, 1, 1, 1, 1,
0.1816583, 0.9062108, -0.4351273, 1, 1, 1, 1, 1,
0.1817408, -0.2392785, 2.173709, 1, 1, 1, 1, 1,
0.183077, 1.625287, 1.195516, 0, 0, 1, 1, 1,
0.1872902, -0.1413279, 4.718919, 1, 0, 0, 1, 1,
0.1920732, -0.004087043, 0.2613887, 1, 0, 0, 1, 1,
0.1934813, 0.06083541, 0.7541314, 1, 0, 0, 1, 1,
0.1951182, -0.4289779, 1.341817, 1, 0, 0, 1, 1,
0.2005159, 0.5503219, 0.4017851, 1, 0, 0, 1, 1,
0.2011202, -3.041365, 3.005511, 0, 0, 0, 1, 1,
0.2084164, 1.164158, 0.5234202, 0, 0, 0, 1, 1,
0.2101998, 0.8022375, 0.5192599, 0, 0, 0, 1, 1,
0.2150948, 1.730068, 0.5408328, 0, 0, 0, 1, 1,
0.2178417, -1.571674, 2.040371, 0, 0, 0, 1, 1,
0.2186124, -0.1444236, 0.9562685, 0, 0, 0, 1, 1,
0.2187658, 1.887935, -0.7739614, 0, 0, 0, 1, 1,
0.2222969, -0.5408023, 1.113118, 1, 1, 1, 1, 1,
0.2234062, 0.949696, 1.148703, 1, 1, 1, 1, 1,
0.2284377, -0.8261456, 2.336245, 1, 1, 1, 1, 1,
0.2297615, 0.4499949, 0.7481649, 1, 1, 1, 1, 1,
0.2311344, 0.8437214, 2.304818, 1, 1, 1, 1, 1,
0.2333302, 0.1831544, 0.6698015, 1, 1, 1, 1, 1,
0.2411938, -1.004224, 3.117336, 1, 1, 1, 1, 1,
0.2413944, 0.9388817, -0.1506937, 1, 1, 1, 1, 1,
0.2439547, 1.133726, 0.231476, 1, 1, 1, 1, 1,
0.248456, 0.785185, 1.708226, 1, 1, 1, 1, 1,
0.2495389, -0.125909, 1.583337, 1, 1, 1, 1, 1,
0.2533961, 0.2279714, -1.211946, 1, 1, 1, 1, 1,
0.2556861, -0.6803394, 1.686062, 1, 1, 1, 1, 1,
0.2606007, -0.5989817, 2.034189, 1, 1, 1, 1, 1,
0.2612132, -0.5223528, 2.552906, 1, 1, 1, 1, 1,
0.2624846, -0.4596557, 2.357774, 0, 0, 1, 1, 1,
0.2637163, -0.6615047, 2.528128, 1, 0, 0, 1, 1,
0.2695185, -2.738996, 3.786952, 1, 0, 0, 1, 1,
0.2723688, -0.9222454, 2.864055, 1, 0, 0, 1, 1,
0.2724276, -0.3669837, 0.9415135, 1, 0, 0, 1, 1,
0.2749803, 0.03362247, 2.471718, 1, 0, 0, 1, 1,
0.2751155, 1.197047, 0.1310162, 0, 0, 0, 1, 1,
0.2783783, -0.8112725, 5.953949, 0, 0, 0, 1, 1,
0.2793725, 0.9666266, -0.0925689, 0, 0, 0, 1, 1,
0.2807277, -1.634439, 1.475156, 0, 0, 0, 1, 1,
0.2807953, 0.4313912, -0.9977924, 0, 0, 0, 1, 1,
0.2824945, 0.7785354, -0.2786865, 0, 0, 0, 1, 1,
0.2848641, -1.264224, 3.649241, 0, 0, 0, 1, 1,
0.2893765, -0.0007991975, 1.57094, 1, 1, 1, 1, 1,
0.29314, 0.5152403, -0.02455988, 1, 1, 1, 1, 1,
0.2957421, 0.8030035, 1.191549, 1, 1, 1, 1, 1,
0.2962285, 0.9945447, 1.383204, 1, 1, 1, 1, 1,
0.2963421, -2.867384, 3.854184, 1, 1, 1, 1, 1,
0.2974026, -0.8823454, 2.18164, 1, 1, 1, 1, 1,
0.2983062, -0.004944059, -0.5871635, 1, 1, 1, 1, 1,
0.2984889, -0.4266107, 4.059313, 1, 1, 1, 1, 1,
0.299391, 0.9602217, 0.5347551, 1, 1, 1, 1, 1,
0.3030567, -0.7006434, 1.809726, 1, 1, 1, 1, 1,
0.3057723, 0.3293689, -0.4625891, 1, 1, 1, 1, 1,
0.3058338, 0.3912382, 0.4669787, 1, 1, 1, 1, 1,
0.308069, 1.646883, -1.393677, 1, 1, 1, 1, 1,
0.3126818, -1.705035, 4.328873, 1, 1, 1, 1, 1,
0.3155057, 0.3666789, 3.074826, 1, 1, 1, 1, 1,
0.3166133, -0.8027713, 2.853517, 0, 0, 1, 1, 1,
0.3177771, -0.4808743, 3.312708, 1, 0, 0, 1, 1,
0.3183625, 0.6576388, 1.798759, 1, 0, 0, 1, 1,
0.3220491, 0.04366993, 1.882271, 1, 0, 0, 1, 1,
0.3227912, 0.3604063, -0.003094607, 1, 0, 0, 1, 1,
0.3228732, -1.532664, 2.05746, 1, 0, 0, 1, 1,
0.3270862, -0.9151899, 2.121343, 0, 0, 0, 1, 1,
0.3284502, -1.351179, 2.916383, 0, 0, 0, 1, 1,
0.329596, -0.6968136, 0.9771074, 0, 0, 0, 1, 1,
0.3323443, 1.252861, -0.6658657, 0, 0, 0, 1, 1,
0.3373679, -0.03127834, 1.745325, 0, 0, 0, 1, 1,
0.342566, -0.8366238, 2.344436, 0, 0, 0, 1, 1,
0.3484381, 0.6697052, 1.628884, 0, 0, 0, 1, 1,
0.3536618, -0.7750257, 2.976265, 1, 1, 1, 1, 1,
0.358424, -0.2911274, 3.731988, 1, 1, 1, 1, 1,
0.359676, -0.3392096, 2.713823, 1, 1, 1, 1, 1,
0.367227, 0.1439967, 2.054448, 1, 1, 1, 1, 1,
0.3704972, 0.131801, -0.5537952, 1, 1, 1, 1, 1,
0.3709252, -1.315041, 2.456588, 1, 1, 1, 1, 1,
0.3727921, -2.034347, 3.743649, 1, 1, 1, 1, 1,
0.3728285, -1.635139, 1.937269, 1, 1, 1, 1, 1,
0.3733356, -0.7922167, 3.118259, 1, 1, 1, 1, 1,
0.3737425, -0.6031164, 2.18354, 1, 1, 1, 1, 1,
0.3742269, -0.8410814, 1.387776, 1, 1, 1, 1, 1,
0.3778454, -1.081867, 2.591481, 1, 1, 1, 1, 1,
0.3797997, -0.601049, 2.334884, 1, 1, 1, 1, 1,
0.380394, 0.3273608, 0.9046026, 1, 1, 1, 1, 1,
0.3816165, 1.047498, 0.6607087, 1, 1, 1, 1, 1,
0.3818483, 1.100831, 1.859036, 0, 0, 1, 1, 1,
0.3848553, 1.119223, 1.289648, 1, 0, 0, 1, 1,
0.3902655, 0.8043824, -0.8945668, 1, 0, 0, 1, 1,
0.3987871, -0.002234621, 1.22366, 1, 0, 0, 1, 1,
0.4020017, -1.085244, 3.082041, 1, 0, 0, 1, 1,
0.4048241, 1.228972, 1.522436, 1, 0, 0, 1, 1,
0.4065008, 0.04074101, 2.943743, 0, 0, 0, 1, 1,
0.4084107, -0.1419755, 2.31902, 0, 0, 0, 1, 1,
0.4093436, 0.2665137, 1.148975, 0, 0, 0, 1, 1,
0.4169735, -0.8490734, 3.420957, 0, 0, 0, 1, 1,
0.4204768, 0.8141034, 3.491724, 0, 0, 0, 1, 1,
0.4218727, -0.1195109, 0.5354443, 0, 0, 0, 1, 1,
0.422998, -0.8688863, 2.081799, 0, 0, 0, 1, 1,
0.4272008, -1.841949, 3.325629, 1, 1, 1, 1, 1,
0.4375217, -0.8096633, 2.410877, 1, 1, 1, 1, 1,
0.440141, 1.566941, 1.918873, 1, 1, 1, 1, 1,
0.4416776, 0.4947162, 0.3287551, 1, 1, 1, 1, 1,
0.4438771, 0.1334309, 1.216646, 1, 1, 1, 1, 1,
0.4455345, 0.2056781, 3.731334, 1, 1, 1, 1, 1,
0.4465018, -0.3193035, 2.966743, 1, 1, 1, 1, 1,
0.4474198, 0.7765241, 0.5895317, 1, 1, 1, 1, 1,
0.4498514, 0.245586, 1.012547, 1, 1, 1, 1, 1,
0.4513357, 0.04372548, 2.550461, 1, 1, 1, 1, 1,
0.4555237, 0.2986516, 0.009138969, 1, 1, 1, 1, 1,
0.4618685, -0.8605508, 1.937245, 1, 1, 1, 1, 1,
0.4620253, 0.4500083, -0.4088983, 1, 1, 1, 1, 1,
0.4649898, 0.5275523, -2.045178, 1, 1, 1, 1, 1,
0.4665141, 0.8051074, -1.90833, 1, 1, 1, 1, 1,
0.4698788, -0.2951741, 2.049742, 0, 0, 1, 1, 1,
0.4706432, 0.9365196, 0.2247553, 1, 0, 0, 1, 1,
0.472759, 0.01395291, 2.363611, 1, 0, 0, 1, 1,
0.4774113, -2.706984, 2.711973, 1, 0, 0, 1, 1,
0.4783408, 2.183889, -1.022055, 1, 0, 0, 1, 1,
0.478412, 1.488933, 1.859292, 1, 0, 0, 1, 1,
0.478419, 0.3884007, 1.232979, 0, 0, 0, 1, 1,
0.4786846, 0.03806064, 2.415919, 0, 0, 0, 1, 1,
0.4840939, 1.916803, 0.4951607, 0, 0, 0, 1, 1,
0.4910269, 0.9834751, 0.146803, 0, 0, 0, 1, 1,
0.4911025, 0.5580685, 0.3026999, 0, 0, 0, 1, 1,
0.4921816, 1.073705, 0.2087502, 0, 0, 0, 1, 1,
0.4956637, -0.3278157, 0.8074296, 0, 0, 0, 1, 1,
0.4974653, -0.109764, 1.367848, 1, 1, 1, 1, 1,
0.4983802, 0.07597189, 1.273036, 1, 1, 1, 1, 1,
0.4998502, -0.8543146, 2.424976, 1, 1, 1, 1, 1,
0.5007118, -1.611544, 3.769697, 1, 1, 1, 1, 1,
0.5010605, -0.3894831, 0.2890397, 1, 1, 1, 1, 1,
0.5041689, -0.5789828, 1.41016, 1, 1, 1, 1, 1,
0.5093615, -1.672699, 2.976019, 1, 1, 1, 1, 1,
0.5114148, 0.3194041, 1.364043, 1, 1, 1, 1, 1,
0.5167649, 1.065859, -0.1423448, 1, 1, 1, 1, 1,
0.5197488, 0.2889822, 0.7160717, 1, 1, 1, 1, 1,
0.5253199, -1.286908, 2.716872, 1, 1, 1, 1, 1,
0.5261758, 0.9724749, 0.3476471, 1, 1, 1, 1, 1,
0.5272781, 1.827426, 0.3906869, 1, 1, 1, 1, 1,
0.527932, 0.5732359, 0.06952918, 1, 1, 1, 1, 1,
0.532927, -0.2286011, 3.26654, 1, 1, 1, 1, 1,
0.5337462, -0.4186914, 0.9281077, 0, 0, 1, 1, 1,
0.5338234, -0.7251288, 1.989552, 1, 0, 0, 1, 1,
0.5343125, 0.6017598, -0.579155, 1, 0, 0, 1, 1,
0.5359548, -0.3671373, 0.9308214, 1, 0, 0, 1, 1,
0.5387108, -0.5180817, 1.395381, 1, 0, 0, 1, 1,
0.5400002, 1.183746, 1.026411, 1, 0, 0, 1, 1,
0.5403179, 1.118815, -0.7334777, 0, 0, 0, 1, 1,
0.540389, 1.493949, 0.0263129, 0, 0, 0, 1, 1,
0.5446001, 2.336716, 0.7669811, 0, 0, 0, 1, 1,
0.5450425, -1.08239, 0.2363351, 0, 0, 0, 1, 1,
0.5467281, 1.02089, 0.1605332, 0, 0, 0, 1, 1,
0.5488875, 1.83089, -1.083873, 0, 0, 0, 1, 1,
0.5508986, 1.702701, 0.5280294, 0, 0, 0, 1, 1,
0.5519623, -2.969747, 3.02327, 1, 1, 1, 1, 1,
0.5537257, 0.5136454, -0.1623248, 1, 1, 1, 1, 1,
0.561454, -0.5286211, 2.027161, 1, 1, 1, 1, 1,
0.5640792, -0.4174898, 3.686723, 1, 1, 1, 1, 1,
0.5648119, -0.8914699, 3.056851, 1, 1, 1, 1, 1,
0.5695226, 0.2520668, 0.7541546, 1, 1, 1, 1, 1,
0.5697867, -0.1637548, 2.584285, 1, 1, 1, 1, 1,
0.5829327, 0.5009522, -0.3081021, 1, 1, 1, 1, 1,
0.5855989, -0.1164482, 1.427569, 1, 1, 1, 1, 1,
0.5864094, -0.647694, 1.992772, 1, 1, 1, 1, 1,
0.5872362, 1.234554, 3.173224, 1, 1, 1, 1, 1,
0.5890769, -0.2141129, 1.824331, 1, 1, 1, 1, 1,
0.5943867, -0.231044, 1.301815, 1, 1, 1, 1, 1,
0.6067189, 0.1684454, 2.275703, 1, 1, 1, 1, 1,
0.6085932, -0.769972, 2.93944, 1, 1, 1, 1, 1,
0.6149676, 0.008446734, 0.125951, 0, 0, 1, 1, 1,
0.6197515, -0.4830442, 2.86245, 1, 0, 0, 1, 1,
0.6237059, -0.3751526, 2.203972, 1, 0, 0, 1, 1,
0.6265629, -0.02449757, 2.062512, 1, 0, 0, 1, 1,
0.6265805, -1.245454, 3.053739, 1, 0, 0, 1, 1,
0.6296674, -0.5886732, 2.450399, 1, 0, 0, 1, 1,
0.6300291, -1.108316, 1.342195, 0, 0, 0, 1, 1,
0.6308903, -0.9769819, 1.845213, 0, 0, 0, 1, 1,
0.6370871, 0.7554558, 0.6419947, 0, 0, 0, 1, 1,
0.6383702, -0.2535858, 1.692025, 0, 0, 0, 1, 1,
0.6429055, 0.6412951, 0.7357233, 0, 0, 0, 1, 1,
0.6444424, 1.927771, 0.7409469, 0, 0, 0, 1, 1,
0.6502732, -0.2301627, 1.854429, 0, 0, 0, 1, 1,
0.652432, 0.38273, 1.4905, 1, 1, 1, 1, 1,
0.6580365, 1.425181, -1.25643, 1, 1, 1, 1, 1,
0.6704869, 0.5459729, 1.38401, 1, 1, 1, 1, 1,
0.6716611, 0.7263026, 2.364238, 1, 1, 1, 1, 1,
0.6740883, 0.7229636, -0.1075763, 1, 1, 1, 1, 1,
0.6763033, 0.7510514, 2.048815, 1, 1, 1, 1, 1,
0.6804302, -1.918585, 3.519913, 1, 1, 1, 1, 1,
0.6823003, 0.7464319, 1.677081, 1, 1, 1, 1, 1,
0.6828136, -0.2382003, 0.8633481, 1, 1, 1, 1, 1,
0.6892912, -0.2455988, 2.094429, 1, 1, 1, 1, 1,
0.6913905, 0.3689539, 1.848482, 1, 1, 1, 1, 1,
0.6925925, 0.07138094, 1.280447, 1, 1, 1, 1, 1,
0.6945168, -0.5603573, 3.581189, 1, 1, 1, 1, 1,
0.6954758, 0.8679433, 1.16004, 1, 1, 1, 1, 1,
0.7018613, 0.6692266, -0.2157801, 1, 1, 1, 1, 1,
0.7032376, 0.8297905, 0.8795533, 0, 0, 1, 1, 1,
0.7062658, 0.7805517, -0.6834494, 1, 0, 0, 1, 1,
0.7085324, -2.752695, 3.251868, 1, 0, 0, 1, 1,
0.7193508, -0.6182936, 2.052034, 1, 0, 0, 1, 1,
0.7208382, -2.230741, 3.016213, 1, 0, 0, 1, 1,
0.7220212, 1.605868, 2.479755, 1, 0, 0, 1, 1,
0.7240536, -1.259582, 1.725726, 0, 0, 0, 1, 1,
0.7288249, 1.368469, 0.23925, 0, 0, 0, 1, 1,
0.7313795, -0.7844108, 1.053954, 0, 0, 0, 1, 1,
0.7328792, 0.3932743, -0.4871451, 0, 0, 0, 1, 1,
0.7331433, 0.2619751, 2.234143, 0, 0, 0, 1, 1,
0.7359742, -0.5364702, 2.648446, 0, 0, 0, 1, 1,
0.738131, 0.9021245, 1.659961, 0, 0, 0, 1, 1,
0.7387626, 0.6533725, -1.302899, 1, 1, 1, 1, 1,
0.7457506, 2.353813, -0.3030794, 1, 1, 1, 1, 1,
0.7480534, -0.7494996, 3.498502, 1, 1, 1, 1, 1,
0.7489901, 1.795697, -1.244848, 1, 1, 1, 1, 1,
0.7544184, 1.499161, 0.57822, 1, 1, 1, 1, 1,
0.7630959, 0.7850062, 0.3955063, 1, 1, 1, 1, 1,
0.7672356, -0.08481385, 0.12698, 1, 1, 1, 1, 1,
0.771273, 0.470084, 0.6198, 1, 1, 1, 1, 1,
0.7723446, 0.228831, 1.172326, 1, 1, 1, 1, 1,
0.7772903, 0.8145446, -0.0177573, 1, 1, 1, 1, 1,
0.7824129, -0.9382187, 0.9007447, 1, 1, 1, 1, 1,
0.7840486, -0.04285699, 2.280335, 1, 1, 1, 1, 1,
0.7894236, 1.558822, 0.3741344, 1, 1, 1, 1, 1,
0.7902497, 0.6399019, -0.9709904, 1, 1, 1, 1, 1,
0.7960183, -0.7237546, 1.297124, 1, 1, 1, 1, 1,
0.8010311, 0.3690304, 0.07925808, 0, 0, 1, 1, 1,
0.8052496, -0.8394557, 1.652598, 1, 0, 0, 1, 1,
0.8108495, 1.009817, 3.022125, 1, 0, 0, 1, 1,
0.8112561, 0.8687316, -0.1246036, 1, 0, 0, 1, 1,
0.8126682, 0.1040345, 0.6504917, 1, 0, 0, 1, 1,
0.8187382, -2.926968, 3.303997, 1, 0, 0, 1, 1,
0.8250567, 1.209231, 2.471144, 0, 0, 0, 1, 1,
0.8269891, -0.3213089, 0.1597012, 0, 0, 0, 1, 1,
0.8318428, -0.4667147, 0.6690303, 0, 0, 0, 1, 1,
0.8321638, 0.8475524, 0.01985234, 0, 0, 0, 1, 1,
0.8363783, 0.9505859, -0.2873918, 0, 0, 0, 1, 1,
0.8392122, 0.07022292, 0.7541735, 0, 0, 0, 1, 1,
0.8409967, 1.022818, 0.8384312, 0, 0, 0, 1, 1,
0.8446949, 0.1497196, 0.5968229, 1, 1, 1, 1, 1,
0.8451225, -0.2642013, 2.115844, 1, 1, 1, 1, 1,
0.8497007, -0.377224, 3.084257, 1, 1, 1, 1, 1,
0.8540509, 0.1632223, 1.978869, 1, 1, 1, 1, 1,
0.8614985, -1.153662, 3.206167, 1, 1, 1, 1, 1,
0.8617811, 0.8133534, 2.012437, 1, 1, 1, 1, 1,
0.8625455, 0.8181468, -0.1056733, 1, 1, 1, 1, 1,
0.8628002, 0.6397095, -0.01838576, 1, 1, 1, 1, 1,
0.8784755, 0.5370659, 1.38206, 1, 1, 1, 1, 1,
0.8785518, -0.1936278, 1.391354, 1, 1, 1, 1, 1,
0.8789379, -0.3942909, 0.1869046, 1, 1, 1, 1, 1,
0.8886698, -1.013358, 1.743715, 1, 1, 1, 1, 1,
0.8908958, -0.7464947, 3.138448, 1, 1, 1, 1, 1,
0.8951132, 0.8638366, 1.425841, 1, 1, 1, 1, 1,
0.9036813, 0.1316157, 0.3346187, 1, 1, 1, 1, 1,
0.9040955, -2.278823, 3.862821, 0, 0, 1, 1, 1,
0.9060665, -0.6542939, 2.249754, 1, 0, 0, 1, 1,
0.912613, 0.09361324, 3.981172, 1, 0, 0, 1, 1,
0.9128953, -0.1685828, 0.7852654, 1, 0, 0, 1, 1,
0.9149532, 0.4738881, 1.418852, 1, 0, 0, 1, 1,
0.9214031, 0.1933029, 1.841371, 1, 0, 0, 1, 1,
0.9220023, 0.2818133, 1.276492, 0, 0, 0, 1, 1,
0.9263531, -0.7002548, 2.263737, 0, 0, 0, 1, 1,
0.9266811, 1.897321, 1.290132, 0, 0, 0, 1, 1,
0.931184, -1.147781, 1.776215, 0, 0, 0, 1, 1,
0.9395239, -0.08488944, 1.933375, 0, 0, 0, 1, 1,
0.9444568, -0.5813854, 2.977559, 0, 0, 0, 1, 1,
0.9456999, -1.463313, 1.861921, 0, 0, 0, 1, 1,
0.9473474, 1.55486, 0.5315554, 1, 1, 1, 1, 1,
0.9481803, -0.2728804, 1.577019, 1, 1, 1, 1, 1,
0.9492328, 1.245904, -0.3938268, 1, 1, 1, 1, 1,
0.9531374, -0.6159515, 2.858634, 1, 1, 1, 1, 1,
0.959946, 0.3040834, 1.615913, 1, 1, 1, 1, 1,
0.9599943, -0.09061459, 1.28371, 1, 1, 1, 1, 1,
0.9670226, -1.627702, 1.466448, 1, 1, 1, 1, 1,
0.9699354, -0.3006381, 2.038157, 1, 1, 1, 1, 1,
0.9717138, -0.5754232, 2.227371, 1, 1, 1, 1, 1,
0.9734588, -1.259473, 3.200408, 1, 1, 1, 1, 1,
0.97377, -0.2885695, 0.9042505, 1, 1, 1, 1, 1,
0.9747525, -0.5195015, 1.415945, 1, 1, 1, 1, 1,
0.9871575, -0.5955981, 1.355591, 1, 1, 1, 1, 1,
0.9911177, -0.06720731, 1.010334, 1, 1, 1, 1, 1,
0.9993962, -1.891188, 1.645926, 1, 1, 1, 1, 1,
1.004898, -0.2600535, 1.502759, 0, 0, 1, 1, 1,
1.008944, 0.549181, -0.5335321, 1, 0, 0, 1, 1,
1.011143, 1.709785, 0.3461062, 1, 0, 0, 1, 1,
1.012355, 1.697482, 0.1254553, 1, 0, 0, 1, 1,
1.019, -0.1214951, 1.332569, 1, 0, 0, 1, 1,
1.021576, -0.06412111, 2.869759, 1, 0, 0, 1, 1,
1.027448, -1.397789, 3.339914, 0, 0, 0, 1, 1,
1.031348, 0.6585183, 0.6174759, 0, 0, 0, 1, 1,
1.036997, -0.3484174, -0.7134883, 0, 0, 0, 1, 1,
1.039004, -0.1116233, 0.3756302, 0, 0, 0, 1, 1,
1.060432, 0.5509118, -1.271455, 0, 0, 0, 1, 1,
1.064199, 1.553361, -1.552701, 0, 0, 0, 1, 1,
1.071509, 0.2662041, 1.966024, 0, 0, 0, 1, 1,
1.072843, -0.1783697, 2.495592, 1, 1, 1, 1, 1,
1.076735, -1.501479, 3.450948, 1, 1, 1, 1, 1,
1.078231, 0.09445688, 0.9929233, 1, 1, 1, 1, 1,
1.081658, -0.343775, 0.8242047, 1, 1, 1, 1, 1,
1.083448, -0.5411469, 1.92769, 1, 1, 1, 1, 1,
1.09715, 1.241914, 0.6459544, 1, 1, 1, 1, 1,
1.101556, 0.6307945, -0.2727636, 1, 1, 1, 1, 1,
1.105603, -0.8353698, 1.956717, 1, 1, 1, 1, 1,
1.11565, -0.6418684, 2.693454, 1, 1, 1, 1, 1,
1.121342, -0.5075631, 2.393042, 1, 1, 1, 1, 1,
1.122043, -0.3201014, 1.490295, 1, 1, 1, 1, 1,
1.125307, -0.6491119, 1.094774, 1, 1, 1, 1, 1,
1.126617, -0.6228377, 1.00646, 1, 1, 1, 1, 1,
1.135409, 1.636931, 0.6826875, 1, 1, 1, 1, 1,
1.137335, -1.094711, 2.300482, 1, 1, 1, 1, 1,
1.142689, -0.517495, 3.035419, 0, 0, 1, 1, 1,
1.145511, -0.7103273, 1.867087, 1, 0, 0, 1, 1,
1.150466, 0.5903847, -0.2357573, 1, 0, 0, 1, 1,
1.158519, -2.078106, 4.975822, 1, 0, 0, 1, 1,
1.15853, -0.4315054, 2.122661, 1, 0, 0, 1, 1,
1.159531, 0.1052447, 2.091339, 1, 0, 0, 1, 1,
1.165417, -1.62326, 1.492981, 0, 0, 0, 1, 1,
1.167391, -0.2409985, 0.599371, 0, 0, 0, 1, 1,
1.171899, -1.762239, 3.384843, 0, 0, 0, 1, 1,
1.175739, 0.8516032, 2.45979, 0, 0, 0, 1, 1,
1.177824, -0.8946386, 2.636049, 0, 0, 0, 1, 1,
1.18264, 1.232849, 1.060805, 0, 0, 0, 1, 1,
1.184267, -0.1039245, -0.2654874, 0, 0, 0, 1, 1,
1.185405, 1.140219, 1.048345, 1, 1, 1, 1, 1,
1.187196, -0.8078979, 2.847699, 1, 1, 1, 1, 1,
1.194208, -0.2456343, 1.757975, 1, 1, 1, 1, 1,
1.212002, 1.372911, 1.370025, 1, 1, 1, 1, 1,
1.213218, -0.4449913, 3.500323, 1, 1, 1, 1, 1,
1.215029, -1.000582, 1.524926, 1, 1, 1, 1, 1,
1.21982, 1.340807, -0.2471213, 1, 1, 1, 1, 1,
1.220464, 0.170747, 1.710764, 1, 1, 1, 1, 1,
1.227028, 0.4561998, 2.89752, 1, 1, 1, 1, 1,
1.231036, 0.3552063, 1.561684, 1, 1, 1, 1, 1,
1.233728, 1.068603, 1.280477, 1, 1, 1, 1, 1,
1.234341, -1.03361, 3.56057, 1, 1, 1, 1, 1,
1.234557, 0.2670044, 0.814823, 1, 1, 1, 1, 1,
1.247517, -1.169021, 1.642586, 1, 1, 1, 1, 1,
1.248443, 0.1177152, 1.904882, 1, 1, 1, 1, 1,
1.248878, 0.551945, -1.154557, 0, 0, 1, 1, 1,
1.269745, 0.4594014, 1.647747, 1, 0, 0, 1, 1,
1.270303, 0.2050032, 0.5751517, 1, 0, 0, 1, 1,
1.274477, 0.06399109, 1.150205, 1, 0, 0, 1, 1,
1.275993, -0.2827643, 2.926598, 1, 0, 0, 1, 1,
1.279543, 0.4368041, 0.1744475, 1, 0, 0, 1, 1,
1.289288, -0.6899027, 3.092759, 0, 0, 0, 1, 1,
1.29046, 0.3680335, 0.6219532, 0, 0, 0, 1, 1,
1.299685, -0.2134356, 1.960038, 0, 0, 0, 1, 1,
1.300187, -0.0171856, 1.041422, 0, 0, 0, 1, 1,
1.320719, 0.8141627, -0.2501907, 0, 0, 0, 1, 1,
1.327111, 0.2323486, 3.444114, 0, 0, 0, 1, 1,
1.329645, 1.337212, 0.009427075, 0, 0, 0, 1, 1,
1.331116, 0.4164626, 0.5970874, 1, 1, 1, 1, 1,
1.338523, -0.2936393, 2.097689, 1, 1, 1, 1, 1,
1.340276, -0.04926684, 0.4081673, 1, 1, 1, 1, 1,
1.350173, -0.4723337, 2.314795, 1, 1, 1, 1, 1,
1.350825, 0.9063304, 0.8349725, 1, 1, 1, 1, 1,
1.35259, 0.9089848, 2.900079, 1, 1, 1, 1, 1,
1.371612, -0.5855372, 3.591491, 1, 1, 1, 1, 1,
1.371826, -0.3012973, 2.32033, 1, 1, 1, 1, 1,
1.373264, 0.8986875, -1.249258, 1, 1, 1, 1, 1,
1.377012, 2.356868, -1.530777, 1, 1, 1, 1, 1,
1.378201, -0.5737113, 1.562009, 1, 1, 1, 1, 1,
1.397947, 0.1880011, -0.5045204, 1, 1, 1, 1, 1,
1.40179, -1.232071, 1.447205, 1, 1, 1, 1, 1,
1.411593, 0.1363728, 2.876874, 1, 1, 1, 1, 1,
1.429665, 0.3197567, 0.6772779, 1, 1, 1, 1, 1,
1.43016, 1.449189, 2.006655, 0, 0, 1, 1, 1,
1.433603, 0.3728224, 2.251915, 1, 0, 0, 1, 1,
1.441581, -1.388692, 1.586641, 1, 0, 0, 1, 1,
1.442017, 0.183669, 2.06069, 1, 0, 0, 1, 1,
1.458309, 0.5654389, 2.457007, 1, 0, 0, 1, 1,
1.460038, 0.1009527, 1.876982, 1, 0, 0, 1, 1,
1.466993, 0.07181251, 1.664774, 0, 0, 0, 1, 1,
1.470773, -0.01924882, 2.996178, 0, 0, 0, 1, 1,
1.472765, -1.438917, 1.280007, 0, 0, 0, 1, 1,
1.477764, 1.366231, 1.163875, 0, 0, 0, 1, 1,
1.494237, 0.1792067, 2.028698, 0, 0, 0, 1, 1,
1.498863, -0.4951244, 4.201127, 0, 0, 0, 1, 1,
1.502344, -1.235369, 2.346597, 0, 0, 0, 1, 1,
1.505664, -0.4566162, 3.743472, 1, 1, 1, 1, 1,
1.522177, -1.072522, 3.576255, 1, 1, 1, 1, 1,
1.523993, 0.3572552, 1.892921, 1, 1, 1, 1, 1,
1.533364, 1.083968, 1.274633, 1, 1, 1, 1, 1,
1.57585, -1.324476, 2.004611, 1, 1, 1, 1, 1,
1.584958, -0.7011735, 3.03019, 1, 1, 1, 1, 1,
1.586264, 2.660604, 0.8182536, 1, 1, 1, 1, 1,
1.589752, -0.6954819, 1.62448, 1, 1, 1, 1, 1,
1.607476, -0.03451963, 1.254551, 1, 1, 1, 1, 1,
1.610445, 0.2088237, 1.067897, 1, 1, 1, 1, 1,
1.617665, 0.654208, 1.308607, 1, 1, 1, 1, 1,
1.618212, 1.032703, 1.333375, 1, 1, 1, 1, 1,
1.622719, -0.9165372, 2.970771, 1, 1, 1, 1, 1,
1.654986, -0.2242704, -0.06465009, 1, 1, 1, 1, 1,
1.669395, 0.3636428, 0.8568602, 1, 1, 1, 1, 1,
1.670158, -1.334738, 1.067334, 0, 0, 1, 1, 1,
1.670168, -0.0860035, 1.999154, 1, 0, 0, 1, 1,
1.694147, 0.525175, 2.362411, 1, 0, 0, 1, 1,
1.69456, -0.5506082, -0.5204825, 1, 0, 0, 1, 1,
1.70199, -0.4743664, 3.518646, 1, 0, 0, 1, 1,
1.718004, 1.411734, 1.706438, 1, 0, 0, 1, 1,
1.726202, -0.4311349, 1.436378, 0, 0, 0, 1, 1,
1.730075, 0.05906975, 0.8616766, 0, 0, 0, 1, 1,
1.733646, 0.867335, -0.462973, 0, 0, 0, 1, 1,
1.734841, -0.7201652, 1.707104, 0, 0, 0, 1, 1,
1.789773, -1.273997, 2.17197, 0, 0, 0, 1, 1,
1.802621, 1.88155, 0.5329769, 0, 0, 0, 1, 1,
1.828774, 0.01384065, 2.569378, 0, 0, 0, 1, 1,
1.885445, 2.180618, 1.251143, 1, 1, 1, 1, 1,
1.891742, 2.083629, 0.8560653, 1, 1, 1, 1, 1,
1.900826, 0.3459429, 1.972214, 1, 1, 1, 1, 1,
1.907042, 0.6975406, 2.013885, 1, 1, 1, 1, 1,
1.923589, -0.05272691, 1.760315, 1, 1, 1, 1, 1,
1.94109, 0.4733053, 2.103634, 1, 1, 1, 1, 1,
1.955008, 0.2315262, 3.276314, 1, 1, 1, 1, 1,
1.978372, -0.3949187, 1.676594, 1, 1, 1, 1, 1,
1.993018, -0.990272, 1.614888, 1, 1, 1, 1, 1,
2.018938, 0.4384514, 1.822209, 1, 1, 1, 1, 1,
2.023411, -0.4303443, 2.613368, 1, 1, 1, 1, 1,
2.093436, -1.38148, 0.3626061, 1, 1, 1, 1, 1,
2.094535, 0.9947259, 1.435707, 1, 1, 1, 1, 1,
2.105769, 0.2411145, 0.4279041, 1, 1, 1, 1, 1,
2.127935, -0.2529787, 1.988802, 1, 1, 1, 1, 1,
2.138533, 0.1223659, 1.081594, 0, 0, 1, 1, 1,
2.150049, 0.3173764, -0.008563669, 1, 0, 0, 1, 1,
2.150762, 0.9221343, 0.04706126, 1, 0, 0, 1, 1,
2.15134, 0.3204532, 1.794661, 1, 0, 0, 1, 1,
2.165717, -0.6156007, 2.097304, 1, 0, 0, 1, 1,
2.166859, 0.3822175, 2.809147, 1, 0, 0, 1, 1,
2.170461, -1.23425, 1.827123, 0, 0, 0, 1, 1,
2.170841, 0.2390143, 1.733765, 0, 0, 0, 1, 1,
2.192337, 0.2464503, -0.6012471, 0, 0, 0, 1, 1,
2.196659, -3.024858, 3.584511, 0, 0, 0, 1, 1,
2.235523, 0.26608, 1.276102, 0, 0, 0, 1, 1,
2.321832, 1.78713, 1.053182, 0, 0, 0, 1, 1,
2.381648, 1.222146, 0.7591438, 0, 0, 0, 1, 1,
2.466083, 2.050748, 0.6194311, 1, 1, 1, 1, 1,
2.476672, -0.8498791, -0.3756225, 1, 1, 1, 1, 1,
2.522457, 0.553403, 1.691085, 1, 1, 1, 1, 1,
2.661212, -0.06417921, 0.9399842, 1, 1, 1, 1, 1,
2.67575, -0.6590704, 0.01089277, 1, 1, 1, 1, 1,
2.808644, -1.109834, 1.807132, 1, 1, 1, 1, 1,
3.909016, 1.818514, 0.6757234, 1, 1, 1, 1, 1
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
var radius = 10.06666;
var distance = 35.35872;
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
mvMatrix.translate( -0.09932041, 0.1248397, -0.2250738 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.35872);
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