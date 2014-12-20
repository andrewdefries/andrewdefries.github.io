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
-3.235979, -0.3942982, -1.610421, 1, 0, 0, 1,
-2.825499, 1.521599, -0.0315323, 1, 0.007843138, 0, 1,
-2.802511, 0.9042696, -2.326479, 1, 0.01176471, 0, 1,
-2.6559, 0.714865, -2.401273, 1, 0.01960784, 0, 1,
-2.638833, -0.5804431, -1.825937, 1, 0.02352941, 0, 1,
-2.629441, 1.460398, -2.132565, 1, 0.03137255, 0, 1,
-2.595054, 0.7678387, -0.9516038, 1, 0.03529412, 0, 1,
-2.561671, 0.4456144, -1.343293, 1, 0.04313726, 0, 1,
-2.39119, 0.7077247, -1.020034, 1, 0.04705882, 0, 1,
-2.384694, 0.4492835, -1.691289, 1, 0.05490196, 0, 1,
-2.371725, -0.8045707, -1.48121, 1, 0.05882353, 0, 1,
-2.263539, 1.075503, -0.1168783, 1, 0.06666667, 0, 1,
-2.244083, 0.888357, -1.764781, 1, 0.07058824, 0, 1,
-2.165286, -0.2965136, -0.9677111, 1, 0.07843138, 0, 1,
-2.158649, -2.166735, -4.305884, 1, 0.08235294, 0, 1,
-2.158576, 1.370412, -2.654613, 1, 0.09019608, 0, 1,
-2.155679, 0.7962916, -2.605602, 1, 0.09411765, 0, 1,
-2.121925, -0.8934134, -1.739374, 1, 0.1019608, 0, 1,
-2.11293, -0.09061297, -1.777101, 1, 0.1098039, 0, 1,
-2.075744, 0.1715607, -3.436835, 1, 0.1137255, 0, 1,
-2.061909, -0.6317761, -1.662482, 1, 0.1215686, 0, 1,
-2.051307, 0.2598352, -1.739783, 1, 0.1254902, 0, 1,
-1.955111, -0.2722497, -2.114179, 1, 0.1333333, 0, 1,
-1.945799, -0.07937697, -0.1557315, 1, 0.1372549, 0, 1,
-1.930215, -1.400446, -3.734316, 1, 0.145098, 0, 1,
-1.892786, 1.32758, -0.5813589, 1, 0.1490196, 0, 1,
-1.887703, 0.1779969, -1.265381, 1, 0.1568628, 0, 1,
-1.883691, -0.5614192, -0.3798111, 1, 0.1607843, 0, 1,
-1.883218, -0.2616013, -2.118195, 1, 0.1686275, 0, 1,
-1.882929, 0.4232322, -1.481914, 1, 0.172549, 0, 1,
-1.882781, 0.09517293, -1.94412, 1, 0.1803922, 0, 1,
-1.85544, -1.930427, -1.218214, 1, 0.1843137, 0, 1,
-1.854087, -0.4480668, -1.043059, 1, 0.1921569, 0, 1,
-1.849157, -1.305782, -1.623785, 1, 0.1960784, 0, 1,
-1.833696, 0.2975633, -2.777369, 1, 0.2039216, 0, 1,
-1.83364, -0.243602, -3.373574, 1, 0.2117647, 0, 1,
-1.828578, -0.972512, -3.806719, 1, 0.2156863, 0, 1,
-1.826044, -0.9465427, -2.540765, 1, 0.2235294, 0, 1,
-1.801679, -1.545448, -2.796577, 1, 0.227451, 0, 1,
-1.797387, -0.9293088, -1.787883, 1, 0.2352941, 0, 1,
-1.771991, -0.3951943, -1.645705, 1, 0.2392157, 0, 1,
-1.754351, 0.3233574, -0.7881847, 1, 0.2470588, 0, 1,
-1.754101, 1.020929, -2.043501, 1, 0.2509804, 0, 1,
-1.711333, -0.3629327, -0.7576473, 1, 0.2588235, 0, 1,
-1.70978, 0.6554101, -1.635506, 1, 0.2627451, 0, 1,
-1.707185, -0.6465182, -3.528684, 1, 0.2705882, 0, 1,
-1.694376, 0.1805659, -1.876218, 1, 0.2745098, 0, 1,
-1.688492, 0.2086457, -1.410088, 1, 0.282353, 0, 1,
-1.676498, 0.720266, -0.3016473, 1, 0.2862745, 0, 1,
-1.662732, 0.07849865, 0.06825428, 1, 0.2941177, 0, 1,
-1.602236, -0.0293847, -2.240583, 1, 0.3019608, 0, 1,
-1.59412, 1.002668, -0.6880282, 1, 0.3058824, 0, 1,
-1.590352, -2.413873, -4.247299, 1, 0.3137255, 0, 1,
-1.560051, -1.392671, -0.6656372, 1, 0.3176471, 0, 1,
-1.556144, -1.202772, -3.284281, 1, 0.3254902, 0, 1,
-1.551454, -1.121596, -0.9735702, 1, 0.3294118, 0, 1,
-1.549369, -0.6185327, -2.84965, 1, 0.3372549, 0, 1,
-1.549348, -0.2666646, -2.255435, 1, 0.3411765, 0, 1,
-1.531757, 0.09545384, -1.419815, 1, 0.3490196, 0, 1,
-1.522182, -1.030047, -1.635956, 1, 0.3529412, 0, 1,
-1.516791, -0.7806222, -1.945303, 1, 0.3607843, 0, 1,
-1.502669, 1.583435, -0.36567, 1, 0.3647059, 0, 1,
-1.502579, -0.02011501, -1.245577, 1, 0.372549, 0, 1,
-1.499818, 2.224206, -1.557475, 1, 0.3764706, 0, 1,
-1.498879, 0.1954998, -2.645645, 1, 0.3843137, 0, 1,
-1.489392, -0.1709559, -1.937317, 1, 0.3882353, 0, 1,
-1.488981, 0.6228667, -1.066261, 1, 0.3960784, 0, 1,
-1.480908, -0.1531163, -1.262155, 1, 0.4039216, 0, 1,
-1.477762, -0.4454274, -1.790544, 1, 0.4078431, 0, 1,
-1.474413, 0.5305966, -1.861862, 1, 0.4156863, 0, 1,
-1.451405, 1.031342, -1.440173, 1, 0.4196078, 0, 1,
-1.450869, 0.06729712, -0.5658973, 1, 0.427451, 0, 1,
-1.449199, -2.235, -2.366491, 1, 0.4313726, 0, 1,
-1.446602, -0.1946302, -3.444845, 1, 0.4392157, 0, 1,
-1.42728, 1.614797, -1.181304, 1, 0.4431373, 0, 1,
-1.423829, 1.380869, -1.286164, 1, 0.4509804, 0, 1,
-1.422775, 0.1460012, -0.05751193, 1, 0.454902, 0, 1,
-1.420763, 1.343576, -1.790701, 1, 0.4627451, 0, 1,
-1.418637, 0.01978176, -0.789819, 1, 0.4666667, 0, 1,
-1.409901, -1.391967, -0.8814906, 1, 0.4745098, 0, 1,
-1.408333, 1.200251, -0.3111797, 1, 0.4784314, 0, 1,
-1.390297, -0.02076269, -2.565015, 1, 0.4862745, 0, 1,
-1.38069, -1.54797, -2.752152, 1, 0.4901961, 0, 1,
-1.378115, -0.1502507, -2.818346, 1, 0.4980392, 0, 1,
-1.377184, -3.028423, -4.135988, 1, 0.5058824, 0, 1,
-1.363131, 0.5562648, -1.557799, 1, 0.509804, 0, 1,
-1.361034, 0.07243881, -1.145287, 1, 0.5176471, 0, 1,
-1.358301, 2.307669, -1.072774, 1, 0.5215687, 0, 1,
-1.345764, -0.9525615, -3.199853, 1, 0.5294118, 0, 1,
-1.305279, -0.8354612, -0.8188822, 1, 0.5333334, 0, 1,
-1.299346, 0.1045827, -2.717519, 1, 0.5411765, 0, 1,
-1.2818, -1.739764, -2.123426, 1, 0.5450981, 0, 1,
-1.281657, 1.016984, -0.833411, 1, 0.5529412, 0, 1,
-1.277418, 0.3646751, -2.977162, 1, 0.5568628, 0, 1,
-1.277072, -0.530571, -2.162441, 1, 0.5647059, 0, 1,
-1.267619, -0.3600174, -2.59223, 1, 0.5686275, 0, 1,
-1.265941, -0.1891696, -1.29105, 1, 0.5764706, 0, 1,
-1.252765, -1.685526, -1.972318, 1, 0.5803922, 0, 1,
-1.252727, 1.034028, 0.8693986, 1, 0.5882353, 0, 1,
-1.249034, -0.6489003, -1.392358, 1, 0.5921569, 0, 1,
-1.241735, 0.4103546, 0.1701897, 1, 0.6, 0, 1,
-1.231842, -0.2570467, -1.373717, 1, 0.6078432, 0, 1,
-1.227207, -0.7980703, -1.244556, 1, 0.6117647, 0, 1,
-1.221722, -2.214141, -2.276246, 1, 0.6196079, 0, 1,
-1.208891, -0.09640671, -1.67818, 1, 0.6235294, 0, 1,
-1.205983, 0.1751733, -1.419944, 1, 0.6313726, 0, 1,
-1.203082, 0.1889507, -1.986509, 1, 0.6352941, 0, 1,
-1.191979, -1.120832, -1.748847, 1, 0.6431373, 0, 1,
-1.178111, 1.865467, 0.5838646, 1, 0.6470588, 0, 1,
-1.176918, -0.7382169, -3.474771, 1, 0.654902, 0, 1,
-1.170461, 0.7010119, -0.5281662, 1, 0.6588235, 0, 1,
-1.164228, 1.334422, -0.426177, 1, 0.6666667, 0, 1,
-1.1632, -0.7098603, -2.874559, 1, 0.6705883, 0, 1,
-1.160191, -0.6639467, -1.857091, 1, 0.6784314, 0, 1,
-1.152378, -0.4754106, -0.8829822, 1, 0.682353, 0, 1,
-1.15105, -0.4369533, -0.07376001, 1, 0.6901961, 0, 1,
-1.149134, 0.2896691, -2.014377, 1, 0.6941177, 0, 1,
-1.140599, 0.9676, -0.4818821, 1, 0.7019608, 0, 1,
-1.140553, -0.7036182, -0.92948, 1, 0.7098039, 0, 1,
-1.138229, 0.2614738, 1.105534, 1, 0.7137255, 0, 1,
-1.137814, 1.900857, 0.008642007, 1, 0.7215686, 0, 1,
-1.129904, 1.286503, -0.3425704, 1, 0.7254902, 0, 1,
-1.128987, -0.2582086, 0.4930384, 1, 0.7333333, 0, 1,
-1.118248, 1.62236, -0.8407767, 1, 0.7372549, 0, 1,
-1.116541, -0.2667278, -2.088371, 1, 0.7450981, 0, 1,
-1.115554, -0.4642046, 0.6710285, 1, 0.7490196, 0, 1,
-1.108709, -0.3511748, -2.437272, 1, 0.7568628, 0, 1,
-1.107051, 0.1864291, -2.067677, 1, 0.7607843, 0, 1,
-1.102006, -0.2200675, -2.430805, 1, 0.7686275, 0, 1,
-1.084267, 0.5189624, -1.1854, 1, 0.772549, 0, 1,
-1.082697, 1.279491, -0.9562334, 1, 0.7803922, 0, 1,
-1.079582, -0.9524622, -3.522286, 1, 0.7843137, 0, 1,
-1.079079, -0.004077891, -2.218761, 1, 0.7921569, 0, 1,
-1.077003, -0.002434106, -0.7198361, 1, 0.7960784, 0, 1,
-1.075511, -1.240546, -2.288375, 1, 0.8039216, 0, 1,
-1.072351, -1.287951, -1.872119, 1, 0.8117647, 0, 1,
-1.060153, 0.1452469, -0.6919027, 1, 0.8156863, 0, 1,
-1.056004, 1.036834, -0.9310281, 1, 0.8235294, 0, 1,
-1.041604, -1.662879, -2.023572, 1, 0.827451, 0, 1,
-1.039675, -1.486644, -2.321414, 1, 0.8352941, 0, 1,
-1.034366, -1.478958, -2.980225, 1, 0.8392157, 0, 1,
-1.031137, -0.558201, -0.1839388, 1, 0.8470588, 0, 1,
-1.025641, 1.665653, 0.05094745, 1, 0.8509804, 0, 1,
-1.023365, -0.6199222, -2.596062, 1, 0.8588235, 0, 1,
-1.017173, -1.478778, -3.715847, 1, 0.8627451, 0, 1,
-1.013701, 0.3399405, -0.8401092, 1, 0.8705882, 0, 1,
-1.009605, -1.182985, -2.441008, 1, 0.8745098, 0, 1,
-1.006495, -2.228506, -2.869845, 1, 0.8823529, 0, 1,
-1.004138, -0.762248, -1.771778, 1, 0.8862745, 0, 1,
-1.002766, -1.134116, -2.067469, 1, 0.8941177, 0, 1,
-0.9973826, 0.9789775, -1.096685, 1, 0.8980392, 0, 1,
-0.9969806, 1.515255, -2.744598, 1, 0.9058824, 0, 1,
-0.9927614, -0.5041922, -2.327643, 1, 0.9137255, 0, 1,
-0.9847591, -0.6800958, -2.47301, 1, 0.9176471, 0, 1,
-0.9814686, -0.3395471, -2.195731, 1, 0.9254902, 0, 1,
-0.9792261, 1.017944, -1.179026, 1, 0.9294118, 0, 1,
-0.9785517, 0.7789888, -0.8641787, 1, 0.9372549, 0, 1,
-0.9775264, 0.07824565, -0.9808707, 1, 0.9411765, 0, 1,
-0.9716918, -0.4131316, -1.699143, 1, 0.9490196, 0, 1,
-0.9598132, 0.1097228, -0.7946481, 1, 0.9529412, 0, 1,
-0.9578008, -1.503444, -1.761437, 1, 0.9607843, 0, 1,
-0.9571656, -0.4915605, -1.164654, 1, 0.9647059, 0, 1,
-0.9536744, 1.613672, -0.9753764, 1, 0.972549, 0, 1,
-0.9521787, 1.078183, -2.050255, 1, 0.9764706, 0, 1,
-0.9429436, -1.343472, -2.364431, 1, 0.9843137, 0, 1,
-0.9291953, 1.443502, -0.4586929, 1, 0.9882353, 0, 1,
-0.9242758, -1.332145, -1.523345, 1, 0.9960784, 0, 1,
-0.922065, -0.4966164, -2.824336, 0.9960784, 1, 0, 1,
-0.9203392, -0.2659287, -3.921841, 0.9921569, 1, 0, 1,
-0.9195862, -0.4205331, -2.926962, 0.9843137, 1, 0, 1,
-0.9181219, 0.1526961, -3.250623, 0.9803922, 1, 0, 1,
-0.9168342, 0.2060104, -1.819196, 0.972549, 1, 0, 1,
-0.9121473, -0.06482686, -1.72695, 0.9686275, 1, 0, 1,
-0.9101952, -0.7378789, -1.636161, 0.9607843, 1, 0, 1,
-0.9048941, 0.3475562, -1.152805, 0.9568627, 1, 0, 1,
-0.9029217, 0.0002323043, -4.263531, 0.9490196, 1, 0, 1,
-0.8970118, -1.202363, -3.914676, 0.945098, 1, 0, 1,
-0.8952867, 0.9683755, -2.892544, 0.9372549, 1, 0, 1,
-0.8939412, -0.3214701, -2.028041, 0.9333333, 1, 0, 1,
-0.8933234, -1.664767, -0.6384833, 0.9254902, 1, 0, 1,
-0.8906837, 0.4993654, 0.08340898, 0.9215686, 1, 0, 1,
-0.8839727, 0.3940666, -2.048442, 0.9137255, 1, 0, 1,
-0.8829291, 0.1988342, -1.069116, 0.9098039, 1, 0, 1,
-0.8823943, -2.518693, -2.733094, 0.9019608, 1, 0, 1,
-0.8804576, 0.5743696, -0.4440825, 0.8941177, 1, 0, 1,
-0.878202, -0.004439194, -2.845412, 0.8901961, 1, 0, 1,
-0.8780149, 1.114583, -0.9805662, 0.8823529, 1, 0, 1,
-0.8759906, -0.2370384, 0.4386517, 0.8784314, 1, 0, 1,
-0.8748516, 1.910287, 0.03493242, 0.8705882, 1, 0, 1,
-0.8682519, -0.7955174, -1.979772, 0.8666667, 1, 0, 1,
-0.8682021, -0.8378203, -1.644432, 0.8588235, 1, 0, 1,
-0.8672296, 0.445594, -0.8320585, 0.854902, 1, 0, 1,
-0.8606595, 0.8629959, -1.621304, 0.8470588, 1, 0, 1,
-0.8564177, 0.1589983, -1.447457, 0.8431373, 1, 0, 1,
-0.855239, -0.6787965, -2.252776, 0.8352941, 1, 0, 1,
-0.8506998, -0.821634, -3.766453, 0.8313726, 1, 0, 1,
-0.8496312, 0.2596909, -0.2415979, 0.8235294, 1, 0, 1,
-0.8495385, -1.190428, -3.121838, 0.8196079, 1, 0, 1,
-0.8440856, -0.7205283, -1.980834, 0.8117647, 1, 0, 1,
-0.8362606, 0.919896, -3.169038, 0.8078431, 1, 0, 1,
-0.8305352, -0.7086158, 0.1077075, 0.8, 1, 0, 1,
-0.830376, 0.4141497, -0.5121741, 0.7921569, 1, 0, 1,
-0.8278414, -0.3553314, -0.9806581, 0.7882353, 1, 0, 1,
-0.8215997, 1.853132, -0.7631715, 0.7803922, 1, 0, 1,
-0.8197832, -1.53654, -2.44086, 0.7764706, 1, 0, 1,
-0.8171061, 0.9492208, -2.088513, 0.7686275, 1, 0, 1,
-0.8117241, 0.05124344, -2.478787, 0.7647059, 1, 0, 1,
-0.8102664, 2.565616, -1.072933, 0.7568628, 1, 0, 1,
-0.8079829, -0.5815669, -2.434755, 0.7529412, 1, 0, 1,
-0.8050247, 0.8315859, 0.6379286, 0.7450981, 1, 0, 1,
-0.7990152, 0.5638648, -0.2522023, 0.7411765, 1, 0, 1,
-0.7979585, 1.715665, -0.009309936, 0.7333333, 1, 0, 1,
-0.7959106, -0.06748514, -1.564527, 0.7294118, 1, 0, 1,
-0.7949524, 1.44711, 0.0886303, 0.7215686, 1, 0, 1,
-0.7905971, -0.2185709, 1.786004, 0.7176471, 1, 0, 1,
-0.7873608, -0.1375, -1.0635, 0.7098039, 1, 0, 1,
-0.7832671, 0.1793576, -0.5368212, 0.7058824, 1, 0, 1,
-0.781823, 0.4001452, -0.1650819, 0.6980392, 1, 0, 1,
-0.781352, -1.336871, -5.05422, 0.6901961, 1, 0, 1,
-0.7796667, 0.01034236, -1.327017, 0.6862745, 1, 0, 1,
-0.7789881, -1.569087, -2.032732, 0.6784314, 1, 0, 1,
-0.7785537, -0.2758734, -2.251359, 0.6745098, 1, 0, 1,
-0.7760859, 1.572525, -0.2579906, 0.6666667, 1, 0, 1,
-0.773865, -2.02347, -2.284195, 0.6627451, 1, 0, 1,
-0.7574202, 0.7565541, -0.07068662, 0.654902, 1, 0, 1,
-0.7456554, 0.5663009, -0.8937533, 0.6509804, 1, 0, 1,
-0.7398435, -0.9110317, -3.371466, 0.6431373, 1, 0, 1,
-0.7369232, 0.03920859, -1.18938, 0.6392157, 1, 0, 1,
-0.736573, -1.856743, -1.173366, 0.6313726, 1, 0, 1,
-0.7341958, -0.2404775, -2.15633, 0.627451, 1, 0, 1,
-0.728748, -0.533603, -3.133899, 0.6196079, 1, 0, 1,
-0.7266332, -0.2809259, -0.2768766, 0.6156863, 1, 0, 1,
-0.7257372, -0.2582906, -1.83817, 0.6078432, 1, 0, 1,
-0.7231918, -1.657722, -1.139509, 0.6039216, 1, 0, 1,
-0.7223799, -1.348154, -2.741719, 0.5960785, 1, 0, 1,
-0.7196941, 0.6803271, -0.566305, 0.5882353, 1, 0, 1,
-0.713038, 0.3592989, -1.080673, 0.5843138, 1, 0, 1,
-0.7122012, -0.9427767, -0.7800126, 0.5764706, 1, 0, 1,
-0.710425, -1.509259, -1.126483, 0.572549, 1, 0, 1,
-0.7078378, -0.8285499, -3.300699, 0.5647059, 1, 0, 1,
-0.6869361, 0.9158081, 0.2714661, 0.5607843, 1, 0, 1,
-0.6850277, 0.04990901, -1.143886, 0.5529412, 1, 0, 1,
-0.6835186, 1.514686, -0.5752488, 0.5490196, 1, 0, 1,
-0.6796677, -0.983472, -3.868201, 0.5411765, 1, 0, 1,
-0.6768089, 1.092288, -1.697239, 0.5372549, 1, 0, 1,
-0.6741636, 0.265582, -1.704903, 0.5294118, 1, 0, 1,
-0.6738584, -1.468253, -2.521119, 0.5254902, 1, 0, 1,
-0.6655987, 2.332694, -0.7604892, 0.5176471, 1, 0, 1,
-0.662593, -1.305645, -2.212448, 0.5137255, 1, 0, 1,
-0.6580556, 0.7164271, -1.623099, 0.5058824, 1, 0, 1,
-0.6577659, 0.6728289, -0.2995121, 0.5019608, 1, 0, 1,
-0.6559299, -1.043787, -2.801597, 0.4941176, 1, 0, 1,
-0.6541278, -1.190829, -1.29527, 0.4862745, 1, 0, 1,
-0.642101, 0.7269086, -0.7937241, 0.4823529, 1, 0, 1,
-0.6382913, 0.663891, -0.7841756, 0.4745098, 1, 0, 1,
-0.6344299, 0.4398685, -0.1241014, 0.4705882, 1, 0, 1,
-0.6294224, 1.155432, -3.251457, 0.4627451, 1, 0, 1,
-0.6249124, 0.06660222, -0.9166545, 0.4588235, 1, 0, 1,
-0.6188399, 1.561296, 1.188015, 0.4509804, 1, 0, 1,
-0.6158007, -0.7814122, -4.05249, 0.4470588, 1, 0, 1,
-0.6157851, 0.5623829, -2.082078, 0.4392157, 1, 0, 1,
-0.6131987, -0.3541518, -2.954365, 0.4352941, 1, 0, 1,
-0.6130304, 1.142655, -0.04620285, 0.427451, 1, 0, 1,
-0.6089488, 0.6052514, -2.279688, 0.4235294, 1, 0, 1,
-0.6032537, 0.6741654, -0.5756637, 0.4156863, 1, 0, 1,
-0.5980653, -0.8362939, -1.113251, 0.4117647, 1, 0, 1,
-0.5960311, -2.183531, -3.266478, 0.4039216, 1, 0, 1,
-0.5955392, 0.4097365, 0.4696615, 0.3960784, 1, 0, 1,
-0.5941871, 0.5772869, -0.1612157, 0.3921569, 1, 0, 1,
-0.5922932, -1.282672, -3.126494, 0.3843137, 1, 0, 1,
-0.5865353, 1.87522, 0.1977817, 0.3803922, 1, 0, 1,
-0.5768063, -0.2568781, -1.295118, 0.372549, 1, 0, 1,
-0.5699512, 0.5608246, -1.214944, 0.3686275, 1, 0, 1,
-0.5692093, -0.1835317, -3.316891, 0.3607843, 1, 0, 1,
-0.5660363, -1.093031, -1.628075, 0.3568628, 1, 0, 1,
-0.5648033, 1.413498, -0.6928955, 0.3490196, 1, 0, 1,
-0.5633724, 1.306684, 0.5929294, 0.345098, 1, 0, 1,
-0.5587488, -0.7793196, -2.84073, 0.3372549, 1, 0, 1,
-0.5463712, 0.005790194, -0.9315152, 0.3333333, 1, 0, 1,
-0.5456602, 0.6051311, -0.5103349, 0.3254902, 1, 0, 1,
-0.5441419, -1.007217, -0.5052639, 0.3215686, 1, 0, 1,
-0.543546, 0.932637, -0.9363854, 0.3137255, 1, 0, 1,
-0.5432443, -0.6234635, -2.474431, 0.3098039, 1, 0, 1,
-0.5404194, 1.228717, -0.5550024, 0.3019608, 1, 0, 1,
-0.5401732, -1.206894, -2.886734, 0.2941177, 1, 0, 1,
-0.5400053, 0.2870698, -2.553469, 0.2901961, 1, 0, 1,
-0.5352752, -0.8403791, -2.513949, 0.282353, 1, 0, 1,
-0.5342662, 1.050317, -0.5572483, 0.2784314, 1, 0, 1,
-0.5307241, -0.2501623, -3.848049, 0.2705882, 1, 0, 1,
-0.5242975, -0.3638608, -1.953047, 0.2666667, 1, 0, 1,
-0.5241706, -2.425204, -2.166347, 0.2588235, 1, 0, 1,
-0.519625, 0.3611576, -2.052212, 0.254902, 1, 0, 1,
-0.5181577, 0.7687047, -0.8354974, 0.2470588, 1, 0, 1,
-0.5170242, 1.829198, 0.1710146, 0.2431373, 1, 0, 1,
-0.5150661, 0.5979133, -0.2687708, 0.2352941, 1, 0, 1,
-0.5147184, -0.1603432, -1.196913, 0.2313726, 1, 0, 1,
-0.5143197, -1.82396, -2.061966, 0.2235294, 1, 0, 1,
-0.5120242, -0.453304, -1.470374, 0.2196078, 1, 0, 1,
-0.5063051, 0.6943111, -1.089209, 0.2117647, 1, 0, 1,
-0.5049696, -0.2413358, -1.599665, 0.2078431, 1, 0, 1,
-0.5044786, 0.2490232, -0.7162938, 0.2, 1, 0, 1,
-0.5042367, 0.7241768, -1.000851, 0.1921569, 1, 0, 1,
-0.4991475, 1.015813, 1.753471, 0.1882353, 1, 0, 1,
-0.4980618, 0.354687, -0.7108227, 0.1803922, 1, 0, 1,
-0.4967801, 1.024557, 0.2369296, 0.1764706, 1, 0, 1,
-0.4892102, -1.699615, -3.527049, 0.1686275, 1, 0, 1,
-0.4857764, 0.1238405, 0.7394392, 0.1647059, 1, 0, 1,
-0.4847112, 0.9087567, -0.4635147, 0.1568628, 1, 0, 1,
-0.4793047, -0.2858648, -2.846216, 0.1529412, 1, 0, 1,
-0.4765263, 1.391043, -2.450217, 0.145098, 1, 0, 1,
-0.4747509, -0.4564802, -1.608207, 0.1411765, 1, 0, 1,
-0.4725714, -0.4072728, -2.089866, 0.1333333, 1, 0, 1,
-0.4705609, -0.1926349, -2.048441, 0.1294118, 1, 0, 1,
-0.4656558, 0.6907709, 0.01985688, 0.1215686, 1, 0, 1,
-0.4637147, 0.6295061, -0.271765, 0.1176471, 1, 0, 1,
-0.4617454, -1.265449, -3.990706, 0.1098039, 1, 0, 1,
-0.4604076, 0.02888547, -0.6767701, 0.1058824, 1, 0, 1,
-0.4562076, -0.3762268, -2.910978, 0.09803922, 1, 0, 1,
-0.448534, -0.1226149, -1.776938, 0.09019608, 1, 0, 1,
-0.4459034, 1.088856, 0.16055, 0.08627451, 1, 0, 1,
-0.445552, 0.07625447, -1.77781, 0.07843138, 1, 0, 1,
-0.4422165, 0.3387584, -0.9506463, 0.07450981, 1, 0, 1,
-0.4364606, 0.08490616, -1.063932, 0.06666667, 1, 0, 1,
-0.4352203, -1.062095, -2.821498, 0.0627451, 1, 0, 1,
-0.4350938, -0.5202929, -1.768187, 0.05490196, 1, 0, 1,
-0.4310345, 2.215907, -1.120458, 0.05098039, 1, 0, 1,
-0.4288574, -1.326227, -3.063305, 0.04313726, 1, 0, 1,
-0.4280511, 1.012089, -0.02792054, 0.03921569, 1, 0, 1,
-0.4271548, -0.9040703, -4.058577, 0.03137255, 1, 0, 1,
-0.4249735, 0.5348312, -0.7594556, 0.02745098, 1, 0, 1,
-0.4216858, -3.156471, -3.509747, 0.01960784, 1, 0, 1,
-0.421208, -1.898088, -2.410861, 0.01568628, 1, 0, 1,
-0.4168037, -0.7950703, -2.220882, 0.007843138, 1, 0, 1,
-0.415546, -2.569, -3.270388, 0.003921569, 1, 0, 1,
-0.4077607, 0.4917911, -2.417222, 0, 1, 0.003921569, 1,
-0.4056007, 1.00606, -0.4541175, 0, 1, 0.01176471, 1,
-0.4025257, 0.8069952, 0.6308514, 0, 1, 0.01568628, 1,
-0.4015025, -1.285556, -3.491282, 0, 1, 0.02352941, 1,
-0.3997146, 0.4448744, -1.375949, 0, 1, 0.02745098, 1,
-0.3959899, -0.2713804, -2.545297, 0, 1, 0.03529412, 1,
-0.3943003, -0.2988781, -2.009018, 0, 1, 0.03921569, 1,
-0.3938776, -0.2233998, -0.8766878, 0, 1, 0.04705882, 1,
-0.3925242, -3.006819, -5.0291, 0, 1, 0.05098039, 1,
-0.3909871, -0.2994078, -1.901273, 0, 1, 0.05882353, 1,
-0.3889755, 1.268864, -0.947206, 0, 1, 0.0627451, 1,
-0.3815234, -2.090955, -0.4057668, 0, 1, 0.07058824, 1,
-0.3814421, 0.5676349, -1.189253, 0, 1, 0.07450981, 1,
-0.379624, -2.089239, -2.791985, 0, 1, 0.08235294, 1,
-0.3792143, 0.4981402, -0.2131474, 0, 1, 0.08627451, 1,
-0.3777655, -0.860873, -3.917764, 0, 1, 0.09411765, 1,
-0.37721, 0.3261499, -1.3426, 0, 1, 0.1019608, 1,
-0.3762208, 1.518962, 0.3488405, 0, 1, 0.1058824, 1,
-0.3654016, -1.693291, -2.229232, 0, 1, 0.1137255, 1,
-0.3636549, 0.03451584, -1.584486, 0, 1, 0.1176471, 1,
-0.3595627, 0.9544955, 0.1019148, 0, 1, 0.1254902, 1,
-0.3593434, -0.005860918, -0.3925492, 0, 1, 0.1294118, 1,
-0.3588235, 0.1094584, -2.350562, 0, 1, 0.1372549, 1,
-0.3568404, -0.2659806, -1.016909, 0, 1, 0.1411765, 1,
-0.3535858, -1.05811, -2.391656, 0, 1, 0.1490196, 1,
-0.3533491, 1.743338, -2.058772, 0, 1, 0.1529412, 1,
-0.3528272, -0.8854458, -2.752385, 0, 1, 0.1607843, 1,
-0.3509956, 0.2401026, 0.1135771, 0, 1, 0.1647059, 1,
-0.3476943, 0.1115853, -0.7199301, 0, 1, 0.172549, 1,
-0.3429636, -0.3230901, -2.103037, 0, 1, 0.1764706, 1,
-0.3369975, 2.258157, -0.7942682, 0, 1, 0.1843137, 1,
-0.3320291, 0.7370212, -0.6190218, 0, 1, 0.1882353, 1,
-0.3319057, -0.2495769, -3.960016, 0, 1, 0.1960784, 1,
-0.3317631, 1.516635, 0.8806891, 0, 1, 0.2039216, 1,
-0.331714, -0.9810303, -3.025045, 0, 1, 0.2078431, 1,
-0.3269335, -0.4417752, -2.277748, 0, 1, 0.2156863, 1,
-0.3185089, -1.658504, -4.709032, 0, 1, 0.2196078, 1,
-0.3171475, 1.112169, 0.5882706, 0, 1, 0.227451, 1,
-0.3153054, 0.2337527, -2.665729, 0, 1, 0.2313726, 1,
-0.3144066, -1.026185, -2.731902, 0, 1, 0.2392157, 1,
-0.3069134, -2.052737, -1.028472, 0, 1, 0.2431373, 1,
-0.2977155, 0.0613613, 0.01429069, 0, 1, 0.2509804, 1,
-0.2974226, 0.7113022, 1.259136, 0, 1, 0.254902, 1,
-0.2926567, 0.1712005, 0.2010617, 0, 1, 0.2627451, 1,
-0.29247, -0.8778233, -2.851664, 0, 1, 0.2666667, 1,
-0.2918589, 0.09878199, -2.593964, 0, 1, 0.2745098, 1,
-0.2912187, 0.6737186, 0.8747328, 0, 1, 0.2784314, 1,
-0.2876787, 0.7329112, 0.01705467, 0, 1, 0.2862745, 1,
-0.2828714, -0.7452608, -4.549417, 0, 1, 0.2901961, 1,
-0.279852, 0.3944253, 0.2226024, 0, 1, 0.2980392, 1,
-0.2798334, -0.9192063, -0.7056901, 0, 1, 0.3058824, 1,
-0.2797656, 0.7846891, -1.081805, 0, 1, 0.3098039, 1,
-0.2763143, -0.9589258, -3.859195, 0, 1, 0.3176471, 1,
-0.2714618, -0.01830424, -2.510494, 0, 1, 0.3215686, 1,
-0.2702222, -0.2333598, -0.1710399, 0, 1, 0.3294118, 1,
-0.2689454, -0.6970251, -2.986984, 0, 1, 0.3333333, 1,
-0.2652273, 0.7572262, -0.8409813, 0, 1, 0.3411765, 1,
-0.2645681, -0.2175835, -2.126439, 0, 1, 0.345098, 1,
-0.2640575, 2.205605, -0.02903152, 0, 1, 0.3529412, 1,
-0.263212, 0.05999776, -0.4408784, 0, 1, 0.3568628, 1,
-0.2521686, -1.159395, -3.762901, 0, 1, 0.3647059, 1,
-0.2501584, -0.458988, -3.713727, 0, 1, 0.3686275, 1,
-0.2498587, 0.2283642, 1.787775, 0, 1, 0.3764706, 1,
-0.247417, -0.2928279, -0.6623268, 0, 1, 0.3803922, 1,
-0.2419805, -1.050124, -1.262641, 0, 1, 0.3882353, 1,
-0.2366122, 0.3276557, -0.785302, 0, 1, 0.3921569, 1,
-0.2365606, -1.298693, -3.327174, 0, 1, 0.4, 1,
-0.2349285, 0.08737356, -2.813057, 0, 1, 0.4078431, 1,
-0.2325979, -0.597463, -1.988892, 0, 1, 0.4117647, 1,
-0.2299296, 1.199992, 0.5266131, 0, 1, 0.4196078, 1,
-0.2292954, -0.150363, -0.7748896, 0, 1, 0.4235294, 1,
-0.2282818, 1.669711, -0.6227499, 0, 1, 0.4313726, 1,
-0.227154, -1.644316, -4.133946, 0, 1, 0.4352941, 1,
-0.2270898, 0.4311585, 0.4304251, 0, 1, 0.4431373, 1,
-0.2238755, -0.8630132, -2.546304, 0, 1, 0.4470588, 1,
-0.2237577, -0.5634584, -3.310404, 0, 1, 0.454902, 1,
-0.2236541, -0.9062356, -2.519504, 0, 1, 0.4588235, 1,
-0.2220608, -0.01863268, -0.6063687, 0, 1, 0.4666667, 1,
-0.2216112, -1.569568, -0.4806668, 0, 1, 0.4705882, 1,
-0.2211205, -0.3189464, -4.156342, 0, 1, 0.4784314, 1,
-0.2130129, 0.6839226, 1.667746, 0, 1, 0.4823529, 1,
-0.211398, 0.6437686, 1.367155, 0, 1, 0.4901961, 1,
-0.2108835, 0.4288664, 0.05344205, 0, 1, 0.4941176, 1,
-0.2086721, 0.1152798, -0.3636501, 0, 1, 0.5019608, 1,
-0.2073365, -0.9336641, -1.922232, 0, 1, 0.509804, 1,
-0.2038618, -0.2190384, -2.27742, 0, 1, 0.5137255, 1,
-0.2021754, -1.12502, -3.243042, 0, 1, 0.5215687, 1,
-0.2007057, 0.2400392, -2.267035, 0, 1, 0.5254902, 1,
-0.200347, 0.5349869, -1.795436, 0, 1, 0.5333334, 1,
-0.1984417, 0.6882877, -0.08246653, 0, 1, 0.5372549, 1,
-0.1976862, -1.400626, -3.604721, 0, 1, 0.5450981, 1,
-0.197378, 0.4072411, 0.1048424, 0, 1, 0.5490196, 1,
-0.1951634, -0.475998, -1.413995, 0, 1, 0.5568628, 1,
-0.1923283, -1.229646, -2.309452, 0, 1, 0.5607843, 1,
-0.189783, 0.4184877, -1.093879, 0, 1, 0.5686275, 1,
-0.1897269, 0.08639526, -2.746118, 0, 1, 0.572549, 1,
-0.1880595, -0.678746, -1.274471, 0, 1, 0.5803922, 1,
-0.1873832, -2.45874, -4.402101, 0, 1, 0.5843138, 1,
-0.1857418, -1.742692, -3.601592, 0, 1, 0.5921569, 1,
-0.1843341, 1.199831, -0.4185896, 0, 1, 0.5960785, 1,
-0.1839236, 0.4506996, 0.1173266, 0, 1, 0.6039216, 1,
-0.1834273, -0.3479482, -2.59012, 0, 1, 0.6117647, 1,
-0.1817956, -0.6101973, -3.654807, 0, 1, 0.6156863, 1,
-0.1786682, -0.8082978, -2.269971, 0, 1, 0.6235294, 1,
-0.173843, -1.2576, -2.482978, 0, 1, 0.627451, 1,
-0.1696368, 3.214896, -2.031089, 0, 1, 0.6352941, 1,
-0.1591515, 1.267857, -1.637017, 0, 1, 0.6392157, 1,
-0.1583112, -0.02255081, -1.46137, 0, 1, 0.6470588, 1,
-0.1537534, 1.274143, -0.7544371, 0, 1, 0.6509804, 1,
-0.1526531, 1.51154, 0.1137931, 0, 1, 0.6588235, 1,
-0.1517934, -0.5823721, -2.663809, 0, 1, 0.6627451, 1,
-0.1491989, -1.322052, -4.001227, 0, 1, 0.6705883, 1,
-0.149158, -0.6364378, -2.074137, 0, 1, 0.6745098, 1,
-0.1491354, -2.239172, -3.421153, 0, 1, 0.682353, 1,
-0.1485523, -0.8335724, -2.691344, 0, 1, 0.6862745, 1,
-0.1481596, 0.3623559, -1.740474, 0, 1, 0.6941177, 1,
-0.1475851, 0.3992356, -0.3805229, 0, 1, 0.7019608, 1,
-0.1472284, 0.3129191, -2.286705, 0, 1, 0.7058824, 1,
-0.1469404, 0.8017839, -1.483327, 0, 1, 0.7137255, 1,
-0.1464289, 0.3606338, 1.880761, 0, 1, 0.7176471, 1,
-0.1392377, 1.035895, -0.2632045, 0, 1, 0.7254902, 1,
-0.1347646, -0.8440143, -3.729589, 0, 1, 0.7294118, 1,
-0.1342441, -1.984478, -3.78994, 0, 1, 0.7372549, 1,
-0.1327496, 1.276077, -0.4353041, 0, 1, 0.7411765, 1,
-0.1322701, 0.0675146, -2.672868, 0, 1, 0.7490196, 1,
-0.1234175, -0.5575832, -2.208175, 0, 1, 0.7529412, 1,
-0.1217829, -0.01870013, -1.74369, 0, 1, 0.7607843, 1,
-0.1209329, -1.530428, -4.584879, 0, 1, 0.7647059, 1,
-0.1191708, 0.01539814, -0.4447504, 0, 1, 0.772549, 1,
-0.1190117, 1.794444, -0.6116039, 0, 1, 0.7764706, 1,
-0.1142086, -1.50468, -2.103329, 0, 1, 0.7843137, 1,
-0.1093945, 0.785623, -0.3644219, 0, 1, 0.7882353, 1,
-0.1041136, -0.4970582, -1.816592, 0, 1, 0.7960784, 1,
-0.09997848, -0.6595142, -2.714866, 0, 1, 0.8039216, 1,
-0.09688794, 1.416579, 1.157322, 0, 1, 0.8078431, 1,
-0.09684495, 0.7498009, -1.050812, 0, 1, 0.8156863, 1,
-0.09668249, -0.7659118, -4.127697, 0, 1, 0.8196079, 1,
-0.09635834, -1.474014, -3.896314, 0, 1, 0.827451, 1,
-0.09632, -0.471047, -3.320193, 0, 1, 0.8313726, 1,
-0.09222943, 1.813486, -1.422789, 0, 1, 0.8392157, 1,
-0.09202143, -1.463848, -4.417816, 0, 1, 0.8431373, 1,
-0.08772299, -0.7339631, -2.777148, 0, 1, 0.8509804, 1,
-0.08540393, 0.6336293, -0.05113088, 0, 1, 0.854902, 1,
-0.08522945, -0.4407625, -2.400213, 0, 1, 0.8627451, 1,
-0.08495991, -0.8848958, -3.265663, 0, 1, 0.8666667, 1,
-0.0844276, -0.7281553, -2.50855, 0, 1, 0.8745098, 1,
-0.07631528, -0.01891045, -0.314181, 0, 1, 0.8784314, 1,
-0.07593846, 1.248819, 0.3417212, 0, 1, 0.8862745, 1,
-0.07462826, -2.022577, -1.961547, 0, 1, 0.8901961, 1,
-0.0744233, 1.181691, -1.307446, 0, 1, 0.8980392, 1,
-0.07240214, -0.5164669, -3.214294, 0, 1, 0.9058824, 1,
-0.07009125, -0.5250246, -3.230393, 0, 1, 0.9098039, 1,
-0.06954001, -0.4665164, -3.392974, 0, 1, 0.9176471, 1,
-0.06947649, -0.1297558, -0.8449265, 0, 1, 0.9215686, 1,
-0.06895073, -0.06971987, -0.37892, 0, 1, 0.9294118, 1,
-0.06468955, -0.7620681, -4.007734, 0, 1, 0.9333333, 1,
-0.06046142, -0.2034221, -2.904209, 0, 1, 0.9411765, 1,
-0.05941235, -2.527514, -2.519865, 0, 1, 0.945098, 1,
-0.05817392, 0.4731273, 0.8189224, 0, 1, 0.9529412, 1,
-0.0579966, 1.074381, 0.766699, 0, 1, 0.9568627, 1,
-0.05796055, 0.3110274, 0.8994032, 0, 1, 0.9647059, 1,
-0.05415976, -0.5960593, -2.626735, 0, 1, 0.9686275, 1,
-0.05190244, -0.2771453, -3.164956, 0, 1, 0.9764706, 1,
-0.04742663, -0.07953276, -1.627105, 0, 1, 0.9803922, 1,
-0.04479906, -0.1337025, -2.617072, 0, 1, 0.9882353, 1,
-0.04443934, -1.586545, -3.75197, 0, 1, 0.9921569, 1,
-0.04385355, 0.3863271, -1.527026, 0, 1, 1, 1,
-0.04050224, -0.685262, -2.041162, 0, 0.9921569, 1, 1,
-0.0403881, -0.03052622, -2.36605, 0, 0.9882353, 1, 1,
-0.03291276, -0.7057123, -2.280725, 0, 0.9803922, 1, 1,
-0.03066581, -0.6581395, -3.19187, 0, 0.9764706, 1, 1,
-0.02944044, 0.7124102, -0.2838251, 0, 0.9686275, 1, 1,
-0.02376663, 0.7244893, -0.7231577, 0, 0.9647059, 1, 1,
-0.02091852, 1.166098, -0.1908295, 0, 0.9568627, 1, 1,
-0.02040459, 0.7516008, 0.504553, 0, 0.9529412, 1, 1,
-0.01637076, -1.479345, -3.357336, 0, 0.945098, 1, 1,
-0.01632472, -0.08963099, -2.918619, 0, 0.9411765, 1, 1,
-0.01542205, 1.063025, -1.490154, 0, 0.9333333, 1, 1,
-0.01083845, -0.4691764, -1.591844, 0, 0.9294118, 1, 1,
-0.008271633, 0.9525694, -0.6735858, 0, 0.9215686, 1, 1,
-0.006189591, 0.05679272, 0.134637, 0, 0.9176471, 1, 1,
-0.004094339, -0.8989093, -2.279696, 0, 0.9098039, 1, 1,
-0.003490281, 0.3628312, -0.6724958, 0, 0.9058824, 1, 1,
-0.002916482, -0.006899659, -4.232122, 0, 0.8980392, 1, 1,
-0.002532662, 1.24571, -0.34691, 0, 0.8901961, 1, 1,
0.003826101, -1.138074, 4.120156, 0, 0.8862745, 1, 1,
0.008556789, -0.6406631, 4.848296, 0, 0.8784314, 1, 1,
0.01229853, 0.2564833, 0.7892175, 0, 0.8745098, 1, 1,
0.01589807, 1.076016, -0.4574851, 0, 0.8666667, 1, 1,
0.01723114, -0.4420978, 5.16227, 0, 0.8627451, 1, 1,
0.02269489, 0.2851221, -0.7741972, 0, 0.854902, 1, 1,
0.02410106, -1.307119, 2.49087, 0, 0.8509804, 1, 1,
0.02808964, -1.13553, 3.272606, 0, 0.8431373, 1, 1,
0.03311824, -0.7275274, 3.630607, 0, 0.8392157, 1, 1,
0.03651254, -0.3193207, 3.070638, 0, 0.8313726, 1, 1,
0.04029459, -0.1700058, 3.931132, 0, 0.827451, 1, 1,
0.04256367, 0.7835656, 0.4998081, 0, 0.8196079, 1, 1,
0.04337417, -0.8646327, 4.099441, 0, 0.8156863, 1, 1,
0.04343449, 0.8280379, -2.739097, 0, 0.8078431, 1, 1,
0.04473294, -0.1225627, 3.398543, 0, 0.8039216, 1, 1,
0.04543738, 0.6937571, -0.340791, 0, 0.7960784, 1, 1,
0.04688266, -1.517702, 1.959401, 0, 0.7882353, 1, 1,
0.04877383, 0.2767407, -0.6646624, 0, 0.7843137, 1, 1,
0.05465854, 0.4441222, 0.5396714, 0, 0.7764706, 1, 1,
0.05553892, -1.128065, 3.100979, 0, 0.772549, 1, 1,
0.05702794, -0.8105465, 1.337094, 0, 0.7647059, 1, 1,
0.05930486, -1.024956, 5.304421, 0, 0.7607843, 1, 1,
0.06080599, -0.1698655, 3.121983, 0, 0.7529412, 1, 1,
0.06149982, 1.775053, 0.437724, 0, 0.7490196, 1, 1,
0.06295645, -0.2704395, 3.218326, 0, 0.7411765, 1, 1,
0.06507259, 0.4050645, 2.515643, 0, 0.7372549, 1, 1,
0.06554157, 2.016164, -1.531983, 0, 0.7294118, 1, 1,
0.06723165, 1.103558, 2.37049, 0, 0.7254902, 1, 1,
0.06875763, -0.7986087, 2.601267, 0, 0.7176471, 1, 1,
0.06951367, -0.9898987, 3.720747, 0, 0.7137255, 1, 1,
0.07281435, -0.7662583, 4.651286, 0, 0.7058824, 1, 1,
0.07376656, -0.1820063, 2.739446, 0, 0.6980392, 1, 1,
0.07601593, 0.5105654, 0.08076712, 0, 0.6941177, 1, 1,
0.07615359, -1.913645, 4.420253, 0, 0.6862745, 1, 1,
0.07945611, 0.993412, 1.303595, 0, 0.682353, 1, 1,
0.08047271, 0.9082257, -1.248978, 0, 0.6745098, 1, 1,
0.08335572, -0.7820244, 3.214994, 0, 0.6705883, 1, 1,
0.08733536, -0.6384142, 2.766312, 0, 0.6627451, 1, 1,
0.08830123, 0.6435188, -0.2027829, 0, 0.6588235, 1, 1,
0.08939049, 0.1798398, -0.2149152, 0, 0.6509804, 1, 1,
0.08974555, 0.0990366, 1.74618, 0, 0.6470588, 1, 1,
0.09186764, -0.16241, 3.255237, 0, 0.6392157, 1, 1,
0.09344035, 1.27755, 1.267358, 0, 0.6352941, 1, 1,
0.09561648, -1.062393, 1.988486, 0, 0.627451, 1, 1,
0.09673314, 2.352212, -0.2906824, 0, 0.6235294, 1, 1,
0.0982571, -0.6545525, 3.038878, 0, 0.6156863, 1, 1,
0.1025142, -0.4863973, 3.965962, 0, 0.6117647, 1, 1,
0.1052605, 0.08893313, 0.4434082, 0, 0.6039216, 1, 1,
0.1059621, -1.442585, 2.601914, 0, 0.5960785, 1, 1,
0.1100883, -0.2667741, 4.438473, 0, 0.5921569, 1, 1,
0.1175704, 1.752235, -1.533627, 0, 0.5843138, 1, 1,
0.1205016, -0.1720005, 2.150326, 0, 0.5803922, 1, 1,
0.1231456, 0.5833727, 0.8495554, 0, 0.572549, 1, 1,
0.1238893, -0.7256346, 2.119655, 0, 0.5686275, 1, 1,
0.1253638, 0.6563588, 1.901116, 0, 0.5607843, 1, 1,
0.1256871, -0.3909017, 2.901896, 0, 0.5568628, 1, 1,
0.1264295, -0.1735505, 3.547353, 0, 0.5490196, 1, 1,
0.1271687, 0.9034057, -0.3337962, 0, 0.5450981, 1, 1,
0.1283757, 0.2821516, 1.741787, 0, 0.5372549, 1, 1,
0.1314649, -1.536677, 2.874763, 0, 0.5333334, 1, 1,
0.1360521, -1.314, 2.174457, 0, 0.5254902, 1, 1,
0.1405387, 0.4282046, 0.843089, 0, 0.5215687, 1, 1,
0.1440936, -0.1506794, 1.786445, 0, 0.5137255, 1, 1,
0.1493053, -0.6379167, 2.784594, 0, 0.509804, 1, 1,
0.155672, -0.6174547, 2.882835, 0, 0.5019608, 1, 1,
0.1620045, -0.6298538, 4.740196, 0, 0.4941176, 1, 1,
0.1721605, -1.236884, 1.977524, 0, 0.4901961, 1, 1,
0.1740628, 1.500797, -0.4551157, 0, 0.4823529, 1, 1,
0.1746625, -0.3411179, 3.75803, 0, 0.4784314, 1, 1,
0.1784739, 0.5707776, 0.4266109, 0, 0.4705882, 1, 1,
0.1847313, 0.278226, -0.1853679, 0, 0.4666667, 1, 1,
0.1849684, 0.5915735, -0.09297899, 0, 0.4588235, 1, 1,
0.185398, -0.2306412, 1.860158, 0, 0.454902, 1, 1,
0.1888423, -0.1279057, 3.137101, 0, 0.4470588, 1, 1,
0.1931443, 0.6956851, -0.6494048, 0, 0.4431373, 1, 1,
0.1935286, 2.011529, -0.09697367, 0, 0.4352941, 1, 1,
0.200876, -1.035472, 0.9272729, 0, 0.4313726, 1, 1,
0.2104504, -1.033576, 2.8952, 0, 0.4235294, 1, 1,
0.2131165, 0.6008779, 0.1618674, 0, 0.4196078, 1, 1,
0.2148421, -0.4612978, 3.554675, 0, 0.4117647, 1, 1,
0.2262693, 1.043055, 1.748834, 0, 0.4078431, 1, 1,
0.2354245, 1.298654, 0.974255, 0, 0.4, 1, 1,
0.2359271, -0.316837, 1.774407, 0, 0.3921569, 1, 1,
0.2364785, 0.0763833, 1.931386, 0, 0.3882353, 1, 1,
0.2371885, 0.4284161, 2.221698, 0, 0.3803922, 1, 1,
0.243351, 0.2562522, -0.07366981, 0, 0.3764706, 1, 1,
0.2448524, 0.2261723, 0.1280541, 0, 0.3686275, 1, 1,
0.2456073, -1.132351, 2.909112, 0, 0.3647059, 1, 1,
0.2518322, -1.725601, 3.314537, 0, 0.3568628, 1, 1,
0.257934, 0.5813135, -0.4145347, 0, 0.3529412, 1, 1,
0.2623031, -0.2902119, 3.611941, 0, 0.345098, 1, 1,
0.2642791, -0.4705093, 2.923517, 0, 0.3411765, 1, 1,
0.2685569, 0.414118, -0.9074959, 0, 0.3333333, 1, 1,
0.2694968, -0.2951589, 3.992394, 0, 0.3294118, 1, 1,
0.2714771, -0.5465273, 3.014522, 0, 0.3215686, 1, 1,
0.2722759, -1.031595, 3.240321, 0, 0.3176471, 1, 1,
0.2743978, 0.5309685, 0.1598784, 0, 0.3098039, 1, 1,
0.2748149, 2.298254, -1.502936, 0, 0.3058824, 1, 1,
0.2763904, -0.3553743, 2.373327, 0, 0.2980392, 1, 1,
0.2770468, 1.845554, 0.1948212, 0, 0.2901961, 1, 1,
0.2823841, 0.1830313, 0.2735434, 0, 0.2862745, 1, 1,
0.2844915, -0.1356169, 1.125361, 0, 0.2784314, 1, 1,
0.2849911, 0.9276437, 2.165816, 0, 0.2745098, 1, 1,
0.286751, -1.224881, 4.530815, 0, 0.2666667, 1, 1,
0.291198, -0.1158299, 1.021006, 0, 0.2627451, 1, 1,
0.2919707, -1.311579, 2.463897, 0, 0.254902, 1, 1,
0.2968413, -1.419361, 1.169391, 0, 0.2509804, 1, 1,
0.3025491, -0.4201472, 3.573695, 0, 0.2431373, 1, 1,
0.3041479, -0.2888561, 3.414607, 0, 0.2392157, 1, 1,
0.308004, 0.1625754, 2.731263, 0, 0.2313726, 1, 1,
0.3086988, -1.267433, 2.712445, 0, 0.227451, 1, 1,
0.309517, -0.4742115, 2.83624, 0, 0.2196078, 1, 1,
0.3104886, 0.3163038, 0.5258517, 0, 0.2156863, 1, 1,
0.3184978, 0.5525278, 0.1192748, 0, 0.2078431, 1, 1,
0.3191568, -0.6238542, 3.939228, 0, 0.2039216, 1, 1,
0.320513, -1.066559, 3.139725, 0, 0.1960784, 1, 1,
0.3226452, 1.337508, -0.1648898, 0, 0.1882353, 1, 1,
0.323402, -0.5234929, 1.66907, 0, 0.1843137, 1, 1,
0.3249434, -0.6546122, 2.471153, 0, 0.1764706, 1, 1,
0.326517, -0.2755196, 3.191181, 0, 0.172549, 1, 1,
0.3274571, 1.630404, 1.913975, 0, 0.1647059, 1, 1,
0.33049, 0.05840178, 2.065692, 0, 0.1607843, 1, 1,
0.332036, -0.6688828, 2.443679, 0, 0.1529412, 1, 1,
0.3343925, 0.07032245, 1.303717, 0, 0.1490196, 1, 1,
0.3392201, 0.9187766, 0.4315001, 0, 0.1411765, 1, 1,
0.3404846, -0.3549385, 3.22857, 0, 0.1372549, 1, 1,
0.3440318, -0.9444012, 1.057225, 0, 0.1294118, 1, 1,
0.3447363, -0.3265662, 1.006212, 0, 0.1254902, 1, 1,
0.3464283, 0.4081078, -0.4623089, 0, 0.1176471, 1, 1,
0.353701, 0.3945497, 2.224756, 0, 0.1137255, 1, 1,
0.3539875, 0.1027749, 1.09612, 0, 0.1058824, 1, 1,
0.3612666, -0.9838323, 1.359326, 0, 0.09803922, 1, 1,
0.3622199, 0.8188919, 1.480527, 0, 0.09411765, 1, 1,
0.362541, 0.4384468, 2.276679, 0, 0.08627451, 1, 1,
0.3669459, 0.3617604, 0.4241552, 0, 0.08235294, 1, 1,
0.3670564, 0.5274335, 0.3781655, 0, 0.07450981, 1, 1,
0.3679892, -0.5173112, 0.6019703, 0, 0.07058824, 1, 1,
0.3720168, -1.155204, 2.676269, 0, 0.0627451, 1, 1,
0.372534, -0.6387452, 2.204927, 0, 0.05882353, 1, 1,
0.373782, -2.017226, 2.890072, 0, 0.05098039, 1, 1,
0.3740477, 1.092414, 0.4698629, 0, 0.04705882, 1, 1,
0.3792762, -0.1327291, 0.7768191, 0, 0.03921569, 1, 1,
0.3803824, 0.4224496, 0.5500631, 0, 0.03529412, 1, 1,
0.3815214, 0.07281297, -0.348205, 0, 0.02745098, 1, 1,
0.382285, -1.492073, 2.088446, 0, 0.02352941, 1, 1,
0.3824625, 1.249511, 0.4763653, 0, 0.01568628, 1, 1,
0.3865179, 0.8832165, 1.403611, 0, 0.01176471, 1, 1,
0.3871964, 0.3658466, 2.112159, 0, 0.003921569, 1, 1,
0.3888824, -1.351696, 3.223767, 0.003921569, 0, 1, 1,
0.391346, -1.145212, 1.917387, 0.007843138, 0, 1, 1,
0.3924715, -0.290455, 0.6986222, 0.01568628, 0, 1, 1,
0.3951942, 0.2792962, 1.026096, 0.01960784, 0, 1, 1,
0.3974147, 1.318651, 0.8311999, 0.02745098, 0, 1, 1,
0.4002876, 1.116589, 0.2772715, 0.03137255, 0, 1, 1,
0.4005812, -0.6325601, 1.386892, 0.03921569, 0, 1, 1,
0.4041968, -1.239361, 3.17063, 0.04313726, 0, 1, 1,
0.4091898, -0.1495737, 4.13052, 0.05098039, 0, 1, 1,
0.4097333, -0.03745147, 2.042547, 0.05490196, 0, 1, 1,
0.4107136, 0.2591207, 0.8329466, 0.0627451, 0, 1, 1,
0.4135451, 0.1376253, 0.3102147, 0.06666667, 0, 1, 1,
0.416443, -0.07812844, 1.529415, 0.07450981, 0, 1, 1,
0.4173458, 1.277873, 0.0694288, 0.07843138, 0, 1, 1,
0.4200801, -0.1784779, 3.155398, 0.08627451, 0, 1, 1,
0.4313965, -1.001202, 3.023872, 0.09019608, 0, 1, 1,
0.4323721, -0.5629526, 0.1833712, 0.09803922, 0, 1, 1,
0.4390539, -0.2654397, 2.531651, 0.1058824, 0, 1, 1,
0.4498496, 1.35828, 1.604681, 0.1098039, 0, 1, 1,
0.4572933, -0.4578677, 2.887121, 0.1176471, 0, 1, 1,
0.4648542, -0.2573886, 1.059949, 0.1215686, 0, 1, 1,
0.4655135, 1.366078, -0.514779, 0.1294118, 0, 1, 1,
0.472559, -0.197249, 4.368622, 0.1333333, 0, 1, 1,
0.4730215, 1.444337, 1.281801, 0.1411765, 0, 1, 1,
0.4740948, -0.4613954, 3.091543, 0.145098, 0, 1, 1,
0.4779679, 1.591271, 0.04586579, 0.1529412, 0, 1, 1,
0.4810602, 0.7173955, -0.8150567, 0.1568628, 0, 1, 1,
0.4860887, -0.4493569, 2.966485, 0.1647059, 0, 1, 1,
0.4876658, -0.3839649, 2.450145, 0.1686275, 0, 1, 1,
0.4915178, 0.3039297, -0.3582418, 0.1764706, 0, 1, 1,
0.4973906, 0.0808591, 0.05869231, 0.1803922, 0, 1, 1,
0.4988662, 0.3788492, 2.587836, 0.1882353, 0, 1, 1,
0.4989187, 2.024197, 1.13552, 0.1921569, 0, 1, 1,
0.4992343, 1.278248, 1.090483, 0.2, 0, 1, 1,
0.5027099, -0.4806212, 0.7674863, 0.2078431, 0, 1, 1,
0.5057233, -0.7641326, 2.349166, 0.2117647, 0, 1, 1,
0.5091954, -0.995841, 2.730877, 0.2196078, 0, 1, 1,
0.5101241, 0.6426343, -0.4169415, 0.2235294, 0, 1, 1,
0.5131805, -1.287665, 4.326908, 0.2313726, 0, 1, 1,
0.5132393, -0.9351617, 3.805394, 0.2352941, 0, 1, 1,
0.5146513, 0.6982725, 0.3823246, 0.2431373, 0, 1, 1,
0.5154758, 0.9402699, -0.4598559, 0.2470588, 0, 1, 1,
0.5242726, 0.687485, 1.89131, 0.254902, 0, 1, 1,
0.5248585, 0.7173327, 1.615504, 0.2588235, 0, 1, 1,
0.5322687, 0.3013223, 2.202659, 0.2666667, 0, 1, 1,
0.5362868, -0.1429605, 3.367419, 0.2705882, 0, 1, 1,
0.5372831, -0.002958341, 1.109114, 0.2784314, 0, 1, 1,
0.5390286, -1.196762, 3.450338, 0.282353, 0, 1, 1,
0.5390598, -0.4538458, 2.204842, 0.2901961, 0, 1, 1,
0.5394944, -1.649518, 4.42686, 0.2941177, 0, 1, 1,
0.5396582, -0.0004024749, 2.397127, 0.3019608, 0, 1, 1,
0.5411453, 0.1130687, 0.6316402, 0.3098039, 0, 1, 1,
0.5427654, -0.6263789, 1.01956, 0.3137255, 0, 1, 1,
0.5499353, -0.6243176, 1.244183, 0.3215686, 0, 1, 1,
0.5511549, -2.159645, 3.943419, 0.3254902, 0, 1, 1,
0.5512498, 0.952554, 0.1925451, 0.3333333, 0, 1, 1,
0.5524219, -0.7256975, 2.066926, 0.3372549, 0, 1, 1,
0.5531394, -1.231417, 2.836064, 0.345098, 0, 1, 1,
0.5557747, 0.2943312, 2.404308, 0.3490196, 0, 1, 1,
0.557094, -0.7818962, 2.261644, 0.3568628, 0, 1, 1,
0.5622893, 0.9743924, 0.03106056, 0.3607843, 0, 1, 1,
0.5679614, -0.7302033, 1.632035, 0.3686275, 0, 1, 1,
0.57529, -0.795123, 4.763574, 0.372549, 0, 1, 1,
0.5794275, -0.5942703, 1.029592, 0.3803922, 0, 1, 1,
0.5798369, 0.1771949, 1.059329, 0.3843137, 0, 1, 1,
0.5809145, 1.489189, 0.1269339, 0.3921569, 0, 1, 1,
0.5846751, -1.630588, 2.915092, 0.3960784, 0, 1, 1,
0.5851707, 0.5749651, 0.9098395, 0.4039216, 0, 1, 1,
0.5966655, 0.4234973, -0.7080202, 0.4117647, 0, 1, 1,
0.5995961, 0.3656914, 1.292518, 0.4156863, 0, 1, 1,
0.603922, -0.3011533, 1.590922, 0.4235294, 0, 1, 1,
0.6116786, -0.4021708, 3.237331, 0.427451, 0, 1, 1,
0.6125559, 1.851821, -2.415336, 0.4352941, 0, 1, 1,
0.615602, 1.378039, 0.3923733, 0.4392157, 0, 1, 1,
0.6192335, 0.8432158, -0.6851762, 0.4470588, 0, 1, 1,
0.6249033, 0.986603, 0.4511325, 0.4509804, 0, 1, 1,
0.6252974, -0.1939929, 3.481596, 0.4588235, 0, 1, 1,
0.6286969, -0.8228644, 4.310751, 0.4627451, 0, 1, 1,
0.6293092, 0.6629255, 0.2053143, 0.4705882, 0, 1, 1,
0.6293635, -1.321114, 3.863209, 0.4745098, 0, 1, 1,
0.6328023, -0.8116647, 2.804548, 0.4823529, 0, 1, 1,
0.6340701, 0.7746628, 1.501334, 0.4862745, 0, 1, 1,
0.6359991, 1.808553, 1.219275, 0.4941176, 0, 1, 1,
0.6427215, 1.584374, 1.440611, 0.5019608, 0, 1, 1,
0.642978, 0.05941746, 0.594983, 0.5058824, 0, 1, 1,
0.6458188, -0.1316563, 2.306779, 0.5137255, 0, 1, 1,
0.651202, -0.3163042, 3.971292, 0.5176471, 0, 1, 1,
0.658287, 1.029554, 0.5410329, 0.5254902, 0, 1, 1,
0.6610405, -0.1028172, 2.982219, 0.5294118, 0, 1, 1,
0.6722586, 0.5499262, -0.8332013, 0.5372549, 0, 1, 1,
0.6751652, 0.5982005, -0.2003661, 0.5411765, 0, 1, 1,
0.6780162, 1.015066, 0.845075, 0.5490196, 0, 1, 1,
0.6826184, -0.6195621, 2.161922, 0.5529412, 0, 1, 1,
0.6847727, -0.2444984, 1.439359, 0.5607843, 0, 1, 1,
0.6868865, 0.007768467, 3.414143, 0.5647059, 0, 1, 1,
0.6880063, 0.193634, 0.4101518, 0.572549, 0, 1, 1,
0.6890889, -0.6943161, 1.363837, 0.5764706, 0, 1, 1,
0.6919404, 0.9444523, 0.9888226, 0.5843138, 0, 1, 1,
0.6933801, -1.663306, 3.084595, 0.5882353, 0, 1, 1,
0.6941063, 0.4915103, -0.1556796, 0.5960785, 0, 1, 1,
0.7035502, 1.863484, -0.0650985, 0.6039216, 0, 1, 1,
0.7038338, -0.07197244, 3.761869, 0.6078432, 0, 1, 1,
0.7058436, 0.321436, 0.9752011, 0.6156863, 0, 1, 1,
0.7091461, -0.5941825, 1.787164, 0.6196079, 0, 1, 1,
0.7176561, 2.177284, 0.5944125, 0.627451, 0, 1, 1,
0.7209437, -0.3042573, 2.304956, 0.6313726, 0, 1, 1,
0.7221501, 1.187645, 0.3619027, 0.6392157, 0, 1, 1,
0.730505, -0.301634, 1.272101, 0.6431373, 0, 1, 1,
0.7306322, -0.5124406, 2.692462, 0.6509804, 0, 1, 1,
0.7336217, 1.117701, 0.5656581, 0.654902, 0, 1, 1,
0.7375379, -0.9144176, 1.352676, 0.6627451, 0, 1, 1,
0.738197, -1.115549, 1.251252, 0.6666667, 0, 1, 1,
0.7444539, -0.06417837, 1.111188, 0.6745098, 0, 1, 1,
0.7448823, -0.9523034, 1.455597, 0.6784314, 0, 1, 1,
0.7449433, 0.09844193, 1.891129, 0.6862745, 0, 1, 1,
0.7475746, -0.2891896, 2.371411, 0.6901961, 0, 1, 1,
0.749732, 1.441624, -0.9819579, 0.6980392, 0, 1, 1,
0.7507711, -0.5144042, 2.467576, 0.7058824, 0, 1, 1,
0.7515503, -0.721252, 2.119281, 0.7098039, 0, 1, 1,
0.755852, -0.3984538, 3.298614, 0.7176471, 0, 1, 1,
0.75836, 0.3171985, 1.333254, 0.7215686, 0, 1, 1,
0.7598369, 0.2952244, 1.176479, 0.7294118, 0, 1, 1,
0.761228, -1.675278, 2.208325, 0.7333333, 0, 1, 1,
0.7725487, -1.89807, 3.393748, 0.7411765, 0, 1, 1,
0.7733921, 0.4770545, 0.4180357, 0.7450981, 0, 1, 1,
0.7771022, 1.10465, 1.592271, 0.7529412, 0, 1, 1,
0.7779581, 0.0483523, 3.118992, 0.7568628, 0, 1, 1,
0.7783176, -0.9752491, 1.931197, 0.7647059, 0, 1, 1,
0.7790701, 0.4666834, 0.6307211, 0.7686275, 0, 1, 1,
0.7833254, 1.285822, 1.390739, 0.7764706, 0, 1, 1,
0.7843315, -0.9741999, 2.942525, 0.7803922, 0, 1, 1,
0.7886089, 0.5367055, 2.699289, 0.7882353, 0, 1, 1,
0.7897003, 0.1930973, 1.394784, 0.7921569, 0, 1, 1,
0.7959713, -0.7223105, 2.816169, 0.8, 0, 1, 1,
0.8007557, 1.2433, 1.036676, 0.8078431, 0, 1, 1,
0.8029459, 0.1872465, 1.940582, 0.8117647, 0, 1, 1,
0.8096774, -2.176893, 2.944405, 0.8196079, 0, 1, 1,
0.8104054, 0.6430917, 0.5999692, 0.8235294, 0, 1, 1,
0.8112161, -0.3350928, 1.354679, 0.8313726, 0, 1, 1,
0.8179297, 0.4402137, 1.506413, 0.8352941, 0, 1, 1,
0.8223967, -0.331821, 0.6522453, 0.8431373, 0, 1, 1,
0.8226106, 0.09844892, 0.899261, 0.8470588, 0, 1, 1,
0.829752, 0.1947763, -0.3333946, 0.854902, 0, 1, 1,
0.8300089, -0.876145, 1.844932, 0.8588235, 0, 1, 1,
0.8356491, -0.1779469, 1.943902, 0.8666667, 0, 1, 1,
0.8357961, -0.2171997, 1.620865, 0.8705882, 0, 1, 1,
0.8359878, 0.1237474, 0.7226597, 0.8784314, 0, 1, 1,
0.8371801, -0.6252954, 3.56547, 0.8823529, 0, 1, 1,
0.8404241, 0.1275697, 0.5592514, 0.8901961, 0, 1, 1,
0.8445973, -1.125097, 2.455182, 0.8941177, 0, 1, 1,
0.8490674, 1.054732, -0.7370837, 0.9019608, 0, 1, 1,
0.8492781, 0.02336077, 0.4613092, 0.9098039, 0, 1, 1,
0.8509649, -0.7897458, 2.351207, 0.9137255, 0, 1, 1,
0.8561622, -0.360857, 1.103368, 0.9215686, 0, 1, 1,
0.8740553, 0.8260642, 0.8982285, 0.9254902, 0, 1, 1,
0.8762836, 0.6430551, 0.6107829, 0.9333333, 0, 1, 1,
0.8799293, 1.430805, 0.5682175, 0.9372549, 0, 1, 1,
0.8807244, -0.6282014, 2.234228, 0.945098, 0, 1, 1,
0.8901495, -0.6496946, 4.129774, 0.9490196, 0, 1, 1,
0.8929998, -0.03144373, 1.550507, 0.9568627, 0, 1, 1,
0.8951998, 1.267436, -1.504046, 0.9607843, 0, 1, 1,
0.90351, 1.812063, 0.540521, 0.9686275, 0, 1, 1,
0.9047629, -1.340806, -0.1097438, 0.972549, 0, 1, 1,
0.9049894, -0.385839, -0.06551591, 0.9803922, 0, 1, 1,
0.9105796, 0.1105892, 1.629473, 0.9843137, 0, 1, 1,
0.9127958, -0.6023189, 2.282921, 0.9921569, 0, 1, 1,
0.9154353, -0.5623807, 1.234422, 0.9960784, 0, 1, 1,
0.9180105, -0.1600865, 0.5826347, 1, 0, 0.9960784, 1,
0.921602, -0.04847289, 0.6225165, 1, 0, 0.9882353, 1,
0.9260772, -0.8090245, 2.78554, 1, 0, 0.9843137, 1,
0.9278081, -0.4320394, 1.181254, 1, 0, 0.9764706, 1,
0.9285955, 0.4373592, 1.215135, 1, 0, 0.972549, 1,
0.9350052, -0.1025937, 2.456029, 1, 0, 0.9647059, 1,
0.9432349, 0.2232937, 0.6729223, 1, 0, 0.9607843, 1,
0.9475926, -0.834244, 0.9908231, 1, 0, 0.9529412, 1,
0.950658, -1.571996, 2.635997, 1, 0, 0.9490196, 1,
0.9509416, -2.454019, 3.624264, 1, 0, 0.9411765, 1,
0.9513155, -0.5150644, 4.005026, 1, 0, 0.9372549, 1,
0.953338, -3.027218, 1.794353, 1, 0, 0.9294118, 1,
0.9545752, 0.4107412, 1.635212, 1, 0, 0.9254902, 1,
0.9619028, 2.172635, -0.6207698, 1, 0, 0.9176471, 1,
0.9640402, -1.70388, 3.100019, 1, 0, 0.9137255, 1,
0.9689946, 2.566772, -1.117642, 1, 0, 0.9058824, 1,
0.9718444, -1.176647, 1.512828, 1, 0, 0.9019608, 1,
0.9724951, -0.4021575, 2.667352, 1, 0, 0.8941177, 1,
0.9760426, -1.199353, 2.494465, 1, 0, 0.8862745, 1,
0.9767606, -0.3035254, 0.3554759, 1, 0, 0.8823529, 1,
0.9794313, -0.3147803, 2.319699, 1, 0, 0.8745098, 1,
0.981963, -1.938189, 1.515742, 1, 0, 0.8705882, 1,
0.9828243, 1.346807, -0.2821082, 1, 0, 0.8627451, 1,
0.9848903, -0.08620492, 4.392613, 1, 0, 0.8588235, 1,
0.9866898, -0.0007131456, 1.637097, 1, 0, 0.8509804, 1,
0.990095, 1.039833, 0.3601288, 1, 0, 0.8470588, 1,
0.9905671, 1.375175, 0.6174603, 1, 0, 0.8392157, 1,
0.9981152, 0.3655644, 0.5190421, 1, 0, 0.8352941, 1,
0.9982648, -0.4912535, 2.820544, 1, 0, 0.827451, 1,
1.001434, -0.4755905, 3.380187, 1, 0, 0.8235294, 1,
1.007131, 0.2405519, 1.120886, 1, 0, 0.8156863, 1,
1.013653, 1.816239, -0.2899413, 1, 0, 0.8117647, 1,
1.021241, -0.4378408, 0.8140709, 1, 0, 0.8039216, 1,
1.023651, 0.1617023, -0.3868707, 1, 0, 0.7960784, 1,
1.023897, -0.8288503, 2.359428, 1, 0, 0.7921569, 1,
1.02461, -0.6047335, 1.163266, 1, 0, 0.7843137, 1,
1.026006, -1.560515, 3.145399, 1, 0, 0.7803922, 1,
1.0293, 0.1447581, 0.9068747, 1, 0, 0.772549, 1,
1.031827, -0.5471867, 1.006163, 1, 0, 0.7686275, 1,
1.038899, 1.839753, -0.7778764, 1, 0, 0.7607843, 1,
1.040831, -0.1012455, 3.141145, 1, 0, 0.7568628, 1,
1.042432, 0.05158041, 0.1121118, 1, 0, 0.7490196, 1,
1.046277, -2.484889, 3.023603, 1, 0, 0.7450981, 1,
1.053174, -1.150399, 3.106904, 1, 0, 0.7372549, 1,
1.053945, 1.000422, 1.552256, 1, 0, 0.7333333, 1,
1.05651, -0.9041569, 2.785105, 1, 0, 0.7254902, 1,
1.057901, -0.4181733, 2.813285, 1, 0, 0.7215686, 1,
1.059749, -0.9801805, 3.163891, 1, 0, 0.7137255, 1,
1.066422, -0.3156297, 0.5656561, 1, 0, 0.7098039, 1,
1.07201, -0.4068249, 2.810472, 1, 0, 0.7019608, 1,
1.073587, -0.7023166, 2.018697, 1, 0, 0.6941177, 1,
1.075429, 0.5218291, 1.169725, 1, 0, 0.6901961, 1,
1.084173, -0.03174106, 0.669594, 1, 0, 0.682353, 1,
1.089918, 1.241617, -0.9130052, 1, 0, 0.6784314, 1,
1.095022, -0.8703241, 4.366408, 1, 0, 0.6705883, 1,
1.09528, 1.099599, 1.524634, 1, 0, 0.6666667, 1,
1.106413, 0.2558052, 1.805307, 1, 0, 0.6588235, 1,
1.119706, -0.4006891, 1.031198, 1, 0, 0.654902, 1,
1.123104, 0.5453607, 2.568887, 1, 0, 0.6470588, 1,
1.13417, 0.9140776, 1.73052, 1, 0, 0.6431373, 1,
1.136573, 0.2786967, 0.5147253, 1, 0, 0.6352941, 1,
1.137605, -0.1895573, 1.392492, 1, 0, 0.6313726, 1,
1.14215, -0.7469785, 2.11194, 1, 0, 0.6235294, 1,
1.145113, -0.5059525, 3.300547, 1, 0, 0.6196079, 1,
1.148952, 0.07613798, 0.9566692, 1, 0, 0.6117647, 1,
1.157909, 0.6554901, 0.5461464, 1, 0, 0.6078432, 1,
1.158509, 0.0841988, 2.643538, 1, 0, 0.6, 1,
1.165383, 1.649194, -0.4821177, 1, 0, 0.5921569, 1,
1.168018, -0.5286552, 2.247231, 1, 0, 0.5882353, 1,
1.172492, -0.02330519, 1.648627, 1, 0, 0.5803922, 1,
1.177527, -0.04978112, 0.9494441, 1, 0, 0.5764706, 1,
1.179384, 0.4914834, 1.950291, 1, 0, 0.5686275, 1,
1.185678, -0.09300806, 0.6128251, 1, 0, 0.5647059, 1,
1.187541, 0.7999597, -0.4659511, 1, 0, 0.5568628, 1,
1.196043, -1.212865, 1.577299, 1, 0, 0.5529412, 1,
1.198858, 1.177128, 0.478621, 1, 0, 0.5450981, 1,
1.221962, -0.1095883, 1.715533, 1, 0, 0.5411765, 1,
1.229791, 1.701445, -1.372222, 1, 0, 0.5333334, 1,
1.230213, -0.5205286, 3.468577, 1, 0, 0.5294118, 1,
1.23554, 0.5039515, -0.515638, 1, 0, 0.5215687, 1,
1.239581, 0.518805, 0.6264665, 1, 0, 0.5176471, 1,
1.240846, -0.4972708, 1.545807, 1, 0, 0.509804, 1,
1.248824, -3.177365, 2.681602, 1, 0, 0.5058824, 1,
1.250859, 1.322063, -0.9597854, 1, 0, 0.4980392, 1,
1.262347, 0.06739321, 0.8706821, 1, 0, 0.4901961, 1,
1.265567, 1.742608, 1.630376, 1, 0, 0.4862745, 1,
1.268115, 1.907465, 0.9756402, 1, 0, 0.4784314, 1,
1.276392, 0.2983573, 2.162314, 1, 0, 0.4745098, 1,
1.29113, -0.7164481, 2.383724, 1, 0, 0.4666667, 1,
1.294721, 1.032135, 0.7562977, 1, 0, 0.4627451, 1,
1.295793, -0.2163866, 4.112789, 1, 0, 0.454902, 1,
1.296383, 0.4433903, 2.614647, 1, 0, 0.4509804, 1,
1.30657, -0.1287351, 2.541892, 1, 0, 0.4431373, 1,
1.317438, -0.6782805, 0.8375829, 1, 0, 0.4392157, 1,
1.319408, -1.573135, 2.313425, 1, 0, 0.4313726, 1,
1.322283, -0.9517835, 2.796431, 1, 0, 0.427451, 1,
1.323327, -0.5394585, 2.661533, 1, 0, 0.4196078, 1,
1.355979, 0.8635951, -0.1510294, 1, 0, 0.4156863, 1,
1.359021, -0.3675225, 1.640185, 1, 0, 0.4078431, 1,
1.363353, 0.2676709, 2.687305, 1, 0, 0.4039216, 1,
1.367626, -0.348638, 4.047641, 1, 0, 0.3960784, 1,
1.369336, -0.8525046, 2.226519, 1, 0, 0.3882353, 1,
1.38683, 1.375549, -0.1215549, 1, 0, 0.3843137, 1,
1.387342, 0.3718646, 1.643069, 1, 0, 0.3764706, 1,
1.389773, 0.0674558, 0.8788, 1, 0, 0.372549, 1,
1.42161, 0.2599466, 1.310586, 1, 0, 0.3647059, 1,
1.426326, -0.7492768, 1.872463, 1, 0, 0.3607843, 1,
1.428264, -0.08746117, 0.5599372, 1, 0, 0.3529412, 1,
1.429149, 0.690988, 0.8707233, 1, 0, 0.3490196, 1,
1.436545, 0.2691617, 1.093868, 1, 0, 0.3411765, 1,
1.445667, 1.500545, -0.005070876, 1, 0, 0.3372549, 1,
1.453316, -0.5033489, 0.4934044, 1, 0, 0.3294118, 1,
1.481546, -1.681898, 2.205696, 1, 0, 0.3254902, 1,
1.483796, -2.079698, 2.192586, 1, 0, 0.3176471, 1,
1.49302, -0.6950385, 3.327251, 1, 0, 0.3137255, 1,
1.504697, 0.4857938, 2.362718, 1, 0, 0.3058824, 1,
1.505132, -0.3624347, 2.268451, 1, 0, 0.2980392, 1,
1.514897, -0.3381666, 2.44235, 1, 0, 0.2941177, 1,
1.520396, -2.392502, 2.915529, 1, 0, 0.2862745, 1,
1.522138, 0.2280323, 1.636949, 1, 0, 0.282353, 1,
1.539097, 1.070356, -0.3984834, 1, 0, 0.2745098, 1,
1.543917, 0.08945154, 1.143223, 1, 0, 0.2705882, 1,
1.554288, 1.203981, 1.212563, 1, 0, 0.2627451, 1,
1.571245, 1.119569, 1.674325, 1, 0, 0.2588235, 1,
1.585219, 0.8096814, 1.978673, 1, 0, 0.2509804, 1,
1.596574, -0.440219, 1.23885, 1, 0, 0.2470588, 1,
1.597392, 0.2254296, 0.7157116, 1, 0, 0.2392157, 1,
1.60854, 0.8943787, -0.02298558, 1, 0, 0.2352941, 1,
1.642815, 0.04017884, 0.6951592, 1, 0, 0.227451, 1,
1.654626, 0.8151407, 1.569032, 1, 0, 0.2235294, 1,
1.677374, -1.295474, 2.893108, 1, 0, 0.2156863, 1,
1.686043, 0.6231782, 2.229247, 1, 0, 0.2117647, 1,
1.698871, -0.172013, 1.318222, 1, 0, 0.2039216, 1,
1.710194, -0.05972814, 1.869997, 1, 0, 0.1960784, 1,
1.71503, -2.362417, 1.910322, 1, 0, 0.1921569, 1,
1.761422, -0.09718923, 1.482485, 1, 0, 0.1843137, 1,
1.772757, -1.380026, 0.4407198, 1, 0, 0.1803922, 1,
1.785612, 0.05978324, 1.509832, 1, 0, 0.172549, 1,
1.806902, 0.3617146, 2.06728, 1, 0, 0.1686275, 1,
1.815896, -0.699953, 1.111579, 1, 0, 0.1607843, 1,
1.82758, -0.4084696, 2.712224, 1, 0, 0.1568628, 1,
1.86312, -0.2054211, 1.60161, 1, 0, 0.1490196, 1,
1.863418, 0.5658342, 2.205572, 1, 0, 0.145098, 1,
1.886746, 1.397721, 0.4296103, 1, 0, 0.1372549, 1,
1.932125, 0.250911, 0.9236613, 1, 0, 0.1333333, 1,
1.98325, -0.2574413, 2.52898, 1, 0, 0.1254902, 1,
1.997581, -0.5153023, 2.648579, 1, 0, 0.1215686, 1,
2.000185, 1.98989, 1.107923, 1, 0, 0.1137255, 1,
2.008008, 0.1995078, 1.92587, 1, 0, 0.1098039, 1,
2.05962, -1.186815, 1.073803, 1, 0, 0.1019608, 1,
2.081355, -0.4306074, 2.996516, 1, 0, 0.09411765, 1,
2.088434, -0.8480492, 1.850204, 1, 0, 0.09019608, 1,
2.130332, 0.4801721, -0.3750208, 1, 0, 0.08235294, 1,
2.20051, -0.7133775, 0.9316109, 1, 0, 0.07843138, 1,
2.300547, 0.7698613, 1.823073, 1, 0, 0.07058824, 1,
2.304277, -0.2919391, 0.5887364, 1, 0, 0.06666667, 1,
2.354042, 1.267889, 0.6977112, 1, 0, 0.05882353, 1,
2.377029, -0.4368912, 2.959027, 1, 0, 0.05490196, 1,
2.387956, -0.2901532, 2.134273, 1, 0, 0.04705882, 1,
2.429667, 0.5671436, 1.139305, 1, 0, 0.04313726, 1,
2.439624, 2.447281, 0.3199398, 1, 0, 0.03529412, 1,
2.521476, -0.9521847, 3.50959, 1, 0, 0.03137255, 1,
2.528497, 0.5786023, 0.5491206, 1, 0, 0.02352941, 1,
2.561795, -0.8413575, 0.6574265, 1, 0, 0.01960784, 1,
2.767792, -1.629659, 0.5959479, 1, 0, 0.01176471, 1,
2.839423, -1.068774, 3.952015, 1, 0, 0.007843138, 1
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
-0.1982777, -4.260853, -6.810009, 0, -0.5, 0.5, 0.5,
-0.1982777, -4.260853, -6.810009, 1, -0.5, 0.5, 0.5,
-0.1982777, -4.260853, -6.810009, 1, 1.5, 0.5, 0.5,
-0.1982777, -4.260853, -6.810009, 0, 1.5, 0.5, 0.5
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
-4.265759, 0.01876545, -6.810009, 0, -0.5, 0.5, 0.5,
-4.265759, 0.01876545, -6.810009, 1, -0.5, 0.5, 0.5,
-4.265759, 0.01876545, -6.810009, 1, 1.5, 0.5, 0.5,
-4.265759, 0.01876545, -6.810009, 0, 1.5, 0.5, 0.5
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
-4.265759, -4.260853, 0.1251009, 0, -0.5, 0.5, 0.5,
-4.265759, -4.260853, 0.1251009, 1, -0.5, 0.5, 0.5,
-4.265759, -4.260853, 0.1251009, 1, 1.5, 0.5, 0.5,
-4.265759, -4.260853, 0.1251009, 0, 1.5, 0.5, 0.5
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
-3, -3.273249, -5.209599,
2, -3.273249, -5.209599,
-3, -3.273249, -5.209599,
-3, -3.43785, -5.476335,
-2, -3.273249, -5.209599,
-2, -3.43785, -5.476335,
-1, -3.273249, -5.209599,
-1, -3.43785, -5.476335,
0, -3.273249, -5.209599,
0, -3.43785, -5.476335,
1, -3.273249, -5.209599,
1, -3.43785, -5.476335,
2, -3.273249, -5.209599,
2, -3.43785, -5.476335
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
-3, -3.767051, -6.009804, 0, -0.5, 0.5, 0.5,
-3, -3.767051, -6.009804, 1, -0.5, 0.5, 0.5,
-3, -3.767051, -6.009804, 1, 1.5, 0.5, 0.5,
-3, -3.767051, -6.009804, 0, 1.5, 0.5, 0.5,
-2, -3.767051, -6.009804, 0, -0.5, 0.5, 0.5,
-2, -3.767051, -6.009804, 1, -0.5, 0.5, 0.5,
-2, -3.767051, -6.009804, 1, 1.5, 0.5, 0.5,
-2, -3.767051, -6.009804, 0, 1.5, 0.5, 0.5,
-1, -3.767051, -6.009804, 0, -0.5, 0.5, 0.5,
-1, -3.767051, -6.009804, 1, -0.5, 0.5, 0.5,
-1, -3.767051, -6.009804, 1, 1.5, 0.5, 0.5,
-1, -3.767051, -6.009804, 0, 1.5, 0.5, 0.5,
0, -3.767051, -6.009804, 0, -0.5, 0.5, 0.5,
0, -3.767051, -6.009804, 1, -0.5, 0.5, 0.5,
0, -3.767051, -6.009804, 1, 1.5, 0.5, 0.5,
0, -3.767051, -6.009804, 0, 1.5, 0.5, 0.5,
1, -3.767051, -6.009804, 0, -0.5, 0.5, 0.5,
1, -3.767051, -6.009804, 1, -0.5, 0.5, 0.5,
1, -3.767051, -6.009804, 1, 1.5, 0.5, 0.5,
1, -3.767051, -6.009804, 0, 1.5, 0.5, 0.5,
2, -3.767051, -6.009804, 0, -0.5, 0.5, 0.5,
2, -3.767051, -6.009804, 1, -0.5, 0.5, 0.5,
2, -3.767051, -6.009804, 1, 1.5, 0.5, 0.5,
2, -3.767051, -6.009804, 0, 1.5, 0.5, 0.5
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
-3.32711, -3, -5.209599,
-3.32711, 3, -5.209599,
-3.32711, -3, -5.209599,
-3.483552, -3, -5.476335,
-3.32711, -2, -5.209599,
-3.483552, -2, -5.476335,
-3.32711, -1, -5.209599,
-3.483552, -1, -5.476335,
-3.32711, 0, -5.209599,
-3.483552, 0, -5.476335,
-3.32711, 1, -5.209599,
-3.483552, 1, -5.476335,
-3.32711, 2, -5.209599,
-3.483552, 2, -5.476335,
-3.32711, 3, -5.209599,
-3.483552, 3, -5.476335
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
-3.796435, -3, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, -3, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, -3, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, -3, -6.009804, 0, 1.5, 0.5, 0.5,
-3.796435, -2, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, -2, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, -2, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, -2, -6.009804, 0, 1.5, 0.5, 0.5,
-3.796435, -1, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, -1, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, -1, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, -1, -6.009804, 0, 1.5, 0.5, 0.5,
-3.796435, 0, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, 0, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, 0, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, 0, -6.009804, 0, 1.5, 0.5, 0.5,
-3.796435, 1, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, 1, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, 1, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, 1, -6.009804, 0, 1.5, 0.5, 0.5,
-3.796435, 2, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, 2, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, 2, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, 2, -6.009804, 0, 1.5, 0.5, 0.5,
-3.796435, 3, -6.009804, 0, -0.5, 0.5, 0.5,
-3.796435, 3, -6.009804, 1, -0.5, 0.5, 0.5,
-3.796435, 3, -6.009804, 1, 1.5, 0.5, 0.5,
-3.796435, 3, -6.009804, 0, 1.5, 0.5, 0.5
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
-3.32711, -3.273249, -4,
-3.32711, -3.273249, 4,
-3.32711, -3.273249, -4,
-3.483552, -3.43785, -4,
-3.32711, -3.273249, -2,
-3.483552, -3.43785, -2,
-3.32711, -3.273249, 0,
-3.483552, -3.43785, 0,
-3.32711, -3.273249, 2,
-3.483552, -3.43785, 2,
-3.32711, -3.273249, 4,
-3.483552, -3.43785, 4
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
-3.796435, -3.767051, -4, 0, -0.5, 0.5, 0.5,
-3.796435, -3.767051, -4, 1, -0.5, 0.5, 0.5,
-3.796435, -3.767051, -4, 1, 1.5, 0.5, 0.5,
-3.796435, -3.767051, -4, 0, 1.5, 0.5, 0.5,
-3.796435, -3.767051, -2, 0, -0.5, 0.5, 0.5,
-3.796435, -3.767051, -2, 1, -0.5, 0.5, 0.5,
-3.796435, -3.767051, -2, 1, 1.5, 0.5, 0.5,
-3.796435, -3.767051, -2, 0, 1.5, 0.5, 0.5,
-3.796435, -3.767051, 0, 0, -0.5, 0.5, 0.5,
-3.796435, -3.767051, 0, 1, -0.5, 0.5, 0.5,
-3.796435, -3.767051, 0, 1, 1.5, 0.5, 0.5,
-3.796435, -3.767051, 0, 0, 1.5, 0.5, 0.5,
-3.796435, -3.767051, 2, 0, -0.5, 0.5, 0.5,
-3.796435, -3.767051, 2, 1, -0.5, 0.5, 0.5,
-3.796435, -3.767051, 2, 1, 1.5, 0.5, 0.5,
-3.796435, -3.767051, 2, 0, 1.5, 0.5, 0.5,
-3.796435, -3.767051, 4, 0, -0.5, 0.5, 0.5,
-3.796435, -3.767051, 4, 1, -0.5, 0.5, 0.5,
-3.796435, -3.767051, 4, 1, 1.5, 0.5, 0.5,
-3.796435, -3.767051, 4, 0, 1.5, 0.5, 0.5
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
-3.32711, -3.273249, -5.209599,
-3.32711, 3.31078, -5.209599,
-3.32711, -3.273249, 5.459801,
-3.32711, 3.31078, 5.459801,
-3.32711, -3.273249, -5.209599,
-3.32711, -3.273249, 5.459801,
-3.32711, 3.31078, -5.209599,
-3.32711, 3.31078, 5.459801,
-3.32711, -3.273249, -5.209599,
2.930554, -3.273249, -5.209599,
-3.32711, -3.273249, 5.459801,
2.930554, -3.273249, 5.459801,
-3.32711, 3.31078, -5.209599,
2.930554, 3.31078, -5.209599,
-3.32711, 3.31078, 5.459801,
2.930554, 3.31078, 5.459801,
2.930554, -3.273249, -5.209599,
2.930554, 3.31078, -5.209599,
2.930554, -3.273249, 5.459801,
2.930554, 3.31078, 5.459801,
2.930554, -3.273249, -5.209599,
2.930554, -3.273249, 5.459801,
2.930554, 3.31078, -5.209599,
2.930554, 3.31078, 5.459801
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
var radius = 7.482284;
var distance = 33.28952;
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
mvMatrix.translate( 0.1982777, -0.01876545, -0.1251009 );
mvMatrix.scale( 1.292813, 1.22873, 0.7582424 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.28952);
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
ethyl-3-methylcyclop<-read.table("ethyl-3-methylcyclop.xyz")
```

```
## Error in read.table("ethyl-3-methylcyclop.xyz"): no lines available in input
```

```r
x<-ethyl-3-methylcyclop$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
y<-ethyl-3-methylcyclop$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
```

```r
z<-ethyl-3-methylcyclop$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl' not found
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
-3.235979, -0.3942982, -1.610421, 0, 0, 1, 1, 1,
-2.825499, 1.521599, -0.0315323, 1, 0, 0, 1, 1,
-2.802511, 0.9042696, -2.326479, 1, 0, 0, 1, 1,
-2.6559, 0.714865, -2.401273, 1, 0, 0, 1, 1,
-2.638833, -0.5804431, -1.825937, 1, 0, 0, 1, 1,
-2.629441, 1.460398, -2.132565, 1, 0, 0, 1, 1,
-2.595054, 0.7678387, -0.9516038, 0, 0, 0, 1, 1,
-2.561671, 0.4456144, -1.343293, 0, 0, 0, 1, 1,
-2.39119, 0.7077247, -1.020034, 0, 0, 0, 1, 1,
-2.384694, 0.4492835, -1.691289, 0, 0, 0, 1, 1,
-2.371725, -0.8045707, -1.48121, 0, 0, 0, 1, 1,
-2.263539, 1.075503, -0.1168783, 0, 0, 0, 1, 1,
-2.244083, 0.888357, -1.764781, 0, 0, 0, 1, 1,
-2.165286, -0.2965136, -0.9677111, 1, 1, 1, 1, 1,
-2.158649, -2.166735, -4.305884, 1, 1, 1, 1, 1,
-2.158576, 1.370412, -2.654613, 1, 1, 1, 1, 1,
-2.155679, 0.7962916, -2.605602, 1, 1, 1, 1, 1,
-2.121925, -0.8934134, -1.739374, 1, 1, 1, 1, 1,
-2.11293, -0.09061297, -1.777101, 1, 1, 1, 1, 1,
-2.075744, 0.1715607, -3.436835, 1, 1, 1, 1, 1,
-2.061909, -0.6317761, -1.662482, 1, 1, 1, 1, 1,
-2.051307, 0.2598352, -1.739783, 1, 1, 1, 1, 1,
-1.955111, -0.2722497, -2.114179, 1, 1, 1, 1, 1,
-1.945799, -0.07937697, -0.1557315, 1, 1, 1, 1, 1,
-1.930215, -1.400446, -3.734316, 1, 1, 1, 1, 1,
-1.892786, 1.32758, -0.5813589, 1, 1, 1, 1, 1,
-1.887703, 0.1779969, -1.265381, 1, 1, 1, 1, 1,
-1.883691, -0.5614192, -0.3798111, 1, 1, 1, 1, 1,
-1.883218, -0.2616013, -2.118195, 0, 0, 1, 1, 1,
-1.882929, 0.4232322, -1.481914, 1, 0, 0, 1, 1,
-1.882781, 0.09517293, -1.94412, 1, 0, 0, 1, 1,
-1.85544, -1.930427, -1.218214, 1, 0, 0, 1, 1,
-1.854087, -0.4480668, -1.043059, 1, 0, 0, 1, 1,
-1.849157, -1.305782, -1.623785, 1, 0, 0, 1, 1,
-1.833696, 0.2975633, -2.777369, 0, 0, 0, 1, 1,
-1.83364, -0.243602, -3.373574, 0, 0, 0, 1, 1,
-1.828578, -0.972512, -3.806719, 0, 0, 0, 1, 1,
-1.826044, -0.9465427, -2.540765, 0, 0, 0, 1, 1,
-1.801679, -1.545448, -2.796577, 0, 0, 0, 1, 1,
-1.797387, -0.9293088, -1.787883, 0, 0, 0, 1, 1,
-1.771991, -0.3951943, -1.645705, 0, 0, 0, 1, 1,
-1.754351, 0.3233574, -0.7881847, 1, 1, 1, 1, 1,
-1.754101, 1.020929, -2.043501, 1, 1, 1, 1, 1,
-1.711333, -0.3629327, -0.7576473, 1, 1, 1, 1, 1,
-1.70978, 0.6554101, -1.635506, 1, 1, 1, 1, 1,
-1.707185, -0.6465182, -3.528684, 1, 1, 1, 1, 1,
-1.694376, 0.1805659, -1.876218, 1, 1, 1, 1, 1,
-1.688492, 0.2086457, -1.410088, 1, 1, 1, 1, 1,
-1.676498, 0.720266, -0.3016473, 1, 1, 1, 1, 1,
-1.662732, 0.07849865, 0.06825428, 1, 1, 1, 1, 1,
-1.602236, -0.0293847, -2.240583, 1, 1, 1, 1, 1,
-1.59412, 1.002668, -0.6880282, 1, 1, 1, 1, 1,
-1.590352, -2.413873, -4.247299, 1, 1, 1, 1, 1,
-1.560051, -1.392671, -0.6656372, 1, 1, 1, 1, 1,
-1.556144, -1.202772, -3.284281, 1, 1, 1, 1, 1,
-1.551454, -1.121596, -0.9735702, 1, 1, 1, 1, 1,
-1.549369, -0.6185327, -2.84965, 0, 0, 1, 1, 1,
-1.549348, -0.2666646, -2.255435, 1, 0, 0, 1, 1,
-1.531757, 0.09545384, -1.419815, 1, 0, 0, 1, 1,
-1.522182, -1.030047, -1.635956, 1, 0, 0, 1, 1,
-1.516791, -0.7806222, -1.945303, 1, 0, 0, 1, 1,
-1.502669, 1.583435, -0.36567, 1, 0, 0, 1, 1,
-1.502579, -0.02011501, -1.245577, 0, 0, 0, 1, 1,
-1.499818, 2.224206, -1.557475, 0, 0, 0, 1, 1,
-1.498879, 0.1954998, -2.645645, 0, 0, 0, 1, 1,
-1.489392, -0.1709559, -1.937317, 0, 0, 0, 1, 1,
-1.488981, 0.6228667, -1.066261, 0, 0, 0, 1, 1,
-1.480908, -0.1531163, -1.262155, 0, 0, 0, 1, 1,
-1.477762, -0.4454274, -1.790544, 0, 0, 0, 1, 1,
-1.474413, 0.5305966, -1.861862, 1, 1, 1, 1, 1,
-1.451405, 1.031342, -1.440173, 1, 1, 1, 1, 1,
-1.450869, 0.06729712, -0.5658973, 1, 1, 1, 1, 1,
-1.449199, -2.235, -2.366491, 1, 1, 1, 1, 1,
-1.446602, -0.1946302, -3.444845, 1, 1, 1, 1, 1,
-1.42728, 1.614797, -1.181304, 1, 1, 1, 1, 1,
-1.423829, 1.380869, -1.286164, 1, 1, 1, 1, 1,
-1.422775, 0.1460012, -0.05751193, 1, 1, 1, 1, 1,
-1.420763, 1.343576, -1.790701, 1, 1, 1, 1, 1,
-1.418637, 0.01978176, -0.789819, 1, 1, 1, 1, 1,
-1.409901, -1.391967, -0.8814906, 1, 1, 1, 1, 1,
-1.408333, 1.200251, -0.3111797, 1, 1, 1, 1, 1,
-1.390297, -0.02076269, -2.565015, 1, 1, 1, 1, 1,
-1.38069, -1.54797, -2.752152, 1, 1, 1, 1, 1,
-1.378115, -0.1502507, -2.818346, 1, 1, 1, 1, 1,
-1.377184, -3.028423, -4.135988, 0, 0, 1, 1, 1,
-1.363131, 0.5562648, -1.557799, 1, 0, 0, 1, 1,
-1.361034, 0.07243881, -1.145287, 1, 0, 0, 1, 1,
-1.358301, 2.307669, -1.072774, 1, 0, 0, 1, 1,
-1.345764, -0.9525615, -3.199853, 1, 0, 0, 1, 1,
-1.305279, -0.8354612, -0.8188822, 1, 0, 0, 1, 1,
-1.299346, 0.1045827, -2.717519, 0, 0, 0, 1, 1,
-1.2818, -1.739764, -2.123426, 0, 0, 0, 1, 1,
-1.281657, 1.016984, -0.833411, 0, 0, 0, 1, 1,
-1.277418, 0.3646751, -2.977162, 0, 0, 0, 1, 1,
-1.277072, -0.530571, -2.162441, 0, 0, 0, 1, 1,
-1.267619, -0.3600174, -2.59223, 0, 0, 0, 1, 1,
-1.265941, -0.1891696, -1.29105, 0, 0, 0, 1, 1,
-1.252765, -1.685526, -1.972318, 1, 1, 1, 1, 1,
-1.252727, 1.034028, 0.8693986, 1, 1, 1, 1, 1,
-1.249034, -0.6489003, -1.392358, 1, 1, 1, 1, 1,
-1.241735, 0.4103546, 0.1701897, 1, 1, 1, 1, 1,
-1.231842, -0.2570467, -1.373717, 1, 1, 1, 1, 1,
-1.227207, -0.7980703, -1.244556, 1, 1, 1, 1, 1,
-1.221722, -2.214141, -2.276246, 1, 1, 1, 1, 1,
-1.208891, -0.09640671, -1.67818, 1, 1, 1, 1, 1,
-1.205983, 0.1751733, -1.419944, 1, 1, 1, 1, 1,
-1.203082, 0.1889507, -1.986509, 1, 1, 1, 1, 1,
-1.191979, -1.120832, -1.748847, 1, 1, 1, 1, 1,
-1.178111, 1.865467, 0.5838646, 1, 1, 1, 1, 1,
-1.176918, -0.7382169, -3.474771, 1, 1, 1, 1, 1,
-1.170461, 0.7010119, -0.5281662, 1, 1, 1, 1, 1,
-1.164228, 1.334422, -0.426177, 1, 1, 1, 1, 1,
-1.1632, -0.7098603, -2.874559, 0, 0, 1, 1, 1,
-1.160191, -0.6639467, -1.857091, 1, 0, 0, 1, 1,
-1.152378, -0.4754106, -0.8829822, 1, 0, 0, 1, 1,
-1.15105, -0.4369533, -0.07376001, 1, 0, 0, 1, 1,
-1.149134, 0.2896691, -2.014377, 1, 0, 0, 1, 1,
-1.140599, 0.9676, -0.4818821, 1, 0, 0, 1, 1,
-1.140553, -0.7036182, -0.92948, 0, 0, 0, 1, 1,
-1.138229, 0.2614738, 1.105534, 0, 0, 0, 1, 1,
-1.137814, 1.900857, 0.008642007, 0, 0, 0, 1, 1,
-1.129904, 1.286503, -0.3425704, 0, 0, 0, 1, 1,
-1.128987, -0.2582086, 0.4930384, 0, 0, 0, 1, 1,
-1.118248, 1.62236, -0.8407767, 0, 0, 0, 1, 1,
-1.116541, -0.2667278, -2.088371, 0, 0, 0, 1, 1,
-1.115554, -0.4642046, 0.6710285, 1, 1, 1, 1, 1,
-1.108709, -0.3511748, -2.437272, 1, 1, 1, 1, 1,
-1.107051, 0.1864291, -2.067677, 1, 1, 1, 1, 1,
-1.102006, -0.2200675, -2.430805, 1, 1, 1, 1, 1,
-1.084267, 0.5189624, -1.1854, 1, 1, 1, 1, 1,
-1.082697, 1.279491, -0.9562334, 1, 1, 1, 1, 1,
-1.079582, -0.9524622, -3.522286, 1, 1, 1, 1, 1,
-1.079079, -0.004077891, -2.218761, 1, 1, 1, 1, 1,
-1.077003, -0.002434106, -0.7198361, 1, 1, 1, 1, 1,
-1.075511, -1.240546, -2.288375, 1, 1, 1, 1, 1,
-1.072351, -1.287951, -1.872119, 1, 1, 1, 1, 1,
-1.060153, 0.1452469, -0.6919027, 1, 1, 1, 1, 1,
-1.056004, 1.036834, -0.9310281, 1, 1, 1, 1, 1,
-1.041604, -1.662879, -2.023572, 1, 1, 1, 1, 1,
-1.039675, -1.486644, -2.321414, 1, 1, 1, 1, 1,
-1.034366, -1.478958, -2.980225, 0, 0, 1, 1, 1,
-1.031137, -0.558201, -0.1839388, 1, 0, 0, 1, 1,
-1.025641, 1.665653, 0.05094745, 1, 0, 0, 1, 1,
-1.023365, -0.6199222, -2.596062, 1, 0, 0, 1, 1,
-1.017173, -1.478778, -3.715847, 1, 0, 0, 1, 1,
-1.013701, 0.3399405, -0.8401092, 1, 0, 0, 1, 1,
-1.009605, -1.182985, -2.441008, 0, 0, 0, 1, 1,
-1.006495, -2.228506, -2.869845, 0, 0, 0, 1, 1,
-1.004138, -0.762248, -1.771778, 0, 0, 0, 1, 1,
-1.002766, -1.134116, -2.067469, 0, 0, 0, 1, 1,
-0.9973826, 0.9789775, -1.096685, 0, 0, 0, 1, 1,
-0.9969806, 1.515255, -2.744598, 0, 0, 0, 1, 1,
-0.9927614, -0.5041922, -2.327643, 0, 0, 0, 1, 1,
-0.9847591, -0.6800958, -2.47301, 1, 1, 1, 1, 1,
-0.9814686, -0.3395471, -2.195731, 1, 1, 1, 1, 1,
-0.9792261, 1.017944, -1.179026, 1, 1, 1, 1, 1,
-0.9785517, 0.7789888, -0.8641787, 1, 1, 1, 1, 1,
-0.9775264, 0.07824565, -0.9808707, 1, 1, 1, 1, 1,
-0.9716918, -0.4131316, -1.699143, 1, 1, 1, 1, 1,
-0.9598132, 0.1097228, -0.7946481, 1, 1, 1, 1, 1,
-0.9578008, -1.503444, -1.761437, 1, 1, 1, 1, 1,
-0.9571656, -0.4915605, -1.164654, 1, 1, 1, 1, 1,
-0.9536744, 1.613672, -0.9753764, 1, 1, 1, 1, 1,
-0.9521787, 1.078183, -2.050255, 1, 1, 1, 1, 1,
-0.9429436, -1.343472, -2.364431, 1, 1, 1, 1, 1,
-0.9291953, 1.443502, -0.4586929, 1, 1, 1, 1, 1,
-0.9242758, -1.332145, -1.523345, 1, 1, 1, 1, 1,
-0.922065, -0.4966164, -2.824336, 1, 1, 1, 1, 1,
-0.9203392, -0.2659287, -3.921841, 0, 0, 1, 1, 1,
-0.9195862, -0.4205331, -2.926962, 1, 0, 0, 1, 1,
-0.9181219, 0.1526961, -3.250623, 1, 0, 0, 1, 1,
-0.9168342, 0.2060104, -1.819196, 1, 0, 0, 1, 1,
-0.9121473, -0.06482686, -1.72695, 1, 0, 0, 1, 1,
-0.9101952, -0.7378789, -1.636161, 1, 0, 0, 1, 1,
-0.9048941, 0.3475562, -1.152805, 0, 0, 0, 1, 1,
-0.9029217, 0.0002323043, -4.263531, 0, 0, 0, 1, 1,
-0.8970118, -1.202363, -3.914676, 0, 0, 0, 1, 1,
-0.8952867, 0.9683755, -2.892544, 0, 0, 0, 1, 1,
-0.8939412, -0.3214701, -2.028041, 0, 0, 0, 1, 1,
-0.8933234, -1.664767, -0.6384833, 0, 0, 0, 1, 1,
-0.8906837, 0.4993654, 0.08340898, 0, 0, 0, 1, 1,
-0.8839727, 0.3940666, -2.048442, 1, 1, 1, 1, 1,
-0.8829291, 0.1988342, -1.069116, 1, 1, 1, 1, 1,
-0.8823943, -2.518693, -2.733094, 1, 1, 1, 1, 1,
-0.8804576, 0.5743696, -0.4440825, 1, 1, 1, 1, 1,
-0.878202, -0.004439194, -2.845412, 1, 1, 1, 1, 1,
-0.8780149, 1.114583, -0.9805662, 1, 1, 1, 1, 1,
-0.8759906, -0.2370384, 0.4386517, 1, 1, 1, 1, 1,
-0.8748516, 1.910287, 0.03493242, 1, 1, 1, 1, 1,
-0.8682519, -0.7955174, -1.979772, 1, 1, 1, 1, 1,
-0.8682021, -0.8378203, -1.644432, 1, 1, 1, 1, 1,
-0.8672296, 0.445594, -0.8320585, 1, 1, 1, 1, 1,
-0.8606595, 0.8629959, -1.621304, 1, 1, 1, 1, 1,
-0.8564177, 0.1589983, -1.447457, 1, 1, 1, 1, 1,
-0.855239, -0.6787965, -2.252776, 1, 1, 1, 1, 1,
-0.8506998, -0.821634, -3.766453, 1, 1, 1, 1, 1,
-0.8496312, 0.2596909, -0.2415979, 0, 0, 1, 1, 1,
-0.8495385, -1.190428, -3.121838, 1, 0, 0, 1, 1,
-0.8440856, -0.7205283, -1.980834, 1, 0, 0, 1, 1,
-0.8362606, 0.919896, -3.169038, 1, 0, 0, 1, 1,
-0.8305352, -0.7086158, 0.1077075, 1, 0, 0, 1, 1,
-0.830376, 0.4141497, -0.5121741, 1, 0, 0, 1, 1,
-0.8278414, -0.3553314, -0.9806581, 0, 0, 0, 1, 1,
-0.8215997, 1.853132, -0.7631715, 0, 0, 0, 1, 1,
-0.8197832, -1.53654, -2.44086, 0, 0, 0, 1, 1,
-0.8171061, 0.9492208, -2.088513, 0, 0, 0, 1, 1,
-0.8117241, 0.05124344, -2.478787, 0, 0, 0, 1, 1,
-0.8102664, 2.565616, -1.072933, 0, 0, 0, 1, 1,
-0.8079829, -0.5815669, -2.434755, 0, 0, 0, 1, 1,
-0.8050247, 0.8315859, 0.6379286, 1, 1, 1, 1, 1,
-0.7990152, 0.5638648, -0.2522023, 1, 1, 1, 1, 1,
-0.7979585, 1.715665, -0.009309936, 1, 1, 1, 1, 1,
-0.7959106, -0.06748514, -1.564527, 1, 1, 1, 1, 1,
-0.7949524, 1.44711, 0.0886303, 1, 1, 1, 1, 1,
-0.7905971, -0.2185709, 1.786004, 1, 1, 1, 1, 1,
-0.7873608, -0.1375, -1.0635, 1, 1, 1, 1, 1,
-0.7832671, 0.1793576, -0.5368212, 1, 1, 1, 1, 1,
-0.781823, 0.4001452, -0.1650819, 1, 1, 1, 1, 1,
-0.781352, -1.336871, -5.05422, 1, 1, 1, 1, 1,
-0.7796667, 0.01034236, -1.327017, 1, 1, 1, 1, 1,
-0.7789881, -1.569087, -2.032732, 1, 1, 1, 1, 1,
-0.7785537, -0.2758734, -2.251359, 1, 1, 1, 1, 1,
-0.7760859, 1.572525, -0.2579906, 1, 1, 1, 1, 1,
-0.773865, -2.02347, -2.284195, 1, 1, 1, 1, 1,
-0.7574202, 0.7565541, -0.07068662, 0, 0, 1, 1, 1,
-0.7456554, 0.5663009, -0.8937533, 1, 0, 0, 1, 1,
-0.7398435, -0.9110317, -3.371466, 1, 0, 0, 1, 1,
-0.7369232, 0.03920859, -1.18938, 1, 0, 0, 1, 1,
-0.736573, -1.856743, -1.173366, 1, 0, 0, 1, 1,
-0.7341958, -0.2404775, -2.15633, 1, 0, 0, 1, 1,
-0.728748, -0.533603, -3.133899, 0, 0, 0, 1, 1,
-0.7266332, -0.2809259, -0.2768766, 0, 0, 0, 1, 1,
-0.7257372, -0.2582906, -1.83817, 0, 0, 0, 1, 1,
-0.7231918, -1.657722, -1.139509, 0, 0, 0, 1, 1,
-0.7223799, -1.348154, -2.741719, 0, 0, 0, 1, 1,
-0.7196941, 0.6803271, -0.566305, 0, 0, 0, 1, 1,
-0.713038, 0.3592989, -1.080673, 0, 0, 0, 1, 1,
-0.7122012, -0.9427767, -0.7800126, 1, 1, 1, 1, 1,
-0.710425, -1.509259, -1.126483, 1, 1, 1, 1, 1,
-0.7078378, -0.8285499, -3.300699, 1, 1, 1, 1, 1,
-0.6869361, 0.9158081, 0.2714661, 1, 1, 1, 1, 1,
-0.6850277, 0.04990901, -1.143886, 1, 1, 1, 1, 1,
-0.6835186, 1.514686, -0.5752488, 1, 1, 1, 1, 1,
-0.6796677, -0.983472, -3.868201, 1, 1, 1, 1, 1,
-0.6768089, 1.092288, -1.697239, 1, 1, 1, 1, 1,
-0.6741636, 0.265582, -1.704903, 1, 1, 1, 1, 1,
-0.6738584, -1.468253, -2.521119, 1, 1, 1, 1, 1,
-0.6655987, 2.332694, -0.7604892, 1, 1, 1, 1, 1,
-0.662593, -1.305645, -2.212448, 1, 1, 1, 1, 1,
-0.6580556, 0.7164271, -1.623099, 1, 1, 1, 1, 1,
-0.6577659, 0.6728289, -0.2995121, 1, 1, 1, 1, 1,
-0.6559299, -1.043787, -2.801597, 1, 1, 1, 1, 1,
-0.6541278, -1.190829, -1.29527, 0, 0, 1, 1, 1,
-0.642101, 0.7269086, -0.7937241, 1, 0, 0, 1, 1,
-0.6382913, 0.663891, -0.7841756, 1, 0, 0, 1, 1,
-0.6344299, 0.4398685, -0.1241014, 1, 0, 0, 1, 1,
-0.6294224, 1.155432, -3.251457, 1, 0, 0, 1, 1,
-0.6249124, 0.06660222, -0.9166545, 1, 0, 0, 1, 1,
-0.6188399, 1.561296, 1.188015, 0, 0, 0, 1, 1,
-0.6158007, -0.7814122, -4.05249, 0, 0, 0, 1, 1,
-0.6157851, 0.5623829, -2.082078, 0, 0, 0, 1, 1,
-0.6131987, -0.3541518, -2.954365, 0, 0, 0, 1, 1,
-0.6130304, 1.142655, -0.04620285, 0, 0, 0, 1, 1,
-0.6089488, 0.6052514, -2.279688, 0, 0, 0, 1, 1,
-0.6032537, 0.6741654, -0.5756637, 0, 0, 0, 1, 1,
-0.5980653, -0.8362939, -1.113251, 1, 1, 1, 1, 1,
-0.5960311, -2.183531, -3.266478, 1, 1, 1, 1, 1,
-0.5955392, 0.4097365, 0.4696615, 1, 1, 1, 1, 1,
-0.5941871, 0.5772869, -0.1612157, 1, 1, 1, 1, 1,
-0.5922932, -1.282672, -3.126494, 1, 1, 1, 1, 1,
-0.5865353, 1.87522, 0.1977817, 1, 1, 1, 1, 1,
-0.5768063, -0.2568781, -1.295118, 1, 1, 1, 1, 1,
-0.5699512, 0.5608246, -1.214944, 1, 1, 1, 1, 1,
-0.5692093, -0.1835317, -3.316891, 1, 1, 1, 1, 1,
-0.5660363, -1.093031, -1.628075, 1, 1, 1, 1, 1,
-0.5648033, 1.413498, -0.6928955, 1, 1, 1, 1, 1,
-0.5633724, 1.306684, 0.5929294, 1, 1, 1, 1, 1,
-0.5587488, -0.7793196, -2.84073, 1, 1, 1, 1, 1,
-0.5463712, 0.005790194, -0.9315152, 1, 1, 1, 1, 1,
-0.5456602, 0.6051311, -0.5103349, 1, 1, 1, 1, 1,
-0.5441419, -1.007217, -0.5052639, 0, 0, 1, 1, 1,
-0.543546, 0.932637, -0.9363854, 1, 0, 0, 1, 1,
-0.5432443, -0.6234635, -2.474431, 1, 0, 0, 1, 1,
-0.5404194, 1.228717, -0.5550024, 1, 0, 0, 1, 1,
-0.5401732, -1.206894, -2.886734, 1, 0, 0, 1, 1,
-0.5400053, 0.2870698, -2.553469, 1, 0, 0, 1, 1,
-0.5352752, -0.8403791, -2.513949, 0, 0, 0, 1, 1,
-0.5342662, 1.050317, -0.5572483, 0, 0, 0, 1, 1,
-0.5307241, -0.2501623, -3.848049, 0, 0, 0, 1, 1,
-0.5242975, -0.3638608, -1.953047, 0, 0, 0, 1, 1,
-0.5241706, -2.425204, -2.166347, 0, 0, 0, 1, 1,
-0.519625, 0.3611576, -2.052212, 0, 0, 0, 1, 1,
-0.5181577, 0.7687047, -0.8354974, 0, 0, 0, 1, 1,
-0.5170242, 1.829198, 0.1710146, 1, 1, 1, 1, 1,
-0.5150661, 0.5979133, -0.2687708, 1, 1, 1, 1, 1,
-0.5147184, -0.1603432, -1.196913, 1, 1, 1, 1, 1,
-0.5143197, -1.82396, -2.061966, 1, 1, 1, 1, 1,
-0.5120242, -0.453304, -1.470374, 1, 1, 1, 1, 1,
-0.5063051, 0.6943111, -1.089209, 1, 1, 1, 1, 1,
-0.5049696, -0.2413358, -1.599665, 1, 1, 1, 1, 1,
-0.5044786, 0.2490232, -0.7162938, 1, 1, 1, 1, 1,
-0.5042367, 0.7241768, -1.000851, 1, 1, 1, 1, 1,
-0.4991475, 1.015813, 1.753471, 1, 1, 1, 1, 1,
-0.4980618, 0.354687, -0.7108227, 1, 1, 1, 1, 1,
-0.4967801, 1.024557, 0.2369296, 1, 1, 1, 1, 1,
-0.4892102, -1.699615, -3.527049, 1, 1, 1, 1, 1,
-0.4857764, 0.1238405, 0.7394392, 1, 1, 1, 1, 1,
-0.4847112, 0.9087567, -0.4635147, 1, 1, 1, 1, 1,
-0.4793047, -0.2858648, -2.846216, 0, 0, 1, 1, 1,
-0.4765263, 1.391043, -2.450217, 1, 0, 0, 1, 1,
-0.4747509, -0.4564802, -1.608207, 1, 0, 0, 1, 1,
-0.4725714, -0.4072728, -2.089866, 1, 0, 0, 1, 1,
-0.4705609, -0.1926349, -2.048441, 1, 0, 0, 1, 1,
-0.4656558, 0.6907709, 0.01985688, 1, 0, 0, 1, 1,
-0.4637147, 0.6295061, -0.271765, 0, 0, 0, 1, 1,
-0.4617454, -1.265449, -3.990706, 0, 0, 0, 1, 1,
-0.4604076, 0.02888547, -0.6767701, 0, 0, 0, 1, 1,
-0.4562076, -0.3762268, -2.910978, 0, 0, 0, 1, 1,
-0.448534, -0.1226149, -1.776938, 0, 0, 0, 1, 1,
-0.4459034, 1.088856, 0.16055, 0, 0, 0, 1, 1,
-0.445552, 0.07625447, -1.77781, 0, 0, 0, 1, 1,
-0.4422165, 0.3387584, -0.9506463, 1, 1, 1, 1, 1,
-0.4364606, 0.08490616, -1.063932, 1, 1, 1, 1, 1,
-0.4352203, -1.062095, -2.821498, 1, 1, 1, 1, 1,
-0.4350938, -0.5202929, -1.768187, 1, 1, 1, 1, 1,
-0.4310345, 2.215907, -1.120458, 1, 1, 1, 1, 1,
-0.4288574, -1.326227, -3.063305, 1, 1, 1, 1, 1,
-0.4280511, 1.012089, -0.02792054, 1, 1, 1, 1, 1,
-0.4271548, -0.9040703, -4.058577, 1, 1, 1, 1, 1,
-0.4249735, 0.5348312, -0.7594556, 1, 1, 1, 1, 1,
-0.4216858, -3.156471, -3.509747, 1, 1, 1, 1, 1,
-0.421208, -1.898088, -2.410861, 1, 1, 1, 1, 1,
-0.4168037, -0.7950703, -2.220882, 1, 1, 1, 1, 1,
-0.415546, -2.569, -3.270388, 1, 1, 1, 1, 1,
-0.4077607, 0.4917911, -2.417222, 1, 1, 1, 1, 1,
-0.4056007, 1.00606, -0.4541175, 1, 1, 1, 1, 1,
-0.4025257, 0.8069952, 0.6308514, 0, 0, 1, 1, 1,
-0.4015025, -1.285556, -3.491282, 1, 0, 0, 1, 1,
-0.3997146, 0.4448744, -1.375949, 1, 0, 0, 1, 1,
-0.3959899, -0.2713804, -2.545297, 1, 0, 0, 1, 1,
-0.3943003, -0.2988781, -2.009018, 1, 0, 0, 1, 1,
-0.3938776, -0.2233998, -0.8766878, 1, 0, 0, 1, 1,
-0.3925242, -3.006819, -5.0291, 0, 0, 0, 1, 1,
-0.3909871, -0.2994078, -1.901273, 0, 0, 0, 1, 1,
-0.3889755, 1.268864, -0.947206, 0, 0, 0, 1, 1,
-0.3815234, -2.090955, -0.4057668, 0, 0, 0, 1, 1,
-0.3814421, 0.5676349, -1.189253, 0, 0, 0, 1, 1,
-0.379624, -2.089239, -2.791985, 0, 0, 0, 1, 1,
-0.3792143, 0.4981402, -0.2131474, 0, 0, 0, 1, 1,
-0.3777655, -0.860873, -3.917764, 1, 1, 1, 1, 1,
-0.37721, 0.3261499, -1.3426, 1, 1, 1, 1, 1,
-0.3762208, 1.518962, 0.3488405, 1, 1, 1, 1, 1,
-0.3654016, -1.693291, -2.229232, 1, 1, 1, 1, 1,
-0.3636549, 0.03451584, -1.584486, 1, 1, 1, 1, 1,
-0.3595627, 0.9544955, 0.1019148, 1, 1, 1, 1, 1,
-0.3593434, -0.005860918, -0.3925492, 1, 1, 1, 1, 1,
-0.3588235, 0.1094584, -2.350562, 1, 1, 1, 1, 1,
-0.3568404, -0.2659806, -1.016909, 1, 1, 1, 1, 1,
-0.3535858, -1.05811, -2.391656, 1, 1, 1, 1, 1,
-0.3533491, 1.743338, -2.058772, 1, 1, 1, 1, 1,
-0.3528272, -0.8854458, -2.752385, 1, 1, 1, 1, 1,
-0.3509956, 0.2401026, 0.1135771, 1, 1, 1, 1, 1,
-0.3476943, 0.1115853, -0.7199301, 1, 1, 1, 1, 1,
-0.3429636, -0.3230901, -2.103037, 1, 1, 1, 1, 1,
-0.3369975, 2.258157, -0.7942682, 0, 0, 1, 1, 1,
-0.3320291, 0.7370212, -0.6190218, 1, 0, 0, 1, 1,
-0.3319057, -0.2495769, -3.960016, 1, 0, 0, 1, 1,
-0.3317631, 1.516635, 0.8806891, 1, 0, 0, 1, 1,
-0.331714, -0.9810303, -3.025045, 1, 0, 0, 1, 1,
-0.3269335, -0.4417752, -2.277748, 1, 0, 0, 1, 1,
-0.3185089, -1.658504, -4.709032, 0, 0, 0, 1, 1,
-0.3171475, 1.112169, 0.5882706, 0, 0, 0, 1, 1,
-0.3153054, 0.2337527, -2.665729, 0, 0, 0, 1, 1,
-0.3144066, -1.026185, -2.731902, 0, 0, 0, 1, 1,
-0.3069134, -2.052737, -1.028472, 0, 0, 0, 1, 1,
-0.2977155, 0.0613613, 0.01429069, 0, 0, 0, 1, 1,
-0.2974226, 0.7113022, 1.259136, 0, 0, 0, 1, 1,
-0.2926567, 0.1712005, 0.2010617, 1, 1, 1, 1, 1,
-0.29247, -0.8778233, -2.851664, 1, 1, 1, 1, 1,
-0.2918589, 0.09878199, -2.593964, 1, 1, 1, 1, 1,
-0.2912187, 0.6737186, 0.8747328, 1, 1, 1, 1, 1,
-0.2876787, 0.7329112, 0.01705467, 1, 1, 1, 1, 1,
-0.2828714, -0.7452608, -4.549417, 1, 1, 1, 1, 1,
-0.279852, 0.3944253, 0.2226024, 1, 1, 1, 1, 1,
-0.2798334, -0.9192063, -0.7056901, 1, 1, 1, 1, 1,
-0.2797656, 0.7846891, -1.081805, 1, 1, 1, 1, 1,
-0.2763143, -0.9589258, -3.859195, 1, 1, 1, 1, 1,
-0.2714618, -0.01830424, -2.510494, 1, 1, 1, 1, 1,
-0.2702222, -0.2333598, -0.1710399, 1, 1, 1, 1, 1,
-0.2689454, -0.6970251, -2.986984, 1, 1, 1, 1, 1,
-0.2652273, 0.7572262, -0.8409813, 1, 1, 1, 1, 1,
-0.2645681, -0.2175835, -2.126439, 1, 1, 1, 1, 1,
-0.2640575, 2.205605, -0.02903152, 0, 0, 1, 1, 1,
-0.263212, 0.05999776, -0.4408784, 1, 0, 0, 1, 1,
-0.2521686, -1.159395, -3.762901, 1, 0, 0, 1, 1,
-0.2501584, -0.458988, -3.713727, 1, 0, 0, 1, 1,
-0.2498587, 0.2283642, 1.787775, 1, 0, 0, 1, 1,
-0.247417, -0.2928279, -0.6623268, 1, 0, 0, 1, 1,
-0.2419805, -1.050124, -1.262641, 0, 0, 0, 1, 1,
-0.2366122, 0.3276557, -0.785302, 0, 0, 0, 1, 1,
-0.2365606, -1.298693, -3.327174, 0, 0, 0, 1, 1,
-0.2349285, 0.08737356, -2.813057, 0, 0, 0, 1, 1,
-0.2325979, -0.597463, -1.988892, 0, 0, 0, 1, 1,
-0.2299296, 1.199992, 0.5266131, 0, 0, 0, 1, 1,
-0.2292954, -0.150363, -0.7748896, 0, 0, 0, 1, 1,
-0.2282818, 1.669711, -0.6227499, 1, 1, 1, 1, 1,
-0.227154, -1.644316, -4.133946, 1, 1, 1, 1, 1,
-0.2270898, 0.4311585, 0.4304251, 1, 1, 1, 1, 1,
-0.2238755, -0.8630132, -2.546304, 1, 1, 1, 1, 1,
-0.2237577, -0.5634584, -3.310404, 1, 1, 1, 1, 1,
-0.2236541, -0.9062356, -2.519504, 1, 1, 1, 1, 1,
-0.2220608, -0.01863268, -0.6063687, 1, 1, 1, 1, 1,
-0.2216112, -1.569568, -0.4806668, 1, 1, 1, 1, 1,
-0.2211205, -0.3189464, -4.156342, 1, 1, 1, 1, 1,
-0.2130129, 0.6839226, 1.667746, 1, 1, 1, 1, 1,
-0.211398, 0.6437686, 1.367155, 1, 1, 1, 1, 1,
-0.2108835, 0.4288664, 0.05344205, 1, 1, 1, 1, 1,
-0.2086721, 0.1152798, -0.3636501, 1, 1, 1, 1, 1,
-0.2073365, -0.9336641, -1.922232, 1, 1, 1, 1, 1,
-0.2038618, -0.2190384, -2.27742, 1, 1, 1, 1, 1,
-0.2021754, -1.12502, -3.243042, 0, 0, 1, 1, 1,
-0.2007057, 0.2400392, -2.267035, 1, 0, 0, 1, 1,
-0.200347, 0.5349869, -1.795436, 1, 0, 0, 1, 1,
-0.1984417, 0.6882877, -0.08246653, 1, 0, 0, 1, 1,
-0.1976862, -1.400626, -3.604721, 1, 0, 0, 1, 1,
-0.197378, 0.4072411, 0.1048424, 1, 0, 0, 1, 1,
-0.1951634, -0.475998, -1.413995, 0, 0, 0, 1, 1,
-0.1923283, -1.229646, -2.309452, 0, 0, 0, 1, 1,
-0.189783, 0.4184877, -1.093879, 0, 0, 0, 1, 1,
-0.1897269, 0.08639526, -2.746118, 0, 0, 0, 1, 1,
-0.1880595, -0.678746, -1.274471, 0, 0, 0, 1, 1,
-0.1873832, -2.45874, -4.402101, 0, 0, 0, 1, 1,
-0.1857418, -1.742692, -3.601592, 0, 0, 0, 1, 1,
-0.1843341, 1.199831, -0.4185896, 1, 1, 1, 1, 1,
-0.1839236, 0.4506996, 0.1173266, 1, 1, 1, 1, 1,
-0.1834273, -0.3479482, -2.59012, 1, 1, 1, 1, 1,
-0.1817956, -0.6101973, -3.654807, 1, 1, 1, 1, 1,
-0.1786682, -0.8082978, -2.269971, 1, 1, 1, 1, 1,
-0.173843, -1.2576, -2.482978, 1, 1, 1, 1, 1,
-0.1696368, 3.214896, -2.031089, 1, 1, 1, 1, 1,
-0.1591515, 1.267857, -1.637017, 1, 1, 1, 1, 1,
-0.1583112, -0.02255081, -1.46137, 1, 1, 1, 1, 1,
-0.1537534, 1.274143, -0.7544371, 1, 1, 1, 1, 1,
-0.1526531, 1.51154, 0.1137931, 1, 1, 1, 1, 1,
-0.1517934, -0.5823721, -2.663809, 1, 1, 1, 1, 1,
-0.1491989, -1.322052, -4.001227, 1, 1, 1, 1, 1,
-0.149158, -0.6364378, -2.074137, 1, 1, 1, 1, 1,
-0.1491354, -2.239172, -3.421153, 1, 1, 1, 1, 1,
-0.1485523, -0.8335724, -2.691344, 0, 0, 1, 1, 1,
-0.1481596, 0.3623559, -1.740474, 1, 0, 0, 1, 1,
-0.1475851, 0.3992356, -0.3805229, 1, 0, 0, 1, 1,
-0.1472284, 0.3129191, -2.286705, 1, 0, 0, 1, 1,
-0.1469404, 0.8017839, -1.483327, 1, 0, 0, 1, 1,
-0.1464289, 0.3606338, 1.880761, 1, 0, 0, 1, 1,
-0.1392377, 1.035895, -0.2632045, 0, 0, 0, 1, 1,
-0.1347646, -0.8440143, -3.729589, 0, 0, 0, 1, 1,
-0.1342441, -1.984478, -3.78994, 0, 0, 0, 1, 1,
-0.1327496, 1.276077, -0.4353041, 0, 0, 0, 1, 1,
-0.1322701, 0.0675146, -2.672868, 0, 0, 0, 1, 1,
-0.1234175, -0.5575832, -2.208175, 0, 0, 0, 1, 1,
-0.1217829, -0.01870013, -1.74369, 0, 0, 0, 1, 1,
-0.1209329, -1.530428, -4.584879, 1, 1, 1, 1, 1,
-0.1191708, 0.01539814, -0.4447504, 1, 1, 1, 1, 1,
-0.1190117, 1.794444, -0.6116039, 1, 1, 1, 1, 1,
-0.1142086, -1.50468, -2.103329, 1, 1, 1, 1, 1,
-0.1093945, 0.785623, -0.3644219, 1, 1, 1, 1, 1,
-0.1041136, -0.4970582, -1.816592, 1, 1, 1, 1, 1,
-0.09997848, -0.6595142, -2.714866, 1, 1, 1, 1, 1,
-0.09688794, 1.416579, 1.157322, 1, 1, 1, 1, 1,
-0.09684495, 0.7498009, -1.050812, 1, 1, 1, 1, 1,
-0.09668249, -0.7659118, -4.127697, 1, 1, 1, 1, 1,
-0.09635834, -1.474014, -3.896314, 1, 1, 1, 1, 1,
-0.09632, -0.471047, -3.320193, 1, 1, 1, 1, 1,
-0.09222943, 1.813486, -1.422789, 1, 1, 1, 1, 1,
-0.09202143, -1.463848, -4.417816, 1, 1, 1, 1, 1,
-0.08772299, -0.7339631, -2.777148, 1, 1, 1, 1, 1,
-0.08540393, 0.6336293, -0.05113088, 0, 0, 1, 1, 1,
-0.08522945, -0.4407625, -2.400213, 1, 0, 0, 1, 1,
-0.08495991, -0.8848958, -3.265663, 1, 0, 0, 1, 1,
-0.0844276, -0.7281553, -2.50855, 1, 0, 0, 1, 1,
-0.07631528, -0.01891045, -0.314181, 1, 0, 0, 1, 1,
-0.07593846, 1.248819, 0.3417212, 1, 0, 0, 1, 1,
-0.07462826, -2.022577, -1.961547, 0, 0, 0, 1, 1,
-0.0744233, 1.181691, -1.307446, 0, 0, 0, 1, 1,
-0.07240214, -0.5164669, -3.214294, 0, 0, 0, 1, 1,
-0.07009125, -0.5250246, -3.230393, 0, 0, 0, 1, 1,
-0.06954001, -0.4665164, -3.392974, 0, 0, 0, 1, 1,
-0.06947649, -0.1297558, -0.8449265, 0, 0, 0, 1, 1,
-0.06895073, -0.06971987, -0.37892, 0, 0, 0, 1, 1,
-0.06468955, -0.7620681, -4.007734, 1, 1, 1, 1, 1,
-0.06046142, -0.2034221, -2.904209, 1, 1, 1, 1, 1,
-0.05941235, -2.527514, -2.519865, 1, 1, 1, 1, 1,
-0.05817392, 0.4731273, 0.8189224, 1, 1, 1, 1, 1,
-0.0579966, 1.074381, 0.766699, 1, 1, 1, 1, 1,
-0.05796055, 0.3110274, 0.8994032, 1, 1, 1, 1, 1,
-0.05415976, -0.5960593, -2.626735, 1, 1, 1, 1, 1,
-0.05190244, -0.2771453, -3.164956, 1, 1, 1, 1, 1,
-0.04742663, -0.07953276, -1.627105, 1, 1, 1, 1, 1,
-0.04479906, -0.1337025, -2.617072, 1, 1, 1, 1, 1,
-0.04443934, -1.586545, -3.75197, 1, 1, 1, 1, 1,
-0.04385355, 0.3863271, -1.527026, 1, 1, 1, 1, 1,
-0.04050224, -0.685262, -2.041162, 1, 1, 1, 1, 1,
-0.0403881, -0.03052622, -2.36605, 1, 1, 1, 1, 1,
-0.03291276, -0.7057123, -2.280725, 1, 1, 1, 1, 1,
-0.03066581, -0.6581395, -3.19187, 0, 0, 1, 1, 1,
-0.02944044, 0.7124102, -0.2838251, 1, 0, 0, 1, 1,
-0.02376663, 0.7244893, -0.7231577, 1, 0, 0, 1, 1,
-0.02091852, 1.166098, -0.1908295, 1, 0, 0, 1, 1,
-0.02040459, 0.7516008, 0.504553, 1, 0, 0, 1, 1,
-0.01637076, -1.479345, -3.357336, 1, 0, 0, 1, 1,
-0.01632472, -0.08963099, -2.918619, 0, 0, 0, 1, 1,
-0.01542205, 1.063025, -1.490154, 0, 0, 0, 1, 1,
-0.01083845, -0.4691764, -1.591844, 0, 0, 0, 1, 1,
-0.008271633, 0.9525694, -0.6735858, 0, 0, 0, 1, 1,
-0.006189591, 0.05679272, 0.134637, 0, 0, 0, 1, 1,
-0.004094339, -0.8989093, -2.279696, 0, 0, 0, 1, 1,
-0.003490281, 0.3628312, -0.6724958, 0, 0, 0, 1, 1,
-0.002916482, -0.006899659, -4.232122, 1, 1, 1, 1, 1,
-0.002532662, 1.24571, -0.34691, 1, 1, 1, 1, 1,
0.003826101, -1.138074, 4.120156, 1, 1, 1, 1, 1,
0.008556789, -0.6406631, 4.848296, 1, 1, 1, 1, 1,
0.01229853, 0.2564833, 0.7892175, 1, 1, 1, 1, 1,
0.01589807, 1.076016, -0.4574851, 1, 1, 1, 1, 1,
0.01723114, -0.4420978, 5.16227, 1, 1, 1, 1, 1,
0.02269489, 0.2851221, -0.7741972, 1, 1, 1, 1, 1,
0.02410106, -1.307119, 2.49087, 1, 1, 1, 1, 1,
0.02808964, -1.13553, 3.272606, 1, 1, 1, 1, 1,
0.03311824, -0.7275274, 3.630607, 1, 1, 1, 1, 1,
0.03651254, -0.3193207, 3.070638, 1, 1, 1, 1, 1,
0.04029459, -0.1700058, 3.931132, 1, 1, 1, 1, 1,
0.04256367, 0.7835656, 0.4998081, 1, 1, 1, 1, 1,
0.04337417, -0.8646327, 4.099441, 1, 1, 1, 1, 1,
0.04343449, 0.8280379, -2.739097, 0, 0, 1, 1, 1,
0.04473294, -0.1225627, 3.398543, 1, 0, 0, 1, 1,
0.04543738, 0.6937571, -0.340791, 1, 0, 0, 1, 1,
0.04688266, -1.517702, 1.959401, 1, 0, 0, 1, 1,
0.04877383, 0.2767407, -0.6646624, 1, 0, 0, 1, 1,
0.05465854, 0.4441222, 0.5396714, 1, 0, 0, 1, 1,
0.05553892, -1.128065, 3.100979, 0, 0, 0, 1, 1,
0.05702794, -0.8105465, 1.337094, 0, 0, 0, 1, 1,
0.05930486, -1.024956, 5.304421, 0, 0, 0, 1, 1,
0.06080599, -0.1698655, 3.121983, 0, 0, 0, 1, 1,
0.06149982, 1.775053, 0.437724, 0, 0, 0, 1, 1,
0.06295645, -0.2704395, 3.218326, 0, 0, 0, 1, 1,
0.06507259, 0.4050645, 2.515643, 0, 0, 0, 1, 1,
0.06554157, 2.016164, -1.531983, 1, 1, 1, 1, 1,
0.06723165, 1.103558, 2.37049, 1, 1, 1, 1, 1,
0.06875763, -0.7986087, 2.601267, 1, 1, 1, 1, 1,
0.06951367, -0.9898987, 3.720747, 1, 1, 1, 1, 1,
0.07281435, -0.7662583, 4.651286, 1, 1, 1, 1, 1,
0.07376656, -0.1820063, 2.739446, 1, 1, 1, 1, 1,
0.07601593, 0.5105654, 0.08076712, 1, 1, 1, 1, 1,
0.07615359, -1.913645, 4.420253, 1, 1, 1, 1, 1,
0.07945611, 0.993412, 1.303595, 1, 1, 1, 1, 1,
0.08047271, 0.9082257, -1.248978, 1, 1, 1, 1, 1,
0.08335572, -0.7820244, 3.214994, 1, 1, 1, 1, 1,
0.08733536, -0.6384142, 2.766312, 1, 1, 1, 1, 1,
0.08830123, 0.6435188, -0.2027829, 1, 1, 1, 1, 1,
0.08939049, 0.1798398, -0.2149152, 1, 1, 1, 1, 1,
0.08974555, 0.0990366, 1.74618, 1, 1, 1, 1, 1,
0.09186764, -0.16241, 3.255237, 0, 0, 1, 1, 1,
0.09344035, 1.27755, 1.267358, 1, 0, 0, 1, 1,
0.09561648, -1.062393, 1.988486, 1, 0, 0, 1, 1,
0.09673314, 2.352212, -0.2906824, 1, 0, 0, 1, 1,
0.0982571, -0.6545525, 3.038878, 1, 0, 0, 1, 1,
0.1025142, -0.4863973, 3.965962, 1, 0, 0, 1, 1,
0.1052605, 0.08893313, 0.4434082, 0, 0, 0, 1, 1,
0.1059621, -1.442585, 2.601914, 0, 0, 0, 1, 1,
0.1100883, -0.2667741, 4.438473, 0, 0, 0, 1, 1,
0.1175704, 1.752235, -1.533627, 0, 0, 0, 1, 1,
0.1205016, -0.1720005, 2.150326, 0, 0, 0, 1, 1,
0.1231456, 0.5833727, 0.8495554, 0, 0, 0, 1, 1,
0.1238893, -0.7256346, 2.119655, 0, 0, 0, 1, 1,
0.1253638, 0.6563588, 1.901116, 1, 1, 1, 1, 1,
0.1256871, -0.3909017, 2.901896, 1, 1, 1, 1, 1,
0.1264295, -0.1735505, 3.547353, 1, 1, 1, 1, 1,
0.1271687, 0.9034057, -0.3337962, 1, 1, 1, 1, 1,
0.1283757, 0.2821516, 1.741787, 1, 1, 1, 1, 1,
0.1314649, -1.536677, 2.874763, 1, 1, 1, 1, 1,
0.1360521, -1.314, 2.174457, 1, 1, 1, 1, 1,
0.1405387, 0.4282046, 0.843089, 1, 1, 1, 1, 1,
0.1440936, -0.1506794, 1.786445, 1, 1, 1, 1, 1,
0.1493053, -0.6379167, 2.784594, 1, 1, 1, 1, 1,
0.155672, -0.6174547, 2.882835, 1, 1, 1, 1, 1,
0.1620045, -0.6298538, 4.740196, 1, 1, 1, 1, 1,
0.1721605, -1.236884, 1.977524, 1, 1, 1, 1, 1,
0.1740628, 1.500797, -0.4551157, 1, 1, 1, 1, 1,
0.1746625, -0.3411179, 3.75803, 1, 1, 1, 1, 1,
0.1784739, 0.5707776, 0.4266109, 0, 0, 1, 1, 1,
0.1847313, 0.278226, -0.1853679, 1, 0, 0, 1, 1,
0.1849684, 0.5915735, -0.09297899, 1, 0, 0, 1, 1,
0.185398, -0.2306412, 1.860158, 1, 0, 0, 1, 1,
0.1888423, -0.1279057, 3.137101, 1, 0, 0, 1, 1,
0.1931443, 0.6956851, -0.6494048, 1, 0, 0, 1, 1,
0.1935286, 2.011529, -0.09697367, 0, 0, 0, 1, 1,
0.200876, -1.035472, 0.9272729, 0, 0, 0, 1, 1,
0.2104504, -1.033576, 2.8952, 0, 0, 0, 1, 1,
0.2131165, 0.6008779, 0.1618674, 0, 0, 0, 1, 1,
0.2148421, -0.4612978, 3.554675, 0, 0, 0, 1, 1,
0.2262693, 1.043055, 1.748834, 0, 0, 0, 1, 1,
0.2354245, 1.298654, 0.974255, 0, 0, 0, 1, 1,
0.2359271, -0.316837, 1.774407, 1, 1, 1, 1, 1,
0.2364785, 0.0763833, 1.931386, 1, 1, 1, 1, 1,
0.2371885, 0.4284161, 2.221698, 1, 1, 1, 1, 1,
0.243351, 0.2562522, -0.07366981, 1, 1, 1, 1, 1,
0.2448524, 0.2261723, 0.1280541, 1, 1, 1, 1, 1,
0.2456073, -1.132351, 2.909112, 1, 1, 1, 1, 1,
0.2518322, -1.725601, 3.314537, 1, 1, 1, 1, 1,
0.257934, 0.5813135, -0.4145347, 1, 1, 1, 1, 1,
0.2623031, -0.2902119, 3.611941, 1, 1, 1, 1, 1,
0.2642791, -0.4705093, 2.923517, 1, 1, 1, 1, 1,
0.2685569, 0.414118, -0.9074959, 1, 1, 1, 1, 1,
0.2694968, -0.2951589, 3.992394, 1, 1, 1, 1, 1,
0.2714771, -0.5465273, 3.014522, 1, 1, 1, 1, 1,
0.2722759, -1.031595, 3.240321, 1, 1, 1, 1, 1,
0.2743978, 0.5309685, 0.1598784, 1, 1, 1, 1, 1,
0.2748149, 2.298254, -1.502936, 0, 0, 1, 1, 1,
0.2763904, -0.3553743, 2.373327, 1, 0, 0, 1, 1,
0.2770468, 1.845554, 0.1948212, 1, 0, 0, 1, 1,
0.2823841, 0.1830313, 0.2735434, 1, 0, 0, 1, 1,
0.2844915, -0.1356169, 1.125361, 1, 0, 0, 1, 1,
0.2849911, 0.9276437, 2.165816, 1, 0, 0, 1, 1,
0.286751, -1.224881, 4.530815, 0, 0, 0, 1, 1,
0.291198, -0.1158299, 1.021006, 0, 0, 0, 1, 1,
0.2919707, -1.311579, 2.463897, 0, 0, 0, 1, 1,
0.2968413, -1.419361, 1.169391, 0, 0, 0, 1, 1,
0.3025491, -0.4201472, 3.573695, 0, 0, 0, 1, 1,
0.3041479, -0.2888561, 3.414607, 0, 0, 0, 1, 1,
0.308004, 0.1625754, 2.731263, 0, 0, 0, 1, 1,
0.3086988, -1.267433, 2.712445, 1, 1, 1, 1, 1,
0.309517, -0.4742115, 2.83624, 1, 1, 1, 1, 1,
0.3104886, 0.3163038, 0.5258517, 1, 1, 1, 1, 1,
0.3184978, 0.5525278, 0.1192748, 1, 1, 1, 1, 1,
0.3191568, -0.6238542, 3.939228, 1, 1, 1, 1, 1,
0.320513, -1.066559, 3.139725, 1, 1, 1, 1, 1,
0.3226452, 1.337508, -0.1648898, 1, 1, 1, 1, 1,
0.323402, -0.5234929, 1.66907, 1, 1, 1, 1, 1,
0.3249434, -0.6546122, 2.471153, 1, 1, 1, 1, 1,
0.326517, -0.2755196, 3.191181, 1, 1, 1, 1, 1,
0.3274571, 1.630404, 1.913975, 1, 1, 1, 1, 1,
0.33049, 0.05840178, 2.065692, 1, 1, 1, 1, 1,
0.332036, -0.6688828, 2.443679, 1, 1, 1, 1, 1,
0.3343925, 0.07032245, 1.303717, 1, 1, 1, 1, 1,
0.3392201, 0.9187766, 0.4315001, 1, 1, 1, 1, 1,
0.3404846, -0.3549385, 3.22857, 0, 0, 1, 1, 1,
0.3440318, -0.9444012, 1.057225, 1, 0, 0, 1, 1,
0.3447363, -0.3265662, 1.006212, 1, 0, 0, 1, 1,
0.3464283, 0.4081078, -0.4623089, 1, 0, 0, 1, 1,
0.353701, 0.3945497, 2.224756, 1, 0, 0, 1, 1,
0.3539875, 0.1027749, 1.09612, 1, 0, 0, 1, 1,
0.3612666, -0.9838323, 1.359326, 0, 0, 0, 1, 1,
0.3622199, 0.8188919, 1.480527, 0, 0, 0, 1, 1,
0.362541, 0.4384468, 2.276679, 0, 0, 0, 1, 1,
0.3669459, 0.3617604, 0.4241552, 0, 0, 0, 1, 1,
0.3670564, 0.5274335, 0.3781655, 0, 0, 0, 1, 1,
0.3679892, -0.5173112, 0.6019703, 0, 0, 0, 1, 1,
0.3720168, -1.155204, 2.676269, 0, 0, 0, 1, 1,
0.372534, -0.6387452, 2.204927, 1, 1, 1, 1, 1,
0.373782, -2.017226, 2.890072, 1, 1, 1, 1, 1,
0.3740477, 1.092414, 0.4698629, 1, 1, 1, 1, 1,
0.3792762, -0.1327291, 0.7768191, 1, 1, 1, 1, 1,
0.3803824, 0.4224496, 0.5500631, 1, 1, 1, 1, 1,
0.3815214, 0.07281297, -0.348205, 1, 1, 1, 1, 1,
0.382285, -1.492073, 2.088446, 1, 1, 1, 1, 1,
0.3824625, 1.249511, 0.4763653, 1, 1, 1, 1, 1,
0.3865179, 0.8832165, 1.403611, 1, 1, 1, 1, 1,
0.3871964, 0.3658466, 2.112159, 1, 1, 1, 1, 1,
0.3888824, -1.351696, 3.223767, 1, 1, 1, 1, 1,
0.391346, -1.145212, 1.917387, 1, 1, 1, 1, 1,
0.3924715, -0.290455, 0.6986222, 1, 1, 1, 1, 1,
0.3951942, 0.2792962, 1.026096, 1, 1, 1, 1, 1,
0.3974147, 1.318651, 0.8311999, 1, 1, 1, 1, 1,
0.4002876, 1.116589, 0.2772715, 0, 0, 1, 1, 1,
0.4005812, -0.6325601, 1.386892, 1, 0, 0, 1, 1,
0.4041968, -1.239361, 3.17063, 1, 0, 0, 1, 1,
0.4091898, -0.1495737, 4.13052, 1, 0, 0, 1, 1,
0.4097333, -0.03745147, 2.042547, 1, 0, 0, 1, 1,
0.4107136, 0.2591207, 0.8329466, 1, 0, 0, 1, 1,
0.4135451, 0.1376253, 0.3102147, 0, 0, 0, 1, 1,
0.416443, -0.07812844, 1.529415, 0, 0, 0, 1, 1,
0.4173458, 1.277873, 0.0694288, 0, 0, 0, 1, 1,
0.4200801, -0.1784779, 3.155398, 0, 0, 0, 1, 1,
0.4313965, -1.001202, 3.023872, 0, 0, 0, 1, 1,
0.4323721, -0.5629526, 0.1833712, 0, 0, 0, 1, 1,
0.4390539, -0.2654397, 2.531651, 0, 0, 0, 1, 1,
0.4498496, 1.35828, 1.604681, 1, 1, 1, 1, 1,
0.4572933, -0.4578677, 2.887121, 1, 1, 1, 1, 1,
0.4648542, -0.2573886, 1.059949, 1, 1, 1, 1, 1,
0.4655135, 1.366078, -0.514779, 1, 1, 1, 1, 1,
0.472559, -0.197249, 4.368622, 1, 1, 1, 1, 1,
0.4730215, 1.444337, 1.281801, 1, 1, 1, 1, 1,
0.4740948, -0.4613954, 3.091543, 1, 1, 1, 1, 1,
0.4779679, 1.591271, 0.04586579, 1, 1, 1, 1, 1,
0.4810602, 0.7173955, -0.8150567, 1, 1, 1, 1, 1,
0.4860887, -0.4493569, 2.966485, 1, 1, 1, 1, 1,
0.4876658, -0.3839649, 2.450145, 1, 1, 1, 1, 1,
0.4915178, 0.3039297, -0.3582418, 1, 1, 1, 1, 1,
0.4973906, 0.0808591, 0.05869231, 1, 1, 1, 1, 1,
0.4988662, 0.3788492, 2.587836, 1, 1, 1, 1, 1,
0.4989187, 2.024197, 1.13552, 1, 1, 1, 1, 1,
0.4992343, 1.278248, 1.090483, 0, 0, 1, 1, 1,
0.5027099, -0.4806212, 0.7674863, 1, 0, 0, 1, 1,
0.5057233, -0.7641326, 2.349166, 1, 0, 0, 1, 1,
0.5091954, -0.995841, 2.730877, 1, 0, 0, 1, 1,
0.5101241, 0.6426343, -0.4169415, 1, 0, 0, 1, 1,
0.5131805, -1.287665, 4.326908, 1, 0, 0, 1, 1,
0.5132393, -0.9351617, 3.805394, 0, 0, 0, 1, 1,
0.5146513, 0.6982725, 0.3823246, 0, 0, 0, 1, 1,
0.5154758, 0.9402699, -0.4598559, 0, 0, 0, 1, 1,
0.5242726, 0.687485, 1.89131, 0, 0, 0, 1, 1,
0.5248585, 0.7173327, 1.615504, 0, 0, 0, 1, 1,
0.5322687, 0.3013223, 2.202659, 0, 0, 0, 1, 1,
0.5362868, -0.1429605, 3.367419, 0, 0, 0, 1, 1,
0.5372831, -0.002958341, 1.109114, 1, 1, 1, 1, 1,
0.5390286, -1.196762, 3.450338, 1, 1, 1, 1, 1,
0.5390598, -0.4538458, 2.204842, 1, 1, 1, 1, 1,
0.5394944, -1.649518, 4.42686, 1, 1, 1, 1, 1,
0.5396582, -0.0004024749, 2.397127, 1, 1, 1, 1, 1,
0.5411453, 0.1130687, 0.6316402, 1, 1, 1, 1, 1,
0.5427654, -0.6263789, 1.01956, 1, 1, 1, 1, 1,
0.5499353, -0.6243176, 1.244183, 1, 1, 1, 1, 1,
0.5511549, -2.159645, 3.943419, 1, 1, 1, 1, 1,
0.5512498, 0.952554, 0.1925451, 1, 1, 1, 1, 1,
0.5524219, -0.7256975, 2.066926, 1, 1, 1, 1, 1,
0.5531394, -1.231417, 2.836064, 1, 1, 1, 1, 1,
0.5557747, 0.2943312, 2.404308, 1, 1, 1, 1, 1,
0.557094, -0.7818962, 2.261644, 1, 1, 1, 1, 1,
0.5622893, 0.9743924, 0.03106056, 1, 1, 1, 1, 1,
0.5679614, -0.7302033, 1.632035, 0, 0, 1, 1, 1,
0.57529, -0.795123, 4.763574, 1, 0, 0, 1, 1,
0.5794275, -0.5942703, 1.029592, 1, 0, 0, 1, 1,
0.5798369, 0.1771949, 1.059329, 1, 0, 0, 1, 1,
0.5809145, 1.489189, 0.1269339, 1, 0, 0, 1, 1,
0.5846751, -1.630588, 2.915092, 1, 0, 0, 1, 1,
0.5851707, 0.5749651, 0.9098395, 0, 0, 0, 1, 1,
0.5966655, 0.4234973, -0.7080202, 0, 0, 0, 1, 1,
0.5995961, 0.3656914, 1.292518, 0, 0, 0, 1, 1,
0.603922, -0.3011533, 1.590922, 0, 0, 0, 1, 1,
0.6116786, -0.4021708, 3.237331, 0, 0, 0, 1, 1,
0.6125559, 1.851821, -2.415336, 0, 0, 0, 1, 1,
0.615602, 1.378039, 0.3923733, 0, 0, 0, 1, 1,
0.6192335, 0.8432158, -0.6851762, 1, 1, 1, 1, 1,
0.6249033, 0.986603, 0.4511325, 1, 1, 1, 1, 1,
0.6252974, -0.1939929, 3.481596, 1, 1, 1, 1, 1,
0.6286969, -0.8228644, 4.310751, 1, 1, 1, 1, 1,
0.6293092, 0.6629255, 0.2053143, 1, 1, 1, 1, 1,
0.6293635, -1.321114, 3.863209, 1, 1, 1, 1, 1,
0.6328023, -0.8116647, 2.804548, 1, 1, 1, 1, 1,
0.6340701, 0.7746628, 1.501334, 1, 1, 1, 1, 1,
0.6359991, 1.808553, 1.219275, 1, 1, 1, 1, 1,
0.6427215, 1.584374, 1.440611, 1, 1, 1, 1, 1,
0.642978, 0.05941746, 0.594983, 1, 1, 1, 1, 1,
0.6458188, -0.1316563, 2.306779, 1, 1, 1, 1, 1,
0.651202, -0.3163042, 3.971292, 1, 1, 1, 1, 1,
0.658287, 1.029554, 0.5410329, 1, 1, 1, 1, 1,
0.6610405, -0.1028172, 2.982219, 1, 1, 1, 1, 1,
0.6722586, 0.5499262, -0.8332013, 0, 0, 1, 1, 1,
0.6751652, 0.5982005, -0.2003661, 1, 0, 0, 1, 1,
0.6780162, 1.015066, 0.845075, 1, 0, 0, 1, 1,
0.6826184, -0.6195621, 2.161922, 1, 0, 0, 1, 1,
0.6847727, -0.2444984, 1.439359, 1, 0, 0, 1, 1,
0.6868865, 0.007768467, 3.414143, 1, 0, 0, 1, 1,
0.6880063, 0.193634, 0.4101518, 0, 0, 0, 1, 1,
0.6890889, -0.6943161, 1.363837, 0, 0, 0, 1, 1,
0.6919404, 0.9444523, 0.9888226, 0, 0, 0, 1, 1,
0.6933801, -1.663306, 3.084595, 0, 0, 0, 1, 1,
0.6941063, 0.4915103, -0.1556796, 0, 0, 0, 1, 1,
0.7035502, 1.863484, -0.0650985, 0, 0, 0, 1, 1,
0.7038338, -0.07197244, 3.761869, 0, 0, 0, 1, 1,
0.7058436, 0.321436, 0.9752011, 1, 1, 1, 1, 1,
0.7091461, -0.5941825, 1.787164, 1, 1, 1, 1, 1,
0.7176561, 2.177284, 0.5944125, 1, 1, 1, 1, 1,
0.7209437, -0.3042573, 2.304956, 1, 1, 1, 1, 1,
0.7221501, 1.187645, 0.3619027, 1, 1, 1, 1, 1,
0.730505, -0.301634, 1.272101, 1, 1, 1, 1, 1,
0.7306322, -0.5124406, 2.692462, 1, 1, 1, 1, 1,
0.7336217, 1.117701, 0.5656581, 1, 1, 1, 1, 1,
0.7375379, -0.9144176, 1.352676, 1, 1, 1, 1, 1,
0.738197, -1.115549, 1.251252, 1, 1, 1, 1, 1,
0.7444539, -0.06417837, 1.111188, 1, 1, 1, 1, 1,
0.7448823, -0.9523034, 1.455597, 1, 1, 1, 1, 1,
0.7449433, 0.09844193, 1.891129, 1, 1, 1, 1, 1,
0.7475746, -0.2891896, 2.371411, 1, 1, 1, 1, 1,
0.749732, 1.441624, -0.9819579, 1, 1, 1, 1, 1,
0.7507711, -0.5144042, 2.467576, 0, 0, 1, 1, 1,
0.7515503, -0.721252, 2.119281, 1, 0, 0, 1, 1,
0.755852, -0.3984538, 3.298614, 1, 0, 0, 1, 1,
0.75836, 0.3171985, 1.333254, 1, 0, 0, 1, 1,
0.7598369, 0.2952244, 1.176479, 1, 0, 0, 1, 1,
0.761228, -1.675278, 2.208325, 1, 0, 0, 1, 1,
0.7725487, -1.89807, 3.393748, 0, 0, 0, 1, 1,
0.7733921, 0.4770545, 0.4180357, 0, 0, 0, 1, 1,
0.7771022, 1.10465, 1.592271, 0, 0, 0, 1, 1,
0.7779581, 0.0483523, 3.118992, 0, 0, 0, 1, 1,
0.7783176, -0.9752491, 1.931197, 0, 0, 0, 1, 1,
0.7790701, 0.4666834, 0.6307211, 0, 0, 0, 1, 1,
0.7833254, 1.285822, 1.390739, 0, 0, 0, 1, 1,
0.7843315, -0.9741999, 2.942525, 1, 1, 1, 1, 1,
0.7886089, 0.5367055, 2.699289, 1, 1, 1, 1, 1,
0.7897003, 0.1930973, 1.394784, 1, 1, 1, 1, 1,
0.7959713, -0.7223105, 2.816169, 1, 1, 1, 1, 1,
0.8007557, 1.2433, 1.036676, 1, 1, 1, 1, 1,
0.8029459, 0.1872465, 1.940582, 1, 1, 1, 1, 1,
0.8096774, -2.176893, 2.944405, 1, 1, 1, 1, 1,
0.8104054, 0.6430917, 0.5999692, 1, 1, 1, 1, 1,
0.8112161, -0.3350928, 1.354679, 1, 1, 1, 1, 1,
0.8179297, 0.4402137, 1.506413, 1, 1, 1, 1, 1,
0.8223967, -0.331821, 0.6522453, 1, 1, 1, 1, 1,
0.8226106, 0.09844892, 0.899261, 1, 1, 1, 1, 1,
0.829752, 0.1947763, -0.3333946, 1, 1, 1, 1, 1,
0.8300089, -0.876145, 1.844932, 1, 1, 1, 1, 1,
0.8356491, -0.1779469, 1.943902, 1, 1, 1, 1, 1,
0.8357961, -0.2171997, 1.620865, 0, 0, 1, 1, 1,
0.8359878, 0.1237474, 0.7226597, 1, 0, 0, 1, 1,
0.8371801, -0.6252954, 3.56547, 1, 0, 0, 1, 1,
0.8404241, 0.1275697, 0.5592514, 1, 0, 0, 1, 1,
0.8445973, -1.125097, 2.455182, 1, 0, 0, 1, 1,
0.8490674, 1.054732, -0.7370837, 1, 0, 0, 1, 1,
0.8492781, 0.02336077, 0.4613092, 0, 0, 0, 1, 1,
0.8509649, -0.7897458, 2.351207, 0, 0, 0, 1, 1,
0.8561622, -0.360857, 1.103368, 0, 0, 0, 1, 1,
0.8740553, 0.8260642, 0.8982285, 0, 0, 0, 1, 1,
0.8762836, 0.6430551, 0.6107829, 0, 0, 0, 1, 1,
0.8799293, 1.430805, 0.5682175, 0, 0, 0, 1, 1,
0.8807244, -0.6282014, 2.234228, 0, 0, 0, 1, 1,
0.8901495, -0.6496946, 4.129774, 1, 1, 1, 1, 1,
0.8929998, -0.03144373, 1.550507, 1, 1, 1, 1, 1,
0.8951998, 1.267436, -1.504046, 1, 1, 1, 1, 1,
0.90351, 1.812063, 0.540521, 1, 1, 1, 1, 1,
0.9047629, -1.340806, -0.1097438, 1, 1, 1, 1, 1,
0.9049894, -0.385839, -0.06551591, 1, 1, 1, 1, 1,
0.9105796, 0.1105892, 1.629473, 1, 1, 1, 1, 1,
0.9127958, -0.6023189, 2.282921, 1, 1, 1, 1, 1,
0.9154353, -0.5623807, 1.234422, 1, 1, 1, 1, 1,
0.9180105, -0.1600865, 0.5826347, 1, 1, 1, 1, 1,
0.921602, -0.04847289, 0.6225165, 1, 1, 1, 1, 1,
0.9260772, -0.8090245, 2.78554, 1, 1, 1, 1, 1,
0.9278081, -0.4320394, 1.181254, 1, 1, 1, 1, 1,
0.9285955, 0.4373592, 1.215135, 1, 1, 1, 1, 1,
0.9350052, -0.1025937, 2.456029, 1, 1, 1, 1, 1,
0.9432349, 0.2232937, 0.6729223, 0, 0, 1, 1, 1,
0.9475926, -0.834244, 0.9908231, 1, 0, 0, 1, 1,
0.950658, -1.571996, 2.635997, 1, 0, 0, 1, 1,
0.9509416, -2.454019, 3.624264, 1, 0, 0, 1, 1,
0.9513155, -0.5150644, 4.005026, 1, 0, 0, 1, 1,
0.953338, -3.027218, 1.794353, 1, 0, 0, 1, 1,
0.9545752, 0.4107412, 1.635212, 0, 0, 0, 1, 1,
0.9619028, 2.172635, -0.6207698, 0, 0, 0, 1, 1,
0.9640402, -1.70388, 3.100019, 0, 0, 0, 1, 1,
0.9689946, 2.566772, -1.117642, 0, 0, 0, 1, 1,
0.9718444, -1.176647, 1.512828, 0, 0, 0, 1, 1,
0.9724951, -0.4021575, 2.667352, 0, 0, 0, 1, 1,
0.9760426, -1.199353, 2.494465, 0, 0, 0, 1, 1,
0.9767606, -0.3035254, 0.3554759, 1, 1, 1, 1, 1,
0.9794313, -0.3147803, 2.319699, 1, 1, 1, 1, 1,
0.981963, -1.938189, 1.515742, 1, 1, 1, 1, 1,
0.9828243, 1.346807, -0.2821082, 1, 1, 1, 1, 1,
0.9848903, -0.08620492, 4.392613, 1, 1, 1, 1, 1,
0.9866898, -0.0007131456, 1.637097, 1, 1, 1, 1, 1,
0.990095, 1.039833, 0.3601288, 1, 1, 1, 1, 1,
0.9905671, 1.375175, 0.6174603, 1, 1, 1, 1, 1,
0.9981152, 0.3655644, 0.5190421, 1, 1, 1, 1, 1,
0.9982648, -0.4912535, 2.820544, 1, 1, 1, 1, 1,
1.001434, -0.4755905, 3.380187, 1, 1, 1, 1, 1,
1.007131, 0.2405519, 1.120886, 1, 1, 1, 1, 1,
1.013653, 1.816239, -0.2899413, 1, 1, 1, 1, 1,
1.021241, -0.4378408, 0.8140709, 1, 1, 1, 1, 1,
1.023651, 0.1617023, -0.3868707, 1, 1, 1, 1, 1,
1.023897, -0.8288503, 2.359428, 0, 0, 1, 1, 1,
1.02461, -0.6047335, 1.163266, 1, 0, 0, 1, 1,
1.026006, -1.560515, 3.145399, 1, 0, 0, 1, 1,
1.0293, 0.1447581, 0.9068747, 1, 0, 0, 1, 1,
1.031827, -0.5471867, 1.006163, 1, 0, 0, 1, 1,
1.038899, 1.839753, -0.7778764, 1, 0, 0, 1, 1,
1.040831, -0.1012455, 3.141145, 0, 0, 0, 1, 1,
1.042432, 0.05158041, 0.1121118, 0, 0, 0, 1, 1,
1.046277, -2.484889, 3.023603, 0, 0, 0, 1, 1,
1.053174, -1.150399, 3.106904, 0, 0, 0, 1, 1,
1.053945, 1.000422, 1.552256, 0, 0, 0, 1, 1,
1.05651, -0.9041569, 2.785105, 0, 0, 0, 1, 1,
1.057901, -0.4181733, 2.813285, 0, 0, 0, 1, 1,
1.059749, -0.9801805, 3.163891, 1, 1, 1, 1, 1,
1.066422, -0.3156297, 0.5656561, 1, 1, 1, 1, 1,
1.07201, -0.4068249, 2.810472, 1, 1, 1, 1, 1,
1.073587, -0.7023166, 2.018697, 1, 1, 1, 1, 1,
1.075429, 0.5218291, 1.169725, 1, 1, 1, 1, 1,
1.084173, -0.03174106, 0.669594, 1, 1, 1, 1, 1,
1.089918, 1.241617, -0.9130052, 1, 1, 1, 1, 1,
1.095022, -0.8703241, 4.366408, 1, 1, 1, 1, 1,
1.09528, 1.099599, 1.524634, 1, 1, 1, 1, 1,
1.106413, 0.2558052, 1.805307, 1, 1, 1, 1, 1,
1.119706, -0.4006891, 1.031198, 1, 1, 1, 1, 1,
1.123104, 0.5453607, 2.568887, 1, 1, 1, 1, 1,
1.13417, 0.9140776, 1.73052, 1, 1, 1, 1, 1,
1.136573, 0.2786967, 0.5147253, 1, 1, 1, 1, 1,
1.137605, -0.1895573, 1.392492, 1, 1, 1, 1, 1,
1.14215, -0.7469785, 2.11194, 0, 0, 1, 1, 1,
1.145113, -0.5059525, 3.300547, 1, 0, 0, 1, 1,
1.148952, 0.07613798, 0.9566692, 1, 0, 0, 1, 1,
1.157909, 0.6554901, 0.5461464, 1, 0, 0, 1, 1,
1.158509, 0.0841988, 2.643538, 1, 0, 0, 1, 1,
1.165383, 1.649194, -0.4821177, 1, 0, 0, 1, 1,
1.168018, -0.5286552, 2.247231, 0, 0, 0, 1, 1,
1.172492, -0.02330519, 1.648627, 0, 0, 0, 1, 1,
1.177527, -0.04978112, 0.9494441, 0, 0, 0, 1, 1,
1.179384, 0.4914834, 1.950291, 0, 0, 0, 1, 1,
1.185678, -0.09300806, 0.6128251, 0, 0, 0, 1, 1,
1.187541, 0.7999597, -0.4659511, 0, 0, 0, 1, 1,
1.196043, -1.212865, 1.577299, 0, 0, 0, 1, 1,
1.198858, 1.177128, 0.478621, 1, 1, 1, 1, 1,
1.221962, -0.1095883, 1.715533, 1, 1, 1, 1, 1,
1.229791, 1.701445, -1.372222, 1, 1, 1, 1, 1,
1.230213, -0.5205286, 3.468577, 1, 1, 1, 1, 1,
1.23554, 0.5039515, -0.515638, 1, 1, 1, 1, 1,
1.239581, 0.518805, 0.6264665, 1, 1, 1, 1, 1,
1.240846, -0.4972708, 1.545807, 1, 1, 1, 1, 1,
1.248824, -3.177365, 2.681602, 1, 1, 1, 1, 1,
1.250859, 1.322063, -0.9597854, 1, 1, 1, 1, 1,
1.262347, 0.06739321, 0.8706821, 1, 1, 1, 1, 1,
1.265567, 1.742608, 1.630376, 1, 1, 1, 1, 1,
1.268115, 1.907465, 0.9756402, 1, 1, 1, 1, 1,
1.276392, 0.2983573, 2.162314, 1, 1, 1, 1, 1,
1.29113, -0.7164481, 2.383724, 1, 1, 1, 1, 1,
1.294721, 1.032135, 0.7562977, 1, 1, 1, 1, 1,
1.295793, -0.2163866, 4.112789, 0, 0, 1, 1, 1,
1.296383, 0.4433903, 2.614647, 1, 0, 0, 1, 1,
1.30657, -0.1287351, 2.541892, 1, 0, 0, 1, 1,
1.317438, -0.6782805, 0.8375829, 1, 0, 0, 1, 1,
1.319408, -1.573135, 2.313425, 1, 0, 0, 1, 1,
1.322283, -0.9517835, 2.796431, 1, 0, 0, 1, 1,
1.323327, -0.5394585, 2.661533, 0, 0, 0, 1, 1,
1.355979, 0.8635951, -0.1510294, 0, 0, 0, 1, 1,
1.359021, -0.3675225, 1.640185, 0, 0, 0, 1, 1,
1.363353, 0.2676709, 2.687305, 0, 0, 0, 1, 1,
1.367626, -0.348638, 4.047641, 0, 0, 0, 1, 1,
1.369336, -0.8525046, 2.226519, 0, 0, 0, 1, 1,
1.38683, 1.375549, -0.1215549, 0, 0, 0, 1, 1,
1.387342, 0.3718646, 1.643069, 1, 1, 1, 1, 1,
1.389773, 0.0674558, 0.8788, 1, 1, 1, 1, 1,
1.42161, 0.2599466, 1.310586, 1, 1, 1, 1, 1,
1.426326, -0.7492768, 1.872463, 1, 1, 1, 1, 1,
1.428264, -0.08746117, 0.5599372, 1, 1, 1, 1, 1,
1.429149, 0.690988, 0.8707233, 1, 1, 1, 1, 1,
1.436545, 0.2691617, 1.093868, 1, 1, 1, 1, 1,
1.445667, 1.500545, -0.005070876, 1, 1, 1, 1, 1,
1.453316, -0.5033489, 0.4934044, 1, 1, 1, 1, 1,
1.481546, -1.681898, 2.205696, 1, 1, 1, 1, 1,
1.483796, -2.079698, 2.192586, 1, 1, 1, 1, 1,
1.49302, -0.6950385, 3.327251, 1, 1, 1, 1, 1,
1.504697, 0.4857938, 2.362718, 1, 1, 1, 1, 1,
1.505132, -0.3624347, 2.268451, 1, 1, 1, 1, 1,
1.514897, -0.3381666, 2.44235, 1, 1, 1, 1, 1,
1.520396, -2.392502, 2.915529, 0, 0, 1, 1, 1,
1.522138, 0.2280323, 1.636949, 1, 0, 0, 1, 1,
1.539097, 1.070356, -0.3984834, 1, 0, 0, 1, 1,
1.543917, 0.08945154, 1.143223, 1, 0, 0, 1, 1,
1.554288, 1.203981, 1.212563, 1, 0, 0, 1, 1,
1.571245, 1.119569, 1.674325, 1, 0, 0, 1, 1,
1.585219, 0.8096814, 1.978673, 0, 0, 0, 1, 1,
1.596574, -0.440219, 1.23885, 0, 0, 0, 1, 1,
1.597392, 0.2254296, 0.7157116, 0, 0, 0, 1, 1,
1.60854, 0.8943787, -0.02298558, 0, 0, 0, 1, 1,
1.642815, 0.04017884, 0.6951592, 0, 0, 0, 1, 1,
1.654626, 0.8151407, 1.569032, 0, 0, 0, 1, 1,
1.677374, -1.295474, 2.893108, 0, 0, 0, 1, 1,
1.686043, 0.6231782, 2.229247, 1, 1, 1, 1, 1,
1.698871, -0.172013, 1.318222, 1, 1, 1, 1, 1,
1.710194, -0.05972814, 1.869997, 1, 1, 1, 1, 1,
1.71503, -2.362417, 1.910322, 1, 1, 1, 1, 1,
1.761422, -0.09718923, 1.482485, 1, 1, 1, 1, 1,
1.772757, -1.380026, 0.4407198, 1, 1, 1, 1, 1,
1.785612, 0.05978324, 1.509832, 1, 1, 1, 1, 1,
1.806902, 0.3617146, 2.06728, 1, 1, 1, 1, 1,
1.815896, -0.699953, 1.111579, 1, 1, 1, 1, 1,
1.82758, -0.4084696, 2.712224, 1, 1, 1, 1, 1,
1.86312, -0.2054211, 1.60161, 1, 1, 1, 1, 1,
1.863418, 0.5658342, 2.205572, 1, 1, 1, 1, 1,
1.886746, 1.397721, 0.4296103, 1, 1, 1, 1, 1,
1.932125, 0.250911, 0.9236613, 1, 1, 1, 1, 1,
1.98325, -0.2574413, 2.52898, 1, 1, 1, 1, 1,
1.997581, -0.5153023, 2.648579, 0, 0, 1, 1, 1,
2.000185, 1.98989, 1.107923, 1, 0, 0, 1, 1,
2.008008, 0.1995078, 1.92587, 1, 0, 0, 1, 1,
2.05962, -1.186815, 1.073803, 1, 0, 0, 1, 1,
2.081355, -0.4306074, 2.996516, 1, 0, 0, 1, 1,
2.088434, -0.8480492, 1.850204, 1, 0, 0, 1, 1,
2.130332, 0.4801721, -0.3750208, 0, 0, 0, 1, 1,
2.20051, -0.7133775, 0.9316109, 0, 0, 0, 1, 1,
2.300547, 0.7698613, 1.823073, 0, 0, 0, 1, 1,
2.304277, -0.2919391, 0.5887364, 0, 0, 0, 1, 1,
2.354042, 1.267889, 0.6977112, 0, 0, 0, 1, 1,
2.377029, -0.4368912, 2.959027, 0, 0, 0, 1, 1,
2.387956, -0.2901532, 2.134273, 0, 0, 0, 1, 1,
2.429667, 0.5671436, 1.139305, 1, 1, 1, 1, 1,
2.439624, 2.447281, 0.3199398, 1, 1, 1, 1, 1,
2.521476, -0.9521847, 3.50959, 1, 1, 1, 1, 1,
2.528497, 0.5786023, 0.5491206, 1, 1, 1, 1, 1,
2.561795, -0.8413575, 0.6574265, 1, 1, 1, 1, 1,
2.767792, -1.629659, 0.5959479, 1, 1, 1, 1, 1,
2.839423, -1.068774, 3.952015, 1, 1, 1, 1, 1
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
var radius = 9.339936;
var distance = 32.80613;
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
mvMatrix.translate( 0.1982778, -0.01876545, -0.1251009 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80613);
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
