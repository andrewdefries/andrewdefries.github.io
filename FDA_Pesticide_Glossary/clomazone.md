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
-3.508273, -1.932258, -2.548101, 1, 0, 0, 1,
-2.896241, -0.4731039, 0.07391607, 1, 0.007843138, 0, 1,
-2.834579, 0.02109839, -2.447573, 1, 0.01176471, 0, 1,
-2.688164, -1.270103, -2.659015, 1, 0.01960784, 0, 1,
-2.625234, 1.337075, -0.3849301, 1, 0.02352941, 0, 1,
-2.610948, -1.007728, -2.204889, 1, 0.03137255, 0, 1,
-2.545363, 0.6797199, -0.7208809, 1, 0.03529412, 0, 1,
-2.379869, -0.05755223, -0.2917197, 1, 0.04313726, 0, 1,
-2.375451, -0.08019199, -0.2753114, 1, 0.04705882, 0, 1,
-2.314088, -0.6974607, -1.33633, 1, 0.05490196, 0, 1,
-2.243179, 0.5058455, -0.6463028, 1, 0.05882353, 0, 1,
-2.214049, -1.075255, -2.546971, 1, 0.06666667, 0, 1,
-2.211787, -0.3154242, -3.148099, 1, 0.07058824, 0, 1,
-2.148038, -1.747106, -1.680402, 1, 0.07843138, 0, 1,
-2.066405, -0.3302764, -2.43711, 1, 0.08235294, 0, 1,
-2.055027, -0.3067978, -2.850653, 1, 0.09019608, 0, 1,
-2.028085, -1.030876, -0.4569061, 1, 0.09411765, 0, 1,
-1.997977, 0.02659588, -1.509715, 1, 0.1019608, 0, 1,
-1.935357, -0.4964731, -2.590246, 1, 0.1098039, 0, 1,
-1.90215, 0.01725273, -2.258126, 1, 0.1137255, 0, 1,
-1.877778, -0.5971768, -1.466118, 1, 0.1215686, 0, 1,
-1.876619, 1.143115, -2.283021, 1, 0.1254902, 0, 1,
-1.854081, 0.01364497, -0.8888044, 1, 0.1333333, 0, 1,
-1.846875, -0.5302216, -2.395272, 1, 0.1372549, 0, 1,
-1.842578, -0.8572225, -2.465536, 1, 0.145098, 0, 1,
-1.83557, 0.1220016, -2.220118, 1, 0.1490196, 0, 1,
-1.829179, 0.2736105, -0.463135, 1, 0.1568628, 0, 1,
-1.799417, -1.537014, -2.397414, 1, 0.1607843, 0, 1,
-1.798088, -0.7860854, -1.486979, 1, 0.1686275, 0, 1,
-1.796036, 0.05025031, -1.151588, 1, 0.172549, 0, 1,
-1.779459, -0.8344275, -1.640528, 1, 0.1803922, 0, 1,
-1.774831, -0.1977776, -2.390779, 1, 0.1843137, 0, 1,
-1.753098, 0.7252992, -2.83338, 1, 0.1921569, 0, 1,
-1.73575, 0.5178995, 0.147389, 1, 0.1960784, 0, 1,
-1.735383, -1.834055, -0.4270453, 1, 0.2039216, 0, 1,
-1.721151, -0.4319971, -2.411416, 1, 0.2117647, 0, 1,
-1.718803, -0.6949738, -5.40569, 1, 0.2156863, 0, 1,
-1.716489, -1.703791, -2.273933, 1, 0.2235294, 0, 1,
-1.709056, 0.1464935, -2.139789, 1, 0.227451, 0, 1,
-1.697556, -0.4519935, -1.950964, 1, 0.2352941, 0, 1,
-1.696713, 0.9299916, -0.4443206, 1, 0.2392157, 0, 1,
-1.680549, 0.1266622, -2.261164, 1, 0.2470588, 0, 1,
-1.666058, -2.279085, -2.358598, 1, 0.2509804, 0, 1,
-1.633347, -0.6344004, -1.268704, 1, 0.2588235, 0, 1,
-1.59259, 0.7299519, -1.906136, 1, 0.2627451, 0, 1,
-1.584494, 0.8034205, -0.191924, 1, 0.2705882, 0, 1,
-1.580623, -0.1934061, -2.341308, 1, 0.2745098, 0, 1,
-1.579732, 0.1805509, -0.7171092, 1, 0.282353, 0, 1,
-1.578947, 0.1121426, 0.7283571, 1, 0.2862745, 0, 1,
-1.578817, -1.935824, -2.427274, 1, 0.2941177, 0, 1,
-1.576326, -0.003986879, -1.201623, 1, 0.3019608, 0, 1,
-1.562078, -0.04614005, -2.769216, 1, 0.3058824, 0, 1,
-1.56028, 0.62089, -0.06839855, 1, 0.3137255, 0, 1,
-1.557488, -2.1606, -3.452361, 1, 0.3176471, 0, 1,
-1.551289, -0.09302765, -1.803914, 1, 0.3254902, 0, 1,
-1.550854, 0.7709149, 0.03460488, 1, 0.3294118, 0, 1,
-1.550095, 0.5431188, -1.033105, 1, 0.3372549, 0, 1,
-1.545255, -0.3573053, -2.854656, 1, 0.3411765, 0, 1,
-1.526268, 0.1970893, -1.211087, 1, 0.3490196, 0, 1,
-1.523882, 3.17692, -0.4675168, 1, 0.3529412, 0, 1,
-1.510565, -0.2274591, -0.5947921, 1, 0.3607843, 0, 1,
-1.510288, 0.9366183, -2.369328, 1, 0.3647059, 0, 1,
-1.500316, -0.2766104, -1.461074, 1, 0.372549, 0, 1,
-1.496218, 1.475986, -1.404642, 1, 0.3764706, 0, 1,
-1.491539, 0.7221029, -0.2449468, 1, 0.3843137, 0, 1,
-1.487783, 0.5675834, -2.554307, 1, 0.3882353, 0, 1,
-1.45188, -0.6474174, -3.06268, 1, 0.3960784, 0, 1,
-1.44944, 1.074445, 0.3739444, 1, 0.4039216, 0, 1,
-1.445771, 1.228224, -0.2319207, 1, 0.4078431, 0, 1,
-1.438684, -0.6476363, -0.8219592, 1, 0.4156863, 0, 1,
-1.43709, -0.6008387, -0.7560856, 1, 0.4196078, 0, 1,
-1.436314, 0.8823906, 0.1192077, 1, 0.427451, 0, 1,
-1.429449, 0.2901872, -2.410247, 1, 0.4313726, 0, 1,
-1.419696, -1.876132, -4.867203, 1, 0.4392157, 0, 1,
-1.393829, 0.4666102, -0.9001734, 1, 0.4431373, 0, 1,
-1.392142, -1.663453, -3.095843, 1, 0.4509804, 0, 1,
-1.377629, 1.352955, -0.9641469, 1, 0.454902, 0, 1,
-1.375497, -0.9712629, -1.893402, 1, 0.4627451, 0, 1,
-1.374216, 0.4893679, -1.322708, 1, 0.4666667, 0, 1,
-1.364455, -0.9291547, -2.803334, 1, 0.4745098, 0, 1,
-1.358968, 0.3194184, -0.6293714, 1, 0.4784314, 0, 1,
-1.348975, 1.125936, -0.569729, 1, 0.4862745, 0, 1,
-1.341154, 0.2873951, 0.06922478, 1, 0.4901961, 0, 1,
-1.340211, -1.039969, -3.574457, 1, 0.4980392, 0, 1,
-1.336705, 0.003931988, -0.228434, 1, 0.5058824, 0, 1,
-1.335986, 0.08522259, -1.049262, 1, 0.509804, 0, 1,
-1.331156, 0.1280803, -1.804218, 1, 0.5176471, 0, 1,
-1.326823, 0.4864805, -1.701112, 1, 0.5215687, 0, 1,
-1.324371, -0.6493512, -2.042435, 1, 0.5294118, 0, 1,
-1.317521, -0.4687857, -3.172329, 1, 0.5333334, 0, 1,
-1.309497, 0.0965126, -1.901039, 1, 0.5411765, 0, 1,
-1.298193, 0.8627356, 0.2674036, 1, 0.5450981, 0, 1,
-1.284358, 0.1085207, -2.467727, 1, 0.5529412, 0, 1,
-1.280947, -0.9405051, -2.04203, 1, 0.5568628, 0, 1,
-1.280381, -0.5985743, -1.712454, 1, 0.5647059, 0, 1,
-1.279692, 1.011155, -3.057121, 1, 0.5686275, 0, 1,
-1.27481, -0.06961312, -1.518308, 1, 0.5764706, 0, 1,
-1.270012, -0.6277952, -0.7578809, 1, 0.5803922, 0, 1,
-1.265754, 2.524702, -0.7054383, 1, 0.5882353, 0, 1,
-1.248025, -0.1368227, -0.1039377, 1, 0.5921569, 0, 1,
-1.238426, 2.050564, -0.3260315, 1, 0.6, 0, 1,
-1.232844, 1.164662, -0.7058948, 1, 0.6078432, 0, 1,
-1.218475, 2.151441, 0.4363723, 1, 0.6117647, 0, 1,
-1.212293, 0.1548749, -1.48153, 1, 0.6196079, 0, 1,
-1.211789, 0.72882, -0.8064528, 1, 0.6235294, 0, 1,
-1.211625, -0.1094133, -1.932714, 1, 0.6313726, 0, 1,
-1.202212, -2.206909, -2.777908, 1, 0.6352941, 0, 1,
-1.192854, 0.5147742, -2.140448, 1, 0.6431373, 0, 1,
-1.182736, -0.1471196, -0.2141188, 1, 0.6470588, 0, 1,
-1.176955, 0.8407589, 0.4034404, 1, 0.654902, 0, 1,
-1.174569, 0.7364392, -0.8091242, 1, 0.6588235, 0, 1,
-1.171884, -0.5992342, -2.404429, 1, 0.6666667, 0, 1,
-1.163259, 0.06307567, -2.607824, 1, 0.6705883, 0, 1,
-1.162058, -0.5726629, -3.453614, 1, 0.6784314, 0, 1,
-1.161419, 1.123285, -1.435653, 1, 0.682353, 0, 1,
-1.161186, 0.2295648, -1.485711, 1, 0.6901961, 0, 1,
-1.156448, 0.1155746, -0.6034386, 1, 0.6941177, 0, 1,
-1.154495, -1.199014, -2.469666, 1, 0.7019608, 0, 1,
-1.153883, 0.228284, -1.491013, 1, 0.7098039, 0, 1,
-1.15295, -1.412864, -1.908786, 1, 0.7137255, 0, 1,
-1.152476, -0.4035337, -1.653815, 1, 0.7215686, 0, 1,
-1.146987, 1.649949, -0.1980936, 1, 0.7254902, 0, 1,
-1.143039, 1.244418, -1.775297, 1, 0.7333333, 0, 1,
-1.142689, 0.2921292, -1.578881, 1, 0.7372549, 0, 1,
-1.139633, -2.239106, -2.987167, 1, 0.7450981, 0, 1,
-1.133958, 0.4822378, -1.636952, 1, 0.7490196, 0, 1,
-1.13361, 0.7525491, -0.8383123, 1, 0.7568628, 0, 1,
-1.129986, 0.9465021, -1.001361, 1, 0.7607843, 0, 1,
-1.123142, 0.7401789, -0.0243636, 1, 0.7686275, 0, 1,
-1.122612, 1.066333, -0.3731038, 1, 0.772549, 0, 1,
-1.12091, -0.3433292, -1.405093, 1, 0.7803922, 0, 1,
-1.119503, 0.3361273, -0.9504424, 1, 0.7843137, 0, 1,
-1.116573, 1.879709, -0.4892558, 1, 0.7921569, 0, 1,
-1.11387, 1.656808, 0.706723, 1, 0.7960784, 0, 1,
-1.1056, -1.016362, -2.333658, 1, 0.8039216, 0, 1,
-1.102991, 1.522476, -1.387568, 1, 0.8117647, 0, 1,
-1.09937, 1.751297, 0.6896999, 1, 0.8156863, 0, 1,
-1.089086, -1.005486, -2.534101, 1, 0.8235294, 0, 1,
-1.068202, 1.031853, 1.994446, 1, 0.827451, 0, 1,
-1.063304, -0.9957532, -1.906462, 1, 0.8352941, 0, 1,
-1.059164, -0.7224995, -2.271522, 1, 0.8392157, 0, 1,
-1.05638, 0.0942166, -1.959499, 1, 0.8470588, 0, 1,
-1.054988, -0.002932816, -0.2348624, 1, 0.8509804, 0, 1,
-1.054687, -0.06428056, -0.7530071, 1, 0.8588235, 0, 1,
-1.053238, -0.8740538, -5.02937, 1, 0.8627451, 0, 1,
-1.051832, 0.07615398, -2.237862, 1, 0.8705882, 0, 1,
-1.050572, 2.367304, -0.4244553, 1, 0.8745098, 0, 1,
-1.050118, 0.02775648, -1.252168, 1, 0.8823529, 0, 1,
-1.047374, -0.2255579, -1.643896, 1, 0.8862745, 0, 1,
-1.029318, 0.5998708, -1.861464, 1, 0.8941177, 0, 1,
-1.018657, 0.5125288, -2.170335, 1, 0.8980392, 0, 1,
-1.010586, -1.239047, -1.832495, 1, 0.9058824, 0, 1,
-0.994472, 0.458905, 0.3021311, 1, 0.9137255, 0, 1,
-0.9890005, 0.5925612, 0.4342543, 1, 0.9176471, 0, 1,
-0.9868511, 0.1338572, -0.946723, 1, 0.9254902, 0, 1,
-0.9866821, 0.7778627, -1.220635, 1, 0.9294118, 0, 1,
-0.9833869, -0.1006911, -2.628915, 1, 0.9372549, 0, 1,
-0.9828958, 2.283329, -0.7796533, 1, 0.9411765, 0, 1,
-0.978817, -0.5786854, -2.397788, 1, 0.9490196, 0, 1,
-0.9760131, 0.7025983, -1.908995, 1, 0.9529412, 0, 1,
-0.9753523, 0.7018107, -1.008552, 1, 0.9607843, 0, 1,
-0.9729155, -0.8740482, -1.966942, 1, 0.9647059, 0, 1,
-0.9696181, 0.4869508, -0.919369, 1, 0.972549, 0, 1,
-0.9679713, 1.688975, 0.84785, 1, 0.9764706, 0, 1,
-0.9657904, -0.3096126, -3.135474, 1, 0.9843137, 0, 1,
-0.9625964, 0.5060995, -0.001431133, 1, 0.9882353, 0, 1,
-0.9592, 0.9032273, -1.378152, 1, 0.9960784, 0, 1,
-0.9590142, -0.197373, -2.02638, 0.9960784, 1, 0, 1,
-0.9573666, 0.09870756, -3.109006, 0.9921569, 1, 0, 1,
-0.9572049, 0.528652, -0.1998528, 0.9843137, 1, 0, 1,
-0.9540743, -0.2638985, -0.3070204, 0.9803922, 1, 0, 1,
-0.9493423, -0.3975576, -1.375584, 0.972549, 1, 0, 1,
-0.9326188, -0.3019177, -1.235279, 0.9686275, 1, 0, 1,
-0.9286956, -0.1122059, -1.995127, 0.9607843, 1, 0, 1,
-0.92455, -0.8313589, -0.9013348, 0.9568627, 1, 0, 1,
-0.9222806, 1.041077, 0.623614, 0.9490196, 1, 0, 1,
-0.9175708, -0.9787406, -1.107973, 0.945098, 1, 0, 1,
-0.9154777, 0.6276487, -1.296822, 0.9372549, 1, 0, 1,
-0.907554, 1.710397, -0.09498572, 0.9333333, 1, 0, 1,
-0.9063244, -0.2297231, -0.1980394, 0.9254902, 1, 0, 1,
-0.8934684, -0.03439445, -2.553478, 0.9215686, 1, 0, 1,
-0.8922071, 0.06160396, -1.220238, 0.9137255, 1, 0, 1,
-0.8914622, -1.826666, -1.157985, 0.9098039, 1, 0, 1,
-0.8746988, -0.08514132, -2.204441, 0.9019608, 1, 0, 1,
-0.8739024, -0.8893728, -2.999854, 0.8941177, 1, 0, 1,
-0.8708217, 0.8350205, -1.92064, 0.8901961, 1, 0, 1,
-0.8677201, -0.2950339, -1.323049, 0.8823529, 1, 0, 1,
-0.8666604, 0.5353466, -1.660862, 0.8784314, 1, 0, 1,
-0.8591678, 0.8423414, 0.1333536, 0.8705882, 1, 0, 1,
-0.8590003, -1.759672, -1.161759, 0.8666667, 1, 0, 1,
-0.8581175, 0.3706274, -3.228102, 0.8588235, 1, 0, 1,
-0.8517672, -0.4800309, 0.4137288, 0.854902, 1, 0, 1,
-0.8502864, 0.4516956, -1.458237, 0.8470588, 1, 0, 1,
-0.8426908, -0.1359231, -4.659502, 0.8431373, 1, 0, 1,
-0.8407207, -0.854434, -0.7100754, 0.8352941, 1, 0, 1,
-0.835435, 0.1905905, -0.6366928, 0.8313726, 1, 0, 1,
-0.8323804, 0.2728226, -2.454551, 0.8235294, 1, 0, 1,
-0.8316731, 0.5317575, -0.1641627, 0.8196079, 1, 0, 1,
-0.8297006, 2.03986, -1.590857, 0.8117647, 1, 0, 1,
-0.8256072, -0.1010456, -2.973791, 0.8078431, 1, 0, 1,
-0.8221106, -0.6060038, -2.360591, 0.8, 1, 0, 1,
-0.8205593, 0.004697525, -1.572461, 0.7921569, 1, 0, 1,
-0.8170458, -0.3458639, -2.395138, 0.7882353, 1, 0, 1,
-0.8145319, 0.2487554, -1.469358, 0.7803922, 1, 0, 1,
-0.8144935, -0.7424711, -3.28777, 0.7764706, 1, 0, 1,
-0.8080459, -0.2808323, -2.034919, 0.7686275, 1, 0, 1,
-0.8057251, 0.09112449, -0.8796251, 0.7647059, 1, 0, 1,
-0.8046663, 1.124645, -1.404267, 0.7568628, 1, 0, 1,
-0.8026384, 0.2054828, -2.283896, 0.7529412, 1, 0, 1,
-0.7998059, -0.8142871, -1.643266, 0.7450981, 1, 0, 1,
-0.7967878, -0.1052824, -1.096505, 0.7411765, 1, 0, 1,
-0.7922156, -0.7179456, -2.464188, 0.7333333, 1, 0, 1,
-0.7899805, 0.558691, -1.148165, 0.7294118, 1, 0, 1,
-0.7867748, -0.004372521, 0.6093643, 0.7215686, 1, 0, 1,
-0.785205, 0.3402446, -1.052786, 0.7176471, 1, 0, 1,
-0.7819017, 0.4698419, -1.270378, 0.7098039, 1, 0, 1,
-0.7802225, -0.2842558, -3.046227, 0.7058824, 1, 0, 1,
-0.7625329, 0.8521371, 0.07777084, 0.6980392, 1, 0, 1,
-0.7548313, -1.405463, -2.340315, 0.6901961, 1, 0, 1,
-0.7546118, 0.1449236, -1.02287, 0.6862745, 1, 0, 1,
-0.7494189, 0.3710564, -0.33396, 0.6784314, 1, 0, 1,
-0.7490061, -1.273171, -3.880261, 0.6745098, 1, 0, 1,
-0.7481902, -0.04882488, -1.821561, 0.6666667, 1, 0, 1,
-0.7463117, -0.730522, 0.230774, 0.6627451, 1, 0, 1,
-0.7441497, -0.6205153, -2.155253, 0.654902, 1, 0, 1,
-0.7399867, 1.022182, -0.009917835, 0.6509804, 1, 0, 1,
-0.7377505, -1.40286, -2.162531, 0.6431373, 1, 0, 1,
-0.7365677, 0.6201454, -1.34046, 0.6392157, 1, 0, 1,
-0.7348176, 0.8859372, -0.02052836, 0.6313726, 1, 0, 1,
-0.7342232, 0.2168337, -1.474197, 0.627451, 1, 0, 1,
-0.7291955, 1.306757, -1.905286, 0.6196079, 1, 0, 1,
-0.7261861, -0.8101411, -3.243016, 0.6156863, 1, 0, 1,
-0.72424, 1.558995, -0.9238018, 0.6078432, 1, 0, 1,
-0.7187687, 1.521212, -1.758557, 0.6039216, 1, 0, 1,
-0.7184542, 0.6074957, -0.7262701, 0.5960785, 1, 0, 1,
-0.7167526, 0.1753468, -2.525066, 0.5882353, 1, 0, 1,
-0.7116271, -0.3555547, -2.333387, 0.5843138, 1, 0, 1,
-0.7094845, -0.1448943, -2.206776, 0.5764706, 1, 0, 1,
-0.7076678, 0.9392622, -0.2024451, 0.572549, 1, 0, 1,
-0.7065002, 1.281827, -2.497884, 0.5647059, 1, 0, 1,
-0.7036213, 0.9520146, 0.0128478, 0.5607843, 1, 0, 1,
-0.7032465, 0.9173388, -0.1143031, 0.5529412, 1, 0, 1,
-0.7019546, 1.774152, -1.31338, 0.5490196, 1, 0, 1,
-0.6994433, -1.754554, -2.229674, 0.5411765, 1, 0, 1,
-0.6994349, -0.2746396, -2.330263, 0.5372549, 1, 0, 1,
-0.6983535, -0.8273883, -2.378068, 0.5294118, 1, 0, 1,
-0.6981574, 0.23782, -0.9748667, 0.5254902, 1, 0, 1,
-0.6951991, -1.049946, -2.494855, 0.5176471, 1, 0, 1,
-0.6948603, 1.080748, -0.9164746, 0.5137255, 1, 0, 1,
-0.6941895, 0.7017229, -0.9026183, 0.5058824, 1, 0, 1,
-0.6911982, 0.04487923, -0.5239162, 0.5019608, 1, 0, 1,
-0.6900894, 0.4431669, -0.5406426, 0.4941176, 1, 0, 1,
-0.6830577, 0.2177651, -0.3350932, 0.4862745, 1, 0, 1,
-0.6821722, -1.308761, -0.6616018, 0.4823529, 1, 0, 1,
-0.6770245, -0.9784279, -4.008477, 0.4745098, 1, 0, 1,
-0.6743191, 0.4007619, -1.375941, 0.4705882, 1, 0, 1,
-0.6648768, 0.01740848, -1.066842, 0.4627451, 1, 0, 1,
-0.6607208, -0.9968187, -2.898613, 0.4588235, 1, 0, 1,
-0.6531652, 0.3233982, -1.287181, 0.4509804, 1, 0, 1,
-0.6510983, 0.73696, 0.1098654, 0.4470588, 1, 0, 1,
-0.6482992, -0.4748809, -1.77462, 0.4392157, 1, 0, 1,
-0.6465251, -0.7923275, -2.83778, 0.4352941, 1, 0, 1,
-0.6454969, -2.414921, -3.068503, 0.427451, 1, 0, 1,
-0.6450891, 0.5252271, -0.7568324, 0.4235294, 1, 0, 1,
-0.641665, -1.131741, -2.925186, 0.4156863, 1, 0, 1,
-0.6396268, 0.3151041, -1.01347, 0.4117647, 1, 0, 1,
-0.6389313, -0.7674128, -1.390427, 0.4039216, 1, 0, 1,
-0.6379909, -0.02572822, -1.03022, 0.3960784, 1, 0, 1,
-0.632192, -2.192385, -2.112562, 0.3921569, 1, 0, 1,
-0.6228461, 0.7882556, 0.2628246, 0.3843137, 1, 0, 1,
-0.6098187, 0.8463785, -0.7968674, 0.3803922, 1, 0, 1,
-0.6086941, 0.5687033, -1.152271, 0.372549, 1, 0, 1,
-0.6056276, 0.6306366, -0.3239261, 0.3686275, 1, 0, 1,
-0.6036702, -1.873065, -1.546221, 0.3607843, 1, 0, 1,
-0.6030298, -0.903063, -1.867466, 0.3568628, 1, 0, 1,
-0.59549, 0.815851, -0.2958677, 0.3490196, 1, 0, 1,
-0.5948935, -1.160585, -2.247373, 0.345098, 1, 0, 1,
-0.5834274, 0.7038837, -0.8212147, 0.3372549, 1, 0, 1,
-0.5732353, 0.8132136, 0.5438622, 0.3333333, 1, 0, 1,
-0.5711505, -1.811775, -2.463964, 0.3254902, 1, 0, 1,
-0.5699785, 0.0541455, -2.148619, 0.3215686, 1, 0, 1,
-0.5696723, -1.765269, -2.986181, 0.3137255, 1, 0, 1,
-0.5666348, 0.1628061, -1.201055, 0.3098039, 1, 0, 1,
-0.5577524, 1.012223, 0.788782, 0.3019608, 1, 0, 1,
-0.5537779, 0.3120802, -0.463504, 0.2941177, 1, 0, 1,
-0.5512246, -0.7089529, -1.790036, 0.2901961, 1, 0, 1,
-0.5504326, 1.391288, -0.8688937, 0.282353, 1, 0, 1,
-0.549443, 0.1557408, -0.8083655, 0.2784314, 1, 0, 1,
-0.5479507, -1.373761, -3.368303, 0.2705882, 1, 0, 1,
-0.5467625, -2.311568, -1.756362, 0.2666667, 1, 0, 1,
-0.5416856, 0.02755812, -1.783405, 0.2588235, 1, 0, 1,
-0.5414805, 0.4446371, -1.557218, 0.254902, 1, 0, 1,
-0.5404491, -0.9423319, -1.893272, 0.2470588, 1, 0, 1,
-0.5394335, -0.4160551, -2.349989, 0.2431373, 1, 0, 1,
-0.5384058, 0.9968269, -0.4325407, 0.2352941, 1, 0, 1,
-0.535486, 0.2567407, -3.076651, 0.2313726, 1, 0, 1,
-0.5336195, -0.4974356, -4.352091, 0.2235294, 1, 0, 1,
-0.5326244, 0.002818105, -1.991328, 0.2196078, 1, 0, 1,
-0.5307697, 1.074406, -0.1321376, 0.2117647, 1, 0, 1,
-0.5285219, 0.04940362, -1.422918, 0.2078431, 1, 0, 1,
-0.5257691, 0.3788628, -1.246532, 0.2, 1, 0, 1,
-0.5256231, 1.178452, -0.8651502, 0.1921569, 1, 0, 1,
-0.5176066, 0.08348262, -0.6094674, 0.1882353, 1, 0, 1,
-0.5161019, 1.607008, -0.3081501, 0.1803922, 1, 0, 1,
-0.5078447, 0.09821857, -2.101347, 0.1764706, 1, 0, 1,
-0.5048554, -0.7097742, -3.092632, 0.1686275, 1, 0, 1,
-0.5048255, -0.3611358, -1.577417, 0.1647059, 1, 0, 1,
-0.5036715, 1.11192, 0.8459545, 0.1568628, 1, 0, 1,
-0.503444, 0.4314374, 0.4022149, 0.1529412, 1, 0, 1,
-0.5016717, -0.5586267, -1.200923, 0.145098, 1, 0, 1,
-0.5013637, -0.4536164, -1.448864, 0.1411765, 1, 0, 1,
-0.4968629, 0.2044597, -3.625423, 0.1333333, 1, 0, 1,
-0.4955638, -0.5608599, -3.473863, 0.1294118, 1, 0, 1,
-0.4947901, -0.03848858, -1.755017, 0.1215686, 1, 0, 1,
-0.4869674, -0.1356264, -2.923758, 0.1176471, 1, 0, 1,
-0.4830331, 0.7115473, -0.6383326, 0.1098039, 1, 0, 1,
-0.481507, -1.857325, -3.168061, 0.1058824, 1, 0, 1,
-0.4773191, 1.831274, -0.5931429, 0.09803922, 1, 0, 1,
-0.4763114, 0.145345, -3.286219, 0.09019608, 1, 0, 1,
-0.4753588, -0.54323, -3.111421, 0.08627451, 1, 0, 1,
-0.4748922, 1.476275, -0.1410893, 0.07843138, 1, 0, 1,
-0.4729983, -1.436313, -3.036474, 0.07450981, 1, 0, 1,
-0.4707147, 0.4596065, -1.936396, 0.06666667, 1, 0, 1,
-0.4669963, 0.3978875, 0.04790593, 0.0627451, 1, 0, 1,
-0.4665998, 0.8101069, -1.043759, 0.05490196, 1, 0, 1,
-0.4612534, -0.3088254, -2.728642, 0.05098039, 1, 0, 1,
-0.4577452, 0.04137501, -2.729383, 0.04313726, 1, 0, 1,
-0.4570661, -0.464951, -0.8761875, 0.03921569, 1, 0, 1,
-0.4542798, 1.855235, -1.890007, 0.03137255, 1, 0, 1,
-0.4479743, 0.7206629, -1.794027, 0.02745098, 1, 0, 1,
-0.4460869, -0.4442324, -2.600038, 0.01960784, 1, 0, 1,
-0.4455965, -0.9343251, -1.899083, 0.01568628, 1, 0, 1,
-0.4454617, 2.67751, -0.4129086, 0.007843138, 1, 0, 1,
-0.4416038, 1.913337, -0.4564215, 0.003921569, 1, 0, 1,
-0.4394525, -0.992726, -1.952648, 0, 1, 0.003921569, 1,
-0.43859, 1.66447, -2.11115, 0, 1, 0.01176471, 1,
-0.4366941, 0.2941862, -1.95931, 0, 1, 0.01568628, 1,
-0.4339702, -0.4428796, -2.540405, 0, 1, 0.02352941, 1,
-0.4318194, 0.8418362, -1.465834, 0, 1, 0.02745098, 1,
-0.431488, 0.08805523, -2.057285, 0, 1, 0.03529412, 1,
-0.4298993, 0.7895774, -0.4298435, 0, 1, 0.03921569, 1,
-0.4293894, 0.2469313, -0.1335675, 0, 1, 0.04705882, 1,
-0.4274992, -0.1599745, -3.860127, 0, 1, 0.05098039, 1,
-0.4273651, -0.8453929, -3.547394, 0, 1, 0.05882353, 1,
-0.4271928, 0.482978, -1.360828, 0, 1, 0.0627451, 1,
-0.4259963, -0.7497239, -2.208609, 0, 1, 0.07058824, 1,
-0.415888, 0.1503841, -1.246925, 0, 1, 0.07450981, 1,
-0.4148913, -0.2040533, -1.602446, 0, 1, 0.08235294, 1,
-0.4142778, -1.649943, -1.710178, 0, 1, 0.08627451, 1,
-0.4108487, 0.4669458, -0.1223711, 0, 1, 0.09411765, 1,
-0.4076279, 0.5525361, 1.015231, 0, 1, 0.1019608, 1,
-0.4040304, -0.1113654, 0.139587, 0, 1, 0.1058824, 1,
-0.4033968, 0.9617437, -0.3577234, 0, 1, 0.1137255, 1,
-0.4033189, -0.9591463, -2.44995, 0, 1, 0.1176471, 1,
-0.4029194, -0.4351968, -3.113751, 0, 1, 0.1254902, 1,
-0.3941626, 0.06331363, -2.793885, 0, 1, 0.1294118, 1,
-0.3909156, -0.3945363, -3.413465, 0, 1, 0.1372549, 1,
-0.3904746, 1.228767, -0.6924222, 0, 1, 0.1411765, 1,
-0.3901255, -0.324993, -0.5613472, 0, 1, 0.1490196, 1,
-0.3877755, -1.975458, -3.949165, 0, 1, 0.1529412, 1,
-0.3870257, 1.685193, -0.4710946, 0, 1, 0.1607843, 1,
-0.3870117, -0.8803691, -2.3753, 0, 1, 0.1647059, 1,
-0.3824196, 0.9495724, 0.7987269, 0, 1, 0.172549, 1,
-0.3818221, -0.02122743, 0.383477, 0, 1, 0.1764706, 1,
-0.380787, 0.6578313, 0.2898122, 0, 1, 0.1843137, 1,
-0.3793715, -2.508808, -3.086951, 0, 1, 0.1882353, 1,
-0.377038, 0.4451942, -1.190114, 0, 1, 0.1960784, 1,
-0.3753323, -0.9888249, -1.094763, 0, 1, 0.2039216, 1,
-0.3740401, -0.02044825, -0.9783569, 0, 1, 0.2078431, 1,
-0.3739666, -0.1451501, -0.8101004, 0, 1, 0.2156863, 1,
-0.3706994, -0.3203819, -0.9733752, 0, 1, 0.2196078, 1,
-0.3652542, 0.9883737, -0.1134158, 0, 1, 0.227451, 1,
-0.3638654, 0.9732821, -0.03515217, 0, 1, 0.2313726, 1,
-0.3631717, -1.067273, -2.00056, 0, 1, 0.2392157, 1,
-0.361775, 0.5118529, -0.2351804, 0, 1, 0.2431373, 1,
-0.3612908, -0.4322749, -3.975127, 0, 1, 0.2509804, 1,
-0.3569217, 1.029017, -1.48599, 0, 1, 0.254902, 1,
-0.3547111, -0.6328071, -4.048655, 0, 1, 0.2627451, 1,
-0.3483455, 0.1243972, 0.05725278, 0, 1, 0.2666667, 1,
-0.3479875, -1.778609, -2.622982, 0, 1, 0.2745098, 1,
-0.3477853, -1.235266, -1.530927, 0, 1, 0.2784314, 1,
-0.3459425, 0.535179, 0.5883791, 0, 1, 0.2862745, 1,
-0.3392881, -2.438844, -2.386556, 0, 1, 0.2901961, 1,
-0.3350301, -1.601023, -4.174234, 0, 1, 0.2980392, 1,
-0.3340589, -0.860812, -2.584846, 0, 1, 0.3058824, 1,
-0.3334899, 1.782471, -0.301499, 0, 1, 0.3098039, 1,
-0.3320498, -1.507277, -2.064486, 0, 1, 0.3176471, 1,
-0.3312542, -0.6041067, -2.231589, 0, 1, 0.3215686, 1,
-0.3307646, -1.785805, -3.113487, 0, 1, 0.3294118, 1,
-0.3307087, 0.600588, -0.8089316, 0, 1, 0.3333333, 1,
-0.3228667, 2.461291, 0.1319132, 0, 1, 0.3411765, 1,
-0.3191177, -0.4381442, -4.018555, 0, 1, 0.345098, 1,
-0.3166523, 0.2923203, -1.324798, 0, 1, 0.3529412, 1,
-0.3099073, -1.625611, -3.526256, 0, 1, 0.3568628, 1,
-0.3093893, -0.5018185, -2.552746, 0, 1, 0.3647059, 1,
-0.304879, -0.9475448, -2.879476, 0, 1, 0.3686275, 1,
-0.3035325, 0.6754121, 0.138048, 0, 1, 0.3764706, 1,
-0.3003695, -1.494998, -3.328425, 0, 1, 0.3803922, 1,
-0.2994778, 0.7285612, 1.02836, 0, 1, 0.3882353, 1,
-0.2937802, 0.4755661, -2.386334, 0, 1, 0.3921569, 1,
-0.2917772, -0.8863338, -1.9325, 0, 1, 0.4, 1,
-0.2910658, -1.074637, -2.383382, 0, 1, 0.4078431, 1,
-0.2880986, 1.074179, -1.3435, 0, 1, 0.4117647, 1,
-0.282701, 2.085958, -0.89395, 0, 1, 0.4196078, 1,
-0.278988, -0.2960093, -4.544432, 0, 1, 0.4235294, 1,
-0.2743533, -0.1006832, -1.748542, 0, 1, 0.4313726, 1,
-0.2682118, 0.7346021, 0.0647341, 0, 1, 0.4352941, 1,
-0.2653668, 1.590662, 0.9656611, 0, 1, 0.4431373, 1,
-0.2598206, -0.3336357, -4.337834, 0, 1, 0.4470588, 1,
-0.2551583, -0.9554513, -1.875263, 0, 1, 0.454902, 1,
-0.2491927, -0.308618, -2.168989, 0, 1, 0.4588235, 1,
-0.2487219, 0.9111902, 1.412022, 0, 1, 0.4666667, 1,
-0.2463104, 0.05938273, -0.5080612, 0, 1, 0.4705882, 1,
-0.2431522, 1.382065, -0.2447761, 0, 1, 0.4784314, 1,
-0.2431435, -1.54864, -2.549842, 0, 1, 0.4823529, 1,
-0.2406024, 0.8045431, -0.7012265, 0, 1, 0.4901961, 1,
-0.2373445, 0.167743, -0.9442259, 0, 1, 0.4941176, 1,
-0.2351871, 0.9442192, 1.583911, 0, 1, 0.5019608, 1,
-0.2298844, -0.9666895, -1.259949, 0, 1, 0.509804, 1,
-0.2286633, -0.3976011, -2.092948, 0, 1, 0.5137255, 1,
-0.2259539, -0.6702495, -2.611602, 0, 1, 0.5215687, 1,
-0.2226142, 1.654928, 0.555778, 0, 1, 0.5254902, 1,
-0.221612, -2.06073, -4.417273, 0, 1, 0.5333334, 1,
-0.2189565, -2.052978, -1.97612, 0, 1, 0.5372549, 1,
-0.2136068, -0.2916614, -1.590104, 0, 1, 0.5450981, 1,
-0.2133692, 0.5892653, 0.5532079, 0, 1, 0.5490196, 1,
-0.2114095, 2.006899, -1.429568, 0, 1, 0.5568628, 1,
-0.2088515, 1.528965, -0.5083096, 0, 1, 0.5607843, 1,
-0.1994546, 1.010095, -0.310574, 0, 1, 0.5686275, 1,
-0.1975479, 0.7898901, 0.4659058, 0, 1, 0.572549, 1,
-0.196853, 0.9669898, -1.137636, 0, 1, 0.5803922, 1,
-0.1930875, -0.006782136, -2.457069, 0, 1, 0.5843138, 1,
-0.1914849, -0.4018807, -1.187381, 0, 1, 0.5921569, 1,
-0.1776162, 1.438467, 1.028339, 0, 1, 0.5960785, 1,
-0.1754515, 0.5161362, -1.367092, 0, 1, 0.6039216, 1,
-0.1738189, -0.3792108, -2.40285, 0, 1, 0.6117647, 1,
-0.1712356, 1.924409, -0.3229431, 0, 1, 0.6156863, 1,
-0.1699223, 0.4143037, -0.8364881, 0, 1, 0.6235294, 1,
-0.1677096, -0.9774826, -2.929482, 0, 1, 0.627451, 1,
-0.158572, 1.674218, 0.6468856, 0, 1, 0.6352941, 1,
-0.15641, 1.746601, -0.1846801, 0, 1, 0.6392157, 1,
-0.154795, 0.01707202, -0.656401, 0, 1, 0.6470588, 1,
-0.1521203, -1.13908, -1.945209, 0, 1, 0.6509804, 1,
-0.148412, -0.106006, -3.542636, 0, 1, 0.6588235, 1,
-0.1478886, 1.342872, -1.277901, 0, 1, 0.6627451, 1,
-0.1422127, -0.01846829, -1.204748, 0, 1, 0.6705883, 1,
-0.1416853, 0.7760913, -1.667604, 0, 1, 0.6745098, 1,
-0.1373131, -0.2356943, -3.014215, 0, 1, 0.682353, 1,
-0.1321566, -0.1945189, -3.326191, 0, 1, 0.6862745, 1,
-0.1276505, 1.441564, 2.01857, 0, 1, 0.6941177, 1,
-0.1268651, -0.820908, -2.506528, 0, 1, 0.7019608, 1,
-0.1265582, -1.601689, -2.366366, 0, 1, 0.7058824, 1,
-0.1253899, -1.774578, -2.461219, 0, 1, 0.7137255, 1,
-0.124003, 0.8819301, -0.4899563, 0, 1, 0.7176471, 1,
-0.1210708, 0.395402, 0.6316015, 0, 1, 0.7254902, 1,
-0.1207621, -1.326863, -5.034325, 0, 1, 0.7294118, 1,
-0.1149278, 1.415779, 2.214382, 0, 1, 0.7372549, 1,
-0.1117164, -0.5537395, -3.094753, 0, 1, 0.7411765, 1,
-0.1087397, 1.052187, -0.8759025, 0, 1, 0.7490196, 1,
-0.1076973, 1.159047, 0.6715453, 0, 1, 0.7529412, 1,
-0.105838, 0.2422269, 0.03687483, 0, 1, 0.7607843, 1,
-0.09998516, 0.3030396, -0.6486633, 0, 1, 0.7647059, 1,
-0.09767716, 0.5129554, -1.879089, 0, 1, 0.772549, 1,
-0.09254127, -1.433023, -3.11661, 0, 1, 0.7764706, 1,
-0.09105131, -0.5830727, -1.673344, 0, 1, 0.7843137, 1,
-0.09017434, -0.7233123, -3.282438, 0, 1, 0.7882353, 1,
-0.08943117, -0.7193577, -2.772278, 0, 1, 0.7960784, 1,
-0.0825961, -2.364996, -1.305737, 0, 1, 0.8039216, 1,
-0.07790905, -0.915171, -0.8066081, 0, 1, 0.8078431, 1,
-0.0778152, -0.06270915, -2.261966, 0, 1, 0.8156863, 1,
-0.07756144, 0.1602426, -1.420264, 0, 1, 0.8196079, 1,
-0.07743923, 0.4935681, -0.5068368, 0, 1, 0.827451, 1,
-0.07507924, 0.3408563, -0.8070906, 0, 1, 0.8313726, 1,
-0.06966232, -0.1321267, -3.084516, 0, 1, 0.8392157, 1,
-0.06965976, 1.047732, -1.718283, 0, 1, 0.8431373, 1,
-0.05969213, -0.7021354, -3.747237, 0, 1, 0.8509804, 1,
-0.04673509, -1.168126, -4.376691, 0, 1, 0.854902, 1,
-0.04543, -0.5534848, -4.323277, 0, 1, 0.8627451, 1,
-0.04524769, 0.7745697, -1.399816, 0, 1, 0.8666667, 1,
-0.04127674, 0.2870161, -0.2155984, 0, 1, 0.8745098, 1,
-0.03918114, -0.891898, -2.597002, 0, 1, 0.8784314, 1,
-0.03791672, 0.1790869, 0.7809832, 0, 1, 0.8862745, 1,
-0.0333992, 1.154759, 0.8121758, 0, 1, 0.8901961, 1,
-0.03129652, -1.076704, -2.549709, 0, 1, 0.8980392, 1,
-0.02608184, 0.1104914, 0.614742, 0, 1, 0.9058824, 1,
-0.0259841, 0.2512491, -1.454376, 0, 1, 0.9098039, 1,
-0.02343685, 0.1099444, -1.117176, 0, 1, 0.9176471, 1,
-0.02231834, -0.6772141, -2.398737, 0, 1, 0.9215686, 1,
-0.02222187, -0.5622429, -1.781534, 0, 1, 0.9294118, 1,
-0.02129124, 0.03651102, 0.6192256, 0, 1, 0.9333333, 1,
-0.01545527, -0.6631326, -3.039312, 0, 1, 0.9411765, 1,
-0.01186991, 0.4452365, -1.588328, 0, 1, 0.945098, 1,
-0.005547266, -0.2452306, -3.184942, 0, 1, 0.9529412, 1,
-0.004195089, 0.5576999, 0.5278965, 0, 1, 0.9568627, 1,
-0.0004816746, 2.216796, 0.3696586, 0, 1, 0.9647059, 1,
0.003169988, 0.8608062, 1.247489, 0, 1, 0.9686275, 1,
0.006539456, 0.9063455, 1.012819, 0, 1, 0.9764706, 1,
0.008985791, -0.6702921, 2.002542, 0, 1, 0.9803922, 1,
0.01040923, -1.150455, 1.586003, 0, 1, 0.9882353, 1,
0.01547324, -0.581717, 3.099795, 0, 1, 0.9921569, 1,
0.02198849, 0.1555254, -0.2888543, 0, 1, 1, 1,
0.0220722, -0.03922517, 2.38174, 0, 0.9921569, 1, 1,
0.02207593, -0.4297403, 2.814305, 0, 0.9882353, 1, 1,
0.02374389, 0.6480664, 1.431152, 0, 0.9803922, 1, 1,
0.0247477, 1.972203, 0.1048763, 0, 0.9764706, 1, 1,
0.02512392, 1.396528, -0.7952459, 0, 0.9686275, 1, 1,
0.02762353, -0.6150922, 3.956083, 0, 0.9647059, 1, 1,
0.03587528, 0.5541279, 0.8985682, 0, 0.9568627, 1, 1,
0.03644885, -0.1969733, 2.982256, 0, 0.9529412, 1, 1,
0.0370244, -1.244069, 3.667825, 0, 0.945098, 1, 1,
0.03731592, 0.4337709, -1.185964, 0, 0.9411765, 1, 1,
0.03949839, 0.1846227, 0.8069664, 0, 0.9333333, 1, 1,
0.04025911, -1.491229, 4.039367, 0, 0.9294118, 1, 1,
0.04191867, -1.237682, 2.72652, 0, 0.9215686, 1, 1,
0.04660345, 0.5570116, 0.5488774, 0, 0.9176471, 1, 1,
0.04726081, -0.5590479, 1.958099, 0, 0.9098039, 1, 1,
0.04967734, -0.6973982, 4.548265, 0, 0.9058824, 1, 1,
0.05508771, 0.3602102, -0.09808669, 0, 0.8980392, 1, 1,
0.05678286, -0.8731844, 4.34128, 0, 0.8901961, 1, 1,
0.05841624, -0.8046429, 5.191149, 0, 0.8862745, 1, 1,
0.05951952, 1.203017, 1.550347, 0, 0.8784314, 1, 1,
0.06269512, 0.4055545, 0.857495, 0, 0.8745098, 1, 1,
0.06322028, -0.1757407, 2.396266, 0, 0.8666667, 1, 1,
0.06340425, -0.1092305, 2.75736, 0, 0.8627451, 1, 1,
0.07036237, -1.67722, 3.143603, 0, 0.854902, 1, 1,
0.07307108, 1.181493, -1.266244, 0, 0.8509804, 1, 1,
0.07370586, -1.802248, 3.512139, 0, 0.8431373, 1, 1,
0.07483646, 0.4725411, 0.3351224, 0, 0.8392157, 1, 1,
0.07501408, -1.110947, 3.16672, 0, 0.8313726, 1, 1,
0.0838856, 0.7826339, -0.2387397, 0, 0.827451, 1, 1,
0.08444354, -1.462248, 2.927412, 0, 0.8196079, 1, 1,
0.08993769, -0.09177849, 3.579675, 0, 0.8156863, 1, 1,
0.09028178, 0.8541763, 0.2909319, 0, 0.8078431, 1, 1,
0.09219486, -0.6785626, 2.332212, 0, 0.8039216, 1, 1,
0.09442574, 0.1763172, 0.2246123, 0, 0.7960784, 1, 1,
0.09581544, 0.8780296, -0.4161745, 0, 0.7882353, 1, 1,
0.09723111, -1.601256, 4.376382, 0, 0.7843137, 1, 1,
0.09839593, 0.9180405, 0.4472849, 0, 0.7764706, 1, 1,
0.09883607, 0.5748839, 1.15918, 0, 0.772549, 1, 1,
0.09957582, -0.2052576, 2.430571, 0, 0.7647059, 1, 1,
0.1028392, -1.47647, 3.460057, 0, 0.7607843, 1, 1,
0.1029579, 0.2125577, 3.437793, 0, 0.7529412, 1, 1,
0.1062061, 1.337838, 0.7079189, 0, 0.7490196, 1, 1,
0.1093342, -1.826427, 3.672781, 0, 0.7411765, 1, 1,
0.1101591, -1.819274, 3.207734, 0, 0.7372549, 1, 1,
0.1137544, 0.8990169, 0.6285622, 0, 0.7294118, 1, 1,
0.1155722, 1.416847, 0.3824828, 0, 0.7254902, 1, 1,
0.1206178, 2.051308, 0.5514938, 0, 0.7176471, 1, 1,
0.1278048, 0.9079813, -0.5145667, 0, 0.7137255, 1, 1,
0.1323173, -1.012996, 2.438403, 0, 0.7058824, 1, 1,
0.1353473, -0.7589157, 2.976165, 0, 0.6980392, 1, 1,
0.1430433, -0.2188723, 2.409972, 0, 0.6941177, 1, 1,
0.1460105, 1.738392, 0.5627148, 0, 0.6862745, 1, 1,
0.1467048, 0.4040563, 1.411198, 0, 0.682353, 1, 1,
0.1475273, 1.168876, 0.076491, 0, 0.6745098, 1, 1,
0.1589943, -0.3955414, 2.431735, 0, 0.6705883, 1, 1,
0.1602503, 0.581851, 0.9641052, 0, 0.6627451, 1, 1,
0.1606794, 1.822364, -1.322697, 0, 0.6588235, 1, 1,
0.1659972, 0.8236654, 0.7768132, 0, 0.6509804, 1, 1,
0.166748, -0.5206661, 2.602286, 0, 0.6470588, 1, 1,
0.1694, 0.4281425, 0.07433989, 0, 0.6392157, 1, 1,
0.1704866, -0.4517223, 4.291263, 0, 0.6352941, 1, 1,
0.1748083, -0.4189406, 3.611746, 0, 0.627451, 1, 1,
0.1748089, 0.9990534, -0.6104761, 0, 0.6235294, 1, 1,
0.1752137, -1.515476, 4.471812, 0, 0.6156863, 1, 1,
0.1777486, -0.291911, 3.97644, 0, 0.6117647, 1, 1,
0.1819363, -0.7173938, 3.463707, 0, 0.6039216, 1, 1,
0.1824986, -0.03810982, 1.259748, 0, 0.5960785, 1, 1,
0.1853163, 0.4653415, 0.5486975, 0, 0.5921569, 1, 1,
0.1874778, -0.7476664, 1.751493, 0, 0.5843138, 1, 1,
0.1941161, -0.8770219, 3.505403, 0, 0.5803922, 1, 1,
0.1960037, -0.1017193, 2.636901, 0, 0.572549, 1, 1,
0.1990804, -0.7126074, 3.023058, 0, 0.5686275, 1, 1,
0.2015459, 1.493857, 2.129568, 0, 0.5607843, 1, 1,
0.2024679, 0.3267881, 0.1087015, 0, 0.5568628, 1, 1,
0.2026813, -0.7946743, 4.748396, 0, 0.5490196, 1, 1,
0.2037132, 0.5878679, 2.07616, 0, 0.5450981, 1, 1,
0.2048045, -1.030383, 1.46058, 0, 0.5372549, 1, 1,
0.2055196, -0.6528565, 2.333824, 0, 0.5333334, 1, 1,
0.2058401, -0.7881314, 2.991655, 0, 0.5254902, 1, 1,
0.2063297, -0.4609529, 3.658445, 0, 0.5215687, 1, 1,
0.2068578, -1.723142, 4.827255, 0, 0.5137255, 1, 1,
0.2113923, -2.522883, 1.905131, 0, 0.509804, 1, 1,
0.2210939, -0.664663, 2.454654, 0, 0.5019608, 1, 1,
0.2280308, -0.2077126, 3.30597, 0, 0.4941176, 1, 1,
0.2284059, 1.423455, -0.5290537, 0, 0.4901961, 1, 1,
0.2287284, -0.3817478, 2.454784, 0, 0.4823529, 1, 1,
0.2307956, 0.4386785, 0.421816, 0, 0.4784314, 1, 1,
0.2313589, 0.1981205, 0.928201, 0, 0.4705882, 1, 1,
0.2327618, -0.5249208, 1.471774, 0, 0.4666667, 1, 1,
0.2330998, -0.05775991, 0.4948014, 0, 0.4588235, 1, 1,
0.2371439, -1.074602, 3.326141, 0, 0.454902, 1, 1,
0.2415815, -0.6596065, 1.186036, 0, 0.4470588, 1, 1,
0.2418507, -1.318819, 2.904385, 0, 0.4431373, 1, 1,
0.2419217, -1.256814, 2.045262, 0, 0.4352941, 1, 1,
0.2426469, 1.342406, 1.192978, 0, 0.4313726, 1, 1,
0.2428713, -0.9248161, 3.114726, 0, 0.4235294, 1, 1,
0.2443916, -0.2389685, 4.330873, 0, 0.4196078, 1, 1,
0.245144, 1.666292, -0.1071791, 0, 0.4117647, 1, 1,
0.248066, -0.1572223, 1.133921, 0, 0.4078431, 1, 1,
0.2545345, 1.100448, -0.4549247, 0, 0.4, 1, 1,
0.2553071, 0.6152791, -2.201296, 0, 0.3921569, 1, 1,
0.2561576, -0.07935112, 1.799667, 0, 0.3882353, 1, 1,
0.2632997, 0.8301541, -0.6288528, 0, 0.3803922, 1, 1,
0.270853, 0.3617511, -0.06999673, 0, 0.3764706, 1, 1,
0.2712731, 0.4320536, 2.351762, 0, 0.3686275, 1, 1,
0.2735958, -0.6325712, 2.201286, 0, 0.3647059, 1, 1,
0.2750707, 0.5860918, 0.3725496, 0, 0.3568628, 1, 1,
0.2759047, -0.7317297, 2.383129, 0, 0.3529412, 1, 1,
0.2763796, -0.5783111, 2.754109, 0, 0.345098, 1, 1,
0.2804832, 0.4985377, -1.903003, 0, 0.3411765, 1, 1,
0.2832651, 1.139389, 1.238951, 0, 0.3333333, 1, 1,
0.2866375, -1.697506, 2.248855, 0, 0.3294118, 1, 1,
0.2890026, -0.9580785, 2.014889, 0, 0.3215686, 1, 1,
0.29074, -0.09123337, 1.547761, 0, 0.3176471, 1, 1,
0.2929624, -0.525969, 4.047296, 0, 0.3098039, 1, 1,
0.297957, 0.5556927, -0.06928787, 0, 0.3058824, 1, 1,
0.3045774, -1.637828, 4.276946, 0, 0.2980392, 1, 1,
0.3053831, -2.620715, 2.563658, 0, 0.2901961, 1, 1,
0.3075858, 0.2239096, -1.288982, 0, 0.2862745, 1, 1,
0.309862, 1.119101, 0.02718647, 0, 0.2784314, 1, 1,
0.318344, 0.6792799, -0.9833489, 0, 0.2745098, 1, 1,
0.3200358, -0.5118631, 2.139399, 0, 0.2666667, 1, 1,
0.3279246, 1.449942, 1.541118, 0, 0.2627451, 1, 1,
0.3284276, 0.6018108, 0.6741481, 0, 0.254902, 1, 1,
0.3334119, -2.254872, 2.028009, 0, 0.2509804, 1, 1,
0.3334221, -0.5205384, 2.383919, 0, 0.2431373, 1, 1,
0.333424, -0.4927341, 2.773113, 0, 0.2392157, 1, 1,
0.335131, 0.2460712, -0.9065528, 0, 0.2313726, 1, 1,
0.3377183, -0.02914467, 1.234263, 0, 0.227451, 1, 1,
0.3399945, 0.6019093, 1.986005, 0, 0.2196078, 1, 1,
0.3408957, -1.466065, 3.697119, 0, 0.2156863, 1, 1,
0.3415926, -0.1637094, 0.6931204, 0, 0.2078431, 1, 1,
0.3445146, -1.247342, 3.239849, 0, 0.2039216, 1, 1,
0.3466757, -0.947728, 2.677236, 0, 0.1960784, 1, 1,
0.3476482, -1.610063, 3.572839, 0, 0.1882353, 1, 1,
0.349509, 0.4305319, -0.5182651, 0, 0.1843137, 1, 1,
0.3498906, -0.1792526, 3.955034, 0, 0.1764706, 1, 1,
0.3505913, -1.573628, 1.607261, 0, 0.172549, 1, 1,
0.3524681, 0.4054062, -0.5635775, 0, 0.1647059, 1, 1,
0.3556394, 0.7709432, 1.048641, 0, 0.1607843, 1, 1,
0.3575302, -0.304849, 2.316287, 0, 0.1529412, 1, 1,
0.373319, 0.3935618, 1.299883, 0, 0.1490196, 1, 1,
0.374573, 1.152999, 1.20777, 0, 0.1411765, 1, 1,
0.3770193, -0.6705939, 3.147298, 0, 0.1372549, 1, 1,
0.3818744, -0.04678122, -0.04092883, 0, 0.1294118, 1, 1,
0.3830339, 0.3799883, 1.944567, 0, 0.1254902, 1, 1,
0.3871835, 0.9845296, 0.7428244, 0, 0.1176471, 1, 1,
0.3872309, 1.112026, -0.02528982, 0, 0.1137255, 1, 1,
0.3877182, 0.3409541, 0.1141426, 0, 0.1058824, 1, 1,
0.3889037, 1.101887, -1.679049, 0, 0.09803922, 1, 1,
0.3898923, -0.08377264, 0.9206002, 0, 0.09411765, 1, 1,
0.3922518, 0.01128581, 0.7132063, 0, 0.08627451, 1, 1,
0.3941716, 0.3461956, 0.3400288, 0, 0.08235294, 1, 1,
0.3949349, -0.5398995, 3.112539, 0, 0.07450981, 1, 1,
0.3968319, 0.3916485, 2.868048, 0, 0.07058824, 1, 1,
0.3991344, -0.6482862, 2.35228, 0, 0.0627451, 1, 1,
0.4039966, -0.5537693, 3.846799, 0, 0.05882353, 1, 1,
0.4122626, -0.3010361, 1.213286, 0, 0.05098039, 1, 1,
0.41284, -1.315855, 0.6334689, 0, 0.04705882, 1, 1,
0.4152765, 1.311515, 0.6475032, 0, 0.03921569, 1, 1,
0.4178651, -0.4549996, 2.769074, 0, 0.03529412, 1, 1,
0.419879, -2.493275, 2.081657, 0, 0.02745098, 1, 1,
0.4236723, -0.9163715, 2.87226, 0, 0.02352941, 1, 1,
0.4266283, 0.05599888, 1.42363, 0, 0.01568628, 1, 1,
0.4275392, -0.3995637, 1.198405, 0, 0.01176471, 1, 1,
0.4296578, 1.987609, 1.827234, 0, 0.003921569, 1, 1,
0.4306883, 0.1787135, -0.2281174, 0.003921569, 0, 1, 1,
0.4363233, 0.4819657, -0.3031362, 0.007843138, 0, 1, 1,
0.4379601, -0.3394454, 2.349041, 0.01568628, 0, 1, 1,
0.4427626, -1.788518, 2.798283, 0.01960784, 0, 1, 1,
0.445976, -0.5973073, 1.837335, 0.02745098, 0, 1, 1,
0.4462894, -0.3918032, 0.6774508, 0.03137255, 0, 1, 1,
0.4486054, -0.132077, 3.096875, 0.03921569, 0, 1, 1,
0.4494394, -0.9061496, 2.755977, 0.04313726, 0, 1, 1,
0.456154, 0.522779, 0.9641577, 0.05098039, 0, 1, 1,
0.4696088, -0.4569661, 3.229755, 0.05490196, 0, 1, 1,
0.4720088, -0.6345521, 3.232858, 0.0627451, 0, 1, 1,
0.4730456, 1.910204, 1.058721, 0.06666667, 0, 1, 1,
0.4765735, -1.257776, 4.528893, 0.07450981, 0, 1, 1,
0.4776389, 0.5617828, 0.140409, 0.07843138, 0, 1, 1,
0.4777142, -1.111105, 3.742839, 0.08627451, 0, 1, 1,
0.4783559, 0.902374, 0.8990491, 0.09019608, 0, 1, 1,
0.4793687, -0.8473142, 1.988725, 0.09803922, 0, 1, 1,
0.4842704, 0.3108838, 2.326687, 0.1058824, 0, 1, 1,
0.4844809, 1.74706, 0.04112752, 0.1098039, 0, 1, 1,
0.4846891, 1.106138, -0.8404231, 0.1176471, 0, 1, 1,
0.4860132, 1.510151, 0.2174032, 0.1215686, 0, 1, 1,
0.4899375, -1.370359, 2.639761, 0.1294118, 0, 1, 1,
0.4903494, 0.7487009, 1.190425, 0.1333333, 0, 1, 1,
0.4955657, 0.9476482, -0.8728319, 0.1411765, 0, 1, 1,
0.5006994, 0.2080573, 1.9791, 0.145098, 0, 1, 1,
0.5009254, 0.3762393, -0.0668108, 0.1529412, 0, 1, 1,
0.5089857, -1.415661, 3.1064, 0.1568628, 0, 1, 1,
0.5109926, -0.8125856, 1.682568, 0.1647059, 0, 1, 1,
0.5120706, 0.3185088, 0.1549927, 0.1686275, 0, 1, 1,
0.5139868, -0.3170536, 0.1686987, 0.1764706, 0, 1, 1,
0.5152355, -0.2841772, 1.801209, 0.1803922, 0, 1, 1,
0.5156482, -0.4473145, 2.040772, 0.1882353, 0, 1, 1,
0.5170045, 0.08874413, 0.3930661, 0.1921569, 0, 1, 1,
0.5314057, 1.324607, -1.089056, 0.2, 0, 1, 1,
0.5337946, -0.868874, 1.950948, 0.2078431, 0, 1, 1,
0.5350834, 0.2072246, -0.2466543, 0.2117647, 0, 1, 1,
0.5365489, 0.05752255, 0.8207399, 0.2196078, 0, 1, 1,
0.539966, -0.833648, 2.156072, 0.2235294, 0, 1, 1,
0.5471815, 0.1022271, 1.514264, 0.2313726, 0, 1, 1,
0.5478415, 0.5046485, 2.888719, 0.2352941, 0, 1, 1,
0.5494335, 0.3568817, 1.070072, 0.2431373, 0, 1, 1,
0.5530838, -0.9857805, 2.746347, 0.2470588, 0, 1, 1,
0.5576562, 1.271813, 0.3962794, 0.254902, 0, 1, 1,
0.5592219, -0.3599733, 2.049289, 0.2588235, 0, 1, 1,
0.5616356, 0.6593217, 1.689582, 0.2666667, 0, 1, 1,
0.5630303, 1.569258, 0.9652163, 0.2705882, 0, 1, 1,
0.5631326, -2.139842, 2.061973, 0.2784314, 0, 1, 1,
0.5648791, -0.7625527, 1.260465, 0.282353, 0, 1, 1,
0.5683392, 0.3486309, 1.223387, 0.2901961, 0, 1, 1,
0.5685156, -0.6557296, 3.799357, 0.2941177, 0, 1, 1,
0.5694345, 1.682749, 0.9984175, 0.3019608, 0, 1, 1,
0.5724882, -0.1579904, 1.457871, 0.3098039, 0, 1, 1,
0.5761425, 0.580182, 1.960137, 0.3137255, 0, 1, 1,
0.5778784, 0.4540357, 0.7006708, 0.3215686, 0, 1, 1,
0.5783751, -1.345681, 3.186428, 0.3254902, 0, 1, 1,
0.5826492, -0.8058997, 3.353386, 0.3333333, 0, 1, 1,
0.585756, -0.6039295, 0.7165107, 0.3372549, 0, 1, 1,
0.5912762, -1.187192, 2.066318, 0.345098, 0, 1, 1,
0.5917103, 1.56615, 3.326813, 0.3490196, 0, 1, 1,
0.5946161, 0.2774333, 1.357002, 0.3568628, 0, 1, 1,
0.5981871, -0.9172059, 2.006565, 0.3607843, 0, 1, 1,
0.6092554, 0.08227145, 1.154399, 0.3686275, 0, 1, 1,
0.6105651, 1.344469, 0.7754508, 0.372549, 0, 1, 1,
0.6105887, -0.6642281, 2.87344, 0.3803922, 0, 1, 1,
0.6128628, 1.139807, 0.6633208, 0.3843137, 0, 1, 1,
0.6162322, -0.5861128, 3.502197, 0.3921569, 0, 1, 1,
0.6188484, -0.8058956, 3.386691, 0.3960784, 0, 1, 1,
0.6238236, 0.8036692, 2.307359, 0.4039216, 0, 1, 1,
0.6264925, -0.4081149, 2.459217, 0.4117647, 0, 1, 1,
0.6273549, -0.2147048, 2.893381, 0.4156863, 0, 1, 1,
0.6288968, -0.8442358, 1.856961, 0.4235294, 0, 1, 1,
0.6324812, -1.998937, 2.023071, 0.427451, 0, 1, 1,
0.6333122, -0.05561849, 2.796016, 0.4352941, 0, 1, 1,
0.6373215, 1.025168, 0.02200371, 0.4392157, 0, 1, 1,
0.6452679, 0.5867641, 2.788414, 0.4470588, 0, 1, 1,
0.6497418, -0.389405, 0.9248594, 0.4509804, 0, 1, 1,
0.6575884, 0.191991, 0.4027777, 0.4588235, 0, 1, 1,
0.6595209, 0.1706943, 0.6480698, 0.4627451, 0, 1, 1,
0.6779137, 0.2109777, 1.800489, 0.4705882, 0, 1, 1,
0.6797461, 1.648655, 2.424546, 0.4745098, 0, 1, 1,
0.6818092, 2.28431, 0.7216555, 0.4823529, 0, 1, 1,
0.6909317, 1.620589, -0.02971309, 0.4862745, 0, 1, 1,
0.7021701, 0.2561961, 1.422068, 0.4941176, 0, 1, 1,
0.7028155, -0.8409506, 2.198517, 0.5019608, 0, 1, 1,
0.7081108, 0.3408689, 0.6890195, 0.5058824, 0, 1, 1,
0.7121504, -0.151464, 2.019531, 0.5137255, 0, 1, 1,
0.712486, 1.221998, -0.6433958, 0.5176471, 0, 1, 1,
0.7169384, 0.497482, 1.175077, 0.5254902, 0, 1, 1,
0.7174397, 1.43692, 0.01944559, 0.5294118, 0, 1, 1,
0.7196882, 0.7595893, 1.11209, 0.5372549, 0, 1, 1,
0.723583, 2.213091, -0.1042517, 0.5411765, 0, 1, 1,
0.7259594, 0.4880089, -0.9719194, 0.5490196, 0, 1, 1,
0.7337762, -0.03153757, 1.779877, 0.5529412, 0, 1, 1,
0.7415138, 1.666214, 0.223418, 0.5607843, 0, 1, 1,
0.7520928, -0.3256801, 0.1833523, 0.5647059, 0, 1, 1,
0.7573652, 0.161981, 2.209501, 0.572549, 0, 1, 1,
0.7581592, 0.2764265, 2.177292, 0.5764706, 0, 1, 1,
0.7598505, 0.7593623, 0.6873477, 0.5843138, 0, 1, 1,
0.7607126, 1.213757, -0.4424605, 0.5882353, 0, 1, 1,
0.770828, -1.177815, 1.521885, 0.5960785, 0, 1, 1,
0.7717543, -3.425551, 3.762627, 0.6039216, 0, 1, 1,
0.7729838, 0.05692522, 1.327207, 0.6078432, 0, 1, 1,
0.7748485, 0.5468868, 0.4164128, 0.6156863, 0, 1, 1,
0.7761407, 0.1669278, 1.910753, 0.6196079, 0, 1, 1,
0.7769559, -0.6432366, 0.9291733, 0.627451, 0, 1, 1,
0.7881197, -0.9983468, 2.09884, 0.6313726, 0, 1, 1,
0.7931042, -0.4425266, 2.562608, 0.6392157, 0, 1, 1,
0.7962762, -1.235553, 3.375531, 0.6431373, 0, 1, 1,
0.8002157, 0.4457288, 0.5632078, 0.6509804, 0, 1, 1,
0.8108891, -1.483102, 2.087946, 0.654902, 0, 1, 1,
0.8126118, 0.2238013, 0.0330858, 0.6627451, 0, 1, 1,
0.8126748, 0.2175241, 1.135457, 0.6666667, 0, 1, 1,
0.8175793, -1.10607, 3.602893, 0.6745098, 0, 1, 1,
0.8181046, 0.005035935, 1.635541, 0.6784314, 0, 1, 1,
0.8185058, -0.1647373, 2.295077, 0.6862745, 0, 1, 1,
0.8197508, 1.612256, 0.4952594, 0.6901961, 0, 1, 1,
0.8214357, 0.6300701, 0.9662483, 0.6980392, 0, 1, 1,
0.8230765, 1.950746, 0.4150203, 0.7058824, 0, 1, 1,
0.8290811, -0.2099065, 2.696315, 0.7098039, 0, 1, 1,
0.8298494, -0.1651844, 2.548216, 0.7176471, 0, 1, 1,
0.8379108, 0.4045074, 1.393834, 0.7215686, 0, 1, 1,
0.8422793, 0.3860551, 1.927067, 0.7294118, 0, 1, 1,
0.8473689, -1.653046, 3.342246, 0.7333333, 0, 1, 1,
0.8547949, -0.1590986, 2.013309, 0.7411765, 0, 1, 1,
0.8549814, 1.622728, -0.05128397, 0.7450981, 0, 1, 1,
0.856135, 1.588515, 1.027982, 0.7529412, 0, 1, 1,
0.8565027, 0.9864044, 2.988704, 0.7568628, 0, 1, 1,
0.8666529, 0.2787227, -0.6889867, 0.7647059, 0, 1, 1,
0.8694844, -0.2294718, 2.62981, 0.7686275, 0, 1, 1,
0.871047, -0.05376565, 0.7360364, 0.7764706, 0, 1, 1,
0.8872171, 0.2734305, 2.992838, 0.7803922, 0, 1, 1,
0.8886536, -0.3935745, 1.541233, 0.7882353, 0, 1, 1,
0.8891534, -0.636802, 1.06834, 0.7921569, 0, 1, 1,
0.8927265, 1.449442, 0.2787603, 0.8, 0, 1, 1,
0.9000255, 0.9732257, 0.7837691, 0.8078431, 0, 1, 1,
0.9020192, -0.6714199, 2.27623, 0.8117647, 0, 1, 1,
0.9024777, -0.1212467, 2.909147, 0.8196079, 0, 1, 1,
0.9027259, -0.5705141, 0.6493266, 0.8235294, 0, 1, 1,
0.9031438, 0.529773, 1.522354, 0.8313726, 0, 1, 1,
0.9038213, 0.6215827, 1.335768, 0.8352941, 0, 1, 1,
0.9056644, -0.3102329, 1.574133, 0.8431373, 0, 1, 1,
0.9113926, 0.4487506, -0.07970874, 0.8470588, 0, 1, 1,
0.9137667, -1.433991, 1.919133, 0.854902, 0, 1, 1,
0.925835, 0.5941823, -0.4412291, 0.8588235, 0, 1, 1,
0.9383078, -0.4500442, 3.063016, 0.8666667, 0, 1, 1,
0.9422249, -2.124248, 2.499332, 0.8705882, 0, 1, 1,
0.9450831, 1.367542, -1.703716, 0.8784314, 0, 1, 1,
0.9637564, -0.2128921, 3.834806, 0.8823529, 0, 1, 1,
0.9692838, 0.6904562, 0.2402699, 0.8901961, 0, 1, 1,
0.9711288, 0.4176366, 1.686264, 0.8941177, 0, 1, 1,
0.9725952, -0.01088521, 3.74346, 0.9019608, 0, 1, 1,
0.9741368, 0.2039536, 1.955536, 0.9098039, 0, 1, 1,
0.9832944, -0.65988, 1.755192, 0.9137255, 0, 1, 1,
0.9861437, 0.6182272, 1.704903, 0.9215686, 0, 1, 1,
0.9866785, 0.258923, 1.885192, 0.9254902, 0, 1, 1,
0.9868622, -1.876101, 2.546639, 0.9333333, 0, 1, 1,
0.9923362, -0.8457767, 2.254861, 0.9372549, 0, 1, 1,
0.9928096, 1.612523, -0.8276788, 0.945098, 0, 1, 1,
0.9947586, -0.3851308, 0.8185509, 0.9490196, 0, 1, 1,
1.010668, 0.2012303, 1.833808, 0.9568627, 0, 1, 1,
1.011167, -0.6408315, 2.530704, 0.9607843, 0, 1, 1,
1.014047, 0.6417089, 1.300358, 0.9686275, 0, 1, 1,
1.018986, -0.7282963, 2.855818, 0.972549, 0, 1, 1,
1.019094, -0.6077409, 2.029785, 0.9803922, 0, 1, 1,
1.022095, 0.3919678, -0.004961168, 0.9843137, 0, 1, 1,
1.025253, -1.062302, 1.465469, 0.9921569, 0, 1, 1,
1.026778, 0.5582266, 2.137583, 0.9960784, 0, 1, 1,
1.031937, 2.134083, 1.072599, 1, 0, 0.9960784, 1,
1.035036, 1.436856, 0.2585037, 1, 0, 0.9882353, 1,
1.039021, 0.4346008, -1.084301, 1, 0, 0.9843137, 1,
1.049975, 0.6715465, 0.8865212, 1, 0, 0.9764706, 1,
1.071753, -0.3564002, 0.3019434, 1, 0, 0.972549, 1,
1.072334, -0.2479102, 2.267437, 1, 0, 0.9647059, 1,
1.074948, -0.6115019, 1.628157, 1, 0, 0.9607843, 1,
1.075392, 1.200563, 0.4577515, 1, 0, 0.9529412, 1,
1.080466, -2.447103, 1.72625, 1, 0, 0.9490196, 1,
1.081297, -2.104011, 2.157815, 1, 0, 0.9411765, 1,
1.082395, 0.006217033, 1.89993, 1, 0, 0.9372549, 1,
1.091785, 0.3041499, 2.639727, 1, 0, 0.9294118, 1,
1.092327, -0.4688425, 2.472641, 1, 0, 0.9254902, 1,
1.092717, 0.5058785, 0.6189122, 1, 0, 0.9176471, 1,
1.095941, 0.1335005, 1.238458, 1, 0, 0.9137255, 1,
1.09648, 0.154127, 0.7100597, 1, 0, 0.9058824, 1,
1.097843, 0.6953499, -0.3449299, 1, 0, 0.9019608, 1,
1.118375, -0.2797776, 3.337567, 1, 0, 0.8941177, 1,
1.11991, -1.598902, 3.070709, 1, 0, 0.8862745, 1,
1.122966, 0.4694149, 2.86016, 1, 0, 0.8823529, 1,
1.136289, 2.415559, 1.756381, 1, 0, 0.8745098, 1,
1.140378, -0.8132926, 1.419789, 1, 0, 0.8705882, 1,
1.143123, 0.6138415, 3.347998, 1, 0, 0.8627451, 1,
1.15141, 0.1967993, 2.147197, 1, 0, 0.8588235, 1,
1.159063, -0.9186274, 4.848781, 1, 0, 0.8509804, 1,
1.161361, 0.871941, 0.7253787, 1, 0, 0.8470588, 1,
1.169553, -0.4033461, 2.132042, 1, 0, 0.8392157, 1,
1.173187, 0.5748125, 1.472514, 1, 0, 0.8352941, 1,
1.178366, -0.1056189, 2.715377, 1, 0, 0.827451, 1,
1.185079, -0.2155515, 2.555851, 1, 0, 0.8235294, 1,
1.186217, -0.7020583, 2.788766, 1, 0, 0.8156863, 1,
1.187132, -1.002388, 0.386142, 1, 0, 0.8117647, 1,
1.19495, 1.488464, -0.8606935, 1, 0, 0.8039216, 1,
1.195847, 0.9055898, 1.3749, 1, 0, 0.7960784, 1,
1.196882, 0.3500566, 1.138899, 1, 0, 0.7921569, 1,
1.197527, -0.6287806, 2.154375, 1, 0, 0.7843137, 1,
1.198789, 0.4358742, 1.836589, 1, 0, 0.7803922, 1,
1.198934, -0.1591904, 2.393549, 1, 0, 0.772549, 1,
1.204877, -0.08577565, 0.0412121, 1, 0, 0.7686275, 1,
1.205786, 0.2297324, 1.773129, 1, 0, 0.7607843, 1,
1.21199, -0.08514518, 1.41805, 1, 0, 0.7568628, 1,
1.218243, 0.798731, 1.914601, 1, 0, 0.7490196, 1,
1.218268, -0.1686034, 2.010229, 1, 0, 0.7450981, 1,
1.240191, -0.4493533, 0.8073949, 1, 0, 0.7372549, 1,
1.24092, 0.4917399, 1.850435, 1, 0, 0.7333333, 1,
1.252757, 0.7438734, 0.9147372, 1, 0, 0.7254902, 1,
1.260433, 0.2400647, 2.739427, 1, 0, 0.7215686, 1,
1.268598, -1.535669, 3.832399, 1, 0, 0.7137255, 1,
1.270187, 0.8462905, 1.236997, 1, 0, 0.7098039, 1,
1.275546, 0.9357625, -0.507188, 1, 0, 0.7019608, 1,
1.277949, 0.03530703, 0.6784691, 1, 0, 0.6941177, 1,
1.280579, 1.005699, 1.01452, 1, 0, 0.6901961, 1,
1.287782, 0.9911312, 0.6424392, 1, 0, 0.682353, 1,
1.292174, 0.4342692, 1.747724, 1, 0, 0.6784314, 1,
1.292873, -0.7544897, 1.234588, 1, 0, 0.6705883, 1,
1.296527, -1.416726, 3.013962, 1, 0, 0.6666667, 1,
1.302462, 0.1505127, 2.51646, 1, 0, 0.6588235, 1,
1.305101, -0.01831646, 1.027341, 1, 0, 0.654902, 1,
1.3114, -0.385896, 1.332878, 1, 0, 0.6470588, 1,
1.31951, 2.14247, -0.1804943, 1, 0, 0.6431373, 1,
1.321046, 0.6674128, 0.680527, 1, 0, 0.6352941, 1,
1.322919, 0.9845963, 0.07949601, 1, 0, 0.6313726, 1,
1.325461, 0.9807231, 2.368574, 1, 0, 0.6235294, 1,
1.327588, 1.233442, 1.005052, 1, 0, 0.6196079, 1,
1.330161, -1.690062, 5.323448, 1, 0, 0.6117647, 1,
1.346606, 0.7283483, 1.659688, 1, 0, 0.6078432, 1,
1.354085, 0.3461854, 0.2373191, 1, 0, 0.6, 1,
1.361518, -0.8529639, 3.404645, 1, 0, 0.5921569, 1,
1.36322, -0.1726032, 0.265221, 1, 0, 0.5882353, 1,
1.366184, 0.6023901, 2.410392, 1, 0, 0.5803922, 1,
1.367503, -0.2334542, 2.594037, 1, 0, 0.5764706, 1,
1.385967, 1.230561, 0.4830288, 1, 0, 0.5686275, 1,
1.402896, -0.1721259, 1.933429, 1, 0, 0.5647059, 1,
1.410887, -0.9952229, 2.621638, 1, 0, 0.5568628, 1,
1.415041, -0.9939534, 2.744431, 1, 0, 0.5529412, 1,
1.432748, -0.7420146, 2.923949, 1, 0, 0.5450981, 1,
1.440476, 0.6676528, 2.558808, 1, 0, 0.5411765, 1,
1.450354, 0.2445645, 2.05976, 1, 0, 0.5333334, 1,
1.451902, -0.3776077, 2.407239, 1, 0, 0.5294118, 1,
1.461947, 0.3799676, 2.172517, 1, 0, 0.5215687, 1,
1.482294, -1.864019, -0.4004672, 1, 0, 0.5176471, 1,
1.514642, -1.817487, 3.594869, 1, 0, 0.509804, 1,
1.519785, -0.1496515, 1.298455, 1, 0, 0.5058824, 1,
1.528287, -2.081063, 2.382744, 1, 0, 0.4980392, 1,
1.529086, 0.4438166, 0.1586683, 1, 0, 0.4901961, 1,
1.53636, -1.150567, 3.270547, 1, 0, 0.4862745, 1,
1.551943, 1.379051, -0.3245117, 1, 0, 0.4784314, 1,
1.560674, 1.465062, -1.23499, 1, 0, 0.4745098, 1,
1.569598, -1.297954, 3.307827, 1, 0, 0.4666667, 1,
1.584299, 0.4644938, -0.3206468, 1, 0, 0.4627451, 1,
1.586265, 0.4014981, -0.5722891, 1, 0, 0.454902, 1,
1.58761, 1.350588, 0.7334558, 1, 0, 0.4509804, 1,
1.591195, 1.057782, 1.809529, 1, 0, 0.4431373, 1,
1.596286, -0.5969436, 1.833213, 1, 0, 0.4392157, 1,
1.601075, 0.3845699, 1.281376, 1, 0, 0.4313726, 1,
1.603866, -1.56398, 4.940012, 1, 0, 0.427451, 1,
1.609322, 0.4103939, 1.388637, 1, 0, 0.4196078, 1,
1.617499, -0.9679926, 1.823599, 1, 0, 0.4156863, 1,
1.620455, -0.5953255, 1.542863, 1, 0, 0.4078431, 1,
1.630502, -1.687336, 2.625245, 1, 0, 0.4039216, 1,
1.634813, 0.859239, 0.1374166, 1, 0, 0.3960784, 1,
1.656181, 0.8415149, 1.827644, 1, 0, 0.3882353, 1,
1.658194, 1.189749, 2.025076, 1, 0, 0.3843137, 1,
1.661721, -0.5677428, 0.960171, 1, 0, 0.3764706, 1,
1.665403, 0.2998938, -0.1376363, 1, 0, 0.372549, 1,
1.671152, 1.305506, 1.027575, 1, 0, 0.3647059, 1,
1.681168, -0.3493607, 2.028375, 1, 0, 0.3607843, 1,
1.683816, 0.4347186, 1.918501, 1, 0, 0.3529412, 1,
1.695591, 0.9764358, 0.5366585, 1, 0, 0.3490196, 1,
1.702058, 1.664657, 1.306662, 1, 0, 0.3411765, 1,
1.723468, -0.5916133, 1.425109, 1, 0, 0.3372549, 1,
1.730338, -0.03826974, -0.4793602, 1, 0, 0.3294118, 1,
1.737557, -0.3845873, 1.982865, 1, 0, 0.3254902, 1,
1.740585, 0.2864031, 2.202924, 1, 0, 0.3176471, 1,
1.746431, 0.6156449, 0.896503, 1, 0, 0.3137255, 1,
1.755161, -0.3042659, 0.6145503, 1, 0, 0.3058824, 1,
1.771729, 1.391913, 0.442697, 1, 0, 0.2980392, 1,
1.771752, -0.8800599, 1.275623, 1, 0, 0.2941177, 1,
1.771796, -1.158937, 0.4677145, 1, 0, 0.2862745, 1,
1.774126, -0.85454, 2.553751, 1, 0, 0.282353, 1,
1.799801, 0.8589822, 1.816334, 1, 0, 0.2745098, 1,
1.804332, 2.072615, -0.7256853, 1, 0, 0.2705882, 1,
1.812627, -0.2665707, 2.834204, 1, 0, 0.2627451, 1,
1.815738, -0.9978859, 1.960076, 1, 0, 0.2588235, 1,
1.824509, 0.3224356, 1.925068, 1, 0, 0.2509804, 1,
1.843046, 1.563018, -1.085864, 1, 0, 0.2470588, 1,
1.846855, 2.124455, 1.105292, 1, 0, 0.2392157, 1,
1.858685, 1.193526, 0.006490866, 1, 0, 0.2352941, 1,
1.868757, 1.043362, 0.9465445, 1, 0, 0.227451, 1,
1.88116, -0.8476133, 1.140266, 1, 0, 0.2235294, 1,
1.891255, 2.219701, -0.5397695, 1, 0, 0.2156863, 1,
1.897855, -1.430963, 2.920625, 1, 0, 0.2117647, 1,
1.902066, -1.196188, 1.961408, 1, 0, 0.2039216, 1,
1.916824, -1.967682, 1.910274, 1, 0, 0.1960784, 1,
1.923088, -0.009127258, 1.187543, 1, 0, 0.1921569, 1,
1.936528, -1.08744, 0.1163897, 1, 0, 0.1843137, 1,
1.944246, -0.5692357, 3.55759, 1, 0, 0.1803922, 1,
1.962946, 0.5455424, 0.359334, 1, 0, 0.172549, 1,
1.987355, -1.005184, 1.917621, 1, 0, 0.1686275, 1,
2.001196, -0.5852909, 1.033187, 1, 0, 0.1607843, 1,
2.014195, -1.298286, 2.562144, 1, 0, 0.1568628, 1,
2.021018, 0.2939835, 0.5315617, 1, 0, 0.1490196, 1,
2.031058, 0.5084972, 1.294657, 1, 0, 0.145098, 1,
2.043483, -0.5263035, 2.251025, 1, 0, 0.1372549, 1,
2.061414, 0.5476599, 1.561347, 1, 0, 0.1333333, 1,
2.067003, 0.2006876, 1.584894, 1, 0, 0.1254902, 1,
2.070855, -0.1091079, 3.632564, 1, 0, 0.1215686, 1,
2.075, 0.7855704, 3.546742, 1, 0, 0.1137255, 1,
2.160751, -0.2163219, 0.2678132, 1, 0, 0.1098039, 1,
2.16213, -0.5018742, 1.667383, 1, 0, 0.1019608, 1,
2.1805, -0.7752671, 3.20136, 1, 0, 0.09411765, 1,
2.204976, -1.963888, 2.045861, 1, 0, 0.09019608, 1,
2.3068, 0.6198627, 2.517514, 1, 0, 0.08235294, 1,
2.315148, -0.395462, 2.325064, 1, 0, 0.07843138, 1,
2.320429, 0.9587927, 1.394936, 1, 0, 0.07058824, 1,
2.325042, 1.002715, 0.5059783, 1, 0, 0.06666667, 1,
2.34325, -0.6994457, 3.128695, 1, 0, 0.05882353, 1,
2.353466, -0.7216256, 2.943055, 1, 0, 0.05490196, 1,
2.408714, 1.686494, 1.725644, 1, 0, 0.04705882, 1,
2.545871, -0.1011792, 1.203754, 1, 0, 0.04313726, 1,
2.580019, 1.344929, 1.259985, 1, 0, 0.03529412, 1,
2.586007, 0.5465657, 0.2597581, 1, 0, 0.03137255, 1,
2.686048, -0.2172306, 1.239813, 1, 0, 0.02352941, 1,
2.832569, 2.393381, 2.366899, 1, 0, 0.01960784, 1,
2.893631, 1.073567, 1.032337, 1, 0, 0.01176471, 1,
3.239697, 1.021383, 2.343385, 1, 0, 0.007843138, 1
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
-0.1342881, -4.544671, -7.224278, 0, -0.5, 0.5, 0.5,
-0.1342881, -4.544671, -7.224278, 1, -0.5, 0.5, 0.5,
-0.1342881, -4.544671, -7.224278, 1, 1.5, 0.5, 0.5,
-0.1342881, -4.544671, -7.224278, 0, 1.5, 0.5, 0.5
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
-4.652053, -0.1243155, -7.224278, 0, -0.5, 0.5, 0.5,
-4.652053, -0.1243155, -7.224278, 1, -0.5, 0.5, 0.5,
-4.652053, -0.1243155, -7.224278, 1, 1.5, 0.5, 0.5,
-4.652053, -0.1243155, -7.224278, 0, 1.5, 0.5, 0.5
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
-4.652053, -4.544671, -0.04112101, 0, -0.5, 0.5, 0.5,
-4.652053, -4.544671, -0.04112101, 1, -0.5, 0.5, 0.5,
-4.652053, -4.544671, -0.04112101, 1, 1.5, 0.5, 0.5,
-4.652053, -4.544671, -0.04112101, 0, 1.5, 0.5, 0.5
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
-3, -3.524589, -5.566627,
3, -3.524589, -5.566627,
-3, -3.524589, -5.566627,
-3, -3.694602, -5.842902,
-2, -3.524589, -5.566627,
-2, -3.694602, -5.842902,
-1, -3.524589, -5.566627,
-1, -3.694602, -5.842902,
0, -3.524589, -5.566627,
0, -3.694602, -5.842902,
1, -3.524589, -5.566627,
1, -3.694602, -5.842902,
2, -3.524589, -5.566627,
2, -3.694602, -5.842902,
3, -3.524589, -5.566627,
3, -3.694602, -5.842902
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
-3, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
-3, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
-3, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
-3, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5,
-2, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
-2, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
-2, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
-2, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5,
-1, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
-1, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
-1, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
-1, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5,
0, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
0, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
0, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
0, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5,
1, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
1, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
1, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
1, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5,
2, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
2, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
2, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
2, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5,
3, -4.034629, -6.395452, 0, -0.5, 0.5, 0.5,
3, -4.034629, -6.395452, 1, -0.5, 0.5, 0.5,
3, -4.034629, -6.395452, 1, 1.5, 0.5, 0.5,
3, -4.034629, -6.395452, 0, 1.5, 0.5, 0.5
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
-3.609492, -3, -5.566627,
-3.609492, 3, -5.566627,
-3.609492, -3, -5.566627,
-3.783252, -3, -5.842902,
-3.609492, -2, -5.566627,
-3.783252, -2, -5.842902,
-3.609492, -1, -5.566627,
-3.783252, -1, -5.842902,
-3.609492, 0, -5.566627,
-3.783252, 0, -5.842902,
-3.609492, 1, -5.566627,
-3.783252, 1, -5.842902,
-3.609492, 2, -5.566627,
-3.783252, 2, -5.842902,
-3.609492, 3, -5.566627,
-3.783252, 3, -5.842902
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
-4.130773, -3, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, -3, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, -3, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, -3, -6.395452, 0, 1.5, 0.5, 0.5,
-4.130773, -2, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, -2, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, -2, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, -2, -6.395452, 0, 1.5, 0.5, 0.5,
-4.130773, -1, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, -1, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, -1, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, -1, -6.395452, 0, 1.5, 0.5, 0.5,
-4.130773, 0, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, 0, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, 0, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, 0, -6.395452, 0, 1.5, 0.5, 0.5,
-4.130773, 1, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, 1, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, 1, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, 1, -6.395452, 0, 1.5, 0.5, 0.5,
-4.130773, 2, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, 2, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, 2, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, 2, -6.395452, 0, 1.5, 0.5, 0.5,
-4.130773, 3, -6.395452, 0, -0.5, 0.5, 0.5,
-4.130773, 3, -6.395452, 1, -0.5, 0.5, 0.5,
-4.130773, 3, -6.395452, 1, 1.5, 0.5, 0.5,
-4.130773, 3, -6.395452, 0, 1.5, 0.5, 0.5
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
-3.609492, -3.524589, -4,
-3.609492, -3.524589, 4,
-3.609492, -3.524589, -4,
-3.783252, -3.694602, -4,
-3.609492, -3.524589, -2,
-3.783252, -3.694602, -2,
-3.609492, -3.524589, 0,
-3.783252, -3.694602, 0,
-3.609492, -3.524589, 2,
-3.783252, -3.694602, 2,
-3.609492, -3.524589, 4,
-3.783252, -3.694602, 4
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
-4.130773, -4.034629, -4, 0, -0.5, 0.5, 0.5,
-4.130773, -4.034629, -4, 1, -0.5, 0.5, 0.5,
-4.130773, -4.034629, -4, 1, 1.5, 0.5, 0.5,
-4.130773, -4.034629, -4, 0, 1.5, 0.5, 0.5,
-4.130773, -4.034629, -2, 0, -0.5, 0.5, 0.5,
-4.130773, -4.034629, -2, 1, -0.5, 0.5, 0.5,
-4.130773, -4.034629, -2, 1, 1.5, 0.5, 0.5,
-4.130773, -4.034629, -2, 0, 1.5, 0.5, 0.5,
-4.130773, -4.034629, 0, 0, -0.5, 0.5, 0.5,
-4.130773, -4.034629, 0, 1, -0.5, 0.5, 0.5,
-4.130773, -4.034629, 0, 1, 1.5, 0.5, 0.5,
-4.130773, -4.034629, 0, 0, 1.5, 0.5, 0.5,
-4.130773, -4.034629, 2, 0, -0.5, 0.5, 0.5,
-4.130773, -4.034629, 2, 1, -0.5, 0.5, 0.5,
-4.130773, -4.034629, 2, 1, 1.5, 0.5, 0.5,
-4.130773, -4.034629, 2, 0, 1.5, 0.5, 0.5,
-4.130773, -4.034629, 4, 0, -0.5, 0.5, 0.5,
-4.130773, -4.034629, 4, 1, -0.5, 0.5, 0.5,
-4.130773, -4.034629, 4, 1, 1.5, 0.5, 0.5,
-4.130773, -4.034629, 4, 0, 1.5, 0.5, 0.5
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
-3.609492, -3.524589, -5.566627,
-3.609492, 3.275958, -5.566627,
-3.609492, -3.524589, 5.484385,
-3.609492, 3.275958, 5.484385,
-3.609492, -3.524589, -5.566627,
-3.609492, -3.524589, 5.484385,
-3.609492, 3.275958, -5.566627,
-3.609492, 3.275958, 5.484385,
-3.609492, -3.524589, -5.566627,
3.340916, -3.524589, -5.566627,
-3.609492, -3.524589, 5.484385,
3.340916, -3.524589, 5.484385,
-3.609492, 3.275958, -5.566627,
3.340916, 3.275958, -5.566627,
-3.609492, 3.275958, 5.484385,
3.340916, 3.275958, 5.484385,
3.340916, -3.524589, -5.566627,
3.340916, 3.275958, -5.566627,
3.340916, -3.524589, 5.484385,
3.340916, 3.275958, 5.484385,
3.340916, -3.524589, -5.566627,
3.340916, -3.524589, 5.484385,
3.340916, 3.275958, -5.566627,
3.340916, 3.275958, 5.484385
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
var radius = 7.860231;
var distance = 34.97106;
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
mvMatrix.translate( 0.1342881, 0.1243155, 0.04112101 );
mvMatrix.scale( 1.222754, 1.249699, 0.7690369 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97106);
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
clomazone<-read.table("clomazone.xyz")
```

```
## Error in read.table("clomazone.xyz"): no lines available in input
```

```r
x<-clomazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
```

```r
y<-clomazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
```

```r
z<-clomazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'clomazone' not found
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
-3.508273, -1.932258, -2.548101, 0, 0, 1, 1, 1,
-2.896241, -0.4731039, 0.07391607, 1, 0, 0, 1, 1,
-2.834579, 0.02109839, -2.447573, 1, 0, 0, 1, 1,
-2.688164, -1.270103, -2.659015, 1, 0, 0, 1, 1,
-2.625234, 1.337075, -0.3849301, 1, 0, 0, 1, 1,
-2.610948, -1.007728, -2.204889, 1, 0, 0, 1, 1,
-2.545363, 0.6797199, -0.7208809, 0, 0, 0, 1, 1,
-2.379869, -0.05755223, -0.2917197, 0, 0, 0, 1, 1,
-2.375451, -0.08019199, -0.2753114, 0, 0, 0, 1, 1,
-2.314088, -0.6974607, -1.33633, 0, 0, 0, 1, 1,
-2.243179, 0.5058455, -0.6463028, 0, 0, 0, 1, 1,
-2.214049, -1.075255, -2.546971, 0, 0, 0, 1, 1,
-2.211787, -0.3154242, -3.148099, 0, 0, 0, 1, 1,
-2.148038, -1.747106, -1.680402, 1, 1, 1, 1, 1,
-2.066405, -0.3302764, -2.43711, 1, 1, 1, 1, 1,
-2.055027, -0.3067978, -2.850653, 1, 1, 1, 1, 1,
-2.028085, -1.030876, -0.4569061, 1, 1, 1, 1, 1,
-1.997977, 0.02659588, -1.509715, 1, 1, 1, 1, 1,
-1.935357, -0.4964731, -2.590246, 1, 1, 1, 1, 1,
-1.90215, 0.01725273, -2.258126, 1, 1, 1, 1, 1,
-1.877778, -0.5971768, -1.466118, 1, 1, 1, 1, 1,
-1.876619, 1.143115, -2.283021, 1, 1, 1, 1, 1,
-1.854081, 0.01364497, -0.8888044, 1, 1, 1, 1, 1,
-1.846875, -0.5302216, -2.395272, 1, 1, 1, 1, 1,
-1.842578, -0.8572225, -2.465536, 1, 1, 1, 1, 1,
-1.83557, 0.1220016, -2.220118, 1, 1, 1, 1, 1,
-1.829179, 0.2736105, -0.463135, 1, 1, 1, 1, 1,
-1.799417, -1.537014, -2.397414, 1, 1, 1, 1, 1,
-1.798088, -0.7860854, -1.486979, 0, 0, 1, 1, 1,
-1.796036, 0.05025031, -1.151588, 1, 0, 0, 1, 1,
-1.779459, -0.8344275, -1.640528, 1, 0, 0, 1, 1,
-1.774831, -0.1977776, -2.390779, 1, 0, 0, 1, 1,
-1.753098, 0.7252992, -2.83338, 1, 0, 0, 1, 1,
-1.73575, 0.5178995, 0.147389, 1, 0, 0, 1, 1,
-1.735383, -1.834055, -0.4270453, 0, 0, 0, 1, 1,
-1.721151, -0.4319971, -2.411416, 0, 0, 0, 1, 1,
-1.718803, -0.6949738, -5.40569, 0, 0, 0, 1, 1,
-1.716489, -1.703791, -2.273933, 0, 0, 0, 1, 1,
-1.709056, 0.1464935, -2.139789, 0, 0, 0, 1, 1,
-1.697556, -0.4519935, -1.950964, 0, 0, 0, 1, 1,
-1.696713, 0.9299916, -0.4443206, 0, 0, 0, 1, 1,
-1.680549, 0.1266622, -2.261164, 1, 1, 1, 1, 1,
-1.666058, -2.279085, -2.358598, 1, 1, 1, 1, 1,
-1.633347, -0.6344004, -1.268704, 1, 1, 1, 1, 1,
-1.59259, 0.7299519, -1.906136, 1, 1, 1, 1, 1,
-1.584494, 0.8034205, -0.191924, 1, 1, 1, 1, 1,
-1.580623, -0.1934061, -2.341308, 1, 1, 1, 1, 1,
-1.579732, 0.1805509, -0.7171092, 1, 1, 1, 1, 1,
-1.578947, 0.1121426, 0.7283571, 1, 1, 1, 1, 1,
-1.578817, -1.935824, -2.427274, 1, 1, 1, 1, 1,
-1.576326, -0.003986879, -1.201623, 1, 1, 1, 1, 1,
-1.562078, -0.04614005, -2.769216, 1, 1, 1, 1, 1,
-1.56028, 0.62089, -0.06839855, 1, 1, 1, 1, 1,
-1.557488, -2.1606, -3.452361, 1, 1, 1, 1, 1,
-1.551289, -0.09302765, -1.803914, 1, 1, 1, 1, 1,
-1.550854, 0.7709149, 0.03460488, 1, 1, 1, 1, 1,
-1.550095, 0.5431188, -1.033105, 0, 0, 1, 1, 1,
-1.545255, -0.3573053, -2.854656, 1, 0, 0, 1, 1,
-1.526268, 0.1970893, -1.211087, 1, 0, 0, 1, 1,
-1.523882, 3.17692, -0.4675168, 1, 0, 0, 1, 1,
-1.510565, -0.2274591, -0.5947921, 1, 0, 0, 1, 1,
-1.510288, 0.9366183, -2.369328, 1, 0, 0, 1, 1,
-1.500316, -0.2766104, -1.461074, 0, 0, 0, 1, 1,
-1.496218, 1.475986, -1.404642, 0, 0, 0, 1, 1,
-1.491539, 0.7221029, -0.2449468, 0, 0, 0, 1, 1,
-1.487783, 0.5675834, -2.554307, 0, 0, 0, 1, 1,
-1.45188, -0.6474174, -3.06268, 0, 0, 0, 1, 1,
-1.44944, 1.074445, 0.3739444, 0, 0, 0, 1, 1,
-1.445771, 1.228224, -0.2319207, 0, 0, 0, 1, 1,
-1.438684, -0.6476363, -0.8219592, 1, 1, 1, 1, 1,
-1.43709, -0.6008387, -0.7560856, 1, 1, 1, 1, 1,
-1.436314, 0.8823906, 0.1192077, 1, 1, 1, 1, 1,
-1.429449, 0.2901872, -2.410247, 1, 1, 1, 1, 1,
-1.419696, -1.876132, -4.867203, 1, 1, 1, 1, 1,
-1.393829, 0.4666102, -0.9001734, 1, 1, 1, 1, 1,
-1.392142, -1.663453, -3.095843, 1, 1, 1, 1, 1,
-1.377629, 1.352955, -0.9641469, 1, 1, 1, 1, 1,
-1.375497, -0.9712629, -1.893402, 1, 1, 1, 1, 1,
-1.374216, 0.4893679, -1.322708, 1, 1, 1, 1, 1,
-1.364455, -0.9291547, -2.803334, 1, 1, 1, 1, 1,
-1.358968, 0.3194184, -0.6293714, 1, 1, 1, 1, 1,
-1.348975, 1.125936, -0.569729, 1, 1, 1, 1, 1,
-1.341154, 0.2873951, 0.06922478, 1, 1, 1, 1, 1,
-1.340211, -1.039969, -3.574457, 1, 1, 1, 1, 1,
-1.336705, 0.003931988, -0.228434, 0, 0, 1, 1, 1,
-1.335986, 0.08522259, -1.049262, 1, 0, 0, 1, 1,
-1.331156, 0.1280803, -1.804218, 1, 0, 0, 1, 1,
-1.326823, 0.4864805, -1.701112, 1, 0, 0, 1, 1,
-1.324371, -0.6493512, -2.042435, 1, 0, 0, 1, 1,
-1.317521, -0.4687857, -3.172329, 1, 0, 0, 1, 1,
-1.309497, 0.0965126, -1.901039, 0, 0, 0, 1, 1,
-1.298193, 0.8627356, 0.2674036, 0, 0, 0, 1, 1,
-1.284358, 0.1085207, -2.467727, 0, 0, 0, 1, 1,
-1.280947, -0.9405051, -2.04203, 0, 0, 0, 1, 1,
-1.280381, -0.5985743, -1.712454, 0, 0, 0, 1, 1,
-1.279692, 1.011155, -3.057121, 0, 0, 0, 1, 1,
-1.27481, -0.06961312, -1.518308, 0, 0, 0, 1, 1,
-1.270012, -0.6277952, -0.7578809, 1, 1, 1, 1, 1,
-1.265754, 2.524702, -0.7054383, 1, 1, 1, 1, 1,
-1.248025, -0.1368227, -0.1039377, 1, 1, 1, 1, 1,
-1.238426, 2.050564, -0.3260315, 1, 1, 1, 1, 1,
-1.232844, 1.164662, -0.7058948, 1, 1, 1, 1, 1,
-1.218475, 2.151441, 0.4363723, 1, 1, 1, 1, 1,
-1.212293, 0.1548749, -1.48153, 1, 1, 1, 1, 1,
-1.211789, 0.72882, -0.8064528, 1, 1, 1, 1, 1,
-1.211625, -0.1094133, -1.932714, 1, 1, 1, 1, 1,
-1.202212, -2.206909, -2.777908, 1, 1, 1, 1, 1,
-1.192854, 0.5147742, -2.140448, 1, 1, 1, 1, 1,
-1.182736, -0.1471196, -0.2141188, 1, 1, 1, 1, 1,
-1.176955, 0.8407589, 0.4034404, 1, 1, 1, 1, 1,
-1.174569, 0.7364392, -0.8091242, 1, 1, 1, 1, 1,
-1.171884, -0.5992342, -2.404429, 1, 1, 1, 1, 1,
-1.163259, 0.06307567, -2.607824, 0, 0, 1, 1, 1,
-1.162058, -0.5726629, -3.453614, 1, 0, 0, 1, 1,
-1.161419, 1.123285, -1.435653, 1, 0, 0, 1, 1,
-1.161186, 0.2295648, -1.485711, 1, 0, 0, 1, 1,
-1.156448, 0.1155746, -0.6034386, 1, 0, 0, 1, 1,
-1.154495, -1.199014, -2.469666, 1, 0, 0, 1, 1,
-1.153883, 0.228284, -1.491013, 0, 0, 0, 1, 1,
-1.15295, -1.412864, -1.908786, 0, 0, 0, 1, 1,
-1.152476, -0.4035337, -1.653815, 0, 0, 0, 1, 1,
-1.146987, 1.649949, -0.1980936, 0, 0, 0, 1, 1,
-1.143039, 1.244418, -1.775297, 0, 0, 0, 1, 1,
-1.142689, 0.2921292, -1.578881, 0, 0, 0, 1, 1,
-1.139633, -2.239106, -2.987167, 0, 0, 0, 1, 1,
-1.133958, 0.4822378, -1.636952, 1, 1, 1, 1, 1,
-1.13361, 0.7525491, -0.8383123, 1, 1, 1, 1, 1,
-1.129986, 0.9465021, -1.001361, 1, 1, 1, 1, 1,
-1.123142, 0.7401789, -0.0243636, 1, 1, 1, 1, 1,
-1.122612, 1.066333, -0.3731038, 1, 1, 1, 1, 1,
-1.12091, -0.3433292, -1.405093, 1, 1, 1, 1, 1,
-1.119503, 0.3361273, -0.9504424, 1, 1, 1, 1, 1,
-1.116573, 1.879709, -0.4892558, 1, 1, 1, 1, 1,
-1.11387, 1.656808, 0.706723, 1, 1, 1, 1, 1,
-1.1056, -1.016362, -2.333658, 1, 1, 1, 1, 1,
-1.102991, 1.522476, -1.387568, 1, 1, 1, 1, 1,
-1.09937, 1.751297, 0.6896999, 1, 1, 1, 1, 1,
-1.089086, -1.005486, -2.534101, 1, 1, 1, 1, 1,
-1.068202, 1.031853, 1.994446, 1, 1, 1, 1, 1,
-1.063304, -0.9957532, -1.906462, 1, 1, 1, 1, 1,
-1.059164, -0.7224995, -2.271522, 0, 0, 1, 1, 1,
-1.05638, 0.0942166, -1.959499, 1, 0, 0, 1, 1,
-1.054988, -0.002932816, -0.2348624, 1, 0, 0, 1, 1,
-1.054687, -0.06428056, -0.7530071, 1, 0, 0, 1, 1,
-1.053238, -0.8740538, -5.02937, 1, 0, 0, 1, 1,
-1.051832, 0.07615398, -2.237862, 1, 0, 0, 1, 1,
-1.050572, 2.367304, -0.4244553, 0, 0, 0, 1, 1,
-1.050118, 0.02775648, -1.252168, 0, 0, 0, 1, 1,
-1.047374, -0.2255579, -1.643896, 0, 0, 0, 1, 1,
-1.029318, 0.5998708, -1.861464, 0, 0, 0, 1, 1,
-1.018657, 0.5125288, -2.170335, 0, 0, 0, 1, 1,
-1.010586, -1.239047, -1.832495, 0, 0, 0, 1, 1,
-0.994472, 0.458905, 0.3021311, 0, 0, 0, 1, 1,
-0.9890005, 0.5925612, 0.4342543, 1, 1, 1, 1, 1,
-0.9868511, 0.1338572, -0.946723, 1, 1, 1, 1, 1,
-0.9866821, 0.7778627, -1.220635, 1, 1, 1, 1, 1,
-0.9833869, -0.1006911, -2.628915, 1, 1, 1, 1, 1,
-0.9828958, 2.283329, -0.7796533, 1, 1, 1, 1, 1,
-0.978817, -0.5786854, -2.397788, 1, 1, 1, 1, 1,
-0.9760131, 0.7025983, -1.908995, 1, 1, 1, 1, 1,
-0.9753523, 0.7018107, -1.008552, 1, 1, 1, 1, 1,
-0.9729155, -0.8740482, -1.966942, 1, 1, 1, 1, 1,
-0.9696181, 0.4869508, -0.919369, 1, 1, 1, 1, 1,
-0.9679713, 1.688975, 0.84785, 1, 1, 1, 1, 1,
-0.9657904, -0.3096126, -3.135474, 1, 1, 1, 1, 1,
-0.9625964, 0.5060995, -0.001431133, 1, 1, 1, 1, 1,
-0.9592, 0.9032273, -1.378152, 1, 1, 1, 1, 1,
-0.9590142, -0.197373, -2.02638, 1, 1, 1, 1, 1,
-0.9573666, 0.09870756, -3.109006, 0, 0, 1, 1, 1,
-0.9572049, 0.528652, -0.1998528, 1, 0, 0, 1, 1,
-0.9540743, -0.2638985, -0.3070204, 1, 0, 0, 1, 1,
-0.9493423, -0.3975576, -1.375584, 1, 0, 0, 1, 1,
-0.9326188, -0.3019177, -1.235279, 1, 0, 0, 1, 1,
-0.9286956, -0.1122059, -1.995127, 1, 0, 0, 1, 1,
-0.92455, -0.8313589, -0.9013348, 0, 0, 0, 1, 1,
-0.9222806, 1.041077, 0.623614, 0, 0, 0, 1, 1,
-0.9175708, -0.9787406, -1.107973, 0, 0, 0, 1, 1,
-0.9154777, 0.6276487, -1.296822, 0, 0, 0, 1, 1,
-0.907554, 1.710397, -0.09498572, 0, 0, 0, 1, 1,
-0.9063244, -0.2297231, -0.1980394, 0, 0, 0, 1, 1,
-0.8934684, -0.03439445, -2.553478, 0, 0, 0, 1, 1,
-0.8922071, 0.06160396, -1.220238, 1, 1, 1, 1, 1,
-0.8914622, -1.826666, -1.157985, 1, 1, 1, 1, 1,
-0.8746988, -0.08514132, -2.204441, 1, 1, 1, 1, 1,
-0.8739024, -0.8893728, -2.999854, 1, 1, 1, 1, 1,
-0.8708217, 0.8350205, -1.92064, 1, 1, 1, 1, 1,
-0.8677201, -0.2950339, -1.323049, 1, 1, 1, 1, 1,
-0.8666604, 0.5353466, -1.660862, 1, 1, 1, 1, 1,
-0.8591678, 0.8423414, 0.1333536, 1, 1, 1, 1, 1,
-0.8590003, -1.759672, -1.161759, 1, 1, 1, 1, 1,
-0.8581175, 0.3706274, -3.228102, 1, 1, 1, 1, 1,
-0.8517672, -0.4800309, 0.4137288, 1, 1, 1, 1, 1,
-0.8502864, 0.4516956, -1.458237, 1, 1, 1, 1, 1,
-0.8426908, -0.1359231, -4.659502, 1, 1, 1, 1, 1,
-0.8407207, -0.854434, -0.7100754, 1, 1, 1, 1, 1,
-0.835435, 0.1905905, -0.6366928, 1, 1, 1, 1, 1,
-0.8323804, 0.2728226, -2.454551, 0, 0, 1, 1, 1,
-0.8316731, 0.5317575, -0.1641627, 1, 0, 0, 1, 1,
-0.8297006, 2.03986, -1.590857, 1, 0, 0, 1, 1,
-0.8256072, -0.1010456, -2.973791, 1, 0, 0, 1, 1,
-0.8221106, -0.6060038, -2.360591, 1, 0, 0, 1, 1,
-0.8205593, 0.004697525, -1.572461, 1, 0, 0, 1, 1,
-0.8170458, -0.3458639, -2.395138, 0, 0, 0, 1, 1,
-0.8145319, 0.2487554, -1.469358, 0, 0, 0, 1, 1,
-0.8144935, -0.7424711, -3.28777, 0, 0, 0, 1, 1,
-0.8080459, -0.2808323, -2.034919, 0, 0, 0, 1, 1,
-0.8057251, 0.09112449, -0.8796251, 0, 0, 0, 1, 1,
-0.8046663, 1.124645, -1.404267, 0, 0, 0, 1, 1,
-0.8026384, 0.2054828, -2.283896, 0, 0, 0, 1, 1,
-0.7998059, -0.8142871, -1.643266, 1, 1, 1, 1, 1,
-0.7967878, -0.1052824, -1.096505, 1, 1, 1, 1, 1,
-0.7922156, -0.7179456, -2.464188, 1, 1, 1, 1, 1,
-0.7899805, 0.558691, -1.148165, 1, 1, 1, 1, 1,
-0.7867748, -0.004372521, 0.6093643, 1, 1, 1, 1, 1,
-0.785205, 0.3402446, -1.052786, 1, 1, 1, 1, 1,
-0.7819017, 0.4698419, -1.270378, 1, 1, 1, 1, 1,
-0.7802225, -0.2842558, -3.046227, 1, 1, 1, 1, 1,
-0.7625329, 0.8521371, 0.07777084, 1, 1, 1, 1, 1,
-0.7548313, -1.405463, -2.340315, 1, 1, 1, 1, 1,
-0.7546118, 0.1449236, -1.02287, 1, 1, 1, 1, 1,
-0.7494189, 0.3710564, -0.33396, 1, 1, 1, 1, 1,
-0.7490061, -1.273171, -3.880261, 1, 1, 1, 1, 1,
-0.7481902, -0.04882488, -1.821561, 1, 1, 1, 1, 1,
-0.7463117, -0.730522, 0.230774, 1, 1, 1, 1, 1,
-0.7441497, -0.6205153, -2.155253, 0, 0, 1, 1, 1,
-0.7399867, 1.022182, -0.009917835, 1, 0, 0, 1, 1,
-0.7377505, -1.40286, -2.162531, 1, 0, 0, 1, 1,
-0.7365677, 0.6201454, -1.34046, 1, 0, 0, 1, 1,
-0.7348176, 0.8859372, -0.02052836, 1, 0, 0, 1, 1,
-0.7342232, 0.2168337, -1.474197, 1, 0, 0, 1, 1,
-0.7291955, 1.306757, -1.905286, 0, 0, 0, 1, 1,
-0.7261861, -0.8101411, -3.243016, 0, 0, 0, 1, 1,
-0.72424, 1.558995, -0.9238018, 0, 0, 0, 1, 1,
-0.7187687, 1.521212, -1.758557, 0, 0, 0, 1, 1,
-0.7184542, 0.6074957, -0.7262701, 0, 0, 0, 1, 1,
-0.7167526, 0.1753468, -2.525066, 0, 0, 0, 1, 1,
-0.7116271, -0.3555547, -2.333387, 0, 0, 0, 1, 1,
-0.7094845, -0.1448943, -2.206776, 1, 1, 1, 1, 1,
-0.7076678, 0.9392622, -0.2024451, 1, 1, 1, 1, 1,
-0.7065002, 1.281827, -2.497884, 1, 1, 1, 1, 1,
-0.7036213, 0.9520146, 0.0128478, 1, 1, 1, 1, 1,
-0.7032465, 0.9173388, -0.1143031, 1, 1, 1, 1, 1,
-0.7019546, 1.774152, -1.31338, 1, 1, 1, 1, 1,
-0.6994433, -1.754554, -2.229674, 1, 1, 1, 1, 1,
-0.6994349, -0.2746396, -2.330263, 1, 1, 1, 1, 1,
-0.6983535, -0.8273883, -2.378068, 1, 1, 1, 1, 1,
-0.6981574, 0.23782, -0.9748667, 1, 1, 1, 1, 1,
-0.6951991, -1.049946, -2.494855, 1, 1, 1, 1, 1,
-0.6948603, 1.080748, -0.9164746, 1, 1, 1, 1, 1,
-0.6941895, 0.7017229, -0.9026183, 1, 1, 1, 1, 1,
-0.6911982, 0.04487923, -0.5239162, 1, 1, 1, 1, 1,
-0.6900894, 0.4431669, -0.5406426, 1, 1, 1, 1, 1,
-0.6830577, 0.2177651, -0.3350932, 0, 0, 1, 1, 1,
-0.6821722, -1.308761, -0.6616018, 1, 0, 0, 1, 1,
-0.6770245, -0.9784279, -4.008477, 1, 0, 0, 1, 1,
-0.6743191, 0.4007619, -1.375941, 1, 0, 0, 1, 1,
-0.6648768, 0.01740848, -1.066842, 1, 0, 0, 1, 1,
-0.6607208, -0.9968187, -2.898613, 1, 0, 0, 1, 1,
-0.6531652, 0.3233982, -1.287181, 0, 0, 0, 1, 1,
-0.6510983, 0.73696, 0.1098654, 0, 0, 0, 1, 1,
-0.6482992, -0.4748809, -1.77462, 0, 0, 0, 1, 1,
-0.6465251, -0.7923275, -2.83778, 0, 0, 0, 1, 1,
-0.6454969, -2.414921, -3.068503, 0, 0, 0, 1, 1,
-0.6450891, 0.5252271, -0.7568324, 0, 0, 0, 1, 1,
-0.641665, -1.131741, -2.925186, 0, 0, 0, 1, 1,
-0.6396268, 0.3151041, -1.01347, 1, 1, 1, 1, 1,
-0.6389313, -0.7674128, -1.390427, 1, 1, 1, 1, 1,
-0.6379909, -0.02572822, -1.03022, 1, 1, 1, 1, 1,
-0.632192, -2.192385, -2.112562, 1, 1, 1, 1, 1,
-0.6228461, 0.7882556, 0.2628246, 1, 1, 1, 1, 1,
-0.6098187, 0.8463785, -0.7968674, 1, 1, 1, 1, 1,
-0.6086941, 0.5687033, -1.152271, 1, 1, 1, 1, 1,
-0.6056276, 0.6306366, -0.3239261, 1, 1, 1, 1, 1,
-0.6036702, -1.873065, -1.546221, 1, 1, 1, 1, 1,
-0.6030298, -0.903063, -1.867466, 1, 1, 1, 1, 1,
-0.59549, 0.815851, -0.2958677, 1, 1, 1, 1, 1,
-0.5948935, -1.160585, -2.247373, 1, 1, 1, 1, 1,
-0.5834274, 0.7038837, -0.8212147, 1, 1, 1, 1, 1,
-0.5732353, 0.8132136, 0.5438622, 1, 1, 1, 1, 1,
-0.5711505, -1.811775, -2.463964, 1, 1, 1, 1, 1,
-0.5699785, 0.0541455, -2.148619, 0, 0, 1, 1, 1,
-0.5696723, -1.765269, -2.986181, 1, 0, 0, 1, 1,
-0.5666348, 0.1628061, -1.201055, 1, 0, 0, 1, 1,
-0.5577524, 1.012223, 0.788782, 1, 0, 0, 1, 1,
-0.5537779, 0.3120802, -0.463504, 1, 0, 0, 1, 1,
-0.5512246, -0.7089529, -1.790036, 1, 0, 0, 1, 1,
-0.5504326, 1.391288, -0.8688937, 0, 0, 0, 1, 1,
-0.549443, 0.1557408, -0.8083655, 0, 0, 0, 1, 1,
-0.5479507, -1.373761, -3.368303, 0, 0, 0, 1, 1,
-0.5467625, -2.311568, -1.756362, 0, 0, 0, 1, 1,
-0.5416856, 0.02755812, -1.783405, 0, 0, 0, 1, 1,
-0.5414805, 0.4446371, -1.557218, 0, 0, 0, 1, 1,
-0.5404491, -0.9423319, -1.893272, 0, 0, 0, 1, 1,
-0.5394335, -0.4160551, -2.349989, 1, 1, 1, 1, 1,
-0.5384058, 0.9968269, -0.4325407, 1, 1, 1, 1, 1,
-0.535486, 0.2567407, -3.076651, 1, 1, 1, 1, 1,
-0.5336195, -0.4974356, -4.352091, 1, 1, 1, 1, 1,
-0.5326244, 0.002818105, -1.991328, 1, 1, 1, 1, 1,
-0.5307697, 1.074406, -0.1321376, 1, 1, 1, 1, 1,
-0.5285219, 0.04940362, -1.422918, 1, 1, 1, 1, 1,
-0.5257691, 0.3788628, -1.246532, 1, 1, 1, 1, 1,
-0.5256231, 1.178452, -0.8651502, 1, 1, 1, 1, 1,
-0.5176066, 0.08348262, -0.6094674, 1, 1, 1, 1, 1,
-0.5161019, 1.607008, -0.3081501, 1, 1, 1, 1, 1,
-0.5078447, 0.09821857, -2.101347, 1, 1, 1, 1, 1,
-0.5048554, -0.7097742, -3.092632, 1, 1, 1, 1, 1,
-0.5048255, -0.3611358, -1.577417, 1, 1, 1, 1, 1,
-0.5036715, 1.11192, 0.8459545, 1, 1, 1, 1, 1,
-0.503444, 0.4314374, 0.4022149, 0, 0, 1, 1, 1,
-0.5016717, -0.5586267, -1.200923, 1, 0, 0, 1, 1,
-0.5013637, -0.4536164, -1.448864, 1, 0, 0, 1, 1,
-0.4968629, 0.2044597, -3.625423, 1, 0, 0, 1, 1,
-0.4955638, -0.5608599, -3.473863, 1, 0, 0, 1, 1,
-0.4947901, -0.03848858, -1.755017, 1, 0, 0, 1, 1,
-0.4869674, -0.1356264, -2.923758, 0, 0, 0, 1, 1,
-0.4830331, 0.7115473, -0.6383326, 0, 0, 0, 1, 1,
-0.481507, -1.857325, -3.168061, 0, 0, 0, 1, 1,
-0.4773191, 1.831274, -0.5931429, 0, 0, 0, 1, 1,
-0.4763114, 0.145345, -3.286219, 0, 0, 0, 1, 1,
-0.4753588, -0.54323, -3.111421, 0, 0, 0, 1, 1,
-0.4748922, 1.476275, -0.1410893, 0, 0, 0, 1, 1,
-0.4729983, -1.436313, -3.036474, 1, 1, 1, 1, 1,
-0.4707147, 0.4596065, -1.936396, 1, 1, 1, 1, 1,
-0.4669963, 0.3978875, 0.04790593, 1, 1, 1, 1, 1,
-0.4665998, 0.8101069, -1.043759, 1, 1, 1, 1, 1,
-0.4612534, -0.3088254, -2.728642, 1, 1, 1, 1, 1,
-0.4577452, 0.04137501, -2.729383, 1, 1, 1, 1, 1,
-0.4570661, -0.464951, -0.8761875, 1, 1, 1, 1, 1,
-0.4542798, 1.855235, -1.890007, 1, 1, 1, 1, 1,
-0.4479743, 0.7206629, -1.794027, 1, 1, 1, 1, 1,
-0.4460869, -0.4442324, -2.600038, 1, 1, 1, 1, 1,
-0.4455965, -0.9343251, -1.899083, 1, 1, 1, 1, 1,
-0.4454617, 2.67751, -0.4129086, 1, 1, 1, 1, 1,
-0.4416038, 1.913337, -0.4564215, 1, 1, 1, 1, 1,
-0.4394525, -0.992726, -1.952648, 1, 1, 1, 1, 1,
-0.43859, 1.66447, -2.11115, 1, 1, 1, 1, 1,
-0.4366941, 0.2941862, -1.95931, 0, 0, 1, 1, 1,
-0.4339702, -0.4428796, -2.540405, 1, 0, 0, 1, 1,
-0.4318194, 0.8418362, -1.465834, 1, 0, 0, 1, 1,
-0.431488, 0.08805523, -2.057285, 1, 0, 0, 1, 1,
-0.4298993, 0.7895774, -0.4298435, 1, 0, 0, 1, 1,
-0.4293894, 0.2469313, -0.1335675, 1, 0, 0, 1, 1,
-0.4274992, -0.1599745, -3.860127, 0, 0, 0, 1, 1,
-0.4273651, -0.8453929, -3.547394, 0, 0, 0, 1, 1,
-0.4271928, 0.482978, -1.360828, 0, 0, 0, 1, 1,
-0.4259963, -0.7497239, -2.208609, 0, 0, 0, 1, 1,
-0.415888, 0.1503841, -1.246925, 0, 0, 0, 1, 1,
-0.4148913, -0.2040533, -1.602446, 0, 0, 0, 1, 1,
-0.4142778, -1.649943, -1.710178, 0, 0, 0, 1, 1,
-0.4108487, 0.4669458, -0.1223711, 1, 1, 1, 1, 1,
-0.4076279, 0.5525361, 1.015231, 1, 1, 1, 1, 1,
-0.4040304, -0.1113654, 0.139587, 1, 1, 1, 1, 1,
-0.4033968, 0.9617437, -0.3577234, 1, 1, 1, 1, 1,
-0.4033189, -0.9591463, -2.44995, 1, 1, 1, 1, 1,
-0.4029194, -0.4351968, -3.113751, 1, 1, 1, 1, 1,
-0.3941626, 0.06331363, -2.793885, 1, 1, 1, 1, 1,
-0.3909156, -0.3945363, -3.413465, 1, 1, 1, 1, 1,
-0.3904746, 1.228767, -0.6924222, 1, 1, 1, 1, 1,
-0.3901255, -0.324993, -0.5613472, 1, 1, 1, 1, 1,
-0.3877755, -1.975458, -3.949165, 1, 1, 1, 1, 1,
-0.3870257, 1.685193, -0.4710946, 1, 1, 1, 1, 1,
-0.3870117, -0.8803691, -2.3753, 1, 1, 1, 1, 1,
-0.3824196, 0.9495724, 0.7987269, 1, 1, 1, 1, 1,
-0.3818221, -0.02122743, 0.383477, 1, 1, 1, 1, 1,
-0.380787, 0.6578313, 0.2898122, 0, 0, 1, 1, 1,
-0.3793715, -2.508808, -3.086951, 1, 0, 0, 1, 1,
-0.377038, 0.4451942, -1.190114, 1, 0, 0, 1, 1,
-0.3753323, -0.9888249, -1.094763, 1, 0, 0, 1, 1,
-0.3740401, -0.02044825, -0.9783569, 1, 0, 0, 1, 1,
-0.3739666, -0.1451501, -0.8101004, 1, 0, 0, 1, 1,
-0.3706994, -0.3203819, -0.9733752, 0, 0, 0, 1, 1,
-0.3652542, 0.9883737, -0.1134158, 0, 0, 0, 1, 1,
-0.3638654, 0.9732821, -0.03515217, 0, 0, 0, 1, 1,
-0.3631717, -1.067273, -2.00056, 0, 0, 0, 1, 1,
-0.361775, 0.5118529, -0.2351804, 0, 0, 0, 1, 1,
-0.3612908, -0.4322749, -3.975127, 0, 0, 0, 1, 1,
-0.3569217, 1.029017, -1.48599, 0, 0, 0, 1, 1,
-0.3547111, -0.6328071, -4.048655, 1, 1, 1, 1, 1,
-0.3483455, 0.1243972, 0.05725278, 1, 1, 1, 1, 1,
-0.3479875, -1.778609, -2.622982, 1, 1, 1, 1, 1,
-0.3477853, -1.235266, -1.530927, 1, 1, 1, 1, 1,
-0.3459425, 0.535179, 0.5883791, 1, 1, 1, 1, 1,
-0.3392881, -2.438844, -2.386556, 1, 1, 1, 1, 1,
-0.3350301, -1.601023, -4.174234, 1, 1, 1, 1, 1,
-0.3340589, -0.860812, -2.584846, 1, 1, 1, 1, 1,
-0.3334899, 1.782471, -0.301499, 1, 1, 1, 1, 1,
-0.3320498, -1.507277, -2.064486, 1, 1, 1, 1, 1,
-0.3312542, -0.6041067, -2.231589, 1, 1, 1, 1, 1,
-0.3307646, -1.785805, -3.113487, 1, 1, 1, 1, 1,
-0.3307087, 0.600588, -0.8089316, 1, 1, 1, 1, 1,
-0.3228667, 2.461291, 0.1319132, 1, 1, 1, 1, 1,
-0.3191177, -0.4381442, -4.018555, 1, 1, 1, 1, 1,
-0.3166523, 0.2923203, -1.324798, 0, 0, 1, 1, 1,
-0.3099073, -1.625611, -3.526256, 1, 0, 0, 1, 1,
-0.3093893, -0.5018185, -2.552746, 1, 0, 0, 1, 1,
-0.304879, -0.9475448, -2.879476, 1, 0, 0, 1, 1,
-0.3035325, 0.6754121, 0.138048, 1, 0, 0, 1, 1,
-0.3003695, -1.494998, -3.328425, 1, 0, 0, 1, 1,
-0.2994778, 0.7285612, 1.02836, 0, 0, 0, 1, 1,
-0.2937802, 0.4755661, -2.386334, 0, 0, 0, 1, 1,
-0.2917772, -0.8863338, -1.9325, 0, 0, 0, 1, 1,
-0.2910658, -1.074637, -2.383382, 0, 0, 0, 1, 1,
-0.2880986, 1.074179, -1.3435, 0, 0, 0, 1, 1,
-0.282701, 2.085958, -0.89395, 0, 0, 0, 1, 1,
-0.278988, -0.2960093, -4.544432, 0, 0, 0, 1, 1,
-0.2743533, -0.1006832, -1.748542, 1, 1, 1, 1, 1,
-0.2682118, 0.7346021, 0.0647341, 1, 1, 1, 1, 1,
-0.2653668, 1.590662, 0.9656611, 1, 1, 1, 1, 1,
-0.2598206, -0.3336357, -4.337834, 1, 1, 1, 1, 1,
-0.2551583, -0.9554513, -1.875263, 1, 1, 1, 1, 1,
-0.2491927, -0.308618, -2.168989, 1, 1, 1, 1, 1,
-0.2487219, 0.9111902, 1.412022, 1, 1, 1, 1, 1,
-0.2463104, 0.05938273, -0.5080612, 1, 1, 1, 1, 1,
-0.2431522, 1.382065, -0.2447761, 1, 1, 1, 1, 1,
-0.2431435, -1.54864, -2.549842, 1, 1, 1, 1, 1,
-0.2406024, 0.8045431, -0.7012265, 1, 1, 1, 1, 1,
-0.2373445, 0.167743, -0.9442259, 1, 1, 1, 1, 1,
-0.2351871, 0.9442192, 1.583911, 1, 1, 1, 1, 1,
-0.2298844, -0.9666895, -1.259949, 1, 1, 1, 1, 1,
-0.2286633, -0.3976011, -2.092948, 1, 1, 1, 1, 1,
-0.2259539, -0.6702495, -2.611602, 0, 0, 1, 1, 1,
-0.2226142, 1.654928, 0.555778, 1, 0, 0, 1, 1,
-0.221612, -2.06073, -4.417273, 1, 0, 0, 1, 1,
-0.2189565, -2.052978, -1.97612, 1, 0, 0, 1, 1,
-0.2136068, -0.2916614, -1.590104, 1, 0, 0, 1, 1,
-0.2133692, 0.5892653, 0.5532079, 1, 0, 0, 1, 1,
-0.2114095, 2.006899, -1.429568, 0, 0, 0, 1, 1,
-0.2088515, 1.528965, -0.5083096, 0, 0, 0, 1, 1,
-0.1994546, 1.010095, -0.310574, 0, 0, 0, 1, 1,
-0.1975479, 0.7898901, 0.4659058, 0, 0, 0, 1, 1,
-0.196853, 0.9669898, -1.137636, 0, 0, 0, 1, 1,
-0.1930875, -0.006782136, -2.457069, 0, 0, 0, 1, 1,
-0.1914849, -0.4018807, -1.187381, 0, 0, 0, 1, 1,
-0.1776162, 1.438467, 1.028339, 1, 1, 1, 1, 1,
-0.1754515, 0.5161362, -1.367092, 1, 1, 1, 1, 1,
-0.1738189, -0.3792108, -2.40285, 1, 1, 1, 1, 1,
-0.1712356, 1.924409, -0.3229431, 1, 1, 1, 1, 1,
-0.1699223, 0.4143037, -0.8364881, 1, 1, 1, 1, 1,
-0.1677096, -0.9774826, -2.929482, 1, 1, 1, 1, 1,
-0.158572, 1.674218, 0.6468856, 1, 1, 1, 1, 1,
-0.15641, 1.746601, -0.1846801, 1, 1, 1, 1, 1,
-0.154795, 0.01707202, -0.656401, 1, 1, 1, 1, 1,
-0.1521203, -1.13908, -1.945209, 1, 1, 1, 1, 1,
-0.148412, -0.106006, -3.542636, 1, 1, 1, 1, 1,
-0.1478886, 1.342872, -1.277901, 1, 1, 1, 1, 1,
-0.1422127, -0.01846829, -1.204748, 1, 1, 1, 1, 1,
-0.1416853, 0.7760913, -1.667604, 1, 1, 1, 1, 1,
-0.1373131, -0.2356943, -3.014215, 1, 1, 1, 1, 1,
-0.1321566, -0.1945189, -3.326191, 0, 0, 1, 1, 1,
-0.1276505, 1.441564, 2.01857, 1, 0, 0, 1, 1,
-0.1268651, -0.820908, -2.506528, 1, 0, 0, 1, 1,
-0.1265582, -1.601689, -2.366366, 1, 0, 0, 1, 1,
-0.1253899, -1.774578, -2.461219, 1, 0, 0, 1, 1,
-0.124003, 0.8819301, -0.4899563, 1, 0, 0, 1, 1,
-0.1210708, 0.395402, 0.6316015, 0, 0, 0, 1, 1,
-0.1207621, -1.326863, -5.034325, 0, 0, 0, 1, 1,
-0.1149278, 1.415779, 2.214382, 0, 0, 0, 1, 1,
-0.1117164, -0.5537395, -3.094753, 0, 0, 0, 1, 1,
-0.1087397, 1.052187, -0.8759025, 0, 0, 0, 1, 1,
-0.1076973, 1.159047, 0.6715453, 0, 0, 0, 1, 1,
-0.105838, 0.2422269, 0.03687483, 0, 0, 0, 1, 1,
-0.09998516, 0.3030396, -0.6486633, 1, 1, 1, 1, 1,
-0.09767716, 0.5129554, -1.879089, 1, 1, 1, 1, 1,
-0.09254127, -1.433023, -3.11661, 1, 1, 1, 1, 1,
-0.09105131, -0.5830727, -1.673344, 1, 1, 1, 1, 1,
-0.09017434, -0.7233123, -3.282438, 1, 1, 1, 1, 1,
-0.08943117, -0.7193577, -2.772278, 1, 1, 1, 1, 1,
-0.0825961, -2.364996, -1.305737, 1, 1, 1, 1, 1,
-0.07790905, -0.915171, -0.8066081, 1, 1, 1, 1, 1,
-0.0778152, -0.06270915, -2.261966, 1, 1, 1, 1, 1,
-0.07756144, 0.1602426, -1.420264, 1, 1, 1, 1, 1,
-0.07743923, 0.4935681, -0.5068368, 1, 1, 1, 1, 1,
-0.07507924, 0.3408563, -0.8070906, 1, 1, 1, 1, 1,
-0.06966232, -0.1321267, -3.084516, 1, 1, 1, 1, 1,
-0.06965976, 1.047732, -1.718283, 1, 1, 1, 1, 1,
-0.05969213, -0.7021354, -3.747237, 1, 1, 1, 1, 1,
-0.04673509, -1.168126, -4.376691, 0, 0, 1, 1, 1,
-0.04543, -0.5534848, -4.323277, 1, 0, 0, 1, 1,
-0.04524769, 0.7745697, -1.399816, 1, 0, 0, 1, 1,
-0.04127674, 0.2870161, -0.2155984, 1, 0, 0, 1, 1,
-0.03918114, -0.891898, -2.597002, 1, 0, 0, 1, 1,
-0.03791672, 0.1790869, 0.7809832, 1, 0, 0, 1, 1,
-0.0333992, 1.154759, 0.8121758, 0, 0, 0, 1, 1,
-0.03129652, -1.076704, -2.549709, 0, 0, 0, 1, 1,
-0.02608184, 0.1104914, 0.614742, 0, 0, 0, 1, 1,
-0.0259841, 0.2512491, -1.454376, 0, 0, 0, 1, 1,
-0.02343685, 0.1099444, -1.117176, 0, 0, 0, 1, 1,
-0.02231834, -0.6772141, -2.398737, 0, 0, 0, 1, 1,
-0.02222187, -0.5622429, -1.781534, 0, 0, 0, 1, 1,
-0.02129124, 0.03651102, 0.6192256, 1, 1, 1, 1, 1,
-0.01545527, -0.6631326, -3.039312, 1, 1, 1, 1, 1,
-0.01186991, 0.4452365, -1.588328, 1, 1, 1, 1, 1,
-0.005547266, -0.2452306, -3.184942, 1, 1, 1, 1, 1,
-0.004195089, 0.5576999, 0.5278965, 1, 1, 1, 1, 1,
-0.0004816746, 2.216796, 0.3696586, 1, 1, 1, 1, 1,
0.003169988, 0.8608062, 1.247489, 1, 1, 1, 1, 1,
0.006539456, 0.9063455, 1.012819, 1, 1, 1, 1, 1,
0.008985791, -0.6702921, 2.002542, 1, 1, 1, 1, 1,
0.01040923, -1.150455, 1.586003, 1, 1, 1, 1, 1,
0.01547324, -0.581717, 3.099795, 1, 1, 1, 1, 1,
0.02198849, 0.1555254, -0.2888543, 1, 1, 1, 1, 1,
0.0220722, -0.03922517, 2.38174, 1, 1, 1, 1, 1,
0.02207593, -0.4297403, 2.814305, 1, 1, 1, 1, 1,
0.02374389, 0.6480664, 1.431152, 1, 1, 1, 1, 1,
0.0247477, 1.972203, 0.1048763, 0, 0, 1, 1, 1,
0.02512392, 1.396528, -0.7952459, 1, 0, 0, 1, 1,
0.02762353, -0.6150922, 3.956083, 1, 0, 0, 1, 1,
0.03587528, 0.5541279, 0.8985682, 1, 0, 0, 1, 1,
0.03644885, -0.1969733, 2.982256, 1, 0, 0, 1, 1,
0.0370244, -1.244069, 3.667825, 1, 0, 0, 1, 1,
0.03731592, 0.4337709, -1.185964, 0, 0, 0, 1, 1,
0.03949839, 0.1846227, 0.8069664, 0, 0, 0, 1, 1,
0.04025911, -1.491229, 4.039367, 0, 0, 0, 1, 1,
0.04191867, -1.237682, 2.72652, 0, 0, 0, 1, 1,
0.04660345, 0.5570116, 0.5488774, 0, 0, 0, 1, 1,
0.04726081, -0.5590479, 1.958099, 0, 0, 0, 1, 1,
0.04967734, -0.6973982, 4.548265, 0, 0, 0, 1, 1,
0.05508771, 0.3602102, -0.09808669, 1, 1, 1, 1, 1,
0.05678286, -0.8731844, 4.34128, 1, 1, 1, 1, 1,
0.05841624, -0.8046429, 5.191149, 1, 1, 1, 1, 1,
0.05951952, 1.203017, 1.550347, 1, 1, 1, 1, 1,
0.06269512, 0.4055545, 0.857495, 1, 1, 1, 1, 1,
0.06322028, -0.1757407, 2.396266, 1, 1, 1, 1, 1,
0.06340425, -0.1092305, 2.75736, 1, 1, 1, 1, 1,
0.07036237, -1.67722, 3.143603, 1, 1, 1, 1, 1,
0.07307108, 1.181493, -1.266244, 1, 1, 1, 1, 1,
0.07370586, -1.802248, 3.512139, 1, 1, 1, 1, 1,
0.07483646, 0.4725411, 0.3351224, 1, 1, 1, 1, 1,
0.07501408, -1.110947, 3.16672, 1, 1, 1, 1, 1,
0.0838856, 0.7826339, -0.2387397, 1, 1, 1, 1, 1,
0.08444354, -1.462248, 2.927412, 1, 1, 1, 1, 1,
0.08993769, -0.09177849, 3.579675, 1, 1, 1, 1, 1,
0.09028178, 0.8541763, 0.2909319, 0, 0, 1, 1, 1,
0.09219486, -0.6785626, 2.332212, 1, 0, 0, 1, 1,
0.09442574, 0.1763172, 0.2246123, 1, 0, 0, 1, 1,
0.09581544, 0.8780296, -0.4161745, 1, 0, 0, 1, 1,
0.09723111, -1.601256, 4.376382, 1, 0, 0, 1, 1,
0.09839593, 0.9180405, 0.4472849, 1, 0, 0, 1, 1,
0.09883607, 0.5748839, 1.15918, 0, 0, 0, 1, 1,
0.09957582, -0.2052576, 2.430571, 0, 0, 0, 1, 1,
0.1028392, -1.47647, 3.460057, 0, 0, 0, 1, 1,
0.1029579, 0.2125577, 3.437793, 0, 0, 0, 1, 1,
0.1062061, 1.337838, 0.7079189, 0, 0, 0, 1, 1,
0.1093342, -1.826427, 3.672781, 0, 0, 0, 1, 1,
0.1101591, -1.819274, 3.207734, 0, 0, 0, 1, 1,
0.1137544, 0.8990169, 0.6285622, 1, 1, 1, 1, 1,
0.1155722, 1.416847, 0.3824828, 1, 1, 1, 1, 1,
0.1206178, 2.051308, 0.5514938, 1, 1, 1, 1, 1,
0.1278048, 0.9079813, -0.5145667, 1, 1, 1, 1, 1,
0.1323173, -1.012996, 2.438403, 1, 1, 1, 1, 1,
0.1353473, -0.7589157, 2.976165, 1, 1, 1, 1, 1,
0.1430433, -0.2188723, 2.409972, 1, 1, 1, 1, 1,
0.1460105, 1.738392, 0.5627148, 1, 1, 1, 1, 1,
0.1467048, 0.4040563, 1.411198, 1, 1, 1, 1, 1,
0.1475273, 1.168876, 0.076491, 1, 1, 1, 1, 1,
0.1589943, -0.3955414, 2.431735, 1, 1, 1, 1, 1,
0.1602503, 0.581851, 0.9641052, 1, 1, 1, 1, 1,
0.1606794, 1.822364, -1.322697, 1, 1, 1, 1, 1,
0.1659972, 0.8236654, 0.7768132, 1, 1, 1, 1, 1,
0.166748, -0.5206661, 2.602286, 1, 1, 1, 1, 1,
0.1694, 0.4281425, 0.07433989, 0, 0, 1, 1, 1,
0.1704866, -0.4517223, 4.291263, 1, 0, 0, 1, 1,
0.1748083, -0.4189406, 3.611746, 1, 0, 0, 1, 1,
0.1748089, 0.9990534, -0.6104761, 1, 0, 0, 1, 1,
0.1752137, -1.515476, 4.471812, 1, 0, 0, 1, 1,
0.1777486, -0.291911, 3.97644, 1, 0, 0, 1, 1,
0.1819363, -0.7173938, 3.463707, 0, 0, 0, 1, 1,
0.1824986, -0.03810982, 1.259748, 0, 0, 0, 1, 1,
0.1853163, 0.4653415, 0.5486975, 0, 0, 0, 1, 1,
0.1874778, -0.7476664, 1.751493, 0, 0, 0, 1, 1,
0.1941161, -0.8770219, 3.505403, 0, 0, 0, 1, 1,
0.1960037, -0.1017193, 2.636901, 0, 0, 0, 1, 1,
0.1990804, -0.7126074, 3.023058, 0, 0, 0, 1, 1,
0.2015459, 1.493857, 2.129568, 1, 1, 1, 1, 1,
0.2024679, 0.3267881, 0.1087015, 1, 1, 1, 1, 1,
0.2026813, -0.7946743, 4.748396, 1, 1, 1, 1, 1,
0.2037132, 0.5878679, 2.07616, 1, 1, 1, 1, 1,
0.2048045, -1.030383, 1.46058, 1, 1, 1, 1, 1,
0.2055196, -0.6528565, 2.333824, 1, 1, 1, 1, 1,
0.2058401, -0.7881314, 2.991655, 1, 1, 1, 1, 1,
0.2063297, -0.4609529, 3.658445, 1, 1, 1, 1, 1,
0.2068578, -1.723142, 4.827255, 1, 1, 1, 1, 1,
0.2113923, -2.522883, 1.905131, 1, 1, 1, 1, 1,
0.2210939, -0.664663, 2.454654, 1, 1, 1, 1, 1,
0.2280308, -0.2077126, 3.30597, 1, 1, 1, 1, 1,
0.2284059, 1.423455, -0.5290537, 1, 1, 1, 1, 1,
0.2287284, -0.3817478, 2.454784, 1, 1, 1, 1, 1,
0.2307956, 0.4386785, 0.421816, 1, 1, 1, 1, 1,
0.2313589, 0.1981205, 0.928201, 0, 0, 1, 1, 1,
0.2327618, -0.5249208, 1.471774, 1, 0, 0, 1, 1,
0.2330998, -0.05775991, 0.4948014, 1, 0, 0, 1, 1,
0.2371439, -1.074602, 3.326141, 1, 0, 0, 1, 1,
0.2415815, -0.6596065, 1.186036, 1, 0, 0, 1, 1,
0.2418507, -1.318819, 2.904385, 1, 0, 0, 1, 1,
0.2419217, -1.256814, 2.045262, 0, 0, 0, 1, 1,
0.2426469, 1.342406, 1.192978, 0, 0, 0, 1, 1,
0.2428713, -0.9248161, 3.114726, 0, 0, 0, 1, 1,
0.2443916, -0.2389685, 4.330873, 0, 0, 0, 1, 1,
0.245144, 1.666292, -0.1071791, 0, 0, 0, 1, 1,
0.248066, -0.1572223, 1.133921, 0, 0, 0, 1, 1,
0.2545345, 1.100448, -0.4549247, 0, 0, 0, 1, 1,
0.2553071, 0.6152791, -2.201296, 1, 1, 1, 1, 1,
0.2561576, -0.07935112, 1.799667, 1, 1, 1, 1, 1,
0.2632997, 0.8301541, -0.6288528, 1, 1, 1, 1, 1,
0.270853, 0.3617511, -0.06999673, 1, 1, 1, 1, 1,
0.2712731, 0.4320536, 2.351762, 1, 1, 1, 1, 1,
0.2735958, -0.6325712, 2.201286, 1, 1, 1, 1, 1,
0.2750707, 0.5860918, 0.3725496, 1, 1, 1, 1, 1,
0.2759047, -0.7317297, 2.383129, 1, 1, 1, 1, 1,
0.2763796, -0.5783111, 2.754109, 1, 1, 1, 1, 1,
0.2804832, 0.4985377, -1.903003, 1, 1, 1, 1, 1,
0.2832651, 1.139389, 1.238951, 1, 1, 1, 1, 1,
0.2866375, -1.697506, 2.248855, 1, 1, 1, 1, 1,
0.2890026, -0.9580785, 2.014889, 1, 1, 1, 1, 1,
0.29074, -0.09123337, 1.547761, 1, 1, 1, 1, 1,
0.2929624, -0.525969, 4.047296, 1, 1, 1, 1, 1,
0.297957, 0.5556927, -0.06928787, 0, 0, 1, 1, 1,
0.3045774, -1.637828, 4.276946, 1, 0, 0, 1, 1,
0.3053831, -2.620715, 2.563658, 1, 0, 0, 1, 1,
0.3075858, 0.2239096, -1.288982, 1, 0, 0, 1, 1,
0.309862, 1.119101, 0.02718647, 1, 0, 0, 1, 1,
0.318344, 0.6792799, -0.9833489, 1, 0, 0, 1, 1,
0.3200358, -0.5118631, 2.139399, 0, 0, 0, 1, 1,
0.3279246, 1.449942, 1.541118, 0, 0, 0, 1, 1,
0.3284276, 0.6018108, 0.6741481, 0, 0, 0, 1, 1,
0.3334119, -2.254872, 2.028009, 0, 0, 0, 1, 1,
0.3334221, -0.5205384, 2.383919, 0, 0, 0, 1, 1,
0.333424, -0.4927341, 2.773113, 0, 0, 0, 1, 1,
0.335131, 0.2460712, -0.9065528, 0, 0, 0, 1, 1,
0.3377183, -0.02914467, 1.234263, 1, 1, 1, 1, 1,
0.3399945, 0.6019093, 1.986005, 1, 1, 1, 1, 1,
0.3408957, -1.466065, 3.697119, 1, 1, 1, 1, 1,
0.3415926, -0.1637094, 0.6931204, 1, 1, 1, 1, 1,
0.3445146, -1.247342, 3.239849, 1, 1, 1, 1, 1,
0.3466757, -0.947728, 2.677236, 1, 1, 1, 1, 1,
0.3476482, -1.610063, 3.572839, 1, 1, 1, 1, 1,
0.349509, 0.4305319, -0.5182651, 1, 1, 1, 1, 1,
0.3498906, -0.1792526, 3.955034, 1, 1, 1, 1, 1,
0.3505913, -1.573628, 1.607261, 1, 1, 1, 1, 1,
0.3524681, 0.4054062, -0.5635775, 1, 1, 1, 1, 1,
0.3556394, 0.7709432, 1.048641, 1, 1, 1, 1, 1,
0.3575302, -0.304849, 2.316287, 1, 1, 1, 1, 1,
0.373319, 0.3935618, 1.299883, 1, 1, 1, 1, 1,
0.374573, 1.152999, 1.20777, 1, 1, 1, 1, 1,
0.3770193, -0.6705939, 3.147298, 0, 0, 1, 1, 1,
0.3818744, -0.04678122, -0.04092883, 1, 0, 0, 1, 1,
0.3830339, 0.3799883, 1.944567, 1, 0, 0, 1, 1,
0.3871835, 0.9845296, 0.7428244, 1, 0, 0, 1, 1,
0.3872309, 1.112026, -0.02528982, 1, 0, 0, 1, 1,
0.3877182, 0.3409541, 0.1141426, 1, 0, 0, 1, 1,
0.3889037, 1.101887, -1.679049, 0, 0, 0, 1, 1,
0.3898923, -0.08377264, 0.9206002, 0, 0, 0, 1, 1,
0.3922518, 0.01128581, 0.7132063, 0, 0, 0, 1, 1,
0.3941716, 0.3461956, 0.3400288, 0, 0, 0, 1, 1,
0.3949349, -0.5398995, 3.112539, 0, 0, 0, 1, 1,
0.3968319, 0.3916485, 2.868048, 0, 0, 0, 1, 1,
0.3991344, -0.6482862, 2.35228, 0, 0, 0, 1, 1,
0.4039966, -0.5537693, 3.846799, 1, 1, 1, 1, 1,
0.4122626, -0.3010361, 1.213286, 1, 1, 1, 1, 1,
0.41284, -1.315855, 0.6334689, 1, 1, 1, 1, 1,
0.4152765, 1.311515, 0.6475032, 1, 1, 1, 1, 1,
0.4178651, -0.4549996, 2.769074, 1, 1, 1, 1, 1,
0.419879, -2.493275, 2.081657, 1, 1, 1, 1, 1,
0.4236723, -0.9163715, 2.87226, 1, 1, 1, 1, 1,
0.4266283, 0.05599888, 1.42363, 1, 1, 1, 1, 1,
0.4275392, -0.3995637, 1.198405, 1, 1, 1, 1, 1,
0.4296578, 1.987609, 1.827234, 1, 1, 1, 1, 1,
0.4306883, 0.1787135, -0.2281174, 1, 1, 1, 1, 1,
0.4363233, 0.4819657, -0.3031362, 1, 1, 1, 1, 1,
0.4379601, -0.3394454, 2.349041, 1, 1, 1, 1, 1,
0.4427626, -1.788518, 2.798283, 1, 1, 1, 1, 1,
0.445976, -0.5973073, 1.837335, 1, 1, 1, 1, 1,
0.4462894, -0.3918032, 0.6774508, 0, 0, 1, 1, 1,
0.4486054, -0.132077, 3.096875, 1, 0, 0, 1, 1,
0.4494394, -0.9061496, 2.755977, 1, 0, 0, 1, 1,
0.456154, 0.522779, 0.9641577, 1, 0, 0, 1, 1,
0.4696088, -0.4569661, 3.229755, 1, 0, 0, 1, 1,
0.4720088, -0.6345521, 3.232858, 1, 0, 0, 1, 1,
0.4730456, 1.910204, 1.058721, 0, 0, 0, 1, 1,
0.4765735, -1.257776, 4.528893, 0, 0, 0, 1, 1,
0.4776389, 0.5617828, 0.140409, 0, 0, 0, 1, 1,
0.4777142, -1.111105, 3.742839, 0, 0, 0, 1, 1,
0.4783559, 0.902374, 0.8990491, 0, 0, 0, 1, 1,
0.4793687, -0.8473142, 1.988725, 0, 0, 0, 1, 1,
0.4842704, 0.3108838, 2.326687, 0, 0, 0, 1, 1,
0.4844809, 1.74706, 0.04112752, 1, 1, 1, 1, 1,
0.4846891, 1.106138, -0.8404231, 1, 1, 1, 1, 1,
0.4860132, 1.510151, 0.2174032, 1, 1, 1, 1, 1,
0.4899375, -1.370359, 2.639761, 1, 1, 1, 1, 1,
0.4903494, 0.7487009, 1.190425, 1, 1, 1, 1, 1,
0.4955657, 0.9476482, -0.8728319, 1, 1, 1, 1, 1,
0.5006994, 0.2080573, 1.9791, 1, 1, 1, 1, 1,
0.5009254, 0.3762393, -0.0668108, 1, 1, 1, 1, 1,
0.5089857, -1.415661, 3.1064, 1, 1, 1, 1, 1,
0.5109926, -0.8125856, 1.682568, 1, 1, 1, 1, 1,
0.5120706, 0.3185088, 0.1549927, 1, 1, 1, 1, 1,
0.5139868, -0.3170536, 0.1686987, 1, 1, 1, 1, 1,
0.5152355, -0.2841772, 1.801209, 1, 1, 1, 1, 1,
0.5156482, -0.4473145, 2.040772, 1, 1, 1, 1, 1,
0.5170045, 0.08874413, 0.3930661, 1, 1, 1, 1, 1,
0.5314057, 1.324607, -1.089056, 0, 0, 1, 1, 1,
0.5337946, -0.868874, 1.950948, 1, 0, 0, 1, 1,
0.5350834, 0.2072246, -0.2466543, 1, 0, 0, 1, 1,
0.5365489, 0.05752255, 0.8207399, 1, 0, 0, 1, 1,
0.539966, -0.833648, 2.156072, 1, 0, 0, 1, 1,
0.5471815, 0.1022271, 1.514264, 1, 0, 0, 1, 1,
0.5478415, 0.5046485, 2.888719, 0, 0, 0, 1, 1,
0.5494335, 0.3568817, 1.070072, 0, 0, 0, 1, 1,
0.5530838, -0.9857805, 2.746347, 0, 0, 0, 1, 1,
0.5576562, 1.271813, 0.3962794, 0, 0, 0, 1, 1,
0.5592219, -0.3599733, 2.049289, 0, 0, 0, 1, 1,
0.5616356, 0.6593217, 1.689582, 0, 0, 0, 1, 1,
0.5630303, 1.569258, 0.9652163, 0, 0, 0, 1, 1,
0.5631326, -2.139842, 2.061973, 1, 1, 1, 1, 1,
0.5648791, -0.7625527, 1.260465, 1, 1, 1, 1, 1,
0.5683392, 0.3486309, 1.223387, 1, 1, 1, 1, 1,
0.5685156, -0.6557296, 3.799357, 1, 1, 1, 1, 1,
0.5694345, 1.682749, 0.9984175, 1, 1, 1, 1, 1,
0.5724882, -0.1579904, 1.457871, 1, 1, 1, 1, 1,
0.5761425, 0.580182, 1.960137, 1, 1, 1, 1, 1,
0.5778784, 0.4540357, 0.7006708, 1, 1, 1, 1, 1,
0.5783751, -1.345681, 3.186428, 1, 1, 1, 1, 1,
0.5826492, -0.8058997, 3.353386, 1, 1, 1, 1, 1,
0.585756, -0.6039295, 0.7165107, 1, 1, 1, 1, 1,
0.5912762, -1.187192, 2.066318, 1, 1, 1, 1, 1,
0.5917103, 1.56615, 3.326813, 1, 1, 1, 1, 1,
0.5946161, 0.2774333, 1.357002, 1, 1, 1, 1, 1,
0.5981871, -0.9172059, 2.006565, 1, 1, 1, 1, 1,
0.6092554, 0.08227145, 1.154399, 0, 0, 1, 1, 1,
0.6105651, 1.344469, 0.7754508, 1, 0, 0, 1, 1,
0.6105887, -0.6642281, 2.87344, 1, 0, 0, 1, 1,
0.6128628, 1.139807, 0.6633208, 1, 0, 0, 1, 1,
0.6162322, -0.5861128, 3.502197, 1, 0, 0, 1, 1,
0.6188484, -0.8058956, 3.386691, 1, 0, 0, 1, 1,
0.6238236, 0.8036692, 2.307359, 0, 0, 0, 1, 1,
0.6264925, -0.4081149, 2.459217, 0, 0, 0, 1, 1,
0.6273549, -0.2147048, 2.893381, 0, 0, 0, 1, 1,
0.6288968, -0.8442358, 1.856961, 0, 0, 0, 1, 1,
0.6324812, -1.998937, 2.023071, 0, 0, 0, 1, 1,
0.6333122, -0.05561849, 2.796016, 0, 0, 0, 1, 1,
0.6373215, 1.025168, 0.02200371, 0, 0, 0, 1, 1,
0.6452679, 0.5867641, 2.788414, 1, 1, 1, 1, 1,
0.6497418, -0.389405, 0.9248594, 1, 1, 1, 1, 1,
0.6575884, 0.191991, 0.4027777, 1, 1, 1, 1, 1,
0.6595209, 0.1706943, 0.6480698, 1, 1, 1, 1, 1,
0.6779137, 0.2109777, 1.800489, 1, 1, 1, 1, 1,
0.6797461, 1.648655, 2.424546, 1, 1, 1, 1, 1,
0.6818092, 2.28431, 0.7216555, 1, 1, 1, 1, 1,
0.6909317, 1.620589, -0.02971309, 1, 1, 1, 1, 1,
0.7021701, 0.2561961, 1.422068, 1, 1, 1, 1, 1,
0.7028155, -0.8409506, 2.198517, 1, 1, 1, 1, 1,
0.7081108, 0.3408689, 0.6890195, 1, 1, 1, 1, 1,
0.7121504, -0.151464, 2.019531, 1, 1, 1, 1, 1,
0.712486, 1.221998, -0.6433958, 1, 1, 1, 1, 1,
0.7169384, 0.497482, 1.175077, 1, 1, 1, 1, 1,
0.7174397, 1.43692, 0.01944559, 1, 1, 1, 1, 1,
0.7196882, 0.7595893, 1.11209, 0, 0, 1, 1, 1,
0.723583, 2.213091, -0.1042517, 1, 0, 0, 1, 1,
0.7259594, 0.4880089, -0.9719194, 1, 0, 0, 1, 1,
0.7337762, -0.03153757, 1.779877, 1, 0, 0, 1, 1,
0.7415138, 1.666214, 0.223418, 1, 0, 0, 1, 1,
0.7520928, -0.3256801, 0.1833523, 1, 0, 0, 1, 1,
0.7573652, 0.161981, 2.209501, 0, 0, 0, 1, 1,
0.7581592, 0.2764265, 2.177292, 0, 0, 0, 1, 1,
0.7598505, 0.7593623, 0.6873477, 0, 0, 0, 1, 1,
0.7607126, 1.213757, -0.4424605, 0, 0, 0, 1, 1,
0.770828, -1.177815, 1.521885, 0, 0, 0, 1, 1,
0.7717543, -3.425551, 3.762627, 0, 0, 0, 1, 1,
0.7729838, 0.05692522, 1.327207, 0, 0, 0, 1, 1,
0.7748485, 0.5468868, 0.4164128, 1, 1, 1, 1, 1,
0.7761407, 0.1669278, 1.910753, 1, 1, 1, 1, 1,
0.7769559, -0.6432366, 0.9291733, 1, 1, 1, 1, 1,
0.7881197, -0.9983468, 2.09884, 1, 1, 1, 1, 1,
0.7931042, -0.4425266, 2.562608, 1, 1, 1, 1, 1,
0.7962762, -1.235553, 3.375531, 1, 1, 1, 1, 1,
0.8002157, 0.4457288, 0.5632078, 1, 1, 1, 1, 1,
0.8108891, -1.483102, 2.087946, 1, 1, 1, 1, 1,
0.8126118, 0.2238013, 0.0330858, 1, 1, 1, 1, 1,
0.8126748, 0.2175241, 1.135457, 1, 1, 1, 1, 1,
0.8175793, -1.10607, 3.602893, 1, 1, 1, 1, 1,
0.8181046, 0.005035935, 1.635541, 1, 1, 1, 1, 1,
0.8185058, -0.1647373, 2.295077, 1, 1, 1, 1, 1,
0.8197508, 1.612256, 0.4952594, 1, 1, 1, 1, 1,
0.8214357, 0.6300701, 0.9662483, 1, 1, 1, 1, 1,
0.8230765, 1.950746, 0.4150203, 0, 0, 1, 1, 1,
0.8290811, -0.2099065, 2.696315, 1, 0, 0, 1, 1,
0.8298494, -0.1651844, 2.548216, 1, 0, 0, 1, 1,
0.8379108, 0.4045074, 1.393834, 1, 0, 0, 1, 1,
0.8422793, 0.3860551, 1.927067, 1, 0, 0, 1, 1,
0.8473689, -1.653046, 3.342246, 1, 0, 0, 1, 1,
0.8547949, -0.1590986, 2.013309, 0, 0, 0, 1, 1,
0.8549814, 1.622728, -0.05128397, 0, 0, 0, 1, 1,
0.856135, 1.588515, 1.027982, 0, 0, 0, 1, 1,
0.8565027, 0.9864044, 2.988704, 0, 0, 0, 1, 1,
0.8666529, 0.2787227, -0.6889867, 0, 0, 0, 1, 1,
0.8694844, -0.2294718, 2.62981, 0, 0, 0, 1, 1,
0.871047, -0.05376565, 0.7360364, 0, 0, 0, 1, 1,
0.8872171, 0.2734305, 2.992838, 1, 1, 1, 1, 1,
0.8886536, -0.3935745, 1.541233, 1, 1, 1, 1, 1,
0.8891534, -0.636802, 1.06834, 1, 1, 1, 1, 1,
0.8927265, 1.449442, 0.2787603, 1, 1, 1, 1, 1,
0.9000255, 0.9732257, 0.7837691, 1, 1, 1, 1, 1,
0.9020192, -0.6714199, 2.27623, 1, 1, 1, 1, 1,
0.9024777, -0.1212467, 2.909147, 1, 1, 1, 1, 1,
0.9027259, -0.5705141, 0.6493266, 1, 1, 1, 1, 1,
0.9031438, 0.529773, 1.522354, 1, 1, 1, 1, 1,
0.9038213, 0.6215827, 1.335768, 1, 1, 1, 1, 1,
0.9056644, -0.3102329, 1.574133, 1, 1, 1, 1, 1,
0.9113926, 0.4487506, -0.07970874, 1, 1, 1, 1, 1,
0.9137667, -1.433991, 1.919133, 1, 1, 1, 1, 1,
0.925835, 0.5941823, -0.4412291, 1, 1, 1, 1, 1,
0.9383078, -0.4500442, 3.063016, 1, 1, 1, 1, 1,
0.9422249, -2.124248, 2.499332, 0, 0, 1, 1, 1,
0.9450831, 1.367542, -1.703716, 1, 0, 0, 1, 1,
0.9637564, -0.2128921, 3.834806, 1, 0, 0, 1, 1,
0.9692838, 0.6904562, 0.2402699, 1, 0, 0, 1, 1,
0.9711288, 0.4176366, 1.686264, 1, 0, 0, 1, 1,
0.9725952, -0.01088521, 3.74346, 1, 0, 0, 1, 1,
0.9741368, 0.2039536, 1.955536, 0, 0, 0, 1, 1,
0.9832944, -0.65988, 1.755192, 0, 0, 0, 1, 1,
0.9861437, 0.6182272, 1.704903, 0, 0, 0, 1, 1,
0.9866785, 0.258923, 1.885192, 0, 0, 0, 1, 1,
0.9868622, -1.876101, 2.546639, 0, 0, 0, 1, 1,
0.9923362, -0.8457767, 2.254861, 0, 0, 0, 1, 1,
0.9928096, 1.612523, -0.8276788, 0, 0, 0, 1, 1,
0.9947586, -0.3851308, 0.8185509, 1, 1, 1, 1, 1,
1.010668, 0.2012303, 1.833808, 1, 1, 1, 1, 1,
1.011167, -0.6408315, 2.530704, 1, 1, 1, 1, 1,
1.014047, 0.6417089, 1.300358, 1, 1, 1, 1, 1,
1.018986, -0.7282963, 2.855818, 1, 1, 1, 1, 1,
1.019094, -0.6077409, 2.029785, 1, 1, 1, 1, 1,
1.022095, 0.3919678, -0.004961168, 1, 1, 1, 1, 1,
1.025253, -1.062302, 1.465469, 1, 1, 1, 1, 1,
1.026778, 0.5582266, 2.137583, 1, 1, 1, 1, 1,
1.031937, 2.134083, 1.072599, 1, 1, 1, 1, 1,
1.035036, 1.436856, 0.2585037, 1, 1, 1, 1, 1,
1.039021, 0.4346008, -1.084301, 1, 1, 1, 1, 1,
1.049975, 0.6715465, 0.8865212, 1, 1, 1, 1, 1,
1.071753, -0.3564002, 0.3019434, 1, 1, 1, 1, 1,
1.072334, -0.2479102, 2.267437, 1, 1, 1, 1, 1,
1.074948, -0.6115019, 1.628157, 0, 0, 1, 1, 1,
1.075392, 1.200563, 0.4577515, 1, 0, 0, 1, 1,
1.080466, -2.447103, 1.72625, 1, 0, 0, 1, 1,
1.081297, -2.104011, 2.157815, 1, 0, 0, 1, 1,
1.082395, 0.006217033, 1.89993, 1, 0, 0, 1, 1,
1.091785, 0.3041499, 2.639727, 1, 0, 0, 1, 1,
1.092327, -0.4688425, 2.472641, 0, 0, 0, 1, 1,
1.092717, 0.5058785, 0.6189122, 0, 0, 0, 1, 1,
1.095941, 0.1335005, 1.238458, 0, 0, 0, 1, 1,
1.09648, 0.154127, 0.7100597, 0, 0, 0, 1, 1,
1.097843, 0.6953499, -0.3449299, 0, 0, 0, 1, 1,
1.118375, -0.2797776, 3.337567, 0, 0, 0, 1, 1,
1.11991, -1.598902, 3.070709, 0, 0, 0, 1, 1,
1.122966, 0.4694149, 2.86016, 1, 1, 1, 1, 1,
1.136289, 2.415559, 1.756381, 1, 1, 1, 1, 1,
1.140378, -0.8132926, 1.419789, 1, 1, 1, 1, 1,
1.143123, 0.6138415, 3.347998, 1, 1, 1, 1, 1,
1.15141, 0.1967993, 2.147197, 1, 1, 1, 1, 1,
1.159063, -0.9186274, 4.848781, 1, 1, 1, 1, 1,
1.161361, 0.871941, 0.7253787, 1, 1, 1, 1, 1,
1.169553, -0.4033461, 2.132042, 1, 1, 1, 1, 1,
1.173187, 0.5748125, 1.472514, 1, 1, 1, 1, 1,
1.178366, -0.1056189, 2.715377, 1, 1, 1, 1, 1,
1.185079, -0.2155515, 2.555851, 1, 1, 1, 1, 1,
1.186217, -0.7020583, 2.788766, 1, 1, 1, 1, 1,
1.187132, -1.002388, 0.386142, 1, 1, 1, 1, 1,
1.19495, 1.488464, -0.8606935, 1, 1, 1, 1, 1,
1.195847, 0.9055898, 1.3749, 1, 1, 1, 1, 1,
1.196882, 0.3500566, 1.138899, 0, 0, 1, 1, 1,
1.197527, -0.6287806, 2.154375, 1, 0, 0, 1, 1,
1.198789, 0.4358742, 1.836589, 1, 0, 0, 1, 1,
1.198934, -0.1591904, 2.393549, 1, 0, 0, 1, 1,
1.204877, -0.08577565, 0.0412121, 1, 0, 0, 1, 1,
1.205786, 0.2297324, 1.773129, 1, 0, 0, 1, 1,
1.21199, -0.08514518, 1.41805, 0, 0, 0, 1, 1,
1.218243, 0.798731, 1.914601, 0, 0, 0, 1, 1,
1.218268, -0.1686034, 2.010229, 0, 0, 0, 1, 1,
1.240191, -0.4493533, 0.8073949, 0, 0, 0, 1, 1,
1.24092, 0.4917399, 1.850435, 0, 0, 0, 1, 1,
1.252757, 0.7438734, 0.9147372, 0, 0, 0, 1, 1,
1.260433, 0.2400647, 2.739427, 0, 0, 0, 1, 1,
1.268598, -1.535669, 3.832399, 1, 1, 1, 1, 1,
1.270187, 0.8462905, 1.236997, 1, 1, 1, 1, 1,
1.275546, 0.9357625, -0.507188, 1, 1, 1, 1, 1,
1.277949, 0.03530703, 0.6784691, 1, 1, 1, 1, 1,
1.280579, 1.005699, 1.01452, 1, 1, 1, 1, 1,
1.287782, 0.9911312, 0.6424392, 1, 1, 1, 1, 1,
1.292174, 0.4342692, 1.747724, 1, 1, 1, 1, 1,
1.292873, -0.7544897, 1.234588, 1, 1, 1, 1, 1,
1.296527, -1.416726, 3.013962, 1, 1, 1, 1, 1,
1.302462, 0.1505127, 2.51646, 1, 1, 1, 1, 1,
1.305101, -0.01831646, 1.027341, 1, 1, 1, 1, 1,
1.3114, -0.385896, 1.332878, 1, 1, 1, 1, 1,
1.31951, 2.14247, -0.1804943, 1, 1, 1, 1, 1,
1.321046, 0.6674128, 0.680527, 1, 1, 1, 1, 1,
1.322919, 0.9845963, 0.07949601, 1, 1, 1, 1, 1,
1.325461, 0.9807231, 2.368574, 0, 0, 1, 1, 1,
1.327588, 1.233442, 1.005052, 1, 0, 0, 1, 1,
1.330161, -1.690062, 5.323448, 1, 0, 0, 1, 1,
1.346606, 0.7283483, 1.659688, 1, 0, 0, 1, 1,
1.354085, 0.3461854, 0.2373191, 1, 0, 0, 1, 1,
1.361518, -0.8529639, 3.404645, 1, 0, 0, 1, 1,
1.36322, -0.1726032, 0.265221, 0, 0, 0, 1, 1,
1.366184, 0.6023901, 2.410392, 0, 0, 0, 1, 1,
1.367503, -0.2334542, 2.594037, 0, 0, 0, 1, 1,
1.385967, 1.230561, 0.4830288, 0, 0, 0, 1, 1,
1.402896, -0.1721259, 1.933429, 0, 0, 0, 1, 1,
1.410887, -0.9952229, 2.621638, 0, 0, 0, 1, 1,
1.415041, -0.9939534, 2.744431, 0, 0, 0, 1, 1,
1.432748, -0.7420146, 2.923949, 1, 1, 1, 1, 1,
1.440476, 0.6676528, 2.558808, 1, 1, 1, 1, 1,
1.450354, 0.2445645, 2.05976, 1, 1, 1, 1, 1,
1.451902, -0.3776077, 2.407239, 1, 1, 1, 1, 1,
1.461947, 0.3799676, 2.172517, 1, 1, 1, 1, 1,
1.482294, -1.864019, -0.4004672, 1, 1, 1, 1, 1,
1.514642, -1.817487, 3.594869, 1, 1, 1, 1, 1,
1.519785, -0.1496515, 1.298455, 1, 1, 1, 1, 1,
1.528287, -2.081063, 2.382744, 1, 1, 1, 1, 1,
1.529086, 0.4438166, 0.1586683, 1, 1, 1, 1, 1,
1.53636, -1.150567, 3.270547, 1, 1, 1, 1, 1,
1.551943, 1.379051, -0.3245117, 1, 1, 1, 1, 1,
1.560674, 1.465062, -1.23499, 1, 1, 1, 1, 1,
1.569598, -1.297954, 3.307827, 1, 1, 1, 1, 1,
1.584299, 0.4644938, -0.3206468, 1, 1, 1, 1, 1,
1.586265, 0.4014981, -0.5722891, 0, 0, 1, 1, 1,
1.58761, 1.350588, 0.7334558, 1, 0, 0, 1, 1,
1.591195, 1.057782, 1.809529, 1, 0, 0, 1, 1,
1.596286, -0.5969436, 1.833213, 1, 0, 0, 1, 1,
1.601075, 0.3845699, 1.281376, 1, 0, 0, 1, 1,
1.603866, -1.56398, 4.940012, 1, 0, 0, 1, 1,
1.609322, 0.4103939, 1.388637, 0, 0, 0, 1, 1,
1.617499, -0.9679926, 1.823599, 0, 0, 0, 1, 1,
1.620455, -0.5953255, 1.542863, 0, 0, 0, 1, 1,
1.630502, -1.687336, 2.625245, 0, 0, 0, 1, 1,
1.634813, 0.859239, 0.1374166, 0, 0, 0, 1, 1,
1.656181, 0.8415149, 1.827644, 0, 0, 0, 1, 1,
1.658194, 1.189749, 2.025076, 0, 0, 0, 1, 1,
1.661721, -0.5677428, 0.960171, 1, 1, 1, 1, 1,
1.665403, 0.2998938, -0.1376363, 1, 1, 1, 1, 1,
1.671152, 1.305506, 1.027575, 1, 1, 1, 1, 1,
1.681168, -0.3493607, 2.028375, 1, 1, 1, 1, 1,
1.683816, 0.4347186, 1.918501, 1, 1, 1, 1, 1,
1.695591, 0.9764358, 0.5366585, 1, 1, 1, 1, 1,
1.702058, 1.664657, 1.306662, 1, 1, 1, 1, 1,
1.723468, -0.5916133, 1.425109, 1, 1, 1, 1, 1,
1.730338, -0.03826974, -0.4793602, 1, 1, 1, 1, 1,
1.737557, -0.3845873, 1.982865, 1, 1, 1, 1, 1,
1.740585, 0.2864031, 2.202924, 1, 1, 1, 1, 1,
1.746431, 0.6156449, 0.896503, 1, 1, 1, 1, 1,
1.755161, -0.3042659, 0.6145503, 1, 1, 1, 1, 1,
1.771729, 1.391913, 0.442697, 1, 1, 1, 1, 1,
1.771752, -0.8800599, 1.275623, 1, 1, 1, 1, 1,
1.771796, -1.158937, 0.4677145, 0, 0, 1, 1, 1,
1.774126, -0.85454, 2.553751, 1, 0, 0, 1, 1,
1.799801, 0.8589822, 1.816334, 1, 0, 0, 1, 1,
1.804332, 2.072615, -0.7256853, 1, 0, 0, 1, 1,
1.812627, -0.2665707, 2.834204, 1, 0, 0, 1, 1,
1.815738, -0.9978859, 1.960076, 1, 0, 0, 1, 1,
1.824509, 0.3224356, 1.925068, 0, 0, 0, 1, 1,
1.843046, 1.563018, -1.085864, 0, 0, 0, 1, 1,
1.846855, 2.124455, 1.105292, 0, 0, 0, 1, 1,
1.858685, 1.193526, 0.006490866, 0, 0, 0, 1, 1,
1.868757, 1.043362, 0.9465445, 0, 0, 0, 1, 1,
1.88116, -0.8476133, 1.140266, 0, 0, 0, 1, 1,
1.891255, 2.219701, -0.5397695, 0, 0, 0, 1, 1,
1.897855, -1.430963, 2.920625, 1, 1, 1, 1, 1,
1.902066, -1.196188, 1.961408, 1, 1, 1, 1, 1,
1.916824, -1.967682, 1.910274, 1, 1, 1, 1, 1,
1.923088, -0.009127258, 1.187543, 1, 1, 1, 1, 1,
1.936528, -1.08744, 0.1163897, 1, 1, 1, 1, 1,
1.944246, -0.5692357, 3.55759, 1, 1, 1, 1, 1,
1.962946, 0.5455424, 0.359334, 1, 1, 1, 1, 1,
1.987355, -1.005184, 1.917621, 1, 1, 1, 1, 1,
2.001196, -0.5852909, 1.033187, 1, 1, 1, 1, 1,
2.014195, -1.298286, 2.562144, 1, 1, 1, 1, 1,
2.021018, 0.2939835, 0.5315617, 1, 1, 1, 1, 1,
2.031058, 0.5084972, 1.294657, 1, 1, 1, 1, 1,
2.043483, -0.5263035, 2.251025, 1, 1, 1, 1, 1,
2.061414, 0.5476599, 1.561347, 1, 1, 1, 1, 1,
2.067003, 0.2006876, 1.584894, 1, 1, 1, 1, 1,
2.070855, -0.1091079, 3.632564, 0, 0, 1, 1, 1,
2.075, 0.7855704, 3.546742, 1, 0, 0, 1, 1,
2.160751, -0.2163219, 0.2678132, 1, 0, 0, 1, 1,
2.16213, -0.5018742, 1.667383, 1, 0, 0, 1, 1,
2.1805, -0.7752671, 3.20136, 1, 0, 0, 1, 1,
2.204976, -1.963888, 2.045861, 1, 0, 0, 1, 1,
2.3068, 0.6198627, 2.517514, 0, 0, 0, 1, 1,
2.315148, -0.395462, 2.325064, 0, 0, 0, 1, 1,
2.320429, 0.9587927, 1.394936, 0, 0, 0, 1, 1,
2.325042, 1.002715, 0.5059783, 0, 0, 0, 1, 1,
2.34325, -0.6994457, 3.128695, 0, 0, 0, 1, 1,
2.353466, -0.7216256, 2.943055, 0, 0, 0, 1, 1,
2.408714, 1.686494, 1.725644, 0, 0, 0, 1, 1,
2.545871, -0.1011792, 1.203754, 1, 1, 1, 1, 1,
2.580019, 1.344929, 1.259985, 1, 1, 1, 1, 1,
2.586007, 0.5465657, 0.2597581, 1, 1, 1, 1, 1,
2.686048, -0.2172306, 1.239813, 1, 1, 1, 1, 1,
2.832569, 2.393381, 2.366899, 1, 1, 1, 1, 1,
2.893631, 1.073567, 1.032337, 1, 1, 1, 1, 1,
3.239697, 1.021383, 2.343385, 1, 1, 1, 1, 1
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
var radius = 9.723658;
var distance = 34.15394;
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
mvMatrix.translate( 0.1342881, 0.1243155, 0.04112101 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15394);
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
