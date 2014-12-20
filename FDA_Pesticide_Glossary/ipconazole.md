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
-3.695007, -0.1747093, -2.480185, 1, 0, 0, 1,
-3.174882, 0.3454097, -2.095899, 1, 0.007843138, 0, 1,
-3.112127, 0.3352221, 0.006291582, 1, 0.01176471, 0, 1,
-2.779866, -0.500829, -1.508098, 1, 0.01960784, 0, 1,
-2.538234, 0.5527251, 1.699715, 1, 0.02352941, 0, 1,
-2.510602, 0.7319701, -1.377453, 1, 0.03137255, 0, 1,
-2.411235, 0.2862036, -3.155518, 1, 0.03529412, 0, 1,
-2.374136, 1.568379, -2.009104, 1, 0.04313726, 0, 1,
-2.366721, -0.2505315, -0.8717021, 1, 0.04705882, 0, 1,
-2.358568, -1.0197, -0.7476768, 1, 0.05490196, 0, 1,
-2.335122, -0.921096, -2.407913, 1, 0.05882353, 0, 1,
-2.301688, -1.162971, -1.023566, 1, 0.06666667, 0, 1,
-2.289615, 0.250179, -1.227214, 1, 0.07058824, 0, 1,
-2.286935, 1.250497, -1.304881, 1, 0.07843138, 0, 1,
-2.266279, -0.5030844, -2.090852, 1, 0.08235294, 0, 1,
-2.26623, -0.7850299, -2.965946, 1, 0.09019608, 0, 1,
-2.220157, 0.006586701, -2.465762, 1, 0.09411765, 0, 1,
-2.194085, 1.482773, -2.308061, 1, 0.1019608, 0, 1,
-2.176507, -0.9693622, -1.113309, 1, 0.1098039, 0, 1,
-2.115668, -0.7758867, -2.073214, 1, 0.1137255, 0, 1,
-2.099881, 0.4629411, -0.4962782, 1, 0.1215686, 0, 1,
-2.030678, 0.04761462, -1.428424, 1, 0.1254902, 0, 1,
-2.023247, 1.867529, -0.08036635, 1, 0.1333333, 0, 1,
-1.985848, -0.7359826, -2.241438, 1, 0.1372549, 0, 1,
-1.970674, -0.2064024, -1.997529, 1, 0.145098, 0, 1,
-1.964573, -1.670237, -3.062829, 1, 0.1490196, 0, 1,
-1.909873, -1.491244, -2.564495, 1, 0.1568628, 0, 1,
-1.903745, 1.633413, 0.7054327, 1, 0.1607843, 0, 1,
-1.850675, 1.528632, -1.01291, 1, 0.1686275, 0, 1,
-1.848543, 0.9164908, 1.125028, 1, 0.172549, 0, 1,
-1.843227, -0.6041662, -2.745026, 1, 0.1803922, 0, 1,
-1.803775, -0.8827025, -1.914485, 1, 0.1843137, 0, 1,
-1.774251, 1.311505, -1.379314, 1, 0.1921569, 0, 1,
-1.761814, 1.726404, -1.782477, 1, 0.1960784, 0, 1,
-1.72713, 1.289453, -1.780873, 1, 0.2039216, 0, 1,
-1.725067, -1.896549, -2.111192, 1, 0.2117647, 0, 1,
-1.724252, -0.7531772, -2.271493, 1, 0.2156863, 0, 1,
-1.722391, -0.6781902, -2.126387, 1, 0.2235294, 0, 1,
-1.703314, -0.9459623, -1.22057, 1, 0.227451, 0, 1,
-1.664356, -0.0892977, -3.004323, 1, 0.2352941, 0, 1,
-1.65551, 0.1067888, -1.842008, 1, 0.2392157, 0, 1,
-1.647097, 0.4019056, -0.6824152, 1, 0.2470588, 0, 1,
-1.6128, 0.2378331, -1.517563, 1, 0.2509804, 0, 1,
-1.607905, -0.2727836, -0.4868598, 1, 0.2588235, 0, 1,
-1.598871, 1.145564, 0.4364392, 1, 0.2627451, 0, 1,
-1.597612, -1.297357, -1.377836, 1, 0.2705882, 0, 1,
-1.575339, 0.4373601, -3.0545, 1, 0.2745098, 0, 1,
-1.570187, -0.2052671, -3.388901, 1, 0.282353, 0, 1,
-1.568321, 0.2570857, -1.806079, 1, 0.2862745, 0, 1,
-1.554399, -0.6174242, -2.290842, 1, 0.2941177, 0, 1,
-1.549255, 0.2377553, -3.310519, 1, 0.3019608, 0, 1,
-1.514625, -0.1785164, -2.662489, 1, 0.3058824, 0, 1,
-1.507079, -0.6901811, -1.004312, 1, 0.3137255, 0, 1,
-1.488225, -0.02251294, -0.7708251, 1, 0.3176471, 0, 1,
-1.479437, 0.1786266, -2.237264, 1, 0.3254902, 0, 1,
-1.479083, -0.01137414, -0.9078031, 1, 0.3294118, 0, 1,
-1.478984, 0.3448599, -1.162106, 1, 0.3372549, 0, 1,
-1.464378, -1.851434, -2.680861, 1, 0.3411765, 0, 1,
-1.461305, -0.7746256, -3.050842, 1, 0.3490196, 0, 1,
-1.459162, 2.356976, -0.5945188, 1, 0.3529412, 0, 1,
-1.455538, -0.8434716, -2.897613, 1, 0.3607843, 0, 1,
-1.450938, 0.2395948, -2.135494, 1, 0.3647059, 0, 1,
-1.432374, -0.05553735, -0.8488051, 1, 0.372549, 0, 1,
-1.431634, 1.268615, -0.2076571, 1, 0.3764706, 0, 1,
-1.431337, 0.2568075, -1.679813, 1, 0.3843137, 0, 1,
-1.427059, 0.495211, -0.5784325, 1, 0.3882353, 0, 1,
-1.423713, -0.1274268, -1.619433, 1, 0.3960784, 0, 1,
-1.41998, 0.2890951, -0.01528481, 1, 0.4039216, 0, 1,
-1.419757, -0.4745736, -2.364659, 1, 0.4078431, 0, 1,
-1.419666, 0.04314074, -1.454283, 1, 0.4156863, 0, 1,
-1.419192, -0.3012941, -0.1810644, 1, 0.4196078, 0, 1,
-1.399556, -0.0296614, -1.191664, 1, 0.427451, 0, 1,
-1.389301, 0.1868099, 0.1062508, 1, 0.4313726, 0, 1,
-1.387925, -0.9249463, -2.027253, 1, 0.4392157, 0, 1,
-1.379448, -0.6733472, -1.676437, 1, 0.4431373, 0, 1,
-1.376658, -0.250444, -1.493254, 1, 0.4509804, 0, 1,
-1.372165, -0.2588012, -1.272863, 1, 0.454902, 0, 1,
-1.371917, 1.224106, -1.399354, 1, 0.4627451, 0, 1,
-1.36186, -0.9963014, -0.5002883, 1, 0.4666667, 0, 1,
-1.361018, -1.393145, -3.556834, 1, 0.4745098, 0, 1,
-1.356987, -2.511855, -2.73928, 1, 0.4784314, 0, 1,
-1.353163, 1.616175, -1.253734, 1, 0.4862745, 0, 1,
-1.346804, 1.314416, 0.3703511, 1, 0.4901961, 0, 1,
-1.344861, -0.04130053, -0.7584659, 1, 0.4980392, 0, 1,
-1.340334, -0.4192114, -0.9615051, 1, 0.5058824, 0, 1,
-1.339697, 1.107749, -2.273027, 1, 0.509804, 0, 1,
-1.337878, 1.121679, -0.5729205, 1, 0.5176471, 0, 1,
-1.33679, -0.2645843, -1.565139, 1, 0.5215687, 0, 1,
-1.333208, -0.3969716, -3.433922, 1, 0.5294118, 0, 1,
-1.325997, -0.6120436, -0.05689306, 1, 0.5333334, 0, 1,
-1.324843, 0.4638807, -0.7031803, 1, 0.5411765, 0, 1,
-1.319476, -0.414785, -2.014229, 1, 0.5450981, 0, 1,
-1.315955, 0.5841041, -0.4569999, 1, 0.5529412, 0, 1,
-1.275158, -0.5696099, -2.124178, 1, 0.5568628, 0, 1,
-1.273968, -0.4825164, -2.736917, 1, 0.5647059, 0, 1,
-1.263239, 0.7406613, -0.2086782, 1, 0.5686275, 0, 1,
-1.258702, 0.9267093, -1.004593, 1, 0.5764706, 0, 1,
-1.256735, -1.383777, -0.4371229, 1, 0.5803922, 0, 1,
-1.244076, -0.6343888, -3.369328, 1, 0.5882353, 0, 1,
-1.243109, 0.2340768, -1.841807, 1, 0.5921569, 0, 1,
-1.240739, 0.9838767, 0.2872954, 1, 0.6, 0, 1,
-1.231158, 0.9367006, -0.7939957, 1, 0.6078432, 0, 1,
-1.220908, 0.9934462, -1.208919, 1, 0.6117647, 0, 1,
-1.218037, 0.8625891, -0.3538493, 1, 0.6196079, 0, 1,
-1.216661, -1.249859, -3.562643, 1, 0.6235294, 0, 1,
-1.215102, -0.1515423, -2.065758, 1, 0.6313726, 0, 1,
-1.212841, -0.51608, -1.407031, 1, 0.6352941, 0, 1,
-1.211983, 0.09492259, -1.958575, 1, 0.6431373, 0, 1,
-1.207432, -0.4533392, -3.531084, 1, 0.6470588, 0, 1,
-1.198868, -1.747248, -2.200189, 1, 0.654902, 0, 1,
-1.195548, 0.04634827, -0.5455885, 1, 0.6588235, 0, 1,
-1.185445, -0.2531571, -1.14599, 1, 0.6666667, 0, 1,
-1.184941, -0.3648875, -1.907355, 1, 0.6705883, 0, 1,
-1.175189, 0.1756784, -1.088625, 1, 0.6784314, 0, 1,
-1.164916, -1.226502, -2.681107, 1, 0.682353, 0, 1,
-1.161871, 0.504903, -0.6976539, 1, 0.6901961, 0, 1,
-1.158982, -0.06550475, -0.8686177, 1, 0.6941177, 0, 1,
-1.154276, 0.06106455, -0.9497203, 1, 0.7019608, 0, 1,
-1.153846, 0.4472163, -2.61782, 1, 0.7098039, 0, 1,
-1.146979, 0.6567277, -1.805624, 1, 0.7137255, 0, 1,
-1.140745, 0.3216231, -2.121352, 1, 0.7215686, 0, 1,
-1.137409, -0.3397038, -2.029519, 1, 0.7254902, 0, 1,
-1.136742, 1.900409, -1.072364, 1, 0.7333333, 0, 1,
-1.120842, 1.059714, -1.266644, 1, 0.7372549, 0, 1,
-1.119685, -0.8713637, -0.9365662, 1, 0.7450981, 0, 1,
-1.118342, -0.1433757, -1.921283, 1, 0.7490196, 0, 1,
-1.115097, -0.4786987, -2.120701, 1, 0.7568628, 0, 1,
-1.111532, -0.962911, -1.017558, 1, 0.7607843, 0, 1,
-1.108675, 0.2090556, -3.097712, 1, 0.7686275, 0, 1,
-1.104436, 2.754144, -0.8542009, 1, 0.772549, 0, 1,
-1.100025, -0.04671718, -1.028214, 1, 0.7803922, 0, 1,
-1.097298, -0.4202311, -2.757816, 1, 0.7843137, 0, 1,
-1.095437, -0.842591, -3.567501, 1, 0.7921569, 0, 1,
-1.094129, 1.777277, 1.333172, 1, 0.7960784, 0, 1,
-1.093585, 0.9967849, -1.474719, 1, 0.8039216, 0, 1,
-1.088007, -1.653921, -1.949583, 1, 0.8117647, 0, 1,
-1.085553, -1.128691, -1.331735, 1, 0.8156863, 0, 1,
-1.081143, -2.087823, -3.408257, 1, 0.8235294, 0, 1,
-1.076747, -0.3631757, -3.752939, 1, 0.827451, 0, 1,
-1.072598, 1.858733, -1.194168, 1, 0.8352941, 0, 1,
-1.070517, 0.4884821, -2.453655, 1, 0.8392157, 0, 1,
-1.05995, 0.2678396, -0.4805419, 1, 0.8470588, 0, 1,
-1.054744, -1.976296, -1.140644, 1, 0.8509804, 0, 1,
-1.053586, -0.5855857, -2.649587, 1, 0.8588235, 0, 1,
-1.051806, 0.1183464, -1.175675, 1, 0.8627451, 0, 1,
-1.045436, 0.02533798, -1.060564, 1, 0.8705882, 0, 1,
-1.044269, -2.19371, -2.136998, 1, 0.8745098, 0, 1,
-1.042982, -2.109979, -4.400204, 1, 0.8823529, 0, 1,
-1.041261, 0.7322222, -0.208961, 1, 0.8862745, 0, 1,
-1.040352, 1.019521, -1.405699, 1, 0.8941177, 0, 1,
-1.040323, -0.0007267211, -2.782208, 1, 0.8980392, 0, 1,
-1.040185, -0.3659051, -2.11661, 1, 0.9058824, 0, 1,
-1.034298, -0.004951321, -2.132882, 1, 0.9137255, 0, 1,
-1.026755, -0.8199716, -1.301483, 1, 0.9176471, 0, 1,
-1.021026, -0.226162, -1.684896, 1, 0.9254902, 0, 1,
-1.009283, -0.08740604, -2.551315, 1, 0.9294118, 0, 1,
-1.007175, 0.3923763, -0.9961633, 1, 0.9372549, 0, 1,
-1.00677, -0.1107586, -3.378585, 1, 0.9411765, 0, 1,
-1.002805, 0.2816308, -3.281995, 1, 0.9490196, 0, 1,
-1.001315, -0.4387158, -0.2436073, 1, 0.9529412, 0, 1,
-0.9965202, 0.7255277, -0.8566175, 1, 0.9607843, 0, 1,
-0.992205, 0.7665716, -2.085752, 1, 0.9647059, 0, 1,
-0.9894294, -0.3570941, -2.204484, 1, 0.972549, 0, 1,
-0.9883431, -0.8451254, -2.032638, 1, 0.9764706, 0, 1,
-0.9745153, 1.788595, -0.2442857, 1, 0.9843137, 0, 1,
-0.9645171, 1.426546, -1.270178, 1, 0.9882353, 0, 1,
-0.9624492, -0.4493637, -0.3663926, 1, 0.9960784, 0, 1,
-0.9612355, 1.599524, 0.4350003, 0.9960784, 1, 0, 1,
-0.9584779, -0.4524976, -1.353396, 0.9921569, 1, 0, 1,
-0.9549723, -1.834432, -2.436964, 0.9843137, 1, 0, 1,
-0.9545187, -0.5704649, -2.918477, 0.9803922, 1, 0, 1,
-0.9527412, -2.760128, -3.69204, 0.972549, 1, 0, 1,
-0.951328, 0.3295465, 1.215786, 0.9686275, 1, 0, 1,
-0.947052, -0.4659516, -2.527464, 0.9607843, 1, 0, 1,
-0.9378164, 0.3498796, -2.466732, 0.9568627, 1, 0, 1,
-0.9374848, -1.119601, -2.426667, 0.9490196, 1, 0, 1,
-0.9345211, 0.2521278, -0.7410681, 0.945098, 1, 0, 1,
-0.9339125, -1.26422, -2.908245, 0.9372549, 1, 0, 1,
-0.9313751, 1.737015, 0.3076949, 0.9333333, 1, 0, 1,
-0.930887, -2.035846, -3.351695, 0.9254902, 1, 0, 1,
-0.913255, 1.646089, 1.654403, 0.9215686, 1, 0, 1,
-0.9106532, 0.1879795, 0.1149378, 0.9137255, 1, 0, 1,
-0.896574, -0.8888497, -1.312491, 0.9098039, 1, 0, 1,
-0.8888919, 0.8680534, -0.7709876, 0.9019608, 1, 0, 1,
-0.8838352, -0.5810195, -0.8716015, 0.8941177, 1, 0, 1,
-0.8819237, -0.4757303, -1.875628, 0.8901961, 1, 0, 1,
-0.8789158, 0.9867148, -1.503214, 0.8823529, 1, 0, 1,
-0.8777463, -0.20487, -0.4356588, 0.8784314, 1, 0, 1,
-0.8776886, -2.069032, -2.709437, 0.8705882, 1, 0, 1,
-0.867649, 0.001947239, -0.3736406, 0.8666667, 1, 0, 1,
-0.8594098, -1.781579, -1.729477, 0.8588235, 1, 0, 1,
-0.8587098, 0.7715693, -1.44724, 0.854902, 1, 0, 1,
-0.8578739, 0.7920425, 0.2807645, 0.8470588, 1, 0, 1,
-0.8541603, 1.748586, -2.055711, 0.8431373, 1, 0, 1,
-0.8446927, -0.2872883, -1.684242, 0.8352941, 1, 0, 1,
-0.8411144, 1.257886, -0.03225528, 0.8313726, 1, 0, 1,
-0.8365327, 0.7145167, -2.406108, 0.8235294, 1, 0, 1,
-0.8350707, 0.1895411, -0.5058829, 0.8196079, 1, 0, 1,
-0.825241, 0.8345353, 0.08735401, 0.8117647, 1, 0, 1,
-0.8136864, 0.6547727, -1.91887, 0.8078431, 1, 0, 1,
-0.8119665, 0.1875447, 0.387985, 0.8, 1, 0, 1,
-0.8118165, -0.798475, -2.69301, 0.7921569, 1, 0, 1,
-0.8106121, -1.109594, -2.85993, 0.7882353, 1, 0, 1,
-0.8064204, 1.58324, -0.5861888, 0.7803922, 1, 0, 1,
-0.8047422, 1.164507, -0.3921555, 0.7764706, 1, 0, 1,
-0.8024729, -1.518726, -1.902704, 0.7686275, 1, 0, 1,
-0.7935875, -0.2554445, -0.7360287, 0.7647059, 1, 0, 1,
-0.7913764, 0.2871009, -0.4781533, 0.7568628, 1, 0, 1,
-0.7893556, 0.4328241, -2.053974, 0.7529412, 1, 0, 1,
-0.7840838, 0.4281202, -2.453348, 0.7450981, 1, 0, 1,
-0.7832632, -0.008839365, -1.388753, 0.7411765, 1, 0, 1,
-0.7788659, 0.1199092, -1.002536, 0.7333333, 1, 0, 1,
-0.7784535, 0.3525138, -0.01737704, 0.7294118, 1, 0, 1,
-0.7768881, -0.5266173, -1.021121, 0.7215686, 1, 0, 1,
-0.7763977, -0.1137718, -3.207181, 0.7176471, 1, 0, 1,
-0.766658, 0.7472426, -1.386256, 0.7098039, 1, 0, 1,
-0.7615905, 0.2534921, 0.4724816, 0.7058824, 1, 0, 1,
-0.7609512, -0.3064733, -2.481393, 0.6980392, 1, 0, 1,
-0.7521535, 3.073698, 2.995148, 0.6901961, 1, 0, 1,
-0.7518732, -0.8121774, -2.596608, 0.6862745, 1, 0, 1,
-0.7516676, 0.4660366, 0.07807511, 0.6784314, 1, 0, 1,
-0.7477741, -0.9897956, -4.11978, 0.6745098, 1, 0, 1,
-0.7430987, -0.02275716, -2.378892, 0.6666667, 1, 0, 1,
-0.742009, 0.331146, -0.6006783, 0.6627451, 1, 0, 1,
-0.7350808, -1.110042, -2.584385, 0.654902, 1, 0, 1,
-0.7298538, 1.544013, -1.251763, 0.6509804, 1, 0, 1,
-0.7284656, 1.155476, 0.3883677, 0.6431373, 1, 0, 1,
-0.7265339, -1.023936, -3.114166, 0.6392157, 1, 0, 1,
-0.7255203, 1.107965, -1.053355, 0.6313726, 1, 0, 1,
-0.7251249, 0.963145, -1.45975, 0.627451, 1, 0, 1,
-0.7245053, 1.919151, -1.066567, 0.6196079, 1, 0, 1,
-0.7236779, -0.2924052, -2.239714, 0.6156863, 1, 0, 1,
-0.7231708, -0.07397719, -4.335822, 0.6078432, 1, 0, 1,
-0.7229987, -1.792302, -1.261858, 0.6039216, 1, 0, 1,
-0.7228296, 0.7093083, -0.3533859, 0.5960785, 1, 0, 1,
-0.7149937, -1.035869, -2.8162, 0.5882353, 1, 0, 1,
-0.7144725, -0.1773695, -1.959231, 0.5843138, 1, 0, 1,
-0.7143816, 0.1825269, -2.704026, 0.5764706, 1, 0, 1,
-0.7131491, 0.976122, -1.331208, 0.572549, 1, 0, 1,
-0.7128591, -1.481059, -1.956074, 0.5647059, 1, 0, 1,
-0.7102847, 0.1748492, -1.629249, 0.5607843, 1, 0, 1,
-0.7015082, 0.4917032, -2.190902, 0.5529412, 1, 0, 1,
-0.6957101, 1.604652, -0.587074, 0.5490196, 1, 0, 1,
-0.6942413, 0.03726051, -2.420201, 0.5411765, 1, 0, 1,
-0.6904619, 1.630284, -0.3998625, 0.5372549, 1, 0, 1,
-0.6896306, -0.05076116, -1.592718, 0.5294118, 1, 0, 1,
-0.6895925, -0.3319819, -2.523062, 0.5254902, 1, 0, 1,
-0.6883846, -0.5596057, -3.127783, 0.5176471, 1, 0, 1,
-0.6829808, 1.398278, 0.3457637, 0.5137255, 1, 0, 1,
-0.6828308, 0.6586933, -1.340538, 0.5058824, 1, 0, 1,
-0.6827435, 1.177306, -1.145671, 0.5019608, 1, 0, 1,
-0.6739506, 0.2503698, -0.6333135, 0.4941176, 1, 0, 1,
-0.6721711, 0.401705, 0.6746981, 0.4862745, 1, 0, 1,
-0.6716978, -0.1618802, 0.7979236, 0.4823529, 1, 0, 1,
-0.6634704, -0.7027462, -2.088265, 0.4745098, 1, 0, 1,
-0.6588156, -1.385605, -4.296427, 0.4705882, 1, 0, 1,
-0.6544915, 0.1806301, -1.204206, 0.4627451, 1, 0, 1,
-0.6509034, 0.2392783, 0.03354315, 0.4588235, 1, 0, 1,
-0.6451331, 1.52454, 0.2295778, 0.4509804, 1, 0, 1,
-0.6423165, 0.557441, -1.747299, 0.4470588, 1, 0, 1,
-0.6421515, -0.9519749, -1.936998, 0.4392157, 1, 0, 1,
-0.6404938, -0.9716642, -3.515943, 0.4352941, 1, 0, 1,
-0.6363069, -0.1812635, -0.2784915, 0.427451, 1, 0, 1,
-0.6284194, 1.192894, 0.3270243, 0.4235294, 1, 0, 1,
-0.6259165, 0.2958428, -0.887708, 0.4156863, 1, 0, 1,
-0.6249445, 0.6944228, -1.509811, 0.4117647, 1, 0, 1,
-0.6184922, 0.4237551, -0.7335564, 0.4039216, 1, 0, 1,
-0.6144333, -0.9212471, -2.233229, 0.3960784, 1, 0, 1,
-0.6130834, 0.3880966, -0.6512976, 0.3921569, 1, 0, 1,
-0.6105106, -1.591565, -2.623033, 0.3843137, 1, 0, 1,
-0.6003489, 0.1679326, -1.357295, 0.3803922, 1, 0, 1,
-0.5951941, -0.314148, -2.775146, 0.372549, 1, 0, 1,
-0.5939389, 0.1520106, -0.6990402, 0.3686275, 1, 0, 1,
-0.5904944, -1.384249, -2.120353, 0.3607843, 1, 0, 1,
-0.582101, -0.490786, -2.516675, 0.3568628, 1, 0, 1,
-0.5791845, 0.3276183, 1.266822, 0.3490196, 1, 0, 1,
-0.5758652, 0.2474805, -0.1960196, 0.345098, 1, 0, 1,
-0.5734245, 0.4585051, -0.7389745, 0.3372549, 1, 0, 1,
-0.5722483, 1.644588, 0.07192502, 0.3333333, 1, 0, 1,
-0.5675769, -1.134461, -1.608378, 0.3254902, 1, 0, 1,
-0.5666046, -0.1100074, -3.246443, 0.3215686, 1, 0, 1,
-0.5642971, 0.8898392, -2.74495, 0.3137255, 1, 0, 1,
-0.5565167, -0.5508139, -2.964998, 0.3098039, 1, 0, 1,
-0.5552825, 2.060448, -1.561323, 0.3019608, 1, 0, 1,
-0.5550132, 0.01150094, -1.992316, 0.2941177, 1, 0, 1,
-0.5547896, 0.6199104, -0.3695172, 0.2901961, 1, 0, 1,
-0.5524874, 1.551043, -1.081056, 0.282353, 1, 0, 1,
-0.5516661, 0.1939087, -1.490093, 0.2784314, 1, 0, 1,
-0.5502678, 0.3004287, 0.4386886, 0.2705882, 1, 0, 1,
-0.5449041, 1.623008, -0.2963499, 0.2666667, 1, 0, 1,
-0.5447105, 0.2839643, -0.855379, 0.2588235, 1, 0, 1,
-0.5398009, 0.5725837, -0.3531896, 0.254902, 1, 0, 1,
-0.5351419, -0.006196225, -0.377206, 0.2470588, 1, 0, 1,
-0.5280656, -0.8083417, -1.239104, 0.2431373, 1, 0, 1,
-0.5262067, 0.2167484, -0.0146851, 0.2352941, 1, 0, 1,
-0.5224988, 0.03401044, -1.298929, 0.2313726, 1, 0, 1,
-0.5197757, -0.4683936, -2.575485, 0.2235294, 1, 0, 1,
-0.5166149, -0.3802449, -1.251258, 0.2196078, 1, 0, 1,
-0.5159639, 0.3876722, -2.176955, 0.2117647, 1, 0, 1,
-0.5146077, 0.5105588, -1.293916, 0.2078431, 1, 0, 1,
-0.506476, 0.173788, 0.1400837, 0.2, 1, 0, 1,
-0.5062878, -0.1041887, -2.699152, 0.1921569, 1, 0, 1,
-0.5044253, 0.2187273, 0.1074184, 0.1882353, 1, 0, 1,
-0.5038439, 0.05936876, -1.466158, 0.1803922, 1, 0, 1,
-0.4994473, -0.4328586, -1.867678, 0.1764706, 1, 0, 1,
-0.4945284, 1.46147, 0.6400759, 0.1686275, 1, 0, 1,
-0.4938185, 1.314393, -2.23605, 0.1647059, 1, 0, 1,
-0.4923727, -0.1211829, -2.217532, 0.1568628, 1, 0, 1,
-0.4915389, -1.271835, -3.18513, 0.1529412, 1, 0, 1,
-0.490974, 0.9795155, -0.649847, 0.145098, 1, 0, 1,
-0.4895973, -1.226241, -2.501449, 0.1411765, 1, 0, 1,
-0.4892709, -0.8556416, -1.222247, 0.1333333, 1, 0, 1,
-0.4886304, -1.423618, -3.953949, 0.1294118, 1, 0, 1,
-0.4802772, -0.2345128, -1.74619, 0.1215686, 1, 0, 1,
-0.4790125, 0.9558144, -0.9839753, 0.1176471, 1, 0, 1,
-0.4744602, 0.5899437, -1.109718, 0.1098039, 1, 0, 1,
-0.4715271, -0.2471783, -3.365885, 0.1058824, 1, 0, 1,
-0.4705018, 0.6021695, -0.914416, 0.09803922, 1, 0, 1,
-0.465524, -1.123105, -2.248319, 0.09019608, 1, 0, 1,
-0.461784, 0.5205386, -0.5754548, 0.08627451, 1, 0, 1,
-0.4595836, -0.5844035, -1.375722, 0.07843138, 1, 0, 1,
-0.4595311, -0.9097735, -1.795574, 0.07450981, 1, 0, 1,
-0.4574782, -0.03245695, -0.2596893, 0.06666667, 1, 0, 1,
-0.4566298, -0.884331, -3.549341, 0.0627451, 1, 0, 1,
-0.456181, -0.2786267, -1.677614, 0.05490196, 1, 0, 1,
-0.4520062, -1.118946, -1.069942, 0.05098039, 1, 0, 1,
-0.4507656, -1.458341, -3.86558, 0.04313726, 1, 0, 1,
-0.446557, -0.2825968, -1.067886, 0.03921569, 1, 0, 1,
-0.4401127, 0.2040432, -1.075256, 0.03137255, 1, 0, 1,
-0.4398758, -0.4018618, -2.129807, 0.02745098, 1, 0, 1,
-0.4376608, 0.722136, -0.01267402, 0.01960784, 1, 0, 1,
-0.4354894, 1.76897, -0.7967366, 0.01568628, 1, 0, 1,
-0.4345117, 0.01967183, -2.089289, 0.007843138, 1, 0, 1,
-0.433208, -0.6480249, -2.273952, 0.003921569, 1, 0, 1,
-0.4326859, 1.64176, -1.469992, 0, 1, 0.003921569, 1,
-0.4289609, 0.3935927, -0.6882449, 0, 1, 0.01176471, 1,
-0.4277315, 1.16463, -1.329269, 0, 1, 0.01568628, 1,
-0.4249279, -0.9657399, -2.004128, 0, 1, 0.02352941, 1,
-0.4228092, 0.3908792, 0.1972366, 0, 1, 0.02745098, 1,
-0.4217974, -0.49501, -4.155014, 0, 1, 0.03529412, 1,
-0.4206559, 1.222981, -0.8942086, 0, 1, 0.03921569, 1,
-0.4203295, -0.3174225, -2.400999, 0, 1, 0.04705882, 1,
-0.4183753, 0.7854528, -1.72564, 0, 1, 0.05098039, 1,
-0.4176101, 0.02146816, -1.4302, 0, 1, 0.05882353, 1,
-0.416004, 0.7716957, 0.005677801, 0, 1, 0.0627451, 1,
-0.4130684, 1.796806, -1.248965, 0, 1, 0.07058824, 1,
-0.4086884, 0.645991, 0.9452567, 0, 1, 0.07450981, 1,
-0.4068341, 0.9807729, -1.136697, 0, 1, 0.08235294, 1,
-0.4033987, -0.3357083, -1.6393, 0, 1, 0.08627451, 1,
-0.4007694, -0.3779912, -1.150785, 0, 1, 0.09411765, 1,
-0.3996774, 1.116507, 0.2428024, 0, 1, 0.1019608, 1,
-0.3948954, 0.133523, -1.093351, 0, 1, 0.1058824, 1,
-0.3896235, 0.6671244, 0.07415532, 0, 1, 0.1137255, 1,
-0.3825792, 1.324064, -0.3534341, 0, 1, 0.1176471, 1,
-0.3825217, -2.188318, -2.013355, 0, 1, 0.1254902, 1,
-0.3820956, 0.3798009, -1.214117, 0, 1, 0.1294118, 1,
-0.378561, 1.948489, -0.4021824, 0, 1, 0.1372549, 1,
-0.378245, -0.326964, -2.29299, 0, 1, 0.1411765, 1,
-0.374561, -1.204739, -2.754763, 0, 1, 0.1490196, 1,
-0.3724443, 2.365398, 2.172438, 0, 1, 0.1529412, 1,
-0.3702793, 2.043612, 0.1484518, 0, 1, 0.1607843, 1,
-0.3637466, 0.5580025, -0.5022398, 0, 1, 0.1647059, 1,
-0.3624867, -1.127151, -3.040254, 0, 1, 0.172549, 1,
-0.3622384, -0.8367749, -2.836401, 0, 1, 0.1764706, 1,
-0.3554344, 0.8612507, 1.722831, 0, 1, 0.1843137, 1,
-0.355186, -0.9514806, -2.404448, 0, 1, 0.1882353, 1,
-0.351674, 1.728193, -1.397166, 0, 1, 0.1960784, 1,
-0.3486184, 0.2758884, -0.588781, 0, 1, 0.2039216, 1,
-0.3469709, -0.9651919, -1.071128, 0, 1, 0.2078431, 1,
-0.3387971, -0.2297635, -2.269676, 0, 1, 0.2156863, 1,
-0.3347221, -1.043289, -3.595274, 0, 1, 0.2196078, 1,
-0.3345873, -1.186828, -2.513852, 0, 1, 0.227451, 1,
-0.3303304, -0.5133686, -1.306073, 0, 1, 0.2313726, 1,
-0.3298634, 0.1145487, 0.1234899, 0, 1, 0.2392157, 1,
-0.3255142, -0.4403302, -2.550015, 0, 1, 0.2431373, 1,
-0.3167917, -1.474781, -1.870128, 0, 1, 0.2509804, 1,
-0.3156742, 1.560047, -0.813274, 0, 1, 0.254902, 1,
-0.3147265, -1.330021, -3.561772, 0, 1, 0.2627451, 1,
-0.3145966, 0.2606341, -2.109847, 0, 1, 0.2666667, 1,
-0.3145957, -0.8481091, -2.632396, 0, 1, 0.2745098, 1,
-0.3103389, -0.329013, -0.5636615, 0, 1, 0.2784314, 1,
-0.3091045, 0.0634688, -1.450184, 0, 1, 0.2862745, 1,
-0.2989855, -0.5582647, -2.29705, 0, 1, 0.2901961, 1,
-0.2962757, -1.092019, -2.821012, 0, 1, 0.2980392, 1,
-0.2947441, -0.3185304, -2.872485, 0, 1, 0.3058824, 1,
-0.2929118, -1.013761, -1.319295, 0, 1, 0.3098039, 1,
-0.2869092, 0.236329, 0.2471963, 0, 1, 0.3176471, 1,
-0.2836763, -0.1731364, -1.890223, 0, 1, 0.3215686, 1,
-0.2802519, 1.199231, 0.1800184, 0, 1, 0.3294118, 1,
-0.2801017, -0.5962875, -2.992205, 0, 1, 0.3333333, 1,
-0.2781939, -0.1759177, -0.04175885, 0, 1, 0.3411765, 1,
-0.2779005, 1.906328, 1.355917, 0, 1, 0.345098, 1,
-0.2752804, -0.4843684, -3.094591, 0, 1, 0.3529412, 1,
-0.2732686, 1.317575, 0.1640163, 0, 1, 0.3568628, 1,
-0.2732122, 1.773804, -0.2026337, 0, 1, 0.3647059, 1,
-0.2647462, 1.196717, 0.7379212, 0, 1, 0.3686275, 1,
-0.2637582, 0.02065256, -1.758972, 0, 1, 0.3764706, 1,
-0.2616705, 1.907422, -0.05741852, 0, 1, 0.3803922, 1,
-0.2607042, 0.2783321, -1.343047, 0, 1, 0.3882353, 1,
-0.2602117, 0.6202893, -1.191026, 0, 1, 0.3921569, 1,
-0.2553818, -0.1954433, -3.583148, 0, 1, 0.4, 1,
-0.2543373, 1.327351, -0.6861001, 0, 1, 0.4078431, 1,
-0.2541661, -0.1950936, -3.245021, 0, 1, 0.4117647, 1,
-0.2528375, -0.8561407, -4.405625, 0, 1, 0.4196078, 1,
-0.244682, 0.06469123, -1.129637, 0, 1, 0.4235294, 1,
-0.2438253, -0.184268, -2.433219, 0, 1, 0.4313726, 1,
-0.2427765, -1.429208, -2.564907, 0, 1, 0.4352941, 1,
-0.242566, -0.3875607, -1.856104, 0, 1, 0.4431373, 1,
-0.2369286, 1.514345, -2.154525, 0, 1, 0.4470588, 1,
-0.2333726, -1.249652, -3.469404, 0, 1, 0.454902, 1,
-0.2333718, -0.1722047, -2.651131, 0, 1, 0.4588235, 1,
-0.2310703, 0.0765513, -0.3025687, 0, 1, 0.4666667, 1,
-0.2307879, -1.403624, -2.64596, 0, 1, 0.4705882, 1,
-0.2289716, 1.986233, 1.233529, 0, 1, 0.4784314, 1,
-0.2282074, 0.3406048, -2.418972, 0, 1, 0.4823529, 1,
-0.2214065, 1.889241, 0.06049264, 0, 1, 0.4901961, 1,
-0.2212722, -0.3896235, -3.106454, 0, 1, 0.4941176, 1,
-0.2201748, 1.263474, -1.860875, 0, 1, 0.5019608, 1,
-0.2197241, 0.7702026, -1.393642, 0, 1, 0.509804, 1,
-0.2194287, 0.1852216, -3.412792, 0, 1, 0.5137255, 1,
-0.2172272, -0.1920105, -1.937162, 0, 1, 0.5215687, 1,
-0.2155926, -1.325768, -5.204327, 0, 1, 0.5254902, 1,
-0.2145852, 0.6378873, 0.3850578, 0, 1, 0.5333334, 1,
-0.2135491, 1.028127, 0.615939, 0, 1, 0.5372549, 1,
-0.2108764, 0.7538834, 0.2246682, 0, 1, 0.5450981, 1,
-0.2079115, 0.8896695, -0.7872193, 0, 1, 0.5490196, 1,
-0.205534, -0.1992816, -2.432078, 0, 1, 0.5568628, 1,
-0.2022775, -1.202907, -3.872007, 0, 1, 0.5607843, 1,
-0.1994539, -0.1276612, -3.062576, 0, 1, 0.5686275, 1,
-0.1974392, -1.689671, -4.636988, 0, 1, 0.572549, 1,
-0.196886, -1.125216, -2.67513, 0, 1, 0.5803922, 1,
-0.1902024, -0.1118766, -3.042068, 0, 1, 0.5843138, 1,
-0.1893879, -1.232126, -4.950282, 0, 1, 0.5921569, 1,
-0.1876324, 1.588294, -0.1341115, 0, 1, 0.5960785, 1,
-0.1874184, -0.6366361, 0.4645297, 0, 1, 0.6039216, 1,
-0.1863988, -0.4349938, -3.484901, 0, 1, 0.6117647, 1,
-0.1841393, 0.6219792, -0.7606534, 0, 1, 0.6156863, 1,
-0.1823323, -0.3000478, -2.546039, 0, 1, 0.6235294, 1,
-0.1816609, -0.5452566, -2.332468, 0, 1, 0.627451, 1,
-0.1809721, 0.416676, -0.5701936, 0, 1, 0.6352941, 1,
-0.1804332, 0.9426817, -1.590913, 0, 1, 0.6392157, 1,
-0.1776724, 0.948402, -0.1279574, 0, 1, 0.6470588, 1,
-0.1720592, 0.07145353, -0.7815061, 0, 1, 0.6509804, 1,
-0.1713932, -1.296734, -3.339146, 0, 1, 0.6588235, 1,
-0.1693178, 0.08095166, -0.3409048, 0, 1, 0.6627451, 1,
-0.1620129, 1.131642, -0.5802072, 0, 1, 0.6705883, 1,
-0.1520232, -0.1991665, -3.477575, 0, 1, 0.6745098, 1,
-0.1502956, -0.3092863, -1.823076, 0, 1, 0.682353, 1,
-0.1502571, 0.6170024, -0.01198552, 0, 1, 0.6862745, 1,
-0.1480273, 0.4029664, -1.087596, 0, 1, 0.6941177, 1,
-0.1463111, 0.8982632, 0.3056404, 0, 1, 0.7019608, 1,
-0.1398334, -1.582952, -3.777832, 0, 1, 0.7058824, 1,
-0.1367047, 0.3068494, -1.43369, 0, 1, 0.7137255, 1,
-0.1355533, -1.112873, -1.883241, 0, 1, 0.7176471, 1,
-0.1340352, -1.211389, -3.887318, 0, 1, 0.7254902, 1,
-0.1282151, 0.8805704, -1.957883, 0, 1, 0.7294118, 1,
-0.1229803, -0.3287075, -2.731051, 0, 1, 0.7372549, 1,
-0.1228085, 0.931052, -2.034806, 0, 1, 0.7411765, 1,
-0.1191331, 1.163258, -1.98921, 0, 1, 0.7490196, 1,
-0.1171589, 0.8417767, 0.1448801, 0, 1, 0.7529412, 1,
-0.1162264, -0.1155819, -3.056696, 0, 1, 0.7607843, 1,
-0.1139863, -0.3641172, -2.696091, 0, 1, 0.7647059, 1,
-0.1127113, -0.6265235, -3.653177, 0, 1, 0.772549, 1,
-0.1099138, 0.4085616, 0.1663083, 0, 1, 0.7764706, 1,
-0.1087671, -1.163923, -4.046252, 0, 1, 0.7843137, 1,
-0.1042387, 0.211013, -0.978447, 0, 1, 0.7882353, 1,
-0.09866611, 1.350808, -1.025031, 0, 1, 0.7960784, 1,
-0.0978684, 1.288709, -0.3304909, 0, 1, 0.8039216, 1,
-0.09230965, -0.4855826, -3.091481, 0, 1, 0.8078431, 1,
-0.09207489, -0.1100693, -2.503751, 0, 1, 0.8156863, 1,
-0.08545478, -0.6135439, -1.755402, 0, 1, 0.8196079, 1,
-0.08471432, -0.5871862, -3.302261, 0, 1, 0.827451, 1,
-0.08361907, -0.07585172, -1.751278, 0, 1, 0.8313726, 1,
-0.08289286, -0.5851861, -0.4694969, 0, 1, 0.8392157, 1,
-0.08201247, 0.578921, -1.572104, 0, 1, 0.8431373, 1,
-0.08067802, 1.427722, -0.4143061, 0, 1, 0.8509804, 1,
-0.08056223, 0.1155478, -2.352066, 0, 1, 0.854902, 1,
-0.07849537, 0.8561645, -2.71326, 0, 1, 0.8627451, 1,
-0.07031046, 0.4753471, -1.239202, 0, 1, 0.8666667, 1,
-0.06792139, 0.7677439, 1.885808, 0, 1, 0.8745098, 1,
-0.06770363, -1.07669, -3.556591, 0, 1, 0.8784314, 1,
-0.06613819, 2.094419, 0.8392864, 0, 1, 0.8862745, 1,
-0.06584035, 1.596202, 0.3555993, 0, 1, 0.8901961, 1,
-0.06581797, 1.400818, 1.790048, 0, 1, 0.8980392, 1,
-0.06563707, 0.8065276, 0.6813737, 0, 1, 0.9058824, 1,
-0.06417002, -1.873591, -2.415279, 0, 1, 0.9098039, 1,
-0.05958841, -0.5181783, -2.504845, 0, 1, 0.9176471, 1,
-0.058693, 1.877096, -1.202502, 0, 1, 0.9215686, 1,
-0.05835488, -1.898622, -2.738638, 0, 1, 0.9294118, 1,
-0.05470147, 1.74255, 0.8042708, 0, 1, 0.9333333, 1,
-0.04890902, 0.9153587, 1.863305, 0, 1, 0.9411765, 1,
-0.04824959, 1.180246, 0.3980877, 0, 1, 0.945098, 1,
-0.04822818, -0.03146219, -2.740134, 0, 1, 0.9529412, 1,
-0.0450866, 0.9179722, -0.9192963, 0, 1, 0.9568627, 1,
-0.04493883, -0.5622861, -2.618658, 0, 1, 0.9647059, 1,
-0.04321825, 1.146766, -1.182377, 0, 1, 0.9686275, 1,
-0.03971823, -0.03969147, -1.799635, 0, 1, 0.9764706, 1,
-0.03342079, -1.89711, -2.399503, 0, 1, 0.9803922, 1,
-0.01931708, -1.393061, -3.133151, 0, 1, 0.9882353, 1,
-0.01729415, 0.9348564, 0.6326525, 0, 1, 0.9921569, 1,
-0.01640427, -2.4287, -4.722849, 0, 1, 1, 1,
-0.01243882, -1.460779, -2.887853, 0, 0.9921569, 1, 1,
-0.01227915, 1.229399, 1.731591, 0, 0.9882353, 1, 1,
-0.01226673, -0.8442845, -3.854519, 0, 0.9803922, 1, 1,
-0.012175, -0.2258104, -1.905711, 0, 0.9764706, 1, 1,
-0.005193084, -2.029498, -4.258448, 0, 0.9686275, 1, 1,
-0.00461794, 0.581149, 0.8335842, 0, 0.9647059, 1, 1,
-0.003454485, 0.6200985, 2.301822, 0, 0.9568627, 1, 1,
-1.771808e-05, 0.1839915, -0.7798701, 0, 0.9529412, 1, 1,
0.0002138945, -1.183152, 1.331351, 0, 0.945098, 1, 1,
0.001317874, 1.348359, -0.4856775, 0, 0.9411765, 1, 1,
0.007101095, -0.3068403, 2.711389, 0, 0.9333333, 1, 1,
0.008279226, 0.1501168, -1.034822, 0, 0.9294118, 1, 1,
0.01043032, -0.3711261, 2.559526, 0, 0.9215686, 1, 1,
0.01174585, 1.053525, -0.6009232, 0, 0.9176471, 1, 1,
0.01428246, -0.2724396, 1.146636, 0, 0.9098039, 1, 1,
0.01645026, 0.08006587, 0.4327841, 0, 0.9058824, 1, 1,
0.01775727, 1.703883, 1.050318, 0, 0.8980392, 1, 1,
0.02127337, 0.4160836, -0.3569061, 0, 0.8901961, 1, 1,
0.03473164, 0.2979026, 1.53987, 0, 0.8862745, 1, 1,
0.03696425, 0.2131533, -0.7936608, 0, 0.8784314, 1, 1,
0.03826027, 1.309162, -1.314772, 0, 0.8745098, 1, 1,
0.043834, -1.022013, 4.809143, 0, 0.8666667, 1, 1,
0.04396185, 0.5607079, 0.2438822, 0, 0.8627451, 1, 1,
0.04557925, -1.763201, 2.013069, 0, 0.854902, 1, 1,
0.04934895, -0.3152198, 4.605099, 0, 0.8509804, 1, 1,
0.05097615, -1.723092, 1.735313, 0, 0.8431373, 1, 1,
0.05380115, 0.8411589, 0.1151715, 0, 0.8392157, 1, 1,
0.05388565, -0.03101037, 0.5559182, 0, 0.8313726, 1, 1,
0.05708648, -2.366553, 2.530575, 0, 0.827451, 1, 1,
0.05764384, 0.8862202, 0.9024977, 0, 0.8196079, 1, 1,
0.06751748, 0.213083, -0.7956586, 0, 0.8156863, 1, 1,
0.07043091, 0.7244388, -1.21716, 0, 0.8078431, 1, 1,
0.07190812, -1.412163, 5.106637, 0, 0.8039216, 1, 1,
0.07407197, 1.066556, -0.6433797, 0, 0.7960784, 1, 1,
0.07800775, -0.05721583, 1.391638, 0, 0.7882353, 1, 1,
0.07805496, -0.6039103, 2.2849, 0, 0.7843137, 1, 1,
0.08046631, -0.9810477, 1.97937, 0, 0.7764706, 1, 1,
0.08196407, -0.9574888, 4.473773, 0, 0.772549, 1, 1,
0.08428706, -1.75598, 2.074502, 0, 0.7647059, 1, 1,
0.08891902, -1.608613, 2.564054, 0, 0.7607843, 1, 1,
0.0919527, 1.729036, 1.935747, 0, 0.7529412, 1, 1,
0.09259278, 1.099338, 1.16295, 0, 0.7490196, 1, 1,
0.09369961, -0.4193637, 2.564045, 0, 0.7411765, 1, 1,
0.09535841, -1.655504, 5.52643, 0, 0.7372549, 1, 1,
0.09577109, 0.8063902, 1.156494, 0, 0.7294118, 1, 1,
0.09618202, 0.5693628, -0.6594885, 0, 0.7254902, 1, 1,
0.09644213, 1.067881, -0.628276, 0, 0.7176471, 1, 1,
0.1027439, 0.4217803, -0.3650841, 0, 0.7137255, 1, 1,
0.1085836, 0.03496741, -0.2658607, 0, 0.7058824, 1, 1,
0.108634, 0.5928487, 0.3961863, 0, 0.6980392, 1, 1,
0.1096987, -0.2270715, 1.598475, 0, 0.6941177, 1, 1,
0.1099462, 1.114506, -0.3931583, 0, 0.6862745, 1, 1,
0.1114278, 0.3944723, -0.3968912, 0, 0.682353, 1, 1,
0.1129646, -1.794668, 3.296343, 0, 0.6745098, 1, 1,
0.1143634, -0.009762763, 2.227764, 0, 0.6705883, 1, 1,
0.1161749, 1.663388, 1.046453, 0, 0.6627451, 1, 1,
0.1176326, -0.03595649, 2.770789, 0, 0.6588235, 1, 1,
0.1185362, 1.610784, -2.066532, 0, 0.6509804, 1, 1,
0.1203271, -0.8255115, 4.087758, 0, 0.6470588, 1, 1,
0.1217825, 1.167406, 1.528572, 0, 0.6392157, 1, 1,
0.1226873, 0.7112049, 2.153494, 0, 0.6352941, 1, 1,
0.1229228, 1.092609, 2.393255, 0, 0.627451, 1, 1,
0.1249951, 1.269978, 2.004306, 0, 0.6235294, 1, 1,
0.1345841, -0.006193607, 2.19144, 0, 0.6156863, 1, 1,
0.1404596, -1.446989, 2.726192, 0, 0.6117647, 1, 1,
0.1441253, 0.7896652, -0.06151295, 0, 0.6039216, 1, 1,
0.1445697, 0.9469965, -0.004163099, 0, 0.5960785, 1, 1,
0.1469713, 0.3699664, 0.1497866, 0, 0.5921569, 1, 1,
0.1470417, -1.141462, 3.266155, 0, 0.5843138, 1, 1,
0.1512014, -0.4699922, 4.453435, 0, 0.5803922, 1, 1,
0.1530357, -0.002624604, 2.623597, 0, 0.572549, 1, 1,
0.1573679, -0.678373, 1.955507, 0, 0.5686275, 1, 1,
0.1578519, -1.462093, 2.822788, 0, 0.5607843, 1, 1,
0.1609596, 0.5633212, 0.9680422, 0, 0.5568628, 1, 1,
0.1653767, 0.03373317, 2.047797, 0, 0.5490196, 1, 1,
0.1662894, 0.1471659, -0.3985633, 0, 0.5450981, 1, 1,
0.1664044, 1.156346, 1.86902, 0, 0.5372549, 1, 1,
0.1680431, 0.6804974, 0.4732236, 0, 0.5333334, 1, 1,
0.1702251, 0.996674, -0.713086, 0, 0.5254902, 1, 1,
0.171705, -0.1234735, 3.359016, 0, 0.5215687, 1, 1,
0.1742896, -0.7816796, 2.604382, 0, 0.5137255, 1, 1,
0.1744189, 1.079835, -0.9259181, 0, 0.509804, 1, 1,
0.1773394, -1.92161, 3.44335, 0, 0.5019608, 1, 1,
0.1775486, -1.473423, 2.736361, 0, 0.4941176, 1, 1,
0.1849225, 0.533132, -0.2106566, 0, 0.4901961, 1, 1,
0.1854666, -0.9014789, 1.937379, 0, 0.4823529, 1, 1,
0.1868671, -0.2718759, 3.651366, 0, 0.4784314, 1, 1,
0.1869076, -1.504654, 3.555248, 0, 0.4705882, 1, 1,
0.1875807, 0.1103268, 1.010785, 0, 0.4666667, 1, 1,
0.1893749, -0.1174094, 3.767277, 0, 0.4588235, 1, 1,
0.1903715, 1.45586, 0.6184299, 0, 0.454902, 1, 1,
0.196151, -3.006922, 2.998947, 0, 0.4470588, 1, 1,
0.196977, -1.458167, 3.399793, 0, 0.4431373, 1, 1,
0.1992418, 0.836351, -2.010102, 0, 0.4352941, 1, 1,
0.1996094, 0.2211371, -0.3262162, 0, 0.4313726, 1, 1,
0.2035855, 1.962878, -0.3958692, 0, 0.4235294, 1, 1,
0.2039083, -0.4554186, 2.49591, 0, 0.4196078, 1, 1,
0.2092835, 0.461916, -0.1349438, 0, 0.4117647, 1, 1,
0.2130199, -0.3623492, 3.123883, 0, 0.4078431, 1, 1,
0.2133799, 0.6024623, 2.754499, 0, 0.4, 1, 1,
0.2136645, 1.904826, -1.573379, 0, 0.3921569, 1, 1,
0.2180354, 0.7480866, -0.7060366, 0, 0.3882353, 1, 1,
0.2200505, 0.5538743, 2.137618, 0, 0.3803922, 1, 1,
0.2201941, 1.123334, 0.597904, 0, 0.3764706, 1, 1,
0.2203586, 0.8467707, 0.6036676, 0, 0.3686275, 1, 1,
0.2206712, 0.1867093, 0.4972875, 0, 0.3647059, 1, 1,
0.2212142, -0.3593437, 3.680905, 0, 0.3568628, 1, 1,
0.2218047, 1.088006, 1.26678, 0, 0.3529412, 1, 1,
0.2241887, 0.4760662, 0.9935908, 0, 0.345098, 1, 1,
0.2339874, 1.219398, 0.1409263, 0, 0.3411765, 1, 1,
0.2352273, -0.9370793, 2.339494, 0, 0.3333333, 1, 1,
0.2357332, -0.4677899, 3.308846, 0, 0.3294118, 1, 1,
0.2395158, 1.061912, 0.6893198, 0, 0.3215686, 1, 1,
0.2417858, -0.4555684, 4.14762, 0, 0.3176471, 1, 1,
0.2421814, -1.256301, 4.03025, 0, 0.3098039, 1, 1,
0.2429067, 1.419084, 0.5485557, 0, 0.3058824, 1, 1,
0.2464715, -1.670151, 4.558115, 0, 0.2980392, 1, 1,
0.2467305, -0.1723733, 1.669998, 0, 0.2901961, 1, 1,
0.2486989, -0.7074051, 2.38748, 0, 0.2862745, 1, 1,
0.2509013, -0.3193127, 3.057084, 0, 0.2784314, 1, 1,
0.2519739, 0.5875697, -0.7400928, 0, 0.2745098, 1, 1,
0.2523164, -0.1624403, 2.358116, 0, 0.2666667, 1, 1,
0.2536557, -0.2987493, 3.045688, 0, 0.2627451, 1, 1,
0.2550704, -0.2161536, 2.670562, 0, 0.254902, 1, 1,
0.2575249, -0.9772354, 2.392965, 0, 0.2509804, 1, 1,
0.2576011, 0.7759923, -0.1774225, 0, 0.2431373, 1, 1,
0.2611194, 0.007530274, 1.071896, 0, 0.2392157, 1, 1,
0.2706339, -0.7032194, 0.9626143, 0, 0.2313726, 1, 1,
0.2722903, 0.2285153, 2.724961, 0, 0.227451, 1, 1,
0.2728538, 0.9710233, 0.2041539, 0, 0.2196078, 1, 1,
0.2742977, 1.002697, 0.3884789, 0, 0.2156863, 1, 1,
0.2760467, 0.6969325, -0.7239259, 0, 0.2078431, 1, 1,
0.2765166, 0.2384034, 0.833025, 0, 0.2039216, 1, 1,
0.2800766, -0.8660557, 1.939371, 0, 0.1960784, 1, 1,
0.2836982, 0.2246373, 0.7496467, 0, 0.1882353, 1, 1,
0.2842312, 0.05017038, 1.964823, 0, 0.1843137, 1, 1,
0.2877551, 0.660482, -0.6565276, 0, 0.1764706, 1, 1,
0.2938446, 0.2854763, 0.9861093, 0, 0.172549, 1, 1,
0.2956298, 0.8128874, -0.1016679, 0, 0.1647059, 1, 1,
0.2958451, 0.4105084, -0.2222973, 0, 0.1607843, 1, 1,
0.2963316, -1.284815, 3.647214, 0, 0.1529412, 1, 1,
0.2998635, 0.7766994, 0.2947487, 0, 0.1490196, 1, 1,
0.3110297, -0.7116294, 3.37762, 0, 0.1411765, 1, 1,
0.3125308, -0.3836369, 2.166798, 0, 0.1372549, 1, 1,
0.3144969, 0.5982317, 1.911931, 0, 0.1294118, 1, 1,
0.3156014, 1.161956, 1.732069, 0, 0.1254902, 1, 1,
0.3206031, 0.7957382, -0.1610537, 0, 0.1176471, 1, 1,
0.32571, 1.222202, -0.3802835, 0, 0.1137255, 1, 1,
0.3331891, 1.241296, 0.7052187, 0, 0.1058824, 1, 1,
0.3347012, -0.9180217, 3.321389, 0, 0.09803922, 1, 1,
0.3360393, 0.4669285, 0.8468825, 0, 0.09411765, 1, 1,
0.3397081, -1.571474, 0.1552245, 0, 0.08627451, 1, 1,
0.3436234, -0.6489742, 1.422643, 0, 0.08235294, 1, 1,
0.3471441, 0.4794602, 0.5786385, 0, 0.07450981, 1, 1,
0.3478974, -0.8200876, 2.881584, 0, 0.07058824, 1, 1,
0.3538553, 0.6545735, 0.2186911, 0, 0.0627451, 1, 1,
0.3563367, -0.2076396, 0.7233933, 0, 0.05882353, 1, 1,
0.3608135, 0.3140265, 0.2360994, 0, 0.05098039, 1, 1,
0.3650548, 0.1601351, -0.3020807, 0, 0.04705882, 1, 1,
0.3659151, -0.2356628, 1.830579, 0, 0.03921569, 1, 1,
0.3671473, -0.3655967, 2.767025, 0, 0.03529412, 1, 1,
0.3701833, 0.7762256, 1.669313, 0, 0.02745098, 1, 1,
0.3707651, -2.184068, 1.937986, 0, 0.02352941, 1, 1,
0.3711224, 1.369812, -1.420685, 0, 0.01568628, 1, 1,
0.3792917, -1.355563, 3.391574, 0, 0.01176471, 1, 1,
0.380986, 1.956078, -0.5662754, 0, 0.003921569, 1, 1,
0.3880021, 0.6866358, 0.4922453, 0.003921569, 0, 1, 1,
0.3892489, -0.7142549, 3.376384, 0.007843138, 0, 1, 1,
0.392449, -0.9142757, 2.287246, 0.01568628, 0, 1, 1,
0.3957825, -0.3842288, 3.433543, 0.01960784, 0, 1, 1,
0.3971197, 2.028745, 0.3659571, 0.02745098, 0, 1, 1,
0.3977945, -1.473784, 3.333769, 0.03137255, 0, 1, 1,
0.398876, 1.48938, -0.3376205, 0.03921569, 0, 1, 1,
0.3992168, -0.6296707, 1.124819, 0.04313726, 0, 1, 1,
0.4062889, 0.2575331, 2.702016, 0.05098039, 0, 1, 1,
0.4067383, -1.560664, 4.139539, 0.05490196, 0, 1, 1,
0.4113809, -0.5653552, 2.617728, 0.0627451, 0, 1, 1,
0.4141847, -0.9468241, 3.099048, 0.06666667, 0, 1, 1,
0.4189796, -1.325279, 2.275392, 0.07450981, 0, 1, 1,
0.4190009, 0.08188784, 2.026035, 0.07843138, 0, 1, 1,
0.4245784, -2.750679, 2.324669, 0.08627451, 0, 1, 1,
0.4273331, 1.085524, 0.8213667, 0.09019608, 0, 1, 1,
0.4275988, -0.2072499, 1.767273, 0.09803922, 0, 1, 1,
0.4373359, -0.06109025, 0.4123616, 0.1058824, 0, 1, 1,
0.4422874, 0.1379861, 2.331293, 0.1098039, 0, 1, 1,
0.4448155, 0.86316, 1.13142, 0.1176471, 0, 1, 1,
0.4467284, 0.7038409, 0.3895831, 0.1215686, 0, 1, 1,
0.4520598, -1.048374, 3.815194, 0.1294118, 0, 1, 1,
0.4520949, 0.665292, 1.741068, 0.1333333, 0, 1, 1,
0.4528927, 0.750912, 0.4583755, 0.1411765, 0, 1, 1,
0.4550409, -0.6030694, 2.744868, 0.145098, 0, 1, 1,
0.4568323, -0.7329141, 4.302329, 0.1529412, 0, 1, 1,
0.4609106, -0.7477103, 3.652607, 0.1568628, 0, 1, 1,
0.4651769, -0.8528807, 4.641645, 0.1647059, 0, 1, 1,
0.4659655, 0.5324061, 0.9978826, 0.1686275, 0, 1, 1,
0.4690909, 1.043882, -0.7637865, 0.1764706, 0, 1, 1,
0.4727286, -0.4057553, 1.94292, 0.1803922, 0, 1, 1,
0.4737887, -1.111728, 1.298761, 0.1882353, 0, 1, 1,
0.4760224, -1.091925, 3.143571, 0.1921569, 0, 1, 1,
0.4776411, -0.4124349, 2.795199, 0.2, 0, 1, 1,
0.4780139, -0.7524993, 2.710372, 0.2078431, 0, 1, 1,
0.4830789, -0.2674831, 3.078577, 0.2117647, 0, 1, 1,
0.4865771, -1.777068, 3.628355, 0.2196078, 0, 1, 1,
0.4874297, -0.01285208, 3.18823, 0.2235294, 0, 1, 1,
0.4886877, 1.502884, 1.173414, 0.2313726, 0, 1, 1,
0.4932025, -0.2497864, 2.700875, 0.2352941, 0, 1, 1,
0.5039282, 0.1062791, 1.179758, 0.2431373, 0, 1, 1,
0.5051538, 1.983138, -0.02643227, 0.2470588, 0, 1, 1,
0.5067133, -0.3584075, 1.831922, 0.254902, 0, 1, 1,
0.5097473, 2.402575, 0.05809769, 0.2588235, 0, 1, 1,
0.5101326, 1.686539, -0.7224675, 0.2666667, 0, 1, 1,
0.5111448, 1.764217, 0.9872108, 0.2705882, 0, 1, 1,
0.5191681, 0.7463443, 1.274748, 0.2784314, 0, 1, 1,
0.5222572, 0.2132385, 2.484062, 0.282353, 0, 1, 1,
0.5229897, -0.3000815, 5.05164, 0.2901961, 0, 1, 1,
0.5262149, -0.271912, 1.740662, 0.2941177, 0, 1, 1,
0.5277506, -1.780941, 2.849528, 0.3019608, 0, 1, 1,
0.5345581, -1.232635, 3.832656, 0.3098039, 0, 1, 1,
0.5385711, 1.854837, -0.179895, 0.3137255, 0, 1, 1,
0.5410232, 1.0567, -0.3373926, 0.3215686, 0, 1, 1,
0.5441517, -0.523792, 1.875944, 0.3254902, 0, 1, 1,
0.5452672, -0.04638176, 3.307893, 0.3333333, 0, 1, 1,
0.5483906, 1.211813, 0.319008, 0.3372549, 0, 1, 1,
0.5511726, 0.2072563, -0.7983344, 0.345098, 0, 1, 1,
0.5515075, -0.6134146, 3.859822, 0.3490196, 0, 1, 1,
0.5605314, -2.817553, 3.140733, 0.3568628, 0, 1, 1,
0.561197, 0.1376223, 0.5329991, 0.3607843, 0, 1, 1,
0.5677804, -0.2139164, 4.0536, 0.3686275, 0, 1, 1,
0.5707183, -1.670963, 5.397792, 0.372549, 0, 1, 1,
0.5713873, 0.4757836, -0.765202, 0.3803922, 0, 1, 1,
0.5718451, -0.1670716, 2.428545, 0.3843137, 0, 1, 1,
0.5791625, 0.9684141, 0.6265169, 0.3921569, 0, 1, 1,
0.5870947, -3.024111, 4.178449, 0.3960784, 0, 1, 1,
0.5909412, -0.498351, 2.555038, 0.4039216, 0, 1, 1,
0.5918662, 0.9630593, 0.1240586, 0.4117647, 0, 1, 1,
0.5946842, -0.4655258, 2.775115, 0.4156863, 0, 1, 1,
0.5992933, -0.8658637, 1.331417, 0.4235294, 0, 1, 1,
0.601408, 0.09719007, 2.492542, 0.427451, 0, 1, 1,
0.6028912, -1.029959, 2.319146, 0.4352941, 0, 1, 1,
0.6105938, -0.4651116, 3.145222, 0.4392157, 0, 1, 1,
0.6158339, -0.3859283, 1.506577, 0.4470588, 0, 1, 1,
0.6269799, -1.277001, 1.498921, 0.4509804, 0, 1, 1,
0.6281605, -0.248542, 1.937157, 0.4588235, 0, 1, 1,
0.630773, -1.805239, 3.929674, 0.4627451, 0, 1, 1,
0.6335354, -0.4042982, 3.204179, 0.4705882, 0, 1, 1,
0.6366929, 1.115349, -0.6881672, 0.4745098, 0, 1, 1,
0.6412307, 0.7600145, -0.5343285, 0.4823529, 0, 1, 1,
0.6468782, 0.4840672, 2.377435, 0.4862745, 0, 1, 1,
0.6482289, -1.07064, 3.22168, 0.4941176, 0, 1, 1,
0.6532038, -0.4700896, 1.887907, 0.5019608, 0, 1, 1,
0.6557897, 0.4636889, 1.379476, 0.5058824, 0, 1, 1,
0.6562617, 0.09012447, 1.46445, 0.5137255, 0, 1, 1,
0.6564676, -0.9013896, 2.199981, 0.5176471, 0, 1, 1,
0.6630671, -0.9257422, 1.946014, 0.5254902, 0, 1, 1,
0.669356, 0.2856853, 0.218736, 0.5294118, 0, 1, 1,
0.6698365, -0.4403244, 3.508307, 0.5372549, 0, 1, 1,
0.6704185, -0.0413067, 0.6663446, 0.5411765, 0, 1, 1,
0.6781311, 0.3009745, 1.277956, 0.5490196, 0, 1, 1,
0.6801456, 1.518402, 0.6465858, 0.5529412, 0, 1, 1,
0.6824876, 0.612967, 2.487753, 0.5607843, 0, 1, 1,
0.6830317, 0.7357435, 2.151051, 0.5647059, 0, 1, 1,
0.6853492, -0.7151026, 2.755357, 0.572549, 0, 1, 1,
0.6866857, 0.1400658, 0.6997024, 0.5764706, 0, 1, 1,
0.6921555, 2.661838, 0.8673762, 0.5843138, 0, 1, 1,
0.6962183, -0.637217, 2.611749, 0.5882353, 0, 1, 1,
0.7026669, -0.8912475, 4.380747, 0.5960785, 0, 1, 1,
0.7075236, 0.114302, 2.247524, 0.6039216, 0, 1, 1,
0.7103767, -0.03430323, 1.717154, 0.6078432, 0, 1, 1,
0.7130532, -2.028985, 3.206158, 0.6156863, 0, 1, 1,
0.722795, -0.2265015, 3.588877, 0.6196079, 0, 1, 1,
0.7228678, -0.7482865, 3.136556, 0.627451, 0, 1, 1,
0.7230806, 2.049625, 0.7841951, 0.6313726, 0, 1, 1,
0.7283385, -0.01322942, 1.288848, 0.6392157, 0, 1, 1,
0.7363046, -0.4193225, 3.299693, 0.6431373, 0, 1, 1,
0.7369807, 0.8259777, 0.1419669, 0.6509804, 0, 1, 1,
0.7438931, 0.7776549, -0.1707377, 0.654902, 0, 1, 1,
0.7445402, -1.114443, 2.675168, 0.6627451, 0, 1, 1,
0.746951, -0.4842496, 1.836636, 0.6666667, 0, 1, 1,
0.7528859, 2.252093, 1.291926, 0.6745098, 0, 1, 1,
0.7553718, -0.3244592, 0.7349332, 0.6784314, 0, 1, 1,
0.7606654, -0.1207753, 2.093905, 0.6862745, 0, 1, 1,
0.7623127, -0.5660376, 3.354376, 0.6901961, 0, 1, 1,
0.7635219, 1.015164, 0.3764656, 0.6980392, 0, 1, 1,
0.7757983, 0.8514039, 1.134126, 0.7058824, 0, 1, 1,
0.7818398, 0.01478933, 2.870623, 0.7098039, 0, 1, 1,
0.7846531, 1.3131, -0.2823078, 0.7176471, 0, 1, 1,
0.7936288, -1.493691, 1.341971, 0.7215686, 0, 1, 1,
0.7961504, 0.3183321, 2.644637, 0.7294118, 0, 1, 1,
0.7973806, 0.6335429, 0.9284581, 0.7333333, 0, 1, 1,
0.8017561, -1.0888, 1.507195, 0.7411765, 0, 1, 1,
0.8027973, 0.8723457, -0.3157244, 0.7450981, 0, 1, 1,
0.8038683, 0.6023139, 0.5294443, 0.7529412, 0, 1, 1,
0.8081113, 0.08416095, 0.6551141, 0.7568628, 0, 1, 1,
0.8085856, 0.7721696, 0.8996406, 0.7647059, 0, 1, 1,
0.808753, 0.3168164, 1.409813, 0.7686275, 0, 1, 1,
0.8091596, -0.6041902, 2.196287, 0.7764706, 0, 1, 1,
0.8137327, -0.6777694, 3.528698, 0.7803922, 0, 1, 1,
0.8143849, -0.6341622, 2.866018, 0.7882353, 0, 1, 1,
0.8223665, 0.9854206, 0.7384491, 0.7921569, 0, 1, 1,
0.8263112, 1.316439, 2.099491, 0.8, 0, 1, 1,
0.8275059, 0.6322088, 0.8127361, 0.8078431, 0, 1, 1,
0.8281126, -1.924057, 3.879884, 0.8117647, 0, 1, 1,
0.8316675, -1.613426, 2.866637, 0.8196079, 0, 1, 1,
0.8375008, -0.1865792, 5.04967, 0.8235294, 0, 1, 1,
0.8391365, 0.2100625, 2.317888, 0.8313726, 0, 1, 1,
0.8439042, 1.278267, 1.089832, 0.8352941, 0, 1, 1,
0.8516744, 2.619912, 0.1138324, 0.8431373, 0, 1, 1,
0.8530437, 0.2922711, -0.3417002, 0.8470588, 0, 1, 1,
0.8629754, 1.288809, 0.9112188, 0.854902, 0, 1, 1,
0.8651081, 1.951708, -0.5038909, 0.8588235, 0, 1, 1,
0.8728991, 1.091947, 1.235472, 0.8666667, 0, 1, 1,
0.8734041, -0.8205898, 2.81946, 0.8705882, 0, 1, 1,
0.877035, 0.2194691, 1.912204, 0.8784314, 0, 1, 1,
0.8823442, 1.45682, 0.5216808, 0.8823529, 0, 1, 1,
0.8829958, 1.22343, -0.0830281, 0.8901961, 0, 1, 1,
0.8927026, -0.8122952, 4.090436, 0.8941177, 0, 1, 1,
0.8937679, 1.244807, 0.4324189, 0.9019608, 0, 1, 1,
0.8958443, -0.001436006, 2.271441, 0.9098039, 0, 1, 1,
0.8968864, 0.441386, 3.504732, 0.9137255, 0, 1, 1,
0.8969423, -0.005425296, -0.1169606, 0.9215686, 0, 1, 1,
0.8973006, -0.9238721, 2.283836, 0.9254902, 0, 1, 1,
0.9035143, -0.5192829, 2.404373, 0.9333333, 0, 1, 1,
0.9041228, -0.1105617, 0.4158384, 0.9372549, 0, 1, 1,
0.9080658, 0.7788056, -0.07629509, 0.945098, 0, 1, 1,
0.9084691, -0.084424, 3.47109, 0.9490196, 0, 1, 1,
0.9104084, 0.3959887, 0.3196647, 0.9568627, 0, 1, 1,
0.9262646, -0.5944936, 3.324248, 0.9607843, 0, 1, 1,
0.9322456, 0.9651003, 2.14204, 0.9686275, 0, 1, 1,
0.9337704, -1.177279, 2.369972, 0.972549, 0, 1, 1,
0.9343498, 0.4859924, 2.503783, 0.9803922, 0, 1, 1,
0.9344561, -0.1210984, 1.574363, 0.9843137, 0, 1, 1,
0.9348239, -0.2246802, 1.50075, 0.9921569, 0, 1, 1,
0.9359104, -0.04951946, 2.275679, 0.9960784, 0, 1, 1,
0.9420234, -2.022717, 3.13957, 1, 0, 0.9960784, 1,
0.9439824, 0.5106072, 1.456274, 1, 0, 0.9882353, 1,
0.9479159, -0.447796, 3.583468, 1, 0, 0.9843137, 1,
0.9497287, -2.746625, 3.052705, 1, 0, 0.9764706, 1,
0.9544743, -0.705006, 1.588728, 1, 0, 0.972549, 1,
0.9567499, 1.904674, 0.5768176, 1, 0, 0.9647059, 1,
0.9608114, 0.743363, 2.512598, 1, 0, 0.9607843, 1,
0.9638604, 1.269291, 0.9807894, 1, 0, 0.9529412, 1,
0.9656839, -0.8232587, 2.256545, 1, 0, 0.9490196, 1,
0.9790664, 0.1320682, 0.831684, 1, 0, 0.9411765, 1,
0.9793561, -0.889809, 2.611503, 1, 0, 0.9372549, 1,
0.9916355, -0.5441393, 0.3151295, 1, 0, 0.9294118, 1,
0.9957076, 0.05134391, 0.6749282, 1, 0, 0.9254902, 1,
0.9998112, 0.1522858, 2.012564, 1, 0, 0.9176471, 1,
0.9999179, -0.8752664, 2.538647, 1, 0, 0.9137255, 1,
1.004971, -2.892602, 2.799973, 1, 0, 0.9058824, 1,
1.009798, -1.411253, 1.48429, 1, 0, 0.9019608, 1,
1.013647, -0.9643935, 4.823889, 1, 0, 0.8941177, 1,
1.015191, -0.9831131, 3.480685, 1, 0, 0.8862745, 1,
1.022896, -1.3442, 2.384573, 1, 0, 0.8823529, 1,
1.025567, 1.609585, -0.2435198, 1, 0, 0.8745098, 1,
1.038185, 0.7378443, 0.5458007, 1, 0, 0.8705882, 1,
1.03911, -0.02348796, 1.199578, 1, 0, 0.8627451, 1,
1.055842, 0.3286256, 0.7688103, 1, 0, 0.8588235, 1,
1.057898, 0.9716561, 1.663751, 1, 0, 0.8509804, 1,
1.065338, -0.01095712, 1.395478, 1, 0, 0.8470588, 1,
1.07805, -0.8268918, 0.8924672, 1, 0, 0.8392157, 1,
1.080509, 0.4225093, -0.3329161, 1, 0, 0.8352941, 1,
1.089972, -0.670677, 0.776583, 1, 0, 0.827451, 1,
1.0983, -1.902122, 2.05999, 1, 0, 0.8235294, 1,
1.110704, -0.0920627, 1.939028, 1, 0, 0.8156863, 1,
1.115852, 0.8388908, 1.919942, 1, 0, 0.8117647, 1,
1.115901, 0.4297641, 1.27491, 1, 0, 0.8039216, 1,
1.131527, 0.03218132, 2.882104, 1, 0, 0.7960784, 1,
1.131569, -0.4900387, 0.8201395, 1, 0, 0.7921569, 1,
1.133155, -2.099524, 1.246293, 1, 0, 0.7843137, 1,
1.133791, -1.155046, 2.233806, 1, 0, 0.7803922, 1,
1.135106, 0.3015682, 1.273849, 1, 0, 0.772549, 1,
1.140882, -2.512535, 4.769316, 1, 0, 0.7686275, 1,
1.141579, -0.5988088, 2.578732, 1, 0, 0.7607843, 1,
1.14491, 0.6363038, 2.208429, 1, 0, 0.7568628, 1,
1.150071, 0.9277283, 1.13175, 1, 0, 0.7490196, 1,
1.152692, 1.120864, 1.673706, 1, 0, 0.7450981, 1,
1.158546, -1.307566, 2.510361, 1, 0, 0.7372549, 1,
1.169223, 0.1641955, 1.649342, 1, 0, 0.7333333, 1,
1.173349, 0.4558959, 1.025755, 1, 0, 0.7254902, 1,
1.178826, 0.6460097, 0.9657178, 1, 0, 0.7215686, 1,
1.179079, 0.1871852, 3.511342, 1, 0, 0.7137255, 1,
1.19343, -0.2629704, 1.44765, 1, 0, 0.7098039, 1,
1.195295, -2.39979, 1.791479, 1, 0, 0.7019608, 1,
1.197553, 1.612782, 0.004488739, 1, 0, 0.6941177, 1,
1.206701, -0.3745913, 1.998263, 1, 0, 0.6901961, 1,
1.207845, 0.003246152, 2.282837, 1, 0, 0.682353, 1,
1.218828, -0.07348697, 1.022103, 1, 0, 0.6784314, 1,
1.220799, -1.825024, 1.65755, 1, 0, 0.6705883, 1,
1.220863, -1.369004, 0.9175242, 1, 0, 0.6666667, 1,
1.221919, 1.992633, 2.207747, 1, 0, 0.6588235, 1,
1.223457, -0.575009, 3.451598, 1, 0, 0.654902, 1,
1.237864, -1.367939, 1.363648, 1, 0, 0.6470588, 1,
1.245066, 2.213578, -0.6906478, 1, 0, 0.6431373, 1,
1.258967, 0.5846983, 0.9857473, 1, 0, 0.6352941, 1,
1.269411, -0.6339217, 2.11555, 1, 0, 0.6313726, 1,
1.285853, -1.500498, 2.369658, 1, 0, 0.6235294, 1,
1.286743, 0.4749095, 0.1009661, 1, 0, 0.6196079, 1,
1.288408, -0.3372264, 0.6778176, 1, 0, 0.6117647, 1,
1.294745, -1.360454, 1.63478, 1, 0, 0.6078432, 1,
1.298973, 0.5594616, 2.170521, 1, 0, 0.6, 1,
1.305413, 0.8875933, 1.333466, 1, 0, 0.5921569, 1,
1.315733, -1.529432, 0.9008099, 1, 0, 0.5882353, 1,
1.319387, -0.05813025, 1.596924, 1, 0, 0.5803922, 1,
1.330037, 0.9727063, -0.491217, 1, 0, 0.5764706, 1,
1.338588, 0.1470734, 0.000177549, 1, 0, 0.5686275, 1,
1.344247, -0.6589771, 2.071402, 1, 0, 0.5647059, 1,
1.349576, 0.3252448, 3.102312, 1, 0, 0.5568628, 1,
1.35011, -0.4188626, 1.083615, 1, 0, 0.5529412, 1,
1.350748, -0.7612985, 3.624759, 1, 0, 0.5450981, 1,
1.357567, 0.4190668, 0.01854067, 1, 0, 0.5411765, 1,
1.364144, 0.08236338, 1.494238, 1, 0, 0.5333334, 1,
1.373197, -1.081273, 1.739627, 1, 0, 0.5294118, 1,
1.375036, 1.056974, 0.7632558, 1, 0, 0.5215687, 1,
1.389182, -0.6591002, 1.763513, 1, 0, 0.5176471, 1,
1.401767, 0.7855911, 0.5469698, 1, 0, 0.509804, 1,
1.403207, -0.1402752, 0.5482687, 1, 0, 0.5058824, 1,
1.416906, 1.11976, 0.6827115, 1, 0, 0.4980392, 1,
1.424939, -1.679576, 4.371935, 1, 0, 0.4901961, 1,
1.426387, 0.6792238, 0.9619471, 1, 0, 0.4862745, 1,
1.432707, 0.253362, 1.422931, 1, 0, 0.4784314, 1,
1.439621, -0.453537, 0.5242199, 1, 0, 0.4745098, 1,
1.439724, 0.04129404, 1.939187, 1, 0, 0.4666667, 1,
1.443421, -0.8736095, 1.391506, 1, 0, 0.4627451, 1,
1.446113, 1.120157, 2.708911, 1, 0, 0.454902, 1,
1.453881, -0.5159637, 3.40852, 1, 0, 0.4509804, 1,
1.459345, 1.23558, -1.214199, 1, 0, 0.4431373, 1,
1.467036, 0.319148, -1.082453, 1, 0, 0.4392157, 1,
1.469857, 0.264121, 1.537406, 1, 0, 0.4313726, 1,
1.470548, -0.1595773, 0.6739988, 1, 0, 0.427451, 1,
1.478315, 0.04462136, 0.8421311, 1, 0, 0.4196078, 1,
1.495178, 0.5528164, 1.916717, 1, 0, 0.4156863, 1,
1.498914, 0.3256464, -0.01789274, 1, 0, 0.4078431, 1,
1.516938, 0.7841194, 0.9890169, 1, 0, 0.4039216, 1,
1.518014, -1.039126, 2.231249, 1, 0, 0.3960784, 1,
1.522947, 0.2745893, -0.3804125, 1, 0, 0.3882353, 1,
1.542949, 0.4677764, -0.6688063, 1, 0, 0.3843137, 1,
1.549229, -0.0134085, 1.080819, 1, 0, 0.3764706, 1,
1.566849, -0.1451235, 1.023404, 1, 0, 0.372549, 1,
1.568414, -0.04605346, 1.293745, 1, 0, 0.3647059, 1,
1.611851, 0.7813904, 0.8600428, 1, 0, 0.3607843, 1,
1.613999, -1.131551, 1.286263, 1, 0, 0.3529412, 1,
1.615412, 1.076149, 1.544029, 1, 0, 0.3490196, 1,
1.624014, 0.03535739, 0.9580526, 1, 0, 0.3411765, 1,
1.646621, 1.194126, 1.48717, 1, 0, 0.3372549, 1,
1.658818, 2.429059, 1.940264, 1, 0, 0.3294118, 1,
1.663895, 0.4514376, 0.7827846, 1, 0, 0.3254902, 1,
1.664435, -0.9762065, 1.462117, 1, 0, 0.3176471, 1,
1.665129, 1.578718, 1.842963, 1, 0, 0.3137255, 1,
1.668512, -3.021812, 1.576359, 1, 0, 0.3058824, 1,
1.669319, -2.450226, 2.537797, 1, 0, 0.2980392, 1,
1.677501, -1.751582, 2.144424, 1, 0, 0.2941177, 1,
1.686687, -2.099869, 3.710586, 1, 0, 0.2862745, 1,
1.699737, -0.3364563, 2.946191, 1, 0, 0.282353, 1,
1.703607, -0.4622457, 2.433442, 1, 0, 0.2745098, 1,
1.706219, -1.067825, 2.742835, 1, 0, 0.2705882, 1,
1.720495, -1.917101, 2.613502, 1, 0, 0.2627451, 1,
1.726266, -0.2765397, 3.298426, 1, 0, 0.2588235, 1,
1.766733, 0.416796, 2.447587, 1, 0, 0.2509804, 1,
1.778049, 0.04405139, 0.4126539, 1, 0, 0.2470588, 1,
1.798385, 0.2431283, 0.9284229, 1, 0, 0.2392157, 1,
1.805259, 1.217052, 2.897102, 1, 0, 0.2352941, 1,
1.812308, 0.6335459, 1.613201, 1, 0, 0.227451, 1,
1.816823, -0.7617477, 0.08969261, 1, 0, 0.2235294, 1,
1.818015, 0.4014558, 0.9769195, 1, 0, 0.2156863, 1,
1.830428, 0.311088, 2.903533, 1, 0, 0.2117647, 1,
1.840594, -1.822752, 2.295624, 1, 0, 0.2039216, 1,
1.905744, -0.4986394, 2.07595, 1, 0, 0.1960784, 1,
1.91183, -1.85831, 0.5691152, 1, 0, 0.1921569, 1,
1.943647, -0.4461221, 3.081059, 1, 0, 0.1843137, 1,
1.964187, -0.3851781, 2.536621, 1, 0, 0.1803922, 1,
1.971245, 1.295138, 2.745413, 1, 0, 0.172549, 1,
2.004144, 0.9947332, 0.2761656, 1, 0, 0.1686275, 1,
2.039122, -0.02729985, 2.181174, 1, 0, 0.1607843, 1,
2.085022, 1.451981, -0.6090435, 1, 0, 0.1568628, 1,
2.101456, -0.7707474, 0.9022452, 1, 0, 0.1490196, 1,
2.136027, 0.6924189, -0.3391635, 1, 0, 0.145098, 1,
2.208081, 0.6701509, 0.7760453, 1, 0, 0.1372549, 1,
2.209963, 0.1166128, 1.719571, 1, 0, 0.1333333, 1,
2.221091, 0.4201535, 1.668969, 1, 0, 0.1254902, 1,
2.23709, 1.520001, -0.5219921, 1, 0, 0.1215686, 1,
2.256989, -0.6058628, 0.8385696, 1, 0, 0.1137255, 1,
2.281461, -1.114534, 2.995889, 1, 0, 0.1098039, 1,
2.300345, 0.2953191, 2.774031, 1, 0, 0.1019608, 1,
2.312777, 0.2595187, -0.4566219, 1, 0, 0.09411765, 1,
2.38966, 0.1308368, 1.133797, 1, 0, 0.09019608, 1,
2.425328, 0.1906698, 4.691772, 1, 0, 0.08235294, 1,
2.489496, -0.2105186, 3.05373, 1, 0, 0.07843138, 1,
2.491499, -1.327534, 1.979884, 1, 0, 0.07058824, 1,
2.546909, 0.8730388, 0.6155096, 1, 0, 0.06666667, 1,
2.554929, 0.5009114, -0.4264627, 1, 0, 0.05882353, 1,
2.61777, 0.9982303, 0.476712, 1, 0, 0.05490196, 1,
2.733375, -2.174502, 1.390482, 1, 0, 0.04705882, 1,
2.764219, -0.869912, 2.491301, 1, 0, 0.04313726, 1,
2.908299, 0.7111726, 1.213921, 1, 0, 0.03529412, 1,
2.911518, 1.062002, 0.9129621, 1, 0, 0.03137255, 1,
2.993494, 0.1571532, 1.911846, 1, 0, 0.02352941, 1,
3.240461, -1.227749, 4.091412, 1, 0, 0.01960784, 1,
3.32045, 0.3994831, 1.012357, 1, 0, 0.01176471, 1,
3.517063, 0.2220087, 1.471703, 1, 0, 0.007843138, 1
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
-0.08897185, -4.057689, -7.02319, 0, -0.5, 0.5, 0.5,
-0.08897185, -4.057689, -7.02319, 1, -0.5, 0.5, 0.5,
-0.08897185, -4.057689, -7.02319, 1, 1.5, 0.5, 0.5,
-0.08897185, -4.057689, -7.02319, 0, 1.5, 0.5, 0.5
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
-4.917453, 0.02479351, -7.02319, 0, -0.5, 0.5, 0.5,
-4.917453, 0.02479351, -7.02319, 1, -0.5, 0.5, 0.5,
-4.917453, 0.02479351, -7.02319, 1, 1.5, 0.5, 0.5,
-4.917453, 0.02479351, -7.02319, 0, 1.5, 0.5, 0.5
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
-4.917453, -4.057689, 0.1610513, 0, -0.5, 0.5, 0.5,
-4.917453, -4.057689, 0.1610513, 1, -0.5, 0.5, 0.5,
-4.917453, -4.057689, 0.1610513, 1, 1.5, 0.5, 0.5,
-4.917453, -4.057689, 0.1610513, 0, 1.5, 0.5, 0.5
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
-2, -3.115578, -5.365288,
2, -3.115578, -5.365288,
-2, -3.115578, -5.365288,
-2, -3.272597, -5.641605,
0, -3.115578, -5.365288,
0, -3.272597, -5.641605,
2, -3.115578, -5.365288,
2, -3.272597, -5.641605
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
"0",
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
-2, -3.586634, -6.19424, 0, -0.5, 0.5, 0.5,
-2, -3.586634, -6.19424, 1, -0.5, 0.5, 0.5,
-2, -3.586634, -6.19424, 1, 1.5, 0.5, 0.5,
-2, -3.586634, -6.19424, 0, 1.5, 0.5, 0.5,
0, -3.586634, -6.19424, 0, -0.5, 0.5, 0.5,
0, -3.586634, -6.19424, 1, -0.5, 0.5, 0.5,
0, -3.586634, -6.19424, 1, 1.5, 0.5, 0.5,
0, -3.586634, -6.19424, 0, 1.5, 0.5, 0.5,
2, -3.586634, -6.19424, 0, -0.5, 0.5, 0.5,
2, -3.586634, -6.19424, 1, -0.5, 0.5, 0.5,
2, -3.586634, -6.19424, 1, 1.5, 0.5, 0.5,
2, -3.586634, -6.19424, 0, 1.5, 0.5, 0.5
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
-3.803188, -3, -5.365288,
-3.803188, 3, -5.365288,
-3.803188, -3, -5.365288,
-3.988899, -3, -5.641605,
-3.803188, -2, -5.365288,
-3.988899, -2, -5.641605,
-3.803188, -1, -5.365288,
-3.988899, -1, -5.641605,
-3.803188, 0, -5.365288,
-3.988899, 0, -5.641605,
-3.803188, 1, -5.365288,
-3.988899, 1, -5.641605,
-3.803188, 2, -5.365288,
-3.988899, 2, -5.641605,
-3.803188, 3, -5.365288,
-3.988899, 3, -5.641605
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
-4.36032, -3, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, -3, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, -3, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, -3, -6.19424, 0, 1.5, 0.5, 0.5,
-4.36032, -2, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, -2, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, -2, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, -2, -6.19424, 0, 1.5, 0.5, 0.5,
-4.36032, -1, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, -1, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, -1, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, -1, -6.19424, 0, 1.5, 0.5, 0.5,
-4.36032, 0, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, 0, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, 0, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, 0, -6.19424, 0, 1.5, 0.5, 0.5,
-4.36032, 1, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, 1, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, 1, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, 1, -6.19424, 0, 1.5, 0.5, 0.5,
-4.36032, 2, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, 2, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, 2, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, 2, -6.19424, 0, 1.5, 0.5, 0.5,
-4.36032, 3, -6.19424, 0, -0.5, 0.5, 0.5,
-4.36032, 3, -6.19424, 1, -0.5, 0.5, 0.5,
-4.36032, 3, -6.19424, 1, 1.5, 0.5, 0.5,
-4.36032, 3, -6.19424, 0, 1.5, 0.5, 0.5
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
-3.803188, -3.115578, -4,
-3.803188, -3.115578, 4,
-3.803188, -3.115578, -4,
-3.988899, -3.272597, -4,
-3.803188, -3.115578, -2,
-3.988899, -3.272597, -2,
-3.803188, -3.115578, 0,
-3.988899, -3.272597, 0,
-3.803188, -3.115578, 2,
-3.988899, -3.272597, 2,
-3.803188, -3.115578, 4,
-3.988899, -3.272597, 4
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
-4.36032, -3.586634, -4, 0, -0.5, 0.5, 0.5,
-4.36032, -3.586634, -4, 1, -0.5, 0.5, 0.5,
-4.36032, -3.586634, -4, 1, 1.5, 0.5, 0.5,
-4.36032, -3.586634, -4, 0, 1.5, 0.5, 0.5,
-4.36032, -3.586634, -2, 0, -0.5, 0.5, 0.5,
-4.36032, -3.586634, -2, 1, -0.5, 0.5, 0.5,
-4.36032, -3.586634, -2, 1, 1.5, 0.5, 0.5,
-4.36032, -3.586634, -2, 0, 1.5, 0.5, 0.5,
-4.36032, -3.586634, 0, 0, -0.5, 0.5, 0.5,
-4.36032, -3.586634, 0, 1, -0.5, 0.5, 0.5,
-4.36032, -3.586634, 0, 1, 1.5, 0.5, 0.5,
-4.36032, -3.586634, 0, 0, 1.5, 0.5, 0.5,
-4.36032, -3.586634, 2, 0, -0.5, 0.5, 0.5,
-4.36032, -3.586634, 2, 1, -0.5, 0.5, 0.5,
-4.36032, -3.586634, 2, 1, 1.5, 0.5, 0.5,
-4.36032, -3.586634, 2, 0, 1.5, 0.5, 0.5,
-4.36032, -3.586634, 4, 0, -0.5, 0.5, 0.5,
-4.36032, -3.586634, 4, 1, -0.5, 0.5, 0.5,
-4.36032, -3.586634, 4, 1, 1.5, 0.5, 0.5,
-4.36032, -3.586634, 4, 0, 1.5, 0.5, 0.5
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
-3.803188, -3.115578, -5.365288,
-3.803188, 3.165165, -5.365288,
-3.803188, -3.115578, 5.687391,
-3.803188, 3.165165, 5.687391,
-3.803188, -3.115578, -5.365288,
-3.803188, -3.115578, 5.687391,
-3.803188, 3.165165, -5.365288,
-3.803188, 3.165165, 5.687391,
-3.803188, -3.115578, -5.365288,
3.625244, -3.115578, -5.365288,
-3.803188, -3.115578, 5.687391,
3.625244, -3.115578, 5.687391,
-3.803188, 3.165165, -5.365288,
3.625244, 3.165165, -5.365288,
-3.803188, 3.165165, 5.687391,
3.625244, 3.165165, 5.687391,
3.625244, -3.115578, -5.365288,
3.625244, 3.165165, -5.365288,
3.625244, -3.115578, 5.687391,
3.625244, 3.165165, 5.687391,
3.625244, -3.115578, -5.365288,
3.625244, -3.115578, 5.687391,
3.625244, 3.165165, -5.365288,
3.625244, 3.165165, 5.687391
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
var radius = 7.862237;
var distance = 34.97998;
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
mvMatrix.translate( 0.08897185, -0.02479351, -0.1610513 );
mvMatrix.scale( 1.144361, 1.353471, 0.7691171 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97998);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ipconazole<-read.table("ipconazole.xyz")
```

```
## Error in read.table("ipconazole.xyz"): no lines available in input
```

```r
x<-ipconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'ipconazole' not found
```

```r
y<-ipconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'ipconazole' not found
```

```r
z<-ipconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'ipconazole' not found
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
-3.695007, -0.1747093, -2.480185, 0, 0, 1, 1, 1,
-3.174882, 0.3454097, -2.095899, 1, 0, 0, 1, 1,
-3.112127, 0.3352221, 0.006291582, 1, 0, 0, 1, 1,
-2.779866, -0.500829, -1.508098, 1, 0, 0, 1, 1,
-2.538234, 0.5527251, 1.699715, 1, 0, 0, 1, 1,
-2.510602, 0.7319701, -1.377453, 1, 0, 0, 1, 1,
-2.411235, 0.2862036, -3.155518, 0, 0, 0, 1, 1,
-2.374136, 1.568379, -2.009104, 0, 0, 0, 1, 1,
-2.366721, -0.2505315, -0.8717021, 0, 0, 0, 1, 1,
-2.358568, -1.0197, -0.7476768, 0, 0, 0, 1, 1,
-2.335122, -0.921096, -2.407913, 0, 0, 0, 1, 1,
-2.301688, -1.162971, -1.023566, 0, 0, 0, 1, 1,
-2.289615, 0.250179, -1.227214, 0, 0, 0, 1, 1,
-2.286935, 1.250497, -1.304881, 1, 1, 1, 1, 1,
-2.266279, -0.5030844, -2.090852, 1, 1, 1, 1, 1,
-2.26623, -0.7850299, -2.965946, 1, 1, 1, 1, 1,
-2.220157, 0.006586701, -2.465762, 1, 1, 1, 1, 1,
-2.194085, 1.482773, -2.308061, 1, 1, 1, 1, 1,
-2.176507, -0.9693622, -1.113309, 1, 1, 1, 1, 1,
-2.115668, -0.7758867, -2.073214, 1, 1, 1, 1, 1,
-2.099881, 0.4629411, -0.4962782, 1, 1, 1, 1, 1,
-2.030678, 0.04761462, -1.428424, 1, 1, 1, 1, 1,
-2.023247, 1.867529, -0.08036635, 1, 1, 1, 1, 1,
-1.985848, -0.7359826, -2.241438, 1, 1, 1, 1, 1,
-1.970674, -0.2064024, -1.997529, 1, 1, 1, 1, 1,
-1.964573, -1.670237, -3.062829, 1, 1, 1, 1, 1,
-1.909873, -1.491244, -2.564495, 1, 1, 1, 1, 1,
-1.903745, 1.633413, 0.7054327, 1, 1, 1, 1, 1,
-1.850675, 1.528632, -1.01291, 0, 0, 1, 1, 1,
-1.848543, 0.9164908, 1.125028, 1, 0, 0, 1, 1,
-1.843227, -0.6041662, -2.745026, 1, 0, 0, 1, 1,
-1.803775, -0.8827025, -1.914485, 1, 0, 0, 1, 1,
-1.774251, 1.311505, -1.379314, 1, 0, 0, 1, 1,
-1.761814, 1.726404, -1.782477, 1, 0, 0, 1, 1,
-1.72713, 1.289453, -1.780873, 0, 0, 0, 1, 1,
-1.725067, -1.896549, -2.111192, 0, 0, 0, 1, 1,
-1.724252, -0.7531772, -2.271493, 0, 0, 0, 1, 1,
-1.722391, -0.6781902, -2.126387, 0, 0, 0, 1, 1,
-1.703314, -0.9459623, -1.22057, 0, 0, 0, 1, 1,
-1.664356, -0.0892977, -3.004323, 0, 0, 0, 1, 1,
-1.65551, 0.1067888, -1.842008, 0, 0, 0, 1, 1,
-1.647097, 0.4019056, -0.6824152, 1, 1, 1, 1, 1,
-1.6128, 0.2378331, -1.517563, 1, 1, 1, 1, 1,
-1.607905, -0.2727836, -0.4868598, 1, 1, 1, 1, 1,
-1.598871, 1.145564, 0.4364392, 1, 1, 1, 1, 1,
-1.597612, -1.297357, -1.377836, 1, 1, 1, 1, 1,
-1.575339, 0.4373601, -3.0545, 1, 1, 1, 1, 1,
-1.570187, -0.2052671, -3.388901, 1, 1, 1, 1, 1,
-1.568321, 0.2570857, -1.806079, 1, 1, 1, 1, 1,
-1.554399, -0.6174242, -2.290842, 1, 1, 1, 1, 1,
-1.549255, 0.2377553, -3.310519, 1, 1, 1, 1, 1,
-1.514625, -0.1785164, -2.662489, 1, 1, 1, 1, 1,
-1.507079, -0.6901811, -1.004312, 1, 1, 1, 1, 1,
-1.488225, -0.02251294, -0.7708251, 1, 1, 1, 1, 1,
-1.479437, 0.1786266, -2.237264, 1, 1, 1, 1, 1,
-1.479083, -0.01137414, -0.9078031, 1, 1, 1, 1, 1,
-1.478984, 0.3448599, -1.162106, 0, 0, 1, 1, 1,
-1.464378, -1.851434, -2.680861, 1, 0, 0, 1, 1,
-1.461305, -0.7746256, -3.050842, 1, 0, 0, 1, 1,
-1.459162, 2.356976, -0.5945188, 1, 0, 0, 1, 1,
-1.455538, -0.8434716, -2.897613, 1, 0, 0, 1, 1,
-1.450938, 0.2395948, -2.135494, 1, 0, 0, 1, 1,
-1.432374, -0.05553735, -0.8488051, 0, 0, 0, 1, 1,
-1.431634, 1.268615, -0.2076571, 0, 0, 0, 1, 1,
-1.431337, 0.2568075, -1.679813, 0, 0, 0, 1, 1,
-1.427059, 0.495211, -0.5784325, 0, 0, 0, 1, 1,
-1.423713, -0.1274268, -1.619433, 0, 0, 0, 1, 1,
-1.41998, 0.2890951, -0.01528481, 0, 0, 0, 1, 1,
-1.419757, -0.4745736, -2.364659, 0, 0, 0, 1, 1,
-1.419666, 0.04314074, -1.454283, 1, 1, 1, 1, 1,
-1.419192, -0.3012941, -0.1810644, 1, 1, 1, 1, 1,
-1.399556, -0.0296614, -1.191664, 1, 1, 1, 1, 1,
-1.389301, 0.1868099, 0.1062508, 1, 1, 1, 1, 1,
-1.387925, -0.9249463, -2.027253, 1, 1, 1, 1, 1,
-1.379448, -0.6733472, -1.676437, 1, 1, 1, 1, 1,
-1.376658, -0.250444, -1.493254, 1, 1, 1, 1, 1,
-1.372165, -0.2588012, -1.272863, 1, 1, 1, 1, 1,
-1.371917, 1.224106, -1.399354, 1, 1, 1, 1, 1,
-1.36186, -0.9963014, -0.5002883, 1, 1, 1, 1, 1,
-1.361018, -1.393145, -3.556834, 1, 1, 1, 1, 1,
-1.356987, -2.511855, -2.73928, 1, 1, 1, 1, 1,
-1.353163, 1.616175, -1.253734, 1, 1, 1, 1, 1,
-1.346804, 1.314416, 0.3703511, 1, 1, 1, 1, 1,
-1.344861, -0.04130053, -0.7584659, 1, 1, 1, 1, 1,
-1.340334, -0.4192114, -0.9615051, 0, 0, 1, 1, 1,
-1.339697, 1.107749, -2.273027, 1, 0, 0, 1, 1,
-1.337878, 1.121679, -0.5729205, 1, 0, 0, 1, 1,
-1.33679, -0.2645843, -1.565139, 1, 0, 0, 1, 1,
-1.333208, -0.3969716, -3.433922, 1, 0, 0, 1, 1,
-1.325997, -0.6120436, -0.05689306, 1, 0, 0, 1, 1,
-1.324843, 0.4638807, -0.7031803, 0, 0, 0, 1, 1,
-1.319476, -0.414785, -2.014229, 0, 0, 0, 1, 1,
-1.315955, 0.5841041, -0.4569999, 0, 0, 0, 1, 1,
-1.275158, -0.5696099, -2.124178, 0, 0, 0, 1, 1,
-1.273968, -0.4825164, -2.736917, 0, 0, 0, 1, 1,
-1.263239, 0.7406613, -0.2086782, 0, 0, 0, 1, 1,
-1.258702, 0.9267093, -1.004593, 0, 0, 0, 1, 1,
-1.256735, -1.383777, -0.4371229, 1, 1, 1, 1, 1,
-1.244076, -0.6343888, -3.369328, 1, 1, 1, 1, 1,
-1.243109, 0.2340768, -1.841807, 1, 1, 1, 1, 1,
-1.240739, 0.9838767, 0.2872954, 1, 1, 1, 1, 1,
-1.231158, 0.9367006, -0.7939957, 1, 1, 1, 1, 1,
-1.220908, 0.9934462, -1.208919, 1, 1, 1, 1, 1,
-1.218037, 0.8625891, -0.3538493, 1, 1, 1, 1, 1,
-1.216661, -1.249859, -3.562643, 1, 1, 1, 1, 1,
-1.215102, -0.1515423, -2.065758, 1, 1, 1, 1, 1,
-1.212841, -0.51608, -1.407031, 1, 1, 1, 1, 1,
-1.211983, 0.09492259, -1.958575, 1, 1, 1, 1, 1,
-1.207432, -0.4533392, -3.531084, 1, 1, 1, 1, 1,
-1.198868, -1.747248, -2.200189, 1, 1, 1, 1, 1,
-1.195548, 0.04634827, -0.5455885, 1, 1, 1, 1, 1,
-1.185445, -0.2531571, -1.14599, 1, 1, 1, 1, 1,
-1.184941, -0.3648875, -1.907355, 0, 0, 1, 1, 1,
-1.175189, 0.1756784, -1.088625, 1, 0, 0, 1, 1,
-1.164916, -1.226502, -2.681107, 1, 0, 0, 1, 1,
-1.161871, 0.504903, -0.6976539, 1, 0, 0, 1, 1,
-1.158982, -0.06550475, -0.8686177, 1, 0, 0, 1, 1,
-1.154276, 0.06106455, -0.9497203, 1, 0, 0, 1, 1,
-1.153846, 0.4472163, -2.61782, 0, 0, 0, 1, 1,
-1.146979, 0.6567277, -1.805624, 0, 0, 0, 1, 1,
-1.140745, 0.3216231, -2.121352, 0, 0, 0, 1, 1,
-1.137409, -0.3397038, -2.029519, 0, 0, 0, 1, 1,
-1.136742, 1.900409, -1.072364, 0, 0, 0, 1, 1,
-1.120842, 1.059714, -1.266644, 0, 0, 0, 1, 1,
-1.119685, -0.8713637, -0.9365662, 0, 0, 0, 1, 1,
-1.118342, -0.1433757, -1.921283, 1, 1, 1, 1, 1,
-1.115097, -0.4786987, -2.120701, 1, 1, 1, 1, 1,
-1.111532, -0.962911, -1.017558, 1, 1, 1, 1, 1,
-1.108675, 0.2090556, -3.097712, 1, 1, 1, 1, 1,
-1.104436, 2.754144, -0.8542009, 1, 1, 1, 1, 1,
-1.100025, -0.04671718, -1.028214, 1, 1, 1, 1, 1,
-1.097298, -0.4202311, -2.757816, 1, 1, 1, 1, 1,
-1.095437, -0.842591, -3.567501, 1, 1, 1, 1, 1,
-1.094129, 1.777277, 1.333172, 1, 1, 1, 1, 1,
-1.093585, 0.9967849, -1.474719, 1, 1, 1, 1, 1,
-1.088007, -1.653921, -1.949583, 1, 1, 1, 1, 1,
-1.085553, -1.128691, -1.331735, 1, 1, 1, 1, 1,
-1.081143, -2.087823, -3.408257, 1, 1, 1, 1, 1,
-1.076747, -0.3631757, -3.752939, 1, 1, 1, 1, 1,
-1.072598, 1.858733, -1.194168, 1, 1, 1, 1, 1,
-1.070517, 0.4884821, -2.453655, 0, 0, 1, 1, 1,
-1.05995, 0.2678396, -0.4805419, 1, 0, 0, 1, 1,
-1.054744, -1.976296, -1.140644, 1, 0, 0, 1, 1,
-1.053586, -0.5855857, -2.649587, 1, 0, 0, 1, 1,
-1.051806, 0.1183464, -1.175675, 1, 0, 0, 1, 1,
-1.045436, 0.02533798, -1.060564, 1, 0, 0, 1, 1,
-1.044269, -2.19371, -2.136998, 0, 0, 0, 1, 1,
-1.042982, -2.109979, -4.400204, 0, 0, 0, 1, 1,
-1.041261, 0.7322222, -0.208961, 0, 0, 0, 1, 1,
-1.040352, 1.019521, -1.405699, 0, 0, 0, 1, 1,
-1.040323, -0.0007267211, -2.782208, 0, 0, 0, 1, 1,
-1.040185, -0.3659051, -2.11661, 0, 0, 0, 1, 1,
-1.034298, -0.004951321, -2.132882, 0, 0, 0, 1, 1,
-1.026755, -0.8199716, -1.301483, 1, 1, 1, 1, 1,
-1.021026, -0.226162, -1.684896, 1, 1, 1, 1, 1,
-1.009283, -0.08740604, -2.551315, 1, 1, 1, 1, 1,
-1.007175, 0.3923763, -0.9961633, 1, 1, 1, 1, 1,
-1.00677, -0.1107586, -3.378585, 1, 1, 1, 1, 1,
-1.002805, 0.2816308, -3.281995, 1, 1, 1, 1, 1,
-1.001315, -0.4387158, -0.2436073, 1, 1, 1, 1, 1,
-0.9965202, 0.7255277, -0.8566175, 1, 1, 1, 1, 1,
-0.992205, 0.7665716, -2.085752, 1, 1, 1, 1, 1,
-0.9894294, -0.3570941, -2.204484, 1, 1, 1, 1, 1,
-0.9883431, -0.8451254, -2.032638, 1, 1, 1, 1, 1,
-0.9745153, 1.788595, -0.2442857, 1, 1, 1, 1, 1,
-0.9645171, 1.426546, -1.270178, 1, 1, 1, 1, 1,
-0.9624492, -0.4493637, -0.3663926, 1, 1, 1, 1, 1,
-0.9612355, 1.599524, 0.4350003, 1, 1, 1, 1, 1,
-0.9584779, -0.4524976, -1.353396, 0, 0, 1, 1, 1,
-0.9549723, -1.834432, -2.436964, 1, 0, 0, 1, 1,
-0.9545187, -0.5704649, -2.918477, 1, 0, 0, 1, 1,
-0.9527412, -2.760128, -3.69204, 1, 0, 0, 1, 1,
-0.951328, 0.3295465, 1.215786, 1, 0, 0, 1, 1,
-0.947052, -0.4659516, -2.527464, 1, 0, 0, 1, 1,
-0.9378164, 0.3498796, -2.466732, 0, 0, 0, 1, 1,
-0.9374848, -1.119601, -2.426667, 0, 0, 0, 1, 1,
-0.9345211, 0.2521278, -0.7410681, 0, 0, 0, 1, 1,
-0.9339125, -1.26422, -2.908245, 0, 0, 0, 1, 1,
-0.9313751, 1.737015, 0.3076949, 0, 0, 0, 1, 1,
-0.930887, -2.035846, -3.351695, 0, 0, 0, 1, 1,
-0.913255, 1.646089, 1.654403, 0, 0, 0, 1, 1,
-0.9106532, 0.1879795, 0.1149378, 1, 1, 1, 1, 1,
-0.896574, -0.8888497, -1.312491, 1, 1, 1, 1, 1,
-0.8888919, 0.8680534, -0.7709876, 1, 1, 1, 1, 1,
-0.8838352, -0.5810195, -0.8716015, 1, 1, 1, 1, 1,
-0.8819237, -0.4757303, -1.875628, 1, 1, 1, 1, 1,
-0.8789158, 0.9867148, -1.503214, 1, 1, 1, 1, 1,
-0.8777463, -0.20487, -0.4356588, 1, 1, 1, 1, 1,
-0.8776886, -2.069032, -2.709437, 1, 1, 1, 1, 1,
-0.867649, 0.001947239, -0.3736406, 1, 1, 1, 1, 1,
-0.8594098, -1.781579, -1.729477, 1, 1, 1, 1, 1,
-0.8587098, 0.7715693, -1.44724, 1, 1, 1, 1, 1,
-0.8578739, 0.7920425, 0.2807645, 1, 1, 1, 1, 1,
-0.8541603, 1.748586, -2.055711, 1, 1, 1, 1, 1,
-0.8446927, -0.2872883, -1.684242, 1, 1, 1, 1, 1,
-0.8411144, 1.257886, -0.03225528, 1, 1, 1, 1, 1,
-0.8365327, 0.7145167, -2.406108, 0, 0, 1, 1, 1,
-0.8350707, 0.1895411, -0.5058829, 1, 0, 0, 1, 1,
-0.825241, 0.8345353, 0.08735401, 1, 0, 0, 1, 1,
-0.8136864, 0.6547727, -1.91887, 1, 0, 0, 1, 1,
-0.8119665, 0.1875447, 0.387985, 1, 0, 0, 1, 1,
-0.8118165, -0.798475, -2.69301, 1, 0, 0, 1, 1,
-0.8106121, -1.109594, -2.85993, 0, 0, 0, 1, 1,
-0.8064204, 1.58324, -0.5861888, 0, 0, 0, 1, 1,
-0.8047422, 1.164507, -0.3921555, 0, 0, 0, 1, 1,
-0.8024729, -1.518726, -1.902704, 0, 0, 0, 1, 1,
-0.7935875, -0.2554445, -0.7360287, 0, 0, 0, 1, 1,
-0.7913764, 0.2871009, -0.4781533, 0, 0, 0, 1, 1,
-0.7893556, 0.4328241, -2.053974, 0, 0, 0, 1, 1,
-0.7840838, 0.4281202, -2.453348, 1, 1, 1, 1, 1,
-0.7832632, -0.008839365, -1.388753, 1, 1, 1, 1, 1,
-0.7788659, 0.1199092, -1.002536, 1, 1, 1, 1, 1,
-0.7784535, 0.3525138, -0.01737704, 1, 1, 1, 1, 1,
-0.7768881, -0.5266173, -1.021121, 1, 1, 1, 1, 1,
-0.7763977, -0.1137718, -3.207181, 1, 1, 1, 1, 1,
-0.766658, 0.7472426, -1.386256, 1, 1, 1, 1, 1,
-0.7615905, 0.2534921, 0.4724816, 1, 1, 1, 1, 1,
-0.7609512, -0.3064733, -2.481393, 1, 1, 1, 1, 1,
-0.7521535, 3.073698, 2.995148, 1, 1, 1, 1, 1,
-0.7518732, -0.8121774, -2.596608, 1, 1, 1, 1, 1,
-0.7516676, 0.4660366, 0.07807511, 1, 1, 1, 1, 1,
-0.7477741, -0.9897956, -4.11978, 1, 1, 1, 1, 1,
-0.7430987, -0.02275716, -2.378892, 1, 1, 1, 1, 1,
-0.742009, 0.331146, -0.6006783, 1, 1, 1, 1, 1,
-0.7350808, -1.110042, -2.584385, 0, 0, 1, 1, 1,
-0.7298538, 1.544013, -1.251763, 1, 0, 0, 1, 1,
-0.7284656, 1.155476, 0.3883677, 1, 0, 0, 1, 1,
-0.7265339, -1.023936, -3.114166, 1, 0, 0, 1, 1,
-0.7255203, 1.107965, -1.053355, 1, 0, 0, 1, 1,
-0.7251249, 0.963145, -1.45975, 1, 0, 0, 1, 1,
-0.7245053, 1.919151, -1.066567, 0, 0, 0, 1, 1,
-0.7236779, -0.2924052, -2.239714, 0, 0, 0, 1, 1,
-0.7231708, -0.07397719, -4.335822, 0, 0, 0, 1, 1,
-0.7229987, -1.792302, -1.261858, 0, 0, 0, 1, 1,
-0.7228296, 0.7093083, -0.3533859, 0, 0, 0, 1, 1,
-0.7149937, -1.035869, -2.8162, 0, 0, 0, 1, 1,
-0.7144725, -0.1773695, -1.959231, 0, 0, 0, 1, 1,
-0.7143816, 0.1825269, -2.704026, 1, 1, 1, 1, 1,
-0.7131491, 0.976122, -1.331208, 1, 1, 1, 1, 1,
-0.7128591, -1.481059, -1.956074, 1, 1, 1, 1, 1,
-0.7102847, 0.1748492, -1.629249, 1, 1, 1, 1, 1,
-0.7015082, 0.4917032, -2.190902, 1, 1, 1, 1, 1,
-0.6957101, 1.604652, -0.587074, 1, 1, 1, 1, 1,
-0.6942413, 0.03726051, -2.420201, 1, 1, 1, 1, 1,
-0.6904619, 1.630284, -0.3998625, 1, 1, 1, 1, 1,
-0.6896306, -0.05076116, -1.592718, 1, 1, 1, 1, 1,
-0.6895925, -0.3319819, -2.523062, 1, 1, 1, 1, 1,
-0.6883846, -0.5596057, -3.127783, 1, 1, 1, 1, 1,
-0.6829808, 1.398278, 0.3457637, 1, 1, 1, 1, 1,
-0.6828308, 0.6586933, -1.340538, 1, 1, 1, 1, 1,
-0.6827435, 1.177306, -1.145671, 1, 1, 1, 1, 1,
-0.6739506, 0.2503698, -0.6333135, 1, 1, 1, 1, 1,
-0.6721711, 0.401705, 0.6746981, 0, 0, 1, 1, 1,
-0.6716978, -0.1618802, 0.7979236, 1, 0, 0, 1, 1,
-0.6634704, -0.7027462, -2.088265, 1, 0, 0, 1, 1,
-0.6588156, -1.385605, -4.296427, 1, 0, 0, 1, 1,
-0.6544915, 0.1806301, -1.204206, 1, 0, 0, 1, 1,
-0.6509034, 0.2392783, 0.03354315, 1, 0, 0, 1, 1,
-0.6451331, 1.52454, 0.2295778, 0, 0, 0, 1, 1,
-0.6423165, 0.557441, -1.747299, 0, 0, 0, 1, 1,
-0.6421515, -0.9519749, -1.936998, 0, 0, 0, 1, 1,
-0.6404938, -0.9716642, -3.515943, 0, 0, 0, 1, 1,
-0.6363069, -0.1812635, -0.2784915, 0, 0, 0, 1, 1,
-0.6284194, 1.192894, 0.3270243, 0, 0, 0, 1, 1,
-0.6259165, 0.2958428, -0.887708, 0, 0, 0, 1, 1,
-0.6249445, 0.6944228, -1.509811, 1, 1, 1, 1, 1,
-0.6184922, 0.4237551, -0.7335564, 1, 1, 1, 1, 1,
-0.6144333, -0.9212471, -2.233229, 1, 1, 1, 1, 1,
-0.6130834, 0.3880966, -0.6512976, 1, 1, 1, 1, 1,
-0.6105106, -1.591565, -2.623033, 1, 1, 1, 1, 1,
-0.6003489, 0.1679326, -1.357295, 1, 1, 1, 1, 1,
-0.5951941, -0.314148, -2.775146, 1, 1, 1, 1, 1,
-0.5939389, 0.1520106, -0.6990402, 1, 1, 1, 1, 1,
-0.5904944, -1.384249, -2.120353, 1, 1, 1, 1, 1,
-0.582101, -0.490786, -2.516675, 1, 1, 1, 1, 1,
-0.5791845, 0.3276183, 1.266822, 1, 1, 1, 1, 1,
-0.5758652, 0.2474805, -0.1960196, 1, 1, 1, 1, 1,
-0.5734245, 0.4585051, -0.7389745, 1, 1, 1, 1, 1,
-0.5722483, 1.644588, 0.07192502, 1, 1, 1, 1, 1,
-0.5675769, -1.134461, -1.608378, 1, 1, 1, 1, 1,
-0.5666046, -0.1100074, -3.246443, 0, 0, 1, 1, 1,
-0.5642971, 0.8898392, -2.74495, 1, 0, 0, 1, 1,
-0.5565167, -0.5508139, -2.964998, 1, 0, 0, 1, 1,
-0.5552825, 2.060448, -1.561323, 1, 0, 0, 1, 1,
-0.5550132, 0.01150094, -1.992316, 1, 0, 0, 1, 1,
-0.5547896, 0.6199104, -0.3695172, 1, 0, 0, 1, 1,
-0.5524874, 1.551043, -1.081056, 0, 0, 0, 1, 1,
-0.5516661, 0.1939087, -1.490093, 0, 0, 0, 1, 1,
-0.5502678, 0.3004287, 0.4386886, 0, 0, 0, 1, 1,
-0.5449041, 1.623008, -0.2963499, 0, 0, 0, 1, 1,
-0.5447105, 0.2839643, -0.855379, 0, 0, 0, 1, 1,
-0.5398009, 0.5725837, -0.3531896, 0, 0, 0, 1, 1,
-0.5351419, -0.006196225, -0.377206, 0, 0, 0, 1, 1,
-0.5280656, -0.8083417, -1.239104, 1, 1, 1, 1, 1,
-0.5262067, 0.2167484, -0.0146851, 1, 1, 1, 1, 1,
-0.5224988, 0.03401044, -1.298929, 1, 1, 1, 1, 1,
-0.5197757, -0.4683936, -2.575485, 1, 1, 1, 1, 1,
-0.5166149, -0.3802449, -1.251258, 1, 1, 1, 1, 1,
-0.5159639, 0.3876722, -2.176955, 1, 1, 1, 1, 1,
-0.5146077, 0.5105588, -1.293916, 1, 1, 1, 1, 1,
-0.506476, 0.173788, 0.1400837, 1, 1, 1, 1, 1,
-0.5062878, -0.1041887, -2.699152, 1, 1, 1, 1, 1,
-0.5044253, 0.2187273, 0.1074184, 1, 1, 1, 1, 1,
-0.5038439, 0.05936876, -1.466158, 1, 1, 1, 1, 1,
-0.4994473, -0.4328586, -1.867678, 1, 1, 1, 1, 1,
-0.4945284, 1.46147, 0.6400759, 1, 1, 1, 1, 1,
-0.4938185, 1.314393, -2.23605, 1, 1, 1, 1, 1,
-0.4923727, -0.1211829, -2.217532, 1, 1, 1, 1, 1,
-0.4915389, -1.271835, -3.18513, 0, 0, 1, 1, 1,
-0.490974, 0.9795155, -0.649847, 1, 0, 0, 1, 1,
-0.4895973, -1.226241, -2.501449, 1, 0, 0, 1, 1,
-0.4892709, -0.8556416, -1.222247, 1, 0, 0, 1, 1,
-0.4886304, -1.423618, -3.953949, 1, 0, 0, 1, 1,
-0.4802772, -0.2345128, -1.74619, 1, 0, 0, 1, 1,
-0.4790125, 0.9558144, -0.9839753, 0, 0, 0, 1, 1,
-0.4744602, 0.5899437, -1.109718, 0, 0, 0, 1, 1,
-0.4715271, -0.2471783, -3.365885, 0, 0, 0, 1, 1,
-0.4705018, 0.6021695, -0.914416, 0, 0, 0, 1, 1,
-0.465524, -1.123105, -2.248319, 0, 0, 0, 1, 1,
-0.461784, 0.5205386, -0.5754548, 0, 0, 0, 1, 1,
-0.4595836, -0.5844035, -1.375722, 0, 0, 0, 1, 1,
-0.4595311, -0.9097735, -1.795574, 1, 1, 1, 1, 1,
-0.4574782, -0.03245695, -0.2596893, 1, 1, 1, 1, 1,
-0.4566298, -0.884331, -3.549341, 1, 1, 1, 1, 1,
-0.456181, -0.2786267, -1.677614, 1, 1, 1, 1, 1,
-0.4520062, -1.118946, -1.069942, 1, 1, 1, 1, 1,
-0.4507656, -1.458341, -3.86558, 1, 1, 1, 1, 1,
-0.446557, -0.2825968, -1.067886, 1, 1, 1, 1, 1,
-0.4401127, 0.2040432, -1.075256, 1, 1, 1, 1, 1,
-0.4398758, -0.4018618, -2.129807, 1, 1, 1, 1, 1,
-0.4376608, 0.722136, -0.01267402, 1, 1, 1, 1, 1,
-0.4354894, 1.76897, -0.7967366, 1, 1, 1, 1, 1,
-0.4345117, 0.01967183, -2.089289, 1, 1, 1, 1, 1,
-0.433208, -0.6480249, -2.273952, 1, 1, 1, 1, 1,
-0.4326859, 1.64176, -1.469992, 1, 1, 1, 1, 1,
-0.4289609, 0.3935927, -0.6882449, 1, 1, 1, 1, 1,
-0.4277315, 1.16463, -1.329269, 0, 0, 1, 1, 1,
-0.4249279, -0.9657399, -2.004128, 1, 0, 0, 1, 1,
-0.4228092, 0.3908792, 0.1972366, 1, 0, 0, 1, 1,
-0.4217974, -0.49501, -4.155014, 1, 0, 0, 1, 1,
-0.4206559, 1.222981, -0.8942086, 1, 0, 0, 1, 1,
-0.4203295, -0.3174225, -2.400999, 1, 0, 0, 1, 1,
-0.4183753, 0.7854528, -1.72564, 0, 0, 0, 1, 1,
-0.4176101, 0.02146816, -1.4302, 0, 0, 0, 1, 1,
-0.416004, 0.7716957, 0.005677801, 0, 0, 0, 1, 1,
-0.4130684, 1.796806, -1.248965, 0, 0, 0, 1, 1,
-0.4086884, 0.645991, 0.9452567, 0, 0, 0, 1, 1,
-0.4068341, 0.9807729, -1.136697, 0, 0, 0, 1, 1,
-0.4033987, -0.3357083, -1.6393, 0, 0, 0, 1, 1,
-0.4007694, -0.3779912, -1.150785, 1, 1, 1, 1, 1,
-0.3996774, 1.116507, 0.2428024, 1, 1, 1, 1, 1,
-0.3948954, 0.133523, -1.093351, 1, 1, 1, 1, 1,
-0.3896235, 0.6671244, 0.07415532, 1, 1, 1, 1, 1,
-0.3825792, 1.324064, -0.3534341, 1, 1, 1, 1, 1,
-0.3825217, -2.188318, -2.013355, 1, 1, 1, 1, 1,
-0.3820956, 0.3798009, -1.214117, 1, 1, 1, 1, 1,
-0.378561, 1.948489, -0.4021824, 1, 1, 1, 1, 1,
-0.378245, -0.326964, -2.29299, 1, 1, 1, 1, 1,
-0.374561, -1.204739, -2.754763, 1, 1, 1, 1, 1,
-0.3724443, 2.365398, 2.172438, 1, 1, 1, 1, 1,
-0.3702793, 2.043612, 0.1484518, 1, 1, 1, 1, 1,
-0.3637466, 0.5580025, -0.5022398, 1, 1, 1, 1, 1,
-0.3624867, -1.127151, -3.040254, 1, 1, 1, 1, 1,
-0.3622384, -0.8367749, -2.836401, 1, 1, 1, 1, 1,
-0.3554344, 0.8612507, 1.722831, 0, 0, 1, 1, 1,
-0.355186, -0.9514806, -2.404448, 1, 0, 0, 1, 1,
-0.351674, 1.728193, -1.397166, 1, 0, 0, 1, 1,
-0.3486184, 0.2758884, -0.588781, 1, 0, 0, 1, 1,
-0.3469709, -0.9651919, -1.071128, 1, 0, 0, 1, 1,
-0.3387971, -0.2297635, -2.269676, 1, 0, 0, 1, 1,
-0.3347221, -1.043289, -3.595274, 0, 0, 0, 1, 1,
-0.3345873, -1.186828, -2.513852, 0, 0, 0, 1, 1,
-0.3303304, -0.5133686, -1.306073, 0, 0, 0, 1, 1,
-0.3298634, 0.1145487, 0.1234899, 0, 0, 0, 1, 1,
-0.3255142, -0.4403302, -2.550015, 0, 0, 0, 1, 1,
-0.3167917, -1.474781, -1.870128, 0, 0, 0, 1, 1,
-0.3156742, 1.560047, -0.813274, 0, 0, 0, 1, 1,
-0.3147265, -1.330021, -3.561772, 1, 1, 1, 1, 1,
-0.3145966, 0.2606341, -2.109847, 1, 1, 1, 1, 1,
-0.3145957, -0.8481091, -2.632396, 1, 1, 1, 1, 1,
-0.3103389, -0.329013, -0.5636615, 1, 1, 1, 1, 1,
-0.3091045, 0.0634688, -1.450184, 1, 1, 1, 1, 1,
-0.2989855, -0.5582647, -2.29705, 1, 1, 1, 1, 1,
-0.2962757, -1.092019, -2.821012, 1, 1, 1, 1, 1,
-0.2947441, -0.3185304, -2.872485, 1, 1, 1, 1, 1,
-0.2929118, -1.013761, -1.319295, 1, 1, 1, 1, 1,
-0.2869092, 0.236329, 0.2471963, 1, 1, 1, 1, 1,
-0.2836763, -0.1731364, -1.890223, 1, 1, 1, 1, 1,
-0.2802519, 1.199231, 0.1800184, 1, 1, 1, 1, 1,
-0.2801017, -0.5962875, -2.992205, 1, 1, 1, 1, 1,
-0.2781939, -0.1759177, -0.04175885, 1, 1, 1, 1, 1,
-0.2779005, 1.906328, 1.355917, 1, 1, 1, 1, 1,
-0.2752804, -0.4843684, -3.094591, 0, 0, 1, 1, 1,
-0.2732686, 1.317575, 0.1640163, 1, 0, 0, 1, 1,
-0.2732122, 1.773804, -0.2026337, 1, 0, 0, 1, 1,
-0.2647462, 1.196717, 0.7379212, 1, 0, 0, 1, 1,
-0.2637582, 0.02065256, -1.758972, 1, 0, 0, 1, 1,
-0.2616705, 1.907422, -0.05741852, 1, 0, 0, 1, 1,
-0.2607042, 0.2783321, -1.343047, 0, 0, 0, 1, 1,
-0.2602117, 0.6202893, -1.191026, 0, 0, 0, 1, 1,
-0.2553818, -0.1954433, -3.583148, 0, 0, 0, 1, 1,
-0.2543373, 1.327351, -0.6861001, 0, 0, 0, 1, 1,
-0.2541661, -0.1950936, -3.245021, 0, 0, 0, 1, 1,
-0.2528375, -0.8561407, -4.405625, 0, 0, 0, 1, 1,
-0.244682, 0.06469123, -1.129637, 0, 0, 0, 1, 1,
-0.2438253, -0.184268, -2.433219, 1, 1, 1, 1, 1,
-0.2427765, -1.429208, -2.564907, 1, 1, 1, 1, 1,
-0.242566, -0.3875607, -1.856104, 1, 1, 1, 1, 1,
-0.2369286, 1.514345, -2.154525, 1, 1, 1, 1, 1,
-0.2333726, -1.249652, -3.469404, 1, 1, 1, 1, 1,
-0.2333718, -0.1722047, -2.651131, 1, 1, 1, 1, 1,
-0.2310703, 0.0765513, -0.3025687, 1, 1, 1, 1, 1,
-0.2307879, -1.403624, -2.64596, 1, 1, 1, 1, 1,
-0.2289716, 1.986233, 1.233529, 1, 1, 1, 1, 1,
-0.2282074, 0.3406048, -2.418972, 1, 1, 1, 1, 1,
-0.2214065, 1.889241, 0.06049264, 1, 1, 1, 1, 1,
-0.2212722, -0.3896235, -3.106454, 1, 1, 1, 1, 1,
-0.2201748, 1.263474, -1.860875, 1, 1, 1, 1, 1,
-0.2197241, 0.7702026, -1.393642, 1, 1, 1, 1, 1,
-0.2194287, 0.1852216, -3.412792, 1, 1, 1, 1, 1,
-0.2172272, -0.1920105, -1.937162, 0, 0, 1, 1, 1,
-0.2155926, -1.325768, -5.204327, 1, 0, 0, 1, 1,
-0.2145852, 0.6378873, 0.3850578, 1, 0, 0, 1, 1,
-0.2135491, 1.028127, 0.615939, 1, 0, 0, 1, 1,
-0.2108764, 0.7538834, 0.2246682, 1, 0, 0, 1, 1,
-0.2079115, 0.8896695, -0.7872193, 1, 0, 0, 1, 1,
-0.205534, -0.1992816, -2.432078, 0, 0, 0, 1, 1,
-0.2022775, -1.202907, -3.872007, 0, 0, 0, 1, 1,
-0.1994539, -0.1276612, -3.062576, 0, 0, 0, 1, 1,
-0.1974392, -1.689671, -4.636988, 0, 0, 0, 1, 1,
-0.196886, -1.125216, -2.67513, 0, 0, 0, 1, 1,
-0.1902024, -0.1118766, -3.042068, 0, 0, 0, 1, 1,
-0.1893879, -1.232126, -4.950282, 0, 0, 0, 1, 1,
-0.1876324, 1.588294, -0.1341115, 1, 1, 1, 1, 1,
-0.1874184, -0.6366361, 0.4645297, 1, 1, 1, 1, 1,
-0.1863988, -0.4349938, -3.484901, 1, 1, 1, 1, 1,
-0.1841393, 0.6219792, -0.7606534, 1, 1, 1, 1, 1,
-0.1823323, -0.3000478, -2.546039, 1, 1, 1, 1, 1,
-0.1816609, -0.5452566, -2.332468, 1, 1, 1, 1, 1,
-0.1809721, 0.416676, -0.5701936, 1, 1, 1, 1, 1,
-0.1804332, 0.9426817, -1.590913, 1, 1, 1, 1, 1,
-0.1776724, 0.948402, -0.1279574, 1, 1, 1, 1, 1,
-0.1720592, 0.07145353, -0.7815061, 1, 1, 1, 1, 1,
-0.1713932, -1.296734, -3.339146, 1, 1, 1, 1, 1,
-0.1693178, 0.08095166, -0.3409048, 1, 1, 1, 1, 1,
-0.1620129, 1.131642, -0.5802072, 1, 1, 1, 1, 1,
-0.1520232, -0.1991665, -3.477575, 1, 1, 1, 1, 1,
-0.1502956, -0.3092863, -1.823076, 1, 1, 1, 1, 1,
-0.1502571, 0.6170024, -0.01198552, 0, 0, 1, 1, 1,
-0.1480273, 0.4029664, -1.087596, 1, 0, 0, 1, 1,
-0.1463111, 0.8982632, 0.3056404, 1, 0, 0, 1, 1,
-0.1398334, -1.582952, -3.777832, 1, 0, 0, 1, 1,
-0.1367047, 0.3068494, -1.43369, 1, 0, 0, 1, 1,
-0.1355533, -1.112873, -1.883241, 1, 0, 0, 1, 1,
-0.1340352, -1.211389, -3.887318, 0, 0, 0, 1, 1,
-0.1282151, 0.8805704, -1.957883, 0, 0, 0, 1, 1,
-0.1229803, -0.3287075, -2.731051, 0, 0, 0, 1, 1,
-0.1228085, 0.931052, -2.034806, 0, 0, 0, 1, 1,
-0.1191331, 1.163258, -1.98921, 0, 0, 0, 1, 1,
-0.1171589, 0.8417767, 0.1448801, 0, 0, 0, 1, 1,
-0.1162264, -0.1155819, -3.056696, 0, 0, 0, 1, 1,
-0.1139863, -0.3641172, -2.696091, 1, 1, 1, 1, 1,
-0.1127113, -0.6265235, -3.653177, 1, 1, 1, 1, 1,
-0.1099138, 0.4085616, 0.1663083, 1, 1, 1, 1, 1,
-0.1087671, -1.163923, -4.046252, 1, 1, 1, 1, 1,
-0.1042387, 0.211013, -0.978447, 1, 1, 1, 1, 1,
-0.09866611, 1.350808, -1.025031, 1, 1, 1, 1, 1,
-0.0978684, 1.288709, -0.3304909, 1, 1, 1, 1, 1,
-0.09230965, -0.4855826, -3.091481, 1, 1, 1, 1, 1,
-0.09207489, -0.1100693, -2.503751, 1, 1, 1, 1, 1,
-0.08545478, -0.6135439, -1.755402, 1, 1, 1, 1, 1,
-0.08471432, -0.5871862, -3.302261, 1, 1, 1, 1, 1,
-0.08361907, -0.07585172, -1.751278, 1, 1, 1, 1, 1,
-0.08289286, -0.5851861, -0.4694969, 1, 1, 1, 1, 1,
-0.08201247, 0.578921, -1.572104, 1, 1, 1, 1, 1,
-0.08067802, 1.427722, -0.4143061, 1, 1, 1, 1, 1,
-0.08056223, 0.1155478, -2.352066, 0, 0, 1, 1, 1,
-0.07849537, 0.8561645, -2.71326, 1, 0, 0, 1, 1,
-0.07031046, 0.4753471, -1.239202, 1, 0, 0, 1, 1,
-0.06792139, 0.7677439, 1.885808, 1, 0, 0, 1, 1,
-0.06770363, -1.07669, -3.556591, 1, 0, 0, 1, 1,
-0.06613819, 2.094419, 0.8392864, 1, 0, 0, 1, 1,
-0.06584035, 1.596202, 0.3555993, 0, 0, 0, 1, 1,
-0.06581797, 1.400818, 1.790048, 0, 0, 0, 1, 1,
-0.06563707, 0.8065276, 0.6813737, 0, 0, 0, 1, 1,
-0.06417002, -1.873591, -2.415279, 0, 0, 0, 1, 1,
-0.05958841, -0.5181783, -2.504845, 0, 0, 0, 1, 1,
-0.058693, 1.877096, -1.202502, 0, 0, 0, 1, 1,
-0.05835488, -1.898622, -2.738638, 0, 0, 0, 1, 1,
-0.05470147, 1.74255, 0.8042708, 1, 1, 1, 1, 1,
-0.04890902, 0.9153587, 1.863305, 1, 1, 1, 1, 1,
-0.04824959, 1.180246, 0.3980877, 1, 1, 1, 1, 1,
-0.04822818, -0.03146219, -2.740134, 1, 1, 1, 1, 1,
-0.0450866, 0.9179722, -0.9192963, 1, 1, 1, 1, 1,
-0.04493883, -0.5622861, -2.618658, 1, 1, 1, 1, 1,
-0.04321825, 1.146766, -1.182377, 1, 1, 1, 1, 1,
-0.03971823, -0.03969147, -1.799635, 1, 1, 1, 1, 1,
-0.03342079, -1.89711, -2.399503, 1, 1, 1, 1, 1,
-0.01931708, -1.393061, -3.133151, 1, 1, 1, 1, 1,
-0.01729415, 0.9348564, 0.6326525, 1, 1, 1, 1, 1,
-0.01640427, -2.4287, -4.722849, 1, 1, 1, 1, 1,
-0.01243882, -1.460779, -2.887853, 1, 1, 1, 1, 1,
-0.01227915, 1.229399, 1.731591, 1, 1, 1, 1, 1,
-0.01226673, -0.8442845, -3.854519, 1, 1, 1, 1, 1,
-0.012175, -0.2258104, -1.905711, 0, 0, 1, 1, 1,
-0.005193084, -2.029498, -4.258448, 1, 0, 0, 1, 1,
-0.00461794, 0.581149, 0.8335842, 1, 0, 0, 1, 1,
-0.003454485, 0.6200985, 2.301822, 1, 0, 0, 1, 1,
-1.771808e-05, 0.1839915, -0.7798701, 1, 0, 0, 1, 1,
0.0002138945, -1.183152, 1.331351, 1, 0, 0, 1, 1,
0.001317874, 1.348359, -0.4856775, 0, 0, 0, 1, 1,
0.007101095, -0.3068403, 2.711389, 0, 0, 0, 1, 1,
0.008279226, 0.1501168, -1.034822, 0, 0, 0, 1, 1,
0.01043032, -0.3711261, 2.559526, 0, 0, 0, 1, 1,
0.01174585, 1.053525, -0.6009232, 0, 0, 0, 1, 1,
0.01428246, -0.2724396, 1.146636, 0, 0, 0, 1, 1,
0.01645026, 0.08006587, 0.4327841, 0, 0, 0, 1, 1,
0.01775727, 1.703883, 1.050318, 1, 1, 1, 1, 1,
0.02127337, 0.4160836, -0.3569061, 1, 1, 1, 1, 1,
0.03473164, 0.2979026, 1.53987, 1, 1, 1, 1, 1,
0.03696425, 0.2131533, -0.7936608, 1, 1, 1, 1, 1,
0.03826027, 1.309162, -1.314772, 1, 1, 1, 1, 1,
0.043834, -1.022013, 4.809143, 1, 1, 1, 1, 1,
0.04396185, 0.5607079, 0.2438822, 1, 1, 1, 1, 1,
0.04557925, -1.763201, 2.013069, 1, 1, 1, 1, 1,
0.04934895, -0.3152198, 4.605099, 1, 1, 1, 1, 1,
0.05097615, -1.723092, 1.735313, 1, 1, 1, 1, 1,
0.05380115, 0.8411589, 0.1151715, 1, 1, 1, 1, 1,
0.05388565, -0.03101037, 0.5559182, 1, 1, 1, 1, 1,
0.05708648, -2.366553, 2.530575, 1, 1, 1, 1, 1,
0.05764384, 0.8862202, 0.9024977, 1, 1, 1, 1, 1,
0.06751748, 0.213083, -0.7956586, 1, 1, 1, 1, 1,
0.07043091, 0.7244388, -1.21716, 0, 0, 1, 1, 1,
0.07190812, -1.412163, 5.106637, 1, 0, 0, 1, 1,
0.07407197, 1.066556, -0.6433797, 1, 0, 0, 1, 1,
0.07800775, -0.05721583, 1.391638, 1, 0, 0, 1, 1,
0.07805496, -0.6039103, 2.2849, 1, 0, 0, 1, 1,
0.08046631, -0.9810477, 1.97937, 1, 0, 0, 1, 1,
0.08196407, -0.9574888, 4.473773, 0, 0, 0, 1, 1,
0.08428706, -1.75598, 2.074502, 0, 0, 0, 1, 1,
0.08891902, -1.608613, 2.564054, 0, 0, 0, 1, 1,
0.0919527, 1.729036, 1.935747, 0, 0, 0, 1, 1,
0.09259278, 1.099338, 1.16295, 0, 0, 0, 1, 1,
0.09369961, -0.4193637, 2.564045, 0, 0, 0, 1, 1,
0.09535841, -1.655504, 5.52643, 0, 0, 0, 1, 1,
0.09577109, 0.8063902, 1.156494, 1, 1, 1, 1, 1,
0.09618202, 0.5693628, -0.6594885, 1, 1, 1, 1, 1,
0.09644213, 1.067881, -0.628276, 1, 1, 1, 1, 1,
0.1027439, 0.4217803, -0.3650841, 1, 1, 1, 1, 1,
0.1085836, 0.03496741, -0.2658607, 1, 1, 1, 1, 1,
0.108634, 0.5928487, 0.3961863, 1, 1, 1, 1, 1,
0.1096987, -0.2270715, 1.598475, 1, 1, 1, 1, 1,
0.1099462, 1.114506, -0.3931583, 1, 1, 1, 1, 1,
0.1114278, 0.3944723, -0.3968912, 1, 1, 1, 1, 1,
0.1129646, -1.794668, 3.296343, 1, 1, 1, 1, 1,
0.1143634, -0.009762763, 2.227764, 1, 1, 1, 1, 1,
0.1161749, 1.663388, 1.046453, 1, 1, 1, 1, 1,
0.1176326, -0.03595649, 2.770789, 1, 1, 1, 1, 1,
0.1185362, 1.610784, -2.066532, 1, 1, 1, 1, 1,
0.1203271, -0.8255115, 4.087758, 1, 1, 1, 1, 1,
0.1217825, 1.167406, 1.528572, 0, 0, 1, 1, 1,
0.1226873, 0.7112049, 2.153494, 1, 0, 0, 1, 1,
0.1229228, 1.092609, 2.393255, 1, 0, 0, 1, 1,
0.1249951, 1.269978, 2.004306, 1, 0, 0, 1, 1,
0.1345841, -0.006193607, 2.19144, 1, 0, 0, 1, 1,
0.1404596, -1.446989, 2.726192, 1, 0, 0, 1, 1,
0.1441253, 0.7896652, -0.06151295, 0, 0, 0, 1, 1,
0.1445697, 0.9469965, -0.004163099, 0, 0, 0, 1, 1,
0.1469713, 0.3699664, 0.1497866, 0, 0, 0, 1, 1,
0.1470417, -1.141462, 3.266155, 0, 0, 0, 1, 1,
0.1512014, -0.4699922, 4.453435, 0, 0, 0, 1, 1,
0.1530357, -0.002624604, 2.623597, 0, 0, 0, 1, 1,
0.1573679, -0.678373, 1.955507, 0, 0, 0, 1, 1,
0.1578519, -1.462093, 2.822788, 1, 1, 1, 1, 1,
0.1609596, 0.5633212, 0.9680422, 1, 1, 1, 1, 1,
0.1653767, 0.03373317, 2.047797, 1, 1, 1, 1, 1,
0.1662894, 0.1471659, -0.3985633, 1, 1, 1, 1, 1,
0.1664044, 1.156346, 1.86902, 1, 1, 1, 1, 1,
0.1680431, 0.6804974, 0.4732236, 1, 1, 1, 1, 1,
0.1702251, 0.996674, -0.713086, 1, 1, 1, 1, 1,
0.171705, -0.1234735, 3.359016, 1, 1, 1, 1, 1,
0.1742896, -0.7816796, 2.604382, 1, 1, 1, 1, 1,
0.1744189, 1.079835, -0.9259181, 1, 1, 1, 1, 1,
0.1773394, -1.92161, 3.44335, 1, 1, 1, 1, 1,
0.1775486, -1.473423, 2.736361, 1, 1, 1, 1, 1,
0.1849225, 0.533132, -0.2106566, 1, 1, 1, 1, 1,
0.1854666, -0.9014789, 1.937379, 1, 1, 1, 1, 1,
0.1868671, -0.2718759, 3.651366, 1, 1, 1, 1, 1,
0.1869076, -1.504654, 3.555248, 0, 0, 1, 1, 1,
0.1875807, 0.1103268, 1.010785, 1, 0, 0, 1, 1,
0.1893749, -0.1174094, 3.767277, 1, 0, 0, 1, 1,
0.1903715, 1.45586, 0.6184299, 1, 0, 0, 1, 1,
0.196151, -3.006922, 2.998947, 1, 0, 0, 1, 1,
0.196977, -1.458167, 3.399793, 1, 0, 0, 1, 1,
0.1992418, 0.836351, -2.010102, 0, 0, 0, 1, 1,
0.1996094, 0.2211371, -0.3262162, 0, 0, 0, 1, 1,
0.2035855, 1.962878, -0.3958692, 0, 0, 0, 1, 1,
0.2039083, -0.4554186, 2.49591, 0, 0, 0, 1, 1,
0.2092835, 0.461916, -0.1349438, 0, 0, 0, 1, 1,
0.2130199, -0.3623492, 3.123883, 0, 0, 0, 1, 1,
0.2133799, 0.6024623, 2.754499, 0, 0, 0, 1, 1,
0.2136645, 1.904826, -1.573379, 1, 1, 1, 1, 1,
0.2180354, 0.7480866, -0.7060366, 1, 1, 1, 1, 1,
0.2200505, 0.5538743, 2.137618, 1, 1, 1, 1, 1,
0.2201941, 1.123334, 0.597904, 1, 1, 1, 1, 1,
0.2203586, 0.8467707, 0.6036676, 1, 1, 1, 1, 1,
0.2206712, 0.1867093, 0.4972875, 1, 1, 1, 1, 1,
0.2212142, -0.3593437, 3.680905, 1, 1, 1, 1, 1,
0.2218047, 1.088006, 1.26678, 1, 1, 1, 1, 1,
0.2241887, 0.4760662, 0.9935908, 1, 1, 1, 1, 1,
0.2339874, 1.219398, 0.1409263, 1, 1, 1, 1, 1,
0.2352273, -0.9370793, 2.339494, 1, 1, 1, 1, 1,
0.2357332, -0.4677899, 3.308846, 1, 1, 1, 1, 1,
0.2395158, 1.061912, 0.6893198, 1, 1, 1, 1, 1,
0.2417858, -0.4555684, 4.14762, 1, 1, 1, 1, 1,
0.2421814, -1.256301, 4.03025, 1, 1, 1, 1, 1,
0.2429067, 1.419084, 0.5485557, 0, 0, 1, 1, 1,
0.2464715, -1.670151, 4.558115, 1, 0, 0, 1, 1,
0.2467305, -0.1723733, 1.669998, 1, 0, 0, 1, 1,
0.2486989, -0.7074051, 2.38748, 1, 0, 0, 1, 1,
0.2509013, -0.3193127, 3.057084, 1, 0, 0, 1, 1,
0.2519739, 0.5875697, -0.7400928, 1, 0, 0, 1, 1,
0.2523164, -0.1624403, 2.358116, 0, 0, 0, 1, 1,
0.2536557, -0.2987493, 3.045688, 0, 0, 0, 1, 1,
0.2550704, -0.2161536, 2.670562, 0, 0, 0, 1, 1,
0.2575249, -0.9772354, 2.392965, 0, 0, 0, 1, 1,
0.2576011, 0.7759923, -0.1774225, 0, 0, 0, 1, 1,
0.2611194, 0.007530274, 1.071896, 0, 0, 0, 1, 1,
0.2706339, -0.7032194, 0.9626143, 0, 0, 0, 1, 1,
0.2722903, 0.2285153, 2.724961, 1, 1, 1, 1, 1,
0.2728538, 0.9710233, 0.2041539, 1, 1, 1, 1, 1,
0.2742977, 1.002697, 0.3884789, 1, 1, 1, 1, 1,
0.2760467, 0.6969325, -0.7239259, 1, 1, 1, 1, 1,
0.2765166, 0.2384034, 0.833025, 1, 1, 1, 1, 1,
0.2800766, -0.8660557, 1.939371, 1, 1, 1, 1, 1,
0.2836982, 0.2246373, 0.7496467, 1, 1, 1, 1, 1,
0.2842312, 0.05017038, 1.964823, 1, 1, 1, 1, 1,
0.2877551, 0.660482, -0.6565276, 1, 1, 1, 1, 1,
0.2938446, 0.2854763, 0.9861093, 1, 1, 1, 1, 1,
0.2956298, 0.8128874, -0.1016679, 1, 1, 1, 1, 1,
0.2958451, 0.4105084, -0.2222973, 1, 1, 1, 1, 1,
0.2963316, -1.284815, 3.647214, 1, 1, 1, 1, 1,
0.2998635, 0.7766994, 0.2947487, 1, 1, 1, 1, 1,
0.3110297, -0.7116294, 3.37762, 1, 1, 1, 1, 1,
0.3125308, -0.3836369, 2.166798, 0, 0, 1, 1, 1,
0.3144969, 0.5982317, 1.911931, 1, 0, 0, 1, 1,
0.3156014, 1.161956, 1.732069, 1, 0, 0, 1, 1,
0.3206031, 0.7957382, -0.1610537, 1, 0, 0, 1, 1,
0.32571, 1.222202, -0.3802835, 1, 0, 0, 1, 1,
0.3331891, 1.241296, 0.7052187, 1, 0, 0, 1, 1,
0.3347012, -0.9180217, 3.321389, 0, 0, 0, 1, 1,
0.3360393, 0.4669285, 0.8468825, 0, 0, 0, 1, 1,
0.3397081, -1.571474, 0.1552245, 0, 0, 0, 1, 1,
0.3436234, -0.6489742, 1.422643, 0, 0, 0, 1, 1,
0.3471441, 0.4794602, 0.5786385, 0, 0, 0, 1, 1,
0.3478974, -0.8200876, 2.881584, 0, 0, 0, 1, 1,
0.3538553, 0.6545735, 0.2186911, 0, 0, 0, 1, 1,
0.3563367, -0.2076396, 0.7233933, 1, 1, 1, 1, 1,
0.3608135, 0.3140265, 0.2360994, 1, 1, 1, 1, 1,
0.3650548, 0.1601351, -0.3020807, 1, 1, 1, 1, 1,
0.3659151, -0.2356628, 1.830579, 1, 1, 1, 1, 1,
0.3671473, -0.3655967, 2.767025, 1, 1, 1, 1, 1,
0.3701833, 0.7762256, 1.669313, 1, 1, 1, 1, 1,
0.3707651, -2.184068, 1.937986, 1, 1, 1, 1, 1,
0.3711224, 1.369812, -1.420685, 1, 1, 1, 1, 1,
0.3792917, -1.355563, 3.391574, 1, 1, 1, 1, 1,
0.380986, 1.956078, -0.5662754, 1, 1, 1, 1, 1,
0.3880021, 0.6866358, 0.4922453, 1, 1, 1, 1, 1,
0.3892489, -0.7142549, 3.376384, 1, 1, 1, 1, 1,
0.392449, -0.9142757, 2.287246, 1, 1, 1, 1, 1,
0.3957825, -0.3842288, 3.433543, 1, 1, 1, 1, 1,
0.3971197, 2.028745, 0.3659571, 1, 1, 1, 1, 1,
0.3977945, -1.473784, 3.333769, 0, 0, 1, 1, 1,
0.398876, 1.48938, -0.3376205, 1, 0, 0, 1, 1,
0.3992168, -0.6296707, 1.124819, 1, 0, 0, 1, 1,
0.4062889, 0.2575331, 2.702016, 1, 0, 0, 1, 1,
0.4067383, -1.560664, 4.139539, 1, 0, 0, 1, 1,
0.4113809, -0.5653552, 2.617728, 1, 0, 0, 1, 1,
0.4141847, -0.9468241, 3.099048, 0, 0, 0, 1, 1,
0.4189796, -1.325279, 2.275392, 0, 0, 0, 1, 1,
0.4190009, 0.08188784, 2.026035, 0, 0, 0, 1, 1,
0.4245784, -2.750679, 2.324669, 0, 0, 0, 1, 1,
0.4273331, 1.085524, 0.8213667, 0, 0, 0, 1, 1,
0.4275988, -0.2072499, 1.767273, 0, 0, 0, 1, 1,
0.4373359, -0.06109025, 0.4123616, 0, 0, 0, 1, 1,
0.4422874, 0.1379861, 2.331293, 1, 1, 1, 1, 1,
0.4448155, 0.86316, 1.13142, 1, 1, 1, 1, 1,
0.4467284, 0.7038409, 0.3895831, 1, 1, 1, 1, 1,
0.4520598, -1.048374, 3.815194, 1, 1, 1, 1, 1,
0.4520949, 0.665292, 1.741068, 1, 1, 1, 1, 1,
0.4528927, 0.750912, 0.4583755, 1, 1, 1, 1, 1,
0.4550409, -0.6030694, 2.744868, 1, 1, 1, 1, 1,
0.4568323, -0.7329141, 4.302329, 1, 1, 1, 1, 1,
0.4609106, -0.7477103, 3.652607, 1, 1, 1, 1, 1,
0.4651769, -0.8528807, 4.641645, 1, 1, 1, 1, 1,
0.4659655, 0.5324061, 0.9978826, 1, 1, 1, 1, 1,
0.4690909, 1.043882, -0.7637865, 1, 1, 1, 1, 1,
0.4727286, -0.4057553, 1.94292, 1, 1, 1, 1, 1,
0.4737887, -1.111728, 1.298761, 1, 1, 1, 1, 1,
0.4760224, -1.091925, 3.143571, 1, 1, 1, 1, 1,
0.4776411, -0.4124349, 2.795199, 0, 0, 1, 1, 1,
0.4780139, -0.7524993, 2.710372, 1, 0, 0, 1, 1,
0.4830789, -0.2674831, 3.078577, 1, 0, 0, 1, 1,
0.4865771, -1.777068, 3.628355, 1, 0, 0, 1, 1,
0.4874297, -0.01285208, 3.18823, 1, 0, 0, 1, 1,
0.4886877, 1.502884, 1.173414, 1, 0, 0, 1, 1,
0.4932025, -0.2497864, 2.700875, 0, 0, 0, 1, 1,
0.5039282, 0.1062791, 1.179758, 0, 0, 0, 1, 1,
0.5051538, 1.983138, -0.02643227, 0, 0, 0, 1, 1,
0.5067133, -0.3584075, 1.831922, 0, 0, 0, 1, 1,
0.5097473, 2.402575, 0.05809769, 0, 0, 0, 1, 1,
0.5101326, 1.686539, -0.7224675, 0, 0, 0, 1, 1,
0.5111448, 1.764217, 0.9872108, 0, 0, 0, 1, 1,
0.5191681, 0.7463443, 1.274748, 1, 1, 1, 1, 1,
0.5222572, 0.2132385, 2.484062, 1, 1, 1, 1, 1,
0.5229897, -0.3000815, 5.05164, 1, 1, 1, 1, 1,
0.5262149, -0.271912, 1.740662, 1, 1, 1, 1, 1,
0.5277506, -1.780941, 2.849528, 1, 1, 1, 1, 1,
0.5345581, -1.232635, 3.832656, 1, 1, 1, 1, 1,
0.5385711, 1.854837, -0.179895, 1, 1, 1, 1, 1,
0.5410232, 1.0567, -0.3373926, 1, 1, 1, 1, 1,
0.5441517, -0.523792, 1.875944, 1, 1, 1, 1, 1,
0.5452672, -0.04638176, 3.307893, 1, 1, 1, 1, 1,
0.5483906, 1.211813, 0.319008, 1, 1, 1, 1, 1,
0.5511726, 0.2072563, -0.7983344, 1, 1, 1, 1, 1,
0.5515075, -0.6134146, 3.859822, 1, 1, 1, 1, 1,
0.5605314, -2.817553, 3.140733, 1, 1, 1, 1, 1,
0.561197, 0.1376223, 0.5329991, 1, 1, 1, 1, 1,
0.5677804, -0.2139164, 4.0536, 0, 0, 1, 1, 1,
0.5707183, -1.670963, 5.397792, 1, 0, 0, 1, 1,
0.5713873, 0.4757836, -0.765202, 1, 0, 0, 1, 1,
0.5718451, -0.1670716, 2.428545, 1, 0, 0, 1, 1,
0.5791625, 0.9684141, 0.6265169, 1, 0, 0, 1, 1,
0.5870947, -3.024111, 4.178449, 1, 0, 0, 1, 1,
0.5909412, -0.498351, 2.555038, 0, 0, 0, 1, 1,
0.5918662, 0.9630593, 0.1240586, 0, 0, 0, 1, 1,
0.5946842, -0.4655258, 2.775115, 0, 0, 0, 1, 1,
0.5992933, -0.8658637, 1.331417, 0, 0, 0, 1, 1,
0.601408, 0.09719007, 2.492542, 0, 0, 0, 1, 1,
0.6028912, -1.029959, 2.319146, 0, 0, 0, 1, 1,
0.6105938, -0.4651116, 3.145222, 0, 0, 0, 1, 1,
0.6158339, -0.3859283, 1.506577, 1, 1, 1, 1, 1,
0.6269799, -1.277001, 1.498921, 1, 1, 1, 1, 1,
0.6281605, -0.248542, 1.937157, 1, 1, 1, 1, 1,
0.630773, -1.805239, 3.929674, 1, 1, 1, 1, 1,
0.6335354, -0.4042982, 3.204179, 1, 1, 1, 1, 1,
0.6366929, 1.115349, -0.6881672, 1, 1, 1, 1, 1,
0.6412307, 0.7600145, -0.5343285, 1, 1, 1, 1, 1,
0.6468782, 0.4840672, 2.377435, 1, 1, 1, 1, 1,
0.6482289, -1.07064, 3.22168, 1, 1, 1, 1, 1,
0.6532038, -0.4700896, 1.887907, 1, 1, 1, 1, 1,
0.6557897, 0.4636889, 1.379476, 1, 1, 1, 1, 1,
0.6562617, 0.09012447, 1.46445, 1, 1, 1, 1, 1,
0.6564676, -0.9013896, 2.199981, 1, 1, 1, 1, 1,
0.6630671, -0.9257422, 1.946014, 1, 1, 1, 1, 1,
0.669356, 0.2856853, 0.218736, 1, 1, 1, 1, 1,
0.6698365, -0.4403244, 3.508307, 0, 0, 1, 1, 1,
0.6704185, -0.0413067, 0.6663446, 1, 0, 0, 1, 1,
0.6781311, 0.3009745, 1.277956, 1, 0, 0, 1, 1,
0.6801456, 1.518402, 0.6465858, 1, 0, 0, 1, 1,
0.6824876, 0.612967, 2.487753, 1, 0, 0, 1, 1,
0.6830317, 0.7357435, 2.151051, 1, 0, 0, 1, 1,
0.6853492, -0.7151026, 2.755357, 0, 0, 0, 1, 1,
0.6866857, 0.1400658, 0.6997024, 0, 0, 0, 1, 1,
0.6921555, 2.661838, 0.8673762, 0, 0, 0, 1, 1,
0.6962183, -0.637217, 2.611749, 0, 0, 0, 1, 1,
0.7026669, -0.8912475, 4.380747, 0, 0, 0, 1, 1,
0.7075236, 0.114302, 2.247524, 0, 0, 0, 1, 1,
0.7103767, -0.03430323, 1.717154, 0, 0, 0, 1, 1,
0.7130532, -2.028985, 3.206158, 1, 1, 1, 1, 1,
0.722795, -0.2265015, 3.588877, 1, 1, 1, 1, 1,
0.7228678, -0.7482865, 3.136556, 1, 1, 1, 1, 1,
0.7230806, 2.049625, 0.7841951, 1, 1, 1, 1, 1,
0.7283385, -0.01322942, 1.288848, 1, 1, 1, 1, 1,
0.7363046, -0.4193225, 3.299693, 1, 1, 1, 1, 1,
0.7369807, 0.8259777, 0.1419669, 1, 1, 1, 1, 1,
0.7438931, 0.7776549, -0.1707377, 1, 1, 1, 1, 1,
0.7445402, -1.114443, 2.675168, 1, 1, 1, 1, 1,
0.746951, -0.4842496, 1.836636, 1, 1, 1, 1, 1,
0.7528859, 2.252093, 1.291926, 1, 1, 1, 1, 1,
0.7553718, -0.3244592, 0.7349332, 1, 1, 1, 1, 1,
0.7606654, -0.1207753, 2.093905, 1, 1, 1, 1, 1,
0.7623127, -0.5660376, 3.354376, 1, 1, 1, 1, 1,
0.7635219, 1.015164, 0.3764656, 1, 1, 1, 1, 1,
0.7757983, 0.8514039, 1.134126, 0, 0, 1, 1, 1,
0.7818398, 0.01478933, 2.870623, 1, 0, 0, 1, 1,
0.7846531, 1.3131, -0.2823078, 1, 0, 0, 1, 1,
0.7936288, -1.493691, 1.341971, 1, 0, 0, 1, 1,
0.7961504, 0.3183321, 2.644637, 1, 0, 0, 1, 1,
0.7973806, 0.6335429, 0.9284581, 1, 0, 0, 1, 1,
0.8017561, -1.0888, 1.507195, 0, 0, 0, 1, 1,
0.8027973, 0.8723457, -0.3157244, 0, 0, 0, 1, 1,
0.8038683, 0.6023139, 0.5294443, 0, 0, 0, 1, 1,
0.8081113, 0.08416095, 0.6551141, 0, 0, 0, 1, 1,
0.8085856, 0.7721696, 0.8996406, 0, 0, 0, 1, 1,
0.808753, 0.3168164, 1.409813, 0, 0, 0, 1, 1,
0.8091596, -0.6041902, 2.196287, 0, 0, 0, 1, 1,
0.8137327, -0.6777694, 3.528698, 1, 1, 1, 1, 1,
0.8143849, -0.6341622, 2.866018, 1, 1, 1, 1, 1,
0.8223665, 0.9854206, 0.7384491, 1, 1, 1, 1, 1,
0.8263112, 1.316439, 2.099491, 1, 1, 1, 1, 1,
0.8275059, 0.6322088, 0.8127361, 1, 1, 1, 1, 1,
0.8281126, -1.924057, 3.879884, 1, 1, 1, 1, 1,
0.8316675, -1.613426, 2.866637, 1, 1, 1, 1, 1,
0.8375008, -0.1865792, 5.04967, 1, 1, 1, 1, 1,
0.8391365, 0.2100625, 2.317888, 1, 1, 1, 1, 1,
0.8439042, 1.278267, 1.089832, 1, 1, 1, 1, 1,
0.8516744, 2.619912, 0.1138324, 1, 1, 1, 1, 1,
0.8530437, 0.2922711, -0.3417002, 1, 1, 1, 1, 1,
0.8629754, 1.288809, 0.9112188, 1, 1, 1, 1, 1,
0.8651081, 1.951708, -0.5038909, 1, 1, 1, 1, 1,
0.8728991, 1.091947, 1.235472, 1, 1, 1, 1, 1,
0.8734041, -0.8205898, 2.81946, 0, 0, 1, 1, 1,
0.877035, 0.2194691, 1.912204, 1, 0, 0, 1, 1,
0.8823442, 1.45682, 0.5216808, 1, 0, 0, 1, 1,
0.8829958, 1.22343, -0.0830281, 1, 0, 0, 1, 1,
0.8927026, -0.8122952, 4.090436, 1, 0, 0, 1, 1,
0.8937679, 1.244807, 0.4324189, 1, 0, 0, 1, 1,
0.8958443, -0.001436006, 2.271441, 0, 0, 0, 1, 1,
0.8968864, 0.441386, 3.504732, 0, 0, 0, 1, 1,
0.8969423, -0.005425296, -0.1169606, 0, 0, 0, 1, 1,
0.8973006, -0.9238721, 2.283836, 0, 0, 0, 1, 1,
0.9035143, -0.5192829, 2.404373, 0, 0, 0, 1, 1,
0.9041228, -0.1105617, 0.4158384, 0, 0, 0, 1, 1,
0.9080658, 0.7788056, -0.07629509, 0, 0, 0, 1, 1,
0.9084691, -0.084424, 3.47109, 1, 1, 1, 1, 1,
0.9104084, 0.3959887, 0.3196647, 1, 1, 1, 1, 1,
0.9262646, -0.5944936, 3.324248, 1, 1, 1, 1, 1,
0.9322456, 0.9651003, 2.14204, 1, 1, 1, 1, 1,
0.9337704, -1.177279, 2.369972, 1, 1, 1, 1, 1,
0.9343498, 0.4859924, 2.503783, 1, 1, 1, 1, 1,
0.9344561, -0.1210984, 1.574363, 1, 1, 1, 1, 1,
0.9348239, -0.2246802, 1.50075, 1, 1, 1, 1, 1,
0.9359104, -0.04951946, 2.275679, 1, 1, 1, 1, 1,
0.9420234, -2.022717, 3.13957, 1, 1, 1, 1, 1,
0.9439824, 0.5106072, 1.456274, 1, 1, 1, 1, 1,
0.9479159, -0.447796, 3.583468, 1, 1, 1, 1, 1,
0.9497287, -2.746625, 3.052705, 1, 1, 1, 1, 1,
0.9544743, -0.705006, 1.588728, 1, 1, 1, 1, 1,
0.9567499, 1.904674, 0.5768176, 1, 1, 1, 1, 1,
0.9608114, 0.743363, 2.512598, 0, 0, 1, 1, 1,
0.9638604, 1.269291, 0.9807894, 1, 0, 0, 1, 1,
0.9656839, -0.8232587, 2.256545, 1, 0, 0, 1, 1,
0.9790664, 0.1320682, 0.831684, 1, 0, 0, 1, 1,
0.9793561, -0.889809, 2.611503, 1, 0, 0, 1, 1,
0.9916355, -0.5441393, 0.3151295, 1, 0, 0, 1, 1,
0.9957076, 0.05134391, 0.6749282, 0, 0, 0, 1, 1,
0.9998112, 0.1522858, 2.012564, 0, 0, 0, 1, 1,
0.9999179, -0.8752664, 2.538647, 0, 0, 0, 1, 1,
1.004971, -2.892602, 2.799973, 0, 0, 0, 1, 1,
1.009798, -1.411253, 1.48429, 0, 0, 0, 1, 1,
1.013647, -0.9643935, 4.823889, 0, 0, 0, 1, 1,
1.015191, -0.9831131, 3.480685, 0, 0, 0, 1, 1,
1.022896, -1.3442, 2.384573, 1, 1, 1, 1, 1,
1.025567, 1.609585, -0.2435198, 1, 1, 1, 1, 1,
1.038185, 0.7378443, 0.5458007, 1, 1, 1, 1, 1,
1.03911, -0.02348796, 1.199578, 1, 1, 1, 1, 1,
1.055842, 0.3286256, 0.7688103, 1, 1, 1, 1, 1,
1.057898, 0.9716561, 1.663751, 1, 1, 1, 1, 1,
1.065338, -0.01095712, 1.395478, 1, 1, 1, 1, 1,
1.07805, -0.8268918, 0.8924672, 1, 1, 1, 1, 1,
1.080509, 0.4225093, -0.3329161, 1, 1, 1, 1, 1,
1.089972, -0.670677, 0.776583, 1, 1, 1, 1, 1,
1.0983, -1.902122, 2.05999, 1, 1, 1, 1, 1,
1.110704, -0.0920627, 1.939028, 1, 1, 1, 1, 1,
1.115852, 0.8388908, 1.919942, 1, 1, 1, 1, 1,
1.115901, 0.4297641, 1.27491, 1, 1, 1, 1, 1,
1.131527, 0.03218132, 2.882104, 1, 1, 1, 1, 1,
1.131569, -0.4900387, 0.8201395, 0, 0, 1, 1, 1,
1.133155, -2.099524, 1.246293, 1, 0, 0, 1, 1,
1.133791, -1.155046, 2.233806, 1, 0, 0, 1, 1,
1.135106, 0.3015682, 1.273849, 1, 0, 0, 1, 1,
1.140882, -2.512535, 4.769316, 1, 0, 0, 1, 1,
1.141579, -0.5988088, 2.578732, 1, 0, 0, 1, 1,
1.14491, 0.6363038, 2.208429, 0, 0, 0, 1, 1,
1.150071, 0.9277283, 1.13175, 0, 0, 0, 1, 1,
1.152692, 1.120864, 1.673706, 0, 0, 0, 1, 1,
1.158546, -1.307566, 2.510361, 0, 0, 0, 1, 1,
1.169223, 0.1641955, 1.649342, 0, 0, 0, 1, 1,
1.173349, 0.4558959, 1.025755, 0, 0, 0, 1, 1,
1.178826, 0.6460097, 0.9657178, 0, 0, 0, 1, 1,
1.179079, 0.1871852, 3.511342, 1, 1, 1, 1, 1,
1.19343, -0.2629704, 1.44765, 1, 1, 1, 1, 1,
1.195295, -2.39979, 1.791479, 1, 1, 1, 1, 1,
1.197553, 1.612782, 0.004488739, 1, 1, 1, 1, 1,
1.206701, -0.3745913, 1.998263, 1, 1, 1, 1, 1,
1.207845, 0.003246152, 2.282837, 1, 1, 1, 1, 1,
1.218828, -0.07348697, 1.022103, 1, 1, 1, 1, 1,
1.220799, -1.825024, 1.65755, 1, 1, 1, 1, 1,
1.220863, -1.369004, 0.9175242, 1, 1, 1, 1, 1,
1.221919, 1.992633, 2.207747, 1, 1, 1, 1, 1,
1.223457, -0.575009, 3.451598, 1, 1, 1, 1, 1,
1.237864, -1.367939, 1.363648, 1, 1, 1, 1, 1,
1.245066, 2.213578, -0.6906478, 1, 1, 1, 1, 1,
1.258967, 0.5846983, 0.9857473, 1, 1, 1, 1, 1,
1.269411, -0.6339217, 2.11555, 1, 1, 1, 1, 1,
1.285853, -1.500498, 2.369658, 0, 0, 1, 1, 1,
1.286743, 0.4749095, 0.1009661, 1, 0, 0, 1, 1,
1.288408, -0.3372264, 0.6778176, 1, 0, 0, 1, 1,
1.294745, -1.360454, 1.63478, 1, 0, 0, 1, 1,
1.298973, 0.5594616, 2.170521, 1, 0, 0, 1, 1,
1.305413, 0.8875933, 1.333466, 1, 0, 0, 1, 1,
1.315733, -1.529432, 0.9008099, 0, 0, 0, 1, 1,
1.319387, -0.05813025, 1.596924, 0, 0, 0, 1, 1,
1.330037, 0.9727063, -0.491217, 0, 0, 0, 1, 1,
1.338588, 0.1470734, 0.000177549, 0, 0, 0, 1, 1,
1.344247, -0.6589771, 2.071402, 0, 0, 0, 1, 1,
1.349576, 0.3252448, 3.102312, 0, 0, 0, 1, 1,
1.35011, -0.4188626, 1.083615, 0, 0, 0, 1, 1,
1.350748, -0.7612985, 3.624759, 1, 1, 1, 1, 1,
1.357567, 0.4190668, 0.01854067, 1, 1, 1, 1, 1,
1.364144, 0.08236338, 1.494238, 1, 1, 1, 1, 1,
1.373197, -1.081273, 1.739627, 1, 1, 1, 1, 1,
1.375036, 1.056974, 0.7632558, 1, 1, 1, 1, 1,
1.389182, -0.6591002, 1.763513, 1, 1, 1, 1, 1,
1.401767, 0.7855911, 0.5469698, 1, 1, 1, 1, 1,
1.403207, -0.1402752, 0.5482687, 1, 1, 1, 1, 1,
1.416906, 1.11976, 0.6827115, 1, 1, 1, 1, 1,
1.424939, -1.679576, 4.371935, 1, 1, 1, 1, 1,
1.426387, 0.6792238, 0.9619471, 1, 1, 1, 1, 1,
1.432707, 0.253362, 1.422931, 1, 1, 1, 1, 1,
1.439621, -0.453537, 0.5242199, 1, 1, 1, 1, 1,
1.439724, 0.04129404, 1.939187, 1, 1, 1, 1, 1,
1.443421, -0.8736095, 1.391506, 1, 1, 1, 1, 1,
1.446113, 1.120157, 2.708911, 0, 0, 1, 1, 1,
1.453881, -0.5159637, 3.40852, 1, 0, 0, 1, 1,
1.459345, 1.23558, -1.214199, 1, 0, 0, 1, 1,
1.467036, 0.319148, -1.082453, 1, 0, 0, 1, 1,
1.469857, 0.264121, 1.537406, 1, 0, 0, 1, 1,
1.470548, -0.1595773, 0.6739988, 1, 0, 0, 1, 1,
1.478315, 0.04462136, 0.8421311, 0, 0, 0, 1, 1,
1.495178, 0.5528164, 1.916717, 0, 0, 0, 1, 1,
1.498914, 0.3256464, -0.01789274, 0, 0, 0, 1, 1,
1.516938, 0.7841194, 0.9890169, 0, 0, 0, 1, 1,
1.518014, -1.039126, 2.231249, 0, 0, 0, 1, 1,
1.522947, 0.2745893, -0.3804125, 0, 0, 0, 1, 1,
1.542949, 0.4677764, -0.6688063, 0, 0, 0, 1, 1,
1.549229, -0.0134085, 1.080819, 1, 1, 1, 1, 1,
1.566849, -0.1451235, 1.023404, 1, 1, 1, 1, 1,
1.568414, -0.04605346, 1.293745, 1, 1, 1, 1, 1,
1.611851, 0.7813904, 0.8600428, 1, 1, 1, 1, 1,
1.613999, -1.131551, 1.286263, 1, 1, 1, 1, 1,
1.615412, 1.076149, 1.544029, 1, 1, 1, 1, 1,
1.624014, 0.03535739, 0.9580526, 1, 1, 1, 1, 1,
1.646621, 1.194126, 1.48717, 1, 1, 1, 1, 1,
1.658818, 2.429059, 1.940264, 1, 1, 1, 1, 1,
1.663895, 0.4514376, 0.7827846, 1, 1, 1, 1, 1,
1.664435, -0.9762065, 1.462117, 1, 1, 1, 1, 1,
1.665129, 1.578718, 1.842963, 1, 1, 1, 1, 1,
1.668512, -3.021812, 1.576359, 1, 1, 1, 1, 1,
1.669319, -2.450226, 2.537797, 1, 1, 1, 1, 1,
1.677501, -1.751582, 2.144424, 1, 1, 1, 1, 1,
1.686687, -2.099869, 3.710586, 0, 0, 1, 1, 1,
1.699737, -0.3364563, 2.946191, 1, 0, 0, 1, 1,
1.703607, -0.4622457, 2.433442, 1, 0, 0, 1, 1,
1.706219, -1.067825, 2.742835, 1, 0, 0, 1, 1,
1.720495, -1.917101, 2.613502, 1, 0, 0, 1, 1,
1.726266, -0.2765397, 3.298426, 1, 0, 0, 1, 1,
1.766733, 0.416796, 2.447587, 0, 0, 0, 1, 1,
1.778049, 0.04405139, 0.4126539, 0, 0, 0, 1, 1,
1.798385, 0.2431283, 0.9284229, 0, 0, 0, 1, 1,
1.805259, 1.217052, 2.897102, 0, 0, 0, 1, 1,
1.812308, 0.6335459, 1.613201, 0, 0, 0, 1, 1,
1.816823, -0.7617477, 0.08969261, 0, 0, 0, 1, 1,
1.818015, 0.4014558, 0.9769195, 0, 0, 0, 1, 1,
1.830428, 0.311088, 2.903533, 1, 1, 1, 1, 1,
1.840594, -1.822752, 2.295624, 1, 1, 1, 1, 1,
1.905744, -0.4986394, 2.07595, 1, 1, 1, 1, 1,
1.91183, -1.85831, 0.5691152, 1, 1, 1, 1, 1,
1.943647, -0.4461221, 3.081059, 1, 1, 1, 1, 1,
1.964187, -0.3851781, 2.536621, 1, 1, 1, 1, 1,
1.971245, 1.295138, 2.745413, 1, 1, 1, 1, 1,
2.004144, 0.9947332, 0.2761656, 1, 1, 1, 1, 1,
2.039122, -0.02729985, 2.181174, 1, 1, 1, 1, 1,
2.085022, 1.451981, -0.6090435, 1, 1, 1, 1, 1,
2.101456, -0.7707474, 0.9022452, 1, 1, 1, 1, 1,
2.136027, 0.6924189, -0.3391635, 1, 1, 1, 1, 1,
2.208081, 0.6701509, 0.7760453, 1, 1, 1, 1, 1,
2.209963, 0.1166128, 1.719571, 1, 1, 1, 1, 1,
2.221091, 0.4201535, 1.668969, 1, 1, 1, 1, 1,
2.23709, 1.520001, -0.5219921, 0, 0, 1, 1, 1,
2.256989, -0.6058628, 0.8385696, 1, 0, 0, 1, 1,
2.281461, -1.114534, 2.995889, 1, 0, 0, 1, 1,
2.300345, 0.2953191, 2.774031, 1, 0, 0, 1, 1,
2.312777, 0.2595187, -0.4566219, 1, 0, 0, 1, 1,
2.38966, 0.1308368, 1.133797, 1, 0, 0, 1, 1,
2.425328, 0.1906698, 4.691772, 0, 0, 0, 1, 1,
2.489496, -0.2105186, 3.05373, 0, 0, 0, 1, 1,
2.491499, -1.327534, 1.979884, 0, 0, 0, 1, 1,
2.546909, 0.8730388, 0.6155096, 0, 0, 0, 1, 1,
2.554929, 0.5009114, -0.4264627, 0, 0, 0, 1, 1,
2.61777, 0.9982303, 0.476712, 0, 0, 0, 1, 1,
2.733375, -2.174502, 1.390482, 0, 0, 0, 1, 1,
2.764219, -0.869912, 2.491301, 1, 1, 1, 1, 1,
2.908299, 0.7111726, 1.213921, 1, 1, 1, 1, 1,
2.911518, 1.062002, 0.9129621, 1, 1, 1, 1, 1,
2.993494, 0.1571532, 1.911846, 1, 1, 1, 1, 1,
3.240461, -1.227749, 4.091412, 1, 1, 1, 1, 1,
3.32045, 0.3994831, 1.012357, 1, 1, 1, 1, 1,
3.517063, 0.2220087, 1.471703, 1, 1, 1, 1, 1
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
var radius = 9.722857;
var distance = 34.15112;
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
mvMatrix.translate( 0.08897185, -0.02479362, -0.1610513 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15112);
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
