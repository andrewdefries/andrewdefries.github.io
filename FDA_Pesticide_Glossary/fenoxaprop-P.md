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
-2.983462, 0.4243597, -1.274025, 1, 0, 0, 1,
-2.945555, 2.213867, -2.14408, 1, 0.007843138, 0, 1,
-2.759563, 0.2719483, -1.528692, 1, 0.01176471, 0, 1,
-2.606184, 0.04416782, -2.43023, 1, 0.01960784, 0, 1,
-2.545597, 0.1170493, -1.462496, 1, 0.02352941, 0, 1,
-2.529124, -0.1314973, -2.437628, 1, 0.03137255, 0, 1,
-2.516218, -1.823494, -1.513898, 1, 0.03529412, 0, 1,
-2.507223, 0.2077596, -1.717072, 1, 0.04313726, 0, 1,
-2.369367, 0.2536545, -0.533486, 1, 0.04705882, 0, 1,
-2.340023, -1.506269, -3.251749, 1, 0.05490196, 0, 1,
-2.30415, 0.06079846, -1.728501, 1, 0.05882353, 0, 1,
-2.29925, 0.775992, -1.3729, 1, 0.06666667, 0, 1,
-2.278292, 0.3296642, -1.278725, 1, 0.07058824, 0, 1,
-2.269283, -0.2622631, -2.803102, 1, 0.07843138, 0, 1,
-2.265062, -0.7968991, -1.859543, 1, 0.08235294, 0, 1,
-2.225965, -0.2611633, 0.1893185, 1, 0.09019608, 0, 1,
-2.16899, -1.390118, -3.18866, 1, 0.09411765, 0, 1,
-2.096219, -2.107305, -3.339936, 1, 0.1019608, 0, 1,
-2.074636, -0.2464871, -3.111942, 1, 0.1098039, 0, 1,
-2.046813, 0.9464979, 0.003630493, 1, 0.1137255, 0, 1,
-2.041741, -0.7900415, -2.924755, 1, 0.1215686, 0, 1,
-2.040768, -0.979551, -1.279253, 1, 0.1254902, 0, 1,
-1.97131, 1.229176, -0.5981513, 1, 0.1333333, 0, 1,
-1.920363, 1.727714, -1.700996, 1, 0.1372549, 0, 1,
-1.918037, 0.02867678, -1.140021, 1, 0.145098, 0, 1,
-1.908581, 0.7849784, -1.09609, 1, 0.1490196, 0, 1,
-1.889858, 1.636191, -0.2739782, 1, 0.1568628, 0, 1,
-1.877543, -0.2598083, -2.154931, 1, 0.1607843, 0, 1,
-1.85506, 0.02299544, -0.9161972, 1, 0.1686275, 0, 1,
-1.845187, -1.112696, -2.763759, 1, 0.172549, 0, 1,
-1.83728, -1.940253, -3.491825, 1, 0.1803922, 0, 1,
-1.816081, -1.054133, -0.7479001, 1, 0.1843137, 0, 1,
-1.814155, -0.1673322, -0.07094336, 1, 0.1921569, 0, 1,
-1.787217, 0.009496807, -0.5870786, 1, 0.1960784, 0, 1,
-1.778621, 0.1159247, -1.7797, 1, 0.2039216, 0, 1,
-1.771602, 0.9070703, -0.5030429, 1, 0.2117647, 0, 1,
-1.747186, -0.8942366, -2.082895, 1, 0.2156863, 0, 1,
-1.74158, -0.1513907, -1.355159, 1, 0.2235294, 0, 1,
-1.734479, 1.469892, -2.055107, 1, 0.227451, 0, 1,
-1.726655, 1.319169, -1.331588, 1, 0.2352941, 0, 1,
-1.718441, 1.388002, -2.635257, 1, 0.2392157, 0, 1,
-1.702548, -0.8811314, -3.239151, 1, 0.2470588, 0, 1,
-1.693084, -1.253806, -3.094624, 1, 0.2509804, 0, 1,
-1.6922, 0.8403889, -0.7931559, 1, 0.2588235, 0, 1,
-1.686757, 1.309888, 0.2024761, 1, 0.2627451, 0, 1,
-1.671968, 1.756435, -0.4397832, 1, 0.2705882, 0, 1,
-1.668802, 1.647811, -1.018731, 1, 0.2745098, 0, 1,
-1.660367, -0.6651466, -3.004014, 1, 0.282353, 0, 1,
-1.65856, 2.407224, -0.5042931, 1, 0.2862745, 0, 1,
-1.651004, 1.345741, 0.4969797, 1, 0.2941177, 0, 1,
-1.636382, 1.462366, -1.211766, 1, 0.3019608, 0, 1,
-1.62731, -0.1734577, -1.035715, 1, 0.3058824, 0, 1,
-1.603703, -0.4068004, -1.993826, 1, 0.3137255, 0, 1,
-1.599299, -0.401687, -1.25365, 1, 0.3176471, 0, 1,
-1.595258, -1.421624, -3.114198, 1, 0.3254902, 0, 1,
-1.590776, 1.828012, -0.3216442, 1, 0.3294118, 0, 1,
-1.587101, 2.485702, -1.415722, 1, 0.3372549, 0, 1,
-1.582645, 0.3638998, -0.7801455, 1, 0.3411765, 0, 1,
-1.579566, 0.8265284, -1.300945, 1, 0.3490196, 0, 1,
-1.575458, -1.710092, -2.047748, 1, 0.3529412, 0, 1,
-1.572564, 1.122111, 0.3873985, 1, 0.3607843, 0, 1,
-1.572152, -1.07177, -2.676871, 1, 0.3647059, 0, 1,
-1.560196, -0.102368, 0.1530171, 1, 0.372549, 0, 1,
-1.554969, -0.6950156, -2.426982, 1, 0.3764706, 0, 1,
-1.554617, 0.1642012, -2.165695, 1, 0.3843137, 0, 1,
-1.549843, -0.3685751, 0.3337537, 1, 0.3882353, 0, 1,
-1.543762, 0.5724093, -1.255986, 1, 0.3960784, 0, 1,
-1.538322, -0.7744901, -1.188417, 1, 0.4039216, 0, 1,
-1.516427, 0.3493437, 1.290729, 1, 0.4078431, 0, 1,
-1.515444, 0.1949982, -1.106715, 1, 0.4156863, 0, 1,
-1.514263, 1.070235, -0.4554355, 1, 0.4196078, 0, 1,
-1.503753, 0.1580067, -3.809047, 1, 0.427451, 0, 1,
-1.489506, 1.277116, -1.763685, 1, 0.4313726, 0, 1,
-1.472749, 1.250054, -0.6320944, 1, 0.4392157, 0, 1,
-1.471096, 2.089581, -0.6301959, 1, 0.4431373, 0, 1,
-1.470567, 0.6765283, -1.388327, 1, 0.4509804, 0, 1,
-1.457711, -1.250268, -1.707815, 1, 0.454902, 0, 1,
-1.448303, 0.5066879, -2.824168, 1, 0.4627451, 0, 1,
-1.441849, -1.831558, -1.222563, 1, 0.4666667, 0, 1,
-1.436024, -0.4740053, -4.02916, 1, 0.4745098, 0, 1,
-1.434975, 0.4140695, -1.050675, 1, 0.4784314, 0, 1,
-1.429266, -0.5790596, -0.5549164, 1, 0.4862745, 0, 1,
-1.422512, -1.315015, -1.309229, 1, 0.4901961, 0, 1,
-1.40853, -0.04978357, -3.909306, 1, 0.4980392, 0, 1,
-1.393107, -0.8363783, -2.888075, 1, 0.5058824, 0, 1,
-1.389542, -0.4348246, -2.715243, 1, 0.509804, 0, 1,
-1.38734, -0.8280905, -3.655963, 1, 0.5176471, 0, 1,
-1.383561, 0.4228874, -1.669453, 1, 0.5215687, 0, 1,
-1.380352, 0.1241326, -1.198743, 1, 0.5294118, 0, 1,
-1.379465, 0.103222, -1.335578, 1, 0.5333334, 0, 1,
-1.373299, 0.7378569, -1.901611, 1, 0.5411765, 0, 1,
-1.371181, -0.1006329, -1.052269, 1, 0.5450981, 0, 1,
-1.365706, 1.043957, -0.7522243, 1, 0.5529412, 0, 1,
-1.364595, -1.755248, -1.854764, 1, 0.5568628, 0, 1,
-1.361259, -0.8051856, -1.435381, 1, 0.5647059, 0, 1,
-1.359112, 0.2244757, -0.07312308, 1, 0.5686275, 0, 1,
-1.353068, -1.520522, -1.711144, 1, 0.5764706, 0, 1,
-1.34919, 0.1005334, -2.905452, 1, 0.5803922, 0, 1,
-1.341995, 1.24633, -0.2739455, 1, 0.5882353, 0, 1,
-1.340924, 1.243657, 0.7755634, 1, 0.5921569, 0, 1,
-1.337329, 0.9352669, -2.904297, 1, 0.6, 0, 1,
-1.329868, -0.9417382, -2.516255, 1, 0.6078432, 0, 1,
-1.32784, 0.6578366, -1.144639, 1, 0.6117647, 0, 1,
-1.326057, -0.3442887, -1.986267, 1, 0.6196079, 0, 1,
-1.322664, -0.3692716, -1.583281, 1, 0.6235294, 0, 1,
-1.319248, 0.08672867, -1.627889, 1, 0.6313726, 0, 1,
-1.313923, 1.407084, -1.525968, 1, 0.6352941, 0, 1,
-1.312556, 1.158063, -1.94776, 1, 0.6431373, 0, 1,
-1.294259, -0.5340806, -1.642926, 1, 0.6470588, 0, 1,
-1.287967, -0.6844098, -0.3349059, 1, 0.654902, 0, 1,
-1.278003, 1.373969, -0.2741626, 1, 0.6588235, 0, 1,
-1.274388, 0.0929811, -0.8537447, 1, 0.6666667, 0, 1,
-1.271474, -2.598043, -2.443791, 1, 0.6705883, 0, 1,
-1.260835, -1.735324, -2.820897, 1, 0.6784314, 0, 1,
-1.259108, 0.1885446, -0.8502852, 1, 0.682353, 0, 1,
-1.257198, -2.221367, -3.71155, 1, 0.6901961, 0, 1,
-1.238799, -0.7463337, -4.153989, 1, 0.6941177, 0, 1,
-1.225824, -0.3750454, -2.858091, 1, 0.7019608, 0, 1,
-1.220705, 0.7495345, -0.5149304, 1, 0.7098039, 0, 1,
-1.217949, -0.1002201, -2.367221, 1, 0.7137255, 0, 1,
-1.214786, -0.4582657, -2.494665, 1, 0.7215686, 0, 1,
-1.209131, -1.251479, -3.599018, 1, 0.7254902, 0, 1,
-1.202821, -0.9010385, -3.01064, 1, 0.7333333, 0, 1,
-1.198145, 0.4087162, -2.245611, 1, 0.7372549, 0, 1,
-1.19631, -1.379279, -2.138264, 1, 0.7450981, 0, 1,
-1.188805, 1.31611, 0.3391171, 1, 0.7490196, 0, 1,
-1.187679, 2.07164, -0.009310789, 1, 0.7568628, 0, 1,
-1.185798, 0.0999566, -2.608042, 1, 0.7607843, 0, 1,
-1.181865, -1.538168, -1.493039, 1, 0.7686275, 0, 1,
-1.179702, 0.3620085, -0.2786721, 1, 0.772549, 0, 1,
-1.178816, -0.4369308, -2.353106, 1, 0.7803922, 0, 1,
-1.17614, -0.2555197, -1.50381, 1, 0.7843137, 0, 1,
-1.17019, 0.4814641, -2.458399, 1, 0.7921569, 0, 1,
-1.167895, 1.769942, -0.8265897, 1, 0.7960784, 0, 1,
-1.155089, -0.4338251, -1.742044, 1, 0.8039216, 0, 1,
-1.154615, -0.309964, -2.323093, 1, 0.8117647, 0, 1,
-1.152333, 0.4233834, -0.006346604, 1, 0.8156863, 0, 1,
-1.148473, -0.143373, -2.565565, 1, 0.8235294, 0, 1,
-1.147303, 0.2610441, -1.739586, 1, 0.827451, 0, 1,
-1.14608, 0.9185199, -1.207055, 1, 0.8352941, 0, 1,
-1.136199, -0.424684, -2.639658, 1, 0.8392157, 0, 1,
-1.121611, 1.482457, -0.8388755, 1, 0.8470588, 0, 1,
-1.111965, -1.551262, -4.421039, 1, 0.8509804, 0, 1,
-1.104055, -1.258834, -2.887983, 1, 0.8588235, 0, 1,
-1.093462, -0.8362219, -2.047239, 1, 0.8627451, 0, 1,
-1.087738, -0.724591, -2.212188, 1, 0.8705882, 0, 1,
-1.085175, -0.9280807, -3.268452, 1, 0.8745098, 0, 1,
-1.084454, -0.7177043, -1.561717, 1, 0.8823529, 0, 1,
-1.083948, -0.1081005, -1.238293, 1, 0.8862745, 0, 1,
-1.074892, 0.1503628, -0.6797403, 1, 0.8941177, 0, 1,
-1.072395, 0.696347, -0.6506044, 1, 0.8980392, 0, 1,
-1.070937, -1.479346, -0.9331322, 1, 0.9058824, 0, 1,
-1.064777, -0.4643634, -3.05106, 1, 0.9137255, 0, 1,
-1.063888, 0.5365345, -1.527452, 1, 0.9176471, 0, 1,
-1.05702, -0.5199859, -1.371849, 1, 0.9254902, 0, 1,
-1.054739, -1.049866, -2.633221, 1, 0.9294118, 0, 1,
-1.053595, -1.981785, -1.860278, 1, 0.9372549, 0, 1,
-1.05333, 1.173312, -0.2909338, 1, 0.9411765, 0, 1,
-1.047698, 1.324206, -0.1335837, 1, 0.9490196, 0, 1,
-1.041096, 0.2235837, -1.355939, 1, 0.9529412, 0, 1,
-1.037753, -0.299751, -0.9153125, 1, 0.9607843, 0, 1,
-1.03479, 0.5432982, -1.783324, 1, 0.9647059, 0, 1,
-1.026587, 0.1119177, -2.100868, 1, 0.972549, 0, 1,
-1.018088, 3.030407, -1.892216, 1, 0.9764706, 0, 1,
-1.016925, 1.072248, -0.8798156, 1, 0.9843137, 0, 1,
-1.01276, 1.605806, -0.8634321, 1, 0.9882353, 0, 1,
-1.009072, -1.878389, -3.043833, 1, 0.9960784, 0, 1,
-1.008657, 0.4522314, -1.882899, 0.9960784, 1, 0, 1,
-1.007223, -0.09820771, -2.123221, 0.9921569, 1, 0, 1,
-1.005717, 0.6936945, -1.784232, 0.9843137, 1, 0, 1,
-1.004378, 1.061298, 0.2977939, 0.9803922, 1, 0, 1,
-0.9976256, -1.160619, -3.108205, 0.972549, 1, 0, 1,
-0.9963304, -0.7607208, -2.109709, 0.9686275, 1, 0, 1,
-0.9921961, -0.6849201, -2.078621, 0.9607843, 1, 0, 1,
-0.987155, 1.145927, 1.077293, 0.9568627, 1, 0, 1,
-0.9859796, 2.079791, 0.8600507, 0.9490196, 1, 0, 1,
-0.9839189, 1.402477, -1.805861, 0.945098, 1, 0, 1,
-0.9837416, -0.2188514, -0.4079276, 0.9372549, 1, 0, 1,
-0.9799731, 1.297544, 1.92093, 0.9333333, 1, 0, 1,
-0.9724382, -0.3007753, -2.828343, 0.9254902, 1, 0, 1,
-0.9616845, -0.6506068, -0.5398638, 0.9215686, 1, 0, 1,
-0.960106, -1.3143, -1.933788, 0.9137255, 1, 0, 1,
-0.9534662, -0.3213317, -0.9464129, 0.9098039, 1, 0, 1,
-0.9529709, 1.336041, 0.3749252, 0.9019608, 1, 0, 1,
-0.9487455, -0.06356953, -1.672186, 0.8941177, 1, 0, 1,
-0.9425524, 1.164841, -0.5830213, 0.8901961, 1, 0, 1,
-0.9402356, 1.151769, -1.332417, 0.8823529, 1, 0, 1,
-0.9275734, -0.2550648, -1.00334, 0.8784314, 1, 0, 1,
-0.918103, 0.2812782, -0.7950073, 0.8705882, 1, 0, 1,
-0.9171553, 0.4145078, -0.6830864, 0.8666667, 1, 0, 1,
-0.9169973, 0.4029132, -1.478524, 0.8588235, 1, 0, 1,
-0.9161189, 0.6080921, -0.8610453, 0.854902, 1, 0, 1,
-0.9144965, -0.638102, -1.096824, 0.8470588, 1, 0, 1,
-0.9134535, -0.2483833, -2.322619, 0.8431373, 1, 0, 1,
-0.912072, -0.1308825, -2.128671, 0.8352941, 1, 0, 1,
-0.9092039, 1.388921, 0.2635457, 0.8313726, 1, 0, 1,
-0.9082154, 0.4270954, -1.618712, 0.8235294, 1, 0, 1,
-0.9037114, -0.8876373, -2.169202, 0.8196079, 1, 0, 1,
-0.9010771, -0.2713297, -1.005686, 0.8117647, 1, 0, 1,
-0.8997287, -0.2100401, -2.809279, 0.8078431, 1, 0, 1,
-0.8976868, -0.3356349, 1.272463, 0.8, 1, 0, 1,
-0.8930736, 0.2920512, -1.497583, 0.7921569, 1, 0, 1,
-0.890265, 1.28449, -0.6321297, 0.7882353, 1, 0, 1,
-0.8866827, 0.4275035, -0.6603773, 0.7803922, 1, 0, 1,
-0.8863722, 0.9706699, 0.3802301, 0.7764706, 1, 0, 1,
-0.8862697, -0.01000193, -0.4624427, 0.7686275, 1, 0, 1,
-0.8764216, -0.265013, -2.758104, 0.7647059, 1, 0, 1,
-0.8740525, 0.7335162, -1.174129, 0.7568628, 1, 0, 1,
-0.8715472, 1.19482, -0.8664336, 0.7529412, 1, 0, 1,
-0.8706614, 0.7954156, -2.032565, 0.7450981, 1, 0, 1,
-0.8597936, -1.620254, -1.773591, 0.7411765, 1, 0, 1,
-0.8582996, 1.048834, -1.430352, 0.7333333, 1, 0, 1,
-0.8388797, 0.7696457, 0.2397238, 0.7294118, 1, 0, 1,
-0.8312608, -0.1294741, -1.436285, 0.7215686, 1, 0, 1,
-0.8308213, -0.7818119, -2.206753, 0.7176471, 1, 0, 1,
-0.8240474, 0.523935, -0.3445567, 0.7098039, 1, 0, 1,
-0.8184366, -0.8396754, -1.912285, 0.7058824, 1, 0, 1,
-0.8139899, 0.2500415, -1.371823, 0.6980392, 1, 0, 1,
-0.8131683, 0.6992503, -1.890799, 0.6901961, 1, 0, 1,
-0.812273, 2.030819, -0.401116, 0.6862745, 1, 0, 1,
-0.8100995, 1.891373, -2.255295, 0.6784314, 1, 0, 1,
-0.8041538, 0.2253754, -2.023798, 0.6745098, 1, 0, 1,
-0.8038104, 0.2997218, -0.1337542, 0.6666667, 1, 0, 1,
-0.7991326, 0.4388904, -0.5189127, 0.6627451, 1, 0, 1,
-0.7863658, 0.4222242, -2.229317, 0.654902, 1, 0, 1,
-0.782398, 0.7137753, -2.553545, 0.6509804, 1, 0, 1,
-0.7779858, 1.054395, -0.0317738, 0.6431373, 1, 0, 1,
-0.7778154, -0.2772033, -1.282389, 0.6392157, 1, 0, 1,
-0.777764, 1.291551, -0.5318667, 0.6313726, 1, 0, 1,
-0.7760352, 2.201933, -0.6521589, 0.627451, 1, 0, 1,
-0.7744502, 0.8204685, -0.6091737, 0.6196079, 1, 0, 1,
-0.7740155, -0.0203648, -1.544897, 0.6156863, 1, 0, 1,
-0.7718577, 1.520326, -1.200611, 0.6078432, 1, 0, 1,
-0.7654885, -1.883979, -2.264312, 0.6039216, 1, 0, 1,
-0.7646666, 2.297604, -1.081136, 0.5960785, 1, 0, 1,
-0.7634932, 1.214225, -1.167135, 0.5882353, 1, 0, 1,
-0.7618763, 1.389741, -0.02057305, 0.5843138, 1, 0, 1,
-0.7566535, 2.376581, -1.588076, 0.5764706, 1, 0, 1,
-0.7563577, -0.6224677, -2.301358, 0.572549, 1, 0, 1,
-0.7483171, -1.156161, -3.075044, 0.5647059, 1, 0, 1,
-0.7469751, -0.7315911, -0.6137236, 0.5607843, 1, 0, 1,
-0.7450263, 1.695247, 0.8087499, 0.5529412, 1, 0, 1,
-0.7423468, -1.380132, -3.285108, 0.5490196, 1, 0, 1,
-0.7391324, 0.9784013, 0.348984, 0.5411765, 1, 0, 1,
-0.7368826, -0.3316466, -1.014404, 0.5372549, 1, 0, 1,
-0.7352239, -0.5599239, -2.094203, 0.5294118, 1, 0, 1,
-0.7333541, 1.468837, -2.458898, 0.5254902, 1, 0, 1,
-0.7314782, 0.5594541, -2.013504, 0.5176471, 1, 0, 1,
-0.7227324, -1.047819, -3.626093, 0.5137255, 1, 0, 1,
-0.7204432, -0.5627655, -2.83253, 0.5058824, 1, 0, 1,
-0.7190318, 1.886647, -0.4367076, 0.5019608, 1, 0, 1,
-0.7130654, 2.38268, 1.440416, 0.4941176, 1, 0, 1,
-0.7125373, -0.8978996, -2.523375, 0.4862745, 1, 0, 1,
-0.7040762, 0.5962678, -0.4250944, 0.4823529, 1, 0, 1,
-0.6986166, -2.433372, -2.07914, 0.4745098, 1, 0, 1,
-0.6981508, -0.539522, -2.392754, 0.4705882, 1, 0, 1,
-0.6963593, -0.3399996, -1.791399, 0.4627451, 1, 0, 1,
-0.6952336, 1.646708, -0.7661095, 0.4588235, 1, 0, 1,
-0.6908011, 1.673687, 0.795441, 0.4509804, 1, 0, 1,
-0.6873313, -0.5225329, -2.333657, 0.4470588, 1, 0, 1,
-0.6873209, 0.852748, -0.006198705, 0.4392157, 1, 0, 1,
-0.6870339, -1.303681, -1.372411, 0.4352941, 1, 0, 1,
-0.686902, -0.3155884, -3.037261, 0.427451, 1, 0, 1,
-0.6838768, 0.8106825, -1.944289, 0.4235294, 1, 0, 1,
-0.6822512, 0.1703001, -1.203786, 0.4156863, 1, 0, 1,
-0.675258, -0.4763325, -3.440535, 0.4117647, 1, 0, 1,
-0.6707131, 1.799019, 0.4072801, 0.4039216, 1, 0, 1,
-0.6654364, 0.5200664, -0.9925487, 0.3960784, 1, 0, 1,
-0.6581678, -0.5302395, -2.006164, 0.3921569, 1, 0, 1,
-0.655126, 1.46746, 0.2289907, 0.3843137, 1, 0, 1,
-0.6534982, 0.2680087, -0.7515721, 0.3803922, 1, 0, 1,
-0.6534075, -0.9341403, -2.99686, 0.372549, 1, 0, 1,
-0.6513579, 0.5188131, -2.890193, 0.3686275, 1, 0, 1,
-0.6496789, 0.994843, -0.9703043, 0.3607843, 1, 0, 1,
-0.640416, -1.271607, -2.961805, 0.3568628, 1, 0, 1,
-0.6395791, 0.5014312, 0.03693679, 0.3490196, 1, 0, 1,
-0.6385688, 0.7781524, -0.4523866, 0.345098, 1, 0, 1,
-0.6338372, 0.805119, 0.6418841, 0.3372549, 1, 0, 1,
-0.6324351, 0.7880875, -0.07880311, 0.3333333, 1, 0, 1,
-0.6284489, 1.711292, -0.389887, 0.3254902, 1, 0, 1,
-0.6267949, -0.1302522, -2.176993, 0.3215686, 1, 0, 1,
-0.6227878, 0.5025699, -1.174467, 0.3137255, 1, 0, 1,
-0.622268, 0.03513741, -3.445737, 0.3098039, 1, 0, 1,
-0.6191722, -0.2955524, -2.164366, 0.3019608, 1, 0, 1,
-0.6137785, -0.2098089, -1.185812, 0.2941177, 1, 0, 1,
-0.613508, -0.4090868, -0.8821313, 0.2901961, 1, 0, 1,
-0.6134689, 0.9564571, -1.150031, 0.282353, 1, 0, 1,
-0.6134011, 0.1068911, -0.5900877, 0.2784314, 1, 0, 1,
-0.6098341, 0.6340681, -0.8697994, 0.2705882, 1, 0, 1,
-0.6094145, -1.732777, -3.385886, 0.2666667, 1, 0, 1,
-0.6057857, 1.372366, -0.3782678, 0.2588235, 1, 0, 1,
-0.6041299, 0.3480236, -0.2755955, 0.254902, 1, 0, 1,
-0.6034649, -0.7374417, -2.27578, 0.2470588, 1, 0, 1,
-0.5990134, -0.6563559, -2.717429, 0.2431373, 1, 0, 1,
-0.5989715, -0.2275467, -0.6740189, 0.2352941, 1, 0, 1,
-0.5971457, 0.6119956, -2.181513, 0.2313726, 1, 0, 1,
-0.5948025, 0.2298534, 0.7193503, 0.2235294, 1, 0, 1,
-0.5902463, -0.4942709, -2.127847, 0.2196078, 1, 0, 1,
-0.5805221, -1.557554, -4.069706, 0.2117647, 1, 0, 1,
-0.5804743, -0.8963536, -1.338337, 0.2078431, 1, 0, 1,
-0.5794806, -0.0003959255, -0.7520564, 0.2, 1, 0, 1,
-0.5787314, 0.9252111, 1.180301, 0.1921569, 1, 0, 1,
-0.5700203, 0.9464272, 0.9132478, 0.1882353, 1, 0, 1,
-0.5613951, 0.4376533, -0.2377351, 0.1803922, 1, 0, 1,
-0.5611351, 0.3538866, -0.3812186, 0.1764706, 1, 0, 1,
-0.5573025, 0.2254829, -5.534502, 0.1686275, 1, 0, 1,
-0.5551339, -0.8826212, -2.35185, 0.1647059, 1, 0, 1,
-0.554298, -0.3074752, -3.330232, 0.1568628, 1, 0, 1,
-0.5516191, 0.04555089, -3.118761, 0.1529412, 1, 0, 1,
-0.5502651, -0.5306588, -2.798802, 0.145098, 1, 0, 1,
-0.5398425, -0.2687898, -1.485062, 0.1411765, 1, 0, 1,
-0.5393605, -0.7417734, -3.953054, 0.1333333, 1, 0, 1,
-0.5381666, 0.1854931, -1.267476, 0.1294118, 1, 0, 1,
-0.5328169, -0.8134134, -5.193362, 0.1215686, 1, 0, 1,
-0.5326846, -0.7861791, -1.208289, 0.1176471, 1, 0, 1,
-0.5298667, 0.6173627, -1.68489, 0.1098039, 1, 0, 1,
-0.5275241, 1.305833, 1.123037, 0.1058824, 1, 0, 1,
-0.5255541, -1.236248, -3.884041, 0.09803922, 1, 0, 1,
-0.5244697, 0.5775837, -1.091136, 0.09019608, 1, 0, 1,
-0.5224626, -0.6183735, -1.694262, 0.08627451, 1, 0, 1,
-0.520192, -0.9008221, -3.191157, 0.07843138, 1, 0, 1,
-0.5093169, 0.3456153, -0.9347979, 0.07450981, 1, 0, 1,
-0.4807617, -1.512906, -2.18696, 0.06666667, 1, 0, 1,
-0.4745642, 0.7957413, 0.5264674, 0.0627451, 1, 0, 1,
-0.4743747, -0.465927, -2.964894, 0.05490196, 1, 0, 1,
-0.4735383, -0.8103487, -0.9916118, 0.05098039, 1, 0, 1,
-0.4691984, -1.695381, -1.003502, 0.04313726, 1, 0, 1,
-0.4672851, 0.551581, 1.07407, 0.03921569, 1, 0, 1,
-0.4669671, -1.541278, -1.869127, 0.03137255, 1, 0, 1,
-0.4634032, -1.035251, -1.417242, 0.02745098, 1, 0, 1,
-0.463217, -1.610407, -4.277345, 0.01960784, 1, 0, 1,
-0.4588335, 0.8126162, -1.313679, 0.01568628, 1, 0, 1,
-0.4576996, 0.6907281, 0.1844858, 0.007843138, 1, 0, 1,
-0.4466757, -1.308386, -3.962291, 0.003921569, 1, 0, 1,
-0.4444629, 0.3128691, -1.459616, 0, 1, 0.003921569, 1,
-0.437824, -1.546693, -3.096283, 0, 1, 0.01176471, 1,
-0.4321853, -0.9774852, -2.559584, 0, 1, 0.01568628, 1,
-0.4276358, 0.6698197, -1.43224, 0, 1, 0.02352941, 1,
-0.4169101, 0.4481209, -0.03834717, 0, 1, 0.02745098, 1,
-0.4003403, 0.8850393, 0.8603245, 0, 1, 0.03529412, 1,
-0.3923726, 1.801893, -1.225924, 0, 1, 0.03921569, 1,
-0.3863329, -1.82991, -3.141023, 0, 1, 0.04705882, 1,
-0.3841146, 1.38495, -0.15143, 0, 1, 0.05098039, 1,
-0.3836842, -0.349389, -3.199977, 0, 1, 0.05882353, 1,
-0.3788324, -1.064112, -2.769177, 0, 1, 0.0627451, 1,
-0.3750565, -1.307317, -3.387682, 0, 1, 0.07058824, 1,
-0.3744645, -0.004983371, -1.06421, 0, 1, 0.07450981, 1,
-0.3734294, -0.3876011, -3.40317, 0, 1, 0.08235294, 1,
-0.3733075, 1.081506, 0.6737354, 0, 1, 0.08627451, 1,
-0.364501, 0.6736399, -1.416548, 0, 1, 0.09411765, 1,
-0.3611362, 0.6051717, -1.387001, 0, 1, 0.1019608, 1,
-0.3544286, 1.384828, -1.08046, 0, 1, 0.1058824, 1,
-0.3532996, -0.3051052, -2.641956, 0, 1, 0.1137255, 1,
-0.3509397, 0.3206367, -0.6811779, 0, 1, 0.1176471, 1,
-0.3502434, 1.184114, -0.6331938, 0, 1, 0.1254902, 1,
-0.3392647, 2.507598, 1.375014, 0, 1, 0.1294118, 1,
-0.3362986, 2.025818, -0.6536983, 0, 1, 0.1372549, 1,
-0.3303623, 1.95822, -0.9425996, 0, 1, 0.1411765, 1,
-0.3280761, 1.678328, 1.324932, 0, 1, 0.1490196, 1,
-0.3265937, 1.616634, 0.4424739, 0, 1, 0.1529412, 1,
-0.3249247, -1.403511, -3.235747, 0, 1, 0.1607843, 1,
-0.321072, -1.563964, -4.178825, 0, 1, 0.1647059, 1,
-0.3208455, -0.2836591, -2.035648, 0, 1, 0.172549, 1,
-0.3176192, 1.477312, -0.2127633, 0, 1, 0.1764706, 1,
-0.3107342, 0.8724333, -0.8661435, 0, 1, 0.1843137, 1,
-0.3041521, 0.8221748, -0.4274129, 0, 1, 0.1882353, 1,
-0.3012874, -1.800597, -4.3116, 0, 1, 0.1960784, 1,
-0.300326, -0.2275374, -2.141354, 0, 1, 0.2039216, 1,
-0.2986622, 0.6523543, 1.491804, 0, 1, 0.2078431, 1,
-0.2909567, 0.9831057, -0.6989465, 0, 1, 0.2156863, 1,
-0.290459, -0.5526559, -1.928965, 0, 1, 0.2196078, 1,
-0.2902552, 0.5537506, -1.730107, 0, 1, 0.227451, 1,
-0.290001, -0.4583448, -0.9368871, 0, 1, 0.2313726, 1,
-0.2894829, -1.149902, -0.8299554, 0, 1, 0.2392157, 1,
-0.2889864, -1.368491, -4.012363, 0, 1, 0.2431373, 1,
-0.2863306, 0.8658316, -0.314083, 0, 1, 0.2509804, 1,
-0.2853203, -0.09718899, -1.176443, 0, 1, 0.254902, 1,
-0.2839672, 0.8241377, -0.0154651, 0, 1, 0.2627451, 1,
-0.2800449, 0.7583047, -0.395867, 0, 1, 0.2666667, 1,
-0.2754659, -2.184473, -2.712971, 0, 1, 0.2745098, 1,
-0.269967, -0.1189047, -1.908532, 0, 1, 0.2784314, 1,
-0.2693695, -0.02556798, -2.05355, 0, 1, 0.2862745, 1,
-0.2682119, -0.8327695, -2.711988, 0, 1, 0.2901961, 1,
-0.2681091, -0.281647, -2.362197, 0, 1, 0.2980392, 1,
-0.2677968, 0.2762811, -2.354286, 0, 1, 0.3058824, 1,
-0.2669568, -0.2837377, -2.502999, 0, 1, 0.3098039, 1,
-0.263533, 0.3210413, -0.3427428, 0, 1, 0.3176471, 1,
-0.2600956, -1.1287, -1.753467, 0, 1, 0.3215686, 1,
-0.2586108, 1.598747, -0.9807274, 0, 1, 0.3294118, 1,
-0.2582358, 1.866695, -0.06681103, 0, 1, 0.3333333, 1,
-0.2564937, 0.7984001, 0.635672, 0, 1, 0.3411765, 1,
-0.2547081, 1.274911, -0.465342, 0, 1, 0.345098, 1,
-0.2519817, -1.117005, -2.371609, 0, 1, 0.3529412, 1,
-0.2477784, 0.2659457, -0.03048646, 0, 1, 0.3568628, 1,
-0.2424424, -0.1831575, -1.652265, 0, 1, 0.3647059, 1,
-0.2359316, 0.7801655, -0.03407435, 0, 1, 0.3686275, 1,
-0.2304212, 0.5622941, -1.292715, 0, 1, 0.3764706, 1,
-0.2278987, 1.834197, 1.324296, 0, 1, 0.3803922, 1,
-0.2222734, 0.02557931, -1.504693, 0, 1, 0.3882353, 1,
-0.2168475, 0.2245709, -1.686148, 0, 1, 0.3921569, 1,
-0.2166373, 1.505929, 0.8026411, 0, 1, 0.4, 1,
-0.2152516, -0.5301664, -4.615021, 0, 1, 0.4078431, 1,
-0.2147283, -0.1091833, -1.98124, 0, 1, 0.4117647, 1,
-0.2135815, -0.6393301, -2.010868, 0, 1, 0.4196078, 1,
-0.2129212, 0.01184647, -2.640833, 0, 1, 0.4235294, 1,
-0.2107324, -0.4167144, -2.807321, 0, 1, 0.4313726, 1,
-0.2058405, -1.147269, -2.512317, 0, 1, 0.4352941, 1,
-0.2006971, -1.718215, -3.643433, 0, 1, 0.4431373, 1,
-0.1986932, 0.06675012, -2.175742, 0, 1, 0.4470588, 1,
-0.1976434, 0.3420893, -1.033699, 0, 1, 0.454902, 1,
-0.1949619, 0.4755027, -0.5751024, 0, 1, 0.4588235, 1,
-0.1933782, -1.488662, -5.879592, 0, 1, 0.4666667, 1,
-0.1922894, 1.017488, 1.253085, 0, 1, 0.4705882, 1,
-0.1856936, -2.95834, -2.946077, 0, 1, 0.4784314, 1,
-0.1795572, -0.7058307, -1.438546, 0, 1, 0.4823529, 1,
-0.178335, 0.6736223, -1.112615, 0, 1, 0.4901961, 1,
-0.1777862, -0.6710839, -2.046447, 0, 1, 0.4941176, 1,
-0.1766476, -1.476803, -2.85772, 0, 1, 0.5019608, 1,
-0.1766368, -0.811515, -1.792378, 0, 1, 0.509804, 1,
-0.1731087, -0.13582, -3.385271, 0, 1, 0.5137255, 1,
-0.1701789, 0.3277128, 0.3625595, 0, 1, 0.5215687, 1,
-0.1696543, 0.4988041, -0.3196937, 0, 1, 0.5254902, 1,
-0.1665651, 0.1660456, -0.2757787, 0, 1, 0.5333334, 1,
-0.1638921, 0.3974419, 0.2503845, 0, 1, 0.5372549, 1,
-0.1631293, 0.8634212, -0.02011726, 0, 1, 0.5450981, 1,
-0.1615591, -0.4104138, -2.746469, 0, 1, 0.5490196, 1,
-0.1601269, 0.4054961, -0.7669464, 0, 1, 0.5568628, 1,
-0.1594401, -1.879246, -1.700747, 0, 1, 0.5607843, 1,
-0.1558921, 1.392607, 0.6477524, 0, 1, 0.5686275, 1,
-0.1520477, -0.2001839, -1.621233, 0, 1, 0.572549, 1,
-0.1510763, 0.7469074, -0.1586118, 0, 1, 0.5803922, 1,
-0.1496569, 1.356252, 0.1420959, 0, 1, 0.5843138, 1,
-0.1465399, -0.5805722, -2.399019, 0, 1, 0.5921569, 1,
-0.1429023, -1.398524, -2.048121, 0, 1, 0.5960785, 1,
-0.1428571, -1.248053, -2.689979, 0, 1, 0.6039216, 1,
-0.1396867, -1.140436, -3.960038, 0, 1, 0.6117647, 1,
-0.1350019, 0.1771053, 0.04635923, 0, 1, 0.6156863, 1,
-0.1340124, -0.4141937, -1.565952, 0, 1, 0.6235294, 1,
-0.1330657, -0.8553225, -1.765379, 0, 1, 0.627451, 1,
-0.1327978, 1.005241, 0.4293696, 0, 1, 0.6352941, 1,
-0.128927, -0.2999803, -2.191453, 0, 1, 0.6392157, 1,
-0.1258996, -1.136877, -3.685915, 0, 1, 0.6470588, 1,
-0.1187809, -0.06408976, -1.952451, 0, 1, 0.6509804, 1,
-0.1160448, -0.8168338, -3.478974, 0, 1, 0.6588235, 1,
-0.1143059, -1.285383, -3.696489, 0, 1, 0.6627451, 1,
-0.1132145, -0.06663093, -1.01283, 0, 1, 0.6705883, 1,
-0.1123808, 1.19313, 0.8847618, 0, 1, 0.6745098, 1,
-0.1107059, -1.059504, -3.294779, 0, 1, 0.682353, 1,
-0.1096357, -0.998836, -2.142548, 0, 1, 0.6862745, 1,
-0.1080408, -0.9076025, -4.154961, 0, 1, 0.6941177, 1,
-0.1033202, -1.514191, -0.3971427, 0, 1, 0.7019608, 1,
-0.1013236, 1.85968, 0.1865202, 0, 1, 0.7058824, 1,
-0.1012951, -0.1871884, -4.380543, 0, 1, 0.7137255, 1,
-0.09973773, -0.1568536, -4.483028, 0, 1, 0.7176471, 1,
-0.09894746, 0.8001266, 1.319788, 0, 1, 0.7254902, 1,
-0.09890836, -0.8015327, -4.119884, 0, 1, 0.7294118, 1,
-0.0962368, 1.09274, 0.7413212, 0, 1, 0.7372549, 1,
-0.08810569, 0.603343, -1.289094, 0, 1, 0.7411765, 1,
-0.08361404, 0.3262841, -0.7115849, 0, 1, 0.7490196, 1,
-0.08211311, 0.007135119, -3.101405, 0, 1, 0.7529412, 1,
-0.07478285, 0.9724818, 0.5160467, 0, 1, 0.7607843, 1,
-0.07042672, 0.009621491, -2.193264, 0, 1, 0.7647059, 1,
-0.06618564, -0.7456137, -3.481712, 0, 1, 0.772549, 1,
-0.06413324, 0.5633847, -1.090495, 0, 1, 0.7764706, 1,
-0.06383221, 0.154148, 0.2505543, 0, 1, 0.7843137, 1,
-0.06153442, -0.499954, -1.959923, 0, 1, 0.7882353, 1,
-0.06029594, -0.5485847, -3.29379, 0, 1, 0.7960784, 1,
-0.06006703, 1.630951, 1.936958, 0, 1, 0.8039216, 1,
-0.05997299, -0.8929633, -4.139744, 0, 1, 0.8078431, 1,
-0.05836898, -0.3145817, -2.288123, 0, 1, 0.8156863, 1,
-0.05607527, 0.99646, 0.2901685, 0, 1, 0.8196079, 1,
-0.04691062, 1.03449, -1.703569, 0, 1, 0.827451, 1,
-0.04651691, -0.3363386, -3.483048, 0, 1, 0.8313726, 1,
-0.04410102, -0.1545912, -6.781391, 0, 1, 0.8392157, 1,
-0.04335251, 1.480795, 0.6325539, 0, 1, 0.8431373, 1,
-0.04157628, 2.36727, 0.122674, 0, 1, 0.8509804, 1,
-0.04081062, -0.09891794, -3.347511, 0, 1, 0.854902, 1,
-0.04027633, -1.637618, -2.90531, 0, 1, 0.8627451, 1,
-0.03851878, -0.01743237, -2.392475, 0, 1, 0.8666667, 1,
-0.03642022, 1.025266, -0.6208212, 0, 1, 0.8745098, 1,
-0.03104271, 0.004271745, -2.309265, 0, 1, 0.8784314, 1,
-0.02771812, -0.198844, -4.17917, 0, 1, 0.8862745, 1,
-0.02616851, 1.16804, -0.3435836, 0, 1, 0.8901961, 1,
-0.02486085, -1.838241, -3.899934, 0, 1, 0.8980392, 1,
-0.01743046, 0.3996751, 1.962726, 0, 1, 0.9058824, 1,
-0.008964462, 0.6666661, 1.144287, 0, 1, 0.9098039, 1,
-0.007968846, 0.7793225, -0.4713047, 0, 1, 0.9176471, 1,
-0.004309656, 1.274149, -1.027706, 0, 1, 0.9215686, 1,
-0.00185635, -0.4538584, -1.864872, 0, 1, 0.9294118, 1,
0.0009669813, -0.3665619, 4.139805, 0, 1, 0.9333333, 1,
0.001023589, -1.267631, 2.734949, 0, 1, 0.9411765, 1,
0.007033171, 0.4855915, -2.224411, 0, 1, 0.945098, 1,
0.007833655, 0.6452397, -1.647898, 0, 1, 0.9529412, 1,
0.01145104, -1.557673, 2.871514, 0, 1, 0.9568627, 1,
0.01198956, -1.062392, 2.788626, 0, 1, 0.9647059, 1,
0.01269121, -0.5481085, 1.299102, 0, 1, 0.9686275, 1,
0.01370342, -0.8113247, 3.231202, 0, 1, 0.9764706, 1,
0.02014721, 1.009647, -0.2028422, 0, 1, 0.9803922, 1,
0.02412644, -0.249427, 4.411508, 0, 1, 0.9882353, 1,
0.02725128, -1.314471, 0.8466324, 0, 1, 0.9921569, 1,
0.02888517, -2.410389, 2.668435, 0, 1, 1, 1,
0.0309387, 0.5359581, 0.7413699, 0, 0.9921569, 1, 1,
0.03156009, 0.2389568, -0.05361815, 0, 0.9882353, 1, 1,
0.03472499, 2.260906, -1.704004, 0, 0.9803922, 1, 1,
0.03739868, 0.8842981, 0.9995213, 0, 0.9764706, 1, 1,
0.03744179, -1.34057, 4.233421, 0, 0.9686275, 1, 1,
0.04148849, 1.41225, 1.031904, 0, 0.9647059, 1, 1,
0.04190818, -0.9016439, 1.441475, 0, 0.9568627, 1, 1,
0.0430081, 0.499164, 0.1364672, 0, 0.9529412, 1, 1,
0.04417953, 1.3146, -1.205122, 0, 0.945098, 1, 1,
0.04659683, 0.7235592, 0.6080934, 0, 0.9411765, 1, 1,
0.0477208, -0.9420118, 2.315961, 0, 0.9333333, 1, 1,
0.04928523, 0.04297251, 2.076467, 0, 0.9294118, 1, 1,
0.05236733, -0.1623597, 2.336117, 0, 0.9215686, 1, 1,
0.05630659, 0.1047411, 1.226494, 0, 0.9176471, 1, 1,
0.05815113, -0.0963143, 2.245828, 0, 0.9098039, 1, 1,
0.06240863, -0.472595, 4.288322, 0, 0.9058824, 1, 1,
0.06369494, 0.1664369, -0.4663847, 0, 0.8980392, 1, 1,
0.064798, 0.5217761, 0.1269428, 0, 0.8901961, 1, 1,
0.06721649, 0.6532553, 0.2078584, 0, 0.8862745, 1, 1,
0.0676759, 0.6153215, -0.9038822, 0, 0.8784314, 1, 1,
0.07151161, -1.240069, 2.517489, 0, 0.8745098, 1, 1,
0.07165608, 0.2767517, 0.959022, 0, 0.8666667, 1, 1,
0.07586575, 0.06729289, 1.918539, 0, 0.8627451, 1, 1,
0.07617311, 0.1614828, -0.723731, 0, 0.854902, 1, 1,
0.07783863, 0.08447634, -0.3340001, 0, 0.8509804, 1, 1,
0.07969446, -0.3849306, 2.004709, 0, 0.8431373, 1, 1,
0.08289799, -0.05085145, 4.950567, 0, 0.8392157, 1, 1,
0.08325641, -1.154178, 3.167661, 0, 0.8313726, 1, 1,
0.08404058, -0.1977424, 4.402417, 0, 0.827451, 1, 1,
0.08660033, -0.8699106, 4.320844, 0, 0.8196079, 1, 1,
0.08719582, 1.051598, 0.1029531, 0, 0.8156863, 1, 1,
0.0889072, 0.1634147, 0.5991715, 0, 0.8078431, 1, 1,
0.08909006, 0.3709596, 0.4790789, 0, 0.8039216, 1, 1,
0.09570257, -0.4136392, 3.338595, 0, 0.7960784, 1, 1,
0.0960634, 1.744622, -0.5804235, 0, 0.7882353, 1, 1,
0.09921535, 0.4286931, -0.220338, 0, 0.7843137, 1, 1,
0.1029339, 0.0007950782, 1.39135, 0, 0.7764706, 1, 1,
0.1072841, -0.7644489, 1.170412, 0, 0.772549, 1, 1,
0.1086217, -0.1779925, 2.901853, 0, 0.7647059, 1, 1,
0.1102493, 0.9913065, -0.3144166, 0, 0.7607843, 1, 1,
0.1125824, -1.69625, 4.42366, 0, 0.7529412, 1, 1,
0.1140383, -1.799887, 4.58462, 0, 0.7490196, 1, 1,
0.1162932, -0.5058126, 2.036369, 0, 0.7411765, 1, 1,
0.1192445, 0.3422554, 0.1690462, 0, 0.7372549, 1, 1,
0.1208435, -1.928758, 2.011704, 0, 0.7294118, 1, 1,
0.1212442, -0.4961534, 2.905943, 0, 0.7254902, 1, 1,
0.1216881, 0.9528883, -0.3662021, 0, 0.7176471, 1, 1,
0.1233301, 0.8861626, 2.44688, 0, 0.7137255, 1, 1,
0.1269887, 2.266964, -0.8683136, 0, 0.7058824, 1, 1,
0.1280066, -0.3342268, 2.48075, 0, 0.6980392, 1, 1,
0.1297123, 0.8197509, -0.1725587, 0, 0.6941177, 1, 1,
0.1303785, -1.388733, 2.833261, 0, 0.6862745, 1, 1,
0.1362718, 0.3111882, -0.203377, 0, 0.682353, 1, 1,
0.1438865, 1.261029, 0.8569427, 0, 0.6745098, 1, 1,
0.1451113, -1.866707, 2.877834, 0, 0.6705883, 1, 1,
0.1475632, -1.082866, 3.365405, 0, 0.6627451, 1, 1,
0.1486684, -0.02961995, 2.688147, 0, 0.6588235, 1, 1,
0.1499794, 0.1745832, -1.202061, 0, 0.6509804, 1, 1,
0.1504475, 0.6350652, -1.202446, 0, 0.6470588, 1, 1,
0.1555285, -0.4752077, 3.559389, 0, 0.6392157, 1, 1,
0.1582384, 0.4213259, 0.2387294, 0, 0.6352941, 1, 1,
0.158859, 0.6786172, -0.2165419, 0, 0.627451, 1, 1,
0.1589642, -0.8020732, 2.00766, 0, 0.6235294, 1, 1,
0.1599315, -0.4586729, 4.179972, 0, 0.6156863, 1, 1,
0.1615483, 0.2419232, 1.296976, 0, 0.6117647, 1, 1,
0.1647318, -1.503526, 1.767771, 0, 0.6039216, 1, 1,
0.1754298, 0.00133227, 3.49016, 0, 0.5960785, 1, 1,
0.1757798, 0.7142579, -0.2999344, 0, 0.5921569, 1, 1,
0.1797016, -2.182586, 3.634162, 0, 0.5843138, 1, 1,
0.1901697, -1.185688, 1.352759, 0, 0.5803922, 1, 1,
0.1913166, 1.302103, -0.7502484, 0, 0.572549, 1, 1,
0.1969278, -0.3807955, 4.123933, 0, 0.5686275, 1, 1,
0.2011928, -0.6778127, 2.487851, 0, 0.5607843, 1, 1,
0.2021489, 0.197083, 1.67897, 0, 0.5568628, 1, 1,
0.2041851, -0.2319409, 1.459924, 0, 0.5490196, 1, 1,
0.2058893, 0.9473662, 0.3870005, 0, 0.5450981, 1, 1,
0.209831, 0.4116335, -0.4265364, 0, 0.5372549, 1, 1,
0.2119143, -0.4976022, 2.78896, 0, 0.5333334, 1, 1,
0.2137291, -0.3172481, 3.843795, 0, 0.5254902, 1, 1,
0.2217511, -0.8595102, 3.212886, 0, 0.5215687, 1, 1,
0.2228371, 0.4561847, 1.144523, 0, 0.5137255, 1, 1,
0.2231774, 0.5547464, 1.260786, 0, 0.509804, 1, 1,
0.2258788, 2.325355, 0.7632738, 0, 0.5019608, 1, 1,
0.2304182, 0.8088461, -0.3425646, 0, 0.4941176, 1, 1,
0.2315527, 0.6393069, 0.4941589, 0, 0.4901961, 1, 1,
0.2335766, 1.681762, -0.182731, 0, 0.4823529, 1, 1,
0.2417105, 2.207016, 1.699605, 0, 0.4784314, 1, 1,
0.2420971, 0.6442373, 0.471673, 0, 0.4705882, 1, 1,
0.2442171, 0.2462761, 0.9770343, 0, 0.4666667, 1, 1,
0.2443322, -0.9037989, 1.593021, 0, 0.4588235, 1, 1,
0.2515248, -0.6437638, 2.57908, 0, 0.454902, 1, 1,
0.2646483, -0.2679673, 2.250334, 0, 0.4470588, 1, 1,
0.2671249, -0.502876, 1.684156, 0, 0.4431373, 1, 1,
0.2687313, 1.839052, -0.3833652, 0, 0.4352941, 1, 1,
0.2738515, 0.388119, 0.4703356, 0, 0.4313726, 1, 1,
0.2774758, 0.3177967, 1.590692, 0, 0.4235294, 1, 1,
0.28014, 1.237762, 0.4478031, 0, 0.4196078, 1, 1,
0.2815685, 2.122282, 0.2030667, 0, 0.4117647, 1, 1,
0.2825896, 0.9247267, 1.489133, 0, 0.4078431, 1, 1,
0.2832063, -1.368495, 2.712601, 0, 0.4, 1, 1,
0.2832869, -0.6975024, 2.354782, 0, 0.3921569, 1, 1,
0.284062, -0.3861564, 1.317107, 0, 0.3882353, 1, 1,
0.2842781, 1.229002, 0.9183382, 0, 0.3803922, 1, 1,
0.2852853, -0.2509797, 2.834124, 0, 0.3764706, 1, 1,
0.2889532, 0.2983992, 0.4298324, 0, 0.3686275, 1, 1,
0.2935924, 0.4489477, 1.547427, 0, 0.3647059, 1, 1,
0.2948658, 0.6739451, 0.7632079, 0, 0.3568628, 1, 1,
0.2969077, -1.971823, 1.227774, 0, 0.3529412, 1, 1,
0.2976325, -0.3124804, 3.046853, 0, 0.345098, 1, 1,
0.2993041, 0.3455647, 0.2297846, 0, 0.3411765, 1, 1,
0.3044415, -0.1049457, 1.552951, 0, 0.3333333, 1, 1,
0.306809, -1.32824, 2.206648, 0, 0.3294118, 1, 1,
0.310092, 0.7731611, 0.1905494, 0, 0.3215686, 1, 1,
0.314646, -2.483262, 2.275888, 0, 0.3176471, 1, 1,
0.3210519, 0.9933367, 1.47536, 0, 0.3098039, 1, 1,
0.322493, -0.9259881, 1.802991, 0, 0.3058824, 1, 1,
0.32261, -0.8436764, 1.34163, 0, 0.2980392, 1, 1,
0.3280572, -0.6435804, 1.739321, 0, 0.2901961, 1, 1,
0.3283823, -0.6478267, 2.596451, 0, 0.2862745, 1, 1,
0.332176, -0.8570423, 2.863146, 0, 0.2784314, 1, 1,
0.3358846, -1.483024, 1.213769, 0, 0.2745098, 1, 1,
0.3409836, -0.6731595, 3.447551, 0, 0.2666667, 1, 1,
0.3429565, 0.6505563, -0.2036304, 0, 0.2627451, 1, 1,
0.3461971, 0.4433621, 0.9202888, 0, 0.254902, 1, 1,
0.3475011, 0.8751348, 1.937261, 0, 0.2509804, 1, 1,
0.3475536, 0.359669, -0.9333829, 0, 0.2431373, 1, 1,
0.3496978, -0.02875039, 0.2680987, 0, 0.2392157, 1, 1,
0.351168, 0.747094, 2.12021, 0, 0.2313726, 1, 1,
0.3588078, 1.206708, -0.2950647, 0, 0.227451, 1, 1,
0.3595033, -0.06775931, 2.897007, 0, 0.2196078, 1, 1,
0.3636444, 0.5024383, 0.8282722, 0, 0.2156863, 1, 1,
0.3660574, -1.740281, 3.216815, 0, 0.2078431, 1, 1,
0.3680609, 0.4974144, 1.242985, 0, 0.2039216, 1, 1,
0.3689842, -0.1075225, 1.751257, 0, 0.1960784, 1, 1,
0.3755617, 0.4670994, 1.029211, 0, 0.1882353, 1, 1,
0.3788652, 0.003288758, 0.3016201, 0, 0.1843137, 1, 1,
0.3804899, 0.849359, 0.8428231, 0, 0.1764706, 1, 1,
0.3863634, -0.2151118, 3.297444, 0, 0.172549, 1, 1,
0.3922621, 0.59189, 2.178032, 0, 0.1647059, 1, 1,
0.3932213, -0.1036217, 2.049351, 0, 0.1607843, 1, 1,
0.4020937, -1.111484, 1.969228, 0, 0.1529412, 1, 1,
0.4056643, -0.2523533, -0.4699728, 0, 0.1490196, 1, 1,
0.4075668, -0.4519425, 3.220507, 0, 0.1411765, 1, 1,
0.4081784, 0.1977236, 1.306909, 0, 0.1372549, 1, 1,
0.4179304, -1.213274, 1.276956, 0, 0.1294118, 1, 1,
0.4186921, -0.2910491, 2.828946, 0, 0.1254902, 1, 1,
0.426995, 1.539921, 2.06441, 0, 0.1176471, 1, 1,
0.431188, 1.290365, -1.541618, 0, 0.1137255, 1, 1,
0.4327635, -0.9774275, 3.677074, 0, 0.1058824, 1, 1,
0.443233, -0.2357987, 1.494246, 0, 0.09803922, 1, 1,
0.446849, -0.4086483, -0.3389137, 0, 0.09411765, 1, 1,
0.448043, 0.5533291, 0.2059924, 0, 0.08627451, 1, 1,
0.4591238, 0.9855871, 1.330258, 0, 0.08235294, 1, 1,
0.4592831, -0.3459661, 2.184811, 0, 0.07450981, 1, 1,
0.4593847, 1.29562, 0.2768983, 0, 0.07058824, 1, 1,
0.4600983, 1.099424, 2.03052, 0, 0.0627451, 1, 1,
0.4615112, -0.9695704, 1.905101, 0, 0.05882353, 1, 1,
0.4625847, -1.008811, 1.887755, 0, 0.05098039, 1, 1,
0.4744469, -1.054453, 1.809387, 0, 0.04705882, 1, 1,
0.4750795, -1.615609, 4.720457, 0, 0.03921569, 1, 1,
0.4771062, -1.259388, 1.775616, 0, 0.03529412, 1, 1,
0.4852232, 0.1140952, 1.460651, 0, 0.02745098, 1, 1,
0.4866756, -0.532138, 2.413023, 0, 0.02352941, 1, 1,
0.486908, 0.9593933, 2.057621, 0, 0.01568628, 1, 1,
0.4896553, -0.003468821, 2.255857, 0, 0.01176471, 1, 1,
0.4916666, 1.058429, -0.2725365, 0, 0.003921569, 1, 1,
0.4917564, -0.3904034, 2.706091, 0.003921569, 0, 1, 1,
0.4939277, -1.194941, 2.747228, 0.007843138, 0, 1, 1,
0.5010853, -0.5643464, 1.856031, 0.01568628, 0, 1, 1,
0.5030302, 1.557394, 1.237561, 0.01960784, 0, 1, 1,
0.5032317, -0.3922686, 4.381307, 0.02745098, 0, 1, 1,
0.5064631, -0.6068887, 2.625637, 0.03137255, 0, 1, 1,
0.5090141, 0.9704757, 0.04266419, 0.03921569, 0, 1, 1,
0.5167121, -0.1647039, 1.188272, 0.04313726, 0, 1, 1,
0.523411, -0.9437727, 2.707232, 0.05098039, 0, 1, 1,
0.5252857, -1.346336, 3.657156, 0.05490196, 0, 1, 1,
0.5253092, -2.220645, 4.017234, 0.0627451, 0, 1, 1,
0.526249, 0.4552559, 0.6669834, 0.06666667, 0, 1, 1,
0.5291236, -0.2740642, 1.670418, 0.07450981, 0, 1, 1,
0.5295993, -0.3599936, 2.57751, 0.07843138, 0, 1, 1,
0.530248, -1.460554, 2.591889, 0.08627451, 0, 1, 1,
0.5317703, -1.297313, 4.356273, 0.09019608, 0, 1, 1,
0.5324295, 0.3934643, 0.8367471, 0.09803922, 0, 1, 1,
0.5329525, -0.07565539, 0.5305628, 0.1058824, 0, 1, 1,
0.5333806, -0.1087891, 0.2493052, 0.1098039, 0, 1, 1,
0.534314, 1.32283, 1.502315, 0.1176471, 0, 1, 1,
0.5344288, 2.577377, 2.003994, 0.1215686, 0, 1, 1,
0.5402694, 1.26675, 0.818087, 0.1294118, 0, 1, 1,
0.5423414, -0.07051175, 2.04191, 0.1333333, 0, 1, 1,
0.5434098, 0.6178992, 0.9753026, 0.1411765, 0, 1, 1,
0.5435158, 0.6196925, -0.5111026, 0.145098, 0, 1, 1,
0.5449181, -0.2662235, 3.803821, 0.1529412, 0, 1, 1,
0.557724, 0.3008814, 0.06425054, 0.1568628, 0, 1, 1,
0.5601526, 0.8700166, 1.54197, 0.1647059, 0, 1, 1,
0.5612527, -0.519113, 2.172454, 0.1686275, 0, 1, 1,
0.5621641, -0.09317236, 1.673186, 0.1764706, 0, 1, 1,
0.5628503, 2.494662, -0.9839861, 0.1803922, 0, 1, 1,
0.5629172, 0.6440193, 1.82965, 0.1882353, 0, 1, 1,
0.5636096, -0.8627997, 2.226671, 0.1921569, 0, 1, 1,
0.5753657, 2.555087, 0.8179007, 0.2, 0, 1, 1,
0.5759866, 0.2192818, 0.07730845, 0.2078431, 0, 1, 1,
0.5761347, -0.1579074, 1.512107, 0.2117647, 0, 1, 1,
0.5787197, 0.2892713, 0.884156, 0.2196078, 0, 1, 1,
0.5801154, -0.7599881, 2.77102, 0.2235294, 0, 1, 1,
0.5824885, 0.8400576, 0.6031364, 0.2313726, 0, 1, 1,
0.5836326, -1.441146, 3.03094, 0.2352941, 0, 1, 1,
0.5839612, 0.5313391, -0.006299196, 0.2431373, 0, 1, 1,
0.5867122, 0.1494549, 1.907403, 0.2470588, 0, 1, 1,
0.5875765, -1.477167, 2.514321, 0.254902, 0, 1, 1,
0.5904251, 0.7478796, -0.5122359, 0.2588235, 0, 1, 1,
0.5965674, -1.99275, 2.857495, 0.2666667, 0, 1, 1,
0.6013983, -0.06039586, 0.942679, 0.2705882, 0, 1, 1,
0.6126292, -1.034536, 4.039728, 0.2784314, 0, 1, 1,
0.6238794, -0.4351659, 2.310343, 0.282353, 0, 1, 1,
0.628103, 1.321441, 2.057525, 0.2901961, 0, 1, 1,
0.6312031, 1.226444, 2.447527, 0.2941177, 0, 1, 1,
0.6320699, -0.7642608, 1.128895, 0.3019608, 0, 1, 1,
0.6323531, 1.270881, 1.536549, 0.3098039, 0, 1, 1,
0.6342763, 0.1876819, 2.101828, 0.3137255, 0, 1, 1,
0.634571, -0.1252626, 3.266084, 0.3215686, 0, 1, 1,
0.6363643, 0.5696672, 0.5808594, 0.3254902, 0, 1, 1,
0.6434693, 1.471538, 0.8412765, 0.3333333, 0, 1, 1,
0.6460998, -0.1333217, 1.169169, 0.3372549, 0, 1, 1,
0.6464233, -0.1602859, 1.715384, 0.345098, 0, 1, 1,
0.6473527, -0.4385813, -0.04939888, 0.3490196, 0, 1, 1,
0.6490099, 0.4076727, 0.09864132, 0.3568628, 0, 1, 1,
0.6504179, 2.137744, 0.414138, 0.3607843, 0, 1, 1,
0.6531, 1.034807, 1.610248, 0.3686275, 0, 1, 1,
0.6551937, 1.380731, 0.7273304, 0.372549, 0, 1, 1,
0.6645985, -0.6341304, 2.519538, 0.3803922, 0, 1, 1,
0.6674238, 0.3846501, 1.197064, 0.3843137, 0, 1, 1,
0.6684343, -0.733934, 2.152574, 0.3921569, 0, 1, 1,
0.6711335, -2.191738, 2.460034, 0.3960784, 0, 1, 1,
0.6768839, -1.822224, 1.569542, 0.4039216, 0, 1, 1,
0.6778025, 0.3036003, 0.9635141, 0.4117647, 0, 1, 1,
0.684726, -0.7118089, 1.358536, 0.4156863, 0, 1, 1,
0.6854811, -1.960739, 2.128064, 0.4235294, 0, 1, 1,
0.6943235, 0.958104, 0.9842471, 0.427451, 0, 1, 1,
0.7023826, -0.5329584, 2.75652, 0.4352941, 0, 1, 1,
0.7027716, 0.3463351, -0.2141917, 0.4392157, 0, 1, 1,
0.7048354, 0.7111904, 0.9563392, 0.4470588, 0, 1, 1,
0.7080967, 0.2973055, 0.975122, 0.4509804, 0, 1, 1,
0.7093896, 2.493071, 1.47808, 0.4588235, 0, 1, 1,
0.7120478, 0.7666833, 1.295105, 0.4627451, 0, 1, 1,
0.7140772, 0.7911563, 1.004271, 0.4705882, 0, 1, 1,
0.7173514, -0.7406086, 0.05430562, 0.4745098, 0, 1, 1,
0.7206246, 1.592916, 0.3243677, 0.4823529, 0, 1, 1,
0.7218236, 2.366841, -0.06941105, 0.4862745, 0, 1, 1,
0.7232239, -0.5964822, 2.231522, 0.4941176, 0, 1, 1,
0.7254316, 0.3661499, 1.466588, 0.5019608, 0, 1, 1,
0.7267054, -0.1411517, 3.761145, 0.5058824, 0, 1, 1,
0.7272111, -0.248696, 1.075898, 0.5137255, 0, 1, 1,
0.7298465, 1.609685, -1.513274, 0.5176471, 0, 1, 1,
0.7327204, -0.581847, 2.328967, 0.5254902, 0, 1, 1,
0.7328265, -0.9411002, 3.203893, 0.5294118, 0, 1, 1,
0.73599, -0.8333347, 4.844118, 0.5372549, 0, 1, 1,
0.7383736, -1.853126, 1.62673, 0.5411765, 0, 1, 1,
0.7410955, -1.157431, 2.131933, 0.5490196, 0, 1, 1,
0.7416603, 0.1902024, 0.4045214, 0.5529412, 0, 1, 1,
0.7428886, -1.630618, 3.571357, 0.5607843, 0, 1, 1,
0.7433922, -2.152995, 3.593105, 0.5647059, 0, 1, 1,
0.7449456, 0.4075052, 1.216047, 0.572549, 0, 1, 1,
0.7495421, -0.7510074, 2.777098, 0.5764706, 0, 1, 1,
0.7530521, -1.35371, 1.762094, 0.5843138, 0, 1, 1,
0.7571267, -1.363382, 2.134582, 0.5882353, 0, 1, 1,
0.7589332, -0.3412914, 2.661405, 0.5960785, 0, 1, 1,
0.7638392, -0.1432292, 1.812215, 0.6039216, 0, 1, 1,
0.7645673, 0.4701757, 0.6514613, 0.6078432, 0, 1, 1,
0.7649272, -0.8937953, 4.051011, 0.6156863, 0, 1, 1,
0.7853381, 0.1631937, 1.264771, 0.6196079, 0, 1, 1,
0.7868086, 0.008218649, 0.7988468, 0.627451, 0, 1, 1,
0.7880288, -0.9434497, 2.481893, 0.6313726, 0, 1, 1,
0.7902534, -0.2113032, 0.7232698, 0.6392157, 0, 1, 1,
0.793741, 0.03240177, 1.069534, 0.6431373, 0, 1, 1,
0.7955378, 1.232153, 1.560587, 0.6509804, 0, 1, 1,
0.8033425, -0.6290266, 3.199638, 0.654902, 0, 1, 1,
0.8038703, -0.3485045, 3.27418, 0.6627451, 0, 1, 1,
0.8046292, -0.2553084, 3.447446, 0.6666667, 0, 1, 1,
0.8077855, 0.1429459, 2.599889, 0.6745098, 0, 1, 1,
0.810921, 0.8114586, 1.136193, 0.6784314, 0, 1, 1,
0.8141742, -1.042642, 2.866813, 0.6862745, 0, 1, 1,
0.8163766, -0.950789, 2.957634, 0.6901961, 0, 1, 1,
0.8167924, -0.1461274, 2.051849, 0.6980392, 0, 1, 1,
0.8187504, 1.078451, -0.07652607, 0.7058824, 0, 1, 1,
0.8301881, 1.446318, 0.09526235, 0.7098039, 0, 1, 1,
0.8313092, -0.4221777, 1.598001, 0.7176471, 0, 1, 1,
0.8316177, -0.3522389, 0.5577307, 0.7215686, 0, 1, 1,
0.8373222, 0.3119186, 3.734583, 0.7294118, 0, 1, 1,
0.8391293, -0.429249, 2.616325, 0.7333333, 0, 1, 1,
0.8459164, -0.5166196, 3.552251, 0.7411765, 0, 1, 1,
0.8505951, 0.4367115, 1.410371, 0.7450981, 0, 1, 1,
0.8552696, -0.7109752, 1.666751, 0.7529412, 0, 1, 1,
0.8589066, 0.6769115, 1.215102, 0.7568628, 0, 1, 1,
0.8623057, 0.7266214, -0.8827592, 0.7647059, 0, 1, 1,
0.8687902, -0.2750121, 2.031354, 0.7686275, 0, 1, 1,
0.875192, 0.07628911, 0.7504533, 0.7764706, 0, 1, 1,
0.8788191, 0.2401852, 1.909947, 0.7803922, 0, 1, 1,
0.8789399, 2.631374, 1.183559, 0.7882353, 0, 1, 1,
0.8852599, -0.2546186, 1.529779, 0.7921569, 0, 1, 1,
0.8856415, -0.3793737, 2.786461, 0.8, 0, 1, 1,
0.8968114, -0.4461679, 1.936581, 0.8078431, 0, 1, 1,
0.8979378, -0.7700636, 2.414721, 0.8117647, 0, 1, 1,
0.9011958, -0.3134661, -0.0468892, 0.8196079, 0, 1, 1,
0.9013859, -1.191182, 1.046448, 0.8235294, 0, 1, 1,
0.9048181, 0.02605436, 0.8898567, 0.8313726, 0, 1, 1,
0.9071199, -0.3860341, 1.804088, 0.8352941, 0, 1, 1,
0.9179276, 1.009898, 2.08792, 0.8431373, 0, 1, 1,
0.9224539, 0.4635698, 0.1955747, 0.8470588, 0, 1, 1,
0.9232263, 0.4764973, 1.142702, 0.854902, 0, 1, 1,
0.9270645, -0.6126668, 0.3379486, 0.8588235, 0, 1, 1,
0.9298525, 2.396042, -0.05916657, 0.8666667, 0, 1, 1,
0.9308581, 0.6001135, 1.209368, 0.8705882, 0, 1, 1,
0.9320056, -0.7206219, 1.83919, 0.8784314, 0, 1, 1,
0.9339654, -0.2899813, 1.716559, 0.8823529, 0, 1, 1,
0.9441538, -0.3060926, 1.92451, 0.8901961, 0, 1, 1,
0.9460955, 0.2348, 2.633168, 0.8941177, 0, 1, 1,
0.9468973, -0.03037916, 1.38056, 0.9019608, 0, 1, 1,
0.9495875, 1.190871, -0.439611, 0.9098039, 0, 1, 1,
0.9551263, -0.4975933, 1.589686, 0.9137255, 0, 1, 1,
0.9631974, 0.1488738, 1.265954, 0.9215686, 0, 1, 1,
0.9681208, 1.121536, -0.1619867, 0.9254902, 0, 1, 1,
0.9691309, -2.095829, 1.749286, 0.9333333, 0, 1, 1,
0.9694642, 1.395881, 0.7661121, 0.9372549, 0, 1, 1,
0.9750665, 0.9622971, -0.2096912, 0.945098, 0, 1, 1,
0.983488, 0.7361876, 0.8221777, 0.9490196, 0, 1, 1,
0.9841405, -0.3730036, 2.953548, 0.9568627, 0, 1, 1,
0.9964146, -1.047337, 3.737788, 0.9607843, 0, 1, 1,
0.9966331, 1.049307, 0.6020646, 0.9686275, 0, 1, 1,
1.007775, -0.8215255, 2.387653, 0.972549, 0, 1, 1,
1.009968, -0.1993024, 3.333642, 0.9803922, 0, 1, 1,
1.020195, 1.030872, 0.3515681, 0.9843137, 0, 1, 1,
1.026748, 0.1579516, 0.3669846, 0.9921569, 0, 1, 1,
1.036512, -0.3159568, -0.3359545, 0.9960784, 0, 1, 1,
1.036892, 0.408294, 2.125643, 1, 0, 0.9960784, 1,
1.043823, 2.111449, -0.8119817, 1, 0, 0.9882353, 1,
1.044848, -0.36054, 1.112155, 1, 0, 0.9843137, 1,
1.047001, 1.053052, 2.792939, 1, 0, 0.9764706, 1,
1.049989, -1.193765, 3.550564, 1, 0, 0.972549, 1,
1.057911, 1.764131, 1.17511, 1, 0, 0.9647059, 1,
1.059214, 0.02595001, 1.304882, 1, 0, 0.9607843, 1,
1.061047, -3.275965, 3.573506, 1, 0, 0.9529412, 1,
1.06423, -1.791723, 4.250832, 1, 0, 0.9490196, 1,
1.064718, -0.6101142, 0.281501, 1, 0, 0.9411765, 1,
1.064817, 0.7553238, 0.5580819, 1, 0, 0.9372549, 1,
1.067595, -0.0829854, 1.79237, 1, 0, 0.9294118, 1,
1.070848, 0.1697703, 0.6200742, 1, 0, 0.9254902, 1,
1.072907, 0.9512099, 1.155968, 1, 0, 0.9176471, 1,
1.080339, -0.1589027, 3.632657, 1, 0, 0.9137255, 1,
1.082654, 0.06103088, 1.672817, 1, 0, 0.9058824, 1,
1.09017, -0.5438575, 2.955419, 1, 0, 0.9019608, 1,
1.096051, 0.3818668, 1.250843, 1, 0, 0.8941177, 1,
1.09718, -0.2408019, 0.8251527, 1, 0, 0.8862745, 1,
1.09923, 1.10869, 1.002221, 1, 0, 0.8823529, 1,
1.101167, -0.8552342, 2.587586, 1, 0, 0.8745098, 1,
1.115967, -1.318935, 2.505584, 1, 0, 0.8705882, 1,
1.130142, -0.5051322, 1.006509, 1, 0, 0.8627451, 1,
1.133366, -1.520259, 1.299741, 1, 0, 0.8588235, 1,
1.135481, 0.3291859, 1.541081, 1, 0, 0.8509804, 1,
1.136984, 1.302428, -0.4561773, 1, 0, 0.8470588, 1,
1.139372, -1.205607, 3.702092, 1, 0, 0.8392157, 1,
1.144248, 1.044447, 1.55717, 1, 0, 0.8352941, 1,
1.144848, -1.504083, 2.525106, 1, 0, 0.827451, 1,
1.151813, -0.1873151, 1.864394, 1, 0, 0.8235294, 1,
1.175162, 0.7464801, 3.172982, 1, 0, 0.8156863, 1,
1.182204, -1.146915, 0.5857524, 1, 0, 0.8117647, 1,
1.189299, -0.8385614, 2.686274, 1, 0, 0.8039216, 1,
1.192664, -1.387707, 2.707994, 1, 0, 0.7960784, 1,
1.201098, -0.3166842, 0.8948225, 1, 0, 0.7921569, 1,
1.205915, -1.663197, 3.417692, 1, 0, 0.7843137, 1,
1.206058, 0.8726316, 0.484073, 1, 0, 0.7803922, 1,
1.209998, 0.1286125, 1.601362, 1, 0, 0.772549, 1,
1.210536, -0.8804905, 2.660963, 1, 0, 0.7686275, 1,
1.214705, -0.1013051, 1.761325, 1, 0, 0.7607843, 1,
1.216861, 0.4025264, 2.133539, 1, 0, 0.7568628, 1,
1.220232, -2.14573, 2.934992, 1, 0, 0.7490196, 1,
1.222286, 2.293242, 1.040489, 1, 0, 0.7450981, 1,
1.227734, -1.372908, 2.788797, 1, 0, 0.7372549, 1,
1.229287, -0.3226742, 2.193995, 1, 0, 0.7333333, 1,
1.229343, -0.2708319, 2.085115, 1, 0, 0.7254902, 1,
1.239065, -0.3241373, 2.477519, 1, 0, 0.7215686, 1,
1.244515, 1.274243, -0.3595431, 1, 0, 0.7137255, 1,
1.24789, 0.04461358, 1.250662, 1, 0, 0.7098039, 1,
1.251476, 1.190012, 0.3936478, 1, 0, 0.7019608, 1,
1.256606, -0.5569306, 2.654198, 1, 0, 0.6941177, 1,
1.26083, 1.02275, 1.855834, 1, 0, 0.6901961, 1,
1.262972, -0.09863438, 2.177175, 1, 0, 0.682353, 1,
1.263112, -0.5734712, 3.113194, 1, 0, 0.6784314, 1,
1.265018, -0.3004788, 1.53897, 1, 0, 0.6705883, 1,
1.26934, 0.002672249, 1.817453, 1, 0, 0.6666667, 1,
1.273713, -0.2227947, 1.838259, 1, 0, 0.6588235, 1,
1.282997, 0.9071628, -0.003360524, 1, 0, 0.654902, 1,
1.287456, 0.06047925, 0.5772059, 1, 0, 0.6470588, 1,
1.289985, 0.2783107, 2.106311, 1, 0, 0.6431373, 1,
1.294389, -0.1706537, 3.416905, 1, 0, 0.6352941, 1,
1.301762, -2.064914, 2.83942, 1, 0, 0.6313726, 1,
1.301871, -0.4576913, 2.302202, 1, 0, 0.6235294, 1,
1.313948, -1.234039, 3.645083, 1, 0, 0.6196079, 1,
1.325675, -1.759005, 1.016299, 1, 0, 0.6117647, 1,
1.327187, 1.913988, 0.2281394, 1, 0, 0.6078432, 1,
1.328007, 0.799256, 0.894608, 1, 0, 0.6, 1,
1.332343, -0.6684378, 2.000022, 1, 0, 0.5921569, 1,
1.335296, -0.189293, 1.71006, 1, 0, 0.5882353, 1,
1.342939, -0.6400836, 1.098301, 1, 0, 0.5803922, 1,
1.343873, -0.2002209, 1.374695, 1, 0, 0.5764706, 1,
1.344967, 0.3929808, 1.127236, 1, 0, 0.5686275, 1,
1.351345, 0.768348, 3.485136, 1, 0, 0.5647059, 1,
1.358614, 0.1775411, 1.303704, 1, 0, 0.5568628, 1,
1.370102, 0.6568615, 2.558745, 1, 0, 0.5529412, 1,
1.386729, 1.689568, -0.2325976, 1, 0, 0.5450981, 1,
1.38789, 1.157818, 0.5160615, 1, 0, 0.5411765, 1,
1.388121, 1.434483, 0.5528048, 1, 0, 0.5333334, 1,
1.389704, 0.02474842, 1.59544, 1, 0, 0.5294118, 1,
1.394259, 0.2386476, 3.185935, 1, 0, 0.5215687, 1,
1.397218, 0.4254791, 1.304632, 1, 0, 0.5176471, 1,
1.397812, 0.688422, 0.9885778, 1, 0, 0.509804, 1,
1.399235, -0.638193, 0.8671983, 1, 0, 0.5058824, 1,
1.405633, 0.2211496, 2.298217, 1, 0, 0.4980392, 1,
1.407688, 0.5517105, 0.824881, 1, 0, 0.4901961, 1,
1.411932, 1.173115, -1.576647, 1, 0, 0.4862745, 1,
1.417694, 0.3811001, 0.09538096, 1, 0, 0.4784314, 1,
1.423516, 1.253251, 2.373054, 1, 0, 0.4745098, 1,
1.437475, 0.6164879, -0.06836782, 1, 0, 0.4666667, 1,
1.439273, 0.04203764, 1.080148, 1, 0, 0.4627451, 1,
1.457782, 1.164196, 1.905484, 1, 0, 0.454902, 1,
1.470921, -1.034595, 2.14194, 1, 0, 0.4509804, 1,
1.478193, -1.520787, 1.323917, 1, 0, 0.4431373, 1,
1.495305, -1.728936, 1.412041, 1, 0, 0.4392157, 1,
1.498712, 0.5445623, 1.048903, 1, 0, 0.4313726, 1,
1.531336, 0.741745, 1.759995, 1, 0, 0.427451, 1,
1.535441, -0.1456443, 2.404122, 1, 0, 0.4196078, 1,
1.540243, 0.2419265, 2.4307, 1, 0, 0.4156863, 1,
1.541613, -0.559245, 2.387159, 1, 0, 0.4078431, 1,
1.544976, -0.2423714, 1.211012, 1, 0, 0.4039216, 1,
1.545558, -1.006764, 0.7046391, 1, 0, 0.3960784, 1,
1.546273, -0.6425182, 2.655669, 1, 0, 0.3882353, 1,
1.547675, 0.3090417, 0.5527815, 1, 0, 0.3843137, 1,
1.547918, -0.2761871, 0.8973511, 1, 0, 0.3764706, 1,
1.549762, 0.178133, 3.890802, 1, 0, 0.372549, 1,
1.557744, -1.660874, 2.539392, 1, 0, 0.3647059, 1,
1.571454, -1.238478, 2.335919, 1, 0, 0.3607843, 1,
1.572805, 0.9163667, -0.04139772, 1, 0, 0.3529412, 1,
1.573287, 0.571351, 0.7297919, 1, 0, 0.3490196, 1,
1.579058, 0.1040343, 0.8486572, 1, 0, 0.3411765, 1,
1.582598, -1.525887, 4.964549, 1, 0, 0.3372549, 1,
1.585106, -0.309447, 1.812403, 1, 0, 0.3294118, 1,
1.598749, 0.2310474, 2.94611, 1, 0, 0.3254902, 1,
1.599099, 0.4908786, 1.622194, 1, 0, 0.3176471, 1,
1.600439, -0.4684005, 0.8917198, 1, 0, 0.3137255, 1,
1.6067, -0.08508967, 1.557032, 1, 0, 0.3058824, 1,
1.61451, 1.862073, 0.6361114, 1, 0, 0.2980392, 1,
1.627683, -0.3814721, 2.857591, 1, 0, 0.2941177, 1,
1.64405, 1.440022, -0.4262511, 1, 0, 0.2862745, 1,
1.648868, -1.005055, 1.82681, 1, 0, 0.282353, 1,
1.663329, -0.8796495, 3.261179, 1, 0, 0.2745098, 1,
1.697294, -0.8150826, 2.133801, 1, 0, 0.2705882, 1,
1.707683, 0.04193934, 2.348727, 1, 0, 0.2627451, 1,
1.71023, 1.286459, 1.052471, 1, 0, 0.2588235, 1,
1.713127, 1.549586, 1.366367, 1, 0, 0.2509804, 1,
1.734799, 0.6316668, -0.03972757, 1, 0, 0.2470588, 1,
1.743514, 0.008464503, 0.9490931, 1, 0, 0.2392157, 1,
1.754613, 1.081562, 1.679883, 1, 0, 0.2352941, 1,
1.782314, -0.9733168, 1.755501, 1, 0, 0.227451, 1,
1.809923, -1.074757, 1.673972, 1, 0, 0.2235294, 1,
1.81115, 1.647988, 1.225629, 1, 0, 0.2156863, 1,
1.811308, -0.3680691, 2.817405, 1, 0, 0.2117647, 1,
1.820209, -1.545066, 1.741791, 1, 0, 0.2039216, 1,
1.834008, -0.1154244, 2.506643, 1, 0, 0.1960784, 1,
1.836607, 0.1255936, 0.5940452, 1, 0, 0.1921569, 1,
1.839213, 0.7120875, 2.718465, 1, 0, 0.1843137, 1,
1.839484, -0.3910989, 0.6726335, 1, 0, 0.1803922, 1,
1.848928, 0.4579997, -0.1016344, 1, 0, 0.172549, 1,
1.871002, 2.530329, 0.8903869, 1, 0, 0.1686275, 1,
1.88251, 1.266435, 2.08428, 1, 0, 0.1607843, 1,
1.890856, -0.1779546, 1.927685, 1, 0, 0.1568628, 1,
1.892398, -0.6975427, 1.446608, 1, 0, 0.1490196, 1,
1.899471, 0.4981433, 2.187309, 1, 0, 0.145098, 1,
1.904366, 0.6166695, 0.6773307, 1, 0, 0.1372549, 1,
1.995869, 0.6925601, 1.880837, 1, 0, 0.1333333, 1,
1.997872, -1.465263, 3.266638, 1, 0, 0.1254902, 1,
1.998719, -0.5493806, 2.07982, 1, 0, 0.1215686, 1,
2.048589, 0.07053781, 1.671414, 1, 0, 0.1137255, 1,
2.090478, 1.102698, -0.2644016, 1, 0, 0.1098039, 1,
2.157678, 0.1638487, -0.1959163, 1, 0, 0.1019608, 1,
2.212948, -0.3823972, 2.526139, 1, 0, 0.09411765, 1,
2.217755, 0.1900359, 2.730451, 1, 0, 0.09019608, 1,
2.245046, 0.4399266, 1.958122, 1, 0, 0.08235294, 1,
2.254492, 0.1134159, 1.999833, 1, 0, 0.07843138, 1,
2.282714, 1.08375, 0.4877112, 1, 0, 0.07058824, 1,
2.358458, 0.531128, 0.6523628, 1, 0, 0.06666667, 1,
2.372831, -0.4454097, 2.551442, 1, 0, 0.05882353, 1,
2.385599, 0.6504357, 0.5991936, 1, 0, 0.05490196, 1,
2.415072, -1.0695, 1.866337, 1, 0, 0.04705882, 1,
2.429298, 0.1708681, 1.393126, 1, 0, 0.04313726, 1,
2.541693, -1.166232, 2.102918, 1, 0, 0.03529412, 1,
2.574698, -1.367486, 2.574028, 1, 0, 0.03137255, 1,
2.604438, 0.8263165, -0.001549669, 1, 0, 0.02352941, 1,
2.638243, 1.595245, 0.07545373, 1, 0, 0.01960784, 1,
2.759519, 0.0812942, 0.441534, 1, 0, 0.01176471, 1,
3.180456, 0.09571733, 3.347941, 1, 0, 0.007843138, 1
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
0.09849691, -4.344895, -8.772328, 0, -0.5, 0.5, 0.5,
0.09849691, -4.344895, -8.772328, 1, -0.5, 0.5, 0.5,
0.09849691, -4.344895, -8.772328, 1, 1.5, 0.5, 0.5,
0.09849691, -4.344895, -8.772328, 0, 1.5, 0.5, 0.5
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
-4.028246, -0.1227789, -8.772328, 0, -0.5, 0.5, 0.5,
-4.028246, -0.1227789, -8.772328, 1, -0.5, 0.5, 0.5,
-4.028246, -0.1227789, -8.772328, 1, 1.5, 0.5, 0.5,
-4.028246, -0.1227789, -8.772328, 0, 1.5, 0.5, 0.5
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
-4.028246, -4.344895, -0.9084213, 0, -0.5, 0.5, 0.5,
-4.028246, -4.344895, -0.9084213, 1, -0.5, 0.5, 0.5,
-4.028246, -4.344895, -0.9084213, 1, 1.5, 0.5, 0.5,
-4.028246, -4.344895, -0.9084213, 0, 1.5, 0.5, 0.5
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
-2, -3.37056, -6.95758,
3, -3.37056, -6.95758,
-2, -3.37056, -6.95758,
-2, -3.532949, -7.260038,
-1, -3.37056, -6.95758,
-1, -3.532949, -7.260038,
0, -3.37056, -6.95758,
0, -3.532949, -7.260038,
1, -3.37056, -6.95758,
1, -3.532949, -7.260038,
2, -3.37056, -6.95758,
2, -3.532949, -7.260038,
3, -3.37056, -6.95758,
3, -3.532949, -7.260038
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
-2, -3.857728, -7.864954, 0, -0.5, 0.5, 0.5,
-2, -3.857728, -7.864954, 1, -0.5, 0.5, 0.5,
-2, -3.857728, -7.864954, 1, 1.5, 0.5, 0.5,
-2, -3.857728, -7.864954, 0, 1.5, 0.5, 0.5,
-1, -3.857728, -7.864954, 0, -0.5, 0.5, 0.5,
-1, -3.857728, -7.864954, 1, -0.5, 0.5, 0.5,
-1, -3.857728, -7.864954, 1, 1.5, 0.5, 0.5,
-1, -3.857728, -7.864954, 0, 1.5, 0.5, 0.5,
0, -3.857728, -7.864954, 0, -0.5, 0.5, 0.5,
0, -3.857728, -7.864954, 1, -0.5, 0.5, 0.5,
0, -3.857728, -7.864954, 1, 1.5, 0.5, 0.5,
0, -3.857728, -7.864954, 0, 1.5, 0.5, 0.5,
1, -3.857728, -7.864954, 0, -0.5, 0.5, 0.5,
1, -3.857728, -7.864954, 1, -0.5, 0.5, 0.5,
1, -3.857728, -7.864954, 1, 1.5, 0.5, 0.5,
1, -3.857728, -7.864954, 0, 1.5, 0.5, 0.5,
2, -3.857728, -7.864954, 0, -0.5, 0.5, 0.5,
2, -3.857728, -7.864954, 1, -0.5, 0.5, 0.5,
2, -3.857728, -7.864954, 1, 1.5, 0.5, 0.5,
2, -3.857728, -7.864954, 0, 1.5, 0.5, 0.5,
3, -3.857728, -7.864954, 0, -0.5, 0.5, 0.5,
3, -3.857728, -7.864954, 1, -0.5, 0.5, 0.5,
3, -3.857728, -7.864954, 1, 1.5, 0.5, 0.5,
3, -3.857728, -7.864954, 0, 1.5, 0.5, 0.5
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
-3.075921, -3, -6.95758,
-3.075921, 3, -6.95758,
-3.075921, -3, -6.95758,
-3.234642, -3, -7.260038,
-3.075921, -2, -6.95758,
-3.234642, -2, -7.260038,
-3.075921, -1, -6.95758,
-3.234642, -1, -7.260038,
-3.075921, 0, -6.95758,
-3.234642, 0, -7.260038,
-3.075921, 1, -6.95758,
-3.234642, 1, -7.260038,
-3.075921, 2, -6.95758,
-3.234642, 2, -7.260038,
-3.075921, 3, -6.95758,
-3.234642, 3, -7.260038
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
-3.552084, -3, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, -3, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, -3, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, -3, -7.864954, 0, 1.5, 0.5, 0.5,
-3.552084, -2, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, -2, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, -2, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, -2, -7.864954, 0, 1.5, 0.5, 0.5,
-3.552084, -1, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, -1, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, -1, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, -1, -7.864954, 0, 1.5, 0.5, 0.5,
-3.552084, 0, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, 0, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, 0, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, 0, -7.864954, 0, 1.5, 0.5, 0.5,
-3.552084, 1, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, 1, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, 1, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, 1, -7.864954, 0, 1.5, 0.5, 0.5,
-3.552084, 2, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, 2, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, 2, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, 2, -7.864954, 0, 1.5, 0.5, 0.5,
-3.552084, 3, -7.864954, 0, -0.5, 0.5, 0.5,
-3.552084, 3, -7.864954, 1, -0.5, 0.5, 0.5,
-3.552084, 3, -7.864954, 1, 1.5, 0.5, 0.5,
-3.552084, 3, -7.864954, 0, 1.5, 0.5, 0.5
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
-3.075921, -3.37056, -6,
-3.075921, -3.37056, 4,
-3.075921, -3.37056, -6,
-3.234642, -3.532949, -6,
-3.075921, -3.37056, -4,
-3.234642, -3.532949, -4,
-3.075921, -3.37056, -2,
-3.234642, -3.532949, -2,
-3.075921, -3.37056, 0,
-3.234642, -3.532949, 0,
-3.075921, -3.37056, 2,
-3.234642, -3.532949, 2,
-3.075921, -3.37056, 4,
-3.234642, -3.532949, 4
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
-3.552084, -3.857728, -6, 0, -0.5, 0.5, 0.5,
-3.552084, -3.857728, -6, 1, -0.5, 0.5, 0.5,
-3.552084, -3.857728, -6, 1, 1.5, 0.5, 0.5,
-3.552084, -3.857728, -6, 0, 1.5, 0.5, 0.5,
-3.552084, -3.857728, -4, 0, -0.5, 0.5, 0.5,
-3.552084, -3.857728, -4, 1, -0.5, 0.5, 0.5,
-3.552084, -3.857728, -4, 1, 1.5, 0.5, 0.5,
-3.552084, -3.857728, -4, 0, 1.5, 0.5, 0.5,
-3.552084, -3.857728, -2, 0, -0.5, 0.5, 0.5,
-3.552084, -3.857728, -2, 1, -0.5, 0.5, 0.5,
-3.552084, -3.857728, -2, 1, 1.5, 0.5, 0.5,
-3.552084, -3.857728, -2, 0, 1.5, 0.5, 0.5,
-3.552084, -3.857728, 0, 0, -0.5, 0.5, 0.5,
-3.552084, -3.857728, 0, 1, -0.5, 0.5, 0.5,
-3.552084, -3.857728, 0, 1, 1.5, 0.5, 0.5,
-3.552084, -3.857728, 0, 0, 1.5, 0.5, 0.5,
-3.552084, -3.857728, 2, 0, -0.5, 0.5, 0.5,
-3.552084, -3.857728, 2, 1, -0.5, 0.5, 0.5,
-3.552084, -3.857728, 2, 1, 1.5, 0.5, 0.5,
-3.552084, -3.857728, 2, 0, 1.5, 0.5, 0.5,
-3.552084, -3.857728, 4, 0, -0.5, 0.5, 0.5,
-3.552084, -3.857728, 4, 1, -0.5, 0.5, 0.5,
-3.552084, -3.857728, 4, 1, 1.5, 0.5, 0.5,
-3.552084, -3.857728, 4, 0, 1.5, 0.5, 0.5
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
-3.075921, -3.37056, -6.95758,
-3.075921, 3.125003, -6.95758,
-3.075921, -3.37056, 5.140738,
-3.075921, 3.125003, 5.140738,
-3.075921, -3.37056, -6.95758,
-3.075921, -3.37056, 5.140738,
-3.075921, 3.125003, -6.95758,
-3.075921, 3.125003, 5.140738,
-3.075921, -3.37056, -6.95758,
3.272915, -3.37056, -6.95758,
-3.075921, -3.37056, 5.140738,
3.272915, -3.37056, 5.140738,
-3.075921, 3.125003, -6.95758,
3.272915, 3.125003, -6.95758,
-3.075921, 3.125003, 5.140738,
3.272915, 3.125003, 5.140738,
3.272915, -3.37056, -6.95758,
3.272915, 3.125003, -6.95758,
3.272915, -3.37056, 5.140738,
3.272915, 3.125003, 5.140738,
3.272915, -3.37056, -6.95758,
3.272915, -3.37056, 5.140738,
3.272915, 3.125003, -6.95758,
3.272915, 3.125003, 5.140738
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
var radius = 8.078287;
var distance = 35.94121;
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
mvMatrix.translate( -0.09849691, 0.1227789, 0.9084213 );
mvMatrix.scale( 1.375749, 1.344672, 0.7219518 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.94121);
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
fenoxaprop-P<-read.table("fenoxaprop-P.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenoxaprop-P$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
y<-fenoxaprop-P$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
z<-fenoxaprop-P$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
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
-2.983462, 0.4243597, -1.274025, 0, 0, 1, 1, 1,
-2.945555, 2.213867, -2.14408, 1, 0, 0, 1, 1,
-2.759563, 0.2719483, -1.528692, 1, 0, 0, 1, 1,
-2.606184, 0.04416782, -2.43023, 1, 0, 0, 1, 1,
-2.545597, 0.1170493, -1.462496, 1, 0, 0, 1, 1,
-2.529124, -0.1314973, -2.437628, 1, 0, 0, 1, 1,
-2.516218, -1.823494, -1.513898, 0, 0, 0, 1, 1,
-2.507223, 0.2077596, -1.717072, 0, 0, 0, 1, 1,
-2.369367, 0.2536545, -0.533486, 0, 0, 0, 1, 1,
-2.340023, -1.506269, -3.251749, 0, 0, 0, 1, 1,
-2.30415, 0.06079846, -1.728501, 0, 0, 0, 1, 1,
-2.29925, 0.775992, -1.3729, 0, 0, 0, 1, 1,
-2.278292, 0.3296642, -1.278725, 0, 0, 0, 1, 1,
-2.269283, -0.2622631, -2.803102, 1, 1, 1, 1, 1,
-2.265062, -0.7968991, -1.859543, 1, 1, 1, 1, 1,
-2.225965, -0.2611633, 0.1893185, 1, 1, 1, 1, 1,
-2.16899, -1.390118, -3.18866, 1, 1, 1, 1, 1,
-2.096219, -2.107305, -3.339936, 1, 1, 1, 1, 1,
-2.074636, -0.2464871, -3.111942, 1, 1, 1, 1, 1,
-2.046813, 0.9464979, 0.003630493, 1, 1, 1, 1, 1,
-2.041741, -0.7900415, -2.924755, 1, 1, 1, 1, 1,
-2.040768, -0.979551, -1.279253, 1, 1, 1, 1, 1,
-1.97131, 1.229176, -0.5981513, 1, 1, 1, 1, 1,
-1.920363, 1.727714, -1.700996, 1, 1, 1, 1, 1,
-1.918037, 0.02867678, -1.140021, 1, 1, 1, 1, 1,
-1.908581, 0.7849784, -1.09609, 1, 1, 1, 1, 1,
-1.889858, 1.636191, -0.2739782, 1, 1, 1, 1, 1,
-1.877543, -0.2598083, -2.154931, 1, 1, 1, 1, 1,
-1.85506, 0.02299544, -0.9161972, 0, 0, 1, 1, 1,
-1.845187, -1.112696, -2.763759, 1, 0, 0, 1, 1,
-1.83728, -1.940253, -3.491825, 1, 0, 0, 1, 1,
-1.816081, -1.054133, -0.7479001, 1, 0, 0, 1, 1,
-1.814155, -0.1673322, -0.07094336, 1, 0, 0, 1, 1,
-1.787217, 0.009496807, -0.5870786, 1, 0, 0, 1, 1,
-1.778621, 0.1159247, -1.7797, 0, 0, 0, 1, 1,
-1.771602, 0.9070703, -0.5030429, 0, 0, 0, 1, 1,
-1.747186, -0.8942366, -2.082895, 0, 0, 0, 1, 1,
-1.74158, -0.1513907, -1.355159, 0, 0, 0, 1, 1,
-1.734479, 1.469892, -2.055107, 0, 0, 0, 1, 1,
-1.726655, 1.319169, -1.331588, 0, 0, 0, 1, 1,
-1.718441, 1.388002, -2.635257, 0, 0, 0, 1, 1,
-1.702548, -0.8811314, -3.239151, 1, 1, 1, 1, 1,
-1.693084, -1.253806, -3.094624, 1, 1, 1, 1, 1,
-1.6922, 0.8403889, -0.7931559, 1, 1, 1, 1, 1,
-1.686757, 1.309888, 0.2024761, 1, 1, 1, 1, 1,
-1.671968, 1.756435, -0.4397832, 1, 1, 1, 1, 1,
-1.668802, 1.647811, -1.018731, 1, 1, 1, 1, 1,
-1.660367, -0.6651466, -3.004014, 1, 1, 1, 1, 1,
-1.65856, 2.407224, -0.5042931, 1, 1, 1, 1, 1,
-1.651004, 1.345741, 0.4969797, 1, 1, 1, 1, 1,
-1.636382, 1.462366, -1.211766, 1, 1, 1, 1, 1,
-1.62731, -0.1734577, -1.035715, 1, 1, 1, 1, 1,
-1.603703, -0.4068004, -1.993826, 1, 1, 1, 1, 1,
-1.599299, -0.401687, -1.25365, 1, 1, 1, 1, 1,
-1.595258, -1.421624, -3.114198, 1, 1, 1, 1, 1,
-1.590776, 1.828012, -0.3216442, 1, 1, 1, 1, 1,
-1.587101, 2.485702, -1.415722, 0, 0, 1, 1, 1,
-1.582645, 0.3638998, -0.7801455, 1, 0, 0, 1, 1,
-1.579566, 0.8265284, -1.300945, 1, 0, 0, 1, 1,
-1.575458, -1.710092, -2.047748, 1, 0, 0, 1, 1,
-1.572564, 1.122111, 0.3873985, 1, 0, 0, 1, 1,
-1.572152, -1.07177, -2.676871, 1, 0, 0, 1, 1,
-1.560196, -0.102368, 0.1530171, 0, 0, 0, 1, 1,
-1.554969, -0.6950156, -2.426982, 0, 0, 0, 1, 1,
-1.554617, 0.1642012, -2.165695, 0, 0, 0, 1, 1,
-1.549843, -0.3685751, 0.3337537, 0, 0, 0, 1, 1,
-1.543762, 0.5724093, -1.255986, 0, 0, 0, 1, 1,
-1.538322, -0.7744901, -1.188417, 0, 0, 0, 1, 1,
-1.516427, 0.3493437, 1.290729, 0, 0, 0, 1, 1,
-1.515444, 0.1949982, -1.106715, 1, 1, 1, 1, 1,
-1.514263, 1.070235, -0.4554355, 1, 1, 1, 1, 1,
-1.503753, 0.1580067, -3.809047, 1, 1, 1, 1, 1,
-1.489506, 1.277116, -1.763685, 1, 1, 1, 1, 1,
-1.472749, 1.250054, -0.6320944, 1, 1, 1, 1, 1,
-1.471096, 2.089581, -0.6301959, 1, 1, 1, 1, 1,
-1.470567, 0.6765283, -1.388327, 1, 1, 1, 1, 1,
-1.457711, -1.250268, -1.707815, 1, 1, 1, 1, 1,
-1.448303, 0.5066879, -2.824168, 1, 1, 1, 1, 1,
-1.441849, -1.831558, -1.222563, 1, 1, 1, 1, 1,
-1.436024, -0.4740053, -4.02916, 1, 1, 1, 1, 1,
-1.434975, 0.4140695, -1.050675, 1, 1, 1, 1, 1,
-1.429266, -0.5790596, -0.5549164, 1, 1, 1, 1, 1,
-1.422512, -1.315015, -1.309229, 1, 1, 1, 1, 1,
-1.40853, -0.04978357, -3.909306, 1, 1, 1, 1, 1,
-1.393107, -0.8363783, -2.888075, 0, 0, 1, 1, 1,
-1.389542, -0.4348246, -2.715243, 1, 0, 0, 1, 1,
-1.38734, -0.8280905, -3.655963, 1, 0, 0, 1, 1,
-1.383561, 0.4228874, -1.669453, 1, 0, 0, 1, 1,
-1.380352, 0.1241326, -1.198743, 1, 0, 0, 1, 1,
-1.379465, 0.103222, -1.335578, 1, 0, 0, 1, 1,
-1.373299, 0.7378569, -1.901611, 0, 0, 0, 1, 1,
-1.371181, -0.1006329, -1.052269, 0, 0, 0, 1, 1,
-1.365706, 1.043957, -0.7522243, 0, 0, 0, 1, 1,
-1.364595, -1.755248, -1.854764, 0, 0, 0, 1, 1,
-1.361259, -0.8051856, -1.435381, 0, 0, 0, 1, 1,
-1.359112, 0.2244757, -0.07312308, 0, 0, 0, 1, 1,
-1.353068, -1.520522, -1.711144, 0, 0, 0, 1, 1,
-1.34919, 0.1005334, -2.905452, 1, 1, 1, 1, 1,
-1.341995, 1.24633, -0.2739455, 1, 1, 1, 1, 1,
-1.340924, 1.243657, 0.7755634, 1, 1, 1, 1, 1,
-1.337329, 0.9352669, -2.904297, 1, 1, 1, 1, 1,
-1.329868, -0.9417382, -2.516255, 1, 1, 1, 1, 1,
-1.32784, 0.6578366, -1.144639, 1, 1, 1, 1, 1,
-1.326057, -0.3442887, -1.986267, 1, 1, 1, 1, 1,
-1.322664, -0.3692716, -1.583281, 1, 1, 1, 1, 1,
-1.319248, 0.08672867, -1.627889, 1, 1, 1, 1, 1,
-1.313923, 1.407084, -1.525968, 1, 1, 1, 1, 1,
-1.312556, 1.158063, -1.94776, 1, 1, 1, 1, 1,
-1.294259, -0.5340806, -1.642926, 1, 1, 1, 1, 1,
-1.287967, -0.6844098, -0.3349059, 1, 1, 1, 1, 1,
-1.278003, 1.373969, -0.2741626, 1, 1, 1, 1, 1,
-1.274388, 0.0929811, -0.8537447, 1, 1, 1, 1, 1,
-1.271474, -2.598043, -2.443791, 0, 0, 1, 1, 1,
-1.260835, -1.735324, -2.820897, 1, 0, 0, 1, 1,
-1.259108, 0.1885446, -0.8502852, 1, 0, 0, 1, 1,
-1.257198, -2.221367, -3.71155, 1, 0, 0, 1, 1,
-1.238799, -0.7463337, -4.153989, 1, 0, 0, 1, 1,
-1.225824, -0.3750454, -2.858091, 1, 0, 0, 1, 1,
-1.220705, 0.7495345, -0.5149304, 0, 0, 0, 1, 1,
-1.217949, -0.1002201, -2.367221, 0, 0, 0, 1, 1,
-1.214786, -0.4582657, -2.494665, 0, 0, 0, 1, 1,
-1.209131, -1.251479, -3.599018, 0, 0, 0, 1, 1,
-1.202821, -0.9010385, -3.01064, 0, 0, 0, 1, 1,
-1.198145, 0.4087162, -2.245611, 0, 0, 0, 1, 1,
-1.19631, -1.379279, -2.138264, 0, 0, 0, 1, 1,
-1.188805, 1.31611, 0.3391171, 1, 1, 1, 1, 1,
-1.187679, 2.07164, -0.009310789, 1, 1, 1, 1, 1,
-1.185798, 0.0999566, -2.608042, 1, 1, 1, 1, 1,
-1.181865, -1.538168, -1.493039, 1, 1, 1, 1, 1,
-1.179702, 0.3620085, -0.2786721, 1, 1, 1, 1, 1,
-1.178816, -0.4369308, -2.353106, 1, 1, 1, 1, 1,
-1.17614, -0.2555197, -1.50381, 1, 1, 1, 1, 1,
-1.17019, 0.4814641, -2.458399, 1, 1, 1, 1, 1,
-1.167895, 1.769942, -0.8265897, 1, 1, 1, 1, 1,
-1.155089, -0.4338251, -1.742044, 1, 1, 1, 1, 1,
-1.154615, -0.309964, -2.323093, 1, 1, 1, 1, 1,
-1.152333, 0.4233834, -0.006346604, 1, 1, 1, 1, 1,
-1.148473, -0.143373, -2.565565, 1, 1, 1, 1, 1,
-1.147303, 0.2610441, -1.739586, 1, 1, 1, 1, 1,
-1.14608, 0.9185199, -1.207055, 1, 1, 1, 1, 1,
-1.136199, -0.424684, -2.639658, 0, 0, 1, 1, 1,
-1.121611, 1.482457, -0.8388755, 1, 0, 0, 1, 1,
-1.111965, -1.551262, -4.421039, 1, 0, 0, 1, 1,
-1.104055, -1.258834, -2.887983, 1, 0, 0, 1, 1,
-1.093462, -0.8362219, -2.047239, 1, 0, 0, 1, 1,
-1.087738, -0.724591, -2.212188, 1, 0, 0, 1, 1,
-1.085175, -0.9280807, -3.268452, 0, 0, 0, 1, 1,
-1.084454, -0.7177043, -1.561717, 0, 0, 0, 1, 1,
-1.083948, -0.1081005, -1.238293, 0, 0, 0, 1, 1,
-1.074892, 0.1503628, -0.6797403, 0, 0, 0, 1, 1,
-1.072395, 0.696347, -0.6506044, 0, 0, 0, 1, 1,
-1.070937, -1.479346, -0.9331322, 0, 0, 0, 1, 1,
-1.064777, -0.4643634, -3.05106, 0, 0, 0, 1, 1,
-1.063888, 0.5365345, -1.527452, 1, 1, 1, 1, 1,
-1.05702, -0.5199859, -1.371849, 1, 1, 1, 1, 1,
-1.054739, -1.049866, -2.633221, 1, 1, 1, 1, 1,
-1.053595, -1.981785, -1.860278, 1, 1, 1, 1, 1,
-1.05333, 1.173312, -0.2909338, 1, 1, 1, 1, 1,
-1.047698, 1.324206, -0.1335837, 1, 1, 1, 1, 1,
-1.041096, 0.2235837, -1.355939, 1, 1, 1, 1, 1,
-1.037753, -0.299751, -0.9153125, 1, 1, 1, 1, 1,
-1.03479, 0.5432982, -1.783324, 1, 1, 1, 1, 1,
-1.026587, 0.1119177, -2.100868, 1, 1, 1, 1, 1,
-1.018088, 3.030407, -1.892216, 1, 1, 1, 1, 1,
-1.016925, 1.072248, -0.8798156, 1, 1, 1, 1, 1,
-1.01276, 1.605806, -0.8634321, 1, 1, 1, 1, 1,
-1.009072, -1.878389, -3.043833, 1, 1, 1, 1, 1,
-1.008657, 0.4522314, -1.882899, 1, 1, 1, 1, 1,
-1.007223, -0.09820771, -2.123221, 0, 0, 1, 1, 1,
-1.005717, 0.6936945, -1.784232, 1, 0, 0, 1, 1,
-1.004378, 1.061298, 0.2977939, 1, 0, 0, 1, 1,
-0.9976256, -1.160619, -3.108205, 1, 0, 0, 1, 1,
-0.9963304, -0.7607208, -2.109709, 1, 0, 0, 1, 1,
-0.9921961, -0.6849201, -2.078621, 1, 0, 0, 1, 1,
-0.987155, 1.145927, 1.077293, 0, 0, 0, 1, 1,
-0.9859796, 2.079791, 0.8600507, 0, 0, 0, 1, 1,
-0.9839189, 1.402477, -1.805861, 0, 0, 0, 1, 1,
-0.9837416, -0.2188514, -0.4079276, 0, 0, 0, 1, 1,
-0.9799731, 1.297544, 1.92093, 0, 0, 0, 1, 1,
-0.9724382, -0.3007753, -2.828343, 0, 0, 0, 1, 1,
-0.9616845, -0.6506068, -0.5398638, 0, 0, 0, 1, 1,
-0.960106, -1.3143, -1.933788, 1, 1, 1, 1, 1,
-0.9534662, -0.3213317, -0.9464129, 1, 1, 1, 1, 1,
-0.9529709, 1.336041, 0.3749252, 1, 1, 1, 1, 1,
-0.9487455, -0.06356953, -1.672186, 1, 1, 1, 1, 1,
-0.9425524, 1.164841, -0.5830213, 1, 1, 1, 1, 1,
-0.9402356, 1.151769, -1.332417, 1, 1, 1, 1, 1,
-0.9275734, -0.2550648, -1.00334, 1, 1, 1, 1, 1,
-0.918103, 0.2812782, -0.7950073, 1, 1, 1, 1, 1,
-0.9171553, 0.4145078, -0.6830864, 1, 1, 1, 1, 1,
-0.9169973, 0.4029132, -1.478524, 1, 1, 1, 1, 1,
-0.9161189, 0.6080921, -0.8610453, 1, 1, 1, 1, 1,
-0.9144965, -0.638102, -1.096824, 1, 1, 1, 1, 1,
-0.9134535, -0.2483833, -2.322619, 1, 1, 1, 1, 1,
-0.912072, -0.1308825, -2.128671, 1, 1, 1, 1, 1,
-0.9092039, 1.388921, 0.2635457, 1, 1, 1, 1, 1,
-0.9082154, 0.4270954, -1.618712, 0, 0, 1, 1, 1,
-0.9037114, -0.8876373, -2.169202, 1, 0, 0, 1, 1,
-0.9010771, -0.2713297, -1.005686, 1, 0, 0, 1, 1,
-0.8997287, -0.2100401, -2.809279, 1, 0, 0, 1, 1,
-0.8976868, -0.3356349, 1.272463, 1, 0, 0, 1, 1,
-0.8930736, 0.2920512, -1.497583, 1, 0, 0, 1, 1,
-0.890265, 1.28449, -0.6321297, 0, 0, 0, 1, 1,
-0.8866827, 0.4275035, -0.6603773, 0, 0, 0, 1, 1,
-0.8863722, 0.9706699, 0.3802301, 0, 0, 0, 1, 1,
-0.8862697, -0.01000193, -0.4624427, 0, 0, 0, 1, 1,
-0.8764216, -0.265013, -2.758104, 0, 0, 0, 1, 1,
-0.8740525, 0.7335162, -1.174129, 0, 0, 0, 1, 1,
-0.8715472, 1.19482, -0.8664336, 0, 0, 0, 1, 1,
-0.8706614, 0.7954156, -2.032565, 1, 1, 1, 1, 1,
-0.8597936, -1.620254, -1.773591, 1, 1, 1, 1, 1,
-0.8582996, 1.048834, -1.430352, 1, 1, 1, 1, 1,
-0.8388797, 0.7696457, 0.2397238, 1, 1, 1, 1, 1,
-0.8312608, -0.1294741, -1.436285, 1, 1, 1, 1, 1,
-0.8308213, -0.7818119, -2.206753, 1, 1, 1, 1, 1,
-0.8240474, 0.523935, -0.3445567, 1, 1, 1, 1, 1,
-0.8184366, -0.8396754, -1.912285, 1, 1, 1, 1, 1,
-0.8139899, 0.2500415, -1.371823, 1, 1, 1, 1, 1,
-0.8131683, 0.6992503, -1.890799, 1, 1, 1, 1, 1,
-0.812273, 2.030819, -0.401116, 1, 1, 1, 1, 1,
-0.8100995, 1.891373, -2.255295, 1, 1, 1, 1, 1,
-0.8041538, 0.2253754, -2.023798, 1, 1, 1, 1, 1,
-0.8038104, 0.2997218, -0.1337542, 1, 1, 1, 1, 1,
-0.7991326, 0.4388904, -0.5189127, 1, 1, 1, 1, 1,
-0.7863658, 0.4222242, -2.229317, 0, 0, 1, 1, 1,
-0.782398, 0.7137753, -2.553545, 1, 0, 0, 1, 1,
-0.7779858, 1.054395, -0.0317738, 1, 0, 0, 1, 1,
-0.7778154, -0.2772033, -1.282389, 1, 0, 0, 1, 1,
-0.777764, 1.291551, -0.5318667, 1, 0, 0, 1, 1,
-0.7760352, 2.201933, -0.6521589, 1, 0, 0, 1, 1,
-0.7744502, 0.8204685, -0.6091737, 0, 0, 0, 1, 1,
-0.7740155, -0.0203648, -1.544897, 0, 0, 0, 1, 1,
-0.7718577, 1.520326, -1.200611, 0, 0, 0, 1, 1,
-0.7654885, -1.883979, -2.264312, 0, 0, 0, 1, 1,
-0.7646666, 2.297604, -1.081136, 0, 0, 0, 1, 1,
-0.7634932, 1.214225, -1.167135, 0, 0, 0, 1, 1,
-0.7618763, 1.389741, -0.02057305, 0, 0, 0, 1, 1,
-0.7566535, 2.376581, -1.588076, 1, 1, 1, 1, 1,
-0.7563577, -0.6224677, -2.301358, 1, 1, 1, 1, 1,
-0.7483171, -1.156161, -3.075044, 1, 1, 1, 1, 1,
-0.7469751, -0.7315911, -0.6137236, 1, 1, 1, 1, 1,
-0.7450263, 1.695247, 0.8087499, 1, 1, 1, 1, 1,
-0.7423468, -1.380132, -3.285108, 1, 1, 1, 1, 1,
-0.7391324, 0.9784013, 0.348984, 1, 1, 1, 1, 1,
-0.7368826, -0.3316466, -1.014404, 1, 1, 1, 1, 1,
-0.7352239, -0.5599239, -2.094203, 1, 1, 1, 1, 1,
-0.7333541, 1.468837, -2.458898, 1, 1, 1, 1, 1,
-0.7314782, 0.5594541, -2.013504, 1, 1, 1, 1, 1,
-0.7227324, -1.047819, -3.626093, 1, 1, 1, 1, 1,
-0.7204432, -0.5627655, -2.83253, 1, 1, 1, 1, 1,
-0.7190318, 1.886647, -0.4367076, 1, 1, 1, 1, 1,
-0.7130654, 2.38268, 1.440416, 1, 1, 1, 1, 1,
-0.7125373, -0.8978996, -2.523375, 0, 0, 1, 1, 1,
-0.7040762, 0.5962678, -0.4250944, 1, 0, 0, 1, 1,
-0.6986166, -2.433372, -2.07914, 1, 0, 0, 1, 1,
-0.6981508, -0.539522, -2.392754, 1, 0, 0, 1, 1,
-0.6963593, -0.3399996, -1.791399, 1, 0, 0, 1, 1,
-0.6952336, 1.646708, -0.7661095, 1, 0, 0, 1, 1,
-0.6908011, 1.673687, 0.795441, 0, 0, 0, 1, 1,
-0.6873313, -0.5225329, -2.333657, 0, 0, 0, 1, 1,
-0.6873209, 0.852748, -0.006198705, 0, 0, 0, 1, 1,
-0.6870339, -1.303681, -1.372411, 0, 0, 0, 1, 1,
-0.686902, -0.3155884, -3.037261, 0, 0, 0, 1, 1,
-0.6838768, 0.8106825, -1.944289, 0, 0, 0, 1, 1,
-0.6822512, 0.1703001, -1.203786, 0, 0, 0, 1, 1,
-0.675258, -0.4763325, -3.440535, 1, 1, 1, 1, 1,
-0.6707131, 1.799019, 0.4072801, 1, 1, 1, 1, 1,
-0.6654364, 0.5200664, -0.9925487, 1, 1, 1, 1, 1,
-0.6581678, -0.5302395, -2.006164, 1, 1, 1, 1, 1,
-0.655126, 1.46746, 0.2289907, 1, 1, 1, 1, 1,
-0.6534982, 0.2680087, -0.7515721, 1, 1, 1, 1, 1,
-0.6534075, -0.9341403, -2.99686, 1, 1, 1, 1, 1,
-0.6513579, 0.5188131, -2.890193, 1, 1, 1, 1, 1,
-0.6496789, 0.994843, -0.9703043, 1, 1, 1, 1, 1,
-0.640416, -1.271607, -2.961805, 1, 1, 1, 1, 1,
-0.6395791, 0.5014312, 0.03693679, 1, 1, 1, 1, 1,
-0.6385688, 0.7781524, -0.4523866, 1, 1, 1, 1, 1,
-0.6338372, 0.805119, 0.6418841, 1, 1, 1, 1, 1,
-0.6324351, 0.7880875, -0.07880311, 1, 1, 1, 1, 1,
-0.6284489, 1.711292, -0.389887, 1, 1, 1, 1, 1,
-0.6267949, -0.1302522, -2.176993, 0, 0, 1, 1, 1,
-0.6227878, 0.5025699, -1.174467, 1, 0, 0, 1, 1,
-0.622268, 0.03513741, -3.445737, 1, 0, 0, 1, 1,
-0.6191722, -0.2955524, -2.164366, 1, 0, 0, 1, 1,
-0.6137785, -0.2098089, -1.185812, 1, 0, 0, 1, 1,
-0.613508, -0.4090868, -0.8821313, 1, 0, 0, 1, 1,
-0.6134689, 0.9564571, -1.150031, 0, 0, 0, 1, 1,
-0.6134011, 0.1068911, -0.5900877, 0, 0, 0, 1, 1,
-0.6098341, 0.6340681, -0.8697994, 0, 0, 0, 1, 1,
-0.6094145, -1.732777, -3.385886, 0, 0, 0, 1, 1,
-0.6057857, 1.372366, -0.3782678, 0, 0, 0, 1, 1,
-0.6041299, 0.3480236, -0.2755955, 0, 0, 0, 1, 1,
-0.6034649, -0.7374417, -2.27578, 0, 0, 0, 1, 1,
-0.5990134, -0.6563559, -2.717429, 1, 1, 1, 1, 1,
-0.5989715, -0.2275467, -0.6740189, 1, 1, 1, 1, 1,
-0.5971457, 0.6119956, -2.181513, 1, 1, 1, 1, 1,
-0.5948025, 0.2298534, 0.7193503, 1, 1, 1, 1, 1,
-0.5902463, -0.4942709, -2.127847, 1, 1, 1, 1, 1,
-0.5805221, -1.557554, -4.069706, 1, 1, 1, 1, 1,
-0.5804743, -0.8963536, -1.338337, 1, 1, 1, 1, 1,
-0.5794806, -0.0003959255, -0.7520564, 1, 1, 1, 1, 1,
-0.5787314, 0.9252111, 1.180301, 1, 1, 1, 1, 1,
-0.5700203, 0.9464272, 0.9132478, 1, 1, 1, 1, 1,
-0.5613951, 0.4376533, -0.2377351, 1, 1, 1, 1, 1,
-0.5611351, 0.3538866, -0.3812186, 1, 1, 1, 1, 1,
-0.5573025, 0.2254829, -5.534502, 1, 1, 1, 1, 1,
-0.5551339, -0.8826212, -2.35185, 1, 1, 1, 1, 1,
-0.554298, -0.3074752, -3.330232, 1, 1, 1, 1, 1,
-0.5516191, 0.04555089, -3.118761, 0, 0, 1, 1, 1,
-0.5502651, -0.5306588, -2.798802, 1, 0, 0, 1, 1,
-0.5398425, -0.2687898, -1.485062, 1, 0, 0, 1, 1,
-0.5393605, -0.7417734, -3.953054, 1, 0, 0, 1, 1,
-0.5381666, 0.1854931, -1.267476, 1, 0, 0, 1, 1,
-0.5328169, -0.8134134, -5.193362, 1, 0, 0, 1, 1,
-0.5326846, -0.7861791, -1.208289, 0, 0, 0, 1, 1,
-0.5298667, 0.6173627, -1.68489, 0, 0, 0, 1, 1,
-0.5275241, 1.305833, 1.123037, 0, 0, 0, 1, 1,
-0.5255541, -1.236248, -3.884041, 0, 0, 0, 1, 1,
-0.5244697, 0.5775837, -1.091136, 0, 0, 0, 1, 1,
-0.5224626, -0.6183735, -1.694262, 0, 0, 0, 1, 1,
-0.520192, -0.9008221, -3.191157, 0, 0, 0, 1, 1,
-0.5093169, 0.3456153, -0.9347979, 1, 1, 1, 1, 1,
-0.4807617, -1.512906, -2.18696, 1, 1, 1, 1, 1,
-0.4745642, 0.7957413, 0.5264674, 1, 1, 1, 1, 1,
-0.4743747, -0.465927, -2.964894, 1, 1, 1, 1, 1,
-0.4735383, -0.8103487, -0.9916118, 1, 1, 1, 1, 1,
-0.4691984, -1.695381, -1.003502, 1, 1, 1, 1, 1,
-0.4672851, 0.551581, 1.07407, 1, 1, 1, 1, 1,
-0.4669671, -1.541278, -1.869127, 1, 1, 1, 1, 1,
-0.4634032, -1.035251, -1.417242, 1, 1, 1, 1, 1,
-0.463217, -1.610407, -4.277345, 1, 1, 1, 1, 1,
-0.4588335, 0.8126162, -1.313679, 1, 1, 1, 1, 1,
-0.4576996, 0.6907281, 0.1844858, 1, 1, 1, 1, 1,
-0.4466757, -1.308386, -3.962291, 1, 1, 1, 1, 1,
-0.4444629, 0.3128691, -1.459616, 1, 1, 1, 1, 1,
-0.437824, -1.546693, -3.096283, 1, 1, 1, 1, 1,
-0.4321853, -0.9774852, -2.559584, 0, 0, 1, 1, 1,
-0.4276358, 0.6698197, -1.43224, 1, 0, 0, 1, 1,
-0.4169101, 0.4481209, -0.03834717, 1, 0, 0, 1, 1,
-0.4003403, 0.8850393, 0.8603245, 1, 0, 0, 1, 1,
-0.3923726, 1.801893, -1.225924, 1, 0, 0, 1, 1,
-0.3863329, -1.82991, -3.141023, 1, 0, 0, 1, 1,
-0.3841146, 1.38495, -0.15143, 0, 0, 0, 1, 1,
-0.3836842, -0.349389, -3.199977, 0, 0, 0, 1, 1,
-0.3788324, -1.064112, -2.769177, 0, 0, 0, 1, 1,
-0.3750565, -1.307317, -3.387682, 0, 0, 0, 1, 1,
-0.3744645, -0.004983371, -1.06421, 0, 0, 0, 1, 1,
-0.3734294, -0.3876011, -3.40317, 0, 0, 0, 1, 1,
-0.3733075, 1.081506, 0.6737354, 0, 0, 0, 1, 1,
-0.364501, 0.6736399, -1.416548, 1, 1, 1, 1, 1,
-0.3611362, 0.6051717, -1.387001, 1, 1, 1, 1, 1,
-0.3544286, 1.384828, -1.08046, 1, 1, 1, 1, 1,
-0.3532996, -0.3051052, -2.641956, 1, 1, 1, 1, 1,
-0.3509397, 0.3206367, -0.6811779, 1, 1, 1, 1, 1,
-0.3502434, 1.184114, -0.6331938, 1, 1, 1, 1, 1,
-0.3392647, 2.507598, 1.375014, 1, 1, 1, 1, 1,
-0.3362986, 2.025818, -0.6536983, 1, 1, 1, 1, 1,
-0.3303623, 1.95822, -0.9425996, 1, 1, 1, 1, 1,
-0.3280761, 1.678328, 1.324932, 1, 1, 1, 1, 1,
-0.3265937, 1.616634, 0.4424739, 1, 1, 1, 1, 1,
-0.3249247, -1.403511, -3.235747, 1, 1, 1, 1, 1,
-0.321072, -1.563964, -4.178825, 1, 1, 1, 1, 1,
-0.3208455, -0.2836591, -2.035648, 1, 1, 1, 1, 1,
-0.3176192, 1.477312, -0.2127633, 1, 1, 1, 1, 1,
-0.3107342, 0.8724333, -0.8661435, 0, 0, 1, 1, 1,
-0.3041521, 0.8221748, -0.4274129, 1, 0, 0, 1, 1,
-0.3012874, -1.800597, -4.3116, 1, 0, 0, 1, 1,
-0.300326, -0.2275374, -2.141354, 1, 0, 0, 1, 1,
-0.2986622, 0.6523543, 1.491804, 1, 0, 0, 1, 1,
-0.2909567, 0.9831057, -0.6989465, 1, 0, 0, 1, 1,
-0.290459, -0.5526559, -1.928965, 0, 0, 0, 1, 1,
-0.2902552, 0.5537506, -1.730107, 0, 0, 0, 1, 1,
-0.290001, -0.4583448, -0.9368871, 0, 0, 0, 1, 1,
-0.2894829, -1.149902, -0.8299554, 0, 0, 0, 1, 1,
-0.2889864, -1.368491, -4.012363, 0, 0, 0, 1, 1,
-0.2863306, 0.8658316, -0.314083, 0, 0, 0, 1, 1,
-0.2853203, -0.09718899, -1.176443, 0, 0, 0, 1, 1,
-0.2839672, 0.8241377, -0.0154651, 1, 1, 1, 1, 1,
-0.2800449, 0.7583047, -0.395867, 1, 1, 1, 1, 1,
-0.2754659, -2.184473, -2.712971, 1, 1, 1, 1, 1,
-0.269967, -0.1189047, -1.908532, 1, 1, 1, 1, 1,
-0.2693695, -0.02556798, -2.05355, 1, 1, 1, 1, 1,
-0.2682119, -0.8327695, -2.711988, 1, 1, 1, 1, 1,
-0.2681091, -0.281647, -2.362197, 1, 1, 1, 1, 1,
-0.2677968, 0.2762811, -2.354286, 1, 1, 1, 1, 1,
-0.2669568, -0.2837377, -2.502999, 1, 1, 1, 1, 1,
-0.263533, 0.3210413, -0.3427428, 1, 1, 1, 1, 1,
-0.2600956, -1.1287, -1.753467, 1, 1, 1, 1, 1,
-0.2586108, 1.598747, -0.9807274, 1, 1, 1, 1, 1,
-0.2582358, 1.866695, -0.06681103, 1, 1, 1, 1, 1,
-0.2564937, 0.7984001, 0.635672, 1, 1, 1, 1, 1,
-0.2547081, 1.274911, -0.465342, 1, 1, 1, 1, 1,
-0.2519817, -1.117005, -2.371609, 0, 0, 1, 1, 1,
-0.2477784, 0.2659457, -0.03048646, 1, 0, 0, 1, 1,
-0.2424424, -0.1831575, -1.652265, 1, 0, 0, 1, 1,
-0.2359316, 0.7801655, -0.03407435, 1, 0, 0, 1, 1,
-0.2304212, 0.5622941, -1.292715, 1, 0, 0, 1, 1,
-0.2278987, 1.834197, 1.324296, 1, 0, 0, 1, 1,
-0.2222734, 0.02557931, -1.504693, 0, 0, 0, 1, 1,
-0.2168475, 0.2245709, -1.686148, 0, 0, 0, 1, 1,
-0.2166373, 1.505929, 0.8026411, 0, 0, 0, 1, 1,
-0.2152516, -0.5301664, -4.615021, 0, 0, 0, 1, 1,
-0.2147283, -0.1091833, -1.98124, 0, 0, 0, 1, 1,
-0.2135815, -0.6393301, -2.010868, 0, 0, 0, 1, 1,
-0.2129212, 0.01184647, -2.640833, 0, 0, 0, 1, 1,
-0.2107324, -0.4167144, -2.807321, 1, 1, 1, 1, 1,
-0.2058405, -1.147269, -2.512317, 1, 1, 1, 1, 1,
-0.2006971, -1.718215, -3.643433, 1, 1, 1, 1, 1,
-0.1986932, 0.06675012, -2.175742, 1, 1, 1, 1, 1,
-0.1976434, 0.3420893, -1.033699, 1, 1, 1, 1, 1,
-0.1949619, 0.4755027, -0.5751024, 1, 1, 1, 1, 1,
-0.1933782, -1.488662, -5.879592, 1, 1, 1, 1, 1,
-0.1922894, 1.017488, 1.253085, 1, 1, 1, 1, 1,
-0.1856936, -2.95834, -2.946077, 1, 1, 1, 1, 1,
-0.1795572, -0.7058307, -1.438546, 1, 1, 1, 1, 1,
-0.178335, 0.6736223, -1.112615, 1, 1, 1, 1, 1,
-0.1777862, -0.6710839, -2.046447, 1, 1, 1, 1, 1,
-0.1766476, -1.476803, -2.85772, 1, 1, 1, 1, 1,
-0.1766368, -0.811515, -1.792378, 1, 1, 1, 1, 1,
-0.1731087, -0.13582, -3.385271, 1, 1, 1, 1, 1,
-0.1701789, 0.3277128, 0.3625595, 0, 0, 1, 1, 1,
-0.1696543, 0.4988041, -0.3196937, 1, 0, 0, 1, 1,
-0.1665651, 0.1660456, -0.2757787, 1, 0, 0, 1, 1,
-0.1638921, 0.3974419, 0.2503845, 1, 0, 0, 1, 1,
-0.1631293, 0.8634212, -0.02011726, 1, 0, 0, 1, 1,
-0.1615591, -0.4104138, -2.746469, 1, 0, 0, 1, 1,
-0.1601269, 0.4054961, -0.7669464, 0, 0, 0, 1, 1,
-0.1594401, -1.879246, -1.700747, 0, 0, 0, 1, 1,
-0.1558921, 1.392607, 0.6477524, 0, 0, 0, 1, 1,
-0.1520477, -0.2001839, -1.621233, 0, 0, 0, 1, 1,
-0.1510763, 0.7469074, -0.1586118, 0, 0, 0, 1, 1,
-0.1496569, 1.356252, 0.1420959, 0, 0, 0, 1, 1,
-0.1465399, -0.5805722, -2.399019, 0, 0, 0, 1, 1,
-0.1429023, -1.398524, -2.048121, 1, 1, 1, 1, 1,
-0.1428571, -1.248053, -2.689979, 1, 1, 1, 1, 1,
-0.1396867, -1.140436, -3.960038, 1, 1, 1, 1, 1,
-0.1350019, 0.1771053, 0.04635923, 1, 1, 1, 1, 1,
-0.1340124, -0.4141937, -1.565952, 1, 1, 1, 1, 1,
-0.1330657, -0.8553225, -1.765379, 1, 1, 1, 1, 1,
-0.1327978, 1.005241, 0.4293696, 1, 1, 1, 1, 1,
-0.128927, -0.2999803, -2.191453, 1, 1, 1, 1, 1,
-0.1258996, -1.136877, -3.685915, 1, 1, 1, 1, 1,
-0.1187809, -0.06408976, -1.952451, 1, 1, 1, 1, 1,
-0.1160448, -0.8168338, -3.478974, 1, 1, 1, 1, 1,
-0.1143059, -1.285383, -3.696489, 1, 1, 1, 1, 1,
-0.1132145, -0.06663093, -1.01283, 1, 1, 1, 1, 1,
-0.1123808, 1.19313, 0.8847618, 1, 1, 1, 1, 1,
-0.1107059, -1.059504, -3.294779, 1, 1, 1, 1, 1,
-0.1096357, -0.998836, -2.142548, 0, 0, 1, 1, 1,
-0.1080408, -0.9076025, -4.154961, 1, 0, 0, 1, 1,
-0.1033202, -1.514191, -0.3971427, 1, 0, 0, 1, 1,
-0.1013236, 1.85968, 0.1865202, 1, 0, 0, 1, 1,
-0.1012951, -0.1871884, -4.380543, 1, 0, 0, 1, 1,
-0.09973773, -0.1568536, -4.483028, 1, 0, 0, 1, 1,
-0.09894746, 0.8001266, 1.319788, 0, 0, 0, 1, 1,
-0.09890836, -0.8015327, -4.119884, 0, 0, 0, 1, 1,
-0.0962368, 1.09274, 0.7413212, 0, 0, 0, 1, 1,
-0.08810569, 0.603343, -1.289094, 0, 0, 0, 1, 1,
-0.08361404, 0.3262841, -0.7115849, 0, 0, 0, 1, 1,
-0.08211311, 0.007135119, -3.101405, 0, 0, 0, 1, 1,
-0.07478285, 0.9724818, 0.5160467, 0, 0, 0, 1, 1,
-0.07042672, 0.009621491, -2.193264, 1, 1, 1, 1, 1,
-0.06618564, -0.7456137, -3.481712, 1, 1, 1, 1, 1,
-0.06413324, 0.5633847, -1.090495, 1, 1, 1, 1, 1,
-0.06383221, 0.154148, 0.2505543, 1, 1, 1, 1, 1,
-0.06153442, -0.499954, -1.959923, 1, 1, 1, 1, 1,
-0.06029594, -0.5485847, -3.29379, 1, 1, 1, 1, 1,
-0.06006703, 1.630951, 1.936958, 1, 1, 1, 1, 1,
-0.05997299, -0.8929633, -4.139744, 1, 1, 1, 1, 1,
-0.05836898, -0.3145817, -2.288123, 1, 1, 1, 1, 1,
-0.05607527, 0.99646, 0.2901685, 1, 1, 1, 1, 1,
-0.04691062, 1.03449, -1.703569, 1, 1, 1, 1, 1,
-0.04651691, -0.3363386, -3.483048, 1, 1, 1, 1, 1,
-0.04410102, -0.1545912, -6.781391, 1, 1, 1, 1, 1,
-0.04335251, 1.480795, 0.6325539, 1, 1, 1, 1, 1,
-0.04157628, 2.36727, 0.122674, 1, 1, 1, 1, 1,
-0.04081062, -0.09891794, -3.347511, 0, 0, 1, 1, 1,
-0.04027633, -1.637618, -2.90531, 1, 0, 0, 1, 1,
-0.03851878, -0.01743237, -2.392475, 1, 0, 0, 1, 1,
-0.03642022, 1.025266, -0.6208212, 1, 0, 0, 1, 1,
-0.03104271, 0.004271745, -2.309265, 1, 0, 0, 1, 1,
-0.02771812, -0.198844, -4.17917, 1, 0, 0, 1, 1,
-0.02616851, 1.16804, -0.3435836, 0, 0, 0, 1, 1,
-0.02486085, -1.838241, -3.899934, 0, 0, 0, 1, 1,
-0.01743046, 0.3996751, 1.962726, 0, 0, 0, 1, 1,
-0.008964462, 0.6666661, 1.144287, 0, 0, 0, 1, 1,
-0.007968846, 0.7793225, -0.4713047, 0, 0, 0, 1, 1,
-0.004309656, 1.274149, -1.027706, 0, 0, 0, 1, 1,
-0.00185635, -0.4538584, -1.864872, 0, 0, 0, 1, 1,
0.0009669813, -0.3665619, 4.139805, 1, 1, 1, 1, 1,
0.001023589, -1.267631, 2.734949, 1, 1, 1, 1, 1,
0.007033171, 0.4855915, -2.224411, 1, 1, 1, 1, 1,
0.007833655, 0.6452397, -1.647898, 1, 1, 1, 1, 1,
0.01145104, -1.557673, 2.871514, 1, 1, 1, 1, 1,
0.01198956, -1.062392, 2.788626, 1, 1, 1, 1, 1,
0.01269121, -0.5481085, 1.299102, 1, 1, 1, 1, 1,
0.01370342, -0.8113247, 3.231202, 1, 1, 1, 1, 1,
0.02014721, 1.009647, -0.2028422, 1, 1, 1, 1, 1,
0.02412644, -0.249427, 4.411508, 1, 1, 1, 1, 1,
0.02725128, -1.314471, 0.8466324, 1, 1, 1, 1, 1,
0.02888517, -2.410389, 2.668435, 1, 1, 1, 1, 1,
0.0309387, 0.5359581, 0.7413699, 1, 1, 1, 1, 1,
0.03156009, 0.2389568, -0.05361815, 1, 1, 1, 1, 1,
0.03472499, 2.260906, -1.704004, 1, 1, 1, 1, 1,
0.03739868, 0.8842981, 0.9995213, 0, 0, 1, 1, 1,
0.03744179, -1.34057, 4.233421, 1, 0, 0, 1, 1,
0.04148849, 1.41225, 1.031904, 1, 0, 0, 1, 1,
0.04190818, -0.9016439, 1.441475, 1, 0, 0, 1, 1,
0.0430081, 0.499164, 0.1364672, 1, 0, 0, 1, 1,
0.04417953, 1.3146, -1.205122, 1, 0, 0, 1, 1,
0.04659683, 0.7235592, 0.6080934, 0, 0, 0, 1, 1,
0.0477208, -0.9420118, 2.315961, 0, 0, 0, 1, 1,
0.04928523, 0.04297251, 2.076467, 0, 0, 0, 1, 1,
0.05236733, -0.1623597, 2.336117, 0, 0, 0, 1, 1,
0.05630659, 0.1047411, 1.226494, 0, 0, 0, 1, 1,
0.05815113, -0.0963143, 2.245828, 0, 0, 0, 1, 1,
0.06240863, -0.472595, 4.288322, 0, 0, 0, 1, 1,
0.06369494, 0.1664369, -0.4663847, 1, 1, 1, 1, 1,
0.064798, 0.5217761, 0.1269428, 1, 1, 1, 1, 1,
0.06721649, 0.6532553, 0.2078584, 1, 1, 1, 1, 1,
0.0676759, 0.6153215, -0.9038822, 1, 1, 1, 1, 1,
0.07151161, -1.240069, 2.517489, 1, 1, 1, 1, 1,
0.07165608, 0.2767517, 0.959022, 1, 1, 1, 1, 1,
0.07586575, 0.06729289, 1.918539, 1, 1, 1, 1, 1,
0.07617311, 0.1614828, -0.723731, 1, 1, 1, 1, 1,
0.07783863, 0.08447634, -0.3340001, 1, 1, 1, 1, 1,
0.07969446, -0.3849306, 2.004709, 1, 1, 1, 1, 1,
0.08289799, -0.05085145, 4.950567, 1, 1, 1, 1, 1,
0.08325641, -1.154178, 3.167661, 1, 1, 1, 1, 1,
0.08404058, -0.1977424, 4.402417, 1, 1, 1, 1, 1,
0.08660033, -0.8699106, 4.320844, 1, 1, 1, 1, 1,
0.08719582, 1.051598, 0.1029531, 1, 1, 1, 1, 1,
0.0889072, 0.1634147, 0.5991715, 0, 0, 1, 1, 1,
0.08909006, 0.3709596, 0.4790789, 1, 0, 0, 1, 1,
0.09570257, -0.4136392, 3.338595, 1, 0, 0, 1, 1,
0.0960634, 1.744622, -0.5804235, 1, 0, 0, 1, 1,
0.09921535, 0.4286931, -0.220338, 1, 0, 0, 1, 1,
0.1029339, 0.0007950782, 1.39135, 1, 0, 0, 1, 1,
0.1072841, -0.7644489, 1.170412, 0, 0, 0, 1, 1,
0.1086217, -0.1779925, 2.901853, 0, 0, 0, 1, 1,
0.1102493, 0.9913065, -0.3144166, 0, 0, 0, 1, 1,
0.1125824, -1.69625, 4.42366, 0, 0, 0, 1, 1,
0.1140383, -1.799887, 4.58462, 0, 0, 0, 1, 1,
0.1162932, -0.5058126, 2.036369, 0, 0, 0, 1, 1,
0.1192445, 0.3422554, 0.1690462, 0, 0, 0, 1, 1,
0.1208435, -1.928758, 2.011704, 1, 1, 1, 1, 1,
0.1212442, -0.4961534, 2.905943, 1, 1, 1, 1, 1,
0.1216881, 0.9528883, -0.3662021, 1, 1, 1, 1, 1,
0.1233301, 0.8861626, 2.44688, 1, 1, 1, 1, 1,
0.1269887, 2.266964, -0.8683136, 1, 1, 1, 1, 1,
0.1280066, -0.3342268, 2.48075, 1, 1, 1, 1, 1,
0.1297123, 0.8197509, -0.1725587, 1, 1, 1, 1, 1,
0.1303785, -1.388733, 2.833261, 1, 1, 1, 1, 1,
0.1362718, 0.3111882, -0.203377, 1, 1, 1, 1, 1,
0.1438865, 1.261029, 0.8569427, 1, 1, 1, 1, 1,
0.1451113, -1.866707, 2.877834, 1, 1, 1, 1, 1,
0.1475632, -1.082866, 3.365405, 1, 1, 1, 1, 1,
0.1486684, -0.02961995, 2.688147, 1, 1, 1, 1, 1,
0.1499794, 0.1745832, -1.202061, 1, 1, 1, 1, 1,
0.1504475, 0.6350652, -1.202446, 1, 1, 1, 1, 1,
0.1555285, -0.4752077, 3.559389, 0, 0, 1, 1, 1,
0.1582384, 0.4213259, 0.2387294, 1, 0, 0, 1, 1,
0.158859, 0.6786172, -0.2165419, 1, 0, 0, 1, 1,
0.1589642, -0.8020732, 2.00766, 1, 0, 0, 1, 1,
0.1599315, -0.4586729, 4.179972, 1, 0, 0, 1, 1,
0.1615483, 0.2419232, 1.296976, 1, 0, 0, 1, 1,
0.1647318, -1.503526, 1.767771, 0, 0, 0, 1, 1,
0.1754298, 0.00133227, 3.49016, 0, 0, 0, 1, 1,
0.1757798, 0.7142579, -0.2999344, 0, 0, 0, 1, 1,
0.1797016, -2.182586, 3.634162, 0, 0, 0, 1, 1,
0.1901697, -1.185688, 1.352759, 0, 0, 0, 1, 1,
0.1913166, 1.302103, -0.7502484, 0, 0, 0, 1, 1,
0.1969278, -0.3807955, 4.123933, 0, 0, 0, 1, 1,
0.2011928, -0.6778127, 2.487851, 1, 1, 1, 1, 1,
0.2021489, 0.197083, 1.67897, 1, 1, 1, 1, 1,
0.2041851, -0.2319409, 1.459924, 1, 1, 1, 1, 1,
0.2058893, 0.9473662, 0.3870005, 1, 1, 1, 1, 1,
0.209831, 0.4116335, -0.4265364, 1, 1, 1, 1, 1,
0.2119143, -0.4976022, 2.78896, 1, 1, 1, 1, 1,
0.2137291, -0.3172481, 3.843795, 1, 1, 1, 1, 1,
0.2217511, -0.8595102, 3.212886, 1, 1, 1, 1, 1,
0.2228371, 0.4561847, 1.144523, 1, 1, 1, 1, 1,
0.2231774, 0.5547464, 1.260786, 1, 1, 1, 1, 1,
0.2258788, 2.325355, 0.7632738, 1, 1, 1, 1, 1,
0.2304182, 0.8088461, -0.3425646, 1, 1, 1, 1, 1,
0.2315527, 0.6393069, 0.4941589, 1, 1, 1, 1, 1,
0.2335766, 1.681762, -0.182731, 1, 1, 1, 1, 1,
0.2417105, 2.207016, 1.699605, 1, 1, 1, 1, 1,
0.2420971, 0.6442373, 0.471673, 0, 0, 1, 1, 1,
0.2442171, 0.2462761, 0.9770343, 1, 0, 0, 1, 1,
0.2443322, -0.9037989, 1.593021, 1, 0, 0, 1, 1,
0.2515248, -0.6437638, 2.57908, 1, 0, 0, 1, 1,
0.2646483, -0.2679673, 2.250334, 1, 0, 0, 1, 1,
0.2671249, -0.502876, 1.684156, 1, 0, 0, 1, 1,
0.2687313, 1.839052, -0.3833652, 0, 0, 0, 1, 1,
0.2738515, 0.388119, 0.4703356, 0, 0, 0, 1, 1,
0.2774758, 0.3177967, 1.590692, 0, 0, 0, 1, 1,
0.28014, 1.237762, 0.4478031, 0, 0, 0, 1, 1,
0.2815685, 2.122282, 0.2030667, 0, 0, 0, 1, 1,
0.2825896, 0.9247267, 1.489133, 0, 0, 0, 1, 1,
0.2832063, -1.368495, 2.712601, 0, 0, 0, 1, 1,
0.2832869, -0.6975024, 2.354782, 1, 1, 1, 1, 1,
0.284062, -0.3861564, 1.317107, 1, 1, 1, 1, 1,
0.2842781, 1.229002, 0.9183382, 1, 1, 1, 1, 1,
0.2852853, -0.2509797, 2.834124, 1, 1, 1, 1, 1,
0.2889532, 0.2983992, 0.4298324, 1, 1, 1, 1, 1,
0.2935924, 0.4489477, 1.547427, 1, 1, 1, 1, 1,
0.2948658, 0.6739451, 0.7632079, 1, 1, 1, 1, 1,
0.2969077, -1.971823, 1.227774, 1, 1, 1, 1, 1,
0.2976325, -0.3124804, 3.046853, 1, 1, 1, 1, 1,
0.2993041, 0.3455647, 0.2297846, 1, 1, 1, 1, 1,
0.3044415, -0.1049457, 1.552951, 1, 1, 1, 1, 1,
0.306809, -1.32824, 2.206648, 1, 1, 1, 1, 1,
0.310092, 0.7731611, 0.1905494, 1, 1, 1, 1, 1,
0.314646, -2.483262, 2.275888, 1, 1, 1, 1, 1,
0.3210519, 0.9933367, 1.47536, 1, 1, 1, 1, 1,
0.322493, -0.9259881, 1.802991, 0, 0, 1, 1, 1,
0.32261, -0.8436764, 1.34163, 1, 0, 0, 1, 1,
0.3280572, -0.6435804, 1.739321, 1, 0, 0, 1, 1,
0.3283823, -0.6478267, 2.596451, 1, 0, 0, 1, 1,
0.332176, -0.8570423, 2.863146, 1, 0, 0, 1, 1,
0.3358846, -1.483024, 1.213769, 1, 0, 0, 1, 1,
0.3409836, -0.6731595, 3.447551, 0, 0, 0, 1, 1,
0.3429565, 0.6505563, -0.2036304, 0, 0, 0, 1, 1,
0.3461971, 0.4433621, 0.9202888, 0, 0, 0, 1, 1,
0.3475011, 0.8751348, 1.937261, 0, 0, 0, 1, 1,
0.3475536, 0.359669, -0.9333829, 0, 0, 0, 1, 1,
0.3496978, -0.02875039, 0.2680987, 0, 0, 0, 1, 1,
0.351168, 0.747094, 2.12021, 0, 0, 0, 1, 1,
0.3588078, 1.206708, -0.2950647, 1, 1, 1, 1, 1,
0.3595033, -0.06775931, 2.897007, 1, 1, 1, 1, 1,
0.3636444, 0.5024383, 0.8282722, 1, 1, 1, 1, 1,
0.3660574, -1.740281, 3.216815, 1, 1, 1, 1, 1,
0.3680609, 0.4974144, 1.242985, 1, 1, 1, 1, 1,
0.3689842, -0.1075225, 1.751257, 1, 1, 1, 1, 1,
0.3755617, 0.4670994, 1.029211, 1, 1, 1, 1, 1,
0.3788652, 0.003288758, 0.3016201, 1, 1, 1, 1, 1,
0.3804899, 0.849359, 0.8428231, 1, 1, 1, 1, 1,
0.3863634, -0.2151118, 3.297444, 1, 1, 1, 1, 1,
0.3922621, 0.59189, 2.178032, 1, 1, 1, 1, 1,
0.3932213, -0.1036217, 2.049351, 1, 1, 1, 1, 1,
0.4020937, -1.111484, 1.969228, 1, 1, 1, 1, 1,
0.4056643, -0.2523533, -0.4699728, 1, 1, 1, 1, 1,
0.4075668, -0.4519425, 3.220507, 1, 1, 1, 1, 1,
0.4081784, 0.1977236, 1.306909, 0, 0, 1, 1, 1,
0.4179304, -1.213274, 1.276956, 1, 0, 0, 1, 1,
0.4186921, -0.2910491, 2.828946, 1, 0, 0, 1, 1,
0.426995, 1.539921, 2.06441, 1, 0, 0, 1, 1,
0.431188, 1.290365, -1.541618, 1, 0, 0, 1, 1,
0.4327635, -0.9774275, 3.677074, 1, 0, 0, 1, 1,
0.443233, -0.2357987, 1.494246, 0, 0, 0, 1, 1,
0.446849, -0.4086483, -0.3389137, 0, 0, 0, 1, 1,
0.448043, 0.5533291, 0.2059924, 0, 0, 0, 1, 1,
0.4591238, 0.9855871, 1.330258, 0, 0, 0, 1, 1,
0.4592831, -0.3459661, 2.184811, 0, 0, 0, 1, 1,
0.4593847, 1.29562, 0.2768983, 0, 0, 0, 1, 1,
0.4600983, 1.099424, 2.03052, 0, 0, 0, 1, 1,
0.4615112, -0.9695704, 1.905101, 1, 1, 1, 1, 1,
0.4625847, -1.008811, 1.887755, 1, 1, 1, 1, 1,
0.4744469, -1.054453, 1.809387, 1, 1, 1, 1, 1,
0.4750795, -1.615609, 4.720457, 1, 1, 1, 1, 1,
0.4771062, -1.259388, 1.775616, 1, 1, 1, 1, 1,
0.4852232, 0.1140952, 1.460651, 1, 1, 1, 1, 1,
0.4866756, -0.532138, 2.413023, 1, 1, 1, 1, 1,
0.486908, 0.9593933, 2.057621, 1, 1, 1, 1, 1,
0.4896553, -0.003468821, 2.255857, 1, 1, 1, 1, 1,
0.4916666, 1.058429, -0.2725365, 1, 1, 1, 1, 1,
0.4917564, -0.3904034, 2.706091, 1, 1, 1, 1, 1,
0.4939277, -1.194941, 2.747228, 1, 1, 1, 1, 1,
0.5010853, -0.5643464, 1.856031, 1, 1, 1, 1, 1,
0.5030302, 1.557394, 1.237561, 1, 1, 1, 1, 1,
0.5032317, -0.3922686, 4.381307, 1, 1, 1, 1, 1,
0.5064631, -0.6068887, 2.625637, 0, 0, 1, 1, 1,
0.5090141, 0.9704757, 0.04266419, 1, 0, 0, 1, 1,
0.5167121, -0.1647039, 1.188272, 1, 0, 0, 1, 1,
0.523411, -0.9437727, 2.707232, 1, 0, 0, 1, 1,
0.5252857, -1.346336, 3.657156, 1, 0, 0, 1, 1,
0.5253092, -2.220645, 4.017234, 1, 0, 0, 1, 1,
0.526249, 0.4552559, 0.6669834, 0, 0, 0, 1, 1,
0.5291236, -0.2740642, 1.670418, 0, 0, 0, 1, 1,
0.5295993, -0.3599936, 2.57751, 0, 0, 0, 1, 1,
0.530248, -1.460554, 2.591889, 0, 0, 0, 1, 1,
0.5317703, -1.297313, 4.356273, 0, 0, 0, 1, 1,
0.5324295, 0.3934643, 0.8367471, 0, 0, 0, 1, 1,
0.5329525, -0.07565539, 0.5305628, 0, 0, 0, 1, 1,
0.5333806, -0.1087891, 0.2493052, 1, 1, 1, 1, 1,
0.534314, 1.32283, 1.502315, 1, 1, 1, 1, 1,
0.5344288, 2.577377, 2.003994, 1, 1, 1, 1, 1,
0.5402694, 1.26675, 0.818087, 1, 1, 1, 1, 1,
0.5423414, -0.07051175, 2.04191, 1, 1, 1, 1, 1,
0.5434098, 0.6178992, 0.9753026, 1, 1, 1, 1, 1,
0.5435158, 0.6196925, -0.5111026, 1, 1, 1, 1, 1,
0.5449181, -0.2662235, 3.803821, 1, 1, 1, 1, 1,
0.557724, 0.3008814, 0.06425054, 1, 1, 1, 1, 1,
0.5601526, 0.8700166, 1.54197, 1, 1, 1, 1, 1,
0.5612527, -0.519113, 2.172454, 1, 1, 1, 1, 1,
0.5621641, -0.09317236, 1.673186, 1, 1, 1, 1, 1,
0.5628503, 2.494662, -0.9839861, 1, 1, 1, 1, 1,
0.5629172, 0.6440193, 1.82965, 1, 1, 1, 1, 1,
0.5636096, -0.8627997, 2.226671, 1, 1, 1, 1, 1,
0.5753657, 2.555087, 0.8179007, 0, 0, 1, 1, 1,
0.5759866, 0.2192818, 0.07730845, 1, 0, 0, 1, 1,
0.5761347, -0.1579074, 1.512107, 1, 0, 0, 1, 1,
0.5787197, 0.2892713, 0.884156, 1, 0, 0, 1, 1,
0.5801154, -0.7599881, 2.77102, 1, 0, 0, 1, 1,
0.5824885, 0.8400576, 0.6031364, 1, 0, 0, 1, 1,
0.5836326, -1.441146, 3.03094, 0, 0, 0, 1, 1,
0.5839612, 0.5313391, -0.006299196, 0, 0, 0, 1, 1,
0.5867122, 0.1494549, 1.907403, 0, 0, 0, 1, 1,
0.5875765, -1.477167, 2.514321, 0, 0, 0, 1, 1,
0.5904251, 0.7478796, -0.5122359, 0, 0, 0, 1, 1,
0.5965674, -1.99275, 2.857495, 0, 0, 0, 1, 1,
0.6013983, -0.06039586, 0.942679, 0, 0, 0, 1, 1,
0.6126292, -1.034536, 4.039728, 1, 1, 1, 1, 1,
0.6238794, -0.4351659, 2.310343, 1, 1, 1, 1, 1,
0.628103, 1.321441, 2.057525, 1, 1, 1, 1, 1,
0.6312031, 1.226444, 2.447527, 1, 1, 1, 1, 1,
0.6320699, -0.7642608, 1.128895, 1, 1, 1, 1, 1,
0.6323531, 1.270881, 1.536549, 1, 1, 1, 1, 1,
0.6342763, 0.1876819, 2.101828, 1, 1, 1, 1, 1,
0.634571, -0.1252626, 3.266084, 1, 1, 1, 1, 1,
0.6363643, 0.5696672, 0.5808594, 1, 1, 1, 1, 1,
0.6434693, 1.471538, 0.8412765, 1, 1, 1, 1, 1,
0.6460998, -0.1333217, 1.169169, 1, 1, 1, 1, 1,
0.6464233, -0.1602859, 1.715384, 1, 1, 1, 1, 1,
0.6473527, -0.4385813, -0.04939888, 1, 1, 1, 1, 1,
0.6490099, 0.4076727, 0.09864132, 1, 1, 1, 1, 1,
0.6504179, 2.137744, 0.414138, 1, 1, 1, 1, 1,
0.6531, 1.034807, 1.610248, 0, 0, 1, 1, 1,
0.6551937, 1.380731, 0.7273304, 1, 0, 0, 1, 1,
0.6645985, -0.6341304, 2.519538, 1, 0, 0, 1, 1,
0.6674238, 0.3846501, 1.197064, 1, 0, 0, 1, 1,
0.6684343, -0.733934, 2.152574, 1, 0, 0, 1, 1,
0.6711335, -2.191738, 2.460034, 1, 0, 0, 1, 1,
0.6768839, -1.822224, 1.569542, 0, 0, 0, 1, 1,
0.6778025, 0.3036003, 0.9635141, 0, 0, 0, 1, 1,
0.684726, -0.7118089, 1.358536, 0, 0, 0, 1, 1,
0.6854811, -1.960739, 2.128064, 0, 0, 0, 1, 1,
0.6943235, 0.958104, 0.9842471, 0, 0, 0, 1, 1,
0.7023826, -0.5329584, 2.75652, 0, 0, 0, 1, 1,
0.7027716, 0.3463351, -0.2141917, 0, 0, 0, 1, 1,
0.7048354, 0.7111904, 0.9563392, 1, 1, 1, 1, 1,
0.7080967, 0.2973055, 0.975122, 1, 1, 1, 1, 1,
0.7093896, 2.493071, 1.47808, 1, 1, 1, 1, 1,
0.7120478, 0.7666833, 1.295105, 1, 1, 1, 1, 1,
0.7140772, 0.7911563, 1.004271, 1, 1, 1, 1, 1,
0.7173514, -0.7406086, 0.05430562, 1, 1, 1, 1, 1,
0.7206246, 1.592916, 0.3243677, 1, 1, 1, 1, 1,
0.7218236, 2.366841, -0.06941105, 1, 1, 1, 1, 1,
0.7232239, -0.5964822, 2.231522, 1, 1, 1, 1, 1,
0.7254316, 0.3661499, 1.466588, 1, 1, 1, 1, 1,
0.7267054, -0.1411517, 3.761145, 1, 1, 1, 1, 1,
0.7272111, -0.248696, 1.075898, 1, 1, 1, 1, 1,
0.7298465, 1.609685, -1.513274, 1, 1, 1, 1, 1,
0.7327204, -0.581847, 2.328967, 1, 1, 1, 1, 1,
0.7328265, -0.9411002, 3.203893, 1, 1, 1, 1, 1,
0.73599, -0.8333347, 4.844118, 0, 0, 1, 1, 1,
0.7383736, -1.853126, 1.62673, 1, 0, 0, 1, 1,
0.7410955, -1.157431, 2.131933, 1, 0, 0, 1, 1,
0.7416603, 0.1902024, 0.4045214, 1, 0, 0, 1, 1,
0.7428886, -1.630618, 3.571357, 1, 0, 0, 1, 1,
0.7433922, -2.152995, 3.593105, 1, 0, 0, 1, 1,
0.7449456, 0.4075052, 1.216047, 0, 0, 0, 1, 1,
0.7495421, -0.7510074, 2.777098, 0, 0, 0, 1, 1,
0.7530521, -1.35371, 1.762094, 0, 0, 0, 1, 1,
0.7571267, -1.363382, 2.134582, 0, 0, 0, 1, 1,
0.7589332, -0.3412914, 2.661405, 0, 0, 0, 1, 1,
0.7638392, -0.1432292, 1.812215, 0, 0, 0, 1, 1,
0.7645673, 0.4701757, 0.6514613, 0, 0, 0, 1, 1,
0.7649272, -0.8937953, 4.051011, 1, 1, 1, 1, 1,
0.7853381, 0.1631937, 1.264771, 1, 1, 1, 1, 1,
0.7868086, 0.008218649, 0.7988468, 1, 1, 1, 1, 1,
0.7880288, -0.9434497, 2.481893, 1, 1, 1, 1, 1,
0.7902534, -0.2113032, 0.7232698, 1, 1, 1, 1, 1,
0.793741, 0.03240177, 1.069534, 1, 1, 1, 1, 1,
0.7955378, 1.232153, 1.560587, 1, 1, 1, 1, 1,
0.8033425, -0.6290266, 3.199638, 1, 1, 1, 1, 1,
0.8038703, -0.3485045, 3.27418, 1, 1, 1, 1, 1,
0.8046292, -0.2553084, 3.447446, 1, 1, 1, 1, 1,
0.8077855, 0.1429459, 2.599889, 1, 1, 1, 1, 1,
0.810921, 0.8114586, 1.136193, 1, 1, 1, 1, 1,
0.8141742, -1.042642, 2.866813, 1, 1, 1, 1, 1,
0.8163766, -0.950789, 2.957634, 1, 1, 1, 1, 1,
0.8167924, -0.1461274, 2.051849, 1, 1, 1, 1, 1,
0.8187504, 1.078451, -0.07652607, 0, 0, 1, 1, 1,
0.8301881, 1.446318, 0.09526235, 1, 0, 0, 1, 1,
0.8313092, -0.4221777, 1.598001, 1, 0, 0, 1, 1,
0.8316177, -0.3522389, 0.5577307, 1, 0, 0, 1, 1,
0.8373222, 0.3119186, 3.734583, 1, 0, 0, 1, 1,
0.8391293, -0.429249, 2.616325, 1, 0, 0, 1, 1,
0.8459164, -0.5166196, 3.552251, 0, 0, 0, 1, 1,
0.8505951, 0.4367115, 1.410371, 0, 0, 0, 1, 1,
0.8552696, -0.7109752, 1.666751, 0, 0, 0, 1, 1,
0.8589066, 0.6769115, 1.215102, 0, 0, 0, 1, 1,
0.8623057, 0.7266214, -0.8827592, 0, 0, 0, 1, 1,
0.8687902, -0.2750121, 2.031354, 0, 0, 0, 1, 1,
0.875192, 0.07628911, 0.7504533, 0, 0, 0, 1, 1,
0.8788191, 0.2401852, 1.909947, 1, 1, 1, 1, 1,
0.8789399, 2.631374, 1.183559, 1, 1, 1, 1, 1,
0.8852599, -0.2546186, 1.529779, 1, 1, 1, 1, 1,
0.8856415, -0.3793737, 2.786461, 1, 1, 1, 1, 1,
0.8968114, -0.4461679, 1.936581, 1, 1, 1, 1, 1,
0.8979378, -0.7700636, 2.414721, 1, 1, 1, 1, 1,
0.9011958, -0.3134661, -0.0468892, 1, 1, 1, 1, 1,
0.9013859, -1.191182, 1.046448, 1, 1, 1, 1, 1,
0.9048181, 0.02605436, 0.8898567, 1, 1, 1, 1, 1,
0.9071199, -0.3860341, 1.804088, 1, 1, 1, 1, 1,
0.9179276, 1.009898, 2.08792, 1, 1, 1, 1, 1,
0.9224539, 0.4635698, 0.1955747, 1, 1, 1, 1, 1,
0.9232263, 0.4764973, 1.142702, 1, 1, 1, 1, 1,
0.9270645, -0.6126668, 0.3379486, 1, 1, 1, 1, 1,
0.9298525, 2.396042, -0.05916657, 1, 1, 1, 1, 1,
0.9308581, 0.6001135, 1.209368, 0, 0, 1, 1, 1,
0.9320056, -0.7206219, 1.83919, 1, 0, 0, 1, 1,
0.9339654, -0.2899813, 1.716559, 1, 0, 0, 1, 1,
0.9441538, -0.3060926, 1.92451, 1, 0, 0, 1, 1,
0.9460955, 0.2348, 2.633168, 1, 0, 0, 1, 1,
0.9468973, -0.03037916, 1.38056, 1, 0, 0, 1, 1,
0.9495875, 1.190871, -0.439611, 0, 0, 0, 1, 1,
0.9551263, -0.4975933, 1.589686, 0, 0, 0, 1, 1,
0.9631974, 0.1488738, 1.265954, 0, 0, 0, 1, 1,
0.9681208, 1.121536, -0.1619867, 0, 0, 0, 1, 1,
0.9691309, -2.095829, 1.749286, 0, 0, 0, 1, 1,
0.9694642, 1.395881, 0.7661121, 0, 0, 0, 1, 1,
0.9750665, 0.9622971, -0.2096912, 0, 0, 0, 1, 1,
0.983488, 0.7361876, 0.8221777, 1, 1, 1, 1, 1,
0.9841405, -0.3730036, 2.953548, 1, 1, 1, 1, 1,
0.9964146, -1.047337, 3.737788, 1, 1, 1, 1, 1,
0.9966331, 1.049307, 0.6020646, 1, 1, 1, 1, 1,
1.007775, -0.8215255, 2.387653, 1, 1, 1, 1, 1,
1.009968, -0.1993024, 3.333642, 1, 1, 1, 1, 1,
1.020195, 1.030872, 0.3515681, 1, 1, 1, 1, 1,
1.026748, 0.1579516, 0.3669846, 1, 1, 1, 1, 1,
1.036512, -0.3159568, -0.3359545, 1, 1, 1, 1, 1,
1.036892, 0.408294, 2.125643, 1, 1, 1, 1, 1,
1.043823, 2.111449, -0.8119817, 1, 1, 1, 1, 1,
1.044848, -0.36054, 1.112155, 1, 1, 1, 1, 1,
1.047001, 1.053052, 2.792939, 1, 1, 1, 1, 1,
1.049989, -1.193765, 3.550564, 1, 1, 1, 1, 1,
1.057911, 1.764131, 1.17511, 1, 1, 1, 1, 1,
1.059214, 0.02595001, 1.304882, 0, 0, 1, 1, 1,
1.061047, -3.275965, 3.573506, 1, 0, 0, 1, 1,
1.06423, -1.791723, 4.250832, 1, 0, 0, 1, 1,
1.064718, -0.6101142, 0.281501, 1, 0, 0, 1, 1,
1.064817, 0.7553238, 0.5580819, 1, 0, 0, 1, 1,
1.067595, -0.0829854, 1.79237, 1, 0, 0, 1, 1,
1.070848, 0.1697703, 0.6200742, 0, 0, 0, 1, 1,
1.072907, 0.9512099, 1.155968, 0, 0, 0, 1, 1,
1.080339, -0.1589027, 3.632657, 0, 0, 0, 1, 1,
1.082654, 0.06103088, 1.672817, 0, 0, 0, 1, 1,
1.09017, -0.5438575, 2.955419, 0, 0, 0, 1, 1,
1.096051, 0.3818668, 1.250843, 0, 0, 0, 1, 1,
1.09718, -0.2408019, 0.8251527, 0, 0, 0, 1, 1,
1.09923, 1.10869, 1.002221, 1, 1, 1, 1, 1,
1.101167, -0.8552342, 2.587586, 1, 1, 1, 1, 1,
1.115967, -1.318935, 2.505584, 1, 1, 1, 1, 1,
1.130142, -0.5051322, 1.006509, 1, 1, 1, 1, 1,
1.133366, -1.520259, 1.299741, 1, 1, 1, 1, 1,
1.135481, 0.3291859, 1.541081, 1, 1, 1, 1, 1,
1.136984, 1.302428, -0.4561773, 1, 1, 1, 1, 1,
1.139372, -1.205607, 3.702092, 1, 1, 1, 1, 1,
1.144248, 1.044447, 1.55717, 1, 1, 1, 1, 1,
1.144848, -1.504083, 2.525106, 1, 1, 1, 1, 1,
1.151813, -0.1873151, 1.864394, 1, 1, 1, 1, 1,
1.175162, 0.7464801, 3.172982, 1, 1, 1, 1, 1,
1.182204, -1.146915, 0.5857524, 1, 1, 1, 1, 1,
1.189299, -0.8385614, 2.686274, 1, 1, 1, 1, 1,
1.192664, -1.387707, 2.707994, 1, 1, 1, 1, 1,
1.201098, -0.3166842, 0.8948225, 0, 0, 1, 1, 1,
1.205915, -1.663197, 3.417692, 1, 0, 0, 1, 1,
1.206058, 0.8726316, 0.484073, 1, 0, 0, 1, 1,
1.209998, 0.1286125, 1.601362, 1, 0, 0, 1, 1,
1.210536, -0.8804905, 2.660963, 1, 0, 0, 1, 1,
1.214705, -0.1013051, 1.761325, 1, 0, 0, 1, 1,
1.216861, 0.4025264, 2.133539, 0, 0, 0, 1, 1,
1.220232, -2.14573, 2.934992, 0, 0, 0, 1, 1,
1.222286, 2.293242, 1.040489, 0, 0, 0, 1, 1,
1.227734, -1.372908, 2.788797, 0, 0, 0, 1, 1,
1.229287, -0.3226742, 2.193995, 0, 0, 0, 1, 1,
1.229343, -0.2708319, 2.085115, 0, 0, 0, 1, 1,
1.239065, -0.3241373, 2.477519, 0, 0, 0, 1, 1,
1.244515, 1.274243, -0.3595431, 1, 1, 1, 1, 1,
1.24789, 0.04461358, 1.250662, 1, 1, 1, 1, 1,
1.251476, 1.190012, 0.3936478, 1, 1, 1, 1, 1,
1.256606, -0.5569306, 2.654198, 1, 1, 1, 1, 1,
1.26083, 1.02275, 1.855834, 1, 1, 1, 1, 1,
1.262972, -0.09863438, 2.177175, 1, 1, 1, 1, 1,
1.263112, -0.5734712, 3.113194, 1, 1, 1, 1, 1,
1.265018, -0.3004788, 1.53897, 1, 1, 1, 1, 1,
1.26934, 0.002672249, 1.817453, 1, 1, 1, 1, 1,
1.273713, -0.2227947, 1.838259, 1, 1, 1, 1, 1,
1.282997, 0.9071628, -0.003360524, 1, 1, 1, 1, 1,
1.287456, 0.06047925, 0.5772059, 1, 1, 1, 1, 1,
1.289985, 0.2783107, 2.106311, 1, 1, 1, 1, 1,
1.294389, -0.1706537, 3.416905, 1, 1, 1, 1, 1,
1.301762, -2.064914, 2.83942, 1, 1, 1, 1, 1,
1.301871, -0.4576913, 2.302202, 0, 0, 1, 1, 1,
1.313948, -1.234039, 3.645083, 1, 0, 0, 1, 1,
1.325675, -1.759005, 1.016299, 1, 0, 0, 1, 1,
1.327187, 1.913988, 0.2281394, 1, 0, 0, 1, 1,
1.328007, 0.799256, 0.894608, 1, 0, 0, 1, 1,
1.332343, -0.6684378, 2.000022, 1, 0, 0, 1, 1,
1.335296, -0.189293, 1.71006, 0, 0, 0, 1, 1,
1.342939, -0.6400836, 1.098301, 0, 0, 0, 1, 1,
1.343873, -0.2002209, 1.374695, 0, 0, 0, 1, 1,
1.344967, 0.3929808, 1.127236, 0, 0, 0, 1, 1,
1.351345, 0.768348, 3.485136, 0, 0, 0, 1, 1,
1.358614, 0.1775411, 1.303704, 0, 0, 0, 1, 1,
1.370102, 0.6568615, 2.558745, 0, 0, 0, 1, 1,
1.386729, 1.689568, -0.2325976, 1, 1, 1, 1, 1,
1.38789, 1.157818, 0.5160615, 1, 1, 1, 1, 1,
1.388121, 1.434483, 0.5528048, 1, 1, 1, 1, 1,
1.389704, 0.02474842, 1.59544, 1, 1, 1, 1, 1,
1.394259, 0.2386476, 3.185935, 1, 1, 1, 1, 1,
1.397218, 0.4254791, 1.304632, 1, 1, 1, 1, 1,
1.397812, 0.688422, 0.9885778, 1, 1, 1, 1, 1,
1.399235, -0.638193, 0.8671983, 1, 1, 1, 1, 1,
1.405633, 0.2211496, 2.298217, 1, 1, 1, 1, 1,
1.407688, 0.5517105, 0.824881, 1, 1, 1, 1, 1,
1.411932, 1.173115, -1.576647, 1, 1, 1, 1, 1,
1.417694, 0.3811001, 0.09538096, 1, 1, 1, 1, 1,
1.423516, 1.253251, 2.373054, 1, 1, 1, 1, 1,
1.437475, 0.6164879, -0.06836782, 1, 1, 1, 1, 1,
1.439273, 0.04203764, 1.080148, 1, 1, 1, 1, 1,
1.457782, 1.164196, 1.905484, 0, 0, 1, 1, 1,
1.470921, -1.034595, 2.14194, 1, 0, 0, 1, 1,
1.478193, -1.520787, 1.323917, 1, 0, 0, 1, 1,
1.495305, -1.728936, 1.412041, 1, 0, 0, 1, 1,
1.498712, 0.5445623, 1.048903, 1, 0, 0, 1, 1,
1.531336, 0.741745, 1.759995, 1, 0, 0, 1, 1,
1.535441, -0.1456443, 2.404122, 0, 0, 0, 1, 1,
1.540243, 0.2419265, 2.4307, 0, 0, 0, 1, 1,
1.541613, -0.559245, 2.387159, 0, 0, 0, 1, 1,
1.544976, -0.2423714, 1.211012, 0, 0, 0, 1, 1,
1.545558, -1.006764, 0.7046391, 0, 0, 0, 1, 1,
1.546273, -0.6425182, 2.655669, 0, 0, 0, 1, 1,
1.547675, 0.3090417, 0.5527815, 0, 0, 0, 1, 1,
1.547918, -0.2761871, 0.8973511, 1, 1, 1, 1, 1,
1.549762, 0.178133, 3.890802, 1, 1, 1, 1, 1,
1.557744, -1.660874, 2.539392, 1, 1, 1, 1, 1,
1.571454, -1.238478, 2.335919, 1, 1, 1, 1, 1,
1.572805, 0.9163667, -0.04139772, 1, 1, 1, 1, 1,
1.573287, 0.571351, 0.7297919, 1, 1, 1, 1, 1,
1.579058, 0.1040343, 0.8486572, 1, 1, 1, 1, 1,
1.582598, -1.525887, 4.964549, 1, 1, 1, 1, 1,
1.585106, -0.309447, 1.812403, 1, 1, 1, 1, 1,
1.598749, 0.2310474, 2.94611, 1, 1, 1, 1, 1,
1.599099, 0.4908786, 1.622194, 1, 1, 1, 1, 1,
1.600439, -0.4684005, 0.8917198, 1, 1, 1, 1, 1,
1.6067, -0.08508967, 1.557032, 1, 1, 1, 1, 1,
1.61451, 1.862073, 0.6361114, 1, 1, 1, 1, 1,
1.627683, -0.3814721, 2.857591, 1, 1, 1, 1, 1,
1.64405, 1.440022, -0.4262511, 0, 0, 1, 1, 1,
1.648868, -1.005055, 1.82681, 1, 0, 0, 1, 1,
1.663329, -0.8796495, 3.261179, 1, 0, 0, 1, 1,
1.697294, -0.8150826, 2.133801, 1, 0, 0, 1, 1,
1.707683, 0.04193934, 2.348727, 1, 0, 0, 1, 1,
1.71023, 1.286459, 1.052471, 1, 0, 0, 1, 1,
1.713127, 1.549586, 1.366367, 0, 0, 0, 1, 1,
1.734799, 0.6316668, -0.03972757, 0, 0, 0, 1, 1,
1.743514, 0.008464503, 0.9490931, 0, 0, 0, 1, 1,
1.754613, 1.081562, 1.679883, 0, 0, 0, 1, 1,
1.782314, -0.9733168, 1.755501, 0, 0, 0, 1, 1,
1.809923, -1.074757, 1.673972, 0, 0, 0, 1, 1,
1.81115, 1.647988, 1.225629, 0, 0, 0, 1, 1,
1.811308, -0.3680691, 2.817405, 1, 1, 1, 1, 1,
1.820209, -1.545066, 1.741791, 1, 1, 1, 1, 1,
1.834008, -0.1154244, 2.506643, 1, 1, 1, 1, 1,
1.836607, 0.1255936, 0.5940452, 1, 1, 1, 1, 1,
1.839213, 0.7120875, 2.718465, 1, 1, 1, 1, 1,
1.839484, -0.3910989, 0.6726335, 1, 1, 1, 1, 1,
1.848928, 0.4579997, -0.1016344, 1, 1, 1, 1, 1,
1.871002, 2.530329, 0.8903869, 1, 1, 1, 1, 1,
1.88251, 1.266435, 2.08428, 1, 1, 1, 1, 1,
1.890856, -0.1779546, 1.927685, 1, 1, 1, 1, 1,
1.892398, -0.6975427, 1.446608, 1, 1, 1, 1, 1,
1.899471, 0.4981433, 2.187309, 1, 1, 1, 1, 1,
1.904366, 0.6166695, 0.6773307, 1, 1, 1, 1, 1,
1.995869, 0.6925601, 1.880837, 1, 1, 1, 1, 1,
1.997872, -1.465263, 3.266638, 1, 1, 1, 1, 1,
1.998719, -0.5493806, 2.07982, 0, 0, 1, 1, 1,
2.048589, 0.07053781, 1.671414, 1, 0, 0, 1, 1,
2.090478, 1.102698, -0.2644016, 1, 0, 0, 1, 1,
2.157678, 0.1638487, -0.1959163, 1, 0, 0, 1, 1,
2.212948, -0.3823972, 2.526139, 1, 0, 0, 1, 1,
2.217755, 0.1900359, 2.730451, 1, 0, 0, 1, 1,
2.245046, 0.4399266, 1.958122, 0, 0, 0, 1, 1,
2.254492, 0.1134159, 1.999833, 0, 0, 0, 1, 1,
2.282714, 1.08375, 0.4877112, 0, 0, 0, 1, 1,
2.358458, 0.531128, 0.6523628, 0, 0, 0, 1, 1,
2.372831, -0.4454097, 2.551442, 0, 0, 0, 1, 1,
2.385599, 0.6504357, 0.5991936, 0, 0, 0, 1, 1,
2.415072, -1.0695, 1.866337, 0, 0, 0, 1, 1,
2.429298, 0.1708681, 1.393126, 1, 1, 1, 1, 1,
2.541693, -1.166232, 2.102918, 1, 1, 1, 1, 1,
2.574698, -1.367486, 2.574028, 1, 1, 1, 1, 1,
2.604438, 0.8263165, -0.001549669, 1, 1, 1, 1, 1,
2.638243, 1.595245, 0.07545373, 1, 1, 1, 1, 1,
2.759519, 0.0812942, 0.441534, 1, 1, 1, 1, 1,
3.180456, 0.09571733, 3.347941, 1, 1, 1, 1, 1
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
var radius = 9.909105;
var distance = 34.80531;
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
mvMatrix.translate( -0.09849691, 0.1227789, 0.9084213 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.80531);
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
