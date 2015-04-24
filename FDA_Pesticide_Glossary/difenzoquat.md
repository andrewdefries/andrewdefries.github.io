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
-3.783254, 0.01876145, -2.115451, 1, 0, 0, 1,
-3.45636, -0.84093, -2.147872, 1, 0.007843138, 0, 1,
-2.607001, 0.2586443, -0.5579967, 1, 0.01176471, 0, 1,
-2.563637, -1.534914, -1.657414, 1, 0.01960784, 0, 1,
-2.555043, -0.2747386, -1.882297, 1, 0.02352941, 0, 1,
-2.456842, 2.157122, -1.632144, 1, 0.03137255, 0, 1,
-2.332838, -0.2219718, 0.2168612, 1, 0.03529412, 0, 1,
-2.331332, -0.04173055, -1.658324, 1, 0.04313726, 0, 1,
-2.257135, 0.2965135, -1.706611, 1, 0.04705882, 0, 1,
-2.233367, 0.6543849, -0.4351476, 1, 0.05490196, 0, 1,
-2.141951, 1.171531, -0.2754067, 1, 0.05882353, 0, 1,
-2.14182, 0.8821499, 0.2940584, 1, 0.06666667, 0, 1,
-2.13798, 2.46899, -2.168092, 1, 0.07058824, 0, 1,
-2.083716, -1.109013, -3.957804, 1, 0.07843138, 0, 1,
-2.060924, -1.500456, -3.734752, 1, 0.08235294, 0, 1,
-2.056773, -0.0005280372, -2.171455, 1, 0.09019608, 0, 1,
-2.050496, -0.1139453, 0.6762769, 1, 0.09411765, 0, 1,
-2.024813, -0.5251891, -1.095638, 1, 0.1019608, 0, 1,
-2.012144, 0.3316329, -1.059077, 1, 0.1098039, 0, 1,
-1.992176, 0.8190591, -0.8117058, 1, 0.1137255, 0, 1,
-1.982107, 1.684351, -0.5218908, 1, 0.1215686, 0, 1,
-1.936881, 1.215586, 0.5219359, 1, 0.1254902, 0, 1,
-1.936623, -0.9420185, -2.712145, 1, 0.1333333, 0, 1,
-1.921944, -0.5044588, -1.056649, 1, 0.1372549, 0, 1,
-1.867103, -1.429772, -2.648799, 1, 0.145098, 0, 1,
-1.851959, 1.226725, -0.2647, 1, 0.1490196, 0, 1,
-1.806505, 0.4307771, -2.538697, 1, 0.1568628, 0, 1,
-1.793072, -0.5315567, -2.229784, 1, 0.1607843, 0, 1,
-1.781787, 0.748894, -1.50472, 1, 0.1686275, 0, 1,
-1.773302, 1.362042, -0.8271187, 1, 0.172549, 0, 1,
-1.760063, 0.5795487, -0.6020077, 1, 0.1803922, 0, 1,
-1.740362, -1.333078, -1.083864, 1, 0.1843137, 0, 1,
-1.724803, 0.1881577, -0.4634774, 1, 0.1921569, 0, 1,
-1.717477, 1.108151, -2.060375, 1, 0.1960784, 0, 1,
-1.713511, -0.09442951, -1.010965, 1, 0.2039216, 0, 1,
-1.711236, 0.3153059, -0.5983155, 1, 0.2117647, 0, 1,
-1.702144, 1.948094, -0.7234195, 1, 0.2156863, 0, 1,
-1.701653, 1.041316, -1.206691, 1, 0.2235294, 0, 1,
-1.680071, -1.296133, -1.385602, 1, 0.227451, 0, 1,
-1.679272, 0.3850776, -0.7625669, 1, 0.2352941, 0, 1,
-1.666199, -0.2539253, -1.284927, 1, 0.2392157, 0, 1,
-1.663913, -0.5763426, -2.505742, 1, 0.2470588, 0, 1,
-1.658581, 0.9449365, -1.100096, 1, 0.2509804, 0, 1,
-1.648305, 1.0418, -0.3867958, 1, 0.2588235, 0, 1,
-1.643836, 0.447777, -0.9290527, 1, 0.2627451, 0, 1,
-1.635062, -1.946471, -1.847141, 1, 0.2705882, 0, 1,
-1.62334, 1.189062, -1.638269, 1, 0.2745098, 0, 1,
-1.622411, 1.459481, -0.93987, 1, 0.282353, 0, 1,
-1.602078, 0.3337382, -2.975423, 1, 0.2862745, 0, 1,
-1.599883, 0.6014178, -2.22286, 1, 0.2941177, 0, 1,
-1.576951, 0.3880437, -2.041785, 1, 0.3019608, 0, 1,
-1.574024, 2.017461, 0.4528226, 1, 0.3058824, 0, 1,
-1.563327, -2.059528, -2.279732, 1, 0.3137255, 0, 1,
-1.53514, 0.4787611, -2.53558, 1, 0.3176471, 0, 1,
-1.525371, -0.08207816, -0.01778511, 1, 0.3254902, 0, 1,
-1.517151, 1.40655, 0.1091869, 1, 0.3294118, 0, 1,
-1.511691, -2.152761, -4.164303, 1, 0.3372549, 0, 1,
-1.507534, 1.513067, -1.109024, 1, 0.3411765, 0, 1,
-1.506388, -1.29145, -3.510514, 1, 0.3490196, 0, 1,
-1.503816, 0.6313912, -1.668437, 1, 0.3529412, 0, 1,
-1.469789, -1.603416, -2.150137, 1, 0.3607843, 0, 1,
-1.466374, 0.7486869, -0.4087192, 1, 0.3647059, 0, 1,
-1.446709, 1.221568, 0.2138664, 1, 0.372549, 0, 1,
-1.431582, -0.008027801, -2.409295, 1, 0.3764706, 0, 1,
-1.430419, 0.5465529, -0.4056794, 1, 0.3843137, 0, 1,
-1.424036, -0.1354862, 0.534043, 1, 0.3882353, 0, 1,
-1.418511, -0.7303798, -2.883929, 1, 0.3960784, 0, 1,
-1.417852, -0.003991168, -0.9406637, 1, 0.4039216, 0, 1,
-1.416037, -1.371139, -1.335836, 1, 0.4078431, 0, 1,
-1.404904, -0.07440761, -1.084029, 1, 0.4156863, 0, 1,
-1.401736, 0.5859802, -1.486347, 1, 0.4196078, 0, 1,
-1.388329, -0.09715878, -0.5103645, 1, 0.427451, 0, 1,
-1.384448, -0.4622973, -1.949535, 1, 0.4313726, 0, 1,
-1.384438, -1.180324, -1.807091, 1, 0.4392157, 0, 1,
-1.382852, -0.6028417, -3.320476, 1, 0.4431373, 0, 1,
-1.380555, 0.8054152, -0.4925209, 1, 0.4509804, 0, 1,
-1.380076, 0.8431555, -2.623957, 1, 0.454902, 0, 1,
-1.377019, -0.4338077, -1.756357, 1, 0.4627451, 0, 1,
-1.371078, 1.297808, -0.3085957, 1, 0.4666667, 0, 1,
-1.365482, -0.08130764, -1.71024, 1, 0.4745098, 0, 1,
-1.363081, 1.000701, -0.3368215, 1, 0.4784314, 0, 1,
-1.362371, 0.09280301, -0.5646372, 1, 0.4862745, 0, 1,
-1.336782, 0.885134, 0.5512056, 1, 0.4901961, 0, 1,
-1.33508, -1.74259, -3.871008, 1, 0.4980392, 0, 1,
-1.334571, -0.772104, -2.597756, 1, 0.5058824, 0, 1,
-1.329476, 0.6733717, -0.04036151, 1, 0.509804, 0, 1,
-1.324706, -1.112818, -0.4504697, 1, 0.5176471, 0, 1,
-1.320028, 0.835227, 0.3200038, 1, 0.5215687, 0, 1,
-1.315175, -1.077485, -1.804676, 1, 0.5294118, 0, 1,
-1.309057, -2.354608, -1.937089, 1, 0.5333334, 0, 1,
-1.308647, -1.098737, -2.936485, 1, 0.5411765, 0, 1,
-1.296538, -0.803367, -3.307852, 1, 0.5450981, 0, 1,
-1.286992, 0.1195895, -1.990554, 1, 0.5529412, 0, 1,
-1.286687, -0.02691192, 2.442541, 1, 0.5568628, 0, 1,
-1.268595, -0.9213076, -3.319452, 1, 0.5647059, 0, 1,
-1.257197, 0.6537371, -0.9986759, 1, 0.5686275, 0, 1,
-1.254431, -1.036806, -3.691011, 1, 0.5764706, 0, 1,
-1.253594, 2.5353, -1.310384, 1, 0.5803922, 0, 1,
-1.247789, 0.6834048, -1.584266, 1, 0.5882353, 0, 1,
-1.245755, 0.8333127, 0.2815185, 1, 0.5921569, 0, 1,
-1.244532, -0.05596565, -1.629132, 1, 0.6, 0, 1,
-1.24259, 2.265734, 1.225047, 1, 0.6078432, 0, 1,
-1.23884, 1.134538, -0.7453063, 1, 0.6117647, 0, 1,
-1.236862, 1.024415, -1.184406, 1, 0.6196079, 0, 1,
-1.235196, 1.545986, -1.014395, 1, 0.6235294, 0, 1,
-1.232854, -2.237784, -4.739191, 1, 0.6313726, 0, 1,
-1.23227, -0.3708993, -1.76097, 1, 0.6352941, 0, 1,
-1.231145, -0.6968844, -5.053908, 1, 0.6431373, 0, 1,
-1.21967, -0.0341859, -1.30605, 1, 0.6470588, 0, 1,
-1.218916, 0.6102756, -1.159169, 1, 0.654902, 0, 1,
-1.193673, -0.635721, -0.3561133, 1, 0.6588235, 0, 1,
-1.193432, -1.261532, -0.6648999, 1, 0.6666667, 0, 1,
-1.192578, -1.712524, -1.729037, 1, 0.6705883, 0, 1,
-1.19159, -0.5292406, -0.2383869, 1, 0.6784314, 0, 1,
-1.190409, 1.523479, -0.4736146, 1, 0.682353, 0, 1,
-1.189494, 3.321973, 0.4053693, 1, 0.6901961, 0, 1,
-1.185178, -2.239249, -3.854695, 1, 0.6941177, 0, 1,
-1.182932, -1.228263, -1.506722, 1, 0.7019608, 0, 1,
-1.181029, 0.1837901, -1.739933, 1, 0.7098039, 0, 1,
-1.179019, -0.2672071, -0.3393045, 1, 0.7137255, 0, 1,
-1.177509, 0.4371386, -0.3095384, 1, 0.7215686, 0, 1,
-1.148062, -1.134449, -3.564836, 1, 0.7254902, 0, 1,
-1.142662, -1.557773, -1.891757, 1, 0.7333333, 0, 1,
-1.119062, 1.072042, -0.3893004, 1, 0.7372549, 0, 1,
-1.117273, -0.3183585, -2.927801, 1, 0.7450981, 0, 1,
-1.115184, 0.7972191, -2.467279, 1, 0.7490196, 0, 1,
-1.108605, 0.4085556, -0.505357, 1, 0.7568628, 0, 1,
-1.10859, 0.02498898, -1.782748, 1, 0.7607843, 0, 1,
-1.108423, -0.2587096, -2.521525, 1, 0.7686275, 0, 1,
-1.1048, 1.641276, 1.207762, 1, 0.772549, 0, 1,
-1.102596, -0.1568168, -2.732559, 1, 0.7803922, 0, 1,
-1.099485, -0.7403729, -3.30779, 1, 0.7843137, 0, 1,
-1.098929, 0.1503675, -2.36018, 1, 0.7921569, 0, 1,
-1.092305, 0.6835901, -0.4921145, 1, 0.7960784, 0, 1,
-1.091666, 0.5271189, 0.5620719, 1, 0.8039216, 0, 1,
-1.086067, 1.079925, 0.51064, 1, 0.8117647, 0, 1,
-1.083058, -1.288336, -2.441929, 1, 0.8156863, 0, 1,
-1.080083, 0.6449498, -1.77116, 1, 0.8235294, 0, 1,
-1.077326, -0.3035181, -0.8572971, 1, 0.827451, 0, 1,
-1.073082, -0.4248904, -1.702372, 1, 0.8352941, 0, 1,
-1.072591, 0.3493974, 0.3625031, 1, 0.8392157, 0, 1,
-1.064146, 0.2742867, -0.6678215, 1, 0.8470588, 0, 1,
-1.0594, 0.09658144, -1.77244, 1, 0.8509804, 0, 1,
-1.057987, -0.02902763, 0.6729614, 1, 0.8588235, 0, 1,
-1.057931, 0.878769, -1.592699, 1, 0.8627451, 0, 1,
-1.055822, -0.1100549, -1.220675, 1, 0.8705882, 0, 1,
-1.05068, 0.3531001, -1.180813, 1, 0.8745098, 0, 1,
-1.046565, -1.035825, -2.946483, 1, 0.8823529, 0, 1,
-1.037768, 0.6849104, -1.559625, 1, 0.8862745, 0, 1,
-1.036917, -0.4986895, -1.331757, 1, 0.8941177, 0, 1,
-1.036044, -1.288617, -1.650479, 1, 0.8980392, 0, 1,
-1.03325, -0.2351148, -0.7453043, 1, 0.9058824, 0, 1,
-1.031353, 0.9311465, 0.4625141, 1, 0.9137255, 0, 1,
-1.02972, 0.6792647, -1.418771, 1, 0.9176471, 0, 1,
-1.028155, 1.704238, 0.1128273, 1, 0.9254902, 0, 1,
-1.023487, 1.071888, -1.165436, 1, 0.9294118, 0, 1,
-1.022006, 0.6427886, -0.1409962, 1, 0.9372549, 0, 1,
-1.021169, 0.1798908, -0.6521907, 1, 0.9411765, 0, 1,
-1.017944, -1.721263, -3.547235, 1, 0.9490196, 0, 1,
-1.015931, -0.2650283, -3.0861, 1, 0.9529412, 0, 1,
-1.008242, -1.309977, -2.840297, 1, 0.9607843, 0, 1,
-1.005181, -0.6830211, -2.419672, 1, 0.9647059, 0, 1,
-1.004104, -1.672768, -0.6047479, 1, 0.972549, 0, 1,
-0.999855, -0.3151771, -1.830305, 1, 0.9764706, 0, 1,
-0.9975809, 2.066531, -1.972035, 1, 0.9843137, 0, 1,
-0.967333, 0.09732385, -1.343486, 1, 0.9882353, 0, 1,
-0.9632494, 1.584697, 0.1915281, 1, 0.9960784, 0, 1,
-0.9614364, -1.238031, -2.199464, 0.9960784, 1, 0, 1,
-0.9577681, 2.665102, -0.282142, 0.9921569, 1, 0, 1,
-0.9567826, -0.01971735, -0.3234074, 0.9843137, 1, 0, 1,
-0.9442016, 0.6170957, -0.5193449, 0.9803922, 1, 0, 1,
-0.9427615, -0.02815534, -3.031511, 0.972549, 1, 0, 1,
-0.9413425, 0.7627845, -2.881257, 0.9686275, 1, 0, 1,
-0.9392721, 0.1432946, 1.115909, 0.9607843, 1, 0, 1,
-0.9387687, 2.153684, -1.717525, 0.9568627, 1, 0, 1,
-0.9372233, 0.08923331, -1.392007, 0.9490196, 1, 0, 1,
-0.9294279, -0.1774468, -2.816622, 0.945098, 1, 0, 1,
-0.9162723, 1.488819, -1.509274, 0.9372549, 1, 0, 1,
-0.9127709, -0.5136295, -1.340935, 0.9333333, 1, 0, 1,
-0.9062874, -1.902668, -3.478308, 0.9254902, 1, 0, 1,
-0.9057473, -0.9546732, -2.425577, 0.9215686, 1, 0, 1,
-0.9022518, 0.4733053, 0.5409892, 0.9137255, 1, 0, 1,
-0.888493, 0.4661827, 0.692556, 0.9098039, 1, 0, 1,
-0.887858, -1.636921, -2.398154, 0.9019608, 1, 0, 1,
-0.8771964, 0.56089, -2.599768, 0.8941177, 1, 0, 1,
-0.8613804, -0.9664177, -3.200423, 0.8901961, 1, 0, 1,
-0.8607844, 0.1344227, -2.140665, 0.8823529, 1, 0, 1,
-0.8601776, -0.4511977, -0.4416112, 0.8784314, 1, 0, 1,
-0.8591157, 0.2713781, -2.413572, 0.8705882, 1, 0, 1,
-0.8571646, -0.8796328, -2.768467, 0.8666667, 1, 0, 1,
-0.8546915, 0.6844085, 1.192471, 0.8588235, 1, 0, 1,
-0.8538172, -0.1777408, -1.532109, 0.854902, 1, 0, 1,
-0.8528603, 0.5322388, -0.06230227, 0.8470588, 1, 0, 1,
-0.8479571, -0.2073687, -0.9719313, 0.8431373, 1, 0, 1,
-0.8470556, -1.021253, -2.754153, 0.8352941, 1, 0, 1,
-0.8434343, -1.356744, -3.855927, 0.8313726, 1, 0, 1,
-0.8425984, 0.3936507, -2.768029, 0.8235294, 1, 0, 1,
-0.8413084, -1.310692, -1.255315, 0.8196079, 1, 0, 1,
-0.8385644, 0.8306115, 0.05957223, 0.8117647, 1, 0, 1,
-0.8266577, -1.464312, -3.984242, 0.8078431, 1, 0, 1,
-0.8253446, 2.371684, 0.1999981, 0.8, 1, 0, 1,
-0.82512, 0.8355304, -0.6792268, 0.7921569, 1, 0, 1,
-0.8247969, -1.049992, -2.209589, 0.7882353, 1, 0, 1,
-0.8121338, -0.1802727, -1.532457, 0.7803922, 1, 0, 1,
-0.8097903, 0.1703728, -0.5093322, 0.7764706, 1, 0, 1,
-0.8078386, 0.3748052, 0.3905277, 0.7686275, 1, 0, 1,
-0.8056745, -1.784889, -3.733301, 0.7647059, 1, 0, 1,
-0.7982205, 0.3917598, -1.181478, 0.7568628, 1, 0, 1,
-0.7960001, -1.68134, -3.308774, 0.7529412, 1, 0, 1,
-0.794478, 0.5566459, -1.049962, 0.7450981, 1, 0, 1,
-0.7918836, -0.04714737, -0.1086487, 0.7411765, 1, 0, 1,
-0.77679, 1.030209, -0.3306863, 0.7333333, 1, 0, 1,
-0.7737644, 0.421778, -1.915714, 0.7294118, 1, 0, 1,
-0.7680927, -0.5567061, -0.7546644, 0.7215686, 1, 0, 1,
-0.7657643, 0.1889728, -2.108844, 0.7176471, 1, 0, 1,
-0.7652853, -2.982021, -5.945594, 0.7098039, 1, 0, 1,
-0.7634414, 1.330796, -1.330693, 0.7058824, 1, 0, 1,
-0.7607534, 0.8983951, -1.469931, 0.6980392, 1, 0, 1,
-0.7534815, -1.355249, -2.812681, 0.6901961, 1, 0, 1,
-0.7434149, 0.3194473, -0.7580478, 0.6862745, 1, 0, 1,
-0.7418883, 0.9888234, 0.2670677, 0.6784314, 1, 0, 1,
-0.7408506, 0.005582508, -1.296575, 0.6745098, 1, 0, 1,
-0.7395929, 0.4801146, -1.818928, 0.6666667, 1, 0, 1,
-0.738849, -1.098513, -2.042445, 0.6627451, 1, 0, 1,
-0.7368491, -0.3663546, -2.561469, 0.654902, 1, 0, 1,
-0.7330452, -1.076905, -0.3672256, 0.6509804, 1, 0, 1,
-0.7280334, -0.7794222, -1.592479, 0.6431373, 1, 0, 1,
-0.7242827, -1.153324, -3.537664, 0.6392157, 1, 0, 1,
-0.7242412, 0.4166021, -1.896365, 0.6313726, 1, 0, 1,
-0.7237709, -0.3717021, -3.699409, 0.627451, 1, 0, 1,
-0.7171963, 0.3207777, 0.6842836, 0.6196079, 1, 0, 1,
-0.7152485, -0.9474593, -2.899079, 0.6156863, 1, 0, 1,
-0.7151597, 0.7231018, 0.6539324, 0.6078432, 1, 0, 1,
-0.7125707, -2.129159, -4.600203, 0.6039216, 1, 0, 1,
-0.7074178, -0.6953054, -3.325688, 0.5960785, 1, 0, 1,
-0.6997632, -1.40476, -2.578314, 0.5882353, 1, 0, 1,
-0.6985856, 0.2344297, -1.285582, 0.5843138, 1, 0, 1,
-0.6938933, -0.06893674, -2.569352, 0.5764706, 1, 0, 1,
-0.6915503, 0.3945182, -1.756364, 0.572549, 1, 0, 1,
-0.6911447, -0.3528922, -0.7789196, 0.5647059, 1, 0, 1,
-0.6844786, -0.4410158, -2.914876, 0.5607843, 1, 0, 1,
-0.679041, -0.4741955, -1.417937, 0.5529412, 1, 0, 1,
-0.6703572, -1.841962, -1.707006, 0.5490196, 1, 0, 1,
-0.6660004, -1.506128, -2.309967, 0.5411765, 1, 0, 1,
-0.6591228, -1.202125, -1.193966, 0.5372549, 1, 0, 1,
-0.6573991, -1.388864, -4.360164, 0.5294118, 1, 0, 1,
-0.6557687, -0.3080237, -2.073375, 0.5254902, 1, 0, 1,
-0.6533158, 0.5673441, -0.1903304, 0.5176471, 1, 0, 1,
-0.6530948, 0.3996336, -1.96725, 0.5137255, 1, 0, 1,
-0.6470847, 0.5323288, -1.395656, 0.5058824, 1, 0, 1,
-0.6450194, 0.3012457, -0.1900535, 0.5019608, 1, 0, 1,
-0.6392383, -1.943673, -1.125799, 0.4941176, 1, 0, 1,
-0.638537, -0.01465589, -2.125215, 0.4862745, 1, 0, 1,
-0.6358834, 0.9222073, 0.4108168, 0.4823529, 1, 0, 1,
-0.6350988, 0.4687316, -1.172778, 0.4745098, 1, 0, 1,
-0.6332326, 2.009532, 0.3067352, 0.4705882, 1, 0, 1,
-0.6289943, -1.709664, -3.535923, 0.4627451, 1, 0, 1,
-0.6268314, -0.02907122, -2.210496, 0.4588235, 1, 0, 1,
-0.6243694, -0.7771596, -3.480967, 0.4509804, 1, 0, 1,
-0.6209502, 0.1686721, -0.4699249, 0.4470588, 1, 0, 1,
-0.6193017, -1.168345, -2.818051, 0.4392157, 1, 0, 1,
-0.6123388, 0.2205978, 1.028314, 0.4352941, 1, 0, 1,
-0.6106582, -0.6197918, -3.912578, 0.427451, 1, 0, 1,
-0.6089644, 0.3665826, -0.6913348, 0.4235294, 1, 0, 1,
-0.6088647, 0.6632543, -2.112781, 0.4156863, 1, 0, 1,
-0.6066864, -0.1520424, -1.085988, 0.4117647, 1, 0, 1,
-0.6064256, 1.300839, -1.143753, 0.4039216, 1, 0, 1,
-0.5994609, 0.9269108, -0.6743858, 0.3960784, 1, 0, 1,
-0.5865654, 0.6239501, -1.824106, 0.3921569, 1, 0, 1,
-0.5845498, 0.6085588, 0.8562903, 0.3843137, 1, 0, 1,
-0.5832028, 0.6476142, -1.327775, 0.3803922, 1, 0, 1,
-0.5812767, 0.0288685, -0.803509, 0.372549, 1, 0, 1,
-0.579973, 0.9995714, -1.503086, 0.3686275, 1, 0, 1,
-0.5797688, -0.8209081, -1.882866, 0.3607843, 1, 0, 1,
-0.5687942, -1.253505, -1.882628, 0.3568628, 1, 0, 1,
-0.5598639, -2.805355, -2.916796, 0.3490196, 1, 0, 1,
-0.5588949, -1.957277, -1.647837, 0.345098, 1, 0, 1,
-0.5572473, 0.5738384, 1.193357, 0.3372549, 1, 0, 1,
-0.5557657, 0.741963, -0.5460523, 0.3333333, 1, 0, 1,
-0.555424, -0.04593689, -1.453664, 0.3254902, 1, 0, 1,
-0.5528141, 0.9119267, -0.06962488, 0.3215686, 1, 0, 1,
-0.5520422, 1.209758, 0.283677, 0.3137255, 1, 0, 1,
-0.5498933, 0.01225615, -1.200285, 0.3098039, 1, 0, 1,
-0.5492563, -1.591177, -3.24533, 0.3019608, 1, 0, 1,
-0.5492196, -1.516012, -2.36978, 0.2941177, 1, 0, 1,
-0.5486604, -0.2827852, 0.3627547, 0.2901961, 1, 0, 1,
-0.5481397, 0.01382468, -1.70232, 0.282353, 1, 0, 1,
-0.5460979, 1.813615, 0.1503199, 0.2784314, 1, 0, 1,
-0.5393833, -0.8078496, -1.234612, 0.2705882, 1, 0, 1,
-0.5379224, 0.6376901, -1.097779, 0.2666667, 1, 0, 1,
-0.5349729, 1.045725, -0.473902, 0.2588235, 1, 0, 1,
-0.5288036, -1.717064, -2.445761, 0.254902, 1, 0, 1,
-0.525902, -0.4663122, -1.460891, 0.2470588, 1, 0, 1,
-0.5231192, -0.2938854, -2.001854, 0.2431373, 1, 0, 1,
-0.5193917, 0.3440998, -1.452827, 0.2352941, 1, 0, 1,
-0.5191371, 1.727057, -1.082715, 0.2313726, 1, 0, 1,
-0.5186698, 0.07925013, -0.6600354, 0.2235294, 1, 0, 1,
-0.5183882, -0.08496892, -2.887657, 0.2196078, 1, 0, 1,
-0.51803, 1.537999, -1.893694, 0.2117647, 1, 0, 1,
-0.5176468, 1.214748, -0.5597127, 0.2078431, 1, 0, 1,
-0.5144576, -1.72872, -1.925536, 0.2, 1, 0, 1,
-0.513623, -0.003075102, 0.7374308, 0.1921569, 1, 0, 1,
-0.511568, -0.754244, -2.862582, 0.1882353, 1, 0, 1,
-0.5112571, 1.182778, -1.786799, 0.1803922, 1, 0, 1,
-0.5111896, -0.3664681, -1.705903, 0.1764706, 1, 0, 1,
-0.5106746, -0.04989266, -1.763919, 0.1686275, 1, 0, 1,
-0.508627, -1.144493, -3.081234, 0.1647059, 1, 0, 1,
-0.5062283, 0.4556423, -0.5251666, 0.1568628, 1, 0, 1,
-0.498138, 0.8914807, -1.674973, 0.1529412, 1, 0, 1,
-0.4888858, 0.4000757, -1.973982, 0.145098, 1, 0, 1,
-0.4880397, -1.885981, -4.153211, 0.1411765, 1, 0, 1,
-0.485294, 0.1875918, -1.611969, 0.1333333, 1, 0, 1,
-0.4852407, 0.5514854, -1.309322, 0.1294118, 1, 0, 1,
-0.4848472, -0.01221163, -1.322374, 0.1215686, 1, 0, 1,
-0.4771026, -1.148458, -2.341362, 0.1176471, 1, 0, 1,
-0.4759986, -1.816224, -1.954421, 0.1098039, 1, 0, 1,
-0.4738663, -1.33694, -2.514629, 0.1058824, 1, 0, 1,
-0.4719599, 1.296311, 0.2655952, 0.09803922, 1, 0, 1,
-0.4643585, 0.3764378, -0.8250623, 0.09019608, 1, 0, 1,
-0.4620142, -0.3454611, -1.968223, 0.08627451, 1, 0, 1,
-0.4611196, -1.099401, -2.049104, 0.07843138, 1, 0, 1,
-0.4603692, -1.130796, -3.231919, 0.07450981, 1, 0, 1,
-0.4596955, -0.7569805, -1.377675, 0.06666667, 1, 0, 1,
-0.4551474, 1.231173, -1.315943, 0.0627451, 1, 0, 1,
-0.4523659, -1.716639, -3.155432, 0.05490196, 1, 0, 1,
-0.4516244, 0.1108343, -0.9579023, 0.05098039, 1, 0, 1,
-0.4429679, 0.9827746, -1.329981, 0.04313726, 1, 0, 1,
-0.4405738, 0.2730945, -0.9848707, 0.03921569, 1, 0, 1,
-0.4381671, 1.122694, 0.6077914, 0.03137255, 1, 0, 1,
-0.4348057, 1.3209, -1.765194, 0.02745098, 1, 0, 1,
-0.4344221, -0.1597302, -1.683434, 0.01960784, 1, 0, 1,
-0.4331132, 0.0757193, -1.55385, 0.01568628, 1, 0, 1,
-0.4249297, -0.84735, -1.28737, 0.007843138, 1, 0, 1,
-0.4219292, 1.399932, -2.231467, 0.003921569, 1, 0, 1,
-0.4177452, 0.4783045, -0.1685847, 0, 1, 0.003921569, 1,
-0.4177318, 0.2720985, -1.121251, 0, 1, 0.01176471, 1,
-0.4158369, -0.7470548, -1.919985, 0, 1, 0.01568628, 1,
-0.4127764, -0.1246821, -1.998218, 0, 1, 0.02352941, 1,
-0.4105899, 0.3240425, 0.3990873, 0, 1, 0.02745098, 1,
-0.3999503, 0.7985429, -0.1032916, 0, 1, 0.03529412, 1,
-0.3943917, 0.009219134, -0.9508673, 0, 1, 0.03921569, 1,
-0.3940133, -0.9313948, -2.263695, 0, 1, 0.04705882, 1,
-0.3906638, -0.7277438, -2.795795, 0, 1, 0.05098039, 1,
-0.3852755, -0.4447757, -1.872787, 0, 1, 0.05882353, 1,
-0.3825625, 1.084692, -0.7200684, 0, 1, 0.0627451, 1,
-0.3818772, -1.958136, -4.226388, 0, 1, 0.07058824, 1,
-0.3808715, 0.1815979, -1.013676, 0, 1, 0.07450981, 1,
-0.3804027, -1.329227, -1.974516, 0, 1, 0.08235294, 1,
-0.380095, -2.275138, -4.232562, 0, 1, 0.08627451, 1,
-0.3773334, 0.3841947, -1.202993, 0, 1, 0.09411765, 1,
-0.3757023, -0.02825924, -1.481072, 0, 1, 0.1019608, 1,
-0.3749339, 1.327445, 0.483171, 0, 1, 0.1058824, 1,
-0.374376, 0.778176, -1.098041, 0, 1, 0.1137255, 1,
-0.3741813, 0.2555759, -1.619166, 0, 1, 0.1176471, 1,
-0.3740541, -0.566466, -0.2048466, 0, 1, 0.1254902, 1,
-0.3715314, 0.5328267, 0.09814341, 0, 1, 0.1294118, 1,
-0.3624447, -0.1613113, -3.277057, 0, 1, 0.1372549, 1,
-0.3604187, -1.158963, -2.048047, 0, 1, 0.1411765, 1,
-0.3601719, -1.385084, -2.327247, 0, 1, 0.1490196, 1,
-0.3481018, -1.501273, -3.632857, 0, 1, 0.1529412, 1,
-0.3455018, -0.6234308, -2.814207, 0, 1, 0.1607843, 1,
-0.345053, -0.1657706, -1.006208, 0, 1, 0.1647059, 1,
-0.3409773, 0.3621703, -1.025517, 0, 1, 0.172549, 1,
-0.3345812, -0.3389364, -2.374844, 0, 1, 0.1764706, 1,
-0.3339204, 1.164708, 0.4327597, 0, 1, 0.1843137, 1,
-0.3257582, 0.4661052, -1.085396, 0, 1, 0.1882353, 1,
-0.3249605, -0.2594596, -0.7103252, 0, 1, 0.1960784, 1,
-0.309963, -0.4795998, -3.780394, 0, 1, 0.2039216, 1,
-0.3028009, -0.99149, -1.622213, 0, 1, 0.2078431, 1,
-0.2996968, 0.39907, 0.619837, 0, 1, 0.2156863, 1,
-0.2988169, -1.60643, -2.703381, 0, 1, 0.2196078, 1,
-0.2986591, 2.201293, -0.6192895, 0, 1, 0.227451, 1,
-0.2924529, 1.199784, -1.890108, 0, 1, 0.2313726, 1,
-0.2848562, 0.8503857, 0.611464, 0, 1, 0.2392157, 1,
-0.2825252, -1.864699, -2.909422, 0, 1, 0.2431373, 1,
-0.2807368, -0.5312011, -2.470452, 0, 1, 0.2509804, 1,
-0.2763343, -1.318691, -2.028732, 0, 1, 0.254902, 1,
-0.2693729, 1.550862, -0.477753, 0, 1, 0.2627451, 1,
-0.2687818, -0.3835113, -4.139566, 0, 1, 0.2666667, 1,
-0.2639678, 0.5118293, -1.748737, 0, 1, 0.2745098, 1,
-0.2639591, -0.1699038, -2.231581, 0, 1, 0.2784314, 1,
-0.2624268, 0.4881586, -0.5406868, 0, 1, 0.2862745, 1,
-0.2612981, 0.543031, 0.3515065, 0, 1, 0.2901961, 1,
-0.2610996, 0.3818819, -0.5434383, 0, 1, 0.2980392, 1,
-0.2591216, 0.9548911, 0.6901802, 0, 1, 0.3058824, 1,
-0.2561384, 1.051041, -1.863234, 0, 1, 0.3098039, 1,
-0.2558942, -0.4344994, -2.078771, 0, 1, 0.3176471, 1,
-0.2539005, 0.8440411, -0.3098801, 0, 1, 0.3215686, 1,
-0.2519706, 0.893137, -0.7346569, 0, 1, 0.3294118, 1,
-0.2466519, 0.1315328, -2.5483, 0, 1, 0.3333333, 1,
-0.2394609, 0.4207023, -1.754459, 0, 1, 0.3411765, 1,
-0.2344571, 1.687739, -2.518376, 0, 1, 0.345098, 1,
-0.2320722, 0.2133986, -2.828328, 0, 1, 0.3529412, 1,
-0.2315891, -3.478565, -2.61075, 0, 1, 0.3568628, 1,
-0.2275657, -2.137882, -4.661994, 0, 1, 0.3647059, 1,
-0.2251101, 0.769198, 0.6715606, 0, 1, 0.3686275, 1,
-0.2236352, -0.4579067, -1.636064, 0, 1, 0.3764706, 1,
-0.2234395, 0.4072393, -0.3733746, 0, 1, 0.3803922, 1,
-0.221923, 0.1105762, -0.2553437, 0, 1, 0.3882353, 1,
-0.2215736, -0.4875371, -3.946568, 0, 1, 0.3921569, 1,
-0.220288, -2.300592, -2.518003, 0, 1, 0.4, 1,
-0.2201833, 1.044937, -0.2113591, 0, 1, 0.4078431, 1,
-0.2190583, -0.5876676, -2.393771, 0, 1, 0.4117647, 1,
-0.2181544, -0.4432178, -3.433686, 0, 1, 0.4196078, 1,
-0.2166429, 0.9927959, -0.4762126, 0, 1, 0.4235294, 1,
-0.2135586, 0.09572957, -2.848703, 0, 1, 0.4313726, 1,
-0.2101778, 1.774264, 1.124736, 0, 1, 0.4352941, 1,
-0.2021996, -1.771642, -4.537355, 0, 1, 0.4431373, 1,
-0.2011229, 0.01300022, -0.9325781, 0, 1, 0.4470588, 1,
-0.1988833, -1.270336, -0.1032964, 0, 1, 0.454902, 1,
-0.1971968, -0.2406959, -1.733464, 0, 1, 0.4588235, 1,
-0.1962937, 0.1188536, -2.008941, 0, 1, 0.4666667, 1,
-0.1958926, 0.6608399, -1.558599, 0, 1, 0.4705882, 1,
-0.1918079, -0.1291843, -2.361629, 0, 1, 0.4784314, 1,
-0.191445, 0.3658322, -3.37341, 0, 1, 0.4823529, 1,
-0.1897132, 1.063209, -0.813142, 0, 1, 0.4901961, 1,
-0.1873218, 0.1192227, -1.516147, 0, 1, 0.4941176, 1,
-0.182755, -1.112225, -1.3394, 0, 1, 0.5019608, 1,
-0.179101, -0.3590859, -3.826397, 0, 1, 0.509804, 1,
-0.1773489, -1.81388, -0.2514618, 0, 1, 0.5137255, 1,
-0.1738914, 1.174278, 0.6101101, 0, 1, 0.5215687, 1,
-0.1707044, -1.284077, -2.014887, 0, 1, 0.5254902, 1,
-0.1702493, 0.6401346, -0.5319986, 0, 1, 0.5333334, 1,
-0.1648793, -2.083297, -1.504784, 0, 1, 0.5372549, 1,
-0.1630534, 0.5762298, -1.348168, 0, 1, 0.5450981, 1,
-0.1613481, 0.6645791, 0.01503964, 0, 1, 0.5490196, 1,
-0.1589208, 1.587375, 0.4060773, 0, 1, 0.5568628, 1,
-0.1587357, -1.769264, -3.733547, 0, 1, 0.5607843, 1,
-0.1574951, 0.6507381, -0.9250634, 0, 1, 0.5686275, 1,
-0.1527233, 0.631192, 2.17906, 0, 1, 0.572549, 1,
-0.1508911, 2.604486, 0.07510606, 0, 1, 0.5803922, 1,
-0.1501594, 0.4807153, 0.7530488, 0, 1, 0.5843138, 1,
-0.1422489, 0.4149731, -0.3854899, 0, 1, 0.5921569, 1,
-0.1384788, -1.625745, -3.728542, 0, 1, 0.5960785, 1,
-0.1362683, 0.4417753, -0.2070376, 0, 1, 0.6039216, 1,
-0.1361776, 0.1427299, -1.652724, 0, 1, 0.6117647, 1,
-0.1332183, -0.2166286, -3.684606, 0, 1, 0.6156863, 1,
-0.1329656, 1.186458, 0.1276425, 0, 1, 0.6235294, 1,
-0.1325363, 0.8916979, -1.007341, 0, 1, 0.627451, 1,
-0.1316967, -0.3288139, -3.70161, 0, 1, 0.6352941, 1,
-0.1262459, 0.03561452, -1.956801, 0, 1, 0.6392157, 1,
-0.1226708, -0.3614846, -2.768615, 0, 1, 0.6470588, 1,
-0.1203608, -0.3924348, -3.534303, 0, 1, 0.6509804, 1,
-0.1201655, 0.1457012, -0.6699778, 0, 1, 0.6588235, 1,
-0.1191039, -0.1146642, -2.824729, 0, 1, 0.6627451, 1,
-0.1151581, -0.03564497, -1.487093, 0, 1, 0.6705883, 1,
-0.1127752, -1.083255, -3.506489, 0, 1, 0.6745098, 1,
-0.1102799, 0.8581221, -1.230829, 0, 1, 0.682353, 1,
-0.1097308, 1.07134, 0.7674137, 0, 1, 0.6862745, 1,
-0.1097016, 0.2448698, 0.4993626, 0, 1, 0.6941177, 1,
-0.1079807, -0.9242136, -3.919745, 0, 1, 0.7019608, 1,
-0.1067238, -0.003234657, -1.178743, 0, 1, 0.7058824, 1,
-0.102341, 0.07534212, -0.3339787, 0, 1, 0.7137255, 1,
-0.1017248, 0.4928624, 1.416916, 0, 1, 0.7176471, 1,
-0.1010946, 0.4492943, 0.8111387, 0, 1, 0.7254902, 1,
-0.1003474, 0.158995, -3.023241, 0, 1, 0.7294118, 1,
-0.09875445, 1.027543, -0.5797599, 0, 1, 0.7372549, 1,
-0.0972617, -0.6719825, -1.198905, 0, 1, 0.7411765, 1,
-0.09156211, 1.771924, 0.8049192, 0, 1, 0.7490196, 1,
-0.08888122, -1.949916, -1.24409, 0, 1, 0.7529412, 1,
-0.08809197, 0.765284, -0.7957766, 0, 1, 0.7607843, 1,
-0.08638763, 0.4171528, -0.1391066, 0, 1, 0.7647059, 1,
-0.08472842, -1.631239, -3.404382, 0, 1, 0.772549, 1,
-0.08456346, -0.5813364, -4.312699, 0, 1, 0.7764706, 1,
-0.08223513, 0.3028466, -1.202376, 0, 1, 0.7843137, 1,
-0.07774227, -0.2482839, -2.534306, 0, 1, 0.7882353, 1,
-0.07208046, -0.08601079, -0.9008005, 0, 1, 0.7960784, 1,
-0.06869107, 0.0592883, -1.27859, 0, 1, 0.8039216, 1,
-0.06624622, 0.1360094, -1.907435, 0, 1, 0.8078431, 1,
-0.06477959, 0.5802914, -0.5817761, 0, 1, 0.8156863, 1,
-0.06370564, 0.1460423, -1.431348, 0, 1, 0.8196079, 1,
-0.06131178, 0.7879015, -0.6661116, 0, 1, 0.827451, 1,
-0.05760211, -0.03691351, -1.38556, 0, 1, 0.8313726, 1,
-0.05683848, -0.8471485, -2.900314, 0, 1, 0.8392157, 1,
-0.05582129, 2.323262, 0.00860491, 0, 1, 0.8431373, 1,
-0.05500442, 0.4893566, 0.8738504, 0, 1, 0.8509804, 1,
-0.0545073, -1.275008, -3.790834, 0, 1, 0.854902, 1,
-0.04962776, 0.1284342, -0.3866798, 0, 1, 0.8627451, 1,
-0.04239503, -1.814604, -4.275691, 0, 1, 0.8666667, 1,
-0.0419579, 0.08953971, -0.419756, 0, 1, 0.8745098, 1,
-0.04131666, 0.07810013, 0.7820321, 0, 1, 0.8784314, 1,
-0.04121082, 0.006908237, -2.382428, 0, 1, 0.8862745, 1,
-0.04020251, -1.366013, -2.811985, 0, 1, 0.8901961, 1,
-0.0400805, 0.2520712, -1.148672, 0, 1, 0.8980392, 1,
-0.0392068, 0.4014175, 2.564735, 0, 1, 0.9058824, 1,
-0.03859096, 2.335317, 0.3163125, 0, 1, 0.9098039, 1,
-0.03739411, -1.642971, -1.757005, 0, 1, 0.9176471, 1,
-0.03639341, -0.5919552, -2.504233, 0, 1, 0.9215686, 1,
-0.03368871, 1.72827, -0.2910377, 0, 1, 0.9294118, 1,
-0.03228701, -0.2165256, -3.328165, 0, 1, 0.9333333, 1,
-0.03088583, 0.0001518282, -1.133976, 0, 1, 0.9411765, 1,
-0.03081457, -0.1379173, -1.433371, 0, 1, 0.945098, 1,
-0.02913888, -0.0294936, -2.243865, 0, 1, 0.9529412, 1,
-0.02856763, -1.140264, -3.02132, 0, 1, 0.9568627, 1,
-0.026427, 0.2023946, -0.1039304, 0, 1, 0.9647059, 1,
-0.02622714, -0.09402224, -3.739479, 0, 1, 0.9686275, 1,
-0.02559373, 0.2854129, -0.8993041, 0, 1, 0.9764706, 1,
-0.01416895, 1.10538, -0.09773097, 0, 1, 0.9803922, 1,
-0.01378962, 0.5023264, 0.6043063, 0, 1, 0.9882353, 1,
-0.01264251, -0.4693981, -3.552523, 0, 1, 0.9921569, 1,
-0.01156776, 0.8839138, -1.132481, 0, 1, 1, 1,
-0.01011662, -0.09019163, -2.424046, 0, 0.9921569, 1, 1,
-0.009935969, 0.9258732, 0.0568472, 0, 0.9882353, 1, 1,
-0.006351379, 1.393494, -0.1456576, 0, 0.9803922, 1, 1,
-0.005420228, 0.6538999, -0.1116363, 0, 0.9764706, 1, 1,
-0.00497025, 1.16548, 0.9669332, 0, 0.9686275, 1, 1,
-0.0005802152, 0.2768099, -0.9135501, 0, 0.9647059, 1, 1,
0.002882535, -0.9752254, 4.073225, 0, 0.9568627, 1, 1,
0.004473203, -0.8801042, 2.301536, 0, 0.9529412, 1, 1,
0.006793048, -0.1112691, 1.719894, 0, 0.945098, 1, 1,
0.006802348, 0.7667581, -0.3651651, 0, 0.9411765, 1, 1,
0.009367459, -1.500004, 0.7941432, 0, 0.9333333, 1, 1,
0.01220701, 0.06672964, 0.07342163, 0, 0.9294118, 1, 1,
0.01713377, -1.236301, 3.337379, 0, 0.9215686, 1, 1,
0.01881325, 0.3155901, -0.5536652, 0, 0.9176471, 1, 1,
0.02020195, 0.02588129, 1.580212, 0, 0.9098039, 1, 1,
0.02227076, 1.846346, 0.8406695, 0, 0.9058824, 1, 1,
0.02727771, 0.729843, 0.1546632, 0, 0.8980392, 1, 1,
0.02745485, -0.4735493, 3.0149, 0, 0.8901961, 1, 1,
0.02904007, -0.5015187, 4.092387, 0, 0.8862745, 1, 1,
0.02977477, -1.198553, 1.76818, 0, 0.8784314, 1, 1,
0.03056813, -1.476502, 3.189935, 0, 0.8745098, 1, 1,
0.0311564, -0.02808649, 3.084059, 0, 0.8666667, 1, 1,
0.03145146, -0.6361669, 2.320045, 0, 0.8627451, 1, 1,
0.03164178, 0.05246976, 1.195916, 0, 0.854902, 1, 1,
0.03480242, 0.7227176, -1.143556, 0, 0.8509804, 1, 1,
0.03809892, -0.04382353, 2.653404, 0, 0.8431373, 1, 1,
0.04566996, -0.06038805, -0.2067494, 0, 0.8392157, 1, 1,
0.04963922, -0.831131, 3.664572, 0, 0.8313726, 1, 1,
0.05084159, 0.4112075, 2.394336, 0, 0.827451, 1, 1,
0.0512644, -0.04808189, 1.882466, 0, 0.8196079, 1, 1,
0.05319273, 0.9942054, 1.249143, 0, 0.8156863, 1, 1,
0.05375566, -0.1469485, 3.004707, 0, 0.8078431, 1, 1,
0.0547093, -0.3914561, 4.663696, 0, 0.8039216, 1, 1,
0.05588761, 0.199009, 2.028923, 0, 0.7960784, 1, 1,
0.05848624, 0.04824465, -1.49422, 0, 0.7882353, 1, 1,
0.0592863, -0.5922503, 4.119163, 0, 0.7843137, 1, 1,
0.05959136, 0.04909502, 2.438862, 0, 0.7764706, 1, 1,
0.06427684, 0.8380624, 0.03377705, 0, 0.772549, 1, 1,
0.06473187, 0.3915243, -2.100745, 0, 0.7647059, 1, 1,
0.06728529, -0.320315, 3.397728, 0, 0.7607843, 1, 1,
0.06753819, 2.409085, 1.180617, 0, 0.7529412, 1, 1,
0.07011466, -0.2727199, 3.014501, 0, 0.7490196, 1, 1,
0.0772653, 1.204255, -0.669149, 0, 0.7411765, 1, 1,
0.07888758, 0.6082882, 0.5278383, 0, 0.7372549, 1, 1,
0.07901347, 0.2554629, -0.7445716, 0, 0.7294118, 1, 1,
0.08056107, 1.021181, -0.004198188, 0, 0.7254902, 1, 1,
0.08380508, -1.556997, 2.417146, 0, 0.7176471, 1, 1,
0.08927199, -2.575593, 3.136707, 0, 0.7137255, 1, 1,
0.0906113, -0.3348328, 1.998096, 0, 0.7058824, 1, 1,
0.09642084, 1.278009, 0.3751692, 0, 0.6980392, 1, 1,
0.1030056, -1.112956, 3.602444, 0, 0.6941177, 1, 1,
0.105426, -0.8249381, 3.950906, 0, 0.6862745, 1, 1,
0.1061981, -0.6715798, 2.325935, 0, 0.682353, 1, 1,
0.1126788, -1.106874, 2.525325, 0, 0.6745098, 1, 1,
0.1157401, -0.7868171, 2.045042, 0, 0.6705883, 1, 1,
0.1159738, -0.6537259, 0.8264701, 0, 0.6627451, 1, 1,
0.1170697, -0.7328061, 2.158316, 0, 0.6588235, 1, 1,
0.1197606, -0.3746759, 4.603967, 0, 0.6509804, 1, 1,
0.1249631, 0.6436489, -0.4189847, 0, 0.6470588, 1, 1,
0.1264828, 1.423666, -0.3743561, 0, 0.6392157, 1, 1,
0.1326087, -0.6303709, 2.847791, 0, 0.6352941, 1, 1,
0.1331131, 0.1456005, 0.9695615, 0, 0.627451, 1, 1,
0.1341877, 0.7801688, 0.421215, 0, 0.6235294, 1, 1,
0.1422965, -0.8545937, 3.479293, 0, 0.6156863, 1, 1,
0.1439037, -0.2396487, 1.774801, 0, 0.6117647, 1, 1,
0.145774, -2.408819, 2.12425, 0, 0.6039216, 1, 1,
0.1473322, -0.8397383, 3.733864, 0, 0.5960785, 1, 1,
0.1488181, -0.1397999, 3.279793, 0, 0.5921569, 1, 1,
0.14896, -1.839504, 3.574063, 0, 0.5843138, 1, 1,
0.1516732, 0.2092893, 1.095007, 0, 0.5803922, 1, 1,
0.1519685, 1.261554, 1.142768, 0, 0.572549, 1, 1,
0.1564677, -0.4980042, 2.741188, 0, 0.5686275, 1, 1,
0.162506, -0.250432, 1.679525, 0, 0.5607843, 1, 1,
0.1630752, -0.4518341, 3.795504, 0, 0.5568628, 1, 1,
0.1644968, -1.393246, 1.580029, 0, 0.5490196, 1, 1,
0.1647093, -0.8981563, 3.65045, 0, 0.5450981, 1, 1,
0.1686852, -0.1240073, 1.317681, 0, 0.5372549, 1, 1,
0.1717965, -1.158757, 1.007286, 0, 0.5333334, 1, 1,
0.177226, 0.2834374, 1.606543, 0, 0.5254902, 1, 1,
0.177321, -0.4743816, 3.92328, 0, 0.5215687, 1, 1,
0.1791225, -1.573296, 3.069329, 0, 0.5137255, 1, 1,
0.1804459, -0.5133024, 2.041222, 0, 0.509804, 1, 1,
0.1807254, 1.566487, 0.1549754, 0, 0.5019608, 1, 1,
0.1808482, -0.1571627, 2.841984, 0, 0.4941176, 1, 1,
0.184243, 0.3221729, -0.6021483, 0, 0.4901961, 1, 1,
0.1869447, -0.3078305, 2.079391, 0, 0.4823529, 1, 1,
0.2006697, 0.2929275, 1.682127, 0, 0.4784314, 1, 1,
0.2067233, 1.45881, -0.4770994, 0, 0.4705882, 1, 1,
0.206846, 0.5795262, -0.5420108, 0, 0.4666667, 1, 1,
0.211112, 1.230746, 0.1814751, 0, 0.4588235, 1, 1,
0.2117529, -0.5336474, 4.37535, 0, 0.454902, 1, 1,
0.2136563, 1.33997, 0.4198603, 0, 0.4470588, 1, 1,
0.213717, -0.9737226, 2.183615, 0, 0.4431373, 1, 1,
0.2213383, -0.438455, 1.347243, 0, 0.4352941, 1, 1,
0.2248022, 1.218603, 1.022195, 0, 0.4313726, 1, 1,
0.2259744, 0.1915131, -0.0007695435, 0, 0.4235294, 1, 1,
0.234902, -0.07445731, 2.4511, 0, 0.4196078, 1, 1,
0.2354327, -0.5861748, 0.6844727, 0, 0.4117647, 1, 1,
0.2387933, -0.03746799, 1.381453, 0, 0.4078431, 1, 1,
0.2406778, -1.721227, 2.436335, 0, 0.4, 1, 1,
0.2419303, -0.9282244, 3.164947, 0, 0.3921569, 1, 1,
0.2469421, -2.509252, 1.339458, 0, 0.3882353, 1, 1,
0.2505534, -0.1777119, 0.710479, 0, 0.3803922, 1, 1,
0.2536754, -1.248686, 3.024182, 0, 0.3764706, 1, 1,
0.2663827, 0.04624387, 2.828605, 0, 0.3686275, 1, 1,
0.2673328, 0.04816614, 2.398741, 0, 0.3647059, 1, 1,
0.2676111, 0.3308168, 0.6586637, 0, 0.3568628, 1, 1,
0.2677231, 0.1244882, 1.14861, 0, 0.3529412, 1, 1,
0.267737, 0.5714037, 1.476192, 0, 0.345098, 1, 1,
0.2721868, -1.832788, 3.054821, 0, 0.3411765, 1, 1,
0.2754087, 0.5889038, -0.8478367, 0, 0.3333333, 1, 1,
0.2811279, -0.4336532, 3.818998, 0, 0.3294118, 1, 1,
0.2860748, 0.9480068, -1.424728, 0, 0.3215686, 1, 1,
0.2911796, -0.5794212, 2.561741, 0, 0.3176471, 1, 1,
0.2920229, -0.7378126, 2.220615, 0, 0.3098039, 1, 1,
0.3056361, 0.3285818, 0.4063812, 0, 0.3058824, 1, 1,
0.3065955, -0.3236554, 3.738034, 0, 0.2980392, 1, 1,
0.3101895, -0.6834903, 2.088569, 0, 0.2901961, 1, 1,
0.312328, -1.514674, 2.592495, 0, 0.2862745, 1, 1,
0.3185833, -0.9794253, 2.846197, 0, 0.2784314, 1, 1,
0.3275778, 0.2209421, 1.115648, 0, 0.2745098, 1, 1,
0.331591, -1.337693, 3.706792, 0, 0.2666667, 1, 1,
0.3367468, -0.4601446, 1.222553, 0, 0.2627451, 1, 1,
0.3367693, -0.09701979, 1.949345, 0, 0.254902, 1, 1,
0.3368053, 0.1144915, 0.5501117, 0, 0.2509804, 1, 1,
0.3411288, -0.2933015, 1.189085, 0, 0.2431373, 1, 1,
0.3489123, -0.6950665, 4.479555, 0, 0.2392157, 1, 1,
0.3514198, 0.2599897, -0.01604652, 0, 0.2313726, 1, 1,
0.3537049, 0.2490454, 1.35318, 0, 0.227451, 1, 1,
0.3565775, 0.3910983, 0.6777728, 0, 0.2196078, 1, 1,
0.3636164, 1.56378, -0.08852673, 0, 0.2156863, 1, 1,
0.3642134, 0.4245429, -0.7988313, 0, 0.2078431, 1, 1,
0.3678283, 0.8855451, 0.8662761, 0, 0.2039216, 1, 1,
0.369088, -0.7007489, 2.844586, 0, 0.1960784, 1, 1,
0.3700935, -0.866803, 3.780658, 0, 0.1882353, 1, 1,
0.3724352, 0.8789898, 2.525904, 0, 0.1843137, 1, 1,
0.3729674, 1.237905, 0.7644116, 0, 0.1764706, 1, 1,
0.3830234, 0.9308495, 1.104299, 0, 0.172549, 1, 1,
0.3953303, -0.507221, 4.625716, 0, 0.1647059, 1, 1,
0.3963275, 0.4965388, 0.875614, 0, 0.1607843, 1, 1,
0.407304, -0.1671282, 1.994538, 0, 0.1529412, 1, 1,
0.4076692, 1.675765, 0.5615919, 0, 0.1490196, 1, 1,
0.4084727, 0.2719748, 0.06064407, 0, 0.1411765, 1, 1,
0.4116952, 1.263535, -0.3156728, 0, 0.1372549, 1, 1,
0.4138028, -0.5174724, 3.056913, 0, 0.1294118, 1, 1,
0.4142284, -0.4018603, 3.827637, 0, 0.1254902, 1, 1,
0.4159526, 2.067804, 1.04624, 0, 0.1176471, 1, 1,
0.4275161, 0.04273176, 2.974054, 0, 0.1137255, 1, 1,
0.4288963, 0.3070312, 0.9941176, 0, 0.1058824, 1, 1,
0.4309982, -1.497729, 1.667668, 0, 0.09803922, 1, 1,
0.4365346, -0.7548088, 1.614415, 0, 0.09411765, 1, 1,
0.4414985, -0.02561516, 1.529672, 0, 0.08627451, 1, 1,
0.4429446, 0.9375541, 1.525509, 0, 0.08235294, 1, 1,
0.4431032, 0.5734121, 1.048042, 0, 0.07450981, 1, 1,
0.4434556, 1.067646, -2.071198, 0, 0.07058824, 1, 1,
0.4453569, -0.3559076, 1.807822, 0, 0.0627451, 1, 1,
0.4490467, -1.239325, 2.056437, 0, 0.05882353, 1, 1,
0.4508436, -0.2540857, 1.260889, 0, 0.05098039, 1, 1,
0.4534149, -0.2439781, 2.481802, 0, 0.04705882, 1, 1,
0.4573244, -0.2927364, 1.403872, 0, 0.03921569, 1, 1,
0.4587689, 0.5055592, 0.484171, 0, 0.03529412, 1, 1,
0.4610306, 0.1887007, 0.6814467, 0, 0.02745098, 1, 1,
0.4632869, 0.6650901, 0.2875462, 0, 0.02352941, 1, 1,
0.4650797, 1.391759, -0.5057319, 0, 0.01568628, 1, 1,
0.4671916, 1.324562, 0.7802347, 0, 0.01176471, 1, 1,
0.4675082, -0.3990266, 3.545695, 0, 0.003921569, 1, 1,
0.4709278, -1.736638, 4.909002, 0.003921569, 0, 1, 1,
0.4788814, 1.837658, -0.7659761, 0.007843138, 0, 1, 1,
0.4827098, 0.2508906, 0.7761174, 0.01568628, 0, 1, 1,
0.486201, 1.355172, 0.8732469, 0.01960784, 0, 1, 1,
0.4869942, -0.9354573, 1.225548, 0.02745098, 0, 1, 1,
0.4932512, 1.071198, 1.355258, 0.03137255, 0, 1, 1,
0.4992995, 0.1128867, 0.9619337, 0.03921569, 0, 1, 1,
0.500091, -1.668792, 1.259627, 0.04313726, 0, 1, 1,
0.5070722, -0.6675351, 0.629522, 0.05098039, 0, 1, 1,
0.5091903, -2.094903, 3.065583, 0.05490196, 0, 1, 1,
0.5091988, -1.134231, 3.3807, 0.0627451, 0, 1, 1,
0.5097509, 0.7876244, -1.926766, 0.06666667, 0, 1, 1,
0.5111251, 0.6256477, 2.74548, 0.07450981, 0, 1, 1,
0.5122759, -0.057816, 1.261045, 0.07843138, 0, 1, 1,
0.5122799, -0.5969248, 2.437848, 0.08627451, 0, 1, 1,
0.5154228, 0.5061787, 1.448538, 0.09019608, 0, 1, 1,
0.5188251, -0.9986901, 2.968336, 0.09803922, 0, 1, 1,
0.5225093, -0.1202649, 2.55759, 0.1058824, 0, 1, 1,
0.5225885, -0.4907353, 1.31842, 0.1098039, 0, 1, 1,
0.5230339, -0.5022902, 1.937695, 0.1176471, 0, 1, 1,
0.5341249, -0.09336508, 1.983231, 0.1215686, 0, 1, 1,
0.5341819, 1.952782, 0.5957701, 0.1294118, 0, 1, 1,
0.5352358, -0.4499539, 1.975083, 0.1333333, 0, 1, 1,
0.5415407, 0.8994616, -0.02792634, 0.1411765, 0, 1, 1,
0.5432109, 0.3424073, 0.4356001, 0.145098, 0, 1, 1,
0.5449014, 1.026694, 0.1597545, 0.1529412, 0, 1, 1,
0.5496335, 1.16534, 1.241279, 0.1568628, 0, 1, 1,
0.5519235, 0.1696512, 0.9572112, 0.1647059, 0, 1, 1,
0.5542899, 0.3213391, 0.1270235, 0.1686275, 0, 1, 1,
0.556316, -0.4010643, 1.31833, 0.1764706, 0, 1, 1,
0.5609708, 1.088505, 1.093917, 0.1803922, 0, 1, 1,
0.5638383, -0.5751265, 2.216641, 0.1882353, 0, 1, 1,
0.5700302, 0.7823328, 1.307979, 0.1921569, 0, 1, 1,
0.5701638, 0.110226, 3.156624, 0.2, 0, 1, 1,
0.5703035, 0.3856182, 2.252203, 0.2078431, 0, 1, 1,
0.570671, -0.1429227, 1.428003, 0.2117647, 0, 1, 1,
0.5717003, 0.6177107, -0.4461772, 0.2196078, 0, 1, 1,
0.5747054, -1.124017, 3.033783, 0.2235294, 0, 1, 1,
0.5778543, 2.015565, 1.054435, 0.2313726, 0, 1, 1,
0.5792771, 0.03856888, 0.1136549, 0.2352941, 0, 1, 1,
0.5812333, -3.857495, 1.983047, 0.2431373, 0, 1, 1,
0.5822484, -0.4476913, 2.064101, 0.2470588, 0, 1, 1,
0.5823413, 0.4669866, 0.6042012, 0.254902, 0, 1, 1,
0.5836133, -0.5383456, 2.413427, 0.2588235, 0, 1, 1,
0.5848892, 1.054324, -1.212972, 0.2666667, 0, 1, 1,
0.5855861, -0.1816519, 0.6953989, 0.2705882, 0, 1, 1,
0.5860552, 1.168928, -0.5885267, 0.2784314, 0, 1, 1,
0.5877339, -0.59232, 3.387239, 0.282353, 0, 1, 1,
0.5903862, -0.3356166, 1.813669, 0.2901961, 0, 1, 1,
0.5923085, -0.9418359, 2.82524, 0.2941177, 0, 1, 1,
0.5937204, 0.961987, 2.304148, 0.3019608, 0, 1, 1,
0.5981562, 0.8617021, 0.8910198, 0.3098039, 0, 1, 1,
0.5989515, 0.189461, 2.891673, 0.3137255, 0, 1, 1,
0.6000465, -1.452834, 3.97944, 0.3215686, 0, 1, 1,
0.6010553, 1.25478, 1.769989, 0.3254902, 0, 1, 1,
0.6035705, 0.01622457, -0.1922775, 0.3333333, 0, 1, 1,
0.6082063, 2.386018, 0.4741522, 0.3372549, 0, 1, 1,
0.6083898, -1.071233, 3.932007, 0.345098, 0, 1, 1,
0.6096675, -1.544675, 4.038643, 0.3490196, 0, 1, 1,
0.6171268, 0.455774, 1.462194, 0.3568628, 0, 1, 1,
0.6194341, 0.4788681, 2.547135, 0.3607843, 0, 1, 1,
0.6227799, 0.1599338, -1.065135, 0.3686275, 0, 1, 1,
0.6234761, -1.770753, 3.082689, 0.372549, 0, 1, 1,
0.6254666, 1.151591, 0.2254829, 0.3803922, 0, 1, 1,
0.6286945, -0.7084286, 0.796968, 0.3843137, 0, 1, 1,
0.6287937, 0.6613113, 1.253425, 0.3921569, 0, 1, 1,
0.6297644, -0.6189138, 1.465555, 0.3960784, 0, 1, 1,
0.6340886, 0.9425747, 0.7069428, 0.4039216, 0, 1, 1,
0.6343071, 0.28555, 0.3843442, 0.4117647, 0, 1, 1,
0.6375787, 0.7489495, 0.4717468, 0.4156863, 0, 1, 1,
0.6419428, 0.2029961, 2.5502, 0.4235294, 0, 1, 1,
0.6427972, -0.2472612, 2.060085, 0.427451, 0, 1, 1,
0.6428109, 0.5309063, -1.380455, 0.4352941, 0, 1, 1,
0.6479564, -0.3734652, 2.134084, 0.4392157, 0, 1, 1,
0.6492078, 0.6404809, 0.9627606, 0.4470588, 0, 1, 1,
0.6506094, 1.862416, 1.265474, 0.4509804, 0, 1, 1,
0.6508926, -0.4944781, 2.838827, 0.4588235, 0, 1, 1,
0.6551747, -0.2945508, 2.270691, 0.4627451, 0, 1, 1,
0.6608846, 1.301537, 2.546938, 0.4705882, 0, 1, 1,
0.670976, -0.704264, 2.855792, 0.4745098, 0, 1, 1,
0.6749356, -0.310678, 2.888618, 0.4823529, 0, 1, 1,
0.6762365, 0.3172636, 0.9046526, 0.4862745, 0, 1, 1,
0.6812293, -0.9060571, 2.918642, 0.4941176, 0, 1, 1,
0.6819496, -1.384513, 3.51496, 0.5019608, 0, 1, 1,
0.6820421, 0.3253575, 0.994703, 0.5058824, 0, 1, 1,
0.6843116, -1.503039, 3.866565, 0.5137255, 0, 1, 1,
0.692594, 0.02140426, 1.246318, 0.5176471, 0, 1, 1,
0.6937322, 1.549253, 1.361466, 0.5254902, 0, 1, 1,
0.6957519, -0.2629924, 1.624154, 0.5294118, 0, 1, 1,
0.698981, 1.150495, 0.9218974, 0.5372549, 0, 1, 1,
0.7099489, -0.6057671, 1.148896, 0.5411765, 0, 1, 1,
0.7145921, 0.5406317, 0.3620394, 0.5490196, 0, 1, 1,
0.7205704, 2.370243, -0.243965, 0.5529412, 0, 1, 1,
0.7253173, 2.11348, 0.07506205, 0.5607843, 0, 1, 1,
0.7279322, 0.1494942, 0.4386971, 0.5647059, 0, 1, 1,
0.7421803, 0.7891611, -0.03204556, 0.572549, 0, 1, 1,
0.7441106, -0.1535102, 2.92096, 0.5764706, 0, 1, 1,
0.7466971, 1.522297, 2.80755, 0.5843138, 0, 1, 1,
0.7545949, 0.9199674, -0.3384686, 0.5882353, 0, 1, 1,
0.7550188, -0.2496134, 1.640167, 0.5960785, 0, 1, 1,
0.7565414, 0.4556205, 2.86064, 0.6039216, 0, 1, 1,
0.7584707, -0.03034207, 2.82056, 0.6078432, 0, 1, 1,
0.7587038, 0.8130538, 1.60849, 0.6156863, 0, 1, 1,
0.7612154, -0.6861416, 3.215517, 0.6196079, 0, 1, 1,
0.7630503, -0.3773369, 3.365368, 0.627451, 0, 1, 1,
0.7654467, -0.03422071, 2.730858, 0.6313726, 0, 1, 1,
0.7659081, -0.4265622, 1.492993, 0.6392157, 0, 1, 1,
0.766695, 1.233348, 0.6771744, 0.6431373, 0, 1, 1,
0.7717, 1.819101, 1.904929, 0.6509804, 0, 1, 1,
0.7737969, 0.7335852, -0.03574483, 0.654902, 0, 1, 1,
0.7740431, 1.394395, 0.0497065, 0.6627451, 0, 1, 1,
0.7758517, -0.4431306, 3.809801, 0.6666667, 0, 1, 1,
0.7791434, -1.946319, 1.761309, 0.6745098, 0, 1, 1,
0.7831218, -0.005623655, 0.07132579, 0.6784314, 0, 1, 1,
0.7876052, 0.7951924, -0.4683547, 0.6862745, 0, 1, 1,
0.7879065, -0.04533854, -0.1253363, 0.6901961, 0, 1, 1,
0.7916911, 0.6085893, -0.8651869, 0.6980392, 0, 1, 1,
0.7921882, 0.2448812, 1.299886, 0.7058824, 0, 1, 1,
0.7934935, -0.5339234, 2.850691, 0.7098039, 0, 1, 1,
0.793896, -1.55387, 3.281461, 0.7176471, 0, 1, 1,
0.7963396, -0.201506, 2.421324, 0.7215686, 0, 1, 1,
0.8052577, 0.7077734, 2.548341, 0.7294118, 0, 1, 1,
0.8075649, 0.5952774, 1.793964, 0.7333333, 0, 1, 1,
0.8077404, 0.3676212, 0.02918709, 0.7411765, 0, 1, 1,
0.8093787, -1.53784, 2.791751, 0.7450981, 0, 1, 1,
0.8164127, 0.0450333, 1.183777, 0.7529412, 0, 1, 1,
0.8318552, 0.9813544, 1.56694, 0.7568628, 0, 1, 1,
0.8329114, -0.2711176, 1.919674, 0.7647059, 0, 1, 1,
0.8391617, 0.493311, 0.6685378, 0.7686275, 0, 1, 1,
0.8453251, -0.03171182, 0.3038089, 0.7764706, 0, 1, 1,
0.8464624, 0.9298437, 1.418052, 0.7803922, 0, 1, 1,
0.8474633, 1.256028, 0.5728204, 0.7882353, 0, 1, 1,
0.8496332, -2.291316, 2.461383, 0.7921569, 0, 1, 1,
0.8539885, 0.5395651, 1.368429, 0.8, 0, 1, 1,
0.8546017, 0.696754, 0.4463759, 0.8078431, 0, 1, 1,
0.8560761, 1.570919, -0.43062, 0.8117647, 0, 1, 1,
0.8564564, -0.3640379, 2.738972, 0.8196079, 0, 1, 1,
0.8661296, 1.197848, 1.658733, 0.8235294, 0, 1, 1,
0.8705829, -1.072297, 0.5580205, 0.8313726, 0, 1, 1,
0.8764388, -1.799473, 3.552374, 0.8352941, 0, 1, 1,
0.8789652, 1.234578, 1.65447, 0.8431373, 0, 1, 1,
0.8862479, -0.4460823, 1.483565, 0.8470588, 0, 1, 1,
0.8871554, -0.6959365, 2.360231, 0.854902, 0, 1, 1,
0.8907445, 0.3376038, 0.9118616, 0.8588235, 0, 1, 1,
0.8917415, -1.281706, 1.353405, 0.8666667, 0, 1, 1,
0.8941327, -1.276181, 3.242477, 0.8705882, 0, 1, 1,
0.8980066, -1.246165, 3.391295, 0.8784314, 0, 1, 1,
0.9012203, -0.4023612, 1.243545, 0.8823529, 0, 1, 1,
0.9019384, -0.9143112, 1.373529, 0.8901961, 0, 1, 1,
0.9045279, -0.2865581, 1.989082, 0.8941177, 0, 1, 1,
0.9081587, -1.574324, 2.14059, 0.9019608, 0, 1, 1,
0.9111584, 1.681044, 0.7474656, 0.9098039, 0, 1, 1,
0.9163085, 0.2162634, 0.2936692, 0.9137255, 0, 1, 1,
0.9164819, 0.9423158, 2.558789, 0.9215686, 0, 1, 1,
0.9180601, -0.8445995, 2.387936, 0.9254902, 0, 1, 1,
0.9219535, 0.07308991, 4.11501, 0.9333333, 0, 1, 1,
0.9252708, 1.719786, 0.8665649, 0.9372549, 0, 1, 1,
0.9274775, -1.324287, 0.952332, 0.945098, 0, 1, 1,
0.9283585, 0.7675906, 2.009877, 0.9490196, 0, 1, 1,
0.9285755, -0.111015, 1.462249, 0.9568627, 0, 1, 1,
0.930718, -0.4237946, 2.22197, 0.9607843, 0, 1, 1,
0.9347095, 1.649487, 0.7202737, 0.9686275, 0, 1, 1,
0.9366285, -1.222832, 2.701825, 0.972549, 0, 1, 1,
0.939612, -0.4147027, 0.4765353, 0.9803922, 0, 1, 1,
0.9407889, -0.4638927, 2.684898, 0.9843137, 0, 1, 1,
0.9461592, 0.8161586, 1.008244, 0.9921569, 0, 1, 1,
0.956053, 0.8925822, 1.480713, 0.9960784, 0, 1, 1,
0.9576676, -0.9608625, 1.362663, 1, 0, 0.9960784, 1,
0.9595448, -0.182487, 3.751001, 1, 0, 0.9882353, 1,
0.9599081, 0.9871091, 0.8575096, 1, 0, 0.9843137, 1,
0.9679748, -0.5995486, 3.083792, 1, 0, 0.9764706, 1,
0.9705234, 0.1160102, 3.510027, 1, 0, 0.972549, 1,
0.9740877, 0.4051047, 2.334318, 1, 0, 0.9647059, 1,
0.9789519, -2.086218, 6.089277, 1, 0, 0.9607843, 1,
0.9826573, -1.473487, 1.819074, 1, 0, 0.9529412, 1,
0.983155, -0.008077719, 1.678238, 1, 0, 0.9490196, 1,
0.9845882, -0.008171328, -0.741002, 1, 0, 0.9411765, 1,
0.9855402, 1.277757, 1.468683, 1, 0, 0.9372549, 1,
0.988894, -0.3004891, 3.213633, 1, 0, 0.9294118, 1,
0.9899557, 1.040228, 0.6281269, 1, 0, 0.9254902, 1,
0.996357, 0.6922678, 0.9053202, 1, 0, 0.9176471, 1,
1.007657, 0.69434, 1.555821, 1, 0, 0.9137255, 1,
1.008587, -0.2358381, 3.132066, 1, 0, 0.9058824, 1,
1.022665, -0.5328386, 1.948913, 1, 0, 0.9019608, 1,
1.023482, -0.5265793, 1.421013, 1, 0, 0.8941177, 1,
1.036422, 1.512501, -0.1809403, 1, 0, 0.8862745, 1,
1.043078, 1.868307, 1.29237, 1, 0, 0.8823529, 1,
1.053226, -0.8698846, 2.003371, 1, 0, 0.8745098, 1,
1.053288, 0.5108692, 2.223108, 1, 0, 0.8705882, 1,
1.074304, -0.7253757, 1.353351, 1, 0, 0.8627451, 1,
1.074853, 1.030463, -0.3121544, 1, 0, 0.8588235, 1,
1.075272, -2.416017, 1.911523, 1, 0, 0.8509804, 1,
1.076429, -0.9726749, 2.179537, 1, 0, 0.8470588, 1,
1.08186, -0.4168384, 1.41041, 1, 0, 0.8392157, 1,
1.082585, 0.3555491, 1.279724, 1, 0, 0.8352941, 1,
1.084209, -0.4917357, 3.429586, 1, 0, 0.827451, 1,
1.091747, -1.562395, 1.767516, 1, 0, 0.8235294, 1,
1.096923, -0.2798824, 1.848982, 1, 0, 0.8156863, 1,
1.097004, 0.02429987, 2.175696, 1, 0, 0.8117647, 1,
1.098001, 1.36161, -0.3555938, 1, 0, 0.8039216, 1,
1.099397, -2.045777, 2.478307, 1, 0, 0.7960784, 1,
1.104625, -1.645188, 2.592063, 1, 0, 0.7921569, 1,
1.104769, -0.5003991, 2.063153, 1, 0, 0.7843137, 1,
1.116854, 0.3009768, 0.757497, 1, 0, 0.7803922, 1,
1.122509, 0.03673539, 1.920756, 1, 0, 0.772549, 1,
1.143686, -1.225252, 2.21033, 1, 0, 0.7686275, 1,
1.146263, -0.0437563, 1.156383, 1, 0, 0.7607843, 1,
1.147045, -0.8330113, 2.21451, 1, 0, 0.7568628, 1,
1.1509, -0.0151209, 1.213317, 1, 0, 0.7490196, 1,
1.154863, -0.7928688, 1.317741, 1, 0, 0.7450981, 1,
1.159445, -0.534551, 1.456534, 1, 0, 0.7372549, 1,
1.16062, -0.3498403, 0.3964444, 1, 0, 0.7333333, 1,
1.167803, 0.5912339, 0.1655389, 1, 0, 0.7254902, 1,
1.169255, 0.3011896, 1.918597, 1, 0, 0.7215686, 1,
1.18402, -1.486206, 1.637143, 1, 0, 0.7137255, 1,
1.194075, 0.5958059, 0.2553217, 1, 0, 0.7098039, 1,
1.202251, -0.6056988, 0.90706, 1, 0, 0.7019608, 1,
1.204211, -0.5035409, 1.648972, 1, 0, 0.6941177, 1,
1.205928, -0.007094266, 1.832238, 1, 0, 0.6901961, 1,
1.206437, -1.244132, 3.009412, 1, 0, 0.682353, 1,
1.206641, 1.148515, -0.1199913, 1, 0, 0.6784314, 1,
1.212868, 0.06596362, 1.354693, 1, 0, 0.6705883, 1,
1.222072, -1.48518, 0.3810411, 1, 0, 0.6666667, 1,
1.223892, -1.306787, 2.653536, 1, 0, 0.6588235, 1,
1.228856, 0.1037932, 1.924067, 1, 0, 0.654902, 1,
1.229732, 0.4463632, 1.274487, 1, 0, 0.6470588, 1,
1.229933, 0.3144454, 2.168069, 1, 0, 0.6431373, 1,
1.234658, 0.5120231, 2.163827, 1, 0, 0.6352941, 1,
1.236656, 0.2988214, -0.9144861, 1, 0, 0.6313726, 1,
1.270186, 0.2808554, 0.8596735, 1, 0, 0.6235294, 1,
1.278337, -0.3162968, 2.475668, 1, 0, 0.6196079, 1,
1.279201, 1.349542, 0.5680666, 1, 0, 0.6117647, 1,
1.292595, 0.2973669, 1.092804, 1, 0, 0.6078432, 1,
1.292858, -1.23115, 2.392747, 1, 0, 0.6, 1,
1.317419, -1.279683, 1.216781, 1, 0, 0.5921569, 1,
1.323128, -0.246744, 2.324009, 1, 0, 0.5882353, 1,
1.325091, 0.02578898, 0.5938967, 1, 0, 0.5803922, 1,
1.32626, -2.484181, 4.421994, 1, 0, 0.5764706, 1,
1.326683, -1.074544, 1.676458, 1, 0, 0.5686275, 1,
1.328564, 0.460869, 0.7715442, 1, 0, 0.5647059, 1,
1.330852, 0.1294958, 0.8899817, 1, 0, 0.5568628, 1,
1.331242, 0.3618837, -0.6574646, 1, 0, 0.5529412, 1,
1.3335, -0.3110943, 2.570975, 1, 0, 0.5450981, 1,
1.333747, 0.479775, 3.306901, 1, 0, 0.5411765, 1,
1.34326, -1.310408, 1.397974, 1, 0, 0.5333334, 1,
1.34885, 1.680151, 1.297901, 1, 0, 0.5294118, 1,
1.350719, -1.03722, 1.792921, 1, 0, 0.5215687, 1,
1.355972, -0.9501556, 4.035227, 1, 0, 0.5176471, 1,
1.362003, 0.4529001, -0.01943567, 1, 0, 0.509804, 1,
1.370634, 0.1390701, 0.9406403, 1, 0, 0.5058824, 1,
1.399272, -1.143063, 2.310397, 1, 0, 0.4980392, 1,
1.402736, 0.8920103, 2.258617, 1, 0, 0.4901961, 1,
1.436196, -0.1981772, 1.737456, 1, 0, 0.4862745, 1,
1.436724, -1.297413, 2.236026, 1, 0, 0.4784314, 1,
1.43883, -0.292903, 2.161505, 1, 0, 0.4745098, 1,
1.444631, 0.6114349, 0.9218689, 1, 0, 0.4666667, 1,
1.446005, -1.621001, -0.2106194, 1, 0, 0.4627451, 1,
1.450307, 0.7240127, 1.993347, 1, 0, 0.454902, 1,
1.451125, 1.272197, 0.451431, 1, 0, 0.4509804, 1,
1.457597, -0.4927064, 0.6371444, 1, 0, 0.4431373, 1,
1.469218, -1.170083, 3.320332, 1, 0, 0.4392157, 1,
1.484285, 0.160563, 1.439011, 1, 0, 0.4313726, 1,
1.485404, -1.0639, 2.339713, 1, 0, 0.427451, 1,
1.485844, -0.08407447, 0.2541128, 1, 0, 0.4196078, 1,
1.505116, -0.7699766, 2.135776, 1, 0, 0.4156863, 1,
1.515172, -1.011535, 3.737231, 1, 0, 0.4078431, 1,
1.519984, 0.1033748, 1.263466, 1, 0, 0.4039216, 1,
1.52211, -1.538293, 2.625588, 1, 0, 0.3960784, 1,
1.53136, 0.1265969, 1.722675, 1, 0, 0.3882353, 1,
1.536008, -0.2825684, 1.192779, 1, 0, 0.3843137, 1,
1.539441, 0.8173918, 0.9402035, 1, 0, 0.3764706, 1,
1.557084, 0.143808, 3.011866, 1, 0, 0.372549, 1,
1.573421, -0.8272316, 2.344196, 1, 0, 0.3647059, 1,
1.574658, -0.3541897, 1.515068, 1, 0, 0.3607843, 1,
1.582866, -1.130612, 2.73934, 1, 0, 0.3529412, 1,
1.587442, 1.547909, 1.614966, 1, 0, 0.3490196, 1,
1.588386, 0.6614509, 0.8854666, 1, 0, 0.3411765, 1,
1.58948, 1.176911, 0.5871159, 1, 0, 0.3372549, 1,
1.596022, -1.755833, 3.30928, 1, 0, 0.3294118, 1,
1.599149, 0.3579648, 1.595171, 1, 0, 0.3254902, 1,
1.606048, -2.008455, 1.420059, 1, 0, 0.3176471, 1,
1.618609, 0.970647, 2.13269, 1, 0, 0.3137255, 1,
1.622455, 0.8144886, 1.713112, 1, 0, 0.3058824, 1,
1.632518, -1.052994, 1.295442, 1, 0, 0.2980392, 1,
1.640286, -0.1732757, 1.995201, 1, 0, 0.2941177, 1,
1.651289, 0.7996458, 2.103901, 1, 0, 0.2862745, 1,
1.654267, 1.213271, 0.06328021, 1, 0, 0.282353, 1,
1.6647, -1.400445, 2.937636, 1, 0, 0.2745098, 1,
1.68153, 0.9213665, 0.7116642, 1, 0, 0.2705882, 1,
1.702068, 0.6406837, 2.141015, 1, 0, 0.2627451, 1,
1.702802, 0.06658906, -0.0292561, 1, 0, 0.2588235, 1,
1.7271, 1.263758, 2.369389, 1, 0, 0.2509804, 1,
1.751931, 2.68842, 1.011817, 1, 0, 0.2470588, 1,
1.760914, 1.365701, 0.9148167, 1, 0, 0.2392157, 1,
1.767208, -1.739461, 1.696245, 1, 0, 0.2352941, 1,
1.779928, 1.236828, 0.2411573, 1, 0, 0.227451, 1,
1.782028, -2.514857, 1.664249, 1, 0, 0.2235294, 1,
1.785989, 0.1310539, 2.699976, 1, 0, 0.2156863, 1,
1.804839, 0.1817551, 1.590378, 1, 0, 0.2117647, 1,
1.810192, -0.2238997, 1.519794, 1, 0, 0.2039216, 1,
1.817714, -1.135723, 0.8672604, 1, 0, 0.1960784, 1,
1.819228, 0.1371041, 1.815307, 1, 0, 0.1921569, 1,
1.819466, -1.854265, 2.613388, 1, 0, 0.1843137, 1,
1.850535, 1.416384, 1.077827, 1, 0, 0.1803922, 1,
1.870118, -0.03409068, 1.668351, 1, 0, 0.172549, 1,
1.88837, -0.8033442, 0.4417844, 1, 0, 0.1686275, 1,
1.916987, -0.1415028, 2.984137, 1, 0, 0.1607843, 1,
1.91766, -1.056738, 2.82839, 1, 0, 0.1568628, 1,
1.927502, -0.007542685, 2.129802, 1, 0, 0.1490196, 1,
1.934243, 1.509107, 0.8238856, 1, 0, 0.145098, 1,
1.956287, 0.3421152, 2.782674, 1, 0, 0.1372549, 1,
1.982865, -0.7517192, 1.533333, 1, 0, 0.1333333, 1,
1.995869, 0.6367703, 2.988248, 1, 0, 0.1254902, 1,
1.999617, 0.3906344, 1.131366, 1, 0, 0.1215686, 1,
2.050264, -2.397326, 1.198213, 1, 0, 0.1137255, 1,
2.052636, -0.234257, 2.447041, 1, 0, 0.1098039, 1,
2.06088, 1.227271, 1.726361, 1, 0, 0.1019608, 1,
2.072618, -0.72953, 1.784311, 1, 0, 0.09411765, 1,
2.077127, -0.5669199, 1.158396, 1, 0, 0.09019608, 1,
2.096429, -0.06283936, 1.760425, 1, 0, 0.08235294, 1,
2.17345, -0.3979973, 0.5499933, 1, 0, 0.07843138, 1,
2.184989, -0.8606848, 2.450766, 1, 0, 0.07058824, 1,
2.197347, -0.8752617, 3.141875, 1, 0, 0.06666667, 1,
2.234486, 0.5767078, 1.801877, 1, 0, 0.05882353, 1,
2.257089, -0.2514017, 1.582055, 1, 0, 0.05490196, 1,
2.282281, -0.752073, 1.416229, 1, 0, 0.04705882, 1,
2.291937, 0.1674452, 2.202689, 1, 0, 0.04313726, 1,
2.31896, 0.2269529, 1.786515, 1, 0, 0.03529412, 1,
2.576985, 0.5538918, 1.007606, 1, 0, 0.03137255, 1,
2.585728, -0.8830683, 1.958847, 1, 0, 0.02352941, 1,
2.900587, -1.742692, 1.144966, 1, 0, 0.01960784, 1,
3.318674, 0.5920544, 1.742929, 1, 0, 0.01176471, 1,
3.52814, 2.340633, 1.370346, 1, 0, 0.007843138, 1
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
-0.1275573, -5.074415, -7.985505, 0, -0.5, 0.5, 0.5,
-0.1275573, -5.074415, -7.985505, 1, -0.5, 0.5, 0.5,
-0.1275573, -5.074415, -7.985505, 1, 1.5, 0.5, 0.5,
-0.1275573, -5.074415, -7.985505, 0, 1.5, 0.5, 0.5
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
-5.022535, -0.267761, -7.985505, 0, -0.5, 0.5, 0.5,
-5.022535, -0.267761, -7.985505, 1, -0.5, 0.5, 0.5,
-5.022535, -0.267761, -7.985505, 1, 1.5, 0.5, 0.5,
-5.022535, -0.267761, -7.985505, 0, 1.5, 0.5, 0.5
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
-5.022535, -5.074415, 0.07184172, 0, -0.5, 0.5, 0.5,
-5.022535, -5.074415, 0.07184172, 1, -0.5, 0.5, 0.5,
-5.022535, -5.074415, 0.07184172, 1, 1.5, 0.5, 0.5,
-5.022535, -5.074415, 0.07184172, 0, 1.5, 0.5, 0.5
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
-2, -3.965187, -6.126117,
2, -3.965187, -6.126117,
-2, -3.965187, -6.126117,
-2, -4.150059, -6.436015,
0, -3.965187, -6.126117,
0, -4.150059, -6.436015,
2, -3.965187, -6.126117,
2, -4.150059, -6.436015
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
-2, -4.519801, -7.055811, 0, -0.5, 0.5, 0.5,
-2, -4.519801, -7.055811, 1, -0.5, 0.5, 0.5,
-2, -4.519801, -7.055811, 1, 1.5, 0.5, 0.5,
-2, -4.519801, -7.055811, 0, 1.5, 0.5, 0.5,
0, -4.519801, -7.055811, 0, -0.5, 0.5, 0.5,
0, -4.519801, -7.055811, 1, -0.5, 0.5, 0.5,
0, -4.519801, -7.055811, 1, 1.5, 0.5, 0.5,
0, -4.519801, -7.055811, 0, 1.5, 0.5, 0.5,
2, -4.519801, -7.055811, 0, -0.5, 0.5, 0.5,
2, -4.519801, -7.055811, 1, -0.5, 0.5, 0.5,
2, -4.519801, -7.055811, 1, 1.5, 0.5, 0.5,
2, -4.519801, -7.055811, 0, 1.5, 0.5, 0.5
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
-3.892925, -2, -6.126117,
-3.892925, 2, -6.126117,
-3.892925, -2, -6.126117,
-4.081193, -2, -6.436015,
-3.892925, 0, -6.126117,
-4.081193, 0, -6.436015,
-3.892925, 2, -6.126117,
-4.081193, 2, -6.436015
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
-4.45773, -2, -7.055811, 0, -0.5, 0.5, 0.5,
-4.45773, -2, -7.055811, 1, -0.5, 0.5, 0.5,
-4.45773, -2, -7.055811, 1, 1.5, 0.5, 0.5,
-4.45773, -2, -7.055811, 0, 1.5, 0.5, 0.5,
-4.45773, 0, -7.055811, 0, -0.5, 0.5, 0.5,
-4.45773, 0, -7.055811, 1, -0.5, 0.5, 0.5,
-4.45773, 0, -7.055811, 1, 1.5, 0.5, 0.5,
-4.45773, 0, -7.055811, 0, 1.5, 0.5, 0.5,
-4.45773, 2, -7.055811, 0, -0.5, 0.5, 0.5,
-4.45773, 2, -7.055811, 1, -0.5, 0.5, 0.5,
-4.45773, 2, -7.055811, 1, 1.5, 0.5, 0.5,
-4.45773, 2, -7.055811, 0, 1.5, 0.5, 0.5
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
-3.892925, -3.965187, -4,
-3.892925, -3.965187, 6,
-3.892925, -3.965187, -4,
-4.081193, -4.150059, -4,
-3.892925, -3.965187, -2,
-4.081193, -4.150059, -2,
-3.892925, -3.965187, 0,
-4.081193, -4.150059, 0,
-3.892925, -3.965187, 2,
-4.081193, -4.150059, 2,
-3.892925, -3.965187, 4,
-4.081193, -4.150059, 4,
-3.892925, -3.965187, 6,
-4.081193, -4.150059, 6
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
-4.45773, -4.519801, -4, 0, -0.5, 0.5, 0.5,
-4.45773, -4.519801, -4, 1, -0.5, 0.5, 0.5,
-4.45773, -4.519801, -4, 1, 1.5, 0.5, 0.5,
-4.45773, -4.519801, -4, 0, 1.5, 0.5, 0.5,
-4.45773, -4.519801, -2, 0, -0.5, 0.5, 0.5,
-4.45773, -4.519801, -2, 1, -0.5, 0.5, 0.5,
-4.45773, -4.519801, -2, 1, 1.5, 0.5, 0.5,
-4.45773, -4.519801, -2, 0, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 0, 0, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 0, 1, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 0, 1, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 0, 0, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 2, 0, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 2, 1, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 2, 1, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 2, 0, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 4, 0, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 4, 1, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 4, 1, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 4, 0, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 6, 0, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 6, 1, -0.5, 0.5, 0.5,
-4.45773, -4.519801, 6, 1, 1.5, 0.5, 0.5,
-4.45773, -4.519801, 6, 0, 1.5, 0.5, 0.5
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
-3.892925, -3.965187, -6.126117,
-3.892925, 3.429665, -6.126117,
-3.892925, -3.965187, 6.2698,
-3.892925, 3.429665, 6.2698,
-3.892925, -3.965187, -6.126117,
-3.892925, -3.965187, 6.2698,
-3.892925, 3.429665, -6.126117,
-3.892925, 3.429665, 6.2698,
-3.892925, -3.965187, -6.126117,
3.63781, -3.965187, -6.126117,
-3.892925, -3.965187, 6.2698,
3.63781, -3.965187, 6.2698,
-3.892925, 3.429665, -6.126117,
3.63781, 3.429665, -6.126117,
-3.892925, 3.429665, 6.2698,
3.63781, 3.429665, 6.2698,
3.63781, -3.965187, -6.126117,
3.63781, 3.429665, -6.126117,
3.63781, -3.965187, 6.2698,
3.63781, 3.429665, 6.2698,
3.63781, -3.965187, -6.126117,
3.63781, -3.965187, 6.2698,
3.63781, 3.429665, -6.126117,
3.63781, 3.429665, 6.2698
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
var radius = 8.693469;
var distance = 38.67823;
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
mvMatrix.translate( 0.1275573, 0.267761, -0.07184172 );
mvMatrix.scale( 1.248158, 1.271093, 0.7582778 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.67823);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
difenzoquat<-read.table("difenzoquat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-difenzoquat$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
```

```r
y<-difenzoquat$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
```

```r
z<-difenzoquat$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenzoquat' not found
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
-3.783254, 0.01876145, -2.115451, 0, 0, 1, 1, 1,
-3.45636, -0.84093, -2.147872, 1, 0, 0, 1, 1,
-2.607001, 0.2586443, -0.5579967, 1, 0, 0, 1, 1,
-2.563637, -1.534914, -1.657414, 1, 0, 0, 1, 1,
-2.555043, -0.2747386, -1.882297, 1, 0, 0, 1, 1,
-2.456842, 2.157122, -1.632144, 1, 0, 0, 1, 1,
-2.332838, -0.2219718, 0.2168612, 0, 0, 0, 1, 1,
-2.331332, -0.04173055, -1.658324, 0, 0, 0, 1, 1,
-2.257135, 0.2965135, -1.706611, 0, 0, 0, 1, 1,
-2.233367, 0.6543849, -0.4351476, 0, 0, 0, 1, 1,
-2.141951, 1.171531, -0.2754067, 0, 0, 0, 1, 1,
-2.14182, 0.8821499, 0.2940584, 0, 0, 0, 1, 1,
-2.13798, 2.46899, -2.168092, 0, 0, 0, 1, 1,
-2.083716, -1.109013, -3.957804, 1, 1, 1, 1, 1,
-2.060924, -1.500456, -3.734752, 1, 1, 1, 1, 1,
-2.056773, -0.0005280372, -2.171455, 1, 1, 1, 1, 1,
-2.050496, -0.1139453, 0.6762769, 1, 1, 1, 1, 1,
-2.024813, -0.5251891, -1.095638, 1, 1, 1, 1, 1,
-2.012144, 0.3316329, -1.059077, 1, 1, 1, 1, 1,
-1.992176, 0.8190591, -0.8117058, 1, 1, 1, 1, 1,
-1.982107, 1.684351, -0.5218908, 1, 1, 1, 1, 1,
-1.936881, 1.215586, 0.5219359, 1, 1, 1, 1, 1,
-1.936623, -0.9420185, -2.712145, 1, 1, 1, 1, 1,
-1.921944, -0.5044588, -1.056649, 1, 1, 1, 1, 1,
-1.867103, -1.429772, -2.648799, 1, 1, 1, 1, 1,
-1.851959, 1.226725, -0.2647, 1, 1, 1, 1, 1,
-1.806505, 0.4307771, -2.538697, 1, 1, 1, 1, 1,
-1.793072, -0.5315567, -2.229784, 1, 1, 1, 1, 1,
-1.781787, 0.748894, -1.50472, 0, 0, 1, 1, 1,
-1.773302, 1.362042, -0.8271187, 1, 0, 0, 1, 1,
-1.760063, 0.5795487, -0.6020077, 1, 0, 0, 1, 1,
-1.740362, -1.333078, -1.083864, 1, 0, 0, 1, 1,
-1.724803, 0.1881577, -0.4634774, 1, 0, 0, 1, 1,
-1.717477, 1.108151, -2.060375, 1, 0, 0, 1, 1,
-1.713511, -0.09442951, -1.010965, 0, 0, 0, 1, 1,
-1.711236, 0.3153059, -0.5983155, 0, 0, 0, 1, 1,
-1.702144, 1.948094, -0.7234195, 0, 0, 0, 1, 1,
-1.701653, 1.041316, -1.206691, 0, 0, 0, 1, 1,
-1.680071, -1.296133, -1.385602, 0, 0, 0, 1, 1,
-1.679272, 0.3850776, -0.7625669, 0, 0, 0, 1, 1,
-1.666199, -0.2539253, -1.284927, 0, 0, 0, 1, 1,
-1.663913, -0.5763426, -2.505742, 1, 1, 1, 1, 1,
-1.658581, 0.9449365, -1.100096, 1, 1, 1, 1, 1,
-1.648305, 1.0418, -0.3867958, 1, 1, 1, 1, 1,
-1.643836, 0.447777, -0.9290527, 1, 1, 1, 1, 1,
-1.635062, -1.946471, -1.847141, 1, 1, 1, 1, 1,
-1.62334, 1.189062, -1.638269, 1, 1, 1, 1, 1,
-1.622411, 1.459481, -0.93987, 1, 1, 1, 1, 1,
-1.602078, 0.3337382, -2.975423, 1, 1, 1, 1, 1,
-1.599883, 0.6014178, -2.22286, 1, 1, 1, 1, 1,
-1.576951, 0.3880437, -2.041785, 1, 1, 1, 1, 1,
-1.574024, 2.017461, 0.4528226, 1, 1, 1, 1, 1,
-1.563327, -2.059528, -2.279732, 1, 1, 1, 1, 1,
-1.53514, 0.4787611, -2.53558, 1, 1, 1, 1, 1,
-1.525371, -0.08207816, -0.01778511, 1, 1, 1, 1, 1,
-1.517151, 1.40655, 0.1091869, 1, 1, 1, 1, 1,
-1.511691, -2.152761, -4.164303, 0, 0, 1, 1, 1,
-1.507534, 1.513067, -1.109024, 1, 0, 0, 1, 1,
-1.506388, -1.29145, -3.510514, 1, 0, 0, 1, 1,
-1.503816, 0.6313912, -1.668437, 1, 0, 0, 1, 1,
-1.469789, -1.603416, -2.150137, 1, 0, 0, 1, 1,
-1.466374, 0.7486869, -0.4087192, 1, 0, 0, 1, 1,
-1.446709, 1.221568, 0.2138664, 0, 0, 0, 1, 1,
-1.431582, -0.008027801, -2.409295, 0, 0, 0, 1, 1,
-1.430419, 0.5465529, -0.4056794, 0, 0, 0, 1, 1,
-1.424036, -0.1354862, 0.534043, 0, 0, 0, 1, 1,
-1.418511, -0.7303798, -2.883929, 0, 0, 0, 1, 1,
-1.417852, -0.003991168, -0.9406637, 0, 0, 0, 1, 1,
-1.416037, -1.371139, -1.335836, 0, 0, 0, 1, 1,
-1.404904, -0.07440761, -1.084029, 1, 1, 1, 1, 1,
-1.401736, 0.5859802, -1.486347, 1, 1, 1, 1, 1,
-1.388329, -0.09715878, -0.5103645, 1, 1, 1, 1, 1,
-1.384448, -0.4622973, -1.949535, 1, 1, 1, 1, 1,
-1.384438, -1.180324, -1.807091, 1, 1, 1, 1, 1,
-1.382852, -0.6028417, -3.320476, 1, 1, 1, 1, 1,
-1.380555, 0.8054152, -0.4925209, 1, 1, 1, 1, 1,
-1.380076, 0.8431555, -2.623957, 1, 1, 1, 1, 1,
-1.377019, -0.4338077, -1.756357, 1, 1, 1, 1, 1,
-1.371078, 1.297808, -0.3085957, 1, 1, 1, 1, 1,
-1.365482, -0.08130764, -1.71024, 1, 1, 1, 1, 1,
-1.363081, 1.000701, -0.3368215, 1, 1, 1, 1, 1,
-1.362371, 0.09280301, -0.5646372, 1, 1, 1, 1, 1,
-1.336782, 0.885134, 0.5512056, 1, 1, 1, 1, 1,
-1.33508, -1.74259, -3.871008, 1, 1, 1, 1, 1,
-1.334571, -0.772104, -2.597756, 0, 0, 1, 1, 1,
-1.329476, 0.6733717, -0.04036151, 1, 0, 0, 1, 1,
-1.324706, -1.112818, -0.4504697, 1, 0, 0, 1, 1,
-1.320028, 0.835227, 0.3200038, 1, 0, 0, 1, 1,
-1.315175, -1.077485, -1.804676, 1, 0, 0, 1, 1,
-1.309057, -2.354608, -1.937089, 1, 0, 0, 1, 1,
-1.308647, -1.098737, -2.936485, 0, 0, 0, 1, 1,
-1.296538, -0.803367, -3.307852, 0, 0, 0, 1, 1,
-1.286992, 0.1195895, -1.990554, 0, 0, 0, 1, 1,
-1.286687, -0.02691192, 2.442541, 0, 0, 0, 1, 1,
-1.268595, -0.9213076, -3.319452, 0, 0, 0, 1, 1,
-1.257197, 0.6537371, -0.9986759, 0, 0, 0, 1, 1,
-1.254431, -1.036806, -3.691011, 0, 0, 0, 1, 1,
-1.253594, 2.5353, -1.310384, 1, 1, 1, 1, 1,
-1.247789, 0.6834048, -1.584266, 1, 1, 1, 1, 1,
-1.245755, 0.8333127, 0.2815185, 1, 1, 1, 1, 1,
-1.244532, -0.05596565, -1.629132, 1, 1, 1, 1, 1,
-1.24259, 2.265734, 1.225047, 1, 1, 1, 1, 1,
-1.23884, 1.134538, -0.7453063, 1, 1, 1, 1, 1,
-1.236862, 1.024415, -1.184406, 1, 1, 1, 1, 1,
-1.235196, 1.545986, -1.014395, 1, 1, 1, 1, 1,
-1.232854, -2.237784, -4.739191, 1, 1, 1, 1, 1,
-1.23227, -0.3708993, -1.76097, 1, 1, 1, 1, 1,
-1.231145, -0.6968844, -5.053908, 1, 1, 1, 1, 1,
-1.21967, -0.0341859, -1.30605, 1, 1, 1, 1, 1,
-1.218916, 0.6102756, -1.159169, 1, 1, 1, 1, 1,
-1.193673, -0.635721, -0.3561133, 1, 1, 1, 1, 1,
-1.193432, -1.261532, -0.6648999, 1, 1, 1, 1, 1,
-1.192578, -1.712524, -1.729037, 0, 0, 1, 1, 1,
-1.19159, -0.5292406, -0.2383869, 1, 0, 0, 1, 1,
-1.190409, 1.523479, -0.4736146, 1, 0, 0, 1, 1,
-1.189494, 3.321973, 0.4053693, 1, 0, 0, 1, 1,
-1.185178, -2.239249, -3.854695, 1, 0, 0, 1, 1,
-1.182932, -1.228263, -1.506722, 1, 0, 0, 1, 1,
-1.181029, 0.1837901, -1.739933, 0, 0, 0, 1, 1,
-1.179019, -0.2672071, -0.3393045, 0, 0, 0, 1, 1,
-1.177509, 0.4371386, -0.3095384, 0, 0, 0, 1, 1,
-1.148062, -1.134449, -3.564836, 0, 0, 0, 1, 1,
-1.142662, -1.557773, -1.891757, 0, 0, 0, 1, 1,
-1.119062, 1.072042, -0.3893004, 0, 0, 0, 1, 1,
-1.117273, -0.3183585, -2.927801, 0, 0, 0, 1, 1,
-1.115184, 0.7972191, -2.467279, 1, 1, 1, 1, 1,
-1.108605, 0.4085556, -0.505357, 1, 1, 1, 1, 1,
-1.10859, 0.02498898, -1.782748, 1, 1, 1, 1, 1,
-1.108423, -0.2587096, -2.521525, 1, 1, 1, 1, 1,
-1.1048, 1.641276, 1.207762, 1, 1, 1, 1, 1,
-1.102596, -0.1568168, -2.732559, 1, 1, 1, 1, 1,
-1.099485, -0.7403729, -3.30779, 1, 1, 1, 1, 1,
-1.098929, 0.1503675, -2.36018, 1, 1, 1, 1, 1,
-1.092305, 0.6835901, -0.4921145, 1, 1, 1, 1, 1,
-1.091666, 0.5271189, 0.5620719, 1, 1, 1, 1, 1,
-1.086067, 1.079925, 0.51064, 1, 1, 1, 1, 1,
-1.083058, -1.288336, -2.441929, 1, 1, 1, 1, 1,
-1.080083, 0.6449498, -1.77116, 1, 1, 1, 1, 1,
-1.077326, -0.3035181, -0.8572971, 1, 1, 1, 1, 1,
-1.073082, -0.4248904, -1.702372, 1, 1, 1, 1, 1,
-1.072591, 0.3493974, 0.3625031, 0, 0, 1, 1, 1,
-1.064146, 0.2742867, -0.6678215, 1, 0, 0, 1, 1,
-1.0594, 0.09658144, -1.77244, 1, 0, 0, 1, 1,
-1.057987, -0.02902763, 0.6729614, 1, 0, 0, 1, 1,
-1.057931, 0.878769, -1.592699, 1, 0, 0, 1, 1,
-1.055822, -0.1100549, -1.220675, 1, 0, 0, 1, 1,
-1.05068, 0.3531001, -1.180813, 0, 0, 0, 1, 1,
-1.046565, -1.035825, -2.946483, 0, 0, 0, 1, 1,
-1.037768, 0.6849104, -1.559625, 0, 0, 0, 1, 1,
-1.036917, -0.4986895, -1.331757, 0, 0, 0, 1, 1,
-1.036044, -1.288617, -1.650479, 0, 0, 0, 1, 1,
-1.03325, -0.2351148, -0.7453043, 0, 0, 0, 1, 1,
-1.031353, 0.9311465, 0.4625141, 0, 0, 0, 1, 1,
-1.02972, 0.6792647, -1.418771, 1, 1, 1, 1, 1,
-1.028155, 1.704238, 0.1128273, 1, 1, 1, 1, 1,
-1.023487, 1.071888, -1.165436, 1, 1, 1, 1, 1,
-1.022006, 0.6427886, -0.1409962, 1, 1, 1, 1, 1,
-1.021169, 0.1798908, -0.6521907, 1, 1, 1, 1, 1,
-1.017944, -1.721263, -3.547235, 1, 1, 1, 1, 1,
-1.015931, -0.2650283, -3.0861, 1, 1, 1, 1, 1,
-1.008242, -1.309977, -2.840297, 1, 1, 1, 1, 1,
-1.005181, -0.6830211, -2.419672, 1, 1, 1, 1, 1,
-1.004104, -1.672768, -0.6047479, 1, 1, 1, 1, 1,
-0.999855, -0.3151771, -1.830305, 1, 1, 1, 1, 1,
-0.9975809, 2.066531, -1.972035, 1, 1, 1, 1, 1,
-0.967333, 0.09732385, -1.343486, 1, 1, 1, 1, 1,
-0.9632494, 1.584697, 0.1915281, 1, 1, 1, 1, 1,
-0.9614364, -1.238031, -2.199464, 1, 1, 1, 1, 1,
-0.9577681, 2.665102, -0.282142, 0, 0, 1, 1, 1,
-0.9567826, -0.01971735, -0.3234074, 1, 0, 0, 1, 1,
-0.9442016, 0.6170957, -0.5193449, 1, 0, 0, 1, 1,
-0.9427615, -0.02815534, -3.031511, 1, 0, 0, 1, 1,
-0.9413425, 0.7627845, -2.881257, 1, 0, 0, 1, 1,
-0.9392721, 0.1432946, 1.115909, 1, 0, 0, 1, 1,
-0.9387687, 2.153684, -1.717525, 0, 0, 0, 1, 1,
-0.9372233, 0.08923331, -1.392007, 0, 0, 0, 1, 1,
-0.9294279, -0.1774468, -2.816622, 0, 0, 0, 1, 1,
-0.9162723, 1.488819, -1.509274, 0, 0, 0, 1, 1,
-0.9127709, -0.5136295, -1.340935, 0, 0, 0, 1, 1,
-0.9062874, -1.902668, -3.478308, 0, 0, 0, 1, 1,
-0.9057473, -0.9546732, -2.425577, 0, 0, 0, 1, 1,
-0.9022518, 0.4733053, 0.5409892, 1, 1, 1, 1, 1,
-0.888493, 0.4661827, 0.692556, 1, 1, 1, 1, 1,
-0.887858, -1.636921, -2.398154, 1, 1, 1, 1, 1,
-0.8771964, 0.56089, -2.599768, 1, 1, 1, 1, 1,
-0.8613804, -0.9664177, -3.200423, 1, 1, 1, 1, 1,
-0.8607844, 0.1344227, -2.140665, 1, 1, 1, 1, 1,
-0.8601776, -0.4511977, -0.4416112, 1, 1, 1, 1, 1,
-0.8591157, 0.2713781, -2.413572, 1, 1, 1, 1, 1,
-0.8571646, -0.8796328, -2.768467, 1, 1, 1, 1, 1,
-0.8546915, 0.6844085, 1.192471, 1, 1, 1, 1, 1,
-0.8538172, -0.1777408, -1.532109, 1, 1, 1, 1, 1,
-0.8528603, 0.5322388, -0.06230227, 1, 1, 1, 1, 1,
-0.8479571, -0.2073687, -0.9719313, 1, 1, 1, 1, 1,
-0.8470556, -1.021253, -2.754153, 1, 1, 1, 1, 1,
-0.8434343, -1.356744, -3.855927, 1, 1, 1, 1, 1,
-0.8425984, 0.3936507, -2.768029, 0, 0, 1, 1, 1,
-0.8413084, -1.310692, -1.255315, 1, 0, 0, 1, 1,
-0.8385644, 0.8306115, 0.05957223, 1, 0, 0, 1, 1,
-0.8266577, -1.464312, -3.984242, 1, 0, 0, 1, 1,
-0.8253446, 2.371684, 0.1999981, 1, 0, 0, 1, 1,
-0.82512, 0.8355304, -0.6792268, 1, 0, 0, 1, 1,
-0.8247969, -1.049992, -2.209589, 0, 0, 0, 1, 1,
-0.8121338, -0.1802727, -1.532457, 0, 0, 0, 1, 1,
-0.8097903, 0.1703728, -0.5093322, 0, 0, 0, 1, 1,
-0.8078386, 0.3748052, 0.3905277, 0, 0, 0, 1, 1,
-0.8056745, -1.784889, -3.733301, 0, 0, 0, 1, 1,
-0.7982205, 0.3917598, -1.181478, 0, 0, 0, 1, 1,
-0.7960001, -1.68134, -3.308774, 0, 0, 0, 1, 1,
-0.794478, 0.5566459, -1.049962, 1, 1, 1, 1, 1,
-0.7918836, -0.04714737, -0.1086487, 1, 1, 1, 1, 1,
-0.77679, 1.030209, -0.3306863, 1, 1, 1, 1, 1,
-0.7737644, 0.421778, -1.915714, 1, 1, 1, 1, 1,
-0.7680927, -0.5567061, -0.7546644, 1, 1, 1, 1, 1,
-0.7657643, 0.1889728, -2.108844, 1, 1, 1, 1, 1,
-0.7652853, -2.982021, -5.945594, 1, 1, 1, 1, 1,
-0.7634414, 1.330796, -1.330693, 1, 1, 1, 1, 1,
-0.7607534, 0.8983951, -1.469931, 1, 1, 1, 1, 1,
-0.7534815, -1.355249, -2.812681, 1, 1, 1, 1, 1,
-0.7434149, 0.3194473, -0.7580478, 1, 1, 1, 1, 1,
-0.7418883, 0.9888234, 0.2670677, 1, 1, 1, 1, 1,
-0.7408506, 0.005582508, -1.296575, 1, 1, 1, 1, 1,
-0.7395929, 0.4801146, -1.818928, 1, 1, 1, 1, 1,
-0.738849, -1.098513, -2.042445, 1, 1, 1, 1, 1,
-0.7368491, -0.3663546, -2.561469, 0, 0, 1, 1, 1,
-0.7330452, -1.076905, -0.3672256, 1, 0, 0, 1, 1,
-0.7280334, -0.7794222, -1.592479, 1, 0, 0, 1, 1,
-0.7242827, -1.153324, -3.537664, 1, 0, 0, 1, 1,
-0.7242412, 0.4166021, -1.896365, 1, 0, 0, 1, 1,
-0.7237709, -0.3717021, -3.699409, 1, 0, 0, 1, 1,
-0.7171963, 0.3207777, 0.6842836, 0, 0, 0, 1, 1,
-0.7152485, -0.9474593, -2.899079, 0, 0, 0, 1, 1,
-0.7151597, 0.7231018, 0.6539324, 0, 0, 0, 1, 1,
-0.7125707, -2.129159, -4.600203, 0, 0, 0, 1, 1,
-0.7074178, -0.6953054, -3.325688, 0, 0, 0, 1, 1,
-0.6997632, -1.40476, -2.578314, 0, 0, 0, 1, 1,
-0.6985856, 0.2344297, -1.285582, 0, 0, 0, 1, 1,
-0.6938933, -0.06893674, -2.569352, 1, 1, 1, 1, 1,
-0.6915503, 0.3945182, -1.756364, 1, 1, 1, 1, 1,
-0.6911447, -0.3528922, -0.7789196, 1, 1, 1, 1, 1,
-0.6844786, -0.4410158, -2.914876, 1, 1, 1, 1, 1,
-0.679041, -0.4741955, -1.417937, 1, 1, 1, 1, 1,
-0.6703572, -1.841962, -1.707006, 1, 1, 1, 1, 1,
-0.6660004, -1.506128, -2.309967, 1, 1, 1, 1, 1,
-0.6591228, -1.202125, -1.193966, 1, 1, 1, 1, 1,
-0.6573991, -1.388864, -4.360164, 1, 1, 1, 1, 1,
-0.6557687, -0.3080237, -2.073375, 1, 1, 1, 1, 1,
-0.6533158, 0.5673441, -0.1903304, 1, 1, 1, 1, 1,
-0.6530948, 0.3996336, -1.96725, 1, 1, 1, 1, 1,
-0.6470847, 0.5323288, -1.395656, 1, 1, 1, 1, 1,
-0.6450194, 0.3012457, -0.1900535, 1, 1, 1, 1, 1,
-0.6392383, -1.943673, -1.125799, 1, 1, 1, 1, 1,
-0.638537, -0.01465589, -2.125215, 0, 0, 1, 1, 1,
-0.6358834, 0.9222073, 0.4108168, 1, 0, 0, 1, 1,
-0.6350988, 0.4687316, -1.172778, 1, 0, 0, 1, 1,
-0.6332326, 2.009532, 0.3067352, 1, 0, 0, 1, 1,
-0.6289943, -1.709664, -3.535923, 1, 0, 0, 1, 1,
-0.6268314, -0.02907122, -2.210496, 1, 0, 0, 1, 1,
-0.6243694, -0.7771596, -3.480967, 0, 0, 0, 1, 1,
-0.6209502, 0.1686721, -0.4699249, 0, 0, 0, 1, 1,
-0.6193017, -1.168345, -2.818051, 0, 0, 0, 1, 1,
-0.6123388, 0.2205978, 1.028314, 0, 0, 0, 1, 1,
-0.6106582, -0.6197918, -3.912578, 0, 0, 0, 1, 1,
-0.6089644, 0.3665826, -0.6913348, 0, 0, 0, 1, 1,
-0.6088647, 0.6632543, -2.112781, 0, 0, 0, 1, 1,
-0.6066864, -0.1520424, -1.085988, 1, 1, 1, 1, 1,
-0.6064256, 1.300839, -1.143753, 1, 1, 1, 1, 1,
-0.5994609, 0.9269108, -0.6743858, 1, 1, 1, 1, 1,
-0.5865654, 0.6239501, -1.824106, 1, 1, 1, 1, 1,
-0.5845498, 0.6085588, 0.8562903, 1, 1, 1, 1, 1,
-0.5832028, 0.6476142, -1.327775, 1, 1, 1, 1, 1,
-0.5812767, 0.0288685, -0.803509, 1, 1, 1, 1, 1,
-0.579973, 0.9995714, -1.503086, 1, 1, 1, 1, 1,
-0.5797688, -0.8209081, -1.882866, 1, 1, 1, 1, 1,
-0.5687942, -1.253505, -1.882628, 1, 1, 1, 1, 1,
-0.5598639, -2.805355, -2.916796, 1, 1, 1, 1, 1,
-0.5588949, -1.957277, -1.647837, 1, 1, 1, 1, 1,
-0.5572473, 0.5738384, 1.193357, 1, 1, 1, 1, 1,
-0.5557657, 0.741963, -0.5460523, 1, 1, 1, 1, 1,
-0.555424, -0.04593689, -1.453664, 1, 1, 1, 1, 1,
-0.5528141, 0.9119267, -0.06962488, 0, 0, 1, 1, 1,
-0.5520422, 1.209758, 0.283677, 1, 0, 0, 1, 1,
-0.5498933, 0.01225615, -1.200285, 1, 0, 0, 1, 1,
-0.5492563, -1.591177, -3.24533, 1, 0, 0, 1, 1,
-0.5492196, -1.516012, -2.36978, 1, 0, 0, 1, 1,
-0.5486604, -0.2827852, 0.3627547, 1, 0, 0, 1, 1,
-0.5481397, 0.01382468, -1.70232, 0, 0, 0, 1, 1,
-0.5460979, 1.813615, 0.1503199, 0, 0, 0, 1, 1,
-0.5393833, -0.8078496, -1.234612, 0, 0, 0, 1, 1,
-0.5379224, 0.6376901, -1.097779, 0, 0, 0, 1, 1,
-0.5349729, 1.045725, -0.473902, 0, 0, 0, 1, 1,
-0.5288036, -1.717064, -2.445761, 0, 0, 0, 1, 1,
-0.525902, -0.4663122, -1.460891, 0, 0, 0, 1, 1,
-0.5231192, -0.2938854, -2.001854, 1, 1, 1, 1, 1,
-0.5193917, 0.3440998, -1.452827, 1, 1, 1, 1, 1,
-0.5191371, 1.727057, -1.082715, 1, 1, 1, 1, 1,
-0.5186698, 0.07925013, -0.6600354, 1, 1, 1, 1, 1,
-0.5183882, -0.08496892, -2.887657, 1, 1, 1, 1, 1,
-0.51803, 1.537999, -1.893694, 1, 1, 1, 1, 1,
-0.5176468, 1.214748, -0.5597127, 1, 1, 1, 1, 1,
-0.5144576, -1.72872, -1.925536, 1, 1, 1, 1, 1,
-0.513623, -0.003075102, 0.7374308, 1, 1, 1, 1, 1,
-0.511568, -0.754244, -2.862582, 1, 1, 1, 1, 1,
-0.5112571, 1.182778, -1.786799, 1, 1, 1, 1, 1,
-0.5111896, -0.3664681, -1.705903, 1, 1, 1, 1, 1,
-0.5106746, -0.04989266, -1.763919, 1, 1, 1, 1, 1,
-0.508627, -1.144493, -3.081234, 1, 1, 1, 1, 1,
-0.5062283, 0.4556423, -0.5251666, 1, 1, 1, 1, 1,
-0.498138, 0.8914807, -1.674973, 0, 0, 1, 1, 1,
-0.4888858, 0.4000757, -1.973982, 1, 0, 0, 1, 1,
-0.4880397, -1.885981, -4.153211, 1, 0, 0, 1, 1,
-0.485294, 0.1875918, -1.611969, 1, 0, 0, 1, 1,
-0.4852407, 0.5514854, -1.309322, 1, 0, 0, 1, 1,
-0.4848472, -0.01221163, -1.322374, 1, 0, 0, 1, 1,
-0.4771026, -1.148458, -2.341362, 0, 0, 0, 1, 1,
-0.4759986, -1.816224, -1.954421, 0, 0, 0, 1, 1,
-0.4738663, -1.33694, -2.514629, 0, 0, 0, 1, 1,
-0.4719599, 1.296311, 0.2655952, 0, 0, 0, 1, 1,
-0.4643585, 0.3764378, -0.8250623, 0, 0, 0, 1, 1,
-0.4620142, -0.3454611, -1.968223, 0, 0, 0, 1, 1,
-0.4611196, -1.099401, -2.049104, 0, 0, 0, 1, 1,
-0.4603692, -1.130796, -3.231919, 1, 1, 1, 1, 1,
-0.4596955, -0.7569805, -1.377675, 1, 1, 1, 1, 1,
-0.4551474, 1.231173, -1.315943, 1, 1, 1, 1, 1,
-0.4523659, -1.716639, -3.155432, 1, 1, 1, 1, 1,
-0.4516244, 0.1108343, -0.9579023, 1, 1, 1, 1, 1,
-0.4429679, 0.9827746, -1.329981, 1, 1, 1, 1, 1,
-0.4405738, 0.2730945, -0.9848707, 1, 1, 1, 1, 1,
-0.4381671, 1.122694, 0.6077914, 1, 1, 1, 1, 1,
-0.4348057, 1.3209, -1.765194, 1, 1, 1, 1, 1,
-0.4344221, -0.1597302, -1.683434, 1, 1, 1, 1, 1,
-0.4331132, 0.0757193, -1.55385, 1, 1, 1, 1, 1,
-0.4249297, -0.84735, -1.28737, 1, 1, 1, 1, 1,
-0.4219292, 1.399932, -2.231467, 1, 1, 1, 1, 1,
-0.4177452, 0.4783045, -0.1685847, 1, 1, 1, 1, 1,
-0.4177318, 0.2720985, -1.121251, 1, 1, 1, 1, 1,
-0.4158369, -0.7470548, -1.919985, 0, 0, 1, 1, 1,
-0.4127764, -0.1246821, -1.998218, 1, 0, 0, 1, 1,
-0.4105899, 0.3240425, 0.3990873, 1, 0, 0, 1, 1,
-0.3999503, 0.7985429, -0.1032916, 1, 0, 0, 1, 1,
-0.3943917, 0.009219134, -0.9508673, 1, 0, 0, 1, 1,
-0.3940133, -0.9313948, -2.263695, 1, 0, 0, 1, 1,
-0.3906638, -0.7277438, -2.795795, 0, 0, 0, 1, 1,
-0.3852755, -0.4447757, -1.872787, 0, 0, 0, 1, 1,
-0.3825625, 1.084692, -0.7200684, 0, 0, 0, 1, 1,
-0.3818772, -1.958136, -4.226388, 0, 0, 0, 1, 1,
-0.3808715, 0.1815979, -1.013676, 0, 0, 0, 1, 1,
-0.3804027, -1.329227, -1.974516, 0, 0, 0, 1, 1,
-0.380095, -2.275138, -4.232562, 0, 0, 0, 1, 1,
-0.3773334, 0.3841947, -1.202993, 1, 1, 1, 1, 1,
-0.3757023, -0.02825924, -1.481072, 1, 1, 1, 1, 1,
-0.3749339, 1.327445, 0.483171, 1, 1, 1, 1, 1,
-0.374376, 0.778176, -1.098041, 1, 1, 1, 1, 1,
-0.3741813, 0.2555759, -1.619166, 1, 1, 1, 1, 1,
-0.3740541, -0.566466, -0.2048466, 1, 1, 1, 1, 1,
-0.3715314, 0.5328267, 0.09814341, 1, 1, 1, 1, 1,
-0.3624447, -0.1613113, -3.277057, 1, 1, 1, 1, 1,
-0.3604187, -1.158963, -2.048047, 1, 1, 1, 1, 1,
-0.3601719, -1.385084, -2.327247, 1, 1, 1, 1, 1,
-0.3481018, -1.501273, -3.632857, 1, 1, 1, 1, 1,
-0.3455018, -0.6234308, -2.814207, 1, 1, 1, 1, 1,
-0.345053, -0.1657706, -1.006208, 1, 1, 1, 1, 1,
-0.3409773, 0.3621703, -1.025517, 1, 1, 1, 1, 1,
-0.3345812, -0.3389364, -2.374844, 1, 1, 1, 1, 1,
-0.3339204, 1.164708, 0.4327597, 0, 0, 1, 1, 1,
-0.3257582, 0.4661052, -1.085396, 1, 0, 0, 1, 1,
-0.3249605, -0.2594596, -0.7103252, 1, 0, 0, 1, 1,
-0.309963, -0.4795998, -3.780394, 1, 0, 0, 1, 1,
-0.3028009, -0.99149, -1.622213, 1, 0, 0, 1, 1,
-0.2996968, 0.39907, 0.619837, 1, 0, 0, 1, 1,
-0.2988169, -1.60643, -2.703381, 0, 0, 0, 1, 1,
-0.2986591, 2.201293, -0.6192895, 0, 0, 0, 1, 1,
-0.2924529, 1.199784, -1.890108, 0, 0, 0, 1, 1,
-0.2848562, 0.8503857, 0.611464, 0, 0, 0, 1, 1,
-0.2825252, -1.864699, -2.909422, 0, 0, 0, 1, 1,
-0.2807368, -0.5312011, -2.470452, 0, 0, 0, 1, 1,
-0.2763343, -1.318691, -2.028732, 0, 0, 0, 1, 1,
-0.2693729, 1.550862, -0.477753, 1, 1, 1, 1, 1,
-0.2687818, -0.3835113, -4.139566, 1, 1, 1, 1, 1,
-0.2639678, 0.5118293, -1.748737, 1, 1, 1, 1, 1,
-0.2639591, -0.1699038, -2.231581, 1, 1, 1, 1, 1,
-0.2624268, 0.4881586, -0.5406868, 1, 1, 1, 1, 1,
-0.2612981, 0.543031, 0.3515065, 1, 1, 1, 1, 1,
-0.2610996, 0.3818819, -0.5434383, 1, 1, 1, 1, 1,
-0.2591216, 0.9548911, 0.6901802, 1, 1, 1, 1, 1,
-0.2561384, 1.051041, -1.863234, 1, 1, 1, 1, 1,
-0.2558942, -0.4344994, -2.078771, 1, 1, 1, 1, 1,
-0.2539005, 0.8440411, -0.3098801, 1, 1, 1, 1, 1,
-0.2519706, 0.893137, -0.7346569, 1, 1, 1, 1, 1,
-0.2466519, 0.1315328, -2.5483, 1, 1, 1, 1, 1,
-0.2394609, 0.4207023, -1.754459, 1, 1, 1, 1, 1,
-0.2344571, 1.687739, -2.518376, 1, 1, 1, 1, 1,
-0.2320722, 0.2133986, -2.828328, 0, 0, 1, 1, 1,
-0.2315891, -3.478565, -2.61075, 1, 0, 0, 1, 1,
-0.2275657, -2.137882, -4.661994, 1, 0, 0, 1, 1,
-0.2251101, 0.769198, 0.6715606, 1, 0, 0, 1, 1,
-0.2236352, -0.4579067, -1.636064, 1, 0, 0, 1, 1,
-0.2234395, 0.4072393, -0.3733746, 1, 0, 0, 1, 1,
-0.221923, 0.1105762, -0.2553437, 0, 0, 0, 1, 1,
-0.2215736, -0.4875371, -3.946568, 0, 0, 0, 1, 1,
-0.220288, -2.300592, -2.518003, 0, 0, 0, 1, 1,
-0.2201833, 1.044937, -0.2113591, 0, 0, 0, 1, 1,
-0.2190583, -0.5876676, -2.393771, 0, 0, 0, 1, 1,
-0.2181544, -0.4432178, -3.433686, 0, 0, 0, 1, 1,
-0.2166429, 0.9927959, -0.4762126, 0, 0, 0, 1, 1,
-0.2135586, 0.09572957, -2.848703, 1, 1, 1, 1, 1,
-0.2101778, 1.774264, 1.124736, 1, 1, 1, 1, 1,
-0.2021996, -1.771642, -4.537355, 1, 1, 1, 1, 1,
-0.2011229, 0.01300022, -0.9325781, 1, 1, 1, 1, 1,
-0.1988833, -1.270336, -0.1032964, 1, 1, 1, 1, 1,
-0.1971968, -0.2406959, -1.733464, 1, 1, 1, 1, 1,
-0.1962937, 0.1188536, -2.008941, 1, 1, 1, 1, 1,
-0.1958926, 0.6608399, -1.558599, 1, 1, 1, 1, 1,
-0.1918079, -0.1291843, -2.361629, 1, 1, 1, 1, 1,
-0.191445, 0.3658322, -3.37341, 1, 1, 1, 1, 1,
-0.1897132, 1.063209, -0.813142, 1, 1, 1, 1, 1,
-0.1873218, 0.1192227, -1.516147, 1, 1, 1, 1, 1,
-0.182755, -1.112225, -1.3394, 1, 1, 1, 1, 1,
-0.179101, -0.3590859, -3.826397, 1, 1, 1, 1, 1,
-0.1773489, -1.81388, -0.2514618, 1, 1, 1, 1, 1,
-0.1738914, 1.174278, 0.6101101, 0, 0, 1, 1, 1,
-0.1707044, -1.284077, -2.014887, 1, 0, 0, 1, 1,
-0.1702493, 0.6401346, -0.5319986, 1, 0, 0, 1, 1,
-0.1648793, -2.083297, -1.504784, 1, 0, 0, 1, 1,
-0.1630534, 0.5762298, -1.348168, 1, 0, 0, 1, 1,
-0.1613481, 0.6645791, 0.01503964, 1, 0, 0, 1, 1,
-0.1589208, 1.587375, 0.4060773, 0, 0, 0, 1, 1,
-0.1587357, -1.769264, -3.733547, 0, 0, 0, 1, 1,
-0.1574951, 0.6507381, -0.9250634, 0, 0, 0, 1, 1,
-0.1527233, 0.631192, 2.17906, 0, 0, 0, 1, 1,
-0.1508911, 2.604486, 0.07510606, 0, 0, 0, 1, 1,
-0.1501594, 0.4807153, 0.7530488, 0, 0, 0, 1, 1,
-0.1422489, 0.4149731, -0.3854899, 0, 0, 0, 1, 1,
-0.1384788, -1.625745, -3.728542, 1, 1, 1, 1, 1,
-0.1362683, 0.4417753, -0.2070376, 1, 1, 1, 1, 1,
-0.1361776, 0.1427299, -1.652724, 1, 1, 1, 1, 1,
-0.1332183, -0.2166286, -3.684606, 1, 1, 1, 1, 1,
-0.1329656, 1.186458, 0.1276425, 1, 1, 1, 1, 1,
-0.1325363, 0.8916979, -1.007341, 1, 1, 1, 1, 1,
-0.1316967, -0.3288139, -3.70161, 1, 1, 1, 1, 1,
-0.1262459, 0.03561452, -1.956801, 1, 1, 1, 1, 1,
-0.1226708, -0.3614846, -2.768615, 1, 1, 1, 1, 1,
-0.1203608, -0.3924348, -3.534303, 1, 1, 1, 1, 1,
-0.1201655, 0.1457012, -0.6699778, 1, 1, 1, 1, 1,
-0.1191039, -0.1146642, -2.824729, 1, 1, 1, 1, 1,
-0.1151581, -0.03564497, -1.487093, 1, 1, 1, 1, 1,
-0.1127752, -1.083255, -3.506489, 1, 1, 1, 1, 1,
-0.1102799, 0.8581221, -1.230829, 1, 1, 1, 1, 1,
-0.1097308, 1.07134, 0.7674137, 0, 0, 1, 1, 1,
-0.1097016, 0.2448698, 0.4993626, 1, 0, 0, 1, 1,
-0.1079807, -0.9242136, -3.919745, 1, 0, 0, 1, 1,
-0.1067238, -0.003234657, -1.178743, 1, 0, 0, 1, 1,
-0.102341, 0.07534212, -0.3339787, 1, 0, 0, 1, 1,
-0.1017248, 0.4928624, 1.416916, 1, 0, 0, 1, 1,
-0.1010946, 0.4492943, 0.8111387, 0, 0, 0, 1, 1,
-0.1003474, 0.158995, -3.023241, 0, 0, 0, 1, 1,
-0.09875445, 1.027543, -0.5797599, 0, 0, 0, 1, 1,
-0.0972617, -0.6719825, -1.198905, 0, 0, 0, 1, 1,
-0.09156211, 1.771924, 0.8049192, 0, 0, 0, 1, 1,
-0.08888122, -1.949916, -1.24409, 0, 0, 0, 1, 1,
-0.08809197, 0.765284, -0.7957766, 0, 0, 0, 1, 1,
-0.08638763, 0.4171528, -0.1391066, 1, 1, 1, 1, 1,
-0.08472842, -1.631239, -3.404382, 1, 1, 1, 1, 1,
-0.08456346, -0.5813364, -4.312699, 1, 1, 1, 1, 1,
-0.08223513, 0.3028466, -1.202376, 1, 1, 1, 1, 1,
-0.07774227, -0.2482839, -2.534306, 1, 1, 1, 1, 1,
-0.07208046, -0.08601079, -0.9008005, 1, 1, 1, 1, 1,
-0.06869107, 0.0592883, -1.27859, 1, 1, 1, 1, 1,
-0.06624622, 0.1360094, -1.907435, 1, 1, 1, 1, 1,
-0.06477959, 0.5802914, -0.5817761, 1, 1, 1, 1, 1,
-0.06370564, 0.1460423, -1.431348, 1, 1, 1, 1, 1,
-0.06131178, 0.7879015, -0.6661116, 1, 1, 1, 1, 1,
-0.05760211, -0.03691351, -1.38556, 1, 1, 1, 1, 1,
-0.05683848, -0.8471485, -2.900314, 1, 1, 1, 1, 1,
-0.05582129, 2.323262, 0.00860491, 1, 1, 1, 1, 1,
-0.05500442, 0.4893566, 0.8738504, 1, 1, 1, 1, 1,
-0.0545073, -1.275008, -3.790834, 0, 0, 1, 1, 1,
-0.04962776, 0.1284342, -0.3866798, 1, 0, 0, 1, 1,
-0.04239503, -1.814604, -4.275691, 1, 0, 0, 1, 1,
-0.0419579, 0.08953971, -0.419756, 1, 0, 0, 1, 1,
-0.04131666, 0.07810013, 0.7820321, 1, 0, 0, 1, 1,
-0.04121082, 0.006908237, -2.382428, 1, 0, 0, 1, 1,
-0.04020251, -1.366013, -2.811985, 0, 0, 0, 1, 1,
-0.0400805, 0.2520712, -1.148672, 0, 0, 0, 1, 1,
-0.0392068, 0.4014175, 2.564735, 0, 0, 0, 1, 1,
-0.03859096, 2.335317, 0.3163125, 0, 0, 0, 1, 1,
-0.03739411, -1.642971, -1.757005, 0, 0, 0, 1, 1,
-0.03639341, -0.5919552, -2.504233, 0, 0, 0, 1, 1,
-0.03368871, 1.72827, -0.2910377, 0, 0, 0, 1, 1,
-0.03228701, -0.2165256, -3.328165, 1, 1, 1, 1, 1,
-0.03088583, 0.0001518282, -1.133976, 1, 1, 1, 1, 1,
-0.03081457, -0.1379173, -1.433371, 1, 1, 1, 1, 1,
-0.02913888, -0.0294936, -2.243865, 1, 1, 1, 1, 1,
-0.02856763, -1.140264, -3.02132, 1, 1, 1, 1, 1,
-0.026427, 0.2023946, -0.1039304, 1, 1, 1, 1, 1,
-0.02622714, -0.09402224, -3.739479, 1, 1, 1, 1, 1,
-0.02559373, 0.2854129, -0.8993041, 1, 1, 1, 1, 1,
-0.01416895, 1.10538, -0.09773097, 1, 1, 1, 1, 1,
-0.01378962, 0.5023264, 0.6043063, 1, 1, 1, 1, 1,
-0.01264251, -0.4693981, -3.552523, 1, 1, 1, 1, 1,
-0.01156776, 0.8839138, -1.132481, 1, 1, 1, 1, 1,
-0.01011662, -0.09019163, -2.424046, 1, 1, 1, 1, 1,
-0.009935969, 0.9258732, 0.0568472, 1, 1, 1, 1, 1,
-0.006351379, 1.393494, -0.1456576, 1, 1, 1, 1, 1,
-0.005420228, 0.6538999, -0.1116363, 0, 0, 1, 1, 1,
-0.00497025, 1.16548, 0.9669332, 1, 0, 0, 1, 1,
-0.0005802152, 0.2768099, -0.9135501, 1, 0, 0, 1, 1,
0.002882535, -0.9752254, 4.073225, 1, 0, 0, 1, 1,
0.004473203, -0.8801042, 2.301536, 1, 0, 0, 1, 1,
0.006793048, -0.1112691, 1.719894, 1, 0, 0, 1, 1,
0.006802348, 0.7667581, -0.3651651, 0, 0, 0, 1, 1,
0.009367459, -1.500004, 0.7941432, 0, 0, 0, 1, 1,
0.01220701, 0.06672964, 0.07342163, 0, 0, 0, 1, 1,
0.01713377, -1.236301, 3.337379, 0, 0, 0, 1, 1,
0.01881325, 0.3155901, -0.5536652, 0, 0, 0, 1, 1,
0.02020195, 0.02588129, 1.580212, 0, 0, 0, 1, 1,
0.02227076, 1.846346, 0.8406695, 0, 0, 0, 1, 1,
0.02727771, 0.729843, 0.1546632, 1, 1, 1, 1, 1,
0.02745485, -0.4735493, 3.0149, 1, 1, 1, 1, 1,
0.02904007, -0.5015187, 4.092387, 1, 1, 1, 1, 1,
0.02977477, -1.198553, 1.76818, 1, 1, 1, 1, 1,
0.03056813, -1.476502, 3.189935, 1, 1, 1, 1, 1,
0.0311564, -0.02808649, 3.084059, 1, 1, 1, 1, 1,
0.03145146, -0.6361669, 2.320045, 1, 1, 1, 1, 1,
0.03164178, 0.05246976, 1.195916, 1, 1, 1, 1, 1,
0.03480242, 0.7227176, -1.143556, 1, 1, 1, 1, 1,
0.03809892, -0.04382353, 2.653404, 1, 1, 1, 1, 1,
0.04566996, -0.06038805, -0.2067494, 1, 1, 1, 1, 1,
0.04963922, -0.831131, 3.664572, 1, 1, 1, 1, 1,
0.05084159, 0.4112075, 2.394336, 1, 1, 1, 1, 1,
0.0512644, -0.04808189, 1.882466, 1, 1, 1, 1, 1,
0.05319273, 0.9942054, 1.249143, 1, 1, 1, 1, 1,
0.05375566, -0.1469485, 3.004707, 0, 0, 1, 1, 1,
0.0547093, -0.3914561, 4.663696, 1, 0, 0, 1, 1,
0.05588761, 0.199009, 2.028923, 1, 0, 0, 1, 1,
0.05848624, 0.04824465, -1.49422, 1, 0, 0, 1, 1,
0.0592863, -0.5922503, 4.119163, 1, 0, 0, 1, 1,
0.05959136, 0.04909502, 2.438862, 1, 0, 0, 1, 1,
0.06427684, 0.8380624, 0.03377705, 0, 0, 0, 1, 1,
0.06473187, 0.3915243, -2.100745, 0, 0, 0, 1, 1,
0.06728529, -0.320315, 3.397728, 0, 0, 0, 1, 1,
0.06753819, 2.409085, 1.180617, 0, 0, 0, 1, 1,
0.07011466, -0.2727199, 3.014501, 0, 0, 0, 1, 1,
0.0772653, 1.204255, -0.669149, 0, 0, 0, 1, 1,
0.07888758, 0.6082882, 0.5278383, 0, 0, 0, 1, 1,
0.07901347, 0.2554629, -0.7445716, 1, 1, 1, 1, 1,
0.08056107, 1.021181, -0.004198188, 1, 1, 1, 1, 1,
0.08380508, -1.556997, 2.417146, 1, 1, 1, 1, 1,
0.08927199, -2.575593, 3.136707, 1, 1, 1, 1, 1,
0.0906113, -0.3348328, 1.998096, 1, 1, 1, 1, 1,
0.09642084, 1.278009, 0.3751692, 1, 1, 1, 1, 1,
0.1030056, -1.112956, 3.602444, 1, 1, 1, 1, 1,
0.105426, -0.8249381, 3.950906, 1, 1, 1, 1, 1,
0.1061981, -0.6715798, 2.325935, 1, 1, 1, 1, 1,
0.1126788, -1.106874, 2.525325, 1, 1, 1, 1, 1,
0.1157401, -0.7868171, 2.045042, 1, 1, 1, 1, 1,
0.1159738, -0.6537259, 0.8264701, 1, 1, 1, 1, 1,
0.1170697, -0.7328061, 2.158316, 1, 1, 1, 1, 1,
0.1197606, -0.3746759, 4.603967, 1, 1, 1, 1, 1,
0.1249631, 0.6436489, -0.4189847, 1, 1, 1, 1, 1,
0.1264828, 1.423666, -0.3743561, 0, 0, 1, 1, 1,
0.1326087, -0.6303709, 2.847791, 1, 0, 0, 1, 1,
0.1331131, 0.1456005, 0.9695615, 1, 0, 0, 1, 1,
0.1341877, 0.7801688, 0.421215, 1, 0, 0, 1, 1,
0.1422965, -0.8545937, 3.479293, 1, 0, 0, 1, 1,
0.1439037, -0.2396487, 1.774801, 1, 0, 0, 1, 1,
0.145774, -2.408819, 2.12425, 0, 0, 0, 1, 1,
0.1473322, -0.8397383, 3.733864, 0, 0, 0, 1, 1,
0.1488181, -0.1397999, 3.279793, 0, 0, 0, 1, 1,
0.14896, -1.839504, 3.574063, 0, 0, 0, 1, 1,
0.1516732, 0.2092893, 1.095007, 0, 0, 0, 1, 1,
0.1519685, 1.261554, 1.142768, 0, 0, 0, 1, 1,
0.1564677, -0.4980042, 2.741188, 0, 0, 0, 1, 1,
0.162506, -0.250432, 1.679525, 1, 1, 1, 1, 1,
0.1630752, -0.4518341, 3.795504, 1, 1, 1, 1, 1,
0.1644968, -1.393246, 1.580029, 1, 1, 1, 1, 1,
0.1647093, -0.8981563, 3.65045, 1, 1, 1, 1, 1,
0.1686852, -0.1240073, 1.317681, 1, 1, 1, 1, 1,
0.1717965, -1.158757, 1.007286, 1, 1, 1, 1, 1,
0.177226, 0.2834374, 1.606543, 1, 1, 1, 1, 1,
0.177321, -0.4743816, 3.92328, 1, 1, 1, 1, 1,
0.1791225, -1.573296, 3.069329, 1, 1, 1, 1, 1,
0.1804459, -0.5133024, 2.041222, 1, 1, 1, 1, 1,
0.1807254, 1.566487, 0.1549754, 1, 1, 1, 1, 1,
0.1808482, -0.1571627, 2.841984, 1, 1, 1, 1, 1,
0.184243, 0.3221729, -0.6021483, 1, 1, 1, 1, 1,
0.1869447, -0.3078305, 2.079391, 1, 1, 1, 1, 1,
0.2006697, 0.2929275, 1.682127, 1, 1, 1, 1, 1,
0.2067233, 1.45881, -0.4770994, 0, 0, 1, 1, 1,
0.206846, 0.5795262, -0.5420108, 1, 0, 0, 1, 1,
0.211112, 1.230746, 0.1814751, 1, 0, 0, 1, 1,
0.2117529, -0.5336474, 4.37535, 1, 0, 0, 1, 1,
0.2136563, 1.33997, 0.4198603, 1, 0, 0, 1, 1,
0.213717, -0.9737226, 2.183615, 1, 0, 0, 1, 1,
0.2213383, -0.438455, 1.347243, 0, 0, 0, 1, 1,
0.2248022, 1.218603, 1.022195, 0, 0, 0, 1, 1,
0.2259744, 0.1915131, -0.0007695435, 0, 0, 0, 1, 1,
0.234902, -0.07445731, 2.4511, 0, 0, 0, 1, 1,
0.2354327, -0.5861748, 0.6844727, 0, 0, 0, 1, 1,
0.2387933, -0.03746799, 1.381453, 0, 0, 0, 1, 1,
0.2406778, -1.721227, 2.436335, 0, 0, 0, 1, 1,
0.2419303, -0.9282244, 3.164947, 1, 1, 1, 1, 1,
0.2469421, -2.509252, 1.339458, 1, 1, 1, 1, 1,
0.2505534, -0.1777119, 0.710479, 1, 1, 1, 1, 1,
0.2536754, -1.248686, 3.024182, 1, 1, 1, 1, 1,
0.2663827, 0.04624387, 2.828605, 1, 1, 1, 1, 1,
0.2673328, 0.04816614, 2.398741, 1, 1, 1, 1, 1,
0.2676111, 0.3308168, 0.6586637, 1, 1, 1, 1, 1,
0.2677231, 0.1244882, 1.14861, 1, 1, 1, 1, 1,
0.267737, 0.5714037, 1.476192, 1, 1, 1, 1, 1,
0.2721868, -1.832788, 3.054821, 1, 1, 1, 1, 1,
0.2754087, 0.5889038, -0.8478367, 1, 1, 1, 1, 1,
0.2811279, -0.4336532, 3.818998, 1, 1, 1, 1, 1,
0.2860748, 0.9480068, -1.424728, 1, 1, 1, 1, 1,
0.2911796, -0.5794212, 2.561741, 1, 1, 1, 1, 1,
0.2920229, -0.7378126, 2.220615, 1, 1, 1, 1, 1,
0.3056361, 0.3285818, 0.4063812, 0, 0, 1, 1, 1,
0.3065955, -0.3236554, 3.738034, 1, 0, 0, 1, 1,
0.3101895, -0.6834903, 2.088569, 1, 0, 0, 1, 1,
0.312328, -1.514674, 2.592495, 1, 0, 0, 1, 1,
0.3185833, -0.9794253, 2.846197, 1, 0, 0, 1, 1,
0.3275778, 0.2209421, 1.115648, 1, 0, 0, 1, 1,
0.331591, -1.337693, 3.706792, 0, 0, 0, 1, 1,
0.3367468, -0.4601446, 1.222553, 0, 0, 0, 1, 1,
0.3367693, -0.09701979, 1.949345, 0, 0, 0, 1, 1,
0.3368053, 0.1144915, 0.5501117, 0, 0, 0, 1, 1,
0.3411288, -0.2933015, 1.189085, 0, 0, 0, 1, 1,
0.3489123, -0.6950665, 4.479555, 0, 0, 0, 1, 1,
0.3514198, 0.2599897, -0.01604652, 0, 0, 0, 1, 1,
0.3537049, 0.2490454, 1.35318, 1, 1, 1, 1, 1,
0.3565775, 0.3910983, 0.6777728, 1, 1, 1, 1, 1,
0.3636164, 1.56378, -0.08852673, 1, 1, 1, 1, 1,
0.3642134, 0.4245429, -0.7988313, 1, 1, 1, 1, 1,
0.3678283, 0.8855451, 0.8662761, 1, 1, 1, 1, 1,
0.369088, -0.7007489, 2.844586, 1, 1, 1, 1, 1,
0.3700935, -0.866803, 3.780658, 1, 1, 1, 1, 1,
0.3724352, 0.8789898, 2.525904, 1, 1, 1, 1, 1,
0.3729674, 1.237905, 0.7644116, 1, 1, 1, 1, 1,
0.3830234, 0.9308495, 1.104299, 1, 1, 1, 1, 1,
0.3953303, -0.507221, 4.625716, 1, 1, 1, 1, 1,
0.3963275, 0.4965388, 0.875614, 1, 1, 1, 1, 1,
0.407304, -0.1671282, 1.994538, 1, 1, 1, 1, 1,
0.4076692, 1.675765, 0.5615919, 1, 1, 1, 1, 1,
0.4084727, 0.2719748, 0.06064407, 1, 1, 1, 1, 1,
0.4116952, 1.263535, -0.3156728, 0, 0, 1, 1, 1,
0.4138028, -0.5174724, 3.056913, 1, 0, 0, 1, 1,
0.4142284, -0.4018603, 3.827637, 1, 0, 0, 1, 1,
0.4159526, 2.067804, 1.04624, 1, 0, 0, 1, 1,
0.4275161, 0.04273176, 2.974054, 1, 0, 0, 1, 1,
0.4288963, 0.3070312, 0.9941176, 1, 0, 0, 1, 1,
0.4309982, -1.497729, 1.667668, 0, 0, 0, 1, 1,
0.4365346, -0.7548088, 1.614415, 0, 0, 0, 1, 1,
0.4414985, -0.02561516, 1.529672, 0, 0, 0, 1, 1,
0.4429446, 0.9375541, 1.525509, 0, 0, 0, 1, 1,
0.4431032, 0.5734121, 1.048042, 0, 0, 0, 1, 1,
0.4434556, 1.067646, -2.071198, 0, 0, 0, 1, 1,
0.4453569, -0.3559076, 1.807822, 0, 0, 0, 1, 1,
0.4490467, -1.239325, 2.056437, 1, 1, 1, 1, 1,
0.4508436, -0.2540857, 1.260889, 1, 1, 1, 1, 1,
0.4534149, -0.2439781, 2.481802, 1, 1, 1, 1, 1,
0.4573244, -0.2927364, 1.403872, 1, 1, 1, 1, 1,
0.4587689, 0.5055592, 0.484171, 1, 1, 1, 1, 1,
0.4610306, 0.1887007, 0.6814467, 1, 1, 1, 1, 1,
0.4632869, 0.6650901, 0.2875462, 1, 1, 1, 1, 1,
0.4650797, 1.391759, -0.5057319, 1, 1, 1, 1, 1,
0.4671916, 1.324562, 0.7802347, 1, 1, 1, 1, 1,
0.4675082, -0.3990266, 3.545695, 1, 1, 1, 1, 1,
0.4709278, -1.736638, 4.909002, 1, 1, 1, 1, 1,
0.4788814, 1.837658, -0.7659761, 1, 1, 1, 1, 1,
0.4827098, 0.2508906, 0.7761174, 1, 1, 1, 1, 1,
0.486201, 1.355172, 0.8732469, 1, 1, 1, 1, 1,
0.4869942, -0.9354573, 1.225548, 1, 1, 1, 1, 1,
0.4932512, 1.071198, 1.355258, 0, 0, 1, 1, 1,
0.4992995, 0.1128867, 0.9619337, 1, 0, 0, 1, 1,
0.500091, -1.668792, 1.259627, 1, 0, 0, 1, 1,
0.5070722, -0.6675351, 0.629522, 1, 0, 0, 1, 1,
0.5091903, -2.094903, 3.065583, 1, 0, 0, 1, 1,
0.5091988, -1.134231, 3.3807, 1, 0, 0, 1, 1,
0.5097509, 0.7876244, -1.926766, 0, 0, 0, 1, 1,
0.5111251, 0.6256477, 2.74548, 0, 0, 0, 1, 1,
0.5122759, -0.057816, 1.261045, 0, 0, 0, 1, 1,
0.5122799, -0.5969248, 2.437848, 0, 0, 0, 1, 1,
0.5154228, 0.5061787, 1.448538, 0, 0, 0, 1, 1,
0.5188251, -0.9986901, 2.968336, 0, 0, 0, 1, 1,
0.5225093, -0.1202649, 2.55759, 0, 0, 0, 1, 1,
0.5225885, -0.4907353, 1.31842, 1, 1, 1, 1, 1,
0.5230339, -0.5022902, 1.937695, 1, 1, 1, 1, 1,
0.5341249, -0.09336508, 1.983231, 1, 1, 1, 1, 1,
0.5341819, 1.952782, 0.5957701, 1, 1, 1, 1, 1,
0.5352358, -0.4499539, 1.975083, 1, 1, 1, 1, 1,
0.5415407, 0.8994616, -0.02792634, 1, 1, 1, 1, 1,
0.5432109, 0.3424073, 0.4356001, 1, 1, 1, 1, 1,
0.5449014, 1.026694, 0.1597545, 1, 1, 1, 1, 1,
0.5496335, 1.16534, 1.241279, 1, 1, 1, 1, 1,
0.5519235, 0.1696512, 0.9572112, 1, 1, 1, 1, 1,
0.5542899, 0.3213391, 0.1270235, 1, 1, 1, 1, 1,
0.556316, -0.4010643, 1.31833, 1, 1, 1, 1, 1,
0.5609708, 1.088505, 1.093917, 1, 1, 1, 1, 1,
0.5638383, -0.5751265, 2.216641, 1, 1, 1, 1, 1,
0.5700302, 0.7823328, 1.307979, 1, 1, 1, 1, 1,
0.5701638, 0.110226, 3.156624, 0, 0, 1, 1, 1,
0.5703035, 0.3856182, 2.252203, 1, 0, 0, 1, 1,
0.570671, -0.1429227, 1.428003, 1, 0, 0, 1, 1,
0.5717003, 0.6177107, -0.4461772, 1, 0, 0, 1, 1,
0.5747054, -1.124017, 3.033783, 1, 0, 0, 1, 1,
0.5778543, 2.015565, 1.054435, 1, 0, 0, 1, 1,
0.5792771, 0.03856888, 0.1136549, 0, 0, 0, 1, 1,
0.5812333, -3.857495, 1.983047, 0, 0, 0, 1, 1,
0.5822484, -0.4476913, 2.064101, 0, 0, 0, 1, 1,
0.5823413, 0.4669866, 0.6042012, 0, 0, 0, 1, 1,
0.5836133, -0.5383456, 2.413427, 0, 0, 0, 1, 1,
0.5848892, 1.054324, -1.212972, 0, 0, 0, 1, 1,
0.5855861, -0.1816519, 0.6953989, 0, 0, 0, 1, 1,
0.5860552, 1.168928, -0.5885267, 1, 1, 1, 1, 1,
0.5877339, -0.59232, 3.387239, 1, 1, 1, 1, 1,
0.5903862, -0.3356166, 1.813669, 1, 1, 1, 1, 1,
0.5923085, -0.9418359, 2.82524, 1, 1, 1, 1, 1,
0.5937204, 0.961987, 2.304148, 1, 1, 1, 1, 1,
0.5981562, 0.8617021, 0.8910198, 1, 1, 1, 1, 1,
0.5989515, 0.189461, 2.891673, 1, 1, 1, 1, 1,
0.6000465, -1.452834, 3.97944, 1, 1, 1, 1, 1,
0.6010553, 1.25478, 1.769989, 1, 1, 1, 1, 1,
0.6035705, 0.01622457, -0.1922775, 1, 1, 1, 1, 1,
0.6082063, 2.386018, 0.4741522, 1, 1, 1, 1, 1,
0.6083898, -1.071233, 3.932007, 1, 1, 1, 1, 1,
0.6096675, -1.544675, 4.038643, 1, 1, 1, 1, 1,
0.6171268, 0.455774, 1.462194, 1, 1, 1, 1, 1,
0.6194341, 0.4788681, 2.547135, 1, 1, 1, 1, 1,
0.6227799, 0.1599338, -1.065135, 0, 0, 1, 1, 1,
0.6234761, -1.770753, 3.082689, 1, 0, 0, 1, 1,
0.6254666, 1.151591, 0.2254829, 1, 0, 0, 1, 1,
0.6286945, -0.7084286, 0.796968, 1, 0, 0, 1, 1,
0.6287937, 0.6613113, 1.253425, 1, 0, 0, 1, 1,
0.6297644, -0.6189138, 1.465555, 1, 0, 0, 1, 1,
0.6340886, 0.9425747, 0.7069428, 0, 0, 0, 1, 1,
0.6343071, 0.28555, 0.3843442, 0, 0, 0, 1, 1,
0.6375787, 0.7489495, 0.4717468, 0, 0, 0, 1, 1,
0.6419428, 0.2029961, 2.5502, 0, 0, 0, 1, 1,
0.6427972, -0.2472612, 2.060085, 0, 0, 0, 1, 1,
0.6428109, 0.5309063, -1.380455, 0, 0, 0, 1, 1,
0.6479564, -0.3734652, 2.134084, 0, 0, 0, 1, 1,
0.6492078, 0.6404809, 0.9627606, 1, 1, 1, 1, 1,
0.6506094, 1.862416, 1.265474, 1, 1, 1, 1, 1,
0.6508926, -0.4944781, 2.838827, 1, 1, 1, 1, 1,
0.6551747, -0.2945508, 2.270691, 1, 1, 1, 1, 1,
0.6608846, 1.301537, 2.546938, 1, 1, 1, 1, 1,
0.670976, -0.704264, 2.855792, 1, 1, 1, 1, 1,
0.6749356, -0.310678, 2.888618, 1, 1, 1, 1, 1,
0.6762365, 0.3172636, 0.9046526, 1, 1, 1, 1, 1,
0.6812293, -0.9060571, 2.918642, 1, 1, 1, 1, 1,
0.6819496, -1.384513, 3.51496, 1, 1, 1, 1, 1,
0.6820421, 0.3253575, 0.994703, 1, 1, 1, 1, 1,
0.6843116, -1.503039, 3.866565, 1, 1, 1, 1, 1,
0.692594, 0.02140426, 1.246318, 1, 1, 1, 1, 1,
0.6937322, 1.549253, 1.361466, 1, 1, 1, 1, 1,
0.6957519, -0.2629924, 1.624154, 1, 1, 1, 1, 1,
0.698981, 1.150495, 0.9218974, 0, 0, 1, 1, 1,
0.7099489, -0.6057671, 1.148896, 1, 0, 0, 1, 1,
0.7145921, 0.5406317, 0.3620394, 1, 0, 0, 1, 1,
0.7205704, 2.370243, -0.243965, 1, 0, 0, 1, 1,
0.7253173, 2.11348, 0.07506205, 1, 0, 0, 1, 1,
0.7279322, 0.1494942, 0.4386971, 1, 0, 0, 1, 1,
0.7421803, 0.7891611, -0.03204556, 0, 0, 0, 1, 1,
0.7441106, -0.1535102, 2.92096, 0, 0, 0, 1, 1,
0.7466971, 1.522297, 2.80755, 0, 0, 0, 1, 1,
0.7545949, 0.9199674, -0.3384686, 0, 0, 0, 1, 1,
0.7550188, -0.2496134, 1.640167, 0, 0, 0, 1, 1,
0.7565414, 0.4556205, 2.86064, 0, 0, 0, 1, 1,
0.7584707, -0.03034207, 2.82056, 0, 0, 0, 1, 1,
0.7587038, 0.8130538, 1.60849, 1, 1, 1, 1, 1,
0.7612154, -0.6861416, 3.215517, 1, 1, 1, 1, 1,
0.7630503, -0.3773369, 3.365368, 1, 1, 1, 1, 1,
0.7654467, -0.03422071, 2.730858, 1, 1, 1, 1, 1,
0.7659081, -0.4265622, 1.492993, 1, 1, 1, 1, 1,
0.766695, 1.233348, 0.6771744, 1, 1, 1, 1, 1,
0.7717, 1.819101, 1.904929, 1, 1, 1, 1, 1,
0.7737969, 0.7335852, -0.03574483, 1, 1, 1, 1, 1,
0.7740431, 1.394395, 0.0497065, 1, 1, 1, 1, 1,
0.7758517, -0.4431306, 3.809801, 1, 1, 1, 1, 1,
0.7791434, -1.946319, 1.761309, 1, 1, 1, 1, 1,
0.7831218, -0.005623655, 0.07132579, 1, 1, 1, 1, 1,
0.7876052, 0.7951924, -0.4683547, 1, 1, 1, 1, 1,
0.7879065, -0.04533854, -0.1253363, 1, 1, 1, 1, 1,
0.7916911, 0.6085893, -0.8651869, 1, 1, 1, 1, 1,
0.7921882, 0.2448812, 1.299886, 0, 0, 1, 1, 1,
0.7934935, -0.5339234, 2.850691, 1, 0, 0, 1, 1,
0.793896, -1.55387, 3.281461, 1, 0, 0, 1, 1,
0.7963396, -0.201506, 2.421324, 1, 0, 0, 1, 1,
0.8052577, 0.7077734, 2.548341, 1, 0, 0, 1, 1,
0.8075649, 0.5952774, 1.793964, 1, 0, 0, 1, 1,
0.8077404, 0.3676212, 0.02918709, 0, 0, 0, 1, 1,
0.8093787, -1.53784, 2.791751, 0, 0, 0, 1, 1,
0.8164127, 0.0450333, 1.183777, 0, 0, 0, 1, 1,
0.8318552, 0.9813544, 1.56694, 0, 0, 0, 1, 1,
0.8329114, -0.2711176, 1.919674, 0, 0, 0, 1, 1,
0.8391617, 0.493311, 0.6685378, 0, 0, 0, 1, 1,
0.8453251, -0.03171182, 0.3038089, 0, 0, 0, 1, 1,
0.8464624, 0.9298437, 1.418052, 1, 1, 1, 1, 1,
0.8474633, 1.256028, 0.5728204, 1, 1, 1, 1, 1,
0.8496332, -2.291316, 2.461383, 1, 1, 1, 1, 1,
0.8539885, 0.5395651, 1.368429, 1, 1, 1, 1, 1,
0.8546017, 0.696754, 0.4463759, 1, 1, 1, 1, 1,
0.8560761, 1.570919, -0.43062, 1, 1, 1, 1, 1,
0.8564564, -0.3640379, 2.738972, 1, 1, 1, 1, 1,
0.8661296, 1.197848, 1.658733, 1, 1, 1, 1, 1,
0.8705829, -1.072297, 0.5580205, 1, 1, 1, 1, 1,
0.8764388, -1.799473, 3.552374, 1, 1, 1, 1, 1,
0.8789652, 1.234578, 1.65447, 1, 1, 1, 1, 1,
0.8862479, -0.4460823, 1.483565, 1, 1, 1, 1, 1,
0.8871554, -0.6959365, 2.360231, 1, 1, 1, 1, 1,
0.8907445, 0.3376038, 0.9118616, 1, 1, 1, 1, 1,
0.8917415, -1.281706, 1.353405, 1, 1, 1, 1, 1,
0.8941327, -1.276181, 3.242477, 0, 0, 1, 1, 1,
0.8980066, -1.246165, 3.391295, 1, 0, 0, 1, 1,
0.9012203, -0.4023612, 1.243545, 1, 0, 0, 1, 1,
0.9019384, -0.9143112, 1.373529, 1, 0, 0, 1, 1,
0.9045279, -0.2865581, 1.989082, 1, 0, 0, 1, 1,
0.9081587, -1.574324, 2.14059, 1, 0, 0, 1, 1,
0.9111584, 1.681044, 0.7474656, 0, 0, 0, 1, 1,
0.9163085, 0.2162634, 0.2936692, 0, 0, 0, 1, 1,
0.9164819, 0.9423158, 2.558789, 0, 0, 0, 1, 1,
0.9180601, -0.8445995, 2.387936, 0, 0, 0, 1, 1,
0.9219535, 0.07308991, 4.11501, 0, 0, 0, 1, 1,
0.9252708, 1.719786, 0.8665649, 0, 0, 0, 1, 1,
0.9274775, -1.324287, 0.952332, 0, 0, 0, 1, 1,
0.9283585, 0.7675906, 2.009877, 1, 1, 1, 1, 1,
0.9285755, -0.111015, 1.462249, 1, 1, 1, 1, 1,
0.930718, -0.4237946, 2.22197, 1, 1, 1, 1, 1,
0.9347095, 1.649487, 0.7202737, 1, 1, 1, 1, 1,
0.9366285, -1.222832, 2.701825, 1, 1, 1, 1, 1,
0.939612, -0.4147027, 0.4765353, 1, 1, 1, 1, 1,
0.9407889, -0.4638927, 2.684898, 1, 1, 1, 1, 1,
0.9461592, 0.8161586, 1.008244, 1, 1, 1, 1, 1,
0.956053, 0.8925822, 1.480713, 1, 1, 1, 1, 1,
0.9576676, -0.9608625, 1.362663, 1, 1, 1, 1, 1,
0.9595448, -0.182487, 3.751001, 1, 1, 1, 1, 1,
0.9599081, 0.9871091, 0.8575096, 1, 1, 1, 1, 1,
0.9679748, -0.5995486, 3.083792, 1, 1, 1, 1, 1,
0.9705234, 0.1160102, 3.510027, 1, 1, 1, 1, 1,
0.9740877, 0.4051047, 2.334318, 1, 1, 1, 1, 1,
0.9789519, -2.086218, 6.089277, 0, 0, 1, 1, 1,
0.9826573, -1.473487, 1.819074, 1, 0, 0, 1, 1,
0.983155, -0.008077719, 1.678238, 1, 0, 0, 1, 1,
0.9845882, -0.008171328, -0.741002, 1, 0, 0, 1, 1,
0.9855402, 1.277757, 1.468683, 1, 0, 0, 1, 1,
0.988894, -0.3004891, 3.213633, 1, 0, 0, 1, 1,
0.9899557, 1.040228, 0.6281269, 0, 0, 0, 1, 1,
0.996357, 0.6922678, 0.9053202, 0, 0, 0, 1, 1,
1.007657, 0.69434, 1.555821, 0, 0, 0, 1, 1,
1.008587, -0.2358381, 3.132066, 0, 0, 0, 1, 1,
1.022665, -0.5328386, 1.948913, 0, 0, 0, 1, 1,
1.023482, -0.5265793, 1.421013, 0, 0, 0, 1, 1,
1.036422, 1.512501, -0.1809403, 0, 0, 0, 1, 1,
1.043078, 1.868307, 1.29237, 1, 1, 1, 1, 1,
1.053226, -0.8698846, 2.003371, 1, 1, 1, 1, 1,
1.053288, 0.5108692, 2.223108, 1, 1, 1, 1, 1,
1.074304, -0.7253757, 1.353351, 1, 1, 1, 1, 1,
1.074853, 1.030463, -0.3121544, 1, 1, 1, 1, 1,
1.075272, -2.416017, 1.911523, 1, 1, 1, 1, 1,
1.076429, -0.9726749, 2.179537, 1, 1, 1, 1, 1,
1.08186, -0.4168384, 1.41041, 1, 1, 1, 1, 1,
1.082585, 0.3555491, 1.279724, 1, 1, 1, 1, 1,
1.084209, -0.4917357, 3.429586, 1, 1, 1, 1, 1,
1.091747, -1.562395, 1.767516, 1, 1, 1, 1, 1,
1.096923, -0.2798824, 1.848982, 1, 1, 1, 1, 1,
1.097004, 0.02429987, 2.175696, 1, 1, 1, 1, 1,
1.098001, 1.36161, -0.3555938, 1, 1, 1, 1, 1,
1.099397, -2.045777, 2.478307, 1, 1, 1, 1, 1,
1.104625, -1.645188, 2.592063, 0, 0, 1, 1, 1,
1.104769, -0.5003991, 2.063153, 1, 0, 0, 1, 1,
1.116854, 0.3009768, 0.757497, 1, 0, 0, 1, 1,
1.122509, 0.03673539, 1.920756, 1, 0, 0, 1, 1,
1.143686, -1.225252, 2.21033, 1, 0, 0, 1, 1,
1.146263, -0.0437563, 1.156383, 1, 0, 0, 1, 1,
1.147045, -0.8330113, 2.21451, 0, 0, 0, 1, 1,
1.1509, -0.0151209, 1.213317, 0, 0, 0, 1, 1,
1.154863, -0.7928688, 1.317741, 0, 0, 0, 1, 1,
1.159445, -0.534551, 1.456534, 0, 0, 0, 1, 1,
1.16062, -0.3498403, 0.3964444, 0, 0, 0, 1, 1,
1.167803, 0.5912339, 0.1655389, 0, 0, 0, 1, 1,
1.169255, 0.3011896, 1.918597, 0, 0, 0, 1, 1,
1.18402, -1.486206, 1.637143, 1, 1, 1, 1, 1,
1.194075, 0.5958059, 0.2553217, 1, 1, 1, 1, 1,
1.202251, -0.6056988, 0.90706, 1, 1, 1, 1, 1,
1.204211, -0.5035409, 1.648972, 1, 1, 1, 1, 1,
1.205928, -0.007094266, 1.832238, 1, 1, 1, 1, 1,
1.206437, -1.244132, 3.009412, 1, 1, 1, 1, 1,
1.206641, 1.148515, -0.1199913, 1, 1, 1, 1, 1,
1.212868, 0.06596362, 1.354693, 1, 1, 1, 1, 1,
1.222072, -1.48518, 0.3810411, 1, 1, 1, 1, 1,
1.223892, -1.306787, 2.653536, 1, 1, 1, 1, 1,
1.228856, 0.1037932, 1.924067, 1, 1, 1, 1, 1,
1.229732, 0.4463632, 1.274487, 1, 1, 1, 1, 1,
1.229933, 0.3144454, 2.168069, 1, 1, 1, 1, 1,
1.234658, 0.5120231, 2.163827, 1, 1, 1, 1, 1,
1.236656, 0.2988214, -0.9144861, 1, 1, 1, 1, 1,
1.270186, 0.2808554, 0.8596735, 0, 0, 1, 1, 1,
1.278337, -0.3162968, 2.475668, 1, 0, 0, 1, 1,
1.279201, 1.349542, 0.5680666, 1, 0, 0, 1, 1,
1.292595, 0.2973669, 1.092804, 1, 0, 0, 1, 1,
1.292858, -1.23115, 2.392747, 1, 0, 0, 1, 1,
1.317419, -1.279683, 1.216781, 1, 0, 0, 1, 1,
1.323128, -0.246744, 2.324009, 0, 0, 0, 1, 1,
1.325091, 0.02578898, 0.5938967, 0, 0, 0, 1, 1,
1.32626, -2.484181, 4.421994, 0, 0, 0, 1, 1,
1.326683, -1.074544, 1.676458, 0, 0, 0, 1, 1,
1.328564, 0.460869, 0.7715442, 0, 0, 0, 1, 1,
1.330852, 0.1294958, 0.8899817, 0, 0, 0, 1, 1,
1.331242, 0.3618837, -0.6574646, 0, 0, 0, 1, 1,
1.3335, -0.3110943, 2.570975, 1, 1, 1, 1, 1,
1.333747, 0.479775, 3.306901, 1, 1, 1, 1, 1,
1.34326, -1.310408, 1.397974, 1, 1, 1, 1, 1,
1.34885, 1.680151, 1.297901, 1, 1, 1, 1, 1,
1.350719, -1.03722, 1.792921, 1, 1, 1, 1, 1,
1.355972, -0.9501556, 4.035227, 1, 1, 1, 1, 1,
1.362003, 0.4529001, -0.01943567, 1, 1, 1, 1, 1,
1.370634, 0.1390701, 0.9406403, 1, 1, 1, 1, 1,
1.399272, -1.143063, 2.310397, 1, 1, 1, 1, 1,
1.402736, 0.8920103, 2.258617, 1, 1, 1, 1, 1,
1.436196, -0.1981772, 1.737456, 1, 1, 1, 1, 1,
1.436724, -1.297413, 2.236026, 1, 1, 1, 1, 1,
1.43883, -0.292903, 2.161505, 1, 1, 1, 1, 1,
1.444631, 0.6114349, 0.9218689, 1, 1, 1, 1, 1,
1.446005, -1.621001, -0.2106194, 1, 1, 1, 1, 1,
1.450307, 0.7240127, 1.993347, 0, 0, 1, 1, 1,
1.451125, 1.272197, 0.451431, 1, 0, 0, 1, 1,
1.457597, -0.4927064, 0.6371444, 1, 0, 0, 1, 1,
1.469218, -1.170083, 3.320332, 1, 0, 0, 1, 1,
1.484285, 0.160563, 1.439011, 1, 0, 0, 1, 1,
1.485404, -1.0639, 2.339713, 1, 0, 0, 1, 1,
1.485844, -0.08407447, 0.2541128, 0, 0, 0, 1, 1,
1.505116, -0.7699766, 2.135776, 0, 0, 0, 1, 1,
1.515172, -1.011535, 3.737231, 0, 0, 0, 1, 1,
1.519984, 0.1033748, 1.263466, 0, 0, 0, 1, 1,
1.52211, -1.538293, 2.625588, 0, 0, 0, 1, 1,
1.53136, 0.1265969, 1.722675, 0, 0, 0, 1, 1,
1.536008, -0.2825684, 1.192779, 0, 0, 0, 1, 1,
1.539441, 0.8173918, 0.9402035, 1, 1, 1, 1, 1,
1.557084, 0.143808, 3.011866, 1, 1, 1, 1, 1,
1.573421, -0.8272316, 2.344196, 1, 1, 1, 1, 1,
1.574658, -0.3541897, 1.515068, 1, 1, 1, 1, 1,
1.582866, -1.130612, 2.73934, 1, 1, 1, 1, 1,
1.587442, 1.547909, 1.614966, 1, 1, 1, 1, 1,
1.588386, 0.6614509, 0.8854666, 1, 1, 1, 1, 1,
1.58948, 1.176911, 0.5871159, 1, 1, 1, 1, 1,
1.596022, -1.755833, 3.30928, 1, 1, 1, 1, 1,
1.599149, 0.3579648, 1.595171, 1, 1, 1, 1, 1,
1.606048, -2.008455, 1.420059, 1, 1, 1, 1, 1,
1.618609, 0.970647, 2.13269, 1, 1, 1, 1, 1,
1.622455, 0.8144886, 1.713112, 1, 1, 1, 1, 1,
1.632518, -1.052994, 1.295442, 1, 1, 1, 1, 1,
1.640286, -0.1732757, 1.995201, 1, 1, 1, 1, 1,
1.651289, 0.7996458, 2.103901, 0, 0, 1, 1, 1,
1.654267, 1.213271, 0.06328021, 1, 0, 0, 1, 1,
1.6647, -1.400445, 2.937636, 1, 0, 0, 1, 1,
1.68153, 0.9213665, 0.7116642, 1, 0, 0, 1, 1,
1.702068, 0.6406837, 2.141015, 1, 0, 0, 1, 1,
1.702802, 0.06658906, -0.0292561, 1, 0, 0, 1, 1,
1.7271, 1.263758, 2.369389, 0, 0, 0, 1, 1,
1.751931, 2.68842, 1.011817, 0, 0, 0, 1, 1,
1.760914, 1.365701, 0.9148167, 0, 0, 0, 1, 1,
1.767208, -1.739461, 1.696245, 0, 0, 0, 1, 1,
1.779928, 1.236828, 0.2411573, 0, 0, 0, 1, 1,
1.782028, -2.514857, 1.664249, 0, 0, 0, 1, 1,
1.785989, 0.1310539, 2.699976, 0, 0, 0, 1, 1,
1.804839, 0.1817551, 1.590378, 1, 1, 1, 1, 1,
1.810192, -0.2238997, 1.519794, 1, 1, 1, 1, 1,
1.817714, -1.135723, 0.8672604, 1, 1, 1, 1, 1,
1.819228, 0.1371041, 1.815307, 1, 1, 1, 1, 1,
1.819466, -1.854265, 2.613388, 1, 1, 1, 1, 1,
1.850535, 1.416384, 1.077827, 1, 1, 1, 1, 1,
1.870118, -0.03409068, 1.668351, 1, 1, 1, 1, 1,
1.88837, -0.8033442, 0.4417844, 1, 1, 1, 1, 1,
1.916987, -0.1415028, 2.984137, 1, 1, 1, 1, 1,
1.91766, -1.056738, 2.82839, 1, 1, 1, 1, 1,
1.927502, -0.007542685, 2.129802, 1, 1, 1, 1, 1,
1.934243, 1.509107, 0.8238856, 1, 1, 1, 1, 1,
1.956287, 0.3421152, 2.782674, 1, 1, 1, 1, 1,
1.982865, -0.7517192, 1.533333, 1, 1, 1, 1, 1,
1.995869, 0.6367703, 2.988248, 1, 1, 1, 1, 1,
1.999617, 0.3906344, 1.131366, 0, 0, 1, 1, 1,
2.050264, -2.397326, 1.198213, 1, 0, 0, 1, 1,
2.052636, -0.234257, 2.447041, 1, 0, 0, 1, 1,
2.06088, 1.227271, 1.726361, 1, 0, 0, 1, 1,
2.072618, -0.72953, 1.784311, 1, 0, 0, 1, 1,
2.077127, -0.5669199, 1.158396, 1, 0, 0, 1, 1,
2.096429, -0.06283936, 1.760425, 0, 0, 0, 1, 1,
2.17345, -0.3979973, 0.5499933, 0, 0, 0, 1, 1,
2.184989, -0.8606848, 2.450766, 0, 0, 0, 1, 1,
2.197347, -0.8752617, 3.141875, 0, 0, 0, 1, 1,
2.234486, 0.5767078, 1.801877, 0, 0, 0, 1, 1,
2.257089, -0.2514017, 1.582055, 0, 0, 0, 1, 1,
2.282281, -0.752073, 1.416229, 0, 0, 0, 1, 1,
2.291937, 0.1674452, 2.202689, 1, 1, 1, 1, 1,
2.31896, 0.2269529, 1.786515, 1, 1, 1, 1, 1,
2.576985, 0.5538918, 1.007606, 1, 1, 1, 1, 1,
2.585728, -0.8830683, 1.958847, 1, 1, 1, 1, 1,
2.900587, -1.742692, 1.144966, 1, 1, 1, 1, 1,
3.318674, 0.5920544, 1.742929, 1, 1, 1, 1, 1,
3.52814, 2.340633, 1.370346, 1, 1, 1, 1, 1
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
var radius = 10.55;
var distance = 37.05643;
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
mvMatrix.translate( 0.1275573, 0.267761, -0.07184172 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.05643);
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