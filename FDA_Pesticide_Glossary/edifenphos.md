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
-2.91007, -0.1503806, -0.8436126, 1, 0, 0, 1,
-2.832839, 0.1571179, -2.232924, 1, 0.007843138, 0, 1,
-2.755483, 0.2778615, -1.217854, 1, 0.01176471, 0, 1,
-2.557567, -2.604939, -2.032322, 1, 0.01960784, 0, 1,
-2.544287, -0.5132382, -2.995536, 1, 0.02352941, 0, 1,
-2.499599, 0.5313063, 0.8254914, 1, 0.03137255, 0, 1,
-2.40558, 1.224697, -0.6076773, 1, 0.03529412, 0, 1,
-2.40148, -1.162027, -1.776828, 1, 0.04313726, 0, 1,
-2.395823, 1.096268, -1.578636, 1, 0.04705882, 0, 1,
-2.322158, -0.8909637, -1.719429, 1, 0.05490196, 0, 1,
-2.314696, 0.1802638, -2.039345, 1, 0.05882353, 0, 1,
-2.300981, -0.3044003, -1.082882, 1, 0.06666667, 0, 1,
-2.242649, 0.8829039, -1.104722, 1, 0.07058824, 0, 1,
-2.208472, -0.4951077, -3.088211, 1, 0.07843138, 0, 1,
-2.196973, 1.419617, -1.22956, 1, 0.08235294, 0, 1,
-2.18221, 0.3892004, -2.442675, 1, 0.09019608, 0, 1,
-2.177774, 0.4643029, -1.039923, 1, 0.09411765, 0, 1,
-2.147315, 0.9466188, -0.4860508, 1, 0.1019608, 0, 1,
-2.106194, 1.8793, -1.504431, 1, 0.1098039, 0, 1,
-2.083882, -0.9251331, -2.136692, 1, 0.1137255, 0, 1,
-2.074738, -0.01657672, -1.61013, 1, 0.1215686, 0, 1,
-2.025342, 0.4501167, -0.4517604, 1, 0.1254902, 0, 1,
-1.993958, 0.147506, -0.6944867, 1, 0.1333333, 0, 1,
-1.992, 0.1775027, -1.015476, 1, 0.1372549, 0, 1,
-1.983699, 1.630031, -1.545598, 1, 0.145098, 0, 1,
-1.980309, -0.3698593, -0.9117039, 1, 0.1490196, 0, 1,
-1.970729, 0.0833207, -0.3965946, 1, 0.1568628, 0, 1,
-1.941456, -0.4605778, -1.374807, 1, 0.1607843, 0, 1,
-1.940339, -0.2677332, -1.795368, 1, 0.1686275, 0, 1,
-1.91486, 1.735401, 0.04156308, 1, 0.172549, 0, 1,
-1.911477, -1.586355, -1.013684, 1, 0.1803922, 0, 1,
-1.894109, -0.181991, -3.05108, 1, 0.1843137, 0, 1,
-1.887175, 0.3682996, -0.5408326, 1, 0.1921569, 0, 1,
-1.867195, -0.131217, -2.499405, 1, 0.1960784, 0, 1,
-1.836468, 1.470991, -1.861149, 1, 0.2039216, 0, 1,
-1.832036, -1.305501, -2.816204, 1, 0.2117647, 0, 1,
-1.823656, -1.127492, -1.335963, 1, 0.2156863, 0, 1,
-1.819444, 1.211148, -3.873743, 1, 0.2235294, 0, 1,
-1.814099, -0.9154276, -0.7535524, 1, 0.227451, 0, 1,
-1.813608, -0.06023595, -1.61245, 1, 0.2352941, 0, 1,
-1.782004, -0.7182887, -1.664743, 1, 0.2392157, 0, 1,
-1.768741, -0.9457462, -2.023787, 1, 0.2470588, 0, 1,
-1.768057, 0.09312093, -3.092089, 1, 0.2509804, 0, 1,
-1.752155, 0.4922768, -3.334328, 1, 0.2588235, 0, 1,
-1.749896, 0.9599956, -1.883081, 1, 0.2627451, 0, 1,
-1.740318, -0.370621, -1.032509, 1, 0.2705882, 0, 1,
-1.729192, 0.9691233, -1.774073, 1, 0.2745098, 0, 1,
-1.71957, 0.006970201, 0.09924904, 1, 0.282353, 0, 1,
-1.71567, -0.2643165, -2.970569, 1, 0.2862745, 0, 1,
-1.702463, -0.09040235, -1.344181, 1, 0.2941177, 0, 1,
-1.677201, 1.165635, -2.076978, 1, 0.3019608, 0, 1,
-1.669416, -0.7987512, -2.83322, 1, 0.3058824, 0, 1,
-1.648514, 0.4556125, -2.194681, 1, 0.3137255, 0, 1,
-1.610928, 0.9019282, -0.7046059, 1, 0.3176471, 0, 1,
-1.609743, 0.3236424, -1.065897, 1, 0.3254902, 0, 1,
-1.609089, -0.3412427, -1.939426, 1, 0.3294118, 0, 1,
-1.580502, -0.5051173, -2.148823, 1, 0.3372549, 0, 1,
-1.565429, -0.01951578, -2.251267, 1, 0.3411765, 0, 1,
-1.559741, -0.7513043, -1.206105, 1, 0.3490196, 0, 1,
-1.554951, -1.435344, -3.161559, 1, 0.3529412, 0, 1,
-1.531157, -1.078534, -2.750877, 1, 0.3607843, 0, 1,
-1.524227, 1.01372, -1.40614, 1, 0.3647059, 0, 1,
-1.506329, 0.7534815, -0.1142293, 1, 0.372549, 0, 1,
-1.495764, -0.1714247, -2.497107, 1, 0.3764706, 0, 1,
-1.495686, -1.450842, -1.603621, 1, 0.3843137, 0, 1,
-1.494702, -0.9492658, -0.7001458, 1, 0.3882353, 0, 1,
-1.491699, 0.08802504, -1.669858, 1, 0.3960784, 0, 1,
-1.484635, 2.68313, -0.5470243, 1, 0.4039216, 0, 1,
-1.477552, -0.495505, -4.426479, 1, 0.4078431, 0, 1,
-1.468823, -1.162032, -1.165989, 1, 0.4156863, 0, 1,
-1.464097, -0.7745587, -2.990554, 1, 0.4196078, 0, 1,
-1.46102, 0.5630815, -1.65625, 1, 0.427451, 0, 1,
-1.438126, -1.050114, -1.03718, 1, 0.4313726, 0, 1,
-1.437742, 1.24277, 1.028873, 1, 0.4392157, 0, 1,
-1.425249, -0.03745755, -1.319941, 1, 0.4431373, 0, 1,
-1.403701, -0.3198438, -0.761741, 1, 0.4509804, 0, 1,
-1.384084, -0.6856299, -2.998014, 1, 0.454902, 0, 1,
-1.379419, 1.876323, -0.7252072, 1, 0.4627451, 0, 1,
-1.375587, 0.8131503, -0.3638181, 1, 0.4666667, 0, 1,
-1.340521, -2.926553, -4.383438, 1, 0.4745098, 0, 1,
-1.328013, 0.06487988, -1.976379, 1, 0.4784314, 0, 1,
-1.327528, -1.109904, -4.090872, 1, 0.4862745, 0, 1,
-1.32594, -1.738098, -2.889402, 1, 0.4901961, 0, 1,
-1.322961, -1.090366, -3.295621, 1, 0.4980392, 0, 1,
-1.322363, -0.2138255, -2.102504, 1, 0.5058824, 0, 1,
-1.322225, 0.6183261, -2.142608, 1, 0.509804, 0, 1,
-1.309035, -1.394902, -0.953287, 1, 0.5176471, 0, 1,
-1.30634, 1.056901, 0.7989221, 1, 0.5215687, 0, 1,
-1.294582, 0.7870806, -2.609604, 1, 0.5294118, 0, 1,
-1.284003, -0.1391415, -1.520758, 1, 0.5333334, 0, 1,
-1.280426, -0.8024469, -1.051517, 1, 0.5411765, 0, 1,
-1.257012, -0.7880015, -1.807231, 1, 0.5450981, 0, 1,
-1.247474, 0.7647113, -0.363896, 1, 0.5529412, 0, 1,
-1.235917, 0.2371377, -1.552295, 1, 0.5568628, 0, 1,
-1.233631, -1.494572, -2.265599, 1, 0.5647059, 0, 1,
-1.233439, -0.2687374, -1.668865, 1, 0.5686275, 0, 1,
-1.23069, 0.5232156, -2.953518, 1, 0.5764706, 0, 1,
-1.2281, 0.1914175, -1.508754, 1, 0.5803922, 0, 1,
-1.226817, -1.471997, -2.829745, 1, 0.5882353, 0, 1,
-1.223391, -0.1918726, -2.664403, 1, 0.5921569, 0, 1,
-1.213948, 1.174095, -2.052144, 1, 0.6, 0, 1,
-1.208885, -1.047167, -2.364406, 1, 0.6078432, 0, 1,
-1.201569, 1.025202, 1.186155, 1, 0.6117647, 0, 1,
-1.185689, 1.420446, -1.383082, 1, 0.6196079, 0, 1,
-1.179263, -1.885333, -1.680871, 1, 0.6235294, 0, 1,
-1.17154, -0.003883117, -3.676254, 1, 0.6313726, 0, 1,
-1.169866, 1.683454, 0.1212966, 1, 0.6352941, 0, 1,
-1.165953, 0.5800473, -0.9854829, 1, 0.6431373, 0, 1,
-1.161555, -0.6767459, -2.582852, 1, 0.6470588, 0, 1,
-1.155434, -1.328018, -0.1693206, 1, 0.654902, 0, 1,
-1.150766, -0.3949522, -2.147619, 1, 0.6588235, 0, 1,
-1.147263, -0.6283114, -1.704102, 1, 0.6666667, 0, 1,
-1.144498, 1.125391, 0.2190347, 1, 0.6705883, 0, 1,
-1.137221, -1.359323, -0.242738, 1, 0.6784314, 0, 1,
-1.136301, 0.2506462, -1.472715, 1, 0.682353, 0, 1,
-1.134552, -1.100055, -1.727885, 1, 0.6901961, 0, 1,
-1.132376, 0.3323644, -1.276033, 1, 0.6941177, 0, 1,
-1.129076, -1.851278, -2.618744, 1, 0.7019608, 0, 1,
-1.124159, 0.9690798, 0.78289, 1, 0.7098039, 0, 1,
-1.122167, -1.043168, -2.629804, 1, 0.7137255, 0, 1,
-1.120137, -0.4865144, -3.327788, 1, 0.7215686, 0, 1,
-1.119514, 0.5039384, 0.1206482, 1, 0.7254902, 0, 1,
-1.116411, -1.203819, -3.643293, 1, 0.7333333, 0, 1,
-1.11287, 1.11466, -0.02325865, 1, 0.7372549, 0, 1,
-1.109836, 1.52273, -1.00867, 1, 0.7450981, 0, 1,
-1.107753, -0.6842833, -1.256973, 1, 0.7490196, 0, 1,
-1.088877, 0.2244901, -1.271722, 1, 0.7568628, 0, 1,
-1.085327, -0.1478219, -1.32098, 1, 0.7607843, 0, 1,
-1.082368, -0.2468394, -4.153965, 1, 0.7686275, 0, 1,
-1.081871, 0.7407489, -2.5394, 1, 0.772549, 0, 1,
-1.078846, -1.674042, -3.303184, 1, 0.7803922, 0, 1,
-1.072939, -0.6015744, -3.576493, 1, 0.7843137, 0, 1,
-1.071984, -0.8925819, -1.694144, 1, 0.7921569, 0, 1,
-1.071746, -1.286248, -1.476477, 1, 0.7960784, 0, 1,
-1.062549, 0.6086138, -1.003404, 1, 0.8039216, 0, 1,
-1.062297, 1.752912, 0.2260152, 1, 0.8117647, 0, 1,
-1.061183, -1.420152, -2.688258, 1, 0.8156863, 0, 1,
-1.058736, 0.4767036, -0.3958596, 1, 0.8235294, 0, 1,
-1.058107, 1.531964, -1.721725, 1, 0.827451, 0, 1,
-1.055745, 0.8321494, -0.2205186, 1, 0.8352941, 0, 1,
-1.047341, 0.04819581, -1.150573, 1, 0.8392157, 0, 1,
-1.044727, -0.5009261, -2.939474, 1, 0.8470588, 0, 1,
-1.038637, 0.6306248, -1.832054, 1, 0.8509804, 0, 1,
-1.036819, 0.9607744, 0.2492754, 1, 0.8588235, 0, 1,
-1.036802, 1.166656, -0.5740846, 1, 0.8627451, 0, 1,
-1.036562, -0.788303, -2.924903, 1, 0.8705882, 0, 1,
-1.036454, -0.921385, -5.058146, 1, 0.8745098, 0, 1,
-1.034626, -0.4893456, -2.590022, 1, 0.8823529, 0, 1,
-1.02735, 1.642227, 0.6059282, 1, 0.8862745, 0, 1,
-1.027064, -1.859046, -1.558772, 1, 0.8941177, 0, 1,
-1.022371, -1.632442, -0.6944612, 1, 0.8980392, 0, 1,
-1.021946, -0.5348644, -1.027068, 1, 0.9058824, 0, 1,
-1.019876, -1.498125, -2.837258, 1, 0.9137255, 0, 1,
-1.018667, -0.03372664, -2.504849, 1, 0.9176471, 0, 1,
-1.017438, -0.5416993, -1.957807, 1, 0.9254902, 0, 1,
-1.01591, -0.7260096, -1.519048, 1, 0.9294118, 0, 1,
-1.00742, 0.717082, -0.6909742, 1, 0.9372549, 0, 1,
-1.002191, -1.616346, -2.603812, 1, 0.9411765, 0, 1,
-1.00204, -0.01617004, -1.061188, 1, 0.9490196, 0, 1,
-1.002015, 1.139879, -0.9468663, 1, 0.9529412, 0, 1,
-1.001906, -0.7805135, -1.484349, 1, 0.9607843, 0, 1,
-1.001722, 0.4228054, -1.162548, 1, 0.9647059, 0, 1,
-0.992181, -0.3901862, -0.5243779, 1, 0.972549, 0, 1,
-0.9886829, 1.278724, -1.275032, 1, 0.9764706, 0, 1,
-0.9868231, -0.4014868, -2.383846, 1, 0.9843137, 0, 1,
-0.9840212, 2.00789, 0.1454324, 1, 0.9882353, 0, 1,
-0.9830618, 1.553765, -1.891844, 1, 0.9960784, 0, 1,
-0.9745619, 1.150985, -1.882349, 0.9960784, 1, 0, 1,
-0.9741182, 1.119913, 0.874653, 0.9921569, 1, 0, 1,
-0.9721834, -0.78885, -1.691717, 0.9843137, 1, 0, 1,
-0.9696195, 1.021699, -0.1730327, 0.9803922, 1, 0, 1,
-0.9610947, -0.5664691, -4.147345, 0.972549, 1, 0, 1,
-0.9565684, -1.515157, -2.57142, 0.9686275, 1, 0, 1,
-0.9556614, -0.003230793, -2.141624, 0.9607843, 1, 0, 1,
-0.9467126, 0.4142173, -2.039056, 0.9568627, 1, 0, 1,
-0.9420859, -1.508049, -1.876338, 0.9490196, 1, 0, 1,
-0.9383127, 0.1568071, -1.78569, 0.945098, 1, 0, 1,
-0.9381188, 0.4128147, -1.699463, 0.9372549, 1, 0, 1,
-0.9374819, 0.4918377, -0.2604389, 0.9333333, 1, 0, 1,
-0.9365759, 0.6201006, -3.383763, 0.9254902, 1, 0, 1,
-0.9327763, -0.5678771, -3.602235, 0.9215686, 1, 0, 1,
-0.9306402, -0.3022885, -1.30869, 0.9137255, 1, 0, 1,
-0.9275571, 2.097996, -0.1124738, 0.9098039, 1, 0, 1,
-0.92148, -0.18974, -1.556562, 0.9019608, 1, 0, 1,
-0.9139012, -0.3166352, -2.242313, 0.8941177, 1, 0, 1,
-0.912621, 0.6661302, -1.197356, 0.8901961, 1, 0, 1,
-0.9111992, -0.7937341, -3.263436, 0.8823529, 1, 0, 1,
-0.8957657, 0.04288393, -1.4745, 0.8784314, 1, 0, 1,
-0.8880031, -2.167349, -2.450785, 0.8705882, 1, 0, 1,
-0.8829816, 0.4741077, -1.828014, 0.8666667, 1, 0, 1,
-0.8817872, 0.723082, -1.667786, 0.8588235, 1, 0, 1,
-0.8816355, 0.3955496, -1.07687, 0.854902, 1, 0, 1,
-0.8814088, -2.376805, -2.580206, 0.8470588, 1, 0, 1,
-0.8780603, -1.482472, -2.833933, 0.8431373, 1, 0, 1,
-0.8753287, 1.198514, -1.658006, 0.8352941, 1, 0, 1,
-0.8729427, 0.6056561, 1.775531, 0.8313726, 1, 0, 1,
-0.8700803, -1.873482, -5.670919, 0.8235294, 1, 0, 1,
-0.8666353, -0.06432328, -0.7130774, 0.8196079, 1, 0, 1,
-0.8563691, -0.02358916, -1.342187, 0.8117647, 1, 0, 1,
-0.8534499, -0.4560255, -3.764564, 0.8078431, 1, 0, 1,
-0.8522177, 0.6575872, -0.4167732, 0.8, 1, 0, 1,
-0.8498121, 1.07432, -1.393095, 0.7921569, 1, 0, 1,
-0.8487044, 0.9658743, -2.675001, 0.7882353, 1, 0, 1,
-0.8418776, 1.085361, 1.18953, 0.7803922, 1, 0, 1,
-0.8416196, -0.2391282, 0.171533, 0.7764706, 1, 0, 1,
-0.8403979, 1.055177, 0.1037101, 0.7686275, 1, 0, 1,
-0.8315271, 0.7570617, 0.7518739, 0.7647059, 1, 0, 1,
-0.8299758, -0.6401914, -3.1712, 0.7568628, 1, 0, 1,
-0.8238708, -0.3421917, -2.549745, 0.7529412, 1, 0, 1,
-0.8234812, -1.303315, -2.89301, 0.7450981, 1, 0, 1,
-0.8173766, -0.9250654, -1.709584, 0.7411765, 1, 0, 1,
-0.8160938, 0.361753, -1.481517, 0.7333333, 1, 0, 1,
-0.8160741, 0.2454976, -2.517466, 0.7294118, 1, 0, 1,
-0.8132645, 1.279325, 0.7212939, 0.7215686, 1, 0, 1,
-0.8046763, -0.2385177, -1.408774, 0.7176471, 1, 0, 1,
-0.8015636, 0.7071515, -1.52523, 0.7098039, 1, 0, 1,
-0.8014157, 0.6329424, -0.4072842, 0.7058824, 1, 0, 1,
-0.7999414, -0.1265995, -2.375406, 0.6980392, 1, 0, 1,
-0.79412, 0.635842, -0.584651, 0.6901961, 1, 0, 1,
-0.7926651, -0.6338496, -2.086666, 0.6862745, 1, 0, 1,
-0.7922827, 0.1132512, -0.09012893, 0.6784314, 1, 0, 1,
-0.7903552, -0.8563257, -1.640328, 0.6745098, 1, 0, 1,
-0.7793493, 0.6020452, -0.8201967, 0.6666667, 1, 0, 1,
-0.7749274, -0.4365748, -1.409206, 0.6627451, 1, 0, 1,
-0.7726101, 0.6492543, -0.473554, 0.654902, 1, 0, 1,
-0.7709959, 2.218322, -1.105385, 0.6509804, 1, 0, 1,
-0.7640418, 0.7649294, 0.2029771, 0.6431373, 1, 0, 1,
-0.7640335, 0.5286639, -1.671336, 0.6392157, 1, 0, 1,
-0.7631938, -0.3583271, -1.170637, 0.6313726, 1, 0, 1,
-0.7581523, -1.196302, -1.52101, 0.627451, 1, 0, 1,
-0.7573202, 0.5858917, -1.202853, 0.6196079, 1, 0, 1,
-0.7563432, -0.985356, -0.6861287, 0.6156863, 1, 0, 1,
-0.7510427, 0.03041579, -1.438631, 0.6078432, 1, 0, 1,
-0.7437333, -0.9256307, -2.074434, 0.6039216, 1, 0, 1,
-0.7435765, 1.416929, 0.3554223, 0.5960785, 1, 0, 1,
-0.7428726, 0.6571795, -0.588736, 0.5882353, 1, 0, 1,
-0.7417908, -1.291141, -3.263941, 0.5843138, 1, 0, 1,
-0.7392626, 1.435013, 1.425609, 0.5764706, 1, 0, 1,
-0.7348754, -0.8982763, -3.605546, 0.572549, 1, 0, 1,
-0.7338037, 1.191298, -1.220578, 0.5647059, 1, 0, 1,
-0.7260647, 0.8987409, -0.04772669, 0.5607843, 1, 0, 1,
-0.7216262, -0.5379661, -1.370807, 0.5529412, 1, 0, 1,
-0.7191078, -1.626074, -3.893623, 0.5490196, 1, 0, 1,
-0.7181845, -0.7303632, -1.713845, 0.5411765, 1, 0, 1,
-0.718177, -0.4764004, -1.876289, 0.5372549, 1, 0, 1,
-0.7110419, -0.9294519, -2.0399, 0.5294118, 1, 0, 1,
-0.7109448, 0.7158765, -1.676413, 0.5254902, 1, 0, 1,
-0.7058501, 0.4236591, -0.3966775, 0.5176471, 1, 0, 1,
-0.7045858, 1.163102, -1.344216, 0.5137255, 1, 0, 1,
-0.7040697, 1.427078, -0.9979535, 0.5058824, 1, 0, 1,
-0.6936632, 0.8838542, -0.7755898, 0.5019608, 1, 0, 1,
-0.6931168, -0.7571173, -1.249916, 0.4941176, 1, 0, 1,
-0.6930028, -0.7972112, -2.236801, 0.4862745, 1, 0, 1,
-0.6876129, 0.08795338, -2.105078, 0.4823529, 1, 0, 1,
-0.6863315, -1.151063, -3.407072, 0.4745098, 1, 0, 1,
-0.6824362, -0.1342476, -1.733835, 0.4705882, 1, 0, 1,
-0.67871, 1.000394, -1.202831, 0.4627451, 1, 0, 1,
-0.668951, -0.1368955, -3.042233, 0.4588235, 1, 0, 1,
-0.6683441, -0.731986, -1.184475, 0.4509804, 1, 0, 1,
-0.6682198, -0.3324989, -1.06997, 0.4470588, 1, 0, 1,
-0.6643738, -0.8007171, -2.507985, 0.4392157, 1, 0, 1,
-0.6571923, -1.079687, -0.9627216, 0.4352941, 1, 0, 1,
-0.65685, -0.3243376, -0.1035818, 0.427451, 1, 0, 1,
-0.645894, -0.3680668, -1.116817, 0.4235294, 1, 0, 1,
-0.6445276, 0.3970359, -2.624016, 0.4156863, 1, 0, 1,
-0.6409311, 0.3192548, -1.702474, 0.4117647, 1, 0, 1,
-0.6396429, -0.8812258, -1.260229, 0.4039216, 1, 0, 1,
-0.6387714, -0.8484952, -1.607509, 0.3960784, 1, 0, 1,
-0.6315132, 0.5002094, 1.14265, 0.3921569, 1, 0, 1,
-0.6301339, -0.1309499, -2.129641, 0.3843137, 1, 0, 1,
-0.6283404, -0.876843, -1.933712, 0.3803922, 1, 0, 1,
-0.6261967, -1.537983, -2.841195, 0.372549, 1, 0, 1,
-0.6224545, 0.8156275, 0.09628405, 0.3686275, 1, 0, 1,
-0.6196168, -0.4313756, -1.780336, 0.3607843, 1, 0, 1,
-0.618993, -0.3586815, -0.6570511, 0.3568628, 1, 0, 1,
-0.6187773, -0.6679327, -4.054188, 0.3490196, 1, 0, 1,
-0.6146739, 0.4663552, -2.717827, 0.345098, 1, 0, 1,
-0.6140323, 0.4110484, -0.02422293, 0.3372549, 1, 0, 1,
-0.613809, 0.406099, -1.211052, 0.3333333, 1, 0, 1,
-0.6096039, 0.1833854, -0.1135147, 0.3254902, 1, 0, 1,
-0.6077788, 2.05724, 0.4970576, 0.3215686, 1, 0, 1,
-0.6012145, 1.116584, -1.052874, 0.3137255, 1, 0, 1,
-0.5956041, 0.8740097, 1.617335, 0.3098039, 1, 0, 1,
-0.5955365, -0.35896, -2.130876, 0.3019608, 1, 0, 1,
-0.5915504, -0.4993001, -3.031007, 0.2941177, 1, 0, 1,
-0.5909823, -1.913956, -2.543852, 0.2901961, 1, 0, 1,
-0.5806052, -0.9037684, -1.643918, 0.282353, 1, 0, 1,
-0.578117, 0.8548848, -0.3569068, 0.2784314, 1, 0, 1,
-0.5766122, 0.3203528, -0.7683617, 0.2705882, 1, 0, 1,
-0.5735325, 1.084951, -1.543928, 0.2666667, 1, 0, 1,
-0.5682162, -0.06234817, -2.305108, 0.2588235, 1, 0, 1,
-0.5634565, -1.92662, -2.607464, 0.254902, 1, 0, 1,
-0.5608073, 0.8658881, -0.188032, 0.2470588, 1, 0, 1,
-0.5607368, -1.509086, -2.315023, 0.2431373, 1, 0, 1,
-0.5561424, -0.2661802, -1.476824, 0.2352941, 1, 0, 1,
-0.554772, -0.8793558, -1.377453, 0.2313726, 1, 0, 1,
-0.5499313, -1.226786, -3.321479, 0.2235294, 1, 0, 1,
-0.5450493, 1.302111, -1.300841, 0.2196078, 1, 0, 1,
-0.5431095, -1.140751, -3.363988, 0.2117647, 1, 0, 1,
-0.5364181, -0.5357021, -3.213885, 0.2078431, 1, 0, 1,
-0.5358339, 0.8755444, -1.026693, 0.2, 1, 0, 1,
-0.5356449, 0.08805785, -0.6707016, 0.1921569, 1, 0, 1,
-0.5326639, 0.2582955, -2.204251, 0.1882353, 1, 0, 1,
-0.5310031, 0.3902079, -0.5513738, 0.1803922, 1, 0, 1,
-0.5294355, 0.08205564, -1.182081, 0.1764706, 1, 0, 1,
-0.5259121, -0.7481551, -2.851387, 0.1686275, 1, 0, 1,
-0.5253423, -1.068257, -4.417548, 0.1647059, 1, 0, 1,
-0.5251746, -0.1494376, -1.070778, 0.1568628, 1, 0, 1,
-0.5199602, -1.743464, -2.572872, 0.1529412, 1, 0, 1,
-0.5163777, 1.372942, 0.9399833, 0.145098, 1, 0, 1,
-0.5156121, 1.186, -0.2844453, 0.1411765, 1, 0, 1,
-0.5117584, 0.2387325, -1.32456, 0.1333333, 1, 0, 1,
-0.5071691, -0.8722518, -1.515459, 0.1294118, 1, 0, 1,
-0.5069678, 2.064541, -0.1813858, 0.1215686, 1, 0, 1,
-0.5068744, -2.038939, -2.114421, 0.1176471, 1, 0, 1,
-0.5065727, -0.4224834, -3.489934, 0.1098039, 1, 0, 1,
-0.5004146, 1.313251, 0.3183064, 0.1058824, 1, 0, 1,
-0.4954959, 1.936495, 0.5751115, 0.09803922, 1, 0, 1,
-0.4943205, 0.238327, -1.001428, 0.09019608, 1, 0, 1,
-0.4929968, 1.987671, -0.7121314, 0.08627451, 1, 0, 1,
-0.4892026, -0.2879505, -0.6508685, 0.07843138, 1, 0, 1,
-0.4878779, 0.5035946, -0.8446443, 0.07450981, 1, 0, 1,
-0.4849368, 1.47758, -0.1429314, 0.06666667, 1, 0, 1,
-0.4821197, -1.045034, -4.230412, 0.0627451, 1, 0, 1,
-0.4807765, 0.278751, -1.042068, 0.05490196, 1, 0, 1,
-0.4793741, 0.8695442, -0.8337564, 0.05098039, 1, 0, 1,
-0.4765348, -1.068057, -3.536875, 0.04313726, 1, 0, 1,
-0.4663109, -0.1257907, -2.467714, 0.03921569, 1, 0, 1,
-0.466297, 0.8527429, 0.02200995, 0.03137255, 1, 0, 1,
-0.4623576, 0.7766675, -1.156515, 0.02745098, 1, 0, 1,
-0.4587649, 0.9236202, -0.6956077, 0.01960784, 1, 0, 1,
-0.4557328, -1.17797, -2.402972, 0.01568628, 1, 0, 1,
-0.4520417, 0.1718608, -1.377514, 0.007843138, 1, 0, 1,
-0.4511194, -0.2020976, -2.944309, 0.003921569, 1, 0, 1,
-0.448699, 0.6575353, -1.604394, 0, 1, 0.003921569, 1,
-0.4450662, 0.1877685, -0.7627264, 0, 1, 0.01176471, 1,
-0.4402692, 0.1257457, -1.628769, 0, 1, 0.01568628, 1,
-0.4384969, 1.834324, 0.9967871, 0, 1, 0.02352941, 1,
-0.4364066, -0.3189367, -1.532953, 0, 1, 0.02745098, 1,
-0.4359549, -1.915706, -3.789596, 0, 1, 0.03529412, 1,
-0.4349318, 1.173774, 0.3616138, 0, 1, 0.03921569, 1,
-0.4335834, -0.3598308, -2.789005, 0, 1, 0.04705882, 1,
-0.425262, 0.01276735, 0.05117074, 0, 1, 0.05098039, 1,
-0.4217387, -0.2008144, -2.545252, 0, 1, 0.05882353, 1,
-0.4188257, -1.032833, -2.60318, 0, 1, 0.0627451, 1,
-0.4169421, -1.297985, -2.453807, 0, 1, 0.07058824, 1,
-0.4161855, -0.4115109, -5.10394, 0, 1, 0.07450981, 1,
-0.4156075, 0.003423805, -1.474431, 0, 1, 0.08235294, 1,
-0.4129356, -0.02001458, -1.411418, 0, 1, 0.08627451, 1,
-0.4111565, 0.1799224, -1.812044, 0, 1, 0.09411765, 1,
-0.4103988, -0.4099824, -3.814532, 0, 1, 0.1019608, 1,
-0.4098878, -0.6783038, -2.67686, 0, 1, 0.1058824, 1,
-0.4075595, 1.079685, 1.393113, 0, 1, 0.1137255, 1,
-0.4046292, 0.1669881, -2.112061, 0, 1, 0.1176471, 1,
-0.4004922, -1.138654, -1.758846, 0, 1, 0.1254902, 1,
-0.3967904, 0.7333943, -0.01879076, 0, 1, 0.1294118, 1,
-0.3931355, -0.1359679, -2.219274, 0, 1, 0.1372549, 1,
-0.390954, -0.632858, -2.39581, 0, 1, 0.1411765, 1,
-0.3865128, 1.370088, -0.473655, 0, 1, 0.1490196, 1,
-0.3848016, 1.324626, 1.106616, 0, 1, 0.1529412, 1,
-0.383249, -0.2368636, -1.599077, 0, 1, 0.1607843, 1,
-0.3811197, 0.5565693, -1.261777, 0, 1, 0.1647059, 1,
-0.374334, 2.405035, -0.836552, 0, 1, 0.172549, 1,
-0.3719459, -0.9943878, -1.964091, 0, 1, 0.1764706, 1,
-0.3680574, 0.6830948, -1.392761, 0, 1, 0.1843137, 1,
-0.3611779, 0.3115002, -0.8938712, 0, 1, 0.1882353, 1,
-0.3607276, 0.04566948, -1.22046, 0, 1, 0.1960784, 1,
-0.3588076, -0.04117221, -3.71355, 0, 1, 0.2039216, 1,
-0.3568716, 1.637445, 0.1676497, 0, 1, 0.2078431, 1,
-0.3563615, 0.1750131, -1.272147, 0, 1, 0.2156863, 1,
-0.3530497, -1.09346, -3.980257, 0, 1, 0.2196078, 1,
-0.3413213, -0.05086967, -0.782635, 0, 1, 0.227451, 1,
-0.3363982, -0.8717947, -3.31093, 0, 1, 0.2313726, 1,
-0.3288376, 0.8939093, 0.4419783, 0, 1, 0.2392157, 1,
-0.3279733, -0.2240704, -1.257725, 0, 1, 0.2431373, 1,
-0.3273084, -0.1019569, -3.073199, 0, 1, 0.2509804, 1,
-0.3264646, 0.2641052, -0.6448212, 0, 1, 0.254902, 1,
-0.3163707, 0.1440874, -0.2882603, 0, 1, 0.2627451, 1,
-0.3153028, -0.0669122, -2.284831, 0, 1, 0.2666667, 1,
-0.3130244, 0.1925523, -0.4070309, 0, 1, 0.2745098, 1,
-0.3112495, 0.5814372, -0.6892672, 0, 1, 0.2784314, 1,
-0.3073162, -1.838035, -2.986797, 0, 1, 0.2862745, 1,
-0.3057593, -0.8595561, -2.759537, 0, 1, 0.2901961, 1,
-0.3051293, 1.450034, -0.7534043, 0, 1, 0.2980392, 1,
-0.3025918, 0.1159448, -1.145369, 0, 1, 0.3058824, 1,
-0.3024712, -0.8264097, -4.01883, 0, 1, 0.3098039, 1,
-0.3011989, -0.7786155, -3.749367, 0, 1, 0.3176471, 1,
-0.2947154, 1.248927, 0.7952449, 0, 1, 0.3215686, 1,
-0.2942192, -1.012626, -4.245211, 0, 1, 0.3294118, 1,
-0.293587, -0.4252367, -2.890221, 0, 1, 0.3333333, 1,
-0.2930416, 1.175158, 0.3294381, 0, 1, 0.3411765, 1,
-0.2906337, -0.7983937, -2.57856, 0, 1, 0.345098, 1,
-0.2897554, -1.214416, -4.043216, 0, 1, 0.3529412, 1,
-0.2874174, 0.2438183, 0.5093391, 0, 1, 0.3568628, 1,
-0.2845503, -0.8853912, -1.719633, 0, 1, 0.3647059, 1,
-0.2806707, -1.096633, -3.129884, 0, 1, 0.3686275, 1,
-0.2797074, -0.4319516, -1.959561, 0, 1, 0.3764706, 1,
-0.2739236, 2.115146, -0.5591735, 0, 1, 0.3803922, 1,
-0.2728622, 0.8857726, -0.4327499, 0, 1, 0.3882353, 1,
-0.2728562, -1.788707, -1.944682, 0, 1, 0.3921569, 1,
-0.2710383, -0.03020839, -1.412933, 0, 1, 0.4, 1,
-0.2698937, -0.8974789, -2.558122, 0, 1, 0.4078431, 1,
-0.2671057, -1.055155, -1.503556, 0, 1, 0.4117647, 1,
-0.2666704, 0.02268516, -0.3316724, 0, 1, 0.4196078, 1,
-0.2660627, -0.7859042, -2.301866, 0, 1, 0.4235294, 1,
-0.2596673, -0.6769501, -3.218847, 0, 1, 0.4313726, 1,
-0.2551494, 0.4102525, -1.596075, 0, 1, 0.4352941, 1,
-0.2517369, -0.02577154, -1.204281, 0, 1, 0.4431373, 1,
-0.2502286, 0.331248, -1.181883, 0, 1, 0.4470588, 1,
-0.2494207, -2.17644, -3.707531, 0, 1, 0.454902, 1,
-0.2493578, -0.57364, -3.706486, 0, 1, 0.4588235, 1,
-0.2469015, -0.4994913, 0.6317781, 0, 1, 0.4666667, 1,
-0.2461298, 0.08741623, -1.78972, 0, 1, 0.4705882, 1,
-0.2458965, -0.9088814, -1.753251, 0, 1, 0.4784314, 1,
-0.2458449, -1.622636, -2.77268, 0, 1, 0.4823529, 1,
-0.2424968, 2.273188, 1.400346, 0, 1, 0.4901961, 1,
-0.2424287, 0.9554977, -0.321836, 0, 1, 0.4941176, 1,
-0.2415642, -0.8473659, -3.972204, 0, 1, 0.5019608, 1,
-0.2409844, -1.375437, -3.652425, 0, 1, 0.509804, 1,
-0.24044, 1.28756, -0.9245661, 0, 1, 0.5137255, 1,
-0.2336642, -2.330177, -4.06244, 0, 1, 0.5215687, 1,
-0.2322553, 1.090725, -3.256816, 0, 1, 0.5254902, 1,
-0.2312437, -1.102868, -2.165328, 0, 1, 0.5333334, 1,
-0.228432, -0.1546153, -0.3019637, 0, 1, 0.5372549, 1,
-0.2282765, 0.6665375, -0.4991851, 0, 1, 0.5450981, 1,
-0.2234174, -0.212119, -3.62942, 0, 1, 0.5490196, 1,
-0.2220618, -1.767701, -0.7987227, 0, 1, 0.5568628, 1,
-0.2212654, -2.156134, -3.506465, 0, 1, 0.5607843, 1,
-0.2190385, 0.08897228, -1.019922, 0, 1, 0.5686275, 1,
-0.2177723, -2.193939, -2.224436, 0, 1, 0.572549, 1,
-0.206381, 0.5209806, -1.434591, 0, 1, 0.5803922, 1,
-0.1993298, 0.995592, -0.8591435, 0, 1, 0.5843138, 1,
-0.1984759, -0.0393958, -1.616509, 0, 1, 0.5921569, 1,
-0.1972072, 1.239839, -0.9521865, 0, 1, 0.5960785, 1,
-0.1904774, 1.440652, -0.7019207, 0, 1, 0.6039216, 1,
-0.1890638, -1.080688, -4.375451, 0, 1, 0.6117647, 1,
-0.1884199, -0.2743994, -2.473376, 0, 1, 0.6156863, 1,
-0.1795956, 1.449962, 0.844054, 0, 1, 0.6235294, 1,
-0.1763524, 0.5242894, 0.4599865, 0, 1, 0.627451, 1,
-0.1689038, 1.79405, 0.4255566, 0, 1, 0.6352941, 1,
-0.1673584, -0.4135765, -2.97838, 0, 1, 0.6392157, 1,
-0.1661187, -1.463349, -2.853362, 0, 1, 0.6470588, 1,
-0.1658144, 0.7112508, 1.04762, 0, 1, 0.6509804, 1,
-0.1650317, -1.505446, -4.26373, 0, 1, 0.6588235, 1,
-0.1639712, 0.7108828, -0.8557509, 0, 1, 0.6627451, 1,
-0.1627387, -0.07829849, -2.03687, 0, 1, 0.6705883, 1,
-0.1527005, -1.20252, -3.86496, 0, 1, 0.6745098, 1,
-0.1523227, 0.6867774, -0.1796159, 0, 1, 0.682353, 1,
-0.1482578, -0.003581062, -1.567459, 0, 1, 0.6862745, 1,
-0.1466547, 0.7813432, -1.879405, 0, 1, 0.6941177, 1,
-0.1458733, -0.409179, -4.084332, 0, 1, 0.7019608, 1,
-0.1426533, 0.5435203, -0.4554122, 0, 1, 0.7058824, 1,
-0.1422116, 1.186693, 0.8745455, 0, 1, 0.7137255, 1,
-0.1368836, 1.934862, 0.1271828, 0, 1, 0.7176471, 1,
-0.1345787, 0.2383521, -2.187652, 0, 1, 0.7254902, 1,
-0.131586, -1.081552, -0.6921546, 0, 1, 0.7294118, 1,
-0.1232694, -0.8297417, -4.081192, 0, 1, 0.7372549, 1,
-0.1222185, -0.5892972, -3.417301, 0, 1, 0.7411765, 1,
-0.1171542, -0.541577, -2.097447, 0, 1, 0.7490196, 1,
-0.1119205, -0.2981897, -2.57769, 0, 1, 0.7529412, 1,
-0.1093297, -0.2863714, -2.24807, 0, 1, 0.7607843, 1,
-0.1059522, 0.5275849, -2.737116, 0, 1, 0.7647059, 1,
-0.1042187, -0.4242547, -3.260619, 0, 1, 0.772549, 1,
-0.1028683, 1.039619, -0.003640928, 0, 1, 0.7764706, 1,
-0.1008337, -0.2034058, -4.414613, 0, 1, 0.7843137, 1,
-0.1002817, -0.6616164, -2.664692, 0, 1, 0.7882353, 1,
-0.09844775, 0.4150815, 0.2556739, 0, 1, 0.7960784, 1,
-0.09816018, 0.245891, -0.7696477, 0, 1, 0.8039216, 1,
-0.09497804, -1.598141, -1.896528, 0, 1, 0.8078431, 1,
-0.08202241, -0.6578893, -4.395524, 0, 1, 0.8156863, 1,
-0.07727037, 0.4240842, 1.126065, 0, 1, 0.8196079, 1,
-0.07619591, -1.132308, -2.605422, 0, 1, 0.827451, 1,
-0.07523821, 0.5455284, -0.2522109, 0, 1, 0.8313726, 1,
-0.07402535, -0.8284274, -3.495729, 0, 1, 0.8392157, 1,
-0.07328804, -1.145859, -3.939935, 0, 1, 0.8431373, 1,
-0.07181313, 0.07848895, -0.4052879, 0, 1, 0.8509804, 1,
-0.0576583, -0.1688416, -1.556818, 0, 1, 0.854902, 1,
-0.04890591, 1.158614, 0.06387998, 0, 1, 0.8627451, 1,
-0.04580275, -0.2748978, -3.706061, 0, 1, 0.8666667, 1,
-0.04560685, -0.1651971, -2.327801, 0, 1, 0.8745098, 1,
-0.03953237, -0.8657224, -3.319432, 0, 1, 0.8784314, 1,
-0.03549787, 0.0003776564, -2.468486, 0, 1, 0.8862745, 1,
-0.02862714, -1.777002, -3.574288, 0, 1, 0.8901961, 1,
-0.02385062, -0.5483544, -2.017157, 0, 1, 0.8980392, 1,
-0.02236225, -0.114753, -1.465795, 0, 1, 0.9058824, 1,
-0.01743033, 0.3381077, -0.1869885, 0, 1, 0.9098039, 1,
-0.01554395, -0.4958708, -3.279577, 0, 1, 0.9176471, 1,
-0.01489385, 0.131422, -1.83342, 0, 1, 0.9215686, 1,
-0.01398868, -1.019784, -2.522204, 0, 1, 0.9294118, 1,
-0.01365038, -0.6311325, -4.247722, 0, 1, 0.9333333, 1,
-0.01328288, -1.121495, -3.347231, 0, 1, 0.9411765, 1,
-0.007964845, 0.7198192, -0.109276, 0, 1, 0.945098, 1,
-0.007606439, 0.4430088, 1.686441, 0, 1, 0.9529412, 1,
-0.006184034, -1.599801, -2.640594, 0, 1, 0.9568627, 1,
-0.005064571, 0.6047341, 0.03480903, 0, 1, 0.9647059, 1,
-0.001884031, 0.6454867, 0.322003, 0, 1, 0.9686275, 1,
-0.001448021, 0.5914553, -1.572413, 0, 1, 0.9764706, 1,
-0.001426295, -1.758363, -2.694929, 0, 1, 0.9803922, 1,
-0.0001125335, -1.739446, -3.433886, 0, 1, 0.9882353, 1,
-3.461674e-05, -0.8462416, -3.213324, 0, 1, 0.9921569, 1,
0.005877367, -0.6729981, 4.800173, 0, 1, 1, 1,
0.007322811, 0.9195359, 0.7570632, 0, 0.9921569, 1, 1,
0.0109843, 1.349847, -0.008004021, 0, 0.9882353, 1, 1,
0.01249383, 0.06398787, 0.2054449, 0, 0.9803922, 1, 1,
0.01428484, -1.448821, 3.791323, 0, 0.9764706, 1, 1,
0.01590806, 1.046391, 0.6355665, 0, 0.9686275, 1, 1,
0.01693954, -0.1376241, 4.269804, 0, 0.9647059, 1, 1,
0.01761171, 0.8734026, 1.001264, 0, 0.9568627, 1, 1,
0.01769165, 0.1590944, -1.058965, 0, 0.9529412, 1, 1,
0.01790203, 0.2303568, 0.4173662, 0, 0.945098, 1, 1,
0.01898884, 0.876085, 0.3592896, 0, 0.9411765, 1, 1,
0.02258336, 0.9460734, 0.4989516, 0, 0.9333333, 1, 1,
0.02518313, 0.7387608, -3.22188, 0, 0.9294118, 1, 1,
0.03043487, -0.7915984, 3.420275, 0, 0.9215686, 1, 1,
0.03108002, -0.9473837, 4.448223, 0, 0.9176471, 1, 1,
0.03200869, 0.8418803, -0.4476596, 0, 0.9098039, 1, 1,
0.03205939, 2.323498, -0.3803122, 0, 0.9058824, 1, 1,
0.03740373, 1.105192, -0.1179732, 0, 0.8980392, 1, 1,
0.03809777, 0.3931589, -0.3742479, 0, 0.8901961, 1, 1,
0.04142091, 0.5998853, -0.1343956, 0, 0.8862745, 1, 1,
0.04191928, 0.7238083, -0.6815376, 0, 0.8784314, 1, 1,
0.04605218, -1.505797, 3.595406, 0, 0.8745098, 1, 1,
0.0475465, -0.6003073, 2.687639, 0, 0.8666667, 1, 1,
0.05059811, -0.2783437, 2.219844, 0, 0.8627451, 1, 1,
0.05163157, 2.377754, 0.334699, 0, 0.854902, 1, 1,
0.05555959, -1.604303, 3.378788, 0, 0.8509804, 1, 1,
0.05584322, 1.107105, -0.6528924, 0, 0.8431373, 1, 1,
0.05944679, -1.285081, 2.624129, 0, 0.8392157, 1, 1,
0.06068463, 1.071884, -0.1185928, 0, 0.8313726, 1, 1,
0.06118017, 0.9594558, 0.1659255, 0, 0.827451, 1, 1,
0.0662535, 0.007293709, 0.8972238, 0, 0.8196079, 1, 1,
0.06835931, -0.3394676, 3.281609, 0, 0.8156863, 1, 1,
0.0721478, 0.9620442, -1.301596, 0, 0.8078431, 1, 1,
0.07223022, -0.2500719, 3.736141, 0, 0.8039216, 1, 1,
0.07681657, -0.7072156, 3.733053, 0, 0.7960784, 1, 1,
0.0795269, -0.640746, 3.547647, 0, 0.7882353, 1, 1,
0.0820346, 0.1419229, 0.6571931, 0, 0.7843137, 1, 1,
0.08360661, -0.2643539, 4.028466, 0, 0.7764706, 1, 1,
0.08429053, -1.202462, 1.961576, 0, 0.772549, 1, 1,
0.0871055, 0.06053577, 0.2349997, 0, 0.7647059, 1, 1,
0.08821488, 0.01067689, 1.054758, 0, 0.7607843, 1, 1,
0.0894743, 0.2134778, 2.16705, 0, 0.7529412, 1, 1,
0.09598944, -0.6783069, 2.837759, 0, 0.7490196, 1, 1,
0.1003525, -0.957203, 4.24504, 0, 0.7411765, 1, 1,
0.1022034, 0.003154618, 1.946278, 0, 0.7372549, 1, 1,
0.1067457, -0.0358652, 1.198917, 0, 0.7294118, 1, 1,
0.1072962, -0.07551767, 4.207138, 0, 0.7254902, 1, 1,
0.1077312, -1.240662, 2.40568, 0, 0.7176471, 1, 1,
0.1081188, 0.2968287, 0.005695811, 0, 0.7137255, 1, 1,
0.1122972, 0.5002456, -2.944022, 0, 0.7058824, 1, 1,
0.1143403, 0.05889161, 1.283147, 0, 0.6980392, 1, 1,
0.1143885, -1.667019, 3.90476, 0, 0.6941177, 1, 1,
0.1170534, 0.582082, 0.9023972, 0, 0.6862745, 1, 1,
0.120812, -0.9622468, 2.062819, 0, 0.682353, 1, 1,
0.1240981, 0.1846356, 0.1023854, 0, 0.6745098, 1, 1,
0.1289052, -1.770496, 2.280436, 0, 0.6705883, 1, 1,
0.1311204, -0.2289518, 2.842808, 0, 0.6627451, 1, 1,
0.1318836, -1.078626, 1.941894, 0, 0.6588235, 1, 1,
0.1326566, 0.2329701, 2.076612, 0, 0.6509804, 1, 1,
0.1332246, 0.3285101, -0.6443996, 0, 0.6470588, 1, 1,
0.1445801, 0.77088, 0.4678598, 0, 0.6392157, 1, 1,
0.1470553, -0.2914245, 3.644495, 0, 0.6352941, 1, 1,
0.1474702, 0.870221, 0.4670301, 0, 0.627451, 1, 1,
0.1511897, 0.04775779, 2.448356, 0, 0.6235294, 1, 1,
0.1518123, -0.1414974, 1.568915, 0, 0.6156863, 1, 1,
0.155274, -0.629815, 2.798588, 0, 0.6117647, 1, 1,
0.159796, 1.177723, -1.023858, 0, 0.6039216, 1, 1,
0.1650464, -0.1398157, 1.218663, 0, 0.5960785, 1, 1,
0.1657131, -0.7607642, 2.642894, 0, 0.5921569, 1, 1,
0.1674005, 0.7057871, 0.4573229, 0, 0.5843138, 1, 1,
0.1683859, -0.4865513, 2.324707, 0, 0.5803922, 1, 1,
0.1701751, 0.4452657, -0.03898288, 0, 0.572549, 1, 1,
0.1748051, -0.6192912, 1.766883, 0, 0.5686275, 1, 1,
0.1829175, 1.895515, -1.109562, 0, 0.5607843, 1, 1,
0.1870957, -0.1550658, 2.770654, 0, 0.5568628, 1, 1,
0.1936193, -0.6377026, 3.514273, 0, 0.5490196, 1, 1,
0.1974612, 0.2014658, 1.630079, 0, 0.5450981, 1, 1,
0.1976197, -0.6739174, 3.718166, 0, 0.5372549, 1, 1,
0.1982774, -0.4755806, 4.88231, 0, 0.5333334, 1, 1,
0.2016844, 0.9460662, 0.1829517, 0, 0.5254902, 1, 1,
0.2020992, 0.2000202, 2.496022, 0, 0.5215687, 1, 1,
0.2050721, 0.3436573, -1.309476, 0, 0.5137255, 1, 1,
0.2072946, -0.2716435, 2.442894, 0, 0.509804, 1, 1,
0.2082445, -0.4796512, 2.544863, 0, 0.5019608, 1, 1,
0.2161869, 1.63557, 1.35877, 0, 0.4941176, 1, 1,
0.2188763, 0.3105763, -1.404829, 0, 0.4901961, 1, 1,
0.2244456, 0.681314, -0.256925, 0, 0.4823529, 1, 1,
0.2313064, 0.4228405, 2.034054, 0, 0.4784314, 1, 1,
0.2333378, 1.712697, 2.455548, 0, 0.4705882, 1, 1,
0.2374466, -0.5612296, 2.646716, 0, 0.4666667, 1, 1,
0.238111, -0.6107349, 2.634059, 0, 0.4588235, 1, 1,
0.2386941, -1.789689, 3.622257, 0, 0.454902, 1, 1,
0.2394865, 0.9347331, 0.9360061, 0, 0.4470588, 1, 1,
0.2404419, 0.528497, -1.701269, 0, 0.4431373, 1, 1,
0.2410445, 0.04587149, -0.02115181, 0, 0.4352941, 1, 1,
0.2421382, -0.8213741, 4.565429, 0, 0.4313726, 1, 1,
0.2453624, -0.9821932, 3.059636, 0, 0.4235294, 1, 1,
0.2460083, 1.709233, -1.386616, 0, 0.4196078, 1, 1,
0.2467959, 0.9087197, 0.2642083, 0, 0.4117647, 1, 1,
0.2500483, 0.7924575, 0.3420522, 0, 0.4078431, 1, 1,
0.251586, 1.275175, -0.4306572, 0, 0.4, 1, 1,
0.2552653, 0.4558875, 1.104887, 0, 0.3921569, 1, 1,
0.2580307, -1.463952, 3.659712, 0, 0.3882353, 1, 1,
0.2644243, 0.5851104, -0.7061033, 0, 0.3803922, 1, 1,
0.2752988, -0.1410767, 1.934289, 0, 0.3764706, 1, 1,
0.2779182, 0.4145312, 1.217301, 0, 0.3686275, 1, 1,
0.281501, -0.1313152, 0.9081019, 0, 0.3647059, 1, 1,
0.283172, -0.1128806, 2.298131, 0, 0.3568628, 1, 1,
0.2869212, 0.4602372, 1.808394, 0, 0.3529412, 1, 1,
0.2879502, -0.4857297, 4.225407, 0, 0.345098, 1, 1,
0.2966017, 1.46413, 0.3251997, 0, 0.3411765, 1, 1,
0.3020096, -0.4976659, 2.37991, 0, 0.3333333, 1, 1,
0.3037719, 1.172146, 0.5218648, 0, 0.3294118, 1, 1,
0.3074512, -1.570337, 2.293175, 0, 0.3215686, 1, 1,
0.3078596, 0.6583086, 0.9585538, 0, 0.3176471, 1, 1,
0.3119223, 0.9731923, 0.572764, 0, 0.3098039, 1, 1,
0.312598, -0.5403891, 2.693389, 0, 0.3058824, 1, 1,
0.3170089, 1.411161, 0.6613449, 0, 0.2980392, 1, 1,
0.3195049, 0.9939211, 3.181676, 0, 0.2901961, 1, 1,
0.3240368, 0.1704401, -0.4740756, 0, 0.2862745, 1, 1,
0.3253115, -3.048004, 3.71149, 0, 0.2784314, 1, 1,
0.3261449, -1.689693, 2.105434, 0, 0.2745098, 1, 1,
0.3294056, -0.4447563, 3.765233, 0, 0.2666667, 1, 1,
0.3330939, 0.1347166, 2.121665, 0, 0.2627451, 1, 1,
0.3395773, -0.1038841, 1.846388, 0, 0.254902, 1, 1,
0.3428463, -0.4591759, 3.777087, 0, 0.2509804, 1, 1,
0.3450574, 0.2486218, 0.4474541, 0, 0.2431373, 1, 1,
0.353163, -0.4292122, -0.1049343, 0, 0.2392157, 1, 1,
0.3534812, 0.5156305, -0.1077065, 0, 0.2313726, 1, 1,
0.3554269, -0.9288933, 3.389399, 0, 0.227451, 1, 1,
0.3555125, 1.302711, -0.2099896, 0, 0.2196078, 1, 1,
0.3572179, 0.2837826, 0.9796736, 0, 0.2156863, 1, 1,
0.3587039, -0.9470131, 1.262954, 0, 0.2078431, 1, 1,
0.3588408, -1.520291, 3.821723, 0, 0.2039216, 1, 1,
0.3643585, 0.2340866, 0.2966942, 0, 0.1960784, 1, 1,
0.3690529, 0.2356776, -1.101674, 0, 0.1882353, 1, 1,
0.3693061, -0.3475718, 2.171869, 0, 0.1843137, 1, 1,
0.3705357, -1.586558, 3.621012, 0, 0.1764706, 1, 1,
0.3721312, -0.339617, 0.9785068, 0, 0.172549, 1, 1,
0.3724388, 1.170405, 0.1468236, 0, 0.1647059, 1, 1,
0.3745358, -0.3478503, 1.478135, 0, 0.1607843, 1, 1,
0.3800179, 1.074911, 1.534662, 0, 0.1529412, 1, 1,
0.3820882, -1.115174, 4.219925, 0, 0.1490196, 1, 1,
0.3866768, 0.2836597, 0.2141679, 0, 0.1411765, 1, 1,
0.3876795, -0.4403405, 3.538726, 0, 0.1372549, 1, 1,
0.3881583, -0.2598831, 2.281719, 0, 0.1294118, 1, 1,
0.3951109, -0.1495655, 2.334169, 0, 0.1254902, 1, 1,
0.3975905, -0.1019021, 3.216492, 0, 0.1176471, 1, 1,
0.3986771, -2.48202, 3.017934, 0, 0.1137255, 1, 1,
0.4008082, -0.4162057, 1.094304, 0, 0.1058824, 1, 1,
0.4012411, 0.9134939, 0.3571379, 0, 0.09803922, 1, 1,
0.4021547, -0.3936501, 1.448739, 0, 0.09411765, 1, 1,
0.40636, 1.358425, 0.894075, 0, 0.08627451, 1, 1,
0.4162738, -0.02982087, 4.814612, 0, 0.08235294, 1, 1,
0.4163464, 1.312513, 0.5177843, 0, 0.07450981, 1, 1,
0.4290248, 1.143627, 0.4440975, 0, 0.07058824, 1, 1,
0.430768, 2.550442, 1.59661, 0, 0.0627451, 1, 1,
0.4339939, -0.182814, 2.914141, 0, 0.05882353, 1, 1,
0.4360192, -0.1133918, 2.242883, 0, 0.05098039, 1, 1,
0.4382661, 0.6368679, -0.3770753, 0, 0.04705882, 1, 1,
0.4404081, -1.857466, 4.969417, 0, 0.03921569, 1, 1,
0.4426513, 2.145387, 0.9268799, 0, 0.03529412, 1, 1,
0.4438833, 0.04446246, -0.3071826, 0, 0.02745098, 1, 1,
0.4492845, 0.2087017, 0.7327887, 0, 0.02352941, 1, 1,
0.4505559, -0.7863401, 4.137191, 0, 0.01568628, 1, 1,
0.4513236, 0.3924496, 1.173658, 0, 0.01176471, 1, 1,
0.4547678, -0.6610865, 2.632036, 0, 0.003921569, 1, 1,
0.4560601, 0.02747132, -0.7013277, 0.003921569, 0, 1, 1,
0.4606952, -1.743356, 3.496772, 0.007843138, 0, 1, 1,
0.4658103, 0.7452015, -0.5459074, 0.01568628, 0, 1, 1,
0.4669838, -1.096981, 3.741162, 0.01960784, 0, 1, 1,
0.4670557, 0.6279392, 0.3618877, 0.02745098, 0, 1, 1,
0.4746327, -1.652636, 2.689193, 0.03137255, 0, 1, 1,
0.4827245, 0.2574354, -0.01195145, 0.03921569, 0, 1, 1,
0.4843622, -0.9664806, 0.9893546, 0.04313726, 0, 1, 1,
0.4900131, -0.8355908, 2.073964, 0.05098039, 0, 1, 1,
0.4929327, -1.066226, 1.991424, 0.05490196, 0, 1, 1,
0.497401, -1.068273, 3.73324, 0.0627451, 0, 1, 1,
0.4974182, 0.409632, 1.751136, 0.06666667, 0, 1, 1,
0.4982242, -0.5819305, 2.334741, 0.07450981, 0, 1, 1,
0.4991373, -0.803417, 3.362053, 0.07843138, 0, 1, 1,
0.4991717, 1.216766, 0.7296253, 0.08627451, 0, 1, 1,
0.5002426, 1.077475, 1.558089, 0.09019608, 0, 1, 1,
0.5085471, -0.8051318, 2.291388, 0.09803922, 0, 1, 1,
0.5105926, -0.9581302, 2.844179, 0.1058824, 0, 1, 1,
0.513146, -1.579255, 3.040752, 0.1098039, 0, 1, 1,
0.5140015, 0.2025249, 3.318656, 0.1176471, 0, 1, 1,
0.5161818, 0.1151043, -1.152426, 0.1215686, 0, 1, 1,
0.517142, 0.3014776, 1.030069, 0.1294118, 0, 1, 1,
0.5172662, 1.656909, -1.473073, 0.1333333, 0, 1, 1,
0.5190544, 0.397401, 1.681371, 0.1411765, 0, 1, 1,
0.5191383, 0.7719595, -0.3524307, 0.145098, 0, 1, 1,
0.5220813, -0.04460116, 0.4150676, 0.1529412, 0, 1, 1,
0.5232936, 0.3275269, 0.1085352, 0.1568628, 0, 1, 1,
0.5243189, -0.2491419, 2.497735, 0.1647059, 0, 1, 1,
0.5247338, 1.228829, -0.8160128, 0.1686275, 0, 1, 1,
0.5310058, -0.3603387, 1.348028, 0.1764706, 0, 1, 1,
0.5311858, 0.2260092, -0.1313445, 0.1803922, 0, 1, 1,
0.5365394, -0.3208864, 2.666598, 0.1882353, 0, 1, 1,
0.5383105, -0.006492865, 2.563984, 0.1921569, 0, 1, 1,
0.541039, -0.1021479, 4.660386, 0.2, 0, 1, 1,
0.5439433, 1.168426, 0.1700309, 0.2078431, 0, 1, 1,
0.548777, 1.637245, -1.113957, 0.2117647, 0, 1, 1,
0.5506963, -0.386917, 2.593832, 0.2196078, 0, 1, 1,
0.554224, 0.664341, 0.7290471, 0.2235294, 0, 1, 1,
0.559372, -0.2821539, 0.7912374, 0.2313726, 0, 1, 1,
0.5604278, 0.05112273, 1.424465, 0.2352941, 0, 1, 1,
0.5626796, -0.9377895, 1.990418, 0.2431373, 0, 1, 1,
0.563322, -1.548705, 3.221623, 0.2470588, 0, 1, 1,
0.5645686, -1.183925, 2.536938, 0.254902, 0, 1, 1,
0.5649397, -1.727811, 3.682413, 0.2588235, 0, 1, 1,
0.5857192, -0.06427921, 1.437228, 0.2666667, 0, 1, 1,
0.5919037, 0.2340747, 0.9836949, 0.2705882, 0, 1, 1,
0.5929602, -0.3403614, 2.248147, 0.2784314, 0, 1, 1,
0.5939294, -1.483045, 3.5531, 0.282353, 0, 1, 1,
0.5946206, 0.1397117, 0.9387813, 0.2901961, 0, 1, 1,
0.5961107, -0.5460432, 2.356758, 0.2941177, 0, 1, 1,
0.5976518, -0.6995281, 2.597341, 0.3019608, 0, 1, 1,
0.6000458, -0.7238231, 2.186429, 0.3098039, 0, 1, 1,
0.60154, -1.187811, 2.590885, 0.3137255, 0, 1, 1,
0.6022481, -0.6417028, 1.579537, 0.3215686, 0, 1, 1,
0.605988, 0.8493155, 1.942212, 0.3254902, 0, 1, 1,
0.6124005, -1.032914, 3.419562, 0.3333333, 0, 1, 1,
0.6150385, -1.066494, 3.062339, 0.3372549, 0, 1, 1,
0.6153722, -1.636434, 2.781139, 0.345098, 0, 1, 1,
0.6157976, -0.7185759, 2.303699, 0.3490196, 0, 1, 1,
0.6210154, -0.09260281, -1.83461, 0.3568628, 0, 1, 1,
0.6242523, 0.410677, 0.5710586, 0.3607843, 0, 1, 1,
0.6279658, 2.459879, 1.509731, 0.3686275, 0, 1, 1,
0.6320536, -0.08385504, 2.155902, 0.372549, 0, 1, 1,
0.6390896, 0.8135673, 0.584018, 0.3803922, 0, 1, 1,
0.6459793, 0.2224705, 1.672108, 0.3843137, 0, 1, 1,
0.6476887, -0.8060941, 1.932135, 0.3921569, 0, 1, 1,
0.6491159, -0.6944107, 3.014208, 0.3960784, 0, 1, 1,
0.6492126, -0.1920419, 2.604546, 0.4039216, 0, 1, 1,
0.6550469, -0.6682252, 2.34352, 0.4117647, 0, 1, 1,
0.6569692, 1.35816, 2.755489, 0.4156863, 0, 1, 1,
0.6588293, -0.4433023, 0.3391538, 0.4235294, 0, 1, 1,
0.660533, -0.4154915, 4.051505, 0.427451, 0, 1, 1,
0.6654034, -1.601461, 2.22376, 0.4352941, 0, 1, 1,
0.6714116, 0.09721027, 2.52731, 0.4392157, 0, 1, 1,
0.6739064, 0.1250842, 1.279815, 0.4470588, 0, 1, 1,
0.676959, 0.8066352, 1.027836, 0.4509804, 0, 1, 1,
0.6779017, 0.4344828, 1.658918, 0.4588235, 0, 1, 1,
0.6807266, 0.1226788, 0.8705441, 0.4627451, 0, 1, 1,
0.6823391, -1.606766, 3.467786, 0.4705882, 0, 1, 1,
0.6823692, 0.5512158, -0.3077921, 0.4745098, 0, 1, 1,
0.686366, -0.3644, 1.857767, 0.4823529, 0, 1, 1,
0.6889086, 2.707018, 2.468005, 0.4862745, 0, 1, 1,
0.6899118, -0.5652145, 2.379817, 0.4941176, 0, 1, 1,
0.6920945, -0.08256333, 1.459741, 0.5019608, 0, 1, 1,
0.7042201, -0.6454312, 2.448404, 0.5058824, 0, 1, 1,
0.7058712, -0.2329727, 1.787432, 0.5137255, 0, 1, 1,
0.7085971, 0.5090183, 0.01375523, 0.5176471, 0, 1, 1,
0.7117864, -0.1825897, 2.23891, 0.5254902, 0, 1, 1,
0.712976, -0.1535401, 1.919492, 0.5294118, 0, 1, 1,
0.7258021, 0.530118, 1.853841, 0.5372549, 0, 1, 1,
0.727017, -0.5423493, 1.032046, 0.5411765, 0, 1, 1,
0.7340475, 0.3072748, 3.22772, 0.5490196, 0, 1, 1,
0.7345833, -1.111704, 3.34681, 0.5529412, 0, 1, 1,
0.7366074, -0.6106507, 1.431283, 0.5607843, 0, 1, 1,
0.7445412, 1.649363, -0.06739961, 0.5647059, 0, 1, 1,
0.7461288, -0.152058, 0.4796249, 0.572549, 0, 1, 1,
0.7513645, 0.3606643, 0.6402647, 0.5764706, 0, 1, 1,
0.7551599, -0.5824049, 3.356087, 0.5843138, 0, 1, 1,
0.7604731, 0.5878876, 0.3199989, 0.5882353, 0, 1, 1,
0.7789342, -0.6454188, 4.809216, 0.5960785, 0, 1, 1,
0.7813583, 0.2250573, 3.01633, 0.6039216, 0, 1, 1,
0.7834659, 0.4465478, 1.248154, 0.6078432, 0, 1, 1,
0.7846528, -0.1883121, 2.417992, 0.6156863, 0, 1, 1,
0.7850558, -0.44733, 2.457262, 0.6196079, 0, 1, 1,
0.7885272, -0.07645346, 0.008753927, 0.627451, 0, 1, 1,
0.7922925, 0.1184343, 0.9120115, 0.6313726, 0, 1, 1,
0.7926571, 0.4438148, 1.357322, 0.6392157, 0, 1, 1,
0.7945998, -0.7753459, 4.171119, 0.6431373, 0, 1, 1,
0.8019521, -1.300653, 1.385344, 0.6509804, 0, 1, 1,
0.804488, 0.1883352, 1.795244, 0.654902, 0, 1, 1,
0.8087469, -0.5993603, 3.877223, 0.6627451, 0, 1, 1,
0.8129731, -0.8237755, 3.999892, 0.6666667, 0, 1, 1,
0.8130812, -0.7482656, 2.304254, 0.6745098, 0, 1, 1,
0.8143211, -0.6710569, 3.015493, 0.6784314, 0, 1, 1,
0.8210171, -1.161884, 1.289054, 0.6862745, 0, 1, 1,
0.8346155, 0.3889599, 0.6347308, 0.6901961, 0, 1, 1,
0.8384897, 0.3032618, 0.5962999, 0.6980392, 0, 1, 1,
0.8390908, 0.9050207, 1.34318, 0.7058824, 0, 1, 1,
0.8415357, -0.01558526, 0.5389471, 0.7098039, 0, 1, 1,
0.8464704, 0.1521257, 2.658013, 0.7176471, 0, 1, 1,
0.8473136, -1.139199, 1.60203, 0.7215686, 0, 1, 1,
0.8567785, -0.3600069, 1.217344, 0.7294118, 0, 1, 1,
0.858424, -0.675983, 0.7997864, 0.7333333, 0, 1, 1,
0.8613606, -1.462801, 4.151169, 0.7411765, 0, 1, 1,
0.8657595, 1.637318, 0.8200483, 0.7450981, 0, 1, 1,
0.8674821, -1.132935, 0.1831731, 0.7529412, 0, 1, 1,
0.8711087, 0.968381, 1.754561, 0.7568628, 0, 1, 1,
0.8773552, 1.353548, 1.303313, 0.7647059, 0, 1, 1,
0.8835437, -0.8599368, 2.905618, 0.7686275, 0, 1, 1,
0.8860071, 1.316779, -0.1462505, 0.7764706, 0, 1, 1,
0.887648, -0.5380201, 1.953388, 0.7803922, 0, 1, 1,
0.8886307, 0.6658971, 1.599421, 0.7882353, 0, 1, 1,
0.88916, 2.066606, 0.7734387, 0.7921569, 0, 1, 1,
0.8900455, -0.9717712, 1.356874, 0.8, 0, 1, 1,
0.8921875, -0.176534, 2.320791, 0.8078431, 0, 1, 1,
0.898132, 0.3506921, 2.773189, 0.8117647, 0, 1, 1,
0.9097767, 0.08641881, 0.2937131, 0.8196079, 0, 1, 1,
0.90988, 0.03266023, -0.6372206, 0.8235294, 0, 1, 1,
0.9114192, 0.3721595, 1.582029, 0.8313726, 0, 1, 1,
0.9144598, -0.2606364, 2.533799, 0.8352941, 0, 1, 1,
0.9149365, -2.035576, 2.765148, 0.8431373, 0, 1, 1,
0.9244153, 0.3766651, 0.08213365, 0.8470588, 0, 1, 1,
0.9268637, -0.6695818, 2.293729, 0.854902, 0, 1, 1,
0.9292453, 0.06557264, 0.3737185, 0.8588235, 0, 1, 1,
0.9310146, -0.6789042, 3.65967, 0.8666667, 0, 1, 1,
0.9336882, -0.09835302, 1.850495, 0.8705882, 0, 1, 1,
0.9358001, 2.430988, 1.91269, 0.8784314, 0, 1, 1,
0.9420447, 1.142634, 1.509181, 0.8823529, 0, 1, 1,
0.9432188, -1.585672, 0.7419169, 0.8901961, 0, 1, 1,
0.9468811, -0.4357777, 1.410321, 0.8941177, 0, 1, 1,
0.9472637, -1.484584, 1.261818, 0.9019608, 0, 1, 1,
0.9483921, -0.5547692, 2.852617, 0.9098039, 0, 1, 1,
0.9497335, -0.03632517, 2.662861, 0.9137255, 0, 1, 1,
0.9501918, 0.07401871, 1.531308, 0.9215686, 0, 1, 1,
0.9531136, -0.9221383, 1.580541, 0.9254902, 0, 1, 1,
0.961862, -0.1850044, 4.386912, 0.9333333, 0, 1, 1,
0.9635279, -0.07704142, 1.850104, 0.9372549, 0, 1, 1,
0.9642625, -1.075271, 1.588616, 0.945098, 0, 1, 1,
0.9726342, -0.8769612, 3.47792, 0.9490196, 0, 1, 1,
0.9746801, -1.023489, 3.427015, 0.9568627, 0, 1, 1,
0.9759446, -0.8738742, 0.5695657, 0.9607843, 0, 1, 1,
0.9783962, 0.1494514, 1.767808, 0.9686275, 0, 1, 1,
0.9799097, 0.8549709, 1.502769, 0.972549, 0, 1, 1,
0.9812046, -1.545906, 4.555747, 0.9803922, 0, 1, 1,
0.9869662, -0.03223817, 2.615325, 0.9843137, 0, 1, 1,
0.9879221, -0.3911709, 2.690132, 0.9921569, 0, 1, 1,
0.9963907, -0.7318878, 1.649181, 0.9960784, 0, 1, 1,
0.9967924, -0.9525544, 2.149385, 1, 0, 0.9960784, 1,
1.001919, 0.1342706, 1.906178, 1, 0, 0.9882353, 1,
1.015543, 1.090915, -0.5440874, 1, 0, 0.9843137, 1,
1.01871, -0.4010488, 0.1699067, 1, 0, 0.9764706, 1,
1.019594, -0.5158308, 2.305495, 1, 0, 0.972549, 1,
1.020512, 0.1980886, 3.273833, 1, 0, 0.9647059, 1,
1.021588, -0.9662465, 3.583647, 1, 0, 0.9607843, 1,
1.022579, -0.5056703, -0.09816511, 1, 0, 0.9529412, 1,
1.030257, 0.0330408, 3.776057, 1, 0, 0.9490196, 1,
1.032979, 0.4617177, -0.08858057, 1, 0, 0.9411765, 1,
1.038516, -0.8984984, 1.176636, 1, 0, 0.9372549, 1,
1.043158, -0.2282683, 0.9804569, 1, 0, 0.9294118, 1,
1.043808, 0.5952979, 0.9937514, 1, 0, 0.9254902, 1,
1.050234, 0.07203894, 0.8084168, 1, 0, 0.9176471, 1,
1.070225, 1.042496, 1.268702, 1, 0, 0.9137255, 1,
1.070305, 1.109882, 0.9265755, 1, 0, 0.9058824, 1,
1.071083, -1.449905, 1.046952, 1, 0, 0.9019608, 1,
1.072391, 0.5197305, 1.474801, 1, 0, 0.8941177, 1,
1.074225, 0.1870084, 0.5862571, 1, 0, 0.8862745, 1,
1.07627, -1.001914, 2.879256, 1, 0, 0.8823529, 1,
1.083961, -0.2558018, 2.291098, 1, 0, 0.8745098, 1,
1.089089, -1.185442, 2.007395, 1, 0, 0.8705882, 1,
1.090274, 0.82154, 2.067708, 1, 0, 0.8627451, 1,
1.093532, -0.4339861, 2.131876, 1, 0, 0.8588235, 1,
1.101034, -1.052431, 3.412103, 1, 0, 0.8509804, 1,
1.109329, -0.558019, 0.3556311, 1, 0, 0.8470588, 1,
1.110016, 0.1912099, 0.6986012, 1, 0, 0.8392157, 1,
1.124424, 1.895357, 0.9379136, 1, 0, 0.8352941, 1,
1.125964, 1.4138, 0.8223851, 1, 0, 0.827451, 1,
1.128545, 1.334905, 1.746662, 1, 0, 0.8235294, 1,
1.131686, -0.1678535, 2.345171, 1, 0, 0.8156863, 1,
1.142528, -1.217276, 2.881265, 1, 0, 0.8117647, 1,
1.145906, -0.008418676, 1.77149, 1, 0, 0.8039216, 1,
1.147736, -0.9403593, 2.48784, 1, 0, 0.7960784, 1,
1.148223, 0.8976258, 0.9706228, 1, 0, 0.7921569, 1,
1.15915, 0.6453698, 1.763681, 1, 0, 0.7843137, 1,
1.165513, 0.4224568, 0.297674, 1, 0, 0.7803922, 1,
1.171547, 1.217524, 1.505914, 1, 0, 0.772549, 1,
1.177387, 0.2079115, 0.2333567, 1, 0, 0.7686275, 1,
1.183253, 1.168054, -0.6067987, 1, 0, 0.7607843, 1,
1.190819, -0.4868043, 1.028533, 1, 0, 0.7568628, 1,
1.192277, 0.435748, 3.071982, 1, 0, 0.7490196, 1,
1.192329, 0.6830114, 2.236909, 1, 0, 0.7450981, 1,
1.197616, -0.6467431, 1.706154, 1, 0, 0.7372549, 1,
1.214768, -0.8686994, 2.089028, 1, 0, 0.7333333, 1,
1.215569, 1.185905, 0.2833201, 1, 0, 0.7254902, 1,
1.219494, 2.006338, 0.3419419, 1, 0, 0.7215686, 1,
1.221474, 1.937758, 0.7022967, 1, 0, 0.7137255, 1,
1.225878, 0.457366, 2.335355, 1, 0, 0.7098039, 1,
1.243359, -0.2973648, 2.075044, 1, 0, 0.7019608, 1,
1.245928, -0.7427852, 1.847327, 1, 0, 0.6941177, 1,
1.24772, 1.291666, 0.5702205, 1, 0, 0.6901961, 1,
1.252512, -0.4387856, 2.207322, 1, 0, 0.682353, 1,
1.265967, -0.2974529, 2.008961, 1, 0, 0.6784314, 1,
1.266517, 1.083353, 1.252254, 1, 0, 0.6705883, 1,
1.268689, 0.3941762, -0.1925413, 1, 0, 0.6666667, 1,
1.274574, 1.129402, 1.617877, 1, 0, 0.6588235, 1,
1.275956, 0.8416314, 0.8304581, 1, 0, 0.654902, 1,
1.278077, 0.83044, -1.516941, 1, 0, 0.6470588, 1,
1.281071, -0.2457851, 2.398667, 1, 0, 0.6431373, 1,
1.287899, 1.443934, 0.5545052, 1, 0, 0.6352941, 1,
1.289334, 0.9998201, -0.1638586, 1, 0, 0.6313726, 1,
1.290143, -0.1042638, 2.054705, 1, 0, 0.6235294, 1,
1.293396, -1.197429, 3.26546, 1, 0, 0.6196079, 1,
1.302812, -0.7513769, 3.284326, 1, 0, 0.6117647, 1,
1.310424, -0.9911585, 0.7493795, 1, 0, 0.6078432, 1,
1.317299, -0.5492924, 0.3603773, 1, 0, 0.6, 1,
1.354913, 0.901123, -0.08312938, 1, 0, 0.5921569, 1,
1.379844, -0.2049176, 1.60549, 1, 0, 0.5882353, 1,
1.387269, -0.9952339, 3.283455, 1, 0, 0.5803922, 1,
1.389186, 0.5448836, 1.414062, 1, 0, 0.5764706, 1,
1.395347, -0.9135398, 2.992765, 1, 0, 0.5686275, 1,
1.397184, 0.09267935, 1.09259, 1, 0, 0.5647059, 1,
1.402538, -0.3822043, 2.323658, 1, 0, 0.5568628, 1,
1.405743, 0.6357593, 0.4041379, 1, 0, 0.5529412, 1,
1.413559, -1.97179, 2.976984, 1, 0, 0.5450981, 1,
1.420332, -0.7352335, 1.690162, 1, 0, 0.5411765, 1,
1.421815, 0.5073574, 0.902433, 1, 0, 0.5333334, 1,
1.441811, 0.7068376, -0.2192758, 1, 0, 0.5294118, 1,
1.447214, 1.11333, 2.081569, 1, 0, 0.5215687, 1,
1.455761, 0.01964328, 0.4592933, 1, 0, 0.5176471, 1,
1.459929, -0.9246708, 2.784933, 1, 0, 0.509804, 1,
1.463961, 0.9925067, 0.9682536, 1, 0, 0.5058824, 1,
1.476753, -1.164182, 4.153056, 1, 0, 0.4980392, 1,
1.483801, 0.6292607, 1.004901, 1, 0, 0.4901961, 1,
1.488568, 0.08786803, 1.843899, 1, 0, 0.4862745, 1,
1.488876, 0.1661903, 0.4984849, 1, 0, 0.4784314, 1,
1.498027, -0.3527984, 1.077599, 1, 0, 0.4745098, 1,
1.500856, -0.0983518, 1.051181, 1, 0, 0.4666667, 1,
1.507139, -1.606163, 2.550163, 1, 0, 0.4627451, 1,
1.508118, -0.2924834, 1.467942, 1, 0, 0.454902, 1,
1.510502, -0.3245061, 2.87194, 1, 0, 0.4509804, 1,
1.515178, 0.02405644, 3.971241, 1, 0, 0.4431373, 1,
1.515336, -0.8575289, 2.631868, 1, 0, 0.4392157, 1,
1.520963, 2.219155, 0.1896798, 1, 0, 0.4313726, 1,
1.525152, 0.9166684, 0.9456643, 1, 0, 0.427451, 1,
1.53502, -0.2999609, 1.734512, 1, 0, 0.4196078, 1,
1.544919, 0.6972055, 1.229428, 1, 0, 0.4156863, 1,
1.547278, 0.5094014, 1.337374, 1, 0, 0.4078431, 1,
1.548367, -0.5901628, 1.561499, 1, 0, 0.4039216, 1,
1.550911, 0.2298931, 2.980001, 1, 0, 0.3960784, 1,
1.552042, -1.751957, 1.303915, 1, 0, 0.3882353, 1,
1.553689, 0.1470541, 2.708522, 1, 0, 0.3843137, 1,
1.56522, 0.4833974, 0.9377514, 1, 0, 0.3764706, 1,
1.58143, 1.3158, 0.8373139, 1, 0, 0.372549, 1,
1.584171, 0.8165671, 3.695306, 1, 0, 0.3647059, 1,
1.586351, 0.1587857, 1.650219, 1, 0, 0.3607843, 1,
1.601825, 0.522177, 2.00957, 1, 0, 0.3529412, 1,
1.603207, 1.974172, 0.9724464, 1, 0, 0.3490196, 1,
1.607447, -0.5749701, 2.643197, 1, 0, 0.3411765, 1,
1.61652, -0.1267573, 1.304866, 1, 0, 0.3372549, 1,
1.619203, 1.555224, 1.174495, 1, 0, 0.3294118, 1,
1.62642, -1.239897, 4.227316, 1, 0, 0.3254902, 1,
1.627337, 0.1741328, 1.878476, 1, 0, 0.3176471, 1,
1.629435, -0.2174903, 2.70987, 1, 0, 0.3137255, 1,
1.633882, -0.001277837, 1.519536, 1, 0, 0.3058824, 1,
1.641893, 1.239644, 0.5631232, 1, 0, 0.2980392, 1,
1.642359, 1.435452, 0.8019017, 1, 0, 0.2941177, 1,
1.649117, 0.2621, -0.9100454, 1, 0, 0.2862745, 1,
1.67144, -0.04794734, 0.1668554, 1, 0, 0.282353, 1,
1.67379, -0.4427252, 1.174681, 1, 0, 0.2745098, 1,
1.700339, -0.2494456, 1.77006, 1, 0, 0.2705882, 1,
1.701403, -0.2581006, 1.555598, 1, 0, 0.2627451, 1,
1.722165, 0.7348911, -0.6395264, 1, 0, 0.2588235, 1,
1.737919, -1.022157, 0.9965695, 1, 0, 0.2509804, 1,
1.761756, -0.6272721, 1.942828, 1, 0, 0.2470588, 1,
1.774315, -1.319929, 1.224699, 1, 0, 0.2392157, 1,
1.776131, -1.163789, 0.7388567, 1, 0, 0.2352941, 1,
1.777524, -0.04782233, 2.036442, 1, 0, 0.227451, 1,
1.792425, 0.4057866, 1.305741, 1, 0, 0.2235294, 1,
1.810675, 0.7842254, 2.502571, 1, 0, 0.2156863, 1,
1.854439, -2.5748, 2.16546, 1, 0, 0.2117647, 1,
1.865838, 0.01292712, 1.888187, 1, 0, 0.2039216, 1,
1.870142, 0.232335, 2.679604, 1, 0, 0.1960784, 1,
1.878602, -0.1189725, 1.633161, 1, 0, 0.1921569, 1,
1.895487, 1.188885, 1.869358, 1, 0, 0.1843137, 1,
1.89826, 0.5146379, 0.5107575, 1, 0, 0.1803922, 1,
1.899328, 0.6163468, 0.9169335, 1, 0, 0.172549, 1,
1.9324, 0.01985897, 2.361732, 1, 0, 0.1686275, 1,
1.964505, 0.1755193, 3.113453, 1, 0, 0.1607843, 1,
2.024057, 0.1729849, 1.613196, 1, 0, 0.1568628, 1,
2.049983, -0.7659257, 1.670433, 1, 0, 0.1490196, 1,
2.059129, 0.03449233, 0.9967296, 1, 0, 0.145098, 1,
2.061004, 0.7637786, -0.2677619, 1, 0, 0.1372549, 1,
2.063083, 1.547669, 1.303753, 1, 0, 0.1333333, 1,
2.09359, -0.324063, 0.9386024, 1, 0, 0.1254902, 1,
2.094675, -1.201058, 1.708585, 1, 0, 0.1215686, 1,
2.1013, -0.05094106, 3.063143, 1, 0, 0.1137255, 1,
2.121598, 0.7021602, 0.7020695, 1, 0, 0.1098039, 1,
2.131145, 0.1457487, 1.056146, 1, 0, 0.1019608, 1,
2.137221, -0.5313609, 1.876131, 1, 0, 0.09411765, 1,
2.196556, -1.353217, 1.864426, 1, 0, 0.09019608, 1,
2.208322, 1.567796, 2.288822, 1, 0, 0.08235294, 1,
2.228977, -1.883237, 2.504327, 1, 0, 0.07843138, 1,
2.22926, 1.188701, -0.306618, 1, 0, 0.07058824, 1,
2.267917, 0.3028118, 1.069953, 1, 0, 0.06666667, 1,
2.30757, -0.3023014, 1.384272, 1, 0, 0.05882353, 1,
2.348945, 1.162886, 2.92557, 1, 0, 0.05490196, 1,
2.368673, -1.675131, 2.396019, 1, 0, 0.04705882, 1,
2.440359, 0.9875401, 1.766626, 1, 0, 0.04313726, 1,
2.51199, 1.997162, 2.19387, 1, 0, 0.03529412, 1,
2.753449, -1.850874, 3.238049, 1, 0, 0.03137255, 1,
2.89647, 1.415668, 2.686352, 1, 0, 0.02352941, 1,
3.010085, -0.7867707, 2.518705, 1, 0, 0.01960784, 1,
3.055479, -0.6892993, 1.621263, 1, 0, 0.01176471, 1,
3.156051, -0.5367427, 1.653311, 1, 0, 0.007843138, 1
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
0.1229904, -4.023481, -7.474456, 0, -0.5, 0.5, 0.5,
0.1229904, -4.023481, -7.474456, 1, -0.5, 0.5, 0.5,
0.1229904, -4.023481, -7.474456, 1, 1.5, 0.5, 0.5,
0.1229904, -4.023481, -7.474456, 0, 1.5, 0.5, 0.5
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
-3.938278, -0.1704931, -7.474456, 0, -0.5, 0.5, 0.5,
-3.938278, -0.1704931, -7.474456, 1, -0.5, 0.5, 0.5,
-3.938278, -0.1704931, -7.474456, 1, 1.5, 0.5, 0.5,
-3.938278, -0.1704931, -7.474456, 0, 1.5, 0.5, 0.5
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
-3.938278, -4.023481, -0.3507514, 0, -0.5, 0.5, 0.5,
-3.938278, -4.023481, -0.3507514, 1, -0.5, 0.5, 0.5,
-3.938278, -4.023481, -0.3507514, 1, 1.5, 0.5, 0.5,
-3.938278, -4.023481, -0.3507514, 0, 1.5, 0.5, 0.5
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
-2, -3.13433, -5.830524,
3, -3.13433, -5.830524,
-2, -3.13433, -5.830524,
-2, -3.282521, -6.104513,
-1, -3.13433, -5.830524,
-1, -3.282521, -6.104513,
0, -3.13433, -5.830524,
0, -3.282521, -6.104513,
1, -3.13433, -5.830524,
1, -3.282521, -6.104513,
2, -3.13433, -5.830524,
2, -3.282521, -6.104513,
3, -3.13433, -5.830524,
3, -3.282521, -6.104513
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
-2, -3.578905, -6.652491, 0, -0.5, 0.5, 0.5,
-2, -3.578905, -6.652491, 1, -0.5, 0.5, 0.5,
-2, -3.578905, -6.652491, 1, 1.5, 0.5, 0.5,
-2, -3.578905, -6.652491, 0, 1.5, 0.5, 0.5,
-1, -3.578905, -6.652491, 0, -0.5, 0.5, 0.5,
-1, -3.578905, -6.652491, 1, -0.5, 0.5, 0.5,
-1, -3.578905, -6.652491, 1, 1.5, 0.5, 0.5,
-1, -3.578905, -6.652491, 0, 1.5, 0.5, 0.5,
0, -3.578905, -6.652491, 0, -0.5, 0.5, 0.5,
0, -3.578905, -6.652491, 1, -0.5, 0.5, 0.5,
0, -3.578905, -6.652491, 1, 1.5, 0.5, 0.5,
0, -3.578905, -6.652491, 0, 1.5, 0.5, 0.5,
1, -3.578905, -6.652491, 0, -0.5, 0.5, 0.5,
1, -3.578905, -6.652491, 1, -0.5, 0.5, 0.5,
1, -3.578905, -6.652491, 1, 1.5, 0.5, 0.5,
1, -3.578905, -6.652491, 0, 1.5, 0.5, 0.5,
2, -3.578905, -6.652491, 0, -0.5, 0.5, 0.5,
2, -3.578905, -6.652491, 1, -0.5, 0.5, 0.5,
2, -3.578905, -6.652491, 1, 1.5, 0.5, 0.5,
2, -3.578905, -6.652491, 0, 1.5, 0.5, 0.5,
3, -3.578905, -6.652491, 0, -0.5, 0.5, 0.5,
3, -3.578905, -6.652491, 1, -0.5, 0.5, 0.5,
3, -3.578905, -6.652491, 1, 1.5, 0.5, 0.5,
3, -3.578905, -6.652491, 0, 1.5, 0.5, 0.5
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
-3.001062, -3, -5.830524,
-3.001062, 2, -5.830524,
-3.001062, -3, -5.830524,
-3.157265, -3, -6.104513,
-3.001062, -2, -5.830524,
-3.157265, -2, -6.104513,
-3.001062, -1, -5.830524,
-3.157265, -1, -6.104513,
-3.001062, 0, -5.830524,
-3.157265, 0, -6.104513,
-3.001062, 1, -5.830524,
-3.157265, 1, -6.104513,
-3.001062, 2, -5.830524,
-3.157265, 2, -6.104513
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
-3.46967, -3, -6.652491, 0, -0.5, 0.5, 0.5,
-3.46967, -3, -6.652491, 1, -0.5, 0.5, 0.5,
-3.46967, -3, -6.652491, 1, 1.5, 0.5, 0.5,
-3.46967, -3, -6.652491, 0, 1.5, 0.5, 0.5,
-3.46967, -2, -6.652491, 0, -0.5, 0.5, 0.5,
-3.46967, -2, -6.652491, 1, -0.5, 0.5, 0.5,
-3.46967, -2, -6.652491, 1, 1.5, 0.5, 0.5,
-3.46967, -2, -6.652491, 0, 1.5, 0.5, 0.5,
-3.46967, -1, -6.652491, 0, -0.5, 0.5, 0.5,
-3.46967, -1, -6.652491, 1, -0.5, 0.5, 0.5,
-3.46967, -1, -6.652491, 1, 1.5, 0.5, 0.5,
-3.46967, -1, -6.652491, 0, 1.5, 0.5, 0.5,
-3.46967, 0, -6.652491, 0, -0.5, 0.5, 0.5,
-3.46967, 0, -6.652491, 1, -0.5, 0.5, 0.5,
-3.46967, 0, -6.652491, 1, 1.5, 0.5, 0.5,
-3.46967, 0, -6.652491, 0, 1.5, 0.5, 0.5,
-3.46967, 1, -6.652491, 0, -0.5, 0.5, 0.5,
-3.46967, 1, -6.652491, 1, -0.5, 0.5, 0.5,
-3.46967, 1, -6.652491, 1, 1.5, 0.5, 0.5,
-3.46967, 1, -6.652491, 0, 1.5, 0.5, 0.5,
-3.46967, 2, -6.652491, 0, -0.5, 0.5, 0.5,
-3.46967, 2, -6.652491, 1, -0.5, 0.5, 0.5,
-3.46967, 2, -6.652491, 1, 1.5, 0.5, 0.5,
-3.46967, 2, -6.652491, 0, 1.5, 0.5, 0.5
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
-3.001062, -3.13433, -4,
-3.001062, -3.13433, 4,
-3.001062, -3.13433, -4,
-3.157265, -3.282521, -4,
-3.001062, -3.13433, -2,
-3.157265, -3.282521, -2,
-3.001062, -3.13433, 0,
-3.157265, -3.282521, 0,
-3.001062, -3.13433, 2,
-3.157265, -3.282521, 2,
-3.001062, -3.13433, 4,
-3.157265, -3.282521, 4
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
-3.46967, -3.578905, -4, 0, -0.5, 0.5, 0.5,
-3.46967, -3.578905, -4, 1, -0.5, 0.5, 0.5,
-3.46967, -3.578905, -4, 1, 1.5, 0.5, 0.5,
-3.46967, -3.578905, -4, 0, 1.5, 0.5, 0.5,
-3.46967, -3.578905, -2, 0, -0.5, 0.5, 0.5,
-3.46967, -3.578905, -2, 1, -0.5, 0.5, 0.5,
-3.46967, -3.578905, -2, 1, 1.5, 0.5, 0.5,
-3.46967, -3.578905, -2, 0, 1.5, 0.5, 0.5,
-3.46967, -3.578905, 0, 0, -0.5, 0.5, 0.5,
-3.46967, -3.578905, 0, 1, -0.5, 0.5, 0.5,
-3.46967, -3.578905, 0, 1, 1.5, 0.5, 0.5,
-3.46967, -3.578905, 0, 0, 1.5, 0.5, 0.5,
-3.46967, -3.578905, 2, 0, -0.5, 0.5, 0.5,
-3.46967, -3.578905, 2, 1, -0.5, 0.5, 0.5,
-3.46967, -3.578905, 2, 1, 1.5, 0.5, 0.5,
-3.46967, -3.578905, 2, 0, 1.5, 0.5, 0.5,
-3.46967, -3.578905, 4, 0, -0.5, 0.5, 0.5,
-3.46967, -3.578905, 4, 1, -0.5, 0.5, 0.5,
-3.46967, -3.578905, 4, 1, 1.5, 0.5, 0.5,
-3.46967, -3.578905, 4, 0, 1.5, 0.5, 0.5
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
-3.001062, -3.13433, -5.830524,
-3.001062, 2.793344, -5.830524,
-3.001062, -3.13433, 5.129022,
-3.001062, 2.793344, 5.129022,
-3.001062, -3.13433, -5.830524,
-3.001062, -3.13433, 5.129022,
-3.001062, 2.793344, -5.830524,
-3.001062, 2.793344, 5.129022,
-3.001062, -3.13433, -5.830524,
3.247043, -3.13433, -5.830524,
-3.001062, -3.13433, 5.129022,
3.247043, -3.13433, 5.129022,
-3.001062, 2.793344, -5.830524,
3.247043, 2.793344, -5.830524,
-3.001062, 2.793344, 5.129022,
3.247043, 2.793344, 5.129022,
3.247043, -3.13433, -5.830524,
3.247043, 2.793344, -5.830524,
3.247043, -3.13433, 5.129022,
3.247043, 2.793344, 5.129022,
3.247043, -3.13433, -5.830524,
3.247043, -3.13433, 5.129022,
3.247043, 2.793344, -5.830524,
3.247043, 2.793344, 5.129022
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
var radius = 7.443003;
var distance = 33.11476;
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
mvMatrix.translate( -0.1229904, 0.1704931, 0.3507514 );
mvMatrix.scale( 1.287994, 1.357619, 0.7342933 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.11476);
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
edifenphos<-read.table("edifenphos.xyz")
```

```
## Error in read.table("edifenphos.xyz"): no lines available in input
```

```r
x<-edifenphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
y<-edifenphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
```

```r
z<-edifenphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'edifenphos' not found
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
-2.91007, -0.1503806, -0.8436126, 0, 0, 1, 1, 1,
-2.832839, 0.1571179, -2.232924, 1, 0, 0, 1, 1,
-2.755483, 0.2778615, -1.217854, 1, 0, 0, 1, 1,
-2.557567, -2.604939, -2.032322, 1, 0, 0, 1, 1,
-2.544287, -0.5132382, -2.995536, 1, 0, 0, 1, 1,
-2.499599, 0.5313063, 0.8254914, 1, 0, 0, 1, 1,
-2.40558, 1.224697, -0.6076773, 0, 0, 0, 1, 1,
-2.40148, -1.162027, -1.776828, 0, 0, 0, 1, 1,
-2.395823, 1.096268, -1.578636, 0, 0, 0, 1, 1,
-2.322158, -0.8909637, -1.719429, 0, 0, 0, 1, 1,
-2.314696, 0.1802638, -2.039345, 0, 0, 0, 1, 1,
-2.300981, -0.3044003, -1.082882, 0, 0, 0, 1, 1,
-2.242649, 0.8829039, -1.104722, 0, 0, 0, 1, 1,
-2.208472, -0.4951077, -3.088211, 1, 1, 1, 1, 1,
-2.196973, 1.419617, -1.22956, 1, 1, 1, 1, 1,
-2.18221, 0.3892004, -2.442675, 1, 1, 1, 1, 1,
-2.177774, 0.4643029, -1.039923, 1, 1, 1, 1, 1,
-2.147315, 0.9466188, -0.4860508, 1, 1, 1, 1, 1,
-2.106194, 1.8793, -1.504431, 1, 1, 1, 1, 1,
-2.083882, -0.9251331, -2.136692, 1, 1, 1, 1, 1,
-2.074738, -0.01657672, -1.61013, 1, 1, 1, 1, 1,
-2.025342, 0.4501167, -0.4517604, 1, 1, 1, 1, 1,
-1.993958, 0.147506, -0.6944867, 1, 1, 1, 1, 1,
-1.992, 0.1775027, -1.015476, 1, 1, 1, 1, 1,
-1.983699, 1.630031, -1.545598, 1, 1, 1, 1, 1,
-1.980309, -0.3698593, -0.9117039, 1, 1, 1, 1, 1,
-1.970729, 0.0833207, -0.3965946, 1, 1, 1, 1, 1,
-1.941456, -0.4605778, -1.374807, 1, 1, 1, 1, 1,
-1.940339, -0.2677332, -1.795368, 0, 0, 1, 1, 1,
-1.91486, 1.735401, 0.04156308, 1, 0, 0, 1, 1,
-1.911477, -1.586355, -1.013684, 1, 0, 0, 1, 1,
-1.894109, -0.181991, -3.05108, 1, 0, 0, 1, 1,
-1.887175, 0.3682996, -0.5408326, 1, 0, 0, 1, 1,
-1.867195, -0.131217, -2.499405, 1, 0, 0, 1, 1,
-1.836468, 1.470991, -1.861149, 0, 0, 0, 1, 1,
-1.832036, -1.305501, -2.816204, 0, 0, 0, 1, 1,
-1.823656, -1.127492, -1.335963, 0, 0, 0, 1, 1,
-1.819444, 1.211148, -3.873743, 0, 0, 0, 1, 1,
-1.814099, -0.9154276, -0.7535524, 0, 0, 0, 1, 1,
-1.813608, -0.06023595, -1.61245, 0, 0, 0, 1, 1,
-1.782004, -0.7182887, -1.664743, 0, 0, 0, 1, 1,
-1.768741, -0.9457462, -2.023787, 1, 1, 1, 1, 1,
-1.768057, 0.09312093, -3.092089, 1, 1, 1, 1, 1,
-1.752155, 0.4922768, -3.334328, 1, 1, 1, 1, 1,
-1.749896, 0.9599956, -1.883081, 1, 1, 1, 1, 1,
-1.740318, -0.370621, -1.032509, 1, 1, 1, 1, 1,
-1.729192, 0.9691233, -1.774073, 1, 1, 1, 1, 1,
-1.71957, 0.006970201, 0.09924904, 1, 1, 1, 1, 1,
-1.71567, -0.2643165, -2.970569, 1, 1, 1, 1, 1,
-1.702463, -0.09040235, -1.344181, 1, 1, 1, 1, 1,
-1.677201, 1.165635, -2.076978, 1, 1, 1, 1, 1,
-1.669416, -0.7987512, -2.83322, 1, 1, 1, 1, 1,
-1.648514, 0.4556125, -2.194681, 1, 1, 1, 1, 1,
-1.610928, 0.9019282, -0.7046059, 1, 1, 1, 1, 1,
-1.609743, 0.3236424, -1.065897, 1, 1, 1, 1, 1,
-1.609089, -0.3412427, -1.939426, 1, 1, 1, 1, 1,
-1.580502, -0.5051173, -2.148823, 0, 0, 1, 1, 1,
-1.565429, -0.01951578, -2.251267, 1, 0, 0, 1, 1,
-1.559741, -0.7513043, -1.206105, 1, 0, 0, 1, 1,
-1.554951, -1.435344, -3.161559, 1, 0, 0, 1, 1,
-1.531157, -1.078534, -2.750877, 1, 0, 0, 1, 1,
-1.524227, 1.01372, -1.40614, 1, 0, 0, 1, 1,
-1.506329, 0.7534815, -0.1142293, 0, 0, 0, 1, 1,
-1.495764, -0.1714247, -2.497107, 0, 0, 0, 1, 1,
-1.495686, -1.450842, -1.603621, 0, 0, 0, 1, 1,
-1.494702, -0.9492658, -0.7001458, 0, 0, 0, 1, 1,
-1.491699, 0.08802504, -1.669858, 0, 0, 0, 1, 1,
-1.484635, 2.68313, -0.5470243, 0, 0, 0, 1, 1,
-1.477552, -0.495505, -4.426479, 0, 0, 0, 1, 1,
-1.468823, -1.162032, -1.165989, 1, 1, 1, 1, 1,
-1.464097, -0.7745587, -2.990554, 1, 1, 1, 1, 1,
-1.46102, 0.5630815, -1.65625, 1, 1, 1, 1, 1,
-1.438126, -1.050114, -1.03718, 1, 1, 1, 1, 1,
-1.437742, 1.24277, 1.028873, 1, 1, 1, 1, 1,
-1.425249, -0.03745755, -1.319941, 1, 1, 1, 1, 1,
-1.403701, -0.3198438, -0.761741, 1, 1, 1, 1, 1,
-1.384084, -0.6856299, -2.998014, 1, 1, 1, 1, 1,
-1.379419, 1.876323, -0.7252072, 1, 1, 1, 1, 1,
-1.375587, 0.8131503, -0.3638181, 1, 1, 1, 1, 1,
-1.340521, -2.926553, -4.383438, 1, 1, 1, 1, 1,
-1.328013, 0.06487988, -1.976379, 1, 1, 1, 1, 1,
-1.327528, -1.109904, -4.090872, 1, 1, 1, 1, 1,
-1.32594, -1.738098, -2.889402, 1, 1, 1, 1, 1,
-1.322961, -1.090366, -3.295621, 1, 1, 1, 1, 1,
-1.322363, -0.2138255, -2.102504, 0, 0, 1, 1, 1,
-1.322225, 0.6183261, -2.142608, 1, 0, 0, 1, 1,
-1.309035, -1.394902, -0.953287, 1, 0, 0, 1, 1,
-1.30634, 1.056901, 0.7989221, 1, 0, 0, 1, 1,
-1.294582, 0.7870806, -2.609604, 1, 0, 0, 1, 1,
-1.284003, -0.1391415, -1.520758, 1, 0, 0, 1, 1,
-1.280426, -0.8024469, -1.051517, 0, 0, 0, 1, 1,
-1.257012, -0.7880015, -1.807231, 0, 0, 0, 1, 1,
-1.247474, 0.7647113, -0.363896, 0, 0, 0, 1, 1,
-1.235917, 0.2371377, -1.552295, 0, 0, 0, 1, 1,
-1.233631, -1.494572, -2.265599, 0, 0, 0, 1, 1,
-1.233439, -0.2687374, -1.668865, 0, 0, 0, 1, 1,
-1.23069, 0.5232156, -2.953518, 0, 0, 0, 1, 1,
-1.2281, 0.1914175, -1.508754, 1, 1, 1, 1, 1,
-1.226817, -1.471997, -2.829745, 1, 1, 1, 1, 1,
-1.223391, -0.1918726, -2.664403, 1, 1, 1, 1, 1,
-1.213948, 1.174095, -2.052144, 1, 1, 1, 1, 1,
-1.208885, -1.047167, -2.364406, 1, 1, 1, 1, 1,
-1.201569, 1.025202, 1.186155, 1, 1, 1, 1, 1,
-1.185689, 1.420446, -1.383082, 1, 1, 1, 1, 1,
-1.179263, -1.885333, -1.680871, 1, 1, 1, 1, 1,
-1.17154, -0.003883117, -3.676254, 1, 1, 1, 1, 1,
-1.169866, 1.683454, 0.1212966, 1, 1, 1, 1, 1,
-1.165953, 0.5800473, -0.9854829, 1, 1, 1, 1, 1,
-1.161555, -0.6767459, -2.582852, 1, 1, 1, 1, 1,
-1.155434, -1.328018, -0.1693206, 1, 1, 1, 1, 1,
-1.150766, -0.3949522, -2.147619, 1, 1, 1, 1, 1,
-1.147263, -0.6283114, -1.704102, 1, 1, 1, 1, 1,
-1.144498, 1.125391, 0.2190347, 0, 0, 1, 1, 1,
-1.137221, -1.359323, -0.242738, 1, 0, 0, 1, 1,
-1.136301, 0.2506462, -1.472715, 1, 0, 0, 1, 1,
-1.134552, -1.100055, -1.727885, 1, 0, 0, 1, 1,
-1.132376, 0.3323644, -1.276033, 1, 0, 0, 1, 1,
-1.129076, -1.851278, -2.618744, 1, 0, 0, 1, 1,
-1.124159, 0.9690798, 0.78289, 0, 0, 0, 1, 1,
-1.122167, -1.043168, -2.629804, 0, 0, 0, 1, 1,
-1.120137, -0.4865144, -3.327788, 0, 0, 0, 1, 1,
-1.119514, 0.5039384, 0.1206482, 0, 0, 0, 1, 1,
-1.116411, -1.203819, -3.643293, 0, 0, 0, 1, 1,
-1.11287, 1.11466, -0.02325865, 0, 0, 0, 1, 1,
-1.109836, 1.52273, -1.00867, 0, 0, 0, 1, 1,
-1.107753, -0.6842833, -1.256973, 1, 1, 1, 1, 1,
-1.088877, 0.2244901, -1.271722, 1, 1, 1, 1, 1,
-1.085327, -0.1478219, -1.32098, 1, 1, 1, 1, 1,
-1.082368, -0.2468394, -4.153965, 1, 1, 1, 1, 1,
-1.081871, 0.7407489, -2.5394, 1, 1, 1, 1, 1,
-1.078846, -1.674042, -3.303184, 1, 1, 1, 1, 1,
-1.072939, -0.6015744, -3.576493, 1, 1, 1, 1, 1,
-1.071984, -0.8925819, -1.694144, 1, 1, 1, 1, 1,
-1.071746, -1.286248, -1.476477, 1, 1, 1, 1, 1,
-1.062549, 0.6086138, -1.003404, 1, 1, 1, 1, 1,
-1.062297, 1.752912, 0.2260152, 1, 1, 1, 1, 1,
-1.061183, -1.420152, -2.688258, 1, 1, 1, 1, 1,
-1.058736, 0.4767036, -0.3958596, 1, 1, 1, 1, 1,
-1.058107, 1.531964, -1.721725, 1, 1, 1, 1, 1,
-1.055745, 0.8321494, -0.2205186, 1, 1, 1, 1, 1,
-1.047341, 0.04819581, -1.150573, 0, 0, 1, 1, 1,
-1.044727, -0.5009261, -2.939474, 1, 0, 0, 1, 1,
-1.038637, 0.6306248, -1.832054, 1, 0, 0, 1, 1,
-1.036819, 0.9607744, 0.2492754, 1, 0, 0, 1, 1,
-1.036802, 1.166656, -0.5740846, 1, 0, 0, 1, 1,
-1.036562, -0.788303, -2.924903, 1, 0, 0, 1, 1,
-1.036454, -0.921385, -5.058146, 0, 0, 0, 1, 1,
-1.034626, -0.4893456, -2.590022, 0, 0, 0, 1, 1,
-1.02735, 1.642227, 0.6059282, 0, 0, 0, 1, 1,
-1.027064, -1.859046, -1.558772, 0, 0, 0, 1, 1,
-1.022371, -1.632442, -0.6944612, 0, 0, 0, 1, 1,
-1.021946, -0.5348644, -1.027068, 0, 0, 0, 1, 1,
-1.019876, -1.498125, -2.837258, 0, 0, 0, 1, 1,
-1.018667, -0.03372664, -2.504849, 1, 1, 1, 1, 1,
-1.017438, -0.5416993, -1.957807, 1, 1, 1, 1, 1,
-1.01591, -0.7260096, -1.519048, 1, 1, 1, 1, 1,
-1.00742, 0.717082, -0.6909742, 1, 1, 1, 1, 1,
-1.002191, -1.616346, -2.603812, 1, 1, 1, 1, 1,
-1.00204, -0.01617004, -1.061188, 1, 1, 1, 1, 1,
-1.002015, 1.139879, -0.9468663, 1, 1, 1, 1, 1,
-1.001906, -0.7805135, -1.484349, 1, 1, 1, 1, 1,
-1.001722, 0.4228054, -1.162548, 1, 1, 1, 1, 1,
-0.992181, -0.3901862, -0.5243779, 1, 1, 1, 1, 1,
-0.9886829, 1.278724, -1.275032, 1, 1, 1, 1, 1,
-0.9868231, -0.4014868, -2.383846, 1, 1, 1, 1, 1,
-0.9840212, 2.00789, 0.1454324, 1, 1, 1, 1, 1,
-0.9830618, 1.553765, -1.891844, 1, 1, 1, 1, 1,
-0.9745619, 1.150985, -1.882349, 1, 1, 1, 1, 1,
-0.9741182, 1.119913, 0.874653, 0, 0, 1, 1, 1,
-0.9721834, -0.78885, -1.691717, 1, 0, 0, 1, 1,
-0.9696195, 1.021699, -0.1730327, 1, 0, 0, 1, 1,
-0.9610947, -0.5664691, -4.147345, 1, 0, 0, 1, 1,
-0.9565684, -1.515157, -2.57142, 1, 0, 0, 1, 1,
-0.9556614, -0.003230793, -2.141624, 1, 0, 0, 1, 1,
-0.9467126, 0.4142173, -2.039056, 0, 0, 0, 1, 1,
-0.9420859, -1.508049, -1.876338, 0, 0, 0, 1, 1,
-0.9383127, 0.1568071, -1.78569, 0, 0, 0, 1, 1,
-0.9381188, 0.4128147, -1.699463, 0, 0, 0, 1, 1,
-0.9374819, 0.4918377, -0.2604389, 0, 0, 0, 1, 1,
-0.9365759, 0.6201006, -3.383763, 0, 0, 0, 1, 1,
-0.9327763, -0.5678771, -3.602235, 0, 0, 0, 1, 1,
-0.9306402, -0.3022885, -1.30869, 1, 1, 1, 1, 1,
-0.9275571, 2.097996, -0.1124738, 1, 1, 1, 1, 1,
-0.92148, -0.18974, -1.556562, 1, 1, 1, 1, 1,
-0.9139012, -0.3166352, -2.242313, 1, 1, 1, 1, 1,
-0.912621, 0.6661302, -1.197356, 1, 1, 1, 1, 1,
-0.9111992, -0.7937341, -3.263436, 1, 1, 1, 1, 1,
-0.8957657, 0.04288393, -1.4745, 1, 1, 1, 1, 1,
-0.8880031, -2.167349, -2.450785, 1, 1, 1, 1, 1,
-0.8829816, 0.4741077, -1.828014, 1, 1, 1, 1, 1,
-0.8817872, 0.723082, -1.667786, 1, 1, 1, 1, 1,
-0.8816355, 0.3955496, -1.07687, 1, 1, 1, 1, 1,
-0.8814088, -2.376805, -2.580206, 1, 1, 1, 1, 1,
-0.8780603, -1.482472, -2.833933, 1, 1, 1, 1, 1,
-0.8753287, 1.198514, -1.658006, 1, 1, 1, 1, 1,
-0.8729427, 0.6056561, 1.775531, 1, 1, 1, 1, 1,
-0.8700803, -1.873482, -5.670919, 0, 0, 1, 1, 1,
-0.8666353, -0.06432328, -0.7130774, 1, 0, 0, 1, 1,
-0.8563691, -0.02358916, -1.342187, 1, 0, 0, 1, 1,
-0.8534499, -0.4560255, -3.764564, 1, 0, 0, 1, 1,
-0.8522177, 0.6575872, -0.4167732, 1, 0, 0, 1, 1,
-0.8498121, 1.07432, -1.393095, 1, 0, 0, 1, 1,
-0.8487044, 0.9658743, -2.675001, 0, 0, 0, 1, 1,
-0.8418776, 1.085361, 1.18953, 0, 0, 0, 1, 1,
-0.8416196, -0.2391282, 0.171533, 0, 0, 0, 1, 1,
-0.8403979, 1.055177, 0.1037101, 0, 0, 0, 1, 1,
-0.8315271, 0.7570617, 0.7518739, 0, 0, 0, 1, 1,
-0.8299758, -0.6401914, -3.1712, 0, 0, 0, 1, 1,
-0.8238708, -0.3421917, -2.549745, 0, 0, 0, 1, 1,
-0.8234812, -1.303315, -2.89301, 1, 1, 1, 1, 1,
-0.8173766, -0.9250654, -1.709584, 1, 1, 1, 1, 1,
-0.8160938, 0.361753, -1.481517, 1, 1, 1, 1, 1,
-0.8160741, 0.2454976, -2.517466, 1, 1, 1, 1, 1,
-0.8132645, 1.279325, 0.7212939, 1, 1, 1, 1, 1,
-0.8046763, -0.2385177, -1.408774, 1, 1, 1, 1, 1,
-0.8015636, 0.7071515, -1.52523, 1, 1, 1, 1, 1,
-0.8014157, 0.6329424, -0.4072842, 1, 1, 1, 1, 1,
-0.7999414, -0.1265995, -2.375406, 1, 1, 1, 1, 1,
-0.79412, 0.635842, -0.584651, 1, 1, 1, 1, 1,
-0.7926651, -0.6338496, -2.086666, 1, 1, 1, 1, 1,
-0.7922827, 0.1132512, -0.09012893, 1, 1, 1, 1, 1,
-0.7903552, -0.8563257, -1.640328, 1, 1, 1, 1, 1,
-0.7793493, 0.6020452, -0.8201967, 1, 1, 1, 1, 1,
-0.7749274, -0.4365748, -1.409206, 1, 1, 1, 1, 1,
-0.7726101, 0.6492543, -0.473554, 0, 0, 1, 1, 1,
-0.7709959, 2.218322, -1.105385, 1, 0, 0, 1, 1,
-0.7640418, 0.7649294, 0.2029771, 1, 0, 0, 1, 1,
-0.7640335, 0.5286639, -1.671336, 1, 0, 0, 1, 1,
-0.7631938, -0.3583271, -1.170637, 1, 0, 0, 1, 1,
-0.7581523, -1.196302, -1.52101, 1, 0, 0, 1, 1,
-0.7573202, 0.5858917, -1.202853, 0, 0, 0, 1, 1,
-0.7563432, -0.985356, -0.6861287, 0, 0, 0, 1, 1,
-0.7510427, 0.03041579, -1.438631, 0, 0, 0, 1, 1,
-0.7437333, -0.9256307, -2.074434, 0, 0, 0, 1, 1,
-0.7435765, 1.416929, 0.3554223, 0, 0, 0, 1, 1,
-0.7428726, 0.6571795, -0.588736, 0, 0, 0, 1, 1,
-0.7417908, -1.291141, -3.263941, 0, 0, 0, 1, 1,
-0.7392626, 1.435013, 1.425609, 1, 1, 1, 1, 1,
-0.7348754, -0.8982763, -3.605546, 1, 1, 1, 1, 1,
-0.7338037, 1.191298, -1.220578, 1, 1, 1, 1, 1,
-0.7260647, 0.8987409, -0.04772669, 1, 1, 1, 1, 1,
-0.7216262, -0.5379661, -1.370807, 1, 1, 1, 1, 1,
-0.7191078, -1.626074, -3.893623, 1, 1, 1, 1, 1,
-0.7181845, -0.7303632, -1.713845, 1, 1, 1, 1, 1,
-0.718177, -0.4764004, -1.876289, 1, 1, 1, 1, 1,
-0.7110419, -0.9294519, -2.0399, 1, 1, 1, 1, 1,
-0.7109448, 0.7158765, -1.676413, 1, 1, 1, 1, 1,
-0.7058501, 0.4236591, -0.3966775, 1, 1, 1, 1, 1,
-0.7045858, 1.163102, -1.344216, 1, 1, 1, 1, 1,
-0.7040697, 1.427078, -0.9979535, 1, 1, 1, 1, 1,
-0.6936632, 0.8838542, -0.7755898, 1, 1, 1, 1, 1,
-0.6931168, -0.7571173, -1.249916, 1, 1, 1, 1, 1,
-0.6930028, -0.7972112, -2.236801, 0, 0, 1, 1, 1,
-0.6876129, 0.08795338, -2.105078, 1, 0, 0, 1, 1,
-0.6863315, -1.151063, -3.407072, 1, 0, 0, 1, 1,
-0.6824362, -0.1342476, -1.733835, 1, 0, 0, 1, 1,
-0.67871, 1.000394, -1.202831, 1, 0, 0, 1, 1,
-0.668951, -0.1368955, -3.042233, 1, 0, 0, 1, 1,
-0.6683441, -0.731986, -1.184475, 0, 0, 0, 1, 1,
-0.6682198, -0.3324989, -1.06997, 0, 0, 0, 1, 1,
-0.6643738, -0.8007171, -2.507985, 0, 0, 0, 1, 1,
-0.6571923, -1.079687, -0.9627216, 0, 0, 0, 1, 1,
-0.65685, -0.3243376, -0.1035818, 0, 0, 0, 1, 1,
-0.645894, -0.3680668, -1.116817, 0, 0, 0, 1, 1,
-0.6445276, 0.3970359, -2.624016, 0, 0, 0, 1, 1,
-0.6409311, 0.3192548, -1.702474, 1, 1, 1, 1, 1,
-0.6396429, -0.8812258, -1.260229, 1, 1, 1, 1, 1,
-0.6387714, -0.8484952, -1.607509, 1, 1, 1, 1, 1,
-0.6315132, 0.5002094, 1.14265, 1, 1, 1, 1, 1,
-0.6301339, -0.1309499, -2.129641, 1, 1, 1, 1, 1,
-0.6283404, -0.876843, -1.933712, 1, 1, 1, 1, 1,
-0.6261967, -1.537983, -2.841195, 1, 1, 1, 1, 1,
-0.6224545, 0.8156275, 0.09628405, 1, 1, 1, 1, 1,
-0.6196168, -0.4313756, -1.780336, 1, 1, 1, 1, 1,
-0.618993, -0.3586815, -0.6570511, 1, 1, 1, 1, 1,
-0.6187773, -0.6679327, -4.054188, 1, 1, 1, 1, 1,
-0.6146739, 0.4663552, -2.717827, 1, 1, 1, 1, 1,
-0.6140323, 0.4110484, -0.02422293, 1, 1, 1, 1, 1,
-0.613809, 0.406099, -1.211052, 1, 1, 1, 1, 1,
-0.6096039, 0.1833854, -0.1135147, 1, 1, 1, 1, 1,
-0.6077788, 2.05724, 0.4970576, 0, 0, 1, 1, 1,
-0.6012145, 1.116584, -1.052874, 1, 0, 0, 1, 1,
-0.5956041, 0.8740097, 1.617335, 1, 0, 0, 1, 1,
-0.5955365, -0.35896, -2.130876, 1, 0, 0, 1, 1,
-0.5915504, -0.4993001, -3.031007, 1, 0, 0, 1, 1,
-0.5909823, -1.913956, -2.543852, 1, 0, 0, 1, 1,
-0.5806052, -0.9037684, -1.643918, 0, 0, 0, 1, 1,
-0.578117, 0.8548848, -0.3569068, 0, 0, 0, 1, 1,
-0.5766122, 0.3203528, -0.7683617, 0, 0, 0, 1, 1,
-0.5735325, 1.084951, -1.543928, 0, 0, 0, 1, 1,
-0.5682162, -0.06234817, -2.305108, 0, 0, 0, 1, 1,
-0.5634565, -1.92662, -2.607464, 0, 0, 0, 1, 1,
-0.5608073, 0.8658881, -0.188032, 0, 0, 0, 1, 1,
-0.5607368, -1.509086, -2.315023, 1, 1, 1, 1, 1,
-0.5561424, -0.2661802, -1.476824, 1, 1, 1, 1, 1,
-0.554772, -0.8793558, -1.377453, 1, 1, 1, 1, 1,
-0.5499313, -1.226786, -3.321479, 1, 1, 1, 1, 1,
-0.5450493, 1.302111, -1.300841, 1, 1, 1, 1, 1,
-0.5431095, -1.140751, -3.363988, 1, 1, 1, 1, 1,
-0.5364181, -0.5357021, -3.213885, 1, 1, 1, 1, 1,
-0.5358339, 0.8755444, -1.026693, 1, 1, 1, 1, 1,
-0.5356449, 0.08805785, -0.6707016, 1, 1, 1, 1, 1,
-0.5326639, 0.2582955, -2.204251, 1, 1, 1, 1, 1,
-0.5310031, 0.3902079, -0.5513738, 1, 1, 1, 1, 1,
-0.5294355, 0.08205564, -1.182081, 1, 1, 1, 1, 1,
-0.5259121, -0.7481551, -2.851387, 1, 1, 1, 1, 1,
-0.5253423, -1.068257, -4.417548, 1, 1, 1, 1, 1,
-0.5251746, -0.1494376, -1.070778, 1, 1, 1, 1, 1,
-0.5199602, -1.743464, -2.572872, 0, 0, 1, 1, 1,
-0.5163777, 1.372942, 0.9399833, 1, 0, 0, 1, 1,
-0.5156121, 1.186, -0.2844453, 1, 0, 0, 1, 1,
-0.5117584, 0.2387325, -1.32456, 1, 0, 0, 1, 1,
-0.5071691, -0.8722518, -1.515459, 1, 0, 0, 1, 1,
-0.5069678, 2.064541, -0.1813858, 1, 0, 0, 1, 1,
-0.5068744, -2.038939, -2.114421, 0, 0, 0, 1, 1,
-0.5065727, -0.4224834, -3.489934, 0, 0, 0, 1, 1,
-0.5004146, 1.313251, 0.3183064, 0, 0, 0, 1, 1,
-0.4954959, 1.936495, 0.5751115, 0, 0, 0, 1, 1,
-0.4943205, 0.238327, -1.001428, 0, 0, 0, 1, 1,
-0.4929968, 1.987671, -0.7121314, 0, 0, 0, 1, 1,
-0.4892026, -0.2879505, -0.6508685, 0, 0, 0, 1, 1,
-0.4878779, 0.5035946, -0.8446443, 1, 1, 1, 1, 1,
-0.4849368, 1.47758, -0.1429314, 1, 1, 1, 1, 1,
-0.4821197, -1.045034, -4.230412, 1, 1, 1, 1, 1,
-0.4807765, 0.278751, -1.042068, 1, 1, 1, 1, 1,
-0.4793741, 0.8695442, -0.8337564, 1, 1, 1, 1, 1,
-0.4765348, -1.068057, -3.536875, 1, 1, 1, 1, 1,
-0.4663109, -0.1257907, -2.467714, 1, 1, 1, 1, 1,
-0.466297, 0.8527429, 0.02200995, 1, 1, 1, 1, 1,
-0.4623576, 0.7766675, -1.156515, 1, 1, 1, 1, 1,
-0.4587649, 0.9236202, -0.6956077, 1, 1, 1, 1, 1,
-0.4557328, -1.17797, -2.402972, 1, 1, 1, 1, 1,
-0.4520417, 0.1718608, -1.377514, 1, 1, 1, 1, 1,
-0.4511194, -0.2020976, -2.944309, 1, 1, 1, 1, 1,
-0.448699, 0.6575353, -1.604394, 1, 1, 1, 1, 1,
-0.4450662, 0.1877685, -0.7627264, 1, 1, 1, 1, 1,
-0.4402692, 0.1257457, -1.628769, 0, 0, 1, 1, 1,
-0.4384969, 1.834324, 0.9967871, 1, 0, 0, 1, 1,
-0.4364066, -0.3189367, -1.532953, 1, 0, 0, 1, 1,
-0.4359549, -1.915706, -3.789596, 1, 0, 0, 1, 1,
-0.4349318, 1.173774, 0.3616138, 1, 0, 0, 1, 1,
-0.4335834, -0.3598308, -2.789005, 1, 0, 0, 1, 1,
-0.425262, 0.01276735, 0.05117074, 0, 0, 0, 1, 1,
-0.4217387, -0.2008144, -2.545252, 0, 0, 0, 1, 1,
-0.4188257, -1.032833, -2.60318, 0, 0, 0, 1, 1,
-0.4169421, -1.297985, -2.453807, 0, 0, 0, 1, 1,
-0.4161855, -0.4115109, -5.10394, 0, 0, 0, 1, 1,
-0.4156075, 0.003423805, -1.474431, 0, 0, 0, 1, 1,
-0.4129356, -0.02001458, -1.411418, 0, 0, 0, 1, 1,
-0.4111565, 0.1799224, -1.812044, 1, 1, 1, 1, 1,
-0.4103988, -0.4099824, -3.814532, 1, 1, 1, 1, 1,
-0.4098878, -0.6783038, -2.67686, 1, 1, 1, 1, 1,
-0.4075595, 1.079685, 1.393113, 1, 1, 1, 1, 1,
-0.4046292, 0.1669881, -2.112061, 1, 1, 1, 1, 1,
-0.4004922, -1.138654, -1.758846, 1, 1, 1, 1, 1,
-0.3967904, 0.7333943, -0.01879076, 1, 1, 1, 1, 1,
-0.3931355, -0.1359679, -2.219274, 1, 1, 1, 1, 1,
-0.390954, -0.632858, -2.39581, 1, 1, 1, 1, 1,
-0.3865128, 1.370088, -0.473655, 1, 1, 1, 1, 1,
-0.3848016, 1.324626, 1.106616, 1, 1, 1, 1, 1,
-0.383249, -0.2368636, -1.599077, 1, 1, 1, 1, 1,
-0.3811197, 0.5565693, -1.261777, 1, 1, 1, 1, 1,
-0.374334, 2.405035, -0.836552, 1, 1, 1, 1, 1,
-0.3719459, -0.9943878, -1.964091, 1, 1, 1, 1, 1,
-0.3680574, 0.6830948, -1.392761, 0, 0, 1, 1, 1,
-0.3611779, 0.3115002, -0.8938712, 1, 0, 0, 1, 1,
-0.3607276, 0.04566948, -1.22046, 1, 0, 0, 1, 1,
-0.3588076, -0.04117221, -3.71355, 1, 0, 0, 1, 1,
-0.3568716, 1.637445, 0.1676497, 1, 0, 0, 1, 1,
-0.3563615, 0.1750131, -1.272147, 1, 0, 0, 1, 1,
-0.3530497, -1.09346, -3.980257, 0, 0, 0, 1, 1,
-0.3413213, -0.05086967, -0.782635, 0, 0, 0, 1, 1,
-0.3363982, -0.8717947, -3.31093, 0, 0, 0, 1, 1,
-0.3288376, 0.8939093, 0.4419783, 0, 0, 0, 1, 1,
-0.3279733, -0.2240704, -1.257725, 0, 0, 0, 1, 1,
-0.3273084, -0.1019569, -3.073199, 0, 0, 0, 1, 1,
-0.3264646, 0.2641052, -0.6448212, 0, 0, 0, 1, 1,
-0.3163707, 0.1440874, -0.2882603, 1, 1, 1, 1, 1,
-0.3153028, -0.0669122, -2.284831, 1, 1, 1, 1, 1,
-0.3130244, 0.1925523, -0.4070309, 1, 1, 1, 1, 1,
-0.3112495, 0.5814372, -0.6892672, 1, 1, 1, 1, 1,
-0.3073162, -1.838035, -2.986797, 1, 1, 1, 1, 1,
-0.3057593, -0.8595561, -2.759537, 1, 1, 1, 1, 1,
-0.3051293, 1.450034, -0.7534043, 1, 1, 1, 1, 1,
-0.3025918, 0.1159448, -1.145369, 1, 1, 1, 1, 1,
-0.3024712, -0.8264097, -4.01883, 1, 1, 1, 1, 1,
-0.3011989, -0.7786155, -3.749367, 1, 1, 1, 1, 1,
-0.2947154, 1.248927, 0.7952449, 1, 1, 1, 1, 1,
-0.2942192, -1.012626, -4.245211, 1, 1, 1, 1, 1,
-0.293587, -0.4252367, -2.890221, 1, 1, 1, 1, 1,
-0.2930416, 1.175158, 0.3294381, 1, 1, 1, 1, 1,
-0.2906337, -0.7983937, -2.57856, 1, 1, 1, 1, 1,
-0.2897554, -1.214416, -4.043216, 0, 0, 1, 1, 1,
-0.2874174, 0.2438183, 0.5093391, 1, 0, 0, 1, 1,
-0.2845503, -0.8853912, -1.719633, 1, 0, 0, 1, 1,
-0.2806707, -1.096633, -3.129884, 1, 0, 0, 1, 1,
-0.2797074, -0.4319516, -1.959561, 1, 0, 0, 1, 1,
-0.2739236, 2.115146, -0.5591735, 1, 0, 0, 1, 1,
-0.2728622, 0.8857726, -0.4327499, 0, 0, 0, 1, 1,
-0.2728562, -1.788707, -1.944682, 0, 0, 0, 1, 1,
-0.2710383, -0.03020839, -1.412933, 0, 0, 0, 1, 1,
-0.2698937, -0.8974789, -2.558122, 0, 0, 0, 1, 1,
-0.2671057, -1.055155, -1.503556, 0, 0, 0, 1, 1,
-0.2666704, 0.02268516, -0.3316724, 0, 0, 0, 1, 1,
-0.2660627, -0.7859042, -2.301866, 0, 0, 0, 1, 1,
-0.2596673, -0.6769501, -3.218847, 1, 1, 1, 1, 1,
-0.2551494, 0.4102525, -1.596075, 1, 1, 1, 1, 1,
-0.2517369, -0.02577154, -1.204281, 1, 1, 1, 1, 1,
-0.2502286, 0.331248, -1.181883, 1, 1, 1, 1, 1,
-0.2494207, -2.17644, -3.707531, 1, 1, 1, 1, 1,
-0.2493578, -0.57364, -3.706486, 1, 1, 1, 1, 1,
-0.2469015, -0.4994913, 0.6317781, 1, 1, 1, 1, 1,
-0.2461298, 0.08741623, -1.78972, 1, 1, 1, 1, 1,
-0.2458965, -0.9088814, -1.753251, 1, 1, 1, 1, 1,
-0.2458449, -1.622636, -2.77268, 1, 1, 1, 1, 1,
-0.2424968, 2.273188, 1.400346, 1, 1, 1, 1, 1,
-0.2424287, 0.9554977, -0.321836, 1, 1, 1, 1, 1,
-0.2415642, -0.8473659, -3.972204, 1, 1, 1, 1, 1,
-0.2409844, -1.375437, -3.652425, 1, 1, 1, 1, 1,
-0.24044, 1.28756, -0.9245661, 1, 1, 1, 1, 1,
-0.2336642, -2.330177, -4.06244, 0, 0, 1, 1, 1,
-0.2322553, 1.090725, -3.256816, 1, 0, 0, 1, 1,
-0.2312437, -1.102868, -2.165328, 1, 0, 0, 1, 1,
-0.228432, -0.1546153, -0.3019637, 1, 0, 0, 1, 1,
-0.2282765, 0.6665375, -0.4991851, 1, 0, 0, 1, 1,
-0.2234174, -0.212119, -3.62942, 1, 0, 0, 1, 1,
-0.2220618, -1.767701, -0.7987227, 0, 0, 0, 1, 1,
-0.2212654, -2.156134, -3.506465, 0, 0, 0, 1, 1,
-0.2190385, 0.08897228, -1.019922, 0, 0, 0, 1, 1,
-0.2177723, -2.193939, -2.224436, 0, 0, 0, 1, 1,
-0.206381, 0.5209806, -1.434591, 0, 0, 0, 1, 1,
-0.1993298, 0.995592, -0.8591435, 0, 0, 0, 1, 1,
-0.1984759, -0.0393958, -1.616509, 0, 0, 0, 1, 1,
-0.1972072, 1.239839, -0.9521865, 1, 1, 1, 1, 1,
-0.1904774, 1.440652, -0.7019207, 1, 1, 1, 1, 1,
-0.1890638, -1.080688, -4.375451, 1, 1, 1, 1, 1,
-0.1884199, -0.2743994, -2.473376, 1, 1, 1, 1, 1,
-0.1795956, 1.449962, 0.844054, 1, 1, 1, 1, 1,
-0.1763524, 0.5242894, 0.4599865, 1, 1, 1, 1, 1,
-0.1689038, 1.79405, 0.4255566, 1, 1, 1, 1, 1,
-0.1673584, -0.4135765, -2.97838, 1, 1, 1, 1, 1,
-0.1661187, -1.463349, -2.853362, 1, 1, 1, 1, 1,
-0.1658144, 0.7112508, 1.04762, 1, 1, 1, 1, 1,
-0.1650317, -1.505446, -4.26373, 1, 1, 1, 1, 1,
-0.1639712, 0.7108828, -0.8557509, 1, 1, 1, 1, 1,
-0.1627387, -0.07829849, -2.03687, 1, 1, 1, 1, 1,
-0.1527005, -1.20252, -3.86496, 1, 1, 1, 1, 1,
-0.1523227, 0.6867774, -0.1796159, 1, 1, 1, 1, 1,
-0.1482578, -0.003581062, -1.567459, 0, 0, 1, 1, 1,
-0.1466547, 0.7813432, -1.879405, 1, 0, 0, 1, 1,
-0.1458733, -0.409179, -4.084332, 1, 0, 0, 1, 1,
-0.1426533, 0.5435203, -0.4554122, 1, 0, 0, 1, 1,
-0.1422116, 1.186693, 0.8745455, 1, 0, 0, 1, 1,
-0.1368836, 1.934862, 0.1271828, 1, 0, 0, 1, 1,
-0.1345787, 0.2383521, -2.187652, 0, 0, 0, 1, 1,
-0.131586, -1.081552, -0.6921546, 0, 0, 0, 1, 1,
-0.1232694, -0.8297417, -4.081192, 0, 0, 0, 1, 1,
-0.1222185, -0.5892972, -3.417301, 0, 0, 0, 1, 1,
-0.1171542, -0.541577, -2.097447, 0, 0, 0, 1, 1,
-0.1119205, -0.2981897, -2.57769, 0, 0, 0, 1, 1,
-0.1093297, -0.2863714, -2.24807, 0, 0, 0, 1, 1,
-0.1059522, 0.5275849, -2.737116, 1, 1, 1, 1, 1,
-0.1042187, -0.4242547, -3.260619, 1, 1, 1, 1, 1,
-0.1028683, 1.039619, -0.003640928, 1, 1, 1, 1, 1,
-0.1008337, -0.2034058, -4.414613, 1, 1, 1, 1, 1,
-0.1002817, -0.6616164, -2.664692, 1, 1, 1, 1, 1,
-0.09844775, 0.4150815, 0.2556739, 1, 1, 1, 1, 1,
-0.09816018, 0.245891, -0.7696477, 1, 1, 1, 1, 1,
-0.09497804, -1.598141, -1.896528, 1, 1, 1, 1, 1,
-0.08202241, -0.6578893, -4.395524, 1, 1, 1, 1, 1,
-0.07727037, 0.4240842, 1.126065, 1, 1, 1, 1, 1,
-0.07619591, -1.132308, -2.605422, 1, 1, 1, 1, 1,
-0.07523821, 0.5455284, -0.2522109, 1, 1, 1, 1, 1,
-0.07402535, -0.8284274, -3.495729, 1, 1, 1, 1, 1,
-0.07328804, -1.145859, -3.939935, 1, 1, 1, 1, 1,
-0.07181313, 0.07848895, -0.4052879, 1, 1, 1, 1, 1,
-0.0576583, -0.1688416, -1.556818, 0, 0, 1, 1, 1,
-0.04890591, 1.158614, 0.06387998, 1, 0, 0, 1, 1,
-0.04580275, -0.2748978, -3.706061, 1, 0, 0, 1, 1,
-0.04560685, -0.1651971, -2.327801, 1, 0, 0, 1, 1,
-0.03953237, -0.8657224, -3.319432, 1, 0, 0, 1, 1,
-0.03549787, 0.0003776564, -2.468486, 1, 0, 0, 1, 1,
-0.02862714, -1.777002, -3.574288, 0, 0, 0, 1, 1,
-0.02385062, -0.5483544, -2.017157, 0, 0, 0, 1, 1,
-0.02236225, -0.114753, -1.465795, 0, 0, 0, 1, 1,
-0.01743033, 0.3381077, -0.1869885, 0, 0, 0, 1, 1,
-0.01554395, -0.4958708, -3.279577, 0, 0, 0, 1, 1,
-0.01489385, 0.131422, -1.83342, 0, 0, 0, 1, 1,
-0.01398868, -1.019784, -2.522204, 0, 0, 0, 1, 1,
-0.01365038, -0.6311325, -4.247722, 1, 1, 1, 1, 1,
-0.01328288, -1.121495, -3.347231, 1, 1, 1, 1, 1,
-0.007964845, 0.7198192, -0.109276, 1, 1, 1, 1, 1,
-0.007606439, 0.4430088, 1.686441, 1, 1, 1, 1, 1,
-0.006184034, -1.599801, -2.640594, 1, 1, 1, 1, 1,
-0.005064571, 0.6047341, 0.03480903, 1, 1, 1, 1, 1,
-0.001884031, 0.6454867, 0.322003, 1, 1, 1, 1, 1,
-0.001448021, 0.5914553, -1.572413, 1, 1, 1, 1, 1,
-0.001426295, -1.758363, -2.694929, 1, 1, 1, 1, 1,
-0.0001125335, -1.739446, -3.433886, 1, 1, 1, 1, 1,
-3.461674e-05, -0.8462416, -3.213324, 1, 1, 1, 1, 1,
0.005877367, -0.6729981, 4.800173, 1, 1, 1, 1, 1,
0.007322811, 0.9195359, 0.7570632, 1, 1, 1, 1, 1,
0.0109843, 1.349847, -0.008004021, 1, 1, 1, 1, 1,
0.01249383, 0.06398787, 0.2054449, 1, 1, 1, 1, 1,
0.01428484, -1.448821, 3.791323, 0, 0, 1, 1, 1,
0.01590806, 1.046391, 0.6355665, 1, 0, 0, 1, 1,
0.01693954, -0.1376241, 4.269804, 1, 0, 0, 1, 1,
0.01761171, 0.8734026, 1.001264, 1, 0, 0, 1, 1,
0.01769165, 0.1590944, -1.058965, 1, 0, 0, 1, 1,
0.01790203, 0.2303568, 0.4173662, 1, 0, 0, 1, 1,
0.01898884, 0.876085, 0.3592896, 0, 0, 0, 1, 1,
0.02258336, 0.9460734, 0.4989516, 0, 0, 0, 1, 1,
0.02518313, 0.7387608, -3.22188, 0, 0, 0, 1, 1,
0.03043487, -0.7915984, 3.420275, 0, 0, 0, 1, 1,
0.03108002, -0.9473837, 4.448223, 0, 0, 0, 1, 1,
0.03200869, 0.8418803, -0.4476596, 0, 0, 0, 1, 1,
0.03205939, 2.323498, -0.3803122, 0, 0, 0, 1, 1,
0.03740373, 1.105192, -0.1179732, 1, 1, 1, 1, 1,
0.03809777, 0.3931589, -0.3742479, 1, 1, 1, 1, 1,
0.04142091, 0.5998853, -0.1343956, 1, 1, 1, 1, 1,
0.04191928, 0.7238083, -0.6815376, 1, 1, 1, 1, 1,
0.04605218, -1.505797, 3.595406, 1, 1, 1, 1, 1,
0.0475465, -0.6003073, 2.687639, 1, 1, 1, 1, 1,
0.05059811, -0.2783437, 2.219844, 1, 1, 1, 1, 1,
0.05163157, 2.377754, 0.334699, 1, 1, 1, 1, 1,
0.05555959, -1.604303, 3.378788, 1, 1, 1, 1, 1,
0.05584322, 1.107105, -0.6528924, 1, 1, 1, 1, 1,
0.05944679, -1.285081, 2.624129, 1, 1, 1, 1, 1,
0.06068463, 1.071884, -0.1185928, 1, 1, 1, 1, 1,
0.06118017, 0.9594558, 0.1659255, 1, 1, 1, 1, 1,
0.0662535, 0.007293709, 0.8972238, 1, 1, 1, 1, 1,
0.06835931, -0.3394676, 3.281609, 1, 1, 1, 1, 1,
0.0721478, 0.9620442, -1.301596, 0, 0, 1, 1, 1,
0.07223022, -0.2500719, 3.736141, 1, 0, 0, 1, 1,
0.07681657, -0.7072156, 3.733053, 1, 0, 0, 1, 1,
0.0795269, -0.640746, 3.547647, 1, 0, 0, 1, 1,
0.0820346, 0.1419229, 0.6571931, 1, 0, 0, 1, 1,
0.08360661, -0.2643539, 4.028466, 1, 0, 0, 1, 1,
0.08429053, -1.202462, 1.961576, 0, 0, 0, 1, 1,
0.0871055, 0.06053577, 0.2349997, 0, 0, 0, 1, 1,
0.08821488, 0.01067689, 1.054758, 0, 0, 0, 1, 1,
0.0894743, 0.2134778, 2.16705, 0, 0, 0, 1, 1,
0.09598944, -0.6783069, 2.837759, 0, 0, 0, 1, 1,
0.1003525, -0.957203, 4.24504, 0, 0, 0, 1, 1,
0.1022034, 0.003154618, 1.946278, 0, 0, 0, 1, 1,
0.1067457, -0.0358652, 1.198917, 1, 1, 1, 1, 1,
0.1072962, -0.07551767, 4.207138, 1, 1, 1, 1, 1,
0.1077312, -1.240662, 2.40568, 1, 1, 1, 1, 1,
0.1081188, 0.2968287, 0.005695811, 1, 1, 1, 1, 1,
0.1122972, 0.5002456, -2.944022, 1, 1, 1, 1, 1,
0.1143403, 0.05889161, 1.283147, 1, 1, 1, 1, 1,
0.1143885, -1.667019, 3.90476, 1, 1, 1, 1, 1,
0.1170534, 0.582082, 0.9023972, 1, 1, 1, 1, 1,
0.120812, -0.9622468, 2.062819, 1, 1, 1, 1, 1,
0.1240981, 0.1846356, 0.1023854, 1, 1, 1, 1, 1,
0.1289052, -1.770496, 2.280436, 1, 1, 1, 1, 1,
0.1311204, -0.2289518, 2.842808, 1, 1, 1, 1, 1,
0.1318836, -1.078626, 1.941894, 1, 1, 1, 1, 1,
0.1326566, 0.2329701, 2.076612, 1, 1, 1, 1, 1,
0.1332246, 0.3285101, -0.6443996, 1, 1, 1, 1, 1,
0.1445801, 0.77088, 0.4678598, 0, 0, 1, 1, 1,
0.1470553, -0.2914245, 3.644495, 1, 0, 0, 1, 1,
0.1474702, 0.870221, 0.4670301, 1, 0, 0, 1, 1,
0.1511897, 0.04775779, 2.448356, 1, 0, 0, 1, 1,
0.1518123, -0.1414974, 1.568915, 1, 0, 0, 1, 1,
0.155274, -0.629815, 2.798588, 1, 0, 0, 1, 1,
0.159796, 1.177723, -1.023858, 0, 0, 0, 1, 1,
0.1650464, -0.1398157, 1.218663, 0, 0, 0, 1, 1,
0.1657131, -0.7607642, 2.642894, 0, 0, 0, 1, 1,
0.1674005, 0.7057871, 0.4573229, 0, 0, 0, 1, 1,
0.1683859, -0.4865513, 2.324707, 0, 0, 0, 1, 1,
0.1701751, 0.4452657, -0.03898288, 0, 0, 0, 1, 1,
0.1748051, -0.6192912, 1.766883, 0, 0, 0, 1, 1,
0.1829175, 1.895515, -1.109562, 1, 1, 1, 1, 1,
0.1870957, -0.1550658, 2.770654, 1, 1, 1, 1, 1,
0.1936193, -0.6377026, 3.514273, 1, 1, 1, 1, 1,
0.1974612, 0.2014658, 1.630079, 1, 1, 1, 1, 1,
0.1976197, -0.6739174, 3.718166, 1, 1, 1, 1, 1,
0.1982774, -0.4755806, 4.88231, 1, 1, 1, 1, 1,
0.2016844, 0.9460662, 0.1829517, 1, 1, 1, 1, 1,
0.2020992, 0.2000202, 2.496022, 1, 1, 1, 1, 1,
0.2050721, 0.3436573, -1.309476, 1, 1, 1, 1, 1,
0.2072946, -0.2716435, 2.442894, 1, 1, 1, 1, 1,
0.2082445, -0.4796512, 2.544863, 1, 1, 1, 1, 1,
0.2161869, 1.63557, 1.35877, 1, 1, 1, 1, 1,
0.2188763, 0.3105763, -1.404829, 1, 1, 1, 1, 1,
0.2244456, 0.681314, -0.256925, 1, 1, 1, 1, 1,
0.2313064, 0.4228405, 2.034054, 1, 1, 1, 1, 1,
0.2333378, 1.712697, 2.455548, 0, 0, 1, 1, 1,
0.2374466, -0.5612296, 2.646716, 1, 0, 0, 1, 1,
0.238111, -0.6107349, 2.634059, 1, 0, 0, 1, 1,
0.2386941, -1.789689, 3.622257, 1, 0, 0, 1, 1,
0.2394865, 0.9347331, 0.9360061, 1, 0, 0, 1, 1,
0.2404419, 0.528497, -1.701269, 1, 0, 0, 1, 1,
0.2410445, 0.04587149, -0.02115181, 0, 0, 0, 1, 1,
0.2421382, -0.8213741, 4.565429, 0, 0, 0, 1, 1,
0.2453624, -0.9821932, 3.059636, 0, 0, 0, 1, 1,
0.2460083, 1.709233, -1.386616, 0, 0, 0, 1, 1,
0.2467959, 0.9087197, 0.2642083, 0, 0, 0, 1, 1,
0.2500483, 0.7924575, 0.3420522, 0, 0, 0, 1, 1,
0.251586, 1.275175, -0.4306572, 0, 0, 0, 1, 1,
0.2552653, 0.4558875, 1.104887, 1, 1, 1, 1, 1,
0.2580307, -1.463952, 3.659712, 1, 1, 1, 1, 1,
0.2644243, 0.5851104, -0.7061033, 1, 1, 1, 1, 1,
0.2752988, -0.1410767, 1.934289, 1, 1, 1, 1, 1,
0.2779182, 0.4145312, 1.217301, 1, 1, 1, 1, 1,
0.281501, -0.1313152, 0.9081019, 1, 1, 1, 1, 1,
0.283172, -0.1128806, 2.298131, 1, 1, 1, 1, 1,
0.2869212, 0.4602372, 1.808394, 1, 1, 1, 1, 1,
0.2879502, -0.4857297, 4.225407, 1, 1, 1, 1, 1,
0.2966017, 1.46413, 0.3251997, 1, 1, 1, 1, 1,
0.3020096, -0.4976659, 2.37991, 1, 1, 1, 1, 1,
0.3037719, 1.172146, 0.5218648, 1, 1, 1, 1, 1,
0.3074512, -1.570337, 2.293175, 1, 1, 1, 1, 1,
0.3078596, 0.6583086, 0.9585538, 1, 1, 1, 1, 1,
0.3119223, 0.9731923, 0.572764, 1, 1, 1, 1, 1,
0.312598, -0.5403891, 2.693389, 0, 0, 1, 1, 1,
0.3170089, 1.411161, 0.6613449, 1, 0, 0, 1, 1,
0.3195049, 0.9939211, 3.181676, 1, 0, 0, 1, 1,
0.3240368, 0.1704401, -0.4740756, 1, 0, 0, 1, 1,
0.3253115, -3.048004, 3.71149, 1, 0, 0, 1, 1,
0.3261449, -1.689693, 2.105434, 1, 0, 0, 1, 1,
0.3294056, -0.4447563, 3.765233, 0, 0, 0, 1, 1,
0.3330939, 0.1347166, 2.121665, 0, 0, 0, 1, 1,
0.3395773, -0.1038841, 1.846388, 0, 0, 0, 1, 1,
0.3428463, -0.4591759, 3.777087, 0, 0, 0, 1, 1,
0.3450574, 0.2486218, 0.4474541, 0, 0, 0, 1, 1,
0.353163, -0.4292122, -0.1049343, 0, 0, 0, 1, 1,
0.3534812, 0.5156305, -0.1077065, 0, 0, 0, 1, 1,
0.3554269, -0.9288933, 3.389399, 1, 1, 1, 1, 1,
0.3555125, 1.302711, -0.2099896, 1, 1, 1, 1, 1,
0.3572179, 0.2837826, 0.9796736, 1, 1, 1, 1, 1,
0.3587039, -0.9470131, 1.262954, 1, 1, 1, 1, 1,
0.3588408, -1.520291, 3.821723, 1, 1, 1, 1, 1,
0.3643585, 0.2340866, 0.2966942, 1, 1, 1, 1, 1,
0.3690529, 0.2356776, -1.101674, 1, 1, 1, 1, 1,
0.3693061, -0.3475718, 2.171869, 1, 1, 1, 1, 1,
0.3705357, -1.586558, 3.621012, 1, 1, 1, 1, 1,
0.3721312, -0.339617, 0.9785068, 1, 1, 1, 1, 1,
0.3724388, 1.170405, 0.1468236, 1, 1, 1, 1, 1,
0.3745358, -0.3478503, 1.478135, 1, 1, 1, 1, 1,
0.3800179, 1.074911, 1.534662, 1, 1, 1, 1, 1,
0.3820882, -1.115174, 4.219925, 1, 1, 1, 1, 1,
0.3866768, 0.2836597, 0.2141679, 1, 1, 1, 1, 1,
0.3876795, -0.4403405, 3.538726, 0, 0, 1, 1, 1,
0.3881583, -0.2598831, 2.281719, 1, 0, 0, 1, 1,
0.3951109, -0.1495655, 2.334169, 1, 0, 0, 1, 1,
0.3975905, -0.1019021, 3.216492, 1, 0, 0, 1, 1,
0.3986771, -2.48202, 3.017934, 1, 0, 0, 1, 1,
0.4008082, -0.4162057, 1.094304, 1, 0, 0, 1, 1,
0.4012411, 0.9134939, 0.3571379, 0, 0, 0, 1, 1,
0.4021547, -0.3936501, 1.448739, 0, 0, 0, 1, 1,
0.40636, 1.358425, 0.894075, 0, 0, 0, 1, 1,
0.4162738, -0.02982087, 4.814612, 0, 0, 0, 1, 1,
0.4163464, 1.312513, 0.5177843, 0, 0, 0, 1, 1,
0.4290248, 1.143627, 0.4440975, 0, 0, 0, 1, 1,
0.430768, 2.550442, 1.59661, 0, 0, 0, 1, 1,
0.4339939, -0.182814, 2.914141, 1, 1, 1, 1, 1,
0.4360192, -0.1133918, 2.242883, 1, 1, 1, 1, 1,
0.4382661, 0.6368679, -0.3770753, 1, 1, 1, 1, 1,
0.4404081, -1.857466, 4.969417, 1, 1, 1, 1, 1,
0.4426513, 2.145387, 0.9268799, 1, 1, 1, 1, 1,
0.4438833, 0.04446246, -0.3071826, 1, 1, 1, 1, 1,
0.4492845, 0.2087017, 0.7327887, 1, 1, 1, 1, 1,
0.4505559, -0.7863401, 4.137191, 1, 1, 1, 1, 1,
0.4513236, 0.3924496, 1.173658, 1, 1, 1, 1, 1,
0.4547678, -0.6610865, 2.632036, 1, 1, 1, 1, 1,
0.4560601, 0.02747132, -0.7013277, 1, 1, 1, 1, 1,
0.4606952, -1.743356, 3.496772, 1, 1, 1, 1, 1,
0.4658103, 0.7452015, -0.5459074, 1, 1, 1, 1, 1,
0.4669838, -1.096981, 3.741162, 1, 1, 1, 1, 1,
0.4670557, 0.6279392, 0.3618877, 1, 1, 1, 1, 1,
0.4746327, -1.652636, 2.689193, 0, 0, 1, 1, 1,
0.4827245, 0.2574354, -0.01195145, 1, 0, 0, 1, 1,
0.4843622, -0.9664806, 0.9893546, 1, 0, 0, 1, 1,
0.4900131, -0.8355908, 2.073964, 1, 0, 0, 1, 1,
0.4929327, -1.066226, 1.991424, 1, 0, 0, 1, 1,
0.497401, -1.068273, 3.73324, 1, 0, 0, 1, 1,
0.4974182, 0.409632, 1.751136, 0, 0, 0, 1, 1,
0.4982242, -0.5819305, 2.334741, 0, 0, 0, 1, 1,
0.4991373, -0.803417, 3.362053, 0, 0, 0, 1, 1,
0.4991717, 1.216766, 0.7296253, 0, 0, 0, 1, 1,
0.5002426, 1.077475, 1.558089, 0, 0, 0, 1, 1,
0.5085471, -0.8051318, 2.291388, 0, 0, 0, 1, 1,
0.5105926, -0.9581302, 2.844179, 0, 0, 0, 1, 1,
0.513146, -1.579255, 3.040752, 1, 1, 1, 1, 1,
0.5140015, 0.2025249, 3.318656, 1, 1, 1, 1, 1,
0.5161818, 0.1151043, -1.152426, 1, 1, 1, 1, 1,
0.517142, 0.3014776, 1.030069, 1, 1, 1, 1, 1,
0.5172662, 1.656909, -1.473073, 1, 1, 1, 1, 1,
0.5190544, 0.397401, 1.681371, 1, 1, 1, 1, 1,
0.5191383, 0.7719595, -0.3524307, 1, 1, 1, 1, 1,
0.5220813, -0.04460116, 0.4150676, 1, 1, 1, 1, 1,
0.5232936, 0.3275269, 0.1085352, 1, 1, 1, 1, 1,
0.5243189, -0.2491419, 2.497735, 1, 1, 1, 1, 1,
0.5247338, 1.228829, -0.8160128, 1, 1, 1, 1, 1,
0.5310058, -0.3603387, 1.348028, 1, 1, 1, 1, 1,
0.5311858, 0.2260092, -0.1313445, 1, 1, 1, 1, 1,
0.5365394, -0.3208864, 2.666598, 1, 1, 1, 1, 1,
0.5383105, -0.006492865, 2.563984, 1, 1, 1, 1, 1,
0.541039, -0.1021479, 4.660386, 0, 0, 1, 1, 1,
0.5439433, 1.168426, 0.1700309, 1, 0, 0, 1, 1,
0.548777, 1.637245, -1.113957, 1, 0, 0, 1, 1,
0.5506963, -0.386917, 2.593832, 1, 0, 0, 1, 1,
0.554224, 0.664341, 0.7290471, 1, 0, 0, 1, 1,
0.559372, -0.2821539, 0.7912374, 1, 0, 0, 1, 1,
0.5604278, 0.05112273, 1.424465, 0, 0, 0, 1, 1,
0.5626796, -0.9377895, 1.990418, 0, 0, 0, 1, 1,
0.563322, -1.548705, 3.221623, 0, 0, 0, 1, 1,
0.5645686, -1.183925, 2.536938, 0, 0, 0, 1, 1,
0.5649397, -1.727811, 3.682413, 0, 0, 0, 1, 1,
0.5857192, -0.06427921, 1.437228, 0, 0, 0, 1, 1,
0.5919037, 0.2340747, 0.9836949, 0, 0, 0, 1, 1,
0.5929602, -0.3403614, 2.248147, 1, 1, 1, 1, 1,
0.5939294, -1.483045, 3.5531, 1, 1, 1, 1, 1,
0.5946206, 0.1397117, 0.9387813, 1, 1, 1, 1, 1,
0.5961107, -0.5460432, 2.356758, 1, 1, 1, 1, 1,
0.5976518, -0.6995281, 2.597341, 1, 1, 1, 1, 1,
0.6000458, -0.7238231, 2.186429, 1, 1, 1, 1, 1,
0.60154, -1.187811, 2.590885, 1, 1, 1, 1, 1,
0.6022481, -0.6417028, 1.579537, 1, 1, 1, 1, 1,
0.605988, 0.8493155, 1.942212, 1, 1, 1, 1, 1,
0.6124005, -1.032914, 3.419562, 1, 1, 1, 1, 1,
0.6150385, -1.066494, 3.062339, 1, 1, 1, 1, 1,
0.6153722, -1.636434, 2.781139, 1, 1, 1, 1, 1,
0.6157976, -0.7185759, 2.303699, 1, 1, 1, 1, 1,
0.6210154, -0.09260281, -1.83461, 1, 1, 1, 1, 1,
0.6242523, 0.410677, 0.5710586, 1, 1, 1, 1, 1,
0.6279658, 2.459879, 1.509731, 0, 0, 1, 1, 1,
0.6320536, -0.08385504, 2.155902, 1, 0, 0, 1, 1,
0.6390896, 0.8135673, 0.584018, 1, 0, 0, 1, 1,
0.6459793, 0.2224705, 1.672108, 1, 0, 0, 1, 1,
0.6476887, -0.8060941, 1.932135, 1, 0, 0, 1, 1,
0.6491159, -0.6944107, 3.014208, 1, 0, 0, 1, 1,
0.6492126, -0.1920419, 2.604546, 0, 0, 0, 1, 1,
0.6550469, -0.6682252, 2.34352, 0, 0, 0, 1, 1,
0.6569692, 1.35816, 2.755489, 0, 0, 0, 1, 1,
0.6588293, -0.4433023, 0.3391538, 0, 0, 0, 1, 1,
0.660533, -0.4154915, 4.051505, 0, 0, 0, 1, 1,
0.6654034, -1.601461, 2.22376, 0, 0, 0, 1, 1,
0.6714116, 0.09721027, 2.52731, 0, 0, 0, 1, 1,
0.6739064, 0.1250842, 1.279815, 1, 1, 1, 1, 1,
0.676959, 0.8066352, 1.027836, 1, 1, 1, 1, 1,
0.6779017, 0.4344828, 1.658918, 1, 1, 1, 1, 1,
0.6807266, 0.1226788, 0.8705441, 1, 1, 1, 1, 1,
0.6823391, -1.606766, 3.467786, 1, 1, 1, 1, 1,
0.6823692, 0.5512158, -0.3077921, 1, 1, 1, 1, 1,
0.686366, -0.3644, 1.857767, 1, 1, 1, 1, 1,
0.6889086, 2.707018, 2.468005, 1, 1, 1, 1, 1,
0.6899118, -0.5652145, 2.379817, 1, 1, 1, 1, 1,
0.6920945, -0.08256333, 1.459741, 1, 1, 1, 1, 1,
0.7042201, -0.6454312, 2.448404, 1, 1, 1, 1, 1,
0.7058712, -0.2329727, 1.787432, 1, 1, 1, 1, 1,
0.7085971, 0.5090183, 0.01375523, 1, 1, 1, 1, 1,
0.7117864, -0.1825897, 2.23891, 1, 1, 1, 1, 1,
0.712976, -0.1535401, 1.919492, 1, 1, 1, 1, 1,
0.7258021, 0.530118, 1.853841, 0, 0, 1, 1, 1,
0.727017, -0.5423493, 1.032046, 1, 0, 0, 1, 1,
0.7340475, 0.3072748, 3.22772, 1, 0, 0, 1, 1,
0.7345833, -1.111704, 3.34681, 1, 0, 0, 1, 1,
0.7366074, -0.6106507, 1.431283, 1, 0, 0, 1, 1,
0.7445412, 1.649363, -0.06739961, 1, 0, 0, 1, 1,
0.7461288, -0.152058, 0.4796249, 0, 0, 0, 1, 1,
0.7513645, 0.3606643, 0.6402647, 0, 0, 0, 1, 1,
0.7551599, -0.5824049, 3.356087, 0, 0, 0, 1, 1,
0.7604731, 0.5878876, 0.3199989, 0, 0, 0, 1, 1,
0.7789342, -0.6454188, 4.809216, 0, 0, 0, 1, 1,
0.7813583, 0.2250573, 3.01633, 0, 0, 0, 1, 1,
0.7834659, 0.4465478, 1.248154, 0, 0, 0, 1, 1,
0.7846528, -0.1883121, 2.417992, 1, 1, 1, 1, 1,
0.7850558, -0.44733, 2.457262, 1, 1, 1, 1, 1,
0.7885272, -0.07645346, 0.008753927, 1, 1, 1, 1, 1,
0.7922925, 0.1184343, 0.9120115, 1, 1, 1, 1, 1,
0.7926571, 0.4438148, 1.357322, 1, 1, 1, 1, 1,
0.7945998, -0.7753459, 4.171119, 1, 1, 1, 1, 1,
0.8019521, -1.300653, 1.385344, 1, 1, 1, 1, 1,
0.804488, 0.1883352, 1.795244, 1, 1, 1, 1, 1,
0.8087469, -0.5993603, 3.877223, 1, 1, 1, 1, 1,
0.8129731, -0.8237755, 3.999892, 1, 1, 1, 1, 1,
0.8130812, -0.7482656, 2.304254, 1, 1, 1, 1, 1,
0.8143211, -0.6710569, 3.015493, 1, 1, 1, 1, 1,
0.8210171, -1.161884, 1.289054, 1, 1, 1, 1, 1,
0.8346155, 0.3889599, 0.6347308, 1, 1, 1, 1, 1,
0.8384897, 0.3032618, 0.5962999, 1, 1, 1, 1, 1,
0.8390908, 0.9050207, 1.34318, 0, 0, 1, 1, 1,
0.8415357, -0.01558526, 0.5389471, 1, 0, 0, 1, 1,
0.8464704, 0.1521257, 2.658013, 1, 0, 0, 1, 1,
0.8473136, -1.139199, 1.60203, 1, 0, 0, 1, 1,
0.8567785, -0.3600069, 1.217344, 1, 0, 0, 1, 1,
0.858424, -0.675983, 0.7997864, 1, 0, 0, 1, 1,
0.8613606, -1.462801, 4.151169, 0, 0, 0, 1, 1,
0.8657595, 1.637318, 0.8200483, 0, 0, 0, 1, 1,
0.8674821, -1.132935, 0.1831731, 0, 0, 0, 1, 1,
0.8711087, 0.968381, 1.754561, 0, 0, 0, 1, 1,
0.8773552, 1.353548, 1.303313, 0, 0, 0, 1, 1,
0.8835437, -0.8599368, 2.905618, 0, 0, 0, 1, 1,
0.8860071, 1.316779, -0.1462505, 0, 0, 0, 1, 1,
0.887648, -0.5380201, 1.953388, 1, 1, 1, 1, 1,
0.8886307, 0.6658971, 1.599421, 1, 1, 1, 1, 1,
0.88916, 2.066606, 0.7734387, 1, 1, 1, 1, 1,
0.8900455, -0.9717712, 1.356874, 1, 1, 1, 1, 1,
0.8921875, -0.176534, 2.320791, 1, 1, 1, 1, 1,
0.898132, 0.3506921, 2.773189, 1, 1, 1, 1, 1,
0.9097767, 0.08641881, 0.2937131, 1, 1, 1, 1, 1,
0.90988, 0.03266023, -0.6372206, 1, 1, 1, 1, 1,
0.9114192, 0.3721595, 1.582029, 1, 1, 1, 1, 1,
0.9144598, -0.2606364, 2.533799, 1, 1, 1, 1, 1,
0.9149365, -2.035576, 2.765148, 1, 1, 1, 1, 1,
0.9244153, 0.3766651, 0.08213365, 1, 1, 1, 1, 1,
0.9268637, -0.6695818, 2.293729, 1, 1, 1, 1, 1,
0.9292453, 0.06557264, 0.3737185, 1, 1, 1, 1, 1,
0.9310146, -0.6789042, 3.65967, 1, 1, 1, 1, 1,
0.9336882, -0.09835302, 1.850495, 0, 0, 1, 1, 1,
0.9358001, 2.430988, 1.91269, 1, 0, 0, 1, 1,
0.9420447, 1.142634, 1.509181, 1, 0, 0, 1, 1,
0.9432188, -1.585672, 0.7419169, 1, 0, 0, 1, 1,
0.9468811, -0.4357777, 1.410321, 1, 0, 0, 1, 1,
0.9472637, -1.484584, 1.261818, 1, 0, 0, 1, 1,
0.9483921, -0.5547692, 2.852617, 0, 0, 0, 1, 1,
0.9497335, -0.03632517, 2.662861, 0, 0, 0, 1, 1,
0.9501918, 0.07401871, 1.531308, 0, 0, 0, 1, 1,
0.9531136, -0.9221383, 1.580541, 0, 0, 0, 1, 1,
0.961862, -0.1850044, 4.386912, 0, 0, 0, 1, 1,
0.9635279, -0.07704142, 1.850104, 0, 0, 0, 1, 1,
0.9642625, -1.075271, 1.588616, 0, 0, 0, 1, 1,
0.9726342, -0.8769612, 3.47792, 1, 1, 1, 1, 1,
0.9746801, -1.023489, 3.427015, 1, 1, 1, 1, 1,
0.9759446, -0.8738742, 0.5695657, 1, 1, 1, 1, 1,
0.9783962, 0.1494514, 1.767808, 1, 1, 1, 1, 1,
0.9799097, 0.8549709, 1.502769, 1, 1, 1, 1, 1,
0.9812046, -1.545906, 4.555747, 1, 1, 1, 1, 1,
0.9869662, -0.03223817, 2.615325, 1, 1, 1, 1, 1,
0.9879221, -0.3911709, 2.690132, 1, 1, 1, 1, 1,
0.9963907, -0.7318878, 1.649181, 1, 1, 1, 1, 1,
0.9967924, -0.9525544, 2.149385, 1, 1, 1, 1, 1,
1.001919, 0.1342706, 1.906178, 1, 1, 1, 1, 1,
1.015543, 1.090915, -0.5440874, 1, 1, 1, 1, 1,
1.01871, -0.4010488, 0.1699067, 1, 1, 1, 1, 1,
1.019594, -0.5158308, 2.305495, 1, 1, 1, 1, 1,
1.020512, 0.1980886, 3.273833, 1, 1, 1, 1, 1,
1.021588, -0.9662465, 3.583647, 0, 0, 1, 1, 1,
1.022579, -0.5056703, -0.09816511, 1, 0, 0, 1, 1,
1.030257, 0.0330408, 3.776057, 1, 0, 0, 1, 1,
1.032979, 0.4617177, -0.08858057, 1, 0, 0, 1, 1,
1.038516, -0.8984984, 1.176636, 1, 0, 0, 1, 1,
1.043158, -0.2282683, 0.9804569, 1, 0, 0, 1, 1,
1.043808, 0.5952979, 0.9937514, 0, 0, 0, 1, 1,
1.050234, 0.07203894, 0.8084168, 0, 0, 0, 1, 1,
1.070225, 1.042496, 1.268702, 0, 0, 0, 1, 1,
1.070305, 1.109882, 0.9265755, 0, 0, 0, 1, 1,
1.071083, -1.449905, 1.046952, 0, 0, 0, 1, 1,
1.072391, 0.5197305, 1.474801, 0, 0, 0, 1, 1,
1.074225, 0.1870084, 0.5862571, 0, 0, 0, 1, 1,
1.07627, -1.001914, 2.879256, 1, 1, 1, 1, 1,
1.083961, -0.2558018, 2.291098, 1, 1, 1, 1, 1,
1.089089, -1.185442, 2.007395, 1, 1, 1, 1, 1,
1.090274, 0.82154, 2.067708, 1, 1, 1, 1, 1,
1.093532, -0.4339861, 2.131876, 1, 1, 1, 1, 1,
1.101034, -1.052431, 3.412103, 1, 1, 1, 1, 1,
1.109329, -0.558019, 0.3556311, 1, 1, 1, 1, 1,
1.110016, 0.1912099, 0.6986012, 1, 1, 1, 1, 1,
1.124424, 1.895357, 0.9379136, 1, 1, 1, 1, 1,
1.125964, 1.4138, 0.8223851, 1, 1, 1, 1, 1,
1.128545, 1.334905, 1.746662, 1, 1, 1, 1, 1,
1.131686, -0.1678535, 2.345171, 1, 1, 1, 1, 1,
1.142528, -1.217276, 2.881265, 1, 1, 1, 1, 1,
1.145906, -0.008418676, 1.77149, 1, 1, 1, 1, 1,
1.147736, -0.9403593, 2.48784, 1, 1, 1, 1, 1,
1.148223, 0.8976258, 0.9706228, 0, 0, 1, 1, 1,
1.15915, 0.6453698, 1.763681, 1, 0, 0, 1, 1,
1.165513, 0.4224568, 0.297674, 1, 0, 0, 1, 1,
1.171547, 1.217524, 1.505914, 1, 0, 0, 1, 1,
1.177387, 0.2079115, 0.2333567, 1, 0, 0, 1, 1,
1.183253, 1.168054, -0.6067987, 1, 0, 0, 1, 1,
1.190819, -0.4868043, 1.028533, 0, 0, 0, 1, 1,
1.192277, 0.435748, 3.071982, 0, 0, 0, 1, 1,
1.192329, 0.6830114, 2.236909, 0, 0, 0, 1, 1,
1.197616, -0.6467431, 1.706154, 0, 0, 0, 1, 1,
1.214768, -0.8686994, 2.089028, 0, 0, 0, 1, 1,
1.215569, 1.185905, 0.2833201, 0, 0, 0, 1, 1,
1.219494, 2.006338, 0.3419419, 0, 0, 0, 1, 1,
1.221474, 1.937758, 0.7022967, 1, 1, 1, 1, 1,
1.225878, 0.457366, 2.335355, 1, 1, 1, 1, 1,
1.243359, -0.2973648, 2.075044, 1, 1, 1, 1, 1,
1.245928, -0.7427852, 1.847327, 1, 1, 1, 1, 1,
1.24772, 1.291666, 0.5702205, 1, 1, 1, 1, 1,
1.252512, -0.4387856, 2.207322, 1, 1, 1, 1, 1,
1.265967, -0.2974529, 2.008961, 1, 1, 1, 1, 1,
1.266517, 1.083353, 1.252254, 1, 1, 1, 1, 1,
1.268689, 0.3941762, -0.1925413, 1, 1, 1, 1, 1,
1.274574, 1.129402, 1.617877, 1, 1, 1, 1, 1,
1.275956, 0.8416314, 0.8304581, 1, 1, 1, 1, 1,
1.278077, 0.83044, -1.516941, 1, 1, 1, 1, 1,
1.281071, -0.2457851, 2.398667, 1, 1, 1, 1, 1,
1.287899, 1.443934, 0.5545052, 1, 1, 1, 1, 1,
1.289334, 0.9998201, -0.1638586, 1, 1, 1, 1, 1,
1.290143, -0.1042638, 2.054705, 0, 0, 1, 1, 1,
1.293396, -1.197429, 3.26546, 1, 0, 0, 1, 1,
1.302812, -0.7513769, 3.284326, 1, 0, 0, 1, 1,
1.310424, -0.9911585, 0.7493795, 1, 0, 0, 1, 1,
1.317299, -0.5492924, 0.3603773, 1, 0, 0, 1, 1,
1.354913, 0.901123, -0.08312938, 1, 0, 0, 1, 1,
1.379844, -0.2049176, 1.60549, 0, 0, 0, 1, 1,
1.387269, -0.9952339, 3.283455, 0, 0, 0, 1, 1,
1.389186, 0.5448836, 1.414062, 0, 0, 0, 1, 1,
1.395347, -0.9135398, 2.992765, 0, 0, 0, 1, 1,
1.397184, 0.09267935, 1.09259, 0, 0, 0, 1, 1,
1.402538, -0.3822043, 2.323658, 0, 0, 0, 1, 1,
1.405743, 0.6357593, 0.4041379, 0, 0, 0, 1, 1,
1.413559, -1.97179, 2.976984, 1, 1, 1, 1, 1,
1.420332, -0.7352335, 1.690162, 1, 1, 1, 1, 1,
1.421815, 0.5073574, 0.902433, 1, 1, 1, 1, 1,
1.441811, 0.7068376, -0.2192758, 1, 1, 1, 1, 1,
1.447214, 1.11333, 2.081569, 1, 1, 1, 1, 1,
1.455761, 0.01964328, 0.4592933, 1, 1, 1, 1, 1,
1.459929, -0.9246708, 2.784933, 1, 1, 1, 1, 1,
1.463961, 0.9925067, 0.9682536, 1, 1, 1, 1, 1,
1.476753, -1.164182, 4.153056, 1, 1, 1, 1, 1,
1.483801, 0.6292607, 1.004901, 1, 1, 1, 1, 1,
1.488568, 0.08786803, 1.843899, 1, 1, 1, 1, 1,
1.488876, 0.1661903, 0.4984849, 1, 1, 1, 1, 1,
1.498027, -0.3527984, 1.077599, 1, 1, 1, 1, 1,
1.500856, -0.0983518, 1.051181, 1, 1, 1, 1, 1,
1.507139, -1.606163, 2.550163, 1, 1, 1, 1, 1,
1.508118, -0.2924834, 1.467942, 0, 0, 1, 1, 1,
1.510502, -0.3245061, 2.87194, 1, 0, 0, 1, 1,
1.515178, 0.02405644, 3.971241, 1, 0, 0, 1, 1,
1.515336, -0.8575289, 2.631868, 1, 0, 0, 1, 1,
1.520963, 2.219155, 0.1896798, 1, 0, 0, 1, 1,
1.525152, 0.9166684, 0.9456643, 1, 0, 0, 1, 1,
1.53502, -0.2999609, 1.734512, 0, 0, 0, 1, 1,
1.544919, 0.6972055, 1.229428, 0, 0, 0, 1, 1,
1.547278, 0.5094014, 1.337374, 0, 0, 0, 1, 1,
1.548367, -0.5901628, 1.561499, 0, 0, 0, 1, 1,
1.550911, 0.2298931, 2.980001, 0, 0, 0, 1, 1,
1.552042, -1.751957, 1.303915, 0, 0, 0, 1, 1,
1.553689, 0.1470541, 2.708522, 0, 0, 0, 1, 1,
1.56522, 0.4833974, 0.9377514, 1, 1, 1, 1, 1,
1.58143, 1.3158, 0.8373139, 1, 1, 1, 1, 1,
1.584171, 0.8165671, 3.695306, 1, 1, 1, 1, 1,
1.586351, 0.1587857, 1.650219, 1, 1, 1, 1, 1,
1.601825, 0.522177, 2.00957, 1, 1, 1, 1, 1,
1.603207, 1.974172, 0.9724464, 1, 1, 1, 1, 1,
1.607447, -0.5749701, 2.643197, 1, 1, 1, 1, 1,
1.61652, -0.1267573, 1.304866, 1, 1, 1, 1, 1,
1.619203, 1.555224, 1.174495, 1, 1, 1, 1, 1,
1.62642, -1.239897, 4.227316, 1, 1, 1, 1, 1,
1.627337, 0.1741328, 1.878476, 1, 1, 1, 1, 1,
1.629435, -0.2174903, 2.70987, 1, 1, 1, 1, 1,
1.633882, -0.001277837, 1.519536, 1, 1, 1, 1, 1,
1.641893, 1.239644, 0.5631232, 1, 1, 1, 1, 1,
1.642359, 1.435452, 0.8019017, 1, 1, 1, 1, 1,
1.649117, 0.2621, -0.9100454, 0, 0, 1, 1, 1,
1.67144, -0.04794734, 0.1668554, 1, 0, 0, 1, 1,
1.67379, -0.4427252, 1.174681, 1, 0, 0, 1, 1,
1.700339, -0.2494456, 1.77006, 1, 0, 0, 1, 1,
1.701403, -0.2581006, 1.555598, 1, 0, 0, 1, 1,
1.722165, 0.7348911, -0.6395264, 1, 0, 0, 1, 1,
1.737919, -1.022157, 0.9965695, 0, 0, 0, 1, 1,
1.761756, -0.6272721, 1.942828, 0, 0, 0, 1, 1,
1.774315, -1.319929, 1.224699, 0, 0, 0, 1, 1,
1.776131, -1.163789, 0.7388567, 0, 0, 0, 1, 1,
1.777524, -0.04782233, 2.036442, 0, 0, 0, 1, 1,
1.792425, 0.4057866, 1.305741, 0, 0, 0, 1, 1,
1.810675, 0.7842254, 2.502571, 0, 0, 0, 1, 1,
1.854439, -2.5748, 2.16546, 1, 1, 1, 1, 1,
1.865838, 0.01292712, 1.888187, 1, 1, 1, 1, 1,
1.870142, 0.232335, 2.679604, 1, 1, 1, 1, 1,
1.878602, -0.1189725, 1.633161, 1, 1, 1, 1, 1,
1.895487, 1.188885, 1.869358, 1, 1, 1, 1, 1,
1.89826, 0.5146379, 0.5107575, 1, 1, 1, 1, 1,
1.899328, 0.6163468, 0.9169335, 1, 1, 1, 1, 1,
1.9324, 0.01985897, 2.361732, 1, 1, 1, 1, 1,
1.964505, 0.1755193, 3.113453, 1, 1, 1, 1, 1,
2.024057, 0.1729849, 1.613196, 1, 1, 1, 1, 1,
2.049983, -0.7659257, 1.670433, 1, 1, 1, 1, 1,
2.059129, 0.03449233, 0.9967296, 1, 1, 1, 1, 1,
2.061004, 0.7637786, -0.2677619, 1, 1, 1, 1, 1,
2.063083, 1.547669, 1.303753, 1, 1, 1, 1, 1,
2.09359, -0.324063, 0.9386024, 1, 1, 1, 1, 1,
2.094675, -1.201058, 1.708585, 0, 0, 1, 1, 1,
2.1013, -0.05094106, 3.063143, 1, 0, 0, 1, 1,
2.121598, 0.7021602, 0.7020695, 1, 0, 0, 1, 1,
2.131145, 0.1457487, 1.056146, 1, 0, 0, 1, 1,
2.137221, -0.5313609, 1.876131, 1, 0, 0, 1, 1,
2.196556, -1.353217, 1.864426, 1, 0, 0, 1, 1,
2.208322, 1.567796, 2.288822, 0, 0, 0, 1, 1,
2.228977, -1.883237, 2.504327, 0, 0, 0, 1, 1,
2.22926, 1.188701, -0.306618, 0, 0, 0, 1, 1,
2.267917, 0.3028118, 1.069953, 0, 0, 0, 1, 1,
2.30757, -0.3023014, 1.384272, 0, 0, 0, 1, 1,
2.348945, 1.162886, 2.92557, 0, 0, 0, 1, 1,
2.368673, -1.675131, 2.396019, 0, 0, 0, 1, 1,
2.440359, 0.9875401, 1.766626, 1, 1, 1, 1, 1,
2.51199, 1.997162, 2.19387, 1, 1, 1, 1, 1,
2.753449, -1.850874, 3.238049, 1, 1, 1, 1, 1,
2.89647, 1.415668, 2.686352, 1, 1, 1, 1, 1,
3.010085, -0.7867707, 2.518705, 1, 1, 1, 1, 1,
3.055479, -0.6892993, 1.621263, 1, 1, 1, 1, 1,
3.156051, -0.5367427, 1.653311, 1, 1, 1, 1, 1
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
var radius = 9.284756;
var distance = 32.61231;
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
mvMatrix.translate( -0.1229904, 0.170493, 0.3507514 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.61231);
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
