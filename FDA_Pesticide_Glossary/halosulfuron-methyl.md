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
-2.988941, 0.5351056, -1.986334, 1, 0, 0, 1,
-2.935469, -0.1688605, -0.8742597, 1, 0.007843138, 0, 1,
-2.726259, -0.2398686, -2.409339, 1, 0.01176471, 0, 1,
-2.561405, -0.6136248, -2.166752, 1, 0.01960784, 0, 1,
-2.445033, -0.2480446, -2.335525, 1, 0.02352941, 0, 1,
-2.400182, 0.07849064, -2.00579, 1, 0.03137255, 0, 1,
-2.381773, -0.6226956, -1.194353, 1, 0.03529412, 0, 1,
-2.380312, 0.1240492, -2.527914, 1, 0.04313726, 0, 1,
-2.279586, 0.03868589, -2.300475, 1, 0.04705882, 0, 1,
-2.109627, 2.747901, 0.5522454, 1, 0.05490196, 0, 1,
-2.104073, 2.016791, -0.1934567, 1, 0.05882353, 0, 1,
-2.058484, -0.7149593, -4.062675, 1, 0.06666667, 0, 1,
-2.03008, 0.9291531, 0.1626447, 1, 0.07058824, 0, 1,
-2.003782, -0.001336818, -1.058493, 1, 0.07843138, 0, 1,
-2.000988, -0.2149705, -3.432695, 1, 0.08235294, 0, 1,
-1.972663, -1.511217, -0.6121346, 1, 0.09019608, 0, 1,
-1.960746, -2.088226, -1.281597, 1, 0.09411765, 0, 1,
-1.949301, -0.260181, -0.5996932, 1, 0.1019608, 0, 1,
-1.937722, -0.1370865, -0.6199499, 1, 0.1098039, 0, 1,
-1.93168, -0.03667919, -0.7372376, 1, 0.1137255, 0, 1,
-1.931495, -0.1429882, -2.588022, 1, 0.1215686, 0, 1,
-1.913104, 0.4888745, -2.584229, 1, 0.1254902, 0, 1,
-1.904444, -1.207538, -1.542944, 1, 0.1333333, 0, 1,
-1.901196, 0.02821135, -2.892375, 1, 0.1372549, 0, 1,
-1.881656, -0.6727949, -0.5953509, 1, 0.145098, 0, 1,
-1.880351, 0.9046918, -0.01744369, 1, 0.1490196, 0, 1,
-1.852026, 1.147952, -0.9632737, 1, 0.1568628, 0, 1,
-1.850476, 0.9207374, -0.9714136, 1, 0.1607843, 0, 1,
-1.841607, -1.066487, 0.7427247, 1, 0.1686275, 0, 1,
-1.792581, 0.7201321, 0.3583642, 1, 0.172549, 0, 1,
-1.774897, 1.720297, -0.689613, 1, 0.1803922, 0, 1,
-1.774451, 1.954368, -0.04043041, 1, 0.1843137, 0, 1,
-1.743019, 0.6155369, -0.4817856, 1, 0.1921569, 0, 1,
-1.739794, -0.9324964, -2.669727, 1, 0.1960784, 0, 1,
-1.735109, -1.220364, -1.638664, 1, 0.2039216, 0, 1,
-1.728371, 1.034574, -0.4144538, 1, 0.2117647, 0, 1,
-1.709244, -0.1783086, -3.75601, 1, 0.2156863, 0, 1,
-1.684224, 0.3251829, -0.8129442, 1, 0.2235294, 0, 1,
-1.680759, 1.567486, -1.185462, 1, 0.227451, 0, 1,
-1.666662, 0.7161261, 0.2137534, 1, 0.2352941, 0, 1,
-1.631708, 0.4590759, -0.003565275, 1, 0.2392157, 0, 1,
-1.631524, 2.622615, -1.842494, 1, 0.2470588, 0, 1,
-1.628256, -0.1200019, -3.12908, 1, 0.2509804, 0, 1,
-1.610407, -0.8204346, -3.017198, 1, 0.2588235, 0, 1,
-1.606324, -0.4849729, -1.164681, 1, 0.2627451, 0, 1,
-1.602014, 0.4696483, 0.2347163, 1, 0.2705882, 0, 1,
-1.597803, -0.8606452, -2.57067, 1, 0.2745098, 0, 1,
-1.596073, -1.848884, -1.424894, 1, 0.282353, 0, 1,
-1.559652, -0.7945852, -1.217502, 1, 0.2862745, 0, 1,
-1.541147, 0.4206195, -1.480655, 1, 0.2941177, 0, 1,
-1.539015, 0.02033266, -2.395731, 1, 0.3019608, 0, 1,
-1.534127, -0.6285996, -2.005331, 1, 0.3058824, 0, 1,
-1.529651, -1.399339, -2.09286, 1, 0.3137255, 0, 1,
-1.52268, 0.8942922, 0.004324371, 1, 0.3176471, 0, 1,
-1.521489, -1.650279, -1.12709, 1, 0.3254902, 0, 1,
-1.514898, 0.1289042, -2.827443, 1, 0.3294118, 0, 1,
-1.510961, 0.09616383, -2.037067, 1, 0.3372549, 0, 1,
-1.507035, 1.407632, 0.4194186, 1, 0.3411765, 0, 1,
-1.502323, -0.4178084, -2.146274, 1, 0.3490196, 0, 1,
-1.499473, 0.5678124, -1.134902, 1, 0.3529412, 0, 1,
-1.489138, 0.4245905, -1.468544, 1, 0.3607843, 0, 1,
-1.4883, 2.335878, -0.07319815, 1, 0.3647059, 0, 1,
-1.488224, -0.7186363, -1.78055, 1, 0.372549, 0, 1,
-1.47975, 0.07842387, -0.6399733, 1, 0.3764706, 0, 1,
-1.465179, 0.8266457, -2.289689, 1, 0.3843137, 0, 1,
-1.465004, 0.6581531, -1.97936, 1, 0.3882353, 0, 1,
-1.461185, -1.311159, -2.956418, 1, 0.3960784, 0, 1,
-1.454719, -0.5759876, -2.430465, 1, 0.4039216, 0, 1,
-1.44833, 1.264879, 0.3596646, 1, 0.4078431, 0, 1,
-1.441983, 1.87707, -1.085531, 1, 0.4156863, 0, 1,
-1.429549, 0.3204262, -2.5485, 1, 0.4196078, 0, 1,
-1.418142, -0.4896516, -3.373192, 1, 0.427451, 0, 1,
-1.409577, -0.4534412, -2.424275, 1, 0.4313726, 0, 1,
-1.396285, -3.220251, -1.648304, 1, 0.4392157, 0, 1,
-1.395215, 1.96767, -1.215471, 1, 0.4431373, 0, 1,
-1.389951, -0.7466006, -1.067666, 1, 0.4509804, 0, 1,
-1.389427, 0.4509141, -0.9634006, 1, 0.454902, 0, 1,
-1.381426, -0.3734507, -1.056299, 1, 0.4627451, 0, 1,
-1.381302, -0.326388, -1.639048, 1, 0.4666667, 0, 1,
-1.378791, -0.1045645, -1.645278, 1, 0.4745098, 0, 1,
-1.364552, -2.108416, -0.622036, 1, 0.4784314, 0, 1,
-1.364164, 0.09959608, -1.153379, 1, 0.4862745, 0, 1,
-1.363719, -0.3980681, -1.021318, 1, 0.4901961, 0, 1,
-1.354727, 0.4439411, -2.070974, 1, 0.4980392, 0, 1,
-1.35285, 0.8980047, -3.039078, 1, 0.5058824, 0, 1,
-1.350578, -0.8169485, -2.483476, 1, 0.509804, 0, 1,
-1.343404, -1.567691, -3.956445, 1, 0.5176471, 0, 1,
-1.337799, -0.3431101, -3.524518, 1, 0.5215687, 0, 1,
-1.335763, -0.4265665, -2.194739, 1, 0.5294118, 0, 1,
-1.325395, 0.311019, -0.5618989, 1, 0.5333334, 0, 1,
-1.323205, 0.1092088, -0.9966184, 1, 0.5411765, 0, 1,
-1.313867, 0.7652293, -0.8789737, 1, 0.5450981, 0, 1,
-1.313158, -0.103455, -2.770096, 1, 0.5529412, 0, 1,
-1.305848, 0.3891236, -1.11105, 1, 0.5568628, 0, 1,
-1.294791, 0.3911098, -1.083668, 1, 0.5647059, 0, 1,
-1.291099, 0.2349004, 0.2355699, 1, 0.5686275, 0, 1,
-1.287752, 0.3631354, -3.274772, 1, 0.5764706, 0, 1,
-1.281015, 0.8640505, -1.599221, 1, 0.5803922, 0, 1,
-1.276524, -0.8907802, -2.531883, 1, 0.5882353, 0, 1,
-1.275764, 0.3649248, -0.8194137, 1, 0.5921569, 0, 1,
-1.274256, 0.875968, -3.091282, 1, 0.6, 0, 1,
-1.266554, 1.51827, -1.180809, 1, 0.6078432, 0, 1,
-1.263403, 1.388038, -0.08373239, 1, 0.6117647, 0, 1,
-1.259347, -0.8123305, -1.080909, 1, 0.6196079, 0, 1,
-1.257602, -0.08384583, -3.073889, 1, 0.6235294, 0, 1,
-1.246771, -1.059769, -1.618207, 1, 0.6313726, 0, 1,
-1.237123, 0.1417539, -1.304865, 1, 0.6352941, 0, 1,
-1.232089, -0.3562758, -2.871484, 1, 0.6431373, 0, 1,
-1.230662, -0.6343796, -1.133767, 1, 0.6470588, 0, 1,
-1.227547, -1.831239, -2.102237, 1, 0.654902, 0, 1,
-1.226524, 1.466114, -2.362392, 1, 0.6588235, 0, 1,
-1.21945, -0.0833638, -3.567683, 1, 0.6666667, 0, 1,
-1.219265, -1.162195, -2.969604, 1, 0.6705883, 0, 1,
-1.216035, -0.02088266, -1.020282, 1, 0.6784314, 0, 1,
-1.214719, -0.6508417, -1.893689, 1, 0.682353, 0, 1,
-1.208013, 0.985542, -0.3484773, 1, 0.6901961, 0, 1,
-1.197108, -0.6134122, -0.7178492, 1, 0.6941177, 0, 1,
-1.191873, -0.1589355, -0.4866697, 1, 0.7019608, 0, 1,
-1.18656, -0.02675676, -0.8828591, 1, 0.7098039, 0, 1,
-1.185298, 2.112676, -0.6467244, 1, 0.7137255, 0, 1,
-1.18501, -0.564805, -1.757299, 1, 0.7215686, 0, 1,
-1.183599, -0.1905384, -0.5473383, 1, 0.7254902, 0, 1,
-1.171868, 0.385159, -2.369347, 1, 0.7333333, 0, 1,
-1.17123, -1.621387, -1.293469, 1, 0.7372549, 0, 1,
-1.164138, 0.6236649, -1.028576, 1, 0.7450981, 0, 1,
-1.14992, 0.3129091, -2.081287, 1, 0.7490196, 0, 1,
-1.145643, -1.117796, -3.701409, 1, 0.7568628, 0, 1,
-1.142201, -1.351043, -2.802159, 1, 0.7607843, 0, 1,
-1.137248, 0.5259624, -0.3591129, 1, 0.7686275, 0, 1,
-1.129859, 1.529424, 0.7984013, 1, 0.772549, 0, 1,
-1.126137, 0.1798587, -1.678847, 1, 0.7803922, 0, 1,
-1.124406, 0.1548692, -0.2828639, 1, 0.7843137, 0, 1,
-1.121913, -1.245412, -3.290269, 1, 0.7921569, 0, 1,
-1.117953, 0.3985279, -1.563169, 1, 0.7960784, 0, 1,
-1.1167, -1.025865, -3.090456, 1, 0.8039216, 0, 1,
-1.115116, -0.7107013, -2.430905, 1, 0.8117647, 0, 1,
-1.114488, -0.3511545, 0.02587837, 1, 0.8156863, 0, 1,
-1.111318, 0.7090874, -2.129002, 1, 0.8235294, 0, 1,
-1.101474, 0.6292928, -0.6619998, 1, 0.827451, 0, 1,
-1.100805, -0.1605045, -2.418685, 1, 0.8352941, 0, 1,
-1.100366, 0.567709, -1.85146, 1, 0.8392157, 0, 1,
-1.097578, -0.685327, -3.217659, 1, 0.8470588, 0, 1,
-1.095236, -0.7953085, -2.432569, 1, 0.8509804, 0, 1,
-1.094898, 0.9517252, -1.670386, 1, 0.8588235, 0, 1,
-1.090253, -0.5410149, -1.049003, 1, 0.8627451, 0, 1,
-1.090207, 0.06773336, -2.364138, 1, 0.8705882, 0, 1,
-1.086442, 0.8156722, -0.6248499, 1, 0.8745098, 0, 1,
-1.080329, 1.053634, -1.922898, 1, 0.8823529, 0, 1,
-1.074056, -0.1065525, -1.654915, 1, 0.8862745, 0, 1,
-1.059848, -1.605821, -3.810851, 1, 0.8941177, 0, 1,
-1.050957, -0.1142921, -1.157137, 1, 0.8980392, 0, 1,
-1.048876, 0.9153126, -1.355448, 1, 0.9058824, 0, 1,
-1.046541, 0.04635193, -3.228448, 1, 0.9137255, 0, 1,
-1.046434, -0.1151114, -3.749606, 1, 0.9176471, 0, 1,
-1.043933, 1.757568, -1.712406, 1, 0.9254902, 0, 1,
-1.031873, 0.3196132, -2.625677, 1, 0.9294118, 0, 1,
-1.025988, 0.5934824, -0.960286, 1, 0.9372549, 0, 1,
-1.024686, 0.315958, -1.871393, 1, 0.9411765, 0, 1,
-1.021707, -0.3808258, -1.457096, 1, 0.9490196, 0, 1,
-1.018725, 1.570372, -1.879206, 1, 0.9529412, 0, 1,
-1.013064, 2.694667, 1.132382, 1, 0.9607843, 0, 1,
-1.008334, -1.191265, -1.733741, 1, 0.9647059, 0, 1,
-1.006425, -0.6328434, -1.026863, 1, 0.972549, 0, 1,
-0.9951162, -0.7761356, -2.191685, 1, 0.9764706, 0, 1,
-0.9886913, 0.7610468, -1.50012, 1, 0.9843137, 0, 1,
-0.9870755, 1.384492, -0.03918798, 1, 0.9882353, 0, 1,
-0.9851133, 0.7200507, -1.641465, 1, 0.9960784, 0, 1,
-0.9732442, 0.1074262, -2.089853, 0.9960784, 1, 0, 1,
-0.9701436, 0.5003468, -0.3681374, 0.9921569, 1, 0, 1,
-0.9657583, 0.5997053, -1.417719, 0.9843137, 1, 0, 1,
-0.9539716, -2.473857, -3.059421, 0.9803922, 1, 0, 1,
-0.9538968, 1.182019, 1.266277, 0.972549, 1, 0, 1,
-0.9476229, -0.05395317, -2.73171, 0.9686275, 1, 0, 1,
-0.9459549, -0.2310496, -2.45981, 0.9607843, 1, 0, 1,
-0.9444283, -1.707269, -3.156663, 0.9568627, 1, 0, 1,
-0.9435461, -0.213055, -0.3052548, 0.9490196, 1, 0, 1,
-0.9402546, -0.2237034, -1.287541, 0.945098, 1, 0, 1,
-0.9295627, -0.09450692, -2.893177, 0.9372549, 1, 0, 1,
-0.9269709, -0.5989805, -3.136637, 0.9333333, 1, 0, 1,
-0.9244878, -1.967211, -1.900825, 0.9254902, 1, 0, 1,
-0.9240642, 0.3976537, 0.2075919, 0.9215686, 1, 0, 1,
-0.9236001, 0.3591293, -1.587903, 0.9137255, 1, 0, 1,
-0.9215369, 1.135745, -1.389794, 0.9098039, 1, 0, 1,
-0.9019432, 0.02657429, -1.683759, 0.9019608, 1, 0, 1,
-0.8997096, 1.07736, -1.191648, 0.8941177, 1, 0, 1,
-0.8950863, -0.5473409, -0.373996, 0.8901961, 1, 0, 1,
-0.8914587, 1.359062, 0.3890683, 0.8823529, 1, 0, 1,
-0.8872311, -1.452288, -3.243804, 0.8784314, 1, 0, 1,
-0.8823575, 0.6854412, 0.9131133, 0.8705882, 1, 0, 1,
-0.8767921, -1.101324, -3.14224, 0.8666667, 1, 0, 1,
-0.8757205, 0.1807499, 1.467367, 0.8588235, 1, 0, 1,
-0.8637899, -0.7406168, -1.533124, 0.854902, 1, 0, 1,
-0.8562302, -1.467455, -0.1326187, 0.8470588, 1, 0, 1,
-0.8533953, -0.2206001, -0.1230479, 0.8431373, 1, 0, 1,
-0.8528213, -0.1675499, 0.5797682, 0.8352941, 1, 0, 1,
-0.8508527, -0.8185125, -1.865842, 0.8313726, 1, 0, 1,
-0.8503497, -1.111623, -2.026563, 0.8235294, 1, 0, 1,
-0.8449361, -1.004515, -2.395761, 0.8196079, 1, 0, 1,
-0.8371823, 0.8868573, -1.602617, 0.8117647, 1, 0, 1,
-0.8363506, 1.842672, -0.9558762, 0.8078431, 1, 0, 1,
-0.8313767, -2.388195, -3.401734, 0.8, 1, 0, 1,
-0.8268775, -1.594493, -1.962622, 0.7921569, 1, 0, 1,
-0.8235979, 1.104659, -3.483293, 0.7882353, 1, 0, 1,
-0.8186154, -0.3433875, -2.697004, 0.7803922, 1, 0, 1,
-0.7996462, 0.2084476, -1.861471, 0.7764706, 1, 0, 1,
-0.7964381, -1.275628, -3.370711, 0.7686275, 1, 0, 1,
-0.7956979, -0.1243704, -0.6421412, 0.7647059, 1, 0, 1,
-0.7955433, 0.3113141, -1.779836, 0.7568628, 1, 0, 1,
-0.7937555, -0.575709, -3.205255, 0.7529412, 1, 0, 1,
-0.7859342, -0.6631631, -0.9658518, 0.7450981, 1, 0, 1,
-0.7840469, -0.02565681, -0.304832, 0.7411765, 1, 0, 1,
-0.7838255, -2.379164, -3.909002, 0.7333333, 1, 0, 1,
-0.7834501, -1.630082, -2.849773, 0.7294118, 1, 0, 1,
-0.78177, -0.842164, -3.0325, 0.7215686, 1, 0, 1,
-0.7757414, 1.331295, -0.9023699, 0.7176471, 1, 0, 1,
-0.7733907, -0.9291783, -3.314218, 0.7098039, 1, 0, 1,
-0.769507, -0.9274373, -2.360368, 0.7058824, 1, 0, 1,
-0.7658679, -3.358096, -3.108962, 0.6980392, 1, 0, 1,
-0.7570439, -0.4461394, -3.565118, 0.6901961, 1, 0, 1,
-0.7549074, -0.576398, -3.271919, 0.6862745, 1, 0, 1,
-0.7520149, 0.02160897, -1.929429, 0.6784314, 1, 0, 1,
-0.7476422, -0.2743953, -1.383525, 0.6745098, 1, 0, 1,
-0.7440262, -0.5804752, -2.180145, 0.6666667, 1, 0, 1,
-0.7398321, -1.035448, -5.243866, 0.6627451, 1, 0, 1,
-0.7395893, -0.5837432, -2.743308, 0.654902, 1, 0, 1,
-0.7393697, 1.942634, -0.5024779, 0.6509804, 1, 0, 1,
-0.7386187, -0.35267, -2.089324, 0.6431373, 1, 0, 1,
-0.7330589, 0.6546043, 1.060418, 0.6392157, 1, 0, 1,
-0.7288861, -0.8183569, -3.829314, 0.6313726, 1, 0, 1,
-0.7201715, -0.6211081, -3.40904, 0.627451, 1, 0, 1,
-0.7181479, -1.91382, -5.107745, 0.6196079, 1, 0, 1,
-0.7169527, -1.206062, -3.624202, 0.6156863, 1, 0, 1,
-0.700956, 1.00393, -1.564235, 0.6078432, 1, 0, 1,
-0.6934021, 0.9399874, -1.115954, 0.6039216, 1, 0, 1,
-0.6924042, -0.08638602, -2.261954, 0.5960785, 1, 0, 1,
-0.6869515, -0.4118669, -2.025459, 0.5882353, 1, 0, 1,
-0.6826714, -1.412618, -1.924866, 0.5843138, 1, 0, 1,
-0.6820922, 0.358679, -3.402395, 0.5764706, 1, 0, 1,
-0.6807931, -0.8985817, -1.10113, 0.572549, 1, 0, 1,
-0.6775678, -0.2480849, -3.199456, 0.5647059, 1, 0, 1,
-0.6770479, -0.09699637, -2.435552, 0.5607843, 1, 0, 1,
-0.6764864, -0.07516222, -2.351728, 0.5529412, 1, 0, 1,
-0.6726046, -0.8994941, -1.35379, 0.5490196, 1, 0, 1,
-0.6693961, 0.7392205, -1.44583, 0.5411765, 1, 0, 1,
-0.6655031, -0.0856505, -0.7755013, 0.5372549, 1, 0, 1,
-0.6654281, 0.8863857, -0.8716041, 0.5294118, 1, 0, 1,
-0.6646577, -0.05572227, -1.973109, 0.5254902, 1, 0, 1,
-0.6565961, -0.8226718, -2.156507, 0.5176471, 1, 0, 1,
-0.6557927, 0.112877, -0.3436981, 0.5137255, 1, 0, 1,
-0.6487126, 1.278413, -0.1454644, 0.5058824, 1, 0, 1,
-0.6467277, 0.7096764, -1.588473, 0.5019608, 1, 0, 1,
-0.6444169, -0.1022612, -2.050638, 0.4941176, 1, 0, 1,
-0.6407377, 1.454509, -0.4348494, 0.4862745, 1, 0, 1,
-0.6407179, -0.6219794, -2.201825, 0.4823529, 1, 0, 1,
-0.6388831, 1.717116, -0.04520961, 0.4745098, 1, 0, 1,
-0.636273, -1.672052, -2.547983, 0.4705882, 1, 0, 1,
-0.6346593, -0.7040645, -3.377189, 0.4627451, 1, 0, 1,
-0.6293795, -2.339777, -4.493456, 0.4588235, 1, 0, 1,
-0.6258534, -0.3416461, -0.9323891, 0.4509804, 1, 0, 1,
-0.6257575, -0.4200515, -1.700078, 0.4470588, 1, 0, 1,
-0.6255589, 0.03416696, -2.066549, 0.4392157, 1, 0, 1,
-0.6247023, 0.2121524, -1.748995, 0.4352941, 1, 0, 1,
-0.6240308, 0.2331121, -2.207512, 0.427451, 1, 0, 1,
-0.6187764, -0.3370211, -2.933298, 0.4235294, 1, 0, 1,
-0.6186958, -1.615964, -2.606897, 0.4156863, 1, 0, 1,
-0.6128841, -0.9603043, -2.730719, 0.4117647, 1, 0, 1,
-0.6042488, -0.3515958, -2.648841, 0.4039216, 1, 0, 1,
-0.6031055, -0.2690063, -2.77245, 0.3960784, 1, 0, 1,
-0.5980279, 0.6086009, -0.611589, 0.3921569, 1, 0, 1,
-0.5948476, 0.2103957, -0.9697115, 0.3843137, 1, 0, 1,
-0.5777458, 0.7812171, -1.363047, 0.3803922, 1, 0, 1,
-0.5695624, -0.2577772, -1.960285, 0.372549, 1, 0, 1,
-0.5674034, 0.4639356, 0.3637217, 0.3686275, 1, 0, 1,
-0.5656403, 0.5766911, -1.857657, 0.3607843, 1, 0, 1,
-0.5648331, 0.695853, -1.525579, 0.3568628, 1, 0, 1,
-0.5646408, 0.7789009, -0.6801828, 0.3490196, 1, 0, 1,
-0.5605454, -1.161586, -2.426378, 0.345098, 1, 0, 1,
-0.5578209, -0.2918833, -2.294677, 0.3372549, 1, 0, 1,
-0.5568553, -0.7840517, -2.424871, 0.3333333, 1, 0, 1,
-0.5559467, 0.7664357, 0.2927104, 0.3254902, 1, 0, 1,
-0.5505936, -0.5358527, -1.182804, 0.3215686, 1, 0, 1,
-0.5447988, 0.2401933, 0.4279133, 0.3137255, 1, 0, 1,
-0.5446398, -0.08535114, -1.922183, 0.3098039, 1, 0, 1,
-0.5392665, -0.7896289, -4.069274, 0.3019608, 1, 0, 1,
-0.5387804, -1.115735, -4.066237, 0.2941177, 1, 0, 1,
-0.5346742, 1.050452, -0.1946823, 0.2901961, 1, 0, 1,
-0.5321797, -0.9378309, -2.208064, 0.282353, 1, 0, 1,
-0.5239183, 1.529704, -1.47314, 0.2784314, 1, 0, 1,
-0.522777, 0.4135361, -0.7698387, 0.2705882, 1, 0, 1,
-0.5206481, -0.4563064, -1.762993, 0.2666667, 1, 0, 1,
-0.520161, 0.4806154, 0.05047519, 0.2588235, 1, 0, 1,
-0.5174763, 0.3226726, -0.5931866, 0.254902, 1, 0, 1,
-0.5148612, 0.4103467, -1.914599, 0.2470588, 1, 0, 1,
-0.5088796, 0.6660957, -0.5947312, 0.2431373, 1, 0, 1,
-0.5056476, -0.6394058, -2.311204, 0.2352941, 1, 0, 1,
-0.5036396, -0.9164756, -2.408676, 0.2313726, 1, 0, 1,
-0.4987754, 1.702238, 0.3378299, 0.2235294, 1, 0, 1,
-0.4942592, -1.420018, -2.244126, 0.2196078, 1, 0, 1,
-0.4903071, 0.2670082, -0.9518874, 0.2117647, 1, 0, 1,
-0.487287, -0.839417, -3.008883, 0.2078431, 1, 0, 1,
-0.4815215, 0.6665195, 1.237836, 0.2, 1, 0, 1,
-0.473695, 1.411773, -0.2303257, 0.1921569, 1, 0, 1,
-0.4732091, -1.976215, -2.754433, 0.1882353, 1, 0, 1,
-0.4716146, 0.7292783, -1.035316, 0.1803922, 1, 0, 1,
-0.4671078, -1.991471, -2.499702, 0.1764706, 1, 0, 1,
-0.4617859, 0.04265686, -0.05630231, 0.1686275, 1, 0, 1,
-0.4547583, -0.2623565, -3.92193, 0.1647059, 1, 0, 1,
-0.4527328, 1.396061, -1.19541, 0.1568628, 1, 0, 1,
-0.448819, 0.006405947, -0.7423891, 0.1529412, 1, 0, 1,
-0.4473128, 0.1307014, 0.06319339, 0.145098, 1, 0, 1,
-0.4470459, 0.4403442, -0.7765471, 0.1411765, 1, 0, 1,
-0.4445755, 0.2030187, -0.7420918, 0.1333333, 1, 0, 1,
-0.4443304, 1.373209, -0.06628804, 0.1294118, 1, 0, 1,
-0.4404679, 1.016049, 0.01322753, 0.1215686, 1, 0, 1,
-0.4382533, -0.7128557, -4.166242, 0.1176471, 1, 0, 1,
-0.4372442, 0.238883, -2.064115, 0.1098039, 1, 0, 1,
-0.436738, -0.4140436, -1.795907, 0.1058824, 1, 0, 1,
-0.4318781, 0.234607, -1.921655, 0.09803922, 1, 0, 1,
-0.4300858, -0.0285672, -1.192661, 0.09019608, 1, 0, 1,
-0.4290111, -0.7232438, -2.769166, 0.08627451, 1, 0, 1,
-0.4271478, 1.779617, -0.2699201, 0.07843138, 1, 0, 1,
-0.4271192, -2.363379, -2.602857, 0.07450981, 1, 0, 1,
-0.4205289, 0.9391742, 0.626818, 0.06666667, 1, 0, 1,
-0.4192149, -0.1234285, -2.164571, 0.0627451, 1, 0, 1,
-0.4180702, -0.213206, -1.412909, 0.05490196, 1, 0, 1,
-0.4123401, 0.9426752, 0.1124761, 0.05098039, 1, 0, 1,
-0.4100428, -0.1536826, -2.214489, 0.04313726, 1, 0, 1,
-0.4078285, -0.3245617, -2.636958, 0.03921569, 1, 0, 1,
-0.406855, 0.8229184, -0.1815654, 0.03137255, 1, 0, 1,
-0.4065863, 1.723444, 0.8084408, 0.02745098, 1, 0, 1,
-0.4051172, -2.246407, -2.896243, 0.01960784, 1, 0, 1,
-0.4033003, 0.2959423, -0.1067601, 0.01568628, 1, 0, 1,
-0.4022555, 0.05232693, 0.1951859, 0.007843138, 1, 0, 1,
-0.3991186, -0.9157836, -2.497731, 0.003921569, 1, 0, 1,
-0.3970583, -1.266758, -3.24591, 0, 1, 0.003921569, 1,
-0.3946543, 1.197529, 0.7062252, 0, 1, 0.01176471, 1,
-0.3923159, 1.181138, 0.4902788, 0, 1, 0.01568628, 1,
-0.3913193, 0.6260933, -2.372339, 0, 1, 0.02352941, 1,
-0.3881938, 1.172755, -0.4027562, 0, 1, 0.02745098, 1,
-0.3856476, -1.349091, -3.399553, 0, 1, 0.03529412, 1,
-0.3797138, -1.081903, -3.301604, 0, 1, 0.03921569, 1,
-0.3787183, -3.534064, -2.027778, 0, 1, 0.04705882, 1,
-0.3775238, -0.3565645, -2.557245, 0, 1, 0.05098039, 1,
-0.3730569, -1.755927, -3.911933, 0, 1, 0.05882353, 1,
-0.362261, -1.541789, -1.258513, 0, 1, 0.0627451, 1,
-0.3621733, -1.375898, -3.618814, 0, 1, 0.07058824, 1,
-0.3518998, -0.528627, -3.149122, 0, 1, 0.07450981, 1,
-0.3505734, 0.03417586, -1.51981, 0, 1, 0.08235294, 1,
-0.3398346, 1.210228, -1.165099, 0, 1, 0.08627451, 1,
-0.3384797, -0.4455685, -2.172783, 0, 1, 0.09411765, 1,
-0.3383649, -0.04810793, -2.488677, 0, 1, 0.1019608, 1,
-0.3360153, 1.404662, -0.9331205, 0, 1, 0.1058824, 1,
-0.3342258, -1.521839, -2.449656, 0, 1, 0.1137255, 1,
-0.3334206, 0.1768669, -0.9031452, 0, 1, 0.1176471, 1,
-0.3318833, 0.7393373, -0.2462974, 0, 1, 0.1254902, 1,
-0.3309904, -0.5489603, -1.279871, 0, 1, 0.1294118, 1,
-0.3234599, 0.2341365, -2.058282, 0, 1, 0.1372549, 1,
-0.3202234, 0.7267335, -0.6959041, 0, 1, 0.1411765, 1,
-0.3191781, 0.9761987, -1.277599, 0, 1, 0.1490196, 1,
-0.3179278, -0.7566758, -2.924415, 0, 1, 0.1529412, 1,
-0.3173587, -1.591524, -2.762959, 0, 1, 0.1607843, 1,
-0.3155641, 0.3679382, -1.882154, 0, 1, 0.1647059, 1,
-0.3148976, -0.1424522, -1.762225, 0, 1, 0.172549, 1,
-0.3147373, 0.1681118, -2.858073, 0, 1, 0.1764706, 1,
-0.3142881, 0.7389253, 0.3136421, 0, 1, 0.1843137, 1,
-0.3139344, -0.4890678, -2.230573, 0, 1, 0.1882353, 1,
-0.3066257, -0.608942, -2.420262, 0, 1, 0.1960784, 1,
-0.3008484, 0.7277705, 3.165041, 0, 1, 0.2039216, 1,
-0.2975526, 0.9362398, -0.2142471, 0, 1, 0.2078431, 1,
-0.2966304, 1.738836, -2.253792, 0, 1, 0.2156863, 1,
-0.2954771, -0.8001487, -3.67955, 0, 1, 0.2196078, 1,
-0.2915461, 0.1996347, -2.48696, 0, 1, 0.227451, 1,
-0.2890528, 0.1969041, 0.325802, 0, 1, 0.2313726, 1,
-0.2761576, -0.4967639, -4.19012, 0, 1, 0.2392157, 1,
-0.2734162, 0.7587904, -0.9184391, 0, 1, 0.2431373, 1,
-0.2707045, -0.1035023, -2.704836, 0, 1, 0.2509804, 1,
-0.2679044, -1.046563, -2.93794, 0, 1, 0.254902, 1,
-0.2647738, 1.982078, 0.6881179, 0, 1, 0.2627451, 1,
-0.2579883, -1.072967, -1.931205, 0, 1, 0.2666667, 1,
-0.2483997, -0.3129568, -4.376976, 0, 1, 0.2745098, 1,
-0.2465817, 0.8986148, 0.228527, 0, 1, 0.2784314, 1,
-0.2457959, 1.776751, 1.085246, 0, 1, 0.2862745, 1,
-0.2457049, 0.9195419, 0.3300231, 0, 1, 0.2901961, 1,
-0.2443513, 2.447498, 1.431969, 0, 1, 0.2980392, 1,
-0.2389091, 2.258655, -0.05686212, 0, 1, 0.3058824, 1,
-0.2378955, 1.852223, -1.481888, 0, 1, 0.3098039, 1,
-0.2326042, -0.3057267, -2.163553, 0, 1, 0.3176471, 1,
-0.2282273, 0.6495678, -1.100606, 0, 1, 0.3215686, 1,
-0.2277508, -0.6096253, -5.212933, 0, 1, 0.3294118, 1,
-0.2257934, -0.4665672, -2.509956, 0, 1, 0.3333333, 1,
-0.2242765, -0.3589641, -3.064291, 0, 1, 0.3411765, 1,
-0.2218972, 0.8718941, -0.08619843, 0, 1, 0.345098, 1,
-0.2196518, -1.284346, -5.027699, 0, 1, 0.3529412, 1,
-0.2180281, 0.02849664, 0.07788704, 0, 1, 0.3568628, 1,
-0.2176623, -0.1404405, -2.9831, 0, 1, 0.3647059, 1,
-0.2145403, 0.06418772, -0.05891659, 0, 1, 0.3686275, 1,
-0.2143127, -0.3077908, -2.528519, 0, 1, 0.3764706, 1,
-0.2125596, -0.9307624, -4.025081, 0, 1, 0.3803922, 1,
-0.208604, 1.82034, -1.028378, 0, 1, 0.3882353, 1,
-0.2075061, -1.347151, -2.634002, 0, 1, 0.3921569, 1,
-0.2034065, -0.8061464, -4.409965, 0, 1, 0.4, 1,
-0.2029275, 1.031686, -0.6143042, 0, 1, 0.4078431, 1,
-0.1972676, -0.6832997, -3.26687, 0, 1, 0.4117647, 1,
-0.1930859, 0.2365476, -0.03779767, 0, 1, 0.4196078, 1,
-0.1916468, -0.3590734, -1.750071, 0, 1, 0.4235294, 1,
-0.1889548, -0.4800298, -3.621927, 0, 1, 0.4313726, 1,
-0.1881072, -0.1472788, -2.036908, 0, 1, 0.4352941, 1,
-0.1804491, 0.5982607, 0.101081, 0, 1, 0.4431373, 1,
-0.1802637, -0.6233979, -1.417449, 0, 1, 0.4470588, 1,
-0.172922, -0.3065366, -0.70419, 0, 1, 0.454902, 1,
-0.1722015, -1.13903, -4.313246, 0, 1, 0.4588235, 1,
-0.169136, -0.4370882, -2.971876, 0, 1, 0.4666667, 1,
-0.1666958, -0.9526871, -2.76978, 0, 1, 0.4705882, 1,
-0.1629989, -2.023025, -1.184669, 0, 1, 0.4784314, 1,
-0.1617072, -0.4065684, -0.5852869, 0, 1, 0.4823529, 1,
-0.1598845, 1.011984, 0.3432127, 0, 1, 0.4901961, 1,
-0.1591721, -0.4337471, -4.114887, 0, 1, 0.4941176, 1,
-0.1576874, 0.2209751, -0.2815834, 0, 1, 0.5019608, 1,
-0.1515735, -1.575221, -2.491088, 0, 1, 0.509804, 1,
-0.1499673, -0.4092947, -4.729305, 0, 1, 0.5137255, 1,
-0.1493048, -0.639277, -1.742876, 0, 1, 0.5215687, 1,
-0.1490449, 0.9605121, -0.9429676, 0, 1, 0.5254902, 1,
-0.1468234, -0.4835202, -4.471676, 0, 1, 0.5333334, 1,
-0.1389273, 0.2192322, -0.3923982, 0, 1, 0.5372549, 1,
-0.1347488, -1.452812, -3.531961, 0, 1, 0.5450981, 1,
-0.1289219, -0.3684776, -4.476563, 0, 1, 0.5490196, 1,
-0.1287053, -0.08983541, -1.646519, 0, 1, 0.5568628, 1,
-0.128532, -0.3450601, -3.595999, 0, 1, 0.5607843, 1,
-0.1250883, 0.3000524, 0.8975985, 0, 1, 0.5686275, 1,
-0.1239003, -0.8605968, -2.892482, 0, 1, 0.572549, 1,
-0.1214152, 0.8559405, 1.303577, 0, 1, 0.5803922, 1,
-0.1169809, 0.5531992, -0.6243619, 0, 1, 0.5843138, 1,
-0.1137769, 0.875286, 1.148635, 0, 1, 0.5921569, 1,
-0.09957566, 1.085078, 0.7569593, 0, 1, 0.5960785, 1,
-0.09880791, 0.8298772, 0.04543014, 0, 1, 0.6039216, 1,
-0.09581815, 0.1340945, -1.176765, 0, 1, 0.6117647, 1,
-0.09249094, 0.841193, -0.408951, 0, 1, 0.6156863, 1,
-0.091583, -2.630997, -1.878221, 0, 1, 0.6235294, 1,
-0.09123789, 1.085392, 0.00508841, 0, 1, 0.627451, 1,
-0.08497069, 1.010894, 0.6203923, 0, 1, 0.6352941, 1,
-0.08429292, 0.1267314, 0.1407738, 0, 1, 0.6392157, 1,
-0.08143466, 0.3031637, -0.3788964, 0, 1, 0.6470588, 1,
-0.08139432, -1.124655, -3.63476, 0, 1, 0.6509804, 1,
-0.07967848, -0.4119056, -3.841043, 0, 1, 0.6588235, 1,
-0.07929422, -0.4050859, -4.525194, 0, 1, 0.6627451, 1,
-0.0741704, 1.965548, -0.2890768, 0, 1, 0.6705883, 1,
-0.07165994, 1.157647, -1.964366, 0, 1, 0.6745098, 1,
-0.06982321, -0.9122411, -3.973564, 0, 1, 0.682353, 1,
-0.06475702, 0.3511087, 0.1208839, 0, 1, 0.6862745, 1,
-0.06389052, -0.2641281, -3.316485, 0, 1, 0.6941177, 1,
-0.06382566, -0.07960328, -2.71445, 0, 1, 0.7019608, 1,
-0.06285402, -0.1024389, -1.48313, 0, 1, 0.7058824, 1,
-0.06213173, 0.01683447, -1.274397, 0, 1, 0.7137255, 1,
-0.05849482, 0.04840261, -0.3637536, 0, 1, 0.7176471, 1,
-0.05848361, -0.07542898, -0.9098244, 0, 1, 0.7254902, 1,
-0.0573468, -0.05901666, -1.936732, 0, 1, 0.7294118, 1,
-0.05540899, -0.2598214, -3.625324, 0, 1, 0.7372549, 1,
-0.05429786, 0.6248484, -0.2832996, 0, 1, 0.7411765, 1,
-0.05266649, 0.381467, 0.1135497, 0, 1, 0.7490196, 1,
-0.05092578, -1.416814, -4.008232, 0, 1, 0.7529412, 1,
-0.04978046, -0.4250521, -3.214581, 0, 1, 0.7607843, 1,
-0.04912261, 0.01269987, -0.9147907, 0, 1, 0.7647059, 1,
-0.04715938, -1.060542, -3.26724, 0, 1, 0.772549, 1,
-0.0439841, -1.572789, -4.20658, 0, 1, 0.7764706, 1,
-0.04348173, -0.6512206, -2.779514, 0, 1, 0.7843137, 1,
-0.04315911, 0.03317739, -3.011012, 0, 1, 0.7882353, 1,
-0.03221705, 0.4237883, 0.3276503, 0, 1, 0.7960784, 1,
-0.03170034, -0.5032181, -3.730167, 0, 1, 0.8039216, 1,
-0.03127029, 0.3065321, 0.3723015, 0, 1, 0.8078431, 1,
-0.02927642, -0.1427775, -3.248274, 0, 1, 0.8156863, 1,
-0.02132289, 0.002703738, -2.930672, 0, 1, 0.8196079, 1,
-0.01912748, 0.132272, -1.178507, 0, 1, 0.827451, 1,
-0.01798061, 1.417364, 0.1051702, 0, 1, 0.8313726, 1,
-0.0166082, -0.7131899, -3.845131, 0, 1, 0.8392157, 1,
-0.01466982, -1.005596, -2.166071, 0, 1, 0.8431373, 1,
-0.01431897, -0.474516, -4.147699, 0, 1, 0.8509804, 1,
-0.01260331, 1.002542, 0.4509177, 0, 1, 0.854902, 1,
-0.01258356, 0.6918943, -0.515199, 0, 1, 0.8627451, 1,
-0.001633099, -0.7010517, -3.165348, 0, 1, 0.8666667, 1,
0.001227651, 0.774886, -1.258494, 0, 1, 0.8745098, 1,
0.002207754, 1.040645, 0.8425934, 0, 1, 0.8784314, 1,
0.002384626, 0.1652018, -0.5003825, 0, 1, 0.8862745, 1,
0.004391434, -0.4215674, 3.055725, 0, 1, 0.8901961, 1,
0.008513872, -0.9778928, 2.090676, 0, 1, 0.8980392, 1,
0.01185696, 0.5945326, -0.849187, 0, 1, 0.9058824, 1,
0.01466562, -0.147461, 3.131322, 0, 1, 0.9098039, 1,
0.0200679, -0.920244, 4.359342, 0, 1, 0.9176471, 1,
0.02054614, -0.2293684, 4.64936, 0, 1, 0.9215686, 1,
0.02953346, 0.9619029, -1.842476, 0, 1, 0.9294118, 1,
0.03051419, -0.8044478, 4.515897, 0, 1, 0.9333333, 1,
0.03407025, 1.025123, 1.108419, 0, 1, 0.9411765, 1,
0.03614435, 0.7571457, 0.8299139, 0, 1, 0.945098, 1,
0.04766767, -0.6439469, 3.698387, 0, 1, 0.9529412, 1,
0.05653084, -0.1246195, 2.908833, 0, 1, 0.9568627, 1,
0.05902074, 0.9876738, 1.157941, 0, 1, 0.9647059, 1,
0.0608365, -0.2863945, 1.645795, 0, 1, 0.9686275, 1,
0.07218763, -1.173431, 3.019684, 0, 1, 0.9764706, 1,
0.07233731, 1.126642, -1.265551, 0, 1, 0.9803922, 1,
0.07508028, 1.447875, 0.6168511, 0, 1, 0.9882353, 1,
0.07929368, 1.632456, 0.5003316, 0, 1, 0.9921569, 1,
0.08039632, -0.2012928, 4.570418, 0, 1, 1, 1,
0.08342832, -0.8243664, 2.424881, 0, 0.9921569, 1, 1,
0.0834948, 0.4004311, 1.273413, 0, 0.9882353, 1, 1,
0.08436079, -0.2835818, 1.191475, 0, 0.9803922, 1, 1,
0.08487973, 0.006816149, 3.101542, 0, 0.9764706, 1, 1,
0.08672896, 1.786447, -0.7524151, 0, 0.9686275, 1, 1,
0.09106215, 1.130134, 0.3468577, 0, 0.9647059, 1, 1,
0.09121297, 0.1649461, -0.2063215, 0, 0.9568627, 1, 1,
0.09129848, -0.433551, 3.279893, 0, 0.9529412, 1, 1,
0.09194917, 0.2285984, 0.5329207, 0, 0.945098, 1, 1,
0.09364333, -0.9247642, 2.933863, 0, 0.9411765, 1, 1,
0.0979896, 1.143447, -0.07306608, 0, 0.9333333, 1, 1,
0.09994906, -1.014671, 1.998736, 0, 0.9294118, 1, 1,
0.1060083, -0.7383553, 3.163162, 0, 0.9215686, 1, 1,
0.1089134, -1.175031, 5.308694, 0, 0.9176471, 1, 1,
0.1129201, -2.149904, 2.904594, 0, 0.9098039, 1, 1,
0.113137, 0.5129288, 1.082398, 0, 0.9058824, 1, 1,
0.1140273, -0.9378386, 3.203241, 0, 0.8980392, 1, 1,
0.1145084, 0.3290523, 1.182036, 0, 0.8901961, 1, 1,
0.1230152, 0.7686639, 0.04744764, 0, 0.8862745, 1, 1,
0.1274234, 1.243958, -1.289741, 0, 0.8784314, 1, 1,
0.1306843, 0.7819748, 0.1606205, 0, 0.8745098, 1, 1,
0.1316426, 0.5195352, 1.070673, 0, 0.8666667, 1, 1,
0.1333731, 0.4330061, -1.681778, 0, 0.8627451, 1, 1,
0.1348439, 1.643091, 0.5005143, 0, 0.854902, 1, 1,
0.1359552, 1.039477, -1.952736, 0, 0.8509804, 1, 1,
0.1368233, -0.371563, 2.145445, 0, 0.8431373, 1, 1,
0.1370347, 0.445351, -1.230183, 0, 0.8392157, 1, 1,
0.1380374, -0.8068079, 1.685896, 0, 0.8313726, 1, 1,
0.1392005, 1.894679, 1.326503, 0, 0.827451, 1, 1,
0.145504, -0.2615625, 3.417639, 0, 0.8196079, 1, 1,
0.1477986, -1.815848, 1.240044, 0, 0.8156863, 1, 1,
0.14973, -1.155311, 1.449992, 0, 0.8078431, 1, 1,
0.1499693, 1.272496, 0.9325629, 0, 0.8039216, 1, 1,
0.1499999, 0.03154019, 0.3725148, 0, 0.7960784, 1, 1,
0.1507963, -0.6034944, 3.583087, 0, 0.7882353, 1, 1,
0.1516769, -1.229549, 3.459989, 0, 0.7843137, 1, 1,
0.154144, -0.7448192, 2.011171, 0, 0.7764706, 1, 1,
0.15462, -0.18467, 3.698448, 0, 0.772549, 1, 1,
0.1580866, -0.795112, 2.22756, 0, 0.7647059, 1, 1,
0.1608788, 0.07910612, 1.767322, 0, 0.7607843, 1, 1,
0.1613509, 1.215421, 0.526661, 0, 0.7529412, 1, 1,
0.1621179, -1.785887, 4.151308, 0, 0.7490196, 1, 1,
0.1631238, 0.923501, 0.8243961, 0, 0.7411765, 1, 1,
0.1635834, 0.5162572, -0.6412599, 0, 0.7372549, 1, 1,
0.1662522, 0.6939778, 0.7186226, 0, 0.7294118, 1, 1,
0.1699769, 0.01218502, 2.227292, 0, 0.7254902, 1, 1,
0.170383, -0.1680401, 2.214711, 0, 0.7176471, 1, 1,
0.1710047, -0.7269278, 2.66471, 0, 0.7137255, 1, 1,
0.1715104, 0.7277948, -0.4833654, 0, 0.7058824, 1, 1,
0.1731769, 0.1951463, 2.326424, 0, 0.6980392, 1, 1,
0.1732437, -1.565025, 3.094238, 0, 0.6941177, 1, 1,
0.173441, 0.1413497, -0.02554821, 0, 0.6862745, 1, 1,
0.1739728, 1.079305, 0.6418796, 0, 0.682353, 1, 1,
0.1758714, -0.5068867, 2.843228, 0, 0.6745098, 1, 1,
0.1762753, 2.029686, 0.4149698, 0, 0.6705883, 1, 1,
0.1764351, 0.00584622, 3.05857, 0, 0.6627451, 1, 1,
0.1822092, 0.9597965, -0.5011575, 0, 0.6588235, 1, 1,
0.1858934, -0.1934615, 3.237376, 0, 0.6509804, 1, 1,
0.1922246, 0.4970234, 0.189494, 0, 0.6470588, 1, 1,
0.1935452, -0.6039901, 5.786028, 0, 0.6392157, 1, 1,
0.1963057, 0.7220522, 0.009614662, 0, 0.6352941, 1, 1,
0.2020569, 0.9883186, 0.7858654, 0, 0.627451, 1, 1,
0.2034612, 0.1968466, 1.668053, 0, 0.6235294, 1, 1,
0.2044053, 0.7114789, -0.04441686, 0, 0.6156863, 1, 1,
0.2046339, -0.3525111, 1.348855, 0, 0.6117647, 1, 1,
0.2105257, 0.7708524, 0.3661279, 0, 0.6039216, 1, 1,
0.2124932, 0.4672583, 1.974761, 0, 0.5960785, 1, 1,
0.2130741, -0.2741183, 2.798448, 0, 0.5921569, 1, 1,
0.2156481, 0.3612319, 1.127034, 0, 0.5843138, 1, 1,
0.2184736, -0.5105926, 2.619526, 0, 0.5803922, 1, 1,
0.2225188, -0.04110964, 1.828816, 0, 0.572549, 1, 1,
0.2237198, -0.6209969, 1.846268, 0, 0.5686275, 1, 1,
0.2237401, -0.3371837, 4.759902, 0, 0.5607843, 1, 1,
0.2287864, 0.4212986, 0.5435267, 0, 0.5568628, 1, 1,
0.239457, -1.688572, 2.716177, 0, 0.5490196, 1, 1,
0.2413726, -1.149927, 4.240687, 0, 0.5450981, 1, 1,
0.2433463, -0.6293006, 2.289906, 0, 0.5372549, 1, 1,
0.2448227, 2.040815, 0.1252027, 0, 0.5333334, 1, 1,
0.246454, 1.14946, -0.5876862, 0, 0.5254902, 1, 1,
0.2502137, 0.818261, -1.548592, 0, 0.5215687, 1, 1,
0.2509481, -0.5122573, 4.232069, 0, 0.5137255, 1, 1,
0.2509585, -0.6879471, 3.978033, 0, 0.509804, 1, 1,
0.2547722, 0.9195048, -0.3124021, 0, 0.5019608, 1, 1,
0.2554276, -0.5189602, 3.143365, 0, 0.4941176, 1, 1,
0.2567349, 0.2516627, 0.008582156, 0, 0.4901961, 1, 1,
0.2577122, -0.1110952, 3.452834, 0, 0.4823529, 1, 1,
0.2605571, -0.3864248, 1.833598, 0, 0.4784314, 1, 1,
0.2628389, 1.170873, 0.596194, 0, 0.4705882, 1, 1,
0.2641268, -0.3280791, 2.746233, 0, 0.4666667, 1, 1,
0.2659888, 0.7016784, -1.01413, 0, 0.4588235, 1, 1,
0.2681117, 0.4246131, -1.743488, 0, 0.454902, 1, 1,
0.2709735, -0.6399005, 1.933799, 0, 0.4470588, 1, 1,
0.2746838, 0.7306921, -0.5232013, 0, 0.4431373, 1, 1,
0.2812495, 0.4904932, -0.008023907, 0, 0.4352941, 1, 1,
0.2859708, -1.75195, 3.075788, 0, 0.4313726, 1, 1,
0.2895628, 0.8053561, 0.8136563, 0, 0.4235294, 1, 1,
0.2910405, -0.1345617, 2.666938, 0, 0.4196078, 1, 1,
0.291368, -0.7834795, 2.487169, 0, 0.4117647, 1, 1,
0.2971255, -1.445491, 4.40365, 0, 0.4078431, 1, 1,
0.3038184, -0.07113801, 2.595729, 0, 0.4, 1, 1,
0.3070394, -0.1560342, 0.3135678, 0, 0.3921569, 1, 1,
0.3070755, -0.5560381, 0.819957, 0, 0.3882353, 1, 1,
0.3077423, 0.5378161, -1.42592, 0, 0.3803922, 1, 1,
0.3088693, -1.615764, 2.02475, 0, 0.3764706, 1, 1,
0.3095087, 1.457381, 0.992013, 0, 0.3686275, 1, 1,
0.3100997, 1.144654, -0.5013993, 0, 0.3647059, 1, 1,
0.312714, 1.052403, 1.135805, 0, 0.3568628, 1, 1,
0.3137307, -0.3164644, 2.77277, 0, 0.3529412, 1, 1,
0.3154812, 0.8550822, 0.406126, 0, 0.345098, 1, 1,
0.3156337, 1.34788, -0.390633, 0, 0.3411765, 1, 1,
0.3210854, 0.06210762, 1.290009, 0, 0.3333333, 1, 1,
0.3226461, 1.732165, 0.8294441, 0, 0.3294118, 1, 1,
0.3228707, -1.509249, 1.037959, 0, 0.3215686, 1, 1,
0.3270648, -0.1855065, 0.957173, 0, 0.3176471, 1, 1,
0.328311, -1.818545, 3.144806, 0, 0.3098039, 1, 1,
0.3297837, 0.3385724, 0.5319828, 0, 0.3058824, 1, 1,
0.3300415, 0.4224944, -0.3450744, 0, 0.2980392, 1, 1,
0.3352177, 0.05622968, 2.995832, 0, 0.2901961, 1, 1,
0.3362609, -1.885411, 1.872848, 0, 0.2862745, 1, 1,
0.3369181, 1.420473, -1.337802, 0, 0.2784314, 1, 1,
0.3372734, 0.4741321, 1.488744, 0, 0.2745098, 1, 1,
0.3444813, 0.7864702, 1.904151, 0, 0.2666667, 1, 1,
0.3451703, -0.6059825, 2.279469, 0, 0.2627451, 1, 1,
0.346324, -1.115233, 2.924793, 0, 0.254902, 1, 1,
0.3505039, -0.5027053, 2.501991, 0, 0.2509804, 1, 1,
0.3506113, 0.157073, 2.218547, 0, 0.2431373, 1, 1,
0.3577284, 1.481935, 0.6161174, 0, 0.2392157, 1, 1,
0.3579997, -0.3564077, 2.086399, 0, 0.2313726, 1, 1,
0.3633184, 2.628759, 0.6599391, 0, 0.227451, 1, 1,
0.3648104, -0.2622772, 2.738837, 0, 0.2196078, 1, 1,
0.3649606, 0.1201872, 0.4295957, 0, 0.2156863, 1, 1,
0.3668597, 0.5795152, 0.7002872, 0, 0.2078431, 1, 1,
0.3699151, 1.373209, 1.450593, 0, 0.2039216, 1, 1,
0.3722952, 0.9688641, 2.321177, 0, 0.1960784, 1, 1,
0.3723918, -0.4657125, 3.410324, 0, 0.1882353, 1, 1,
0.3743833, 1.102677, 0.07555876, 0, 0.1843137, 1, 1,
0.3764289, -1.410002, 2.081808, 0, 0.1764706, 1, 1,
0.3774042, 0.8101042, -0.7714813, 0, 0.172549, 1, 1,
0.3782561, -0.4734829, 0.3761801, 0, 0.1647059, 1, 1,
0.3796448, 0.9817061, 0.3000997, 0, 0.1607843, 1, 1,
0.3817808, -0.7157653, 2.012081, 0, 0.1529412, 1, 1,
0.3888867, 0.611858, -0.1525999, 0, 0.1490196, 1, 1,
0.3932616, 0.8535897, 0.1595751, 0, 0.1411765, 1, 1,
0.3943734, 1.847026, -1.300304, 0, 0.1372549, 1, 1,
0.395223, -0.7749164, 2.116243, 0, 0.1294118, 1, 1,
0.397498, -1.115928, 4.113457, 0, 0.1254902, 1, 1,
0.3977392, 0.5916882, 0.1550592, 0, 0.1176471, 1, 1,
0.4032334, -1.192741, 2.663763, 0, 0.1137255, 1, 1,
0.4075986, 1.249873, -1.182529, 0, 0.1058824, 1, 1,
0.4080286, 0.4900649, 0.9439483, 0, 0.09803922, 1, 1,
0.4143288, -0.3526756, 2.643797, 0, 0.09411765, 1, 1,
0.4184411, 0.009887616, 2.295107, 0, 0.08627451, 1, 1,
0.419286, -0.9019126, 3.120337, 0, 0.08235294, 1, 1,
0.4221644, -0.7919837, 2.28762, 0, 0.07450981, 1, 1,
0.4313767, -0.5341613, 2.641205, 0, 0.07058824, 1, 1,
0.4347842, -0.2507271, 1.459537, 0, 0.0627451, 1, 1,
0.4420685, -1.559743, 2.729758, 0, 0.05882353, 1, 1,
0.4455366, 0.8837332, 1.225453, 0, 0.05098039, 1, 1,
0.4506743, 0.2530993, 1.534803, 0, 0.04705882, 1, 1,
0.4507105, -0.1089042, 2.329265, 0, 0.03921569, 1, 1,
0.4512031, -0.3561282, 2.884383, 0, 0.03529412, 1, 1,
0.4512772, 0.3100217, 2.165171, 0, 0.02745098, 1, 1,
0.4524415, 1.542344, 0.4652038, 0, 0.02352941, 1, 1,
0.4531104, 1.84353, 0.827625, 0, 0.01568628, 1, 1,
0.4557115, -0.5542324, 1.490722, 0, 0.01176471, 1, 1,
0.4583266, -1.97508, 2.441266, 0, 0.003921569, 1, 1,
0.4631366, 1.83269, -0.03384504, 0.003921569, 0, 1, 1,
0.4641587, -1.084575, 1.809665, 0.007843138, 0, 1, 1,
0.4656327, 0.8304576, -0.4713721, 0.01568628, 0, 1, 1,
0.468488, 0.1994297, 1.014145, 0.01960784, 0, 1, 1,
0.4688383, 0.1556863, -0.004490693, 0.02745098, 0, 1, 1,
0.4714598, 2.311235, -1.039697, 0.03137255, 0, 1, 1,
0.4752946, -0.7150362, 2.545442, 0.03921569, 0, 1, 1,
0.4788642, 0.6015848, 0.4538589, 0.04313726, 0, 1, 1,
0.4789178, 0.7523533, 0.06610775, 0.05098039, 0, 1, 1,
0.479545, 1.003342, -0.2204261, 0.05490196, 0, 1, 1,
0.4812522, 0.3052907, 3.058624, 0.0627451, 0, 1, 1,
0.4856691, -1.350371, 2.03729, 0.06666667, 0, 1, 1,
0.4892983, 0.8749991, 3.223944, 0.07450981, 0, 1, 1,
0.4952689, -0.3093448, 2.272028, 0.07843138, 0, 1, 1,
0.502099, -0.1878405, 1.561215, 0.08627451, 0, 1, 1,
0.5022445, -1.146761, 1.932636, 0.09019608, 0, 1, 1,
0.5037587, -0.6432391, 2.2458, 0.09803922, 0, 1, 1,
0.5045391, 0.0001665767, 2.185827, 0.1058824, 0, 1, 1,
0.5065172, -0.746348, 1.730418, 0.1098039, 0, 1, 1,
0.5210926, -0.4165796, 4.165291, 0.1176471, 0, 1, 1,
0.5215456, 1.396122, 0.1746654, 0.1215686, 0, 1, 1,
0.5246086, 0.3008791, 2.452, 0.1294118, 0, 1, 1,
0.526122, -0.4510751, 2.993344, 0.1333333, 0, 1, 1,
0.532952, 0.09889568, 0.6953591, 0.1411765, 0, 1, 1,
0.5376621, -1.737885, 5.600822, 0.145098, 0, 1, 1,
0.5385112, -1.523996, 1.437312, 0.1529412, 0, 1, 1,
0.5393616, -0.1986223, 3.844053, 0.1568628, 0, 1, 1,
0.5406177, 0.3242703, 2.989755, 0.1647059, 0, 1, 1,
0.5476329, 0.6032056, -0.4148736, 0.1686275, 0, 1, 1,
0.5519443, 0.7675166, -2.006835, 0.1764706, 0, 1, 1,
0.55451, -0.5661121, 1.711511, 0.1803922, 0, 1, 1,
0.5629288, -1.091643, 2.704403, 0.1882353, 0, 1, 1,
0.5698838, 0.1536185, 1.286758, 0.1921569, 0, 1, 1,
0.5737259, -0.5825894, 2.490144, 0.2, 0, 1, 1,
0.5749705, -1.800862, 2.295911, 0.2078431, 0, 1, 1,
0.576857, -1.631423, 3.003056, 0.2117647, 0, 1, 1,
0.5770752, 1.625489, 1.693132, 0.2196078, 0, 1, 1,
0.5772589, 1.076913, -1.486181, 0.2235294, 0, 1, 1,
0.5774948, 1.13507, 0.2188998, 0.2313726, 0, 1, 1,
0.5775072, -0.1020192, 0.02882829, 0.2352941, 0, 1, 1,
0.5779231, -1.708881, 3.879793, 0.2431373, 0, 1, 1,
0.5787246, -1.037839, 1.183107, 0.2470588, 0, 1, 1,
0.5828817, 0.3314604, 1.002791, 0.254902, 0, 1, 1,
0.5847562, 1.878451, -0.05629611, 0.2588235, 0, 1, 1,
0.5854432, 0.2509376, 2.211316, 0.2666667, 0, 1, 1,
0.586438, 1.208578, -1.196797, 0.2705882, 0, 1, 1,
0.5922623, -1.737525, 1.582367, 0.2784314, 0, 1, 1,
0.6047996, 0.07864315, 1.449308, 0.282353, 0, 1, 1,
0.6063372, 0.9474587, 0.7427326, 0.2901961, 0, 1, 1,
0.607281, 0.2586887, 1.816753, 0.2941177, 0, 1, 1,
0.6126468, 0.8182822, -0.2702785, 0.3019608, 0, 1, 1,
0.619298, -0.2992387, 0.8703146, 0.3098039, 0, 1, 1,
0.6208423, 1.351139, 1.468178, 0.3137255, 0, 1, 1,
0.6217636, -1.008862, 3.187732, 0.3215686, 0, 1, 1,
0.6219977, -1.066032, 3.244043, 0.3254902, 0, 1, 1,
0.624487, 0.9329599, 1.409284, 0.3333333, 0, 1, 1,
0.6269589, 1.684165, 2.195262, 0.3372549, 0, 1, 1,
0.6297239, -0.8069478, 2.753724, 0.345098, 0, 1, 1,
0.6311781, 1.158944, 1.931484, 0.3490196, 0, 1, 1,
0.6314391, 0.473547, 3.619711, 0.3568628, 0, 1, 1,
0.6352286, 1.766513, 0.9819663, 0.3607843, 0, 1, 1,
0.636042, 0.1004036, 2.272425, 0.3686275, 0, 1, 1,
0.6365409, 0.5316343, -1.374858, 0.372549, 0, 1, 1,
0.6381045, -0.9304541, 2.991899, 0.3803922, 0, 1, 1,
0.6383017, 0.313577, 1.47436, 0.3843137, 0, 1, 1,
0.6441363, -0.6197102, 1.57099, 0.3921569, 0, 1, 1,
0.6455814, 0.4654355, 0.2207989, 0.3960784, 0, 1, 1,
0.6459186, 0.08838762, -0.373419, 0.4039216, 0, 1, 1,
0.6464025, 0.4401176, 1.816704, 0.4117647, 0, 1, 1,
0.6466169, -0.622162, 2.956537, 0.4156863, 0, 1, 1,
0.648361, 0.7029725, 0.26841, 0.4235294, 0, 1, 1,
0.6514001, -0.4862482, 1.811434, 0.427451, 0, 1, 1,
0.6545237, 0.6236445, 1.909372, 0.4352941, 0, 1, 1,
0.6596541, -2.24381, 2.822499, 0.4392157, 0, 1, 1,
0.6597973, 0.6118961, 1.262618, 0.4470588, 0, 1, 1,
0.6602095, 0.9372445, 0.3714969, 0.4509804, 0, 1, 1,
0.6633068, -0.570821, 2.984329, 0.4588235, 0, 1, 1,
0.6714216, -0.6534874, 1.045025, 0.4627451, 0, 1, 1,
0.6737852, 0.1682049, 1.37824, 0.4705882, 0, 1, 1,
0.6740355, 0.5653309, 0.8502247, 0.4745098, 0, 1, 1,
0.6750301, 1.143519, -1.530268, 0.4823529, 0, 1, 1,
0.6762856, -0.6118304, 2.119263, 0.4862745, 0, 1, 1,
0.6777836, 0.5697784, 1.231752, 0.4941176, 0, 1, 1,
0.6785865, 2.304034, 1.941839, 0.5019608, 0, 1, 1,
0.6809742, 0.5787581, 1.938197, 0.5058824, 0, 1, 1,
0.6812188, -1.259685, 2.723991, 0.5137255, 0, 1, 1,
0.6822044, 1.34599, 0.495563, 0.5176471, 0, 1, 1,
0.6825954, 0.2253574, -0.1499819, 0.5254902, 0, 1, 1,
0.6843897, 1.617637, 0.45826, 0.5294118, 0, 1, 1,
0.6845933, 0.6051255, 0.8896605, 0.5372549, 0, 1, 1,
0.692415, -1.888804, 1.031916, 0.5411765, 0, 1, 1,
0.6994179, 1.174808, 1.541221, 0.5490196, 0, 1, 1,
0.7064537, 0.02112192, 2.322365, 0.5529412, 0, 1, 1,
0.7083492, 0.08383087, 1.257048, 0.5607843, 0, 1, 1,
0.7120451, -0.4640778, 1.01956, 0.5647059, 0, 1, 1,
0.7126355, -0.6757624, 0.1501962, 0.572549, 0, 1, 1,
0.717383, -1.110712, 3.85277, 0.5764706, 0, 1, 1,
0.7197362, -0.4934801, 3.166809, 0.5843138, 0, 1, 1,
0.7241122, 0.821955, 0.4604776, 0.5882353, 0, 1, 1,
0.7280645, 0.3233824, 1.170335, 0.5960785, 0, 1, 1,
0.7293175, 0.9079252, 1.473382, 0.6039216, 0, 1, 1,
0.7334314, 0.2713089, -0.7901506, 0.6078432, 0, 1, 1,
0.7386052, 0.6319319, 1.505683, 0.6156863, 0, 1, 1,
0.7421463, 0.9363332, -1.034204, 0.6196079, 0, 1, 1,
0.7426065, -0.7428689, 3.196383, 0.627451, 0, 1, 1,
0.7434054, 1.621191, 1.285445, 0.6313726, 0, 1, 1,
0.7463216, 0.9846498, 0.1840441, 0.6392157, 0, 1, 1,
0.749474, -0.2142159, 0.01098012, 0.6431373, 0, 1, 1,
0.7515836, 0.8957515, 1.63966, 0.6509804, 0, 1, 1,
0.7525709, -0.1478869, 0.7652079, 0.654902, 0, 1, 1,
0.7607735, -0.6928259, 1.680391, 0.6627451, 0, 1, 1,
0.7608827, 0.9190768, 2.138732, 0.6666667, 0, 1, 1,
0.7618036, 1.521118, 0.8880152, 0.6745098, 0, 1, 1,
0.7635366, -0.3956338, 0.430622, 0.6784314, 0, 1, 1,
0.7649823, -1.319917, 2.234553, 0.6862745, 0, 1, 1,
0.765817, -0.9871681, 1.241923, 0.6901961, 0, 1, 1,
0.7718994, 0.4513278, 1.369123, 0.6980392, 0, 1, 1,
0.7768998, -0.7838622, 2.945046, 0.7058824, 0, 1, 1,
0.7773885, 2.546964, 1.224637, 0.7098039, 0, 1, 1,
0.7817265, 1.038769, 1.404377, 0.7176471, 0, 1, 1,
0.787738, 0.6028492, 2.067821, 0.7215686, 0, 1, 1,
0.7906405, 1.33652, 1.480731, 0.7294118, 0, 1, 1,
0.7915026, 0.2485224, 2.701064, 0.7333333, 0, 1, 1,
0.7990965, -0.2984849, 1.653039, 0.7411765, 0, 1, 1,
0.8070838, -0.714175, 2.898974, 0.7450981, 0, 1, 1,
0.8091869, 0.05986712, 1.378797, 0.7529412, 0, 1, 1,
0.8126329, 0.1251829, 1.921162, 0.7568628, 0, 1, 1,
0.8138869, -0.08310916, 1.107015, 0.7647059, 0, 1, 1,
0.8142438, -1.530146, 1.804665, 0.7686275, 0, 1, 1,
0.819584, -0.7213852, 1.790861, 0.7764706, 0, 1, 1,
0.8197936, 0.681552, 0.3146789, 0.7803922, 0, 1, 1,
0.8239065, 1.558441, 0.06755922, 0.7882353, 0, 1, 1,
0.8241701, 1.357869, 0.4247668, 0.7921569, 0, 1, 1,
0.8249801, 3.313931, 0.2540947, 0.8, 0, 1, 1,
0.8323347, 1.37328, -0.06003586, 0.8078431, 0, 1, 1,
0.8374752, 1.056723, 0.8770151, 0.8117647, 0, 1, 1,
0.8390605, 0.2819476, -0.3639631, 0.8196079, 0, 1, 1,
0.8452907, -0.2764173, 2.816556, 0.8235294, 0, 1, 1,
0.8466549, 0.555064, 0.4125192, 0.8313726, 0, 1, 1,
0.8509801, 0.6470411, 1.692966, 0.8352941, 0, 1, 1,
0.8550578, -0.1037851, 0.6550114, 0.8431373, 0, 1, 1,
0.8551586, 0.08870095, 0.3312219, 0.8470588, 0, 1, 1,
0.8553134, 2.041351, -2.131119, 0.854902, 0, 1, 1,
0.8570722, 0.6442533, 1.496016, 0.8588235, 0, 1, 1,
0.8689162, 0.658288, -0.005478641, 0.8666667, 0, 1, 1,
0.8726637, -0.2109813, 1.639736, 0.8705882, 0, 1, 1,
0.8749939, 1.025929, 1.052443, 0.8784314, 0, 1, 1,
0.8756076, 0.3286626, 0.659058, 0.8823529, 0, 1, 1,
0.8783907, 0.1129392, 1.032802, 0.8901961, 0, 1, 1,
0.8861793, 0.5699226, 0.1598717, 0.8941177, 0, 1, 1,
0.8867108, -1.419943, 3.816614, 0.9019608, 0, 1, 1,
0.88739, -1.169122, 2.076074, 0.9098039, 0, 1, 1,
0.8904613, 0.2234394, 2.02135, 0.9137255, 0, 1, 1,
0.8920644, 0.1271315, 1.535385, 0.9215686, 0, 1, 1,
0.892271, 1.356273, -0.04522455, 0.9254902, 0, 1, 1,
0.8956714, -0.2948465, 1.612269, 0.9333333, 0, 1, 1,
0.901282, 0.6899221, 0.6979132, 0.9372549, 0, 1, 1,
0.9117141, 0.3026628, 0.7880641, 0.945098, 0, 1, 1,
0.9159282, -2.157934, 1.370348, 0.9490196, 0, 1, 1,
0.9168188, -0.422762, 1.208075, 0.9568627, 0, 1, 1,
0.9208958, -0.4504748, 0.2663653, 0.9607843, 0, 1, 1,
0.9217231, -1.293252, 1.400484, 0.9686275, 0, 1, 1,
0.9311615, 1.06625, -0.4044617, 0.972549, 0, 1, 1,
0.9316498, 0.4124691, -0.3699498, 0.9803922, 0, 1, 1,
0.9361185, 1.644269, 0.7395031, 0.9843137, 0, 1, 1,
0.9464712, 0.3265054, 1.442755, 0.9921569, 0, 1, 1,
0.9503646, 0.3506344, 2.308008, 0.9960784, 0, 1, 1,
0.9529216, 0.776834, 0.7659502, 1, 0, 0.9960784, 1,
0.9571759, -0.08581089, 0.2077897, 1, 0, 0.9882353, 1,
0.9607344, 0.08893465, 0.9939492, 1, 0, 0.9843137, 1,
0.9611418, 0.3357477, 2.750365, 1, 0, 0.9764706, 1,
0.9624352, 1.420259, 2.147412, 1, 0, 0.972549, 1,
0.9647335, 0.1626411, 2.265378, 1, 0, 0.9647059, 1,
0.9662489, -1.331883, 1.553243, 1, 0, 0.9607843, 1,
0.9667097, -1.558127, 0.9216821, 1, 0, 0.9529412, 1,
0.971257, 0.9630558, 2.871468, 1, 0, 0.9490196, 1,
0.9737692, -0.1325587, 0.7006478, 1, 0, 0.9411765, 1,
0.9745439, 0.3646051, 2.114475, 1, 0, 0.9372549, 1,
0.9832553, -1.833427, 2.652935, 1, 0, 0.9294118, 1,
0.9849917, -0.4934775, 0.994311, 1, 0, 0.9254902, 1,
0.9950585, -0.5463433, -0.1796221, 1, 0, 0.9176471, 1,
0.9950999, -0.6067026, 0.7164697, 1, 0, 0.9137255, 1,
1.00741, -0.2307008, 1.485858, 1, 0, 0.9058824, 1,
1.00812, -0.4517662, 3.395117, 1, 0, 0.9019608, 1,
1.008288, -0.2592096, 1.258745, 1, 0, 0.8941177, 1,
1.009257, 0.3708021, 0.6416404, 1, 0, 0.8862745, 1,
1.01482, -1.95142, 2.246374, 1, 0, 0.8823529, 1,
1.017635, 1.163892, 1.129764, 1, 0, 0.8745098, 1,
1.022994, -0.6997755, 3.958007, 1, 0, 0.8705882, 1,
1.026797, 0.8787718, -0.4603064, 1, 0, 0.8627451, 1,
1.035351, 0.817097, -0.09435787, 1, 0, 0.8588235, 1,
1.035355, 0.008612378, 1.292444, 1, 0, 0.8509804, 1,
1.037632, -0.2844561, 3.529628, 1, 0, 0.8470588, 1,
1.038129, 1.532841, 0.04584819, 1, 0, 0.8392157, 1,
1.048174, 0.04853479, 2.825676, 1, 0, 0.8352941, 1,
1.053346, 0.8595398, 1.390438, 1, 0, 0.827451, 1,
1.058232, -0.5382718, 3.447267, 1, 0, 0.8235294, 1,
1.058991, 0.4089576, 0.8435498, 1, 0, 0.8156863, 1,
1.060042, -0.1822683, 1.046034, 1, 0, 0.8117647, 1,
1.066967, -0.9457405, 2.024697, 1, 0, 0.8039216, 1,
1.071141, -0.5424607, 2.38595, 1, 0, 0.7960784, 1,
1.073042, 1.85791, 1.422768, 1, 0, 0.7921569, 1,
1.078796, 1.774898, 2.255244, 1, 0, 0.7843137, 1,
1.079391, 0.6661576, 0.2544841, 1, 0, 0.7803922, 1,
1.080379, 0.8033358, -0.0509725, 1, 0, 0.772549, 1,
1.087673, -0.05006894, 2.947815, 1, 0, 0.7686275, 1,
1.089467, 0.2576395, 2.18634, 1, 0, 0.7607843, 1,
1.096627, 0.8276297, 1.005082, 1, 0, 0.7568628, 1,
1.099162, 0.3007761, 3.169529, 1, 0, 0.7490196, 1,
1.110721, 0.09950083, 2.111882, 1, 0, 0.7450981, 1,
1.12035, 0.05759417, 2.212721, 1, 0, 0.7372549, 1,
1.12176, 0.5477574, 0.7990548, 1, 0, 0.7333333, 1,
1.123657, 0.1045128, 0.7798057, 1, 0, 0.7254902, 1,
1.133541, 0.838342, 0.6680785, 1, 0, 0.7215686, 1,
1.140301, 0.004675591, 2.4782, 1, 0, 0.7137255, 1,
1.14309, 0.04648945, -0.4488662, 1, 0, 0.7098039, 1,
1.143728, 0.06269647, 3.428515, 1, 0, 0.7019608, 1,
1.148859, -1.447921, 3.416782, 1, 0, 0.6941177, 1,
1.14895, -0.01099089, 2.039049, 1, 0, 0.6901961, 1,
1.151415, -1.074625, 2.72876, 1, 0, 0.682353, 1,
1.152611, 1.126784, 1.309233, 1, 0, 0.6784314, 1,
1.153218, -1.202569, 2.746077, 1, 0, 0.6705883, 1,
1.158872, 0.2293739, 1.165831, 1, 0, 0.6666667, 1,
1.159291, 0.04996271, 2.148464, 1, 0, 0.6588235, 1,
1.16435, 0.2342998, 1.569956, 1, 0, 0.654902, 1,
1.1754, -1.244939, 2.361459, 1, 0, 0.6470588, 1,
1.181892, 1.251712, 0.4601506, 1, 0, 0.6431373, 1,
1.183426, -1.085653, 3.132491, 1, 0, 0.6352941, 1,
1.189106, -0.3183172, 3.578532, 1, 0, 0.6313726, 1,
1.189633, -0.9910932, 2.890397, 1, 0, 0.6235294, 1,
1.197411, -0.09728897, 1.450865, 1, 0, 0.6196079, 1,
1.210473, -1.370973, 1.17121, 1, 0, 0.6117647, 1,
1.211695, -0.562089, 2.537476, 1, 0, 0.6078432, 1,
1.216522, -0.7018188, 1.630289, 1, 0, 0.6, 1,
1.232561, 0.5249779, 0.5736079, 1, 0, 0.5921569, 1,
1.234211, 1.490721, -0.2136009, 1, 0, 0.5882353, 1,
1.248399, 1.058622, 2.244394, 1, 0, 0.5803922, 1,
1.249513, -0.1455633, 1.819889, 1, 0, 0.5764706, 1,
1.266237, 0.7724036, 1.476551, 1, 0, 0.5686275, 1,
1.275013, -0.1448141, 1.326643, 1, 0, 0.5647059, 1,
1.277861, 1.249669, 0.4457971, 1, 0, 0.5568628, 1,
1.282992, 1.154116, 1.10866, 1, 0, 0.5529412, 1,
1.290249, -1.08353, 0.5091392, 1, 0, 0.5450981, 1,
1.303206, 0.1748188, 1.751456, 1, 0, 0.5411765, 1,
1.313823, 0.2253154, 3.839109, 1, 0, 0.5333334, 1,
1.316737, 0.7898193, 0.7156106, 1, 0, 0.5294118, 1,
1.32142, 2.157224, 1.011742, 1, 0, 0.5215687, 1,
1.325092, 0.773816, 2.562732, 1, 0, 0.5176471, 1,
1.325952, -0.1530085, 0.1751931, 1, 0, 0.509804, 1,
1.332928, 0.8827255, -0.1025233, 1, 0, 0.5058824, 1,
1.334252, 0.1495897, 0.9503723, 1, 0, 0.4980392, 1,
1.337611, -0.4957026, 0.9221629, 1, 0, 0.4901961, 1,
1.340807, 0.6853481, 0.1195024, 1, 0, 0.4862745, 1,
1.342419, 0.6963552, 1.698063, 1, 0, 0.4784314, 1,
1.361382, 0.7687748, 1.309027, 1, 0, 0.4745098, 1,
1.361898, -0.2804671, 2.387076, 1, 0, 0.4666667, 1,
1.375273, 1.452045, 1.690565, 1, 0, 0.4627451, 1,
1.38023, -1.196828, 0.905301, 1, 0, 0.454902, 1,
1.398237, 1.395552, 0.3651301, 1, 0, 0.4509804, 1,
1.39869, 0.1671162, 0.8872349, 1, 0, 0.4431373, 1,
1.398777, -1.3705, 2.720293, 1, 0, 0.4392157, 1,
1.407431, 1.266947, -0.4506857, 1, 0, 0.4313726, 1,
1.411357, 0.2198626, 0.2087187, 1, 0, 0.427451, 1,
1.420164, 0.5399253, 0.6933957, 1, 0, 0.4196078, 1,
1.429494, 1.653641, 0.706574, 1, 0, 0.4156863, 1,
1.461301, 1.457582, 0.9012758, 1, 0, 0.4078431, 1,
1.465852, 0.2360695, -0.02858588, 1, 0, 0.4039216, 1,
1.472157, 1.267607, 0.3014017, 1, 0, 0.3960784, 1,
1.479426, -0.1188854, 1.07482, 1, 0, 0.3882353, 1,
1.480328, 0.7818142, 1.359666, 1, 0, 0.3843137, 1,
1.493215, -0.2175822, 0.9840602, 1, 0, 0.3764706, 1,
1.501793, 0.4959846, -0.3202184, 1, 0, 0.372549, 1,
1.506209, 0.261406, 0.8415004, 1, 0, 0.3647059, 1,
1.508752, -0.9162111, 1.58491, 1, 0, 0.3607843, 1,
1.50953, -0.7215886, 0.5197507, 1, 0, 0.3529412, 1,
1.515979, 0.3767663, 1.596313, 1, 0, 0.3490196, 1,
1.524954, -0.1652243, 1.389917, 1, 0, 0.3411765, 1,
1.536798, 0.9438049, -0.2597541, 1, 0, 0.3372549, 1,
1.540144, 0.07146774, 1.776469, 1, 0, 0.3294118, 1,
1.546482, -1.031925, 3.58301, 1, 0, 0.3254902, 1,
1.553068, 0.6070954, 2.380763, 1, 0, 0.3176471, 1,
1.579209, -0.3974913, 1.182725, 1, 0, 0.3137255, 1,
1.588256, 0.6822322, 2.101482, 1, 0, 0.3058824, 1,
1.58838, 0.2089731, 1.723475, 1, 0, 0.2980392, 1,
1.595203, 0.1044382, 2.001599, 1, 0, 0.2941177, 1,
1.604995, -0.6917524, 3.344773, 1, 0, 0.2862745, 1,
1.607938, -0.2826686, 1.617606, 1, 0, 0.282353, 1,
1.613053, -0.1970801, 2.162213, 1, 0, 0.2745098, 1,
1.63636, 0.4568352, 0.9847907, 1, 0, 0.2705882, 1,
1.642267, -0.787806, 3.333278, 1, 0, 0.2627451, 1,
1.646277, -0.3436072, 1.674862, 1, 0, 0.2588235, 1,
1.646505, -0.5506451, 2.635954, 1, 0, 0.2509804, 1,
1.689615, -0.3390534, 1.544478, 1, 0, 0.2470588, 1,
1.691165, 0.9465591, 1.492777, 1, 0, 0.2392157, 1,
1.697206, 0.0551604, 0.3434134, 1, 0, 0.2352941, 1,
1.699368, -0.6550018, 3.218171, 1, 0, 0.227451, 1,
1.702309, 0.9767191, -0.4161589, 1, 0, 0.2235294, 1,
1.709932, 0.8780801, 0.3514012, 1, 0, 0.2156863, 1,
1.745866, 0.2998651, 0.9598501, 1, 0, 0.2117647, 1,
1.751678, 0.5066242, 0.9013602, 1, 0, 0.2039216, 1,
1.794245, 0.2773553, 1.604111, 1, 0, 0.1960784, 1,
1.795543, -1.526449, 2.311782, 1, 0, 0.1921569, 1,
1.841404, 0.9064522, 0.4622209, 1, 0, 0.1843137, 1,
1.858029, 0.04078526, 1.852555, 1, 0, 0.1803922, 1,
1.864148, -0.1974545, 2.000468, 1, 0, 0.172549, 1,
1.904736, -0.4628478, 1.147022, 1, 0, 0.1686275, 1,
1.905861, 1.020882, 1.822822, 1, 0, 0.1607843, 1,
1.923383, -0.004282598, 1.043249, 1, 0, 0.1568628, 1,
1.939607, 0.5668873, 1.182657, 1, 0, 0.1490196, 1,
1.940104, -0.4090482, 0.6115597, 1, 0, 0.145098, 1,
1.943168, 1.375786, 1.824688, 1, 0, 0.1372549, 1,
1.944579, 0.3573093, 2.876963, 1, 0, 0.1333333, 1,
2.012471, 0.3105862, -0.1981338, 1, 0, 0.1254902, 1,
2.04792, 1.742701, 1.443483, 1, 0, 0.1215686, 1,
2.050023, 0.5852809, 0.4812752, 1, 0, 0.1137255, 1,
2.05808, 0.08916527, 0.903765, 1, 0, 0.1098039, 1,
2.063173, 1.016093, 1.084236, 1, 0, 0.1019608, 1,
2.079671, -0.7761682, 0.7835262, 1, 0, 0.09411765, 1,
2.104211, 1.043989, 0.6504884, 1, 0, 0.09019608, 1,
2.111741, -0.2835391, -0.2362968, 1, 0, 0.08235294, 1,
2.15968, 0.9957896, 0.4938719, 1, 0, 0.07843138, 1,
2.168233, 0.2684123, 1.570918, 1, 0, 0.07058824, 1,
2.170798, 1.743156, -0.3050636, 1, 0, 0.06666667, 1,
2.178796, 0.2912542, 2.240187, 1, 0, 0.05882353, 1,
2.481578, -0.6359863, 0.1327572, 1, 0, 0.05490196, 1,
2.51127, -0.3708028, 1.448516, 1, 0, 0.04705882, 1,
2.526367, -0.007366529, 1.458093, 1, 0, 0.04313726, 1,
2.565528, -1.045116, 1.489309, 1, 0, 0.03529412, 1,
2.56665, 0.07911684, 2.295078, 1, 0, 0.03137255, 1,
2.736916, -0.9491938, 1.722891, 1, 0, 0.02352941, 1,
2.813532, 0.9238501, 2.224731, 1, 0, 0.01960784, 1,
2.990993, -0.0717385, 1.306197, 1, 0, 0.01176471, 1,
3.137416, 2.648575, 1.517763, 1, 0, 0.007843138, 1
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
0.07423759, -4.694799, -7.113434, 0, -0.5, 0.5, 0.5,
0.07423759, -4.694799, -7.113434, 1, -0.5, 0.5, 0.5,
0.07423759, -4.694799, -7.113434, 1, 1.5, 0.5, 0.5,
0.07423759, -4.694799, -7.113434, 0, 1.5, 0.5, 0.5
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
-4.027359, -0.1100665, -7.113434, 0, -0.5, 0.5, 0.5,
-4.027359, -0.1100665, -7.113434, 1, -0.5, 0.5, 0.5,
-4.027359, -0.1100665, -7.113434, 1, 1.5, 0.5, 0.5,
-4.027359, -0.1100665, -7.113434, 0, 1.5, 0.5, 0.5
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
-4.027359, -4.694799, 0.271081, 0, -0.5, 0.5, 0.5,
-4.027359, -4.694799, 0.271081, 1, -0.5, 0.5, 0.5,
-4.027359, -4.694799, 0.271081, 1, 1.5, 0.5, 0.5,
-4.027359, -4.694799, 0.271081, 0, 1.5, 0.5, 0.5
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
-2, -3.636784, -5.409315,
3, -3.636784, -5.409315,
-2, -3.636784, -5.409315,
-2, -3.81312, -5.693335,
-1, -3.636784, -5.409315,
-1, -3.81312, -5.693335,
0, -3.636784, -5.409315,
0, -3.81312, -5.693335,
1, -3.636784, -5.409315,
1, -3.81312, -5.693335,
2, -3.636784, -5.409315,
2, -3.81312, -5.693335,
3, -3.636784, -5.409315,
3, -3.81312, -5.693335
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
-2, -4.165792, -6.261374, 0, -0.5, 0.5, 0.5,
-2, -4.165792, -6.261374, 1, -0.5, 0.5, 0.5,
-2, -4.165792, -6.261374, 1, 1.5, 0.5, 0.5,
-2, -4.165792, -6.261374, 0, 1.5, 0.5, 0.5,
-1, -4.165792, -6.261374, 0, -0.5, 0.5, 0.5,
-1, -4.165792, -6.261374, 1, -0.5, 0.5, 0.5,
-1, -4.165792, -6.261374, 1, 1.5, 0.5, 0.5,
-1, -4.165792, -6.261374, 0, 1.5, 0.5, 0.5,
0, -4.165792, -6.261374, 0, -0.5, 0.5, 0.5,
0, -4.165792, -6.261374, 1, -0.5, 0.5, 0.5,
0, -4.165792, -6.261374, 1, 1.5, 0.5, 0.5,
0, -4.165792, -6.261374, 0, 1.5, 0.5, 0.5,
1, -4.165792, -6.261374, 0, -0.5, 0.5, 0.5,
1, -4.165792, -6.261374, 1, -0.5, 0.5, 0.5,
1, -4.165792, -6.261374, 1, 1.5, 0.5, 0.5,
1, -4.165792, -6.261374, 0, 1.5, 0.5, 0.5,
2, -4.165792, -6.261374, 0, -0.5, 0.5, 0.5,
2, -4.165792, -6.261374, 1, -0.5, 0.5, 0.5,
2, -4.165792, -6.261374, 1, 1.5, 0.5, 0.5,
2, -4.165792, -6.261374, 0, 1.5, 0.5, 0.5,
3, -4.165792, -6.261374, 0, -0.5, 0.5, 0.5,
3, -4.165792, -6.261374, 1, -0.5, 0.5, 0.5,
3, -4.165792, -6.261374, 1, 1.5, 0.5, 0.5,
3, -4.165792, -6.261374, 0, 1.5, 0.5, 0.5
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
-3.080836, -3, -5.409315,
-3.080836, 3, -5.409315,
-3.080836, -3, -5.409315,
-3.23859, -3, -5.693335,
-3.080836, -2, -5.409315,
-3.23859, -2, -5.693335,
-3.080836, -1, -5.409315,
-3.23859, -1, -5.693335,
-3.080836, 0, -5.409315,
-3.23859, 0, -5.693335,
-3.080836, 1, -5.409315,
-3.23859, 1, -5.693335,
-3.080836, 2, -5.409315,
-3.23859, 2, -5.693335,
-3.080836, 3, -5.409315,
-3.23859, 3, -5.693335
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
-3.554097, -3, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, -3, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, -3, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, -3, -6.261374, 0, 1.5, 0.5, 0.5,
-3.554097, -2, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, -2, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, -2, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, -2, -6.261374, 0, 1.5, 0.5, 0.5,
-3.554097, -1, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, -1, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, -1, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, -1, -6.261374, 0, 1.5, 0.5, 0.5,
-3.554097, 0, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, 0, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, 0, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, 0, -6.261374, 0, 1.5, 0.5, 0.5,
-3.554097, 1, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, 1, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, 1, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, 1, -6.261374, 0, 1.5, 0.5, 0.5,
-3.554097, 2, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, 2, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, 2, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, 2, -6.261374, 0, 1.5, 0.5, 0.5,
-3.554097, 3, -6.261374, 0, -0.5, 0.5, 0.5,
-3.554097, 3, -6.261374, 1, -0.5, 0.5, 0.5,
-3.554097, 3, -6.261374, 1, 1.5, 0.5, 0.5,
-3.554097, 3, -6.261374, 0, 1.5, 0.5, 0.5
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
-3.080836, -3.636784, -4,
-3.080836, -3.636784, 4,
-3.080836, -3.636784, -4,
-3.23859, -3.81312, -4,
-3.080836, -3.636784, -2,
-3.23859, -3.81312, -2,
-3.080836, -3.636784, 0,
-3.23859, -3.81312, 0,
-3.080836, -3.636784, 2,
-3.23859, -3.81312, 2,
-3.080836, -3.636784, 4,
-3.23859, -3.81312, 4
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
-3.554097, -4.165792, -4, 0, -0.5, 0.5, 0.5,
-3.554097, -4.165792, -4, 1, -0.5, 0.5, 0.5,
-3.554097, -4.165792, -4, 1, 1.5, 0.5, 0.5,
-3.554097, -4.165792, -4, 0, 1.5, 0.5, 0.5,
-3.554097, -4.165792, -2, 0, -0.5, 0.5, 0.5,
-3.554097, -4.165792, -2, 1, -0.5, 0.5, 0.5,
-3.554097, -4.165792, -2, 1, 1.5, 0.5, 0.5,
-3.554097, -4.165792, -2, 0, 1.5, 0.5, 0.5,
-3.554097, -4.165792, 0, 0, -0.5, 0.5, 0.5,
-3.554097, -4.165792, 0, 1, -0.5, 0.5, 0.5,
-3.554097, -4.165792, 0, 1, 1.5, 0.5, 0.5,
-3.554097, -4.165792, 0, 0, 1.5, 0.5, 0.5,
-3.554097, -4.165792, 2, 0, -0.5, 0.5, 0.5,
-3.554097, -4.165792, 2, 1, -0.5, 0.5, 0.5,
-3.554097, -4.165792, 2, 1, 1.5, 0.5, 0.5,
-3.554097, -4.165792, 2, 0, 1.5, 0.5, 0.5,
-3.554097, -4.165792, 4, 0, -0.5, 0.5, 0.5,
-3.554097, -4.165792, 4, 1, -0.5, 0.5, 0.5,
-3.554097, -4.165792, 4, 1, 1.5, 0.5, 0.5,
-3.554097, -4.165792, 4, 0, 1.5, 0.5, 0.5
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
-3.080836, -3.636784, -5.409315,
-3.080836, 3.416651, -5.409315,
-3.080836, -3.636784, 5.951477,
-3.080836, 3.416651, 5.951477,
-3.080836, -3.636784, -5.409315,
-3.080836, -3.636784, 5.951477,
-3.080836, 3.416651, -5.409315,
-3.080836, 3.416651, 5.951477,
-3.080836, -3.636784, -5.409315,
3.229311, -3.636784, -5.409315,
-3.080836, -3.636784, 5.951477,
3.229311, -3.636784, 5.951477,
-3.080836, 3.416651, -5.409315,
3.229311, 3.416651, -5.409315,
-3.080836, 3.416651, 5.951477,
3.229311, 3.416651, 5.951477,
3.229311, -3.636784, -5.409315,
3.229311, 3.416651, -5.409315,
3.229311, -3.636784, 5.951477,
3.229311, 3.416651, 5.951477,
3.229311, -3.636784, -5.409315,
3.229311, -3.636784, 5.951477,
3.229311, 3.416651, -5.409315,
3.229311, 3.416651, 5.951477
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
var radius = 7.89563;
var distance = 35.12855;
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
mvMatrix.translate( -0.07423759, 0.1100665, -0.271081 );
mvMatrix.scale( 1.352886, 1.21032, 0.7514362 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12855);
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
halosulfuron-methyl<-read.table("halosulfuron-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-halosulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'halosulfuron' not found
```

```r
y<-halosulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'halosulfuron' not found
```

```r
z<-halosulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'halosulfuron' not found
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
-2.988941, 0.5351056, -1.986334, 0, 0, 1, 1, 1,
-2.935469, -0.1688605, -0.8742597, 1, 0, 0, 1, 1,
-2.726259, -0.2398686, -2.409339, 1, 0, 0, 1, 1,
-2.561405, -0.6136248, -2.166752, 1, 0, 0, 1, 1,
-2.445033, -0.2480446, -2.335525, 1, 0, 0, 1, 1,
-2.400182, 0.07849064, -2.00579, 1, 0, 0, 1, 1,
-2.381773, -0.6226956, -1.194353, 0, 0, 0, 1, 1,
-2.380312, 0.1240492, -2.527914, 0, 0, 0, 1, 1,
-2.279586, 0.03868589, -2.300475, 0, 0, 0, 1, 1,
-2.109627, 2.747901, 0.5522454, 0, 0, 0, 1, 1,
-2.104073, 2.016791, -0.1934567, 0, 0, 0, 1, 1,
-2.058484, -0.7149593, -4.062675, 0, 0, 0, 1, 1,
-2.03008, 0.9291531, 0.1626447, 0, 0, 0, 1, 1,
-2.003782, -0.001336818, -1.058493, 1, 1, 1, 1, 1,
-2.000988, -0.2149705, -3.432695, 1, 1, 1, 1, 1,
-1.972663, -1.511217, -0.6121346, 1, 1, 1, 1, 1,
-1.960746, -2.088226, -1.281597, 1, 1, 1, 1, 1,
-1.949301, -0.260181, -0.5996932, 1, 1, 1, 1, 1,
-1.937722, -0.1370865, -0.6199499, 1, 1, 1, 1, 1,
-1.93168, -0.03667919, -0.7372376, 1, 1, 1, 1, 1,
-1.931495, -0.1429882, -2.588022, 1, 1, 1, 1, 1,
-1.913104, 0.4888745, -2.584229, 1, 1, 1, 1, 1,
-1.904444, -1.207538, -1.542944, 1, 1, 1, 1, 1,
-1.901196, 0.02821135, -2.892375, 1, 1, 1, 1, 1,
-1.881656, -0.6727949, -0.5953509, 1, 1, 1, 1, 1,
-1.880351, 0.9046918, -0.01744369, 1, 1, 1, 1, 1,
-1.852026, 1.147952, -0.9632737, 1, 1, 1, 1, 1,
-1.850476, 0.9207374, -0.9714136, 1, 1, 1, 1, 1,
-1.841607, -1.066487, 0.7427247, 0, 0, 1, 1, 1,
-1.792581, 0.7201321, 0.3583642, 1, 0, 0, 1, 1,
-1.774897, 1.720297, -0.689613, 1, 0, 0, 1, 1,
-1.774451, 1.954368, -0.04043041, 1, 0, 0, 1, 1,
-1.743019, 0.6155369, -0.4817856, 1, 0, 0, 1, 1,
-1.739794, -0.9324964, -2.669727, 1, 0, 0, 1, 1,
-1.735109, -1.220364, -1.638664, 0, 0, 0, 1, 1,
-1.728371, 1.034574, -0.4144538, 0, 0, 0, 1, 1,
-1.709244, -0.1783086, -3.75601, 0, 0, 0, 1, 1,
-1.684224, 0.3251829, -0.8129442, 0, 0, 0, 1, 1,
-1.680759, 1.567486, -1.185462, 0, 0, 0, 1, 1,
-1.666662, 0.7161261, 0.2137534, 0, 0, 0, 1, 1,
-1.631708, 0.4590759, -0.003565275, 0, 0, 0, 1, 1,
-1.631524, 2.622615, -1.842494, 1, 1, 1, 1, 1,
-1.628256, -0.1200019, -3.12908, 1, 1, 1, 1, 1,
-1.610407, -0.8204346, -3.017198, 1, 1, 1, 1, 1,
-1.606324, -0.4849729, -1.164681, 1, 1, 1, 1, 1,
-1.602014, 0.4696483, 0.2347163, 1, 1, 1, 1, 1,
-1.597803, -0.8606452, -2.57067, 1, 1, 1, 1, 1,
-1.596073, -1.848884, -1.424894, 1, 1, 1, 1, 1,
-1.559652, -0.7945852, -1.217502, 1, 1, 1, 1, 1,
-1.541147, 0.4206195, -1.480655, 1, 1, 1, 1, 1,
-1.539015, 0.02033266, -2.395731, 1, 1, 1, 1, 1,
-1.534127, -0.6285996, -2.005331, 1, 1, 1, 1, 1,
-1.529651, -1.399339, -2.09286, 1, 1, 1, 1, 1,
-1.52268, 0.8942922, 0.004324371, 1, 1, 1, 1, 1,
-1.521489, -1.650279, -1.12709, 1, 1, 1, 1, 1,
-1.514898, 0.1289042, -2.827443, 1, 1, 1, 1, 1,
-1.510961, 0.09616383, -2.037067, 0, 0, 1, 1, 1,
-1.507035, 1.407632, 0.4194186, 1, 0, 0, 1, 1,
-1.502323, -0.4178084, -2.146274, 1, 0, 0, 1, 1,
-1.499473, 0.5678124, -1.134902, 1, 0, 0, 1, 1,
-1.489138, 0.4245905, -1.468544, 1, 0, 0, 1, 1,
-1.4883, 2.335878, -0.07319815, 1, 0, 0, 1, 1,
-1.488224, -0.7186363, -1.78055, 0, 0, 0, 1, 1,
-1.47975, 0.07842387, -0.6399733, 0, 0, 0, 1, 1,
-1.465179, 0.8266457, -2.289689, 0, 0, 0, 1, 1,
-1.465004, 0.6581531, -1.97936, 0, 0, 0, 1, 1,
-1.461185, -1.311159, -2.956418, 0, 0, 0, 1, 1,
-1.454719, -0.5759876, -2.430465, 0, 0, 0, 1, 1,
-1.44833, 1.264879, 0.3596646, 0, 0, 0, 1, 1,
-1.441983, 1.87707, -1.085531, 1, 1, 1, 1, 1,
-1.429549, 0.3204262, -2.5485, 1, 1, 1, 1, 1,
-1.418142, -0.4896516, -3.373192, 1, 1, 1, 1, 1,
-1.409577, -0.4534412, -2.424275, 1, 1, 1, 1, 1,
-1.396285, -3.220251, -1.648304, 1, 1, 1, 1, 1,
-1.395215, 1.96767, -1.215471, 1, 1, 1, 1, 1,
-1.389951, -0.7466006, -1.067666, 1, 1, 1, 1, 1,
-1.389427, 0.4509141, -0.9634006, 1, 1, 1, 1, 1,
-1.381426, -0.3734507, -1.056299, 1, 1, 1, 1, 1,
-1.381302, -0.326388, -1.639048, 1, 1, 1, 1, 1,
-1.378791, -0.1045645, -1.645278, 1, 1, 1, 1, 1,
-1.364552, -2.108416, -0.622036, 1, 1, 1, 1, 1,
-1.364164, 0.09959608, -1.153379, 1, 1, 1, 1, 1,
-1.363719, -0.3980681, -1.021318, 1, 1, 1, 1, 1,
-1.354727, 0.4439411, -2.070974, 1, 1, 1, 1, 1,
-1.35285, 0.8980047, -3.039078, 0, 0, 1, 1, 1,
-1.350578, -0.8169485, -2.483476, 1, 0, 0, 1, 1,
-1.343404, -1.567691, -3.956445, 1, 0, 0, 1, 1,
-1.337799, -0.3431101, -3.524518, 1, 0, 0, 1, 1,
-1.335763, -0.4265665, -2.194739, 1, 0, 0, 1, 1,
-1.325395, 0.311019, -0.5618989, 1, 0, 0, 1, 1,
-1.323205, 0.1092088, -0.9966184, 0, 0, 0, 1, 1,
-1.313867, 0.7652293, -0.8789737, 0, 0, 0, 1, 1,
-1.313158, -0.103455, -2.770096, 0, 0, 0, 1, 1,
-1.305848, 0.3891236, -1.11105, 0, 0, 0, 1, 1,
-1.294791, 0.3911098, -1.083668, 0, 0, 0, 1, 1,
-1.291099, 0.2349004, 0.2355699, 0, 0, 0, 1, 1,
-1.287752, 0.3631354, -3.274772, 0, 0, 0, 1, 1,
-1.281015, 0.8640505, -1.599221, 1, 1, 1, 1, 1,
-1.276524, -0.8907802, -2.531883, 1, 1, 1, 1, 1,
-1.275764, 0.3649248, -0.8194137, 1, 1, 1, 1, 1,
-1.274256, 0.875968, -3.091282, 1, 1, 1, 1, 1,
-1.266554, 1.51827, -1.180809, 1, 1, 1, 1, 1,
-1.263403, 1.388038, -0.08373239, 1, 1, 1, 1, 1,
-1.259347, -0.8123305, -1.080909, 1, 1, 1, 1, 1,
-1.257602, -0.08384583, -3.073889, 1, 1, 1, 1, 1,
-1.246771, -1.059769, -1.618207, 1, 1, 1, 1, 1,
-1.237123, 0.1417539, -1.304865, 1, 1, 1, 1, 1,
-1.232089, -0.3562758, -2.871484, 1, 1, 1, 1, 1,
-1.230662, -0.6343796, -1.133767, 1, 1, 1, 1, 1,
-1.227547, -1.831239, -2.102237, 1, 1, 1, 1, 1,
-1.226524, 1.466114, -2.362392, 1, 1, 1, 1, 1,
-1.21945, -0.0833638, -3.567683, 1, 1, 1, 1, 1,
-1.219265, -1.162195, -2.969604, 0, 0, 1, 1, 1,
-1.216035, -0.02088266, -1.020282, 1, 0, 0, 1, 1,
-1.214719, -0.6508417, -1.893689, 1, 0, 0, 1, 1,
-1.208013, 0.985542, -0.3484773, 1, 0, 0, 1, 1,
-1.197108, -0.6134122, -0.7178492, 1, 0, 0, 1, 1,
-1.191873, -0.1589355, -0.4866697, 1, 0, 0, 1, 1,
-1.18656, -0.02675676, -0.8828591, 0, 0, 0, 1, 1,
-1.185298, 2.112676, -0.6467244, 0, 0, 0, 1, 1,
-1.18501, -0.564805, -1.757299, 0, 0, 0, 1, 1,
-1.183599, -0.1905384, -0.5473383, 0, 0, 0, 1, 1,
-1.171868, 0.385159, -2.369347, 0, 0, 0, 1, 1,
-1.17123, -1.621387, -1.293469, 0, 0, 0, 1, 1,
-1.164138, 0.6236649, -1.028576, 0, 0, 0, 1, 1,
-1.14992, 0.3129091, -2.081287, 1, 1, 1, 1, 1,
-1.145643, -1.117796, -3.701409, 1, 1, 1, 1, 1,
-1.142201, -1.351043, -2.802159, 1, 1, 1, 1, 1,
-1.137248, 0.5259624, -0.3591129, 1, 1, 1, 1, 1,
-1.129859, 1.529424, 0.7984013, 1, 1, 1, 1, 1,
-1.126137, 0.1798587, -1.678847, 1, 1, 1, 1, 1,
-1.124406, 0.1548692, -0.2828639, 1, 1, 1, 1, 1,
-1.121913, -1.245412, -3.290269, 1, 1, 1, 1, 1,
-1.117953, 0.3985279, -1.563169, 1, 1, 1, 1, 1,
-1.1167, -1.025865, -3.090456, 1, 1, 1, 1, 1,
-1.115116, -0.7107013, -2.430905, 1, 1, 1, 1, 1,
-1.114488, -0.3511545, 0.02587837, 1, 1, 1, 1, 1,
-1.111318, 0.7090874, -2.129002, 1, 1, 1, 1, 1,
-1.101474, 0.6292928, -0.6619998, 1, 1, 1, 1, 1,
-1.100805, -0.1605045, -2.418685, 1, 1, 1, 1, 1,
-1.100366, 0.567709, -1.85146, 0, 0, 1, 1, 1,
-1.097578, -0.685327, -3.217659, 1, 0, 0, 1, 1,
-1.095236, -0.7953085, -2.432569, 1, 0, 0, 1, 1,
-1.094898, 0.9517252, -1.670386, 1, 0, 0, 1, 1,
-1.090253, -0.5410149, -1.049003, 1, 0, 0, 1, 1,
-1.090207, 0.06773336, -2.364138, 1, 0, 0, 1, 1,
-1.086442, 0.8156722, -0.6248499, 0, 0, 0, 1, 1,
-1.080329, 1.053634, -1.922898, 0, 0, 0, 1, 1,
-1.074056, -0.1065525, -1.654915, 0, 0, 0, 1, 1,
-1.059848, -1.605821, -3.810851, 0, 0, 0, 1, 1,
-1.050957, -0.1142921, -1.157137, 0, 0, 0, 1, 1,
-1.048876, 0.9153126, -1.355448, 0, 0, 0, 1, 1,
-1.046541, 0.04635193, -3.228448, 0, 0, 0, 1, 1,
-1.046434, -0.1151114, -3.749606, 1, 1, 1, 1, 1,
-1.043933, 1.757568, -1.712406, 1, 1, 1, 1, 1,
-1.031873, 0.3196132, -2.625677, 1, 1, 1, 1, 1,
-1.025988, 0.5934824, -0.960286, 1, 1, 1, 1, 1,
-1.024686, 0.315958, -1.871393, 1, 1, 1, 1, 1,
-1.021707, -0.3808258, -1.457096, 1, 1, 1, 1, 1,
-1.018725, 1.570372, -1.879206, 1, 1, 1, 1, 1,
-1.013064, 2.694667, 1.132382, 1, 1, 1, 1, 1,
-1.008334, -1.191265, -1.733741, 1, 1, 1, 1, 1,
-1.006425, -0.6328434, -1.026863, 1, 1, 1, 1, 1,
-0.9951162, -0.7761356, -2.191685, 1, 1, 1, 1, 1,
-0.9886913, 0.7610468, -1.50012, 1, 1, 1, 1, 1,
-0.9870755, 1.384492, -0.03918798, 1, 1, 1, 1, 1,
-0.9851133, 0.7200507, -1.641465, 1, 1, 1, 1, 1,
-0.9732442, 0.1074262, -2.089853, 1, 1, 1, 1, 1,
-0.9701436, 0.5003468, -0.3681374, 0, 0, 1, 1, 1,
-0.9657583, 0.5997053, -1.417719, 1, 0, 0, 1, 1,
-0.9539716, -2.473857, -3.059421, 1, 0, 0, 1, 1,
-0.9538968, 1.182019, 1.266277, 1, 0, 0, 1, 1,
-0.9476229, -0.05395317, -2.73171, 1, 0, 0, 1, 1,
-0.9459549, -0.2310496, -2.45981, 1, 0, 0, 1, 1,
-0.9444283, -1.707269, -3.156663, 0, 0, 0, 1, 1,
-0.9435461, -0.213055, -0.3052548, 0, 0, 0, 1, 1,
-0.9402546, -0.2237034, -1.287541, 0, 0, 0, 1, 1,
-0.9295627, -0.09450692, -2.893177, 0, 0, 0, 1, 1,
-0.9269709, -0.5989805, -3.136637, 0, 0, 0, 1, 1,
-0.9244878, -1.967211, -1.900825, 0, 0, 0, 1, 1,
-0.9240642, 0.3976537, 0.2075919, 0, 0, 0, 1, 1,
-0.9236001, 0.3591293, -1.587903, 1, 1, 1, 1, 1,
-0.9215369, 1.135745, -1.389794, 1, 1, 1, 1, 1,
-0.9019432, 0.02657429, -1.683759, 1, 1, 1, 1, 1,
-0.8997096, 1.07736, -1.191648, 1, 1, 1, 1, 1,
-0.8950863, -0.5473409, -0.373996, 1, 1, 1, 1, 1,
-0.8914587, 1.359062, 0.3890683, 1, 1, 1, 1, 1,
-0.8872311, -1.452288, -3.243804, 1, 1, 1, 1, 1,
-0.8823575, 0.6854412, 0.9131133, 1, 1, 1, 1, 1,
-0.8767921, -1.101324, -3.14224, 1, 1, 1, 1, 1,
-0.8757205, 0.1807499, 1.467367, 1, 1, 1, 1, 1,
-0.8637899, -0.7406168, -1.533124, 1, 1, 1, 1, 1,
-0.8562302, -1.467455, -0.1326187, 1, 1, 1, 1, 1,
-0.8533953, -0.2206001, -0.1230479, 1, 1, 1, 1, 1,
-0.8528213, -0.1675499, 0.5797682, 1, 1, 1, 1, 1,
-0.8508527, -0.8185125, -1.865842, 1, 1, 1, 1, 1,
-0.8503497, -1.111623, -2.026563, 0, 0, 1, 1, 1,
-0.8449361, -1.004515, -2.395761, 1, 0, 0, 1, 1,
-0.8371823, 0.8868573, -1.602617, 1, 0, 0, 1, 1,
-0.8363506, 1.842672, -0.9558762, 1, 0, 0, 1, 1,
-0.8313767, -2.388195, -3.401734, 1, 0, 0, 1, 1,
-0.8268775, -1.594493, -1.962622, 1, 0, 0, 1, 1,
-0.8235979, 1.104659, -3.483293, 0, 0, 0, 1, 1,
-0.8186154, -0.3433875, -2.697004, 0, 0, 0, 1, 1,
-0.7996462, 0.2084476, -1.861471, 0, 0, 0, 1, 1,
-0.7964381, -1.275628, -3.370711, 0, 0, 0, 1, 1,
-0.7956979, -0.1243704, -0.6421412, 0, 0, 0, 1, 1,
-0.7955433, 0.3113141, -1.779836, 0, 0, 0, 1, 1,
-0.7937555, -0.575709, -3.205255, 0, 0, 0, 1, 1,
-0.7859342, -0.6631631, -0.9658518, 1, 1, 1, 1, 1,
-0.7840469, -0.02565681, -0.304832, 1, 1, 1, 1, 1,
-0.7838255, -2.379164, -3.909002, 1, 1, 1, 1, 1,
-0.7834501, -1.630082, -2.849773, 1, 1, 1, 1, 1,
-0.78177, -0.842164, -3.0325, 1, 1, 1, 1, 1,
-0.7757414, 1.331295, -0.9023699, 1, 1, 1, 1, 1,
-0.7733907, -0.9291783, -3.314218, 1, 1, 1, 1, 1,
-0.769507, -0.9274373, -2.360368, 1, 1, 1, 1, 1,
-0.7658679, -3.358096, -3.108962, 1, 1, 1, 1, 1,
-0.7570439, -0.4461394, -3.565118, 1, 1, 1, 1, 1,
-0.7549074, -0.576398, -3.271919, 1, 1, 1, 1, 1,
-0.7520149, 0.02160897, -1.929429, 1, 1, 1, 1, 1,
-0.7476422, -0.2743953, -1.383525, 1, 1, 1, 1, 1,
-0.7440262, -0.5804752, -2.180145, 1, 1, 1, 1, 1,
-0.7398321, -1.035448, -5.243866, 1, 1, 1, 1, 1,
-0.7395893, -0.5837432, -2.743308, 0, 0, 1, 1, 1,
-0.7393697, 1.942634, -0.5024779, 1, 0, 0, 1, 1,
-0.7386187, -0.35267, -2.089324, 1, 0, 0, 1, 1,
-0.7330589, 0.6546043, 1.060418, 1, 0, 0, 1, 1,
-0.7288861, -0.8183569, -3.829314, 1, 0, 0, 1, 1,
-0.7201715, -0.6211081, -3.40904, 1, 0, 0, 1, 1,
-0.7181479, -1.91382, -5.107745, 0, 0, 0, 1, 1,
-0.7169527, -1.206062, -3.624202, 0, 0, 0, 1, 1,
-0.700956, 1.00393, -1.564235, 0, 0, 0, 1, 1,
-0.6934021, 0.9399874, -1.115954, 0, 0, 0, 1, 1,
-0.6924042, -0.08638602, -2.261954, 0, 0, 0, 1, 1,
-0.6869515, -0.4118669, -2.025459, 0, 0, 0, 1, 1,
-0.6826714, -1.412618, -1.924866, 0, 0, 0, 1, 1,
-0.6820922, 0.358679, -3.402395, 1, 1, 1, 1, 1,
-0.6807931, -0.8985817, -1.10113, 1, 1, 1, 1, 1,
-0.6775678, -0.2480849, -3.199456, 1, 1, 1, 1, 1,
-0.6770479, -0.09699637, -2.435552, 1, 1, 1, 1, 1,
-0.6764864, -0.07516222, -2.351728, 1, 1, 1, 1, 1,
-0.6726046, -0.8994941, -1.35379, 1, 1, 1, 1, 1,
-0.6693961, 0.7392205, -1.44583, 1, 1, 1, 1, 1,
-0.6655031, -0.0856505, -0.7755013, 1, 1, 1, 1, 1,
-0.6654281, 0.8863857, -0.8716041, 1, 1, 1, 1, 1,
-0.6646577, -0.05572227, -1.973109, 1, 1, 1, 1, 1,
-0.6565961, -0.8226718, -2.156507, 1, 1, 1, 1, 1,
-0.6557927, 0.112877, -0.3436981, 1, 1, 1, 1, 1,
-0.6487126, 1.278413, -0.1454644, 1, 1, 1, 1, 1,
-0.6467277, 0.7096764, -1.588473, 1, 1, 1, 1, 1,
-0.6444169, -0.1022612, -2.050638, 1, 1, 1, 1, 1,
-0.6407377, 1.454509, -0.4348494, 0, 0, 1, 1, 1,
-0.6407179, -0.6219794, -2.201825, 1, 0, 0, 1, 1,
-0.6388831, 1.717116, -0.04520961, 1, 0, 0, 1, 1,
-0.636273, -1.672052, -2.547983, 1, 0, 0, 1, 1,
-0.6346593, -0.7040645, -3.377189, 1, 0, 0, 1, 1,
-0.6293795, -2.339777, -4.493456, 1, 0, 0, 1, 1,
-0.6258534, -0.3416461, -0.9323891, 0, 0, 0, 1, 1,
-0.6257575, -0.4200515, -1.700078, 0, 0, 0, 1, 1,
-0.6255589, 0.03416696, -2.066549, 0, 0, 0, 1, 1,
-0.6247023, 0.2121524, -1.748995, 0, 0, 0, 1, 1,
-0.6240308, 0.2331121, -2.207512, 0, 0, 0, 1, 1,
-0.6187764, -0.3370211, -2.933298, 0, 0, 0, 1, 1,
-0.6186958, -1.615964, -2.606897, 0, 0, 0, 1, 1,
-0.6128841, -0.9603043, -2.730719, 1, 1, 1, 1, 1,
-0.6042488, -0.3515958, -2.648841, 1, 1, 1, 1, 1,
-0.6031055, -0.2690063, -2.77245, 1, 1, 1, 1, 1,
-0.5980279, 0.6086009, -0.611589, 1, 1, 1, 1, 1,
-0.5948476, 0.2103957, -0.9697115, 1, 1, 1, 1, 1,
-0.5777458, 0.7812171, -1.363047, 1, 1, 1, 1, 1,
-0.5695624, -0.2577772, -1.960285, 1, 1, 1, 1, 1,
-0.5674034, 0.4639356, 0.3637217, 1, 1, 1, 1, 1,
-0.5656403, 0.5766911, -1.857657, 1, 1, 1, 1, 1,
-0.5648331, 0.695853, -1.525579, 1, 1, 1, 1, 1,
-0.5646408, 0.7789009, -0.6801828, 1, 1, 1, 1, 1,
-0.5605454, -1.161586, -2.426378, 1, 1, 1, 1, 1,
-0.5578209, -0.2918833, -2.294677, 1, 1, 1, 1, 1,
-0.5568553, -0.7840517, -2.424871, 1, 1, 1, 1, 1,
-0.5559467, 0.7664357, 0.2927104, 1, 1, 1, 1, 1,
-0.5505936, -0.5358527, -1.182804, 0, 0, 1, 1, 1,
-0.5447988, 0.2401933, 0.4279133, 1, 0, 0, 1, 1,
-0.5446398, -0.08535114, -1.922183, 1, 0, 0, 1, 1,
-0.5392665, -0.7896289, -4.069274, 1, 0, 0, 1, 1,
-0.5387804, -1.115735, -4.066237, 1, 0, 0, 1, 1,
-0.5346742, 1.050452, -0.1946823, 1, 0, 0, 1, 1,
-0.5321797, -0.9378309, -2.208064, 0, 0, 0, 1, 1,
-0.5239183, 1.529704, -1.47314, 0, 0, 0, 1, 1,
-0.522777, 0.4135361, -0.7698387, 0, 0, 0, 1, 1,
-0.5206481, -0.4563064, -1.762993, 0, 0, 0, 1, 1,
-0.520161, 0.4806154, 0.05047519, 0, 0, 0, 1, 1,
-0.5174763, 0.3226726, -0.5931866, 0, 0, 0, 1, 1,
-0.5148612, 0.4103467, -1.914599, 0, 0, 0, 1, 1,
-0.5088796, 0.6660957, -0.5947312, 1, 1, 1, 1, 1,
-0.5056476, -0.6394058, -2.311204, 1, 1, 1, 1, 1,
-0.5036396, -0.9164756, -2.408676, 1, 1, 1, 1, 1,
-0.4987754, 1.702238, 0.3378299, 1, 1, 1, 1, 1,
-0.4942592, -1.420018, -2.244126, 1, 1, 1, 1, 1,
-0.4903071, 0.2670082, -0.9518874, 1, 1, 1, 1, 1,
-0.487287, -0.839417, -3.008883, 1, 1, 1, 1, 1,
-0.4815215, 0.6665195, 1.237836, 1, 1, 1, 1, 1,
-0.473695, 1.411773, -0.2303257, 1, 1, 1, 1, 1,
-0.4732091, -1.976215, -2.754433, 1, 1, 1, 1, 1,
-0.4716146, 0.7292783, -1.035316, 1, 1, 1, 1, 1,
-0.4671078, -1.991471, -2.499702, 1, 1, 1, 1, 1,
-0.4617859, 0.04265686, -0.05630231, 1, 1, 1, 1, 1,
-0.4547583, -0.2623565, -3.92193, 1, 1, 1, 1, 1,
-0.4527328, 1.396061, -1.19541, 1, 1, 1, 1, 1,
-0.448819, 0.006405947, -0.7423891, 0, 0, 1, 1, 1,
-0.4473128, 0.1307014, 0.06319339, 1, 0, 0, 1, 1,
-0.4470459, 0.4403442, -0.7765471, 1, 0, 0, 1, 1,
-0.4445755, 0.2030187, -0.7420918, 1, 0, 0, 1, 1,
-0.4443304, 1.373209, -0.06628804, 1, 0, 0, 1, 1,
-0.4404679, 1.016049, 0.01322753, 1, 0, 0, 1, 1,
-0.4382533, -0.7128557, -4.166242, 0, 0, 0, 1, 1,
-0.4372442, 0.238883, -2.064115, 0, 0, 0, 1, 1,
-0.436738, -0.4140436, -1.795907, 0, 0, 0, 1, 1,
-0.4318781, 0.234607, -1.921655, 0, 0, 0, 1, 1,
-0.4300858, -0.0285672, -1.192661, 0, 0, 0, 1, 1,
-0.4290111, -0.7232438, -2.769166, 0, 0, 0, 1, 1,
-0.4271478, 1.779617, -0.2699201, 0, 0, 0, 1, 1,
-0.4271192, -2.363379, -2.602857, 1, 1, 1, 1, 1,
-0.4205289, 0.9391742, 0.626818, 1, 1, 1, 1, 1,
-0.4192149, -0.1234285, -2.164571, 1, 1, 1, 1, 1,
-0.4180702, -0.213206, -1.412909, 1, 1, 1, 1, 1,
-0.4123401, 0.9426752, 0.1124761, 1, 1, 1, 1, 1,
-0.4100428, -0.1536826, -2.214489, 1, 1, 1, 1, 1,
-0.4078285, -0.3245617, -2.636958, 1, 1, 1, 1, 1,
-0.406855, 0.8229184, -0.1815654, 1, 1, 1, 1, 1,
-0.4065863, 1.723444, 0.8084408, 1, 1, 1, 1, 1,
-0.4051172, -2.246407, -2.896243, 1, 1, 1, 1, 1,
-0.4033003, 0.2959423, -0.1067601, 1, 1, 1, 1, 1,
-0.4022555, 0.05232693, 0.1951859, 1, 1, 1, 1, 1,
-0.3991186, -0.9157836, -2.497731, 1, 1, 1, 1, 1,
-0.3970583, -1.266758, -3.24591, 1, 1, 1, 1, 1,
-0.3946543, 1.197529, 0.7062252, 1, 1, 1, 1, 1,
-0.3923159, 1.181138, 0.4902788, 0, 0, 1, 1, 1,
-0.3913193, 0.6260933, -2.372339, 1, 0, 0, 1, 1,
-0.3881938, 1.172755, -0.4027562, 1, 0, 0, 1, 1,
-0.3856476, -1.349091, -3.399553, 1, 0, 0, 1, 1,
-0.3797138, -1.081903, -3.301604, 1, 0, 0, 1, 1,
-0.3787183, -3.534064, -2.027778, 1, 0, 0, 1, 1,
-0.3775238, -0.3565645, -2.557245, 0, 0, 0, 1, 1,
-0.3730569, -1.755927, -3.911933, 0, 0, 0, 1, 1,
-0.362261, -1.541789, -1.258513, 0, 0, 0, 1, 1,
-0.3621733, -1.375898, -3.618814, 0, 0, 0, 1, 1,
-0.3518998, -0.528627, -3.149122, 0, 0, 0, 1, 1,
-0.3505734, 0.03417586, -1.51981, 0, 0, 0, 1, 1,
-0.3398346, 1.210228, -1.165099, 0, 0, 0, 1, 1,
-0.3384797, -0.4455685, -2.172783, 1, 1, 1, 1, 1,
-0.3383649, -0.04810793, -2.488677, 1, 1, 1, 1, 1,
-0.3360153, 1.404662, -0.9331205, 1, 1, 1, 1, 1,
-0.3342258, -1.521839, -2.449656, 1, 1, 1, 1, 1,
-0.3334206, 0.1768669, -0.9031452, 1, 1, 1, 1, 1,
-0.3318833, 0.7393373, -0.2462974, 1, 1, 1, 1, 1,
-0.3309904, -0.5489603, -1.279871, 1, 1, 1, 1, 1,
-0.3234599, 0.2341365, -2.058282, 1, 1, 1, 1, 1,
-0.3202234, 0.7267335, -0.6959041, 1, 1, 1, 1, 1,
-0.3191781, 0.9761987, -1.277599, 1, 1, 1, 1, 1,
-0.3179278, -0.7566758, -2.924415, 1, 1, 1, 1, 1,
-0.3173587, -1.591524, -2.762959, 1, 1, 1, 1, 1,
-0.3155641, 0.3679382, -1.882154, 1, 1, 1, 1, 1,
-0.3148976, -0.1424522, -1.762225, 1, 1, 1, 1, 1,
-0.3147373, 0.1681118, -2.858073, 1, 1, 1, 1, 1,
-0.3142881, 0.7389253, 0.3136421, 0, 0, 1, 1, 1,
-0.3139344, -0.4890678, -2.230573, 1, 0, 0, 1, 1,
-0.3066257, -0.608942, -2.420262, 1, 0, 0, 1, 1,
-0.3008484, 0.7277705, 3.165041, 1, 0, 0, 1, 1,
-0.2975526, 0.9362398, -0.2142471, 1, 0, 0, 1, 1,
-0.2966304, 1.738836, -2.253792, 1, 0, 0, 1, 1,
-0.2954771, -0.8001487, -3.67955, 0, 0, 0, 1, 1,
-0.2915461, 0.1996347, -2.48696, 0, 0, 0, 1, 1,
-0.2890528, 0.1969041, 0.325802, 0, 0, 0, 1, 1,
-0.2761576, -0.4967639, -4.19012, 0, 0, 0, 1, 1,
-0.2734162, 0.7587904, -0.9184391, 0, 0, 0, 1, 1,
-0.2707045, -0.1035023, -2.704836, 0, 0, 0, 1, 1,
-0.2679044, -1.046563, -2.93794, 0, 0, 0, 1, 1,
-0.2647738, 1.982078, 0.6881179, 1, 1, 1, 1, 1,
-0.2579883, -1.072967, -1.931205, 1, 1, 1, 1, 1,
-0.2483997, -0.3129568, -4.376976, 1, 1, 1, 1, 1,
-0.2465817, 0.8986148, 0.228527, 1, 1, 1, 1, 1,
-0.2457959, 1.776751, 1.085246, 1, 1, 1, 1, 1,
-0.2457049, 0.9195419, 0.3300231, 1, 1, 1, 1, 1,
-0.2443513, 2.447498, 1.431969, 1, 1, 1, 1, 1,
-0.2389091, 2.258655, -0.05686212, 1, 1, 1, 1, 1,
-0.2378955, 1.852223, -1.481888, 1, 1, 1, 1, 1,
-0.2326042, -0.3057267, -2.163553, 1, 1, 1, 1, 1,
-0.2282273, 0.6495678, -1.100606, 1, 1, 1, 1, 1,
-0.2277508, -0.6096253, -5.212933, 1, 1, 1, 1, 1,
-0.2257934, -0.4665672, -2.509956, 1, 1, 1, 1, 1,
-0.2242765, -0.3589641, -3.064291, 1, 1, 1, 1, 1,
-0.2218972, 0.8718941, -0.08619843, 1, 1, 1, 1, 1,
-0.2196518, -1.284346, -5.027699, 0, 0, 1, 1, 1,
-0.2180281, 0.02849664, 0.07788704, 1, 0, 0, 1, 1,
-0.2176623, -0.1404405, -2.9831, 1, 0, 0, 1, 1,
-0.2145403, 0.06418772, -0.05891659, 1, 0, 0, 1, 1,
-0.2143127, -0.3077908, -2.528519, 1, 0, 0, 1, 1,
-0.2125596, -0.9307624, -4.025081, 1, 0, 0, 1, 1,
-0.208604, 1.82034, -1.028378, 0, 0, 0, 1, 1,
-0.2075061, -1.347151, -2.634002, 0, 0, 0, 1, 1,
-0.2034065, -0.8061464, -4.409965, 0, 0, 0, 1, 1,
-0.2029275, 1.031686, -0.6143042, 0, 0, 0, 1, 1,
-0.1972676, -0.6832997, -3.26687, 0, 0, 0, 1, 1,
-0.1930859, 0.2365476, -0.03779767, 0, 0, 0, 1, 1,
-0.1916468, -0.3590734, -1.750071, 0, 0, 0, 1, 1,
-0.1889548, -0.4800298, -3.621927, 1, 1, 1, 1, 1,
-0.1881072, -0.1472788, -2.036908, 1, 1, 1, 1, 1,
-0.1804491, 0.5982607, 0.101081, 1, 1, 1, 1, 1,
-0.1802637, -0.6233979, -1.417449, 1, 1, 1, 1, 1,
-0.172922, -0.3065366, -0.70419, 1, 1, 1, 1, 1,
-0.1722015, -1.13903, -4.313246, 1, 1, 1, 1, 1,
-0.169136, -0.4370882, -2.971876, 1, 1, 1, 1, 1,
-0.1666958, -0.9526871, -2.76978, 1, 1, 1, 1, 1,
-0.1629989, -2.023025, -1.184669, 1, 1, 1, 1, 1,
-0.1617072, -0.4065684, -0.5852869, 1, 1, 1, 1, 1,
-0.1598845, 1.011984, 0.3432127, 1, 1, 1, 1, 1,
-0.1591721, -0.4337471, -4.114887, 1, 1, 1, 1, 1,
-0.1576874, 0.2209751, -0.2815834, 1, 1, 1, 1, 1,
-0.1515735, -1.575221, -2.491088, 1, 1, 1, 1, 1,
-0.1499673, -0.4092947, -4.729305, 1, 1, 1, 1, 1,
-0.1493048, -0.639277, -1.742876, 0, 0, 1, 1, 1,
-0.1490449, 0.9605121, -0.9429676, 1, 0, 0, 1, 1,
-0.1468234, -0.4835202, -4.471676, 1, 0, 0, 1, 1,
-0.1389273, 0.2192322, -0.3923982, 1, 0, 0, 1, 1,
-0.1347488, -1.452812, -3.531961, 1, 0, 0, 1, 1,
-0.1289219, -0.3684776, -4.476563, 1, 0, 0, 1, 1,
-0.1287053, -0.08983541, -1.646519, 0, 0, 0, 1, 1,
-0.128532, -0.3450601, -3.595999, 0, 0, 0, 1, 1,
-0.1250883, 0.3000524, 0.8975985, 0, 0, 0, 1, 1,
-0.1239003, -0.8605968, -2.892482, 0, 0, 0, 1, 1,
-0.1214152, 0.8559405, 1.303577, 0, 0, 0, 1, 1,
-0.1169809, 0.5531992, -0.6243619, 0, 0, 0, 1, 1,
-0.1137769, 0.875286, 1.148635, 0, 0, 0, 1, 1,
-0.09957566, 1.085078, 0.7569593, 1, 1, 1, 1, 1,
-0.09880791, 0.8298772, 0.04543014, 1, 1, 1, 1, 1,
-0.09581815, 0.1340945, -1.176765, 1, 1, 1, 1, 1,
-0.09249094, 0.841193, -0.408951, 1, 1, 1, 1, 1,
-0.091583, -2.630997, -1.878221, 1, 1, 1, 1, 1,
-0.09123789, 1.085392, 0.00508841, 1, 1, 1, 1, 1,
-0.08497069, 1.010894, 0.6203923, 1, 1, 1, 1, 1,
-0.08429292, 0.1267314, 0.1407738, 1, 1, 1, 1, 1,
-0.08143466, 0.3031637, -0.3788964, 1, 1, 1, 1, 1,
-0.08139432, -1.124655, -3.63476, 1, 1, 1, 1, 1,
-0.07967848, -0.4119056, -3.841043, 1, 1, 1, 1, 1,
-0.07929422, -0.4050859, -4.525194, 1, 1, 1, 1, 1,
-0.0741704, 1.965548, -0.2890768, 1, 1, 1, 1, 1,
-0.07165994, 1.157647, -1.964366, 1, 1, 1, 1, 1,
-0.06982321, -0.9122411, -3.973564, 1, 1, 1, 1, 1,
-0.06475702, 0.3511087, 0.1208839, 0, 0, 1, 1, 1,
-0.06389052, -0.2641281, -3.316485, 1, 0, 0, 1, 1,
-0.06382566, -0.07960328, -2.71445, 1, 0, 0, 1, 1,
-0.06285402, -0.1024389, -1.48313, 1, 0, 0, 1, 1,
-0.06213173, 0.01683447, -1.274397, 1, 0, 0, 1, 1,
-0.05849482, 0.04840261, -0.3637536, 1, 0, 0, 1, 1,
-0.05848361, -0.07542898, -0.9098244, 0, 0, 0, 1, 1,
-0.0573468, -0.05901666, -1.936732, 0, 0, 0, 1, 1,
-0.05540899, -0.2598214, -3.625324, 0, 0, 0, 1, 1,
-0.05429786, 0.6248484, -0.2832996, 0, 0, 0, 1, 1,
-0.05266649, 0.381467, 0.1135497, 0, 0, 0, 1, 1,
-0.05092578, -1.416814, -4.008232, 0, 0, 0, 1, 1,
-0.04978046, -0.4250521, -3.214581, 0, 0, 0, 1, 1,
-0.04912261, 0.01269987, -0.9147907, 1, 1, 1, 1, 1,
-0.04715938, -1.060542, -3.26724, 1, 1, 1, 1, 1,
-0.0439841, -1.572789, -4.20658, 1, 1, 1, 1, 1,
-0.04348173, -0.6512206, -2.779514, 1, 1, 1, 1, 1,
-0.04315911, 0.03317739, -3.011012, 1, 1, 1, 1, 1,
-0.03221705, 0.4237883, 0.3276503, 1, 1, 1, 1, 1,
-0.03170034, -0.5032181, -3.730167, 1, 1, 1, 1, 1,
-0.03127029, 0.3065321, 0.3723015, 1, 1, 1, 1, 1,
-0.02927642, -0.1427775, -3.248274, 1, 1, 1, 1, 1,
-0.02132289, 0.002703738, -2.930672, 1, 1, 1, 1, 1,
-0.01912748, 0.132272, -1.178507, 1, 1, 1, 1, 1,
-0.01798061, 1.417364, 0.1051702, 1, 1, 1, 1, 1,
-0.0166082, -0.7131899, -3.845131, 1, 1, 1, 1, 1,
-0.01466982, -1.005596, -2.166071, 1, 1, 1, 1, 1,
-0.01431897, -0.474516, -4.147699, 1, 1, 1, 1, 1,
-0.01260331, 1.002542, 0.4509177, 0, 0, 1, 1, 1,
-0.01258356, 0.6918943, -0.515199, 1, 0, 0, 1, 1,
-0.001633099, -0.7010517, -3.165348, 1, 0, 0, 1, 1,
0.001227651, 0.774886, -1.258494, 1, 0, 0, 1, 1,
0.002207754, 1.040645, 0.8425934, 1, 0, 0, 1, 1,
0.002384626, 0.1652018, -0.5003825, 1, 0, 0, 1, 1,
0.004391434, -0.4215674, 3.055725, 0, 0, 0, 1, 1,
0.008513872, -0.9778928, 2.090676, 0, 0, 0, 1, 1,
0.01185696, 0.5945326, -0.849187, 0, 0, 0, 1, 1,
0.01466562, -0.147461, 3.131322, 0, 0, 0, 1, 1,
0.0200679, -0.920244, 4.359342, 0, 0, 0, 1, 1,
0.02054614, -0.2293684, 4.64936, 0, 0, 0, 1, 1,
0.02953346, 0.9619029, -1.842476, 0, 0, 0, 1, 1,
0.03051419, -0.8044478, 4.515897, 1, 1, 1, 1, 1,
0.03407025, 1.025123, 1.108419, 1, 1, 1, 1, 1,
0.03614435, 0.7571457, 0.8299139, 1, 1, 1, 1, 1,
0.04766767, -0.6439469, 3.698387, 1, 1, 1, 1, 1,
0.05653084, -0.1246195, 2.908833, 1, 1, 1, 1, 1,
0.05902074, 0.9876738, 1.157941, 1, 1, 1, 1, 1,
0.0608365, -0.2863945, 1.645795, 1, 1, 1, 1, 1,
0.07218763, -1.173431, 3.019684, 1, 1, 1, 1, 1,
0.07233731, 1.126642, -1.265551, 1, 1, 1, 1, 1,
0.07508028, 1.447875, 0.6168511, 1, 1, 1, 1, 1,
0.07929368, 1.632456, 0.5003316, 1, 1, 1, 1, 1,
0.08039632, -0.2012928, 4.570418, 1, 1, 1, 1, 1,
0.08342832, -0.8243664, 2.424881, 1, 1, 1, 1, 1,
0.0834948, 0.4004311, 1.273413, 1, 1, 1, 1, 1,
0.08436079, -0.2835818, 1.191475, 1, 1, 1, 1, 1,
0.08487973, 0.006816149, 3.101542, 0, 0, 1, 1, 1,
0.08672896, 1.786447, -0.7524151, 1, 0, 0, 1, 1,
0.09106215, 1.130134, 0.3468577, 1, 0, 0, 1, 1,
0.09121297, 0.1649461, -0.2063215, 1, 0, 0, 1, 1,
0.09129848, -0.433551, 3.279893, 1, 0, 0, 1, 1,
0.09194917, 0.2285984, 0.5329207, 1, 0, 0, 1, 1,
0.09364333, -0.9247642, 2.933863, 0, 0, 0, 1, 1,
0.0979896, 1.143447, -0.07306608, 0, 0, 0, 1, 1,
0.09994906, -1.014671, 1.998736, 0, 0, 0, 1, 1,
0.1060083, -0.7383553, 3.163162, 0, 0, 0, 1, 1,
0.1089134, -1.175031, 5.308694, 0, 0, 0, 1, 1,
0.1129201, -2.149904, 2.904594, 0, 0, 0, 1, 1,
0.113137, 0.5129288, 1.082398, 0, 0, 0, 1, 1,
0.1140273, -0.9378386, 3.203241, 1, 1, 1, 1, 1,
0.1145084, 0.3290523, 1.182036, 1, 1, 1, 1, 1,
0.1230152, 0.7686639, 0.04744764, 1, 1, 1, 1, 1,
0.1274234, 1.243958, -1.289741, 1, 1, 1, 1, 1,
0.1306843, 0.7819748, 0.1606205, 1, 1, 1, 1, 1,
0.1316426, 0.5195352, 1.070673, 1, 1, 1, 1, 1,
0.1333731, 0.4330061, -1.681778, 1, 1, 1, 1, 1,
0.1348439, 1.643091, 0.5005143, 1, 1, 1, 1, 1,
0.1359552, 1.039477, -1.952736, 1, 1, 1, 1, 1,
0.1368233, -0.371563, 2.145445, 1, 1, 1, 1, 1,
0.1370347, 0.445351, -1.230183, 1, 1, 1, 1, 1,
0.1380374, -0.8068079, 1.685896, 1, 1, 1, 1, 1,
0.1392005, 1.894679, 1.326503, 1, 1, 1, 1, 1,
0.145504, -0.2615625, 3.417639, 1, 1, 1, 1, 1,
0.1477986, -1.815848, 1.240044, 1, 1, 1, 1, 1,
0.14973, -1.155311, 1.449992, 0, 0, 1, 1, 1,
0.1499693, 1.272496, 0.9325629, 1, 0, 0, 1, 1,
0.1499999, 0.03154019, 0.3725148, 1, 0, 0, 1, 1,
0.1507963, -0.6034944, 3.583087, 1, 0, 0, 1, 1,
0.1516769, -1.229549, 3.459989, 1, 0, 0, 1, 1,
0.154144, -0.7448192, 2.011171, 1, 0, 0, 1, 1,
0.15462, -0.18467, 3.698448, 0, 0, 0, 1, 1,
0.1580866, -0.795112, 2.22756, 0, 0, 0, 1, 1,
0.1608788, 0.07910612, 1.767322, 0, 0, 0, 1, 1,
0.1613509, 1.215421, 0.526661, 0, 0, 0, 1, 1,
0.1621179, -1.785887, 4.151308, 0, 0, 0, 1, 1,
0.1631238, 0.923501, 0.8243961, 0, 0, 0, 1, 1,
0.1635834, 0.5162572, -0.6412599, 0, 0, 0, 1, 1,
0.1662522, 0.6939778, 0.7186226, 1, 1, 1, 1, 1,
0.1699769, 0.01218502, 2.227292, 1, 1, 1, 1, 1,
0.170383, -0.1680401, 2.214711, 1, 1, 1, 1, 1,
0.1710047, -0.7269278, 2.66471, 1, 1, 1, 1, 1,
0.1715104, 0.7277948, -0.4833654, 1, 1, 1, 1, 1,
0.1731769, 0.1951463, 2.326424, 1, 1, 1, 1, 1,
0.1732437, -1.565025, 3.094238, 1, 1, 1, 1, 1,
0.173441, 0.1413497, -0.02554821, 1, 1, 1, 1, 1,
0.1739728, 1.079305, 0.6418796, 1, 1, 1, 1, 1,
0.1758714, -0.5068867, 2.843228, 1, 1, 1, 1, 1,
0.1762753, 2.029686, 0.4149698, 1, 1, 1, 1, 1,
0.1764351, 0.00584622, 3.05857, 1, 1, 1, 1, 1,
0.1822092, 0.9597965, -0.5011575, 1, 1, 1, 1, 1,
0.1858934, -0.1934615, 3.237376, 1, 1, 1, 1, 1,
0.1922246, 0.4970234, 0.189494, 1, 1, 1, 1, 1,
0.1935452, -0.6039901, 5.786028, 0, 0, 1, 1, 1,
0.1963057, 0.7220522, 0.009614662, 1, 0, 0, 1, 1,
0.2020569, 0.9883186, 0.7858654, 1, 0, 0, 1, 1,
0.2034612, 0.1968466, 1.668053, 1, 0, 0, 1, 1,
0.2044053, 0.7114789, -0.04441686, 1, 0, 0, 1, 1,
0.2046339, -0.3525111, 1.348855, 1, 0, 0, 1, 1,
0.2105257, 0.7708524, 0.3661279, 0, 0, 0, 1, 1,
0.2124932, 0.4672583, 1.974761, 0, 0, 0, 1, 1,
0.2130741, -0.2741183, 2.798448, 0, 0, 0, 1, 1,
0.2156481, 0.3612319, 1.127034, 0, 0, 0, 1, 1,
0.2184736, -0.5105926, 2.619526, 0, 0, 0, 1, 1,
0.2225188, -0.04110964, 1.828816, 0, 0, 0, 1, 1,
0.2237198, -0.6209969, 1.846268, 0, 0, 0, 1, 1,
0.2237401, -0.3371837, 4.759902, 1, 1, 1, 1, 1,
0.2287864, 0.4212986, 0.5435267, 1, 1, 1, 1, 1,
0.239457, -1.688572, 2.716177, 1, 1, 1, 1, 1,
0.2413726, -1.149927, 4.240687, 1, 1, 1, 1, 1,
0.2433463, -0.6293006, 2.289906, 1, 1, 1, 1, 1,
0.2448227, 2.040815, 0.1252027, 1, 1, 1, 1, 1,
0.246454, 1.14946, -0.5876862, 1, 1, 1, 1, 1,
0.2502137, 0.818261, -1.548592, 1, 1, 1, 1, 1,
0.2509481, -0.5122573, 4.232069, 1, 1, 1, 1, 1,
0.2509585, -0.6879471, 3.978033, 1, 1, 1, 1, 1,
0.2547722, 0.9195048, -0.3124021, 1, 1, 1, 1, 1,
0.2554276, -0.5189602, 3.143365, 1, 1, 1, 1, 1,
0.2567349, 0.2516627, 0.008582156, 1, 1, 1, 1, 1,
0.2577122, -0.1110952, 3.452834, 1, 1, 1, 1, 1,
0.2605571, -0.3864248, 1.833598, 1, 1, 1, 1, 1,
0.2628389, 1.170873, 0.596194, 0, 0, 1, 1, 1,
0.2641268, -0.3280791, 2.746233, 1, 0, 0, 1, 1,
0.2659888, 0.7016784, -1.01413, 1, 0, 0, 1, 1,
0.2681117, 0.4246131, -1.743488, 1, 0, 0, 1, 1,
0.2709735, -0.6399005, 1.933799, 1, 0, 0, 1, 1,
0.2746838, 0.7306921, -0.5232013, 1, 0, 0, 1, 1,
0.2812495, 0.4904932, -0.008023907, 0, 0, 0, 1, 1,
0.2859708, -1.75195, 3.075788, 0, 0, 0, 1, 1,
0.2895628, 0.8053561, 0.8136563, 0, 0, 0, 1, 1,
0.2910405, -0.1345617, 2.666938, 0, 0, 0, 1, 1,
0.291368, -0.7834795, 2.487169, 0, 0, 0, 1, 1,
0.2971255, -1.445491, 4.40365, 0, 0, 0, 1, 1,
0.3038184, -0.07113801, 2.595729, 0, 0, 0, 1, 1,
0.3070394, -0.1560342, 0.3135678, 1, 1, 1, 1, 1,
0.3070755, -0.5560381, 0.819957, 1, 1, 1, 1, 1,
0.3077423, 0.5378161, -1.42592, 1, 1, 1, 1, 1,
0.3088693, -1.615764, 2.02475, 1, 1, 1, 1, 1,
0.3095087, 1.457381, 0.992013, 1, 1, 1, 1, 1,
0.3100997, 1.144654, -0.5013993, 1, 1, 1, 1, 1,
0.312714, 1.052403, 1.135805, 1, 1, 1, 1, 1,
0.3137307, -0.3164644, 2.77277, 1, 1, 1, 1, 1,
0.3154812, 0.8550822, 0.406126, 1, 1, 1, 1, 1,
0.3156337, 1.34788, -0.390633, 1, 1, 1, 1, 1,
0.3210854, 0.06210762, 1.290009, 1, 1, 1, 1, 1,
0.3226461, 1.732165, 0.8294441, 1, 1, 1, 1, 1,
0.3228707, -1.509249, 1.037959, 1, 1, 1, 1, 1,
0.3270648, -0.1855065, 0.957173, 1, 1, 1, 1, 1,
0.328311, -1.818545, 3.144806, 1, 1, 1, 1, 1,
0.3297837, 0.3385724, 0.5319828, 0, 0, 1, 1, 1,
0.3300415, 0.4224944, -0.3450744, 1, 0, 0, 1, 1,
0.3352177, 0.05622968, 2.995832, 1, 0, 0, 1, 1,
0.3362609, -1.885411, 1.872848, 1, 0, 0, 1, 1,
0.3369181, 1.420473, -1.337802, 1, 0, 0, 1, 1,
0.3372734, 0.4741321, 1.488744, 1, 0, 0, 1, 1,
0.3444813, 0.7864702, 1.904151, 0, 0, 0, 1, 1,
0.3451703, -0.6059825, 2.279469, 0, 0, 0, 1, 1,
0.346324, -1.115233, 2.924793, 0, 0, 0, 1, 1,
0.3505039, -0.5027053, 2.501991, 0, 0, 0, 1, 1,
0.3506113, 0.157073, 2.218547, 0, 0, 0, 1, 1,
0.3577284, 1.481935, 0.6161174, 0, 0, 0, 1, 1,
0.3579997, -0.3564077, 2.086399, 0, 0, 0, 1, 1,
0.3633184, 2.628759, 0.6599391, 1, 1, 1, 1, 1,
0.3648104, -0.2622772, 2.738837, 1, 1, 1, 1, 1,
0.3649606, 0.1201872, 0.4295957, 1, 1, 1, 1, 1,
0.3668597, 0.5795152, 0.7002872, 1, 1, 1, 1, 1,
0.3699151, 1.373209, 1.450593, 1, 1, 1, 1, 1,
0.3722952, 0.9688641, 2.321177, 1, 1, 1, 1, 1,
0.3723918, -0.4657125, 3.410324, 1, 1, 1, 1, 1,
0.3743833, 1.102677, 0.07555876, 1, 1, 1, 1, 1,
0.3764289, -1.410002, 2.081808, 1, 1, 1, 1, 1,
0.3774042, 0.8101042, -0.7714813, 1, 1, 1, 1, 1,
0.3782561, -0.4734829, 0.3761801, 1, 1, 1, 1, 1,
0.3796448, 0.9817061, 0.3000997, 1, 1, 1, 1, 1,
0.3817808, -0.7157653, 2.012081, 1, 1, 1, 1, 1,
0.3888867, 0.611858, -0.1525999, 1, 1, 1, 1, 1,
0.3932616, 0.8535897, 0.1595751, 1, 1, 1, 1, 1,
0.3943734, 1.847026, -1.300304, 0, 0, 1, 1, 1,
0.395223, -0.7749164, 2.116243, 1, 0, 0, 1, 1,
0.397498, -1.115928, 4.113457, 1, 0, 0, 1, 1,
0.3977392, 0.5916882, 0.1550592, 1, 0, 0, 1, 1,
0.4032334, -1.192741, 2.663763, 1, 0, 0, 1, 1,
0.4075986, 1.249873, -1.182529, 1, 0, 0, 1, 1,
0.4080286, 0.4900649, 0.9439483, 0, 0, 0, 1, 1,
0.4143288, -0.3526756, 2.643797, 0, 0, 0, 1, 1,
0.4184411, 0.009887616, 2.295107, 0, 0, 0, 1, 1,
0.419286, -0.9019126, 3.120337, 0, 0, 0, 1, 1,
0.4221644, -0.7919837, 2.28762, 0, 0, 0, 1, 1,
0.4313767, -0.5341613, 2.641205, 0, 0, 0, 1, 1,
0.4347842, -0.2507271, 1.459537, 0, 0, 0, 1, 1,
0.4420685, -1.559743, 2.729758, 1, 1, 1, 1, 1,
0.4455366, 0.8837332, 1.225453, 1, 1, 1, 1, 1,
0.4506743, 0.2530993, 1.534803, 1, 1, 1, 1, 1,
0.4507105, -0.1089042, 2.329265, 1, 1, 1, 1, 1,
0.4512031, -0.3561282, 2.884383, 1, 1, 1, 1, 1,
0.4512772, 0.3100217, 2.165171, 1, 1, 1, 1, 1,
0.4524415, 1.542344, 0.4652038, 1, 1, 1, 1, 1,
0.4531104, 1.84353, 0.827625, 1, 1, 1, 1, 1,
0.4557115, -0.5542324, 1.490722, 1, 1, 1, 1, 1,
0.4583266, -1.97508, 2.441266, 1, 1, 1, 1, 1,
0.4631366, 1.83269, -0.03384504, 1, 1, 1, 1, 1,
0.4641587, -1.084575, 1.809665, 1, 1, 1, 1, 1,
0.4656327, 0.8304576, -0.4713721, 1, 1, 1, 1, 1,
0.468488, 0.1994297, 1.014145, 1, 1, 1, 1, 1,
0.4688383, 0.1556863, -0.004490693, 1, 1, 1, 1, 1,
0.4714598, 2.311235, -1.039697, 0, 0, 1, 1, 1,
0.4752946, -0.7150362, 2.545442, 1, 0, 0, 1, 1,
0.4788642, 0.6015848, 0.4538589, 1, 0, 0, 1, 1,
0.4789178, 0.7523533, 0.06610775, 1, 0, 0, 1, 1,
0.479545, 1.003342, -0.2204261, 1, 0, 0, 1, 1,
0.4812522, 0.3052907, 3.058624, 1, 0, 0, 1, 1,
0.4856691, -1.350371, 2.03729, 0, 0, 0, 1, 1,
0.4892983, 0.8749991, 3.223944, 0, 0, 0, 1, 1,
0.4952689, -0.3093448, 2.272028, 0, 0, 0, 1, 1,
0.502099, -0.1878405, 1.561215, 0, 0, 0, 1, 1,
0.5022445, -1.146761, 1.932636, 0, 0, 0, 1, 1,
0.5037587, -0.6432391, 2.2458, 0, 0, 0, 1, 1,
0.5045391, 0.0001665767, 2.185827, 0, 0, 0, 1, 1,
0.5065172, -0.746348, 1.730418, 1, 1, 1, 1, 1,
0.5210926, -0.4165796, 4.165291, 1, 1, 1, 1, 1,
0.5215456, 1.396122, 0.1746654, 1, 1, 1, 1, 1,
0.5246086, 0.3008791, 2.452, 1, 1, 1, 1, 1,
0.526122, -0.4510751, 2.993344, 1, 1, 1, 1, 1,
0.532952, 0.09889568, 0.6953591, 1, 1, 1, 1, 1,
0.5376621, -1.737885, 5.600822, 1, 1, 1, 1, 1,
0.5385112, -1.523996, 1.437312, 1, 1, 1, 1, 1,
0.5393616, -0.1986223, 3.844053, 1, 1, 1, 1, 1,
0.5406177, 0.3242703, 2.989755, 1, 1, 1, 1, 1,
0.5476329, 0.6032056, -0.4148736, 1, 1, 1, 1, 1,
0.5519443, 0.7675166, -2.006835, 1, 1, 1, 1, 1,
0.55451, -0.5661121, 1.711511, 1, 1, 1, 1, 1,
0.5629288, -1.091643, 2.704403, 1, 1, 1, 1, 1,
0.5698838, 0.1536185, 1.286758, 1, 1, 1, 1, 1,
0.5737259, -0.5825894, 2.490144, 0, 0, 1, 1, 1,
0.5749705, -1.800862, 2.295911, 1, 0, 0, 1, 1,
0.576857, -1.631423, 3.003056, 1, 0, 0, 1, 1,
0.5770752, 1.625489, 1.693132, 1, 0, 0, 1, 1,
0.5772589, 1.076913, -1.486181, 1, 0, 0, 1, 1,
0.5774948, 1.13507, 0.2188998, 1, 0, 0, 1, 1,
0.5775072, -0.1020192, 0.02882829, 0, 0, 0, 1, 1,
0.5779231, -1.708881, 3.879793, 0, 0, 0, 1, 1,
0.5787246, -1.037839, 1.183107, 0, 0, 0, 1, 1,
0.5828817, 0.3314604, 1.002791, 0, 0, 0, 1, 1,
0.5847562, 1.878451, -0.05629611, 0, 0, 0, 1, 1,
0.5854432, 0.2509376, 2.211316, 0, 0, 0, 1, 1,
0.586438, 1.208578, -1.196797, 0, 0, 0, 1, 1,
0.5922623, -1.737525, 1.582367, 1, 1, 1, 1, 1,
0.6047996, 0.07864315, 1.449308, 1, 1, 1, 1, 1,
0.6063372, 0.9474587, 0.7427326, 1, 1, 1, 1, 1,
0.607281, 0.2586887, 1.816753, 1, 1, 1, 1, 1,
0.6126468, 0.8182822, -0.2702785, 1, 1, 1, 1, 1,
0.619298, -0.2992387, 0.8703146, 1, 1, 1, 1, 1,
0.6208423, 1.351139, 1.468178, 1, 1, 1, 1, 1,
0.6217636, -1.008862, 3.187732, 1, 1, 1, 1, 1,
0.6219977, -1.066032, 3.244043, 1, 1, 1, 1, 1,
0.624487, 0.9329599, 1.409284, 1, 1, 1, 1, 1,
0.6269589, 1.684165, 2.195262, 1, 1, 1, 1, 1,
0.6297239, -0.8069478, 2.753724, 1, 1, 1, 1, 1,
0.6311781, 1.158944, 1.931484, 1, 1, 1, 1, 1,
0.6314391, 0.473547, 3.619711, 1, 1, 1, 1, 1,
0.6352286, 1.766513, 0.9819663, 1, 1, 1, 1, 1,
0.636042, 0.1004036, 2.272425, 0, 0, 1, 1, 1,
0.6365409, 0.5316343, -1.374858, 1, 0, 0, 1, 1,
0.6381045, -0.9304541, 2.991899, 1, 0, 0, 1, 1,
0.6383017, 0.313577, 1.47436, 1, 0, 0, 1, 1,
0.6441363, -0.6197102, 1.57099, 1, 0, 0, 1, 1,
0.6455814, 0.4654355, 0.2207989, 1, 0, 0, 1, 1,
0.6459186, 0.08838762, -0.373419, 0, 0, 0, 1, 1,
0.6464025, 0.4401176, 1.816704, 0, 0, 0, 1, 1,
0.6466169, -0.622162, 2.956537, 0, 0, 0, 1, 1,
0.648361, 0.7029725, 0.26841, 0, 0, 0, 1, 1,
0.6514001, -0.4862482, 1.811434, 0, 0, 0, 1, 1,
0.6545237, 0.6236445, 1.909372, 0, 0, 0, 1, 1,
0.6596541, -2.24381, 2.822499, 0, 0, 0, 1, 1,
0.6597973, 0.6118961, 1.262618, 1, 1, 1, 1, 1,
0.6602095, 0.9372445, 0.3714969, 1, 1, 1, 1, 1,
0.6633068, -0.570821, 2.984329, 1, 1, 1, 1, 1,
0.6714216, -0.6534874, 1.045025, 1, 1, 1, 1, 1,
0.6737852, 0.1682049, 1.37824, 1, 1, 1, 1, 1,
0.6740355, 0.5653309, 0.8502247, 1, 1, 1, 1, 1,
0.6750301, 1.143519, -1.530268, 1, 1, 1, 1, 1,
0.6762856, -0.6118304, 2.119263, 1, 1, 1, 1, 1,
0.6777836, 0.5697784, 1.231752, 1, 1, 1, 1, 1,
0.6785865, 2.304034, 1.941839, 1, 1, 1, 1, 1,
0.6809742, 0.5787581, 1.938197, 1, 1, 1, 1, 1,
0.6812188, -1.259685, 2.723991, 1, 1, 1, 1, 1,
0.6822044, 1.34599, 0.495563, 1, 1, 1, 1, 1,
0.6825954, 0.2253574, -0.1499819, 1, 1, 1, 1, 1,
0.6843897, 1.617637, 0.45826, 1, 1, 1, 1, 1,
0.6845933, 0.6051255, 0.8896605, 0, 0, 1, 1, 1,
0.692415, -1.888804, 1.031916, 1, 0, 0, 1, 1,
0.6994179, 1.174808, 1.541221, 1, 0, 0, 1, 1,
0.7064537, 0.02112192, 2.322365, 1, 0, 0, 1, 1,
0.7083492, 0.08383087, 1.257048, 1, 0, 0, 1, 1,
0.7120451, -0.4640778, 1.01956, 1, 0, 0, 1, 1,
0.7126355, -0.6757624, 0.1501962, 0, 0, 0, 1, 1,
0.717383, -1.110712, 3.85277, 0, 0, 0, 1, 1,
0.7197362, -0.4934801, 3.166809, 0, 0, 0, 1, 1,
0.7241122, 0.821955, 0.4604776, 0, 0, 0, 1, 1,
0.7280645, 0.3233824, 1.170335, 0, 0, 0, 1, 1,
0.7293175, 0.9079252, 1.473382, 0, 0, 0, 1, 1,
0.7334314, 0.2713089, -0.7901506, 0, 0, 0, 1, 1,
0.7386052, 0.6319319, 1.505683, 1, 1, 1, 1, 1,
0.7421463, 0.9363332, -1.034204, 1, 1, 1, 1, 1,
0.7426065, -0.7428689, 3.196383, 1, 1, 1, 1, 1,
0.7434054, 1.621191, 1.285445, 1, 1, 1, 1, 1,
0.7463216, 0.9846498, 0.1840441, 1, 1, 1, 1, 1,
0.749474, -0.2142159, 0.01098012, 1, 1, 1, 1, 1,
0.7515836, 0.8957515, 1.63966, 1, 1, 1, 1, 1,
0.7525709, -0.1478869, 0.7652079, 1, 1, 1, 1, 1,
0.7607735, -0.6928259, 1.680391, 1, 1, 1, 1, 1,
0.7608827, 0.9190768, 2.138732, 1, 1, 1, 1, 1,
0.7618036, 1.521118, 0.8880152, 1, 1, 1, 1, 1,
0.7635366, -0.3956338, 0.430622, 1, 1, 1, 1, 1,
0.7649823, -1.319917, 2.234553, 1, 1, 1, 1, 1,
0.765817, -0.9871681, 1.241923, 1, 1, 1, 1, 1,
0.7718994, 0.4513278, 1.369123, 1, 1, 1, 1, 1,
0.7768998, -0.7838622, 2.945046, 0, 0, 1, 1, 1,
0.7773885, 2.546964, 1.224637, 1, 0, 0, 1, 1,
0.7817265, 1.038769, 1.404377, 1, 0, 0, 1, 1,
0.787738, 0.6028492, 2.067821, 1, 0, 0, 1, 1,
0.7906405, 1.33652, 1.480731, 1, 0, 0, 1, 1,
0.7915026, 0.2485224, 2.701064, 1, 0, 0, 1, 1,
0.7990965, -0.2984849, 1.653039, 0, 0, 0, 1, 1,
0.8070838, -0.714175, 2.898974, 0, 0, 0, 1, 1,
0.8091869, 0.05986712, 1.378797, 0, 0, 0, 1, 1,
0.8126329, 0.1251829, 1.921162, 0, 0, 0, 1, 1,
0.8138869, -0.08310916, 1.107015, 0, 0, 0, 1, 1,
0.8142438, -1.530146, 1.804665, 0, 0, 0, 1, 1,
0.819584, -0.7213852, 1.790861, 0, 0, 0, 1, 1,
0.8197936, 0.681552, 0.3146789, 1, 1, 1, 1, 1,
0.8239065, 1.558441, 0.06755922, 1, 1, 1, 1, 1,
0.8241701, 1.357869, 0.4247668, 1, 1, 1, 1, 1,
0.8249801, 3.313931, 0.2540947, 1, 1, 1, 1, 1,
0.8323347, 1.37328, -0.06003586, 1, 1, 1, 1, 1,
0.8374752, 1.056723, 0.8770151, 1, 1, 1, 1, 1,
0.8390605, 0.2819476, -0.3639631, 1, 1, 1, 1, 1,
0.8452907, -0.2764173, 2.816556, 1, 1, 1, 1, 1,
0.8466549, 0.555064, 0.4125192, 1, 1, 1, 1, 1,
0.8509801, 0.6470411, 1.692966, 1, 1, 1, 1, 1,
0.8550578, -0.1037851, 0.6550114, 1, 1, 1, 1, 1,
0.8551586, 0.08870095, 0.3312219, 1, 1, 1, 1, 1,
0.8553134, 2.041351, -2.131119, 1, 1, 1, 1, 1,
0.8570722, 0.6442533, 1.496016, 1, 1, 1, 1, 1,
0.8689162, 0.658288, -0.005478641, 1, 1, 1, 1, 1,
0.8726637, -0.2109813, 1.639736, 0, 0, 1, 1, 1,
0.8749939, 1.025929, 1.052443, 1, 0, 0, 1, 1,
0.8756076, 0.3286626, 0.659058, 1, 0, 0, 1, 1,
0.8783907, 0.1129392, 1.032802, 1, 0, 0, 1, 1,
0.8861793, 0.5699226, 0.1598717, 1, 0, 0, 1, 1,
0.8867108, -1.419943, 3.816614, 1, 0, 0, 1, 1,
0.88739, -1.169122, 2.076074, 0, 0, 0, 1, 1,
0.8904613, 0.2234394, 2.02135, 0, 0, 0, 1, 1,
0.8920644, 0.1271315, 1.535385, 0, 0, 0, 1, 1,
0.892271, 1.356273, -0.04522455, 0, 0, 0, 1, 1,
0.8956714, -0.2948465, 1.612269, 0, 0, 0, 1, 1,
0.901282, 0.6899221, 0.6979132, 0, 0, 0, 1, 1,
0.9117141, 0.3026628, 0.7880641, 0, 0, 0, 1, 1,
0.9159282, -2.157934, 1.370348, 1, 1, 1, 1, 1,
0.9168188, -0.422762, 1.208075, 1, 1, 1, 1, 1,
0.9208958, -0.4504748, 0.2663653, 1, 1, 1, 1, 1,
0.9217231, -1.293252, 1.400484, 1, 1, 1, 1, 1,
0.9311615, 1.06625, -0.4044617, 1, 1, 1, 1, 1,
0.9316498, 0.4124691, -0.3699498, 1, 1, 1, 1, 1,
0.9361185, 1.644269, 0.7395031, 1, 1, 1, 1, 1,
0.9464712, 0.3265054, 1.442755, 1, 1, 1, 1, 1,
0.9503646, 0.3506344, 2.308008, 1, 1, 1, 1, 1,
0.9529216, 0.776834, 0.7659502, 1, 1, 1, 1, 1,
0.9571759, -0.08581089, 0.2077897, 1, 1, 1, 1, 1,
0.9607344, 0.08893465, 0.9939492, 1, 1, 1, 1, 1,
0.9611418, 0.3357477, 2.750365, 1, 1, 1, 1, 1,
0.9624352, 1.420259, 2.147412, 1, 1, 1, 1, 1,
0.9647335, 0.1626411, 2.265378, 1, 1, 1, 1, 1,
0.9662489, -1.331883, 1.553243, 0, 0, 1, 1, 1,
0.9667097, -1.558127, 0.9216821, 1, 0, 0, 1, 1,
0.971257, 0.9630558, 2.871468, 1, 0, 0, 1, 1,
0.9737692, -0.1325587, 0.7006478, 1, 0, 0, 1, 1,
0.9745439, 0.3646051, 2.114475, 1, 0, 0, 1, 1,
0.9832553, -1.833427, 2.652935, 1, 0, 0, 1, 1,
0.9849917, -0.4934775, 0.994311, 0, 0, 0, 1, 1,
0.9950585, -0.5463433, -0.1796221, 0, 0, 0, 1, 1,
0.9950999, -0.6067026, 0.7164697, 0, 0, 0, 1, 1,
1.00741, -0.2307008, 1.485858, 0, 0, 0, 1, 1,
1.00812, -0.4517662, 3.395117, 0, 0, 0, 1, 1,
1.008288, -0.2592096, 1.258745, 0, 0, 0, 1, 1,
1.009257, 0.3708021, 0.6416404, 0, 0, 0, 1, 1,
1.01482, -1.95142, 2.246374, 1, 1, 1, 1, 1,
1.017635, 1.163892, 1.129764, 1, 1, 1, 1, 1,
1.022994, -0.6997755, 3.958007, 1, 1, 1, 1, 1,
1.026797, 0.8787718, -0.4603064, 1, 1, 1, 1, 1,
1.035351, 0.817097, -0.09435787, 1, 1, 1, 1, 1,
1.035355, 0.008612378, 1.292444, 1, 1, 1, 1, 1,
1.037632, -0.2844561, 3.529628, 1, 1, 1, 1, 1,
1.038129, 1.532841, 0.04584819, 1, 1, 1, 1, 1,
1.048174, 0.04853479, 2.825676, 1, 1, 1, 1, 1,
1.053346, 0.8595398, 1.390438, 1, 1, 1, 1, 1,
1.058232, -0.5382718, 3.447267, 1, 1, 1, 1, 1,
1.058991, 0.4089576, 0.8435498, 1, 1, 1, 1, 1,
1.060042, -0.1822683, 1.046034, 1, 1, 1, 1, 1,
1.066967, -0.9457405, 2.024697, 1, 1, 1, 1, 1,
1.071141, -0.5424607, 2.38595, 1, 1, 1, 1, 1,
1.073042, 1.85791, 1.422768, 0, 0, 1, 1, 1,
1.078796, 1.774898, 2.255244, 1, 0, 0, 1, 1,
1.079391, 0.6661576, 0.2544841, 1, 0, 0, 1, 1,
1.080379, 0.8033358, -0.0509725, 1, 0, 0, 1, 1,
1.087673, -0.05006894, 2.947815, 1, 0, 0, 1, 1,
1.089467, 0.2576395, 2.18634, 1, 0, 0, 1, 1,
1.096627, 0.8276297, 1.005082, 0, 0, 0, 1, 1,
1.099162, 0.3007761, 3.169529, 0, 0, 0, 1, 1,
1.110721, 0.09950083, 2.111882, 0, 0, 0, 1, 1,
1.12035, 0.05759417, 2.212721, 0, 0, 0, 1, 1,
1.12176, 0.5477574, 0.7990548, 0, 0, 0, 1, 1,
1.123657, 0.1045128, 0.7798057, 0, 0, 0, 1, 1,
1.133541, 0.838342, 0.6680785, 0, 0, 0, 1, 1,
1.140301, 0.004675591, 2.4782, 1, 1, 1, 1, 1,
1.14309, 0.04648945, -0.4488662, 1, 1, 1, 1, 1,
1.143728, 0.06269647, 3.428515, 1, 1, 1, 1, 1,
1.148859, -1.447921, 3.416782, 1, 1, 1, 1, 1,
1.14895, -0.01099089, 2.039049, 1, 1, 1, 1, 1,
1.151415, -1.074625, 2.72876, 1, 1, 1, 1, 1,
1.152611, 1.126784, 1.309233, 1, 1, 1, 1, 1,
1.153218, -1.202569, 2.746077, 1, 1, 1, 1, 1,
1.158872, 0.2293739, 1.165831, 1, 1, 1, 1, 1,
1.159291, 0.04996271, 2.148464, 1, 1, 1, 1, 1,
1.16435, 0.2342998, 1.569956, 1, 1, 1, 1, 1,
1.1754, -1.244939, 2.361459, 1, 1, 1, 1, 1,
1.181892, 1.251712, 0.4601506, 1, 1, 1, 1, 1,
1.183426, -1.085653, 3.132491, 1, 1, 1, 1, 1,
1.189106, -0.3183172, 3.578532, 1, 1, 1, 1, 1,
1.189633, -0.9910932, 2.890397, 0, 0, 1, 1, 1,
1.197411, -0.09728897, 1.450865, 1, 0, 0, 1, 1,
1.210473, -1.370973, 1.17121, 1, 0, 0, 1, 1,
1.211695, -0.562089, 2.537476, 1, 0, 0, 1, 1,
1.216522, -0.7018188, 1.630289, 1, 0, 0, 1, 1,
1.232561, 0.5249779, 0.5736079, 1, 0, 0, 1, 1,
1.234211, 1.490721, -0.2136009, 0, 0, 0, 1, 1,
1.248399, 1.058622, 2.244394, 0, 0, 0, 1, 1,
1.249513, -0.1455633, 1.819889, 0, 0, 0, 1, 1,
1.266237, 0.7724036, 1.476551, 0, 0, 0, 1, 1,
1.275013, -0.1448141, 1.326643, 0, 0, 0, 1, 1,
1.277861, 1.249669, 0.4457971, 0, 0, 0, 1, 1,
1.282992, 1.154116, 1.10866, 0, 0, 0, 1, 1,
1.290249, -1.08353, 0.5091392, 1, 1, 1, 1, 1,
1.303206, 0.1748188, 1.751456, 1, 1, 1, 1, 1,
1.313823, 0.2253154, 3.839109, 1, 1, 1, 1, 1,
1.316737, 0.7898193, 0.7156106, 1, 1, 1, 1, 1,
1.32142, 2.157224, 1.011742, 1, 1, 1, 1, 1,
1.325092, 0.773816, 2.562732, 1, 1, 1, 1, 1,
1.325952, -0.1530085, 0.1751931, 1, 1, 1, 1, 1,
1.332928, 0.8827255, -0.1025233, 1, 1, 1, 1, 1,
1.334252, 0.1495897, 0.9503723, 1, 1, 1, 1, 1,
1.337611, -0.4957026, 0.9221629, 1, 1, 1, 1, 1,
1.340807, 0.6853481, 0.1195024, 1, 1, 1, 1, 1,
1.342419, 0.6963552, 1.698063, 1, 1, 1, 1, 1,
1.361382, 0.7687748, 1.309027, 1, 1, 1, 1, 1,
1.361898, -0.2804671, 2.387076, 1, 1, 1, 1, 1,
1.375273, 1.452045, 1.690565, 1, 1, 1, 1, 1,
1.38023, -1.196828, 0.905301, 0, 0, 1, 1, 1,
1.398237, 1.395552, 0.3651301, 1, 0, 0, 1, 1,
1.39869, 0.1671162, 0.8872349, 1, 0, 0, 1, 1,
1.398777, -1.3705, 2.720293, 1, 0, 0, 1, 1,
1.407431, 1.266947, -0.4506857, 1, 0, 0, 1, 1,
1.411357, 0.2198626, 0.2087187, 1, 0, 0, 1, 1,
1.420164, 0.5399253, 0.6933957, 0, 0, 0, 1, 1,
1.429494, 1.653641, 0.706574, 0, 0, 0, 1, 1,
1.461301, 1.457582, 0.9012758, 0, 0, 0, 1, 1,
1.465852, 0.2360695, -0.02858588, 0, 0, 0, 1, 1,
1.472157, 1.267607, 0.3014017, 0, 0, 0, 1, 1,
1.479426, -0.1188854, 1.07482, 0, 0, 0, 1, 1,
1.480328, 0.7818142, 1.359666, 0, 0, 0, 1, 1,
1.493215, -0.2175822, 0.9840602, 1, 1, 1, 1, 1,
1.501793, 0.4959846, -0.3202184, 1, 1, 1, 1, 1,
1.506209, 0.261406, 0.8415004, 1, 1, 1, 1, 1,
1.508752, -0.9162111, 1.58491, 1, 1, 1, 1, 1,
1.50953, -0.7215886, 0.5197507, 1, 1, 1, 1, 1,
1.515979, 0.3767663, 1.596313, 1, 1, 1, 1, 1,
1.524954, -0.1652243, 1.389917, 1, 1, 1, 1, 1,
1.536798, 0.9438049, -0.2597541, 1, 1, 1, 1, 1,
1.540144, 0.07146774, 1.776469, 1, 1, 1, 1, 1,
1.546482, -1.031925, 3.58301, 1, 1, 1, 1, 1,
1.553068, 0.6070954, 2.380763, 1, 1, 1, 1, 1,
1.579209, -0.3974913, 1.182725, 1, 1, 1, 1, 1,
1.588256, 0.6822322, 2.101482, 1, 1, 1, 1, 1,
1.58838, 0.2089731, 1.723475, 1, 1, 1, 1, 1,
1.595203, 0.1044382, 2.001599, 1, 1, 1, 1, 1,
1.604995, -0.6917524, 3.344773, 0, 0, 1, 1, 1,
1.607938, -0.2826686, 1.617606, 1, 0, 0, 1, 1,
1.613053, -0.1970801, 2.162213, 1, 0, 0, 1, 1,
1.63636, 0.4568352, 0.9847907, 1, 0, 0, 1, 1,
1.642267, -0.787806, 3.333278, 1, 0, 0, 1, 1,
1.646277, -0.3436072, 1.674862, 1, 0, 0, 1, 1,
1.646505, -0.5506451, 2.635954, 0, 0, 0, 1, 1,
1.689615, -0.3390534, 1.544478, 0, 0, 0, 1, 1,
1.691165, 0.9465591, 1.492777, 0, 0, 0, 1, 1,
1.697206, 0.0551604, 0.3434134, 0, 0, 0, 1, 1,
1.699368, -0.6550018, 3.218171, 0, 0, 0, 1, 1,
1.702309, 0.9767191, -0.4161589, 0, 0, 0, 1, 1,
1.709932, 0.8780801, 0.3514012, 0, 0, 0, 1, 1,
1.745866, 0.2998651, 0.9598501, 1, 1, 1, 1, 1,
1.751678, 0.5066242, 0.9013602, 1, 1, 1, 1, 1,
1.794245, 0.2773553, 1.604111, 1, 1, 1, 1, 1,
1.795543, -1.526449, 2.311782, 1, 1, 1, 1, 1,
1.841404, 0.9064522, 0.4622209, 1, 1, 1, 1, 1,
1.858029, 0.04078526, 1.852555, 1, 1, 1, 1, 1,
1.864148, -0.1974545, 2.000468, 1, 1, 1, 1, 1,
1.904736, -0.4628478, 1.147022, 1, 1, 1, 1, 1,
1.905861, 1.020882, 1.822822, 1, 1, 1, 1, 1,
1.923383, -0.004282598, 1.043249, 1, 1, 1, 1, 1,
1.939607, 0.5668873, 1.182657, 1, 1, 1, 1, 1,
1.940104, -0.4090482, 0.6115597, 1, 1, 1, 1, 1,
1.943168, 1.375786, 1.824688, 1, 1, 1, 1, 1,
1.944579, 0.3573093, 2.876963, 1, 1, 1, 1, 1,
2.012471, 0.3105862, -0.1981338, 1, 1, 1, 1, 1,
2.04792, 1.742701, 1.443483, 0, 0, 1, 1, 1,
2.050023, 0.5852809, 0.4812752, 1, 0, 0, 1, 1,
2.05808, 0.08916527, 0.903765, 1, 0, 0, 1, 1,
2.063173, 1.016093, 1.084236, 1, 0, 0, 1, 1,
2.079671, -0.7761682, 0.7835262, 1, 0, 0, 1, 1,
2.104211, 1.043989, 0.6504884, 1, 0, 0, 1, 1,
2.111741, -0.2835391, -0.2362968, 0, 0, 0, 1, 1,
2.15968, 0.9957896, 0.4938719, 0, 0, 0, 1, 1,
2.168233, 0.2684123, 1.570918, 0, 0, 0, 1, 1,
2.170798, 1.743156, -0.3050636, 0, 0, 0, 1, 1,
2.178796, 0.2912542, 2.240187, 0, 0, 0, 1, 1,
2.481578, -0.6359863, 0.1327572, 0, 0, 0, 1, 1,
2.51127, -0.3708028, 1.448516, 0, 0, 0, 1, 1,
2.526367, -0.007366529, 1.458093, 1, 1, 1, 1, 1,
2.565528, -1.045116, 1.489309, 1, 1, 1, 1, 1,
2.56665, 0.07911684, 2.295078, 1, 1, 1, 1, 1,
2.736916, -0.9491938, 1.722891, 1, 1, 1, 1, 1,
2.813532, 0.9238501, 2.224731, 1, 1, 1, 1, 1,
2.990993, -0.0717385, 1.306197, 1, 1, 1, 1, 1,
3.137416, 2.648575, 1.517763, 1, 1, 1, 1, 1
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
var radius = 9.747621;
var distance = 34.2381;
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
mvMatrix.translate( -0.07423747, 0.1100664, -0.271081 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2381);
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
