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
-3.053319, 2.007806, -0.5894912, 1, 0, 0, 1,
-2.944674, 0.8119079, -2.246692, 1, 0.007843138, 0, 1,
-2.862937, 2.195136, 0.1877914, 1, 0.01176471, 0, 1,
-2.828622, -0.3464039, -0.3218759, 1, 0.01960784, 0, 1,
-2.807182, -0.008801402, -0.9439039, 1, 0.02352941, 0, 1,
-2.643315, -3.045027, -0.7347139, 1, 0.03137255, 0, 1,
-2.610009, -0.7838848, -2.797264, 1, 0.03529412, 0, 1,
-2.479614, 0.4553002, -3.000123, 1, 0.04313726, 0, 1,
-2.349501, -1.134468, -2.711013, 1, 0.04705882, 0, 1,
-2.323488, 0.578667, -2.61968, 1, 0.05490196, 0, 1,
-2.322362, 0.2684768, -0.7762768, 1, 0.05882353, 0, 1,
-2.301316, -1.211177, -2.045649, 1, 0.06666667, 0, 1,
-2.267209, -0.5501631, -1.380394, 1, 0.07058824, 0, 1,
-2.260792, -0.8457429, 0.9588526, 1, 0.07843138, 0, 1,
-2.25755, 0.5132365, -1.147419, 1, 0.08235294, 0, 1,
-2.188473, -1.236443, -0.3398349, 1, 0.09019608, 0, 1,
-2.086915, -2.230348, -2.98052, 1, 0.09411765, 0, 1,
-2.032417, 1.204564, -0.7137237, 1, 0.1019608, 0, 1,
-2.020274, 0.3992433, -0.9315988, 1, 0.1098039, 0, 1,
-2.007188, 0.4483671, -2.086769, 1, 0.1137255, 0, 1,
-1.99242, -0.08456413, -1.462031, 1, 0.1215686, 0, 1,
-1.988363, 0.3702354, -2.553955, 1, 0.1254902, 0, 1,
-1.987133, -0.07564599, -2.530714, 1, 0.1333333, 0, 1,
-1.971862, -0.8986483, -4.020563, 1, 0.1372549, 0, 1,
-1.963502, 0.2007818, 1.050756, 1, 0.145098, 0, 1,
-1.934941, 1.531775, -1.043643, 1, 0.1490196, 0, 1,
-1.924073, -0.6331794, -1.250799, 1, 0.1568628, 0, 1,
-1.879791, -1.146159, -1.183274, 1, 0.1607843, 0, 1,
-1.868286, -1.198558, -1.306749, 1, 0.1686275, 0, 1,
-1.862407, -1.556818, -2.101743, 1, 0.172549, 0, 1,
-1.858229, -1.48175, -1.628497, 1, 0.1803922, 0, 1,
-1.846277, 0.5833257, -0.1722678, 1, 0.1843137, 0, 1,
-1.831825, -0.6857176, -0.9193752, 1, 0.1921569, 0, 1,
-1.827053, -1.020771, -1.884121, 1, 0.1960784, 0, 1,
-1.801996, -0.0366069, -1.59998, 1, 0.2039216, 0, 1,
-1.800411, 0.2220548, 0.7204542, 1, 0.2117647, 0, 1,
-1.79702, 0.8599444, -2.98291, 1, 0.2156863, 0, 1,
-1.765606, -1.51558, -0.8013906, 1, 0.2235294, 0, 1,
-1.761286, 0.3841917, -1.640057, 1, 0.227451, 0, 1,
-1.754897, 0.8404996, -0.8055631, 1, 0.2352941, 0, 1,
-1.749386, 0.006118654, -1.009319, 1, 0.2392157, 0, 1,
-1.73971, 0.150333, -1.246812, 1, 0.2470588, 0, 1,
-1.73772, -0.4326781, -3.364902, 1, 0.2509804, 0, 1,
-1.723835, -0.3592878, -3.259983, 1, 0.2588235, 0, 1,
-1.721403, 0.7435085, -1.164362, 1, 0.2627451, 0, 1,
-1.719956, -0.1372483, -1.82955, 1, 0.2705882, 0, 1,
-1.717938, -0.9990963, -0.8354856, 1, 0.2745098, 0, 1,
-1.710708, -1.265891, -1.203579, 1, 0.282353, 0, 1,
-1.70201, 0.8389154, -1.701041, 1, 0.2862745, 0, 1,
-1.701957, 0.1775874, -0.7216607, 1, 0.2941177, 0, 1,
-1.655284, 1.484927, 0.7352283, 1, 0.3019608, 0, 1,
-1.65128, 0.03331802, -3.070433, 1, 0.3058824, 0, 1,
-1.646348, -0.7752938, -2.479448, 1, 0.3137255, 0, 1,
-1.640839, 1.173303, 0.06935392, 1, 0.3176471, 0, 1,
-1.640041, 0.2561605, -1.749415, 1, 0.3254902, 0, 1,
-1.631219, 0.0148271, -1.540475, 1, 0.3294118, 0, 1,
-1.606308, -0.9682249, -1.154793, 1, 0.3372549, 0, 1,
-1.602095, 0.5006993, -2.336054, 1, 0.3411765, 0, 1,
-1.600324, -0.9254084, 0.2278756, 1, 0.3490196, 0, 1,
-1.591248, 1.159795, 0.2685979, 1, 0.3529412, 0, 1,
-1.589366, -0.1183737, -0.5485684, 1, 0.3607843, 0, 1,
-1.58295, -0.4070165, 0.2531275, 1, 0.3647059, 0, 1,
-1.576294, 1.218669, 0.1740925, 1, 0.372549, 0, 1,
-1.575643, 0.8363619, -2.039819, 1, 0.3764706, 0, 1,
-1.538572, -1.099561, -2.874255, 1, 0.3843137, 0, 1,
-1.536226, 1.031951, -0.2523524, 1, 0.3882353, 0, 1,
-1.533068, 0.04852545, -1.642604, 1, 0.3960784, 0, 1,
-1.53228, 0.6416939, -0.9008709, 1, 0.4039216, 0, 1,
-1.529804, 1.337953, -0.7710962, 1, 0.4078431, 0, 1,
-1.514534, 1.197634, -0.8910052, 1, 0.4156863, 0, 1,
-1.504201, -0.2606116, -3.081343, 1, 0.4196078, 0, 1,
-1.499919, -0.3652742, -1.624611, 1, 0.427451, 0, 1,
-1.487782, 0.7401203, -0.8713464, 1, 0.4313726, 0, 1,
-1.487449, -0.9190878, -3.393098, 1, 0.4392157, 0, 1,
-1.486551, -2.272737, -1.626998, 1, 0.4431373, 0, 1,
-1.479305, 0.7370486, -1.32381, 1, 0.4509804, 0, 1,
-1.435989, 1.106443, 0.00819017, 1, 0.454902, 0, 1,
-1.417618, -0.2671612, -1.303164, 1, 0.4627451, 0, 1,
-1.408131, 0.2688528, -1.493683, 1, 0.4666667, 0, 1,
-1.400551, 0.6126361, -0.1185421, 1, 0.4745098, 0, 1,
-1.394532, -1.333296, -2.464241, 1, 0.4784314, 0, 1,
-1.392129, 0.4183642, -2.40202, 1, 0.4862745, 0, 1,
-1.384075, -0.4379597, -2.891008, 1, 0.4901961, 0, 1,
-1.380538, -0.5006868, -1.730265, 1, 0.4980392, 0, 1,
-1.375966, 0.2408487, -0.932922, 1, 0.5058824, 0, 1,
-1.361491, -0.05264908, 0.01619835, 1, 0.509804, 0, 1,
-1.360166, -0.4491022, -2.125946, 1, 0.5176471, 0, 1,
-1.359238, -0.160752, -1.596857, 1, 0.5215687, 0, 1,
-1.356059, 0.1062382, -1.625744, 1, 0.5294118, 0, 1,
-1.344075, 0.139328, -0.8434027, 1, 0.5333334, 0, 1,
-1.322725, -0.3876331, -2.238288, 1, 0.5411765, 0, 1,
-1.322217, 1.338311, -3.078705, 1, 0.5450981, 0, 1,
-1.318783, -0.1739407, -2.044424, 1, 0.5529412, 0, 1,
-1.31776, -0.5856092, -2.425357, 1, 0.5568628, 0, 1,
-1.312956, -0.6251602, -2.081738, 1, 0.5647059, 0, 1,
-1.312307, 0.9697552, -0.9497002, 1, 0.5686275, 0, 1,
-1.311287, -0.4466375, -2.134417, 1, 0.5764706, 0, 1,
-1.308198, -0.3820639, -2.705353, 1, 0.5803922, 0, 1,
-1.305897, 0.1590516, -2.743629, 1, 0.5882353, 0, 1,
-1.303586, 0.900454, -2.681765, 1, 0.5921569, 0, 1,
-1.293076, -0.2856971, -1.776832, 1, 0.6, 0, 1,
-1.29129, -0.8227794, -2.458507, 1, 0.6078432, 0, 1,
-1.291105, 0.5168357, -0.541261, 1, 0.6117647, 0, 1,
-1.288841, 0.07543531, -3.163599, 1, 0.6196079, 0, 1,
-1.28039, 1.644542, -2.505193, 1, 0.6235294, 0, 1,
-1.27979, 0.121224, -1.501642, 1, 0.6313726, 0, 1,
-1.277863, -1.238732, -2.222067, 1, 0.6352941, 0, 1,
-1.270166, -0.6086636, -1.598614, 1, 0.6431373, 0, 1,
-1.264251, 0.1705603, -5.133186, 1, 0.6470588, 0, 1,
-1.255612, -0.8436896, -2.487672, 1, 0.654902, 0, 1,
-1.253318, -1.406212, -0.8541378, 1, 0.6588235, 0, 1,
-1.253179, 0.01689798, -0.8119828, 1, 0.6666667, 0, 1,
-1.25102, -1.542226, -3.942316, 1, 0.6705883, 0, 1,
-1.23737, -0.006444531, -2.928785, 1, 0.6784314, 0, 1,
-1.237311, 0.8788069, 0.1050867, 1, 0.682353, 0, 1,
-1.229554, 0.7821609, -2.078564, 1, 0.6901961, 0, 1,
-1.225273, -0.268213, -0.9596445, 1, 0.6941177, 0, 1,
-1.213833, 1.836206, -0.3904113, 1, 0.7019608, 0, 1,
-1.213003, -0.2423645, -2.913173, 1, 0.7098039, 0, 1,
-1.210556, 2.144375, -0.5346356, 1, 0.7137255, 0, 1,
-1.20653, 0.5821791, -1.932801, 1, 0.7215686, 0, 1,
-1.205582, -0.7260869, -1.655584, 1, 0.7254902, 0, 1,
-1.19033, -0.4795362, -1.303801, 1, 0.7333333, 0, 1,
-1.17996, 0.01875837, -3.948192, 1, 0.7372549, 0, 1,
-1.171792, 1.202232, -0.5799894, 1, 0.7450981, 0, 1,
-1.167323, -0.1658883, -2.994904, 1, 0.7490196, 0, 1,
-1.1608, 0.8102115, -2.030395, 1, 0.7568628, 0, 1,
-1.159005, 0.06706452, -0.07736652, 1, 0.7607843, 0, 1,
-1.149658, 0.9972807, -0.4120556, 1, 0.7686275, 0, 1,
-1.143514, 0.8590099, -0.733717, 1, 0.772549, 0, 1,
-1.14259, 0.4210254, 2.344754, 1, 0.7803922, 0, 1,
-1.131754, 0.0007901088, -1.754276, 1, 0.7843137, 0, 1,
-1.131035, -1.166752, -3.873808, 1, 0.7921569, 0, 1,
-1.130856, -0.8709405, -1.604844, 1, 0.7960784, 0, 1,
-1.13046, -1.022206, -3.623051, 1, 0.8039216, 0, 1,
-1.124708, 2.169641, -0.6104432, 1, 0.8117647, 0, 1,
-1.120188, 2.869205, -0.1009121, 1, 0.8156863, 0, 1,
-1.116187, -0.7206016, -2.859897, 1, 0.8235294, 0, 1,
-1.112805, 3.126918, -0.08731498, 1, 0.827451, 0, 1,
-1.111264, -0.9277946, -3.446903, 1, 0.8352941, 0, 1,
-1.10932, 2.210819, -0.558333, 1, 0.8392157, 0, 1,
-1.107433, -1.45614, -1.701154, 1, 0.8470588, 0, 1,
-1.102005, -1.946626, -1.803486, 1, 0.8509804, 0, 1,
-1.097732, -0.2690504, -0.05690664, 1, 0.8588235, 0, 1,
-1.085558, 0.7270438, 0.439857, 1, 0.8627451, 0, 1,
-1.082553, -1.568947, -2.209226, 1, 0.8705882, 0, 1,
-1.07135, 1.780769, -0.3735339, 1, 0.8745098, 0, 1,
-1.067646, 0.1783966, -1.865813, 1, 0.8823529, 0, 1,
-1.062815, -1.130741, -2.549597, 1, 0.8862745, 0, 1,
-1.062351, 2.196667, 0.9723163, 1, 0.8941177, 0, 1,
-1.05529, 1.167877, -1.534871, 1, 0.8980392, 0, 1,
-1.052048, -2.169851, -2.576909, 1, 0.9058824, 0, 1,
-1.046907, 0.1692093, -1.811862, 1, 0.9137255, 0, 1,
-1.032317, 0.9782065, -1.727595, 1, 0.9176471, 0, 1,
-1.030955, -0.3771826, -2.490348, 1, 0.9254902, 0, 1,
-1.021107, -0.5126663, -2.057933, 1, 0.9294118, 0, 1,
-1.00789, 0.2710961, -2.787516, 1, 0.9372549, 0, 1,
-1.007817, -0.617157, -3.509007, 1, 0.9411765, 0, 1,
-1.005021, -0.541913, -2.098742, 1, 0.9490196, 0, 1,
-1.001619, 2.000393, -1.593109, 1, 0.9529412, 0, 1,
-1.001528, 1.265672, -1.648885, 1, 0.9607843, 0, 1,
-0.9912381, 1.839267, 0.9643424, 1, 0.9647059, 0, 1,
-0.9905153, -1.091943, -2.636118, 1, 0.972549, 0, 1,
-0.989708, 2.026502, 1.198701, 1, 0.9764706, 0, 1,
-0.9593868, 1.066904, -1.253159, 1, 0.9843137, 0, 1,
-0.9591353, -0.531919, -1.645983, 1, 0.9882353, 0, 1,
-0.9585463, 0.3180576, -2.447179, 1, 0.9960784, 0, 1,
-0.9545949, -1.119188, -2.231967, 0.9960784, 1, 0, 1,
-0.9526789, -0.6767243, -4.026245, 0.9921569, 1, 0, 1,
-0.9508743, -1.933724, -2.359153, 0.9843137, 1, 0, 1,
-0.9432822, 0.6374997, -2.036075, 0.9803922, 1, 0, 1,
-0.9417084, 1.263307, -0.4883369, 0.972549, 1, 0, 1,
-0.9413289, 1.739228, -1.3765, 0.9686275, 1, 0, 1,
-0.9398317, 0.8079559, -1.027263, 0.9607843, 1, 0, 1,
-0.9384401, -0.191895, -0.7378936, 0.9568627, 1, 0, 1,
-0.9355813, -1.779973, -2.59771, 0.9490196, 1, 0, 1,
-0.9336962, 0.1629832, -2.290004, 0.945098, 1, 0, 1,
-0.9309978, -1.833197, -3.269616, 0.9372549, 1, 0, 1,
-0.9295034, 1.087119, -1.17135, 0.9333333, 1, 0, 1,
-0.9288266, -1.392547, -2.230016, 0.9254902, 1, 0, 1,
-0.9278712, 1.128289, -0.6873845, 0.9215686, 1, 0, 1,
-0.9240546, 0.1375501, -2.485126, 0.9137255, 1, 0, 1,
-0.9184926, -0.2446779, -2.52275, 0.9098039, 1, 0, 1,
-0.9149164, 0.7722948, -0.4130594, 0.9019608, 1, 0, 1,
-0.9146034, 1.004166, -0.2106989, 0.8941177, 1, 0, 1,
-0.9139858, 0.779567, 0.1848816, 0.8901961, 1, 0, 1,
-0.904617, -0.5211121, -4.611335, 0.8823529, 1, 0, 1,
-0.9025145, -1.749866, -2.643435, 0.8784314, 1, 0, 1,
-0.8870208, 0.246381, -1.420333, 0.8705882, 1, 0, 1,
-0.8815404, -0.4870625, -2.29776, 0.8666667, 1, 0, 1,
-0.8765805, -0.3621045, -2.512834, 0.8588235, 1, 0, 1,
-0.8735429, -0.2075253, -4.640145, 0.854902, 1, 0, 1,
-0.866152, 0.2015701, -0.8923457, 0.8470588, 1, 0, 1,
-0.8582063, -0.3911853, -1.402023, 0.8431373, 1, 0, 1,
-0.8500445, 0.8580186, -1.926408, 0.8352941, 1, 0, 1,
-0.8499119, -0.3097805, -2.234898, 0.8313726, 1, 0, 1,
-0.8471484, -0.789301, -2.950389, 0.8235294, 1, 0, 1,
-0.8465945, 1.331883, -1.377787, 0.8196079, 1, 0, 1,
-0.8446434, 0.09461848, -2.727316, 0.8117647, 1, 0, 1,
-0.8398961, 0.6315181, -0.7721424, 0.8078431, 1, 0, 1,
-0.8344402, -0.4449848, -2.249158, 0.8, 1, 0, 1,
-0.8342026, -1.056053, -3.796005, 0.7921569, 1, 0, 1,
-0.8287144, -0.2878107, -0.7231646, 0.7882353, 1, 0, 1,
-0.8285148, 0.815295, -0.4355907, 0.7803922, 1, 0, 1,
-0.8282156, -1.651219, -2.723126, 0.7764706, 1, 0, 1,
-0.8263523, -1.523587, -1.779822, 0.7686275, 1, 0, 1,
-0.823353, 1.020789, 0.6378816, 0.7647059, 1, 0, 1,
-0.8128433, 0.6371894, -1.086354, 0.7568628, 1, 0, 1,
-0.8122846, 2.16867, -0.8884044, 0.7529412, 1, 0, 1,
-0.8119392, 0.07767502, -1.552105, 0.7450981, 1, 0, 1,
-0.8104711, 1.557984, 0.485489, 0.7411765, 1, 0, 1,
-0.8078201, -0.4672984, -2.35137, 0.7333333, 1, 0, 1,
-0.791779, 1.822741, -2.049445, 0.7294118, 1, 0, 1,
-0.7916436, 0.2541374, -2.447666, 0.7215686, 1, 0, 1,
-0.7879757, -0.1153207, -2.330404, 0.7176471, 1, 0, 1,
-0.7857311, -0.3520683, -1.150675, 0.7098039, 1, 0, 1,
-0.7820207, -1.849286, -3.457114, 0.7058824, 1, 0, 1,
-0.7794805, -0.07582773, -1.128764, 0.6980392, 1, 0, 1,
-0.770116, -0.9507103, -2.191674, 0.6901961, 1, 0, 1,
-0.7697981, 0.4365269, 0.7593483, 0.6862745, 1, 0, 1,
-0.7658101, 1.355631, -0.9568096, 0.6784314, 1, 0, 1,
-0.7579609, -0.8214905, -3.534928, 0.6745098, 1, 0, 1,
-0.7533035, -0.7719859, -1.441581, 0.6666667, 1, 0, 1,
-0.7526402, -1.117059, -3.241625, 0.6627451, 1, 0, 1,
-0.7499797, -0.7627022, -2.26405, 0.654902, 1, 0, 1,
-0.7466102, 1.856878, 0.301251, 0.6509804, 1, 0, 1,
-0.7461112, 0.0003025457, -1.317669, 0.6431373, 1, 0, 1,
-0.7443024, -0.2254818, -1.608193, 0.6392157, 1, 0, 1,
-0.7429642, -0.1902559, -2.019862, 0.6313726, 1, 0, 1,
-0.7404981, -0.06964834, -2.500992, 0.627451, 1, 0, 1,
-0.7363803, -0.5659291, -2.193217, 0.6196079, 1, 0, 1,
-0.7360425, 0.5236049, -1.715385, 0.6156863, 1, 0, 1,
-0.7359427, 0.04041232, -1.497778, 0.6078432, 1, 0, 1,
-0.7344289, -0.8107404, -2.947349, 0.6039216, 1, 0, 1,
-0.7137794, 1.492967, -0.9942807, 0.5960785, 1, 0, 1,
-0.7119099, -0.01814954, -1.041945, 0.5882353, 1, 0, 1,
-0.7095789, -0.2731822, -3.20981, 0.5843138, 1, 0, 1,
-0.7074891, -2.113515, -2.52369, 0.5764706, 1, 0, 1,
-0.7069976, 0.4768313, -3.167505, 0.572549, 1, 0, 1,
-0.7051181, -0.4989547, -1.091955, 0.5647059, 1, 0, 1,
-0.7043666, -0.5690662, -2.354509, 0.5607843, 1, 0, 1,
-0.702574, 0.3543194, -0.6342706, 0.5529412, 1, 0, 1,
-0.7020829, -1.18156, -2.408937, 0.5490196, 1, 0, 1,
-0.7009079, -0.9296617, -2.166912, 0.5411765, 1, 0, 1,
-0.694941, -1.190005, -3.362856, 0.5372549, 1, 0, 1,
-0.6941427, -2.022267, -5.32971, 0.5294118, 1, 0, 1,
-0.6926741, 0.1511596, -1.48401, 0.5254902, 1, 0, 1,
-0.692629, 1.098329, -0.4273333, 0.5176471, 1, 0, 1,
-0.6880279, -0.7231347, -2.267852, 0.5137255, 1, 0, 1,
-0.6869305, -1.312208, -4.428049, 0.5058824, 1, 0, 1,
-0.6794139, -1.442943, -1.837373, 0.5019608, 1, 0, 1,
-0.6752654, 0.05320978, -2.170468, 0.4941176, 1, 0, 1,
-0.6604028, -1.628583, -3.613071, 0.4862745, 1, 0, 1,
-0.6597388, -0.4726124, -1.23426, 0.4823529, 1, 0, 1,
-0.6581107, 0.3011659, -2.940489, 0.4745098, 1, 0, 1,
-0.6564001, 0.6222792, -0.4317575, 0.4705882, 1, 0, 1,
-0.6554282, -0.7943482, -3.057142, 0.4627451, 1, 0, 1,
-0.654346, -0.3403377, -2.040655, 0.4588235, 1, 0, 1,
-0.6522218, -0.4663827, -0.07071, 0.4509804, 1, 0, 1,
-0.6500518, -0.3972965, -1.661607, 0.4470588, 1, 0, 1,
-0.6469707, -1.716648, -3.670403, 0.4392157, 1, 0, 1,
-0.6460655, 0.7030195, 0.5997192, 0.4352941, 1, 0, 1,
-0.6429443, 0.3937574, 1.162009, 0.427451, 1, 0, 1,
-0.641971, -0.5774922, -1.474946, 0.4235294, 1, 0, 1,
-0.6400105, 1.524141, 0.05380528, 0.4156863, 1, 0, 1,
-0.6366376, 0.7299761, -0.9951146, 0.4117647, 1, 0, 1,
-0.6325527, -1.519704, -2.558419, 0.4039216, 1, 0, 1,
-0.6318915, -1.683578, -2.269336, 0.3960784, 1, 0, 1,
-0.6183275, -1.466432, -3.531315, 0.3921569, 1, 0, 1,
-0.616296, -1.324677, -4.150497, 0.3843137, 1, 0, 1,
-0.6158072, -0.1254644, -1.031889, 0.3803922, 1, 0, 1,
-0.6135626, -0.2933106, -1.773421, 0.372549, 1, 0, 1,
-0.6105791, -0.1924134, -2.01799, 0.3686275, 1, 0, 1,
-0.6101385, -0.08458517, -1.408139, 0.3607843, 1, 0, 1,
-0.5994273, 1.772093, -0.7667237, 0.3568628, 1, 0, 1,
-0.5946299, -0.8378469, -2.053932, 0.3490196, 1, 0, 1,
-0.5929276, 0.8291274, -0.6108714, 0.345098, 1, 0, 1,
-0.5809869, -0.7501063, -1.451806, 0.3372549, 1, 0, 1,
-0.5792087, 0.2786628, -1.010934, 0.3333333, 1, 0, 1,
-0.5776363, 0.4739803, -1.905794, 0.3254902, 1, 0, 1,
-0.5740529, 0.4453661, -1.312708, 0.3215686, 1, 0, 1,
-0.5736927, -1.063362, -2.869871, 0.3137255, 1, 0, 1,
-0.5685173, -0.4534256, -2.216022, 0.3098039, 1, 0, 1,
-0.566372, 0.1475764, -2.188353, 0.3019608, 1, 0, 1,
-0.5657606, 1.273746, -2.460979, 0.2941177, 1, 0, 1,
-0.5584489, -1.018629, -3.50785, 0.2901961, 1, 0, 1,
-0.5536178, -1.198842, -3.874717, 0.282353, 1, 0, 1,
-0.5518348, -0.08222224, -2.488045, 0.2784314, 1, 0, 1,
-0.5472268, -0.2458554, -2.360645, 0.2705882, 1, 0, 1,
-0.5471641, -0.4123398, -2.23418, 0.2666667, 1, 0, 1,
-0.5467136, 0.7430472, -0.8540675, 0.2588235, 1, 0, 1,
-0.5465275, 0.05675116, -1.822942, 0.254902, 1, 0, 1,
-0.5392011, 1.534531, -1.241369, 0.2470588, 1, 0, 1,
-0.5367638, 1.189425, -0.5149847, 0.2431373, 1, 0, 1,
-0.5362208, -1.568211, -4.171203, 0.2352941, 1, 0, 1,
-0.5328004, 1.792017, -1.398104, 0.2313726, 1, 0, 1,
-0.5322867, -0.9147059, -3.557478, 0.2235294, 1, 0, 1,
-0.5308859, -0.4514474, -0.768743, 0.2196078, 1, 0, 1,
-0.5249524, -0.7924517, -3.088512, 0.2117647, 1, 0, 1,
-0.5222052, -0.2219329, -1.949093, 0.2078431, 1, 0, 1,
-0.5206919, 1.476045, 0.6533076, 0.2, 1, 0, 1,
-0.5111594, -0.4148097, -2.106976, 0.1921569, 1, 0, 1,
-0.5081064, 0.9763605, -0.7522555, 0.1882353, 1, 0, 1,
-0.5064501, -1.308374, -4.969921, 0.1803922, 1, 0, 1,
-0.5054517, 0.9481796, -0.7434487, 0.1764706, 1, 0, 1,
-0.5020859, 0.1563748, -0.7481407, 0.1686275, 1, 0, 1,
-0.4954172, -0.2910319, -3.182522, 0.1647059, 1, 0, 1,
-0.4925833, 0.3748354, -1.732349, 0.1568628, 1, 0, 1,
-0.4903743, -0.9629956, -3.493583, 0.1529412, 1, 0, 1,
-0.4869487, -1.716388, -3.232182, 0.145098, 1, 0, 1,
-0.4846671, -0.02259311, -2.439331, 0.1411765, 1, 0, 1,
-0.4809421, -0.2185919, -2.065351, 0.1333333, 1, 0, 1,
-0.4793541, -0.2179515, -1.852109, 0.1294118, 1, 0, 1,
-0.476191, 1.640878, -0.6085761, 0.1215686, 1, 0, 1,
-0.4754239, 0.4378819, -0.499198, 0.1176471, 1, 0, 1,
-0.4701497, -0.1949456, -3.812004, 0.1098039, 1, 0, 1,
-0.463909, -0.7179669, -3.339677, 0.1058824, 1, 0, 1,
-0.4637854, 1.331054, -1.178389, 0.09803922, 1, 0, 1,
-0.4635582, -0.8383765, -2.848669, 0.09019608, 1, 0, 1,
-0.4614103, -0.2963523, -2.738776, 0.08627451, 1, 0, 1,
-0.4574486, -1.141847, -3.22183, 0.07843138, 1, 0, 1,
-0.4540921, 0.3608007, -1.77795, 0.07450981, 1, 0, 1,
-0.4537058, -0.1846089, -0.2219736, 0.06666667, 1, 0, 1,
-0.4515808, -2.25962, -3.282469, 0.0627451, 1, 0, 1,
-0.4484853, -1.683864, -2.708792, 0.05490196, 1, 0, 1,
-0.4460973, 1.576223, 1.68541, 0.05098039, 1, 0, 1,
-0.4460509, 0.8634032, 0.5962803, 0.04313726, 1, 0, 1,
-0.4442103, -0.5624568, -3.068747, 0.03921569, 1, 0, 1,
-0.4427459, 0.6931345, -1.222171, 0.03137255, 1, 0, 1,
-0.4418934, 0.5692962, -0.4885252, 0.02745098, 1, 0, 1,
-0.4370266, -0.7979077, -2.589042, 0.01960784, 1, 0, 1,
-0.4320071, 0.6465431, -0.1962536, 0.01568628, 1, 0, 1,
-0.425711, 0.7879748, -1.051753, 0.007843138, 1, 0, 1,
-0.4235735, -1.175231, -1.939108, 0.003921569, 1, 0, 1,
-0.4233938, 0.5752466, -1.456482, 0, 1, 0.003921569, 1,
-0.4221575, -2.509152, -2.33386, 0, 1, 0.01176471, 1,
-0.420844, -0.3813043, -0.8847448, 0, 1, 0.01568628, 1,
-0.4193353, -0.2625445, -3.730482, 0, 1, 0.02352941, 1,
-0.406088, 0.4334351, -1.125363, 0, 1, 0.02745098, 1,
-0.4054061, -0.7093785, -2.661408, 0, 1, 0.03529412, 1,
-0.4030647, 0.5143023, -0.9946386, 0, 1, 0.03921569, 1,
-0.402185, -0.2711354, -2.619648, 0, 1, 0.04705882, 1,
-0.3946076, 0.9471019, 0.3471196, 0, 1, 0.05098039, 1,
-0.3876936, -0.6415488, -1.814859, 0, 1, 0.05882353, 1,
-0.385572, 0.4750338, -1.711481, 0, 1, 0.0627451, 1,
-0.3806267, -0.7002949, -1.46822, 0, 1, 0.07058824, 1,
-0.3754256, 1.559258, -1.214758, 0, 1, 0.07450981, 1,
-0.3726561, 0.1951432, -0.856104, 0, 1, 0.08235294, 1,
-0.3705001, 0.8513152, -1.099802, 0, 1, 0.08627451, 1,
-0.3671251, -0.04421879, -1.915241, 0, 1, 0.09411765, 1,
-0.3538999, 0.4042117, -1.756429, 0, 1, 0.1019608, 1,
-0.3521169, -0.6740797, -2.269615, 0, 1, 0.1058824, 1,
-0.3507337, 0.4163409, -2.149182, 0, 1, 0.1137255, 1,
-0.349833, -1.295537, -2.419666, 0, 1, 0.1176471, 1,
-0.3497287, -0.9224666, -2.149364, 0, 1, 0.1254902, 1,
-0.3489773, -0.5041882, -4.170613, 0, 1, 0.1294118, 1,
-0.3474266, 1.342538, -1.560179, 0, 1, 0.1372549, 1,
-0.3452538, 0.1067086, -3.236247, 0, 1, 0.1411765, 1,
-0.3412831, -0.1143064, -1.815372, 0, 1, 0.1490196, 1,
-0.3401679, 1.099974, -1.210359, 0, 1, 0.1529412, 1,
-0.3365504, 0.3309522, -1.522413, 0, 1, 0.1607843, 1,
-0.3362112, 1.838895, -0.6702938, 0, 1, 0.1647059, 1,
-0.3357217, 0.1998942, -0.4949526, 0, 1, 0.172549, 1,
-0.3337648, 1.72218, -0.1330421, 0, 1, 0.1764706, 1,
-0.3329518, 0.4127878, -1.650478, 0, 1, 0.1843137, 1,
-0.3308422, 1.141833, 0.06917779, 0, 1, 0.1882353, 1,
-0.3281961, 0.03204593, -0.2311794, 0, 1, 0.1960784, 1,
-0.3279802, -1.212423, -2.390072, 0, 1, 0.2039216, 1,
-0.3273457, -0.3412197, -0.7226326, 0, 1, 0.2078431, 1,
-0.3250935, 0.9391013, -1.785643, 0, 1, 0.2156863, 1,
-0.3250184, -1.791017, -2.762636, 0, 1, 0.2196078, 1,
-0.3249591, -0.3412966, -2.862877, 0, 1, 0.227451, 1,
-0.32022, 0.1715597, -1.385621, 0, 1, 0.2313726, 1,
-0.3200182, -0.6483527, -3.057355, 0, 1, 0.2392157, 1,
-0.3191844, -0.4197172, -1.150919, 0, 1, 0.2431373, 1,
-0.3169009, 1.919541, -0.9679912, 0, 1, 0.2509804, 1,
-0.3165579, 1.056454, -1.365955, 0, 1, 0.254902, 1,
-0.3139457, 2.876198, 0.02477931, 0, 1, 0.2627451, 1,
-0.3132592, 0.5669357, -0.4922745, 0, 1, 0.2666667, 1,
-0.3111587, -1.000132, -4.304487, 0, 1, 0.2745098, 1,
-0.3063088, -0.3273549, -3.451357, 0, 1, 0.2784314, 1,
-0.3035185, -0.9402893, -4.704688, 0, 1, 0.2862745, 1,
-0.2989599, -0.4671778, -1.187233, 0, 1, 0.2901961, 1,
-0.2976856, -0.9710631, -3.324814, 0, 1, 0.2980392, 1,
-0.2970245, 1.292256, -1.180805, 0, 1, 0.3058824, 1,
-0.2943591, 1.333897, -1.330409, 0, 1, 0.3098039, 1,
-0.2911418, -0.9267399, -2.700989, 0, 1, 0.3176471, 1,
-0.2896581, 0.8940325, -1.466645, 0, 1, 0.3215686, 1,
-0.2880094, -1.370409, -4.950395, 0, 1, 0.3294118, 1,
-0.2744561, -0.2246467, -2.888484, 0, 1, 0.3333333, 1,
-0.267474, -0.655713, -1.369961, 0, 1, 0.3411765, 1,
-0.2668403, -1.44392, -2.644337, 0, 1, 0.345098, 1,
-0.2569661, 1.30925, 0.8022675, 0, 1, 0.3529412, 1,
-0.2556175, -0.6392154, -2.797406, 0, 1, 0.3568628, 1,
-0.2464127, -0.399335, -0.6030918, 0, 1, 0.3647059, 1,
-0.2452514, 0.6279289, -1.512493, 0, 1, 0.3686275, 1,
-0.2441333, 3.035303, -0.7387677, 0, 1, 0.3764706, 1,
-0.2405979, -2.221244, -3.187912, 0, 1, 0.3803922, 1,
-0.2376509, 2.620979, -0.4948063, 0, 1, 0.3882353, 1,
-0.2371008, -0.690266, -2.263076, 0, 1, 0.3921569, 1,
-0.2367997, 0.01416181, -2.658113, 0, 1, 0.4, 1,
-0.2342777, 0.4573362, 1.955546, 0, 1, 0.4078431, 1,
-0.2337431, -0.1256972, -1.814283, 0, 1, 0.4117647, 1,
-0.2323172, 1.136236, -0.8989498, 0, 1, 0.4196078, 1,
-0.2317328, 0.313076, -1.142148, 0, 1, 0.4235294, 1,
-0.2308288, 0.4758184, 0.9857183, 0, 1, 0.4313726, 1,
-0.2303099, 0.4625637, 0.9842295, 0, 1, 0.4352941, 1,
-0.2302085, -1.577446, -2.361635, 0, 1, 0.4431373, 1,
-0.2255696, -0.06331176, -1.551998, 0, 1, 0.4470588, 1,
-0.2206796, 1.772607, -0.4064588, 0, 1, 0.454902, 1,
-0.2200402, 0.2988837, 1.137369, 0, 1, 0.4588235, 1,
-0.2185381, -0.2684759, -1.507534, 0, 1, 0.4666667, 1,
-0.2134287, 0.8984629, -0.8564528, 0, 1, 0.4705882, 1,
-0.2105957, 0.3528018, 0.7557582, 0, 1, 0.4784314, 1,
-0.21008, -0.9510502, -2.201401, 0, 1, 0.4823529, 1,
-0.2077656, 0.2464959, 0.1459502, 0, 1, 0.4901961, 1,
-0.2066571, -1.094123, -2.775846, 0, 1, 0.4941176, 1,
-0.2064542, -1.030403, -1.70808, 0, 1, 0.5019608, 1,
-0.2056871, -0.0967439, -1.317694, 0, 1, 0.509804, 1,
-0.2051117, -0.1074686, -2.219226, 0, 1, 0.5137255, 1,
-0.2027434, -0.8445259, -2.471613, 0, 1, 0.5215687, 1,
-0.2025306, 1.139724, -0.305828, 0, 1, 0.5254902, 1,
-0.2000681, -0.5834788, -3.448723, 0, 1, 0.5333334, 1,
-0.1895653, 0.1026385, 0.1454931, 0, 1, 0.5372549, 1,
-0.187993, -0.8928874, -3.184382, 0, 1, 0.5450981, 1,
-0.1872524, -0.5580772, -2.770679, 0, 1, 0.5490196, 1,
-0.1857759, -0.7776776, -2.321359, 0, 1, 0.5568628, 1,
-0.1831855, 0.1419912, -0.3958158, 0, 1, 0.5607843, 1,
-0.1819029, -1.14402, -2.55026, 0, 1, 0.5686275, 1,
-0.1815063, -0.588397, -2.472865, 0, 1, 0.572549, 1,
-0.1772199, -0.8470787, -3.410886, 0, 1, 0.5803922, 1,
-0.1756801, 1.796303, 0.7891961, 0, 1, 0.5843138, 1,
-0.1748452, 1.032549, -0.07872721, 0, 1, 0.5921569, 1,
-0.1743315, -0.8732059, -2.916679, 0, 1, 0.5960785, 1,
-0.1732059, 1.463319, 0.2935725, 0, 1, 0.6039216, 1,
-0.170847, 0.8678662, 0.2294759, 0, 1, 0.6117647, 1,
-0.1707734, 0.5708908, 0.8636914, 0, 1, 0.6156863, 1,
-0.1704113, -0.4988503, -3.326938, 0, 1, 0.6235294, 1,
-0.1694437, -1.942291, -2.301965, 0, 1, 0.627451, 1,
-0.1672907, 0.5437328, -1.062645, 0, 1, 0.6352941, 1,
-0.1637251, -0.3590608, -4.9515, 0, 1, 0.6392157, 1,
-0.1628977, -1.305474, -2.49597, 0, 1, 0.6470588, 1,
-0.1626235, -0.8592383, -1.869659, 0, 1, 0.6509804, 1,
-0.1566039, -0.8426323, -1.746271, 0, 1, 0.6588235, 1,
-0.1500893, 0.0551652, -3.468988, 0, 1, 0.6627451, 1,
-0.1480127, -0.2180826, -2.111491, 0, 1, 0.6705883, 1,
-0.1440884, -0.07918352, -2.137996, 0, 1, 0.6745098, 1,
-0.1435908, 1.381747, 0.9641184, 0, 1, 0.682353, 1,
-0.1435525, -0.2440509, -2.170284, 0, 1, 0.6862745, 1,
-0.1409305, 2.356901, -1.130585, 0, 1, 0.6941177, 1,
-0.1406334, -1.264958, -4.66433, 0, 1, 0.7019608, 1,
-0.1390991, -0.741641, -3.658814, 0, 1, 0.7058824, 1,
-0.138749, -0.07937062, -1.897693, 0, 1, 0.7137255, 1,
-0.137662, 1.23574, 0.5039902, 0, 1, 0.7176471, 1,
-0.1357964, -1.261102, -1.465357, 0, 1, 0.7254902, 1,
-0.1349564, -0.6681004, -1.929837, 0, 1, 0.7294118, 1,
-0.1324083, 0.9650888, 1.134811, 0, 1, 0.7372549, 1,
-0.1291108, -0.7111983, -4.032718, 0, 1, 0.7411765, 1,
-0.1268388, 0.2578599, -1.84176, 0, 1, 0.7490196, 1,
-0.1245196, -0.9666702, -3.321369, 0, 1, 0.7529412, 1,
-0.1242955, -0.08348853, -1.454672, 0, 1, 0.7607843, 1,
-0.1237163, -1.754754, -2.476146, 0, 1, 0.7647059, 1,
-0.1229819, 0.9860554, 1.108304, 0, 1, 0.772549, 1,
-0.1220638, -0.6323496, -3.976324, 0, 1, 0.7764706, 1,
-0.117256, -2.461409, -4.606003, 0, 1, 0.7843137, 1,
-0.1113431, 1.902694, 0.2177116, 0, 1, 0.7882353, 1,
-0.1098907, 0.3511367, -2.039854, 0, 1, 0.7960784, 1,
-0.1059332, -0.9276552, -3.107695, 0, 1, 0.8039216, 1,
-0.1008199, 0.3156859, -0.7125512, 0, 1, 0.8078431, 1,
-0.09882607, -2.042511, -3.605085, 0, 1, 0.8156863, 1,
-0.09520587, 1.690088, 1.341353, 0, 1, 0.8196079, 1,
-0.09288909, -0.7447149, -3.47432, 0, 1, 0.827451, 1,
-0.0920305, -0.356674, -2.670469, 0, 1, 0.8313726, 1,
-0.09167163, 1.493105, 1.664296, 0, 1, 0.8392157, 1,
-0.09012918, -0.6475996, -2.761026, 0, 1, 0.8431373, 1,
-0.08724719, 1.363437, 0.09942354, 0, 1, 0.8509804, 1,
-0.08634017, -0.4088258, -3.847718, 0, 1, 0.854902, 1,
-0.08354193, -0.01252242, -0.5192776, 0, 1, 0.8627451, 1,
-0.07705285, -0.6857736, -3.594455, 0, 1, 0.8666667, 1,
-0.07486412, -1.15029, -3.64515, 0, 1, 0.8745098, 1,
-0.07350117, 0.3341525, -0.07192783, 0, 1, 0.8784314, 1,
-0.07218771, -1.094912, -3.037312, 0, 1, 0.8862745, 1,
-0.06983966, 0.3088386, -0.1947203, 0, 1, 0.8901961, 1,
-0.06308209, -0.08070522, -2.898142, 0, 1, 0.8980392, 1,
-0.06158272, -0.4250453, -2.921289, 0, 1, 0.9058824, 1,
-0.0562319, 0.5015785, 0.7034285, 0, 1, 0.9098039, 1,
-0.051832, 0.2147723, -1.563551, 0, 1, 0.9176471, 1,
-0.04783139, -0.465696, -3.67343, 0, 1, 0.9215686, 1,
-0.04340053, -0.4248177, -3.213933, 0, 1, 0.9294118, 1,
-0.04329037, 1.587567, -0.5281692, 0, 1, 0.9333333, 1,
-0.04279241, -0.5350617, -3.037751, 0, 1, 0.9411765, 1,
-0.04165264, 0.4915423, -1.655409, 0, 1, 0.945098, 1,
-0.0401553, -1.764584, -1.403425, 0, 1, 0.9529412, 1,
-0.03743976, 1.183249, 0.3774254, 0, 1, 0.9568627, 1,
-0.03536056, 0.9414225, 0.9434535, 0, 1, 0.9647059, 1,
-0.02895791, -0.5539054, -2.655313, 0, 1, 0.9686275, 1,
-0.02414049, -0.681674, -1.905307, 0, 1, 0.9764706, 1,
-0.01818988, 1.264175, 0.958653, 0, 1, 0.9803922, 1,
-0.01776904, 0.1254916, 0.2796177, 0, 1, 0.9882353, 1,
-0.01503718, 1.56927, -0.3701827, 0, 1, 0.9921569, 1,
-0.01492856, 1.277883, 0.1961899, 0, 1, 1, 1,
-0.008938131, 0.5552634, -1.699771, 0, 0.9921569, 1, 1,
-0.008199966, 0.7483587, -0.7792588, 0, 0.9882353, 1, 1,
-0.006757839, -1.702537, -2.181782, 0, 0.9803922, 1, 1,
-0.003039416, 1.390748, -2.081614, 0, 0.9764706, 1, 1,
-0.00235774, -0.7965532, -4.679566, 0, 0.9686275, 1, 1,
9.579716e-05, 0.7529899, 0.2180564, 0, 0.9647059, 1, 1,
0.0004081241, 2.245589, -0.31165, 0, 0.9568627, 1, 1,
0.001407948, 0.8234754, 0.3413205, 0, 0.9529412, 1, 1,
0.001721383, 0.5554959, 0.1109318, 0, 0.945098, 1, 1,
0.002509942, -0.3946965, 2.93078, 0, 0.9411765, 1, 1,
0.004023556, 1.166012, -0.450495, 0, 0.9333333, 1, 1,
0.00686911, 0.5770059, -0.02685549, 0, 0.9294118, 1, 1,
0.0100355, 2.196201, -1.213402, 0, 0.9215686, 1, 1,
0.01579214, 0.6299005, -2.724102, 0, 0.9176471, 1, 1,
0.01644963, -1.379779, 3.273095, 0, 0.9098039, 1, 1,
0.01788179, -0.631089, 4.315396, 0, 0.9058824, 1, 1,
0.01820128, 1.773802, -2.662895, 0, 0.8980392, 1, 1,
0.02007529, 1.710116, -0.8242188, 0, 0.8901961, 1, 1,
0.02023031, -0.3520936, 0.7024804, 0, 0.8862745, 1, 1,
0.02087084, 0.2111056, 0.3393745, 0, 0.8784314, 1, 1,
0.02262048, 0.7941173, 0.1876862, 0, 0.8745098, 1, 1,
0.02857582, 1.400118, -2.152867, 0, 0.8666667, 1, 1,
0.02900425, 2.085355, -0.06879323, 0, 0.8627451, 1, 1,
0.02969083, -1.364177, 3.949183, 0, 0.854902, 1, 1,
0.03389275, 0.0400292, 1.779265, 0, 0.8509804, 1, 1,
0.0354958, -0.5361291, 3.665632, 0, 0.8431373, 1, 1,
0.03800663, -0.2523631, 4.070006, 0, 0.8392157, 1, 1,
0.03812699, -0.4083062, 2.299554, 0, 0.8313726, 1, 1,
0.0396469, 1.722431, 1.1115, 0, 0.827451, 1, 1,
0.04146064, -0.6605143, 3.934595, 0, 0.8196079, 1, 1,
0.04274914, -0.9663853, 5.692755, 0, 0.8156863, 1, 1,
0.04461926, 0.01986124, 1.471228, 0, 0.8078431, 1, 1,
0.04521719, -0.2051515, 4.577513, 0, 0.8039216, 1, 1,
0.04535274, 0.2665277, -1.43544, 0, 0.7960784, 1, 1,
0.04557004, 0.8823677, -1.449726, 0, 0.7882353, 1, 1,
0.04858036, 0.7645823, 0.5876761, 0, 0.7843137, 1, 1,
0.04894071, 0.7438967, -1.614391, 0, 0.7764706, 1, 1,
0.0538538, 0.4032048, 1.903132, 0, 0.772549, 1, 1,
0.05679354, 0.0761206, 2.371505, 0, 0.7647059, 1, 1,
0.05795718, -0.3981495, 2.182568, 0, 0.7607843, 1, 1,
0.0585863, 0.7889555, -0.5861907, 0, 0.7529412, 1, 1,
0.06010533, -1.202081, 3.617331, 0, 0.7490196, 1, 1,
0.0612177, -0.2426696, 2.243553, 0, 0.7411765, 1, 1,
0.06255438, 1.322794, -0.2469258, 0, 0.7372549, 1, 1,
0.06455552, -1.076779, 3.384048, 0, 0.7294118, 1, 1,
0.06470161, 0.2433875, 0.05541996, 0, 0.7254902, 1, 1,
0.07073921, 0.6974623, -0.4414854, 0, 0.7176471, 1, 1,
0.07586276, 0.6377727, 0.2919019, 0, 0.7137255, 1, 1,
0.07598874, 0.1894156, 0.1785596, 0, 0.7058824, 1, 1,
0.08168779, 0.5498391, 0.3094841, 0, 0.6980392, 1, 1,
0.0828786, 2.233481, 0.5266679, 0, 0.6941177, 1, 1,
0.08341195, -0.5936636, 4.072315, 0, 0.6862745, 1, 1,
0.08469558, 0.3455196, 0.5985702, 0, 0.682353, 1, 1,
0.08543316, 0.9214153, 0.07656004, 0, 0.6745098, 1, 1,
0.08575834, 1.000191, 0.3225328, 0, 0.6705883, 1, 1,
0.08685178, -1.386509, 1.30526, 0, 0.6627451, 1, 1,
0.08774851, -0.1075406, 2.563048, 0, 0.6588235, 1, 1,
0.08917916, 1.929096, 1.223188, 0, 0.6509804, 1, 1,
0.09132552, 0.9584464, -0.1506614, 0, 0.6470588, 1, 1,
0.09133281, -0.03432756, 2.208887, 0, 0.6392157, 1, 1,
0.09440596, -0.2780731, 4.521344, 0, 0.6352941, 1, 1,
0.09492756, 0.8825278, 0.2824793, 0, 0.627451, 1, 1,
0.09624659, -0.4179114, 3.240212, 0, 0.6235294, 1, 1,
0.09663568, 0.5908979, 0.4152913, 0, 0.6156863, 1, 1,
0.0970392, 0.1815661, -1.669509, 0, 0.6117647, 1, 1,
0.09819919, -0.7829827, 4.122808, 0, 0.6039216, 1, 1,
0.1115997, 0.1735755, -0.5617355, 0, 0.5960785, 1, 1,
0.114824, 0.6819662, -0.804041, 0, 0.5921569, 1, 1,
0.1268217, 0.7166013, 0.2075237, 0, 0.5843138, 1, 1,
0.128458, -0.3199755, 2.619695, 0, 0.5803922, 1, 1,
0.1328105, 0.6795527, 0.9799898, 0, 0.572549, 1, 1,
0.1337643, 0.1000637, 1.342152, 0, 0.5686275, 1, 1,
0.1352786, -0.6629072, 4.108284, 0, 0.5607843, 1, 1,
0.1370113, -0.5872964, 2.624464, 0, 0.5568628, 1, 1,
0.1387797, 0.3850286, 1.734603, 0, 0.5490196, 1, 1,
0.1397457, -0.8365892, 2.778513, 0, 0.5450981, 1, 1,
0.1409811, -1.299505, 3.338454, 0, 0.5372549, 1, 1,
0.1410292, -0.7399587, 2.440373, 0, 0.5333334, 1, 1,
0.1459214, 0.7793873, -0.3992783, 0, 0.5254902, 1, 1,
0.1459572, -0.5867024, 2.307686, 0, 0.5215687, 1, 1,
0.1467434, 1.466429, -0.2489972, 0, 0.5137255, 1, 1,
0.147854, 0.5792465, -0.6656007, 0, 0.509804, 1, 1,
0.154896, -0.1100906, 1.590255, 0, 0.5019608, 1, 1,
0.156608, 2.642919, -0.5569196, 0, 0.4941176, 1, 1,
0.1589963, -0.6787523, 2.027962, 0, 0.4901961, 1, 1,
0.1590333, -0.08632208, 1.132811, 0, 0.4823529, 1, 1,
0.1592319, 0.7938228, 0.4571655, 0, 0.4784314, 1, 1,
0.160426, 0.6063085, 2.102458, 0, 0.4705882, 1, 1,
0.1644429, -0.865951, 3.716219, 0, 0.4666667, 1, 1,
0.1667441, -0.4917465, 2.29454, 0, 0.4588235, 1, 1,
0.1684482, -1.116688, 4.030863, 0, 0.454902, 1, 1,
0.1684707, 1.463188, 0.5976418, 0, 0.4470588, 1, 1,
0.1708303, -0.3747115, 3.23962, 0, 0.4431373, 1, 1,
0.1742264, 2.258077, -0.03672482, 0, 0.4352941, 1, 1,
0.1778513, 0.3627353, 0.1097852, 0, 0.4313726, 1, 1,
0.1780857, 0.593811, 0.8534884, 0, 0.4235294, 1, 1,
0.1781573, 0.2271406, 0.9848837, 0, 0.4196078, 1, 1,
0.1804477, 2.029503, -1.81097, 0, 0.4117647, 1, 1,
0.1805515, -0.6768724, 2.187702, 0, 0.4078431, 1, 1,
0.1849522, -2.060064, 3.343597, 0, 0.4, 1, 1,
0.1886748, -0.590557, 2.045902, 0, 0.3921569, 1, 1,
0.1889504, 2.477499, 1.321573, 0, 0.3882353, 1, 1,
0.1946258, 0.06260915, 2.72858, 0, 0.3803922, 1, 1,
0.1965322, 0.6434811, 1.631678, 0, 0.3764706, 1, 1,
0.1994058, -0.3334999, 1.781031, 0, 0.3686275, 1, 1,
0.199411, 1.137154, -0.02921384, 0, 0.3647059, 1, 1,
0.2049765, -0.3492205, 1.35005, 0, 0.3568628, 1, 1,
0.2067885, 1.300626, 0.458494, 0, 0.3529412, 1, 1,
0.2113605, 0.4487899, 0.2537625, 0, 0.345098, 1, 1,
0.2114347, 0.04527884, 1.463696, 0, 0.3411765, 1, 1,
0.2114921, 0.4327326, 1.958221, 0, 0.3333333, 1, 1,
0.2147547, -0.7683654, 3.103143, 0, 0.3294118, 1, 1,
0.215644, -0.7853003, 2.123265, 0, 0.3215686, 1, 1,
0.2170995, -0.2578383, 2.873718, 0, 0.3176471, 1, 1,
0.2191937, -1.052008, 1.527141, 0, 0.3098039, 1, 1,
0.2196718, 0.9255884, 0.05271349, 0, 0.3058824, 1, 1,
0.2198508, -0.01393899, 0.6527932, 0, 0.2980392, 1, 1,
0.2207512, -1.343474, 4.97968, 0, 0.2901961, 1, 1,
0.2216314, 1.563646, 0.5875162, 0, 0.2862745, 1, 1,
0.2219635, 0.09884615, 0.5003166, 0, 0.2784314, 1, 1,
0.2344639, -1.540152, 2.362328, 0, 0.2745098, 1, 1,
0.2344943, -1.028914, 3.62418, 0, 0.2666667, 1, 1,
0.2348418, 1.224487, -1.01404, 0, 0.2627451, 1, 1,
0.2389737, 0.120349, 1.337129, 0, 0.254902, 1, 1,
0.2412431, -0.9515525, 1.985735, 0, 0.2509804, 1, 1,
0.2428405, 1.610636, 1.7282, 0, 0.2431373, 1, 1,
0.2487518, 1.634856, -0.9341282, 0, 0.2392157, 1, 1,
0.2557203, 0.1319481, 2.508226, 0, 0.2313726, 1, 1,
0.2558244, 0.04574735, 0.2836784, 0, 0.227451, 1, 1,
0.2578831, 1.786123, 0.7816002, 0, 0.2196078, 1, 1,
0.2583539, 1.921427, -0.2866443, 0, 0.2156863, 1, 1,
0.2589777, 0.6488544, 1.699698, 0, 0.2078431, 1, 1,
0.2653724, -1.033918, 0.3257787, 0, 0.2039216, 1, 1,
0.2774733, 0.6690663, 0.534089, 0, 0.1960784, 1, 1,
0.2785786, -0.7159268, 0.7044328, 0, 0.1882353, 1, 1,
0.2890089, -0.4338145, 2.854668, 0, 0.1843137, 1, 1,
0.2894199, -1.288842, 2.947087, 0, 0.1764706, 1, 1,
0.3002658, -0.167359, 1.408693, 0, 0.172549, 1, 1,
0.3013628, -0.4916083, 1.671931, 0, 0.1647059, 1, 1,
0.3152873, -0.3738792, 2.796412, 0, 0.1607843, 1, 1,
0.319545, -0.8221659, 0.9592293, 0, 0.1529412, 1, 1,
0.3226415, 0.6694745, 0.2631296, 0, 0.1490196, 1, 1,
0.3234263, 0.2515539, 2.907408, 0, 0.1411765, 1, 1,
0.3239567, 2.42251, -0.224646, 0, 0.1372549, 1, 1,
0.3248235, -0.4866009, 3.643266, 0, 0.1294118, 1, 1,
0.3256336, 0.3797786, 0.6979198, 0, 0.1254902, 1, 1,
0.3256696, -0.1489946, 1.727647, 0, 0.1176471, 1, 1,
0.3277643, -1.812229, 4.163401, 0, 0.1137255, 1, 1,
0.3295119, -0.2510392, 1.489496, 0, 0.1058824, 1, 1,
0.3313473, 0.874667, -0.8232724, 0, 0.09803922, 1, 1,
0.3347224, -2.457995, 4.465636, 0, 0.09411765, 1, 1,
0.3351692, 1.340518, -0.295177, 0, 0.08627451, 1, 1,
0.3493319, -0.2174015, 1.199785, 0, 0.08235294, 1, 1,
0.3510528, 0.02689538, 3.181895, 0, 0.07450981, 1, 1,
0.3512389, -0.3015974, 0.6219764, 0, 0.07058824, 1, 1,
0.3526193, -1.150248, 2.14917, 0, 0.0627451, 1, 1,
0.3528174, -1.009938, 2.757185, 0, 0.05882353, 1, 1,
0.3540867, -1.221432, 4.070977, 0, 0.05098039, 1, 1,
0.3541878, -1.070897, 2.029337, 0, 0.04705882, 1, 1,
0.3547768, 0.9892475, 2.211164, 0, 0.03921569, 1, 1,
0.3630117, 0.3134876, 0.2872712, 0, 0.03529412, 1, 1,
0.363481, 0.6786107, 0.8190153, 0, 0.02745098, 1, 1,
0.3652681, -1.191786, 3.132937, 0, 0.02352941, 1, 1,
0.3703716, 0.3590718, 1.219694, 0, 0.01568628, 1, 1,
0.3722227, 0.2288226, 1.600086, 0, 0.01176471, 1, 1,
0.3730589, 1.414332, 1.241676, 0, 0.003921569, 1, 1,
0.3748858, -1.303991, 3.031623, 0.003921569, 0, 1, 1,
0.3758965, 2.507833, 0.4960786, 0.007843138, 0, 1, 1,
0.382107, -0.6287306, 1.282323, 0.01568628, 0, 1, 1,
0.3821413, -0.3516122, 4.400836, 0.01960784, 0, 1, 1,
0.3829907, 1.049473, 0.1588453, 0.02745098, 0, 1, 1,
0.3837293, -0.6732911, 4.764574, 0.03137255, 0, 1, 1,
0.3844047, 1.056722, 1.249657, 0.03921569, 0, 1, 1,
0.3848501, -0.8441077, 2.103615, 0.04313726, 0, 1, 1,
0.3880788, 1.387456, 0.01467134, 0.05098039, 0, 1, 1,
0.3886717, 0.8338661, 0.6844555, 0.05490196, 0, 1, 1,
0.3960537, 0.3305408, 0.6544137, 0.0627451, 0, 1, 1,
0.4008638, 1.250446, 0.8483608, 0.06666667, 0, 1, 1,
0.4069697, 0.6626077, -0.6124581, 0.07450981, 0, 1, 1,
0.4077058, 0.4965192, 1.605939, 0.07843138, 0, 1, 1,
0.4098834, -0.6964283, 3.489118, 0.08627451, 0, 1, 1,
0.4104891, -0.1682147, 0.9889907, 0.09019608, 0, 1, 1,
0.4140241, -0.3614282, 3.669582, 0.09803922, 0, 1, 1,
0.4141209, 0.1551288, 0.7228746, 0.1058824, 0, 1, 1,
0.4147494, 1.588756, -1.53033, 0.1098039, 0, 1, 1,
0.4176017, 0.1661116, 1.547096, 0.1176471, 0, 1, 1,
0.4212898, 0.625613, -0.0443972, 0.1215686, 0, 1, 1,
0.4245326, 1.374012, 1.390131, 0.1294118, 0, 1, 1,
0.4247215, -0.7135033, 4.081471, 0.1333333, 0, 1, 1,
0.4251826, 0.6635564, 1.366147, 0.1411765, 0, 1, 1,
0.4293636, -0.8137326, 2.94957, 0.145098, 0, 1, 1,
0.4301791, -2.057278, 3.104438, 0.1529412, 0, 1, 1,
0.4338301, 1.073591, 0.2218454, 0.1568628, 0, 1, 1,
0.435585, -0.6400809, 1.44572, 0.1647059, 0, 1, 1,
0.4391415, 0.1013129, 1.243887, 0.1686275, 0, 1, 1,
0.4409025, -0.1048308, 0.9120476, 0.1764706, 0, 1, 1,
0.4411625, -1.600318, 5.389628, 0.1803922, 0, 1, 1,
0.4424899, 0.3220038, -0.3942691, 0.1882353, 0, 1, 1,
0.4442922, 1.153133, 0.2316882, 0.1921569, 0, 1, 1,
0.4445825, -0.2391092, 1.595038, 0.2, 0, 1, 1,
0.4482234, -0.3128163, 2.520912, 0.2078431, 0, 1, 1,
0.4524566, 0.6343562, 0.5359055, 0.2117647, 0, 1, 1,
0.4578078, 1.502142, -0.7009261, 0.2196078, 0, 1, 1,
0.4609263, 0.3196526, 0.4704462, 0.2235294, 0, 1, 1,
0.4609306, 2.013744, 2.905735, 0.2313726, 0, 1, 1,
0.4614743, 1.20942, 0.5412217, 0.2352941, 0, 1, 1,
0.4648694, -0.3026731, 2.121509, 0.2431373, 0, 1, 1,
0.4702458, 0.526047, 0.006799943, 0.2470588, 0, 1, 1,
0.4741531, 1.389427, 0.3127813, 0.254902, 0, 1, 1,
0.4787912, -1.188242, 2.870206, 0.2588235, 0, 1, 1,
0.4808079, 0.3429245, 1.196028, 0.2666667, 0, 1, 1,
0.4817488, 0.07652166, 1.928582, 0.2705882, 0, 1, 1,
0.4875503, 0.5964233, -2.044585, 0.2784314, 0, 1, 1,
0.4884995, -0.8297643, 3.000946, 0.282353, 0, 1, 1,
0.4925233, 1.386216, -0.255376, 0.2901961, 0, 1, 1,
0.4946362, 0.9385026, 1.594555, 0.2941177, 0, 1, 1,
0.500497, 0.664722, -0.6611262, 0.3019608, 0, 1, 1,
0.5057049, -1.101231, 3.63732, 0.3098039, 0, 1, 1,
0.5080872, 0.6442673, 1.378536, 0.3137255, 0, 1, 1,
0.5137544, 1.503197, 2.664479, 0.3215686, 0, 1, 1,
0.5138534, -0.5310919, 2.423697, 0.3254902, 0, 1, 1,
0.5211627, 0.7426835, 0.4157197, 0.3333333, 0, 1, 1,
0.5212888, 0.4694058, 1.769006, 0.3372549, 0, 1, 1,
0.525026, 0.9286298, -0.7494277, 0.345098, 0, 1, 1,
0.5255793, 0.7183828, 1.569971, 0.3490196, 0, 1, 1,
0.5366212, -0.8360794, 2.559527, 0.3568628, 0, 1, 1,
0.5376344, 1.472457, 0.4519563, 0.3607843, 0, 1, 1,
0.5385023, 0.7171754, 0.7958552, 0.3686275, 0, 1, 1,
0.5399283, 0.7998357, 1.144859, 0.372549, 0, 1, 1,
0.543732, 1.332307, -1.437335, 0.3803922, 0, 1, 1,
0.5507083, -0.05193857, -0.7066678, 0.3843137, 0, 1, 1,
0.5566853, -0.01274803, 1.160414, 0.3921569, 0, 1, 1,
0.5568888, 0.3220138, -0.6624306, 0.3960784, 0, 1, 1,
0.5678349, 0.50291, 0.9397715, 0.4039216, 0, 1, 1,
0.569816, 0.872322, 1.097206, 0.4117647, 0, 1, 1,
0.579656, 0.4611611, 1.804672, 0.4156863, 0, 1, 1,
0.5798906, 0.1122262, 2.254969, 0.4235294, 0, 1, 1,
0.5873568, -0.2355728, 1.109392, 0.427451, 0, 1, 1,
0.5897688, 0.5312884, 1.248263, 0.4352941, 0, 1, 1,
0.5902829, -0.2724082, 2.442203, 0.4392157, 0, 1, 1,
0.5989311, -1.488605, 2.925791, 0.4470588, 0, 1, 1,
0.6007407, -0.4202987, 2.568441, 0.4509804, 0, 1, 1,
0.601078, 1.210477, -0.2455738, 0.4588235, 0, 1, 1,
0.6111743, 2.046283, -1.535427, 0.4627451, 0, 1, 1,
0.6174195, -0.432037, 3.253887, 0.4705882, 0, 1, 1,
0.6179757, 0.537365, 1.882285, 0.4745098, 0, 1, 1,
0.6227509, -0.5052277, 2.323904, 0.4823529, 0, 1, 1,
0.6332405, -0.2498604, 3.24332, 0.4862745, 0, 1, 1,
0.6358855, -0.04912365, 1.036239, 0.4941176, 0, 1, 1,
0.6386483, 0.763244, -1.245983, 0.5019608, 0, 1, 1,
0.6388035, -0.03532515, 1.468142, 0.5058824, 0, 1, 1,
0.6451849, -0.33235, 0.843953, 0.5137255, 0, 1, 1,
0.6478836, -0.9768556, 2.797086, 0.5176471, 0, 1, 1,
0.6505508, -0.9478172, 3.03092, 0.5254902, 0, 1, 1,
0.6642328, 0.6526563, 1.571452, 0.5294118, 0, 1, 1,
0.6646195, 0.08699761, -0.468242, 0.5372549, 0, 1, 1,
0.6688416, 0.7563374, 0.460031, 0.5411765, 0, 1, 1,
0.6690322, -0.2077627, 2.065674, 0.5490196, 0, 1, 1,
0.6695994, -0.9122535, 2.418218, 0.5529412, 0, 1, 1,
0.6706041, -0.1755365, 0.8495066, 0.5607843, 0, 1, 1,
0.6707563, 1.309881, -0.4406277, 0.5647059, 0, 1, 1,
0.6818061, -0.8496099, 1.456822, 0.572549, 0, 1, 1,
0.6829566, -0.5368308, 1.909579, 0.5764706, 0, 1, 1,
0.6886843, 1.400854, 0.4010219, 0.5843138, 0, 1, 1,
0.6888095, -0.09050817, 1.711695, 0.5882353, 0, 1, 1,
0.6902553, 1.144008, 0.2916049, 0.5960785, 0, 1, 1,
0.6902772, 0.9272875, 0.1968711, 0.6039216, 0, 1, 1,
0.6909776, -0.5722487, 3.957241, 0.6078432, 0, 1, 1,
0.6952284, 0.8376318, 0.3395585, 0.6156863, 0, 1, 1,
0.69738, 1.871871, 0.7155657, 0.6196079, 0, 1, 1,
0.6996378, -1.39514, 2.328598, 0.627451, 0, 1, 1,
0.7010576, 1.012444, 1.702286, 0.6313726, 0, 1, 1,
0.701308, 0.961541, 0.7845544, 0.6392157, 0, 1, 1,
0.7017807, 0.06830008, 2.931632, 0.6431373, 0, 1, 1,
0.7024969, -0.6392516, 2.519158, 0.6509804, 0, 1, 1,
0.7044969, 0.3417759, 1.259773, 0.654902, 0, 1, 1,
0.7068691, -0.4668329, 1.76039, 0.6627451, 0, 1, 1,
0.711831, 0.3682617, 1.13387, 0.6666667, 0, 1, 1,
0.715354, -1.702877, 2.239837, 0.6745098, 0, 1, 1,
0.7297881, -0.3858982, 1.024193, 0.6784314, 0, 1, 1,
0.7354248, 0.6281803, 1.54613, 0.6862745, 0, 1, 1,
0.7403609, 0.7319898, 0.9453691, 0.6901961, 0, 1, 1,
0.7476223, -2.308382, 3.20635, 0.6980392, 0, 1, 1,
0.749494, 0.6355333, 0.9140766, 0.7058824, 0, 1, 1,
0.7496575, 0.09315418, 2.893463, 0.7098039, 0, 1, 1,
0.7526084, 1.061203, -0.02327906, 0.7176471, 0, 1, 1,
0.7535891, -0.8852028, 2.80056, 0.7215686, 0, 1, 1,
0.7582552, 0.1252578, 1.768369, 0.7294118, 0, 1, 1,
0.7587568, 1.827328, 0.6410675, 0.7333333, 0, 1, 1,
0.7685289, -0.1719502, 1.814973, 0.7411765, 0, 1, 1,
0.7692811, -0.5722883, -0.2704251, 0.7450981, 0, 1, 1,
0.7710277, -2.172077, 2.776477, 0.7529412, 0, 1, 1,
0.7775956, -0.8482749, 2.64348, 0.7568628, 0, 1, 1,
0.7804901, 1.196192, 2.107387, 0.7647059, 0, 1, 1,
0.7847484, 0.1480651, -0.2716532, 0.7686275, 0, 1, 1,
0.7862104, -1.441113, 3.064861, 0.7764706, 0, 1, 1,
0.7885997, -0.6787701, 1.333133, 0.7803922, 0, 1, 1,
0.7890887, 0.4203289, 1.706152, 0.7882353, 0, 1, 1,
0.7912191, -0.5765581, 2.4496, 0.7921569, 0, 1, 1,
0.7914055, 1.565889, 0.1831572, 0.8, 0, 1, 1,
0.7921891, -0.1725351, 2.815921, 0.8078431, 0, 1, 1,
0.7940498, -0.2706703, 1.832851, 0.8117647, 0, 1, 1,
0.8040235, 0.4368646, 1.441671, 0.8196079, 0, 1, 1,
0.811945, 1.026914, -0.677909, 0.8235294, 0, 1, 1,
0.8125114, -0.3905443, 1.715185, 0.8313726, 0, 1, 1,
0.8190507, 0.252015, 1.413789, 0.8352941, 0, 1, 1,
0.8224533, 2.089523, 0.2369747, 0.8431373, 0, 1, 1,
0.8224711, 0.5187775, 1.062389, 0.8470588, 0, 1, 1,
0.8310982, -0.3967376, 3.124318, 0.854902, 0, 1, 1,
0.8312368, -0.6544337, 0.3903449, 0.8588235, 0, 1, 1,
0.8360795, -0.2047565, 1.382236, 0.8666667, 0, 1, 1,
0.837954, 1.065333, 0.4327878, 0.8705882, 0, 1, 1,
0.8402017, 0.7550609, -1.046871, 0.8784314, 0, 1, 1,
0.844269, -1.667499, 2.844503, 0.8823529, 0, 1, 1,
0.8472787, -0.8594661, 3.039235, 0.8901961, 0, 1, 1,
0.8472814, 1.846515, 0.603274, 0.8941177, 0, 1, 1,
0.8479856, -0.712601, 1.547826, 0.9019608, 0, 1, 1,
0.850236, 0.1829237, 1.085344, 0.9098039, 0, 1, 1,
0.8513292, -1.465451, 2.629098, 0.9137255, 0, 1, 1,
0.8518711, 0.6734089, 1.83971, 0.9215686, 0, 1, 1,
0.8534119, -0.7403491, 1.320491, 0.9254902, 0, 1, 1,
0.8591017, 1.750986, 0.4179736, 0.9333333, 0, 1, 1,
0.8596287, -1.226284, 2.492387, 0.9372549, 0, 1, 1,
0.8656362, -1.259639, 2.609092, 0.945098, 0, 1, 1,
0.8685908, -0.4104033, 1.95947, 0.9490196, 0, 1, 1,
0.870121, 0.3196805, 1.01591, 0.9568627, 0, 1, 1,
0.8710623, 0.5364783, 2.401292, 0.9607843, 0, 1, 1,
0.8743641, 0.5155619, 1.631771, 0.9686275, 0, 1, 1,
0.8768791, 0.5746268, 2.571838, 0.972549, 0, 1, 1,
0.8778717, -0.3876276, 1.198487, 0.9803922, 0, 1, 1,
0.8803184, -0.542861, 2.137125, 0.9843137, 0, 1, 1,
0.8833092, 1.84798, 0.130717, 0.9921569, 0, 1, 1,
0.884658, 1.968305, 1.089822, 0.9960784, 0, 1, 1,
0.8885473, 2.068136, 0.1652521, 1, 0, 0.9960784, 1,
0.8891236, -0.1875301, 1.695018, 1, 0, 0.9882353, 1,
0.8929117, 0.4233295, 0.2715604, 1, 0, 0.9843137, 1,
0.8944002, 0.6165129, 0.09005833, 1, 0, 0.9764706, 1,
0.8988416, -0.04905418, 0.6197039, 1, 0, 0.972549, 1,
0.9055778, -0.6079443, 3.457551, 1, 0, 0.9647059, 1,
0.9072524, 2.440946, 0.539019, 1, 0, 0.9607843, 1,
0.9204042, 0.1418607, 1.202539, 1, 0, 0.9529412, 1,
0.9206571, -2.105769, 3.986722, 1, 0, 0.9490196, 1,
0.9222071, -0.2647412, 2.564734, 1, 0, 0.9411765, 1,
0.9265972, -0.7482054, 1.864585, 1, 0, 0.9372549, 1,
0.9324358, 0.740031, 0.5279169, 1, 0, 0.9294118, 1,
0.9345154, -0.4385606, 0.7556457, 1, 0, 0.9254902, 1,
0.9371862, -0.09199624, 0.9580053, 1, 0, 0.9176471, 1,
0.9373924, 2.003275, 0.1406123, 1, 0, 0.9137255, 1,
0.9390001, -1.990935, 2.722761, 1, 0, 0.9058824, 1,
0.941533, -0.3772754, 1.865902, 1, 0, 0.9019608, 1,
0.9452465, 0.1836735, 2.343635, 1, 0, 0.8941177, 1,
0.9488723, -2.155089, 3.298285, 1, 0, 0.8862745, 1,
0.9506788, 1.406781, -0.3886373, 1, 0, 0.8823529, 1,
0.9531456, -1.016304, 1.322551, 1, 0, 0.8745098, 1,
0.9540473, -2.426389, 2.509639, 1, 0, 0.8705882, 1,
0.9573618, 0.9052624, 0.3214593, 1, 0, 0.8627451, 1,
0.9575318, -0.2650789, 2.098751, 1, 0, 0.8588235, 1,
0.9646855, -1.271231, 3.240358, 1, 0, 0.8509804, 1,
0.9662259, 1.320092, 0.2701965, 1, 0, 0.8470588, 1,
0.9697821, -0.4258056, 0.8883254, 1, 0, 0.8392157, 1,
0.9716977, 0.5225216, -0.4239375, 1, 0, 0.8352941, 1,
0.9822571, 0.0660263, 0.2125985, 1, 0, 0.827451, 1,
0.9825892, -0.104222, 0.7253864, 1, 0, 0.8235294, 1,
0.9846648, 0.3514518, 0.8634531, 1, 0, 0.8156863, 1,
0.9874141, 0.9241959, 0.9179559, 1, 0, 0.8117647, 1,
0.988396, -1.754267, 1.360702, 1, 0, 0.8039216, 1,
0.9964069, -0.13885, 0.467434, 1, 0, 0.7960784, 1,
0.9997203, -0.6802442, 1.712394, 1, 0, 0.7921569, 1,
1.00009, 0.05514254, 1.857324, 1, 0, 0.7843137, 1,
1.004129, -0.275592, 2.643766, 1, 0, 0.7803922, 1,
1.008708, 0.9925826, 0.9468537, 1, 0, 0.772549, 1,
1.010382, -0.7641675, 1.535789, 1, 0, 0.7686275, 1,
1.019427, -1.032887, 3.232093, 1, 0, 0.7607843, 1,
1.02052, 0.8674456, 0.05436711, 1, 0, 0.7568628, 1,
1.023571, -1.179417, 2.99779, 1, 0, 0.7490196, 1,
1.02766, -1.35006, 1.760478, 1, 0, 0.7450981, 1,
1.031131, -0.6939827, 4.456147, 1, 0, 0.7372549, 1,
1.032944, -0.8243212, 1.254331, 1, 0, 0.7333333, 1,
1.033265, 0.1566437, 2.947983, 1, 0, 0.7254902, 1,
1.034254, 1.429942, -0.7850736, 1, 0, 0.7215686, 1,
1.037347, 2.192966, 0.6425655, 1, 0, 0.7137255, 1,
1.039112, 1.451045, 0.3342898, 1, 0, 0.7098039, 1,
1.044846, -0.7736804, 1.001647, 1, 0, 0.7019608, 1,
1.045771, -0.08745625, 2.488584, 1, 0, 0.6941177, 1,
1.047986, 2.370169, -0.6158191, 1, 0, 0.6901961, 1,
1.053, 0.5595339, 2.086899, 1, 0, 0.682353, 1,
1.057459, -0.09422413, 1.257, 1, 0, 0.6784314, 1,
1.058436, 0.7422911, 0.5185412, 1, 0, 0.6705883, 1,
1.073582, -0.4996958, 2.165994, 1, 0, 0.6666667, 1,
1.076466, -1.836236, 2.805876, 1, 0, 0.6588235, 1,
1.077531, -1.135196, 1.577516, 1, 0, 0.654902, 1,
1.087662, -0.00754809, 1.98215, 1, 0, 0.6470588, 1,
1.089456, -0.5317023, 0.7275771, 1, 0, 0.6431373, 1,
1.093472, -0.7871169, 5.72678, 1, 0, 0.6352941, 1,
1.095701, 0.9219674, 0.1798832, 1, 0, 0.6313726, 1,
1.101769, -1.679618, 2.422899, 1, 0, 0.6235294, 1,
1.102881, -0.8907206, 1.894096, 1, 0, 0.6196079, 1,
1.105329, 1.195599, -0.3788528, 1, 0, 0.6117647, 1,
1.111521, 3.361415, 0.752046, 1, 0, 0.6078432, 1,
1.114534, 0.1558712, 0.9924459, 1, 0, 0.6, 1,
1.119465, -0.1640728, 1.301529, 1, 0, 0.5921569, 1,
1.122598, 0.6613689, 3.747493, 1, 0, 0.5882353, 1,
1.124638, 0.1351722, -0.5629923, 1, 0, 0.5803922, 1,
1.130202, -0.9161361, 0.4742214, 1, 0, 0.5764706, 1,
1.130875, -0.06000835, 2.605816, 1, 0, 0.5686275, 1,
1.146089, -0.6562634, 1.830503, 1, 0, 0.5647059, 1,
1.152649, 0.9074427, 1.061575, 1, 0, 0.5568628, 1,
1.156195, 1.046117, 0.5025834, 1, 0, 0.5529412, 1,
1.160903, -0.1282322, 1.774697, 1, 0, 0.5450981, 1,
1.164584, 1.212656, 1.072648, 1, 0, 0.5411765, 1,
1.18316, -0.3632083, 2.206604, 1, 0, 0.5333334, 1,
1.185125, 0.8024564, 1.44396, 1, 0, 0.5294118, 1,
1.188451, -1.605932, 3.025667, 1, 0, 0.5215687, 1,
1.189152, 0.6798253, 2.058924, 1, 0, 0.5176471, 1,
1.191512, -0.3267205, 2.957166, 1, 0, 0.509804, 1,
1.204288, -0.7642101, 1.148716, 1, 0, 0.5058824, 1,
1.208609, -0.06162698, 1.447904, 1, 0, 0.4980392, 1,
1.212754, 0.5814747, 0.04491472, 1, 0, 0.4901961, 1,
1.221294, 0.2035717, 0.1364234, 1, 0, 0.4862745, 1,
1.223062, 1.075452, -0.4513429, 1, 0, 0.4784314, 1,
1.223624, -0.01860915, 0.3647314, 1, 0, 0.4745098, 1,
1.225611, -0.1721392, -0.6182649, 1, 0, 0.4666667, 1,
1.23059, 0.1798085, 2.45516, 1, 0, 0.4627451, 1,
1.232729, 0.2614701, 1.174367, 1, 0, 0.454902, 1,
1.259639, -0.1820026, 3.16893, 1, 0, 0.4509804, 1,
1.264422, 0.5576067, 1.066486, 1, 0, 0.4431373, 1,
1.28219, -0.3082214, 0.01110374, 1, 0, 0.4392157, 1,
1.290274, -1.124695, 3.037415, 1, 0, 0.4313726, 1,
1.293641, -1.67082, 0.7812233, 1, 0, 0.427451, 1,
1.297988, -0.9291216, 3.486017, 1, 0, 0.4196078, 1,
1.303815, 0.1362653, 0.4727543, 1, 0, 0.4156863, 1,
1.305966, 0.213392, -0.1613625, 1, 0, 0.4078431, 1,
1.310133, 0.07589683, 0.3617962, 1, 0, 0.4039216, 1,
1.361431, 1.176691, 0.1840693, 1, 0, 0.3960784, 1,
1.368696, 0.513974, 3.931242, 1, 0, 0.3882353, 1,
1.374142, -0.4581313, -0.4808739, 1, 0, 0.3843137, 1,
1.376437, -0.4070916, 2.342615, 1, 0, 0.3764706, 1,
1.381775, 0.661537, 0.9061143, 1, 0, 0.372549, 1,
1.396606, 1.54913, -0.4351062, 1, 0, 0.3647059, 1,
1.400002, -0.6639735, 2.238948, 1, 0, 0.3607843, 1,
1.423745, 2.818958, 0.8140759, 1, 0, 0.3529412, 1,
1.426222, -0.4109231, 1.888883, 1, 0, 0.3490196, 1,
1.428132, 1.390696, -0.4673988, 1, 0, 0.3411765, 1,
1.429126, -0.1412669, -1.347981, 1, 0, 0.3372549, 1,
1.440861, 0.043931, 0.5823466, 1, 0, 0.3294118, 1,
1.464489, -0.7559121, 3.431482, 1, 0, 0.3254902, 1,
1.481809, -1.358138, 1.129909, 1, 0, 0.3176471, 1,
1.486623, -0.6910648, 2.545506, 1, 0, 0.3137255, 1,
1.486956, 0.2011376, 1.762839, 1, 0, 0.3058824, 1,
1.49084, -1.417681, 3.517443, 1, 0, 0.2980392, 1,
1.507311, 0.3909334, 1.243678, 1, 0, 0.2941177, 1,
1.512656, 0.1622508, 1.113317, 1, 0, 0.2862745, 1,
1.523626, -0.2037465, 4.390461, 1, 0, 0.282353, 1,
1.524075, 0.9793725, 1.293304, 1, 0, 0.2745098, 1,
1.530811, 0.8078991, 3.381442, 1, 0, 0.2705882, 1,
1.540902, -0.6976803, -0.816582, 1, 0, 0.2627451, 1,
1.545638, 0.7430001, 1.206468, 1, 0, 0.2588235, 1,
1.561234, -0.6645678, 2.202713, 1, 0, 0.2509804, 1,
1.595632, 0.7913393, 0.9718702, 1, 0, 0.2470588, 1,
1.663419, -0.2510123, 2.401791, 1, 0, 0.2392157, 1,
1.669946, 0.009452133, 1.227916, 1, 0, 0.2352941, 1,
1.682168, 1.127545, -1.447497, 1, 0, 0.227451, 1,
1.685546, 0.2465862, 1.371173, 1, 0, 0.2235294, 1,
1.690289, 0.9851456, 0.6233237, 1, 0, 0.2156863, 1,
1.703423, 0.04493127, 1.489836, 1, 0, 0.2117647, 1,
1.715464, 1.260136, -0.3796894, 1, 0, 0.2039216, 1,
1.719191, -0.6296092, 2.29227, 1, 0, 0.1960784, 1,
1.731135, 0.9589906, 1.539904, 1, 0, 0.1921569, 1,
1.749584, -1.754215, 1.649644, 1, 0, 0.1843137, 1,
1.75449, 0.07597353, 3.064429, 1, 0, 0.1803922, 1,
1.762717, -1.326861, 4.540859, 1, 0, 0.172549, 1,
1.762929, 1.386975, 1.372796, 1, 0, 0.1686275, 1,
1.771396, -1.07513, 0.7475111, 1, 0, 0.1607843, 1,
1.774624, -1.382158, 1.452657, 1, 0, 0.1568628, 1,
1.775094, 0.1507202, 1.691352, 1, 0, 0.1490196, 1,
1.868235, -2.116175, 2.908896, 1, 0, 0.145098, 1,
1.893793, 0.5364071, 1.979568, 1, 0, 0.1372549, 1,
1.897434, -1.096056, 0.7192413, 1, 0, 0.1333333, 1,
1.897951, -0.114902, 1.298038, 1, 0, 0.1254902, 1,
1.932594, 0.7297051, 2.518078, 1, 0, 0.1215686, 1,
1.959154, 0.04041999, 4.004668, 1, 0, 0.1137255, 1,
1.960902, 0.7640468, 0.9097227, 1, 0, 0.1098039, 1,
1.962879, 0.465744, 0.6487949, 1, 0, 0.1019608, 1,
1.970719, -0.08275415, -1.3672, 1, 0, 0.09411765, 1,
2.005301, -0.989158, 2.297024, 1, 0, 0.09019608, 1,
2.034144, 0.7282299, 1.820563, 1, 0, 0.08235294, 1,
2.074228, -0.9630318, 3.037121, 1, 0, 0.07843138, 1,
2.132041, -0.9879344, 2.649758, 1, 0, 0.07058824, 1,
2.1325, -0.4599315, 1.407965, 1, 0, 0.06666667, 1,
2.143738, 0.1735891, 0.8714027, 1, 0, 0.05882353, 1,
2.155795, -1.004865, 2.728513, 1, 0, 0.05490196, 1,
2.20636, 0.2114366, 2.384585, 1, 0, 0.04705882, 1,
2.220476, -0.02201478, 3.357171, 1, 0, 0.04313726, 1,
2.25907, 0.5942798, 1.296925, 1, 0, 0.03529412, 1,
2.305645, 0.04206231, 1.382268, 1, 0, 0.03137255, 1,
2.365054, -1.084526, 1.315892, 1, 0, 0.02352941, 1,
2.608455, -0.8623899, 2.557538, 1, 0, 0.01960784, 1,
3.0343, -0.2987772, 1.621191, 1, 0, 0.01176471, 1,
3.193118, -0.03656318, 1.976289, 1, 0, 0.007843138, 1
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
0.06989956, -4.130919, -7.203785, 0, -0.5, 0.5, 0.5,
0.06989956, -4.130919, -7.203785, 1, -0.5, 0.5, 0.5,
0.06989956, -4.130919, -7.203785, 1, 1.5, 0.5, 0.5,
0.06989956, -4.130919, -7.203785, 0, 1.5, 0.5, 0.5
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
-4.11209, 0.1581943, -7.203785, 0, -0.5, 0.5, 0.5,
-4.11209, 0.1581943, -7.203785, 1, -0.5, 0.5, 0.5,
-4.11209, 0.1581943, -7.203785, 1, 1.5, 0.5, 0.5,
-4.11209, 0.1581943, -7.203785, 0, 1.5, 0.5, 0.5
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
-4.11209, -4.130919, 0.198535, 0, -0.5, 0.5, 0.5,
-4.11209, -4.130919, 0.198535, 1, -0.5, 0.5, 0.5,
-4.11209, -4.130919, 0.198535, 1, 1.5, 0.5, 0.5,
-4.11209, -4.130919, 0.198535, 0, 1.5, 0.5, 0.5
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
-3, -3.141123, -5.495557,
3, -3.141123, -5.495557,
-3, -3.141123, -5.495557,
-3, -3.306089, -5.780262,
-2, -3.141123, -5.495557,
-2, -3.306089, -5.780262,
-1, -3.141123, -5.495557,
-1, -3.306089, -5.780262,
0, -3.141123, -5.495557,
0, -3.306089, -5.780262,
1, -3.141123, -5.495557,
1, -3.306089, -5.780262,
2, -3.141123, -5.495557,
2, -3.306089, -5.780262,
3, -3.141123, -5.495557,
3, -3.306089, -5.780262
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
-3, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
-3, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
-3, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
-3, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5,
-2, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
-2, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
-2, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
-2, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5,
-1, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
-1, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
-1, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
-1, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5,
0, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
0, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
0, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
0, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5,
1, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
1, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
1, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
1, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5,
2, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
2, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
2, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
2, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5,
3, -3.636021, -6.349671, 0, -0.5, 0.5, 0.5,
3, -3.636021, -6.349671, 1, -0.5, 0.5, 0.5,
3, -3.636021, -6.349671, 1, 1.5, 0.5, 0.5,
3, -3.636021, -6.349671, 0, 1.5, 0.5, 0.5
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
-3.147015, -3, -5.495557,
-3.147015, 3, -5.495557,
-3.147015, -3, -5.495557,
-3.307861, -3, -5.780262,
-3.147015, -2, -5.495557,
-3.307861, -2, -5.780262,
-3.147015, -1, -5.495557,
-3.307861, -1, -5.780262,
-3.147015, 0, -5.495557,
-3.307861, 0, -5.780262,
-3.147015, 1, -5.495557,
-3.307861, 1, -5.780262,
-3.147015, 2, -5.495557,
-3.307861, 2, -5.780262,
-3.147015, 3, -5.495557,
-3.307861, 3, -5.780262
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
-3.629553, -3, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, -3, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, -3, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, -3, -6.349671, 0, 1.5, 0.5, 0.5,
-3.629553, -2, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, -2, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, -2, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, -2, -6.349671, 0, 1.5, 0.5, 0.5,
-3.629553, -1, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, -1, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, -1, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, -1, -6.349671, 0, 1.5, 0.5, 0.5,
-3.629553, 0, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, 0, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, 0, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, 0, -6.349671, 0, 1.5, 0.5, 0.5,
-3.629553, 1, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, 1, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, 1, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, 1, -6.349671, 0, 1.5, 0.5, 0.5,
-3.629553, 2, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, 2, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, 2, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, 2, -6.349671, 0, 1.5, 0.5, 0.5,
-3.629553, 3, -6.349671, 0, -0.5, 0.5, 0.5,
-3.629553, 3, -6.349671, 1, -0.5, 0.5, 0.5,
-3.629553, 3, -6.349671, 1, 1.5, 0.5, 0.5,
-3.629553, 3, -6.349671, 0, 1.5, 0.5, 0.5
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
-3.147015, -3.141123, -4,
-3.147015, -3.141123, 4,
-3.147015, -3.141123, -4,
-3.307861, -3.306089, -4,
-3.147015, -3.141123, -2,
-3.307861, -3.306089, -2,
-3.147015, -3.141123, 0,
-3.307861, -3.306089, 0,
-3.147015, -3.141123, 2,
-3.307861, -3.306089, 2,
-3.147015, -3.141123, 4,
-3.307861, -3.306089, 4
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
-3.629553, -3.636021, -4, 0, -0.5, 0.5, 0.5,
-3.629553, -3.636021, -4, 1, -0.5, 0.5, 0.5,
-3.629553, -3.636021, -4, 1, 1.5, 0.5, 0.5,
-3.629553, -3.636021, -4, 0, 1.5, 0.5, 0.5,
-3.629553, -3.636021, -2, 0, -0.5, 0.5, 0.5,
-3.629553, -3.636021, -2, 1, -0.5, 0.5, 0.5,
-3.629553, -3.636021, -2, 1, 1.5, 0.5, 0.5,
-3.629553, -3.636021, -2, 0, 1.5, 0.5, 0.5,
-3.629553, -3.636021, 0, 0, -0.5, 0.5, 0.5,
-3.629553, -3.636021, 0, 1, -0.5, 0.5, 0.5,
-3.629553, -3.636021, 0, 1, 1.5, 0.5, 0.5,
-3.629553, -3.636021, 0, 0, 1.5, 0.5, 0.5,
-3.629553, -3.636021, 2, 0, -0.5, 0.5, 0.5,
-3.629553, -3.636021, 2, 1, -0.5, 0.5, 0.5,
-3.629553, -3.636021, 2, 1, 1.5, 0.5, 0.5,
-3.629553, -3.636021, 2, 0, 1.5, 0.5, 0.5,
-3.629553, -3.636021, 4, 0, -0.5, 0.5, 0.5,
-3.629553, -3.636021, 4, 1, -0.5, 0.5, 0.5,
-3.629553, -3.636021, 4, 1, 1.5, 0.5, 0.5,
-3.629553, -3.636021, 4, 0, 1.5, 0.5, 0.5
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
-3.147015, -3.141123, -5.495557,
-3.147015, 3.457512, -5.495557,
-3.147015, -3.141123, 5.892627,
-3.147015, 3.457512, 5.892627,
-3.147015, -3.141123, -5.495557,
-3.147015, -3.141123, 5.892627,
-3.147015, 3.457512, -5.495557,
-3.147015, 3.457512, 5.892627,
-3.147015, -3.141123, -5.495557,
3.286814, -3.141123, -5.495557,
-3.147015, -3.141123, 5.892627,
3.286814, -3.141123, 5.892627,
-3.147015, 3.457512, -5.495557,
3.286814, 3.457512, -5.495557,
-3.147015, 3.457512, 5.892627,
3.286814, 3.457512, 5.892627,
3.286814, -3.141123, -5.495557,
3.286814, 3.457512, -5.495557,
3.286814, -3.141123, 5.892627,
3.286814, 3.457512, 5.892627,
3.286814, -3.141123, -5.495557,
3.286814, -3.141123, 5.892627,
3.286814, 3.457512, -5.495557,
3.286814, 3.457512, 5.892627
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
var radius = 7.822896;
var distance = 34.80494;
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
mvMatrix.translate( -0.06989956, -0.1581943, -0.198535 );
mvMatrix.scale( 1.314655, 1.281821, 0.7427231 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80494);
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
carbonylaminosulfony<-read.table("carbonylaminosulfony.xyz")
```

```
## Error in read.table("carbonylaminosulfony.xyz"): no lines available in input
```

```r
x<-carbonylaminosulfony$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbonylaminosulfony' not found
```

```r
y<-carbonylaminosulfony$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbonylaminosulfony' not found
```

```r
z<-carbonylaminosulfony$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbonylaminosulfony' not found
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
-3.053319, 2.007806, -0.5894912, 0, 0, 1, 1, 1,
-2.944674, 0.8119079, -2.246692, 1, 0, 0, 1, 1,
-2.862937, 2.195136, 0.1877914, 1, 0, 0, 1, 1,
-2.828622, -0.3464039, -0.3218759, 1, 0, 0, 1, 1,
-2.807182, -0.008801402, -0.9439039, 1, 0, 0, 1, 1,
-2.643315, -3.045027, -0.7347139, 1, 0, 0, 1, 1,
-2.610009, -0.7838848, -2.797264, 0, 0, 0, 1, 1,
-2.479614, 0.4553002, -3.000123, 0, 0, 0, 1, 1,
-2.349501, -1.134468, -2.711013, 0, 0, 0, 1, 1,
-2.323488, 0.578667, -2.61968, 0, 0, 0, 1, 1,
-2.322362, 0.2684768, -0.7762768, 0, 0, 0, 1, 1,
-2.301316, -1.211177, -2.045649, 0, 0, 0, 1, 1,
-2.267209, -0.5501631, -1.380394, 0, 0, 0, 1, 1,
-2.260792, -0.8457429, 0.9588526, 1, 1, 1, 1, 1,
-2.25755, 0.5132365, -1.147419, 1, 1, 1, 1, 1,
-2.188473, -1.236443, -0.3398349, 1, 1, 1, 1, 1,
-2.086915, -2.230348, -2.98052, 1, 1, 1, 1, 1,
-2.032417, 1.204564, -0.7137237, 1, 1, 1, 1, 1,
-2.020274, 0.3992433, -0.9315988, 1, 1, 1, 1, 1,
-2.007188, 0.4483671, -2.086769, 1, 1, 1, 1, 1,
-1.99242, -0.08456413, -1.462031, 1, 1, 1, 1, 1,
-1.988363, 0.3702354, -2.553955, 1, 1, 1, 1, 1,
-1.987133, -0.07564599, -2.530714, 1, 1, 1, 1, 1,
-1.971862, -0.8986483, -4.020563, 1, 1, 1, 1, 1,
-1.963502, 0.2007818, 1.050756, 1, 1, 1, 1, 1,
-1.934941, 1.531775, -1.043643, 1, 1, 1, 1, 1,
-1.924073, -0.6331794, -1.250799, 1, 1, 1, 1, 1,
-1.879791, -1.146159, -1.183274, 1, 1, 1, 1, 1,
-1.868286, -1.198558, -1.306749, 0, 0, 1, 1, 1,
-1.862407, -1.556818, -2.101743, 1, 0, 0, 1, 1,
-1.858229, -1.48175, -1.628497, 1, 0, 0, 1, 1,
-1.846277, 0.5833257, -0.1722678, 1, 0, 0, 1, 1,
-1.831825, -0.6857176, -0.9193752, 1, 0, 0, 1, 1,
-1.827053, -1.020771, -1.884121, 1, 0, 0, 1, 1,
-1.801996, -0.0366069, -1.59998, 0, 0, 0, 1, 1,
-1.800411, 0.2220548, 0.7204542, 0, 0, 0, 1, 1,
-1.79702, 0.8599444, -2.98291, 0, 0, 0, 1, 1,
-1.765606, -1.51558, -0.8013906, 0, 0, 0, 1, 1,
-1.761286, 0.3841917, -1.640057, 0, 0, 0, 1, 1,
-1.754897, 0.8404996, -0.8055631, 0, 0, 0, 1, 1,
-1.749386, 0.006118654, -1.009319, 0, 0, 0, 1, 1,
-1.73971, 0.150333, -1.246812, 1, 1, 1, 1, 1,
-1.73772, -0.4326781, -3.364902, 1, 1, 1, 1, 1,
-1.723835, -0.3592878, -3.259983, 1, 1, 1, 1, 1,
-1.721403, 0.7435085, -1.164362, 1, 1, 1, 1, 1,
-1.719956, -0.1372483, -1.82955, 1, 1, 1, 1, 1,
-1.717938, -0.9990963, -0.8354856, 1, 1, 1, 1, 1,
-1.710708, -1.265891, -1.203579, 1, 1, 1, 1, 1,
-1.70201, 0.8389154, -1.701041, 1, 1, 1, 1, 1,
-1.701957, 0.1775874, -0.7216607, 1, 1, 1, 1, 1,
-1.655284, 1.484927, 0.7352283, 1, 1, 1, 1, 1,
-1.65128, 0.03331802, -3.070433, 1, 1, 1, 1, 1,
-1.646348, -0.7752938, -2.479448, 1, 1, 1, 1, 1,
-1.640839, 1.173303, 0.06935392, 1, 1, 1, 1, 1,
-1.640041, 0.2561605, -1.749415, 1, 1, 1, 1, 1,
-1.631219, 0.0148271, -1.540475, 1, 1, 1, 1, 1,
-1.606308, -0.9682249, -1.154793, 0, 0, 1, 1, 1,
-1.602095, 0.5006993, -2.336054, 1, 0, 0, 1, 1,
-1.600324, -0.9254084, 0.2278756, 1, 0, 0, 1, 1,
-1.591248, 1.159795, 0.2685979, 1, 0, 0, 1, 1,
-1.589366, -0.1183737, -0.5485684, 1, 0, 0, 1, 1,
-1.58295, -0.4070165, 0.2531275, 1, 0, 0, 1, 1,
-1.576294, 1.218669, 0.1740925, 0, 0, 0, 1, 1,
-1.575643, 0.8363619, -2.039819, 0, 0, 0, 1, 1,
-1.538572, -1.099561, -2.874255, 0, 0, 0, 1, 1,
-1.536226, 1.031951, -0.2523524, 0, 0, 0, 1, 1,
-1.533068, 0.04852545, -1.642604, 0, 0, 0, 1, 1,
-1.53228, 0.6416939, -0.9008709, 0, 0, 0, 1, 1,
-1.529804, 1.337953, -0.7710962, 0, 0, 0, 1, 1,
-1.514534, 1.197634, -0.8910052, 1, 1, 1, 1, 1,
-1.504201, -0.2606116, -3.081343, 1, 1, 1, 1, 1,
-1.499919, -0.3652742, -1.624611, 1, 1, 1, 1, 1,
-1.487782, 0.7401203, -0.8713464, 1, 1, 1, 1, 1,
-1.487449, -0.9190878, -3.393098, 1, 1, 1, 1, 1,
-1.486551, -2.272737, -1.626998, 1, 1, 1, 1, 1,
-1.479305, 0.7370486, -1.32381, 1, 1, 1, 1, 1,
-1.435989, 1.106443, 0.00819017, 1, 1, 1, 1, 1,
-1.417618, -0.2671612, -1.303164, 1, 1, 1, 1, 1,
-1.408131, 0.2688528, -1.493683, 1, 1, 1, 1, 1,
-1.400551, 0.6126361, -0.1185421, 1, 1, 1, 1, 1,
-1.394532, -1.333296, -2.464241, 1, 1, 1, 1, 1,
-1.392129, 0.4183642, -2.40202, 1, 1, 1, 1, 1,
-1.384075, -0.4379597, -2.891008, 1, 1, 1, 1, 1,
-1.380538, -0.5006868, -1.730265, 1, 1, 1, 1, 1,
-1.375966, 0.2408487, -0.932922, 0, 0, 1, 1, 1,
-1.361491, -0.05264908, 0.01619835, 1, 0, 0, 1, 1,
-1.360166, -0.4491022, -2.125946, 1, 0, 0, 1, 1,
-1.359238, -0.160752, -1.596857, 1, 0, 0, 1, 1,
-1.356059, 0.1062382, -1.625744, 1, 0, 0, 1, 1,
-1.344075, 0.139328, -0.8434027, 1, 0, 0, 1, 1,
-1.322725, -0.3876331, -2.238288, 0, 0, 0, 1, 1,
-1.322217, 1.338311, -3.078705, 0, 0, 0, 1, 1,
-1.318783, -0.1739407, -2.044424, 0, 0, 0, 1, 1,
-1.31776, -0.5856092, -2.425357, 0, 0, 0, 1, 1,
-1.312956, -0.6251602, -2.081738, 0, 0, 0, 1, 1,
-1.312307, 0.9697552, -0.9497002, 0, 0, 0, 1, 1,
-1.311287, -0.4466375, -2.134417, 0, 0, 0, 1, 1,
-1.308198, -0.3820639, -2.705353, 1, 1, 1, 1, 1,
-1.305897, 0.1590516, -2.743629, 1, 1, 1, 1, 1,
-1.303586, 0.900454, -2.681765, 1, 1, 1, 1, 1,
-1.293076, -0.2856971, -1.776832, 1, 1, 1, 1, 1,
-1.29129, -0.8227794, -2.458507, 1, 1, 1, 1, 1,
-1.291105, 0.5168357, -0.541261, 1, 1, 1, 1, 1,
-1.288841, 0.07543531, -3.163599, 1, 1, 1, 1, 1,
-1.28039, 1.644542, -2.505193, 1, 1, 1, 1, 1,
-1.27979, 0.121224, -1.501642, 1, 1, 1, 1, 1,
-1.277863, -1.238732, -2.222067, 1, 1, 1, 1, 1,
-1.270166, -0.6086636, -1.598614, 1, 1, 1, 1, 1,
-1.264251, 0.1705603, -5.133186, 1, 1, 1, 1, 1,
-1.255612, -0.8436896, -2.487672, 1, 1, 1, 1, 1,
-1.253318, -1.406212, -0.8541378, 1, 1, 1, 1, 1,
-1.253179, 0.01689798, -0.8119828, 1, 1, 1, 1, 1,
-1.25102, -1.542226, -3.942316, 0, 0, 1, 1, 1,
-1.23737, -0.006444531, -2.928785, 1, 0, 0, 1, 1,
-1.237311, 0.8788069, 0.1050867, 1, 0, 0, 1, 1,
-1.229554, 0.7821609, -2.078564, 1, 0, 0, 1, 1,
-1.225273, -0.268213, -0.9596445, 1, 0, 0, 1, 1,
-1.213833, 1.836206, -0.3904113, 1, 0, 0, 1, 1,
-1.213003, -0.2423645, -2.913173, 0, 0, 0, 1, 1,
-1.210556, 2.144375, -0.5346356, 0, 0, 0, 1, 1,
-1.20653, 0.5821791, -1.932801, 0, 0, 0, 1, 1,
-1.205582, -0.7260869, -1.655584, 0, 0, 0, 1, 1,
-1.19033, -0.4795362, -1.303801, 0, 0, 0, 1, 1,
-1.17996, 0.01875837, -3.948192, 0, 0, 0, 1, 1,
-1.171792, 1.202232, -0.5799894, 0, 0, 0, 1, 1,
-1.167323, -0.1658883, -2.994904, 1, 1, 1, 1, 1,
-1.1608, 0.8102115, -2.030395, 1, 1, 1, 1, 1,
-1.159005, 0.06706452, -0.07736652, 1, 1, 1, 1, 1,
-1.149658, 0.9972807, -0.4120556, 1, 1, 1, 1, 1,
-1.143514, 0.8590099, -0.733717, 1, 1, 1, 1, 1,
-1.14259, 0.4210254, 2.344754, 1, 1, 1, 1, 1,
-1.131754, 0.0007901088, -1.754276, 1, 1, 1, 1, 1,
-1.131035, -1.166752, -3.873808, 1, 1, 1, 1, 1,
-1.130856, -0.8709405, -1.604844, 1, 1, 1, 1, 1,
-1.13046, -1.022206, -3.623051, 1, 1, 1, 1, 1,
-1.124708, 2.169641, -0.6104432, 1, 1, 1, 1, 1,
-1.120188, 2.869205, -0.1009121, 1, 1, 1, 1, 1,
-1.116187, -0.7206016, -2.859897, 1, 1, 1, 1, 1,
-1.112805, 3.126918, -0.08731498, 1, 1, 1, 1, 1,
-1.111264, -0.9277946, -3.446903, 1, 1, 1, 1, 1,
-1.10932, 2.210819, -0.558333, 0, 0, 1, 1, 1,
-1.107433, -1.45614, -1.701154, 1, 0, 0, 1, 1,
-1.102005, -1.946626, -1.803486, 1, 0, 0, 1, 1,
-1.097732, -0.2690504, -0.05690664, 1, 0, 0, 1, 1,
-1.085558, 0.7270438, 0.439857, 1, 0, 0, 1, 1,
-1.082553, -1.568947, -2.209226, 1, 0, 0, 1, 1,
-1.07135, 1.780769, -0.3735339, 0, 0, 0, 1, 1,
-1.067646, 0.1783966, -1.865813, 0, 0, 0, 1, 1,
-1.062815, -1.130741, -2.549597, 0, 0, 0, 1, 1,
-1.062351, 2.196667, 0.9723163, 0, 0, 0, 1, 1,
-1.05529, 1.167877, -1.534871, 0, 0, 0, 1, 1,
-1.052048, -2.169851, -2.576909, 0, 0, 0, 1, 1,
-1.046907, 0.1692093, -1.811862, 0, 0, 0, 1, 1,
-1.032317, 0.9782065, -1.727595, 1, 1, 1, 1, 1,
-1.030955, -0.3771826, -2.490348, 1, 1, 1, 1, 1,
-1.021107, -0.5126663, -2.057933, 1, 1, 1, 1, 1,
-1.00789, 0.2710961, -2.787516, 1, 1, 1, 1, 1,
-1.007817, -0.617157, -3.509007, 1, 1, 1, 1, 1,
-1.005021, -0.541913, -2.098742, 1, 1, 1, 1, 1,
-1.001619, 2.000393, -1.593109, 1, 1, 1, 1, 1,
-1.001528, 1.265672, -1.648885, 1, 1, 1, 1, 1,
-0.9912381, 1.839267, 0.9643424, 1, 1, 1, 1, 1,
-0.9905153, -1.091943, -2.636118, 1, 1, 1, 1, 1,
-0.989708, 2.026502, 1.198701, 1, 1, 1, 1, 1,
-0.9593868, 1.066904, -1.253159, 1, 1, 1, 1, 1,
-0.9591353, -0.531919, -1.645983, 1, 1, 1, 1, 1,
-0.9585463, 0.3180576, -2.447179, 1, 1, 1, 1, 1,
-0.9545949, -1.119188, -2.231967, 1, 1, 1, 1, 1,
-0.9526789, -0.6767243, -4.026245, 0, 0, 1, 1, 1,
-0.9508743, -1.933724, -2.359153, 1, 0, 0, 1, 1,
-0.9432822, 0.6374997, -2.036075, 1, 0, 0, 1, 1,
-0.9417084, 1.263307, -0.4883369, 1, 0, 0, 1, 1,
-0.9413289, 1.739228, -1.3765, 1, 0, 0, 1, 1,
-0.9398317, 0.8079559, -1.027263, 1, 0, 0, 1, 1,
-0.9384401, -0.191895, -0.7378936, 0, 0, 0, 1, 1,
-0.9355813, -1.779973, -2.59771, 0, 0, 0, 1, 1,
-0.9336962, 0.1629832, -2.290004, 0, 0, 0, 1, 1,
-0.9309978, -1.833197, -3.269616, 0, 0, 0, 1, 1,
-0.9295034, 1.087119, -1.17135, 0, 0, 0, 1, 1,
-0.9288266, -1.392547, -2.230016, 0, 0, 0, 1, 1,
-0.9278712, 1.128289, -0.6873845, 0, 0, 0, 1, 1,
-0.9240546, 0.1375501, -2.485126, 1, 1, 1, 1, 1,
-0.9184926, -0.2446779, -2.52275, 1, 1, 1, 1, 1,
-0.9149164, 0.7722948, -0.4130594, 1, 1, 1, 1, 1,
-0.9146034, 1.004166, -0.2106989, 1, 1, 1, 1, 1,
-0.9139858, 0.779567, 0.1848816, 1, 1, 1, 1, 1,
-0.904617, -0.5211121, -4.611335, 1, 1, 1, 1, 1,
-0.9025145, -1.749866, -2.643435, 1, 1, 1, 1, 1,
-0.8870208, 0.246381, -1.420333, 1, 1, 1, 1, 1,
-0.8815404, -0.4870625, -2.29776, 1, 1, 1, 1, 1,
-0.8765805, -0.3621045, -2.512834, 1, 1, 1, 1, 1,
-0.8735429, -0.2075253, -4.640145, 1, 1, 1, 1, 1,
-0.866152, 0.2015701, -0.8923457, 1, 1, 1, 1, 1,
-0.8582063, -0.3911853, -1.402023, 1, 1, 1, 1, 1,
-0.8500445, 0.8580186, -1.926408, 1, 1, 1, 1, 1,
-0.8499119, -0.3097805, -2.234898, 1, 1, 1, 1, 1,
-0.8471484, -0.789301, -2.950389, 0, 0, 1, 1, 1,
-0.8465945, 1.331883, -1.377787, 1, 0, 0, 1, 1,
-0.8446434, 0.09461848, -2.727316, 1, 0, 0, 1, 1,
-0.8398961, 0.6315181, -0.7721424, 1, 0, 0, 1, 1,
-0.8344402, -0.4449848, -2.249158, 1, 0, 0, 1, 1,
-0.8342026, -1.056053, -3.796005, 1, 0, 0, 1, 1,
-0.8287144, -0.2878107, -0.7231646, 0, 0, 0, 1, 1,
-0.8285148, 0.815295, -0.4355907, 0, 0, 0, 1, 1,
-0.8282156, -1.651219, -2.723126, 0, 0, 0, 1, 1,
-0.8263523, -1.523587, -1.779822, 0, 0, 0, 1, 1,
-0.823353, 1.020789, 0.6378816, 0, 0, 0, 1, 1,
-0.8128433, 0.6371894, -1.086354, 0, 0, 0, 1, 1,
-0.8122846, 2.16867, -0.8884044, 0, 0, 0, 1, 1,
-0.8119392, 0.07767502, -1.552105, 1, 1, 1, 1, 1,
-0.8104711, 1.557984, 0.485489, 1, 1, 1, 1, 1,
-0.8078201, -0.4672984, -2.35137, 1, 1, 1, 1, 1,
-0.791779, 1.822741, -2.049445, 1, 1, 1, 1, 1,
-0.7916436, 0.2541374, -2.447666, 1, 1, 1, 1, 1,
-0.7879757, -0.1153207, -2.330404, 1, 1, 1, 1, 1,
-0.7857311, -0.3520683, -1.150675, 1, 1, 1, 1, 1,
-0.7820207, -1.849286, -3.457114, 1, 1, 1, 1, 1,
-0.7794805, -0.07582773, -1.128764, 1, 1, 1, 1, 1,
-0.770116, -0.9507103, -2.191674, 1, 1, 1, 1, 1,
-0.7697981, 0.4365269, 0.7593483, 1, 1, 1, 1, 1,
-0.7658101, 1.355631, -0.9568096, 1, 1, 1, 1, 1,
-0.7579609, -0.8214905, -3.534928, 1, 1, 1, 1, 1,
-0.7533035, -0.7719859, -1.441581, 1, 1, 1, 1, 1,
-0.7526402, -1.117059, -3.241625, 1, 1, 1, 1, 1,
-0.7499797, -0.7627022, -2.26405, 0, 0, 1, 1, 1,
-0.7466102, 1.856878, 0.301251, 1, 0, 0, 1, 1,
-0.7461112, 0.0003025457, -1.317669, 1, 0, 0, 1, 1,
-0.7443024, -0.2254818, -1.608193, 1, 0, 0, 1, 1,
-0.7429642, -0.1902559, -2.019862, 1, 0, 0, 1, 1,
-0.7404981, -0.06964834, -2.500992, 1, 0, 0, 1, 1,
-0.7363803, -0.5659291, -2.193217, 0, 0, 0, 1, 1,
-0.7360425, 0.5236049, -1.715385, 0, 0, 0, 1, 1,
-0.7359427, 0.04041232, -1.497778, 0, 0, 0, 1, 1,
-0.7344289, -0.8107404, -2.947349, 0, 0, 0, 1, 1,
-0.7137794, 1.492967, -0.9942807, 0, 0, 0, 1, 1,
-0.7119099, -0.01814954, -1.041945, 0, 0, 0, 1, 1,
-0.7095789, -0.2731822, -3.20981, 0, 0, 0, 1, 1,
-0.7074891, -2.113515, -2.52369, 1, 1, 1, 1, 1,
-0.7069976, 0.4768313, -3.167505, 1, 1, 1, 1, 1,
-0.7051181, -0.4989547, -1.091955, 1, 1, 1, 1, 1,
-0.7043666, -0.5690662, -2.354509, 1, 1, 1, 1, 1,
-0.702574, 0.3543194, -0.6342706, 1, 1, 1, 1, 1,
-0.7020829, -1.18156, -2.408937, 1, 1, 1, 1, 1,
-0.7009079, -0.9296617, -2.166912, 1, 1, 1, 1, 1,
-0.694941, -1.190005, -3.362856, 1, 1, 1, 1, 1,
-0.6941427, -2.022267, -5.32971, 1, 1, 1, 1, 1,
-0.6926741, 0.1511596, -1.48401, 1, 1, 1, 1, 1,
-0.692629, 1.098329, -0.4273333, 1, 1, 1, 1, 1,
-0.6880279, -0.7231347, -2.267852, 1, 1, 1, 1, 1,
-0.6869305, -1.312208, -4.428049, 1, 1, 1, 1, 1,
-0.6794139, -1.442943, -1.837373, 1, 1, 1, 1, 1,
-0.6752654, 0.05320978, -2.170468, 1, 1, 1, 1, 1,
-0.6604028, -1.628583, -3.613071, 0, 0, 1, 1, 1,
-0.6597388, -0.4726124, -1.23426, 1, 0, 0, 1, 1,
-0.6581107, 0.3011659, -2.940489, 1, 0, 0, 1, 1,
-0.6564001, 0.6222792, -0.4317575, 1, 0, 0, 1, 1,
-0.6554282, -0.7943482, -3.057142, 1, 0, 0, 1, 1,
-0.654346, -0.3403377, -2.040655, 1, 0, 0, 1, 1,
-0.6522218, -0.4663827, -0.07071, 0, 0, 0, 1, 1,
-0.6500518, -0.3972965, -1.661607, 0, 0, 0, 1, 1,
-0.6469707, -1.716648, -3.670403, 0, 0, 0, 1, 1,
-0.6460655, 0.7030195, 0.5997192, 0, 0, 0, 1, 1,
-0.6429443, 0.3937574, 1.162009, 0, 0, 0, 1, 1,
-0.641971, -0.5774922, -1.474946, 0, 0, 0, 1, 1,
-0.6400105, 1.524141, 0.05380528, 0, 0, 0, 1, 1,
-0.6366376, 0.7299761, -0.9951146, 1, 1, 1, 1, 1,
-0.6325527, -1.519704, -2.558419, 1, 1, 1, 1, 1,
-0.6318915, -1.683578, -2.269336, 1, 1, 1, 1, 1,
-0.6183275, -1.466432, -3.531315, 1, 1, 1, 1, 1,
-0.616296, -1.324677, -4.150497, 1, 1, 1, 1, 1,
-0.6158072, -0.1254644, -1.031889, 1, 1, 1, 1, 1,
-0.6135626, -0.2933106, -1.773421, 1, 1, 1, 1, 1,
-0.6105791, -0.1924134, -2.01799, 1, 1, 1, 1, 1,
-0.6101385, -0.08458517, -1.408139, 1, 1, 1, 1, 1,
-0.5994273, 1.772093, -0.7667237, 1, 1, 1, 1, 1,
-0.5946299, -0.8378469, -2.053932, 1, 1, 1, 1, 1,
-0.5929276, 0.8291274, -0.6108714, 1, 1, 1, 1, 1,
-0.5809869, -0.7501063, -1.451806, 1, 1, 1, 1, 1,
-0.5792087, 0.2786628, -1.010934, 1, 1, 1, 1, 1,
-0.5776363, 0.4739803, -1.905794, 1, 1, 1, 1, 1,
-0.5740529, 0.4453661, -1.312708, 0, 0, 1, 1, 1,
-0.5736927, -1.063362, -2.869871, 1, 0, 0, 1, 1,
-0.5685173, -0.4534256, -2.216022, 1, 0, 0, 1, 1,
-0.566372, 0.1475764, -2.188353, 1, 0, 0, 1, 1,
-0.5657606, 1.273746, -2.460979, 1, 0, 0, 1, 1,
-0.5584489, -1.018629, -3.50785, 1, 0, 0, 1, 1,
-0.5536178, -1.198842, -3.874717, 0, 0, 0, 1, 1,
-0.5518348, -0.08222224, -2.488045, 0, 0, 0, 1, 1,
-0.5472268, -0.2458554, -2.360645, 0, 0, 0, 1, 1,
-0.5471641, -0.4123398, -2.23418, 0, 0, 0, 1, 1,
-0.5467136, 0.7430472, -0.8540675, 0, 0, 0, 1, 1,
-0.5465275, 0.05675116, -1.822942, 0, 0, 0, 1, 1,
-0.5392011, 1.534531, -1.241369, 0, 0, 0, 1, 1,
-0.5367638, 1.189425, -0.5149847, 1, 1, 1, 1, 1,
-0.5362208, -1.568211, -4.171203, 1, 1, 1, 1, 1,
-0.5328004, 1.792017, -1.398104, 1, 1, 1, 1, 1,
-0.5322867, -0.9147059, -3.557478, 1, 1, 1, 1, 1,
-0.5308859, -0.4514474, -0.768743, 1, 1, 1, 1, 1,
-0.5249524, -0.7924517, -3.088512, 1, 1, 1, 1, 1,
-0.5222052, -0.2219329, -1.949093, 1, 1, 1, 1, 1,
-0.5206919, 1.476045, 0.6533076, 1, 1, 1, 1, 1,
-0.5111594, -0.4148097, -2.106976, 1, 1, 1, 1, 1,
-0.5081064, 0.9763605, -0.7522555, 1, 1, 1, 1, 1,
-0.5064501, -1.308374, -4.969921, 1, 1, 1, 1, 1,
-0.5054517, 0.9481796, -0.7434487, 1, 1, 1, 1, 1,
-0.5020859, 0.1563748, -0.7481407, 1, 1, 1, 1, 1,
-0.4954172, -0.2910319, -3.182522, 1, 1, 1, 1, 1,
-0.4925833, 0.3748354, -1.732349, 1, 1, 1, 1, 1,
-0.4903743, -0.9629956, -3.493583, 0, 0, 1, 1, 1,
-0.4869487, -1.716388, -3.232182, 1, 0, 0, 1, 1,
-0.4846671, -0.02259311, -2.439331, 1, 0, 0, 1, 1,
-0.4809421, -0.2185919, -2.065351, 1, 0, 0, 1, 1,
-0.4793541, -0.2179515, -1.852109, 1, 0, 0, 1, 1,
-0.476191, 1.640878, -0.6085761, 1, 0, 0, 1, 1,
-0.4754239, 0.4378819, -0.499198, 0, 0, 0, 1, 1,
-0.4701497, -0.1949456, -3.812004, 0, 0, 0, 1, 1,
-0.463909, -0.7179669, -3.339677, 0, 0, 0, 1, 1,
-0.4637854, 1.331054, -1.178389, 0, 0, 0, 1, 1,
-0.4635582, -0.8383765, -2.848669, 0, 0, 0, 1, 1,
-0.4614103, -0.2963523, -2.738776, 0, 0, 0, 1, 1,
-0.4574486, -1.141847, -3.22183, 0, 0, 0, 1, 1,
-0.4540921, 0.3608007, -1.77795, 1, 1, 1, 1, 1,
-0.4537058, -0.1846089, -0.2219736, 1, 1, 1, 1, 1,
-0.4515808, -2.25962, -3.282469, 1, 1, 1, 1, 1,
-0.4484853, -1.683864, -2.708792, 1, 1, 1, 1, 1,
-0.4460973, 1.576223, 1.68541, 1, 1, 1, 1, 1,
-0.4460509, 0.8634032, 0.5962803, 1, 1, 1, 1, 1,
-0.4442103, -0.5624568, -3.068747, 1, 1, 1, 1, 1,
-0.4427459, 0.6931345, -1.222171, 1, 1, 1, 1, 1,
-0.4418934, 0.5692962, -0.4885252, 1, 1, 1, 1, 1,
-0.4370266, -0.7979077, -2.589042, 1, 1, 1, 1, 1,
-0.4320071, 0.6465431, -0.1962536, 1, 1, 1, 1, 1,
-0.425711, 0.7879748, -1.051753, 1, 1, 1, 1, 1,
-0.4235735, -1.175231, -1.939108, 1, 1, 1, 1, 1,
-0.4233938, 0.5752466, -1.456482, 1, 1, 1, 1, 1,
-0.4221575, -2.509152, -2.33386, 1, 1, 1, 1, 1,
-0.420844, -0.3813043, -0.8847448, 0, 0, 1, 1, 1,
-0.4193353, -0.2625445, -3.730482, 1, 0, 0, 1, 1,
-0.406088, 0.4334351, -1.125363, 1, 0, 0, 1, 1,
-0.4054061, -0.7093785, -2.661408, 1, 0, 0, 1, 1,
-0.4030647, 0.5143023, -0.9946386, 1, 0, 0, 1, 1,
-0.402185, -0.2711354, -2.619648, 1, 0, 0, 1, 1,
-0.3946076, 0.9471019, 0.3471196, 0, 0, 0, 1, 1,
-0.3876936, -0.6415488, -1.814859, 0, 0, 0, 1, 1,
-0.385572, 0.4750338, -1.711481, 0, 0, 0, 1, 1,
-0.3806267, -0.7002949, -1.46822, 0, 0, 0, 1, 1,
-0.3754256, 1.559258, -1.214758, 0, 0, 0, 1, 1,
-0.3726561, 0.1951432, -0.856104, 0, 0, 0, 1, 1,
-0.3705001, 0.8513152, -1.099802, 0, 0, 0, 1, 1,
-0.3671251, -0.04421879, -1.915241, 1, 1, 1, 1, 1,
-0.3538999, 0.4042117, -1.756429, 1, 1, 1, 1, 1,
-0.3521169, -0.6740797, -2.269615, 1, 1, 1, 1, 1,
-0.3507337, 0.4163409, -2.149182, 1, 1, 1, 1, 1,
-0.349833, -1.295537, -2.419666, 1, 1, 1, 1, 1,
-0.3497287, -0.9224666, -2.149364, 1, 1, 1, 1, 1,
-0.3489773, -0.5041882, -4.170613, 1, 1, 1, 1, 1,
-0.3474266, 1.342538, -1.560179, 1, 1, 1, 1, 1,
-0.3452538, 0.1067086, -3.236247, 1, 1, 1, 1, 1,
-0.3412831, -0.1143064, -1.815372, 1, 1, 1, 1, 1,
-0.3401679, 1.099974, -1.210359, 1, 1, 1, 1, 1,
-0.3365504, 0.3309522, -1.522413, 1, 1, 1, 1, 1,
-0.3362112, 1.838895, -0.6702938, 1, 1, 1, 1, 1,
-0.3357217, 0.1998942, -0.4949526, 1, 1, 1, 1, 1,
-0.3337648, 1.72218, -0.1330421, 1, 1, 1, 1, 1,
-0.3329518, 0.4127878, -1.650478, 0, 0, 1, 1, 1,
-0.3308422, 1.141833, 0.06917779, 1, 0, 0, 1, 1,
-0.3281961, 0.03204593, -0.2311794, 1, 0, 0, 1, 1,
-0.3279802, -1.212423, -2.390072, 1, 0, 0, 1, 1,
-0.3273457, -0.3412197, -0.7226326, 1, 0, 0, 1, 1,
-0.3250935, 0.9391013, -1.785643, 1, 0, 0, 1, 1,
-0.3250184, -1.791017, -2.762636, 0, 0, 0, 1, 1,
-0.3249591, -0.3412966, -2.862877, 0, 0, 0, 1, 1,
-0.32022, 0.1715597, -1.385621, 0, 0, 0, 1, 1,
-0.3200182, -0.6483527, -3.057355, 0, 0, 0, 1, 1,
-0.3191844, -0.4197172, -1.150919, 0, 0, 0, 1, 1,
-0.3169009, 1.919541, -0.9679912, 0, 0, 0, 1, 1,
-0.3165579, 1.056454, -1.365955, 0, 0, 0, 1, 1,
-0.3139457, 2.876198, 0.02477931, 1, 1, 1, 1, 1,
-0.3132592, 0.5669357, -0.4922745, 1, 1, 1, 1, 1,
-0.3111587, -1.000132, -4.304487, 1, 1, 1, 1, 1,
-0.3063088, -0.3273549, -3.451357, 1, 1, 1, 1, 1,
-0.3035185, -0.9402893, -4.704688, 1, 1, 1, 1, 1,
-0.2989599, -0.4671778, -1.187233, 1, 1, 1, 1, 1,
-0.2976856, -0.9710631, -3.324814, 1, 1, 1, 1, 1,
-0.2970245, 1.292256, -1.180805, 1, 1, 1, 1, 1,
-0.2943591, 1.333897, -1.330409, 1, 1, 1, 1, 1,
-0.2911418, -0.9267399, -2.700989, 1, 1, 1, 1, 1,
-0.2896581, 0.8940325, -1.466645, 1, 1, 1, 1, 1,
-0.2880094, -1.370409, -4.950395, 1, 1, 1, 1, 1,
-0.2744561, -0.2246467, -2.888484, 1, 1, 1, 1, 1,
-0.267474, -0.655713, -1.369961, 1, 1, 1, 1, 1,
-0.2668403, -1.44392, -2.644337, 1, 1, 1, 1, 1,
-0.2569661, 1.30925, 0.8022675, 0, 0, 1, 1, 1,
-0.2556175, -0.6392154, -2.797406, 1, 0, 0, 1, 1,
-0.2464127, -0.399335, -0.6030918, 1, 0, 0, 1, 1,
-0.2452514, 0.6279289, -1.512493, 1, 0, 0, 1, 1,
-0.2441333, 3.035303, -0.7387677, 1, 0, 0, 1, 1,
-0.2405979, -2.221244, -3.187912, 1, 0, 0, 1, 1,
-0.2376509, 2.620979, -0.4948063, 0, 0, 0, 1, 1,
-0.2371008, -0.690266, -2.263076, 0, 0, 0, 1, 1,
-0.2367997, 0.01416181, -2.658113, 0, 0, 0, 1, 1,
-0.2342777, 0.4573362, 1.955546, 0, 0, 0, 1, 1,
-0.2337431, -0.1256972, -1.814283, 0, 0, 0, 1, 1,
-0.2323172, 1.136236, -0.8989498, 0, 0, 0, 1, 1,
-0.2317328, 0.313076, -1.142148, 0, 0, 0, 1, 1,
-0.2308288, 0.4758184, 0.9857183, 1, 1, 1, 1, 1,
-0.2303099, 0.4625637, 0.9842295, 1, 1, 1, 1, 1,
-0.2302085, -1.577446, -2.361635, 1, 1, 1, 1, 1,
-0.2255696, -0.06331176, -1.551998, 1, 1, 1, 1, 1,
-0.2206796, 1.772607, -0.4064588, 1, 1, 1, 1, 1,
-0.2200402, 0.2988837, 1.137369, 1, 1, 1, 1, 1,
-0.2185381, -0.2684759, -1.507534, 1, 1, 1, 1, 1,
-0.2134287, 0.8984629, -0.8564528, 1, 1, 1, 1, 1,
-0.2105957, 0.3528018, 0.7557582, 1, 1, 1, 1, 1,
-0.21008, -0.9510502, -2.201401, 1, 1, 1, 1, 1,
-0.2077656, 0.2464959, 0.1459502, 1, 1, 1, 1, 1,
-0.2066571, -1.094123, -2.775846, 1, 1, 1, 1, 1,
-0.2064542, -1.030403, -1.70808, 1, 1, 1, 1, 1,
-0.2056871, -0.0967439, -1.317694, 1, 1, 1, 1, 1,
-0.2051117, -0.1074686, -2.219226, 1, 1, 1, 1, 1,
-0.2027434, -0.8445259, -2.471613, 0, 0, 1, 1, 1,
-0.2025306, 1.139724, -0.305828, 1, 0, 0, 1, 1,
-0.2000681, -0.5834788, -3.448723, 1, 0, 0, 1, 1,
-0.1895653, 0.1026385, 0.1454931, 1, 0, 0, 1, 1,
-0.187993, -0.8928874, -3.184382, 1, 0, 0, 1, 1,
-0.1872524, -0.5580772, -2.770679, 1, 0, 0, 1, 1,
-0.1857759, -0.7776776, -2.321359, 0, 0, 0, 1, 1,
-0.1831855, 0.1419912, -0.3958158, 0, 0, 0, 1, 1,
-0.1819029, -1.14402, -2.55026, 0, 0, 0, 1, 1,
-0.1815063, -0.588397, -2.472865, 0, 0, 0, 1, 1,
-0.1772199, -0.8470787, -3.410886, 0, 0, 0, 1, 1,
-0.1756801, 1.796303, 0.7891961, 0, 0, 0, 1, 1,
-0.1748452, 1.032549, -0.07872721, 0, 0, 0, 1, 1,
-0.1743315, -0.8732059, -2.916679, 1, 1, 1, 1, 1,
-0.1732059, 1.463319, 0.2935725, 1, 1, 1, 1, 1,
-0.170847, 0.8678662, 0.2294759, 1, 1, 1, 1, 1,
-0.1707734, 0.5708908, 0.8636914, 1, 1, 1, 1, 1,
-0.1704113, -0.4988503, -3.326938, 1, 1, 1, 1, 1,
-0.1694437, -1.942291, -2.301965, 1, 1, 1, 1, 1,
-0.1672907, 0.5437328, -1.062645, 1, 1, 1, 1, 1,
-0.1637251, -0.3590608, -4.9515, 1, 1, 1, 1, 1,
-0.1628977, -1.305474, -2.49597, 1, 1, 1, 1, 1,
-0.1626235, -0.8592383, -1.869659, 1, 1, 1, 1, 1,
-0.1566039, -0.8426323, -1.746271, 1, 1, 1, 1, 1,
-0.1500893, 0.0551652, -3.468988, 1, 1, 1, 1, 1,
-0.1480127, -0.2180826, -2.111491, 1, 1, 1, 1, 1,
-0.1440884, -0.07918352, -2.137996, 1, 1, 1, 1, 1,
-0.1435908, 1.381747, 0.9641184, 1, 1, 1, 1, 1,
-0.1435525, -0.2440509, -2.170284, 0, 0, 1, 1, 1,
-0.1409305, 2.356901, -1.130585, 1, 0, 0, 1, 1,
-0.1406334, -1.264958, -4.66433, 1, 0, 0, 1, 1,
-0.1390991, -0.741641, -3.658814, 1, 0, 0, 1, 1,
-0.138749, -0.07937062, -1.897693, 1, 0, 0, 1, 1,
-0.137662, 1.23574, 0.5039902, 1, 0, 0, 1, 1,
-0.1357964, -1.261102, -1.465357, 0, 0, 0, 1, 1,
-0.1349564, -0.6681004, -1.929837, 0, 0, 0, 1, 1,
-0.1324083, 0.9650888, 1.134811, 0, 0, 0, 1, 1,
-0.1291108, -0.7111983, -4.032718, 0, 0, 0, 1, 1,
-0.1268388, 0.2578599, -1.84176, 0, 0, 0, 1, 1,
-0.1245196, -0.9666702, -3.321369, 0, 0, 0, 1, 1,
-0.1242955, -0.08348853, -1.454672, 0, 0, 0, 1, 1,
-0.1237163, -1.754754, -2.476146, 1, 1, 1, 1, 1,
-0.1229819, 0.9860554, 1.108304, 1, 1, 1, 1, 1,
-0.1220638, -0.6323496, -3.976324, 1, 1, 1, 1, 1,
-0.117256, -2.461409, -4.606003, 1, 1, 1, 1, 1,
-0.1113431, 1.902694, 0.2177116, 1, 1, 1, 1, 1,
-0.1098907, 0.3511367, -2.039854, 1, 1, 1, 1, 1,
-0.1059332, -0.9276552, -3.107695, 1, 1, 1, 1, 1,
-0.1008199, 0.3156859, -0.7125512, 1, 1, 1, 1, 1,
-0.09882607, -2.042511, -3.605085, 1, 1, 1, 1, 1,
-0.09520587, 1.690088, 1.341353, 1, 1, 1, 1, 1,
-0.09288909, -0.7447149, -3.47432, 1, 1, 1, 1, 1,
-0.0920305, -0.356674, -2.670469, 1, 1, 1, 1, 1,
-0.09167163, 1.493105, 1.664296, 1, 1, 1, 1, 1,
-0.09012918, -0.6475996, -2.761026, 1, 1, 1, 1, 1,
-0.08724719, 1.363437, 0.09942354, 1, 1, 1, 1, 1,
-0.08634017, -0.4088258, -3.847718, 0, 0, 1, 1, 1,
-0.08354193, -0.01252242, -0.5192776, 1, 0, 0, 1, 1,
-0.07705285, -0.6857736, -3.594455, 1, 0, 0, 1, 1,
-0.07486412, -1.15029, -3.64515, 1, 0, 0, 1, 1,
-0.07350117, 0.3341525, -0.07192783, 1, 0, 0, 1, 1,
-0.07218771, -1.094912, -3.037312, 1, 0, 0, 1, 1,
-0.06983966, 0.3088386, -0.1947203, 0, 0, 0, 1, 1,
-0.06308209, -0.08070522, -2.898142, 0, 0, 0, 1, 1,
-0.06158272, -0.4250453, -2.921289, 0, 0, 0, 1, 1,
-0.0562319, 0.5015785, 0.7034285, 0, 0, 0, 1, 1,
-0.051832, 0.2147723, -1.563551, 0, 0, 0, 1, 1,
-0.04783139, -0.465696, -3.67343, 0, 0, 0, 1, 1,
-0.04340053, -0.4248177, -3.213933, 0, 0, 0, 1, 1,
-0.04329037, 1.587567, -0.5281692, 1, 1, 1, 1, 1,
-0.04279241, -0.5350617, -3.037751, 1, 1, 1, 1, 1,
-0.04165264, 0.4915423, -1.655409, 1, 1, 1, 1, 1,
-0.0401553, -1.764584, -1.403425, 1, 1, 1, 1, 1,
-0.03743976, 1.183249, 0.3774254, 1, 1, 1, 1, 1,
-0.03536056, 0.9414225, 0.9434535, 1, 1, 1, 1, 1,
-0.02895791, -0.5539054, -2.655313, 1, 1, 1, 1, 1,
-0.02414049, -0.681674, -1.905307, 1, 1, 1, 1, 1,
-0.01818988, 1.264175, 0.958653, 1, 1, 1, 1, 1,
-0.01776904, 0.1254916, 0.2796177, 1, 1, 1, 1, 1,
-0.01503718, 1.56927, -0.3701827, 1, 1, 1, 1, 1,
-0.01492856, 1.277883, 0.1961899, 1, 1, 1, 1, 1,
-0.008938131, 0.5552634, -1.699771, 1, 1, 1, 1, 1,
-0.008199966, 0.7483587, -0.7792588, 1, 1, 1, 1, 1,
-0.006757839, -1.702537, -2.181782, 1, 1, 1, 1, 1,
-0.003039416, 1.390748, -2.081614, 0, 0, 1, 1, 1,
-0.00235774, -0.7965532, -4.679566, 1, 0, 0, 1, 1,
9.579716e-05, 0.7529899, 0.2180564, 1, 0, 0, 1, 1,
0.0004081241, 2.245589, -0.31165, 1, 0, 0, 1, 1,
0.001407948, 0.8234754, 0.3413205, 1, 0, 0, 1, 1,
0.001721383, 0.5554959, 0.1109318, 1, 0, 0, 1, 1,
0.002509942, -0.3946965, 2.93078, 0, 0, 0, 1, 1,
0.004023556, 1.166012, -0.450495, 0, 0, 0, 1, 1,
0.00686911, 0.5770059, -0.02685549, 0, 0, 0, 1, 1,
0.0100355, 2.196201, -1.213402, 0, 0, 0, 1, 1,
0.01579214, 0.6299005, -2.724102, 0, 0, 0, 1, 1,
0.01644963, -1.379779, 3.273095, 0, 0, 0, 1, 1,
0.01788179, -0.631089, 4.315396, 0, 0, 0, 1, 1,
0.01820128, 1.773802, -2.662895, 1, 1, 1, 1, 1,
0.02007529, 1.710116, -0.8242188, 1, 1, 1, 1, 1,
0.02023031, -0.3520936, 0.7024804, 1, 1, 1, 1, 1,
0.02087084, 0.2111056, 0.3393745, 1, 1, 1, 1, 1,
0.02262048, 0.7941173, 0.1876862, 1, 1, 1, 1, 1,
0.02857582, 1.400118, -2.152867, 1, 1, 1, 1, 1,
0.02900425, 2.085355, -0.06879323, 1, 1, 1, 1, 1,
0.02969083, -1.364177, 3.949183, 1, 1, 1, 1, 1,
0.03389275, 0.0400292, 1.779265, 1, 1, 1, 1, 1,
0.0354958, -0.5361291, 3.665632, 1, 1, 1, 1, 1,
0.03800663, -0.2523631, 4.070006, 1, 1, 1, 1, 1,
0.03812699, -0.4083062, 2.299554, 1, 1, 1, 1, 1,
0.0396469, 1.722431, 1.1115, 1, 1, 1, 1, 1,
0.04146064, -0.6605143, 3.934595, 1, 1, 1, 1, 1,
0.04274914, -0.9663853, 5.692755, 1, 1, 1, 1, 1,
0.04461926, 0.01986124, 1.471228, 0, 0, 1, 1, 1,
0.04521719, -0.2051515, 4.577513, 1, 0, 0, 1, 1,
0.04535274, 0.2665277, -1.43544, 1, 0, 0, 1, 1,
0.04557004, 0.8823677, -1.449726, 1, 0, 0, 1, 1,
0.04858036, 0.7645823, 0.5876761, 1, 0, 0, 1, 1,
0.04894071, 0.7438967, -1.614391, 1, 0, 0, 1, 1,
0.0538538, 0.4032048, 1.903132, 0, 0, 0, 1, 1,
0.05679354, 0.0761206, 2.371505, 0, 0, 0, 1, 1,
0.05795718, -0.3981495, 2.182568, 0, 0, 0, 1, 1,
0.0585863, 0.7889555, -0.5861907, 0, 0, 0, 1, 1,
0.06010533, -1.202081, 3.617331, 0, 0, 0, 1, 1,
0.0612177, -0.2426696, 2.243553, 0, 0, 0, 1, 1,
0.06255438, 1.322794, -0.2469258, 0, 0, 0, 1, 1,
0.06455552, -1.076779, 3.384048, 1, 1, 1, 1, 1,
0.06470161, 0.2433875, 0.05541996, 1, 1, 1, 1, 1,
0.07073921, 0.6974623, -0.4414854, 1, 1, 1, 1, 1,
0.07586276, 0.6377727, 0.2919019, 1, 1, 1, 1, 1,
0.07598874, 0.1894156, 0.1785596, 1, 1, 1, 1, 1,
0.08168779, 0.5498391, 0.3094841, 1, 1, 1, 1, 1,
0.0828786, 2.233481, 0.5266679, 1, 1, 1, 1, 1,
0.08341195, -0.5936636, 4.072315, 1, 1, 1, 1, 1,
0.08469558, 0.3455196, 0.5985702, 1, 1, 1, 1, 1,
0.08543316, 0.9214153, 0.07656004, 1, 1, 1, 1, 1,
0.08575834, 1.000191, 0.3225328, 1, 1, 1, 1, 1,
0.08685178, -1.386509, 1.30526, 1, 1, 1, 1, 1,
0.08774851, -0.1075406, 2.563048, 1, 1, 1, 1, 1,
0.08917916, 1.929096, 1.223188, 1, 1, 1, 1, 1,
0.09132552, 0.9584464, -0.1506614, 1, 1, 1, 1, 1,
0.09133281, -0.03432756, 2.208887, 0, 0, 1, 1, 1,
0.09440596, -0.2780731, 4.521344, 1, 0, 0, 1, 1,
0.09492756, 0.8825278, 0.2824793, 1, 0, 0, 1, 1,
0.09624659, -0.4179114, 3.240212, 1, 0, 0, 1, 1,
0.09663568, 0.5908979, 0.4152913, 1, 0, 0, 1, 1,
0.0970392, 0.1815661, -1.669509, 1, 0, 0, 1, 1,
0.09819919, -0.7829827, 4.122808, 0, 0, 0, 1, 1,
0.1115997, 0.1735755, -0.5617355, 0, 0, 0, 1, 1,
0.114824, 0.6819662, -0.804041, 0, 0, 0, 1, 1,
0.1268217, 0.7166013, 0.2075237, 0, 0, 0, 1, 1,
0.128458, -0.3199755, 2.619695, 0, 0, 0, 1, 1,
0.1328105, 0.6795527, 0.9799898, 0, 0, 0, 1, 1,
0.1337643, 0.1000637, 1.342152, 0, 0, 0, 1, 1,
0.1352786, -0.6629072, 4.108284, 1, 1, 1, 1, 1,
0.1370113, -0.5872964, 2.624464, 1, 1, 1, 1, 1,
0.1387797, 0.3850286, 1.734603, 1, 1, 1, 1, 1,
0.1397457, -0.8365892, 2.778513, 1, 1, 1, 1, 1,
0.1409811, -1.299505, 3.338454, 1, 1, 1, 1, 1,
0.1410292, -0.7399587, 2.440373, 1, 1, 1, 1, 1,
0.1459214, 0.7793873, -0.3992783, 1, 1, 1, 1, 1,
0.1459572, -0.5867024, 2.307686, 1, 1, 1, 1, 1,
0.1467434, 1.466429, -0.2489972, 1, 1, 1, 1, 1,
0.147854, 0.5792465, -0.6656007, 1, 1, 1, 1, 1,
0.154896, -0.1100906, 1.590255, 1, 1, 1, 1, 1,
0.156608, 2.642919, -0.5569196, 1, 1, 1, 1, 1,
0.1589963, -0.6787523, 2.027962, 1, 1, 1, 1, 1,
0.1590333, -0.08632208, 1.132811, 1, 1, 1, 1, 1,
0.1592319, 0.7938228, 0.4571655, 1, 1, 1, 1, 1,
0.160426, 0.6063085, 2.102458, 0, 0, 1, 1, 1,
0.1644429, -0.865951, 3.716219, 1, 0, 0, 1, 1,
0.1667441, -0.4917465, 2.29454, 1, 0, 0, 1, 1,
0.1684482, -1.116688, 4.030863, 1, 0, 0, 1, 1,
0.1684707, 1.463188, 0.5976418, 1, 0, 0, 1, 1,
0.1708303, -0.3747115, 3.23962, 1, 0, 0, 1, 1,
0.1742264, 2.258077, -0.03672482, 0, 0, 0, 1, 1,
0.1778513, 0.3627353, 0.1097852, 0, 0, 0, 1, 1,
0.1780857, 0.593811, 0.8534884, 0, 0, 0, 1, 1,
0.1781573, 0.2271406, 0.9848837, 0, 0, 0, 1, 1,
0.1804477, 2.029503, -1.81097, 0, 0, 0, 1, 1,
0.1805515, -0.6768724, 2.187702, 0, 0, 0, 1, 1,
0.1849522, -2.060064, 3.343597, 0, 0, 0, 1, 1,
0.1886748, -0.590557, 2.045902, 1, 1, 1, 1, 1,
0.1889504, 2.477499, 1.321573, 1, 1, 1, 1, 1,
0.1946258, 0.06260915, 2.72858, 1, 1, 1, 1, 1,
0.1965322, 0.6434811, 1.631678, 1, 1, 1, 1, 1,
0.1994058, -0.3334999, 1.781031, 1, 1, 1, 1, 1,
0.199411, 1.137154, -0.02921384, 1, 1, 1, 1, 1,
0.2049765, -0.3492205, 1.35005, 1, 1, 1, 1, 1,
0.2067885, 1.300626, 0.458494, 1, 1, 1, 1, 1,
0.2113605, 0.4487899, 0.2537625, 1, 1, 1, 1, 1,
0.2114347, 0.04527884, 1.463696, 1, 1, 1, 1, 1,
0.2114921, 0.4327326, 1.958221, 1, 1, 1, 1, 1,
0.2147547, -0.7683654, 3.103143, 1, 1, 1, 1, 1,
0.215644, -0.7853003, 2.123265, 1, 1, 1, 1, 1,
0.2170995, -0.2578383, 2.873718, 1, 1, 1, 1, 1,
0.2191937, -1.052008, 1.527141, 1, 1, 1, 1, 1,
0.2196718, 0.9255884, 0.05271349, 0, 0, 1, 1, 1,
0.2198508, -0.01393899, 0.6527932, 1, 0, 0, 1, 1,
0.2207512, -1.343474, 4.97968, 1, 0, 0, 1, 1,
0.2216314, 1.563646, 0.5875162, 1, 0, 0, 1, 1,
0.2219635, 0.09884615, 0.5003166, 1, 0, 0, 1, 1,
0.2344639, -1.540152, 2.362328, 1, 0, 0, 1, 1,
0.2344943, -1.028914, 3.62418, 0, 0, 0, 1, 1,
0.2348418, 1.224487, -1.01404, 0, 0, 0, 1, 1,
0.2389737, 0.120349, 1.337129, 0, 0, 0, 1, 1,
0.2412431, -0.9515525, 1.985735, 0, 0, 0, 1, 1,
0.2428405, 1.610636, 1.7282, 0, 0, 0, 1, 1,
0.2487518, 1.634856, -0.9341282, 0, 0, 0, 1, 1,
0.2557203, 0.1319481, 2.508226, 0, 0, 0, 1, 1,
0.2558244, 0.04574735, 0.2836784, 1, 1, 1, 1, 1,
0.2578831, 1.786123, 0.7816002, 1, 1, 1, 1, 1,
0.2583539, 1.921427, -0.2866443, 1, 1, 1, 1, 1,
0.2589777, 0.6488544, 1.699698, 1, 1, 1, 1, 1,
0.2653724, -1.033918, 0.3257787, 1, 1, 1, 1, 1,
0.2774733, 0.6690663, 0.534089, 1, 1, 1, 1, 1,
0.2785786, -0.7159268, 0.7044328, 1, 1, 1, 1, 1,
0.2890089, -0.4338145, 2.854668, 1, 1, 1, 1, 1,
0.2894199, -1.288842, 2.947087, 1, 1, 1, 1, 1,
0.3002658, -0.167359, 1.408693, 1, 1, 1, 1, 1,
0.3013628, -0.4916083, 1.671931, 1, 1, 1, 1, 1,
0.3152873, -0.3738792, 2.796412, 1, 1, 1, 1, 1,
0.319545, -0.8221659, 0.9592293, 1, 1, 1, 1, 1,
0.3226415, 0.6694745, 0.2631296, 1, 1, 1, 1, 1,
0.3234263, 0.2515539, 2.907408, 1, 1, 1, 1, 1,
0.3239567, 2.42251, -0.224646, 0, 0, 1, 1, 1,
0.3248235, -0.4866009, 3.643266, 1, 0, 0, 1, 1,
0.3256336, 0.3797786, 0.6979198, 1, 0, 0, 1, 1,
0.3256696, -0.1489946, 1.727647, 1, 0, 0, 1, 1,
0.3277643, -1.812229, 4.163401, 1, 0, 0, 1, 1,
0.3295119, -0.2510392, 1.489496, 1, 0, 0, 1, 1,
0.3313473, 0.874667, -0.8232724, 0, 0, 0, 1, 1,
0.3347224, -2.457995, 4.465636, 0, 0, 0, 1, 1,
0.3351692, 1.340518, -0.295177, 0, 0, 0, 1, 1,
0.3493319, -0.2174015, 1.199785, 0, 0, 0, 1, 1,
0.3510528, 0.02689538, 3.181895, 0, 0, 0, 1, 1,
0.3512389, -0.3015974, 0.6219764, 0, 0, 0, 1, 1,
0.3526193, -1.150248, 2.14917, 0, 0, 0, 1, 1,
0.3528174, -1.009938, 2.757185, 1, 1, 1, 1, 1,
0.3540867, -1.221432, 4.070977, 1, 1, 1, 1, 1,
0.3541878, -1.070897, 2.029337, 1, 1, 1, 1, 1,
0.3547768, 0.9892475, 2.211164, 1, 1, 1, 1, 1,
0.3630117, 0.3134876, 0.2872712, 1, 1, 1, 1, 1,
0.363481, 0.6786107, 0.8190153, 1, 1, 1, 1, 1,
0.3652681, -1.191786, 3.132937, 1, 1, 1, 1, 1,
0.3703716, 0.3590718, 1.219694, 1, 1, 1, 1, 1,
0.3722227, 0.2288226, 1.600086, 1, 1, 1, 1, 1,
0.3730589, 1.414332, 1.241676, 1, 1, 1, 1, 1,
0.3748858, -1.303991, 3.031623, 1, 1, 1, 1, 1,
0.3758965, 2.507833, 0.4960786, 1, 1, 1, 1, 1,
0.382107, -0.6287306, 1.282323, 1, 1, 1, 1, 1,
0.3821413, -0.3516122, 4.400836, 1, 1, 1, 1, 1,
0.3829907, 1.049473, 0.1588453, 1, 1, 1, 1, 1,
0.3837293, -0.6732911, 4.764574, 0, 0, 1, 1, 1,
0.3844047, 1.056722, 1.249657, 1, 0, 0, 1, 1,
0.3848501, -0.8441077, 2.103615, 1, 0, 0, 1, 1,
0.3880788, 1.387456, 0.01467134, 1, 0, 0, 1, 1,
0.3886717, 0.8338661, 0.6844555, 1, 0, 0, 1, 1,
0.3960537, 0.3305408, 0.6544137, 1, 0, 0, 1, 1,
0.4008638, 1.250446, 0.8483608, 0, 0, 0, 1, 1,
0.4069697, 0.6626077, -0.6124581, 0, 0, 0, 1, 1,
0.4077058, 0.4965192, 1.605939, 0, 0, 0, 1, 1,
0.4098834, -0.6964283, 3.489118, 0, 0, 0, 1, 1,
0.4104891, -0.1682147, 0.9889907, 0, 0, 0, 1, 1,
0.4140241, -0.3614282, 3.669582, 0, 0, 0, 1, 1,
0.4141209, 0.1551288, 0.7228746, 0, 0, 0, 1, 1,
0.4147494, 1.588756, -1.53033, 1, 1, 1, 1, 1,
0.4176017, 0.1661116, 1.547096, 1, 1, 1, 1, 1,
0.4212898, 0.625613, -0.0443972, 1, 1, 1, 1, 1,
0.4245326, 1.374012, 1.390131, 1, 1, 1, 1, 1,
0.4247215, -0.7135033, 4.081471, 1, 1, 1, 1, 1,
0.4251826, 0.6635564, 1.366147, 1, 1, 1, 1, 1,
0.4293636, -0.8137326, 2.94957, 1, 1, 1, 1, 1,
0.4301791, -2.057278, 3.104438, 1, 1, 1, 1, 1,
0.4338301, 1.073591, 0.2218454, 1, 1, 1, 1, 1,
0.435585, -0.6400809, 1.44572, 1, 1, 1, 1, 1,
0.4391415, 0.1013129, 1.243887, 1, 1, 1, 1, 1,
0.4409025, -0.1048308, 0.9120476, 1, 1, 1, 1, 1,
0.4411625, -1.600318, 5.389628, 1, 1, 1, 1, 1,
0.4424899, 0.3220038, -0.3942691, 1, 1, 1, 1, 1,
0.4442922, 1.153133, 0.2316882, 1, 1, 1, 1, 1,
0.4445825, -0.2391092, 1.595038, 0, 0, 1, 1, 1,
0.4482234, -0.3128163, 2.520912, 1, 0, 0, 1, 1,
0.4524566, 0.6343562, 0.5359055, 1, 0, 0, 1, 1,
0.4578078, 1.502142, -0.7009261, 1, 0, 0, 1, 1,
0.4609263, 0.3196526, 0.4704462, 1, 0, 0, 1, 1,
0.4609306, 2.013744, 2.905735, 1, 0, 0, 1, 1,
0.4614743, 1.20942, 0.5412217, 0, 0, 0, 1, 1,
0.4648694, -0.3026731, 2.121509, 0, 0, 0, 1, 1,
0.4702458, 0.526047, 0.006799943, 0, 0, 0, 1, 1,
0.4741531, 1.389427, 0.3127813, 0, 0, 0, 1, 1,
0.4787912, -1.188242, 2.870206, 0, 0, 0, 1, 1,
0.4808079, 0.3429245, 1.196028, 0, 0, 0, 1, 1,
0.4817488, 0.07652166, 1.928582, 0, 0, 0, 1, 1,
0.4875503, 0.5964233, -2.044585, 1, 1, 1, 1, 1,
0.4884995, -0.8297643, 3.000946, 1, 1, 1, 1, 1,
0.4925233, 1.386216, -0.255376, 1, 1, 1, 1, 1,
0.4946362, 0.9385026, 1.594555, 1, 1, 1, 1, 1,
0.500497, 0.664722, -0.6611262, 1, 1, 1, 1, 1,
0.5057049, -1.101231, 3.63732, 1, 1, 1, 1, 1,
0.5080872, 0.6442673, 1.378536, 1, 1, 1, 1, 1,
0.5137544, 1.503197, 2.664479, 1, 1, 1, 1, 1,
0.5138534, -0.5310919, 2.423697, 1, 1, 1, 1, 1,
0.5211627, 0.7426835, 0.4157197, 1, 1, 1, 1, 1,
0.5212888, 0.4694058, 1.769006, 1, 1, 1, 1, 1,
0.525026, 0.9286298, -0.7494277, 1, 1, 1, 1, 1,
0.5255793, 0.7183828, 1.569971, 1, 1, 1, 1, 1,
0.5366212, -0.8360794, 2.559527, 1, 1, 1, 1, 1,
0.5376344, 1.472457, 0.4519563, 1, 1, 1, 1, 1,
0.5385023, 0.7171754, 0.7958552, 0, 0, 1, 1, 1,
0.5399283, 0.7998357, 1.144859, 1, 0, 0, 1, 1,
0.543732, 1.332307, -1.437335, 1, 0, 0, 1, 1,
0.5507083, -0.05193857, -0.7066678, 1, 0, 0, 1, 1,
0.5566853, -0.01274803, 1.160414, 1, 0, 0, 1, 1,
0.5568888, 0.3220138, -0.6624306, 1, 0, 0, 1, 1,
0.5678349, 0.50291, 0.9397715, 0, 0, 0, 1, 1,
0.569816, 0.872322, 1.097206, 0, 0, 0, 1, 1,
0.579656, 0.4611611, 1.804672, 0, 0, 0, 1, 1,
0.5798906, 0.1122262, 2.254969, 0, 0, 0, 1, 1,
0.5873568, -0.2355728, 1.109392, 0, 0, 0, 1, 1,
0.5897688, 0.5312884, 1.248263, 0, 0, 0, 1, 1,
0.5902829, -0.2724082, 2.442203, 0, 0, 0, 1, 1,
0.5989311, -1.488605, 2.925791, 1, 1, 1, 1, 1,
0.6007407, -0.4202987, 2.568441, 1, 1, 1, 1, 1,
0.601078, 1.210477, -0.2455738, 1, 1, 1, 1, 1,
0.6111743, 2.046283, -1.535427, 1, 1, 1, 1, 1,
0.6174195, -0.432037, 3.253887, 1, 1, 1, 1, 1,
0.6179757, 0.537365, 1.882285, 1, 1, 1, 1, 1,
0.6227509, -0.5052277, 2.323904, 1, 1, 1, 1, 1,
0.6332405, -0.2498604, 3.24332, 1, 1, 1, 1, 1,
0.6358855, -0.04912365, 1.036239, 1, 1, 1, 1, 1,
0.6386483, 0.763244, -1.245983, 1, 1, 1, 1, 1,
0.6388035, -0.03532515, 1.468142, 1, 1, 1, 1, 1,
0.6451849, -0.33235, 0.843953, 1, 1, 1, 1, 1,
0.6478836, -0.9768556, 2.797086, 1, 1, 1, 1, 1,
0.6505508, -0.9478172, 3.03092, 1, 1, 1, 1, 1,
0.6642328, 0.6526563, 1.571452, 1, 1, 1, 1, 1,
0.6646195, 0.08699761, -0.468242, 0, 0, 1, 1, 1,
0.6688416, 0.7563374, 0.460031, 1, 0, 0, 1, 1,
0.6690322, -0.2077627, 2.065674, 1, 0, 0, 1, 1,
0.6695994, -0.9122535, 2.418218, 1, 0, 0, 1, 1,
0.6706041, -0.1755365, 0.8495066, 1, 0, 0, 1, 1,
0.6707563, 1.309881, -0.4406277, 1, 0, 0, 1, 1,
0.6818061, -0.8496099, 1.456822, 0, 0, 0, 1, 1,
0.6829566, -0.5368308, 1.909579, 0, 0, 0, 1, 1,
0.6886843, 1.400854, 0.4010219, 0, 0, 0, 1, 1,
0.6888095, -0.09050817, 1.711695, 0, 0, 0, 1, 1,
0.6902553, 1.144008, 0.2916049, 0, 0, 0, 1, 1,
0.6902772, 0.9272875, 0.1968711, 0, 0, 0, 1, 1,
0.6909776, -0.5722487, 3.957241, 0, 0, 0, 1, 1,
0.6952284, 0.8376318, 0.3395585, 1, 1, 1, 1, 1,
0.69738, 1.871871, 0.7155657, 1, 1, 1, 1, 1,
0.6996378, -1.39514, 2.328598, 1, 1, 1, 1, 1,
0.7010576, 1.012444, 1.702286, 1, 1, 1, 1, 1,
0.701308, 0.961541, 0.7845544, 1, 1, 1, 1, 1,
0.7017807, 0.06830008, 2.931632, 1, 1, 1, 1, 1,
0.7024969, -0.6392516, 2.519158, 1, 1, 1, 1, 1,
0.7044969, 0.3417759, 1.259773, 1, 1, 1, 1, 1,
0.7068691, -0.4668329, 1.76039, 1, 1, 1, 1, 1,
0.711831, 0.3682617, 1.13387, 1, 1, 1, 1, 1,
0.715354, -1.702877, 2.239837, 1, 1, 1, 1, 1,
0.7297881, -0.3858982, 1.024193, 1, 1, 1, 1, 1,
0.7354248, 0.6281803, 1.54613, 1, 1, 1, 1, 1,
0.7403609, 0.7319898, 0.9453691, 1, 1, 1, 1, 1,
0.7476223, -2.308382, 3.20635, 1, 1, 1, 1, 1,
0.749494, 0.6355333, 0.9140766, 0, 0, 1, 1, 1,
0.7496575, 0.09315418, 2.893463, 1, 0, 0, 1, 1,
0.7526084, 1.061203, -0.02327906, 1, 0, 0, 1, 1,
0.7535891, -0.8852028, 2.80056, 1, 0, 0, 1, 1,
0.7582552, 0.1252578, 1.768369, 1, 0, 0, 1, 1,
0.7587568, 1.827328, 0.6410675, 1, 0, 0, 1, 1,
0.7685289, -0.1719502, 1.814973, 0, 0, 0, 1, 1,
0.7692811, -0.5722883, -0.2704251, 0, 0, 0, 1, 1,
0.7710277, -2.172077, 2.776477, 0, 0, 0, 1, 1,
0.7775956, -0.8482749, 2.64348, 0, 0, 0, 1, 1,
0.7804901, 1.196192, 2.107387, 0, 0, 0, 1, 1,
0.7847484, 0.1480651, -0.2716532, 0, 0, 0, 1, 1,
0.7862104, -1.441113, 3.064861, 0, 0, 0, 1, 1,
0.7885997, -0.6787701, 1.333133, 1, 1, 1, 1, 1,
0.7890887, 0.4203289, 1.706152, 1, 1, 1, 1, 1,
0.7912191, -0.5765581, 2.4496, 1, 1, 1, 1, 1,
0.7914055, 1.565889, 0.1831572, 1, 1, 1, 1, 1,
0.7921891, -0.1725351, 2.815921, 1, 1, 1, 1, 1,
0.7940498, -0.2706703, 1.832851, 1, 1, 1, 1, 1,
0.8040235, 0.4368646, 1.441671, 1, 1, 1, 1, 1,
0.811945, 1.026914, -0.677909, 1, 1, 1, 1, 1,
0.8125114, -0.3905443, 1.715185, 1, 1, 1, 1, 1,
0.8190507, 0.252015, 1.413789, 1, 1, 1, 1, 1,
0.8224533, 2.089523, 0.2369747, 1, 1, 1, 1, 1,
0.8224711, 0.5187775, 1.062389, 1, 1, 1, 1, 1,
0.8310982, -0.3967376, 3.124318, 1, 1, 1, 1, 1,
0.8312368, -0.6544337, 0.3903449, 1, 1, 1, 1, 1,
0.8360795, -0.2047565, 1.382236, 1, 1, 1, 1, 1,
0.837954, 1.065333, 0.4327878, 0, 0, 1, 1, 1,
0.8402017, 0.7550609, -1.046871, 1, 0, 0, 1, 1,
0.844269, -1.667499, 2.844503, 1, 0, 0, 1, 1,
0.8472787, -0.8594661, 3.039235, 1, 0, 0, 1, 1,
0.8472814, 1.846515, 0.603274, 1, 0, 0, 1, 1,
0.8479856, -0.712601, 1.547826, 1, 0, 0, 1, 1,
0.850236, 0.1829237, 1.085344, 0, 0, 0, 1, 1,
0.8513292, -1.465451, 2.629098, 0, 0, 0, 1, 1,
0.8518711, 0.6734089, 1.83971, 0, 0, 0, 1, 1,
0.8534119, -0.7403491, 1.320491, 0, 0, 0, 1, 1,
0.8591017, 1.750986, 0.4179736, 0, 0, 0, 1, 1,
0.8596287, -1.226284, 2.492387, 0, 0, 0, 1, 1,
0.8656362, -1.259639, 2.609092, 0, 0, 0, 1, 1,
0.8685908, -0.4104033, 1.95947, 1, 1, 1, 1, 1,
0.870121, 0.3196805, 1.01591, 1, 1, 1, 1, 1,
0.8710623, 0.5364783, 2.401292, 1, 1, 1, 1, 1,
0.8743641, 0.5155619, 1.631771, 1, 1, 1, 1, 1,
0.8768791, 0.5746268, 2.571838, 1, 1, 1, 1, 1,
0.8778717, -0.3876276, 1.198487, 1, 1, 1, 1, 1,
0.8803184, -0.542861, 2.137125, 1, 1, 1, 1, 1,
0.8833092, 1.84798, 0.130717, 1, 1, 1, 1, 1,
0.884658, 1.968305, 1.089822, 1, 1, 1, 1, 1,
0.8885473, 2.068136, 0.1652521, 1, 1, 1, 1, 1,
0.8891236, -0.1875301, 1.695018, 1, 1, 1, 1, 1,
0.8929117, 0.4233295, 0.2715604, 1, 1, 1, 1, 1,
0.8944002, 0.6165129, 0.09005833, 1, 1, 1, 1, 1,
0.8988416, -0.04905418, 0.6197039, 1, 1, 1, 1, 1,
0.9055778, -0.6079443, 3.457551, 1, 1, 1, 1, 1,
0.9072524, 2.440946, 0.539019, 0, 0, 1, 1, 1,
0.9204042, 0.1418607, 1.202539, 1, 0, 0, 1, 1,
0.9206571, -2.105769, 3.986722, 1, 0, 0, 1, 1,
0.9222071, -0.2647412, 2.564734, 1, 0, 0, 1, 1,
0.9265972, -0.7482054, 1.864585, 1, 0, 0, 1, 1,
0.9324358, 0.740031, 0.5279169, 1, 0, 0, 1, 1,
0.9345154, -0.4385606, 0.7556457, 0, 0, 0, 1, 1,
0.9371862, -0.09199624, 0.9580053, 0, 0, 0, 1, 1,
0.9373924, 2.003275, 0.1406123, 0, 0, 0, 1, 1,
0.9390001, -1.990935, 2.722761, 0, 0, 0, 1, 1,
0.941533, -0.3772754, 1.865902, 0, 0, 0, 1, 1,
0.9452465, 0.1836735, 2.343635, 0, 0, 0, 1, 1,
0.9488723, -2.155089, 3.298285, 0, 0, 0, 1, 1,
0.9506788, 1.406781, -0.3886373, 1, 1, 1, 1, 1,
0.9531456, -1.016304, 1.322551, 1, 1, 1, 1, 1,
0.9540473, -2.426389, 2.509639, 1, 1, 1, 1, 1,
0.9573618, 0.9052624, 0.3214593, 1, 1, 1, 1, 1,
0.9575318, -0.2650789, 2.098751, 1, 1, 1, 1, 1,
0.9646855, -1.271231, 3.240358, 1, 1, 1, 1, 1,
0.9662259, 1.320092, 0.2701965, 1, 1, 1, 1, 1,
0.9697821, -0.4258056, 0.8883254, 1, 1, 1, 1, 1,
0.9716977, 0.5225216, -0.4239375, 1, 1, 1, 1, 1,
0.9822571, 0.0660263, 0.2125985, 1, 1, 1, 1, 1,
0.9825892, -0.104222, 0.7253864, 1, 1, 1, 1, 1,
0.9846648, 0.3514518, 0.8634531, 1, 1, 1, 1, 1,
0.9874141, 0.9241959, 0.9179559, 1, 1, 1, 1, 1,
0.988396, -1.754267, 1.360702, 1, 1, 1, 1, 1,
0.9964069, -0.13885, 0.467434, 1, 1, 1, 1, 1,
0.9997203, -0.6802442, 1.712394, 0, 0, 1, 1, 1,
1.00009, 0.05514254, 1.857324, 1, 0, 0, 1, 1,
1.004129, -0.275592, 2.643766, 1, 0, 0, 1, 1,
1.008708, 0.9925826, 0.9468537, 1, 0, 0, 1, 1,
1.010382, -0.7641675, 1.535789, 1, 0, 0, 1, 1,
1.019427, -1.032887, 3.232093, 1, 0, 0, 1, 1,
1.02052, 0.8674456, 0.05436711, 0, 0, 0, 1, 1,
1.023571, -1.179417, 2.99779, 0, 0, 0, 1, 1,
1.02766, -1.35006, 1.760478, 0, 0, 0, 1, 1,
1.031131, -0.6939827, 4.456147, 0, 0, 0, 1, 1,
1.032944, -0.8243212, 1.254331, 0, 0, 0, 1, 1,
1.033265, 0.1566437, 2.947983, 0, 0, 0, 1, 1,
1.034254, 1.429942, -0.7850736, 0, 0, 0, 1, 1,
1.037347, 2.192966, 0.6425655, 1, 1, 1, 1, 1,
1.039112, 1.451045, 0.3342898, 1, 1, 1, 1, 1,
1.044846, -0.7736804, 1.001647, 1, 1, 1, 1, 1,
1.045771, -0.08745625, 2.488584, 1, 1, 1, 1, 1,
1.047986, 2.370169, -0.6158191, 1, 1, 1, 1, 1,
1.053, 0.5595339, 2.086899, 1, 1, 1, 1, 1,
1.057459, -0.09422413, 1.257, 1, 1, 1, 1, 1,
1.058436, 0.7422911, 0.5185412, 1, 1, 1, 1, 1,
1.073582, -0.4996958, 2.165994, 1, 1, 1, 1, 1,
1.076466, -1.836236, 2.805876, 1, 1, 1, 1, 1,
1.077531, -1.135196, 1.577516, 1, 1, 1, 1, 1,
1.087662, -0.00754809, 1.98215, 1, 1, 1, 1, 1,
1.089456, -0.5317023, 0.7275771, 1, 1, 1, 1, 1,
1.093472, -0.7871169, 5.72678, 1, 1, 1, 1, 1,
1.095701, 0.9219674, 0.1798832, 1, 1, 1, 1, 1,
1.101769, -1.679618, 2.422899, 0, 0, 1, 1, 1,
1.102881, -0.8907206, 1.894096, 1, 0, 0, 1, 1,
1.105329, 1.195599, -0.3788528, 1, 0, 0, 1, 1,
1.111521, 3.361415, 0.752046, 1, 0, 0, 1, 1,
1.114534, 0.1558712, 0.9924459, 1, 0, 0, 1, 1,
1.119465, -0.1640728, 1.301529, 1, 0, 0, 1, 1,
1.122598, 0.6613689, 3.747493, 0, 0, 0, 1, 1,
1.124638, 0.1351722, -0.5629923, 0, 0, 0, 1, 1,
1.130202, -0.9161361, 0.4742214, 0, 0, 0, 1, 1,
1.130875, -0.06000835, 2.605816, 0, 0, 0, 1, 1,
1.146089, -0.6562634, 1.830503, 0, 0, 0, 1, 1,
1.152649, 0.9074427, 1.061575, 0, 0, 0, 1, 1,
1.156195, 1.046117, 0.5025834, 0, 0, 0, 1, 1,
1.160903, -0.1282322, 1.774697, 1, 1, 1, 1, 1,
1.164584, 1.212656, 1.072648, 1, 1, 1, 1, 1,
1.18316, -0.3632083, 2.206604, 1, 1, 1, 1, 1,
1.185125, 0.8024564, 1.44396, 1, 1, 1, 1, 1,
1.188451, -1.605932, 3.025667, 1, 1, 1, 1, 1,
1.189152, 0.6798253, 2.058924, 1, 1, 1, 1, 1,
1.191512, -0.3267205, 2.957166, 1, 1, 1, 1, 1,
1.204288, -0.7642101, 1.148716, 1, 1, 1, 1, 1,
1.208609, -0.06162698, 1.447904, 1, 1, 1, 1, 1,
1.212754, 0.5814747, 0.04491472, 1, 1, 1, 1, 1,
1.221294, 0.2035717, 0.1364234, 1, 1, 1, 1, 1,
1.223062, 1.075452, -0.4513429, 1, 1, 1, 1, 1,
1.223624, -0.01860915, 0.3647314, 1, 1, 1, 1, 1,
1.225611, -0.1721392, -0.6182649, 1, 1, 1, 1, 1,
1.23059, 0.1798085, 2.45516, 1, 1, 1, 1, 1,
1.232729, 0.2614701, 1.174367, 0, 0, 1, 1, 1,
1.259639, -0.1820026, 3.16893, 1, 0, 0, 1, 1,
1.264422, 0.5576067, 1.066486, 1, 0, 0, 1, 1,
1.28219, -0.3082214, 0.01110374, 1, 0, 0, 1, 1,
1.290274, -1.124695, 3.037415, 1, 0, 0, 1, 1,
1.293641, -1.67082, 0.7812233, 1, 0, 0, 1, 1,
1.297988, -0.9291216, 3.486017, 0, 0, 0, 1, 1,
1.303815, 0.1362653, 0.4727543, 0, 0, 0, 1, 1,
1.305966, 0.213392, -0.1613625, 0, 0, 0, 1, 1,
1.310133, 0.07589683, 0.3617962, 0, 0, 0, 1, 1,
1.361431, 1.176691, 0.1840693, 0, 0, 0, 1, 1,
1.368696, 0.513974, 3.931242, 0, 0, 0, 1, 1,
1.374142, -0.4581313, -0.4808739, 0, 0, 0, 1, 1,
1.376437, -0.4070916, 2.342615, 1, 1, 1, 1, 1,
1.381775, 0.661537, 0.9061143, 1, 1, 1, 1, 1,
1.396606, 1.54913, -0.4351062, 1, 1, 1, 1, 1,
1.400002, -0.6639735, 2.238948, 1, 1, 1, 1, 1,
1.423745, 2.818958, 0.8140759, 1, 1, 1, 1, 1,
1.426222, -0.4109231, 1.888883, 1, 1, 1, 1, 1,
1.428132, 1.390696, -0.4673988, 1, 1, 1, 1, 1,
1.429126, -0.1412669, -1.347981, 1, 1, 1, 1, 1,
1.440861, 0.043931, 0.5823466, 1, 1, 1, 1, 1,
1.464489, -0.7559121, 3.431482, 1, 1, 1, 1, 1,
1.481809, -1.358138, 1.129909, 1, 1, 1, 1, 1,
1.486623, -0.6910648, 2.545506, 1, 1, 1, 1, 1,
1.486956, 0.2011376, 1.762839, 1, 1, 1, 1, 1,
1.49084, -1.417681, 3.517443, 1, 1, 1, 1, 1,
1.507311, 0.3909334, 1.243678, 1, 1, 1, 1, 1,
1.512656, 0.1622508, 1.113317, 0, 0, 1, 1, 1,
1.523626, -0.2037465, 4.390461, 1, 0, 0, 1, 1,
1.524075, 0.9793725, 1.293304, 1, 0, 0, 1, 1,
1.530811, 0.8078991, 3.381442, 1, 0, 0, 1, 1,
1.540902, -0.6976803, -0.816582, 1, 0, 0, 1, 1,
1.545638, 0.7430001, 1.206468, 1, 0, 0, 1, 1,
1.561234, -0.6645678, 2.202713, 0, 0, 0, 1, 1,
1.595632, 0.7913393, 0.9718702, 0, 0, 0, 1, 1,
1.663419, -0.2510123, 2.401791, 0, 0, 0, 1, 1,
1.669946, 0.009452133, 1.227916, 0, 0, 0, 1, 1,
1.682168, 1.127545, -1.447497, 0, 0, 0, 1, 1,
1.685546, 0.2465862, 1.371173, 0, 0, 0, 1, 1,
1.690289, 0.9851456, 0.6233237, 0, 0, 0, 1, 1,
1.703423, 0.04493127, 1.489836, 1, 1, 1, 1, 1,
1.715464, 1.260136, -0.3796894, 1, 1, 1, 1, 1,
1.719191, -0.6296092, 2.29227, 1, 1, 1, 1, 1,
1.731135, 0.9589906, 1.539904, 1, 1, 1, 1, 1,
1.749584, -1.754215, 1.649644, 1, 1, 1, 1, 1,
1.75449, 0.07597353, 3.064429, 1, 1, 1, 1, 1,
1.762717, -1.326861, 4.540859, 1, 1, 1, 1, 1,
1.762929, 1.386975, 1.372796, 1, 1, 1, 1, 1,
1.771396, -1.07513, 0.7475111, 1, 1, 1, 1, 1,
1.774624, -1.382158, 1.452657, 1, 1, 1, 1, 1,
1.775094, 0.1507202, 1.691352, 1, 1, 1, 1, 1,
1.868235, -2.116175, 2.908896, 1, 1, 1, 1, 1,
1.893793, 0.5364071, 1.979568, 1, 1, 1, 1, 1,
1.897434, -1.096056, 0.7192413, 1, 1, 1, 1, 1,
1.897951, -0.114902, 1.298038, 1, 1, 1, 1, 1,
1.932594, 0.7297051, 2.518078, 0, 0, 1, 1, 1,
1.959154, 0.04041999, 4.004668, 1, 0, 0, 1, 1,
1.960902, 0.7640468, 0.9097227, 1, 0, 0, 1, 1,
1.962879, 0.465744, 0.6487949, 1, 0, 0, 1, 1,
1.970719, -0.08275415, -1.3672, 1, 0, 0, 1, 1,
2.005301, -0.989158, 2.297024, 1, 0, 0, 1, 1,
2.034144, 0.7282299, 1.820563, 0, 0, 0, 1, 1,
2.074228, -0.9630318, 3.037121, 0, 0, 0, 1, 1,
2.132041, -0.9879344, 2.649758, 0, 0, 0, 1, 1,
2.1325, -0.4599315, 1.407965, 0, 0, 0, 1, 1,
2.143738, 0.1735891, 0.8714027, 0, 0, 0, 1, 1,
2.155795, -1.004865, 2.728513, 0, 0, 0, 1, 1,
2.20636, 0.2114366, 2.384585, 0, 0, 0, 1, 1,
2.220476, -0.02201478, 3.357171, 1, 1, 1, 1, 1,
2.25907, 0.5942798, 1.296925, 1, 1, 1, 1, 1,
2.305645, 0.04206231, 1.382268, 1, 1, 1, 1, 1,
2.365054, -1.084526, 1.315892, 1, 1, 1, 1, 1,
2.608455, -0.8623899, 2.557538, 1, 1, 1, 1, 1,
3.0343, -0.2987772, 1.621191, 1, 1, 1, 1, 1,
3.193118, -0.03656318, 1.976289, 1, 1, 1, 1, 1
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
var radius = 9.670369;
var distance = 33.96676;
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
mvMatrix.translate( -0.06989956, -0.1581943, -0.198535 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96676);
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
