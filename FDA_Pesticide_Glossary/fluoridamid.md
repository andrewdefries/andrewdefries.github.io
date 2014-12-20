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
-2.756059, 0.9923992, -1.230714, 1, 0, 0, 1,
-2.729123, 1.179847, -0.6198258, 1, 0.007843138, 0, 1,
-2.651065, 0.1927229, -2.433008, 1, 0.01176471, 0, 1,
-2.643697, 0.7291838, -1.220667, 1, 0.01960784, 0, 1,
-2.566028, -0.212107, -1.058541, 1, 0.02352941, 0, 1,
-2.44033, 1.326939, -0.05511067, 1, 0.03137255, 0, 1,
-2.383117, 1.526732, -1.888993, 1, 0.03529412, 0, 1,
-2.310724, 0.1253046, -0.9680913, 1, 0.04313726, 0, 1,
-2.300212, 0.3940873, -2.699179, 1, 0.04705882, 0, 1,
-2.234593, -0.3227224, -2.138235, 1, 0.05490196, 0, 1,
-2.22318, -0.3090854, -0.6701487, 1, 0.05882353, 0, 1,
-2.138178, 0.7328969, -0.8189601, 1, 0.06666667, 0, 1,
-2.105924, 0.1565548, -2.314914, 1, 0.07058824, 0, 1,
-2.100511, 0.2863905, -1.922081, 1, 0.07843138, 0, 1,
-2.046408, -1.433365, -2.933201, 1, 0.08235294, 0, 1,
-2.002949, 1.612905, -0.9474417, 1, 0.09019608, 0, 1,
-1.995411, 0.5499567, -1.025542, 1, 0.09411765, 0, 1,
-1.977831, -0.4347396, -1.985259, 1, 0.1019608, 0, 1,
-1.957719, 1.723117, -0.7361587, 1, 0.1098039, 0, 1,
-1.943324, -0.963089, -1.828829, 1, 0.1137255, 0, 1,
-1.939759, -0.5772644, -2.468765, 1, 0.1215686, 0, 1,
-1.927082, -1.625531, -2.048573, 1, 0.1254902, 0, 1,
-1.920231, -0.5851804, -1.097838, 1, 0.1333333, 0, 1,
-1.918291, 0.2658313, -0.8293355, 1, 0.1372549, 0, 1,
-1.886894, 1.123717, -2.024038, 1, 0.145098, 0, 1,
-1.886376, -1.54578, -2.980361, 1, 0.1490196, 0, 1,
-1.875336, -0.2286935, -2.68176, 1, 0.1568628, 0, 1,
-1.869321, -0.8739529, -1.69608, 1, 0.1607843, 0, 1,
-1.836143, 0.7179849, 3.411021, 1, 0.1686275, 0, 1,
-1.814457, 0.4741809, -1.238738, 1, 0.172549, 0, 1,
-1.811589, -0.6165218, -1.780924, 1, 0.1803922, 0, 1,
-1.800939, 0.7525535, 0.06426643, 1, 0.1843137, 0, 1,
-1.793995, 0.6349626, -0.9996068, 1, 0.1921569, 0, 1,
-1.788148, 0.2152977, -2.561157, 1, 0.1960784, 0, 1,
-1.777402, 0.9418185, -2.09089, 1, 0.2039216, 0, 1,
-1.771303, -1.323571, -3.087509, 1, 0.2117647, 0, 1,
-1.74805, 0.04037993, -0.5499809, 1, 0.2156863, 0, 1,
-1.739754, 0.3445047, -2.4914, 1, 0.2235294, 0, 1,
-1.71863, -0.02506394, -2.452724, 1, 0.227451, 0, 1,
-1.716979, -0.6409122, -3.613338, 1, 0.2352941, 0, 1,
-1.709318, -0.836849, -2.067348, 1, 0.2392157, 0, 1,
-1.693169, -1.007052, -1.958103, 1, 0.2470588, 0, 1,
-1.688972, 1.111492, -1.554669, 1, 0.2509804, 0, 1,
-1.682492, 0.5340235, -0.7231762, 1, 0.2588235, 0, 1,
-1.668939, -0.6956121, -3.058691, 1, 0.2627451, 0, 1,
-1.666801, 1.688253, -1.044709, 1, 0.2705882, 0, 1,
-1.651639, 0.2389213, -2.065661, 1, 0.2745098, 0, 1,
-1.617473, -0.523159, -3.840391, 1, 0.282353, 0, 1,
-1.616444, -0.9683601, -3.311716, 1, 0.2862745, 0, 1,
-1.616228, 0.816342, 0.07508405, 1, 0.2941177, 0, 1,
-1.611087, -2.61452, -4.130484, 1, 0.3019608, 0, 1,
-1.609205, -0.3568434, -1.49615, 1, 0.3058824, 0, 1,
-1.5889, -0.1768496, -1.791314, 1, 0.3137255, 0, 1,
-1.587478, -1.591537, -1.121706, 1, 0.3176471, 0, 1,
-1.581732, 1.810941, 0.8837016, 1, 0.3254902, 0, 1,
-1.577265, -0.952003, -1.894109, 1, 0.3294118, 0, 1,
-1.571554, 0.8655254, -0.7121678, 1, 0.3372549, 0, 1,
-1.565768, -1.216971, -0.4562977, 1, 0.3411765, 0, 1,
-1.554579, 0.3595193, -1.488134, 1, 0.3490196, 0, 1,
-1.541694, 1.105359, -1.33996, 1, 0.3529412, 0, 1,
-1.540586, 0.09838997, -1.816293, 1, 0.3607843, 0, 1,
-1.538969, -0.498532, -4.401194, 1, 0.3647059, 0, 1,
-1.530371, 1.844206, -1.212137, 1, 0.372549, 0, 1,
-1.51915, -0.99819, -3.418904, 1, 0.3764706, 0, 1,
-1.51443, 0.5439277, -2.488435, 1, 0.3843137, 0, 1,
-1.512271, 1.361248, -1.839871, 1, 0.3882353, 0, 1,
-1.49777, -0.4815387, -2.194353, 1, 0.3960784, 0, 1,
-1.494971, -0.9185448, -1.247201, 1, 0.4039216, 0, 1,
-1.488538, -2.314731, -4.117144, 1, 0.4078431, 0, 1,
-1.483201, -0.4703418, -1.913247, 1, 0.4156863, 0, 1,
-1.482893, -1.153506, -0.5345839, 1, 0.4196078, 0, 1,
-1.479027, -0.5518225, -2.251628, 1, 0.427451, 0, 1,
-1.476484, -0.414966, -2.678296, 1, 0.4313726, 0, 1,
-1.476223, -0.3124755, -2.055418, 1, 0.4392157, 0, 1,
-1.474783, 0.3368434, -1.620148, 1, 0.4431373, 0, 1,
-1.46539, 1.536733, -1.73036, 1, 0.4509804, 0, 1,
-1.464302, -1.01184, -2.783284, 1, 0.454902, 0, 1,
-1.461305, -1.350881, -1.873583, 1, 0.4627451, 0, 1,
-1.450654, -2.003164, -2.176391, 1, 0.4666667, 0, 1,
-1.442633, 1.521304, 1.79221, 1, 0.4745098, 0, 1,
-1.440062, 0.6761241, -1.581082, 1, 0.4784314, 0, 1,
-1.426297, -1.74103, -2.184789, 1, 0.4862745, 0, 1,
-1.418929, 0.4564336, 0.07367917, 1, 0.4901961, 0, 1,
-1.412986, 0.1203036, -2.566077, 1, 0.4980392, 0, 1,
-1.410106, 1.920657, 1.351033, 1, 0.5058824, 0, 1,
-1.408762, -0.1051987, -1.595844, 1, 0.509804, 0, 1,
-1.401391, 0.1789891, -3.380607, 1, 0.5176471, 0, 1,
-1.397969, 0.3625774, -3.265275, 1, 0.5215687, 0, 1,
-1.396787, -0.1847201, -0.9452436, 1, 0.5294118, 0, 1,
-1.39444, -1.036671, -3.024662, 1, 0.5333334, 0, 1,
-1.390754, 0.0259882, -0.1376776, 1, 0.5411765, 0, 1,
-1.383935, 0.223705, -0.8691378, 1, 0.5450981, 0, 1,
-1.381072, 0.4813091, -2.119114, 1, 0.5529412, 0, 1,
-1.374283, -0.4612855, -2.925209, 1, 0.5568628, 0, 1,
-1.368314, -0.4735916, -1.470247, 1, 0.5647059, 0, 1,
-1.364817, 2.740057, -1.411494, 1, 0.5686275, 0, 1,
-1.363586, -1.983056, -3.155329, 1, 0.5764706, 0, 1,
-1.356014, -0.04107042, -2.921445, 1, 0.5803922, 0, 1,
-1.35538, 0.9974335, -0.3938109, 1, 0.5882353, 0, 1,
-1.341246, 0.4520732, -2.136007, 1, 0.5921569, 0, 1,
-1.340193, 0.9031854, -0.008486192, 1, 0.6, 0, 1,
-1.339646, 0.6512026, -2.049884, 1, 0.6078432, 0, 1,
-1.338165, -1.240346, -0.7513973, 1, 0.6117647, 0, 1,
-1.338066, -0.9974356, -2.488, 1, 0.6196079, 0, 1,
-1.324024, 2.061428, -0.4004987, 1, 0.6235294, 0, 1,
-1.322513, -0.295518, -1.283168, 1, 0.6313726, 0, 1,
-1.309297, 0.5769138, -0.2528668, 1, 0.6352941, 0, 1,
-1.305998, -0.03353694, -3.428934, 1, 0.6431373, 0, 1,
-1.303092, -0.3368783, -0.07874791, 1, 0.6470588, 0, 1,
-1.299762, -0.4481116, -1.63797, 1, 0.654902, 0, 1,
-1.298626, -0.7332383, -2.131577, 1, 0.6588235, 0, 1,
-1.293309, 0.3621849, -1.935594, 1, 0.6666667, 0, 1,
-1.293091, 0.9476514, -2.549184, 1, 0.6705883, 0, 1,
-1.292368, 0.6121391, -2.054328, 1, 0.6784314, 0, 1,
-1.275007, 1.0172, -0.4156711, 1, 0.682353, 0, 1,
-1.2743, 0.7493283, 0.8182333, 1, 0.6901961, 0, 1,
-1.273995, 0.1862243, -1.734191, 1, 0.6941177, 0, 1,
-1.268663, 0.4204084, -2.263008, 1, 0.7019608, 0, 1,
-1.264752, 1.77139, 0.03420604, 1, 0.7098039, 0, 1,
-1.261493, -0.7188527, -1.620408, 1, 0.7137255, 0, 1,
-1.261256, -1.051879, -4.282024, 1, 0.7215686, 0, 1,
-1.252308, -0.3819526, -2.60498, 1, 0.7254902, 0, 1,
-1.252018, 0.468524, 0.269071, 1, 0.7333333, 0, 1,
-1.250272, -0.6058847, -1.694996, 1, 0.7372549, 0, 1,
-1.242253, 0.1064284, -1.262252, 1, 0.7450981, 0, 1,
-1.230975, -1.270362, -0.1648825, 1, 0.7490196, 0, 1,
-1.229267, -0.3085994, -0.7872933, 1, 0.7568628, 0, 1,
-1.225309, -0.2124635, -2.003127, 1, 0.7607843, 0, 1,
-1.22376, 1.728769, 0.5056096, 1, 0.7686275, 0, 1,
-1.212274, 0.3730896, -1.352046, 1, 0.772549, 0, 1,
-1.210496, 0.7477683, -0.3487726, 1, 0.7803922, 0, 1,
-1.210354, 0.1608962, -1.649903, 1, 0.7843137, 0, 1,
-1.204125, 0.3740182, -1.22855, 1, 0.7921569, 0, 1,
-1.202349, -0.3091202, -2.603243, 1, 0.7960784, 0, 1,
-1.198015, -1.932656, -3.228086, 1, 0.8039216, 0, 1,
-1.187036, -0.7520143, -3.791199, 1, 0.8117647, 0, 1,
-1.186892, 1.439497, -0.5436975, 1, 0.8156863, 0, 1,
-1.175514, 0.3935656, -1.388942, 1, 0.8235294, 0, 1,
-1.175342, 0.455722, -0.8945469, 1, 0.827451, 0, 1,
-1.171469, 0.9497088, 0.2949504, 1, 0.8352941, 0, 1,
-1.169953, 0.8344235, -0.2734277, 1, 0.8392157, 0, 1,
-1.162648, -0.603187, -3.208674, 1, 0.8470588, 0, 1,
-1.162405, -1.591653, -2.583804, 1, 0.8509804, 0, 1,
-1.153039, 0.1996635, -2.844431, 1, 0.8588235, 0, 1,
-1.1511, -0.4152398, -0.5795972, 1, 0.8627451, 0, 1,
-1.137955, 0.6964453, -1.766654, 1, 0.8705882, 0, 1,
-1.136422, 0.002991741, -1.875727, 1, 0.8745098, 0, 1,
-1.134871, -1.364479, -1.323097, 1, 0.8823529, 0, 1,
-1.13278, -1.191496, -2.233859, 1, 0.8862745, 0, 1,
-1.129332, 1.480778, -0.5952652, 1, 0.8941177, 0, 1,
-1.126011, -0.4440768, -2.163415, 1, 0.8980392, 0, 1,
-1.121773, 2.317475, -1.73967, 1, 0.9058824, 0, 1,
-1.121514, -0.4522256, -3.59896, 1, 0.9137255, 0, 1,
-1.111155, 0.3001852, 0.03826285, 1, 0.9176471, 0, 1,
-1.11053, -0.954562, -3.443963, 1, 0.9254902, 0, 1,
-1.108836, 0.3423105, -1.549219, 1, 0.9294118, 0, 1,
-1.10799, -1.008787, -1.9651, 1, 0.9372549, 0, 1,
-1.107109, 1.371934, -1.043337, 1, 0.9411765, 0, 1,
-1.100523, 1.197229, 1.209837, 1, 0.9490196, 0, 1,
-1.1002, 1.844094, -2.688395, 1, 0.9529412, 0, 1,
-1.098984, 0.4765195, -0.9056069, 1, 0.9607843, 0, 1,
-1.091829, -0.6147813, -2.595607, 1, 0.9647059, 0, 1,
-1.088485, -0.1628946, -2.620352, 1, 0.972549, 0, 1,
-1.083692, -2.182618, -0.05698178, 1, 0.9764706, 0, 1,
-1.079979, 1.614367, 0.701875, 1, 0.9843137, 0, 1,
-1.073638, -0.377266, -0.5198649, 1, 0.9882353, 0, 1,
-1.06997, -0.6420361, -3.351711, 1, 0.9960784, 0, 1,
-1.069935, 0.2554283, -1.116341, 0.9960784, 1, 0, 1,
-1.062372, 0.7665378, -0.8920801, 0.9921569, 1, 0, 1,
-1.060522, -0.5183415, -2.074253, 0.9843137, 1, 0, 1,
-1.057235, 0.1707838, -0.3334024, 0.9803922, 1, 0, 1,
-1.053656, 0.2113527, -2.044931, 0.972549, 1, 0, 1,
-1.052085, 1.288687, -1.428005, 0.9686275, 1, 0, 1,
-1.045034, 0.7565042, -2.357462, 0.9607843, 1, 0, 1,
-1.040541, 0.2775305, -0.0749649, 0.9568627, 1, 0, 1,
-1.026033, -0.2850977, -2.382135, 0.9490196, 1, 0, 1,
-1.024105, -0.02745086, -0.5732578, 0.945098, 1, 0, 1,
-1.017474, -0.112312, -1.589702, 0.9372549, 1, 0, 1,
-1.014591, 2.533686, -0.2002522, 0.9333333, 1, 0, 1,
-1.013788, 1.397586, -1.805195, 0.9254902, 1, 0, 1,
-1.009241, 1.653658, -1.939343, 0.9215686, 1, 0, 1,
-1.006461, 1.316484, -0.7205733, 0.9137255, 1, 0, 1,
-1.003623, 0.6182903, -0.6367648, 0.9098039, 1, 0, 1,
-1.00359, 1.710332, 0.5295695, 0.9019608, 1, 0, 1,
-1.003335, -1.003413, -1.955227, 0.8941177, 1, 0, 1,
-1.002378, -0.9507372, -1.151762, 0.8901961, 1, 0, 1,
-1.002168, 0.1205191, -1.973918, 0.8823529, 1, 0, 1,
-0.9994507, 1.21591, -2.043224, 0.8784314, 1, 0, 1,
-0.9986125, 0.3543165, -1.663793, 0.8705882, 1, 0, 1,
-0.9909908, -0.02040312, -1.659481, 0.8666667, 1, 0, 1,
-0.9858169, 1.007391, -0.050409, 0.8588235, 1, 0, 1,
-0.9773023, 1.537066, 0.05998357, 0.854902, 1, 0, 1,
-0.9753222, -1.108001, -1.199746, 0.8470588, 1, 0, 1,
-0.9720056, -1.653442, -3.423078, 0.8431373, 1, 0, 1,
-0.971242, -1.118619, -3.828157, 0.8352941, 1, 0, 1,
-0.9690074, -1.674447, -1.560782, 0.8313726, 1, 0, 1,
-0.965251, 0.8570559, 0.797761, 0.8235294, 1, 0, 1,
-0.9570292, 0.5505984, -2.477016, 0.8196079, 1, 0, 1,
-0.9547682, 0.7999123, -1.190249, 0.8117647, 1, 0, 1,
-0.9529811, 0.1692114, -0.8680465, 0.8078431, 1, 0, 1,
-0.9493783, 1.280331, -0.7503117, 0.8, 1, 0, 1,
-0.9486278, -0.5520039, -1.149224, 0.7921569, 1, 0, 1,
-0.947602, -0.7821866, -3.181038, 0.7882353, 1, 0, 1,
-0.9330714, -2.740519, -2.589206, 0.7803922, 1, 0, 1,
-0.9313785, -0.08674441, -1.385486, 0.7764706, 1, 0, 1,
-0.9262812, 0.1819191, -1.490837, 0.7686275, 1, 0, 1,
-0.9250357, -1.582949, -4.140041, 0.7647059, 1, 0, 1,
-0.9249953, -1.108719, -2.942578, 0.7568628, 1, 0, 1,
-0.9240282, 0.8373414, -1.963871, 0.7529412, 1, 0, 1,
-0.9132965, -2.134889, -2.150014, 0.7450981, 1, 0, 1,
-0.9095242, -1.252092, -2.61278, 0.7411765, 1, 0, 1,
-0.9010829, -0.2826307, -1.2921, 0.7333333, 1, 0, 1,
-0.8933597, -0.2996433, -1.017938, 0.7294118, 1, 0, 1,
-0.8919498, 1.640862, 0.4713206, 0.7215686, 1, 0, 1,
-0.8919353, -0.4262603, -1.741503, 0.7176471, 1, 0, 1,
-0.8888774, 2.94878, -1.72163, 0.7098039, 1, 0, 1,
-0.8856686, 1.431983, 0.8163902, 0.7058824, 1, 0, 1,
-0.8814917, 0.5229433, -1.434268, 0.6980392, 1, 0, 1,
-0.8780214, -0.5014117, -2.08614, 0.6901961, 1, 0, 1,
-0.8618786, 1.619515, 1.069638, 0.6862745, 1, 0, 1,
-0.8584657, 0.2692395, -1.77746, 0.6784314, 1, 0, 1,
-0.8527083, -0.03766114, -1.588018, 0.6745098, 1, 0, 1,
-0.8518271, -0.9751559, -2.65269, 0.6666667, 1, 0, 1,
-0.8488015, -0.1516009, -3.032992, 0.6627451, 1, 0, 1,
-0.8479151, -0.01317817, -2.058504, 0.654902, 1, 0, 1,
-0.8450261, -0.8515989, -1.715713, 0.6509804, 1, 0, 1,
-0.8433555, 0.5555559, -0.5333639, 0.6431373, 1, 0, 1,
-0.8332121, 0.0331655, -2.137673, 0.6392157, 1, 0, 1,
-0.8294681, -0.1759781, -2.767499, 0.6313726, 1, 0, 1,
-0.826891, 1.550933, -0.8831412, 0.627451, 1, 0, 1,
-0.8243548, 3.116861, -1.527248, 0.6196079, 1, 0, 1,
-0.8236155, -0.317106, -1.267911, 0.6156863, 1, 0, 1,
-0.8157451, -0.3686508, -3.376425, 0.6078432, 1, 0, 1,
-0.8129242, -0.1963815, -2.595066, 0.6039216, 1, 0, 1,
-0.8114314, 0.4094934, -1.81735, 0.5960785, 1, 0, 1,
-0.8104664, -0.9170442, -4.422198, 0.5882353, 1, 0, 1,
-0.8093253, -1.01014, -1.178823, 0.5843138, 1, 0, 1,
-0.8020226, 0.3377842, -0.1515472, 0.5764706, 1, 0, 1,
-0.7993098, -0.4614434, -2.577698, 0.572549, 1, 0, 1,
-0.7991959, -0.6529852, -2.124419, 0.5647059, 1, 0, 1,
-0.7944667, -0.4452227, -1.595614, 0.5607843, 1, 0, 1,
-0.7897951, 0.8963387, -2.346648, 0.5529412, 1, 0, 1,
-0.7728262, -0.5428929, -0.783196, 0.5490196, 1, 0, 1,
-0.7694299, 0.8197384, -0.9052725, 0.5411765, 1, 0, 1,
-0.7690746, -0.02564573, -0.4651283, 0.5372549, 1, 0, 1,
-0.7681488, -0.4887837, -2.797141, 0.5294118, 1, 0, 1,
-0.7624136, 2.975012, 0.9782353, 0.5254902, 1, 0, 1,
-0.7620691, -1.314822, -2.964733, 0.5176471, 1, 0, 1,
-0.7619615, 0.2886562, -0.2463098, 0.5137255, 1, 0, 1,
-0.7597733, 2.143949, -0.2975185, 0.5058824, 1, 0, 1,
-0.7536991, 1.455143, -0.6420456, 0.5019608, 1, 0, 1,
-0.7516185, 0.3051494, -0.163055, 0.4941176, 1, 0, 1,
-0.7515847, 1.144112, -1.641747, 0.4862745, 1, 0, 1,
-0.7478461, -2.642384, -3.087333, 0.4823529, 1, 0, 1,
-0.7404272, -1.231701, -2.889867, 0.4745098, 1, 0, 1,
-0.7351725, -1.209597, -2.090419, 0.4705882, 1, 0, 1,
-0.7317869, -0.02999127, -1.067127, 0.4627451, 1, 0, 1,
-0.7309009, 0.8339797, 0.306055, 0.4588235, 1, 0, 1,
-0.728738, -0.1373022, 0.5051484, 0.4509804, 1, 0, 1,
-0.7279551, 0.6551337, -1.023853, 0.4470588, 1, 0, 1,
-0.7269271, -1.558071, -3.299754, 0.4392157, 1, 0, 1,
-0.7107481, 0.4548184, -0.6026108, 0.4352941, 1, 0, 1,
-0.7088602, -0.7058013, -0.7230232, 0.427451, 1, 0, 1,
-0.7060962, -0.6569585, -3.658388, 0.4235294, 1, 0, 1,
-0.7049397, -2.41039, -2.773843, 0.4156863, 1, 0, 1,
-0.7039791, 1.164095, -0.3716056, 0.4117647, 1, 0, 1,
-0.7034169, 0.9683095, -0.9522287, 0.4039216, 1, 0, 1,
-0.7033077, 0.3553898, -0.6953787, 0.3960784, 1, 0, 1,
-0.7023587, -0.7079342, -3.061869, 0.3921569, 1, 0, 1,
-0.7011304, -1.94149, -2.574979, 0.3843137, 1, 0, 1,
-0.7011154, 1.931719, 0.8418056, 0.3803922, 1, 0, 1,
-0.6975336, 1.534598, 0.0367176, 0.372549, 1, 0, 1,
-0.6901121, 0.06827292, -1.275477, 0.3686275, 1, 0, 1,
-0.682887, -1.587136, -0.4548721, 0.3607843, 1, 0, 1,
-0.679759, -0.3872607, -2.547217, 0.3568628, 1, 0, 1,
-0.679037, 1.202478, -0.4786654, 0.3490196, 1, 0, 1,
-0.6790316, 0.7716311, 0.7588723, 0.345098, 1, 0, 1,
-0.6710187, -0.358868, -0.8468149, 0.3372549, 1, 0, 1,
-0.6686569, -0.6112145, -1.731901, 0.3333333, 1, 0, 1,
-0.6651461, -0.8766934, -1.737502, 0.3254902, 1, 0, 1,
-0.6650887, -1.283552, -2.520376, 0.3215686, 1, 0, 1,
-0.6637173, -0.5677407, -3.080835, 0.3137255, 1, 0, 1,
-0.6611682, 0.9174629, -0.7024527, 0.3098039, 1, 0, 1,
-0.6553499, 0.3154744, -0.6095494, 0.3019608, 1, 0, 1,
-0.6461971, -2.018359, -2.783233, 0.2941177, 1, 0, 1,
-0.6418252, 0.313067, 0.01175432, 0.2901961, 1, 0, 1,
-0.6365793, 0.346823, -0.8868704, 0.282353, 1, 0, 1,
-0.6320059, -0.1257651, -2.178546, 0.2784314, 1, 0, 1,
-0.6313705, -0.5470375, -1.870064, 0.2705882, 1, 0, 1,
-0.6289854, 0.9974747, -0.3471307, 0.2666667, 1, 0, 1,
-0.6277639, 2.026593, 0.3650676, 0.2588235, 1, 0, 1,
-0.6241935, 0.5459128, -1.482805, 0.254902, 1, 0, 1,
-0.6145308, 0.465539, -0.6268982, 0.2470588, 1, 0, 1,
-0.6138648, -0.01199364, -2.837173, 0.2431373, 1, 0, 1,
-0.6095166, -0.98506, -1.370289, 0.2352941, 1, 0, 1,
-0.6051147, 1.036812, -2.004122, 0.2313726, 1, 0, 1,
-0.6042135, 1.184917, 0.8736557, 0.2235294, 1, 0, 1,
-0.6042068, 0.6116628, -1.184564, 0.2196078, 1, 0, 1,
-0.6033159, 0.1755747, -2.739817, 0.2117647, 1, 0, 1,
-0.5993851, -0.2143325, -2.544336, 0.2078431, 1, 0, 1,
-0.5992839, 0.4438018, -0.6891788, 0.2, 1, 0, 1,
-0.5987447, 0.1264816, -2.476467, 0.1921569, 1, 0, 1,
-0.5963508, 0.9090028, 0.1337271, 0.1882353, 1, 0, 1,
-0.5961001, -0.2348673, -2.975307, 0.1803922, 1, 0, 1,
-0.5954987, 1.854403, -0.4492174, 0.1764706, 1, 0, 1,
-0.5902256, -1.911029, -2.828379, 0.1686275, 1, 0, 1,
-0.5810691, -2.402525, -3.300384, 0.1647059, 1, 0, 1,
-0.5788625, -0.1181987, -1.390665, 0.1568628, 1, 0, 1,
-0.5676064, -1.05789, -3.400836, 0.1529412, 1, 0, 1,
-0.5672751, -1.051749, -2.27288, 0.145098, 1, 0, 1,
-0.5671545, -0.4291521, -1.484413, 0.1411765, 1, 0, 1,
-0.5643435, -2.980877, -2.743344, 0.1333333, 1, 0, 1,
-0.5598578, -0.8363622, -2.079254, 0.1294118, 1, 0, 1,
-0.5596891, -0.8891844, -3.122068, 0.1215686, 1, 0, 1,
-0.5585163, 0.9164045, 0.4957488, 0.1176471, 1, 0, 1,
-0.5535972, -1.148641, -2.229386, 0.1098039, 1, 0, 1,
-0.5495505, 0.6876052, 0.06790084, 0.1058824, 1, 0, 1,
-0.5341704, -0.3432333, -0.8690257, 0.09803922, 1, 0, 1,
-0.5280855, 0.5638767, -1.171385, 0.09019608, 1, 0, 1,
-0.5260342, 1.403681, -0.9353563, 0.08627451, 1, 0, 1,
-0.5253529, -1.004612, -4.76482, 0.07843138, 1, 0, 1,
-0.5228862, -1.637021, -1.939932, 0.07450981, 1, 0, 1,
-0.522251, -0.0009633933, -2.083155, 0.06666667, 1, 0, 1,
-0.5171964, -1.045824, -2.644336, 0.0627451, 1, 0, 1,
-0.5156322, 0.6234089, 0.5276229, 0.05490196, 1, 0, 1,
-0.5114121, -0.3138351, -1.100109, 0.05098039, 1, 0, 1,
-0.5112631, -1.77364, -4.19219, 0.04313726, 1, 0, 1,
-0.5112397, 0.6640947, 0.2424977, 0.03921569, 1, 0, 1,
-0.5086508, 0.39297, -1.345964, 0.03137255, 1, 0, 1,
-0.5052679, 0.6153907, 0.2084848, 0.02745098, 1, 0, 1,
-0.5026206, 0.3222262, 0.7855107, 0.01960784, 1, 0, 1,
-0.498568, 0.4555813, 0.9753011, 0.01568628, 1, 0, 1,
-0.4975011, 1.22859, -0.5790256, 0.007843138, 1, 0, 1,
-0.4941642, 2.015743, -0.6174654, 0.003921569, 1, 0, 1,
-0.4929523, -0.04748207, -0.4227113, 0, 1, 0.003921569, 1,
-0.4927785, 0.2033439, -1.894072, 0, 1, 0.01176471, 1,
-0.4810652, 0.9039906, -0.03586059, 0, 1, 0.01568628, 1,
-0.47537, 1.477681, -0.04918655, 0, 1, 0.02352941, 1,
-0.4733834, 0.3086572, -0.443226, 0, 1, 0.02745098, 1,
-0.4720728, 0.3923987, -0.749131, 0, 1, 0.03529412, 1,
-0.4716151, 0.5800774, -1.592866, 0, 1, 0.03921569, 1,
-0.4697135, 0.9283019, -0.5480619, 0, 1, 0.04705882, 1,
-0.4656478, -1.457199, -3.2597, 0, 1, 0.05098039, 1,
-0.4653434, -0.368977, -2.25651, 0, 1, 0.05882353, 1,
-0.464753, -0.05355405, -0.9841862, 0, 1, 0.0627451, 1,
-0.4639456, -1.016399, -3.118226, 0, 1, 0.07058824, 1,
-0.4613587, 1.519658, 0.7288703, 0, 1, 0.07450981, 1,
-0.4606589, -1.625312, -2.710371, 0, 1, 0.08235294, 1,
-0.4548382, 0.5355777, 1.011151, 0, 1, 0.08627451, 1,
-0.4527671, 0.04772821, -2.503642, 0, 1, 0.09411765, 1,
-0.4492097, -1.055582, -2.198867, 0, 1, 0.1019608, 1,
-0.4465103, -1.786026, -1.22267, 0, 1, 0.1058824, 1,
-0.4451147, -1.192878, -3.967165, 0, 1, 0.1137255, 1,
-0.4406676, -1.241032, -2.411135, 0, 1, 0.1176471, 1,
-0.4402685, 0.2996866, -1.131165, 0, 1, 0.1254902, 1,
-0.4313977, 1.087212, -0.9938625, 0, 1, 0.1294118, 1,
-0.4289362, -1.658051, -1.565506, 0, 1, 0.1372549, 1,
-0.4284438, -1.262041, -1.697853, 0, 1, 0.1411765, 1,
-0.4270117, 1.607395, 0.3934002, 0, 1, 0.1490196, 1,
-0.4255196, 0.8615981, 0.9403403, 0, 1, 0.1529412, 1,
-0.4144234, 1.245641, -2.33157, 0, 1, 0.1607843, 1,
-0.4101118, -0.4255142, -3.04167, 0, 1, 0.1647059, 1,
-0.4079157, -1.045178, -1.968678, 0, 1, 0.172549, 1,
-0.4070309, -0.3227398, -3.529938, 0, 1, 0.1764706, 1,
-0.4053728, 0.2640902, 0.1462158, 0, 1, 0.1843137, 1,
-0.4030996, -0.2811934, -2.231119, 0, 1, 0.1882353, 1,
-0.3947956, 1.805268, 1.342558, 0, 1, 0.1960784, 1,
-0.3938488, -1.611436, -2.702782, 0, 1, 0.2039216, 1,
-0.3910895, 0.08966929, -2.715431, 0, 1, 0.2078431, 1,
-0.3897667, 1.484193, -0.06672442, 0, 1, 0.2156863, 1,
-0.3887821, -0.364533, -3.477368, 0, 1, 0.2196078, 1,
-0.3823047, -0.02859095, -2.83029, 0, 1, 0.227451, 1,
-0.3790396, 0.6415119, 0.3618941, 0, 1, 0.2313726, 1,
-0.3770661, -0.2551489, -2.96865, 0, 1, 0.2392157, 1,
-0.3743696, 0.7940644, -1.71414, 0, 1, 0.2431373, 1,
-0.3733847, 1.733399, -0.9702396, 0, 1, 0.2509804, 1,
-0.3670785, -0.7631503, -2.20009, 0, 1, 0.254902, 1,
-0.3612708, 0.8215913, -0.27627, 0, 1, 0.2627451, 1,
-0.3561145, -0.03683554, -1.980989, 0, 1, 0.2666667, 1,
-0.3503654, 0.2312828, 1.819033, 0, 1, 0.2745098, 1,
-0.3468922, 0.1854613, -1.253767, 0, 1, 0.2784314, 1,
-0.3426229, 1.018052, -0.4697889, 0, 1, 0.2862745, 1,
-0.3404147, -0.2921473, -2.407915, 0, 1, 0.2901961, 1,
-0.3308989, 1.182438, 1.208633, 0, 1, 0.2980392, 1,
-0.3301982, 1.099817, -1.015406, 0, 1, 0.3058824, 1,
-0.3246624, 0.4829494, 0.6814435, 0, 1, 0.3098039, 1,
-0.3246142, 0.5596227, -1.567899, 0, 1, 0.3176471, 1,
-0.3179339, 0.2425615, -1.386698, 0, 1, 0.3215686, 1,
-0.3168349, -0.9427058, -2.822638, 0, 1, 0.3294118, 1,
-0.3160293, -1.000272, -3.636447, 0, 1, 0.3333333, 1,
-0.3148419, 0.5653749, -1.01117, 0, 1, 0.3411765, 1,
-0.3141263, 0.4051812, -1.958021, 0, 1, 0.345098, 1,
-0.3130828, -0.3939467, -0.6880796, 0, 1, 0.3529412, 1,
-0.3051547, -0.8938215, -3.525535, 0, 1, 0.3568628, 1,
-0.3030894, -0.1240618, -2.333666, 0, 1, 0.3647059, 1,
-0.3028419, 0.681029, -1.018861, 0, 1, 0.3686275, 1,
-0.2983916, 1.297667, -1.333115, 0, 1, 0.3764706, 1,
-0.2945573, 0.6640118, 0.9501538, 0, 1, 0.3803922, 1,
-0.293743, -1.356103, -2.869498, 0, 1, 0.3882353, 1,
-0.2910376, 0.2905076, -1.802604, 0, 1, 0.3921569, 1,
-0.2905554, -1.743727, -2.987741, 0, 1, 0.4, 1,
-0.2904855, -0.6096948, -1.617941, 0, 1, 0.4078431, 1,
-0.289169, 0.5620146, 0.06987122, 0, 1, 0.4117647, 1,
-0.2890094, -0.9268815, -3.829251, 0, 1, 0.4196078, 1,
-0.2880159, 0.2752641, -0.8901761, 0, 1, 0.4235294, 1,
-0.2869457, -0.5818254, -3.873629, 0, 1, 0.4313726, 1,
-0.2868435, -0.5320998, -2.164824, 0, 1, 0.4352941, 1,
-0.2848928, -0.1537412, -1.580239, 0, 1, 0.4431373, 1,
-0.2817885, 0.2013282, -1.757332, 0, 1, 0.4470588, 1,
-0.2805157, 0.6300243, -1.523923, 0, 1, 0.454902, 1,
-0.2797972, 0.7986718, -0.009337926, 0, 1, 0.4588235, 1,
-0.278435, -0.2729804, -1.849133, 0, 1, 0.4666667, 1,
-0.2780075, -0.6506, -2.928571, 0, 1, 0.4705882, 1,
-0.2731121, -0.5311024, -2.147621, 0, 1, 0.4784314, 1,
-0.2714987, -1.975099, -4.219377, 0, 1, 0.4823529, 1,
-0.2698007, -0.5696305, -2.137264, 0, 1, 0.4901961, 1,
-0.267112, -2.18506, -2.553873, 0, 1, 0.4941176, 1,
-0.266664, -0.2028255, -1.52177, 0, 1, 0.5019608, 1,
-0.2595819, -0.5992455, -3.411896, 0, 1, 0.509804, 1,
-0.2584498, 2.662923, 0.3744359, 0, 1, 0.5137255, 1,
-0.2557601, 0.08289015, -1.270261, 0, 1, 0.5215687, 1,
-0.2549341, -0.4126668, -3.181377, 0, 1, 0.5254902, 1,
-0.2500319, 0.460549, -0.763007, 0, 1, 0.5333334, 1,
-0.2494972, 0.9133923, 0.3965887, 0, 1, 0.5372549, 1,
-0.2492577, -1.354058, -2.234143, 0, 1, 0.5450981, 1,
-0.2464669, -0.4316462, -2.268233, 0, 1, 0.5490196, 1,
-0.2450432, 1.313233, 0.6393543, 0, 1, 0.5568628, 1,
-0.2421578, 0.8306499, 0.8918923, 0, 1, 0.5607843, 1,
-0.2415132, -1.101321, -2.910775, 0, 1, 0.5686275, 1,
-0.2396423, 0.2135714, -2.200249, 0, 1, 0.572549, 1,
-0.2376646, -0.8024277, -2.353537, 0, 1, 0.5803922, 1,
-0.2371902, -1.283974, -2.291569, 0, 1, 0.5843138, 1,
-0.2322599, -0.4159974, -2.255994, 0, 1, 0.5921569, 1,
-0.2311933, 0.107833, -1.102792, 0, 1, 0.5960785, 1,
-0.2297878, 0.2147364, -0.1353271, 0, 1, 0.6039216, 1,
-0.2278452, 0.8341044, 1.119789, 0, 1, 0.6117647, 1,
-0.2197799, 0.486677, 0.96815, 0, 1, 0.6156863, 1,
-0.2183978, -0.4923465, -4.214151, 0, 1, 0.6235294, 1,
-0.2171718, -0.8304015, -2.453358, 0, 1, 0.627451, 1,
-0.2151737, -1.4552, -3.680086, 0, 1, 0.6352941, 1,
-0.2149129, 1.058616, -1.255837, 0, 1, 0.6392157, 1,
-0.2148698, -0.4314604, -2.950627, 0, 1, 0.6470588, 1,
-0.2122714, 0.7651755, 0.521663, 0, 1, 0.6509804, 1,
-0.2119346, 1.407335, 0.2331121, 0, 1, 0.6588235, 1,
-0.2118447, 0.8282161, 0.04214856, 0, 1, 0.6627451, 1,
-0.2115189, -1.361176, -5.336368, 0, 1, 0.6705883, 1,
-0.2090807, -1.399697, -2.549735, 0, 1, 0.6745098, 1,
-0.2078626, -0.1767122, -0.4850049, 0, 1, 0.682353, 1,
-0.2052365, -0.315867, -0.7823518, 0, 1, 0.6862745, 1,
-0.2022803, 0.5977472, -0.4008258, 0, 1, 0.6941177, 1,
-0.2012567, -1.417406, -4.66971, 0, 1, 0.7019608, 1,
-0.1975, 0.9149262, -0.6715405, 0, 1, 0.7058824, 1,
-0.1938601, 0.5873454, -0.01053873, 0, 1, 0.7137255, 1,
-0.1884156, -0.553023, -4.803808, 0, 1, 0.7176471, 1,
-0.1807455, -0.02882777, -0.7731534, 0, 1, 0.7254902, 1,
-0.1778333, 0.6225778, -0.1702855, 0, 1, 0.7294118, 1,
-0.1772479, -0.4945717, -4.205852, 0, 1, 0.7372549, 1,
-0.1720527, 1.350362, -0.2529337, 0, 1, 0.7411765, 1,
-0.1613587, 0.7207475, 0.498086, 0, 1, 0.7490196, 1,
-0.1610689, 0.9893238, 0.0725545, 0, 1, 0.7529412, 1,
-0.1608167, -0.01338643, -0.2932767, 0, 1, 0.7607843, 1,
-0.1607952, 0.791107, -0.8212677, 0, 1, 0.7647059, 1,
-0.159383, 1.649574, -0.1084209, 0, 1, 0.772549, 1,
-0.1576269, 1.292181, -0.5942994, 0, 1, 0.7764706, 1,
-0.1567346, -0.1158715, -1.714075, 0, 1, 0.7843137, 1,
-0.1434866, -1.024301, -2.896792, 0, 1, 0.7882353, 1,
-0.1404762, -0.4443033, -2.175549, 0, 1, 0.7960784, 1,
-0.1385481, -2.373087, -3.238289, 0, 1, 0.8039216, 1,
-0.1377932, 0.7215595, -2.165099, 0, 1, 0.8078431, 1,
-0.1346141, 0.4718451, -0.3375735, 0, 1, 0.8156863, 1,
-0.1304185, 0.003552007, -0.2561303, 0, 1, 0.8196079, 1,
-0.1292549, 0.4491072, -0.8779338, 0, 1, 0.827451, 1,
-0.1287177, 0.4059421, -0.1057289, 0, 1, 0.8313726, 1,
-0.1219002, -0.2720304, -2.879649, 0, 1, 0.8392157, 1,
-0.1174081, -0.8289268, -2.9203, 0, 1, 0.8431373, 1,
-0.111581, 1.704229, -0.3588431, 0, 1, 0.8509804, 1,
-0.1101399, -0.5061198, -2.106702, 0, 1, 0.854902, 1,
-0.1098523, 0.4569358, -1.13729, 0, 1, 0.8627451, 1,
-0.1090467, -0.3108163, -3.328118, 0, 1, 0.8666667, 1,
-0.1089116, 0.693602, 0.3499699, 0, 1, 0.8745098, 1,
-0.1088714, -0.1137516, -1.991441, 0, 1, 0.8784314, 1,
-0.1079046, 0.8799812, 1.93317, 0, 1, 0.8862745, 1,
-0.1077825, 0.3399373, -0.3835341, 0, 1, 0.8901961, 1,
-0.1018876, -0.6561253, -2.777825, 0, 1, 0.8980392, 1,
-0.1011465, 2.478853, 0.5805396, 0, 1, 0.9058824, 1,
-0.1001513, 1.133794, -0.550727, 0, 1, 0.9098039, 1,
-0.09851713, 0.1785376, -0.154696, 0, 1, 0.9176471, 1,
-0.09670158, 0.6858174, -0.1882706, 0, 1, 0.9215686, 1,
-0.09633128, -0.7367211, -2.382308, 0, 1, 0.9294118, 1,
-0.09549173, 0.6068418, -1.703322, 0, 1, 0.9333333, 1,
-0.0952533, -0.4882813, -2.970596, 0, 1, 0.9411765, 1,
-0.09414277, -0.2834766, -4.065567, 0, 1, 0.945098, 1,
-0.08824412, -0.574886, -3.354789, 0, 1, 0.9529412, 1,
-0.08738811, -2.395832, -3.67599, 0, 1, 0.9568627, 1,
-0.08738653, -1.616693, -2.587165, 0, 1, 0.9647059, 1,
-0.08733718, 0.3971662, -0.5034799, 0, 1, 0.9686275, 1,
-0.08487676, -1.055462, -3.570253, 0, 1, 0.9764706, 1,
-0.08394755, 0.5872405, -0.05803134, 0, 1, 0.9803922, 1,
-0.08093759, -2.553507, -3.404886, 0, 1, 0.9882353, 1,
-0.08077183, -2.561296, -3.618189, 0, 1, 0.9921569, 1,
-0.07891098, -0.1455359, -1.950572, 0, 1, 1, 1,
-0.0773085, 0.4710822, 0.4856413, 0, 0.9921569, 1, 1,
-0.0763289, -0.9360633, -2.799925, 0, 0.9882353, 1, 1,
-0.06733602, 0.9031555, 0.06164191, 0, 0.9803922, 1, 1,
-0.06277566, 0.03611798, -0.8484508, 0, 0.9764706, 1, 1,
-0.06219197, -1.114015, -2.939218, 0, 0.9686275, 1, 1,
-0.06155355, 0.3846714, 0.9468952, 0, 0.9647059, 1, 1,
-0.06130819, -1.048158, -1.017262, 0, 0.9568627, 1, 1,
-0.05868746, 1.901917, 0.1090631, 0, 0.9529412, 1, 1,
-0.04600016, -0.4021897, -2.515849, 0, 0.945098, 1, 1,
-0.04404018, -2.600079, -4.830126, 0, 0.9411765, 1, 1,
-0.04341007, 0.0698871, -2.676975, 0, 0.9333333, 1, 1,
-0.03962748, 1.561769, -0.6704844, 0, 0.9294118, 1, 1,
-0.03805749, -1.02486, -2.818578, 0, 0.9215686, 1, 1,
-0.03759132, -0.02553432, -2.634349, 0, 0.9176471, 1, 1,
-0.03681302, 2.081285, 0.1430417, 0, 0.9098039, 1, 1,
-0.03492719, -0.6567654, -5.006975, 0, 0.9058824, 1, 1,
-0.03037444, -0.7442953, -2.408629, 0, 0.8980392, 1, 1,
-0.02862243, 0.204007, 0.3232537, 0, 0.8901961, 1, 1,
-0.02494188, 0.5576594, 0.9739677, 0, 0.8862745, 1, 1,
-0.02252905, -0.681061, -2.294514, 0, 0.8784314, 1, 1,
-0.02153246, -0.7012095, -3.944869, 0, 0.8745098, 1, 1,
-0.02144812, 0.1198092, -0.7057842, 0, 0.8666667, 1, 1,
-0.01985454, 0.786438, 0.09736588, 0, 0.8627451, 1, 1,
-0.01943603, -0.1789546, -3.689503, 0, 0.854902, 1, 1,
-0.01877226, -0.9050648, -2.110075, 0, 0.8509804, 1, 1,
-0.01311888, -1.96473, -3.267148, 0, 0.8431373, 1, 1,
-0.008172396, 0.3713227, 0.375005, 0, 0.8392157, 1, 1,
-0.00417375, -0.07751888, -2.953808, 0, 0.8313726, 1, 1,
-0.004106762, -1.170952, -3.816661, 0, 0.827451, 1, 1,
-0.001950549, 1.30245, -0.03043859, 0, 0.8196079, 1, 1,
0.001072768, 0.3282953, 0.4514942, 0, 0.8156863, 1, 1,
0.001586056, 0.9966637, 0.7425052, 0, 0.8078431, 1, 1,
0.002166955, 1.411202, 1.987669, 0, 0.8039216, 1, 1,
0.003347104, 0.05951326, 0.6210615, 0, 0.7960784, 1, 1,
0.004709526, 0.6612857, 1.07581, 0, 0.7882353, 1, 1,
0.004831223, -0.4675448, 3.479827, 0, 0.7843137, 1, 1,
0.005521501, 0.6879121, -0.3941553, 0, 0.7764706, 1, 1,
0.01450561, 0.8554631, -0.7733129, 0, 0.772549, 1, 1,
0.01616514, 0.1530992, 0.5910488, 0, 0.7647059, 1, 1,
0.01759613, -2.310617, 2.252162, 0, 0.7607843, 1, 1,
0.02413517, 0.8455768, 1.402583, 0, 0.7529412, 1, 1,
0.02633605, -0.01231041, 1.091293, 0, 0.7490196, 1, 1,
0.02648935, -1.140417, 2.60999, 0, 0.7411765, 1, 1,
0.03240835, -0.488943, 3.759453, 0, 0.7372549, 1, 1,
0.04186999, 0.9397162, 1.449924, 0, 0.7294118, 1, 1,
0.0431602, -1.438283, 3.119167, 0, 0.7254902, 1, 1,
0.04447254, -1.117771, 2.476604, 0, 0.7176471, 1, 1,
0.04851123, 0.4851256, -0.9033336, 0, 0.7137255, 1, 1,
0.05055178, -0.004379177, 2.932098, 0, 0.7058824, 1, 1,
0.05474926, 1.4926, -0.2425367, 0, 0.6980392, 1, 1,
0.05484945, 1.697173, 0.2395485, 0, 0.6941177, 1, 1,
0.06271058, -1.094167, 2.603186, 0, 0.6862745, 1, 1,
0.06377091, 1.186894, -1.141061, 0, 0.682353, 1, 1,
0.06463301, 0.1760107, 0.07765492, 0, 0.6745098, 1, 1,
0.06718768, -1.071024, 2.626594, 0, 0.6705883, 1, 1,
0.07165888, -2.449304, 1.404866, 0, 0.6627451, 1, 1,
0.07327522, -0.03393977, 1.627735, 0, 0.6588235, 1, 1,
0.07554943, -0.9151028, 2.177206, 0, 0.6509804, 1, 1,
0.07766971, 0.2130367, 0.3597768, 0, 0.6470588, 1, 1,
0.08105482, -0.2986404, 2.433944, 0, 0.6392157, 1, 1,
0.08157212, -0.709499, 4.895084, 0, 0.6352941, 1, 1,
0.08281433, -0.8936691, 2.961608, 0, 0.627451, 1, 1,
0.08523021, -1.011247, 1.905402, 0, 0.6235294, 1, 1,
0.08616906, 0.03166149, -0.2404528, 0, 0.6156863, 1, 1,
0.09341605, 0.02236801, 1.632116, 0, 0.6117647, 1, 1,
0.0977953, -0.8386669, 3.647592, 0, 0.6039216, 1, 1,
0.1021513, -0.3594972, 3.033962, 0, 0.5960785, 1, 1,
0.1023405, 0.1805343, -0.9207453, 0, 0.5921569, 1, 1,
0.112213, 0.1407194, -0.02594255, 0, 0.5843138, 1, 1,
0.1128381, -0.2380916, 0.5478153, 0, 0.5803922, 1, 1,
0.1159539, 1.06371, 0.5013728, 0, 0.572549, 1, 1,
0.1185687, 0.2052403, 0.4023406, 0, 0.5686275, 1, 1,
0.1186913, 0.81911, 0.2310432, 0, 0.5607843, 1, 1,
0.1220208, -0.2680695, 1.757821, 0, 0.5568628, 1, 1,
0.1220234, 1.863391, 0.5361705, 0, 0.5490196, 1, 1,
0.122664, -1.953721, 2.661297, 0, 0.5450981, 1, 1,
0.1253932, -0.06791856, 3.174814, 0, 0.5372549, 1, 1,
0.1276891, 0.6274715, -1.693107, 0, 0.5333334, 1, 1,
0.1300658, 0.6071443, 0.2699808, 0, 0.5254902, 1, 1,
0.1321806, -0.4849102, 4.13511, 0, 0.5215687, 1, 1,
0.1336706, -0.06148099, 1.958834, 0, 0.5137255, 1, 1,
0.1367514, 2.256331, 1.757491, 0, 0.509804, 1, 1,
0.1375742, 0.3603635, -0.0401536, 0, 0.5019608, 1, 1,
0.1406265, 1.161955, -0.8103451, 0, 0.4941176, 1, 1,
0.141495, 1.237971, -0.5408177, 0, 0.4901961, 1, 1,
0.1415541, 0.6091387, -0.1370653, 0, 0.4823529, 1, 1,
0.1465365, 1.149116, 0.4027438, 0, 0.4784314, 1, 1,
0.161204, 0.02418574, 0.9111136, 0, 0.4705882, 1, 1,
0.1628534, -0.05470316, 2.089527, 0, 0.4666667, 1, 1,
0.1632573, 0.167432, 0.8651183, 0, 0.4588235, 1, 1,
0.165024, -1.489008, 2.963736, 0, 0.454902, 1, 1,
0.1719408, -0.5473848, 2.330906, 0, 0.4470588, 1, 1,
0.1722137, -1.002798, 2.035678, 0, 0.4431373, 1, 1,
0.1729921, -0.6690181, 1.790242, 0, 0.4352941, 1, 1,
0.1750426, 0.2814601, 1.104394, 0, 0.4313726, 1, 1,
0.1755321, 0.9076933, 1.163146, 0, 0.4235294, 1, 1,
0.178368, 0.3314792, 0.01590307, 0, 0.4196078, 1, 1,
0.1811578, -1.56781, 2.944183, 0, 0.4117647, 1, 1,
0.1815872, -0.432104, 2.847707, 0, 0.4078431, 1, 1,
0.1817015, -0.3609401, 1.537015, 0, 0.4, 1, 1,
0.1858326, 0.8127022, 0.3077315, 0, 0.3921569, 1, 1,
0.1935669, 0.2059099, 2.040007, 0, 0.3882353, 1, 1,
0.1967475, 1.972903, -0.2136112, 0, 0.3803922, 1, 1,
0.1969732, -0.05445104, 2.773414, 0, 0.3764706, 1, 1,
0.2112674, -2.219919, 2.574758, 0, 0.3686275, 1, 1,
0.2194564, -0.1570049, 1.635742, 0, 0.3647059, 1, 1,
0.2194951, -0.5157961, 2.91405, 0, 0.3568628, 1, 1,
0.2254033, 0.4900406, 0.5062649, 0, 0.3529412, 1, 1,
0.2268873, -0.6182194, 2.823004, 0, 0.345098, 1, 1,
0.2308419, -1.380768, 2.886651, 0, 0.3411765, 1, 1,
0.2317613, 1.527088, -0.9696909, 0, 0.3333333, 1, 1,
0.2338567, 0.6786909, 0.5041242, 0, 0.3294118, 1, 1,
0.240159, -0.2212379, 2.323587, 0, 0.3215686, 1, 1,
0.2467999, 0.3289815, 0.9132236, 0, 0.3176471, 1, 1,
0.2471889, 1.369064, 0.2060423, 0, 0.3098039, 1, 1,
0.2488638, -0.9334221, 3.340027, 0, 0.3058824, 1, 1,
0.2498209, -1.85465, 2.462626, 0, 0.2980392, 1, 1,
0.2505632, 1.426902, 0.4448602, 0, 0.2901961, 1, 1,
0.2513984, 2.123375, -2.091216, 0, 0.2862745, 1, 1,
0.2517733, -0.01160057, 1.617133, 0, 0.2784314, 1, 1,
0.2519872, 0.01892164, 0.4880941, 0, 0.2745098, 1, 1,
0.2542053, -0.558645, 1.394448, 0, 0.2666667, 1, 1,
0.2630294, -0.3574902, 2.166596, 0, 0.2627451, 1, 1,
0.2631474, 0.3683372, 0.8872461, 0, 0.254902, 1, 1,
0.2672805, 0.3238781, 0.5971954, 0, 0.2509804, 1, 1,
0.2711502, -0.3726946, 2.464137, 0, 0.2431373, 1, 1,
0.2718183, -0.1799731, 0.6357241, 0, 0.2392157, 1, 1,
0.2786424, 1.058655, -1.549366, 0, 0.2313726, 1, 1,
0.2788229, -0.05844343, 0.4711949, 0, 0.227451, 1, 1,
0.2795952, 0.214335, 1.321791, 0, 0.2196078, 1, 1,
0.2809042, -0.1577114, 2.048158, 0, 0.2156863, 1, 1,
0.2863931, 0.6061692, -0.4873211, 0, 0.2078431, 1, 1,
0.2869907, 0.4700237, -1.001409, 0, 0.2039216, 1, 1,
0.2926056, -0.2679191, 1.749226, 0, 0.1960784, 1, 1,
0.2941824, 0.3215059, -0.1078787, 0, 0.1882353, 1, 1,
0.2949846, -1.070497, 2.827529, 0, 0.1843137, 1, 1,
0.297588, 0.2316265, 0.3673755, 0, 0.1764706, 1, 1,
0.2981001, -0.2733534, 3.217504, 0, 0.172549, 1, 1,
0.2984363, 0.2723782, 2.067902, 0, 0.1647059, 1, 1,
0.3022872, -0.2495872, 1.358435, 0, 0.1607843, 1, 1,
0.3058288, 1.749776, -0.1080596, 0, 0.1529412, 1, 1,
0.3059699, 0.2375654, -0.5619819, 0, 0.1490196, 1, 1,
0.3064164, -0.741995, 3.004905, 0, 0.1411765, 1, 1,
0.308489, -1.14616, 2.409072, 0, 0.1372549, 1, 1,
0.3108076, 0.4901867, -0.3777708, 0, 0.1294118, 1, 1,
0.3122989, -0.2640807, 2.738056, 0, 0.1254902, 1, 1,
0.3150749, 1.819415, 1.341326, 0, 0.1176471, 1, 1,
0.3254217, 0.2761223, 0.684056, 0, 0.1137255, 1, 1,
0.3254598, 1.337642, 2.284801, 0, 0.1058824, 1, 1,
0.3283273, -0.8918678, 3.751721, 0, 0.09803922, 1, 1,
0.3371617, 0.4630144, 0.76413, 0, 0.09411765, 1, 1,
0.3385253, -0.3706505, 1.621299, 0, 0.08627451, 1, 1,
0.3385434, -0.1399614, 1.570266, 0, 0.08235294, 1, 1,
0.3427617, 2.035419, -0.5666529, 0, 0.07450981, 1, 1,
0.3440736, -0.943922, 3.634277, 0, 0.07058824, 1, 1,
0.3457055, 0.8301249, 0.07659058, 0, 0.0627451, 1, 1,
0.3530709, -0.5366441, 1.822837, 0, 0.05882353, 1, 1,
0.3547254, 0.1935301, 1.357662, 0, 0.05098039, 1, 1,
0.3585886, 0.4768414, 0.1579501, 0, 0.04705882, 1, 1,
0.3622395, -0.4617674, 2.624801, 0, 0.03921569, 1, 1,
0.3661962, 0.5081062, 1.020811, 0, 0.03529412, 1, 1,
0.3690772, -0.563058, 3.522968, 0, 0.02745098, 1, 1,
0.3704982, -1.142594, 2.288631, 0, 0.02352941, 1, 1,
0.3717471, -0.6316152, 1.485625, 0, 0.01568628, 1, 1,
0.3791341, 2.70271, 0.1048559, 0, 0.01176471, 1, 1,
0.3792505, -0.2371295, 3.813505, 0, 0.003921569, 1, 1,
0.3809794, 0.9898267, -0.1161897, 0.003921569, 0, 1, 1,
0.3824235, -0.8412079, 1.428801, 0.007843138, 0, 1, 1,
0.3872976, -0.05667274, 2.024303, 0.01568628, 0, 1, 1,
0.3895607, 0.3711379, 1.852529, 0.01960784, 0, 1, 1,
0.3902835, -0.7290588, 1.074086, 0.02745098, 0, 1, 1,
0.3943696, 0.06316853, 1.298712, 0.03137255, 0, 1, 1,
0.3959171, 0.1922435, 1.54037, 0.03921569, 0, 1, 1,
0.4025089, 0.5570987, 1.107932, 0.04313726, 0, 1, 1,
0.4046049, -1.917155, 2.819797, 0.05098039, 0, 1, 1,
0.4070022, 0.8981593, -0.03660979, 0.05490196, 0, 1, 1,
0.4079061, 0.2268809, -0.01323935, 0.0627451, 0, 1, 1,
0.4084114, -0.6413474, 1.585004, 0.06666667, 0, 1, 1,
0.4134919, -0.8132102, 0.9860409, 0.07450981, 0, 1, 1,
0.4190029, -0.1438836, 1.954522, 0.07843138, 0, 1, 1,
0.4205373, -0.4109787, 3.796741, 0.08627451, 0, 1, 1,
0.4285015, 0.139906, 2.058846, 0.09019608, 0, 1, 1,
0.4309572, -0.190117, 1.695969, 0.09803922, 0, 1, 1,
0.4313862, 1.634418, -0.5058681, 0.1058824, 0, 1, 1,
0.4325135, -1.332089, 3.491174, 0.1098039, 0, 1, 1,
0.4373748, 0.11028, 0.2644334, 0.1176471, 0, 1, 1,
0.4420838, 0.378773, 0.4468078, 0.1215686, 0, 1, 1,
0.4481449, -1.907019, 3.568001, 0.1294118, 0, 1, 1,
0.450225, -0.6774406, 3.770599, 0.1333333, 0, 1, 1,
0.4510899, -0.5862778, 2.190941, 0.1411765, 0, 1, 1,
0.4544255, 1.428093, 0.6185997, 0.145098, 0, 1, 1,
0.4552009, 1.393997, 1.314388, 0.1529412, 0, 1, 1,
0.4583518, -2.716026, 2.078023, 0.1568628, 0, 1, 1,
0.4597224, 0.8388402, -0.7307845, 0.1647059, 0, 1, 1,
0.4739547, 0.02960942, -0.04479583, 0.1686275, 0, 1, 1,
0.4767839, -0.7628192, 2.312061, 0.1764706, 0, 1, 1,
0.4795165, 0.1188697, 0.6757321, 0.1803922, 0, 1, 1,
0.4804794, 1.1891, 0.8741052, 0.1882353, 0, 1, 1,
0.4845923, 2.317639, 1.887888, 0.1921569, 0, 1, 1,
0.4848948, -0.9249032, 1.989453, 0.2, 0, 1, 1,
0.4873294, -0.769774, 4.030472, 0.2078431, 0, 1, 1,
0.4894967, -1.114526, 2.79934, 0.2117647, 0, 1, 1,
0.4922713, 0.3178419, 1.492935, 0.2196078, 0, 1, 1,
0.4937652, 0.3856575, 0.9686412, 0.2235294, 0, 1, 1,
0.4954631, 1.402105, -0.1030411, 0.2313726, 0, 1, 1,
0.4975384, -0.6933876, 4.442636, 0.2352941, 0, 1, 1,
0.5041597, -0.7630187, 3.197787, 0.2431373, 0, 1, 1,
0.5064971, -0.9885231, 2.406802, 0.2470588, 0, 1, 1,
0.5113168, -0.8047446, 3.135265, 0.254902, 0, 1, 1,
0.513239, -0.4250967, 3.874464, 0.2588235, 0, 1, 1,
0.5190727, -0.2340847, 0.2602783, 0.2666667, 0, 1, 1,
0.5194025, 1.234798, -0.4104432, 0.2705882, 0, 1, 1,
0.5196422, 1.051359, 0.08833864, 0.2784314, 0, 1, 1,
0.5303572, 0.1635702, 3.081493, 0.282353, 0, 1, 1,
0.5363182, 1.780138, -0.5888523, 0.2901961, 0, 1, 1,
0.5363469, -0.8423954, 3.911793, 0.2941177, 0, 1, 1,
0.5371783, -0.5552294, 2.544973, 0.3019608, 0, 1, 1,
0.5382704, 0.9949299, 0.378656, 0.3098039, 0, 1, 1,
0.5398433, -1.451044, 3.643631, 0.3137255, 0, 1, 1,
0.541808, 0.930486, 0.7904755, 0.3215686, 0, 1, 1,
0.5418895, 1.813892, 0.3574228, 0.3254902, 0, 1, 1,
0.5423341, 0.2782644, 1.234198, 0.3333333, 0, 1, 1,
0.5496748, -0.9838677, 3.054822, 0.3372549, 0, 1, 1,
0.5512218, -0.5501322, 2.05676, 0.345098, 0, 1, 1,
0.556279, 0.03867082, 0.7865129, 0.3490196, 0, 1, 1,
0.5568182, 0.2900662, 0.4112126, 0.3568628, 0, 1, 1,
0.5596197, -0.3421772, 1.586283, 0.3607843, 0, 1, 1,
0.5616472, 0.170029, 2.392315, 0.3686275, 0, 1, 1,
0.563134, -0.06225812, 1.22983, 0.372549, 0, 1, 1,
0.5640011, 1.187208, 0.8063971, 0.3803922, 0, 1, 1,
0.5640409, -0.832731, 0.7158607, 0.3843137, 0, 1, 1,
0.5677481, 0.5021349, 0.59405, 0.3921569, 0, 1, 1,
0.5728958, -1.061889, 1.771543, 0.3960784, 0, 1, 1,
0.5772538, -0.6574874, 1.222976, 0.4039216, 0, 1, 1,
0.5789412, 1.146592, 1.306454, 0.4117647, 0, 1, 1,
0.5795205, 0.7720678, -0.4504578, 0.4156863, 0, 1, 1,
0.5814011, -1.425595, 3.948804, 0.4235294, 0, 1, 1,
0.5862526, -0.6002817, 1.308465, 0.427451, 0, 1, 1,
0.5873123, 0.3470332, 1.600203, 0.4352941, 0, 1, 1,
0.5880053, -0.05398961, 2.654905, 0.4392157, 0, 1, 1,
0.5915816, -0.06910684, 3.040935, 0.4470588, 0, 1, 1,
0.5973275, -1.499376, 3.457527, 0.4509804, 0, 1, 1,
0.5975471, 1.172395, 1.764833, 0.4588235, 0, 1, 1,
0.6062639, 0.4893893, 0.3095734, 0.4627451, 0, 1, 1,
0.6080044, -1.267441, 2.903554, 0.4705882, 0, 1, 1,
0.618372, -0.8218091, 1.586644, 0.4745098, 0, 1, 1,
0.621673, -0.2348342, 0.8821313, 0.4823529, 0, 1, 1,
0.6242825, 0.03468754, 2.353793, 0.4862745, 0, 1, 1,
0.6266899, -1.894621, 4.941655, 0.4941176, 0, 1, 1,
0.6350602, 0.5561529, -0.3876577, 0.5019608, 0, 1, 1,
0.6466983, 1.471082, 0.220387, 0.5058824, 0, 1, 1,
0.6491247, 0.2159224, 0.8746064, 0.5137255, 0, 1, 1,
0.6509327, 1.154132, 0.1233723, 0.5176471, 0, 1, 1,
0.6565118, 0.6878186, -0.5011427, 0.5254902, 0, 1, 1,
0.6596307, 0.7317683, -0.14506, 0.5294118, 0, 1, 1,
0.6658419, -0.145648, 2.452423, 0.5372549, 0, 1, 1,
0.6751009, 1.283098, 0.0146519, 0.5411765, 0, 1, 1,
0.6751258, 0.4993833, 1.401002, 0.5490196, 0, 1, 1,
0.675175, -1.901757, 1.053261, 0.5529412, 0, 1, 1,
0.6790143, 0.2787673, 1.617049, 0.5607843, 0, 1, 1,
0.6845835, -0.7926731, 2.03748, 0.5647059, 0, 1, 1,
0.6862634, -1.201286, 4.424352, 0.572549, 0, 1, 1,
0.6863799, -1.362063, 3.340974, 0.5764706, 0, 1, 1,
0.6868592, 0.8782635, 0.3509305, 0.5843138, 0, 1, 1,
0.6878462, 1.446088, 0.4374164, 0.5882353, 0, 1, 1,
0.6926808, 0.4661557, 1.565663, 0.5960785, 0, 1, 1,
0.6942583, 1.192222, 0.1838958, 0.6039216, 0, 1, 1,
0.6947784, -0.2886842, 0.8047189, 0.6078432, 0, 1, 1,
0.6991016, 1.666795, -1.206896, 0.6156863, 0, 1, 1,
0.7220089, -0.1271345, 1.837658, 0.6196079, 0, 1, 1,
0.7237479, 0.6108956, -0.7877229, 0.627451, 0, 1, 1,
0.7239439, -0.2372164, 2.646723, 0.6313726, 0, 1, 1,
0.7246715, 0.2677726, 0.1295786, 0.6392157, 0, 1, 1,
0.729524, 1.207972, -0.4900096, 0.6431373, 0, 1, 1,
0.732265, -0.4175043, 2.006598, 0.6509804, 0, 1, 1,
0.737259, 0.8919709, 1.476944, 0.654902, 0, 1, 1,
0.7377784, 0.7296555, 0.8758243, 0.6627451, 0, 1, 1,
0.7391871, -0.595212, 2.090342, 0.6666667, 0, 1, 1,
0.7409415, -0.0205515, 2.091448, 0.6745098, 0, 1, 1,
0.7412483, 0.09346396, 0.8063697, 0.6784314, 0, 1, 1,
0.7427003, -0.6532924, 2.811694, 0.6862745, 0, 1, 1,
0.7553542, -0.8595412, 2.959243, 0.6901961, 0, 1, 1,
0.7580842, 0.5238556, 1.087092, 0.6980392, 0, 1, 1,
0.7670844, 0.0006215299, 0.7811915, 0.7058824, 0, 1, 1,
0.7711248, 0.5485039, 1.690433, 0.7098039, 0, 1, 1,
0.7719698, 0.9294403, 0.3304977, 0.7176471, 0, 1, 1,
0.7793161, 1.01125, 0.7011274, 0.7215686, 0, 1, 1,
0.7797235, 0.2399758, 1.373314, 0.7294118, 0, 1, 1,
0.7831281, 2.26907, -1.109496, 0.7333333, 0, 1, 1,
0.7918482, -0.259308, 4.355469, 0.7411765, 0, 1, 1,
0.7931018, -0.9182861, 3.251637, 0.7450981, 0, 1, 1,
0.7981185, 0.06737146, 1.901196, 0.7529412, 0, 1, 1,
0.7999988, -0.3983309, 0.8490072, 0.7568628, 0, 1, 1,
0.8041528, -1.346135, 3.683817, 0.7647059, 0, 1, 1,
0.8057321, 1.025643, 0.13534, 0.7686275, 0, 1, 1,
0.8088317, 0.5890302, 0.8589587, 0.7764706, 0, 1, 1,
0.8117015, 0.6711078, 1.142759, 0.7803922, 0, 1, 1,
0.8125818, 0.3635796, 1.017129, 0.7882353, 0, 1, 1,
0.8146896, 0.5410877, -0.7417158, 0.7921569, 0, 1, 1,
0.8164622, 0.9354189, -1.70751, 0.8, 0, 1, 1,
0.8193321, -0.5256202, 3.646654, 0.8078431, 0, 1, 1,
0.8208989, -0.750873, 1.749603, 0.8117647, 0, 1, 1,
0.8268895, 0.3969581, 1.678365, 0.8196079, 0, 1, 1,
0.8318909, -0.5821823, 2.78598, 0.8235294, 0, 1, 1,
0.8332461, 0.4129978, 0.4202038, 0.8313726, 0, 1, 1,
0.8353613, -0.5325367, 1.330812, 0.8352941, 0, 1, 1,
0.8372275, 0.369302, 3.406532, 0.8431373, 0, 1, 1,
0.8403416, 0.1845916, 2.398668, 0.8470588, 0, 1, 1,
0.8404526, 0.1742952, 0.4032211, 0.854902, 0, 1, 1,
0.8433659, -1.208796, 2.693624, 0.8588235, 0, 1, 1,
0.8482518, -2.073557, 3.608535, 0.8666667, 0, 1, 1,
0.8488393, 0.1765569, 1.032124, 0.8705882, 0, 1, 1,
0.8489689, 0.4707642, 1.156106, 0.8784314, 0, 1, 1,
0.8489764, -0.9982907, 2.614758, 0.8823529, 0, 1, 1,
0.8555139, 1.458968, 0.8634746, 0.8901961, 0, 1, 1,
0.8581889, -0.7403113, 3.056895, 0.8941177, 0, 1, 1,
0.8642777, 0.4535394, 2.986827, 0.9019608, 0, 1, 1,
0.8643931, 0.1605172, 1.291718, 0.9098039, 0, 1, 1,
0.8676534, -1.058704, 3.425682, 0.9137255, 0, 1, 1,
0.8778058, -0.1019812, 1.861454, 0.9215686, 0, 1, 1,
0.8779474, -0.4197428, 2.029186, 0.9254902, 0, 1, 1,
0.8816512, 0.6348377, 2.192244, 0.9333333, 0, 1, 1,
0.8861115, 0.1655119, 0.691979, 0.9372549, 0, 1, 1,
0.8867548, 0.2330707, 0.9431698, 0.945098, 0, 1, 1,
0.8887303, -0.6532111, 3.121741, 0.9490196, 0, 1, 1,
0.8929452, -1.761665, 4.890369, 0.9568627, 0, 1, 1,
0.8975512, -1.197594, 1.126755, 0.9607843, 0, 1, 1,
0.8981192, 2.16601, 0.1557641, 0.9686275, 0, 1, 1,
0.9059895, 1.851333, 1.216464, 0.972549, 0, 1, 1,
0.9163725, -0.512573, 1.623563, 0.9803922, 0, 1, 1,
0.9168147, -0.2338784, 1.576136, 0.9843137, 0, 1, 1,
0.918057, -0.5553704, 2.889485, 0.9921569, 0, 1, 1,
0.9186478, 1.165036, -0.006024187, 0.9960784, 0, 1, 1,
0.9212157, 1.38197, 1.445077, 1, 0, 0.9960784, 1,
0.9227352, 0.3358396, 0.6325375, 1, 0, 0.9882353, 1,
0.9259242, 0.2058089, 2.595303, 1, 0, 0.9843137, 1,
0.9331774, -0.7168279, 2.635759, 1, 0, 0.9764706, 1,
0.9364651, -0.7586827, 2.177566, 1, 0, 0.972549, 1,
0.9559849, -1.029781, 0.08991516, 1, 0, 0.9647059, 1,
0.9587583, 1.305063, 1.224521, 1, 0, 0.9607843, 1,
0.9607342, 0.477287, -0.5633781, 1, 0, 0.9529412, 1,
0.9612567, -0.6428825, 3.460277, 1, 0, 0.9490196, 1,
0.9616038, -1.428689, 1.562173, 1, 0, 0.9411765, 1,
0.9637148, -0.1777575, 1.908903, 1, 0, 0.9372549, 1,
0.9706056, 0.6800856, 0.4936913, 1, 0, 0.9294118, 1,
0.9737506, 0.4369193, 0.184992, 1, 0, 0.9254902, 1,
0.9740598, 1.2037, 2.993107, 1, 0, 0.9176471, 1,
0.9755263, 0.4427271, 1.502568, 1, 0, 0.9137255, 1,
0.9757463, 0.6375733, 2.05052, 1, 0, 0.9058824, 1,
0.9811763, 0.01176847, 2.225436, 1, 0, 0.9019608, 1,
0.9832156, 0.7286965, 1.353198, 1, 0, 0.8941177, 1,
0.9848087, -0.6836771, 0.9203549, 1, 0, 0.8862745, 1,
0.9848754, -0.9453593, 1.154742, 1, 0, 0.8823529, 1,
0.9852713, -3.407037, 3.961385, 1, 0, 0.8745098, 1,
0.9871604, -0.5163164, 0.8329812, 1, 0, 0.8705882, 1,
0.9936777, -0.007362486, 2.672644, 1, 0, 0.8627451, 1,
0.9989371, -1.074336, 3.428434, 1, 0, 0.8588235, 1,
1.002315, 0.2278865, 2.185485, 1, 0, 0.8509804, 1,
1.007578, -0.7319759, 1.506219, 1, 0, 0.8470588, 1,
1.011576, -1.101823, 2.256265, 1, 0, 0.8392157, 1,
1.012673, -1.607845, 2.877985, 1, 0, 0.8352941, 1,
1.018283, 0.1362385, 3.328566, 1, 0, 0.827451, 1,
1.019986, -1.359634, 2.312934, 1, 0, 0.8235294, 1,
1.028534, -0.4357051, 1.500931, 1, 0, 0.8156863, 1,
1.0298, 1.248683, -0.1882238, 1, 0, 0.8117647, 1,
1.036288, -0.7230452, 0.1060838, 1, 0, 0.8039216, 1,
1.037784, 0.4740124, 0.4551885, 1, 0, 0.7960784, 1,
1.038103, -1.014243, 3.539413, 1, 0, 0.7921569, 1,
1.050364, -1.359428, 0.8753317, 1, 0, 0.7843137, 1,
1.055593, -2.428194, 4.091964, 1, 0, 0.7803922, 1,
1.059586, -0.3822297, 0.3715758, 1, 0, 0.772549, 1,
1.06309, 0.1842611, -0.08921687, 1, 0, 0.7686275, 1,
1.063984, 2.415398, -0.9361107, 1, 0, 0.7607843, 1,
1.068841, 0.9494922, 0.248234, 1, 0, 0.7568628, 1,
1.078154, 2.063187, 0.8890098, 1, 0, 0.7490196, 1,
1.086522, -1.739615, 2.191031, 1, 0, 0.7450981, 1,
1.088488, -0.9696058, 2.466703, 1, 0, 0.7372549, 1,
1.097844, 0.7317377, 0.6607068, 1, 0, 0.7333333, 1,
1.105295, 0.03155781, 2.491111, 1, 0, 0.7254902, 1,
1.108657, -1.281444, 0.1263155, 1, 0, 0.7215686, 1,
1.109635, 0.5405124, -0.4034822, 1, 0, 0.7137255, 1,
1.110684, -0.320397, 2.131202, 1, 0, 0.7098039, 1,
1.110858, -0.3095412, 3.059644, 1, 0, 0.7019608, 1,
1.119811, -0.9389776, 2.048868, 1, 0, 0.6941177, 1,
1.121576, 0.7381584, 2.325783, 1, 0, 0.6901961, 1,
1.14071, 0.0983532, 0.5087444, 1, 0, 0.682353, 1,
1.142391, 2.824559, -0.05613444, 1, 0, 0.6784314, 1,
1.150284, -0.3866107, 2.308399, 1, 0, 0.6705883, 1,
1.153125, -1.339182, 2.328941, 1, 0, 0.6666667, 1,
1.158224, -1.005686, 2.317104, 1, 0, 0.6588235, 1,
1.163929, -1.010235, 2.106222, 1, 0, 0.654902, 1,
1.17686, 0.8780094, 0.06092318, 1, 0, 0.6470588, 1,
1.180034, 1.301482, -1.208074, 1, 0, 0.6431373, 1,
1.181528, -0.1313887, 1.718486, 1, 0, 0.6352941, 1,
1.195364, -1.016225, 2.236714, 1, 0, 0.6313726, 1,
1.196818, 1.103198, 0.2131673, 1, 0, 0.6235294, 1,
1.200196, 2.64969, 1.975753, 1, 0, 0.6196079, 1,
1.214702, -1.002324, 1.278325, 1, 0, 0.6117647, 1,
1.215003, -0.1451292, 2.000249, 1, 0, 0.6078432, 1,
1.221923, -1.061847, 3.016682, 1, 0, 0.6, 1,
1.224409, -0.7323976, 3.072771, 1, 0, 0.5921569, 1,
1.224768, -2.291636, 2.06443, 1, 0, 0.5882353, 1,
1.237619, 0.8391079, -1.088389, 1, 0, 0.5803922, 1,
1.243121, -0.6087501, 3.266286, 1, 0, 0.5764706, 1,
1.245884, 0.2653925, 0.237339, 1, 0, 0.5686275, 1,
1.26823, 0.09262594, -0.135908, 1, 0, 0.5647059, 1,
1.27465, 0.7820256, 0.6694245, 1, 0, 0.5568628, 1,
1.280507, -1.092855, 1.386246, 1, 0, 0.5529412, 1,
1.281653, 0.7349669, 1.497125, 1, 0, 0.5450981, 1,
1.291293, -1.541225, 2.995233, 1, 0, 0.5411765, 1,
1.296736, -0.4326308, 0.6999124, 1, 0, 0.5333334, 1,
1.306095, 0.6350315, 2.071193, 1, 0, 0.5294118, 1,
1.311057, -0.703422, 2.355058, 1, 0, 0.5215687, 1,
1.321538, -0.9654134, 2.272265, 1, 0, 0.5176471, 1,
1.324053, 0.5452834, 0.7138387, 1, 0, 0.509804, 1,
1.326504, -0.08763277, 1.687254, 1, 0, 0.5058824, 1,
1.329738, -0.9678527, 1.798597, 1, 0, 0.4980392, 1,
1.333317, -0.4007291, 2.755982, 1, 0, 0.4901961, 1,
1.343386, -0.1096911, 2.387836, 1, 0, 0.4862745, 1,
1.343609, 0.8774894, 0.6815483, 1, 0, 0.4784314, 1,
1.348859, -0.398876, 0.7495399, 1, 0, 0.4745098, 1,
1.35018, -3.147025, 3.684154, 1, 0, 0.4666667, 1,
1.350202, 0.1777462, 0.7478997, 1, 0, 0.4627451, 1,
1.360617, 2.092099, -2.032413, 1, 0, 0.454902, 1,
1.367192, 0.2513992, 1.716469, 1, 0, 0.4509804, 1,
1.370701, 1.053647, 0.4750766, 1, 0, 0.4431373, 1,
1.379744, 0.6387522, 0.9727319, 1, 0, 0.4392157, 1,
1.380629, -0.1257188, 3.133087, 1, 0, 0.4313726, 1,
1.380992, -0.3947888, 3.595001, 1, 0, 0.427451, 1,
1.387828, -0.2507978, 1.695388, 1, 0, 0.4196078, 1,
1.388779, -0.04019248, 0.920417, 1, 0, 0.4156863, 1,
1.417393, 1.98659, 0.8897313, 1, 0, 0.4078431, 1,
1.429237, -0.7171828, 1.744866, 1, 0, 0.4039216, 1,
1.432532, 1.154224, 0.8894808, 1, 0, 0.3960784, 1,
1.443519, -0.9408852, 2.179163, 1, 0, 0.3882353, 1,
1.445797, 1.203074, 0.4384848, 1, 0, 0.3843137, 1,
1.451715, -0.5122321, 0.5691219, 1, 0, 0.3764706, 1,
1.460515, 0.8527619, 0.1210219, 1, 0, 0.372549, 1,
1.464526, -0.5371442, 3.966534, 1, 0, 0.3647059, 1,
1.469879, -0.1494348, 1.868718, 1, 0, 0.3607843, 1,
1.476155, 1.514899, 0.9381867, 1, 0, 0.3529412, 1,
1.47779, 1.871114, -0.3274592, 1, 0, 0.3490196, 1,
1.478055, -2.142082, 3.955808, 1, 0, 0.3411765, 1,
1.479291, 0.2099265, 2.000867, 1, 0, 0.3372549, 1,
1.488007, -1.246523, 3.729769, 1, 0, 0.3294118, 1,
1.495239, 1.288904, 1.643434, 1, 0, 0.3254902, 1,
1.517276, -0.6834569, 2.016924, 1, 0, 0.3176471, 1,
1.537334, -0.1310706, 3.073752, 1, 0, 0.3137255, 1,
1.545244, 1.569296, 1.027333, 1, 0, 0.3058824, 1,
1.549631, 1.49728, 2.153874, 1, 0, 0.2980392, 1,
1.550813, 1.344044, 1.302014, 1, 0, 0.2941177, 1,
1.57446, 0.6209345, 2.614206, 1, 0, 0.2862745, 1,
1.59425, 2.156631, 0.850816, 1, 0, 0.282353, 1,
1.60121, -0.3137039, 1.773313, 1, 0, 0.2745098, 1,
1.611984, -1.261414, 0.7003156, 1, 0, 0.2705882, 1,
1.61375, 0.167564, 0.9793908, 1, 0, 0.2627451, 1,
1.631738, 0.7224357, 2.13509, 1, 0, 0.2588235, 1,
1.653309, 1.802046, -0.2079237, 1, 0, 0.2509804, 1,
1.656675, 1.599469, 1.82713, 1, 0, 0.2470588, 1,
1.658625, 0.2884655, 1.164118, 1, 0, 0.2392157, 1,
1.697833, -0.5989832, 1.683769, 1, 0, 0.2352941, 1,
1.708979, -1.17074, 0.8955171, 1, 0, 0.227451, 1,
1.714137, 0.3769653, 0.8833096, 1, 0, 0.2235294, 1,
1.725297, 0.2654313, 1.551121, 1, 0, 0.2156863, 1,
1.731007, -1.304336, 3.322081, 1, 0, 0.2117647, 1,
1.740418, 0.8448486, 1.532706, 1, 0, 0.2039216, 1,
1.816327, 0.02529142, 2.20365, 1, 0, 0.1960784, 1,
1.828979, 1.840011, 1.37867, 1, 0, 0.1921569, 1,
1.845683, 0.9842035, -0.7363328, 1, 0, 0.1843137, 1,
1.917553, -0.1909401, 2.405892, 1, 0, 0.1803922, 1,
1.922304, -1.208483, 2.898587, 1, 0, 0.172549, 1,
1.928789, -0.1381482, 1.220416, 1, 0, 0.1686275, 1,
1.960953, -0.4968796, 2.044684, 1, 0, 0.1607843, 1,
1.978155, -1.615818, 0.4879117, 1, 0, 0.1568628, 1,
1.994373, 1.620205, 1.503659, 1, 0, 0.1490196, 1,
2.011102, 0.5597757, 0.4124475, 1, 0, 0.145098, 1,
2.04561, 0.2673967, 3.133232, 1, 0, 0.1372549, 1,
2.061533, -1.154539, 3.440133, 1, 0, 0.1333333, 1,
2.065353, -0.3616351, 1.711351, 1, 0, 0.1254902, 1,
2.084724, -0.5146013, 0.8718233, 1, 0, 0.1215686, 1,
2.086346, 0.9826186, 1.668972, 1, 0, 0.1137255, 1,
2.096572, -0.7615986, 1.110987, 1, 0, 0.1098039, 1,
2.097865, 2.667262, 0.6096454, 1, 0, 0.1019608, 1,
2.148791, -0.5158888, 0.3672502, 1, 0, 0.09411765, 1,
2.17329, 0.5961308, 1.544507, 1, 0, 0.09019608, 1,
2.177181, -0.1042832, 1.224249, 1, 0, 0.08235294, 1,
2.197417, -0.2988829, 3.040149, 1, 0, 0.07843138, 1,
2.203985, -0.3532412, 0.862312, 1, 0, 0.07058824, 1,
2.22134, -1.337908, 2.461639, 1, 0, 0.06666667, 1,
2.369897, 1.426355, -0.2274341, 1, 0, 0.05882353, 1,
2.383353, 0.2077923, 1.289585, 1, 0, 0.05490196, 1,
2.428077, 1.068705, 0.4073291, 1, 0, 0.04705882, 1,
2.447875, -0.2481477, 1.569138, 1, 0, 0.04313726, 1,
2.467779, -1.328058, 1.067767, 1, 0, 0.03529412, 1,
2.526809, 0.2374977, 2.482285, 1, 0, 0.03137255, 1,
2.538483, 0.3636777, 1.503618, 1, 0, 0.02352941, 1,
2.647422, 2.297614, 1.554149, 1, 0, 0.01960784, 1,
2.695378, -1.180675, 3.125461, 1, 0, 0.01176471, 1,
2.981344, 0.1797958, 0.7612325, 1, 0, 0.007843138, 1
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
0.1126423, -4.512838, -7.078493, 0, -0.5, 0.5, 0.5,
0.1126423, -4.512838, -7.078493, 1, -0.5, 0.5, 0.5,
0.1126423, -4.512838, -7.078493, 1, 1.5, 0.5, 0.5,
0.1126423, -4.512838, -7.078493, 0, 1.5, 0.5, 0.5
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
-3.728549, -0.1450881, -7.078493, 0, -0.5, 0.5, 0.5,
-3.728549, -0.1450881, -7.078493, 1, -0.5, 0.5, 0.5,
-3.728549, -0.1450881, -7.078493, 1, 1.5, 0.5, 0.5,
-3.728549, -0.1450881, -7.078493, 0, 1.5, 0.5, 0.5
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
-3.728549, -4.512838, -0.1973562, 0, -0.5, 0.5, 0.5,
-3.728549, -4.512838, -0.1973562, 1, -0.5, 0.5, 0.5,
-3.728549, -4.512838, -0.1973562, 1, 1.5, 0.5, 0.5,
-3.728549, -4.512838, -0.1973562, 0, 1.5, 0.5, 0.5
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
-2, -3.504896, -5.490538,
2, -3.504896, -5.490538,
-2, -3.504896, -5.490538,
-2, -3.672886, -5.755197,
-1, -3.504896, -5.490538,
-1, -3.672886, -5.755197,
0, -3.504896, -5.490538,
0, -3.672886, -5.755197,
1, -3.504896, -5.490538,
1, -3.672886, -5.755197,
2, -3.504896, -5.490538,
2, -3.672886, -5.755197
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
-2, -4.008867, -6.284515, 0, -0.5, 0.5, 0.5,
-2, -4.008867, -6.284515, 1, -0.5, 0.5, 0.5,
-2, -4.008867, -6.284515, 1, 1.5, 0.5, 0.5,
-2, -4.008867, -6.284515, 0, 1.5, 0.5, 0.5,
-1, -4.008867, -6.284515, 0, -0.5, 0.5, 0.5,
-1, -4.008867, -6.284515, 1, -0.5, 0.5, 0.5,
-1, -4.008867, -6.284515, 1, 1.5, 0.5, 0.5,
-1, -4.008867, -6.284515, 0, 1.5, 0.5, 0.5,
0, -4.008867, -6.284515, 0, -0.5, 0.5, 0.5,
0, -4.008867, -6.284515, 1, -0.5, 0.5, 0.5,
0, -4.008867, -6.284515, 1, 1.5, 0.5, 0.5,
0, -4.008867, -6.284515, 0, 1.5, 0.5, 0.5,
1, -4.008867, -6.284515, 0, -0.5, 0.5, 0.5,
1, -4.008867, -6.284515, 1, -0.5, 0.5, 0.5,
1, -4.008867, -6.284515, 1, 1.5, 0.5, 0.5,
1, -4.008867, -6.284515, 0, 1.5, 0.5, 0.5,
2, -4.008867, -6.284515, 0, -0.5, 0.5, 0.5,
2, -4.008867, -6.284515, 1, -0.5, 0.5, 0.5,
2, -4.008867, -6.284515, 1, 1.5, 0.5, 0.5,
2, -4.008867, -6.284515, 0, 1.5, 0.5, 0.5
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
-2.84212, -3, -5.490538,
-2.84212, 3, -5.490538,
-2.84212, -3, -5.490538,
-2.989859, -3, -5.755197,
-2.84212, -2, -5.490538,
-2.989859, -2, -5.755197,
-2.84212, -1, -5.490538,
-2.989859, -1, -5.755197,
-2.84212, 0, -5.490538,
-2.989859, 0, -5.755197,
-2.84212, 1, -5.490538,
-2.989859, 1, -5.755197,
-2.84212, 2, -5.490538,
-2.989859, 2, -5.755197,
-2.84212, 3, -5.490538,
-2.989859, 3, -5.755197
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
-3.285335, -3, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, -3, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, -3, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, -3, -6.284515, 0, 1.5, 0.5, 0.5,
-3.285335, -2, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, -2, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, -2, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, -2, -6.284515, 0, 1.5, 0.5, 0.5,
-3.285335, -1, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, -1, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, -1, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, -1, -6.284515, 0, 1.5, 0.5, 0.5,
-3.285335, 0, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, 0, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, 0, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, 0, -6.284515, 0, 1.5, 0.5, 0.5,
-3.285335, 1, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, 1, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, 1, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, 1, -6.284515, 0, 1.5, 0.5, 0.5,
-3.285335, 2, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, 2, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, 2, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, 2, -6.284515, 0, 1.5, 0.5, 0.5,
-3.285335, 3, -6.284515, 0, -0.5, 0.5, 0.5,
-3.285335, 3, -6.284515, 1, -0.5, 0.5, 0.5,
-3.285335, 3, -6.284515, 1, 1.5, 0.5, 0.5,
-3.285335, 3, -6.284515, 0, 1.5, 0.5, 0.5
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
-2.84212, -3.504896, -4,
-2.84212, -3.504896, 4,
-2.84212, -3.504896, -4,
-2.989859, -3.672886, -4,
-2.84212, -3.504896, -2,
-2.989859, -3.672886, -2,
-2.84212, -3.504896, 0,
-2.989859, -3.672886, 0,
-2.84212, -3.504896, 2,
-2.989859, -3.672886, 2,
-2.84212, -3.504896, 4,
-2.989859, -3.672886, 4
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
-3.285335, -4.008867, -4, 0, -0.5, 0.5, 0.5,
-3.285335, -4.008867, -4, 1, -0.5, 0.5, 0.5,
-3.285335, -4.008867, -4, 1, 1.5, 0.5, 0.5,
-3.285335, -4.008867, -4, 0, 1.5, 0.5, 0.5,
-3.285335, -4.008867, -2, 0, -0.5, 0.5, 0.5,
-3.285335, -4.008867, -2, 1, -0.5, 0.5, 0.5,
-3.285335, -4.008867, -2, 1, 1.5, 0.5, 0.5,
-3.285335, -4.008867, -2, 0, 1.5, 0.5, 0.5,
-3.285335, -4.008867, 0, 0, -0.5, 0.5, 0.5,
-3.285335, -4.008867, 0, 1, -0.5, 0.5, 0.5,
-3.285335, -4.008867, 0, 1, 1.5, 0.5, 0.5,
-3.285335, -4.008867, 0, 0, 1.5, 0.5, 0.5,
-3.285335, -4.008867, 2, 0, -0.5, 0.5, 0.5,
-3.285335, -4.008867, 2, 1, -0.5, 0.5, 0.5,
-3.285335, -4.008867, 2, 1, 1.5, 0.5, 0.5,
-3.285335, -4.008867, 2, 0, 1.5, 0.5, 0.5,
-3.285335, -4.008867, 4, 0, -0.5, 0.5, 0.5,
-3.285335, -4.008867, 4, 1, -0.5, 0.5, 0.5,
-3.285335, -4.008867, 4, 1, 1.5, 0.5, 0.5,
-3.285335, -4.008867, 4, 0, 1.5, 0.5, 0.5
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
-2.84212, -3.504896, -5.490538,
-2.84212, 3.21472, -5.490538,
-2.84212, -3.504896, 5.095826,
-2.84212, 3.21472, 5.095826,
-2.84212, -3.504896, -5.490538,
-2.84212, -3.504896, 5.095826,
-2.84212, 3.21472, -5.490538,
-2.84212, 3.21472, 5.095826,
-2.84212, -3.504896, -5.490538,
3.067405, -3.504896, -5.490538,
-2.84212, -3.504896, 5.095826,
3.067405, -3.504896, 5.095826,
-2.84212, 3.21472, -5.490538,
3.067405, 3.21472, -5.490538,
-2.84212, 3.21472, 5.095826,
3.067405, 3.21472, 5.095826,
3.067405, -3.504896, -5.490538,
3.067405, 3.21472, -5.490538,
3.067405, -3.504896, 5.095826,
3.067405, 3.21472, 5.095826,
3.067405, -3.504896, -5.490538,
3.067405, -3.504896, 5.095826,
3.067405, 3.21472, -5.490538,
3.067405, 3.21472, 5.095826
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
var radius = 7.401881;
var distance = 32.9318;
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
mvMatrix.translate( -0.1126423, 0.1450881, 0.1973562 );
mvMatrix.scale( 1.354264, 1.190999, 0.755978 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.9318);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fluoridamid<-read.table("fluoridamid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluoridamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
```

```r
y<-fluoridamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
```

```r
z<-fluoridamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluoridamid' not found
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
-2.756059, 0.9923992, -1.230714, 0, 0, 1, 1, 1,
-2.729123, 1.179847, -0.6198258, 1, 0, 0, 1, 1,
-2.651065, 0.1927229, -2.433008, 1, 0, 0, 1, 1,
-2.643697, 0.7291838, -1.220667, 1, 0, 0, 1, 1,
-2.566028, -0.212107, -1.058541, 1, 0, 0, 1, 1,
-2.44033, 1.326939, -0.05511067, 1, 0, 0, 1, 1,
-2.383117, 1.526732, -1.888993, 0, 0, 0, 1, 1,
-2.310724, 0.1253046, -0.9680913, 0, 0, 0, 1, 1,
-2.300212, 0.3940873, -2.699179, 0, 0, 0, 1, 1,
-2.234593, -0.3227224, -2.138235, 0, 0, 0, 1, 1,
-2.22318, -0.3090854, -0.6701487, 0, 0, 0, 1, 1,
-2.138178, 0.7328969, -0.8189601, 0, 0, 0, 1, 1,
-2.105924, 0.1565548, -2.314914, 0, 0, 0, 1, 1,
-2.100511, 0.2863905, -1.922081, 1, 1, 1, 1, 1,
-2.046408, -1.433365, -2.933201, 1, 1, 1, 1, 1,
-2.002949, 1.612905, -0.9474417, 1, 1, 1, 1, 1,
-1.995411, 0.5499567, -1.025542, 1, 1, 1, 1, 1,
-1.977831, -0.4347396, -1.985259, 1, 1, 1, 1, 1,
-1.957719, 1.723117, -0.7361587, 1, 1, 1, 1, 1,
-1.943324, -0.963089, -1.828829, 1, 1, 1, 1, 1,
-1.939759, -0.5772644, -2.468765, 1, 1, 1, 1, 1,
-1.927082, -1.625531, -2.048573, 1, 1, 1, 1, 1,
-1.920231, -0.5851804, -1.097838, 1, 1, 1, 1, 1,
-1.918291, 0.2658313, -0.8293355, 1, 1, 1, 1, 1,
-1.886894, 1.123717, -2.024038, 1, 1, 1, 1, 1,
-1.886376, -1.54578, -2.980361, 1, 1, 1, 1, 1,
-1.875336, -0.2286935, -2.68176, 1, 1, 1, 1, 1,
-1.869321, -0.8739529, -1.69608, 1, 1, 1, 1, 1,
-1.836143, 0.7179849, 3.411021, 0, 0, 1, 1, 1,
-1.814457, 0.4741809, -1.238738, 1, 0, 0, 1, 1,
-1.811589, -0.6165218, -1.780924, 1, 0, 0, 1, 1,
-1.800939, 0.7525535, 0.06426643, 1, 0, 0, 1, 1,
-1.793995, 0.6349626, -0.9996068, 1, 0, 0, 1, 1,
-1.788148, 0.2152977, -2.561157, 1, 0, 0, 1, 1,
-1.777402, 0.9418185, -2.09089, 0, 0, 0, 1, 1,
-1.771303, -1.323571, -3.087509, 0, 0, 0, 1, 1,
-1.74805, 0.04037993, -0.5499809, 0, 0, 0, 1, 1,
-1.739754, 0.3445047, -2.4914, 0, 0, 0, 1, 1,
-1.71863, -0.02506394, -2.452724, 0, 0, 0, 1, 1,
-1.716979, -0.6409122, -3.613338, 0, 0, 0, 1, 1,
-1.709318, -0.836849, -2.067348, 0, 0, 0, 1, 1,
-1.693169, -1.007052, -1.958103, 1, 1, 1, 1, 1,
-1.688972, 1.111492, -1.554669, 1, 1, 1, 1, 1,
-1.682492, 0.5340235, -0.7231762, 1, 1, 1, 1, 1,
-1.668939, -0.6956121, -3.058691, 1, 1, 1, 1, 1,
-1.666801, 1.688253, -1.044709, 1, 1, 1, 1, 1,
-1.651639, 0.2389213, -2.065661, 1, 1, 1, 1, 1,
-1.617473, -0.523159, -3.840391, 1, 1, 1, 1, 1,
-1.616444, -0.9683601, -3.311716, 1, 1, 1, 1, 1,
-1.616228, 0.816342, 0.07508405, 1, 1, 1, 1, 1,
-1.611087, -2.61452, -4.130484, 1, 1, 1, 1, 1,
-1.609205, -0.3568434, -1.49615, 1, 1, 1, 1, 1,
-1.5889, -0.1768496, -1.791314, 1, 1, 1, 1, 1,
-1.587478, -1.591537, -1.121706, 1, 1, 1, 1, 1,
-1.581732, 1.810941, 0.8837016, 1, 1, 1, 1, 1,
-1.577265, -0.952003, -1.894109, 1, 1, 1, 1, 1,
-1.571554, 0.8655254, -0.7121678, 0, 0, 1, 1, 1,
-1.565768, -1.216971, -0.4562977, 1, 0, 0, 1, 1,
-1.554579, 0.3595193, -1.488134, 1, 0, 0, 1, 1,
-1.541694, 1.105359, -1.33996, 1, 0, 0, 1, 1,
-1.540586, 0.09838997, -1.816293, 1, 0, 0, 1, 1,
-1.538969, -0.498532, -4.401194, 1, 0, 0, 1, 1,
-1.530371, 1.844206, -1.212137, 0, 0, 0, 1, 1,
-1.51915, -0.99819, -3.418904, 0, 0, 0, 1, 1,
-1.51443, 0.5439277, -2.488435, 0, 0, 0, 1, 1,
-1.512271, 1.361248, -1.839871, 0, 0, 0, 1, 1,
-1.49777, -0.4815387, -2.194353, 0, 0, 0, 1, 1,
-1.494971, -0.9185448, -1.247201, 0, 0, 0, 1, 1,
-1.488538, -2.314731, -4.117144, 0, 0, 0, 1, 1,
-1.483201, -0.4703418, -1.913247, 1, 1, 1, 1, 1,
-1.482893, -1.153506, -0.5345839, 1, 1, 1, 1, 1,
-1.479027, -0.5518225, -2.251628, 1, 1, 1, 1, 1,
-1.476484, -0.414966, -2.678296, 1, 1, 1, 1, 1,
-1.476223, -0.3124755, -2.055418, 1, 1, 1, 1, 1,
-1.474783, 0.3368434, -1.620148, 1, 1, 1, 1, 1,
-1.46539, 1.536733, -1.73036, 1, 1, 1, 1, 1,
-1.464302, -1.01184, -2.783284, 1, 1, 1, 1, 1,
-1.461305, -1.350881, -1.873583, 1, 1, 1, 1, 1,
-1.450654, -2.003164, -2.176391, 1, 1, 1, 1, 1,
-1.442633, 1.521304, 1.79221, 1, 1, 1, 1, 1,
-1.440062, 0.6761241, -1.581082, 1, 1, 1, 1, 1,
-1.426297, -1.74103, -2.184789, 1, 1, 1, 1, 1,
-1.418929, 0.4564336, 0.07367917, 1, 1, 1, 1, 1,
-1.412986, 0.1203036, -2.566077, 1, 1, 1, 1, 1,
-1.410106, 1.920657, 1.351033, 0, 0, 1, 1, 1,
-1.408762, -0.1051987, -1.595844, 1, 0, 0, 1, 1,
-1.401391, 0.1789891, -3.380607, 1, 0, 0, 1, 1,
-1.397969, 0.3625774, -3.265275, 1, 0, 0, 1, 1,
-1.396787, -0.1847201, -0.9452436, 1, 0, 0, 1, 1,
-1.39444, -1.036671, -3.024662, 1, 0, 0, 1, 1,
-1.390754, 0.0259882, -0.1376776, 0, 0, 0, 1, 1,
-1.383935, 0.223705, -0.8691378, 0, 0, 0, 1, 1,
-1.381072, 0.4813091, -2.119114, 0, 0, 0, 1, 1,
-1.374283, -0.4612855, -2.925209, 0, 0, 0, 1, 1,
-1.368314, -0.4735916, -1.470247, 0, 0, 0, 1, 1,
-1.364817, 2.740057, -1.411494, 0, 0, 0, 1, 1,
-1.363586, -1.983056, -3.155329, 0, 0, 0, 1, 1,
-1.356014, -0.04107042, -2.921445, 1, 1, 1, 1, 1,
-1.35538, 0.9974335, -0.3938109, 1, 1, 1, 1, 1,
-1.341246, 0.4520732, -2.136007, 1, 1, 1, 1, 1,
-1.340193, 0.9031854, -0.008486192, 1, 1, 1, 1, 1,
-1.339646, 0.6512026, -2.049884, 1, 1, 1, 1, 1,
-1.338165, -1.240346, -0.7513973, 1, 1, 1, 1, 1,
-1.338066, -0.9974356, -2.488, 1, 1, 1, 1, 1,
-1.324024, 2.061428, -0.4004987, 1, 1, 1, 1, 1,
-1.322513, -0.295518, -1.283168, 1, 1, 1, 1, 1,
-1.309297, 0.5769138, -0.2528668, 1, 1, 1, 1, 1,
-1.305998, -0.03353694, -3.428934, 1, 1, 1, 1, 1,
-1.303092, -0.3368783, -0.07874791, 1, 1, 1, 1, 1,
-1.299762, -0.4481116, -1.63797, 1, 1, 1, 1, 1,
-1.298626, -0.7332383, -2.131577, 1, 1, 1, 1, 1,
-1.293309, 0.3621849, -1.935594, 1, 1, 1, 1, 1,
-1.293091, 0.9476514, -2.549184, 0, 0, 1, 1, 1,
-1.292368, 0.6121391, -2.054328, 1, 0, 0, 1, 1,
-1.275007, 1.0172, -0.4156711, 1, 0, 0, 1, 1,
-1.2743, 0.7493283, 0.8182333, 1, 0, 0, 1, 1,
-1.273995, 0.1862243, -1.734191, 1, 0, 0, 1, 1,
-1.268663, 0.4204084, -2.263008, 1, 0, 0, 1, 1,
-1.264752, 1.77139, 0.03420604, 0, 0, 0, 1, 1,
-1.261493, -0.7188527, -1.620408, 0, 0, 0, 1, 1,
-1.261256, -1.051879, -4.282024, 0, 0, 0, 1, 1,
-1.252308, -0.3819526, -2.60498, 0, 0, 0, 1, 1,
-1.252018, 0.468524, 0.269071, 0, 0, 0, 1, 1,
-1.250272, -0.6058847, -1.694996, 0, 0, 0, 1, 1,
-1.242253, 0.1064284, -1.262252, 0, 0, 0, 1, 1,
-1.230975, -1.270362, -0.1648825, 1, 1, 1, 1, 1,
-1.229267, -0.3085994, -0.7872933, 1, 1, 1, 1, 1,
-1.225309, -0.2124635, -2.003127, 1, 1, 1, 1, 1,
-1.22376, 1.728769, 0.5056096, 1, 1, 1, 1, 1,
-1.212274, 0.3730896, -1.352046, 1, 1, 1, 1, 1,
-1.210496, 0.7477683, -0.3487726, 1, 1, 1, 1, 1,
-1.210354, 0.1608962, -1.649903, 1, 1, 1, 1, 1,
-1.204125, 0.3740182, -1.22855, 1, 1, 1, 1, 1,
-1.202349, -0.3091202, -2.603243, 1, 1, 1, 1, 1,
-1.198015, -1.932656, -3.228086, 1, 1, 1, 1, 1,
-1.187036, -0.7520143, -3.791199, 1, 1, 1, 1, 1,
-1.186892, 1.439497, -0.5436975, 1, 1, 1, 1, 1,
-1.175514, 0.3935656, -1.388942, 1, 1, 1, 1, 1,
-1.175342, 0.455722, -0.8945469, 1, 1, 1, 1, 1,
-1.171469, 0.9497088, 0.2949504, 1, 1, 1, 1, 1,
-1.169953, 0.8344235, -0.2734277, 0, 0, 1, 1, 1,
-1.162648, -0.603187, -3.208674, 1, 0, 0, 1, 1,
-1.162405, -1.591653, -2.583804, 1, 0, 0, 1, 1,
-1.153039, 0.1996635, -2.844431, 1, 0, 0, 1, 1,
-1.1511, -0.4152398, -0.5795972, 1, 0, 0, 1, 1,
-1.137955, 0.6964453, -1.766654, 1, 0, 0, 1, 1,
-1.136422, 0.002991741, -1.875727, 0, 0, 0, 1, 1,
-1.134871, -1.364479, -1.323097, 0, 0, 0, 1, 1,
-1.13278, -1.191496, -2.233859, 0, 0, 0, 1, 1,
-1.129332, 1.480778, -0.5952652, 0, 0, 0, 1, 1,
-1.126011, -0.4440768, -2.163415, 0, 0, 0, 1, 1,
-1.121773, 2.317475, -1.73967, 0, 0, 0, 1, 1,
-1.121514, -0.4522256, -3.59896, 0, 0, 0, 1, 1,
-1.111155, 0.3001852, 0.03826285, 1, 1, 1, 1, 1,
-1.11053, -0.954562, -3.443963, 1, 1, 1, 1, 1,
-1.108836, 0.3423105, -1.549219, 1, 1, 1, 1, 1,
-1.10799, -1.008787, -1.9651, 1, 1, 1, 1, 1,
-1.107109, 1.371934, -1.043337, 1, 1, 1, 1, 1,
-1.100523, 1.197229, 1.209837, 1, 1, 1, 1, 1,
-1.1002, 1.844094, -2.688395, 1, 1, 1, 1, 1,
-1.098984, 0.4765195, -0.9056069, 1, 1, 1, 1, 1,
-1.091829, -0.6147813, -2.595607, 1, 1, 1, 1, 1,
-1.088485, -0.1628946, -2.620352, 1, 1, 1, 1, 1,
-1.083692, -2.182618, -0.05698178, 1, 1, 1, 1, 1,
-1.079979, 1.614367, 0.701875, 1, 1, 1, 1, 1,
-1.073638, -0.377266, -0.5198649, 1, 1, 1, 1, 1,
-1.06997, -0.6420361, -3.351711, 1, 1, 1, 1, 1,
-1.069935, 0.2554283, -1.116341, 1, 1, 1, 1, 1,
-1.062372, 0.7665378, -0.8920801, 0, 0, 1, 1, 1,
-1.060522, -0.5183415, -2.074253, 1, 0, 0, 1, 1,
-1.057235, 0.1707838, -0.3334024, 1, 0, 0, 1, 1,
-1.053656, 0.2113527, -2.044931, 1, 0, 0, 1, 1,
-1.052085, 1.288687, -1.428005, 1, 0, 0, 1, 1,
-1.045034, 0.7565042, -2.357462, 1, 0, 0, 1, 1,
-1.040541, 0.2775305, -0.0749649, 0, 0, 0, 1, 1,
-1.026033, -0.2850977, -2.382135, 0, 0, 0, 1, 1,
-1.024105, -0.02745086, -0.5732578, 0, 0, 0, 1, 1,
-1.017474, -0.112312, -1.589702, 0, 0, 0, 1, 1,
-1.014591, 2.533686, -0.2002522, 0, 0, 0, 1, 1,
-1.013788, 1.397586, -1.805195, 0, 0, 0, 1, 1,
-1.009241, 1.653658, -1.939343, 0, 0, 0, 1, 1,
-1.006461, 1.316484, -0.7205733, 1, 1, 1, 1, 1,
-1.003623, 0.6182903, -0.6367648, 1, 1, 1, 1, 1,
-1.00359, 1.710332, 0.5295695, 1, 1, 1, 1, 1,
-1.003335, -1.003413, -1.955227, 1, 1, 1, 1, 1,
-1.002378, -0.9507372, -1.151762, 1, 1, 1, 1, 1,
-1.002168, 0.1205191, -1.973918, 1, 1, 1, 1, 1,
-0.9994507, 1.21591, -2.043224, 1, 1, 1, 1, 1,
-0.9986125, 0.3543165, -1.663793, 1, 1, 1, 1, 1,
-0.9909908, -0.02040312, -1.659481, 1, 1, 1, 1, 1,
-0.9858169, 1.007391, -0.050409, 1, 1, 1, 1, 1,
-0.9773023, 1.537066, 0.05998357, 1, 1, 1, 1, 1,
-0.9753222, -1.108001, -1.199746, 1, 1, 1, 1, 1,
-0.9720056, -1.653442, -3.423078, 1, 1, 1, 1, 1,
-0.971242, -1.118619, -3.828157, 1, 1, 1, 1, 1,
-0.9690074, -1.674447, -1.560782, 1, 1, 1, 1, 1,
-0.965251, 0.8570559, 0.797761, 0, 0, 1, 1, 1,
-0.9570292, 0.5505984, -2.477016, 1, 0, 0, 1, 1,
-0.9547682, 0.7999123, -1.190249, 1, 0, 0, 1, 1,
-0.9529811, 0.1692114, -0.8680465, 1, 0, 0, 1, 1,
-0.9493783, 1.280331, -0.7503117, 1, 0, 0, 1, 1,
-0.9486278, -0.5520039, -1.149224, 1, 0, 0, 1, 1,
-0.947602, -0.7821866, -3.181038, 0, 0, 0, 1, 1,
-0.9330714, -2.740519, -2.589206, 0, 0, 0, 1, 1,
-0.9313785, -0.08674441, -1.385486, 0, 0, 0, 1, 1,
-0.9262812, 0.1819191, -1.490837, 0, 0, 0, 1, 1,
-0.9250357, -1.582949, -4.140041, 0, 0, 0, 1, 1,
-0.9249953, -1.108719, -2.942578, 0, 0, 0, 1, 1,
-0.9240282, 0.8373414, -1.963871, 0, 0, 0, 1, 1,
-0.9132965, -2.134889, -2.150014, 1, 1, 1, 1, 1,
-0.9095242, -1.252092, -2.61278, 1, 1, 1, 1, 1,
-0.9010829, -0.2826307, -1.2921, 1, 1, 1, 1, 1,
-0.8933597, -0.2996433, -1.017938, 1, 1, 1, 1, 1,
-0.8919498, 1.640862, 0.4713206, 1, 1, 1, 1, 1,
-0.8919353, -0.4262603, -1.741503, 1, 1, 1, 1, 1,
-0.8888774, 2.94878, -1.72163, 1, 1, 1, 1, 1,
-0.8856686, 1.431983, 0.8163902, 1, 1, 1, 1, 1,
-0.8814917, 0.5229433, -1.434268, 1, 1, 1, 1, 1,
-0.8780214, -0.5014117, -2.08614, 1, 1, 1, 1, 1,
-0.8618786, 1.619515, 1.069638, 1, 1, 1, 1, 1,
-0.8584657, 0.2692395, -1.77746, 1, 1, 1, 1, 1,
-0.8527083, -0.03766114, -1.588018, 1, 1, 1, 1, 1,
-0.8518271, -0.9751559, -2.65269, 1, 1, 1, 1, 1,
-0.8488015, -0.1516009, -3.032992, 1, 1, 1, 1, 1,
-0.8479151, -0.01317817, -2.058504, 0, 0, 1, 1, 1,
-0.8450261, -0.8515989, -1.715713, 1, 0, 0, 1, 1,
-0.8433555, 0.5555559, -0.5333639, 1, 0, 0, 1, 1,
-0.8332121, 0.0331655, -2.137673, 1, 0, 0, 1, 1,
-0.8294681, -0.1759781, -2.767499, 1, 0, 0, 1, 1,
-0.826891, 1.550933, -0.8831412, 1, 0, 0, 1, 1,
-0.8243548, 3.116861, -1.527248, 0, 0, 0, 1, 1,
-0.8236155, -0.317106, -1.267911, 0, 0, 0, 1, 1,
-0.8157451, -0.3686508, -3.376425, 0, 0, 0, 1, 1,
-0.8129242, -0.1963815, -2.595066, 0, 0, 0, 1, 1,
-0.8114314, 0.4094934, -1.81735, 0, 0, 0, 1, 1,
-0.8104664, -0.9170442, -4.422198, 0, 0, 0, 1, 1,
-0.8093253, -1.01014, -1.178823, 0, 0, 0, 1, 1,
-0.8020226, 0.3377842, -0.1515472, 1, 1, 1, 1, 1,
-0.7993098, -0.4614434, -2.577698, 1, 1, 1, 1, 1,
-0.7991959, -0.6529852, -2.124419, 1, 1, 1, 1, 1,
-0.7944667, -0.4452227, -1.595614, 1, 1, 1, 1, 1,
-0.7897951, 0.8963387, -2.346648, 1, 1, 1, 1, 1,
-0.7728262, -0.5428929, -0.783196, 1, 1, 1, 1, 1,
-0.7694299, 0.8197384, -0.9052725, 1, 1, 1, 1, 1,
-0.7690746, -0.02564573, -0.4651283, 1, 1, 1, 1, 1,
-0.7681488, -0.4887837, -2.797141, 1, 1, 1, 1, 1,
-0.7624136, 2.975012, 0.9782353, 1, 1, 1, 1, 1,
-0.7620691, -1.314822, -2.964733, 1, 1, 1, 1, 1,
-0.7619615, 0.2886562, -0.2463098, 1, 1, 1, 1, 1,
-0.7597733, 2.143949, -0.2975185, 1, 1, 1, 1, 1,
-0.7536991, 1.455143, -0.6420456, 1, 1, 1, 1, 1,
-0.7516185, 0.3051494, -0.163055, 1, 1, 1, 1, 1,
-0.7515847, 1.144112, -1.641747, 0, 0, 1, 1, 1,
-0.7478461, -2.642384, -3.087333, 1, 0, 0, 1, 1,
-0.7404272, -1.231701, -2.889867, 1, 0, 0, 1, 1,
-0.7351725, -1.209597, -2.090419, 1, 0, 0, 1, 1,
-0.7317869, -0.02999127, -1.067127, 1, 0, 0, 1, 1,
-0.7309009, 0.8339797, 0.306055, 1, 0, 0, 1, 1,
-0.728738, -0.1373022, 0.5051484, 0, 0, 0, 1, 1,
-0.7279551, 0.6551337, -1.023853, 0, 0, 0, 1, 1,
-0.7269271, -1.558071, -3.299754, 0, 0, 0, 1, 1,
-0.7107481, 0.4548184, -0.6026108, 0, 0, 0, 1, 1,
-0.7088602, -0.7058013, -0.7230232, 0, 0, 0, 1, 1,
-0.7060962, -0.6569585, -3.658388, 0, 0, 0, 1, 1,
-0.7049397, -2.41039, -2.773843, 0, 0, 0, 1, 1,
-0.7039791, 1.164095, -0.3716056, 1, 1, 1, 1, 1,
-0.7034169, 0.9683095, -0.9522287, 1, 1, 1, 1, 1,
-0.7033077, 0.3553898, -0.6953787, 1, 1, 1, 1, 1,
-0.7023587, -0.7079342, -3.061869, 1, 1, 1, 1, 1,
-0.7011304, -1.94149, -2.574979, 1, 1, 1, 1, 1,
-0.7011154, 1.931719, 0.8418056, 1, 1, 1, 1, 1,
-0.6975336, 1.534598, 0.0367176, 1, 1, 1, 1, 1,
-0.6901121, 0.06827292, -1.275477, 1, 1, 1, 1, 1,
-0.682887, -1.587136, -0.4548721, 1, 1, 1, 1, 1,
-0.679759, -0.3872607, -2.547217, 1, 1, 1, 1, 1,
-0.679037, 1.202478, -0.4786654, 1, 1, 1, 1, 1,
-0.6790316, 0.7716311, 0.7588723, 1, 1, 1, 1, 1,
-0.6710187, -0.358868, -0.8468149, 1, 1, 1, 1, 1,
-0.6686569, -0.6112145, -1.731901, 1, 1, 1, 1, 1,
-0.6651461, -0.8766934, -1.737502, 1, 1, 1, 1, 1,
-0.6650887, -1.283552, -2.520376, 0, 0, 1, 1, 1,
-0.6637173, -0.5677407, -3.080835, 1, 0, 0, 1, 1,
-0.6611682, 0.9174629, -0.7024527, 1, 0, 0, 1, 1,
-0.6553499, 0.3154744, -0.6095494, 1, 0, 0, 1, 1,
-0.6461971, -2.018359, -2.783233, 1, 0, 0, 1, 1,
-0.6418252, 0.313067, 0.01175432, 1, 0, 0, 1, 1,
-0.6365793, 0.346823, -0.8868704, 0, 0, 0, 1, 1,
-0.6320059, -0.1257651, -2.178546, 0, 0, 0, 1, 1,
-0.6313705, -0.5470375, -1.870064, 0, 0, 0, 1, 1,
-0.6289854, 0.9974747, -0.3471307, 0, 0, 0, 1, 1,
-0.6277639, 2.026593, 0.3650676, 0, 0, 0, 1, 1,
-0.6241935, 0.5459128, -1.482805, 0, 0, 0, 1, 1,
-0.6145308, 0.465539, -0.6268982, 0, 0, 0, 1, 1,
-0.6138648, -0.01199364, -2.837173, 1, 1, 1, 1, 1,
-0.6095166, -0.98506, -1.370289, 1, 1, 1, 1, 1,
-0.6051147, 1.036812, -2.004122, 1, 1, 1, 1, 1,
-0.6042135, 1.184917, 0.8736557, 1, 1, 1, 1, 1,
-0.6042068, 0.6116628, -1.184564, 1, 1, 1, 1, 1,
-0.6033159, 0.1755747, -2.739817, 1, 1, 1, 1, 1,
-0.5993851, -0.2143325, -2.544336, 1, 1, 1, 1, 1,
-0.5992839, 0.4438018, -0.6891788, 1, 1, 1, 1, 1,
-0.5987447, 0.1264816, -2.476467, 1, 1, 1, 1, 1,
-0.5963508, 0.9090028, 0.1337271, 1, 1, 1, 1, 1,
-0.5961001, -0.2348673, -2.975307, 1, 1, 1, 1, 1,
-0.5954987, 1.854403, -0.4492174, 1, 1, 1, 1, 1,
-0.5902256, -1.911029, -2.828379, 1, 1, 1, 1, 1,
-0.5810691, -2.402525, -3.300384, 1, 1, 1, 1, 1,
-0.5788625, -0.1181987, -1.390665, 1, 1, 1, 1, 1,
-0.5676064, -1.05789, -3.400836, 0, 0, 1, 1, 1,
-0.5672751, -1.051749, -2.27288, 1, 0, 0, 1, 1,
-0.5671545, -0.4291521, -1.484413, 1, 0, 0, 1, 1,
-0.5643435, -2.980877, -2.743344, 1, 0, 0, 1, 1,
-0.5598578, -0.8363622, -2.079254, 1, 0, 0, 1, 1,
-0.5596891, -0.8891844, -3.122068, 1, 0, 0, 1, 1,
-0.5585163, 0.9164045, 0.4957488, 0, 0, 0, 1, 1,
-0.5535972, -1.148641, -2.229386, 0, 0, 0, 1, 1,
-0.5495505, 0.6876052, 0.06790084, 0, 0, 0, 1, 1,
-0.5341704, -0.3432333, -0.8690257, 0, 0, 0, 1, 1,
-0.5280855, 0.5638767, -1.171385, 0, 0, 0, 1, 1,
-0.5260342, 1.403681, -0.9353563, 0, 0, 0, 1, 1,
-0.5253529, -1.004612, -4.76482, 0, 0, 0, 1, 1,
-0.5228862, -1.637021, -1.939932, 1, 1, 1, 1, 1,
-0.522251, -0.0009633933, -2.083155, 1, 1, 1, 1, 1,
-0.5171964, -1.045824, -2.644336, 1, 1, 1, 1, 1,
-0.5156322, 0.6234089, 0.5276229, 1, 1, 1, 1, 1,
-0.5114121, -0.3138351, -1.100109, 1, 1, 1, 1, 1,
-0.5112631, -1.77364, -4.19219, 1, 1, 1, 1, 1,
-0.5112397, 0.6640947, 0.2424977, 1, 1, 1, 1, 1,
-0.5086508, 0.39297, -1.345964, 1, 1, 1, 1, 1,
-0.5052679, 0.6153907, 0.2084848, 1, 1, 1, 1, 1,
-0.5026206, 0.3222262, 0.7855107, 1, 1, 1, 1, 1,
-0.498568, 0.4555813, 0.9753011, 1, 1, 1, 1, 1,
-0.4975011, 1.22859, -0.5790256, 1, 1, 1, 1, 1,
-0.4941642, 2.015743, -0.6174654, 1, 1, 1, 1, 1,
-0.4929523, -0.04748207, -0.4227113, 1, 1, 1, 1, 1,
-0.4927785, 0.2033439, -1.894072, 1, 1, 1, 1, 1,
-0.4810652, 0.9039906, -0.03586059, 0, 0, 1, 1, 1,
-0.47537, 1.477681, -0.04918655, 1, 0, 0, 1, 1,
-0.4733834, 0.3086572, -0.443226, 1, 0, 0, 1, 1,
-0.4720728, 0.3923987, -0.749131, 1, 0, 0, 1, 1,
-0.4716151, 0.5800774, -1.592866, 1, 0, 0, 1, 1,
-0.4697135, 0.9283019, -0.5480619, 1, 0, 0, 1, 1,
-0.4656478, -1.457199, -3.2597, 0, 0, 0, 1, 1,
-0.4653434, -0.368977, -2.25651, 0, 0, 0, 1, 1,
-0.464753, -0.05355405, -0.9841862, 0, 0, 0, 1, 1,
-0.4639456, -1.016399, -3.118226, 0, 0, 0, 1, 1,
-0.4613587, 1.519658, 0.7288703, 0, 0, 0, 1, 1,
-0.4606589, -1.625312, -2.710371, 0, 0, 0, 1, 1,
-0.4548382, 0.5355777, 1.011151, 0, 0, 0, 1, 1,
-0.4527671, 0.04772821, -2.503642, 1, 1, 1, 1, 1,
-0.4492097, -1.055582, -2.198867, 1, 1, 1, 1, 1,
-0.4465103, -1.786026, -1.22267, 1, 1, 1, 1, 1,
-0.4451147, -1.192878, -3.967165, 1, 1, 1, 1, 1,
-0.4406676, -1.241032, -2.411135, 1, 1, 1, 1, 1,
-0.4402685, 0.2996866, -1.131165, 1, 1, 1, 1, 1,
-0.4313977, 1.087212, -0.9938625, 1, 1, 1, 1, 1,
-0.4289362, -1.658051, -1.565506, 1, 1, 1, 1, 1,
-0.4284438, -1.262041, -1.697853, 1, 1, 1, 1, 1,
-0.4270117, 1.607395, 0.3934002, 1, 1, 1, 1, 1,
-0.4255196, 0.8615981, 0.9403403, 1, 1, 1, 1, 1,
-0.4144234, 1.245641, -2.33157, 1, 1, 1, 1, 1,
-0.4101118, -0.4255142, -3.04167, 1, 1, 1, 1, 1,
-0.4079157, -1.045178, -1.968678, 1, 1, 1, 1, 1,
-0.4070309, -0.3227398, -3.529938, 1, 1, 1, 1, 1,
-0.4053728, 0.2640902, 0.1462158, 0, 0, 1, 1, 1,
-0.4030996, -0.2811934, -2.231119, 1, 0, 0, 1, 1,
-0.3947956, 1.805268, 1.342558, 1, 0, 0, 1, 1,
-0.3938488, -1.611436, -2.702782, 1, 0, 0, 1, 1,
-0.3910895, 0.08966929, -2.715431, 1, 0, 0, 1, 1,
-0.3897667, 1.484193, -0.06672442, 1, 0, 0, 1, 1,
-0.3887821, -0.364533, -3.477368, 0, 0, 0, 1, 1,
-0.3823047, -0.02859095, -2.83029, 0, 0, 0, 1, 1,
-0.3790396, 0.6415119, 0.3618941, 0, 0, 0, 1, 1,
-0.3770661, -0.2551489, -2.96865, 0, 0, 0, 1, 1,
-0.3743696, 0.7940644, -1.71414, 0, 0, 0, 1, 1,
-0.3733847, 1.733399, -0.9702396, 0, 0, 0, 1, 1,
-0.3670785, -0.7631503, -2.20009, 0, 0, 0, 1, 1,
-0.3612708, 0.8215913, -0.27627, 1, 1, 1, 1, 1,
-0.3561145, -0.03683554, -1.980989, 1, 1, 1, 1, 1,
-0.3503654, 0.2312828, 1.819033, 1, 1, 1, 1, 1,
-0.3468922, 0.1854613, -1.253767, 1, 1, 1, 1, 1,
-0.3426229, 1.018052, -0.4697889, 1, 1, 1, 1, 1,
-0.3404147, -0.2921473, -2.407915, 1, 1, 1, 1, 1,
-0.3308989, 1.182438, 1.208633, 1, 1, 1, 1, 1,
-0.3301982, 1.099817, -1.015406, 1, 1, 1, 1, 1,
-0.3246624, 0.4829494, 0.6814435, 1, 1, 1, 1, 1,
-0.3246142, 0.5596227, -1.567899, 1, 1, 1, 1, 1,
-0.3179339, 0.2425615, -1.386698, 1, 1, 1, 1, 1,
-0.3168349, -0.9427058, -2.822638, 1, 1, 1, 1, 1,
-0.3160293, -1.000272, -3.636447, 1, 1, 1, 1, 1,
-0.3148419, 0.5653749, -1.01117, 1, 1, 1, 1, 1,
-0.3141263, 0.4051812, -1.958021, 1, 1, 1, 1, 1,
-0.3130828, -0.3939467, -0.6880796, 0, 0, 1, 1, 1,
-0.3051547, -0.8938215, -3.525535, 1, 0, 0, 1, 1,
-0.3030894, -0.1240618, -2.333666, 1, 0, 0, 1, 1,
-0.3028419, 0.681029, -1.018861, 1, 0, 0, 1, 1,
-0.2983916, 1.297667, -1.333115, 1, 0, 0, 1, 1,
-0.2945573, 0.6640118, 0.9501538, 1, 0, 0, 1, 1,
-0.293743, -1.356103, -2.869498, 0, 0, 0, 1, 1,
-0.2910376, 0.2905076, -1.802604, 0, 0, 0, 1, 1,
-0.2905554, -1.743727, -2.987741, 0, 0, 0, 1, 1,
-0.2904855, -0.6096948, -1.617941, 0, 0, 0, 1, 1,
-0.289169, 0.5620146, 0.06987122, 0, 0, 0, 1, 1,
-0.2890094, -0.9268815, -3.829251, 0, 0, 0, 1, 1,
-0.2880159, 0.2752641, -0.8901761, 0, 0, 0, 1, 1,
-0.2869457, -0.5818254, -3.873629, 1, 1, 1, 1, 1,
-0.2868435, -0.5320998, -2.164824, 1, 1, 1, 1, 1,
-0.2848928, -0.1537412, -1.580239, 1, 1, 1, 1, 1,
-0.2817885, 0.2013282, -1.757332, 1, 1, 1, 1, 1,
-0.2805157, 0.6300243, -1.523923, 1, 1, 1, 1, 1,
-0.2797972, 0.7986718, -0.009337926, 1, 1, 1, 1, 1,
-0.278435, -0.2729804, -1.849133, 1, 1, 1, 1, 1,
-0.2780075, -0.6506, -2.928571, 1, 1, 1, 1, 1,
-0.2731121, -0.5311024, -2.147621, 1, 1, 1, 1, 1,
-0.2714987, -1.975099, -4.219377, 1, 1, 1, 1, 1,
-0.2698007, -0.5696305, -2.137264, 1, 1, 1, 1, 1,
-0.267112, -2.18506, -2.553873, 1, 1, 1, 1, 1,
-0.266664, -0.2028255, -1.52177, 1, 1, 1, 1, 1,
-0.2595819, -0.5992455, -3.411896, 1, 1, 1, 1, 1,
-0.2584498, 2.662923, 0.3744359, 1, 1, 1, 1, 1,
-0.2557601, 0.08289015, -1.270261, 0, 0, 1, 1, 1,
-0.2549341, -0.4126668, -3.181377, 1, 0, 0, 1, 1,
-0.2500319, 0.460549, -0.763007, 1, 0, 0, 1, 1,
-0.2494972, 0.9133923, 0.3965887, 1, 0, 0, 1, 1,
-0.2492577, -1.354058, -2.234143, 1, 0, 0, 1, 1,
-0.2464669, -0.4316462, -2.268233, 1, 0, 0, 1, 1,
-0.2450432, 1.313233, 0.6393543, 0, 0, 0, 1, 1,
-0.2421578, 0.8306499, 0.8918923, 0, 0, 0, 1, 1,
-0.2415132, -1.101321, -2.910775, 0, 0, 0, 1, 1,
-0.2396423, 0.2135714, -2.200249, 0, 0, 0, 1, 1,
-0.2376646, -0.8024277, -2.353537, 0, 0, 0, 1, 1,
-0.2371902, -1.283974, -2.291569, 0, 0, 0, 1, 1,
-0.2322599, -0.4159974, -2.255994, 0, 0, 0, 1, 1,
-0.2311933, 0.107833, -1.102792, 1, 1, 1, 1, 1,
-0.2297878, 0.2147364, -0.1353271, 1, 1, 1, 1, 1,
-0.2278452, 0.8341044, 1.119789, 1, 1, 1, 1, 1,
-0.2197799, 0.486677, 0.96815, 1, 1, 1, 1, 1,
-0.2183978, -0.4923465, -4.214151, 1, 1, 1, 1, 1,
-0.2171718, -0.8304015, -2.453358, 1, 1, 1, 1, 1,
-0.2151737, -1.4552, -3.680086, 1, 1, 1, 1, 1,
-0.2149129, 1.058616, -1.255837, 1, 1, 1, 1, 1,
-0.2148698, -0.4314604, -2.950627, 1, 1, 1, 1, 1,
-0.2122714, 0.7651755, 0.521663, 1, 1, 1, 1, 1,
-0.2119346, 1.407335, 0.2331121, 1, 1, 1, 1, 1,
-0.2118447, 0.8282161, 0.04214856, 1, 1, 1, 1, 1,
-0.2115189, -1.361176, -5.336368, 1, 1, 1, 1, 1,
-0.2090807, -1.399697, -2.549735, 1, 1, 1, 1, 1,
-0.2078626, -0.1767122, -0.4850049, 1, 1, 1, 1, 1,
-0.2052365, -0.315867, -0.7823518, 0, 0, 1, 1, 1,
-0.2022803, 0.5977472, -0.4008258, 1, 0, 0, 1, 1,
-0.2012567, -1.417406, -4.66971, 1, 0, 0, 1, 1,
-0.1975, 0.9149262, -0.6715405, 1, 0, 0, 1, 1,
-0.1938601, 0.5873454, -0.01053873, 1, 0, 0, 1, 1,
-0.1884156, -0.553023, -4.803808, 1, 0, 0, 1, 1,
-0.1807455, -0.02882777, -0.7731534, 0, 0, 0, 1, 1,
-0.1778333, 0.6225778, -0.1702855, 0, 0, 0, 1, 1,
-0.1772479, -0.4945717, -4.205852, 0, 0, 0, 1, 1,
-0.1720527, 1.350362, -0.2529337, 0, 0, 0, 1, 1,
-0.1613587, 0.7207475, 0.498086, 0, 0, 0, 1, 1,
-0.1610689, 0.9893238, 0.0725545, 0, 0, 0, 1, 1,
-0.1608167, -0.01338643, -0.2932767, 0, 0, 0, 1, 1,
-0.1607952, 0.791107, -0.8212677, 1, 1, 1, 1, 1,
-0.159383, 1.649574, -0.1084209, 1, 1, 1, 1, 1,
-0.1576269, 1.292181, -0.5942994, 1, 1, 1, 1, 1,
-0.1567346, -0.1158715, -1.714075, 1, 1, 1, 1, 1,
-0.1434866, -1.024301, -2.896792, 1, 1, 1, 1, 1,
-0.1404762, -0.4443033, -2.175549, 1, 1, 1, 1, 1,
-0.1385481, -2.373087, -3.238289, 1, 1, 1, 1, 1,
-0.1377932, 0.7215595, -2.165099, 1, 1, 1, 1, 1,
-0.1346141, 0.4718451, -0.3375735, 1, 1, 1, 1, 1,
-0.1304185, 0.003552007, -0.2561303, 1, 1, 1, 1, 1,
-0.1292549, 0.4491072, -0.8779338, 1, 1, 1, 1, 1,
-0.1287177, 0.4059421, -0.1057289, 1, 1, 1, 1, 1,
-0.1219002, -0.2720304, -2.879649, 1, 1, 1, 1, 1,
-0.1174081, -0.8289268, -2.9203, 1, 1, 1, 1, 1,
-0.111581, 1.704229, -0.3588431, 1, 1, 1, 1, 1,
-0.1101399, -0.5061198, -2.106702, 0, 0, 1, 1, 1,
-0.1098523, 0.4569358, -1.13729, 1, 0, 0, 1, 1,
-0.1090467, -0.3108163, -3.328118, 1, 0, 0, 1, 1,
-0.1089116, 0.693602, 0.3499699, 1, 0, 0, 1, 1,
-0.1088714, -0.1137516, -1.991441, 1, 0, 0, 1, 1,
-0.1079046, 0.8799812, 1.93317, 1, 0, 0, 1, 1,
-0.1077825, 0.3399373, -0.3835341, 0, 0, 0, 1, 1,
-0.1018876, -0.6561253, -2.777825, 0, 0, 0, 1, 1,
-0.1011465, 2.478853, 0.5805396, 0, 0, 0, 1, 1,
-0.1001513, 1.133794, -0.550727, 0, 0, 0, 1, 1,
-0.09851713, 0.1785376, -0.154696, 0, 0, 0, 1, 1,
-0.09670158, 0.6858174, -0.1882706, 0, 0, 0, 1, 1,
-0.09633128, -0.7367211, -2.382308, 0, 0, 0, 1, 1,
-0.09549173, 0.6068418, -1.703322, 1, 1, 1, 1, 1,
-0.0952533, -0.4882813, -2.970596, 1, 1, 1, 1, 1,
-0.09414277, -0.2834766, -4.065567, 1, 1, 1, 1, 1,
-0.08824412, -0.574886, -3.354789, 1, 1, 1, 1, 1,
-0.08738811, -2.395832, -3.67599, 1, 1, 1, 1, 1,
-0.08738653, -1.616693, -2.587165, 1, 1, 1, 1, 1,
-0.08733718, 0.3971662, -0.5034799, 1, 1, 1, 1, 1,
-0.08487676, -1.055462, -3.570253, 1, 1, 1, 1, 1,
-0.08394755, 0.5872405, -0.05803134, 1, 1, 1, 1, 1,
-0.08093759, -2.553507, -3.404886, 1, 1, 1, 1, 1,
-0.08077183, -2.561296, -3.618189, 1, 1, 1, 1, 1,
-0.07891098, -0.1455359, -1.950572, 1, 1, 1, 1, 1,
-0.0773085, 0.4710822, 0.4856413, 1, 1, 1, 1, 1,
-0.0763289, -0.9360633, -2.799925, 1, 1, 1, 1, 1,
-0.06733602, 0.9031555, 0.06164191, 1, 1, 1, 1, 1,
-0.06277566, 0.03611798, -0.8484508, 0, 0, 1, 1, 1,
-0.06219197, -1.114015, -2.939218, 1, 0, 0, 1, 1,
-0.06155355, 0.3846714, 0.9468952, 1, 0, 0, 1, 1,
-0.06130819, -1.048158, -1.017262, 1, 0, 0, 1, 1,
-0.05868746, 1.901917, 0.1090631, 1, 0, 0, 1, 1,
-0.04600016, -0.4021897, -2.515849, 1, 0, 0, 1, 1,
-0.04404018, -2.600079, -4.830126, 0, 0, 0, 1, 1,
-0.04341007, 0.0698871, -2.676975, 0, 0, 0, 1, 1,
-0.03962748, 1.561769, -0.6704844, 0, 0, 0, 1, 1,
-0.03805749, -1.02486, -2.818578, 0, 0, 0, 1, 1,
-0.03759132, -0.02553432, -2.634349, 0, 0, 0, 1, 1,
-0.03681302, 2.081285, 0.1430417, 0, 0, 0, 1, 1,
-0.03492719, -0.6567654, -5.006975, 0, 0, 0, 1, 1,
-0.03037444, -0.7442953, -2.408629, 1, 1, 1, 1, 1,
-0.02862243, 0.204007, 0.3232537, 1, 1, 1, 1, 1,
-0.02494188, 0.5576594, 0.9739677, 1, 1, 1, 1, 1,
-0.02252905, -0.681061, -2.294514, 1, 1, 1, 1, 1,
-0.02153246, -0.7012095, -3.944869, 1, 1, 1, 1, 1,
-0.02144812, 0.1198092, -0.7057842, 1, 1, 1, 1, 1,
-0.01985454, 0.786438, 0.09736588, 1, 1, 1, 1, 1,
-0.01943603, -0.1789546, -3.689503, 1, 1, 1, 1, 1,
-0.01877226, -0.9050648, -2.110075, 1, 1, 1, 1, 1,
-0.01311888, -1.96473, -3.267148, 1, 1, 1, 1, 1,
-0.008172396, 0.3713227, 0.375005, 1, 1, 1, 1, 1,
-0.00417375, -0.07751888, -2.953808, 1, 1, 1, 1, 1,
-0.004106762, -1.170952, -3.816661, 1, 1, 1, 1, 1,
-0.001950549, 1.30245, -0.03043859, 1, 1, 1, 1, 1,
0.001072768, 0.3282953, 0.4514942, 1, 1, 1, 1, 1,
0.001586056, 0.9966637, 0.7425052, 0, 0, 1, 1, 1,
0.002166955, 1.411202, 1.987669, 1, 0, 0, 1, 1,
0.003347104, 0.05951326, 0.6210615, 1, 0, 0, 1, 1,
0.004709526, 0.6612857, 1.07581, 1, 0, 0, 1, 1,
0.004831223, -0.4675448, 3.479827, 1, 0, 0, 1, 1,
0.005521501, 0.6879121, -0.3941553, 1, 0, 0, 1, 1,
0.01450561, 0.8554631, -0.7733129, 0, 0, 0, 1, 1,
0.01616514, 0.1530992, 0.5910488, 0, 0, 0, 1, 1,
0.01759613, -2.310617, 2.252162, 0, 0, 0, 1, 1,
0.02413517, 0.8455768, 1.402583, 0, 0, 0, 1, 1,
0.02633605, -0.01231041, 1.091293, 0, 0, 0, 1, 1,
0.02648935, -1.140417, 2.60999, 0, 0, 0, 1, 1,
0.03240835, -0.488943, 3.759453, 0, 0, 0, 1, 1,
0.04186999, 0.9397162, 1.449924, 1, 1, 1, 1, 1,
0.0431602, -1.438283, 3.119167, 1, 1, 1, 1, 1,
0.04447254, -1.117771, 2.476604, 1, 1, 1, 1, 1,
0.04851123, 0.4851256, -0.9033336, 1, 1, 1, 1, 1,
0.05055178, -0.004379177, 2.932098, 1, 1, 1, 1, 1,
0.05474926, 1.4926, -0.2425367, 1, 1, 1, 1, 1,
0.05484945, 1.697173, 0.2395485, 1, 1, 1, 1, 1,
0.06271058, -1.094167, 2.603186, 1, 1, 1, 1, 1,
0.06377091, 1.186894, -1.141061, 1, 1, 1, 1, 1,
0.06463301, 0.1760107, 0.07765492, 1, 1, 1, 1, 1,
0.06718768, -1.071024, 2.626594, 1, 1, 1, 1, 1,
0.07165888, -2.449304, 1.404866, 1, 1, 1, 1, 1,
0.07327522, -0.03393977, 1.627735, 1, 1, 1, 1, 1,
0.07554943, -0.9151028, 2.177206, 1, 1, 1, 1, 1,
0.07766971, 0.2130367, 0.3597768, 1, 1, 1, 1, 1,
0.08105482, -0.2986404, 2.433944, 0, 0, 1, 1, 1,
0.08157212, -0.709499, 4.895084, 1, 0, 0, 1, 1,
0.08281433, -0.8936691, 2.961608, 1, 0, 0, 1, 1,
0.08523021, -1.011247, 1.905402, 1, 0, 0, 1, 1,
0.08616906, 0.03166149, -0.2404528, 1, 0, 0, 1, 1,
0.09341605, 0.02236801, 1.632116, 1, 0, 0, 1, 1,
0.0977953, -0.8386669, 3.647592, 0, 0, 0, 1, 1,
0.1021513, -0.3594972, 3.033962, 0, 0, 0, 1, 1,
0.1023405, 0.1805343, -0.9207453, 0, 0, 0, 1, 1,
0.112213, 0.1407194, -0.02594255, 0, 0, 0, 1, 1,
0.1128381, -0.2380916, 0.5478153, 0, 0, 0, 1, 1,
0.1159539, 1.06371, 0.5013728, 0, 0, 0, 1, 1,
0.1185687, 0.2052403, 0.4023406, 0, 0, 0, 1, 1,
0.1186913, 0.81911, 0.2310432, 1, 1, 1, 1, 1,
0.1220208, -0.2680695, 1.757821, 1, 1, 1, 1, 1,
0.1220234, 1.863391, 0.5361705, 1, 1, 1, 1, 1,
0.122664, -1.953721, 2.661297, 1, 1, 1, 1, 1,
0.1253932, -0.06791856, 3.174814, 1, 1, 1, 1, 1,
0.1276891, 0.6274715, -1.693107, 1, 1, 1, 1, 1,
0.1300658, 0.6071443, 0.2699808, 1, 1, 1, 1, 1,
0.1321806, -0.4849102, 4.13511, 1, 1, 1, 1, 1,
0.1336706, -0.06148099, 1.958834, 1, 1, 1, 1, 1,
0.1367514, 2.256331, 1.757491, 1, 1, 1, 1, 1,
0.1375742, 0.3603635, -0.0401536, 1, 1, 1, 1, 1,
0.1406265, 1.161955, -0.8103451, 1, 1, 1, 1, 1,
0.141495, 1.237971, -0.5408177, 1, 1, 1, 1, 1,
0.1415541, 0.6091387, -0.1370653, 1, 1, 1, 1, 1,
0.1465365, 1.149116, 0.4027438, 1, 1, 1, 1, 1,
0.161204, 0.02418574, 0.9111136, 0, 0, 1, 1, 1,
0.1628534, -0.05470316, 2.089527, 1, 0, 0, 1, 1,
0.1632573, 0.167432, 0.8651183, 1, 0, 0, 1, 1,
0.165024, -1.489008, 2.963736, 1, 0, 0, 1, 1,
0.1719408, -0.5473848, 2.330906, 1, 0, 0, 1, 1,
0.1722137, -1.002798, 2.035678, 1, 0, 0, 1, 1,
0.1729921, -0.6690181, 1.790242, 0, 0, 0, 1, 1,
0.1750426, 0.2814601, 1.104394, 0, 0, 0, 1, 1,
0.1755321, 0.9076933, 1.163146, 0, 0, 0, 1, 1,
0.178368, 0.3314792, 0.01590307, 0, 0, 0, 1, 1,
0.1811578, -1.56781, 2.944183, 0, 0, 0, 1, 1,
0.1815872, -0.432104, 2.847707, 0, 0, 0, 1, 1,
0.1817015, -0.3609401, 1.537015, 0, 0, 0, 1, 1,
0.1858326, 0.8127022, 0.3077315, 1, 1, 1, 1, 1,
0.1935669, 0.2059099, 2.040007, 1, 1, 1, 1, 1,
0.1967475, 1.972903, -0.2136112, 1, 1, 1, 1, 1,
0.1969732, -0.05445104, 2.773414, 1, 1, 1, 1, 1,
0.2112674, -2.219919, 2.574758, 1, 1, 1, 1, 1,
0.2194564, -0.1570049, 1.635742, 1, 1, 1, 1, 1,
0.2194951, -0.5157961, 2.91405, 1, 1, 1, 1, 1,
0.2254033, 0.4900406, 0.5062649, 1, 1, 1, 1, 1,
0.2268873, -0.6182194, 2.823004, 1, 1, 1, 1, 1,
0.2308419, -1.380768, 2.886651, 1, 1, 1, 1, 1,
0.2317613, 1.527088, -0.9696909, 1, 1, 1, 1, 1,
0.2338567, 0.6786909, 0.5041242, 1, 1, 1, 1, 1,
0.240159, -0.2212379, 2.323587, 1, 1, 1, 1, 1,
0.2467999, 0.3289815, 0.9132236, 1, 1, 1, 1, 1,
0.2471889, 1.369064, 0.2060423, 1, 1, 1, 1, 1,
0.2488638, -0.9334221, 3.340027, 0, 0, 1, 1, 1,
0.2498209, -1.85465, 2.462626, 1, 0, 0, 1, 1,
0.2505632, 1.426902, 0.4448602, 1, 0, 0, 1, 1,
0.2513984, 2.123375, -2.091216, 1, 0, 0, 1, 1,
0.2517733, -0.01160057, 1.617133, 1, 0, 0, 1, 1,
0.2519872, 0.01892164, 0.4880941, 1, 0, 0, 1, 1,
0.2542053, -0.558645, 1.394448, 0, 0, 0, 1, 1,
0.2630294, -0.3574902, 2.166596, 0, 0, 0, 1, 1,
0.2631474, 0.3683372, 0.8872461, 0, 0, 0, 1, 1,
0.2672805, 0.3238781, 0.5971954, 0, 0, 0, 1, 1,
0.2711502, -0.3726946, 2.464137, 0, 0, 0, 1, 1,
0.2718183, -0.1799731, 0.6357241, 0, 0, 0, 1, 1,
0.2786424, 1.058655, -1.549366, 0, 0, 0, 1, 1,
0.2788229, -0.05844343, 0.4711949, 1, 1, 1, 1, 1,
0.2795952, 0.214335, 1.321791, 1, 1, 1, 1, 1,
0.2809042, -0.1577114, 2.048158, 1, 1, 1, 1, 1,
0.2863931, 0.6061692, -0.4873211, 1, 1, 1, 1, 1,
0.2869907, 0.4700237, -1.001409, 1, 1, 1, 1, 1,
0.2926056, -0.2679191, 1.749226, 1, 1, 1, 1, 1,
0.2941824, 0.3215059, -0.1078787, 1, 1, 1, 1, 1,
0.2949846, -1.070497, 2.827529, 1, 1, 1, 1, 1,
0.297588, 0.2316265, 0.3673755, 1, 1, 1, 1, 1,
0.2981001, -0.2733534, 3.217504, 1, 1, 1, 1, 1,
0.2984363, 0.2723782, 2.067902, 1, 1, 1, 1, 1,
0.3022872, -0.2495872, 1.358435, 1, 1, 1, 1, 1,
0.3058288, 1.749776, -0.1080596, 1, 1, 1, 1, 1,
0.3059699, 0.2375654, -0.5619819, 1, 1, 1, 1, 1,
0.3064164, -0.741995, 3.004905, 1, 1, 1, 1, 1,
0.308489, -1.14616, 2.409072, 0, 0, 1, 1, 1,
0.3108076, 0.4901867, -0.3777708, 1, 0, 0, 1, 1,
0.3122989, -0.2640807, 2.738056, 1, 0, 0, 1, 1,
0.3150749, 1.819415, 1.341326, 1, 0, 0, 1, 1,
0.3254217, 0.2761223, 0.684056, 1, 0, 0, 1, 1,
0.3254598, 1.337642, 2.284801, 1, 0, 0, 1, 1,
0.3283273, -0.8918678, 3.751721, 0, 0, 0, 1, 1,
0.3371617, 0.4630144, 0.76413, 0, 0, 0, 1, 1,
0.3385253, -0.3706505, 1.621299, 0, 0, 0, 1, 1,
0.3385434, -0.1399614, 1.570266, 0, 0, 0, 1, 1,
0.3427617, 2.035419, -0.5666529, 0, 0, 0, 1, 1,
0.3440736, -0.943922, 3.634277, 0, 0, 0, 1, 1,
0.3457055, 0.8301249, 0.07659058, 0, 0, 0, 1, 1,
0.3530709, -0.5366441, 1.822837, 1, 1, 1, 1, 1,
0.3547254, 0.1935301, 1.357662, 1, 1, 1, 1, 1,
0.3585886, 0.4768414, 0.1579501, 1, 1, 1, 1, 1,
0.3622395, -0.4617674, 2.624801, 1, 1, 1, 1, 1,
0.3661962, 0.5081062, 1.020811, 1, 1, 1, 1, 1,
0.3690772, -0.563058, 3.522968, 1, 1, 1, 1, 1,
0.3704982, -1.142594, 2.288631, 1, 1, 1, 1, 1,
0.3717471, -0.6316152, 1.485625, 1, 1, 1, 1, 1,
0.3791341, 2.70271, 0.1048559, 1, 1, 1, 1, 1,
0.3792505, -0.2371295, 3.813505, 1, 1, 1, 1, 1,
0.3809794, 0.9898267, -0.1161897, 1, 1, 1, 1, 1,
0.3824235, -0.8412079, 1.428801, 1, 1, 1, 1, 1,
0.3872976, -0.05667274, 2.024303, 1, 1, 1, 1, 1,
0.3895607, 0.3711379, 1.852529, 1, 1, 1, 1, 1,
0.3902835, -0.7290588, 1.074086, 1, 1, 1, 1, 1,
0.3943696, 0.06316853, 1.298712, 0, 0, 1, 1, 1,
0.3959171, 0.1922435, 1.54037, 1, 0, 0, 1, 1,
0.4025089, 0.5570987, 1.107932, 1, 0, 0, 1, 1,
0.4046049, -1.917155, 2.819797, 1, 0, 0, 1, 1,
0.4070022, 0.8981593, -0.03660979, 1, 0, 0, 1, 1,
0.4079061, 0.2268809, -0.01323935, 1, 0, 0, 1, 1,
0.4084114, -0.6413474, 1.585004, 0, 0, 0, 1, 1,
0.4134919, -0.8132102, 0.9860409, 0, 0, 0, 1, 1,
0.4190029, -0.1438836, 1.954522, 0, 0, 0, 1, 1,
0.4205373, -0.4109787, 3.796741, 0, 0, 0, 1, 1,
0.4285015, 0.139906, 2.058846, 0, 0, 0, 1, 1,
0.4309572, -0.190117, 1.695969, 0, 0, 0, 1, 1,
0.4313862, 1.634418, -0.5058681, 0, 0, 0, 1, 1,
0.4325135, -1.332089, 3.491174, 1, 1, 1, 1, 1,
0.4373748, 0.11028, 0.2644334, 1, 1, 1, 1, 1,
0.4420838, 0.378773, 0.4468078, 1, 1, 1, 1, 1,
0.4481449, -1.907019, 3.568001, 1, 1, 1, 1, 1,
0.450225, -0.6774406, 3.770599, 1, 1, 1, 1, 1,
0.4510899, -0.5862778, 2.190941, 1, 1, 1, 1, 1,
0.4544255, 1.428093, 0.6185997, 1, 1, 1, 1, 1,
0.4552009, 1.393997, 1.314388, 1, 1, 1, 1, 1,
0.4583518, -2.716026, 2.078023, 1, 1, 1, 1, 1,
0.4597224, 0.8388402, -0.7307845, 1, 1, 1, 1, 1,
0.4739547, 0.02960942, -0.04479583, 1, 1, 1, 1, 1,
0.4767839, -0.7628192, 2.312061, 1, 1, 1, 1, 1,
0.4795165, 0.1188697, 0.6757321, 1, 1, 1, 1, 1,
0.4804794, 1.1891, 0.8741052, 1, 1, 1, 1, 1,
0.4845923, 2.317639, 1.887888, 1, 1, 1, 1, 1,
0.4848948, -0.9249032, 1.989453, 0, 0, 1, 1, 1,
0.4873294, -0.769774, 4.030472, 1, 0, 0, 1, 1,
0.4894967, -1.114526, 2.79934, 1, 0, 0, 1, 1,
0.4922713, 0.3178419, 1.492935, 1, 0, 0, 1, 1,
0.4937652, 0.3856575, 0.9686412, 1, 0, 0, 1, 1,
0.4954631, 1.402105, -0.1030411, 1, 0, 0, 1, 1,
0.4975384, -0.6933876, 4.442636, 0, 0, 0, 1, 1,
0.5041597, -0.7630187, 3.197787, 0, 0, 0, 1, 1,
0.5064971, -0.9885231, 2.406802, 0, 0, 0, 1, 1,
0.5113168, -0.8047446, 3.135265, 0, 0, 0, 1, 1,
0.513239, -0.4250967, 3.874464, 0, 0, 0, 1, 1,
0.5190727, -0.2340847, 0.2602783, 0, 0, 0, 1, 1,
0.5194025, 1.234798, -0.4104432, 0, 0, 0, 1, 1,
0.5196422, 1.051359, 0.08833864, 1, 1, 1, 1, 1,
0.5303572, 0.1635702, 3.081493, 1, 1, 1, 1, 1,
0.5363182, 1.780138, -0.5888523, 1, 1, 1, 1, 1,
0.5363469, -0.8423954, 3.911793, 1, 1, 1, 1, 1,
0.5371783, -0.5552294, 2.544973, 1, 1, 1, 1, 1,
0.5382704, 0.9949299, 0.378656, 1, 1, 1, 1, 1,
0.5398433, -1.451044, 3.643631, 1, 1, 1, 1, 1,
0.541808, 0.930486, 0.7904755, 1, 1, 1, 1, 1,
0.5418895, 1.813892, 0.3574228, 1, 1, 1, 1, 1,
0.5423341, 0.2782644, 1.234198, 1, 1, 1, 1, 1,
0.5496748, -0.9838677, 3.054822, 1, 1, 1, 1, 1,
0.5512218, -0.5501322, 2.05676, 1, 1, 1, 1, 1,
0.556279, 0.03867082, 0.7865129, 1, 1, 1, 1, 1,
0.5568182, 0.2900662, 0.4112126, 1, 1, 1, 1, 1,
0.5596197, -0.3421772, 1.586283, 1, 1, 1, 1, 1,
0.5616472, 0.170029, 2.392315, 0, 0, 1, 1, 1,
0.563134, -0.06225812, 1.22983, 1, 0, 0, 1, 1,
0.5640011, 1.187208, 0.8063971, 1, 0, 0, 1, 1,
0.5640409, -0.832731, 0.7158607, 1, 0, 0, 1, 1,
0.5677481, 0.5021349, 0.59405, 1, 0, 0, 1, 1,
0.5728958, -1.061889, 1.771543, 1, 0, 0, 1, 1,
0.5772538, -0.6574874, 1.222976, 0, 0, 0, 1, 1,
0.5789412, 1.146592, 1.306454, 0, 0, 0, 1, 1,
0.5795205, 0.7720678, -0.4504578, 0, 0, 0, 1, 1,
0.5814011, -1.425595, 3.948804, 0, 0, 0, 1, 1,
0.5862526, -0.6002817, 1.308465, 0, 0, 0, 1, 1,
0.5873123, 0.3470332, 1.600203, 0, 0, 0, 1, 1,
0.5880053, -0.05398961, 2.654905, 0, 0, 0, 1, 1,
0.5915816, -0.06910684, 3.040935, 1, 1, 1, 1, 1,
0.5973275, -1.499376, 3.457527, 1, 1, 1, 1, 1,
0.5975471, 1.172395, 1.764833, 1, 1, 1, 1, 1,
0.6062639, 0.4893893, 0.3095734, 1, 1, 1, 1, 1,
0.6080044, -1.267441, 2.903554, 1, 1, 1, 1, 1,
0.618372, -0.8218091, 1.586644, 1, 1, 1, 1, 1,
0.621673, -0.2348342, 0.8821313, 1, 1, 1, 1, 1,
0.6242825, 0.03468754, 2.353793, 1, 1, 1, 1, 1,
0.6266899, -1.894621, 4.941655, 1, 1, 1, 1, 1,
0.6350602, 0.5561529, -0.3876577, 1, 1, 1, 1, 1,
0.6466983, 1.471082, 0.220387, 1, 1, 1, 1, 1,
0.6491247, 0.2159224, 0.8746064, 1, 1, 1, 1, 1,
0.6509327, 1.154132, 0.1233723, 1, 1, 1, 1, 1,
0.6565118, 0.6878186, -0.5011427, 1, 1, 1, 1, 1,
0.6596307, 0.7317683, -0.14506, 1, 1, 1, 1, 1,
0.6658419, -0.145648, 2.452423, 0, 0, 1, 1, 1,
0.6751009, 1.283098, 0.0146519, 1, 0, 0, 1, 1,
0.6751258, 0.4993833, 1.401002, 1, 0, 0, 1, 1,
0.675175, -1.901757, 1.053261, 1, 0, 0, 1, 1,
0.6790143, 0.2787673, 1.617049, 1, 0, 0, 1, 1,
0.6845835, -0.7926731, 2.03748, 1, 0, 0, 1, 1,
0.6862634, -1.201286, 4.424352, 0, 0, 0, 1, 1,
0.6863799, -1.362063, 3.340974, 0, 0, 0, 1, 1,
0.6868592, 0.8782635, 0.3509305, 0, 0, 0, 1, 1,
0.6878462, 1.446088, 0.4374164, 0, 0, 0, 1, 1,
0.6926808, 0.4661557, 1.565663, 0, 0, 0, 1, 1,
0.6942583, 1.192222, 0.1838958, 0, 0, 0, 1, 1,
0.6947784, -0.2886842, 0.8047189, 0, 0, 0, 1, 1,
0.6991016, 1.666795, -1.206896, 1, 1, 1, 1, 1,
0.7220089, -0.1271345, 1.837658, 1, 1, 1, 1, 1,
0.7237479, 0.6108956, -0.7877229, 1, 1, 1, 1, 1,
0.7239439, -0.2372164, 2.646723, 1, 1, 1, 1, 1,
0.7246715, 0.2677726, 0.1295786, 1, 1, 1, 1, 1,
0.729524, 1.207972, -0.4900096, 1, 1, 1, 1, 1,
0.732265, -0.4175043, 2.006598, 1, 1, 1, 1, 1,
0.737259, 0.8919709, 1.476944, 1, 1, 1, 1, 1,
0.7377784, 0.7296555, 0.8758243, 1, 1, 1, 1, 1,
0.7391871, -0.595212, 2.090342, 1, 1, 1, 1, 1,
0.7409415, -0.0205515, 2.091448, 1, 1, 1, 1, 1,
0.7412483, 0.09346396, 0.8063697, 1, 1, 1, 1, 1,
0.7427003, -0.6532924, 2.811694, 1, 1, 1, 1, 1,
0.7553542, -0.8595412, 2.959243, 1, 1, 1, 1, 1,
0.7580842, 0.5238556, 1.087092, 1, 1, 1, 1, 1,
0.7670844, 0.0006215299, 0.7811915, 0, 0, 1, 1, 1,
0.7711248, 0.5485039, 1.690433, 1, 0, 0, 1, 1,
0.7719698, 0.9294403, 0.3304977, 1, 0, 0, 1, 1,
0.7793161, 1.01125, 0.7011274, 1, 0, 0, 1, 1,
0.7797235, 0.2399758, 1.373314, 1, 0, 0, 1, 1,
0.7831281, 2.26907, -1.109496, 1, 0, 0, 1, 1,
0.7918482, -0.259308, 4.355469, 0, 0, 0, 1, 1,
0.7931018, -0.9182861, 3.251637, 0, 0, 0, 1, 1,
0.7981185, 0.06737146, 1.901196, 0, 0, 0, 1, 1,
0.7999988, -0.3983309, 0.8490072, 0, 0, 0, 1, 1,
0.8041528, -1.346135, 3.683817, 0, 0, 0, 1, 1,
0.8057321, 1.025643, 0.13534, 0, 0, 0, 1, 1,
0.8088317, 0.5890302, 0.8589587, 0, 0, 0, 1, 1,
0.8117015, 0.6711078, 1.142759, 1, 1, 1, 1, 1,
0.8125818, 0.3635796, 1.017129, 1, 1, 1, 1, 1,
0.8146896, 0.5410877, -0.7417158, 1, 1, 1, 1, 1,
0.8164622, 0.9354189, -1.70751, 1, 1, 1, 1, 1,
0.8193321, -0.5256202, 3.646654, 1, 1, 1, 1, 1,
0.8208989, -0.750873, 1.749603, 1, 1, 1, 1, 1,
0.8268895, 0.3969581, 1.678365, 1, 1, 1, 1, 1,
0.8318909, -0.5821823, 2.78598, 1, 1, 1, 1, 1,
0.8332461, 0.4129978, 0.4202038, 1, 1, 1, 1, 1,
0.8353613, -0.5325367, 1.330812, 1, 1, 1, 1, 1,
0.8372275, 0.369302, 3.406532, 1, 1, 1, 1, 1,
0.8403416, 0.1845916, 2.398668, 1, 1, 1, 1, 1,
0.8404526, 0.1742952, 0.4032211, 1, 1, 1, 1, 1,
0.8433659, -1.208796, 2.693624, 1, 1, 1, 1, 1,
0.8482518, -2.073557, 3.608535, 1, 1, 1, 1, 1,
0.8488393, 0.1765569, 1.032124, 0, 0, 1, 1, 1,
0.8489689, 0.4707642, 1.156106, 1, 0, 0, 1, 1,
0.8489764, -0.9982907, 2.614758, 1, 0, 0, 1, 1,
0.8555139, 1.458968, 0.8634746, 1, 0, 0, 1, 1,
0.8581889, -0.7403113, 3.056895, 1, 0, 0, 1, 1,
0.8642777, 0.4535394, 2.986827, 1, 0, 0, 1, 1,
0.8643931, 0.1605172, 1.291718, 0, 0, 0, 1, 1,
0.8676534, -1.058704, 3.425682, 0, 0, 0, 1, 1,
0.8778058, -0.1019812, 1.861454, 0, 0, 0, 1, 1,
0.8779474, -0.4197428, 2.029186, 0, 0, 0, 1, 1,
0.8816512, 0.6348377, 2.192244, 0, 0, 0, 1, 1,
0.8861115, 0.1655119, 0.691979, 0, 0, 0, 1, 1,
0.8867548, 0.2330707, 0.9431698, 0, 0, 0, 1, 1,
0.8887303, -0.6532111, 3.121741, 1, 1, 1, 1, 1,
0.8929452, -1.761665, 4.890369, 1, 1, 1, 1, 1,
0.8975512, -1.197594, 1.126755, 1, 1, 1, 1, 1,
0.8981192, 2.16601, 0.1557641, 1, 1, 1, 1, 1,
0.9059895, 1.851333, 1.216464, 1, 1, 1, 1, 1,
0.9163725, -0.512573, 1.623563, 1, 1, 1, 1, 1,
0.9168147, -0.2338784, 1.576136, 1, 1, 1, 1, 1,
0.918057, -0.5553704, 2.889485, 1, 1, 1, 1, 1,
0.9186478, 1.165036, -0.006024187, 1, 1, 1, 1, 1,
0.9212157, 1.38197, 1.445077, 1, 1, 1, 1, 1,
0.9227352, 0.3358396, 0.6325375, 1, 1, 1, 1, 1,
0.9259242, 0.2058089, 2.595303, 1, 1, 1, 1, 1,
0.9331774, -0.7168279, 2.635759, 1, 1, 1, 1, 1,
0.9364651, -0.7586827, 2.177566, 1, 1, 1, 1, 1,
0.9559849, -1.029781, 0.08991516, 1, 1, 1, 1, 1,
0.9587583, 1.305063, 1.224521, 0, 0, 1, 1, 1,
0.9607342, 0.477287, -0.5633781, 1, 0, 0, 1, 1,
0.9612567, -0.6428825, 3.460277, 1, 0, 0, 1, 1,
0.9616038, -1.428689, 1.562173, 1, 0, 0, 1, 1,
0.9637148, -0.1777575, 1.908903, 1, 0, 0, 1, 1,
0.9706056, 0.6800856, 0.4936913, 1, 0, 0, 1, 1,
0.9737506, 0.4369193, 0.184992, 0, 0, 0, 1, 1,
0.9740598, 1.2037, 2.993107, 0, 0, 0, 1, 1,
0.9755263, 0.4427271, 1.502568, 0, 0, 0, 1, 1,
0.9757463, 0.6375733, 2.05052, 0, 0, 0, 1, 1,
0.9811763, 0.01176847, 2.225436, 0, 0, 0, 1, 1,
0.9832156, 0.7286965, 1.353198, 0, 0, 0, 1, 1,
0.9848087, -0.6836771, 0.9203549, 0, 0, 0, 1, 1,
0.9848754, -0.9453593, 1.154742, 1, 1, 1, 1, 1,
0.9852713, -3.407037, 3.961385, 1, 1, 1, 1, 1,
0.9871604, -0.5163164, 0.8329812, 1, 1, 1, 1, 1,
0.9936777, -0.007362486, 2.672644, 1, 1, 1, 1, 1,
0.9989371, -1.074336, 3.428434, 1, 1, 1, 1, 1,
1.002315, 0.2278865, 2.185485, 1, 1, 1, 1, 1,
1.007578, -0.7319759, 1.506219, 1, 1, 1, 1, 1,
1.011576, -1.101823, 2.256265, 1, 1, 1, 1, 1,
1.012673, -1.607845, 2.877985, 1, 1, 1, 1, 1,
1.018283, 0.1362385, 3.328566, 1, 1, 1, 1, 1,
1.019986, -1.359634, 2.312934, 1, 1, 1, 1, 1,
1.028534, -0.4357051, 1.500931, 1, 1, 1, 1, 1,
1.0298, 1.248683, -0.1882238, 1, 1, 1, 1, 1,
1.036288, -0.7230452, 0.1060838, 1, 1, 1, 1, 1,
1.037784, 0.4740124, 0.4551885, 1, 1, 1, 1, 1,
1.038103, -1.014243, 3.539413, 0, 0, 1, 1, 1,
1.050364, -1.359428, 0.8753317, 1, 0, 0, 1, 1,
1.055593, -2.428194, 4.091964, 1, 0, 0, 1, 1,
1.059586, -0.3822297, 0.3715758, 1, 0, 0, 1, 1,
1.06309, 0.1842611, -0.08921687, 1, 0, 0, 1, 1,
1.063984, 2.415398, -0.9361107, 1, 0, 0, 1, 1,
1.068841, 0.9494922, 0.248234, 0, 0, 0, 1, 1,
1.078154, 2.063187, 0.8890098, 0, 0, 0, 1, 1,
1.086522, -1.739615, 2.191031, 0, 0, 0, 1, 1,
1.088488, -0.9696058, 2.466703, 0, 0, 0, 1, 1,
1.097844, 0.7317377, 0.6607068, 0, 0, 0, 1, 1,
1.105295, 0.03155781, 2.491111, 0, 0, 0, 1, 1,
1.108657, -1.281444, 0.1263155, 0, 0, 0, 1, 1,
1.109635, 0.5405124, -0.4034822, 1, 1, 1, 1, 1,
1.110684, -0.320397, 2.131202, 1, 1, 1, 1, 1,
1.110858, -0.3095412, 3.059644, 1, 1, 1, 1, 1,
1.119811, -0.9389776, 2.048868, 1, 1, 1, 1, 1,
1.121576, 0.7381584, 2.325783, 1, 1, 1, 1, 1,
1.14071, 0.0983532, 0.5087444, 1, 1, 1, 1, 1,
1.142391, 2.824559, -0.05613444, 1, 1, 1, 1, 1,
1.150284, -0.3866107, 2.308399, 1, 1, 1, 1, 1,
1.153125, -1.339182, 2.328941, 1, 1, 1, 1, 1,
1.158224, -1.005686, 2.317104, 1, 1, 1, 1, 1,
1.163929, -1.010235, 2.106222, 1, 1, 1, 1, 1,
1.17686, 0.8780094, 0.06092318, 1, 1, 1, 1, 1,
1.180034, 1.301482, -1.208074, 1, 1, 1, 1, 1,
1.181528, -0.1313887, 1.718486, 1, 1, 1, 1, 1,
1.195364, -1.016225, 2.236714, 1, 1, 1, 1, 1,
1.196818, 1.103198, 0.2131673, 0, 0, 1, 1, 1,
1.200196, 2.64969, 1.975753, 1, 0, 0, 1, 1,
1.214702, -1.002324, 1.278325, 1, 0, 0, 1, 1,
1.215003, -0.1451292, 2.000249, 1, 0, 0, 1, 1,
1.221923, -1.061847, 3.016682, 1, 0, 0, 1, 1,
1.224409, -0.7323976, 3.072771, 1, 0, 0, 1, 1,
1.224768, -2.291636, 2.06443, 0, 0, 0, 1, 1,
1.237619, 0.8391079, -1.088389, 0, 0, 0, 1, 1,
1.243121, -0.6087501, 3.266286, 0, 0, 0, 1, 1,
1.245884, 0.2653925, 0.237339, 0, 0, 0, 1, 1,
1.26823, 0.09262594, -0.135908, 0, 0, 0, 1, 1,
1.27465, 0.7820256, 0.6694245, 0, 0, 0, 1, 1,
1.280507, -1.092855, 1.386246, 0, 0, 0, 1, 1,
1.281653, 0.7349669, 1.497125, 1, 1, 1, 1, 1,
1.291293, -1.541225, 2.995233, 1, 1, 1, 1, 1,
1.296736, -0.4326308, 0.6999124, 1, 1, 1, 1, 1,
1.306095, 0.6350315, 2.071193, 1, 1, 1, 1, 1,
1.311057, -0.703422, 2.355058, 1, 1, 1, 1, 1,
1.321538, -0.9654134, 2.272265, 1, 1, 1, 1, 1,
1.324053, 0.5452834, 0.7138387, 1, 1, 1, 1, 1,
1.326504, -0.08763277, 1.687254, 1, 1, 1, 1, 1,
1.329738, -0.9678527, 1.798597, 1, 1, 1, 1, 1,
1.333317, -0.4007291, 2.755982, 1, 1, 1, 1, 1,
1.343386, -0.1096911, 2.387836, 1, 1, 1, 1, 1,
1.343609, 0.8774894, 0.6815483, 1, 1, 1, 1, 1,
1.348859, -0.398876, 0.7495399, 1, 1, 1, 1, 1,
1.35018, -3.147025, 3.684154, 1, 1, 1, 1, 1,
1.350202, 0.1777462, 0.7478997, 1, 1, 1, 1, 1,
1.360617, 2.092099, -2.032413, 0, 0, 1, 1, 1,
1.367192, 0.2513992, 1.716469, 1, 0, 0, 1, 1,
1.370701, 1.053647, 0.4750766, 1, 0, 0, 1, 1,
1.379744, 0.6387522, 0.9727319, 1, 0, 0, 1, 1,
1.380629, -0.1257188, 3.133087, 1, 0, 0, 1, 1,
1.380992, -0.3947888, 3.595001, 1, 0, 0, 1, 1,
1.387828, -0.2507978, 1.695388, 0, 0, 0, 1, 1,
1.388779, -0.04019248, 0.920417, 0, 0, 0, 1, 1,
1.417393, 1.98659, 0.8897313, 0, 0, 0, 1, 1,
1.429237, -0.7171828, 1.744866, 0, 0, 0, 1, 1,
1.432532, 1.154224, 0.8894808, 0, 0, 0, 1, 1,
1.443519, -0.9408852, 2.179163, 0, 0, 0, 1, 1,
1.445797, 1.203074, 0.4384848, 0, 0, 0, 1, 1,
1.451715, -0.5122321, 0.5691219, 1, 1, 1, 1, 1,
1.460515, 0.8527619, 0.1210219, 1, 1, 1, 1, 1,
1.464526, -0.5371442, 3.966534, 1, 1, 1, 1, 1,
1.469879, -0.1494348, 1.868718, 1, 1, 1, 1, 1,
1.476155, 1.514899, 0.9381867, 1, 1, 1, 1, 1,
1.47779, 1.871114, -0.3274592, 1, 1, 1, 1, 1,
1.478055, -2.142082, 3.955808, 1, 1, 1, 1, 1,
1.479291, 0.2099265, 2.000867, 1, 1, 1, 1, 1,
1.488007, -1.246523, 3.729769, 1, 1, 1, 1, 1,
1.495239, 1.288904, 1.643434, 1, 1, 1, 1, 1,
1.517276, -0.6834569, 2.016924, 1, 1, 1, 1, 1,
1.537334, -0.1310706, 3.073752, 1, 1, 1, 1, 1,
1.545244, 1.569296, 1.027333, 1, 1, 1, 1, 1,
1.549631, 1.49728, 2.153874, 1, 1, 1, 1, 1,
1.550813, 1.344044, 1.302014, 1, 1, 1, 1, 1,
1.57446, 0.6209345, 2.614206, 0, 0, 1, 1, 1,
1.59425, 2.156631, 0.850816, 1, 0, 0, 1, 1,
1.60121, -0.3137039, 1.773313, 1, 0, 0, 1, 1,
1.611984, -1.261414, 0.7003156, 1, 0, 0, 1, 1,
1.61375, 0.167564, 0.9793908, 1, 0, 0, 1, 1,
1.631738, 0.7224357, 2.13509, 1, 0, 0, 1, 1,
1.653309, 1.802046, -0.2079237, 0, 0, 0, 1, 1,
1.656675, 1.599469, 1.82713, 0, 0, 0, 1, 1,
1.658625, 0.2884655, 1.164118, 0, 0, 0, 1, 1,
1.697833, -0.5989832, 1.683769, 0, 0, 0, 1, 1,
1.708979, -1.17074, 0.8955171, 0, 0, 0, 1, 1,
1.714137, 0.3769653, 0.8833096, 0, 0, 0, 1, 1,
1.725297, 0.2654313, 1.551121, 0, 0, 0, 1, 1,
1.731007, -1.304336, 3.322081, 1, 1, 1, 1, 1,
1.740418, 0.8448486, 1.532706, 1, 1, 1, 1, 1,
1.816327, 0.02529142, 2.20365, 1, 1, 1, 1, 1,
1.828979, 1.840011, 1.37867, 1, 1, 1, 1, 1,
1.845683, 0.9842035, -0.7363328, 1, 1, 1, 1, 1,
1.917553, -0.1909401, 2.405892, 1, 1, 1, 1, 1,
1.922304, -1.208483, 2.898587, 1, 1, 1, 1, 1,
1.928789, -0.1381482, 1.220416, 1, 1, 1, 1, 1,
1.960953, -0.4968796, 2.044684, 1, 1, 1, 1, 1,
1.978155, -1.615818, 0.4879117, 1, 1, 1, 1, 1,
1.994373, 1.620205, 1.503659, 1, 1, 1, 1, 1,
2.011102, 0.5597757, 0.4124475, 1, 1, 1, 1, 1,
2.04561, 0.2673967, 3.133232, 1, 1, 1, 1, 1,
2.061533, -1.154539, 3.440133, 1, 1, 1, 1, 1,
2.065353, -0.3616351, 1.711351, 1, 1, 1, 1, 1,
2.084724, -0.5146013, 0.8718233, 0, 0, 1, 1, 1,
2.086346, 0.9826186, 1.668972, 1, 0, 0, 1, 1,
2.096572, -0.7615986, 1.110987, 1, 0, 0, 1, 1,
2.097865, 2.667262, 0.6096454, 1, 0, 0, 1, 1,
2.148791, -0.5158888, 0.3672502, 1, 0, 0, 1, 1,
2.17329, 0.5961308, 1.544507, 1, 0, 0, 1, 1,
2.177181, -0.1042832, 1.224249, 0, 0, 0, 1, 1,
2.197417, -0.2988829, 3.040149, 0, 0, 0, 1, 1,
2.203985, -0.3532412, 0.862312, 0, 0, 0, 1, 1,
2.22134, -1.337908, 2.461639, 0, 0, 0, 1, 1,
2.369897, 1.426355, -0.2274341, 0, 0, 0, 1, 1,
2.383353, 0.2077923, 1.289585, 0, 0, 0, 1, 1,
2.428077, 1.068705, 0.4073291, 0, 0, 0, 1, 1,
2.447875, -0.2481477, 1.569138, 1, 1, 1, 1, 1,
2.467779, -1.328058, 1.067767, 1, 1, 1, 1, 1,
2.526809, 0.2374977, 2.482285, 1, 1, 1, 1, 1,
2.538483, 0.3636777, 1.503618, 1, 1, 1, 1, 1,
2.647422, 2.297614, 1.554149, 1, 1, 1, 1, 1,
2.695378, -1.180675, 3.125461, 1, 1, 1, 1, 1,
2.981344, 0.1797958, 0.7612325, 1, 1, 1, 1, 1
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
var radius = 9.256912;
var distance = 32.51451;
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
mvMatrix.translate( -0.1126423, 0.1450882, 0.1973562 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.51451);
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
