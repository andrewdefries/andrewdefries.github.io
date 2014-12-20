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
-3.195673, 0.5225688, 0.2099245, 1, 0, 0, 1,
-2.772094, -0.536435, -0.7849541, 1, 0.007843138, 0, 1,
-2.525749, 0.09577168, -2.024516, 1, 0.01176471, 0, 1,
-2.488198, -0.597154, -2.218974, 1, 0.01960784, 0, 1,
-2.471063, -0.4696092, -2.107038, 1, 0.02352941, 0, 1,
-2.461095, 1.693648, 1.133984, 1, 0.03137255, 0, 1,
-2.426708, -1.226433, -1.731977, 1, 0.03529412, 0, 1,
-2.38648, -0.8358176, -2.823942, 1, 0.04313726, 0, 1,
-2.352942, 1.412972, -1.693533, 1, 0.04705882, 0, 1,
-2.3405, -0.8584393, -2.468195, 1, 0.05490196, 0, 1,
-2.333297, 1.663208, -1.522478, 1, 0.05882353, 0, 1,
-2.332332, -0.3245316, -2.608371, 1, 0.06666667, 0, 1,
-2.322772, 0.2148474, -0.4261225, 1, 0.07058824, 0, 1,
-2.28503, -0.6011915, -0.634247, 1, 0.07843138, 0, 1,
-2.247766, 0.9555467, 0.04285792, 1, 0.08235294, 0, 1,
-2.218993, -1.246554, -2.638783, 1, 0.09019608, 0, 1,
-2.213482, -1.130571, -1.240225, 1, 0.09411765, 0, 1,
-2.176782, 0.1198594, -0.2642282, 1, 0.1019608, 0, 1,
-2.156137, -1.354132, -0.9256514, 1, 0.1098039, 0, 1,
-2.135511, -1.11136, -0.7429325, 1, 0.1137255, 0, 1,
-2.103162, 1.855793, 0.09322572, 1, 0.1215686, 0, 1,
-2.021347, -0.2609343, -1.252029, 1, 0.1254902, 0, 1,
-2.017905, -0.6340727, -1.982782, 1, 0.1333333, 0, 1,
-2.005693, 0.600047, 0.9306588, 1, 0.1372549, 0, 1,
-1.937625, 0.5924687, -1.803454, 1, 0.145098, 0, 1,
-1.917812, 1.28944, -0.9365712, 1, 0.1490196, 0, 1,
-1.912026, -0.2130716, -1.097234, 1, 0.1568628, 0, 1,
-1.875301, -0.9550982, -1.256166, 1, 0.1607843, 0, 1,
-1.870412, 1.072388, -0.9079077, 1, 0.1686275, 0, 1,
-1.851071, -0.4051121, -1.261705, 1, 0.172549, 0, 1,
-1.839461, 1.341463, -2.553295, 1, 0.1803922, 0, 1,
-1.836518, 1.507351, -0.9691439, 1, 0.1843137, 0, 1,
-1.785752, 0.4111141, -2.71758, 1, 0.1921569, 0, 1,
-1.785318, 1.426098, 0.6166621, 1, 0.1960784, 0, 1,
-1.781456, -1.12545, -1.835141, 1, 0.2039216, 0, 1,
-1.748082, 0.2576379, -2.024918, 1, 0.2117647, 0, 1,
-1.734281, 0.08398222, -2.104311, 1, 0.2156863, 0, 1,
-1.728348, -1.327316, -0.9576815, 1, 0.2235294, 0, 1,
-1.725238, 1.520092, -1.048296, 1, 0.227451, 0, 1,
-1.723679, -0.1355298, -2.831372, 1, 0.2352941, 0, 1,
-1.713805, 0.9746833, -0.4286003, 1, 0.2392157, 0, 1,
-1.707591, -0.2107645, -3.931738, 1, 0.2470588, 0, 1,
-1.703298, 0.0642243, -0.2995382, 1, 0.2509804, 0, 1,
-1.68922, 0.9287746, -1.279717, 1, 0.2588235, 0, 1,
-1.669611, 0.02446522, -1.440583, 1, 0.2627451, 0, 1,
-1.668265, -1.258023, -4.070968, 1, 0.2705882, 0, 1,
-1.666154, -0.6876882, -0.7863975, 1, 0.2745098, 0, 1,
-1.665752, 0.2883282, -3.315817, 1, 0.282353, 0, 1,
-1.664551, 0.3203554, -0.5577257, 1, 0.2862745, 0, 1,
-1.653756, 0.09949141, -1.960726, 1, 0.2941177, 0, 1,
-1.650298, -0.1115135, -1.741519, 1, 0.3019608, 0, 1,
-1.645877, 0.6234238, 0.5692754, 1, 0.3058824, 0, 1,
-1.632529, 0.3877716, -0.5507278, 1, 0.3137255, 0, 1,
-1.62987, 0.1491494, 0.3858853, 1, 0.3176471, 0, 1,
-1.628938, 0.2474873, -1.491636, 1, 0.3254902, 0, 1,
-1.618503, 0.1945896, -0.4129106, 1, 0.3294118, 0, 1,
-1.616031, -0.2562229, -1.323493, 1, 0.3372549, 0, 1,
-1.612494, 1.516496, 0.9362247, 1, 0.3411765, 0, 1,
-1.606443, 0.467181, -1.962546, 1, 0.3490196, 0, 1,
-1.601557, 0.09109043, -2.066419, 1, 0.3529412, 0, 1,
-1.599324, -0.8111337, -1.696933, 1, 0.3607843, 0, 1,
-1.598557, 1.685337, -1.944724, 1, 0.3647059, 0, 1,
-1.595525, -0.3996965, -2.579243, 1, 0.372549, 0, 1,
-1.581794, 1.46723, 1.462167, 1, 0.3764706, 0, 1,
-1.577712, 0.5903265, -0.4347997, 1, 0.3843137, 0, 1,
-1.561839, 0.427581, -0.7563376, 1, 0.3882353, 0, 1,
-1.552366, -0.2917095, -0.6164325, 1, 0.3960784, 0, 1,
-1.544744, 1.419141, -3.6884, 1, 0.4039216, 0, 1,
-1.544652, -2.3045, -1.648207, 1, 0.4078431, 0, 1,
-1.531185, -0.9600657, -1.277864, 1, 0.4156863, 0, 1,
-1.531174, -0.2854013, -2.233963, 1, 0.4196078, 0, 1,
-1.508248, -0.05270388, -3.159496, 1, 0.427451, 0, 1,
-1.507725, -0.04165522, -2.897177, 1, 0.4313726, 0, 1,
-1.496369, -0.7440392, -1.762409, 1, 0.4392157, 0, 1,
-1.494401, -1.175842, -1.850759, 1, 0.4431373, 0, 1,
-1.493601, -0.4042212, -0.5753336, 1, 0.4509804, 0, 1,
-1.473287, -1.256286, -3.062245, 1, 0.454902, 0, 1,
-1.464082, -0.1220647, -0.6210166, 1, 0.4627451, 0, 1,
-1.447036, 0.8274119, -0.6576769, 1, 0.4666667, 0, 1,
-1.445177, -1.214603, -1.714353, 1, 0.4745098, 0, 1,
-1.44067, 1.270904, -1.091398, 1, 0.4784314, 0, 1,
-1.428863, 1.661069, -0.7297234, 1, 0.4862745, 0, 1,
-1.41943, 0.5042045, -0.5397952, 1, 0.4901961, 0, 1,
-1.418807, -1.351861, -3.211481, 1, 0.4980392, 0, 1,
-1.402995, 0.03459921, -0.5452322, 1, 0.5058824, 0, 1,
-1.390964, -0.2094558, -0.3948543, 1, 0.509804, 0, 1,
-1.370492, 0.01632386, -1.390886, 1, 0.5176471, 0, 1,
-1.367111, -0.6963582, -2.452278, 1, 0.5215687, 0, 1,
-1.364417, -1.661561, -3.061398, 1, 0.5294118, 0, 1,
-1.356061, -0.8584864, -3.082086, 1, 0.5333334, 0, 1,
-1.354241, 0.2317924, -1.089633, 1, 0.5411765, 0, 1,
-1.334308, -2.570508, -2.899838, 1, 0.5450981, 0, 1,
-1.329221, -0.3460096, -1.437712, 1, 0.5529412, 0, 1,
-1.323582, -0.9325659, -0.9229344, 1, 0.5568628, 0, 1,
-1.319189, 1.28683, -1.707591, 1, 0.5647059, 0, 1,
-1.3095, 0.6299077, -1.315519, 1, 0.5686275, 0, 1,
-1.303027, -0.01420143, -1.719108, 1, 0.5764706, 0, 1,
-1.294882, 1.177455, -1.210858, 1, 0.5803922, 0, 1,
-1.293358, 0.03349039, -1.611966, 1, 0.5882353, 0, 1,
-1.293269, 1.177239, -1.3529, 1, 0.5921569, 0, 1,
-1.291692, 2.10018, -1.699922, 1, 0.6, 0, 1,
-1.28886, -0.711453, -2.676263, 1, 0.6078432, 0, 1,
-1.282684, 0.3545398, -0.57254, 1, 0.6117647, 0, 1,
-1.276572, 0.348592, -1.515516, 1, 0.6196079, 0, 1,
-1.274398, 1.878882, -1.305537, 1, 0.6235294, 0, 1,
-1.270416, -0.6184179, -2.376847, 1, 0.6313726, 0, 1,
-1.262306, -0.2076823, -1.179337, 1, 0.6352941, 0, 1,
-1.251905, 1.132161, 0.1858702, 1, 0.6431373, 0, 1,
-1.242607, 2.100945, -0.9610916, 1, 0.6470588, 0, 1,
-1.241602, -0.7516127, -2.539239, 1, 0.654902, 0, 1,
-1.233614, -1.187288, -3.550137, 1, 0.6588235, 0, 1,
-1.233566, -0.505634, -2.121218, 1, 0.6666667, 0, 1,
-1.230568, -0.06322069, -2.489953, 1, 0.6705883, 0, 1,
-1.224205, -1.38334, -3.487456, 1, 0.6784314, 0, 1,
-1.219369, -0.6786848, -2.967734, 1, 0.682353, 0, 1,
-1.197791, 0.02922814, -0.6879621, 1, 0.6901961, 0, 1,
-1.1943, 0.7200531, -0.952567, 1, 0.6941177, 0, 1,
-1.190756, -1.643611, -2.077264, 1, 0.7019608, 0, 1,
-1.190698, 0.3950414, -3.426907, 1, 0.7098039, 0, 1,
-1.185264, -0.2936419, -2.019713, 1, 0.7137255, 0, 1,
-1.175355, -2.032751, -2.569766, 1, 0.7215686, 0, 1,
-1.174316, 1.231701, -2.195038, 1, 0.7254902, 0, 1,
-1.172148, 0.0937695, -2.410321, 1, 0.7333333, 0, 1,
-1.163171, -1.257386, -1.214731, 1, 0.7372549, 0, 1,
-1.153027, -1.064726, -2.106242, 1, 0.7450981, 0, 1,
-1.146811, -0.969631, -4.109371, 1, 0.7490196, 0, 1,
-1.140201, -0.4226238, -0.7968597, 1, 0.7568628, 0, 1,
-1.138493, -1.472576, -2.991403, 1, 0.7607843, 0, 1,
-1.135897, -0.3668093, -2.892673, 1, 0.7686275, 0, 1,
-1.13425, -0.6467309, -1.577789, 1, 0.772549, 0, 1,
-1.133995, -1.199923, -3.53841, 1, 0.7803922, 0, 1,
-1.121678, 1.623467, -1.033799, 1, 0.7843137, 0, 1,
-1.118442, 0.1420933, -2.535591, 1, 0.7921569, 0, 1,
-1.107779, -1.229653, -1.389733, 1, 0.7960784, 0, 1,
-1.101438, -0.2936642, -1.404905, 1, 0.8039216, 0, 1,
-1.082917, 0.291599, -0.755836, 1, 0.8117647, 0, 1,
-1.063484, 0.6690938, -2.53573, 1, 0.8156863, 0, 1,
-1.05893, 0.5115219, -0.580988, 1, 0.8235294, 0, 1,
-1.049923, -0.1779214, -1.747198, 1, 0.827451, 0, 1,
-1.047048, 0.3464166, -2.661145, 1, 0.8352941, 0, 1,
-1.042059, -1.155297, -2.820024, 1, 0.8392157, 0, 1,
-1.041507, -0.4430219, -2.558438, 1, 0.8470588, 0, 1,
-1.038365, 1.328034, -0.582192, 1, 0.8509804, 0, 1,
-1.035735, 0.8305939, 0.005039271, 1, 0.8588235, 0, 1,
-1.035038, -0.4541417, -1.882272, 1, 0.8627451, 0, 1,
-1.033501, -1.436023, -1.25415, 1, 0.8705882, 0, 1,
-1.026869, -0.5485525, -1.311073, 1, 0.8745098, 0, 1,
-1.02151, -0.5860177, -2.666006, 1, 0.8823529, 0, 1,
-1.018995, 0.004542236, -2.034891, 1, 0.8862745, 0, 1,
-1.016486, -1.434417, -1.608048, 1, 0.8941177, 0, 1,
-1.012682, -0.5789959, -1.325546, 1, 0.8980392, 0, 1,
-1.008479, 0.4260599, -0.5051377, 1, 0.9058824, 0, 1,
-1.005459, -0.1235432, -0.1369088, 1, 0.9137255, 0, 1,
-1.004782, 0.1565313, -2.173034, 1, 0.9176471, 0, 1,
-0.9782524, 0.7399356, -1.75397, 1, 0.9254902, 0, 1,
-0.9669607, -0.5050976, -2.077995, 1, 0.9294118, 0, 1,
-0.9651538, -1.126477, -2.764416, 1, 0.9372549, 0, 1,
-0.9646671, -0.3778776, -1.129877, 1, 0.9411765, 0, 1,
-0.9633859, 0.3869008, -0.5375702, 1, 0.9490196, 0, 1,
-0.9591504, 0.1034242, -0.1151341, 1, 0.9529412, 0, 1,
-0.9373705, 0.02799677, -2.762043, 1, 0.9607843, 0, 1,
-0.9256468, -1.852926, -1.6482, 1, 0.9647059, 0, 1,
-0.925363, 2.26572, 1.146319, 1, 0.972549, 0, 1,
-0.9238097, 1.186343, -0.5652089, 1, 0.9764706, 0, 1,
-0.9219225, 0.9442802, -0.7891874, 1, 0.9843137, 0, 1,
-0.9189935, 0.2719315, -0.7593967, 1, 0.9882353, 0, 1,
-0.9166184, -0.5810348, -2.962171, 1, 0.9960784, 0, 1,
-0.9115979, -2.358401, -4.120526, 0.9960784, 1, 0, 1,
-0.908491, -0.1354483, -1.13543, 0.9921569, 1, 0, 1,
-0.9041661, 1.536105, -1.451501, 0.9843137, 1, 0, 1,
-0.9003673, -0.9030773, -3.924771, 0.9803922, 1, 0, 1,
-0.8995313, 1.650181, -0.7058177, 0.972549, 1, 0, 1,
-0.8895224, -1.283117, -3.499849, 0.9686275, 1, 0, 1,
-0.884046, 0.3302083, -2.065455, 0.9607843, 1, 0, 1,
-0.8797677, -0.607502, -3.550605, 0.9568627, 1, 0, 1,
-0.8723755, 1.523231, 0.5011457, 0.9490196, 1, 0, 1,
-0.8699394, -0.722841, -4.440792, 0.945098, 1, 0, 1,
-0.8693075, 0.7586672, 1.548914, 0.9372549, 1, 0, 1,
-0.8678964, -1.265298, -3.386767, 0.9333333, 1, 0, 1,
-0.8668874, 0.04913504, -1.271883, 0.9254902, 1, 0, 1,
-0.8655651, 1.669612, -0.520247, 0.9215686, 1, 0, 1,
-0.8651942, 0.6454864, -2.253125, 0.9137255, 1, 0, 1,
-0.8581521, 0.8443012, 0.09726621, 0.9098039, 1, 0, 1,
-0.8527786, 0.7767689, -0.1284739, 0.9019608, 1, 0, 1,
-0.8513734, -0.4469554, -1.907958, 0.8941177, 1, 0, 1,
-0.8498004, -0.6719314, -3.888654, 0.8901961, 1, 0, 1,
-0.8445048, 0.94518, -3.371845, 0.8823529, 1, 0, 1,
-0.8392028, 1.362598, -0.04705663, 0.8784314, 1, 0, 1,
-0.839125, -1.21495, -1.560708, 0.8705882, 1, 0, 1,
-0.8361283, 0.1787771, 0.7698059, 0.8666667, 1, 0, 1,
-0.8321161, -1.275609, -3.421516, 0.8588235, 1, 0, 1,
-0.8318704, -0.4745016, -0.8766121, 0.854902, 1, 0, 1,
-0.8222354, -1.352195, -2.83783, 0.8470588, 1, 0, 1,
-0.8197886, 0.04910533, -1.2089, 0.8431373, 1, 0, 1,
-0.8192161, 0.3736397, -2.08002, 0.8352941, 1, 0, 1,
-0.8123069, 1.058748, -1.215982, 0.8313726, 1, 0, 1,
-0.809307, 0.07257604, -2.770851, 0.8235294, 1, 0, 1,
-0.802339, 0.9759182, -1.405511, 0.8196079, 1, 0, 1,
-0.8004397, -1.208341, -0.6751541, 0.8117647, 1, 0, 1,
-0.7978874, 1.330541, -1.331602, 0.8078431, 1, 0, 1,
-0.7972206, -2.138741, -2.602832, 0.8, 1, 0, 1,
-0.7938222, 0.839712, -2.952, 0.7921569, 1, 0, 1,
-0.7895625, -0.2809363, -1.833178, 0.7882353, 1, 0, 1,
-0.7852497, 1.541911, -0.8648002, 0.7803922, 1, 0, 1,
-0.7815571, 0.01885742, -3.18849, 0.7764706, 1, 0, 1,
-0.7813559, -0.7346292, -2.187299, 0.7686275, 1, 0, 1,
-0.7786137, 0.118287, 0.9447367, 0.7647059, 1, 0, 1,
-0.7770696, -0.6621406, -4.09809, 0.7568628, 1, 0, 1,
-0.770775, 1.678279, -1.502581, 0.7529412, 1, 0, 1,
-0.7681516, 0.01807349, -2.057722, 0.7450981, 1, 0, 1,
-0.7650899, -0.5831661, -1.840573, 0.7411765, 1, 0, 1,
-0.7469032, -0.298379, -2.972304, 0.7333333, 1, 0, 1,
-0.7455997, 0.373365, 0.2072, 0.7294118, 1, 0, 1,
-0.7440274, -1.09623, -3.070591, 0.7215686, 1, 0, 1,
-0.7418865, -0.6402324, -1.348418, 0.7176471, 1, 0, 1,
-0.7367128, 2.280315, -0.3438939, 0.7098039, 1, 0, 1,
-0.7356098, -0.4355007, -4.123556, 0.7058824, 1, 0, 1,
-0.7311467, 1.744382, 1.630668, 0.6980392, 1, 0, 1,
-0.7277058, 0.8412051, 0.6828418, 0.6901961, 1, 0, 1,
-0.7267163, 0.9932719, -0.1308994, 0.6862745, 1, 0, 1,
-0.7235239, 2.203112, 0.6693294, 0.6784314, 1, 0, 1,
-0.7217414, 0.607702, -1.403322, 0.6745098, 1, 0, 1,
-0.7198866, 1.165566, -0.05709983, 0.6666667, 1, 0, 1,
-0.7166734, 0.3071881, -0.8897045, 0.6627451, 1, 0, 1,
-0.7164814, 0.5848011, -1.331392, 0.654902, 1, 0, 1,
-0.7110231, 0.6129141, -1.731499, 0.6509804, 1, 0, 1,
-0.7074257, 0.635951, 0.1558172, 0.6431373, 1, 0, 1,
-0.7061741, 0.0236262, -0.6340774, 0.6392157, 1, 0, 1,
-0.6956913, -1.851001, -2.585628, 0.6313726, 1, 0, 1,
-0.6949532, 1.048436, -1.516617, 0.627451, 1, 0, 1,
-0.6910031, 0.9383565, -1.261443, 0.6196079, 1, 0, 1,
-0.6909745, -1.267403, -3.025792, 0.6156863, 1, 0, 1,
-0.6888965, -0.5292014, -2.155474, 0.6078432, 1, 0, 1,
-0.6882589, 0.3281583, -2.044103, 0.6039216, 1, 0, 1,
-0.6882539, -0.8158172, -1.702605, 0.5960785, 1, 0, 1,
-0.6839505, 2.134839, -0.2998373, 0.5882353, 1, 0, 1,
-0.6838681, 0.1941695, -0.972515, 0.5843138, 1, 0, 1,
-0.6829346, 0.4489215, -1.091186, 0.5764706, 1, 0, 1,
-0.679545, -0.1001154, -3.063495, 0.572549, 1, 0, 1,
-0.6788591, 0.5047212, -0.6907647, 0.5647059, 1, 0, 1,
-0.6764711, -0.7689218, -2.511029, 0.5607843, 1, 0, 1,
-0.6733212, 0.02285418, -1.999303, 0.5529412, 1, 0, 1,
-0.6711251, 0.1721866, -0.6341744, 0.5490196, 1, 0, 1,
-0.6704174, -0.607049, -1.2532, 0.5411765, 1, 0, 1,
-0.6691086, 1.22333, 1.084056, 0.5372549, 1, 0, 1,
-0.6672507, 2.640297, -2.263074, 0.5294118, 1, 0, 1,
-0.6664656, 1.5094, 0.6717057, 0.5254902, 1, 0, 1,
-0.6611786, -1.158072, -3.9855, 0.5176471, 1, 0, 1,
-0.6567469, 1.122709, -1.893359, 0.5137255, 1, 0, 1,
-0.6550564, 0.007084391, -1.410724, 0.5058824, 1, 0, 1,
-0.6534956, -0.4535334, -1.106594, 0.5019608, 1, 0, 1,
-0.6533851, -0.4738029, -2.61527, 0.4941176, 1, 0, 1,
-0.6512245, 0.1651253, -1.784808, 0.4862745, 1, 0, 1,
-0.6505284, 1.344412, 0.7786279, 0.4823529, 1, 0, 1,
-0.6492341, 0.5505944, -1.3255, 0.4745098, 1, 0, 1,
-0.6442449, -0.757179, -2.576082, 0.4705882, 1, 0, 1,
-0.6431344, 0.4117221, -1.598815, 0.4627451, 1, 0, 1,
-0.6422573, -0.2003564, -1.226593, 0.4588235, 1, 0, 1,
-0.641556, 0.2472577, -0.3930063, 0.4509804, 1, 0, 1,
-0.6350594, 2.749022, -1.011281, 0.4470588, 1, 0, 1,
-0.6343025, -0.8517334, -2.060077, 0.4392157, 1, 0, 1,
-0.6298454, -0.4368799, -2.330792, 0.4352941, 1, 0, 1,
-0.6274627, 1.845609, -0.6093869, 0.427451, 1, 0, 1,
-0.6247867, -0.457809, -1.62963, 0.4235294, 1, 0, 1,
-0.615716, 1.090341, -0.9173539, 0.4156863, 1, 0, 1,
-0.6129523, -0.3230692, -3.452604, 0.4117647, 1, 0, 1,
-0.6059679, -0.2887625, -2.212428, 0.4039216, 1, 0, 1,
-0.6005022, 0.700161, -1.140209, 0.3960784, 1, 0, 1,
-0.5982851, -1.449957, -0.7015706, 0.3921569, 1, 0, 1,
-0.5968454, 2.377069, -0.8612814, 0.3843137, 1, 0, 1,
-0.5948939, -0.6936151, -1.56689, 0.3803922, 1, 0, 1,
-0.5944317, 0.286345, -0.3248158, 0.372549, 1, 0, 1,
-0.5927002, -0.3002688, -2.896962, 0.3686275, 1, 0, 1,
-0.5846741, -0.06481148, 0.197988, 0.3607843, 1, 0, 1,
-0.5799001, 0.6734807, -0.2017792, 0.3568628, 1, 0, 1,
-0.5798761, 0.06764597, 0.5413557, 0.3490196, 1, 0, 1,
-0.5778213, 0.2658322, -0.1982872, 0.345098, 1, 0, 1,
-0.5772988, -0.42181, -0.3088991, 0.3372549, 1, 0, 1,
-0.5719985, 0.4996843, -0.7195721, 0.3333333, 1, 0, 1,
-0.5547912, 0.5072821, -1.054106, 0.3254902, 1, 0, 1,
-0.5527961, -0.1486365, -3.080743, 0.3215686, 1, 0, 1,
-0.5527416, -1.432747, -1.242802, 0.3137255, 1, 0, 1,
-0.5470975, 0.5870517, -1.318297, 0.3098039, 1, 0, 1,
-0.5458034, -0.3604256, -2.26161, 0.3019608, 1, 0, 1,
-0.5457904, -0.1603721, -1.034864, 0.2941177, 1, 0, 1,
-0.540406, 0.4041833, 0.5854439, 0.2901961, 1, 0, 1,
-0.5353642, 1.403096, -0.168182, 0.282353, 1, 0, 1,
-0.534257, 0.6512949, -0.9433585, 0.2784314, 1, 0, 1,
-0.5306647, -1.195441, -4.301108, 0.2705882, 1, 0, 1,
-0.5294366, 0.6785865, -0.5707611, 0.2666667, 1, 0, 1,
-0.5262212, 1.921368, 1.115262, 0.2588235, 1, 0, 1,
-0.5260957, 0.6478866, 1.41459, 0.254902, 1, 0, 1,
-0.5224625, -0.2978747, -0.8786885, 0.2470588, 1, 0, 1,
-0.5221564, 1.320464, 1.427578, 0.2431373, 1, 0, 1,
-0.5173538, -1.05114, -3.791504, 0.2352941, 1, 0, 1,
-0.5131313, -0.08635143, -1.915331, 0.2313726, 1, 0, 1,
-0.5128996, -0.6958496, -1.528425, 0.2235294, 1, 0, 1,
-0.5126148, 2.569927, -0.358385, 0.2196078, 1, 0, 1,
-0.5084041, 0.0105522, -2.292887, 0.2117647, 1, 0, 1,
-0.5011656, 0.05916552, -0.7845156, 0.2078431, 1, 0, 1,
-0.4981745, 1.530399, -0.02566949, 0.2, 1, 0, 1,
-0.4969093, 0.6558851, 1.403873, 0.1921569, 1, 0, 1,
-0.4961948, -2.171792, -1.712229, 0.1882353, 1, 0, 1,
-0.4955654, 0.01790826, -2.055271, 0.1803922, 1, 0, 1,
-0.490012, -0.1920333, -1.770562, 0.1764706, 1, 0, 1,
-0.4868503, 0.2056435, -0.04158841, 0.1686275, 1, 0, 1,
-0.481821, 1.554537, -0.3162655, 0.1647059, 1, 0, 1,
-0.4794798, 0.142535, -2.715911, 0.1568628, 1, 0, 1,
-0.4777123, 0.2769777, 0.5804793, 0.1529412, 1, 0, 1,
-0.477073, 0.536949, -0.9443269, 0.145098, 1, 0, 1,
-0.4761212, 0.01879912, -1.125787, 0.1411765, 1, 0, 1,
-0.4754984, -0.2410286, -1.74445, 0.1333333, 1, 0, 1,
-0.4731942, 0.3427466, -1.750538, 0.1294118, 1, 0, 1,
-0.469834, 0.3985693, -0.5946013, 0.1215686, 1, 0, 1,
-0.4662897, 0.5513098, -0.4879209, 0.1176471, 1, 0, 1,
-0.465506, -0.9392261, -1.219311, 0.1098039, 1, 0, 1,
-0.4634357, 0.3554617, -0.4528738, 0.1058824, 1, 0, 1,
-0.4631321, 0.7724332, -1.423673, 0.09803922, 1, 0, 1,
-0.4617006, -0.2746771, -2.378637, 0.09019608, 1, 0, 1,
-0.4578395, -0.05219013, -1.412377, 0.08627451, 1, 0, 1,
-0.4540728, 1.718097, 0.2728836, 0.07843138, 1, 0, 1,
-0.4453321, -0.3637104, -3.248329, 0.07450981, 1, 0, 1,
-0.4439619, 1.264175, -1.95414, 0.06666667, 1, 0, 1,
-0.4394505, 1.068229, -1.088498, 0.0627451, 1, 0, 1,
-0.4391372, -0.4313126, -2.541232, 0.05490196, 1, 0, 1,
-0.4367925, 0.4094236, -1.144388, 0.05098039, 1, 0, 1,
-0.4367022, -0.7622376, -3.228015, 0.04313726, 1, 0, 1,
-0.4363343, -0.3748665, -2.835742, 0.03921569, 1, 0, 1,
-0.4253931, 0.7547411, -0.833563, 0.03137255, 1, 0, 1,
-0.4189231, 0.3661252, -1.573837, 0.02745098, 1, 0, 1,
-0.4152524, 0.2520116, -2.516382, 0.01960784, 1, 0, 1,
-0.4112313, 0.8649572, -0.6680072, 0.01568628, 1, 0, 1,
-0.4087004, -1.449373, -2.726892, 0.007843138, 1, 0, 1,
-0.4085396, 1.550853, 1.918134, 0.003921569, 1, 0, 1,
-0.4066662, 0.8655443, -2.981519, 0, 1, 0.003921569, 1,
-0.4034137, -1.618249, -4.284543, 0, 1, 0.01176471, 1,
-0.4010818, 0.8653228, 0.3611923, 0, 1, 0.01568628, 1,
-0.4000331, -1.338758, -3.907159, 0, 1, 0.02352941, 1,
-0.3921605, 0.7046319, -0.425154, 0, 1, 0.02745098, 1,
-0.3845751, -1.058996, -2.997953, 0, 1, 0.03529412, 1,
-0.3828664, 0.6679301, -0.9130623, 0, 1, 0.03921569, 1,
-0.3801301, -1.247292, -3.543342, 0, 1, 0.04705882, 1,
-0.3797797, 2.23322, -0.3262218, 0, 1, 0.05098039, 1,
-0.3797196, 0.3646607, -1.527751, 0, 1, 0.05882353, 1,
-0.3773129, -0.5102625, -2.629874, 0, 1, 0.0627451, 1,
-0.3751636, 0.1771618, -0.8994148, 0, 1, 0.07058824, 1,
-0.3749665, 0.8422927, -0.2959566, 0, 1, 0.07450981, 1,
-0.3728441, -0.4236766, -1.721717, 0, 1, 0.08235294, 1,
-0.370554, 0.7563405, 0.7931265, 0, 1, 0.08627451, 1,
-0.3697476, 0.9474859, -0.6240011, 0, 1, 0.09411765, 1,
-0.3631252, -0.8404976, -2.154577, 0, 1, 0.1019608, 1,
-0.3592647, 0.7602925, -0.4822858, 0, 1, 0.1058824, 1,
-0.358649, -0.7371552, -2.311348, 0, 1, 0.1137255, 1,
-0.3566657, -0.305072, -3.555781, 0, 1, 0.1176471, 1,
-0.353563, -0.7926736, -2.220665, 0, 1, 0.1254902, 1,
-0.3513781, 2.055985, 1.650658, 0, 1, 0.1294118, 1,
-0.3499698, 0.9343052, -0.2532699, 0, 1, 0.1372549, 1,
-0.3486719, -0.3466707, -3.152694, 0, 1, 0.1411765, 1,
-0.3442789, -2.39396, -3.813348, 0, 1, 0.1490196, 1,
-0.3386058, 0.7985883, -0.4014595, 0, 1, 0.1529412, 1,
-0.3362085, -1.056488, -3.791973, 0, 1, 0.1607843, 1,
-0.3322671, 0.9144205, 1.012225, 0, 1, 0.1647059, 1,
-0.330058, 1.051042, 0.2841296, 0, 1, 0.172549, 1,
-0.3300401, 0.3879834, 0.3904841, 0, 1, 0.1764706, 1,
-0.3260187, -0.4724999, -4.095984, 0, 1, 0.1843137, 1,
-0.3258396, 1.724115, -0.05697713, 0, 1, 0.1882353, 1,
-0.3247649, -1.695713, -2.515378, 0, 1, 0.1960784, 1,
-0.3220601, 0.1738404, -1.216509, 0, 1, 0.2039216, 1,
-0.3189874, -1.436513, -2.878198, 0, 1, 0.2078431, 1,
-0.3186469, 1.376307, 0.04186613, 0, 1, 0.2156863, 1,
-0.3184944, 1.066239, 0.09855351, 0, 1, 0.2196078, 1,
-0.3173923, -0.5382841, -2.537658, 0, 1, 0.227451, 1,
-0.317156, 1.5821, 0.5971746, 0, 1, 0.2313726, 1,
-0.3166988, 0.08743507, -1.707976, 0, 1, 0.2392157, 1,
-0.3164745, -0.9437124, -2.714076, 0, 1, 0.2431373, 1,
-0.3149366, 1.185743, -0.1654826, 0, 1, 0.2509804, 1,
-0.3101546, 0.9361666, -0.3660282, 0, 1, 0.254902, 1,
-0.3080234, -0.01797437, -2.014848, 0, 1, 0.2627451, 1,
-0.3073643, 0.6007029, 0.5404151, 0, 1, 0.2666667, 1,
-0.305668, 0.9843462, -0.3969958, 0, 1, 0.2745098, 1,
-0.3043759, -0.978638, -2.387454, 0, 1, 0.2784314, 1,
-0.3035376, -0.8285536, -2.109419, 0, 1, 0.2862745, 1,
-0.3029852, -1.060301, -3.621249, 0, 1, 0.2901961, 1,
-0.301505, -0.5136225, -3.54893, 0, 1, 0.2980392, 1,
-0.2990941, -1.826814, -3.470051, 0, 1, 0.3058824, 1,
-0.2977572, -1.34962, -2.506779, 0, 1, 0.3098039, 1,
-0.2967526, -1.095892, -2.120424, 0, 1, 0.3176471, 1,
-0.2939392, -0.02349894, -4.001318, 0, 1, 0.3215686, 1,
-0.2915707, -2.248259, -2.985117, 0, 1, 0.3294118, 1,
-0.288827, 0.3018141, -0.8888834, 0, 1, 0.3333333, 1,
-0.2865449, -1.067453, -2.436217, 0, 1, 0.3411765, 1,
-0.2844729, 0.2103661, -0.238219, 0, 1, 0.345098, 1,
-0.2807473, -0.83001, -3.343107, 0, 1, 0.3529412, 1,
-0.2758262, 1.572428, -0.2202937, 0, 1, 0.3568628, 1,
-0.2725457, -0.8316224, -2.306418, 0, 1, 0.3647059, 1,
-0.2591335, 0.9582525, 0.1772564, 0, 1, 0.3686275, 1,
-0.2557189, 0.443244, -1.402243, 0, 1, 0.3764706, 1,
-0.2550476, -0.7288768, -3.740659, 0, 1, 0.3803922, 1,
-0.2540715, 0.5200764, -0.2446976, 0, 1, 0.3882353, 1,
-0.2540574, 0.4566874, -0.7034679, 0, 1, 0.3921569, 1,
-0.2515688, -0.5668288, -1.987365, 0, 1, 0.4, 1,
-0.2451808, 0.4384191, -1.319399, 0, 1, 0.4078431, 1,
-0.2449848, -0.2062369, -2.407021, 0, 1, 0.4117647, 1,
-0.2444032, 1.502026, 0.595228, 0, 1, 0.4196078, 1,
-0.2406621, -1.545894, -3.915039, 0, 1, 0.4235294, 1,
-0.2405633, 0.7723127, 2.471453, 0, 1, 0.4313726, 1,
-0.2379018, 1.281193, 0.3438446, 0, 1, 0.4352941, 1,
-0.2302613, -1.737377, -3.558, 0, 1, 0.4431373, 1,
-0.2264578, 0.09037881, -0.8902489, 0, 1, 0.4470588, 1,
-0.2198676, 0.5496662, 0.8147281, 0, 1, 0.454902, 1,
-0.2197976, 1.742054, -0.2877135, 0, 1, 0.4588235, 1,
-0.2192256, 0.1357375, -1.262317, 0, 1, 0.4666667, 1,
-0.2172421, 0.8648967, 0.8592412, 0, 1, 0.4705882, 1,
-0.2166224, 1.492776, -0.1474403, 0, 1, 0.4784314, 1,
-0.2137676, -0.8211008, -3.577999, 0, 1, 0.4823529, 1,
-0.2125785, 0.2995542, 0.1492187, 0, 1, 0.4901961, 1,
-0.2115058, -1.79218, -3.39677, 0, 1, 0.4941176, 1,
-0.2066317, 0.1154263, -0.6931615, 0, 1, 0.5019608, 1,
-0.2022506, -0.252532, -3.281108, 0, 1, 0.509804, 1,
-0.1985087, 0.8931378, -1.271782, 0, 1, 0.5137255, 1,
-0.1983616, 0.6394099, 0.8391634, 0, 1, 0.5215687, 1,
-0.1977952, -1.299454, -4.683747, 0, 1, 0.5254902, 1,
-0.1974719, -0.3979638, -0.9626154, 0, 1, 0.5333334, 1,
-0.1936678, -0.06478994, -1.370713, 0, 1, 0.5372549, 1,
-0.1931895, -0.08189156, -3.032368, 0, 1, 0.5450981, 1,
-0.1926635, 0.3954109, -1.130601, 0, 1, 0.5490196, 1,
-0.1903254, 0.2440905, -1.488288, 0, 1, 0.5568628, 1,
-0.1885018, 0.880946, -0.7386931, 0, 1, 0.5607843, 1,
-0.1884898, -1.323385, -1.220285, 0, 1, 0.5686275, 1,
-0.1878565, -0.6309498, -4.126852, 0, 1, 0.572549, 1,
-0.1876066, -1.090906, -4.69483, 0, 1, 0.5803922, 1,
-0.1724157, 0.009895924, -1.940807, 0, 1, 0.5843138, 1,
-0.1719678, 0.8233141, -1.27635, 0, 1, 0.5921569, 1,
-0.1625628, -1.50712, -4.202198, 0, 1, 0.5960785, 1,
-0.1600279, 0.2925556, 1.228508, 0, 1, 0.6039216, 1,
-0.1556417, 1.421311, -0.4588367, 0, 1, 0.6117647, 1,
-0.1547286, 1.079496, -0.01296069, 0, 1, 0.6156863, 1,
-0.1535145, 0.3090538, -1.123634, 0, 1, 0.6235294, 1,
-0.1527915, -1.29313, -3.952703, 0, 1, 0.627451, 1,
-0.1518681, 1.003955, 0.3832783, 0, 1, 0.6352941, 1,
-0.1515534, 1.431528, 0.09324289, 0, 1, 0.6392157, 1,
-0.1514825, 1.069999, -2.21692, 0, 1, 0.6470588, 1,
-0.145992, -1.407084, -4.220792, 0, 1, 0.6509804, 1,
-0.1451415, -0.3980879, -2.8532, 0, 1, 0.6588235, 1,
-0.1420221, -0.07166853, -2.72009, 0, 1, 0.6627451, 1,
-0.1407622, -0.8542531, -2.131298, 0, 1, 0.6705883, 1,
-0.1392113, -0.7003424, -2.175813, 0, 1, 0.6745098, 1,
-0.1383918, 0.04900368, -1.496235, 0, 1, 0.682353, 1,
-0.137726, 1.02004, -0.1261323, 0, 1, 0.6862745, 1,
-0.1354584, 0.9511616, -0.246993, 0, 1, 0.6941177, 1,
-0.1314082, -0.3164896, -2.020641, 0, 1, 0.7019608, 1,
-0.1312698, -0.8554196, -2.383667, 0, 1, 0.7058824, 1,
-0.1301482, 0.2876864, -0.3969441, 0, 1, 0.7137255, 1,
-0.1295344, -0.582063, -2.751977, 0, 1, 0.7176471, 1,
-0.1247978, 0.1623258, -0.4134676, 0, 1, 0.7254902, 1,
-0.1037081, 0.3020083, -0.8763112, 0, 1, 0.7294118, 1,
-0.1034512, 0.6479278, -1.158223, 0, 1, 0.7372549, 1,
-0.1034111, -0.5115278, -2.19592, 0, 1, 0.7411765, 1,
-0.09671447, -0.9691259, -2.459794, 0, 1, 0.7490196, 1,
-0.09490952, 1.449968, -0.5472335, 0, 1, 0.7529412, 1,
-0.09265973, -0.01814817, -3.179386, 0, 1, 0.7607843, 1,
-0.09192444, -1.145178, -1.874344, 0, 1, 0.7647059, 1,
-0.09026887, 0.6260527, -1.924574, 0, 1, 0.772549, 1,
-0.09009375, 1.82056, 0.003914825, 0, 1, 0.7764706, 1,
-0.08817802, -0.804193, -1.39501, 0, 1, 0.7843137, 1,
-0.08759872, 0.6183169, 0.3316036, 0, 1, 0.7882353, 1,
-0.0859239, -0.8094313, -1.310615, 0, 1, 0.7960784, 1,
-0.08316503, 1.287305, 1.259102, 0, 1, 0.8039216, 1,
-0.07635217, 0.1238408, -0.4799697, 0, 1, 0.8078431, 1,
-0.07192452, -0.3972084, -2.976056, 0, 1, 0.8156863, 1,
-0.07130368, 0.9224245, 2.085477, 0, 1, 0.8196079, 1,
-0.07027594, 0.3025057, -0.7069921, 0, 1, 0.827451, 1,
-0.06865193, 0.284487, 0.2867054, 0, 1, 0.8313726, 1,
-0.06731872, 0.599175, 0.1503604, 0, 1, 0.8392157, 1,
-0.06547444, 0.2533799, 0.5663936, 0, 1, 0.8431373, 1,
-0.06364643, -0.6816883, -4.041217, 0, 1, 0.8509804, 1,
-0.06101615, -1.286876, -3.231687, 0, 1, 0.854902, 1,
-0.05891721, -1.739421, -2.778238, 0, 1, 0.8627451, 1,
-0.05508465, 0.01759818, 0.1399878, 0, 1, 0.8666667, 1,
-0.05327046, -0.2810299, -1.915942, 0, 1, 0.8745098, 1,
-0.0519949, 1.170673, 0.1803623, 0, 1, 0.8784314, 1,
-0.05175763, -1.832356, -2.583604, 0, 1, 0.8862745, 1,
-0.04941609, -0.3601865, -3.802154, 0, 1, 0.8901961, 1,
-0.04716923, 0.5811713, 0.05092158, 0, 1, 0.8980392, 1,
-0.04532852, -0.3182774, -2.973664, 0, 1, 0.9058824, 1,
-0.04460146, -0.1069618, -2.191842, 0, 1, 0.9098039, 1,
-0.04384801, 0.6101081, -1.021697, 0, 1, 0.9176471, 1,
-0.04215319, -0.04677822, -2.044861, 0, 1, 0.9215686, 1,
-0.04213287, 0.03352204, -1.405811, 0, 1, 0.9294118, 1,
-0.04156518, 0.8399032, 2.000016, 0, 1, 0.9333333, 1,
-0.04096864, 0.03474198, -0.4018196, 0, 1, 0.9411765, 1,
-0.03950743, 1.626988, 0.4890114, 0, 1, 0.945098, 1,
-0.03898488, -0.7108943, -3.344182, 0, 1, 0.9529412, 1,
-0.03658329, -1.376532, -2.176772, 0, 1, 0.9568627, 1,
-0.03273949, -0.2763183, -2.894633, 0, 1, 0.9647059, 1,
-0.03193404, -0.03790409, -1.767292, 0, 1, 0.9686275, 1,
-0.02731999, -0.3122779, -3.694642, 0, 1, 0.9764706, 1,
-0.02485444, 0.03105529, -3.108405, 0, 1, 0.9803922, 1,
-0.02372512, 0.3445563, -0.7081076, 0, 1, 0.9882353, 1,
-0.02201148, -0.9100887, -3.986683, 0, 1, 0.9921569, 1,
-0.0155619, 0.06099902, 0.3037023, 0, 1, 1, 1,
-0.01374978, -0.4668989, -3.015064, 0, 0.9921569, 1, 1,
-0.01267078, 1.074224, -0.6951375, 0, 0.9882353, 1, 1,
-0.008699243, 0.1182458, -0.9630078, 0, 0.9803922, 1, 1,
-0.007725856, 1.242604, 1.539067, 0, 0.9764706, 1, 1,
-0.006411956, 1.150384, 1.135942, 0, 0.9686275, 1, 1,
0.01283896, -1.35293, 3.327276, 0, 0.9647059, 1, 1,
0.0173279, 0.02007233, -1.144679, 0, 0.9568627, 1, 1,
0.01767573, 0.9264256, -0.3279712, 0, 0.9529412, 1, 1,
0.02481098, -0.3115463, 3.349938, 0, 0.945098, 1, 1,
0.0278422, 0.09346831, 0.4859504, 0, 0.9411765, 1, 1,
0.03410612, -0.5885642, 2.216661, 0, 0.9333333, 1, 1,
0.03488726, 0.8658806, 0.07254132, 0, 0.9294118, 1, 1,
0.03531114, 0.6698356, 0.4638247, 0, 0.9215686, 1, 1,
0.03610172, -0.2808283, 3.308125, 0, 0.9176471, 1, 1,
0.03650459, -1.152445, 3.010637, 0, 0.9098039, 1, 1,
0.03915959, -0.1099334, 3.830081, 0, 0.9058824, 1, 1,
0.04075828, 2.57142, 0.2602264, 0, 0.8980392, 1, 1,
0.04700936, -2.289923, 4.533895, 0, 0.8901961, 1, 1,
0.04926927, -0.8375021, 2.897356, 0, 0.8862745, 1, 1,
0.05768244, 0.4385651, -0.9804078, 0, 0.8784314, 1, 1,
0.05813629, 0.9031702, -0.3959877, 0, 0.8745098, 1, 1,
0.05960378, 0.2474751, -0.3771055, 0, 0.8666667, 1, 1,
0.06205876, -0.441712, 2.287927, 0, 0.8627451, 1, 1,
0.06501509, -0.7422739, 1.264847, 0, 0.854902, 1, 1,
0.06878483, -0.5728696, 2.408168, 0, 0.8509804, 1, 1,
0.07052942, 0.5496444, -1.113232, 0, 0.8431373, 1, 1,
0.07223352, -0.7338215, 2.658186, 0, 0.8392157, 1, 1,
0.0727128, -0.4844055, 4.677235, 0, 0.8313726, 1, 1,
0.07304829, 0.397223, 2.055163, 0, 0.827451, 1, 1,
0.07359684, 0.3509388, 0.8163915, 0, 0.8196079, 1, 1,
0.07410744, 0.5855029, 0.4842925, 0, 0.8156863, 1, 1,
0.07798187, 0.02040335, 0.5220636, 0, 0.8078431, 1, 1,
0.07802707, 0.5907922, -0.7328827, 0, 0.8039216, 1, 1,
0.0783157, 1.307877, -1.661233, 0, 0.7960784, 1, 1,
0.08006846, -0.7718594, 2.982109, 0, 0.7882353, 1, 1,
0.08493493, -0.9875936, 2.170324, 0, 0.7843137, 1, 1,
0.08623955, 0.3628099, 1.636002, 0, 0.7764706, 1, 1,
0.08684465, 1.444845, 1.09501, 0, 0.772549, 1, 1,
0.08893632, 0.9729196, -1.265135, 0, 0.7647059, 1, 1,
0.090625, 0.5946325, 2.006916, 0, 0.7607843, 1, 1,
0.09192587, 0.8844569, 0.1465076, 0, 0.7529412, 1, 1,
0.0930531, 0.3421091, -2.015105, 0, 0.7490196, 1, 1,
0.0956095, 1.239866, 1.066933, 0, 0.7411765, 1, 1,
0.1042982, -0.4189999, 1.263906, 0, 0.7372549, 1, 1,
0.1051287, 1.150574, 0.8765541, 0, 0.7294118, 1, 1,
0.1056964, 0.1975005, -0.04688507, 0, 0.7254902, 1, 1,
0.108353, -0.7301553, 3.264944, 0, 0.7176471, 1, 1,
0.1091306, 0.1513571, -1.541697, 0, 0.7137255, 1, 1,
0.1093892, -0.1303481, 3.165386, 0, 0.7058824, 1, 1,
0.1109168, 0.2921472, 0.2672718, 0, 0.6980392, 1, 1,
0.1141303, -1.599275, 1.695703, 0, 0.6941177, 1, 1,
0.1150915, -1.386637, 1.574575, 0, 0.6862745, 1, 1,
0.1278472, -0.1954096, 2.089891, 0, 0.682353, 1, 1,
0.1317502, 0.4619201, 0.1839969, 0, 0.6745098, 1, 1,
0.1321253, 0.0793208, 1.442066, 0, 0.6705883, 1, 1,
0.1323564, -0.7766183, 2.19668, 0, 0.6627451, 1, 1,
0.1340525, 0.1277718, 0.8980701, 0, 0.6588235, 1, 1,
0.1359501, 0.2493756, 1.518388, 0, 0.6509804, 1, 1,
0.1370034, 0.3273989, 1.47126, 0, 0.6470588, 1, 1,
0.1374831, -1.244985, 2.300614, 0, 0.6392157, 1, 1,
0.1427285, 0.2267853, 1.624425, 0, 0.6352941, 1, 1,
0.1449447, -0.5429498, 3.43364, 0, 0.627451, 1, 1,
0.1581601, 1.158923, -0.3792903, 0, 0.6235294, 1, 1,
0.1581824, -0.1481996, 1.643126, 0, 0.6156863, 1, 1,
0.1598051, -2.68905, 3.491184, 0, 0.6117647, 1, 1,
0.1619759, -0.2729928, 5.157942, 0, 0.6039216, 1, 1,
0.1652519, -1.2495, 3.546504, 0, 0.5960785, 1, 1,
0.1662074, 0.7886569, 0.215395, 0, 0.5921569, 1, 1,
0.1679647, 1.181911, -0.1587559, 0, 0.5843138, 1, 1,
0.1701032, 1.464017, 1.315383, 0, 0.5803922, 1, 1,
0.17032, -0.2675565, 4.646588, 0, 0.572549, 1, 1,
0.1724592, 0.4457926, 0.06237366, 0, 0.5686275, 1, 1,
0.1758338, 0.2454744, 1.892258, 0, 0.5607843, 1, 1,
0.1906758, -0.2826201, 2.994625, 0, 0.5568628, 1, 1,
0.1921504, 1.469301, -1.637206, 0, 0.5490196, 1, 1,
0.193337, 0.9377807, -2.167041, 0, 0.5450981, 1, 1,
0.2038149, -0.0681639, 0.8849023, 0, 0.5372549, 1, 1,
0.2041693, -0.06400625, 2.981366, 0, 0.5333334, 1, 1,
0.2052122, 0.6691088, 2.063348, 0, 0.5254902, 1, 1,
0.2055257, -0.2570297, 0.9335991, 0, 0.5215687, 1, 1,
0.2075807, -0.9391965, 3.942688, 0, 0.5137255, 1, 1,
0.2124394, 0.8995301, -0.1371133, 0, 0.509804, 1, 1,
0.2171089, 0.4434235, 0.3161549, 0, 0.5019608, 1, 1,
0.2191453, -0.08890208, 1.878973, 0, 0.4941176, 1, 1,
0.2278056, 1.976827, -0.756483, 0, 0.4901961, 1, 1,
0.2303838, 0.5329152, -0.6900863, 0, 0.4823529, 1, 1,
0.2337339, 1.812674, -0.7128254, 0, 0.4784314, 1, 1,
0.2343721, -2.219135, 3.499944, 0, 0.4705882, 1, 1,
0.2424874, -1.967421, 2.868068, 0, 0.4666667, 1, 1,
0.2428072, 1.347351, 0.7193282, 0, 0.4588235, 1, 1,
0.2431356, 0.1330098, 0.6000904, 0, 0.454902, 1, 1,
0.2440228, 0.7750778, -0.9509844, 0, 0.4470588, 1, 1,
0.2503833, -1.666607, 2.053482, 0, 0.4431373, 1, 1,
0.2627603, 0.1501932, 0.9940812, 0, 0.4352941, 1, 1,
0.2636859, -0.3125128, 3.753027, 0, 0.4313726, 1, 1,
0.2693135, 0.6325892, 1.489462, 0, 0.4235294, 1, 1,
0.2730331, 0.1059693, 1.424282, 0, 0.4196078, 1, 1,
0.2752569, 0.2262473, -0.4780614, 0, 0.4117647, 1, 1,
0.2754976, -0.09833365, 1.950685, 0, 0.4078431, 1, 1,
0.2757354, -1.252298, 4.519416, 0, 0.4, 1, 1,
0.2761814, -0.7936139, 3.007184, 0, 0.3921569, 1, 1,
0.277418, -0.06910238, 1.962229, 0, 0.3882353, 1, 1,
0.2786582, -1.649116, 1.322008, 0, 0.3803922, 1, 1,
0.2793918, -0.3775361, 3.274953, 0, 0.3764706, 1, 1,
0.2809827, 1.169677, 0.4554525, 0, 0.3686275, 1, 1,
0.2827376, -0.0258123, 2.216543, 0, 0.3647059, 1, 1,
0.2832573, 1.605936, 1.390084, 0, 0.3568628, 1, 1,
0.2946081, 0.5433939, 0.6069387, 0, 0.3529412, 1, 1,
0.2967426, -1.31735, 2.780674, 0, 0.345098, 1, 1,
0.2984403, -0.760654, 4.124408, 0, 0.3411765, 1, 1,
0.3012582, 0.9767424, -0.4999167, 0, 0.3333333, 1, 1,
0.301954, 0.04042732, 3.758607, 0, 0.3294118, 1, 1,
0.3036208, 0.5666255, -0.004959695, 0, 0.3215686, 1, 1,
0.3049203, 1.153694, -0.2311179, 0, 0.3176471, 1, 1,
0.3059353, 0.3635724, 0.4920839, 0, 0.3098039, 1, 1,
0.3072119, 0.5701159, 1.677991, 0, 0.3058824, 1, 1,
0.3086121, -1.42008, 3.074139, 0, 0.2980392, 1, 1,
0.3147234, -0.004563702, 1.311587, 0, 0.2901961, 1, 1,
0.315213, 0.929207, -0.8058116, 0, 0.2862745, 1, 1,
0.3171924, -0.5114849, 1.73458, 0, 0.2784314, 1, 1,
0.3204607, 0.1464414, -0.09200908, 0, 0.2745098, 1, 1,
0.3283946, 1.118931, 1.380125, 0, 0.2666667, 1, 1,
0.3287137, 0.3046712, 0.7641234, 0, 0.2627451, 1, 1,
0.3321354, 1.770494, 0.01895455, 0, 0.254902, 1, 1,
0.332702, 1.255908, 1.451545, 0, 0.2509804, 1, 1,
0.3372406, -1.052728, 2.714756, 0, 0.2431373, 1, 1,
0.3406145, 1.468521, -1.099871, 0, 0.2392157, 1, 1,
0.3444754, 1.819018, -0.4943365, 0, 0.2313726, 1, 1,
0.3462994, 0.6284087, 0.3804761, 0, 0.227451, 1, 1,
0.3475223, -0.294878, 3.370928, 0, 0.2196078, 1, 1,
0.3479177, -0.4221006, 3.064439, 0, 0.2156863, 1, 1,
0.3482895, 0.278548, -1.50158, 0, 0.2078431, 1, 1,
0.3500133, 1.379953, 0.5544407, 0, 0.2039216, 1, 1,
0.3500857, 0.601047, 1.242272, 0, 0.1960784, 1, 1,
0.3501662, 0.1530117, 1.127456, 0, 0.1882353, 1, 1,
0.3539533, -0.8315259, 1.847407, 0, 0.1843137, 1, 1,
0.3563639, 0.5727493, -0.4523831, 0, 0.1764706, 1, 1,
0.3570367, 1.019456, 0.7760607, 0, 0.172549, 1, 1,
0.3597558, -0.009753889, -0.1765251, 0, 0.1647059, 1, 1,
0.3600408, -0.4783542, 2.197223, 0, 0.1607843, 1, 1,
0.3622206, -0.4609201, 2.671941, 0, 0.1529412, 1, 1,
0.3627074, -1.26293, 0.6184369, 0, 0.1490196, 1, 1,
0.3630019, -0.1192876, 1.738135, 0, 0.1411765, 1, 1,
0.3684961, -0.1457101, 1.145841, 0, 0.1372549, 1, 1,
0.3704633, 0.4078718, 2.049536, 0, 0.1294118, 1, 1,
0.3746484, -0.6218179, 2.707432, 0, 0.1254902, 1, 1,
0.3756506, 0.1855663, 2.123389, 0, 0.1176471, 1, 1,
0.3761141, -0.6303179, 2.678718, 0, 0.1137255, 1, 1,
0.3787661, 0.1373423, 0.2991789, 0, 0.1058824, 1, 1,
0.3788599, -2.388325, 3.756734, 0, 0.09803922, 1, 1,
0.3811138, -1.265838, 3.15032, 0, 0.09411765, 1, 1,
0.3849072, 0.1679229, 0.6216623, 0, 0.08627451, 1, 1,
0.3879258, -2.35034, 2.618358, 0, 0.08235294, 1, 1,
0.3998367, -0.5035707, 1.611863, 0, 0.07450981, 1, 1,
0.4021943, 1.829008, -1.277462, 0, 0.07058824, 1, 1,
0.4026261, -1.273962, 1.095611, 0, 0.0627451, 1, 1,
0.4081042, -0.5464535, 1.942298, 0, 0.05882353, 1, 1,
0.408248, 0.4109326, 2.946326, 0, 0.05098039, 1, 1,
0.4116257, 0.2348862, 1.53252, 0, 0.04705882, 1, 1,
0.4121601, 0.3662039, 2.508301, 0, 0.03921569, 1, 1,
0.4123047, -0.6425909, 4.78142, 0, 0.03529412, 1, 1,
0.4183768, -1.486949, 2.697417, 0, 0.02745098, 1, 1,
0.4231339, -1.491752, 1.713888, 0, 0.02352941, 1, 1,
0.4266073, -0.1633925, 1.416376, 0, 0.01568628, 1, 1,
0.4292718, -1.832172, 5.67797, 0, 0.01176471, 1, 1,
0.4336731, -1.043016, 2.442894, 0, 0.003921569, 1, 1,
0.4343944, 0.09708205, 1.084961, 0.003921569, 0, 1, 1,
0.4374869, -0.004230643, 0.90323, 0.007843138, 0, 1, 1,
0.4381062, -0.6803211, 3.822571, 0.01568628, 0, 1, 1,
0.4397942, 1.016124, 0.4037721, 0.01960784, 0, 1, 1,
0.4403038, -0.7326099, 1.837412, 0.02745098, 0, 1, 1,
0.441875, 0.06394546, 0.8449907, 0.03137255, 0, 1, 1,
0.4653873, 0.1125647, 0.7089912, 0.03921569, 0, 1, 1,
0.4674924, 0.9033437, -0.4498949, 0.04313726, 0, 1, 1,
0.4699069, -0.2399805, 1.592345, 0.05098039, 0, 1, 1,
0.470967, 0.3617312, 1.200917, 0.05490196, 0, 1, 1,
0.4714278, 0.6788949, 0.9620689, 0.0627451, 0, 1, 1,
0.4732813, 0.2921811, 0.2205007, 0.06666667, 0, 1, 1,
0.4748623, -0.3586464, 2.5691, 0.07450981, 0, 1, 1,
0.4758798, -1.501678, 2.026655, 0.07843138, 0, 1, 1,
0.4804529, 0.617682, 0.8702774, 0.08627451, 0, 1, 1,
0.4818197, -0.6277401, 1.808252, 0.09019608, 0, 1, 1,
0.4902069, -0.9385528, 2.064708, 0.09803922, 0, 1, 1,
0.4912249, -0.4361638, 0.4330991, 0.1058824, 0, 1, 1,
0.4928642, -1.208375, 2.773928, 0.1098039, 0, 1, 1,
0.4979867, -0.3906281, 1.624367, 0.1176471, 0, 1, 1,
0.4996422, -0.1471574, 2.856134, 0.1215686, 0, 1, 1,
0.5097926, -0.8086227, 3.91901, 0.1294118, 0, 1, 1,
0.5212082, 1.965651, 1.896937, 0.1333333, 0, 1, 1,
0.5299169, 0.09154427, 0.9881435, 0.1411765, 0, 1, 1,
0.5344399, 0.7940776, 0.1111287, 0.145098, 0, 1, 1,
0.5346276, 0.3639645, 0.5370759, 0.1529412, 0, 1, 1,
0.5354304, 1.062344, 0.9034787, 0.1568628, 0, 1, 1,
0.5363736, 2.097111, 1.095751, 0.1647059, 0, 1, 1,
0.5379643, -0.08712661, 2.188246, 0.1686275, 0, 1, 1,
0.5450465, -0.9537109, 2.780044, 0.1764706, 0, 1, 1,
0.5460538, 1.89537, -0.6408939, 0.1803922, 0, 1, 1,
0.5463794, 0.2667753, 1.408575, 0.1882353, 0, 1, 1,
0.5465073, -0.7880681, 1.354904, 0.1921569, 0, 1, 1,
0.5524569, -1.439117, 1.908149, 0.2, 0, 1, 1,
0.552568, 0.2299802, -0.07859823, 0.2078431, 0, 1, 1,
0.5554258, -0.9515955, 1.301806, 0.2117647, 0, 1, 1,
0.5563242, 1.322116, -0.4675184, 0.2196078, 0, 1, 1,
0.558596, -0.7289746, 1.010461, 0.2235294, 0, 1, 1,
0.5592508, 0.3742833, 2.48805, 0.2313726, 0, 1, 1,
0.5696449, -1.438102, 4.64456, 0.2352941, 0, 1, 1,
0.570522, 0.08064476, 1.13396, 0.2431373, 0, 1, 1,
0.578168, -0.4212222, 1.51829, 0.2470588, 0, 1, 1,
0.5784517, 1.375337, 1.768148, 0.254902, 0, 1, 1,
0.5797469, 0.4557933, 1.969152, 0.2588235, 0, 1, 1,
0.581287, -0.4933728, 2.841902, 0.2666667, 0, 1, 1,
0.5837877, -0.6665429, 3.653038, 0.2705882, 0, 1, 1,
0.5911353, -0.4673814, 2.010329, 0.2784314, 0, 1, 1,
0.5951107, 1.187147, 1.6988, 0.282353, 0, 1, 1,
0.5975119, 1.304786, -0.2959151, 0.2901961, 0, 1, 1,
0.600168, -0.2226516, 1.020882, 0.2941177, 0, 1, 1,
0.6020944, -1.09133, 1.302366, 0.3019608, 0, 1, 1,
0.6025568, -0.1038774, 0.3043764, 0.3098039, 0, 1, 1,
0.6033705, 0.1389895, 0.3495311, 0.3137255, 0, 1, 1,
0.6044647, -0.8576754, 3.440048, 0.3215686, 0, 1, 1,
0.6053575, -1.087871, 2.095888, 0.3254902, 0, 1, 1,
0.6072319, -1.232966, 2.480492, 0.3333333, 0, 1, 1,
0.6121929, -0.3141938, 2.014819, 0.3372549, 0, 1, 1,
0.6162602, -0.9156498, 1.678898, 0.345098, 0, 1, 1,
0.6179238, -1.474366, 1.120696, 0.3490196, 0, 1, 1,
0.6253017, 0.1214172, 0.9755129, 0.3568628, 0, 1, 1,
0.6255388, 0.3189843, 1.318634, 0.3607843, 0, 1, 1,
0.6258445, 0.7001366, 1.221989, 0.3686275, 0, 1, 1,
0.6294174, -0.6742229, 2.512741, 0.372549, 0, 1, 1,
0.638612, -0.03285151, 3.019961, 0.3803922, 0, 1, 1,
0.6390287, -1.147298, 2.053646, 0.3843137, 0, 1, 1,
0.6395858, 1.039081, 2.13921, 0.3921569, 0, 1, 1,
0.6475146, 0.9506528, 1.657177, 0.3960784, 0, 1, 1,
0.6534795, 1.666991, 2.201201, 0.4039216, 0, 1, 1,
0.664041, -0.8835716, 2.848489, 0.4117647, 0, 1, 1,
0.6740115, 0.4923454, -0.0280189, 0.4156863, 0, 1, 1,
0.6756532, 2.140835, 2.269954, 0.4235294, 0, 1, 1,
0.67733, 0.2042568, -0.1069662, 0.427451, 0, 1, 1,
0.6787279, 1.901162, -0.0602244, 0.4352941, 0, 1, 1,
0.681002, 0.005101906, 1.833868, 0.4392157, 0, 1, 1,
0.6811005, 0.2927906, 0.8712676, 0.4470588, 0, 1, 1,
0.6849419, -0.9433337, 1.737002, 0.4509804, 0, 1, 1,
0.689199, 0.09045019, 0.6663489, 0.4588235, 0, 1, 1,
0.6949093, 0.2031164, 1.296242, 0.4627451, 0, 1, 1,
0.6976151, 0.8190427, 0.02695079, 0.4705882, 0, 1, 1,
0.6977882, -0.6583446, 3.183626, 0.4745098, 0, 1, 1,
0.6994487, -0.4692483, 4.246999, 0.4823529, 0, 1, 1,
0.7015789, -0.2497237, 2.798618, 0.4862745, 0, 1, 1,
0.7016718, 0.2718317, 0.5355033, 0.4941176, 0, 1, 1,
0.7051806, -1.005143, 1.899489, 0.5019608, 0, 1, 1,
0.7054827, -0.06010228, 3.153623, 0.5058824, 0, 1, 1,
0.7073373, 0.4016494, 0.8476423, 0.5137255, 0, 1, 1,
0.7081332, -0.1925306, 2.509018, 0.5176471, 0, 1, 1,
0.7096783, -1.233093, 3.154863, 0.5254902, 0, 1, 1,
0.7097028, -0.678004, 1.418365, 0.5294118, 0, 1, 1,
0.7148383, -0.2936386, 2.892133, 0.5372549, 0, 1, 1,
0.7170249, 0.1038532, 2.303402, 0.5411765, 0, 1, 1,
0.7183145, 1.503641, 0.6805753, 0.5490196, 0, 1, 1,
0.7183163, 1.204248, 0.1303718, 0.5529412, 0, 1, 1,
0.7195573, 0.4190029, 1.735169, 0.5607843, 0, 1, 1,
0.7203424, 1.08773, 0.9451968, 0.5647059, 0, 1, 1,
0.7247484, -1.463269, 2.6455, 0.572549, 0, 1, 1,
0.7267919, 0.5231844, 2.749484, 0.5764706, 0, 1, 1,
0.7293122, -0.03835078, 0.6733415, 0.5843138, 0, 1, 1,
0.7365645, 1.001096, 0.1846245, 0.5882353, 0, 1, 1,
0.7457339, -1.133592, 3.343622, 0.5960785, 0, 1, 1,
0.7457678, -0.6005349, 0.8361035, 0.6039216, 0, 1, 1,
0.7457893, -0.4907103, 2.508535, 0.6078432, 0, 1, 1,
0.7474217, 1.672986, -1.563217, 0.6156863, 0, 1, 1,
0.7480915, 0.7804399, 0.9753873, 0.6196079, 0, 1, 1,
0.7487997, 1.41776, 0.4694524, 0.627451, 0, 1, 1,
0.7492712, 2.203264, 0.1009971, 0.6313726, 0, 1, 1,
0.752219, -0.564854, 1.416982, 0.6392157, 0, 1, 1,
0.752701, 0.6946142, -1.064372, 0.6431373, 0, 1, 1,
0.7564579, -0.01118683, 2.545717, 0.6509804, 0, 1, 1,
0.7608461, -0.1083936, 2.198656, 0.654902, 0, 1, 1,
0.7648236, -0.4042398, 2.73424, 0.6627451, 0, 1, 1,
0.7686535, 0.2032193, 2.239295, 0.6666667, 0, 1, 1,
0.7686709, 0.9980502, 2.26388, 0.6745098, 0, 1, 1,
0.770972, -0.01098982, 1.12321, 0.6784314, 0, 1, 1,
0.7839638, -1.029819, 1.432349, 0.6862745, 0, 1, 1,
0.7869803, 0.9945681, 2.381316, 0.6901961, 0, 1, 1,
0.787852, -0.5203794, 2.287283, 0.6980392, 0, 1, 1,
0.7881549, -1.923512, 3.02559, 0.7058824, 0, 1, 1,
0.788285, 0.6133446, 0.4752562, 0.7098039, 0, 1, 1,
0.789956, -1.254795, 0.8220184, 0.7176471, 0, 1, 1,
0.7927876, 0.7006477, 0.160418, 0.7215686, 0, 1, 1,
0.7935119, -0.2678419, 3.066607, 0.7294118, 0, 1, 1,
0.8048841, -0.4021324, 2.982982, 0.7333333, 0, 1, 1,
0.8052134, -0.8448406, 4.565188, 0.7411765, 0, 1, 1,
0.8107496, 0.306161, 1.509836, 0.7450981, 0, 1, 1,
0.8130099, -1.109107, -0.2269644, 0.7529412, 0, 1, 1,
0.8140948, 0.2825255, 1.786596, 0.7568628, 0, 1, 1,
0.8175638, 0.214305, 0.03414857, 0.7647059, 0, 1, 1,
0.818038, 0.1696523, 3.473773, 0.7686275, 0, 1, 1,
0.8188838, 0.4146042, 1.827032, 0.7764706, 0, 1, 1,
0.823323, -0.1056976, 1.395773, 0.7803922, 0, 1, 1,
0.8241813, -0.1809181, 1.721716, 0.7882353, 0, 1, 1,
0.834603, 0.6173086, 0.7577031, 0.7921569, 0, 1, 1,
0.8432806, -0.01617987, 1.354378, 0.8, 0, 1, 1,
0.8447514, -0.5662979, 0.4645103, 0.8078431, 0, 1, 1,
0.8471354, 0.51941, -0.1883851, 0.8117647, 0, 1, 1,
0.849126, 0.1131817, 2.490331, 0.8196079, 0, 1, 1,
0.8531777, -1.053469, 1.708229, 0.8235294, 0, 1, 1,
0.8542756, 0.3946786, 0.7098691, 0.8313726, 0, 1, 1,
0.8569607, 0.472293, 1.981679, 0.8352941, 0, 1, 1,
0.8572258, 1.15595, 0.8306765, 0.8431373, 0, 1, 1,
0.8580225, 1.525218, 0.03164254, 0.8470588, 0, 1, 1,
0.8621991, -1.082824, 3.174121, 0.854902, 0, 1, 1,
0.8626721, -0.3298523, 1.917634, 0.8588235, 0, 1, 1,
0.8653224, 1.192855, -0.5450255, 0.8666667, 0, 1, 1,
0.8728536, -0.07031885, 2.637993, 0.8705882, 0, 1, 1,
0.8734074, -2.109732, 3.47839, 0.8784314, 0, 1, 1,
0.8766972, 1.81025, 1.336233, 0.8823529, 0, 1, 1,
0.876826, -0.4817167, 2.926458, 0.8901961, 0, 1, 1,
0.8800383, 1.167446, 0.4882139, 0.8941177, 0, 1, 1,
0.8884681, -1.515032, 1.788917, 0.9019608, 0, 1, 1,
0.8909656, 1.698929, -0.2539512, 0.9098039, 0, 1, 1,
0.8936425, 0.669199, -0.7813646, 0.9137255, 0, 1, 1,
0.8962681, -0.5781619, 1.903335, 0.9215686, 0, 1, 1,
0.9046308, 0.01210188, 2.1597, 0.9254902, 0, 1, 1,
0.9071894, -2.314481, 3.366174, 0.9333333, 0, 1, 1,
0.9075238, 1.027229, 1.756649, 0.9372549, 0, 1, 1,
0.9143324, 0.8853819, 1.131885, 0.945098, 0, 1, 1,
0.9170076, 1.44594, 1.621502, 0.9490196, 0, 1, 1,
0.917074, -0.1163377, 1.178658, 0.9568627, 0, 1, 1,
0.9210685, 0.4902393, 0.2295918, 0.9607843, 0, 1, 1,
0.9231321, -1.952175, 1.393522, 0.9686275, 0, 1, 1,
0.9356238, -0.0396753, 1.10145, 0.972549, 0, 1, 1,
0.9386728, 0.6571673, 0.09447101, 0.9803922, 0, 1, 1,
0.9397048, 1.211255, -0.5935681, 0.9843137, 0, 1, 1,
0.9428718, -0.2212298, 2.088757, 0.9921569, 0, 1, 1,
0.9436556, -0.01529522, 0.5637525, 0.9960784, 0, 1, 1,
0.9459619, 0.6911412, -0.02819603, 1, 0, 0.9960784, 1,
0.9509996, -0.5414618, 1.911406, 1, 0, 0.9882353, 1,
0.9535664, -2.569775, 3.118668, 1, 0, 0.9843137, 1,
0.9543187, -0.4057378, 3.014966, 1, 0, 0.9764706, 1,
0.9549997, -0.969062, 3.033838, 1, 0, 0.972549, 1,
0.9553471, -1.185434, 2.845413, 1, 0, 0.9647059, 1,
0.9590732, 1.665571, -0.3799165, 1, 0, 0.9607843, 1,
0.9628186, -0.01965141, 1.947703, 1, 0, 0.9529412, 1,
0.9667273, -1.100636, 3.516295, 1, 0, 0.9490196, 1,
0.9668313, 0.2611371, 1.966282, 1, 0, 0.9411765, 1,
0.9693377, 0.4265172, 2.157375, 1, 0, 0.9372549, 1,
0.9727238, 0.1835696, 2.950606, 1, 0, 0.9294118, 1,
0.9739512, -0.4295624, 1.645356, 1, 0, 0.9254902, 1,
0.9761908, 0.9893442, 0.5994971, 1, 0, 0.9176471, 1,
0.9777634, 0.6993382, 1.83693, 1, 0, 0.9137255, 1,
0.9824184, 0.9180508, -0.4484835, 1, 0, 0.9058824, 1,
0.9842841, 0.2463958, 1.341432, 1, 0, 0.9019608, 1,
0.9864783, 1.194117, 1.140842, 1, 0, 0.8941177, 1,
0.9865144, -0.7148631, 3.239491, 1, 0, 0.8862745, 1,
0.994007, 0.488443, 2.886023, 1, 0, 0.8823529, 1,
0.9944149, -2.41743, 2.590711, 1, 0, 0.8745098, 1,
1.000709, 1.107949, 1.338828, 1, 0, 0.8705882, 1,
1.02052, 1.111652, 2.322248, 1, 0, 0.8627451, 1,
1.024453, -0.784017, 2.473703, 1, 0, 0.8588235, 1,
1.026492, 0.06585155, 1.820964, 1, 0, 0.8509804, 1,
1.038579, 1.480344, 0.4228381, 1, 0, 0.8470588, 1,
1.047952, 0.5326399, 1.000202, 1, 0, 0.8392157, 1,
1.052737, -0.8407398, 1.937145, 1, 0, 0.8352941, 1,
1.065342, 0.3621492, 2.071908, 1, 0, 0.827451, 1,
1.069503, 2.0663, 0.6323131, 1, 0, 0.8235294, 1,
1.071066, -0.2794337, 1.320174, 1, 0, 0.8156863, 1,
1.080866, -0.6169374, 4.885712, 1, 0, 0.8117647, 1,
1.08726, 1.78416, -0.3177769, 1, 0, 0.8039216, 1,
1.089052, 1.21816, 0.4168245, 1, 0, 0.7960784, 1,
1.090671, -1.124675, 1.420306, 1, 0, 0.7921569, 1,
1.091369, -0.4615553, 3.567648, 1, 0, 0.7843137, 1,
1.095277, -2.380307, 3.928681, 1, 0, 0.7803922, 1,
1.101151, -0.1444466, 2.037665, 1, 0, 0.772549, 1,
1.105515, 0.04868624, 4.159248, 1, 0, 0.7686275, 1,
1.110888, 0.03376656, 1.934386, 1, 0, 0.7607843, 1,
1.123355, -0.1442196, 2.415781, 1, 0, 0.7568628, 1,
1.138245, -0.04918703, 0.8663121, 1, 0, 0.7490196, 1,
1.143862, 1.104279, 0.4683435, 1, 0, 0.7450981, 1,
1.147167, -0.9202186, 3.292268, 1, 0, 0.7372549, 1,
1.147465, -0.362095, 2.557656, 1, 0, 0.7333333, 1,
1.151359, 2.431202, 0.8068608, 1, 0, 0.7254902, 1,
1.158031, -0.3496241, 1.797654, 1, 0, 0.7215686, 1,
1.161082, -0.4424876, 1.869332, 1, 0, 0.7137255, 1,
1.162584, -0.9227588, 3.009474, 1, 0, 0.7098039, 1,
1.167951, 0.6074203, 0.863079, 1, 0, 0.7019608, 1,
1.1691, -0.9316344, 1.698034, 1, 0, 0.6941177, 1,
1.169634, 0.9875254, 1.57965, 1, 0, 0.6901961, 1,
1.173314, -1.952222, 1.604664, 1, 0, 0.682353, 1,
1.174935, -0.1080938, 1.791681, 1, 0, 0.6784314, 1,
1.181852, -1.408194, 3.298359, 1, 0, 0.6705883, 1,
1.182561, -0.3454851, 1.979252, 1, 0, 0.6666667, 1,
1.182976, 0.1764119, 0.5187179, 1, 0, 0.6588235, 1,
1.1981, 0.0757713, -0.8046604, 1, 0, 0.654902, 1,
1.200039, -0.06113662, 0.6266094, 1, 0, 0.6470588, 1,
1.215258, -0.7018172, 1.558646, 1, 0, 0.6431373, 1,
1.220278, 1.226362, -1.202781, 1, 0, 0.6352941, 1,
1.222181, -0.02641254, 2.224002, 1, 0, 0.6313726, 1,
1.231305, 1.424237, 1.894662, 1, 0, 0.6235294, 1,
1.234259, 0.4963212, 0.6445916, 1, 0, 0.6196079, 1,
1.247321, 0.178923, 0.2610741, 1, 0, 0.6117647, 1,
1.248489, -1.315727, 2.554042, 1, 0, 0.6078432, 1,
1.251344, -1.887776, 3.032861, 1, 0, 0.6, 1,
1.25149, -0.2407894, 2.50112, 1, 0, 0.5921569, 1,
1.288558, -1.867039, 3.154438, 1, 0, 0.5882353, 1,
1.292914, 1.237607, 1.957271, 1, 0, 0.5803922, 1,
1.295927, 0.2652806, 2.675133, 1, 0, 0.5764706, 1,
1.310565, 0.4747476, 0.5924851, 1, 0, 0.5686275, 1,
1.317864, 1.039496, 0.7224274, 1, 0, 0.5647059, 1,
1.320506, 0.4412707, 0.7270673, 1, 0, 0.5568628, 1,
1.320908, -0.1384112, 2.268642, 1, 0, 0.5529412, 1,
1.324391, 0.6052782, 1.169666, 1, 0, 0.5450981, 1,
1.326412, -0.3659731, 2.345834, 1, 0, 0.5411765, 1,
1.332412, -1.010106, 2.106443, 1, 0, 0.5333334, 1,
1.335832, 0.08628394, 1.996645, 1, 0, 0.5294118, 1,
1.340074, 0.07675695, 1.177976, 1, 0, 0.5215687, 1,
1.346701, -1.955739, 1.363775, 1, 0, 0.5176471, 1,
1.350418, 0.4206521, 1.028099, 1, 0, 0.509804, 1,
1.353416, 0.3996441, 2.616642, 1, 0, 0.5058824, 1,
1.364189, 0.1719199, 1.453345, 1, 0, 0.4980392, 1,
1.372401, 0.3337725, 2.308115, 1, 0, 0.4901961, 1,
1.374727, -0.4639758, 1.039392, 1, 0, 0.4862745, 1,
1.379251, 0.9006129, 1.252348, 1, 0, 0.4784314, 1,
1.386983, -0.936296, 0.867227, 1, 0, 0.4745098, 1,
1.389434, -0.01409382, 1.173145, 1, 0, 0.4666667, 1,
1.3932, 0.5253338, 1.632278, 1, 0, 0.4627451, 1,
1.403707, -0.2384823, 1.281963, 1, 0, 0.454902, 1,
1.406094, -1.808067, 4.414362, 1, 0, 0.4509804, 1,
1.410278, 0.2215822, 2.607768, 1, 0, 0.4431373, 1,
1.412689, -1.910568, 1.72952, 1, 0, 0.4392157, 1,
1.430114, -0.7251818, 2.441046, 1, 0, 0.4313726, 1,
1.433299, -2.173163, 2.413837, 1, 0, 0.427451, 1,
1.433375, -1.034931, 0.8324937, 1, 0, 0.4196078, 1,
1.45187, -0.6313108, 2.315295, 1, 0, 0.4156863, 1,
1.455028, 0.5312809, 1.154255, 1, 0, 0.4078431, 1,
1.455492, -1.623577, 2.784491, 1, 0, 0.4039216, 1,
1.461969, 1.194124, 1.369013, 1, 0, 0.3960784, 1,
1.466066, 1.817533, 0.8475653, 1, 0, 0.3882353, 1,
1.48493, 0.9403561, 1.703413, 1, 0, 0.3843137, 1,
1.486059, -0.4520587, 1.588255, 1, 0, 0.3764706, 1,
1.486605, -0.7271121, 1.825603, 1, 0, 0.372549, 1,
1.508026, 1.154618, 3.257883, 1, 0, 0.3647059, 1,
1.511035, -1.421978, 1.376445, 1, 0, 0.3607843, 1,
1.512508, -1.342993, 2.435365, 1, 0, 0.3529412, 1,
1.513441, -1.784446, 1.425199, 1, 0, 0.3490196, 1,
1.518841, 1.275351, -0.263339, 1, 0, 0.3411765, 1,
1.524125, 0.3348412, 2.375226, 1, 0, 0.3372549, 1,
1.538695, 2.58429, 1.118459, 1, 0, 0.3294118, 1,
1.549053, -0.05342609, 1.913099, 1, 0, 0.3254902, 1,
1.555197, -1.543595, 2.471372, 1, 0, 0.3176471, 1,
1.558282, -0.4093631, 2.08125, 1, 0, 0.3137255, 1,
1.584742, -1.618428, 2.002161, 1, 0, 0.3058824, 1,
1.628098, -0.7945996, 1.031982, 1, 0, 0.2980392, 1,
1.63436, 0.422537, 1.84203, 1, 0, 0.2941177, 1,
1.637521, -0.01509124, 0.7995936, 1, 0, 0.2862745, 1,
1.650233, 1.006593, 0.1789772, 1, 0, 0.282353, 1,
1.650714, -0.1385069, 1.290122, 1, 0, 0.2745098, 1,
1.679021, -0.2795128, 2.350707, 1, 0, 0.2705882, 1,
1.697783, -0.8176022, 3.07853, 1, 0, 0.2627451, 1,
1.709784, 1.587394, 2.055051, 1, 0, 0.2588235, 1,
1.714357, -0.1588969, 1.692443, 1, 0, 0.2509804, 1,
1.71731, -0.4185893, 1.159639, 1, 0, 0.2470588, 1,
1.730493, -0.994092, 3.504898, 1, 0, 0.2392157, 1,
1.756017, 0.7929822, 1.241184, 1, 0, 0.2352941, 1,
1.756316, 0.4830734, 0.9595964, 1, 0, 0.227451, 1,
1.762166, 0.3643434, -0.9032066, 1, 0, 0.2235294, 1,
1.762817, 0.3962459, 2.912735, 1, 0, 0.2156863, 1,
1.763056, 0.4856727, 0.0707825, 1, 0, 0.2117647, 1,
1.763907, -0.04304813, 2.112763, 1, 0, 0.2039216, 1,
1.769691, -0.2001867, -0.192191, 1, 0, 0.1960784, 1,
1.787474, -0.6375279, 1.320855, 1, 0, 0.1921569, 1,
1.789865, -0.1335513, 1.450757, 1, 0, 0.1843137, 1,
1.801172, -0.2021867, 1.118301, 1, 0, 0.1803922, 1,
1.828279, -0.7966059, 1.483867, 1, 0, 0.172549, 1,
1.83002, -0.8067122, 1.824389, 1, 0, 0.1686275, 1,
1.849869, 0.09042983, 1.391451, 1, 0, 0.1607843, 1,
1.852326, 0.556577, 2.267124, 1, 0, 0.1568628, 1,
1.877449, -1.091578, 2.817559, 1, 0, 0.1490196, 1,
1.888401, -1.065956, 1.554557, 1, 0, 0.145098, 1,
1.897957, 0.8852118, 0.5287841, 1, 0, 0.1372549, 1,
1.932721, 0.5079594, 2.862931, 1, 0, 0.1333333, 1,
1.96533, -1.18156, 2.178956, 1, 0, 0.1254902, 1,
1.978264, 1.468548, 1.530713, 1, 0, 0.1215686, 1,
2.004835, 0.4259947, 1.628302, 1, 0, 0.1137255, 1,
2.008566, -0.450312, 0.05372052, 1, 0, 0.1098039, 1,
2.012874, -0.3045365, 1.085273, 1, 0, 0.1019608, 1,
2.076475, 0.958959, -0.06617314, 1, 0, 0.09411765, 1,
2.082743, 0.8621404, 1.128319, 1, 0, 0.09019608, 1,
2.107403, -1.178431, 3.5649, 1, 0, 0.08235294, 1,
2.13218, 0.266133, 1.990629, 1, 0, 0.07843138, 1,
2.186644, -0.3444841, 1.870712, 1, 0, 0.07058824, 1,
2.255732, 0.5148289, 0.5637478, 1, 0, 0.06666667, 1,
2.287768, 0.4443007, -1.496361, 1, 0, 0.05882353, 1,
2.378307, -0.6994516, 4.069337, 1, 0, 0.05490196, 1,
2.409869, 0.1849653, 3.211307, 1, 0, 0.04705882, 1,
2.471812, -3.263093, 1.443382, 1, 0, 0.04313726, 1,
2.547579, 0.6239021, 1.392862, 1, 0, 0.03529412, 1,
2.590188, -1.104772, 1.303503, 1, 0, 0.03137255, 1,
2.71347, -0.1839514, 1.538021, 1, 0, 0.02352941, 1,
2.768455, -0.1333362, 2.323167, 1, 0, 0.01960784, 1,
3.045035, 1.285796, 1.824139, 1, 0, 0.01176471, 1,
3.191524, -0.7280128, 1.135921, 1, 0, 0.007843138, 1
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
-0.002074838, -4.282147, -6.45302, 0, -0.5, 0.5, 0.5,
-0.002074838, -4.282147, -6.45302, 1, -0.5, 0.5, 0.5,
-0.002074838, -4.282147, -6.45302, 1, 1.5, 0.5, 0.5,
-0.002074838, -4.282147, -6.45302, 0, 1.5, 0.5, 0.5
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
-4.278303, -0.2570357, -6.45302, 0, -0.5, 0.5, 0.5,
-4.278303, -0.2570357, -6.45302, 1, -0.5, 0.5, 0.5,
-4.278303, -0.2570357, -6.45302, 1, 1.5, 0.5, 0.5,
-4.278303, -0.2570357, -6.45302, 0, 1.5, 0.5, 0.5
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
-4.278303, -4.282147, 0.4915698, 0, -0.5, 0.5, 0.5,
-4.278303, -4.282147, 0.4915698, 1, -0.5, 0.5, 0.5,
-4.278303, -4.282147, 0.4915698, 1, 1.5, 0.5, 0.5,
-4.278303, -4.282147, 0.4915698, 0, 1.5, 0.5, 0.5
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
-3, -3.353275, -4.850422,
3, -3.353275, -4.850422,
-3, -3.353275, -4.850422,
-3, -3.508087, -5.117522,
-2, -3.353275, -4.850422,
-2, -3.508087, -5.117522,
-1, -3.353275, -4.850422,
-1, -3.508087, -5.117522,
0, -3.353275, -4.850422,
0, -3.508087, -5.117522,
1, -3.353275, -4.850422,
1, -3.508087, -5.117522,
2, -3.353275, -4.850422,
2, -3.508087, -5.117522,
3, -3.353275, -4.850422,
3, -3.508087, -5.117522
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
-3, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
-3, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
-3, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
-3, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5,
-2, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
-2, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
-2, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
-2, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5,
-1, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
-1, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
-1, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
-1, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5,
0, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
0, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
0, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
0, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5,
1, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
1, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
1, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
1, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5,
2, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
2, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
2, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
2, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5,
3, -3.817711, -5.651721, 0, -0.5, 0.5, 0.5,
3, -3.817711, -5.651721, 1, -0.5, 0.5, 0.5,
3, -3.817711, -5.651721, 1, 1.5, 0.5, 0.5,
3, -3.817711, -5.651721, 0, 1.5, 0.5, 0.5
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
-3.291481, -3, -4.850422,
-3.291481, 2, -4.850422,
-3.291481, -3, -4.850422,
-3.455951, -3, -5.117522,
-3.291481, -2, -4.850422,
-3.455951, -2, -5.117522,
-3.291481, -1, -4.850422,
-3.455951, -1, -5.117522,
-3.291481, 0, -4.850422,
-3.455951, 0, -5.117522,
-3.291481, 1, -4.850422,
-3.455951, 1, -5.117522,
-3.291481, 2, -4.850422,
-3.455951, 2, -5.117522
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
-3.784892, -3, -5.651721, 0, -0.5, 0.5, 0.5,
-3.784892, -3, -5.651721, 1, -0.5, 0.5, 0.5,
-3.784892, -3, -5.651721, 1, 1.5, 0.5, 0.5,
-3.784892, -3, -5.651721, 0, 1.5, 0.5, 0.5,
-3.784892, -2, -5.651721, 0, -0.5, 0.5, 0.5,
-3.784892, -2, -5.651721, 1, -0.5, 0.5, 0.5,
-3.784892, -2, -5.651721, 1, 1.5, 0.5, 0.5,
-3.784892, -2, -5.651721, 0, 1.5, 0.5, 0.5,
-3.784892, -1, -5.651721, 0, -0.5, 0.5, 0.5,
-3.784892, -1, -5.651721, 1, -0.5, 0.5, 0.5,
-3.784892, -1, -5.651721, 1, 1.5, 0.5, 0.5,
-3.784892, -1, -5.651721, 0, 1.5, 0.5, 0.5,
-3.784892, 0, -5.651721, 0, -0.5, 0.5, 0.5,
-3.784892, 0, -5.651721, 1, -0.5, 0.5, 0.5,
-3.784892, 0, -5.651721, 1, 1.5, 0.5, 0.5,
-3.784892, 0, -5.651721, 0, 1.5, 0.5, 0.5,
-3.784892, 1, -5.651721, 0, -0.5, 0.5, 0.5,
-3.784892, 1, -5.651721, 1, -0.5, 0.5, 0.5,
-3.784892, 1, -5.651721, 1, 1.5, 0.5, 0.5,
-3.784892, 1, -5.651721, 0, 1.5, 0.5, 0.5,
-3.784892, 2, -5.651721, 0, -0.5, 0.5, 0.5,
-3.784892, 2, -5.651721, 1, -0.5, 0.5, 0.5,
-3.784892, 2, -5.651721, 1, 1.5, 0.5, 0.5,
-3.784892, 2, -5.651721, 0, 1.5, 0.5, 0.5
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
-3.291481, -3.353275, -4,
-3.291481, -3.353275, 4,
-3.291481, -3.353275, -4,
-3.455951, -3.508087, -4,
-3.291481, -3.353275, -2,
-3.455951, -3.508087, -2,
-3.291481, -3.353275, 0,
-3.455951, -3.508087, 0,
-3.291481, -3.353275, 2,
-3.455951, -3.508087, 2,
-3.291481, -3.353275, 4,
-3.455951, -3.508087, 4
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
-3.784892, -3.817711, -4, 0, -0.5, 0.5, 0.5,
-3.784892, -3.817711, -4, 1, -0.5, 0.5, 0.5,
-3.784892, -3.817711, -4, 1, 1.5, 0.5, 0.5,
-3.784892, -3.817711, -4, 0, 1.5, 0.5, 0.5,
-3.784892, -3.817711, -2, 0, -0.5, 0.5, 0.5,
-3.784892, -3.817711, -2, 1, -0.5, 0.5, 0.5,
-3.784892, -3.817711, -2, 1, 1.5, 0.5, 0.5,
-3.784892, -3.817711, -2, 0, 1.5, 0.5, 0.5,
-3.784892, -3.817711, 0, 0, -0.5, 0.5, 0.5,
-3.784892, -3.817711, 0, 1, -0.5, 0.5, 0.5,
-3.784892, -3.817711, 0, 1, 1.5, 0.5, 0.5,
-3.784892, -3.817711, 0, 0, 1.5, 0.5, 0.5,
-3.784892, -3.817711, 2, 0, -0.5, 0.5, 0.5,
-3.784892, -3.817711, 2, 1, -0.5, 0.5, 0.5,
-3.784892, -3.817711, 2, 1, 1.5, 0.5, 0.5,
-3.784892, -3.817711, 2, 0, 1.5, 0.5, 0.5,
-3.784892, -3.817711, 4, 0, -0.5, 0.5, 0.5,
-3.784892, -3.817711, 4, 1, -0.5, 0.5, 0.5,
-3.784892, -3.817711, 4, 1, 1.5, 0.5, 0.5,
-3.784892, -3.817711, 4, 0, 1.5, 0.5, 0.5
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
-3.291481, -3.353275, -4.850422,
-3.291481, 2.839204, -4.850422,
-3.291481, -3.353275, 5.833562,
-3.291481, 2.839204, 5.833562,
-3.291481, -3.353275, -4.850422,
-3.291481, -3.353275, 5.833562,
-3.291481, 2.839204, -4.850422,
-3.291481, 2.839204, 5.833562,
-3.291481, -3.353275, -4.850422,
3.287332, -3.353275, -4.850422,
-3.291481, -3.353275, 5.833562,
3.287332, -3.353275, 5.833562,
-3.291481, 2.839204, -4.850422,
3.287332, 2.839204, -4.850422,
-3.291481, 2.839204, 5.833562,
3.287332, 2.839204, 5.833562,
3.287332, -3.353275, -4.850422,
3.287332, 2.839204, -4.850422,
3.287332, -3.353275, 5.833562,
3.287332, 2.839204, 5.833562,
3.287332, -3.353275, -4.850422,
3.287332, -3.353275, 5.833562,
3.287332, 2.839204, -4.850422,
3.287332, 2.839204, 5.833562
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
var radius = 7.471438;
var distance = 33.24127;
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
mvMatrix.translate( 0.002074838, 0.2570357, -0.4915698 );
mvMatrix.scale( 1.227921, 1.304528, 0.7561098 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.24127);
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
folpet<-read.table("folpet.xyz")
```

```
## Error in read.table("folpet.xyz"): no lines available in input
```

```r
x<-folpet$V2
```

```
## Error in eval(expr, envir, enclos): object 'folpet' not found
```

```r
y<-folpet$V3
```

```
## Error in eval(expr, envir, enclos): object 'folpet' not found
```

```r
z<-folpet$V4
```

```
## Error in eval(expr, envir, enclos): object 'folpet' not found
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
-3.195673, 0.5225688, 0.2099245, 0, 0, 1, 1, 1,
-2.772094, -0.536435, -0.7849541, 1, 0, 0, 1, 1,
-2.525749, 0.09577168, -2.024516, 1, 0, 0, 1, 1,
-2.488198, -0.597154, -2.218974, 1, 0, 0, 1, 1,
-2.471063, -0.4696092, -2.107038, 1, 0, 0, 1, 1,
-2.461095, 1.693648, 1.133984, 1, 0, 0, 1, 1,
-2.426708, -1.226433, -1.731977, 0, 0, 0, 1, 1,
-2.38648, -0.8358176, -2.823942, 0, 0, 0, 1, 1,
-2.352942, 1.412972, -1.693533, 0, 0, 0, 1, 1,
-2.3405, -0.8584393, -2.468195, 0, 0, 0, 1, 1,
-2.333297, 1.663208, -1.522478, 0, 0, 0, 1, 1,
-2.332332, -0.3245316, -2.608371, 0, 0, 0, 1, 1,
-2.322772, 0.2148474, -0.4261225, 0, 0, 0, 1, 1,
-2.28503, -0.6011915, -0.634247, 1, 1, 1, 1, 1,
-2.247766, 0.9555467, 0.04285792, 1, 1, 1, 1, 1,
-2.218993, -1.246554, -2.638783, 1, 1, 1, 1, 1,
-2.213482, -1.130571, -1.240225, 1, 1, 1, 1, 1,
-2.176782, 0.1198594, -0.2642282, 1, 1, 1, 1, 1,
-2.156137, -1.354132, -0.9256514, 1, 1, 1, 1, 1,
-2.135511, -1.11136, -0.7429325, 1, 1, 1, 1, 1,
-2.103162, 1.855793, 0.09322572, 1, 1, 1, 1, 1,
-2.021347, -0.2609343, -1.252029, 1, 1, 1, 1, 1,
-2.017905, -0.6340727, -1.982782, 1, 1, 1, 1, 1,
-2.005693, 0.600047, 0.9306588, 1, 1, 1, 1, 1,
-1.937625, 0.5924687, -1.803454, 1, 1, 1, 1, 1,
-1.917812, 1.28944, -0.9365712, 1, 1, 1, 1, 1,
-1.912026, -0.2130716, -1.097234, 1, 1, 1, 1, 1,
-1.875301, -0.9550982, -1.256166, 1, 1, 1, 1, 1,
-1.870412, 1.072388, -0.9079077, 0, 0, 1, 1, 1,
-1.851071, -0.4051121, -1.261705, 1, 0, 0, 1, 1,
-1.839461, 1.341463, -2.553295, 1, 0, 0, 1, 1,
-1.836518, 1.507351, -0.9691439, 1, 0, 0, 1, 1,
-1.785752, 0.4111141, -2.71758, 1, 0, 0, 1, 1,
-1.785318, 1.426098, 0.6166621, 1, 0, 0, 1, 1,
-1.781456, -1.12545, -1.835141, 0, 0, 0, 1, 1,
-1.748082, 0.2576379, -2.024918, 0, 0, 0, 1, 1,
-1.734281, 0.08398222, -2.104311, 0, 0, 0, 1, 1,
-1.728348, -1.327316, -0.9576815, 0, 0, 0, 1, 1,
-1.725238, 1.520092, -1.048296, 0, 0, 0, 1, 1,
-1.723679, -0.1355298, -2.831372, 0, 0, 0, 1, 1,
-1.713805, 0.9746833, -0.4286003, 0, 0, 0, 1, 1,
-1.707591, -0.2107645, -3.931738, 1, 1, 1, 1, 1,
-1.703298, 0.0642243, -0.2995382, 1, 1, 1, 1, 1,
-1.68922, 0.9287746, -1.279717, 1, 1, 1, 1, 1,
-1.669611, 0.02446522, -1.440583, 1, 1, 1, 1, 1,
-1.668265, -1.258023, -4.070968, 1, 1, 1, 1, 1,
-1.666154, -0.6876882, -0.7863975, 1, 1, 1, 1, 1,
-1.665752, 0.2883282, -3.315817, 1, 1, 1, 1, 1,
-1.664551, 0.3203554, -0.5577257, 1, 1, 1, 1, 1,
-1.653756, 0.09949141, -1.960726, 1, 1, 1, 1, 1,
-1.650298, -0.1115135, -1.741519, 1, 1, 1, 1, 1,
-1.645877, 0.6234238, 0.5692754, 1, 1, 1, 1, 1,
-1.632529, 0.3877716, -0.5507278, 1, 1, 1, 1, 1,
-1.62987, 0.1491494, 0.3858853, 1, 1, 1, 1, 1,
-1.628938, 0.2474873, -1.491636, 1, 1, 1, 1, 1,
-1.618503, 0.1945896, -0.4129106, 1, 1, 1, 1, 1,
-1.616031, -0.2562229, -1.323493, 0, 0, 1, 1, 1,
-1.612494, 1.516496, 0.9362247, 1, 0, 0, 1, 1,
-1.606443, 0.467181, -1.962546, 1, 0, 0, 1, 1,
-1.601557, 0.09109043, -2.066419, 1, 0, 0, 1, 1,
-1.599324, -0.8111337, -1.696933, 1, 0, 0, 1, 1,
-1.598557, 1.685337, -1.944724, 1, 0, 0, 1, 1,
-1.595525, -0.3996965, -2.579243, 0, 0, 0, 1, 1,
-1.581794, 1.46723, 1.462167, 0, 0, 0, 1, 1,
-1.577712, 0.5903265, -0.4347997, 0, 0, 0, 1, 1,
-1.561839, 0.427581, -0.7563376, 0, 0, 0, 1, 1,
-1.552366, -0.2917095, -0.6164325, 0, 0, 0, 1, 1,
-1.544744, 1.419141, -3.6884, 0, 0, 0, 1, 1,
-1.544652, -2.3045, -1.648207, 0, 0, 0, 1, 1,
-1.531185, -0.9600657, -1.277864, 1, 1, 1, 1, 1,
-1.531174, -0.2854013, -2.233963, 1, 1, 1, 1, 1,
-1.508248, -0.05270388, -3.159496, 1, 1, 1, 1, 1,
-1.507725, -0.04165522, -2.897177, 1, 1, 1, 1, 1,
-1.496369, -0.7440392, -1.762409, 1, 1, 1, 1, 1,
-1.494401, -1.175842, -1.850759, 1, 1, 1, 1, 1,
-1.493601, -0.4042212, -0.5753336, 1, 1, 1, 1, 1,
-1.473287, -1.256286, -3.062245, 1, 1, 1, 1, 1,
-1.464082, -0.1220647, -0.6210166, 1, 1, 1, 1, 1,
-1.447036, 0.8274119, -0.6576769, 1, 1, 1, 1, 1,
-1.445177, -1.214603, -1.714353, 1, 1, 1, 1, 1,
-1.44067, 1.270904, -1.091398, 1, 1, 1, 1, 1,
-1.428863, 1.661069, -0.7297234, 1, 1, 1, 1, 1,
-1.41943, 0.5042045, -0.5397952, 1, 1, 1, 1, 1,
-1.418807, -1.351861, -3.211481, 1, 1, 1, 1, 1,
-1.402995, 0.03459921, -0.5452322, 0, 0, 1, 1, 1,
-1.390964, -0.2094558, -0.3948543, 1, 0, 0, 1, 1,
-1.370492, 0.01632386, -1.390886, 1, 0, 0, 1, 1,
-1.367111, -0.6963582, -2.452278, 1, 0, 0, 1, 1,
-1.364417, -1.661561, -3.061398, 1, 0, 0, 1, 1,
-1.356061, -0.8584864, -3.082086, 1, 0, 0, 1, 1,
-1.354241, 0.2317924, -1.089633, 0, 0, 0, 1, 1,
-1.334308, -2.570508, -2.899838, 0, 0, 0, 1, 1,
-1.329221, -0.3460096, -1.437712, 0, 0, 0, 1, 1,
-1.323582, -0.9325659, -0.9229344, 0, 0, 0, 1, 1,
-1.319189, 1.28683, -1.707591, 0, 0, 0, 1, 1,
-1.3095, 0.6299077, -1.315519, 0, 0, 0, 1, 1,
-1.303027, -0.01420143, -1.719108, 0, 0, 0, 1, 1,
-1.294882, 1.177455, -1.210858, 1, 1, 1, 1, 1,
-1.293358, 0.03349039, -1.611966, 1, 1, 1, 1, 1,
-1.293269, 1.177239, -1.3529, 1, 1, 1, 1, 1,
-1.291692, 2.10018, -1.699922, 1, 1, 1, 1, 1,
-1.28886, -0.711453, -2.676263, 1, 1, 1, 1, 1,
-1.282684, 0.3545398, -0.57254, 1, 1, 1, 1, 1,
-1.276572, 0.348592, -1.515516, 1, 1, 1, 1, 1,
-1.274398, 1.878882, -1.305537, 1, 1, 1, 1, 1,
-1.270416, -0.6184179, -2.376847, 1, 1, 1, 1, 1,
-1.262306, -0.2076823, -1.179337, 1, 1, 1, 1, 1,
-1.251905, 1.132161, 0.1858702, 1, 1, 1, 1, 1,
-1.242607, 2.100945, -0.9610916, 1, 1, 1, 1, 1,
-1.241602, -0.7516127, -2.539239, 1, 1, 1, 1, 1,
-1.233614, -1.187288, -3.550137, 1, 1, 1, 1, 1,
-1.233566, -0.505634, -2.121218, 1, 1, 1, 1, 1,
-1.230568, -0.06322069, -2.489953, 0, 0, 1, 1, 1,
-1.224205, -1.38334, -3.487456, 1, 0, 0, 1, 1,
-1.219369, -0.6786848, -2.967734, 1, 0, 0, 1, 1,
-1.197791, 0.02922814, -0.6879621, 1, 0, 0, 1, 1,
-1.1943, 0.7200531, -0.952567, 1, 0, 0, 1, 1,
-1.190756, -1.643611, -2.077264, 1, 0, 0, 1, 1,
-1.190698, 0.3950414, -3.426907, 0, 0, 0, 1, 1,
-1.185264, -0.2936419, -2.019713, 0, 0, 0, 1, 1,
-1.175355, -2.032751, -2.569766, 0, 0, 0, 1, 1,
-1.174316, 1.231701, -2.195038, 0, 0, 0, 1, 1,
-1.172148, 0.0937695, -2.410321, 0, 0, 0, 1, 1,
-1.163171, -1.257386, -1.214731, 0, 0, 0, 1, 1,
-1.153027, -1.064726, -2.106242, 0, 0, 0, 1, 1,
-1.146811, -0.969631, -4.109371, 1, 1, 1, 1, 1,
-1.140201, -0.4226238, -0.7968597, 1, 1, 1, 1, 1,
-1.138493, -1.472576, -2.991403, 1, 1, 1, 1, 1,
-1.135897, -0.3668093, -2.892673, 1, 1, 1, 1, 1,
-1.13425, -0.6467309, -1.577789, 1, 1, 1, 1, 1,
-1.133995, -1.199923, -3.53841, 1, 1, 1, 1, 1,
-1.121678, 1.623467, -1.033799, 1, 1, 1, 1, 1,
-1.118442, 0.1420933, -2.535591, 1, 1, 1, 1, 1,
-1.107779, -1.229653, -1.389733, 1, 1, 1, 1, 1,
-1.101438, -0.2936642, -1.404905, 1, 1, 1, 1, 1,
-1.082917, 0.291599, -0.755836, 1, 1, 1, 1, 1,
-1.063484, 0.6690938, -2.53573, 1, 1, 1, 1, 1,
-1.05893, 0.5115219, -0.580988, 1, 1, 1, 1, 1,
-1.049923, -0.1779214, -1.747198, 1, 1, 1, 1, 1,
-1.047048, 0.3464166, -2.661145, 1, 1, 1, 1, 1,
-1.042059, -1.155297, -2.820024, 0, 0, 1, 1, 1,
-1.041507, -0.4430219, -2.558438, 1, 0, 0, 1, 1,
-1.038365, 1.328034, -0.582192, 1, 0, 0, 1, 1,
-1.035735, 0.8305939, 0.005039271, 1, 0, 0, 1, 1,
-1.035038, -0.4541417, -1.882272, 1, 0, 0, 1, 1,
-1.033501, -1.436023, -1.25415, 1, 0, 0, 1, 1,
-1.026869, -0.5485525, -1.311073, 0, 0, 0, 1, 1,
-1.02151, -0.5860177, -2.666006, 0, 0, 0, 1, 1,
-1.018995, 0.004542236, -2.034891, 0, 0, 0, 1, 1,
-1.016486, -1.434417, -1.608048, 0, 0, 0, 1, 1,
-1.012682, -0.5789959, -1.325546, 0, 0, 0, 1, 1,
-1.008479, 0.4260599, -0.5051377, 0, 0, 0, 1, 1,
-1.005459, -0.1235432, -0.1369088, 0, 0, 0, 1, 1,
-1.004782, 0.1565313, -2.173034, 1, 1, 1, 1, 1,
-0.9782524, 0.7399356, -1.75397, 1, 1, 1, 1, 1,
-0.9669607, -0.5050976, -2.077995, 1, 1, 1, 1, 1,
-0.9651538, -1.126477, -2.764416, 1, 1, 1, 1, 1,
-0.9646671, -0.3778776, -1.129877, 1, 1, 1, 1, 1,
-0.9633859, 0.3869008, -0.5375702, 1, 1, 1, 1, 1,
-0.9591504, 0.1034242, -0.1151341, 1, 1, 1, 1, 1,
-0.9373705, 0.02799677, -2.762043, 1, 1, 1, 1, 1,
-0.9256468, -1.852926, -1.6482, 1, 1, 1, 1, 1,
-0.925363, 2.26572, 1.146319, 1, 1, 1, 1, 1,
-0.9238097, 1.186343, -0.5652089, 1, 1, 1, 1, 1,
-0.9219225, 0.9442802, -0.7891874, 1, 1, 1, 1, 1,
-0.9189935, 0.2719315, -0.7593967, 1, 1, 1, 1, 1,
-0.9166184, -0.5810348, -2.962171, 1, 1, 1, 1, 1,
-0.9115979, -2.358401, -4.120526, 1, 1, 1, 1, 1,
-0.908491, -0.1354483, -1.13543, 0, 0, 1, 1, 1,
-0.9041661, 1.536105, -1.451501, 1, 0, 0, 1, 1,
-0.9003673, -0.9030773, -3.924771, 1, 0, 0, 1, 1,
-0.8995313, 1.650181, -0.7058177, 1, 0, 0, 1, 1,
-0.8895224, -1.283117, -3.499849, 1, 0, 0, 1, 1,
-0.884046, 0.3302083, -2.065455, 1, 0, 0, 1, 1,
-0.8797677, -0.607502, -3.550605, 0, 0, 0, 1, 1,
-0.8723755, 1.523231, 0.5011457, 0, 0, 0, 1, 1,
-0.8699394, -0.722841, -4.440792, 0, 0, 0, 1, 1,
-0.8693075, 0.7586672, 1.548914, 0, 0, 0, 1, 1,
-0.8678964, -1.265298, -3.386767, 0, 0, 0, 1, 1,
-0.8668874, 0.04913504, -1.271883, 0, 0, 0, 1, 1,
-0.8655651, 1.669612, -0.520247, 0, 0, 0, 1, 1,
-0.8651942, 0.6454864, -2.253125, 1, 1, 1, 1, 1,
-0.8581521, 0.8443012, 0.09726621, 1, 1, 1, 1, 1,
-0.8527786, 0.7767689, -0.1284739, 1, 1, 1, 1, 1,
-0.8513734, -0.4469554, -1.907958, 1, 1, 1, 1, 1,
-0.8498004, -0.6719314, -3.888654, 1, 1, 1, 1, 1,
-0.8445048, 0.94518, -3.371845, 1, 1, 1, 1, 1,
-0.8392028, 1.362598, -0.04705663, 1, 1, 1, 1, 1,
-0.839125, -1.21495, -1.560708, 1, 1, 1, 1, 1,
-0.8361283, 0.1787771, 0.7698059, 1, 1, 1, 1, 1,
-0.8321161, -1.275609, -3.421516, 1, 1, 1, 1, 1,
-0.8318704, -0.4745016, -0.8766121, 1, 1, 1, 1, 1,
-0.8222354, -1.352195, -2.83783, 1, 1, 1, 1, 1,
-0.8197886, 0.04910533, -1.2089, 1, 1, 1, 1, 1,
-0.8192161, 0.3736397, -2.08002, 1, 1, 1, 1, 1,
-0.8123069, 1.058748, -1.215982, 1, 1, 1, 1, 1,
-0.809307, 0.07257604, -2.770851, 0, 0, 1, 1, 1,
-0.802339, 0.9759182, -1.405511, 1, 0, 0, 1, 1,
-0.8004397, -1.208341, -0.6751541, 1, 0, 0, 1, 1,
-0.7978874, 1.330541, -1.331602, 1, 0, 0, 1, 1,
-0.7972206, -2.138741, -2.602832, 1, 0, 0, 1, 1,
-0.7938222, 0.839712, -2.952, 1, 0, 0, 1, 1,
-0.7895625, -0.2809363, -1.833178, 0, 0, 0, 1, 1,
-0.7852497, 1.541911, -0.8648002, 0, 0, 0, 1, 1,
-0.7815571, 0.01885742, -3.18849, 0, 0, 0, 1, 1,
-0.7813559, -0.7346292, -2.187299, 0, 0, 0, 1, 1,
-0.7786137, 0.118287, 0.9447367, 0, 0, 0, 1, 1,
-0.7770696, -0.6621406, -4.09809, 0, 0, 0, 1, 1,
-0.770775, 1.678279, -1.502581, 0, 0, 0, 1, 1,
-0.7681516, 0.01807349, -2.057722, 1, 1, 1, 1, 1,
-0.7650899, -0.5831661, -1.840573, 1, 1, 1, 1, 1,
-0.7469032, -0.298379, -2.972304, 1, 1, 1, 1, 1,
-0.7455997, 0.373365, 0.2072, 1, 1, 1, 1, 1,
-0.7440274, -1.09623, -3.070591, 1, 1, 1, 1, 1,
-0.7418865, -0.6402324, -1.348418, 1, 1, 1, 1, 1,
-0.7367128, 2.280315, -0.3438939, 1, 1, 1, 1, 1,
-0.7356098, -0.4355007, -4.123556, 1, 1, 1, 1, 1,
-0.7311467, 1.744382, 1.630668, 1, 1, 1, 1, 1,
-0.7277058, 0.8412051, 0.6828418, 1, 1, 1, 1, 1,
-0.7267163, 0.9932719, -0.1308994, 1, 1, 1, 1, 1,
-0.7235239, 2.203112, 0.6693294, 1, 1, 1, 1, 1,
-0.7217414, 0.607702, -1.403322, 1, 1, 1, 1, 1,
-0.7198866, 1.165566, -0.05709983, 1, 1, 1, 1, 1,
-0.7166734, 0.3071881, -0.8897045, 1, 1, 1, 1, 1,
-0.7164814, 0.5848011, -1.331392, 0, 0, 1, 1, 1,
-0.7110231, 0.6129141, -1.731499, 1, 0, 0, 1, 1,
-0.7074257, 0.635951, 0.1558172, 1, 0, 0, 1, 1,
-0.7061741, 0.0236262, -0.6340774, 1, 0, 0, 1, 1,
-0.6956913, -1.851001, -2.585628, 1, 0, 0, 1, 1,
-0.6949532, 1.048436, -1.516617, 1, 0, 0, 1, 1,
-0.6910031, 0.9383565, -1.261443, 0, 0, 0, 1, 1,
-0.6909745, -1.267403, -3.025792, 0, 0, 0, 1, 1,
-0.6888965, -0.5292014, -2.155474, 0, 0, 0, 1, 1,
-0.6882589, 0.3281583, -2.044103, 0, 0, 0, 1, 1,
-0.6882539, -0.8158172, -1.702605, 0, 0, 0, 1, 1,
-0.6839505, 2.134839, -0.2998373, 0, 0, 0, 1, 1,
-0.6838681, 0.1941695, -0.972515, 0, 0, 0, 1, 1,
-0.6829346, 0.4489215, -1.091186, 1, 1, 1, 1, 1,
-0.679545, -0.1001154, -3.063495, 1, 1, 1, 1, 1,
-0.6788591, 0.5047212, -0.6907647, 1, 1, 1, 1, 1,
-0.6764711, -0.7689218, -2.511029, 1, 1, 1, 1, 1,
-0.6733212, 0.02285418, -1.999303, 1, 1, 1, 1, 1,
-0.6711251, 0.1721866, -0.6341744, 1, 1, 1, 1, 1,
-0.6704174, -0.607049, -1.2532, 1, 1, 1, 1, 1,
-0.6691086, 1.22333, 1.084056, 1, 1, 1, 1, 1,
-0.6672507, 2.640297, -2.263074, 1, 1, 1, 1, 1,
-0.6664656, 1.5094, 0.6717057, 1, 1, 1, 1, 1,
-0.6611786, -1.158072, -3.9855, 1, 1, 1, 1, 1,
-0.6567469, 1.122709, -1.893359, 1, 1, 1, 1, 1,
-0.6550564, 0.007084391, -1.410724, 1, 1, 1, 1, 1,
-0.6534956, -0.4535334, -1.106594, 1, 1, 1, 1, 1,
-0.6533851, -0.4738029, -2.61527, 1, 1, 1, 1, 1,
-0.6512245, 0.1651253, -1.784808, 0, 0, 1, 1, 1,
-0.6505284, 1.344412, 0.7786279, 1, 0, 0, 1, 1,
-0.6492341, 0.5505944, -1.3255, 1, 0, 0, 1, 1,
-0.6442449, -0.757179, -2.576082, 1, 0, 0, 1, 1,
-0.6431344, 0.4117221, -1.598815, 1, 0, 0, 1, 1,
-0.6422573, -0.2003564, -1.226593, 1, 0, 0, 1, 1,
-0.641556, 0.2472577, -0.3930063, 0, 0, 0, 1, 1,
-0.6350594, 2.749022, -1.011281, 0, 0, 0, 1, 1,
-0.6343025, -0.8517334, -2.060077, 0, 0, 0, 1, 1,
-0.6298454, -0.4368799, -2.330792, 0, 0, 0, 1, 1,
-0.6274627, 1.845609, -0.6093869, 0, 0, 0, 1, 1,
-0.6247867, -0.457809, -1.62963, 0, 0, 0, 1, 1,
-0.615716, 1.090341, -0.9173539, 0, 0, 0, 1, 1,
-0.6129523, -0.3230692, -3.452604, 1, 1, 1, 1, 1,
-0.6059679, -0.2887625, -2.212428, 1, 1, 1, 1, 1,
-0.6005022, 0.700161, -1.140209, 1, 1, 1, 1, 1,
-0.5982851, -1.449957, -0.7015706, 1, 1, 1, 1, 1,
-0.5968454, 2.377069, -0.8612814, 1, 1, 1, 1, 1,
-0.5948939, -0.6936151, -1.56689, 1, 1, 1, 1, 1,
-0.5944317, 0.286345, -0.3248158, 1, 1, 1, 1, 1,
-0.5927002, -0.3002688, -2.896962, 1, 1, 1, 1, 1,
-0.5846741, -0.06481148, 0.197988, 1, 1, 1, 1, 1,
-0.5799001, 0.6734807, -0.2017792, 1, 1, 1, 1, 1,
-0.5798761, 0.06764597, 0.5413557, 1, 1, 1, 1, 1,
-0.5778213, 0.2658322, -0.1982872, 1, 1, 1, 1, 1,
-0.5772988, -0.42181, -0.3088991, 1, 1, 1, 1, 1,
-0.5719985, 0.4996843, -0.7195721, 1, 1, 1, 1, 1,
-0.5547912, 0.5072821, -1.054106, 1, 1, 1, 1, 1,
-0.5527961, -0.1486365, -3.080743, 0, 0, 1, 1, 1,
-0.5527416, -1.432747, -1.242802, 1, 0, 0, 1, 1,
-0.5470975, 0.5870517, -1.318297, 1, 0, 0, 1, 1,
-0.5458034, -0.3604256, -2.26161, 1, 0, 0, 1, 1,
-0.5457904, -0.1603721, -1.034864, 1, 0, 0, 1, 1,
-0.540406, 0.4041833, 0.5854439, 1, 0, 0, 1, 1,
-0.5353642, 1.403096, -0.168182, 0, 0, 0, 1, 1,
-0.534257, 0.6512949, -0.9433585, 0, 0, 0, 1, 1,
-0.5306647, -1.195441, -4.301108, 0, 0, 0, 1, 1,
-0.5294366, 0.6785865, -0.5707611, 0, 0, 0, 1, 1,
-0.5262212, 1.921368, 1.115262, 0, 0, 0, 1, 1,
-0.5260957, 0.6478866, 1.41459, 0, 0, 0, 1, 1,
-0.5224625, -0.2978747, -0.8786885, 0, 0, 0, 1, 1,
-0.5221564, 1.320464, 1.427578, 1, 1, 1, 1, 1,
-0.5173538, -1.05114, -3.791504, 1, 1, 1, 1, 1,
-0.5131313, -0.08635143, -1.915331, 1, 1, 1, 1, 1,
-0.5128996, -0.6958496, -1.528425, 1, 1, 1, 1, 1,
-0.5126148, 2.569927, -0.358385, 1, 1, 1, 1, 1,
-0.5084041, 0.0105522, -2.292887, 1, 1, 1, 1, 1,
-0.5011656, 0.05916552, -0.7845156, 1, 1, 1, 1, 1,
-0.4981745, 1.530399, -0.02566949, 1, 1, 1, 1, 1,
-0.4969093, 0.6558851, 1.403873, 1, 1, 1, 1, 1,
-0.4961948, -2.171792, -1.712229, 1, 1, 1, 1, 1,
-0.4955654, 0.01790826, -2.055271, 1, 1, 1, 1, 1,
-0.490012, -0.1920333, -1.770562, 1, 1, 1, 1, 1,
-0.4868503, 0.2056435, -0.04158841, 1, 1, 1, 1, 1,
-0.481821, 1.554537, -0.3162655, 1, 1, 1, 1, 1,
-0.4794798, 0.142535, -2.715911, 1, 1, 1, 1, 1,
-0.4777123, 0.2769777, 0.5804793, 0, 0, 1, 1, 1,
-0.477073, 0.536949, -0.9443269, 1, 0, 0, 1, 1,
-0.4761212, 0.01879912, -1.125787, 1, 0, 0, 1, 1,
-0.4754984, -0.2410286, -1.74445, 1, 0, 0, 1, 1,
-0.4731942, 0.3427466, -1.750538, 1, 0, 0, 1, 1,
-0.469834, 0.3985693, -0.5946013, 1, 0, 0, 1, 1,
-0.4662897, 0.5513098, -0.4879209, 0, 0, 0, 1, 1,
-0.465506, -0.9392261, -1.219311, 0, 0, 0, 1, 1,
-0.4634357, 0.3554617, -0.4528738, 0, 0, 0, 1, 1,
-0.4631321, 0.7724332, -1.423673, 0, 0, 0, 1, 1,
-0.4617006, -0.2746771, -2.378637, 0, 0, 0, 1, 1,
-0.4578395, -0.05219013, -1.412377, 0, 0, 0, 1, 1,
-0.4540728, 1.718097, 0.2728836, 0, 0, 0, 1, 1,
-0.4453321, -0.3637104, -3.248329, 1, 1, 1, 1, 1,
-0.4439619, 1.264175, -1.95414, 1, 1, 1, 1, 1,
-0.4394505, 1.068229, -1.088498, 1, 1, 1, 1, 1,
-0.4391372, -0.4313126, -2.541232, 1, 1, 1, 1, 1,
-0.4367925, 0.4094236, -1.144388, 1, 1, 1, 1, 1,
-0.4367022, -0.7622376, -3.228015, 1, 1, 1, 1, 1,
-0.4363343, -0.3748665, -2.835742, 1, 1, 1, 1, 1,
-0.4253931, 0.7547411, -0.833563, 1, 1, 1, 1, 1,
-0.4189231, 0.3661252, -1.573837, 1, 1, 1, 1, 1,
-0.4152524, 0.2520116, -2.516382, 1, 1, 1, 1, 1,
-0.4112313, 0.8649572, -0.6680072, 1, 1, 1, 1, 1,
-0.4087004, -1.449373, -2.726892, 1, 1, 1, 1, 1,
-0.4085396, 1.550853, 1.918134, 1, 1, 1, 1, 1,
-0.4066662, 0.8655443, -2.981519, 1, 1, 1, 1, 1,
-0.4034137, -1.618249, -4.284543, 1, 1, 1, 1, 1,
-0.4010818, 0.8653228, 0.3611923, 0, 0, 1, 1, 1,
-0.4000331, -1.338758, -3.907159, 1, 0, 0, 1, 1,
-0.3921605, 0.7046319, -0.425154, 1, 0, 0, 1, 1,
-0.3845751, -1.058996, -2.997953, 1, 0, 0, 1, 1,
-0.3828664, 0.6679301, -0.9130623, 1, 0, 0, 1, 1,
-0.3801301, -1.247292, -3.543342, 1, 0, 0, 1, 1,
-0.3797797, 2.23322, -0.3262218, 0, 0, 0, 1, 1,
-0.3797196, 0.3646607, -1.527751, 0, 0, 0, 1, 1,
-0.3773129, -0.5102625, -2.629874, 0, 0, 0, 1, 1,
-0.3751636, 0.1771618, -0.8994148, 0, 0, 0, 1, 1,
-0.3749665, 0.8422927, -0.2959566, 0, 0, 0, 1, 1,
-0.3728441, -0.4236766, -1.721717, 0, 0, 0, 1, 1,
-0.370554, 0.7563405, 0.7931265, 0, 0, 0, 1, 1,
-0.3697476, 0.9474859, -0.6240011, 1, 1, 1, 1, 1,
-0.3631252, -0.8404976, -2.154577, 1, 1, 1, 1, 1,
-0.3592647, 0.7602925, -0.4822858, 1, 1, 1, 1, 1,
-0.358649, -0.7371552, -2.311348, 1, 1, 1, 1, 1,
-0.3566657, -0.305072, -3.555781, 1, 1, 1, 1, 1,
-0.353563, -0.7926736, -2.220665, 1, 1, 1, 1, 1,
-0.3513781, 2.055985, 1.650658, 1, 1, 1, 1, 1,
-0.3499698, 0.9343052, -0.2532699, 1, 1, 1, 1, 1,
-0.3486719, -0.3466707, -3.152694, 1, 1, 1, 1, 1,
-0.3442789, -2.39396, -3.813348, 1, 1, 1, 1, 1,
-0.3386058, 0.7985883, -0.4014595, 1, 1, 1, 1, 1,
-0.3362085, -1.056488, -3.791973, 1, 1, 1, 1, 1,
-0.3322671, 0.9144205, 1.012225, 1, 1, 1, 1, 1,
-0.330058, 1.051042, 0.2841296, 1, 1, 1, 1, 1,
-0.3300401, 0.3879834, 0.3904841, 1, 1, 1, 1, 1,
-0.3260187, -0.4724999, -4.095984, 0, 0, 1, 1, 1,
-0.3258396, 1.724115, -0.05697713, 1, 0, 0, 1, 1,
-0.3247649, -1.695713, -2.515378, 1, 0, 0, 1, 1,
-0.3220601, 0.1738404, -1.216509, 1, 0, 0, 1, 1,
-0.3189874, -1.436513, -2.878198, 1, 0, 0, 1, 1,
-0.3186469, 1.376307, 0.04186613, 1, 0, 0, 1, 1,
-0.3184944, 1.066239, 0.09855351, 0, 0, 0, 1, 1,
-0.3173923, -0.5382841, -2.537658, 0, 0, 0, 1, 1,
-0.317156, 1.5821, 0.5971746, 0, 0, 0, 1, 1,
-0.3166988, 0.08743507, -1.707976, 0, 0, 0, 1, 1,
-0.3164745, -0.9437124, -2.714076, 0, 0, 0, 1, 1,
-0.3149366, 1.185743, -0.1654826, 0, 0, 0, 1, 1,
-0.3101546, 0.9361666, -0.3660282, 0, 0, 0, 1, 1,
-0.3080234, -0.01797437, -2.014848, 1, 1, 1, 1, 1,
-0.3073643, 0.6007029, 0.5404151, 1, 1, 1, 1, 1,
-0.305668, 0.9843462, -0.3969958, 1, 1, 1, 1, 1,
-0.3043759, -0.978638, -2.387454, 1, 1, 1, 1, 1,
-0.3035376, -0.8285536, -2.109419, 1, 1, 1, 1, 1,
-0.3029852, -1.060301, -3.621249, 1, 1, 1, 1, 1,
-0.301505, -0.5136225, -3.54893, 1, 1, 1, 1, 1,
-0.2990941, -1.826814, -3.470051, 1, 1, 1, 1, 1,
-0.2977572, -1.34962, -2.506779, 1, 1, 1, 1, 1,
-0.2967526, -1.095892, -2.120424, 1, 1, 1, 1, 1,
-0.2939392, -0.02349894, -4.001318, 1, 1, 1, 1, 1,
-0.2915707, -2.248259, -2.985117, 1, 1, 1, 1, 1,
-0.288827, 0.3018141, -0.8888834, 1, 1, 1, 1, 1,
-0.2865449, -1.067453, -2.436217, 1, 1, 1, 1, 1,
-0.2844729, 0.2103661, -0.238219, 1, 1, 1, 1, 1,
-0.2807473, -0.83001, -3.343107, 0, 0, 1, 1, 1,
-0.2758262, 1.572428, -0.2202937, 1, 0, 0, 1, 1,
-0.2725457, -0.8316224, -2.306418, 1, 0, 0, 1, 1,
-0.2591335, 0.9582525, 0.1772564, 1, 0, 0, 1, 1,
-0.2557189, 0.443244, -1.402243, 1, 0, 0, 1, 1,
-0.2550476, -0.7288768, -3.740659, 1, 0, 0, 1, 1,
-0.2540715, 0.5200764, -0.2446976, 0, 0, 0, 1, 1,
-0.2540574, 0.4566874, -0.7034679, 0, 0, 0, 1, 1,
-0.2515688, -0.5668288, -1.987365, 0, 0, 0, 1, 1,
-0.2451808, 0.4384191, -1.319399, 0, 0, 0, 1, 1,
-0.2449848, -0.2062369, -2.407021, 0, 0, 0, 1, 1,
-0.2444032, 1.502026, 0.595228, 0, 0, 0, 1, 1,
-0.2406621, -1.545894, -3.915039, 0, 0, 0, 1, 1,
-0.2405633, 0.7723127, 2.471453, 1, 1, 1, 1, 1,
-0.2379018, 1.281193, 0.3438446, 1, 1, 1, 1, 1,
-0.2302613, -1.737377, -3.558, 1, 1, 1, 1, 1,
-0.2264578, 0.09037881, -0.8902489, 1, 1, 1, 1, 1,
-0.2198676, 0.5496662, 0.8147281, 1, 1, 1, 1, 1,
-0.2197976, 1.742054, -0.2877135, 1, 1, 1, 1, 1,
-0.2192256, 0.1357375, -1.262317, 1, 1, 1, 1, 1,
-0.2172421, 0.8648967, 0.8592412, 1, 1, 1, 1, 1,
-0.2166224, 1.492776, -0.1474403, 1, 1, 1, 1, 1,
-0.2137676, -0.8211008, -3.577999, 1, 1, 1, 1, 1,
-0.2125785, 0.2995542, 0.1492187, 1, 1, 1, 1, 1,
-0.2115058, -1.79218, -3.39677, 1, 1, 1, 1, 1,
-0.2066317, 0.1154263, -0.6931615, 1, 1, 1, 1, 1,
-0.2022506, -0.252532, -3.281108, 1, 1, 1, 1, 1,
-0.1985087, 0.8931378, -1.271782, 1, 1, 1, 1, 1,
-0.1983616, 0.6394099, 0.8391634, 0, 0, 1, 1, 1,
-0.1977952, -1.299454, -4.683747, 1, 0, 0, 1, 1,
-0.1974719, -0.3979638, -0.9626154, 1, 0, 0, 1, 1,
-0.1936678, -0.06478994, -1.370713, 1, 0, 0, 1, 1,
-0.1931895, -0.08189156, -3.032368, 1, 0, 0, 1, 1,
-0.1926635, 0.3954109, -1.130601, 1, 0, 0, 1, 1,
-0.1903254, 0.2440905, -1.488288, 0, 0, 0, 1, 1,
-0.1885018, 0.880946, -0.7386931, 0, 0, 0, 1, 1,
-0.1884898, -1.323385, -1.220285, 0, 0, 0, 1, 1,
-0.1878565, -0.6309498, -4.126852, 0, 0, 0, 1, 1,
-0.1876066, -1.090906, -4.69483, 0, 0, 0, 1, 1,
-0.1724157, 0.009895924, -1.940807, 0, 0, 0, 1, 1,
-0.1719678, 0.8233141, -1.27635, 0, 0, 0, 1, 1,
-0.1625628, -1.50712, -4.202198, 1, 1, 1, 1, 1,
-0.1600279, 0.2925556, 1.228508, 1, 1, 1, 1, 1,
-0.1556417, 1.421311, -0.4588367, 1, 1, 1, 1, 1,
-0.1547286, 1.079496, -0.01296069, 1, 1, 1, 1, 1,
-0.1535145, 0.3090538, -1.123634, 1, 1, 1, 1, 1,
-0.1527915, -1.29313, -3.952703, 1, 1, 1, 1, 1,
-0.1518681, 1.003955, 0.3832783, 1, 1, 1, 1, 1,
-0.1515534, 1.431528, 0.09324289, 1, 1, 1, 1, 1,
-0.1514825, 1.069999, -2.21692, 1, 1, 1, 1, 1,
-0.145992, -1.407084, -4.220792, 1, 1, 1, 1, 1,
-0.1451415, -0.3980879, -2.8532, 1, 1, 1, 1, 1,
-0.1420221, -0.07166853, -2.72009, 1, 1, 1, 1, 1,
-0.1407622, -0.8542531, -2.131298, 1, 1, 1, 1, 1,
-0.1392113, -0.7003424, -2.175813, 1, 1, 1, 1, 1,
-0.1383918, 0.04900368, -1.496235, 1, 1, 1, 1, 1,
-0.137726, 1.02004, -0.1261323, 0, 0, 1, 1, 1,
-0.1354584, 0.9511616, -0.246993, 1, 0, 0, 1, 1,
-0.1314082, -0.3164896, -2.020641, 1, 0, 0, 1, 1,
-0.1312698, -0.8554196, -2.383667, 1, 0, 0, 1, 1,
-0.1301482, 0.2876864, -0.3969441, 1, 0, 0, 1, 1,
-0.1295344, -0.582063, -2.751977, 1, 0, 0, 1, 1,
-0.1247978, 0.1623258, -0.4134676, 0, 0, 0, 1, 1,
-0.1037081, 0.3020083, -0.8763112, 0, 0, 0, 1, 1,
-0.1034512, 0.6479278, -1.158223, 0, 0, 0, 1, 1,
-0.1034111, -0.5115278, -2.19592, 0, 0, 0, 1, 1,
-0.09671447, -0.9691259, -2.459794, 0, 0, 0, 1, 1,
-0.09490952, 1.449968, -0.5472335, 0, 0, 0, 1, 1,
-0.09265973, -0.01814817, -3.179386, 0, 0, 0, 1, 1,
-0.09192444, -1.145178, -1.874344, 1, 1, 1, 1, 1,
-0.09026887, 0.6260527, -1.924574, 1, 1, 1, 1, 1,
-0.09009375, 1.82056, 0.003914825, 1, 1, 1, 1, 1,
-0.08817802, -0.804193, -1.39501, 1, 1, 1, 1, 1,
-0.08759872, 0.6183169, 0.3316036, 1, 1, 1, 1, 1,
-0.0859239, -0.8094313, -1.310615, 1, 1, 1, 1, 1,
-0.08316503, 1.287305, 1.259102, 1, 1, 1, 1, 1,
-0.07635217, 0.1238408, -0.4799697, 1, 1, 1, 1, 1,
-0.07192452, -0.3972084, -2.976056, 1, 1, 1, 1, 1,
-0.07130368, 0.9224245, 2.085477, 1, 1, 1, 1, 1,
-0.07027594, 0.3025057, -0.7069921, 1, 1, 1, 1, 1,
-0.06865193, 0.284487, 0.2867054, 1, 1, 1, 1, 1,
-0.06731872, 0.599175, 0.1503604, 1, 1, 1, 1, 1,
-0.06547444, 0.2533799, 0.5663936, 1, 1, 1, 1, 1,
-0.06364643, -0.6816883, -4.041217, 1, 1, 1, 1, 1,
-0.06101615, -1.286876, -3.231687, 0, 0, 1, 1, 1,
-0.05891721, -1.739421, -2.778238, 1, 0, 0, 1, 1,
-0.05508465, 0.01759818, 0.1399878, 1, 0, 0, 1, 1,
-0.05327046, -0.2810299, -1.915942, 1, 0, 0, 1, 1,
-0.0519949, 1.170673, 0.1803623, 1, 0, 0, 1, 1,
-0.05175763, -1.832356, -2.583604, 1, 0, 0, 1, 1,
-0.04941609, -0.3601865, -3.802154, 0, 0, 0, 1, 1,
-0.04716923, 0.5811713, 0.05092158, 0, 0, 0, 1, 1,
-0.04532852, -0.3182774, -2.973664, 0, 0, 0, 1, 1,
-0.04460146, -0.1069618, -2.191842, 0, 0, 0, 1, 1,
-0.04384801, 0.6101081, -1.021697, 0, 0, 0, 1, 1,
-0.04215319, -0.04677822, -2.044861, 0, 0, 0, 1, 1,
-0.04213287, 0.03352204, -1.405811, 0, 0, 0, 1, 1,
-0.04156518, 0.8399032, 2.000016, 1, 1, 1, 1, 1,
-0.04096864, 0.03474198, -0.4018196, 1, 1, 1, 1, 1,
-0.03950743, 1.626988, 0.4890114, 1, 1, 1, 1, 1,
-0.03898488, -0.7108943, -3.344182, 1, 1, 1, 1, 1,
-0.03658329, -1.376532, -2.176772, 1, 1, 1, 1, 1,
-0.03273949, -0.2763183, -2.894633, 1, 1, 1, 1, 1,
-0.03193404, -0.03790409, -1.767292, 1, 1, 1, 1, 1,
-0.02731999, -0.3122779, -3.694642, 1, 1, 1, 1, 1,
-0.02485444, 0.03105529, -3.108405, 1, 1, 1, 1, 1,
-0.02372512, 0.3445563, -0.7081076, 1, 1, 1, 1, 1,
-0.02201148, -0.9100887, -3.986683, 1, 1, 1, 1, 1,
-0.0155619, 0.06099902, 0.3037023, 1, 1, 1, 1, 1,
-0.01374978, -0.4668989, -3.015064, 1, 1, 1, 1, 1,
-0.01267078, 1.074224, -0.6951375, 1, 1, 1, 1, 1,
-0.008699243, 0.1182458, -0.9630078, 1, 1, 1, 1, 1,
-0.007725856, 1.242604, 1.539067, 0, 0, 1, 1, 1,
-0.006411956, 1.150384, 1.135942, 1, 0, 0, 1, 1,
0.01283896, -1.35293, 3.327276, 1, 0, 0, 1, 1,
0.0173279, 0.02007233, -1.144679, 1, 0, 0, 1, 1,
0.01767573, 0.9264256, -0.3279712, 1, 0, 0, 1, 1,
0.02481098, -0.3115463, 3.349938, 1, 0, 0, 1, 1,
0.0278422, 0.09346831, 0.4859504, 0, 0, 0, 1, 1,
0.03410612, -0.5885642, 2.216661, 0, 0, 0, 1, 1,
0.03488726, 0.8658806, 0.07254132, 0, 0, 0, 1, 1,
0.03531114, 0.6698356, 0.4638247, 0, 0, 0, 1, 1,
0.03610172, -0.2808283, 3.308125, 0, 0, 0, 1, 1,
0.03650459, -1.152445, 3.010637, 0, 0, 0, 1, 1,
0.03915959, -0.1099334, 3.830081, 0, 0, 0, 1, 1,
0.04075828, 2.57142, 0.2602264, 1, 1, 1, 1, 1,
0.04700936, -2.289923, 4.533895, 1, 1, 1, 1, 1,
0.04926927, -0.8375021, 2.897356, 1, 1, 1, 1, 1,
0.05768244, 0.4385651, -0.9804078, 1, 1, 1, 1, 1,
0.05813629, 0.9031702, -0.3959877, 1, 1, 1, 1, 1,
0.05960378, 0.2474751, -0.3771055, 1, 1, 1, 1, 1,
0.06205876, -0.441712, 2.287927, 1, 1, 1, 1, 1,
0.06501509, -0.7422739, 1.264847, 1, 1, 1, 1, 1,
0.06878483, -0.5728696, 2.408168, 1, 1, 1, 1, 1,
0.07052942, 0.5496444, -1.113232, 1, 1, 1, 1, 1,
0.07223352, -0.7338215, 2.658186, 1, 1, 1, 1, 1,
0.0727128, -0.4844055, 4.677235, 1, 1, 1, 1, 1,
0.07304829, 0.397223, 2.055163, 1, 1, 1, 1, 1,
0.07359684, 0.3509388, 0.8163915, 1, 1, 1, 1, 1,
0.07410744, 0.5855029, 0.4842925, 1, 1, 1, 1, 1,
0.07798187, 0.02040335, 0.5220636, 0, 0, 1, 1, 1,
0.07802707, 0.5907922, -0.7328827, 1, 0, 0, 1, 1,
0.0783157, 1.307877, -1.661233, 1, 0, 0, 1, 1,
0.08006846, -0.7718594, 2.982109, 1, 0, 0, 1, 1,
0.08493493, -0.9875936, 2.170324, 1, 0, 0, 1, 1,
0.08623955, 0.3628099, 1.636002, 1, 0, 0, 1, 1,
0.08684465, 1.444845, 1.09501, 0, 0, 0, 1, 1,
0.08893632, 0.9729196, -1.265135, 0, 0, 0, 1, 1,
0.090625, 0.5946325, 2.006916, 0, 0, 0, 1, 1,
0.09192587, 0.8844569, 0.1465076, 0, 0, 0, 1, 1,
0.0930531, 0.3421091, -2.015105, 0, 0, 0, 1, 1,
0.0956095, 1.239866, 1.066933, 0, 0, 0, 1, 1,
0.1042982, -0.4189999, 1.263906, 0, 0, 0, 1, 1,
0.1051287, 1.150574, 0.8765541, 1, 1, 1, 1, 1,
0.1056964, 0.1975005, -0.04688507, 1, 1, 1, 1, 1,
0.108353, -0.7301553, 3.264944, 1, 1, 1, 1, 1,
0.1091306, 0.1513571, -1.541697, 1, 1, 1, 1, 1,
0.1093892, -0.1303481, 3.165386, 1, 1, 1, 1, 1,
0.1109168, 0.2921472, 0.2672718, 1, 1, 1, 1, 1,
0.1141303, -1.599275, 1.695703, 1, 1, 1, 1, 1,
0.1150915, -1.386637, 1.574575, 1, 1, 1, 1, 1,
0.1278472, -0.1954096, 2.089891, 1, 1, 1, 1, 1,
0.1317502, 0.4619201, 0.1839969, 1, 1, 1, 1, 1,
0.1321253, 0.0793208, 1.442066, 1, 1, 1, 1, 1,
0.1323564, -0.7766183, 2.19668, 1, 1, 1, 1, 1,
0.1340525, 0.1277718, 0.8980701, 1, 1, 1, 1, 1,
0.1359501, 0.2493756, 1.518388, 1, 1, 1, 1, 1,
0.1370034, 0.3273989, 1.47126, 1, 1, 1, 1, 1,
0.1374831, -1.244985, 2.300614, 0, 0, 1, 1, 1,
0.1427285, 0.2267853, 1.624425, 1, 0, 0, 1, 1,
0.1449447, -0.5429498, 3.43364, 1, 0, 0, 1, 1,
0.1581601, 1.158923, -0.3792903, 1, 0, 0, 1, 1,
0.1581824, -0.1481996, 1.643126, 1, 0, 0, 1, 1,
0.1598051, -2.68905, 3.491184, 1, 0, 0, 1, 1,
0.1619759, -0.2729928, 5.157942, 0, 0, 0, 1, 1,
0.1652519, -1.2495, 3.546504, 0, 0, 0, 1, 1,
0.1662074, 0.7886569, 0.215395, 0, 0, 0, 1, 1,
0.1679647, 1.181911, -0.1587559, 0, 0, 0, 1, 1,
0.1701032, 1.464017, 1.315383, 0, 0, 0, 1, 1,
0.17032, -0.2675565, 4.646588, 0, 0, 0, 1, 1,
0.1724592, 0.4457926, 0.06237366, 0, 0, 0, 1, 1,
0.1758338, 0.2454744, 1.892258, 1, 1, 1, 1, 1,
0.1906758, -0.2826201, 2.994625, 1, 1, 1, 1, 1,
0.1921504, 1.469301, -1.637206, 1, 1, 1, 1, 1,
0.193337, 0.9377807, -2.167041, 1, 1, 1, 1, 1,
0.2038149, -0.0681639, 0.8849023, 1, 1, 1, 1, 1,
0.2041693, -0.06400625, 2.981366, 1, 1, 1, 1, 1,
0.2052122, 0.6691088, 2.063348, 1, 1, 1, 1, 1,
0.2055257, -0.2570297, 0.9335991, 1, 1, 1, 1, 1,
0.2075807, -0.9391965, 3.942688, 1, 1, 1, 1, 1,
0.2124394, 0.8995301, -0.1371133, 1, 1, 1, 1, 1,
0.2171089, 0.4434235, 0.3161549, 1, 1, 1, 1, 1,
0.2191453, -0.08890208, 1.878973, 1, 1, 1, 1, 1,
0.2278056, 1.976827, -0.756483, 1, 1, 1, 1, 1,
0.2303838, 0.5329152, -0.6900863, 1, 1, 1, 1, 1,
0.2337339, 1.812674, -0.7128254, 1, 1, 1, 1, 1,
0.2343721, -2.219135, 3.499944, 0, 0, 1, 1, 1,
0.2424874, -1.967421, 2.868068, 1, 0, 0, 1, 1,
0.2428072, 1.347351, 0.7193282, 1, 0, 0, 1, 1,
0.2431356, 0.1330098, 0.6000904, 1, 0, 0, 1, 1,
0.2440228, 0.7750778, -0.9509844, 1, 0, 0, 1, 1,
0.2503833, -1.666607, 2.053482, 1, 0, 0, 1, 1,
0.2627603, 0.1501932, 0.9940812, 0, 0, 0, 1, 1,
0.2636859, -0.3125128, 3.753027, 0, 0, 0, 1, 1,
0.2693135, 0.6325892, 1.489462, 0, 0, 0, 1, 1,
0.2730331, 0.1059693, 1.424282, 0, 0, 0, 1, 1,
0.2752569, 0.2262473, -0.4780614, 0, 0, 0, 1, 1,
0.2754976, -0.09833365, 1.950685, 0, 0, 0, 1, 1,
0.2757354, -1.252298, 4.519416, 0, 0, 0, 1, 1,
0.2761814, -0.7936139, 3.007184, 1, 1, 1, 1, 1,
0.277418, -0.06910238, 1.962229, 1, 1, 1, 1, 1,
0.2786582, -1.649116, 1.322008, 1, 1, 1, 1, 1,
0.2793918, -0.3775361, 3.274953, 1, 1, 1, 1, 1,
0.2809827, 1.169677, 0.4554525, 1, 1, 1, 1, 1,
0.2827376, -0.0258123, 2.216543, 1, 1, 1, 1, 1,
0.2832573, 1.605936, 1.390084, 1, 1, 1, 1, 1,
0.2946081, 0.5433939, 0.6069387, 1, 1, 1, 1, 1,
0.2967426, -1.31735, 2.780674, 1, 1, 1, 1, 1,
0.2984403, -0.760654, 4.124408, 1, 1, 1, 1, 1,
0.3012582, 0.9767424, -0.4999167, 1, 1, 1, 1, 1,
0.301954, 0.04042732, 3.758607, 1, 1, 1, 1, 1,
0.3036208, 0.5666255, -0.004959695, 1, 1, 1, 1, 1,
0.3049203, 1.153694, -0.2311179, 1, 1, 1, 1, 1,
0.3059353, 0.3635724, 0.4920839, 1, 1, 1, 1, 1,
0.3072119, 0.5701159, 1.677991, 0, 0, 1, 1, 1,
0.3086121, -1.42008, 3.074139, 1, 0, 0, 1, 1,
0.3147234, -0.004563702, 1.311587, 1, 0, 0, 1, 1,
0.315213, 0.929207, -0.8058116, 1, 0, 0, 1, 1,
0.3171924, -0.5114849, 1.73458, 1, 0, 0, 1, 1,
0.3204607, 0.1464414, -0.09200908, 1, 0, 0, 1, 1,
0.3283946, 1.118931, 1.380125, 0, 0, 0, 1, 1,
0.3287137, 0.3046712, 0.7641234, 0, 0, 0, 1, 1,
0.3321354, 1.770494, 0.01895455, 0, 0, 0, 1, 1,
0.332702, 1.255908, 1.451545, 0, 0, 0, 1, 1,
0.3372406, -1.052728, 2.714756, 0, 0, 0, 1, 1,
0.3406145, 1.468521, -1.099871, 0, 0, 0, 1, 1,
0.3444754, 1.819018, -0.4943365, 0, 0, 0, 1, 1,
0.3462994, 0.6284087, 0.3804761, 1, 1, 1, 1, 1,
0.3475223, -0.294878, 3.370928, 1, 1, 1, 1, 1,
0.3479177, -0.4221006, 3.064439, 1, 1, 1, 1, 1,
0.3482895, 0.278548, -1.50158, 1, 1, 1, 1, 1,
0.3500133, 1.379953, 0.5544407, 1, 1, 1, 1, 1,
0.3500857, 0.601047, 1.242272, 1, 1, 1, 1, 1,
0.3501662, 0.1530117, 1.127456, 1, 1, 1, 1, 1,
0.3539533, -0.8315259, 1.847407, 1, 1, 1, 1, 1,
0.3563639, 0.5727493, -0.4523831, 1, 1, 1, 1, 1,
0.3570367, 1.019456, 0.7760607, 1, 1, 1, 1, 1,
0.3597558, -0.009753889, -0.1765251, 1, 1, 1, 1, 1,
0.3600408, -0.4783542, 2.197223, 1, 1, 1, 1, 1,
0.3622206, -0.4609201, 2.671941, 1, 1, 1, 1, 1,
0.3627074, -1.26293, 0.6184369, 1, 1, 1, 1, 1,
0.3630019, -0.1192876, 1.738135, 1, 1, 1, 1, 1,
0.3684961, -0.1457101, 1.145841, 0, 0, 1, 1, 1,
0.3704633, 0.4078718, 2.049536, 1, 0, 0, 1, 1,
0.3746484, -0.6218179, 2.707432, 1, 0, 0, 1, 1,
0.3756506, 0.1855663, 2.123389, 1, 0, 0, 1, 1,
0.3761141, -0.6303179, 2.678718, 1, 0, 0, 1, 1,
0.3787661, 0.1373423, 0.2991789, 1, 0, 0, 1, 1,
0.3788599, -2.388325, 3.756734, 0, 0, 0, 1, 1,
0.3811138, -1.265838, 3.15032, 0, 0, 0, 1, 1,
0.3849072, 0.1679229, 0.6216623, 0, 0, 0, 1, 1,
0.3879258, -2.35034, 2.618358, 0, 0, 0, 1, 1,
0.3998367, -0.5035707, 1.611863, 0, 0, 0, 1, 1,
0.4021943, 1.829008, -1.277462, 0, 0, 0, 1, 1,
0.4026261, -1.273962, 1.095611, 0, 0, 0, 1, 1,
0.4081042, -0.5464535, 1.942298, 1, 1, 1, 1, 1,
0.408248, 0.4109326, 2.946326, 1, 1, 1, 1, 1,
0.4116257, 0.2348862, 1.53252, 1, 1, 1, 1, 1,
0.4121601, 0.3662039, 2.508301, 1, 1, 1, 1, 1,
0.4123047, -0.6425909, 4.78142, 1, 1, 1, 1, 1,
0.4183768, -1.486949, 2.697417, 1, 1, 1, 1, 1,
0.4231339, -1.491752, 1.713888, 1, 1, 1, 1, 1,
0.4266073, -0.1633925, 1.416376, 1, 1, 1, 1, 1,
0.4292718, -1.832172, 5.67797, 1, 1, 1, 1, 1,
0.4336731, -1.043016, 2.442894, 1, 1, 1, 1, 1,
0.4343944, 0.09708205, 1.084961, 1, 1, 1, 1, 1,
0.4374869, -0.004230643, 0.90323, 1, 1, 1, 1, 1,
0.4381062, -0.6803211, 3.822571, 1, 1, 1, 1, 1,
0.4397942, 1.016124, 0.4037721, 1, 1, 1, 1, 1,
0.4403038, -0.7326099, 1.837412, 1, 1, 1, 1, 1,
0.441875, 0.06394546, 0.8449907, 0, 0, 1, 1, 1,
0.4653873, 0.1125647, 0.7089912, 1, 0, 0, 1, 1,
0.4674924, 0.9033437, -0.4498949, 1, 0, 0, 1, 1,
0.4699069, -0.2399805, 1.592345, 1, 0, 0, 1, 1,
0.470967, 0.3617312, 1.200917, 1, 0, 0, 1, 1,
0.4714278, 0.6788949, 0.9620689, 1, 0, 0, 1, 1,
0.4732813, 0.2921811, 0.2205007, 0, 0, 0, 1, 1,
0.4748623, -0.3586464, 2.5691, 0, 0, 0, 1, 1,
0.4758798, -1.501678, 2.026655, 0, 0, 0, 1, 1,
0.4804529, 0.617682, 0.8702774, 0, 0, 0, 1, 1,
0.4818197, -0.6277401, 1.808252, 0, 0, 0, 1, 1,
0.4902069, -0.9385528, 2.064708, 0, 0, 0, 1, 1,
0.4912249, -0.4361638, 0.4330991, 0, 0, 0, 1, 1,
0.4928642, -1.208375, 2.773928, 1, 1, 1, 1, 1,
0.4979867, -0.3906281, 1.624367, 1, 1, 1, 1, 1,
0.4996422, -0.1471574, 2.856134, 1, 1, 1, 1, 1,
0.5097926, -0.8086227, 3.91901, 1, 1, 1, 1, 1,
0.5212082, 1.965651, 1.896937, 1, 1, 1, 1, 1,
0.5299169, 0.09154427, 0.9881435, 1, 1, 1, 1, 1,
0.5344399, 0.7940776, 0.1111287, 1, 1, 1, 1, 1,
0.5346276, 0.3639645, 0.5370759, 1, 1, 1, 1, 1,
0.5354304, 1.062344, 0.9034787, 1, 1, 1, 1, 1,
0.5363736, 2.097111, 1.095751, 1, 1, 1, 1, 1,
0.5379643, -0.08712661, 2.188246, 1, 1, 1, 1, 1,
0.5450465, -0.9537109, 2.780044, 1, 1, 1, 1, 1,
0.5460538, 1.89537, -0.6408939, 1, 1, 1, 1, 1,
0.5463794, 0.2667753, 1.408575, 1, 1, 1, 1, 1,
0.5465073, -0.7880681, 1.354904, 1, 1, 1, 1, 1,
0.5524569, -1.439117, 1.908149, 0, 0, 1, 1, 1,
0.552568, 0.2299802, -0.07859823, 1, 0, 0, 1, 1,
0.5554258, -0.9515955, 1.301806, 1, 0, 0, 1, 1,
0.5563242, 1.322116, -0.4675184, 1, 0, 0, 1, 1,
0.558596, -0.7289746, 1.010461, 1, 0, 0, 1, 1,
0.5592508, 0.3742833, 2.48805, 1, 0, 0, 1, 1,
0.5696449, -1.438102, 4.64456, 0, 0, 0, 1, 1,
0.570522, 0.08064476, 1.13396, 0, 0, 0, 1, 1,
0.578168, -0.4212222, 1.51829, 0, 0, 0, 1, 1,
0.5784517, 1.375337, 1.768148, 0, 0, 0, 1, 1,
0.5797469, 0.4557933, 1.969152, 0, 0, 0, 1, 1,
0.581287, -0.4933728, 2.841902, 0, 0, 0, 1, 1,
0.5837877, -0.6665429, 3.653038, 0, 0, 0, 1, 1,
0.5911353, -0.4673814, 2.010329, 1, 1, 1, 1, 1,
0.5951107, 1.187147, 1.6988, 1, 1, 1, 1, 1,
0.5975119, 1.304786, -0.2959151, 1, 1, 1, 1, 1,
0.600168, -0.2226516, 1.020882, 1, 1, 1, 1, 1,
0.6020944, -1.09133, 1.302366, 1, 1, 1, 1, 1,
0.6025568, -0.1038774, 0.3043764, 1, 1, 1, 1, 1,
0.6033705, 0.1389895, 0.3495311, 1, 1, 1, 1, 1,
0.6044647, -0.8576754, 3.440048, 1, 1, 1, 1, 1,
0.6053575, -1.087871, 2.095888, 1, 1, 1, 1, 1,
0.6072319, -1.232966, 2.480492, 1, 1, 1, 1, 1,
0.6121929, -0.3141938, 2.014819, 1, 1, 1, 1, 1,
0.6162602, -0.9156498, 1.678898, 1, 1, 1, 1, 1,
0.6179238, -1.474366, 1.120696, 1, 1, 1, 1, 1,
0.6253017, 0.1214172, 0.9755129, 1, 1, 1, 1, 1,
0.6255388, 0.3189843, 1.318634, 1, 1, 1, 1, 1,
0.6258445, 0.7001366, 1.221989, 0, 0, 1, 1, 1,
0.6294174, -0.6742229, 2.512741, 1, 0, 0, 1, 1,
0.638612, -0.03285151, 3.019961, 1, 0, 0, 1, 1,
0.6390287, -1.147298, 2.053646, 1, 0, 0, 1, 1,
0.6395858, 1.039081, 2.13921, 1, 0, 0, 1, 1,
0.6475146, 0.9506528, 1.657177, 1, 0, 0, 1, 1,
0.6534795, 1.666991, 2.201201, 0, 0, 0, 1, 1,
0.664041, -0.8835716, 2.848489, 0, 0, 0, 1, 1,
0.6740115, 0.4923454, -0.0280189, 0, 0, 0, 1, 1,
0.6756532, 2.140835, 2.269954, 0, 0, 0, 1, 1,
0.67733, 0.2042568, -0.1069662, 0, 0, 0, 1, 1,
0.6787279, 1.901162, -0.0602244, 0, 0, 0, 1, 1,
0.681002, 0.005101906, 1.833868, 0, 0, 0, 1, 1,
0.6811005, 0.2927906, 0.8712676, 1, 1, 1, 1, 1,
0.6849419, -0.9433337, 1.737002, 1, 1, 1, 1, 1,
0.689199, 0.09045019, 0.6663489, 1, 1, 1, 1, 1,
0.6949093, 0.2031164, 1.296242, 1, 1, 1, 1, 1,
0.6976151, 0.8190427, 0.02695079, 1, 1, 1, 1, 1,
0.6977882, -0.6583446, 3.183626, 1, 1, 1, 1, 1,
0.6994487, -0.4692483, 4.246999, 1, 1, 1, 1, 1,
0.7015789, -0.2497237, 2.798618, 1, 1, 1, 1, 1,
0.7016718, 0.2718317, 0.5355033, 1, 1, 1, 1, 1,
0.7051806, -1.005143, 1.899489, 1, 1, 1, 1, 1,
0.7054827, -0.06010228, 3.153623, 1, 1, 1, 1, 1,
0.7073373, 0.4016494, 0.8476423, 1, 1, 1, 1, 1,
0.7081332, -0.1925306, 2.509018, 1, 1, 1, 1, 1,
0.7096783, -1.233093, 3.154863, 1, 1, 1, 1, 1,
0.7097028, -0.678004, 1.418365, 1, 1, 1, 1, 1,
0.7148383, -0.2936386, 2.892133, 0, 0, 1, 1, 1,
0.7170249, 0.1038532, 2.303402, 1, 0, 0, 1, 1,
0.7183145, 1.503641, 0.6805753, 1, 0, 0, 1, 1,
0.7183163, 1.204248, 0.1303718, 1, 0, 0, 1, 1,
0.7195573, 0.4190029, 1.735169, 1, 0, 0, 1, 1,
0.7203424, 1.08773, 0.9451968, 1, 0, 0, 1, 1,
0.7247484, -1.463269, 2.6455, 0, 0, 0, 1, 1,
0.7267919, 0.5231844, 2.749484, 0, 0, 0, 1, 1,
0.7293122, -0.03835078, 0.6733415, 0, 0, 0, 1, 1,
0.7365645, 1.001096, 0.1846245, 0, 0, 0, 1, 1,
0.7457339, -1.133592, 3.343622, 0, 0, 0, 1, 1,
0.7457678, -0.6005349, 0.8361035, 0, 0, 0, 1, 1,
0.7457893, -0.4907103, 2.508535, 0, 0, 0, 1, 1,
0.7474217, 1.672986, -1.563217, 1, 1, 1, 1, 1,
0.7480915, 0.7804399, 0.9753873, 1, 1, 1, 1, 1,
0.7487997, 1.41776, 0.4694524, 1, 1, 1, 1, 1,
0.7492712, 2.203264, 0.1009971, 1, 1, 1, 1, 1,
0.752219, -0.564854, 1.416982, 1, 1, 1, 1, 1,
0.752701, 0.6946142, -1.064372, 1, 1, 1, 1, 1,
0.7564579, -0.01118683, 2.545717, 1, 1, 1, 1, 1,
0.7608461, -0.1083936, 2.198656, 1, 1, 1, 1, 1,
0.7648236, -0.4042398, 2.73424, 1, 1, 1, 1, 1,
0.7686535, 0.2032193, 2.239295, 1, 1, 1, 1, 1,
0.7686709, 0.9980502, 2.26388, 1, 1, 1, 1, 1,
0.770972, -0.01098982, 1.12321, 1, 1, 1, 1, 1,
0.7839638, -1.029819, 1.432349, 1, 1, 1, 1, 1,
0.7869803, 0.9945681, 2.381316, 1, 1, 1, 1, 1,
0.787852, -0.5203794, 2.287283, 1, 1, 1, 1, 1,
0.7881549, -1.923512, 3.02559, 0, 0, 1, 1, 1,
0.788285, 0.6133446, 0.4752562, 1, 0, 0, 1, 1,
0.789956, -1.254795, 0.8220184, 1, 0, 0, 1, 1,
0.7927876, 0.7006477, 0.160418, 1, 0, 0, 1, 1,
0.7935119, -0.2678419, 3.066607, 1, 0, 0, 1, 1,
0.8048841, -0.4021324, 2.982982, 1, 0, 0, 1, 1,
0.8052134, -0.8448406, 4.565188, 0, 0, 0, 1, 1,
0.8107496, 0.306161, 1.509836, 0, 0, 0, 1, 1,
0.8130099, -1.109107, -0.2269644, 0, 0, 0, 1, 1,
0.8140948, 0.2825255, 1.786596, 0, 0, 0, 1, 1,
0.8175638, 0.214305, 0.03414857, 0, 0, 0, 1, 1,
0.818038, 0.1696523, 3.473773, 0, 0, 0, 1, 1,
0.8188838, 0.4146042, 1.827032, 0, 0, 0, 1, 1,
0.823323, -0.1056976, 1.395773, 1, 1, 1, 1, 1,
0.8241813, -0.1809181, 1.721716, 1, 1, 1, 1, 1,
0.834603, 0.6173086, 0.7577031, 1, 1, 1, 1, 1,
0.8432806, -0.01617987, 1.354378, 1, 1, 1, 1, 1,
0.8447514, -0.5662979, 0.4645103, 1, 1, 1, 1, 1,
0.8471354, 0.51941, -0.1883851, 1, 1, 1, 1, 1,
0.849126, 0.1131817, 2.490331, 1, 1, 1, 1, 1,
0.8531777, -1.053469, 1.708229, 1, 1, 1, 1, 1,
0.8542756, 0.3946786, 0.7098691, 1, 1, 1, 1, 1,
0.8569607, 0.472293, 1.981679, 1, 1, 1, 1, 1,
0.8572258, 1.15595, 0.8306765, 1, 1, 1, 1, 1,
0.8580225, 1.525218, 0.03164254, 1, 1, 1, 1, 1,
0.8621991, -1.082824, 3.174121, 1, 1, 1, 1, 1,
0.8626721, -0.3298523, 1.917634, 1, 1, 1, 1, 1,
0.8653224, 1.192855, -0.5450255, 1, 1, 1, 1, 1,
0.8728536, -0.07031885, 2.637993, 0, 0, 1, 1, 1,
0.8734074, -2.109732, 3.47839, 1, 0, 0, 1, 1,
0.8766972, 1.81025, 1.336233, 1, 0, 0, 1, 1,
0.876826, -0.4817167, 2.926458, 1, 0, 0, 1, 1,
0.8800383, 1.167446, 0.4882139, 1, 0, 0, 1, 1,
0.8884681, -1.515032, 1.788917, 1, 0, 0, 1, 1,
0.8909656, 1.698929, -0.2539512, 0, 0, 0, 1, 1,
0.8936425, 0.669199, -0.7813646, 0, 0, 0, 1, 1,
0.8962681, -0.5781619, 1.903335, 0, 0, 0, 1, 1,
0.9046308, 0.01210188, 2.1597, 0, 0, 0, 1, 1,
0.9071894, -2.314481, 3.366174, 0, 0, 0, 1, 1,
0.9075238, 1.027229, 1.756649, 0, 0, 0, 1, 1,
0.9143324, 0.8853819, 1.131885, 0, 0, 0, 1, 1,
0.9170076, 1.44594, 1.621502, 1, 1, 1, 1, 1,
0.917074, -0.1163377, 1.178658, 1, 1, 1, 1, 1,
0.9210685, 0.4902393, 0.2295918, 1, 1, 1, 1, 1,
0.9231321, -1.952175, 1.393522, 1, 1, 1, 1, 1,
0.9356238, -0.0396753, 1.10145, 1, 1, 1, 1, 1,
0.9386728, 0.6571673, 0.09447101, 1, 1, 1, 1, 1,
0.9397048, 1.211255, -0.5935681, 1, 1, 1, 1, 1,
0.9428718, -0.2212298, 2.088757, 1, 1, 1, 1, 1,
0.9436556, -0.01529522, 0.5637525, 1, 1, 1, 1, 1,
0.9459619, 0.6911412, -0.02819603, 1, 1, 1, 1, 1,
0.9509996, -0.5414618, 1.911406, 1, 1, 1, 1, 1,
0.9535664, -2.569775, 3.118668, 1, 1, 1, 1, 1,
0.9543187, -0.4057378, 3.014966, 1, 1, 1, 1, 1,
0.9549997, -0.969062, 3.033838, 1, 1, 1, 1, 1,
0.9553471, -1.185434, 2.845413, 1, 1, 1, 1, 1,
0.9590732, 1.665571, -0.3799165, 0, 0, 1, 1, 1,
0.9628186, -0.01965141, 1.947703, 1, 0, 0, 1, 1,
0.9667273, -1.100636, 3.516295, 1, 0, 0, 1, 1,
0.9668313, 0.2611371, 1.966282, 1, 0, 0, 1, 1,
0.9693377, 0.4265172, 2.157375, 1, 0, 0, 1, 1,
0.9727238, 0.1835696, 2.950606, 1, 0, 0, 1, 1,
0.9739512, -0.4295624, 1.645356, 0, 0, 0, 1, 1,
0.9761908, 0.9893442, 0.5994971, 0, 0, 0, 1, 1,
0.9777634, 0.6993382, 1.83693, 0, 0, 0, 1, 1,
0.9824184, 0.9180508, -0.4484835, 0, 0, 0, 1, 1,
0.9842841, 0.2463958, 1.341432, 0, 0, 0, 1, 1,
0.9864783, 1.194117, 1.140842, 0, 0, 0, 1, 1,
0.9865144, -0.7148631, 3.239491, 0, 0, 0, 1, 1,
0.994007, 0.488443, 2.886023, 1, 1, 1, 1, 1,
0.9944149, -2.41743, 2.590711, 1, 1, 1, 1, 1,
1.000709, 1.107949, 1.338828, 1, 1, 1, 1, 1,
1.02052, 1.111652, 2.322248, 1, 1, 1, 1, 1,
1.024453, -0.784017, 2.473703, 1, 1, 1, 1, 1,
1.026492, 0.06585155, 1.820964, 1, 1, 1, 1, 1,
1.038579, 1.480344, 0.4228381, 1, 1, 1, 1, 1,
1.047952, 0.5326399, 1.000202, 1, 1, 1, 1, 1,
1.052737, -0.8407398, 1.937145, 1, 1, 1, 1, 1,
1.065342, 0.3621492, 2.071908, 1, 1, 1, 1, 1,
1.069503, 2.0663, 0.6323131, 1, 1, 1, 1, 1,
1.071066, -0.2794337, 1.320174, 1, 1, 1, 1, 1,
1.080866, -0.6169374, 4.885712, 1, 1, 1, 1, 1,
1.08726, 1.78416, -0.3177769, 1, 1, 1, 1, 1,
1.089052, 1.21816, 0.4168245, 1, 1, 1, 1, 1,
1.090671, -1.124675, 1.420306, 0, 0, 1, 1, 1,
1.091369, -0.4615553, 3.567648, 1, 0, 0, 1, 1,
1.095277, -2.380307, 3.928681, 1, 0, 0, 1, 1,
1.101151, -0.1444466, 2.037665, 1, 0, 0, 1, 1,
1.105515, 0.04868624, 4.159248, 1, 0, 0, 1, 1,
1.110888, 0.03376656, 1.934386, 1, 0, 0, 1, 1,
1.123355, -0.1442196, 2.415781, 0, 0, 0, 1, 1,
1.138245, -0.04918703, 0.8663121, 0, 0, 0, 1, 1,
1.143862, 1.104279, 0.4683435, 0, 0, 0, 1, 1,
1.147167, -0.9202186, 3.292268, 0, 0, 0, 1, 1,
1.147465, -0.362095, 2.557656, 0, 0, 0, 1, 1,
1.151359, 2.431202, 0.8068608, 0, 0, 0, 1, 1,
1.158031, -0.3496241, 1.797654, 0, 0, 0, 1, 1,
1.161082, -0.4424876, 1.869332, 1, 1, 1, 1, 1,
1.162584, -0.9227588, 3.009474, 1, 1, 1, 1, 1,
1.167951, 0.6074203, 0.863079, 1, 1, 1, 1, 1,
1.1691, -0.9316344, 1.698034, 1, 1, 1, 1, 1,
1.169634, 0.9875254, 1.57965, 1, 1, 1, 1, 1,
1.173314, -1.952222, 1.604664, 1, 1, 1, 1, 1,
1.174935, -0.1080938, 1.791681, 1, 1, 1, 1, 1,
1.181852, -1.408194, 3.298359, 1, 1, 1, 1, 1,
1.182561, -0.3454851, 1.979252, 1, 1, 1, 1, 1,
1.182976, 0.1764119, 0.5187179, 1, 1, 1, 1, 1,
1.1981, 0.0757713, -0.8046604, 1, 1, 1, 1, 1,
1.200039, -0.06113662, 0.6266094, 1, 1, 1, 1, 1,
1.215258, -0.7018172, 1.558646, 1, 1, 1, 1, 1,
1.220278, 1.226362, -1.202781, 1, 1, 1, 1, 1,
1.222181, -0.02641254, 2.224002, 1, 1, 1, 1, 1,
1.231305, 1.424237, 1.894662, 0, 0, 1, 1, 1,
1.234259, 0.4963212, 0.6445916, 1, 0, 0, 1, 1,
1.247321, 0.178923, 0.2610741, 1, 0, 0, 1, 1,
1.248489, -1.315727, 2.554042, 1, 0, 0, 1, 1,
1.251344, -1.887776, 3.032861, 1, 0, 0, 1, 1,
1.25149, -0.2407894, 2.50112, 1, 0, 0, 1, 1,
1.288558, -1.867039, 3.154438, 0, 0, 0, 1, 1,
1.292914, 1.237607, 1.957271, 0, 0, 0, 1, 1,
1.295927, 0.2652806, 2.675133, 0, 0, 0, 1, 1,
1.310565, 0.4747476, 0.5924851, 0, 0, 0, 1, 1,
1.317864, 1.039496, 0.7224274, 0, 0, 0, 1, 1,
1.320506, 0.4412707, 0.7270673, 0, 0, 0, 1, 1,
1.320908, -0.1384112, 2.268642, 0, 0, 0, 1, 1,
1.324391, 0.6052782, 1.169666, 1, 1, 1, 1, 1,
1.326412, -0.3659731, 2.345834, 1, 1, 1, 1, 1,
1.332412, -1.010106, 2.106443, 1, 1, 1, 1, 1,
1.335832, 0.08628394, 1.996645, 1, 1, 1, 1, 1,
1.340074, 0.07675695, 1.177976, 1, 1, 1, 1, 1,
1.346701, -1.955739, 1.363775, 1, 1, 1, 1, 1,
1.350418, 0.4206521, 1.028099, 1, 1, 1, 1, 1,
1.353416, 0.3996441, 2.616642, 1, 1, 1, 1, 1,
1.364189, 0.1719199, 1.453345, 1, 1, 1, 1, 1,
1.372401, 0.3337725, 2.308115, 1, 1, 1, 1, 1,
1.374727, -0.4639758, 1.039392, 1, 1, 1, 1, 1,
1.379251, 0.9006129, 1.252348, 1, 1, 1, 1, 1,
1.386983, -0.936296, 0.867227, 1, 1, 1, 1, 1,
1.389434, -0.01409382, 1.173145, 1, 1, 1, 1, 1,
1.3932, 0.5253338, 1.632278, 1, 1, 1, 1, 1,
1.403707, -0.2384823, 1.281963, 0, 0, 1, 1, 1,
1.406094, -1.808067, 4.414362, 1, 0, 0, 1, 1,
1.410278, 0.2215822, 2.607768, 1, 0, 0, 1, 1,
1.412689, -1.910568, 1.72952, 1, 0, 0, 1, 1,
1.430114, -0.7251818, 2.441046, 1, 0, 0, 1, 1,
1.433299, -2.173163, 2.413837, 1, 0, 0, 1, 1,
1.433375, -1.034931, 0.8324937, 0, 0, 0, 1, 1,
1.45187, -0.6313108, 2.315295, 0, 0, 0, 1, 1,
1.455028, 0.5312809, 1.154255, 0, 0, 0, 1, 1,
1.455492, -1.623577, 2.784491, 0, 0, 0, 1, 1,
1.461969, 1.194124, 1.369013, 0, 0, 0, 1, 1,
1.466066, 1.817533, 0.8475653, 0, 0, 0, 1, 1,
1.48493, 0.9403561, 1.703413, 0, 0, 0, 1, 1,
1.486059, -0.4520587, 1.588255, 1, 1, 1, 1, 1,
1.486605, -0.7271121, 1.825603, 1, 1, 1, 1, 1,
1.508026, 1.154618, 3.257883, 1, 1, 1, 1, 1,
1.511035, -1.421978, 1.376445, 1, 1, 1, 1, 1,
1.512508, -1.342993, 2.435365, 1, 1, 1, 1, 1,
1.513441, -1.784446, 1.425199, 1, 1, 1, 1, 1,
1.518841, 1.275351, -0.263339, 1, 1, 1, 1, 1,
1.524125, 0.3348412, 2.375226, 1, 1, 1, 1, 1,
1.538695, 2.58429, 1.118459, 1, 1, 1, 1, 1,
1.549053, -0.05342609, 1.913099, 1, 1, 1, 1, 1,
1.555197, -1.543595, 2.471372, 1, 1, 1, 1, 1,
1.558282, -0.4093631, 2.08125, 1, 1, 1, 1, 1,
1.584742, -1.618428, 2.002161, 1, 1, 1, 1, 1,
1.628098, -0.7945996, 1.031982, 1, 1, 1, 1, 1,
1.63436, 0.422537, 1.84203, 1, 1, 1, 1, 1,
1.637521, -0.01509124, 0.7995936, 0, 0, 1, 1, 1,
1.650233, 1.006593, 0.1789772, 1, 0, 0, 1, 1,
1.650714, -0.1385069, 1.290122, 1, 0, 0, 1, 1,
1.679021, -0.2795128, 2.350707, 1, 0, 0, 1, 1,
1.697783, -0.8176022, 3.07853, 1, 0, 0, 1, 1,
1.709784, 1.587394, 2.055051, 1, 0, 0, 1, 1,
1.714357, -0.1588969, 1.692443, 0, 0, 0, 1, 1,
1.71731, -0.4185893, 1.159639, 0, 0, 0, 1, 1,
1.730493, -0.994092, 3.504898, 0, 0, 0, 1, 1,
1.756017, 0.7929822, 1.241184, 0, 0, 0, 1, 1,
1.756316, 0.4830734, 0.9595964, 0, 0, 0, 1, 1,
1.762166, 0.3643434, -0.9032066, 0, 0, 0, 1, 1,
1.762817, 0.3962459, 2.912735, 0, 0, 0, 1, 1,
1.763056, 0.4856727, 0.0707825, 1, 1, 1, 1, 1,
1.763907, -0.04304813, 2.112763, 1, 1, 1, 1, 1,
1.769691, -0.2001867, -0.192191, 1, 1, 1, 1, 1,
1.787474, -0.6375279, 1.320855, 1, 1, 1, 1, 1,
1.789865, -0.1335513, 1.450757, 1, 1, 1, 1, 1,
1.801172, -0.2021867, 1.118301, 1, 1, 1, 1, 1,
1.828279, -0.7966059, 1.483867, 1, 1, 1, 1, 1,
1.83002, -0.8067122, 1.824389, 1, 1, 1, 1, 1,
1.849869, 0.09042983, 1.391451, 1, 1, 1, 1, 1,
1.852326, 0.556577, 2.267124, 1, 1, 1, 1, 1,
1.877449, -1.091578, 2.817559, 1, 1, 1, 1, 1,
1.888401, -1.065956, 1.554557, 1, 1, 1, 1, 1,
1.897957, 0.8852118, 0.5287841, 1, 1, 1, 1, 1,
1.932721, 0.5079594, 2.862931, 1, 1, 1, 1, 1,
1.96533, -1.18156, 2.178956, 1, 1, 1, 1, 1,
1.978264, 1.468548, 1.530713, 0, 0, 1, 1, 1,
2.004835, 0.4259947, 1.628302, 1, 0, 0, 1, 1,
2.008566, -0.450312, 0.05372052, 1, 0, 0, 1, 1,
2.012874, -0.3045365, 1.085273, 1, 0, 0, 1, 1,
2.076475, 0.958959, -0.06617314, 1, 0, 0, 1, 1,
2.082743, 0.8621404, 1.128319, 1, 0, 0, 1, 1,
2.107403, -1.178431, 3.5649, 0, 0, 0, 1, 1,
2.13218, 0.266133, 1.990629, 0, 0, 0, 1, 1,
2.186644, -0.3444841, 1.870712, 0, 0, 0, 1, 1,
2.255732, 0.5148289, 0.5637478, 0, 0, 0, 1, 1,
2.287768, 0.4443007, -1.496361, 0, 0, 0, 1, 1,
2.378307, -0.6994516, 4.069337, 0, 0, 0, 1, 1,
2.409869, 0.1849653, 3.211307, 0, 0, 0, 1, 1,
2.471812, -3.263093, 1.443382, 1, 1, 1, 1, 1,
2.547579, 0.6239021, 1.392862, 1, 1, 1, 1, 1,
2.590188, -1.104772, 1.303503, 1, 1, 1, 1, 1,
2.71347, -0.1839514, 1.538021, 1, 1, 1, 1, 1,
2.768455, -0.1333362, 2.323167, 1, 1, 1, 1, 1,
3.045035, 1.285796, 1.824139, 1, 1, 1, 1, 1,
3.191524, -0.7280128, 1.135921, 1, 1, 1, 1, 1
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
var radius = 9.327735;
var distance = 32.76328;
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
mvMatrix.translate( 0.002074718, 0.2570357, -0.4915698 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.76328);
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
