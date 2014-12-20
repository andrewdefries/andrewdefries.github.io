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
-3.547977, -1.019593, -1.386311, 1, 0, 0, 1,
-3.463364, 1.085078, -1.753255, 1, 0.007843138, 0, 1,
-3.022404, -0.6991318, -0.2874565, 1, 0.01176471, 0, 1,
-2.929025, 0.7295974, -0.5395659, 1, 0.01960784, 0, 1,
-2.741874, 0.7775319, -0.8052524, 1, 0.02352941, 0, 1,
-2.555314, -0.1250529, -2.401041, 1, 0.03137255, 0, 1,
-2.465123, 0.3765802, -3.422276, 1, 0.03529412, 0, 1,
-2.424707, 0.1971535, -1.157976, 1, 0.04313726, 0, 1,
-2.418832, 2.47781, -2.705013, 1, 0.04705882, 0, 1,
-2.39746, 1.550088, -1.453033, 1, 0.05490196, 0, 1,
-2.362015, -0.9617191, -1.617934, 1, 0.05882353, 0, 1,
-2.317409, 0.7589691, -2.361298, 1, 0.06666667, 0, 1,
-2.190284, -1.681497, -2.602305, 1, 0.07058824, 0, 1,
-2.183527, -0.3932259, -1.981792, 1, 0.07843138, 0, 1,
-2.16339, -0.5454389, -2.888048, 1, 0.08235294, 0, 1,
-2.158336, -0.6010162, -0.8150204, 1, 0.09019608, 0, 1,
-2.033072, 0.8965335, -2.092727, 1, 0.09411765, 0, 1,
-1.994199, 3.301304, -0.1947981, 1, 0.1019608, 0, 1,
-1.929217, -0.6855019, -2.032171, 1, 0.1098039, 0, 1,
-1.926081, 1.564529, -0.6215646, 1, 0.1137255, 0, 1,
-1.920325, -1.448423, -2.908045, 1, 0.1215686, 0, 1,
-1.918723, 0.4713717, -0.8449085, 1, 0.1254902, 0, 1,
-1.909024, -0.03024485, -0.4181514, 1, 0.1333333, 0, 1,
-1.908285, 0.05401976, -2.276741, 1, 0.1372549, 0, 1,
-1.876916, -1.756543, -2.357275, 1, 0.145098, 0, 1,
-1.862762, 0.5776456, -0.9961171, 1, 0.1490196, 0, 1,
-1.859414, -1.951671, -2.042814, 1, 0.1568628, 0, 1,
-1.834339, 0.2354077, -3.390716, 1, 0.1607843, 0, 1,
-1.830597, 0.6028457, -0.6901447, 1, 0.1686275, 0, 1,
-1.822641, 1.065068, -1.639439, 1, 0.172549, 0, 1,
-1.816971, 0.192831, -1.305459, 1, 0.1803922, 0, 1,
-1.799593, 1.631164, 0.2347458, 1, 0.1843137, 0, 1,
-1.798842, 1.230967, -1.07076, 1, 0.1921569, 0, 1,
-1.794032, -2.050048, -3.178617, 1, 0.1960784, 0, 1,
-1.786452, -1.073057, -1.803525, 1, 0.2039216, 0, 1,
-1.784862, 1.020381, -1.666248, 1, 0.2117647, 0, 1,
-1.773458, -0.7080123, -0.8090115, 1, 0.2156863, 0, 1,
-1.765584, -0.5254141, -1.510267, 1, 0.2235294, 0, 1,
-1.75058, -0.4524888, -0.4009727, 1, 0.227451, 0, 1,
-1.747235, -1.14242, -2.720743, 1, 0.2352941, 0, 1,
-1.742683, -0.6934248, -2.613536, 1, 0.2392157, 0, 1,
-1.733361, 0.284654, -0.7511784, 1, 0.2470588, 0, 1,
-1.732151, 0.3276846, -1.614208, 1, 0.2509804, 0, 1,
-1.730136, -0.8650907, -4.005013, 1, 0.2588235, 0, 1,
-1.716637, -0.192553, -1.174583, 1, 0.2627451, 0, 1,
-1.681975, -1.66035, -3.644126, 1, 0.2705882, 0, 1,
-1.66075, -0.8759909, 0.3419385, 1, 0.2745098, 0, 1,
-1.647569, 0.3302515, -1.411788, 1, 0.282353, 0, 1,
-1.635607, 0.7582233, 0.8847396, 1, 0.2862745, 0, 1,
-1.6337, 0.4734178, -2.97678, 1, 0.2941177, 0, 1,
-1.632106, 0.2244197, -1.868187, 1, 0.3019608, 0, 1,
-1.629038, -0.5290655, -0.3500527, 1, 0.3058824, 0, 1,
-1.623212, -0.2055541, -1.434242, 1, 0.3137255, 0, 1,
-1.622385, 0.3838645, -0.6326688, 1, 0.3176471, 0, 1,
-1.607554, 0.966064, -0.05261198, 1, 0.3254902, 0, 1,
-1.603337, -0.547616, -3.029953, 1, 0.3294118, 0, 1,
-1.601331, 0.08675046, -0.6861155, 1, 0.3372549, 0, 1,
-1.600018, 0.07125406, -0.9423175, 1, 0.3411765, 0, 1,
-1.594979, -0.6605379, -0.9789439, 1, 0.3490196, 0, 1,
-1.58332, -0.1808967, -1.464561, 1, 0.3529412, 0, 1,
-1.564167, -0.03035701, -0.8564476, 1, 0.3607843, 0, 1,
-1.563766, -0.7442362, -1.754307, 1, 0.3647059, 0, 1,
-1.556566, 1.426276, 0.2694938, 1, 0.372549, 0, 1,
-1.541274, -1.61295, -2.356714, 1, 0.3764706, 0, 1,
-1.519755, 0.7788209, -2.051781, 1, 0.3843137, 0, 1,
-1.516995, -0.4961957, -3.256483, 1, 0.3882353, 0, 1,
-1.511672, 1.132175, -1.479373, 1, 0.3960784, 0, 1,
-1.493195, 1.546688, -0.8725433, 1, 0.4039216, 0, 1,
-1.485609, -0.2573841, -0.3547117, 1, 0.4078431, 0, 1,
-1.484806, -0.6191108, -2.45528, 1, 0.4156863, 0, 1,
-1.483046, 0.1393588, -0.5258062, 1, 0.4196078, 0, 1,
-1.48154, 1.977296, 0.6330705, 1, 0.427451, 0, 1,
-1.480556, -1.928267, -3.007971, 1, 0.4313726, 0, 1,
-1.471551, -0.7810855, -0.8982835, 1, 0.4392157, 0, 1,
-1.470986, -0.009104874, -2.237066, 1, 0.4431373, 0, 1,
-1.458079, -1.354462, -3.480011, 1, 0.4509804, 0, 1,
-1.447015, -0.5076959, -1.253535, 1, 0.454902, 0, 1,
-1.443787, 0.01076372, -0.8381221, 1, 0.4627451, 0, 1,
-1.414874, -1.159508, -2.764102, 1, 0.4666667, 0, 1,
-1.414783, -1.018988, -1.932324, 1, 0.4745098, 0, 1,
-1.41081, 1.653572, -0.6806447, 1, 0.4784314, 0, 1,
-1.408687, -1.160829, -3.307921, 1, 0.4862745, 0, 1,
-1.408364, 0.3177122, -2.070231, 1, 0.4901961, 0, 1,
-1.403815, -0.8928196, -1.854202, 1, 0.4980392, 0, 1,
-1.394815, -0.2508012, -1.825126, 1, 0.5058824, 0, 1,
-1.394715, 1.760745, -0.2143035, 1, 0.509804, 0, 1,
-1.393471, 0.3605216, -1.714559, 1, 0.5176471, 0, 1,
-1.390127, 1.056913, -0.7882503, 1, 0.5215687, 0, 1,
-1.389638, 1.920505, -0.1277747, 1, 0.5294118, 0, 1,
-1.387152, 0.0725252, -1.08484, 1, 0.5333334, 0, 1,
-1.382374, 0.3086182, -2.149565, 1, 0.5411765, 0, 1,
-1.372636, 0.5353525, -2.921819, 1, 0.5450981, 0, 1,
-1.355724, 0.4853272, -2.987786, 1, 0.5529412, 0, 1,
-1.35415, -0.2199756, -2.573257, 1, 0.5568628, 0, 1,
-1.351858, -0.529705, -1.451538, 1, 0.5647059, 0, 1,
-1.349911, -0.4599096, -1.830374, 1, 0.5686275, 0, 1,
-1.337644, 0.002675785, -1.285526, 1, 0.5764706, 0, 1,
-1.331307, -0.2055708, -1.793444, 1, 0.5803922, 0, 1,
-1.330392, 0.5236295, 0.4972883, 1, 0.5882353, 0, 1,
-1.328849, -0.4010545, -2.329745, 1, 0.5921569, 0, 1,
-1.323741, -0.4337876, -2.732346, 1, 0.6, 0, 1,
-1.322284, -0.05287423, -2.169668, 1, 0.6078432, 0, 1,
-1.321366, -0.2735915, -2.516397, 1, 0.6117647, 0, 1,
-1.318697, -1.284448, -1.283132, 1, 0.6196079, 0, 1,
-1.317131, 0.5473175, -2.80168, 1, 0.6235294, 0, 1,
-1.317028, 0.04248504, -1.084922, 1, 0.6313726, 0, 1,
-1.310411, 0.138032, -1.510882, 1, 0.6352941, 0, 1,
-1.305164, 2.182374, 0.5932013, 1, 0.6431373, 0, 1,
-1.303478, 0.8745422, -1.533022, 1, 0.6470588, 0, 1,
-1.296921, -0.1625063, -0.9901698, 1, 0.654902, 0, 1,
-1.29412, 0.04221313, -0.6697096, 1, 0.6588235, 0, 1,
-1.28485, 1.305487, -0.2273455, 1, 0.6666667, 0, 1,
-1.284661, -0.1590323, -0.6606033, 1, 0.6705883, 0, 1,
-1.284006, 0.2882549, -1.559698, 1, 0.6784314, 0, 1,
-1.28006, 1.249296, 0.1927892, 1, 0.682353, 0, 1,
-1.278384, 0.5321408, -0.2765594, 1, 0.6901961, 0, 1,
-1.271838, -0.9936094, -3.82763, 1, 0.6941177, 0, 1,
-1.271176, 0.8487599, -0.01469248, 1, 0.7019608, 0, 1,
-1.2693, -1.305643, -3.064365, 1, 0.7098039, 0, 1,
-1.268282, -0.291811, -3.435819, 1, 0.7137255, 0, 1,
-1.263819, -0.7361139, -1.283425, 1, 0.7215686, 0, 1,
-1.254004, -1.036882, -3.232162, 1, 0.7254902, 0, 1,
-1.245125, 1.777471, 0.6428429, 1, 0.7333333, 0, 1,
-1.244992, -0.5580503, -1.721959, 1, 0.7372549, 0, 1,
-1.244769, 1.294429, 0.5494556, 1, 0.7450981, 0, 1,
-1.240516, 0.9570637, 0.8868253, 1, 0.7490196, 0, 1,
-1.238325, -0.5119504, -1.112181, 1, 0.7568628, 0, 1,
-1.233025, -0.1400804, -0.3711028, 1, 0.7607843, 0, 1,
-1.231045, 0.7092456, -0.4990762, 1, 0.7686275, 0, 1,
-1.203326, 0.3176875, -2.301452, 1, 0.772549, 0, 1,
-1.189032, 0.00519688, -1.729704, 1, 0.7803922, 0, 1,
-1.18293, 1.978886, -2.435722, 1, 0.7843137, 0, 1,
-1.180498, -1.504888, -2.643936, 1, 0.7921569, 0, 1,
-1.180267, -0.06702676, -1.761247, 1, 0.7960784, 0, 1,
-1.165648, -1.378283, -1.586028, 1, 0.8039216, 0, 1,
-1.161191, 1.198776, -3.229629, 1, 0.8117647, 0, 1,
-1.146082, -0.3830534, -1.584344, 1, 0.8156863, 0, 1,
-1.143481, 0.5636307, -1.508611, 1, 0.8235294, 0, 1,
-1.136389, -0.4489413, -2.920959, 1, 0.827451, 0, 1,
-1.13404, 0.1002209, 0.9543781, 1, 0.8352941, 0, 1,
-1.132203, -0.3281319, -0.7245287, 1, 0.8392157, 0, 1,
-1.129861, 0.5579475, -2.574852, 1, 0.8470588, 0, 1,
-1.122565, 0.6173532, -1.941764, 1, 0.8509804, 0, 1,
-1.118094, 0.6208669, -2.984648, 1, 0.8588235, 0, 1,
-1.11289, -2.017947, -2.576818, 1, 0.8627451, 0, 1,
-1.110544, -0.199646, -1.447744, 1, 0.8705882, 0, 1,
-1.108935, 0.3328439, 0.2855776, 1, 0.8745098, 0, 1,
-1.108325, -1.576115, -3.06315, 1, 0.8823529, 0, 1,
-1.097112, -1.144171, -3.323628, 1, 0.8862745, 0, 1,
-1.096698, 0.3487816, -0.9509785, 1, 0.8941177, 0, 1,
-1.092885, 0.7181221, -1.754801, 1, 0.8980392, 0, 1,
-1.090889, 0.3571135, -0.2511826, 1, 0.9058824, 0, 1,
-1.0693, 0.05524949, -1.123789, 1, 0.9137255, 0, 1,
-1.064193, -0.9610866, -2.079368, 1, 0.9176471, 0, 1,
-1.05825, 0.7787346, -0.7926173, 1, 0.9254902, 0, 1,
-1.053779, 1.240348, -0.2315944, 1, 0.9294118, 0, 1,
-1.05344, 1.189581, -0.3824147, 1, 0.9372549, 0, 1,
-1.047164, -0.6038437, -3.572556, 1, 0.9411765, 0, 1,
-1.041195, -1.569685, -2.630027, 1, 0.9490196, 0, 1,
-1.039894, 0.1672061, -0.9047266, 1, 0.9529412, 0, 1,
-1.035669, -1.607599, -1.035307, 1, 0.9607843, 0, 1,
-1.032055, 1.032824, -0.1093191, 1, 0.9647059, 0, 1,
-1.029518, 0.78561, -1.116695, 1, 0.972549, 0, 1,
-1.024778, -0.6936427, -2.676994, 1, 0.9764706, 0, 1,
-1.020998, 0.108571, -0.616055, 1, 0.9843137, 0, 1,
-1.018737, -0.8835667, -2.622321, 1, 0.9882353, 0, 1,
-1.014453, 1.481261, -1.824996, 1, 0.9960784, 0, 1,
-1.012841, -0.196929, -2.576042, 0.9960784, 1, 0, 1,
-1.012244, -0.2870383, -4.837633, 0.9921569, 1, 0, 1,
-1.00963, -0.3036379, -2.866458, 0.9843137, 1, 0, 1,
-1.008051, -1.363462, -1.757075, 0.9803922, 1, 0, 1,
-0.9957489, 0.1587334, -1.268348, 0.972549, 1, 0, 1,
-0.9935805, 0.3448448, -0.9689652, 0.9686275, 1, 0, 1,
-0.9910612, -0.5720621, -1.100718, 0.9607843, 1, 0, 1,
-0.9897842, 0.2743306, -2.016613, 0.9568627, 1, 0, 1,
-0.9889039, 0.1152673, 0.7090226, 0.9490196, 1, 0, 1,
-0.9822296, -0.4479036, -3.45358, 0.945098, 1, 0, 1,
-0.9817513, -0.813292, -2.936732, 0.9372549, 1, 0, 1,
-0.9768134, -0.3867939, -2.438484, 0.9333333, 1, 0, 1,
-0.9713134, 2.598678, 0.7515732, 0.9254902, 1, 0, 1,
-0.968742, 1.111099, -1.846446, 0.9215686, 1, 0, 1,
-0.9683797, 2.503391, -1.683144, 0.9137255, 1, 0, 1,
-0.9666421, -0.611209, -2.103483, 0.9098039, 1, 0, 1,
-0.9618263, -1.110373, -1.216342, 0.9019608, 1, 0, 1,
-0.9435854, -2.930114, -3.824818, 0.8941177, 1, 0, 1,
-0.9380134, 0.07506835, -1.370682, 0.8901961, 1, 0, 1,
-0.9376504, 0.3332154, -1.255908, 0.8823529, 1, 0, 1,
-0.9269463, 0.8149722, -2.122916, 0.8784314, 1, 0, 1,
-0.9245173, 0.1150559, -1.605976, 0.8705882, 1, 0, 1,
-0.9100406, 0.04638441, -1.206354, 0.8666667, 1, 0, 1,
-0.9097438, 1.507914, -0.7643895, 0.8588235, 1, 0, 1,
-0.9069896, -0.3180037, -3.078991, 0.854902, 1, 0, 1,
-0.9061763, 0.6244428, 0.1782112, 0.8470588, 1, 0, 1,
-0.8973592, -0.6685494, -2.569856, 0.8431373, 1, 0, 1,
-0.8960877, -0.03788854, -0.8317319, 0.8352941, 1, 0, 1,
-0.8959689, -1.27138, -3.472266, 0.8313726, 1, 0, 1,
-0.8943959, -1.635801, -3.55944, 0.8235294, 1, 0, 1,
-0.888863, -1.010374, -2.768724, 0.8196079, 1, 0, 1,
-0.8847036, 0.2013839, -2.239099, 0.8117647, 1, 0, 1,
-0.881341, -0.211561, -0.6584094, 0.8078431, 1, 0, 1,
-0.8599495, 1.700373, -0.3075986, 0.8, 1, 0, 1,
-0.8598192, -2.025574, -1.519892, 0.7921569, 1, 0, 1,
-0.8532927, 0.5388252, -2.070263, 0.7882353, 1, 0, 1,
-0.849446, -0.8182495, -2.40097, 0.7803922, 1, 0, 1,
-0.8458405, 0.601181, -1.350281, 0.7764706, 1, 0, 1,
-0.8433684, 0.7500516, -1.400047, 0.7686275, 1, 0, 1,
-0.8416006, -1.992315, -2.610742, 0.7647059, 1, 0, 1,
-0.8390316, -0.4093804, -1.925905, 0.7568628, 1, 0, 1,
-0.8363198, 0.1555706, -1.572858, 0.7529412, 1, 0, 1,
-0.8340272, 1.864885, 0.4201974, 0.7450981, 1, 0, 1,
-0.8257143, -2.222177, -2.290065, 0.7411765, 1, 0, 1,
-0.8235115, -0.731608, -1.612815, 0.7333333, 1, 0, 1,
-0.8211079, 0.1846587, -1.183581, 0.7294118, 1, 0, 1,
-0.8196777, -2.12271, -5.058505, 0.7215686, 1, 0, 1,
-0.8145719, 1.83514, -1.129096, 0.7176471, 1, 0, 1,
-0.8111367, 0.7472985, -0.9866734, 0.7098039, 1, 0, 1,
-0.8086116, -0.7516451, -0.9238391, 0.7058824, 1, 0, 1,
-0.8067341, 0.2305592, -0.3976843, 0.6980392, 1, 0, 1,
-0.8065069, -0.847747, -1.030655, 0.6901961, 1, 0, 1,
-0.7978072, -1.24866, -1.571277, 0.6862745, 1, 0, 1,
-0.7976688, -0.1105256, -2.858336, 0.6784314, 1, 0, 1,
-0.7957771, -1.297861, -3.687805, 0.6745098, 1, 0, 1,
-0.7799414, -1.964218, -2.852149, 0.6666667, 1, 0, 1,
-0.7747647, 0.7269601, -2.251305, 0.6627451, 1, 0, 1,
-0.7727451, -1.477999, -3.583807, 0.654902, 1, 0, 1,
-0.7617744, -1.753916, -3.097357, 0.6509804, 1, 0, 1,
-0.758679, 1.491802, 0.7085991, 0.6431373, 1, 0, 1,
-0.7564386, 0.1224814, -1.286265, 0.6392157, 1, 0, 1,
-0.7525588, -1.198076, -2.105839, 0.6313726, 1, 0, 1,
-0.7506209, -0.3851418, -2.709124, 0.627451, 1, 0, 1,
-0.7496581, 0.5400548, -1.374411, 0.6196079, 1, 0, 1,
-0.7471589, 1.332862, -1.159851, 0.6156863, 1, 0, 1,
-0.7467514, -0.2352156, -1.488908, 0.6078432, 1, 0, 1,
-0.7454677, 0.5214447, -1.893846, 0.6039216, 1, 0, 1,
-0.7412058, -0.3425896, -1.255003, 0.5960785, 1, 0, 1,
-0.7390578, 0.3876139, -1.412189, 0.5882353, 1, 0, 1,
-0.737121, 1.203723, -1.209364, 0.5843138, 1, 0, 1,
-0.732339, 0.1288769, -1.781691, 0.5764706, 1, 0, 1,
-0.7255981, 0.1541968, -1.077158, 0.572549, 1, 0, 1,
-0.7233852, 1.460777, -0.9584398, 0.5647059, 1, 0, 1,
-0.7222721, -1.638698, -2.372921, 0.5607843, 1, 0, 1,
-0.7211588, -1.459352, -1.168523, 0.5529412, 1, 0, 1,
-0.7152773, -0.6637456, -2.97072, 0.5490196, 1, 0, 1,
-0.7151532, 0.09776621, -1.779331, 0.5411765, 1, 0, 1,
-0.7122537, -2.676046, -3.192256, 0.5372549, 1, 0, 1,
-0.7094857, 0.9526948, -1.603586, 0.5294118, 1, 0, 1,
-0.7092693, 0.803135, -0.08415211, 0.5254902, 1, 0, 1,
-0.7051751, 1.663288, -1.256587, 0.5176471, 1, 0, 1,
-0.6979472, -1.063514, -3.151025, 0.5137255, 1, 0, 1,
-0.6975846, -0.2752713, -3.02888, 0.5058824, 1, 0, 1,
-0.687206, 0.5235219, -0.7579265, 0.5019608, 1, 0, 1,
-0.6865023, 1.625206, -1.067066, 0.4941176, 1, 0, 1,
-0.6765906, -0.3656172, -1.167946, 0.4862745, 1, 0, 1,
-0.6704184, 0.1765565, -2.768131, 0.4823529, 1, 0, 1,
-0.6547953, 1.850348, -0.6571719, 0.4745098, 1, 0, 1,
-0.6397066, -1.585684, -1.694507, 0.4705882, 1, 0, 1,
-0.639127, 0.285066, -0.7909155, 0.4627451, 1, 0, 1,
-0.6388226, 0.214245, -2.031087, 0.4588235, 1, 0, 1,
-0.6379185, 1.858979, 0.2106908, 0.4509804, 1, 0, 1,
-0.6363668, 2.049332, 2.089209, 0.4470588, 1, 0, 1,
-0.6346006, 1.79405, -0.3034786, 0.4392157, 1, 0, 1,
-0.6316139, -0.5489598, -1.760315, 0.4352941, 1, 0, 1,
-0.6295254, 1.938912, -0.9528117, 0.427451, 1, 0, 1,
-0.6288977, -0.4500226, -1.257509, 0.4235294, 1, 0, 1,
-0.6251252, 0.5457758, -2.041397, 0.4156863, 1, 0, 1,
-0.6228548, 0.1014404, -2.460552, 0.4117647, 1, 0, 1,
-0.6210554, -0.561483, -3.19249, 0.4039216, 1, 0, 1,
-0.6200724, -0.5329469, -1.971205, 0.3960784, 1, 0, 1,
-0.6197979, -0.3042152, -2.023902, 0.3921569, 1, 0, 1,
-0.6178918, 0.5601369, -0.6587908, 0.3843137, 1, 0, 1,
-0.6159559, -1.76029, -1.988191, 0.3803922, 1, 0, 1,
-0.6150697, -0.2225882, -1.491274, 0.372549, 1, 0, 1,
-0.6107867, -0.4212649, -2.136735, 0.3686275, 1, 0, 1,
-0.6077666, -0.9098435, -4.899713, 0.3607843, 1, 0, 1,
-0.597478, 0.3586598, -1.690398, 0.3568628, 1, 0, 1,
-0.5936038, -0.9007751, -2.51237, 0.3490196, 1, 0, 1,
-0.5891277, -1.082747, -3.179079, 0.345098, 1, 0, 1,
-0.5876016, 0.3284798, -1.235605, 0.3372549, 1, 0, 1,
-0.5868704, -0.1369566, -0.8918192, 0.3333333, 1, 0, 1,
-0.5844666, 0.4364591, 1.239836, 0.3254902, 1, 0, 1,
-0.5780225, -0.2569659, -0.455114, 0.3215686, 1, 0, 1,
-0.5769198, -0.5710799, -1.452043, 0.3137255, 1, 0, 1,
-0.5748972, -0.3346798, -3.337596, 0.3098039, 1, 0, 1,
-0.5731671, -0.3501126, -1.871953, 0.3019608, 1, 0, 1,
-0.5696754, -1.02849, -1.911536, 0.2941177, 1, 0, 1,
-0.563224, -0.162378, 0.1148356, 0.2901961, 1, 0, 1,
-0.5580004, -1.358287, -1.338987, 0.282353, 1, 0, 1,
-0.5567553, 1.262542, 1.211609, 0.2784314, 1, 0, 1,
-0.5514348, 0.9042343, -0.3498611, 0.2705882, 1, 0, 1,
-0.5490986, -1.066043, -1.098915, 0.2666667, 1, 0, 1,
-0.5455195, -1.693114, -2.405021, 0.2588235, 1, 0, 1,
-0.5454265, 0.7001948, -1.602277, 0.254902, 1, 0, 1,
-0.5424078, 0.04447165, -0.9243498, 0.2470588, 1, 0, 1,
-0.5421128, 1.062614, -0.9835274, 0.2431373, 1, 0, 1,
-0.5368406, 2.740737, 0.05043933, 0.2352941, 1, 0, 1,
-0.5336817, 1.064137, -1.06203, 0.2313726, 1, 0, 1,
-0.5328542, 0.7283004, -1.417721, 0.2235294, 1, 0, 1,
-0.5299171, -0.6070438, -2.31966, 0.2196078, 1, 0, 1,
-0.5286351, 1.181834, -1.163805, 0.2117647, 1, 0, 1,
-0.5265996, -0.1818722, -1.41656, 0.2078431, 1, 0, 1,
-0.5253866, -0.835474, -2.429312, 0.2, 1, 0, 1,
-0.5249275, 0.9806293, 0.1029416, 0.1921569, 1, 0, 1,
-0.5229242, -1.768136, -2.551009, 0.1882353, 1, 0, 1,
-0.522392, 1.339551, -0.2865736, 0.1803922, 1, 0, 1,
-0.5216531, -1.669889, -2.298238, 0.1764706, 1, 0, 1,
-0.5215017, -0.08671045, -1.499851, 0.1686275, 1, 0, 1,
-0.5184128, 1.622937, 0.5087369, 0.1647059, 1, 0, 1,
-0.5167117, -0.5017984, -1.514992, 0.1568628, 1, 0, 1,
-0.5147277, -0.6790866, -2.393126, 0.1529412, 1, 0, 1,
-0.5144224, 1.768865, 0.6358483, 0.145098, 1, 0, 1,
-0.513738, -1.230192, -1.707921, 0.1411765, 1, 0, 1,
-0.513197, -0.4704959, -2.618967, 0.1333333, 1, 0, 1,
-0.5127645, 0.4821859, -2.600023, 0.1294118, 1, 0, 1,
-0.5121542, -0.4753431, -2.108682, 0.1215686, 1, 0, 1,
-0.5103954, -0.074533, -0.827483, 0.1176471, 1, 0, 1,
-0.5096894, 0.1324286, -1.466483, 0.1098039, 1, 0, 1,
-0.5085053, 0.220531, -1.14702, 0.1058824, 1, 0, 1,
-0.5063913, -1.05583, -4.689364, 0.09803922, 1, 0, 1,
-0.4964378, 0.2964787, -0.3864973, 0.09019608, 1, 0, 1,
-0.493269, 1.157355, -0.0787067, 0.08627451, 1, 0, 1,
-0.4879491, 0.4437983, 0.2629046, 0.07843138, 1, 0, 1,
-0.4866762, 0.7048719, -0.8931208, 0.07450981, 1, 0, 1,
-0.4817184, -0.06424148, -0.8279279, 0.06666667, 1, 0, 1,
-0.4811714, -1.255268, -2.572785, 0.0627451, 1, 0, 1,
-0.480979, -0.258811, -0.4392998, 0.05490196, 1, 0, 1,
-0.477118, -1.842007, -3.189915, 0.05098039, 1, 0, 1,
-0.4722877, 0.5453843, -2.135587, 0.04313726, 1, 0, 1,
-0.4710432, -1.092162, -2.149533, 0.03921569, 1, 0, 1,
-0.4663975, -0.7677054, -2.964347, 0.03137255, 1, 0, 1,
-0.4606903, -1.418811, -3.361565, 0.02745098, 1, 0, 1,
-0.4598429, 1.272292, -0.436252, 0.01960784, 1, 0, 1,
-0.4598271, 0.5640145, -0.2810305, 0.01568628, 1, 0, 1,
-0.4590676, 0.1694433, -1.009419, 0.007843138, 1, 0, 1,
-0.4511603, -0.5992081, -3.01324, 0.003921569, 1, 0, 1,
-0.448451, -1.268671, -2.917351, 0, 1, 0.003921569, 1,
-0.4481358, 1.841858, -0.7600603, 0, 1, 0.01176471, 1,
-0.4464086, 1.266542, 1.674913, 0, 1, 0.01568628, 1,
-0.4398587, -0.5359455, -1.505763, 0, 1, 0.02352941, 1,
-0.4391503, 0.5559596, -0.8793827, 0, 1, 0.02745098, 1,
-0.4386635, -1.799597, -4.117552, 0, 1, 0.03529412, 1,
-0.4303833, 0.4123341, -1.054051, 0, 1, 0.03921569, 1,
-0.430037, 0.5112187, 0.1638565, 0, 1, 0.04705882, 1,
-0.4266136, 0.43904, 0.2619715, 0, 1, 0.05098039, 1,
-0.4249287, 1.015727, 0.1155167, 0, 1, 0.05882353, 1,
-0.424, -0.4896654, -2.811206, 0, 1, 0.0627451, 1,
-0.4131734, -1.005301, -0.9783587, 0, 1, 0.07058824, 1,
-0.4114417, -0.03375391, -0.7663169, 0, 1, 0.07450981, 1,
-0.4089502, 0.5455891, -1.320052, 0, 1, 0.08235294, 1,
-0.4084242, 0.7856925, -1.511535, 0, 1, 0.08627451, 1,
-0.4053812, -0.2585768, -1.794661, 0, 1, 0.09411765, 1,
-0.4035378, 0.1802001, -1.411924, 0, 1, 0.1019608, 1,
-0.4029589, -1.731603, -3.236177, 0, 1, 0.1058824, 1,
-0.3950008, -0.9357454, -2.3079, 0, 1, 0.1137255, 1,
-0.3939737, -0.156316, -1.57522, 0, 1, 0.1176471, 1,
-0.3915106, 0.02114302, -3.493768, 0, 1, 0.1254902, 1,
-0.3911414, -1.012641, -1.562981, 0, 1, 0.1294118, 1,
-0.3865677, -0.1862156, -1.840072, 0, 1, 0.1372549, 1,
-0.3862187, -0.418537, -2.613562, 0, 1, 0.1411765, 1,
-0.3826649, -0.428254, -0.5007327, 0, 1, 0.1490196, 1,
-0.3768472, -0.7736587, -4.059132, 0, 1, 0.1529412, 1,
-0.376004, -0.01174051, -0.5135077, 0, 1, 0.1607843, 1,
-0.3727809, -1.127636, -2.590822, 0, 1, 0.1647059, 1,
-0.3584612, -0.3417729, -1.938004, 0, 1, 0.172549, 1,
-0.3547144, 0.04007429, -1.636241, 0, 1, 0.1764706, 1,
-0.3486245, 0.3916984, -1.564481, 0, 1, 0.1843137, 1,
-0.3471645, 1.033202, 1.715411, 0, 1, 0.1882353, 1,
-0.3470728, 1.134163, -1.150389, 0, 1, 0.1960784, 1,
-0.3451771, -0.05106951, -1.473693, 0, 1, 0.2039216, 1,
-0.3400138, 0.1328866, -0.5080835, 0, 1, 0.2078431, 1,
-0.3392985, 1.04343, -0.4428164, 0, 1, 0.2156863, 1,
-0.3379109, 0.4232081, -0.6394764, 0, 1, 0.2196078, 1,
-0.3352595, -1.333864, -1.853693, 0, 1, 0.227451, 1,
-0.3329509, 1.958536, 0.1704663, 0, 1, 0.2313726, 1,
-0.3301683, -0.1515792, -0.626123, 0, 1, 0.2392157, 1,
-0.3277115, 0.1900939, -1.246163, 0, 1, 0.2431373, 1,
-0.3239833, -0.05772219, -0.864265, 0, 1, 0.2509804, 1,
-0.3228831, 1.437401, 0.3775266, 0, 1, 0.254902, 1,
-0.3226133, 0.5182961, -2.249882, 0, 1, 0.2627451, 1,
-0.3225854, 0.08888658, -1.292883, 0, 1, 0.2666667, 1,
-0.321489, 0.02720728, -2.854111, 0, 1, 0.2745098, 1,
-0.3172003, 1.404019, -0.5653264, 0, 1, 0.2784314, 1,
-0.3171181, -0.8895341, -3.108174, 0, 1, 0.2862745, 1,
-0.3068695, -2.294078, -2.003385, 0, 1, 0.2901961, 1,
-0.3052248, -0.7121382, -3.303367, 0, 1, 0.2980392, 1,
-0.2995183, 0.3473303, -1.124805, 0, 1, 0.3058824, 1,
-0.2972083, 2.157, -0.5849983, 0, 1, 0.3098039, 1,
-0.2773057, -1.007522, -3.310022, 0, 1, 0.3176471, 1,
-0.2756822, 0.03691024, 0.527647, 0, 1, 0.3215686, 1,
-0.2738239, -0.3127488, -4.059242, 0, 1, 0.3294118, 1,
-0.2656545, 0.215695, -0.04978137, 0, 1, 0.3333333, 1,
-0.2630868, -0.7458606, -1.628639, 0, 1, 0.3411765, 1,
-0.2621481, 0.006355121, -2.570229, 0, 1, 0.345098, 1,
-0.2617497, -0.2637517, -0.6972702, 0, 1, 0.3529412, 1,
-0.2598758, -1.966515, -1.130945, 0, 1, 0.3568628, 1,
-0.2573803, 0.4955848, -1.261778, 0, 1, 0.3647059, 1,
-0.2522025, -1.706482, -3.073511, 0, 1, 0.3686275, 1,
-0.2464821, -0.8786649, -3.333004, 0, 1, 0.3764706, 1,
-0.2444739, 1.441644, 0.05544115, 0, 1, 0.3803922, 1,
-0.2444162, -0.06802277, -2.526035, 0, 1, 0.3882353, 1,
-0.2437158, 0.5473752, 1.166941, 0, 1, 0.3921569, 1,
-0.2388748, -0.7625311, -1.668696, 0, 1, 0.4, 1,
-0.2329098, 0.5663738, 0.05140346, 0, 1, 0.4078431, 1,
-0.2327159, 1.675509, -0.1079921, 0, 1, 0.4117647, 1,
-0.2289309, -0.8523985, -2.037509, 0, 1, 0.4196078, 1,
-0.2254591, -0.9636858, -1.394452, 0, 1, 0.4235294, 1,
-0.2231517, 0.3145763, -0.5697904, 0, 1, 0.4313726, 1,
-0.220899, -0.3640896, -2.204884, 0, 1, 0.4352941, 1,
-0.220044, 0.5913616, -0.9338085, 0, 1, 0.4431373, 1,
-0.2196094, 0.4222903, -1.832377, 0, 1, 0.4470588, 1,
-0.2163759, 0.0731276, -1.044945, 0, 1, 0.454902, 1,
-0.2145778, -2.049502, -3.887798, 0, 1, 0.4588235, 1,
-0.2134107, -1.189774, -2.867784, 0, 1, 0.4666667, 1,
-0.2111132, -1.406795, -2.855174, 0, 1, 0.4705882, 1,
-0.207945, 0.4540977, -1.648737, 0, 1, 0.4784314, 1,
-0.2052661, -0.2599696, -2.087051, 0, 1, 0.4823529, 1,
-0.202148, 0.5417612, 0.4220495, 0, 1, 0.4901961, 1,
-0.2018157, -0.5084706, -3.014309, 0, 1, 0.4941176, 1,
-0.2016506, -1.245362, -3.389539, 0, 1, 0.5019608, 1,
-0.2004465, -1.683403, -2.641945, 0, 1, 0.509804, 1,
-0.1939076, 0.5397326, -0.9625658, 0, 1, 0.5137255, 1,
-0.1875399, 1.012152, -0.4061818, 0, 1, 0.5215687, 1,
-0.1867075, 1.087384, -1.049621, 0, 1, 0.5254902, 1,
-0.1864645, -1.932426, -2.934772, 0, 1, 0.5333334, 1,
-0.185812, -0.04900325, -0.7332759, 0, 1, 0.5372549, 1,
-0.1840111, -1.044114, -3.442984, 0, 1, 0.5450981, 1,
-0.1793596, -0.7476209, -2.051649, 0, 1, 0.5490196, 1,
-0.1791431, 1.275144, 0.2605819, 0, 1, 0.5568628, 1,
-0.1762243, -0.2589361, -3.121227, 0, 1, 0.5607843, 1,
-0.176076, 2.339807, -0.08459117, 0, 1, 0.5686275, 1,
-0.1756099, 0.02287682, -0.1545094, 0, 1, 0.572549, 1,
-0.1726466, -1.281069, -4.15916, 0, 1, 0.5803922, 1,
-0.1629138, -0.3821355, -5.062196, 0, 1, 0.5843138, 1,
-0.1615977, -0.9933677, -2.084925, 0, 1, 0.5921569, 1,
-0.1588668, 1.591315, 0.3726678, 0, 1, 0.5960785, 1,
-0.1588439, 1.572353, -0.7149914, 0, 1, 0.6039216, 1,
-0.1575345, -0.02947917, -2.269388, 0, 1, 0.6117647, 1,
-0.1547709, -0.820475, -3.002722, 0, 1, 0.6156863, 1,
-0.1520425, -0.3525414, -1.130178, 0, 1, 0.6235294, 1,
-0.151395, 0.4233336, -0.5738782, 0, 1, 0.627451, 1,
-0.1512197, -1.506452, -2.948992, 0, 1, 0.6352941, 1,
-0.1495433, 0.9017728, -0.2658945, 0, 1, 0.6392157, 1,
-0.1406538, -0.6100724, -2.823277, 0, 1, 0.6470588, 1,
-0.1403636, 0.8436819, 0.6176839, 0, 1, 0.6509804, 1,
-0.1395843, 1.521853, 2.278823, 0, 1, 0.6588235, 1,
-0.1391057, -0.04978671, -0.04478493, 0, 1, 0.6627451, 1,
-0.1379649, 1.38354, -1.570913, 0, 1, 0.6705883, 1,
-0.1264843, 0.4032365, -0.6753603, 0, 1, 0.6745098, 1,
-0.1251928, 2.269485, 0.8138899, 0, 1, 0.682353, 1,
-0.1243302, -0.3159332, -2.870115, 0, 1, 0.6862745, 1,
-0.1238684, -0.1656272, -2.804668, 0, 1, 0.6941177, 1,
-0.1221421, -0.8656645, -1.77983, 0, 1, 0.7019608, 1,
-0.1115281, -0.1409914, -2.66502, 0, 1, 0.7058824, 1,
-0.1112409, -0.4546313, -2.579735, 0, 1, 0.7137255, 1,
-0.1083523, 0.06157544, -0.9664747, 0, 1, 0.7176471, 1,
-0.1068075, -0.447698, -3.245492, 0, 1, 0.7254902, 1,
-0.1047997, -0.4896064, -2.588434, 0, 1, 0.7294118, 1,
-0.09937857, -0.6894988, -2.555205, 0, 1, 0.7372549, 1,
-0.09650629, 0.6314184, -1.09758, 0, 1, 0.7411765, 1,
-0.09551441, 1.417678, 2.843524, 0, 1, 0.7490196, 1,
-0.0946854, 0.3202526, -0.2141773, 0, 1, 0.7529412, 1,
-0.09412646, 0.04782785, -0.7792338, 0, 1, 0.7607843, 1,
-0.09388774, 0.1531142, 0.1195365, 0, 1, 0.7647059, 1,
-0.09275998, 0.373879, 0.9792743, 0, 1, 0.772549, 1,
-0.09242892, 1.372109, -1.864249, 0, 1, 0.7764706, 1,
-0.0885916, 0.5809646, 1.039378, 0, 1, 0.7843137, 1,
-0.08688518, -0.9989903, -3.146678, 0, 1, 0.7882353, 1,
-0.08574352, 0.05549678, -1.014035, 0, 1, 0.7960784, 1,
-0.07959201, -0.5521315, -4.346266, 0, 1, 0.8039216, 1,
-0.07518762, 0.2028952, -0.6944808, 0, 1, 0.8078431, 1,
-0.07432234, -0.9459245, -1.15393, 0, 1, 0.8156863, 1,
-0.06755129, -0.805145, -2.299981, 0, 1, 0.8196079, 1,
-0.06073208, 0.9783269, 0.7275764, 0, 1, 0.827451, 1,
-0.05877262, 1.139001, -0.7149195, 0, 1, 0.8313726, 1,
-0.05818961, 0.3202622, 0.01623902, 0, 1, 0.8392157, 1,
-0.05773631, 0.1198742, -1.738574, 0, 1, 0.8431373, 1,
-0.05378582, -0.1377285, -3.392363, 0, 1, 0.8509804, 1,
-0.05281131, 0.5641689, -0.1193839, 0, 1, 0.854902, 1,
-0.05236334, 0.03538341, -1.389438, 0, 1, 0.8627451, 1,
-0.05028467, -0.0499447, -1.431166, 0, 1, 0.8666667, 1,
-0.04925375, -0.9729732, -3.137635, 0, 1, 0.8745098, 1,
-0.04653253, -0.7837124, -1.616759, 0, 1, 0.8784314, 1,
-0.04432523, 0.379207, 1.506968, 0, 1, 0.8862745, 1,
-0.04034477, 1.877392, 0.637183, 0, 1, 0.8901961, 1,
-0.04020043, 0.5379941, 1.201948, 0, 1, 0.8980392, 1,
-0.03754792, 0.7796082, 0.6364289, 0, 1, 0.9058824, 1,
-0.03341566, 0.08539846, -1.825822, 0, 1, 0.9098039, 1,
-0.02823513, -0.637569, -1.471329, 0, 1, 0.9176471, 1,
-0.02793045, -1.502504, -1.389435, 0, 1, 0.9215686, 1,
-0.02711548, 0.1170941, -2.368937, 0, 1, 0.9294118, 1,
-0.02633684, 0.5253698, 0.1223951, 0, 1, 0.9333333, 1,
-0.02000562, 0.3086132, 0.3853619, 0, 1, 0.9411765, 1,
-0.01936707, 0.7831159, 0.1282063, 0, 1, 0.945098, 1,
-0.01627744, -0.9837515, -2.636877, 0, 1, 0.9529412, 1,
-0.01535719, 1.823209, 1.055629, 0, 1, 0.9568627, 1,
-0.0149988, 0.4314572, -0.1909153, 0, 1, 0.9647059, 1,
-0.01202061, -1.536319, -2.864597, 0, 1, 0.9686275, 1,
-0.005302558, 0.3060004, 0.08034837, 0, 1, 0.9764706, 1,
0.0005450034, 1.678604, -1.720124, 0, 1, 0.9803922, 1,
0.0009303484, 0.9529016, -0.2233139, 0, 1, 0.9882353, 1,
0.002101638, 0.6097209, -0.1491189, 0, 1, 0.9921569, 1,
0.002147974, 1.778633, -0.5171894, 0, 1, 1, 1,
0.002297921, 0.9677464, 1.764091, 0, 0.9921569, 1, 1,
0.00293496, -0.4152223, 3.853461, 0, 0.9882353, 1, 1,
0.003268748, 1.062215, -0.5792031, 0, 0.9803922, 1, 1,
0.003599167, 0.5502356, 1.505566, 0, 0.9764706, 1, 1,
0.005646416, 0.06386065, 1.43772, 0, 0.9686275, 1, 1,
0.009557169, 0.8764072, 0.7123898, 0, 0.9647059, 1, 1,
0.01310043, -0.5840722, 4.935994, 0, 0.9568627, 1, 1,
0.02866987, 0.3449813, 1.147886, 0, 0.9529412, 1, 1,
0.02870478, 0.05403412, -0.2420566, 0, 0.945098, 1, 1,
0.0314481, -0.2326899, 3.513014, 0, 0.9411765, 1, 1,
0.03255213, -1.348889, 2.561547, 0, 0.9333333, 1, 1,
0.03374856, 0.6707033, -1.211609, 0, 0.9294118, 1, 1,
0.03426617, -1.501593, 3.450882, 0, 0.9215686, 1, 1,
0.03525982, -0.6920845, 1.723721, 0, 0.9176471, 1, 1,
0.0407109, -0.545867, 3.68229, 0, 0.9098039, 1, 1,
0.04227389, 0.9581869, 1.108356, 0, 0.9058824, 1, 1,
0.0425196, -1.321734, 3.328583, 0, 0.8980392, 1, 1,
0.04401978, 1.770283, -1.757945, 0, 0.8901961, 1, 1,
0.04463785, 0.6996648, 1.211722, 0, 0.8862745, 1, 1,
0.05049609, 1.357336, 1.178177, 0, 0.8784314, 1, 1,
0.05361198, 2.34795, 1.410527, 0, 0.8745098, 1, 1,
0.05560692, -0.7475634, 1.707311, 0, 0.8666667, 1, 1,
0.05741668, 1.098572, 0.3131465, 0, 0.8627451, 1, 1,
0.05871417, 1.351648, 2.268388, 0, 0.854902, 1, 1,
0.06081283, -0.2326004, 2.550225, 0, 0.8509804, 1, 1,
0.06495167, -0.3447393, 1.637932, 0, 0.8431373, 1, 1,
0.06641982, 1.984339, -0.09326589, 0, 0.8392157, 1, 1,
0.06781682, 0.5270244, -0.07823082, 0, 0.8313726, 1, 1,
0.07130039, 1.854758, 0.3365425, 0, 0.827451, 1, 1,
0.07774404, 0.7160589, 0.08951449, 0, 0.8196079, 1, 1,
0.07954285, 0.3302203, 0.2110038, 0, 0.8156863, 1, 1,
0.08151705, 0.8945999, 0.3748437, 0, 0.8078431, 1, 1,
0.08666574, 1.544035, 0.3367385, 0, 0.8039216, 1, 1,
0.08746503, 1.895768, -0.2921292, 0, 0.7960784, 1, 1,
0.09748985, -1.161906, 4.111176, 0, 0.7882353, 1, 1,
0.09804571, 1.259024, 0.2399474, 0, 0.7843137, 1, 1,
0.09832293, -0.7213322, 1.939351, 0, 0.7764706, 1, 1,
0.1009853, 0.5255635, -0.3862211, 0, 0.772549, 1, 1,
0.1021021, -0.759689, 1.968813, 0, 0.7647059, 1, 1,
0.104896, 0.05797578, 0.1698159, 0, 0.7607843, 1, 1,
0.1058789, 0.3960713, 1.199706, 0, 0.7529412, 1, 1,
0.1068731, 1.243585, -0.653232, 0, 0.7490196, 1, 1,
0.1086196, 0.3504618, -0.4488005, 0, 0.7411765, 1, 1,
0.109014, 1.768624, 1.49392, 0, 0.7372549, 1, 1,
0.1102393, -1.557355, 1.039735, 0, 0.7294118, 1, 1,
0.1130399, -0.3605082, 2.606494, 0, 0.7254902, 1, 1,
0.1141356, -0.9587739, 3.281418, 0, 0.7176471, 1, 1,
0.1149438, 0.3358704, -0.004379497, 0, 0.7137255, 1, 1,
0.1245365, -0.783618, 3.778379, 0, 0.7058824, 1, 1,
0.1329903, -0.3778397, 2.789684, 0, 0.6980392, 1, 1,
0.1364591, 1.252401, 1.141152, 0, 0.6941177, 1, 1,
0.1373576, 0.5749804, 0.3768316, 0, 0.6862745, 1, 1,
0.1391174, -0.5755412, 3.124846, 0, 0.682353, 1, 1,
0.1452231, -1.246378, 1.80614, 0, 0.6745098, 1, 1,
0.1492269, 0.6740144, 1.882135, 0, 0.6705883, 1, 1,
0.1548434, -0.4436811, 1.634318, 0, 0.6627451, 1, 1,
0.1607516, -3.748546, 3.737696, 0, 0.6588235, 1, 1,
0.1648956, 0.2412935, 0.4711665, 0, 0.6509804, 1, 1,
0.1653517, -0.7511733, 1.106152, 0, 0.6470588, 1, 1,
0.1662229, -0.8796176, 2.311339, 0, 0.6392157, 1, 1,
0.1677346, -0.0924565, 3.76109, 0, 0.6352941, 1, 1,
0.1681652, 1.577612, 0.6845514, 0, 0.627451, 1, 1,
0.1685835, -0.04055033, 1.808172, 0, 0.6235294, 1, 1,
0.1695984, 0.6597747, 0.1936447, 0, 0.6156863, 1, 1,
0.170183, 0.479089, 1.527697, 0, 0.6117647, 1, 1,
0.1709968, -0.4584798, 4.642344, 0, 0.6039216, 1, 1,
0.1725732, 0.9021313, 0.9678828, 0, 0.5960785, 1, 1,
0.1747808, 0.397903, -0.07280847, 0, 0.5921569, 1, 1,
0.1755913, 0.8359799, 0.908546, 0, 0.5843138, 1, 1,
0.1757351, -1.365848, 3.637147, 0, 0.5803922, 1, 1,
0.1774804, 0.7217782, -0.9775625, 0, 0.572549, 1, 1,
0.1811945, -0.3369516, 3.667286, 0, 0.5686275, 1, 1,
0.1824424, -1.389582, 4.220582, 0, 0.5607843, 1, 1,
0.183225, 0.5452746, 0.163875, 0, 0.5568628, 1, 1,
0.1901747, -0.130708, 1.795752, 0, 0.5490196, 1, 1,
0.1956869, 0.099147, 0.8346937, 0, 0.5450981, 1, 1,
0.198841, 1.635997, -1.020646, 0, 0.5372549, 1, 1,
0.1992638, 0.7879027, 2.158154, 0, 0.5333334, 1, 1,
0.2008349, 0.1284161, 0.0233882, 0, 0.5254902, 1, 1,
0.2018275, -1.597447, 2.378337, 0, 0.5215687, 1, 1,
0.2031222, 0.4146709, 0.09855542, 0, 0.5137255, 1, 1,
0.2082593, -0.5743373, 2.625743, 0, 0.509804, 1, 1,
0.2098125, 2.63136, 0.03537568, 0, 0.5019608, 1, 1,
0.2138636, -0.4369805, 3.555516, 0, 0.4941176, 1, 1,
0.2225144, 1.197811, -0.840188, 0, 0.4901961, 1, 1,
0.2227187, 1.359596, -0.8490874, 0, 0.4823529, 1, 1,
0.224516, 0.6020178, 0.41589, 0, 0.4784314, 1, 1,
0.2251212, -0.568375, 4.124681, 0, 0.4705882, 1, 1,
0.2281765, -1.208727, 2.981413, 0, 0.4666667, 1, 1,
0.2293048, 0.5171809, -0.5046654, 0, 0.4588235, 1, 1,
0.2332647, 0.6381982, -0.1133294, 0, 0.454902, 1, 1,
0.2418444, -0.3777655, 2.910273, 0, 0.4470588, 1, 1,
0.243775, -1.488382, 4.133962, 0, 0.4431373, 1, 1,
0.2461217, 1.039533, -0.1719807, 0, 0.4352941, 1, 1,
0.2466566, -0.6729073, 1.367063, 0, 0.4313726, 1, 1,
0.253391, -0.6678246, 2.46655, 0, 0.4235294, 1, 1,
0.253498, -1.118586, 2.076019, 0, 0.4196078, 1, 1,
0.2590357, 1.451527, 1.041806, 0, 0.4117647, 1, 1,
0.2600904, 2.446895, -1.312767, 0, 0.4078431, 1, 1,
0.2653597, -0.3632553, 2.76231, 0, 0.4, 1, 1,
0.2697316, 1.074451, 0.7234291, 0, 0.3921569, 1, 1,
0.2701231, -0.3373424, 3.511393, 0, 0.3882353, 1, 1,
0.2817747, 1.103471, 0.1354251, 0, 0.3803922, 1, 1,
0.2832198, -0.5657578, 3.389652, 0, 0.3764706, 1, 1,
0.2853115, -0.724937, 3.645572, 0, 0.3686275, 1, 1,
0.2853531, -0.8290464, 1.233648, 0, 0.3647059, 1, 1,
0.2859405, 0.05400861, 1.084764, 0, 0.3568628, 1, 1,
0.2880189, 1.992612, -0.4507265, 0, 0.3529412, 1, 1,
0.2901267, 1.465367, -1.678624, 0, 0.345098, 1, 1,
0.2922107, 1.516234, 0.02055931, 0, 0.3411765, 1, 1,
0.2954934, -1.271545, 5.705308, 0, 0.3333333, 1, 1,
0.2996639, 1.496897, 0.06322464, 0, 0.3294118, 1, 1,
0.3021689, 0.00895277, 0.6831372, 0, 0.3215686, 1, 1,
0.3032417, -0.5608522, 2.296688, 0, 0.3176471, 1, 1,
0.3034132, 0.7080032, 0.2218497, 0, 0.3098039, 1, 1,
0.3120175, -0.9745232, 3.748069, 0, 0.3058824, 1, 1,
0.3125032, 0.2267994, 2.14882, 0, 0.2980392, 1, 1,
0.314218, 0.7372054, 2.194577, 0, 0.2901961, 1, 1,
0.315237, 0.2294913, -0.6825026, 0, 0.2862745, 1, 1,
0.3154011, -0.1240062, -0.2387275, 0, 0.2784314, 1, 1,
0.3209602, -0.5170508, 2.712467, 0, 0.2745098, 1, 1,
0.3210685, 1.155542, 1.225063, 0, 0.2666667, 1, 1,
0.3213233, -1.825685, 2.813749, 0, 0.2627451, 1, 1,
0.3218847, 0.7037877, 0.01353211, 0, 0.254902, 1, 1,
0.322465, 0.431224, 1.021763, 0, 0.2509804, 1, 1,
0.3269659, -2.03534, 4.2356, 0, 0.2431373, 1, 1,
0.328798, -0.1858274, 1.364733, 0, 0.2392157, 1, 1,
0.3295659, 1.109493, -0.1668702, 0, 0.2313726, 1, 1,
0.3323896, -0.2441652, 1.665291, 0, 0.227451, 1, 1,
0.3326994, 1.450359, -0.7764102, 0, 0.2196078, 1, 1,
0.3336827, 1.856731, -0.4319147, 0, 0.2156863, 1, 1,
0.339294, 0.06800856, 0.7630885, 0, 0.2078431, 1, 1,
0.3432355, -1.923107, 3.854045, 0, 0.2039216, 1, 1,
0.3442327, -0.472694, 1.198672, 0, 0.1960784, 1, 1,
0.348164, -1.399217, 0.2104162, 0, 0.1882353, 1, 1,
0.3483332, -0.3715616, 2.984264, 0, 0.1843137, 1, 1,
0.3540262, 0.7794971, 0.04346425, 0, 0.1764706, 1, 1,
0.357925, 0.6211981, 0.4671377, 0, 0.172549, 1, 1,
0.3594494, -0.005441704, 1.911756, 0, 0.1647059, 1, 1,
0.3627695, -1.084453, 3.664076, 0, 0.1607843, 1, 1,
0.363097, -1.061881, 1.975184, 0, 0.1529412, 1, 1,
0.3646805, 0.5800694, -0.5380314, 0, 0.1490196, 1, 1,
0.3658487, 0.1826961, 0.5219905, 0, 0.1411765, 1, 1,
0.3662463, 0.5209885, 0.812219, 0, 0.1372549, 1, 1,
0.3707407, -2.592822, 2.614791, 0, 0.1294118, 1, 1,
0.3721412, 1.125812, -0.5978436, 0, 0.1254902, 1, 1,
0.3781483, -1.263415, 4.130311, 0, 0.1176471, 1, 1,
0.3825999, -2.105265, 2.720053, 0, 0.1137255, 1, 1,
0.3837922, 0.1166873, 1.414259, 0, 0.1058824, 1, 1,
0.3853957, 0.4770919, -0.531085, 0, 0.09803922, 1, 1,
0.3885799, 1.368182, 0.767624, 0, 0.09411765, 1, 1,
0.3958669, 0.1459733, 2.557875, 0, 0.08627451, 1, 1,
0.4002413, -0.7662007, 3.509648, 0, 0.08235294, 1, 1,
0.4032148, 1.304812, -0.184229, 0, 0.07450981, 1, 1,
0.4040049, -0.7440535, 4.356833, 0, 0.07058824, 1, 1,
0.4069358, 0.02196375, 2.123876, 0, 0.0627451, 1, 1,
0.408315, -1.459873, 4.759991, 0, 0.05882353, 1, 1,
0.4087245, 0.9640189, 0.2989076, 0, 0.05098039, 1, 1,
0.4138807, -0.4513003, 1.273883, 0, 0.04705882, 1, 1,
0.4155176, 0.5603015, 0.9366472, 0, 0.03921569, 1, 1,
0.4162439, 0.2380361, 1.992899, 0, 0.03529412, 1, 1,
0.4180119, -0.3727804, 2.882901, 0, 0.02745098, 1, 1,
0.4191502, 0.7136678, -0.6497318, 0, 0.02352941, 1, 1,
0.420282, -0.3484429, 4.051293, 0, 0.01568628, 1, 1,
0.4253884, 0.4738065, 1.384472, 0, 0.01176471, 1, 1,
0.4277839, -1.840548, 4.393973, 0, 0.003921569, 1, 1,
0.4294678, -0.3560607, 1.521423, 0.003921569, 0, 1, 1,
0.4380082, 2.728897, 0.3564516, 0.007843138, 0, 1, 1,
0.4390515, -0.3328034, 3.855212, 0.01568628, 0, 1, 1,
0.4470216, 0.7729452, 1.046276, 0.01960784, 0, 1, 1,
0.4506106, 1.009054, -1.146165, 0.02745098, 0, 1, 1,
0.4514141, -0.3037317, 1.491127, 0.03137255, 0, 1, 1,
0.4519609, 0.009800617, 0.5795283, 0.03921569, 0, 1, 1,
0.452209, 1.302709, -1.834531, 0.04313726, 0, 1, 1,
0.4525512, -0.6833234, 3.007576, 0.05098039, 0, 1, 1,
0.4551772, 0.8774803, 0.1808302, 0.05490196, 0, 1, 1,
0.4565761, 0.05704474, 2.749593, 0.0627451, 0, 1, 1,
0.4588515, -0.4903843, 3.64286, 0.06666667, 0, 1, 1,
0.4597625, -0.4223647, 1.884476, 0.07450981, 0, 1, 1,
0.4711344, -0.9411825, 2.729449, 0.07843138, 0, 1, 1,
0.4726211, -1.53253, 2.841138, 0.08627451, 0, 1, 1,
0.4752296, 0.1257967, 1.002707, 0.09019608, 0, 1, 1,
0.4767833, -0.07375951, 3.410953, 0.09803922, 0, 1, 1,
0.4773821, 0.4005045, -0.9348366, 0.1058824, 0, 1, 1,
0.4779296, -0.3725709, 2.29532, 0.1098039, 0, 1, 1,
0.4818167, -1.110074, 1.721827, 0.1176471, 0, 1, 1,
0.4825226, -0.1422428, 2.384976, 0.1215686, 0, 1, 1,
0.4859745, 0.6120552, -0.08113486, 0.1294118, 0, 1, 1,
0.486474, 1.556406, 0.4152687, 0.1333333, 0, 1, 1,
0.4915246, 0.032621, 1.674321, 0.1411765, 0, 1, 1,
0.4967493, 1.343717, 1.536621, 0.145098, 0, 1, 1,
0.4978404, 1.675656, 1.806669, 0.1529412, 0, 1, 1,
0.4993249, -1.044798, 1.566594, 0.1568628, 0, 1, 1,
0.5053338, 1.467666, 1.608044, 0.1647059, 0, 1, 1,
0.5053781, 1.43169, 0.3762126, 0.1686275, 0, 1, 1,
0.5056984, 2.437256, 0.03840436, 0.1764706, 0, 1, 1,
0.505986, 1.008264, 1.121738, 0.1803922, 0, 1, 1,
0.5085059, -0.101343, 2.30284, 0.1882353, 0, 1, 1,
0.5107, -0.6028346, 2.139176, 0.1921569, 0, 1, 1,
0.517067, -1.175246, 2.232476, 0.2, 0, 1, 1,
0.5227357, 0.5194257, 2.569141, 0.2078431, 0, 1, 1,
0.5262147, -0.466817, 2.250835, 0.2117647, 0, 1, 1,
0.5306461, 0.7076347, 0.1277272, 0.2196078, 0, 1, 1,
0.530825, -1.039204, 0.8314274, 0.2235294, 0, 1, 1,
0.5325214, 0.08958022, 1.790987, 0.2313726, 0, 1, 1,
0.5359995, -0.8591888, 3.242798, 0.2352941, 0, 1, 1,
0.5373532, 0.9530672, 0.2684566, 0.2431373, 0, 1, 1,
0.5400587, 0.2758324, 3.718519, 0.2470588, 0, 1, 1,
0.5447933, 0.2520447, 0.5694566, 0.254902, 0, 1, 1,
0.5493101, -0.9361974, 1.380892, 0.2588235, 0, 1, 1,
0.5544724, 0.003343438, 0.5136879, 0.2666667, 0, 1, 1,
0.5568262, 1.337822, 0.9017628, 0.2705882, 0, 1, 1,
0.5585739, 1.338479, 0.7096173, 0.2784314, 0, 1, 1,
0.5591092, 1.974336, -0.02542548, 0.282353, 0, 1, 1,
0.5720448, -4.48834, 3.583928, 0.2901961, 0, 1, 1,
0.5721785, -0.265476, 1.149421, 0.2941177, 0, 1, 1,
0.5735304, -2.15639, 0.3776004, 0.3019608, 0, 1, 1,
0.575352, 0.08619213, 3.121514, 0.3098039, 0, 1, 1,
0.5757105, -0.6246414, 2.876884, 0.3137255, 0, 1, 1,
0.5779996, 0.4614119, -0.2669535, 0.3215686, 0, 1, 1,
0.5974638, 0.8819835, 1.486653, 0.3254902, 0, 1, 1,
0.5980501, -1.565788, 2.308408, 0.3333333, 0, 1, 1,
0.6044156, -0.476927, 2.327445, 0.3372549, 0, 1, 1,
0.6056939, 0.4352676, 0.8769547, 0.345098, 0, 1, 1,
0.6136802, -1.853268, 3.528128, 0.3490196, 0, 1, 1,
0.6161106, 1.767644, 0.08799478, 0.3568628, 0, 1, 1,
0.6185079, -0.8689175, 1.973867, 0.3607843, 0, 1, 1,
0.6216292, -0.7227322, 3.414238, 0.3686275, 0, 1, 1,
0.6221184, 0.844151, -0.3243917, 0.372549, 0, 1, 1,
0.6244515, -0.4697179, 1.498284, 0.3803922, 0, 1, 1,
0.6248878, -1.186222, 2.384199, 0.3843137, 0, 1, 1,
0.6289024, 0.2043159, 2.187153, 0.3921569, 0, 1, 1,
0.6348112, -0.6894615, 2.276138, 0.3960784, 0, 1, 1,
0.635134, -0.1038413, 2.250299, 0.4039216, 0, 1, 1,
0.6430092, -0.5011159, 1.274854, 0.4117647, 0, 1, 1,
0.6485819, 1.479475, -0.009950499, 0.4156863, 0, 1, 1,
0.6542056, 0.947805, 0.07875024, 0.4235294, 0, 1, 1,
0.6550095, -0.7720914, 3.026046, 0.427451, 0, 1, 1,
0.6562287, -1.318568, 2.532854, 0.4352941, 0, 1, 1,
0.6632604, -0.3183233, 2.508555, 0.4392157, 0, 1, 1,
0.6668732, 0.2099075, 2.05498, 0.4470588, 0, 1, 1,
0.6714612, 1.173012, 2.488971, 0.4509804, 0, 1, 1,
0.6719087, 0.6199014, 1.203216, 0.4588235, 0, 1, 1,
0.6724038, -0.8631552, 4.296834, 0.4627451, 0, 1, 1,
0.6727375, -0.3152313, 1.897536, 0.4705882, 0, 1, 1,
0.6892241, 0.1599229, 0.7344074, 0.4745098, 0, 1, 1,
0.6909065, -2.333198, 1.449278, 0.4823529, 0, 1, 1,
0.6921444, 0.6813866, 1.39009, 0.4862745, 0, 1, 1,
0.6923282, 0.2914338, 1.521737, 0.4941176, 0, 1, 1,
0.6985695, -0.08745634, 1.452979, 0.5019608, 0, 1, 1,
0.7037761, -0.1030809, 0.9831771, 0.5058824, 0, 1, 1,
0.7038413, 1.346695, 1.935184, 0.5137255, 0, 1, 1,
0.7044801, 0.5724929, 1.858565, 0.5176471, 0, 1, 1,
0.7074285, 0.1551521, 2.760183, 0.5254902, 0, 1, 1,
0.7078472, -0.09885426, 2.905028, 0.5294118, 0, 1, 1,
0.7079162, -1.895596, 3.708282, 0.5372549, 0, 1, 1,
0.7096564, 0.441599, 0.7610849, 0.5411765, 0, 1, 1,
0.7115391, 0.4762507, -1.649097, 0.5490196, 0, 1, 1,
0.7132831, 0.1325514, 0.7356094, 0.5529412, 0, 1, 1,
0.7229289, 0.7595332, 1.247001, 0.5607843, 0, 1, 1,
0.7255734, 0.262271, 0.666405, 0.5647059, 0, 1, 1,
0.7307588, -0.2718716, 0.7829628, 0.572549, 0, 1, 1,
0.7342677, 0.08960285, -0.3649323, 0.5764706, 0, 1, 1,
0.7436028, -0.3042898, 2.433268, 0.5843138, 0, 1, 1,
0.7440764, -1.453117, 3.815433, 0.5882353, 0, 1, 1,
0.7460232, -1.209987, 1.879521, 0.5960785, 0, 1, 1,
0.7526008, -0.09399094, 0.8848335, 0.6039216, 0, 1, 1,
0.7571172, 0.7599245, -0.05949659, 0.6078432, 0, 1, 1,
0.7598608, -2.282661, 4.749578, 0.6156863, 0, 1, 1,
0.7612077, -1.828021, 1.999893, 0.6196079, 0, 1, 1,
0.7633364, 0.9851511, -0.7032344, 0.627451, 0, 1, 1,
0.7644903, -1.983637, 3.567966, 0.6313726, 0, 1, 1,
0.7651883, -0.1575856, 1.598359, 0.6392157, 0, 1, 1,
0.7652078, 1.274998, 1.115563, 0.6431373, 0, 1, 1,
0.7668565, 1.105544, -0.3010502, 0.6509804, 0, 1, 1,
0.7735707, 0.1821623, -0.4606631, 0.654902, 0, 1, 1,
0.7747877, 0.2204241, 0.6941495, 0.6627451, 0, 1, 1,
0.7768572, -1.181876, 2.981395, 0.6666667, 0, 1, 1,
0.7772592, -0.1606251, 1.712417, 0.6745098, 0, 1, 1,
0.7836288, -0.6911102, 2.233654, 0.6784314, 0, 1, 1,
0.7946389, -0.6409494, 2.629519, 0.6862745, 0, 1, 1,
0.7966464, -0.2288146, 3.380227, 0.6901961, 0, 1, 1,
0.8001775, 0.1373571, -0.6807442, 0.6980392, 0, 1, 1,
0.8095651, -0.3747343, 3.391718, 0.7058824, 0, 1, 1,
0.8113946, -0.05589656, 1.943411, 0.7098039, 0, 1, 1,
0.8131117, 0.03338927, 2.243744, 0.7176471, 0, 1, 1,
0.8193675, -1.260069, 2.001383, 0.7215686, 0, 1, 1,
0.8204771, 0.9859247, -2.528862, 0.7294118, 0, 1, 1,
0.8308412, 0.320528, 2.616776, 0.7333333, 0, 1, 1,
0.8309294, -1.191392, 3.44277, 0.7411765, 0, 1, 1,
0.8349434, -0.3142587, 0.4091842, 0.7450981, 0, 1, 1,
0.8349701, 0.9544508, 1.915619, 0.7529412, 0, 1, 1,
0.8353651, 1.509335, 1.550136, 0.7568628, 0, 1, 1,
0.8413193, -0.7776754, 1.386123, 0.7647059, 0, 1, 1,
0.8424296, 1.427278, 0.9354182, 0.7686275, 0, 1, 1,
0.8461373, -1.512183, 2.277419, 0.7764706, 0, 1, 1,
0.8598206, -1.35253, 3.354429, 0.7803922, 0, 1, 1,
0.8655823, -0.4284221, 1.927612, 0.7882353, 0, 1, 1,
0.86965, 0.9861385, -0.818225, 0.7921569, 0, 1, 1,
0.8713929, -2.483836, 2.063431, 0.8, 0, 1, 1,
0.8736475, -1.987317, 3.716181, 0.8078431, 0, 1, 1,
0.8751013, -1.126541, 3.236974, 0.8117647, 0, 1, 1,
0.8768958, 1.026298, 0.07479748, 0.8196079, 0, 1, 1,
0.8823119, 0.09624872, -0.6163083, 0.8235294, 0, 1, 1,
0.8832862, -0.7844364, 1.984031, 0.8313726, 0, 1, 1,
0.8833334, -0.0351209, 3.067388, 0.8352941, 0, 1, 1,
0.8841226, 0.3227785, 1.988562, 0.8431373, 0, 1, 1,
0.8881705, 0.5299276, 1.814586, 0.8470588, 0, 1, 1,
0.8902531, 1.723628, 1.628133, 0.854902, 0, 1, 1,
0.8913225, -1.229658, 1.259367, 0.8588235, 0, 1, 1,
0.8936204, 0.671097, 1.501122, 0.8666667, 0, 1, 1,
0.8959258, 1.993795, 0.4196338, 0.8705882, 0, 1, 1,
0.8980678, -0.7901134, 2.972802, 0.8784314, 0, 1, 1,
0.8982002, -0.9574746, 2.254614, 0.8823529, 0, 1, 1,
0.9023544, -0.04922526, 1.74821, 0.8901961, 0, 1, 1,
0.9027734, 0.9718325, -0.4628685, 0.8941177, 0, 1, 1,
0.9072576, 2.340685, -0.7146567, 0.9019608, 0, 1, 1,
0.9102838, 1.188786, -0.8777014, 0.9098039, 0, 1, 1,
0.9131212, 0.1933945, 1.324679, 0.9137255, 0, 1, 1,
0.917843, -0.8161175, 2.570389, 0.9215686, 0, 1, 1,
0.922035, -0.3780453, 2.176634, 0.9254902, 0, 1, 1,
0.9234188, 0.6208367, 3.591348, 0.9333333, 0, 1, 1,
0.9272804, -1.370188, 3.446159, 0.9372549, 0, 1, 1,
0.9296008, -1.776404, 2.211814, 0.945098, 0, 1, 1,
0.9331059, -0.6371104, 4.729331, 0.9490196, 0, 1, 1,
0.9355544, -0.8370251, 1.217629, 0.9568627, 0, 1, 1,
0.9386434, 0.4600247, 1.515992, 0.9607843, 0, 1, 1,
0.938971, -0.2950221, 2.358285, 0.9686275, 0, 1, 1,
0.946669, -0.05199269, 2.59072, 0.972549, 0, 1, 1,
0.9470981, -0.6317697, 3.045151, 0.9803922, 0, 1, 1,
0.9531632, -0.2856189, 1.40191, 0.9843137, 0, 1, 1,
0.9560588, -0.4168963, 2.867519, 0.9921569, 0, 1, 1,
0.9570627, -0.2409898, -0.217659, 0.9960784, 0, 1, 1,
0.9604343, 0.08956928, 1.746519, 1, 0, 0.9960784, 1,
0.964199, 0.003004019, 0.2308348, 1, 0, 0.9882353, 1,
0.9649187, -1.223017, 4.487885, 1, 0, 0.9843137, 1,
0.9655872, -0.6780265, 2.882139, 1, 0, 0.9764706, 1,
0.9684375, -0.4589105, 2.796616, 1, 0, 0.972549, 1,
0.970378, -0.5534101, 2.169524, 1, 0, 0.9647059, 1,
0.975536, 0.8826388, 1.082522, 1, 0, 0.9607843, 1,
0.9766786, -0.7560379, 1.346362, 1, 0, 0.9529412, 1,
0.9772966, 0.5775881, 0.1174556, 1, 0, 0.9490196, 1,
0.9912939, 0.9655088, 1.136885, 1, 0, 0.9411765, 1,
0.9995196, 1.078081, 0.1900325, 1, 0, 0.9372549, 1,
1.011262, -1.989086, 2.087056, 1, 0, 0.9294118, 1,
1.012947, -1.360249, 4.258725, 1, 0, 0.9254902, 1,
1.019542, 0.6986257, -0.2176647, 1, 0, 0.9176471, 1,
1.021072, 0.1026712, 1.568723, 1, 0, 0.9137255, 1,
1.026678, -0.2244433, 2.440216, 1, 0, 0.9058824, 1,
1.036047, -0.4775652, 0.8071193, 1, 0, 0.9019608, 1,
1.042342, 0.4276569, -1.236936, 1, 0, 0.8941177, 1,
1.047192, 0.7672462, 0.127933, 1, 0, 0.8862745, 1,
1.048017, 0.427471, 1.806649, 1, 0, 0.8823529, 1,
1.048132, 0.1029156, 2.210884, 1, 0, 0.8745098, 1,
1.054649, -1.404313, 1.796702, 1, 0, 0.8705882, 1,
1.059546, -0.4146377, 0.09225403, 1, 0, 0.8627451, 1,
1.061039, -1.810915, 3.868561, 1, 0, 0.8588235, 1,
1.062825, -0.1239408, 2.350431, 1, 0, 0.8509804, 1,
1.063654, -1.197403, 1.952402, 1, 0, 0.8470588, 1,
1.064264, -0.3361583, 0.8299167, 1, 0, 0.8392157, 1,
1.06594, -1.608824, 0.5339158, 1, 0, 0.8352941, 1,
1.08003, -0.6514812, 3.118066, 1, 0, 0.827451, 1,
1.082659, -0.1968148, 1.673203, 1, 0, 0.8235294, 1,
1.082961, -1.068471, 1.332545, 1, 0, 0.8156863, 1,
1.084625, 2.296894, -0.1078764, 1, 0, 0.8117647, 1,
1.089203, -2.217077, 2.052697, 1, 0, 0.8039216, 1,
1.091066, 1.089409, 0.7311813, 1, 0, 0.7960784, 1,
1.091378, -0.4667092, 2.878382, 1, 0, 0.7921569, 1,
1.094567, -0.5622594, 3.193662, 1, 0, 0.7843137, 1,
1.101583, 1.141249, 2.20154, 1, 0, 0.7803922, 1,
1.110612, 0.548849, 0.6024173, 1, 0, 0.772549, 1,
1.12258, 0.2187395, 2.410398, 1, 0, 0.7686275, 1,
1.128154, -0.8239855, 2.711206, 1, 0, 0.7607843, 1,
1.134204, -0.5638039, 2.730445, 1, 0, 0.7568628, 1,
1.136751, 0.1569685, 0.2997573, 1, 0, 0.7490196, 1,
1.163615, -1.683532, 2.121268, 1, 0, 0.7450981, 1,
1.165515, -1.379922, 3.36808, 1, 0, 0.7372549, 1,
1.173479, 0.1299447, 1.350981, 1, 0, 0.7333333, 1,
1.180878, -1.359739, 0.8612261, 1, 0, 0.7254902, 1,
1.183236, 0.04490525, 2.346871, 1, 0, 0.7215686, 1,
1.184066, -1.014227, 2.341781, 1, 0, 0.7137255, 1,
1.186744, -0.06571552, 1.937676, 1, 0, 0.7098039, 1,
1.187667, 0.635921, 1.62101, 1, 0, 0.7019608, 1,
1.188633, -1.297764, 2.138331, 1, 0, 0.6941177, 1,
1.196402, -1.634559, 1.350588, 1, 0, 0.6901961, 1,
1.197691, -0.5550064, 2.25237, 1, 0, 0.682353, 1,
1.199435, -0.6480405, 3.26732, 1, 0, 0.6784314, 1,
1.2017, 0.7806615, -0.4548818, 1, 0, 0.6705883, 1,
1.222687, 0.690716, 0.8096663, 1, 0, 0.6666667, 1,
1.225323, -0.5312876, 0.7707763, 1, 0, 0.6588235, 1,
1.230288, -0.4076384, 0.83282, 1, 0, 0.654902, 1,
1.230372, 0.5917208, -1.042066, 1, 0, 0.6470588, 1,
1.236632, -1.755813, 3.481114, 1, 0, 0.6431373, 1,
1.248511, -0.7118896, 2.171919, 1, 0, 0.6352941, 1,
1.250609, 1.091721, -0.608852, 1, 0, 0.6313726, 1,
1.262596, 0.09629487, 1.677798, 1, 0, 0.6235294, 1,
1.263416, 0.864989, 0.8845236, 1, 0, 0.6196079, 1,
1.264442, 1.4623, 1.246047, 1, 0, 0.6117647, 1,
1.267294, -1.52909, 2.272944, 1, 0, 0.6078432, 1,
1.270082, 0.1366709, 1.358169, 1, 0, 0.6, 1,
1.283573, 0.9095458, 1.310347, 1, 0, 0.5921569, 1,
1.291738, -0.1850975, 0.2800938, 1, 0, 0.5882353, 1,
1.296214, -0.1879311, 1.802005, 1, 0, 0.5803922, 1,
1.300709, -0.03168395, 1.516293, 1, 0, 0.5764706, 1,
1.301797, 0.961136, -0.4604801, 1, 0, 0.5686275, 1,
1.304091, 0.6610313, 0.2131931, 1, 0, 0.5647059, 1,
1.33573, 1.075476, 0.8133414, 1, 0, 0.5568628, 1,
1.340324, 1.748508, 1.476561, 1, 0, 0.5529412, 1,
1.361485, 0.4803314, 1.979753, 1, 0, 0.5450981, 1,
1.362091, 0.4590741, 1.530014, 1, 0, 0.5411765, 1,
1.368709, 0.846626, 1.332257, 1, 0, 0.5333334, 1,
1.368769, -0.0429854, 2.223688, 1, 0, 0.5294118, 1,
1.37804, -0.8297161, 2.157364, 1, 0, 0.5215687, 1,
1.380855, -1.023475, 1.425709, 1, 0, 0.5176471, 1,
1.384396, 0.1224322, 1.522561, 1, 0, 0.509804, 1,
1.395013, 0.8049757, -0.6972479, 1, 0, 0.5058824, 1,
1.398628, 0.7620487, -1.321008, 1, 0, 0.4980392, 1,
1.402277, -1.498152, 2.501764, 1, 0, 0.4901961, 1,
1.411135, -1.107099, 1.822564, 1, 0, 0.4862745, 1,
1.413521, -0.2852987, 2.435127, 1, 0, 0.4784314, 1,
1.415317, -1.126912, 1.525074, 1, 0, 0.4745098, 1,
1.417404, -0.2059201, 1.24656, 1, 0, 0.4666667, 1,
1.418333, 0.04866342, 2.080378, 1, 0, 0.4627451, 1,
1.423506, -0.2949117, 1.725632, 1, 0, 0.454902, 1,
1.428281, -0.3040785, 1.081015, 1, 0, 0.4509804, 1,
1.438805, 0.877822, 1.000176, 1, 0, 0.4431373, 1,
1.449137, -1.133437, 1.612776, 1, 0, 0.4392157, 1,
1.452795, -0.5234847, 1.8527, 1, 0, 0.4313726, 1,
1.469738, -0.5228581, 1.331106, 1, 0, 0.427451, 1,
1.469939, 0.08287577, 2.912199, 1, 0, 0.4196078, 1,
1.469972, -1.149192, 0.9049931, 1, 0, 0.4156863, 1,
1.471553, -1.538858, 1.113611, 1, 0, 0.4078431, 1,
1.478697, 0.4657817, 0.6798089, 1, 0, 0.4039216, 1,
1.485242, 0.1748972, 1.882107, 1, 0, 0.3960784, 1,
1.486015, -1.566342, 1.58846, 1, 0, 0.3882353, 1,
1.486559, -0.2555918, 0.7860851, 1, 0, 0.3843137, 1,
1.48761, 0.7209172, -0.3982276, 1, 0, 0.3764706, 1,
1.491704, 0.5164732, 0.4873889, 1, 0, 0.372549, 1,
1.510825, -0.4762692, 3.333846, 1, 0, 0.3647059, 1,
1.523408, 0.2820964, 1.140947, 1, 0, 0.3607843, 1,
1.531741, 0.5387591, 1.624227, 1, 0, 0.3529412, 1,
1.565107, -1.318043, 4.103107, 1, 0, 0.3490196, 1,
1.571819, -1.160654, 1.360357, 1, 0, 0.3411765, 1,
1.579757, -0.07210988, -0.2074119, 1, 0, 0.3372549, 1,
1.582011, 1.776208, 0.667964, 1, 0, 0.3294118, 1,
1.589327, -0.8823223, 1.588504, 1, 0, 0.3254902, 1,
1.597247, 0.2022067, 2.782302, 1, 0, 0.3176471, 1,
1.622448, 0.04973252, 2.533177, 1, 0, 0.3137255, 1,
1.642887, 1.021885, 0.9012681, 1, 0, 0.3058824, 1,
1.655572, -1.400431, 3.083725, 1, 0, 0.2980392, 1,
1.657079, -0.918047, 1.439601, 1, 0, 0.2941177, 1,
1.673042, -0.5825486, 1.396274, 1, 0, 0.2862745, 1,
1.674227, 0.4866304, 3.144504, 1, 0, 0.282353, 1,
1.676878, 0.6622881, 1.452098, 1, 0, 0.2745098, 1,
1.683003, -0.6815262, 1.388123, 1, 0, 0.2705882, 1,
1.693163, -0.3724551, 1.220297, 1, 0, 0.2627451, 1,
1.712416, 1.045699, -0.251163, 1, 0, 0.2588235, 1,
1.717071, 1.952523, 1.460796, 1, 0, 0.2509804, 1,
1.7402, -0.2735849, 3.057489, 1, 0, 0.2470588, 1,
1.743609, 0.4617371, 2.221121, 1, 0, 0.2392157, 1,
1.752036, -1.355374, 1.603468, 1, 0, 0.2352941, 1,
1.761944, 0.8589697, 1.592695, 1, 0, 0.227451, 1,
1.768648, -1.061001, 2.10769, 1, 0, 0.2235294, 1,
1.773476, -1.902485, 2.261338, 1, 0, 0.2156863, 1,
1.777085, -0.2450307, 1.728555, 1, 0, 0.2117647, 1,
1.792637, -0.007990058, 0.6754483, 1, 0, 0.2039216, 1,
1.806523, -0.6213439, 2.489458, 1, 0, 0.1960784, 1,
1.83028, -2.820228, 1.843184, 1, 0, 0.1921569, 1,
1.854376, -1.167072, 2.608521, 1, 0, 0.1843137, 1,
1.856515, 0.7728598, 0.6500131, 1, 0, 0.1803922, 1,
1.86272, 1.414349, 0.7197976, 1, 0, 0.172549, 1,
1.869546, -1.667639, 2.701152, 1, 0, 0.1686275, 1,
1.890475, -0.8113071, 1.563801, 1, 0, 0.1607843, 1,
1.951838, 0.5877497, 1.060796, 1, 0, 0.1568628, 1,
1.957889, -0.1744841, 1.671999, 1, 0, 0.1490196, 1,
1.96698, 0.7318556, 2.244469, 1, 0, 0.145098, 1,
1.975744, 1.208428, 0.3620398, 1, 0, 0.1372549, 1,
1.983701, -1.723071, 2.694038, 1, 0, 0.1333333, 1,
1.999924, 0.7951524, 1.917919, 1, 0, 0.1254902, 1,
2.010103, 0.195162, 1.561152, 1, 0, 0.1215686, 1,
2.011325, -1.711487, 2.013758, 1, 0, 0.1137255, 1,
2.013952, -0.7388988, 1.166435, 1, 0, 0.1098039, 1,
2.0711, 1.369573, 0.566079, 1, 0, 0.1019608, 1,
2.077663, 1.214983, 1.460775, 1, 0, 0.09411765, 1,
2.099734, 1.214666, -0.4922127, 1, 0, 0.09019608, 1,
2.105602, 1.73992, 1.121216, 1, 0, 0.08235294, 1,
2.144683, -0.4855546, 2.131469, 1, 0, 0.07843138, 1,
2.153954, 0.3708164, -0.7902697, 1, 0, 0.07058824, 1,
2.204488, -0.4184246, -0.4419873, 1, 0, 0.06666667, 1,
2.214051, 1.620253, 1.37509, 1, 0, 0.05882353, 1,
2.228798, 0.05928219, 0.8938033, 1, 0, 0.05490196, 1,
2.228809, 0.1338857, 1.532689, 1, 0, 0.04705882, 1,
2.243074, -0.01690832, 2.630317, 1, 0, 0.04313726, 1,
2.331487, 1.025762, 1.747749, 1, 0, 0.03529412, 1,
2.34902, -1.1769, 2.02659, 1, 0, 0.03137255, 1,
2.364479, 0.3168411, 2.203097, 1, 0, 0.02352941, 1,
2.542665, -1.732406, 0.448819, 1, 0, 0.01960784, 1,
2.99152, -0.1689586, 1.295482, 1, 0, 0.01176471, 1,
3.079918, 0.6852729, 3.012461, 1, 0, 0.007843138, 1
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
-0.2340293, -5.808685, -6.887288, 0, -0.5, 0.5, 0.5,
-0.2340293, -5.808685, -6.887288, 1, -0.5, 0.5, 0.5,
-0.2340293, -5.808685, -6.887288, 1, 1.5, 0.5, 0.5,
-0.2340293, -5.808685, -6.887288, 0, 1.5, 0.5, 0.5
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
-4.671405, -0.5935184, -6.887288, 0, -0.5, 0.5, 0.5,
-4.671405, -0.5935184, -6.887288, 1, -0.5, 0.5, 0.5,
-4.671405, -0.5935184, -6.887288, 1, 1.5, 0.5, 0.5,
-4.671405, -0.5935184, -6.887288, 0, 1.5, 0.5, 0.5
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
-4.671405, -5.808685, 0.3215559, 0, -0.5, 0.5, 0.5,
-4.671405, -5.808685, 0.3215559, 1, -0.5, 0.5, 0.5,
-4.671405, -5.808685, 0.3215559, 1, 1.5, 0.5, 0.5,
-4.671405, -5.808685, 0.3215559, 0, 1.5, 0.5, 0.5
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
-3, -4.605185, -5.223709,
3, -4.605185, -5.223709,
-3, -4.605185, -5.223709,
-3, -4.805768, -5.500972,
-2, -4.605185, -5.223709,
-2, -4.805768, -5.500972,
-1, -4.605185, -5.223709,
-1, -4.805768, -5.500972,
0, -4.605185, -5.223709,
0, -4.805768, -5.500972,
1, -4.605185, -5.223709,
1, -4.805768, -5.500972,
2, -4.605185, -5.223709,
2, -4.805768, -5.500972,
3, -4.605185, -5.223709,
3, -4.805768, -5.500972
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
-3, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
-3, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
-3, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
-3, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5,
-2, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
-2, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
-2, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
-2, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5,
-1, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
-1, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
-1, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
-1, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5,
0, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
0, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
0, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
0, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5,
1, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
1, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
1, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
1, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5,
2, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
2, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
2, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
2, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5,
3, -5.206935, -6.055499, 0, -0.5, 0.5, 0.5,
3, -5.206935, -6.055499, 1, -0.5, 0.5, 0.5,
3, -5.206935, -6.055499, 1, 1.5, 0.5, 0.5,
3, -5.206935, -6.055499, 0, 1.5, 0.5, 0.5
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
-3.647395, -4, -5.223709,
-3.647395, 2, -5.223709,
-3.647395, -4, -5.223709,
-3.818063, -4, -5.500972,
-3.647395, -2, -5.223709,
-3.818063, -2, -5.500972,
-3.647395, 0, -5.223709,
-3.818063, 0, -5.500972,
-3.647395, 2, -5.223709,
-3.818063, 2, -5.500972
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
"-4",
"-2",
"0",
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
-4.1594, -4, -6.055499, 0, -0.5, 0.5, 0.5,
-4.1594, -4, -6.055499, 1, -0.5, 0.5, 0.5,
-4.1594, -4, -6.055499, 1, 1.5, 0.5, 0.5,
-4.1594, -4, -6.055499, 0, 1.5, 0.5, 0.5,
-4.1594, -2, -6.055499, 0, -0.5, 0.5, 0.5,
-4.1594, -2, -6.055499, 1, -0.5, 0.5, 0.5,
-4.1594, -2, -6.055499, 1, 1.5, 0.5, 0.5,
-4.1594, -2, -6.055499, 0, 1.5, 0.5, 0.5,
-4.1594, 0, -6.055499, 0, -0.5, 0.5, 0.5,
-4.1594, 0, -6.055499, 1, -0.5, 0.5, 0.5,
-4.1594, 0, -6.055499, 1, 1.5, 0.5, 0.5,
-4.1594, 0, -6.055499, 0, 1.5, 0.5, 0.5,
-4.1594, 2, -6.055499, 0, -0.5, 0.5, 0.5,
-4.1594, 2, -6.055499, 1, -0.5, 0.5, 0.5,
-4.1594, 2, -6.055499, 1, 1.5, 0.5, 0.5,
-4.1594, 2, -6.055499, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.647395, -4.605185, -4,
-3.647395, -4.605185, 4,
-3.647395, -4.605185, -4,
-3.818063, -4.805768, -4,
-3.647395, -4.605185, -2,
-3.818063, -4.805768, -2,
-3.647395, -4.605185, 0,
-3.818063, -4.805768, 0,
-3.647395, -4.605185, 2,
-3.818063, -4.805768, 2,
-3.647395, -4.605185, 4,
-3.818063, -4.805768, 4
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
-4.1594, -5.206935, -4, 0, -0.5, 0.5, 0.5,
-4.1594, -5.206935, -4, 1, -0.5, 0.5, 0.5,
-4.1594, -5.206935, -4, 1, 1.5, 0.5, 0.5,
-4.1594, -5.206935, -4, 0, 1.5, 0.5, 0.5,
-4.1594, -5.206935, -2, 0, -0.5, 0.5, 0.5,
-4.1594, -5.206935, -2, 1, -0.5, 0.5, 0.5,
-4.1594, -5.206935, -2, 1, 1.5, 0.5, 0.5,
-4.1594, -5.206935, -2, 0, 1.5, 0.5, 0.5,
-4.1594, -5.206935, 0, 0, -0.5, 0.5, 0.5,
-4.1594, -5.206935, 0, 1, -0.5, 0.5, 0.5,
-4.1594, -5.206935, 0, 1, 1.5, 0.5, 0.5,
-4.1594, -5.206935, 0, 0, 1.5, 0.5, 0.5,
-4.1594, -5.206935, 2, 0, -0.5, 0.5, 0.5,
-4.1594, -5.206935, 2, 1, -0.5, 0.5, 0.5,
-4.1594, -5.206935, 2, 1, 1.5, 0.5, 0.5,
-4.1594, -5.206935, 2, 0, 1.5, 0.5, 0.5,
-4.1594, -5.206935, 4, 0, -0.5, 0.5, 0.5,
-4.1594, -5.206935, 4, 1, -0.5, 0.5, 0.5,
-4.1594, -5.206935, 4, 1, 1.5, 0.5, 0.5,
-4.1594, -5.206935, 4, 0, 1.5, 0.5, 0.5
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
-3.647395, -4.605185, -5.223709,
-3.647395, 3.418148, -5.223709,
-3.647395, -4.605185, 5.86682,
-3.647395, 3.418148, 5.86682,
-3.647395, -4.605185, -5.223709,
-3.647395, -4.605185, 5.86682,
-3.647395, 3.418148, -5.223709,
-3.647395, 3.418148, 5.86682,
-3.647395, -4.605185, -5.223709,
3.179337, -4.605185, -5.223709,
-3.647395, -4.605185, 5.86682,
3.179337, -4.605185, 5.86682,
-3.647395, 3.418148, -5.223709,
3.179337, 3.418148, -5.223709,
-3.647395, 3.418148, 5.86682,
3.179337, 3.418148, 5.86682,
3.179337, -4.605185, -5.223709,
3.179337, 3.418148, -5.223709,
3.179337, -4.605185, 5.86682,
3.179337, 3.418148, 5.86682,
3.179337, -4.605185, -5.223709,
3.179337, -4.605185, 5.86682,
3.179337, 3.418148, -5.223709,
3.179337, 3.418148, 5.86682
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
var radius = 8.167948;
var distance = 36.34012;
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
mvMatrix.translate( 0.2340293, 0.5935184, -0.3215559 );
mvMatrix.scale( 1.293642, 1.100708, 0.7962961 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.34012);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
chlorphonium_chlorid<-read.table("chlorphonium_chlorid.xyz")
```

```
## Error in read.table("chlorphonium_chlorid.xyz"): no lines available in input
```

```r
x<-chlorphonium_chlorid$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
```

```r
y<-chlorphonium_chlorid$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
```

```r
z<-chlorphonium_chlorid$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorphonium_chlorid' not found
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
-3.547977, -1.019593, -1.386311, 0, 0, 1, 1, 1,
-3.463364, 1.085078, -1.753255, 1, 0, 0, 1, 1,
-3.022404, -0.6991318, -0.2874565, 1, 0, 0, 1, 1,
-2.929025, 0.7295974, -0.5395659, 1, 0, 0, 1, 1,
-2.741874, 0.7775319, -0.8052524, 1, 0, 0, 1, 1,
-2.555314, -0.1250529, -2.401041, 1, 0, 0, 1, 1,
-2.465123, 0.3765802, -3.422276, 0, 0, 0, 1, 1,
-2.424707, 0.1971535, -1.157976, 0, 0, 0, 1, 1,
-2.418832, 2.47781, -2.705013, 0, 0, 0, 1, 1,
-2.39746, 1.550088, -1.453033, 0, 0, 0, 1, 1,
-2.362015, -0.9617191, -1.617934, 0, 0, 0, 1, 1,
-2.317409, 0.7589691, -2.361298, 0, 0, 0, 1, 1,
-2.190284, -1.681497, -2.602305, 0, 0, 0, 1, 1,
-2.183527, -0.3932259, -1.981792, 1, 1, 1, 1, 1,
-2.16339, -0.5454389, -2.888048, 1, 1, 1, 1, 1,
-2.158336, -0.6010162, -0.8150204, 1, 1, 1, 1, 1,
-2.033072, 0.8965335, -2.092727, 1, 1, 1, 1, 1,
-1.994199, 3.301304, -0.1947981, 1, 1, 1, 1, 1,
-1.929217, -0.6855019, -2.032171, 1, 1, 1, 1, 1,
-1.926081, 1.564529, -0.6215646, 1, 1, 1, 1, 1,
-1.920325, -1.448423, -2.908045, 1, 1, 1, 1, 1,
-1.918723, 0.4713717, -0.8449085, 1, 1, 1, 1, 1,
-1.909024, -0.03024485, -0.4181514, 1, 1, 1, 1, 1,
-1.908285, 0.05401976, -2.276741, 1, 1, 1, 1, 1,
-1.876916, -1.756543, -2.357275, 1, 1, 1, 1, 1,
-1.862762, 0.5776456, -0.9961171, 1, 1, 1, 1, 1,
-1.859414, -1.951671, -2.042814, 1, 1, 1, 1, 1,
-1.834339, 0.2354077, -3.390716, 1, 1, 1, 1, 1,
-1.830597, 0.6028457, -0.6901447, 0, 0, 1, 1, 1,
-1.822641, 1.065068, -1.639439, 1, 0, 0, 1, 1,
-1.816971, 0.192831, -1.305459, 1, 0, 0, 1, 1,
-1.799593, 1.631164, 0.2347458, 1, 0, 0, 1, 1,
-1.798842, 1.230967, -1.07076, 1, 0, 0, 1, 1,
-1.794032, -2.050048, -3.178617, 1, 0, 0, 1, 1,
-1.786452, -1.073057, -1.803525, 0, 0, 0, 1, 1,
-1.784862, 1.020381, -1.666248, 0, 0, 0, 1, 1,
-1.773458, -0.7080123, -0.8090115, 0, 0, 0, 1, 1,
-1.765584, -0.5254141, -1.510267, 0, 0, 0, 1, 1,
-1.75058, -0.4524888, -0.4009727, 0, 0, 0, 1, 1,
-1.747235, -1.14242, -2.720743, 0, 0, 0, 1, 1,
-1.742683, -0.6934248, -2.613536, 0, 0, 0, 1, 1,
-1.733361, 0.284654, -0.7511784, 1, 1, 1, 1, 1,
-1.732151, 0.3276846, -1.614208, 1, 1, 1, 1, 1,
-1.730136, -0.8650907, -4.005013, 1, 1, 1, 1, 1,
-1.716637, -0.192553, -1.174583, 1, 1, 1, 1, 1,
-1.681975, -1.66035, -3.644126, 1, 1, 1, 1, 1,
-1.66075, -0.8759909, 0.3419385, 1, 1, 1, 1, 1,
-1.647569, 0.3302515, -1.411788, 1, 1, 1, 1, 1,
-1.635607, 0.7582233, 0.8847396, 1, 1, 1, 1, 1,
-1.6337, 0.4734178, -2.97678, 1, 1, 1, 1, 1,
-1.632106, 0.2244197, -1.868187, 1, 1, 1, 1, 1,
-1.629038, -0.5290655, -0.3500527, 1, 1, 1, 1, 1,
-1.623212, -0.2055541, -1.434242, 1, 1, 1, 1, 1,
-1.622385, 0.3838645, -0.6326688, 1, 1, 1, 1, 1,
-1.607554, 0.966064, -0.05261198, 1, 1, 1, 1, 1,
-1.603337, -0.547616, -3.029953, 1, 1, 1, 1, 1,
-1.601331, 0.08675046, -0.6861155, 0, 0, 1, 1, 1,
-1.600018, 0.07125406, -0.9423175, 1, 0, 0, 1, 1,
-1.594979, -0.6605379, -0.9789439, 1, 0, 0, 1, 1,
-1.58332, -0.1808967, -1.464561, 1, 0, 0, 1, 1,
-1.564167, -0.03035701, -0.8564476, 1, 0, 0, 1, 1,
-1.563766, -0.7442362, -1.754307, 1, 0, 0, 1, 1,
-1.556566, 1.426276, 0.2694938, 0, 0, 0, 1, 1,
-1.541274, -1.61295, -2.356714, 0, 0, 0, 1, 1,
-1.519755, 0.7788209, -2.051781, 0, 0, 0, 1, 1,
-1.516995, -0.4961957, -3.256483, 0, 0, 0, 1, 1,
-1.511672, 1.132175, -1.479373, 0, 0, 0, 1, 1,
-1.493195, 1.546688, -0.8725433, 0, 0, 0, 1, 1,
-1.485609, -0.2573841, -0.3547117, 0, 0, 0, 1, 1,
-1.484806, -0.6191108, -2.45528, 1, 1, 1, 1, 1,
-1.483046, 0.1393588, -0.5258062, 1, 1, 1, 1, 1,
-1.48154, 1.977296, 0.6330705, 1, 1, 1, 1, 1,
-1.480556, -1.928267, -3.007971, 1, 1, 1, 1, 1,
-1.471551, -0.7810855, -0.8982835, 1, 1, 1, 1, 1,
-1.470986, -0.009104874, -2.237066, 1, 1, 1, 1, 1,
-1.458079, -1.354462, -3.480011, 1, 1, 1, 1, 1,
-1.447015, -0.5076959, -1.253535, 1, 1, 1, 1, 1,
-1.443787, 0.01076372, -0.8381221, 1, 1, 1, 1, 1,
-1.414874, -1.159508, -2.764102, 1, 1, 1, 1, 1,
-1.414783, -1.018988, -1.932324, 1, 1, 1, 1, 1,
-1.41081, 1.653572, -0.6806447, 1, 1, 1, 1, 1,
-1.408687, -1.160829, -3.307921, 1, 1, 1, 1, 1,
-1.408364, 0.3177122, -2.070231, 1, 1, 1, 1, 1,
-1.403815, -0.8928196, -1.854202, 1, 1, 1, 1, 1,
-1.394815, -0.2508012, -1.825126, 0, 0, 1, 1, 1,
-1.394715, 1.760745, -0.2143035, 1, 0, 0, 1, 1,
-1.393471, 0.3605216, -1.714559, 1, 0, 0, 1, 1,
-1.390127, 1.056913, -0.7882503, 1, 0, 0, 1, 1,
-1.389638, 1.920505, -0.1277747, 1, 0, 0, 1, 1,
-1.387152, 0.0725252, -1.08484, 1, 0, 0, 1, 1,
-1.382374, 0.3086182, -2.149565, 0, 0, 0, 1, 1,
-1.372636, 0.5353525, -2.921819, 0, 0, 0, 1, 1,
-1.355724, 0.4853272, -2.987786, 0, 0, 0, 1, 1,
-1.35415, -0.2199756, -2.573257, 0, 0, 0, 1, 1,
-1.351858, -0.529705, -1.451538, 0, 0, 0, 1, 1,
-1.349911, -0.4599096, -1.830374, 0, 0, 0, 1, 1,
-1.337644, 0.002675785, -1.285526, 0, 0, 0, 1, 1,
-1.331307, -0.2055708, -1.793444, 1, 1, 1, 1, 1,
-1.330392, 0.5236295, 0.4972883, 1, 1, 1, 1, 1,
-1.328849, -0.4010545, -2.329745, 1, 1, 1, 1, 1,
-1.323741, -0.4337876, -2.732346, 1, 1, 1, 1, 1,
-1.322284, -0.05287423, -2.169668, 1, 1, 1, 1, 1,
-1.321366, -0.2735915, -2.516397, 1, 1, 1, 1, 1,
-1.318697, -1.284448, -1.283132, 1, 1, 1, 1, 1,
-1.317131, 0.5473175, -2.80168, 1, 1, 1, 1, 1,
-1.317028, 0.04248504, -1.084922, 1, 1, 1, 1, 1,
-1.310411, 0.138032, -1.510882, 1, 1, 1, 1, 1,
-1.305164, 2.182374, 0.5932013, 1, 1, 1, 1, 1,
-1.303478, 0.8745422, -1.533022, 1, 1, 1, 1, 1,
-1.296921, -0.1625063, -0.9901698, 1, 1, 1, 1, 1,
-1.29412, 0.04221313, -0.6697096, 1, 1, 1, 1, 1,
-1.28485, 1.305487, -0.2273455, 1, 1, 1, 1, 1,
-1.284661, -0.1590323, -0.6606033, 0, 0, 1, 1, 1,
-1.284006, 0.2882549, -1.559698, 1, 0, 0, 1, 1,
-1.28006, 1.249296, 0.1927892, 1, 0, 0, 1, 1,
-1.278384, 0.5321408, -0.2765594, 1, 0, 0, 1, 1,
-1.271838, -0.9936094, -3.82763, 1, 0, 0, 1, 1,
-1.271176, 0.8487599, -0.01469248, 1, 0, 0, 1, 1,
-1.2693, -1.305643, -3.064365, 0, 0, 0, 1, 1,
-1.268282, -0.291811, -3.435819, 0, 0, 0, 1, 1,
-1.263819, -0.7361139, -1.283425, 0, 0, 0, 1, 1,
-1.254004, -1.036882, -3.232162, 0, 0, 0, 1, 1,
-1.245125, 1.777471, 0.6428429, 0, 0, 0, 1, 1,
-1.244992, -0.5580503, -1.721959, 0, 0, 0, 1, 1,
-1.244769, 1.294429, 0.5494556, 0, 0, 0, 1, 1,
-1.240516, 0.9570637, 0.8868253, 1, 1, 1, 1, 1,
-1.238325, -0.5119504, -1.112181, 1, 1, 1, 1, 1,
-1.233025, -0.1400804, -0.3711028, 1, 1, 1, 1, 1,
-1.231045, 0.7092456, -0.4990762, 1, 1, 1, 1, 1,
-1.203326, 0.3176875, -2.301452, 1, 1, 1, 1, 1,
-1.189032, 0.00519688, -1.729704, 1, 1, 1, 1, 1,
-1.18293, 1.978886, -2.435722, 1, 1, 1, 1, 1,
-1.180498, -1.504888, -2.643936, 1, 1, 1, 1, 1,
-1.180267, -0.06702676, -1.761247, 1, 1, 1, 1, 1,
-1.165648, -1.378283, -1.586028, 1, 1, 1, 1, 1,
-1.161191, 1.198776, -3.229629, 1, 1, 1, 1, 1,
-1.146082, -0.3830534, -1.584344, 1, 1, 1, 1, 1,
-1.143481, 0.5636307, -1.508611, 1, 1, 1, 1, 1,
-1.136389, -0.4489413, -2.920959, 1, 1, 1, 1, 1,
-1.13404, 0.1002209, 0.9543781, 1, 1, 1, 1, 1,
-1.132203, -0.3281319, -0.7245287, 0, 0, 1, 1, 1,
-1.129861, 0.5579475, -2.574852, 1, 0, 0, 1, 1,
-1.122565, 0.6173532, -1.941764, 1, 0, 0, 1, 1,
-1.118094, 0.6208669, -2.984648, 1, 0, 0, 1, 1,
-1.11289, -2.017947, -2.576818, 1, 0, 0, 1, 1,
-1.110544, -0.199646, -1.447744, 1, 0, 0, 1, 1,
-1.108935, 0.3328439, 0.2855776, 0, 0, 0, 1, 1,
-1.108325, -1.576115, -3.06315, 0, 0, 0, 1, 1,
-1.097112, -1.144171, -3.323628, 0, 0, 0, 1, 1,
-1.096698, 0.3487816, -0.9509785, 0, 0, 0, 1, 1,
-1.092885, 0.7181221, -1.754801, 0, 0, 0, 1, 1,
-1.090889, 0.3571135, -0.2511826, 0, 0, 0, 1, 1,
-1.0693, 0.05524949, -1.123789, 0, 0, 0, 1, 1,
-1.064193, -0.9610866, -2.079368, 1, 1, 1, 1, 1,
-1.05825, 0.7787346, -0.7926173, 1, 1, 1, 1, 1,
-1.053779, 1.240348, -0.2315944, 1, 1, 1, 1, 1,
-1.05344, 1.189581, -0.3824147, 1, 1, 1, 1, 1,
-1.047164, -0.6038437, -3.572556, 1, 1, 1, 1, 1,
-1.041195, -1.569685, -2.630027, 1, 1, 1, 1, 1,
-1.039894, 0.1672061, -0.9047266, 1, 1, 1, 1, 1,
-1.035669, -1.607599, -1.035307, 1, 1, 1, 1, 1,
-1.032055, 1.032824, -0.1093191, 1, 1, 1, 1, 1,
-1.029518, 0.78561, -1.116695, 1, 1, 1, 1, 1,
-1.024778, -0.6936427, -2.676994, 1, 1, 1, 1, 1,
-1.020998, 0.108571, -0.616055, 1, 1, 1, 1, 1,
-1.018737, -0.8835667, -2.622321, 1, 1, 1, 1, 1,
-1.014453, 1.481261, -1.824996, 1, 1, 1, 1, 1,
-1.012841, -0.196929, -2.576042, 1, 1, 1, 1, 1,
-1.012244, -0.2870383, -4.837633, 0, 0, 1, 1, 1,
-1.00963, -0.3036379, -2.866458, 1, 0, 0, 1, 1,
-1.008051, -1.363462, -1.757075, 1, 0, 0, 1, 1,
-0.9957489, 0.1587334, -1.268348, 1, 0, 0, 1, 1,
-0.9935805, 0.3448448, -0.9689652, 1, 0, 0, 1, 1,
-0.9910612, -0.5720621, -1.100718, 1, 0, 0, 1, 1,
-0.9897842, 0.2743306, -2.016613, 0, 0, 0, 1, 1,
-0.9889039, 0.1152673, 0.7090226, 0, 0, 0, 1, 1,
-0.9822296, -0.4479036, -3.45358, 0, 0, 0, 1, 1,
-0.9817513, -0.813292, -2.936732, 0, 0, 0, 1, 1,
-0.9768134, -0.3867939, -2.438484, 0, 0, 0, 1, 1,
-0.9713134, 2.598678, 0.7515732, 0, 0, 0, 1, 1,
-0.968742, 1.111099, -1.846446, 0, 0, 0, 1, 1,
-0.9683797, 2.503391, -1.683144, 1, 1, 1, 1, 1,
-0.9666421, -0.611209, -2.103483, 1, 1, 1, 1, 1,
-0.9618263, -1.110373, -1.216342, 1, 1, 1, 1, 1,
-0.9435854, -2.930114, -3.824818, 1, 1, 1, 1, 1,
-0.9380134, 0.07506835, -1.370682, 1, 1, 1, 1, 1,
-0.9376504, 0.3332154, -1.255908, 1, 1, 1, 1, 1,
-0.9269463, 0.8149722, -2.122916, 1, 1, 1, 1, 1,
-0.9245173, 0.1150559, -1.605976, 1, 1, 1, 1, 1,
-0.9100406, 0.04638441, -1.206354, 1, 1, 1, 1, 1,
-0.9097438, 1.507914, -0.7643895, 1, 1, 1, 1, 1,
-0.9069896, -0.3180037, -3.078991, 1, 1, 1, 1, 1,
-0.9061763, 0.6244428, 0.1782112, 1, 1, 1, 1, 1,
-0.8973592, -0.6685494, -2.569856, 1, 1, 1, 1, 1,
-0.8960877, -0.03788854, -0.8317319, 1, 1, 1, 1, 1,
-0.8959689, -1.27138, -3.472266, 1, 1, 1, 1, 1,
-0.8943959, -1.635801, -3.55944, 0, 0, 1, 1, 1,
-0.888863, -1.010374, -2.768724, 1, 0, 0, 1, 1,
-0.8847036, 0.2013839, -2.239099, 1, 0, 0, 1, 1,
-0.881341, -0.211561, -0.6584094, 1, 0, 0, 1, 1,
-0.8599495, 1.700373, -0.3075986, 1, 0, 0, 1, 1,
-0.8598192, -2.025574, -1.519892, 1, 0, 0, 1, 1,
-0.8532927, 0.5388252, -2.070263, 0, 0, 0, 1, 1,
-0.849446, -0.8182495, -2.40097, 0, 0, 0, 1, 1,
-0.8458405, 0.601181, -1.350281, 0, 0, 0, 1, 1,
-0.8433684, 0.7500516, -1.400047, 0, 0, 0, 1, 1,
-0.8416006, -1.992315, -2.610742, 0, 0, 0, 1, 1,
-0.8390316, -0.4093804, -1.925905, 0, 0, 0, 1, 1,
-0.8363198, 0.1555706, -1.572858, 0, 0, 0, 1, 1,
-0.8340272, 1.864885, 0.4201974, 1, 1, 1, 1, 1,
-0.8257143, -2.222177, -2.290065, 1, 1, 1, 1, 1,
-0.8235115, -0.731608, -1.612815, 1, 1, 1, 1, 1,
-0.8211079, 0.1846587, -1.183581, 1, 1, 1, 1, 1,
-0.8196777, -2.12271, -5.058505, 1, 1, 1, 1, 1,
-0.8145719, 1.83514, -1.129096, 1, 1, 1, 1, 1,
-0.8111367, 0.7472985, -0.9866734, 1, 1, 1, 1, 1,
-0.8086116, -0.7516451, -0.9238391, 1, 1, 1, 1, 1,
-0.8067341, 0.2305592, -0.3976843, 1, 1, 1, 1, 1,
-0.8065069, -0.847747, -1.030655, 1, 1, 1, 1, 1,
-0.7978072, -1.24866, -1.571277, 1, 1, 1, 1, 1,
-0.7976688, -0.1105256, -2.858336, 1, 1, 1, 1, 1,
-0.7957771, -1.297861, -3.687805, 1, 1, 1, 1, 1,
-0.7799414, -1.964218, -2.852149, 1, 1, 1, 1, 1,
-0.7747647, 0.7269601, -2.251305, 1, 1, 1, 1, 1,
-0.7727451, -1.477999, -3.583807, 0, 0, 1, 1, 1,
-0.7617744, -1.753916, -3.097357, 1, 0, 0, 1, 1,
-0.758679, 1.491802, 0.7085991, 1, 0, 0, 1, 1,
-0.7564386, 0.1224814, -1.286265, 1, 0, 0, 1, 1,
-0.7525588, -1.198076, -2.105839, 1, 0, 0, 1, 1,
-0.7506209, -0.3851418, -2.709124, 1, 0, 0, 1, 1,
-0.7496581, 0.5400548, -1.374411, 0, 0, 0, 1, 1,
-0.7471589, 1.332862, -1.159851, 0, 0, 0, 1, 1,
-0.7467514, -0.2352156, -1.488908, 0, 0, 0, 1, 1,
-0.7454677, 0.5214447, -1.893846, 0, 0, 0, 1, 1,
-0.7412058, -0.3425896, -1.255003, 0, 0, 0, 1, 1,
-0.7390578, 0.3876139, -1.412189, 0, 0, 0, 1, 1,
-0.737121, 1.203723, -1.209364, 0, 0, 0, 1, 1,
-0.732339, 0.1288769, -1.781691, 1, 1, 1, 1, 1,
-0.7255981, 0.1541968, -1.077158, 1, 1, 1, 1, 1,
-0.7233852, 1.460777, -0.9584398, 1, 1, 1, 1, 1,
-0.7222721, -1.638698, -2.372921, 1, 1, 1, 1, 1,
-0.7211588, -1.459352, -1.168523, 1, 1, 1, 1, 1,
-0.7152773, -0.6637456, -2.97072, 1, 1, 1, 1, 1,
-0.7151532, 0.09776621, -1.779331, 1, 1, 1, 1, 1,
-0.7122537, -2.676046, -3.192256, 1, 1, 1, 1, 1,
-0.7094857, 0.9526948, -1.603586, 1, 1, 1, 1, 1,
-0.7092693, 0.803135, -0.08415211, 1, 1, 1, 1, 1,
-0.7051751, 1.663288, -1.256587, 1, 1, 1, 1, 1,
-0.6979472, -1.063514, -3.151025, 1, 1, 1, 1, 1,
-0.6975846, -0.2752713, -3.02888, 1, 1, 1, 1, 1,
-0.687206, 0.5235219, -0.7579265, 1, 1, 1, 1, 1,
-0.6865023, 1.625206, -1.067066, 1, 1, 1, 1, 1,
-0.6765906, -0.3656172, -1.167946, 0, 0, 1, 1, 1,
-0.6704184, 0.1765565, -2.768131, 1, 0, 0, 1, 1,
-0.6547953, 1.850348, -0.6571719, 1, 0, 0, 1, 1,
-0.6397066, -1.585684, -1.694507, 1, 0, 0, 1, 1,
-0.639127, 0.285066, -0.7909155, 1, 0, 0, 1, 1,
-0.6388226, 0.214245, -2.031087, 1, 0, 0, 1, 1,
-0.6379185, 1.858979, 0.2106908, 0, 0, 0, 1, 1,
-0.6363668, 2.049332, 2.089209, 0, 0, 0, 1, 1,
-0.6346006, 1.79405, -0.3034786, 0, 0, 0, 1, 1,
-0.6316139, -0.5489598, -1.760315, 0, 0, 0, 1, 1,
-0.6295254, 1.938912, -0.9528117, 0, 0, 0, 1, 1,
-0.6288977, -0.4500226, -1.257509, 0, 0, 0, 1, 1,
-0.6251252, 0.5457758, -2.041397, 0, 0, 0, 1, 1,
-0.6228548, 0.1014404, -2.460552, 1, 1, 1, 1, 1,
-0.6210554, -0.561483, -3.19249, 1, 1, 1, 1, 1,
-0.6200724, -0.5329469, -1.971205, 1, 1, 1, 1, 1,
-0.6197979, -0.3042152, -2.023902, 1, 1, 1, 1, 1,
-0.6178918, 0.5601369, -0.6587908, 1, 1, 1, 1, 1,
-0.6159559, -1.76029, -1.988191, 1, 1, 1, 1, 1,
-0.6150697, -0.2225882, -1.491274, 1, 1, 1, 1, 1,
-0.6107867, -0.4212649, -2.136735, 1, 1, 1, 1, 1,
-0.6077666, -0.9098435, -4.899713, 1, 1, 1, 1, 1,
-0.597478, 0.3586598, -1.690398, 1, 1, 1, 1, 1,
-0.5936038, -0.9007751, -2.51237, 1, 1, 1, 1, 1,
-0.5891277, -1.082747, -3.179079, 1, 1, 1, 1, 1,
-0.5876016, 0.3284798, -1.235605, 1, 1, 1, 1, 1,
-0.5868704, -0.1369566, -0.8918192, 1, 1, 1, 1, 1,
-0.5844666, 0.4364591, 1.239836, 1, 1, 1, 1, 1,
-0.5780225, -0.2569659, -0.455114, 0, 0, 1, 1, 1,
-0.5769198, -0.5710799, -1.452043, 1, 0, 0, 1, 1,
-0.5748972, -0.3346798, -3.337596, 1, 0, 0, 1, 1,
-0.5731671, -0.3501126, -1.871953, 1, 0, 0, 1, 1,
-0.5696754, -1.02849, -1.911536, 1, 0, 0, 1, 1,
-0.563224, -0.162378, 0.1148356, 1, 0, 0, 1, 1,
-0.5580004, -1.358287, -1.338987, 0, 0, 0, 1, 1,
-0.5567553, 1.262542, 1.211609, 0, 0, 0, 1, 1,
-0.5514348, 0.9042343, -0.3498611, 0, 0, 0, 1, 1,
-0.5490986, -1.066043, -1.098915, 0, 0, 0, 1, 1,
-0.5455195, -1.693114, -2.405021, 0, 0, 0, 1, 1,
-0.5454265, 0.7001948, -1.602277, 0, 0, 0, 1, 1,
-0.5424078, 0.04447165, -0.9243498, 0, 0, 0, 1, 1,
-0.5421128, 1.062614, -0.9835274, 1, 1, 1, 1, 1,
-0.5368406, 2.740737, 0.05043933, 1, 1, 1, 1, 1,
-0.5336817, 1.064137, -1.06203, 1, 1, 1, 1, 1,
-0.5328542, 0.7283004, -1.417721, 1, 1, 1, 1, 1,
-0.5299171, -0.6070438, -2.31966, 1, 1, 1, 1, 1,
-0.5286351, 1.181834, -1.163805, 1, 1, 1, 1, 1,
-0.5265996, -0.1818722, -1.41656, 1, 1, 1, 1, 1,
-0.5253866, -0.835474, -2.429312, 1, 1, 1, 1, 1,
-0.5249275, 0.9806293, 0.1029416, 1, 1, 1, 1, 1,
-0.5229242, -1.768136, -2.551009, 1, 1, 1, 1, 1,
-0.522392, 1.339551, -0.2865736, 1, 1, 1, 1, 1,
-0.5216531, -1.669889, -2.298238, 1, 1, 1, 1, 1,
-0.5215017, -0.08671045, -1.499851, 1, 1, 1, 1, 1,
-0.5184128, 1.622937, 0.5087369, 1, 1, 1, 1, 1,
-0.5167117, -0.5017984, -1.514992, 1, 1, 1, 1, 1,
-0.5147277, -0.6790866, -2.393126, 0, 0, 1, 1, 1,
-0.5144224, 1.768865, 0.6358483, 1, 0, 0, 1, 1,
-0.513738, -1.230192, -1.707921, 1, 0, 0, 1, 1,
-0.513197, -0.4704959, -2.618967, 1, 0, 0, 1, 1,
-0.5127645, 0.4821859, -2.600023, 1, 0, 0, 1, 1,
-0.5121542, -0.4753431, -2.108682, 1, 0, 0, 1, 1,
-0.5103954, -0.074533, -0.827483, 0, 0, 0, 1, 1,
-0.5096894, 0.1324286, -1.466483, 0, 0, 0, 1, 1,
-0.5085053, 0.220531, -1.14702, 0, 0, 0, 1, 1,
-0.5063913, -1.05583, -4.689364, 0, 0, 0, 1, 1,
-0.4964378, 0.2964787, -0.3864973, 0, 0, 0, 1, 1,
-0.493269, 1.157355, -0.0787067, 0, 0, 0, 1, 1,
-0.4879491, 0.4437983, 0.2629046, 0, 0, 0, 1, 1,
-0.4866762, 0.7048719, -0.8931208, 1, 1, 1, 1, 1,
-0.4817184, -0.06424148, -0.8279279, 1, 1, 1, 1, 1,
-0.4811714, -1.255268, -2.572785, 1, 1, 1, 1, 1,
-0.480979, -0.258811, -0.4392998, 1, 1, 1, 1, 1,
-0.477118, -1.842007, -3.189915, 1, 1, 1, 1, 1,
-0.4722877, 0.5453843, -2.135587, 1, 1, 1, 1, 1,
-0.4710432, -1.092162, -2.149533, 1, 1, 1, 1, 1,
-0.4663975, -0.7677054, -2.964347, 1, 1, 1, 1, 1,
-0.4606903, -1.418811, -3.361565, 1, 1, 1, 1, 1,
-0.4598429, 1.272292, -0.436252, 1, 1, 1, 1, 1,
-0.4598271, 0.5640145, -0.2810305, 1, 1, 1, 1, 1,
-0.4590676, 0.1694433, -1.009419, 1, 1, 1, 1, 1,
-0.4511603, -0.5992081, -3.01324, 1, 1, 1, 1, 1,
-0.448451, -1.268671, -2.917351, 1, 1, 1, 1, 1,
-0.4481358, 1.841858, -0.7600603, 1, 1, 1, 1, 1,
-0.4464086, 1.266542, 1.674913, 0, 0, 1, 1, 1,
-0.4398587, -0.5359455, -1.505763, 1, 0, 0, 1, 1,
-0.4391503, 0.5559596, -0.8793827, 1, 0, 0, 1, 1,
-0.4386635, -1.799597, -4.117552, 1, 0, 0, 1, 1,
-0.4303833, 0.4123341, -1.054051, 1, 0, 0, 1, 1,
-0.430037, 0.5112187, 0.1638565, 1, 0, 0, 1, 1,
-0.4266136, 0.43904, 0.2619715, 0, 0, 0, 1, 1,
-0.4249287, 1.015727, 0.1155167, 0, 0, 0, 1, 1,
-0.424, -0.4896654, -2.811206, 0, 0, 0, 1, 1,
-0.4131734, -1.005301, -0.9783587, 0, 0, 0, 1, 1,
-0.4114417, -0.03375391, -0.7663169, 0, 0, 0, 1, 1,
-0.4089502, 0.5455891, -1.320052, 0, 0, 0, 1, 1,
-0.4084242, 0.7856925, -1.511535, 0, 0, 0, 1, 1,
-0.4053812, -0.2585768, -1.794661, 1, 1, 1, 1, 1,
-0.4035378, 0.1802001, -1.411924, 1, 1, 1, 1, 1,
-0.4029589, -1.731603, -3.236177, 1, 1, 1, 1, 1,
-0.3950008, -0.9357454, -2.3079, 1, 1, 1, 1, 1,
-0.3939737, -0.156316, -1.57522, 1, 1, 1, 1, 1,
-0.3915106, 0.02114302, -3.493768, 1, 1, 1, 1, 1,
-0.3911414, -1.012641, -1.562981, 1, 1, 1, 1, 1,
-0.3865677, -0.1862156, -1.840072, 1, 1, 1, 1, 1,
-0.3862187, -0.418537, -2.613562, 1, 1, 1, 1, 1,
-0.3826649, -0.428254, -0.5007327, 1, 1, 1, 1, 1,
-0.3768472, -0.7736587, -4.059132, 1, 1, 1, 1, 1,
-0.376004, -0.01174051, -0.5135077, 1, 1, 1, 1, 1,
-0.3727809, -1.127636, -2.590822, 1, 1, 1, 1, 1,
-0.3584612, -0.3417729, -1.938004, 1, 1, 1, 1, 1,
-0.3547144, 0.04007429, -1.636241, 1, 1, 1, 1, 1,
-0.3486245, 0.3916984, -1.564481, 0, 0, 1, 1, 1,
-0.3471645, 1.033202, 1.715411, 1, 0, 0, 1, 1,
-0.3470728, 1.134163, -1.150389, 1, 0, 0, 1, 1,
-0.3451771, -0.05106951, -1.473693, 1, 0, 0, 1, 1,
-0.3400138, 0.1328866, -0.5080835, 1, 0, 0, 1, 1,
-0.3392985, 1.04343, -0.4428164, 1, 0, 0, 1, 1,
-0.3379109, 0.4232081, -0.6394764, 0, 0, 0, 1, 1,
-0.3352595, -1.333864, -1.853693, 0, 0, 0, 1, 1,
-0.3329509, 1.958536, 0.1704663, 0, 0, 0, 1, 1,
-0.3301683, -0.1515792, -0.626123, 0, 0, 0, 1, 1,
-0.3277115, 0.1900939, -1.246163, 0, 0, 0, 1, 1,
-0.3239833, -0.05772219, -0.864265, 0, 0, 0, 1, 1,
-0.3228831, 1.437401, 0.3775266, 0, 0, 0, 1, 1,
-0.3226133, 0.5182961, -2.249882, 1, 1, 1, 1, 1,
-0.3225854, 0.08888658, -1.292883, 1, 1, 1, 1, 1,
-0.321489, 0.02720728, -2.854111, 1, 1, 1, 1, 1,
-0.3172003, 1.404019, -0.5653264, 1, 1, 1, 1, 1,
-0.3171181, -0.8895341, -3.108174, 1, 1, 1, 1, 1,
-0.3068695, -2.294078, -2.003385, 1, 1, 1, 1, 1,
-0.3052248, -0.7121382, -3.303367, 1, 1, 1, 1, 1,
-0.2995183, 0.3473303, -1.124805, 1, 1, 1, 1, 1,
-0.2972083, 2.157, -0.5849983, 1, 1, 1, 1, 1,
-0.2773057, -1.007522, -3.310022, 1, 1, 1, 1, 1,
-0.2756822, 0.03691024, 0.527647, 1, 1, 1, 1, 1,
-0.2738239, -0.3127488, -4.059242, 1, 1, 1, 1, 1,
-0.2656545, 0.215695, -0.04978137, 1, 1, 1, 1, 1,
-0.2630868, -0.7458606, -1.628639, 1, 1, 1, 1, 1,
-0.2621481, 0.006355121, -2.570229, 1, 1, 1, 1, 1,
-0.2617497, -0.2637517, -0.6972702, 0, 0, 1, 1, 1,
-0.2598758, -1.966515, -1.130945, 1, 0, 0, 1, 1,
-0.2573803, 0.4955848, -1.261778, 1, 0, 0, 1, 1,
-0.2522025, -1.706482, -3.073511, 1, 0, 0, 1, 1,
-0.2464821, -0.8786649, -3.333004, 1, 0, 0, 1, 1,
-0.2444739, 1.441644, 0.05544115, 1, 0, 0, 1, 1,
-0.2444162, -0.06802277, -2.526035, 0, 0, 0, 1, 1,
-0.2437158, 0.5473752, 1.166941, 0, 0, 0, 1, 1,
-0.2388748, -0.7625311, -1.668696, 0, 0, 0, 1, 1,
-0.2329098, 0.5663738, 0.05140346, 0, 0, 0, 1, 1,
-0.2327159, 1.675509, -0.1079921, 0, 0, 0, 1, 1,
-0.2289309, -0.8523985, -2.037509, 0, 0, 0, 1, 1,
-0.2254591, -0.9636858, -1.394452, 0, 0, 0, 1, 1,
-0.2231517, 0.3145763, -0.5697904, 1, 1, 1, 1, 1,
-0.220899, -0.3640896, -2.204884, 1, 1, 1, 1, 1,
-0.220044, 0.5913616, -0.9338085, 1, 1, 1, 1, 1,
-0.2196094, 0.4222903, -1.832377, 1, 1, 1, 1, 1,
-0.2163759, 0.0731276, -1.044945, 1, 1, 1, 1, 1,
-0.2145778, -2.049502, -3.887798, 1, 1, 1, 1, 1,
-0.2134107, -1.189774, -2.867784, 1, 1, 1, 1, 1,
-0.2111132, -1.406795, -2.855174, 1, 1, 1, 1, 1,
-0.207945, 0.4540977, -1.648737, 1, 1, 1, 1, 1,
-0.2052661, -0.2599696, -2.087051, 1, 1, 1, 1, 1,
-0.202148, 0.5417612, 0.4220495, 1, 1, 1, 1, 1,
-0.2018157, -0.5084706, -3.014309, 1, 1, 1, 1, 1,
-0.2016506, -1.245362, -3.389539, 1, 1, 1, 1, 1,
-0.2004465, -1.683403, -2.641945, 1, 1, 1, 1, 1,
-0.1939076, 0.5397326, -0.9625658, 1, 1, 1, 1, 1,
-0.1875399, 1.012152, -0.4061818, 0, 0, 1, 1, 1,
-0.1867075, 1.087384, -1.049621, 1, 0, 0, 1, 1,
-0.1864645, -1.932426, -2.934772, 1, 0, 0, 1, 1,
-0.185812, -0.04900325, -0.7332759, 1, 0, 0, 1, 1,
-0.1840111, -1.044114, -3.442984, 1, 0, 0, 1, 1,
-0.1793596, -0.7476209, -2.051649, 1, 0, 0, 1, 1,
-0.1791431, 1.275144, 0.2605819, 0, 0, 0, 1, 1,
-0.1762243, -0.2589361, -3.121227, 0, 0, 0, 1, 1,
-0.176076, 2.339807, -0.08459117, 0, 0, 0, 1, 1,
-0.1756099, 0.02287682, -0.1545094, 0, 0, 0, 1, 1,
-0.1726466, -1.281069, -4.15916, 0, 0, 0, 1, 1,
-0.1629138, -0.3821355, -5.062196, 0, 0, 0, 1, 1,
-0.1615977, -0.9933677, -2.084925, 0, 0, 0, 1, 1,
-0.1588668, 1.591315, 0.3726678, 1, 1, 1, 1, 1,
-0.1588439, 1.572353, -0.7149914, 1, 1, 1, 1, 1,
-0.1575345, -0.02947917, -2.269388, 1, 1, 1, 1, 1,
-0.1547709, -0.820475, -3.002722, 1, 1, 1, 1, 1,
-0.1520425, -0.3525414, -1.130178, 1, 1, 1, 1, 1,
-0.151395, 0.4233336, -0.5738782, 1, 1, 1, 1, 1,
-0.1512197, -1.506452, -2.948992, 1, 1, 1, 1, 1,
-0.1495433, 0.9017728, -0.2658945, 1, 1, 1, 1, 1,
-0.1406538, -0.6100724, -2.823277, 1, 1, 1, 1, 1,
-0.1403636, 0.8436819, 0.6176839, 1, 1, 1, 1, 1,
-0.1395843, 1.521853, 2.278823, 1, 1, 1, 1, 1,
-0.1391057, -0.04978671, -0.04478493, 1, 1, 1, 1, 1,
-0.1379649, 1.38354, -1.570913, 1, 1, 1, 1, 1,
-0.1264843, 0.4032365, -0.6753603, 1, 1, 1, 1, 1,
-0.1251928, 2.269485, 0.8138899, 1, 1, 1, 1, 1,
-0.1243302, -0.3159332, -2.870115, 0, 0, 1, 1, 1,
-0.1238684, -0.1656272, -2.804668, 1, 0, 0, 1, 1,
-0.1221421, -0.8656645, -1.77983, 1, 0, 0, 1, 1,
-0.1115281, -0.1409914, -2.66502, 1, 0, 0, 1, 1,
-0.1112409, -0.4546313, -2.579735, 1, 0, 0, 1, 1,
-0.1083523, 0.06157544, -0.9664747, 1, 0, 0, 1, 1,
-0.1068075, -0.447698, -3.245492, 0, 0, 0, 1, 1,
-0.1047997, -0.4896064, -2.588434, 0, 0, 0, 1, 1,
-0.09937857, -0.6894988, -2.555205, 0, 0, 0, 1, 1,
-0.09650629, 0.6314184, -1.09758, 0, 0, 0, 1, 1,
-0.09551441, 1.417678, 2.843524, 0, 0, 0, 1, 1,
-0.0946854, 0.3202526, -0.2141773, 0, 0, 0, 1, 1,
-0.09412646, 0.04782785, -0.7792338, 0, 0, 0, 1, 1,
-0.09388774, 0.1531142, 0.1195365, 1, 1, 1, 1, 1,
-0.09275998, 0.373879, 0.9792743, 1, 1, 1, 1, 1,
-0.09242892, 1.372109, -1.864249, 1, 1, 1, 1, 1,
-0.0885916, 0.5809646, 1.039378, 1, 1, 1, 1, 1,
-0.08688518, -0.9989903, -3.146678, 1, 1, 1, 1, 1,
-0.08574352, 0.05549678, -1.014035, 1, 1, 1, 1, 1,
-0.07959201, -0.5521315, -4.346266, 1, 1, 1, 1, 1,
-0.07518762, 0.2028952, -0.6944808, 1, 1, 1, 1, 1,
-0.07432234, -0.9459245, -1.15393, 1, 1, 1, 1, 1,
-0.06755129, -0.805145, -2.299981, 1, 1, 1, 1, 1,
-0.06073208, 0.9783269, 0.7275764, 1, 1, 1, 1, 1,
-0.05877262, 1.139001, -0.7149195, 1, 1, 1, 1, 1,
-0.05818961, 0.3202622, 0.01623902, 1, 1, 1, 1, 1,
-0.05773631, 0.1198742, -1.738574, 1, 1, 1, 1, 1,
-0.05378582, -0.1377285, -3.392363, 1, 1, 1, 1, 1,
-0.05281131, 0.5641689, -0.1193839, 0, 0, 1, 1, 1,
-0.05236334, 0.03538341, -1.389438, 1, 0, 0, 1, 1,
-0.05028467, -0.0499447, -1.431166, 1, 0, 0, 1, 1,
-0.04925375, -0.9729732, -3.137635, 1, 0, 0, 1, 1,
-0.04653253, -0.7837124, -1.616759, 1, 0, 0, 1, 1,
-0.04432523, 0.379207, 1.506968, 1, 0, 0, 1, 1,
-0.04034477, 1.877392, 0.637183, 0, 0, 0, 1, 1,
-0.04020043, 0.5379941, 1.201948, 0, 0, 0, 1, 1,
-0.03754792, 0.7796082, 0.6364289, 0, 0, 0, 1, 1,
-0.03341566, 0.08539846, -1.825822, 0, 0, 0, 1, 1,
-0.02823513, -0.637569, -1.471329, 0, 0, 0, 1, 1,
-0.02793045, -1.502504, -1.389435, 0, 0, 0, 1, 1,
-0.02711548, 0.1170941, -2.368937, 0, 0, 0, 1, 1,
-0.02633684, 0.5253698, 0.1223951, 1, 1, 1, 1, 1,
-0.02000562, 0.3086132, 0.3853619, 1, 1, 1, 1, 1,
-0.01936707, 0.7831159, 0.1282063, 1, 1, 1, 1, 1,
-0.01627744, -0.9837515, -2.636877, 1, 1, 1, 1, 1,
-0.01535719, 1.823209, 1.055629, 1, 1, 1, 1, 1,
-0.0149988, 0.4314572, -0.1909153, 1, 1, 1, 1, 1,
-0.01202061, -1.536319, -2.864597, 1, 1, 1, 1, 1,
-0.005302558, 0.3060004, 0.08034837, 1, 1, 1, 1, 1,
0.0005450034, 1.678604, -1.720124, 1, 1, 1, 1, 1,
0.0009303484, 0.9529016, -0.2233139, 1, 1, 1, 1, 1,
0.002101638, 0.6097209, -0.1491189, 1, 1, 1, 1, 1,
0.002147974, 1.778633, -0.5171894, 1, 1, 1, 1, 1,
0.002297921, 0.9677464, 1.764091, 1, 1, 1, 1, 1,
0.00293496, -0.4152223, 3.853461, 1, 1, 1, 1, 1,
0.003268748, 1.062215, -0.5792031, 1, 1, 1, 1, 1,
0.003599167, 0.5502356, 1.505566, 0, 0, 1, 1, 1,
0.005646416, 0.06386065, 1.43772, 1, 0, 0, 1, 1,
0.009557169, 0.8764072, 0.7123898, 1, 0, 0, 1, 1,
0.01310043, -0.5840722, 4.935994, 1, 0, 0, 1, 1,
0.02866987, 0.3449813, 1.147886, 1, 0, 0, 1, 1,
0.02870478, 0.05403412, -0.2420566, 1, 0, 0, 1, 1,
0.0314481, -0.2326899, 3.513014, 0, 0, 0, 1, 1,
0.03255213, -1.348889, 2.561547, 0, 0, 0, 1, 1,
0.03374856, 0.6707033, -1.211609, 0, 0, 0, 1, 1,
0.03426617, -1.501593, 3.450882, 0, 0, 0, 1, 1,
0.03525982, -0.6920845, 1.723721, 0, 0, 0, 1, 1,
0.0407109, -0.545867, 3.68229, 0, 0, 0, 1, 1,
0.04227389, 0.9581869, 1.108356, 0, 0, 0, 1, 1,
0.0425196, -1.321734, 3.328583, 1, 1, 1, 1, 1,
0.04401978, 1.770283, -1.757945, 1, 1, 1, 1, 1,
0.04463785, 0.6996648, 1.211722, 1, 1, 1, 1, 1,
0.05049609, 1.357336, 1.178177, 1, 1, 1, 1, 1,
0.05361198, 2.34795, 1.410527, 1, 1, 1, 1, 1,
0.05560692, -0.7475634, 1.707311, 1, 1, 1, 1, 1,
0.05741668, 1.098572, 0.3131465, 1, 1, 1, 1, 1,
0.05871417, 1.351648, 2.268388, 1, 1, 1, 1, 1,
0.06081283, -0.2326004, 2.550225, 1, 1, 1, 1, 1,
0.06495167, -0.3447393, 1.637932, 1, 1, 1, 1, 1,
0.06641982, 1.984339, -0.09326589, 1, 1, 1, 1, 1,
0.06781682, 0.5270244, -0.07823082, 1, 1, 1, 1, 1,
0.07130039, 1.854758, 0.3365425, 1, 1, 1, 1, 1,
0.07774404, 0.7160589, 0.08951449, 1, 1, 1, 1, 1,
0.07954285, 0.3302203, 0.2110038, 1, 1, 1, 1, 1,
0.08151705, 0.8945999, 0.3748437, 0, 0, 1, 1, 1,
0.08666574, 1.544035, 0.3367385, 1, 0, 0, 1, 1,
0.08746503, 1.895768, -0.2921292, 1, 0, 0, 1, 1,
0.09748985, -1.161906, 4.111176, 1, 0, 0, 1, 1,
0.09804571, 1.259024, 0.2399474, 1, 0, 0, 1, 1,
0.09832293, -0.7213322, 1.939351, 1, 0, 0, 1, 1,
0.1009853, 0.5255635, -0.3862211, 0, 0, 0, 1, 1,
0.1021021, -0.759689, 1.968813, 0, 0, 0, 1, 1,
0.104896, 0.05797578, 0.1698159, 0, 0, 0, 1, 1,
0.1058789, 0.3960713, 1.199706, 0, 0, 0, 1, 1,
0.1068731, 1.243585, -0.653232, 0, 0, 0, 1, 1,
0.1086196, 0.3504618, -0.4488005, 0, 0, 0, 1, 1,
0.109014, 1.768624, 1.49392, 0, 0, 0, 1, 1,
0.1102393, -1.557355, 1.039735, 1, 1, 1, 1, 1,
0.1130399, -0.3605082, 2.606494, 1, 1, 1, 1, 1,
0.1141356, -0.9587739, 3.281418, 1, 1, 1, 1, 1,
0.1149438, 0.3358704, -0.004379497, 1, 1, 1, 1, 1,
0.1245365, -0.783618, 3.778379, 1, 1, 1, 1, 1,
0.1329903, -0.3778397, 2.789684, 1, 1, 1, 1, 1,
0.1364591, 1.252401, 1.141152, 1, 1, 1, 1, 1,
0.1373576, 0.5749804, 0.3768316, 1, 1, 1, 1, 1,
0.1391174, -0.5755412, 3.124846, 1, 1, 1, 1, 1,
0.1452231, -1.246378, 1.80614, 1, 1, 1, 1, 1,
0.1492269, 0.6740144, 1.882135, 1, 1, 1, 1, 1,
0.1548434, -0.4436811, 1.634318, 1, 1, 1, 1, 1,
0.1607516, -3.748546, 3.737696, 1, 1, 1, 1, 1,
0.1648956, 0.2412935, 0.4711665, 1, 1, 1, 1, 1,
0.1653517, -0.7511733, 1.106152, 1, 1, 1, 1, 1,
0.1662229, -0.8796176, 2.311339, 0, 0, 1, 1, 1,
0.1677346, -0.0924565, 3.76109, 1, 0, 0, 1, 1,
0.1681652, 1.577612, 0.6845514, 1, 0, 0, 1, 1,
0.1685835, -0.04055033, 1.808172, 1, 0, 0, 1, 1,
0.1695984, 0.6597747, 0.1936447, 1, 0, 0, 1, 1,
0.170183, 0.479089, 1.527697, 1, 0, 0, 1, 1,
0.1709968, -0.4584798, 4.642344, 0, 0, 0, 1, 1,
0.1725732, 0.9021313, 0.9678828, 0, 0, 0, 1, 1,
0.1747808, 0.397903, -0.07280847, 0, 0, 0, 1, 1,
0.1755913, 0.8359799, 0.908546, 0, 0, 0, 1, 1,
0.1757351, -1.365848, 3.637147, 0, 0, 0, 1, 1,
0.1774804, 0.7217782, -0.9775625, 0, 0, 0, 1, 1,
0.1811945, -0.3369516, 3.667286, 0, 0, 0, 1, 1,
0.1824424, -1.389582, 4.220582, 1, 1, 1, 1, 1,
0.183225, 0.5452746, 0.163875, 1, 1, 1, 1, 1,
0.1901747, -0.130708, 1.795752, 1, 1, 1, 1, 1,
0.1956869, 0.099147, 0.8346937, 1, 1, 1, 1, 1,
0.198841, 1.635997, -1.020646, 1, 1, 1, 1, 1,
0.1992638, 0.7879027, 2.158154, 1, 1, 1, 1, 1,
0.2008349, 0.1284161, 0.0233882, 1, 1, 1, 1, 1,
0.2018275, -1.597447, 2.378337, 1, 1, 1, 1, 1,
0.2031222, 0.4146709, 0.09855542, 1, 1, 1, 1, 1,
0.2082593, -0.5743373, 2.625743, 1, 1, 1, 1, 1,
0.2098125, 2.63136, 0.03537568, 1, 1, 1, 1, 1,
0.2138636, -0.4369805, 3.555516, 1, 1, 1, 1, 1,
0.2225144, 1.197811, -0.840188, 1, 1, 1, 1, 1,
0.2227187, 1.359596, -0.8490874, 1, 1, 1, 1, 1,
0.224516, 0.6020178, 0.41589, 1, 1, 1, 1, 1,
0.2251212, -0.568375, 4.124681, 0, 0, 1, 1, 1,
0.2281765, -1.208727, 2.981413, 1, 0, 0, 1, 1,
0.2293048, 0.5171809, -0.5046654, 1, 0, 0, 1, 1,
0.2332647, 0.6381982, -0.1133294, 1, 0, 0, 1, 1,
0.2418444, -0.3777655, 2.910273, 1, 0, 0, 1, 1,
0.243775, -1.488382, 4.133962, 1, 0, 0, 1, 1,
0.2461217, 1.039533, -0.1719807, 0, 0, 0, 1, 1,
0.2466566, -0.6729073, 1.367063, 0, 0, 0, 1, 1,
0.253391, -0.6678246, 2.46655, 0, 0, 0, 1, 1,
0.253498, -1.118586, 2.076019, 0, 0, 0, 1, 1,
0.2590357, 1.451527, 1.041806, 0, 0, 0, 1, 1,
0.2600904, 2.446895, -1.312767, 0, 0, 0, 1, 1,
0.2653597, -0.3632553, 2.76231, 0, 0, 0, 1, 1,
0.2697316, 1.074451, 0.7234291, 1, 1, 1, 1, 1,
0.2701231, -0.3373424, 3.511393, 1, 1, 1, 1, 1,
0.2817747, 1.103471, 0.1354251, 1, 1, 1, 1, 1,
0.2832198, -0.5657578, 3.389652, 1, 1, 1, 1, 1,
0.2853115, -0.724937, 3.645572, 1, 1, 1, 1, 1,
0.2853531, -0.8290464, 1.233648, 1, 1, 1, 1, 1,
0.2859405, 0.05400861, 1.084764, 1, 1, 1, 1, 1,
0.2880189, 1.992612, -0.4507265, 1, 1, 1, 1, 1,
0.2901267, 1.465367, -1.678624, 1, 1, 1, 1, 1,
0.2922107, 1.516234, 0.02055931, 1, 1, 1, 1, 1,
0.2954934, -1.271545, 5.705308, 1, 1, 1, 1, 1,
0.2996639, 1.496897, 0.06322464, 1, 1, 1, 1, 1,
0.3021689, 0.00895277, 0.6831372, 1, 1, 1, 1, 1,
0.3032417, -0.5608522, 2.296688, 1, 1, 1, 1, 1,
0.3034132, 0.7080032, 0.2218497, 1, 1, 1, 1, 1,
0.3120175, -0.9745232, 3.748069, 0, 0, 1, 1, 1,
0.3125032, 0.2267994, 2.14882, 1, 0, 0, 1, 1,
0.314218, 0.7372054, 2.194577, 1, 0, 0, 1, 1,
0.315237, 0.2294913, -0.6825026, 1, 0, 0, 1, 1,
0.3154011, -0.1240062, -0.2387275, 1, 0, 0, 1, 1,
0.3209602, -0.5170508, 2.712467, 1, 0, 0, 1, 1,
0.3210685, 1.155542, 1.225063, 0, 0, 0, 1, 1,
0.3213233, -1.825685, 2.813749, 0, 0, 0, 1, 1,
0.3218847, 0.7037877, 0.01353211, 0, 0, 0, 1, 1,
0.322465, 0.431224, 1.021763, 0, 0, 0, 1, 1,
0.3269659, -2.03534, 4.2356, 0, 0, 0, 1, 1,
0.328798, -0.1858274, 1.364733, 0, 0, 0, 1, 1,
0.3295659, 1.109493, -0.1668702, 0, 0, 0, 1, 1,
0.3323896, -0.2441652, 1.665291, 1, 1, 1, 1, 1,
0.3326994, 1.450359, -0.7764102, 1, 1, 1, 1, 1,
0.3336827, 1.856731, -0.4319147, 1, 1, 1, 1, 1,
0.339294, 0.06800856, 0.7630885, 1, 1, 1, 1, 1,
0.3432355, -1.923107, 3.854045, 1, 1, 1, 1, 1,
0.3442327, -0.472694, 1.198672, 1, 1, 1, 1, 1,
0.348164, -1.399217, 0.2104162, 1, 1, 1, 1, 1,
0.3483332, -0.3715616, 2.984264, 1, 1, 1, 1, 1,
0.3540262, 0.7794971, 0.04346425, 1, 1, 1, 1, 1,
0.357925, 0.6211981, 0.4671377, 1, 1, 1, 1, 1,
0.3594494, -0.005441704, 1.911756, 1, 1, 1, 1, 1,
0.3627695, -1.084453, 3.664076, 1, 1, 1, 1, 1,
0.363097, -1.061881, 1.975184, 1, 1, 1, 1, 1,
0.3646805, 0.5800694, -0.5380314, 1, 1, 1, 1, 1,
0.3658487, 0.1826961, 0.5219905, 1, 1, 1, 1, 1,
0.3662463, 0.5209885, 0.812219, 0, 0, 1, 1, 1,
0.3707407, -2.592822, 2.614791, 1, 0, 0, 1, 1,
0.3721412, 1.125812, -0.5978436, 1, 0, 0, 1, 1,
0.3781483, -1.263415, 4.130311, 1, 0, 0, 1, 1,
0.3825999, -2.105265, 2.720053, 1, 0, 0, 1, 1,
0.3837922, 0.1166873, 1.414259, 1, 0, 0, 1, 1,
0.3853957, 0.4770919, -0.531085, 0, 0, 0, 1, 1,
0.3885799, 1.368182, 0.767624, 0, 0, 0, 1, 1,
0.3958669, 0.1459733, 2.557875, 0, 0, 0, 1, 1,
0.4002413, -0.7662007, 3.509648, 0, 0, 0, 1, 1,
0.4032148, 1.304812, -0.184229, 0, 0, 0, 1, 1,
0.4040049, -0.7440535, 4.356833, 0, 0, 0, 1, 1,
0.4069358, 0.02196375, 2.123876, 0, 0, 0, 1, 1,
0.408315, -1.459873, 4.759991, 1, 1, 1, 1, 1,
0.4087245, 0.9640189, 0.2989076, 1, 1, 1, 1, 1,
0.4138807, -0.4513003, 1.273883, 1, 1, 1, 1, 1,
0.4155176, 0.5603015, 0.9366472, 1, 1, 1, 1, 1,
0.4162439, 0.2380361, 1.992899, 1, 1, 1, 1, 1,
0.4180119, -0.3727804, 2.882901, 1, 1, 1, 1, 1,
0.4191502, 0.7136678, -0.6497318, 1, 1, 1, 1, 1,
0.420282, -0.3484429, 4.051293, 1, 1, 1, 1, 1,
0.4253884, 0.4738065, 1.384472, 1, 1, 1, 1, 1,
0.4277839, -1.840548, 4.393973, 1, 1, 1, 1, 1,
0.4294678, -0.3560607, 1.521423, 1, 1, 1, 1, 1,
0.4380082, 2.728897, 0.3564516, 1, 1, 1, 1, 1,
0.4390515, -0.3328034, 3.855212, 1, 1, 1, 1, 1,
0.4470216, 0.7729452, 1.046276, 1, 1, 1, 1, 1,
0.4506106, 1.009054, -1.146165, 1, 1, 1, 1, 1,
0.4514141, -0.3037317, 1.491127, 0, 0, 1, 1, 1,
0.4519609, 0.009800617, 0.5795283, 1, 0, 0, 1, 1,
0.452209, 1.302709, -1.834531, 1, 0, 0, 1, 1,
0.4525512, -0.6833234, 3.007576, 1, 0, 0, 1, 1,
0.4551772, 0.8774803, 0.1808302, 1, 0, 0, 1, 1,
0.4565761, 0.05704474, 2.749593, 1, 0, 0, 1, 1,
0.4588515, -0.4903843, 3.64286, 0, 0, 0, 1, 1,
0.4597625, -0.4223647, 1.884476, 0, 0, 0, 1, 1,
0.4711344, -0.9411825, 2.729449, 0, 0, 0, 1, 1,
0.4726211, -1.53253, 2.841138, 0, 0, 0, 1, 1,
0.4752296, 0.1257967, 1.002707, 0, 0, 0, 1, 1,
0.4767833, -0.07375951, 3.410953, 0, 0, 0, 1, 1,
0.4773821, 0.4005045, -0.9348366, 0, 0, 0, 1, 1,
0.4779296, -0.3725709, 2.29532, 1, 1, 1, 1, 1,
0.4818167, -1.110074, 1.721827, 1, 1, 1, 1, 1,
0.4825226, -0.1422428, 2.384976, 1, 1, 1, 1, 1,
0.4859745, 0.6120552, -0.08113486, 1, 1, 1, 1, 1,
0.486474, 1.556406, 0.4152687, 1, 1, 1, 1, 1,
0.4915246, 0.032621, 1.674321, 1, 1, 1, 1, 1,
0.4967493, 1.343717, 1.536621, 1, 1, 1, 1, 1,
0.4978404, 1.675656, 1.806669, 1, 1, 1, 1, 1,
0.4993249, -1.044798, 1.566594, 1, 1, 1, 1, 1,
0.5053338, 1.467666, 1.608044, 1, 1, 1, 1, 1,
0.5053781, 1.43169, 0.3762126, 1, 1, 1, 1, 1,
0.5056984, 2.437256, 0.03840436, 1, 1, 1, 1, 1,
0.505986, 1.008264, 1.121738, 1, 1, 1, 1, 1,
0.5085059, -0.101343, 2.30284, 1, 1, 1, 1, 1,
0.5107, -0.6028346, 2.139176, 1, 1, 1, 1, 1,
0.517067, -1.175246, 2.232476, 0, 0, 1, 1, 1,
0.5227357, 0.5194257, 2.569141, 1, 0, 0, 1, 1,
0.5262147, -0.466817, 2.250835, 1, 0, 0, 1, 1,
0.5306461, 0.7076347, 0.1277272, 1, 0, 0, 1, 1,
0.530825, -1.039204, 0.8314274, 1, 0, 0, 1, 1,
0.5325214, 0.08958022, 1.790987, 1, 0, 0, 1, 1,
0.5359995, -0.8591888, 3.242798, 0, 0, 0, 1, 1,
0.5373532, 0.9530672, 0.2684566, 0, 0, 0, 1, 1,
0.5400587, 0.2758324, 3.718519, 0, 0, 0, 1, 1,
0.5447933, 0.2520447, 0.5694566, 0, 0, 0, 1, 1,
0.5493101, -0.9361974, 1.380892, 0, 0, 0, 1, 1,
0.5544724, 0.003343438, 0.5136879, 0, 0, 0, 1, 1,
0.5568262, 1.337822, 0.9017628, 0, 0, 0, 1, 1,
0.5585739, 1.338479, 0.7096173, 1, 1, 1, 1, 1,
0.5591092, 1.974336, -0.02542548, 1, 1, 1, 1, 1,
0.5720448, -4.48834, 3.583928, 1, 1, 1, 1, 1,
0.5721785, -0.265476, 1.149421, 1, 1, 1, 1, 1,
0.5735304, -2.15639, 0.3776004, 1, 1, 1, 1, 1,
0.575352, 0.08619213, 3.121514, 1, 1, 1, 1, 1,
0.5757105, -0.6246414, 2.876884, 1, 1, 1, 1, 1,
0.5779996, 0.4614119, -0.2669535, 1, 1, 1, 1, 1,
0.5974638, 0.8819835, 1.486653, 1, 1, 1, 1, 1,
0.5980501, -1.565788, 2.308408, 1, 1, 1, 1, 1,
0.6044156, -0.476927, 2.327445, 1, 1, 1, 1, 1,
0.6056939, 0.4352676, 0.8769547, 1, 1, 1, 1, 1,
0.6136802, -1.853268, 3.528128, 1, 1, 1, 1, 1,
0.6161106, 1.767644, 0.08799478, 1, 1, 1, 1, 1,
0.6185079, -0.8689175, 1.973867, 1, 1, 1, 1, 1,
0.6216292, -0.7227322, 3.414238, 0, 0, 1, 1, 1,
0.6221184, 0.844151, -0.3243917, 1, 0, 0, 1, 1,
0.6244515, -0.4697179, 1.498284, 1, 0, 0, 1, 1,
0.6248878, -1.186222, 2.384199, 1, 0, 0, 1, 1,
0.6289024, 0.2043159, 2.187153, 1, 0, 0, 1, 1,
0.6348112, -0.6894615, 2.276138, 1, 0, 0, 1, 1,
0.635134, -0.1038413, 2.250299, 0, 0, 0, 1, 1,
0.6430092, -0.5011159, 1.274854, 0, 0, 0, 1, 1,
0.6485819, 1.479475, -0.009950499, 0, 0, 0, 1, 1,
0.6542056, 0.947805, 0.07875024, 0, 0, 0, 1, 1,
0.6550095, -0.7720914, 3.026046, 0, 0, 0, 1, 1,
0.6562287, -1.318568, 2.532854, 0, 0, 0, 1, 1,
0.6632604, -0.3183233, 2.508555, 0, 0, 0, 1, 1,
0.6668732, 0.2099075, 2.05498, 1, 1, 1, 1, 1,
0.6714612, 1.173012, 2.488971, 1, 1, 1, 1, 1,
0.6719087, 0.6199014, 1.203216, 1, 1, 1, 1, 1,
0.6724038, -0.8631552, 4.296834, 1, 1, 1, 1, 1,
0.6727375, -0.3152313, 1.897536, 1, 1, 1, 1, 1,
0.6892241, 0.1599229, 0.7344074, 1, 1, 1, 1, 1,
0.6909065, -2.333198, 1.449278, 1, 1, 1, 1, 1,
0.6921444, 0.6813866, 1.39009, 1, 1, 1, 1, 1,
0.6923282, 0.2914338, 1.521737, 1, 1, 1, 1, 1,
0.6985695, -0.08745634, 1.452979, 1, 1, 1, 1, 1,
0.7037761, -0.1030809, 0.9831771, 1, 1, 1, 1, 1,
0.7038413, 1.346695, 1.935184, 1, 1, 1, 1, 1,
0.7044801, 0.5724929, 1.858565, 1, 1, 1, 1, 1,
0.7074285, 0.1551521, 2.760183, 1, 1, 1, 1, 1,
0.7078472, -0.09885426, 2.905028, 1, 1, 1, 1, 1,
0.7079162, -1.895596, 3.708282, 0, 0, 1, 1, 1,
0.7096564, 0.441599, 0.7610849, 1, 0, 0, 1, 1,
0.7115391, 0.4762507, -1.649097, 1, 0, 0, 1, 1,
0.7132831, 0.1325514, 0.7356094, 1, 0, 0, 1, 1,
0.7229289, 0.7595332, 1.247001, 1, 0, 0, 1, 1,
0.7255734, 0.262271, 0.666405, 1, 0, 0, 1, 1,
0.7307588, -0.2718716, 0.7829628, 0, 0, 0, 1, 1,
0.7342677, 0.08960285, -0.3649323, 0, 0, 0, 1, 1,
0.7436028, -0.3042898, 2.433268, 0, 0, 0, 1, 1,
0.7440764, -1.453117, 3.815433, 0, 0, 0, 1, 1,
0.7460232, -1.209987, 1.879521, 0, 0, 0, 1, 1,
0.7526008, -0.09399094, 0.8848335, 0, 0, 0, 1, 1,
0.7571172, 0.7599245, -0.05949659, 0, 0, 0, 1, 1,
0.7598608, -2.282661, 4.749578, 1, 1, 1, 1, 1,
0.7612077, -1.828021, 1.999893, 1, 1, 1, 1, 1,
0.7633364, 0.9851511, -0.7032344, 1, 1, 1, 1, 1,
0.7644903, -1.983637, 3.567966, 1, 1, 1, 1, 1,
0.7651883, -0.1575856, 1.598359, 1, 1, 1, 1, 1,
0.7652078, 1.274998, 1.115563, 1, 1, 1, 1, 1,
0.7668565, 1.105544, -0.3010502, 1, 1, 1, 1, 1,
0.7735707, 0.1821623, -0.4606631, 1, 1, 1, 1, 1,
0.7747877, 0.2204241, 0.6941495, 1, 1, 1, 1, 1,
0.7768572, -1.181876, 2.981395, 1, 1, 1, 1, 1,
0.7772592, -0.1606251, 1.712417, 1, 1, 1, 1, 1,
0.7836288, -0.6911102, 2.233654, 1, 1, 1, 1, 1,
0.7946389, -0.6409494, 2.629519, 1, 1, 1, 1, 1,
0.7966464, -0.2288146, 3.380227, 1, 1, 1, 1, 1,
0.8001775, 0.1373571, -0.6807442, 1, 1, 1, 1, 1,
0.8095651, -0.3747343, 3.391718, 0, 0, 1, 1, 1,
0.8113946, -0.05589656, 1.943411, 1, 0, 0, 1, 1,
0.8131117, 0.03338927, 2.243744, 1, 0, 0, 1, 1,
0.8193675, -1.260069, 2.001383, 1, 0, 0, 1, 1,
0.8204771, 0.9859247, -2.528862, 1, 0, 0, 1, 1,
0.8308412, 0.320528, 2.616776, 1, 0, 0, 1, 1,
0.8309294, -1.191392, 3.44277, 0, 0, 0, 1, 1,
0.8349434, -0.3142587, 0.4091842, 0, 0, 0, 1, 1,
0.8349701, 0.9544508, 1.915619, 0, 0, 0, 1, 1,
0.8353651, 1.509335, 1.550136, 0, 0, 0, 1, 1,
0.8413193, -0.7776754, 1.386123, 0, 0, 0, 1, 1,
0.8424296, 1.427278, 0.9354182, 0, 0, 0, 1, 1,
0.8461373, -1.512183, 2.277419, 0, 0, 0, 1, 1,
0.8598206, -1.35253, 3.354429, 1, 1, 1, 1, 1,
0.8655823, -0.4284221, 1.927612, 1, 1, 1, 1, 1,
0.86965, 0.9861385, -0.818225, 1, 1, 1, 1, 1,
0.8713929, -2.483836, 2.063431, 1, 1, 1, 1, 1,
0.8736475, -1.987317, 3.716181, 1, 1, 1, 1, 1,
0.8751013, -1.126541, 3.236974, 1, 1, 1, 1, 1,
0.8768958, 1.026298, 0.07479748, 1, 1, 1, 1, 1,
0.8823119, 0.09624872, -0.6163083, 1, 1, 1, 1, 1,
0.8832862, -0.7844364, 1.984031, 1, 1, 1, 1, 1,
0.8833334, -0.0351209, 3.067388, 1, 1, 1, 1, 1,
0.8841226, 0.3227785, 1.988562, 1, 1, 1, 1, 1,
0.8881705, 0.5299276, 1.814586, 1, 1, 1, 1, 1,
0.8902531, 1.723628, 1.628133, 1, 1, 1, 1, 1,
0.8913225, -1.229658, 1.259367, 1, 1, 1, 1, 1,
0.8936204, 0.671097, 1.501122, 1, 1, 1, 1, 1,
0.8959258, 1.993795, 0.4196338, 0, 0, 1, 1, 1,
0.8980678, -0.7901134, 2.972802, 1, 0, 0, 1, 1,
0.8982002, -0.9574746, 2.254614, 1, 0, 0, 1, 1,
0.9023544, -0.04922526, 1.74821, 1, 0, 0, 1, 1,
0.9027734, 0.9718325, -0.4628685, 1, 0, 0, 1, 1,
0.9072576, 2.340685, -0.7146567, 1, 0, 0, 1, 1,
0.9102838, 1.188786, -0.8777014, 0, 0, 0, 1, 1,
0.9131212, 0.1933945, 1.324679, 0, 0, 0, 1, 1,
0.917843, -0.8161175, 2.570389, 0, 0, 0, 1, 1,
0.922035, -0.3780453, 2.176634, 0, 0, 0, 1, 1,
0.9234188, 0.6208367, 3.591348, 0, 0, 0, 1, 1,
0.9272804, -1.370188, 3.446159, 0, 0, 0, 1, 1,
0.9296008, -1.776404, 2.211814, 0, 0, 0, 1, 1,
0.9331059, -0.6371104, 4.729331, 1, 1, 1, 1, 1,
0.9355544, -0.8370251, 1.217629, 1, 1, 1, 1, 1,
0.9386434, 0.4600247, 1.515992, 1, 1, 1, 1, 1,
0.938971, -0.2950221, 2.358285, 1, 1, 1, 1, 1,
0.946669, -0.05199269, 2.59072, 1, 1, 1, 1, 1,
0.9470981, -0.6317697, 3.045151, 1, 1, 1, 1, 1,
0.9531632, -0.2856189, 1.40191, 1, 1, 1, 1, 1,
0.9560588, -0.4168963, 2.867519, 1, 1, 1, 1, 1,
0.9570627, -0.2409898, -0.217659, 1, 1, 1, 1, 1,
0.9604343, 0.08956928, 1.746519, 1, 1, 1, 1, 1,
0.964199, 0.003004019, 0.2308348, 1, 1, 1, 1, 1,
0.9649187, -1.223017, 4.487885, 1, 1, 1, 1, 1,
0.9655872, -0.6780265, 2.882139, 1, 1, 1, 1, 1,
0.9684375, -0.4589105, 2.796616, 1, 1, 1, 1, 1,
0.970378, -0.5534101, 2.169524, 1, 1, 1, 1, 1,
0.975536, 0.8826388, 1.082522, 0, 0, 1, 1, 1,
0.9766786, -0.7560379, 1.346362, 1, 0, 0, 1, 1,
0.9772966, 0.5775881, 0.1174556, 1, 0, 0, 1, 1,
0.9912939, 0.9655088, 1.136885, 1, 0, 0, 1, 1,
0.9995196, 1.078081, 0.1900325, 1, 0, 0, 1, 1,
1.011262, -1.989086, 2.087056, 1, 0, 0, 1, 1,
1.012947, -1.360249, 4.258725, 0, 0, 0, 1, 1,
1.019542, 0.6986257, -0.2176647, 0, 0, 0, 1, 1,
1.021072, 0.1026712, 1.568723, 0, 0, 0, 1, 1,
1.026678, -0.2244433, 2.440216, 0, 0, 0, 1, 1,
1.036047, -0.4775652, 0.8071193, 0, 0, 0, 1, 1,
1.042342, 0.4276569, -1.236936, 0, 0, 0, 1, 1,
1.047192, 0.7672462, 0.127933, 0, 0, 0, 1, 1,
1.048017, 0.427471, 1.806649, 1, 1, 1, 1, 1,
1.048132, 0.1029156, 2.210884, 1, 1, 1, 1, 1,
1.054649, -1.404313, 1.796702, 1, 1, 1, 1, 1,
1.059546, -0.4146377, 0.09225403, 1, 1, 1, 1, 1,
1.061039, -1.810915, 3.868561, 1, 1, 1, 1, 1,
1.062825, -0.1239408, 2.350431, 1, 1, 1, 1, 1,
1.063654, -1.197403, 1.952402, 1, 1, 1, 1, 1,
1.064264, -0.3361583, 0.8299167, 1, 1, 1, 1, 1,
1.06594, -1.608824, 0.5339158, 1, 1, 1, 1, 1,
1.08003, -0.6514812, 3.118066, 1, 1, 1, 1, 1,
1.082659, -0.1968148, 1.673203, 1, 1, 1, 1, 1,
1.082961, -1.068471, 1.332545, 1, 1, 1, 1, 1,
1.084625, 2.296894, -0.1078764, 1, 1, 1, 1, 1,
1.089203, -2.217077, 2.052697, 1, 1, 1, 1, 1,
1.091066, 1.089409, 0.7311813, 1, 1, 1, 1, 1,
1.091378, -0.4667092, 2.878382, 0, 0, 1, 1, 1,
1.094567, -0.5622594, 3.193662, 1, 0, 0, 1, 1,
1.101583, 1.141249, 2.20154, 1, 0, 0, 1, 1,
1.110612, 0.548849, 0.6024173, 1, 0, 0, 1, 1,
1.12258, 0.2187395, 2.410398, 1, 0, 0, 1, 1,
1.128154, -0.8239855, 2.711206, 1, 0, 0, 1, 1,
1.134204, -0.5638039, 2.730445, 0, 0, 0, 1, 1,
1.136751, 0.1569685, 0.2997573, 0, 0, 0, 1, 1,
1.163615, -1.683532, 2.121268, 0, 0, 0, 1, 1,
1.165515, -1.379922, 3.36808, 0, 0, 0, 1, 1,
1.173479, 0.1299447, 1.350981, 0, 0, 0, 1, 1,
1.180878, -1.359739, 0.8612261, 0, 0, 0, 1, 1,
1.183236, 0.04490525, 2.346871, 0, 0, 0, 1, 1,
1.184066, -1.014227, 2.341781, 1, 1, 1, 1, 1,
1.186744, -0.06571552, 1.937676, 1, 1, 1, 1, 1,
1.187667, 0.635921, 1.62101, 1, 1, 1, 1, 1,
1.188633, -1.297764, 2.138331, 1, 1, 1, 1, 1,
1.196402, -1.634559, 1.350588, 1, 1, 1, 1, 1,
1.197691, -0.5550064, 2.25237, 1, 1, 1, 1, 1,
1.199435, -0.6480405, 3.26732, 1, 1, 1, 1, 1,
1.2017, 0.7806615, -0.4548818, 1, 1, 1, 1, 1,
1.222687, 0.690716, 0.8096663, 1, 1, 1, 1, 1,
1.225323, -0.5312876, 0.7707763, 1, 1, 1, 1, 1,
1.230288, -0.4076384, 0.83282, 1, 1, 1, 1, 1,
1.230372, 0.5917208, -1.042066, 1, 1, 1, 1, 1,
1.236632, -1.755813, 3.481114, 1, 1, 1, 1, 1,
1.248511, -0.7118896, 2.171919, 1, 1, 1, 1, 1,
1.250609, 1.091721, -0.608852, 1, 1, 1, 1, 1,
1.262596, 0.09629487, 1.677798, 0, 0, 1, 1, 1,
1.263416, 0.864989, 0.8845236, 1, 0, 0, 1, 1,
1.264442, 1.4623, 1.246047, 1, 0, 0, 1, 1,
1.267294, -1.52909, 2.272944, 1, 0, 0, 1, 1,
1.270082, 0.1366709, 1.358169, 1, 0, 0, 1, 1,
1.283573, 0.9095458, 1.310347, 1, 0, 0, 1, 1,
1.291738, -0.1850975, 0.2800938, 0, 0, 0, 1, 1,
1.296214, -0.1879311, 1.802005, 0, 0, 0, 1, 1,
1.300709, -0.03168395, 1.516293, 0, 0, 0, 1, 1,
1.301797, 0.961136, -0.4604801, 0, 0, 0, 1, 1,
1.304091, 0.6610313, 0.2131931, 0, 0, 0, 1, 1,
1.33573, 1.075476, 0.8133414, 0, 0, 0, 1, 1,
1.340324, 1.748508, 1.476561, 0, 0, 0, 1, 1,
1.361485, 0.4803314, 1.979753, 1, 1, 1, 1, 1,
1.362091, 0.4590741, 1.530014, 1, 1, 1, 1, 1,
1.368709, 0.846626, 1.332257, 1, 1, 1, 1, 1,
1.368769, -0.0429854, 2.223688, 1, 1, 1, 1, 1,
1.37804, -0.8297161, 2.157364, 1, 1, 1, 1, 1,
1.380855, -1.023475, 1.425709, 1, 1, 1, 1, 1,
1.384396, 0.1224322, 1.522561, 1, 1, 1, 1, 1,
1.395013, 0.8049757, -0.6972479, 1, 1, 1, 1, 1,
1.398628, 0.7620487, -1.321008, 1, 1, 1, 1, 1,
1.402277, -1.498152, 2.501764, 1, 1, 1, 1, 1,
1.411135, -1.107099, 1.822564, 1, 1, 1, 1, 1,
1.413521, -0.2852987, 2.435127, 1, 1, 1, 1, 1,
1.415317, -1.126912, 1.525074, 1, 1, 1, 1, 1,
1.417404, -0.2059201, 1.24656, 1, 1, 1, 1, 1,
1.418333, 0.04866342, 2.080378, 1, 1, 1, 1, 1,
1.423506, -0.2949117, 1.725632, 0, 0, 1, 1, 1,
1.428281, -0.3040785, 1.081015, 1, 0, 0, 1, 1,
1.438805, 0.877822, 1.000176, 1, 0, 0, 1, 1,
1.449137, -1.133437, 1.612776, 1, 0, 0, 1, 1,
1.452795, -0.5234847, 1.8527, 1, 0, 0, 1, 1,
1.469738, -0.5228581, 1.331106, 1, 0, 0, 1, 1,
1.469939, 0.08287577, 2.912199, 0, 0, 0, 1, 1,
1.469972, -1.149192, 0.9049931, 0, 0, 0, 1, 1,
1.471553, -1.538858, 1.113611, 0, 0, 0, 1, 1,
1.478697, 0.4657817, 0.6798089, 0, 0, 0, 1, 1,
1.485242, 0.1748972, 1.882107, 0, 0, 0, 1, 1,
1.486015, -1.566342, 1.58846, 0, 0, 0, 1, 1,
1.486559, -0.2555918, 0.7860851, 0, 0, 0, 1, 1,
1.48761, 0.7209172, -0.3982276, 1, 1, 1, 1, 1,
1.491704, 0.5164732, 0.4873889, 1, 1, 1, 1, 1,
1.510825, -0.4762692, 3.333846, 1, 1, 1, 1, 1,
1.523408, 0.2820964, 1.140947, 1, 1, 1, 1, 1,
1.531741, 0.5387591, 1.624227, 1, 1, 1, 1, 1,
1.565107, -1.318043, 4.103107, 1, 1, 1, 1, 1,
1.571819, -1.160654, 1.360357, 1, 1, 1, 1, 1,
1.579757, -0.07210988, -0.2074119, 1, 1, 1, 1, 1,
1.582011, 1.776208, 0.667964, 1, 1, 1, 1, 1,
1.589327, -0.8823223, 1.588504, 1, 1, 1, 1, 1,
1.597247, 0.2022067, 2.782302, 1, 1, 1, 1, 1,
1.622448, 0.04973252, 2.533177, 1, 1, 1, 1, 1,
1.642887, 1.021885, 0.9012681, 1, 1, 1, 1, 1,
1.655572, -1.400431, 3.083725, 1, 1, 1, 1, 1,
1.657079, -0.918047, 1.439601, 1, 1, 1, 1, 1,
1.673042, -0.5825486, 1.396274, 0, 0, 1, 1, 1,
1.674227, 0.4866304, 3.144504, 1, 0, 0, 1, 1,
1.676878, 0.6622881, 1.452098, 1, 0, 0, 1, 1,
1.683003, -0.6815262, 1.388123, 1, 0, 0, 1, 1,
1.693163, -0.3724551, 1.220297, 1, 0, 0, 1, 1,
1.712416, 1.045699, -0.251163, 1, 0, 0, 1, 1,
1.717071, 1.952523, 1.460796, 0, 0, 0, 1, 1,
1.7402, -0.2735849, 3.057489, 0, 0, 0, 1, 1,
1.743609, 0.4617371, 2.221121, 0, 0, 0, 1, 1,
1.752036, -1.355374, 1.603468, 0, 0, 0, 1, 1,
1.761944, 0.8589697, 1.592695, 0, 0, 0, 1, 1,
1.768648, -1.061001, 2.10769, 0, 0, 0, 1, 1,
1.773476, -1.902485, 2.261338, 0, 0, 0, 1, 1,
1.777085, -0.2450307, 1.728555, 1, 1, 1, 1, 1,
1.792637, -0.007990058, 0.6754483, 1, 1, 1, 1, 1,
1.806523, -0.6213439, 2.489458, 1, 1, 1, 1, 1,
1.83028, -2.820228, 1.843184, 1, 1, 1, 1, 1,
1.854376, -1.167072, 2.608521, 1, 1, 1, 1, 1,
1.856515, 0.7728598, 0.6500131, 1, 1, 1, 1, 1,
1.86272, 1.414349, 0.7197976, 1, 1, 1, 1, 1,
1.869546, -1.667639, 2.701152, 1, 1, 1, 1, 1,
1.890475, -0.8113071, 1.563801, 1, 1, 1, 1, 1,
1.951838, 0.5877497, 1.060796, 1, 1, 1, 1, 1,
1.957889, -0.1744841, 1.671999, 1, 1, 1, 1, 1,
1.96698, 0.7318556, 2.244469, 1, 1, 1, 1, 1,
1.975744, 1.208428, 0.3620398, 1, 1, 1, 1, 1,
1.983701, -1.723071, 2.694038, 1, 1, 1, 1, 1,
1.999924, 0.7951524, 1.917919, 1, 1, 1, 1, 1,
2.010103, 0.195162, 1.561152, 0, 0, 1, 1, 1,
2.011325, -1.711487, 2.013758, 1, 0, 0, 1, 1,
2.013952, -0.7388988, 1.166435, 1, 0, 0, 1, 1,
2.0711, 1.369573, 0.566079, 1, 0, 0, 1, 1,
2.077663, 1.214983, 1.460775, 1, 0, 0, 1, 1,
2.099734, 1.214666, -0.4922127, 1, 0, 0, 1, 1,
2.105602, 1.73992, 1.121216, 0, 0, 0, 1, 1,
2.144683, -0.4855546, 2.131469, 0, 0, 0, 1, 1,
2.153954, 0.3708164, -0.7902697, 0, 0, 0, 1, 1,
2.204488, -0.4184246, -0.4419873, 0, 0, 0, 1, 1,
2.214051, 1.620253, 1.37509, 0, 0, 0, 1, 1,
2.228798, 0.05928219, 0.8938033, 0, 0, 0, 1, 1,
2.228809, 0.1338857, 1.532689, 0, 0, 0, 1, 1,
2.243074, -0.01690832, 2.630317, 1, 1, 1, 1, 1,
2.331487, 1.025762, 1.747749, 1, 1, 1, 1, 1,
2.34902, -1.1769, 2.02659, 1, 1, 1, 1, 1,
2.364479, 0.3168411, 2.203097, 1, 1, 1, 1, 1,
2.542665, -1.732406, 0.448819, 1, 1, 1, 1, 1,
2.99152, -0.1689586, 1.295482, 1, 1, 1, 1, 1,
3.079918, 0.6852729, 3.012461, 1, 1, 1, 1, 1
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
var radius = 10.04088;
var distance = 35.26817;
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
mvMatrix.translate( 0.2340293, 0.5935183, -0.3215559 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.26817);
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
