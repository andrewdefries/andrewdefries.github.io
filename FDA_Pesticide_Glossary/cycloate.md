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
-2.986515, 2.419102, -0.6581233, 1, 0, 0, 1,
-2.752892, -1.114327, -1.251809, 1, 0.007843138, 0, 1,
-2.537806, 0.7114625, -0.7232596, 1, 0.01176471, 0, 1,
-2.514868, -0.285408, -0.9987409, 1, 0.01960784, 0, 1,
-2.474081, -1.650393, -1.485514, 1, 0.02352941, 0, 1,
-2.421581, 0.5417975, -1.617016, 1, 0.03137255, 0, 1,
-2.393824, -0.4647822, -1.049588, 1, 0.03529412, 0, 1,
-2.342267, -0.7221401, -0.809628, 1, 0.04313726, 0, 1,
-2.231566, 1.499014, 2.247397, 1, 0.04705882, 0, 1,
-2.231541, 0.4123086, -0.8773453, 1, 0.05490196, 0, 1,
-2.222305, -0.1604319, -0.4361723, 1, 0.05882353, 0, 1,
-2.204336, -0.8496521, -2.512367, 1, 0.06666667, 0, 1,
-2.165045, 0.7528262, -1.070062, 1, 0.07058824, 0, 1,
-2.16062, -0.2974293, -1.108051, 1, 0.07843138, 0, 1,
-2.156804, 1.529116, -0.3717607, 1, 0.08235294, 0, 1,
-2.127521, -0.9602751, -1.200755, 1, 0.09019608, 0, 1,
-2.092247, -0.677911, -2.633801, 1, 0.09411765, 0, 1,
-2.046371, -0.01867381, -1.5303, 1, 0.1019608, 0, 1,
-2.042819, -0.2516524, -0.8223737, 1, 0.1098039, 0, 1,
-2.014587, 0.8235424, 0.1593764, 1, 0.1137255, 0, 1,
-2.006562, -1.915859, -2.547851, 1, 0.1215686, 0, 1,
-1.985714, 2.064895, -1.945053, 1, 0.1254902, 0, 1,
-1.967907, -1.785191, -2.08621, 1, 0.1333333, 0, 1,
-1.953224, 1.904423, 0.1399689, 1, 0.1372549, 0, 1,
-1.945526, -0.01427671, -0.8127736, 1, 0.145098, 0, 1,
-1.936016, -0.5741681, -1.091984, 1, 0.1490196, 0, 1,
-1.925069, -0.3071703, -1.798692, 1, 0.1568628, 0, 1,
-1.911649, 0.9928241, -2.705355, 1, 0.1607843, 0, 1,
-1.899136, -2.187265, -0.7947687, 1, 0.1686275, 0, 1,
-1.877294, -2.724623, -2.000097, 1, 0.172549, 0, 1,
-1.866837, -0.3258736, -2.987115, 1, 0.1803922, 0, 1,
-1.860414, -0.9182082, -1.078289, 1, 0.1843137, 0, 1,
-1.853261, 1.46763, -1.38703, 1, 0.1921569, 0, 1,
-1.840843, 0.9019108, -1.28689, 1, 0.1960784, 0, 1,
-1.822131, 0.8120692, -2.135683, 1, 0.2039216, 0, 1,
-1.82078, 0.6427168, -1.157924, 1, 0.2117647, 0, 1,
-1.805586, -0.6024575, -1.063029, 1, 0.2156863, 0, 1,
-1.803432, 0.1817245, -3.056981, 1, 0.2235294, 0, 1,
-1.796914, 0.04783168, -1.135164, 1, 0.227451, 0, 1,
-1.795229, -0.03559554, -2.073013, 1, 0.2352941, 0, 1,
-1.763669, 0.8797878, -0.1285336, 1, 0.2392157, 0, 1,
-1.733472, 1.236217, -0.3438153, 1, 0.2470588, 0, 1,
-1.732351, -0.6854652, -2.87447, 1, 0.2509804, 0, 1,
-1.722166, -0.02591049, -2.209169, 1, 0.2588235, 0, 1,
-1.721351, -1.51279, -2.950142, 1, 0.2627451, 0, 1,
-1.69743, 2.517809, -0.4217513, 1, 0.2705882, 0, 1,
-1.695119, 1.361452, -1.260631, 1, 0.2745098, 0, 1,
-1.686611, -0.3100555, -2.267594, 1, 0.282353, 0, 1,
-1.670204, 2.690326, -0.1393725, 1, 0.2862745, 0, 1,
-1.635429, 1.126904, 1.528334, 1, 0.2941177, 0, 1,
-1.632053, 0.4724822, -1.265793, 1, 0.3019608, 0, 1,
-1.627824, -1.03283, -2.472643, 1, 0.3058824, 0, 1,
-1.624804, -0.6628067, -0.761767, 1, 0.3137255, 0, 1,
-1.622097, -1.49192, -2.924365, 1, 0.3176471, 0, 1,
-1.621567, -1.289685, -2.187486, 1, 0.3254902, 0, 1,
-1.620626, 2.421785, -1.091344, 1, 0.3294118, 0, 1,
-1.601282, -0.507974, -1.979078, 1, 0.3372549, 0, 1,
-1.592189, 0.5845923, -0.1595079, 1, 0.3411765, 0, 1,
-1.587991, -0.9454293, -1.19347, 1, 0.3490196, 0, 1,
-1.566268, 1.576313, -1.533703, 1, 0.3529412, 0, 1,
-1.554395, -0.3983386, -2.717502, 1, 0.3607843, 0, 1,
-1.533447, -0.9737438, -1.28407, 1, 0.3647059, 0, 1,
-1.530873, 0.1721182, -0.8007771, 1, 0.372549, 0, 1,
-1.527613, 0.869969, -0.3838868, 1, 0.3764706, 0, 1,
-1.51411, -1.077659, -2.357102, 1, 0.3843137, 0, 1,
-1.49872, -0.11683, -0.5337846, 1, 0.3882353, 0, 1,
-1.490731, 1.35789, -0.7698603, 1, 0.3960784, 0, 1,
-1.489729, -0.3962833, -1.067692, 1, 0.4039216, 0, 1,
-1.477633, -0.6225899, -3.607683, 1, 0.4078431, 0, 1,
-1.458748, 1.472205, -0.8063315, 1, 0.4156863, 0, 1,
-1.436166, -2.021044, -5.248555, 1, 0.4196078, 0, 1,
-1.417431, 1.705622, 0.6069697, 1, 0.427451, 0, 1,
-1.416738, 1.463041, -0.3976639, 1, 0.4313726, 0, 1,
-1.406759, 1.863916, -2.531684, 1, 0.4392157, 0, 1,
-1.403036, -0.1274125, -0.5989797, 1, 0.4431373, 0, 1,
-1.401353, 0.2309483, -0.1996494, 1, 0.4509804, 0, 1,
-1.396024, 1.08612, -0.3267418, 1, 0.454902, 0, 1,
-1.394631, 1.308637, -0.5301839, 1, 0.4627451, 0, 1,
-1.392845, -0.3869048, -3.981323, 1, 0.4666667, 0, 1,
-1.365128, -0.006998023, -2.833658, 1, 0.4745098, 0, 1,
-1.355696, 0.08418072, -3.398136, 1, 0.4784314, 0, 1,
-1.352531, 0.9364789, -0.6310486, 1, 0.4862745, 0, 1,
-1.343868, 0.6614057, -2.258192, 1, 0.4901961, 0, 1,
-1.334997, -0.5001416, -0.7639848, 1, 0.4980392, 0, 1,
-1.332439, 0.8864658, -0.239411, 1, 0.5058824, 0, 1,
-1.329699, -0.1888122, -0.4962479, 1, 0.509804, 0, 1,
-1.326017, -0.8476628, -2.126306, 1, 0.5176471, 0, 1,
-1.322451, 1.485143, 1.29751, 1, 0.5215687, 0, 1,
-1.315247, 2.371639, -1.805027, 1, 0.5294118, 0, 1,
-1.310266, -0.7554466, -1.829131, 1, 0.5333334, 0, 1,
-1.30714, 0.5076287, -0.508373, 1, 0.5411765, 0, 1,
-1.300021, 1.314364, 0.08996673, 1, 0.5450981, 0, 1,
-1.297304, -1.782053, -0.9783688, 1, 0.5529412, 0, 1,
-1.279013, -1.191034, -1.380665, 1, 0.5568628, 0, 1,
-1.267514, 0.2047635, -1.270725, 1, 0.5647059, 0, 1,
-1.258304, 1.052769, -0.8697669, 1, 0.5686275, 0, 1,
-1.25227, -0.08289651, -1.202765, 1, 0.5764706, 0, 1,
-1.245452, 1.894861, -1.881487, 1, 0.5803922, 0, 1,
-1.245309, 1.011653, -0.6898801, 1, 0.5882353, 0, 1,
-1.232599, 2.405546, -1.404107, 1, 0.5921569, 0, 1,
-1.231736, 1.214079, -1.622608, 1, 0.6, 0, 1,
-1.226676, -0.9169509, -3.002066, 1, 0.6078432, 0, 1,
-1.222468, 0.1400786, -1.896942, 1, 0.6117647, 0, 1,
-1.209021, -0.2995586, -2.125599, 1, 0.6196079, 0, 1,
-1.207392, -0.6013421, -1.086319, 1, 0.6235294, 0, 1,
-1.203997, -0.3537312, -1.678898, 1, 0.6313726, 0, 1,
-1.195235, -0.1638724, -2.231242, 1, 0.6352941, 0, 1,
-1.188503, 0.8868584, 0.2696994, 1, 0.6431373, 0, 1,
-1.183713, 1.301536, -0.5780063, 1, 0.6470588, 0, 1,
-1.180324, -0.4358263, -2.242744, 1, 0.654902, 0, 1,
-1.177628, 0.3689517, -2.239188, 1, 0.6588235, 0, 1,
-1.169903, -0.2458286, -1.953782, 1, 0.6666667, 0, 1,
-1.166863, 0.6881893, -1.028909, 1, 0.6705883, 0, 1,
-1.158229, 1.294871, -0.4381906, 1, 0.6784314, 0, 1,
-1.157145, -0.2816749, -1.091913, 1, 0.682353, 0, 1,
-1.154554, -0.1492636, -2.389565, 1, 0.6901961, 0, 1,
-1.143914, -1.017909, -1.407653, 1, 0.6941177, 0, 1,
-1.141012, -2.007432, -1.535019, 1, 0.7019608, 0, 1,
-1.139382, 0.7048283, -0.2249523, 1, 0.7098039, 0, 1,
-1.13247, -0.3767227, -0.3970521, 1, 0.7137255, 0, 1,
-1.132167, 0.12398, -1.399957, 1, 0.7215686, 0, 1,
-1.118496, 0.3819866, -1.07149, 1, 0.7254902, 0, 1,
-1.112809, -1.242863, -3.985862, 1, 0.7333333, 0, 1,
-1.108693, 0.4934524, -1.471056, 1, 0.7372549, 0, 1,
-1.108423, -0.04851244, -0.8464093, 1, 0.7450981, 0, 1,
-1.102196, 2.016027, -2.717528, 1, 0.7490196, 0, 1,
-1.086054, -0.1434133, -2.366959, 1, 0.7568628, 0, 1,
-1.078263, 0.7319096, 0.4479963, 1, 0.7607843, 0, 1,
-1.076231, 0.266818, -1.349588, 1, 0.7686275, 0, 1,
-1.071151, 0.7191488, -1.499137, 1, 0.772549, 0, 1,
-1.070029, 0.2666749, -2.011772, 1, 0.7803922, 0, 1,
-1.06445, 1.531461, -1.872882, 1, 0.7843137, 0, 1,
-1.057992, -0.2260703, -1.50403, 1, 0.7921569, 0, 1,
-1.055021, -0.1920146, -1.997379, 1, 0.7960784, 0, 1,
-1.051424, -1.402977, -2.609684, 1, 0.8039216, 0, 1,
-1.050518, -0.6342507, -2.817155, 1, 0.8117647, 0, 1,
-1.050483, -0.3684834, -3.733409, 1, 0.8156863, 0, 1,
-1.048319, -0.4739725, -1.702401, 1, 0.8235294, 0, 1,
-1.022632, -0.5113181, -0.8355454, 1, 0.827451, 0, 1,
-1.020385, -1.084527, -3.759993, 1, 0.8352941, 0, 1,
-1.018602, 0.3940087, -1.227347, 1, 0.8392157, 0, 1,
-1.009377, -0.3808862, -2.377451, 1, 0.8470588, 0, 1,
-1.003347, -2.314772, -3.324298, 1, 0.8509804, 0, 1,
-1.001906, 0.6427336, -0.4277364, 1, 0.8588235, 0, 1,
-0.9969343, 1.549383, -1.02297, 1, 0.8627451, 0, 1,
-0.9927098, 0.4074965, -0.6638768, 1, 0.8705882, 0, 1,
-0.9917169, -0.6202704, -0.5917904, 1, 0.8745098, 0, 1,
-0.991525, -0.9533845, -3.023469, 1, 0.8823529, 0, 1,
-0.9888888, -0.05136503, -1.044657, 1, 0.8862745, 0, 1,
-0.9776942, -1.241899, -3.350775, 1, 0.8941177, 0, 1,
-0.9758971, -0.0719841, -0.1609129, 1, 0.8980392, 0, 1,
-0.9725473, 0.02100601, -0.9727487, 1, 0.9058824, 0, 1,
-0.9715492, -1.187606, -2.094006, 1, 0.9137255, 0, 1,
-0.9694541, -0.006656596, -0.5955822, 1, 0.9176471, 0, 1,
-0.9683366, 0.6362771, -1.760231, 1, 0.9254902, 0, 1,
-0.9651138, 0.9986847, -0.6318917, 1, 0.9294118, 0, 1,
-0.9635047, -1.152181, -4.174109, 1, 0.9372549, 0, 1,
-0.9613261, -0.5068505, 1.11721, 1, 0.9411765, 0, 1,
-0.9611218, 0.6538743, -1.660341, 1, 0.9490196, 0, 1,
-0.9585124, 1.41134, -1.876763, 1, 0.9529412, 0, 1,
-0.9461316, 0.07498936, -0.2928145, 1, 0.9607843, 0, 1,
-0.9457883, 0.6357468, -2.622759, 1, 0.9647059, 0, 1,
-0.9449145, 0.9791461, -0.9406099, 1, 0.972549, 0, 1,
-0.9409168, 0.9728476, 0.9821028, 1, 0.9764706, 0, 1,
-0.9365696, -1.530768, -1.910046, 1, 0.9843137, 0, 1,
-0.9365178, -0.02437607, -3.133479, 1, 0.9882353, 0, 1,
-0.9363366, 0.7457424, -0.3946986, 1, 0.9960784, 0, 1,
-0.9331699, -0.189965, -1.587507, 0.9960784, 1, 0, 1,
-0.9297618, -1.074485, -1.607737, 0.9921569, 1, 0, 1,
-0.9296197, 0.08206785, -2.157521, 0.9843137, 1, 0, 1,
-0.9274212, -0.1150167, -0.8821066, 0.9803922, 1, 0, 1,
-0.9258178, 0.2326774, -0.835811, 0.972549, 1, 0, 1,
-0.9253027, -0.06403366, -1.511828, 0.9686275, 1, 0, 1,
-0.9223145, -1.077487, -4.6134, 0.9607843, 1, 0, 1,
-0.9159129, 2.284452, 0.8631498, 0.9568627, 1, 0, 1,
-0.9145656, 1.363425, -0.6236386, 0.9490196, 1, 0, 1,
-0.9061136, 0.8809503, -0.8439489, 0.945098, 1, 0, 1,
-0.905344, -0.2789463, -0.5814303, 0.9372549, 1, 0, 1,
-0.899907, 1.271443, -1.841232, 0.9333333, 1, 0, 1,
-0.8956839, -0.7329008, -4.035867, 0.9254902, 1, 0, 1,
-0.893769, -1.202177, -2.186908, 0.9215686, 1, 0, 1,
-0.89035, -0.572473, 0.08210555, 0.9137255, 1, 0, 1,
-0.884585, -0.04040858, -2.187738, 0.9098039, 1, 0, 1,
-0.8840302, -0.3120729, -3.962401, 0.9019608, 1, 0, 1,
-0.8739412, 1.412343, -0.03256628, 0.8941177, 1, 0, 1,
-0.8738884, -0.4073043, -2.38085, 0.8901961, 1, 0, 1,
-0.8684247, -0.1074786, -2.424534, 0.8823529, 1, 0, 1,
-0.8673184, 0.7679708, -1.310001, 0.8784314, 1, 0, 1,
-0.866075, -0.1064047, -2.782314, 0.8705882, 1, 0, 1,
-0.8613159, 1.328449, -0.4001102, 0.8666667, 1, 0, 1,
-0.8608868, 0.3891378, -1.354661, 0.8588235, 1, 0, 1,
-0.860566, -1.533353, -2.511308, 0.854902, 1, 0, 1,
-0.8592943, -1.065317, -1.789615, 0.8470588, 1, 0, 1,
-0.8547852, -0.1128717, -1.571692, 0.8431373, 1, 0, 1,
-0.8538321, 0.01433874, -1.076742, 0.8352941, 1, 0, 1,
-0.8432592, -0.3050105, -1.348945, 0.8313726, 1, 0, 1,
-0.842392, 0.8718729, -1.200212, 0.8235294, 1, 0, 1,
-0.8366097, 0.1414764, -0.5480599, 0.8196079, 1, 0, 1,
-0.831611, -0.6820886, -2.913916, 0.8117647, 1, 0, 1,
-0.8309142, -0.5593786, -1.497082, 0.8078431, 1, 0, 1,
-0.8263876, 0.1834678, -1.604282, 0.8, 1, 0, 1,
-0.8218731, -0.7661682, -3.273829, 0.7921569, 1, 0, 1,
-0.8047663, 0.5876847, -0.7964575, 0.7882353, 1, 0, 1,
-0.8044635, -1.365979, -1.689047, 0.7803922, 1, 0, 1,
-0.8040774, -0.962321, -2.182348, 0.7764706, 1, 0, 1,
-0.8024271, 0.1563556, -1.002891, 0.7686275, 1, 0, 1,
-0.793635, 0.5244759, -0.04194238, 0.7647059, 1, 0, 1,
-0.7838897, -0.2284335, -1.803183, 0.7568628, 1, 0, 1,
-0.7814071, -1.046597, -4.778224, 0.7529412, 1, 0, 1,
-0.7750424, 0.5819293, -1.243682, 0.7450981, 1, 0, 1,
-0.7677018, 2.142792, 0.9401372, 0.7411765, 1, 0, 1,
-0.7593988, -2.047212, -1.270877, 0.7333333, 1, 0, 1,
-0.7525569, 0.9741834, -1.161922, 0.7294118, 1, 0, 1,
-0.747902, 0.5253073, -0.8237527, 0.7215686, 1, 0, 1,
-0.7477155, -0.7516927, -2.482448, 0.7176471, 1, 0, 1,
-0.7464951, -1.903102, -1.012434, 0.7098039, 1, 0, 1,
-0.7425597, 0.7869031, -1.035562, 0.7058824, 1, 0, 1,
-0.7416176, 0.3543016, -1.710932, 0.6980392, 1, 0, 1,
-0.7410669, -0.1460544, 0.1643043, 0.6901961, 1, 0, 1,
-0.7397702, 2.827702, -0.8716667, 0.6862745, 1, 0, 1,
-0.7362961, -0.8566228, -1.411728, 0.6784314, 1, 0, 1,
-0.7345077, -0.9309285, -0.6584422, 0.6745098, 1, 0, 1,
-0.7278026, 0.02679475, -1.85822, 0.6666667, 1, 0, 1,
-0.7268427, -0.3823411, -2.335927, 0.6627451, 1, 0, 1,
-0.7265903, 0.2392456, -1.965933, 0.654902, 1, 0, 1,
-0.7208234, 0.4527269, 0.4295222, 0.6509804, 1, 0, 1,
-0.7167557, -1.076414, -2.416477, 0.6431373, 1, 0, 1,
-0.713618, 0.7895958, -1.502864, 0.6392157, 1, 0, 1,
-0.70671, 0.3837763, -2.801676, 0.6313726, 1, 0, 1,
-0.7048249, 0.5744544, -0.3914775, 0.627451, 1, 0, 1,
-0.7010381, 1.772129, -0.6650462, 0.6196079, 1, 0, 1,
-0.6961803, 0.8674467, -0.2019128, 0.6156863, 1, 0, 1,
-0.6956896, -1.024024, -2.949295, 0.6078432, 1, 0, 1,
-0.6954923, 1.46416, -1.942746, 0.6039216, 1, 0, 1,
-0.6877849, 0.5139864, -1.994341, 0.5960785, 1, 0, 1,
-0.686909, -0.7440946, -2.66873, 0.5882353, 1, 0, 1,
-0.683743, 0.9379454, -0.4674608, 0.5843138, 1, 0, 1,
-0.6817798, 0.8786207, -2.339674, 0.5764706, 1, 0, 1,
-0.6766111, -0.3675076, -1.944629, 0.572549, 1, 0, 1,
-0.6736532, -0.01910178, -0.7304573, 0.5647059, 1, 0, 1,
-0.6643742, -0.7920768, -1.983543, 0.5607843, 1, 0, 1,
-0.6594455, 1.066113, -0.9060398, 0.5529412, 1, 0, 1,
-0.6530454, 0.1674781, -1.090836, 0.5490196, 1, 0, 1,
-0.6520079, -0.5031114, -1.814733, 0.5411765, 1, 0, 1,
-0.6515414, -0.6992056, -3.610029, 0.5372549, 1, 0, 1,
-0.6508548, -0.2893994, -2.571993, 0.5294118, 1, 0, 1,
-0.6492579, -1.899405, -1.30483, 0.5254902, 1, 0, 1,
-0.6476316, -1.520896, -2.347962, 0.5176471, 1, 0, 1,
-0.6421953, -0.8521431, -1.656688, 0.5137255, 1, 0, 1,
-0.6395442, -0.9249966, -2.746489, 0.5058824, 1, 0, 1,
-0.6385159, -0.7364641, -3.508709, 0.5019608, 1, 0, 1,
-0.6338363, -1.283969, -1.456883, 0.4941176, 1, 0, 1,
-0.6333224, 0.8853468, -2.2026, 0.4862745, 1, 0, 1,
-0.6291458, 0.6059282, -1.761109, 0.4823529, 1, 0, 1,
-0.6242863, -0.4595062, -0.3715406, 0.4745098, 1, 0, 1,
-0.6209438, 1.244564, -0.7911028, 0.4705882, 1, 0, 1,
-0.6190196, -0.1498176, -2.553894, 0.4627451, 1, 0, 1,
-0.6177031, 0.6882456, 0.176723, 0.4588235, 1, 0, 1,
-0.6117257, -1.53696, -3.378074, 0.4509804, 1, 0, 1,
-0.6099872, 1.147448, -0.536737, 0.4470588, 1, 0, 1,
-0.6064718, -0.7734739, -1.497244, 0.4392157, 1, 0, 1,
-0.5986118, -2.080415, -3.33267, 0.4352941, 1, 0, 1,
-0.59794, -0.9229651, -2.539067, 0.427451, 1, 0, 1,
-0.5963842, 1.416316, -0.9201474, 0.4235294, 1, 0, 1,
-0.5822675, 0.3952937, -0.9814866, 0.4156863, 1, 0, 1,
-0.5771336, -0.5737812, -2.164583, 0.4117647, 1, 0, 1,
-0.5762956, 1.314824, 0.124416, 0.4039216, 1, 0, 1,
-0.5751923, -0.1051766, -0.826103, 0.3960784, 1, 0, 1,
-0.5736303, -1.429712, -2.182847, 0.3921569, 1, 0, 1,
-0.5735535, -0.8840231, -3.884299, 0.3843137, 1, 0, 1,
-0.5715885, -0.7030131, -4.417878, 0.3803922, 1, 0, 1,
-0.5713355, 1.109573, 0.3653572, 0.372549, 1, 0, 1,
-0.571044, -1.321136, -1.381026, 0.3686275, 1, 0, 1,
-0.57006, 1.214285, 0.4043033, 0.3607843, 1, 0, 1,
-0.5688014, 1.21382, -1.184909, 0.3568628, 1, 0, 1,
-0.5671492, 1.554726, 0.7845266, 0.3490196, 1, 0, 1,
-0.5609805, 0.7854304, -1.484067, 0.345098, 1, 0, 1,
-0.5607458, 0.9062873, 0.3769391, 0.3372549, 1, 0, 1,
-0.5599523, 1.361531, 1.073158, 0.3333333, 1, 0, 1,
-0.5580218, 0.6803385, 0.05432147, 0.3254902, 1, 0, 1,
-0.5562904, 1.584559, 0.6082242, 0.3215686, 1, 0, 1,
-0.5539909, 1.709411, -1.282751, 0.3137255, 1, 0, 1,
-0.5449234, -0.1634175, -2.850515, 0.3098039, 1, 0, 1,
-0.5445797, 0.6504022, 0.8605632, 0.3019608, 1, 0, 1,
-0.535776, -0.3349501, -1.828221, 0.2941177, 1, 0, 1,
-0.5339648, 0.4599967, -1.109896, 0.2901961, 1, 0, 1,
-0.5332052, 0.01031481, 0.08963512, 0.282353, 1, 0, 1,
-0.5302041, 1.771013, 0.4873069, 0.2784314, 1, 0, 1,
-0.5254747, -0.1734958, -2.704006, 0.2705882, 1, 0, 1,
-0.5174617, 2.061182, -0.546371, 0.2666667, 1, 0, 1,
-0.5172663, -0.09362955, -2.738622, 0.2588235, 1, 0, 1,
-0.5086097, 1.310674, -1.299455, 0.254902, 1, 0, 1,
-0.5070933, 1.577985, 1.025034, 0.2470588, 1, 0, 1,
-0.5067343, 0.5245713, -1.061261, 0.2431373, 1, 0, 1,
-0.5050724, -1.23137, -3.39733, 0.2352941, 1, 0, 1,
-0.5041824, -0.3408068, -1.326054, 0.2313726, 1, 0, 1,
-0.5028358, 0.5387675, 1.394336, 0.2235294, 1, 0, 1,
-0.5002036, -0.3248906, -0.8135185, 0.2196078, 1, 0, 1,
-0.4995349, -0.05951858, -2.631284, 0.2117647, 1, 0, 1,
-0.4915794, 0.4717984, -0.765339, 0.2078431, 1, 0, 1,
-0.4915285, 0.3897707, -0.469531, 0.2, 1, 0, 1,
-0.48916, -0.3463264, -2.586388, 0.1921569, 1, 0, 1,
-0.4877005, 0.249112, -1.511197, 0.1882353, 1, 0, 1,
-0.4857118, -1.745942, -3.009972, 0.1803922, 1, 0, 1,
-0.4845382, -0.2775266, -2.222133, 0.1764706, 1, 0, 1,
-0.479717, -0.9820469, -2.903465, 0.1686275, 1, 0, 1,
-0.4780526, -1.898076, -2.998306, 0.1647059, 1, 0, 1,
-0.4756335, 1.320601, 0.8362179, 0.1568628, 1, 0, 1,
-0.4728858, 0.4907529, -0.9551784, 0.1529412, 1, 0, 1,
-0.4722114, -0.7572631, -2.446923, 0.145098, 1, 0, 1,
-0.4712761, -1.139306, -3.016899, 0.1411765, 1, 0, 1,
-0.4696044, 0.6012145, -0.1435427, 0.1333333, 1, 0, 1,
-0.4659047, -0.616265, -2.215192, 0.1294118, 1, 0, 1,
-0.4588586, -1.608958, -4.852464, 0.1215686, 1, 0, 1,
-0.4588042, -0.7566373, -2.12829, 0.1176471, 1, 0, 1,
-0.4577042, -0.1812508, -0.8285384, 0.1098039, 1, 0, 1,
-0.4575701, 0.805518, -1.166025, 0.1058824, 1, 0, 1,
-0.4574773, 0.2039212, -1.490878, 0.09803922, 1, 0, 1,
-0.4568106, 2.232689, -0.4549876, 0.09019608, 1, 0, 1,
-0.454813, -0.1395943, -3.457813, 0.08627451, 1, 0, 1,
-0.4527502, 0.7423663, -0.8572555, 0.07843138, 1, 0, 1,
-0.4521662, -0.2431103, -1.072338, 0.07450981, 1, 0, 1,
-0.4504712, 1.092255, -1.196245, 0.06666667, 1, 0, 1,
-0.4424017, 2.446376, -0.589516, 0.0627451, 1, 0, 1,
-0.4417197, 0.4863417, -1.16535, 0.05490196, 1, 0, 1,
-0.441127, 0.1322526, -0.1652263, 0.05098039, 1, 0, 1,
-0.4355454, -0.01747007, -0.969329, 0.04313726, 1, 0, 1,
-0.4325711, 0.2054764, -2.582001, 0.03921569, 1, 0, 1,
-0.4298344, 0.5770692, 0.6187956, 0.03137255, 1, 0, 1,
-0.4278288, 0.4551445, -1.352177, 0.02745098, 1, 0, 1,
-0.4264792, 0.7783083, 0.03813489, 0.01960784, 1, 0, 1,
-0.423357, 1.076261, 1.303093, 0.01568628, 1, 0, 1,
-0.4100462, 0.6604103, -1.497126, 0.007843138, 1, 0, 1,
-0.4060287, -0.7463046, -1.7491, 0.003921569, 1, 0, 1,
-0.4058471, -2.055599, -1.621966, 0, 1, 0.003921569, 1,
-0.4026337, -0.1647792, -2.200575, 0, 1, 0.01176471, 1,
-0.4026096, -0.2710695, -1.402081, 0, 1, 0.01568628, 1,
-0.3995976, 1.163497, 1.435563, 0, 1, 0.02352941, 1,
-0.399194, 0.5889742, -0.1301354, 0, 1, 0.02745098, 1,
-0.3986572, 0.5824287, 0.09994952, 0, 1, 0.03529412, 1,
-0.3959161, -1.041948, -3.307242, 0, 1, 0.03921569, 1,
-0.3912694, 0.05920881, -1.752652, 0, 1, 0.04705882, 1,
-0.3896579, 1.357382, -2.070762, 0, 1, 0.05098039, 1,
-0.386518, 0.8137653, 0.8199612, 0, 1, 0.05882353, 1,
-0.3857635, -1.565167, -4.635972, 0, 1, 0.0627451, 1,
-0.3851004, -0.5695698, -0.9667148, 0, 1, 0.07058824, 1,
-0.3824534, -0.8963538, -3.46122, 0, 1, 0.07450981, 1,
-0.3818688, -1.059899, -2.532751, 0, 1, 0.08235294, 1,
-0.3787215, 0.3145988, -0.6268539, 0, 1, 0.08627451, 1,
-0.3724915, -2.234786, -2.564826, 0, 1, 0.09411765, 1,
-0.3623794, -0.2309686, -1.737115, 0, 1, 0.1019608, 1,
-0.3618382, -0.008975732, -2.340379, 0, 1, 0.1058824, 1,
-0.3576316, -1.688101, -1.848485, 0, 1, 0.1137255, 1,
-0.3515509, 0.59614, -1.282766, 0, 1, 0.1176471, 1,
-0.3512046, 0.07034665, -0.03697393, 0, 1, 0.1254902, 1,
-0.3511722, 0.08720657, -0.2685304, 0, 1, 0.1294118, 1,
-0.3455562, -0.1184043, -1.456425, 0, 1, 0.1372549, 1,
-0.3436518, -0.5732112, -2.451306, 0, 1, 0.1411765, 1,
-0.3429505, 0.5752369, -0.4959518, 0, 1, 0.1490196, 1,
-0.3424573, -0.02507521, -1.613616, 0, 1, 0.1529412, 1,
-0.3422528, -1.620699, -3.32648, 0, 1, 0.1607843, 1,
-0.3408874, 0.9503158, -0.6145512, 0, 1, 0.1647059, 1,
-0.3396615, -0.9511542, -2.967637, 0, 1, 0.172549, 1,
-0.3388058, -0.3291749, -2.897305, 0, 1, 0.1764706, 1,
-0.3376765, -0.4060897, -2.675282, 0, 1, 0.1843137, 1,
-0.3352175, -0.3402357, -2.126908, 0, 1, 0.1882353, 1,
-0.3327714, -0.8948334, -3.080996, 0, 1, 0.1960784, 1,
-0.3321548, -1.042292, -3.368832, 0, 1, 0.2039216, 1,
-0.3315159, 0.7072341, 0.04599991, 0, 1, 0.2078431, 1,
-0.3290696, -1.125675, -3.598375, 0, 1, 0.2156863, 1,
-0.3271584, -0.3108026, -1.764448, 0, 1, 0.2196078, 1,
-0.3206841, 0.4440842, -1.047443, 0, 1, 0.227451, 1,
-0.3199756, 1.608498, -1.363621, 0, 1, 0.2313726, 1,
-0.3199706, -1.180147, -4.901792, 0, 1, 0.2392157, 1,
-0.3190665, -0.7321789, -4.132522, 0, 1, 0.2431373, 1,
-0.3183255, 0.003170316, -0.01303027, 0, 1, 0.2509804, 1,
-0.3178345, 0.0567668, -1.657369, 0, 1, 0.254902, 1,
-0.3160952, -0.07408421, -1.365544, 0, 1, 0.2627451, 1,
-0.3153399, -0.7399049, -2.583754, 0, 1, 0.2666667, 1,
-0.3136515, 1.320598, -0.9858934, 0, 1, 0.2745098, 1,
-0.3135412, 0.5883185, 0.6527822, 0, 1, 0.2784314, 1,
-0.3121516, -0.3473398, -3.226383, 0, 1, 0.2862745, 1,
-0.3103812, -0.2377718, -2.302737, 0, 1, 0.2901961, 1,
-0.3100101, 0.530234, -1.141979, 0, 1, 0.2980392, 1,
-0.3078201, -0.1720064, -1.925991, 0, 1, 0.3058824, 1,
-0.3071795, -1.352268, -4.241014, 0, 1, 0.3098039, 1,
-0.30647, 0.3043268, -1.539424, 0, 1, 0.3176471, 1,
-0.3046881, 0.03320637, -0.9083299, 0, 1, 0.3215686, 1,
-0.3045849, -0.2790472, -3.273914, 0, 1, 0.3294118, 1,
-0.3039618, -0.7660062, -2.038766, 0, 1, 0.3333333, 1,
-0.3017486, 1.152654, -0.00383444, 0, 1, 0.3411765, 1,
-0.3002415, -0.7726772, -4.640568, 0, 1, 0.345098, 1,
-0.2995763, 0.7925676, -0.2687985, 0, 1, 0.3529412, 1,
-0.298789, -0.4202518, -1.067042, 0, 1, 0.3568628, 1,
-0.2962926, -0.9741387, -3.242506, 0, 1, 0.3647059, 1,
-0.2943251, 0.8651297, 0.4127819, 0, 1, 0.3686275, 1,
-0.294043, 0.5092413, -0.4304839, 0, 1, 0.3764706, 1,
-0.2867248, -1.080822, -4.242257, 0, 1, 0.3803922, 1,
-0.2863845, 0.373749, 1.258333, 0, 1, 0.3882353, 1,
-0.2836503, 0.9398705, -1.335181, 0, 1, 0.3921569, 1,
-0.2754988, 1.336099, 1.734032, 0, 1, 0.4, 1,
-0.2754531, -0.7322172, -2.533837, 0, 1, 0.4078431, 1,
-0.2739893, 0.3640816, 0.09233863, 0, 1, 0.4117647, 1,
-0.2727502, 0.1981925, -3.011455, 0, 1, 0.4196078, 1,
-0.2685001, -0.09859993, -1.083528, 0, 1, 0.4235294, 1,
-0.26548, -1.136528, -2.936255, 0, 1, 0.4313726, 1,
-0.2651094, 0.5773739, -2.189276, 0, 1, 0.4352941, 1,
-0.2621407, -0.4001476, -1.992175, 0, 1, 0.4431373, 1,
-0.2581325, 0.4770311, 0.204766, 0, 1, 0.4470588, 1,
-0.2577704, 0.08599707, -0.4033625, 0, 1, 0.454902, 1,
-0.2547315, -0.2392401, -1.462509, 0, 1, 0.4588235, 1,
-0.2545101, 0.6036476, -0.5369032, 0, 1, 0.4666667, 1,
-0.2531345, 0.7619459, -2.490578, 0, 1, 0.4705882, 1,
-0.2518642, 0.6425719, -3.703061, 0, 1, 0.4784314, 1,
-0.2516904, -1.108117, -1.873974, 0, 1, 0.4823529, 1,
-0.2501928, -0.1013956, -0.8032269, 0, 1, 0.4901961, 1,
-0.2417691, 0.4071534, -1.077166, 0, 1, 0.4941176, 1,
-0.2399346, -0.3854879, -4.010375, 0, 1, 0.5019608, 1,
-0.2325616, -0.01999975, -0.931782, 0, 1, 0.509804, 1,
-0.2289113, 1.384191, -0.1510824, 0, 1, 0.5137255, 1,
-0.2275916, 0.5667348, -1.333502, 0, 1, 0.5215687, 1,
-0.220446, 1.537959, 0.7647559, 0, 1, 0.5254902, 1,
-0.2174509, -1.463385, -6.032634, 0, 1, 0.5333334, 1,
-0.2159949, 0.8462901, 0.9287779, 0, 1, 0.5372549, 1,
-0.2155953, 1.293135, 0.4189187, 0, 1, 0.5450981, 1,
-0.2155501, -0.626417, -1.02513, 0, 1, 0.5490196, 1,
-0.2088967, 0.1738111, -0.5753187, 0, 1, 0.5568628, 1,
-0.2081138, 1.118219, -0.8692269, 0, 1, 0.5607843, 1,
-0.2048357, 0.1288438, -0.3522125, 0, 1, 0.5686275, 1,
-0.199278, 1.678336, -1.634106, 0, 1, 0.572549, 1,
-0.1978036, -0.1839738, -2.168581, 0, 1, 0.5803922, 1,
-0.1939989, -0.2975968, -2.586027, 0, 1, 0.5843138, 1,
-0.191205, 0.3171202, -0.6628158, 0, 1, 0.5921569, 1,
-0.1903367, -0.5149571, -2.890585, 0, 1, 0.5960785, 1,
-0.1886848, 2.006893, -0.4747133, 0, 1, 0.6039216, 1,
-0.1883318, -1.409259, -2.571233, 0, 1, 0.6117647, 1,
-0.1869735, -0.2815, -3.208938, 0, 1, 0.6156863, 1,
-0.1865039, 0.3775394, -0.9473527, 0, 1, 0.6235294, 1,
-0.1859328, -0.2313772, -4.331174, 0, 1, 0.627451, 1,
-0.1816745, -0.5343729, -2.107089, 0, 1, 0.6352941, 1,
-0.1815396, 0.2831488, -0.8617412, 0, 1, 0.6392157, 1,
-0.1793932, 1.446988, 0.02300457, 0, 1, 0.6470588, 1,
-0.1761582, -0.2028956, -2.291896, 0, 1, 0.6509804, 1,
-0.1737588, -2.222389, -3.854215, 0, 1, 0.6588235, 1,
-0.1727204, 0.02961665, -2.29246, 0, 1, 0.6627451, 1,
-0.1669587, -1.846068, -4.675148, 0, 1, 0.6705883, 1,
-0.1646857, 0.5473765, -1.054225, 0, 1, 0.6745098, 1,
-0.1609513, 1.532536, -0.07544687, 0, 1, 0.682353, 1,
-0.1583776, -0.7500952, -3.060009, 0, 1, 0.6862745, 1,
-0.1461458, 0.2583219, 0.2071362, 0, 1, 0.6941177, 1,
-0.1447296, 0.7598614, 0.6466768, 0, 1, 0.7019608, 1,
-0.141361, 0.08738815, -3.155584, 0, 1, 0.7058824, 1,
-0.1378841, -1.264131, -2.352062, 0, 1, 0.7137255, 1,
-0.1372932, -1.575006, -3.164766, 0, 1, 0.7176471, 1,
-0.1362657, -0.9508667, -1.938352, 0, 1, 0.7254902, 1,
-0.1310489, -0.6093391, -1.732872, 0, 1, 0.7294118, 1,
-0.1275648, 0.2955267, -0.1280098, 0, 1, 0.7372549, 1,
-0.1251629, -1.176108, -2.878518, 0, 1, 0.7411765, 1,
-0.1236144, 0.3466718, -1.328495, 0, 1, 0.7490196, 1,
-0.1205566, -1.095384, -2.534111, 0, 1, 0.7529412, 1,
-0.1166849, -0.9519027, -3.356557, 0, 1, 0.7607843, 1,
-0.116522, 0.4934799, -1.208563, 0, 1, 0.7647059, 1,
-0.1123061, -0.3079002, -3.088991, 0, 1, 0.772549, 1,
-0.1116283, 0.383432, 0.5344314, 0, 1, 0.7764706, 1,
-0.1089562, -1.047005, -2.67521, 0, 1, 0.7843137, 1,
-0.1082349, -0.8968288, -1.735812, 0, 1, 0.7882353, 1,
-0.1062332, 0.9916683, 0.4015312, 0, 1, 0.7960784, 1,
-0.0950716, 1.465899, 0.7172664, 0, 1, 0.8039216, 1,
-0.094664, -0.4089005, -3.541629, 0, 1, 0.8078431, 1,
-0.09298756, 0.466729, -1.848485, 0, 1, 0.8156863, 1,
-0.08679673, -0.8102515, -3.323072, 0, 1, 0.8196079, 1,
-0.0844157, -0.1409648, -4.167189, 0, 1, 0.827451, 1,
-0.08248017, -0.1230135, -4.435788, 0, 1, 0.8313726, 1,
-0.07986299, 0.1946586, -1.464169, 0, 1, 0.8392157, 1,
-0.07943285, 0.5704954, 1.267764, 0, 1, 0.8431373, 1,
-0.07700432, 0.000117851, -2.268029, 0, 1, 0.8509804, 1,
-0.07604711, -0.6987701, -3.921927, 0, 1, 0.854902, 1,
-0.07116363, 1.017635, -2.665266, 0, 1, 0.8627451, 1,
-0.06879513, 1.680102, -0.2996072, 0, 1, 0.8666667, 1,
-0.05706775, 0.02047013, -1.944274, 0, 1, 0.8745098, 1,
-0.05257719, 1.606948, -0.748463, 0, 1, 0.8784314, 1,
-0.04979331, -0.3324499, -4.010549, 0, 1, 0.8862745, 1,
-0.04975483, -0.7997455, -2.11094, 0, 1, 0.8901961, 1,
-0.04828114, -2.260994, -2.294053, 0, 1, 0.8980392, 1,
-0.04512692, -0.6672462, -3.383043, 0, 1, 0.9058824, 1,
-0.04478291, -1.460433, -2.99843, 0, 1, 0.9098039, 1,
-0.03892105, 1.245012, -0.974709, 0, 1, 0.9176471, 1,
-0.03662991, -0.1901189, -3.428189, 0, 1, 0.9215686, 1,
-0.03609959, 0.321642, 1.182127, 0, 1, 0.9294118, 1,
-0.03337063, -1.335405, -4.200105, 0, 1, 0.9333333, 1,
-0.03013931, -0.7048294, -1.674617, 0, 1, 0.9411765, 1,
-0.02902346, -0.7774062, -2.187929, 0, 1, 0.945098, 1,
-0.0279016, -1.018655, -2.317959, 0, 1, 0.9529412, 1,
-0.02687524, -1.208312, -3.37753, 0, 1, 0.9568627, 1,
-0.01673323, 0.4369926, 0.1204486, 0, 1, 0.9647059, 1,
-0.01508874, 0.1773316, -1.146607, 0, 1, 0.9686275, 1,
-0.01302732, -2.059112, -4.48658, 0, 1, 0.9764706, 1,
-0.009156075, -0.1626588, -2.849411, 0, 1, 0.9803922, 1,
-0.005704197, 0.5141089, 2.46299, 0, 1, 0.9882353, 1,
-0.004542626, -0.60369, -4.243299, 0, 1, 0.9921569, 1,
-0.002837167, -0.03526517, -1.924919, 0, 1, 1, 1,
-0.001393401, 0.116216, -0.7383254, 0, 0.9921569, 1, 1,
0.0003108793, -0.4935867, 1.38909, 0, 0.9882353, 1, 1,
0.0003213185, -0.9115421, 3.270992, 0, 0.9803922, 1, 1,
0.001790376, 1.838491, -0.715705, 0, 0.9764706, 1, 1,
0.002748874, -0.1107825, 3.800408, 0, 0.9686275, 1, 1,
0.009376182, 1.544369, -2.438747, 0, 0.9647059, 1, 1,
0.01141847, 0.8693296, -0.5557908, 0, 0.9568627, 1, 1,
0.01582753, -2.103013, 0.9165248, 0, 0.9529412, 1, 1,
0.02297889, 1.434325, 0.5286185, 0, 0.945098, 1, 1,
0.02487965, -1.016415, 3.283816, 0, 0.9411765, 1, 1,
0.02677592, -0.5343083, 3.117009, 0, 0.9333333, 1, 1,
0.0289633, -1.37145, 2.718579, 0, 0.9294118, 1, 1,
0.02949745, 1.335781, -0.8397502, 0, 0.9215686, 1, 1,
0.03174895, -1.792147, 3.637381, 0, 0.9176471, 1, 1,
0.03289779, -1.362422, 3.351312, 0, 0.9098039, 1, 1,
0.03303375, -0.1292758, 2.098376, 0, 0.9058824, 1, 1,
0.03418684, 1.973369, -0.9828666, 0, 0.8980392, 1, 1,
0.03939518, 0.5761883, 1.064062, 0, 0.8901961, 1, 1,
0.04597028, 0.02556485, 0.6342621, 0, 0.8862745, 1, 1,
0.04681476, 0.3886509, -1.587914, 0, 0.8784314, 1, 1,
0.04716123, -0.9096389, 4.162364, 0, 0.8745098, 1, 1,
0.04832921, -1.031814, 4.510091, 0, 0.8666667, 1, 1,
0.04889377, -0.7652726, 1.519076, 0, 0.8627451, 1, 1,
0.049204, -0.7693862, 3.782646, 0, 0.854902, 1, 1,
0.05010611, 1.010154, -0.8176292, 0, 0.8509804, 1, 1,
0.05027907, -0.1487743, 3.791514, 0, 0.8431373, 1, 1,
0.05049652, 0.1476323, 0.1107669, 0, 0.8392157, 1, 1,
0.05156356, -0.6021041, 4.275663, 0, 0.8313726, 1, 1,
0.05201726, -0.4932953, 4.013292, 0, 0.827451, 1, 1,
0.05407301, 0.4989716, 1.069444, 0, 0.8196079, 1, 1,
0.05456798, -1.00332, 3.051262, 0, 0.8156863, 1, 1,
0.05488449, -0.5527477, 3.082531, 0, 0.8078431, 1, 1,
0.05516044, -0.8582428, 4.555068, 0, 0.8039216, 1, 1,
0.05701235, 1.671117, -1.126226, 0, 0.7960784, 1, 1,
0.05767436, -0.3166019, 1.527214, 0, 0.7882353, 1, 1,
0.05833774, -2.008689, 3.981466, 0, 0.7843137, 1, 1,
0.05838377, -0.9382011, 2.558465, 0, 0.7764706, 1, 1,
0.06029331, -0.1252844, 2.01123, 0, 0.772549, 1, 1,
0.0644718, 1.254377, 0.4067767, 0, 0.7647059, 1, 1,
0.06479254, -0.2385297, 2.166675, 0, 0.7607843, 1, 1,
0.0726483, -0.3197201, 2.648947, 0, 0.7529412, 1, 1,
0.07286428, -0.6077687, 2.569531, 0, 0.7490196, 1, 1,
0.07451081, 0.5485706, -1.514556, 0, 0.7411765, 1, 1,
0.07766467, 0.4017495, 1.260499, 0, 0.7372549, 1, 1,
0.08007833, 0.3347476, 0.7791638, 0, 0.7294118, 1, 1,
0.08389135, 0.6294532, -0.1875913, 0, 0.7254902, 1, 1,
0.08454612, 1.542764, 0.8480889, 0, 0.7176471, 1, 1,
0.08517249, -1.433429, 3.483679, 0, 0.7137255, 1, 1,
0.08825212, -0.1502798, 1.942081, 0, 0.7058824, 1, 1,
0.09341243, 1.057455, 1.269078, 0, 0.6980392, 1, 1,
0.09424036, 1.138256, -2.82694, 0, 0.6941177, 1, 1,
0.09446836, -0.1313266, 3.49182, 0, 0.6862745, 1, 1,
0.09852353, -2.129228, 2.549069, 0, 0.682353, 1, 1,
0.09891888, 0.899711, 0.3893689, 0, 0.6745098, 1, 1,
0.1002857, 0.2050179, -0.1791735, 0, 0.6705883, 1, 1,
0.1011425, 2.048233, 0.7505618, 0, 0.6627451, 1, 1,
0.1049615, 1.129108, 2.115291, 0, 0.6588235, 1, 1,
0.1061703, 0.04014864, 1.483355, 0, 0.6509804, 1, 1,
0.1072033, -0.4634574, 2.670225, 0, 0.6470588, 1, 1,
0.1077698, -0.5294778, 3.543174, 0, 0.6392157, 1, 1,
0.1087149, 1.42852, 1.26549, 0, 0.6352941, 1, 1,
0.1106276, -0.1894568, 2.26459, 0, 0.627451, 1, 1,
0.1146573, -0.2474967, 1.466683, 0, 0.6235294, 1, 1,
0.1210198, -0.2976724, 3.314332, 0, 0.6156863, 1, 1,
0.1217968, 0.8453519, 0.003851461, 0, 0.6117647, 1, 1,
0.1251852, 0.3472979, -0.3535668, 0, 0.6039216, 1, 1,
0.1272203, 0.8010796, -0.5728607, 0, 0.5960785, 1, 1,
0.1274149, -1.82006, 3.402532, 0, 0.5921569, 1, 1,
0.1289426, -0.5085053, 2.421051, 0, 0.5843138, 1, 1,
0.1299395, -1.740094, 4.104277, 0, 0.5803922, 1, 1,
0.1303865, -0.9319243, 3.384899, 0, 0.572549, 1, 1,
0.1318485, -0.6862396, 3.23289, 0, 0.5686275, 1, 1,
0.136315, 1.018517, -0.8750853, 0, 0.5607843, 1, 1,
0.1378757, 2.68077, 1.286489, 0, 0.5568628, 1, 1,
0.142322, 1.93494, -2.790524, 0, 0.5490196, 1, 1,
0.1442577, -0.2924309, 2.488416, 0, 0.5450981, 1, 1,
0.1449244, 1.69391, -0.1924504, 0, 0.5372549, 1, 1,
0.1449364, 0.5462708, -0.6790572, 0, 0.5333334, 1, 1,
0.1461499, -0.7964534, 2.289346, 0, 0.5254902, 1, 1,
0.1487526, 0.01011242, 2.723652, 0, 0.5215687, 1, 1,
0.1491027, -1.260308, 5.483104, 0, 0.5137255, 1, 1,
0.1491676, -0.3539875, 2.54853, 0, 0.509804, 1, 1,
0.150528, 0.1433646, 0.3711661, 0, 0.5019608, 1, 1,
0.1512028, 0.1144074, 0.4676573, 0, 0.4941176, 1, 1,
0.151409, 1.463404, -1.365059, 0, 0.4901961, 1, 1,
0.1583945, -2.514496, 3.781084, 0, 0.4823529, 1, 1,
0.1612627, -1.101486, 3.975358, 0, 0.4784314, 1, 1,
0.1616753, -0.005887392, 1.7452, 0, 0.4705882, 1, 1,
0.1636603, 1.117977, 0.7164447, 0, 0.4666667, 1, 1,
0.1648634, -0.2670877, 1.680634, 0, 0.4588235, 1, 1,
0.1658644, -0.3365397, 3.275879, 0, 0.454902, 1, 1,
0.1702788, 0.3548418, -1.608851, 0, 0.4470588, 1, 1,
0.1713596, 0.08802727, 0.478698, 0, 0.4431373, 1, 1,
0.1765601, 0.5185114, 1.092752, 0, 0.4352941, 1, 1,
0.184088, 0.8002482, 1.542577, 0, 0.4313726, 1, 1,
0.1885247, -0.2970737, 2.812872, 0, 0.4235294, 1, 1,
0.1895283, -0.6004171, 3.476659, 0, 0.4196078, 1, 1,
0.1907656, -1.51131, 3.847775, 0, 0.4117647, 1, 1,
0.1909961, 0.597681, -0.7302817, 0, 0.4078431, 1, 1,
0.1919602, 0.2336075, 2.269226, 0, 0.4, 1, 1,
0.1988032, 0.7600766, 0.2497362, 0, 0.3921569, 1, 1,
0.2090476, -0.7106047, 2.316636, 0, 0.3882353, 1, 1,
0.2109467, -0.8043178, 2.194284, 0, 0.3803922, 1, 1,
0.2135728, 0.2059054, 0.9025098, 0, 0.3764706, 1, 1,
0.2146318, 1.570701, -0.4688689, 0, 0.3686275, 1, 1,
0.2194001, -1.70491, 3.732511, 0, 0.3647059, 1, 1,
0.2209351, 0.2643522, -0.3079613, 0, 0.3568628, 1, 1,
0.2218741, 0.6685988, 0.3485066, 0, 0.3529412, 1, 1,
0.2255131, 0.4375033, 1.962459, 0, 0.345098, 1, 1,
0.2273881, 2.083066, 1.404442, 0, 0.3411765, 1, 1,
0.2336435, -0.4213409, 1.07279, 0, 0.3333333, 1, 1,
0.2400876, 0.3024025, -0.06564002, 0, 0.3294118, 1, 1,
0.2401343, 0.4149797, 1.002591, 0, 0.3215686, 1, 1,
0.2408414, -1.32793, 1.18391, 0, 0.3176471, 1, 1,
0.2426769, -1.884466, 3.65817, 0, 0.3098039, 1, 1,
0.2437233, -1.236527, 1.741999, 0, 0.3058824, 1, 1,
0.2503815, 1.129997, 0.6370608, 0, 0.2980392, 1, 1,
0.2508693, -0.4923291, 2.93827, 0, 0.2901961, 1, 1,
0.2510796, -0.4280698, 1.908545, 0, 0.2862745, 1, 1,
0.2514768, -1.3727, 3.068252, 0, 0.2784314, 1, 1,
0.2566241, 1.102999, -2.429395, 0, 0.2745098, 1, 1,
0.256889, -0.08706888, 2.397016, 0, 0.2666667, 1, 1,
0.2653755, -0.6523917, 3.673666, 0, 0.2627451, 1, 1,
0.267168, -0.9348473, 2.616544, 0, 0.254902, 1, 1,
0.2690341, -0.1788268, 1.877926, 0, 0.2509804, 1, 1,
0.2716824, -1.354931, 3.101905, 0, 0.2431373, 1, 1,
0.2722472, 0.1304401, 2.033452, 0, 0.2392157, 1, 1,
0.2754864, -0.9211546, 2.4636, 0, 0.2313726, 1, 1,
0.2755423, -0.9683896, 3.981888, 0, 0.227451, 1, 1,
0.2778939, 1.543265, 1.59181, 0, 0.2196078, 1, 1,
0.2815601, -0.5086454, 2.724903, 0, 0.2156863, 1, 1,
0.2834081, 1.013986, 0.1523535, 0, 0.2078431, 1, 1,
0.2837362, 0.2151415, 1.008525, 0, 0.2039216, 1, 1,
0.2893841, 0.2305894, 1.785392, 0, 0.1960784, 1, 1,
0.2921404, 0.1694215, 1.804493, 0, 0.1882353, 1, 1,
0.2963851, -0.09015955, 1.635493, 0, 0.1843137, 1, 1,
0.2989854, -2.085379, 5.485689, 0, 0.1764706, 1, 1,
0.2997034, -0.1032835, 2.019609, 0, 0.172549, 1, 1,
0.2999541, 0.3337679, 0.8532124, 0, 0.1647059, 1, 1,
0.3006873, -0.2595624, 2.537066, 0, 0.1607843, 1, 1,
0.3022362, 0.04638363, 0.9670269, 0, 0.1529412, 1, 1,
0.3023587, 0.461056, 1.191705, 0, 0.1490196, 1, 1,
0.3066696, -0.438324, 3.804822, 0, 0.1411765, 1, 1,
0.3067968, 0.7741327, 0.8893585, 0, 0.1372549, 1, 1,
0.3107343, -0.6156459, 4.687495, 0, 0.1294118, 1, 1,
0.3141811, -0.6061001, 3.133887, 0, 0.1254902, 1, 1,
0.3158418, -0.0508389, 0.5037178, 0, 0.1176471, 1, 1,
0.3173299, 0.5966986, -0.4269847, 0, 0.1137255, 1, 1,
0.3193808, 0.03061184, 2.072002, 0, 0.1058824, 1, 1,
0.3193995, 0.8432736, 1.924461, 0, 0.09803922, 1, 1,
0.3194775, -0.4814598, 1.955429, 0, 0.09411765, 1, 1,
0.321491, 0.110798, 1.090856, 0, 0.08627451, 1, 1,
0.3260283, 0.784128, -0.1228323, 0, 0.08235294, 1, 1,
0.3326023, 0.3042743, -0.9125494, 0, 0.07450981, 1, 1,
0.3365822, -1.332908, 2.466675, 0, 0.07058824, 1, 1,
0.3388387, -0.1531294, 1.168233, 0, 0.0627451, 1, 1,
0.3397896, 0.281487, 0.6712698, 0, 0.05882353, 1, 1,
0.3402213, 1.277339, 0.5390256, 0, 0.05098039, 1, 1,
0.3431677, -0.603556, 3.685317, 0, 0.04705882, 1, 1,
0.3431834, 0.1488322, 2.06313, 0, 0.03921569, 1, 1,
0.3441874, -0.7934477, 3.380607, 0, 0.03529412, 1, 1,
0.346166, -2.136489, 0.971837, 0, 0.02745098, 1, 1,
0.3477637, 0.1435756, 0.9238545, 0, 0.02352941, 1, 1,
0.3605795, -1.336655, 3.746024, 0, 0.01568628, 1, 1,
0.3607281, 0.2553921, -0.2436453, 0, 0.01176471, 1, 1,
0.3671939, 1.356156, -1.41933, 0, 0.003921569, 1, 1,
0.368863, -1.253382, 2.991478, 0.003921569, 0, 1, 1,
0.3720083, -0.2028106, 1.809904, 0.007843138, 0, 1, 1,
0.3724893, -0.9148832, 2.664352, 0.01568628, 0, 1, 1,
0.3740281, -0.6738281, 1.321246, 0.01960784, 0, 1, 1,
0.3749346, -0.2386437, 1.836368, 0.02745098, 0, 1, 1,
0.3780345, -0.3833255, 2.10034, 0.03137255, 0, 1, 1,
0.3797714, 0.9763902, -0.1556818, 0.03921569, 0, 1, 1,
0.3830181, -1.795432, 4.838276, 0.04313726, 0, 1, 1,
0.3831582, 1.421506, -0.8868154, 0.05098039, 0, 1, 1,
0.3832337, -0.9979848, 3.560923, 0.05490196, 0, 1, 1,
0.3900769, -1.282917, 3.36496, 0.0627451, 0, 1, 1,
0.3902614, 1.048638, 0.7244943, 0.06666667, 0, 1, 1,
0.3954964, 0.06859162, 2.707616, 0.07450981, 0, 1, 1,
0.3992988, -0.3318241, 2.181414, 0.07843138, 0, 1, 1,
0.4145547, -1.084338, 3.928052, 0.08627451, 0, 1, 1,
0.4154434, 0.08254243, 2.966398, 0.09019608, 0, 1, 1,
0.4197398, 1.149652, 1.314727, 0.09803922, 0, 1, 1,
0.4283839, 0.8211844, 1.221417, 0.1058824, 0, 1, 1,
0.4324768, 1.288097, 1.38081, 0.1098039, 0, 1, 1,
0.4326558, -0.5784667, 2.228637, 0.1176471, 0, 1, 1,
0.4378985, -0.5026262, 2.341518, 0.1215686, 0, 1, 1,
0.4439264, -0.3466576, 2.112763, 0.1294118, 0, 1, 1,
0.4466573, -0.9231481, 3.571715, 0.1333333, 0, 1, 1,
0.4469891, 0.1680502, 2.534359, 0.1411765, 0, 1, 1,
0.4517297, -1.739147, 3.862598, 0.145098, 0, 1, 1,
0.4579033, 0.1046067, 0.3116159, 0.1529412, 0, 1, 1,
0.4579971, -1.453506, 2.874313, 0.1568628, 0, 1, 1,
0.4613536, -1.21095, 0.872919, 0.1647059, 0, 1, 1,
0.4658409, -0.6809461, 2.408672, 0.1686275, 0, 1, 1,
0.4668796, -1.252343, 2.502494, 0.1764706, 0, 1, 1,
0.4686072, 0.9355305, 0.4303287, 0.1803922, 0, 1, 1,
0.4691604, -0.04677453, 3.313619, 0.1882353, 0, 1, 1,
0.4729731, 0.7510943, 1.253817, 0.1921569, 0, 1, 1,
0.4816765, -1.107015, 2.27684, 0.2, 0, 1, 1,
0.5135732, -0.6228123, 3.091852, 0.2078431, 0, 1, 1,
0.5166556, 0.4091044, 1.011509, 0.2117647, 0, 1, 1,
0.5198218, -1.021071, 3.388329, 0.2196078, 0, 1, 1,
0.5206277, 0.8060157, 0.159383, 0.2235294, 0, 1, 1,
0.5221299, 1.843753, -1.454446, 0.2313726, 0, 1, 1,
0.5244463, -0.7285953, 3.195572, 0.2352941, 0, 1, 1,
0.5255114, -0.6080686, 2.952486, 0.2431373, 0, 1, 1,
0.5261563, -0.7229651, 1.960706, 0.2470588, 0, 1, 1,
0.5280318, 0.7275882, 1.067129, 0.254902, 0, 1, 1,
0.5331304, -1.118575, 2.754856, 0.2588235, 0, 1, 1,
0.5351824, 0.336982, 1.059698, 0.2666667, 0, 1, 1,
0.5360203, 0.4350043, 2.875086, 0.2705882, 0, 1, 1,
0.5506166, -0.9451447, 1.90681, 0.2784314, 0, 1, 1,
0.5523731, -0.04836684, 1.433721, 0.282353, 0, 1, 1,
0.5535296, 0.3082959, 1.579319, 0.2901961, 0, 1, 1,
0.5541398, 1.965907, 0.2097304, 0.2941177, 0, 1, 1,
0.5613106, -0.7291254, 1.932134, 0.3019608, 0, 1, 1,
0.568615, -0.305342, 2.960791, 0.3098039, 0, 1, 1,
0.5693743, -0.3118458, 3.19658, 0.3137255, 0, 1, 1,
0.575197, 0.09292241, 0.9536836, 0.3215686, 0, 1, 1,
0.575671, -0.5623913, 1.789495, 0.3254902, 0, 1, 1,
0.5770316, -0.1679734, 3.011315, 0.3333333, 0, 1, 1,
0.5774992, 0.5794475, 1.803655, 0.3372549, 0, 1, 1,
0.5781127, 1.514928, -1.056709, 0.345098, 0, 1, 1,
0.5834471, 0.1345729, 3.221425, 0.3490196, 0, 1, 1,
0.5835479, 1.014373, 1.897453, 0.3568628, 0, 1, 1,
0.5857913, -1.367111, 2.179509, 0.3607843, 0, 1, 1,
0.5889527, 0.2470222, 0.3242413, 0.3686275, 0, 1, 1,
0.5894489, -0.187089, 1.696809, 0.372549, 0, 1, 1,
0.5898149, 0.3591345, 0.3780509, 0.3803922, 0, 1, 1,
0.5904911, -1.855295, 3.556742, 0.3843137, 0, 1, 1,
0.5914903, -0.5216787, 3.560963, 0.3921569, 0, 1, 1,
0.5915782, -0.6168112, 3.758002, 0.3960784, 0, 1, 1,
0.592261, 0.8630142, -0.221786, 0.4039216, 0, 1, 1,
0.5939389, -1.85027, 2.070594, 0.4117647, 0, 1, 1,
0.5953858, 0.5472102, 0.5894002, 0.4156863, 0, 1, 1,
0.5959955, 1.575651, 0.06441457, 0.4235294, 0, 1, 1,
0.597234, -1.000826, 4.01122, 0.427451, 0, 1, 1,
0.5986441, -2.077613, 0.871769, 0.4352941, 0, 1, 1,
0.598921, 0.3218941, 0.08966526, 0.4392157, 0, 1, 1,
0.6002386, -0.9984232, 0.9011683, 0.4470588, 0, 1, 1,
0.6081681, -0.5073171, 0.4758797, 0.4509804, 0, 1, 1,
0.6083007, 0.4702209, 0.184935, 0.4588235, 0, 1, 1,
0.6084874, 0.1262774, 1.300668, 0.4627451, 0, 1, 1,
0.6087014, 1.088944, 1.167967, 0.4705882, 0, 1, 1,
0.6113215, 0.2302376, 0.9044235, 0.4745098, 0, 1, 1,
0.6202881, 1.096836, 1.530155, 0.4823529, 0, 1, 1,
0.6294104, -1.754266, 1.599696, 0.4862745, 0, 1, 1,
0.6400472, 0.6456367, 0.3274003, 0.4941176, 0, 1, 1,
0.6455233, 0.07262007, -0.2953602, 0.5019608, 0, 1, 1,
0.6509346, -0.7372294, 3.256989, 0.5058824, 0, 1, 1,
0.6560872, 1.134712, -1.064316, 0.5137255, 0, 1, 1,
0.6587337, -0.5067189, 1.194414, 0.5176471, 0, 1, 1,
0.6588709, -0.5779005, 1.13532, 0.5254902, 0, 1, 1,
0.6642296, 1.282791, 3.096088, 0.5294118, 0, 1, 1,
0.6684229, -0.274043, 2.652876, 0.5372549, 0, 1, 1,
0.6693256, -0.5906683, 2.449785, 0.5411765, 0, 1, 1,
0.6699601, -0.4371895, 2.349683, 0.5490196, 0, 1, 1,
0.690477, 0.8938369, 0.2928659, 0.5529412, 0, 1, 1,
0.6944818, -0.07274913, 2.420126, 0.5607843, 0, 1, 1,
0.7039941, -0.8844742, 2.77777, 0.5647059, 0, 1, 1,
0.7051353, 0.06663799, 1.010224, 0.572549, 0, 1, 1,
0.7083004, -0.1113645, 0.9837441, 0.5764706, 0, 1, 1,
0.7141998, 1.176123, -0.4037376, 0.5843138, 0, 1, 1,
0.7153747, 0.4506443, 0.79061, 0.5882353, 0, 1, 1,
0.719644, -0.6771718, 3.199343, 0.5960785, 0, 1, 1,
0.72914, 0.7928001, 1.428583, 0.6039216, 0, 1, 1,
0.735533, 0.8612398, -0.690671, 0.6078432, 0, 1, 1,
0.737655, -0.2928228, 1.595312, 0.6156863, 0, 1, 1,
0.7391163, -0.4488265, 2.296435, 0.6196079, 0, 1, 1,
0.7473254, 0.6744555, 2.183581, 0.627451, 0, 1, 1,
0.7486017, -0.8057234, 3.008117, 0.6313726, 0, 1, 1,
0.7505196, 0.5949323, 1.553854, 0.6392157, 0, 1, 1,
0.7549199, 1.251217, 1.728321, 0.6431373, 0, 1, 1,
0.7551766, 0.2362646, 0.8949107, 0.6509804, 0, 1, 1,
0.7558591, 0.3131006, -0.3118148, 0.654902, 0, 1, 1,
0.7609428, 0.1502798, 1.281631, 0.6627451, 0, 1, 1,
0.7635783, -1.032306, 1.531164, 0.6666667, 0, 1, 1,
0.768711, 0.55241, 1.224488, 0.6745098, 0, 1, 1,
0.7700737, 0.1136122, 2.40804, 0.6784314, 0, 1, 1,
0.7796033, -1.546404, 3.206367, 0.6862745, 0, 1, 1,
0.7834929, 1.965126, 1.05244, 0.6901961, 0, 1, 1,
0.7836261, 0.5849805, 2.209908, 0.6980392, 0, 1, 1,
0.7880573, 1.635037, 0.668909, 0.7058824, 0, 1, 1,
0.7920292, -1.997064, 1.936992, 0.7098039, 0, 1, 1,
0.7954211, 0.3643824, 1.256398, 0.7176471, 0, 1, 1,
0.7963809, -0.7860172, 1.759554, 0.7215686, 0, 1, 1,
0.8088627, 0.6980616, 1.098327, 0.7294118, 0, 1, 1,
0.8154472, 0.7208309, 0.9502577, 0.7333333, 0, 1, 1,
0.8180398, 0.8198823, -0.7515959, 0.7411765, 0, 1, 1,
0.8187593, 0.08959986, 0.6530873, 0.7450981, 0, 1, 1,
0.8202279, 0.02743582, 2.362092, 0.7529412, 0, 1, 1,
0.8252336, -0.9640489, 2.494087, 0.7568628, 0, 1, 1,
0.8256075, -0.2072876, 2.799171, 0.7647059, 0, 1, 1,
0.8276371, -0.4113834, 0.9013284, 0.7686275, 0, 1, 1,
0.8290026, -1.104355, 3.396017, 0.7764706, 0, 1, 1,
0.8334181, 0.7181411, 0.8320959, 0.7803922, 0, 1, 1,
0.8335809, -0.09688342, 2.712015, 0.7882353, 0, 1, 1,
0.8341389, -0.2498642, 4.047742, 0.7921569, 0, 1, 1,
0.8354059, -1.633008, 3.465293, 0.8, 0, 1, 1,
0.8383108, 0.05045234, 1.14348, 0.8078431, 0, 1, 1,
0.8403386, -0.4363146, 1.624832, 0.8117647, 0, 1, 1,
0.8439751, 0.7607468, 0.6058492, 0.8196079, 0, 1, 1,
0.84795, 2.033802, 1.584362, 0.8235294, 0, 1, 1,
0.8493389, 0.02804073, 0.7610208, 0.8313726, 0, 1, 1,
0.8494706, 2.217457, 0.6531268, 0.8352941, 0, 1, 1,
0.8553388, 1.352126, 0.2772585, 0.8431373, 0, 1, 1,
0.8554393, -0.6155917, 2.213355, 0.8470588, 0, 1, 1,
0.8637369, -0.3235144, 1.989312, 0.854902, 0, 1, 1,
0.8719758, 2.032811, 2.441128, 0.8588235, 0, 1, 1,
0.8749909, 1.097056, 0.1739395, 0.8666667, 0, 1, 1,
0.8807242, 0.4367762, 0.7810127, 0.8705882, 0, 1, 1,
0.8923911, -0.09233788, -0.03953392, 0.8784314, 0, 1, 1,
0.8933088, -0.5577979, 2.818901, 0.8823529, 0, 1, 1,
0.8940467, 1.326363, 0.05922786, 0.8901961, 0, 1, 1,
0.8964105, 1.381168, -2.380359, 0.8941177, 0, 1, 1,
0.9033161, 1.079107, -1.197646, 0.9019608, 0, 1, 1,
0.9069576, -0.847398, 1.894062, 0.9098039, 0, 1, 1,
0.908766, -0.1966666, 2.257676, 0.9137255, 0, 1, 1,
0.9091343, -0.1752252, 3.221369, 0.9215686, 0, 1, 1,
0.9120901, 0.03402337, 1.645347, 0.9254902, 0, 1, 1,
0.9149007, 0.5024682, -0.6425077, 0.9333333, 0, 1, 1,
0.9193452, 1.753738, -0.5326841, 0.9372549, 0, 1, 1,
0.9238312, -0.005543126, 2.697684, 0.945098, 0, 1, 1,
0.9272825, -1.439911, 2.664861, 0.9490196, 0, 1, 1,
0.9284602, 0.06542449, 1.337086, 0.9568627, 0, 1, 1,
0.9287438, -1.709765, 2.469081, 0.9607843, 0, 1, 1,
0.9296468, -0.2978427, 1.915583, 0.9686275, 0, 1, 1,
0.9355275, -1.073883, 1.555286, 0.972549, 0, 1, 1,
0.9449145, -0.0862392, 1.364698, 0.9803922, 0, 1, 1,
0.9468514, -1.778926, 2.688496, 0.9843137, 0, 1, 1,
0.9484923, 0.2234581, -0.6947864, 0.9921569, 0, 1, 1,
0.9538431, 0.1601467, 2.879266, 0.9960784, 0, 1, 1,
0.9585656, -0.8679333, 3.530793, 1, 0, 0.9960784, 1,
0.959226, -0.6161029, 1.025167, 1, 0, 0.9882353, 1,
0.9602925, -0.2036002, 2.39228, 1, 0, 0.9843137, 1,
0.9608331, 1.071428, -0.134712, 1, 0, 0.9764706, 1,
0.9680384, 1.879633, 0.964862, 1, 0, 0.972549, 1,
0.9764055, 1.945412, 0.80855, 1, 0, 0.9647059, 1,
0.9810628, -2.036699, 2.274013, 1, 0, 0.9607843, 1,
0.9867743, 0.7591336, -0.4312441, 1, 0, 0.9529412, 1,
0.9880857, -0.7189164, 2.83821, 1, 0, 0.9490196, 1,
0.9892197, 0.2874926, 1.360309, 1, 0, 0.9411765, 1,
0.9972275, -0.4149644, 3.256839, 1, 0, 0.9372549, 1,
0.998543, 1.336959, 2.6495, 1, 0, 0.9294118, 1,
1.001389, 1.102414, 0.7217617, 1, 0, 0.9254902, 1,
1.002152, -1.802091, -0.04197665, 1, 0, 0.9176471, 1,
1.005817, -1.444148, 1.893039, 1, 0, 0.9137255, 1,
1.013468, -0.7009497, 1.064768, 1, 0, 0.9058824, 1,
1.017289, -0.2022467, 2.633976, 1, 0, 0.9019608, 1,
1.018451, -1.209712, 3.153913, 1, 0, 0.8941177, 1,
1.018517, -0.2592521, 2.602284, 1, 0, 0.8862745, 1,
1.019298, 0.6589051, 0.3141085, 1, 0, 0.8823529, 1,
1.023277, -0.7478723, -1.268982, 1, 0, 0.8745098, 1,
1.024588, 0.1192652, 1.562895, 1, 0, 0.8705882, 1,
1.024727, -1.569556, 2.130357, 1, 0, 0.8627451, 1,
1.028122, 0.9441304, 0.6137482, 1, 0, 0.8588235, 1,
1.030011, -1.066926, 1.605965, 1, 0, 0.8509804, 1,
1.036843, -0.8895848, 1.412918, 1, 0, 0.8470588, 1,
1.044619, -0.1175208, 3.045095, 1, 0, 0.8392157, 1,
1.045492, 1.34594, 1.700986, 1, 0, 0.8352941, 1,
1.047292, -1.547001, 3.96771, 1, 0, 0.827451, 1,
1.048158, 0.7646783, 3.558258, 1, 0, 0.8235294, 1,
1.056589, -1.915206, 3.305758, 1, 0, 0.8156863, 1,
1.064021, 0.1095613, -0.3950804, 1, 0, 0.8117647, 1,
1.064658, -0.264318, 3.829467, 1, 0, 0.8039216, 1,
1.075459, -0.2281009, 1.64926, 1, 0, 0.7960784, 1,
1.079296, 0.01605287, 1.682087, 1, 0, 0.7921569, 1,
1.079767, -0.3698381, 2.213496, 1, 0, 0.7843137, 1,
1.082058, 0.5704964, 0.3977295, 1, 0, 0.7803922, 1,
1.089595, 0.6374888, 2.213019, 1, 0, 0.772549, 1,
1.090499, -0.812484, 2.766629, 1, 0, 0.7686275, 1,
1.099636, -0.5814131, 1.236819, 1, 0, 0.7607843, 1,
1.102526, 0.1943102, 1.043736, 1, 0, 0.7568628, 1,
1.107095, 2.199643, -0.8757378, 1, 0, 0.7490196, 1,
1.111158, -0.9593925, 1.430449, 1, 0, 0.7450981, 1,
1.113947, 0.08252507, 2.393852, 1, 0, 0.7372549, 1,
1.119548, -0.09725944, 1.27885, 1, 0, 0.7333333, 1,
1.120484, 1.633218, 1.118743, 1, 0, 0.7254902, 1,
1.1254, 1.647722, 0.2205229, 1, 0, 0.7215686, 1,
1.128796, 0.4230078, 1.031772, 1, 0, 0.7137255, 1,
1.143207, 0.09223805, 1.358355, 1, 0, 0.7098039, 1,
1.143528, 0.5052838, 0.9411767, 1, 0, 0.7019608, 1,
1.146257, -0.4502833, 1.700642, 1, 0, 0.6941177, 1,
1.15006, -0.7281766, 0.8255664, 1, 0, 0.6901961, 1,
1.151738, -1.77108, 4.348754, 1, 0, 0.682353, 1,
1.153951, -1.197015, 0.999944, 1, 0, 0.6784314, 1,
1.164219, 0.8221714, -0.3235538, 1, 0, 0.6705883, 1,
1.170286, -0.3284963, 3.33558, 1, 0, 0.6666667, 1,
1.175019, -0.08231238, 3.085812, 1, 0, 0.6588235, 1,
1.180397, -0.372705, 0.619181, 1, 0, 0.654902, 1,
1.194736, -0.5183922, 3.492448, 1, 0, 0.6470588, 1,
1.198368, -1.540211, 1.535642, 1, 0, 0.6431373, 1,
1.211099, -1.253167, 2.702813, 1, 0, 0.6352941, 1,
1.22269, 0.9293186, 1.733505, 1, 0, 0.6313726, 1,
1.247115, -1.300383, 2.65584, 1, 0, 0.6235294, 1,
1.248111, -0.20832, 0.3274523, 1, 0, 0.6196079, 1,
1.275606, -1.315801, 1.129236, 1, 0, 0.6117647, 1,
1.279332, -0.241064, 0.2433083, 1, 0, 0.6078432, 1,
1.286478, -1.045132, 3.132774, 1, 0, 0.6, 1,
1.291286, 0.1602304, -0.5312631, 1, 0, 0.5921569, 1,
1.306895, 0.8709706, 1.454935, 1, 0, 0.5882353, 1,
1.307391, -0.8310368, 4.989935, 1, 0, 0.5803922, 1,
1.308956, 1.38044, 0.8459768, 1, 0, 0.5764706, 1,
1.311477, 1.548699, -1.567642, 1, 0, 0.5686275, 1,
1.31399, -0.3707884, 2.60139, 1, 0, 0.5647059, 1,
1.314445, -1.104009, 1.766181, 1, 0, 0.5568628, 1,
1.316579, -1.187655, 1.671274, 1, 0, 0.5529412, 1,
1.327384, 0.5133685, 3.281248, 1, 0, 0.5450981, 1,
1.337973, 0.67686, 0.5472404, 1, 0, 0.5411765, 1,
1.338225, 0.7223775, 2.203431, 1, 0, 0.5333334, 1,
1.338795, 1.482805, 1.648031, 1, 0, 0.5294118, 1,
1.339366, -1.15151, 2.317036, 1, 0, 0.5215687, 1,
1.342746, 0.008046666, 2.797302, 1, 0, 0.5176471, 1,
1.349558, -0.7140808, 4.216333, 1, 0, 0.509804, 1,
1.350952, -0.01390299, 2.696468, 1, 0, 0.5058824, 1,
1.353121, -1.324795, 3.21769, 1, 0, 0.4980392, 1,
1.359483, -0.6660696, 1.708803, 1, 0, 0.4901961, 1,
1.377019, -1.713059, 1.167441, 1, 0, 0.4862745, 1,
1.379521, 1.637231, 0.4735946, 1, 0, 0.4784314, 1,
1.391566, 0.5805033, 1.654022, 1, 0, 0.4745098, 1,
1.417434, 0.6533546, -0.1082269, 1, 0, 0.4666667, 1,
1.417676, -1.259436, 0.2898895, 1, 0, 0.4627451, 1,
1.422286, -0.9825416, 2.477556, 1, 0, 0.454902, 1,
1.438422, 0.605278, -0.6083374, 1, 0, 0.4509804, 1,
1.444088, 0.01172417, 2.011958, 1, 0, 0.4431373, 1,
1.46257, 0.3095008, -0.2110305, 1, 0, 0.4392157, 1,
1.462985, -1.618081, 2.692993, 1, 0, 0.4313726, 1,
1.476257, -0.6028896, 3.756911, 1, 0, 0.427451, 1,
1.480986, 0.3814604, 1.937213, 1, 0, 0.4196078, 1,
1.487877, 0.1107322, 2.288156, 1, 0, 0.4156863, 1,
1.487946, -1.210923, 2.768024, 1, 0, 0.4078431, 1,
1.49219, -1.614769, 2.265431, 1, 0, 0.4039216, 1,
1.513831, -1.743906, 2.548227, 1, 0, 0.3960784, 1,
1.522268, -0.7621015, 0.5146751, 1, 0, 0.3882353, 1,
1.534367, 0.4292857, 1.956626, 1, 0, 0.3843137, 1,
1.541853, -0.102388, 1.137596, 1, 0, 0.3764706, 1,
1.560681, 0.5791947, 2.667536, 1, 0, 0.372549, 1,
1.56183, 1.150882, 0.5410345, 1, 0, 0.3647059, 1,
1.583338, -0.1519222, 2.12999, 1, 0, 0.3607843, 1,
1.589691, -0.328195, 1.742044, 1, 0, 0.3529412, 1,
1.592738, -0.5884755, 0.4181897, 1, 0, 0.3490196, 1,
1.593299, -0.2724975, 1.333293, 1, 0, 0.3411765, 1,
1.593723, 0.02959479, 1.42389, 1, 0, 0.3372549, 1,
1.60254, -0.5058918, 2.167802, 1, 0, 0.3294118, 1,
1.611602, 0.6478017, 1.906139, 1, 0, 0.3254902, 1,
1.617988, -1.52779, 1.132239, 1, 0, 0.3176471, 1,
1.619089, -0.1139836, 0.9774174, 1, 0, 0.3137255, 1,
1.628475, 0.8211925, -0.08388594, 1, 0, 0.3058824, 1,
1.646232, 2.821322, 1.331349, 1, 0, 0.2980392, 1,
1.647576, 0.4705974, 2.546632, 1, 0, 0.2941177, 1,
1.652781, -0.6430353, 2.688153, 1, 0, 0.2862745, 1,
1.66114, 0.5598666, 0.291876, 1, 0, 0.282353, 1,
1.663117, 1.492617, 1.775402, 1, 0, 0.2745098, 1,
1.663544, -1.354941, 3.102935, 1, 0, 0.2705882, 1,
1.69286, 0.6697214, -1.122625, 1, 0, 0.2627451, 1,
1.700787, -0.7755136, 0.7840182, 1, 0, 0.2588235, 1,
1.712452, 0.5694751, 2.859159, 1, 0, 0.2509804, 1,
1.714922, -0.38539, 2.067971, 1, 0, 0.2470588, 1,
1.719624, -0.02428064, 1.855496, 1, 0, 0.2392157, 1,
1.720511, -0.719682, 1.624019, 1, 0, 0.2352941, 1,
1.733597, -0.6014384, 0.8470911, 1, 0, 0.227451, 1,
1.736069, 0.2363512, 1.03676, 1, 0, 0.2235294, 1,
1.74289, 1.293425, 1.710678, 1, 0, 0.2156863, 1,
1.766897, -1.388653, 2.696739, 1, 0, 0.2117647, 1,
1.772278, -0.4742517, 1.316872, 1, 0, 0.2039216, 1,
1.793697, 1.239756, 0.01083872, 1, 0, 0.1960784, 1,
1.841688, -0.6500075, 1.907403, 1, 0, 0.1921569, 1,
1.84402, -0.5589147, 1.28308, 1, 0, 0.1843137, 1,
1.871594, -1.131038, 2.777629, 1, 0, 0.1803922, 1,
1.871607, 0.2126329, 2.098526, 1, 0, 0.172549, 1,
1.876141, -1.2885, 1.817059, 1, 0, 0.1686275, 1,
1.876174, -1.001252, 3.649421, 1, 0, 0.1607843, 1,
1.903236, -0.1990759, 2.061054, 1, 0, 0.1568628, 1,
1.904685, -1.537293, 2.407279, 1, 0, 0.1490196, 1,
1.961045, -0.05198529, 0.6438524, 1, 0, 0.145098, 1,
1.989121, -0.1785704, 0.9731752, 1, 0, 0.1372549, 1,
1.999534, -0.5585434, 2.10126, 1, 0, 0.1333333, 1,
2.010561, 1.81276, 2.074595, 1, 0, 0.1254902, 1,
2.055475, 0.3195806, 2.950275, 1, 0, 0.1215686, 1,
2.065875, 0.2169288, 2.243949, 1, 0, 0.1137255, 1,
2.108531, 2.463356, 2.350257, 1, 0, 0.1098039, 1,
2.12254, 0.5080462, 0.9892373, 1, 0, 0.1019608, 1,
2.145959, -0.4760258, 1.375746, 1, 0, 0.09411765, 1,
2.158409, -0.4168575, 1.126953, 1, 0, 0.09019608, 1,
2.167967, -0.1159049, 3.205954, 1, 0, 0.08235294, 1,
2.206214, 0.3748013, 1.09958, 1, 0, 0.07843138, 1,
2.221694, 0.5624993, 1.832145, 1, 0, 0.07058824, 1,
2.326475, -0.07321668, 1.889108, 1, 0, 0.06666667, 1,
2.447953, 0.5275297, 1.394027, 1, 0, 0.05882353, 1,
2.515688, -0.7158651, 0.8231014, 1, 0, 0.05490196, 1,
2.533784, 0.1052809, 0.6173943, 1, 0, 0.04705882, 1,
2.605838, -1.763335, 1.811843, 1, 0, 0.04313726, 1,
2.671876, -0.5229702, 1.205124, 1, 0, 0.03529412, 1,
2.967248, 0.3742896, 2.343591, 1, 0, 0.03137255, 1,
3.121279, -1.150381, 1.9285, 1, 0, 0.02352941, 1,
3.210113, -1.095521, 2.461807, 1, 0, 0.01960784, 1,
3.225902, -0.4844668, 1.781745, 1, 0, 0.01176471, 1,
4.27937, 2.203255, 1.383643, 1, 0, 0.007843138, 1
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
0.6464276, -3.665742, -7.98499, 0, -0.5, 0.5, 0.5,
0.6464276, -3.665742, -7.98499, 1, -0.5, 0.5, 0.5,
0.6464276, -3.665742, -7.98499, 1, 1.5, 0.5, 0.5,
0.6464276, -3.665742, -7.98499, 0, 1.5, 0.5, 0.5
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
-4.218082, 0.05153918, -7.98499, 0, -0.5, 0.5, 0.5,
-4.218082, 0.05153918, -7.98499, 1, -0.5, 0.5, 0.5,
-4.218082, 0.05153918, -7.98499, 1, 1.5, 0.5, 0.5,
-4.218082, 0.05153918, -7.98499, 0, 1.5, 0.5, 0.5
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
-4.218082, -3.665742, -0.2734723, 0, -0.5, 0.5, 0.5,
-4.218082, -3.665742, -0.2734723, 1, -0.5, 0.5, 0.5,
-4.218082, -3.665742, -0.2734723, 1, 1.5, 0.5, 0.5,
-4.218082, -3.665742, -0.2734723, 0, 1.5, 0.5, 0.5
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
-2, -2.807908, -6.205409,
4, -2.807908, -6.205409,
-2, -2.807908, -6.205409,
-2, -2.950881, -6.502006,
0, -2.807908, -6.205409,
0, -2.950881, -6.502006,
2, -2.807908, -6.205409,
2, -2.950881, -6.502006,
4, -2.807908, -6.205409,
4, -2.950881, -6.502006
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
"2",
"4"
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
-2, -3.236825, -7.095199, 0, -0.5, 0.5, 0.5,
-2, -3.236825, -7.095199, 1, -0.5, 0.5, 0.5,
-2, -3.236825, -7.095199, 1, 1.5, 0.5, 0.5,
-2, -3.236825, -7.095199, 0, 1.5, 0.5, 0.5,
0, -3.236825, -7.095199, 0, -0.5, 0.5, 0.5,
0, -3.236825, -7.095199, 1, -0.5, 0.5, 0.5,
0, -3.236825, -7.095199, 1, 1.5, 0.5, 0.5,
0, -3.236825, -7.095199, 0, 1.5, 0.5, 0.5,
2, -3.236825, -7.095199, 0, -0.5, 0.5, 0.5,
2, -3.236825, -7.095199, 1, -0.5, 0.5, 0.5,
2, -3.236825, -7.095199, 1, 1.5, 0.5, 0.5,
2, -3.236825, -7.095199, 0, 1.5, 0.5, 0.5,
4, -3.236825, -7.095199, 0, -0.5, 0.5, 0.5,
4, -3.236825, -7.095199, 1, -0.5, 0.5, 0.5,
4, -3.236825, -7.095199, 1, 1.5, 0.5, 0.5,
4, -3.236825, -7.095199, 0, 1.5, 0.5, 0.5
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
-3.095503, -2, -6.205409,
-3.095503, 2, -6.205409,
-3.095503, -2, -6.205409,
-3.282599, -2, -6.502006,
-3.095503, -1, -6.205409,
-3.282599, -1, -6.502006,
-3.095503, 0, -6.205409,
-3.282599, 0, -6.502006,
-3.095503, 1, -6.205409,
-3.282599, 1, -6.502006,
-3.095503, 2, -6.205409,
-3.282599, 2, -6.502006
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
-3.656792, -2, -7.095199, 0, -0.5, 0.5, 0.5,
-3.656792, -2, -7.095199, 1, -0.5, 0.5, 0.5,
-3.656792, -2, -7.095199, 1, 1.5, 0.5, 0.5,
-3.656792, -2, -7.095199, 0, 1.5, 0.5, 0.5,
-3.656792, -1, -7.095199, 0, -0.5, 0.5, 0.5,
-3.656792, -1, -7.095199, 1, -0.5, 0.5, 0.5,
-3.656792, -1, -7.095199, 1, 1.5, 0.5, 0.5,
-3.656792, -1, -7.095199, 0, 1.5, 0.5, 0.5,
-3.656792, 0, -7.095199, 0, -0.5, 0.5, 0.5,
-3.656792, 0, -7.095199, 1, -0.5, 0.5, 0.5,
-3.656792, 0, -7.095199, 1, 1.5, 0.5, 0.5,
-3.656792, 0, -7.095199, 0, 1.5, 0.5, 0.5,
-3.656792, 1, -7.095199, 0, -0.5, 0.5, 0.5,
-3.656792, 1, -7.095199, 1, -0.5, 0.5, 0.5,
-3.656792, 1, -7.095199, 1, 1.5, 0.5, 0.5,
-3.656792, 1, -7.095199, 0, 1.5, 0.5, 0.5,
-3.656792, 2, -7.095199, 0, -0.5, 0.5, 0.5,
-3.656792, 2, -7.095199, 1, -0.5, 0.5, 0.5,
-3.656792, 2, -7.095199, 1, 1.5, 0.5, 0.5,
-3.656792, 2, -7.095199, 0, 1.5, 0.5, 0.5
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
-3.095503, -2.807908, -6,
-3.095503, -2.807908, 4,
-3.095503, -2.807908, -6,
-3.282599, -2.950881, -6,
-3.095503, -2.807908, -4,
-3.282599, -2.950881, -4,
-3.095503, -2.807908, -2,
-3.282599, -2.950881, -2,
-3.095503, -2.807908, 0,
-3.282599, -2.950881, 0,
-3.095503, -2.807908, 2,
-3.282599, -2.950881, 2,
-3.095503, -2.807908, 4,
-3.282599, -2.950881, 4
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
"-6",
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
-3.656792, -3.236825, -6, 0, -0.5, 0.5, 0.5,
-3.656792, -3.236825, -6, 1, -0.5, 0.5, 0.5,
-3.656792, -3.236825, -6, 1, 1.5, 0.5, 0.5,
-3.656792, -3.236825, -6, 0, 1.5, 0.5, 0.5,
-3.656792, -3.236825, -4, 0, -0.5, 0.5, 0.5,
-3.656792, -3.236825, -4, 1, -0.5, 0.5, 0.5,
-3.656792, -3.236825, -4, 1, 1.5, 0.5, 0.5,
-3.656792, -3.236825, -4, 0, 1.5, 0.5, 0.5,
-3.656792, -3.236825, -2, 0, -0.5, 0.5, 0.5,
-3.656792, -3.236825, -2, 1, -0.5, 0.5, 0.5,
-3.656792, -3.236825, -2, 1, 1.5, 0.5, 0.5,
-3.656792, -3.236825, -2, 0, 1.5, 0.5, 0.5,
-3.656792, -3.236825, 0, 0, -0.5, 0.5, 0.5,
-3.656792, -3.236825, 0, 1, -0.5, 0.5, 0.5,
-3.656792, -3.236825, 0, 1, 1.5, 0.5, 0.5,
-3.656792, -3.236825, 0, 0, 1.5, 0.5, 0.5,
-3.656792, -3.236825, 2, 0, -0.5, 0.5, 0.5,
-3.656792, -3.236825, 2, 1, -0.5, 0.5, 0.5,
-3.656792, -3.236825, 2, 1, 1.5, 0.5, 0.5,
-3.656792, -3.236825, 2, 0, 1.5, 0.5, 0.5,
-3.656792, -3.236825, 4, 0, -0.5, 0.5, 0.5,
-3.656792, -3.236825, 4, 1, -0.5, 0.5, 0.5,
-3.656792, -3.236825, 4, 1, 1.5, 0.5, 0.5,
-3.656792, -3.236825, 4, 0, 1.5, 0.5, 0.5
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
-3.095503, -2.807908, -6.205409,
-3.095503, 2.910986, -6.205409,
-3.095503, -2.807908, 5.658464,
-3.095503, 2.910986, 5.658464,
-3.095503, -2.807908, -6.205409,
-3.095503, -2.807908, 5.658464,
-3.095503, 2.910986, -6.205409,
-3.095503, 2.910986, 5.658464,
-3.095503, -2.807908, -6.205409,
4.388358, -2.807908, -6.205409,
-3.095503, -2.807908, 5.658464,
4.388358, -2.807908, 5.658464,
-3.095503, 2.910986, -6.205409,
4.388358, 2.910986, -6.205409,
-3.095503, 2.910986, 5.658464,
4.388358, 2.910986, 5.658464,
4.388358, -2.807908, -6.205409,
4.388358, 2.910986, -6.205409,
4.388358, -2.807908, 5.658464,
4.388358, 2.910986, 5.658464,
4.388358, -2.807908, -6.205409,
4.388358, -2.807908, 5.658464,
4.388358, 2.910986, -6.205409,
4.388358, 2.910986, 5.658464
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
var radius = 8.0888;
var distance = 35.98798;
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
mvMatrix.translate( -0.6464276, -0.05153918, 0.2734723 );
mvMatrix.scale( 1.168617, 1.529276, 0.7371765 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98798);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
cycloate<-read.table("cycloate.xyz")
```

```
## Error in read.table("cycloate.xyz"): no lines available in input
```

```r
x<-cycloate$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycloate' not found
```

```r
y<-cycloate$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycloate' not found
```

```r
z<-cycloate$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycloate' not found
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
-2.986515, 2.419102, -0.6581233, 0, 0, 1, 1, 1,
-2.752892, -1.114327, -1.251809, 1, 0, 0, 1, 1,
-2.537806, 0.7114625, -0.7232596, 1, 0, 0, 1, 1,
-2.514868, -0.285408, -0.9987409, 1, 0, 0, 1, 1,
-2.474081, -1.650393, -1.485514, 1, 0, 0, 1, 1,
-2.421581, 0.5417975, -1.617016, 1, 0, 0, 1, 1,
-2.393824, -0.4647822, -1.049588, 0, 0, 0, 1, 1,
-2.342267, -0.7221401, -0.809628, 0, 0, 0, 1, 1,
-2.231566, 1.499014, 2.247397, 0, 0, 0, 1, 1,
-2.231541, 0.4123086, -0.8773453, 0, 0, 0, 1, 1,
-2.222305, -0.1604319, -0.4361723, 0, 0, 0, 1, 1,
-2.204336, -0.8496521, -2.512367, 0, 0, 0, 1, 1,
-2.165045, 0.7528262, -1.070062, 0, 0, 0, 1, 1,
-2.16062, -0.2974293, -1.108051, 1, 1, 1, 1, 1,
-2.156804, 1.529116, -0.3717607, 1, 1, 1, 1, 1,
-2.127521, -0.9602751, -1.200755, 1, 1, 1, 1, 1,
-2.092247, -0.677911, -2.633801, 1, 1, 1, 1, 1,
-2.046371, -0.01867381, -1.5303, 1, 1, 1, 1, 1,
-2.042819, -0.2516524, -0.8223737, 1, 1, 1, 1, 1,
-2.014587, 0.8235424, 0.1593764, 1, 1, 1, 1, 1,
-2.006562, -1.915859, -2.547851, 1, 1, 1, 1, 1,
-1.985714, 2.064895, -1.945053, 1, 1, 1, 1, 1,
-1.967907, -1.785191, -2.08621, 1, 1, 1, 1, 1,
-1.953224, 1.904423, 0.1399689, 1, 1, 1, 1, 1,
-1.945526, -0.01427671, -0.8127736, 1, 1, 1, 1, 1,
-1.936016, -0.5741681, -1.091984, 1, 1, 1, 1, 1,
-1.925069, -0.3071703, -1.798692, 1, 1, 1, 1, 1,
-1.911649, 0.9928241, -2.705355, 1, 1, 1, 1, 1,
-1.899136, -2.187265, -0.7947687, 0, 0, 1, 1, 1,
-1.877294, -2.724623, -2.000097, 1, 0, 0, 1, 1,
-1.866837, -0.3258736, -2.987115, 1, 0, 0, 1, 1,
-1.860414, -0.9182082, -1.078289, 1, 0, 0, 1, 1,
-1.853261, 1.46763, -1.38703, 1, 0, 0, 1, 1,
-1.840843, 0.9019108, -1.28689, 1, 0, 0, 1, 1,
-1.822131, 0.8120692, -2.135683, 0, 0, 0, 1, 1,
-1.82078, 0.6427168, -1.157924, 0, 0, 0, 1, 1,
-1.805586, -0.6024575, -1.063029, 0, 0, 0, 1, 1,
-1.803432, 0.1817245, -3.056981, 0, 0, 0, 1, 1,
-1.796914, 0.04783168, -1.135164, 0, 0, 0, 1, 1,
-1.795229, -0.03559554, -2.073013, 0, 0, 0, 1, 1,
-1.763669, 0.8797878, -0.1285336, 0, 0, 0, 1, 1,
-1.733472, 1.236217, -0.3438153, 1, 1, 1, 1, 1,
-1.732351, -0.6854652, -2.87447, 1, 1, 1, 1, 1,
-1.722166, -0.02591049, -2.209169, 1, 1, 1, 1, 1,
-1.721351, -1.51279, -2.950142, 1, 1, 1, 1, 1,
-1.69743, 2.517809, -0.4217513, 1, 1, 1, 1, 1,
-1.695119, 1.361452, -1.260631, 1, 1, 1, 1, 1,
-1.686611, -0.3100555, -2.267594, 1, 1, 1, 1, 1,
-1.670204, 2.690326, -0.1393725, 1, 1, 1, 1, 1,
-1.635429, 1.126904, 1.528334, 1, 1, 1, 1, 1,
-1.632053, 0.4724822, -1.265793, 1, 1, 1, 1, 1,
-1.627824, -1.03283, -2.472643, 1, 1, 1, 1, 1,
-1.624804, -0.6628067, -0.761767, 1, 1, 1, 1, 1,
-1.622097, -1.49192, -2.924365, 1, 1, 1, 1, 1,
-1.621567, -1.289685, -2.187486, 1, 1, 1, 1, 1,
-1.620626, 2.421785, -1.091344, 1, 1, 1, 1, 1,
-1.601282, -0.507974, -1.979078, 0, 0, 1, 1, 1,
-1.592189, 0.5845923, -0.1595079, 1, 0, 0, 1, 1,
-1.587991, -0.9454293, -1.19347, 1, 0, 0, 1, 1,
-1.566268, 1.576313, -1.533703, 1, 0, 0, 1, 1,
-1.554395, -0.3983386, -2.717502, 1, 0, 0, 1, 1,
-1.533447, -0.9737438, -1.28407, 1, 0, 0, 1, 1,
-1.530873, 0.1721182, -0.8007771, 0, 0, 0, 1, 1,
-1.527613, 0.869969, -0.3838868, 0, 0, 0, 1, 1,
-1.51411, -1.077659, -2.357102, 0, 0, 0, 1, 1,
-1.49872, -0.11683, -0.5337846, 0, 0, 0, 1, 1,
-1.490731, 1.35789, -0.7698603, 0, 0, 0, 1, 1,
-1.489729, -0.3962833, -1.067692, 0, 0, 0, 1, 1,
-1.477633, -0.6225899, -3.607683, 0, 0, 0, 1, 1,
-1.458748, 1.472205, -0.8063315, 1, 1, 1, 1, 1,
-1.436166, -2.021044, -5.248555, 1, 1, 1, 1, 1,
-1.417431, 1.705622, 0.6069697, 1, 1, 1, 1, 1,
-1.416738, 1.463041, -0.3976639, 1, 1, 1, 1, 1,
-1.406759, 1.863916, -2.531684, 1, 1, 1, 1, 1,
-1.403036, -0.1274125, -0.5989797, 1, 1, 1, 1, 1,
-1.401353, 0.2309483, -0.1996494, 1, 1, 1, 1, 1,
-1.396024, 1.08612, -0.3267418, 1, 1, 1, 1, 1,
-1.394631, 1.308637, -0.5301839, 1, 1, 1, 1, 1,
-1.392845, -0.3869048, -3.981323, 1, 1, 1, 1, 1,
-1.365128, -0.006998023, -2.833658, 1, 1, 1, 1, 1,
-1.355696, 0.08418072, -3.398136, 1, 1, 1, 1, 1,
-1.352531, 0.9364789, -0.6310486, 1, 1, 1, 1, 1,
-1.343868, 0.6614057, -2.258192, 1, 1, 1, 1, 1,
-1.334997, -0.5001416, -0.7639848, 1, 1, 1, 1, 1,
-1.332439, 0.8864658, -0.239411, 0, 0, 1, 1, 1,
-1.329699, -0.1888122, -0.4962479, 1, 0, 0, 1, 1,
-1.326017, -0.8476628, -2.126306, 1, 0, 0, 1, 1,
-1.322451, 1.485143, 1.29751, 1, 0, 0, 1, 1,
-1.315247, 2.371639, -1.805027, 1, 0, 0, 1, 1,
-1.310266, -0.7554466, -1.829131, 1, 0, 0, 1, 1,
-1.30714, 0.5076287, -0.508373, 0, 0, 0, 1, 1,
-1.300021, 1.314364, 0.08996673, 0, 0, 0, 1, 1,
-1.297304, -1.782053, -0.9783688, 0, 0, 0, 1, 1,
-1.279013, -1.191034, -1.380665, 0, 0, 0, 1, 1,
-1.267514, 0.2047635, -1.270725, 0, 0, 0, 1, 1,
-1.258304, 1.052769, -0.8697669, 0, 0, 0, 1, 1,
-1.25227, -0.08289651, -1.202765, 0, 0, 0, 1, 1,
-1.245452, 1.894861, -1.881487, 1, 1, 1, 1, 1,
-1.245309, 1.011653, -0.6898801, 1, 1, 1, 1, 1,
-1.232599, 2.405546, -1.404107, 1, 1, 1, 1, 1,
-1.231736, 1.214079, -1.622608, 1, 1, 1, 1, 1,
-1.226676, -0.9169509, -3.002066, 1, 1, 1, 1, 1,
-1.222468, 0.1400786, -1.896942, 1, 1, 1, 1, 1,
-1.209021, -0.2995586, -2.125599, 1, 1, 1, 1, 1,
-1.207392, -0.6013421, -1.086319, 1, 1, 1, 1, 1,
-1.203997, -0.3537312, -1.678898, 1, 1, 1, 1, 1,
-1.195235, -0.1638724, -2.231242, 1, 1, 1, 1, 1,
-1.188503, 0.8868584, 0.2696994, 1, 1, 1, 1, 1,
-1.183713, 1.301536, -0.5780063, 1, 1, 1, 1, 1,
-1.180324, -0.4358263, -2.242744, 1, 1, 1, 1, 1,
-1.177628, 0.3689517, -2.239188, 1, 1, 1, 1, 1,
-1.169903, -0.2458286, -1.953782, 1, 1, 1, 1, 1,
-1.166863, 0.6881893, -1.028909, 0, 0, 1, 1, 1,
-1.158229, 1.294871, -0.4381906, 1, 0, 0, 1, 1,
-1.157145, -0.2816749, -1.091913, 1, 0, 0, 1, 1,
-1.154554, -0.1492636, -2.389565, 1, 0, 0, 1, 1,
-1.143914, -1.017909, -1.407653, 1, 0, 0, 1, 1,
-1.141012, -2.007432, -1.535019, 1, 0, 0, 1, 1,
-1.139382, 0.7048283, -0.2249523, 0, 0, 0, 1, 1,
-1.13247, -0.3767227, -0.3970521, 0, 0, 0, 1, 1,
-1.132167, 0.12398, -1.399957, 0, 0, 0, 1, 1,
-1.118496, 0.3819866, -1.07149, 0, 0, 0, 1, 1,
-1.112809, -1.242863, -3.985862, 0, 0, 0, 1, 1,
-1.108693, 0.4934524, -1.471056, 0, 0, 0, 1, 1,
-1.108423, -0.04851244, -0.8464093, 0, 0, 0, 1, 1,
-1.102196, 2.016027, -2.717528, 1, 1, 1, 1, 1,
-1.086054, -0.1434133, -2.366959, 1, 1, 1, 1, 1,
-1.078263, 0.7319096, 0.4479963, 1, 1, 1, 1, 1,
-1.076231, 0.266818, -1.349588, 1, 1, 1, 1, 1,
-1.071151, 0.7191488, -1.499137, 1, 1, 1, 1, 1,
-1.070029, 0.2666749, -2.011772, 1, 1, 1, 1, 1,
-1.06445, 1.531461, -1.872882, 1, 1, 1, 1, 1,
-1.057992, -0.2260703, -1.50403, 1, 1, 1, 1, 1,
-1.055021, -0.1920146, -1.997379, 1, 1, 1, 1, 1,
-1.051424, -1.402977, -2.609684, 1, 1, 1, 1, 1,
-1.050518, -0.6342507, -2.817155, 1, 1, 1, 1, 1,
-1.050483, -0.3684834, -3.733409, 1, 1, 1, 1, 1,
-1.048319, -0.4739725, -1.702401, 1, 1, 1, 1, 1,
-1.022632, -0.5113181, -0.8355454, 1, 1, 1, 1, 1,
-1.020385, -1.084527, -3.759993, 1, 1, 1, 1, 1,
-1.018602, 0.3940087, -1.227347, 0, 0, 1, 1, 1,
-1.009377, -0.3808862, -2.377451, 1, 0, 0, 1, 1,
-1.003347, -2.314772, -3.324298, 1, 0, 0, 1, 1,
-1.001906, 0.6427336, -0.4277364, 1, 0, 0, 1, 1,
-0.9969343, 1.549383, -1.02297, 1, 0, 0, 1, 1,
-0.9927098, 0.4074965, -0.6638768, 1, 0, 0, 1, 1,
-0.9917169, -0.6202704, -0.5917904, 0, 0, 0, 1, 1,
-0.991525, -0.9533845, -3.023469, 0, 0, 0, 1, 1,
-0.9888888, -0.05136503, -1.044657, 0, 0, 0, 1, 1,
-0.9776942, -1.241899, -3.350775, 0, 0, 0, 1, 1,
-0.9758971, -0.0719841, -0.1609129, 0, 0, 0, 1, 1,
-0.9725473, 0.02100601, -0.9727487, 0, 0, 0, 1, 1,
-0.9715492, -1.187606, -2.094006, 0, 0, 0, 1, 1,
-0.9694541, -0.006656596, -0.5955822, 1, 1, 1, 1, 1,
-0.9683366, 0.6362771, -1.760231, 1, 1, 1, 1, 1,
-0.9651138, 0.9986847, -0.6318917, 1, 1, 1, 1, 1,
-0.9635047, -1.152181, -4.174109, 1, 1, 1, 1, 1,
-0.9613261, -0.5068505, 1.11721, 1, 1, 1, 1, 1,
-0.9611218, 0.6538743, -1.660341, 1, 1, 1, 1, 1,
-0.9585124, 1.41134, -1.876763, 1, 1, 1, 1, 1,
-0.9461316, 0.07498936, -0.2928145, 1, 1, 1, 1, 1,
-0.9457883, 0.6357468, -2.622759, 1, 1, 1, 1, 1,
-0.9449145, 0.9791461, -0.9406099, 1, 1, 1, 1, 1,
-0.9409168, 0.9728476, 0.9821028, 1, 1, 1, 1, 1,
-0.9365696, -1.530768, -1.910046, 1, 1, 1, 1, 1,
-0.9365178, -0.02437607, -3.133479, 1, 1, 1, 1, 1,
-0.9363366, 0.7457424, -0.3946986, 1, 1, 1, 1, 1,
-0.9331699, -0.189965, -1.587507, 1, 1, 1, 1, 1,
-0.9297618, -1.074485, -1.607737, 0, 0, 1, 1, 1,
-0.9296197, 0.08206785, -2.157521, 1, 0, 0, 1, 1,
-0.9274212, -0.1150167, -0.8821066, 1, 0, 0, 1, 1,
-0.9258178, 0.2326774, -0.835811, 1, 0, 0, 1, 1,
-0.9253027, -0.06403366, -1.511828, 1, 0, 0, 1, 1,
-0.9223145, -1.077487, -4.6134, 1, 0, 0, 1, 1,
-0.9159129, 2.284452, 0.8631498, 0, 0, 0, 1, 1,
-0.9145656, 1.363425, -0.6236386, 0, 0, 0, 1, 1,
-0.9061136, 0.8809503, -0.8439489, 0, 0, 0, 1, 1,
-0.905344, -0.2789463, -0.5814303, 0, 0, 0, 1, 1,
-0.899907, 1.271443, -1.841232, 0, 0, 0, 1, 1,
-0.8956839, -0.7329008, -4.035867, 0, 0, 0, 1, 1,
-0.893769, -1.202177, -2.186908, 0, 0, 0, 1, 1,
-0.89035, -0.572473, 0.08210555, 1, 1, 1, 1, 1,
-0.884585, -0.04040858, -2.187738, 1, 1, 1, 1, 1,
-0.8840302, -0.3120729, -3.962401, 1, 1, 1, 1, 1,
-0.8739412, 1.412343, -0.03256628, 1, 1, 1, 1, 1,
-0.8738884, -0.4073043, -2.38085, 1, 1, 1, 1, 1,
-0.8684247, -0.1074786, -2.424534, 1, 1, 1, 1, 1,
-0.8673184, 0.7679708, -1.310001, 1, 1, 1, 1, 1,
-0.866075, -0.1064047, -2.782314, 1, 1, 1, 1, 1,
-0.8613159, 1.328449, -0.4001102, 1, 1, 1, 1, 1,
-0.8608868, 0.3891378, -1.354661, 1, 1, 1, 1, 1,
-0.860566, -1.533353, -2.511308, 1, 1, 1, 1, 1,
-0.8592943, -1.065317, -1.789615, 1, 1, 1, 1, 1,
-0.8547852, -0.1128717, -1.571692, 1, 1, 1, 1, 1,
-0.8538321, 0.01433874, -1.076742, 1, 1, 1, 1, 1,
-0.8432592, -0.3050105, -1.348945, 1, 1, 1, 1, 1,
-0.842392, 0.8718729, -1.200212, 0, 0, 1, 1, 1,
-0.8366097, 0.1414764, -0.5480599, 1, 0, 0, 1, 1,
-0.831611, -0.6820886, -2.913916, 1, 0, 0, 1, 1,
-0.8309142, -0.5593786, -1.497082, 1, 0, 0, 1, 1,
-0.8263876, 0.1834678, -1.604282, 1, 0, 0, 1, 1,
-0.8218731, -0.7661682, -3.273829, 1, 0, 0, 1, 1,
-0.8047663, 0.5876847, -0.7964575, 0, 0, 0, 1, 1,
-0.8044635, -1.365979, -1.689047, 0, 0, 0, 1, 1,
-0.8040774, -0.962321, -2.182348, 0, 0, 0, 1, 1,
-0.8024271, 0.1563556, -1.002891, 0, 0, 0, 1, 1,
-0.793635, 0.5244759, -0.04194238, 0, 0, 0, 1, 1,
-0.7838897, -0.2284335, -1.803183, 0, 0, 0, 1, 1,
-0.7814071, -1.046597, -4.778224, 0, 0, 0, 1, 1,
-0.7750424, 0.5819293, -1.243682, 1, 1, 1, 1, 1,
-0.7677018, 2.142792, 0.9401372, 1, 1, 1, 1, 1,
-0.7593988, -2.047212, -1.270877, 1, 1, 1, 1, 1,
-0.7525569, 0.9741834, -1.161922, 1, 1, 1, 1, 1,
-0.747902, 0.5253073, -0.8237527, 1, 1, 1, 1, 1,
-0.7477155, -0.7516927, -2.482448, 1, 1, 1, 1, 1,
-0.7464951, -1.903102, -1.012434, 1, 1, 1, 1, 1,
-0.7425597, 0.7869031, -1.035562, 1, 1, 1, 1, 1,
-0.7416176, 0.3543016, -1.710932, 1, 1, 1, 1, 1,
-0.7410669, -0.1460544, 0.1643043, 1, 1, 1, 1, 1,
-0.7397702, 2.827702, -0.8716667, 1, 1, 1, 1, 1,
-0.7362961, -0.8566228, -1.411728, 1, 1, 1, 1, 1,
-0.7345077, -0.9309285, -0.6584422, 1, 1, 1, 1, 1,
-0.7278026, 0.02679475, -1.85822, 1, 1, 1, 1, 1,
-0.7268427, -0.3823411, -2.335927, 1, 1, 1, 1, 1,
-0.7265903, 0.2392456, -1.965933, 0, 0, 1, 1, 1,
-0.7208234, 0.4527269, 0.4295222, 1, 0, 0, 1, 1,
-0.7167557, -1.076414, -2.416477, 1, 0, 0, 1, 1,
-0.713618, 0.7895958, -1.502864, 1, 0, 0, 1, 1,
-0.70671, 0.3837763, -2.801676, 1, 0, 0, 1, 1,
-0.7048249, 0.5744544, -0.3914775, 1, 0, 0, 1, 1,
-0.7010381, 1.772129, -0.6650462, 0, 0, 0, 1, 1,
-0.6961803, 0.8674467, -0.2019128, 0, 0, 0, 1, 1,
-0.6956896, -1.024024, -2.949295, 0, 0, 0, 1, 1,
-0.6954923, 1.46416, -1.942746, 0, 0, 0, 1, 1,
-0.6877849, 0.5139864, -1.994341, 0, 0, 0, 1, 1,
-0.686909, -0.7440946, -2.66873, 0, 0, 0, 1, 1,
-0.683743, 0.9379454, -0.4674608, 0, 0, 0, 1, 1,
-0.6817798, 0.8786207, -2.339674, 1, 1, 1, 1, 1,
-0.6766111, -0.3675076, -1.944629, 1, 1, 1, 1, 1,
-0.6736532, -0.01910178, -0.7304573, 1, 1, 1, 1, 1,
-0.6643742, -0.7920768, -1.983543, 1, 1, 1, 1, 1,
-0.6594455, 1.066113, -0.9060398, 1, 1, 1, 1, 1,
-0.6530454, 0.1674781, -1.090836, 1, 1, 1, 1, 1,
-0.6520079, -0.5031114, -1.814733, 1, 1, 1, 1, 1,
-0.6515414, -0.6992056, -3.610029, 1, 1, 1, 1, 1,
-0.6508548, -0.2893994, -2.571993, 1, 1, 1, 1, 1,
-0.6492579, -1.899405, -1.30483, 1, 1, 1, 1, 1,
-0.6476316, -1.520896, -2.347962, 1, 1, 1, 1, 1,
-0.6421953, -0.8521431, -1.656688, 1, 1, 1, 1, 1,
-0.6395442, -0.9249966, -2.746489, 1, 1, 1, 1, 1,
-0.6385159, -0.7364641, -3.508709, 1, 1, 1, 1, 1,
-0.6338363, -1.283969, -1.456883, 1, 1, 1, 1, 1,
-0.6333224, 0.8853468, -2.2026, 0, 0, 1, 1, 1,
-0.6291458, 0.6059282, -1.761109, 1, 0, 0, 1, 1,
-0.6242863, -0.4595062, -0.3715406, 1, 0, 0, 1, 1,
-0.6209438, 1.244564, -0.7911028, 1, 0, 0, 1, 1,
-0.6190196, -0.1498176, -2.553894, 1, 0, 0, 1, 1,
-0.6177031, 0.6882456, 0.176723, 1, 0, 0, 1, 1,
-0.6117257, -1.53696, -3.378074, 0, 0, 0, 1, 1,
-0.6099872, 1.147448, -0.536737, 0, 0, 0, 1, 1,
-0.6064718, -0.7734739, -1.497244, 0, 0, 0, 1, 1,
-0.5986118, -2.080415, -3.33267, 0, 0, 0, 1, 1,
-0.59794, -0.9229651, -2.539067, 0, 0, 0, 1, 1,
-0.5963842, 1.416316, -0.9201474, 0, 0, 0, 1, 1,
-0.5822675, 0.3952937, -0.9814866, 0, 0, 0, 1, 1,
-0.5771336, -0.5737812, -2.164583, 1, 1, 1, 1, 1,
-0.5762956, 1.314824, 0.124416, 1, 1, 1, 1, 1,
-0.5751923, -0.1051766, -0.826103, 1, 1, 1, 1, 1,
-0.5736303, -1.429712, -2.182847, 1, 1, 1, 1, 1,
-0.5735535, -0.8840231, -3.884299, 1, 1, 1, 1, 1,
-0.5715885, -0.7030131, -4.417878, 1, 1, 1, 1, 1,
-0.5713355, 1.109573, 0.3653572, 1, 1, 1, 1, 1,
-0.571044, -1.321136, -1.381026, 1, 1, 1, 1, 1,
-0.57006, 1.214285, 0.4043033, 1, 1, 1, 1, 1,
-0.5688014, 1.21382, -1.184909, 1, 1, 1, 1, 1,
-0.5671492, 1.554726, 0.7845266, 1, 1, 1, 1, 1,
-0.5609805, 0.7854304, -1.484067, 1, 1, 1, 1, 1,
-0.5607458, 0.9062873, 0.3769391, 1, 1, 1, 1, 1,
-0.5599523, 1.361531, 1.073158, 1, 1, 1, 1, 1,
-0.5580218, 0.6803385, 0.05432147, 1, 1, 1, 1, 1,
-0.5562904, 1.584559, 0.6082242, 0, 0, 1, 1, 1,
-0.5539909, 1.709411, -1.282751, 1, 0, 0, 1, 1,
-0.5449234, -0.1634175, -2.850515, 1, 0, 0, 1, 1,
-0.5445797, 0.6504022, 0.8605632, 1, 0, 0, 1, 1,
-0.535776, -0.3349501, -1.828221, 1, 0, 0, 1, 1,
-0.5339648, 0.4599967, -1.109896, 1, 0, 0, 1, 1,
-0.5332052, 0.01031481, 0.08963512, 0, 0, 0, 1, 1,
-0.5302041, 1.771013, 0.4873069, 0, 0, 0, 1, 1,
-0.5254747, -0.1734958, -2.704006, 0, 0, 0, 1, 1,
-0.5174617, 2.061182, -0.546371, 0, 0, 0, 1, 1,
-0.5172663, -0.09362955, -2.738622, 0, 0, 0, 1, 1,
-0.5086097, 1.310674, -1.299455, 0, 0, 0, 1, 1,
-0.5070933, 1.577985, 1.025034, 0, 0, 0, 1, 1,
-0.5067343, 0.5245713, -1.061261, 1, 1, 1, 1, 1,
-0.5050724, -1.23137, -3.39733, 1, 1, 1, 1, 1,
-0.5041824, -0.3408068, -1.326054, 1, 1, 1, 1, 1,
-0.5028358, 0.5387675, 1.394336, 1, 1, 1, 1, 1,
-0.5002036, -0.3248906, -0.8135185, 1, 1, 1, 1, 1,
-0.4995349, -0.05951858, -2.631284, 1, 1, 1, 1, 1,
-0.4915794, 0.4717984, -0.765339, 1, 1, 1, 1, 1,
-0.4915285, 0.3897707, -0.469531, 1, 1, 1, 1, 1,
-0.48916, -0.3463264, -2.586388, 1, 1, 1, 1, 1,
-0.4877005, 0.249112, -1.511197, 1, 1, 1, 1, 1,
-0.4857118, -1.745942, -3.009972, 1, 1, 1, 1, 1,
-0.4845382, -0.2775266, -2.222133, 1, 1, 1, 1, 1,
-0.479717, -0.9820469, -2.903465, 1, 1, 1, 1, 1,
-0.4780526, -1.898076, -2.998306, 1, 1, 1, 1, 1,
-0.4756335, 1.320601, 0.8362179, 1, 1, 1, 1, 1,
-0.4728858, 0.4907529, -0.9551784, 0, 0, 1, 1, 1,
-0.4722114, -0.7572631, -2.446923, 1, 0, 0, 1, 1,
-0.4712761, -1.139306, -3.016899, 1, 0, 0, 1, 1,
-0.4696044, 0.6012145, -0.1435427, 1, 0, 0, 1, 1,
-0.4659047, -0.616265, -2.215192, 1, 0, 0, 1, 1,
-0.4588586, -1.608958, -4.852464, 1, 0, 0, 1, 1,
-0.4588042, -0.7566373, -2.12829, 0, 0, 0, 1, 1,
-0.4577042, -0.1812508, -0.8285384, 0, 0, 0, 1, 1,
-0.4575701, 0.805518, -1.166025, 0, 0, 0, 1, 1,
-0.4574773, 0.2039212, -1.490878, 0, 0, 0, 1, 1,
-0.4568106, 2.232689, -0.4549876, 0, 0, 0, 1, 1,
-0.454813, -0.1395943, -3.457813, 0, 0, 0, 1, 1,
-0.4527502, 0.7423663, -0.8572555, 0, 0, 0, 1, 1,
-0.4521662, -0.2431103, -1.072338, 1, 1, 1, 1, 1,
-0.4504712, 1.092255, -1.196245, 1, 1, 1, 1, 1,
-0.4424017, 2.446376, -0.589516, 1, 1, 1, 1, 1,
-0.4417197, 0.4863417, -1.16535, 1, 1, 1, 1, 1,
-0.441127, 0.1322526, -0.1652263, 1, 1, 1, 1, 1,
-0.4355454, -0.01747007, -0.969329, 1, 1, 1, 1, 1,
-0.4325711, 0.2054764, -2.582001, 1, 1, 1, 1, 1,
-0.4298344, 0.5770692, 0.6187956, 1, 1, 1, 1, 1,
-0.4278288, 0.4551445, -1.352177, 1, 1, 1, 1, 1,
-0.4264792, 0.7783083, 0.03813489, 1, 1, 1, 1, 1,
-0.423357, 1.076261, 1.303093, 1, 1, 1, 1, 1,
-0.4100462, 0.6604103, -1.497126, 1, 1, 1, 1, 1,
-0.4060287, -0.7463046, -1.7491, 1, 1, 1, 1, 1,
-0.4058471, -2.055599, -1.621966, 1, 1, 1, 1, 1,
-0.4026337, -0.1647792, -2.200575, 1, 1, 1, 1, 1,
-0.4026096, -0.2710695, -1.402081, 0, 0, 1, 1, 1,
-0.3995976, 1.163497, 1.435563, 1, 0, 0, 1, 1,
-0.399194, 0.5889742, -0.1301354, 1, 0, 0, 1, 1,
-0.3986572, 0.5824287, 0.09994952, 1, 0, 0, 1, 1,
-0.3959161, -1.041948, -3.307242, 1, 0, 0, 1, 1,
-0.3912694, 0.05920881, -1.752652, 1, 0, 0, 1, 1,
-0.3896579, 1.357382, -2.070762, 0, 0, 0, 1, 1,
-0.386518, 0.8137653, 0.8199612, 0, 0, 0, 1, 1,
-0.3857635, -1.565167, -4.635972, 0, 0, 0, 1, 1,
-0.3851004, -0.5695698, -0.9667148, 0, 0, 0, 1, 1,
-0.3824534, -0.8963538, -3.46122, 0, 0, 0, 1, 1,
-0.3818688, -1.059899, -2.532751, 0, 0, 0, 1, 1,
-0.3787215, 0.3145988, -0.6268539, 0, 0, 0, 1, 1,
-0.3724915, -2.234786, -2.564826, 1, 1, 1, 1, 1,
-0.3623794, -0.2309686, -1.737115, 1, 1, 1, 1, 1,
-0.3618382, -0.008975732, -2.340379, 1, 1, 1, 1, 1,
-0.3576316, -1.688101, -1.848485, 1, 1, 1, 1, 1,
-0.3515509, 0.59614, -1.282766, 1, 1, 1, 1, 1,
-0.3512046, 0.07034665, -0.03697393, 1, 1, 1, 1, 1,
-0.3511722, 0.08720657, -0.2685304, 1, 1, 1, 1, 1,
-0.3455562, -0.1184043, -1.456425, 1, 1, 1, 1, 1,
-0.3436518, -0.5732112, -2.451306, 1, 1, 1, 1, 1,
-0.3429505, 0.5752369, -0.4959518, 1, 1, 1, 1, 1,
-0.3424573, -0.02507521, -1.613616, 1, 1, 1, 1, 1,
-0.3422528, -1.620699, -3.32648, 1, 1, 1, 1, 1,
-0.3408874, 0.9503158, -0.6145512, 1, 1, 1, 1, 1,
-0.3396615, -0.9511542, -2.967637, 1, 1, 1, 1, 1,
-0.3388058, -0.3291749, -2.897305, 1, 1, 1, 1, 1,
-0.3376765, -0.4060897, -2.675282, 0, 0, 1, 1, 1,
-0.3352175, -0.3402357, -2.126908, 1, 0, 0, 1, 1,
-0.3327714, -0.8948334, -3.080996, 1, 0, 0, 1, 1,
-0.3321548, -1.042292, -3.368832, 1, 0, 0, 1, 1,
-0.3315159, 0.7072341, 0.04599991, 1, 0, 0, 1, 1,
-0.3290696, -1.125675, -3.598375, 1, 0, 0, 1, 1,
-0.3271584, -0.3108026, -1.764448, 0, 0, 0, 1, 1,
-0.3206841, 0.4440842, -1.047443, 0, 0, 0, 1, 1,
-0.3199756, 1.608498, -1.363621, 0, 0, 0, 1, 1,
-0.3199706, -1.180147, -4.901792, 0, 0, 0, 1, 1,
-0.3190665, -0.7321789, -4.132522, 0, 0, 0, 1, 1,
-0.3183255, 0.003170316, -0.01303027, 0, 0, 0, 1, 1,
-0.3178345, 0.0567668, -1.657369, 0, 0, 0, 1, 1,
-0.3160952, -0.07408421, -1.365544, 1, 1, 1, 1, 1,
-0.3153399, -0.7399049, -2.583754, 1, 1, 1, 1, 1,
-0.3136515, 1.320598, -0.9858934, 1, 1, 1, 1, 1,
-0.3135412, 0.5883185, 0.6527822, 1, 1, 1, 1, 1,
-0.3121516, -0.3473398, -3.226383, 1, 1, 1, 1, 1,
-0.3103812, -0.2377718, -2.302737, 1, 1, 1, 1, 1,
-0.3100101, 0.530234, -1.141979, 1, 1, 1, 1, 1,
-0.3078201, -0.1720064, -1.925991, 1, 1, 1, 1, 1,
-0.3071795, -1.352268, -4.241014, 1, 1, 1, 1, 1,
-0.30647, 0.3043268, -1.539424, 1, 1, 1, 1, 1,
-0.3046881, 0.03320637, -0.9083299, 1, 1, 1, 1, 1,
-0.3045849, -0.2790472, -3.273914, 1, 1, 1, 1, 1,
-0.3039618, -0.7660062, -2.038766, 1, 1, 1, 1, 1,
-0.3017486, 1.152654, -0.00383444, 1, 1, 1, 1, 1,
-0.3002415, -0.7726772, -4.640568, 1, 1, 1, 1, 1,
-0.2995763, 0.7925676, -0.2687985, 0, 0, 1, 1, 1,
-0.298789, -0.4202518, -1.067042, 1, 0, 0, 1, 1,
-0.2962926, -0.9741387, -3.242506, 1, 0, 0, 1, 1,
-0.2943251, 0.8651297, 0.4127819, 1, 0, 0, 1, 1,
-0.294043, 0.5092413, -0.4304839, 1, 0, 0, 1, 1,
-0.2867248, -1.080822, -4.242257, 1, 0, 0, 1, 1,
-0.2863845, 0.373749, 1.258333, 0, 0, 0, 1, 1,
-0.2836503, 0.9398705, -1.335181, 0, 0, 0, 1, 1,
-0.2754988, 1.336099, 1.734032, 0, 0, 0, 1, 1,
-0.2754531, -0.7322172, -2.533837, 0, 0, 0, 1, 1,
-0.2739893, 0.3640816, 0.09233863, 0, 0, 0, 1, 1,
-0.2727502, 0.1981925, -3.011455, 0, 0, 0, 1, 1,
-0.2685001, -0.09859993, -1.083528, 0, 0, 0, 1, 1,
-0.26548, -1.136528, -2.936255, 1, 1, 1, 1, 1,
-0.2651094, 0.5773739, -2.189276, 1, 1, 1, 1, 1,
-0.2621407, -0.4001476, -1.992175, 1, 1, 1, 1, 1,
-0.2581325, 0.4770311, 0.204766, 1, 1, 1, 1, 1,
-0.2577704, 0.08599707, -0.4033625, 1, 1, 1, 1, 1,
-0.2547315, -0.2392401, -1.462509, 1, 1, 1, 1, 1,
-0.2545101, 0.6036476, -0.5369032, 1, 1, 1, 1, 1,
-0.2531345, 0.7619459, -2.490578, 1, 1, 1, 1, 1,
-0.2518642, 0.6425719, -3.703061, 1, 1, 1, 1, 1,
-0.2516904, -1.108117, -1.873974, 1, 1, 1, 1, 1,
-0.2501928, -0.1013956, -0.8032269, 1, 1, 1, 1, 1,
-0.2417691, 0.4071534, -1.077166, 1, 1, 1, 1, 1,
-0.2399346, -0.3854879, -4.010375, 1, 1, 1, 1, 1,
-0.2325616, -0.01999975, -0.931782, 1, 1, 1, 1, 1,
-0.2289113, 1.384191, -0.1510824, 1, 1, 1, 1, 1,
-0.2275916, 0.5667348, -1.333502, 0, 0, 1, 1, 1,
-0.220446, 1.537959, 0.7647559, 1, 0, 0, 1, 1,
-0.2174509, -1.463385, -6.032634, 1, 0, 0, 1, 1,
-0.2159949, 0.8462901, 0.9287779, 1, 0, 0, 1, 1,
-0.2155953, 1.293135, 0.4189187, 1, 0, 0, 1, 1,
-0.2155501, -0.626417, -1.02513, 1, 0, 0, 1, 1,
-0.2088967, 0.1738111, -0.5753187, 0, 0, 0, 1, 1,
-0.2081138, 1.118219, -0.8692269, 0, 0, 0, 1, 1,
-0.2048357, 0.1288438, -0.3522125, 0, 0, 0, 1, 1,
-0.199278, 1.678336, -1.634106, 0, 0, 0, 1, 1,
-0.1978036, -0.1839738, -2.168581, 0, 0, 0, 1, 1,
-0.1939989, -0.2975968, -2.586027, 0, 0, 0, 1, 1,
-0.191205, 0.3171202, -0.6628158, 0, 0, 0, 1, 1,
-0.1903367, -0.5149571, -2.890585, 1, 1, 1, 1, 1,
-0.1886848, 2.006893, -0.4747133, 1, 1, 1, 1, 1,
-0.1883318, -1.409259, -2.571233, 1, 1, 1, 1, 1,
-0.1869735, -0.2815, -3.208938, 1, 1, 1, 1, 1,
-0.1865039, 0.3775394, -0.9473527, 1, 1, 1, 1, 1,
-0.1859328, -0.2313772, -4.331174, 1, 1, 1, 1, 1,
-0.1816745, -0.5343729, -2.107089, 1, 1, 1, 1, 1,
-0.1815396, 0.2831488, -0.8617412, 1, 1, 1, 1, 1,
-0.1793932, 1.446988, 0.02300457, 1, 1, 1, 1, 1,
-0.1761582, -0.2028956, -2.291896, 1, 1, 1, 1, 1,
-0.1737588, -2.222389, -3.854215, 1, 1, 1, 1, 1,
-0.1727204, 0.02961665, -2.29246, 1, 1, 1, 1, 1,
-0.1669587, -1.846068, -4.675148, 1, 1, 1, 1, 1,
-0.1646857, 0.5473765, -1.054225, 1, 1, 1, 1, 1,
-0.1609513, 1.532536, -0.07544687, 1, 1, 1, 1, 1,
-0.1583776, -0.7500952, -3.060009, 0, 0, 1, 1, 1,
-0.1461458, 0.2583219, 0.2071362, 1, 0, 0, 1, 1,
-0.1447296, 0.7598614, 0.6466768, 1, 0, 0, 1, 1,
-0.141361, 0.08738815, -3.155584, 1, 0, 0, 1, 1,
-0.1378841, -1.264131, -2.352062, 1, 0, 0, 1, 1,
-0.1372932, -1.575006, -3.164766, 1, 0, 0, 1, 1,
-0.1362657, -0.9508667, -1.938352, 0, 0, 0, 1, 1,
-0.1310489, -0.6093391, -1.732872, 0, 0, 0, 1, 1,
-0.1275648, 0.2955267, -0.1280098, 0, 0, 0, 1, 1,
-0.1251629, -1.176108, -2.878518, 0, 0, 0, 1, 1,
-0.1236144, 0.3466718, -1.328495, 0, 0, 0, 1, 1,
-0.1205566, -1.095384, -2.534111, 0, 0, 0, 1, 1,
-0.1166849, -0.9519027, -3.356557, 0, 0, 0, 1, 1,
-0.116522, 0.4934799, -1.208563, 1, 1, 1, 1, 1,
-0.1123061, -0.3079002, -3.088991, 1, 1, 1, 1, 1,
-0.1116283, 0.383432, 0.5344314, 1, 1, 1, 1, 1,
-0.1089562, -1.047005, -2.67521, 1, 1, 1, 1, 1,
-0.1082349, -0.8968288, -1.735812, 1, 1, 1, 1, 1,
-0.1062332, 0.9916683, 0.4015312, 1, 1, 1, 1, 1,
-0.0950716, 1.465899, 0.7172664, 1, 1, 1, 1, 1,
-0.094664, -0.4089005, -3.541629, 1, 1, 1, 1, 1,
-0.09298756, 0.466729, -1.848485, 1, 1, 1, 1, 1,
-0.08679673, -0.8102515, -3.323072, 1, 1, 1, 1, 1,
-0.0844157, -0.1409648, -4.167189, 1, 1, 1, 1, 1,
-0.08248017, -0.1230135, -4.435788, 1, 1, 1, 1, 1,
-0.07986299, 0.1946586, -1.464169, 1, 1, 1, 1, 1,
-0.07943285, 0.5704954, 1.267764, 1, 1, 1, 1, 1,
-0.07700432, 0.000117851, -2.268029, 1, 1, 1, 1, 1,
-0.07604711, -0.6987701, -3.921927, 0, 0, 1, 1, 1,
-0.07116363, 1.017635, -2.665266, 1, 0, 0, 1, 1,
-0.06879513, 1.680102, -0.2996072, 1, 0, 0, 1, 1,
-0.05706775, 0.02047013, -1.944274, 1, 0, 0, 1, 1,
-0.05257719, 1.606948, -0.748463, 1, 0, 0, 1, 1,
-0.04979331, -0.3324499, -4.010549, 1, 0, 0, 1, 1,
-0.04975483, -0.7997455, -2.11094, 0, 0, 0, 1, 1,
-0.04828114, -2.260994, -2.294053, 0, 0, 0, 1, 1,
-0.04512692, -0.6672462, -3.383043, 0, 0, 0, 1, 1,
-0.04478291, -1.460433, -2.99843, 0, 0, 0, 1, 1,
-0.03892105, 1.245012, -0.974709, 0, 0, 0, 1, 1,
-0.03662991, -0.1901189, -3.428189, 0, 0, 0, 1, 1,
-0.03609959, 0.321642, 1.182127, 0, 0, 0, 1, 1,
-0.03337063, -1.335405, -4.200105, 1, 1, 1, 1, 1,
-0.03013931, -0.7048294, -1.674617, 1, 1, 1, 1, 1,
-0.02902346, -0.7774062, -2.187929, 1, 1, 1, 1, 1,
-0.0279016, -1.018655, -2.317959, 1, 1, 1, 1, 1,
-0.02687524, -1.208312, -3.37753, 1, 1, 1, 1, 1,
-0.01673323, 0.4369926, 0.1204486, 1, 1, 1, 1, 1,
-0.01508874, 0.1773316, -1.146607, 1, 1, 1, 1, 1,
-0.01302732, -2.059112, -4.48658, 1, 1, 1, 1, 1,
-0.009156075, -0.1626588, -2.849411, 1, 1, 1, 1, 1,
-0.005704197, 0.5141089, 2.46299, 1, 1, 1, 1, 1,
-0.004542626, -0.60369, -4.243299, 1, 1, 1, 1, 1,
-0.002837167, -0.03526517, -1.924919, 1, 1, 1, 1, 1,
-0.001393401, 0.116216, -0.7383254, 1, 1, 1, 1, 1,
0.0003108793, -0.4935867, 1.38909, 1, 1, 1, 1, 1,
0.0003213185, -0.9115421, 3.270992, 1, 1, 1, 1, 1,
0.001790376, 1.838491, -0.715705, 0, 0, 1, 1, 1,
0.002748874, -0.1107825, 3.800408, 1, 0, 0, 1, 1,
0.009376182, 1.544369, -2.438747, 1, 0, 0, 1, 1,
0.01141847, 0.8693296, -0.5557908, 1, 0, 0, 1, 1,
0.01582753, -2.103013, 0.9165248, 1, 0, 0, 1, 1,
0.02297889, 1.434325, 0.5286185, 1, 0, 0, 1, 1,
0.02487965, -1.016415, 3.283816, 0, 0, 0, 1, 1,
0.02677592, -0.5343083, 3.117009, 0, 0, 0, 1, 1,
0.0289633, -1.37145, 2.718579, 0, 0, 0, 1, 1,
0.02949745, 1.335781, -0.8397502, 0, 0, 0, 1, 1,
0.03174895, -1.792147, 3.637381, 0, 0, 0, 1, 1,
0.03289779, -1.362422, 3.351312, 0, 0, 0, 1, 1,
0.03303375, -0.1292758, 2.098376, 0, 0, 0, 1, 1,
0.03418684, 1.973369, -0.9828666, 1, 1, 1, 1, 1,
0.03939518, 0.5761883, 1.064062, 1, 1, 1, 1, 1,
0.04597028, 0.02556485, 0.6342621, 1, 1, 1, 1, 1,
0.04681476, 0.3886509, -1.587914, 1, 1, 1, 1, 1,
0.04716123, -0.9096389, 4.162364, 1, 1, 1, 1, 1,
0.04832921, -1.031814, 4.510091, 1, 1, 1, 1, 1,
0.04889377, -0.7652726, 1.519076, 1, 1, 1, 1, 1,
0.049204, -0.7693862, 3.782646, 1, 1, 1, 1, 1,
0.05010611, 1.010154, -0.8176292, 1, 1, 1, 1, 1,
0.05027907, -0.1487743, 3.791514, 1, 1, 1, 1, 1,
0.05049652, 0.1476323, 0.1107669, 1, 1, 1, 1, 1,
0.05156356, -0.6021041, 4.275663, 1, 1, 1, 1, 1,
0.05201726, -0.4932953, 4.013292, 1, 1, 1, 1, 1,
0.05407301, 0.4989716, 1.069444, 1, 1, 1, 1, 1,
0.05456798, -1.00332, 3.051262, 1, 1, 1, 1, 1,
0.05488449, -0.5527477, 3.082531, 0, 0, 1, 1, 1,
0.05516044, -0.8582428, 4.555068, 1, 0, 0, 1, 1,
0.05701235, 1.671117, -1.126226, 1, 0, 0, 1, 1,
0.05767436, -0.3166019, 1.527214, 1, 0, 0, 1, 1,
0.05833774, -2.008689, 3.981466, 1, 0, 0, 1, 1,
0.05838377, -0.9382011, 2.558465, 1, 0, 0, 1, 1,
0.06029331, -0.1252844, 2.01123, 0, 0, 0, 1, 1,
0.0644718, 1.254377, 0.4067767, 0, 0, 0, 1, 1,
0.06479254, -0.2385297, 2.166675, 0, 0, 0, 1, 1,
0.0726483, -0.3197201, 2.648947, 0, 0, 0, 1, 1,
0.07286428, -0.6077687, 2.569531, 0, 0, 0, 1, 1,
0.07451081, 0.5485706, -1.514556, 0, 0, 0, 1, 1,
0.07766467, 0.4017495, 1.260499, 0, 0, 0, 1, 1,
0.08007833, 0.3347476, 0.7791638, 1, 1, 1, 1, 1,
0.08389135, 0.6294532, -0.1875913, 1, 1, 1, 1, 1,
0.08454612, 1.542764, 0.8480889, 1, 1, 1, 1, 1,
0.08517249, -1.433429, 3.483679, 1, 1, 1, 1, 1,
0.08825212, -0.1502798, 1.942081, 1, 1, 1, 1, 1,
0.09341243, 1.057455, 1.269078, 1, 1, 1, 1, 1,
0.09424036, 1.138256, -2.82694, 1, 1, 1, 1, 1,
0.09446836, -0.1313266, 3.49182, 1, 1, 1, 1, 1,
0.09852353, -2.129228, 2.549069, 1, 1, 1, 1, 1,
0.09891888, 0.899711, 0.3893689, 1, 1, 1, 1, 1,
0.1002857, 0.2050179, -0.1791735, 1, 1, 1, 1, 1,
0.1011425, 2.048233, 0.7505618, 1, 1, 1, 1, 1,
0.1049615, 1.129108, 2.115291, 1, 1, 1, 1, 1,
0.1061703, 0.04014864, 1.483355, 1, 1, 1, 1, 1,
0.1072033, -0.4634574, 2.670225, 1, 1, 1, 1, 1,
0.1077698, -0.5294778, 3.543174, 0, 0, 1, 1, 1,
0.1087149, 1.42852, 1.26549, 1, 0, 0, 1, 1,
0.1106276, -0.1894568, 2.26459, 1, 0, 0, 1, 1,
0.1146573, -0.2474967, 1.466683, 1, 0, 0, 1, 1,
0.1210198, -0.2976724, 3.314332, 1, 0, 0, 1, 1,
0.1217968, 0.8453519, 0.003851461, 1, 0, 0, 1, 1,
0.1251852, 0.3472979, -0.3535668, 0, 0, 0, 1, 1,
0.1272203, 0.8010796, -0.5728607, 0, 0, 0, 1, 1,
0.1274149, -1.82006, 3.402532, 0, 0, 0, 1, 1,
0.1289426, -0.5085053, 2.421051, 0, 0, 0, 1, 1,
0.1299395, -1.740094, 4.104277, 0, 0, 0, 1, 1,
0.1303865, -0.9319243, 3.384899, 0, 0, 0, 1, 1,
0.1318485, -0.6862396, 3.23289, 0, 0, 0, 1, 1,
0.136315, 1.018517, -0.8750853, 1, 1, 1, 1, 1,
0.1378757, 2.68077, 1.286489, 1, 1, 1, 1, 1,
0.142322, 1.93494, -2.790524, 1, 1, 1, 1, 1,
0.1442577, -0.2924309, 2.488416, 1, 1, 1, 1, 1,
0.1449244, 1.69391, -0.1924504, 1, 1, 1, 1, 1,
0.1449364, 0.5462708, -0.6790572, 1, 1, 1, 1, 1,
0.1461499, -0.7964534, 2.289346, 1, 1, 1, 1, 1,
0.1487526, 0.01011242, 2.723652, 1, 1, 1, 1, 1,
0.1491027, -1.260308, 5.483104, 1, 1, 1, 1, 1,
0.1491676, -0.3539875, 2.54853, 1, 1, 1, 1, 1,
0.150528, 0.1433646, 0.3711661, 1, 1, 1, 1, 1,
0.1512028, 0.1144074, 0.4676573, 1, 1, 1, 1, 1,
0.151409, 1.463404, -1.365059, 1, 1, 1, 1, 1,
0.1583945, -2.514496, 3.781084, 1, 1, 1, 1, 1,
0.1612627, -1.101486, 3.975358, 1, 1, 1, 1, 1,
0.1616753, -0.005887392, 1.7452, 0, 0, 1, 1, 1,
0.1636603, 1.117977, 0.7164447, 1, 0, 0, 1, 1,
0.1648634, -0.2670877, 1.680634, 1, 0, 0, 1, 1,
0.1658644, -0.3365397, 3.275879, 1, 0, 0, 1, 1,
0.1702788, 0.3548418, -1.608851, 1, 0, 0, 1, 1,
0.1713596, 0.08802727, 0.478698, 1, 0, 0, 1, 1,
0.1765601, 0.5185114, 1.092752, 0, 0, 0, 1, 1,
0.184088, 0.8002482, 1.542577, 0, 0, 0, 1, 1,
0.1885247, -0.2970737, 2.812872, 0, 0, 0, 1, 1,
0.1895283, -0.6004171, 3.476659, 0, 0, 0, 1, 1,
0.1907656, -1.51131, 3.847775, 0, 0, 0, 1, 1,
0.1909961, 0.597681, -0.7302817, 0, 0, 0, 1, 1,
0.1919602, 0.2336075, 2.269226, 0, 0, 0, 1, 1,
0.1988032, 0.7600766, 0.2497362, 1, 1, 1, 1, 1,
0.2090476, -0.7106047, 2.316636, 1, 1, 1, 1, 1,
0.2109467, -0.8043178, 2.194284, 1, 1, 1, 1, 1,
0.2135728, 0.2059054, 0.9025098, 1, 1, 1, 1, 1,
0.2146318, 1.570701, -0.4688689, 1, 1, 1, 1, 1,
0.2194001, -1.70491, 3.732511, 1, 1, 1, 1, 1,
0.2209351, 0.2643522, -0.3079613, 1, 1, 1, 1, 1,
0.2218741, 0.6685988, 0.3485066, 1, 1, 1, 1, 1,
0.2255131, 0.4375033, 1.962459, 1, 1, 1, 1, 1,
0.2273881, 2.083066, 1.404442, 1, 1, 1, 1, 1,
0.2336435, -0.4213409, 1.07279, 1, 1, 1, 1, 1,
0.2400876, 0.3024025, -0.06564002, 1, 1, 1, 1, 1,
0.2401343, 0.4149797, 1.002591, 1, 1, 1, 1, 1,
0.2408414, -1.32793, 1.18391, 1, 1, 1, 1, 1,
0.2426769, -1.884466, 3.65817, 1, 1, 1, 1, 1,
0.2437233, -1.236527, 1.741999, 0, 0, 1, 1, 1,
0.2503815, 1.129997, 0.6370608, 1, 0, 0, 1, 1,
0.2508693, -0.4923291, 2.93827, 1, 0, 0, 1, 1,
0.2510796, -0.4280698, 1.908545, 1, 0, 0, 1, 1,
0.2514768, -1.3727, 3.068252, 1, 0, 0, 1, 1,
0.2566241, 1.102999, -2.429395, 1, 0, 0, 1, 1,
0.256889, -0.08706888, 2.397016, 0, 0, 0, 1, 1,
0.2653755, -0.6523917, 3.673666, 0, 0, 0, 1, 1,
0.267168, -0.9348473, 2.616544, 0, 0, 0, 1, 1,
0.2690341, -0.1788268, 1.877926, 0, 0, 0, 1, 1,
0.2716824, -1.354931, 3.101905, 0, 0, 0, 1, 1,
0.2722472, 0.1304401, 2.033452, 0, 0, 0, 1, 1,
0.2754864, -0.9211546, 2.4636, 0, 0, 0, 1, 1,
0.2755423, -0.9683896, 3.981888, 1, 1, 1, 1, 1,
0.2778939, 1.543265, 1.59181, 1, 1, 1, 1, 1,
0.2815601, -0.5086454, 2.724903, 1, 1, 1, 1, 1,
0.2834081, 1.013986, 0.1523535, 1, 1, 1, 1, 1,
0.2837362, 0.2151415, 1.008525, 1, 1, 1, 1, 1,
0.2893841, 0.2305894, 1.785392, 1, 1, 1, 1, 1,
0.2921404, 0.1694215, 1.804493, 1, 1, 1, 1, 1,
0.2963851, -0.09015955, 1.635493, 1, 1, 1, 1, 1,
0.2989854, -2.085379, 5.485689, 1, 1, 1, 1, 1,
0.2997034, -0.1032835, 2.019609, 1, 1, 1, 1, 1,
0.2999541, 0.3337679, 0.8532124, 1, 1, 1, 1, 1,
0.3006873, -0.2595624, 2.537066, 1, 1, 1, 1, 1,
0.3022362, 0.04638363, 0.9670269, 1, 1, 1, 1, 1,
0.3023587, 0.461056, 1.191705, 1, 1, 1, 1, 1,
0.3066696, -0.438324, 3.804822, 1, 1, 1, 1, 1,
0.3067968, 0.7741327, 0.8893585, 0, 0, 1, 1, 1,
0.3107343, -0.6156459, 4.687495, 1, 0, 0, 1, 1,
0.3141811, -0.6061001, 3.133887, 1, 0, 0, 1, 1,
0.3158418, -0.0508389, 0.5037178, 1, 0, 0, 1, 1,
0.3173299, 0.5966986, -0.4269847, 1, 0, 0, 1, 1,
0.3193808, 0.03061184, 2.072002, 1, 0, 0, 1, 1,
0.3193995, 0.8432736, 1.924461, 0, 0, 0, 1, 1,
0.3194775, -0.4814598, 1.955429, 0, 0, 0, 1, 1,
0.321491, 0.110798, 1.090856, 0, 0, 0, 1, 1,
0.3260283, 0.784128, -0.1228323, 0, 0, 0, 1, 1,
0.3326023, 0.3042743, -0.9125494, 0, 0, 0, 1, 1,
0.3365822, -1.332908, 2.466675, 0, 0, 0, 1, 1,
0.3388387, -0.1531294, 1.168233, 0, 0, 0, 1, 1,
0.3397896, 0.281487, 0.6712698, 1, 1, 1, 1, 1,
0.3402213, 1.277339, 0.5390256, 1, 1, 1, 1, 1,
0.3431677, -0.603556, 3.685317, 1, 1, 1, 1, 1,
0.3431834, 0.1488322, 2.06313, 1, 1, 1, 1, 1,
0.3441874, -0.7934477, 3.380607, 1, 1, 1, 1, 1,
0.346166, -2.136489, 0.971837, 1, 1, 1, 1, 1,
0.3477637, 0.1435756, 0.9238545, 1, 1, 1, 1, 1,
0.3605795, -1.336655, 3.746024, 1, 1, 1, 1, 1,
0.3607281, 0.2553921, -0.2436453, 1, 1, 1, 1, 1,
0.3671939, 1.356156, -1.41933, 1, 1, 1, 1, 1,
0.368863, -1.253382, 2.991478, 1, 1, 1, 1, 1,
0.3720083, -0.2028106, 1.809904, 1, 1, 1, 1, 1,
0.3724893, -0.9148832, 2.664352, 1, 1, 1, 1, 1,
0.3740281, -0.6738281, 1.321246, 1, 1, 1, 1, 1,
0.3749346, -0.2386437, 1.836368, 1, 1, 1, 1, 1,
0.3780345, -0.3833255, 2.10034, 0, 0, 1, 1, 1,
0.3797714, 0.9763902, -0.1556818, 1, 0, 0, 1, 1,
0.3830181, -1.795432, 4.838276, 1, 0, 0, 1, 1,
0.3831582, 1.421506, -0.8868154, 1, 0, 0, 1, 1,
0.3832337, -0.9979848, 3.560923, 1, 0, 0, 1, 1,
0.3900769, -1.282917, 3.36496, 1, 0, 0, 1, 1,
0.3902614, 1.048638, 0.7244943, 0, 0, 0, 1, 1,
0.3954964, 0.06859162, 2.707616, 0, 0, 0, 1, 1,
0.3992988, -0.3318241, 2.181414, 0, 0, 0, 1, 1,
0.4145547, -1.084338, 3.928052, 0, 0, 0, 1, 1,
0.4154434, 0.08254243, 2.966398, 0, 0, 0, 1, 1,
0.4197398, 1.149652, 1.314727, 0, 0, 0, 1, 1,
0.4283839, 0.8211844, 1.221417, 0, 0, 0, 1, 1,
0.4324768, 1.288097, 1.38081, 1, 1, 1, 1, 1,
0.4326558, -0.5784667, 2.228637, 1, 1, 1, 1, 1,
0.4378985, -0.5026262, 2.341518, 1, 1, 1, 1, 1,
0.4439264, -0.3466576, 2.112763, 1, 1, 1, 1, 1,
0.4466573, -0.9231481, 3.571715, 1, 1, 1, 1, 1,
0.4469891, 0.1680502, 2.534359, 1, 1, 1, 1, 1,
0.4517297, -1.739147, 3.862598, 1, 1, 1, 1, 1,
0.4579033, 0.1046067, 0.3116159, 1, 1, 1, 1, 1,
0.4579971, -1.453506, 2.874313, 1, 1, 1, 1, 1,
0.4613536, -1.21095, 0.872919, 1, 1, 1, 1, 1,
0.4658409, -0.6809461, 2.408672, 1, 1, 1, 1, 1,
0.4668796, -1.252343, 2.502494, 1, 1, 1, 1, 1,
0.4686072, 0.9355305, 0.4303287, 1, 1, 1, 1, 1,
0.4691604, -0.04677453, 3.313619, 1, 1, 1, 1, 1,
0.4729731, 0.7510943, 1.253817, 1, 1, 1, 1, 1,
0.4816765, -1.107015, 2.27684, 0, 0, 1, 1, 1,
0.5135732, -0.6228123, 3.091852, 1, 0, 0, 1, 1,
0.5166556, 0.4091044, 1.011509, 1, 0, 0, 1, 1,
0.5198218, -1.021071, 3.388329, 1, 0, 0, 1, 1,
0.5206277, 0.8060157, 0.159383, 1, 0, 0, 1, 1,
0.5221299, 1.843753, -1.454446, 1, 0, 0, 1, 1,
0.5244463, -0.7285953, 3.195572, 0, 0, 0, 1, 1,
0.5255114, -0.6080686, 2.952486, 0, 0, 0, 1, 1,
0.5261563, -0.7229651, 1.960706, 0, 0, 0, 1, 1,
0.5280318, 0.7275882, 1.067129, 0, 0, 0, 1, 1,
0.5331304, -1.118575, 2.754856, 0, 0, 0, 1, 1,
0.5351824, 0.336982, 1.059698, 0, 0, 0, 1, 1,
0.5360203, 0.4350043, 2.875086, 0, 0, 0, 1, 1,
0.5506166, -0.9451447, 1.90681, 1, 1, 1, 1, 1,
0.5523731, -0.04836684, 1.433721, 1, 1, 1, 1, 1,
0.5535296, 0.3082959, 1.579319, 1, 1, 1, 1, 1,
0.5541398, 1.965907, 0.2097304, 1, 1, 1, 1, 1,
0.5613106, -0.7291254, 1.932134, 1, 1, 1, 1, 1,
0.568615, -0.305342, 2.960791, 1, 1, 1, 1, 1,
0.5693743, -0.3118458, 3.19658, 1, 1, 1, 1, 1,
0.575197, 0.09292241, 0.9536836, 1, 1, 1, 1, 1,
0.575671, -0.5623913, 1.789495, 1, 1, 1, 1, 1,
0.5770316, -0.1679734, 3.011315, 1, 1, 1, 1, 1,
0.5774992, 0.5794475, 1.803655, 1, 1, 1, 1, 1,
0.5781127, 1.514928, -1.056709, 1, 1, 1, 1, 1,
0.5834471, 0.1345729, 3.221425, 1, 1, 1, 1, 1,
0.5835479, 1.014373, 1.897453, 1, 1, 1, 1, 1,
0.5857913, -1.367111, 2.179509, 1, 1, 1, 1, 1,
0.5889527, 0.2470222, 0.3242413, 0, 0, 1, 1, 1,
0.5894489, -0.187089, 1.696809, 1, 0, 0, 1, 1,
0.5898149, 0.3591345, 0.3780509, 1, 0, 0, 1, 1,
0.5904911, -1.855295, 3.556742, 1, 0, 0, 1, 1,
0.5914903, -0.5216787, 3.560963, 1, 0, 0, 1, 1,
0.5915782, -0.6168112, 3.758002, 1, 0, 0, 1, 1,
0.592261, 0.8630142, -0.221786, 0, 0, 0, 1, 1,
0.5939389, -1.85027, 2.070594, 0, 0, 0, 1, 1,
0.5953858, 0.5472102, 0.5894002, 0, 0, 0, 1, 1,
0.5959955, 1.575651, 0.06441457, 0, 0, 0, 1, 1,
0.597234, -1.000826, 4.01122, 0, 0, 0, 1, 1,
0.5986441, -2.077613, 0.871769, 0, 0, 0, 1, 1,
0.598921, 0.3218941, 0.08966526, 0, 0, 0, 1, 1,
0.6002386, -0.9984232, 0.9011683, 1, 1, 1, 1, 1,
0.6081681, -0.5073171, 0.4758797, 1, 1, 1, 1, 1,
0.6083007, 0.4702209, 0.184935, 1, 1, 1, 1, 1,
0.6084874, 0.1262774, 1.300668, 1, 1, 1, 1, 1,
0.6087014, 1.088944, 1.167967, 1, 1, 1, 1, 1,
0.6113215, 0.2302376, 0.9044235, 1, 1, 1, 1, 1,
0.6202881, 1.096836, 1.530155, 1, 1, 1, 1, 1,
0.6294104, -1.754266, 1.599696, 1, 1, 1, 1, 1,
0.6400472, 0.6456367, 0.3274003, 1, 1, 1, 1, 1,
0.6455233, 0.07262007, -0.2953602, 1, 1, 1, 1, 1,
0.6509346, -0.7372294, 3.256989, 1, 1, 1, 1, 1,
0.6560872, 1.134712, -1.064316, 1, 1, 1, 1, 1,
0.6587337, -0.5067189, 1.194414, 1, 1, 1, 1, 1,
0.6588709, -0.5779005, 1.13532, 1, 1, 1, 1, 1,
0.6642296, 1.282791, 3.096088, 1, 1, 1, 1, 1,
0.6684229, -0.274043, 2.652876, 0, 0, 1, 1, 1,
0.6693256, -0.5906683, 2.449785, 1, 0, 0, 1, 1,
0.6699601, -0.4371895, 2.349683, 1, 0, 0, 1, 1,
0.690477, 0.8938369, 0.2928659, 1, 0, 0, 1, 1,
0.6944818, -0.07274913, 2.420126, 1, 0, 0, 1, 1,
0.7039941, -0.8844742, 2.77777, 1, 0, 0, 1, 1,
0.7051353, 0.06663799, 1.010224, 0, 0, 0, 1, 1,
0.7083004, -0.1113645, 0.9837441, 0, 0, 0, 1, 1,
0.7141998, 1.176123, -0.4037376, 0, 0, 0, 1, 1,
0.7153747, 0.4506443, 0.79061, 0, 0, 0, 1, 1,
0.719644, -0.6771718, 3.199343, 0, 0, 0, 1, 1,
0.72914, 0.7928001, 1.428583, 0, 0, 0, 1, 1,
0.735533, 0.8612398, -0.690671, 0, 0, 0, 1, 1,
0.737655, -0.2928228, 1.595312, 1, 1, 1, 1, 1,
0.7391163, -0.4488265, 2.296435, 1, 1, 1, 1, 1,
0.7473254, 0.6744555, 2.183581, 1, 1, 1, 1, 1,
0.7486017, -0.8057234, 3.008117, 1, 1, 1, 1, 1,
0.7505196, 0.5949323, 1.553854, 1, 1, 1, 1, 1,
0.7549199, 1.251217, 1.728321, 1, 1, 1, 1, 1,
0.7551766, 0.2362646, 0.8949107, 1, 1, 1, 1, 1,
0.7558591, 0.3131006, -0.3118148, 1, 1, 1, 1, 1,
0.7609428, 0.1502798, 1.281631, 1, 1, 1, 1, 1,
0.7635783, -1.032306, 1.531164, 1, 1, 1, 1, 1,
0.768711, 0.55241, 1.224488, 1, 1, 1, 1, 1,
0.7700737, 0.1136122, 2.40804, 1, 1, 1, 1, 1,
0.7796033, -1.546404, 3.206367, 1, 1, 1, 1, 1,
0.7834929, 1.965126, 1.05244, 1, 1, 1, 1, 1,
0.7836261, 0.5849805, 2.209908, 1, 1, 1, 1, 1,
0.7880573, 1.635037, 0.668909, 0, 0, 1, 1, 1,
0.7920292, -1.997064, 1.936992, 1, 0, 0, 1, 1,
0.7954211, 0.3643824, 1.256398, 1, 0, 0, 1, 1,
0.7963809, -0.7860172, 1.759554, 1, 0, 0, 1, 1,
0.8088627, 0.6980616, 1.098327, 1, 0, 0, 1, 1,
0.8154472, 0.7208309, 0.9502577, 1, 0, 0, 1, 1,
0.8180398, 0.8198823, -0.7515959, 0, 0, 0, 1, 1,
0.8187593, 0.08959986, 0.6530873, 0, 0, 0, 1, 1,
0.8202279, 0.02743582, 2.362092, 0, 0, 0, 1, 1,
0.8252336, -0.9640489, 2.494087, 0, 0, 0, 1, 1,
0.8256075, -0.2072876, 2.799171, 0, 0, 0, 1, 1,
0.8276371, -0.4113834, 0.9013284, 0, 0, 0, 1, 1,
0.8290026, -1.104355, 3.396017, 0, 0, 0, 1, 1,
0.8334181, 0.7181411, 0.8320959, 1, 1, 1, 1, 1,
0.8335809, -0.09688342, 2.712015, 1, 1, 1, 1, 1,
0.8341389, -0.2498642, 4.047742, 1, 1, 1, 1, 1,
0.8354059, -1.633008, 3.465293, 1, 1, 1, 1, 1,
0.8383108, 0.05045234, 1.14348, 1, 1, 1, 1, 1,
0.8403386, -0.4363146, 1.624832, 1, 1, 1, 1, 1,
0.8439751, 0.7607468, 0.6058492, 1, 1, 1, 1, 1,
0.84795, 2.033802, 1.584362, 1, 1, 1, 1, 1,
0.8493389, 0.02804073, 0.7610208, 1, 1, 1, 1, 1,
0.8494706, 2.217457, 0.6531268, 1, 1, 1, 1, 1,
0.8553388, 1.352126, 0.2772585, 1, 1, 1, 1, 1,
0.8554393, -0.6155917, 2.213355, 1, 1, 1, 1, 1,
0.8637369, -0.3235144, 1.989312, 1, 1, 1, 1, 1,
0.8719758, 2.032811, 2.441128, 1, 1, 1, 1, 1,
0.8749909, 1.097056, 0.1739395, 1, 1, 1, 1, 1,
0.8807242, 0.4367762, 0.7810127, 0, 0, 1, 1, 1,
0.8923911, -0.09233788, -0.03953392, 1, 0, 0, 1, 1,
0.8933088, -0.5577979, 2.818901, 1, 0, 0, 1, 1,
0.8940467, 1.326363, 0.05922786, 1, 0, 0, 1, 1,
0.8964105, 1.381168, -2.380359, 1, 0, 0, 1, 1,
0.9033161, 1.079107, -1.197646, 1, 0, 0, 1, 1,
0.9069576, -0.847398, 1.894062, 0, 0, 0, 1, 1,
0.908766, -0.1966666, 2.257676, 0, 0, 0, 1, 1,
0.9091343, -0.1752252, 3.221369, 0, 0, 0, 1, 1,
0.9120901, 0.03402337, 1.645347, 0, 0, 0, 1, 1,
0.9149007, 0.5024682, -0.6425077, 0, 0, 0, 1, 1,
0.9193452, 1.753738, -0.5326841, 0, 0, 0, 1, 1,
0.9238312, -0.005543126, 2.697684, 0, 0, 0, 1, 1,
0.9272825, -1.439911, 2.664861, 1, 1, 1, 1, 1,
0.9284602, 0.06542449, 1.337086, 1, 1, 1, 1, 1,
0.9287438, -1.709765, 2.469081, 1, 1, 1, 1, 1,
0.9296468, -0.2978427, 1.915583, 1, 1, 1, 1, 1,
0.9355275, -1.073883, 1.555286, 1, 1, 1, 1, 1,
0.9449145, -0.0862392, 1.364698, 1, 1, 1, 1, 1,
0.9468514, -1.778926, 2.688496, 1, 1, 1, 1, 1,
0.9484923, 0.2234581, -0.6947864, 1, 1, 1, 1, 1,
0.9538431, 0.1601467, 2.879266, 1, 1, 1, 1, 1,
0.9585656, -0.8679333, 3.530793, 1, 1, 1, 1, 1,
0.959226, -0.6161029, 1.025167, 1, 1, 1, 1, 1,
0.9602925, -0.2036002, 2.39228, 1, 1, 1, 1, 1,
0.9608331, 1.071428, -0.134712, 1, 1, 1, 1, 1,
0.9680384, 1.879633, 0.964862, 1, 1, 1, 1, 1,
0.9764055, 1.945412, 0.80855, 1, 1, 1, 1, 1,
0.9810628, -2.036699, 2.274013, 0, 0, 1, 1, 1,
0.9867743, 0.7591336, -0.4312441, 1, 0, 0, 1, 1,
0.9880857, -0.7189164, 2.83821, 1, 0, 0, 1, 1,
0.9892197, 0.2874926, 1.360309, 1, 0, 0, 1, 1,
0.9972275, -0.4149644, 3.256839, 1, 0, 0, 1, 1,
0.998543, 1.336959, 2.6495, 1, 0, 0, 1, 1,
1.001389, 1.102414, 0.7217617, 0, 0, 0, 1, 1,
1.002152, -1.802091, -0.04197665, 0, 0, 0, 1, 1,
1.005817, -1.444148, 1.893039, 0, 0, 0, 1, 1,
1.013468, -0.7009497, 1.064768, 0, 0, 0, 1, 1,
1.017289, -0.2022467, 2.633976, 0, 0, 0, 1, 1,
1.018451, -1.209712, 3.153913, 0, 0, 0, 1, 1,
1.018517, -0.2592521, 2.602284, 0, 0, 0, 1, 1,
1.019298, 0.6589051, 0.3141085, 1, 1, 1, 1, 1,
1.023277, -0.7478723, -1.268982, 1, 1, 1, 1, 1,
1.024588, 0.1192652, 1.562895, 1, 1, 1, 1, 1,
1.024727, -1.569556, 2.130357, 1, 1, 1, 1, 1,
1.028122, 0.9441304, 0.6137482, 1, 1, 1, 1, 1,
1.030011, -1.066926, 1.605965, 1, 1, 1, 1, 1,
1.036843, -0.8895848, 1.412918, 1, 1, 1, 1, 1,
1.044619, -0.1175208, 3.045095, 1, 1, 1, 1, 1,
1.045492, 1.34594, 1.700986, 1, 1, 1, 1, 1,
1.047292, -1.547001, 3.96771, 1, 1, 1, 1, 1,
1.048158, 0.7646783, 3.558258, 1, 1, 1, 1, 1,
1.056589, -1.915206, 3.305758, 1, 1, 1, 1, 1,
1.064021, 0.1095613, -0.3950804, 1, 1, 1, 1, 1,
1.064658, -0.264318, 3.829467, 1, 1, 1, 1, 1,
1.075459, -0.2281009, 1.64926, 1, 1, 1, 1, 1,
1.079296, 0.01605287, 1.682087, 0, 0, 1, 1, 1,
1.079767, -0.3698381, 2.213496, 1, 0, 0, 1, 1,
1.082058, 0.5704964, 0.3977295, 1, 0, 0, 1, 1,
1.089595, 0.6374888, 2.213019, 1, 0, 0, 1, 1,
1.090499, -0.812484, 2.766629, 1, 0, 0, 1, 1,
1.099636, -0.5814131, 1.236819, 1, 0, 0, 1, 1,
1.102526, 0.1943102, 1.043736, 0, 0, 0, 1, 1,
1.107095, 2.199643, -0.8757378, 0, 0, 0, 1, 1,
1.111158, -0.9593925, 1.430449, 0, 0, 0, 1, 1,
1.113947, 0.08252507, 2.393852, 0, 0, 0, 1, 1,
1.119548, -0.09725944, 1.27885, 0, 0, 0, 1, 1,
1.120484, 1.633218, 1.118743, 0, 0, 0, 1, 1,
1.1254, 1.647722, 0.2205229, 0, 0, 0, 1, 1,
1.128796, 0.4230078, 1.031772, 1, 1, 1, 1, 1,
1.143207, 0.09223805, 1.358355, 1, 1, 1, 1, 1,
1.143528, 0.5052838, 0.9411767, 1, 1, 1, 1, 1,
1.146257, -0.4502833, 1.700642, 1, 1, 1, 1, 1,
1.15006, -0.7281766, 0.8255664, 1, 1, 1, 1, 1,
1.151738, -1.77108, 4.348754, 1, 1, 1, 1, 1,
1.153951, -1.197015, 0.999944, 1, 1, 1, 1, 1,
1.164219, 0.8221714, -0.3235538, 1, 1, 1, 1, 1,
1.170286, -0.3284963, 3.33558, 1, 1, 1, 1, 1,
1.175019, -0.08231238, 3.085812, 1, 1, 1, 1, 1,
1.180397, -0.372705, 0.619181, 1, 1, 1, 1, 1,
1.194736, -0.5183922, 3.492448, 1, 1, 1, 1, 1,
1.198368, -1.540211, 1.535642, 1, 1, 1, 1, 1,
1.211099, -1.253167, 2.702813, 1, 1, 1, 1, 1,
1.22269, 0.9293186, 1.733505, 1, 1, 1, 1, 1,
1.247115, -1.300383, 2.65584, 0, 0, 1, 1, 1,
1.248111, -0.20832, 0.3274523, 1, 0, 0, 1, 1,
1.275606, -1.315801, 1.129236, 1, 0, 0, 1, 1,
1.279332, -0.241064, 0.2433083, 1, 0, 0, 1, 1,
1.286478, -1.045132, 3.132774, 1, 0, 0, 1, 1,
1.291286, 0.1602304, -0.5312631, 1, 0, 0, 1, 1,
1.306895, 0.8709706, 1.454935, 0, 0, 0, 1, 1,
1.307391, -0.8310368, 4.989935, 0, 0, 0, 1, 1,
1.308956, 1.38044, 0.8459768, 0, 0, 0, 1, 1,
1.311477, 1.548699, -1.567642, 0, 0, 0, 1, 1,
1.31399, -0.3707884, 2.60139, 0, 0, 0, 1, 1,
1.314445, -1.104009, 1.766181, 0, 0, 0, 1, 1,
1.316579, -1.187655, 1.671274, 0, 0, 0, 1, 1,
1.327384, 0.5133685, 3.281248, 1, 1, 1, 1, 1,
1.337973, 0.67686, 0.5472404, 1, 1, 1, 1, 1,
1.338225, 0.7223775, 2.203431, 1, 1, 1, 1, 1,
1.338795, 1.482805, 1.648031, 1, 1, 1, 1, 1,
1.339366, -1.15151, 2.317036, 1, 1, 1, 1, 1,
1.342746, 0.008046666, 2.797302, 1, 1, 1, 1, 1,
1.349558, -0.7140808, 4.216333, 1, 1, 1, 1, 1,
1.350952, -0.01390299, 2.696468, 1, 1, 1, 1, 1,
1.353121, -1.324795, 3.21769, 1, 1, 1, 1, 1,
1.359483, -0.6660696, 1.708803, 1, 1, 1, 1, 1,
1.377019, -1.713059, 1.167441, 1, 1, 1, 1, 1,
1.379521, 1.637231, 0.4735946, 1, 1, 1, 1, 1,
1.391566, 0.5805033, 1.654022, 1, 1, 1, 1, 1,
1.417434, 0.6533546, -0.1082269, 1, 1, 1, 1, 1,
1.417676, -1.259436, 0.2898895, 1, 1, 1, 1, 1,
1.422286, -0.9825416, 2.477556, 0, 0, 1, 1, 1,
1.438422, 0.605278, -0.6083374, 1, 0, 0, 1, 1,
1.444088, 0.01172417, 2.011958, 1, 0, 0, 1, 1,
1.46257, 0.3095008, -0.2110305, 1, 0, 0, 1, 1,
1.462985, -1.618081, 2.692993, 1, 0, 0, 1, 1,
1.476257, -0.6028896, 3.756911, 1, 0, 0, 1, 1,
1.480986, 0.3814604, 1.937213, 0, 0, 0, 1, 1,
1.487877, 0.1107322, 2.288156, 0, 0, 0, 1, 1,
1.487946, -1.210923, 2.768024, 0, 0, 0, 1, 1,
1.49219, -1.614769, 2.265431, 0, 0, 0, 1, 1,
1.513831, -1.743906, 2.548227, 0, 0, 0, 1, 1,
1.522268, -0.7621015, 0.5146751, 0, 0, 0, 1, 1,
1.534367, 0.4292857, 1.956626, 0, 0, 0, 1, 1,
1.541853, -0.102388, 1.137596, 1, 1, 1, 1, 1,
1.560681, 0.5791947, 2.667536, 1, 1, 1, 1, 1,
1.56183, 1.150882, 0.5410345, 1, 1, 1, 1, 1,
1.583338, -0.1519222, 2.12999, 1, 1, 1, 1, 1,
1.589691, -0.328195, 1.742044, 1, 1, 1, 1, 1,
1.592738, -0.5884755, 0.4181897, 1, 1, 1, 1, 1,
1.593299, -0.2724975, 1.333293, 1, 1, 1, 1, 1,
1.593723, 0.02959479, 1.42389, 1, 1, 1, 1, 1,
1.60254, -0.5058918, 2.167802, 1, 1, 1, 1, 1,
1.611602, 0.6478017, 1.906139, 1, 1, 1, 1, 1,
1.617988, -1.52779, 1.132239, 1, 1, 1, 1, 1,
1.619089, -0.1139836, 0.9774174, 1, 1, 1, 1, 1,
1.628475, 0.8211925, -0.08388594, 1, 1, 1, 1, 1,
1.646232, 2.821322, 1.331349, 1, 1, 1, 1, 1,
1.647576, 0.4705974, 2.546632, 1, 1, 1, 1, 1,
1.652781, -0.6430353, 2.688153, 0, 0, 1, 1, 1,
1.66114, 0.5598666, 0.291876, 1, 0, 0, 1, 1,
1.663117, 1.492617, 1.775402, 1, 0, 0, 1, 1,
1.663544, -1.354941, 3.102935, 1, 0, 0, 1, 1,
1.69286, 0.6697214, -1.122625, 1, 0, 0, 1, 1,
1.700787, -0.7755136, 0.7840182, 1, 0, 0, 1, 1,
1.712452, 0.5694751, 2.859159, 0, 0, 0, 1, 1,
1.714922, -0.38539, 2.067971, 0, 0, 0, 1, 1,
1.719624, -0.02428064, 1.855496, 0, 0, 0, 1, 1,
1.720511, -0.719682, 1.624019, 0, 0, 0, 1, 1,
1.733597, -0.6014384, 0.8470911, 0, 0, 0, 1, 1,
1.736069, 0.2363512, 1.03676, 0, 0, 0, 1, 1,
1.74289, 1.293425, 1.710678, 0, 0, 0, 1, 1,
1.766897, -1.388653, 2.696739, 1, 1, 1, 1, 1,
1.772278, -0.4742517, 1.316872, 1, 1, 1, 1, 1,
1.793697, 1.239756, 0.01083872, 1, 1, 1, 1, 1,
1.841688, -0.6500075, 1.907403, 1, 1, 1, 1, 1,
1.84402, -0.5589147, 1.28308, 1, 1, 1, 1, 1,
1.871594, -1.131038, 2.777629, 1, 1, 1, 1, 1,
1.871607, 0.2126329, 2.098526, 1, 1, 1, 1, 1,
1.876141, -1.2885, 1.817059, 1, 1, 1, 1, 1,
1.876174, -1.001252, 3.649421, 1, 1, 1, 1, 1,
1.903236, -0.1990759, 2.061054, 1, 1, 1, 1, 1,
1.904685, -1.537293, 2.407279, 1, 1, 1, 1, 1,
1.961045, -0.05198529, 0.6438524, 1, 1, 1, 1, 1,
1.989121, -0.1785704, 0.9731752, 1, 1, 1, 1, 1,
1.999534, -0.5585434, 2.10126, 1, 1, 1, 1, 1,
2.010561, 1.81276, 2.074595, 1, 1, 1, 1, 1,
2.055475, 0.3195806, 2.950275, 0, 0, 1, 1, 1,
2.065875, 0.2169288, 2.243949, 1, 0, 0, 1, 1,
2.108531, 2.463356, 2.350257, 1, 0, 0, 1, 1,
2.12254, 0.5080462, 0.9892373, 1, 0, 0, 1, 1,
2.145959, -0.4760258, 1.375746, 1, 0, 0, 1, 1,
2.158409, -0.4168575, 1.126953, 1, 0, 0, 1, 1,
2.167967, -0.1159049, 3.205954, 0, 0, 0, 1, 1,
2.206214, 0.3748013, 1.09958, 0, 0, 0, 1, 1,
2.221694, 0.5624993, 1.832145, 0, 0, 0, 1, 1,
2.326475, -0.07321668, 1.889108, 0, 0, 0, 1, 1,
2.447953, 0.5275297, 1.394027, 0, 0, 0, 1, 1,
2.515688, -0.7158651, 0.8231014, 0, 0, 0, 1, 1,
2.533784, 0.1052809, 0.6173943, 0, 0, 0, 1, 1,
2.605838, -1.763335, 1.811843, 1, 1, 1, 1, 1,
2.671876, -0.5229702, 1.205124, 1, 1, 1, 1, 1,
2.967248, 0.3742896, 2.343591, 1, 1, 1, 1, 1,
3.121279, -1.150381, 1.9285, 1, 1, 1, 1, 1,
3.210113, -1.095521, 2.461807, 1, 1, 1, 1, 1,
3.225902, -0.4844668, 1.781745, 1, 1, 1, 1, 1,
4.27937, 2.203255, 1.383643, 1, 1, 1, 1, 1
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
var radius = 9.925013;
var distance = 34.86119;
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
mvMatrix.translate( -0.6464276, -0.05153918, 0.2734723 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.86119);
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
