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
-3.292449, 0.6898636, -2.049751, 1, 0, 0, 1,
-2.941339, -0.9585577, -2.260894, 1, 0.007843138, 0, 1,
-2.936318, 2.343509, -1.94979, 1, 0.01176471, 0, 1,
-2.832451, -0.3527514, -1.469535, 1, 0.01960784, 0, 1,
-2.73668, -0.2662166, -1.342673, 1, 0.02352941, 0, 1,
-2.727938, 2.39449, -0.9921159, 1, 0.03137255, 0, 1,
-2.617322, 0.1641418, 0.6214627, 1, 0.03529412, 0, 1,
-2.472834, -0.8475823, -1.674533, 1, 0.04313726, 0, 1,
-2.466529, -0.4076845, -1.600164, 1, 0.04705882, 0, 1,
-2.402405, 1.601677, -1.952145, 1, 0.05490196, 0, 1,
-2.33533, -0.1678462, -1.040402, 1, 0.05882353, 0, 1,
-2.289219, 0.9056203, -0.7096109, 1, 0.06666667, 0, 1,
-2.287594, -0.2137129, -0.05651797, 1, 0.07058824, 0, 1,
-2.260573, -1.201399, -0.6478634, 1, 0.07843138, 0, 1,
-2.211318, -0.5140282, -2.82094, 1, 0.08235294, 0, 1,
-2.143908, -0.7608581, -1.42577, 1, 0.09019608, 0, 1,
-2.142135, -0.9231108, -1.849607, 1, 0.09411765, 0, 1,
-2.085287, 0.6327945, -2.097879, 1, 0.1019608, 0, 1,
-2.038745, 0.229899, -2.11586, 1, 0.1098039, 0, 1,
-2.03548, 0.6315172, -0.1230187, 1, 0.1137255, 0, 1,
-2.001099, -0.6900227, -3.308932, 1, 0.1215686, 0, 1,
-1.999281, -0.05423393, -1.406498, 1, 0.1254902, 0, 1,
-1.99903, -0.8097892, -3.764156, 1, 0.1333333, 0, 1,
-1.99495, -2.099926, -1.151332, 1, 0.1372549, 0, 1,
-1.980784, 0.2186532, -1.748531, 1, 0.145098, 0, 1,
-1.976879, 0.04319031, -2.26351, 1, 0.1490196, 0, 1,
-1.9634, -2.479697, 0.8179173, 1, 0.1568628, 0, 1,
-1.937375, 0.2621507, -1.696967, 1, 0.1607843, 0, 1,
-1.931002, 0.09190002, -1.109985, 1, 0.1686275, 0, 1,
-1.86384, 0.8688588, -1.268409, 1, 0.172549, 0, 1,
-1.855263, 1.175575, -0.5323343, 1, 0.1803922, 0, 1,
-1.854251, 1.826296, -0.2492247, 1, 0.1843137, 0, 1,
-1.853579, -0.6301686, -3.02695, 1, 0.1921569, 0, 1,
-1.834749, 0.921176, -1.50556, 1, 0.1960784, 0, 1,
-1.802379, -0.8562831, -2.210721, 1, 0.2039216, 0, 1,
-1.796261, 2.47042, -1.310988, 1, 0.2117647, 0, 1,
-1.786553, -0.181124, -1.774325, 1, 0.2156863, 0, 1,
-1.745896, -1.165601, 0.2157695, 1, 0.2235294, 0, 1,
-1.742871, 0.1534135, -2.608287, 1, 0.227451, 0, 1,
-1.719553, -1.778594, -3.50566, 1, 0.2352941, 0, 1,
-1.714173, -0.6073495, -1.314001, 1, 0.2392157, 0, 1,
-1.713813, 0.4485521, -1.640282, 1, 0.2470588, 0, 1,
-1.704794, 0.08596501, -0.7837182, 1, 0.2509804, 0, 1,
-1.700805, 1.079512, -0.01257127, 1, 0.2588235, 0, 1,
-1.698764, -0.3280706, -2.63291, 1, 0.2627451, 0, 1,
-1.695743, -0.7409693, -3.012622, 1, 0.2705882, 0, 1,
-1.670851, 0.05621514, -1.800999, 1, 0.2745098, 0, 1,
-1.656896, -0.3341136, -1.638767, 1, 0.282353, 0, 1,
-1.648724, 0.1286476, -0.9713793, 1, 0.2862745, 0, 1,
-1.647624, -0.09643111, -0.427236, 1, 0.2941177, 0, 1,
-1.638035, 0.006657015, -1.394501, 1, 0.3019608, 0, 1,
-1.634753, 0.3542048, -1.741372, 1, 0.3058824, 0, 1,
-1.630161, -0.3852177, -1.35988, 1, 0.3137255, 0, 1,
-1.627131, 0.4413768, 0.1981512, 1, 0.3176471, 0, 1,
-1.622855, -0.4962038, -1.922098, 1, 0.3254902, 0, 1,
-1.620601, 0.3367864, -0.354954, 1, 0.3294118, 0, 1,
-1.593938, 0.1376814, -0.8117382, 1, 0.3372549, 0, 1,
-1.590777, -0.9385875, -3.34698, 1, 0.3411765, 0, 1,
-1.5755, -0.4381852, -1.825948, 1, 0.3490196, 0, 1,
-1.572926, -0.5455502, -2.053943, 1, 0.3529412, 0, 1,
-1.555214, 0.3384445, -1.545972, 1, 0.3607843, 0, 1,
-1.548397, 2.105169, -0.3165546, 1, 0.3647059, 0, 1,
-1.513908, 0.08142587, -1.619026, 1, 0.372549, 0, 1,
-1.505386, 0.3893364, -1.289207, 1, 0.3764706, 0, 1,
-1.484593, -0.9787478, -0.8912717, 1, 0.3843137, 0, 1,
-1.480358, 0.4143523, -1.236346, 1, 0.3882353, 0, 1,
-1.478183, -1.398579, -3.058447, 1, 0.3960784, 0, 1,
-1.475273, 1.079913, 0.5120652, 1, 0.4039216, 0, 1,
-1.466474, 1.488694, 0.2160156, 1, 0.4078431, 0, 1,
-1.466301, 1.309755, 2.006861, 1, 0.4156863, 0, 1,
-1.465555, 1.384199, -0.6615547, 1, 0.4196078, 0, 1,
-1.462654, 1.120683, -1.639367, 1, 0.427451, 0, 1,
-1.456965, -1.772607, -2.435511, 1, 0.4313726, 0, 1,
-1.447068, -0.157529, -1.558672, 1, 0.4392157, 0, 1,
-1.418544, 1.380896, -0.548961, 1, 0.4431373, 0, 1,
-1.412382, 0.6088924, -1.237776, 1, 0.4509804, 0, 1,
-1.410953, -0.8051828, -1.804776, 1, 0.454902, 0, 1,
-1.403772, -0.3012111, -3.816533, 1, 0.4627451, 0, 1,
-1.400933, 0.5910039, -0.8350399, 1, 0.4666667, 0, 1,
-1.399133, -1.229074, -2.362253, 1, 0.4745098, 0, 1,
-1.393114, -0.5418734, -2.060725, 1, 0.4784314, 0, 1,
-1.392306, 0.4424453, -1.790936, 1, 0.4862745, 0, 1,
-1.38662, -0.03241778, -0.558756, 1, 0.4901961, 0, 1,
-1.382101, -0.2277085, -2.865445, 1, 0.4980392, 0, 1,
-1.375491, 0.2402684, -0.798479, 1, 0.5058824, 0, 1,
-1.372342, 1.012643, -1.234795, 1, 0.509804, 0, 1,
-1.371329, 0.5784107, 0.5777437, 1, 0.5176471, 0, 1,
-1.363679, 2.218326, -0.05142758, 1, 0.5215687, 0, 1,
-1.357627, -0.5199981, -2.215276, 1, 0.5294118, 0, 1,
-1.354932, 1.089555, -2.706558, 1, 0.5333334, 0, 1,
-1.337606, -1.249622, -1.619934, 1, 0.5411765, 0, 1,
-1.336963, -0.6874821, -3.359576, 1, 0.5450981, 0, 1,
-1.335539, 0.8801818, -1.366879, 1, 0.5529412, 0, 1,
-1.327622, -1.326169, -2.318763, 1, 0.5568628, 0, 1,
-1.320344, -1.009784, -1.306844, 1, 0.5647059, 0, 1,
-1.307438, -1.343291, -1.418277, 1, 0.5686275, 0, 1,
-1.306768, -0.05387513, -2.753, 1, 0.5764706, 0, 1,
-1.305043, -0.1720922, -3.25333, 1, 0.5803922, 0, 1,
-1.293333, -1.060585, -1.092449, 1, 0.5882353, 0, 1,
-1.28444, -0.3842046, -2.006627, 1, 0.5921569, 0, 1,
-1.281882, -0.3278019, 0.5151566, 1, 0.6, 0, 1,
-1.280862, 2.86853, -1.230754, 1, 0.6078432, 0, 1,
-1.26168, -1.371511, -0.991336, 1, 0.6117647, 0, 1,
-1.259504, 0.1052265, -1.45446, 1, 0.6196079, 0, 1,
-1.251462, 1.994741, -0.04523285, 1, 0.6235294, 0, 1,
-1.251421, -0.1502495, -2.599771, 1, 0.6313726, 0, 1,
-1.245842, 1.307309, -0.8332711, 1, 0.6352941, 0, 1,
-1.242675, -0.06226749, -1.048137, 1, 0.6431373, 0, 1,
-1.239262, -0.6292313, -1.947167, 1, 0.6470588, 0, 1,
-1.236521, -1.768764, -2.236598, 1, 0.654902, 0, 1,
-1.229945, -0.335365, -2.47881, 1, 0.6588235, 0, 1,
-1.22772, -1.275749, -0.7621737, 1, 0.6666667, 0, 1,
-1.227387, -0.1210541, -2.261836, 1, 0.6705883, 0, 1,
-1.226634, 0.07829438, -1.077316, 1, 0.6784314, 0, 1,
-1.220146, -0.209271, -0.03115576, 1, 0.682353, 0, 1,
-1.217745, 0.44022, -0.8812156, 1, 0.6901961, 0, 1,
-1.216065, -1.902213, -2.504267, 1, 0.6941177, 0, 1,
-1.210992, 0.508031, -0.5949356, 1, 0.7019608, 0, 1,
-1.207656, 0.7104067, -1.984031, 1, 0.7098039, 0, 1,
-1.200301, -1.498233, -1.176447, 1, 0.7137255, 0, 1,
-1.197275, 1.74611, -1.592985, 1, 0.7215686, 0, 1,
-1.197208, -1.790175, -1.386378, 1, 0.7254902, 0, 1,
-1.196784, -1.367709, -3.815786, 1, 0.7333333, 0, 1,
-1.196773, 1.574653, -1.716881, 1, 0.7372549, 0, 1,
-1.182954, 0.5162764, -3.25171, 1, 0.7450981, 0, 1,
-1.181257, -0.3785592, -3.302617, 1, 0.7490196, 0, 1,
-1.178537, -0.7181429, -2.67323, 1, 0.7568628, 0, 1,
-1.177528, 0.4333656, -0.4350439, 1, 0.7607843, 0, 1,
-1.174494, 0.3341916, -1.349136, 1, 0.7686275, 0, 1,
-1.170689, 1.77233, -1.040055, 1, 0.772549, 0, 1,
-1.168494, -0.4818631, -2.052991, 1, 0.7803922, 0, 1,
-1.166104, -0.3410383, -1.000934, 1, 0.7843137, 0, 1,
-1.164948, -0.1065861, -1.088341, 1, 0.7921569, 0, 1,
-1.161649, 0.718327, -0.7381496, 1, 0.7960784, 0, 1,
-1.159753, 0.506718, -1.675417, 1, 0.8039216, 0, 1,
-1.156945, 0.24424, -0.2963304, 1, 0.8117647, 0, 1,
-1.153181, -0.02237354, -3.590384, 1, 0.8156863, 0, 1,
-1.149362, -1.482844, -2.613957, 1, 0.8235294, 0, 1,
-1.146083, 1.039037, 0.6797491, 1, 0.827451, 0, 1,
-1.139046, -0.3689339, -2.832224, 1, 0.8352941, 0, 1,
-1.138015, -0.7305309, -2.671843, 1, 0.8392157, 0, 1,
-1.133768, 1.539851, -0.3297865, 1, 0.8470588, 0, 1,
-1.128235, -0.1095569, -0.9089583, 1, 0.8509804, 0, 1,
-1.115374, -0.5932693, -2.484068, 1, 0.8588235, 0, 1,
-1.112329, 0.06487252, -2.549972, 1, 0.8627451, 0, 1,
-1.11162, -1.725618, -1.335992, 1, 0.8705882, 0, 1,
-1.108534, -0.9374997, -2.034184, 1, 0.8745098, 0, 1,
-1.107714, 1.120946, -1.393598, 1, 0.8823529, 0, 1,
-1.107118, -0.3776901, -0.6384976, 1, 0.8862745, 0, 1,
-1.099061, 0.398896, -1.053319, 1, 0.8941177, 0, 1,
-1.098484, 0.2463734, -1.776646, 1, 0.8980392, 0, 1,
-1.094936, 0.5793421, -1.844388, 1, 0.9058824, 0, 1,
-1.093316, -0.539632, -1.725591, 1, 0.9137255, 0, 1,
-1.089632, 0.1238063, -1.397975, 1, 0.9176471, 0, 1,
-1.08805, -1.458565, -3.196069, 1, 0.9254902, 0, 1,
-1.086879, 1.695194, -1.470347, 1, 0.9294118, 0, 1,
-1.083632, -0.5897909, -1.060163, 1, 0.9372549, 0, 1,
-1.077435, 1.169927, -1.126875, 1, 0.9411765, 0, 1,
-1.075196, 0.2921337, -1.347876, 1, 0.9490196, 0, 1,
-1.074033, -0.1852738, -2.544632, 1, 0.9529412, 0, 1,
-1.067476, -0.1323292, -2.95231, 1, 0.9607843, 0, 1,
-1.065665, 0.6382596, -1.037661, 1, 0.9647059, 0, 1,
-1.058348, 0.7370583, 1.082547, 1, 0.972549, 0, 1,
-1.047238, -0.7852558, -3.242771, 1, 0.9764706, 0, 1,
-1.038882, 0.6876959, -2.048136, 1, 0.9843137, 0, 1,
-1.035919, -0.182755, -0.6707283, 1, 0.9882353, 0, 1,
-1.033825, 0.9818686, 0.3093193, 1, 0.9960784, 0, 1,
-1.03025, -0.3324717, -2.339444, 0.9960784, 1, 0, 1,
-1.028289, 0.8907359, -1.468297, 0.9921569, 1, 0, 1,
-1.015973, -0.4878385, -2.278409, 0.9843137, 1, 0, 1,
-1.015754, 0.1627097, -0.8725255, 0.9803922, 1, 0, 1,
-1.014659, -0.5475727, -1.177696, 0.972549, 1, 0, 1,
-1.01124, -1.457631, -1.202291, 0.9686275, 1, 0, 1,
-0.9748263, 0.2252299, -1.679388, 0.9607843, 1, 0, 1,
-0.9687189, -0.6741011, -3.343908, 0.9568627, 1, 0, 1,
-0.9667342, -1.188862, -2.929341, 0.9490196, 1, 0, 1,
-0.9609922, -0.4966129, -1.817828, 0.945098, 1, 0, 1,
-0.9578673, 1.623854, -0.72982, 0.9372549, 1, 0, 1,
-0.9519476, -1.237578, -4.286485, 0.9333333, 1, 0, 1,
-0.9488252, -0.9270701, -2.047928, 0.9254902, 1, 0, 1,
-0.9468727, 0.2096874, -1.821734, 0.9215686, 1, 0, 1,
-0.9433693, 0.2552616, -2.488239, 0.9137255, 1, 0, 1,
-0.9345582, -0.8921069, -2.757283, 0.9098039, 1, 0, 1,
-0.9306176, -0.2669449, -3.907664, 0.9019608, 1, 0, 1,
-0.927806, 0.3835481, -0.06134251, 0.8941177, 1, 0, 1,
-0.9274369, 1.973252, 0.7540868, 0.8901961, 1, 0, 1,
-0.9232873, 2.00224, -0.4011354, 0.8823529, 1, 0, 1,
-0.9181772, -1.936578, -2.254099, 0.8784314, 1, 0, 1,
-0.9173238, -0.4795532, -1.981089, 0.8705882, 1, 0, 1,
-0.9151953, 0.4298801, -1.050141, 0.8666667, 1, 0, 1,
-0.9109858, 0.7037978, -0.384653, 0.8588235, 1, 0, 1,
-0.8913921, 1.470231, -0.6229298, 0.854902, 1, 0, 1,
-0.8907422, 1.424027, 1.586501, 0.8470588, 1, 0, 1,
-0.8855817, -1.198534, -1.930916, 0.8431373, 1, 0, 1,
-0.8820852, -2.070272, -3.83902, 0.8352941, 1, 0, 1,
-0.8805301, -0.1692403, -2.123916, 0.8313726, 1, 0, 1,
-0.8787642, -0.8020803, -2.04925, 0.8235294, 1, 0, 1,
-0.8774876, 0.4012978, -1.142046, 0.8196079, 1, 0, 1,
-0.8750517, -1.90478, -1.798513, 0.8117647, 1, 0, 1,
-0.8691818, -0.3841902, -2.6573, 0.8078431, 1, 0, 1,
-0.8687384, -0.03628697, -1.656104, 0.8, 1, 0, 1,
-0.8640522, -1.263117, -0.6855467, 0.7921569, 1, 0, 1,
-0.8639941, -0.6727548, -2.915202, 0.7882353, 1, 0, 1,
-0.8635706, -0.5271592, -3.788822, 0.7803922, 1, 0, 1,
-0.857716, -0.03782192, -0.5996633, 0.7764706, 1, 0, 1,
-0.8541941, 1.077572, -1.598173, 0.7686275, 1, 0, 1,
-0.8527562, 0.9967649, -0.02618681, 0.7647059, 1, 0, 1,
-0.8468221, -0.08371153, -1.243212, 0.7568628, 1, 0, 1,
-0.8406581, -0.1648556, -3.170103, 0.7529412, 1, 0, 1,
-0.838178, -1.349693, -1.498743, 0.7450981, 1, 0, 1,
-0.8274025, 0.4617303, -2.345832, 0.7411765, 1, 0, 1,
-0.8205038, -0.8283785, -3.224222, 0.7333333, 1, 0, 1,
-0.8114762, 1.671394, -1.264173, 0.7294118, 1, 0, 1,
-0.8112855, -1.654606, -4.291776, 0.7215686, 1, 0, 1,
-0.8069031, -0.1003694, -2.422317, 0.7176471, 1, 0, 1,
-0.8044313, 0.07055884, -0.09383048, 0.7098039, 1, 0, 1,
-0.8030021, 0.3754157, -1.119472, 0.7058824, 1, 0, 1,
-0.8011723, 0.3559038, -1.141525, 0.6980392, 1, 0, 1,
-0.7972269, -0.6205593, -1.45131, 0.6901961, 1, 0, 1,
-0.7951294, -0.1103381, -2.461363, 0.6862745, 1, 0, 1,
-0.7947883, 1.530453, -0.1160771, 0.6784314, 1, 0, 1,
-0.7947661, -1.522108, -2.634979, 0.6745098, 1, 0, 1,
-0.7946928, 0.218258, -1.411634, 0.6666667, 1, 0, 1,
-0.7923711, 0.9580233, -0.8863169, 0.6627451, 1, 0, 1,
-0.7918928, -2.348003, -3.386194, 0.654902, 1, 0, 1,
-0.7840441, -0.7992733, -1.126824, 0.6509804, 1, 0, 1,
-0.7758173, -1.38621, -3.605252, 0.6431373, 1, 0, 1,
-0.7738041, 0.5470841, -1.373925, 0.6392157, 1, 0, 1,
-0.7730219, 0.1482946, -0.6253807, 0.6313726, 1, 0, 1,
-0.7675977, 1.336842, -0.6023625, 0.627451, 1, 0, 1,
-0.7659155, 1.627926, -0.5066658, 0.6196079, 1, 0, 1,
-0.7655627, -1.106282, -3.173879, 0.6156863, 1, 0, 1,
-0.7635726, 0.860678, -1.186415, 0.6078432, 1, 0, 1,
-0.760421, -0.6369587, -2.152067, 0.6039216, 1, 0, 1,
-0.7448038, 0.7695382, -2.410307, 0.5960785, 1, 0, 1,
-0.7442093, 1.29288, -1.378559, 0.5882353, 1, 0, 1,
-0.7304308, -1.172651, -4.737384, 0.5843138, 1, 0, 1,
-0.7287554, 0.4579823, -1.793543, 0.5764706, 1, 0, 1,
-0.7238704, -0.417096, -1.853614, 0.572549, 1, 0, 1,
-0.7145918, 0.6820635, -1.419289, 0.5647059, 1, 0, 1,
-0.7128708, -0.8883095, -2.073279, 0.5607843, 1, 0, 1,
-0.7112545, -0.7170967, -1.97279, 0.5529412, 1, 0, 1,
-0.7107199, 1.476155, -1.472334, 0.5490196, 1, 0, 1,
-0.7100896, 1.067715, 0.07962768, 0.5411765, 1, 0, 1,
-0.705974, 0.5131082, -0.5628123, 0.5372549, 1, 0, 1,
-0.704132, 0.1377465, -0.6887999, 0.5294118, 1, 0, 1,
-0.7037143, -0.1945741, 0.08358031, 0.5254902, 1, 0, 1,
-0.7027048, -1.173808, -2.40698, 0.5176471, 1, 0, 1,
-0.7014045, -1.574659, -3.412512, 0.5137255, 1, 0, 1,
-0.7012274, 0.03366442, -3.677634, 0.5058824, 1, 0, 1,
-0.6998214, -0.5647849, -1.313678, 0.5019608, 1, 0, 1,
-0.6996779, 0.6911561, -0.7703594, 0.4941176, 1, 0, 1,
-0.6959128, -1.556104, -4.801005, 0.4862745, 1, 0, 1,
-0.6951953, 1.551887, -1.56183, 0.4823529, 1, 0, 1,
-0.6926774, 1.008727, -0.09820745, 0.4745098, 1, 0, 1,
-0.6893554, 0.9602836, -1.379307, 0.4705882, 1, 0, 1,
-0.6847711, -1.771279, -2.193511, 0.4627451, 1, 0, 1,
-0.6828178, 1.800594, -0.1631831, 0.4588235, 1, 0, 1,
-0.680307, 0.1046725, -2.297113, 0.4509804, 1, 0, 1,
-0.6788476, 0.8750919, -1.916679, 0.4470588, 1, 0, 1,
-0.6783412, 0.7175615, -1.351279, 0.4392157, 1, 0, 1,
-0.6780843, -1.636696, -2.661705, 0.4352941, 1, 0, 1,
-0.6740909, -1.00927, -2.310425, 0.427451, 1, 0, 1,
-0.6700544, 1.815847, 0.400346, 0.4235294, 1, 0, 1,
-0.6668106, 0.2187423, -0.848053, 0.4156863, 1, 0, 1,
-0.6664597, -0.5791333, -2.287928, 0.4117647, 1, 0, 1,
-0.6620998, -0.08676961, -2.516157, 0.4039216, 1, 0, 1,
-0.6601176, 1.158369, 0.5370675, 0.3960784, 1, 0, 1,
-0.6557984, 0.07634169, -0.9052323, 0.3921569, 1, 0, 1,
-0.655597, 0.8783289, -0.9841264, 0.3843137, 1, 0, 1,
-0.647382, 0.677256, -1.744935, 0.3803922, 1, 0, 1,
-0.6415139, 0.1962198, -0.436429, 0.372549, 1, 0, 1,
-0.6414729, 0.2583037, -0.9853026, 0.3686275, 1, 0, 1,
-0.6413578, -0.5740727, -3.070739, 0.3607843, 1, 0, 1,
-0.6405771, -0.170779, -1.222139, 0.3568628, 1, 0, 1,
-0.6313444, 0.4981633, 0.6612795, 0.3490196, 1, 0, 1,
-0.6304488, 0.5807254, -3.015789, 0.345098, 1, 0, 1,
-0.6282836, 1.30873, 0.02186426, 0.3372549, 1, 0, 1,
-0.6278479, 0.6442956, -1.082771, 0.3333333, 1, 0, 1,
-0.6198235, -1.447975, -3.245851, 0.3254902, 1, 0, 1,
-0.618437, 1.044258, -2.814742, 0.3215686, 1, 0, 1,
-0.6141133, -0.5185555, -2.290255, 0.3137255, 1, 0, 1,
-0.6137148, -0.02450715, -2.070179, 0.3098039, 1, 0, 1,
-0.6114311, -0.07305934, -2.527366, 0.3019608, 1, 0, 1,
-0.6112797, 1.571894, -0.08487815, 0.2941177, 1, 0, 1,
-0.6102631, -0.9745875, -2.896436, 0.2901961, 1, 0, 1,
-0.6072859, -0.002147868, -2.603262, 0.282353, 1, 0, 1,
-0.5980144, 0.6135023, 1.163535, 0.2784314, 1, 0, 1,
-0.5976273, -0.4063007, -2.002383, 0.2705882, 1, 0, 1,
-0.5966532, -1.560308, -1.703523, 0.2666667, 1, 0, 1,
-0.5941855, 0.284919, -0.3202599, 0.2588235, 1, 0, 1,
-0.5875602, 0.7124879, 0.9019178, 0.254902, 1, 0, 1,
-0.5850143, -0.5557432, -3.532458, 0.2470588, 1, 0, 1,
-0.5833019, -0.2489681, -0.5349249, 0.2431373, 1, 0, 1,
-0.5746424, 0.0004451843, -1.258517, 0.2352941, 1, 0, 1,
-0.5735526, -0.3228636, -1.790671, 0.2313726, 1, 0, 1,
-0.5722234, -1.153635, -0.917815, 0.2235294, 1, 0, 1,
-0.5672997, -0.3780458, -1.502995, 0.2196078, 1, 0, 1,
-0.5670253, 1.509433, 0.5886381, 0.2117647, 1, 0, 1,
-0.5633236, -1.060757, -3.696379, 0.2078431, 1, 0, 1,
-0.5625261, -0.9354501, -5.084046, 0.2, 1, 0, 1,
-0.5608391, -0.1581408, -2.391378, 0.1921569, 1, 0, 1,
-0.5573352, 1.255592, -0.3136546, 0.1882353, 1, 0, 1,
-0.5530681, -0.04360078, -1.700248, 0.1803922, 1, 0, 1,
-0.5493844, -0.2228032, -0.9424405, 0.1764706, 1, 0, 1,
-0.5486969, 1.12478, -0.9184411, 0.1686275, 1, 0, 1,
-0.548403, -0.1889578, -2.852925, 0.1647059, 1, 0, 1,
-0.542041, 1.201288, -0.2341885, 0.1568628, 1, 0, 1,
-0.5418153, -0.161856, -3.291567, 0.1529412, 1, 0, 1,
-0.5369273, 0.1184913, -1.16594, 0.145098, 1, 0, 1,
-0.5345622, -0.2219069, -1.205489, 0.1411765, 1, 0, 1,
-0.5273695, -0.8430251, -2.406645, 0.1333333, 1, 0, 1,
-0.5267093, 1.343162, -0.389183, 0.1294118, 1, 0, 1,
-0.5233575, 0.7959123, 1.054721, 0.1215686, 1, 0, 1,
-0.5211694, 0.2375958, -1.984587, 0.1176471, 1, 0, 1,
-0.5205019, -0.7111926, -1.933032, 0.1098039, 1, 0, 1,
-0.5204092, 0.2705999, -1.509386, 0.1058824, 1, 0, 1,
-0.5185717, -0.8588289, -1.906807, 0.09803922, 1, 0, 1,
-0.5145172, 0.6031567, 0.8919222, 0.09019608, 1, 0, 1,
-0.5113471, 0.5461212, -0.3381902, 0.08627451, 1, 0, 1,
-0.5074573, 1.20302, -0.7591816, 0.07843138, 1, 0, 1,
-0.5029901, 0.1588207, -1.962015, 0.07450981, 1, 0, 1,
-0.4967027, -4.198565, -3.111375, 0.06666667, 1, 0, 1,
-0.4952624, -1.253759, -2.737415, 0.0627451, 1, 0, 1,
-0.4903533, 0.707458, -1.313969, 0.05490196, 1, 0, 1,
-0.4776457, -0.4334715, -1.857754, 0.05098039, 1, 0, 1,
-0.4759766, -0.09864291, -1.403533, 0.04313726, 1, 0, 1,
-0.4741152, -0.795732, -0.6520021, 0.03921569, 1, 0, 1,
-0.4717594, -0.03291519, -1.864391, 0.03137255, 1, 0, 1,
-0.4714641, 1.083073, -0.4829466, 0.02745098, 1, 0, 1,
-0.4713078, -0.4875937, -1.044303, 0.01960784, 1, 0, 1,
-0.4677527, 0.8195423, -0.8476059, 0.01568628, 1, 0, 1,
-0.4656191, -0.2330738, -4.622877, 0.007843138, 1, 0, 1,
-0.4630344, -1.314075, -3.545725, 0.003921569, 1, 0, 1,
-0.4625493, 1.041871, 0.4561072, 0, 1, 0.003921569, 1,
-0.4599036, 1.650396, 1.30535, 0, 1, 0.01176471, 1,
-0.4583087, 0.3193788, 0.164652, 0, 1, 0.01568628, 1,
-0.45617, 0.6740099, -1.952806, 0, 1, 0.02352941, 1,
-0.4559439, -1.004528, -2.987771, 0, 1, 0.02745098, 1,
-0.4535755, 1.423208, -1.38241, 0, 1, 0.03529412, 1,
-0.4479283, -0.1539252, -0.8450001, 0, 1, 0.03921569, 1,
-0.4438058, -0.1440799, -0.7733423, 0, 1, 0.04705882, 1,
-0.4400078, -0.6385604, -2.473206, 0, 1, 0.05098039, 1,
-0.4398128, -1.123144, -3.235751, 0, 1, 0.05882353, 1,
-0.4383762, 2.200374, 0.07780524, 0, 1, 0.0627451, 1,
-0.4375945, 0.8861943, 0.5089298, 0, 1, 0.07058824, 1,
-0.4362356, 0.6092957, -1.258381, 0, 1, 0.07450981, 1,
-0.4352694, -0.8068891, -2.301794, 0, 1, 0.08235294, 1,
-0.4341657, -0.2114948, -2.396456, 0, 1, 0.08627451, 1,
-0.4336815, 0.3334307, -0.4571681, 0, 1, 0.09411765, 1,
-0.4224463, 0.04732404, -1.721014, 0, 1, 0.1019608, 1,
-0.4144529, -0.3737149, -0.5831231, 0, 1, 0.1058824, 1,
-0.4055188, 1.441475, -2.260952, 0, 1, 0.1137255, 1,
-0.4047535, -0.8747137, -1.695001, 0, 1, 0.1176471, 1,
-0.4027217, -1.070263, -1.909016, 0, 1, 0.1254902, 1,
-0.3973304, 1.818087, 0.1051012, 0, 1, 0.1294118, 1,
-0.3971539, 1.181629, 0.4574746, 0, 1, 0.1372549, 1,
-0.3959005, 0.09512686, -1.730702, 0, 1, 0.1411765, 1,
-0.3935359, 0.4242189, 0.758281, 0, 1, 0.1490196, 1,
-0.3923909, 1.606175, -1.565091, 0, 1, 0.1529412, 1,
-0.3890609, 0.70414, -2.405758, 0, 1, 0.1607843, 1,
-0.3884758, -0.5426416, -5.010418, 0, 1, 0.1647059, 1,
-0.3867376, 0.2947992, -0.4434852, 0, 1, 0.172549, 1,
-0.3859017, -0.642351, -2.50107, 0, 1, 0.1764706, 1,
-0.3828105, -1.700438, -2.361723, 0, 1, 0.1843137, 1,
-0.3828088, -0.8119377, -3.494184, 0, 1, 0.1882353, 1,
-0.3821008, 0.5161004, -0.2791983, 0, 1, 0.1960784, 1,
-0.3818201, 0.102056, -0.9957647, 0, 1, 0.2039216, 1,
-0.3715245, 1.499129, 0.8958633, 0, 1, 0.2078431, 1,
-0.3680202, -2.182014, -4.310671, 0, 1, 0.2156863, 1,
-0.3641786, 1.232328, -0.7334743, 0, 1, 0.2196078, 1,
-0.3634253, 0.03499537, -1.547311, 0, 1, 0.227451, 1,
-0.3605918, 0.2829012, -0.102676, 0, 1, 0.2313726, 1,
-0.3578134, -0.1387145, -1.562886, 0, 1, 0.2392157, 1,
-0.3530929, 0.536427, 0.7377067, 0, 1, 0.2431373, 1,
-0.3415329, -0.2873797, -1.612961, 0, 1, 0.2509804, 1,
-0.3398228, -0.2046171, -2.854548, 0, 1, 0.254902, 1,
-0.3382646, 1.551597, -0.5373167, 0, 1, 0.2627451, 1,
-0.3365183, 1.459384, -1.611624, 0, 1, 0.2666667, 1,
-0.3356302, -0.997314, -0.6928136, 0, 1, 0.2745098, 1,
-0.3349863, 0.8475157, 0.676595, 0, 1, 0.2784314, 1,
-0.3330487, -0.8509545, -2.81127, 0, 1, 0.2862745, 1,
-0.332367, 0.284924, 0.7420819, 0, 1, 0.2901961, 1,
-0.3265688, 0.4841603, 1.213089, 0, 1, 0.2980392, 1,
-0.3200222, -1.942576, -2.05782, 0, 1, 0.3058824, 1,
-0.3179965, 1.007147, -0.7934827, 0, 1, 0.3098039, 1,
-0.3172303, -1.83044, -1.85667, 0, 1, 0.3176471, 1,
-0.3170938, 0.05444767, -0.4541644, 0, 1, 0.3215686, 1,
-0.3136277, -1.426151, -3.601548, 0, 1, 0.3294118, 1,
-0.3132072, 0.4004339, -0.7987955, 0, 1, 0.3333333, 1,
-0.3122195, 2.31315, 1.463759, 0, 1, 0.3411765, 1,
-0.3097441, -0.1748147, -3.604979, 0, 1, 0.345098, 1,
-0.3062044, -1.629809, -2.071796, 0, 1, 0.3529412, 1,
-0.3048012, 0.2439168, 0.5070875, 0, 1, 0.3568628, 1,
-0.30415, -1.14816, -3.851635, 0, 1, 0.3647059, 1,
-0.299438, 0.3346016, -3.392251, 0, 1, 0.3686275, 1,
-0.2971212, -0.2342674, -3.146277, 0, 1, 0.3764706, 1,
-0.2971147, -0.3512082, -3.60819, 0, 1, 0.3803922, 1,
-0.2967733, 0.2275236, -1.783267, 0, 1, 0.3882353, 1,
-0.2955098, 0.4292598, -3.707204, 0, 1, 0.3921569, 1,
-0.2921159, 0.2659248, 0.2704416, 0, 1, 0.4, 1,
-0.2833523, 0.4156133, -1.211055, 0, 1, 0.4078431, 1,
-0.2793198, -0.09840017, -2.496053, 0, 1, 0.4117647, 1,
-0.2788831, 0.3806224, 0.2501775, 0, 1, 0.4196078, 1,
-0.2784486, -0.1199874, -1.373002, 0, 1, 0.4235294, 1,
-0.2746348, 0.2189814, -2.228409, 0, 1, 0.4313726, 1,
-0.2745341, 1.244589, 1.348924, 0, 1, 0.4352941, 1,
-0.2729346, 1.056852, -0.5979664, 0, 1, 0.4431373, 1,
-0.2727877, 0.3517046, -1.725893, 0, 1, 0.4470588, 1,
-0.2711295, -0.2385612, -3.488405, 0, 1, 0.454902, 1,
-0.2699351, 0.1210858, -0.5333458, 0, 1, 0.4588235, 1,
-0.268685, 0.08391472, -0.3630238, 0, 1, 0.4666667, 1,
-0.2676232, -1.021001, -2.91806, 0, 1, 0.4705882, 1,
-0.2668582, 1.700042, -0.5642149, 0, 1, 0.4784314, 1,
-0.2665214, 1.00757, 0.371536, 0, 1, 0.4823529, 1,
-0.2664173, 1.270877, -0.6861215, 0, 1, 0.4901961, 1,
-0.2617751, -0.4731101, -2.474499, 0, 1, 0.4941176, 1,
-0.2601395, -0.6078765, -2.823269, 0, 1, 0.5019608, 1,
-0.2500346, -0.7595989, -2.966733, 0, 1, 0.509804, 1,
-0.2481086, -1.542398, -2.261515, 0, 1, 0.5137255, 1,
-0.2469881, -0.5926514, -1.999187, 0, 1, 0.5215687, 1,
-0.2389661, 1.116827, -1.092967, 0, 1, 0.5254902, 1,
-0.2355869, 1.655694, -0.6114992, 0, 1, 0.5333334, 1,
-0.2338674, 0.8052936, 0.4759356, 0, 1, 0.5372549, 1,
-0.2317816, 1.31843, 0.04501534, 0, 1, 0.5450981, 1,
-0.2277596, 1.622991, -0.06094251, 0, 1, 0.5490196, 1,
-0.2207238, 0.5884796, -0.4390576, 0, 1, 0.5568628, 1,
-0.2173826, -0.8633603, -3.997383, 0, 1, 0.5607843, 1,
-0.2097549, -0.4448248, -1.326336, 0, 1, 0.5686275, 1,
-0.2075052, -1.084572, -2.465031, 0, 1, 0.572549, 1,
-0.2047659, -0.6726355, -2.854203, 0, 1, 0.5803922, 1,
-0.2031459, -0.453274, -3.194781, 0, 1, 0.5843138, 1,
-0.2023086, -0.404808, -2.917294, 0, 1, 0.5921569, 1,
-0.2007231, 1.241282, -1.181651, 0, 1, 0.5960785, 1,
-0.1960488, 1.805353, -1.712322, 0, 1, 0.6039216, 1,
-0.1924262, 0.4123535, -1.038826, 0, 1, 0.6117647, 1,
-0.1919303, -1.030488, -3.293108, 0, 1, 0.6156863, 1,
-0.191545, 0.2093769, -1.906743, 0, 1, 0.6235294, 1,
-0.1867831, 0.3898502, 1.98507, 0, 1, 0.627451, 1,
-0.1857755, 0.6240928, -0.3174449, 0, 1, 0.6352941, 1,
-0.1856463, 1.400657, 0.7750612, 0, 1, 0.6392157, 1,
-0.1800686, 0.7221805, -1.014353, 0, 1, 0.6470588, 1,
-0.1785838, 1.612293, 0.1965859, 0, 1, 0.6509804, 1,
-0.1784952, 0.5441604, 0.1863938, 0, 1, 0.6588235, 1,
-0.1743287, -0.07392726, -2.0494, 0, 1, 0.6627451, 1,
-0.1650739, 0.4992329, -1.612867, 0, 1, 0.6705883, 1,
-0.1647823, -1.034101, -3.938397, 0, 1, 0.6745098, 1,
-0.163345, -0.2825573, -2.24191, 0, 1, 0.682353, 1,
-0.1629938, 0.03703509, -1.544594, 0, 1, 0.6862745, 1,
-0.1592878, -0.3260166, -3.643052, 0, 1, 0.6941177, 1,
-0.1578494, 0.1045906, -2.621427, 0, 1, 0.7019608, 1,
-0.1563745, -1.587361, -3.930366, 0, 1, 0.7058824, 1,
-0.1555085, -0.9551173, -3.107083, 0, 1, 0.7137255, 1,
-0.1548442, 0.07567303, -1.490638, 0, 1, 0.7176471, 1,
-0.1522611, -0.1610598, -2.631681, 0, 1, 0.7254902, 1,
-0.1490739, 0.2375056, -0.7479129, 0, 1, 0.7294118, 1,
-0.1441893, 1.588234, 1.44938, 0, 1, 0.7372549, 1,
-0.1438873, -1.386484, -4.175049, 0, 1, 0.7411765, 1,
-0.1433584, 0.928501, -1.362947, 0, 1, 0.7490196, 1,
-0.1432831, -0.04410984, -2.538277, 0, 1, 0.7529412, 1,
-0.1413219, -0.1850224, -2.276115, 0, 1, 0.7607843, 1,
-0.1340782, -0.6492541, -1.855017, 0, 1, 0.7647059, 1,
-0.1339617, -2.091745, -2.479587, 0, 1, 0.772549, 1,
-0.1336801, 0.2879115, 2.476861, 0, 1, 0.7764706, 1,
-0.1332846, 0.123621, -0.5373918, 0, 1, 0.7843137, 1,
-0.131892, 0.5428901, -0.8665753, 0, 1, 0.7882353, 1,
-0.1281821, -2.45936, -3.67663, 0, 1, 0.7960784, 1,
-0.1250162, 0.621604, -0.6843734, 0, 1, 0.8039216, 1,
-0.1228007, 0.7538521, -0.5397032, 0, 1, 0.8078431, 1,
-0.1225805, -0.8858998, -2.017047, 0, 1, 0.8156863, 1,
-0.1221942, -0.545279, -1.060187, 0, 1, 0.8196079, 1,
-0.1210245, -0.1264871, -3.688518, 0, 1, 0.827451, 1,
-0.1207036, 0.5479766, -0.02062673, 0, 1, 0.8313726, 1,
-0.1195966, -0.9186341, -4.304532, 0, 1, 0.8392157, 1,
-0.1182851, -0.7241147, -3.364737, 0, 1, 0.8431373, 1,
-0.1158168, -1.007901, -2.996782, 0, 1, 0.8509804, 1,
-0.1123046, -0.1373864, -1.831326, 0, 1, 0.854902, 1,
-0.1064209, 0.6199861, -1.088674, 0, 1, 0.8627451, 1,
-0.1056968, -0.3204413, -1.592365, 0, 1, 0.8666667, 1,
-0.1056398, 0.0289491, -3.579736, 0, 1, 0.8745098, 1,
-0.1046167, 1.266225, 1.22859, 0, 1, 0.8784314, 1,
-0.1026123, -1.319427, -1.82244, 0, 1, 0.8862745, 1,
-0.1013995, 0.4366741, -2.452664, 0, 1, 0.8901961, 1,
-0.09806413, 0.2898673, -0.1507775, 0, 1, 0.8980392, 1,
-0.09607285, -1.841215, -2.344177, 0, 1, 0.9058824, 1,
-0.09590513, -0.4156554, -3.326883, 0, 1, 0.9098039, 1,
-0.09567922, 1.251773, -0.09777644, 0, 1, 0.9176471, 1,
-0.09120523, -0.835324, -1.741031, 0, 1, 0.9215686, 1,
-0.08851052, -1.56123, -2.109859, 0, 1, 0.9294118, 1,
-0.08034017, 0.2642503, 0.1942267, 0, 1, 0.9333333, 1,
-0.0792393, -1.237332, -2.244883, 0, 1, 0.9411765, 1,
-0.07710034, -0.948171, -2.679809, 0, 1, 0.945098, 1,
-0.06444924, 1.957304, -0.1258485, 0, 1, 0.9529412, 1,
-0.06419668, 1.101892, -0.7632129, 0, 1, 0.9568627, 1,
-0.05198265, 0.841292, 0.6489727, 0, 1, 0.9647059, 1,
-0.05160783, 0.1949783, -0.9827312, 0, 1, 0.9686275, 1,
-0.04821121, -0.1946601, -3.718925, 0, 1, 0.9764706, 1,
-0.04619149, -2.346209, -2.480938, 0, 1, 0.9803922, 1,
-0.04486926, 0.9754494, -0.1790367, 0, 1, 0.9882353, 1,
-0.04283181, 0.5979408, -0.1763484, 0, 1, 0.9921569, 1,
-0.03752664, 0.258681, -0.4925249, 0, 1, 1, 1,
-0.02978724, -0.4103729, -2.661581, 0, 0.9921569, 1, 1,
-0.02516485, -0.457424, -2.82916, 0, 0.9882353, 1, 1,
-0.02490699, -0.9891816, -5.251417, 0, 0.9803922, 1, 1,
-0.02147043, 0.0416581, 0.3072822, 0, 0.9764706, 1, 1,
-0.01910648, -1.157516, -3.830785, 0, 0.9686275, 1, 1,
-0.01711616, 2.197969, -0.6901828, 0, 0.9647059, 1, 1,
-0.0167293, -0.0624609, -2.619965, 0, 0.9568627, 1, 1,
-0.01627198, 0.3373173, 0.7858033, 0, 0.9529412, 1, 1,
-0.01155293, 0.3509016, 0.5251647, 0, 0.945098, 1, 1,
-0.01123314, 1.593291, 1.815433, 0, 0.9411765, 1, 1,
-0.008494657, 0.02478259, 0.2151187, 0, 0.9333333, 1, 1,
-0.005366191, -0.9221442, -3.940081, 0, 0.9294118, 1, 1,
-0.002811534, -0.07582559, -2.785913, 0, 0.9215686, 1, 1,
0.0008641234, -0.09072119, 3.913714, 0, 0.9176471, 1, 1,
0.006697237, -2.24784, 3.02199, 0, 0.9098039, 1, 1,
0.007234803, 1.314176, -0.183853, 0, 0.9058824, 1, 1,
0.009135582, -2.095516, 3.124079, 0, 0.8980392, 1, 1,
0.0134013, 1.135105, -0.9497212, 0, 0.8901961, 1, 1,
0.02000982, -2.11214, 1.929672, 0, 0.8862745, 1, 1,
0.02666659, 0.4954685, -1.060025, 0, 0.8784314, 1, 1,
0.02679, 0.7747496, -0.2458085, 0, 0.8745098, 1, 1,
0.0284845, 1.168648, -0.9018946, 0, 0.8666667, 1, 1,
0.03265483, -1.064305, 3.918831, 0, 0.8627451, 1, 1,
0.0351195, -0.07861377, 0.5684054, 0, 0.854902, 1, 1,
0.03820083, 0.819567, -0.4418142, 0, 0.8509804, 1, 1,
0.03839494, 0.1605677, -1.709248, 0, 0.8431373, 1, 1,
0.03860188, -0.5740641, 3.023571, 0, 0.8392157, 1, 1,
0.03870239, -0.4164117, 3.022568, 0, 0.8313726, 1, 1,
0.04308172, 0.1698816, 0.5535169, 0, 0.827451, 1, 1,
0.04451349, 0.4752367, 0.06387211, 0, 0.8196079, 1, 1,
0.04622432, 1.323507, -0.3639928, 0, 0.8156863, 1, 1,
0.04802364, 0.8494577, -0.2089327, 0, 0.8078431, 1, 1,
0.04865853, -0.8878897, 4.368911, 0, 0.8039216, 1, 1,
0.04975101, 1.756787, -0.4642547, 0, 0.7960784, 1, 1,
0.05137686, 2.103143, -1.488793, 0, 0.7882353, 1, 1,
0.05179884, -1.051593, 4.117584, 0, 0.7843137, 1, 1,
0.0535291, 0.1079005, 0.479277, 0, 0.7764706, 1, 1,
0.05395352, 0.025438, 0.3834753, 0, 0.772549, 1, 1,
0.05455761, 1.25685, -0.0350836, 0, 0.7647059, 1, 1,
0.05734573, 0.0873839, 0.5271312, 0, 0.7607843, 1, 1,
0.0584686, 0.3242908, 0.4614199, 0, 0.7529412, 1, 1,
0.05874242, 0.7201877, -0.04696864, 0, 0.7490196, 1, 1,
0.06006099, 0.238646, 0.8703921, 0, 0.7411765, 1, 1,
0.06024097, -1.152232, 1.149633, 0, 0.7372549, 1, 1,
0.06057852, 1.630717, 0.8809887, 0, 0.7294118, 1, 1,
0.06620406, -0.1084464, 5.025637, 0, 0.7254902, 1, 1,
0.06840807, -0.4287124, 3.567627, 0, 0.7176471, 1, 1,
0.06956644, -0.6009505, -0.06118649, 0, 0.7137255, 1, 1,
0.0703785, -0.604803, 2.891253, 0, 0.7058824, 1, 1,
0.07179205, 0.3036115, -0.568699, 0, 0.6980392, 1, 1,
0.07348994, -0.7585315, 1.230322, 0, 0.6941177, 1, 1,
0.07506669, 0.870824, -0.8709007, 0, 0.6862745, 1, 1,
0.07932432, 0.464434, 2.544108, 0, 0.682353, 1, 1,
0.07992298, 0.2285139, 0.543371, 0, 0.6745098, 1, 1,
0.08530007, 0.6225588, -0.2339527, 0, 0.6705883, 1, 1,
0.08765259, -0.9989523, 3.135343, 0, 0.6627451, 1, 1,
0.08888995, -2.19833, 0.3427033, 0, 0.6588235, 1, 1,
0.09219977, -0.684952, 4.917726, 0, 0.6509804, 1, 1,
0.09408017, -0.7053385, 4.284956, 0, 0.6470588, 1, 1,
0.09742474, -0.09841418, 2.629335, 0, 0.6392157, 1, 1,
0.09794388, 0.7379526, 0.1139146, 0, 0.6352941, 1, 1,
0.101057, -0.4155864, 1.981215, 0, 0.627451, 1, 1,
0.1046495, 1.215924, 0.3672868, 0, 0.6235294, 1, 1,
0.1068078, 1.049802, 1.153712, 0, 0.6156863, 1, 1,
0.1090268, -0.6487772, 2.100144, 0, 0.6117647, 1, 1,
0.1165199, 0.8271559, 0.1660216, 0, 0.6039216, 1, 1,
0.1170214, -0.4015006, 4.117202, 0, 0.5960785, 1, 1,
0.1199606, -0.2800063, 1.73482, 0, 0.5921569, 1, 1,
0.1219089, -1.480258, 2.753828, 0, 0.5843138, 1, 1,
0.1236505, 0.5745858, -0.8979429, 0, 0.5803922, 1, 1,
0.1249129, -2.104586, 3.16771, 0, 0.572549, 1, 1,
0.1256609, 1.982437, 0.9703425, 0, 0.5686275, 1, 1,
0.1279682, -1.682682, 3.131316, 0, 0.5607843, 1, 1,
0.1311175, -0.2439382, 2.40928, 0, 0.5568628, 1, 1,
0.1314426, 0.3994042, 2.233113, 0, 0.5490196, 1, 1,
0.1326964, 1.071596, 0.6607163, 0, 0.5450981, 1, 1,
0.1329669, 1.886283, 1.753465, 0, 0.5372549, 1, 1,
0.13489, 0.7635001, -0.1964765, 0, 0.5333334, 1, 1,
0.1353042, 0.7321137, -0.2009738, 0, 0.5254902, 1, 1,
0.1354484, -0.4497429, 3.300873, 0, 0.5215687, 1, 1,
0.1358554, 0.8229674, 0.9340369, 0, 0.5137255, 1, 1,
0.1359998, -0.1775952, 0.5022742, 0, 0.509804, 1, 1,
0.1361135, -0.2317458, 1.706212, 0, 0.5019608, 1, 1,
0.1380385, -0.07231268, 1.53759, 0, 0.4941176, 1, 1,
0.1383153, -0.3345699, 2.955401, 0, 0.4901961, 1, 1,
0.1428595, -0.6878176, 1.726663, 0, 0.4823529, 1, 1,
0.1475179, 0.1875843, 0.02564958, 0, 0.4784314, 1, 1,
0.1562636, -1.663261, 3.009424, 0, 0.4705882, 1, 1,
0.1622828, -0.2273193, 3.156514, 0, 0.4666667, 1, 1,
0.164156, 0.4778633, 0.1462582, 0, 0.4588235, 1, 1,
0.1656405, 1.025997, -1.148379, 0, 0.454902, 1, 1,
0.1658893, -0.3838802, 3.04391, 0, 0.4470588, 1, 1,
0.1710342, 1.332105, 0.6140293, 0, 0.4431373, 1, 1,
0.1761154, -0.7541041, 3.089818, 0, 0.4352941, 1, 1,
0.1789293, -1.411909, 1.66219, 0, 0.4313726, 1, 1,
0.1800463, -0.2252281, 2.604798, 0, 0.4235294, 1, 1,
0.1808643, -0.04675123, 1.963232, 0, 0.4196078, 1, 1,
0.1852414, -0.5447802, 3.100938, 0, 0.4117647, 1, 1,
0.1888953, -1.9629, 3.239453, 0, 0.4078431, 1, 1,
0.1909017, 0.4340946, -0.3903878, 0, 0.4, 1, 1,
0.1949341, 0.5344062, -0.04620533, 0, 0.3921569, 1, 1,
0.1950417, -0.6445767, 2.119861, 0, 0.3882353, 1, 1,
0.196204, 0.2964087, 0.9307825, 0, 0.3803922, 1, 1,
0.1967108, 0.5564085, -0.4053411, 0, 0.3764706, 1, 1,
0.1996035, -1.715857, 2.654405, 0, 0.3686275, 1, 1,
0.2026774, -0.3328583, 2.936974, 0, 0.3647059, 1, 1,
0.2173727, -0.8254043, 3.312217, 0, 0.3568628, 1, 1,
0.2194111, -1.414711, 3.28559, 0, 0.3529412, 1, 1,
0.220844, 2.198149, 1.496989, 0, 0.345098, 1, 1,
0.2219722, -0.8587506, 3.411427, 0, 0.3411765, 1, 1,
0.2235118, 1.21661, 0.4318389, 0, 0.3333333, 1, 1,
0.2263893, 0.9380033, 0.1104029, 0, 0.3294118, 1, 1,
0.2278363, 1.417532, -1.282717, 0, 0.3215686, 1, 1,
0.227865, -0.7386347, 0.4951977, 0, 0.3176471, 1, 1,
0.2305731, -0.1113324, 2.449042, 0, 0.3098039, 1, 1,
0.2315687, 1.129734, -1.349541, 0, 0.3058824, 1, 1,
0.2319638, 2.027408, -0.1632469, 0, 0.2980392, 1, 1,
0.2338968, 0.6462385, -0.04686582, 0, 0.2901961, 1, 1,
0.2407672, -0.1670333, 3.07573, 0, 0.2862745, 1, 1,
0.2422958, 0.3531153, -0.9765518, 0, 0.2784314, 1, 1,
0.2447222, -0.2865645, 1.904604, 0, 0.2745098, 1, 1,
0.2469515, -1.649393, 2.616329, 0, 0.2666667, 1, 1,
0.2476032, -0.1966603, 3.266412, 0, 0.2627451, 1, 1,
0.248991, 0.5686296, 1.025662, 0, 0.254902, 1, 1,
0.249528, 0.8658558, 2.390907, 0, 0.2509804, 1, 1,
0.253397, 1.090991, 0.2865766, 0, 0.2431373, 1, 1,
0.2550322, 1.078274, 0.7802283, 0, 0.2392157, 1, 1,
0.2553773, -1.451373, 3.074515, 0, 0.2313726, 1, 1,
0.2653169, 0.4782802, -1.299858, 0, 0.227451, 1, 1,
0.2675312, 0.143089, 1.203847, 0, 0.2196078, 1, 1,
0.2692356, -1.006796, 4.698696, 0, 0.2156863, 1, 1,
0.2733541, 1.071177, 0.7558761, 0, 0.2078431, 1, 1,
0.2845584, -0.5069904, 1.96811, 0, 0.2039216, 1, 1,
0.2856207, 0.7463077, 0.2929597, 0, 0.1960784, 1, 1,
0.2863639, -0.1572071, 1.199583, 0, 0.1882353, 1, 1,
0.2873946, -1.800679, 3.887821, 0, 0.1843137, 1, 1,
0.2877375, 0.5886081, 2.763511, 0, 0.1764706, 1, 1,
0.2898522, 0.5719217, -0.2465923, 0, 0.172549, 1, 1,
0.2916623, -0.8812307, 3.650883, 0, 0.1647059, 1, 1,
0.2941265, -0.4935871, 2.677514, 0, 0.1607843, 1, 1,
0.3034222, -0.1745954, 2.3281, 0, 0.1529412, 1, 1,
0.3044775, 0.5135304, 0.5656273, 0, 0.1490196, 1, 1,
0.3047343, -1.029157, 2.097689, 0, 0.1411765, 1, 1,
0.3059482, -0.6754557, 2.250654, 0, 0.1372549, 1, 1,
0.3146887, 0.9022779, 1.079707, 0, 0.1294118, 1, 1,
0.3202296, -2.005373, 3.035284, 0, 0.1254902, 1, 1,
0.3223663, 0.1783708, 2.989964, 0, 0.1176471, 1, 1,
0.3258907, 0.002609996, 1.194371, 0, 0.1137255, 1, 1,
0.3291558, 0.716197, 1.966295, 0, 0.1058824, 1, 1,
0.330034, -0.08143118, -0.8937398, 0, 0.09803922, 1, 1,
0.3373406, 0.8239188, 0.5850345, 0, 0.09411765, 1, 1,
0.3379837, 1.350968, -2.396378, 0, 0.08627451, 1, 1,
0.3389658, -1.735437, 3.849232, 0, 0.08235294, 1, 1,
0.3422204, -1.428172, 2.83138, 0, 0.07450981, 1, 1,
0.3456978, 1.126527, 0.5811226, 0, 0.07058824, 1, 1,
0.3469282, 1.162206, 0.4166901, 0, 0.0627451, 1, 1,
0.3534176, 1.299676, -0.571849, 0, 0.05882353, 1, 1,
0.3548059, 0.1436231, 0.5026659, 0, 0.05098039, 1, 1,
0.3570224, 0.4025299, 0.859705, 0, 0.04705882, 1, 1,
0.3583758, 1.187028, 1.014147, 0, 0.03921569, 1, 1,
0.3685137, -2.101172, 3.611918, 0, 0.03529412, 1, 1,
0.3713822, -0.5440152, 3.184304, 0, 0.02745098, 1, 1,
0.3740965, -1.09924, 2.358508, 0, 0.02352941, 1, 1,
0.3827238, -1.044825, 3.69805, 0, 0.01568628, 1, 1,
0.3862704, -1.630667, 5.563838, 0, 0.01176471, 1, 1,
0.3927003, 1.423833, -0.2091553, 0, 0.003921569, 1, 1,
0.3974186, -0.03432699, -0.07258184, 0.003921569, 0, 1, 1,
0.4033853, -0.1469649, 1.876161, 0.007843138, 0, 1, 1,
0.4034283, -1.308057, 1.605289, 0.01568628, 0, 1, 1,
0.4048107, 0.5234053, 1.178423, 0.01960784, 0, 1, 1,
0.4107383, -0.152087, 1.424525, 0.02745098, 0, 1, 1,
0.4123679, 0.2784955, 0.3264719, 0.03137255, 0, 1, 1,
0.4152267, 0.8544386, -1.424263, 0.03921569, 0, 1, 1,
0.4155491, 1.351416, 0.7966303, 0.04313726, 0, 1, 1,
0.4156946, 0.6996301, 2.442444, 0.05098039, 0, 1, 1,
0.4163145, -0.09994277, 1.796404, 0.05490196, 0, 1, 1,
0.4249113, 0.5790404, 1.555447, 0.0627451, 0, 1, 1,
0.4249914, 1.130773, 1.846548, 0.06666667, 0, 1, 1,
0.4251742, -1.663247, 1.628973, 0.07450981, 0, 1, 1,
0.4296586, -0.106658, 4.197159, 0.07843138, 0, 1, 1,
0.4303609, 1.404538, 1.122819, 0.08627451, 0, 1, 1,
0.4306349, 0.1034859, -1.383406, 0.09019608, 0, 1, 1,
0.4315211, 0.8783219, 1.076847, 0.09803922, 0, 1, 1,
0.4393487, -0.4567163, 1.548471, 0.1058824, 0, 1, 1,
0.4426102, 0.2788702, 1.25716, 0.1098039, 0, 1, 1,
0.4446222, -0.08458152, 0.9756806, 0.1176471, 0, 1, 1,
0.4452932, -1.16133, 3.685264, 0.1215686, 0, 1, 1,
0.4526629, -0.38438, 2.777254, 0.1294118, 0, 1, 1,
0.4584249, -2.435291, 1.762291, 0.1333333, 0, 1, 1,
0.4656803, 1.045783, 1.242094, 0.1411765, 0, 1, 1,
0.4680833, -1.300472, 2.514236, 0.145098, 0, 1, 1,
0.4698508, -1.450839, 2.057854, 0.1529412, 0, 1, 1,
0.4712612, -0.4511457, 1.499979, 0.1568628, 0, 1, 1,
0.476474, 0.3758939, -0.4795353, 0.1647059, 0, 1, 1,
0.4775307, 0.3383024, 2.450047, 0.1686275, 0, 1, 1,
0.4802267, 0.6591308, 0.5486747, 0.1764706, 0, 1, 1,
0.4842121, -0.7952098, 3.418774, 0.1803922, 0, 1, 1,
0.4871622, -0.2288677, 2.303247, 0.1882353, 0, 1, 1,
0.4907814, 1.894829, -0.728877, 0.1921569, 0, 1, 1,
0.4986399, -0.4238154, 1.622844, 0.2, 0, 1, 1,
0.5024036, 0.9887366, 1.556832, 0.2078431, 0, 1, 1,
0.5040068, -0.4168963, 3.886511, 0.2117647, 0, 1, 1,
0.5067372, -0.5705245, 2.098141, 0.2196078, 0, 1, 1,
0.5076461, 0.5616271, 2.686429, 0.2235294, 0, 1, 1,
0.5089252, 1.285433, 0.1377033, 0.2313726, 0, 1, 1,
0.5111247, -0.4033774, 1.85933, 0.2352941, 0, 1, 1,
0.5115011, 0.4453427, 2.201469, 0.2431373, 0, 1, 1,
0.5115504, 0.3246267, 1.776113, 0.2470588, 0, 1, 1,
0.5126055, -1.073162, 1.76055, 0.254902, 0, 1, 1,
0.514327, 1.395393, -1.994758, 0.2588235, 0, 1, 1,
0.515654, 0.328388, -0.1958466, 0.2666667, 0, 1, 1,
0.5162828, 1.508729, -1.119526, 0.2705882, 0, 1, 1,
0.5171213, 1.663495, 0.1719166, 0.2784314, 0, 1, 1,
0.517861, 0.3608592, 0.9334047, 0.282353, 0, 1, 1,
0.5183735, 0.3727524, -0.9522772, 0.2901961, 0, 1, 1,
0.5198304, -0.5247602, 1.732267, 0.2941177, 0, 1, 1,
0.521703, 1.312998, -0.9771212, 0.3019608, 0, 1, 1,
0.5250914, 0.2303219, 1.462212, 0.3098039, 0, 1, 1,
0.5255056, -0.7858906, 1.999418, 0.3137255, 0, 1, 1,
0.5275326, -1.358403, 3.269059, 0.3215686, 0, 1, 1,
0.5280991, 0.6779246, 0.5226585, 0.3254902, 0, 1, 1,
0.5342346, 1.651735, 0.1063691, 0.3333333, 0, 1, 1,
0.5383323, 2.508153, 0.2444587, 0.3372549, 0, 1, 1,
0.5401621, -0.4105583, 2.70573, 0.345098, 0, 1, 1,
0.5414824, -1.322003, 3.900454, 0.3490196, 0, 1, 1,
0.5416688, -1.132873, 3.645907, 0.3568628, 0, 1, 1,
0.5525535, 0.1936509, 1.76965, 0.3607843, 0, 1, 1,
0.5541631, 0.6420261, 0.2141304, 0.3686275, 0, 1, 1,
0.5625248, -0.1187973, 0.9365072, 0.372549, 0, 1, 1,
0.5627115, -0.3907129, 3.220503, 0.3803922, 0, 1, 1,
0.5627861, 0.5054995, -0.9522197, 0.3843137, 0, 1, 1,
0.5653409, -1.652154, 4.202239, 0.3921569, 0, 1, 1,
0.5653821, -0.4021589, 3.373284, 0.3960784, 0, 1, 1,
0.5663161, -0.00693532, 2.230892, 0.4039216, 0, 1, 1,
0.5668475, 0.8088304, 0.264759, 0.4117647, 0, 1, 1,
0.5764167, 0.8622775, -0.0882109, 0.4156863, 0, 1, 1,
0.5817785, 0.4655969, 1.520081, 0.4235294, 0, 1, 1,
0.5859191, 0.6400843, -0.943729, 0.427451, 0, 1, 1,
0.5873436, 0.1757319, 1.024045, 0.4352941, 0, 1, 1,
0.5900208, 0.1383724, 1.794206, 0.4392157, 0, 1, 1,
0.5909611, -0.635609, 4.090261, 0.4470588, 0, 1, 1,
0.5926082, 0.3962245, -0.350924, 0.4509804, 0, 1, 1,
0.5928431, -0.2517891, 1.696164, 0.4588235, 0, 1, 1,
0.5944724, 0.2590188, 1.618535, 0.4627451, 0, 1, 1,
0.5947888, -0.3436792, 1.005426, 0.4705882, 0, 1, 1,
0.5947984, -0.982747, 2.06997, 0.4745098, 0, 1, 1,
0.5950639, -1.450878, 1.676123, 0.4823529, 0, 1, 1,
0.5971196, -0.971217, 1.729582, 0.4862745, 0, 1, 1,
0.5985984, -1.692892, 0.2633762, 0.4941176, 0, 1, 1,
0.6000257, -0.2897273, 2.395333, 0.5019608, 0, 1, 1,
0.6025819, -0.6225244, 3.986178, 0.5058824, 0, 1, 1,
0.6076874, -0.7304658, 4.037281, 0.5137255, 0, 1, 1,
0.6128244, 0.9347252, 0.6205855, 0.5176471, 0, 1, 1,
0.6147581, 1.873544, 3.216027, 0.5254902, 0, 1, 1,
0.6181844, -0.3496594, 1.357585, 0.5294118, 0, 1, 1,
0.6293815, -0.3014956, 2.185132, 0.5372549, 0, 1, 1,
0.6299789, -0.6935841, 2.689261, 0.5411765, 0, 1, 1,
0.6308697, -0.4649265, 1.107201, 0.5490196, 0, 1, 1,
0.6356719, 0.6577554, 0.3730255, 0.5529412, 0, 1, 1,
0.6421737, 1.276115, -1.533743, 0.5607843, 0, 1, 1,
0.6454968, -0.3771914, 2.968136, 0.5647059, 0, 1, 1,
0.6490646, -0.4072378, 3.075587, 0.572549, 0, 1, 1,
0.6529247, 1.603557, 0.1341482, 0.5764706, 0, 1, 1,
0.6530097, 1.065421, 0.5027962, 0.5843138, 0, 1, 1,
0.6543605, 1.110701, 0.2846121, 0.5882353, 0, 1, 1,
0.6633594, 2.738362, 0.497602, 0.5960785, 0, 1, 1,
0.6654428, -1.132425, 2.188729, 0.6039216, 0, 1, 1,
0.6666125, -0.677747, 3.003808, 0.6078432, 0, 1, 1,
0.6678283, 1.351633, 0.5020761, 0.6156863, 0, 1, 1,
0.6742303, 1.168689, -0.01099962, 0.6196079, 0, 1, 1,
0.6756455, -0.1304324, 1.97792, 0.627451, 0, 1, 1,
0.682747, 0.0617084, 2.523529, 0.6313726, 0, 1, 1,
0.6889398, -0.2651086, 1.561869, 0.6392157, 0, 1, 1,
0.7021786, -0.8747876, 3.031067, 0.6431373, 0, 1, 1,
0.7030327, -1.619554, 1.745818, 0.6509804, 0, 1, 1,
0.7034647, 0.2456641, -0.03896877, 0.654902, 0, 1, 1,
0.7049155, -1.102261, 4.08352, 0.6627451, 0, 1, 1,
0.7083691, 0.1855467, 1.85127, 0.6666667, 0, 1, 1,
0.7099386, -0.7778805, 3.642513, 0.6745098, 0, 1, 1,
0.7122434, -0.7108287, 2.475628, 0.6784314, 0, 1, 1,
0.712844, -0.134523, 2.989952, 0.6862745, 0, 1, 1,
0.7136829, 0.2765442, 1.596046, 0.6901961, 0, 1, 1,
0.7154203, -0.8161763, 2.43022, 0.6980392, 0, 1, 1,
0.7178566, -0.05279638, 1.028827, 0.7058824, 0, 1, 1,
0.7209987, -0.8641965, 1.70454, 0.7098039, 0, 1, 1,
0.7418968, 0.6317772, 0.7525296, 0.7176471, 0, 1, 1,
0.7476951, 0.04470974, 1.625812, 0.7215686, 0, 1, 1,
0.7481319, 0.3942975, 0.8382811, 0.7294118, 0, 1, 1,
0.7487171, -0.3518569, 2.000569, 0.7333333, 0, 1, 1,
0.7511569, -0.4039309, 2.211255, 0.7411765, 0, 1, 1,
0.7553366, -2.559982, 2.986525, 0.7450981, 0, 1, 1,
0.7568434, 1.915229, -0.07247072, 0.7529412, 0, 1, 1,
0.7654276, -0.7484207, 3.555947, 0.7568628, 0, 1, 1,
0.7713354, -1.106004, 2.965079, 0.7647059, 0, 1, 1,
0.7717443, -0.1660581, 2.135761, 0.7686275, 0, 1, 1,
0.7751589, -1.315413, 2.805148, 0.7764706, 0, 1, 1,
0.7763109, -0.1548364, 1.226986, 0.7803922, 0, 1, 1,
0.7845783, 1.146969, 1.794992, 0.7882353, 0, 1, 1,
0.7865689, 1.738093, -0.1361659, 0.7921569, 0, 1, 1,
0.7932553, 1.78319, -0.669638, 0.8, 0, 1, 1,
0.7971488, -0.2092508, 1.537283, 0.8078431, 0, 1, 1,
0.8023176, -1.440066, 0.6786822, 0.8117647, 0, 1, 1,
0.8028427, 0.3151653, 0.2876541, 0.8196079, 0, 1, 1,
0.8092515, -0.3902966, 2.476052, 0.8235294, 0, 1, 1,
0.8114586, 0.09350769, 0.7193109, 0.8313726, 0, 1, 1,
0.8250238, 1.450731, 0.7672979, 0.8352941, 0, 1, 1,
0.8303835, 0.7939618, 0.08129366, 0.8431373, 0, 1, 1,
0.8322892, 1.036976, -1.056475, 0.8470588, 0, 1, 1,
0.8335522, -1.622398, 2.369326, 0.854902, 0, 1, 1,
0.8386028, -1.125118, 4.062079, 0.8588235, 0, 1, 1,
0.8427065, -0.7245362, 1.626952, 0.8666667, 0, 1, 1,
0.844434, 0.4630804, 0.6463506, 0.8705882, 0, 1, 1,
0.8528056, 0.3286564, 0.550931, 0.8784314, 0, 1, 1,
0.8533234, -0.4442886, 2.076452, 0.8823529, 0, 1, 1,
0.8537896, -2.993596, 1.682304, 0.8901961, 0, 1, 1,
0.8541974, -1.764443, 5.361522, 0.8941177, 0, 1, 1,
0.8689063, 0.3194339, 0.6313037, 0.9019608, 0, 1, 1,
0.872595, 0.1758421, 0.6191118, 0.9098039, 0, 1, 1,
0.8774709, -1.014995, 1.172567, 0.9137255, 0, 1, 1,
0.8780789, -0.1206853, 2.453479, 0.9215686, 0, 1, 1,
0.8864218, -1.76911, 1.128969, 0.9254902, 0, 1, 1,
0.8867092, 0.02440988, -0.1637497, 0.9333333, 0, 1, 1,
0.890406, 1.152586, -0.205244, 0.9372549, 0, 1, 1,
0.8967068, 0.4166125, 1.274684, 0.945098, 0, 1, 1,
0.9022471, -0.8835006, 4.090591, 0.9490196, 0, 1, 1,
0.9089764, -0.1268153, 2.852085, 0.9568627, 0, 1, 1,
0.9098482, -0.524528, 2.089989, 0.9607843, 0, 1, 1,
0.9120756, -1.005486, 2.940786, 0.9686275, 0, 1, 1,
0.9181099, 1.947743, 1.122867, 0.972549, 0, 1, 1,
0.9261509, -1.565518, 2.849641, 0.9803922, 0, 1, 1,
0.9349411, -0.4834422, 3.238795, 0.9843137, 0, 1, 1,
0.9382526, -0.5953423, 3.550929, 0.9921569, 0, 1, 1,
0.9598305, 1.425685, -0.1584221, 0.9960784, 0, 1, 1,
0.9656401, 0.02235274, 1.315238, 1, 0, 0.9960784, 1,
0.9720486, -1.329681, 1.108096, 1, 0, 0.9882353, 1,
0.9723964, -0.2090996, 3.664814, 1, 0, 0.9843137, 1,
0.9982831, 0.4906358, 1.564683, 1, 0, 0.9764706, 1,
1.02508, 0.8641557, 2.332601, 1, 0, 0.972549, 1,
1.025739, -1.201662, 2.223241, 1, 0, 0.9647059, 1,
1.028744, 1.256146, 0.9870976, 1, 0, 0.9607843, 1,
1.033353, 1.062843, 1.387797, 1, 0, 0.9529412, 1,
1.035757, 0.9758946, 1.180381, 1, 0, 0.9490196, 1,
1.042067, 0.5566769, 0.9622133, 1, 0, 0.9411765, 1,
1.04398, -0.4496879, 2.252075, 1, 0, 0.9372549, 1,
1.044662, -0.664336, 2.323718, 1, 0, 0.9294118, 1,
1.046635, 0.4120393, 1.009237, 1, 0, 0.9254902, 1,
1.047775, -0.05504561, 1.354212, 1, 0, 0.9176471, 1,
1.057556, 1.291915, 1.676402, 1, 0, 0.9137255, 1,
1.058993, -0.4606521, 3.105298, 1, 0, 0.9058824, 1,
1.060207, -0.8133036, 1.554775, 1, 0, 0.9019608, 1,
1.062424, -2.159194, 2.423956, 1, 0, 0.8941177, 1,
1.06412, 1.182126, 1.689999, 1, 0, 0.8862745, 1,
1.066316, -1.320608, 3.043869, 1, 0, 0.8823529, 1,
1.073272, 0.1432588, 0.7822798, 1, 0, 0.8745098, 1,
1.073971, -0.6037257, 2.686843, 1, 0, 0.8705882, 1,
1.079798, 0.7838033, 1.358419, 1, 0, 0.8627451, 1,
1.088594, -0.7315649, 0.9941751, 1, 0, 0.8588235, 1,
1.095241, -0.217897, 3.569548, 1, 0, 0.8509804, 1,
1.097869, -0.341748, 1.309281, 1, 0, 0.8470588, 1,
1.09952, -1.989554, 2.686575, 1, 0, 0.8392157, 1,
1.105916, -0.4306287, 1.684041, 1, 0, 0.8352941, 1,
1.109013, -1.304624, 3.276788, 1, 0, 0.827451, 1,
1.109584, -0.8368049, 3.757444, 1, 0, 0.8235294, 1,
1.122227, -0.4723915, 1.054981, 1, 0, 0.8156863, 1,
1.12423, -1.247105, 2.875434, 1, 0, 0.8117647, 1,
1.125443, -0.2506462, 1.304127, 1, 0, 0.8039216, 1,
1.127138, -0.2008342, 0.681325, 1, 0, 0.7960784, 1,
1.129996, 1.348468, -0.9600549, 1, 0, 0.7921569, 1,
1.131979, 0.8744858, 1.128168, 1, 0, 0.7843137, 1,
1.132285, 0.4924998, 1.128048, 1, 0, 0.7803922, 1,
1.13449, 0.121877, 2.049483, 1, 0, 0.772549, 1,
1.135412, 2.063434, -0.7595987, 1, 0, 0.7686275, 1,
1.135638, 0.6511717, 1.167781, 1, 0, 0.7607843, 1,
1.137502, -0.5445307, 0.7375758, 1, 0, 0.7568628, 1,
1.151474, -1.86813, 4.157466, 1, 0, 0.7490196, 1,
1.163806, -0.02351136, 2.973608, 1, 0, 0.7450981, 1,
1.166169, -1.608234, 4.170802, 1, 0, 0.7372549, 1,
1.178692, 0.2948394, 3.127537, 1, 0, 0.7333333, 1,
1.179607, -1.109182, 2.45608, 1, 0, 0.7254902, 1,
1.190208, -0.7785595, 1.340916, 1, 0, 0.7215686, 1,
1.191565, 0.3457063, 0.6154272, 1, 0, 0.7137255, 1,
1.192908, -0.3698865, 2.519083, 1, 0, 0.7098039, 1,
1.197545, -1.947361, 2.502963, 1, 0, 0.7019608, 1,
1.197821, -0.1680156, 2.180986, 1, 0, 0.6941177, 1,
1.201088, 0.8244237, -0.05723836, 1, 0, 0.6901961, 1,
1.224747, 0.107367, -1.639044, 1, 0, 0.682353, 1,
1.226541, 0.3185534, -0.6096395, 1, 0, 0.6784314, 1,
1.233092, 0.09780169, 1.148704, 1, 0, 0.6705883, 1,
1.240827, -1.223954, 1.863389, 1, 0, 0.6666667, 1,
1.244671, 2.197656, -0.2651471, 1, 0, 0.6588235, 1,
1.249826, -1.030465, 3.171064, 1, 0, 0.654902, 1,
1.250373, 1.071392, 0.6219225, 1, 0, 0.6470588, 1,
1.264826, -0.8096695, 0.8560734, 1, 0, 0.6431373, 1,
1.270271, -1.197212, 3.07106, 1, 0, 0.6352941, 1,
1.296289, -1.725224, 2.749842, 1, 0, 0.6313726, 1,
1.296402, 0.198162, 1.71208, 1, 0, 0.6235294, 1,
1.306913, 0.8081424, 0.5436208, 1, 0, 0.6196079, 1,
1.315224, 0.1954629, -0.6585102, 1, 0, 0.6117647, 1,
1.317353, 0.2819581, 1.952577, 1, 0, 0.6078432, 1,
1.318607, -1.776903, 2.250241, 1, 0, 0.6, 1,
1.321708, -0.6439158, 3.603861, 1, 0, 0.5921569, 1,
1.326546, -0.008782504, 1.85027, 1, 0, 0.5882353, 1,
1.339794, 0.2382563, 2.049253, 1, 0, 0.5803922, 1,
1.340087, -0.9424338, 2.879305, 1, 0, 0.5764706, 1,
1.346342, 0.9829323, 0.2230914, 1, 0, 0.5686275, 1,
1.350649, -0.5303817, 2.412388, 1, 0, 0.5647059, 1,
1.353614, 0.05211614, 2.298664, 1, 0, 0.5568628, 1,
1.354456, 0.9993327, 0.6086773, 1, 0, 0.5529412, 1,
1.3558, -2.039731, 1.605466, 1, 0, 0.5450981, 1,
1.356519, -1.063655, 1.444984, 1, 0, 0.5411765, 1,
1.372918, -0.1139915, 1.63418, 1, 0, 0.5333334, 1,
1.375636, 0.1187861, 1.093576, 1, 0, 0.5294118, 1,
1.3764, 1.385758, -0.5950094, 1, 0, 0.5215687, 1,
1.389668, 0.6923472, 2.725737, 1, 0, 0.5176471, 1,
1.41004, -0.02623831, 2.198122, 1, 0, 0.509804, 1,
1.41164, 0.2881081, 2.167143, 1, 0, 0.5058824, 1,
1.414247, -0.4131284, 1.721357, 1, 0, 0.4980392, 1,
1.414888, 0.7429458, 0.07661301, 1, 0, 0.4901961, 1,
1.423741, -0.4717552, 2.82926, 1, 0, 0.4862745, 1,
1.43485, 1.386253, 0.8297965, 1, 0, 0.4784314, 1,
1.466326, 0.517655, 1.537628, 1, 0, 0.4745098, 1,
1.474357, -0.6700318, 1.501166, 1, 0, 0.4666667, 1,
1.477796, -0.104491, 2.430056, 1, 0, 0.4627451, 1,
1.491633, 0.3450433, 2.264941, 1, 0, 0.454902, 1,
1.496343, -0.9256513, 2.83662, 1, 0, 0.4509804, 1,
1.506067, -0.7279372, 2.106031, 1, 0, 0.4431373, 1,
1.509702, -0.2392228, 3.215555, 1, 0, 0.4392157, 1,
1.517949, 0.5141456, 2.722673, 1, 0, 0.4313726, 1,
1.522263, -0.6558174, 2.98666, 1, 0, 0.427451, 1,
1.528322, 0.02311947, 0.8546591, 1, 0, 0.4196078, 1,
1.55447, -1.027513, 3.392773, 1, 0, 0.4156863, 1,
1.559716, 0.572722, 1.210012, 1, 0, 0.4078431, 1,
1.568626, -0.3166035, 3.597238, 1, 0, 0.4039216, 1,
1.579391, 0.3945409, 0.1531761, 1, 0, 0.3960784, 1,
1.579624, -1.211966, 2.68215, 1, 0, 0.3882353, 1,
1.581704, -0.703584, 1.471861, 1, 0, 0.3843137, 1,
1.585388, -0.09808723, 0.2589378, 1, 0, 0.3764706, 1,
1.593787, -0.9744593, 2.319036, 1, 0, 0.372549, 1,
1.605719, -0.9427507, 2.457396, 1, 0, 0.3647059, 1,
1.610189, -1.232265, 2.574656, 1, 0, 0.3607843, 1,
1.625339, -2.794324, 1.969948, 1, 0, 0.3529412, 1,
1.62873, -1.103269, 1.878481, 1, 0, 0.3490196, 1,
1.629717, -0.01121508, 1.733461, 1, 0, 0.3411765, 1,
1.633239, 2.162482, 1.020471, 1, 0, 0.3372549, 1,
1.635115, 1.784291, 2.443439, 1, 0, 0.3294118, 1,
1.641999, -0.428697, 2.176799, 1, 0, 0.3254902, 1,
1.657069, -1.007266, 3.339215, 1, 0, 0.3176471, 1,
1.660448, 0.6329817, 3.211006, 1, 0, 0.3137255, 1,
1.664461, 1.054293, 0.4211836, 1, 0, 0.3058824, 1,
1.676518, 1.12324, 0.8728174, 1, 0, 0.2980392, 1,
1.676849, 0.7346398, 0.297624, 1, 0, 0.2941177, 1,
1.686723, -0.8409491, 3.085077, 1, 0, 0.2862745, 1,
1.691278, -0.7311376, 2.139908, 1, 0, 0.282353, 1,
1.691551, 1.584542, -0.3481774, 1, 0, 0.2745098, 1,
1.693238, -0.6412909, 2.378146, 1, 0, 0.2705882, 1,
1.744795, 1.394687, 0.4185378, 1, 0, 0.2627451, 1,
1.75102, -0.3633035, 3.736598, 1, 0, 0.2588235, 1,
1.75988, 0.07312416, 2.619836, 1, 0, 0.2509804, 1,
1.772147, 0.8452011, 0.2499416, 1, 0, 0.2470588, 1,
1.779596, -1.128253, 3.368563, 1, 0, 0.2392157, 1,
1.788075, 0.7377893, 1.455201, 1, 0, 0.2352941, 1,
1.799996, -0.8524352, 2.155401, 1, 0, 0.227451, 1,
1.802156, -0.5440102, 2.115132, 1, 0, 0.2235294, 1,
1.811856, -0.9398584, 2.780523, 1, 0, 0.2156863, 1,
1.819877, 0.7317884, 0.6482671, 1, 0, 0.2117647, 1,
1.829096, 0.7105618, 2.669826, 1, 0, 0.2039216, 1,
1.831472, -1.200631, -0.1059213, 1, 0, 0.1960784, 1,
1.83593, -0.534569, 3.271835, 1, 0, 0.1921569, 1,
1.859015, -0.4305165, 1.712928, 1, 0, 0.1843137, 1,
1.866001, -0.6847566, 0.6851375, 1, 0, 0.1803922, 1,
1.891837, -0.04170468, 2.437158, 1, 0, 0.172549, 1,
1.900409, 1.900119, 1.327879, 1, 0, 0.1686275, 1,
1.916812, 0.09153319, 2.863343, 1, 0, 0.1607843, 1,
1.934119, -0.4490114, 1.46165, 1, 0, 0.1568628, 1,
1.949606, -0.1600197, 1.676871, 1, 0, 0.1490196, 1,
1.972783, -1.16596, 3.051374, 1, 0, 0.145098, 1,
1.9866, 0.698036, 0.4591126, 1, 0, 0.1372549, 1,
1.988281, -2.000163, 3.203514, 1, 0, 0.1333333, 1,
2.0011, 0.8952913, 0.009606714, 1, 0, 0.1254902, 1,
2.129869, -0.09977233, 1.324242, 1, 0, 0.1215686, 1,
2.135936, -0.1178189, 0.7660668, 1, 0, 0.1137255, 1,
2.181253, -0.2072753, 1.561396, 1, 0, 0.1098039, 1,
2.219631, -0.5844354, 1.903118, 1, 0, 0.1019608, 1,
2.233258, 1.224792, 0.06428709, 1, 0, 0.09411765, 1,
2.256761, -0.7487586, 1.261986, 1, 0, 0.09019608, 1,
2.258513, -0.944487, 1.136161, 1, 0, 0.08235294, 1,
2.271496, 0.7876796, 0.3966874, 1, 0, 0.07843138, 1,
2.294705, 2.009805, 0.578462, 1, 0, 0.07058824, 1,
2.310757, 0.7762053, 0.2840595, 1, 0, 0.06666667, 1,
2.396471, -0.5671363, 1.508885, 1, 0, 0.05882353, 1,
2.600996, -0.8740123, 2.196599, 1, 0, 0.05490196, 1,
2.642597, -1.774991, 2.886549, 1, 0, 0.04705882, 1,
2.653481, -0.6160676, 1.37119, 1, 0, 0.04313726, 1,
2.96663, 0.7434464, 0.2585959, 1, 0, 0.03529412, 1,
3.00684, 1.050578, 1.934699, 1, 0, 0.03137255, 1,
3.160945, 0.5693582, 2.980283, 1, 0, 0.02352941, 1,
3.193149, -0.7293982, 1.346513, 1, 0, 0.01960784, 1,
3.353079, -0.9902437, 0.7888404, 1, 0, 0.01176471, 1,
3.379917, -0.4305243, 1.290937, 1, 0, 0.007843138, 1
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
0.04373407, -5.396437, -7.084602, 0, -0.5, 0.5, 0.5,
0.04373407, -5.396437, -7.084602, 1, -0.5, 0.5, 0.5,
0.04373407, -5.396437, -7.084602, 1, 1.5, 0.5, 0.5,
0.04373407, -5.396437, -7.084602, 0, 1.5, 0.5, 0.5
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
-4.423415, -0.6650172, -7.084602, 0, -0.5, 0.5, 0.5,
-4.423415, -0.6650172, -7.084602, 1, -0.5, 0.5, 0.5,
-4.423415, -0.6650172, -7.084602, 1, 1.5, 0.5, 0.5,
-4.423415, -0.6650172, -7.084602, 0, 1.5, 0.5, 0.5
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
-4.423415, -5.396437, 0.1562107, 0, -0.5, 0.5, 0.5,
-4.423415, -5.396437, 0.1562107, 1, -0.5, 0.5, 0.5,
-4.423415, -5.396437, 0.1562107, 1, 1.5, 0.5, 0.5,
-4.423415, -5.396437, 0.1562107, 0, 1.5, 0.5, 0.5
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
-3, -4.304571, -5.413645,
3, -4.304571, -5.413645,
-3, -4.304571, -5.413645,
-3, -4.486548, -5.692138,
-2, -4.304571, -5.413645,
-2, -4.486548, -5.692138,
-1, -4.304571, -5.413645,
-1, -4.486548, -5.692138,
0, -4.304571, -5.413645,
0, -4.486548, -5.692138,
1, -4.304571, -5.413645,
1, -4.486548, -5.692138,
2, -4.304571, -5.413645,
2, -4.486548, -5.692138,
3, -4.304571, -5.413645,
3, -4.486548, -5.692138
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
-3, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
-3, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
-3, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
-3, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5,
-2, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
-2, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
-2, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
-2, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5,
-1, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
-1, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
-1, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
-1, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5,
0, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
0, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
0, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
0, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5,
1, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
1, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
1, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
1, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5,
2, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
2, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
2, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
2, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5,
3, -4.850504, -6.249124, 0, -0.5, 0.5, 0.5,
3, -4.850504, -6.249124, 1, -0.5, 0.5, 0.5,
3, -4.850504, -6.249124, 1, 1.5, 0.5, 0.5,
3, -4.850504, -6.249124, 0, 1.5, 0.5, 0.5
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
-3.392534, -4, -5.413645,
-3.392534, 2, -5.413645,
-3.392534, -4, -5.413645,
-3.564348, -4, -5.692138,
-3.392534, -2, -5.413645,
-3.564348, -2, -5.692138,
-3.392534, 0, -5.413645,
-3.564348, 0, -5.692138,
-3.392534, 2, -5.413645,
-3.564348, 2, -5.692138
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
-3.907974, -4, -6.249124, 0, -0.5, 0.5, 0.5,
-3.907974, -4, -6.249124, 1, -0.5, 0.5, 0.5,
-3.907974, -4, -6.249124, 1, 1.5, 0.5, 0.5,
-3.907974, -4, -6.249124, 0, 1.5, 0.5, 0.5,
-3.907974, -2, -6.249124, 0, -0.5, 0.5, 0.5,
-3.907974, -2, -6.249124, 1, -0.5, 0.5, 0.5,
-3.907974, -2, -6.249124, 1, 1.5, 0.5, 0.5,
-3.907974, -2, -6.249124, 0, 1.5, 0.5, 0.5,
-3.907974, 0, -6.249124, 0, -0.5, 0.5, 0.5,
-3.907974, 0, -6.249124, 1, -0.5, 0.5, 0.5,
-3.907974, 0, -6.249124, 1, 1.5, 0.5, 0.5,
-3.907974, 0, -6.249124, 0, 1.5, 0.5, 0.5,
-3.907974, 2, -6.249124, 0, -0.5, 0.5, 0.5,
-3.907974, 2, -6.249124, 1, -0.5, 0.5, 0.5,
-3.907974, 2, -6.249124, 1, 1.5, 0.5, 0.5,
-3.907974, 2, -6.249124, 0, 1.5, 0.5, 0.5
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
-3.392534, -4.304571, -4,
-3.392534, -4.304571, 4,
-3.392534, -4.304571, -4,
-3.564348, -4.486548, -4,
-3.392534, -4.304571, -2,
-3.564348, -4.486548, -2,
-3.392534, -4.304571, 0,
-3.564348, -4.486548, 0,
-3.392534, -4.304571, 2,
-3.564348, -4.486548, 2,
-3.392534, -4.304571, 4,
-3.564348, -4.486548, 4
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
-3.907974, -4.850504, -4, 0, -0.5, 0.5, 0.5,
-3.907974, -4.850504, -4, 1, -0.5, 0.5, 0.5,
-3.907974, -4.850504, -4, 1, 1.5, 0.5, 0.5,
-3.907974, -4.850504, -4, 0, 1.5, 0.5, 0.5,
-3.907974, -4.850504, -2, 0, -0.5, 0.5, 0.5,
-3.907974, -4.850504, -2, 1, -0.5, 0.5, 0.5,
-3.907974, -4.850504, -2, 1, 1.5, 0.5, 0.5,
-3.907974, -4.850504, -2, 0, 1.5, 0.5, 0.5,
-3.907974, -4.850504, 0, 0, -0.5, 0.5, 0.5,
-3.907974, -4.850504, 0, 1, -0.5, 0.5, 0.5,
-3.907974, -4.850504, 0, 1, 1.5, 0.5, 0.5,
-3.907974, -4.850504, 0, 0, 1.5, 0.5, 0.5,
-3.907974, -4.850504, 2, 0, -0.5, 0.5, 0.5,
-3.907974, -4.850504, 2, 1, -0.5, 0.5, 0.5,
-3.907974, -4.850504, 2, 1, 1.5, 0.5, 0.5,
-3.907974, -4.850504, 2, 0, 1.5, 0.5, 0.5,
-3.907974, -4.850504, 4, 0, -0.5, 0.5, 0.5,
-3.907974, -4.850504, 4, 1, -0.5, 0.5, 0.5,
-3.907974, -4.850504, 4, 1, 1.5, 0.5, 0.5,
-3.907974, -4.850504, 4, 0, 1.5, 0.5, 0.5
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
-3.392534, -4.304571, -5.413645,
-3.392534, 2.974536, -5.413645,
-3.392534, -4.304571, 5.726067,
-3.392534, 2.974536, 5.726067,
-3.392534, -4.304571, -5.413645,
-3.392534, -4.304571, 5.726067,
-3.392534, 2.974536, -5.413645,
-3.392534, 2.974536, 5.726067,
-3.392534, -4.304571, -5.413645,
3.480002, -4.304571, -5.413645,
-3.392534, -4.304571, 5.726067,
3.480002, -4.304571, 5.726067,
-3.392534, 2.974536, -5.413645,
3.480002, 2.974536, -5.413645,
-3.392534, 2.974536, 5.726067,
3.480002, 2.974536, 5.726067,
3.480002, -4.304571, -5.413645,
3.480002, 2.974536, -5.413645,
3.480002, -4.304571, 5.726067,
3.480002, 2.974536, 5.726067,
3.480002, -4.304571, -5.413645,
3.480002, -4.304571, 5.726067,
3.480002, 2.974536, -5.413645,
3.480002, 2.974536, 5.726067
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
var radius = 7.997424;
var distance = 35.58144;
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
mvMatrix.translate( -0.04373407, 0.6650172, -0.1562107 );
mvMatrix.scale( 1.258192, 1.187917, 0.7762293 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58144);
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
cyromazine<-read.table("cyromazine.xyz")
```

```
## Error in read.table("cyromazine.xyz"): no lines available in input
```

```r
x<-cyromazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyromazine' not found
```

```r
y<-cyromazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyromazine' not found
```

```r
z<-cyromazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyromazine' not found
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
-3.292449, 0.6898636, -2.049751, 0, 0, 1, 1, 1,
-2.941339, -0.9585577, -2.260894, 1, 0, 0, 1, 1,
-2.936318, 2.343509, -1.94979, 1, 0, 0, 1, 1,
-2.832451, -0.3527514, -1.469535, 1, 0, 0, 1, 1,
-2.73668, -0.2662166, -1.342673, 1, 0, 0, 1, 1,
-2.727938, 2.39449, -0.9921159, 1, 0, 0, 1, 1,
-2.617322, 0.1641418, 0.6214627, 0, 0, 0, 1, 1,
-2.472834, -0.8475823, -1.674533, 0, 0, 0, 1, 1,
-2.466529, -0.4076845, -1.600164, 0, 0, 0, 1, 1,
-2.402405, 1.601677, -1.952145, 0, 0, 0, 1, 1,
-2.33533, -0.1678462, -1.040402, 0, 0, 0, 1, 1,
-2.289219, 0.9056203, -0.7096109, 0, 0, 0, 1, 1,
-2.287594, -0.2137129, -0.05651797, 0, 0, 0, 1, 1,
-2.260573, -1.201399, -0.6478634, 1, 1, 1, 1, 1,
-2.211318, -0.5140282, -2.82094, 1, 1, 1, 1, 1,
-2.143908, -0.7608581, -1.42577, 1, 1, 1, 1, 1,
-2.142135, -0.9231108, -1.849607, 1, 1, 1, 1, 1,
-2.085287, 0.6327945, -2.097879, 1, 1, 1, 1, 1,
-2.038745, 0.229899, -2.11586, 1, 1, 1, 1, 1,
-2.03548, 0.6315172, -0.1230187, 1, 1, 1, 1, 1,
-2.001099, -0.6900227, -3.308932, 1, 1, 1, 1, 1,
-1.999281, -0.05423393, -1.406498, 1, 1, 1, 1, 1,
-1.99903, -0.8097892, -3.764156, 1, 1, 1, 1, 1,
-1.99495, -2.099926, -1.151332, 1, 1, 1, 1, 1,
-1.980784, 0.2186532, -1.748531, 1, 1, 1, 1, 1,
-1.976879, 0.04319031, -2.26351, 1, 1, 1, 1, 1,
-1.9634, -2.479697, 0.8179173, 1, 1, 1, 1, 1,
-1.937375, 0.2621507, -1.696967, 1, 1, 1, 1, 1,
-1.931002, 0.09190002, -1.109985, 0, 0, 1, 1, 1,
-1.86384, 0.8688588, -1.268409, 1, 0, 0, 1, 1,
-1.855263, 1.175575, -0.5323343, 1, 0, 0, 1, 1,
-1.854251, 1.826296, -0.2492247, 1, 0, 0, 1, 1,
-1.853579, -0.6301686, -3.02695, 1, 0, 0, 1, 1,
-1.834749, 0.921176, -1.50556, 1, 0, 0, 1, 1,
-1.802379, -0.8562831, -2.210721, 0, 0, 0, 1, 1,
-1.796261, 2.47042, -1.310988, 0, 0, 0, 1, 1,
-1.786553, -0.181124, -1.774325, 0, 0, 0, 1, 1,
-1.745896, -1.165601, 0.2157695, 0, 0, 0, 1, 1,
-1.742871, 0.1534135, -2.608287, 0, 0, 0, 1, 1,
-1.719553, -1.778594, -3.50566, 0, 0, 0, 1, 1,
-1.714173, -0.6073495, -1.314001, 0, 0, 0, 1, 1,
-1.713813, 0.4485521, -1.640282, 1, 1, 1, 1, 1,
-1.704794, 0.08596501, -0.7837182, 1, 1, 1, 1, 1,
-1.700805, 1.079512, -0.01257127, 1, 1, 1, 1, 1,
-1.698764, -0.3280706, -2.63291, 1, 1, 1, 1, 1,
-1.695743, -0.7409693, -3.012622, 1, 1, 1, 1, 1,
-1.670851, 0.05621514, -1.800999, 1, 1, 1, 1, 1,
-1.656896, -0.3341136, -1.638767, 1, 1, 1, 1, 1,
-1.648724, 0.1286476, -0.9713793, 1, 1, 1, 1, 1,
-1.647624, -0.09643111, -0.427236, 1, 1, 1, 1, 1,
-1.638035, 0.006657015, -1.394501, 1, 1, 1, 1, 1,
-1.634753, 0.3542048, -1.741372, 1, 1, 1, 1, 1,
-1.630161, -0.3852177, -1.35988, 1, 1, 1, 1, 1,
-1.627131, 0.4413768, 0.1981512, 1, 1, 1, 1, 1,
-1.622855, -0.4962038, -1.922098, 1, 1, 1, 1, 1,
-1.620601, 0.3367864, -0.354954, 1, 1, 1, 1, 1,
-1.593938, 0.1376814, -0.8117382, 0, 0, 1, 1, 1,
-1.590777, -0.9385875, -3.34698, 1, 0, 0, 1, 1,
-1.5755, -0.4381852, -1.825948, 1, 0, 0, 1, 1,
-1.572926, -0.5455502, -2.053943, 1, 0, 0, 1, 1,
-1.555214, 0.3384445, -1.545972, 1, 0, 0, 1, 1,
-1.548397, 2.105169, -0.3165546, 1, 0, 0, 1, 1,
-1.513908, 0.08142587, -1.619026, 0, 0, 0, 1, 1,
-1.505386, 0.3893364, -1.289207, 0, 0, 0, 1, 1,
-1.484593, -0.9787478, -0.8912717, 0, 0, 0, 1, 1,
-1.480358, 0.4143523, -1.236346, 0, 0, 0, 1, 1,
-1.478183, -1.398579, -3.058447, 0, 0, 0, 1, 1,
-1.475273, 1.079913, 0.5120652, 0, 0, 0, 1, 1,
-1.466474, 1.488694, 0.2160156, 0, 0, 0, 1, 1,
-1.466301, 1.309755, 2.006861, 1, 1, 1, 1, 1,
-1.465555, 1.384199, -0.6615547, 1, 1, 1, 1, 1,
-1.462654, 1.120683, -1.639367, 1, 1, 1, 1, 1,
-1.456965, -1.772607, -2.435511, 1, 1, 1, 1, 1,
-1.447068, -0.157529, -1.558672, 1, 1, 1, 1, 1,
-1.418544, 1.380896, -0.548961, 1, 1, 1, 1, 1,
-1.412382, 0.6088924, -1.237776, 1, 1, 1, 1, 1,
-1.410953, -0.8051828, -1.804776, 1, 1, 1, 1, 1,
-1.403772, -0.3012111, -3.816533, 1, 1, 1, 1, 1,
-1.400933, 0.5910039, -0.8350399, 1, 1, 1, 1, 1,
-1.399133, -1.229074, -2.362253, 1, 1, 1, 1, 1,
-1.393114, -0.5418734, -2.060725, 1, 1, 1, 1, 1,
-1.392306, 0.4424453, -1.790936, 1, 1, 1, 1, 1,
-1.38662, -0.03241778, -0.558756, 1, 1, 1, 1, 1,
-1.382101, -0.2277085, -2.865445, 1, 1, 1, 1, 1,
-1.375491, 0.2402684, -0.798479, 0, 0, 1, 1, 1,
-1.372342, 1.012643, -1.234795, 1, 0, 0, 1, 1,
-1.371329, 0.5784107, 0.5777437, 1, 0, 0, 1, 1,
-1.363679, 2.218326, -0.05142758, 1, 0, 0, 1, 1,
-1.357627, -0.5199981, -2.215276, 1, 0, 0, 1, 1,
-1.354932, 1.089555, -2.706558, 1, 0, 0, 1, 1,
-1.337606, -1.249622, -1.619934, 0, 0, 0, 1, 1,
-1.336963, -0.6874821, -3.359576, 0, 0, 0, 1, 1,
-1.335539, 0.8801818, -1.366879, 0, 0, 0, 1, 1,
-1.327622, -1.326169, -2.318763, 0, 0, 0, 1, 1,
-1.320344, -1.009784, -1.306844, 0, 0, 0, 1, 1,
-1.307438, -1.343291, -1.418277, 0, 0, 0, 1, 1,
-1.306768, -0.05387513, -2.753, 0, 0, 0, 1, 1,
-1.305043, -0.1720922, -3.25333, 1, 1, 1, 1, 1,
-1.293333, -1.060585, -1.092449, 1, 1, 1, 1, 1,
-1.28444, -0.3842046, -2.006627, 1, 1, 1, 1, 1,
-1.281882, -0.3278019, 0.5151566, 1, 1, 1, 1, 1,
-1.280862, 2.86853, -1.230754, 1, 1, 1, 1, 1,
-1.26168, -1.371511, -0.991336, 1, 1, 1, 1, 1,
-1.259504, 0.1052265, -1.45446, 1, 1, 1, 1, 1,
-1.251462, 1.994741, -0.04523285, 1, 1, 1, 1, 1,
-1.251421, -0.1502495, -2.599771, 1, 1, 1, 1, 1,
-1.245842, 1.307309, -0.8332711, 1, 1, 1, 1, 1,
-1.242675, -0.06226749, -1.048137, 1, 1, 1, 1, 1,
-1.239262, -0.6292313, -1.947167, 1, 1, 1, 1, 1,
-1.236521, -1.768764, -2.236598, 1, 1, 1, 1, 1,
-1.229945, -0.335365, -2.47881, 1, 1, 1, 1, 1,
-1.22772, -1.275749, -0.7621737, 1, 1, 1, 1, 1,
-1.227387, -0.1210541, -2.261836, 0, 0, 1, 1, 1,
-1.226634, 0.07829438, -1.077316, 1, 0, 0, 1, 1,
-1.220146, -0.209271, -0.03115576, 1, 0, 0, 1, 1,
-1.217745, 0.44022, -0.8812156, 1, 0, 0, 1, 1,
-1.216065, -1.902213, -2.504267, 1, 0, 0, 1, 1,
-1.210992, 0.508031, -0.5949356, 1, 0, 0, 1, 1,
-1.207656, 0.7104067, -1.984031, 0, 0, 0, 1, 1,
-1.200301, -1.498233, -1.176447, 0, 0, 0, 1, 1,
-1.197275, 1.74611, -1.592985, 0, 0, 0, 1, 1,
-1.197208, -1.790175, -1.386378, 0, 0, 0, 1, 1,
-1.196784, -1.367709, -3.815786, 0, 0, 0, 1, 1,
-1.196773, 1.574653, -1.716881, 0, 0, 0, 1, 1,
-1.182954, 0.5162764, -3.25171, 0, 0, 0, 1, 1,
-1.181257, -0.3785592, -3.302617, 1, 1, 1, 1, 1,
-1.178537, -0.7181429, -2.67323, 1, 1, 1, 1, 1,
-1.177528, 0.4333656, -0.4350439, 1, 1, 1, 1, 1,
-1.174494, 0.3341916, -1.349136, 1, 1, 1, 1, 1,
-1.170689, 1.77233, -1.040055, 1, 1, 1, 1, 1,
-1.168494, -0.4818631, -2.052991, 1, 1, 1, 1, 1,
-1.166104, -0.3410383, -1.000934, 1, 1, 1, 1, 1,
-1.164948, -0.1065861, -1.088341, 1, 1, 1, 1, 1,
-1.161649, 0.718327, -0.7381496, 1, 1, 1, 1, 1,
-1.159753, 0.506718, -1.675417, 1, 1, 1, 1, 1,
-1.156945, 0.24424, -0.2963304, 1, 1, 1, 1, 1,
-1.153181, -0.02237354, -3.590384, 1, 1, 1, 1, 1,
-1.149362, -1.482844, -2.613957, 1, 1, 1, 1, 1,
-1.146083, 1.039037, 0.6797491, 1, 1, 1, 1, 1,
-1.139046, -0.3689339, -2.832224, 1, 1, 1, 1, 1,
-1.138015, -0.7305309, -2.671843, 0, 0, 1, 1, 1,
-1.133768, 1.539851, -0.3297865, 1, 0, 0, 1, 1,
-1.128235, -0.1095569, -0.9089583, 1, 0, 0, 1, 1,
-1.115374, -0.5932693, -2.484068, 1, 0, 0, 1, 1,
-1.112329, 0.06487252, -2.549972, 1, 0, 0, 1, 1,
-1.11162, -1.725618, -1.335992, 1, 0, 0, 1, 1,
-1.108534, -0.9374997, -2.034184, 0, 0, 0, 1, 1,
-1.107714, 1.120946, -1.393598, 0, 0, 0, 1, 1,
-1.107118, -0.3776901, -0.6384976, 0, 0, 0, 1, 1,
-1.099061, 0.398896, -1.053319, 0, 0, 0, 1, 1,
-1.098484, 0.2463734, -1.776646, 0, 0, 0, 1, 1,
-1.094936, 0.5793421, -1.844388, 0, 0, 0, 1, 1,
-1.093316, -0.539632, -1.725591, 0, 0, 0, 1, 1,
-1.089632, 0.1238063, -1.397975, 1, 1, 1, 1, 1,
-1.08805, -1.458565, -3.196069, 1, 1, 1, 1, 1,
-1.086879, 1.695194, -1.470347, 1, 1, 1, 1, 1,
-1.083632, -0.5897909, -1.060163, 1, 1, 1, 1, 1,
-1.077435, 1.169927, -1.126875, 1, 1, 1, 1, 1,
-1.075196, 0.2921337, -1.347876, 1, 1, 1, 1, 1,
-1.074033, -0.1852738, -2.544632, 1, 1, 1, 1, 1,
-1.067476, -0.1323292, -2.95231, 1, 1, 1, 1, 1,
-1.065665, 0.6382596, -1.037661, 1, 1, 1, 1, 1,
-1.058348, 0.7370583, 1.082547, 1, 1, 1, 1, 1,
-1.047238, -0.7852558, -3.242771, 1, 1, 1, 1, 1,
-1.038882, 0.6876959, -2.048136, 1, 1, 1, 1, 1,
-1.035919, -0.182755, -0.6707283, 1, 1, 1, 1, 1,
-1.033825, 0.9818686, 0.3093193, 1, 1, 1, 1, 1,
-1.03025, -0.3324717, -2.339444, 1, 1, 1, 1, 1,
-1.028289, 0.8907359, -1.468297, 0, 0, 1, 1, 1,
-1.015973, -0.4878385, -2.278409, 1, 0, 0, 1, 1,
-1.015754, 0.1627097, -0.8725255, 1, 0, 0, 1, 1,
-1.014659, -0.5475727, -1.177696, 1, 0, 0, 1, 1,
-1.01124, -1.457631, -1.202291, 1, 0, 0, 1, 1,
-0.9748263, 0.2252299, -1.679388, 1, 0, 0, 1, 1,
-0.9687189, -0.6741011, -3.343908, 0, 0, 0, 1, 1,
-0.9667342, -1.188862, -2.929341, 0, 0, 0, 1, 1,
-0.9609922, -0.4966129, -1.817828, 0, 0, 0, 1, 1,
-0.9578673, 1.623854, -0.72982, 0, 0, 0, 1, 1,
-0.9519476, -1.237578, -4.286485, 0, 0, 0, 1, 1,
-0.9488252, -0.9270701, -2.047928, 0, 0, 0, 1, 1,
-0.9468727, 0.2096874, -1.821734, 0, 0, 0, 1, 1,
-0.9433693, 0.2552616, -2.488239, 1, 1, 1, 1, 1,
-0.9345582, -0.8921069, -2.757283, 1, 1, 1, 1, 1,
-0.9306176, -0.2669449, -3.907664, 1, 1, 1, 1, 1,
-0.927806, 0.3835481, -0.06134251, 1, 1, 1, 1, 1,
-0.9274369, 1.973252, 0.7540868, 1, 1, 1, 1, 1,
-0.9232873, 2.00224, -0.4011354, 1, 1, 1, 1, 1,
-0.9181772, -1.936578, -2.254099, 1, 1, 1, 1, 1,
-0.9173238, -0.4795532, -1.981089, 1, 1, 1, 1, 1,
-0.9151953, 0.4298801, -1.050141, 1, 1, 1, 1, 1,
-0.9109858, 0.7037978, -0.384653, 1, 1, 1, 1, 1,
-0.8913921, 1.470231, -0.6229298, 1, 1, 1, 1, 1,
-0.8907422, 1.424027, 1.586501, 1, 1, 1, 1, 1,
-0.8855817, -1.198534, -1.930916, 1, 1, 1, 1, 1,
-0.8820852, -2.070272, -3.83902, 1, 1, 1, 1, 1,
-0.8805301, -0.1692403, -2.123916, 1, 1, 1, 1, 1,
-0.8787642, -0.8020803, -2.04925, 0, 0, 1, 1, 1,
-0.8774876, 0.4012978, -1.142046, 1, 0, 0, 1, 1,
-0.8750517, -1.90478, -1.798513, 1, 0, 0, 1, 1,
-0.8691818, -0.3841902, -2.6573, 1, 0, 0, 1, 1,
-0.8687384, -0.03628697, -1.656104, 1, 0, 0, 1, 1,
-0.8640522, -1.263117, -0.6855467, 1, 0, 0, 1, 1,
-0.8639941, -0.6727548, -2.915202, 0, 0, 0, 1, 1,
-0.8635706, -0.5271592, -3.788822, 0, 0, 0, 1, 1,
-0.857716, -0.03782192, -0.5996633, 0, 0, 0, 1, 1,
-0.8541941, 1.077572, -1.598173, 0, 0, 0, 1, 1,
-0.8527562, 0.9967649, -0.02618681, 0, 0, 0, 1, 1,
-0.8468221, -0.08371153, -1.243212, 0, 0, 0, 1, 1,
-0.8406581, -0.1648556, -3.170103, 0, 0, 0, 1, 1,
-0.838178, -1.349693, -1.498743, 1, 1, 1, 1, 1,
-0.8274025, 0.4617303, -2.345832, 1, 1, 1, 1, 1,
-0.8205038, -0.8283785, -3.224222, 1, 1, 1, 1, 1,
-0.8114762, 1.671394, -1.264173, 1, 1, 1, 1, 1,
-0.8112855, -1.654606, -4.291776, 1, 1, 1, 1, 1,
-0.8069031, -0.1003694, -2.422317, 1, 1, 1, 1, 1,
-0.8044313, 0.07055884, -0.09383048, 1, 1, 1, 1, 1,
-0.8030021, 0.3754157, -1.119472, 1, 1, 1, 1, 1,
-0.8011723, 0.3559038, -1.141525, 1, 1, 1, 1, 1,
-0.7972269, -0.6205593, -1.45131, 1, 1, 1, 1, 1,
-0.7951294, -0.1103381, -2.461363, 1, 1, 1, 1, 1,
-0.7947883, 1.530453, -0.1160771, 1, 1, 1, 1, 1,
-0.7947661, -1.522108, -2.634979, 1, 1, 1, 1, 1,
-0.7946928, 0.218258, -1.411634, 1, 1, 1, 1, 1,
-0.7923711, 0.9580233, -0.8863169, 1, 1, 1, 1, 1,
-0.7918928, -2.348003, -3.386194, 0, 0, 1, 1, 1,
-0.7840441, -0.7992733, -1.126824, 1, 0, 0, 1, 1,
-0.7758173, -1.38621, -3.605252, 1, 0, 0, 1, 1,
-0.7738041, 0.5470841, -1.373925, 1, 0, 0, 1, 1,
-0.7730219, 0.1482946, -0.6253807, 1, 0, 0, 1, 1,
-0.7675977, 1.336842, -0.6023625, 1, 0, 0, 1, 1,
-0.7659155, 1.627926, -0.5066658, 0, 0, 0, 1, 1,
-0.7655627, -1.106282, -3.173879, 0, 0, 0, 1, 1,
-0.7635726, 0.860678, -1.186415, 0, 0, 0, 1, 1,
-0.760421, -0.6369587, -2.152067, 0, 0, 0, 1, 1,
-0.7448038, 0.7695382, -2.410307, 0, 0, 0, 1, 1,
-0.7442093, 1.29288, -1.378559, 0, 0, 0, 1, 1,
-0.7304308, -1.172651, -4.737384, 0, 0, 0, 1, 1,
-0.7287554, 0.4579823, -1.793543, 1, 1, 1, 1, 1,
-0.7238704, -0.417096, -1.853614, 1, 1, 1, 1, 1,
-0.7145918, 0.6820635, -1.419289, 1, 1, 1, 1, 1,
-0.7128708, -0.8883095, -2.073279, 1, 1, 1, 1, 1,
-0.7112545, -0.7170967, -1.97279, 1, 1, 1, 1, 1,
-0.7107199, 1.476155, -1.472334, 1, 1, 1, 1, 1,
-0.7100896, 1.067715, 0.07962768, 1, 1, 1, 1, 1,
-0.705974, 0.5131082, -0.5628123, 1, 1, 1, 1, 1,
-0.704132, 0.1377465, -0.6887999, 1, 1, 1, 1, 1,
-0.7037143, -0.1945741, 0.08358031, 1, 1, 1, 1, 1,
-0.7027048, -1.173808, -2.40698, 1, 1, 1, 1, 1,
-0.7014045, -1.574659, -3.412512, 1, 1, 1, 1, 1,
-0.7012274, 0.03366442, -3.677634, 1, 1, 1, 1, 1,
-0.6998214, -0.5647849, -1.313678, 1, 1, 1, 1, 1,
-0.6996779, 0.6911561, -0.7703594, 1, 1, 1, 1, 1,
-0.6959128, -1.556104, -4.801005, 0, 0, 1, 1, 1,
-0.6951953, 1.551887, -1.56183, 1, 0, 0, 1, 1,
-0.6926774, 1.008727, -0.09820745, 1, 0, 0, 1, 1,
-0.6893554, 0.9602836, -1.379307, 1, 0, 0, 1, 1,
-0.6847711, -1.771279, -2.193511, 1, 0, 0, 1, 1,
-0.6828178, 1.800594, -0.1631831, 1, 0, 0, 1, 1,
-0.680307, 0.1046725, -2.297113, 0, 0, 0, 1, 1,
-0.6788476, 0.8750919, -1.916679, 0, 0, 0, 1, 1,
-0.6783412, 0.7175615, -1.351279, 0, 0, 0, 1, 1,
-0.6780843, -1.636696, -2.661705, 0, 0, 0, 1, 1,
-0.6740909, -1.00927, -2.310425, 0, 0, 0, 1, 1,
-0.6700544, 1.815847, 0.400346, 0, 0, 0, 1, 1,
-0.6668106, 0.2187423, -0.848053, 0, 0, 0, 1, 1,
-0.6664597, -0.5791333, -2.287928, 1, 1, 1, 1, 1,
-0.6620998, -0.08676961, -2.516157, 1, 1, 1, 1, 1,
-0.6601176, 1.158369, 0.5370675, 1, 1, 1, 1, 1,
-0.6557984, 0.07634169, -0.9052323, 1, 1, 1, 1, 1,
-0.655597, 0.8783289, -0.9841264, 1, 1, 1, 1, 1,
-0.647382, 0.677256, -1.744935, 1, 1, 1, 1, 1,
-0.6415139, 0.1962198, -0.436429, 1, 1, 1, 1, 1,
-0.6414729, 0.2583037, -0.9853026, 1, 1, 1, 1, 1,
-0.6413578, -0.5740727, -3.070739, 1, 1, 1, 1, 1,
-0.6405771, -0.170779, -1.222139, 1, 1, 1, 1, 1,
-0.6313444, 0.4981633, 0.6612795, 1, 1, 1, 1, 1,
-0.6304488, 0.5807254, -3.015789, 1, 1, 1, 1, 1,
-0.6282836, 1.30873, 0.02186426, 1, 1, 1, 1, 1,
-0.6278479, 0.6442956, -1.082771, 1, 1, 1, 1, 1,
-0.6198235, -1.447975, -3.245851, 1, 1, 1, 1, 1,
-0.618437, 1.044258, -2.814742, 0, 0, 1, 1, 1,
-0.6141133, -0.5185555, -2.290255, 1, 0, 0, 1, 1,
-0.6137148, -0.02450715, -2.070179, 1, 0, 0, 1, 1,
-0.6114311, -0.07305934, -2.527366, 1, 0, 0, 1, 1,
-0.6112797, 1.571894, -0.08487815, 1, 0, 0, 1, 1,
-0.6102631, -0.9745875, -2.896436, 1, 0, 0, 1, 1,
-0.6072859, -0.002147868, -2.603262, 0, 0, 0, 1, 1,
-0.5980144, 0.6135023, 1.163535, 0, 0, 0, 1, 1,
-0.5976273, -0.4063007, -2.002383, 0, 0, 0, 1, 1,
-0.5966532, -1.560308, -1.703523, 0, 0, 0, 1, 1,
-0.5941855, 0.284919, -0.3202599, 0, 0, 0, 1, 1,
-0.5875602, 0.7124879, 0.9019178, 0, 0, 0, 1, 1,
-0.5850143, -0.5557432, -3.532458, 0, 0, 0, 1, 1,
-0.5833019, -0.2489681, -0.5349249, 1, 1, 1, 1, 1,
-0.5746424, 0.0004451843, -1.258517, 1, 1, 1, 1, 1,
-0.5735526, -0.3228636, -1.790671, 1, 1, 1, 1, 1,
-0.5722234, -1.153635, -0.917815, 1, 1, 1, 1, 1,
-0.5672997, -0.3780458, -1.502995, 1, 1, 1, 1, 1,
-0.5670253, 1.509433, 0.5886381, 1, 1, 1, 1, 1,
-0.5633236, -1.060757, -3.696379, 1, 1, 1, 1, 1,
-0.5625261, -0.9354501, -5.084046, 1, 1, 1, 1, 1,
-0.5608391, -0.1581408, -2.391378, 1, 1, 1, 1, 1,
-0.5573352, 1.255592, -0.3136546, 1, 1, 1, 1, 1,
-0.5530681, -0.04360078, -1.700248, 1, 1, 1, 1, 1,
-0.5493844, -0.2228032, -0.9424405, 1, 1, 1, 1, 1,
-0.5486969, 1.12478, -0.9184411, 1, 1, 1, 1, 1,
-0.548403, -0.1889578, -2.852925, 1, 1, 1, 1, 1,
-0.542041, 1.201288, -0.2341885, 1, 1, 1, 1, 1,
-0.5418153, -0.161856, -3.291567, 0, 0, 1, 1, 1,
-0.5369273, 0.1184913, -1.16594, 1, 0, 0, 1, 1,
-0.5345622, -0.2219069, -1.205489, 1, 0, 0, 1, 1,
-0.5273695, -0.8430251, -2.406645, 1, 0, 0, 1, 1,
-0.5267093, 1.343162, -0.389183, 1, 0, 0, 1, 1,
-0.5233575, 0.7959123, 1.054721, 1, 0, 0, 1, 1,
-0.5211694, 0.2375958, -1.984587, 0, 0, 0, 1, 1,
-0.5205019, -0.7111926, -1.933032, 0, 0, 0, 1, 1,
-0.5204092, 0.2705999, -1.509386, 0, 0, 0, 1, 1,
-0.5185717, -0.8588289, -1.906807, 0, 0, 0, 1, 1,
-0.5145172, 0.6031567, 0.8919222, 0, 0, 0, 1, 1,
-0.5113471, 0.5461212, -0.3381902, 0, 0, 0, 1, 1,
-0.5074573, 1.20302, -0.7591816, 0, 0, 0, 1, 1,
-0.5029901, 0.1588207, -1.962015, 1, 1, 1, 1, 1,
-0.4967027, -4.198565, -3.111375, 1, 1, 1, 1, 1,
-0.4952624, -1.253759, -2.737415, 1, 1, 1, 1, 1,
-0.4903533, 0.707458, -1.313969, 1, 1, 1, 1, 1,
-0.4776457, -0.4334715, -1.857754, 1, 1, 1, 1, 1,
-0.4759766, -0.09864291, -1.403533, 1, 1, 1, 1, 1,
-0.4741152, -0.795732, -0.6520021, 1, 1, 1, 1, 1,
-0.4717594, -0.03291519, -1.864391, 1, 1, 1, 1, 1,
-0.4714641, 1.083073, -0.4829466, 1, 1, 1, 1, 1,
-0.4713078, -0.4875937, -1.044303, 1, 1, 1, 1, 1,
-0.4677527, 0.8195423, -0.8476059, 1, 1, 1, 1, 1,
-0.4656191, -0.2330738, -4.622877, 1, 1, 1, 1, 1,
-0.4630344, -1.314075, -3.545725, 1, 1, 1, 1, 1,
-0.4625493, 1.041871, 0.4561072, 1, 1, 1, 1, 1,
-0.4599036, 1.650396, 1.30535, 1, 1, 1, 1, 1,
-0.4583087, 0.3193788, 0.164652, 0, 0, 1, 1, 1,
-0.45617, 0.6740099, -1.952806, 1, 0, 0, 1, 1,
-0.4559439, -1.004528, -2.987771, 1, 0, 0, 1, 1,
-0.4535755, 1.423208, -1.38241, 1, 0, 0, 1, 1,
-0.4479283, -0.1539252, -0.8450001, 1, 0, 0, 1, 1,
-0.4438058, -0.1440799, -0.7733423, 1, 0, 0, 1, 1,
-0.4400078, -0.6385604, -2.473206, 0, 0, 0, 1, 1,
-0.4398128, -1.123144, -3.235751, 0, 0, 0, 1, 1,
-0.4383762, 2.200374, 0.07780524, 0, 0, 0, 1, 1,
-0.4375945, 0.8861943, 0.5089298, 0, 0, 0, 1, 1,
-0.4362356, 0.6092957, -1.258381, 0, 0, 0, 1, 1,
-0.4352694, -0.8068891, -2.301794, 0, 0, 0, 1, 1,
-0.4341657, -0.2114948, -2.396456, 0, 0, 0, 1, 1,
-0.4336815, 0.3334307, -0.4571681, 1, 1, 1, 1, 1,
-0.4224463, 0.04732404, -1.721014, 1, 1, 1, 1, 1,
-0.4144529, -0.3737149, -0.5831231, 1, 1, 1, 1, 1,
-0.4055188, 1.441475, -2.260952, 1, 1, 1, 1, 1,
-0.4047535, -0.8747137, -1.695001, 1, 1, 1, 1, 1,
-0.4027217, -1.070263, -1.909016, 1, 1, 1, 1, 1,
-0.3973304, 1.818087, 0.1051012, 1, 1, 1, 1, 1,
-0.3971539, 1.181629, 0.4574746, 1, 1, 1, 1, 1,
-0.3959005, 0.09512686, -1.730702, 1, 1, 1, 1, 1,
-0.3935359, 0.4242189, 0.758281, 1, 1, 1, 1, 1,
-0.3923909, 1.606175, -1.565091, 1, 1, 1, 1, 1,
-0.3890609, 0.70414, -2.405758, 1, 1, 1, 1, 1,
-0.3884758, -0.5426416, -5.010418, 1, 1, 1, 1, 1,
-0.3867376, 0.2947992, -0.4434852, 1, 1, 1, 1, 1,
-0.3859017, -0.642351, -2.50107, 1, 1, 1, 1, 1,
-0.3828105, -1.700438, -2.361723, 0, 0, 1, 1, 1,
-0.3828088, -0.8119377, -3.494184, 1, 0, 0, 1, 1,
-0.3821008, 0.5161004, -0.2791983, 1, 0, 0, 1, 1,
-0.3818201, 0.102056, -0.9957647, 1, 0, 0, 1, 1,
-0.3715245, 1.499129, 0.8958633, 1, 0, 0, 1, 1,
-0.3680202, -2.182014, -4.310671, 1, 0, 0, 1, 1,
-0.3641786, 1.232328, -0.7334743, 0, 0, 0, 1, 1,
-0.3634253, 0.03499537, -1.547311, 0, 0, 0, 1, 1,
-0.3605918, 0.2829012, -0.102676, 0, 0, 0, 1, 1,
-0.3578134, -0.1387145, -1.562886, 0, 0, 0, 1, 1,
-0.3530929, 0.536427, 0.7377067, 0, 0, 0, 1, 1,
-0.3415329, -0.2873797, -1.612961, 0, 0, 0, 1, 1,
-0.3398228, -0.2046171, -2.854548, 0, 0, 0, 1, 1,
-0.3382646, 1.551597, -0.5373167, 1, 1, 1, 1, 1,
-0.3365183, 1.459384, -1.611624, 1, 1, 1, 1, 1,
-0.3356302, -0.997314, -0.6928136, 1, 1, 1, 1, 1,
-0.3349863, 0.8475157, 0.676595, 1, 1, 1, 1, 1,
-0.3330487, -0.8509545, -2.81127, 1, 1, 1, 1, 1,
-0.332367, 0.284924, 0.7420819, 1, 1, 1, 1, 1,
-0.3265688, 0.4841603, 1.213089, 1, 1, 1, 1, 1,
-0.3200222, -1.942576, -2.05782, 1, 1, 1, 1, 1,
-0.3179965, 1.007147, -0.7934827, 1, 1, 1, 1, 1,
-0.3172303, -1.83044, -1.85667, 1, 1, 1, 1, 1,
-0.3170938, 0.05444767, -0.4541644, 1, 1, 1, 1, 1,
-0.3136277, -1.426151, -3.601548, 1, 1, 1, 1, 1,
-0.3132072, 0.4004339, -0.7987955, 1, 1, 1, 1, 1,
-0.3122195, 2.31315, 1.463759, 1, 1, 1, 1, 1,
-0.3097441, -0.1748147, -3.604979, 1, 1, 1, 1, 1,
-0.3062044, -1.629809, -2.071796, 0, 0, 1, 1, 1,
-0.3048012, 0.2439168, 0.5070875, 1, 0, 0, 1, 1,
-0.30415, -1.14816, -3.851635, 1, 0, 0, 1, 1,
-0.299438, 0.3346016, -3.392251, 1, 0, 0, 1, 1,
-0.2971212, -0.2342674, -3.146277, 1, 0, 0, 1, 1,
-0.2971147, -0.3512082, -3.60819, 1, 0, 0, 1, 1,
-0.2967733, 0.2275236, -1.783267, 0, 0, 0, 1, 1,
-0.2955098, 0.4292598, -3.707204, 0, 0, 0, 1, 1,
-0.2921159, 0.2659248, 0.2704416, 0, 0, 0, 1, 1,
-0.2833523, 0.4156133, -1.211055, 0, 0, 0, 1, 1,
-0.2793198, -0.09840017, -2.496053, 0, 0, 0, 1, 1,
-0.2788831, 0.3806224, 0.2501775, 0, 0, 0, 1, 1,
-0.2784486, -0.1199874, -1.373002, 0, 0, 0, 1, 1,
-0.2746348, 0.2189814, -2.228409, 1, 1, 1, 1, 1,
-0.2745341, 1.244589, 1.348924, 1, 1, 1, 1, 1,
-0.2729346, 1.056852, -0.5979664, 1, 1, 1, 1, 1,
-0.2727877, 0.3517046, -1.725893, 1, 1, 1, 1, 1,
-0.2711295, -0.2385612, -3.488405, 1, 1, 1, 1, 1,
-0.2699351, 0.1210858, -0.5333458, 1, 1, 1, 1, 1,
-0.268685, 0.08391472, -0.3630238, 1, 1, 1, 1, 1,
-0.2676232, -1.021001, -2.91806, 1, 1, 1, 1, 1,
-0.2668582, 1.700042, -0.5642149, 1, 1, 1, 1, 1,
-0.2665214, 1.00757, 0.371536, 1, 1, 1, 1, 1,
-0.2664173, 1.270877, -0.6861215, 1, 1, 1, 1, 1,
-0.2617751, -0.4731101, -2.474499, 1, 1, 1, 1, 1,
-0.2601395, -0.6078765, -2.823269, 1, 1, 1, 1, 1,
-0.2500346, -0.7595989, -2.966733, 1, 1, 1, 1, 1,
-0.2481086, -1.542398, -2.261515, 1, 1, 1, 1, 1,
-0.2469881, -0.5926514, -1.999187, 0, 0, 1, 1, 1,
-0.2389661, 1.116827, -1.092967, 1, 0, 0, 1, 1,
-0.2355869, 1.655694, -0.6114992, 1, 0, 0, 1, 1,
-0.2338674, 0.8052936, 0.4759356, 1, 0, 0, 1, 1,
-0.2317816, 1.31843, 0.04501534, 1, 0, 0, 1, 1,
-0.2277596, 1.622991, -0.06094251, 1, 0, 0, 1, 1,
-0.2207238, 0.5884796, -0.4390576, 0, 0, 0, 1, 1,
-0.2173826, -0.8633603, -3.997383, 0, 0, 0, 1, 1,
-0.2097549, -0.4448248, -1.326336, 0, 0, 0, 1, 1,
-0.2075052, -1.084572, -2.465031, 0, 0, 0, 1, 1,
-0.2047659, -0.6726355, -2.854203, 0, 0, 0, 1, 1,
-0.2031459, -0.453274, -3.194781, 0, 0, 0, 1, 1,
-0.2023086, -0.404808, -2.917294, 0, 0, 0, 1, 1,
-0.2007231, 1.241282, -1.181651, 1, 1, 1, 1, 1,
-0.1960488, 1.805353, -1.712322, 1, 1, 1, 1, 1,
-0.1924262, 0.4123535, -1.038826, 1, 1, 1, 1, 1,
-0.1919303, -1.030488, -3.293108, 1, 1, 1, 1, 1,
-0.191545, 0.2093769, -1.906743, 1, 1, 1, 1, 1,
-0.1867831, 0.3898502, 1.98507, 1, 1, 1, 1, 1,
-0.1857755, 0.6240928, -0.3174449, 1, 1, 1, 1, 1,
-0.1856463, 1.400657, 0.7750612, 1, 1, 1, 1, 1,
-0.1800686, 0.7221805, -1.014353, 1, 1, 1, 1, 1,
-0.1785838, 1.612293, 0.1965859, 1, 1, 1, 1, 1,
-0.1784952, 0.5441604, 0.1863938, 1, 1, 1, 1, 1,
-0.1743287, -0.07392726, -2.0494, 1, 1, 1, 1, 1,
-0.1650739, 0.4992329, -1.612867, 1, 1, 1, 1, 1,
-0.1647823, -1.034101, -3.938397, 1, 1, 1, 1, 1,
-0.163345, -0.2825573, -2.24191, 1, 1, 1, 1, 1,
-0.1629938, 0.03703509, -1.544594, 0, 0, 1, 1, 1,
-0.1592878, -0.3260166, -3.643052, 1, 0, 0, 1, 1,
-0.1578494, 0.1045906, -2.621427, 1, 0, 0, 1, 1,
-0.1563745, -1.587361, -3.930366, 1, 0, 0, 1, 1,
-0.1555085, -0.9551173, -3.107083, 1, 0, 0, 1, 1,
-0.1548442, 0.07567303, -1.490638, 1, 0, 0, 1, 1,
-0.1522611, -0.1610598, -2.631681, 0, 0, 0, 1, 1,
-0.1490739, 0.2375056, -0.7479129, 0, 0, 0, 1, 1,
-0.1441893, 1.588234, 1.44938, 0, 0, 0, 1, 1,
-0.1438873, -1.386484, -4.175049, 0, 0, 0, 1, 1,
-0.1433584, 0.928501, -1.362947, 0, 0, 0, 1, 1,
-0.1432831, -0.04410984, -2.538277, 0, 0, 0, 1, 1,
-0.1413219, -0.1850224, -2.276115, 0, 0, 0, 1, 1,
-0.1340782, -0.6492541, -1.855017, 1, 1, 1, 1, 1,
-0.1339617, -2.091745, -2.479587, 1, 1, 1, 1, 1,
-0.1336801, 0.2879115, 2.476861, 1, 1, 1, 1, 1,
-0.1332846, 0.123621, -0.5373918, 1, 1, 1, 1, 1,
-0.131892, 0.5428901, -0.8665753, 1, 1, 1, 1, 1,
-0.1281821, -2.45936, -3.67663, 1, 1, 1, 1, 1,
-0.1250162, 0.621604, -0.6843734, 1, 1, 1, 1, 1,
-0.1228007, 0.7538521, -0.5397032, 1, 1, 1, 1, 1,
-0.1225805, -0.8858998, -2.017047, 1, 1, 1, 1, 1,
-0.1221942, -0.545279, -1.060187, 1, 1, 1, 1, 1,
-0.1210245, -0.1264871, -3.688518, 1, 1, 1, 1, 1,
-0.1207036, 0.5479766, -0.02062673, 1, 1, 1, 1, 1,
-0.1195966, -0.9186341, -4.304532, 1, 1, 1, 1, 1,
-0.1182851, -0.7241147, -3.364737, 1, 1, 1, 1, 1,
-0.1158168, -1.007901, -2.996782, 1, 1, 1, 1, 1,
-0.1123046, -0.1373864, -1.831326, 0, 0, 1, 1, 1,
-0.1064209, 0.6199861, -1.088674, 1, 0, 0, 1, 1,
-0.1056968, -0.3204413, -1.592365, 1, 0, 0, 1, 1,
-0.1056398, 0.0289491, -3.579736, 1, 0, 0, 1, 1,
-0.1046167, 1.266225, 1.22859, 1, 0, 0, 1, 1,
-0.1026123, -1.319427, -1.82244, 1, 0, 0, 1, 1,
-0.1013995, 0.4366741, -2.452664, 0, 0, 0, 1, 1,
-0.09806413, 0.2898673, -0.1507775, 0, 0, 0, 1, 1,
-0.09607285, -1.841215, -2.344177, 0, 0, 0, 1, 1,
-0.09590513, -0.4156554, -3.326883, 0, 0, 0, 1, 1,
-0.09567922, 1.251773, -0.09777644, 0, 0, 0, 1, 1,
-0.09120523, -0.835324, -1.741031, 0, 0, 0, 1, 1,
-0.08851052, -1.56123, -2.109859, 0, 0, 0, 1, 1,
-0.08034017, 0.2642503, 0.1942267, 1, 1, 1, 1, 1,
-0.0792393, -1.237332, -2.244883, 1, 1, 1, 1, 1,
-0.07710034, -0.948171, -2.679809, 1, 1, 1, 1, 1,
-0.06444924, 1.957304, -0.1258485, 1, 1, 1, 1, 1,
-0.06419668, 1.101892, -0.7632129, 1, 1, 1, 1, 1,
-0.05198265, 0.841292, 0.6489727, 1, 1, 1, 1, 1,
-0.05160783, 0.1949783, -0.9827312, 1, 1, 1, 1, 1,
-0.04821121, -0.1946601, -3.718925, 1, 1, 1, 1, 1,
-0.04619149, -2.346209, -2.480938, 1, 1, 1, 1, 1,
-0.04486926, 0.9754494, -0.1790367, 1, 1, 1, 1, 1,
-0.04283181, 0.5979408, -0.1763484, 1, 1, 1, 1, 1,
-0.03752664, 0.258681, -0.4925249, 1, 1, 1, 1, 1,
-0.02978724, -0.4103729, -2.661581, 1, 1, 1, 1, 1,
-0.02516485, -0.457424, -2.82916, 1, 1, 1, 1, 1,
-0.02490699, -0.9891816, -5.251417, 1, 1, 1, 1, 1,
-0.02147043, 0.0416581, 0.3072822, 0, 0, 1, 1, 1,
-0.01910648, -1.157516, -3.830785, 1, 0, 0, 1, 1,
-0.01711616, 2.197969, -0.6901828, 1, 0, 0, 1, 1,
-0.0167293, -0.0624609, -2.619965, 1, 0, 0, 1, 1,
-0.01627198, 0.3373173, 0.7858033, 1, 0, 0, 1, 1,
-0.01155293, 0.3509016, 0.5251647, 1, 0, 0, 1, 1,
-0.01123314, 1.593291, 1.815433, 0, 0, 0, 1, 1,
-0.008494657, 0.02478259, 0.2151187, 0, 0, 0, 1, 1,
-0.005366191, -0.9221442, -3.940081, 0, 0, 0, 1, 1,
-0.002811534, -0.07582559, -2.785913, 0, 0, 0, 1, 1,
0.0008641234, -0.09072119, 3.913714, 0, 0, 0, 1, 1,
0.006697237, -2.24784, 3.02199, 0, 0, 0, 1, 1,
0.007234803, 1.314176, -0.183853, 0, 0, 0, 1, 1,
0.009135582, -2.095516, 3.124079, 1, 1, 1, 1, 1,
0.0134013, 1.135105, -0.9497212, 1, 1, 1, 1, 1,
0.02000982, -2.11214, 1.929672, 1, 1, 1, 1, 1,
0.02666659, 0.4954685, -1.060025, 1, 1, 1, 1, 1,
0.02679, 0.7747496, -0.2458085, 1, 1, 1, 1, 1,
0.0284845, 1.168648, -0.9018946, 1, 1, 1, 1, 1,
0.03265483, -1.064305, 3.918831, 1, 1, 1, 1, 1,
0.0351195, -0.07861377, 0.5684054, 1, 1, 1, 1, 1,
0.03820083, 0.819567, -0.4418142, 1, 1, 1, 1, 1,
0.03839494, 0.1605677, -1.709248, 1, 1, 1, 1, 1,
0.03860188, -0.5740641, 3.023571, 1, 1, 1, 1, 1,
0.03870239, -0.4164117, 3.022568, 1, 1, 1, 1, 1,
0.04308172, 0.1698816, 0.5535169, 1, 1, 1, 1, 1,
0.04451349, 0.4752367, 0.06387211, 1, 1, 1, 1, 1,
0.04622432, 1.323507, -0.3639928, 1, 1, 1, 1, 1,
0.04802364, 0.8494577, -0.2089327, 0, 0, 1, 1, 1,
0.04865853, -0.8878897, 4.368911, 1, 0, 0, 1, 1,
0.04975101, 1.756787, -0.4642547, 1, 0, 0, 1, 1,
0.05137686, 2.103143, -1.488793, 1, 0, 0, 1, 1,
0.05179884, -1.051593, 4.117584, 1, 0, 0, 1, 1,
0.0535291, 0.1079005, 0.479277, 1, 0, 0, 1, 1,
0.05395352, 0.025438, 0.3834753, 0, 0, 0, 1, 1,
0.05455761, 1.25685, -0.0350836, 0, 0, 0, 1, 1,
0.05734573, 0.0873839, 0.5271312, 0, 0, 0, 1, 1,
0.0584686, 0.3242908, 0.4614199, 0, 0, 0, 1, 1,
0.05874242, 0.7201877, -0.04696864, 0, 0, 0, 1, 1,
0.06006099, 0.238646, 0.8703921, 0, 0, 0, 1, 1,
0.06024097, -1.152232, 1.149633, 0, 0, 0, 1, 1,
0.06057852, 1.630717, 0.8809887, 1, 1, 1, 1, 1,
0.06620406, -0.1084464, 5.025637, 1, 1, 1, 1, 1,
0.06840807, -0.4287124, 3.567627, 1, 1, 1, 1, 1,
0.06956644, -0.6009505, -0.06118649, 1, 1, 1, 1, 1,
0.0703785, -0.604803, 2.891253, 1, 1, 1, 1, 1,
0.07179205, 0.3036115, -0.568699, 1, 1, 1, 1, 1,
0.07348994, -0.7585315, 1.230322, 1, 1, 1, 1, 1,
0.07506669, 0.870824, -0.8709007, 1, 1, 1, 1, 1,
0.07932432, 0.464434, 2.544108, 1, 1, 1, 1, 1,
0.07992298, 0.2285139, 0.543371, 1, 1, 1, 1, 1,
0.08530007, 0.6225588, -0.2339527, 1, 1, 1, 1, 1,
0.08765259, -0.9989523, 3.135343, 1, 1, 1, 1, 1,
0.08888995, -2.19833, 0.3427033, 1, 1, 1, 1, 1,
0.09219977, -0.684952, 4.917726, 1, 1, 1, 1, 1,
0.09408017, -0.7053385, 4.284956, 1, 1, 1, 1, 1,
0.09742474, -0.09841418, 2.629335, 0, 0, 1, 1, 1,
0.09794388, 0.7379526, 0.1139146, 1, 0, 0, 1, 1,
0.101057, -0.4155864, 1.981215, 1, 0, 0, 1, 1,
0.1046495, 1.215924, 0.3672868, 1, 0, 0, 1, 1,
0.1068078, 1.049802, 1.153712, 1, 0, 0, 1, 1,
0.1090268, -0.6487772, 2.100144, 1, 0, 0, 1, 1,
0.1165199, 0.8271559, 0.1660216, 0, 0, 0, 1, 1,
0.1170214, -0.4015006, 4.117202, 0, 0, 0, 1, 1,
0.1199606, -0.2800063, 1.73482, 0, 0, 0, 1, 1,
0.1219089, -1.480258, 2.753828, 0, 0, 0, 1, 1,
0.1236505, 0.5745858, -0.8979429, 0, 0, 0, 1, 1,
0.1249129, -2.104586, 3.16771, 0, 0, 0, 1, 1,
0.1256609, 1.982437, 0.9703425, 0, 0, 0, 1, 1,
0.1279682, -1.682682, 3.131316, 1, 1, 1, 1, 1,
0.1311175, -0.2439382, 2.40928, 1, 1, 1, 1, 1,
0.1314426, 0.3994042, 2.233113, 1, 1, 1, 1, 1,
0.1326964, 1.071596, 0.6607163, 1, 1, 1, 1, 1,
0.1329669, 1.886283, 1.753465, 1, 1, 1, 1, 1,
0.13489, 0.7635001, -0.1964765, 1, 1, 1, 1, 1,
0.1353042, 0.7321137, -0.2009738, 1, 1, 1, 1, 1,
0.1354484, -0.4497429, 3.300873, 1, 1, 1, 1, 1,
0.1358554, 0.8229674, 0.9340369, 1, 1, 1, 1, 1,
0.1359998, -0.1775952, 0.5022742, 1, 1, 1, 1, 1,
0.1361135, -0.2317458, 1.706212, 1, 1, 1, 1, 1,
0.1380385, -0.07231268, 1.53759, 1, 1, 1, 1, 1,
0.1383153, -0.3345699, 2.955401, 1, 1, 1, 1, 1,
0.1428595, -0.6878176, 1.726663, 1, 1, 1, 1, 1,
0.1475179, 0.1875843, 0.02564958, 1, 1, 1, 1, 1,
0.1562636, -1.663261, 3.009424, 0, 0, 1, 1, 1,
0.1622828, -0.2273193, 3.156514, 1, 0, 0, 1, 1,
0.164156, 0.4778633, 0.1462582, 1, 0, 0, 1, 1,
0.1656405, 1.025997, -1.148379, 1, 0, 0, 1, 1,
0.1658893, -0.3838802, 3.04391, 1, 0, 0, 1, 1,
0.1710342, 1.332105, 0.6140293, 1, 0, 0, 1, 1,
0.1761154, -0.7541041, 3.089818, 0, 0, 0, 1, 1,
0.1789293, -1.411909, 1.66219, 0, 0, 0, 1, 1,
0.1800463, -0.2252281, 2.604798, 0, 0, 0, 1, 1,
0.1808643, -0.04675123, 1.963232, 0, 0, 0, 1, 1,
0.1852414, -0.5447802, 3.100938, 0, 0, 0, 1, 1,
0.1888953, -1.9629, 3.239453, 0, 0, 0, 1, 1,
0.1909017, 0.4340946, -0.3903878, 0, 0, 0, 1, 1,
0.1949341, 0.5344062, -0.04620533, 1, 1, 1, 1, 1,
0.1950417, -0.6445767, 2.119861, 1, 1, 1, 1, 1,
0.196204, 0.2964087, 0.9307825, 1, 1, 1, 1, 1,
0.1967108, 0.5564085, -0.4053411, 1, 1, 1, 1, 1,
0.1996035, -1.715857, 2.654405, 1, 1, 1, 1, 1,
0.2026774, -0.3328583, 2.936974, 1, 1, 1, 1, 1,
0.2173727, -0.8254043, 3.312217, 1, 1, 1, 1, 1,
0.2194111, -1.414711, 3.28559, 1, 1, 1, 1, 1,
0.220844, 2.198149, 1.496989, 1, 1, 1, 1, 1,
0.2219722, -0.8587506, 3.411427, 1, 1, 1, 1, 1,
0.2235118, 1.21661, 0.4318389, 1, 1, 1, 1, 1,
0.2263893, 0.9380033, 0.1104029, 1, 1, 1, 1, 1,
0.2278363, 1.417532, -1.282717, 1, 1, 1, 1, 1,
0.227865, -0.7386347, 0.4951977, 1, 1, 1, 1, 1,
0.2305731, -0.1113324, 2.449042, 1, 1, 1, 1, 1,
0.2315687, 1.129734, -1.349541, 0, 0, 1, 1, 1,
0.2319638, 2.027408, -0.1632469, 1, 0, 0, 1, 1,
0.2338968, 0.6462385, -0.04686582, 1, 0, 0, 1, 1,
0.2407672, -0.1670333, 3.07573, 1, 0, 0, 1, 1,
0.2422958, 0.3531153, -0.9765518, 1, 0, 0, 1, 1,
0.2447222, -0.2865645, 1.904604, 1, 0, 0, 1, 1,
0.2469515, -1.649393, 2.616329, 0, 0, 0, 1, 1,
0.2476032, -0.1966603, 3.266412, 0, 0, 0, 1, 1,
0.248991, 0.5686296, 1.025662, 0, 0, 0, 1, 1,
0.249528, 0.8658558, 2.390907, 0, 0, 0, 1, 1,
0.253397, 1.090991, 0.2865766, 0, 0, 0, 1, 1,
0.2550322, 1.078274, 0.7802283, 0, 0, 0, 1, 1,
0.2553773, -1.451373, 3.074515, 0, 0, 0, 1, 1,
0.2653169, 0.4782802, -1.299858, 1, 1, 1, 1, 1,
0.2675312, 0.143089, 1.203847, 1, 1, 1, 1, 1,
0.2692356, -1.006796, 4.698696, 1, 1, 1, 1, 1,
0.2733541, 1.071177, 0.7558761, 1, 1, 1, 1, 1,
0.2845584, -0.5069904, 1.96811, 1, 1, 1, 1, 1,
0.2856207, 0.7463077, 0.2929597, 1, 1, 1, 1, 1,
0.2863639, -0.1572071, 1.199583, 1, 1, 1, 1, 1,
0.2873946, -1.800679, 3.887821, 1, 1, 1, 1, 1,
0.2877375, 0.5886081, 2.763511, 1, 1, 1, 1, 1,
0.2898522, 0.5719217, -0.2465923, 1, 1, 1, 1, 1,
0.2916623, -0.8812307, 3.650883, 1, 1, 1, 1, 1,
0.2941265, -0.4935871, 2.677514, 1, 1, 1, 1, 1,
0.3034222, -0.1745954, 2.3281, 1, 1, 1, 1, 1,
0.3044775, 0.5135304, 0.5656273, 1, 1, 1, 1, 1,
0.3047343, -1.029157, 2.097689, 1, 1, 1, 1, 1,
0.3059482, -0.6754557, 2.250654, 0, 0, 1, 1, 1,
0.3146887, 0.9022779, 1.079707, 1, 0, 0, 1, 1,
0.3202296, -2.005373, 3.035284, 1, 0, 0, 1, 1,
0.3223663, 0.1783708, 2.989964, 1, 0, 0, 1, 1,
0.3258907, 0.002609996, 1.194371, 1, 0, 0, 1, 1,
0.3291558, 0.716197, 1.966295, 1, 0, 0, 1, 1,
0.330034, -0.08143118, -0.8937398, 0, 0, 0, 1, 1,
0.3373406, 0.8239188, 0.5850345, 0, 0, 0, 1, 1,
0.3379837, 1.350968, -2.396378, 0, 0, 0, 1, 1,
0.3389658, -1.735437, 3.849232, 0, 0, 0, 1, 1,
0.3422204, -1.428172, 2.83138, 0, 0, 0, 1, 1,
0.3456978, 1.126527, 0.5811226, 0, 0, 0, 1, 1,
0.3469282, 1.162206, 0.4166901, 0, 0, 0, 1, 1,
0.3534176, 1.299676, -0.571849, 1, 1, 1, 1, 1,
0.3548059, 0.1436231, 0.5026659, 1, 1, 1, 1, 1,
0.3570224, 0.4025299, 0.859705, 1, 1, 1, 1, 1,
0.3583758, 1.187028, 1.014147, 1, 1, 1, 1, 1,
0.3685137, -2.101172, 3.611918, 1, 1, 1, 1, 1,
0.3713822, -0.5440152, 3.184304, 1, 1, 1, 1, 1,
0.3740965, -1.09924, 2.358508, 1, 1, 1, 1, 1,
0.3827238, -1.044825, 3.69805, 1, 1, 1, 1, 1,
0.3862704, -1.630667, 5.563838, 1, 1, 1, 1, 1,
0.3927003, 1.423833, -0.2091553, 1, 1, 1, 1, 1,
0.3974186, -0.03432699, -0.07258184, 1, 1, 1, 1, 1,
0.4033853, -0.1469649, 1.876161, 1, 1, 1, 1, 1,
0.4034283, -1.308057, 1.605289, 1, 1, 1, 1, 1,
0.4048107, 0.5234053, 1.178423, 1, 1, 1, 1, 1,
0.4107383, -0.152087, 1.424525, 1, 1, 1, 1, 1,
0.4123679, 0.2784955, 0.3264719, 0, 0, 1, 1, 1,
0.4152267, 0.8544386, -1.424263, 1, 0, 0, 1, 1,
0.4155491, 1.351416, 0.7966303, 1, 0, 0, 1, 1,
0.4156946, 0.6996301, 2.442444, 1, 0, 0, 1, 1,
0.4163145, -0.09994277, 1.796404, 1, 0, 0, 1, 1,
0.4249113, 0.5790404, 1.555447, 1, 0, 0, 1, 1,
0.4249914, 1.130773, 1.846548, 0, 0, 0, 1, 1,
0.4251742, -1.663247, 1.628973, 0, 0, 0, 1, 1,
0.4296586, -0.106658, 4.197159, 0, 0, 0, 1, 1,
0.4303609, 1.404538, 1.122819, 0, 0, 0, 1, 1,
0.4306349, 0.1034859, -1.383406, 0, 0, 0, 1, 1,
0.4315211, 0.8783219, 1.076847, 0, 0, 0, 1, 1,
0.4393487, -0.4567163, 1.548471, 0, 0, 0, 1, 1,
0.4426102, 0.2788702, 1.25716, 1, 1, 1, 1, 1,
0.4446222, -0.08458152, 0.9756806, 1, 1, 1, 1, 1,
0.4452932, -1.16133, 3.685264, 1, 1, 1, 1, 1,
0.4526629, -0.38438, 2.777254, 1, 1, 1, 1, 1,
0.4584249, -2.435291, 1.762291, 1, 1, 1, 1, 1,
0.4656803, 1.045783, 1.242094, 1, 1, 1, 1, 1,
0.4680833, -1.300472, 2.514236, 1, 1, 1, 1, 1,
0.4698508, -1.450839, 2.057854, 1, 1, 1, 1, 1,
0.4712612, -0.4511457, 1.499979, 1, 1, 1, 1, 1,
0.476474, 0.3758939, -0.4795353, 1, 1, 1, 1, 1,
0.4775307, 0.3383024, 2.450047, 1, 1, 1, 1, 1,
0.4802267, 0.6591308, 0.5486747, 1, 1, 1, 1, 1,
0.4842121, -0.7952098, 3.418774, 1, 1, 1, 1, 1,
0.4871622, -0.2288677, 2.303247, 1, 1, 1, 1, 1,
0.4907814, 1.894829, -0.728877, 1, 1, 1, 1, 1,
0.4986399, -0.4238154, 1.622844, 0, 0, 1, 1, 1,
0.5024036, 0.9887366, 1.556832, 1, 0, 0, 1, 1,
0.5040068, -0.4168963, 3.886511, 1, 0, 0, 1, 1,
0.5067372, -0.5705245, 2.098141, 1, 0, 0, 1, 1,
0.5076461, 0.5616271, 2.686429, 1, 0, 0, 1, 1,
0.5089252, 1.285433, 0.1377033, 1, 0, 0, 1, 1,
0.5111247, -0.4033774, 1.85933, 0, 0, 0, 1, 1,
0.5115011, 0.4453427, 2.201469, 0, 0, 0, 1, 1,
0.5115504, 0.3246267, 1.776113, 0, 0, 0, 1, 1,
0.5126055, -1.073162, 1.76055, 0, 0, 0, 1, 1,
0.514327, 1.395393, -1.994758, 0, 0, 0, 1, 1,
0.515654, 0.328388, -0.1958466, 0, 0, 0, 1, 1,
0.5162828, 1.508729, -1.119526, 0, 0, 0, 1, 1,
0.5171213, 1.663495, 0.1719166, 1, 1, 1, 1, 1,
0.517861, 0.3608592, 0.9334047, 1, 1, 1, 1, 1,
0.5183735, 0.3727524, -0.9522772, 1, 1, 1, 1, 1,
0.5198304, -0.5247602, 1.732267, 1, 1, 1, 1, 1,
0.521703, 1.312998, -0.9771212, 1, 1, 1, 1, 1,
0.5250914, 0.2303219, 1.462212, 1, 1, 1, 1, 1,
0.5255056, -0.7858906, 1.999418, 1, 1, 1, 1, 1,
0.5275326, -1.358403, 3.269059, 1, 1, 1, 1, 1,
0.5280991, 0.6779246, 0.5226585, 1, 1, 1, 1, 1,
0.5342346, 1.651735, 0.1063691, 1, 1, 1, 1, 1,
0.5383323, 2.508153, 0.2444587, 1, 1, 1, 1, 1,
0.5401621, -0.4105583, 2.70573, 1, 1, 1, 1, 1,
0.5414824, -1.322003, 3.900454, 1, 1, 1, 1, 1,
0.5416688, -1.132873, 3.645907, 1, 1, 1, 1, 1,
0.5525535, 0.1936509, 1.76965, 1, 1, 1, 1, 1,
0.5541631, 0.6420261, 0.2141304, 0, 0, 1, 1, 1,
0.5625248, -0.1187973, 0.9365072, 1, 0, 0, 1, 1,
0.5627115, -0.3907129, 3.220503, 1, 0, 0, 1, 1,
0.5627861, 0.5054995, -0.9522197, 1, 0, 0, 1, 1,
0.5653409, -1.652154, 4.202239, 1, 0, 0, 1, 1,
0.5653821, -0.4021589, 3.373284, 1, 0, 0, 1, 1,
0.5663161, -0.00693532, 2.230892, 0, 0, 0, 1, 1,
0.5668475, 0.8088304, 0.264759, 0, 0, 0, 1, 1,
0.5764167, 0.8622775, -0.0882109, 0, 0, 0, 1, 1,
0.5817785, 0.4655969, 1.520081, 0, 0, 0, 1, 1,
0.5859191, 0.6400843, -0.943729, 0, 0, 0, 1, 1,
0.5873436, 0.1757319, 1.024045, 0, 0, 0, 1, 1,
0.5900208, 0.1383724, 1.794206, 0, 0, 0, 1, 1,
0.5909611, -0.635609, 4.090261, 1, 1, 1, 1, 1,
0.5926082, 0.3962245, -0.350924, 1, 1, 1, 1, 1,
0.5928431, -0.2517891, 1.696164, 1, 1, 1, 1, 1,
0.5944724, 0.2590188, 1.618535, 1, 1, 1, 1, 1,
0.5947888, -0.3436792, 1.005426, 1, 1, 1, 1, 1,
0.5947984, -0.982747, 2.06997, 1, 1, 1, 1, 1,
0.5950639, -1.450878, 1.676123, 1, 1, 1, 1, 1,
0.5971196, -0.971217, 1.729582, 1, 1, 1, 1, 1,
0.5985984, -1.692892, 0.2633762, 1, 1, 1, 1, 1,
0.6000257, -0.2897273, 2.395333, 1, 1, 1, 1, 1,
0.6025819, -0.6225244, 3.986178, 1, 1, 1, 1, 1,
0.6076874, -0.7304658, 4.037281, 1, 1, 1, 1, 1,
0.6128244, 0.9347252, 0.6205855, 1, 1, 1, 1, 1,
0.6147581, 1.873544, 3.216027, 1, 1, 1, 1, 1,
0.6181844, -0.3496594, 1.357585, 1, 1, 1, 1, 1,
0.6293815, -0.3014956, 2.185132, 0, 0, 1, 1, 1,
0.6299789, -0.6935841, 2.689261, 1, 0, 0, 1, 1,
0.6308697, -0.4649265, 1.107201, 1, 0, 0, 1, 1,
0.6356719, 0.6577554, 0.3730255, 1, 0, 0, 1, 1,
0.6421737, 1.276115, -1.533743, 1, 0, 0, 1, 1,
0.6454968, -0.3771914, 2.968136, 1, 0, 0, 1, 1,
0.6490646, -0.4072378, 3.075587, 0, 0, 0, 1, 1,
0.6529247, 1.603557, 0.1341482, 0, 0, 0, 1, 1,
0.6530097, 1.065421, 0.5027962, 0, 0, 0, 1, 1,
0.6543605, 1.110701, 0.2846121, 0, 0, 0, 1, 1,
0.6633594, 2.738362, 0.497602, 0, 0, 0, 1, 1,
0.6654428, -1.132425, 2.188729, 0, 0, 0, 1, 1,
0.6666125, -0.677747, 3.003808, 0, 0, 0, 1, 1,
0.6678283, 1.351633, 0.5020761, 1, 1, 1, 1, 1,
0.6742303, 1.168689, -0.01099962, 1, 1, 1, 1, 1,
0.6756455, -0.1304324, 1.97792, 1, 1, 1, 1, 1,
0.682747, 0.0617084, 2.523529, 1, 1, 1, 1, 1,
0.6889398, -0.2651086, 1.561869, 1, 1, 1, 1, 1,
0.7021786, -0.8747876, 3.031067, 1, 1, 1, 1, 1,
0.7030327, -1.619554, 1.745818, 1, 1, 1, 1, 1,
0.7034647, 0.2456641, -0.03896877, 1, 1, 1, 1, 1,
0.7049155, -1.102261, 4.08352, 1, 1, 1, 1, 1,
0.7083691, 0.1855467, 1.85127, 1, 1, 1, 1, 1,
0.7099386, -0.7778805, 3.642513, 1, 1, 1, 1, 1,
0.7122434, -0.7108287, 2.475628, 1, 1, 1, 1, 1,
0.712844, -0.134523, 2.989952, 1, 1, 1, 1, 1,
0.7136829, 0.2765442, 1.596046, 1, 1, 1, 1, 1,
0.7154203, -0.8161763, 2.43022, 1, 1, 1, 1, 1,
0.7178566, -0.05279638, 1.028827, 0, 0, 1, 1, 1,
0.7209987, -0.8641965, 1.70454, 1, 0, 0, 1, 1,
0.7418968, 0.6317772, 0.7525296, 1, 0, 0, 1, 1,
0.7476951, 0.04470974, 1.625812, 1, 0, 0, 1, 1,
0.7481319, 0.3942975, 0.8382811, 1, 0, 0, 1, 1,
0.7487171, -0.3518569, 2.000569, 1, 0, 0, 1, 1,
0.7511569, -0.4039309, 2.211255, 0, 0, 0, 1, 1,
0.7553366, -2.559982, 2.986525, 0, 0, 0, 1, 1,
0.7568434, 1.915229, -0.07247072, 0, 0, 0, 1, 1,
0.7654276, -0.7484207, 3.555947, 0, 0, 0, 1, 1,
0.7713354, -1.106004, 2.965079, 0, 0, 0, 1, 1,
0.7717443, -0.1660581, 2.135761, 0, 0, 0, 1, 1,
0.7751589, -1.315413, 2.805148, 0, 0, 0, 1, 1,
0.7763109, -0.1548364, 1.226986, 1, 1, 1, 1, 1,
0.7845783, 1.146969, 1.794992, 1, 1, 1, 1, 1,
0.7865689, 1.738093, -0.1361659, 1, 1, 1, 1, 1,
0.7932553, 1.78319, -0.669638, 1, 1, 1, 1, 1,
0.7971488, -0.2092508, 1.537283, 1, 1, 1, 1, 1,
0.8023176, -1.440066, 0.6786822, 1, 1, 1, 1, 1,
0.8028427, 0.3151653, 0.2876541, 1, 1, 1, 1, 1,
0.8092515, -0.3902966, 2.476052, 1, 1, 1, 1, 1,
0.8114586, 0.09350769, 0.7193109, 1, 1, 1, 1, 1,
0.8250238, 1.450731, 0.7672979, 1, 1, 1, 1, 1,
0.8303835, 0.7939618, 0.08129366, 1, 1, 1, 1, 1,
0.8322892, 1.036976, -1.056475, 1, 1, 1, 1, 1,
0.8335522, -1.622398, 2.369326, 1, 1, 1, 1, 1,
0.8386028, -1.125118, 4.062079, 1, 1, 1, 1, 1,
0.8427065, -0.7245362, 1.626952, 1, 1, 1, 1, 1,
0.844434, 0.4630804, 0.6463506, 0, 0, 1, 1, 1,
0.8528056, 0.3286564, 0.550931, 1, 0, 0, 1, 1,
0.8533234, -0.4442886, 2.076452, 1, 0, 0, 1, 1,
0.8537896, -2.993596, 1.682304, 1, 0, 0, 1, 1,
0.8541974, -1.764443, 5.361522, 1, 0, 0, 1, 1,
0.8689063, 0.3194339, 0.6313037, 1, 0, 0, 1, 1,
0.872595, 0.1758421, 0.6191118, 0, 0, 0, 1, 1,
0.8774709, -1.014995, 1.172567, 0, 0, 0, 1, 1,
0.8780789, -0.1206853, 2.453479, 0, 0, 0, 1, 1,
0.8864218, -1.76911, 1.128969, 0, 0, 0, 1, 1,
0.8867092, 0.02440988, -0.1637497, 0, 0, 0, 1, 1,
0.890406, 1.152586, -0.205244, 0, 0, 0, 1, 1,
0.8967068, 0.4166125, 1.274684, 0, 0, 0, 1, 1,
0.9022471, -0.8835006, 4.090591, 1, 1, 1, 1, 1,
0.9089764, -0.1268153, 2.852085, 1, 1, 1, 1, 1,
0.9098482, -0.524528, 2.089989, 1, 1, 1, 1, 1,
0.9120756, -1.005486, 2.940786, 1, 1, 1, 1, 1,
0.9181099, 1.947743, 1.122867, 1, 1, 1, 1, 1,
0.9261509, -1.565518, 2.849641, 1, 1, 1, 1, 1,
0.9349411, -0.4834422, 3.238795, 1, 1, 1, 1, 1,
0.9382526, -0.5953423, 3.550929, 1, 1, 1, 1, 1,
0.9598305, 1.425685, -0.1584221, 1, 1, 1, 1, 1,
0.9656401, 0.02235274, 1.315238, 1, 1, 1, 1, 1,
0.9720486, -1.329681, 1.108096, 1, 1, 1, 1, 1,
0.9723964, -0.2090996, 3.664814, 1, 1, 1, 1, 1,
0.9982831, 0.4906358, 1.564683, 1, 1, 1, 1, 1,
1.02508, 0.8641557, 2.332601, 1, 1, 1, 1, 1,
1.025739, -1.201662, 2.223241, 1, 1, 1, 1, 1,
1.028744, 1.256146, 0.9870976, 0, 0, 1, 1, 1,
1.033353, 1.062843, 1.387797, 1, 0, 0, 1, 1,
1.035757, 0.9758946, 1.180381, 1, 0, 0, 1, 1,
1.042067, 0.5566769, 0.9622133, 1, 0, 0, 1, 1,
1.04398, -0.4496879, 2.252075, 1, 0, 0, 1, 1,
1.044662, -0.664336, 2.323718, 1, 0, 0, 1, 1,
1.046635, 0.4120393, 1.009237, 0, 0, 0, 1, 1,
1.047775, -0.05504561, 1.354212, 0, 0, 0, 1, 1,
1.057556, 1.291915, 1.676402, 0, 0, 0, 1, 1,
1.058993, -0.4606521, 3.105298, 0, 0, 0, 1, 1,
1.060207, -0.8133036, 1.554775, 0, 0, 0, 1, 1,
1.062424, -2.159194, 2.423956, 0, 0, 0, 1, 1,
1.06412, 1.182126, 1.689999, 0, 0, 0, 1, 1,
1.066316, -1.320608, 3.043869, 1, 1, 1, 1, 1,
1.073272, 0.1432588, 0.7822798, 1, 1, 1, 1, 1,
1.073971, -0.6037257, 2.686843, 1, 1, 1, 1, 1,
1.079798, 0.7838033, 1.358419, 1, 1, 1, 1, 1,
1.088594, -0.7315649, 0.9941751, 1, 1, 1, 1, 1,
1.095241, -0.217897, 3.569548, 1, 1, 1, 1, 1,
1.097869, -0.341748, 1.309281, 1, 1, 1, 1, 1,
1.09952, -1.989554, 2.686575, 1, 1, 1, 1, 1,
1.105916, -0.4306287, 1.684041, 1, 1, 1, 1, 1,
1.109013, -1.304624, 3.276788, 1, 1, 1, 1, 1,
1.109584, -0.8368049, 3.757444, 1, 1, 1, 1, 1,
1.122227, -0.4723915, 1.054981, 1, 1, 1, 1, 1,
1.12423, -1.247105, 2.875434, 1, 1, 1, 1, 1,
1.125443, -0.2506462, 1.304127, 1, 1, 1, 1, 1,
1.127138, -0.2008342, 0.681325, 1, 1, 1, 1, 1,
1.129996, 1.348468, -0.9600549, 0, 0, 1, 1, 1,
1.131979, 0.8744858, 1.128168, 1, 0, 0, 1, 1,
1.132285, 0.4924998, 1.128048, 1, 0, 0, 1, 1,
1.13449, 0.121877, 2.049483, 1, 0, 0, 1, 1,
1.135412, 2.063434, -0.7595987, 1, 0, 0, 1, 1,
1.135638, 0.6511717, 1.167781, 1, 0, 0, 1, 1,
1.137502, -0.5445307, 0.7375758, 0, 0, 0, 1, 1,
1.151474, -1.86813, 4.157466, 0, 0, 0, 1, 1,
1.163806, -0.02351136, 2.973608, 0, 0, 0, 1, 1,
1.166169, -1.608234, 4.170802, 0, 0, 0, 1, 1,
1.178692, 0.2948394, 3.127537, 0, 0, 0, 1, 1,
1.179607, -1.109182, 2.45608, 0, 0, 0, 1, 1,
1.190208, -0.7785595, 1.340916, 0, 0, 0, 1, 1,
1.191565, 0.3457063, 0.6154272, 1, 1, 1, 1, 1,
1.192908, -0.3698865, 2.519083, 1, 1, 1, 1, 1,
1.197545, -1.947361, 2.502963, 1, 1, 1, 1, 1,
1.197821, -0.1680156, 2.180986, 1, 1, 1, 1, 1,
1.201088, 0.8244237, -0.05723836, 1, 1, 1, 1, 1,
1.224747, 0.107367, -1.639044, 1, 1, 1, 1, 1,
1.226541, 0.3185534, -0.6096395, 1, 1, 1, 1, 1,
1.233092, 0.09780169, 1.148704, 1, 1, 1, 1, 1,
1.240827, -1.223954, 1.863389, 1, 1, 1, 1, 1,
1.244671, 2.197656, -0.2651471, 1, 1, 1, 1, 1,
1.249826, -1.030465, 3.171064, 1, 1, 1, 1, 1,
1.250373, 1.071392, 0.6219225, 1, 1, 1, 1, 1,
1.264826, -0.8096695, 0.8560734, 1, 1, 1, 1, 1,
1.270271, -1.197212, 3.07106, 1, 1, 1, 1, 1,
1.296289, -1.725224, 2.749842, 1, 1, 1, 1, 1,
1.296402, 0.198162, 1.71208, 0, 0, 1, 1, 1,
1.306913, 0.8081424, 0.5436208, 1, 0, 0, 1, 1,
1.315224, 0.1954629, -0.6585102, 1, 0, 0, 1, 1,
1.317353, 0.2819581, 1.952577, 1, 0, 0, 1, 1,
1.318607, -1.776903, 2.250241, 1, 0, 0, 1, 1,
1.321708, -0.6439158, 3.603861, 1, 0, 0, 1, 1,
1.326546, -0.008782504, 1.85027, 0, 0, 0, 1, 1,
1.339794, 0.2382563, 2.049253, 0, 0, 0, 1, 1,
1.340087, -0.9424338, 2.879305, 0, 0, 0, 1, 1,
1.346342, 0.9829323, 0.2230914, 0, 0, 0, 1, 1,
1.350649, -0.5303817, 2.412388, 0, 0, 0, 1, 1,
1.353614, 0.05211614, 2.298664, 0, 0, 0, 1, 1,
1.354456, 0.9993327, 0.6086773, 0, 0, 0, 1, 1,
1.3558, -2.039731, 1.605466, 1, 1, 1, 1, 1,
1.356519, -1.063655, 1.444984, 1, 1, 1, 1, 1,
1.372918, -0.1139915, 1.63418, 1, 1, 1, 1, 1,
1.375636, 0.1187861, 1.093576, 1, 1, 1, 1, 1,
1.3764, 1.385758, -0.5950094, 1, 1, 1, 1, 1,
1.389668, 0.6923472, 2.725737, 1, 1, 1, 1, 1,
1.41004, -0.02623831, 2.198122, 1, 1, 1, 1, 1,
1.41164, 0.2881081, 2.167143, 1, 1, 1, 1, 1,
1.414247, -0.4131284, 1.721357, 1, 1, 1, 1, 1,
1.414888, 0.7429458, 0.07661301, 1, 1, 1, 1, 1,
1.423741, -0.4717552, 2.82926, 1, 1, 1, 1, 1,
1.43485, 1.386253, 0.8297965, 1, 1, 1, 1, 1,
1.466326, 0.517655, 1.537628, 1, 1, 1, 1, 1,
1.474357, -0.6700318, 1.501166, 1, 1, 1, 1, 1,
1.477796, -0.104491, 2.430056, 1, 1, 1, 1, 1,
1.491633, 0.3450433, 2.264941, 0, 0, 1, 1, 1,
1.496343, -0.9256513, 2.83662, 1, 0, 0, 1, 1,
1.506067, -0.7279372, 2.106031, 1, 0, 0, 1, 1,
1.509702, -0.2392228, 3.215555, 1, 0, 0, 1, 1,
1.517949, 0.5141456, 2.722673, 1, 0, 0, 1, 1,
1.522263, -0.6558174, 2.98666, 1, 0, 0, 1, 1,
1.528322, 0.02311947, 0.8546591, 0, 0, 0, 1, 1,
1.55447, -1.027513, 3.392773, 0, 0, 0, 1, 1,
1.559716, 0.572722, 1.210012, 0, 0, 0, 1, 1,
1.568626, -0.3166035, 3.597238, 0, 0, 0, 1, 1,
1.579391, 0.3945409, 0.1531761, 0, 0, 0, 1, 1,
1.579624, -1.211966, 2.68215, 0, 0, 0, 1, 1,
1.581704, -0.703584, 1.471861, 0, 0, 0, 1, 1,
1.585388, -0.09808723, 0.2589378, 1, 1, 1, 1, 1,
1.593787, -0.9744593, 2.319036, 1, 1, 1, 1, 1,
1.605719, -0.9427507, 2.457396, 1, 1, 1, 1, 1,
1.610189, -1.232265, 2.574656, 1, 1, 1, 1, 1,
1.625339, -2.794324, 1.969948, 1, 1, 1, 1, 1,
1.62873, -1.103269, 1.878481, 1, 1, 1, 1, 1,
1.629717, -0.01121508, 1.733461, 1, 1, 1, 1, 1,
1.633239, 2.162482, 1.020471, 1, 1, 1, 1, 1,
1.635115, 1.784291, 2.443439, 1, 1, 1, 1, 1,
1.641999, -0.428697, 2.176799, 1, 1, 1, 1, 1,
1.657069, -1.007266, 3.339215, 1, 1, 1, 1, 1,
1.660448, 0.6329817, 3.211006, 1, 1, 1, 1, 1,
1.664461, 1.054293, 0.4211836, 1, 1, 1, 1, 1,
1.676518, 1.12324, 0.8728174, 1, 1, 1, 1, 1,
1.676849, 0.7346398, 0.297624, 1, 1, 1, 1, 1,
1.686723, -0.8409491, 3.085077, 0, 0, 1, 1, 1,
1.691278, -0.7311376, 2.139908, 1, 0, 0, 1, 1,
1.691551, 1.584542, -0.3481774, 1, 0, 0, 1, 1,
1.693238, -0.6412909, 2.378146, 1, 0, 0, 1, 1,
1.744795, 1.394687, 0.4185378, 1, 0, 0, 1, 1,
1.75102, -0.3633035, 3.736598, 1, 0, 0, 1, 1,
1.75988, 0.07312416, 2.619836, 0, 0, 0, 1, 1,
1.772147, 0.8452011, 0.2499416, 0, 0, 0, 1, 1,
1.779596, -1.128253, 3.368563, 0, 0, 0, 1, 1,
1.788075, 0.7377893, 1.455201, 0, 0, 0, 1, 1,
1.799996, -0.8524352, 2.155401, 0, 0, 0, 1, 1,
1.802156, -0.5440102, 2.115132, 0, 0, 0, 1, 1,
1.811856, -0.9398584, 2.780523, 0, 0, 0, 1, 1,
1.819877, 0.7317884, 0.6482671, 1, 1, 1, 1, 1,
1.829096, 0.7105618, 2.669826, 1, 1, 1, 1, 1,
1.831472, -1.200631, -0.1059213, 1, 1, 1, 1, 1,
1.83593, -0.534569, 3.271835, 1, 1, 1, 1, 1,
1.859015, -0.4305165, 1.712928, 1, 1, 1, 1, 1,
1.866001, -0.6847566, 0.6851375, 1, 1, 1, 1, 1,
1.891837, -0.04170468, 2.437158, 1, 1, 1, 1, 1,
1.900409, 1.900119, 1.327879, 1, 1, 1, 1, 1,
1.916812, 0.09153319, 2.863343, 1, 1, 1, 1, 1,
1.934119, -0.4490114, 1.46165, 1, 1, 1, 1, 1,
1.949606, -0.1600197, 1.676871, 1, 1, 1, 1, 1,
1.972783, -1.16596, 3.051374, 1, 1, 1, 1, 1,
1.9866, 0.698036, 0.4591126, 1, 1, 1, 1, 1,
1.988281, -2.000163, 3.203514, 1, 1, 1, 1, 1,
2.0011, 0.8952913, 0.009606714, 1, 1, 1, 1, 1,
2.129869, -0.09977233, 1.324242, 0, 0, 1, 1, 1,
2.135936, -0.1178189, 0.7660668, 1, 0, 0, 1, 1,
2.181253, -0.2072753, 1.561396, 1, 0, 0, 1, 1,
2.219631, -0.5844354, 1.903118, 1, 0, 0, 1, 1,
2.233258, 1.224792, 0.06428709, 1, 0, 0, 1, 1,
2.256761, -0.7487586, 1.261986, 1, 0, 0, 1, 1,
2.258513, -0.944487, 1.136161, 0, 0, 0, 1, 1,
2.271496, 0.7876796, 0.3966874, 0, 0, 0, 1, 1,
2.294705, 2.009805, 0.578462, 0, 0, 0, 1, 1,
2.310757, 0.7762053, 0.2840595, 0, 0, 0, 1, 1,
2.396471, -0.5671363, 1.508885, 0, 0, 0, 1, 1,
2.600996, -0.8740123, 2.196599, 0, 0, 0, 1, 1,
2.642597, -1.774991, 2.886549, 0, 0, 0, 1, 1,
2.653481, -0.6160676, 1.37119, 1, 1, 1, 1, 1,
2.96663, 0.7434464, 0.2585959, 1, 1, 1, 1, 1,
3.00684, 1.050578, 1.934699, 1, 1, 1, 1, 1,
3.160945, 0.5693582, 2.980283, 1, 1, 1, 1, 1,
3.193149, -0.7293982, 1.346513, 1, 1, 1, 1, 1,
3.353079, -0.9902437, 0.7888404, 1, 1, 1, 1, 1,
3.379917, -0.4305243, 1.290937, 1, 1, 1, 1, 1
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
var radius = 9.864076;
var distance = 34.64715;
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
mvMatrix.translate( -0.04373407, 0.6650172, -0.1562107 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.64715);
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
