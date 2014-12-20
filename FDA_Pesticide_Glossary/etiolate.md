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
-3.179709, -0.8591939, -2.310748, 1, 0, 0, 1,
-2.828102, 0.9112772, -1.800892, 1, 0.007843138, 0, 1,
-2.725653, 0.2976973, -2.078686, 1, 0.01176471, 0, 1,
-2.640931, -0.2101289, -2.156962, 1, 0.01960784, 0, 1,
-2.52353, -0.1302252, -1.098592, 1, 0.02352941, 0, 1,
-2.495846, -0.631629, -1.137569, 1, 0.03137255, 0, 1,
-2.419656, -2.087714, -2.172303, 1, 0.03529412, 0, 1,
-2.403496, 0.7988099, -2.507571, 1, 0.04313726, 0, 1,
-2.324136, 1.024083, -2.87094, 1, 0.04705882, 0, 1,
-2.287289, 0.2641174, -1.244548, 1, 0.05490196, 0, 1,
-2.268975, 0.08094043, -3.151311, 1, 0.05882353, 0, 1,
-2.199353, -1.203311, -3.45904, 1, 0.06666667, 0, 1,
-2.160414, 1.148838, -1.516588, 1, 0.07058824, 0, 1,
-2.147422, 0.9439897, -2.275074, 1, 0.07843138, 0, 1,
-2.123055, 1.460167, -2.659564, 1, 0.08235294, 0, 1,
-2.113621, -0.7706499, -0.5560744, 1, 0.09019608, 0, 1,
-2.093674, -0.770417, -1.240268, 1, 0.09411765, 0, 1,
-2.058682, 0.7727702, -0.8392144, 1, 0.1019608, 0, 1,
-2.047653, 0.7911578, -2.700122, 1, 0.1098039, 0, 1,
-2.035061, 1.726461, -0.7736077, 1, 0.1137255, 0, 1,
-2.000708, -0.3447348, -3.171446, 1, 0.1215686, 0, 1,
-1.99788, 1.346329, -1.037567, 1, 0.1254902, 0, 1,
-1.997151, 1.251321, -1.006066, 1, 0.1333333, 0, 1,
-1.97333, -0.6481114, -1.313721, 1, 0.1372549, 0, 1,
-1.943015, 0.7487527, 0.1086645, 1, 0.145098, 0, 1,
-1.92461, 0.3108864, -2.872108, 1, 0.1490196, 0, 1,
-1.909, -0.9358376, -2.651731, 1, 0.1568628, 0, 1,
-1.90491, -0.8380064, -0.949164, 1, 0.1607843, 0, 1,
-1.888059, 0.1012308, -0.5113949, 1, 0.1686275, 0, 1,
-1.881019, -0.4048642, -2.011332, 1, 0.172549, 0, 1,
-1.856622, -0.3106606, -2.750451, 1, 0.1803922, 0, 1,
-1.854399, -1.725502, -2.912882, 1, 0.1843137, 0, 1,
-1.842662, 0.329281, -1.485432, 1, 0.1921569, 0, 1,
-1.841529, 0.07532559, -1.46099, 1, 0.1960784, 0, 1,
-1.818067, 0.01461564, -0.6467035, 1, 0.2039216, 0, 1,
-1.812984, -0.2341926, -2.523865, 1, 0.2117647, 0, 1,
-1.803988, -1.312099, -3.189324, 1, 0.2156863, 0, 1,
-1.800603, 0.0104398, -2.351958, 1, 0.2235294, 0, 1,
-1.787609, -0.005263168, -1.884257, 1, 0.227451, 0, 1,
-1.786277, 1.558025, -1.577953, 1, 0.2352941, 0, 1,
-1.781554, -0.04895274, -3.123642, 1, 0.2392157, 0, 1,
-1.776288, 1.570258, -0.4442821, 1, 0.2470588, 0, 1,
-1.768997, 0.4932376, -1.182242, 1, 0.2509804, 0, 1,
-1.760385, 0.6929151, -1.775444, 1, 0.2588235, 0, 1,
-1.758589, -0.2610879, -2.013522, 1, 0.2627451, 0, 1,
-1.754794, 0.6257436, 1.251422, 1, 0.2705882, 0, 1,
-1.753675, -0.1443009, -1.218614, 1, 0.2745098, 0, 1,
-1.752877, 0.3930672, -1.027175, 1, 0.282353, 0, 1,
-1.750162, 1.717921, -0.1456143, 1, 0.2862745, 0, 1,
-1.746297, -0.1167254, -1.286364, 1, 0.2941177, 0, 1,
-1.722677, -1.43032, -3.193187, 1, 0.3019608, 0, 1,
-1.67632, -1.502699, -3.602407, 1, 0.3058824, 0, 1,
-1.668133, 1.279539, -0.8079767, 1, 0.3137255, 0, 1,
-1.666126, 1.699968, -2.451694, 1, 0.3176471, 0, 1,
-1.665384, 0.6808965, -1.232607, 1, 0.3254902, 0, 1,
-1.644248, 0.8057991, -1.687662, 1, 0.3294118, 0, 1,
-1.636918, -0.5913807, -2.707212, 1, 0.3372549, 0, 1,
-1.634164, -0.8843508, 0.9259748, 1, 0.3411765, 0, 1,
-1.632211, 1.26601, -1.116704, 1, 0.3490196, 0, 1,
-1.607915, 0.7331121, -1.981096, 1, 0.3529412, 0, 1,
-1.596067, 0.6519521, -1.251089, 1, 0.3607843, 0, 1,
-1.582449, 0.1031658, -1.563516, 1, 0.3647059, 0, 1,
-1.577983, 1.546227, -0.0286888, 1, 0.372549, 0, 1,
-1.575563, 1.333118, -2.796515, 1, 0.3764706, 0, 1,
-1.564942, 0.568828, -0.5364783, 1, 0.3843137, 0, 1,
-1.548449, -1.203595, -1.627278, 1, 0.3882353, 0, 1,
-1.546144, -0.7899339, -2.286615, 1, 0.3960784, 0, 1,
-1.536504, -2.71071, -1.90674, 1, 0.4039216, 0, 1,
-1.531364, -0.6985955, 0.1918435, 1, 0.4078431, 0, 1,
-1.527038, -0.08477652, -2.264096, 1, 0.4156863, 0, 1,
-1.512859, 2.035859, -1.732926, 1, 0.4196078, 0, 1,
-1.501005, 1.032735, -1.526019, 1, 0.427451, 0, 1,
-1.491628, -0.4415427, -3.431542, 1, 0.4313726, 0, 1,
-1.488191, -1.516797, -2.913805, 1, 0.4392157, 0, 1,
-1.486956, 1.535076, -0.4236435, 1, 0.4431373, 0, 1,
-1.483596, -0.709758, -2.217646, 1, 0.4509804, 0, 1,
-1.482141, -0.7774023, -0.6451045, 1, 0.454902, 0, 1,
-1.467694, -0.1947961, -0.5530211, 1, 0.4627451, 0, 1,
-1.450565, 0.9735991, -1.312063, 1, 0.4666667, 0, 1,
-1.440976, 0.9308138, -0.2707854, 1, 0.4745098, 0, 1,
-1.424025, 0.1419863, -0.4786423, 1, 0.4784314, 0, 1,
-1.415775, -0.004435728, -1.811839, 1, 0.4862745, 0, 1,
-1.41324, 0.371305, -1.556018, 1, 0.4901961, 0, 1,
-1.399471, -0.5641113, -1.452193, 1, 0.4980392, 0, 1,
-1.382632, -3.640486, -3.11943, 1, 0.5058824, 0, 1,
-1.382352, 0.3343275, -2.851925, 1, 0.509804, 0, 1,
-1.378239, 0.1846366, -2.017483, 1, 0.5176471, 0, 1,
-1.374119, -1.050499, -1.656994, 1, 0.5215687, 0, 1,
-1.362337, 0.7478361, 0.03420746, 1, 0.5294118, 0, 1,
-1.352476, -0.3152417, -3.207794, 1, 0.5333334, 0, 1,
-1.35141, -0.4149257, 0.8854224, 1, 0.5411765, 0, 1,
-1.347082, 1.402696, -1.358578, 1, 0.5450981, 0, 1,
-1.345384, 0.553239, -2.987638, 1, 0.5529412, 0, 1,
-1.34296, -1.009078, -1.176816, 1, 0.5568628, 0, 1,
-1.339398, -0.9922873, -1.125509, 1, 0.5647059, 0, 1,
-1.332683, 1.034408, -1.205939, 1, 0.5686275, 0, 1,
-1.325971, -3.407262, -3.943342, 1, 0.5764706, 0, 1,
-1.323439, -0.6496987, -2.563402, 1, 0.5803922, 0, 1,
-1.315126, -0.4410493, -1.079792, 1, 0.5882353, 0, 1,
-1.312968, -0.3071431, -2.484188, 1, 0.5921569, 0, 1,
-1.308888, -0.9822158, -1.807517, 1, 0.6, 0, 1,
-1.303962, -0.8300202, -2.519001, 1, 0.6078432, 0, 1,
-1.28998, -0.7345783, -2.560052, 1, 0.6117647, 0, 1,
-1.287223, -0.1525947, -1.394991, 1, 0.6196079, 0, 1,
-1.283145, -2.27441, -2.409985, 1, 0.6235294, 0, 1,
-1.279214, 1.130101, -0.08038899, 1, 0.6313726, 0, 1,
-1.277584, -0.769607, -2.964344, 1, 0.6352941, 0, 1,
-1.273694, -0.1336499, -0.4991601, 1, 0.6431373, 0, 1,
-1.273179, -1.836489, -3.191392, 1, 0.6470588, 0, 1,
-1.270395, 0.2236362, -0.8865138, 1, 0.654902, 0, 1,
-1.258022, -1.46218, -1.810585, 1, 0.6588235, 0, 1,
-1.246199, 1.372015, -3.750532, 1, 0.6666667, 0, 1,
-1.245952, 0.1208413, 0.07642025, 1, 0.6705883, 0, 1,
-1.244091, 0.6639879, -2.338532, 1, 0.6784314, 0, 1,
-1.241042, 0.1834141, -1.01264, 1, 0.682353, 0, 1,
-1.236441, 1.173744, -0.7845772, 1, 0.6901961, 0, 1,
-1.22569, 2.158244, -1.716923, 1, 0.6941177, 0, 1,
-1.214687, -0.41668, -0.6052729, 1, 0.7019608, 0, 1,
-1.209613, -0.2363084, -1.717395, 1, 0.7098039, 0, 1,
-1.209293, -0.9384244, 0.4230357, 1, 0.7137255, 0, 1,
-1.200424, -1.157339, -2.585963, 1, 0.7215686, 0, 1,
-1.197245, 0.4526478, -2.053438, 1, 0.7254902, 0, 1,
-1.182716, -1.56043, -1.634968, 1, 0.7333333, 0, 1,
-1.18178, 0.3525866, -1.08047, 1, 0.7372549, 0, 1,
-1.179856, 1.090107, 0.2140549, 1, 0.7450981, 0, 1,
-1.176968, 0.4856612, 0.5894639, 1, 0.7490196, 0, 1,
-1.169914, 0.2863178, -1.300135, 1, 0.7568628, 0, 1,
-1.164597, -1.858647, -3.656213, 1, 0.7607843, 0, 1,
-1.157741, 0.9053037, -0.2636252, 1, 0.7686275, 0, 1,
-1.157062, -1.730475, -3.426792, 1, 0.772549, 0, 1,
-1.155266, 0.2024371, -1.687649, 1, 0.7803922, 0, 1,
-1.154213, -1.204252, -2.129039, 1, 0.7843137, 0, 1,
-1.153891, -0.298607, -0.8095234, 1, 0.7921569, 0, 1,
-1.153381, -1.318703, -1.746417, 1, 0.7960784, 0, 1,
-1.142932, -0.2003567, -0.2669483, 1, 0.8039216, 0, 1,
-1.140174, 0.4306689, 1.027791, 1, 0.8117647, 0, 1,
-1.139767, -1.018721, -2.102824, 1, 0.8156863, 0, 1,
-1.139441, 0.7405767, -1.273535, 1, 0.8235294, 0, 1,
-1.132015, -1.027287, -3.064487, 1, 0.827451, 0, 1,
-1.125928, 0.3311433, -1.833057, 1, 0.8352941, 0, 1,
-1.122018, -1.186226, -2.726717, 1, 0.8392157, 0, 1,
-1.11327, -1.442817, -2.569003, 1, 0.8470588, 0, 1,
-1.110882, -0.2899868, 0.04046831, 1, 0.8509804, 0, 1,
-1.11044, -0.2525624, 0.3370801, 1, 0.8588235, 0, 1,
-1.094355, 0.324196, -0.6771388, 1, 0.8627451, 0, 1,
-1.091251, -1.040838, -3.07331, 1, 0.8705882, 0, 1,
-1.089847, 0.1160421, -1.823887, 1, 0.8745098, 0, 1,
-1.074198, 0.3458147, -0.3261527, 1, 0.8823529, 0, 1,
-1.066677, -1.011507, -0.7253164, 1, 0.8862745, 0, 1,
-1.057161, 0.5459508, -0.3902777, 1, 0.8941177, 0, 1,
-1.056516, 1.636014, 0.8993226, 1, 0.8980392, 0, 1,
-1.048253, 0.9925593, 0.5708523, 1, 0.9058824, 0, 1,
-1.047243, 0.4430008, -0.6105661, 1, 0.9137255, 0, 1,
-1.043263, 1.051494, -0.6307424, 1, 0.9176471, 0, 1,
-1.040007, -1.287085, -3.037506, 1, 0.9254902, 0, 1,
-1.038332, 0.4290932, -2.246328, 1, 0.9294118, 0, 1,
-1.036592, 0.4959836, -1.052637, 1, 0.9372549, 0, 1,
-1.036191, 0.8219328, -0.1958141, 1, 0.9411765, 0, 1,
-1.031125, -1.101457, -1.891153, 1, 0.9490196, 0, 1,
-1.029669, 0.6777562, -1.265913, 1, 0.9529412, 0, 1,
-1.022861, 1.376076, -0.9408301, 1, 0.9607843, 0, 1,
-1.021921, -0.5706724, 0.2031659, 1, 0.9647059, 0, 1,
-1.02112, 0.7332611, -1.77172, 1, 0.972549, 0, 1,
-1.020676, -1.19093, -2.369982, 1, 0.9764706, 0, 1,
-1.01607, 1.791898, -0.3756431, 1, 0.9843137, 0, 1,
-1.015877, -1.00763, -1.552814, 1, 0.9882353, 0, 1,
-1.010343, 0.2366433, -0.9596426, 1, 0.9960784, 0, 1,
-1.010118, 0.1881067, -1.40202, 0.9960784, 1, 0, 1,
-1.00906, 0.5140255, -3.698841, 0.9921569, 1, 0, 1,
-1.004718, 0.9346571, 1.055875, 0.9843137, 1, 0, 1,
-1.00338, -0.9744264, -1.949009, 0.9803922, 1, 0, 1,
-0.9946249, 1.416495, -0.8667297, 0.972549, 1, 0, 1,
-0.9940132, 1.099913, -1.836553, 0.9686275, 1, 0, 1,
-0.9932872, -1.825704, -3.017883, 0.9607843, 1, 0, 1,
-0.9911726, 0.4428838, -0.6484978, 0.9568627, 1, 0, 1,
-0.9866325, -1.040313, -1.727761, 0.9490196, 1, 0, 1,
-0.9855102, 0.2598117, -1.486486, 0.945098, 1, 0, 1,
-0.9850022, -1.403647, -3.491925, 0.9372549, 1, 0, 1,
-0.9833645, -1.619095, -0.9743262, 0.9333333, 1, 0, 1,
-0.9804299, 0.2452029, -1.223507, 0.9254902, 1, 0, 1,
-0.974346, -0.1848393, -2.490552, 0.9215686, 1, 0, 1,
-0.9611312, 1.659825, -1.760498, 0.9137255, 1, 0, 1,
-0.9536642, -1.087504, -2.599181, 0.9098039, 1, 0, 1,
-0.9506097, 0.6130316, -0.9368675, 0.9019608, 1, 0, 1,
-0.9480525, 0.3795989, -0.9473017, 0.8941177, 1, 0, 1,
-0.9479651, 0.7781927, -0.6892818, 0.8901961, 1, 0, 1,
-0.9438792, 0.2119681, -2.054032, 0.8823529, 1, 0, 1,
-0.9405366, 1.879064, 0.3310002, 0.8784314, 1, 0, 1,
-0.939409, -1.659377, -3.138746, 0.8705882, 1, 0, 1,
-0.9343186, -1.008436, -1.017584, 0.8666667, 1, 0, 1,
-0.9282598, -0.457886, -2.79366, 0.8588235, 1, 0, 1,
-0.9276999, 0.6926884, -0.7852244, 0.854902, 1, 0, 1,
-0.9176809, -0.171897, -0.7620316, 0.8470588, 1, 0, 1,
-0.9160634, 0.2971887, -2.844602, 0.8431373, 1, 0, 1,
-0.9073699, 0.5118269, 0.1776541, 0.8352941, 1, 0, 1,
-0.9026259, 1.084905, -1.28072, 0.8313726, 1, 0, 1,
-0.8964535, -1.322281, -2.799063, 0.8235294, 1, 0, 1,
-0.8926933, 1.184855, 0.8455544, 0.8196079, 1, 0, 1,
-0.8923385, 0.3532395, -0.7221587, 0.8117647, 1, 0, 1,
-0.8887411, 0.1863206, -1.342616, 0.8078431, 1, 0, 1,
-0.8829704, -2.135028, -3.012799, 0.8, 1, 0, 1,
-0.8821624, -1.17279, -1.424302, 0.7921569, 1, 0, 1,
-0.8814894, 0.655057, -0.007887266, 0.7882353, 1, 0, 1,
-0.8803694, 0.2224533, -1.171353, 0.7803922, 1, 0, 1,
-0.8773825, 1.594092, 0.2799388, 0.7764706, 1, 0, 1,
-0.8772326, 1.235929, -1.832419, 0.7686275, 1, 0, 1,
-0.8724367, -1.219515, -1.780229, 0.7647059, 1, 0, 1,
-0.8631044, -0.965361, -2.175211, 0.7568628, 1, 0, 1,
-0.8590487, -0.4610602, -2.161256, 0.7529412, 1, 0, 1,
-0.8582422, -2.025199, -2.181329, 0.7450981, 1, 0, 1,
-0.8556799, -1.412909, -2.189578, 0.7411765, 1, 0, 1,
-0.8548579, 0.376429, -1.797788, 0.7333333, 1, 0, 1,
-0.8525982, -1.018907, -2.157068, 0.7294118, 1, 0, 1,
-0.8470788, -1.258559, -5.383451, 0.7215686, 1, 0, 1,
-0.8461372, 0.08406334, -2.895305, 0.7176471, 1, 0, 1,
-0.8445906, 2.309256, -0.5810652, 0.7098039, 1, 0, 1,
-0.8381631, 0.9047302, -1.534713, 0.7058824, 1, 0, 1,
-0.8236658, -0.4127883, -2.474225, 0.6980392, 1, 0, 1,
-0.8210525, 1.254549, 0.289149, 0.6901961, 1, 0, 1,
-0.8194917, -0.4650215, -2.187032, 0.6862745, 1, 0, 1,
-0.8160409, 1.828773, -1.065368, 0.6784314, 1, 0, 1,
-0.8132593, -0.8667412, -1.113891, 0.6745098, 1, 0, 1,
-0.81164, -1.719317, -0.4331419, 0.6666667, 1, 0, 1,
-0.8084134, 1.334132, -0.07949906, 0.6627451, 1, 0, 1,
-0.8073161, 0.1305013, -1.155817, 0.654902, 1, 0, 1,
-0.8072357, 0.49696, -0.7112302, 0.6509804, 1, 0, 1,
-0.8069839, 0.9581019, -0.1444052, 0.6431373, 1, 0, 1,
-0.8000807, -0.3427709, -1.168914, 0.6392157, 1, 0, 1,
-0.7968032, -1.353849, -2.74493, 0.6313726, 1, 0, 1,
-0.7914819, 0.09835601, -0.7829893, 0.627451, 1, 0, 1,
-0.788215, -1.394605, -3.981341, 0.6196079, 1, 0, 1,
-0.7856079, 0.6214944, 1.672621, 0.6156863, 1, 0, 1,
-0.7840447, -1.512867, -1.427473, 0.6078432, 1, 0, 1,
-0.7815105, -2.131608, -3.017295, 0.6039216, 1, 0, 1,
-0.7804123, 1.127969, -0.3045606, 0.5960785, 1, 0, 1,
-0.7783498, -0.6248029, -3.292221, 0.5882353, 1, 0, 1,
-0.777206, -0.5715663, -2.010932, 0.5843138, 1, 0, 1,
-0.7744832, -0.6492207, -1.566495, 0.5764706, 1, 0, 1,
-0.7660369, -1.328968, -2.14486, 0.572549, 1, 0, 1,
-0.7644216, -1.902494, -3.697643, 0.5647059, 1, 0, 1,
-0.7591922, 0.7145051, -0.2924503, 0.5607843, 1, 0, 1,
-0.7579367, -0.8631175, -2.810921, 0.5529412, 1, 0, 1,
-0.7574405, 0.06223743, -0.418602, 0.5490196, 1, 0, 1,
-0.753948, 0.3555714, -0.1300824, 0.5411765, 1, 0, 1,
-0.7502354, 0.8214294, -0.03033159, 0.5372549, 1, 0, 1,
-0.7495167, -0.6178111, -2.476982, 0.5294118, 1, 0, 1,
-0.7474815, -2.016487, -2.342637, 0.5254902, 1, 0, 1,
-0.7445595, -1.014237, -2.517626, 0.5176471, 1, 0, 1,
-0.738823, -0.3098156, -2.666883, 0.5137255, 1, 0, 1,
-0.7376564, -0.05096311, -0.5698866, 0.5058824, 1, 0, 1,
-0.7345253, -0.06476068, -1.729483, 0.5019608, 1, 0, 1,
-0.732299, 1.253754, 0.2962724, 0.4941176, 1, 0, 1,
-0.7259461, 0.8675094, -1.177064, 0.4862745, 1, 0, 1,
-0.7225889, -0.4451095, -2.630997, 0.4823529, 1, 0, 1,
-0.7213126, 2.247073, -0.361299, 0.4745098, 1, 0, 1,
-0.711283, 0.3559113, -2.378835, 0.4705882, 1, 0, 1,
-0.703542, 1.957596, -1.608703, 0.4627451, 1, 0, 1,
-0.7021844, -0.1397203, -1.619159, 0.4588235, 1, 0, 1,
-0.7020271, 1.530199, -1.285109, 0.4509804, 1, 0, 1,
-0.6997465, -0.2039215, -2.08641, 0.4470588, 1, 0, 1,
-0.6934857, -0.6245031, -1.114079, 0.4392157, 1, 0, 1,
-0.6883925, 0.8881021, -0.2474376, 0.4352941, 1, 0, 1,
-0.6878244, -0.1630623, -0.47337, 0.427451, 1, 0, 1,
-0.6868439, 0.1790787, -1.760476, 0.4235294, 1, 0, 1,
-0.6861862, -0.3904694, -3.781282, 0.4156863, 1, 0, 1,
-0.6780365, -0.9781243, -4.097746, 0.4117647, 1, 0, 1,
-0.6773562, 0.6811413, -1.076678, 0.4039216, 1, 0, 1,
-0.672017, -1.155146, -2.816434, 0.3960784, 1, 0, 1,
-0.6687939, 0.6001789, -0.4468895, 0.3921569, 1, 0, 1,
-0.6657665, 0.1968517, 0.1652565, 0.3843137, 1, 0, 1,
-0.6625101, -0.4355807, -1.921382, 0.3803922, 1, 0, 1,
-0.6611239, -1.022348, -1.903454, 0.372549, 1, 0, 1,
-0.6572636, -1.519223, -2.812249, 0.3686275, 1, 0, 1,
-0.6570866, 1.588409, -1.046913, 0.3607843, 1, 0, 1,
-0.6521453, -1.85033, -4.452112, 0.3568628, 1, 0, 1,
-0.6518213, -0.4644193, -2.814916, 0.3490196, 1, 0, 1,
-0.6493853, -1.558026, -2.093346, 0.345098, 1, 0, 1,
-0.6414335, 0.2864552, -1.759155, 0.3372549, 1, 0, 1,
-0.6367167, 0.4231567, -1.316383, 0.3333333, 1, 0, 1,
-0.6347518, 0.1304933, -1.261608, 0.3254902, 1, 0, 1,
-0.6329907, -0.6790909, -1.292765, 0.3215686, 1, 0, 1,
-0.6255425, 0.2611821, -0.9740207, 0.3137255, 1, 0, 1,
-0.6221011, -0.4944315, -0.6985202, 0.3098039, 1, 0, 1,
-0.6158951, 0.4422544, -1.152186, 0.3019608, 1, 0, 1,
-0.6111357, -0.5724083, -1.830078, 0.2941177, 1, 0, 1,
-0.6071912, 1.496568, 0.666263, 0.2901961, 1, 0, 1,
-0.6056278, 0.9017445, -0.5568319, 0.282353, 1, 0, 1,
-0.6046579, 1.948296, 0.7714021, 0.2784314, 1, 0, 1,
-0.5886959, -2.237872, -1.693377, 0.2705882, 1, 0, 1,
-0.5815821, 0.8012025, -2.621989, 0.2666667, 1, 0, 1,
-0.5766145, 0.09123351, -1.156914, 0.2588235, 1, 0, 1,
-0.5750068, 0.6773308, -2.213736, 0.254902, 1, 0, 1,
-0.5738848, -0.3680411, -3.144564, 0.2470588, 1, 0, 1,
-0.5730391, 0.8151554, -0.8593575, 0.2431373, 1, 0, 1,
-0.5597209, -0.07180247, -2.54362, 0.2352941, 1, 0, 1,
-0.5575001, -0.2096052, -1.625243, 0.2313726, 1, 0, 1,
-0.5547514, -0.9436655, -1.248032, 0.2235294, 1, 0, 1,
-0.5541772, 1.222432, -0.4289392, 0.2196078, 1, 0, 1,
-0.5456139, 0.5071204, -3.312906, 0.2117647, 1, 0, 1,
-0.5409436, 1.415891, -0.5802745, 0.2078431, 1, 0, 1,
-0.539958, -1.851961, -3.988956, 0.2, 1, 0, 1,
-0.5355059, -1.429901, -2.665901, 0.1921569, 1, 0, 1,
-0.5289981, -0.06165961, -1.268825, 0.1882353, 1, 0, 1,
-0.5269537, -0.6202101, -3.460558, 0.1803922, 1, 0, 1,
-0.5260273, 2.204516, 0.4185057, 0.1764706, 1, 0, 1,
-0.5252448, 1.561211, -0.07772879, 0.1686275, 1, 0, 1,
-0.5217265, -0.4074647, -1.637896, 0.1647059, 1, 0, 1,
-0.5195315, 1.97944, -0.5880806, 0.1568628, 1, 0, 1,
-0.5189822, -0.3365869, -2.669614, 0.1529412, 1, 0, 1,
-0.5189072, 1.313921, 1.24108, 0.145098, 1, 0, 1,
-0.5144419, -1.262363, -2.400386, 0.1411765, 1, 0, 1,
-0.5125344, 0.1144184, -1.812404, 0.1333333, 1, 0, 1,
-0.5113984, -1.678397, -4.549981, 0.1294118, 1, 0, 1,
-0.4993716, 0.1664989, -2.63198, 0.1215686, 1, 0, 1,
-0.4985818, -0.8081977, -3.14058, 0.1176471, 1, 0, 1,
-0.4981545, -1.204506, -4.792588, 0.1098039, 1, 0, 1,
-0.4979207, -1.255755, -3.157172, 0.1058824, 1, 0, 1,
-0.4960972, 0.371457, -1.107157, 0.09803922, 1, 0, 1,
-0.4953429, -0.3242888, -3.245788, 0.09019608, 1, 0, 1,
-0.4831015, -0.3608376, -1.795874, 0.08627451, 1, 0, 1,
-0.4830649, -2.085236, -3.196485, 0.07843138, 1, 0, 1,
-0.4822592, -0.1477861, -1.217459, 0.07450981, 1, 0, 1,
-0.4819446, 2.97173, 0.6209912, 0.06666667, 1, 0, 1,
-0.4786075, -0.273581, -1.967435, 0.0627451, 1, 0, 1,
-0.474913, 0.1650692, -0.8214464, 0.05490196, 1, 0, 1,
-0.4720188, 1.867565, 0.7511982, 0.05098039, 1, 0, 1,
-0.4710418, 2.035408, 0.8384004, 0.04313726, 1, 0, 1,
-0.470984, -0.128083, -1.605037, 0.03921569, 1, 0, 1,
-0.4707511, -0.241401, -2.104086, 0.03137255, 1, 0, 1,
-0.4700325, -0.4788012, -3.410035, 0.02745098, 1, 0, 1,
-0.4698246, 0.07034052, -0.9263861, 0.01960784, 1, 0, 1,
-0.4635245, 1.480315, -0.5695888, 0.01568628, 1, 0, 1,
-0.4593406, 0.5653435, -0.6138232, 0.007843138, 1, 0, 1,
-0.4574876, 1.808679, 0.388209, 0.003921569, 1, 0, 1,
-0.4542713, -0.6022388, -1.55472, 0, 1, 0.003921569, 1,
-0.4500162, -0.1012217, -2.152732, 0, 1, 0.01176471, 1,
-0.4497626, -0.1452875, -2.637059, 0, 1, 0.01568628, 1,
-0.4432524, -1.853266, -1.363725, 0, 1, 0.02352941, 1,
-0.4395065, -0.01647401, -2.285466, 0, 1, 0.02745098, 1,
-0.4382875, 0.911932, -0.1476223, 0, 1, 0.03529412, 1,
-0.4380565, -0.7737678, -5.05433, 0, 1, 0.03921569, 1,
-0.4375597, 0.05247644, -1.707288, 0, 1, 0.04705882, 1,
-0.4374757, 0.8935227, -0.5498423, 0, 1, 0.05098039, 1,
-0.4370385, 0.139997, -4.553063, 0, 1, 0.05882353, 1,
-0.4358084, 0.6893598, 1.669178, 0, 1, 0.0627451, 1,
-0.419317, 1.335794, 0.04222537, 0, 1, 0.07058824, 1,
-0.4190921, -1.156616, -3.603968, 0, 1, 0.07450981, 1,
-0.4184944, -1.486935, -3.527869, 0, 1, 0.08235294, 1,
-0.4181703, 0.1113589, -1.074362, 0, 1, 0.08627451, 1,
-0.4163632, -0.8903506, -1.794258, 0, 1, 0.09411765, 1,
-0.4109995, -0.1629758, -0.5079689, 0, 1, 0.1019608, 1,
-0.4107293, 0.4163133, -0.6400303, 0, 1, 0.1058824, 1,
-0.4041328, -0.6817328, -3.963838, 0, 1, 0.1137255, 1,
-0.4031822, -0.04395621, -0.7979881, 0, 1, 0.1176471, 1,
-0.4023508, 1.177114, 1.651333, 0, 1, 0.1254902, 1,
-0.400987, 0.2016263, -1.507608, 0, 1, 0.1294118, 1,
-0.3935924, 0.3958338, -2.68939, 0, 1, 0.1372549, 1,
-0.3926312, 0.07273915, -1.254144, 0, 1, 0.1411765, 1,
-0.3924848, 1.200559, -0.7861972, 0, 1, 0.1490196, 1,
-0.3865645, -0.02147366, -2.227418, 0, 1, 0.1529412, 1,
-0.3833947, 1.015042, -0.1226172, 0, 1, 0.1607843, 1,
-0.3802134, 0.2635606, -0.4568598, 0, 1, 0.1647059, 1,
-0.3771945, 3.206016, 1.398174, 0, 1, 0.172549, 1,
-0.3746134, -0.2928533, -2.313323, 0, 1, 0.1764706, 1,
-0.3746032, -0.9993297, -2.972429, 0, 1, 0.1843137, 1,
-0.3729541, 2.082308, -0.6474941, 0, 1, 0.1882353, 1,
-0.3713441, -0.2944182, -2.612248, 0, 1, 0.1960784, 1,
-0.3707476, -0.005670216, -1.517893, 0, 1, 0.2039216, 1,
-0.3691079, 0.644091, 0.1974069, 0, 1, 0.2078431, 1,
-0.3680364, -0.1564006, 0.08295249, 0, 1, 0.2156863, 1,
-0.3652364, 0.9465883, 0.4194365, 0, 1, 0.2196078, 1,
-0.364288, 2.034727, -0.7737142, 0, 1, 0.227451, 1,
-0.3619312, 0.5751256, -2.137654, 0, 1, 0.2313726, 1,
-0.360848, -0.7835769, -3.175308, 0, 1, 0.2392157, 1,
-0.3606449, -0.1049762, -1.949286, 0, 1, 0.2431373, 1,
-0.3596572, -0.679944, -0.6342833, 0, 1, 0.2509804, 1,
-0.3557065, 1.182076, 0.4045207, 0, 1, 0.254902, 1,
-0.3455576, 1.730326, -1.231652, 0, 1, 0.2627451, 1,
-0.3427905, 0.2873138, -1.46218, 0, 1, 0.2666667, 1,
-0.3346125, 0.4340472, -1.23527, 0, 1, 0.2745098, 1,
-0.3339453, -0.5539578, -2.57672, 0, 1, 0.2784314, 1,
-0.3252103, -2.455594, -0.6791835, 0, 1, 0.2862745, 1,
-0.3161865, 0.7123149, -0.1056036, 0, 1, 0.2901961, 1,
-0.3119228, -0.1462836, -2.768939, 0, 1, 0.2980392, 1,
-0.3102745, 1.067258, 0.317866, 0, 1, 0.3058824, 1,
-0.3101588, 0.7032255, -0.4794923, 0, 1, 0.3098039, 1,
-0.3095556, 0.8744407, -0.5251524, 0, 1, 0.3176471, 1,
-0.3057374, 0.624797, -2.044885, 0, 1, 0.3215686, 1,
-0.3055062, -0.5219482, -1.599217, 0, 1, 0.3294118, 1,
-0.297556, -2.093482, -3.091588, 0, 1, 0.3333333, 1,
-0.2974457, 1.078165, -0.7389647, 0, 1, 0.3411765, 1,
-0.2956479, 1.553083, 0.7781947, 0, 1, 0.345098, 1,
-0.2920007, -0.9276549, -4.690479, 0, 1, 0.3529412, 1,
-0.2916431, 0.553525, -0.00931349, 0, 1, 0.3568628, 1,
-0.2795804, 0.1139999, 0.5055676, 0, 1, 0.3647059, 1,
-0.2788285, 0.9583042, 0.5339105, 0, 1, 0.3686275, 1,
-0.2743461, -0.4777282, -0.5541617, 0, 1, 0.3764706, 1,
-0.2694298, -2.229188, -2.15376, 0, 1, 0.3803922, 1,
-0.2650461, 0.6072214, -0.7304835, 0, 1, 0.3882353, 1,
-0.2545533, -0.3815967, -4.891937, 0, 1, 0.3921569, 1,
-0.2541725, -0.1485762, -0.4666253, 0, 1, 0.4, 1,
-0.2497954, 0.8345511, 0.7030998, 0, 1, 0.4078431, 1,
-0.2360616, -0.4346454, -5.058877, 0, 1, 0.4117647, 1,
-0.2342214, 0.4566299, -0.5857073, 0, 1, 0.4196078, 1,
-0.2340834, -0.7208354, -4.293044, 0, 1, 0.4235294, 1,
-0.2275883, 1.482333, 0.3438013, 0, 1, 0.4313726, 1,
-0.2259416, 0.7499525, -0.9240552, 0, 1, 0.4352941, 1,
-0.2183581, 1.780363, 0.2835265, 0, 1, 0.4431373, 1,
-0.2180098, 0.4436468, 0.9939851, 0, 1, 0.4470588, 1,
-0.2166516, -0.6546085, -2.368219, 0, 1, 0.454902, 1,
-0.2142182, 0.2854681, -1.505967, 0, 1, 0.4588235, 1,
-0.2126389, -1.579254, -3.078959, 0, 1, 0.4666667, 1,
-0.2109145, -0.9492607, -4.08166, 0, 1, 0.4705882, 1,
-0.2101903, -0.01605361, -1.781373, 0, 1, 0.4784314, 1,
-0.2047833, 0.5120763, -1.511002, 0, 1, 0.4823529, 1,
-0.2023965, 0.785002, -0.6355273, 0, 1, 0.4901961, 1,
-0.1972621, 0.9868695, 0.7514462, 0, 1, 0.4941176, 1,
-0.1968805, -0.4188702, -2.210645, 0, 1, 0.5019608, 1,
-0.194793, 0.1346451, -2.012944, 0, 1, 0.509804, 1,
-0.1857654, -1.045867, -5.931659, 0, 1, 0.5137255, 1,
-0.1853363, -0.7947412, -2.476582, 0, 1, 0.5215687, 1,
-0.1840167, -1.386408, -2.605785, 0, 1, 0.5254902, 1,
-0.183638, 0.9341001, -0.2800165, 0, 1, 0.5333334, 1,
-0.1823329, 0.8449516, 1.721703, 0, 1, 0.5372549, 1,
-0.1798576, 2.44342, 1.701468, 0, 1, 0.5450981, 1,
-0.1775725, 1.431735, 0.2885584, 0, 1, 0.5490196, 1,
-0.1773134, 0.5048673, -0.4710761, 0, 1, 0.5568628, 1,
-0.1735571, 0.630251, -0.7970785, 0, 1, 0.5607843, 1,
-0.1734733, 0.4339304, -2.142379, 0, 1, 0.5686275, 1,
-0.1733786, 1.271091, -1.372564, 0, 1, 0.572549, 1,
-0.1721529, 1.813241, 0.9460732, 0, 1, 0.5803922, 1,
-0.1692331, 0.5288891, 0.4015855, 0, 1, 0.5843138, 1,
-0.1623015, 0.7087588, -0.5807835, 0, 1, 0.5921569, 1,
-0.1612107, -0.5986663, -4.265939, 0, 1, 0.5960785, 1,
-0.1582672, 1.520532, 0.430688, 0, 1, 0.6039216, 1,
-0.1579291, 1.21132, -1.476414, 0, 1, 0.6117647, 1,
-0.1578369, -1.745019, -2.530144, 0, 1, 0.6156863, 1,
-0.1527587, 0.6725112, -0.1943261, 0, 1, 0.6235294, 1,
-0.1507545, 0.126059, -0.1060497, 0, 1, 0.627451, 1,
-0.1412848, 0.5060757, -2.103187, 0, 1, 0.6352941, 1,
-0.1401401, -0.2396453, -1.2592, 0, 1, 0.6392157, 1,
-0.1377031, -0.4839225, -4.638956, 0, 1, 0.6470588, 1,
-0.1359073, 1.095963, -0.06370046, 0, 1, 0.6509804, 1,
-0.1349433, -0.5521877, -2.418007, 0, 1, 0.6588235, 1,
-0.1337552, -2.273573, -3.187135, 0, 1, 0.6627451, 1,
-0.1300641, 1.733971, 0.5160248, 0, 1, 0.6705883, 1,
-0.125808, -0.6516753, -3.128062, 0, 1, 0.6745098, 1,
-0.1233864, 1.306895, -1.301493, 0, 1, 0.682353, 1,
-0.1225789, -0.2995553, -3.386138, 0, 1, 0.6862745, 1,
-0.122079, -0.9291292, -3.356467, 0, 1, 0.6941177, 1,
-0.1208317, -0.04739714, -2.857944, 0, 1, 0.7019608, 1,
-0.1200576, 0.3133703, -0.02321167, 0, 1, 0.7058824, 1,
-0.1179745, -0.08524469, -2.72139, 0, 1, 0.7137255, 1,
-0.1167352, -0.5541061, -3.568978, 0, 1, 0.7176471, 1,
-0.1136889, 0.4831428, -2.164227, 0, 1, 0.7254902, 1,
-0.1067445, 0.6584051, 0.228395, 0, 1, 0.7294118, 1,
-0.1066163, 0.4426109, -2.888534, 0, 1, 0.7372549, 1,
-0.1066001, 0.4829914, 0.4355272, 0, 1, 0.7411765, 1,
-0.1047225, 0.29733, 1.561762, 0, 1, 0.7490196, 1,
-0.1021969, 0.563606, -0.3825112, 0, 1, 0.7529412, 1,
-0.09897229, 1.56657, -0.7246364, 0, 1, 0.7607843, 1,
-0.09882102, -2.79731, -4.178434, 0, 1, 0.7647059, 1,
-0.09780331, 0.5333256, -1.448146, 0, 1, 0.772549, 1,
-0.09455406, -0.7336776, -3.332824, 0, 1, 0.7764706, 1,
-0.09101259, -0.1787286, -2.090184, 0, 1, 0.7843137, 1,
-0.08861821, 1.657555, 0.9871642, 0, 1, 0.7882353, 1,
-0.08514084, 0.4354097, 1.02214, 0, 1, 0.7960784, 1,
-0.08305515, -0.5430228, -1.553023, 0, 1, 0.8039216, 1,
-0.08180833, -0.1849788, -3.976883, 0, 1, 0.8078431, 1,
-0.07511623, 0.545189, -0.1838681, 0, 1, 0.8156863, 1,
-0.07479549, 0.7138261, 0.4616736, 0, 1, 0.8196079, 1,
-0.07418703, 1.568762, 2.073281, 0, 1, 0.827451, 1,
-0.07349236, 1.487749, -0.07625937, 0, 1, 0.8313726, 1,
-0.0722237, -0.4281307, -1.870198, 0, 1, 0.8392157, 1,
-0.07045846, -0.3797569, -1.043133, 0, 1, 0.8431373, 1,
-0.06825799, 0.5145827, -0.3863469, 0, 1, 0.8509804, 1,
-0.06618378, -0.7881452, -3.513716, 0, 1, 0.854902, 1,
-0.06596804, -0.5836889, -2.177286, 0, 1, 0.8627451, 1,
-0.06441364, -0.2086532, -3.107472, 0, 1, 0.8666667, 1,
-0.05965123, 0.9970136, 1.659059, 0, 1, 0.8745098, 1,
-0.05731512, -0.2076484, -2.265052, 0, 1, 0.8784314, 1,
-0.05658331, 0.949724, 1.207268, 0, 1, 0.8862745, 1,
-0.0509838, 1.126654, -1.659488, 0, 1, 0.8901961, 1,
-0.0470994, -0.3685549, -3.784063, 0, 1, 0.8980392, 1,
-0.0383315, -2.633086, -5.424556, 0, 1, 0.9058824, 1,
-0.03481852, 0.6119341, 2.025712, 0, 1, 0.9098039, 1,
-0.02612065, 0.114826, 0.6681907, 0, 1, 0.9176471, 1,
-0.02551024, -0.3010586, -2.265688, 0, 1, 0.9215686, 1,
-0.02199114, -2.145718, -3.052533, 0, 1, 0.9294118, 1,
-0.02136759, -0.08573958, -2.942478, 0, 1, 0.9333333, 1,
-0.01868943, -0.2415305, -2.645161, 0, 1, 0.9411765, 1,
-0.01701682, 2.660629, 0.4764251, 0, 1, 0.945098, 1,
-0.0008604567, -0.02144546, -2.820708, 0, 1, 0.9529412, 1,
0.0001190495, 0.4816394, -0.01386337, 0, 1, 0.9568627, 1,
0.001169238, -0.8677862, 2.057844, 0, 1, 0.9647059, 1,
0.002034891, 2.058587, -0.7147878, 0, 1, 0.9686275, 1,
0.002863919, -0.9464641, 3.286611, 0, 1, 0.9764706, 1,
0.00618626, 0.7074019, 0.9891208, 0, 1, 0.9803922, 1,
0.01280629, 1.009209, 0.3681972, 0, 1, 0.9882353, 1,
0.02787349, -0.6050659, 2.604929, 0, 1, 0.9921569, 1,
0.03643391, -1.241967, 3.793568, 0, 1, 1, 1,
0.03870885, -0.6692947, 4.410175, 0, 0.9921569, 1, 1,
0.03891326, -0.3221332, 1.900291, 0, 0.9882353, 1, 1,
0.04044227, -0.02436665, 2.165326, 0, 0.9803922, 1, 1,
0.04447718, -0.1294067, 3.122815, 0, 0.9764706, 1, 1,
0.04479772, -0.1650158, 2.327451, 0, 0.9686275, 1, 1,
0.04739811, -0.9847025, 3.382216, 0, 0.9647059, 1, 1,
0.05356119, 2.244019, -0.5940208, 0, 0.9568627, 1, 1,
0.05366397, -0.7281167, 4.765262, 0, 0.9529412, 1, 1,
0.0565826, -1.140889, 2.344847, 0, 0.945098, 1, 1,
0.05785912, -0.7884055, 3.82293, 0, 0.9411765, 1, 1,
0.05804897, 1.291133, 0.4465667, 0, 0.9333333, 1, 1,
0.05963324, 0.4197723, -0.6886662, 0, 0.9294118, 1, 1,
0.05992873, 0.4744119, 0.362826, 0, 0.9215686, 1, 1,
0.06393345, 0.02296115, -0.1040194, 0, 0.9176471, 1, 1,
0.06596167, 1.137893, -1.493706, 0, 0.9098039, 1, 1,
0.06694248, -0.9346101, 3.987895, 0, 0.9058824, 1, 1,
0.06972649, 0.9084611, 0.3440207, 0, 0.8980392, 1, 1,
0.07385624, 2.641003, 0.2273362, 0, 0.8901961, 1, 1,
0.07605582, -1.922744, 2.947119, 0, 0.8862745, 1, 1,
0.07830612, -0.2994884, 1.855892, 0, 0.8784314, 1, 1,
0.08600093, 2.492585, -0.5981022, 0, 0.8745098, 1, 1,
0.08683091, 0.2383993, 0.1606005, 0, 0.8666667, 1, 1,
0.09044301, -0.5284626, 3.951936, 0, 0.8627451, 1, 1,
0.09320147, -0.2237466, 1.19983, 0, 0.854902, 1, 1,
0.09446636, -0.85475, 4.69048, 0, 0.8509804, 1, 1,
0.0960597, -1.231845, 3.510706, 0, 0.8431373, 1, 1,
0.1025175, -0.4574361, 1.891301, 0, 0.8392157, 1, 1,
0.1026898, -0.9284855, 3.068803, 0, 0.8313726, 1, 1,
0.1035917, -1.081351, 3.969509, 0, 0.827451, 1, 1,
0.1042224, -0.9117068, 3.14458, 0, 0.8196079, 1, 1,
0.1045615, 0.9828047, -0.8943509, 0, 0.8156863, 1, 1,
0.1076909, -0.7396418, 2.549816, 0, 0.8078431, 1, 1,
0.1098938, 0.9088064, 1.717296, 0, 0.8039216, 1, 1,
0.1146708, -1.708957, 3.339114, 0, 0.7960784, 1, 1,
0.1157017, -0.07108752, 2.286384, 0, 0.7882353, 1, 1,
0.1241615, 0.3108001, -0.1912443, 0, 0.7843137, 1, 1,
0.1242047, -0.2375336, 1.925978, 0, 0.7764706, 1, 1,
0.1250726, -0.782679, 4.272183, 0, 0.772549, 1, 1,
0.1254102, 0.4004162, 0.1412219, 0, 0.7647059, 1, 1,
0.1322708, 0.1118165, 1.497641, 0, 0.7607843, 1, 1,
0.1344131, 1.198386, -0.05614102, 0, 0.7529412, 1, 1,
0.1353394, 0.5732321, -0.7512739, 0, 0.7490196, 1, 1,
0.1355045, -0.1288997, 1.819578, 0, 0.7411765, 1, 1,
0.1363311, 0.6928025, 1.641063, 0, 0.7372549, 1, 1,
0.1409896, 1.164136, -0.4010453, 0, 0.7294118, 1, 1,
0.1454416, -0.290337, 2.928228, 0, 0.7254902, 1, 1,
0.1467686, 0.7148613, 0.3173229, 0, 0.7176471, 1, 1,
0.1475252, -0.1051778, 4.36687, 0, 0.7137255, 1, 1,
0.1537018, -1.64086, 1.984803, 0, 0.7058824, 1, 1,
0.1542439, -1.33865, 4.895343, 0, 0.6980392, 1, 1,
0.1559074, 1.378845, 3.601047, 0, 0.6941177, 1, 1,
0.1578108, -0.2290719, 2.181828, 0, 0.6862745, 1, 1,
0.1580051, 0.693195, 0.6664118, 0, 0.682353, 1, 1,
0.1586945, 1.521051, -0.5950931, 0, 0.6745098, 1, 1,
0.1591765, -0.7748616, 2.776729, 0, 0.6705883, 1, 1,
0.1600589, -0.1000922, 4.176898, 0, 0.6627451, 1, 1,
0.1602293, -0.6017313, 2.188977, 0, 0.6588235, 1, 1,
0.160764, 0.1654402, -0.7337928, 0, 0.6509804, 1, 1,
0.1695203, 0.4536583, -0.3285031, 0, 0.6470588, 1, 1,
0.1700731, 0.00282185, 1.193227, 0, 0.6392157, 1, 1,
0.1736407, 0.6058408, -0.1481004, 0, 0.6352941, 1, 1,
0.1792591, -0.7476605, 3.877004, 0, 0.627451, 1, 1,
0.1806959, 0.3215506, 0.787099, 0, 0.6235294, 1, 1,
0.1823403, 1.583234, -0.008311471, 0, 0.6156863, 1, 1,
0.1830495, 0.6503195, 0.3310552, 0, 0.6117647, 1, 1,
0.1859251, 0.616204, -0.2308481, 0, 0.6039216, 1, 1,
0.1866038, 1.496992, 0.5966895, 0, 0.5960785, 1, 1,
0.186852, -0.5250996, 2.372897, 0, 0.5921569, 1, 1,
0.1870984, -1.951697, 3.561911, 0, 0.5843138, 1, 1,
0.1873963, 0.5649766, -1.680888, 0, 0.5803922, 1, 1,
0.1899887, -0.262815, 2.433301, 0, 0.572549, 1, 1,
0.1945515, -2.004032, 2.296852, 0, 0.5686275, 1, 1,
0.1945555, -0.74023, 3.649701, 0, 0.5607843, 1, 1,
0.1957511, 1.383615, -0.4413543, 0, 0.5568628, 1, 1,
0.1979768, 0.9174322, 1.222615, 0, 0.5490196, 1, 1,
0.2063545, 1.034266, 0.5099674, 0, 0.5450981, 1, 1,
0.207072, 0.4348851, 1.62468, 0, 0.5372549, 1, 1,
0.2083511, 0.2718151, 1.056571, 0, 0.5333334, 1, 1,
0.2123633, 0.8150679, -0.1779469, 0, 0.5254902, 1, 1,
0.2151338, 0.5152628, -0.1192862, 0, 0.5215687, 1, 1,
0.2158597, 0.9873605, 2.534603, 0, 0.5137255, 1, 1,
0.2167526, 0.0298652, 1.126446, 0, 0.509804, 1, 1,
0.2227134, -1.791122, 4.545343, 0, 0.5019608, 1, 1,
0.2234409, 0.3067882, -0.8370697, 0, 0.4941176, 1, 1,
0.2254153, 0.704348, 0.08429253, 0, 0.4901961, 1, 1,
0.2264665, 0.8576965, -0.5736739, 0, 0.4823529, 1, 1,
0.2269291, 0.2908576, 0.8222474, 0, 0.4784314, 1, 1,
0.2272098, -1.372732, 3.666303, 0, 0.4705882, 1, 1,
0.2279779, -0.6419003, 3.361623, 0, 0.4666667, 1, 1,
0.2307809, 1.562202, 1.227674, 0, 0.4588235, 1, 1,
0.2313722, 0.2535718, 0.7921032, 0, 0.454902, 1, 1,
0.2314668, -1.002703, 2.828736, 0, 0.4470588, 1, 1,
0.2321259, 0.7538618, 0.003522593, 0, 0.4431373, 1, 1,
0.2345493, 0.2220501, 1.795375, 0, 0.4352941, 1, 1,
0.2352132, 0.977652, -0.5469707, 0, 0.4313726, 1, 1,
0.2456096, 0.9438151, -0.4127099, 0, 0.4235294, 1, 1,
0.2516331, -0.2985511, -0.2421173, 0, 0.4196078, 1, 1,
0.2547114, -2.669007, 2.103409, 0, 0.4117647, 1, 1,
0.255799, -1.261267, 1.302568, 0, 0.4078431, 1, 1,
0.2574974, -3.458287, 4.223193, 0, 0.4, 1, 1,
0.2585043, -0.1968256, 2.576623, 0, 0.3921569, 1, 1,
0.2586405, -0.9288427, 2.631724, 0, 0.3882353, 1, 1,
0.2678587, 1.037828, 0.2114519, 0, 0.3803922, 1, 1,
0.2774649, 0.4867155, 1.69097, 0, 0.3764706, 1, 1,
0.2826591, 0.2438643, 1.08163, 0, 0.3686275, 1, 1,
0.2831936, 1.340609, 1.031919, 0, 0.3647059, 1, 1,
0.2840489, 0.8979824, 2.387615, 0, 0.3568628, 1, 1,
0.2855628, -0.5921957, 4.026179, 0, 0.3529412, 1, 1,
0.2887739, 0.05844281, 1.475706, 0, 0.345098, 1, 1,
0.2897092, -0.6288722, 4.646657, 0, 0.3411765, 1, 1,
0.2903393, -0.7861785, 2.205381, 0, 0.3333333, 1, 1,
0.2906598, 0.5737534, 0.133094, 0, 0.3294118, 1, 1,
0.2959217, 0.8901026, -0.3164692, 0, 0.3215686, 1, 1,
0.3043744, 1.933413, -0.6113808, 0, 0.3176471, 1, 1,
0.3049794, -0.9006234, 3.558285, 0, 0.3098039, 1, 1,
0.3053465, -0.8034979, 2.941524, 0, 0.3058824, 1, 1,
0.3063958, 0.2568159, 2.723774, 0, 0.2980392, 1, 1,
0.3213196, 1.640807, -1.029789, 0, 0.2901961, 1, 1,
0.3264252, -0.2485296, 1.199474, 0, 0.2862745, 1, 1,
0.3283864, 0.5935143, -1.818773, 0, 0.2784314, 1, 1,
0.3287021, 1.153917, 1.042484, 0, 0.2745098, 1, 1,
0.3294052, 0.5881551, 2.160917, 0, 0.2666667, 1, 1,
0.3296754, 0.285686, 0.422311, 0, 0.2627451, 1, 1,
0.334509, 0.566584, 1.71754, 0, 0.254902, 1, 1,
0.3387117, 0.06684446, 3.132073, 0, 0.2509804, 1, 1,
0.3398987, 0.4148741, 0.7646797, 0, 0.2431373, 1, 1,
0.3606941, 1.043436, -0.4726234, 0, 0.2392157, 1, 1,
0.3635609, 1.4161, 0.9277677, 0, 0.2313726, 1, 1,
0.3672493, 0.08374722, 0.4443949, 0, 0.227451, 1, 1,
0.3701984, 1.057175, -0.02667581, 0, 0.2196078, 1, 1,
0.3703963, 0.2080114, 1.809455, 0, 0.2156863, 1, 1,
0.3714644, 0.0668368, 4.924214, 0, 0.2078431, 1, 1,
0.3716527, -0.2215537, 2.089566, 0, 0.2039216, 1, 1,
0.3795829, -0.6631293, 1.508387, 0, 0.1960784, 1, 1,
0.3853922, 0.2479477, 0.7741149, 0, 0.1882353, 1, 1,
0.3871531, 0.5365598, 0.1953736, 0, 0.1843137, 1, 1,
0.3888507, 0.1250398, 1.886066, 0, 0.1764706, 1, 1,
0.3910147, -0.4831586, 2.597616, 0, 0.172549, 1, 1,
0.3963485, 0.3273158, -0.07324232, 0, 0.1647059, 1, 1,
0.396698, -1.059302, 2.142391, 0, 0.1607843, 1, 1,
0.4020044, 0.4211919, 1.365643, 0, 0.1529412, 1, 1,
0.4030066, 0.6739665, 0.5873368, 0, 0.1490196, 1, 1,
0.4148403, 0.3247015, 1.25695, 0, 0.1411765, 1, 1,
0.4158685, 0.3985945, -0.1018515, 0, 0.1372549, 1, 1,
0.4180457, 1.06457, -0.3979881, 0, 0.1294118, 1, 1,
0.4187678, -0.667042, 3.182327, 0, 0.1254902, 1, 1,
0.4265808, -0.2681729, 2.034123, 0, 0.1176471, 1, 1,
0.4296203, 2.558463, 0.8336605, 0, 0.1137255, 1, 1,
0.4315257, -0.2665321, 1.74328, 0, 0.1058824, 1, 1,
0.4316076, -0.169937, 5.003242, 0, 0.09803922, 1, 1,
0.4331214, 1.632501, -0.5552478, 0, 0.09411765, 1, 1,
0.4343925, 0.7004163, 2.385912, 0, 0.08627451, 1, 1,
0.4351715, 0.6394342, 1.821897, 0, 0.08235294, 1, 1,
0.4418859, -0.567827, 3.116144, 0, 0.07450981, 1, 1,
0.4477786, -0.4700234, 1.266283, 0, 0.07058824, 1, 1,
0.4516532, 1.210034, -1.852462, 0, 0.0627451, 1, 1,
0.4562626, -0.5643252, 3.025661, 0, 0.05882353, 1, 1,
0.4574501, 0.6151066, 0.2527271, 0, 0.05098039, 1, 1,
0.4584849, -1.580343, 2.811291, 0, 0.04705882, 1, 1,
0.4660924, -1.776356, 2.409876, 0, 0.03921569, 1, 1,
0.4670535, 0.5744627, 0.703822, 0, 0.03529412, 1, 1,
0.4688047, -0.3591942, 1.833382, 0, 0.02745098, 1, 1,
0.4694996, 1.208039, 0.7468693, 0, 0.02352941, 1, 1,
0.4719763, 0.4836662, 0.6336415, 0, 0.01568628, 1, 1,
0.4773533, 1.470651, 0.1669155, 0, 0.01176471, 1, 1,
0.4821782, -0.5138965, 2.084889, 0, 0.003921569, 1, 1,
0.4856815, 0.8291873, -1.318814, 0.003921569, 0, 1, 1,
0.4904522, 0.9906035, 0.989897, 0.007843138, 0, 1, 1,
0.4916489, 0.6917688, 0.9915237, 0.01568628, 0, 1, 1,
0.4965692, -1.048146, 1.301827, 0.01960784, 0, 1, 1,
0.4981936, -2.550514, 1.117017, 0.02745098, 0, 1, 1,
0.4983529, -1.540137, 3.873091, 0.03137255, 0, 1, 1,
0.4997964, 0.1277087, 0.6062201, 0.03921569, 0, 1, 1,
0.5052416, 0.7282943, -1.157627, 0.04313726, 0, 1, 1,
0.5093617, 0.9225286, 0.4115982, 0.05098039, 0, 1, 1,
0.5166969, -0.1809197, -1.49476, 0.05490196, 0, 1, 1,
0.5181695, -1.459942, 0.6452867, 0.0627451, 0, 1, 1,
0.519808, -1.585401, 3.042931, 0.06666667, 0, 1, 1,
0.5198308, 0.5649922, 0.3738583, 0.07450981, 0, 1, 1,
0.5202992, -0.4540436, 1.296789, 0.07843138, 0, 1, 1,
0.5204579, 0.122083, 0.5853949, 0.08627451, 0, 1, 1,
0.5213001, -0.1818516, 2.255848, 0.09019608, 0, 1, 1,
0.5245594, -1.475918, 3.091055, 0.09803922, 0, 1, 1,
0.5257056, -0.2736542, 3.216887, 0.1058824, 0, 1, 1,
0.5298564, 0.3380403, 1.144219, 0.1098039, 0, 1, 1,
0.5300455, 1.489482, 2.145197, 0.1176471, 0, 1, 1,
0.5309387, -1.416689, 2.126884, 0.1215686, 0, 1, 1,
0.5420453, -2.004763, 1.504057, 0.1294118, 0, 1, 1,
0.5452716, -0.2763799, 1.669989, 0.1333333, 0, 1, 1,
0.5453227, -0.9793595, 3.438649, 0.1411765, 0, 1, 1,
0.5492857, -0.07050355, 1.684331, 0.145098, 0, 1, 1,
0.5536667, 2.054582, -1.316745, 0.1529412, 0, 1, 1,
0.5601705, 1.331081, -1.941903, 0.1568628, 0, 1, 1,
0.5603094, -0.1043791, 0.6605594, 0.1647059, 0, 1, 1,
0.5610942, -0.07034902, 0.8028179, 0.1686275, 0, 1, 1,
0.5663314, -0.9375295, 2.845021, 0.1764706, 0, 1, 1,
0.5678272, -1.272487, 1.320747, 0.1803922, 0, 1, 1,
0.5683039, 0.09208239, 0.01612092, 0.1882353, 0, 1, 1,
0.5703024, -0.9580869, 3.60723, 0.1921569, 0, 1, 1,
0.5798044, 0.157361, 1.515348, 0.2, 0, 1, 1,
0.5810693, 1.898709, 2.344005, 0.2078431, 0, 1, 1,
0.5823944, 0.9518648, 1.887178, 0.2117647, 0, 1, 1,
0.5827252, -0.2449041, 1.830441, 0.2196078, 0, 1, 1,
0.5830026, 0.7312366, 1.337728, 0.2235294, 0, 1, 1,
0.5830851, -0.08751769, 1.676381, 0.2313726, 0, 1, 1,
0.6007816, -0.2921623, 3.693645, 0.2352941, 0, 1, 1,
0.6016869, -1.326226, 1.696793, 0.2431373, 0, 1, 1,
0.6078209, -0.8757465, 2.200072, 0.2470588, 0, 1, 1,
0.6140298, -1.128673, 3.637101, 0.254902, 0, 1, 1,
0.6158623, 1.003321, 1.356828, 0.2588235, 0, 1, 1,
0.6182299, -1.18367, 1.807749, 0.2666667, 0, 1, 1,
0.6209865, -0.6573962, 2.225893, 0.2705882, 0, 1, 1,
0.6224498, -0.5678726, 2.473886, 0.2784314, 0, 1, 1,
0.62468, 0.6615981, 0.6713521, 0.282353, 0, 1, 1,
0.6248041, 0.2911054, -0.9103637, 0.2901961, 0, 1, 1,
0.6268495, 0.9691251, -0.2195799, 0.2941177, 0, 1, 1,
0.627229, 0.2444541, -0.5153148, 0.3019608, 0, 1, 1,
0.6338751, -2.343806, 2.583019, 0.3098039, 0, 1, 1,
0.638341, 0.967317, 0.2362784, 0.3137255, 0, 1, 1,
0.6459357, 1.580894, -0.07235028, 0.3215686, 0, 1, 1,
0.6467451, -0.549728, 2.826644, 0.3254902, 0, 1, 1,
0.6521183, -1.148282, 3.70121, 0.3333333, 0, 1, 1,
0.6524151, 0.5391055, 1.490653, 0.3372549, 0, 1, 1,
0.6541701, -0.5272428, 0.6059288, 0.345098, 0, 1, 1,
0.6624236, -1.390727, 2.595666, 0.3490196, 0, 1, 1,
0.6637295, 0.7100673, 1.977046, 0.3568628, 0, 1, 1,
0.6645208, -0.03982802, 2.151949, 0.3607843, 0, 1, 1,
0.664904, -1.048708, 1.798612, 0.3686275, 0, 1, 1,
0.6704693, -1.09444, 1.190693, 0.372549, 0, 1, 1,
0.6720085, 0.2608179, 1.126952, 0.3803922, 0, 1, 1,
0.6824654, 0.4950002, 0.8017339, 0.3843137, 0, 1, 1,
0.6861874, -1.128784, 2.156385, 0.3921569, 0, 1, 1,
0.6883987, 0.2975281, 2.200495, 0.3960784, 0, 1, 1,
0.6953402, -1.409373, 3.467074, 0.4039216, 0, 1, 1,
0.6959887, -0.1346364, 2.311931, 0.4117647, 0, 1, 1,
0.6968517, -1.678564, 2.796241, 0.4156863, 0, 1, 1,
0.6980935, 0.5995209, 2.449968, 0.4235294, 0, 1, 1,
0.7015066, -0.4299712, 1.95653, 0.427451, 0, 1, 1,
0.7042953, -0.6049544, 2.635779, 0.4352941, 0, 1, 1,
0.707258, -0.8849804, 4.060606, 0.4392157, 0, 1, 1,
0.7124295, -1.22275, 2.389929, 0.4470588, 0, 1, 1,
0.7216775, -1.923947, 2.121326, 0.4509804, 0, 1, 1,
0.7224048, -1.145719, 3.651662, 0.4588235, 0, 1, 1,
0.7306478, 0.1349976, 1.624973, 0.4627451, 0, 1, 1,
0.7381443, -0.3798262, 2.384825, 0.4705882, 0, 1, 1,
0.738834, 2.079647, -0.1792661, 0.4745098, 0, 1, 1,
0.7423653, -1.058774, 2.684387, 0.4823529, 0, 1, 1,
0.7524667, 2.366684, 2.525342, 0.4862745, 0, 1, 1,
0.7526839, 0.09871094, 1.788999, 0.4941176, 0, 1, 1,
0.7604527, 0.02624279, 1.67237, 0.5019608, 0, 1, 1,
0.7657233, -0.9190793, 3.721424, 0.5058824, 0, 1, 1,
0.7657238, 1.410981, 0.8852364, 0.5137255, 0, 1, 1,
0.766768, -0.8073613, 3.278387, 0.5176471, 0, 1, 1,
0.769231, -1.339102, 2.429019, 0.5254902, 0, 1, 1,
0.7726359, 0.2132723, 1.658568, 0.5294118, 0, 1, 1,
0.7771336, 0.731187, 1.161427, 0.5372549, 0, 1, 1,
0.7772622, 0.9976814, 1.125297, 0.5411765, 0, 1, 1,
0.7777396, 0.3650839, 1.99256, 0.5490196, 0, 1, 1,
0.7798692, -0.2982822, 2.001355, 0.5529412, 0, 1, 1,
0.7810178, -0.5147142, 1.775367, 0.5607843, 0, 1, 1,
0.7836415, 0.267652, 1.429721, 0.5647059, 0, 1, 1,
0.7884679, 0.4322844, -0.1810942, 0.572549, 0, 1, 1,
0.791663, 1.011681, 0.5608674, 0.5764706, 0, 1, 1,
0.795276, -0.4303865, 2.807757, 0.5843138, 0, 1, 1,
0.7960371, 0.795289, 0.5441454, 0.5882353, 0, 1, 1,
0.7980881, 0.03610735, 1.523729, 0.5960785, 0, 1, 1,
0.8012679, -0.1586648, 1.940868, 0.6039216, 0, 1, 1,
0.802075, 0.4235222, -0.8710684, 0.6078432, 0, 1, 1,
0.8021438, -0.9067367, 0.8387201, 0.6156863, 0, 1, 1,
0.8079488, -0.3734775, 1.776142, 0.6196079, 0, 1, 1,
0.8094099, -0.5829974, 1.567606, 0.627451, 0, 1, 1,
0.8135691, 0.2085978, 1.442999, 0.6313726, 0, 1, 1,
0.8176991, -1.961975, 3.356918, 0.6392157, 0, 1, 1,
0.819031, -0.6705967, 3.080581, 0.6431373, 0, 1, 1,
0.8190804, -0.4184925, 1.996836, 0.6509804, 0, 1, 1,
0.8198654, 0.3583428, 2.351925, 0.654902, 0, 1, 1,
0.822448, 0.9729028, 1.255172, 0.6627451, 0, 1, 1,
0.8232799, 2.412078, -0.4341538, 0.6666667, 0, 1, 1,
0.8243728, 1.406997, -1.586527, 0.6745098, 0, 1, 1,
0.8261266, -0.7651697, 2.341561, 0.6784314, 0, 1, 1,
0.8264252, -1.401758, 2.361881, 0.6862745, 0, 1, 1,
0.827212, 0.3293777, 2.849101, 0.6901961, 0, 1, 1,
0.8295575, 0.4249882, 0.5733513, 0.6980392, 0, 1, 1,
0.832841, -1.46553, 5.018671, 0.7058824, 0, 1, 1,
0.8346035, -0.3940983, 1.288752, 0.7098039, 0, 1, 1,
0.83508, -0.1907574, 1.933186, 0.7176471, 0, 1, 1,
0.8359449, 1.102499, -0.1360454, 0.7215686, 0, 1, 1,
0.8407304, -0.2395979, 0.1809017, 0.7294118, 0, 1, 1,
0.8416228, -0.6378623, 3.231519, 0.7333333, 0, 1, 1,
0.8425067, 1.935988, 0.5763333, 0.7411765, 0, 1, 1,
0.8462061, -0.9060691, 2.907835, 0.7450981, 0, 1, 1,
0.8504348, -2.118044, 1.9152, 0.7529412, 0, 1, 1,
0.8552027, -0.2125241, 1.33898, 0.7568628, 0, 1, 1,
0.8638958, 1.304977, 0.2880703, 0.7647059, 0, 1, 1,
0.8696241, -0.1897769, 1.975405, 0.7686275, 0, 1, 1,
0.8702712, -0.5707848, 2.081703, 0.7764706, 0, 1, 1,
0.8706404, 0.3176714, 0.3618924, 0.7803922, 0, 1, 1,
0.8735453, -1.994376, 2.471995, 0.7882353, 0, 1, 1,
0.8760009, -3.038562, 1.669206, 0.7921569, 0, 1, 1,
0.8761328, -1.893776, 1.343688, 0.8, 0, 1, 1,
0.8794121, 0.1751125, 1.783359, 0.8078431, 0, 1, 1,
0.8794906, 1.231003, -0.4865542, 0.8117647, 0, 1, 1,
0.8816103, 1.414592, 0.8635466, 0.8196079, 0, 1, 1,
0.8823807, -1.153387, 1.590298, 0.8235294, 0, 1, 1,
0.8840541, 0.7840312, 1.412106, 0.8313726, 0, 1, 1,
0.8893554, 0.1409459, -0.5069301, 0.8352941, 0, 1, 1,
0.8904033, 0.8034188, -0.4465969, 0.8431373, 0, 1, 1,
0.8950848, -0.3322996, 3.452936, 0.8470588, 0, 1, 1,
0.9010847, 1.214772, 1.14963, 0.854902, 0, 1, 1,
0.9023527, -0.693713, 2.064278, 0.8588235, 0, 1, 1,
0.9134855, -2.334254, 3.479963, 0.8666667, 0, 1, 1,
0.9177392, 0.1486922, 0.9182208, 0.8705882, 0, 1, 1,
0.9247304, -2.608647, 2.553333, 0.8784314, 0, 1, 1,
0.9271926, -0.2308225, 1.186616, 0.8823529, 0, 1, 1,
0.9327437, -0.122547, 0.7153107, 0.8901961, 0, 1, 1,
0.93717, 0.05929673, 1.529445, 0.8941177, 0, 1, 1,
0.9419695, 0.4356056, 2.037157, 0.9019608, 0, 1, 1,
0.9507592, 0.2788721, 1.2587, 0.9098039, 0, 1, 1,
0.9568292, -0.3693475, 1.668296, 0.9137255, 0, 1, 1,
0.9586942, 1.258374, 2.708829, 0.9215686, 0, 1, 1,
0.9620993, 0.8354793, 0.6599498, 0.9254902, 0, 1, 1,
0.9635126, 0.6070799, 0.9612511, 0.9333333, 0, 1, 1,
0.9745403, 0.2772389, 1.555969, 0.9372549, 0, 1, 1,
0.9785076, -0.7744922, 1.73173, 0.945098, 0, 1, 1,
0.9806847, 1.29835, 0.5180885, 0.9490196, 0, 1, 1,
0.9821743, -0.4701485, 2.299577, 0.9568627, 0, 1, 1,
0.9844983, -0.4777223, 3.172589, 0.9607843, 0, 1, 1,
0.9852867, -0.896295, 1.814524, 0.9686275, 0, 1, 1,
0.9919775, -0.181597, 1.237884, 0.972549, 0, 1, 1,
0.996007, -0.8631908, 1.278986, 0.9803922, 0, 1, 1,
0.9969482, 1.189235, 0.2802422, 0.9843137, 0, 1, 1,
1.000043, 2.235743, -0.9182892, 0.9921569, 0, 1, 1,
1.003281, 1.817821, 1.421646, 0.9960784, 0, 1, 1,
1.004318, -0.073614, 0.6966051, 1, 0, 0.9960784, 1,
1.00487, -1.005243, 1.039683, 1, 0, 0.9882353, 1,
1.010827, 1.349181, 0.5835346, 1, 0, 0.9843137, 1,
1.013411, 1.714364, 1.025752, 1, 0, 0.9764706, 1,
1.014493, 1.389116, 1.445613, 1, 0, 0.972549, 1,
1.014756, 0.3437853, 0.4638122, 1, 0, 0.9647059, 1,
1.01722, 0.5064313, 0.9191791, 1, 0, 0.9607843, 1,
1.019297, -0.7917882, 1.807279, 1, 0, 0.9529412, 1,
1.022449, 1.653773, 0.7635419, 1, 0, 0.9490196, 1,
1.038863, 1.119701, 1.30652, 1, 0, 0.9411765, 1,
1.041752, 0.3636408, 0.872559, 1, 0, 0.9372549, 1,
1.045618, 0.6446916, 0.7158889, 1, 0, 0.9294118, 1,
1.049658, -0.409497, 2.597937, 1, 0, 0.9254902, 1,
1.060961, 1.510418, 0.4344823, 1, 0, 0.9176471, 1,
1.072747, -1.567349, 2.394269, 1, 0, 0.9137255, 1,
1.076073, 0.02926148, 2.198088, 1, 0, 0.9058824, 1,
1.077867, 0.08591845, 1.510586, 1, 0, 0.9019608, 1,
1.084584, -0.4905046, 1.840869, 1, 0, 0.8941177, 1,
1.091667, -1.127116, 3.262313, 1, 0, 0.8862745, 1,
1.093061, 0.4796713, 2.016357, 1, 0, 0.8823529, 1,
1.095173, 1.094678, -1.057263, 1, 0, 0.8745098, 1,
1.111565, -0.7175822, 1.845445, 1, 0, 0.8705882, 1,
1.113029, -0.5685638, 5.068976, 1, 0, 0.8627451, 1,
1.115298, -0.4300585, 1.546056, 1, 0, 0.8588235, 1,
1.116202, -0.2689652, -0.3014088, 1, 0, 0.8509804, 1,
1.118277, -1.492514, 2.95255, 1, 0, 0.8470588, 1,
1.119258, 0.04744032, 0.7505254, 1, 0, 0.8392157, 1,
1.123694, -0.6482738, 2.670326, 1, 0, 0.8352941, 1,
1.123751, 2.073542, 1.631632, 1, 0, 0.827451, 1,
1.13222, -0.4316127, 2.218277, 1, 0, 0.8235294, 1,
1.138814, 0.315097, 2.200485, 1, 0, 0.8156863, 1,
1.139763, 0.7910053, 1.316351, 1, 0, 0.8117647, 1,
1.14358, -0.6468624, 1.286735, 1, 0, 0.8039216, 1,
1.148188, -1.49914, 1.053295, 1, 0, 0.7960784, 1,
1.154672, 0.07557561, 1.405725, 1, 0, 0.7921569, 1,
1.155767, 0.1809974, -0.3260494, 1, 0, 0.7843137, 1,
1.158272, 0.6607055, 2.344079, 1, 0, 0.7803922, 1,
1.166912, 0.1803543, 2.614236, 1, 0, 0.772549, 1,
1.167527, -0.8968977, 0.7647827, 1, 0, 0.7686275, 1,
1.172302, 1.331744, -1.793374, 1, 0, 0.7607843, 1,
1.174864, -1.367343, 1.950086, 1, 0, 0.7568628, 1,
1.178671, 0.3822905, 3.786954, 1, 0, 0.7490196, 1,
1.180307, -0.7595948, 0.6610007, 1, 0, 0.7450981, 1,
1.180637, -0.8003682, 2.123948, 1, 0, 0.7372549, 1,
1.189484, -0.260813, 4.245682, 1, 0, 0.7333333, 1,
1.194227, 1.090112, 1.029329, 1, 0, 0.7254902, 1,
1.207885, -1.561172, 2.222935, 1, 0, 0.7215686, 1,
1.212655, 0.1146011, 0.9150553, 1, 0, 0.7137255, 1,
1.219012, -1.520485, 2.895831, 1, 0, 0.7098039, 1,
1.223632, 0.8125483, 1.622059, 1, 0, 0.7019608, 1,
1.224171, -0.7415196, 1.485681, 1, 0, 0.6941177, 1,
1.232345, 0.9178293, -0.0924169, 1, 0, 0.6901961, 1,
1.237201, -0.4353629, 1.468586, 1, 0, 0.682353, 1,
1.23885, 0.2984504, 2.102, 1, 0, 0.6784314, 1,
1.241913, -0.1233225, 0.9697542, 1, 0, 0.6705883, 1,
1.243815, -0.7731705, 2.43395, 1, 0, 0.6666667, 1,
1.246087, -0.7177114, 1.784885, 1, 0, 0.6588235, 1,
1.252442, -1.040367, 3.625493, 1, 0, 0.654902, 1,
1.25457, 0.4618382, 0.6035306, 1, 0, 0.6470588, 1,
1.260408, -0.06771558, 1.51316, 1, 0, 0.6431373, 1,
1.270472, 0.2978876, 0.01966515, 1, 0, 0.6352941, 1,
1.271038, -0.104084, 1.510441, 1, 0, 0.6313726, 1,
1.275402, -1.894674, 2.731585, 1, 0, 0.6235294, 1,
1.28286, -0.07822517, 3.925451, 1, 0, 0.6196079, 1,
1.28457, -0.6210975, 2.514385, 1, 0, 0.6117647, 1,
1.285551, -1.166709, 2.338025, 1, 0, 0.6078432, 1,
1.297437, -0.8032221, 1.064076, 1, 0, 0.6, 1,
1.300506, 0.3400525, 1.939144, 1, 0, 0.5921569, 1,
1.303939, 0.5548139, 1.40342, 1, 0, 0.5882353, 1,
1.305918, 1.142024, -0.05613493, 1, 0, 0.5803922, 1,
1.307343, -1.463016, 3.221381, 1, 0, 0.5764706, 1,
1.331583, 1.983825, -0.102504, 1, 0, 0.5686275, 1,
1.334338, -0.09438989, 2.754978, 1, 0, 0.5647059, 1,
1.341664, 0.8456866, 2.02427, 1, 0, 0.5568628, 1,
1.344922, -1.723126, 4.035311, 1, 0, 0.5529412, 1,
1.359136, 0.2489956, 1.690439, 1, 0, 0.5450981, 1,
1.361317, 0.9426195, -0.7891126, 1, 0, 0.5411765, 1,
1.366886, -0.06666985, 2.305487, 1, 0, 0.5333334, 1,
1.374951, -2.00224, 2.969202, 1, 0, 0.5294118, 1,
1.376481, -0.5571628, 1.588084, 1, 0, 0.5215687, 1,
1.379179, -0.2889861, 3.162088, 1, 0, 0.5176471, 1,
1.382107, -0.8690937, 4.410728, 1, 0, 0.509804, 1,
1.382109, -0.9700892, 0.7004133, 1, 0, 0.5058824, 1,
1.386235, 0.495875, -0.1106926, 1, 0, 0.4980392, 1,
1.387019, -0.1569808, 2.365302, 1, 0, 0.4901961, 1,
1.407801, -0.1713434, 1.508936, 1, 0, 0.4862745, 1,
1.415624, -2.039353, 2.067023, 1, 0, 0.4784314, 1,
1.420147, 1.055708, 1.03672, 1, 0, 0.4745098, 1,
1.420791, 0.9256868, 0.524586, 1, 0, 0.4666667, 1,
1.426632, 0.1787962, 3.511359, 1, 0, 0.4627451, 1,
1.434873, 0.02777535, 2.442229, 1, 0, 0.454902, 1,
1.436353, -0.03349839, 0.7921319, 1, 0, 0.4509804, 1,
1.444332, -0.3193007, 2.545996, 1, 0, 0.4431373, 1,
1.445565, 0.2727491, 0.9207729, 1, 0, 0.4392157, 1,
1.457709, 1.857737, -0.3600539, 1, 0, 0.4313726, 1,
1.465856, -0.510482, 1.938897, 1, 0, 0.427451, 1,
1.479405, 0.9395747, 0.4726819, 1, 0, 0.4196078, 1,
1.48754, 0.4272326, 1.411999, 1, 0, 0.4156863, 1,
1.490312, 0.1224293, 2.588761, 1, 0, 0.4078431, 1,
1.491624, -0.279541, 1.081034, 1, 0, 0.4039216, 1,
1.493101, -0.9824977, 2.36976, 1, 0, 0.3960784, 1,
1.494158, -0.9824078, 0.5703046, 1, 0, 0.3882353, 1,
1.495627, -1.53012, 4.068557, 1, 0, 0.3843137, 1,
1.509951, -0.00906435, 2.172775, 1, 0, 0.3764706, 1,
1.512369, 1.701386, -0.4384051, 1, 0, 0.372549, 1,
1.522409, 0.006518688, 2.950238, 1, 0, 0.3647059, 1,
1.530434, -0.5733398, 2.310163, 1, 0, 0.3607843, 1,
1.543076, -0.1041812, 2.787218, 1, 0, 0.3529412, 1,
1.57218, -1.144457, 1.000263, 1, 0, 0.3490196, 1,
1.577281, -1.893718, 2.600528, 1, 0, 0.3411765, 1,
1.579195, -2.078444, 2.772593, 1, 0, 0.3372549, 1,
1.580515, -0.1223512, 1.042303, 1, 0, 0.3294118, 1,
1.582745, 0.9786729, 2.6777, 1, 0, 0.3254902, 1,
1.604156, -0.4035245, -0.8025828, 1, 0, 0.3176471, 1,
1.626327, -0.2124779, 2.970361, 1, 0, 0.3137255, 1,
1.626487, -0.7087392, 0.9671074, 1, 0, 0.3058824, 1,
1.630837, -0.08461758, 1.880522, 1, 0, 0.2980392, 1,
1.667741, 0.2898054, 0.9342489, 1, 0, 0.2941177, 1,
1.676888, 0.3500538, 1.745864, 1, 0, 0.2862745, 1,
1.688583, 0.04885649, 1.394405, 1, 0, 0.282353, 1,
1.72448, 0.1321485, 1.069164, 1, 0, 0.2745098, 1,
1.732084, -0.7764515, 2.195701, 1, 0, 0.2705882, 1,
1.733171, 0.4306661, 0.08484262, 1, 0, 0.2627451, 1,
1.73844, 1.279602, -1.339833, 1, 0, 0.2588235, 1,
1.744323, -1.347141, 1.483814, 1, 0, 0.2509804, 1,
1.747906, 1.01677, 1.128426, 1, 0, 0.2470588, 1,
1.776824, 0.06651071, 2.720359, 1, 0, 0.2392157, 1,
1.779384, 0.392985, 1.3855, 1, 0, 0.2352941, 1,
1.790109, 0.0805882, 0.7954563, 1, 0, 0.227451, 1,
1.796312, -0.7519929, 2.528282, 1, 0, 0.2235294, 1,
1.79662, -0.4603024, 1.040201, 1, 0, 0.2156863, 1,
1.80097, -0.849089, 3.488326, 1, 0, 0.2117647, 1,
1.857098, -0.4747458, 3.840445, 1, 0, 0.2039216, 1,
1.859439, 0.5781853, 1.099682, 1, 0, 0.1960784, 1,
1.86311, 0.9329256, 2.69151, 1, 0, 0.1921569, 1,
1.864537, -0.04525495, 2.24352, 1, 0, 0.1843137, 1,
1.870897, 0.2578213, 0.6719388, 1, 0, 0.1803922, 1,
1.906032, 3.041349, 1.185981, 1, 0, 0.172549, 1,
1.932867, -0.373058, -0.1522347, 1, 0, 0.1686275, 1,
1.979122, -0.5896461, 2.164428, 1, 0, 0.1607843, 1,
1.979827, -0.594457, 1.764737, 1, 0, 0.1568628, 1,
1.982983, -0.3390666, 2.912125, 1, 0, 0.1490196, 1,
2.0205, -0.4291514, 1.191236, 1, 0, 0.145098, 1,
2.042524, 0.1628977, 0.9272091, 1, 0, 0.1372549, 1,
2.061904, -0.3618045, 3.751827, 1, 0, 0.1333333, 1,
2.064107, 0.1526608, 1.347165, 1, 0, 0.1254902, 1,
2.098536, 2.07483, 1.926358, 1, 0, 0.1215686, 1,
2.149188, 0.2467351, 2.319475, 1, 0, 0.1137255, 1,
2.152601, -1.264996, 1.570619, 1, 0, 0.1098039, 1,
2.178916, -1.359791, 2.573995, 1, 0, 0.1019608, 1,
2.209276, -0.3870401, 1.040828, 1, 0, 0.09411765, 1,
2.255432, -0.08276514, 2.639904, 1, 0, 0.09019608, 1,
2.265436, 0.6184005, -0.03527622, 1, 0, 0.08235294, 1,
2.33352, -1.101256, 3.101774, 1, 0, 0.07843138, 1,
2.369875, -0.2975967, 2.332555, 1, 0, 0.07058824, 1,
2.375878, -0.4747745, 3.317124, 1, 0, 0.06666667, 1,
2.376813, 0.82606, 3.366238, 1, 0, 0.05882353, 1,
2.519526, -0.2594407, 0.1565757, 1, 0, 0.05490196, 1,
2.575607, 0.1495927, 0.4410399, 1, 0, 0.04705882, 1,
2.628517, 1.064142, 2.066355, 1, 0, 0.04313726, 1,
2.63516, -0.8857873, 2.80716, 1, 0, 0.03529412, 1,
2.670369, -2.238988, 1.515392, 1, 0, 0.03137255, 1,
2.672967, 2.137048, 0.5248201, 1, 0, 0.02352941, 1,
2.754524, -2.196046, 2.180588, 1, 0, 0.01960784, 1,
2.84599, -0.7193599, 2.298892, 1, 0, 0.01176471, 1,
2.932637, -0.5745263, 3.271821, 1, 0, 0.007843138, 1
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
-0.1235363, -4.800969, -7.796267, 0, -0.5, 0.5, 0.5,
-0.1235363, -4.800969, -7.796267, 1, -0.5, 0.5, 0.5,
-0.1235363, -4.800969, -7.796267, 1, 1.5, 0.5, 0.5,
-0.1235363, -4.800969, -7.796267, 0, 1.5, 0.5, 0.5
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
-4.215752, -0.2172351, -7.796267, 0, -0.5, 0.5, 0.5,
-4.215752, -0.2172351, -7.796267, 1, -0.5, 0.5, 0.5,
-4.215752, -0.2172351, -7.796267, 1, 1.5, 0.5, 0.5,
-4.215752, -0.2172351, -7.796267, 0, 1.5, 0.5, 0.5
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
-4.215752, -4.800969, -0.4313412, 0, -0.5, 0.5, 0.5,
-4.215752, -4.800969, -0.4313412, 1, -0.5, 0.5, 0.5,
-4.215752, -4.800969, -0.4313412, 1, 1.5, 0.5, 0.5,
-4.215752, -4.800969, -0.4313412, 0, 1.5, 0.5, 0.5
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
-3, -3.743184, -6.096668,
2, -3.743184, -6.096668,
-3, -3.743184, -6.096668,
-3, -3.919482, -6.379935,
-2, -3.743184, -6.096668,
-2, -3.919482, -6.379935,
-1, -3.743184, -6.096668,
-1, -3.919482, -6.379935,
0, -3.743184, -6.096668,
0, -3.919482, -6.379935,
1, -3.743184, -6.096668,
1, -3.919482, -6.379935,
2, -3.743184, -6.096668,
2, -3.919482, -6.379935
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
-3, -4.272076, -6.946467, 0, -0.5, 0.5, 0.5,
-3, -4.272076, -6.946467, 1, -0.5, 0.5, 0.5,
-3, -4.272076, -6.946467, 1, 1.5, 0.5, 0.5,
-3, -4.272076, -6.946467, 0, 1.5, 0.5, 0.5,
-2, -4.272076, -6.946467, 0, -0.5, 0.5, 0.5,
-2, -4.272076, -6.946467, 1, -0.5, 0.5, 0.5,
-2, -4.272076, -6.946467, 1, 1.5, 0.5, 0.5,
-2, -4.272076, -6.946467, 0, 1.5, 0.5, 0.5,
-1, -4.272076, -6.946467, 0, -0.5, 0.5, 0.5,
-1, -4.272076, -6.946467, 1, -0.5, 0.5, 0.5,
-1, -4.272076, -6.946467, 1, 1.5, 0.5, 0.5,
-1, -4.272076, -6.946467, 0, 1.5, 0.5, 0.5,
0, -4.272076, -6.946467, 0, -0.5, 0.5, 0.5,
0, -4.272076, -6.946467, 1, -0.5, 0.5, 0.5,
0, -4.272076, -6.946467, 1, 1.5, 0.5, 0.5,
0, -4.272076, -6.946467, 0, 1.5, 0.5, 0.5,
1, -4.272076, -6.946467, 0, -0.5, 0.5, 0.5,
1, -4.272076, -6.946467, 1, -0.5, 0.5, 0.5,
1, -4.272076, -6.946467, 1, 1.5, 0.5, 0.5,
1, -4.272076, -6.946467, 0, 1.5, 0.5, 0.5,
2, -4.272076, -6.946467, 0, -0.5, 0.5, 0.5,
2, -4.272076, -6.946467, 1, -0.5, 0.5, 0.5,
2, -4.272076, -6.946467, 1, 1.5, 0.5, 0.5,
2, -4.272076, -6.946467, 0, 1.5, 0.5, 0.5
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
-3.271395, -3, -6.096668,
-3.271395, 3, -6.096668,
-3.271395, -3, -6.096668,
-3.428787, -3, -6.379935,
-3.271395, -2, -6.096668,
-3.428787, -2, -6.379935,
-3.271395, -1, -6.096668,
-3.428787, -1, -6.379935,
-3.271395, 0, -6.096668,
-3.428787, 0, -6.379935,
-3.271395, 1, -6.096668,
-3.428787, 1, -6.379935,
-3.271395, 2, -6.096668,
-3.428787, 2, -6.379935,
-3.271395, 3, -6.096668,
-3.428787, 3, -6.379935
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
-3.743573, -3, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, -3, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, -3, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, -3, -6.946467, 0, 1.5, 0.5, 0.5,
-3.743573, -2, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, -2, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, -2, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, -2, -6.946467, 0, 1.5, 0.5, 0.5,
-3.743573, -1, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, -1, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, -1, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, -1, -6.946467, 0, 1.5, 0.5, 0.5,
-3.743573, 0, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, 0, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, 0, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, 0, -6.946467, 0, 1.5, 0.5, 0.5,
-3.743573, 1, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, 1, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, 1, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, 1, -6.946467, 0, 1.5, 0.5, 0.5,
-3.743573, 2, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, 2, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, 2, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, 2, -6.946467, 0, 1.5, 0.5, 0.5,
-3.743573, 3, -6.946467, 0, -0.5, 0.5, 0.5,
-3.743573, 3, -6.946467, 1, -0.5, 0.5, 0.5,
-3.743573, 3, -6.946467, 1, 1.5, 0.5, 0.5,
-3.743573, 3, -6.946467, 0, 1.5, 0.5, 0.5
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
-3.271395, -3.743184, -4,
-3.271395, -3.743184, 4,
-3.271395, -3.743184, -4,
-3.428787, -3.919482, -4,
-3.271395, -3.743184, -2,
-3.428787, -3.919482, -2,
-3.271395, -3.743184, 0,
-3.428787, -3.919482, 0,
-3.271395, -3.743184, 2,
-3.428787, -3.919482, 2,
-3.271395, -3.743184, 4,
-3.428787, -3.919482, 4
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
-3.743573, -4.272076, -4, 0, -0.5, 0.5, 0.5,
-3.743573, -4.272076, -4, 1, -0.5, 0.5, 0.5,
-3.743573, -4.272076, -4, 1, 1.5, 0.5, 0.5,
-3.743573, -4.272076, -4, 0, 1.5, 0.5, 0.5,
-3.743573, -4.272076, -2, 0, -0.5, 0.5, 0.5,
-3.743573, -4.272076, -2, 1, -0.5, 0.5, 0.5,
-3.743573, -4.272076, -2, 1, 1.5, 0.5, 0.5,
-3.743573, -4.272076, -2, 0, 1.5, 0.5, 0.5,
-3.743573, -4.272076, 0, 0, -0.5, 0.5, 0.5,
-3.743573, -4.272076, 0, 1, -0.5, 0.5, 0.5,
-3.743573, -4.272076, 0, 1, 1.5, 0.5, 0.5,
-3.743573, -4.272076, 0, 0, 1.5, 0.5, 0.5,
-3.743573, -4.272076, 2, 0, -0.5, 0.5, 0.5,
-3.743573, -4.272076, 2, 1, -0.5, 0.5, 0.5,
-3.743573, -4.272076, 2, 1, 1.5, 0.5, 0.5,
-3.743573, -4.272076, 2, 0, 1.5, 0.5, 0.5,
-3.743573, -4.272076, 4, 0, -0.5, 0.5, 0.5,
-3.743573, -4.272076, 4, 1, -0.5, 0.5, 0.5,
-3.743573, -4.272076, 4, 1, 1.5, 0.5, 0.5,
-3.743573, -4.272076, 4, 0, 1.5, 0.5, 0.5
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
-3.271395, -3.743184, -6.096668,
-3.271395, 3.308714, -6.096668,
-3.271395, -3.743184, 5.233986,
-3.271395, 3.308714, 5.233986,
-3.271395, -3.743184, -6.096668,
-3.271395, -3.743184, 5.233986,
-3.271395, 3.308714, -6.096668,
-3.271395, 3.308714, 5.233986,
-3.271395, -3.743184, -6.096668,
3.024322, -3.743184, -6.096668,
-3.271395, -3.743184, 5.233986,
3.024322, -3.743184, 5.233986,
-3.271395, 3.308714, -6.096668,
3.024322, 3.308714, -6.096668,
-3.271395, 3.308714, 5.233986,
3.024322, 3.308714, 5.233986,
3.024322, -3.743184, -6.096668,
3.024322, 3.308714, -6.096668,
3.024322, -3.743184, 5.233986,
3.024322, 3.308714, 5.233986,
3.024322, -3.743184, -6.096668,
3.024322, -3.743184, 5.233986,
3.024322, 3.308714, -6.096668,
3.024322, 3.308714, 5.233986
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
var radius = 7.879589;
var distance = 35.05718;
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
mvMatrix.translate( 0.1235363, 0.2172351, 0.4313412 );
mvMatrix.scale( 1.353232, 1.208124, 0.7519042 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05718);
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
etiolate<-read.table("etiolate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etiolate$V2
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
```

```r
y<-etiolate$V3
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
```

```r
z<-etiolate$V4
```

```
## Error in eval(expr, envir, enclos): object 'etiolate' not found
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
-3.179709, -0.8591939, -2.310748, 0, 0, 1, 1, 1,
-2.828102, 0.9112772, -1.800892, 1, 0, 0, 1, 1,
-2.725653, 0.2976973, -2.078686, 1, 0, 0, 1, 1,
-2.640931, -0.2101289, -2.156962, 1, 0, 0, 1, 1,
-2.52353, -0.1302252, -1.098592, 1, 0, 0, 1, 1,
-2.495846, -0.631629, -1.137569, 1, 0, 0, 1, 1,
-2.419656, -2.087714, -2.172303, 0, 0, 0, 1, 1,
-2.403496, 0.7988099, -2.507571, 0, 0, 0, 1, 1,
-2.324136, 1.024083, -2.87094, 0, 0, 0, 1, 1,
-2.287289, 0.2641174, -1.244548, 0, 0, 0, 1, 1,
-2.268975, 0.08094043, -3.151311, 0, 0, 0, 1, 1,
-2.199353, -1.203311, -3.45904, 0, 0, 0, 1, 1,
-2.160414, 1.148838, -1.516588, 0, 0, 0, 1, 1,
-2.147422, 0.9439897, -2.275074, 1, 1, 1, 1, 1,
-2.123055, 1.460167, -2.659564, 1, 1, 1, 1, 1,
-2.113621, -0.7706499, -0.5560744, 1, 1, 1, 1, 1,
-2.093674, -0.770417, -1.240268, 1, 1, 1, 1, 1,
-2.058682, 0.7727702, -0.8392144, 1, 1, 1, 1, 1,
-2.047653, 0.7911578, -2.700122, 1, 1, 1, 1, 1,
-2.035061, 1.726461, -0.7736077, 1, 1, 1, 1, 1,
-2.000708, -0.3447348, -3.171446, 1, 1, 1, 1, 1,
-1.99788, 1.346329, -1.037567, 1, 1, 1, 1, 1,
-1.997151, 1.251321, -1.006066, 1, 1, 1, 1, 1,
-1.97333, -0.6481114, -1.313721, 1, 1, 1, 1, 1,
-1.943015, 0.7487527, 0.1086645, 1, 1, 1, 1, 1,
-1.92461, 0.3108864, -2.872108, 1, 1, 1, 1, 1,
-1.909, -0.9358376, -2.651731, 1, 1, 1, 1, 1,
-1.90491, -0.8380064, -0.949164, 1, 1, 1, 1, 1,
-1.888059, 0.1012308, -0.5113949, 0, 0, 1, 1, 1,
-1.881019, -0.4048642, -2.011332, 1, 0, 0, 1, 1,
-1.856622, -0.3106606, -2.750451, 1, 0, 0, 1, 1,
-1.854399, -1.725502, -2.912882, 1, 0, 0, 1, 1,
-1.842662, 0.329281, -1.485432, 1, 0, 0, 1, 1,
-1.841529, 0.07532559, -1.46099, 1, 0, 0, 1, 1,
-1.818067, 0.01461564, -0.6467035, 0, 0, 0, 1, 1,
-1.812984, -0.2341926, -2.523865, 0, 0, 0, 1, 1,
-1.803988, -1.312099, -3.189324, 0, 0, 0, 1, 1,
-1.800603, 0.0104398, -2.351958, 0, 0, 0, 1, 1,
-1.787609, -0.005263168, -1.884257, 0, 0, 0, 1, 1,
-1.786277, 1.558025, -1.577953, 0, 0, 0, 1, 1,
-1.781554, -0.04895274, -3.123642, 0, 0, 0, 1, 1,
-1.776288, 1.570258, -0.4442821, 1, 1, 1, 1, 1,
-1.768997, 0.4932376, -1.182242, 1, 1, 1, 1, 1,
-1.760385, 0.6929151, -1.775444, 1, 1, 1, 1, 1,
-1.758589, -0.2610879, -2.013522, 1, 1, 1, 1, 1,
-1.754794, 0.6257436, 1.251422, 1, 1, 1, 1, 1,
-1.753675, -0.1443009, -1.218614, 1, 1, 1, 1, 1,
-1.752877, 0.3930672, -1.027175, 1, 1, 1, 1, 1,
-1.750162, 1.717921, -0.1456143, 1, 1, 1, 1, 1,
-1.746297, -0.1167254, -1.286364, 1, 1, 1, 1, 1,
-1.722677, -1.43032, -3.193187, 1, 1, 1, 1, 1,
-1.67632, -1.502699, -3.602407, 1, 1, 1, 1, 1,
-1.668133, 1.279539, -0.8079767, 1, 1, 1, 1, 1,
-1.666126, 1.699968, -2.451694, 1, 1, 1, 1, 1,
-1.665384, 0.6808965, -1.232607, 1, 1, 1, 1, 1,
-1.644248, 0.8057991, -1.687662, 1, 1, 1, 1, 1,
-1.636918, -0.5913807, -2.707212, 0, 0, 1, 1, 1,
-1.634164, -0.8843508, 0.9259748, 1, 0, 0, 1, 1,
-1.632211, 1.26601, -1.116704, 1, 0, 0, 1, 1,
-1.607915, 0.7331121, -1.981096, 1, 0, 0, 1, 1,
-1.596067, 0.6519521, -1.251089, 1, 0, 0, 1, 1,
-1.582449, 0.1031658, -1.563516, 1, 0, 0, 1, 1,
-1.577983, 1.546227, -0.0286888, 0, 0, 0, 1, 1,
-1.575563, 1.333118, -2.796515, 0, 0, 0, 1, 1,
-1.564942, 0.568828, -0.5364783, 0, 0, 0, 1, 1,
-1.548449, -1.203595, -1.627278, 0, 0, 0, 1, 1,
-1.546144, -0.7899339, -2.286615, 0, 0, 0, 1, 1,
-1.536504, -2.71071, -1.90674, 0, 0, 0, 1, 1,
-1.531364, -0.6985955, 0.1918435, 0, 0, 0, 1, 1,
-1.527038, -0.08477652, -2.264096, 1, 1, 1, 1, 1,
-1.512859, 2.035859, -1.732926, 1, 1, 1, 1, 1,
-1.501005, 1.032735, -1.526019, 1, 1, 1, 1, 1,
-1.491628, -0.4415427, -3.431542, 1, 1, 1, 1, 1,
-1.488191, -1.516797, -2.913805, 1, 1, 1, 1, 1,
-1.486956, 1.535076, -0.4236435, 1, 1, 1, 1, 1,
-1.483596, -0.709758, -2.217646, 1, 1, 1, 1, 1,
-1.482141, -0.7774023, -0.6451045, 1, 1, 1, 1, 1,
-1.467694, -0.1947961, -0.5530211, 1, 1, 1, 1, 1,
-1.450565, 0.9735991, -1.312063, 1, 1, 1, 1, 1,
-1.440976, 0.9308138, -0.2707854, 1, 1, 1, 1, 1,
-1.424025, 0.1419863, -0.4786423, 1, 1, 1, 1, 1,
-1.415775, -0.004435728, -1.811839, 1, 1, 1, 1, 1,
-1.41324, 0.371305, -1.556018, 1, 1, 1, 1, 1,
-1.399471, -0.5641113, -1.452193, 1, 1, 1, 1, 1,
-1.382632, -3.640486, -3.11943, 0, 0, 1, 1, 1,
-1.382352, 0.3343275, -2.851925, 1, 0, 0, 1, 1,
-1.378239, 0.1846366, -2.017483, 1, 0, 0, 1, 1,
-1.374119, -1.050499, -1.656994, 1, 0, 0, 1, 1,
-1.362337, 0.7478361, 0.03420746, 1, 0, 0, 1, 1,
-1.352476, -0.3152417, -3.207794, 1, 0, 0, 1, 1,
-1.35141, -0.4149257, 0.8854224, 0, 0, 0, 1, 1,
-1.347082, 1.402696, -1.358578, 0, 0, 0, 1, 1,
-1.345384, 0.553239, -2.987638, 0, 0, 0, 1, 1,
-1.34296, -1.009078, -1.176816, 0, 0, 0, 1, 1,
-1.339398, -0.9922873, -1.125509, 0, 0, 0, 1, 1,
-1.332683, 1.034408, -1.205939, 0, 0, 0, 1, 1,
-1.325971, -3.407262, -3.943342, 0, 0, 0, 1, 1,
-1.323439, -0.6496987, -2.563402, 1, 1, 1, 1, 1,
-1.315126, -0.4410493, -1.079792, 1, 1, 1, 1, 1,
-1.312968, -0.3071431, -2.484188, 1, 1, 1, 1, 1,
-1.308888, -0.9822158, -1.807517, 1, 1, 1, 1, 1,
-1.303962, -0.8300202, -2.519001, 1, 1, 1, 1, 1,
-1.28998, -0.7345783, -2.560052, 1, 1, 1, 1, 1,
-1.287223, -0.1525947, -1.394991, 1, 1, 1, 1, 1,
-1.283145, -2.27441, -2.409985, 1, 1, 1, 1, 1,
-1.279214, 1.130101, -0.08038899, 1, 1, 1, 1, 1,
-1.277584, -0.769607, -2.964344, 1, 1, 1, 1, 1,
-1.273694, -0.1336499, -0.4991601, 1, 1, 1, 1, 1,
-1.273179, -1.836489, -3.191392, 1, 1, 1, 1, 1,
-1.270395, 0.2236362, -0.8865138, 1, 1, 1, 1, 1,
-1.258022, -1.46218, -1.810585, 1, 1, 1, 1, 1,
-1.246199, 1.372015, -3.750532, 1, 1, 1, 1, 1,
-1.245952, 0.1208413, 0.07642025, 0, 0, 1, 1, 1,
-1.244091, 0.6639879, -2.338532, 1, 0, 0, 1, 1,
-1.241042, 0.1834141, -1.01264, 1, 0, 0, 1, 1,
-1.236441, 1.173744, -0.7845772, 1, 0, 0, 1, 1,
-1.22569, 2.158244, -1.716923, 1, 0, 0, 1, 1,
-1.214687, -0.41668, -0.6052729, 1, 0, 0, 1, 1,
-1.209613, -0.2363084, -1.717395, 0, 0, 0, 1, 1,
-1.209293, -0.9384244, 0.4230357, 0, 0, 0, 1, 1,
-1.200424, -1.157339, -2.585963, 0, 0, 0, 1, 1,
-1.197245, 0.4526478, -2.053438, 0, 0, 0, 1, 1,
-1.182716, -1.56043, -1.634968, 0, 0, 0, 1, 1,
-1.18178, 0.3525866, -1.08047, 0, 0, 0, 1, 1,
-1.179856, 1.090107, 0.2140549, 0, 0, 0, 1, 1,
-1.176968, 0.4856612, 0.5894639, 1, 1, 1, 1, 1,
-1.169914, 0.2863178, -1.300135, 1, 1, 1, 1, 1,
-1.164597, -1.858647, -3.656213, 1, 1, 1, 1, 1,
-1.157741, 0.9053037, -0.2636252, 1, 1, 1, 1, 1,
-1.157062, -1.730475, -3.426792, 1, 1, 1, 1, 1,
-1.155266, 0.2024371, -1.687649, 1, 1, 1, 1, 1,
-1.154213, -1.204252, -2.129039, 1, 1, 1, 1, 1,
-1.153891, -0.298607, -0.8095234, 1, 1, 1, 1, 1,
-1.153381, -1.318703, -1.746417, 1, 1, 1, 1, 1,
-1.142932, -0.2003567, -0.2669483, 1, 1, 1, 1, 1,
-1.140174, 0.4306689, 1.027791, 1, 1, 1, 1, 1,
-1.139767, -1.018721, -2.102824, 1, 1, 1, 1, 1,
-1.139441, 0.7405767, -1.273535, 1, 1, 1, 1, 1,
-1.132015, -1.027287, -3.064487, 1, 1, 1, 1, 1,
-1.125928, 0.3311433, -1.833057, 1, 1, 1, 1, 1,
-1.122018, -1.186226, -2.726717, 0, 0, 1, 1, 1,
-1.11327, -1.442817, -2.569003, 1, 0, 0, 1, 1,
-1.110882, -0.2899868, 0.04046831, 1, 0, 0, 1, 1,
-1.11044, -0.2525624, 0.3370801, 1, 0, 0, 1, 1,
-1.094355, 0.324196, -0.6771388, 1, 0, 0, 1, 1,
-1.091251, -1.040838, -3.07331, 1, 0, 0, 1, 1,
-1.089847, 0.1160421, -1.823887, 0, 0, 0, 1, 1,
-1.074198, 0.3458147, -0.3261527, 0, 0, 0, 1, 1,
-1.066677, -1.011507, -0.7253164, 0, 0, 0, 1, 1,
-1.057161, 0.5459508, -0.3902777, 0, 0, 0, 1, 1,
-1.056516, 1.636014, 0.8993226, 0, 0, 0, 1, 1,
-1.048253, 0.9925593, 0.5708523, 0, 0, 0, 1, 1,
-1.047243, 0.4430008, -0.6105661, 0, 0, 0, 1, 1,
-1.043263, 1.051494, -0.6307424, 1, 1, 1, 1, 1,
-1.040007, -1.287085, -3.037506, 1, 1, 1, 1, 1,
-1.038332, 0.4290932, -2.246328, 1, 1, 1, 1, 1,
-1.036592, 0.4959836, -1.052637, 1, 1, 1, 1, 1,
-1.036191, 0.8219328, -0.1958141, 1, 1, 1, 1, 1,
-1.031125, -1.101457, -1.891153, 1, 1, 1, 1, 1,
-1.029669, 0.6777562, -1.265913, 1, 1, 1, 1, 1,
-1.022861, 1.376076, -0.9408301, 1, 1, 1, 1, 1,
-1.021921, -0.5706724, 0.2031659, 1, 1, 1, 1, 1,
-1.02112, 0.7332611, -1.77172, 1, 1, 1, 1, 1,
-1.020676, -1.19093, -2.369982, 1, 1, 1, 1, 1,
-1.01607, 1.791898, -0.3756431, 1, 1, 1, 1, 1,
-1.015877, -1.00763, -1.552814, 1, 1, 1, 1, 1,
-1.010343, 0.2366433, -0.9596426, 1, 1, 1, 1, 1,
-1.010118, 0.1881067, -1.40202, 1, 1, 1, 1, 1,
-1.00906, 0.5140255, -3.698841, 0, 0, 1, 1, 1,
-1.004718, 0.9346571, 1.055875, 1, 0, 0, 1, 1,
-1.00338, -0.9744264, -1.949009, 1, 0, 0, 1, 1,
-0.9946249, 1.416495, -0.8667297, 1, 0, 0, 1, 1,
-0.9940132, 1.099913, -1.836553, 1, 0, 0, 1, 1,
-0.9932872, -1.825704, -3.017883, 1, 0, 0, 1, 1,
-0.9911726, 0.4428838, -0.6484978, 0, 0, 0, 1, 1,
-0.9866325, -1.040313, -1.727761, 0, 0, 0, 1, 1,
-0.9855102, 0.2598117, -1.486486, 0, 0, 0, 1, 1,
-0.9850022, -1.403647, -3.491925, 0, 0, 0, 1, 1,
-0.9833645, -1.619095, -0.9743262, 0, 0, 0, 1, 1,
-0.9804299, 0.2452029, -1.223507, 0, 0, 0, 1, 1,
-0.974346, -0.1848393, -2.490552, 0, 0, 0, 1, 1,
-0.9611312, 1.659825, -1.760498, 1, 1, 1, 1, 1,
-0.9536642, -1.087504, -2.599181, 1, 1, 1, 1, 1,
-0.9506097, 0.6130316, -0.9368675, 1, 1, 1, 1, 1,
-0.9480525, 0.3795989, -0.9473017, 1, 1, 1, 1, 1,
-0.9479651, 0.7781927, -0.6892818, 1, 1, 1, 1, 1,
-0.9438792, 0.2119681, -2.054032, 1, 1, 1, 1, 1,
-0.9405366, 1.879064, 0.3310002, 1, 1, 1, 1, 1,
-0.939409, -1.659377, -3.138746, 1, 1, 1, 1, 1,
-0.9343186, -1.008436, -1.017584, 1, 1, 1, 1, 1,
-0.9282598, -0.457886, -2.79366, 1, 1, 1, 1, 1,
-0.9276999, 0.6926884, -0.7852244, 1, 1, 1, 1, 1,
-0.9176809, -0.171897, -0.7620316, 1, 1, 1, 1, 1,
-0.9160634, 0.2971887, -2.844602, 1, 1, 1, 1, 1,
-0.9073699, 0.5118269, 0.1776541, 1, 1, 1, 1, 1,
-0.9026259, 1.084905, -1.28072, 1, 1, 1, 1, 1,
-0.8964535, -1.322281, -2.799063, 0, 0, 1, 1, 1,
-0.8926933, 1.184855, 0.8455544, 1, 0, 0, 1, 1,
-0.8923385, 0.3532395, -0.7221587, 1, 0, 0, 1, 1,
-0.8887411, 0.1863206, -1.342616, 1, 0, 0, 1, 1,
-0.8829704, -2.135028, -3.012799, 1, 0, 0, 1, 1,
-0.8821624, -1.17279, -1.424302, 1, 0, 0, 1, 1,
-0.8814894, 0.655057, -0.007887266, 0, 0, 0, 1, 1,
-0.8803694, 0.2224533, -1.171353, 0, 0, 0, 1, 1,
-0.8773825, 1.594092, 0.2799388, 0, 0, 0, 1, 1,
-0.8772326, 1.235929, -1.832419, 0, 0, 0, 1, 1,
-0.8724367, -1.219515, -1.780229, 0, 0, 0, 1, 1,
-0.8631044, -0.965361, -2.175211, 0, 0, 0, 1, 1,
-0.8590487, -0.4610602, -2.161256, 0, 0, 0, 1, 1,
-0.8582422, -2.025199, -2.181329, 1, 1, 1, 1, 1,
-0.8556799, -1.412909, -2.189578, 1, 1, 1, 1, 1,
-0.8548579, 0.376429, -1.797788, 1, 1, 1, 1, 1,
-0.8525982, -1.018907, -2.157068, 1, 1, 1, 1, 1,
-0.8470788, -1.258559, -5.383451, 1, 1, 1, 1, 1,
-0.8461372, 0.08406334, -2.895305, 1, 1, 1, 1, 1,
-0.8445906, 2.309256, -0.5810652, 1, 1, 1, 1, 1,
-0.8381631, 0.9047302, -1.534713, 1, 1, 1, 1, 1,
-0.8236658, -0.4127883, -2.474225, 1, 1, 1, 1, 1,
-0.8210525, 1.254549, 0.289149, 1, 1, 1, 1, 1,
-0.8194917, -0.4650215, -2.187032, 1, 1, 1, 1, 1,
-0.8160409, 1.828773, -1.065368, 1, 1, 1, 1, 1,
-0.8132593, -0.8667412, -1.113891, 1, 1, 1, 1, 1,
-0.81164, -1.719317, -0.4331419, 1, 1, 1, 1, 1,
-0.8084134, 1.334132, -0.07949906, 1, 1, 1, 1, 1,
-0.8073161, 0.1305013, -1.155817, 0, 0, 1, 1, 1,
-0.8072357, 0.49696, -0.7112302, 1, 0, 0, 1, 1,
-0.8069839, 0.9581019, -0.1444052, 1, 0, 0, 1, 1,
-0.8000807, -0.3427709, -1.168914, 1, 0, 0, 1, 1,
-0.7968032, -1.353849, -2.74493, 1, 0, 0, 1, 1,
-0.7914819, 0.09835601, -0.7829893, 1, 0, 0, 1, 1,
-0.788215, -1.394605, -3.981341, 0, 0, 0, 1, 1,
-0.7856079, 0.6214944, 1.672621, 0, 0, 0, 1, 1,
-0.7840447, -1.512867, -1.427473, 0, 0, 0, 1, 1,
-0.7815105, -2.131608, -3.017295, 0, 0, 0, 1, 1,
-0.7804123, 1.127969, -0.3045606, 0, 0, 0, 1, 1,
-0.7783498, -0.6248029, -3.292221, 0, 0, 0, 1, 1,
-0.777206, -0.5715663, -2.010932, 0, 0, 0, 1, 1,
-0.7744832, -0.6492207, -1.566495, 1, 1, 1, 1, 1,
-0.7660369, -1.328968, -2.14486, 1, 1, 1, 1, 1,
-0.7644216, -1.902494, -3.697643, 1, 1, 1, 1, 1,
-0.7591922, 0.7145051, -0.2924503, 1, 1, 1, 1, 1,
-0.7579367, -0.8631175, -2.810921, 1, 1, 1, 1, 1,
-0.7574405, 0.06223743, -0.418602, 1, 1, 1, 1, 1,
-0.753948, 0.3555714, -0.1300824, 1, 1, 1, 1, 1,
-0.7502354, 0.8214294, -0.03033159, 1, 1, 1, 1, 1,
-0.7495167, -0.6178111, -2.476982, 1, 1, 1, 1, 1,
-0.7474815, -2.016487, -2.342637, 1, 1, 1, 1, 1,
-0.7445595, -1.014237, -2.517626, 1, 1, 1, 1, 1,
-0.738823, -0.3098156, -2.666883, 1, 1, 1, 1, 1,
-0.7376564, -0.05096311, -0.5698866, 1, 1, 1, 1, 1,
-0.7345253, -0.06476068, -1.729483, 1, 1, 1, 1, 1,
-0.732299, 1.253754, 0.2962724, 1, 1, 1, 1, 1,
-0.7259461, 0.8675094, -1.177064, 0, 0, 1, 1, 1,
-0.7225889, -0.4451095, -2.630997, 1, 0, 0, 1, 1,
-0.7213126, 2.247073, -0.361299, 1, 0, 0, 1, 1,
-0.711283, 0.3559113, -2.378835, 1, 0, 0, 1, 1,
-0.703542, 1.957596, -1.608703, 1, 0, 0, 1, 1,
-0.7021844, -0.1397203, -1.619159, 1, 0, 0, 1, 1,
-0.7020271, 1.530199, -1.285109, 0, 0, 0, 1, 1,
-0.6997465, -0.2039215, -2.08641, 0, 0, 0, 1, 1,
-0.6934857, -0.6245031, -1.114079, 0, 0, 0, 1, 1,
-0.6883925, 0.8881021, -0.2474376, 0, 0, 0, 1, 1,
-0.6878244, -0.1630623, -0.47337, 0, 0, 0, 1, 1,
-0.6868439, 0.1790787, -1.760476, 0, 0, 0, 1, 1,
-0.6861862, -0.3904694, -3.781282, 0, 0, 0, 1, 1,
-0.6780365, -0.9781243, -4.097746, 1, 1, 1, 1, 1,
-0.6773562, 0.6811413, -1.076678, 1, 1, 1, 1, 1,
-0.672017, -1.155146, -2.816434, 1, 1, 1, 1, 1,
-0.6687939, 0.6001789, -0.4468895, 1, 1, 1, 1, 1,
-0.6657665, 0.1968517, 0.1652565, 1, 1, 1, 1, 1,
-0.6625101, -0.4355807, -1.921382, 1, 1, 1, 1, 1,
-0.6611239, -1.022348, -1.903454, 1, 1, 1, 1, 1,
-0.6572636, -1.519223, -2.812249, 1, 1, 1, 1, 1,
-0.6570866, 1.588409, -1.046913, 1, 1, 1, 1, 1,
-0.6521453, -1.85033, -4.452112, 1, 1, 1, 1, 1,
-0.6518213, -0.4644193, -2.814916, 1, 1, 1, 1, 1,
-0.6493853, -1.558026, -2.093346, 1, 1, 1, 1, 1,
-0.6414335, 0.2864552, -1.759155, 1, 1, 1, 1, 1,
-0.6367167, 0.4231567, -1.316383, 1, 1, 1, 1, 1,
-0.6347518, 0.1304933, -1.261608, 1, 1, 1, 1, 1,
-0.6329907, -0.6790909, -1.292765, 0, 0, 1, 1, 1,
-0.6255425, 0.2611821, -0.9740207, 1, 0, 0, 1, 1,
-0.6221011, -0.4944315, -0.6985202, 1, 0, 0, 1, 1,
-0.6158951, 0.4422544, -1.152186, 1, 0, 0, 1, 1,
-0.6111357, -0.5724083, -1.830078, 1, 0, 0, 1, 1,
-0.6071912, 1.496568, 0.666263, 1, 0, 0, 1, 1,
-0.6056278, 0.9017445, -0.5568319, 0, 0, 0, 1, 1,
-0.6046579, 1.948296, 0.7714021, 0, 0, 0, 1, 1,
-0.5886959, -2.237872, -1.693377, 0, 0, 0, 1, 1,
-0.5815821, 0.8012025, -2.621989, 0, 0, 0, 1, 1,
-0.5766145, 0.09123351, -1.156914, 0, 0, 0, 1, 1,
-0.5750068, 0.6773308, -2.213736, 0, 0, 0, 1, 1,
-0.5738848, -0.3680411, -3.144564, 0, 0, 0, 1, 1,
-0.5730391, 0.8151554, -0.8593575, 1, 1, 1, 1, 1,
-0.5597209, -0.07180247, -2.54362, 1, 1, 1, 1, 1,
-0.5575001, -0.2096052, -1.625243, 1, 1, 1, 1, 1,
-0.5547514, -0.9436655, -1.248032, 1, 1, 1, 1, 1,
-0.5541772, 1.222432, -0.4289392, 1, 1, 1, 1, 1,
-0.5456139, 0.5071204, -3.312906, 1, 1, 1, 1, 1,
-0.5409436, 1.415891, -0.5802745, 1, 1, 1, 1, 1,
-0.539958, -1.851961, -3.988956, 1, 1, 1, 1, 1,
-0.5355059, -1.429901, -2.665901, 1, 1, 1, 1, 1,
-0.5289981, -0.06165961, -1.268825, 1, 1, 1, 1, 1,
-0.5269537, -0.6202101, -3.460558, 1, 1, 1, 1, 1,
-0.5260273, 2.204516, 0.4185057, 1, 1, 1, 1, 1,
-0.5252448, 1.561211, -0.07772879, 1, 1, 1, 1, 1,
-0.5217265, -0.4074647, -1.637896, 1, 1, 1, 1, 1,
-0.5195315, 1.97944, -0.5880806, 1, 1, 1, 1, 1,
-0.5189822, -0.3365869, -2.669614, 0, 0, 1, 1, 1,
-0.5189072, 1.313921, 1.24108, 1, 0, 0, 1, 1,
-0.5144419, -1.262363, -2.400386, 1, 0, 0, 1, 1,
-0.5125344, 0.1144184, -1.812404, 1, 0, 0, 1, 1,
-0.5113984, -1.678397, -4.549981, 1, 0, 0, 1, 1,
-0.4993716, 0.1664989, -2.63198, 1, 0, 0, 1, 1,
-0.4985818, -0.8081977, -3.14058, 0, 0, 0, 1, 1,
-0.4981545, -1.204506, -4.792588, 0, 0, 0, 1, 1,
-0.4979207, -1.255755, -3.157172, 0, 0, 0, 1, 1,
-0.4960972, 0.371457, -1.107157, 0, 0, 0, 1, 1,
-0.4953429, -0.3242888, -3.245788, 0, 0, 0, 1, 1,
-0.4831015, -0.3608376, -1.795874, 0, 0, 0, 1, 1,
-0.4830649, -2.085236, -3.196485, 0, 0, 0, 1, 1,
-0.4822592, -0.1477861, -1.217459, 1, 1, 1, 1, 1,
-0.4819446, 2.97173, 0.6209912, 1, 1, 1, 1, 1,
-0.4786075, -0.273581, -1.967435, 1, 1, 1, 1, 1,
-0.474913, 0.1650692, -0.8214464, 1, 1, 1, 1, 1,
-0.4720188, 1.867565, 0.7511982, 1, 1, 1, 1, 1,
-0.4710418, 2.035408, 0.8384004, 1, 1, 1, 1, 1,
-0.470984, -0.128083, -1.605037, 1, 1, 1, 1, 1,
-0.4707511, -0.241401, -2.104086, 1, 1, 1, 1, 1,
-0.4700325, -0.4788012, -3.410035, 1, 1, 1, 1, 1,
-0.4698246, 0.07034052, -0.9263861, 1, 1, 1, 1, 1,
-0.4635245, 1.480315, -0.5695888, 1, 1, 1, 1, 1,
-0.4593406, 0.5653435, -0.6138232, 1, 1, 1, 1, 1,
-0.4574876, 1.808679, 0.388209, 1, 1, 1, 1, 1,
-0.4542713, -0.6022388, -1.55472, 1, 1, 1, 1, 1,
-0.4500162, -0.1012217, -2.152732, 1, 1, 1, 1, 1,
-0.4497626, -0.1452875, -2.637059, 0, 0, 1, 1, 1,
-0.4432524, -1.853266, -1.363725, 1, 0, 0, 1, 1,
-0.4395065, -0.01647401, -2.285466, 1, 0, 0, 1, 1,
-0.4382875, 0.911932, -0.1476223, 1, 0, 0, 1, 1,
-0.4380565, -0.7737678, -5.05433, 1, 0, 0, 1, 1,
-0.4375597, 0.05247644, -1.707288, 1, 0, 0, 1, 1,
-0.4374757, 0.8935227, -0.5498423, 0, 0, 0, 1, 1,
-0.4370385, 0.139997, -4.553063, 0, 0, 0, 1, 1,
-0.4358084, 0.6893598, 1.669178, 0, 0, 0, 1, 1,
-0.419317, 1.335794, 0.04222537, 0, 0, 0, 1, 1,
-0.4190921, -1.156616, -3.603968, 0, 0, 0, 1, 1,
-0.4184944, -1.486935, -3.527869, 0, 0, 0, 1, 1,
-0.4181703, 0.1113589, -1.074362, 0, 0, 0, 1, 1,
-0.4163632, -0.8903506, -1.794258, 1, 1, 1, 1, 1,
-0.4109995, -0.1629758, -0.5079689, 1, 1, 1, 1, 1,
-0.4107293, 0.4163133, -0.6400303, 1, 1, 1, 1, 1,
-0.4041328, -0.6817328, -3.963838, 1, 1, 1, 1, 1,
-0.4031822, -0.04395621, -0.7979881, 1, 1, 1, 1, 1,
-0.4023508, 1.177114, 1.651333, 1, 1, 1, 1, 1,
-0.400987, 0.2016263, -1.507608, 1, 1, 1, 1, 1,
-0.3935924, 0.3958338, -2.68939, 1, 1, 1, 1, 1,
-0.3926312, 0.07273915, -1.254144, 1, 1, 1, 1, 1,
-0.3924848, 1.200559, -0.7861972, 1, 1, 1, 1, 1,
-0.3865645, -0.02147366, -2.227418, 1, 1, 1, 1, 1,
-0.3833947, 1.015042, -0.1226172, 1, 1, 1, 1, 1,
-0.3802134, 0.2635606, -0.4568598, 1, 1, 1, 1, 1,
-0.3771945, 3.206016, 1.398174, 1, 1, 1, 1, 1,
-0.3746134, -0.2928533, -2.313323, 1, 1, 1, 1, 1,
-0.3746032, -0.9993297, -2.972429, 0, 0, 1, 1, 1,
-0.3729541, 2.082308, -0.6474941, 1, 0, 0, 1, 1,
-0.3713441, -0.2944182, -2.612248, 1, 0, 0, 1, 1,
-0.3707476, -0.005670216, -1.517893, 1, 0, 0, 1, 1,
-0.3691079, 0.644091, 0.1974069, 1, 0, 0, 1, 1,
-0.3680364, -0.1564006, 0.08295249, 1, 0, 0, 1, 1,
-0.3652364, 0.9465883, 0.4194365, 0, 0, 0, 1, 1,
-0.364288, 2.034727, -0.7737142, 0, 0, 0, 1, 1,
-0.3619312, 0.5751256, -2.137654, 0, 0, 0, 1, 1,
-0.360848, -0.7835769, -3.175308, 0, 0, 0, 1, 1,
-0.3606449, -0.1049762, -1.949286, 0, 0, 0, 1, 1,
-0.3596572, -0.679944, -0.6342833, 0, 0, 0, 1, 1,
-0.3557065, 1.182076, 0.4045207, 0, 0, 0, 1, 1,
-0.3455576, 1.730326, -1.231652, 1, 1, 1, 1, 1,
-0.3427905, 0.2873138, -1.46218, 1, 1, 1, 1, 1,
-0.3346125, 0.4340472, -1.23527, 1, 1, 1, 1, 1,
-0.3339453, -0.5539578, -2.57672, 1, 1, 1, 1, 1,
-0.3252103, -2.455594, -0.6791835, 1, 1, 1, 1, 1,
-0.3161865, 0.7123149, -0.1056036, 1, 1, 1, 1, 1,
-0.3119228, -0.1462836, -2.768939, 1, 1, 1, 1, 1,
-0.3102745, 1.067258, 0.317866, 1, 1, 1, 1, 1,
-0.3101588, 0.7032255, -0.4794923, 1, 1, 1, 1, 1,
-0.3095556, 0.8744407, -0.5251524, 1, 1, 1, 1, 1,
-0.3057374, 0.624797, -2.044885, 1, 1, 1, 1, 1,
-0.3055062, -0.5219482, -1.599217, 1, 1, 1, 1, 1,
-0.297556, -2.093482, -3.091588, 1, 1, 1, 1, 1,
-0.2974457, 1.078165, -0.7389647, 1, 1, 1, 1, 1,
-0.2956479, 1.553083, 0.7781947, 1, 1, 1, 1, 1,
-0.2920007, -0.9276549, -4.690479, 0, 0, 1, 1, 1,
-0.2916431, 0.553525, -0.00931349, 1, 0, 0, 1, 1,
-0.2795804, 0.1139999, 0.5055676, 1, 0, 0, 1, 1,
-0.2788285, 0.9583042, 0.5339105, 1, 0, 0, 1, 1,
-0.2743461, -0.4777282, -0.5541617, 1, 0, 0, 1, 1,
-0.2694298, -2.229188, -2.15376, 1, 0, 0, 1, 1,
-0.2650461, 0.6072214, -0.7304835, 0, 0, 0, 1, 1,
-0.2545533, -0.3815967, -4.891937, 0, 0, 0, 1, 1,
-0.2541725, -0.1485762, -0.4666253, 0, 0, 0, 1, 1,
-0.2497954, 0.8345511, 0.7030998, 0, 0, 0, 1, 1,
-0.2360616, -0.4346454, -5.058877, 0, 0, 0, 1, 1,
-0.2342214, 0.4566299, -0.5857073, 0, 0, 0, 1, 1,
-0.2340834, -0.7208354, -4.293044, 0, 0, 0, 1, 1,
-0.2275883, 1.482333, 0.3438013, 1, 1, 1, 1, 1,
-0.2259416, 0.7499525, -0.9240552, 1, 1, 1, 1, 1,
-0.2183581, 1.780363, 0.2835265, 1, 1, 1, 1, 1,
-0.2180098, 0.4436468, 0.9939851, 1, 1, 1, 1, 1,
-0.2166516, -0.6546085, -2.368219, 1, 1, 1, 1, 1,
-0.2142182, 0.2854681, -1.505967, 1, 1, 1, 1, 1,
-0.2126389, -1.579254, -3.078959, 1, 1, 1, 1, 1,
-0.2109145, -0.9492607, -4.08166, 1, 1, 1, 1, 1,
-0.2101903, -0.01605361, -1.781373, 1, 1, 1, 1, 1,
-0.2047833, 0.5120763, -1.511002, 1, 1, 1, 1, 1,
-0.2023965, 0.785002, -0.6355273, 1, 1, 1, 1, 1,
-0.1972621, 0.9868695, 0.7514462, 1, 1, 1, 1, 1,
-0.1968805, -0.4188702, -2.210645, 1, 1, 1, 1, 1,
-0.194793, 0.1346451, -2.012944, 1, 1, 1, 1, 1,
-0.1857654, -1.045867, -5.931659, 1, 1, 1, 1, 1,
-0.1853363, -0.7947412, -2.476582, 0, 0, 1, 1, 1,
-0.1840167, -1.386408, -2.605785, 1, 0, 0, 1, 1,
-0.183638, 0.9341001, -0.2800165, 1, 0, 0, 1, 1,
-0.1823329, 0.8449516, 1.721703, 1, 0, 0, 1, 1,
-0.1798576, 2.44342, 1.701468, 1, 0, 0, 1, 1,
-0.1775725, 1.431735, 0.2885584, 1, 0, 0, 1, 1,
-0.1773134, 0.5048673, -0.4710761, 0, 0, 0, 1, 1,
-0.1735571, 0.630251, -0.7970785, 0, 0, 0, 1, 1,
-0.1734733, 0.4339304, -2.142379, 0, 0, 0, 1, 1,
-0.1733786, 1.271091, -1.372564, 0, 0, 0, 1, 1,
-0.1721529, 1.813241, 0.9460732, 0, 0, 0, 1, 1,
-0.1692331, 0.5288891, 0.4015855, 0, 0, 0, 1, 1,
-0.1623015, 0.7087588, -0.5807835, 0, 0, 0, 1, 1,
-0.1612107, -0.5986663, -4.265939, 1, 1, 1, 1, 1,
-0.1582672, 1.520532, 0.430688, 1, 1, 1, 1, 1,
-0.1579291, 1.21132, -1.476414, 1, 1, 1, 1, 1,
-0.1578369, -1.745019, -2.530144, 1, 1, 1, 1, 1,
-0.1527587, 0.6725112, -0.1943261, 1, 1, 1, 1, 1,
-0.1507545, 0.126059, -0.1060497, 1, 1, 1, 1, 1,
-0.1412848, 0.5060757, -2.103187, 1, 1, 1, 1, 1,
-0.1401401, -0.2396453, -1.2592, 1, 1, 1, 1, 1,
-0.1377031, -0.4839225, -4.638956, 1, 1, 1, 1, 1,
-0.1359073, 1.095963, -0.06370046, 1, 1, 1, 1, 1,
-0.1349433, -0.5521877, -2.418007, 1, 1, 1, 1, 1,
-0.1337552, -2.273573, -3.187135, 1, 1, 1, 1, 1,
-0.1300641, 1.733971, 0.5160248, 1, 1, 1, 1, 1,
-0.125808, -0.6516753, -3.128062, 1, 1, 1, 1, 1,
-0.1233864, 1.306895, -1.301493, 1, 1, 1, 1, 1,
-0.1225789, -0.2995553, -3.386138, 0, 0, 1, 1, 1,
-0.122079, -0.9291292, -3.356467, 1, 0, 0, 1, 1,
-0.1208317, -0.04739714, -2.857944, 1, 0, 0, 1, 1,
-0.1200576, 0.3133703, -0.02321167, 1, 0, 0, 1, 1,
-0.1179745, -0.08524469, -2.72139, 1, 0, 0, 1, 1,
-0.1167352, -0.5541061, -3.568978, 1, 0, 0, 1, 1,
-0.1136889, 0.4831428, -2.164227, 0, 0, 0, 1, 1,
-0.1067445, 0.6584051, 0.228395, 0, 0, 0, 1, 1,
-0.1066163, 0.4426109, -2.888534, 0, 0, 0, 1, 1,
-0.1066001, 0.4829914, 0.4355272, 0, 0, 0, 1, 1,
-0.1047225, 0.29733, 1.561762, 0, 0, 0, 1, 1,
-0.1021969, 0.563606, -0.3825112, 0, 0, 0, 1, 1,
-0.09897229, 1.56657, -0.7246364, 0, 0, 0, 1, 1,
-0.09882102, -2.79731, -4.178434, 1, 1, 1, 1, 1,
-0.09780331, 0.5333256, -1.448146, 1, 1, 1, 1, 1,
-0.09455406, -0.7336776, -3.332824, 1, 1, 1, 1, 1,
-0.09101259, -0.1787286, -2.090184, 1, 1, 1, 1, 1,
-0.08861821, 1.657555, 0.9871642, 1, 1, 1, 1, 1,
-0.08514084, 0.4354097, 1.02214, 1, 1, 1, 1, 1,
-0.08305515, -0.5430228, -1.553023, 1, 1, 1, 1, 1,
-0.08180833, -0.1849788, -3.976883, 1, 1, 1, 1, 1,
-0.07511623, 0.545189, -0.1838681, 1, 1, 1, 1, 1,
-0.07479549, 0.7138261, 0.4616736, 1, 1, 1, 1, 1,
-0.07418703, 1.568762, 2.073281, 1, 1, 1, 1, 1,
-0.07349236, 1.487749, -0.07625937, 1, 1, 1, 1, 1,
-0.0722237, -0.4281307, -1.870198, 1, 1, 1, 1, 1,
-0.07045846, -0.3797569, -1.043133, 1, 1, 1, 1, 1,
-0.06825799, 0.5145827, -0.3863469, 1, 1, 1, 1, 1,
-0.06618378, -0.7881452, -3.513716, 0, 0, 1, 1, 1,
-0.06596804, -0.5836889, -2.177286, 1, 0, 0, 1, 1,
-0.06441364, -0.2086532, -3.107472, 1, 0, 0, 1, 1,
-0.05965123, 0.9970136, 1.659059, 1, 0, 0, 1, 1,
-0.05731512, -0.2076484, -2.265052, 1, 0, 0, 1, 1,
-0.05658331, 0.949724, 1.207268, 1, 0, 0, 1, 1,
-0.0509838, 1.126654, -1.659488, 0, 0, 0, 1, 1,
-0.0470994, -0.3685549, -3.784063, 0, 0, 0, 1, 1,
-0.0383315, -2.633086, -5.424556, 0, 0, 0, 1, 1,
-0.03481852, 0.6119341, 2.025712, 0, 0, 0, 1, 1,
-0.02612065, 0.114826, 0.6681907, 0, 0, 0, 1, 1,
-0.02551024, -0.3010586, -2.265688, 0, 0, 0, 1, 1,
-0.02199114, -2.145718, -3.052533, 0, 0, 0, 1, 1,
-0.02136759, -0.08573958, -2.942478, 1, 1, 1, 1, 1,
-0.01868943, -0.2415305, -2.645161, 1, 1, 1, 1, 1,
-0.01701682, 2.660629, 0.4764251, 1, 1, 1, 1, 1,
-0.0008604567, -0.02144546, -2.820708, 1, 1, 1, 1, 1,
0.0001190495, 0.4816394, -0.01386337, 1, 1, 1, 1, 1,
0.001169238, -0.8677862, 2.057844, 1, 1, 1, 1, 1,
0.002034891, 2.058587, -0.7147878, 1, 1, 1, 1, 1,
0.002863919, -0.9464641, 3.286611, 1, 1, 1, 1, 1,
0.00618626, 0.7074019, 0.9891208, 1, 1, 1, 1, 1,
0.01280629, 1.009209, 0.3681972, 1, 1, 1, 1, 1,
0.02787349, -0.6050659, 2.604929, 1, 1, 1, 1, 1,
0.03643391, -1.241967, 3.793568, 1, 1, 1, 1, 1,
0.03870885, -0.6692947, 4.410175, 1, 1, 1, 1, 1,
0.03891326, -0.3221332, 1.900291, 1, 1, 1, 1, 1,
0.04044227, -0.02436665, 2.165326, 1, 1, 1, 1, 1,
0.04447718, -0.1294067, 3.122815, 0, 0, 1, 1, 1,
0.04479772, -0.1650158, 2.327451, 1, 0, 0, 1, 1,
0.04739811, -0.9847025, 3.382216, 1, 0, 0, 1, 1,
0.05356119, 2.244019, -0.5940208, 1, 0, 0, 1, 1,
0.05366397, -0.7281167, 4.765262, 1, 0, 0, 1, 1,
0.0565826, -1.140889, 2.344847, 1, 0, 0, 1, 1,
0.05785912, -0.7884055, 3.82293, 0, 0, 0, 1, 1,
0.05804897, 1.291133, 0.4465667, 0, 0, 0, 1, 1,
0.05963324, 0.4197723, -0.6886662, 0, 0, 0, 1, 1,
0.05992873, 0.4744119, 0.362826, 0, 0, 0, 1, 1,
0.06393345, 0.02296115, -0.1040194, 0, 0, 0, 1, 1,
0.06596167, 1.137893, -1.493706, 0, 0, 0, 1, 1,
0.06694248, -0.9346101, 3.987895, 0, 0, 0, 1, 1,
0.06972649, 0.9084611, 0.3440207, 1, 1, 1, 1, 1,
0.07385624, 2.641003, 0.2273362, 1, 1, 1, 1, 1,
0.07605582, -1.922744, 2.947119, 1, 1, 1, 1, 1,
0.07830612, -0.2994884, 1.855892, 1, 1, 1, 1, 1,
0.08600093, 2.492585, -0.5981022, 1, 1, 1, 1, 1,
0.08683091, 0.2383993, 0.1606005, 1, 1, 1, 1, 1,
0.09044301, -0.5284626, 3.951936, 1, 1, 1, 1, 1,
0.09320147, -0.2237466, 1.19983, 1, 1, 1, 1, 1,
0.09446636, -0.85475, 4.69048, 1, 1, 1, 1, 1,
0.0960597, -1.231845, 3.510706, 1, 1, 1, 1, 1,
0.1025175, -0.4574361, 1.891301, 1, 1, 1, 1, 1,
0.1026898, -0.9284855, 3.068803, 1, 1, 1, 1, 1,
0.1035917, -1.081351, 3.969509, 1, 1, 1, 1, 1,
0.1042224, -0.9117068, 3.14458, 1, 1, 1, 1, 1,
0.1045615, 0.9828047, -0.8943509, 1, 1, 1, 1, 1,
0.1076909, -0.7396418, 2.549816, 0, 0, 1, 1, 1,
0.1098938, 0.9088064, 1.717296, 1, 0, 0, 1, 1,
0.1146708, -1.708957, 3.339114, 1, 0, 0, 1, 1,
0.1157017, -0.07108752, 2.286384, 1, 0, 0, 1, 1,
0.1241615, 0.3108001, -0.1912443, 1, 0, 0, 1, 1,
0.1242047, -0.2375336, 1.925978, 1, 0, 0, 1, 1,
0.1250726, -0.782679, 4.272183, 0, 0, 0, 1, 1,
0.1254102, 0.4004162, 0.1412219, 0, 0, 0, 1, 1,
0.1322708, 0.1118165, 1.497641, 0, 0, 0, 1, 1,
0.1344131, 1.198386, -0.05614102, 0, 0, 0, 1, 1,
0.1353394, 0.5732321, -0.7512739, 0, 0, 0, 1, 1,
0.1355045, -0.1288997, 1.819578, 0, 0, 0, 1, 1,
0.1363311, 0.6928025, 1.641063, 0, 0, 0, 1, 1,
0.1409896, 1.164136, -0.4010453, 1, 1, 1, 1, 1,
0.1454416, -0.290337, 2.928228, 1, 1, 1, 1, 1,
0.1467686, 0.7148613, 0.3173229, 1, 1, 1, 1, 1,
0.1475252, -0.1051778, 4.36687, 1, 1, 1, 1, 1,
0.1537018, -1.64086, 1.984803, 1, 1, 1, 1, 1,
0.1542439, -1.33865, 4.895343, 1, 1, 1, 1, 1,
0.1559074, 1.378845, 3.601047, 1, 1, 1, 1, 1,
0.1578108, -0.2290719, 2.181828, 1, 1, 1, 1, 1,
0.1580051, 0.693195, 0.6664118, 1, 1, 1, 1, 1,
0.1586945, 1.521051, -0.5950931, 1, 1, 1, 1, 1,
0.1591765, -0.7748616, 2.776729, 1, 1, 1, 1, 1,
0.1600589, -0.1000922, 4.176898, 1, 1, 1, 1, 1,
0.1602293, -0.6017313, 2.188977, 1, 1, 1, 1, 1,
0.160764, 0.1654402, -0.7337928, 1, 1, 1, 1, 1,
0.1695203, 0.4536583, -0.3285031, 1, 1, 1, 1, 1,
0.1700731, 0.00282185, 1.193227, 0, 0, 1, 1, 1,
0.1736407, 0.6058408, -0.1481004, 1, 0, 0, 1, 1,
0.1792591, -0.7476605, 3.877004, 1, 0, 0, 1, 1,
0.1806959, 0.3215506, 0.787099, 1, 0, 0, 1, 1,
0.1823403, 1.583234, -0.008311471, 1, 0, 0, 1, 1,
0.1830495, 0.6503195, 0.3310552, 1, 0, 0, 1, 1,
0.1859251, 0.616204, -0.2308481, 0, 0, 0, 1, 1,
0.1866038, 1.496992, 0.5966895, 0, 0, 0, 1, 1,
0.186852, -0.5250996, 2.372897, 0, 0, 0, 1, 1,
0.1870984, -1.951697, 3.561911, 0, 0, 0, 1, 1,
0.1873963, 0.5649766, -1.680888, 0, 0, 0, 1, 1,
0.1899887, -0.262815, 2.433301, 0, 0, 0, 1, 1,
0.1945515, -2.004032, 2.296852, 0, 0, 0, 1, 1,
0.1945555, -0.74023, 3.649701, 1, 1, 1, 1, 1,
0.1957511, 1.383615, -0.4413543, 1, 1, 1, 1, 1,
0.1979768, 0.9174322, 1.222615, 1, 1, 1, 1, 1,
0.2063545, 1.034266, 0.5099674, 1, 1, 1, 1, 1,
0.207072, 0.4348851, 1.62468, 1, 1, 1, 1, 1,
0.2083511, 0.2718151, 1.056571, 1, 1, 1, 1, 1,
0.2123633, 0.8150679, -0.1779469, 1, 1, 1, 1, 1,
0.2151338, 0.5152628, -0.1192862, 1, 1, 1, 1, 1,
0.2158597, 0.9873605, 2.534603, 1, 1, 1, 1, 1,
0.2167526, 0.0298652, 1.126446, 1, 1, 1, 1, 1,
0.2227134, -1.791122, 4.545343, 1, 1, 1, 1, 1,
0.2234409, 0.3067882, -0.8370697, 1, 1, 1, 1, 1,
0.2254153, 0.704348, 0.08429253, 1, 1, 1, 1, 1,
0.2264665, 0.8576965, -0.5736739, 1, 1, 1, 1, 1,
0.2269291, 0.2908576, 0.8222474, 1, 1, 1, 1, 1,
0.2272098, -1.372732, 3.666303, 0, 0, 1, 1, 1,
0.2279779, -0.6419003, 3.361623, 1, 0, 0, 1, 1,
0.2307809, 1.562202, 1.227674, 1, 0, 0, 1, 1,
0.2313722, 0.2535718, 0.7921032, 1, 0, 0, 1, 1,
0.2314668, -1.002703, 2.828736, 1, 0, 0, 1, 1,
0.2321259, 0.7538618, 0.003522593, 1, 0, 0, 1, 1,
0.2345493, 0.2220501, 1.795375, 0, 0, 0, 1, 1,
0.2352132, 0.977652, -0.5469707, 0, 0, 0, 1, 1,
0.2456096, 0.9438151, -0.4127099, 0, 0, 0, 1, 1,
0.2516331, -0.2985511, -0.2421173, 0, 0, 0, 1, 1,
0.2547114, -2.669007, 2.103409, 0, 0, 0, 1, 1,
0.255799, -1.261267, 1.302568, 0, 0, 0, 1, 1,
0.2574974, -3.458287, 4.223193, 0, 0, 0, 1, 1,
0.2585043, -0.1968256, 2.576623, 1, 1, 1, 1, 1,
0.2586405, -0.9288427, 2.631724, 1, 1, 1, 1, 1,
0.2678587, 1.037828, 0.2114519, 1, 1, 1, 1, 1,
0.2774649, 0.4867155, 1.69097, 1, 1, 1, 1, 1,
0.2826591, 0.2438643, 1.08163, 1, 1, 1, 1, 1,
0.2831936, 1.340609, 1.031919, 1, 1, 1, 1, 1,
0.2840489, 0.8979824, 2.387615, 1, 1, 1, 1, 1,
0.2855628, -0.5921957, 4.026179, 1, 1, 1, 1, 1,
0.2887739, 0.05844281, 1.475706, 1, 1, 1, 1, 1,
0.2897092, -0.6288722, 4.646657, 1, 1, 1, 1, 1,
0.2903393, -0.7861785, 2.205381, 1, 1, 1, 1, 1,
0.2906598, 0.5737534, 0.133094, 1, 1, 1, 1, 1,
0.2959217, 0.8901026, -0.3164692, 1, 1, 1, 1, 1,
0.3043744, 1.933413, -0.6113808, 1, 1, 1, 1, 1,
0.3049794, -0.9006234, 3.558285, 1, 1, 1, 1, 1,
0.3053465, -0.8034979, 2.941524, 0, 0, 1, 1, 1,
0.3063958, 0.2568159, 2.723774, 1, 0, 0, 1, 1,
0.3213196, 1.640807, -1.029789, 1, 0, 0, 1, 1,
0.3264252, -0.2485296, 1.199474, 1, 0, 0, 1, 1,
0.3283864, 0.5935143, -1.818773, 1, 0, 0, 1, 1,
0.3287021, 1.153917, 1.042484, 1, 0, 0, 1, 1,
0.3294052, 0.5881551, 2.160917, 0, 0, 0, 1, 1,
0.3296754, 0.285686, 0.422311, 0, 0, 0, 1, 1,
0.334509, 0.566584, 1.71754, 0, 0, 0, 1, 1,
0.3387117, 0.06684446, 3.132073, 0, 0, 0, 1, 1,
0.3398987, 0.4148741, 0.7646797, 0, 0, 0, 1, 1,
0.3606941, 1.043436, -0.4726234, 0, 0, 0, 1, 1,
0.3635609, 1.4161, 0.9277677, 0, 0, 0, 1, 1,
0.3672493, 0.08374722, 0.4443949, 1, 1, 1, 1, 1,
0.3701984, 1.057175, -0.02667581, 1, 1, 1, 1, 1,
0.3703963, 0.2080114, 1.809455, 1, 1, 1, 1, 1,
0.3714644, 0.0668368, 4.924214, 1, 1, 1, 1, 1,
0.3716527, -0.2215537, 2.089566, 1, 1, 1, 1, 1,
0.3795829, -0.6631293, 1.508387, 1, 1, 1, 1, 1,
0.3853922, 0.2479477, 0.7741149, 1, 1, 1, 1, 1,
0.3871531, 0.5365598, 0.1953736, 1, 1, 1, 1, 1,
0.3888507, 0.1250398, 1.886066, 1, 1, 1, 1, 1,
0.3910147, -0.4831586, 2.597616, 1, 1, 1, 1, 1,
0.3963485, 0.3273158, -0.07324232, 1, 1, 1, 1, 1,
0.396698, -1.059302, 2.142391, 1, 1, 1, 1, 1,
0.4020044, 0.4211919, 1.365643, 1, 1, 1, 1, 1,
0.4030066, 0.6739665, 0.5873368, 1, 1, 1, 1, 1,
0.4148403, 0.3247015, 1.25695, 1, 1, 1, 1, 1,
0.4158685, 0.3985945, -0.1018515, 0, 0, 1, 1, 1,
0.4180457, 1.06457, -0.3979881, 1, 0, 0, 1, 1,
0.4187678, -0.667042, 3.182327, 1, 0, 0, 1, 1,
0.4265808, -0.2681729, 2.034123, 1, 0, 0, 1, 1,
0.4296203, 2.558463, 0.8336605, 1, 0, 0, 1, 1,
0.4315257, -0.2665321, 1.74328, 1, 0, 0, 1, 1,
0.4316076, -0.169937, 5.003242, 0, 0, 0, 1, 1,
0.4331214, 1.632501, -0.5552478, 0, 0, 0, 1, 1,
0.4343925, 0.7004163, 2.385912, 0, 0, 0, 1, 1,
0.4351715, 0.6394342, 1.821897, 0, 0, 0, 1, 1,
0.4418859, -0.567827, 3.116144, 0, 0, 0, 1, 1,
0.4477786, -0.4700234, 1.266283, 0, 0, 0, 1, 1,
0.4516532, 1.210034, -1.852462, 0, 0, 0, 1, 1,
0.4562626, -0.5643252, 3.025661, 1, 1, 1, 1, 1,
0.4574501, 0.6151066, 0.2527271, 1, 1, 1, 1, 1,
0.4584849, -1.580343, 2.811291, 1, 1, 1, 1, 1,
0.4660924, -1.776356, 2.409876, 1, 1, 1, 1, 1,
0.4670535, 0.5744627, 0.703822, 1, 1, 1, 1, 1,
0.4688047, -0.3591942, 1.833382, 1, 1, 1, 1, 1,
0.4694996, 1.208039, 0.7468693, 1, 1, 1, 1, 1,
0.4719763, 0.4836662, 0.6336415, 1, 1, 1, 1, 1,
0.4773533, 1.470651, 0.1669155, 1, 1, 1, 1, 1,
0.4821782, -0.5138965, 2.084889, 1, 1, 1, 1, 1,
0.4856815, 0.8291873, -1.318814, 1, 1, 1, 1, 1,
0.4904522, 0.9906035, 0.989897, 1, 1, 1, 1, 1,
0.4916489, 0.6917688, 0.9915237, 1, 1, 1, 1, 1,
0.4965692, -1.048146, 1.301827, 1, 1, 1, 1, 1,
0.4981936, -2.550514, 1.117017, 1, 1, 1, 1, 1,
0.4983529, -1.540137, 3.873091, 0, 0, 1, 1, 1,
0.4997964, 0.1277087, 0.6062201, 1, 0, 0, 1, 1,
0.5052416, 0.7282943, -1.157627, 1, 0, 0, 1, 1,
0.5093617, 0.9225286, 0.4115982, 1, 0, 0, 1, 1,
0.5166969, -0.1809197, -1.49476, 1, 0, 0, 1, 1,
0.5181695, -1.459942, 0.6452867, 1, 0, 0, 1, 1,
0.519808, -1.585401, 3.042931, 0, 0, 0, 1, 1,
0.5198308, 0.5649922, 0.3738583, 0, 0, 0, 1, 1,
0.5202992, -0.4540436, 1.296789, 0, 0, 0, 1, 1,
0.5204579, 0.122083, 0.5853949, 0, 0, 0, 1, 1,
0.5213001, -0.1818516, 2.255848, 0, 0, 0, 1, 1,
0.5245594, -1.475918, 3.091055, 0, 0, 0, 1, 1,
0.5257056, -0.2736542, 3.216887, 0, 0, 0, 1, 1,
0.5298564, 0.3380403, 1.144219, 1, 1, 1, 1, 1,
0.5300455, 1.489482, 2.145197, 1, 1, 1, 1, 1,
0.5309387, -1.416689, 2.126884, 1, 1, 1, 1, 1,
0.5420453, -2.004763, 1.504057, 1, 1, 1, 1, 1,
0.5452716, -0.2763799, 1.669989, 1, 1, 1, 1, 1,
0.5453227, -0.9793595, 3.438649, 1, 1, 1, 1, 1,
0.5492857, -0.07050355, 1.684331, 1, 1, 1, 1, 1,
0.5536667, 2.054582, -1.316745, 1, 1, 1, 1, 1,
0.5601705, 1.331081, -1.941903, 1, 1, 1, 1, 1,
0.5603094, -0.1043791, 0.6605594, 1, 1, 1, 1, 1,
0.5610942, -0.07034902, 0.8028179, 1, 1, 1, 1, 1,
0.5663314, -0.9375295, 2.845021, 1, 1, 1, 1, 1,
0.5678272, -1.272487, 1.320747, 1, 1, 1, 1, 1,
0.5683039, 0.09208239, 0.01612092, 1, 1, 1, 1, 1,
0.5703024, -0.9580869, 3.60723, 1, 1, 1, 1, 1,
0.5798044, 0.157361, 1.515348, 0, 0, 1, 1, 1,
0.5810693, 1.898709, 2.344005, 1, 0, 0, 1, 1,
0.5823944, 0.9518648, 1.887178, 1, 0, 0, 1, 1,
0.5827252, -0.2449041, 1.830441, 1, 0, 0, 1, 1,
0.5830026, 0.7312366, 1.337728, 1, 0, 0, 1, 1,
0.5830851, -0.08751769, 1.676381, 1, 0, 0, 1, 1,
0.6007816, -0.2921623, 3.693645, 0, 0, 0, 1, 1,
0.6016869, -1.326226, 1.696793, 0, 0, 0, 1, 1,
0.6078209, -0.8757465, 2.200072, 0, 0, 0, 1, 1,
0.6140298, -1.128673, 3.637101, 0, 0, 0, 1, 1,
0.6158623, 1.003321, 1.356828, 0, 0, 0, 1, 1,
0.6182299, -1.18367, 1.807749, 0, 0, 0, 1, 1,
0.6209865, -0.6573962, 2.225893, 0, 0, 0, 1, 1,
0.6224498, -0.5678726, 2.473886, 1, 1, 1, 1, 1,
0.62468, 0.6615981, 0.6713521, 1, 1, 1, 1, 1,
0.6248041, 0.2911054, -0.9103637, 1, 1, 1, 1, 1,
0.6268495, 0.9691251, -0.2195799, 1, 1, 1, 1, 1,
0.627229, 0.2444541, -0.5153148, 1, 1, 1, 1, 1,
0.6338751, -2.343806, 2.583019, 1, 1, 1, 1, 1,
0.638341, 0.967317, 0.2362784, 1, 1, 1, 1, 1,
0.6459357, 1.580894, -0.07235028, 1, 1, 1, 1, 1,
0.6467451, -0.549728, 2.826644, 1, 1, 1, 1, 1,
0.6521183, -1.148282, 3.70121, 1, 1, 1, 1, 1,
0.6524151, 0.5391055, 1.490653, 1, 1, 1, 1, 1,
0.6541701, -0.5272428, 0.6059288, 1, 1, 1, 1, 1,
0.6624236, -1.390727, 2.595666, 1, 1, 1, 1, 1,
0.6637295, 0.7100673, 1.977046, 1, 1, 1, 1, 1,
0.6645208, -0.03982802, 2.151949, 1, 1, 1, 1, 1,
0.664904, -1.048708, 1.798612, 0, 0, 1, 1, 1,
0.6704693, -1.09444, 1.190693, 1, 0, 0, 1, 1,
0.6720085, 0.2608179, 1.126952, 1, 0, 0, 1, 1,
0.6824654, 0.4950002, 0.8017339, 1, 0, 0, 1, 1,
0.6861874, -1.128784, 2.156385, 1, 0, 0, 1, 1,
0.6883987, 0.2975281, 2.200495, 1, 0, 0, 1, 1,
0.6953402, -1.409373, 3.467074, 0, 0, 0, 1, 1,
0.6959887, -0.1346364, 2.311931, 0, 0, 0, 1, 1,
0.6968517, -1.678564, 2.796241, 0, 0, 0, 1, 1,
0.6980935, 0.5995209, 2.449968, 0, 0, 0, 1, 1,
0.7015066, -0.4299712, 1.95653, 0, 0, 0, 1, 1,
0.7042953, -0.6049544, 2.635779, 0, 0, 0, 1, 1,
0.707258, -0.8849804, 4.060606, 0, 0, 0, 1, 1,
0.7124295, -1.22275, 2.389929, 1, 1, 1, 1, 1,
0.7216775, -1.923947, 2.121326, 1, 1, 1, 1, 1,
0.7224048, -1.145719, 3.651662, 1, 1, 1, 1, 1,
0.7306478, 0.1349976, 1.624973, 1, 1, 1, 1, 1,
0.7381443, -0.3798262, 2.384825, 1, 1, 1, 1, 1,
0.738834, 2.079647, -0.1792661, 1, 1, 1, 1, 1,
0.7423653, -1.058774, 2.684387, 1, 1, 1, 1, 1,
0.7524667, 2.366684, 2.525342, 1, 1, 1, 1, 1,
0.7526839, 0.09871094, 1.788999, 1, 1, 1, 1, 1,
0.7604527, 0.02624279, 1.67237, 1, 1, 1, 1, 1,
0.7657233, -0.9190793, 3.721424, 1, 1, 1, 1, 1,
0.7657238, 1.410981, 0.8852364, 1, 1, 1, 1, 1,
0.766768, -0.8073613, 3.278387, 1, 1, 1, 1, 1,
0.769231, -1.339102, 2.429019, 1, 1, 1, 1, 1,
0.7726359, 0.2132723, 1.658568, 1, 1, 1, 1, 1,
0.7771336, 0.731187, 1.161427, 0, 0, 1, 1, 1,
0.7772622, 0.9976814, 1.125297, 1, 0, 0, 1, 1,
0.7777396, 0.3650839, 1.99256, 1, 0, 0, 1, 1,
0.7798692, -0.2982822, 2.001355, 1, 0, 0, 1, 1,
0.7810178, -0.5147142, 1.775367, 1, 0, 0, 1, 1,
0.7836415, 0.267652, 1.429721, 1, 0, 0, 1, 1,
0.7884679, 0.4322844, -0.1810942, 0, 0, 0, 1, 1,
0.791663, 1.011681, 0.5608674, 0, 0, 0, 1, 1,
0.795276, -0.4303865, 2.807757, 0, 0, 0, 1, 1,
0.7960371, 0.795289, 0.5441454, 0, 0, 0, 1, 1,
0.7980881, 0.03610735, 1.523729, 0, 0, 0, 1, 1,
0.8012679, -0.1586648, 1.940868, 0, 0, 0, 1, 1,
0.802075, 0.4235222, -0.8710684, 0, 0, 0, 1, 1,
0.8021438, -0.9067367, 0.8387201, 1, 1, 1, 1, 1,
0.8079488, -0.3734775, 1.776142, 1, 1, 1, 1, 1,
0.8094099, -0.5829974, 1.567606, 1, 1, 1, 1, 1,
0.8135691, 0.2085978, 1.442999, 1, 1, 1, 1, 1,
0.8176991, -1.961975, 3.356918, 1, 1, 1, 1, 1,
0.819031, -0.6705967, 3.080581, 1, 1, 1, 1, 1,
0.8190804, -0.4184925, 1.996836, 1, 1, 1, 1, 1,
0.8198654, 0.3583428, 2.351925, 1, 1, 1, 1, 1,
0.822448, 0.9729028, 1.255172, 1, 1, 1, 1, 1,
0.8232799, 2.412078, -0.4341538, 1, 1, 1, 1, 1,
0.8243728, 1.406997, -1.586527, 1, 1, 1, 1, 1,
0.8261266, -0.7651697, 2.341561, 1, 1, 1, 1, 1,
0.8264252, -1.401758, 2.361881, 1, 1, 1, 1, 1,
0.827212, 0.3293777, 2.849101, 1, 1, 1, 1, 1,
0.8295575, 0.4249882, 0.5733513, 1, 1, 1, 1, 1,
0.832841, -1.46553, 5.018671, 0, 0, 1, 1, 1,
0.8346035, -0.3940983, 1.288752, 1, 0, 0, 1, 1,
0.83508, -0.1907574, 1.933186, 1, 0, 0, 1, 1,
0.8359449, 1.102499, -0.1360454, 1, 0, 0, 1, 1,
0.8407304, -0.2395979, 0.1809017, 1, 0, 0, 1, 1,
0.8416228, -0.6378623, 3.231519, 1, 0, 0, 1, 1,
0.8425067, 1.935988, 0.5763333, 0, 0, 0, 1, 1,
0.8462061, -0.9060691, 2.907835, 0, 0, 0, 1, 1,
0.8504348, -2.118044, 1.9152, 0, 0, 0, 1, 1,
0.8552027, -0.2125241, 1.33898, 0, 0, 0, 1, 1,
0.8638958, 1.304977, 0.2880703, 0, 0, 0, 1, 1,
0.8696241, -0.1897769, 1.975405, 0, 0, 0, 1, 1,
0.8702712, -0.5707848, 2.081703, 0, 0, 0, 1, 1,
0.8706404, 0.3176714, 0.3618924, 1, 1, 1, 1, 1,
0.8735453, -1.994376, 2.471995, 1, 1, 1, 1, 1,
0.8760009, -3.038562, 1.669206, 1, 1, 1, 1, 1,
0.8761328, -1.893776, 1.343688, 1, 1, 1, 1, 1,
0.8794121, 0.1751125, 1.783359, 1, 1, 1, 1, 1,
0.8794906, 1.231003, -0.4865542, 1, 1, 1, 1, 1,
0.8816103, 1.414592, 0.8635466, 1, 1, 1, 1, 1,
0.8823807, -1.153387, 1.590298, 1, 1, 1, 1, 1,
0.8840541, 0.7840312, 1.412106, 1, 1, 1, 1, 1,
0.8893554, 0.1409459, -0.5069301, 1, 1, 1, 1, 1,
0.8904033, 0.8034188, -0.4465969, 1, 1, 1, 1, 1,
0.8950848, -0.3322996, 3.452936, 1, 1, 1, 1, 1,
0.9010847, 1.214772, 1.14963, 1, 1, 1, 1, 1,
0.9023527, -0.693713, 2.064278, 1, 1, 1, 1, 1,
0.9134855, -2.334254, 3.479963, 1, 1, 1, 1, 1,
0.9177392, 0.1486922, 0.9182208, 0, 0, 1, 1, 1,
0.9247304, -2.608647, 2.553333, 1, 0, 0, 1, 1,
0.9271926, -0.2308225, 1.186616, 1, 0, 0, 1, 1,
0.9327437, -0.122547, 0.7153107, 1, 0, 0, 1, 1,
0.93717, 0.05929673, 1.529445, 1, 0, 0, 1, 1,
0.9419695, 0.4356056, 2.037157, 1, 0, 0, 1, 1,
0.9507592, 0.2788721, 1.2587, 0, 0, 0, 1, 1,
0.9568292, -0.3693475, 1.668296, 0, 0, 0, 1, 1,
0.9586942, 1.258374, 2.708829, 0, 0, 0, 1, 1,
0.9620993, 0.8354793, 0.6599498, 0, 0, 0, 1, 1,
0.9635126, 0.6070799, 0.9612511, 0, 0, 0, 1, 1,
0.9745403, 0.2772389, 1.555969, 0, 0, 0, 1, 1,
0.9785076, -0.7744922, 1.73173, 0, 0, 0, 1, 1,
0.9806847, 1.29835, 0.5180885, 1, 1, 1, 1, 1,
0.9821743, -0.4701485, 2.299577, 1, 1, 1, 1, 1,
0.9844983, -0.4777223, 3.172589, 1, 1, 1, 1, 1,
0.9852867, -0.896295, 1.814524, 1, 1, 1, 1, 1,
0.9919775, -0.181597, 1.237884, 1, 1, 1, 1, 1,
0.996007, -0.8631908, 1.278986, 1, 1, 1, 1, 1,
0.9969482, 1.189235, 0.2802422, 1, 1, 1, 1, 1,
1.000043, 2.235743, -0.9182892, 1, 1, 1, 1, 1,
1.003281, 1.817821, 1.421646, 1, 1, 1, 1, 1,
1.004318, -0.073614, 0.6966051, 1, 1, 1, 1, 1,
1.00487, -1.005243, 1.039683, 1, 1, 1, 1, 1,
1.010827, 1.349181, 0.5835346, 1, 1, 1, 1, 1,
1.013411, 1.714364, 1.025752, 1, 1, 1, 1, 1,
1.014493, 1.389116, 1.445613, 1, 1, 1, 1, 1,
1.014756, 0.3437853, 0.4638122, 1, 1, 1, 1, 1,
1.01722, 0.5064313, 0.9191791, 0, 0, 1, 1, 1,
1.019297, -0.7917882, 1.807279, 1, 0, 0, 1, 1,
1.022449, 1.653773, 0.7635419, 1, 0, 0, 1, 1,
1.038863, 1.119701, 1.30652, 1, 0, 0, 1, 1,
1.041752, 0.3636408, 0.872559, 1, 0, 0, 1, 1,
1.045618, 0.6446916, 0.7158889, 1, 0, 0, 1, 1,
1.049658, -0.409497, 2.597937, 0, 0, 0, 1, 1,
1.060961, 1.510418, 0.4344823, 0, 0, 0, 1, 1,
1.072747, -1.567349, 2.394269, 0, 0, 0, 1, 1,
1.076073, 0.02926148, 2.198088, 0, 0, 0, 1, 1,
1.077867, 0.08591845, 1.510586, 0, 0, 0, 1, 1,
1.084584, -0.4905046, 1.840869, 0, 0, 0, 1, 1,
1.091667, -1.127116, 3.262313, 0, 0, 0, 1, 1,
1.093061, 0.4796713, 2.016357, 1, 1, 1, 1, 1,
1.095173, 1.094678, -1.057263, 1, 1, 1, 1, 1,
1.111565, -0.7175822, 1.845445, 1, 1, 1, 1, 1,
1.113029, -0.5685638, 5.068976, 1, 1, 1, 1, 1,
1.115298, -0.4300585, 1.546056, 1, 1, 1, 1, 1,
1.116202, -0.2689652, -0.3014088, 1, 1, 1, 1, 1,
1.118277, -1.492514, 2.95255, 1, 1, 1, 1, 1,
1.119258, 0.04744032, 0.7505254, 1, 1, 1, 1, 1,
1.123694, -0.6482738, 2.670326, 1, 1, 1, 1, 1,
1.123751, 2.073542, 1.631632, 1, 1, 1, 1, 1,
1.13222, -0.4316127, 2.218277, 1, 1, 1, 1, 1,
1.138814, 0.315097, 2.200485, 1, 1, 1, 1, 1,
1.139763, 0.7910053, 1.316351, 1, 1, 1, 1, 1,
1.14358, -0.6468624, 1.286735, 1, 1, 1, 1, 1,
1.148188, -1.49914, 1.053295, 1, 1, 1, 1, 1,
1.154672, 0.07557561, 1.405725, 0, 0, 1, 1, 1,
1.155767, 0.1809974, -0.3260494, 1, 0, 0, 1, 1,
1.158272, 0.6607055, 2.344079, 1, 0, 0, 1, 1,
1.166912, 0.1803543, 2.614236, 1, 0, 0, 1, 1,
1.167527, -0.8968977, 0.7647827, 1, 0, 0, 1, 1,
1.172302, 1.331744, -1.793374, 1, 0, 0, 1, 1,
1.174864, -1.367343, 1.950086, 0, 0, 0, 1, 1,
1.178671, 0.3822905, 3.786954, 0, 0, 0, 1, 1,
1.180307, -0.7595948, 0.6610007, 0, 0, 0, 1, 1,
1.180637, -0.8003682, 2.123948, 0, 0, 0, 1, 1,
1.189484, -0.260813, 4.245682, 0, 0, 0, 1, 1,
1.194227, 1.090112, 1.029329, 0, 0, 0, 1, 1,
1.207885, -1.561172, 2.222935, 0, 0, 0, 1, 1,
1.212655, 0.1146011, 0.9150553, 1, 1, 1, 1, 1,
1.219012, -1.520485, 2.895831, 1, 1, 1, 1, 1,
1.223632, 0.8125483, 1.622059, 1, 1, 1, 1, 1,
1.224171, -0.7415196, 1.485681, 1, 1, 1, 1, 1,
1.232345, 0.9178293, -0.0924169, 1, 1, 1, 1, 1,
1.237201, -0.4353629, 1.468586, 1, 1, 1, 1, 1,
1.23885, 0.2984504, 2.102, 1, 1, 1, 1, 1,
1.241913, -0.1233225, 0.9697542, 1, 1, 1, 1, 1,
1.243815, -0.7731705, 2.43395, 1, 1, 1, 1, 1,
1.246087, -0.7177114, 1.784885, 1, 1, 1, 1, 1,
1.252442, -1.040367, 3.625493, 1, 1, 1, 1, 1,
1.25457, 0.4618382, 0.6035306, 1, 1, 1, 1, 1,
1.260408, -0.06771558, 1.51316, 1, 1, 1, 1, 1,
1.270472, 0.2978876, 0.01966515, 1, 1, 1, 1, 1,
1.271038, -0.104084, 1.510441, 1, 1, 1, 1, 1,
1.275402, -1.894674, 2.731585, 0, 0, 1, 1, 1,
1.28286, -0.07822517, 3.925451, 1, 0, 0, 1, 1,
1.28457, -0.6210975, 2.514385, 1, 0, 0, 1, 1,
1.285551, -1.166709, 2.338025, 1, 0, 0, 1, 1,
1.297437, -0.8032221, 1.064076, 1, 0, 0, 1, 1,
1.300506, 0.3400525, 1.939144, 1, 0, 0, 1, 1,
1.303939, 0.5548139, 1.40342, 0, 0, 0, 1, 1,
1.305918, 1.142024, -0.05613493, 0, 0, 0, 1, 1,
1.307343, -1.463016, 3.221381, 0, 0, 0, 1, 1,
1.331583, 1.983825, -0.102504, 0, 0, 0, 1, 1,
1.334338, -0.09438989, 2.754978, 0, 0, 0, 1, 1,
1.341664, 0.8456866, 2.02427, 0, 0, 0, 1, 1,
1.344922, -1.723126, 4.035311, 0, 0, 0, 1, 1,
1.359136, 0.2489956, 1.690439, 1, 1, 1, 1, 1,
1.361317, 0.9426195, -0.7891126, 1, 1, 1, 1, 1,
1.366886, -0.06666985, 2.305487, 1, 1, 1, 1, 1,
1.374951, -2.00224, 2.969202, 1, 1, 1, 1, 1,
1.376481, -0.5571628, 1.588084, 1, 1, 1, 1, 1,
1.379179, -0.2889861, 3.162088, 1, 1, 1, 1, 1,
1.382107, -0.8690937, 4.410728, 1, 1, 1, 1, 1,
1.382109, -0.9700892, 0.7004133, 1, 1, 1, 1, 1,
1.386235, 0.495875, -0.1106926, 1, 1, 1, 1, 1,
1.387019, -0.1569808, 2.365302, 1, 1, 1, 1, 1,
1.407801, -0.1713434, 1.508936, 1, 1, 1, 1, 1,
1.415624, -2.039353, 2.067023, 1, 1, 1, 1, 1,
1.420147, 1.055708, 1.03672, 1, 1, 1, 1, 1,
1.420791, 0.9256868, 0.524586, 1, 1, 1, 1, 1,
1.426632, 0.1787962, 3.511359, 1, 1, 1, 1, 1,
1.434873, 0.02777535, 2.442229, 0, 0, 1, 1, 1,
1.436353, -0.03349839, 0.7921319, 1, 0, 0, 1, 1,
1.444332, -0.3193007, 2.545996, 1, 0, 0, 1, 1,
1.445565, 0.2727491, 0.9207729, 1, 0, 0, 1, 1,
1.457709, 1.857737, -0.3600539, 1, 0, 0, 1, 1,
1.465856, -0.510482, 1.938897, 1, 0, 0, 1, 1,
1.479405, 0.9395747, 0.4726819, 0, 0, 0, 1, 1,
1.48754, 0.4272326, 1.411999, 0, 0, 0, 1, 1,
1.490312, 0.1224293, 2.588761, 0, 0, 0, 1, 1,
1.491624, -0.279541, 1.081034, 0, 0, 0, 1, 1,
1.493101, -0.9824977, 2.36976, 0, 0, 0, 1, 1,
1.494158, -0.9824078, 0.5703046, 0, 0, 0, 1, 1,
1.495627, -1.53012, 4.068557, 0, 0, 0, 1, 1,
1.509951, -0.00906435, 2.172775, 1, 1, 1, 1, 1,
1.512369, 1.701386, -0.4384051, 1, 1, 1, 1, 1,
1.522409, 0.006518688, 2.950238, 1, 1, 1, 1, 1,
1.530434, -0.5733398, 2.310163, 1, 1, 1, 1, 1,
1.543076, -0.1041812, 2.787218, 1, 1, 1, 1, 1,
1.57218, -1.144457, 1.000263, 1, 1, 1, 1, 1,
1.577281, -1.893718, 2.600528, 1, 1, 1, 1, 1,
1.579195, -2.078444, 2.772593, 1, 1, 1, 1, 1,
1.580515, -0.1223512, 1.042303, 1, 1, 1, 1, 1,
1.582745, 0.9786729, 2.6777, 1, 1, 1, 1, 1,
1.604156, -0.4035245, -0.8025828, 1, 1, 1, 1, 1,
1.626327, -0.2124779, 2.970361, 1, 1, 1, 1, 1,
1.626487, -0.7087392, 0.9671074, 1, 1, 1, 1, 1,
1.630837, -0.08461758, 1.880522, 1, 1, 1, 1, 1,
1.667741, 0.2898054, 0.9342489, 1, 1, 1, 1, 1,
1.676888, 0.3500538, 1.745864, 0, 0, 1, 1, 1,
1.688583, 0.04885649, 1.394405, 1, 0, 0, 1, 1,
1.72448, 0.1321485, 1.069164, 1, 0, 0, 1, 1,
1.732084, -0.7764515, 2.195701, 1, 0, 0, 1, 1,
1.733171, 0.4306661, 0.08484262, 1, 0, 0, 1, 1,
1.73844, 1.279602, -1.339833, 1, 0, 0, 1, 1,
1.744323, -1.347141, 1.483814, 0, 0, 0, 1, 1,
1.747906, 1.01677, 1.128426, 0, 0, 0, 1, 1,
1.776824, 0.06651071, 2.720359, 0, 0, 0, 1, 1,
1.779384, 0.392985, 1.3855, 0, 0, 0, 1, 1,
1.790109, 0.0805882, 0.7954563, 0, 0, 0, 1, 1,
1.796312, -0.7519929, 2.528282, 0, 0, 0, 1, 1,
1.79662, -0.4603024, 1.040201, 0, 0, 0, 1, 1,
1.80097, -0.849089, 3.488326, 1, 1, 1, 1, 1,
1.857098, -0.4747458, 3.840445, 1, 1, 1, 1, 1,
1.859439, 0.5781853, 1.099682, 1, 1, 1, 1, 1,
1.86311, 0.9329256, 2.69151, 1, 1, 1, 1, 1,
1.864537, -0.04525495, 2.24352, 1, 1, 1, 1, 1,
1.870897, 0.2578213, 0.6719388, 1, 1, 1, 1, 1,
1.906032, 3.041349, 1.185981, 1, 1, 1, 1, 1,
1.932867, -0.373058, -0.1522347, 1, 1, 1, 1, 1,
1.979122, -0.5896461, 2.164428, 1, 1, 1, 1, 1,
1.979827, -0.594457, 1.764737, 1, 1, 1, 1, 1,
1.982983, -0.3390666, 2.912125, 1, 1, 1, 1, 1,
2.0205, -0.4291514, 1.191236, 1, 1, 1, 1, 1,
2.042524, 0.1628977, 0.9272091, 1, 1, 1, 1, 1,
2.061904, -0.3618045, 3.751827, 1, 1, 1, 1, 1,
2.064107, 0.1526608, 1.347165, 1, 1, 1, 1, 1,
2.098536, 2.07483, 1.926358, 0, 0, 1, 1, 1,
2.149188, 0.2467351, 2.319475, 1, 0, 0, 1, 1,
2.152601, -1.264996, 1.570619, 1, 0, 0, 1, 1,
2.178916, -1.359791, 2.573995, 1, 0, 0, 1, 1,
2.209276, -0.3870401, 1.040828, 1, 0, 0, 1, 1,
2.255432, -0.08276514, 2.639904, 1, 0, 0, 1, 1,
2.265436, 0.6184005, -0.03527622, 0, 0, 0, 1, 1,
2.33352, -1.101256, 3.101774, 0, 0, 0, 1, 1,
2.369875, -0.2975967, 2.332555, 0, 0, 0, 1, 1,
2.375878, -0.4747745, 3.317124, 0, 0, 0, 1, 1,
2.376813, 0.82606, 3.366238, 0, 0, 0, 1, 1,
2.519526, -0.2594407, 0.1565757, 0, 0, 0, 1, 1,
2.575607, 0.1495927, 0.4410399, 0, 0, 0, 1, 1,
2.628517, 1.064142, 2.066355, 1, 1, 1, 1, 1,
2.63516, -0.8857873, 2.80716, 1, 1, 1, 1, 1,
2.670369, -2.238988, 1.515392, 1, 1, 1, 1, 1,
2.672967, 2.137048, 0.5248201, 1, 1, 1, 1, 1,
2.754524, -2.196046, 2.180588, 1, 1, 1, 1, 1,
2.84599, -0.7193599, 2.298892, 1, 1, 1, 1, 1,
2.932637, -0.5745263, 3.271821, 1, 1, 1, 1, 1
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
var radius = 9.73185;
var distance = 34.18271;
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
mvMatrix.translate( 0.1235363, 0.2172351, 0.4313412 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18271);
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
