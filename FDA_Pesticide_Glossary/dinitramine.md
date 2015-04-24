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
-3.404616, -0.1211433, -1.342424, 1, 0, 0, 1,
-3.160205, 1.873231, 0.1847712, 1, 0.007843138, 0, 1,
-2.782246, -0.2442217, -2.714451, 1, 0.01176471, 0, 1,
-2.644876, 0.1054714, -0.7829694, 1, 0.01960784, 0, 1,
-2.631989, 0.5526025, -1.675708, 1, 0.02352941, 0, 1,
-2.582993, 0.006512375, -1.711666, 1, 0.03137255, 0, 1,
-2.465353, -0.7698244, -1.905845, 1, 0.03529412, 0, 1,
-2.405121, -0.002738865, -1.48294, 1, 0.04313726, 0, 1,
-2.405065, -0.1120901, -2.792113, 1, 0.04705882, 0, 1,
-2.389549, -0.09688404, -1.684268, 1, 0.05490196, 0, 1,
-2.373158, 0.1251212, -1.188737, 1, 0.05882353, 0, 1,
-2.301447, 1.219355, -0.9344019, 1, 0.06666667, 0, 1,
-2.232382, 0.184635, -0.9404057, 1, 0.07058824, 0, 1,
-2.225348, -1.211614, -1.517517, 1, 0.07843138, 0, 1,
-2.190695, 0.8939198, -1.509277, 1, 0.08235294, 0, 1,
-2.164261, 1.41607, -0.2357564, 1, 0.09019608, 0, 1,
-2.083428, -0.6539489, -1.230375, 1, 0.09411765, 0, 1,
-2.055664, -0.1696107, -0.8118714, 1, 0.1019608, 0, 1,
-2.049646, 0.08696567, -0.8014487, 1, 0.1098039, 0, 1,
-2.028075, 0.02084423, -1.570701, 1, 0.1137255, 0, 1,
-2.006421, -1.275994, -2.528791, 1, 0.1215686, 0, 1,
-2.004598, 1.069582, -1.698669, 1, 0.1254902, 0, 1,
-1.998771, 0.7379447, -1.331742, 1, 0.1333333, 0, 1,
-1.997267, -0.4937899, -2.078719, 1, 0.1372549, 0, 1,
-1.942281, 0.5789189, -0.4954081, 1, 0.145098, 0, 1,
-1.923663, -0.01413132, -0.7764755, 1, 0.1490196, 0, 1,
-1.903427, -1.287442, -3.568454, 1, 0.1568628, 0, 1,
-1.897263, -0.0537517, -1.784943, 1, 0.1607843, 0, 1,
-1.887292, -1.07525, -2.156548, 1, 0.1686275, 0, 1,
-1.864804, -1.010256, -2.156622, 1, 0.172549, 0, 1,
-1.841635, 0.8373935, -0.463417, 1, 0.1803922, 0, 1,
-1.808059, 1.882972, -0.2919673, 1, 0.1843137, 0, 1,
-1.801253, 0.2093861, -1.524392, 1, 0.1921569, 0, 1,
-1.795992, 0.9876498, 0.3954472, 1, 0.1960784, 0, 1,
-1.794602, -0.06117263, -0.4136338, 1, 0.2039216, 0, 1,
-1.777603, -0.4579196, -1.299238, 1, 0.2117647, 0, 1,
-1.773902, -0.8003582, -0.1887791, 1, 0.2156863, 0, 1,
-1.76824, -1.140202, -3.733005, 1, 0.2235294, 0, 1,
-1.721197, 0.6802744, -1.654855, 1, 0.227451, 0, 1,
-1.704305, -0.5646499, -3.137137, 1, 0.2352941, 0, 1,
-1.690094, -0.7588608, -1.221941, 1, 0.2392157, 0, 1,
-1.676204, -0.9187597, -2.648861, 1, 0.2470588, 0, 1,
-1.667512, 0.3928074, -1.396407, 1, 0.2509804, 0, 1,
-1.665517, 0.7853579, -0.3541586, 1, 0.2588235, 0, 1,
-1.661683, 0.2566717, 0.9539565, 1, 0.2627451, 0, 1,
-1.646711, 1.505421, -0.1419917, 1, 0.2705882, 0, 1,
-1.628948, 0.08131392, -0.4761341, 1, 0.2745098, 0, 1,
-1.601398, -0.2977645, -2.940425, 1, 0.282353, 0, 1,
-1.58112, -0.8190569, -0.9839485, 1, 0.2862745, 0, 1,
-1.580451, 0.2308853, 0.5338955, 1, 0.2941177, 0, 1,
-1.579874, -0.6715794, -0.5245546, 1, 0.3019608, 0, 1,
-1.578401, -0.7785737, -0.5503682, 1, 0.3058824, 0, 1,
-1.577455, -0.434398, -0.7908809, 1, 0.3137255, 0, 1,
-1.571418, -1.258272, -2.463667, 1, 0.3176471, 0, 1,
-1.570039, -0.5493305, -0.690591, 1, 0.3254902, 0, 1,
-1.568991, -1.638195, -0.8179927, 1, 0.3294118, 0, 1,
-1.567237, 0.01179788, -1.468236, 1, 0.3372549, 0, 1,
-1.559983, -0.002791152, -0.1764728, 1, 0.3411765, 0, 1,
-1.552838, 0.194692, -1.207507, 1, 0.3490196, 0, 1,
-1.551518, 1.281837, 0.1060987, 1, 0.3529412, 0, 1,
-1.549574, -1.657881, -1.062828, 1, 0.3607843, 0, 1,
-1.546519, 0.216506, -1.244537, 1, 0.3647059, 0, 1,
-1.542603, 1.344005, -0.9531229, 1, 0.372549, 0, 1,
-1.541942, 0.1364456, -1.410079, 1, 0.3764706, 0, 1,
-1.532957, -1.542756, -2.635632, 1, 0.3843137, 0, 1,
-1.527544, -0.1552498, -2.18143, 1, 0.3882353, 0, 1,
-1.527007, 0.04223249, -1.725174, 1, 0.3960784, 0, 1,
-1.509505, 1.062878, -0.510858, 1, 0.4039216, 0, 1,
-1.498409, 1.278557, -2.473023, 1, 0.4078431, 0, 1,
-1.482848, 0.1929862, -0.8187985, 1, 0.4156863, 0, 1,
-1.452626, -2.291564, -2.417402, 1, 0.4196078, 0, 1,
-1.450665, 1.152065, -2.351045, 1, 0.427451, 0, 1,
-1.450454, -2.103759, -0.7680995, 1, 0.4313726, 0, 1,
-1.441626, -1.29064, -1.395094, 1, 0.4392157, 0, 1,
-1.441211, 1.219715, -0.5865321, 1, 0.4431373, 0, 1,
-1.439361, 0.7756986, -0.3988632, 1, 0.4509804, 0, 1,
-1.422093, -0.2063194, -1.399426, 1, 0.454902, 0, 1,
-1.418334, -0.585914, -1.660679, 1, 0.4627451, 0, 1,
-1.41397, 1.174602, 0.5361956, 1, 0.4666667, 0, 1,
-1.396143, 0.5257261, -0.8366576, 1, 0.4745098, 0, 1,
-1.382249, -0.4149463, -0.4589565, 1, 0.4784314, 0, 1,
-1.373553, -0.1266997, -2.846064, 1, 0.4862745, 0, 1,
-1.370287, -0.001335347, -1.083731, 1, 0.4901961, 0, 1,
-1.366295, -0.3223336, -2.021835, 1, 0.4980392, 0, 1,
-1.357301, 0.5302195, -1.204111, 1, 0.5058824, 0, 1,
-1.356823, 0.3419332, -1.135749, 1, 0.509804, 0, 1,
-1.342929, -0.4423387, -2.612034, 1, 0.5176471, 0, 1,
-1.335556, 0.2746139, -1.509469, 1, 0.5215687, 0, 1,
-1.324489, 0.08242508, -0.3562838, 1, 0.5294118, 0, 1,
-1.313162, 1.138948, -0.3323722, 1, 0.5333334, 0, 1,
-1.305776, 1.585575, -0.6029677, 1, 0.5411765, 0, 1,
-1.302437, -0.3609094, -3.344498, 1, 0.5450981, 0, 1,
-1.302174, -0.14631, -2.333639, 1, 0.5529412, 0, 1,
-1.300079, -1.532243, -1.5151, 1, 0.5568628, 0, 1,
-1.29995, -1.660605, -2.786471, 1, 0.5647059, 0, 1,
-1.298292, -0.1546983, -3.528305, 1, 0.5686275, 0, 1,
-1.283571, -1.360862, -0.791324, 1, 0.5764706, 0, 1,
-1.282071, 0.06604923, -1.656546, 1, 0.5803922, 0, 1,
-1.277778, 0.6443565, -0.01216389, 1, 0.5882353, 0, 1,
-1.273996, -0.6843939, -2.211635, 1, 0.5921569, 0, 1,
-1.270358, -1.830421, -1.453225, 1, 0.6, 0, 1,
-1.266933, 1.22987, 0.4244448, 1, 0.6078432, 0, 1,
-1.263018, 0.1341917, -1.810557, 1, 0.6117647, 0, 1,
-1.250793, -1.201011, -3.239331, 1, 0.6196079, 0, 1,
-1.233442, 0.2993705, -2.490269, 1, 0.6235294, 0, 1,
-1.226484, 1.152953, -0.8923894, 1, 0.6313726, 0, 1,
-1.224248, 0.8835666, -1.828302, 1, 0.6352941, 0, 1,
-1.206387, -0.8347512, -2.763425, 1, 0.6431373, 0, 1,
-1.189911, 0.8628404, -0.3913398, 1, 0.6470588, 0, 1,
-1.183128, -0.8723494, -3.590955, 1, 0.654902, 0, 1,
-1.181053, 0.5738893, -1.763419, 1, 0.6588235, 0, 1,
-1.179668, 0.7625417, 0.7032728, 1, 0.6666667, 0, 1,
-1.166623, -0.3204916, -1.618683, 1, 0.6705883, 0, 1,
-1.166426, -0.4088846, -1.946888, 1, 0.6784314, 0, 1,
-1.164533, -1.052454, -2.352028, 1, 0.682353, 0, 1,
-1.161523, 1.175346, 0.1591077, 1, 0.6901961, 0, 1,
-1.159002, -0.1494361, -1.2133, 1, 0.6941177, 0, 1,
-1.156989, -1.408356, -2.441997, 1, 0.7019608, 0, 1,
-1.151857, 0.2177254, -2.508825, 1, 0.7098039, 0, 1,
-1.137023, -0.2451846, -2.487567, 1, 0.7137255, 0, 1,
-1.13647, 1.043211, -0.02631082, 1, 0.7215686, 0, 1,
-1.131529, -1.062277, -1.595284, 1, 0.7254902, 0, 1,
-1.12927, 0.2760878, 0.1163045, 1, 0.7333333, 0, 1,
-1.127774, -0.241783, -3.367082, 1, 0.7372549, 0, 1,
-1.125198, -0.2052541, -1.996546, 1, 0.7450981, 0, 1,
-1.115842, -1.415765, -1.015626, 1, 0.7490196, 0, 1,
-1.114627, -0.9944698, -3.441477, 1, 0.7568628, 0, 1,
-1.112912, -0.7305275, -2.093574, 1, 0.7607843, 0, 1,
-1.107077, 0.7349238, -1.831179, 1, 0.7686275, 0, 1,
-1.104098, -0.2114289, 0.003787589, 1, 0.772549, 0, 1,
-1.0964, 0.3566093, -2.55328, 1, 0.7803922, 0, 1,
-1.09494, 1.397121, 1.326896, 1, 0.7843137, 0, 1,
-1.09216, -0.364318, -0.12723, 1, 0.7921569, 0, 1,
-1.089339, 0.3695683, -1.57239, 1, 0.7960784, 0, 1,
-1.087018, 0.2390479, -3.027264, 1, 0.8039216, 0, 1,
-1.086075, -0.05259068, -0.8266242, 1, 0.8117647, 0, 1,
-1.081768, -0.3374504, -0.6787162, 1, 0.8156863, 0, 1,
-1.071164, -0.284974, -2.674754, 1, 0.8235294, 0, 1,
-1.070554, -0.5519931, -4.125359, 1, 0.827451, 0, 1,
-1.064791, 1.669978, 0.7005901, 1, 0.8352941, 0, 1,
-1.059396, -1.293869, -4.903826, 1, 0.8392157, 0, 1,
-1.055107, 0.610059, -0.06087513, 1, 0.8470588, 0, 1,
-1.055017, -0.06938247, -0.5468778, 1, 0.8509804, 0, 1,
-1.054526, -0.2511757, -2.728992, 1, 0.8588235, 0, 1,
-1.048703, -0.3075589, -0.552881, 1, 0.8627451, 0, 1,
-1.045865, -0.8573906, -2.133081, 1, 0.8705882, 0, 1,
-1.042751, 0.6282212, -0.8495067, 1, 0.8745098, 0, 1,
-1.037135, 0.75333, -0.4885433, 1, 0.8823529, 0, 1,
-1.034377, -0.5796292, -1.209233, 1, 0.8862745, 0, 1,
-1.02461, -0.3825282, -2.557118, 1, 0.8941177, 0, 1,
-1.019316, -0.7071917, -2.376529, 1, 0.8980392, 0, 1,
-1.013831, 1.329664, 0.6290354, 1, 0.9058824, 0, 1,
-1.013041, 1.164463, -0.638393, 1, 0.9137255, 0, 1,
-1.009142, -1.127438, -1.082819, 1, 0.9176471, 0, 1,
-1.00368, -0.1528076, -1.779189, 1, 0.9254902, 0, 1,
-0.99617, 0.8192706, -1.528164, 1, 0.9294118, 0, 1,
-0.9927377, 0.4828554, -1.561198, 1, 0.9372549, 0, 1,
-0.9925761, 1.736678, -0.0394893, 1, 0.9411765, 0, 1,
-0.9876705, 1.32577, -0.4292071, 1, 0.9490196, 0, 1,
-0.9774742, 0.6637531, 0.4895365, 1, 0.9529412, 0, 1,
-0.9750931, 0.8944013, 0.1085259, 1, 0.9607843, 0, 1,
-0.9681192, 1.238515, -0.730525, 1, 0.9647059, 0, 1,
-0.9675263, -0.07581595, -1.55298, 1, 0.972549, 0, 1,
-0.9557994, 0.592766, -0.7680823, 1, 0.9764706, 0, 1,
-0.9535066, -0.6962961, -2.883833, 1, 0.9843137, 0, 1,
-0.9516246, -1.453061, -1.661034, 1, 0.9882353, 0, 1,
-0.9513476, -2.885503, -3.829165, 1, 0.9960784, 0, 1,
-0.9428177, -0.3265086, -1.401878, 0.9960784, 1, 0, 1,
-0.9384032, 1.265155, -1.179171, 0.9921569, 1, 0, 1,
-0.9352645, -0.3250701, -0.1517558, 0.9843137, 1, 0, 1,
-0.9313149, 0.03703887, -0.6281114, 0.9803922, 1, 0, 1,
-0.9306089, 1.184768, -0.8115237, 0.972549, 1, 0, 1,
-0.9180663, 0.3606473, -1.495277, 0.9686275, 1, 0, 1,
-0.9127836, 2.297161, -0.7271793, 0.9607843, 1, 0, 1,
-0.91215, 0.7593429, -1.336136, 0.9568627, 1, 0, 1,
-0.9121168, -0.7398825, -2.752598, 0.9490196, 1, 0, 1,
-0.9115402, -0.8762808, -2.743797, 0.945098, 1, 0, 1,
-0.8960645, 1.646384, 0.1199081, 0.9372549, 1, 0, 1,
-0.8936119, 1.181249, -0.8587685, 0.9333333, 1, 0, 1,
-0.8881018, 0.4975732, -0.994747, 0.9254902, 1, 0, 1,
-0.8876824, -1.804275, -2.293266, 0.9215686, 1, 0, 1,
-0.8863228, -1.250743, -2.589926, 0.9137255, 1, 0, 1,
-0.8824291, -0.88898, -2.202626, 0.9098039, 1, 0, 1,
-0.8824174, -1.016213, -3.405514, 0.9019608, 1, 0, 1,
-0.8823419, -1.56326, -3.052091, 0.8941177, 1, 0, 1,
-0.8809553, 0.4973433, -2.096677, 0.8901961, 1, 0, 1,
-0.8772835, -0.4820179, -1.346371, 0.8823529, 1, 0, 1,
-0.8736343, 1.327349, -0.9412114, 0.8784314, 1, 0, 1,
-0.8728136, -0.7270711, -2.391764, 0.8705882, 1, 0, 1,
-0.870653, 0.2367457, -2.318841, 0.8666667, 1, 0, 1,
-0.8687193, -2.205282, -3.149098, 0.8588235, 1, 0, 1,
-0.8685535, -1.514941, -4.464869, 0.854902, 1, 0, 1,
-0.8643867, 0.1605157, -1.321036, 0.8470588, 1, 0, 1,
-0.8638526, 0.4343196, -1.888763, 0.8431373, 1, 0, 1,
-0.8606224, 0.900389, -0.2708014, 0.8352941, 1, 0, 1,
-0.858712, 1.338217, -0.2817293, 0.8313726, 1, 0, 1,
-0.8498437, 0.9622795, -0.00460676, 0.8235294, 1, 0, 1,
-0.8495809, -0.1089937, -1.570659, 0.8196079, 1, 0, 1,
-0.8487422, -1.896461, -1.996524, 0.8117647, 1, 0, 1,
-0.8453217, -0.03635494, -2.483772, 0.8078431, 1, 0, 1,
-0.8395659, 0.1245665, -0.2147095, 0.8, 1, 0, 1,
-0.8344767, 0.1479101, -2.305106, 0.7921569, 1, 0, 1,
-0.8310403, 1.957654, 0.589474, 0.7882353, 1, 0, 1,
-0.8307471, -1.045935, -1.161137, 0.7803922, 1, 0, 1,
-0.8296918, 0.6763774, -2.284689, 0.7764706, 1, 0, 1,
-0.8125567, -1.316887, -2.818274, 0.7686275, 1, 0, 1,
-0.809058, 0.3829384, -1.363684, 0.7647059, 1, 0, 1,
-0.8063322, -0.5252585, -2.119564, 0.7568628, 1, 0, 1,
-0.8029904, -0.3022941, -2.397411, 0.7529412, 1, 0, 1,
-0.7958881, -1.124293, -1.048434, 0.7450981, 1, 0, 1,
-0.7941999, 0.2714833, -2.255975, 0.7411765, 1, 0, 1,
-0.7761894, -3.329796, -2.092238, 0.7333333, 1, 0, 1,
-0.7743102, 0.24707, -0.0722523, 0.7294118, 1, 0, 1,
-0.7648408, -0.6026433, -2.077461, 0.7215686, 1, 0, 1,
-0.7622976, 0.3925631, 0.1826557, 0.7176471, 1, 0, 1,
-0.7608672, -0.3635684, -3.344599, 0.7098039, 1, 0, 1,
-0.7605189, 0.6359724, 0.7719402, 0.7058824, 1, 0, 1,
-0.7599964, -0.5495547, -2.028647, 0.6980392, 1, 0, 1,
-0.7546355, 0.7551259, -0.9608124, 0.6901961, 1, 0, 1,
-0.7521572, 1.343622, 0.1262762, 0.6862745, 1, 0, 1,
-0.752043, 0.4443899, -0.4900771, 0.6784314, 1, 0, 1,
-0.7497128, -1.212112, -2.771031, 0.6745098, 1, 0, 1,
-0.7494575, 1.800442, -1.209513, 0.6666667, 1, 0, 1,
-0.748346, 0.7341321, 0.4321835, 0.6627451, 1, 0, 1,
-0.7415473, -0.8812476, -0.8847949, 0.654902, 1, 0, 1,
-0.7387856, 0.8737586, -0.2231916, 0.6509804, 1, 0, 1,
-0.7300141, 1.350587, -1.785861, 0.6431373, 1, 0, 1,
-0.7263651, -0.2584545, -2.546016, 0.6392157, 1, 0, 1,
-0.7232921, 0.9272211, 0.05062827, 0.6313726, 1, 0, 1,
-0.7216341, 0.1300509, -2.151548, 0.627451, 1, 0, 1,
-0.7167241, 1.256036, 0.5109476, 0.6196079, 1, 0, 1,
-0.7139983, 0.1930916, -1.560132, 0.6156863, 1, 0, 1,
-0.7104613, -0.1551824, -2.170269, 0.6078432, 1, 0, 1,
-0.710375, -1.078323, -3.379142, 0.6039216, 1, 0, 1,
-0.7082137, -0.8440997, -3.604032, 0.5960785, 1, 0, 1,
-0.706065, 0.3923393, -1.974913, 0.5882353, 1, 0, 1,
-0.7024388, 0.1230214, -1.071708, 0.5843138, 1, 0, 1,
-0.7000949, -1.738081, -4.061357, 0.5764706, 1, 0, 1,
-0.7000921, 0.06403498, -0.3988935, 0.572549, 1, 0, 1,
-0.696484, -3.301289, -3.80169, 0.5647059, 1, 0, 1,
-0.693484, -1.805084, -2.513627, 0.5607843, 1, 0, 1,
-0.6918774, -0.2027997, -1.254481, 0.5529412, 1, 0, 1,
-0.6896803, -0.9723802, -2.252933, 0.5490196, 1, 0, 1,
-0.6792883, 0.8780529, -0.9126186, 0.5411765, 1, 0, 1,
-0.6775651, 2.518476, 0.5755742, 0.5372549, 1, 0, 1,
-0.6742516, 0.9644713, -0.69626, 0.5294118, 1, 0, 1,
-0.6739544, -0.6855124, -2.831481, 0.5254902, 1, 0, 1,
-0.6689214, 0.08416183, -0.8003657, 0.5176471, 1, 0, 1,
-0.6586717, -0.4441324, -2.780734, 0.5137255, 1, 0, 1,
-0.6531455, -0.1246842, -1.38256, 0.5058824, 1, 0, 1,
-0.6531262, -1.227116, -1.336626, 0.5019608, 1, 0, 1,
-0.6523754, -1.6251, -3.023048, 0.4941176, 1, 0, 1,
-0.6444693, 0.8251003, -1.982634, 0.4862745, 1, 0, 1,
-0.6442726, -1.399628, -1.77913, 0.4823529, 1, 0, 1,
-0.6430202, -0.1912455, -3.081983, 0.4745098, 1, 0, 1,
-0.6377196, 0.186886, -1.037846, 0.4705882, 1, 0, 1,
-0.6253498, -0.3064619, -3.954553, 0.4627451, 1, 0, 1,
-0.6197585, -0.914344, -2.104181, 0.4588235, 1, 0, 1,
-0.6183518, -0.2008312, -2.416394, 0.4509804, 1, 0, 1,
-0.6149251, -0.2535971, -1.544961, 0.4470588, 1, 0, 1,
-0.61374, -0.8674002, -2.54675, 0.4392157, 1, 0, 1,
-0.6113663, -1.314793, -0.9690686, 0.4352941, 1, 0, 1,
-0.6081758, -0.6084476, -3.925956, 0.427451, 1, 0, 1,
-0.606629, 1.710102, -0.9616547, 0.4235294, 1, 0, 1,
-0.606561, -0.09231658, -1.740435, 0.4156863, 1, 0, 1,
-0.603705, 0.7508798, -1.020154, 0.4117647, 1, 0, 1,
-0.6017824, 2.033061, -0.05615518, 0.4039216, 1, 0, 1,
-0.6015897, 0.0922147, 0.8187468, 0.3960784, 1, 0, 1,
-0.5988234, 1.641416, 0.6478761, 0.3921569, 1, 0, 1,
-0.5959132, -0.6461825, -1.798539, 0.3843137, 1, 0, 1,
-0.5945967, 0.6463149, -1.154034, 0.3803922, 1, 0, 1,
-0.5937178, 0.8302384, -1.264068, 0.372549, 1, 0, 1,
-0.5919481, 0.04420443, -1.957162, 0.3686275, 1, 0, 1,
-0.590927, -0.409921, -1.816133, 0.3607843, 1, 0, 1,
-0.5892403, 0.9194002, -1.646219, 0.3568628, 1, 0, 1,
-0.5808464, 0.6975314, -1.97937, 0.3490196, 1, 0, 1,
-0.5788923, 0.5490081, -0.6597669, 0.345098, 1, 0, 1,
-0.5787058, 2.036188, -0.78346, 0.3372549, 1, 0, 1,
-0.5766138, 1.036764, -0.7010393, 0.3333333, 1, 0, 1,
-0.5655303, 0.2711314, -1.531845, 0.3254902, 1, 0, 1,
-0.565147, 1.329731, -1.095155, 0.3215686, 1, 0, 1,
-0.5649844, -1.032728, -1.703152, 0.3137255, 1, 0, 1,
-0.5646285, -0.7167414, -1.654127, 0.3098039, 1, 0, 1,
-0.5627079, 1.398455, -0.4397219, 0.3019608, 1, 0, 1,
-0.5615996, -1.311877, -2.353919, 0.2941177, 1, 0, 1,
-0.5586334, 0.5445767, -1.177052, 0.2901961, 1, 0, 1,
-0.5572221, -0.9921799, -2.829058, 0.282353, 1, 0, 1,
-0.5571387, 0.6984753, -1.666015, 0.2784314, 1, 0, 1,
-0.5562306, 0.5205309, -1.101237, 0.2705882, 1, 0, 1,
-0.551118, 1.503611, 0.6866248, 0.2666667, 1, 0, 1,
-0.5439814, -0.1159645, -0.1612689, 0.2588235, 1, 0, 1,
-0.5426934, -0.7807005, -2.173323, 0.254902, 1, 0, 1,
-0.5335856, 1.34087, -0.4558394, 0.2470588, 1, 0, 1,
-0.5328103, -1.12396, -2.034167, 0.2431373, 1, 0, 1,
-0.5309136, -0.2852371, -0.9581831, 0.2352941, 1, 0, 1,
-0.5305257, 1.16716, 0.9675949, 0.2313726, 1, 0, 1,
-0.5301663, -0.5023797, -2.789516, 0.2235294, 1, 0, 1,
-0.5272731, 0.1356191, -0.5551024, 0.2196078, 1, 0, 1,
-0.5271628, 1.242174, 1.157547, 0.2117647, 1, 0, 1,
-0.5247268, 0.183615, 0.3282461, 0.2078431, 1, 0, 1,
-0.5203486, 0.9381555, -1.617374, 0.2, 1, 0, 1,
-0.5156505, -0.1513872, -2.945189, 0.1921569, 1, 0, 1,
-0.5124691, 0.1874317, -0.1429044, 0.1882353, 1, 0, 1,
-0.5115385, -1.113359, -3.04859, 0.1803922, 1, 0, 1,
-0.5074739, -0.3432686, -3.52551, 0.1764706, 1, 0, 1,
-0.5066782, -0.4713858, -0.3787875, 0.1686275, 1, 0, 1,
-0.497438, 0.1552095, -1.187394, 0.1647059, 1, 0, 1,
-0.4966988, 0.109049, -2.395459, 0.1568628, 1, 0, 1,
-0.4966832, 1.903806, -0.4659273, 0.1529412, 1, 0, 1,
-0.4889475, -0.8051943, -1.399352, 0.145098, 1, 0, 1,
-0.4857039, 0.2614377, -1.034478, 0.1411765, 1, 0, 1,
-0.4844389, 1.279277, 1.751461, 0.1333333, 1, 0, 1,
-0.4841491, -2.533811, -1.989881, 0.1294118, 1, 0, 1,
-0.4835341, 1.174804, 1.189396, 0.1215686, 1, 0, 1,
-0.4833256, -1.488152, -5.013499, 0.1176471, 1, 0, 1,
-0.4829188, -0.4694773, -3.219898, 0.1098039, 1, 0, 1,
-0.4803354, -1.030273, -2.557463, 0.1058824, 1, 0, 1,
-0.4789324, -0.3923588, -2.956762, 0.09803922, 1, 0, 1,
-0.4767595, 0.5888368, -1.101742, 0.09019608, 1, 0, 1,
-0.4766535, 1.150225, -2.134936, 0.08627451, 1, 0, 1,
-0.4750335, -1.952897, -2.978229, 0.07843138, 1, 0, 1,
-0.4733759, -1.230932, -3.262912, 0.07450981, 1, 0, 1,
-0.4731443, -1.023605, -2.179909, 0.06666667, 1, 0, 1,
-0.4612633, 0.172636, -1.384733, 0.0627451, 1, 0, 1,
-0.4591536, 0.6654428, -0.8173999, 0.05490196, 1, 0, 1,
-0.4539658, -0.7454544, -4.047537, 0.05098039, 1, 0, 1,
-0.4491251, -0.3389723, -2.37456, 0.04313726, 1, 0, 1,
-0.4491064, 1.628438, 0.06697843, 0.03921569, 1, 0, 1,
-0.4478997, -0.3426483, -3.029304, 0.03137255, 1, 0, 1,
-0.4413161, -0.2892919, -3.488595, 0.02745098, 1, 0, 1,
-0.4400886, 0.7538962, 0.4204287, 0.01960784, 1, 0, 1,
-0.4318412, 0.6403767, -0.6577485, 0.01568628, 1, 0, 1,
-0.4301628, -0.4331329, -1.859385, 0.007843138, 1, 0, 1,
-0.4296348, 0.6344506, 0.6751199, 0.003921569, 1, 0, 1,
-0.4252062, 0.5586435, -2.339924, 0, 1, 0.003921569, 1,
-0.4251545, -0.2942609, -1.309279, 0, 1, 0.01176471, 1,
-0.4250121, 1.530685, -0.2750085, 0, 1, 0.01568628, 1,
-0.4221184, -1.013808, -2.908133, 0, 1, 0.02352941, 1,
-0.4201827, -1.766201, -3.448321, 0, 1, 0.02745098, 1,
-0.4186084, -0.5069471, -3.827669, 0, 1, 0.03529412, 1,
-0.4167697, 0.110811, -0.3429878, 0, 1, 0.03921569, 1,
-0.4159097, 0.7358385, -0.5325091, 0, 1, 0.04705882, 1,
-0.4149747, 0.2803639, -1.527964, 0, 1, 0.05098039, 1,
-0.4119379, -1.783739, -1.74376, 0, 1, 0.05882353, 1,
-0.4094036, 0.7451323, -0.5441785, 0, 1, 0.0627451, 1,
-0.3953635, -1.69156, -1.322699, 0, 1, 0.07058824, 1,
-0.3928078, 0.05719143, -2.484539, 0, 1, 0.07450981, 1,
-0.3883135, -0.1900407, -2.465438, 0, 1, 0.08235294, 1,
-0.3849686, 0.2800799, 0.01591197, 0, 1, 0.08627451, 1,
-0.3846914, -0.4405703, -3.031538, 0, 1, 0.09411765, 1,
-0.3842143, 0.2726847, -3.047019, 0, 1, 0.1019608, 1,
-0.3841364, -1.846464, -3.782896, 0, 1, 0.1058824, 1,
-0.3822777, 1.138737, 0.5756999, 0, 1, 0.1137255, 1,
-0.3781639, 1.262738, -1.885483, 0, 1, 0.1176471, 1,
-0.3780623, -0.2187473, -2.138915, 0, 1, 0.1254902, 1,
-0.3775926, -0.04016343, -0.7714277, 0, 1, 0.1294118, 1,
-0.3731426, -2.767806, -2.754524, 0, 1, 0.1372549, 1,
-0.373026, -2.107708, -3.427084, 0, 1, 0.1411765, 1,
-0.3718274, -0.2181806, -3.399722, 0, 1, 0.1490196, 1,
-0.3688889, -1.803433, -3.05213, 0, 1, 0.1529412, 1,
-0.3650871, -2.891166, -2.683776, 0, 1, 0.1607843, 1,
-0.3632891, -2.523594, -1.67791, 0, 1, 0.1647059, 1,
-0.3627573, 0.06190608, -1.468662, 0, 1, 0.172549, 1,
-0.3617793, -0.2920378, -1.688137, 0, 1, 0.1764706, 1,
-0.354174, 0.05210078, -1.269207, 0, 1, 0.1843137, 1,
-0.3521447, 0.1826179, -0.5777147, 0, 1, 0.1882353, 1,
-0.3482668, -1.079411, -3.241822, 0, 1, 0.1960784, 1,
-0.346992, -0.1340675, -1.395833, 0, 1, 0.2039216, 1,
-0.3459815, 1.368805, -0.7231284, 0, 1, 0.2078431, 1,
-0.3428642, -0.7917913, -1.564527, 0, 1, 0.2156863, 1,
-0.3423435, 1.169042, -0.9917362, 0, 1, 0.2196078, 1,
-0.3412308, 0.1806389, -2.43913, 0, 1, 0.227451, 1,
-0.3373702, 1.539873, -0.47336, 0, 1, 0.2313726, 1,
-0.3329595, 1.781591, 1.295529, 0, 1, 0.2392157, 1,
-0.3317843, 1.653775, -3.161688, 0, 1, 0.2431373, 1,
-0.3301004, 0.07734725, -2.432117, 0, 1, 0.2509804, 1,
-0.3285982, 1.401729, -1.120204, 0, 1, 0.254902, 1,
-0.3240709, 0.02577258, -1.397699, 0, 1, 0.2627451, 1,
-0.3220648, -0.3279462, -3.035349, 0, 1, 0.2666667, 1,
-0.3211947, -1.203526, -3.539801, 0, 1, 0.2745098, 1,
-0.3200716, 0.5283902, -1.57064, 0, 1, 0.2784314, 1,
-0.3187118, 0.5950871, -1.66928, 0, 1, 0.2862745, 1,
-0.3164879, -0.2597826, -2.595551, 0, 1, 0.2901961, 1,
-0.3136335, 0.8507524, -1.665737, 0, 1, 0.2980392, 1,
-0.3112386, 0.09932626, 0.3153927, 0, 1, 0.3058824, 1,
-0.3076415, -0.8689642, -3.169428, 0, 1, 0.3098039, 1,
-0.3069397, 0.04999394, -1.803349, 0, 1, 0.3176471, 1,
-0.3009256, 1.297745, -1.616429, 0, 1, 0.3215686, 1,
-0.2990798, -0.6740558, -3.444042, 0, 1, 0.3294118, 1,
-0.2974222, -0.5918029, -3.04712, 0, 1, 0.3333333, 1,
-0.2967894, 0.5749076, -1.369619, 0, 1, 0.3411765, 1,
-0.2958876, 0.6840028, -2.010502, 0, 1, 0.345098, 1,
-0.2952322, -1.203849, -2.620655, 0, 1, 0.3529412, 1,
-0.2950227, 0.1515163, 0.4179056, 0, 1, 0.3568628, 1,
-0.2910714, 1.619033, -0.06405326, 0, 1, 0.3647059, 1,
-0.2892883, -0.2524295, -1.856346, 0, 1, 0.3686275, 1,
-0.2877708, 0.5698097, -0.01733801, 0, 1, 0.3764706, 1,
-0.2863618, 0.1162061, -3.435789, 0, 1, 0.3803922, 1,
-0.2858078, 1.55837, 1.638777, 0, 1, 0.3882353, 1,
-0.2856853, -0.3634617, -2.939843, 0, 1, 0.3921569, 1,
-0.2832415, -1.13675, -2.712837, 0, 1, 0.4, 1,
-0.2826996, 0.5009529, 0.3440092, 0, 1, 0.4078431, 1,
-0.2811506, 2.094014, -0.2792273, 0, 1, 0.4117647, 1,
-0.2798029, 0.6164956, 0.4864261, 0, 1, 0.4196078, 1,
-0.2780867, -1.894146, -2.330261, 0, 1, 0.4235294, 1,
-0.2770375, -1.603979, -2.472212, 0, 1, 0.4313726, 1,
-0.2760769, -0.1009253, -1.427725, 0, 1, 0.4352941, 1,
-0.274858, 0.6120232, 1.260085, 0, 1, 0.4431373, 1,
-0.2682774, 1.369641, -0.1104759, 0, 1, 0.4470588, 1,
-0.2673143, 1.169474, -0.6972283, 0, 1, 0.454902, 1,
-0.2630425, -0.3030391, -2.307253, 0, 1, 0.4588235, 1,
-0.2574885, -0.3228766, -1.010406, 0, 1, 0.4666667, 1,
-0.2546384, 1.345179, -0.8463135, 0, 1, 0.4705882, 1,
-0.2475642, -0.4230993, -3.668474, 0, 1, 0.4784314, 1,
-0.246991, 2.631787, 1.116395, 0, 1, 0.4823529, 1,
-0.2417711, 0.2874368, -0.02629274, 0, 1, 0.4901961, 1,
-0.2358053, -0.1358963, -3.400206, 0, 1, 0.4941176, 1,
-0.2296257, -0.2685845, -2.162095, 0, 1, 0.5019608, 1,
-0.2231481, -1.412638, -1.359661, 0, 1, 0.509804, 1,
-0.2222717, -1.134488, -3.492113, 0, 1, 0.5137255, 1,
-0.2192482, 0.1024229, -1.264947, 0, 1, 0.5215687, 1,
-0.212197, -0.7830607, -3.255313, 0, 1, 0.5254902, 1,
-0.2072096, 0.3686488, -2.310546, 0, 1, 0.5333334, 1,
-0.2064252, 0.5560159, -0.5033573, 0, 1, 0.5372549, 1,
-0.2043225, 1.169254, 0.0151153, 0, 1, 0.5450981, 1,
-0.2040903, -1.39883, -2.883254, 0, 1, 0.5490196, 1,
-0.1994569, -0.9116605, -1.691291, 0, 1, 0.5568628, 1,
-0.1976853, -0.3653136, -3.449575, 0, 1, 0.5607843, 1,
-0.195421, -1.006455, -4.284063, 0, 1, 0.5686275, 1,
-0.1899658, 1.840722, -0.121132, 0, 1, 0.572549, 1,
-0.1887263, -1.044866, -4.03304, 0, 1, 0.5803922, 1,
-0.1882237, 0.101471, -0.1671387, 0, 1, 0.5843138, 1,
-0.1858949, 0.5064886, -0.1094331, 0, 1, 0.5921569, 1,
-0.1843501, 1.641289, 0.3165349, 0, 1, 0.5960785, 1,
-0.1805694, -0.7164248, -4.762882, 0, 1, 0.6039216, 1,
-0.1759689, -0.7063554, -1.032331, 0, 1, 0.6117647, 1,
-0.1751128, -0.4028095, -1.540701, 0, 1, 0.6156863, 1,
-0.1657418, -0.1508852, -1.592467, 0, 1, 0.6235294, 1,
-0.1657079, 0.003251249, -1.106868, 0, 1, 0.627451, 1,
-0.1640829, -1.374468, -2.601034, 0, 1, 0.6352941, 1,
-0.1576844, 0.673632, -0.2240278, 0, 1, 0.6392157, 1,
-0.1538966, 0.7828524, -0.03171214, 0, 1, 0.6470588, 1,
-0.1501281, -0.3880912, -4.165246, 0, 1, 0.6509804, 1,
-0.1477911, 0.2239506, -1.4163, 0, 1, 0.6588235, 1,
-0.1467448, -1.247143, -2.800479, 0, 1, 0.6627451, 1,
-0.1458382, 0.9063694, 1.468756, 0, 1, 0.6705883, 1,
-0.1454263, -1.292856, -2.2743, 0, 1, 0.6745098, 1,
-0.1450863, 1.318123, -0.6559505, 0, 1, 0.682353, 1,
-0.1394013, 0.7675288, -0.08792639, 0, 1, 0.6862745, 1,
-0.1364548, -0.2508233, -0.7939039, 0, 1, 0.6941177, 1,
-0.1339606, -0.8781205, -2.630237, 0, 1, 0.7019608, 1,
-0.1336349, 0.04241772, -0.8342055, 0, 1, 0.7058824, 1,
-0.1333855, -0.1728554, -1.7479, 0, 1, 0.7137255, 1,
-0.1294796, -0.9005986, -2.316166, 0, 1, 0.7176471, 1,
-0.1286275, -0.255484, -2.594038, 0, 1, 0.7254902, 1,
-0.1277784, 0.6043124, -1.238691, 0, 1, 0.7294118, 1,
-0.1274444, 1.519316, 0.2656207, 0, 1, 0.7372549, 1,
-0.1261598, 0.9502093, -0.3701199, 0, 1, 0.7411765, 1,
-0.1249958, -0.7519919, -1.909212, 0, 1, 0.7490196, 1,
-0.124828, 0.44353, -1.348137, 0, 1, 0.7529412, 1,
-0.1242536, 0.5810345, 0.2373077, 0, 1, 0.7607843, 1,
-0.1226964, -0.2545037, -0.3934918, 0, 1, 0.7647059, 1,
-0.1225529, -0.5447373, -3.486757, 0, 1, 0.772549, 1,
-0.1173261, 0.2800897, -0.07043887, 0, 1, 0.7764706, 1,
-0.1161317, -1.449293, -3.389882, 0, 1, 0.7843137, 1,
-0.113126, -0.6239272, -4.825831, 0, 1, 0.7882353, 1,
-0.1121567, -0.2209538, -2.885086, 0, 1, 0.7960784, 1,
-0.1085655, -0.5377038, -4.648247, 0, 1, 0.8039216, 1,
-0.1085553, 1.053065, 0.419101, 0, 1, 0.8078431, 1,
-0.1028725, -1.677813, -2.855571, 0, 1, 0.8156863, 1,
-0.1023023, -1.114406, -4.500555, 0, 1, 0.8196079, 1,
-0.1004664, 0.05750713, -2.563622, 0, 1, 0.827451, 1,
-0.1001959, 2.154046, -0.7376904, 0, 1, 0.8313726, 1,
-0.1000955, -0.03788756, -0.9345186, 0, 1, 0.8392157, 1,
-0.08277766, 0.778384, -0.739118, 0, 1, 0.8431373, 1,
-0.08127359, 0.4252123, 0.02952494, 0, 1, 0.8509804, 1,
-0.07792268, 1.914191, -0.4034736, 0, 1, 0.854902, 1,
-0.07442522, -0.2778838, -1.752598, 0, 1, 0.8627451, 1,
-0.07324618, -0.03381959, -1.896238, 0, 1, 0.8666667, 1,
-0.07068334, 0.4620578, 1.157551, 0, 1, 0.8745098, 1,
-0.06934159, -0.5097507, -2.911022, 0, 1, 0.8784314, 1,
-0.06817977, 0.4983191, 0.7637385, 0, 1, 0.8862745, 1,
-0.06798253, 1.104652, 0.6821429, 0, 1, 0.8901961, 1,
-0.06746576, 0.4507776, 0.05464541, 0, 1, 0.8980392, 1,
-0.06704064, 0.6326513, -0.1642223, 0, 1, 0.9058824, 1,
-0.06693887, 1.654308, -0.6515387, 0, 1, 0.9098039, 1,
-0.06630862, 2.515749, -1.41218, 0, 1, 0.9176471, 1,
-0.06382717, 0.7167845, -0.06139215, 0, 1, 0.9215686, 1,
-0.06211201, 0.7869192, 0.637693, 0, 1, 0.9294118, 1,
-0.05631674, -1.64074, -2.649269, 0, 1, 0.9333333, 1,
-0.05587905, 0.06010608, -0.027839, 0, 1, 0.9411765, 1,
-0.05505021, -0.5439295, -4.498156, 0, 1, 0.945098, 1,
-0.04952575, 1.025771, -0.7429876, 0, 1, 0.9529412, 1,
-0.03872322, 0.8756058, 0.057754, 0, 1, 0.9568627, 1,
-0.02565901, -0.8559228, -3.053208, 0, 1, 0.9647059, 1,
-0.02325819, 0.3769757, 0.1941115, 0, 1, 0.9686275, 1,
-0.02315704, -0.3447076, -1.807034, 0, 1, 0.9764706, 1,
-0.01040141, -0.5074081, -2.831311, 0, 1, 0.9803922, 1,
-0.007320445, 1.283903, -1.035198, 0, 1, 0.9882353, 1,
-0.004584537, 2.114129, -0.4871482, 0, 1, 0.9921569, 1,
0.006371304, -1.541793, 3.400331, 0, 1, 1, 1,
0.00686309, -0.6414644, 2.034244, 0, 0.9921569, 1, 1,
0.008063669, 0.8122698, 0.9419844, 0, 0.9882353, 1, 1,
0.008991315, -0.3236969, 3.137355, 0, 0.9803922, 1, 1,
0.009364468, 1.777824, -1.618361, 0, 0.9764706, 1, 1,
0.009556621, 0.4289829, -0.7840938, 0, 0.9686275, 1, 1,
0.01133241, 0.4442242, 0.09976055, 0, 0.9647059, 1, 1,
0.01288795, -0.3905017, 4.283206, 0, 0.9568627, 1, 1,
0.01659585, -0.08300908, 2.227429, 0, 0.9529412, 1, 1,
0.01726221, -0.1523847, 2.476896, 0, 0.945098, 1, 1,
0.02079376, 0.6058285, 0.1122743, 0, 0.9411765, 1, 1,
0.02222659, -0.9249535, 3.335469, 0, 0.9333333, 1, 1,
0.02554651, -0.5033562, 3.708521, 0, 0.9294118, 1, 1,
0.02583852, 0.608908, 1.197438, 0, 0.9215686, 1, 1,
0.02647915, -1.146961, 2.886005, 0, 0.9176471, 1, 1,
0.02687906, -0.01757503, 0.7336249, 0, 0.9098039, 1, 1,
0.03266988, 0.8972976, -0.01480797, 0, 0.9058824, 1, 1,
0.04704143, 0.7385374, -0.9364636, 0, 0.8980392, 1, 1,
0.04829547, -0.7858713, 3.719394, 0, 0.8901961, 1, 1,
0.04954229, -0.7332579, 0.305118, 0, 0.8862745, 1, 1,
0.06313827, -0.213214, 2.9552, 0, 0.8784314, 1, 1,
0.06511398, -1.291656, 4.477197, 0, 0.8745098, 1, 1,
0.06693258, 1.062725, 0.3498045, 0, 0.8666667, 1, 1,
0.07388508, -0.6981058, 4.408809, 0, 0.8627451, 1, 1,
0.0764209, 0.7476583, 1.053928, 0, 0.854902, 1, 1,
0.07676536, 0.7731333, 0.9233704, 0, 0.8509804, 1, 1,
0.07835572, -1.840269, 1.903282, 0, 0.8431373, 1, 1,
0.07990529, 1.715507, -1.304161, 0, 0.8392157, 1, 1,
0.09335697, 1.597221, -1.051345, 0, 0.8313726, 1, 1,
0.09476127, 0.6484955, -0.6647077, 0, 0.827451, 1, 1,
0.09508072, -1.106122, 1.57493, 0, 0.8196079, 1, 1,
0.0961709, 0.3108334, 1.481837, 0, 0.8156863, 1, 1,
0.1074738, -0.9586552, 2.309101, 0, 0.8078431, 1, 1,
0.1081739, -2.575206, 3.645971, 0, 0.8039216, 1, 1,
0.1097754, 0.1539052, -1.195577, 0, 0.7960784, 1, 1,
0.1148746, -1.099644, 5.374354, 0, 0.7882353, 1, 1,
0.1171528, -0.534479, 2.932506, 0, 0.7843137, 1, 1,
0.1176042, -0.2558952, 2.348902, 0, 0.7764706, 1, 1,
0.1261695, -0.9727228, 3.861891, 0, 0.772549, 1, 1,
0.127055, -0.6820586, 4.277872, 0, 0.7647059, 1, 1,
0.1273715, -0.002085043, 2.250384, 0, 0.7607843, 1, 1,
0.1281877, 1.348402, -0.06347813, 0, 0.7529412, 1, 1,
0.1284235, 0.447556, -0.06805006, 0, 0.7490196, 1, 1,
0.1357652, 0.8416585, 1.355049, 0, 0.7411765, 1, 1,
0.1368038, 1.031523, 2.333877, 0, 0.7372549, 1, 1,
0.1375978, -0.6892602, 3.701818, 0, 0.7294118, 1, 1,
0.1389059, -0.9430569, 3.1923, 0, 0.7254902, 1, 1,
0.1391538, 0.02535158, 1.568746, 0, 0.7176471, 1, 1,
0.1399852, -1.362465, 3.122267, 0, 0.7137255, 1, 1,
0.1401562, -0.650753, 2.132745, 0, 0.7058824, 1, 1,
0.1405252, -1.465071, 2.487711, 0, 0.6980392, 1, 1,
0.1421097, 0.6055705, -0.5633282, 0, 0.6941177, 1, 1,
0.1434948, -0.3429075, 3.142986, 0, 0.6862745, 1, 1,
0.1437282, 0.02645433, 2.67499, 0, 0.682353, 1, 1,
0.1444597, 1.213061, -0.2079648, 0, 0.6745098, 1, 1,
0.1449001, 1.646987, -0.1732842, 0, 0.6705883, 1, 1,
0.1453805, 0.599678, 0.9775339, 0, 0.6627451, 1, 1,
0.1457599, -0.2684196, 2.180401, 0, 0.6588235, 1, 1,
0.1459412, 0.5218476, 1.10246, 0, 0.6509804, 1, 1,
0.1512227, -0.3307095, 2.694288, 0, 0.6470588, 1, 1,
0.1530956, 2.031833, -0.9432415, 0, 0.6392157, 1, 1,
0.1537821, -0.8756812, 2.439357, 0, 0.6352941, 1, 1,
0.1567665, -1.005137, 3.640565, 0, 0.627451, 1, 1,
0.1578491, -0.7044439, 2.019898, 0, 0.6235294, 1, 1,
0.1596861, 0.5104567, 0.07423364, 0, 0.6156863, 1, 1,
0.16084, -0.08212193, 1.712272, 0, 0.6117647, 1, 1,
0.1710393, -1.385902, 4.539255, 0, 0.6039216, 1, 1,
0.1718791, -0.05659978, 1.072928, 0, 0.5960785, 1, 1,
0.173205, 1.096667, 0.8617246, 0, 0.5921569, 1, 1,
0.1740188, -0.8534251, 2.873966, 0, 0.5843138, 1, 1,
0.1746598, -0.2575078, 2.104117, 0, 0.5803922, 1, 1,
0.1753848, -0.2372494, 2.583281, 0, 0.572549, 1, 1,
0.1779494, 0.306821, 1.939936, 0, 0.5686275, 1, 1,
0.1783182, -0.2173603, 0.274708, 0, 0.5607843, 1, 1,
0.1829855, 0.5599265, -0.407165, 0, 0.5568628, 1, 1,
0.1862629, 1.230632, -1.015836, 0, 0.5490196, 1, 1,
0.1891295, 1.568427, 1.172526, 0, 0.5450981, 1, 1,
0.1891945, -1.166789, 3.223249, 0, 0.5372549, 1, 1,
0.189879, 0.09456732, 1.478852, 0, 0.5333334, 1, 1,
0.1909066, -2.419588, 1.57684, 0, 0.5254902, 1, 1,
0.1943906, 0.1363842, 1.025861, 0, 0.5215687, 1, 1,
0.195171, 0.007759777, 0.4606151, 0, 0.5137255, 1, 1,
0.2045246, -0.5155098, 2.086222, 0, 0.509804, 1, 1,
0.2102727, 2.279518, 0.08385018, 0, 0.5019608, 1, 1,
0.2133209, 0.7440653, 1.55829, 0, 0.4941176, 1, 1,
0.2177024, -0.8416417, 3.540673, 0, 0.4901961, 1, 1,
0.2221621, -0.002982931, 2.456139, 0, 0.4823529, 1, 1,
0.2254552, -1.225508, 3.021307, 0, 0.4784314, 1, 1,
0.2255132, 1.517021, -0.08011632, 0, 0.4705882, 1, 1,
0.2286963, -0.8846909, 4.395247, 0, 0.4666667, 1, 1,
0.2311614, -1.369741, 2.241205, 0, 0.4588235, 1, 1,
0.2311629, -0.5718677, 0.8911313, 0, 0.454902, 1, 1,
0.2316609, 0.06720319, 1.329144, 0, 0.4470588, 1, 1,
0.2325652, -0.8856922, 1.508008, 0, 0.4431373, 1, 1,
0.2352817, -1.010337, 3.145099, 0, 0.4352941, 1, 1,
0.2391569, 1.570996, 1.069882, 0, 0.4313726, 1, 1,
0.2414739, 0.3305947, 2.085395, 0, 0.4235294, 1, 1,
0.2435086, 1.002249, -0.9344841, 0, 0.4196078, 1, 1,
0.2444614, 0.3738333, -0.02976242, 0, 0.4117647, 1, 1,
0.2446116, 0.2189474, 0.6099387, 0, 0.4078431, 1, 1,
0.2503034, -0.04849498, 0.6645201, 0, 0.4, 1, 1,
0.2533869, 1.784069, -0.2165734, 0, 0.3921569, 1, 1,
0.2558709, -0.9668852, 2.46478, 0, 0.3882353, 1, 1,
0.2625697, -0.3343647, 3.492633, 0, 0.3803922, 1, 1,
0.2632255, 1.28922, -0.4349794, 0, 0.3764706, 1, 1,
0.2680876, -0.2069, 2.732557, 0, 0.3686275, 1, 1,
0.2773032, 0.3815326, -0.1865308, 0, 0.3647059, 1, 1,
0.281365, 1.078936, 1.275766, 0, 0.3568628, 1, 1,
0.2858176, -0.3347407, 2.810487, 0, 0.3529412, 1, 1,
0.2896265, -0.2643181, 1.95667, 0, 0.345098, 1, 1,
0.2943559, -1.924008, 2.958894, 0, 0.3411765, 1, 1,
0.2952216, -1.19875, 2.953502, 0, 0.3333333, 1, 1,
0.2982801, -0.5663174, 4.683348, 0, 0.3294118, 1, 1,
0.2992555, 1.417833, 1.156649, 0, 0.3215686, 1, 1,
0.2999123, 1.445681, -0.2925973, 0, 0.3176471, 1, 1,
0.3211498, -1.915799, 3.688462, 0, 0.3098039, 1, 1,
0.32238, -0.03253229, 1.27406, 0, 0.3058824, 1, 1,
0.3284519, 0.8406347, -0.5897536, 0, 0.2980392, 1, 1,
0.332253, 0.219638, 0.8960668, 0, 0.2901961, 1, 1,
0.3351487, -0.1454783, 0.5095347, 0, 0.2862745, 1, 1,
0.3360818, -0.4010281, 2.572499, 0, 0.2784314, 1, 1,
0.3362286, 1.395717, -1.795242, 0, 0.2745098, 1, 1,
0.3385426, 0.2735569, 1.503504, 0, 0.2666667, 1, 1,
0.3394161, 0.1086415, 0.1947663, 0, 0.2627451, 1, 1,
0.3425761, 1.771526, -1.618471, 0, 0.254902, 1, 1,
0.3456806, 0.05420383, 1.053259, 0, 0.2509804, 1, 1,
0.3468079, 0.1608291, 1.025663, 0, 0.2431373, 1, 1,
0.3533863, -0.1276302, 2.419042, 0, 0.2392157, 1, 1,
0.3579072, -1.971405, 3.738391, 0, 0.2313726, 1, 1,
0.3590044, 0.3635765, 2.475009, 0, 0.227451, 1, 1,
0.3595779, 0.4938883, 1.094836, 0, 0.2196078, 1, 1,
0.3637015, 2.204125, -1.11917, 0, 0.2156863, 1, 1,
0.3697286, 1.628403, -0.03144138, 0, 0.2078431, 1, 1,
0.3699342, -0.3457839, 3.47057, 0, 0.2039216, 1, 1,
0.3781786, -0.08013614, 3.197354, 0, 0.1960784, 1, 1,
0.379329, -1.133961, 4.782582, 0, 0.1882353, 1, 1,
0.3797396, 0.05720181, 0.3888923, 0, 0.1843137, 1, 1,
0.3798395, -0.2696439, 2.306372, 0, 0.1764706, 1, 1,
0.3805347, 1.03693, 2.197365, 0, 0.172549, 1, 1,
0.3858164, -0.3024479, 3.684119, 0, 0.1647059, 1, 1,
0.3941862, 1.640648, -0.007796281, 0, 0.1607843, 1, 1,
0.3962446, -0.6506146, 0.8583326, 0, 0.1529412, 1, 1,
0.3983426, 0.1585962, 1.395584, 0, 0.1490196, 1, 1,
0.400615, 0.3851753, 0.1853858, 0, 0.1411765, 1, 1,
0.4029005, 0.154802, 3.138116, 0, 0.1372549, 1, 1,
0.4043406, -0.9714912, 2.290956, 0, 0.1294118, 1, 1,
0.4070997, -0.5820816, 4.493282, 0, 0.1254902, 1, 1,
0.408839, -1.396029, 3.220885, 0, 0.1176471, 1, 1,
0.4154261, 0.4920415, 1.397147, 0, 0.1137255, 1, 1,
0.4181615, 1.418764, -1.028945, 0, 0.1058824, 1, 1,
0.4206941, 0.3539548, 1.008414, 0, 0.09803922, 1, 1,
0.4206998, -0.3304947, 1.526076, 0, 0.09411765, 1, 1,
0.4213843, 0.5652424, -1.719971, 0, 0.08627451, 1, 1,
0.4278478, 0.7410213, 0.2199501, 0, 0.08235294, 1, 1,
0.430414, -0.02614829, 0.9895833, 0, 0.07450981, 1, 1,
0.438637, 1.155872, 0.3671673, 0, 0.07058824, 1, 1,
0.4407026, -0.8481981, 2.598642, 0, 0.0627451, 1, 1,
0.4443536, -0.465708, 2.119115, 0, 0.05882353, 1, 1,
0.4474571, -0.3130267, 2.522527, 0, 0.05098039, 1, 1,
0.449764, 0.5750294, 1.101872, 0, 0.04705882, 1, 1,
0.4548846, 0.5666784, 1.734005, 0, 0.03921569, 1, 1,
0.4584524, 0.2613424, 1.640455, 0, 0.03529412, 1, 1,
0.4599198, 1.65973, 0.1462429, 0, 0.02745098, 1, 1,
0.4628572, -0.07381988, 2.022014, 0, 0.02352941, 1, 1,
0.4650837, 0.5746674, 0.5357692, 0, 0.01568628, 1, 1,
0.4667237, 0.2060954, 2.006344, 0, 0.01176471, 1, 1,
0.4746809, 0.2273344, 1.666544, 0, 0.003921569, 1, 1,
0.4748156, -0.5744514, 2.238357, 0.003921569, 0, 1, 1,
0.4766624, -0.0338928, 1.343746, 0.007843138, 0, 1, 1,
0.4837759, -0.3947821, 2.626909, 0.01568628, 0, 1, 1,
0.4860494, 0.4646461, 2.444481, 0.01960784, 0, 1, 1,
0.4862358, -0.893243, 1.755106, 0.02745098, 0, 1, 1,
0.4863088, 0.5400648, 0.9835101, 0.03137255, 0, 1, 1,
0.4895387, -0.8074461, 3.413736, 0.03921569, 0, 1, 1,
0.493033, -0.6761209, 5.105021, 0.04313726, 0, 1, 1,
0.4931789, 0.7085977, 1.568314, 0.05098039, 0, 1, 1,
0.4941077, 1.368119, 0.2011492, 0.05490196, 0, 1, 1,
0.4941124, 1.250588, -0.6771545, 0.0627451, 0, 1, 1,
0.4970029, -1.455708, 1.605748, 0.06666667, 0, 1, 1,
0.5032814, 0.02662222, 2.844074, 0.07450981, 0, 1, 1,
0.5042868, 1.250386, 1.053416, 0.07843138, 0, 1, 1,
0.5059474, 1.028861, -0.01851156, 0.08627451, 0, 1, 1,
0.5069634, -0.4274984, 4.333629, 0.09019608, 0, 1, 1,
0.5075819, 0.09574436, -0.06996438, 0.09803922, 0, 1, 1,
0.5086805, 0.9955426, -0.05313781, 0.1058824, 0, 1, 1,
0.5106936, 0.08597422, 2.616142, 0.1098039, 0, 1, 1,
0.5139127, 0.2886263, 1.219979, 0.1176471, 0, 1, 1,
0.5194653, -0.3248093, 1.652289, 0.1215686, 0, 1, 1,
0.5235818, -1.096029, 4.896914, 0.1294118, 0, 1, 1,
0.524098, 0.5964164, -0.06272952, 0.1333333, 0, 1, 1,
0.5272734, 0.1751738, 1.771165, 0.1411765, 0, 1, 1,
0.5304914, 0.7299367, -0.06167787, 0.145098, 0, 1, 1,
0.5310704, 1.241399, 1.170943, 0.1529412, 0, 1, 1,
0.5332537, 0.6677121, -1.307802, 0.1568628, 0, 1, 1,
0.5352287, -0.1742185, 2.025691, 0.1647059, 0, 1, 1,
0.537675, 0.8809228, -0.7195163, 0.1686275, 0, 1, 1,
0.5399728, -0.2408697, 1.598631, 0.1764706, 0, 1, 1,
0.5406936, 0.1045001, 0.4031804, 0.1803922, 0, 1, 1,
0.5410312, -0.4617949, 1.72511, 0.1882353, 0, 1, 1,
0.5420096, -0.2928212, 2.627732, 0.1921569, 0, 1, 1,
0.542497, -0.01215539, 2.256259, 0.2, 0, 1, 1,
0.5459158, 0.02015042, 1.193869, 0.2078431, 0, 1, 1,
0.5461437, 0.8161529, 0.2145289, 0.2117647, 0, 1, 1,
0.5462623, -1.029358, 2.394769, 0.2196078, 0, 1, 1,
0.548, 0.4369532, 1.294266, 0.2235294, 0, 1, 1,
0.5480607, 0.6093798, -0.05861554, 0.2313726, 0, 1, 1,
0.5494898, -0.8874186, 3.070972, 0.2352941, 0, 1, 1,
0.5503334, 2.399233, -0.6124238, 0.2431373, 0, 1, 1,
0.5504447, -0.06750502, 1.744165, 0.2470588, 0, 1, 1,
0.5527584, -0.4956402, 3.054336, 0.254902, 0, 1, 1,
0.5541018, -0.5314348, 4.356664, 0.2588235, 0, 1, 1,
0.5568106, 0.4866409, 0.9241251, 0.2666667, 0, 1, 1,
0.5568861, -0.4107463, 2.258763, 0.2705882, 0, 1, 1,
0.5576807, 0.8661771, -0.006644418, 0.2784314, 0, 1, 1,
0.5594679, -0.3699201, 0.7183645, 0.282353, 0, 1, 1,
0.5631732, -1.29276, 2.864827, 0.2901961, 0, 1, 1,
0.5662997, -0.1954918, 3.344093, 0.2941177, 0, 1, 1,
0.5781992, 0.2861726, 0.7806776, 0.3019608, 0, 1, 1,
0.5848452, -1.599899, 3.645291, 0.3098039, 0, 1, 1,
0.5849972, 0.8812301, -1.157911, 0.3137255, 0, 1, 1,
0.5853095, 1.781949, -0.3898418, 0.3215686, 0, 1, 1,
0.5863587, -1.111337, 2.595046, 0.3254902, 0, 1, 1,
0.5872902, 1.451083, 0.6868607, 0.3333333, 0, 1, 1,
0.5894272, -0.3119115, 3.210287, 0.3372549, 0, 1, 1,
0.5947062, 1.30543, 2.388715, 0.345098, 0, 1, 1,
0.5972688, 0.6245119, 0.8813286, 0.3490196, 0, 1, 1,
0.5990561, 0.8964025, 1.11037, 0.3568628, 0, 1, 1,
0.6074098, 0.9995708, 1.453141, 0.3607843, 0, 1, 1,
0.6091127, -1.220213, 2.152699, 0.3686275, 0, 1, 1,
0.6100297, 0.5543228, -0.5087476, 0.372549, 0, 1, 1,
0.6110333, -0.8630518, 2.616888, 0.3803922, 0, 1, 1,
0.6112602, 0.5332156, 0.6081885, 0.3843137, 0, 1, 1,
0.6115307, -1.719184, 2.806262, 0.3921569, 0, 1, 1,
0.6141319, -1.719814, 2.969563, 0.3960784, 0, 1, 1,
0.6144397, 0.7173231, 0.1247486, 0.4039216, 0, 1, 1,
0.6251189, -0.9938909, 4.315104, 0.4117647, 0, 1, 1,
0.6320367, 0.4682735, 1.547505, 0.4156863, 0, 1, 1,
0.6404427, 0.2472513, 1.267763, 0.4235294, 0, 1, 1,
0.6427067, 0.06597713, 1.915188, 0.427451, 0, 1, 1,
0.6437865, 0.6561306, 0.4012687, 0.4352941, 0, 1, 1,
0.6438078, 1.234107, 1.060515, 0.4392157, 0, 1, 1,
0.6460285, 0.2580297, 0.8650252, 0.4470588, 0, 1, 1,
0.6475098, -0.3365862, 1.598032, 0.4509804, 0, 1, 1,
0.6482865, 0.1621682, 1.427658, 0.4588235, 0, 1, 1,
0.648632, -0.2990088, 3.426561, 0.4627451, 0, 1, 1,
0.6608537, 0.04326844, 1.762842, 0.4705882, 0, 1, 1,
0.6613952, -1.853487, 1.632842, 0.4745098, 0, 1, 1,
0.6694626, 1.539732, -0.9791602, 0.4823529, 0, 1, 1,
0.6695282, -0.3886269, 2.906407, 0.4862745, 0, 1, 1,
0.6730149, -0.6166897, 3.243133, 0.4941176, 0, 1, 1,
0.6773422, -0.7055205, 3.309975, 0.5019608, 0, 1, 1,
0.6789413, 0.8387536, 1.937427, 0.5058824, 0, 1, 1,
0.6851626, -0.6849138, 1.146006, 0.5137255, 0, 1, 1,
0.6910154, -0.09301952, 3.354911, 0.5176471, 0, 1, 1,
0.693841, 0.006183611, 0.2425303, 0.5254902, 0, 1, 1,
0.6942721, -1.307459, 2.01279, 0.5294118, 0, 1, 1,
0.6955451, -0.3783742, 1.818149, 0.5372549, 0, 1, 1,
0.7164562, -0.5905001, 2.52263, 0.5411765, 0, 1, 1,
0.718294, 1.19096, 0.3837941, 0.5490196, 0, 1, 1,
0.7194756, 0.1635786, 1.549378, 0.5529412, 0, 1, 1,
0.7237096, 0.7149308, -0.126692, 0.5607843, 0, 1, 1,
0.7257082, -0.4560382, 3.902342, 0.5647059, 0, 1, 1,
0.729656, 0.6863279, 0.09745774, 0.572549, 0, 1, 1,
0.7376367, -0.4737406, 2.440576, 0.5764706, 0, 1, 1,
0.7390882, -1.305819, 2.712072, 0.5843138, 0, 1, 1,
0.751389, -0.8936275, 3.29672, 0.5882353, 0, 1, 1,
0.7548212, 0.3316133, 1.765903, 0.5960785, 0, 1, 1,
0.7594304, -1.046535, 2.563893, 0.6039216, 0, 1, 1,
0.7633745, -0.483054, 1.508453, 0.6078432, 0, 1, 1,
0.7668373, 1.302362, 1.772923, 0.6156863, 0, 1, 1,
0.7754825, 0.885516, 1.667829, 0.6196079, 0, 1, 1,
0.7769164, -1.033127, 1.110018, 0.627451, 0, 1, 1,
0.7777936, 3.415034, -0.9317437, 0.6313726, 0, 1, 1,
0.7782601, -0.1219903, 1.276427, 0.6392157, 0, 1, 1,
0.7793667, 1.368406, -0.3473917, 0.6431373, 0, 1, 1,
0.7815716, -0.1390411, 2.669781, 0.6509804, 0, 1, 1,
0.7829214, -0.1177086, 1.773961, 0.654902, 0, 1, 1,
0.7856771, -0.9699367, 3.818974, 0.6627451, 0, 1, 1,
0.7903367, -2.0072, 1.718549, 0.6666667, 0, 1, 1,
0.7904398, 0.1199631, 1.498864, 0.6745098, 0, 1, 1,
0.7914381, 0.5988331, -0.177728, 0.6784314, 0, 1, 1,
0.7918019, -0.2542156, 2.319519, 0.6862745, 0, 1, 1,
0.7939661, 1.591903, -0.8954372, 0.6901961, 0, 1, 1,
0.7973687, 1.069446, 0.1417549, 0.6980392, 0, 1, 1,
0.7995762, -1.014482, 2.726916, 0.7058824, 0, 1, 1,
0.8007463, -1.10587, 2.512421, 0.7098039, 0, 1, 1,
0.8030007, 1.900884, 1.442726, 0.7176471, 0, 1, 1,
0.8109134, -1.242851, 2.589561, 0.7215686, 0, 1, 1,
0.8154185, -0.4814982, 1.029578, 0.7294118, 0, 1, 1,
0.8163607, -0.6029934, 1.906341, 0.7333333, 0, 1, 1,
0.8236771, -0.04532042, 0.7463639, 0.7411765, 0, 1, 1,
0.8317652, -1.461446, 2.101893, 0.7450981, 0, 1, 1,
0.8411427, -1.260643, 3.665155, 0.7529412, 0, 1, 1,
0.843151, -1.965149, 1.39589, 0.7568628, 0, 1, 1,
0.8472818, 0.3160898, -0.2081077, 0.7647059, 0, 1, 1,
0.8488785, 0.3126968, 1.526203, 0.7686275, 0, 1, 1,
0.8499911, -0.4208058, 3.060938, 0.7764706, 0, 1, 1,
0.8546834, 0.5162196, 1.467431, 0.7803922, 0, 1, 1,
0.8616464, 1.957492, 0.2465047, 0.7882353, 0, 1, 1,
0.8642904, -0.4359823, 1.742638, 0.7921569, 0, 1, 1,
0.8920507, -1.098307, 1.57318, 0.8, 0, 1, 1,
0.8961195, -0.4704762, 1.915478, 0.8078431, 0, 1, 1,
0.8964469, -1.014204, 1.49935, 0.8117647, 0, 1, 1,
0.9020899, 0.6745226, -0.1924878, 0.8196079, 0, 1, 1,
0.9025903, 0.2804861, 1.215057, 0.8235294, 0, 1, 1,
0.903699, -0.6633524, 2.302244, 0.8313726, 0, 1, 1,
0.9044923, -2.040817, 2.940446, 0.8352941, 0, 1, 1,
0.9138119, -0.2255466, 2.006086, 0.8431373, 0, 1, 1,
0.9139027, -0.4004139, 1.898717, 0.8470588, 0, 1, 1,
0.9144252, -1.20506, 3.558516, 0.854902, 0, 1, 1,
0.9145091, -2.270816, 1.197036, 0.8588235, 0, 1, 1,
0.9166806, -0.5428443, -0.07518197, 0.8666667, 0, 1, 1,
0.9241528, -0.7855495, 3.09129, 0.8705882, 0, 1, 1,
0.9307929, -0.552361, 0.8244454, 0.8784314, 0, 1, 1,
0.9322773, 0.5533867, 1.855106, 0.8823529, 0, 1, 1,
0.9353641, -0.6329295, 1.705808, 0.8901961, 0, 1, 1,
0.9414067, -1.948555, 3.256156, 0.8941177, 0, 1, 1,
0.9420258, -0.6659923, 2.815799, 0.9019608, 0, 1, 1,
0.9454336, -0.04797888, 1.019274, 0.9098039, 0, 1, 1,
0.9493446, -0.3835481, 0.7603189, 0.9137255, 0, 1, 1,
0.9515162, 0.679466, 2.215054, 0.9215686, 0, 1, 1,
0.954787, -0.2783152, 2.636658, 0.9254902, 0, 1, 1,
0.9574835, -0.1512576, 1.726536, 0.9333333, 0, 1, 1,
0.9686888, 1.155563, 0.8293888, 0.9372549, 0, 1, 1,
0.9698694, 2.165048, 0.9293385, 0.945098, 0, 1, 1,
0.9751757, 0.5616077, 1.570204, 0.9490196, 0, 1, 1,
0.9764369, 1.171916, -0.5590427, 0.9568627, 0, 1, 1,
0.9785311, -0.3391289, 2.479989, 0.9607843, 0, 1, 1,
0.9848312, 1.058535, -1.051758, 0.9686275, 0, 1, 1,
0.9922578, 0.004758089, 1.103961, 0.972549, 0, 1, 1,
0.9970201, -0.6495893, 2.791275, 0.9803922, 0, 1, 1,
0.9999302, 0.3359081, 1.071442, 0.9843137, 0, 1, 1,
1.005462, -0.2798862, 0.157083, 0.9921569, 0, 1, 1,
1.011095, -0.9887273, 2.859944, 0.9960784, 0, 1, 1,
1.012653, -0.9287237, 2.924856, 1, 0, 0.9960784, 1,
1.015333, 0.3758735, 3.543408, 1, 0, 0.9882353, 1,
1.01833, 0.9015421, 0.6321848, 1, 0, 0.9843137, 1,
1.01974, -0.09525089, 2.830846, 1, 0, 0.9764706, 1,
1.023921, 0.2994139, 1.149747, 1, 0, 0.972549, 1,
1.027372, 1.062641, 0.6546234, 1, 0, 0.9647059, 1,
1.029354, -0.2065502, 2.25396, 1, 0, 0.9607843, 1,
1.03239, 0.4481457, 2.450531, 1, 0, 0.9529412, 1,
1.038206, 1.096938, -0.3038005, 1, 0, 0.9490196, 1,
1.039867, 0.2631884, 1.820683, 1, 0, 0.9411765, 1,
1.040438, -0.0881958, 1.406538, 1, 0, 0.9372549, 1,
1.043718, -1.964109, 3.799105, 1, 0, 0.9294118, 1,
1.043846, -0.2688982, 2.620266, 1, 0, 0.9254902, 1,
1.047243, -0.6941087, 1.64858, 1, 0, 0.9176471, 1,
1.049269, -1.369557, 2.117483, 1, 0, 0.9137255, 1,
1.050244, 1.062735, 1.469605, 1, 0, 0.9058824, 1,
1.052464, 0.9873419, 1.339862, 1, 0, 0.9019608, 1,
1.0534, 0.6845393, 1.022163, 1, 0, 0.8941177, 1,
1.063651, -1.550586, 2.743294, 1, 0, 0.8862745, 1,
1.067837, 0.3777461, 0.9783878, 1, 0, 0.8823529, 1,
1.071475, 0.6589345, 1.163635, 1, 0, 0.8745098, 1,
1.072791, 1.517869, 0.4037291, 1, 0, 0.8705882, 1,
1.080689, -1.443648, 1.911426, 1, 0, 0.8627451, 1,
1.086281, 0.6513124, 1.394293, 1, 0, 0.8588235, 1,
1.086925, -1.106425, 1.17753, 1, 0, 0.8509804, 1,
1.089713, 0.8578994, 0.8799484, 1, 0, 0.8470588, 1,
1.091454, -0.2563011, 3.305675, 1, 0, 0.8392157, 1,
1.099357, -0.6957551, 1.201225, 1, 0, 0.8352941, 1,
1.101916, -0.7158259, 0.8763457, 1, 0, 0.827451, 1,
1.102861, -0.6372826, 4.270409, 1, 0, 0.8235294, 1,
1.110286, 0.139353, 0.5967423, 1, 0, 0.8156863, 1,
1.111835, 1.00445, -1.422906, 1, 0, 0.8117647, 1,
1.120885, -0.133942, 3.681318, 1, 0, 0.8039216, 1,
1.124405, -0.4817539, 1.664484, 1, 0, 0.7960784, 1,
1.128604, -0.6016316, 1.142778, 1, 0, 0.7921569, 1,
1.132433, 0.5718604, 1.017646, 1, 0, 0.7843137, 1,
1.138992, -0.4705513, 0.4873515, 1, 0, 0.7803922, 1,
1.141009, 0.04290954, 2.436823, 1, 0, 0.772549, 1,
1.141947, 0.583135, 2.078746, 1, 0, 0.7686275, 1,
1.142031, -1.145992, 2.756255, 1, 0, 0.7607843, 1,
1.148379, -0.5358104, 0.7017673, 1, 0, 0.7568628, 1,
1.154513, 0.903738, 2.527983, 1, 0, 0.7490196, 1,
1.155719, 1.512487, 1.255877, 1, 0, 0.7450981, 1,
1.159259, 0.9731338, -0.8358363, 1, 0, 0.7372549, 1,
1.162057, 1.585111, 1.086614, 1, 0, 0.7333333, 1,
1.164374, -1.321202, 2.063579, 1, 0, 0.7254902, 1,
1.178001, -1.352106, -0.5219176, 1, 0, 0.7215686, 1,
1.19223, -0.7544978, 2.469555, 1, 0, 0.7137255, 1,
1.200368, 0.9370382, 0.6831714, 1, 0, 0.7098039, 1,
1.205714, -3.968988, 1.115465, 1, 0, 0.7019608, 1,
1.210089, -0.5628361, 1.78849, 1, 0, 0.6941177, 1,
1.216092, 0.7669389, 0.5493287, 1, 0, 0.6901961, 1,
1.224464, 1.591595, -0.7418283, 1, 0, 0.682353, 1,
1.233683, 0.02758087, 1.154278, 1, 0, 0.6784314, 1,
1.233726, 0.9501711, 1.1867, 1, 0, 0.6705883, 1,
1.234475, -0.03212737, 1.060897, 1, 0, 0.6666667, 1,
1.241479, -0.354257, 2.482244, 1, 0, 0.6588235, 1,
1.256251, 0.2227104, 0.235299, 1, 0, 0.654902, 1,
1.274718, -1.751381, 1.908023, 1, 0, 0.6470588, 1,
1.275726, -0.1218556, 2.063024, 1, 0, 0.6431373, 1,
1.279138, 0.7695629, 1.486134, 1, 0, 0.6352941, 1,
1.282707, 0.5942604, 0.4604521, 1, 0, 0.6313726, 1,
1.294132, 0.1496249, 0.1083549, 1, 0, 0.6235294, 1,
1.299246, 0.05242769, 1.74414, 1, 0, 0.6196079, 1,
1.300241, 0.3277839, 1.163477, 1, 0, 0.6117647, 1,
1.30374, 1.611344, 1.954457, 1, 0, 0.6078432, 1,
1.306389, -1.566286, 1.401111, 1, 0, 0.6, 1,
1.319802, -1.038641, 0.8933678, 1, 0, 0.5921569, 1,
1.324301, 0.3573017, 0.3697675, 1, 0, 0.5882353, 1,
1.327707, -0.5997155, 1.121074, 1, 0, 0.5803922, 1,
1.330606, -0.7977418, 2.745766, 1, 0, 0.5764706, 1,
1.333617, -1.579785, 2.824583, 1, 0, 0.5686275, 1,
1.334746, 0.07761561, 1.466334, 1, 0, 0.5647059, 1,
1.335207, 0.2107846, 1.102051, 1, 0, 0.5568628, 1,
1.335896, 0.9224359, -0.04311677, 1, 0, 0.5529412, 1,
1.35907, -0.06598597, 1.530885, 1, 0, 0.5450981, 1,
1.370975, 0.6429362, 1.246502, 1, 0, 0.5411765, 1,
1.394553, 0.4458852, 1.481835, 1, 0, 0.5333334, 1,
1.407295, -1.740241, 2.110123, 1, 0, 0.5294118, 1,
1.416439, -0.07319906, 2.722025, 1, 0, 0.5215687, 1,
1.418459, 2.294795, 0.8505248, 1, 0, 0.5176471, 1,
1.423629, -0.6048278, 2.247973, 1, 0, 0.509804, 1,
1.431655, -1.519325, 3.742784, 1, 0, 0.5058824, 1,
1.434543, 0.06720556, 3.109558, 1, 0, 0.4980392, 1,
1.444806, -1.452077, 0.5687561, 1, 0, 0.4901961, 1,
1.452818, 0.1163206, 2.104759, 1, 0, 0.4862745, 1,
1.453609, 1.686335, 1.415139, 1, 0, 0.4784314, 1,
1.46293, -0.5651661, 1.829206, 1, 0, 0.4745098, 1,
1.464167, 0.3564009, -0.2589264, 1, 0, 0.4666667, 1,
1.464731, 0.6750143, 1.174197, 1, 0, 0.4627451, 1,
1.464742, 1.368028, 0.4806654, 1, 0, 0.454902, 1,
1.474288, -0.5400913, 1.061984, 1, 0, 0.4509804, 1,
1.475924, 0.1956146, 2.115824, 1, 0, 0.4431373, 1,
1.4761, -0.9857205, 0.4786215, 1, 0, 0.4392157, 1,
1.47941, -0.9054368, 2.716555, 1, 0, 0.4313726, 1,
1.48264, 0.7975203, 1.104027, 1, 0, 0.427451, 1,
1.483938, -0.1733951, 0.3089345, 1, 0, 0.4196078, 1,
1.50039, -0.1121714, 2.045224, 1, 0, 0.4156863, 1,
1.502845, -1.132682, 2.701522, 1, 0, 0.4078431, 1,
1.506425, 0.8425776, 1.691723, 1, 0, 0.4039216, 1,
1.506658, -1.811298, 1.321012, 1, 0, 0.3960784, 1,
1.508535, -0.7028042, 1.122654, 1, 0, 0.3882353, 1,
1.51557, -0.4247775, 0.1393023, 1, 0, 0.3843137, 1,
1.517487, 0.3428999, 3.200083, 1, 0, 0.3764706, 1,
1.521651, -0.06096125, 1.825073, 1, 0, 0.372549, 1,
1.523549, -0.213472, 3.176758, 1, 0, 0.3647059, 1,
1.531645, -0.6770374, 2.731451, 1, 0, 0.3607843, 1,
1.540015, 0.7179707, -0.3351646, 1, 0, 0.3529412, 1,
1.545428, -0.07272504, 2.66625, 1, 0, 0.3490196, 1,
1.549293, -0.881744, 2.90045, 1, 0, 0.3411765, 1,
1.550166, -1.119318, 3.599907, 1, 0, 0.3372549, 1,
1.554938, 1.094382, 0.6627641, 1, 0, 0.3294118, 1,
1.557966, -0.9134759, 1.510929, 1, 0, 0.3254902, 1,
1.559158, -1.345924, 1.763709, 1, 0, 0.3176471, 1,
1.568796, 1.936237, -0.07041986, 1, 0, 0.3137255, 1,
1.569534, 0.6751394, 1.837232, 1, 0, 0.3058824, 1,
1.570955, -1.247989, 1.918459, 1, 0, 0.2980392, 1,
1.57574, -0.3325807, 0.4303443, 1, 0, 0.2941177, 1,
1.576347, 1.122385, 1.206207, 1, 0, 0.2862745, 1,
1.580435, -0.7187554, 2.401997, 1, 0, 0.282353, 1,
1.596141, 1.96959, 0.211574, 1, 0, 0.2745098, 1,
1.598119, -0.3724613, 1.485353, 1, 0, 0.2705882, 1,
1.59857, 0.7700524, 1.123608, 1, 0, 0.2627451, 1,
1.604943, 0.07689693, 2.197978, 1, 0, 0.2588235, 1,
1.629564, 1.388308, 1.860197, 1, 0, 0.2509804, 1,
1.647765, 0.5914518, 1.296759, 1, 0, 0.2470588, 1,
1.652631, -1.134858, 2.965191, 1, 0, 0.2392157, 1,
1.655256, 1.304133, 1.169775, 1, 0, 0.2352941, 1,
1.662296, 0.4113064, -0.1846466, 1, 0, 0.227451, 1,
1.662521, 1.114189, 1.314085, 1, 0, 0.2235294, 1,
1.687075, -0.3154468, 0.3232343, 1, 0, 0.2156863, 1,
1.698387, 0.1504196, -0.1494643, 1, 0, 0.2117647, 1,
1.737077, -0.2683254, 4.047064, 1, 0, 0.2039216, 1,
1.741517, 0.6736625, 1.28595, 1, 0, 0.1960784, 1,
1.745299, -0.6379793, 1.344792, 1, 0, 0.1921569, 1,
1.745571, -0.9989036, 1.528201, 1, 0, 0.1843137, 1,
1.751794, -0.8210693, 2.529217, 1, 0, 0.1803922, 1,
1.770545, -0.6515067, 2.412375, 1, 0, 0.172549, 1,
1.77319, -0.7041699, 0.7118656, 1, 0, 0.1686275, 1,
1.778617, -0.1753858, 0.8754853, 1, 0, 0.1607843, 1,
1.793641, -0.1287583, -1.052011, 1, 0, 0.1568628, 1,
1.806227, 0.7081029, 0.3587508, 1, 0, 0.1490196, 1,
1.807269, -0.5457278, 1.397242, 1, 0, 0.145098, 1,
1.815518, -0.887543, 2.380693, 1, 0, 0.1372549, 1,
1.850016, -0.5079861, 1.543241, 1, 0, 0.1333333, 1,
1.868161, -0.197066, 2.767835, 1, 0, 0.1254902, 1,
1.874443, -1.475335, 2.684153, 1, 0, 0.1215686, 1,
1.87939, 0.5472552, 1.689337, 1, 0, 0.1137255, 1,
1.882236, -0.9846237, 2.196775, 1, 0, 0.1098039, 1,
1.897819, -0.5640285, 1.343825, 1, 0, 0.1019608, 1,
1.901242, 1.253673, -0.2266078, 1, 0, 0.09411765, 1,
1.905496, 0.5986643, 1.398191, 1, 0, 0.09019608, 1,
1.956748, -0.06458408, 0.3089217, 1, 0, 0.08235294, 1,
1.992104, 0.796507, 0.249871, 1, 0, 0.07843138, 1,
2.002247, -0.622369, 0.7250664, 1, 0, 0.07058824, 1,
2.093969, 0.4976424, 1.121581, 1, 0, 0.06666667, 1,
2.141115, -0.4248478, 2.309816, 1, 0, 0.05882353, 1,
2.222204, -0.8708305, 2.374415, 1, 0, 0.05490196, 1,
2.244922, 0.3395378, 1.626057, 1, 0, 0.04705882, 1,
2.315565, -1.33663, 3.301226, 1, 0, 0.04313726, 1,
2.377137, 0.2496908, 1.301637, 1, 0, 0.03529412, 1,
2.44576, 0.193252, 1.060535, 1, 0, 0.03137255, 1,
2.632355, 0.1567632, 2.913934, 1, 0, 0.02352941, 1,
2.825807, 0.02452701, 1.510689, 1, 0, 0.01960784, 1,
2.889532, 0.709983, 0.9489542, 1, 0, 0.01176471, 1,
2.982236, 0.4946944, 0.3544621, 1, 0, 0.007843138, 1
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
-0.2111899, -5.22058, -6.77424, 0, -0.5, 0.5, 0.5,
-0.2111899, -5.22058, -6.77424, 1, -0.5, 0.5, 0.5,
-0.2111899, -5.22058, -6.77424, 1, 1.5, 0.5, 0.5,
-0.2111899, -5.22058, -6.77424, 0, 1.5, 0.5, 0.5
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
-4.487187, -0.2769769, -6.77424, 0, -0.5, 0.5, 0.5,
-4.487187, -0.2769769, -6.77424, 1, -0.5, 0.5, 0.5,
-4.487187, -0.2769769, -6.77424, 1, 1.5, 0.5, 0.5,
-4.487187, -0.2769769, -6.77424, 0, 1.5, 0.5, 0.5
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
-4.487187, -5.22058, 0.1804273, 0, -0.5, 0.5, 0.5,
-4.487187, -5.22058, 0.1804273, 1, -0.5, 0.5, 0.5,
-4.487187, -5.22058, 0.1804273, 1, 1.5, 0.5, 0.5,
-4.487187, -5.22058, 0.1804273, 0, 1.5, 0.5, 0.5
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
-3, -4.079749, -5.169317,
2, -4.079749, -5.169317,
-3, -4.079749, -5.169317,
-3, -4.269887, -5.436804,
-2, -4.079749, -5.169317,
-2, -4.269887, -5.436804,
-1, -4.079749, -5.169317,
-1, -4.269887, -5.436804,
0, -4.079749, -5.169317,
0, -4.269887, -5.436804,
1, -4.079749, -5.169317,
1, -4.269887, -5.436804,
2, -4.079749, -5.169317,
2, -4.269887, -5.436804
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
-3, -4.650164, -5.971779, 0, -0.5, 0.5, 0.5,
-3, -4.650164, -5.971779, 1, -0.5, 0.5, 0.5,
-3, -4.650164, -5.971779, 1, 1.5, 0.5, 0.5,
-3, -4.650164, -5.971779, 0, 1.5, 0.5, 0.5,
-2, -4.650164, -5.971779, 0, -0.5, 0.5, 0.5,
-2, -4.650164, -5.971779, 1, -0.5, 0.5, 0.5,
-2, -4.650164, -5.971779, 1, 1.5, 0.5, 0.5,
-2, -4.650164, -5.971779, 0, 1.5, 0.5, 0.5,
-1, -4.650164, -5.971779, 0, -0.5, 0.5, 0.5,
-1, -4.650164, -5.971779, 1, -0.5, 0.5, 0.5,
-1, -4.650164, -5.971779, 1, 1.5, 0.5, 0.5,
-1, -4.650164, -5.971779, 0, 1.5, 0.5, 0.5,
0, -4.650164, -5.971779, 0, -0.5, 0.5, 0.5,
0, -4.650164, -5.971779, 1, -0.5, 0.5, 0.5,
0, -4.650164, -5.971779, 1, 1.5, 0.5, 0.5,
0, -4.650164, -5.971779, 0, 1.5, 0.5, 0.5,
1, -4.650164, -5.971779, 0, -0.5, 0.5, 0.5,
1, -4.650164, -5.971779, 1, -0.5, 0.5, 0.5,
1, -4.650164, -5.971779, 1, 1.5, 0.5, 0.5,
1, -4.650164, -5.971779, 0, 1.5, 0.5, 0.5,
2, -4.650164, -5.971779, 0, -0.5, 0.5, 0.5,
2, -4.650164, -5.971779, 1, -0.5, 0.5, 0.5,
2, -4.650164, -5.971779, 1, 1.5, 0.5, 0.5,
2, -4.650164, -5.971779, 0, 1.5, 0.5, 0.5
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
-3.500419, -2, -5.169317,
-3.500419, 2, -5.169317,
-3.500419, -2, -5.169317,
-3.66488, -2, -5.436804,
-3.500419, 0, -5.169317,
-3.66488, 0, -5.436804,
-3.500419, 2, -5.169317,
-3.66488, 2, -5.436804
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
-3.993803, -2, -5.971779, 0, -0.5, 0.5, 0.5,
-3.993803, -2, -5.971779, 1, -0.5, 0.5, 0.5,
-3.993803, -2, -5.971779, 1, 1.5, 0.5, 0.5,
-3.993803, -2, -5.971779, 0, 1.5, 0.5, 0.5,
-3.993803, 0, -5.971779, 0, -0.5, 0.5, 0.5,
-3.993803, 0, -5.971779, 1, -0.5, 0.5, 0.5,
-3.993803, 0, -5.971779, 1, 1.5, 0.5, 0.5,
-3.993803, 0, -5.971779, 0, 1.5, 0.5, 0.5,
-3.993803, 2, -5.971779, 0, -0.5, 0.5, 0.5,
-3.993803, 2, -5.971779, 1, -0.5, 0.5, 0.5,
-3.993803, 2, -5.971779, 1, 1.5, 0.5, 0.5,
-3.993803, 2, -5.971779, 0, 1.5, 0.5, 0.5
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
-3.500419, -4.079749, -4,
-3.500419, -4.079749, 4,
-3.500419, -4.079749, -4,
-3.66488, -4.269887, -4,
-3.500419, -4.079749, -2,
-3.66488, -4.269887, -2,
-3.500419, -4.079749, 0,
-3.66488, -4.269887, 0,
-3.500419, -4.079749, 2,
-3.66488, -4.269887, 2,
-3.500419, -4.079749, 4,
-3.66488, -4.269887, 4
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
-3.993803, -4.650164, -4, 0, -0.5, 0.5, 0.5,
-3.993803, -4.650164, -4, 1, -0.5, 0.5, 0.5,
-3.993803, -4.650164, -4, 1, 1.5, 0.5, 0.5,
-3.993803, -4.650164, -4, 0, 1.5, 0.5, 0.5,
-3.993803, -4.650164, -2, 0, -0.5, 0.5, 0.5,
-3.993803, -4.650164, -2, 1, -0.5, 0.5, 0.5,
-3.993803, -4.650164, -2, 1, 1.5, 0.5, 0.5,
-3.993803, -4.650164, -2, 0, 1.5, 0.5, 0.5,
-3.993803, -4.650164, 0, 0, -0.5, 0.5, 0.5,
-3.993803, -4.650164, 0, 1, -0.5, 0.5, 0.5,
-3.993803, -4.650164, 0, 1, 1.5, 0.5, 0.5,
-3.993803, -4.650164, 0, 0, 1.5, 0.5, 0.5,
-3.993803, -4.650164, 2, 0, -0.5, 0.5, 0.5,
-3.993803, -4.650164, 2, 1, -0.5, 0.5, 0.5,
-3.993803, -4.650164, 2, 1, 1.5, 0.5, 0.5,
-3.993803, -4.650164, 2, 0, 1.5, 0.5, 0.5,
-3.993803, -4.650164, 4, 0, -0.5, 0.5, 0.5,
-3.993803, -4.650164, 4, 1, -0.5, 0.5, 0.5,
-3.993803, -4.650164, 4, 1, 1.5, 0.5, 0.5,
-3.993803, -4.650164, 4, 0, 1.5, 0.5, 0.5
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
-3.500419, -4.079749, -5.169317,
-3.500419, 3.525795, -5.169317,
-3.500419, -4.079749, 5.530172,
-3.500419, 3.525795, 5.530172,
-3.500419, -4.079749, -5.169317,
-3.500419, -4.079749, 5.530172,
-3.500419, 3.525795, -5.169317,
-3.500419, 3.525795, 5.530172,
-3.500419, -4.079749, -5.169317,
3.078039, -4.079749, -5.169317,
-3.500419, -4.079749, 5.530172,
3.078039, -4.079749, 5.530172,
-3.500419, 3.525795, -5.169317,
3.078039, 3.525795, -5.169317,
-3.500419, 3.525795, 5.530172,
3.078039, 3.525795, 5.530172,
3.078039, -4.079749, -5.169317,
3.078039, 3.525795, -5.169317,
3.078039, -4.079749, 5.530172,
3.078039, 3.525795, 5.530172,
3.078039, -4.079749, -5.169317,
3.078039, -4.079749, 5.530172,
3.078039, 3.525795, -5.169317,
3.078039, 3.525795, 5.530172
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
var radius = 7.8406;
var distance = 34.88372;
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
mvMatrix.translate( 0.2111899, 0.2769769, -0.1804273 );
mvMatrix.scale( 1.288662, 1.114636, 0.7923192 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.88372);
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
dinitramine<-read.table("dinitramine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dinitramine$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinitramine' not found
```

```r
y<-dinitramine$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinitramine' not found
```

```r
z<-dinitramine$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinitramine' not found
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
-3.404616, -0.1211433, -1.342424, 0, 0, 1, 1, 1,
-3.160205, 1.873231, 0.1847712, 1, 0, 0, 1, 1,
-2.782246, -0.2442217, -2.714451, 1, 0, 0, 1, 1,
-2.644876, 0.1054714, -0.7829694, 1, 0, 0, 1, 1,
-2.631989, 0.5526025, -1.675708, 1, 0, 0, 1, 1,
-2.582993, 0.006512375, -1.711666, 1, 0, 0, 1, 1,
-2.465353, -0.7698244, -1.905845, 0, 0, 0, 1, 1,
-2.405121, -0.002738865, -1.48294, 0, 0, 0, 1, 1,
-2.405065, -0.1120901, -2.792113, 0, 0, 0, 1, 1,
-2.389549, -0.09688404, -1.684268, 0, 0, 0, 1, 1,
-2.373158, 0.1251212, -1.188737, 0, 0, 0, 1, 1,
-2.301447, 1.219355, -0.9344019, 0, 0, 0, 1, 1,
-2.232382, 0.184635, -0.9404057, 0, 0, 0, 1, 1,
-2.225348, -1.211614, -1.517517, 1, 1, 1, 1, 1,
-2.190695, 0.8939198, -1.509277, 1, 1, 1, 1, 1,
-2.164261, 1.41607, -0.2357564, 1, 1, 1, 1, 1,
-2.083428, -0.6539489, -1.230375, 1, 1, 1, 1, 1,
-2.055664, -0.1696107, -0.8118714, 1, 1, 1, 1, 1,
-2.049646, 0.08696567, -0.8014487, 1, 1, 1, 1, 1,
-2.028075, 0.02084423, -1.570701, 1, 1, 1, 1, 1,
-2.006421, -1.275994, -2.528791, 1, 1, 1, 1, 1,
-2.004598, 1.069582, -1.698669, 1, 1, 1, 1, 1,
-1.998771, 0.7379447, -1.331742, 1, 1, 1, 1, 1,
-1.997267, -0.4937899, -2.078719, 1, 1, 1, 1, 1,
-1.942281, 0.5789189, -0.4954081, 1, 1, 1, 1, 1,
-1.923663, -0.01413132, -0.7764755, 1, 1, 1, 1, 1,
-1.903427, -1.287442, -3.568454, 1, 1, 1, 1, 1,
-1.897263, -0.0537517, -1.784943, 1, 1, 1, 1, 1,
-1.887292, -1.07525, -2.156548, 0, 0, 1, 1, 1,
-1.864804, -1.010256, -2.156622, 1, 0, 0, 1, 1,
-1.841635, 0.8373935, -0.463417, 1, 0, 0, 1, 1,
-1.808059, 1.882972, -0.2919673, 1, 0, 0, 1, 1,
-1.801253, 0.2093861, -1.524392, 1, 0, 0, 1, 1,
-1.795992, 0.9876498, 0.3954472, 1, 0, 0, 1, 1,
-1.794602, -0.06117263, -0.4136338, 0, 0, 0, 1, 1,
-1.777603, -0.4579196, -1.299238, 0, 0, 0, 1, 1,
-1.773902, -0.8003582, -0.1887791, 0, 0, 0, 1, 1,
-1.76824, -1.140202, -3.733005, 0, 0, 0, 1, 1,
-1.721197, 0.6802744, -1.654855, 0, 0, 0, 1, 1,
-1.704305, -0.5646499, -3.137137, 0, 0, 0, 1, 1,
-1.690094, -0.7588608, -1.221941, 0, 0, 0, 1, 1,
-1.676204, -0.9187597, -2.648861, 1, 1, 1, 1, 1,
-1.667512, 0.3928074, -1.396407, 1, 1, 1, 1, 1,
-1.665517, 0.7853579, -0.3541586, 1, 1, 1, 1, 1,
-1.661683, 0.2566717, 0.9539565, 1, 1, 1, 1, 1,
-1.646711, 1.505421, -0.1419917, 1, 1, 1, 1, 1,
-1.628948, 0.08131392, -0.4761341, 1, 1, 1, 1, 1,
-1.601398, -0.2977645, -2.940425, 1, 1, 1, 1, 1,
-1.58112, -0.8190569, -0.9839485, 1, 1, 1, 1, 1,
-1.580451, 0.2308853, 0.5338955, 1, 1, 1, 1, 1,
-1.579874, -0.6715794, -0.5245546, 1, 1, 1, 1, 1,
-1.578401, -0.7785737, -0.5503682, 1, 1, 1, 1, 1,
-1.577455, -0.434398, -0.7908809, 1, 1, 1, 1, 1,
-1.571418, -1.258272, -2.463667, 1, 1, 1, 1, 1,
-1.570039, -0.5493305, -0.690591, 1, 1, 1, 1, 1,
-1.568991, -1.638195, -0.8179927, 1, 1, 1, 1, 1,
-1.567237, 0.01179788, -1.468236, 0, 0, 1, 1, 1,
-1.559983, -0.002791152, -0.1764728, 1, 0, 0, 1, 1,
-1.552838, 0.194692, -1.207507, 1, 0, 0, 1, 1,
-1.551518, 1.281837, 0.1060987, 1, 0, 0, 1, 1,
-1.549574, -1.657881, -1.062828, 1, 0, 0, 1, 1,
-1.546519, 0.216506, -1.244537, 1, 0, 0, 1, 1,
-1.542603, 1.344005, -0.9531229, 0, 0, 0, 1, 1,
-1.541942, 0.1364456, -1.410079, 0, 0, 0, 1, 1,
-1.532957, -1.542756, -2.635632, 0, 0, 0, 1, 1,
-1.527544, -0.1552498, -2.18143, 0, 0, 0, 1, 1,
-1.527007, 0.04223249, -1.725174, 0, 0, 0, 1, 1,
-1.509505, 1.062878, -0.510858, 0, 0, 0, 1, 1,
-1.498409, 1.278557, -2.473023, 0, 0, 0, 1, 1,
-1.482848, 0.1929862, -0.8187985, 1, 1, 1, 1, 1,
-1.452626, -2.291564, -2.417402, 1, 1, 1, 1, 1,
-1.450665, 1.152065, -2.351045, 1, 1, 1, 1, 1,
-1.450454, -2.103759, -0.7680995, 1, 1, 1, 1, 1,
-1.441626, -1.29064, -1.395094, 1, 1, 1, 1, 1,
-1.441211, 1.219715, -0.5865321, 1, 1, 1, 1, 1,
-1.439361, 0.7756986, -0.3988632, 1, 1, 1, 1, 1,
-1.422093, -0.2063194, -1.399426, 1, 1, 1, 1, 1,
-1.418334, -0.585914, -1.660679, 1, 1, 1, 1, 1,
-1.41397, 1.174602, 0.5361956, 1, 1, 1, 1, 1,
-1.396143, 0.5257261, -0.8366576, 1, 1, 1, 1, 1,
-1.382249, -0.4149463, -0.4589565, 1, 1, 1, 1, 1,
-1.373553, -0.1266997, -2.846064, 1, 1, 1, 1, 1,
-1.370287, -0.001335347, -1.083731, 1, 1, 1, 1, 1,
-1.366295, -0.3223336, -2.021835, 1, 1, 1, 1, 1,
-1.357301, 0.5302195, -1.204111, 0, 0, 1, 1, 1,
-1.356823, 0.3419332, -1.135749, 1, 0, 0, 1, 1,
-1.342929, -0.4423387, -2.612034, 1, 0, 0, 1, 1,
-1.335556, 0.2746139, -1.509469, 1, 0, 0, 1, 1,
-1.324489, 0.08242508, -0.3562838, 1, 0, 0, 1, 1,
-1.313162, 1.138948, -0.3323722, 1, 0, 0, 1, 1,
-1.305776, 1.585575, -0.6029677, 0, 0, 0, 1, 1,
-1.302437, -0.3609094, -3.344498, 0, 0, 0, 1, 1,
-1.302174, -0.14631, -2.333639, 0, 0, 0, 1, 1,
-1.300079, -1.532243, -1.5151, 0, 0, 0, 1, 1,
-1.29995, -1.660605, -2.786471, 0, 0, 0, 1, 1,
-1.298292, -0.1546983, -3.528305, 0, 0, 0, 1, 1,
-1.283571, -1.360862, -0.791324, 0, 0, 0, 1, 1,
-1.282071, 0.06604923, -1.656546, 1, 1, 1, 1, 1,
-1.277778, 0.6443565, -0.01216389, 1, 1, 1, 1, 1,
-1.273996, -0.6843939, -2.211635, 1, 1, 1, 1, 1,
-1.270358, -1.830421, -1.453225, 1, 1, 1, 1, 1,
-1.266933, 1.22987, 0.4244448, 1, 1, 1, 1, 1,
-1.263018, 0.1341917, -1.810557, 1, 1, 1, 1, 1,
-1.250793, -1.201011, -3.239331, 1, 1, 1, 1, 1,
-1.233442, 0.2993705, -2.490269, 1, 1, 1, 1, 1,
-1.226484, 1.152953, -0.8923894, 1, 1, 1, 1, 1,
-1.224248, 0.8835666, -1.828302, 1, 1, 1, 1, 1,
-1.206387, -0.8347512, -2.763425, 1, 1, 1, 1, 1,
-1.189911, 0.8628404, -0.3913398, 1, 1, 1, 1, 1,
-1.183128, -0.8723494, -3.590955, 1, 1, 1, 1, 1,
-1.181053, 0.5738893, -1.763419, 1, 1, 1, 1, 1,
-1.179668, 0.7625417, 0.7032728, 1, 1, 1, 1, 1,
-1.166623, -0.3204916, -1.618683, 0, 0, 1, 1, 1,
-1.166426, -0.4088846, -1.946888, 1, 0, 0, 1, 1,
-1.164533, -1.052454, -2.352028, 1, 0, 0, 1, 1,
-1.161523, 1.175346, 0.1591077, 1, 0, 0, 1, 1,
-1.159002, -0.1494361, -1.2133, 1, 0, 0, 1, 1,
-1.156989, -1.408356, -2.441997, 1, 0, 0, 1, 1,
-1.151857, 0.2177254, -2.508825, 0, 0, 0, 1, 1,
-1.137023, -0.2451846, -2.487567, 0, 0, 0, 1, 1,
-1.13647, 1.043211, -0.02631082, 0, 0, 0, 1, 1,
-1.131529, -1.062277, -1.595284, 0, 0, 0, 1, 1,
-1.12927, 0.2760878, 0.1163045, 0, 0, 0, 1, 1,
-1.127774, -0.241783, -3.367082, 0, 0, 0, 1, 1,
-1.125198, -0.2052541, -1.996546, 0, 0, 0, 1, 1,
-1.115842, -1.415765, -1.015626, 1, 1, 1, 1, 1,
-1.114627, -0.9944698, -3.441477, 1, 1, 1, 1, 1,
-1.112912, -0.7305275, -2.093574, 1, 1, 1, 1, 1,
-1.107077, 0.7349238, -1.831179, 1, 1, 1, 1, 1,
-1.104098, -0.2114289, 0.003787589, 1, 1, 1, 1, 1,
-1.0964, 0.3566093, -2.55328, 1, 1, 1, 1, 1,
-1.09494, 1.397121, 1.326896, 1, 1, 1, 1, 1,
-1.09216, -0.364318, -0.12723, 1, 1, 1, 1, 1,
-1.089339, 0.3695683, -1.57239, 1, 1, 1, 1, 1,
-1.087018, 0.2390479, -3.027264, 1, 1, 1, 1, 1,
-1.086075, -0.05259068, -0.8266242, 1, 1, 1, 1, 1,
-1.081768, -0.3374504, -0.6787162, 1, 1, 1, 1, 1,
-1.071164, -0.284974, -2.674754, 1, 1, 1, 1, 1,
-1.070554, -0.5519931, -4.125359, 1, 1, 1, 1, 1,
-1.064791, 1.669978, 0.7005901, 1, 1, 1, 1, 1,
-1.059396, -1.293869, -4.903826, 0, 0, 1, 1, 1,
-1.055107, 0.610059, -0.06087513, 1, 0, 0, 1, 1,
-1.055017, -0.06938247, -0.5468778, 1, 0, 0, 1, 1,
-1.054526, -0.2511757, -2.728992, 1, 0, 0, 1, 1,
-1.048703, -0.3075589, -0.552881, 1, 0, 0, 1, 1,
-1.045865, -0.8573906, -2.133081, 1, 0, 0, 1, 1,
-1.042751, 0.6282212, -0.8495067, 0, 0, 0, 1, 1,
-1.037135, 0.75333, -0.4885433, 0, 0, 0, 1, 1,
-1.034377, -0.5796292, -1.209233, 0, 0, 0, 1, 1,
-1.02461, -0.3825282, -2.557118, 0, 0, 0, 1, 1,
-1.019316, -0.7071917, -2.376529, 0, 0, 0, 1, 1,
-1.013831, 1.329664, 0.6290354, 0, 0, 0, 1, 1,
-1.013041, 1.164463, -0.638393, 0, 0, 0, 1, 1,
-1.009142, -1.127438, -1.082819, 1, 1, 1, 1, 1,
-1.00368, -0.1528076, -1.779189, 1, 1, 1, 1, 1,
-0.99617, 0.8192706, -1.528164, 1, 1, 1, 1, 1,
-0.9927377, 0.4828554, -1.561198, 1, 1, 1, 1, 1,
-0.9925761, 1.736678, -0.0394893, 1, 1, 1, 1, 1,
-0.9876705, 1.32577, -0.4292071, 1, 1, 1, 1, 1,
-0.9774742, 0.6637531, 0.4895365, 1, 1, 1, 1, 1,
-0.9750931, 0.8944013, 0.1085259, 1, 1, 1, 1, 1,
-0.9681192, 1.238515, -0.730525, 1, 1, 1, 1, 1,
-0.9675263, -0.07581595, -1.55298, 1, 1, 1, 1, 1,
-0.9557994, 0.592766, -0.7680823, 1, 1, 1, 1, 1,
-0.9535066, -0.6962961, -2.883833, 1, 1, 1, 1, 1,
-0.9516246, -1.453061, -1.661034, 1, 1, 1, 1, 1,
-0.9513476, -2.885503, -3.829165, 1, 1, 1, 1, 1,
-0.9428177, -0.3265086, -1.401878, 1, 1, 1, 1, 1,
-0.9384032, 1.265155, -1.179171, 0, 0, 1, 1, 1,
-0.9352645, -0.3250701, -0.1517558, 1, 0, 0, 1, 1,
-0.9313149, 0.03703887, -0.6281114, 1, 0, 0, 1, 1,
-0.9306089, 1.184768, -0.8115237, 1, 0, 0, 1, 1,
-0.9180663, 0.3606473, -1.495277, 1, 0, 0, 1, 1,
-0.9127836, 2.297161, -0.7271793, 1, 0, 0, 1, 1,
-0.91215, 0.7593429, -1.336136, 0, 0, 0, 1, 1,
-0.9121168, -0.7398825, -2.752598, 0, 0, 0, 1, 1,
-0.9115402, -0.8762808, -2.743797, 0, 0, 0, 1, 1,
-0.8960645, 1.646384, 0.1199081, 0, 0, 0, 1, 1,
-0.8936119, 1.181249, -0.8587685, 0, 0, 0, 1, 1,
-0.8881018, 0.4975732, -0.994747, 0, 0, 0, 1, 1,
-0.8876824, -1.804275, -2.293266, 0, 0, 0, 1, 1,
-0.8863228, -1.250743, -2.589926, 1, 1, 1, 1, 1,
-0.8824291, -0.88898, -2.202626, 1, 1, 1, 1, 1,
-0.8824174, -1.016213, -3.405514, 1, 1, 1, 1, 1,
-0.8823419, -1.56326, -3.052091, 1, 1, 1, 1, 1,
-0.8809553, 0.4973433, -2.096677, 1, 1, 1, 1, 1,
-0.8772835, -0.4820179, -1.346371, 1, 1, 1, 1, 1,
-0.8736343, 1.327349, -0.9412114, 1, 1, 1, 1, 1,
-0.8728136, -0.7270711, -2.391764, 1, 1, 1, 1, 1,
-0.870653, 0.2367457, -2.318841, 1, 1, 1, 1, 1,
-0.8687193, -2.205282, -3.149098, 1, 1, 1, 1, 1,
-0.8685535, -1.514941, -4.464869, 1, 1, 1, 1, 1,
-0.8643867, 0.1605157, -1.321036, 1, 1, 1, 1, 1,
-0.8638526, 0.4343196, -1.888763, 1, 1, 1, 1, 1,
-0.8606224, 0.900389, -0.2708014, 1, 1, 1, 1, 1,
-0.858712, 1.338217, -0.2817293, 1, 1, 1, 1, 1,
-0.8498437, 0.9622795, -0.00460676, 0, 0, 1, 1, 1,
-0.8495809, -0.1089937, -1.570659, 1, 0, 0, 1, 1,
-0.8487422, -1.896461, -1.996524, 1, 0, 0, 1, 1,
-0.8453217, -0.03635494, -2.483772, 1, 0, 0, 1, 1,
-0.8395659, 0.1245665, -0.2147095, 1, 0, 0, 1, 1,
-0.8344767, 0.1479101, -2.305106, 1, 0, 0, 1, 1,
-0.8310403, 1.957654, 0.589474, 0, 0, 0, 1, 1,
-0.8307471, -1.045935, -1.161137, 0, 0, 0, 1, 1,
-0.8296918, 0.6763774, -2.284689, 0, 0, 0, 1, 1,
-0.8125567, -1.316887, -2.818274, 0, 0, 0, 1, 1,
-0.809058, 0.3829384, -1.363684, 0, 0, 0, 1, 1,
-0.8063322, -0.5252585, -2.119564, 0, 0, 0, 1, 1,
-0.8029904, -0.3022941, -2.397411, 0, 0, 0, 1, 1,
-0.7958881, -1.124293, -1.048434, 1, 1, 1, 1, 1,
-0.7941999, 0.2714833, -2.255975, 1, 1, 1, 1, 1,
-0.7761894, -3.329796, -2.092238, 1, 1, 1, 1, 1,
-0.7743102, 0.24707, -0.0722523, 1, 1, 1, 1, 1,
-0.7648408, -0.6026433, -2.077461, 1, 1, 1, 1, 1,
-0.7622976, 0.3925631, 0.1826557, 1, 1, 1, 1, 1,
-0.7608672, -0.3635684, -3.344599, 1, 1, 1, 1, 1,
-0.7605189, 0.6359724, 0.7719402, 1, 1, 1, 1, 1,
-0.7599964, -0.5495547, -2.028647, 1, 1, 1, 1, 1,
-0.7546355, 0.7551259, -0.9608124, 1, 1, 1, 1, 1,
-0.7521572, 1.343622, 0.1262762, 1, 1, 1, 1, 1,
-0.752043, 0.4443899, -0.4900771, 1, 1, 1, 1, 1,
-0.7497128, -1.212112, -2.771031, 1, 1, 1, 1, 1,
-0.7494575, 1.800442, -1.209513, 1, 1, 1, 1, 1,
-0.748346, 0.7341321, 0.4321835, 1, 1, 1, 1, 1,
-0.7415473, -0.8812476, -0.8847949, 0, 0, 1, 1, 1,
-0.7387856, 0.8737586, -0.2231916, 1, 0, 0, 1, 1,
-0.7300141, 1.350587, -1.785861, 1, 0, 0, 1, 1,
-0.7263651, -0.2584545, -2.546016, 1, 0, 0, 1, 1,
-0.7232921, 0.9272211, 0.05062827, 1, 0, 0, 1, 1,
-0.7216341, 0.1300509, -2.151548, 1, 0, 0, 1, 1,
-0.7167241, 1.256036, 0.5109476, 0, 0, 0, 1, 1,
-0.7139983, 0.1930916, -1.560132, 0, 0, 0, 1, 1,
-0.7104613, -0.1551824, -2.170269, 0, 0, 0, 1, 1,
-0.710375, -1.078323, -3.379142, 0, 0, 0, 1, 1,
-0.7082137, -0.8440997, -3.604032, 0, 0, 0, 1, 1,
-0.706065, 0.3923393, -1.974913, 0, 0, 0, 1, 1,
-0.7024388, 0.1230214, -1.071708, 0, 0, 0, 1, 1,
-0.7000949, -1.738081, -4.061357, 1, 1, 1, 1, 1,
-0.7000921, 0.06403498, -0.3988935, 1, 1, 1, 1, 1,
-0.696484, -3.301289, -3.80169, 1, 1, 1, 1, 1,
-0.693484, -1.805084, -2.513627, 1, 1, 1, 1, 1,
-0.6918774, -0.2027997, -1.254481, 1, 1, 1, 1, 1,
-0.6896803, -0.9723802, -2.252933, 1, 1, 1, 1, 1,
-0.6792883, 0.8780529, -0.9126186, 1, 1, 1, 1, 1,
-0.6775651, 2.518476, 0.5755742, 1, 1, 1, 1, 1,
-0.6742516, 0.9644713, -0.69626, 1, 1, 1, 1, 1,
-0.6739544, -0.6855124, -2.831481, 1, 1, 1, 1, 1,
-0.6689214, 0.08416183, -0.8003657, 1, 1, 1, 1, 1,
-0.6586717, -0.4441324, -2.780734, 1, 1, 1, 1, 1,
-0.6531455, -0.1246842, -1.38256, 1, 1, 1, 1, 1,
-0.6531262, -1.227116, -1.336626, 1, 1, 1, 1, 1,
-0.6523754, -1.6251, -3.023048, 1, 1, 1, 1, 1,
-0.6444693, 0.8251003, -1.982634, 0, 0, 1, 1, 1,
-0.6442726, -1.399628, -1.77913, 1, 0, 0, 1, 1,
-0.6430202, -0.1912455, -3.081983, 1, 0, 0, 1, 1,
-0.6377196, 0.186886, -1.037846, 1, 0, 0, 1, 1,
-0.6253498, -0.3064619, -3.954553, 1, 0, 0, 1, 1,
-0.6197585, -0.914344, -2.104181, 1, 0, 0, 1, 1,
-0.6183518, -0.2008312, -2.416394, 0, 0, 0, 1, 1,
-0.6149251, -0.2535971, -1.544961, 0, 0, 0, 1, 1,
-0.61374, -0.8674002, -2.54675, 0, 0, 0, 1, 1,
-0.6113663, -1.314793, -0.9690686, 0, 0, 0, 1, 1,
-0.6081758, -0.6084476, -3.925956, 0, 0, 0, 1, 1,
-0.606629, 1.710102, -0.9616547, 0, 0, 0, 1, 1,
-0.606561, -0.09231658, -1.740435, 0, 0, 0, 1, 1,
-0.603705, 0.7508798, -1.020154, 1, 1, 1, 1, 1,
-0.6017824, 2.033061, -0.05615518, 1, 1, 1, 1, 1,
-0.6015897, 0.0922147, 0.8187468, 1, 1, 1, 1, 1,
-0.5988234, 1.641416, 0.6478761, 1, 1, 1, 1, 1,
-0.5959132, -0.6461825, -1.798539, 1, 1, 1, 1, 1,
-0.5945967, 0.6463149, -1.154034, 1, 1, 1, 1, 1,
-0.5937178, 0.8302384, -1.264068, 1, 1, 1, 1, 1,
-0.5919481, 0.04420443, -1.957162, 1, 1, 1, 1, 1,
-0.590927, -0.409921, -1.816133, 1, 1, 1, 1, 1,
-0.5892403, 0.9194002, -1.646219, 1, 1, 1, 1, 1,
-0.5808464, 0.6975314, -1.97937, 1, 1, 1, 1, 1,
-0.5788923, 0.5490081, -0.6597669, 1, 1, 1, 1, 1,
-0.5787058, 2.036188, -0.78346, 1, 1, 1, 1, 1,
-0.5766138, 1.036764, -0.7010393, 1, 1, 1, 1, 1,
-0.5655303, 0.2711314, -1.531845, 1, 1, 1, 1, 1,
-0.565147, 1.329731, -1.095155, 0, 0, 1, 1, 1,
-0.5649844, -1.032728, -1.703152, 1, 0, 0, 1, 1,
-0.5646285, -0.7167414, -1.654127, 1, 0, 0, 1, 1,
-0.5627079, 1.398455, -0.4397219, 1, 0, 0, 1, 1,
-0.5615996, -1.311877, -2.353919, 1, 0, 0, 1, 1,
-0.5586334, 0.5445767, -1.177052, 1, 0, 0, 1, 1,
-0.5572221, -0.9921799, -2.829058, 0, 0, 0, 1, 1,
-0.5571387, 0.6984753, -1.666015, 0, 0, 0, 1, 1,
-0.5562306, 0.5205309, -1.101237, 0, 0, 0, 1, 1,
-0.551118, 1.503611, 0.6866248, 0, 0, 0, 1, 1,
-0.5439814, -0.1159645, -0.1612689, 0, 0, 0, 1, 1,
-0.5426934, -0.7807005, -2.173323, 0, 0, 0, 1, 1,
-0.5335856, 1.34087, -0.4558394, 0, 0, 0, 1, 1,
-0.5328103, -1.12396, -2.034167, 1, 1, 1, 1, 1,
-0.5309136, -0.2852371, -0.9581831, 1, 1, 1, 1, 1,
-0.5305257, 1.16716, 0.9675949, 1, 1, 1, 1, 1,
-0.5301663, -0.5023797, -2.789516, 1, 1, 1, 1, 1,
-0.5272731, 0.1356191, -0.5551024, 1, 1, 1, 1, 1,
-0.5271628, 1.242174, 1.157547, 1, 1, 1, 1, 1,
-0.5247268, 0.183615, 0.3282461, 1, 1, 1, 1, 1,
-0.5203486, 0.9381555, -1.617374, 1, 1, 1, 1, 1,
-0.5156505, -0.1513872, -2.945189, 1, 1, 1, 1, 1,
-0.5124691, 0.1874317, -0.1429044, 1, 1, 1, 1, 1,
-0.5115385, -1.113359, -3.04859, 1, 1, 1, 1, 1,
-0.5074739, -0.3432686, -3.52551, 1, 1, 1, 1, 1,
-0.5066782, -0.4713858, -0.3787875, 1, 1, 1, 1, 1,
-0.497438, 0.1552095, -1.187394, 1, 1, 1, 1, 1,
-0.4966988, 0.109049, -2.395459, 1, 1, 1, 1, 1,
-0.4966832, 1.903806, -0.4659273, 0, 0, 1, 1, 1,
-0.4889475, -0.8051943, -1.399352, 1, 0, 0, 1, 1,
-0.4857039, 0.2614377, -1.034478, 1, 0, 0, 1, 1,
-0.4844389, 1.279277, 1.751461, 1, 0, 0, 1, 1,
-0.4841491, -2.533811, -1.989881, 1, 0, 0, 1, 1,
-0.4835341, 1.174804, 1.189396, 1, 0, 0, 1, 1,
-0.4833256, -1.488152, -5.013499, 0, 0, 0, 1, 1,
-0.4829188, -0.4694773, -3.219898, 0, 0, 0, 1, 1,
-0.4803354, -1.030273, -2.557463, 0, 0, 0, 1, 1,
-0.4789324, -0.3923588, -2.956762, 0, 0, 0, 1, 1,
-0.4767595, 0.5888368, -1.101742, 0, 0, 0, 1, 1,
-0.4766535, 1.150225, -2.134936, 0, 0, 0, 1, 1,
-0.4750335, -1.952897, -2.978229, 0, 0, 0, 1, 1,
-0.4733759, -1.230932, -3.262912, 1, 1, 1, 1, 1,
-0.4731443, -1.023605, -2.179909, 1, 1, 1, 1, 1,
-0.4612633, 0.172636, -1.384733, 1, 1, 1, 1, 1,
-0.4591536, 0.6654428, -0.8173999, 1, 1, 1, 1, 1,
-0.4539658, -0.7454544, -4.047537, 1, 1, 1, 1, 1,
-0.4491251, -0.3389723, -2.37456, 1, 1, 1, 1, 1,
-0.4491064, 1.628438, 0.06697843, 1, 1, 1, 1, 1,
-0.4478997, -0.3426483, -3.029304, 1, 1, 1, 1, 1,
-0.4413161, -0.2892919, -3.488595, 1, 1, 1, 1, 1,
-0.4400886, 0.7538962, 0.4204287, 1, 1, 1, 1, 1,
-0.4318412, 0.6403767, -0.6577485, 1, 1, 1, 1, 1,
-0.4301628, -0.4331329, -1.859385, 1, 1, 1, 1, 1,
-0.4296348, 0.6344506, 0.6751199, 1, 1, 1, 1, 1,
-0.4252062, 0.5586435, -2.339924, 1, 1, 1, 1, 1,
-0.4251545, -0.2942609, -1.309279, 1, 1, 1, 1, 1,
-0.4250121, 1.530685, -0.2750085, 0, 0, 1, 1, 1,
-0.4221184, -1.013808, -2.908133, 1, 0, 0, 1, 1,
-0.4201827, -1.766201, -3.448321, 1, 0, 0, 1, 1,
-0.4186084, -0.5069471, -3.827669, 1, 0, 0, 1, 1,
-0.4167697, 0.110811, -0.3429878, 1, 0, 0, 1, 1,
-0.4159097, 0.7358385, -0.5325091, 1, 0, 0, 1, 1,
-0.4149747, 0.2803639, -1.527964, 0, 0, 0, 1, 1,
-0.4119379, -1.783739, -1.74376, 0, 0, 0, 1, 1,
-0.4094036, 0.7451323, -0.5441785, 0, 0, 0, 1, 1,
-0.3953635, -1.69156, -1.322699, 0, 0, 0, 1, 1,
-0.3928078, 0.05719143, -2.484539, 0, 0, 0, 1, 1,
-0.3883135, -0.1900407, -2.465438, 0, 0, 0, 1, 1,
-0.3849686, 0.2800799, 0.01591197, 0, 0, 0, 1, 1,
-0.3846914, -0.4405703, -3.031538, 1, 1, 1, 1, 1,
-0.3842143, 0.2726847, -3.047019, 1, 1, 1, 1, 1,
-0.3841364, -1.846464, -3.782896, 1, 1, 1, 1, 1,
-0.3822777, 1.138737, 0.5756999, 1, 1, 1, 1, 1,
-0.3781639, 1.262738, -1.885483, 1, 1, 1, 1, 1,
-0.3780623, -0.2187473, -2.138915, 1, 1, 1, 1, 1,
-0.3775926, -0.04016343, -0.7714277, 1, 1, 1, 1, 1,
-0.3731426, -2.767806, -2.754524, 1, 1, 1, 1, 1,
-0.373026, -2.107708, -3.427084, 1, 1, 1, 1, 1,
-0.3718274, -0.2181806, -3.399722, 1, 1, 1, 1, 1,
-0.3688889, -1.803433, -3.05213, 1, 1, 1, 1, 1,
-0.3650871, -2.891166, -2.683776, 1, 1, 1, 1, 1,
-0.3632891, -2.523594, -1.67791, 1, 1, 1, 1, 1,
-0.3627573, 0.06190608, -1.468662, 1, 1, 1, 1, 1,
-0.3617793, -0.2920378, -1.688137, 1, 1, 1, 1, 1,
-0.354174, 0.05210078, -1.269207, 0, 0, 1, 1, 1,
-0.3521447, 0.1826179, -0.5777147, 1, 0, 0, 1, 1,
-0.3482668, -1.079411, -3.241822, 1, 0, 0, 1, 1,
-0.346992, -0.1340675, -1.395833, 1, 0, 0, 1, 1,
-0.3459815, 1.368805, -0.7231284, 1, 0, 0, 1, 1,
-0.3428642, -0.7917913, -1.564527, 1, 0, 0, 1, 1,
-0.3423435, 1.169042, -0.9917362, 0, 0, 0, 1, 1,
-0.3412308, 0.1806389, -2.43913, 0, 0, 0, 1, 1,
-0.3373702, 1.539873, -0.47336, 0, 0, 0, 1, 1,
-0.3329595, 1.781591, 1.295529, 0, 0, 0, 1, 1,
-0.3317843, 1.653775, -3.161688, 0, 0, 0, 1, 1,
-0.3301004, 0.07734725, -2.432117, 0, 0, 0, 1, 1,
-0.3285982, 1.401729, -1.120204, 0, 0, 0, 1, 1,
-0.3240709, 0.02577258, -1.397699, 1, 1, 1, 1, 1,
-0.3220648, -0.3279462, -3.035349, 1, 1, 1, 1, 1,
-0.3211947, -1.203526, -3.539801, 1, 1, 1, 1, 1,
-0.3200716, 0.5283902, -1.57064, 1, 1, 1, 1, 1,
-0.3187118, 0.5950871, -1.66928, 1, 1, 1, 1, 1,
-0.3164879, -0.2597826, -2.595551, 1, 1, 1, 1, 1,
-0.3136335, 0.8507524, -1.665737, 1, 1, 1, 1, 1,
-0.3112386, 0.09932626, 0.3153927, 1, 1, 1, 1, 1,
-0.3076415, -0.8689642, -3.169428, 1, 1, 1, 1, 1,
-0.3069397, 0.04999394, -1.803349, 1, 1, 1, 1, 1,
-0.3009256, 1.297745, -1.616429, 1, 1, 1, 1, 1,
-0.2990798, -0.6740558, -3.444042, 1, 1, 1, 1, 1,
-0.2974222, -0.5918029, -3.04712, 1, 1, 1, 1, 1,
-0.2967894, 0.5749076, -1.369619, 1, 1, 1, 1, 1,
-0.2958876, 0.6840028, -2.010502, 1, 1, 1, 1, 1,
-0.2952322, -1.203849, -2.620655, 0, 0, 1, 1, 1,
-0.2950227, 0.1515163, 0.4179056, 1, 0, 0, 1, 1,
-0.2910714, 1.619033, -0.06405326, 1, 0, 0, 1, 1,
-0.2892883, -0.2524295, -1.856346, 1, 0, 0, 1, 1,
-0.2877708, 0.5698097, -0.01733801, 1, 0, 0, 1, 1,
-0.2863618, 0.1162061, -3.435789, 1, 0, 0, 1, 1,
-0.2858078, 1.55837, 1.638777, 0, 0, 0, 1, 1,
-0.2856853, -0.3634617, -2.939843, 0, 0, 0, 1, 1,
-0.2832415, -1.13675, -2.712837, 0, 0, 0, 1, 1,
-0.2826996, 0.5009529, 0.3440092, 0, 0, 0, 1, 1,
-0.2811506, 2.094014, -0.2792273, 0, 0, 0, 1, 1,
-0.2798029, 0.6164956, 0.4864261, 0, 0, 0, 1, 1,
-0.2780867, -1.894146, -2.330261, 0, 0, 0, 1, 1,
-0.2770375, -1.603979, -2.472212, 1, 1, 1, 1, 1,
-0.2760769, -0.1009253, -1.427725, 1, 1, 1, 1, 1,
-0.274858, 0.6120232, 1.260085, 1, 1, 1, 1, 1,
-0.2682774, 1.369641, -0.1104759, 1, 1, 1, 1, 1,
-0.2673143, 1.169474, -0.6972283, 1, 1, 1, 1, 1,
-0.2630425, -0.3030391, -2.307253, 1, 1, 1, 1, 1,
-0.2574885, -0.3228766, -1.010406, 1, 1, 1, 1, 1,
-0.2546384, 1.345179, -0.8463135, 1, 1, 1, 1, 1,
-0.2475642, -0.4230993, -3.668474, 1, 1, 1, 1, 1,
-0.246991, 2.631787, 1.116395, 1, 1, 1, 1, 1,
-0.2417711, 0.2874368, -0.02629274, 1, 1, 1, 1, 1,
-0.2358053, -0.1358963, -3.400206, 1, 1, 1, 1, 1,
-0.2296257, -0.2685845, -2.162095, 1, 1, 1, 1, 1,
-0.2231481, -1.412638, -1.359661, 1, 1, 1, 1, 1,
-0.2222717, -1.134488, -3.492113, 1, 1, 1, 1, 1,
-0.2192482, 0.1024229, -1.264947, 0, 0, 1, 1, 1,
-0.212197, -0.7830607, -3.255313, 1, 0, 0, 1, 1,
-0.2072096, 0.3686488, -2.310546, 1, 0, 0, 1, 1,
-0.2064252, 0.5560159, -0.5033573, 1, 0, 0, 1, 1,
-0.2043225, 1.169254, 0.0151153, 1, 0, 0, 1, 1,
-0.2040903, -1.39883, -2.883254, 1, 0, 0, 1, 1,
-0.1994569, -0.9116605, -1.691291, 0, 0, 0, 1, 1,
-0.1976853, -0.3653136, -3.449575, 0, 0, 0, 1, 1,
-0.195421, -1.006455, -4.284063, 0, 0, 0, 1, 1,
-0.1899658, 1.840722, -0.121132, 0, 0, 0, 1, 1,
-0.1887263, -1.044866, -4.03304, 0, 0, 0, 1, 1,
-0.1882237, 0.101471, -0.1671387, 0, 0, 0, 1, 1,
-0.1858949, 0.5064886, -0.1094331, 0, 0, 0, 1, 1,
-0.1843501, 1.641289, 0.3165349, 1, 1, 1, 1, 1,
-0.1805694, -0.7164248, -4.762882, 1, 1, 1, 1, 1,
-0.1759689, -0.7063554, -1.032331, 1, 1, 1, 1, 1,
-0.1751128, -0.4028095, -1.540701, 1, 1, 1, 1, 1,
-0.1657418, -0.1508852, -1.592467, 1, 1, 1, 1, 1,
-0.1657079, 0.003251249, -1.106868, 1, 1, 1, 1, 1,
-0.1640829, -1.374468, -2.601034, 1, 1, 1, 1, 1,
-0.1576844, 0.673632, -0.2240278, 1, 1, 1, 1, 1,
-0.1538966, 0.7828524, -0.03171214, 1, 1, 1, 1, 1,
-0.1501281, -0.3880912, -4.165246, 1, 1, 1, 1, 1,
-0.1477911, 0.2239506, -1.4163, 1, 1, 1, 1, 1,
-0.1467448, -1.247143, -2.800479, 1, 1, 1, 1, 1,
-0.1458382, 0.9063694, 1.468756, 1, 1, 1, 1, 1,
-0.1454263, -1.292856, -2.2743, 1, 1, 1, 1, 1,
-0.1450863, 1.318123, -0.6559505, 1, 1, 1, 1, 1,
-0.1394013, 0.7675288, -0.08792639, 0, 0, 1, 1, 1,
-0.1364548, -0.2508233, -0.7939039, 1, 0, 0, 1, 1,
-0.1339606, -0.8781205, -2.630237, 1, 0, 0, 1, 1,
-0.1336349, 0.04241772, -0.8342055, 1, 0, 0, 1, 1,
-0.1333855, -0.1728554, -1.7479, 1, 0, 0, 1, 1,
-0.1294796, -0.9005986, -2.316166, 1, 0, 0, 1, 1,
-0.1286275, -0.255484, -2.594038, 0, 0, 0, 1, 1,
-0.1277784, 0.6043124, -1.238691, 0, 0, 0, 1, 1,
-0.1274444, 1.519316, 0.2656207, 0, 0, 0, 1, 1,
-0.1261598, 0.9502093, -0.3701199, 0, 0, 0, 1, 1,
-0.1249958, -0.7519919, -1.909212, 0, 0, 0, 1, 1,
-0.124828, 0.44353, -1.348137, 0, 0, 0, 1, 1,
-0.1242536, 0.5810345, 0.2373077, 0, 0, 0, 1, 1,
-0.1226964, -0.2545037, -0.3934918, 1, 1, 1, 1, 1,
-0.1225529, -0.5447373, -3.486757, 1, 1, 1, 1, 1,
-0.1173261, 0.2800897, -0.07043887, 1, 1, 1, 1, 1,
-0.1161317, -1.449293, -3.389882, 1, 1, 1, 1, 1,
-0.113126, -0.6239272, -4.825831, 1, 1, 1, 1, 1,
-0.1121567, -0.2209538, -2.885086, 1, 1, 1, 1, 1,
-0.1085655, -0.5377038, -4.648247, 1, 1, 1, 1, 1,
-0.1085553, 1.053065, 0.419101, 1, 1, 1, 1, 1,
-0.1028725, -1.677813, -2.855571, 1, 1, 1, 1, 1,
-0.1023023, -1.114406, -4.500555, 1, 1, 1, 1, 1,
-0.1004664, 0.05750713, -2.563622, 1, 1, 1, 1, 1,
-0.1001959, 2.154046, -0.7376904, 1, 1, 1, 1, 1,
-0.1000955, -0.03788756, -0.9345186, 1, 1, 1, 1, 1,
-0.08277766, 0.778384, -0.739118, 1, 1, 1, 1, 1,
-0.08127359, 0.4252123, 0.02952494, 1, 1, 1, 1, 1,
-0.07792268, 1.914191, -0.4034736, 0, 0, 1, 1, 1,
-0.07442522, -0.2778838, -1.752598, 1, 0, 0, 1, 1,
-0.07324618, -0.03381959, -1.896238, 1, 0, 0, 1, 1,
-0.07068334, 0.4620578, 1.157551, 1, 0, 0, 1, 1,
-0.06934159, -0.5097507, -2.911022, 1, 0, 0, 1, 1,
-0.06817977, 0.4983191, 0.7637385, 1, 0, 0, 1, 1,
-0.06798253, 1.104652, 0.6821429, 0, 0, 0, 1, 1,
-0.06746576, 0.4507776, 0.05464541, 0, 0, 0, 1, 1,
-0.06704064, 0.6326513, -0.1642223, 0, 0, 0, 1, 1,
-0.06693887, 1.654308, -0.6515387, 0, 0, 0, 1, 1,
-0.06630862, 2.515749, -1.41218, 0, 0, 0, 1, 1,
-0.06382717, 0.7167845, -0.06139215, 0, 0, 0, 1, 1,
-0.06211201, 0.7869192, 0.637693, 0, 0, 0, 1, 1,
-0.05631674, -1.64074, -2.649269, 1, 1, 1, 1, 1,
-0.05587905, 0.06010608, -0.027839, 1, 1, 1, 1, 1,
-0.05505021, -0.5439295, -4.498156, 1, 1, 1, 1, 1,
-0.04952575, 1.025771, -0.7429876, 1, 1, 1, 1, 1,
-0.03872322, 0.8756058, 0.057754, 1, 1, 1, 1, 1,
-0.02565901, -0.8559228, -3.053208, 1, 1, 1, 1, 1,
-0.02325819, 0.3769757, 0.1941115, 1, 1, 1, 1, 1,
-0.02315704, -0.3447076, -1.807034, 1, 1, 1, 1, 1,
-0.01040141, -0.5074081, -2.831311, 1, 1, 1, 1, 1,
-0.007320445, 1.283903, -1.035198, 1, 1, 1, 1, 1,
-0.004584537, 2.114129, -0.4871482, 1, 1, 1, 1, 1,
0.006371304, -1.541793, 3.400331, 1, 1, 1, 1, 1,
0.00686309, -0.6414644, 2.034244, 1, 1, 1, 1, 1,
0.008063669, 0.8122698, 0.9419844, 1, 1, 1, 1, 1,
0.008991315, -0.3236969, 3.137355, 1, 1, 1, 1, 1,
0.009364468, 1.777824, -1.618361, 0, 0, 1, 1, 1,
0.009556621, 0.4289829, -0.7840938, 1, 0, 0, 1, 1,
0.01133241, 0.4442242, 0.09976055, 1, 0, 0, 1, 1,
0.01288795, -0.3905017, 4.283206, 1, 0, 0, 1, 1,
0.01659585, -0.08300908, 2.227429, 1, 0, 0, 1, 1,
0.01726221, -0.1523847, 2.476896, 1, 0, 0, 1, 1,
0.02079376, 0.6058285, 0.1122743, 0, 0, 0, 1, 1,
0.02222659, -0.9249535, 3.335469, 0, 0, 0, 1, 1,
0.02554651, -0.5033562, 3.708521, 0, 0, 0, 1, 1,
0.02583852, 0.608908, 1.197438, 0, 0, 0, 1, 1,
0.02647915, -1.146961, 2.886005, 0, 0, 0, 1, 1,
0.02687906, -0.01757503, 0.7336249, 0, 0, 0, 1, 1,
0.03266988, 0.8972976, -0.01480797, 0, 0, 0, 1, 1,
0.04704143, 0.7385374, -0.9364636, 1, 1, 1, 1, 1,
0.04829547, -0.7858713, 3.719394, 1, 1, 1, 1, 1,
0.04954229, -0.7332579, 0.305118, 1, 1, 1, 1, 1,
0.06313827, -0.213214, 2.9552, 1, 1, 1, 1, 1,
0.06511398, -1.291656, 4.477197, 1, 1, 1, 1, 1,
0.06693258, 1.062725, 0.3498045, 1, 1, 1, 1, 1,
0.07388508, -0.6981058, 4.408809, 1, 1, 1, 1, 1,
0.0764209, 0.7476583, 1.053928, 1, 1, 1, 1, 1,
0.07676536, 0.7731333, 0.9233704, 1, 1, 1, 1, 1,
0.07835572, -1.840269, 1.903282, 1, 1, 1, 1, 1,
0.07990529, 1.715507, -1.304161, 1, 1, 1, 1, 1,
0.09335697, 1.597221, -1.051345, 1, 1, 1, 1, 1,
0.09476127, 0.6484955, -0.6647077, 1, 1, 1, 1, 1,
0.09508072, -1.106122, 1.57493, 1, 1, 1, 1, 1,
0.0961709, 0.3108334, 1.481837, 1, 1, 1, 1, 1,
0.1074738, -0.9586552, 2.309101, 0, 0, 1, 1, 1,
0.1081739, -2.575206, 3.645971, 1, 0, 0, 1, 1,
0.1097754, 0.1539052, -1.195577, 1, 0, 0, 1, 1,
0.1148746, -1.099644, 5.374354, 1, 0, 0, 1, 1,
0.1171528, -0.534479, 2.932506, 1, 0, 0, 1, 1,
0.1176042, -0.2558952, 2.348902, 1, 0, 0, 1, 1,
0.1261695, -0.9727228, 3.861891, 0, 0, 0, 1, 1,
0.127055, -0.6820586, 4.277872, 0, 0, 0, 1, 1,
0.1273715, -0.002085043, 2.250384, 0, 0, 0, 1, 1,
0.1281877, 1.348402, -0.06347813, 0, 0, 0, 1, 1,
0.1284235, 0.447556, -0.06805006, 0, 0, 0, 1, 1,
0.1357652, 0.8416585, 1.355049, 0, 0, 0, 1, 1,
0.1368038, 1.031523, 2.333877, 0, 0, 0, 1, 1,
0.1375978, -0.6892602, 3.701818, 1, 1, 1, 1, 1,
0.1389059, -0.9430569, 3.1923, 1, 1, 1, 1, 1,
0.1391538, 0.02535158, 1.568746, 1, 1, 1, 1, 1,
0.1399852, -1.362465, 3.122267, 1, 1, 1, 1, 1,
0.1401562, -0.650753, 2.132745, 1, 1, 1, 1, 1,
0.1405252, -1.465071, 2.487711, 1, 1, 1, 1, 1,
0.1421097, 0.6055705, -0.5633282, 1, 1, 1, 1, 1,
0.1434948, -0.3429075, 3.142986, 1, 1, 1, 1, 1,
0.1437282, 0.02645433, 2.67499, 1, 1, 1, 1, 1,
0.1444597, 1.213061, -0.2079648, 1, 1, 1, 1, 1,
0.1449001, 1.646987, -0.1732842, 1, 1, 1, 1, 1,
0.1453805, 0.599678, 0.9775339, 1, 1, 1, 1, 1,
0.1457599, -0.2684196, 2.180401, 1, 1, 1, 1, 1,
0.1459412, 0.5218476, 1.10246, 1, 1, 1, 1, 1,
0.1512227, -0.3307095, 2.694288, 1, 1, 1, 1, 1,
0.1530956, 2.031833, -0.9432415, 0, 0, 1, 1, 1,
0.1537821, -0.8756812, 2.439357, 1, 0, 0, 1, 1,
0.1567665, -1.005137, 3.640565, 1, 0, 0, 1, 1,
0.1578491, -0.7044439, 2.019898, 1, 0, 0, 1, 1,
0.1596861, 0.5104567, 0.07423364, 1, 0, 0, 1, 1,
0.16084, -0.08212193, 1.712272, 1, 0, 0, 1, 1,
0.1710393, -1.385902, 4.539255, 0, 0, 0, 1, 1,
0.1718791, -0.05659978, 1.072928, 0, 0, 0, 1, 1,
0.173205, 1.096667, 0.8617246, 0, 0, 0, 1, 1,
0.1740188, -0.8534251, 2.873966, 0, 0, 0, 1, 1,
0.1746598, -0.2575078, 2.104117, 0, 0, 0, 1, 1,
0.1753848, -0.2372494, 2.583281, 0, 0, 0, 1, 1,
0.1779494, 0.306821, 1.939936, 0, 0, 0, 1, 1,
0.1783182, -0.2173603, 0.274708, 1, 1, 1, 1, 1,
0.1829855, 0.5599265, -0.407165, 1, 1, 1, 1, 1,
0.1862629, 1.230632, -1.015836, 1, 1, 1, 1, 1,
0.1891295, 1.568427, 1.172526, 1, 1, 1, 1, 1,
0.1891945, -1.166789, 3.223249, 1, 1, 1, 1, 1,
0.189879, 0.09456732, 1.478852, 1, 1, 1, 1, 1,
0.1909066, -2.419588, 1.57684, 1, 1, 1, 1, 1,
0.1943906, 0.1363842, 1.025861, 1, 1, 1, 1, 1,
0.195171, 0.007759777, 0.4606151, 1, 1, 1, 1, 1,
0.2045246, -0.5155098, 2.086222, 1, 1, 1, 1, 1,
0.2102727, 2.279518, 0.08385018, 1, 1, 1, 1, 1,
0.2133209, 0.7440653, 1.55829, 1, 1, 1, 1, 1,
0.2177024, -0.8416417, 3.540673, 1, 1, 1, 1, 1,
0.2221621, -0.002982931, 2.456139, 1, 1, 1, 1, 1,
0.2254552, -1.225508, 3.021307, 1, 1, 1, 1, 1,
0.2255132, 1.517021, -0.08011632, 0, 0, 1, 1, 1,
0.2286963, -0.8846909, 4.395247, 1, 0, 0, 1, 1,
0.2311614, -1.369741, 2.241205, 1, 0, 0, 1, 1,
0.2311629, -0.5718677, 0.8911313, 1, 0, 0, 1, 1,
0.2316609, 0.06720319, 1.329144, 1, 0, 0, 1, 1,
0.2325652, -0.8856922, 1.508008, 1, 0, 0, 1, 1,
0.2352817, -1.010337, 3.145099, 0, 0, 0, 1, 1,
0.2391569, 1.570996, 1.069882, 0, 0, 0, 1, 1,
0.2414739, 0.3305947, 2.085395, 0, 0, 0, 1, 1,
0.2435086, 1.002249, -0.9344841, 0, 0, 0, 1, 1,
0.2444614, 0.3738333, -0.02976242, 0, 0, 0, 1, 1,
0.2446116, 0.2189474, 0.6099387, 0, 0, 0, 1, 1,
0.2503034, -0.04849498, 0.6645201, 0, 0, 0, 1, 1,
0.2533869, 1.784069, -0.2165734, 1, 1, 1, 1, 1,
0.2558709, -0.9668852, 2.46478, 1, 1, 1, 1, 1,
0.2625697, -0.3343647, 3.492633, 1, 1, 1, 1, 1,
0.2632255, 1.28922, -0.4349794, 1, 1, 1, 1, 1,
0.2680876, -0.2069, 2.732557, 1, 1, 1, 1, 1,
0.2773032, 0.3815326, -0.1865308, 1, 1, 1, 1, 1,
0.281365, 1.078936, 1.275766, 1, 1, 1, 1, 1,
0.2858176, -0.3347407, 2.810487, 1, 1, 1, 1, 1,
0.2896265, -0.2643181, 1.95667, 1, 1, 1, 1, 1,
0.2943559, -1.924008, 2.958894, 1, 1, 1, 1, 1,
0.2952216, -1.19875, 2.953502, 1, 1, 1, 1, 1,
0.2982801, -0.5663174, 4.683348, 1, 1, 1, 1, 1,
0.2992555, 1.417833, 1.156649, 1, 1, 1, 1, 1,
0.2999123, 1.445681, -0.2925973, 1, 1, 1, 1, 1,
0.3211498, -1.915799, 3.688462, 1, 1, 1, 1, 1,
0.32238, -0.03253229, 1.27406, 0, 0, 1, 1, 1,
0.3284519, 0.8406347, -0.5897536, 1, 0, 0, 1, 1,
0.332253, 0.219638, 0.8960668, 1, 0, 0, 1, 1,
0.3351487, -0.1454783, 0.5095347, 1, 0, 0, 1, 1,
0.3360818, -0.4010281, 2.572499, 1, 0, 0, 1, 1,
0.3362286, 1.395717, -1.795242, 1, 0, 0, 1, 1,
0.3385426, 0.2735569, 1.503504, 0, 0, 0, 1, 1,
0.3394161, 0.1086415, 0.1947663, 0, 0, 0, 1, 1,
0.3425761, 1.771526, -1.618471, 0, 0, 0, 1, 1,
0.3456806, 0.05420383, 1.053259, 0, 0, 0, 1, 1,
0.3468079, 0.1608291, 1.025663, 0, 0, 0, 1, 1,
0.3533863, -0.1276302, 2.419042, 0, 0, 0, 1, 1,
0.3579072, -1.971405, 3.738391, 0, 0, 0, 1, 1,
0.3590044, 0.3635765, 2.475009, 1, 1, 1, 1, 1,
0.3595779, 0.4938883, 1.094836, 1, 1, 1, 1, 1,
0.3637015, 2.204125, -1.11917, 1, 1, 1, 1, 1,
0.3697286, 1.628403, -0.03144138, 1, 1, 1, 1, 1,
0.3699342, -0.3457839, 3.47057, 1, 1, 1, 1, 1,
0.3781786, -0.08013614, 3.197354, 1, 1, 1, 1, 1,
0.379329, -1.133961, 4.782582, 1, 1, 1, 1, 1,
0.3797396, 0.05720181, 0.3888923, 1, 1, 1, 1, 1,
0.3798395, -0.2696439, 2.306372, 1, 1, 1, 1, 1,
0.3805347, 1.03693, 2.197365, 1, 1, 1, 1, 1,
0.3858164, -0.3024479, 3.684119, 1, 1, 1, 1, 1,
0.3941862, 1.640648, -0.007796281, 1, 1, 1, 1, 1,
0.3962446, -0.6506146, 0.8583326, 1, 1, 1, 1, 1,
0.3983426, 0.1585962, 1.395584, 1, 1, 1, 1, 1,
0.400615, 0.3851753, 0.1853858, 1, 1, 1, 1, 1,
0.4029005, 0.154802, 3.138116, 0, 0, 1, 1, 1,
0.4043406, -0.9714912, 2.290956, 1, 0, 0, 1, 1,
0.4070997, -0.5820816, 4.493282, 1, 0, 0, 1, 1,
0.408839, -1.396029, 3.220885, 1, 0, 0, 1, 1,
0.4154261, 0.4920415, 1.397147, 1, 0, 0, 1, 1,
0.4181615, 1.418764, -1.028945, 1, 0, 0, 1, 1,
0.4206941, 0.3539548, 1.008414, 0, 0, 0, 1, 1,
0.4206998, -0.3304947, 1.526076, 0, 0, 0, 1, 1,
0.4213843, 0.5652424, -1.719971, 0, 0, 0, 1, 1,
0.4278478, 0.7410213, 0.2199501, 0, 0, 0, 1, 1,
0.430414, -0.02614829, 0.9895833, 0, 0, 0, 1, 1,
0.438637, 1.155872, 0.3671673, 0, 0, 0, 1, 1,
0.4407026, -0.8481981, 2.598642, 0, 0, 0, 1, 1,
0.4443536, -0.465708, 2.119115, 1, 1, 1, 1, 1,
0.4474571, -0.3130267, 2.522527, 1, 1, 1, 1, 1,
0.449764, 0.5750294, 1.101872, 1, 1, 1, 1, 1,
0.4548846, 0.5666784, 1.734005, 1, 1, 1, 1, 1,
0.4584524, 0.2613424, 1.640455, 1, 1, 1, 1, 1,
0.4599198, 1.65973, 0.1462429, 1, 1, 1, 1, 1,
0.4628572, -0.07381988, 2.022014, 1, 1, 1, 1, 1,
0.4650837, 0.5746674, 0.5357692, 1, 1, 1, 1, 1,
0.4667237, 0.2060954, 2.006344, 1, 1, 1, 1, 1,
0.4746809, 0.2273344, 1.666544, 1, 1, 1, 1, 1,
0.4748156, -0.5744514, 2.238357, 1, 1, 1, 1, 1,
0.4766624, -0.0338928, 1.343746, 1, 1, 1, 1, 1,
0.4837759, -0.3947821, 2.626909, 1, 1, 1, 1, 1,
0.4860494, 0.4646461, 2.444481, 1, 1, 1, 1, 1,
0.4862358, -0.893243, 1.755106, 1, 1, 1, 1, 1,
0.4863088, 0.5400648, 0.9835101, 0, 0, 1, 1, 1,
0.4895387, -0.8074461, 3.413736, 1, 0, 0, 1, 1,
0.493033, -0.6761209, 5.105021, 1, 0, 0, 1, 1,
0.4931789, 0.7085977, 1.568314, 1, 0, 0, 1, 1,
0.4941077, 1.368119, 0.2011492, 1, 0, 0, 1, 1,
0.4941124, 1.250588, -0.6771545, 1, 0, 0, 1, 1,
0.4970029, -1.455708, 1.605748, 0, 0, 0, 1, 1,
0.5032814, 0.02662222, 2.844074, 0, 0, 0, 1, 1,
0.5042868, 1.250386, 1.053416, 0, 0, 0, 1, 1,
0.5059474, 1.028861, -0.01851156, 0, 0, 0, 1, 1,
0.5069634, -0.4274984, 4.333629, 0, 0, 0, 1, 1,
0.5075819, 0.09574436, -0.06996438, 0, 0, 0, 1, 1,
0.5086805, 0.9955426, -0.05313781, 0, 0, 0, 1, 1,
0.5106936, 0.08597422, 2.616142, 1, 1, 1, 1, 1,
0.5139127, 0.2886263, 1.219979, 1, 1, 1, 1, 1,
0.5194653, -0.3248093, 1.652289, 1, 1, 1, 1, 1,
0.5235818, -1.096029, 4.896914, 1, 1, 1, 1, 1,
0.524098, 0.5964164, -0.06272952, 1, 1, 1, 1, 1,
0.5272734, 0.1751738, 1.771165, 1, 1, 1, 1, 1,
0.5304914, 0.7299367, -0.06167787, 1, 1, 1, 1, 1,
0.5310704, 1.241399, 1.170943, 1, 1, 1, 1, 1,
0.5332537, 0.6677121, -1.307802, 1, 1, 1, 1, 1,
0.5352287, -0.1742185, 2.025691, 1, 1, 1, 1, 1,
0.537675, 0.8809228, -0.7195163, 1, 1, 1, 1, 1,
0.5399728, -0.2408697, 1.598631, 1, 1, 1, 1, 1,
0.5406936, 0.1045001, 0.4031804, 1, 1, 1, 1, 1,
0.5410312, -0.4617949, 1.72511, 1, 1, 1, 1, 1,
0.5420096, -0.2928212, 2.627732, 1, 1, 1, 1, 1,
0.542497, -0.01215539, 2.256259, 0, 0, 1, 1, 1,
0.5459158, 0.02015042, 1.193869, 1, 0, 0, 1, 1,
0.5461437, 0.8161529, 0.2145289, 1, 0, 0, 1, 1,
0.5462623, -1.029358, 2.394769, 1, 0, 0, 1, 1,
0.548, 0.4369532, 1.294266, 1, 0, 0, 1, 1,
0.5480607, 0.6093798, -0.05861554, 1, 0, 0, 1, 1,
0.5494898, -0.8874186, 3.070972, 0, 0, 0, 1, 1,
0.5503334, 2.399233, -0.6124238, 0, 0, 0, 1, 1,
0.5504447, -0.06750502, 1.744165, 0, 0, 0, 1, 1,
0.5527584, -0.4956402, 3.054336, 0, 0, 0, 1, 1,
0.5541018, -0.5314348, 4.356664, 0, 0, 0, 1, 1,
0.5568106, 0.4866409, 0.9241251, 0, 0, 0, 1, 1,
0.5568861, -0.4107463, 2.258763, 0, 0, 0, 1, 1,
0.5576807, 0.8661771, -0.006644418, 1, 1, 1, 1, 1,
0.5594679, -0.3699201, 0.7183645, 1, 1, 1, 1, 1,
0.5631732, -1.29276, 2.864827, 1, 1, 1, 1, 1,
0.5662997, -0.1954918, 3.344093, 1, 1, 1, 1, 1,
0.5781992, 0.2861726, 0.7806776, 1, 1, 1, 1, 1,
0.5848452, -1.599899, 3.645291, 1, 1, 1, 1, 1,
0.5849972, 0.8812301, -1.157911, 1, 1, 1, 1, 1,
0.5853095, 1.781949, -0.3898418, 1, 1, 1, 1, 1,
0.5863587, -1.111337, 2.595046, 1, 1, 1, 1, 1,
0.5872902, 1.451083, 0.6868607, 1, 1, 1, 1, 1,
0.5894272, -0.3119115, 3.210287, 1, 1, 1, 1, 1,
0.5947062, 1.30543, 2.388715, 1, 1, 1, 1, 1,
0.5972688, 0.6245119, 0.8813286, 1, 1, 1, 1, 1,
0.5990561, 0.8964025, 1.11037, 1, 1, 1, 1, 1,
0.6074098, 0.9995708, 1.453141, 1, 1, 1, 1, 1,
0.6091127, -1.220213, 2.152699, 0, 0, 1, 1, 1,
0.6100297, 0.5543228, -0.5087476, 1, 0, 0, 1, 1,
0.6110333, -0.8630518, 2.616888, 1, 0, 0, 1, 1,
0.6112602, 0.5332156, 0.6081885, 1, 0, 0, 1, 1,
0.6115307, -1.719184, 2.806262, 1, 0, 0, 1, 1,
0.6141319, -1.719814, 2.969563, 1, 0, 0, 1, 1,
0.6144397, 0.7173231, 0.1247486, 0, 0, 0, 1, 1,
0.6251189, -0.9938909, 4.315104, 0, 0, 0, 1, 1,
0.6320367, 0.4682735, 1.547505, 0, 0, 0, 1, 1,
0.6404427, 0.2472513, 1.267763, 0, 0, 0, 1, 1,
0.6427067, 0.06597713, 1.915188, 0, 0, 0, 1, 1,
0.6437865, 0.6561306, 0.4012687, 0, 0, 0, 1, 1,
0.6438078, 1.234107, 1.060515, 0, 0, 0, 1, 1,
0.6460285, 0.2580297, 0.8650252, 1, 1, 1, 1, 1,
0.6475098, -0.3365862, 1.598032, 1, 1, 1, 1, 1,
0.6482865, 0.1621682, 1.427658, 1, 1, 1, 1, 1,
0.648632, -0.2990088, 3.426561, 1, 1, 1, 1, 1,
0.6608537, 0.04326844, 1.762842, 1, 1, 1, 1, 1,
0.6613952, -1.853487, 1.632842, 1, 1, 1, 1, 1,
0.6694626, 1.539732, -0.9791602, 1, 1, 1, 1, 1,
0.6695282, -0.3886269, 2.906407, 1, 1, 1, 1, 1,
0.6730149, -0.6166897, 3.243133, 1, 1, 1, 1, 1,
0.6773422, -0.7055205, 3.309975, 1, 1, 1, 1, 1,
0.6789413, 0.8387536, 1.937427, 1, 1, 1, 1, 1,
0.6851626, -0.6849138, 1.146006, 1, 1, 1, 1, 1,
0.6910154, -0.09301952, 3.354911, 1, 1, 1, 1, 1,
0.693841, 0.006183611, 0.2425303, 1, 1, 1, 1, 1,
0.6942721, -1.307459, 2.01279, 1, 1, 1, 1, 1,
0.6955451, -0.3783742, 1.818149, 0, 0, 1, 1, 1,
0.7164562, -0.5905001, 2.52263, 1, 0, 0, 1, 1,
0.718294, 1.19096, 0.3837941, 1, 0, 0, 1, 1,
0.7194756, 0.1635786, 1.549378, 1, 0, 0, 1, 1,
0.7237096, 0.7149308, -0.126692, 1, 0, 0, 1, 1,
0.7257082, -0.4560382, 3.902342, 1, 0, 0, 1, 1,
0.729656, 0.6863279, 0.09745774, 0, 0, 0, 1, 1,
0.7376367, -0.4737406, 2.440576, 0, 0, 0, 1, 1,
0.7390882, -1.305819, 2.712072, 0, 0, 0, 1, 1,
0.751389, -0.8936275, 3.29672, 0, 0, 0, 1, 1,
0.7548212, 0.3316133, 1.765903, 0, 0, 0, 1, 1,
0.7594304, -1.046535, 2.563893, 0, 0, 0, 1, 1,
0.7633745, -0.483054, 1.508453, 0, 0, 0, 1, 1,
0.7668373, 1.302362, 1.772923, 1, 1, 1, 1, 1,
0.7754825, 0.885516, 1.667829, 1, 1, 1, 1, 1,
0.7769164, -1.033127, 1.110018, 1, 1, 1, 1, 1,
0.7777936, 3.415034, -0.9317437, 1, 1, 1, 1, 1,
0.7782601, -0.1219903, 1.276427, 1, 1, 1, 1, 1,
0.7793667, 1.368406, -0.3473917, 1, 1, 1, 1, 1,
0.7815716, -0.1390411, 2.669781, 1, 1, 1, 1, 1,
0.7829214, -0.1177086, 1.773961, 1, 1, 1, 1, 1,
0.7856771, -0.9699367, 3.818974, 1, 1, 1, 1, 1,
0.7903367, -2.0072, 1.718549, 1, 1, 1, 1, 1,
0.7904398, 0.1199631, 1.498864, 1, 1, 1, 1, 1,
0.7914381, 0.5988331, -0.177728, 1, 1, 1, 1, 1,
0.7918019, -0.2542156, 2.319519, 1, 1, 1, 1, 1,
0.7939661, 1.591903, -0.8954372, 1, 1, 1, 1, 1,
0.7973687, 1.069446, 0.1417549, 1, 1, 1, 1, 1,
0.7995762, -1.014482, 2.726916, 0, 0, 1, 1, 1,
0.8007463, -1.10587, 2.512421, 1, 0, 0, 1, 1,
0.8030007, 1.900884, 1.442726, 1, 0, 0, 1, 1,
0.8109134, -1.242851, 2.589561, 1, 0, 0, 1, 1,
0.8154185, -0.4814982, 1.029578, 1, 0, 0, 1, 1,
0.8163607, -0.6029934, 1.906341, 1, 0, 0, 1, 1,
0.8236771, -0.04532042, 0.7463639, 0, 0, 0, 1, 1,
0.8317652, -1.461446, 2.101893, 0, 0, 0, 1, 1,
0.8411427, -1.260643, 3.665155, 0, 0, 0, 1, 1,
0.843151, -1.965149, 1.39589, 0, 0, 0, 1, 1,
0.8472818, 0.3160898, -0.2081077, 0, 0, 0, 1, 1,
0.8488785, 0.3126968, 1.526203, 0, 0, 0, 1, 1,
0.8499911, -0.4208058, 3.060938, 0, 0, 0, 1, 1,
0.8546834, 0.5162196, 1.467431, 1, 1, 1, 1, 1,
0.8616464, 1.957492, 0.2465047, 1, 1, 1, 1, 1,
0.8642904, -0.4359823, 1.742638, 1, 1, 1, 1, 1,
0.8920507, -1.098307, 1.57318, 1, 1, 1, 1, 1,
0.8961195, -0.4704762, 1.915478, 1, 1, 1, 1, 1,
0.8964469, -1.014204, 1.49935, 1, 1, 1, 1, 1,
0.9020899, 0.6745226, -0.1924878, 1, 1, 1, 1, 1,
0.9025903, 0.2804861, 1.215057, 1, 1, 1, 1, 1,
0.903699, -0.6633524, 2.302244, 1, 1, 1, 1, 1,
0.9044923, -2.040817, 2.940446, 1, 1, 1, 1, 1,
0.9138119, -0.2255466, 2.006086, 1, 1, 1, 1, 1,
0.9139027, -0.4004139, 1.898717, 1, 1, 1, 1, 1,
0.9144252, -1.20506, 3.558516, 1, 1, 1, 1, 1,
0.9145091, -2.270816, 1.197036, 1, 1, 1, 1, 1,
0.9166806, -0.5428443, -0.07518197, 1, 1, 1, 1, 1,
0.9241528, -0.7855495, 3.09129, 0, 0, 1, 1, 1,
0.9307929, -0.552361, 0.8244454, 1, 0, 0, 1, 1,
0.9322773, 0.5533867, 1.855106, 1, 0, 0, 1, 1,
0.9353641, -0.6329295, 1.705808, 1, 0, 0, 1, 1,
0.9414067, -1.948555, 3.256156, 1, 0, 0, 1, 1,
0.9420258, -0.6659923, 2.815799, 1, 0, 0, 1, 1,
0.9454336, -0.04797888, 1.019274, 0, 0, 0, 1, 1,
0.9493446, -0.3835481, 0.7603189, 0, 0, 0, 1, 1,
0.9515162, 0.679466, 2.215054, 0, 0, 0, 1, 1,
0.954787, -0.2783152, 2.636658, 0, 0, 0, 1, 1,
0.9574835, -0.1512576, 1.726536, 0, 0, 0, 1, 1,
0.9686888, 1.155563, 0.8293888, 0, 0, 0, 1, 1,
0.9698694, 2.165048, 0.9293385, 0, 0, 0, 1, 1,
0.9751757, 0.5616077, 1.570204, 1, 1, 1, 1, 1,
0.9764369, 1.171916, -0.5590427, 1, 1, 1, 1, 1,
0.9785311, -0.3391289, 2.479989, 1, 1, 1, 1, 1,
0.9848312, 1.058535, -1.051758, 1, 1, 1, 1, 1,
0.9922578, 0.004758089, 1.103961, 1, 1, 1, 1, 1,
0.9970201, -0.6495893, 2.791275, 1, 1, 1, 1, 1,
0.9999302, 0.3359081, 1.071442, 1, 1, 1, 1, 1,
1.005462, -0.2798862, 0.157083, 1, 1, 1, 1, 1,
1.011095, -0.9887273, 2.859944, 1, 1, 1, 1, 1,
1.012653, -0.9287237, 2.924856, 1, 1, 1, 1, 1,
1.015333, 0.3758735, 3.543408, 1, 1, 1, 1, 1,
1.01833, 0.9015421, 0.6321848, 1, 1, 1, 1, 1,
1.01974, -0.09525089, 2.830846, 1, 1, 1, 1, 1,
1.023921, 0.2994139, 1.149747, 1, 1, 1, 1, 1,
1.027372, 1.062641, 0.6546234, 1, 1, 1, 1, 1,
1.029354, -0.2065502, 2.25396, 0, 0, 1, 1, 1,
1.03239, 0.4481457, 2.450531, 1, 0, 0, 1, 1,
1.038206, 1.096938, -0.3038005, 1, 0, 0, 1, 1,
1.039867, 0.2631884, 1.820683, 1, 0, 0, 1, 1,
1.040438, -0.0881958, 1.406538, 1, 0, 0, 1, 1,
1.043718, -1.964109, 3.799105, 1, 0, 0, 1, 1,
1.043846, -0.2688982, 2.620266, 0, 0, 0, 1, 1,
1.047243, -0.6941087, 1.64858, 0, 0, 0, 1, 1,
1.049269, -1.369557, 2.117483, 0, 0, 0, 1, 1,
1.050244, 1.062735, 1.469605, 0, 0, 0, 1, 1,
1.052464, 0.9873419, 1.339862, 0, 0, 0, 1, 1,
1.0534, 0.6845393, 1.022163, 0, 0, 0, 1, 1,
1.063651, -1.550586, 2.743294, 0, 0, 0, 1, 1,
1.067837, 0.3777461, 0.9783878, 1, 1, 1, 1, 1,
1.071475, 0.6589345, 1.163635, 1, 1, 1, 1, 1,
1.072791, 1.517869, 0.4037291, 1, 1, 1, 1, 1,
1.080689, -1.443648, 1.911426, 1, 1, 1, 1, 1,
1.086281, 0.6513124, 1.394293, 1, 1, 1, 1, 1,
1.086925, -1.106425, 1.17753, 1, 1, 1, 1, 1,
1.089713, 0.8578994, 0.8799484, 1, 1, 1, 1, 1,
1.091454, -0.2563011, 3.305675, 1, 1, 1, 1, 1,
1.099357, -0.6957551, 1.201225, 1, 1, 1, 1, 1,
1.101916, -0.7158259, 0.8763457, 1, 1, 1, 1, 1,
1.102861, -0.6372826, 4.270409, 1, 1, 1, 1, 1,
1.110286, 0.139353, 0.5967423, 1, 1, 1, 1, 1,
1.111835, 1.00445, -1.422906, 1, 1, 1, 1, 1,
1.120885, -0.133942, 3.681318, 1, 1, 1, 1, 1,
1.124405, -0.4817539, 1.664484, 1, 1, 1, 1, 1,
1.128604, -0.6016316, 1.142778, 0, 0, 1, 1, 1,
1.132433, 0.5718604, 1.017646, 1, 0, 0, 1, 1,
1.138992, -0.4705513, 0.4873515, 1, 0, 0, 1, 1,
1.141009, 0.04290954, 2.436823, 1, 0, 0, 1, 1,
1.141947, 0.583135, 2.078746, 1, 0, 0, 1, 1,
1.142031, -1.145992, 2.756255, 1, 0, 0, 1, 1,
1.148379, -0.5358104, 0.7017673, 0, 0, 0, 1, 1,
1.154513, 0.903738, 2.527983, 0, 0, 0, 1, 1,
1.155719, 1.512487, 1.255877, 0, 0, 0, 1, 1,
1.159259, 0.9731338, -0.8358363, 0, 0, 0, 1, 1,
1.162057, 1.585111, 1.086614, 0, 0, 0, 1, 1,
1.164374, -1.321202, 2.063579, 0, 0, 0, 1, 1,
1.178001, -1.352106, -0.5219176, 0, 0, 0, 1, 1,
1.19223, -0.7544978, 2.469555, 1, 1, 1, 1, 1,
1.200368, 0.9370382, 0.6831714, 1, 1, 1, 1, 1,
1.205714, -3.968988, 1.115465, 1, 1, 1, 1, 1,
1.210089, -0.5628361, 1.78849, 1, 1, 1, 1, 1,
1.216092, 0.7669389, 0.5493287, 1, 1, 1, 1, 1,
1.224464, 1.591595, -0.7418283, 1, 1, 1, 1, 1,
1.233683, 0.02758087, 1.154278, 1, 1, 1, 1, 1,
1.233726, 0.9501711, 1.1867, 1, 1, 1, 1, 1,
1.234475, -0.03212737, 1.060897, 1, 1, 1, 1, 1,
1.241479, -0.354257, 2.482244, 1, 1, 1, 1, 1,
1.256251, 0.2227104, 0.235299, 1, 1, 1, 1, 1,
1.274718, -1.751381, 1.908023, 1, 1, 1, 1, 1,
1.275726, -0.1218556, 2.063024, 1, 1, 1, 1, 1,
1.279138, 0.7695629, 1.486134, 1, 1, 1, 1, 1,
1.282707, 0.5942604, 0.4604521, 1, 1, 1, 1, 1,
1.294132, 0.1496249, 0.1083549, 0, 0, 1, 1, 1,
1.299246, 0.05242769, 1.74414, 1, 0, 0, 1, 1,
1.300241, 0.3277839, 1.163477, 1, 0, 0, 1, 1,
1.30374, 1.611344, 1.954457, 1, 0, 0, 1, 1,
1.306389, -1.566286, 1.401111, 1, 0, 0, 1, 1,
1.319802, -1.038641, 0.8933678, 1, 0, 0, 1, 1,
1.324301, 0.3573017, 0.3697675, 0, 0, 0, 1, 1,
1.327707, -0.5997155, 1.121074, 0, 0, 0, 1, 1,
1.330606, -0.7977418, 2.745766, 0, 0, 0, 1, 1,
1.333617, -1.579785, 2.824583, 0, 0, 0, 1, 1,
1.334746, 0.07761561, 1.466334, 0, 0, 0, 1, 1,
1.335207, 0.2107846, 1.102051, 0, 0, 0, 1, 1,
1.335896, 0.9224359, -0.04311677, 0, 0, 0, 1, 1,
1.35907, -0.06598597, 1.530885, 1, 1, 1, 1, 1,
1.370975, 0.6429362, 1.246502, 1, 1, 1, 1, 1,
1.394553, 0.4458852, 1.481835, 1, 1, 1, 1, 1,
1.407295, -1.740241, 2.110123, 1, 1, 1, 1, 1,
1.416439, -0.07319906, 2.722025, 1, 1, 1, 1, 1,
1.418459, 2.294795, 0.8505248, 1, 1, 1, 1, 1,
1.423629, -0.6048278, 2.247973, 1, 1, 1, 1, 1,
1.431655, -1.519325, 3.742784, 1, 1, 1, 1, 1,
1.434543, 0.06720556, 3.109558, 1, 1, 1, 1, 1,
1.444806, -1.452077, 0.5687561, 1, 1, 1, 1, 1,
1.452818, 0.1163206, 2.104759, 1, 1, 1, 1, 1,
1.453609, 1.686335, 1.415139, 1, 1, 1, 1, 1,
1.46293, -0.5651661, 1.829206, 1, 1, 1, 1, 1,
1.464167, 0.3564009, -0.2589264, 1, 1, 1, 1, 1,
1.464731, 0.6750143, 1.174197, 1, 1, 1, 1, 1,
1.464742, 1.368028, 0.4806654, 0, 0, 1, 1, 1,
1.474288, -0.5400913, 1.061984, 1, 0, 0, 1, 1,
1.475924, 0.1956146, 2.115824, 1, 0, 0, 1, 1,
1.4761, -0.9857205, 0.4786215, 1, 0, 0, 1, 1,
1.47941, -0.9054368, 2.716555, 1, 0, 0, 1, 1,
1.48264, 0.7975203, 1.104027, 1, 0, 0, 1, 1,
1.483938, -0.1733951, 0.3089345, 0, 0, 0, 1, 1,
1.50039, -0.1121714, 2.045224, 0, 0, 0, 1, 1,
1.502845, -1.132682, 2.701522, 0, 0, 0, 1, 1,
1.506425, 0.8425776, 1.691723, 0, 0, 0, 1, 1,
1.506658, -1.811298, 1.321012, 0, 0, 0, 1, 1,
1.508535, -0.7028042, 1.122654, 0, 0, 0, 1, 1,
1.51557, -0.4247775, 0.1393023, 0, 0, 0, 1, 1,
1.517487, 0.3428999, 3.200083, 1, 1, 1, 1, 1,
1.521651, -0.06096125, 1.825073, 1, 1, 1, 1, 1,
1.523549, -0.213472, 3.176758, 1, 1, 1, 1, 1,
1.531645, -0.6770374, 2.731451, 1, 1, 1, 1, 1,
1.540015, 0.7179707, -0.3351646, 1, 1, 1, 1, 1,
1.545428, -0.07272504, 2.66625, 1, 1, 1, 1, 1,
1.549293, -0.881744, 2.90045, 1, 1, 1, 1, 1,
1.550166, -1.119318, 3.599907, 1, 1, 1, 1, 1,
1.554938, 1.094382, 0.6627641, 1, 1, 1, 1, 1,
1.557966, -0.9134759, 1.510929, 1, 1, 1, 1, 1,
1.559158, -1.345924, 1.763709, 1, 1, 1, 1, 1,
1.568796, 1.936237, -0.07041986, 1, 1, 1, 1, 1,
1.569534, 0.6751394, 1.837232, 1, 1, 1, 1, 1,
1.570955, -1.247989, 1.918459, 1, 1, 1, 1, 1,
1.57574, -0.3325807, 0.4303443, 1, 1, 1, 1, 1,
1.576347, 1.122385, 1.206207, 0, 0, 1, 1, 1,
1.580435, -0.7187554, 2.401997, 1, 0, 0, 1, 1,
1.596141, 1.96959, 0.211574, 1, 0, 0, 1, 1,
1.598119, -0.3724613, 1.485353, 1, 0, 0, 1, 1,
1.59857, 0.7700524, 1.123608, 1, 0, 0, 1, 1,
1.604943, 0.07689693, 2.197978, 1, 0, 0, 1, 1,
1.629564, 1.388308, 1.860197, 0, 0, 0, 1, 1,
1.647765, 0.5914518, 1.296759, 0, 0, 0, 1, 1,
1.652631, -1.134858, 2.965191, 0, 0, 0, 1, 1,
1.655256, 1.304133, 1.169775, 0, 0, 0, 1, 1,
1.662296, 0.4113064, -0.1846466, 0, 0, 0, 1, 1,
1.662521, 1.114189, 1.314085, 0, 0, 0, 1, 1,
1.687075, -0.3154468, 0.3232343, 0, 0, 0, 1, 1,
1.698387, 0.1504196, -0.1494643, 1, 1, 1, 1, 1,
1.737077, -0.2683254, 4.047064, 1, 1, 1, 1, 1,
1.741517, 0.6736625, 1.28595, 1, 1, 1, 1, 1,
1.745299, -0.6379793, 1.344792, 1, 1, 1, 1, 1,
1.745571, -0.9989036, 1.528201, 1, 1, 1, 1, 1,
1.751794, -0.8210693, 2.529217, 1, 1, 1, 1, 1,
1.770545, -0.6515067, 2.412375, 1, 1, 1, 1, 1,
1.77319, -0.7041699, 0.7118656, 1, 1, 1, 1, 1,
1.778617, -0.1753858, 0.8754853, 1, 1, 1, 1, 1,
1.793641, -0.1287583, -1.052011, 1, 1, 1, 1, 1,
1.806227, 0.7081029, 0.3587508, 1, 1, 1, 1, 1,
1.807269, -0.5457278, 1.397242, 1, 1, 1, 1, 1,
1.815518, -0.887543, 2.380693, 1, 1, 1, 1, 1,
1.850016, -0.5079861, 1.543241, 1, 1, 1, 1, 1,
1.868161, -0.197066, 2.767835, 1, 1, 1, 1, 1,
1.874443, -1.475335, 2.684153, 0, 0, 1, 1, 1,
1.87939, 0.5472552, 1.689337, 1, 0, 0, 1, 1,
1.882236, -0.9846237, 2.196775, 1, 0, 0, 1, 1,
1.897819, -0.5640285, 1.343825, 1, 0, 0, 1, 1,
1.901242, 1.253673, -0.2266078, 1, 0, 0, 1, 1,
1.905496, 0.5986643, 1.398191, 1, 0, 0, 1, 1,
1.956748, -0.06458408, 0.3089217, 0, 0, 0, 1, 1,
1.992104, 0.796507, 0.249871, 0, 0, 0, 1, 1,
2.002247, -0.622369, 0.7250664, 0, 0, 0, 1, 1,
2.093969, 0.4976424, 1.121581, 0, 0, 0, 1, 1,
2.141115, -0.4248478, 2.309816, 0, 0, 0, 1, 1,
2.222204, -0.8708305, 2.374415, 0, 0, 0, 1, 1,
2.244922, 0.3395378, 1.626057, 0, 0, 0, 1, 1,
2.315565, -1.33663, 3.301226, 1, 1, 1, 1, 1,
2.377137, 0.2496908, 1.301637, 1, 1, 1, 1, 1,
2.44576, 0.193252, 1.060535, 1, 1, 1, 1, 1,
2.632355, 0.1567632, 2.913934, 1, 1, 1, 1, 1,
2.825807, 0.02452701, 1.510689, 1, 1, 1, 1, 1,
2.889532, 0.709983, 0.9489542, 1, 1, 1, 1, 1,
2.982236, 0.4946944, 0.3544621, 1, 1, 1, 1, 1
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
var radius = 9.712727;
var distance = 34.11554;
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
mvMatrix.translate( 0.21119, 0.2769771, -0.1804273 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.11554);
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