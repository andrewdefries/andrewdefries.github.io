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
-2.934459, 1.372346, -0.04588068, 1, 0, 0, 1,
-2.900661, 0.5357681, 0.3222079, 1, 0.007843138, 0, 1,
-2.754455, 0.3771018, -0.9853184, 1, 0.01176471, 0, 1,
-2.606985, -0.8299522, -1.641154, 1, 0.01960784, 0, 1,
-2.503139, -1.553795, -1.567076, 1, 0.02352941, 0, 1,
-2.491443, -0.1315783, -3.064384, 1, 0.03137255, 0, 1,
-2.434573, -0.4170513, -2.800549, 1, 0.03529412, 0, 1,
-2.395859, 0.7713825, 0.9665812, 1, 0.04313726, 0, 1,
-2.313148, -0.1403783, -1.82195, 1, 0.04705882, 0, 1,
-2.309449, 1.371603, -0.357563, 1, 0.05490196, 0, 1,
-2.303252, -0.7492552, -0.7593605, 1, 0.05882353, 0, 1,
-2.291239, 0.678701, -1.671935, 1, 0.06666667, 0, 1,
-2.240005, -0.4221128, -4.29932, 1, 0.07058824, 0, 1,
-2.234593, 0.126574, -0.7091424, 1, 0.07843138, 0, 1,
-2.199103, -0.9897004, -0.9443403, 1, 0.08235294, 0, 1,
-2.189797, -0.2228278, -1.648691, 1, 0.09019608, 0, 1,
-2.130917, -0.9354636, -0.528992, 1, 0.09411765, 0, 1,
-2.113239, 0.3061143, -2.429531, 1, 0.1019608, 0, 1,
-2.061433, 0.04324959, -1.63388, 1, 0.1098039, 0, 1,
-2.032233, 0.2190728, -1.064476, 1, 0.1137255, 0, 1,
-2.016499, 1.116836, -2.797457, 1, 0.1215686, 0, 1,
-1.997609, -1.734991, -1.519689, 1, 0.1254902, 0, 1,
-1.979266, 0.8346914, 0.3349425, 1, 0.1333333, 0, 1,
-1.977185, 0.1266513, -1.965596, 1, 0.1372549, 0, 1,
-1.976802, 0.8436242, -0.621004, 1, 0.145098, 0, 1,
-1.871935, -0.02619343, -1.281968, 1, 0.1490196, 0, 1,
-1.867782, 0.7212246, -2.381427, 1, 0.1568628, 0, 1,
-1.866897, 0.7458009, -0.4466234, 1, 0.1607843, 0, 1,
-1.859998, 0.6414316, -0.8453612, 1, 0.1686275, 0, 1,
-1.843635, -0.2280266, -0.5995638, 1, 0.172549, 0, 1,
-1.838735, 0.5959539, -0.7730772, 1, 0.1803922, 0, 1,
-1.816269, -0.06265363, -0.5710866, 1, 0.1843137, 0, 1,
-1.795707, -1.100762, -1.069796, 1, 0.1921569, 0, 1,
-1.787808, -0.07558551, -0.5098737, 1, 0.1960784, 0, 1,
-1.780693, -1.124666, -2.749812, 1, 0.2039216, 0, 1,
-1.745293, -1.597782, -3.040792, 1, 0.2117647, 0, 1,
-1.729763, -0.3834278, -1.352831, 1, 0.2156863, 0, 1,
-1.717325, -0.479356, -1.709543, 1, 0.2235294, 0, 1,
-1.712539, 1.519806, -0.430359, 1, 0.227451, 0, 1,
-1.709019, -0.6467206, -3.098333, 1, 0.2352941, 0, 1,
-1.708097, 0.8476303, 1.021461, 1, 0.2392157, 0, 1,
-1.70455, 1.082925, -0.2788738, 1, 0.2470588, 0, 1,
-1.671283, -0.2945977, -1.155968, 1, 0.2509804, 0, 1,
-1.661166, -1.759583, -3.120866, 1, 0.2588235, 0, 1,
-1.66114, -0.7450628, -1.646382, 1, 0.2627451, 0, 1,
-1.642757, -0.1692612, -0.5711165, 1, 0.2705882, 0, 1,
-1.640527, 0.4639871, -0.8947361, 1, 0.2745098, 0, 1,
-1.634202, 0.7077105, -1.239067, 1, 0.282353, 0, 1,
-1.618248, -0.9804356, -2.711153, 1, 0.2862745, 0, 1,
-1.603448, -0.359379, -0.8183582, 1, 0.2941177, 0, 1,
-1.589711, -0.5375168, -3.099853, 1, 0.3019608, 0, 1,
-1.583851, -1.612983, -2.90977, 1, 0.3058824, 0, 1,
-1.568426, -1.097142, -2.130789, 1, 0.3137255, 0, 1,
-1.561542, -0.3739341, -2.689352, 1, 0.3176471, 0, 1,
-1.561495, 1.24838, -1.268699, 1, 0.3254902, 0, 1,
-1.560078, -0.4361987, -1.014201, 1, 0.3294118, 0, 1,
-1.559397, 0.5643854, 0.2227436, 1, 0.3372549, 0, 1,
-1.55599, -0.3155974, -1.679346, 1, 0.3411765, 0, 1,
-1.553997, -0.07003763, -0.7268975, 1, 0.3490196, 0, 1,
-1.541332, 0.1460863, -4.091473, 1, 0.3529412, 0, 1,
-1.523073, -0.3546232, -2.849399, 1, 0.3607843, 0, 1,
-1.516451, -0.2406101, -1.85656, 1, 0.3647059, 0, 1,
-1.496983, -0.9756508, -0.9458378, 1, 0.372549, 0, 1,
-1.488154, 2.281437, -1.404235, 1, 0.3764706, 0, 1,
-1.480074, 0.1502725, -3.574377, 1, 0.3843137, 0, 1,
-1.479319, -0.9174905, -3.164104, 1, 0.3882353, 0, 1,
-1.452729, 1.950294, -0.3820229, 1, 0.3960784, 0, 1,
-1.451712, 1.228737, 0.2916207, 1, 0.4039216, 0, 1,
-1.451466, 0.7579281, -1.968152, 1, 0.4078431, 0, 1,
-1.446071, 1.507731, -2.116027, 1, 0.4156863, 0, 1,
-1.437259, 1.491917, -0.4517548, 1, 0.4196078, 0, 1,
-1.434616, -1.913814, -1.849185, 1, 0.427451, 0, 1,
-1.432106, -0.9266223, -3.328092, 1, 0.4313726, 0, 1,
-1.431689, -1.952199, -1.090552, 1, 0.4392157, 0, 1,
-1.422975, -0.04606934, -1.444014, 1, 0.4431373, 0, 1,
-1.42173, 0.574095, -0.09420839, 1, 0.4509804, 0, 1,
-1.400189, -0.0771786, -2.43925, 1, 0.454902, 0, 1,
-1.375674, 0.3624822, -0.7692456, 1, 0.4627451, 0, 1,
-1.358285, 2.804924, -2.088572, 1, 0.4666667, 0, 1,
-1.346922, 0.5476406, -0.3615498, 1, 0.4745098, 0, 1,
-1.317578, 0.469211, -2.38824, 1, 0.4784314, 0, 1,
-1.315321, 0.1589988, -2.948291, 1, 0.4862745, 0, 1,
-1.312098, -1.58507, -1.292482, 1, 0.4901961, 0, 1,
-1.298591, 0.7594541, -1.252237, 1, 0.4980392, 0, 1,
-1.29745, 0.4979979, -1.802914, 1, 0.5058824, 0, 1,
-1.291638, -0.2871913, -1.000962, 1, 0.509804, 0, 1,
-1.286086, -2.427094, -2.890269, 1, 0.5176471, 0, 1,
-1.273257, 1.211408, -0.927586, 1, 0.5215687, 0, 1,
-1.26498, 0.319429, -1.603488, 1, 0.5294118, 0, 1,
-1.264223, 0.5493416, -1.849592, 1, 0.5333334, 0, 1,
-1.257532, -0.4059205, -1.466806, 1, 0.5411765, 0, 1,
-1.251489, 0.3383896, -1.758359, 1, 0.5450981, 0, 1,
-1.247842, -0.3683563, -1.95132, 1, 0.5529412, 0, 1,
-1.244195, -0.1465574, -0.09618745, 1, 0.5568628, 0, 1,
-1.243136, 0.8584223, 0.8431394, 1, 0.5647059, 0, 1,
-1.238702, 0.09655903, -1.31665, 1, 0.5686275, 0, 1,
-1.231875, -0.4223702, -3.589711, 1, 0.5764706, 0, 1,
-1.225569, -0.7810336, -0.8744635, 1, 0.5803922, 0, 1,
-1.222218, -0.8253776, -2.838161, 1, 0.5882353, 0, 1,
-1.215907, -0.7975916, -3.755369, 1, 0.5921569, 0, 1,
-1.213155, -1.180894, -2.866854, 1, 0.6, 0, 1,
-1.211235, 2.241735, 0.08166121, 1, 0.6078432, 0, 1,
-1.210012, -0.4489547, -1.987731, 1, 0.6117647, 0, 1,
-1.203076, -0.7385408, -2.409131, 1, 0.6196079, 0, 1,
-1.197564, -0.05228775, -1.646483, 1, 0.6235294, 0, 1,
-1.195579, -0.6955219, -1.137187, 1, 0.6313726, 0, 1,
-1.194161, 0.7376909, -2.189787, 1, 0.6352941, 0, 1,
-1.181461, 0.631962, -1.365549, 1, 0.6431373, 0, 1,
-1.177076, 1.068228, -2.830072, 1, 0.6470588, 0, 1,
-1.168588, -0.4447708, -1.885621, 1, 0.654902, 0, 1,
-1.165128, -0.3664882, -2.647179, 1, 0.6588235, 0, 1,
-1.15192, -0.03486701, -1.89077, 1, 0.6666667, 0, 1,
-1.149072, 0.4317842, -1.510304, 1, 0.6705883, 0, 1,
-1.148795, 0.5942492, -1.471239, 1, 0.6784314, 0, 1,
-1.147762, -0.5510151, -2.48834, 1, 0.682353, 0, 1,
-1.143568, 1.54118, -1.907138, 1, 0.6901961, 0, 1,
-1.143256, 0.332289, -1.200213, 1, 0.6941177, 0, 1,
-1.143202, -0.4956318, -0.957083, 1, 0.7019608, 0, 1,
-1.142427, 0.07698059, -1.865273, 1, 0.7098039, 0, 1,
-1.138182, 0.2421105, -0.9640784, 1, 0.7137255, 0, 1,
-1.136543, -0.1609226, -0.3890741, 1, 0.7215686, 0, 1,
-1.135691, 0.922611, -0.7933395, 1, 0.7254902, 0, 1,
-1.129346, -0.8517832, -3.11084, 1, 0.7333333, 0, 1,
-1.125038, -0.8247887, -2.565452, 1, 0.7372549, 0, 1,
-1.124443, 0.0782866, -0.6256214, 1, 0.7450981, 0, 1,
-1.121004, 0.5626714, -2.756441, 1, 0.7490196, 0, 1,
-1.114595, 0.2700763, -1.534428, 1, 0.7568628, 0, 1,
-1.109674, -0.5369281, -1.058056, 1, 0.7607843, 0, 1,
-1.107588, -0.07340842, -2.033699, 1, 0.7686275, 0, 1,
-1.102233, 0.997107, -0.3357848, 1, 0.772549, 0, 1,
-1.101344, -2.495548, -2.081023, 1, 0.7803922, 0, 1,
-1.089375, 2.197708, -0.4589585, 1, 0.7843137, 0, 1,
-1.088144, -0.7452456, -3.603441, 1, 0.7921569, 0, 1,
-1.087353, 0.8863487, -2.62413, 1, 0.7960784, 0, 1,
-1.081495, -1.540022, -2.102741, 1, 0.8039216, 0, 1,
-1.0787, 1.667386, 0.9332072, 1, 0.8117647, 0, 1,
-1.051981, 0.7660176, -1.366435, 1, 0.8156863, 0, 1,
-1.0485, 0.658899, -0.547904, 1, 0.8235294, 0, 1,
-1.047251, -0.2902491, -2.960975, 1, 0.827451, 0, 1,
-1.043547, -0.1480422, -4.055161, 1, 0.8352941, 0, 1,
-1.035366, -1.550346, -3.524764, 1, 0.8392157, 0, 1,
-1.035016, 0.1529095, -2.078583, 1, 0.8470588, 0, 1,
-1.034413, 0.06292301, -2.565582, 1, 0.8509804, 0, 1,
-1.028855, -0.6312599, -4.324993, 1, 0.8588235, 0, 1,
-1.027893, -0.1887784, -1.444057, 1, 0.8627451, 0, 1,
-1.019251, 1.485311, -1.89505, 1, 0.8705882, 0, 1,
-1.014643, 0.266427, -3.712339, 1, 0.8745098, 0, 1,
-1.011358, -1.327428, -1.900265, 1, 0.8823529, 0, 1,
-1.009285, -0.7176906, -0.5283577, 1, 0.8862745, 0, 1,
-1.004454, 2.05912, -0.796363, 1, 0.8941177, 0, 1,
-0.9910759, 0.9758014, 0.514258, 1, 0.8980392, 0, 1,
-0.9862011, -1.634, -2.416932, 1, 0.9058824, 0, 1,
-0.9840755, 0.2131033, -0.07361862, 1, 0.9137255, 0, 1,
-0.9800505, 0.1198319, -3.037112, 1, 0.9176471, 0, 1,
-0.9793926, 1.982618, -0.3528305, 1, 0.9254902, 0, 1,
-0.9702119, 0.7437216, -1.85802, 1, 0.9294118, 0, 1,
-0.9684215, -1.703263, -2.824765, 1, 0.9372549, 0, 1,
-0.9638149, -0.8982169, -2.202667, 1, 0.9411765, 0, 1,
-0.9611641, 0.2974328, -1.653028, 1, 0.9490196, 0, 1,
-0.9601527, 0.7305786, -0.2935011, 1, 0.9529412, 0, 1,
-0.9563497, -1.093624, -2.867571, 1, 0.9607843, 0, 1,
-0.9506246, -2.512379, -4.500682, 1, 0.9647059, 0, 1,
-0.9361966, -0.4115434, -2.300933, 1, 0.972549, 0, 1,
-0.9278614, 1.132861, -0.7384295, 1, 0.9764706, 0, 1,
-0.9262103, -0.0396036, -1.445656, 1, 0.9843137, 0, 1,
-0.922495, -0.002121676, -0.5929837, 1, 0.9882353, 0, 1,
-0.9221698, 0.4015509, -1.197726, 1, 0.9960784, 0, 1,
-0.9212443, 0.9920176, 0.4541986, 0.9960784, 1, 0, 1,
-0.9196371, 0.4435481, -0.7823534, 0.9921569, 1, 0, 1,
-0.9120973, -2.747473, -2.509879, 0.9843137, 1, 0, 1,
-0.9114583, 0.2703073, -1.065693, 0.9803922, 1, 0, 1,
-0.908695, -0.3355289, -0.8560846, 0.972549, 1, 0, 1,
-0.9084162, 0.517152, -1.338586, 0.9686275, 1, 0, 1,
-0.9070412, 0.06210996, -2.402942, 0.9607843, 1, 0, 1,
-0.9029526, -0.7188735, -2.883578, 0.9568627, 1, 0, 1,
-0.8967679, 0.4366103, -1.740705, 0.9490196, 1, 0, 1,
-0.8948839, -0.9192885, -4.668774, 0.945098, 1, 0, 1,
-0.8942805, 1.220752, -0.3645037, 0.9372549, 1, 0, 1,
-0.8930767, 0.9483907, 0.1867342, 0.9333333, 1, 0, 1,
-0.8890008, -0.1793471, -0.4965717, 0.9254902, 1, 0, 1,
-0.8878329, 0.01357408, -2.361603, 0.9215686, 1, 0, 1,
-0.8873668, 0.4404234, -0.8216938, 0.9137255, 1, 0, 1,
-0.8671601, -0.6808035, -2.531268, 0.9098039, 1, 0, 1,
-0.8613796, -1.782507, -2.368393, 0.9019608, 1, 0, 1,
-0.8608371, -0.4206203, -2.866621, 0.8941177, 1, 0, 1,
-0.8599225, 0.2670392, -2.68355, 0.8901961, 1, 0, 1,
-0.8598255, -0.2204611, -1.663001, 0.8823529, 1, 0, 1,
-0.8582311, 0.3662351, -0.5155853, 0.8784314, 1, 0, 1,
-0.8559048, 0.3900296, -2.568465, 0.8705882, 1, 0, 1,
-0.8526409, -1.488618, -2.169649, 0.8666667, 1, 0, 1,
-0.8473502, 1.49823, -1.386483, 0.8588235, 1, 0, 1,
-0.8433987, 0.05719163, 1.002248, 0.854902, 1, 0, 1,
-0.8421056, 0.01499996, -0.612634, 0.8470588, 1, 0, 1,
-0.8337207, 0.2805935, 0.2930568, 0.8431373, 1, 0, 1,
-0.8329743, 0.394764, -1.27997, 0.8352941, 1, 0, 1,
-0.8303353, -0.1749571, -2.699081, 0.8313726, 1, 0, 1,
-0.8291388, 0.4957879, -0.9296784, 0.8235294, 1, 0, 1,
-0.827408, 0.3196243, -2.718373, 0.8196079, 1, 0, 1,
-0.8230524, -0.7105905, -1.915187, 0.8117647, 1, 0, 1,
-0.8091866, -0.9598968, -2.55829, 0.8078431, 1, 0, 1,
-0.8059668, 0.7006888, -0.09051497, 0.8, 1, 0, 1,
-0.7987989, 0.2838904, -1.406645, 0.7921569, 1, 0, 1,
-0.796469, 0.4447092, 1.425985, 0.7882353, 1, 0, 1,
-0.7922707, 1.703955, -1.202879, 0.7803922, 1, 0, 1,
-0.7864076, -0.7591654, -1.519725, 0.7764706, 1, 0, 1,
-0.7853743, -0.5815144, -1.241293, 0.7686275, 1, 0, 1,
-0.7835559, 0.1108885, -1.91042, 0.7647059, 1, 0, 1,
-0.7818753, -0.5828955, -2.828251, 0.7568628, 1, 0, 1,
-0.7768734, 0.2770805, -0.3810627, 0.7529412, 1, 0, 1,
-0.7767898, 0.3037833, -2.714243, 0.7450981, 1, 0, 1,
-0.7744877, 0.8529373, -0.6305842, 0.7411765, 1, 0, 1,
-0.7700099, -0.1788855, -1.280042, 0.7333333, 1, 0, 1,
-0.768442, 2.235884, -0.2726101, 0.7294118, 1, 0, 1,
-0.7616695, -0.1047144, -2.584478, 0.7215686, 1, 0, 1,
-0.7592203, 0.5093173, -0.6052157, 0.7176471, 1, 0, 1,
-0.7553802, 1.297701, 1.054048, 0.7098039, 1, 0, 1,
-0.7523181, 0.7402202, -0.3997409, 0.7058824, 1, 0, 1,
-0.7519487, -1.325431, -2.256783, 0.6980392, 1, 0, 1,
-0.7473155, 0.6081335, 0.01733403, 0.6901961, 1, 0, 1,
-0.7459337, 0.8803625, -1.71769, 0.6862745, 1, 0, 1,
-0.7458807, -0.1740823, -1.320176, 0.6784314, 1, 0, 1,
-0.744051, -1.021091, -3.381907, 0.6745098, 1, 0, 1,
-0.7394477, 1.0736, -1.326581, 0.6666667, 1, 0, 1,
-0.732487, -0.141721, 0.05521934, 0.6627451, 1, 0, 1,
-0.7295552, 0.9817219, -1.081128, 0.654902, 1, 0, 1,
-0.7286266, 0.9780557, -0.1132333, 0.6509804, 1, 0, 1,
-0.723761, 0.691308, 0.6682969, 0.6431373, 1, 0, 1,
-0.7232436, -0.3354189, -0.6416051, 0.6392157, 1, 0, 1,
-0.7214176, -1.319244, -1.963651, 0.6313726, 1, 0, 1,
-0.7183695, -1.215835, -2.680941, 0.627451, 1, 0, 1,
-0.7105033, 0.950749, -0.663338, 0.6196079, 1, 0, 1,
-0.7103361, 0.4332689, 0.03145481, 0.6156863, 1, 0, 1,
-0.7099729, -0.6633018, -3.114098, 0.6078432, 1, 0, 1,
-0.7097694, -0.4913436, -2.941403, 0.6039216, 1, 0, 1,
-0.7089102, -0.9051184, -1.567929, 0.5960785, 1, 0, 1,
-0.7066271, 0.6728603, -1.018066, 0.5882353, 1, 0, 1,
-0.7037815, -0.5534431, -4.117577, 0.5843138, 1, 0, 1,
-0.7031907, -0.7878838, -1.263928, 0.5764706, 1, 0, 1,
-0.7014815, -0.8483757, -0.7622876, 0.572549, 1, 0, 1,
-0.701335, 1.242506, -0.1653987, 0.5647059, 1, 0, 1,
-0.6973081, 0.6975423, -0.8969728, 0.5607843, 1, 0, 1,
-0.6927446, -0.2965406, -3.339607, 0.5529412, 1, 0, 1,
-0.6925738, -0.4456452, -2.775377, 0.5490196, 1, 0, 1,
-0.6907221, -0.984162, -2.701204, 0.5411765, 1, 0, 1,
-0.6768543, -0.009066582, -0.7236342, 0.5372549, 1, 0, 1,
-0.6761678, 0.4252152, -0.6626492, 0.5294118, 1, 0, 1,
-0.6731989, 0.8907897, -2.726938, 0.5254902, 1, 0, 1,
-0.6711962, -0.6024709, -0.17541, 0.5176471, 1, 0, 1,
-0.6692648, 2.092654, 0.3942194, 0.5137255, 1, 0, 1,
-0.6689462, -0.4417866, -3.330218, 0.5058824, 1, 0, 1,
-0.6626807, 0.5282927, -1.492528, 0.5019608, 1, 0, 1,
-0.6581668, -1.52989, -1.346984, 0.4941176, 1, 0, 1,
-0.6552715, 1.06647, -1.57604, 0.4862745, 1, 0, 1,
-0.6550815, -0.04099979, -1.865503, 0.4823529, 1, 0, 1,
-0.6547407, 0.2566401, -1.988489, 0.4745098, 1, 0, 1,
-0.6535838, 0.6319641, -0.5984056, 0.4705882, 1, 0, 1,
-0.6519235, 1.21761, -0.756893, 0.4627451, 1, 0, 1,
-0.6501992, -1.559572, -4.390007, 0.4588235, 1, 0, 1,
-0.6479303, 1.32353, -0.9416841, 0.4509804, 1, 0, 1,
-0.6432834, -0.2578543, -2.458614, 0.4470588, 1, 0, 1,
-0.6379282, 1.225081, -0.3133689, 0.4392157, 1, 0, 1,
-0.628125, -1.834986, -3.244064, 0.4352941, 1, 0, 1,
-0.6280555, -0.6655974, -2.51449, 0.427451, 1, 0, 1,
-0.6263473, -1.456236, -3.515109, 0.4235294, 1, 0, 1,
-0.6257848, 0.8244702, -0.6788185, 0.4156863, 1, 0, 1,
-0.6179519, 1.913683, -1.695679, 0.4117647, 1, 0, 1,
-0.6161561, 1.362088, -0.2261999, 0.4039216, 1, 0, 1,
-0.6155314, 1.282267, -2.329706, 0.3960784, 1, 0, 1,
-0.5999544, -0.3729853, -2.167373, 0.3921569, 1, 0, 1,
-0.599147, 0.9375046, 1.161016, 0.3843137, 1, 0, 1,
-0.5985098, -0.543331, -1.825408, 0.3803922, 1, 0, 1,
-0.5946475, -0.1701576, -2.800502, 0.372549, 1, 0, 1,
-0.5934381, 0.1239361, -1.624728, 0.3686275, 1, 0, 1,
-0.5918671, 0.1276761, -2.493663, 0.3607843, 1, 0, 1,
-0.590799, 2.315935, -1.145668, 0.3568628, 1, 0, 1,
-0.5901339, -0.7913327, -1.204794, 0.3490196, 1, 0, 1,
-0.5867408, 1.215513, -0.7522253, 0.345098, 1, 0, 1,
-0.5842785, 0.3007181, -0.1309533, 0.3372549, 1, 0, 1,
-0.5842171, 1.30347, -0.7193226, 0.3333333, 1, 0, 1,
-0.583118, -2.287309, -2.416587, 0.3254902, 1, 0, 1,
-0.5798062, -0.226402, -0.1454801, 0.3215686, 1, 0, 1,
-0.5779234, 2.06286, 0.5114409, 0.3137255, 1, 0, 1,
-0.5738487, -2.02184, -3.076408, 0.3098039, 1, 0, 1,
-0.5669535, -1.95085, -2.329476, 0.3019608, 1, 0, 1,
-0.5614998, -0.1535328, -1.902107, 0.2941177, 1, 0, 1,
-0.5603594, 0.8120854, -1.386532, 0.2901961, 1, 0, 1,
-0.5561938, -0.8978487, -2.936464, 0.282353, 1, 0, 1,
-0.5546579, -0.3007415, -3.218711, 0.2784314, 1, 0, 1,
-0.551932, -1.146348, -3.294317, 0.2705882, 1, 0, 1,
-0.5448863, -0.9556192, -1.28483, 0.2666667, 1, 0, 1,
-0.5425203, 1.593014, -0.05982598, 0.2588235, 1, 0, 1,
-0.5425201, -0.3042495, -2.822403, 0.254902, 1, 0, 1,
-0.5424422, -0.1140861, -1.364345, 0.2470588, 1, 0, 1,
-0.5413498, -0.3486205, -3.116507, 0.2431373, 1, 0, 1,
-0.5389835, -0.05616043, -1.53113, 0.2352941, 1, 0, 1,
-0.5364814, 0.2926822, -0.7944639, 0.2313726, 1, 0, 1,
-0.5359043, 0.2296758, -1.079197, 0.2235294, 1, 0, 1,
-0.5318919, -1.376618, -2.229111, 0.2196078, 1, 0, 1,
-0.5255128, 0.236332, -0.5323313, 0.2117647, 1, 0, 1,
-0.5224764, -1.142202, -4.077112, 0.2078431, 1, 0, 1,
-0.5209794, -1.173804, -2.260339, 0.2, 1, 0, 1,
-0.5166683, 0.1033649, -1.26202, 0.1921569, 1, 0, 1,
-0.5163886, -0.2490307, -1.953151, 0.1882353, 1, 0, 1,
-0.5078436, 1.126444, -1.016787, 0.1803922, 1, 0, 1,
-0.5067862, -0.1193847, -3.271484, 0.1764706, 1, 0, 1,
-0.505268, 1.996497, -1.564927, 0.1686275, 1, 0, 1,
-0.5023652, -1.363222, -4.5436, 0.1647059, 1, 0, 1,
-0.4992034, -0.7248977, -2.197521, 0.1568628, 1, 0, 1,
-0.4985432, -1.332807, -0.991056, 0.1529412, 1, 0, 1,
-0.4978313, -1.923166, -2.850148, 0.145098, 1, 0, 1,
-0.4894177, 0.7827125, 0.009378342, 0.1411765, 1, 0, 1,
-0.4887106, -0.08902036, -0.7676424, 0.1333333, 1, 0, 1,
-0.4755544, 0.7311566, -0.8678479, 0.1294118, 1, 0, 1,
-0.4729438, 0.6643631, -0.3947805, 0.1215686, 1, 0, 1,
-0.4724344, 0.8676925, 0.7513781, 0.1176471, 1, 0, 1,
-0.4680624, -0.1129613, -1.74678, 0.1098039, 1, 0, 1,
-0.4612943, 0.970194, -0.2634592, 0.1058824, 1, 0, 1,
-0.4607561, 0.5529195, -0.7152903, 0.09803922, 1, 0, 1,
-0.459945, -1.289002, -2.336015, 0.09019608, 1, 0, 1,
-0.4554685, -1.339204, -2.970403, 0.08627451, 1, 0, 1,
-0.4554293, 0.817725, -1.198814, 0.07843138, 1, 0, 1,
-0.4523832, -1.637225, -2.931597, 0.07450981, 1, 0, 1,
-0.4462816, 0.08897022, -0.3829615, 0.06666667, 1, 0, 1,
-0.4435363, -0.3927884, -0.8492732, 0.0627451, 1, 0, 1,
-0.4389412, -1.962155, -3.673623, 0.05490196, 1, 0, 1,
-0.4373014, 1.052398, -0.3545844, 0.05098039, 1, 0, 1,
-0.4368482, 2.731709, -1.19424, 0.04313726, 1, 0, 1,
-0.4327041, 0.3712552, -0.7724804, 0.03921569, 1, 0, 1,
-0.4307636, -1.248068, -2.310178, 0.03137255, 1, 0, 1,
-0.4301291, 1.736925, 0.3155924, 0.02745098, 1, 0, 1,
-0.4297173, -0.3747665, -2.81109, 0.01960784, 1, 0, 1,
-0.4286551, -0.7470773, -3.258904, 0.01568628, 1, 0, 1,
-0.4256712, 1.632278, 0.169212, 0.007843138, 1, 0, 1,
-0.4230574, -0.8958518, -3.029149, 0.003921569, 1, 0, 1,
-0.4195536, 0.1675769, -0.2564805, 0, 1, 0.003921569, 1,
-0.4169323, -0.8239627, -1.814619, 0, 1, 0.01176471, 1,
-0.4162031, -0.6518146, -1.044667, 0, 1, 0.01568628, 1,
-0.4153248, -0.0816303, -0.9869751, 0, 1, 0.02352941, 1,
-0.4114116, -0.9188396, -2.904971, 0, 1, 0.02745098, 1,
-0.4077592, 1.836856, -0.4554073, 0, 1, 0.03529412, 1,
-0.4039921, -0.1806246, -1.027885, 0, 1, 0.03921569, 1,
-0.4015181, 0.9087905, -1.3075, 0, 1, 0.04705882, 1,
-0.3994239, -0.356029, -1.200474, 0, 1, 0.05098039, 1,
-0.3936377, -0.5216899, -2.195393, 0, 1, 0.05882353, 1,
-0.3767112, -1.303158, -1.64726, 0, 1, 0.0627451, 1,
-0.3751476, 0.6087611, -0.2199094, 0, 1, 0.07058824, 1,
-0.3741548, -0.3196857, -1.826118, 0, 1, 0.07450981, 1,
-0.3732302, -1.652407, -3.038174, 0, 1, 0.08235294, 1,
-0.3631217, 2.177406, 0.6344813, 0, 1, 0.08627451, 1,
-0.3630521, -1.907597, -2.762633, 0, 1, 0.09411765, 1,
-0.3626821, -0.8335991, -3.677063, 0, 1, 0.1019608, 1,
-0.3621889, -0.9633135, -1.695641, 0, 1, 0.1058824, 1,
-0.360132, 1.54687, -0.6843774, 0, 1, 0.1137255, 1,
-0.354708, -1.608023, -2.872292, 0, 1, 0.1176471, 1,
-0.3541456, 0.01389543, -1.798823, 0, 1, 0.1254902, 1,
-0.35367, -0.234646, -1.440105, 0, 1, 0.1294118, 1,
-0.3517995, -1.05651, -2.061196, 0, 1, 0.1372549, 1,
-0.3514513, -1.053052, -4.452101, 0, 1, 0.1411765, 1,
-0.3511374, 0.655127, -0.7576739, 0, 1, 0.1490196, 1,
-0.3447044, -0.5108379, -4.110388, 0, 1, 0.1529412, 1,
-0.3375417, 1.459114, -0.3377162, 0, 1, 0.1607843, 1,
-0.3312501, -0.6167725, -1.560906, 0, 1, 0.1647059, 1,
-0.3289563, -0.2995726, -1.276051, 0, 1, 0.172549, 1,
-0.3286055, 0.3015684, -1.460842, 0, 1, 0.1764706, 1,
-0.3283059, -0.4044991, -1.882002, 0, 1, 0.1843137, 1,
-0.3276364, 0.181216, -0.8489466, 0, 1, 0.1882353, 1,
-0.3247404, -0.5530614, -4.074828, 0, 1, 0.1960784, 1,
-0.3245862, -1.222877, -3.173519, 0, 1, 0.2039216, 1,
-0.323095, -0.9650313, -2.778415, 0, 1, 0.2078431, 1,
-0.3186813, -3.276101, -3.241951, 0, 1, 0.2156863, 1,
-0.3154498, 1.411301, 0.9752383, 0, 1, 0.2196078, 1,
-0.3149332, -1.410132, -2.484675, 0, 1, 0.227451, 1,
-0.3140798, 0.3782637, -1.543391, 0, 1, 0.2313726, 1,
-0.3113904, -0.9455445, -1.368919, 0, 1, 0.2392157, 1,
-0.3091798, -0.9796551, -2.30658, 0, 1, 0.2431373, 1,
-0.3085369, 0.122753, -1.673754, 0, 1, 0.2509804, 1,
-0.3036809, -0.5846921, -3.011104, 0, 1, 0.254902, 1,
-0.296144, 0.9003179, -1.277314, 0, 1, 0.2627451, 1,
-0.2921989, 2.280499, -0.7625626, 0, 1, 0.2666667, 1,
-0.2868965, -0.02418975, -1.246844, 0, 1, 0.2745098, 1,
-0.2845768, 0.07416017, -0.2882924, 0, 1, 0.2784314, 1,
-0.2801445, 1.836543, -0.4073403, 0, 1, 0.2862745, 1,
-0.2758264, -1.753891, -1.367754, 0, 1, 0.2901961, 1,
-0.268711, 0.5313858, -2.254895, 0, 1, 0.2980392, 1,
-0.2674454, -0.1016693, -0.9199082, 0, 1, 0.3058824, 1,
-0.266324, 0.1647819, -0.8155503, 0, 1, 0.3098039, 1,
-0.2659056, -0.6517101, -2.369783, 0, 1, 0.3176471, 1,
-0.2477266, -0.6996106, -4.69351, 0, 1, 0.3215686, 1,
-0.2470287, 0.9743919, 1.377842, 0, 1, 0.3294118, 1,
-0.2458337, -0.3311819, -2.386247, 0, 1, 0.3333333, 1,
-0.2447758, -0.3459973, -0.9786559, 0, 1, 0.3411765, 1,
-0.2440923, -0.4013017, -2.28214, 0, 1, 0.345098, 1,
-0.2401958, 1.493656, -0.07400989, 0, 1, 0.3529412, 1,
-0.2392348, 0.9923912, -0.1366721, 0, 1, 0.3568628, 1,
-0.2384329, -1.278801, -3.418856, 0, 1, 0.3647059, 1,
-0.2370092, 0.3619384, 0.3180148, 0, 1, 0.3686275, 1,
-0.2363597, -0.3110424, -1.805454, 0, 1, 0.3764706, 1,
-0.2270132, -0.1744281, -3.625835, 0, 1, 0.3803922, 1,
-0.2269009, 1.406552, -1.523272, 0, 1, 0.3882353, 1,
-0.2252069, 1.295017, -0.2455706, 0, 1, 0.3921569, 1,
-0.2217648, -1.701496, -3.971309, 0, 1, 0.4, 1,
-0.2199097, 1.641446, -2.583707, 0, 1, 0.4078431, 1,
-0.218712, 0.1867649, -1.027949, 0, 1, 0.4117647, 1,
-0.218239, 0.3718464, 0.1291822, 0, 1, 0.4196078, 1,
-0.2155139, -1.00568, -3.167222, 0, 1, 0.4235294, 1,
-0.2077143, -1.061049, -4.149768, 0, 1, 0.4313726, 1,
-0.2042803, -0.4096829, -2.453844, 0, 1, 0.4352941, 1,
-0.2035122, -0.8109217, -2.87361, 0, 1, 0.4431373, 1,
-0.1987982, -0.3240961, -2.42231, 0, 1, 0.4470588, 1,
-0.1976293, 1.78768, 0.1887012, 0, 1, 0.454902, 1,
-0.1926659, -0.2217117, -1.853745, 0, 1, 0.4588235, 1,
-0.1875033, -0.2320367, -1.643625, 0, 1, 0.4666667, 1,
-0.1829448, 0.6279026, -0.9208865, 0, 1, 0.4705882, 1,
-0.1796676, 0.5822653, 1.125565, 0, 1, 0.4784314, 1,
-0.1793023, 0.9054483, 0.8172631, 0, 1, 0.4823529, 1,
-0.1769072, -0.5296789, -2.877002, 0, 1, 0.4901961, 1,
-0.1760493, -2.044406, -3.657776, 0, 1, 0.4941176, 1,
-0.1668639, -2.023979, -3.499721, 0, 1, 0.5019608, 1,
-0.1649582, -0.6039135, -3.3193, 0, 1, 0.509804, 1,
-0.1601922, 1.250345, 0.4278032, 0, 1, 0.5137255, 1,
-0.1546178, -0.2860111, -0.2940173, 0, 1, 0.5215687, 1,
-0.1505572, -1.909945, -2.556194, 0, 1, 0.5254902, 1,
-0.1505106, -0.5847512, -2.262805, 0, 1, 0.5333334, 1,
-0.1485895, 0.4706412, 0.277571, 0, 1, 0.5372549, 1,
-0.1471218, -1.67751, -3.720478, 0, 1, 0.5450981, 1,
-0.1466245, -0.7478817, -1.539166, 0, 1, 0.5490196, 1,
-0.1432009, -0.6005913, -3.998018, 0, 1, 0.5568628, 1,
-0.1416311, 0.5892648, -0.1809829, 0, 1, 0.5607843, 1,
-0.141617, 0.3673672, -1.033767, 0, 1, 0.5686275, 1,
-0.1338999, -0.3419833, -3.556752, 0, 1, 0.572549, 1,
-0.1325405, -0.9106991, -3.031363, 0, 1, 0.5803922, 1,
-0.1316089, 0.9597251, -1.922033, 0, 1, 0.5843138, 1,
-0.1276039, 1.730654, 0.3898095, 0, 1, 0.5921569, 1,
-0.1271182, 0.1633852, 0.6656749, 0, 1, 0.5960785, 1,
-0.123516, -0.9477994, -4.676513, 0, 1, 0.6039216, 1,
-0.1229311, 0.3950115, -0.9843419, 0, 1, 0.6117647, 1,
-0.1213003, 0.1528047, -1.011433, 0, 1, 0.6156863, 1,
-0.1179607, -0.1704935, -3.174859, 0, 1, 0.6235294, 1,
-0.1162188, 2.219561, 1.568837, 0, 1, 0.627451, 1,
-0.1003734, 0.3063771, -1.137266, 0, 1, 0.6352941, 1,
-0.09858502, -0.1013515, -2.177937, 0, 1, 0.6392157, 1,
-0.09642059, 0.585986, 1.837552, 0, 1, 0.6470588, 1,
-0.09617639, -0.7102413, -3.481325, 0, 1, 0.6509804, 1,
-0.09366728, 1.261825, -1.448664, 0, 1, 0.6588235, 1,
-0.09310945, 0.9441285, 1.028242, 0, 1, 0.6627451, 1,
-0.0927227, 1.463189, -0.2952462, 0, 1, 0.6705883, 1,
-0.09127117, 0.4627856, 0.1488069, 0, 1, 0.6745098, 1,
-0.08848913, 1.188226, -1.481602, 0, 1, 0.682353, 1,
-0.08631004, 1.221215, -0.4556856, 0, 1, 0.6862745, 1,
-0.08576424, 0.2667249, 0.3271776, 0, 1, 0.6941177, 1,
-0.08559924, 0.7692334, -0.2889682, 0, 1, 0.7019608, 1,
-0.07780889, -0.800244, -2.893543, 0, 1, 0.7058824, 1,
-0.07544332, -0.5060622, -3.368544, 0, 1, 0.7137255, 1,
-0.07505916, 0.6468751, 0.5174893, 0, 1, 0.7176471, 1,
-0.07396332, -1.357958, -3.254405, 0, 1, 0.7254902, 1,
-0.07365891, 0.8049309, 1.485479, 0, 1, 0.7294118, 1,
-0.07190526, -1.117951, -4.222884, 0, 1, 0.7372549, 1,
-0.07188613, 1.334689, -0.7141609, 0, 1, 0.7411765, 1,
-0.07173149, -0.01204282, -1.507072, 0, 1, 0.7490196, 1,
-0.07056719, -0.5076196, -2.722005, 0, 1, 0.7529412, 1,
-0.06838254, -0.6216249, -1.149312, 0, 1, 0.7607843, 1,
-0.0659942, 0.3726499, -1.068766, 0, 1, 0.7647059, 1,
-0.06570803, 0.9073471, -0.9010372, 0, 1, 0.772549, 1,
-0.06499259, 0.7267959, -1.078758, 0, 1, 0.7764706, 1,
-0.05993209, 0.1440174, 0.3894933, 0, 1, 0.7843137, 1,
-0.05936112, -0.9246193, -2.223585, 0, 1, 0.7882353, 1,
-0.05481032, 0.6733821, -1.372464, 0, 1, 0.7960784, 1,
-0.05241062, 0.4534965, -0.6555178, 0, 1, 0.8039216, 1,
-0.04850458, -0.03610679, -4.326635, 0, 1, 0.8078431, 1,
-0.04781405, 0.4589147, 0.3081426, 0, 1, 0.8156863, 1,
-0.04368268, -0.5812211, -2.441944, 0, 1, 0.8196079, 1,
-0.04213312, -0.122412, -3.747038, 0, 1, 0.827451, 1,
-0.03840273, -1.001988, -1.974646, 0, 1, 0.8313726, 1,
-0.03300308, 0.362614, -0.6469697, 0, 1, 0.8392157, 1,
-0.03295251, -0.3492067, -2.963711, 0, 1, 0.8431373, 1,
-0.0325732, -2.018928, -2.50479, 0, 1, 0.8509804, 1,
-0.02474322, -0.8722329, -2.916064, 0, 1, 0.854902, 1,
-0.02225943, 0.9999176, 0.7451586, 0, 1, 0.8627451, 1,
-0.01775212, -0.03635348, -3.049929, 0, 1, 0.8666667, 1,
-0.01730402, 2.146581, 0.5267888, 0, 1, 0.8745098, 1,
-0.01654569, -0.8911474, -2.580712, 0, 1, 0.8784314, 1,
-0.01538889, 0.065548, -1.955734, 0, 1, 0.8862745, 1,
-0.01328909, 0.9181936, 1.900681, 0, 1, 0.8901961, 1,
-0.009313461, 1.341397, -0.9906701, 0, 1, 0.8980392, 1,
-0.009306645, 0.02782934, -1.050352, 0, 1, 0.9058824, 1,
-0.009089782, 1.002336, 0.8178189, 0, 1, 0.9098039, 1,
-0.008432923, 0.0449805, -1.544879, 0, 1, 0.9176471, 1,
-0.008093228, 0.06934538, -0.6637074, 0, 1, 0.9215686, 1,
-0.003885616, 0.6689952, 0.6816452, 0, 1, 0.9294118, 1,
-0.002820434, 0.370769, -0.3684651, 0, 1, 0.9333333, 1,
-0.001408314, 1.627911, -0.7627838, 0, 1, 0.9411765, 1,
0.0001265043, 1.036227, -0.3193695, 0, 1, 0.945098, 1,
0.0007356699, 0.1207093, -0.2340061, 0, 1, 0.9529412, 1,
0.001962052, -0.3243441, 3.386284, 0, 1, 0.9568627, 1,
0.003170288, -0.09745565, 2.386574, 0, 1, 0.9647059, 1,
0.003955816, 0.4656285, -0.2240277, 0, 1, 0.9686275, 1,
0.005665292, -0.7647414, 4.163014, 0, 1, 0.9764706, 1,
0.007379371, -0.5537271, 4.796479, 0, 1, 0.9803922, 1,
0.01063717, -1.654898, 2.682462, 0, 1, 0.9882353, 1,
0.01171972, -1.238035, 3.932834, 0, 1, 0.9921569, 1,
0.01262089, 0.7073359, 0.5261317, 0, 1, 1, 1,
0.01291499, 1.39317, -1.173458, 0, 0.9921569, 1, 1,
0.01321042, 0.2096189, -0.7160696, 0, 0.9882353, 1, 1,
0.01839454, 1.146054, 0.1273895, 0, 0.9803922, 1, 1,
0.01895497, 0.8100513, -1.3095, 0, 0.9764706, 1, 1,
0.02449501, -0.8233674, 2.93793, 0, 0.9686275, 1, 1,
0.02586816, 1.994382, 3.341229, 0, 0.9647059, 1, 1,
0.03527192, 0.2027063, 2.105116, 0, 0.9568627, 1, 1,
0.03611967, -0.2394484, 1.529152, 0, 0.9529412, 1, 1,
0.03795875, -0.5041007, 4.396904, 0, 0.945098, 1, 1,
0.04071335, 0.01249337, 0.5912663, 0, 0.9411765, 1, 1,
0.04384436, 1.379028, -0.9764076, 0, 0.9333333, 1, 1,
0.04469533, -1.129974, 2.99885, 0, 0.9294118, 1, 1,
0.04587696, -1.046572, 6.081784, 0, 0.9215686, 1, 1,
0.04632683, 0.5997834, 2.45698, 0, 0.9176471, 1, 1,
0.0515593, 0.1232348, -0.6658263, 0, 0.9098039, 1, 1,
0.05190749, 0.7136457, -1.51616, 0, 0.9058824, 1, 1,
0.05455407, 1.116165, 0.6065638, 0, 0.8980392, 1, 1,
0.05728336, -1.13465, 3.493515, 0, 0.8901961, 1, 1,
0.05754245, 0.3878843, 1.98338, 0, 0.8862745, 1, 1,
0.06226337, -0.1439538, 2.423626, 0, 0.8784314, 1, 1,
0.06470095, 1.906252, -0.8712099, 0, 0.8745098, 1, 1,
0.06921571, -1.996987, 1.28445, 0, 0.8666667, 1, 1,
0.06955402, -0.4433239, 1.995764, 0, 0.8627451, 1, 1,
0.07087112, -0.5011728, 2.300206, 0, 0.854902, 1, 1,
0.07200959, 0.8666385, -0.8609895, 0, 0.8509804, 1, 1,
0.07336364, 1.066235, 0.912906, 0, 0.8431373, 1, 1,
0.07370649, -0.2209319, 2.186396, 0, 0.8392157, 1, 1,
0.07453087, -0.1827559, 4.841904, 0, 0.8313726, 1, 1,
0.07574695, -1.769629, 4.312275, 0, 0.827451, 1, 1,
0.07994658, 1.303913, -0.2066285, 0, 0.8196079, 1, 1,
0.08227701, 1.099686, 0.01699365, 0, 0.8156863, 1, 1,
0.08487916, 0.3411083, -2.00021, 0, 0.8078431, 1, 1,
0.08537635, 0.8206356, 0.5657966, 0, 0.8039216, 1, 1,
0.08785633, 0.5470458, 0.8866796, 0, 0.7960784, 1, 1,
0.08837333, -0.9951816, 3.037685, 0, 0.7882353, 1, 1,
0.09232786, 1.785007, 0.02234584, 0, 0.7843137, 1, 1,
0.0929324, -0.7577775, 2.883541, 0, 0.7764706, 1, 1,
0.09332772, -0.8587254, 3.161062, 0, 0.772549, 1, 1,
0.09580538, 0.2182692, -0.1986122, 0, 0.7647059, 1, 1,
0.0964926, 0.6064212, 0.9024693, 0, 0.7607843, 1, 1,
0.09862048, -1.185364, 2.533728, 0, 0.7529412, 1, 1,
0.1033884, 1.812692, 0.5550485, 0, 0.7490196, 1, 1,
0.1051928, 0.05619568, 1.402422, 0, 0.7411765, 1, 1,
0.1111695, -1.392286, 2.01563, 0, 0.7372549, 1, 1,
0.1132835, -0.06770451, 2.846867, 0, 0.7294118, 1, 1,
0.1140557, 0.7422961, -1.09712, 0, 0.7254902, 1, 1,
0.116038, -0.5253029, 3.685301, 0, 0.7176471, 1, 1,
0.1165623, -0.9399022, 2.301136, 0, 0.7137255, 1, 1,
0.1171111, 0.8672622, 0.487079, 0, 0.7058824, 1, 1,
0.1172169, -1.083078, 3.714411, 0, 0.6980392, 1, 1,
0.1172245, 0.4115525, 1.280131, 0, 0.6941177, 1, 1,
0.1176234, 0.9621027, 2.127186, 0, 0.6862745, 1, 1,
0.1179734, 1.382098, 0.550012, 0, 0.682353, 1, 1,
0.1185138, -0.7821227, 5.03476, 0, 0.6745098, 1, 1,
0.1190832, -0.5940437, 2.533046, 0, 0.6705883, 1, 1,
0.1223243, -1.761868, 4.424809, 0, 0.6627451, 1, 1,
0.1225969, -0.9117754, 3.807616, 0, 0.6588235, 1, 1,
0.1241351, 0.4640209, 0.7575165, 0, 0.6509804, 1, 1,
0.1344353, -0.9914116, 2.860451, 0, 0.6470588, 1, 1,
0.137818, -0.7401501, 3.847218, 0, 0.6392157, 1, 1,
0.1467967, -0.0918669, 3.016078, 0, 0.6352941, 1, 1,
0.1470487, -0.4615931, 2.443685, 0, 0.627451, 1, 1,
0.152254, -0.3891149, 0.6505914, 0, 0.6235294, 1, 1,
0.1552608, 0.2686362, 0.07479012, 0, 0.6156863, 1, 1,
0.1577861, -0.303142, 2.097703, 0, 0.6117647, 1, 1,
0.1612732, -0.4300746, 3.74521, 0, 0.6039216, 1, 1,
0.1628597, -0.1497238, 1.405861, 0, 0.5960785, 1, 1,
0.163712, 0.4529494, 0.4625868, 0, 0.5921569, 1, 1,
0.166478, 0.5868788, -1.190969, 0, 0.5843138, 1, 1,
0.1837592, 0.2313071, -0.2131895, 0, 0.5803922, 1, 1,
0.1868785, -1.64482, 2.679814, 0, 0.572549, 1, 1,
0.1883412, 0.2859276, 1.580128, 0, 0.5686275, 1, 1,
0.1920086, 0.8474464, 0.05507633, 0, 0.5607843, 1, 1,
0.1923527, -0.368702, 0.7248487, 0, 0.5568628, 1, 1,
0.1924899, -0.2358588, 3.367168, 0, 0.5490196, 1, 1,
0.1942164, -0.237195, 2.738464, 0, 0.5450981, 1, 1,
0.1943602, 1.641639, 0.2417715, 0, 0.5372549, 1, 1,
0.1975603, 0.08933617, 0.6424366, 0, 0.5333334, 1, 1,
0.2001378, -1.080545, 2.407865, 0, 0.5254902, 1, 1,
0.2040433, 0.7174814, -0.1253153, 0, 0.5215687, 1, 1,
0.2086139, -0.7060016, 1.660487, 0, 0.5137255, 1, 1,
0.2091453, -0.221706, 2.13257, 0, 0.509804, 1, 1,
0.2115103, 1.369743, -0.9893606, 0, 0.5019608, 1, 1,
0.2117847, 1.420777, 1.516845, 0, 0.4941176, 1, 1,
0.21206, -0.3879874, 2.915151, 0, 0.4901961, 1, 1,
0.2121102, 0.8244979, -0.311673, 0, 0.4823529, 1, 1,
0.2158778, -1.035738, 2.170619, 0, 0.4784314, 1, 1,
0.2164932, 0.6256689, 0.6341157, 0, 0.4705882, 1, 1,
0.2168879, 0.1619086, 0.002257935, 0, 0.4666667, 1, 1,
0.2186237, 0.4415761, -0.09339113, 0, 0.4588235, 1, 1,
0.2186351, -0.628441, 2.499129, 0, 0.454902, 1, 1,
0.2216805, 0.6877208, 0.3701354, 0, 0.4470588, 1, 1,
0.2223742, -0.7940893, 3.623649, 0, 0.4431373, 1, 1,
0.2274102, 0.1780615, 1.482429, 0, 0.4352941, 1, 1,
0.2276044, 2.500035, -0.9905959, 0, 0.4313726, 1, 1,
0.2282973, 0.8847272, -0.1208866, 0, 0.4235294, 1, 1,
0.2287191, 0.06246587, 2.075789, 0, 0.4196078, 1, 1,
0.2289169, 0.6834615, -1.100648, 0, 0.4117647, 1, 1,
0.2312504, 0.1346611, 0.7372726, 0, 0.4078431, 1, 1,
0.2342745, -0.8073346, 5.218665, 0, 0.4, 1, 1,
0.237371, -1.941633, 4.363335, 0, 0.3921569, 1, 1,
0.2381732, 0.8462567, -1.340539, 0, 0.3882353, 1, 1,
0.2402038, 1.770664, 0.0288844, 0, 0.3803922, 1, 1,
0.2412684, 1.718935, -1.434013, 0, 0.3764706, 1, 1,
0.2455615, -1.17796, 3.232989, 0, 0.3686275, 1, 1,
0.2493336, -0.4867181, 1.372358, 0, 0.3647059, 1, 1,
0.2574047, -0.8814566, 3.201449, 0, 0.3568628, 1, 1,
0.2574207, -0.8781338, 1.067555, 0, 0.3529412, 1, 1,
0.2597455, -1.100956, 4.041183, 0, 0.345098, 1, 1,
0.2604267, 1.068635, 0.2211188, 0, 0.3411765, 1, 1,
0.2740617, 0.6389519, 1.349251, 0, 0.3333333, 1, 1,
0.2743258, 0.18562, 1.511564, 0, 0.3294118, 1, 1,
0.2820676, -0.1996455, 1.355918, 0, 0.3215686, 1, 1,
0.285133, 1.924822, 2.346902, 0, 0.3176471, 1, 1,
0.2883481, 0.9748784, 0.7019739, 0, 0.3098039, 1, 1,
0.2902767, -1.398191, 5.664048, 0, 0.3058824, 1, 1,
0.2975466, -1.587889, 4.467151, 0, 0.2980392, 1, 1,
0.2991962, 1.821176, -1.63284, 0, 0.2901961, 1, 1,
0.3020156, 0.04697813, 1.676216, 0, 0.2862745, 1, 1,
0.3086653, -1.312052, 3.685055, 0, 0.2784314, 1, 1,
0.3121022, -0.1984226, 2.557444, 0, 0.2745098, 1, 1,
0.3226849, -0.2138212, 2.240585, 0, 0.2666667, 1, 1,
0.3260011, 1.202682, 0.4704462, 0, 0.2627451, 1, 1,
0.3260858, 1.17781, -0.7817578, 0, 0.254902, 1, 1,
0.3269232, -1.285827, 2.169226, 0, 0.2509804, 1, 1,
0.3280191, -0.1664516, 3.101585, 0, 0.2431373, 1, 1,
0.334088, 0.4138673, 3.968237, 0, 0.2392157, 1, 1,
0.3359646, -0.04900549, 0.6608578, 0, 0.2313726, 1, 1,
0.3364212, 0.5882009, -1.404296, 0, 0.227451, 1, 1,
0.3381435, -1.125228, 1.261434, 0, 0.2196078, 1, 1,
0.3412825, -0.6378735, 2.040694, 0, 0.2156863, 1, 1,
0.3417354, -1.648555, 3.220381, 0, 0.2078431, 1, 1,
0.3440282, -0.06206111, 2.112533, 0, 0.2039216, 1, 1,
0.3452868, 0.2609817, -0.1228357, 0, 0.1960784, 1, 1,
0.3470156, -0.02099382, 2.267135, 0, 0.1882353, 1, 1,
0.3497388, 1.745453, 0.3626672, 0, 0.1843137, 1, 1,
0.3506075, -0.1196924, 1.612424, 0, 0.1764706, 1, 1,
0.352319, -0.7793491, 2.139332, 0, 0.172549, 1, 1,
0.3528374, 0.3142312, -0.1105519, 0, 0.1647059, 1, 1,
0.3594943, -0.08249807, 1.015252, 0, 0.1607843, 1, 1,
0.3610903, 0.2911306, 1.41756, 0, 0.1529412, 1, 1,
0.3622572, -0.5193568, 2.406818, 0, 0.1490196, 1, 1,
0.3624312, 0.956215, 1.908482, 0, 0.1411765, 1, 1,
0.3689096, -0.1323463, 0.5010212, 0, 0.1372549, 1, 1,
0.3775825, -0.3438424, 2.073364, 0, 0.1294118, 1, 1,
0.3779691, 1.716686, 0.02556759, 0, 0.1254902, 1, 1,
0.3839232, -1.036834, 2.091128, 0, 0.1176471, 1, 1,
0.3841744, 1.144016, 1.987623, 0, 0.1137255, 1, 1,
0.3887728, -1.149588, 2.195583, 0, 0.1058824, 1, 1,
0.3926017, 2.082572, -1.311605, 0, 0.09803922, 1, 1,
0.394164, 0.7496166, 0.8332753, 0, 0.09411765, 1, 1,
0.3958263, -0.6853409, 2.571655, 0, 0.08627451, 1, 1,
0.3983802, 1.553118, 0.2555567, 0, 0.08235294, 1, 1,
0.4020398, -0.1232301, 0.3379475, 0, 0.07450981, 1, 1,
0.402104, -0.7753503, 1.863012, 0, 0.07058824, 1, 1,
0.4027894, 0.5790243, 0.6663316, 0, 0.0627451, 1, 1,
0.4105059, -0.5240835, 1.50898, 0, 0.05882353, 1, 1,
0.4112418, 0.2120424, -0.3372381, 0, 0.05098039, 1, 1,
0.4147741, 1.236157, -0.849336, 0, 0.04705882, 1, 1,
0.4195875, 0.5573656, 0.9568014, 0, 0.03921569, 1, 1,
0.4205776, 1.315499, 0.5430769, 0, 0.03529412, 1, 1,
0.42167, 1.391695, -0.5378708, 0, 0.02745098, 1, 1,
0.4238475, -0.0008470193, 2.829158, 0, 0.02352941, 1, 1,
0.4275609, 0.6261425, -0.540549, 0, 0.01568628, 1, 1,
0.4281677, -0.1467267, 2.259705, 0, 0.01176471, 1, 1,
0.4287786, 0.2472866, 1.435391, 0, 0.003921569, 1, 1,
0.4312241, 0.8103202, -0.07168831, 0.003921569, 0, 1, 1,
0.433486, 0.3924956, 1.922097, 0.007843138, 0, 1, 1,
0.4368125, -0.3484398, 3.31284, 0.01568628, 0, 1, 1,
0.4386334, -0.9493709, 4.321866, 0.01960784, 0, 1, 1,
0.440032, 0.8285885, 0.6719083, 0.02745098, 0, 1, 1,
0.4403648, 1.06675, -0.31804, 0.03137255, 0, 1, 1,
0.4413311, -0.0937243, 2.881775, 0.03921569, 0, 1, 1,
0.4432641, 0.6674638, 1.576316, 0.04313726, 0, 1, 1,
0.4493127, -1.752315, 3.906162, 0.05098039, 0, 1, 1,
0.4505351, 0.1731305, 1.057128, 0.05490196, 0, 1, 1,
0.4531679, 0.4622972, -1.028193, 0.0627451, 0, 1, 1,
0.4582301, -0.4372608, 2.293879, 0.06666667, 0, 1, 1,
0.462625, 0.3990965, 2.36007, 0.07450981, 0, 1, 1,
0.4644282, 0.6733702, -0.2053405, 0.07843138, 0, 1, 1,
0.4644609, -0.6485164, 1.615345, 0.08627451, 0, 1, 1,
0.4680829, -1.098193, 5.43845, 0.09019608, 0, 1, 1,
0.4692272, -0.03529152, 1.381843, 0.09803922, 0, 1, 1,
0.4724078, -0.802036, 3.433253, 0.1058824, 0, 1, 1,
0.4729032, -0.483991, 2.549541, 0.1098039, 0, 1, 1,
0.4776972, 1.072936, 0.9008241, 0.1176471, 0, 1, 1,
0.4830148, -0.8351476, 3.398227, 0.1215686, 0, 1, 1,
0.4877973, -2.293303, 3.216489, 0.1294118, 0, 1, 1,
0.4976687, 1.564987, -0.1103284, 0.1333333, 0, 1, 1,
0.5008723, 0.9621696, -0.752876, 0.1411765, 0, 1, 1,
0.5024092, 0.397847, 1.621288, 0.145098, 0, 1, 1,
0.5144241, -0.7529432, 3.684279, 0.1529412, 0, 1, 1,
0.5155308, 1.168079, 1.102046, 0.1568628, 0, 1, 1,
0.5185708, -1.186403, 4.082491, 0.1647059, 0, 1, 1,
0.5204124, 0.4388213, -0.4505272, 0.1686275, 0, 1, 1,
0.5204508, -0.3627205, 3.382235, 0.1764706, 0, 1, 1,
0.521341, 1.461547, -0.1512542, 0.1803922, 0, 1, 1,
0.5217209, -0.6355336, 3.261231, 0.1882353, 0, 1, 1,
0.5221452, -0.7242911, 3.11869, 0.1921569, 0, 1, 1,
0.524675, 0.08445272, 2.182061, 0.2, 0, 1, 1,
0.5260398, -0.7328471, 3.543808, 0.2078431, 0, 1, 1,
0.5295093, -0.6904604, 2.651735, 0.2117647, 0, 1, 1,
0.5322049, 1.016131, -0.7557031, 0.2196078, 0, 1, 1,
0.5365872, 1.094271, 0.02151196, 0.2235294, 0, 1, 1,
0.5378133, 0.6716745, 1.366922, 0.2313726, 0, 1, 1,
0.5392496, 0.6476578, 0.6146144, 0.2352941, 0, 1, 1,
0.5405833, 2.144588, 1.814138, 0.2431373, 0, 1, 1,
0.540738, -0.8582086, 2.337329, 0.2470588, 0, 1, 1,
0.5475041, -1.613977, 1.293248, 0.254902, 0, 1, 1,
0.5498475, 1.665742, -1.722067, 0.2588235, 0, 1, 1,
0.5508541, -0.08767072, 2.056568, 0.2666667, 0, 1, 1,
0.5553993, 0.4055258, 0.5243437, 0.2705882, 0, 1, 1,
0.5559047, 2.236756, -0.8304019, 0.2784314, 0, 1, 1,
0.5591338, 0.286142, 1.123004, 0.282353, 0, 1, 1,
0.5598133, -0.4440406, 2.579298, 0.2901961, 0, 1, 1,
0.5639574, 2.088303, 1.77016, 0.2941177, 0, 1, 1,
0.5674042, -0.3612711, 2.147075, 0.3019608, 0, 1, 1,
0.5675143, -0.958752, 2.873479, 0.3098039, 0, 1, 1,
0.5681514, 0.3137295, 2.118508, 0.3137255, 0, 1, 1,
0.5744305, 0.5658329, 2.301385, 0.3215686, 0, 1, 1,
0.5806041, 1.300722, 1.5767, 0.3254902, 0, 1, 1,
0.5847235, -0.1247367, 3.432893, 0.3333333, 0, 1, 1,
0.5857219, 0.7968419, 0.5072044, 0.3372549, 0, 1, 1,
0.5889307, 1.201061, -1.021721, 0.345098, 0, 1, 1,
0.5903742, -1.783033, 3.000068, 0.3490196, 0, 1, 1,
0.5903947, -0.2068725, 2.146856, 0.3568628, 0, 1, 1,
0.5933348, 0.4710112, 0.8631352, 0.3607843, 0, 1, 1,
0.5948189, -1.028698, 2.244954, 0.3686275, 0, 1, 1,
0.5992051, 1.347363, 0.297527, 0.372549, 0, 1, 1,
0.6004474, -0.2685912, 2.013281, 0.3803922, 0, 1, 1,
0.6013643, 1.586963, 2.830188, 0.3843137, 0, 1, 1,
0.6023157, 0.09162363, 1.73549, 0.3921569, 0, 1, 1,
0.6034309, 0.6155866, 0.9124283, 0.3960784, 0, 1, 1,
0.6073698, -0.1154709, 1.945032, 0.4039216, 0, 1, 1,
0.6085, -1.321724, 5.173347, 0.4117647, 0, 1, 1,
0.6170564, 0.2867862, 1.123993, 0.4156863, 0, 1, 1,
0.6195921, -1.22224, 2.851949, 0.4235294, 0, 1, 1,
0.6208637, -0.8669099, 2.134497, 0.427451, 0, 1, 1,
0.6211216, 0.232758, -0.3359808, 0.4352941, 0, 1, 1,
0.6222828, -0.4800437, 2.004809, 0.4392157, 0, 1, 1,
0.6227192, 0.6538017, 0.3060195, 0.4470588, 0, 1, 1,
0.6234068, -0.05991885, 2.173045, 0.4509804, 0, 1, 1,
0.6235363, 0.09941664, 1.365539, 0.4588235, 0, 1, 1,
0.6238432, -0.01177279, 1.330058, 0.4627451, 0, 1, 1,
0.6302394, -0.1383514, 1.052466, 0.4705882, 0, 1, 1,
0.6304833, -1.507621, 2.825073, 0.4745098, 0, 1, 1,
0.6325228, -0.6296757, 1.680371, 0.4823529, 0, 1, 1,
0.6355431, 0.05644921, 1.823968, 0.4862745, 0, 1, 1,
0.6388708, 0.7479116, 1.162533, 0.4941176, 0, 1, 1,
0.6408418, 1.756791, -1.095268, 0.5019608, 0, 1, 1,
0.6410588, 0.05529433, 1.820582, 0.5058824, 0, 1, 1,
0.6418434, 0.5724583, 3.241504, 0.5137255, 0, 1, 1,
0.6469791, 0.251039, 2.430304, 0.5176471, 0, 1, 1,
0.6472435, 0.6164259, 1.159971, 0.5254902, 0, 1, 1,
0.6574659, 0.1229394, 0.6992716, 0.5294118, 0, 1, 1,
0.6582439, -0.9669254, 1.607162, 0.5372549, 0, 1, 1,
0.6668839, 0.6748874, 1.807031, 0.5411765, 0, 1, 1,
0.6708483, -0.1640192, 1.075524, 0.5490196, 0, 1, 1,
0.6711695, -0.07942485, 1.277226, 0.5529412, 0, 1, 1,
0.672612, 1.06823, 0.27902, 0.5607843, 0, 1, 1,
0.6752577, -2.201979, 2.422077, 0.5647059, 0, 1, 1,
0.6773697, 0.3895379, 1.141354, 0.572549, 0, 1, 1,
0.6774086, 1.594648, -0.622196, 0.5764706, 0, 1, 1,
0.689181, -1.122877, 3.722369, 0.5843138, 0, 1, 1,
0.6986673, -1.344905, 2.224288, 0.5882353, 0, 1, 1,
0.7008332, -0.2663344, 1.221504, 0.5960785, 0, 1, 1,
0.7015343, -0.1305538, 3.127289, 0.6039216, 0, 1, 1,
0.7052664, 0.4993543, 0.9803348, 0.6078432, 0, 1, 1,
0.7076425, 0.1065789, 1.689387, 0.6156863, 0, 1, 1,
0.7082671, 0.2757528, 0.2597817, 0.6196079, 0, 1, 1,
0.7154914, -0.1871942, -0.7552373, 0.627451, 0, 1, 1,
0.7163612, -1.269192, 3.262688, 0.6313726, 0, 1, 1,
0.7197255, 1.008904, -1.445046, 0.6392157, 0, 1, 1,
0.7215346, 1.713422, 0.1756018, 0.6431373, 0, 1, 1,
0.7239747, -0.2953881, 3.117315, 0.6509804, 0, 1, 1,
0.7269186, -0.09921058, 2.665655, 0.654902, 0, 1, 1,
0.7316342, 0.4021042, -0.1381378, 0.6627451, 0, 1, 1,
0.7332586, -0.7591321, 0.8331437, 0.6666667, 0, 1, 1,
0.7356725, -1.379375, 1.989432, 0.6745098, 0, 1, 1,
0.741633, 0.3882334, 2.356201, 0.6784314, 0, 1, 1,
0.7426406, -0.3874581, 1.729261, 0.6862745, 0, 1, 1,
0.7436995, 0.7036635, 2.150299, 0.6901961, 0, 1, 1,
0.7443239, -1.802952, 3.103997, 0.6980392, 0, 1, 1,
0.7446357, 0.9642013, 0.6376732, 0.7058824, 0, 1, 1,
0.7455912, -0.2580537, 2.853738, 0.7098039, 0, 1, 1,
0.7479263, 1.635823, 1.916771, 0.7176471, 0, 1, 1,
0.7486444, 0.1751616, -0.4158902, 0.7215686, 0, 1, 1,
0.7489063, 1.335862, 2.587671, 0.7294118, 0, 1, 1,
0.7566732, 0.7009304, -0.6390772, 0.7333333, 0, 1, 1,
0.7573367, -0.2251113, 1.85449, 0.7411765, 0, 1, 1,
0.7579677, 0.02031752, 1.466582, 0.7450981, 0, 1, 1,
0.760596, 0.6691589, -0.6754041, 0.7529412, 0, 1, 1,
0.7645856, -0.6633917, 3.482836, 0.7568628, 0, 1, 1,
0.7652028, -0.7121691, 1.516879, 0.7647059, 0, 1, 1,
0.7674438, -1.860847, 2.739274, 0.7686275, 0, 1, 1,
0.7772316, 1.294495, 0.04054156, 0.7764706, 0, 1, 1,
0.7819031, 1.058804, -0.04483302, 0.7803922, 0, 1, 1,
0.7892859, -1.106088, 1.470633, 0.7882353, 0, 1, 1,
0.7953961, 0.7261432, 1.622582, 0.7921569, 0, 1, 1,
0.80204, -0.9175825, 1.928519, 0.8, 0, 1, 1,
0.8036155, 1.193346, 1.822748, 0.8078431, 0, 1, 1,
0.8052025, -0.3841458, 0.1974425, 0.8117647, 0, 1, 1,
0.809979, 0.4899365, 2.400941, 0.8196079, 0, 1, 1,
0.8327012, -0.3989004, 0.7771423, 0.8235294, 0, 1, 1,
0.8335558, -0.7370636, 0.7233467, 0.8313726, 0, 1, 1,
0.8353371, 1.171701, 0.1955099, 0.8352941, 0, 1, 1,
0.8380679, 0.6410967, 1.861138, 0.8431373, 0, 1, 1,
0.8394326, -0.2635301, 2.638088, 0.8470588, 0, 1, 1,
0.8427096, -0.08451945, 2.651911, 0.854902, 0, 1, 1,
0.8470676, 1.458876, 0.04243219, 0.8588235, 0, 1, 1,
0.8496566, 1.294037, 0.444722, 0.8666667, 0, 1, 1,
0.8496821, -0.5225162, 2.535302, 0.8705882, 0, 1, 1,
0.8530229, 0.3050847, 1.049512, 0.8784314, 0, 1, 1,
0.8563286, -0.286971, 1.712061, 0.8823529, 0, 1, 1,
0.8563969, 0.6210632, 1.672548, 0.8901961, 0, 1, 1,
0.8619615, 0.02540324, 1.359905, 0.8941177, 0, 1, 1,
0.8637289, 0.107782, -0.08837425, 0.9019608, 0, 1, 1,
0.8664888, -0.0936722, 1.541331, 0.9098039, 0, 1, 1,
0.8721539, -0.3003856, 0.8326827, 0.9137255, 0, 1, 1,
0.8758386, -0.2270787, 1.825885, 0.9215686, 0, 1, 1,
0.8806863, -0.9959934, 0.4986781, 0.9254902, 0, 1, 1,
0.8862993, 1.050703, 0.2807339, 0.9333333, 0, 1, 1,
0.8878067, 0.5552838, -0.8906902, 0.9372549, 0, 1, 1,
0.8932587, -1.211825, 1.559885, 0.945098, 0, 1, 1,
0.8999792, -0.09513228, 2.628052, 0.9490196, 0, 1, 1,
0.9026969, 1.941098, -0.7922598, 0.9568627, 0, 1, 1,
0.9083155, -0.2721903, 1.47054, 0.9607843, 0, 1, 1,
0.9104708, -0.2272553, 0.8944703, 0.9686275, 0, 1, 1,
0.9186847, 0.1031521, 3.967841, 0.972549, 0, 1, 1,
0.9187557, -0.3428603, 1.194396, 0.9803922, 0, 1, 1,
0.9190162, 0.8024478, 0.6081305, 0.9843137, 0, 1, 1,
0.9239604, 0.3944719, 2.54124, 0.9921569, 0, 1, 1,
0.9322406, 1.341684, -0.7772486, 0.9960784, 0, 1, 1,
0.9509587, -1.053865, 3.091507, 1, 0, 0.9960784, 1,
0.9524805, -0.03813095, -0.3630354, 1, 0, 0.9882353, 1,
0.9703032, -1.06544, 0.6486923, 1, 0, 0.9843137, 1,
0.9766677, -0.6057404, 2.478829, 1, 0, 0.9764706, 1,
0.9798655, -1.901987, 3.387432, 1, 0, 0.972549, 1,
0.9817076, -0.04753466, 1.949988, 1, 0, 0.9647059, 1,
0.9861175, -0.1137095, 3.053994, 1, 0, 0.9607843, 1,
0.9862862, 1.107967, 1.004922, 1, 0, 0.9529412, 1,
0.988996, -0.2272328, 1.497724, 1, 0, 0.9490196, 1,
0.9901817, 0.4717709, 0.8550143, 1, 0, 0.9411765, 1,
0.9906496, 0.2685057, 3.248296, 1, 0, 0.9372549, 1,
0.9907455, -0.691462, 1.302174, 1, 0, 0.9294118, 1,
0.9908186, -0.2702491, 3.333716, 1, 0, 0.9254902, 1,
0.9927295, 0.4333788, 1.195745, 1, 0, 0.9176471, 1,
0.9967009, -1.440455, 2.68275, 1, 0, 0.9137255, 1,
1.007814, -0.7791305, 3.418637, 1, 0, 0.9058824, 1,
1.008032, -0.4816452, 2.658529, 1, 0, 0.9019608, 1,
1.013183, 1.800427, 2.213904, 1, 0, 0.8941177, 1,
1.01835, 0.950431, 0.6032717, 1, 0, 0.8862745, 1,
1.018986, -0.3130288, 1.722966, 1, 0, 0.8823529, 1,
1.020357, 1.464459, -1.611088, 1, 0, 0.8745098, 1,
1.023033, 0.01158962, 0.8301244, 1, 0, 0.8705882, 1,
1.02635, 1.247735, 1.252003, 1, 0, 0.8627451, 1,
1.029561, 0.2850049, 1.38754, 1, 0, 0.8588235, 1,
1.029741, 1.003773, 0.4290574, 1, 0, 0.8509804, 1,
1.036293, -0.6869383, 1.620026, 1, 0, 0.8470588, 1,
1.049276, 0.2188421, 2.251436, 1, 0, 0.8392157, 1,
1.054317, -0.2539369, 1.399429, 1, 0, 0.8352941, 1,
1.054935, 1.263978, 1.169763, 1, 0, 0.827451, 1,
1.059711, -0.1901743, 1.636579, 1, 0, 0.8235294, 1,
1.064203, -0.6133976, 2.201255, 1, 0, 0.8156863, 1,
1.064318, -0.8718748, 3.173837, 1, 0, 0.8117647, 1,
1.068137, 0.79511, 0.7996954, 1, 0, 0.8039216, 1,
1.070681, -0.4871982, 0.5331744, 1, 0, 0.7960784, 1,
1.080858, 0.3636402, 2.243576, 1, 0, 0.7921569, 1,
1.081442, -2.177941, 2.819912, 1, 0, 0.7843137, 1,
1.09423, 0.6814556, 0.04989581, 1, 0, 0.7803922, 1,
1.099609, -0.07695827, 1.488374, 1, 0, 0.772549, 1,
1.104846, 2.091794, 2.65113, 1, 0, 0.7686275, 1,
1.105661, 0.5298482, 0.8876094, 1, 0, 0.7607843, 1,
1.110401, 0.4555803, -0.03077241, 1, 0, 0.7568628, 1,
1.120814, -0.3286927, 3.518307, 1, 0, 0.7490196, 1,
1.125335, -0.3927269, 0.9924691, 1, 0, 0.7450981, 1,
1.132613, -1.286631, 3.675673, 1, 0, 0.7372549, 1,
1.132702, 0.5887506, 0.8415077, 1, 0, 0.7333333, 1,
1.136726, -0.4805616, 2.922095, 1, 0, 0.7254902, 1,
1.143535, -0.774181, 1.976759, 1, 0, 0.7215686, 1,
1.143574, -0.1456155, 2.668573, 1, 0, 0.7137255, 1,
1.145274, -2.209208, 1.558551, 1, 0, 0.7098039, 1,
1.147305, 0.04409003, 1.415757, 1, 0, 0.7019608, 1,
1.15069, 0.3226616, 2.295398, 1, 0, 0.6941177, 1,
1.150894, -0.1401155, 1.370326, 1, 0, 0.6901961, 1,
1.152531, 1.225878, 0.3253323, 1, 0, 0.682353, 1,
1.156612, -0.3163734, 0.5673587, 1, 0, 0.6784314, 1,
1.156845, -0.9367385, 2.961989, 1, 0, 0.6705883, 1,
1.163659, 0.3276723, 1.746229, 1, 0, 0.6666667, 1,
1.172939, -0.4193244, 1.535327, 1, 0, 0.6588235, 1,
1.178151, 1.760695, 1.989941, 1, 0, 0.654902, 1,
1.178518, 0.3819237, 0.524463, 1, 0, 0.6470588, 1,
1.185811, -0.4493955, 2.235159, 1, 0, 0.6431373, 1,
1.191582, -0.3629088, 2.584413, 1, 0, 0.6352941, 1,
1.199853, 0.8679538, 2.406008, 1, 0, 0.6313726, 1,
1.201693, 0.0990987, 1.408789, 1, 0, 0.6235294, 1,
1.207644, -0.3313277, 2.265527, 1, 0, 0.6196079, 1,
1.212251, 0.5036517, 0.2931493, 1, 0, 0.6117647, 1,
1.219731, 1.083329, -0.7536782, 1, 0, 0.6078432, 1,
1.222861, -1.201022, 3.329515, 1, 0, 0.6, 1,
1.223072, 0.277547, 0.5625287, 1, 0, 0.5921569, 1,
1.239107, -0.3169728, 2.384097, 1, 0, 0.5882353, 1,
1.244103, 0.3890822, 2.586972, 1, 0, 0.5803922, 1,
1.248923, -0.4050238, 2.056345, 1, 0, 0.5764706, 1,
1.26705, 0.4633502, 1.826887, 1, 0, 0.5686275, 1,
1.27053, 0.9676217, 0.2344295, 1, 0, 0.5647059, 1,
1.271539, -0.73943, 1.471306, 1, 0, 0.5568628, 1,
1.278784, -0.4882801, 0.6999064, 1, 0, 0.5529412, 1,
1.291146, 1.244243, -0.4974031, 1, 0, 0.5450981, 1,
1.305381, 0.6210948, 1.287132, 1, 0, 0.5411765, 1,
1.309867, 2.331826, 0.6774026, 1, 0, 0.5333334, 1,
1.310582, -0.310926, 1.856713, 1, 0, 0.5294118, 1,
1.321155, -0.160833, 2.216257, 1, 0, 0.5215687, 1,
1.3244, 0.1463702, 1.430333, 1, 0, 0.5176471, 1,
1.344933, 1.082244, -0.1535981, 1, 0, 0.509804, 1,
1.368563, 0.813437, 0.5797243, 1, 0, 0.5058824, 1,
1.374683, -1.002014, 2.031644, 1, 0, 0.4980392, 1,
1.389229, 0.8323838, 1.867905, 1, 0, 0.4901961, 1,
1.393995, -0.4116978, 1.062775, 1, 0, 0.4862745, 1,
1.405488, 0.2285436, 2.454499, 1, 0, 0.4784314, 1,
1.405674, -1.188834, 1.163355, 1, 0, 0.4745098, 1,
1.409134, -0.7672976, 1.636629, 1, 0, 0.4666667, 1,
1.417824, -0.1219693, 2.820213, 1, 0, 0.4627451, 1,
1.424909, -0.002836342, 1.568174, 1, 0, 0.454902, 1,
1.442738, 1.377228, 1.404037, 1, 0, 0.4509804, 1,
1.456235, -0.8941047, 2.206081, 1, 0, 0.4431373, 1,
1.473711, -3.3413, 3.853418, 1, 0, 0.4392157, 1,
1.473948, -1.312056, 3.997261, 1, 0, 0.4313726, 1,
1.488428, -0.09407194, 1.459645, 1, 0, 0.427451, 1,
1.493987, -0.1483754, 3.006486, 1, 0, 0.4196078, 1,
1.503646, 0.6253608, -0.1135138, 1, 0, 0.4156863, 1,
1.510859, -1.045776, 1.881118, 1, 0, 0.4078431, 1,
1.518587, 0.5820506, 0.1617664, 1, 0, 0.4039216, 1,
1.532984, 1.462667, 0.1470774, 1, 0, 0.3960784, 1,
1.538068, -0.7637288, 3.666692, 1, 0, 0.3882353, 1,
1.550816, 1.355765, -0.8139589, 1, 0, 0.3843137, 1,
1.551591, -1.003753, 2.66832, 1, 0, 0.3764706, 1,
1.555902, 1.766398, 0.9573048, 1, 0, 0.372549, 1,
1.557002, -0.02049346, 4.029468, 1, 0, 0.3647059, 1,
1.563133, 1.307595, -0.07902534, 1, 0, 0.3607843, 1,
1.564002, 1.307625, 0.07192405, 1, 0, 0.3529412, 1,
1.567854, -0.2127857, 2.539208, 1, 0, 0.3490196, 1,
1.588309, -0.7221876, 0.8694743, 1, 0, 0.3411765, 1,
1.591975, -0.5952785, 1.227393, 1, 0, 0.3372549, 1,
1.611017, 1.353626, 0.9489526, 1, 0, 0.3294118, 1,
1.616448, -1.514729, 1.221931, 1, 0, 0.3254902, 1,
1.619648, -0.1915465, 3.260918, 1, 0, 0.3176471, 1,
1.625605, -2.686777, 2.02039, 1, 0, 0.3137255, 1,
1.672418, 0.06976327, 2.008539, 1, 0, 0.3058824, 1,
1.703144, -2.435438, 1.971319, 1, 0, 0.2980392, 1,
1.734793, -1.402297, 2.818325, 1, 0, 0.2941177, 1,
1.734904, -0.9845387, 1.592422, 1, 0, 0.2862745, 1,
1.736139, 0.4644729, 1.852268, 1, 0, 0.282353, 1,
1.756067, -0.3105378, 1.125275, 1, 0, 0.2745098, 1,
1.75624, 0.3116329, 2.841063, 1, 0, 0.2705882, 1,
1.764383, 0.2529109, 0.05615316, 1, 0, 0.2627451, 1,
1.767122, 0.1482054, 1.603931, 1, 0, 0.2588235, 1,
1.776804, -0.1971315, 1.274585, 1, 0, 0.2509804, 1,
1.784414, 0.2480175, 0.2567129, 1, 0, 0.2470588, 1,
1.813767, 0.271497, 0.4321729, 1, 0, 0.2392157, 1,
1.816438, 1.567001, 2.000773, 1, 0, 0.2352941, 1,
1.82949, -0.6067665, 2.835715, 1, 0, 0.227451, 1,
1.835068, -0.724941, 4.218828, 1, 0, 0.2235294, 1,
1.866162, 0.348779, 1.426612, 1, 0, 0.2156863, 1,
1.877508, -0.04414847, 0.1676929, 1, 0, 0.2117647, 1,
1.892034, -1.267308, 2.331643, 1, 0, 0.2039216, 1,
1.90844, -1.676227, 0.4237872, 1, 0, 0.1960784, 1,
1.927062, -0.09664893, 2.358858, 1, 0, 0.1921569, 1,
1.927261, -0.4280631, 0.5899973, 1, 0, 0.1843137, 1,
1.95448, 1.325129, 3.675965, 1, 0, 0.1803922, 1,
1.965013, -0.8065249, 4.327677, 1, 0, 0.172549, 1,
1.96877, -0.8738208, 2.95168, 1, 0, 0.1686275, 1,
2.001384, -0.5902342, 2.60449, 1, 0, 0.1607843, 1,
2.010275, 0.7930261, 0.6050833, 1, 0, 0.1568628, 1,
2.045225, -0.101932, 0.3756185, 1, 0, 0.1490196, 1,
2.061305, 0.9994959, 0.7796554, 1, 0, 0.145098, 1,
2.098443, -0.07910458, 2.587516, 1, 0, 0.1372549, 1,
2.103172, 0.8392001, 1.601097, 1, 0, 0.1333333, 1,
2.155969, -1.636718, 1.727623, 1, 0, 0.1254902, 1,
2.165595, 1.395225, 1.973988, 1, 0, 0.1215686, 1,
2.239596, 0.2121913, 1.135792, 1, 0, 0.1137255, 1,
2.27253, -0.6384789, 1.880001, 1, 0, 0.1098039, 1,
2.279074, -1.003631, 1.489514, 1, 0, 0.1019608, 1,
2.287027, 0.3920209, 1.443926, 1, 0, 0.09411765, 1,
2.31597, 1.716763, 1.155836, 1, 0, 0.09019608, 1,
2.329372, -0.2775741, 1.819465, 1, 0, 0.08235294, 1,
2.338994, -0.2123443, 2.508984, 1, 0, 0.07843138, 1,
2.362618, -0.5944631, 1.120433, 1, 0, 0.07058824, 1,
2.382489, 0.3868115, 0.6700038, 1, 0, 0.06666667, 1,
2.431197, -0.4024406, 2.007973, 1, 0, 0.05882353, 1,
2.470592, 1.691589, 2.357244, 1, 0, 0.05490196, 1,
2.473409, -1.288251, 1.640543, 1, 0, 0.04705882, 1,
2.481362, -0.4336619, 1.584127, 1, 0, 0.04313726, 1,
2.498682, 1.203167, 0.9209056, 1, 0, 0.03529412, 1,
2.747709, 1.396579, 0.6098482, 1, 0, 0.03137255, 1,
2.750504, -1.526546, 1.089045, 1, 0, 0.02352941, 1,
2.75601, -0.3655024, 2.046826, 1, 0, 0.01960784, 1,
2.760484, 0.4944315, 2.407274, 1, 0, 0.01176471, 1,
3.04308, -1.376006, 2.396507, 1, 0, 0.007843138, 1
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
0.05431008, -4.383085, -6.519922, 0, -0.5, 0.5, 0.5,
0.05431008, -4.383085, -6.519922, 1, -0.5, 0.5, 0.5,
0.05431008, -4.383085, -6.519922, 1, 1.5, 0.5, 0.5,
0.05431008, -4.383085, -6.519922, 0, 1.5, 0.5, 0.5
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
-3.947652, -0.2681885, -6.519922, 0, -0.5, 0.5, 0.5,
-3.947652, -0.2681885, -6.519922, 1, -0.5, 0.5, 0.5,
-3.947652, -0.2681885, -6.519922, 1, 1.5, 0.5, 0.5,
-3.947652, -0.2681885, -6.519922, 0, 1.5, 0.5, 0.5
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
-3.947652, -4.383085, 0.6941369, 0, -0.5, 0.5, 0.5,
-3.947652, -4.383085, 0.6941369, 1, -0.5, 0.5, 0.5,
-3.947652, -4.383085, 0.6941369, 1, 1.5, 0.5, 0.5,
-3.947652, -4.383085, 0.6941369, 0, 1.5, 0.5, 0.5
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
-2, -3.433494, -4.855139,
3, -3.433494, -4.855139,
-2, -3.433494, -4.855139,
-2, -3.591759, -5.132603,
-1, -3.433494, -4.855139,
-1, -3.591759, -5.132603,
0, -3.433494, -4.855139,
0, -3.591759, -5.132603,
1, -3.433494, -4.855139,
1, -3.591759, -5.132603,
2, -3.433494, -4.855139,
2, -3.591759, -5.132603,
3, -3.433494, -4.855139,
3, -3.591759, -5.132603
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
-2, -3.90829, -5.687531, 0, -0.5, 0.5, 0.5,
-2, -3.90829, -5.687531, 1, -0.5, 0.5, 0.5,
-2, -3.90829, -5.687531, 1, 1.5, 0.5, 0.5,
-2, -3.90829, -5.687531, 0, 1.5, 0.5, 0.5,
-1, -3.90829, -5.687531, 0, -0.5, 0.5, 0.5,
-1, -3.90829, -5.687531, 1, -0.5, 0.5, 0.5,
-1, -3.90829, -5.687531, 1, 1.5, 0.5, 0.5,
-1, -3.90829, -5.687531, 0, 1.5, 0.5, 0.5,
0, -3.90829, -5.687531, 0, -0.5, 0.5, 0.5,
0, -3.90829, -5.687531, 1, -0.5, 0.5, 0.5,
0, -3.90829, -5.687531, 1, 1.5, 0.5, 0.5,
0, -3.90829, -5.687531, 0, 1.5, 0.5, 0.5,
1, -3.90829, -5.687531, 0, -0.5, 0.5, 0.5,
1, -3.90829, -5.687531, 1, -0.5, 0.5, 0.5,
1, -3.90829, -5.687531, 1, 1.5, 0.5, 0.5,
1, -3.90829, -5.687531, 0, 1.5, 0.5, 0.5,
2, -3.90829, -5.687531, 0, -0.5, 0.5, 0.5,
2, -3.90829, -5.687531, 1, -0.5, 0.5, 0.5,
2, -3.90829, -5.687531, 1, 1.5, 0.5, 0.5,
2, -3.90829, -5.687531, 0, 1.5, 0.5, 0.5,
3, -3.90829, -5.687531, 0, -0.5, 0.5, 0.5,
3, -3.90829, -5.687531, 1, -0.5, 0.5, 0.5,
3, -3.90829, -5.687531, 1, 1.5, 0.5, 0.5,
3, -3.90829, -5.687531, 0, 1.5, 0.5, 0.5
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
-3.024122, -3, -4.855139,
-3.024122, 2, -4.855139,
-3.024122, -3, -4.855139,
-3.178044, -3, -5.132603,
-3.024122, -2, -4.855139,
-3.178044, -2, -5.132603,
-3.024122, -1, -4.855139,
-3.178044, -1, -5.132603,
-3.024122, 0, -4.855139,
-3.178044, 0, -5.132603,
-3.024122, 1, -4.855139,
-3.178044, 1, -5.132603,
-3.024122, 2, -4.855139,
-3.178044, 2, -5.132603
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
-3.485888, -3, -5.687531, 0, -0.5, 0.5, 0.5,
-3.485888, -3, -5.687531, 1, -0.5, 0.5, 0.5,
-3.485888, -3, -5.687531, 1, 1.5, 0.5, 0.5,
-3.485888, -3, -5.687531, 0, 1.5, 0.5, 0.5,
-3.485888, -2, -5.687531, 0, -0.5, 0.5, 0.5,
-3.485888, -2, -5.687531, 1, -0.5, 0.5, 0.5,
-3.485888, -2, -5.687531, 1, 1.5, 0.5, 0.5,
-3.485888, -2, -5.687531, 0, 1.5, 0.5, 0.5,
-3.485888, -1, -5.687531, 0, -0.5, 0.5, 0.5,
-3.485888, -1, -5.687531, 1, -0.5, 0.5, 0.5,
-3.485888, -1, -5.687531, 1, 1.5, 0.5, 0.5,
-3.485888, -1, -5.687531, 0, 1.5, 0.5, 0.5,
-3.485888, 0, -5.687531, 0, -0.5, 0.5, 0.5,
-3.485888, 0, -5.687531, 1, -0.5, 0.5, 0.5,
-3.485888, 0, -5.687531, 1, 1.5, 0.5, 0.5,
-3.485888, 0, -5.687531, 0, 1.5, 0.5, 0.5,
-3.485888, 1, -5.687531, 0, -0.5, 0.5, 0.5,
-3.485888, 1, -5.687531, 1, -0.5, 0.5, 0.5,
-3.485888, 1, -5.687531, 1, 1.5, 0.5, 0.5,
-3.485888, 1, -5.687531, 0, 1.5, 0.5, 0.5,
-3.485888, 2, -5.687531, 0, -0.5, 0.5, 0.5,
-3.485888, 2, -5.687531, 1, -0.5, 0.5, 0.5,
-3.485888, 2, -5.687531, 1, 1.5, 0.5, 0.5,
-3.485888, 2, -5.687531, 0, 1.5, 0.5, 0.5
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
-3.024122, -3.433494, -4,
-3.024122, -3.433494, 6,
-3.024122, -3.433494, -4,
-3.178044, -3.591759, -4,
-3.024122, -3.433494, -2,
-3.178044, -3.591759, -2,
-3.024122, -3.433494, 0,
-3.178044, -3.591759, 0,
-3.024122, -3.433494, 2,
-3.178044, -3.591759, 2,
-3.024122, -3.433494, 4,
-3.178044, -3.591759, 4,
-3.024122, -3.433494, 6,
-3.178044, -3.591759, 6
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
-3.485888, -3.90829, -4, 0, -0.5, 0.5, 0.5,
-3.485888, -3.90829, -4, 1, -0.5, 0.5, 0.5,
-3.485888, -3.90829, -4, 1, 1.5, 0.5, 0.5,
-3.485888, -3.90829, -4, 0, 1.5, 0.5, 0.5,
-3.485888, -3.90829, -2, 0, -0.5, 0.5, 0.5,
-3.485888, -3.90829, -2, 1, -0.5, 0.5, 0.5,
-3.485888, -3.90829, -2, 1, 1.5, 0.5, 0.5,
-3.485888, -3.90829, -2, 0, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 0, 0, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 0, 1, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 0, 1, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 0, 0, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 2, 0, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 2, 1, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 2, 1, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 2, 0, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 4, 0, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 4, 1, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 4, 1, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 4, 0, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 6, 0, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 6, 1, -0.5, 0.5, 0.5,
-3.485888, -3.90829, 6, 1, 1.5, 0.5, 0.5,
-3.485888, -3.90829, 6, 0, 1.5, 0.5, 0.5
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
-3.024122, -3.433494, -4.855139,
-3.024122, 2.897117, -4.855139,
-3.024122, -3.433494, 6.243413,
-3.024122, 2.897117, 6.243413,
-3.024122, -3.433494, -4.855139,
-3.024122, -3.433494, 6.243413,
-3.024122, 2.897117, -4.855139,
-3.024122, 2.897117, 6.243413,
-3.024122, -3.433494, -4.855139,
3.132743, -3.433494, -4.855139,
-3.024122, -3.433494, 6.243413,
3.132743, -3.433494, 6.243413,
-3.024122, 2.897117, -4.855139,
3.132743, 2.897117, -4.855139,
-3.024122, 2.897117, 6.243413,
3.132743, 2.897117, 6.243413,
3.132743, -3.433494, -4.855139,
3.132743, 2.897117, -4.855139,
3.132743, -3.433494, 6.243413,
3.132743, 2.897117, 6.243413,
3.132743, -3.433494, -4.855139,
3.132743, -3.433494, 6.243413,
3.132743, 2.897117, -4.855139,
3.132743, 2.897117, 6.243413
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
var radius = 7.573522;
var distance = 33.69545;
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
mvMatrix.translate( -0.05431008, 0.2681885, -0.6941369 );
mvMatrix.scale( 1.330002, 1.293499, 0.7378116 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69545);
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
flamprop-isopropyl<-read.table("flamprop-isopropyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flamprop-isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
y<-flamprop-isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
```

```r
z<-flamprop-isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flamprop' not found
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
-2.934459, 1.372346, -0.04588068, 0, 0, 1, 1, 1,
-2.900661, 0.5357681, 0.3222079, 1, 0, 0, 1, 1,
-2.754455, 0.3771018, -0.9853184, 1, 0, 0, 1, 1,
-2.606985, -0.8299522, -1.641154, 1, 0, 0, 1, 1,
-2.503139, -1.553795, -1.567076, 1, 0, 0, 1, 1,
-2.491443, -0.1315783, -3.064384, 1, 0, 0, 1, 1,
-2.434573, -0.4170513, -2.800549, 0, 0, 0, 1, 1,
-2.395859, 0.7713825, 0.9665812, 0, 0, 0, 1, 1,
-2.313148, -0.1403783, -1.82195, 0, 0, 0, 1, 1,
-2.309449, 1.371603, -0.357563, 0, 0, 0, 1, 1,
-2.303252, -0.7492552, -0.7593605, 0, 0, 0, 1, 1,
-2.291239, 0.678701, -1.671935, 0, 0, 0, 1, 1,
-2.240005, -0.4221128, -4.29932, 0, 0, 0, 1, 1,
-2.234593, 0.126574, -0.7091424, 1, 1, 1, 1, 1,
-2.199103, -0.9897004, -0.9443403, 1, 1, 1, 1, 1,
-2.189797, -0.2228278, -1.648691, 1, 1, 1, 1, 1,
-2.130917, -0.9354636, -0.528992, 1, 1, 1, 1, 1,
-2.113239, 0.3061143, -2.429531, 1, 1, 1, 1, 1,
-2.061433, 0.04324959, -1.63388, 1, 1, 1, 1, 1,
-2.032233, 0.2190728, -1.064476, 1, 1, 1, 1, 1,
-2.016499, 1.116836, -2.797457, 1, 1, 1, 1, 1,
-1.997609, -1.734991, -1.519689, 1, 1, 1, 1, 1,
-1.979266, 0.8346914, 0.3349425, 1, 1, 1, 1, 1,
-1.977185, 0.1266513, -1.965596, 1, 1, 1, 1, 1,
-1.976802, 0.8436242, -0.621004, 1, 1, 1, 1, 1,
-1.871935, -0.02619343, -1.281968, 1, 1, 1, 1, 1,
-1.867782, 0.7212246, -2.381427, 1, 1, 1, 1, 1,
-1.866897, 0.7458009, -0.4466234, 1, 1, 1, 1, 1,
-1.859998, 0.6414316, -0.8453612, 0, 0, 1, 1, 1,
-1.843635, -0.2280266, -0.5995638, 1, 0, 0, 1, 1,
-1.838735, 0.5959539, -0.7730772, 1, 0, 0, 1, 1,
-1.816269, -0.06265363, -0.5710866, 1, 0, 0, 1, 1,
-1.795707, -1.100762, -1.069796, 1, 0, 0, 1, 1,
-1.787808, -0.07558551, -0.5098737, 1, 0, 0, 1, 1,
-1.780693, -1.124666, -2.749812, 0, 0, 0, 1, 1,
-1.745293, -1.597782, -3.040792, 0, 0, 0, 1, 1,
-1.729763, -0.3834278, -1.352831, 0, 0, 0, 1, 1,
-1.717325, -0.479356, -1.709543, 0, 0, 0, 1, 1,
-1.712539, 1.519806, -0.430359, 0, 0, 0, 1, 1,
-1.709019, -0.6467206, -3.098333, 0, 0, 0, 1, 1,
-1.708097, 0.8476303, 1.021461, 0, 0, 0, 1, 1,
-1.70455, 1.082925, -0.2788738, 1, 1, 1, 1, 1,
-1.671283, -0.2945977, -1.155968, 1, 1, 1, 1, 1,
-1.661166, -1.759583, -3.120866, 1, 1, 1, 1, 1,
-1.66114, -0.7450628, -1.646382, 1, 1, 1, 1, 1,
-1.642757, -0.1692612, -0.5711165, 1, 1, 1, 1, 1,
-1.640527, 0.4639871, -0.8947361, 1, 1, 1, 1, 1,
-1.634202, 0.7077105, -1.239067, 1, 1, 1, 1, 1,
-1.618248, -0.9804356, -2.711153, 1, 1, 1, 1, 1,
-1.603448, -0.359379, -0.8183582, 1, 1, 1, 1, 1,
-1.589711, -0.5375168, -3.099853, 1, 1, 1, 1, 1,
-1.583851, -1.612983, -2.90977, 1, 1, 1, 1, 1,
-1.568426, -1.097142, -2.130789, 1, 1, 1, 1, 1,
-1.561542, -0.3739341, -2.689352, 1, 1, 1, 1, 1,
-1.561495, 1.24838, -1.268699, 1, 1, 1, 1, 1,
-1.560078, -0.4361987, -1.014201, 1, 1, 1, 1, 1,
-1.559397, 0.5643854, 0.2227436, 0, 0, 1, 1, 1,
-1.55599, -0.3155974, -1.679346, 1, 0, 0, 1, 1,
-1.553997, -0.07003763, -0.7268975, 1, 0, 0, 1, 1,
-1.541332, 0.1460863, -4.091473, 1, 0, 0, 1, 1,
-1.523073, -0.3546232, -2.849399, 1, 0, 0, 1, 1,
-1.516451, -0.2406101, -1.85656, 1, 0, 0, 1, 1,
-1.496983, -0.9756508, -0.9458378, 0, 0, 0, 1, 1,
-1.488154, 2.281437, -1.404235, 0, 0, 0, 1, 1,
-1.480074, 0.1502725, -3.574377, 0, 0, 0, 1, 1,
-1.479319, -0.9174905, -3.164104, 0, 0, 0, 1, 1,
-1.452729, 1.950294, -0.3820229, 0, 0, 0, 1, 1,
-1.451712, 1.228737, 0.2916207, 0, 0, 0, 1, 1,
-1.451466, 0.7579281, -1.968152, 0, 0, 0, 1, 1,
-1.446071, 1.507731, -2.116027, 1, 1, 1, 1, 1,
-1.437259, 1.491917, -0.4517548, 1, 1, 1, 1, 1,
-1.434616, -1.913814, -1.849185, 1, 1, 1, 1, 1,
-1.432106, -0.9266223, -3.328092, 1, 1, 1, 1, 1,
-1.431689, -1.952199, -1.090552, 1, 1, 1, 1, 1,
-1.422975, -0.04606934, -1.444014, 1, 1, 1, 1, 1,
-1.42173, 0.574095, -0.09420839, 1, 1, 1, 1, 1,
-1.400189, -0.0771786, -2.43925, 1, 1, 1, 1, 1,
-1.375674, 0.3624822, -0.7692456, 1, 1, 1, 1, 1,
-1.358285, 2.804924, -2.088572, 1, 1, 1, 1, 1,
-1.346922, 0.5476406, -0.3615498, 1, 1, 1, 1, 1,
-1.317578, 0.469211, -2.38824, 1, 1, 1, 1, 1,
-1.315321, 0.1589988, -2.948291, 1, 1, 1, 1, 1,
-1.312098, -1.58507, -1.292482, 1, 1, 1, 1, 1,
-1.298591, 0.7594541, -1.252237, 1, 1, 1, 1, 1,
-1.29745, 0.4979979, -1.802914, 0, 0, 1, 1, 1,
-1.291638, -0.2871913, -1.000962, 1, 0, 0, 1, 1,
-1.286086, -2.427094, -2.890269, 1, 0, 0, 1, 1,
-1.273257, 1.211408, -0.927586, 1, 0, 0, 1, 1,
-1.26498, 0.319429, -1.603488, 1, 0, 0, 1, 1,
-1.264223, 0.5493416, -1.849592, 1, 0, 0, 1, 1,
-1.257532, -0.4059205, -1.466806, 0, 0, 0, 1, 1,
-1.251489, 0.3383896, -1.758359, 0, 0, 0, 1, 1,
-1.247842, -0.3683563, -1.95132, 0, 0, 0, 1, 1,
-1.244195, -0.1465574, -0.09618745, 0, 0, 0, 1, 1,
-1.243136, 0.8584223, 0.8431394, 0, 0, 0, 1, 1,
-1.238702, 0.09655903, -1.31665, 0, 0, 0, 1, 1,
-1.231875, -0.4223702, -3.589711, 0, 0, 0, 1, 1,
-1.225569, -0.7810336, -0.8744635, 1, 1, 1, 1, 1,
-1.222218, -0.8253776, -2.838161, 1, 1, 1, 1, 1,
-1.215907, -0.7975916, -3.755369, 1, 1, 1, 1, 1,
-1.213155, -1.180894, -2.866854, 1, 1, 1, 1, 1,
-1.211235, 2.241735, 0.08166121, 1, 1, 1, 1, 1,
-1.210012, -0.4489547, -1.987731, 1, 1, 1, 1, 1,
-1.203076, -0.7385408, -2.409131, 1, 1, 1, 1, 1,
-1.197564, -0.05228775, -1.646483, 1, 1, 1, 1, 1,
-1.195579, -0.6955219, -1.137187, 1, 1, 1, 1, 1,
-1.194161, 0.7376909, -2.189787, 1, 1, 1, 1, 1,
-1.181461, 0.631962, -1.365549, 1, 1, 1, 1, 1,
-1.177076, 1.068228, -2.830072, 1, 1, 1, 1, 1,
-1.168588, -0.4447708, -1.885621, 1, 1, 1, 1, 1,
-1.165128, -0.3664882, -2.647179, 1, 1, 1, 1, 1,
-1.15192, -0.03486701, -1.89077, 1, 1, 1, 1, 1,
-1.149072, 0.4317842, -1.510304, 0, 0, 1, 1, 1,
-1.148795, 0.5942492, -1.471239, 1, 0, 0, 1, 1,
-1.147762, -0.5510151, -2.48834, 1, 0, 0, 1, 1,
-1.143568, 1.54118, -1.907138, 1, 0, 0, 1, 1,
-1.143256, 0.332289, -1.200213, 1, 0, 0, 1, 1,
-1.143202, -0.4956318, -0.957083, 1, 0, 0, 1, 1,
-1.142427, 0.07698059, -1.865273, 0, 0, 0, 1, 1,
-1.138182, 0.2421105, -0.9640784, 0, 0, 0, 1, 1,
-1.136543, -0.1609226, -0.3890741, 0, 0, 0, 1, 1,
-1.135691, 0.922611, -0.7933395, 0, 0, 0, 1, 1,
-1.129346, -0.8517832, -3.11084, 0, 0, 0, 1, 1,
-1.125038, -0.8247887, -2.565452, 0, 0, 0, 1, 1,
-1.124443, 0.0782866, -0.6256214, 0, 0, 0, 1, 1,
-1.121004, 0.5626714, -2.756441, 1, 1, 1, 1, 1,
-1.114595, 0.2700763, -1.534428, 1, 1, 1, 1, 1,
-1.109674, -0.5369281, -1.058056, 1, 1, 1, 1, 1,
-1.107588, -0.07340842, -2.033699, 1, 1, 1, 1, 1,
-1.102233, 0.997107, -0.3357848, 1, 1, 1, 1, 1,
-1.101344, -2.495548, -2.081023, 1, 1, 1, 1, 1,
-1.089375, 2.197708, -0.4589585, 1, 1, 1, 1, 1,
-1.088144, -0.7452456, -3.603441, 1, 1, 1, 1, 1,
-1.087353, 0.8863487, -2.62413, 1, 1, 1, 1, 1,
-1.081495, -1.540022, -2.102741, 1, 1, 1, 1, 1,
-1.0787, 1.667386, 0.9332072, 1, 1, 1, 1, 1,
-1.051981, 0.7660176, -1.366435, 1, 1, 1, 1, 1,
-1.0485, 0.658899, -0.547904, 1, 1, 1, 1, 1,
-1.047251, -0.2902491, -2.960975, 1, 1, 1, 1, 1,
-1.043547, -0.1480422, -4.055161, 1, 1, 1, 1, 1,
-1.035366, -1.550346, -3.524764, 0, 0, 1, 1, 1,
-1.035016, 0.1529095, -2.078583, 1, 0, 0, 1, 1,
-1.034413, 0.06292301, -2.565582, 1, 0, 0, 1, 1,
-1.028855, -0.6312599, -4.324993, 1, 0, 0, 1, 1,
-1.027893, -0.1887784, -1.444057, 1, 0, 0, 1, 1,
-1.019251, 1.485311, -1.89505, 1, 0, 0, 1, 1,
-1.014643, 0.266427, -3.712339, 0, 0, 0, 1, 1,
-1.011358, -1.327428, -1.900265, 0, 0, 0, 1, 1,
-1.009285, -0.7176906, -0.5283577, 0, 0, 0, 1, 1,
-1.004454, 2.05912, -0.796363, 0, 0, 0, 1, 1,
-0.9910759, 0.9758014, 0.514258, 0, 0, 0, 1, 1,
-0.9862011, -1.634, -2.416932, 0, 0, 0, 1, 1,
-0.9840755, 0.2131033, -0.07361862, 0, 0, 0, 1, 1,
-0.9800505, 0.1198319, -3.037112, 1, 1, 1, 1, 1,
-0.9793926, 1.982618, -0.3528305, 1, 1, 1, 1, 1,
-0.9702119, 0.7437216, -1.85802, 1, 1, 1, 1, 1,
-0.9684215, -1.703263, -2.824765, 1, 1, 1, 1, 1,
-0.9638149, -0.8982169, -2.202667, 1, 1, 1, 1, 1,
-0.9611641, 0.2974328, -1.653028, 1, 1, 1, 1, 1,
-0.9601527, 0.7305786, -0.2935011, 1, 1, 1, 1, 1,
-0.9563497, -1.093624, -2.867571, 1, 1, 1, 1, 1,
-0.9506246, -2.512379, -4.500682, 1, 1, 1, 1, 1,
-0.9361966, -0.4115434, -2.300933, 1, 1, 1, 1, 1,
-0.9278614, 1.132861, -0.7384295, 1, 1, 1, 1, 1,
-0.9262103, -0.0396036, -1.445656, 1, 1, 1, 1, 1,
-0.922495, -0.002121676, -0.5929837, 1, 1, 1, 1, 1,
-0.9221698, 0.4015509, -1.197726, 1, 1, 1, 1, 1,
-0.9212443, 0.9920176, 0.4541986, 1, 1, 1, 1, 1,
-0.9196371, 0.4435481, -0.7823534, 0, 0, 1, 1, 1,
-0.9120973, -2.747473, -2.509879, 1, 0, 0, 1, 1,
-0.9114583, 0.2703073, -1.065693, 1, 0, 0, 1, 1,
-0.908695, -0.3355289, -0.8560846, 1, 0, 0, 1, 1,
-0.9084162, 0.517152, -1.338586, 1, 0, 0, 1, 1,
-0.9070412, 0.06210996, -2.402942, 1, 0, 0, 1, 1,
-0.9029526, -0.7188735, -2.883578, 0, 0, 0, 1, 1,
-0.8967679, 0.4366103, -1.740705, 0, 0, 0, 1, 1,
-0.8948839, -0.9192885, -4.668774, 0, 0, 0, 1, 1,
-0.8942805, 1.220752, -0.3645037, 0, 0, 0, 1, 1,
-0.8930767, 0.9483907, 0.1867342, 0, 0, 0, 1, 1,
-0.8890008, -0.1793471, -0.4965717, 0, 0, 0, 1, 1,
-0.8878329, 0.01357408, -2.361603, 0, 0, 0, 1, 1,
-0.8873668, 0.4404234, -0.8216938, 1, 1, 1, 1, 1,
-0.8671601, -0.6808035, -2.531268, 1, 1, 1, 1, 1,
-0.8613796, -1.782507, -2.368393, 1, 1, 1, 1, 1,
-0.8608371, -0.4206203, -2.866621, 1, 1, 1, 1, 1,
-0.8599225, 0.2670392, -2.68355, 1, 1, 1, 1, 1,
-0.8598255, -0.2204611, -1.663001, 1, 1, 1, 1, 1,
-0.8582311, 0.3662351, -0.5155853, 1, 1, 1, 1, 1,
-0.8559048, 0.3900296, -2.568465, 1, 1, 1, 1, 1,
-0.8526409, -1.488618, -2.169649, 1, 1, 1, 1, 1,
-0.8473502, 1.49823, -1.386483, 1, 1, 1, 1, 1,
-0.8433987, 0.05719163, 1.002248, 1, 1, 1, 1, 1,
-0.8421056, 0.01499996, -0.612634, 1, 1, 1, 1, 1,
-0.8337207, 0.2805935, 0.2930568, 1, 1, 1, 1, 1,
-0.8329743, 0.394764, -1.27997, 1, 1, 1, 1, 1,
-0.8303353, -0.1749571, -2.699081, 1, 1, 1, 1, 1,
-0.8291388, 0.4957879, -0.9296784, 0, 0, 1, 1, 1,
-0.827408, 0.3196243, -2.718373, 1, 0, 0, 1, 1,
-0.8230524, -0.7105905, -1.915187, 1, 0, 0, 1, 1,
-0.8091866, -0.9598968, -2.55829, 1, 0, 0, 1, 1,
-0.8059668, 0.7006888, -0.09051497, 1, 0, 0, 1, 1,
-0.7987989, 0.2838904, -1.406645, 1, 0, 0, 1, 1,
-0.796469, 0.4447092, 1.425985, 0, 0, 0, 1, 1,
-0.7922707, 1.703955, -1.202879, 0, 0, 0, 1, 1,
-0.7864076, -0.7591654, -1.519725, 0, 0, 0, 1, 1,
-0.7853743, -0.5815144, -1.241293, 0, 0, 0, 1, 1,
-0.7835559, 0.1108885, -1.91042, 0, 0, 0, 1, 1,
-0.7818753, -0.5828955, -2.828251, 0, 0, 0, 1, 1,
-0.7768734, 0.2770805, -0.3810627, 0, 0, 0, 1, 1,
-0.7767898, 0.3037833, -2.714243, 1, 1, 1, 1, 1,
-0.7744877, 0.8529373, -0.6305842, 1, 1, 1, 1, 1,
-0.7700099, -0.1788855, -1.280042, 1, 1, 1, 1, 1,
-0.768442, 2.235884, -0.2726101, 1, 1, 1, 1, 1,
-0.7616695, -0.1047144, -2.584478, 1, 1, 1, 1, 1,
-0.7592203, 0.5093173, -0.6052157, 1, 1, 1, 1, 1,
-0.7553802, 1.297701, 1.054048, 1, 1, 1, 1, 1,
-0.7523181, 0.7402202, -0.3997409, 1, 1, 1, 1, 1,
-0.7519487, -1.325431, -2.256783, 1, 1, 1, 1, 1,
-0.7473155, 0.6081335, 0.01733403, 1, 1, 1, 1, 1,
-0.7459337, 0.8803625, -1.71769, 1, 1, 1, 1, 1,
-0.7458807, -0.1740823, -1.320176, 1, 1, 1, 1, 1,
-0.744051, -1.021091, -3.381907, 1, 1, 1, 1, 1,
-0.7394477, 1.0736, -1.326581, 1, 1, 1, 1, 1,
-0.732487, -0.141721, 0.05521934, 1, 1, 1, 1, 1,
-0.7295552, 0.9817219, -1.081128, 0, 0, 1, 1, 1,
-0.7286266, 0.9780557, -0.1132333, 1, 0, 0, 1, 1,
-0.723761, 0.691308, 0.6682969, 1, 0, 0, 1, 1,
-0.7232436, -0.3354189, -0.6416051, 1, 0, 0, 1, 1,
-0.7214176, -1.319244, -1.963651, 1, 0, 0, 1, 1,
-0.7183695, -1.215835, -2.680941, 1, 0, 0, 1, 1,
-0.7105033, 0.950749, -0.663338, 0, 0, 0, 1, 1,
-0.7103361, 0.4332689, 0.03145481, 0, 0, 0, 1, 1,
-0.7099729, -0.6633018, -3.114098, 0, 0, 0, 1, 1,
-0.7097694, -0.4913436, -2.941403, 0, 0, 0, 1, 1,
-0.7089102, -0.9051184, -1.567929, 0, 0, 0, 1, 1,
-0.7066271, 0.6728603, -1.018066, 0, 0, 0, 1, 1,
-0.7037815, -0.5534431, -4.117577, 0, 0, 0, 1, 1,
-0.7031907, -0.7878838, -1.263928, 1, 1, 1, 1, 1,
-0.7014815, -0.8483757, -0.7622876, 1, 1, 1, 1, 1,
-0.701335, 1.242506, -0.1653987, 1, 1, 1, 1, 1,
-0.6973081, 0.6975423, -0.8969728, 1, 1, 1, 1, 1,
-0.6927446, -0.2965406, -3.339607, 1, 1, 1, 1, 1,
-0.6925738, -0.4456452, -2.775377, 1, 1, 1, 1, 1,
-0.6907221, -0.984162, -2.701204, 1, 1, 1, 1, 1,
-0.6768543, -0.009066582, -0.7236342, 1, 1, 1, 1, 1,
-0.6761678, 0.4252152, -0.6626492, 1, 1, 1, 1, 1,
-0.6731989, 0.8907897, -2.726938, 1, 1, 1, 1, 1,
-0.6711962, -0.6024709, -0.17541, 1, 1, 1, 1, 1,
-0.6692648, 2.092654, 0.3942194, 1, 1, 1, 1, 1,
-0.6689462, -0.4417866, -3.330218, 1, 1, 1, 1, 1,
-0.6626807, 0.5282927, -1.492528, 1, 1, 1, 1, 1,
-0.6581668, -1.52989, -1.346984, 1, 1, 1, 1, 1,
-0.6552715, 1.06647, -1.57604, 0, 0, 1, 1, 1,
-0.6550815, -0.04099979, -1.865503, 1, 0, 0, 1, 1,
-0.6547407, 0.2566401, -1.988489, 1, 0, 0, 1, 1,
-0.6535838, 0.6319641, -0.5984056, 1, 0, 0, 1, 1,
-0.6519235, 1.21761, -0.756893, 1, 0, 0, 1, 1,
-0.6501992, -1.559572, -4.390007, 1, 0, 0, 1, 1,
-0.6479303, 1.32353, -0.9416841, 0, 0, 0, 1, 1,
-0.6432834, -0.2578543, -2.458614, 0, 0, 0, 1, 1,
-0.6379282, 1.225081, -0.3133689, 0, 0, 0, 1, 1,
-0.628125, -1.834986, -3.244064, 0, 0, 0, 1, 1,
-0.6280555, -0.6655974, -2.51449, 0, 0, 0, 1, 1,
-0.6263473, -1.456236, -3.515109, 0, 0, 0, 1, 1,
-0.6257848, 0.8244702, -0.6788185, 0, 0, 0, 1, 1,
-0.6179519, 1.913683, -1.695679, 1, 1, 1, 1, 1,
-0.6161561, 1.362088, -0.2261999, 1, 1, 1, 1, 1,
-0.6155314, 1.282267, -2.329706, 1, 1, 1, 1, 1,
-0.5999544, -0.3729853, -2.167373, 1, 1, 1, 1, 1,
-0.599147, 0.9375046, 1.161016, 1, 1, 1, 1, 1,
-0.5985098, -0.543331, -1.825408, 1, 1, 1, 1, 1,
-0.5946475, -0.1701576, -2.800502, 1, 1, 1, 1, 1,
-0.5934381, 0.1239361, -1.624728, 1, 1, 1, 1, 1,
-0.5918671, 0.1276761, -2.493663, 1, 1, 1, 1, 1,
-0.590799, 2.315935, -1.145668, 1, 1, 1, 1, 1,
-0.5901339, -0.7913327, -1.204794, 1, 1, 1, 1, 1,
-0.5867408, 1.215513, -0.7522253, 1, 1, 1, 1, 1,
-0.5842785, 0.3007181, -0.1309533, 1, 1, 1, 1, 1,
-0.5842171, 1.30347, -0.7193226, 1, 1, 1, 1, 1,
-0.583118, -2.287309, -2.416587, 1, 1, 1, 1, 1,
-0.5798062, -0.226402, -0.1454801, 0, 0, 1, 1, 1,
-0.5779234, 2.06286, 0.5114409, 1, 0, 0, 1, 1,
-0.5738487, -2.02184, -3.076408, 1, 0, 0, 1, 1,
-0.5669535, -1.95085, -2.329476, 1, 0, 0, 1, 1,
-0.5614998, -0.1535328, -1.902107, 1, 0, 0, 1, 1,
-0.5603594, 0.8120854, -1.386532, 1, 0, 0, 1, 1,
-0.5561938, -0.8978487, -2.936464, 0, 0, 0, 1, 1,
-0.5546579, -0.3007415, -3.218711, 0, 0, 0, 1, 1,
-0.551932, -1.146348, -3.294317, 0, 0, 0, 1, 1,
-0.5448863, -0.9556192, -1.28483, 0, 0, 0, 1, 1,
-0.5425203, 1.593014, -0.05982598, 0, 0, 0, 1, 1,
-0.5425201, -0.3042495, -2.822403, 0, 0, 0, 1, 1,
-0.5424422, -0.1140861, -1.364345, 0, 0, 0, 1, 1,
-0.5413498, -0.3486205, -3.116507, 1, 1, 1, 1, 1,
-0.5389835, -0.05616043, -1.53113, 1, 1, 1, 1, 1,
-0.5364814, 0.2926822, -0.7944639, 1, 1, 1, 1, 1,
-0.5359043, 0.2296758, -1.079197, 1, 1, 1, 1, 1,
-0.5318919, -1.376618, -2.229111, 1, 1, 1, 1, 1,
-0.5255128, 0.236332, -0.5323313, 1, 1, 1, 1, 1,
-0.5224764, -1.142202, -4.077112, 1, 1, 1, 1, 1,
-0.5209794, -1.173804, -2.260339, 1, 1, 1, 1, 1,
-0.5166683, 0.1033649, -1.26202, 1, 1, 1, 1, 1,
-0.5163886, -0.2490307, -1.953151, 1, 1, 1, 1, 1,
-0.5078436, 1.126444, -1.016787, 1, 1, 1, 1, 1,
-0.5067862, -0.1193847, -3.271484, 1, 1, 1, 1, 1,
-0.505268, 1.996497, -1.564927, 1, 1, 1, 1, 1,
-0.5023652, -1.363222, -4.5436, 1, 1, 1, 1, 1,
-0.4992034, -0.7248977, -2.197521, 1, 1, 1, 1, 1,
-0.4985432, -1.332807, -0.991056, 0, 0, 1, 1, 1,
-0.4978313, -1.923166, -2.850148, 1, 0, 0, 1, 1,
-0.4894177, 0.7827125, 0.009378342, 1, 0, 0, 1, 1,
-0.4887106, -0.08902036, -0.7676424, 1, 0, 0, 1, 1,
-0.4755544, 0.7311566, -0.8678479, 1, 0, 0, 1, 1,
-0.4729438, 0.6643631, -0.3947805, 1, 0, 0, 1, 1,
-0.4724344, 0.8676925, 0.7513781, 0, 0, 0, 1, 1,
-0.4680624, -0.1129613, -1.74678, 0, 0, 0, 1, 1,
-0.4612943, 0.970194, -0.2634592, 0, 0, 0, 1, 1,
-0.4607561, 0.5529195, -0.7152903, 0, 0, 0, 1, 1,
-0.459945, -1.289002, -2.336015, 0, 0, 0, 1, 1,
-0.4554685, -1.339204, -2.970403, 0, 0, 0, 1, 1,
-0.4554293, 0.817725, -1.198814, 0, 0, 0, 1, 1,
-0.4523832, -1.637225, -2.931597, 1, 1, 1, 1, 1,
-0.4462816, 0.08897022, -0.3829615, 1, 1, 1, 1, 1,
-0.4435363, -0.3927884, -0.8492732, 1, 1, 1, 1, 1,
-0.4389412, -1.962155, -3.673623, 1, 1, 1, 1, 1,
-0.4373014, 1.052398, -0.3545844, 1, 1, 1, 1, 1,
-0.4368482, 2.731709, -1.19424, 1, 1, 1, 1, 1,
-0.4327041, 0.3712552, -0.7724804, 1, 1, 1, 1, 1,
-0.4307636, -1.248068, -2.310178, 1, 1, 1, 1, 1,
-0.4301291, 1.736925, 0.3155924, 1, 1, 1, 1, 1,
-0.4297173, -0.3747665, -2.81109, 1, 1, 1, 1, 1,
-0.4286551, -0.7470773, -3.258904, 1, 1, 1, 1, 1,
-0.4256712, 1.632278, 0.169212, 1, 1, 1, 1, 1,
-0.4230574, -0.8958518, -3.029149, 1, 1, 1, 1, 1,
-0.4195536, 0.1675769, -0.2564805, 1, 1, 1, 1, 1,
-0.4169323, -0.8239627, -1.814619, 1, 1, 1, 1, 1,
-0.4162031, -0.6518146, -1.044667, 0, 0, 1, 1, 1,
-0.4153248, -0.0816303, -0.9869751, 1, 0, 0, 1, 1,
-0.4114116, -0.9188396, -2.904971, 1, 0, 0, 1, 1,
-0.4077592, 1.836856, -0.4554073, 1, 0, 0, 1, 1,
-0.4039921, -0.1806246, -1.027885, 1, 0, 0, 1, 1,
-0.4015181, 0.9087905, -1.3075, 1, 0, 0, 1, 1,
-0.3994239, -0.356029, -1.200474, 0, 0, 0, 1, 1,
-0.3936377, -0.5216899, -2.195393, 0, 0, 0, 1, 1,
-0.3767112, -1.303158, -1.64726, 0, 0, 0, 1, 1,
-0.3751476, 0.6087611, -0.2199094, 0, 0, 0, 1, 1,
-0.3741548, -0.3196857, -1.826118, 0, 0, 0, 1, 1,
-0.3732302, -1.652407, -3.038174, 0, 0, 0, 1, 1,
-0.3631217, 2.177406, 0.6344813, 0, 0, 0, 1, 1,
-0.3630521, -1.907597, -2.762633, 1, 1, 1, 1, 1,
-0.3626821, -0.8335991, -3.677063, 1, 1, 1, 1, 1,
-0.3621889, -0.9633135, -1.695641, 1, 1, 1, 1, 1,
-0.360132, 1.54687, -0.6843774, 1, 1, 1, 1, 1,
-0.354708, -1.608023, -2.872292, 1, 1, 1, 1, 1,
-0.3541456, 0.01389543, -1.798823, 1, 1, 1, 1, 1,
-0.35367, -0.234646, -1.440105, 1, 1, 1, 1, 1,
-0.3517995, -1.05651, -2.061196, 1, 1, 1, 1, 1,
-0.3514513, -1.053052, -4.452101, 1, 1, 1, 1, 1,
-0.3511374, 0.655127, -0.7576739, 1, 1, 1, 1, 1,
-0.3447044, -0.5108379, -4.110388, 1, 1, 1, 1, 1,
-0.3375417, 1.459114, -0.3377162, 1, 1, 1, 1, 1,
-0.3312501, -0.6167725, -1.560906, 1, 1, 1, 1, 1,
-0.3289563, -0.2995726, -1.276051, 1, 1, 1, 1, 1,
-0.3286055, 0.3015684, -1.460842, 1, 1, 1, 1, 1,
-0.3283059, -0.4044991, -1.882002, 0, 0, 1, 1, 1,
-0.3276364, 0.181216, -0.8489466, 1, 0, 0, 1, 1,
-0.3247404, -0.5530614, -4.074828, 1, 0, 0, 1, 1,
-0.3245862, -1.222877, -3.173519, 1, 0, 0, 1, 1,
-0.323095, -0.9650313, -2.778415, 1, 0, 0, 1, 1,
-0.3186813, -3.276101, -3.241951, 1, 0, 0, 1, 1,
-0.3154498, 1.411301, 0.9752383, 0, 0, 0, 1, 1,
-0.3149332, -1.410132, -2.484675, 0, 0, 0, 1, 1,
-0.3140798, 0.3782637, -1.543391, 0, 0, 0, 1, 1,
-0.3113904, -0.9455445, -1.368919, 0, 0, 0, 1, 1,
-0.3091798, -0.9796551, -2.30658, 0, 0, 0, 1, 1,
-0.3085369, 0.122753, -1.673754, 0, 0, 0, 1, 1,
-0.3036809, -0.5846921, -3.011104, 0, 0, 0, 1, 1,
-0.296144, 0.9003179, -1.277314, 1, 1, 1, 1, 1,
-0.2921989, 2.280499, -0.7625626, 1, 1, 1, 1, 1,
-0.2868965, -0.02418975, -1.246844, 1, 1, 1, 1, 1,
-0.2845768, 0.07416017, -0.2882924, 1, 1, 1, 1, 1,
-0.2801445, 1.836543, -0.4073403, 1, 1, 1, 1, 1,
-0.2758264, -1.753891, -1.367754, 1, 1, 1, 1, 1,
-0.268711, 0.5313858, -2.254895, 1, 1, 1, 1, 1,
-0.2674454, -0.1016693, -0.9199082, 1, 1, 1, 1, 1,
-0.266324, 0.1647819, -0.8155503, 1, 1, 1, 1, 1,
-0.2659056, -0.6517101, -2.369783, 1, 1, 1, 1, 1,
-0.2477266, -0.6996106, -4.69351, 1, 1, 1, 1, 1,
-0.2470287, 0.9743919, 1.377842, 1, 1, 1, 1, 1,
-0.2458337, -0.3311819, -2.386247, 1, 1, 1, 1, 1,
-0.2447758, -0.3459973, -0.9786559, 1, 1, 1, 1, 1,
-0.2440923, -0.4013017, -2.28214, 1, 1, 1, 1, 1,
-0.2401958, 1.493656, -0.07400989, 0, 0, 1, 1, 1,
-0.2392348, 0.9923912, -0.1366721, 1, 0, 0, 1, 1,
-0.2384329, -1.278801, -3.418856, 1, 0, 0, 1, 1,
-0.2370092, 0.3619384, 0.3180148, 1, 0, 0, 1, 1,
-0.2363597, -0.3110424, -1.805454, 1, 0, 0, 1, 1,
-0.2270132, -0.1744281, -3.625835, 1, 0, 0, 1, 1,
-0.2269009, 1.406552, -1.523272, 0, 0, 0, 1, 1,
-0.2252069, 1.295017, -0.2455706, 0, 0, 0, 1, 1,
-0.2217648, -1.701496, -3.971309, 0, 0, 0, 1, 1,
-0.2199097, 1.641446, -2.583707, 0, 0, 0, 1, 1,
-0.218712, 0.1867649, -1.027949, 0, 0, 0, 1, 1,
-0.218239, 0.3718464, 0.1291822, 0, 0, 0, 1, 1,
-0.2155139, -1.00568, -3.167222, 0, 0, 0, 1, 1,
-0.2077143, -1.061049, -4.149768, 1, 1, 1, 1, 1,
-0.2042803, -0.4096829, -2.453844, 1, 1, 1, 1, 1,
-0.2035122, -0.8109217, -2.87361, 1, 1, 1, 1, 1,
-0.1987982, -0.3240961, -2.42231, 1, 1, 1, 1, 1,
-0.1976293, 1.78768, 0.1887012, 1, 1, 1, 1, 1,
-0.1926659, -0.2217117, -1.853745, 1, 1, 1, 1, 1,
-0.1875033, -0.2320367, -1.643625, 1, 1, 1, 1, 1,
-0.1829448, 0.6279026, -0.9208865, 1, 1, 1, 1, 1,
-0.1796676, 0.5822653, 1.125565, 1, 1, 1, 1, 1,
-0.1793023, 0.9054483, 0.8172631, 1, 1, 1, 1, 1,
-0.1769072, -0.5296789, -2.877002, 1, 1, 1, 1, 1,
-0.1760493, -2.044406, -3.657776, 1, 1, 1, 1, 1,
-0.1668639, -2.023979, -3.499721, 1, 1, 1, 1, 1,
-0.1649582, -0.6039135, -3.3193, 1, 1, 1, 1, 1,
-0.1601922, 1.250345, 0.4278032, 1, 1, 1, 1, 1,
-0.1546178, -0.2860111, -0.2940173, 0, 0, 1, 1, 1,
-0.1505572, -1.909945, -2.556194, 1, 0, 0, 1, 1,
-0.1505106, -0.5847512, -2.262805, 1, 0, 0, 1, 1,
-0.1485895, 0.4706412, 0.277571, 1, 0, 0, 1, 1,
-0.1471218, -1.67751, -3.720478, 1, 0, 0, 1, 1,
-0.1466245, -0.7478817, -1.539166, 1, 0, 0, 1, 1,
-0.1432009, -0.6005913, -3.998018, 0, 0, 0, 1, 1,
-0.1416311, 0.5892648, -0.1809829, 0, 0, 0, 1, 1,
-0.141617, 0.3673672, -1.033767, 0, 0, 0, 1, 1,
-0.1338999, -0.3419833, -3.556752, 0, 0, 0, 1, 1,
-0.1325405, -0.9106991, -3.031363, 0, 0, 0, 1, 1,
-0.1316089, 0.9597251, -1.922033, 0, 0, 0, 1, 1,
-0.1276039, 1.730654, 0.3898095, 0, 0, 0, 1, 1,
-0.1271182, 0.1633852, 0.6656749, 1, 1, 1, 1, 1,
-0.123516, -0.9477994, -4.676513, 1, 1, 1, 1, 1,
-0.1229311, 0.3950115, -0.9843419, 1, 1, 1, 1, 1,
-0.1213003, 0.1528047, -1.011433, 1, 1, 1, 1, 1,
-0.1179607, -0.1704935, -3.174859, 1, 1, 1, 1, 1,
-0.1162188, 2.219561, 1.568837, 1, 1, 1, 1, 1,
-0.1003734, 0.3063771, -1.137266, 1, 1, 1, 1, 1,
-0.09858502, -0.1013515, -2.177937, 1, 1, 1, 1, 1,
-0.09642059, 0.585986, 1.837552, 1, 1, 1, 1, 1,
-0.09617639, -0.7102413, -3.481325, 1, 1, 1, 1, 1,
-0.09366728, 1.261825, -1.448664, 1, 1, 1, 1, 1,
-0.09310945, 0.9441285, 1.028242, 1, 1, 1, 1, 1,
-0.0927227, 1.463189, -0.2952462, 1, 1, 1, 1, 1,
-0.09127117, 0.4627856, 0.1488069, 1, 1, 1, 1, 1,
-0.08848913, 1.188226, -1.481602, 1, 1, 1, 1, 1,
-0.08631004, 1.221215, -0.4556856, 0, 0, 1, 1, 1,
-0.08576424, 0.2667249, 0.3271776, 1, 0, 0, 1, 1,
-0.08559924, 0.7692334, -0.2889682, 1, 0, 0, 1, 1,
-0.07780889, -0.800244, -2.893543, 1, 0, 0, 1, 1,
-0.07544332, -0.5060622, -3.368544, 1, 0, 0, 1, 1,
-0.07505916, 0.6468751, 0.5174893, 1, 0, 0, 1, 1,
-0.07396332, -1.357958, -3.254405, 0, 0, 0, 1, 1,
-0.07365891, 0.8049309, 1.485479, 0, 0, 0, 1, 1,
-0.07190526, -1.117951, -4.222884, 0, 0, 0, 1, 1,
-0.07188613, 1.334689, -0.7141609, 0, 0, 0, 1, 1,
-0.07173149, -0.01204282, -1.507072, 0, 0, 0, 1, 1,
-0.07056719, -0.5076196, -2.722005, 0, 0, 0, 1, 1,
-0.06838254, -0.6216249, -1.149312, 0, 0, 0, 1, 1,
-0.0659942, 0.3726499, -1.068766, 1, 1, 1, 1, 1,
-0.06570803, 0.9073471, -0.9010372, 1, 1, 1, 1, 1,
-0.06499259, 0.7267959, -1.078758, 1, 1, 1, 1, 1,
-0.05993209, 0.1440174, 0.3894933, 1, 1, 1, 1, 1,
-0.05936112, -0.9246193, -2.223585, 1, 1, 1, 1, 1,
-0.05481032, 0.6733821, -1.372464, 1, 1, 1, 1, 1,
-0.05241062, 0.4534965, -0.6555178, 1, 1, 1, 1, 1,
-0.04850458, -0.03610679, -4.326635, 1, 1, 1, 1, 1,
-0.04781405, 0.4589147, 0.3081426, 1, 1, 1, 1, 1,
-0.04368268, -0.5812211, -2.441944, 1, 1, 1, 1, 1,
-0.04213312, -0.122412, -3.747038, 1, 1, 1, 1, 1,
-0.03840273, -1.001988, -1.974646, 1, 1, 1, 1, 1,
-0.03300308, 0.362614, -0.6469697, 1, 1, 1, 1, 1,
-0.03295251, -0.3492067, -2.963711, 1, 1, 1, 1, 1,
-0.0325732, -2.018928, -2.50479, 1, 1, 1, 1, 1,
-0.02474322, -0.8722329, -2.916064, 0, 0, 1, 1, 1,
-0.02225943, 0.9999176, 0.7451586, 1, 0, 0, 1, 1,
-0.01775212, -0.03635348, -3.049929, 1, 0, 0, 1, 1,
-0.01730402, 2.146581, 0.5267888, 1, 0, 0, 1, 1,
-0.01654569, -0.8911474, -2.580712, 1, 0, 0, 1, 1,
-0.01538889, 0.065548, -1.955734, 1, 0, 0, 1, 1,
-0.01328909, 0.9181936, 1.900681, 0, 0, 0, 1, 1,
-0.009313461, 1.341397, -0.9906701, 0, 0, 0, 1, 1,
-0.009306645, 0.02782934, -1.050352, 0, 0, 0, 1, 1,
-0.009089782, 1.002336, 0.8178189, 0, 0, 0, 1, 1,
-0.008432923, 0.0449805, -1.544879, 0, 0, 0, 1, 1,
-0.008093228, 0.06934538, -0.6637074, 0, 0, 0, 1, 1,
-0.003885616, 0.6689952, 0.6816452, 0, 0, 0, 1, 1,
-0.002820434, 0.370769, -0.3684651, 1, 1, 1, 1, 1,
-0.001408314, 1.627911, -0.7627838, 1, 1, 1, 1, 1,
0.0001265043, 1.036227, -0.3193695, 1, 1, 1, 1, 1,
0.0007356699, 0.1207093, -0.2340061, 1, 1, 1, 1, 1,
0.001962052, -0.3243441, 3.386284, 1, 1, 1, 1, 1,
0.003170288, -0.09745565, 2.386574, 1, 1, 1, 1, 1,
0.003955816, 0.4656285, -0.2240277, 1, 1, 1, 1, 1,
0.005665292, -0.7647414, 4.163014, 1, 1, 1, 1, 1,
0.007379371, -0.5537271, 4.796479, 1, 1, 1, 1, 1,
0.01063717, -1.654898, 2.682462, 1, 1, 1, 1, 1,
0.01171972, -1.238035, 3.932834, 1, 1, 1, 1, 1,
0.01262089, 0.7073359, 0.5261317, 1, 1, 1, 1, 1,
0.01291499, 1.39317, -1.173458, 1, 1, 1, 1, 1,
0.01321042, 0.2096189, -0.7160696, 1, 1, 1, 1, 1,
0.01839454, 1.146054, 0.1273895, 1, 1, 1, 1, 1,
0.01895497, 0.8100513, -1.3095, 0, 0, 1, 1, 1,
0.02449501, -0.8233674, 2.93793, 1, 0, 0, 1, 1,
0.02586816, 1.994382, 3.341229, 1, 0, 0, 1, 1,
0.03527192, 0.2027063, 2.105116, 1, 0, 0, 1, 1,
0.03611967, -0.2394484, 1.529152, 1, 0, 0, 1, 1,
0.03795875, -0.5041007, 4.396904, 1, 0, 0, 1, 1,
0.04071335, 0.01249337, 0.5912663, 0, 0, 0, 1, 1,
0.04384436, 1.379028, -0.9764076, 0, 0, 0, 1, 1,
0.04469533, -1.129974, 2.99885, 0, 0, 0, 1, 1,
0.04587696, -1.046572, 6.081784, 0, 0, 0, 1, 1,
0.04632683, 0.5997834, 2.45698, 0, 0, 0, 1, 1,
0.0515593, 0.1232348, -0.6658263, 0, 0, 0, 1, 1,
0.05190749, 0.7136457, -1.51616, 0, 0, 0, 1, 1,
0.05455407, 1.116165, 0.6065638, 1, 1, 1, 1, 1,
0.05728336, -1.13465, 3.493515, 1, 1, 1, 1, 1,
0.05754245, 0.3878843, 1.98338, 1, 1, 1, 1, 1,
0.06226337, -0.1439538, 2.423626, 1, 1, 1, 1, 1,
0.06470095, 1.906252, -0.8712099, 1, 1, 1, 1, 1,
0.06921571, -1.996987, 1.28445, 1, 1, 1, 1, 1,
0.06955402, -0.4433239, 1.995764, 1, 1, 1, 1, 1,
0.07087112, -0.5011728, 2.300206, 1, 1, 1, 1, 1,
0.07200959, 0.8666385, -0.8609895, 1, 1, 1, 1, 1,
0.07336364, 1.066235, 0.912906, 1, 1, 1, 1, 1,
0.07370649, -0.2209319, 2.186396, 1, 1, 1, 1, 1,
0.07453087, -0.1827559, 4.841904, 1, 1, 1, 1, 1,
0.07574695, -1.769629, 4.312275, 1, 1, 1, 1, 1,
0.07994658, 1.303913, -0.2066285, 1, 1, 1, 1, 1,
0.08227701, 1.099686, 0.01699365, 1, 1, 1, 1, 1,
0.08487916, 0.3411083, -2.00021, 0, 0, 1, 1, 1,
0.08537635, 0.8206356, 0.5657966, 1, 0, 0, 1, 1,
0.08785633, 0.5470458, 0.8866796, 1, 0, 0, 1, 1,
0.08837333, -0.9951816, 3.037685, 1, 0, 0, 1, 1,
0.09232786, 1.785007, 0.02234584, 1, 0, 0, 1, 1,
0.0929324, -0.7577775, 2.883541, 1, 0, 0, 1, 1,
0.09332772, -0.8587254, 3.161062, 0, 0, 0, 1, 1,
0.09580538, 0.2182692, -0.1986122, 0, 0, 0, 1, 1,
0.0964926, 0.6064212, 0.9024693, 0, 0, 0, 1, 1,
0.09862048, -1.185364, 2.533728, 0, 0, 0, 1, 1,
0.1033884, 1.812692, 0.5550485, 0, 0, 0, 1, 1,
0.1051928, 0.05619568, 1.402422, 0, 0, 0, 1, 1,
0.1111695, -1.392286, 2.01563, 0, 0, 0, 1, 1,
0.1132835, -0.06770451, 2.846867, 1, 1, 1, 1, 1,
0.1140557, 0.7422961, -1.09712, 1, 1, 1, 1, 1,
0.116038, -0.5253029, 3.685301, 1, 1, 1, 1, 1,
0.1165623, -0.9399022, 2.301136, 1, 1, 1, 1, 1,
0.1171111, 0.8672622, 0.487079, 1, 1, 1, 1, 1,
0.1172169, -1.083078, 3.714411, 1, 1, 1, 1, 1,
0.1172245, 0.4115525, 1.280131, 1, 1, 1, 1, 1,
0.1176234, 0.9621027, 2.127186, 1, 1, 1, 1, 1,
0.1179734, 1.382098, 0.550012, 1, 1, 1, 1, 1,
0.1185138, -0.7821227, 5.03476, 1, 1, 1, 1, 1,
0.1190832, -0.5940437, 2.533046, 1, 1, 1, 1, 1,
0.1223243, -1.761868, 4.424809, 1, 1, 1, 1, 1,
0.1225969, -0.9117754, 3.807616, 1, 1, 1, 1, 1,
0.1241351, 0.4640209, 0.7575165, 1, 1, 1, 1, 1,
0.1344353, -0.9914116, 2.860451, 1, 1, 1, 1, 1,
0.137818, -0.7401501, 3.847218, 0, 0, 1, 1, 1,
0.1467967, -0.0918669, 3.016078, 1, 0, 0, 1, 1,
0.1470487, -0.4615931, 2.443685, 1, 0, 0, 1, 1,
0.152254, -0.3891149, 0.6505914, 1, 0, 0, 1, 1,
0.1552608, 0.2686362, 0.07479012, 1, 0, 0, 1, 1,
0.1577861, -0.303142, 2.097703, 1, 0, 0, 1, 1,
0.1612732, -0.4300746, 3.74521, 0, 0, 0, 1, 1,
0.1628597, -0.1497238, 1.405861, 0, 0, 0, 1, 1,
0.163712, 0.4529494, 0.4625868, 0, 0, 0, 1, 1,
0.166478, 0.5868788, -1.190969, 0, 0, 0, 1, 1,
0.1837592, 0.2313071, -0.2131895, 0, 0, 0, 1, 1,
0.1868785, -1.64482, 2.679814, 0, 0, 0, 1, 1,
0.1883412, 0.2859276, 1.580128, 0, 0, 0, 1, 1,
0.1920086, 0.8474464, 0.05507633, 1, 1, 1, 1, 1,
0.1923527, -0.368702, 0.7248487, 1, 1, 1, 1, 1,
0.1924899, -0.2358588, 3.367168, 1, 1, 1, 1, 1,
0.1942164, -0.237195, 2.738464, 1, 1, 1, 1, 1,
0.1943602, 1.641639, 0.2417715, 1, 1, 1, 1, 1,
0.1975603, 0.08933617, 0.6424366, 1, 1, 1, 1, 1,
0.2001378, -1.080545, 2.407865, 1, 1, 1, 1, 1,
0.2040433, 0.7174814, -0.1253153, 1, 1, 1, 1, 1,
0.2086139, -0.7060016, 1.660487, 1, 1, 1, 1, 1,
0.2091453, -0.221706, 2.13257, 1, 1, 1, 1, 1,
0.2115103, 1.369743, -0.9893606, 1, 1, 1, 1, 1,
0.2117847, 1.420777, 1.516845, 1, 1, 1, 1, 1,
0.21206, -0.3879874, 2.915151, 1, 1, 1, 1, 1,
0.2121102, 0.8244979, -0.311673, 1, 1, 1, 1, 1,
0.2158778, -1.035738, 2.170619, 1, 1, 1, 1, 1,
0.2164932, 0.6256689, 0.6341157, 0, 0, 1, 1, 1,
0.2168879, 0.1619086, 0.002257935, 1, 0, 0, 1, 1,
0.2186237, 0.4415761, -0.09339113, 1, 0, 0, 1, 1,
0.2186351, -0.628441, 2.499129, 1, 0, 0, 1, 1,
0.2216805, 0.6877208, 0.3701354, 1, 0, 0, 1, 1,
0.2223742, -0.7940893, 3.623649, 1, 0, 0, 1, 1,
0.2274102, 0.1780615, 1.482429, 0, 0, 0, 1, 1,
0.2276044, 2.500035, -0.9905959, 0, 0, 0, 1, 1,
0.2282973, 0.8847272, -0.1208866, 0, 0, 0, 1, 1,
0.2287191, 0.06246587, 2.075789, 0, 0, 0, 1, 1,
0.2289169, 0.6834615, -1.100648, 0, 0, 0, 1, 1,
0.2312504, 0.1346611, 0.7372726, 0, 0, 0, 1, 1,
0.2342745, -0.8073346, 5.218665, 0, 0, 0, 1, 1,
0.237371, -1.941633, 4.363335, 1, 1, 1, 1, 1,
0.2381732, 0.8462567, -1.340539, 1, 1, 1, 1, 1,
0.2402038, 1.770664, 0.0288844, 1, 1, 1, 1, 1,
0.2412684, 1.718935, -1.434013, 1, 1, 1, 1, 1,
0.2455615, -1.17796, 3.232989, 1, 1, 1, 1, 1,
0.2493336, -0.4867181, 1.372358, 1, 1, 1, 1, 1,
0.2574047, -0.8814566, 3.201449, 1, 1, 1, 1, 1,
0.2574207, -0.8781338, 1.067555, 1, 1, 1, 1, 1,
0.2597455, -1.100956, 4.041183, 1, 1, 1, 1, 1,
0.2604267, 1.068635, 0.2211188, 1, 1, 1, 1, 1,
0.2740617, 0.6389519, 1.349251, 1, 1, 1, 1, 1,
0.2743258, 0.18562, 1.511564, 1, 1, 1, 1, 1,
0.2820676, -0.1996455, 1.355918, 1, 1, 1, 1, 1,
0.285133, 1.924822, 2.346902, 1, 1, 1, 1, 1,
0.2883481, 0.9748784, 0.7019739, 1, 1, 1, 1, 1,
0.2902767, -1.398191, 5.664048, 0, 0, 1, 1, 1,
0.2975466, -1.587889, 4.467151, 1, 0, 0, 1, 1,
0.2991962, 1.821176, -1.63284, 1, 0, 0, 1, 1,
0.3020156, 0.04697813, 1.676216, 1, 0, 0, 1, 1,
0.3086653, -1.312052, 3.685055, 1, 0, 0, 1, 1,
0.3121022, -0.1984226, 2.557444, 1, 0, 0, 1, 1,
0.3226849, -0.2138212, 2.240585, 0, 0, 0, 1, 1,
0.3260011, 1.202682, 0.4704462, 0, 0, 0, 1, 1,
0.3260858, 1.17781, -0.7817578, 0, 0, 0, 1, 1,
0.3269232, -1.285827, 2.169226, 0, 0, 0, 1, 1,
0.3280191, -0.1664516, 3.101585, 0, 0, 0, 1, 1,
0.334088, 0.4138673, 3.968237, 0, 0, 0, 1, 1,
0.3359646, -0.04900549, 0.6608578, 0, 0, 0, 1, 1,
0.3364212, 0.5882009, -1.404296, 1, 1, 1, 1, 1,
0.3381435, -1.125228, 1.261434, 1, 1, 1, 1, 1,
0.3412825, -0.6378735, 2.040694, 1, 1, 1, 1, 1,
0.3417354, -1.648555, 3.220381, 1, 1, 1, 1, 1,
0.3440282, -0.06206111, 2.112533, 1, 1, 1, 1, 1,
0.3452868, 0.2609817, -0.1228357, 1, 1, 1, 1, 1,
0.3470156, -0.02099382, 2.267135, 1, 1, 1, 1, 1,
0.3497388, 1.745453, 0.3626672, 1, 1, 1, 1, 1,
0.3506075, -0.1196924, 1.612424, 1, 1, 1, 1, 1,
0.352319, -0.7793491, 2.139332, 1, 1, 1, 1, 1,
0.3528374, 0.3142312, -0.1105519, 1, 1, 1, 1, 1,
0.3594943, -0.08249807, 1.015252, 1, 1, 1, 1, 1,
0.3610903, 0.2911306, 1.41756, 1, 1, 1, 1, 1,
0.3622572, -0.5193568, 2.406818, 1, 1, 1, 1, 1,
0.3624312, 0.956215, 1.908482, 1, 1, 1, 1, 1,
0.3689096, -0.1323463, 0.5010212, 0, 0, 1, 1, 1,
0.3775825, -0.3438424, 2.073364, 1, 0, 0, 1, 1,
0.3779691, 1.716686, 0.02556759, 1, 0, 0, 1, 1,
0.3839232, -1.036834, 2.091128, 1, 0, 0, 1, 1,
0.3841744, 1.144016, 1.987623, 1, 0, 0, 1, 1,
0.3887728, -1.149588, 2.195583, 1, 0, 0, 1, 1,
0.3926017, 2.082572, -1.311605, 0, 0, 0, 1, 1,
0.394164, 0.7496166, 0.8332753, 0, 0, 0, 1, 1,
0.3958263, -0.6853409, 2.571655, 0, 0, 0, 1, 1,
0.3983802, 1.553118, 0.2555567, 0, 0, 0, 1, 1,
0.4020398, -0.1232301, 0.3379475, 0, 0, 0, 1, 1,
0.402104, -0.7753503, 1.863012, 0, 0, 0, 1, 1,
0.4027894, 0.5790243, 0.6663316, 0, 0, 0, 1, 1,
0.4105059, -0.5240835, 1.50898, 1, 1, 1, 1, 1,
0.4112418, 0.2120424, -0.3372381, 1, 1, 1, 1, 1,
0.4147741, 1.236157, -0.849336, 1, 1, 1, 1, 1,
0.4195875, 0.5573656, 0.9568014, 1, 1, 1, 1, 1,
0.4205776, 1.315499, 0.5430769, 1, 1, 1, 1, 1,
0.42167, 1.391695, -0.5378708, 1, 1, 1, 1, 1,
0.4238475, -0.0008470193, 2.829158, 1, 1, 1, 1, 1,
0.4275609, 0.6261425, -0.540549, 1, 1, 1, 1, 1,
0.4281677, -0.1467267, 2.259705, 1, 1, 1, 1, 1,
0.4287786, 0.2472866, 1.435391, 1, 1, 1, 1, 1,
0.4312241, 0.8103202, -0.07168831, 1, 1, 1, 1, 1,
0.433486, 0.3924956, 1.922097, 1, 1, 1, 1, 1,
0.4368125, -0.3484398, 3.31284, 1, 1, 1, 1, 1,
0.4386334, -0.9493709, 4.321866, 1, 1, 1, 1, 1,
0.440032, 0.8285885, 0.6719083, 1, 1, 1, 1, 1,
0.4403648, 1.06675, -0.31804, 0, 0, 1, 1, 1,
0.4413311, -0.0937243, 2.881775, 1, 0, 0, 1, 1,
0.4432641, 0.6674638, 1.576316, 1, 0, 0, 1, 1,
0.4493127, -1.752315, 3.906162, 1, 0, 0, 1, 1,
0.4505351, 0.1731305, 1.057128, 1, 0, 0, 1, 1,
0.4531679, 0.4622972, -1.028193, 1, 0, 0, 1, 1,
0.4582301, -0.4372608, 2.293879, 0, 0, 0, 1, 1,
0.462625, 0.3990965, 2.36007, 0, 0, 0, 1, 1,
0.4644282, 0.6733702, -0.2053405, 0, 0, 0, 1, 1,
0.4644609, -0.6485164, 1.615345, 0, 0, 0, 1, 1,
0.4680829, -1.098193, 5.43845, 0, 0, 0, 1, 1,
0.4692272, -0.03529152, 1.381843, 0, 0, 0, 1, 1,
0.4724078, -0.802036, 3.433253, 0, 0, 0, 1, 1,
0.4729032, -0.483991, 2.549541, 1, 1, 1, 1, 1,
0.4776972, 1.072936, 0.9008241, 1, 1, 1, 1, 1,
0.4830148, -0.8351476, 3.398227, 1, 1, 1, 1, 1,
0.4877973, -2.293303, 3.216489, 1, 1, 1, 1, 1,
0.4976687, 1.564987, -0.1103284, 1, 1, 1, 1, 1,
0.5008723, 0.9621696, -0.752876, 1, 1, 1, 1, 1,
0.5024092, 0.397847, 1.621288, 1, 1, 1, 1, 1,
0.5144241, -0.7529432, 3.684279, 1, 1, 1, 1, 1,
0.5155308, 1.168079, 1.102046, 1, 1, 1, 1, 1,
0.5185708, -1.186403, 4.082491, 1, 1, 1, 1, 1,
0.5204124, 0.4388213, -0.4505272, 1, 1, 1, 1, 1,
0.5204508, -0.3627205, 3.382235, 1, 1, 1, 1, 1,
0.521341, 1.461547, -0.1512542, 1, 1, 1, 1, 1,
0.5217209, -0.6355336, 3.261231, 1, 1, 1, 1, 1,
0.5221452, -0.7242911, 3.11869, 1, 1, 1, 1, 1,
0.524675, 0.08445272, 2.182061, 0, 0, 1, 1, 1,
0.5260398, -0.7328471, 3.543808, 1, 0, 0, 1, 1,
0.5295093, -0.6904604, 2.651735, 1, 0, 0, 1, 1,
0.5322049, 1.016131, -0.7557031, 1, 0, 0, 1, 1,
0.5365872, 1.094271, 0.02151196, 1, 0, 0, 1, 1,
0.5378133, 0.6716745, 1.366922, 1, 0, 0, 1, 1,
0.5392496, 0.6476578, 0.6146144, 0, 0, 0, 1, 1,
0.5405833, 2.144588, 1.814138, 0, 0, 0, 1, 1,
0.540738, -0.8582086, 2.337329, 0, 0, 0, 1, 1,
0.5475041, -1.613977, 1.293248, 0, 0, 0, 1, 1,
0.5498475, 1.665742, -1.722067, 0, 0, 0, 1, 1,
0.5508541, -0.08767072, 2.056568, 0, 0, 0, 1, 1,
0.5553993, 0.4055258, 0.5243437, 0, 0, 0, 1, 1,
0.5559047, 2.236756, -0.8304019, 1, 1, 1, 1, 1,
0.5591338, 0.286142, 1.123004, 1, 1, 1, 1, 1,
0.5598133, -0.4440406, 2.579298, 1, 1, 1, 1, 1,
0.5639574, 2.088303, 1.77016, 1, 1, 1, 1, 1,
0.5674042, -0.3612711, 2.147075, 1, 1, 1, 1, 1,
0.5675143, -0.958752, 2.873479, 1, 1, 1, 1, 1,
0.5681514, 0.3137295, 2.118508, 1, 1, 1, 1, 1,
0.5744305, 0.5658329, 2.301385, 1, 1, 1, 1, 1,
0.5806041, 1.300722, 1.5767, 1, 1, 1, 1, 1,
0.5847235, -0.1247367, 3.432893, 1, 1, 1, 1, 1,
0.5857219, 0.7968419, 0.5072044, 1, 1, 1, 1, 1,
0.5889307, 1.201061, -1.021721, 1, 1, 1, 1, 1,
0.5903742, -1.783033, 3.000068, 1, 1, 1, 1, 1,
0.5903947, -0.2068725, 2.146856, 1, 1, 1, 1, 1,
0.5933348, 0.4710112, 0.8631352, 1, 1, 1, 1, 1,
0.5948189, -1.028698, 2.244954, 0, 0, 1, 1, 1,
0.5992051, 1.347363, 0.297527, 1, 0, 0, 1, 1,
0.6004474, -0.2685912, 2.013281, 1, 0, 0, 1, 1,
0.6013643, 1.586963, 2.830188, 1, 0, 0, 1, 1,
0.6023157, 0.09162363, 1.73549, 1, 0, 0, 1, 1,
0.6034309, 0.6155866, 0.9124283, 1, 0, 0, 1, 1,
0.6073698, -0.1154709, 1.945032, 0, 0, 0, 1, 1,
0.6085, -1.321724, 5.173347, 0, 0, 0, 1, 1,
0.6170564, 0.2867862, 1.123993, 0, 0, 0, 1, 1,
0.6195921, -1.22224, 2.851949, 0, 0, 0, 1, 1,
0.6208637, -0.8669099, 2.134497, 0, 0, 0, 1, 1,
0.6211216, 0.232758, -0.3359808, 0, 0, 0, 1, 1,
0.6222828, -0.4800437, 2.004809, 0, 0, 0, 1, 1,
0.6227192, 0.6538017, 0.3060195, 1, 1, 1, 1, 1,
0.6234068, -0.05991885, 2.173045, 1, 1, 1, 1, 1,
0.6235363, 0.09941664, 1.365539, 1, 1, 1, 1, 1,
0.6238432, -0.01177279, 1.330058, 1, 1, 1, 1, 1,
0.6302394, -0.1383514, 1.052466, 1, 1, 1, 1, 1,
0.6304833, -1.507621, 2.825073, 1, 1, 1, 1, 1,
0.6325228, -0.6296757, 1.680371, 1, 1, 1, 1, 1,
0.6355431, 0.05644921, 1.823968, 1, 1, 1, 1, 1,
0.6388708, 0.7479116, 1.162533, 1, 1, 1, 1, 1,
0.6408418, 1.756791, -1.095268, 1, 1, 1, 1, 1,
0.6410588, 0.05529433, 1.820582, 1, 1, 1, 1, 1,
0.6418434, 0.5724583, 3.241504, 1, 1, 1, 1, 1,
0.6469791, 0.251039, 2.430304, 1, 1, 1, 1, 1,
0.6472435, 0.6164259, 1.159971, 1, 1, 1, 1, 1,
0.6574659, 0.1229394, 0.6992716, 1, 1, 1, 1, 1,
0.6582439, -0.9669254, 1.607162, 0, 0, 1, 1, 1,
0.6668839, 0.6748874, 1.807031, 1, 0, 0, 1, 1,
0.6708483, -0.1640192, 1.075524, 1, 0, 0, 1, 1,
0.6711695, -0.07942485, 1.277226, 1, 0, 0, 1, 1,
0.672612, 1.06823, 0.27902, 1, 0, 0, 1, 1,
0.6752577, -2.201979, 2.422077, 1, 0, 0, 1, 1,
0.6773697, 0.3895379, 1.141354, 0, 0, 0, 1, 1,
0.6774086, 1.594648, -0.622196, 0, 0, 0, 1, 1,
0.689181, -1.122877, 3.722369, 0, 0, 0, 1, 1,
0.6986673, -1.344905, 2.224288, 0, 0, 0, 1, 1,
0.7008332, -0.2663344, 1.221504, 0, 0, 0, 1, 1,
0.7015343, -0.1305538, 3.127289, 0, 0, 0, 1, 1,
0.7052664, 0.4993543, 0.9803348, 0, 0, 0, 1, 1,
0.7076425, 0.1065789, 1.689387, 1, 1, 1, 1, 1,
0.7082671, 0.2757528, 0.2597817, 1, 1, 1, 1, 1,
0.7154914, -0.1871942, -0.7552373, 1, 1, 1, 1, 1,
0.7163612, -1.269192, 3.262688, 1, 1, 1, 1, 1,
0.7197255, 1.008904, -1.445046, 1, 1, 1, 1, 1,
0.7215346, 1.713422, 0.1756018, 1, 1, 1, 1, 1,
0.7239747, -0.2953881, 3.117315, 1, 1, 1, 1, 1,
0.7269186, -0.09921058, 2.665655, 1, 1, 1, 1, 1,
0.7316342, 0.4021042, -0.1381378, 1, 1, 1, 1, 1,
0.7332586, -0.7591321, 0.8331437, 1, 1, 1, 1, 1,
0.7356725, -1.379375, 1.989432, 1, 1, 1, 1, 1,
0.741633, 0.3882334, 2.356201, 1, 1, 1, 1, 1,
0.7426406, -0.3874581, 1.729261, 1, 1, 1, 1, 1,
0.7436995, 0.7036635, 2.150299, 1, 1, 1, 1, 1,
0.7443239, -1.802952, 3.103997, 1, 1, 1, 1, 1,
0.7446357, 0.9642013, 0.6376732, 0, 0, 1, 1, 1,
0.7455912, -0.2580537, 2.853738, 1, 0, 0, 1, 1,
0.7479263, 1.635823, 1.916771, 1, 0, 0, 1, 1,
0.7486444, 0.1751616, -0.4158902, 1, 0, 0, 1, 1,
0.7489063, 1.335862, 2.587671, 1, 0, 0, 1, 1,
0.7566732, 0.7009304, -0.6390772, 1, 0, 0, 1, 1,
0.7573367, -0.2251113, 1.85449, 0, 0, 0, 1, 1,
0.7579677, 0.02031752, 1.466582, 0, 0, 0, 1, 1,
0.760596, 0.6691589, -0.6754041, 0, 0, 0, 1, 1,
0.7645856, -0.6633917, 3.482836, 0, 0, 0, 1, 1,
0.7652028, -0.7121691, 1.516879, 0, 0, 0, 1, 1,
0.7674438, -1.860847, 2.739274, 0, 0, 0, 1, 1,
0.7772316, 1.294495, 0.04054156, 0, 0, 0, 1, 1,
0.7819031, 1.058804, -0.04483302, 1, 1, 1, 1, 1,
0.7892859, -1.106088, 1.470633, 1, 1, 1, 1, 1,
0.7953961, 0.7261432, 1.622582, 1, 1, 1, 1, 1,
0.80204, -0.9175825, 1.928519, 1, 1, 1, 1, 1,
0.8036155, 1.193346, 1.822748, 1, 1, 1, 1, 1,
0.8052025, -0.3841458, 0.1974425, 1, 1, 1, 1, 1,
0.809979, 0.4899365, 2.400941, 1, 1, 1, 1, 1,
0.8327012, -0.3989004, 0.7771423, 1, 1, 1, 1, 1,
0.8335558, -0.7370636, 0.7233467, 1, 1, 1, 1, 1,
0.8353371, 1.171701, 0.1955099, 1, 1, 1, 1, 1,
0.8380679, 0.6410967, 1.861138, 1, 1, 1, 1, 1,
0.8394326, -0.2635301, 2.638088, 1, 1, 1, 1, 1,
0.8427096, -0.08451945, 2.651911, 1, 1, 1, 1, 1,
0.8470676, 1.458876, 0.04243219, 1, 1, 1, 1, 1,
0.8496566, 1.294037, 0.444722, 1, 1, 1, 1, 1,
0.8496821, -0.5225162, 2.535302, 0, 0, 1, 1, 1,
0.8530229, 0.3050847, 1.049512, 1, 0, 0, 1, 1,
0.8563286, -0.286971, 1.712061, 1, 0, 0, 1, 1,
0.8563969, 0.6210632, 1.672548, 1, 0, 0, 1, 1,
0.8619615, 0.02540324, 1.359905, 1, 0, 0, 1, 1,
0.8637289, 0.107782, -0.08837425, 1, 0, 0, 1, 1,
0.8664888, -0.0936722, 1.541331, 0, 0, 0, 1, 1,
0.8721539, -0.3003856, 0.8326827, 0, 0, 0, 1, 1,
0.8758386, -0.2270787, 1.825885, 0, 0, 0, 1, 1,
0.8806863, -0.9959934, 0.4986781, 0, 0, 0, 1, 1,
0.8862993, 1.050703, 0.2807339, 0, 0, 0, 1, 1,
0.8878067, 0.5552838, -0.8906902, 0, 0, 0, 1, 1,
0.8932587, -1.211825, 1.559885, 0, 0, 0, 1, 1,
0.8999792, -0.09513228, 2.628052, 1, 1, 1, 1, 1,
0.9026969, 1.941098, -0.7922598, 1, 1, 1, 1, 1,
0.9083155, -0.2721903, 1.47054, 1, 1, 1, 1, 1,
0.9104708, -0.2272553, 0.8944703, 1, 1, 1, 1, 1,
0.9186847, 0.1031521, 3.967841, 1, 1, 1, 1, 1,
0.9187557, -0.3428603, 1.194396, 1, 1, 1, 1, 1,
0.9190162, 0.8024478, 0.6081305, 1, 1, 1, 1, 1,
0.9239604, 0.3944719, 2.54124, 1, 1, 1, 1, 1,
0.9322406, 1.341684, -0.7772486, 1, 1, 1, 1, 1,
0.9509587, -1.053865, 3.091507, 1, 1, 1, 1, 1,
0.9524805, -0.03813095, -0.3630354, 1, 1, 1, 1, 1,
0.9703032, -1.06544, 0.6486923, 1, 1, 1, 1, 1,
0.9766677, -0.6057404, 2.478829, 1, 1, 1, 1, 1,
0.9798655, -1.901987, 3.387432, 1, 1, 1, 1, 1,
0.9817076, -0.04753466, 1.949988, 1, 1, 1, 1, 1,
0.9861175, -0.1137095, 3.053994, 0, 0, 1, 1, 1,
0.9862862, 1.107967, 1.004922, 1, 0, 0, 1, 1,
0.988996, -0.2272328, 1.497724, 1, 0, 0, 1, 1,
0.9901817, 0.4717709, 0.8550143, 1, 0, 0, 1, 1,
0.9906496, 0.2685057, 3.248296, 1, 0, 0, 1, 1,
0.9907455, -0.691462, 1.302174, 1, 0, 0, 1, 1,
0.9908186, -0.2702491, 3.333716, 0, 0, 0, 1, 1,
0.9927295, 0.4333788, 1.195745, 0, 0, 0, 1, 1,
0.9967009, -1.440455, 2.68275, 0, 0, 0, 1, 1,
1.007814, -0.7791305, 3.418637, 0, 0, 0, 1, 1,
1.008032, -0.4816452, 2.658529, 0, 0, 0, 1, 1,
1.013183, 1.800427, 2.213904, 0, 0, 0, 1, 1,
1.01835, 0.950431, 0.6032717, 0, 0, 0, 1, 1,
1.018986, -0.3130288, 1.722966, 1, 1, 1, 1, 1,
1.020357, 1.464459, -1.611088, 1, 1, 1, 1, 1,
1.023033, 0.01158962, 0.8301244, 1, 1, 1, 1, 1,
1.02635, 1.247735, 1.252003, 1, 1, 1, 1, 1,
1.029561, 0.2850049, 1.38754, 1, 1, 1, 1, 1,
1.029741, 1.003773, 0.4290574, 1, 1, 1, 1, 1,
1.036293, -0.6869383, 1.620026, 1, 1, 1, 1, 1,
1.049276, 0.2188421, 2.251436, 1, 1, 1, 1, 1,
1.054317, -0.2539369, 1.399429, 1, 1, 1, 1, 1,
1.054935, 1.263978, 1.169763, 1, 1, 1, 1, 1,
1.059711, -0.1901743, 1.636579, 1, 1, 1, 1, 1,
1.064203, -0.6133976, 2.201255, 1, 1, 1, 1, 1,
1.064318, -0.8718748, 3.173837, 1, 1, 1, 1, 1,
1.068137, 0.79511, 0.7996954, 1, 1, 1, 1, 1,
1.070681, -0.4871982, 0.5331744, 1, 1, 1, 1, 1,
1.080858, 0.3636402, 2.243576, 0, 0, 1, 1, 1,
1.081442, -2.177941, 2.819912, 1, 0, 0, 1, 1,
1.09423, 0.6814556, 0.04989581, 1, 0, 0, 1, 1,
1.099609, -0.07695827, 1.488374, 1, 0, 0, 1, 1,
1.104846, 2.091794, 2.65113, 1, 0, 0, 1, 1,
1.105661, 0.5298482, 0.8876094, 1, 0, 0, 1, 1,
1.110401, 0.4555803, -0.03077241, 0, 0, 0, 1, 1,
1.120814, -0.3286927, 3.518307, 0, 0, 0, 1, 1,
1.125335, -0.3927269, 0.9924691, 0, 0, 0, 1, 1,
1.132613, -1.286631, 3.675673, 0, 0, 0, 1, 1,
1.132702, 0.5887506, 0.8415077, 0, 0, 0, 1, 1,
1.136726, -0.4805616, 2.922095, 0, 0, 0, 1, 1,
1.143535, -0.774181, 1.976759, 0, 0, 0, 1, 1,
1.143574, -0.1456155, 2.668573, 1, 1, 1, 1, 1,
1.145274, -2.209208, 1.558551, 1, 1, 1, 1, 1,
1.147305, 0.04409003, 1.415757, 1, 1, 1, 1, 1,
1.15069, 0.3226616, 2.295398, 1, 1, 1, 1, 1,
1.150894, -0.1401155, 1.370326, 1, 1, 1, 1, 1,
1.152531, 1.225878, 0.3253323, 1, 1, 1, 1, 1,
1.156612, -0.3163734, 0.5673587, 1, 1, 1, 1, 1,
1.156845, -0.9367385, 2.961989, 1, 1, 1, 1, 1,
1.163659, 0.3276723, 1.746229, 1, 1, 1, 1, 1,
1.172939, -0.4193244, 1.535327, 1, 1, 1, 1, 1,
1.178151, 1.760695, 1.989941, 1, 1, 1, 1, 1,
1.178518, 0.3819237, 0.524463, 1, 1, 1, 1, 1,
1.185811, -0.4493955, 2.235159, 1, 1, 1, 1, 1,
1.191582, -0.3629088, 2.584413, 1, 1, 1, 1, 1,
1.199853, 0.8679538, 2.406008, 1, 1, 1, 1, 1,
1.201693, 0.0990987, 1.408789, 0, 0, 1, 1, 1,
1.207644, -0.3313277, 2.265527, 1, 0, 0, 1, 1,
1.212251, 0.5036517, 0.2931493, 1, 0, 0, 1, 1,
1.219731, 1.083329, -0.7536782, 1, 0, 0, 1, 1,
1.222861, -1.201022, 3.329515, 1, 0, 0, 1, 1,
1.223072, 0.277547, 0.5625287, 1, 0, 0, 1, 1,
1.239107, -0.3169728, 2.384097, 0, 0, 0, 1, 1,
1.244103, 0.3890822, 2.586972, 0, 0, 0, 1, 1,
1.248923, -0.4050238, 2.056345, 0, 0, 0, 1, 1,
1.26705, 0.4633502, 1.826887, 0, 0, 0, 1, 1,
1.27053, 0.9676217, 0.2344295, 0, 0, 0, 1, 1,
1.271539, -0.73943, 1.471306, 0, 0, 0, 1, 1,
1.278784, -0.4882801, 0.6999064, 0, 0, 0, 1, 1,
1.291146, 1.244243, -0.4974031, 1, 1, 1, 1, 1,
1.305381, 0.6210948, 1.287132, 1, 1, 1, 1, 1,
1.309867, 2.331826, 0.6774026, 1, 1, 1, 1, 1,
1.310582, -0.310926, 1.856713, 1, 1, 1, 1, 1,
1.321155, -0.160833, 2.216257, 1, 1, 1, 1, 1,
1.3244, 0.1463702, 1.430333, 1, 1, 1, 1, 1,
1.344933, 1.082244, -0.1535981, 1, 1, 1, 1, 1,
1.368563, 0.813437, 0.5797243, 1, 1, 1, 1, 1,
1.374683, -1.002014, 2.031644, 1, 1, 1, 1, 1,
1.389229, 0.8323838, 1.867905, 1, 1, 1, 1, 1,
1.393995, -0.4116978, 1.062775, 1, 1, 1, 1, 1,
1.405488, 0.2285436, 2.454499, 1, 1, 1, 1, 1,
1.405674, -1.188834, 1.163355, 1, 1, 1, 1, 1,
1.409134, -0.7672976, 1.636629, 1, 1, 1, 1, 1,
1.417824, -0.1219693, 2.820213, 1, 1, 1, 1, 1,
1.424909, -0.002836342, 1.568174, 0, 0, 1, 1, 1,
1.442738, 1.377228, 1.404037, 1, 0, 0, 1, 1,
1.456235, -0.8941047, 2.206081, 1, 0, 0, 1, 1,
1.473711, -3.3413, 3.853418, 1, 0, 0, 1, 1,
1.473948, -1.312056, 3.997261, 1, 0, 0, 1, 1,
1.488428, -0.09407194, 1.459645, 1, 0, 0, 1, 1,
1.493987, -0.1483754, 3.006486, 0, 0, 0, 1, 1,
1.503646, 0.6253608, -0.1135138, 0, 0, 0, 1, 1,
1.510859, -1.045776, 1.881118, 0, 0, 0, 1, 1,
1.518587, 0.5820506, 0.1617664, 0, 0, 0, 1, 1,
1.532984, 1.462667, 0.1470774, 0, 0, 0, 1, 1,
1.538068, -0.7637288, 3.666692, 0, 0, 0, 1, 1,
1.550816, 1.355765, -0.8139589, 0, 0, 0, 1, 1,
1.551591, -1.003753, 2.66832, 1, 1, 1, 1, 1,
1.555902, 1.766398, 0.9573048, 1, 1, 1, 1, 1,
1.557002, -0.02049346, 4.029468, 1, 1, 1, 1, 1,
1.563133, 1.307595, -0.07902534, 1, 1, 1, 1, 1,
1.564002, 1.307625, 0.07192405, 1, 1, 1, 1, 1,
1.567854, -0.2127857, 2.539208, 1, 1, 1, 1, 1,
1.588309, -0.7221876, 0.8694743, 1, 1, 1, 1, 1,
1.591975, -0.5952785, 1.227393, 1, 1, 1, 1, 1,
1.611017, 1.353626, 0.9489526, 1, 1, 1, 1, 1,
1.616448, -1.514729, 1.221931, 1, 1, 1, 1, 1,
1.619648, -0.1915465, 3.260918, 1, 1, 1, 1, 1,
1.625605, -2.686777, 2.02039, 1, 1, 1, 1, 1,
1.672418, 0.06976327, 2.008539, 1, 1, 1, 1, 1,
1.703144, -2.435438, 1.971319, 1, 1, 1, 1, 1,
1.734793, -1.402297, 2.818325, 1, 1, 1, 1, 1,
1.734904, -0.9845387, 1.592422, 0, 0, 1, 1, 1,
1.736139, 0.4644729, 1.852268, 1, 0, 0, 1, 1,
1.756067, -0.3105378, 1.125275, 1, 0, 0, 1, 1,
1.75624, 0.3116329, 2.841063, 1, 0, 0, 1, 1,
1.764383, 0.2529109, 0.05615316, 1, 0, 0, 1, 1,
1.767122, 0.1482054, 1.603931, 1, 0, 0, 1, 1,
1.776804, -0.1971315, 1.274585, 0, 0, 0, 1, 1,
1.784414, 0.2480175, 0.2567129, 0, 0, 0, 1, 1,
1.813767, 0.271497, 0.4321729, 0, 0, 0, 1, 1,
1.816438, 1.567001, 2.000773, 0, 0, 0, 1, 1,
1.82949, -0.6067665, 2.835715, 0, 0, 0, 1, 1,
1.835068, -0.724941, 4.218828, 0, 0, 0, 1, 1,
1.866162, 0.348779, 1.426612, 0, 0, 0, 1, 1,
1.877508, -0.04414847, 0.1676929, 1, 1, 1, 1, 1,
1.892034, -1.267308, 2.331643, 1, 1, 1, 1, 1,
1.90844, -1.676227, 0.4237872, 1, 1, 1, 1, 1,
1.927062, -0.09664893, 2.358858, 1, 1, 1, 1, 1,
1.927261, -0.4280631, 0.5899973, 1, 1, 1, 1, 1,
1.95448, 1.325129, 3.675965, 1, 1, 1, 1, 1,
1.965013, -0.8065249, 4.327677, 1, 1, 1, 1, 1,
1.96877, -0.8738208, 2.95168, 1, 1, 1, 1, 1,
2.001384, -0.5902342, 2.60449, 1, 1, 1, 1, 1,
2.010275, 0.7930261, 0.6050833, 1, 1, 1, 1, 1,
2.045225, -0.101932, 0.3756185, 1, 1, 1, 1, 1,
2.061305, 0.9994959, 0.7796554, 1, 1, 1, 1, 1,
2.098443, -0.07910458, 2.587516, 1, 1, 1, 1, 1,
2.103172, 0.8392001, 1.601097, 1, 1, 1, 1, 1,
2.155969, -1.636718, 1.727623, 1, 1, 1, 1, 1,
2.165595, 1.395225, 1.973988, 0, 0, 1, 1, 1,
2.239596, 0.2121913, 1.135792, 1, 0, 0, 1, 1,
2.27253, -0.6384789, 1.880001, 1, 0, 0, 1, 1,
2.279074, -1.003631, 1.489514, 1, 0, 0, 1, 1,
2.287027, 0.3920209, 1.443926, 1, 0, 0, 1, 1,
2.31597, 1.716763, 1.155836, 1, 0, 0, 1, 1,
2.329372, -0.2775741, 1.819465, 0, 0, 0, 1, 1,
2.338994, -0.2123443, 2.508984, 0, 0, 0, 1, 1,
2.362618, -0.5944631, 1.120433, 0, 0, 0, 1, 1,
2.382489, 0.3868115, 0.6700038, 0, 0, 0, 1, 1,
2.431197, -0.4024406, 2.007973, 0, 0, 0, 1, 1,
2.470592, 1.691589, 2.357244, 0, 0, 0, 1, 1,
2.473409, -1.288251, 1.640543, 0, 0, 0, 1, 1,
2.481362, -0.4336619, 1.584127, 1, 1, 1, 1, 1,
2.498682, 1.203167, 0.9209056, 1, 1, 1, 1, 1,
2.747709, 1.396579, 0.6098482, 1, 1, 1, 1, 1,
2.750504, -1.526546, 1.089045, 1, 1, 1, 1, 1,
2.75601, -0.3655024, 2.046826, 1, 1, 1, 1, 1,
2.760484, 0.4944315, 2.407274, 1, 1, 1, 1, 1,
3.04308, -1.376006, 2.396507, 1, 1, 1, 1, 1
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
var radius = 9.41786;
var distance = 33.07983;
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
mvMatrix.translate( -0.05430996, 0.2681885, -0.6941369 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.07983);
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
