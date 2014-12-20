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
-3.051579, 0.4610471, -0.8473278, 1, 0, 0, 1,
-2.929299, -0.3900941, -1.068516, 1, 0.007843138, 0, 1,
-2.844893, 0.7876382, 0.134204, 1, 0.01176471, 0, 1,
-2.777062, -1.82118, -2.621354, 1, 0.01960784, 0, 1,
-2.755484, 0.6321235, -2.547626, 1, 0.02352941, 0, 1,
-2.663147, 0.3813824, -0.6287016, 1, 0.03137255, 0, 1,
-2.657957, 0.8799644, -1.748724, 1, 0.03529412, 0, 1,
-2.653918, -1.590232, 0.3015026, 1, 0.04313726, 0, 1,
-2.640616, 1.362487, -2.446804, 1, 0.04705882, 0, 1,
-2.635278, -0.03679327, -2.239956, 1, 0.05490196, 0, 1,
-2.58472, -0.5226339, -1.501391, 1, 0.05882353, 0, 1,
-2.512125, 0.2771797, -0.2449687, 1, 0.06666667, 0, 1,
-2.456318, -0.4945801, -1.052943, 1, 0.07058824, 0, 1,
-2.452467, -0.02795736, -0.1901315, 1, 0.07843138, 0, 1,
-2.430373, 0.3900469, -0.4854369, 1, 0.08235294, 0, 1,
-2.407419, 0.910028, -1.536713, 1, 0.09019608, 0, 1,
-2.344588, -0.1016058, -1.869634, 1, 0.09411765, 0, 1,
-2.287812, 0.8027, -0.8277031, 1, 0.1019608, 0, 1,
-2.258333, -0.1353416, -1.452487, 1, 0.1098039, 0, 1,
-2.24225, 1.542982, -0.6032467, 1, 0.1137255, 0, 1,
-2.238627, -1.845354, -1.132904, 1, 0.1215686, 0, 1,
-2.225586, 0.9691658, -1.287921, 1, 0.1254902, 0, 1,
-2.219098, -0.2291399, -2.346071, 1, 0.1333333, 0, 1,
-2.154223, -0.6313249, -1.706192, 1, 0.1372549, 0, 1,
-2.144271, 0.02340405, -1.176475, 1, 0.145098, 0, 1,
-2.142656, -1.034836, -2.250345, 1, 0.1490196, 0, 1,
-2.131593, -0.99939, -1.149641, 1, 0.1568628, 0, 1,
-1.990306, -0.523609, -1.710195, 1, 0.1607843, 0, 1,
-1.98761, -0.2156731, -0.1305404, 1, 0.1686275, 0, 1,
-1.972652, -0.7744634, -0.6868761, 1, 0.172549, 0, 1,
-1.93532, -0.5739902, -0.00251012, 1, 0.1803922, 0, 1,
-1.922447, -1.905318, -1.872865, 1, 0.1843137, 0, 1,
-1.917452, 0.4884494, -0.7723323, 1, 0.1921569, 0, 1,
-1.898988, -1.259865, -3.0908, 1, 0.1960784, 0, 1,
-1.871504, 0.477019, -2.593421, 1, 0.2039216, 0, 1,
-1.870123, -1.160443, -1.562779, 1, 0.2117647, 0, 1,
-1.828205, 1.723038, -1.368923, 1, 0.2156863, 0, 1,
-1.82708, 0.02702962, -2.768907, 1, 0.2235294, 0, 1,
-1.809822, 0.9560706, -0.8478908, 1, 0.227451, 0, 1,
-1.787844, -0.5918565, -2.628227, 1, 0.2352941, 0, 1,
-1.786916, -0.9605167, -1.254087, 1, 0.2392157, 0, 1,
-1.766574, -2.480703, -3.356125, 1, 0.2470588, 0, 1,
-1.737883, 0.0656667, -1.601208, 1, 0.2509804, 0, 1,
-1.730455, 0.5147528, -0.7842328, 1, 0.2588235, 0, 1,
-1.729278, 2.272631, -1.016391, 1, 0.2627451, 0, 1,
-1.697842, -1.014954, -0.8196203, 1, 0.2705882, 0, 1,
-1.690633, 0.7380857, -1.651687, 1, 0.2745098, 0, 1,
-1.662415, -0.9665257, -0.8830599, 1, 0.282353, 0, 1,
-1.652105, 1.235971, 1.243565, 1, 0.2862745, 0, 1,
-1.6431, -0.4556221, -1.356829, 1, 0.2941177, 0, 1,
-1.626568, -0.177264, -0.6222188, 1, 0.3019608, 0, 1,
-1.62213, -1.548422, -2.13558, 1, 0.3058824, 0, 1,
-1.61945, -0.3013564, -1.03238, 1, 0.3137255, 0, 1,
-1.616264, -0.2747481, -2.94688, 1, 0.3176471, 0, 1,
-1.61275, -0.814231, -2.326401, 1, 0.3254902, 0, 1,
-1.601026, -0.008337892, -3.700755, 1, 0.3294118, 0, 1,
-1.58531, -1.050551, -1.639709, 1, 0.3372549, 0, 1,
-1.584625, 0.9046264, -1.373652, 1, 0.3411765, 0, 1,
-1.575049, 0.508665, -0.3776562, 1, 0.3490196, 0, 1,
-1.573434, -0.3570893, -1.21376, 1, 0.3529412, 0, 1,
-1.538425, -1.037584, -2.021623, 1, 0.3607843, 0, 1,
-1.532363, -0.1944106, -2.979744, 1, 0.3647059, 0, 1,
-1.530905, 0.06466788, -1.512028, 1, 0.372549, 0, 1,
-1.514576, 1.200463, -0.647517, 1, 0.3764706, 0, 1,
-1.502999, 0.2820841, -1.827471, 1, 0.3843137, 0, 1,
-1.486595, -1.413907, -0.9326807, 1, 0.3882353, 0, 1,
-1.482655, 0.6140962, -1.275934, 1, 0.3960784, 0, 1,
-1.479083, 2.134403, -1.039494, 1, 0.4039216, 0, 1,
-1.470361, 0.7907667, -0.3183137, 1, 0.4078431, 0, 1,
-1.470338, 0.454368, -1.260631, 1, 0.4156863, 0, 1,
-1.46859, -0.1559898, -2.462162, 1, 0.4196078, 0, 1,
-1.46701, -1.048103, -3.358445, 1, 0.427451, 0, 1,
-1.456612, -0.04050842, -1.294575, 1, 0.4313726, 0, 1,
-1.456085, 0.1141541, -1.029301, 1, 0.4392157, 0, 1,
-1.450998, -0.7891686, -1.872348, 1, 0.4431373, 0, 1,
-1.450377, 0.2348928, 0.4963721, 1, 0.4509804, 0, 1,
-1.43673, 0.4296638, -0.2016295, 1, 0.454902, 0, 1,
-1.42422, 1.383895, -0.9138818, 1, 0.4627451, 0, 1,
-1.422357, -0.7493044, -2.342045, 1, 0.4666667, 0, 1,
-1.421902, 0.5498251, -1.308021, 1, 0.4745098, 0, 1,
-1.413023, 2.219942, -2.459185, 1, 0.4784314, 0, 1,
-1.403857, -0.6537166, -2.805, 1, 0.4862745, 0, 1,
-1.398902, -1.01495, -1.34989, 1, 0.4901961, 0, 1,
-1.392847, 0.143774, -1.403686, 1, 0.4980392, 0, 1,
-1.38462, -1.725857, -2.191696, 1, 0.5058824, 0, 1,
-1.37871, 0.4088154, -0.4817126, 1, 0.509804, 0, 1,
-1.374786, 2.055551, -0.865581, 1, 0.5176471, 0, 1,
-1.374314, -0.6365215, -2.179646, 1, 0.5215687, 0, 1,
-1.368894, -0.595602, -0.6228871, 1, 0.5294118, 0, 1,
-1.367458, 0.7690063, -0.8347413, 1, 0.5333334, 0, 1,
-1.365633, -0.5907221, -3.131951, 1, 0.5411765, 0, 1,
-1.348449, 0.1588445, -2.735182, 1, 0.5450981, 0, 1,
-1.343493, 0.8874374, -1.342209, 1, 0.5529412, 0, 1,
-1.343258, -0.4944254, -1.249383, 1, 0.5568628, 0, 1,
-1.343223, 1.71834, -0.4823538, 1, 0.5647059, 0, 1,
-1.341318, 0.3638112, -2.231627, 1, 0.5686275, 0, 1,
-1.338188, -0.5170242, -2.683741, 1, 0.5764706, 0, 1,
-1.327279, 0.991528, 0.6134824, 1, 0.5803922, 0, 1,
-1.321895, -0.1634732, -0.271538, 1, 0.5882353, 0, 1,
-1.319813, 0.920312, -1.476349, 1, 0.5921569, 0, 1,
-1.318257, -0.4334183, -1.932325, 1, 0.6, 0, 1,
-1.31603, 0.5576293, -0.6324886, 1, 0.6078432, 0, 1,
-1.313126, -1.758279, -3.950287, 1, 0.6117647, 0, 1,
-1.299907, -0.4406694, -1.697181, 1, 0.6196079, 0, 1,
-1.291308, -0.6571914, -1.830031, 1, 0.6235294, 0, 1,
-1.283155, -0.6076033, -2.150748, 1, 0.6313726, 0, 1,
-1.28191, 1.910585, 0.7603328, 1, 0.6352941, 0, 1,
-1.279307, -3.029776, -2.734569, 1, 0.6431373, 0, 1,
-1.269, -1.368675, -2.585409, 1, 0.6470588, 0, 1,
-1.253938, -0.2109237, -1.102433, 1, 0.654902, 0, 1,
-1.251352, 1.18346, -2.095653, 1, 0.6588235, 0, 1,
-1.251018, 0.824877, -0.8785322, 1, 0.6666667, 0, 1,
-1.245936, -0.3658681, -2.033604, 1, 0.6705883, 0, 1,
-1.241973, 0.5318779, -2.445911, 1, 0.6784314, 0, 1,
-1.231145, -0.4525387, -1.576902, 1, 0.682353, 0, 1,
-1.226069, -0.2209098, -1.878198, 1, 0.6901961, 0, 1,
-1.210077, -1.074944, -2.547616, 1, 0.6941177, 0, 1,
-1.209811, 1.199175, 1.309988, 1, 0.7019608, 0, 1,
-1.208987, -1.735095, -1.66469, 1, 0.7098039, 0, 1,
-1.200304, -1.462144, -1.853287, 1, 0.7137255, 0, 1,
-1.197989, 0.8390003, -1.032688, 1, 0.7215686, 0, 1,
-1.197057, 1.346159, 0.8151684, 1, 0.7254902, 0, 1,
-1.181917, 0.9155104, -0.4309061, 1, 0.7333333, 0, 1,
-1.179648, 0.9739899, -0.9112757, 1, 0.7372549, 0, 1,
-1.175193, 1.080747, -1.225754, 1, 0.7450981, 0, 1,
-1.167537, -0.4625082, -3.463992, 1, 0.7490196, 0, 1,
-1.163952, 0.2188877, -2.083872, 1, 0.7568628, 0, 1,
-1.155725, 0.748831, -1.154499, 1, 0.7607843, 0, 1,
-1.139088, 0.7101136, -0.3358085, 1, 0.7686275, 0, 1,
-1.13513, -0.03407012, -4.456046, 1, 0.772549, 0, 1,
-1.132032, -0.9390998, -1.937804, 1, 0.7803922, 0, 1,
-1.128945, 0.5395395, -2.300734, 1, 0.7843137, 0, 1,
-1.124917, -1.377182, -2.307832, 1, 0.7921569, 0, 1,
-1.112874, -0.2006596, -2.13758, 1, 0.7960784, 0, 1,
-1.107743, 0.08160214, -2.393778, 1, 0.8039216, 0, 1,
-1.104428, -1.179466, -1.990351, 1, 0.8117647, 0, 1,
-1.100916, -0.979757, -1.399763, 1, 0.8156863, 0, 1,
-1.100076, 0.6158069, -2.219115, 1, 0.8235294, 0, 1,
-1.092774, -1.532487, -2.866136, 1, 0.827451, 0, 1,
-1.072875, 1.963442, 0.104153, 1, 0.8352941, 0, 1,
-1.072757, -0.1706444, -2.724034, 1, 0.8392157, 0, 1,
-1.066122, 1.041037, -0.08163613, 1, 0.8470588, 0, 1,
-1.064229, 0.9790685, -2.316413, 1, 0.8509804, 0, 1,
-1.053608, 1.281671, -1.23273, 1, 0.8588235, 0, 1,
-1.020591, 2.005728, -0.2864281, 1, 0.8627451, 0, 1,
-1.012893, 0.4840597, -1.519793, 1, 0.8705882, 0, 1,
-1.009304, -0.3155135, -1.59017, 1, 0.8745098, 0, 1,
-1.00761, 0.4650577, -2.731086, 1, 0.8823529, 0, 1,
-1.00672, -0.8191819, -1.37301, 1, 0.8862745, 0, 1,
-1.004325, 0.02523175, -1.683621, 1, 0.8941177, 0, 1,
-0.9972525, -0.4647965, -1.708169, 1, 0.8980392, 0, 1,
-0.9895047, -2.152105, -3.790083, 1, 0.9058824, 0, 1,
-0.9888338, -0.2862518, -3.026059, 1, 0.9137255, 0, 1,
-0.9828461, -1.786696, -3.279544, 1, 0.9176471, 0, 1,
-0.9817571, -0.6225426, -1.359063, 1, 0.9254902, 0, 1,
-0.980909, -1.40702, -2.175187, 1, 0.9294118, 0, 1,
-0.9722247, 1.578496, 1.148188, 1, 0.9372549, 0, 1,
-0.9719243, 0.5069114, -1.15165, 1, 0.9411765, 0, 1,
-0.9709415, -1.17503, -2.091211, 1, 0.9490196, 0, 1,
-0.9676666, -0.6622561, -3.878402, 1, 0.9529412, 0, 1,
-0.9618699, 1.107202, -0.935343, 1, 0.9607843, 0, 1,
-0.9589506, 1.18574, -1.382033, 1, 0.9647059, 0, 1,
-0.9576647, -1.187486, -2.89119, 1, 0.972549, 0, 1,
-0.9562355, -0.9214715, -3.176819, 1, 0.9764706, 0, 1,
-0.955983, 0.3925729, -2.164043, 1, 0.9843137, 0, 1,
-0.9549835, -0.4947456, -2.844862, 1, 0.9882353, 0, 1,
-0.9542804, 0.143172, -3.80518, 1, 0.9960784, 0, 1,
-0.9484183, 0.4043032, -1.399452, 0.9960784, 1, 0, 1,
-0.938214, -0.4810119, -3.607644, 0.9921569, 1, 0, 1,
-0.9324307, 2.261422, -0.2893934, 0.9843137, 1, 0, 1,
-0.9321767, -1.051687, -3.471225, 0.9803922, 1, 0, 1,
-0.9304219, -0.1406052, -0.831562, 0.972549, 1, 0, 1,
-0.930067, -2.730363, -2.564445, 0.9686275, 1, 0, 1,
-0.9282519, 0.1763764, -2.222998, 0.9607843, 1, 0, 1,
-0.9275746, -1.417432, -2.567441, 0.9568627, 1, 0, 1,
-0.9271556, 0.4593212, 0.04783052, 0.9490196, 1, 0, 1,
-0.9195977, -0.8058215, -2.184532, 0.945098, 1, 0, 1,
-0.9185608, -0.02808717, -1.997713, 0.9372549, 1, 0, 1,
-0.915422, 0.7850983, -1.911787, 0.9333333, 1, 0, 1,
-0.9142691, -1.345721, -2.20465, 0.9254902, 1, 0, 1,
-0.9122102, 0.8351848, -1.577578, 0.9215686, 1, 0, 1,
-0.9117292, 0.8872098, 0.359327, 0.9137255, 1, 0, 1,
-0.911393, 0.02241305, -1.136305, 0.9098039, 1, 0, 1,
-0.9072191, -0.5810147, -4.374482, 0.9019608, 1, 0, 1,
-0.9071871, 0.9276295, 0.2883663, 0.8941177, 1, 0, 1,
-0.9040608, 0.5666432, -0.1250908, 0.8901961, 1, 0, 1,
-0.9022641, -0.7556164, -1.323816, 0.8823529, 1, 0, 1,
-0.8908286, 0.5143012, -1.984681, 0.8784314, 1, 0, 1,
-0.887728, 0.9445532, -0.3689676, 0.8705882, 1, 0, 1,
-0.8862983, 0.1389756, -1.721794, 0.8666667, 1, 0, 1,
-0.8845926, 0.8376877, -0.4376222, 0.8588235, 1, 0, 1,
-0.8844739, -0.8943225, -1.632684, 0.854902, 1, 0, 1,
-0.8838503, 1.229627, 0.3951444, 0.8470588, 1, 0, 1,
-0.8764721, -1.296876, -2.518157, 0.8431373, 1, 0, 1,
-0.8680972, -1.255826, -1.351611, 0.8352941, 1, 0, 1,
-0.8674003, -0.2016218, 0.6454762, 0.8313726, 1, 0, 1,
-0.8611005, 0.7804127, 0.6309292, 0.8235294, 1, 0, 1,
-0.8603894, 0.8778036, 0.1030301, 0.8196079, 1, 0, 1,
-0.8556452, -0.7746059, -2.440898, 0.8117647, 1, 0, 1,
-0.8384888, 0.3206338, 0.192662, 0.8078431, 1, 0, 1,
-0.8351191, -1.175088, -2.678081, 0.8, 1, 0, 1,
-0.8284676, 1.136861, -0.2621417, 0.7921569, 1, 0, 1,
-0.8266343, 0.9158534, -0.9461613, 0.7882353, 1, 0, 1,
-0.8262593, 0.1402643, -2.653245, 0.7803922, 1, 0, 1,
-0.8241314, 1.240906, -1.64237, 0.7764706, 1, 0, 1,
-0.8191912, 0.8820841, -1.931836, 0.7686275, 1, 0, 1,
-0.81656, -0.05079916, -1.782923, 0.7647059, 1, 0, 1,
-0.8157015, -0.1375167, -0.2508379, 0.7568628, 1, 0, 1,
-0.8141479, 0.3248411, -2.053685, 0.7529412, 1, 0, 1,
-0.8048933, -0.1262263, -3.175652, 0.7450981, 1, 0, 1,
-0.8045178, -0.497907, -1.84685, 0.7411765, 1, 0, 1,
-0.7968056, 0.9502022, -1.087764, 0.7333333, 1, 0, 1,
-0.7948919, 0.1917918, -1.280746, 0.7294118, 1, 0, 1,
-0.7919191, 0.7445745, -2.02085, 0.7215686, 1, 0, 1,
-0.7907069, -1.368891, -4.139598, 0.7176471, 1, 0, 1,
-0.7903087, 1.426284, -1.015884, 0.7098039, 1, 0, 1,
-0.7888016, -0.8712917, -2.139019, 0.7058824, 1, 0, 1,
-0.7874722, 0.669766, -0.8426461, 0.6980392, 1, 0, 1,
-0.781187, 0.280724, -1.237178, 0.6901961, 1, 0, 1,
-0.7752669, -0.788256, -3.944771, 0.6862745, 1, 0, 1,
-0.7704102, 1.5226, -1.573971, 0.6784314, 1, 0, 1,
-0.7613949, -1.362124, -2.560104, 0.6745098, 1, 0, 1,
-0.7453991, 1.048908, 0.4236088, 0.6666667, 1, 0, 1,
-0.7396137, 0.7093752, 0.6410788, 0.6627451, 1, 0, 1,
-0.7284985, 1.22268, -0.6591544, 0.654902, 1, 0, 1,
-0.7150165, 1.562036, -1.981376, 0.6509804, 1, 0, 1,
-0.7079203, 1.178164, -0.9560828, 0.6431373, 1, 0, 1,
-0.7041701, 1.180312, 0.5355614, 0.6392157, 1, 0, 1,
-0.7040327, -0.470255, -1.329773, 0.6313726, 1, 0, 1,
-0.7028928, 1.150314, -0.7034007, 0.627451, 1, 0, 1,
-0.6996672, -0.4947601, -1.699981, 0.6196079, 1, 0, 1,
-0.6972095, -0.518223, -2.768618, 0.6156863, 1, 0, 1,
-0.6938013, -0.7705609, -0.8827354, 0.6078432, 1, 0, 1,
-0.6931612, 0.8660788, 1.149706, 0.6039216, 1, 0, 1,
-0.6891122, -2.241341, -3.48472, 0.5960785, 1, 0, 1,
-0.6850587, 0.2710615, -2.484627, 0.5882353, 1, 0, 1,
-0.6820387, 1.566109, 0.629559, 0.5843138, 1, 0, 1,
-0.6795816, 0.3785658, -0.841631, 0.5764706, 1, 0, 1,
-0.6781409, -0.3167351, -0.247879, 0.572549, 1, 0, 1,
-0.6774616, -0.8762966, -4.330209, 0.5647059, 1, 0, 1,
-0.6752852, 0.09579092, -0.8417993, 0.5607843, 1, 0, 1,
-0.6723627, 0.1173141, -1.546973, 0.5529412, 1, 0, 1,
-0.6685743, 0.9177773, -1.012479, 0.5490196, 1, 0, 1,
-0.6674231, 0.5078434, -0.8447944, 0.5411765, 1, 0, 1,
-0.665051, 0.0624863, -2.099338, 0.5372549, 1, 0, 1,
-0.6565285, -1.313672, -3.934133, 0.5294118, 1, 0, 1,
-0.654147, 1.18415, -2.085507, 0.5254902, 1, 0, 1,
-0.6518493, 0.5365652, -2.545411, 0.5176471, 1, 0, 1,
-0.6487304, 0.06396136, -3.600533, 0.5137255, 1, 0, 1,
-0.6427653, -1.149035, -3.02376, 0.5058824, 1, 0, 1,
-0.6417668, -0.2937979, -1.187688, 0.5019608, 1, 0, 1,
-0.6400282, -1.442558, -3.05664, 0.4941176, 1, 0, 1,
-0.6387162, -0.9079348, -1.469527, 0.4862745, 1, 0, 1,
-0.6289075, 0.7680502, -0.3387906, 0.4823529, 1, 0, 1,
-0.6246096, 0.9515635, -0.6480028, 0.4745098, 1, 0, 1,
-0.6212124, 1.040856, 0.5471187, 0.4705882, 1, 0, 1,
-0.6209975, -1.196308, -3.938178, 0.4627451, 1, 0, 1,
-0.6198311, 0.1293001, -2.025184, 0.4588235, 1, 0, 1,
-0.6190981, 1.237704, -2.342773, 0.4509804, 1, 0, 1,
-0.6078171, -0.6335378, -2.274678, 0.4470588, 1, 0, 1,
-0.6003987, 0.2564689, -2.124509, 0.4392157, 1, 0, 1,
-0.5978557, 0.6787006, -0.6047711, 0.4352941, 1, 0, 1,
-0.5904251, -0.1213367, -1.41477, 0.427451, 1, 0, 1,
-0.5901197, -1.562589, -3.648717, 0.4235294, 1, 0, 1,
-0.5861632, 0.5321444, -1.982783, 0.4156863, 1, 0, 1,
-0.5814334, 2.552629, -1.416611, 0.4117647, 1, 0, 1,
-0.5800099, 1.513462, -0.7218917, 0.4039216, 1, 0, 1,
-0.579829, -1.360992, -2.835825, 0.3960784, 1, 0, 1,
-0.5753953, -0.9510947, -1.986065, 0.3921569, 1, 0, 1,
-0.5661099, -0.1658958, -1.841474, 0.3843137, 1, 0, 1,
-0.5630408, 0.008061084, 0.4048278, 0.3803922, 1, 0, 1,
-0.5618847, 0.2370955, -3.786997, 0.372549, 1, 0, 1,
-0.560422, 2.282521, 0.3139582, 0.3686275, 1, 0, 1,
-0.5585545, 0.8747376, 0.8357484, 0.3607843, 1, 0, 1,
-0.5547605, 0.8699695, 1.225028, 0.3568628, 1, 0, 1,
-0.5494406, 0.6957669, -0.9512696, 0.3490196, 1, 0, 1,
-0.5479181, -2.075903, -2.620841, 0.345098, 1, 0, 1,
-0.5477806, 0.2216375, -0.8638799, 0.3372549, 1, 0, 1,
-0.5435023, -0.05831584, -2.456382, 0.3333333, 1, 0, 1,
-0.5342759, -1.872663, -2.492786, 0.3254902, 1, 0, 1,
-0.5213873, 1.409883, -1.999837, 0.3215686, 1, 0, 1,
-0.5165207, -1.503907, -2.610965, 0.3137255, 1, 0, 1,
-0.5132349, 1.112624, -0.7487667, 0.3098039, 1, 0, 1,
-0.5092106, 1.267761, -0.1818907, 0.3019608, 1, 0, 1,
-0.5084613, 0.689477, -0.4314359, 0.2941177, 1, 0, 1,
-0.5078722, -0.5294176, -1.969416, 0.2901961, 1, 0, 1,
-0.5071627, -1.049424, -4.65136, 0.282353, 1, 0, 1,
-0.5038673, 0.2690667, -0.8355791, 0.2784314, 1, 0, 1,
-0.5029897, -0.2973309, -1.012436, 0.2705882, 1, 0, 1,
-0.5021737, -0.7196555, -1.890993, 0.2666667, 1, 0, 1,
-0.5011798, -0.2670153, -0.6015774, 0.2588235, 1, 0, 1,
-0.5004282, 0.7720577, -2.505781, 0.254902, 1, 0, 1,
-0.4996186, 2.751659, -0.7371046, 0.2470588, 1, 0, 1,
-0.4988887, 0.3211775, -1.494864, 0.2431373, 1, 0, 1,
-0.496804, -0.9709667, -3.138379, 0.2352941, 1, 0, 1,
-0.4965814, 0.3071312, -1.958376, 0.2313726, 1, 0, 1,
-0.4902357, 0.02921298, -1.966598, 0.2235294, 1, 0, 1,
-0.487978, -1.483813, -0.7393165, 0.2196078, 1, 0, 1,
-0.4853583, -0.2343757, -2.837357, 0.2117647, 1, 0, 1,
-0.4824317, 0.3176213, -1.708118, 0.2078431, 1, 0, 1,
-0.4794509, -0.3840452, -2.50319, 0.2, 1, 0, 1,
-0.4793536, 1.32046, -1.218051, 0.1921569, 1, 0, 1,
-0.4773717, -0.8883961, -3.100357, 0.1882353, 1, 0, 1,
-0.4755293, -1.314354, -1.263718, 0.1803922, 1, 0, 1,
-0.4753547, 0.8992611, -0.6757787, 0.1764706, 1, 0, 1,
-0.4753498, -1.742095, -2.229858, 0.1686275, 1, 0, 1,
-0.4752312, 0.6940646, -0.6202828, 0.1647059, 1, 0, 1,
-0.4743466, -0.4921203, -2.228634, 0.1568628, 1, 0, 1,
-0.4693889, 0.8132645, 1.356531, 0.1529412, 1, 0, 1,
-0.4672646, -0.06221076, -0.8736033, 0.145098, 1, 0, 1,
-0.4667466, 0.544961, 0.1537163, 0.1411765, 1, 0, 1,
-0.463651, 0.1698488, -1.602393, 0.1333333, 1, 0, 1,
-0.4626279, -0.01810403, -1.791993, 0.1294118, 1, 0, 1,
-0.4572519, -2.02385, -2.896869, 0.1215686, 1, 0, 1,
-0.4556067, -0.1666535, -1.983565, 0.1176471, 1, 0, 1,
-0.4546647, -1.623622, -1.603153, 0.1098039, 1, 0, 1,
-0.4544322, 2.151099, 1.573852, 0.1058824, 1, 0, 1,
-0.4523093, -0.299905, -1.489255, 0.09803922, 1, 0, 1,
-0.4515437, -1.488198, -3.068685, 0.09019608, 1, 0, 1,
-0.4509716, 1.382181, -0.9081333, 0.08627451, 1, 0, 1,
-0.4499454, -1.0235, -3.031847, 0.07843138, 1, 0, 1,
-0.4465329, 1.718773, 1.013466, 0.07450981, 1, 0, 1,
-0.4462055, -0.4826007, -1.84606, 0.06666667, 1, 0, 1,
-0.4456016, 1.679925, -1.863429, 0.0627451, 1, 0, 1,
-0.4431477, 0.1270048, -1.568671, 0.05490196, 1, 0, 1,
-0.4357255, -1.266596, -2.048043, 0.05098039, 1, 0, 1,
-0.4351022, -0.47289, -3.308406, 0.04313726, 1, 0, 1,
-0.4329294, -0.4124607, -3.803219, 0.03921569, 1, 0, 1,
-0.4295162, -2.001693, -3.745001, 0.03137255, 1, 0, 1,
-0.4288632, 1.347226, 0.7561175, 0.02745098, 1, 0, 1,
-0.4284686, -0.1340786, -3.214861, 0.01960784, 1, 0, 1,
-0.4266158, -3.10744, -3.999278, 0.01568628, 1, 0, 1,
-0.4262187, -0.6047671, -0.9126424, 0.007843138, 1, 0, 1,
-0.4261118, -0.2167986, -1.845302, 0.003921569, 1, 0, 1,
-0.4233429, -0.007614886, -2.074206, 0, 1, 0.003921569, 1,
-0.4230788, -0.1283752, -1.585976, 0, 1, 0.01176471, 1,
-0.4220963, 1.419854, -0.09854376, 0, 1, 0.01568628, 1,
-0.4128354, 2.040769, 0.7975289, 0, 1, 0.02352941, 1,
-0.4127264, -1.870234, -2.808383, 0, 1, 0.02745098, 1,
-0.4117123, -0.8580958, -2.870133, 0, 1, 0.03529412, 1,
-0.4113831, 1.23226, -0.3337989, 0, 1, 0.03921569, 1,
-0.4102712, -0.944736, -2.417181, 0, 1, 0.04705882, 1,
-0.4100304, -0.6666997, -2.301051, 0, 1, 0.05098039, 1,
-0.4086607, 1.344118, -0.7810502, 0, 1, 0.05882353, 1,
-0.4066122, 0.358173, -2.143599, 0, 1, 0.0627451, 1,
-0.4015063, 0.2505706, -1.187253, 0, 1, 0.07058824, 1,
-0.4009014, -0.8824373, -3.421606, 0, 1, 0.07450981, 1,
-0.3983185, -0.476395, -2.923303, 0, 1, 0.08235294, 1,
-0.3973962, -2.560954, -2.034675, 0, 1, 0.08627451, 1,
-0.3973667, -1.98465, -1.77852, 0, 1, 0.09411765, 1,
-0.3966795, -0.22904, -2.532605, 0, 1, 0.1019608, 1,
-0.3932248, -0.4964685, -2.965097, 0, 1, 0.1058824, 1,
-0.3926646, 1.148513, -0.697534, 0, 1, 0.1137255, 1,
-0.3919826, -0.4386027, -2.173401, 0, 1, 0.1176471, 1,
-0.3915549, -0.4661956, -1.683792, 0, 1, 0.1254902, 1,
-0.3911051, 0.6694584, -1.433153, 0, 1, 0.1294118, 1,
-0.3910425, 0.4861675, -1.273075, 0, 1, 0.1372549, 1,
-0.3902798, 0.5505396, 0.3544847, 0, 1, 0.1411765, 1,
-0.3899199, 0.7302793, -1.257018, 0, 1, 0.1490196, 1,
-0.3739173, -1.316671, -2.76302, 0, 1, 0.1529412, 1,
-0.3699485, 0.7470599, -0.2710853, 0, 1, 0.1607843, 1,
-0.369052, -2.094457, -3.990167, 0, 1, 0.1647059, 1,
-0.3601956, 0.6740779, -0.7795648, 0, 1, 0.172549, 1,
-0.3581137, -0.8676773, -2.469031, 0, 1, 0.1764706, 1,
-0.3553489, 2.48058, 0.06021013, 0, 1, 0.1843137, 1,
-0.3488663, 0.3916214, -1.255327, 0, 1, 0.1882353, 1,
-0.3433782, 0.412623, -0.8161952, 0, 1, 0.1960784, 1,
-0.3433586, -0.08963796, -1.237109, 0, 1, 0.2039216, 1,
-0.3412962, -1.157928, -2.409942, 0, 1, 0.2078431, 1,
-0.3388937, 1.099958, 2.808527, 0, 1, 0.2156863, 1,
-0.3369513, 0.8291256, 0.3571233, 0, 1, 0.2196078, 1,
-0.3369247, -0.7630485, -1.883798, 0, 1, 0.227451, 1,
-0.3343775, 0.4503906, -1.294228, 0, 1, 0.2313726, 1,
-0.3332917, 0.3479738, -0.1469982, 0, 1, 0.2392157, 1,
-0.3304346, 0.3974713, -1.011055, 0, 1, 0.2431373, 1,
-0.3290955, 1.210072, 1.118993, 0, 1, 0.2509804, 1,
-0.3251355, -1.261644, -2.121323, 0, 1, 0.254902, 1,
-0.3192818, 0.3128235, -0.03965781, 0, 1, 0.2627451, 1,
-0.3184849, 0.380144, -1.228838, 0, 1, 0.2666667, 1,
-0.317648, -1.398751, -1.533886, 0, 1, 0.2745098, 1,
-0.3152893, -0.5329988, -1.53481, 0, 1, 0.2784314, 1,
-0.3110312, -0.7723063, -1.010112, 0, 1, 0.2862745, 1,
-0.3100552, -0.2206686, -4.96948, 0, 1, 0.2901961, 1,
-0.3095051, 0.7165378, -0.2685367, 0, 1, 0.2980392, 1,
-0.3071888, -1.098656, -1.681653, 0, 1, 0.3058824, 1,
-0.3060096, 0.6773699, -0.02689635, 0, 1, 0.3098039, 1,
-0.3044429, -0.05545817, -2.004575, 0, 1, 0.3176471, 1,
-0.303799, -0.9994525, -3.171444, 0, 1, 0.3215686, 1,
-0.3036028, 0.8205448, 0.6335792, 0, 1, 0.3294118, 1,
-0.303181, -0.8828046, -2.341479, 0, 1, 0.3333333, 1,
-0.2983281, 1.293247, -0.130328, 0, 1, 0.3411765, 1,
-0.2899513, -1.195127, -1.550175, 0, 1, 0.345098, 1,
-0.2895917, -0.7529877, -3.072655, 0, 1, 0.3529412, 1,
-0.2887985, -1.649275, -2.343465, 0, 1, 0.3568628, 1,
-0.2887343, -0.9248668, -4.774082, 0, 1, 0.3647059, 1,
-0.2865368, 1.191035, -0.2794202, 0, 1, 0.3686275, 1,
-0.2853524, -0.9807987, -2.521428, 0, 1, 0.3764706, 1,
-0.2845658, 0.05046397, -1.967584, 0, 1, 0.3803922, 1,
-0.2815252, -1.89771, -2.846951, 0, 1, 0.3882353, 1,
-0.2796801, 0.3442036, -0.07293171, 0, 1, 0.3921569, 1,
-0.2790917, -1.163434, -2.998297, 0, 1, 0.4, 1,
-0.2740155, -0.492288, -3.385874, 0, 1, 0.4078431, 1,
-0.271742, 0.1780659, -2.225407, 0, 1, 0.4117647, 1,
-0.2711096, 0.3689292, -1.251383, 0, 1, 0.4196078, 1,
-0.2704362, -0.009811243, -0.2471521, 0, 1, 0.4235294, 1,
-0.2701223, 0.02480507, 1.229939, 0, 1, 0.4313726, 1,
-0.2603271, 0.2757618, -0.1387378, 0, 1, 0.4352941, 1,
-0.2591923, 0.9879425, -0.436953, 0, 1, 0.4431373, 1,
-0.2579409, 0.152176, -1.181217, 0, 1, 0.4470588, 1,
-0.2572391, -1.18179, -2.261508, 0, 1, 0.454902, 1,
-0.2551165, -2.056714, -3.229836, 0, 1, 0.4588235, 1,
-0.2543986, -0.02419484, -2.064927, 0, 1, 0.4666667, 1,
-0.2529396, -1.410747, -3.499703, 0, 1, 0.4705882, 1,
-0.2515725, -1.033465, -2.846511, 0, 1, 0.4784314, 1,
-0.2496349, 0.686992, 1.13752, 0, 1, 0.4823529, 1,
-0.2443943, 0.8962145, 0.1250906, 0, 1, 0.4901961, 1,
-0.2434936, 0.3346458, -0.3029517, 0, 1, 0.4941176, 1,
-0.242026, -1.499081, -2.644974, 0, 1, 0.5019608, 1,
-0.242, 0.9915749, -0.2178918, 0, 1, 0.509804, 1,
-0.2407636, 1.344032, -0.4007767, 0, 1, 0.5137255, 1,
-0.2399249, -0.1830354, -2.447739, 0, 1, 0.5215687, 1,
-0.2385395, -1.22375, -1.750277, 0, 1, 0.5254902, 1,
-0.2365729, -0.3279235, -1.71105, 0, 1, 0.5333334, 1,
-0.2345063, -0.5292406, -3.133542, 0, 1, 0.5372549, 1,
-0.2331404, -0.366294, -3.145434, 0, 1, 0.5450981, 1,
-0.231815, -0.3438737, -1.598568, 0, 1, 0.5490196, 1,
-0.2315387, -0.6892492, -3.931202, 0, 1, 0.5568628, 1,
-0.2211958, -0.1609323, -2.395326, 0, 1, 0.5607843, 1,
-0.2211173, 0.95972, 1.260247, 0, 1, 0.5686275, 1,
-0.2186042, -0.4682117, -3.560833, 0, 1, 0.572549, 1,
-0.2179787, 1.13284, 1.022732, 0, 1, 0.5803922, 1,
-0.2152721, 0.1379952, 1.096174, 0, 1, 0.5843138, 1,
-0.2112176, 0.6203661, 2.004413, 0, 1, 0.5921569, 1,
-0.2061217, -1.478353, -2.909473, 0, 1, 0.5960785, 1,
-0.2051131, -0.6386932, -3.30649, 0, 1, 0.6039216, 1,
-0.2040498, 0.8154969, 1.269058, 0, 1, 0.6117647, 1,
-0.2032732, 0.1580649, -1.270974, 0, 1, 0.6156863, 1,
-0.1975269, -0.1062151, 0.08168519, 0, 1, 0.6235294, 1,
-0.1899901, 1.167981, 0.4520425, 0, 1, 0.627451, 1,
-0.189768, 0.8760126, 0.214155, 0, 1, 0.6352941, 1,
-0.1869501, 0.8983951, -1.896653, 0, 1, 0.6392157, 1,
-0.1855746, 0.2052893, -1.521005, 0, 1, 0.6470588, 1,
-0.1840801, 1.517875, 0.4611641, 0, 1, 0.6509804, 1,
-0.1802617, 0.373501, -1.238319, 0, 1, 0.6588235, 1,
-0.1773217, -0.8196276, -2.701881, 0, 1, 0.6627451, 1,
-0.171908, 0.3439066, -0.05746764, 0, 1, 0.6705883, 1,
-0.1701009, -0.5832499, -1.895507, 0, 1, 0.6745098, 1,
-0.1680181, 0.78061, -2.758646, 0, 1, 0.682353, 1,
-0.166401, -0.1249919, -1.093604, 0, 1, 0.6862745, 1,
-0.1647955, 1.165908, 0.4723568, 0, 1, 0.6941177, 1,
-0.1624918, -1.027715, -1.746087, 0, 1, 0.7019608, 1,
-0.1614453, -1.095095, -2.165805, 0, 1, 0.7058824, 1,
-0.1608378, -0.2094955, -2.647829, 0, 1, 0.7137255, 1,
-0.1558696, -0.6126786, -1.797529, 0, 1, 0.7176471, 1,
-0.1445088, 1.909321, 0.0802108, 0, 1, 0.7254902, 1,
-0.1443398, -0.5756471, -4.326123, 0, 1, 0.7294118, 1,
-0.1425872, 0.7197801, -1.361802, 0, 1, 0.7372549, 1,
-0.1342033, 0.2534553, 0.156747, 0, 1, 0.7411765, 1,
-0.1326707, 0.306084, 0.7958387, 0, 1, 0.7490196, 1,
-0.1231677, -0.3431723, -2.803448, 0, 1, 0.7529412, 1,
-0.1224857, -0.2313628, -2.767545, 0, 1, 0.7607843, 1,
-0.121543, -0.1448219, -1.782867, 0, 1, 0.7647059, 1,
-0.1210407, -0.2813069, -3.626075, 0, 1, 0.772549, 1,
-0.1205819, -1.247285, -1.256928, 0, 1, 0.7764706, 1,
-0.1198492, 0.09476815, -1.648311, 0, 1, 0.7843137, 1,
-0.1178332, -0.6637054, -4.469541, 0, 1, 0.7882353, 1,
-0.1156354, 1.793357, -0.8385468, 0, 1, 0.7960784, 1,
-0.1151942, -0.2187143, -3.182971, 0, 1, 0.8039216, 1,
-0.1132429, 0.08252265, -0.2645679, 0, 1, 0.8078431, 1,
-0.1131131, 1.881868, 0.4153191, 0, 1, 0.8156863, 1,
-0.1123476, -3.605213, -3.52628, 0, 1, 0.8196079, 1,
-0.1109191, -0.9958848, -3.962682, 0, 1, 0.827451, 1,
-0.1088, -0.5220809, -2.159421, 0, 1, 0.8313726, 1,
-0.1074136, -0.3098542, -1.74439, 0, 1, 0.8392157, 1,
-0.1062951, -0.9462337, -4.236641, 0, 1, 0.8431373, 1,
-0.1057327, 2.139903, -0.1491212, 0, 1, 0.8509804, 1,
-0.1053415, -0.3217608, -2.263951, 0, 1, 0.854902, 1,
-0.1027323, 1.136062, -0.3903378, 0, 1, 0.8627451, 1,
-0.1009698, -0.3355118, -3.791538, 0, 1, 0.8666667, 1,
-0.1006565, 0.3016175, 1.070766, 0, 1, 0.8745098, 1,
-0.1003053, 0.2280626, 0.3797239, 0, 1, 0.8784314, 1,
-0.0993234, -1.140617, -1.239126, 0, 1, 0.8862745, 1,
-0.09858189, 0.3716473, -1.019881, 0, 1, 0.8901961, 1,
-0.09292166, 0.5789715, -1.768787, 0, 1, 0.8980392, 1,
-0.09193784, 0.4487207, 1.344344, 0, 1, 0.9058824, 1,
-0.0918747, 0.1890634, -0.8229452, 0, 1, 0.9098039, 1,
-0.09079859, -0.6502504, -4.748127, 0, 1, 0.9176471, 1,
-0.09077746, 0.5261651, 0.9632207, 0, 1, 0.9215686, 1,
-0.08858349, -0.470614, -3.664664, 0, 1, 0.9294118, 1,
-0.08673257, 0.2630091, -1.206356, 0, 1, 0.9333333, 1,
-0.08012954, -0.2965001, -3.178972, 0, 1, 0.9411765, 1,
-0.07919443, -1.423446, -3.13457, 0, 1, 0.945098, 1,
-0.0765368, -0.8396157, -2.088145, 0, 1, 0.9529412, 1,
-0.07532492, -0.527216, -1.157889, 0, 1, 0.9568627, 1,
-0.06661763, 1.413606, 1.167398, 0, 1, 0.9647059, 1,
-0.06440173, -0.3069402, -3.18035, 0, 1, 0.9686275, 1,
-0.05670947, 0.3700243, 0.7263098, 0, 1, 0.9764706, 1,
-0.05646077, 0.3607479, -0.1256046, 0, 1, 0.9803922, 1,
-0.05467288, 0.2323225, -1.64931, 0, 1, 0.9882353, 1,
-0.05458232, -0.5345061, -4.244387, 0, 1, 0.9921569, 1,
-0.05363491, 0.001521221, -1.052982, 0, 1, 1, 1,
-0.04833972, -0.9072905, -4.670931, 0, 0.9921569, 1, 1,
-0.04690384, 0.8967924, -0.6256924, 0, 0.9882353, 1, 1,
-0.04611645, -1.777063, -2.19739, 0, 0.9803922, 1, 1,
-0.04585625, 0.3237047, 0.8092806, 0, 0.9764706, 1, 1,
-0.04579005, 0.9747605, -0.7570572, 0, 0.9686275, 1, 1,
-0.03995487, 0.4713835, -0.2415985, 0, 0.9647059, 1, 1,
-0.03866047, -0.01015605, -0.7492189, 0, 0.9568627, 1, 1,
-0.03731928, 0.2123531, 0.4019688, 0, 0.9529412, 1, 1,
-0.032838, -1.17384, -2.556503, 0, 0.945098, 1, 1,
-0.02936099, -1.563244, -3.410136, 0, 0.9411765, 1, 1,
-0.02426265, 0.284179, -0.5251042, 0, 0.9333333, 1, 1,
-0.0241421, 0.7060366, 0.007353991, 0, 0.9294118, 1, 1,
-0.02222507, 0.8354355, 0.8041436, 0, 0.9215686, 1, 1,
-0.01620163, -0.7498168, -2.820376, 0, 0.9176471, 1, 1,
-0.01540783, 1.252157, -0.7064697, 0, 0.9098039, 1, 1,
-0.01056705, -0.2550253, -3.086465, 0, 0.9058824, 1, 1,
-0.00723875, -2.441492, -3.019495, 0, 0.8980392, 1, 1,
-0.006740769, -0.6567411, -4.848261, 0, 0.8901961, 1, 1,
-0.006303301, 0.68113, 1.030033, 0, 0.8862745, 1, 1,
-0.005168656, 0.5680907, 1.114016, 0, 0.8784314, 1, 1,
0.002153499, 0.007269276, -1.520226, 0, 0.8745098, 1, 1,
0.007052192, -0.2441477, 3.994037, 0, 0.8666667, 1, 1,
0.008021981, -0.2703004, 2.731274, 0, 0.8627451, 1, 1,
0.01107627, 0.3564417, -0.2135377, 0, 0.854902, 1, 1,
0.01151146, -0.5164807, 3.772273, 0, 0.8509804, 1, 1,
0.01363618, -0.07013138, 3.790079, 0, 0.8431373, 1, 1,
0.01446871, 0.03113486, -0.60427, 0, 0.8392157, 1, 1,
0.01480304, 0.8907923, -1.254641, 0, 0.8313726, 1, 1,
0.01514762, -0.4108574, 3.303053, 0, 0.827451, 1, 1,
0.02464445, -1.683727, 2.397496, 0, 0.8196079, 1, 1,
0.02650387, -0.08768591, 1.344853, 0, 0.8156863, 1, 1,
0.02919469, -1.438922, 3.552991, 0, 0.8078431, 1, 1,
0.03112, -1.960024, 4.062948, 0, 0.8039216, 1, 1,
0.03273685, 1.350571, -0.9952945, 0, 0.7960784, 1, 1,
0.04159854, 0.4840772, -0.6974778, 0, 0.7882353, 1, 1,
0.04216969, 0.741656, 0.1391947, 0, 0.7843137, 1, 1,
0.04295336, -0.8149101, 3.589821, 0, 0.7764706, 1, 1,
0.04346635, -1.606941, 4.082683, 0, 0.772549, 1, 1,
0.04723435, -0.5809387, 1.66932, 0, 0.7647059, 1, 1,
0.0513467, -2.038093, 2.397935, 0, 0.7607843, 1, 1,
0.05425258, -0.8803239, 3.604477, 0, 0.7529412, 1, 1,
0.05468914, -1.663029, 3.209231, 0, 0.7490196, 1, 1,
0.05716525, 3.008402, 0.5281753, 0, 0.7411765, 1, 1,
0.05870389, -0.1023227, 1.349327, 0, 0.7372549, 1, 1,
0.06505519, -0.935775, 3.415474, 0, 0.7294118, 1, 1,
0.06531301, -0.7247557, 3.331196, 0, 0.7254902, 1, 1,
0.065651, -1.840487, 3.309034, 0, 0.7176471, 1, 1,
0.06721468, -2.127649, 4.585344, 0, 0.7137255, 1, 1,
0.06793713, -1.651143, 3.695812, 0, 0.7058824, 1, 1,
0.06989899, -0.2792607, 2.995779, 0, 0.6980392, 1, 1,
0.07061576, -0.6777909, 3.55757, 0, 0.6941177, 1, 1,
0.07376335, -0.0217678, -0.1886003, 0, 0.6862745, 1, 1,
0.07659056, -0.737554, 1.476378, 0, 0.682353, 1, 1,
0.0778454, -0.5751077, 2.895789, 0, 0.6745098, 1, 1,
0.08100214, 0.1371808, 2.002725, 0, 0.6705883, 1, 1,
0.08219723, -0.3473652, 5.201603, 0, 0.6627451, 1, 1,
0.08254351, -0.9063409, 4.108885, 0, 0.6588235, 1, 1,
0.08298407, 0.08029374, 0.8636565, 0, 0.6509804, 1, 1,
0.08546944, -1.190787, 2.555996, 0, 0.6470588, 1, 1,
0.08613215, 0.8857983, -0.03150521, 0, 0.6392157, 1, 1,
0.08948609, -1.149543, 4.205519, 0, 0.6352941, 1, 1,
0.0900749, 0.5667433, -1.317321, 0, 0.627451, 1, 1,
0.09563988, -0.9508741, 1.099423, 0, 0.6235294, 1, 1,
0.09612027, 0.5096977, -0.04623874, 0, 0.6156863, 1, 1,
0.1010405, -2.208659, 4.03317, 0, 0.6117647, 1, 1,
0.1014369, -0.8304415, 3.584425, 0, 0.6039216, 1, 1,
0.1031443, -0.1946391, 3.953397, 0, 0.5960785, 1, 1,
0.1129173, -0.608707, 2.362135, 0, 0.5921569, 1, 1,
0.1136676, -0.2621779, 5.524475, 0, 0.5843138, 1, 1,
0.113949, -0.1155597, 0.8779635, 0, 0.5803922, 1, 1,
0.1168737, -0.6647586, 3.108616, 0, 0.572549, 1, 1,
0.1205178, -1.686156, 4.681532, 0, 0.5686275, 1, 1,
0.1213964, 0.4740247, 0.1287631, 0, 0.5607843, 1, 1,
0.123127, 0.04890054, 1.207189, 0, 0.5568628, 1, 1,
0.1274853, -1.060915, 4.351599, 0, 0.5490196, 1, 1,
0.1286994, -1.243778, 3.492136, 0, 0.5450981, 1, 1,
0.1293796, -0.8812179, 3.198743, 0, 0.5372549, 1, 1,
0.1306328, -0.3105407, 2.467767, 0, 0.5333334, 1, 1,
0.1323191, 0.2236059, 1.492334, 0, 0.5254902, 1, 1,
0.1412218, -0.9668335, 1.982939, 0, 0.5215687, 1, 1,
0.1443745, -0.3844129, 2.90197, 0, 0.5137255, 1, 1,
0.1456472, -1.15132, 3.209507, 0, 0.509804, 1, 1,
0.1494089, -0.5061629, 3.617803, 0, 0.5019608, 1, 1,
0.1544571, 0.7658728, -0.6936692, 0, 0.4941176, 1, 1,
0.1575434, 0.3085431, 0.4712174, 0, 0.4901961, 1, 1,
0.1582305, -0.7041833, 3.340481, 0, 0.4823529, 1, 1,
0.1591395, -1.107206, 2.890688, 0, 0.4784314, 1, 1,
0.1593984, -2.639017, 4.891292, 0, 0.4705882, 1, 1,
0.161067, 0.7211689, -0.1068607, 0, 0.4666667, 1, 1,
0.1621546, -0.9419954, 3.136512, 0, 0.4588235, 1, 1,
0.1633362, -0.6174157, 3.369592, 0, 0.454902, 1, 1,
0.1693448, 0.347099, 0.6113378, 0, 0.4470588, 1, 1,
0.1711356, 1.708804, 0.2884656, 0, 0.4431373, 1, 1,
0.1714392, -0.317013, 2.358824, 0, 0.4352941, 1, 1,
0.173247, 0.1222629, -0.2180776, 0, 0.4313726, 1, 1,
0.1742858, 0.1195564, 2.912123, 0, 0.4235294, 1, 1,
0.1753677, -0.4165248, 5.367983, 0, 0.4196078, 1, 1,
0.178066, -1.369336, 3.279566, 0, 0.4117647, 1, 1,
0.1803785, -0.3240418, 3.085511, 0, 0.4078431, 1, 1,
0.185531, -0.6692083, 3.041515, 0, 0.4, 1, 1,
0.1874819, 0.9522019, 0.8361447, 0, 0.3921569, 1, 1,
0.1906901, 0.5900719, 1.208303, 0, 0.3882353, 1, 1,
0.1955083, -0.3872356, 1.624258, 0, 0.3803922, 1, 1,
0.1964689, 1.187188, 0.7840188, 0, 0.3764706, 1, 1,
0.1967252, 1.148562, -0.1725099, 0, 0.3686275, 1, 1,
0.1989153, 1.074807, 0.7021661, 0, 0.3647059, 1, 1,
0.1999422, -0.3975856, 2.937036, 0, 0.3568628, 1, 1,
0.2061477, -0.6815006, 1.569952, 0, 0.3529412, 1, 1,
0.2106817, 0.5481958, -0.06924333, 0, 0.345098, 1, 1,
0.2124951, 0.891633, -0.4836542, 0, 0.3411765, 1, 1,
0.2142137, -0.7160408, 3.252158, 0, 0.3333333, 1, 1,
0.2148366, -1.844507, 3.83897, 0, 0.3294118, 1, 1,
0.2178189, 0.5122479, 0.3369878, 0, 0.3215686, 1, 1,
0.2194105, -0.01677469, 1.985886, 0, 0.3176471, 1, 1,
0.2205233, 0.9230896, 1.32469, 0, 0.3098039, 1, 1,
0.221376, 1.128273, -0.4551165, 0, 0.3058824, 1, 1,
0.22716, -0.3823377, 2.98157, 0, 0.2980392, 1, 1,
0.2321814, -1.041567, 3.341569, 0, 0.2901961, 1, 1,
0.2380581, -0.06549594, 2.519784, 0, 0.2862745, 1, 1,
0.2444889, -0.9363598, 2.652241, 0, 0.2784314, 1, 1,
0.2488009, -0.7513149, 2.03555, 0, 0.2745098, 1, 1,
0.2538277, -0.3542177, 3.901951, 0, 0.2666667, 1, 1,
0.2546509, -0.820224, 4.593678, 0, 0.2627451, 1, 1,
0.2581376, 1.212557, 0.6635907, 0, 0.254902, 1, 1,
0.2628621, -0.2237121, 3.169979, 0, 0.2509804, 1, 1,
0.2639011, 0.243517, 0.4372547, 0, 0.2431373, 1, 1,
0.26421, -0.04733567, 4.724747, 0, 0.2392157, 1, 1,
0.2703444, 0.942957, 0.3610036, 0, 0.2313726, 1, 1,
0.2725722, 0.2757713, -0.9147666, 0, 0.227451, 1, 1,
0.2749282, 0.8906789, -0.2065814, 0, 0.2196078, 1, 1,
0.2776637, -1.929253, 4.784291, 0, 0.2156863, 1, 1,
0.2779411, -1.058062, 2.862897, 0, 0.2078431, 1, 1,
0.278253, 0.2140587, 0.9984084, 0, 0.2039216, 1, 1,
0.27992, -0.5848528, 2.967256, 0, 0.1960784, 1, 1,
0.2807698, 0.3620027, -0.5012433, 0, 0.1882353, 1, 1,
0.2807911, -0.07986499, 0.979164, 0, 0.1843137, 1, 1,
0.2840738, 0.6603769, 0.6069356, 0, 0.1764706, 1, 1,
0.2866767, 0.5632138, -0.8316378, 0, 0.172549, 1, 1,
0.2881435, 1.328214, -1.700277, 0, 0.1647059, 1, 1,
0.2905689, -0.2970509, 1.433215, 0, 0.1607843, 1, 1,
0.2909431, -0.9600739, 2.927327, 0, 0.1529412, 1, 1,
0.2920906, -0.7056168, 2.618032, 0, 0.1490196, 1, 1,
0.2945805, 0.5269804, -0.4819645, 0, 0.1411765, 1, 1,
0.2968005, -0.7215742, 3.113386, 0, 0.1372549, 1, 1,
0.2981074, -0.8372094, 4.48867, 0, 0.1294118, 1, 1,
0.3015963, -2.412043, 1.555653, 0, 0.1254902, 1, 1,
0.309518, -0.5899657, 3.395586, 0, 0.1176471, 1, 1,
0.3178821, 0.02631605, 1.649342, 0, 0.1137255, 1, 1,
0.3190874, -1.170916, 2.422102, 0, 0.1058824, 1, 1,
0.3209282, -1.002529, 2.864715, 0, 0.09803922, 1, 1,
0.3245822, 0.9631793, 1.493886, 0, 0.09411765, 1, 1,
0.326711, -1.235313, 0.02698791, 0, 0.08627451, 1, 1,
0.3270509, 0.4360202, -0.273278, 0, 0.08235294, 1, 1,
0.3292689, 1.562429, -0.622792, 0, 0.07450981, 1, 1,
0.3315667, 3.035481, -0.549229, 0, 0.07058824, 1, 1,
0.3357167, 2.123665, 0.2671861, 0, 0.0627451, 1, 1,
0.3366575, -0.03373658, 0.5872818, 0, 0.05882353, 1, 1,
0.3393464, 0.6324105, 0.2747846, 0, 0.05098039, 1, 1,
0.3400477, -0.9007621, 1.741857, 0, 0.04705882, 1, 1,
0.3424278, 1.166743, 1.523073, 0, 0.03921569, 1, 1,
0.3446365, 0.3675197, -0.4705491, 0, 0.03529412, 1, 1,
0.3448381, -0.237105, 3.52543, 0, 0.02745098, 1, 1,
0.3467432, 1.149514, -0.9624331, 0, 0.02352941, 1, 1,
0.3470028, -1.083335, 2.950453, 0, 0.01568628, 1, 1,
0.3479856, 0.5222208, 2.980694, 0, 0.01176471, 1, 1,
0.3495613, -0.6114213, 2.254462, 0, 0.003921569, 1, 1,
0.3563412, -1.331078, 2.906141, 0.003921569, 0, 1, 1,
0.360016, 1.638329, -0.3039161, 0.007843138, 0, 1, 1,
0.3609564, -0.4907735, 2.583645, 0.01568628, 0, 1, 1,
0.3609957, -0.4106971, 1.499642, 0.01960784, 0, 1, 1,
0.3628731, 0.08968685, -0.1595546, 0.02745098, 0, 1, 1,
0.3645425, 0.09695845, 1.58913, 0.03137255, 0, 1, 1,
0.367647, 1.247139, 1.854174, 0.03921569, 0, 1, 1,
0.3717639, 1.888409, 0.6443024, 0.04313726, 0, 1, 1,
0.3719956, 0.6973685, 0.9662312, 0.05098039, 0, 1, 1,
0.3752303, 1.325994, 0.3616673, 0.05490196, 0, 1, 1,
0.3806632, -0.03765142, 1.792426, 0.0627451, 0, 1, 1,
0.3811567, 1.095932, 2.530167, 0.06666667, 0, 1, 1,
0.3837764, 1.431108, 0.5218541, 0.07450981, 0, 1, 1,
0.3845068, 1.126239, 1.415195, 0.07843138, 0, 1, 1,
0.3852014, -1.180313, 1.938249, 0.08627451, 0, 1, 1,
0.3869361, 0.7001946, 1.308405, 0.09019608, 0, 1, 1,
0.3876249, -2.910484, 3.17084, 0.09803922, 0, 1, 1,
0.3924282, 1.924201, 2.175583, 0.1058824, 0, 1, 1,
0.3938829, 0.06562258, 0.6744392, 0.1098039, 0, 1, 1,
0.3966651, 0.080341, 3.340211, 0.1176471, 0, 1, 1,
0.4002272, 0.221265, 1.04048, 0.1215686, 0, 1, 1,
0.4009135, 0.8651104, -0.005919713, 0.1294118, 0, 1, 1,
0.401783, 0.5104495, 3.266818, 0.1333333, 0, 1, 1,
0.4103014, 0.0348209, 1.463254, 0.1411765, 0, 1, 1,
0.4106487, 0.6522528, 0.8629388, 0.145098, 0, 1, 1,
0.4118256, 1.334121, -1.390387, 0.1529412, 0, 1, 1,
0.4196366, 1.137344, 1.808436, 0.1568628, 0, 1, 1,
0.4203956, -0.8258276, 2.869704, 0.1647059, 0, 1, 1,
0.4221243, 0.5920309, -0.006099135, 0.1686275, 0, 1, 1,
0.4255261, 0.4539712, 0.2388715, 0.1764706, 0, 1, 1,
0.4292087, 0.7788998, 0.5340738, 0.1803922, 0, 1, 1,
0.4392332, -0.5468156, 1.43801, 0.1882353, 0, 1, 1,
0.4398388, -0.6983441, 2.577583, 0.1921569, 0, 1, 1,
0.4428766, -0.2522311, 2.00358, 0.2, 0, 1, 1,
0.4431197, 0.6692965, 0.5064889, 0.2078431, 0, 1, 1,
0.4437154, -0.8901793, 2.826133, 0.2117647, 0, 1, 1,
0.4438878, -1.227015, 2.858972, 0.2196078, 0, 1, 1,
0.4439815, -1.50222, 2.147863, 0.2235294, 0, 1, 1,
0.4449114, -0.6941395, 2.203961, 0.2313726, 0, 1, 1,
0.4471447, 1.393211, 0.9433187, 0.2352941, 0, 1, 1,
0.4472526, -0.2294201, 2.627592, 0.2431373, 0, 1, 1,
0.4479165, 0.6053972, 1.811311, 0.2470588, 0, 1, 1,
0.4496099, 1.509986, 0.3455325, 0.254902, 0, 1, 1,
0.4496618, 1.649997, 0.7673032, 0.2588235, 0, 1, 1,
0.4507409, -1.858277, 0.911909, 0.2666667, 0, 1, 1,
0.4517036, -0.1932029, 1.390733, 0.2705882, 0, 1, 1,
0.4522337, -0.1771667, 1.393603, 0.2784314, 0, 1, 1,
0.4522373, -0.893702, 1.331069, 0.282353, 0, 1, 1,
0.4585322, 0.4721771, 0.2295977, 0.2901961, 0, 1, 1,
0.4659305, -0.2858458, 2.421849, 0.2941177, 0, 1, 1,
0.4738843, 2.065729, 0.8500872, 0.3019608, 0, 1, 1,
0.4754063, -0.4709354, 0.4094246, 0.3098039, 0, 1, 1,
0.4767441, -0.03151902, 2.321609, 0.3137255, 0, 1, 1,
0.4823918, -0.6535349, 1.846939, 0.3215686, 0, 1, 1,
0.4884131, 1.030989, -1.457969, 0.3254902, 0, 1, 1,
0.489574, -0.1287498, 1.943199, 0.3333333, 0, 1, 1,
0.4909503, 0.4062873, 2.921389, 0.3372549, 0, 1, 1,
0.4914466, -0.8118248, 4.237816, 0.345098, 0, 1, 1,
0.4932857, 0.3328994, 1.891149, 0.3490196, 0, 1, 1,
0.5009256, 1.488923, 1.078491, 0.3568628, 0, 1, 1,
0.5110428, 0.3107465, 1.998759, 0.3607843, 0, 1, 1,
0.5110557, -0.4786554, 1.855534, 0.3686275, 0, 1, 1,
0.5130247, 0.5400085, 0.04188764, 0.372549, 0, 1, 1,
0.5131266, -0.3260435, 1.668361, 0.3803922, 0, 1, 1,
0.514891, 1.253064, -0.07414901, 0.3843137, 0, 1, 1,
0.5169896, -0.9146233, 3.850403, 0.3921569, 0, 1, 1,
0.5184672, 1.356333, -1.867417, 0.3960784, 0, 1, 1,
0.5266219, -0.01394336, 1.055411, 0.4039216, 0, 1, 1,
0.5275007, -0.8808417, 2.308272, 0.4117647, 0, 1, 1,
0.5276473, -0.5085877, 3.784454, 0.4156863, 0, 1, 1,
0.5289445, 1.406431, 0.4582052, 0.4235294, 0, 1, 1,
0.5294586, 0.3591889, 1.130437, 0.427451, 0, 1, 1,
0.5373505, -0.411978, 1.630049, 0.4352941, 0, 1, 1,
0.5457666, -0.4632046, 2.587652, 0.4392157, 0, 1, 1,
0.5469534, -1.705075, 2.642871, 0.4470588, 0, 1, 1,
0.5483416, -0.4001807, 1.046111, 0.4509804, 0, 1, 1,
0.548709, 0.5441417, 0.6725069, 0.4588235, 0, 1, 1,
0.5524509, -0.7893955, 2.8943, 0.4627451, 0, 1, 1,
0.5587174, 0.2600323, 1.291203, 0.4705882, 0, 1, 1,
0.5587257, 0.7231354, 1.153735, 0.4745098, 0, 1, 1,
0.5690756, -0.4920577, 4.106328, 0.4823529, 0, 1, 1,
0.57478, 2.842513, 0.231171, 0.4862745, 0, 1, 1,
0.5790959, 0.1048567, 0.6642001, 0.4941176, 0, 1, 1,
0.5796551, 0.7081069, -0.2426292, 0.5019608, 0, 1, 1,
0.5808229, -0.9683749, 2.808956, 0.5058824, 0, 1, 1,
0.5821965, -1.584896, 2.785316, 0.5137255, 0, 1, 1,
0.5862855, 0.9818044, 0.4786712, 0.5176471, 0, 1, 1,
0.5914301, 1.348502, 0.5792405, 0.5254902, 0, 1, 1,
0.5914514, -0.01986238, 0.306494, 0.5294118, 0, 1, 1,
0.5926865, -0.9688242, 1.852517, 0.5372549, 0, 1, 1,
0.5933557, 0.1818891, 1.398672, 0.5411765, 0, 1, 1,
0.5956309, 0.1483408, 1.340594, 0.5490196, 0, 1, 1,
0.5959939, 1.845415, 0.2068262, 0.5529412, 0, 1, 1,
0.5968243, -1.815649, 1.64744, 0.5607843, 0, 1, 1,
0.6059321, -0.453087, 2.652469, 0.5647059, 0, 1, 1,
0.6093991, -0.1462739, 1.955645, 0.572549, 0, 1, 1,
0.6113802, -1.391343, 1.398404, 0.5764706, 0, 1, 1,
0.612602, 0.4885205, 1.060725, 0.5843138, 0, 1, 1,
0.6174768, 1.832057, 1.732712, 0.5882353, 0, 1, 1,
0.6180727, -0.6407092, 2.333571, 0.5960785, 0, 1, 1,
0.6219054, 0.185893, 0.1881848, 0.6039216, 0, 1, 1,
0.6354302, 0.4015688, 1.532104, 0.6078432, 0, 1, 1,
0.6364467, 0.4522568, 1.028223, 0.6156863, 0, 1, 1,
0.6416753, -0.5681206, 2.224562, 0.6196079, 0, 1, 1,
0.6504792, -0.9572048, 3.375241, 0.627451, 0, 1, 1,
0.657304, -1.182894, 3.379226, 0.6313726, 0, 1, 1,
0.659058, -0.5694094, 2.886041, 0.6392157, 0, 1, 1,
0.6682963, -0.6161861, 2.0774, 0.6431373, 0, 1, 1,
0.6705614, -0.4739315, 2.311198, 0.6509804, 0, 1, 1,
0.6776186, -0.2119081, 2.387161, 0.654902, 0, 1, 1,
0.6802045, 0.08339436, 1.072091, 0.6627451, 0, 1, 1,
0.6806018, -2.583576, 1.178233, 0.6666667, 0, 1, 1,
0.6849564, -0.3077828, 0.9521317, 0.6745098, 0, 1, 1,
0.6864251, -1.484919, 3.533738, 0.6784314, 0, 1, 1,
0.6879116, -0.947326, 1.87063, 0.6862745, 0, 1, 1,
0.6890346, 0.006579802, -0.2369476, 0.6901961, 0, 1, 1,
0.7007002, -0.4461773, 3.375521, 0.6980392, 0, 1, 1,
0.7067628, -1.520067, 1.398564, 0.7058824, 0, 1, 1,
0.7187102, 1.133082, -0.9291027, 0.7098039, 0, 1, 1,
0.7222465, 1.172403, 0.3480175, 0.7176471, 0, 1, 1,
0.7226919, -0.3095632, 3.948225, 0.7215686, 0, 1, 1,
0.7248654, 0.8471605, 0.5838645, 0.7294118, 0, 1, 1,
0.7356092, -0.7791551, 2.4101, 0.7333333, 0, 1, 1,
0.7426289, 0.7646306, 1.85071, 0.7411765, 0, 1, 1,
0.7447305, -1.065929, 0.9165885, 0.7450981, 0, 1, 1,
0.7476645, -0.09379823, 0.8881797, 0.7529412, 0, 1, 1,
0.7486669, -0.1633426, 0.923683, 0.7568628, 0, 1, 1,
0.7530256, -1.056722, 1.952722, 0.7647059, 0, 1, 1,
0.7538261, -2.226649, 2.84728, 0.7686275, 0, 1, 1,
0.7560668, -0.1461396, 3.8576, 0.7764706, 0, 1, 1,
0.7564281, -0.299796, 0.6664798, 0.7803922, 0, 1, 1,
0.7574587, -0.3032963, 2.727716, 0.7882353, 0, 1, 1,
0.7586709, 0.03404285, -0.4081729, 0.7921569, 0, 1, 1,
0.7588388, 0.3777827, 0.3149693, 0.8, 0, 1, 1,
0.7634431, 1.232057, 0.3588634, 0.8078431, 0, 1, 1,
0.7637011, 0.1621082, 2.195922, 0.8117647, 0, 1, 1,
0.7657925, -0.6482403, 3.59905, 0.8196079, 0, 1, 1,
0.7802078, 1.199381, -1.052163, 0.8235294, 0, 1, 1,
0.7870151, 0.3732927, 2.183008, 0.8313726, 0, 1, 1,
0.7903545, 0.5467013, 0.282525, 0.8352941, 0, 1, 1,
0.7993954, -0.7391613, 2.77021, 0.8431373, 0, 1, 1,
0.8022569, -1.603075, 3.32861, 0.8470588, 0, 1, 1,
0.8028948, 0.4209264, 0.7377163, 0.854902, 0, 1, 1,
0.805905, 0.7379673, 0.7474343, 0.8588235, 0, 1, 1,
0.8061393, -0.7970794, 1.832979, 0.8666667, 0, 1, 1,
0.8075696, -1.069527, 3.528665, 0.8705882, 0, 1, 1,
0.8103237, 0.1275808, 0.9142401, 0.8784314, 0, 1, 1,
0.8151496, 0.0674348, 1.846464, 0.8823529, 0, 1, 1,
0.8196277, -0.5378296, 2.454641, 0.8901961, 0, 1, 1,
0.823245, -0.9274765, 2.449247, 0.8941177, 0, 1, 1,
0.8250042, 0.07105511, 1.545309, 0.9019608, 0, 1, 1,
0.8362824, -0.3904401, 0.4818895, 0.9098039, 0, 1, 1,
0.8376752, 1.145668, 1.063243, 0.9137255, 0, 1, 1,
0.8398795, 0.1547859, 0.3160974, 0.9215686, 0, 1, 1,
0.8504835, -0.7815813, 1.013281, 0.9254902, 0, 1, 1,
0.851885, -1.790101, 2.774778, 0.9333333, 0, 1, 1,
0.8640723, 0.8625419, 1.103719, 0.9372549, 0, 1, 1,
0.8654942, -1.912312, 2.206952, 0.945098, 0, 1, 1,
0.8665915, 1.747779, 1.5906, 0.9490196, 0, 1, 1,
0.8678554, -0.4014994, 1.511158, 0.9568627, 0, 1, 1,
0.8724961, -0.3923955, 3.231707, 0.9607843, 0, 1, 1,
0.8744466, 0.0132496, 2.032401, 0.9686275, 0, 1, 1,
0.8771214, -0.159609, 2.163177, 0.972549, 0, 1, 1,
0.8779608, 0.9661319, -0.3567647, 0.9803922, 0, 1, 1,
0.8806407, -1.043952, 1.829475, 0.9843137, 0, 1, 1,
0.8868852, -1.977377, 1.721698, 0.9921569, 0, 1, 1,
0.8882136, 0.04169978, 2.40442, 0.9960784, 0, 1, 1,
0.8906647, -0.2770701, 1.485055, 1, 0, 0.9960784, 1,
0.898201, 1.181682, -2.349041, 1, 0, 0.9882353, 1,
0.913897, 0.2175667, 1.737434, 1, 0, 0.9843137, 1,
0.925309, -0.2350468, 2.112554, 1, 0, 0.9764706, 1,
0.9254191, 1.550312, 1.234429, 1, 0, 0.972549, 1,
0.926239, 0.2868946, 1.890423, 1, 0, 0.9647059, 1,
0.9266151, -0.1710423, 0.858126, 1, 0, 0.9607843, 1,
0.9278683, 0.3831653, 1.176561, 1, 0, 0.9529412, 1,
0.9333115, 1.03572, 0.7594754, 1, 0, 0.9490196, 1,
0.9401388, 1.082425, 0.5646474, 1, 0, 0.9411765, 1,
0.9428796, -0.6613649, 2.223067, 1, 0, 0.9372549, 1,
0.9439942, 1.613775, 0.2198545, 1, 0, 0.9294118, 1,
0.9483836, -0.1345622, 3.548597, 1, 0, 0.9254902, 1,
0.9539482, -1.787793, 3.727681, 1, 0, 0.9176471, 1,
0.9571161, 0.5802853, -0.1318109, 1, 0, 0.9137255, 1,
0.95756, -0.5470286, 1.197729, 1, 0, 0.9058824, 1,
0.9578099, 0.2123313, 2.589573, 1, 0, 0.9019608, 1,
0.9604337, -1.368737, 2.520174, 1, 0, 0.8941177, 1,
0.9625258, 0.5349731, 0.164932, 1, 0, 0.8862745, 1,
0.9700442, 1.249775, -1.460405, 1, 0, 0.8823529, 1,
0.9706496, -0.7080427, 1.656363, 1, 0, 0.8745098, 1,
0.9729491, -2.135054, 4.237276, 1, 0, 0.8705882, 1,
0.97614, 0.8628057, 2.627652, 1, 0, 0.8627451, 1,
0.9863414, -0.6576914, 1.473101, 1, 0, 0.8588235, 1,
0.9865606, -0.4401262, 2.142277, 1, 0, 0.8509804, 1,
0.9871235, 0.7599981, 0.1126145, 1, 0, 0.8470588, 1,
0.9914965, -1.212915, 1.304317, 1, 0, 0.8392157, 1,
0.9916652, -2.066136, 2.845627, 1, 0, 0.8352941, 1,
0.9960832, -1.127409, 0.8702102, 1, 0, 0.827451, 1,
0.9981633, -0.8717018, 2.525298, 1, 0, 0.8235294, 1,
0.9992453, 0.0736518, -0.2204263, 1, 0, 0.8156863, 1,
1.009769, -1.392651, 1.510868, 1, 0, 0.8117647, 1,
1.011478, 0.6529174, 4.005799, 1, 0, 0.8039216, 1,
1.015424, -0.262888, 1.500157, 1, 0, 0.7960784, 1,
1.01824, 0.01684622, 1.553581, 1, 0, 0.7921569, 1,
1.019257, -2.335788, 2.721069, 1, 0, 0.7843137, 1,
1.041664, 0.08579455, 0.9974615, 1, 0, 0.7803922, 1,
1.058499, 1.866487, 1.228354, 1, 0, 0.772549, 1,
1.059656, -0.7865074, 1.343029, 1, 0, 0.7686275, 1,
1.060111, -0.5599624, 0.820788, 1, 0, 0.7607843, 1,
1.075829, 0.1428177, 1.077553, 1, 0, 0.7568628, 1,
1.082955, -0.2744353, 1.191608, 1, 0, 0.7490196, 1,
1.089028, 1.073594, 1.354453, 1, 0, 0.7450981, 1,
1.106587, 0.2059546, 1.542539, 1, 0, 0.7372549, 1,
1.106596, 1.16985, 0.5531453, 1, 0, 0.7333333, 1,
1.108657, 0.5058264, 1.555365, 1, 0, 0.7254902, 1,
1.110447, -1.2161, 3.761436, 1, 0, 0.7215686, 1,
1.114445, -2.280863, 1.569816, 1, 0, 0.7137255, 1,
1.114535, 0.9903265, 0.8434098, 1, 0, 0.7098039, 1,
1.123752, 0.1400387, 0.1902406, 1, 0, 0.7019608, 1,
1.12479, 0.9598582, 1.173822, 1, 0, 0.6941177, 1,
1.125044, -0.1751796, 2.981469, 1, 0, 0.6901961, 1,
1.129428, -0.6122272, 4.321117, 1, 0, 0.682353, 1,
1.132428, 0.6822055, 1.046232, 1, 0, 0.6784314, 1,
1.140623, -1.585494, 1.303659, 1, 0, 0.6705883, 1,
1.14133, 1.729076, 1.75282, 1, 0, 0.6666667, 1,
1.163132, -0.06872371, 0.7889975, 1, 0, 0.6588235, 1,
1.164408, -0.159322, 0.5840551, 1, 0, 0.654902, 1,
1.16459, 0.407652, 1.346565, 1, 0, 0.6470588, 1,
1.166894, -0.7448403, 2.514037, 1, 0, 0.6431373, 1,
1.170821, 1.395609, 2.366049, 1, 0, 0.6352941, 1,
1.183945, -0.3718084, 2.361033, 1, 0, 0.6313726, 1,
1.187745, 0.1407184, 0.5217121, 1, 0, 0.6235294, 1,
1.188647, -0.2793785, 1.066291, 1, 0, 0.6196079, 1,
1.189698, -1.157034, 2.952142, 1, 0, 0.6117647, 1,
1.191304, 0.8255312, 1.044629, 1, 0, 0.6078432, 1,
1.204524, -0.1020499, 4.813231, 1, 0, 0.6, 1,
1.2143, 0.2727329, 0.2801765, 1, 0, 0.5921569, 1,
1.236799, 0.6830705, 0.8010725, 1, 0, 0.5882353, 1,
1.23824, -0.1966567, 1.919987, 1, 0, 0.5803922, 1,
1.241317, -0.7692927, -0.06032361, 1, 0, 0.5764706, 1,
1.25217, 1.274503, 3.056706, 1, 0, 0.5686275, 1,
1.256727, -0.8769288, 3.814674, 1, 0, 0.5647059, 1,
1.259245, -0.8373091, 2.912853, 1, 0, 0.5568628, 1,
1.2695, 0.9338323, 2.030313, 1, 0, 0.5529412, 1,
1.269901, 0.4747495, 1.083662, 1, 0, 0.5450981, 1,
1.278505, -0.1529234, 2.548607, 1, 0, 0.5411765, 1,
1.279076, -0.470611, 3.198822, 1, 0, 0.5333334, 1,
1.281554, -0.5803431, 2.747475, 1, 0, 0.5294118, 1,
1.289756, 0.1093088, 2.000722, 1, 0, 0.5215687, 1,
1.295173, 0.3215056, 0.4824925, 1, 0, 0.5176471, 1,
1.320007, -2.142014, 3.485398, 1, 0, 0.509804, 1,
1.323493, 1.793921, 1.891072, 1, 0, 0.5058824, 1,
1.329716, 0.02300871, 1.474764, 1, 0, 0.4980392, 1,
1.342683, 0.7179395, 1.929244, 1, 0, 0.4901961, 1,
1.346603, -0.3859595, 3.168418, 1, 0, 0.4862745, 1,
1.348285, -1.098072, 0.3060585, 1, 0, 0.4784314, 1,
1.353527, 1.099625, 3.006199, 1, 0, 0.4745098, 1,
1.375452, 1.490634, 1.000604, 1, 0, 0.4666667, 1,
1.375571, 0.7230154, 1.969229, 1, 0, 0.4627451, 1,
1.378078, 0.5763207, -0.4357981, 1, 0, 0.454902, 1,
1.381618, -1.19347, 1.216114, 1, 0, 0.4509804, 1,
1.396298, 0.4676678, 1.746143, 1, 0, 0.4431373, 1,
1.400202, -0.3488146, 1.64134, 1, 0, 0.4392157, 1,
1.415245, 2.249197, 1.296034, 1, 0, 0.4313726, 1,
1.423448, -0.1552697, 1.652798, 1, 0, 0.427451, 1,
1.439117, -1.675909, 2.15273, 1, 0, 0.4196078, 1,
1.440793, -0.7376974, 0.1944294, 1, 0, 0.4156863, 1,
1.442523, -1.539897, 2.137589, 1, 0, 0.4078431, 1,
1.446468, 1.007038, 2.268753, 1, 0, 0.4039216, 1,
1.449249, -0.1427583, 3.009491, 1, 0, 0.3960784, 1,
1.458387, 0.9742044, 0.7795389, 1, 0, 0.3882353, 1,
1.461651, 0.1073664, 0.9994091, 1, 0, 0.3843137, 1,
1.463044, 0.1320112, 1.904501, 1, 0, 0.3764706, 1,
1.468408, -0.9967802, 1.220028, 1, 0, 0.372549, 1,
1.479945, 0.8078657, 0.8681237, 1, 0, 0.3647059, 1,
1.485639, 1.298046, -0.5906182, 1, 0, 0.3607843, 1,
1.491911, -0.1553587, 3.427227, 1, 0, 0.3529412, 1,
1.492946, -0.5105207, 1.717677, 1, 0, 0.3490196, 1,
1.496284, -0.606382, 0.5014186, 1, 0, 0.3411765, 1,
1.497827, 1.008321, -0.2076186, 1, 0, 0.3372549, 1,
1.500062, 0.05856037, 2.647513, 1, 0, 0.3294118, 1,
1.516746, 0.9148694, 1.684471, 1, 0, 0.3254902, 1,
1.519892, 1.191604, 1.354123, 1, 0, 0.3176471, 1,
1.520485, -0.8590623, 2.275367, 1, 0, 0.3137255, 1,
1.530425, 0.3501384, 3.869693, 1, 0, 0.3058824, 1,
1.531363, 1.060707, -0.3676057, 1, 0, 0.2980392, 1,
1.561204, 0.01698068, 3.652772, 1, 0, 0.2941177, 1,
1.563004, 1.009068, -0.00543295, 1, 0, 0.2862745, 1,
1.579433, 2.583061, 0.9924652, 1, 0, 0.282353, 1,
1.586222, -0.05686265, 3.486367, 1, 0, 0.2745098, 1,
1.588413, 2.176328, 0.3865554, 1, 0, 0.2705882, 1,
1.596537, 1.423449, 3.068392, 1, 0, 0.2627451, 1,
1.612661, 0.3853752, 2.038402, 1, 0, 0.2588235, 1,
1.620229, -0.8314314, 1.948493, 1, 0, 0.2509804, 1,
1.628898, 0.760078, 1.535672, 1, 0, 0.2470588, 1,
1.630346, 0.2996404, 0.7437924, 1, 0, 0.2392157, 1,
1.636522, -0.6873375, 2.761909, 1, 0, 0.2352941, 1,
1.640591, 0.4950964, 0.9385735, 1, 0, 0.227451, 1,
1.641738, -0.4924862, 0.8022518, 1, 0, 0.2235294, 1,
1.645497, -0.7548281, 4.143452, 1, 0, 0.2156863, 1,
1.70113, 0.6154487, 0.2988827, 1, 0, 0.2117647, 1,
1.719097, 0.01736851, 0.9702359, 1, 0, 0.2039216, 1,
1.726409, 2.150292, 2.520413, 1, 0, 0.1960784, 1,
1.745451, 0.641671, 1.616791, 1, 0, 0.1921569, 1,
1.817093, -0.6925225, 2.344362, 1, 0, 0.1843137, 1,
1.817306, 0.9928566, 1.390483, 1, 0, 0.1803922, 1,
1.832416, -0.9688666, 0.4365964, 1, 0, 0.172549, 1,
1.878602, 1.408391, 2.700815, 1, 0, 0.1686275, 1,
1.879749, -0.2204907, -0.1952544, 1, 0, 0.1607843, 1,
1.969382, 0.9666009, 0.8056644, 1, 0, 0.1568628, 1,
1.988933, -0.3754805, 1.998937, 1, 0, 0.1490196, 1,
1.991488, -0.4433989, 2.91505, 1, 0, 0.145098, 1,
2.007387, 1.255998, 0.1362423, 1, 0, 0.1372549, 1,
2.008977, -1.30906, 1.618203, 1, 0, 0.1333333, 1,
2.014332, -1.115993, 2.26014, 1, 0, 0.1254902, 1,
2.022643, 0.3028783, 1.82291, 1, 0, 0.1215686, 1,
2.036472, 0.4089237, 1.555061, 1, 0, 0.1137255, 1,
2.042033, 0.3472626, 1.721293, 1, 0, 0.1098039, 1,
2.050628, 0.6529148, 0.6952083, 1, 0, 0.1019608, 1,
2.053045, -0.8470291, 3.142447, 1, 0, 0.09411765, 1,
2.125568, 0.2999713, 1.204836, 1, 0, 0.09019608, 1,
2.128861, -0.5065063, 2.056805, 1, 0, 0.08235294, 1,
2.143023, -1.220248, 4.555912, 1, 0, 0.07843138, 1,
2.148582, -0.3925486, 1.341796, 1, 0, 0.07058824, 1,
2.18301, -2.041553, 2.58683, 1, 0, 0.06666667, 1,
2.20548, 0.1503608, 1.158451, 1, 0, 0.05882353, 1,
2.224947, -1.785549, 1.413444, 1, 0, 0.05490196, 1,
2.252843, -0.363131, 2.892084, 1, 0, 0.04705882, 1,
2.360169, 0.5127323, 0.9989709, 1, 0, 0.04313726, 1,
2.394727, -0.327592, 0.462982, 1, 0, 0.03529412, 1,
2.500405, 0.8450987, 0.7723747, 1, 0, 0.03137255, 1,
2.674382, -1.187273, 0.1997194, 1, 0, 0.02352941, 1,
2.685115, -0.03489556, 2.202259, 1, 0, 0.01960784, 1,
2.839302, 0.1404668, 2.713446, 1, 0, 0.01176471, 1,
2.904796, -0.01861011, 1.922631, 1, 0, 0.007843138, 1
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
-0.0733912, -4.730811, -6.748205, 0, -0.5, 0.5, 0.5,
-0.0733912, -4.730811, -6.748205, 1, -0.5, 0.5, 0.5,
-0.0733912, -4.730811, -6.748205, 1, 1.5, 0.5, 0.5,
-0.0733912, -4.730811, -6.748205, 0, 1.5, 0.5, 0.5
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
-4.061184, -0.2848663, -6.748205, 0, -0.5, 0.5, 0.5,
-4.061184, -0.2848663, -6.748205, 1, -0.5, 0.5, 0.5,
-4.061184, -0.2848663, -6.748205, 1, 1.5, 0.5, 0.5,
-4.061184, -0.2848663, -6.748205, 0, 1.5, 0.5, 0.5
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
-4.061184, -4.730811, 0.2774975, 0, -0.5, 0.5, 0.5,
-4.061184, -4.730811, 0.2774975, 1, -0.5, 0.5, 0.5,
-4.061184, -4.730811, 0.2774975, 1, 1.5, 0.5, 0.5,
-4.061184, -4.730811, 0.2774975, 0, 1.5, 0.5, 0.5
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
-3, -3.704824, -5.126889,
2, -3.704824, -5.126889,
-3, -3.704824, -5.126889,
-3, -3.875822, -5.397108,
-2, -3.704824, -5.126889,
-2, -3.875822, -5.397108,
-1, -3.704824, -5.126889,
-1, -3.875822, -5.397108,
0, -3.704824, -5.126889,
0, -3.875822, -5.397108,
1, -3.704824, -5.126889,
1, -3.875822, -5.397108,
2, -3.704824, -5.126889,
2, -3.875822, -5.397108
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
-3, -4.217817, -5.937547, 0, -0.5, 0.5, 0.5,
-3, -4.217817, -5.937547, 1, -0.5, 0.5, 0.5,
-3, -4.217817, -5.937547, 1, 1.5, 0.5, 0.5,
-3, -4.217817, -5.937547, 0, 1.5, 0.5, 0.5,
-2, -4.217817, -5.937547, 0, -0.5, 0.5, 0.5,
-2, -4.217817, -5.937547, 1, -0.5, 0.5, 0.5,
-2, -4.217817, -5.937547, 1, 1.5, 0.5, 0.5,
-2, -4.217817, -5.937547, 0, 1.5, 0.5, 0.5,
-1, -4.217817, -5.937547, 0, -0.5, 0.5, 0.5,
-1, -4.217817, -5.937547, 1, -0.5, 0.5, 0.5,
-1, -4.217817, -5.937547, 1, 1.5, 0.5, 0.5,
-1, -4.217817, -5.937547, 0, 1.5, 0.5, 0.5,
0, -4.217817, -5.937547, 0, -0.5, 0.5, 0.5,
0, -4.217817, -5.937547, 1, -0.5, 0.5, 0.5,
0, -4.217817, -5.937547, 1, 1.5, 0.5, 0.5,
0, -4.217817, -5.937547, 0, 1.5, 0.5, 0.5,
1, -4.217817, -5.937547, 0, -0.5, 0.5, 0.5,
1, -4.217817, -5.937547, 1, -0.5, 0.5, 0.5,
1, -4.217817, -5.937547, 1, 1.5, 0.5, 0.5,
1, -4.217817, -5.937547, 0, 1.5, 0.5, 0.5,
2, -4.217817, -5.937547, 0, -0.5, 0.5, 0.5,
2, -4.217817, -5.937547, 1, -0.5, 0.5, 0.5,
2, -4.217817, -5.937547, 1, 1.5, 0.5, 0.5,
2, -4.217817, -5.937547, 0, 1.5, 0.5, 0.5
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
-3.140924, -3, -5.126889,
-3.140924, 3, -5.126889,
-3.140924, -3, -5.126889,
-3.294301, -3, -5.397108,
-3.140924, -2, -5.126889,
-3.294301, -2, -5.397108,
-3.140924, -1, -5.126889,
-3.294301, -1, -5.397108,
-3.140924, 0, -5.126889,
-3.294301, 0, -5.397108,
-3.140924, 1, -5.126889,
-3.294301, 1, -5.397108,
-3.140924, 2, -5.126889,
-3.294301, 2, -5.397108,
-3.140924, 3, -5.126889,
-3.294301, 3, -5.397108
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
-3.601054, -3, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, -3, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, -3, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, -3, -5.937547, 0, 1.5, 0.5, 0.5,
-3.601054, -2, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, -2, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, -2, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, -2, -5.937547, 0, 1.5, 0.5, 0.5,
-3.601054, -1, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, -1, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, -1, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, -1, -5.937547, 0, 1.5, 0.5, 0.5,
-3.601054, 0, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, 0, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, 0, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, 0, -5.937547, 0, 1.5, 0.5, 0.5,
-3.601054, 1, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, 1, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, 1, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, 1, -5.937547, 0, 1.5, 0.5, 0.5,
-3.601054, 2, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, 2, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, 2, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, 2, -5.937547, 0, 1.5, 0.5, 0.5,
-3.601054, 3, -5.937547, 0, -0.5, 0.5, 0.5,
-3.601054, 3, -5.937547, 1, -0.5, 0.5, 0.5,
-3.601054, 3, -5.937547, 1, 1.5, 0.5, 0.5,
-3.601054, 3, -5.937547, 0, 1.5, 0.5, 0.5
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
-3.140924, -3.704824, -4,
-3.140924, -3.704824, 4,
-3.140924, -3.704824, -4,
-3.294301, -3.875822, -4,
-3.140924, -3.704824, -2,
-3.294301, -3.875822, -2,
-3.140924, -3.704824, 0,
-3.294301, -3.875822, 0,
-3.140924, -3.704824, 2,
-3.294301, -3.875822, 2,
-3.140924, -3.704824, 4,
-3.294301, -3.875822, 4
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
-3.601054, -4.217817, -4, 0, -0.5, 0.5, 0.5,
-3.601054, -4.217817, -4, 1, -0.5, 0.5, 0.5,
-3.601054, -4.217817, -4, 1, 1.5, 0.5, 0.5,
-3.601054, -4.217817, -4, 0, 1.5, 0.5, 0.5,
-3.601054, -4.217817, -2, 0, -0.5, 0.5, 0.5,
-3.601054, -4.217817, -2, 1, -0.5, 0.5, 0.5,
-3.601054, -4.217817, -2, 1, 1.5, 0.5, 0.5,
-3.601054, -4.217817, -2, 0, 1.5, 0.5, 0.5,
-3.601054, -4.217817, 0, 0, -0.5, 0.5, 0.5,
-3.601054, -4.217817, 0, 1, -0.5, 0.5, 0.5,
-3.601054, -4.217817, 0, 1, 1.5, 0.5, 0.5,
-3.601054, -4.217817, 0, 0, 1.5, 0.5, 0.5,
-3.601054, -4.217817, 2, 0, -0.5, 0.5, 0.5,
-3.601054, -4.217817, 2, 1, -0.5, 0.5, 0.5,
-3.601054, -4.217817, 2, 1, 1.5, 0.5, 0.5,
-3.601054, -4.217817, 2, 0, 1.5, 0.5, 0.5,
-3.601054, -4.217817, 4, 0, -0.5, 0.5, 0.5,
-3.601054, -4.217817, 4, 1, -0.5, 0.5, 0.5,
-3.601054, -4.217817, 4, 1, 1.5, 0.5, 0.5,
-3.601054, -4.217817, 4, 0, 1.5, 0.5, 0.5
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
-3.140924, -3.704824, -5.126889,
-3.140924, 3.135091, -5.126889,
-3.140924, -3.704824, 5.681884,
-3.140924, 3.135091, 5.681884,
-3.140924, -3.704824, -5.126889,
-3.140924, -3.704824, 5.681884,
-3.140924, 3.135091, -5.126889,
-3.140924, 3.135091, 5.681884,
-3.140924, -3.704824, -5.126889,
2.994142, -3.704824, -5.126889,
-3.140924, -3.704824, 5.681884,
2.994142, -3.704824, 5.681884,
-3.140924, 3.135091, -5.126889,
2.994142, 3.135091, -5.126889,
-3.140924, 3.135091, 5.681884,
2.994142, 3.135091, 5.681884,
2.994142, -3.704824, -5.126889,
2.994142, 3.135091, -5.126889,
2.994142, -3.704824, 5.681884,
2.994142, 3.135091, 5.681884,
2.994142, -3.704824, -5.126889,
2.994142, -3.704824, 5.681884,
2.994142, 3.135091, -5.126889,
2.994142, 3.135091, 5.681884
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
var radius = 7.575245;
var distance = 33.70312;
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
mvMatrix.translate( 0.0733912, 0.2848663, -0.2774975 );
mvMatrix.scale( 1.335031, 1.197457, 0.7577645 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.70312);
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
dichloropropane_dich<-read.table("dichloropropane_dich.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dichloropropane_dich$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_dich' not found
```

```r
y<-dichloropropane_dich$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_dich' not found
```

```r
z<-dichloropropane_dich$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_dich' not found
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
-3.051579, 0.4610471, -0.8473278, 0, 0, 1, 1, 1,
-2.929299, -0.3900941, -1.068516, 1, 0, 0, 1, 1,
-2.844893, 0.7876382, 0.134204, 1, 0, 0, 1, 1,
-2.777062, -1.82118, -2.621354, 1, 0, 0, 1, 1,
-2.755484, 0.6321235, -2.547626, 1, 0, 0, 1, 1,
-2.663147, 0.3813824, -0.6287016, 1, 0, 0, 1, 1,
-2.657957, 0.8799644, -1.748724, 0, 0, 0, 1, 1,
-2.653918, -1.590232, 0.3015026, 0, 0, 0, 1, 1,
-2.640616, 1.362487, -2.446804, 0, 0, 0, 1, 1,
-2.635278, -0.03679327, -2.239956, 0, 0, 0, 1, 1,
-2.58472, -0.5226339, -1.501391, 0, 0, 0, 1, 1,
-2.512125, 0.2771797, -0.2449687, 0, 0, 0, 1, 1,
-2.456318, -0.4945801, -1.052943, 0, 0, 0, 1, 1,
-2.452467, -0.02795736, -0.1901315, 1, 1, 1, 1, 1,
-2.430373, 0.3900469, -0.4854369, 1, 1, 1, 1, 1,
-2.407419, 0.910028, -1.536713, 1, 1, 1, 1, 1,
-2.344588, -0.1016058, -1.869634, 1, 1, 1, 1, 1,
-2.287812, 0.8027, -0.8277031, 1, 1, 1, 1, 1,
-2.258333, -0.1353416, -1.452487, 1, 1, 1, 1, 1,
-2.24225, 1.542982, -0.6032467, 1, 1, 1, 1, 1,
-2.238627, -1.845354, -1.132904, 1, 1, 1, 1, 1,
-2.225586, 0.9691658, -1.287921, 1, 1, 1, 1, 1,
-2.219098, -0.2291399, -2.346071, 1, 1, 1, 1, 1,
-2.154223, -0.6313249, -1.706192, 1, 1, 1, 1, 1,
-2.144271, 0.02340405, -1.176475, 1, 1, 1, 1, 1,
-2.142656, -1.034836, -2.250345, 1, 1, 1, 1, 1,
-2.131593, -0.99939, -1.149641, 1, 1, 1, 1, 1,
-1.990306, -0.523609, -1.710195, 1, 1, 1, 1, 1,
-1.98761, -0.2156731, -0.1305404, 0, 0, 1, 1, 1,
-1.972652, -0.7744634, -0.6868761, 1, 0, 0, 1, 1,
-1.93532, -0.5739902, -0.00251012, 1, 0, 0, 1, 1,
-1.922447, -1.905318, -1.872865, 1, 0, 0, 1, 1,
-1.917452, 0.4884494, -0.7723323, 1, 0, 0, 1, 1,
-1.898988, -1.259865, -3.0908, 1, 0, 0, 1, 1,
-1.871504, 0.477019, -2.593421, 0, 0, 0, 1, 1,
-1.870123, -1.160443, -1.562779, 0, 0, 0, 1, 1,
-1.828205, 1.723038, -1.368923, 0, 0, 0, 1, 1,
-1.82708, 0.02702962, -2.768907, 0, 0, 0, 1, 1,
-1.809822, 0.9560706, -0.8478908, 0, 0, 0, 1, 1,
-1.787844, -0.5918565, -2.628227, 0, 0, 0, 1, 1,
-1.786916, -0.9605167, -1.254087, 0, 0, 0, 1, 1,
-1.766574, -2.480703, -3.356125, 1, 1, 1, 1, 1,
-1.737883, 0.0656667, -1.601208, 1, 1, 1, 1, 1,
-1.730455, 0.5147528, -0.7842328, 1, 1, 1, 1, 1,
-1.729278, 2.272631, -1.016391, 1, 1, 1, 1, 1,
-1.697842, -1.014954, -0.8196203, 1, 1, 1, 1, 1,
-1.690633, 0.7380857, -1.651687, 1, 1, 1, 1, 1,
-1.662415, -0.9665257, -0.8830599, 1, 1, 1, 1, 1,
-1.652105, 1.235971, 1.243565, 1, 1, 1, 1, 1,
-1.6431, -0.4556221, -1.356829, 1, 1, 1, 1, 1,
-1.626568, -0.177264, -0.6222188, 1, 1, 1, 1, 1,
-1.62213, -1.548422, -2.13558, 1, 1, 1, 1, 1,
-1.61945, -0.3013564, -1.03238, 1, 1, 1, 1, 1,
-1.616264, -0.2747481, -2.94688, 1, 1, 1, 1, 1,
-1.61275, -0.814231, -2.326401, 1, 1, 1, 1, 1,
-1.601026, -0.008337892, -3.700755, 1, 1, 1, 1, 1,
-1.58531, -1.050551, -1.639709, 0, 0, 1, 1, 1,
-1.584625, 0.9046264, -1.373652, 1, 0, 0, 1, 1,
-1.575049, 0.508665, -0.3776562, 1, 0, 0, 1, 1,
-1.573434, -0.3570893, -1.21376, 1, 0, 0, 1, 1,
-1.538425, -1.037584, -2.021623, 1, 0, 0, 1, 1,
-1.532363, -0.1944106, -2.979744, 1, 0, 0, 1, 1,
-1.530905, 0.06466788, -1.512028, 0, 0, 0, 1, 1,
-1.514576, 1.200463, -0.647517, 0, 0, 0, 1, 1,
-1.502999, 0.2820841, -1.827471, 0, 0, 0, 1, 1,
-1.486595, -1.413907, -0.9326807, 0, 0, 0, 1, 1,
-1.482655, 0.6140962, -1.275934, 0, 0, 0, 1, 1,
-1.479083, 2.134403, -1.039494, 0, 0, 0, 1, 1,
-1.470361, 0.7907667, -0.3183137, 0, 0, 0, 1, 1,
-1.470338, 0.454368, -1.260631, 1, 1, 1, 1, 1,
-1.46859, -0.1559898, -2.462162, 1, 1, 1, 1, 1,
-1.46701, -1.048103, -3.358445, 1, 1, 1, 1, 1,
-1.456612, -0.04050842, -1.294575, 1, 1, 1, 1, 1,
-1.456085, 0.1141541, -1.029301, 1, 1, 1, 1, 1,
-1.450998, -0.7891686, -1.872348, 1, 1, 1, 1, 1,
-1.450377, 0.2348928, 0.4963721, 1, 1, 1, 1, 1,
-1.43673, 0.4296638, -0.2016295, 1, 1, 1, 1, 1,
-1.42422, 1.383895, -0.9138818, 1, 1, 1, 1, 1,
-1.422357, -0.7493044, -2.342045, 1, 1, 1, 1, 1,
-1.421902, 0.5498251, -1.308021, 1, 1, 1, 1, 1,
-1.413023, 2.219942, -2.459185, 1, 1, 1, 1, 1,
-1.403857, -0.6537166, -2.805, 1, 1, 1, 1, 1,
-1.398902, -1.01495, -1.34989, 1, 1, 1, 1, 1,
-1.392847, 0.143774, -1.403686, 1, 1, 1, 1, 1,
-1.38462, -1.725857, -2.191696, 0, 0, 1, 1, 1,
-1.37871, 0.4088154, -0.4817126, 1, 0, 0, 1, 1,
-1.374786, 2.055551, -0.865581, 1, 0, 0, 1, 1,
-1.374314, -0.6365215, -2.179646, 1, 0, 0, 1, 1,
-1.368894, -0.595602, -0.6228871, 1, 0, 0, 1, 1,
-1.367458, 0.7690063, -0.8347413, 1, 0, 0, 1, 1,
-1.365633, -0.5907221, -3.131951, 0, 0, 0, 1, 1,
-1.348449, 0.1588445, -2.735182, 0, 0, 0, 1, 1,
-1.343493, 0.8874374, -1.342209, 0, 0, 0, 1, 1,
-1.343258, -0.4944254, -1.249383, 0, 0, 0, 1, 1,
-1.343223, 1.71834, -0.4823538, 0, 0, 0, 1, 1,
-1.341318, 0.3638112, -2.231627, 0, 0, 0, 1, 1,
-1.338188, -0.5170242, -2.683741, 0, 0, 0, 1, 1,
-1.327279, 0.991528, 0.6134824, 1, 1, 1, 1, 1,
-1.321895, -0.1634732, -0.271538, 1, 1, 1, 1, 1,
-1.319813, 0.920312, -1.476349, 1, 1, 1, 1, 1,
-1.318257, -0.4334183, -1.932325, 1, 1, 1, 1, 1,
-1.31603, 0.5576293, -0.6324886, 1, 1, 1, 1, 1,
-1.313126, -1.758279, -3.950287, 1, 1, 1, 1, 1,
-1.299907, -0.4406694, -1.697181, 1, 1, 1, 1, 1,
-1.291308, -0.6571914, -1.830031, 1, 1, 1, 1, 1,
-1.283155, -0.6076033, -2.150748, 1, 1, 1, 1, 1,
-1.28191, 1.910585, 0.7603328, 1, 1, 1, 1, 1,
-1.279307, -3.029776, -2.734569, 1, 1, 1, 1, 1,
-1.269, -1.368675, -2.585409, 1, 1, 1, 1, 1,
-1.253938, -0.2109237, -1.102433, 1, 1, 1, 1, 1,
-1.251352, 1.18346, -2.095653, 1, 1, 1, 1, 1,
-1.251018, 0.824877, -0.8785322, 1, 1, 1, 1, 1,
-1.245936, -0.3658681, -2.033604, 0, 0, 1, 1, 1,
-1.241973, 0.5318779, -2.445911, 1, 0, 0, 1, 1,
-1.231145, -0.4525387, -1.576902, 1, 0, 0, 1, 1,
-1.226069, -0.2209098, -1.878198, 1, 0, 0, 1, 1,
-1.210077, -1.074944, -2.547616, 1, 0, 0, 1, 1,
-1.209811, 1.199175, 1.309988, 1, 0, 0, 1, 1,
-1.208987, -1.735095, -1.66469, 0, 0, 0, 1, 1,
-1.200304, -1.462144, -1.853287, 0, 0, 0, 1, 1,
-1.197989, 0.8390003, -1.032688, 0, 0, 0, 1, 1,
-1.197057, 1.346159, 0.8151684, 0, 0, 0, 1, 1,
-1.181917, 0.9155104, -0.4309061, 0, 0, 0, 1, 1,
-1.179648, 0.9739899, -0.9112757, 0, 0, 0, 1, 1,
-1.175193, 1.080747, -1.225754, 0, 0, 0, 1, 1,
-1.167537, -0.4625082, -3.463992, 1, 1, 1, 1, 1,
-1.163952, 0.2188877, -2.083872, 1, 1, 1, 1, 1,
-1.155725, 0.748831, -1.154499, 1, 1, 1, 1, 1,
-1.139088, 0.7101136, -0.3358085, 1, 1, 1, 1, 1,
-1.13513, -0.03407012, -4.456046, 1, 1, 1, 1, 1,
-1.132032, -0.9390998, -1.937804, 1, 1, 1, 1, 1,
-1.128945, 0.5395395, -2.300734, 1, 1, 1, 1, 1,
-1.124917, -1.377182, -2.307832, 1, 1, 1, 1, 1,
-1.112874, -0.2006596, -2.13758, 1, 1, 1, 1, 1,
-1.107743, 0.08160214, -2.393778, 1, 1, 1, 1, 1,
-1.104428, -1.179466, -1.990351, 1, 1, 1, 1, 1,
-1.100916, -0.979757, -1.399763, 1, 1, 1, 1, 1,
-1.100076, 0.6158069, -2.219115, 1, 1, 1, 1, 1,
-1.092774, -1.532487, -2.866136, 1, 1, 1, 1, 1,
-1.072875, 1.963442, 0.104153, 1, 1, 1, 1, 1,
-1.072757, -0.1706444, -2.724034, 0, 0, 1, 1, 1,
-1.066122, 1.041037, -0.08163613, 1, 0, 0, 1, 1,
-1.064229, 0.9790685, -2.316413, 1, 0, 0, 1, 1,
-1.053608, 1.281671, -1.23273, 1, 0, 0, 1, 1,
-1.020591, 2.005728, -0.2864281, 1, 0, 0, 1, 1,
-1.012893, 0.4840597, -1.519793, 1, 0, 0, 1, 1,
-1.009304, -0.3155135, -1.59017, 0, 0, 0, 1, 1,
-1.00761, 0.4650577, -2.731086, 0, 0, 0, 1, 1,
-1.00672, -0.8191819, -1.37301, 0, 0, 0, 1, 1,
-1.004325, 0.02523175, -1.683621, 0, 0, 0, 1, 1,
-0.9972525, -0.4647965, -1.708169, 0, 0, 0, 1, 1,
-0.9895047, -2.152105, -3.790083, 0, 0, 0, 1, 1,
-0.9888338, -0.2862518, -3.026059, 0, 0, 0, 1, 1,
-0.9828461, -1.786696, -3.279544, 1, 1, 1, 1, 1,
-0.9817571, -0.6225426, -1.359063, 1, 1, 1, 1, 1,
-0.980909, -1.40702, -2.175187, 1, 1, 1, 1, 1,
-0.9722247, 1.578496, 1.148188, 1, 1, 1, 1, 1,
-0.9719243, 0.5069114, -1.15165, 1, 1, 1, 1, 1,
-0.9709415, -1.17503, -2.091211, 1, 1, 1, 1, 1,
-0.9676666, -0.6622561, -3.878402, 1, 1, 1, 1, 1,
-0.9618699, 1.107202, -0.935343, 1, 1, 1, 1, 1,
-0.9589506, 1.18574, -1.382033, 1, 1, 1, 1, 1,
-0.9576647, -1.187486, -2.89119, 1, 1, 1, 1, 1,
-0.9562355, -0.9214715, -3.176819, 1, 1, 1, 1, 1,
-0.955983, 0.3925729, -2.164043, 1, 1, 1, 1, 1,
-0.9549835, -0.4947456, -2.844862, 1, 1, 1, 1, 1,
-0.9542804, 0.143172, -3.80518, 1, 1, 1, 1, 1,
-0.9484183, 0.4043032, -1.399452, 1, 1, 1, 1, 1,
-0.938214, -0.4810119, -3.607644, 0, 0, 1, 1, 1,
-0.9324307, 2.261422, -0.2893934, 1, 0, 0, 1, 1,
-0.9321767, -1.051687, -3.471225, 1, 0, 0, 1, 1,
-0.9304219, -0.1406052, -0.831562, 1, 0, 0, 1, 1,
-0.930067, -2.730363, -2.564445, 1, 0, 0, 1, 1,
-0.9282519, 0.1763764, -2.222998, 1, 0, 0, 1, 1,
-0.9275746, -1.417432, -2.567441, 0, 0, 0, 1, 1,
-0.9271556, 0.4593212, 0.04783052, 0, 0, 0, 1, 1,
-0.9195977, -0.8058215, -2.184532, 0, 0, 0, 1, 1,
-0.9185608, -0.02808717, -1.997713, 0, 0, 0, 1, 1,
-0.915422, 0.7850983, -1.911787, 0, 0, 0, 1, 1,
-0.9142691, -1.345721, -2.20465, 0, 0, 0, 1, 1,
-0.9122102, 0.8351848, -1.577578, 0, 0, 0, 1, 1,
-0.9117292, 0.8872098, 0.359327, 1, 1, 1, 1, 1,
-0.911393, 0.02241305, -1.136305, 1, 1, 1, 1, 1,
-0.9072191, -0.5810147, -4.374482, 1, 1, 1, 1, 1,
-0.9071871, 0.9276295, 0.2883663, 1, 1, 1, 1, 1,
-0.9040608, 0.5666432, -0.1250908, 1, 1, 1, 1, 1,
-0.9022641, -0.7556164, -1.323816, 1, 1, 1, 1, 1,
-0.8908286, 0.5143012, -1.984681, 1, 1, 1, 1, 1,
-0.887728, 0.9445532, -0.3689676, 1, 1, 1, 1, 1,
-0.8862983, 0.1389756, -1.721794, 1, 1, 1, 1, 1,
-0.8845926, 0.8376877, -0.4376222, 1, 1, 1, 1, 1,
-0.8844739, -0.8943225, -1.632684, 1, 1, 1, 1, 1,
-0.8838503, 1.229627, 0.3951444, 1, 1, 1, 1, 1,
-0.8764721, -1.296876, -2.518157, 1, 1, 1, 1, 1,
-0.8680972, -1.255826, -1.351611, 1, 1, 1, 1, 1,
-0.8674003, -0.2016218, 0.6454762, 1, 1, 1, 1, 1,
-0.8611005, 0.7804127, 0.6309292, 0, 0, 1, 1, 1,
-0.8603894, 0.8778036, 0.1030301, 1, 0, 0, 1, 1,
-0.8556452, -0.7746059, -2.440898, 1, 0, 0, 1, 1,
-0.8384888, 0.3206338, 0.192662, 1, 0, 0, 1, 1,
-0.8351191, -1.175088, -2.678081, 1, 0, 0, 1, 1,
-0.8284676, 1.136861, -0.2621417, 1, 0, 0, 1, 1,
-0.8266343, 0.9158534, -0.9461613, 0, 0, 0, 1, 1,
-0.8262593, 0.1402643, -2.653245, 0, 0, 0, 1, 1,
-0.8241314, 1.240906, -1.64237, 0, 0, 0, 1, 1,
-0.8191912, 0.8820841, -1.931836, 0, 0, 0, 1, 1,
-0.81656, -0.05079916, -1.782923, 0, 0, 0, 1, 1,
-0.8157015, -0.1375167, -0.2508379, 0, 0, 0, 1, 1,
-0.8141479, 0.3248411, -2.053685, 0, 0, 0, 1, 1,
-0.8048933, -0.1262263, -3.175652, 1, 1, 1, 1, 1,
-0.8045178, -0.497907, -1.84685, 1, 1, 1, 1, 1,
-0.7968056, 0.9502022, -1.087764, 1, 1, 1, 1, 1,
-0.7948919, 0.1917918, -1.280746, 1, 1, 1, 1, 1,
-0.7919191, 0.7445745, -2.02085, 1, 1, 1, 1, 1,
-0.7907069, -1.368891, -4.139598, 1, 1, 1, 1, 1,
-0.7903087, 1.426284, -1.015884, 1, 1, 1, 1, 1,
-0.7888016, -0.8712917, -2.139019, 1, 1, 1, 1, 1,
-0.7874722, 0.669766, -0.8426461, 1, 1, 1, 1, 1,
-0.781187, 0.280724, -1.237178, 1, 1, 1, 1, 1,
-0.7752669, -0.788256, -3.944771, 1, 1, 1, 1, 1,
-0.7704102, 1.5226, -1.573971, 1, 1, 1, 1, 1,
-0.7613949, -1.362124, -2.560104, 1, 1, 1, 1, 1,
-0.7453991, 1.048908, 0.4236088, 1, 1, 1, 1, 1,
-0.7396137, 0.7093752, 0.6410788, 1, 1, 1, 1, 1,
-0.7284985, 1.22268, -0.6591544, 0, 0, 1, 1, 1,
-0.7150165, 1.562036, -1.981376, 1, 0, 0, 1, 1,
-0.7079203, 1.178164, -0.9560828, 1, 0, 0, 1, 1,
-0.7041701, 1.180312, 0.5355614, 1, 0, 0, 1, 1,
-0.7040327, -0.470255, -1.329773, 1, 0, 0, 1, 1,
-0.7028928, 1.150314, -0.7034007, 1, 0, 0, 1, 1,
-0.6996672, -0.4947601, -1.699981, 0, 0, 0, 1, 1,
-0.6972095, -0.518223, -2.768618, 0, 0, 0, 1, 1,
-0.6938013, -0.7705609, -0.8827354, 0, 0, 0, 1, 1,
-0.6931612, 0.8660788, 1.149706, 0, 0, 0, 1, 1,
-0.6891122, -2.241341, -3.48472, 0, 0, 0, 1, 1,
-0.6850587, 0.2710615, -2.484627, 0, 0, 0, 1, 1,
-0.6820387, 1.566109, 0.629559, 0, 0, 0, 1, 1,
-0.6795816, 0.3785658, -0.841631, 1, 1, 1, 1, 1,
-0.6781409, -0.3167351, -0.247879, 1, 1, 1, 1, 1,
-0.6774616, -0.8762966, -4.330209, 1, 1, 1, 1, 1,
-0.6752852, 0.09579092, -0.8417993, 1, 1, 1, 1, 1,
-0.6723627, 0.1173141, -1.546973, 1, 1, 1, 1, 1,
-0.6685743, 0.9177773, -1.012479, 1, 1, 1, 1, 1,
-0.6674231, 0.5078434, -0.8447944, 1, 1, 1, 1, 1,
-0.665051, 0.0624863, -2.099338, 1, 1, 1, 1, 1,
-0.6565285, -1.313672, -3.934133, 1, 1, 1, 1, 1,
-0.654147, 1.18415, -2.085507, 1, 1, 1, 1, 1,
-0.6518493, 0.5365652, -2.545411, 1, 1, 1, 1, 1,
-0.6487304, 0.06396136, -3.600533, 1, 1, 1, 1, 1,
-0.6427653, -1.149035, -3.02376, 1, 1, 1, 1, 1,
-0.6417668, -0.2937979, -1.187688, 1, 1, 1, 1, 1,
-0.6400282, -1.442558, -3.05664, 1, 1, 1, 1, 1,
-0.6387162, -0.9079348, -1.469527, 0, 0, 1, 1, 1,
-0.6289075, 0.7680502, -0.3387906, 1, 0, 0, 1, 1,
-0.6246096, 0.9515635, -0.6480028, 1, 0, 0, 1, 1,
-0.6212124, 1.040856, 0.5471187, 1, 0, 0, 1, 1,
-0.6209975, -1.196308, -3.938178, 1, 0, 0, 1, 1,
-0.6198311, 0.1293001, -2.025184, 1, 0, 0, 1, 1,
-0.6190981, 1.237704, -2.342773, 0, 0, 0, 1, 1,
-0.6078171, -0.6335378, -2.274678, 0, 0, 0, 1, 1,
-0.6003987, 0.2564689, -2.124509, 0, 0, 0, 1, 1,
-0.5978557, 0.6787006, -0.6047711, 0, 0, 0, 1, 1,
-0.5904251, -0.1213367, -1.41477, 0, 0, 0, 1, 1,
-0.5901197, -1.562589, -3.648717, 0, 0, 0, 1, 1,
-0.5861632, 0.5321444, -1.982783, 0, 0, 0, 1, 1,
-0.5814334, 2.552629, -1.416611, 1, 1, 1, 1, 1,
-0.5800099, 1.513462, -0.7218917, 1, 1, 1, 1, 1,
-0.579829, -1.360992, -2.835825, 1, 1, 1, 1, 1,
-0.5753953, -0.9510947, -1.986065, 1, 1, 1, 1, 1,
-0.5661099, -0.1658958, -1.841474, 1, 1, 1, 1, 1,
-0.5630408, 0.008061084, 0.4048278, 1, 1, 1, 1, 1,
-0.5618847, 0.2370955, -3.786997, 1, 1, 1, 1, 1,
-0.560422, 2.282521, 0.3139582, 1, 1, 1, 1, 1,
-0.5585545, 0.8747376, 0.8357484, 1, 1, 1, 1, 1,
-0.5547605, 0.8699695, 1.225028, 1, 1, 1, 1, 1,
-0.5494406, 0.6957669, -0.9512696, 1, 1, 1, 1, 1,
-0.5479181, -2.075903, -2.620841, 1, 1, 1, 1, 1,
-0.5477806, 0.2216375, -0.8638799, 1, 1, 1, 1, 1,
-0.5435023, -0.05831584, -2.456382, 1, 1, 1, 1, 1,
-0.5342759, -1.872663, -2.492786, 1, 1, 1, 1, 1,
-0.5213873, 1.409883, -1.999837, 0, 0, 1, 1, 1,
-0.5165207, -1.503907, -2.610965, 1, 0, 0, 1, 1,
-0.5132349, 1.112624, -0.7487667, 1, 0, 0, 1, 1,
-0.5092106, 1.267761, -0.1818907, 1, 0, 0, 1, 1,
-0.5084613, 0.689477, -0.4314359, 1, 0, 0, 1, 1,
-0.5078722, -0.5294176, -1.969416, 1, 0, 0, 1, 1,
-0.5071627, -1.049424, -4.65136, 0, 0, 0, 1, 1,
-0.5038673, 0.2690667, -0.8355791, 0, 0, 0, 1, 1,
-0.5029897, -0.2973309, -1.012436, 0, 0, 0, 1, 1,
-0.5021737, -0.7196555, -1.890993, 0, 0, 0, 1, 1,
-0.5011798, -0.2670153, -0.6015774, 0, 0, 0, 1, 1,
-0.5004282, 0.7720577, -2.505781, 0, 0, 0, 1, 1,
-0.4996186, 2.751659, -0.7371046, 0, 0, 0, 1, 1,
-0.4988887, 0.3211775, -1.494864, 1, 1, 1, 1, 1,
-0.496804, -0.9709667, -3.138379, 1, 1, 1, 1, 1,
-0.4965814, 0.3071312, -1.958376, 1, 1, 1, 1, 1,
-0.4902357, 0.02921298, -1.966598, 1, 1, 1, 1, 1,
-0.487978, -1.483813, -0.7393165, 1, 1, 1, 1, 1,
-0.4853583, -0.2343757, -2.837357, 1, 1, 1, 1, 1,
-0.4824317, 0.3176213, -1.708118, 1, 1, 1, 1, 1,
-0.4794509, -0.3840452, -2.50319, 1, 1, 1, 1, 1,
-0.4793536, 1.32046, -1.218051, 1, 1, 1, 1, 1,
-0.4773717, -0.8883961, -3.100357, 1, 1, 1, 1, 1,
-0.4755293, -1.314354, -1.263718, 1, 1, 1, 1, 1,
-0.4753547, 0.8992611, -0.6757787, 1, 1, 1, 1, 1,
-0.4753498, -1.742095, -2.229858, 1, 1, 1, 1, 1,
-0.4752312, 0.6940646, -0.6202828, 1, 1, 1, 1, 1,
-0.4743466, -0.4921203, -2.228634, 1, 1, 1, 1, 1,
-0.4693889, 0.8132645, 1.356531, 0, 0, 1, 1, 1,
-0.4672646, -0.06221076, -0.8736033, 1, 0, 0, 1, 1,
-0.4667466, 0.544961, 0.1537163, 1, 0, 0, 1, 1,
-0.463651, 0.1698488, -1.602393, 1, 0, 0, 1, 1,
-0.4626279, -0.01810403, -1.791993, 1, 0, 0, 1, 1,
-0.4572519, -2.02385, -2.896869, 1, 0, 0, 1, 1,
-0.4556067, -0.1666535, -1.983565, 0, 0, 0, 1, 1,
-0.4546647, -1.623622, -1.603153, 0, 0, 0, 1, 1,
-0.4544322, 2.151099, 1.573852, 0, 0, 0, 1, 1,
-0.4523093, -0.299905, -1.489255, 0, 0, 0, 1, 1,
-0.4515437, -1.488198, -3.068685, 0, 0, 0, 1, 1,
-0.4509716, 1.382181, -0.9081333, 0, 0, 0, 1, 1,
-0.4499454, -1.0235, -3.031847, 0, 0, 0, 1, 1,
-0.4465329, 1.718773, 1.013466, 1, 1, 1, 1, 1,
-0.4462055, -0.4826007, -1.84606, 1, 1, 1, 1, 1,
-0.4456016, 1.679925, -1.863429, 1, 1, 1, 1, 1,
-0.4431477, 0.1270048, -1.568671, 1, 1, 1, 1, 1,
-0.4357255, -1.266596, -2.048043, 1, 1, 1, 1, 1,
-0.4351022, -0.47289, -3.308406, 1, 1, 1, 1, 1,
-0.4329294, -0.4124607, -3.803219, 1, 1, 1, 1, 1,
-0.4295162, -2.001693, -3.745001, 1, 1, 1, 1, 1,
-0.4288632, 1.347226, 0.7561175, 1, 1, 1, 1, 1,
-0.4284686, -0.1340786, -3.214861, 1, 1, 1, 1, 1,
-0.4266158, -3.10744, -3.999278, 1, 1, 1, 1, 1,
-0.4262187, -0.6047671, -0.9126424, 1, 1, 1, 1, 1,
-0.4261118, -0.2167986, -1.845302, 1, 1, 1, 1, 1,
-0.4233429, -0.007614886, -2.074206, 1, 1, 1, 1, 1,
-0.4230788, -0.1283752, -1.585976, 1, 1, 1, 1, 1,
-0.4220963, 1.419854, -0.09854376, 0, 0, 1, 1, 1,
-0.4128354, 2.040769, 0.7975289, 1, 0, 0, 1, 1,
-0.4127264, -1.870234, -2.808383, 1, 0, 0, 1, 1,
-0.4117123, -0.8580958, -2.870133, 1, 0, 0, 1, 1,
-0.4113831, 1.23226, -0.3337989, 1, 0, 0, 1, 1,
-0.4102712, -0.944736, -2.417181, 1, 0, 0, 1, 1,
-0.4100304, -0.6666997, -2.301051, 0, 0, 0, 1, 1,
-0.4086607, 1.344118, -0.7810502, 0, 0, 0, 1, 1,
-0.4066122, 0.358173, -2.143599, 0, 0, 0, 1, 1,
-0.4015063, 0.2505706, -1.187253, 0, 0, 0, 1, 1,
-0.4009014, -0.8824373, -3.421606, 0, 0, 0, 1, 1,
-0.3983185, -0.476395, -2.923303, 0, 0, 0, 1, 1,
-0.3973962, -2.560954, -2.034675, 0, 0, 0, 1, 1,
-0.3973667, -1.98465, -1.77852, 1, 1, 1, 1, 1,
-0.3966795, -0.22904, -2.532605, 1, 1, 1, 1, 1,
-0.3932248, -0.4964685, -2.965097, 1, 1, 1, 1, 1,
-0.3926646, 1.148513, -0.697534, 1, 1, 1, 1, 1,
-0.3919826, -0.4386027, -2.173401, 1, 1, 1, 1, 1,
-0.3915549, -0.4661956, -1.683792, 1, 1, 1, 1, 1,
-0.3911051, 0.6694584, -1.433153, 1, 1, 1, 1, 1,
-0.3910425, 0.4861675, -1.273075, 1, 1, 1, 1, 1,
-0.3902798, 0.5505396, 0.3544847, 1, 1, 1, 1, 1,
-0.3899199, 0.7302793, -1.257018, 1, 1, 1, 1, 1,
-0.3739173, -1.316671, -2.76302, 1, 1, 1, 1, 1,
-0.3699485, 0.7470599, -0.2710853, 1, 1, 1, 1, 1,
-0.369052, -2.094457, -3.990167, 1, 1, 1, 1, 1,
-0.3601956, 0.6740779, -0.7795648, 1, 1, 1, 1, 1,
-0.3581137, -0.8676773, -2.469031, 1, 1, 1, 1, 1,
-0.3553489, 2.48058, 0.06021013, 0, 0, 1, 1, 1,
-0.3488663, 0.3916214, -1.255327, 1, 0, 0, 1, 1,
-0.3433782, 0.412623, -0.8161952, 1, 0, 0, 1, 1,
-0.3433586, -0.08963796, -1.237109, 1, 0, 0, 1, 1,
-0.3412962, -1.157928, -2.409942, 1, 0, 0, 1, 1,
-0.3388937, 1.099958, 2.808527, 1, 0, 0, 1, 1,
-0.3369513, 0.8291256, 0.3571233, 0, 0, 0, 1, 1,
-0.3369247, -0.7630485, -1.883798, 0, 0, 0, 1, 1,
-0.3343775, 0.4503906, -1.294228, 0, 0, 0, 1, 1,
-0.3332917, 0.3479738, -0.1469982, 0, 0, 0, 1, 1,
-0.3304346, 0.3974713, -1.011055, 0, 0, 0, 1, 1,
-0.3290955, 1.210072, 1.118993, 0, 0, 0, 1, 1,
-0.3251355, -1.261644, -2.121323, 0, 0, 0, 1, 1,
-0.3192818, 0.3128235, -0.03965781, 1, 1, 1, 1, 1,
-0.3184849, 0.380144, -1.228838, 1, 1, 1, 1, 1,
-0.317648, -1.398751, -1.533886, 1, 1, 1, 1, 1,
-0.3152893, -0.5329988, -1.53481, 1, 1, 1, 1, 1,
-0.3110312, -0.7723063, -1.010112, 1, 1, 1, 1, 1,
-0.3100552, -0.2206686, -4.96948, 1, 1, 1, 1, 1,
-0.3095051, 0.7165378, -0.2685367, 1, 1, 1, 1, 1,
-0.3071888, -1.098656, -1.681653, 1, 1, 1, 1, 1,
-0.3060096, 0.6773699, -0.02689635, 1, 1, 1, 1, 1,
-0.3044429, -0.05545817, -2.004575, 1, 1, 1, 1, 1,
-0.303799, -0.9994525, -3.171444, 1, 1, 1, 1, 1,
-0.3036028, 0.8205448, 0.6335792, 1, 1, 1, 1, 1,
-0.303181, -0.8828046, -2.341479, 1, 1, 1, 1, 1,
-0.2983281, 1.293247, -0.130328, 1, 1, 1, 1, 1,
-0.2899513, -1.195127, -1.550175, 1, 1, 1, 1, 1,
-0.2895917, -0.7529877, -3.072655, 0, 0, 1, 1, 1,
-0.2887985, -1.649275, -2.343465, 1, 0, 0, 1, 1,
-0.2887343, -0.9248668, -4.774082, 1, 0, 0, 1, 1,
-0.2865368, 1.191035, -0.2794202, 1, 0, 0, 1, 1,
-0.2853524, -0.9807987, -2.521428, 1, 0, 0, 1, 1,
-0.2845658, 0.05046397, -1.967584, 1, 0, 0, 1, 1,
-0.2815252, -1.89771, -2.846951, 0, 0, 0, 1, 1,
-0.2796801, 0.3442036, -0.07293171, 0, 0, 0, 1, 1,
-0.2790917, -1.163434, -2.998297, 0, 0, 0, 1, 1,
-0.2740155, -0.492288, -3.385874, 0, 0, 0, 1, 1,
-0.271742, 0.1780659, -2.225407, 0, 0, 0, 1, 1,
-0.2711096, 0.3689292, -1.251383, 0, 0, 0, 1, 1,
-0.2704362, -0.009811243, -0.2471521, 0, 0, 0, 1, 1,
-0.2701223, 0.02480507, 1.229939, 1, 1, 1, 1, 1,
-0.2603271, 0.2757618, -0.1387378, 1, 1, 1, 1, 1,
-0.2591923, 0.9879425, -0.436953, 1, 1, 1, 1, 1,
-0.2579409, 0.152176, -1.181217, 1, 1, 1, 1, 1,
-0.2572391, -1.18179, -2.261508, 1, 1, 1, 1, 1,
-0.2551165, -2.056714, -3.229836, 1, 1, 1, 1, 1,
-0.2543986, -0.02419484, -2.064927, 1, 1, 1, 1, 1,
-0.2529396, -1.410747, -3.499703, 1, 1, 1, 1, 1,
-0.2515725, -1.033465, -2.846511, 1, 1, 1, 1, 1,
-0.2496349, 0.686992, 1.13752, 1, 1, 1, 1, 1,
-0.2443943, 0.8962145, 0.1250906, 1, 1, 1, 1, 1,
-0.2434936, 0.3346458, -0.3029517, 1, 1, 1, 1, 1,
-0.242026, -1.499081, -2.644974, 1, 1, 1, 1, 1,
-0.242, 0.9915749, -0.2178918, 1, 1, 1, 1, 1,
-0.2407636, 1.344032, -0.4007767, 1, 1, 1, 1, 1,
-0.2399249, -0.1830354, -2.447739, 0, 0, 1, 1, 1,
-0.2385395, -1.22375, -1.750277, 1, 0, 0, 1, 1,
-0.2365729, -0.3279235, -1.71105, 1, 0, 0, 1, 1,
-0.2345063, -0.5292406, -3.133542, 1, 0, 0, 1, 1,
-0.2331404, -0.366294, -3.145434, 1, 0, 0, 1, 1,
-0.231815, -0.3438737, -1.598568, 1, 0, 0, 1, 1,
-0.2315387, -0.6892492, -3.931202, 0, 0, 0, 1, 1,
-0.2211958, -0.1609323, -2.395326, 0, 0, 0, 1, 1,
-0.2211173, 0.95972, 1.260247, 0, 0, 0, 1, 1,
-0.2186042, -0.4682117, -3.560833, 0, 0, 0, 1, 1,
-0.2179787, 1.13284, 1.022732, 0, 0, 0, 1, 1,
-0.2152721, 0.1379952, 1.096174, 0, 0, 0, 1, 1,
-0.2112176, 0.6203661, 2.004413, 0, 0, 0, 1, 1,
-0.2061217, -1.478353, -2.909473, 1, 1, 1, 1, 1,
-0.2051131, -0.6386932, -3.30649, 1, 1, 1, 1, 1,
-0.2040498, 0.8154969, 1.269058, 1, 1, 1, 1, 1,
-0.2032732, 0.1580649, -1.270974, 1, 1, 1, 1, 1,
-0.1975269, -0.1062151, 0.08168519, 1, 1, 1, 1, 1,
-0.1899901, 1.167981, 0.4520425, 1, 1, 1, 1, 1,
-0.189768, 0.8760126, 0.214155, 1, 1, 1, 1, 1,
-0.1869501, 0.8983951, -1.896653, 1, 1, 1, 1, 1,
-0.1855746, 0.2052893, -1.521005, 1, 1, 1, 1, 1,
-0.1840801, 1.517875, 0.4611641, 1, 1, 1, 1, 1,
-0.1802617, 0.373501, -1.238319, 1, 1, 1, 1, 1,
-0.1773217, -0.8196276, -2.701881, 1, 1, 1, 1, 1,
-0.171908, 0.3439066, -0.05746764, 1, 1, 1, 1, 1,
-0.1701009, -0.5832499, -1.895507, 1, 1, 1, 1, 1,
-0.1680181, 0.78061, -2.758646, 1, 1, 1, 1, 1,
-0.166401, -0.1249919, -1.093604, 0, 0, 1, 1, 1,
-0.1647955, 1.165908, 0.4723568, 1, 0, 0, 1, 1,
-0.1624918, -1.027715, -1.746087, 1, 0, 0, 1, 1,
-0.1614453, -1.095095, -2.165805, 1, 0, 0, 1, 1,
-0.1608378, -0.2094955, -2.647829, 1, 0, 0, 1, 1,
-0.1558696, -0.6126786, -1.797529, 1, 0, 0, 1, 1,
-0.1445088, 1.909321, 0.0802108, 0, 0, 0, 1, 1,
-0.1443398, -0.5756471, -4.326123, 0, 0, 0, 1, 1,
-0.1425872, 0.7197801, -1.361802, 0, 0, 0, 1, 1,
-0.1342033, 0.2534553, 0.156747, 0, 0, 0, 1, 1,
-0.1326707, 0.306084, 0.7958387, 0, 0, 0, 1, 1,
-0.1231677, -0.3431723, -2.803448, 0, 0, 0, 1, 1,
-0.1224857, -0.2313628, -2.767545, 0, 0, 0, 1, 1,
-0.121543, -0.1448219, -1.782867, 1, 1, 1, 1, 1,
-0.1210407, -0.2813069, -3.626075, 1, 1, 1, 1, 1,
-0.1205819, -1.247285, -1.256928, 1, 1, 1, 1, 1,
-0.1198492, 0.09476815, -1.648311, 1, 1, 1, 1, 1,
-0.1178332, -0.6637054, -4.469541, 1, 1, 1, 1, 1,
-0.1156354, 1.793357, -0.8385468, 1, 1, 1, 1, 1,
-0.1151942, -0.2187143, -3.182971, 1, 1, 1, 1, 1,
-0.1132429, 0.08252265, -0.2645679, 1, 1, 1, 1, 1,
-0.1131131, 1.881868, 0.4153191, 1, 1, 1, 1, 1,
-0.1123476, -3.605213, -3.52628, 1, 1, 1, 1, 1,
-0.1109191, -0.9958848, -3.962682, 1, 1, 1, 1, 1,
-0.1088, -0.5220809, -2.159421, 1, 1, 1, 1, 1,
-0.1074136, -0.3098542, -1.74439, 1, 1, 1, 1, 1,
-0.1062951, -0.9462337, -4.236641, 1, 1, 1, 1, 1,
-0.1057327, 2.139903, -0.1491212, 1, 1, 1, 1, 1,
-0.1053415, -0.3217608, -2.263951, 0, 0, 1, 1, 1,
-0.1027323, 1.136062, -0.3903378, 1, 0, 0, 1, 1,
-0.1009698, -0.3355118, -3.791538, 1, 0, 0, 1, 1,
-0.1006565, 0.3016175, 1.070766, 1, 0, 0, 1, 1,
-0.1003053, 0.2280626, 0.3797239, 1, 0, 0, 1, 1,
-0.0993234, -1.140617, -1.239126, 1, 0, 0, 1, 1,
-0.09858189, 0.3716473, -1.019881, 0, 0, 0, 1, 1,
-0.09292166, 0.5789715, -1.768787, 0, 0, 0, 1, 1,
-0.09193784, 0.4487207, 1.344344, 0, 0, 0, 1, 1,
-0.0918747, 0.1890634, -0.8229452, 0, 0, 0, 1, 1,
-0.09079859, -0.6502504, -4.748127, 0, 0, 0, 1, 1,
-0.09077746, 0.5261651, 0.9632207, 0, 0, 0, 1, 1,
-0.08858349, -0.470614, -3.664664, 0, 0, 0, 1, 1,
-0.08673257, 0.2630091, -1.206356, 1, 1, 1, 1, 1,
-0.08012954, -0.2965001, -3.178972, 1, 1, 1, 1, 1,
-0.07919443, -1.423446, -3.13457, 1, 1, 1, 1, 1,
-0.0765368, -0.8396157, -2.088145, 1, 1, 1, 1, 1,
-0.07532492, -0.527216, -1.157889, 1, 1, 1, 1, 1,
-0.06661763, 1.413606, 1.167398, 1, 1, 1, 1, 1,
-0.06440173, -0.3069402, -3.18035, 1, 1, 1, 1, 1,
-0.05670947, 0.3700243, 0.7263098, 1, 1, 1, 1, 1,
-0.05646077, 0.3607479, -0.1256046, 1, 1, 1, 1, 1,
-0.05467288, 0.2323225, -1.64931, 1, 1, 1, 1, 1,
-0.05458232, -0.5345061, -4.244387, 1, 1, 1, 1, 1,
-0.05363491, 0.001521221, -1.052982, 1, 1, 1, 1, 1,
-0.04833972, -0.9072905, -4.670931, 1, 1, 1, 1, 1,
-0.04690384, 0.8967924, -0.6256924, 1, 1, 1, 1, 1,
-0.04611645, -1.777063, -2.19739, 1, 1, 1, 1, 1,
-0.04585625, 0.3237047, 0.8092806, 0, 0, 1, 1, 1,
-0.04579005, 0.9747605, -0.7570572, 1, 0, 0, 1, 1,
-0.03995487, 0.4713835, -0.2415985, 1, 0, 0, 1, 1,
-0.03866047, -0.01015605, -0.7492189, 1, 0, 0, 1, 1,
-0.03731928, 0.2123531, 0.4019688, 1, 0, 0, 1, 1,
-0.032838, -1.17384, -2.556503, 1, 0, 0, 1, 1,
-0.02936099, -1.563244, -3.410136, 0, 0, 0, 1, 1,
-0.02426265, 0.284179, -0.5251042, 0, 0, 0, 1, 1,
-0.0241421, 0.7060366, 0.007353991, 0, 0, 0, 1, 1,
-0.02222507, 0.8354355, 0.8041436, 0, 0, 0, 1, 1,
-0.01620163, -0.7498168, -2.820376, 0, 0, 0, 1, 1,
-0.01540783, 1.252157, -0.7064697, 0, 0, 0, 1, 1,
-0.01056705, -0.2550253, -3.086465, 0, 0, 0, 1, 1,
-0.00723875, -2.441492, -3.019495, 1, 1, 1, 1, 1,
-0.006740769, -0.6567411, -4.848261, 1, 1, 1, 1, 1,
-0.006303301, 0.68113, 1.030033, 1, 1, 1, 1, 1,
-0.005168656, 0.5680907, 1.114016, 1, 1, 1, 1, 1,
0.002153499, 0.007269276, -1.520226, 1, 1, 1, 1, 1,
0.007052192, -0.2441477, 3.994037, 1, 1, 1, 1, 1,
0.008021981, -0.2703004, 2.731274, 1, 1, 1, 1, 1,
0.01107627, 0.3564417, -0.2135377, 1, 1, 1, 1, 1,
0.01151146, -0.5164807, 3.772273, 1, 1, 1, 1, 1,
0.01363618, -0.07013138, 3.790079, 1, 1, 1, 1, 1,
0.01446871, 0.03113486, -0.60427, 1, 1, 1, 1, 1,
0.01480304, 0.8907923, -1.254641, 1, 1, 1, 1, 1,
0.01514762, -0.4108574, 3.303053, 1, 1, 1, 1, 1,
0.02464445, -1.683727, 2.397496, 1, 1, 1, 1, 1,
0.02650387, -0.08768591, 1.344853, 1, 1, 1, 1, 1,
0.02919469, -1.438922, 3.552991, 0, 0, 1, 1, 1,
0.03112, -1.960024, 4.062948, 1, 0, 0, 1, 1,
0.03273685, 1.350571, -0.9952945, 1, 0, 0, 1, 1,
0.04159854, 0.4840772, -0.6974778, 1, 0, 0, 1, 1,
0.04216969, 0.741656, 0.1391947, 1, 0, 0, 1, 1,
0.04295336, -0.8149101, 3.589821, 1, 0, 0, 1, 1,
0.04346635, -1.606941, 4.082683, 0, 0, 0, 1, 1,
0.04723435, -0.5809387, 1.66932, 0, 0, 0, 1, 1,
0.0513467, -2.038093, 2.397935, 0, 0, 0, 1, 1,
0.05425258, -0.8803239, 3.604477, 0, 0, 0, 1, 1,
0.05468914, -1.663029, 3.209231, 0, 0, 0, 1, 1,
0.05716525, 3.008402, 0.5281753, 0, 0, 0, 1, 1,
0.05870389, -0.1023227, 1.349327, 0, 0, 0, 1, 1,
0.06505519, -0.935775, 3.415474, 1, 1, 1, 1, 1,
0.06531301, -0.7247557, 3.331196, 1, 1, 1, 1, 1,
0.065651, -1.840487, 3.309034, 1, 1, 1, 1, 1,
0.06721468, -2.127649, 4.585344, 1, 1, 1, 1, 1,
0.06793713, -1.651143, 3.695812, 1, 1, 1, 1, 1,
0.06989899, -0.2792607, 2.995779, 1, 1, 1, 1, 1,
0.07061576, -0.6777909, 3.55757, 1, 1, 1, 1, 1,
0.07376335, -0.0217678, -0.1886003, 1, 1, 1, 1, 1,
0.07659056, -0.737554, 1.476378, 1, 1, 1, 1, 1,
0.0778454, -0.5751077, 2.895789, 1, 1, 1, 1, 1,
0.08100214, 0.1371808, 2.002725, 1, 1, 1, 1, 1,
0.08219723, -0.3473652, 5.201603, 1, 1, 1, 1, 1,
0.08254351, -0.9063409, 4.108885, 1, 1, 1, 1, 1,
0.08298407, 0.08029374, 0.8636565, 1, 1, 1, 1, 1,
0.08546944, -1.190787, 2.555996, 1, 1, 1, 1, 1,
0.08613215, 0.8857983, -0.03150521, 0, 0, 1, 1, 1,
0.08948609, -1.149543, 4.205519, 1, 0, 0, 1, 1,
0.0900749, 0.5667433, -1.317321, 1, 0, 0, 1, 1,
0.09563988, -0.9508741, 1.099423, 1, 0, 0, 1, 1,
0.09612027, 0.5096977, -0.04623874, 1, 0, 0, 1, 1,
0.1010405, -2.208659, 4.03317, 1, 0, 0, 1, 1,
0.1014369, -0.8304415, 3.584425, 0, 0, 0, 1, 1,
0.1031443, -0.1946391, 3.953397, 0, 0, 0, 1, 1,
0.1129173, -0.608707, 2.362135, 0, 0, 0, 1, 1,
0.1136676, -0.2621779, 5.524475, 0, 0, 0, 1, 1,
0.113949, -0.1155597, 0.8779635, 0, 0, 0, 1, 1,
0.1168737, -0.6647586, 3.108616, 0, 0, 0, 1, 1,
0.1205178, -1.686156, 4.681532, 0, 0, 0, 1, 1,
0.1213964, 0.4740247, 0.1287631, 1, 1, 1, 1, 1,
0.123127, 0.04890054, 1.207189, 1, 1, 1, 1, 1,
0.1274853, -1.060915, 4.351599, 1, 1, 1, 1, 1,
0.1286994, -1.243778, 3.492136, 1, 1, 1, 1, 1,
0.1293796, -0.8812179, 3.198743, 1, 1, 1, 1, 1,
0.1306328, -0.3105407, 2.467767, 1, 1, 1, 1, 1,
0.1323191, 0.2236059, 1.492334, 1, 1, 1, 1, 1,
0.1412218, -0.9668335, 1.982939, 1, 1, 1, 1, 1,
0.1443745, -0.3844129, 2.90197, 1, 1, 1, 1, 1,
0.1456472, -1.15132, 3.209507, 1, 1, 1, 1, 1,
0.1494089, -0.5061629, 3.617803, 1, 1, 1, 1, 1,
0.1544571, 0.7658728, -0.6936692, 1, 1, 1, 1, 1,
0.1575434, 0.3085431, 0.4712174, 1, 1, 1, 1, 1,
0.1582305, -0.7041833, 3.340481, 1, 1, 1, 1, 1,
0.1591395, -1.107206, 2.890688, 1, 1, 1, 1, 1,
0.1593984, -2.639017, 4.891292, 0, 0, 1, 1, 1,
0.161067, 0.7211689, -0.1068607, 1, 0, 0, 1, 1,
0.1621546, -0.9419954, 3.136512, 1, 0, 0, 1, 1,
0.1633362, -0.6174157, 3.369592, 1, 0, 0, 1, 1,
0.1693448, 0.347099, 0.6113378, 1, 0, 0, 1, 1,
0.1711356, 1.708804, 0.2884656, 1, 0, 0, 1, 1,
0.1714392, -0.317013, 2.358824, 0, 0, 0, 1, 1,
0.173247, 0.1222629, -0.2180776, 0, 0, 0, 1, 1,
0.1742858, 0.1195564, 2.912123, 0, 0, 0, 1, 1,
0.1753677, -0.4165248, 5.367983, 0, 0, 0, 1, 1,
0.178066, -1.369336, 3.279566, 0, 0, 0, 1, 1,
0.1803785, -0.3240418, 3.085511, 0, 0, 0, 1, 1,
0.185531, -0.6692083, 3.041515, 0, 0, 0, 1, 1,
0.1874819, 0.9522019, 0.8361447, 1, 1, 1, 1, 1,
0.1906901, 0.5900719, 1.208303, 1, 1, 1, 1, 1,
0.1955083, -0.3872356, 1.624258, 1, 1, 1, 1, 1,
0.1964689, 1.187188, 0.7840188, 1, 1, 1, 1, 1,
0.1967252, 1.148562, -0.1725099, 1, 1, 1, 1, 1,
0.1989153, 1.074807, 0.7021661, 1, 1, 1, 1, 1,
0.1999422, -0.3975856, 2.937036, 1, 1, 1, 1, 1,
0.2061477, -0.6815006, 1.569952, 1, 1, 1, 1, 1,
0.2106817, 0.5481958, -0.06924333, 1, 1, 1, 1, 1,
0.2124951, 0.891633, -0.4836542, 1, 1, 1, 1, 1,
0.2142137, -0.7160408, 3.252158, 1, 1, 1, 1, 1,
0.2148366, -1.844507, 3.83897, 1, 1, 1, 1, 1,
0.2178189, 0.5122479, 0.3369878, 1, 1, 1, 1, 1,
0.2194105, -0.01677469, 1.985886, 1, 1, 1, 1, 1,
0.2205233, 0.9230896, 1.32469, 1, 1, 1, 1, 1,
0.221376, 1.128273, -0.4551165, 0, 0, 1, 1, 1,
0.22716, -0.3823377, 2.98157, 1, 0, 0, 1, 1,
0.2321814, -1.041567, 3.341569, 1, 0, 0, 1, 1,
0.2380581, -0.06549594, 2.519784, 1, 0, 0, 1, 1,
0.2444889, -0.9363598, 2.652241, 1, 0, 0, 1, 1,
0.2488009, -0.7513149, 2.03555, 1, 0, 0, 1, 1,
0.2538277, -0.3542177, 3.901951, 0, 0, 0, 1, 1,
0.2546509, -0.820224, 4.593678, 0, 0, 0, 1, 1,
0.2581376, 1.212557, 0.6635907, 0, 0, 0, 1, 1,
0.2628621, -0.2237121, 3.169979, 0, 0, 0, 1, 1,
0.2639011, 0.243517, 0.4372547, 0, 0, 0, 1, 1,
0.26421, -0.04733567, 4.724747, 0, 0, 0, 1, 1,
0.2703444, 0.942957, 0.3610036, 0, 0, 0, 1, 1,
0.2725722, 0.2757713, -0.9147666, 1, 1, 1, 1, 1,
0.2749282, 0.8906789, -0.2065814, 1, 1, 1, 1, 1,
0.2776637, -1.929253, 4.784291, 1, 1, 1, 1, 1,
0.2779411, -1.058062, 2.862897, 1, 1, 1, 1, 1,
0.278253, 0.2140587, 0.9984084, 1, 1, 1, 1, 1,
0.27992, -0.5848528, 2.967256, 1, 1, 1, 1, 1,
0.2807698, 0.3620027, -0.5012433, 1, 1, 1, 1, 1,
0.2807911, -0.07986499, 0.979164, 1, 1, 1, 1, 1,
0.2840738, 0.6603769, 0.6069356, 1, 1, 1, 1, 1,
0.2866767, 0.5632138, -0.8316378, 1, 1, 1, 1, 1,
0.2881435, 1.328214, -1.700277, 1, 1, 1, 1, 1,
0.2905689, -0.2970509, 1.433215, 1, 1, 1, 1, 1,
0.2909431, -0.9600739, 2.927327, 1, 1, 1, 1, 1,
0.2920906, -0.7056168, 2.618032, 1, 1, 1, 1, 1,
0.2945805, 0.5269804, -0.4819645, 1, 1, 1, 1, 1,
0.2968005, -0.7215742, 3.113386, 0, 0, 1, 1, 1,
0.2981074, -0.8372094, 4.48867, 1, 0, 0, 1, 1,
0.3015963, -2.412043, 1.555653, 1, 0, 0, 1, 1,
0.309518, -0.5899657, 3.395586, 1, 0, 0, 1, 1,
0.3178821, 0.02631605, 1.649342, 1, 0, 0, 1, 1,
0.3190874, -1.170916, 2.422102, 1, 0, 0, 1, 1,
0.3209282, -1.002529, 2.864715, 0, 0, 0, 1, 1,
0.3245822, 0.9631793, 1.493886, 0, 0, 0, 1, 1,
0.326711, -1.235313, 0.02698791, 0, 0, 0, 1, 1,
0.3270509, 0.4360202, -0.273278, 0, 0, 0, 1, 1,
0.3292689, 1.562429, -0.622792, 0, 0, 0, 1, 1,
0.3315667, 3.035481, -0.549229, 0, 0, 0, 1, 1,
0.3357167, 2.123665, 0.2671861, 0, 0, 0, 1, 1,
0.3366575, -0.03373658, 0.5872818, 1, 1, 1, 1, 1,
0.3393464, 0.6324105, 0.2747846, 1, 1, 1, 1, 1,
0.3400477, -0.9007621, 1.741857, 1, 1, 1, 1, 1,
0.3424278, 1.166743, 1.523073, 1, 1, 1, 1, 1,
0.3446365, 0.3675197, -0.4705491, 1, 1, 1, 1, 1,
0.3448381, -0.237105, 3.52543, 1, 1, 1, 1, 1,
0.3467432, 1.149514, -0.9624331, 1, 1, 1, 1, 1,
0.3470028, -1.083335, 2.950453, 1, 1, 1, 1, 1,
0.3479856, 0.5222208, 2.980694, 1, 1, 1, 1, 1,
0.3495613, -0.6114213, 2.254462, 1, 1, 1, 1, 1,
0.3563412, -1.331078, 2.906141, 1, 1, 1, 1, 1,
0.360016, 1.638329, -0.3039161, 1, 1, 1, 1, 1,
0.3609564, -0.4907735, 2.583645, 1, 1, 1, 1, 1,
0.3609957, -0.4106971, 1.499642, 1, 1, 1, 1, 1,
0.3628731, 0.08968685, -0.1595546, 1, 1, 1, 1, 1,
0.3645425, 0.09695845, 1.58913, 0, 0, 1, 1, 1,
0.367647, 1.247139, 1.854174, 1, 0, 0, 1, 1,
0.3717639, 1.888409, 0.6443024, 1, 0, 0, 1, 1,
0.3719956, 0.6973685, 0.9662312, 1, 0, 0, 1, 1,
0.3752303, 1.325994, 0.3616673, 1, 0, 0, 1, 1,
0.3806632, -0.03765142, 1.792426, 1, 0, 0, 1, 1,
0.3811567, 1.095932, 2.530167, 0, 0, 0, 1, 1,
0.3837764, 1.431108, 0.5218541, 0, 0, 0, 1, 1,
0.3845068, 1.126239, 1.415195, 0, 0, 0, 1, 1,
0.3852014, -1.180313, 1.938249, 0, 0, 0, 1, 1,
0.3869361, 0.7001946, 1.308405, 0, 0, 0, 1, 1,
0.3876249, -2.910484, 3.17084, 0, 0, 0, 1, 1,
0.3924282, 1.924201, 2.175583, 0, 0, 0, 1, 1,
0.3938829, 0.06562258, 0.6744392, 1, 1, 1, 1, 1,
0.3966651, 0.080341, 3.340211, 1, 1, 1, 1, 1,
0.4002272, 0.221265, 1.04048, 1, 1, 1, 1, 1,
0.4009135, 0.8651104, -0.005919713, 1, 1, 1, 1, 1,
0.401783, 0.5104495, 3.266818, 1, 1, 1, 1, 1,
0.4103014, 0.0348209, 1.463254, 1, 1, 1, 1, 1,
0.4106487, 0.6522528, 0.8629388, 1, 1, 1, 1, 1,
0.4118256, 1.334121, -1.390387, 1, 1, 1, 1, 1,
0.4196366, 1.137344, 1.808436, 1, 1, 1, 1, 1,
0.4203956, -0.8258276, 2.869704, 1, 1, 1, 1, 1,
0.4221243, 0.5920309, -0.006099135, 1, 1, 1, 1, 1,
0.4255261, 0.4539712, 0.2388715, 1, 1, 1, 1, 1,
0.4292087, 0.7788998, 0.5340738, 1, 1, 1, 1, 1,
0.4392332, -0.5468156, 1.43801, 1, 1, 1, 1, 1,
0.4398388, -0.6983441, 2.577583, 1, 1, 1, 1, 1,
0.4428766, -0.2522311, 2.00358, 0, 0, 1, 1, 1,
0.4431197, 0.6692965, 0.5064889, 1, 0, 0, 1, 1,
0.4437154, -0.8901793, 2.826133, 1, 0, 0, 1, 1,
0.4438878, -1.227015, 2.858972, 1, 0, 0, 1, 1,
0.4439815, -1.50222, 2.147863, 1, 0, 0, 1, 1,
0.4449114, -0.6941395, 2.203961, 1, 0, 0, 1, 1,
0.4471447, 1.393211, 0.9433187, 0, 0, 0, 1, 1,
0.4472526, -0.2294201, 2.627592, 0, 0, 0, 1, 1,
0.4479165, 0.6053972, 1.811311, 0, 0, 0, 1, 1,
0.4496099, 1.509986, 0.3455325, 0, 0, 0, 1, 1,
0.4496618, 1.649997, 0.7673032, 0, 0, 0, 1, 1,
0.4507409, -1.858277, 0.911909, 0, 0, 0, 1, 1,
0.4517036, -0.1932029, 1.390733, 0, 0, 0, 1, 1,
0.4522337, -0.1771667, 1.393603, 1, 1, 1, 1, 1,
0.4522373, -0.893702, 1.331069, 1, 1, 1, 1, 1,
0.4585322, 0.4721771, 0.2295977, 1, 1, 1, 1, 1,
0.4659305, -0.2858458, 2.421849, 1, 1, 1, 1, 1,
0.4738843, 2.065729, 0.8500872, 1, 1, 1, 1, 1,
0.4754063, -0.4709354, 0.4094246, 1, 1, 1, 1, 1,
0.4767441, -0.03151902, 2.321609, 1, 1, 1, 1, 1,
0.4823918, -0.6535349, 1.846939, 1, 1, 1, 1, 1,
0.4884131, 1.030989, -1.457969, 1, 1, 1, 1, 1,
0.489574, -0.1287498, 1.943199, 1, 1, 1, 1, 1,
0.4909503, 0.4062873, 2.921389, 1, 1, 1, 1, 1,
0.4914466, -0.8118248, 4.237816, 1, 1, 1, 1, 1,
0.4932857, 0.3328994, 1.891149, 1, 1, 1, 1, 1,
0.5009256, 1.488923, 1.078491, 1, 1, 1, 1, 1,
0.5110428, 0.3107465, 1.998759, 1, 1, 1, 1, 1,
0.5110557, -0.4786554, 1.855534, 0, 0, 1, 1, 1,
0.5130247, 0.5400085, 0.04188764, 1, 0, 0, 1, 1,
0.5131266, -0.3260435, 1.668361, 1, 0, 0, 1, 1,
0.514891, 1.253064, -0.07414901, 1, 0, 0, 1, 1,
0.5169896, -0.9146233, 3.850403, 1, 0, 0, 1, 1,
0.5184672, 1.356333, -1.867417, 1, 0, 0, 1, 1,
0.5266219, -0.01394336, 1.055411, 0, 0, 0, 1, 1,
0.5275007, -0.8808417, 2.308272, 0, 0, 0, 1, 1,
0.5276473, -0.5085877, 3.784454, 0, 0, 0, 1, 1,
0.5289445, 1.406431, 0.4582052, 0, 0, 0, 1, 1,
0.5294586, 0.3591889, 1.130437, 0, 0, 0, 1, 1,
0.5373505, -0.411978, 1.630049, 0, 0, 0, 1, 1,
0.5457666, -0.4632046, 2.587652, 0, 0, 0, 1, 1,
0.5469534, -1.705075, 2.642871, 1, 1, 1, 1, 1,
0.5483416, -0.4001807, 1.046111, 1, 1, 1, 1, 1,
0.548709, 0.5441417, 0.6725069, 1, 1, 1, 1, 1,
0.5524509, -0.7893955, 2.8943, 1, 1, 1, 1, 1,
0.5587174, 0.2600323, 1.291203, 1, 1, 1, 1, 1,
0.5587257, 0.7231354, 1.153735, 1, 1, 1, 1, 1,
0.5690756, -0.4920577, 4.106328, 1, 1, 1, 1, 1,
0.57478, 2.842513, 0.231171, 1, 1, 1, 1, 1,
0.5790959, 0.1048567, 0.6642001, 1, 1, 1, 1, 1,
0.5796551, 0.7081069, -0.2426292, 1, 1, 1, 1, 1,
0.5808229, -0.9683749, 2.808956, 1, 1, 1, 1, 1,
0.5821965, -1.584896, 2.785316, 1, 1, 1, 1, 1,
0.5862855, 0.9818044, 0.4786712, 1, 1, 1, 1, 1,
0.5914301, 1.348502, 0.5792405, 1, 1, 1, 1, 1,
0.5914514, -0.01986238, 0.306494, 1, 1, 1, 1, 1,
0.5926865, -0.9688242, 1.852517, 0, 0, 1, 1, 1,
0.5933557, 0.1818891, 1.398672, 1, 0, 0, 1, 1,
0.5956309, 0.1483408, 1.340594, 1, 0, 0, 1, 1,
0.5959939, 1.845415, 0.2068262, 1, 0, 0, 1, 1,
0.5968243, -1.815649, 1.64744, 1, 0, 0, 1, 1,
0.6059321, -0.453087, 2.652469, 1, 0, 0, 1, 1,
0.6093991, -0.1462739, 1.955645, 0, 0, 0, 1, 1,
0.6113802, -1.391343, 1.398404, 0, 0, 0, 1, 1,
0.612602, 0.4885205, 1.060725, 0, 0, 0, 1, 1,
0.6174768, 1.832057, 1.732712, 0, 0, 0, 1, 1,
0.6180727, -0.6407092, 2.333571, 0, 0, 0, 1, 1,
0.6219054, 0.185893, 0.1881848, 0, 0, 0, 1, 1,
0.6354302, 0.4015688, 1.532104, 0, 0, 0, 1, 1,
0.6364467, 0.4522568, 1.028223, 1, 1, 1, 1, 1,
0.6416753, -0.5681206, 2.224562, 1, 1, 1, 1, 1,
0.6504792, -0.9572048, 3.375241, 1, 1, 1, 1, 1,
0.657304, -1.182894, 3.379226, 1, 1, 1, 1, 1,
0.659058, -0.5694094, 2.886041, 1, 1, 1, 1, 1,
0.6682963, -0.6161861, 2.0774, 1, 1, 1, 1, 1,
0.6705614, -0.4739315, 2.311198, 1, 1, 1, 1, 1,
0.6776186, -0.2119081, 2.387161, 1, 1, 1, 1, 1,
0.6802045, 0.08339436, 1.072091, 1, 1, 1, 1, 1,
0.6806018, -2.583576, 1.178233, 1, 1, 1, 1, 1,
0.6849564, -0.3077828, 0.9521317, 1, 1, 1, 1, 1,
0.6864251, -1.484919, 3.533738, 1, 1, 1, 1, 1,
0.6879116, -0.947326, 1.87063, 1, 1, 1, 1, 1,
0.6890346, 0.006579802, -0.2369476, 1, 1, 1, 1, 1,
0.7007002, -0.4461773, 3.375521, 1, 1, 1, 1, 1,
0.7067628, -1.520067, 1.398564, 0, 0, 1, 1, 1,
0.7187102, 1.133082, -0.9291027, 1, 0, 0, 1, 1,
0.7222465, 1.172403, 0.3480175, 1, 0, 0, 1, 1,
0.7226919, -0.3095632, 3.948225, 1, 0, 0, 1, 1,
0.7248654, 0.8471605, 0.5838645, 1, 0, 0, 1, 1,
0.7356092, -0.7791551, 2.4101, 1, 0, 0, 1, 1,
0.7426289, 0.7646306, 1.85071, 0, 0, 0, 1, 1,
0.7447305, -1.065929, 0.9165885, 0, 0, 0, 1, 1,
0.7476645, -0.09379823, 0.8881797, 0, 0, 0, 1, 1,
0.7486669, -0.1633426, 0.923683, 0, 0, 0, 1, 1,
0.7530256, -1.056722, 1.952722, 0, 0, 0, 1, 1,
0.7538261, -2.226649, 2.84728, 0, 0, 0, 1, 1,
0.7560668, -0.1461396, 3.8576, 0, 0, 0, 1, 1,
0.7564281, -0.299796, 0.6664798, 1, 1, 1, 1, 1,
0.7574587, -0.3032963, 2.727716, 1, 1, 1, 1, 1,
0.7586709, 0.03404285, -0.4081729, 1, 1, 1, 1, 1,
0.7588388, 0.3777827, 0.3149693, 1, 1, 1, 1, 1,
0.7634431, 1.232057, 0.3588634, 1, 1, 1, 1, 1,
0.7637011, 0.1621082, 2.195922, 1, 1, 1, 1, 1,
0.7657925, -0.6482403, 3.59905, 1, 1, 1, 1, 1,
0.7802078, 1.199381, -1.052163, 1, 1, 1, 1, 1,
0.7870151, 0.3732927, 2.183008, 1, 1, 1, 1, 1,
0.7903545, 0.5467013, 0.282525, 1, 1, 1, 1, 1,
0.7993954, -0.7391613, 2.77021, 1, 1, 1, 1, 1,
0.8022569, -1.603075, 3.32861, 1, 1, 1, 1, 1,
0.8028948, 0.4209264, 0.7377163, 1, 1, 1, 1, 1,
0.805905, 0.7379673, 0.7474343, 1, 1, 1, 1, 1,
0.8061393, -0.7970794, 1.832979, 1, 1, 1, 1, 1,
0.8075696, -1.069527, 3.528665, 0, 0, 1, 1, 1,
0.8103237, 0.1275808, 0.9142401, 1, 0, 0, 1, 1,
0.8151496, 0.0674348, 1.846464, 1, 0, 0, 1, 1,
0.8196277, -0.5378296, 2.454641, 1, 0, 0, 1, 1,
0.823245, -0.9274765, 2.449247, 1, 0, 0, 1, 1,
0.8250042, 0.07105511, 1.545309, 1, 0, 0, 1, 1,
0.8362824, -0.3904401, 0.4818895, 0, 0, 0, 1, 1,
0.8376752, 1.145668, 1.063243, 0, 0, 0, 1, 1,
0.8398795, 0.1547859, 0.3160974, 0, 0, 0, 1, 1,
0.8504835, -0.7815813, 1.013281, 0, 0, 0, 1, 1,
0.851885, -1.790101, 2.774778, 0, 0, 0, 1, 1,
0.8640723, 0.8625419, 1.103719, 0, 0, 0, 1, 1,
0.8654942, -1.912312, 2.206952, 0, 0, 0, 1, 1,
0.8665915, 1.747779, 1.5906, 1, 1, 1, 1, 1,
0.8678554, -0.4014994, 1.511158, 1, 1, 1, 1, 1,
0.8724961, -0.3923955, 3.231707, 1, 1, 1, 1, 1,
0.8744466, 0.0132496, 2.032401, 1, 1, 1, 1, 1,
0.8771214, -0.159609, 2.163177, 1, 1, 1, 1, 1,
0.8779608, 0.9661319, -0.3567647, 1, 1, 1, 1, 1,
0.8806407, -1.043952, 1.829475, 1, 1, 1, 1, 1,
0.8868852, -1.977377, 1.721698, 1, 1, 1, 1, 1,
0.8882136, 0.04169978, 2.40442, 1, 1, 1, 1, 1,
0.8906647, -0.2770701, 1.485055, 1, 1, 1, 1, 1,
0.898201, 1.181682, -2.349041, 1, 1, 1, 1, 1,
0.913897, 0.2175667, 1.737434, 1, 1, 1, 1, 1,
0.925309, -0.2350468, 2.112554, 1, 1, 1, 1, 1,
0.9254191, 1.550312, 1.234429, 1, 1, 1, 1, 1,
0.926239, 0.2868946, 1.890423, 1, 1, 1, 1, 1,
0.9266151, -0.1710423, 0.858126, 0, 0, 1, 1, 1,
0.9278683, 0.3831653, 1.176561, 1, 0, 0, 1, 1,
0.9333115, 1.03572, 0.7594754, 1, 0, 0, 1, 1,
0.9401388, 1.082425, 0.5646474, 1, 0, 0, 1, 1,
0.9428796, -0.6613649, 2.223067, 1, 0, 0, 1, 1,
0.9439942, 1.613775, 0.2198545, 1, 0, 0, 1, 1,
0.9483836, -0.1345622, 3.548597, 0, 0, 0, 1, 1,
0.9539482, -1.787793, 3.727681, 0, 0, 0, 1, 1,
0.9571161, 0.5802853, -0.1318109, 0, 0, 0, 1, 1,
0.95756, -0.5470286, 1.197729, 0, 0, 0, 1, 1,
0.9578099, 0.2123313, 2.589573, 0, 0, 0, 1, 1,
0.9604337, -1.368737, 2.520174, 0, 0, 0, 1, 1,
0.9625258, 0.5349731, 0.164932, 0, 0, 0, 1, 1,
0.9700442, 1.249775, -1.460405, 1, 1, 1, 1, 1,
0.9706496, -0.7080427, 1.656363, 1, 1, 1, 1, 1,
0.9729491, -2.135054, 4.237276, 1, 1, 1, 1, 1,
0.97614, 0.8628057, 2.627652, 1, 1, 1, 1, 1,
0.9863414, -0.6576914, 1.473101, 1, 1, 1, 1, 1,
0.9865606, -0.4401262, 2.142277, 1, 1, 1, 1, 1,
0.9871235, 0.7599981, 0.1126145, 1, 1, 1, 1, 1,
0.9914965, -1.212915, 1.304317, 1, 1, 1, 1, 1,
0.9916652, -2.066136, 2.845627, 1, 1, 1, 1, 1,
0.9960832, -1.127409, 0.8702102, 1, 1, 1, 1, 1,
0.9981633, -0.8717018, 2.525298, 1, 1, 1, 1, 1,
0.9992453, 0.0736518, -0.2204263, 1, 1, 1, 1, 1,
1.009769, -1.392651, 1.510868, 1, 1, 1, 1, 1,
1.011478, 0.6529174, 4.005799, 1, 1, 1, 1, 1,
1.015424, -0.262888, 1.500157, 1, 1, 1, 1, 1,
1.01824, 0.01684622, 1.553581, 0, 0, 1, 1, 1,
1.019257, -2.335788, 2.721069, 1, 0, 0, 1, 1,
1.041664, 0.08579455, 0.9974615, 1, 0, 0, 1, 1,
1.058499, 1.866487, 1.228354, 1, 0, 0, 1, 1,
1.059656, -0.7865074, 1.343029, 1, 0, 0, 1, 1,
1.060111, -0.5599624, 0.820788, 1, 0, 0, 1, 1,
1.075829, 0.1428177, 1.077553, 0, 0, 0, 1, 1,
1.082955, -0.2744353, 1.191608, 0, 0, 0, 1, 1,
1.089028, 1.073594, 1.354453, 0, 0, 0, 1, 1,
1.106587, 0.2059546, 1.542539, 0, 0, 0, 1, 1,
1.106596, 1.16985, 0.5531453, 0, 0, 0, 1, 1,
1.108657, 0.5058264, 1.555365, 0, 0, 0, 1, 1,
1.110447, -1.2161, 3.761436, 0, 0, 0, 1, 1,
1.114445, -2.280863, 1.569816, 1, 1, 1, 1, 1,
1.114535, 0.9903265, 0.8434098, 1, 1, 1, 1, 1,
1.123752, 0.1400387, 0.1902406, 1, 1, 1, 1, 1,
1.12479, 0.9598582, 1.173822, 1, 1, 1, 1, 1,
1.125044, -0.1751796, 2.981469, 1, 1, 1, 1, 1,
1.129428, -0.6122272, 4.321117, 1, 1, 1, 1, 1,
1.132428, 0.6822055, 1.046232, 1, 1, 1, 1, 1,
1.140623, -1.585494, 1.303659, 1, 1, 1, 1, 1,
1.14133, 1.729076, 1.75282, 1, 1, 1, 1, 1,
1.163132, -0.06872371, 0.7889975, 1, 1, 1, 1, 1,
1.164408, -0.159322, 0.5840551, 1, 1, 1, 1, 1,
1.16459, 0.407652, 1.346565, 1, 1, 1, 1, 1,
1.166894, -0.7448403, 2.514037, 1, 1, 1, 1, 1,
1.170821, 1.395609, 2.366049, 1, 1, 1, 1, 1,
1.183945, -0.3718084, 2.361033, 1, 1, 1, 1, 1,
1.187745, 0.1407184, 0.5217121, 0, 0, 1, 1, 1,
1.188647, -0.2793785, 1.066291, 1, 0, 0, 1, 1,
1.189698, -1.157034, 2.952142, 1, 0, 0, 1, 1,
1.191304, 0.8255312, 1.044629, 1, 0, 0, 1, 1,
1.204524, -0.1020499, 4.813231, 1, 0, 0, 1, 1,
1.2143, 0.2727329, 0.2801765, 1, 0, 0, 1, 1,
1.236799, 0.6830705, 0.8010725, 0, 0, 0, 1, 1,
1.23824, -0.1966567, 1.919987, 0, 0, 0, 1, 1,
1.241317, -0.7692927, -0.06032361, 0, 0, 0, 1, 1,
1.25217, 1.274503, 3.056706, 0, 0, 0, 1, 1,
1.256727, -0.8769288, 3.814674, 0, 0, 0, 1, 1,
1.259245, -0.8373091, 2.912853, 0, 0, 0, 1, 1,
1.2695, 0.9338323, 2.030313, 0, 0, 0, 1, 1,
1.269901, 0.4747495, 1.083662, 1, 1, 1, 1, 1,
1.278505, -0.1529234, 2.548607, 1, 1, 1, 1, 1,
1.279076, -0.470611, 3.198822, 1, 1, 1, 1, 1,
1.281554, -0.5803431, 2.747475, 1, 1, 1, 1, 1,
1.289756, 0.1093088, 2.000722, 1, 1, 1, 1, 1,
1.295173, 0.3215056, 0.4824925, 1, 1, 1, 1, 1,
1.320007, -2.142014, 3.485398, 1, 1, 1, 1, 1,
1.323493, 1.793921, 1.891072, 1, 1, 1, 1, 1,
1.329716, 0.02300871, 1.474764, 1, 1, 1, 1, 1,
1.342683, 0.7179395, 1.929244, 1, 1, 1, 1, 1,
1.346603, -0.3859595, 3.168418, 1, 1, 1, 1, 1,
1.348285, -1.098072, 0.3060585, 1, 1, 1, 1, 1,
1.353527, 1.099625, 3.006199, 1, 1, 1, 1, 1,
1.375452, 1.490634, 1.000604, 1, 1, 1, 1, 1,
1.375571, 0.7230154, 1.969229, 1, 1, 1, 1, 1,
1.378078, 0.5763207, -0.4357981, 0, 0, 1, 1, 1,
1.381618, -1.19347, 1.216114, 1, 0, 0, 1, 1,
1.396298, 0.4676678, 1.746143, 1, 0, 0, 1, 1,
1.400202, -0.3488146, 1.64134, 1, 0, 0, 1, 1,
1.415245, 2.249197, 1.296034, 1, 0, 0, 1, 1,
1.423448, -0.1552697, 1.652798, 1, 0, 0, 1, 1,
1.439117, -1.675909, 2.15273, 0, 0, 0, 1, 1,
1.440793, -0.7376974, 0.1944294, 0, 0, 0, 1, 1,
1.442523, -1.539897, 2.137589, 0, 0, 0, 1, 1,
1.446468, 1.007038, 2.268753, 0, 0, 0, 1, 1,
1.449249, -0.1427583, 3.009491, 0, 0, 0, 1, 1,
1.458387, 0.9742044, 0.7795389, 0, 0, 0, 1, 1,
1.461651, 0.1073664, 0.9994091, 0, 0, 0, 1, 1,
1.463044, 0.1320112, 1.904501, 1, 1, 1, 1, 1,
1.468408, -0.9967802, 1.220028, 1, 1, 1, 1, 1,
1.479945, 0.8078657, 0.8681237, 1, 1, 1, 1, 1,
1.485639, 1.298046, -0.5906182, 1, 1, 1, 1, 1,
1.491911, -0.1553587, 3.427227, 1, 1, 1, 1, 1,
1.492946, -0.5105207, 1.717677, 1, 1, 1, 1, 1,
1.496284, -0.606382, 0.5014186, 1, 1, 1, 1, 1,
1.497827, 1.008321, -0.2076186, 1, 1, 1, 1, 1,
1.500062, 0.05856037, 2.647513, 1, 1, 1, 1, 1,
1.516746, 0.9148694, 1.684471, 1, 1, 1, 1, 1,
1.519892, 1.191604, 1.354123, 1, 1, 1, 1, 1,
1.520485, -0.8590623, 2.275367, 1, 1, 1, 1, 1,
1.530425, 0.3501384, 3.869693, 1, 1, 1, 1, 1,
1.531363, 1.060707, -0.3676057, 1, 1, 1, 1, 1,
1.561204, 0.01698068, 3.652772, 1, 1, 1, 1, 1,
1.563004, 1.009068, -0.00543295, 0, 0, 1, 1, 1,
1.579433, 2.583061, 0.9924652, 1, 0, 0, 1, 1,
1.586222, -0.05686265, 3.486367, 1, 0, 0, 1, 1,
1.588413, 2.176328, 0.3865554, 1, 0, 0, 1, 1,
1.596537, 1.423449, 3.068392, 1, 0, 0, 1, 1,
1.612661, 0.3853752, 2.038402, 1, 0, 0, 1, 1,
1.620229, -0.8314314, 1.948493, 0, 0, 0, 1, 1,
1.628898, 0.760078, 1.535672, 0, 0, 0, 1, 1,
1.630346, 0.2996404, 0.7437924, 0, 0, 0, 1, 1,
1.636522, -0.6873375, 2.761909, 0, 0, 0, 1, 1,
1.640591, 0.4950964, 0.9385735, 0, 0, 0, 1, 1,
1.641738, -0.4924862, 0.8022518, 0, 0, 0, 1, 1,
1.645497, -0.7548281, 4.143452, 0, 0, 0, 1, 1,
1.70113, 0.6154487, 0.2988827, 1, 1, 1, 1, 1,
1.719097, 0.01736851, 0.9702359, 1, 1, 1, 1, 1,
1.726409, 2.150292, 2.520413, 1, 1, 1, 1, 1,
1.745451, 0.641671, 1.616791, 1, 1, 1, 1, 1,
1.817093, -0.6925225, 2.344362, 1, 1, 1, 1, 1,
1.817306, 0.9928566, 1.390483, 1, 1, 1, 1, 1,
1.832416, -0.9688666, 0.4365964, 1, 1, 1, 1, 1,
1.878602, 1.408391, 2.700815, 1, 1, 1, 1, 1,
1.879749, -0.2204907, -0.1952544, 1, 1, 1, 1, 1,
1.969382, 0.9666009, 0.8056644, 1, 1, 1, 1, 1,
1.988933, -0.3754805, 1.998937, 1, 1, 1, 1, 1,
1.991488, -0.4433989, 2.91505, 1, 1, 1, 1, 1,
2.007387, 1.255998, 0.1362423, 1, 1, 1, 1, 1,
2.008977, -1.30906, 1.618203, 1, 1, 1, 1, 1,
2.014332, -1.115993, 2.26014, 1, 1, 1, 1, 1,
2.022643, 0.3028783, 1.82291, 0, 0, 1, 1, 1,
2.036472, 0.4089237, 1.555061, 1, 0, 0, 1, 1,
2.042033, 0.3472626, 1.721293, 1, 0, 0, 1, 1,
2.050628, 0.6529148, 0.6952083, 1, 0, 0, 1, 1,
2.053045, -0.8470291, 3.142447, 1, 0, 0, 1, 1,
2.125568, 0.2999713, 1.204836, 1, 0, 0, 1, 1,
2.128861, -0.5065063, 2.056805, 0, 0, 0, 1, 1,
2.143023, -1.220248, 4.555912, 0, 0, 0, 1, 1,
2.148582, -0.3925486, 1.341796, 0, 0, 0, 1, 1,
2.18301, -2.041553, 2.58683, 0, 0, 0, 1, 1,
2.20548, 0.1503608, 1.158451, 0, 0, 0, 1, 1,
2.224947, -1.785549, 1.413444, 0, 0, 0, 1, 1,
2.252843, -0.363131, 2.892084, 0, 0, 0, 1, 1,
2.360169, 0.5127323, 0.9989709, 1, 1, 1, 1, 1,
2.394727, -0.327592, 0.462982, 1, 1, 1, 1, 1,
2.500405, 0.8450987, 0.7723747, 1, 1, 1, 1, 1,
2.674382, -1.187273, 0.1997194, 1, 1, 1, 1, 1,
2.685115, -0.03489556, 2.202259, 1, 1, 1, 1, 1,
2.839302, 0.1404668, 2.713446, 1, 1, 1, 1, 1,
2.904796, -0.01861011, 1.922631, 1, 1, 1, 1, 1
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
var radius = 9.431568;
var distance = 33.12798;
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
mvMatrix.translate( 0.07339108, 0.2848663, -0.2774975 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.12798);
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
