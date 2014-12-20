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
-3.098614, -2.216149, -2.577445, 1, 0, 0, 1,
-2.67297, -1.148318, -1.323445, 1, 0.007843138, 0, 1,
-2.631949, 0.7338723, 0.7334319, 1, 0.01176471, 0, 1,
-2.54964, 0.9745095, -1.200746, 1, 0.01960784, 0, 1,
-2.501141, 0.3532466, -1.24941, 1, 0.02352941, 0, 1,
-2.495887, -1.858779, -2.415681, 1, 0.03137255, 0, 1,
-2.48799, -1.384795, -1.722578, 1, 0.03529412, 0, 1,
-2.458561, 0.8189546, -2.038096, 1, 0.04313726, 0, 1,
-2.455618, 0.04646682, -2.206856, 1, 0.04705882, 0, 1,
-2.435229, 0.7045863, -1.838817, 1, 0.05490196, 0, 1,
-2.431326, 0.2547257, -0.9558215, 1, 0.05882353, 0, 1,
-2.346994, 0.6731611, -1.325796, 1, 0.06666667, 0, 1,
-2.331329, 0.1702859, -1.897676, 1, 0.07058824, 0, 1,
-2.256952, 0.1536631, -0.3342153, 1, 0.07843138, 0, 1,
-2.198477, 0.0237279, -1.732533, 1, 0.08235294, 0, 1,
-2.174025, -0.6088203, -1.421472, 1, 0.09019608, 0, 1,
-2.153988, -1.525378, -2.542345, 1, 0.09411765, 0, 1,
-2.142708, 0.5164763, -0.8142384, 1, 0.1019608, 0, 1,
-2.112349, -0.1370502, -2.735363, 1, 0.1098039, 0, 1,
-2.049395, 2.241772, -1.286227, 1, 0.1137255, 0, 1,
-2.045255, 0.3873413, -0.5246891, 1, 0.1215686, 0, 1,
-2.023534, 0.03210896, -0.2410181, 1, 0.1254902, 0, 1,
-2.00727, -2.239121, -2.51312, 1, 0.1333333, 0, 1,
-1.986983, 0.9219221, -2.023146, 1, 0.1372549, 0, 1,
-1.966135, -2.25129, -2.646139, 1, 0.145098, 0, 1,
-1.960778, 0.4492668, -0.08306759, 1, 0.1490196, 0, 1,
-1.958502, 0.1019101, -0.7579783, 1, 0.1568628, 0, 1,
-1.958421, 0.68103, -0.8946579, 1, 0.1607843, 0, 1,
-1.944568, 0.8504769, -1.126582, 1, 0.1686275, 0, 1,
-1.909613, -0.1498927, -2.378166, 1, 0.172549, 0, 1,
-1.896591, 0.4148702, -1.696264, 1, 0.1803922, 0, 1,
-1.88386, -1.254526, -1.770125, 1, 0.1843137, 0, 1,
-1.874386, 0.5664051, -1.246933, 1, 0.1921569, 0, 1,
-1.849985, 0.2625985, -0.932383, 1, 0.1960784, 0, 1,
-1.832607, -2.185256, -3.335097, 1, 0.2039216, 0, 1,
-1.821307, -1.433598, -2.055549, 1, 0.2117647, 0, 1,
-1.809872, -0.6427525, -3.3499, 1, 0.2156863, 0, 1,
-1.791561, 0.9508379, -0.2322591, 1, 0.2235294, 0, 1,
-1.782048, -1.680758, -1.314174, 1, 0.227451, 0, 1,
-1.781215, 0.1196026, -0.8715277, 1, 0.2352941, 0, 1,
-1.778301, -2.497471, -2.010954, 1, 0.2392157, 0, 1,
-1.776476, -1.436653, -1.829963, 1, 0.2470588, 0, 1,
-1.763635, -1.38038, -3.508634, 1, 0.2509804, 0, 1,
-1.761136, -0.9364678, -2.266201, 1, 0.2588235, 0, 1,
-1.754549, -1.084197, -4.77039, 1, 0.2627451, 0, 1,
-1.749414, -1.349444, -3.301113, 1, 0.2705882, 0, 1,
-1.728918, -0.286018, -1.200887, 1, 0.2745098, 0, 1,
-1.717687, 0.2969416, -1.647094, 1, 0.282353, 0, 1,
-1.713837, 1.324823, -2.250721, 1, 0.2862745, 0, 1,
-1.696885, -0.8362978, -1.948551, 1, 0.2941177, 0, 1,
-1.668443, 0.6295422, -1.845758, 1, 0.3019608, 0, 1,
-1.663946, -0.6372752, -2.338057, 1, 0.3058824, 0, 1,
-1.654449, 1.788319, -0.07077582, 1, 0.3137255, 0, 1,
-1.653291, -0.9363451, -1.768605, 1, 0.3176471, 0, 1,
-1.649629, -1.411042, -2.576472, 1, 0.3254902, 0, 1,
-1.648893, 0.04043915, -2.074072, 1, 0.3294118, 0, 1,
-1.642735, 0.06222766, -0.5258632, 1, 0.3372549, 0, 1,
-1.638707, 0.2317207, -2.477347, 1, 0.3411765, 0, 1,
-1.637826, -1.004285, -1.762239, 1, 0.3490196, 0, 1,
-1.636851, 0.7843298, -0.297705, 1, 0.3529412, 0, 1,
-1.632705, -0.6442153, -2.272481, 1, 0.3607843, 0, 1,
-1.63218, -1.062812, -2.29841, 1, 0.3647059, 0, 1,
-1.628586, -0.1760125, -2.46912, 1, 0.372549, 0, 1,
-1.609815, 1.096215, -0.7339267, 1, 0.3764706, 0, 1,
-1.608087, 0.7277895, -1.746002, 1, 0.3843137, 0, 1,
-1.590803, -0.2444802, -2.432218, 1, 0.3882353, 0, 1,
-1.588905, -0.8263761, -0.6482704, 1, 0.3960784, 0, 1,
-1.585994, -0.2331325, -1.846174, 1, 0.4039216, 0, 1,
-1.585167, 2.441712, -2.043122, 1, 0.4078431, 0, 1,
-1.57398, 0.1653335, -0.8314291, 1, 0.4156863, 0, 1,
-1.544208, 1.095253, 0.4876728, 1, 0.4196078, 0, 1,
-1.509002, -0.4753055, 0.6238847, 1, 0.427451, 0, 1,
-1.497845, -0.2163314, 0.7839676, 1, 0.4313726, 0, 1,
-1.486758, -1.552066, -1.251584, 1, 0.4392157, 0, 1,
-1.486584, 0.672619, -1.091949, 1, 0.4431373, 0, 1,
-1.480709, 0.7970961, -1.988929, 1, 0.4509804, 0, 1,
-1.473177, -0.08875851, -0.097939, 1, 0.454902, 0, 1,
-1.465047, -0.6831018, -3.896961, 1, 0.4627451, 0, 1,
-1.464947, 0.8890809, -2.744567, 1, 0.4666667, 0, 1,
-1.457726, -0.6108071, -0.2200733, 1, 0.4745098, 0, 1,
-1.450946, 0.449148, -1.588454, 1, 0.4784314, 0, 1,
-1.440735, -1.10175, -3.312402, 1, 0.4862745, 0, 1,
-1.434277, -0.5713952, -2.159369, 1, 0.4901961, 0, 1,
-1.434167, 0.6602248, -0.5863782, 1, 0.4980392, 0, 1,
-1.424985, 0.9583411, -2.395152, 1, 0.5058824, 0, 1,
-1.423531, 0.9148405, -1.64588, 1, 0.509804, 0, 1,
-1.420457, 0.0967526, 0.1184695, 1, 0.5176471, 0, 1,
-1.417176, 0.487902, 0.9385321, 1, 0.5215687, 0, 1,
-1.407853, 0.3021725, -1.148825, 1, 0.5294118, 0, 1,
-1.398456, 0.585718, -3.383287, 1, 0.5333334, 0, 1,
-1.392692, -0.5202314, -1.366657, 1, 0.5411765, 0, 1,
-1.380086, 0.6812745, -2.051975, 1, 0.5450981, 0, 1,
-1.3661, 1.491749, 0.4191539, 1, 0.5529412, 0, 1,
-1.365977, 0.1309894, -3.515956, 1, 0.5568628, 0, 1,
-1.3591, 0.2541112, 0.494927, 1, 0.5647059, 0, 1,
-1.358714, 0.957346, -1.050547, 1, 0.5686275, 0, 1,
-1.357271, 1.110625, -2.055993, 1, 0.5764706, 0, 1,
-1.353779, -0.4011522, -0.4881753, 1, 0.5803922, 0, 1,
-1.352256, -0.7187206, -3.332535, 1, 0.5882353, 0, 1,
-1.350599, -0.9724159, -1.858208, 1, 0.5921569, 0, 1,
-1.347056, -0.2609647, -0.4114249, 1, 0.6, 0, 1,
-1.333564, 0.7280376, -0.3783662, 1, 0.6078432, 0, 1,
-1.332384, 1.540459, 0.1441403, 1, 0.6117647, 0, 1,
-1.332131, 0.1962138, -1.221311, 1, 0.6196079, 0, 1,
-1.330312, -2.048065, -1.255728, 1, 0.6235294, 0, 1,
-1.323019, 0.6772813, -1.060957, 1, 0.6313726, 0, 1,
-1.318891, 1.02365, -0.1054795, 1, 0.6352941, 0, 1,
-1.313544, 0.4200498, -2.565696, 1, 0.6431373, 0, 1,
-1.309155, -1.655228, -3.328829, 1, 0.6470588, 0, 1,
-1.306272, 0.9584134, -1.473804, 1, 0.654902, 0, 1,
-1.298433, 0.01710007, -2.350426, 1, 0.6588235, 0, 1,
-1.297272, -0.6577814, -3.856648, 1, 0.6666667, 0, 1,
-1.295725, 0.4729044, -1.358079, 1, 0.6705883, 0, 1,
-1.290131, 0.2191019, -3.03672, 1, 0.6784314, 0, 1,
-1.278957, -0.226553, -2.234959, 1, 0.682353, 0, 1,
-1.277006, 0.4259073, -2.335032, 1, 0.6901961, 0, 1,
-1.272281, -0.6318588, -3.225508, 1, 0.6941177, 0, 1,
-1.258294, -0.9740275, -1.400154, 1, 0.7019608, 0, 1,
-1.250852, -1.587409, -1.691016, 1, 0.7098039, 0, 1,
-1.249757, 1.279542, -0.7445058, 1, 0.7137255, 0, 1,
-1.223088, -0.5134159, -3.919149, 1, 0.7215686, 0, 1,
-1.21166, 1.06546, 0.1862756, 1, 0.7254902, 0, 1,
-1.208118, 1.504943, -1.718868, 1, 0.7333333, 0, 1,
-1.198441, -0.08720839, -1.81489, 1, 0.7372549, 0, 1,
-1.197364, 0.2470555, -0.6960076, 1, 0.7450981, 0, 1,
-1.196632, 1.18162, -1.917073, 1, 0.7490196, 0, 1,
-1.194839, 0.5835855, -1.898644, 1, 0.7568628, 0, 1,
-1.187258, -0.6321177, -3.268969, 1, 0.7607843, 0, 1,
-1.17165, 0.5823155, -0.4121517, 1, 0.7686275, 0, 1,
-1.171522, -0.1154691, -2.133382, 1, 0.772549, 0, 1,
-1.170941, 1.28041, 0.1718551, 1, 0.7803922, 0, 1,
-1.17064, -1.477161, -4.293328, 1, 0.7843137, 0, 1,
-1.1705, -0.7822118, -3.05156, 1, 0.7921569, 0, 1,
-1.164871, 0.6277463, -0.7195432, 1, 0.7960784, 0, 1,
-1.159848, -1.220939, -1.001287, 1, 0.8039216, 0, 1,
-1.154935, 1.564377, -1.770508, 1, 0.8117647, 0, 1,
-1.151195, -2.027911, -1.91878, 1, 0.8156863, 0, 1,
-1.145804, -1.637632, -2.894128, 1, 0.8235294, 0, 1,
-1.141808, -0.3008723, -2.009072, 1, 0.827451, 0, 1,
-1.136197, -2.052397, -2.315311, 1, 0.8352941, 0, 1,
-1.132754, 0.5559548, -1.906331, 1, 0.8392157, 0, 1,
-1.132249, -0.06884455, -2.035147, 1, 0.8470588, 0, 1,
-1.123961, -0.8781861, -1.446671, 1, 0.8509804, 0, 1,
-1.120958, 0.3033506, -1.290836, 1, 0.8588235, 0, 1,
-1.1206, 0.9161508, -2.151596, 1, 0.8627451, 0, 1,
-1.113506, 0.4707211, -0.05070064, 1, 0.8705882, 0, 1,
-1.094922, 2.30705, 0.600179, 1, 0.8745098, 0, 1,
-1.086097, -0.9538863, -1.246252, 1, 0.8823529, 0, 1,
-1.085356, -0.8877023, -1.454784, 1, 0.8862745, 0, 1,
-1.084661, 1.005809, -0.1415702, 1, 0.8941177, 0, 1,
-1.081994, 0.6823813, -0.1711907, 1, 0.8980392, 0, 1,
-1.081031, 1.137844, 0.728916, 1, 0.9058824, 0, 1,
-1.079045, -2.020181, -3.009046, 1, 0.9137255, 0, 1,
-1.078493, -1.033559, -2.585329, 1, 0.9176471, 0, 1,
-1.074908, 0.02003608, -1.131507, 1, 0.9254902, 0, 1,
-1.074096, -1.311123, -3.36047, 1, 0.9294118, 0, 1,
-1.069255, 0.1042757, -3.13334, 1, 0.9372549, 0, 1,
-1.068971, -1.378298, -2.308476, 1, 0.9411765, 0, 1,
-1.067222, 1.261375, -0.9448608, 1, 0.9490196, 0, 1,
-1.059626, 0.3443846, -0.2166105, 1, 0.9529412, 0, 1,
-1.05851, -0.327324, -1.071311, 1, 0.9607843, 0, 1,
-1.047907, -0.5331514, -1.900877, 1, 0.9647059, 0, 1,
-1.043403, -1.206276, -1.206006, 1, 0.972549, 0, 1,
-1.042858, -1.891512, -3.480491, 1, 0.9764706, 0, 1,
-1.041323, -0.0264098, -1.153656, 1, 0.9843137, 0, 1,
-1.04124, -0.6434101, -2.353641, 1, 0.9882353, 0, 1,
-1.038144, -0.3442701, -1.594256, 1, 0.9960784, 0, 1,
-1.030322, 0.8241458, -0.2464276, 0.9960784, 1, 0, 1,
-1.026666, -0.9028251, -0.8379961, 0.9921569, 1, 0, 1,
-1.014638, -0.4233029, -1.508432, 0.9843137, 1, 0, 1,
-1.004798, -0.5852535, -1.63555, 0.9803922, 1, 0, 1,
-1.000933, 0.465465, -0.27765, 0.972549, 1, 0, 1,
-0.9982445, -0.4887262, -3.343161, 0.9686275, 1, 0, 1,
-0.9951754, -1.096774, -2.819734, 0.9607843, 1, 0, 1,
-0.9933295, -0.05108523, -0.4277281, 0.9568627, 1, 0, 1,
-0.9851708, -2.201915, -3.443343, 0.9490196, 1, 0, 1,
-0.9793562, 0.3141809, -1.671772, 0.945098, 1, 0, 1,
-0.977806, -0.2616054, -1.087327, 0.9372549, 1, 0, 1,
-0.9729407, -1.208225, -5.114893, 0.9333333, 1, 0, 1,
-0.9694302, -0.417395, -2.272284, 0.9254902, 1, 0, 1,
-0.9674122, -0.3083254, -1.762758, 0.9215686, 1, 0, 1,
-0.9638022, 0.7477819, -1.250975, 0.9137255, 1, 0, 1,
-0.9540628, 0.7351535, -0.9248633, 0.9098039, 1, 0, 1,
-0.9529264, -2.702701, -1.907811, 0.9019608, 1, 0, 1,
-0.9528815, 0.579697, -1.63776, 0.8941177, 1, 0, 1,
-0.9439638, -0.9270681, -3.587306, 0.8901961, 1, 0, 1,
-0.9425166, 0.8760687, -0.5282609, 0.8823529, 1, 0, 1,
-0.9407944, 1.255606, -0.1393487, 0.8784314, 1, 0, 1,
-0.9373177, -0.07234351, -0.8709714, 0.8705882, 1, 0, 1,
-0.9322865, 0.5782339, -1.458812, 0.8666667, 1, 0, 1,
-0.9300979, 0.4087481, -1.990684, 0.8588235, 1, 0, 1,
-0.9193665, 0.9097513, -0.3827666, 0.854902, 1, 0, 1,
-0.9102544, -0.6656901, -0.7450335, 0.8470588, 1, 0, 1,
-0.9046131, 0.03694253, -1.956985, 0.8431373, 1, 0, 1,
-0.887805, -1.291436, -3.55695, 0.8352941, 1, 0, 1,
-0.8805447, -0.4131333, -3.166677, 0.8313726, 1, 0, 1,
-0.8778052, -1.254074, -3.131896, 0.8235294, 1, 0, 1,
-0.8576391, -0.6028468, -2.498088, 0.8196079, 1, 0, 1,
-0.8525035, -0.1819845, -1.68112, 0.8117647, 1, 0, 1,
-0.8499444, 1.18663, -0.5460687, 0.8078431, 1, 0, 1,
-0.8440243, -0.2517889, -4.49368, 0.8, 1, 0, 1,
-0.8414428, -0.2209467, -3.262277, 0.7921569, 1, 0, 1,
-0.83643, -0.4207351, -0.791643, 0.7882353, 1, 0, 1,
-0.8270459, 0.02505985, -3.248246, 0.7803922, 1, 0, 1,
-0.8245588, 0.7719907, -0.05221036, 0.7764706, 1, 0, 1,
-0.8213136, 1.506914, 0.4787221, 0.7686275, 1, 0, 1,
-0.8154443, -0.1791526, -0.9627399, 0.7647059, 1, 0, 1,
-0.8128235, 0.6981024, -1.705064, 0.7568628, 1, 0, 1,
-0.8098307, -0.508085, -1.851721, 0.7529412, 1, 0, 1,
-0.8090318, 0.3026007, 0.7559274, 0.7450981, 1, 0, 1,
-0.8081437, 0.4400311, -2.875225, 0.7411765, 1, 0, 1,
-0.8047398, 1.931645, 0.366262, 0.7333333, 1, 0, 1,
-0.8024135, 1.497524, 0.7778014, 0.7294118, 1, 0, 1,
-0.8000599, 0.1076842, -0.3800493, 0.7215686, 1, 0, 1,
-0.7989811, -0.660832, -2.187128, 0.7176471, 1, 0, 1,
-0.7973086, -0.5936243, -2.079562, 0.7098039, 1, 0, 1,
-0.7972983, -1.217026, -3.578065, 0.7058824, 1, 0, 1,
-0.7953426, -0.1404176, -2.30091, 0.6980392, 1, 0, 1,
-0.7933894, 1.653757, -0.007564488, 0.6901961, 1, 0, 1,
-0.7933111, -1.287408, -2.513821, 0.6862745, 1, 0, 1,
-0.7879014, -0.3612283, -0.3129835, 0.6784314, 1, 0, 1,
-0.7843317, -0.5258555, -3.157727, 0.6745098, 1, 0, 1,
-0.781397, 0.7076153, -1.944367, 0.6666667, 1, 0, 1,
-0.7645012, -2.055895, -1.182798, 0.6627451, 1, 0, 1,
-0.7615543, 1.333502, -0.8441644, 0.654902, 1, 0, 1,
-0.76077, -0.7270669, -1.09982, 0.6509804, 1, 0, 1,
-0.7560577, 1.337618, -0.8284262, 0.6431373, 1, 0, 1,
-0.7544058, 0.4738787, 0.8718792, 0.6392157, 1, 0, 1,
-0.7517611, -0.188406, -0.7452303, 0.6313726, 1, 0, 1,
-0.7499288, -0.1298974, -2.23904, 0.627451, 1, 0, 1,
-0.7427482, 0.9579251, -0.09181716, 0.6196079, 1, 0, 1,
-0.7421878, -1.798941, -3.781136, 0.6156863, 1, 0, 1,
-0.7382888, 0.9132528, -0.1317103, 0.6078432, 1, 0, 1,
-0.7312101, -1.915485, -3.281829, 0.6039216, 1, 0, 1,
-0.729185, 2.092068, -1.251388, 0.5960785, 1, 0, 1,
-0.7288941, 0.6094273, -0.5142702, 0.5882353, 1, 0, 1,
-0.7276518, 0.2563654, -1.408398, 0.5843138, 1, 0, 1,
-0.7271141, -2.26651, -2.240587, 0.5764706, 1, 0, 1,
-0.7234377, -0.8581485, -4.339087, 0.572549, 1, 0, 1,
-0.7199839, -0.7980563, -1.806692, 0.5647059, 1, 0, 1,
-0.7137348, -0.1277629, -1.233738, 0.5607843, 1, 0, 1,
-0.7127588, 1.012937, -1.743791, 0.5529412, 1, 0, 1,
-0.707366, 0.2872026, -1.342162, 0.5490196, 1, 0, 1,
-0.7038357, -1.059903, -1.965659, 0.5411765, 1, 0, 1,
-0.702194, 1.81233, -0.5972859, 0.5372549, 1, 0, 1,
-0.6924244, 0.9012789, -2.073118, 0.5294118, 1, 0, 1,
-0.690941, -0.9985101, -1.806697, 0.5254902, 1, 0, 1,
-0.6899374, -0.7510132, -3.687485, 0.5176471, 1, 0, 1,
-0.684641, 0.9951908, -0.7656002, 0.5137255, 1, 0, 1,
-0.6770042, -0.1983077, -1.569561, 0.5058824, 1, 0, 1,
-0.6760284, -1.075379, -3.358194, 0.5019608, 1, 0, 1,
-0.671552, 0.5491356, 1.185935, 0.4941176, 1, 0, 1,
-0.6686059, -1.028191, -2.144769, 0.4862745, 1, 0, 1,
-0.6608223, 0.5585735, -2.739245, 0.4823529, 1, 0, 1,
-0.6591687, -1.584149, -1.596765, 0.4745098, 1, 0, 1,
-0.6573934, -0.09761358, -0.6672765, 0.4705882, 1, 0, 1,
-0.6504588, -0.2549285, -0.7020059, 0.4627451, 1, 0, 1,
-0.6475152, 0.03614443, -2.412671, 0.4588235, 1, 0, 1,
-0.6450515, -1.03486, -2.497095, 0.4509804, 1, 0, 1,
-0.6431093, 0.6014206, -1.441578, 0.4470588, 1, 0, 1,
-0.6394078, -0.3696723, -1.369531, 0.4392157, 1, 0, 1,
-0.639227, -1.392228, -3.30019, 0.4352941, 1, 0, 1,
-0.6381978, -1.797545, -4.602587, 0.427451, 1, 0, 1,
-0.6348582, -0.3902726, -2.057479, 0.4235294, 1, 0, 1,
-0.6340446, 0.344552, -0.3511578, 0.4156863, 1, 0, 1,
-0.6310512, 0.4714105, -0.7640017, 0.4117647, 1, 0, 1,
-0.6304181, -0.243211, -2.071853, 0.4039216, 1, 0, 1,
-0.6275378, 0.6421659, -0.4615186, 0.3960784, 1, 0, 1,
-0.6255985, 0.2148467, -1.224388, 0.3921569, 1, 0, 1,
-0.6254448, 0.1151611, -1.767677, 0.3843137, 1, 0, 1,
-0.6215187, -0.4438895, -2.799456, 0.3803922, 1, 0, 1,
-0.6214218, -1.077716, -1.844389, 0.372549, 1, 0, 1,
-0.6194976, 1.387818, -1.598078, 0.3686275, 1, 0, 1,
-0.6128775, -0.8351735, -2.473521, 0.3607843, 1, 0, 1,
-0.60868, 1.709236, -0.3153367, 0.3568628, 1, 0, 1,
-0.6027538, -0.5694968, -0.6376752, 0.3490196, 1, 0, 1,
-0.6015148, 0.006253362, -1.294237, 0.345098, 1, 0, 1,
-0.601073, -0.5227431, -3.43065, 0.3372549, 1, 0, 1,
-0.6005393, 1.603109, -0.4454152, 0.3333333, 1, 0, 1,
-0.593715, -1.331922, -2.811154, 0.3254902, 1, 0, 1,
-0.5900249, -0.07402793, -1.425235, 0.3215686, 1, 0, 1,
-0.5842383, 0.513508, -3.216361, 0.3137255, 1, 0, 1,
-0.5791261, 0.1025391, -1.335446, 0.3098039, 1, 0, 1,
-0.5791056, -1.335343, -2.139125, 0.3019608, 1, 0, 1,
-0.573732, 1.399168, -0.5942726, 0.2941177, 1, 0, 1,
-0.5736197, -1.020742, -2.185134, 0.2901961, 1, 0, 1,
-0.5688379, 0.2373799, -1.463532, 0.282353, 1, 0, 1,
-0.5664589, -0.6486007, -2.061674, 0.2784314, 1, 0, 1,
-0.5608724, -1.174946, -4.119386, 0.2705882, 1, 0, 1,
-0.5581375, 0.1395166, -0.04159563, 0.2666667, 1, 0, 1,
-0.5581341, 1.506419, 0.1901586, 0.2588235, 1, 0, 1,
-0.5530288, -0.1997139, -1.127621, 0.254902, 1, 0, 1,
-0.5520795, 0.8276416, -0.3247012, 0.2470588, 1, 0, 1,
-0.5507153, -0.7405665, -1.739773, 0.2431373, 1, 0, 1,
-0.5495815, 0.1860549, -1.158977, 0.2352941, 1, 0, 1,
-0.5481641, 0.8513552, -1.101114, 0.2313726, 1, 0, 1,
-0.5428865, -1.063177, -2.90634, 0.2235294, 1, 0, 1,
-0.5417508, -0.7648552, -2.084569, 0.2196078, 1, 0, 1,
-0.5413863, -0.8132862, -2.529599, 0.2117647, 1, 0, 1,
-0.5393246, -1.10485, -2.249898, 0.2078431, 1, 0, 1,
-0.5374081, -1.370379, -2.413255, 0.2, 1, 0, 1,
-0.5365905, 1.775607, -1.394951, 0.1921569, 1, 0, 1,
-0.5342433, 0.1860679, -2.438076, 0.1882353, 1, 0, 1,
-0.5304677, -0.2590035, -2.723097, 0.1803922, 1, 0, 1,
-0.5278353, -1.932725, -3.117646, 0.1764706, 1, 0, 1,
-0.5254879, -0.4719243, -0.7997584, 0.1686275, 1, 0, 1,
-0.5242867, -0.5682982, -4.33336, 0.1647059, 1, 0, 1,
-0.5117832, -0.1699348, -3.368459, 0.1568628, 1, 0, 1,
-0.5049716, -0.6469957, -1.388936, 0.1529412, 1, 0, 1,
-0.5038292, 1.13894, 0.2411585, 0.145098, 1, 0, 1,
-0.5037215, -0.1960837, -1.930468, 0.1411765, 1, 0, 1,
-0.5009606, -0.1262524, -3.184239, 0.1333333, 1, 0, 1,
-0.5006779, 0.244832, -1.193603, 0.1294118, 1, 0, 1,
-0.5000467, 0.5754108, -0.4631269, 0.1215686, 1, 0, 1,
-0.4961869, -0.3365209, -3.119479, 0.1176471, 1, 0, 1,
-0.4955878, -0.8033269, -1.109725, 0.1098039, 1, 0, 1,
-0.4845877, -0.59324, -2.712318, 0.1058824, 1, 0, 1,
-0.4823914, -0.4545811, -1.758589, 0.09803922, 1, 0, 1,
-0.4778497, -0.4825208, -1.689162, 0.09019608, 1, 0, 1,
-0.4774141, -1.082995, -2.97554, 0.08627451, 1, 0, 1,
-0.474329, -0.2995327, -2.426256, 0.07843138, 1, 0, 1,
-0.4733466, 0.6892286, -1.015448, 0.07450981, 1, 0, 1,
-0.4718993, -0.75681, -1.68775, 0.06666667, 1, 0, 1,
-0.4717796, -0.3499351, -3.288445, 0.0627451, 1, 0, 1,
-0.4541239, -0.1916488, -1.176431, 0.05490196, 1, 0, 1,
-0.4492247, 0.8905189, -1.661613, 0.05098039, 1, 0, 1,
-0.4455365, 0.08136699, -0.7461701, 0.04313726, 1, 0, 1,
-0.4415123, -0.01727803, -3.712118, 0.03921569, 1, 0, 1,
-0.4395679, -0.6557999, -0.8648059, 0.03137255, 1, 0, 1,
-0.4351137, -0.908374, -1.242507, 0.02745098, 1, 0, 1,
-0.4340425, -2.446673, -4.398931, 0.01960784, 1, 0, 1,
-0.4324062, -1.24253, -3.589126, 0.01568628, 1, 0, 1,
-0.430118, 0.2806026, 0.3437082, 0.007843138, 1, 0, 1,
-0.4300856, 1.34166, -0.9616601, 0.003921569, 1, 0, 1,
-0.4246521, -1.188947, -2.913853, 0, 1, 0.003921569, 1,
-0.4186004, -3.4511, -2.524186, 0, 1, 0.01176471, 1,
-0.4185577, -0.8067092, -3.378596, 0, 1, 0.01568628, 1,
-0.4154047, 1.658396, 0.7665358, 0, 1, 0.02352941, 1,
-0.4109724, 1.461187, 0.0679077, 0, 1, 0.02745098, 1,
-0.4097669, 0.05565098, -1.572362, 0, 1, 0.03529412, 1,
-0.4092802, 0.2832235, -2.62481, 0, 1, 0.03921569, 1,
-0.4085579, -0.05839311, -1.218698, 0, 1, 0.04705882, 1,
-0.4052219, -0.9054298, -3.512166, 0, 1, 0.05098039, 1,
-0.4005339, -0.3601357, -2.101136, 0, 1, 0.05882353, 1,
-0.3998188, -0.3189865, -2.213713, 0, 1, 0.0627451, 1,
-0.3969622, 0.9539556, -2.734903, 0, 1, 0.07058824, 1,
-0.3964717, -1.761203, -2.091268, 0, 1, 0.07450981, 1,
-0.3956928, -1.085227, -4.727278, 0, 1, 0.08235294, 1,
-0.3946839, -0.4770391, -4.291005, 0, 1, 0.08627451, 1,
-0.3902597, -0.6605141, -2.655238, 0, 1, 0.09411765, 1,
-0.3878132, 0.299394, -1.517872, 0, 1, 0.1019608, 1,
-0.3834931, 0.556259, 2.11442, 0, 1, 0.1058824, 1,
-0.3831373, 0.08774488, -0.6947823, 0, 1, 0.1137255, 1,
-0.382727, -0.8342518, -3.71727, 0, 1, 0.1176471, 1,
-0.3816287, 0.6280128, -0.8093041, 0, 1, 0.1254902, 1,
-0.379785, 0.8632021, -0.170544, 0, 1, 0.1294118, 1,
-0.379448, -0.9011316, -3.339945, 0, 1, 0.1372549, 1,
-0.3688534, -1.041278, -2.528299, 0, 1, 0.1411765, 1,
-0.367759, 1.119991, -0.1196912, 0, 1, 0.1490196, 1,
-0.3594919, -1.823554, -3.654298, 0, 1, 0.1529412, 1,
-0.3583887, -0.5212559, -1.368053, 0, 1, 0.1607843, 1,
-0.3555188, 1.336187, -0.2988785, 0, 1, 0.1647059, 1,
-0.3549341, 0.180446, 0.6242743, 0, 1, 0.172549, 1,
-0.3541205, -1.895794, -2.08715, 0, 1, 0.1764706, 1,
-0.3536429, -1.281444, -2.433273, 0, 1, 0.1843137, 1,
-0.352947, 0.5198029, -2.006199, 0, 1, 0.1882353, 1,
-0.3499246, -0.2104506, -0.6883171, 0, 1, 0.1960784, 1,
-0.3482531, -0.7103103, -1.218983, 0, 1, 0.2039216, 1,
-0.3474626, 1.712868, -0.04780178, 0, 1, 0.2078431, 1,
-0.3462604, -0.2463981, -2.218586, 0, 1, 0.2156863, 1,
-0.3434444, 0.8045887, -0.4349906, 0, 1, 0.2196078, 1,
-0.3413564, -0.1676113, -3.04426, 0, 1, 0.227451, 1,
-0.3405474, -0.5519599, -1.281142, 0, 1, 0.2313726, 1,
-0.3363372, 0.3809757, -0.5711498, 0, 1, 0.2392157, 1,
-0.329897, -2.008189, -5.36589, 0, 1, 0.2431373, 1,
-0.3292632, -1.547784, -1.100065, 0, 1, 0.2509804, 1,
-0.3269488, 0.7059567, -2.485581, 0, 1, 0.254902, 1,
-0.3255577, -0.5746074, -1.666381, 0, 1, 0.2627451, 1,
-0.3254848, 1.122113, 0.4947017, 0, 1, 0.2666667, 1,
-0.3254761, 0.5901334, -2.124548, 0, 1, 0.2745098, 1,
-0.3218038, 0.2580102, -1.977392, 0, 1, 0.2784314, 1,
-0.3205578, -0.854966, -3.22347, 0, 1, 0.2862745, 1,
-0.3202541, -0.6893697, -1.546062, 0, 1, 0.2901961, 1,
-0.3189076, -0.09389349, -0.8049173, 0, 1, 0.2980392, 1,
-0.3172635, 0.5358431, -0.1261929, 0, 1, 0.3058824, 1,
-0.316319, 1.295428, -1.276776, 0, 1, 0.3098039, 1,
-0.3112564, -1.013477, -2.926783, 0, 1, 0.3176471, 1,
-0.3086115, -0.3734572, -4.403061, 0, 1, 0.3215686, 1,
-0.3084047, -0.6567137, -4.653436, 0, 1, 0.3294118, 1,
-0.3050299, 2.507495, -2.08953, 0, 1, 0.3333333, 1,
-0.3037145, 1.18305, -0.3176537, 0, 1, 0.3411765, 1,
-0.301582, -1.82421, -1.656617, 0, 1, 0.345098, 1,
-0.3001871, 0.6296545, -0.2131023, 0, 1, 0.3529412, 1,
-0.2967248, 0.7297158, -0.9333448, 0, 1, 0.3568628, 1,
-0.2952341, -0.1343524, -2.133154, 0, 1, 0.3647059, 1,
-0.2871787, -0.05151574, -0.6644496, 0, 1, 0.3686275, 1,
-0.2866814, -1.253266, -2.960835, 0, 1, 0.3764706, 1,
-0.27885, 1.013961, -1.158277, 0, 1, 0.3803922, 1,
-0.2769935, -0.5573727, -2.992728, 0, 1, 0.3882353, 1,
-0.2764713, 1.288004, 0.7731786, 0, 1, 0.3921569, 1,
-0.274231, -0.1362733, -0.5420962, 0, 1, 0.4, 1,
-0.2733729, -0.7641712, -2.101271, 0, 1, 0.4078431, 1,
-0.2650045, 0.1680816, -1.578374, 0, 1, 0.4117647, 1,
-0.2628933, 0.3786812, -1.997071, 0, 1, 0.4196078, 1,
-0.2617906, 0.4394595, -0.7429466, 0, 1, 0.4235294, 1,
-0.2606324, -0.4120084, -3.904533, 0, 1, 0.4313726, 1,
-0.2542029, -0.9788417, -2.512757, 0, 1, 0.4352941, 1,
-0.2521991, -0.115054, -0.8469207, 0, 1, 0.4431373, 1,
-0.2415823, -0.9926738, -2.914074, 0, 1, 0.4470588, 1,
-0.2404819, 1.044921, 1.257813, 0, 1, 0.454902, 1,
-0.2393307, 0.2384366, -1.064462, 0, 1, 0.4588235, 1,
-0.239183, 0.4706545, -0.6905851, 0, 1, 0.4666667, 1,
-0.2377457, 2.090029, 0.2045406, 0, 1, 0.4705882, 1,
-0.2316364, 1.19313, -0.3275661, 0, 1, 0.4784314, 1,
-0.2288578, -0.5009981, -2.029178, 0, 1, 0.4823529, 1,
-0.2239006, -0.1517119, -0.8645558, 0, 1, 0.4901961, 1,
-0.2223845, 0.4756618, 0.09313784, 0, 1, 0.4941176, 1,
-0.2213297, -1.481896, -2.984324, 0, 1, 0.5019608, 1,
-0.2189313, 0.4983262, 0.6109707, 0, 1, 0.509804, 1,
-0.2156627, 0.1651254, 0.09112674, 0, 1, 0.5137255, 1,
-0.2146546, 1.12445, 0.2586171, 0, 1, 0.5215687, 1,
-0.21441, 0.3614847, -1.31272, 0, 1, 0.5254902, 1,
-0.2141369, 0.5307884, -1.484739, 0, 1, 0.5333334, 1,
-0.2131673, -1.387593, -4.745534, 0, 1, 0.5372549, 1,
-0.2110415, 0.2878665, -0.4436568, 0, 1, 0.5450981, 1,
-0.210635, -0.6295768, -2.786857, 0, 1, 0.5490196, 1,
-0.2103627, 0.5893509, 0.3969067, 0, 1, 0.5568628, 1,
-0.2093669, -1.245341, -0.7670421, 0, 1, 0.5607843, 1,
-0.2092104, 0.5644524, -0.7572525, 0, 1, 0.5686275, 1,
-0.2057798, 0.5083968, 0.1935949, 0, 1, 0.572549, 1,
-0.2048818, 0.302154, 1.602291, 0, 1, 0.5803922, 1,
-0.2040168, 0.2073953, -1.860905, 0, 1, 0.5843138, 1,
-0.2034743, 0.7929448, -0.6519196, 0, 1, 0.5921569, 1,
-0.1970673, 1.211944, 2.209464, 0, 1, 0.5960785, 1,
-0.1966271, 0.3603347, 0.5890266, 0, 1, 0.6039216, 1,
-0.1965084, 0.1340888, -0.03932343, 0, 1, 0.6117647, 1,
-0.1953769, -0.05148679, -0.3225183, 0, 1, 0.6156863, 1,
-0.1861979, -1.067148, -5.206305, 0, 1, 0.6235294, 1,
-0.1842531, -0.6256318, -2.932201, 0, 1, 0.627451, 1,
-0.1796688, -0.2396134, -2.871632, 0, 1, 0.6352941, 1,
-0.176246, -1.660352, -4.010717, 0, 1, 0.6392157, 1,
-0.1715692, -0.3163077, -2.370411, 0, 1, 0.6470588, 1,
-0.1715493, 0.2664449, -0.7225499, 0, 1, 0.6509804, 1,
-0.1687649, -0.384139, -3.886965, 0, 1, 0.6588235, 1,
-0.16699, 0.2793908, -0.5593548, 0, 1, 0.6627451, 1,
-0.1650701, 0.6080166, 0.825796, 0, 1, 0.6705883, 1,
-0.1609829, 0.539964, 0.1530251, 0, 1, 0.6745098, 1,
-0.1579841, -0.07815327, -2.348718, 0, 1, 0.682353, 1,
-0.1559416, 0.1041062, -0.9932151, 0, 1, 0.6862745, 1,
-0.1554661, -2.542272, -4.644324, 0, 1, 0.6941177, 1,
-0.1542687, -0.1716647, -3.652022, 0, 1, 0.7019608, 1,
-0.1542494, -0.6891202, -4.533722, 0, 1, 0.7058824, 1,
-0.1532488, -1.499539, -3.768892, 0, 1, 0.7137255, 1,
-0.1519186, -1.369875, -3.31979, 0, 1, 0.7176471, 1,
-0.1486815, -1.462934, -3.887929, 0, 1, 0.7254902, 1,
-0.1485091, 0.8898111, -0.7904908, 0, 1, 0.7294118, 1,
-0.1450854, 0.4378553, -3.328734, 0, 1, 0.7372549, 1,
-0.141993, -0.5263392, -3.62785, 0, 1, 0.7411765, 1,
-0.1371474, 0.7734906, -0.4948283, 0, 1, 0.7490196, 1,
-0.1336296, 0.9822218, 0.3975213, 0, 1, 0.7529412, 1,
-0.1294671, -3.162345, -1.467419, 0, 1, 0.7607843, 1,
-0.1263889, 1.18609, -0.4637454, 0, 1, 0.7647059, 1,
-0.1221028, 0.03586067, -0.243208, 0, 1, 0.772549, 1,
-0.1220643, 0.06329245, -1.596086, 0, 1, 0.7764706, 1,
-0.1131708, -1.19787, -4.611024, 0, 1, 0.7843137, 1,
-0.1073622, -1.071201, -3.621602, 0, 1, 0.7882353, 1,
-0.1047351, -0.6644114, -2.872265, 0, 1, 0.7960784, 1,
-0.1037876, -1.889098, -1.234449, 0, 1, 0.8039216, 1,
-0.101911, 0.2292993, -0.3160222, 0, 1, 0.8078431, 1,
-0.1019076, -1.579256, -2.644356, 0, 1, 0.8156863, 1,
-0.1002088, -0.0951046, -2.495491, 0, 1, 0.8196079, 1,
-0.09838008, 1.819644, -1.090516, 0, 1, 0.827451, 1,
-0.09445255, 0.4833263, -1.06815, 0, 1, 0.8313726, 1,
-0.09371497, 0.004582291, -1.337956, 0, 1, 0.8392157, 1,
-0.08865786, 0.1274073, 0.2239432, 0, 1, 0.8431373, 1,
-0.08641445, -0.1334795, -2.984844, 0, 1, 0.8509804, 1,
-0.08604206, -1.067662, -1.228552, 0, 1, 0.854902, 1,
-0.08362306, -0.2489091, -2.473351, 0, 1, 0.8627451, 1,
-0.08346307, -1.669879, -3.171404, 0, 1, 0.8666667, 1,
-0.07538686, -0.03315652, -3.566181, 0, 1, 0.8745098, 1,
-0.07397911, -0.3253799, -1.641466, 0, 1, 0.8784314, 1,
-0.06947817, -1.157087, -2.354676, 0, 1, 0.8862745, 1,
-0.0663638, 0.2257789, -1.522742, 0, 1, 0.8901961, 1,
-0.06183289, 0.8500705, -0.04220474, 0, 1, 0.8980392, 1,
-0.05908227, 0.1221425, 1.239767, 0, 1, 0.9058824, 1,
-0.0576355, 0.6757087, -1.317233, 0, 1, 0.9098039, 1,
-0.05716332, 1.138365, -0.1681912, 0, 1, 0.9176471, 1,
-0.05607985, 0.7545716, -0.6928333, 0, 1, 0.9215686, 1,
-0.05570057, 1.703531, 1.465672, 0, 1, 0.9294118, 1,
-0.05486274, 0.07464074, -1.263928, 0, 1, 0.9333333, 1,
-0.05108915, 0.1372334, 0.4635637, 0, 1, 0.9411765, 1,
-0.05094291, -0.8903173, -3.315011, 0, 1, 0.945098, 1,
-0.04917575, 1.628076, -0.3646682, 0, 1, 0.9529412, 1,
-0.04889011, -1.014553, -2.353899, 0, 1, 0.9568627, 1,
-0.04844445, -1.902261, -4.503788, 0, 1, 0.9647059, 1,
-0.04710273, 0.1277043, 1.671913, 0, 1, 0.9686275, 1,
-0.04605263, -0.1159605, -1.468957, 0, 1, 0.9764706, 1,
-0.04547808, -0.7788982, -3.034315, 0, 1, 0.9803922, 1,
-0.04486551, 0.007650498, -1.978034, 0, 1, 0.9882353, 1,
-0.0427884, 0.1230599, -0.2159282, 0, 1, 0.9921569, 1,
-0.04189327, 0.4376571, -0.1219813, 0, 1, 1, 1,
-0.04012215, 0.3321927, -0.5969439, 0, 0.9921569, 1, 1,
-0.03837275, 0.3881335, -0.8169338, 0, 0.9882353, 1, 1,
-0.03836169, 0.7174494, -1.441822, 0, 0.9803922, 1, 1,
-0.03590414, 1.422476, -1.698568, 0, 0.9764706, 1, 1,
-0.03203353, -0.09052329, -3.521354, 0, 0.9686275, 1, 1,
-0.02954325, 0.1688997, 0.2141817, 0, 0.9647059, 1, 1,
-0.02264867, 2.24245, -0.172238, 0, 0.9568627, 1, 1,
-0.01484256, 1.663314, -0.1105305, 0, 0.9529412, 1, 1,
-0.01388935, 0.8009775, 1.388506, 0, 0.945098, 1, 1,
-0.0100069, 0.8040674, 0.100021, 0, 0.9411765, 1, 1,
-0.009968611, -1.482065, -2.376819, 0, 0.9333333, 1, 1,
-0.002711847, 0.09071477, -0.3526063, 0, 0.9294118, 1, 1,
-0.002519046, 0.6694563, -0.07776108, 0, 0.9215686, 1, 1,
-0.0002823991, -2.081517, -3.378516, 0, 0.9176471, 1, 1,
0.001978728, 0.3655066, -0.1346644, 0, 0.9098039, 1, 1,
0.007883896, 1.120226, -0.00996454, 0, 0.9058824, 1, 1,
0.0116997, 0.789297, -0.124673, 0, 0.8980392, 1, 1,
0.01288352, -0.01155252, 1.736702, 0, 0.8901961, 1, 1,
0.01508734, 0.7083434, 2.460859, 0, 0.8862745, 1, 1,
0.01849852, 0.579998, -0.379527, 0, 0.8784314, 1, 1,
0.02016197, -0.9336301, 2.567145, 0, 0.8745098, 1, 1,
0.02191965, -1.688883, 4.425787, 0, 0.8666667, 1, 1,
0.02195777, 0.57574, -1.638861, 0, 0.8627451, 1, 1,
0.02383252, -1.196624, 3.155004, 0, 0.854902, 1, 1,
0.02496592, -0.4995235, 1.920175, 0, 0.8509804, 1, 1,
0.02862407, 0.6890581, -0.03869231, 0, 0.8431373, 1, 1,
0.03113318, -0.9007949, 3.259209, 0, 0.8392157, 1, 1,
0.03158034, -0.1654124, 3.007018, 0, 0.8313726, 1, 1,
0.03668889, -0.2200937, 4.763798, 0, 0.827451, 1, 1,
0.03818901, 0.9420608, 0.07539709, 0, 0.8196079, 1, 1,
0.04050165, -1.271435, 1.528814, 0, 0.8156863, 1, 1,
0.04074888, -0.9954911, 5.274266, 0, 0.8078431, 1, 1,
0.04555133, -0.1133725, 1.854393, 0, 0.8039216, 1, 1,
0.04882872, -1.112033, 2.501274, 0, 0.7960784, 1, 1,
0.04944994, -0.3116336, 1.537801, 0, 0.7882353, 1, 1,
0.05057346, 0.7643376, -0.8784898, 0, 0.7843137, 1, 1,
0.05218825, -0.6022179, 2.910418, 0, 0.7764706, 1, 1,
0.05488775, 0.1943174, 0.1572518, 0, 0.772549, 1, 1,
0.05783886, 0.5586974, 1.624985, 0, 0.7647059, 1, 1,
0.05838915, 1.510084, 0.5948413, 0, 0.7607843, 1, 1,
0.05892695, 0.5235507, 1.163868, 0, 0.7529412, 1, 1,
0.06093923, 0.179122, -0.6754646, 0, 0.7490196, 1, 1,
0.06746507, -0.3924, 4.07165, 0, 0.7411765, 1, 1,
0.07842428, 0.9235569, -0.7587022, 0, 0.7372549, 1, 1,
0.08078603, -0.1417651, 1.923507, 0, 0.7294118, 1, 1,
0.08550941, -0.1807625, 2.832754, 0, 0.7254902, 1, 1,
0.08771878, -1.278943, 4.877111, 0, 0.7176471, 1, 1,
0.08774881, 0.1130826, 2.0588, 0, 0.7137255, 1, 1,
0.08811653, 1.28063, -0.06405929, 0, 0.7058824, 1, 1,
0.0883655, -0.505136, 3.102342, 0, 0.6980392, 1, 1,
0.08847356, -0.3415143, 2.836558, 0, 0.6941177, 1, 1,
0.09091527, 0.5269839, -1.094503, 0, 0.6862745, 1, 1,
0.09143405, -1.836744, 2.370517, 0, 0.682353, 1, 1,
0.09541435, -0.7387927, 3.899174, 0, 0.6745098, 1, 1,
0.09742322, -0.7150691, 2.872181, 0, 0.6705883, 1, 1,
0.1012624, 0.3178261, -0.2460452, 0, 0.6627451, 1, 1,
0.101758, 0.02867489, 2.001018, 0, 0.6588235, 1, 1,
0.1042037, -1.193375, 4.716302, 0, 0.6509804, 1, 1,
0.1042707, -1.189276, 1.791641, 0, 0.6470588, 1, 1,
0.1071544, 0.5136657, 0.2077407, 0, 0.6392157, 1, 1,
0.1097263, -0.6079534, 3.751974, 0, 0.6352941, 1, 1,
0.1117971, -1.372371, 2.318374, 0, 0.627451, 1, 1,
0.1148118, -0.9639025, 2.521341, 0, 0.6235294, 1, 1,
0.1173783, -0.4978976, 2.028269, 0, 0.6156863, 1, 1,
0.1190411, 1.722124, -0.9640004, 0, 0.6117647, 1, 1,
0.1194917, 0.4116951, 0.1263516, 0, 0.6039216, 1, 1,
0.1211163, 0.2963123, 0.7087978, 0, 0.5960785, 1, 1,
0.1252172, -1.12286, 3.06036, 0, 0.5921569, 1, 1,
0.125571, -0.5507008, 5.238578, 0, 0.5843138, 1, 1,
0.1308664, 0.5101538, 0.5585648, 0, 0.5803922, 1, 1,
0.1320291, 1.74525, 1.63292, 0, 0.572549, 1, 1,
0.1327687, 1.633477, -0.5544056, 0, 0.5686275, 1, 1,
0.1340272, 0.9991215, 1.279758, 0, 0.5607843, 1, 1,
0.1386523, -1.332449, 1.652826, 0, 0.5568628, 1, 1,
0.1386966, -1.312928, 1.193017, 0, 0.5490196, 1, 1,
0.1390595, -0.6254556, 4.208998, 0, 0.5450981, 1, 1,
0.1458233, -0.2714264, 2.283659, 0, 0.5372549, 1, 1,
0.1490941, 0.3518734, -1.033961, 0, 0.5333334, 1, 1,
0.1555877, -1.406918, 1.425622, 0, 0.5254902, 1, 1,
0.1608474, 1.768445, -0.7503826, 0, 0.5215687, 1, 1,
0.1613202, -1.007623, 3.737181, 0, 0.5137255, 1, 1,
0.1645919, -0.8606835, 3.781611, 0, 0.509804, 1, 1,
0.1652451, 0.9602547, 0.269784, 0, 0.5019608, 1, 1,
0.1654387, 0.1994132, 0.8076793, 0, 0.4941176, 1, 1,
0.1660685, -0.09093314, 1.153421, 0, 0.4901961, 1, 1,
0.1663015, 0.02482145, 1.850232, 0, 0.4823529, 1, 1,
0.1692853, 0.184313, 0.9760813, 0, 0.4784314, 1, 1,
0.1700826, -0.25703, 0.7457456, 0, 0.4705882, 1, 1,
0.1724726, 1.931692, -1.01932, 0, 0.4666667, 1, 1,
0.1728373, 0.06552837, 2.670422, 0, 0.4588235, 1, 1,
0.1758616, 0.1574712, 2.317117, 0, 0.454902, 1, 1,
0.1773029, -0.7230303, 3.117451, 0, 0.4470588, 1, 1,
0.180462, -0.6384222, 2.123704, 0, 0.4431373, 1, 1,
0.1813153, -0.2930109, 5.267864, 0, 0.4352941, 1, 1,
0.1835476, -0.2399114, 3.417876, 0, 0.4313726, 1, 1,
0.1852503, 0.7686967, -0.3101628, 0, 0.4235294, 1, 1,
0.1872166, -0.9553676, 2.710802, 0, 0.4196078, 1, 1,
0.1896559, -0.7618366, 2.520581, 0, 0.4117647, 1, 1,
0.1973736, 1.592043, 1.434746, 0, 0.4078431, 1, 1,
0.1980864, -0.6763893, 2.400333, 0, 0.4, 1, 1,
0.1983386, 1.060399, 0.8021313, 0, 0.3921569, 1, 1,
0.2007761, 0.04369555, -0.2840339, 0, 0.3882353, 1, 1,
0.2020217, -1.435456, 1.719834, 0, 0.3803922, 1, 1,
0.2023339, -0.1754334, 0.2658315, 0, 0.3764706, 1, 1,
0.2027487, 0.4092017, -0.6316043, 0, 0.3686275, 1, 1,
0.2043831, 0.3261115, 0.1914495, 0, 0.3647059, 1, 1,
0.2053468, 0.2099103, 0.3757311, 0, 0.3568628, 1, 1,
0.2074687, -0.1713318, 1.11605, 0, 0.3529412, 1, 1,
0.2129882, 0.2536531, 1.156872, 0, 0.345098, 1, 1,
0.2146082, 0.8369535, -0.1510925, 0, 0.3411765, 1, 1,
0.2155055, 0.09646833, 0.8618034, 0, 0.3333333, 1, 1,
0.2156878, 2.271723, 1.423244, 0, 0.3294118, 1, 1,
0.2177328, -2.123972, 4.486536, 0, 0.3215686, 1, 1,
0.2262325, -0.8657481, 1.139573, 0, 0.3176471, 1, 1,
0.2340088, 0.7544594, -0.6594824, 0, 0.3098039, 1, 1,
0.2348044, -1.193727, 3.494507, 0, 0.3058824, 1, 1,
0.2350797, -1.029127, 0.1689989, 0, 0.2980392, 1, 1,
0.2416825, -1.193468, 1.122457, 0, 0.2901961, 1, 1,
0.242445, -0.2845153, 2.267737, 0, 0.2862745, 1, 1,
0.2467209, -0.9116024, 1.51811, 0, 0.2784314, 1, 1,
0.2488481, -0.5082789, 2.341597, 0, 0.2745098, 1, 1,
0.2492651, 0.1364983, 1.864882, 0, 0.2666667, 1, 1,
0.2519706, -0.884016, 4.715277, 0, 0.2627451, 1, 1,
0.2552714, -1.808211, 3.474995, 0, 0.254902, 1, 1,
0.2565384, -1.765341, 4.506569, 0, 0.2509804, 1, 1,
0.258208, -1.191352, 4.704085, 0, 0.2431373, 1, 1,
0.2608148, -0.6384019, 3.069991, 0, 0.2392157, 1, 1,
0.2617041, 0.9253933, 0.01523662, 0, 0.2313726, 1, 1,
0.2656974, 0.04855274, 0.9277605, 0, 0.227451, 1, 1,
0.2661495, -1.254467, 2.368202, 0, 0.2196078, 1, 1,
0.2688287, -0.02465764, 1.609784, 0, 0.2156863, 1, 1,
0.2708032, -1.337179, 4.23376, 0, 0.2078431, 1, 1,
0.2743577, 1.119457, 1.414256, 0, 0.2039216, 1, 1,
0.2789587, 1.679607, -0.3761822, 0, 0.1960784, 1, 1,
0.281624, 0.592208, 1.486652, 0, 0.1882353, 1, 1,
0.2862873, 0.6389507, 1.456881, 0, 0.1843137, 1, 1,
0.2893209, -0.8548208, 1.617171, 0, 0.1764706, 1, 1,
0.2912275, 1.131193, 0.9895309, 0, 0.172549, 1, 1,
0.2931103, -2.116188, 3.761831, 0, 0.1647059, 1, 1,
0.2987756, -0.7378451, 2.784719, 0, 0.1607843, 1, 1,
0.3008896, -0.5724284, 0.9771057, 0, 0.1529412, 1, 1,
0.3013405, -0.6839501, 0.9164423, 0, 0.1490196, 1, 1,
0.3036032, 0.2978133, 2.183958, 0, 0.1411765, 1, 1,
0.3039727, 0.7033412, 1.228621, 0, 0.1372549, 1, 1,
0.3152912, 0.4955768, 1.833959, 0, 0.1294118, 1, 1,
0.3169212, -0.6082882, 2.573015, 0, 0.1254902, 1, 1,
0.3206714, -0.6017932, 3.565979, 0, 0.1176471, 1, 1,
0.3337176, 0.3887787, -0.629491, 0, 0.1137255, 1, 1,
0.3338332, 0.02115243, 2.120031, 0, 0.1058824, 1, 1,
0.3357763, 1.380529, -0.6531788, 0, 0.09803922, 1, 1,
0.3367787, -1.217141, 1.257056, 0, 0.09411765, 1, 1,
0.338063, 1.472171, 1.047963, 0, 0.08627451, 1, 1,
0.3393341, -1.015206, 3.268789, 0, 0.08235294, 1, 1,
0.3609125, 1.078441, 0.5621331, 0, 0.07450981, 1, 1,
0.361359, -0.3550613, 2.84008, 0, 0.07058824, 1, 1,
0.3650291, -0.2113335, 2.853663, 0, 0.0627451, 1, 1,
0.3661745, -1.28912, 3.756091, 0, 0.05882353, 1, 1,
0.3663465, -2.114525, 2.525016, 0, 0.05098039, 1, 1,
0.3772665, 0.7575328, -0.5734707, 0, 0.04705882, 1, 1,
0.3797858, -1.066543, 2.423607, 0, 0.03921569, 1, 1,
0.3805028, -1.666331, 3.200467, 0, 0.03529412, 1, 1,
0.384445, -0.2564733, 2.694336, 0, 0.02745098, 1, 1,
0.3895225, 1.677028, -1.470593, 0, 0.02352941, 1, 1,
0.3966066, -0.7431943, 4.071975, 0, 0.01568628, 1, 1,
0.4012077, 0.5335649, -0.98298, 0, 0.01176471, 1, 1,
0.4022784, 0.1983087, -1.511833, 0, 0.003921569, 1, 1,
0.4033791, -1.066043, 2.871608, 0.003921569, 0, 1, 1,
0.4074634, -0.5473198, 2.349501, 0.007843138, 0, 1, 1,
0.4093259, 0.1723942, 2.96697, 0.01568628, 0, 1, 1,
0.412402, 0.4460715, -0.9774929, 0.01960784, 0, 1, 1,
0.4137281, 0.4620666, 1.253746, 0.02745098, 0, 1, 1,
0.4234477, -0.6351268, 1.4628, 0.03137255, 0, 1, 1,
0.4252033, 0.5434033, 2.344102, 0.03921569, 0, 1, 1,
0.4262687, 0.3150221, 1.555592, 0.04313726, 0, 1, 1,
0.4335877, 1.470776, -0.1688288, 0.05098039, 0, 1, 1,
0.4348102, 0.1355068, 0.8278995, 0.05490196, 0, 1, 1,
0.4353422, -0.1058222, 2.253786, 0.0627451, 0, 1, 1,
0.4394359, 0.9137245, 0.2852637, 0.06666667, 0, 1, 1,
0.4406096, 1.376562, -0.9190595, 0.07450981, 0, 1, 1,
0.442493, -1.179261, 2.20836, 0.07843138, 0, 1, 1,
0.4449628, -0.2925476, 1.485479, 0.08627451, 0, 1, 1,
0.4468104, 0.31591, 1.278523, 0.09019608, 0, 1, 1,
0.4494197, -1.040327, 2.691477, 0.09803922, 0, 1, 1,
0.4577183, 1.950484, 0.3444887, 0.1058824, 0, 1, 1,
0.4640072, -0.2307091, 2.83361, 0.1098039, 0, 1, 1,
0.465245, -0.02364373, 2.827834, 0.1176471, 0, 1, 1,
0.4738112, 1.923856, 0.7378432, 0.1215686, 0, 1, 1,
0.4752098, 2.279566, 1.426479, 0.1294118, 0, 1, 1,
0.4762353, -0.2753505, 1.304034, 0.1333333, 0, 1, 1,
0.4906991, 1.832073, -0.1372082, 0.1411765, 0, 1, 1,
0.4947405, -1.577702, 2.856169, 0.145098, 0, 1, 1,
0.4951717, 1.636321, -1.547348, 0.1529412, 0, 1, 1,
0.5007162, 1.171543, 1.208588, 0.1568628, 0, 1, 1,
0.5039413, -0.2363873, 1.417008, 0.1647059, 0, 1, 1,
0.5064132, 0.6510406, 0.4103399, 0.1686275, 0, 1, 1,
0.5083134, 1.364297, -0.4324352, 0.1764706, 0, 1, 1,
0.511123, -1.13631, 2.53212, 0.1803922, 0, 1, 1,
0.5122818, 1.060188, 1.105426, 0.1882353, 0, 1, 1,
0.5167671, -0.9450915, 3.826395, 0.1921569, 0, 1, 1,
0.5180478, 0.431154, 0.1340431, 0.2, 0, 1, 1,
0.522218, -2.126951, 3.553482, 0.2078431, 0, 1, 1,
0.5227885, -2.789266, 4.169587, 0.2117647, 0, 1, 1,
0.5271024, 0.5915215, 0.6106253, 0.2196078, 0, 1, 1,
0.5307757, -0.4944511, 2.607231, 0.2235294, 0, 1, 1,
0.5357519, -0.05089777, 1.525955, 0.2313726, 0, 1, 1,
0.5359195, -2.978856, 2.296697, 0.2352941, 0, 1, 1,
0.5378293, -0.4749227, 2.927442, 0.2431373, 0, 1, 1,
0.5390491, 0.7305869, -0.1497065, 0.2470588, 0, 1, 1,
0.5399562, 0.241533, 0.5362692, 0.254902, 0, 1, 1,
0.5424868, 1.224879, 0.5124762, 0.2588235, 0, 1, 1,
0.5443286, 0.1648058, -0.1319378, 0.2666667, 0, 1, 1,
0.548748, 0.5406231, 1.513927, 0.2705882, 0, 1, 1,
0.5507032, -0.6797386, 3.392579, 0.2784314, 0, 1, 1,
0.5524741, -2.169375, 1.473402, 0.282353, 0, 1, 1,
0.553078, -0.4592905, 1.349257, 0.2901961, 0, 1, 1,
0.5543457, -0.0969424, 1.113681, 0.2941177, 0, 1, 1,
0.5576582, -0.8116023, 0.08767377, 0.3019608, 0, 1, 1,
0.5600933, -0.2553442, 2.223413, 0.3098039, 0, 1, 1,
0.5608042, -1.616112, 4.215374, 0.3137255, 0, 1, 1,
0.5630707, -0.3194036, 2.448921, 0.3215686, 0, 1, 1,
0.5640517, 0.7923569, 0.04648543, 0.3254902, 0, 1, 1,
0.5648215, 1.0222, 0.9695994, 0.3333333, 0, 1, 1,
0.5669067, 0.08840857, 1.436986, 0.3372549, 0, 1, 1,
0.5682694, -1.227253, 3.70898, 0.345098, 0, 1, 1,
0.5711554, -1.376483, 2.457696, 0.3490196, 0, 1, 1,
0.5747796, -0.2781026, 1.529207, 0.3568628, 0, 1, 1,
0.5753239, 1.253585, 0.05565511, 0.3607843, 0, 1, 1,
0.5765592, 0.6486653, 0.3915922, 0.3686275, 0, 1, 1,
0.5770247, 0.4666804, 1.232921, 0.372549, 0, 1, 1,
0.5814398, -1.950935, 2.430899, 0.3803922, 0, 1, 1,
0.5818179, -0.2447638, 2.106529, 0.3843137, 0, 1, 1,
0.583375, 0.1148727, 1.179152, 0.3921569, 0, 1, 1,
0.5894402, -0.3282202, 2.304056, 0.3960784, 0, 1, 1,
0.5913498, 1.052258, 0.3236339, 0.4039216, 0, 1, 1,
0.5927868, 1.175683, -0.4287176, 0.4117647, 0, 1, 1,
0.5933344, 0.9664778, 0.2079912, 0.4156863, 0, 1, 1,
0.593764, 0.6909897, 0.7369354, 0.4235294, 0, 1, 1,
0.5966599, 0.3896571, 0.4415126, 0.427451, 0, 1, 1,
0.5966941, -0.2807688, 0.7776487, 0.4352941, 0, 1, 1,
0.6012275, -0.4347841, 2.450219, 0.4392157, 0, 1, 1,
0.6030965, 0.7441651, -0.5047224, 0.4470588, 0, 1, 1,
0.6069427, 0.3965266, 0.6126223, 0.4509804, 0, 1, 1,
0.6140308, -0.06069588, 0.6959362, 0.4588235, 0, 1, 1,
0.6143054, -1.928857, 4.227496, 0.4627451, 0, 1, 1,
0.6158843, -0.9794823, 2.859755, 0.4705882, 0, 1, 1,
0.6170374, -1.089661, 3.850778, 0.4745098, 0, 1, 1,
0.6179551, 0.9266118, 1.160866, 0.4823529, 0, 1, 1,
0.6224213, -1.203136, 1.331639, 0.4862745, 0, 1, 1,
0.6265934, 0.4610813, 1.122792, 0.4941176, 0, 1, 1,
0.6319316, -0.9084955, 4.23109, 0.5019608, 0, 1, 1,
0.6345525, 0.9192047, -0.2885835, 0.5058824, 0, 1, 1,
0.6350788, -0.6996434, 2.969115, 0.5137255, 0, 1, 1,
0.6401226, -0.2144726, 0.6363487, 0.5176471, 0, 1, 1,
0.6403202, -0.8864561, 2.576632, 0.5254902, 0, 1, 1,
0.64043, 0.1036688, 0.9081271, 0.5294118, 0, 1, 1,
0.6429783, -0.406462, 2.589625, 0.5372549, 0, 1, 1,
0.6433387, -0.3441051, 1.864013, 0.5411765, 0, 1, 1,
0.6454908, -0.5748541, 3.988176, 0.5490196, 0, 1, 1,
0.6461374, -0.7881895, 1.944854, 0.5529412, 0, 1, 1,
0.6463201, -0.3336322, 0.8811121, 0.5607843, 0, 1, 1,
0.6485713, -0.609645, 2.044715, 0.5647059, 0, 1, 1,
0.6489182, -1.601521, 2.961703, 0.572549, 0, 1, 1,
0.6512326, 0.325717, 1.581642, 0.5764706, 0, 1, 1,
0.6534472, -1.425783, 3.767157, 0.5843138, 0, 1, 1,
0.6548877, 1.233007, 1.329509, 0.5882353, 0, 1, 1,
0.6550536, 1.073255, -0.5468432, 0.5960785, 0, 1, 1,
0.656462, -0.1825924, 2.569852, 0.6039216, 0, 1, 1,
0.6573703, -1.263031, 3.347849, 0.6078432, 0, 1, 1,
0.6642085, -1.189939, 3.155708, 0.6156863, 0, 1, 1,
0.6651537, 1.433245, 0.6575655, 0.6196079, 0, 1, 1,
0.6663072, 0.4706804, 1.554187, 0.627451, 0, 1, 1,
0.6680291, -0.381086, 2.017038, 0.6313726, 0, 1, 1,
0.6713366, 0.4306309, 0.2952687, 0.6392157, 0, 1, 1,
0.6717328, -1.042831, 2.692056, 0.6431373, 0, 1, 1,
0.6739553, 1.6698, -1.653555, 0.6509804, 0, 1, 1,
0.6799157, 1.666363, 0.07967278, 0.654902, 0, 1, 1,
0.6813134, -0.07299128, 0.8109396, 0.6627451, 0, 1, 1,
0.6857767, 0.7629321, 0.8650588, 0.6666667, 0, 1, 1,
0.6926347, 1.090012, 0.779695, 0.6745098, 0, 1, 1,
0.6945539, -1.729865, 1.803273, 0.6784314, 0, 1, 1,
0.6957688, 0.01743961, 1.898414, 0.6862745, 0, 1, 1,
0.7006429, 1.186433, -0.6129258, 0.6901961, 0, 1, 1,
0.7041092, -1.878243, 1.645891, 0.6980392, 0, 1, 1,
0.7047375, -1.835968, 2.884832, 0.7058824, 0, 1, 1,
0.7053989, -0.09486704, 1.149961, 0.7098039, 0, 1, 1,
0.7059119, -0.1521153, 1.891291, 0.7176471, 0, 1, 1,
0.7070436, 0.006311879, 3.523368, 0.7215686, 0, 1, 1,
0.7079006, 0.5834196, 0.8206393, 0.7294118, 0, 1, 1,
0.7171966, -0.3563489, 1.987012, 0.7333333, 0, 1, 1,
0.7211209, -1.196227, 2.884557, 0.7411765, 0, 1, 1,
0.7234671, -0.09272809, 1.106338, 0.7450981, 0, 1, 1,
0.7253344, 1.694222, 0.4673973, 0.7529412, 0, 1, 1,
0.7362607, -0.290988, 2.130696, 0.7568628, 0, 1, 1,
0.736864, 1.039288, -0.4042266, 0.7647059, 0, 1, 1,
0.7379795, -0.4822176, 2.866401, 0.7686275, 0, 1, 1,
0.7431212, 0.4223351, 2.848462, 0.7764706, 0, 1, 1,
0.7488352, -1.459534, 2.492644, 0.7803922, 0, 1, 1,
0.7499724, -0.3667392, 2.713017, 0.7882353, 0, 1, 1,
0.7512823, 0.639006, 3.102317, 0.7921569, 0, 1, 1,
0.7539486, 1.350664, 1.765052, 0.8, 0, 1, 1,
0.7600639, -0.6403844, 1.830098, 0.8078431, 0, 1, 1,
0.7717967, 0.2594468, 2.105343, 0.8117647, 0, 1, 1,
0.7756166, -0.6624907, 1.81854, 0.8196079, 0, 1, 1,
0.7837456, 0.9047713, 1.907076, 0.8235294, 0, 1, 1,
0.7928793, 1.334087, 1.613162, 0.8313726, 0, 1, 1,
0.7936608, -0.1610698, 1.463174, 0.8352941, 0, 1, 1,
0.7986341, -0.2489636, 4.43351, 0.8431373, 0, 1, 1,
0.8005477, -0.7942408, 3.278086, 0.8470588, 0, 1, 1,
0.8049554, 0.820848, 1.744859, 0.854902, 0, 1, 1,
0.8148741, -0.7823477, 3.462329, 0.8588235, 0, 1, 1,
0.8161409, -0.8744109, 2.43149, 0.8666667, 0, 1, 1,
0.8185434, 0.840089, 0.9604766, 0.8705882, 0, 1, 1,
0.821788, -1.872561, 2.794673, 0.8784314, 0, 1, 1,
0.8272642, -1.99852, 2.604801, 0.8823529, 0, 1, 1,
0.8357495, -0.670673, 0.9962742, 0.8901961, 0, 1, 1,
0.8368211, -0.232863, 2.067096, 0.8941177, 0, 1, 1,
0.8419173, 0.5076078, 2.558731, 0.9019608, 0, 1, 1,
0.8453976, 0.2391555, -0.1624956, 0.9098039, 0, 1, 1,
0.8475885, 0.2173976, 0.2249302, 0.9137255, 0, 1, 1,
0.8521838, 0.2782587, 0.2838745, 0.9215686, 0, 1, 1,
0.8522694, 0.4009344, 0.2352594, 0.9254902, 0, 1, 1,
0.8613638, 0.04309075, 2.596209, 0.9333333, 0, 1, 1,
0.8622967, 1.093361, 0.9301636, 0.9372549, 0, 1, 1,
0.8773832, -2.131531, 2.105374, 0.945098, 0, 1, 1,
0.8780056, 0.1208572, 2.756576, 0.9490196, 0, 1, 1,
0.8807929, 0.4911244, 0.9130195, 0.9568627, 0, 1, 1,
0.9017281, 1.210397, 2.059109, 0.9607843, 0, 1, 1,
0.9054366, 1.407531, -0.3297495, 0.9686275, 0, 1, 1,
0.9072295, -0.761842, 1.770952, 0.972549, 0, 1, 1,
0.9087048, -0.1646348, 2.759439, 0.9803922, 0, 1, 1,
0.9100182, 0.7854786, 0.6558319, 0.9843137, 0, 1, 1,
0.9119609, -1.351774, 2.694106, 0.9921569, 0, 1, 1,
0.9124196, -0.542128, 3.334676, 0.9960784, 0, 1, 1,
0.9133407, 1.201353, -0.3846173, 1, 0, 0.9960784, 1,
0.916211, 0.1548926, 2.488358, 1, 0, 0.9882353, 1,
0.9172977, 1.635498, 0.6762153, 1, 0, 0.9843137, 1,
0.9182549, 1.304818, 0.9679619, 1, 0, 0.9764706, 1,
0.9201193, 1.416957, 1.604793, 1, 0, 0.972549, 1,
0.9218053, 2.145235, 0.08127369, 1, 0, 0.9647059, 1,
0.9247278, -0.7765457, 3.247705, 1, 0, 0.9607843, 1,
0.9384466, 0.8246816, 1.776987, 1, 0, 0.9529412, 1,
0.9390668, -0.4519807, 3.638058, 1, 0, 0.9490196, 1,
0.9427579, -0.1802975, 1.280864, 1, 0, 0.9411765, 1,
0.9483393, -0.6223648, 2.694482, 1, 0, 0.9372549, 1,
0.948642, 1.825912, 0.9559968, 1, 0, 0.9294118, 1,
0.9567467, 0.1732526, -0.622794, 1, 0, 0.9254902, 1,
0.9642369, 0.09452305, 1.265729, 1, 0, 0.9176471, 1,
0.9644985, -0.5970339, 1.890649, 1, 0, 0.9137255, 1,
0.9662695, -0.389546, 2.936813, 1, 0, 0.9058824, 1,
0.9667396, -0.6540511, 0.7834858, 1, 0, 0.9019608, 1,
0.9742513, 1.400427, 1.322015, 1, 0, 0.8941177, 1,
0.9773218, -0.2560991, 1.865104, 1, 0, 0.8862745, 1,
0.9852097, 0.6100893, 2.170564, 1, 0, 0.8823529, 1,
0.9873813, -0.09128069, 1.366187, 1, 0, 0.8745098, 1,
0.987906, 0.5319635, 0.6877149, 1, 0, 0.8705882, 1,
0.9882405, 0.7501585, -0.7456493, 1, 0, 0.8627451, 1,
0.9935161, -0.2102766, 2.926948, 1, 0, 0.8588235, 1,
0.9940305, 0.4937144, 3.150661, 1, 0, 0.8509804, 1,
1.015839, -0.2488027, 2.847441, 1, 0, 0.8470588, 1,
1.016657, -2.003747, 4.334757, 1, 0, 0.8392157, 1,
1.021137, 0.9189271, -1.130674, 1, 0, 0.8352941, 1,
1.025473, 0.276448, 2.123361, 1, 0, 0.827451, 1,
1.037503, -0.9295233, 2.690699, 1, 0, 0.8235294, 1,
1.062085, 1.490255, 0.01696372, 1, 0, 0.8156863, 1,
1.068273, 0.3118511, 0.4405865, 1, 0, 0.8117647, 1,
1.071219, -0.1771545, 0.9366251, 1, 0, 0.8039216, 1,
1.073406, 1.549438, 2.194985, 1, 0, 0.7960784, 1,
1.077669, 0.4892046, 2.087325, 1, 0, 0.7921569, 1,
1.079868, 0.06455909, 0.8811433, 1, 0, 0.7843137, 1,
1.095787, -0.2613526, 2.137303, 1, 0, 0.7803922, 1,
1.098274, -0.7083234, 1.822217, 1, 0, 0.772549, 1,
1.110468, 0.1384527, 1.75844, 1, 0, 0.7686275, 1,
1.111336, -0.8770302, 4.014384, 1, 0, 0.7607843, 1,
1.112979, -0.6116925, 2.392572, 1, 0, 0.7568628, 1,
1.113256, -0.6585246, 1.348113, 1, 0, 0.7490196, 1,
1.126629, 0.3574823, 2.896929, 1, 0, 0.7450981, 1,
1.133822, 0.1016951, 2.943497, 1, 0, 0.7372549, 1,
1.14041, -0.6157606, 2.625157, 1, 0, 0.7333333, 1,
1.143252, 0.5469413, 1.667007, 1, 0, 0.7254902, 1,
1.154498, -1.015981, 3.180147, 1, 0, 0.7215686, 1,
1.155287, 2.200735, -2.05951, 1, 0, 0.7137255, 1,
1.159024, 0.1794268, 0.4045932, 1, 0, 0.7098039, 1,
1.159862, 0.5633425, 1.702513, 1, 0, 0.7019608, 1,
1.164581, -1.277579, 1.627365, 1, 0, 0.6941177, 1,
1.173171, 0.243172, -1.317946, 1, 0, 0.6901961, 1,
1.173481, -0.8580055, 2.36262, 1, 0, 0.682353, 1,
1.174838, -0.3418658, 3.108153, 1, 0, 0.6784314, 1,
1.178369, -0.6849737, 2.866594, 1, 0, 0.6705883, 1,
1.187721, -0.3341563, 1.692466, 1, 0, 0.6666667, 1,
1.195406, -0.0352083, 1.635714, 1, 0, 0.6588235, 1,
1.206865, 0.6580158, 0.3338005, 1, 0, 0.654902, 1,
1.207974, 0.6135866, -0.6207846, 1, 0, 0.6470588, 1,
1.217557, 0.4895911, 0.9726573, 1, 0, 0.6431373, 1,
1.238, -0.5108689, 2.02464, 1, 0, 0.6352941, 1,
1.238223, -0.08162514, 1.880922, 1, 0, 0.6313726, 1,
1.251152, -1.49668, 2.517262, 1, 0, 0.6235294, 1,
1.268481, -2.444841, 3.852913, 1, 0, 0.6196079, 1,
1.275354, -0.1263414, 1.102851, 1, 0, 0.6117647, 1,
1.282942, 0.2230925, 2.13892, 1, 0, 0.6078432, 1,
1.290178, -0.7796924, 2.009361, 1, 0, 0.6, 1,
1.293603, 0.1259013, 2.708082, 1, 0, 0.5921569, 1,
1.300138, -0.7464079, 0.6759472, 1, 0, 0.5882353, 1,
1.303314, -0.4892641, 1.768516, 1, 0, 0.5803922, 1,
1.308428, 0.6496336, 3.059732, 1, 0, 0.5764706, 1,
1.328987, 0.1226374, 1.269293, 1, 0, 0.5686275, 1,
1.338903, 1.031416, 0.2870481, 1, 0, 0.5647059, 1,
1.340592, -1.240614, 1.807836, 1, 0, 0.5568628, 1,
1.354243, -1.145635, 1.712333, 1, 0, 0.5529412, 1,
1.355125, -1.207164, 3.789529, 1, 0, 0.5450981, 1,
1.366007, 0.4916031, 1.713656, 1, 0, 0.5411765, 1,
1.368761, -2.349367, 3.459604, 1, 0, 0.5333334, 1,
1.381383, 0.579229, 0.8753738, 1, 0, 0.5294118, 1,
1.391146, 1.250296, -0.7944362, 1, 0, 0.5215687, 1,
1.393294, 0.1073377, 1.65093, 1, 0, 0.5176471, 1,
1.402133, -0.6711025, 4.392548, 1, 0, 0.509804, 1,
1.408987, -0.3894408, 2.025437, 1, 0, 0.5058824, 1,
1.433164, -0.5665838, 1.941889, 1, 0, 0.4980392, 1,
1.436346, 1.208967, 1.578934, 1, 0, 0.4901961, 1,
1.441132, 1.43109, 1.437185, 1, 0, 0.4862745, 1,
1.446258, 0.4060412, 1.044507, 1, 0, 0.4784314, 1,
1.450475, 1.239347, -0.3968412, 1, 0, 0.4745098, 1,
1.456926, 0.1203212, 1.909317, 1, 0, 0.4666667, 1,
1.463125, -0.3504663, 3.517192, 1, 0, 0.4627451, 1,
1.463771, -1.04729, 3.109056, 1, 0, 0.454902, 1,
1.468468, -0.9014035, 1.596437, 1, 0, 0.4509804, 1,
1.470077, -0.8259019, 2.745213, 1, 0, 0.4431373, 1,
1.489941, -0.705878, 1.990527, 1, 0, 0.4392157, 1,
1.501086, -0.1972426, 2.808644, 1, 0, 0.4313726, 1,
1.501999, 0.8683491, 1.426288, 1, 0, 0.427451, 1,
1.526652, -0.5823427, 2.833563, 1, 0, 0.4196078, 1,
1.526752, -0.03465174, 1.849041, 1, 0, 0.4156863, 1,
1.541125, 2.037355, 0.3519051, 1, 0, 0.4078431, 1,
1.541276, 0.1234412, 1.167114, 1, 0, 0.4039216, 1,
1.544983, 0.9658646, 0.05709344, 1, 0, 0.3960784, 1,
1.549428, -0.4550419, 2.144076, 1, 0, 0.3882353, 1,
1.550297, 1.897766, -0.1313431, 1, 0, 0.3843137, 1,
1.552276, 0.4945172, 2.026766, 1, 0, 0.3764706, 1,
1.552783, 0.11537, 1.065309, 1, 0, 0.372549, 1,
1.560003, -0.6137166, 0.5740038, 1, 0, 0.3647059, 1,
1.567302, 0.1873446, 1.090585, 1, 0, 0.3607843, 1,
1.576994, 1.234609, 2.197229, 1, 0, 0.3529412, 1,
1.580053, -0.7492024, 2.575894, 1, 0, 0.3490196, 1,
1.587666, 0.2821588, 2.095607, 1, 0, 0.3411765, 1,
1.600116, -0.4828289, 2.274662, 1, 0, 0.3372549, 1,
1.60073, 0.398868, 1.008127, 1, 0, 0.3294118, 1,
1.607893, -1.149261, 2.221637, 1, 0, 0.3254902, 1,
1.618441, 0.7409759, 1.752731, 1, 0, 0.3176471, 1,
1.623922, 0.2496767, 3.662812, 1, 0, 0.3137255, 1,
1.640237, -0.4585065, 0.5571369, 1, 0, 0.3058824, 1,
1.646803, -2.173315, 3.227912, 1, 0, 0.2980392, 1,
1.665399, -0.4877969, 2.27329, 1, 0, 0.2941177, 1,
1.681856, -0.2695066, 1.583753, 1, 0, 0.2862745, 1,
1.686096, -0.6385253, 3.171537, 1, 0, 0.282353, 1,
1.69731, -0.5795082, 0.8853237, 1, 0, 0.2745098, 1,
1.710636, 0.8643501, 0.9901311, 1, 0, 0.2705882, 1,
1.711722, 0.2919442, 2.427663, 1, 0, 0.2627451, 1,
1.721686, 0.9947412, -0.2151422, 1, 0, 0.2588235, 1,
1.736039, 1.399112, 0.5680245, 1, 0, 0.2509804, 1,
1.738406, 0.1499682, 1.719078, 1, 0, 0.2470588, 1,
1.740712, -1.329821, 4.359866, 1, 0, 0.2392157, 1,
1.762529, 2.039936, 1.843991, 1, 0, 0.2352941, 1,
1.771434, 1.193372, 1.119974, 1, 0, 0.227451, 1,
1.782277, 0.6408605, 2.607849, 1, 0, 0.2235294, 1,
1.815899, 0.311994, 0.228934, 1, 0, 0.2156863, 1,
1.822156, -0.9033409, 2.160384, 1, 0, 0.2117647, 1,
1.849203, 0.756557, -1.365367, 1, 0, 0.2039216, 1,
1.867137, 2.377683, 0.3655297, 1, 0, 0.1960784, 1,
1.872081, -1.287261, 1.982827, 1, 0, 0.1921569, 1,
1.884242, -0.531908, 2.740355, 1, 0, 0.1843137, 1,
1.901027, -0.562344, 2.357836, 1, 0, 0.1803922, 1,
1.919497, -0.348506, 1.493494, 1, 0, 0.172549, 1,
1.933385, 3.301179, 0.04405759, 1, 0, 0.1686275, 1,
1.933601, 0.3381812, -0.3130803, 1, 0, 0.1607843, 1,
1.93564, -1.17119, 4.242789, 1, 0, 0.1568628, 1,
1.943254, -0.6134561, 2.327263, 1, 0, 0.1490196, 1,
1.955658, 0.3570318, 1.558074, 1, 0, 0.145098, 1,
1.981925, 1.315898, 1.505148, 1, 0, 0.1372549, 1,
1.997779, -0.6981461, 2.355945, 1, 0, 0.1333333, 1,
2.028333, 1.527758, 0.03154292, 1, 0, 0.1254902, 1,
2.028556, 0.2114341, 2.214906, 1, 0, 0.1215686, 1,
2.047585, -0.4449208, 2.632347, 1, 0, 0.1137255, 1,
2.051504, 0.8722988, 1.012688, 1, 0, 0.1098039, 1,
2.061602, -1.156511, -0.2142781, 1, 0, 0.1019608, 1,
2.065507, 0.3798932, 0.4941844, 1, 0, 0.09411765, 1,
2.173987, 0.1622905, 2.364838, 1, 0, 0.09019608, 1,
2.175251, 0.2451073, 2.578028, 1, 0, 0.08235294, 1,
2.186939, -0.442515, 1.462687, 1, 0, 0.07843138, 1,
2.205394, -0.7453213, 1.193196, 1, 0, 0.07058824, 1,
2.27197, -0.3153871, 2.261978, 1, 0, 0.06666667, 1,
2.285783, 0.174311, 2.300243, 1, 0, 0.05882353, 1,
2.35568, -1.623714, 1.457084, 1, 0, 0.05490196, 1,
2.371667, -1.071642, 2.026338, 1, 0, 0.04705882, 1,
2.396964, 0.4375493, 1.301722, 1, 0, 0.04313726, 1,
2.453818, -2.321503, 1.331185, 1, 0, 0.03529412, 1,
2.503717, -0.9509861, 0.2526895, 1, 0, 0.03137255, 1,
2.527683, -1.501129, -0.1473989, 1, 0, 0.02352941, 1,
2.700842, -0.1701997, 0.09592775, 1, 0, 0.01960784, 1,
2.730314, 1.533206, 1.022252, 1, 0, 0.01176471, 1,
3.14359, 0.5502567, 2.30786, 1, 0, 0.007843138, 1
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
0.022488, -4.595611, -7.169396, 0, -0.5, 0.5, 0.5,
0.022488, -4.595611, -7.169396, 1, -0.5, 0.5, 0.5,
0.022488, -4.595611, -7.169396, 1, 1.5, 0.5, 0.5,
0.022488, -4.595611, -7.169396, 0, 1.5, 0.5, 0.5
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
-4.156668, -0.07496011, -7.169396, 0, -0.5, 0.5, 0.5,
-4.156668, -0.07496011, -7.169396, 1, -0.5, 0.5, 0.5,
-4.156668, -0.07496011, -7.169396, 1, 1.5, 0.5, 0.5,
-4.156668, -0.07496011, -7.169396, 0, 1.5, 0.5, 0.5
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
-4.156668, -4.595611, -0.04581189, 0, -0.5, 0.5, 0.5,
-4.156668, -4.595611, -0.04581189, 1, -0.5, 0.5, 0.5,
-4.156668, -4.595611, -0.04581189, 1, 1.5, 0.5, 0.5,
-4.156668, -4.595611, -0.04581189, 0, 1.5, 0.5, 0.5
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
-3, -3.552384, -5.525492,
3, -3.552384, -5.525492,
-3, -3.552384, -5.525492,
-3, -3.726255, -5.799476,
-2, -3.552384, -5.525492,
-2, -3.726255, -5.799476,
-1, -3.552384, -5.525492,
-1, -3.726255, -5.799476,
0, -3.552384, -5.525492,
0, -3.726255, -5.799476,
1, -3.552384, -5.525492,
1, -3.726255, -5.799476,
2, -3.552384, -5.525492,
2, -3.726255, -5.799476,
3, -3.552384, -5.525492,
3, -3.726255, -5.799476
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
-3, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
-3, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
-3, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
-3, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5,
-2, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
-2, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
-2, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
-2, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5,
-1, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
-1, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
-1, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
-1, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5,
0, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
0, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
0, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
0, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5,
1, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
1, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
1, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
1, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5,
2, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
2, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
2, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
2, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5,
3, -4.073997, -6.347444, 0, -0.5, 0.5, 0.5,
3, -4.073997, -6.347444, 1, -0.5, 0.5, 0.5,
3, -4.073997, -6.347444, 1, 1.5, 0.5, 0.5,
3, -4.073997, -6.347444, 0, 1.5, 0.5, 0.5
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
-3.192248, -3, -5.525492,
-3.192248, 3, -5.525492,
-3.192248, -3, -5.525492,
-3.352984, -3, -5.799476,
-3.192248, -2, -5.525492,
-3.352984, -2, -5.799476,
-3.192248, -1, -5.525492,
-3.352984, -1, -5.799476,
-3.192248, 0, -5.525492,
-3.352984, 0, -5.799476,
-3.192248, 1, -5.525492,
-3.352984, 1, -5.799476,
-3.192248, 2, -5.525492,
-3.352984, 2, -5.799476,
-3.192248, 3, -5.525492,
-3.352984, 3, -5.799476
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
-3.674458, -3, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, -3, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, -3, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, -3, -6.347444, 0, 1.5, 0.5, 0.5,
-3.674458, -2, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, -2, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, -2, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, -2, -6.347444, 0, 1.5, 0.5, 0.5,
-3.674458, -1, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, -1, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, -1, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, -1, -6.347444, 0, 1.5, 0.5, 0.5,
-3.674458, 0, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, 0, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, 0, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, 0, -6.347444, 0, 1.5, 0.5, 0.5,
-3.674458, 1, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, 1, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, 1, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, 1, -6.347444, 0, 1.5, 0.5, 0.5,
-3.674458, 2, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, 2, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, 2, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, 2, -6.347444, 0, 1.5, 0.5, 0.5,
-3.674458, 3, -6.347444, 0, -0.5, 0.5, 0.5,
-3.674458, 3, -6.347444, 1, -0.5, 0.5, 0.5,
-3.674458, 3, -6.347444, 1, 1.5, 0.5, 0.5,
-3.674458, 3, -6.347444, 0, 1.5, 0.5, 0.5
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
-3.192248, -3.552384, -4,
-3.192248, -3.552384, 4,
-3.192248, -3.552384, -4,
-3.352984, -3.726255, -4,
-3.192248, -3.552384, -2,
-3.352984, -3.726255, -2,
-3.192248, -3.552384, 0,
-3.352984, -3.726255, 0,
-3.192248, -3.552384, 2,
-3.352984, -3.726255, 2,
-3.192248, -3.552384, 4,
-3.352984, -3.726255, 4
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
-3.674458, -4.073997, -4, 0, -0.5, 0.5, 0.5,
-3.674458, -4.073997, -4, 1, -0.5, 0.5, 0.5,
-3.674458, -4.073997, -4, 1, 1.5, 0.5, 0.5,
-3.674458, -4.073997, -4, 0, 1.5, 0.5, 0.5,
-3.674458, -4.073997, -2, 0, -0.5, 0.5, 0.5,
-3.674458, -4.073997, -2, 1, -0.5, 0.5, 0.5,
-3.674458, -4.073997, -2, 1, 1.5, 0.5, 0.5,
-3.674458, -4.073997, -2, 0, 1.5, 0.5, 0.5,
-3.674458, -4.073997, 0, 0, -0.5, 0.5, 0.5,
-3.674458, -4.073997, 0, 1, -0.5, 0.5, 0.5,
-3.674458, -4.073997, 0, 1, 1.5, 0.5, 0.5,
-3.674458, -4.073997, 0, 0, 1.5, 0.5, 0.5,
-3.674458, -4.073997, 2, 0, -0.5, 0.5, 0.5,
-3.674458, -4.073997, 2, 1, -0.5, 0.5, 0.5,
-3.674458, -4.073997, 2, 1, 1.5, 0.5, 0.5,
-3.674458, -4.073997, 2, 0, 1.5, 0.5, 0.5,
-3.674458, -4.073997, 4, 0, -0.5, 0.5, 0.5,
-3.674458, -4.073997, 4, 1, -0.5, 0.5, 0.5,
-3.674458, -4.073997, 4, 1, 1.5, 0.5, 0.5,
-3.674458, -4.073997, 4, 0, 1.5, 0.5, 0.5
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
-3.192248, -3.552384, -5.525492,
-3.192248, 3.402464, -5.525492,
-3.192248, -3.552384, 5.433868,
-3.192248, 3.402464, 5.433868,
-3.192248, -3.552384, -5.525492,
-3.192248, -3.552384, 5.433868,
-3.192248, 3.402464, -5.525492,
-3.192248, 3.402464, 5.433868,
-3.192248, -3.552384, -5.525492,
3.237224, -3.552384, -5.525492,
-3.192248, -3.552384, 5.433868,
3.237224, -3.552384, 5.433868,
-3.192248, 3.402464, -5.525492,
3.237224, 3.402464, -5.525492,
-3.192248, 3.402464, 5.433868,
3.237224, 3.402464, 5.433868,
3.237224, -3.552384, -5.525492,
3.237224, 3.402464, -5.525492,
3.237224, -3.552384, 5.433868,
3.237224, 3.402464, 5.433868,
3.237224, -3.552384, -5.525492,
3.237224, -3.552384, 5.433868,
3.237224, 3.402464, -5.525492,
3.237224, 3.402464, 5.433868
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
var radius = 7.734715;
var distance = 34.41262;
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
mvMatrix.translate( -0.022488, 0.07496011, 0.04581189 );
mvMatrix.scale( 1.300717, 1.20246, 0.7630852 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.41262);
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
imazamethabenz<-read.table("imazamethabenz.xyz")
```

```
## Error in read.table("imazamethabenz.xyz"): no lines available in input
```

```r
x<-imazamethabenz$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
```

```r
y<-imazamethabenz$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
```

```r
z<-imazamethabenz$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazamethabenz' not found
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
-3.098614, -2.216149, -2.577445, 0, 0, 1, 1, 1,
-2.67297, -1.148318, -1.323445, 1, 0, 0, 1, 1,
-2.631949, 0.7338723, 0.7334319, 1, 0, 0, 1, 1,
-2.54964, 0.9745095, -1.200746, 1, 0, 0, 1, 1,
-2.501141, 0.3532466, -1.24941, 1, 0, 0, 1, 1,
-2.495887, -1.858779, -2.415681, 1, 0, 0, 1, 1,
-2.48799, -1.384795, -1.722578, 0, 0, 0, 1, 1,
-2.458561, 0.8189546, -2.038096, 0, 0, 0, 1, 1,
-2.455618, 0.04646682, -2.206856, 0, 0, 0, 1, 1,
-2.435229, 0.7045863, -1.838817, 0, 0, 0, 1, 1,
-2.431326, 0.2547257, -0.9558215, 0, 0, 0, 1, 1,
-2.346994, 0.6731611, -1.325796, 0, 0, 0, 1, 1,
-2.331329, 0.1702859, -1.897676, 0, 0, 0, 1, 1,
-2.256952, 0.1536631, -0.3342153, 1, 1, 1, 1, 1,
-2.198477, 0.0237279, -1.732533, 1, 1, 1, 1, 1,
-2.174025, -0.6088203, -1.421472, 1, 1, 1, 1, 1,
-2.153988, -1.525378, -2.542345, 1, 1, 1, 1, 1,
-2.142708, 0.5164763, -0.8142384, 1, 1, 1, 1, 1,
-2.112349, -0.1370502, -2.735363, 1, 1, 1, 1, 1,
-2.049395, 2.241772, -1.286227, 1, 1, 1, 1, 1,
-2.045255, 0.3873413, -0.5246891, 1, 1, 1, 1, 1,
-2.023534, 0.03210896, -0.2410181, 1, 1, 1, 1, 1,
-2.00727, -2.239121, -2.51312, 1, 1, 1, 1, 1,
-1.986983, 0.9219221, -2.023146, 1, 1, 1, 1, 1,
-1.966135, -2.25129, -2.646139, 1, 1, 1, 1, 1,
-1.960778, 0.4492668, -0.08306759, 1, 1, 1, 1, 1,
-1.958502, 0.1019101, -0.7579783, 1, 1, 1, 1, 1,
-1.958421, 0.68103, -0.8946579, 1, 1, 1, 1, 1,
-1.944568, 0.8504769, -1.126582, 0, 0, 1, 1, 1,
-1.909613, -0.1498927, -2.378166, 1, 0, 0, 1, 1,
-1.896591, 0.4148702, -1.696264, 1, 0, 0, 1, 1,
-1.88386, -1.254526, -1.770125, 1, 0, 0, 1, 1,
-1.874386, 0.5664051, -1.246933, 1, 0, 0, 1, 1,
-1.849985, 0.2625985, -0.932383, 1, 0, 0, 1, 1,
-1.832607, -2.185256, -3.335097, 0, 0, 0, 1, 1,
-1.821307, -1.433598, -2.055549, 0, 0, 0, 1, 1,
-1.809872, -0.6427525, -3.3499, 0, 0, 0, 1, 1,
-1.791561, 0.9508379, -0.2322591, 0, 0, 0, 1, 1,
-1.782048, -1.680758, -1.314174, 0, 0, 0, 1, 1,
-1.781215, 0.1196026, -0.8715277, 0, 0, 0, 1, 1,
-1.778301, -2.497471, -2.010954, 0, 0, 0, 1, 1,
-1.776476, -1.436653, -1.829963, 1, 1, 1, 1, 1,
-1.763635, -1.38038, -3.508634, 1, 1, 1, 1, 1,
-1.761136, -0.9364678, -2.266201, 1, 1, 1, 1, 1,
-1.754549, -1.084197, -4.77039, 1, 1, 1, 1, 1,
-1.749414, -1.349444, -3.301113, 1, 1, 1, 1, 1,
-1.728918, -0.286018, -1.200887, 1, 1, 1, 1, 1,
-1.717687, 0.2969416, -1.647094, 1, 1, 1, 1, 1,
-1.713837, 1.324823, -2.250721, 1, 1, 1, 1, 1,
-1.696885, -0.8362978, -1.948551, 1, 1, 1, 1, 1,
-1.668443, 0.6295422, -1.845758, 1, 1, 1, 1, 1,
-1.663946, -0.6372752, -2.338057, 1, 1, 1, 1, 1,
-1.654449, 1.788319, -0.07077582, 1, 1, 1, 1, 1,
-1.653291, -0.9363451, -1.768605, 1, 1, 1, 1, 1,
-1.649629, -1.411042, -2.576472, 1, 1, 1, 1, 1,
-1.648893, 0.04043915, -2.074072, 1, 1, 1, 1, 1,
-1.642735, 0.06222766, -0.5258632, 0, 0, 1, 1, 1,
-1.638707, 0.2317207, -2.477347, 1, 0, 0, 1, 1,
-1.637826, -1.004285, -1.762239, 1, 0, 0, 1, 1,
-1.636851, 0.7843298, -0.297705, 1, 0, 0, 1, 1,
-1.632705, -0.6442153, -2.272481, 1, 0, 0, 1, 1,
-1.63218, -1.062812, -2.29841, 1, 0, 0, 1, 1,
-1.628586, -0.1760125, -2.46912, 0, 0, 0, 1, 1,
-1.609815, 1.096215, -0.7339267, 0, 0, 0, 1, 1,
-1.608087, 0.7277895, -1.746002, 0, 0, 0, 1, 1,
-1.590803, -0.2444802, -2.432218, 0, 0, 0, 1, 1,
-1.588905, -0.8263761, -0.6482704, 0, 0, 0, 1, 1,
-1.585994, -0.2331325, -1.846174, 0, 0, 0, 1, 1,
-1.585167, 2.441712, -2.043122, 0, 0, 0, 1, 1,
-1.57398, 0.1653335, -0.8314291, 1, 1, 1, 1, 1,
-1.544208, 1.095253, 0.4876728, 1, 1, 1, 1, 1,
-1.509002, -0.4753055, 0.6238847, 1, 1, 1, 1, 1,
-1.497845, -0.2163314, 0.7839676, 1, 1, 1, 1, 1,
-1.486758, -1.552066, -1.251584, 1, 1, 1, 1, 1,
-1.486584, 0.672619, -1.091949, 1, 1, 1, 1, 1,
-1.480709, 0.7970961, -1.988929, 1, 1, 1, 1, 1,
-1.473177, -0.08875851, -0.097939, 1, 1, 1, 1, 1,
-1.465047, -0.6831018, -3.896961, 1, 1, 1, 1, 1,
-1.464947, 0.8890809, -2.744567, 1, 1, 1, 1, 1,
-1.457726, -0.6108071, -0.2200733, 1, 1, 1, 1, 1,
-1.450946, 0.449148, -1.588454, 1, 1, 1, 1, 1,
-1.440735, -1.10175, -3.312402, 1, 1, 1, 1, 1,
-1.434277, -0.5713952, -2.159369, 1, 1, 1, 1, 1,
-1.434167, 0.6602248, -0.5863782, 1, 1, 1, 1, 1,
-1.424985, 0.9583411, -2.395152, 0, 0, 1, 1, 1,
-1.423531, 0.9148405, -1.64588, 1, 0, 0, 1, 1,
-1.420457, 0.0967526, 0.1184695, 1, 0, 0, 1, 1,
-1.417176, 0.487902, 0.9385321, 1, 0, 0, 1, 1,
-1.407853, 0.3021725, -1.148825, 1, 0, 0, 1, 1,
-1.398456, 0.585718, -3.383287, 1, 0, 0, 1, 1,
-1.392692, -0.5202314, -1.366657, 0, 0, 0, 1, 1,
-1.380086, 0.6812745, -2.051975, 0, 0, 0, 1, 1,
-1.3661, 1.491749, 0.4191539, 0, 0, 0, 1, 1,
-1.365977, 0.1309894, -3.515956, 0, 0, 0, 1, 1,
-1.3591, 0.2541112, 0.494927, 0, 0, 0, 1, 1,
-1.358714, 0.957346, -1.050547, 0, 0, 0, 1, 1,
-1.357271, 1.110625, -2.055993, 0, 0, 0, 1, 1,
-1.353779, -0.4011522, -0.4881753, 1, 1, 1, 1, 1,
-1.352256, -0.7187206, -3.332535, 1, 1, 1, 1, 1,
-1.350599, -0.9724159, -1.858208, 1, 1, 1, 1, 1,
-1.347056, -0.2609647, -0.4114249, 1, 1, 1, 1, 1,
-1.333564, 0.7280376, -0.3783662, 1, 1, 1, 1, 1,
-1.332384, 1.540459, 0.1441403, 1, 1, 1, 1, 1,
-1.332131, 0.1962138, -1.221311, 1, 1, 1, 1, 1,
-1.330312, -2.048065, -1.255728, 1, 1, 1, 1, 1,
-1.323019, 0.6772813, -1.060957, 1, 1, 1, 1, 1,
-1.318891, 1.02365, -0.1054795, 1, 1, 1, 1, 1,
-1.313544, 0.4200498, -2.565696, 1, 1, 1, 1, 1,
-1.309155, -1.655228, -3.328829, 1, 1, 1, 1, 1,
-1.306272, 0.9584134, -1.473804, 1, 1, 1, 1, 1,
-1.298433, 0.01710007, -2.350426, 1, 1, 1, 1, 1,
-1.297272, -0.6577814, -3.856648, 1, 1, 1, 1, 1,
-1.295725, 0.4729044, -1.358079, 0, 0, 1, 1, 1,
-1.290131, 0.2191019, -3.03672, 1, 0, 0, 1, 1,
-1.278957, -0.226553, -2.234959, 1, 0, 0, 1, 1,
-1.277006, 0.4259073, -2.335032, 1, 0, 0, 1, 1,
-1.272281, -0.6318588, -3.225508, 1, 0, 0, 1, 1,
-1.258294, -0.9740275, -1.400154, 1, 0, 0, 1, 1,
-1.250852, -1.587409, -1.691016, 0, 0, 0, 1, 1,
-1.249757, 1.279542, -0.7445058, 0, 0, 0, 1, 1,
-1.223088, -0.5134159, -3.919149, 0, 0, 0, 1, 1,
-1.21166, 1.06546, 0.1862756, 0, 0, 0, 1, 1,
-1.208118, 1.504943, -1.718868, 0, 0, 0, 1, 1,
-1.198441, -0.08720839, -1.81489, 0, 0, 0, 1, 1,
-1.197364, 0.2470555, -0.6960076, 0, 0, 0, 1, 1,
-1.196632, 1.18162, -1.917073, 1, 1, 1, 1, 1,
-1.194839, 0.5835855, -1.898644, 1, 1, 1, 1, 1,
-1.187258, -0.6321177, -3.268969, 1, 1, 1, 1, 1,
-1.17165, 0.5823155, -0.4121517, 1, 1, 1, 1, 1,
-1.171522, -0.1154691, -2.133382, 1, 1, 1, 1, 1,
-1.170941, 1.28041, 0.1718551, 1, 1, 1, 1, 1,
-1.17064, -1.477161, -4.293328, 1, 1, 1, 1, 1,
-1.1705, -0.7822118, -3.05156, 1, 1, 1, 1, 1,
-1.164871, 0.6277463, -0.7195432, 1, 1, 1, 1, 1,
-1.159848, -1.220939, -1.001287, 1, 1, 1, 1, 1,
-1.154935, 1.564377, -1.770508, 1, 1, 1, 1, 1,
-1.151195, -2.027911, -1.91878, 1, 1, 1, 1, 1,
-1.145804, -1.637632, -2.894128, 1, 1, 1, 1, 1,
-1.141808, -0.3008723, -2.009072, 1, 1, 1, 1, 1,
-1.136197, -2.052397, -2.315311, 1, 1, 1, 1, 1,
-1.132754, 0.5559548, -1.906331, 0, 0, 1, 1, 1,
-1.132249, -0.06884455, -2.035147, 1, 0, 0, 1, 1,
-1.123961, -0.8781861, -1.446671, 1, 0, 0, 1, 1,
-1.120958, 0.3033506, -1.290836, 1, 0, 0, 1, 1,
-1.1206, 0.9161508, -2.151596, 1, 0, 0, 1, 1,
-1.113506, 0.4707211, -0.05070064, 1, 0, 0, 1, 1,
-1.094922, 2.30705, 0.600179, 0, 0, 0, 1, 1,
-1.086097, -0.9538863, -1.246252, 0, 0, 0, 1, 1,
-1.085356, -0.8877023, -1.454784, 0, 0, 0, 1, 1,
-1.084661, 1.005809, -0.1415702, 0, 0, 0, 1, 1,
-1.081994, 0.6823813, -0.1711907, 0, 0, 0, 1, 1,
-1.081031, 1.137844, 0.728916, 0, 0, 0, 1, 1,
-1.079045, -2.020181, -3.009046, 0, 0, 0, 1, 1,
-1.078493, -1.033559, -2.585329, 1, 1, 1, 1, 1,
-1.074908, 0.02003608, -1.131507, 1, 1, 1, 1, 1,
-1.074096, -1.311123, -3.36047, 1, 1, 1, 1, 1,
-1.069255, 0.1042757, -3.13334, 1, 1, 1, 1, 1,
-1.068971, -1.378298, -2.308476, 1, 1, 1, 1, 1,
-1.067222, 1.261375, -0.9448608, 1, 1, 1, 1, 1,
-1.059626, 0.3443846, -0.2166105, 1, 1, 1, 1, 1,
-1.05851, -0.327324, -1.071311, 1, 1, 1, 1, 1,
-1.047907, -0.5331514, -1.900877, 1, 1, 1, 1, 1,
-1.043403, -1.206276, -1.206006, 1, 1, 1, 1, 1,
-1.042858, -1.891512, -3.480491, 1, 1, 1, 1, 1,
-1.041323, -0.0264098, -1.153656, 1, 1, 1, 1, 1,
-1.04124, -0.6434101, -2.353641, 1, 1, 1, 1, 1,
-1.038144, -0.3442701, -1.594256, 1, 1, 1, 1, 1,
-1.030322, 0.8241458, -0.2464276, 1, 1, 1, 1, 1,
-1.026666, -0.9028251, -0.8379961, 0, 0, 1, 1, 1,
-1.014638, -0.4233029, -1.508432, 1, 0, 0, 1, 1,
-1.004798, -0.5852535, -1.63555, 1, 0, 0, 1, 1,
-1.000933, 0.465465, -0.27765, 1, 0, 0, 1, 1,
-0.9982445, -0.4887262, -3.343161, 1, 0, 0, 1, 1,
-0.9951754, -1.096774, -2.819734, 1, 0, 0, 1, 1,
-0.9933295, -0.05108523, -0.4277281, 0, 0, 0, 1, 1,
-0.9851708, -2.201915, -3.443343, 0, 0, 0, 1, 1,
-0.9793562, 0.3141809, -1.671772, 0, 0, 0, 1, 1,
-0.977806, -0.2616054, -1.087327, 0, 0, 0, 1, 1,
-0.9729407, -1.208225, -5.114893, 0, 0, 0, 1, 1,
-0.9694302, -0.417395, -2.272284, 0, 0, 0, 1, 1,
-0.9674122, -0.3083254, -1.762758, 0, 0, 0, 1, 1,
-0.9638022, 0.7477819, -1.250975, 1, 1, 1, 1, 1,
-0.9540628, 0.7351535, -0.9248633, 1, 1, 1, 1, 1,
-0.9529264, -2.702701, -1.907811, 1, 1, 1, 1, 1,
-0.9528815, 0.579697, -1.63776, 1, 1, 1, 1, 1,
-0.9439638, -0.9270681, -3.587306, 1, 1, 1, 1, 1,
-0.9425166, 0.8760687, -0.5282609, 1, 1, 1, 1, 1,
-0.9407944, 1.255606, -0.1393487, 1, 1, 1, 1, 1,
-0.9373177, -0.07234351, -0.8709714, 1, 1, 1, 1, 1,
-0.9322865, 0.5782339, -1.458812, 1, 1, 1, 1, 1,
-0.9300979, 0.4087481, -1.990684, 1, 1, 1, 1, 1,
-0.9193665, 0.9097513, -0.3827666, 1, 1, 1, 1, 1,
-0.9102544, -0.6656901, -0.7450335, 1, 1, 1, 1, 1,
-0.9046131, 0.03694253, -1.956985, 1, 1, 1, 1, 1,
-0.887805, -1.291436, -3.55695, 1, 1, 1, 1, 1,
-0.8805447, -0.4131333, -3.166677, 1, 1, 1, 1, 1,
-0.8778052, -1.254074, -3.131896, 0, 0, 1, 1, 1,
-0.8576391, -0.6028468, -2.498088, 1, 0, 0, 1, 1,
-0.8525035, -0.1819845, -1.68112, 1, 0, 0, 1, 1,
-0.8499444, 1.18663, -0.5460687, 1, 0, 0, 1, 1,
-0.8440243, -0.2517889, -4.49368, 1, 0, 0, 1, 1,
-0.8414428, -0.2209467, -3.262277, 1, 0, 0, 1, 1,
-0.83643, -0.4207351, -0.791643, 0, 0, 0, 1, 1,
-0.8270459, 0.02505985, -3.248246, 0, 0, 0, 1, 1,
-0.8245588, 0.7719907, -0.05221036, 0, 0, 0, 1, 1,
-0.8213136, 1.506914, 0.4787221, 0, 0, 0, 1, 1,
-0.8154443, -0.1791526, -0.9627399, 0, 0, 0, 1, 1,
-0.8128235, 0.6981024, -1.705064, 0, 0, 0, 1, 1,
-0.8098307, -0.508085, -1.851721, 0, 0, 0, 1, 1,
-0.8090318, 0.3026007, 0.7559274, 1, 1, 1, 1, 1,
-0.8081437, 0.4400311, -2.875225, 1, 1, 1, 1, 1,
-0.8047398, 1.931645, 0.366262, 1, 1, 1, 1, 1,
-0.8024135, 1.497524, 0.7778014, 1, 1, 1, 1, 1,
-0.8000599, 0.1076842, -0.3800493, 1, 1, 1, 1, 1,
-0.7989811, -0.660832, -2.187128, 1, 1, 1, 1, 1,
-0.7973086, -0.5936243, -2.079562, 1, 1, 1, 1, 1,
-0.7972983, -1.217026, -3.578065, 1, 1, 1, 1, 1,
-0.7953426, -0.1404176, -2.30091, 1, 1, 1, 1, 1,
-0.7933894, 1.653757, -0.007564488, 1, 1, 1, 1, 1,
-0.7933111, -1.287408, -2.513821, 1, 1, 1, 1, 1,
-0.7879014, -0.3612283, -0.3129835, 1, 1, 1, 1, 1,
-0.7843317, -0.5258555, -3.157727, 1, 1, 1, 1, 1,
-0.781397, 0.7076153, -1.944367, 1, 1, 1, 1, 1,
-0.7645012, -2.055895, -1.182798, 1, 1, 1, 1, 1,
-0.7615543, 1.333502, -0.8441644, 0, 0, 1, 1, 1,
-0.76077, -0.7270669, -1.09982, 1, 0, 0, 1, 1,
-0.7560577, 1.337618, -0.8284262, 1, 0, 0, 1, 1,
-0.7544058, 0.4738787, 0.8718792, 1, 0, 0, 1, 1,
-0.7517611, -0.188406, -0.7452303, 1, 0, 0, 1, 1,
-0.7499288, -0.1298974, -2.23904, 1, 0, 0, 1, 1,
-0.7427482, 0.9579251, -0.09181716, 0, 0, 0, 1, 1,
-0.7421878, -1.798941, -3.781136, 0, 0, 0, 1, 1,
-0.7382888, 0.9132528, -0.1317103, 0, 0, 0, 1, 1,
-0.7312101, -1.915485, -3.281829, 0, 0, 0, 1, 1,
-0.729185, 2.092068, -1.251388, 0, 0, 0, 1, 1,
-0.7288941, 0.6094273, -0.5142702, 0, 0, 0, 1, 1,
-0.7276518, 0.2563654, -1.408398, 0, 0, 0, 1, 1,
-0.7271141, -2.26651, -2.240587, 1, 1, 1, 1, 1,
-0.7234377, -0.8581485, -4.339087, 1, 1, 1, 1, 1,
-0.7199839, -0.7980563, -1.806692, 1, 1, 1, 1, 1,
-0.7137348, -0.1277629, -1.233738, 1, 1, 1, 1, 1,
-0.7127588, 1.012937, -1.743791, 1, 1, 1, 1, 1,
-0.707366, 0.2872026, -1.342162, 1, 1, 1, 1, 1,
-0.7038357, -1.059903, -1.965659, 1, 1, 1, 1, 1,
-0.702194, 1.81233, -0.5972859, 1, 1, 1, 1, 1,
-0.6924244, 0.9012789, -2.073118, 1, 1, 1, 1, 1,
-0.690941, -0.9985101, -1.806697, 1, 1, 1, 1, 1,
-0.6899374, -0.7510132, -3.687485, 1, 1, 1, 1, 1,
-0.684641, 0.9951908, -0.7656002, 1, 1, 1, 1, 1,
-0.6770042, -0.1983077, -1.569561, 1, 1, 1, 1, 1,
-0.6760284, -1.075379, -3.358194, 1, 1, 1, 1, 1,
-0.671552, 0.5491356, 1.185935, 1, 1, 1, 1, 1,
-0.6686059, -1.028191, -2.144769, 0, 0, 1, 1, 1,
-0.6608223, 0.5585735, -2.739245, 1, 0, 0, 1, 1,
-0.6591687, -1.584149, -1.596765, 1, 0, 0, 1, 1,
-0.6573934, -0.09761358, -0.6672765, 1, 0, 0, 1, 1,
-0.6504588, -0.2549285, -0.7020059, 1, 0, 0, 1, 1,
-0.6475152, 0.03614443, -2.412671, 1, 0, 0, 1, 1,
-0.6450515, -1.03486, -2.497095, 0, 0, 0, 1, 1,
-0.6431093, 0.6014206, -1.441578, 0, 0, 0, 1, 1,
-0.6394078, -0.3696723, -1.369531, 0, 0, 0, 1, 1,
-0.639227, -1.392228, -3.30019, 0, 0, 0, 1, 1,
-0.6381978, -1.797545, -4.602587, 0, 0, 0, 1, 1,
-0.6348582, -0.3902726, -2.057479, 0, 0, 0, 1, 1,
-0.6340446, 0.344552, -0.3511578, 0, 0, 0, 1, 1,
-0.6310512, 0.4714105, -0.7640017, 1, 1, 1, 1, 1,
-0.6304181, -0.243211, -2.071853, 1, 1, 1, 1, 1,
-0.6275378, 0.6421659, -0.4615186, 1, 1, 1, 1, 1,
-0.6255985, 0.2148467, -1.224388, 1, 1, 1, 1, 1,
-0.6254448, 0.1151611, -1.767677, 1, 1, 1, 1, 1,
-0.6215187, -0.4438895, -2.799456, 1, 1, 1, 1, 1,
-0.6214218, -1.077716, -1.844389, 1, 1, 1, 1, 1,
-0.6194976, 1.387818, -1.598078, 1, 1, 1, 1, 1,
-0.6128775, -0.8351735, -2.473521, 1, 1, 1, 1, 1,
-0.60868, 1.709236, -0.3153367, 1, 1, 1, 1, 1,
-0.6027538, -0.5694968, -0.6376752, 1, 1, 1, 1, 1,
-0.6015148, 0.006253362, -1.294237, 1, 1, 1, 1, 1,
-0.601073, -0.5227431, -3.43065, 1, 1, 1, 1, 1,
-0.6005393, 1.603109, -0.4454152, 1, 1, 1, 1, 1,
-0.593715, -1.331922, -2.811154, 1, 1, 1, 1, 1,
-0.5900249, -0.07402793, -1.425235, 0, 0, 1, 1, 1,
-0.5842383, 0.513508, -3.216361, 1, 0, 0, 1, 1,
-0.5791261, 0.1025391, -1.335446, 1, 0, 0, 1, 1,
-0.5791056, -1.335343, -2.139125, 1, 0, 0, 1, 1,
-0.573732, 1.399168, -0.5942726, 1, 0, 0, 1, 1,
-0.5736197, -1.020742, -2.185134, 1, 0, 0, 1, 1,
-0.5688379, 0.2373799, -1.463532, 0, 0, 0, 1, 1,
-0.5664589, -0.6486007, -2.061674, 0, 0, 0, 1, 1,
-0.5608724, -1.174946, -4.119386, 0, 0, 0, 1, 1,
-0.5581375, 0.1395166, -0.04159563, 0, 0, 0, 1, 1,
-0.5581341, 1.506419, 0.1901586, 0, 0, 0, 1, 1,
-0.5530288, -0.1997139, -1.127621, 0, 0, 0, 1, 1,
-0.5520795, 0.8276416, -0.3247012, 0, 0, 0, 1, 1,
-0.5507153, -0.7405665, -1.739773, 1, 1, 1, 1, 1,
-0.5495815, 0.1860549, -1.158977, 1, 1, 1, 1, 1,
-0.5481641, 0.8513552, -1.101114, 1, 1, 1, 1, 1,
-0.5428865, -1.063177, -2.90634, 1, 1, 1, 1, 1,
-0.5417508, -0.7648552, -2.084569, 1, 1, 1, 1, 1,
-0.5413863, -0.8132862, -2.529599, 1, 1, 1, 1, 1,
-0.5393246, -1.10485, -2.249898, 1, 1, 1, 1, 1,
-0.5374081, -1.370379, -2.413255, 1, 1, 1, 1, 1,
-0.5365905, 1.775607, -1.394951, 1, 1, 1, 1, 1,
-0.5342433, 0.1860679, -2.438076, 1, 1, 1, 1, 1,
-0.5304677, -0.2590035, -2.723097, 1, 1, 1, 1, 1,
-0.5278353, -1.932725, -3.117646, 1, 1, 1, 1, 1,
-0.5254879, -0.4719243, -0.7997584, 1, 1, 1, 1, 1,
-0.5242867, -0.5682982, -4.33336, 1, 1, 1, 1, 1,
-0.5117832, -0.1699348, -3.368459, 1, 1, 1, 1, 1,
-0.5049716, -0.6469957, -1.388936, 0, 0, 1, 1, 1,
-0.5038292, 1.13894, 0.2411585, 1, 0, 0, 1, 1,
-0.5037215, -0.1960837, -1.930468, 1, 0, 0, 1, 1,
-0.5009606, -0.1262524, -3.184239, 1, 0, 0, 1, 1,
-0.5006779, 0.244832, -1.193603, 1, 0, 0, 1, 1,
-0.5000467, 0.5754108, -0.4631269, 1, 0, 0, 1, 1,
-0.4961869, -0.3365209, -3.119479, 0, 0, 0, 1, 1,
-0.4955878, -0.8033269, -1.109725, 0, 0, 0, 1, 1,
-0.4845877, -0.59324, -2.712318, 0, 0, 0, 1, 1,
-0.4823914, -0.4545811, -1.758589, 0, 0, 0, 1, 1,
-0.4778497, -0.4825208, -1.689162, 0, 0, 0, 1, 1,
-0.4774141, -1.082995, -2.97554, 0, 0, 0, 1, 1,
-0.474329, -0.2995327, -2.426256, 0, 0, 0, 1, 1,
-0.4733466, 0.6892286, -1.015448, 1, 1, 1, 1, 1,
-0.4718993, -0.75681, -1.68775, 1, 1, 1, 1, 1,
-0.4717796, -0.3499351, -3.288445, 1, 1, 1, 1, 1,
-0.4541239, -0.1916488, -1.176431, 1, 1, 1, 1, 1,
-0.4492247, 0.8905189, -1.661613, 1, 1, 1, 1, 1,
-0.4455365, 0.08136699, -0.7461701, 1, 1, 1, 1, 1,
-0.4415123, -0.01727803, -3.712118, 1, 1, 1, 1, 1,
-0.4395679, -0.6557999, -0.8648059, 1, 1, 1, 1, 1,
-0.4351137, -0.908374, -1.242507, 1, 1, 1, 1, 1,
-0.4340425, -2.446673, -4.398931, 1, 1, 1, 1, 1,
-0.4324062, -1.24253, -3.589126, 1, 1, 1, 1, 1,
-0.430118, 0.2806026, 0.3437082, 1, 1, 1, 1, 1,
-0.4300856, 1.34166, -0.9616601, 1, 1, 1, 1, 1,
-0.4246521, -1.188947, -2.913853, 1, 1, 1, 1, 1,
-0.4186004, -3.4511, -2.524186, 1, 1, 1, 1, 1,
-0.4185577, -0.8067092, -3.378596, 0, 0, 1, 1, 1,
-0.4154047, 1.658396, 0.7665358, 1, 0, 0, 1, 1,
-0.4109724, 1.461187, 0.0679077, 1, 0, 0, 1, 1,
-0.4097669, 0.05565098, -1.572362, 1, 0, 0, 1, 1,
-0.4092802, 0.2832235, -2.62481, 1, 0, 0, 1, 1,
-0.4085579, -0.05839311, -1.218698, 1, 0, 0, 1, 1,
-0.4052219, -0.9054298, -3.512166, 0, 0, 0, 1, 1,
-0.4005339, -0.3601357, -2.101136, 0, 0, 0, 1, 1,
-0.3998188, -0.3189865, -2.213713, 0, 0, 0, 1, 1,
-0.3969622, 0.9539556, -2.734903, 0, 0, 0, 1, 1,
-0.3964717, -1.761203, -2.091268, 0, 0, 0, 1, 1,
-0.3956928, -1.085227, -4.727278, 0, 0, 0, 1, 1,
-0.3946839, -0.4770391, -4.291005, 0, 0, 0, 1, 1,
-0.3902597, -0.6605141, -2.655238, 1, 1, 1, 1, 1,
-0.3878132, 0.299394, -1.517872, 1, 1, 1, 1, 1,
-0.3834931, 0.556259, 2.11442, 1, 1, 1, 1, 1,
-0.3831373, 0.08774488, -0.6947823, 1, 1, 1, 1, 1,
-0.382727, -0.8342518, -3.71727, 1, 1, 1, 1, 1,
-0.3816287, 0.6280128, -0.8093041, 1, 1, 1, 1, 1,
-0.379785, 0.8632021, -0.170544, 1, 1, 1, 1, 1,
-0.379448, -0.9011316, -3.339945, 1, 1, 1, 1, 1,
-0.3688534, -1.041278, -2.528299, 1, 1, 1, 1, 1,
-0.367759, 1.119991, -0.1196912, 1, 1, 1, 1, 1,
-0.3594919, -1.823554, -3.654298, 1, 1, 1, 1, 1,
-0.3583887, -0.5212559, -1.368053, 1, 1, 1, 1, 1,
-0.3555188, 1.336187, -0.2988785, 1, 1, 1, 1, 1,
-0.3549341, 0.180446, 0.6242743, 1, 1, 1, 1, 1,
-0.3541205, -1.895794, -2.08715, 1, 1, 1, 1, 1,
-0.3536429, -1.281444, -2.433273, 0, 0, 1, 1, 1,
-0.352947, 0.5198029, -2.006199, 1, 0, 0, 1, 1,
-0.3499246, -0.2104506, -0.6883171, 1, 0, 0, 1, 1,
-0.3482531, -0.7103103, -1.218983, 1, 0, 0, 1, 1,
-0.3474626, 1.712868, -0.04780178, 1, 0, 0, 1, 1,
-0.3462604, -0.2463981, -2.218586, 1, 0, 0, 1, 1,
-0.3434444, 0.8045887, -0.4349906, 0, 0, 0, 1, 1,
-0.3413564, -0.1676113, -3.04426, 0, 0, 0, 1, 1,
-0.3405474, -0.5519599, -1.281142, 0, 0, 0, 1, 1,
-0.3363372, 0.3809757, -0.5711498, 0, 0, 0, 1, 1,
-0.329897, -2.008189, -5.36589, 0, 0, 0, 1, 1,
-0.3292632, -1.547784, -1.100065, 0, 0, 0, 1, 1,
-0.3269488, 0.7059567, -2.485581, 0, 0, 0, 1, 1,
-0.3255577, -0.5746074, -1.666381, 1, 1, 1, 1, 1,
-0.3254848, 1.122113, 0.4947017, 1, 1, 1, 1, 1,
-0.3254761, 0.5901334, -2.124548, 1, 1, 1, 1, 1,
-0.3218038, 0.2580102, -1.977392, 1, 1, 1, 1, 1,
-0.3205578, -0.854966, -3.22347, 1, 1, 1, 1, 1,
-0.3202541, -0.6893697, -1.546062, 1, 1, 1, 1, 1,
-0.3189076, -0.09389349, -0.8049173, 1, 1, 1, 1, 1,
-0.3172635, 0.5358431, -0.1261929, 1, 1, 1, 1, 1,
-0.316319, 1.295428, -1.276776, 1, 1, 1, 1, 1,
-0.3112564, -1.013477, -2.926783, 1, 1, 1, 1, 1,
-0.3086115, -0.3734572, -4.403061, 1, 1, 1, 1, 1,
-0.3084047, -0.6567137, -4.653436, 1, 1, 1, 1, 1,
-0.3050299, 2.507495, -2.08953, 1, 1, 1, 1, 1,
-0.3037145, 1.18305, -0.3176537, 1, 1, 1, 1, 1,
-0.301582, -1.82421, -1.656617, 1, 1, 1, 1, 1,
-0.3001871, 0.6296545, -0.2131023, 0, 0, 1, 1, 1,
-0.2967248, 0.7297158, -0.9333448, 1, 0, 0, 1, 1,
-0.2952341, -0.1343524, -2.133154, 1, 0, 0, 1, 1,
-0.2871787, -0.05151574, -0.6644496, 1, 0, 0, 1, 1,
-0.2866814, -1.253266, -2.960835, 1, 0, 0, 1, 1,
-0.27885, 1.013961, -1.158277, 1, 0, 0, 1, 1,
-0.2769935, -0.5573727, -2.992728, 0, 0, 0, 1, 1,
-0.2764713, 1.288004, 0.7731786, 0, 0, 0, 1, 1,
-0.274231, -0.1362733, -0.5420962, 0, 0, 0, 1, 1,
-0.2733729, -0.7641712, -2.101271, 0, 0, 0, 1, 1,
-0.2650045, 0.1680816, -1.578374, 0, 0, 0, 1, 1,
-0.2628933, 0.3786812, -1.997071, 0, 0, 0, 1, 1,
-0.2617906, 0.4394595, -0.7429466, 0, 0, 0, 1, 1,
-0.2606324, -0.4120084, -3.904533, 1, 1, 1, 1, 1,
-0.2542029, -0.9788417, -2.512757, 1, 1, 1, 1, 1,
-0.2521991, -0.115054, -0.8469207, 1, 1, 1, 1, 1,
-0.2415823, -0.9926738, -2.914074, 1, 1, 1, 1, 1,
-0.2404819, 1.044921, 1.257813, 1, 1, 1, 1, 1,
-0.2393307, 0.2384366, -1.064462, 1, 1, 1, 1, 1,
-0.239183, 0.4706545, -0.6905851, 1, 1, 1, 1, 1,
-0.2377457, 2.090029, 0.2045406, 1, 1, 1, 1, 1,
-0.2316364, 1.19313, -0.3275661, 1, 1, 1, 1, 1,
-0.2288578, -0.5009981, -2.029178, 1, 1, 1, 1, 1,
-0.2239006, -0.1517119, -0.8645558, 1, 1, 1, 1, 1,
-0.2223845, 0.4756618, 0.09313784, 1, 1, 1, 1, 1,
-0.2213297, -1.481896, -2.984324, 1, 1, 1, 1, 1,
-0.2189313, 0.4983262, 0.6109707, 1, 1, 1, 1, 1,
-0.2156627, 0.1651254, 0.09112674, 1, 1, 1, 1, 1,
-0.2146546, 1.12445, 0.2586171, 0, 0, 1, 1, 1,
-0.21441, 0.3614847, -1.31272, 1, 0, 0, 1, 1,
-0.2141369, 0.5307884, -1.484739, 1, 0, 0, 1, 1,
-0.2131673, -1.387593, -4.745534, 1, 0, 0, 1, 1,
-0.2110415, 0.2878665, -0.4436568, 1, 0, 0, 1, 1,
-0.210635, -0.6295768, -2.786857, 1, 0, 0, 1, 1,
-0.2103627, 0.5893509, 0.3969067, 0, 0, 0, 1, 1,
-0.2093669, -1.245341, -0.7670421, 0, 0, 0, 1, 1,
-0.2092104, 0.5644524, -0.7572525, 0, 0, 0, 1, 1,
-0.2057798, 0.5083968, 0.1935949, 0, 0, 0, 1, 1,
-0.2048818, 0.302154, 1.602291, 0, 0, 0, 1, 1,
-0.2040168, 0.2073953, -1.860905, 0, 0, 0, 1, 1,
-0.2034743, 0.7929448, -0.6519196, 0, 0, 0, 1, 1,
-0.1970673, 1.211944, 2.209464, 1, 1, 1, 1, 1,
-0.1966271, 0.3603347, 0.5890266, 1, 1, 1, 1, 1,
-0.1965084, 0.1340888, -0.03932343, 1, 1, 1, 1, 1,
-0.1953769, -0.05148679, -0.3225183, 1, 1, 1, 1, 1,
-0.1861979, -1.067148, -5.206305, 1, 1, 1, 1, 1,
-0.1842531, -0.6256318, -2.932201, 1, 1, 1, 1, 1,
-0.1796688, -0.2396134, -2.871632, 1, 1, 1, 1, 1,
-0.176246, -1.660352, -4.010717, 1, 1, 1, 1, 1,
-0.1715692, -0.3163077, -2.370411, 1, 1, 1, 1, 1,
-0.1715493, 0.2664449, -0.7225499, 1, 1, 1, 1, 1,
-0.1687649, -0.384139, -3.886965, 1, 1, 1, 1, 1,
-0.16699, 0.2793908, -0.5593548, 1, 1, 1, 1, 1,
-0.1650701, 0.6080166, 0.825796, 1, 1, 1, 1, 1,
-0.1609829, 0.539964, 0.1530251, 1, 1, 1, 1, 1,
-0.1579841, -0.07815327, -2.348718, 1, 1, 1, 1, 1,
-0.1559416, 0.1041062, -0.9932151, 0, 0, 1, 1, 1,
-0.1554661, -2.542272, -4.644324, 1, 0, 0, 1, 1,
-0.1542687, -0.1716647, -3.652022, 1, 0, 0, 1, 1,
-0.1542494, -0.6891202, -4.533722, 1, 0, 0, 1, 1,
-0.1532488, -1.499539, -3.768892, 1, 0, 0, 1, 1,
-0.1519186, -1.369875, -3.31979, 1, 0, 0, 1, 1,
-0.1486815, -1.462934, -3.887929, 0, 0, 0, 1, 1,
-0.1485091, 0.8898111, -0.7904908, 0, 0, 0, 1, 1,
-0.1450854, 0.4378553, -3.328734, 0, 0, 0, 1, 1,
-0.141993, -0.5263392, -3.62785, 0, 0, 0, 1, 1,
-0.1371474, 0.7734906, -0.4948283, 0, 0, 0, 1, 1,
-0.1336296, 0.9822218, 0.3975213, 0, 0, 0, 1, 1,
-0.1294671, -3.162345, -1.467419, 0, 0, 0, 1, 1,
-0.1263889, 1.18609, -0.4637454, 1, 1, 1, 1, 1,
-0.1221028, 0.03586067, -0.243208, 1, 1, 1, 1, 1,
-0.1220643, 0.06329245, -1.596086, 1, 1, 1, 1, 1,
-0.1131708, -1.19787, -4.611024, 1, 1, 1, 1, 1,
-0.1073622, -1.071201, -3.621602, 1, 1, 1, 1, 1,
-0.1047351, -0.6644114, -2.872265, 1, 1, 1, 1, 1,
-0.1037876, -1.889098, -1.234449, 1, 1, 1, 1, 1,
-0.101911, 0.2292993, -0.3160222, 1, 1, 1, 1, 1,
-0.1019076, -1.579256, -2.644356, 1, 1, 1, 1, 1,
-0.1002088, -0.0951046, -2.495491, 1, 1, 1, 1, 1,
-0.09838008, 1.819644, -1.090516, 1, 1, 1, 1, 1,
-0.09445255, 0.4833263, -1.06815, 1, 1, 1, 1, 1,
-0.09371497, 0.004582291, -1.337956, 1, 1, 1, 1, 1,
-0.08865786, 0.1274073, 0.2239432, 1, 1, 1, 1, 1,
-0.08641445, -0.1334795, -2.984844, 1, 1, 1, 1, 1,
-0.08604206, -1.067662, -1.228552, 0, 0, 1, 1, 1,
-0.08362306, -0.2489091, -2.473351, 1, 0, 0, 1, 1,
-0.08346307, -1.669879, -3.171404, 1, 0, 0, 1, 1,
-0.07538686, -0.03315652, -3.566181, 1, 0, 0, 1, 1,
-0.07397911, -0.3253799, -1.641466, 1, 0, 0, 1, 1,
-0.06947817, -1.157087, -2.354676, 1, 0, 0, 1, 1,
-0.0663638, 0.2257789, -1.522742, 0, 0, 0, 1, 1,
-0.06183289, 0.8500705, -0.04220474, 0, 0, 0, 1, 1,
-0.05908227, 0.1221425, 1.239767, 0, 0, 0, 1, 1,
-0.0576355, 0.6757087, -1.317233, 0, 0, 0, 1, 1,
-0.05716332, 1.138365, -0.1681912, 0, 0, 0, 1, 1,
-0.05607985, 0.7545716, -0.6928333, 0, 0, 0, 1, 1,
-0.05570057, 1.703531, 1.465672, 0, 0, 0, 1, 1,
-0.05486274, 0.07464074, -1.263928, 1, 1, 1, 1, 1,
-0.05108915, 0.1372334, 0.4635637, 1, 1, 1, 1, 1,
-0.05094291, -0.8903173, -3.315011, 1, 1, 1, 1, 1,
-0.04917575, 1.628076, -0.3646682, 1, 1, 1, 1, 1,
-0.04889011, -1.014553, -2.353899, 1, 1, 1, 1, 1,
-0.04844445, -1.902261, -4.503788, 1, 1, 1, 1, 1,
-0.04710273, 0.1277043, 1.671913, 1, 1, 1, 1, 1,
-0.04605263, -0.1159605, -1.468957, 1, 1, 1, 1, 1,
-0.04547808, -0.7788982, -3.034315, 1, 1, 1, 1, 1,
-0.04486551, 0.007650498, -1.978034, 1, 1, 1, 1, 1,
-0.0427884, 0.1230599, -0.2159282, 1, 1, 1, 1, 1,
-0.04189327, 0.4376571, -0.1219813, 1, 1, 1, 1, 1,
-0.04012215, 0.3321927, -0.5969439, 1, 1, 1, 1, 1,
-0.03837275, 0.3881335, -0.8169338, 1, 1, 1, 1, 1,
-0.03836169, 0.7174494, -1.441822, 1, 1, 1, 1, 1,
-0.03590414, 1.422476, -1.698568, 0, 0, 1, 1, 1,
-0.03203353, -0.09052329, -3.521354, 1, 0, 0, 1, 1,
-0.02954325, 0.1688997, 0.2141817, 1, 0, 0, 1, 1,
-0.02264867, 2.24245, -0.172238, 1, 0, 0, 1, 1,
-0.01484256, 1.663314, -0.1105305, 1, 0, 0, 1, 1,
-0.01388935, 0.8009775, 1.388506, 1, 0, 0, 1, 1,
-0.0100069, 0.8040674, 0.100021, 0, 0, 0, 1, 1,
-0.009968611, -1.482065, -2.376819, 0, 0, 0, 1, 1,
-0.002711847, 0.09071477, -0.3526063, 0, 0, 0, 1, 1,
-0.002519046, 0.6694563, -0.07776108, 0, 0, 0, 1, 1,
-0.0002823991, -2.081517, -3.378516, 0, 0, 0, 1, 1,
0.001978728, 0.3655066, -0.1346644, 0, 0, 0, 1, 1,
0.007883896, 1.120226, -0.00996454, 0, 0, 0, 1, 1,
0.0116997, 0.789297, -0.124673, 1, 1, 1, 1, 1,
0.01288352, -0.01155252, 1.736702, 1, 1, 1, 1, 1,
0.01508734, 0.7083434, 2.460859, 1, 1, 1, 1, 1,
0.01849852, 0.579998, -0.379527, 1, 1, 1, 1, 1,
0.02016197, -0.9336301, 2.567145, 1, 1, 1, 1, 1,
0.02191965, -1.688883, 4.425787, 1, 1, 1, 1, 1,
0.02195777, 0.57574, -1.638861, 1, 1, 1, 1, 1,
0.02383252, -1.196624, 3.155004, 1, 1, 1, 1, 1,
0.02496592, -0.4995235, 1.920175, 1, 1, 1, 1, 1,
0.02862407, 0.6890581, -0.03869231, 1, 1, 1, 1, 1,
0.03113318, -0.9007949, 3.259209, 1, 1, 1, 1, 1,
0.03158034, -0.1654124, 3.007018, 1, 1, 1, 1, 1,
0.03668889, -0.2200937, 4.763798, 1, 1, 1, 1, 1,
0.03818901, 0.9420608, 0.07539709, 1, 1, 1, 1, 1,
0.04050165, -1.271435, 1.528814, 1, 1, 1, 1, 1,
0.04074888, -0.9954911, 5.274266, 0, 0, 1, 1, 1,
0.04555133, -0.1133725, 1.854393, 1, 0, 0, 1, 1,
0.04882872, -1.112033, 2.501274, 1, 0, 0, 1, 1,
0.04944994, -0.3116336, 1.537801, 1, 0, 0, 1, 1,
0.05057346, 0.7643376, -0.8784898, 1, 0, 0, 1, 1,
0.05218825, -0.6022179, 2.910418, 1, 0, 0, 1, 1,
0.05488775, 0.1943174, 0.1572518, 0, 0, 0, 1, 1,
0.05783886, 0.5586974, 1.624985, 0, 0, 0, 1, 1,
0.05838915, 1.510084, 0.5948413, 0, 0, 0, 1, 1,
0.05892695, 0.5235507, 1.163868, 0, 0, 0, 1, 1,
0.06093923, 0.179122, -0.6754646, 0, 0, 0, 1, 1,
0.06746507, -0.3924, 4.07165, 0, 0, 0, 1, 1,
0.07842428, 0.9235569, -0.7587022, 0, 0, 0, 1, 1,
0.08078603, -0.1417651, 1.923507, 1, 1, 1, 1, 1,
0.08550941, -0.1807625, 2.832754, 1, 1, 1, 1, 1,
0.08771878, -1.278943, 4.877111, 1, 1, 1, 1, 1,
0.08774881, 0.1130826, 2.0588, 1, 1, 1, 1, 1,
0.08811653, 1.28063, -0.06405929, 1, 1, 1, 1, 1,
0.0883655, -0.505136, 3.102342, 1, 1, 1, 1, 1,
0.08847356, -0.3415143, 2.836558, 1, 1, 1, 1, 1,
0.09091527, 0.5269839, -1.094503, 1, 1, 1, 1, 1,
0.09143405, -1.836744, 2.370517, 1, 1, 1, 1, 1,
0.09541435, -0.7387927, 3.899174, 1, 1, 1, 1, 1,
0.09742322, -0.7150691, 2.872181, 1, 1, 1, 1, 1,
0.1012624, 0.3178261, -0.2460452, 1, 1, 1, 1, 1,
0.101758, 0.02867489, 2.001018, 1, 1, 1, 1, 1,
0.1042037, -1.193375, 4.716302, 1, 1, 1, 1, 1,
0.1042707, -1.189276, 1.791641, 1, 1, 1, 1, 1,
0.1071544, 0.5136657, 0.2077407, 0, 0, 1, 1, 1,
0.1097263, -0.6079534, 3.751974, 1, 0, 0, 1, 1,
0.1117971, -1.372371, 2.318374, 1, 0, 0, 1, 1,
0.1148118, -0.9639025, 2.521341, 1, 0, 0, 1, 1,
0.1173783, -0.4978976, 2.028269, 1, 0, 0, 1, 1,
0.1190411, 1.722124, -0.9640004, 1, 0, 0, 1, 1,
0.1194917, 0.4116951, 0.1263516, 0, 0, 0, 1, 1,
0.1211163, 0.2963123, 0.7087978, 0, 0, 0, 1, 1,
0.1252172, -1.12286, 3.06036, 0, 0, 0, 1, 1,
0.125571, -0.5507008, 5.238578, 0, 0, 0, 1, 1,
0.1308664, 0.5101538, 0.5585648, 0, 0, 0, 1, 1,
0.1320291, 1.74525, 1.63292, 0, 0, 0, 1, 1,
0.1327687, 1.633477, -0.5544056, 0, 0, 0, 1, 1,
0.1340272, 0.9991215, 1.279758, 1, 1, 1, 1, 1,
0.1386523, -1.332449, 1.652826, 1, 1, 1, 1, 1,
0.1386966, -1.312928, 1.193017, 1, 1, 1, 1, 1,
0.1390595, -0.6254556, 4.208998, 1, 1, 1, 1, 1,
0.1458233, -0.2714264, 2.283659, 1, 1, 1, 1, 1,
0.1490941, 0.3518734, -1.033961, 1, 1, 1, 1, 1,
0.1555877, -1.406918, 1.425622, 1, 1, 1, 1, 1,
0.1608474, 1.768445, -0.7503826, 1, 1, 1, 1, 1,
0.1613202, -1.007623, 3.737181, 1, 1, 1, 1, 1,
0.1645919, -0.8606835, 3.781611, 1, 1, 1, 1, 1,
0.1652451, 0.9602547, 0.269784, 1, 1, 1, 1, 1,
0.1654387, 0.1994132, 0.8076793, 1, 1, 1, 1, 1,
0.1660685, -0.09093314, 1.153421, 1, 1, 1, 1, 1,
0.1663015, 0.02482145, 1.850232, 1, 1, 1, 1, 1,
0.1692853, 0.184313, 0.9760813, 1, 1, 1, 1, 1,
0.1700826, -0.25703, 0.7457456, 0, 0, 1, 1, 1,
0.1724726, 1.931692, -1.01932, 1, 0, 0, 1, 1,
0.1728373, 0.06552837, 2.670422, 1, 0, 0, 1, 1,
0.1758616, 0.1574712, 2.317117, 1, 0, 0, 1, 1,
0.1773029, -0.7230303, 3.117451, 1, 0, 0, 1, 1,
0.180462, -0.6384222, 2.123704, 1, 0, 0, 1, 1,
0.1813153, -0.2930109, 5.267864, 0, 0, 0, 1, 1,
0.1835476, -0.2399114, 3.417876, 0, 0, 0, 1, 1,
0.1852503, 0.7686967, -0.3101628, 0, 0, 0, 1, 1,
0.1872166, -0.9553676, 2.710802, 0, 0, 0, 1, 1,
0.1896559, -0.7618366, 2.520581, 0, 0, 0, 1, 1,
0.1973736, 1.592043, 1.434746, 0, 0, 0, 1, 1,
0.1980864, -0.6763893, 2.400333, 0, 0, 0, 1, 1,
0.1983386, 1.060399, 0.8021313, 1, 1, 1, 1, 1,
0.2007761, 0.04369555, -0.2840339, 1, 1, 1, 1, 1,
0.2020217, -1.435456, 1.719834, 1, 1, 1, 1, 1,
0.2023339, -0.1754334, 0.2658315, 1, 1, 1, 1, 1,
0.2027487, 0.4092017, -0.6316043, 1, 1, 1, 1, 1,
0.2043831, 0.3261115, 0.1914495, 1, 1, 1, 1, 1,
0.2053468, 0.2099103, 0.3757311, 1, 1, 1, 1, 1,
0.2074687, -0.1713318, 1.11605, 1, 1, 1, 1, 1,
0.2129882, 0.2536531, 1.156872, 1, 1, 1, 1, 1,
0.2146082, 0.8369535, -0.1510925, 1, 1, 1, 1, 1,
0.2155055, 0.09646833, 0.8618034, 1, 1, 1, 1, 1,
0.2156878, 2.271723, 1.423244, 1, 1, 1, 1, 1,
0.2177328, -2.123972, 4.486536, 1, 1, 1, 1, 1,
0.2262325, -0.8657481, 1.139573, 1, 1, 1, 1, 1,
0.2340088, 0.7544594, -0.6594824, 1, 1, 1, 1, 1,
0.2348044, -1.193727, 3.494507, 0, 0, 1, 1, 1,
0.2350797, -1.029127, 0.1689989, 1, 0, 0, 1, 1,
0.2416825, -1.193468, 1.122457, 1, 0, 0, 1, 1,
0.242445, -0.2845153, 2.267737, 1, 0, 0, 1, 1,
0.2467209, -0.9116024, 1.51811, 1, 0, 0, 1, 1,
0.2488481, -0.5082789, 2.341597, 1, 0, 0, 1, 1,
0.2492651, 0.1364983, 1.864882, 0, 0, 0, 1, 1,
0.2519706, -0.884016, 4.715277, 0, 0, 0, 1, 1,
0.2552714, -1.808211, 3.474995, 0, 0, 0, 1, 1,
0.2565384, -1.765341, 4.506569, 0, 0, 0, 1, 1,
0.258208, -1.191352, 4.704085, 0, 0, 0, 1, 1,
0.2608148, -0.6384019, 3.069991, 0, 0, 0, 1, 1,
0.2617041, 0.9253933, 0.01523662, 0, 0, 0, 1, 1,
0.2656974, 0.04855274, 0.9277605, 1, 1, 1, 1, 1,
0.2661495, -1.254467, 2.368202, 1, 1, 1, 1, 1,
0.2688287, -0.02465764, 1.609784, 1, 1, 1, 1, 1,
0.2708032, -1.337179, 4.23376, 1, 1, 1, 1, 1,
0.2743577, 1.119457, 1.414256, 1, 1, 1, 1, 1,
0.2789587, 1.679607, -0.3761822, 1, 1, 1, 1, 1,
0.281624, 0.592208, 1.486652, 1, 1, 1, 1, 1,
0.2862873, 0.6389507, 1.456881, 1, 1, 1, 1, 1,
0.2893209, -0.8548208, 1.617171, 1, 1, 1, 1, 1,
0.2912275, 1.131193, 0.9895309, 1, 1, 1, 1, 1,
0.2931103, -2.116188, 3.761831, 1, 1, 1, 1, 1,
0.2987756, -0.7378451, 2.784719, 1, 1, 1, 1, 1,
0.3008896, -0.5724284, 0.9771057, 1, 1, 1, 1, 1,
0.3013405, -0.6839501, 0.9164423, 1, 1, 1, 1, 1,
0.3036032, 0.2978133, 2.183958, 1, 1, 1, 1, 1,
0.3039727, 0.7033412, 1.228621, 0, 0, 1, 1, 1,
0.3152912, 0.4955768, 1.833959, 1, 0, 0, 1, 1,
0.3169212, -0.6082882, 2.573015, 1, 0, 0, 1, 1,
0.3206714, -0.6017932, 3.565979, 1, 0, 0, 1, 1,
0.3337176, 0.3887787, -0.629491, 1, 0, 0, 1, 1,
0.3338332, 0.02115243, 2.120031, 1, 0, 0, 1, 1,
0.3357763, 1.380529, -0.6531788, 0, 0, 0, 1, 1,
0.3367787, -1.217141, 1.257056, 0, 0, 0, 1, 1,
0.338063, 1.472171, 1.047963, 0, 0, 0, 1, 1,
0.3393341, -1.015206, 3.268789, 0, 0, 0, 1, 1,
0.3609125, 1.078441, 0.5621331, 0, 0, 0, 1, 1,
0.361359, -0.3550613, 2.84008, 0, 0, 0, 1, 1,
0.3650291, -0.2113335, 2.853663, 0, 0, 0, 1, 1,
0.3661745, -1.28912, 3.756091, 1, 1, 1, 1, 1,
0.3663465, -2.114525, 2.525016, 1, 1, 1, 1, 1,
0.3772665, 0.7575328, -0.5734707, 1, 1, 1, 1, 1,
0.3797858, -1.066543, 2.423607, 1, 1, 1, 1, 1,
0.3805028, -1.666331, 3.200467, 1, 1, 1, 1, 1,
0.384445, -0.2564733, 2.694336, 1, 1, 1, 1, 1,
0.3895225, 1.677028, -1.470593, 1, 1, 1, 1, 1,
0.3966066, -0.7431943, 4.071975, 1, 1, 1, 1, 1,
0.4012077, 0.5335649, -0.98298, 1, 1, 1, 1, 1,
0.4022784, 0.1983087, -1.511833, 1, 1, 1, 1, 1,
0.4033791, -1.066043, 2.871608, 1, 1, 1, 1, 1,
0.4074634, -0.5473198, 2.349501, 1, 1, 1, 1, 1,
0.4093259, 0.1723942, 2.96697, 1, 1, 1, 1, 1,
0.412402, 0.4460715, -0.9774929, 1, 1, 1, 1, 1,
0.4137281, 0.4620666, 1.253746, 1, 1, 1, 1, 1,
0.4234477, -0.6351268, 1.4628, 0, 0, 1, 1, 1,
0.4252033, 0.5434033, 2.344102, 1, 0, 0, 1, 1,
0.4262687, 0.3150221, 1.555592, 1, 0, 0, 1, 1,
0.4335877, 1.470776, -0.1688288, 1, 0, 0, 1, 1,
0.4348102, 0.1355068, 0.8278995, 1, 0, 0, 1, 1,
0.4353422, -0.1058222, 2.253786, 1, 0, 0, 1, 1,
0.4394359, 0.9137245, 0.2852637, 0, 0, 0, 1, 1,
0.4406096, 1.376562, -0.9190595, 0, 0, 0, 1, 1,
0.442493, -1.179261, 2.20836, 0, 0, 0, 1, 1,
0.4449628, -0.2925476, 1.485479, 0, 0, 0, 1, 1,
0.4468104, 0.31591, 1.278523, 0, 0, 0, 1, 1,
0.4494197, -1.040327, 2.691477, 0, 0, 0, 1, 1,
0.4577183, 1.950484, 0.3444887, 0, 0, 0, 1, 1,
0.4640072, -0.2307091, 2.83361, 1, 1, 1, 1, 1,
0.465245, -0.02364373, 2.827834, 1, 1, 1, 1, 1,
0.4738112, 1.923856, 0.7378432, 1, 1, 1, 1, 1,
0.4752098, 2.279566, 1.426479, 1, 1, 1, 1, 1,
0.4762353, -0.2753505, 1.304034, 1, 1, 1, 1, 1,
0.4906991, 1.832073, -0.1372082, 1, 1, 1, 1, 1,
0.4947405, -1.577702, 2.856169, 1, 1, 1, 1, 1,
0.4951717, 1.636321, -1.547348, 1, 1, 1, 1, 1,
0.5007162, 1.171543, 1.208588, 1, 1, 1, 1, 1,
0.5039413, -0.2363873, 1.417008, 1, 1, 1, 1, 1,
0.5064132, 0.6510406, 0.4103399, 1, 1, 1, 1, 1,
0.5083134, 1.364297, -0.4324352, 1, 1, 1, 1, 1,
0.511123, -1.13631, 2.53212, 1, 1, 1, 1, 1,
0.5122818, 1.060188, 1.105426, 1, 1, 1, 1, 1,
0.5167671, -0.9450915, 3.826395, 1, 1, 1, 1, 1,
0.5180478, 0.431154, 0.1340431, 0, 0, 1, 1, 1,
0.522218, -2.126951, 3.553482, 1, 0, 0, 1, 1,
0.5227885, -2.789266, 4.169587, 1, 0, 0, 1, 1,
0.5271024, 0.5915215, 0.6106253, 1, 0, 0, 1, 1,
0.5307757, -0.4944511, 2.607231, 1, 0, 0, 1, 1,
0.5357519, -0.05089777, 1.525955, 1, 0, 0, 1, 1,
0.5359195, -2.978856, 2.296697, 0, 0, 0, 1, 1,
0.5378293, -0.4749227, 2.927442, 0, 0, 0, 1, 1,
0.5390491, 0.7305869, -0.1497065, 0, 0, 0, 1, 1,
0.5399562, 0.241533, 0.5362692, 0, 0, 0, 1, 1,
0.5424868, 1.224879, 0.5124762, 0, 0, 0, 1, 1,
0.5443286, 0.1648058, -0.1319378, 0, 0, 0, 1, 1,
0.548748, 0.5406231, 1.513927, 0, 0, 0, 1, 1,
0.5507032, -0.6797386, 3.392579, 1, 1, 1, 1, 1,
0.5524741, -2.169375, 1.473402, 1, 1, 1, 1, 1,
0.553078, -0.4592905, 1.349257, 1, 1, 1, 1, 1,
0.5543457, -0.0969424, 1.113681, 1, 1, 1, 1, 1,
0.5576582, -0.8116023, 0.08767377, 1, 1, 1, 1, 1,
0.5600933, -0.2553442, 2.223413, 1, 1, 1, 1, 1,
0.5608042, -1.616112, 4.215374, 1, 1, 1, 1, 1,
0.5630707, -0.3194036, 2.448921, 1, 1, 1, 1, 1,
0.5640517, 0.7923569, 0.04648543, 1, 1, 1, 1, 1,
0.5648215, 1.0222, 0.9695994, 1, 1, 1, 1, 1,
0.5669067, 0.08840857, 1.436986, 1, 1, 1, 1, 1,
0.5682694, -1.227253, 3.70898, 1, 1, 1, 1, 1,
0.5711554, -1.376483, 2.457696, 1, 1, 1, 1, 1,
0.5747796, -0.2781026, 1.529207, 1, 1, 1, 1, 1,
0.5753239, 1.253585, 0.05565511, 1, 1, 1, 1, 1,
0.5765592, 0.6486653, 0.3915922, 0, 0, 1, 1, 1,
0.5770247, 0.4666804, 1.232921, 1, 0, 0, 1, 1,
0.5814398, -1.950935, 2.430899, 1, 0, 0, 1, 1,
0.5818179, -0.2447638, 2.106529, 1, 0, 0, 1, 1,
0.583375, 0.1148727, 1.179152, 1, 0, 0, 1, 1,
0.5894402, -0.3282202, 2.304056, 1, 0, 0, 1, 1,
0.5913498, 1.052258, 0.3236339, 0, 0, 0, 1, 1,
0.5927868, 1.175683, -0.4287176, 0, 0, 0, 1, 1,
0.5933344, 0.9664778, 0.2079912, 0, 0, 0, 1, 1,
0.593764, 0.6909897, 0.7369354, 0, 0, 0, 1, 1,
0.5966599, 0.3896571, 0.4415126, 0, 0, 0, 1, 1,
0.5966941, -0.2807688, 0.7776487, 0, 0, 0, 1, 1,
0.6012275, -0.4347841, 2.450219, 0, 0, 0, 1, 1,
0.6030965, 0.7441651, -0.5047224, 1, 1, 1, 1, 1,
0.6069427, 0.3965266, 0.6126223, 1, 1, 1, 1, 1,
0.6140308, -0.06069588, 0.6959362, 1, 1, 1, 1, 1,
0.6143054, -1.928857, 4.227496, 1, 1, 1, 1, 1,
0.6158843, -0.9794823, 2.859755, 1, 1, 1, 1, 1,
0.6170374, -1.089661, 3.850778, 1, 1, 1, 1, 1,
0.6179551, 0.9266118, 1.160866, 1, 1, 1, 1, 1,
0.6224213, -1.203136, 1.331639, 1, 1, 1, 1, 1,
0.6265934, 0.4610813, 1.122792, 1, 1, 1, 1, 1,
0.6319316, -0.9084955, 4.23109, 1, 1, 1, 1, 1,
0.6345525, 0.9192047, -0.2885835, 1, 1, 1, 1, 1,
0.6350788, -0.6996434, 2.969115, 1, 1, 1, 1, 1,
0.6401226, -0.2144726, 0.6363487, 1, 1, 1, 1, 1,
0.6403202, -0.8864561, 2.576632, 1, 1, 1, 1, 1,
0.64043, 0.1036688, 0.9081271, 1, 1, 1, 1, 1,
0.6429783, -0.406462, 2.589625, 0, 0, 1, 1, 1,
0.6433387, -0.3441051, 1.864013, 1, 0, 0, 1, 1,
0.6454908, -0.5748541, 3.988176, 1, 0, 0, 1, 1,
0.6461374, -0.7881895, 1.944854, 1, 0, 0, 1, 1,
0.6463201, -0.3336322, 0.8811121, 1, 0, 0, 1, 1,
0.6485713, -0.609645, 2.044715, 1, 0, 0, 1, 1,
0.6489182, -1.601521, 2.961703, 0, 0, 0, 1, 1,
0.6512326, 0.325717, 1.581642, 0, 0, 0, 1, 1,
0.6534472, -1.425783, 3.767157, 0, 0, 0, 1, 1,
0.6548877, 1.233007, 1.329509, 0, 0, 0, 1, 1,
0.6550536, 1.073255, -0.5468432, 0, 0, 0, 1, 1,
0.656462, -0.1825924, 2.569852, 0, 0, 0, 1, 1,
0.6573703, -1.263031, 3.347849, 0, 0, 0, 1, 1,
0.6642085, -1.189939, 3.155708, 1, 1, 1, 1, 1,
0.6651537, 1.433245, 0.6575655, 1, 1, 1, 1, 1,
0.6663072, 0.4706804, 1.554187, 1, 1, 1, 1, 1,
0.6680291, -0.381086, 2.017038, 1, 1, 1, 1, 1,
0.6713366, 0.4306309, 0.2952687, 1, 1, 1, 1, 1,
0.6717328, -1.042831, 2.692056, 1, 1, 1, 1, 1,
0.6739553, 1.6698, -1.653555, 1, 1, 1, 1, 1,
0.6799157, 1.666363, 0.07967278, 1, 1, 1, 1, 1,
0.6813134, -0.07299128, 0.8109396, 1, 1, 1, 1, 1,
0.6857767, 0.7629321, 0.8650588, 1, 1, 1, 1, 1,
0.6926347, 1.090012, 0.779695, 1, 1, 1, 1, 1,
0.6945539, -1.729865, 1.803273, 1, 1, 1, 1, 1,
0.6957688, 0.01743961, 1.898414, 1, 1, 1, 1, 1,
0.7006429, 1.186433, -0.6129258, 1, 1, 1, 1, 1,
0.7041092, -1.878243, 1.645891, 1, 1, 1, 1, 1,
0.7047375, -1.835968, 2.884832, 0, 0, 1, 1, 1,
0.7053989, -0.09486704, 1.149961, 1, 0, 0, 1, 1,
0.7059119, -0.1521153, 1.891291, 1, 0, 0, 1, 1,
0.7070436, 0.006311879, 3.523368, 1, 0, 0, 1, 1,
0.7079006, 0.5834196, 0.8206393, 1, 0, 0, 1, 1,
0.7171966, -0.3563489, 1.987012, 1, 0, 0, 1, 1,
0.7211209, -1.196227, 2.884557, 0, 0, 0, 1, 1,
0.7234671, -0.09272809, 1.106338, 0, 0, 0, 1, 1,
0.7253344, 1.694222, 0.4673973, 0, 0, 0, 1, 1,
0.7362607, -0.290988, 2.130696, 0, 0, 0, 1, 1,
0.736864, 1.039288, -0.4042266, 0, 0, 0, 1, 1,
0.7379795, -0.4822176, 2.866401, 0, 0, 0, 1, 1,
0.7431212, 0.4223351, 2.848462, 0, 0, 0, 1, 1,
0.7488352, -1.459534, 2.492644, 1, 1, 1, 1, 1,
0.7499724, -0.3667392, 2.713017, 1, 1, 1, 1, 1,
0.7512823, 0.639006, 3.102317, 1, 1, 1, 1, 1,
0.7539486, 1.350664, 1.765052, 1, 1, 1, 1, 1,
0.7600639, -0.6403844, 1.830098, 1, 1, 1, 1, 1,
0.7717967, 0.2594468, 2.105343, 1, 1, 1, 1, 1,
0.7756166, -0.6624907, 1.81854, 1, 1, 1, 1, 1,
0.7837456, 0.9047713, 1.907076, 1, 1, 1, 1, 1,
0.7928793, 1.334087, 1.613162, 1, 1, 1, 1, 1,
0.7936608, -0.1610698, 1.463174, 1, 1, 1, 1, 1,
0.7986341, -0.2489636, 4.43351, 1, 1, 1, 1, 1,
0.8005477, -0.7942408, 3.278086, 1, 1, 1, 1, 1,
0.8049554, 0.820848, 1.744859, 1, 1, 1, 1, 1,
0.8148741, -0.7823477, 3.462329, 1, 1, 1, 1, 1,
0.8161409, -0.8744109, 2.43149, 1, 1, 1, 1, 1,
0.8185434, 0.840089, 0.9604766, 0, 0, 1, 1, 1,
0.821788, -1.872561, 2.794673, 1, 0, 0, 1, 1,
0.8272642, -1.99852, 2.604801, 1, 0, 0, 1, 1,
0.8357495, -0.670673, 0.9962742, 1, 0, 0, 1, 1,
0.8368211, -0.232863, 2.067096, 1, 0, 0, 1, 1,
0.8419173, 0.5076078, 2.558731, 1, 0, 0, 1, 1,
0.8453976, 0.2391555, -0.1624956, 0, 0, 0, 1, 1,
0.8475885, 0.2173976, 0.2249302, 0, 0, 0, 1, 1,
0.8521838, 0.2782587, 0.2838745, 0, 0, 0, 1, 1,
0.8522694, 0.4009344, 0.2352594, 0, 0, 0, 1, 1,
0.8613638, 0.04309075, 2.596209, 0, 0, 0, 1, 1,
0.8622967, 1.093361, 0.9301636, 0, 0, 0, 1, 1,
0.8773832, -2.131531, 2.105374, 0, 0, 0, 1, 1,
0.8780056, 0.1208572, 2.756576, 1, 1, 1, 1, 1,
0.8807929, 0.4911244, 0.9130195, 1, 1, 1, 1, 1,
0.9017281, 1.210397, 2.059109, 1, 1, 1, 1, 1,
0.9054366, 1.407531, -0.3297495, 1, 1, 1, 1, 1,
0.9072295, -0.761842, 1.770952, 1, 1, 1, 1, 1,
0.9087048, -0.1646348, 2.759439, 1, 1, 1, 1, 1,
0.9100182, 0.7854786, 0.6558319, 1, 1, 1, 1, 1,
0.9119609, -1.351774, 2.694106, 1, 1, 1, 1, 1,
0.9124196, -0.542128, 3.334676, 1, 1, 1, 1, 1,
0.9133407, 1.201353, -0.3846173, 1, 1, 1, 1, 1,
0.916211, 0.1548926, 2.488358, 1, 1, 1, 1, 1,
0.9172977, 1.635498, 0.6762153, 1, 1, 1, 1, 1,
0.9182549, 1.304818, 0.9679619, 1, 1, 1, 1, 1,
0.9201193, 1.416957, 1.604793, 1, 1, 1, 1, 1,
0.9218053, 2.145235, 0.08127369, 1, 1, 1, 1, 1,
0.9247278, -0.7765457, 3.247705, 0, 0, 1, 1, 1,
0.9384466, 0.8246816, 1.776987, 1, 0, 0, 1, 1,
0.9390668, -0.4519807, 3.638058, 1, 0, 0, 1, 1,
0.9427579, -0.1802975, 1.280864, 1, 0, 0, 1, 1,
0.9483393, -0.6223648, 2.694482, 1, 0, 0, 1, 1,
0.948642, 1.825912, 0.9559968, 1, 0, 0, 1, 1,
0.9567467, 0.1732526, -0.622794, 0, 0, 0, 1, 1,
0.9642369, 0.09452305, 1.265729, 0, 0, 0, 1, 1,
0.9644985, -0.5970339, 1.890649, 0, 0, 0, 1, 1,
0.9662695, -0.389546, 2.936813, 0, 0, 0, 1, 1,
0.9667396, -0.6540511, 0.7834858, 0, 0, 0, 1, 1,
0.9742513, 1.400427, 1.322015, 0, 0, 0, 1, 1,
0.9773218, -0.2560991, 1.865104, 0, 0, 0, 1, 1,
0.9852097, 0.6100893, 2.170564, 1, 1, 1, 1, 1,
0.9873813, -0.09128069, 1.366187, 1, 1, 1, 1, 1,
0.987906, 0.5319635, 0.6877149, 1, 1, 1, 1, 1,
0.9882405, 0.7501585, -0.7456493, 1, 1, 1, 1, 1,
0.9935161, -0.2102766, 2.926948, 1, 1, 1, 1, 1,
0.9940305, 0.4937144, 3.150661, 1, 1, 1, 1, 1,
1.015839, -0.2488027, 2.847441, 1, 1, 1, 1, 1,
1.016657, -2.003747, 4.334757, 1, 1, 1, 1, 1,
1.021137, 0.9189271, -1.130674, 1, 1, 1, 1, 1,
1.025473, 0.276448, 2.123361, 1, 1, 1, 1, 1,
1.037503, -0.9295233, 2.690699, 1, 1, 1, 1, 1,
1.062085, 1.490255, 0.01696372, 1, 1, 1, 1, 1,
1.068273, 0.3118511, 0.4405865, 1, 1, 1, 1, 1,
1.071219, -0.1771545, 0.9366251, 1, 1, 1, 1, 1,
1.073406, 1.549438, 2.194985, 1, 1, 1, 1, 1,
1.077669, 0.4892046, 2.087325, 0, 0, 1, 1, 1,
1.079868, 0.06455909, 0.8811433, 1, 0, 0, 1, 1,
1.095787, -0.2613526, 2.137303, 1, 0, 0, 1, 1,
1.098274, -0.7083234, 1.822217, 1, 0, 0, 1, 1,
1.110468, 0.1384527, 1.75844, 1, 0, 0, 1, 1,
1.111336, -0.8770302, 4.014384, 1, 0, 0, 1, 1,
1.112979, -0.6116925, 2.392572, 0, 0, 0, 1, 1,
1.113256, -0.6585246, 1.348113, 0, 0, 0, 1, 1,
1.126629, 0.3574823, 2.896929, 0, 0, 0, 1, 1,
1.133822, 0.1016951, 2.943497, 0, 0, 0, 1, 1,
1.14041, -0.6157606, 2.625157, 0, 0, 0, 1, 1,
1.143252, 0.5469413, 1.667007, 0, 0, 0, 1, 1,
1.154498, -1.015981, 3.180147, 0, 0, 0, 1, 1,
1.155287, 2.200735, -2.05951, 1, 1, 1, 1, 1,
1.159024, 0.1794268, 0.4045932, 1, 1, 1, 1, 1,
1.159862, 0.5633425, 1.702513, 1, 1, 1, 1, 1,
1.164581, -1.277579, 1.627365, 1, 1, 1, 1, 1,
1.173171, 0.243172, -1.317946, 1, 1, 1, 1, 1,
1.173481, -0.8580055, 2.36262, 1, 1, 1, 1, 1,
1.174838, -0.3418658, 3.108153, 1, 1, 1, 1, 1,
1.178369, -0.6849737, 2.866594, 1, 1, 1, 1, 1,
1.187721, -0.3341563, 1.692466, 1, 1, 1, 1, 1,
1.195406, -0.0352083, 1.635714, 1, 1, 1, 1, 1,
1.206865, 0.6580158, 0.3338005, 1, 1, 1, 1, 1,
1.207974, 0.6135866, -0.6207846, 1, 1, 1, 1, 1,
1.217557, 0.4895911, 0.9726573, 1, 1, 1, 1, 1,
1.238, -0.5108689, 2.02464, 1, 1, 1, 1, 1,
1.238223, -0.08162514, 1.880922, 1, 1, 1, 1, 1,
1.251152, -1.49668, 2.517262, 0, 0, 1, 1, 1,
1.268481, -2.444841, 3.852913, 1, 0, 0, 1, 1,
1.275354, -0.1263414, 1.102851, 1, 0, 0, 1, 1,
1.282942, 0.2230925, 2.13892, 1, 0, 0, 1, 1,
1.290178, -0.7796924, 2.009361, 1, 0, 0, 1, 1,
1.293603, 0.1259013, 2.708082, 1, 0, 0, 1, 1,
1.300138, -0.7464079, 0.6759472, 0, 0, 0, 1, 1,
1.303314, -0.4892641, 1.768516, 0, 0, 0, 1, 1,
1.308428, 0.6496336, 3.059732, 0, 0, 0, 1, 1,
1.328987, 0.1226374, 1.269293, 0, 0, 0, 1, 1,
1.338903, 1.031416, 0.2870481, 0, 0, 0, 1, 1,
1.340592, -1.240614, 1.807836, 0, 0, 0, 1, 1,
1.354243, -1.145635, 1.712333, 0, 0, 0, 1, 1,
1.355125, -1.207164, 3.789529, 1, 1, 1, 1, 1,
1.366007, 0.4916031, 1.713656, 1, 1, 1, 1, 1,
1.368761, -2.349367, 3.459604, 1, 1, 1, 1, 1,
1.381383, 0.579229, 0.8753738, 1, 1, 1, 1, 1,
1.391146, 1.250296, -0.7944362, 1, 1, 1, 1, 1,
1.393294, 0.1073377, 1.65093, 1, 1, 1, 1, 1,
1.402133, -0.6711025, 4.392548, 1, 1, 1, 1, 1,
1.408987, -0.3894408, 2.025437, 1, 1, 1, 1, 1,
1.433164, -0.5665838, 1.941889, 1, 1, 1, 1, 1,
1.436346, 1.208967, 1.578934, 1, 1, 1, 1, 1,
1.441132, 1.43109, 1.437185, 1, 1, 1, 1, 1,
1.446258, 0.4060412, 1.044507, 1, 1, 1, 1, 1,
1.450475, 1.239347, -0.3968412, 1, 1, 1, 1, 1,
1.456926, 0.1203212, 1.909317, 1, 1, 1, 1, 1,
1.463125, -0.3504663, 3.517192, 1, 1, 1, 1, 1,
1.463771, -1.04729, 3.109056, 0, 0, 1, 1, 1,
1.468468, -0.9014035, 1.596437, 1, 0, 0, 1, 1,
1.470077, -0.8259019, 2.745213, 1, 0, 0, 1, 1,
1.489941, -0.705878, 1.990527, 1, 0, 0, 1, 1,
1.501086, -0.1972426, 2.808644, 1, 0, 0, 1, 1,
1.501999, 0.8683491, 1.426288, 1, 0, 0, 1, 1,
1.526652, -0.5823427, 2.833563, 0, 0, 0, 1, 1,
1.526752, -0.03465174, 1.849041, 0, 0, 0, 1, 1,
1.541125, 2.037355, 0.3519051, 0, 0, 0, 1, 1,
1.541276, 0.1234412, 1.167114, 0, 0, 0, 1, 1,
1.544983, 0.9658646, 0.05709344, 0, 0, 0, 1, 1,
1.549428, -0.4550419, 2.144076, 0, 0, 0, 1, 1,
1.550297, 1.897766, -0.1313431, 0, 0, 0, 1, 1,
1.552276, 0.4945172, 2.026766, 1, 1, 1, 1, 1,
1.552783, 0.11537, 1.065309, 1, 1, 1, 1, 1,
1.560003, -0.6137166, 0.5740038, 1, 1, 1, 1, 1,
1.567302, 0.1873446, 1.090585, 1, 1, 1, 1, 1,
1.576994, 1.234609, 2.197229, 1, 1, 1, 1, 1,
1.580053, -0.7492024, 2.575894, 1, 1, 1, 1, 1,
1.587666, 0.2821588, 2.095607, 1, 1, 1, 1, 1,
1.600116, -0.4828289, 2.274662, 1, 1, 1, 1, 1,
1.60073, 0.398868, 1.008127, 1, 1, 1, 1, 1,
1.607893, -1.149261, 2.221637, 1, 1, 1, 1, 1,
1.618441, 0.7409759, 1.752731, 1, 1, 1, 1, 1,
1.623922, 0.2496767, 3.662812, 1, 1, 1, 1, 1,
1.640237, -0.4585065, 0.5571369, 1, 1, 1, 1, 1,
1.646803, -2.173315, 3.227912, 1, 1, 1, 1, 1,
1.665399, -0.4877969, 2.27329, 1, 1, 1, 1, 1,
1.681856, -0.2695066, 1.583753, 0, 0, 1, 1, 1,
1.686096, -0.6385253, 3.171537, 1, 0, 0, 1, 1,
1.69731, -0.5795082, 0.8853237, 1, 0, 0, 1, 1,
1.710636, 0.8643501, 0.9901311, 1, 0, 0, 1, 1,
1.711722, 0.2919442, 2.427663, 1, 0, 0, 1, 1,
1.721686, 0.9947412, -0.2151422, 1, 0, 0, 1, 1,
1.736039, 1.399112, 0.5680245, 0, 0, 0, 1, 1,
1.738406, 0.1499682, 1.719078, 0, 0, 0, 1, 1,
1.740712, -1.329821, 4.359866, 0, 0, 0, 1, 1,
1.762529, 2.039936, 1.843991, 0, 0, 0, 1, 1,
1.771434, 1.193372, 1.119974, 0, 0, 0, 1, 1,
1.782277, 0.6408605, 2.607849, 0, 0, 0, 1, 1,
1.815899, 0.311994, 0.228934, 0, 0, 0, 1, 1,
1.822156, -0.9033409, 2.160384, 1, 1, 1, 1, 1,
1.849203, 0.756557, -1.365367, 1, 1, 1, 1, 1,
1.867137, 2.377683, 0.3655297, 1, 1, 1, 1, 1,
1.872081, -1.287261, 1.982827, 1, 1, 1, 1, 1,
1.884242, -0.531908, 2.740355, 1, 1, 1, 1, 1,
1.901027, -0.562344, 2.357836, 1, 1, 1, 1, 1,
1.919497, -0.348506, 1.493494, 1, 1, 1, 1, 1,
1.933385, 3.301179, 0.04405759, 1, 1, 1, 1, 1,
1.933601, 0.3381812, -0.3130803, 1, 1, 1, 1, 1,
1.93564, -1.17119, 4.242789, 1, 1, 1, 1, 1,
1.943254, -0.6134561, 2.327263, 1, 1, 1, 1, 1,
1.955658, 0.3570318, 1.558074, 1, 1, 1, 1, 1,
1.981925, 1.315898, 1.505148, 1, 1, 1, 1, 1,
1.997779, -0.6981461, 2.355945, 1, 1, 1, 1, 1,
2.028333, 1.527758, 0.03154292, 1, 1, 1, 1, 1,
2.028556, 0.2114341, 2.214906, 0, 0, 1, 1, 1,
2.047585, -0.4449208, 2.632347, 1, 0, 0, 1, 1,
2.051504, 0.8722988, 1.012688, 1, 0, 0, 1, 1,
2.061602, -1.156511, -0.2142781, 1, 0, 0, 1, 1,
2.065507, 0.3798932, 0.4941844, 1, 0, 0, 1, 1,
2.173987, 0.1622905, 2.364838, 1, 0, 0, 1, 1,
2.175251, 0.2451073, 2.578028, 0, 0, 0, 1, 1,
2.186939, -0.442515, 1.462687, 0, 0, 0, 1, 1,
2.205394, -0.7453213, 1.193196, 0, 0, 0, 1, 1,
2.27197, -0.3153871, 2.261978, 0, 0, 0, 1, 1,
2.285783, 0.174311, 2.300243, 0, 0, 0, 1, 1,
2.35568, -1.623714, 1.457084, 0, 0, 0, 1, 1,
2.371667, -1.071642, 2.026338, 0, 0, 0, 1, 1,
2.396964, 0.4375493, 1.301722, 1, 1, 1, 1, 1,
2.453818, -2.321503, 1.331185, 1, 1, 1, 1, 1,
2.503717, -0.9509861, 0.2526895, 1, 1, 1, 1, 1,
2.527683, -1.501129, -0.1473989, 1, 1, 1, 1, 1,
2.700842, -0.1701997, 0.09592775, 1, 1, 1, 1, 1,
2.730314, 1.533206, 1.022252, 1, 1, 1, 1, 1,
3.14359, 0.5502567, 2.30786, 1, 1, 1, 1, 1
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
var radius = 9.594464;
var distance = 33.70015;
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
mvMatrix.translate( -0.02248788, 0.07495999, 0.04581189 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70015);
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
