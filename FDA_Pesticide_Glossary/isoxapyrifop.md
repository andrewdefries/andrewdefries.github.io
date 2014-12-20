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
-3.581187, -2.274956, 0.0680692, 1, 0, 0, 1,
-3.471972, -0.857011, -0.574415, 1, 0.007843138, 0, 1,
-2.50308, -0.6032132, -3.531789, 1, 0.01176471, 0, 1,
-2.453561, -0.3192026, -3.551563, 1, 0.01960784, 0, 1,
-2.393618, 0.1626082, -2.011838, 1, 0.02352941, 0, 1,
-2.392309, -0.1034945, -1.242623, 1, 0.03137255, 0, 1,
-2.280659, -0.2925172, -0.8795615, 1, 0.03529412, 0, 1,
-2.263097, 0.2671021, -2.667058, 1, 0.04313726, 0, 1,
-2.246206, 0.6888781, -2.435958, 1, 0.04705882, 0, 1,
-2.24558, 0.7464231, -2.091898, 1, 0.05490196, 0, 1,
-2.211608, -1.259903, -1.133897, 1, 0.05882353, 0, 1,
-2.186373, 0.8207926, -1.303186, 1, 0.06666667, 0, 1,
-2.162672, -0.2523672, -4.366004, 1, 0.07058824, 0, 1,
-2.159936, -0.0715684, -1.667646, 1, 0.07843138, 0, 1,
-2.136647, -1.254886, -1.938903, 1, 0.08235294, 0, 1,
-2.129046, 0.8062394, -3.427264, 1, 0.09019608, 0, 1,
-2.111528, -0.3350306, -0.9315563, 1, 0.09411765, 0, 1,
-2.088621, -1.086009, -2.630201, 1, 0.1019608, 0, 1,
-2.066206, -0.3608696, 0.2864217, 1, 0.1098039, 0, 1,
-2.053084, 0.1291753, -1.732124, 1, 0.1137255, 0, 1,
-2.050512, 0.8430526, -0.0619988, 1, 0.1215686, 0, 1,
-2.020069, 0.3029903, -0.9043984, 1, 0.1254902, 0, 1,
-2.005083, 1.382874, -2.810181, 1, 0.1333333, 0, 1,
-1.991985, 0.5236852, -2.265261, 1, 0.1372549, 0, 1,
-1.981914, -0.6957392, -2.356686, 1, 0.145098, 0, 1,
-1.978677, 1.365484, 0.1332587, 1, 0.1490196, 0, 1,
-1.954172, 0.507039, -0.8736871, 1, 0.1568628, 0, 1,
-1.951378, -1.012404, -3.983544, 1, 0.1607843, 0, 1,
-1.930636, 0.7647669, -2.156921, 1, 0.1686275, 0, 1,
-1.928629, 0.5718499, -2.17357, 1, 0.172549, 0, 1,
-1.920974, 0.4947883, -1.014509, 1, 0.1803922, 0, 1,
-1.902828, 0.2172605, -1.316029, 1, 0.1843137, 0, 1,
-1.89716, -1.769451, -2.529213, 1, 0.1921569, 0, 1,
-1.873013, 0.163269, -1.333956, 1, 0.1960784, 0, 1,
-1.867807, 1.732178, 0.08469588, 1, 0.2039216, 0, 1,
-1.840953, -0.2279959, -1.897269, 1, 0.2117647, 0, 1,
-1.833922, -1.046253, -3.154011, 1, 0.2156863, 0, 1,
-1.820461, -0.8466145, -0.8650716, 1, 0.2235294, 0, 1,
-1.817942, 1.418697, -2.316043, 1, 0.227451, 0, 1,
-1.809584, 0.5182428, -1.204136, 1, 0.2352941, 0, 1,
-1.792645, -1.661603, -3.151986, 1, 0.2392157, 0, 1,
-1.78895, -0.1342203, -1.492162, 1, 0.2470588, 0, 1,
-1.772064, 0.5852332, -0.9663375, 1, 0.2509804, 0, 1,
-1.769762, -0.3889084, -0.5315494, 1, 0.2588235, 0, 1,
-1.763462, 1.186414, -2.862822, 1, 0.2627451, 0, 1,
-1.748688, 0.8373378, -1.45859, 1, 0.2705882, 0, 1,
-1.748223, 1.048855, 0.2201317, 1, 0.2745098, 0, 1,
-1.747694, 0.8345031, -0.07876739, 1, 0.282353, 0, 1,
-1.731333, 0.1120636, -1.838874, 1, 0.2862745, 0, 1,
-1.724134, 0.6433503, -2.323626, 1, 0.2941177, 0, 1,
-1.707462, 0.5417287, -0.9850009, 1, 0.3019608, 0, 1,
-1.70376, -2.02476, -1.911069, 1, 0.3058824, 0, 1,
-1.687987, -0.533173, -1.022926, 1, 0.3137255, 0, 1,
-1.682962, 0.3450224, -0.6885487, 1, 0.3176471, 0, 1,
-1.679762, 1.378371, -2.158067, 1, 0.3254902, 0, 1,
-1.676712, -0.1467481, -1.203709, 1, 0.3294118, 0, 1,
-1.655857, 1.071108, -1.021011, 1, 0.3372549, 0, 1,
-1.655673, -0.1549938, -1.859221, 1, 0.3411765, 0, 1,
-1.653893, -1.56005, -3.39633, 1, 0.3490196, 0, 1,
-1.649297, -0.05519978, -1.322152, 1, 0.3529412, 0, 1,
-1.645375, 0.9699336, -1.616623, 1, 0.3607843, 0, 1,
-1.629701, 0.831492, -0.7472429, 1, 0.3647059, 0, 1,
-1.588601, -1.070076, -0.09022828, 1, 0.372549, 0, 1,
-1.568113, -1.145616, -2.793656, 1, 0.3764706, 0, 1,
-1.560991, 0.7350885, -0.2080054, 1, 0.3843137, 0, 1,
-1.542421, 0.8533791, 0.4379832, 1, 0.3882353, 0, 1,
-1.536329, 0.2755135, -1.110764, 1, 0.3960784, 0, 1,
-1.528157, -0.05797239, -0.5242629, 1, 0.4039216, 0, 1,
-1.509186, -1.158277, -1.273659, 1, 0.4078431, 0, 1,
-1.489359, 1.304267, 0.2294433, 1, 0.4156863, 0, 1,
-1.488482, -1.555401, -1.68691, 1, 0.4196078, 0, 1,
-1.481406, 0.7035037, 0.5271182, 1, 0.427451, 0, 1,
-1.481399, 0.2271898, -0.5227746, 1, 0.4313726, 0, 1,
-1.469378, 1.719349, -0.02278008, 1, 0.4392157, 0, 1,
-1.450536, 0.05184739, 0.07092123, 1, 0.4431373, 0, 1,
-1.448617, 0.6115085, -1.525575, 1, 0.4509804, 0, 1,
-1.42682, 0.6724002, -0.8425367, 1, 0.454902, 0, 1,
-1.426537, 0.9321146, -0.9489803, 1, 0.4627451, 0, 1,
-1.407684, -0.5453375, -0.3693204, 1, 0.4666667, 0, 1,
-1.407555, -1.643572, -2.596237, 1, 0.4745098, 0, 1,
-1.392172, 1.071475, -1.561275, 1, 0.4784314, 0, 1,
-1.389643, 0.6450078, -1.750295, 1, 0.4862745, 0, 1,
-1.385353, 0.9515182, 0.009217981, 1, 0.4901961, 0, 1,
-1.382131, -0.7413858, -2.862014, 1, 0.4980392, 0, 1,
-1.379702, -1.202827, -2.589283, 1, 0.5058824, 0, 1,
-1.376828, -0.7794793, -0.6597438, 1, 0.509804, 0, 1,
-1.372651, 2.293143, -0.1976091, 1, 0.5176471, 0, 1,
-1.360905, 0.9019884, -1.790885, 1, 0.5215687, 0, 1,
-1.360687, 1.506344, -0.9049976, 1, 0.5294118, 0, 1,
-1.359335, 0.5168195, -1.100361, 1, 0.5333334, 0, 1,
-1.352556, -0.01949597, -1.625996, 1, 0.5411765, 0, 1,
-1.349114, 0.7933617, -0.1471523, 1, 0.5450981, 0, 1,
-1.342193, 0.5319949, -1.060392, 1, 0.5529412, 0, 1,
-1.337259, 0.1732783, -0.6708131, 1, 0.5568628, 0, 1,
-1.336328, 1.682845, -0.3954816, 1, 0.5647059, 0, 1,
-1.328376, -1.286711, -1.832369, 1, 0.5686275, 0, 1,
-1.319816, 0.08975976, -1.634911, 1, 0.5764706, 0, 1,
-1.314137, -0.002350596, -1.281271, 1, 0.5803922, 0, 1,
-1.306915, -1.945038, -3.681006, 1, 0.5882353, 0, 1,
-1.293155, -1.339006, -2.629539, 1, 0.5921569, 0, 1,
-1.284924, 0.8544654, 0.2477623, 1, 0.6, 0, 1,
-1.282422, 0.2223351, -2.359727, 1, 0.6078432, 0, 1,
-1.280779, 0.3637489, -1.546862, 1, 0.6117647, 0, 1,
-1.278271, 0.8463902, -0.3534591, 1, 0.6196079, 0, 1,
-1.277649, 0.3932201, -2.645488, 1, 0.6235294, 0, 1,
-1.271227, 0.2267138, -1.471446, 1, 0.6313726, 0, 1,
-1.260858, -0.4030461, -1.71182, 1, 0.6352941, 0, 1,
-1.25993, 0.002734636, -0.8491533, 1, 0.6431373, 0, 1,
-1.249405, 0.6335907, -1.676943, 1, 0.6470588, 0, 1,
-1.249359, 0.6231731, -1.23202, 1, 0.654902, 0, 1,
-1.245481, -1.267222, -0.7844862, 1, 0.6588235, 0, 1,
-1.245248, 0.9550908, -1.750599, 1, 0.6666667, 0, 1,
-1.24217, 0.4171739, 1.122052, 1, 0.6705883, 0, 1,
-1.2399, -1.217732, -3.698584, 1, 0.6784314, 0, 1,
-1.229315, -0.6212509, -2.994607, 1, 0.682353, 0, 1,
-1.223366, -0.01080013, -1.11823, 1, 0.6901961, 0, 1,
-1.216223, -0.8788934, -2.501279, 1, 0.6941177, 0, 1,
-1.212026, -0.05349914, -2.246095, 1, 0.7019608, 0, 1,
-1.209504, -0.07102975, -3.193886, 1, 0.7098039, 0, 1,
-1.204594, 0.430883, -1.234364, 1, 0.7137255, 0, 1,
-1.201734, -0.7089629, -1.115338, 1, 0.7215686, 0, 1,
-1.19821, 0.2299018, -1.767485, 1, 0.7254902, 0, 1,
-1.189683, 1.744876, -0.438015, 1, 0.7333333, 0, 1,
-1.188905, 0.9336504, -1.638221, 1, 0.7372549, 0, 1,
-1.185482, -0.7543178, -3.879842, 1, 0.7450981, 0, 1,
-1.182391, 0.4652848, -2.390159, 1, 0.7490196, 0, 1,
-1.178141, -0.7095895, -2.500129, 1, 0.7568628, 0, 1,
-1.172075, 1.305772, -2.153094, 1, 0.7607843, 0, 1,
-1.172019, -0.1331032, -1.946597, 1, 0.7686275, 0, 1,
-1.17175, -0.09604036, -1.3088, 1, 0.772549, 0, 1,
-1.161461, 1.474199, -0.4733617, 1, 0.7803922, 0, 1,
-1.15884, 0.2072742, -2.140294, 1, 0.7843137, 0, 1,
-1.157858, 0.936472, 0.001293469, 1, 0.7921569, 0, 1,
-1.155083, -0.5243966, -1.149428, 1, 0.7960784, 0, 1,
-1.154305, 0.3440399, -0.00294494, 1, 0.8039216, 0, 1,
-1.151099, 0.8558009, -1.622614, 1, 0.8117647, 0, 1,
-1.148462, -0.1402268, -0.7577496, 1, 0.8156863, 0, 1,
-1.135794, 0.07075136, -2.128471, 1, 0.8235294, 0, 1,
-1.134301, -1.481361, -3.070333, 1, 0.827451, 0, 1,
-1.132132, 0.7356701, -0.9236842, 1, 0.8352941, 0, 1,
-1.132004, -1.741872, -1.844219, 1, 0.8392157, 0, 1,
-1.122639, 0.06881741, -0.6965504, 1, 0.8470588, 0, 1,
-1.116825, -1.684172, -3.359979, 1, 0.8509804, 0, 1,
-1.115945, -0.9416529, -2.457183, 1, 0.8588235, 0, 1,
-1.108688, 0.09683193, -0.8092051, 1, 0.8627451, 0, 1,
-1.108377, -0.9505321, -3.479743, 1, 0.8705882, 0, 1,
-1.10824, -0.2962854, -3.036793, 1, 0.8745098, 0, 1,
-1.107812, 1.239638, -1.450971, 1, 0.8823529, 0, 1,
-1.103747, -1.449731, -2.88043, 1, 0.8862745, 0, 1,
-1.101756, -0.3100254, -1.995691, 1, 0.8941177, 0, 1,
-1.070143, -1.533959, -1.454169, 1, 0.8980392, 0, 1,
-1.069842, -0.963755, -3.252038, 1, 0.9058824, 0, 1,
-1.061441, 0.6033675, -1.153178, 1, 0.9137255, 0, 1,
-1.059414, -0.3245475, -1.135137, 1, 0.9176471, 0, 1,
-1.058877, 0.124032, -1.204929, 1, 0.9254902, 0, 1,
-1.054747, 0.7271969, -1.06058, 1, 0.9294118, 0, 1,
-1.042085, 0.2631083, -2.129015, 1, 0.9372549, 0, 1,
-1.040356, 0.09572752, -0.333585, 1, 0.9411765, 0, 1,
-1.038565, 0.09649348, -0.9185899, 1, 0.9490196, 0, 1,
-1.034728, -1.844341, -2.207386, 1, 0.9529412, 0, 1,
-1.030655, -1.53052, -2.221131, 1, 0.9607843, 0, 1,
-1.030306, 2.001331, -0.6609696, 1, 0.9647059, 0, 1,
-1.030041, -0.1944435, -1.73654, 1, 0.972549, 0, 1,
-1.026635, -0.04006921, -3.833944, 1, 0.9764706, 0, 1,
-1.020087, 0.5630326, -0.6765891, 1, 0.9843137, 0, 1,
-1.009589, 0.3138325, -2.570188, 1, 0.9882353, 0, 1,
-1.009438, 0.604993, -0.04573917, 1, 0.9960784, 0, 1,
-1.006842, 2.471766, -0.5298942, 0.9960784, 1, 0, 1,
-1.004803, 2.114598, 0.2600691, 0.9921569, 1, 0, 1,
-0.9974309, -1.196367, -2.634673, 0.9843137, 1, 0, 1,
-0.9969681, 0.4595862, -0.6006981, 0.9803922, 1, 0, 1,
-0.9962875, -1.708077, -1.855955, 0.972549, 1, 0, 1,
-0.9907455, -0.2278681, -2.072491, 0.9686275, 1, 0, 1,
-0.9907092, 0.6845207, -3.229796, 0.9607843, 1, 0, 1,
-0.9844927, 0.0953709, -2.026515, 0.9568627, 1, 0, 1,
-0.9791542, -0.5400129, -4.80617, 0.9490196, 1, 0, 1,
-0.9732613, 0.348551, -2.662668, 0.945098, 1, 0, 1,
-0.9720214, -0.5804332, -1.82562, 0.9372549, 1, 0, 1,
-0.960641, -1.210127, -2.398034, 0.9333333, 1, 0, 1,
-0.9591646, -1.577905, -2.210487, 0.9254902, 1, 0, 1,
-0.9588276, 0.5440894, 0.2659407, 0.9215686, 1, 0, 1,
-0.9560586, 0.08545757, -2.180371, 0.9137255, 1, 0, 1,
-0.9549591, 1.265756, -0.2750573, 0.9098039, 1, 0, 1,
-0.9534764, 0.6357616, -3.367616, 0.9019608, 1, 0, 1,
-0.9410888, 0.6110711, -0.3637972, 0.8941177, 1, 0, 1,
-0.9401761, -0.6634516, -2.842723, 0.8901961, 1, 0, 1,
-0.9336167, -1.033321, -3.615363, 0.8823529, 1, 0, 1,
-0.932913, 0.7679003, -1.364455, 0.8784314, 1, 0, 1,
-0.9303871, -0.9699314, -3.088431, 0.8705882, 1, 0, 1,
-0.9217695, 0.4094636, 0.8949286, 0.8666667, 1, 0, 1,
-0.9208204, -0.5297267, -4.091566, 0.8588235, 1, 0, 1,
-0.9197132, -0.4624456, -2.60773, 0.854902, 1, 0, 1,
-0.9109794, -0.830996, -1.107906, 0.8470588, 1, 0, 1,
-0.9099627, -1.763195, -2.05004, 0.8431373, 1, 0, 1,
-0.9058083, 0.09663352, 0.2689813, 0.8352941, 1, 0, 1,
-0.9037997, -1.86013, -4.33478, 0.8313726, 1, 0, 1,
-0.90114, -0.4989246, -1.702754, 0.8235294, 1, 0, 1,
-0.8866905, 0.04801329, -2.130546, 0.8196079, 1, 0, 1,
-0.8810126, 1.744429, 0.9341815, 0.8117647, 1, 0, 1,
-0.8803086, 1.178982, -0.189943, 0.8078431, 1, 0, 1,
-0.8794352, 0.0862238, -2.577777, 0.8, 1, 0, 1,
-0.8722285, -0.02083958, -2.233008, 0.7921569, 1, 0, 1,
-0.8685914, 0.4464989, -2.220517, 0.7882353, 1, 0, 1,
-0.8658814, -0.2951663, -0.09941872, 0.7803922, 1, 0, 1,
-0.8643257, -1.413445, -2.810941, 0.7764706, 1, 0, 1,
-0.8617186, -1.534314, -2.819659, 0.7686275, 1, 0, 1,
-0.8597797, -2.678269, -3.847276, 0.7647059, 1, 0, 1,
-0.8590132, 0.9695328, 0.9990055, 0.7568628, 1, 0, 1,
-0.85712, -0.8561289, -2.73364, 0.7529412, 1, 0, 1,
-0.8537982, -0.01029058, -1.854943, 0.7450981, 1, 0, 1,
-0.8521671, -0.8050362, -4.096428, 0.7411765, 1, 0, 1,
-0.8500274, -1.192387, -2.373394, 0.7333333, 1, 0, 1,
-0.841334, -1.171421, -1.498877, 0.7294118, 1, 0, 1,
-0.8342394, 0.5659716, -2.068234, 0.7215686, 1, 0, 1,
-0.8341484, 0.5765445, -1.1452, 0.7176471, 1, 0, 1,
-0.8297951, -0.455437, -2.061904, 0.7098039, 1, 0, 1,
-0.8267334, -0.3210123, -2.406969, 0.7058824, 1, 0, 1,
-0.8225456, -0.7900764, -1.307615, 0.6980392, 1, 0, 1,
-0.8177668, 0.1250405, -1.596267, 0.6901961, 1, 0, 1,
-0.8149003, 0.2869548, -1.071311, 0.6862745, 1, 0, 1,
-0.7945437, 0.6048849, -0.5972005, 0.6784314, 1, 0, 1,
-0.7892896, -0.1005813, -1.257041, 0.6745098, 1, 0, 1,
-0.7886598, 1.519492, 0.5792605, 0.6666667, 1, 0, 1,
-0.7834024, -0.5066465, -1.047807, 0.6627451, 1, 0, 1,
-0.7794323, -0.7391315, -1.366202, 0.654902, 1, 0, 1,
-0.7787815, -2.480365, -2.377333, 0.6509804, 1, 0, 1,
-0.7784048, -0.1659491, 0.1039311, 0.6431373, 1, 0, 1,
-0.7776766, -3.132795, -1.753744, 0.6392157, 1, 0, 1,
-0.7698925, -0.9331143, -2.452939, 0.6313726, 1, 0, 1,
-0.7677495, 0.9412321, 0.8573466, 0.627451, 1, 0, 1,
-0.7675286, 1.732092, -0.2254929, 0.6196079, 1, 0, 1,
-0.7673225, 0.8699154, 0.3259396, 0.6156863, 1, 0, 1,
-0.7620956, -0.6817335, -1.11753, 0.6078432, 1, 0, 1,
-0.7565888, 0.3033173, -0.8382205, 0.6039216, 1, 0, 1,
-0.754232, -2.241256, -2.145332, 0.5960785, 1, 0, 1,
-0.7524901, -1.267184, -3.144278, 0.5882353, 1, 0, 1,
-0.7509887, 1.374425, -0.9047434, 0.5843138, 1, 0, 1,
-0.7507095, -0.5894751, -2.177983, 0.5764706, 1, 0, 1,
-0.7449702, -0.5184477, -3.302937, 0.572549, 1, 0, 1,
-0.7405841, 0.357645, -1.847515, 0.5647059, 1, 0, 1,
-0.7390693, -0.2943021, -3.334099, 0.5607843, 1, 0, 1,
-0.7373307, -0.4229147, -2.548779, 0.5529412, 1, 0, 1,
-0.7339284, -0.2894277, -2.377195, 0.5490196, 1, 0, 1,
-0.7205684, -0.6980761, -1.215708, 0.5411765, 1, 0, 1,
-0.7130404, -0.2042101, -1.403865, 0.5372549, 1, 0, 1,
-0.7129046, -0.6339263, -2.359859, 0.5294118, 1, 0, 1,
-0.7073403, -0.4187576, -2.390519, 0.5254902, 1, 0, 1,
-0.7073008, 0.5429193, -1.494881, 0.5176471, 1, 0, 1,
-0.6960525, -0.6322175, -1.66367, 0.5137255, 1, 0, 1,
-0.6895117, -0.78426, -4.349405, 0.5058824, 1, 0, 1,
-0.6888612, -0.09949084, -1.754573, 0.5019608, 1, 0, 1,
-0.6832601, -1.083821, -3.455615, 0.4941176, 1, 0, 1,
-0.6831152, 0.5731047, -0.5106376, 0.4862745, 1, 0, 1,
-0.6803526, 0.11403, 0.2885007, 0.4823529, 1, 0, 1,
-0.6772557, 0.7538961, 0.1298029, 0.4745098, 1, 0, 1,
-0.6739093, -0.4707125, -1.210636, 0.4705882, 1, 0, 1,
-0.6718313, -1.112259, -1.822077, 0.4627451, 1, 0, 1,
-0.6717914, 0.02493765, 0.9107209, 0.4588235, 1, 0, 1,
-0.6703808, -1.277428, -2.922389, 0.4509804, 1, 0, 1,
-0.6618833, 0.4755413, -2.144281, 0.4470588, 1, 0, 1,
-0.6614996, -1.552195, -2.800997, 0.4392157, 1, 0, 1,
-0.6573151, -0.2731315, -2.295266, 0.4352941, 1, 0, 1,
-0.6562747, 2.094506, 0.1903029, 0.427451, 1, 0, 1,
-0.6522, 0.7473742, -0.8078966, 0.4235294, 1, 0, 1,
-0.6480622, 0.9107755, 0.9947938, 0.4156863, 1, 0, 1,
-0.6455398, -0.3324669, -1.261138, 0.4117647, 1, 0, 1,
-0.6435512, 0.5641474, 1.07828, 0.4039216, 1, 0, 1,
-0.642675, 0.87657, 1.626384, 0.3960784, 1, 0, 1,
-0.641748, 0.6382684, 0.1866388, 0.3921569, 1, 0, 1,
-0.6407794, -0.5990949, -2.451609, 0.3843137, 1, 0, 1,
-0.6398039, 0.9254876, 0.5604448, 0.3803922, 1, 0, 1,
-0.6396638, -0.504144, -1.881168, 0.372549, 1, 0, 1,
-0.638716, 0.5384378, -0.138229, 0.3686275, 1, 0, 1,
-0.6378933, -0.7373823, -3.946609, 0.3607843, 1, 0, 1,
-0.6372018, 0.3253927, -1.038428, 0.3568628, 1, 0, 1,
-0.6347421, -0.2911107, -1.153441, 0.3490196, 1, 0, 1,
-0.6321011, 0.9541264, -0.06233067, 0.345098, 1, 0, 1,
-0.6319034, -0.2037465, -1.350561, 0.3372549, 1, 0, 1,
-0.6279162, -0.8743939, -3.043952, 0.3333333, 1, 0, 1,
-0.6265072, -1.804015, -1.916547, 0.3254902, 1, 0, 1,
-0.6111121, -0.4066124, -1.119782, 0.3215686, 1, 0, 1,
-0.6052973, -0.02184694, -1.444014, 0.3137255, 1, 0, 1,
-0.5993577, -1.443062, -2.944221, 0.3098039, 1, 0, 1,
-0.5976711, -0.08155313, -1.649545, 0.3019608, 1, 0, 1,
-0.5937613, 0.2765009, -0.587122, 0.2941177, 1, 0, 1,
-0.5892119, 0.7175757, -1.006861, 0.2901961, 1, 0, 1,
-0.5888276, 0.6343194, 0.02607649, 0.282353, 1, 0, 1,
-0.5888257, 0.82509, -1.088468, 0.2784314, 1, 0, 1,
-0.5838096, 0.1843047, -2.969794, 0.2705882, 1, 0, 1,
-0.582568, 0.5367684, -0.8248159, 0.2666667, 1, 0, 1,
-0.5815678, 0.6808231, -1.568485, 0.2588235, 1, 0, 1,
-0.580067, 0.1405116, -1.52928, 0.254902, 1, 0, 1,
-0.5747517, -0.908483, -2.637492, 0.2470588, 1, 0, 1,
-0.5656626, 1.779029, 0.1277626, 0.2431373, 1, 0, 1,
-0.5635208, 0.559875, 0.1060006, 0.2352941, 1, 0, 1,
-0.5625644, -2.079617, -3.543225, 0.2313726, 1, 0, 1,
-0.561414, -0.6835165, -1.913451, 0.2235294, 1, 0, 1,
-0.5595163, 0.4854887, -1.10213, 0.2196078, 1, 0, 1,
-0.5584613, 1.259128, 0.9011157, 0.2117647, 1, 0, 1,
-0.5562034, -0.7595885, -2.473947, 0.2078431, 1, 0, 1,
-0.5502062, -2.084638, -3.912621, 0.2, 1, 0, 1,
-0.5477074, -0.139377, -2.026291, 0.1921569, 1, 0, 1,
-0.5439274, 1.249684, -0.6699328, 0.1882353, 1, 0, 1,
-0.543498, -0.2835437, -3.054127, 0.1803922, 1, 0, 1,
-0.5431277, -0.1232278, -1.409832, 0.1764706, 1, 0, 1,
-0.5376486, 0.1714569, -1.169042, 0.1686275, 1, 0, 1,
-0.5324063, -0.5525538, -2.282988, 0.1647059, 1, 0, 1,
-0.5315905, 1.171418, -1.694051, 0.1568628, 1, 0, 1,
-0.5291778, -2.011026, -3.186233, 0.1529412, 1, 0, 1,
-0.5262821, 0.623874, -1.383791, 0.145098, 1, 0, 1,
-0.5183977, 0.4946665, -0.9064565, 0.1411765, 1, 0, 1,
-0.5136966, 0.7777234, -1.386699, 0.1333333, 1, 0, 1,
-0.510006, 1.865718, -0.6473398, 0.1294118, 1, 0, 1,
-0.5083638, 0.1874225, -0.1353746, 0.1215686, 1, 0, 1,
-0.5054852, -0.5897194, -0.8996826, 0.1176471, 1, 0, 1,
-0.5044402, -0.1088756, -0.5757288, 0.1098039, 1, 0, 1,
-0.5041109, 1.392002, 0.4974014, 0.1058824, 1, 0, 1,
-0.5029254, -2.099182, -3.493778, 0.09803922, 1, 0, 1,
-0.5021659, 1.003176, -0.1309265, 0.09019608, 1, 0, 1,
-0.501218, -0.7159508, -1.374164, 0.08627451, 1, 0, 1,
-0.4984131, -0.8002412, -2.011943, 0.07843138, 1, 0, 1,
-0.4966123, 0.9193794, -2.174339, 0.07450981, 1, 0, 1,
-0.4965411, 0.8757843, -0.1894118, 0.06666667, 1, 0, 1,
-0.4955958, 0.06285629, -3.234332, 0.0627451, 1, 0, 1,
-0.4952106, -1.033623, -2.64081, 0.05490196, 1, 0, 1,
-0.4840003, -0.221353, -2.259667, 0.05098039, 1, 0, 1,
-0.4789923, -0.7115467, -1.296587, 0.04313726, 1, 0, 1,
-0.4789017, -0.4116942, -0.2502266, 0.03921569, 1, 0, 1,
-0.4766093, 0.4132471, -0.8021287, 0.03137255, 1, 0, 1,
-0.476053, 0.2783948, -0.4024193, 0.02745098, 1, 0, 1,
-0.4726749, -0.4011174, -3.053932, 0.01960784, 1, 0, 1,
-0.4709541, -0.1248869, -1.688224, 0.01568628, 1, 0, 1,
-0.4707388, -1.657278, -4.297917, 0.007843138, 1, 0, 1,
-0.4691787, -0.7020213, -2.727118, 0.003921569, 1, 0, 1,
-0.4583861, 1.700879, -0.5828286, 0, 1, 0.003921569, 1,
-0.4582929, 0.002594539, -2.252571, 0, 1, 0.01176471, 1,
-0.4581302, -0.7150774, -0.2027825, 0, 1, 0.01568628, 1,
-0.4571237, 1.925978, -0.763211, 0, 1, 0.02352941, 1,
-0.4485407, -0.1112571, -0.6936779, 0, 1, 0.02745098, 1,
-0.441379, -0.6901565, -1.1644, 0, 1, 0.03529412, 1,
-0.4373823, -0.4735043, -1.527396, 0, 1, 0.03921569, 1,
-0.4359215, 0.8925118, 0.3814845, 0, 1, 0.04705882, 1,
-0.4268822, 1.625375, -0.1663204, 0, 1, 0.05098039, 1,
-0.4217239, -0.2608345, -2.395842, 0, 1, 0.05882353, 1,
-0.4213858, -0.04267022, -2.061403, 0, 1, 0.0627451, 1,
-0.4168734, -1.416314, -3.466034, 0, 1, 0.07058824, 1,
-0.4161803, -0.6809158, -2.911765, 0, 1, 0.07450981, 1,
-0.4064988, 0.03642611, -0.2051065, 0, 1, 0.08235294, 1,
-0.4032593, -0.3716609, -0.5371318, 0, 1, 0.08627451, 1,
-0.4008374, 0.140384, 0.2542141, 0, 1, 0.09411765, 1,
-0.3933172, 0.8223638, -0.5858482, 0, 1, 0.1019608, 1,
-0.3918314, 0.2886421, -0.7424774, 0, 1, 0.1058824, 1,
-0.3900413, -0.1656678, -1.898373, 0, 1, 0.1137255, 1,
-0.386193, -0.2795537, -2.191336, 0, 1, 0.1176471, 1,
-0.3816475, -0.1054608, -1.679526, 0, 1, 0.1254902, 1,
-0.37959, -0.03896976, -2.153407, 0, 1, 0.1294118, 1,
-0.3786783, 0.8713471, -1.205316, 0, 1, 0.1372549, 1,
-0.378574, 1.735175, 0.06703854, 0, 1, 0.1411765, 1,
-0.3693352, 0.195328, -1.755503, 0, 1, 0.1490196, 1,
-0.357106, 0.7258165, -2.166368, 0, 1, 0.1529412, 1,
-0.3558118, -0.4177383, -1.287648, 0, 1, 0.1607843, 1,
-0.3479077, 0.1378214, -2.146244, 0, 1, 0.1647059, 1,
-0.3466684, 1.819007, -0.8384938, 0, 1, 0.172549, 1,
-0.3427946, 1.052219, -0.5668233, 0, 1, 0.1764706, 1,
-0.33785, 0.9039284, 0.01407481, 0, 1, 0.1843137, 1,
-0.3374608, -0.8437774, -4.498222, 0, 1, 0.1882353, 1,
-0.3350601, 0.9345086, -0.6251873, 0, 1, 0.1960784, 1,
-0.3334914, -0.7598056, -1.797875, 0, 1, 0.2039216, 1,
-0.3288946, 0.2892236, -0.6830887, 0, 1, 0.2078431, 1,
-0.3277328, -1.797968, -2.446907, 0, 1, 0.2156863, 1,
-0.3253751, 1.125748, -0.4300703, 0, 1, 0.2196078, 1,
-0.3186887, -1.043406, -0.3498677, 0, 1, 0.227451, 1,
-0.3172995, -1.914748, -2.157194, 0, 1, 0.2313726, 1,
-0.3170925, -0.315511, -1.698868, 0, 1, 0.2392157, 1,
-0.3124532, 0.6983328, 0.1539645, 0, 1, 0.2431373, 1,
-0.3067221, -2.44264, -3.821699, 0, 1, 0.2509804, 1,
-0.3065884, -0.8196001, -2.907932, 0, 1, 0.254902, 1,
-0.3011431, -0.867417, -3.59379, 0, 1, 0.2627451, 1,
-0.2976297, 0.2979628, 0.08147007, 0, 1, 0.2666667, 1,
-0.2934312, 0.621883, 0.7055745, 0, 1, 0.2745098, 1,
-0.2909629, -0.2937387, -1.491117, 0, 1, 0.2784314, 1,
-0.2833498, -1.131882, -3.841075, 0, 1, 0.2862745, 1,
-0.278589, -0.7669865, -2.644859, 0, 1, 0.2901961, 1,
-0.2774249, -0.2406212, -2.228966, 0, 1, 0.2980392, 1,
-0.2769173, 1.013976, -0.06434812, 0, 1, 0.3058824, 1,
-0.2745809, -0.9586065, -2.385394, 0, 1, 0.3098039, 1,
-0.273048, -0.01199868, -1.203089, 0, 1, 0.3176471, 1,
-0.2725381, -1.891662, -4.107259, 0, 1, 0.3215686, 1,
-0.2706633, 0.4143372, -1.09179, 0, 1, 0.3294118, 1,
-0.2697307, 0.1566031, -1.718679, 0, 1, 0.3333333, 1,
-0.2684566, 1.166069, -0.3072754, 0, 1, 0.3411765, 1,
-0.2660215, -0.1736441, -2.625508, 0, 1, 0.345098, 1,
-0.2651832, -0.9208143, -4.453045, 0, 1, 0.3529412, 1,
-0.2638294, -1.482693, -4.788706, 0, 1, 0.3568628, 1,
-0.2570874, 0.4668179, 0.4095551, 0, 1, 0.3647059, 1,
-0.2548817, 0.3449996, -0.8107185, 0, 1, 0.3686275, 1,
-0.2530395, 1.481022, 1.468915, 0, 1, 0.3764706, 1,
-0.2477579, 0.5468508, -1.700832, 0, 1, 0.3803922, 1,
-0.2449503, -0.2413278, -2.860103, 0, 1, 0.3882353, 1,
-0.2447786, 0.6974354, -1.068328, 0, 1, 0.3921569, 1,
-0.2408972, -0.4789963, -1.518386, 0, 1, 0.4, 1,
-0.2404431, -2.510031, -1.549003, 0, 1, 0.4078431, 1,
-0.2337921, 0.1547625, -0.6447692, 0, 1, 0.4117647, 1,
-0.2326706, -0.08888746, -2.440182, 0, 1, 0.4196078, 1,
-0.22864, -0.6126161, -2.489967, 0, 1, 0.4235294, 1,
-0.2209733, 0.9179807, 1.794035, 0, 1, 0.4313726, 1,
-0.2190421, 1.012364, 0.1880294, 0, 1, 0.4352941, 1,
-0.2179984, 2.288691, 0.2082878, 0, 1, 0.4431373, 1,
-0.2161636, -0.8703223, -2.809326, 0, 1, 0.4470588, 1,
-0.2069608, -0.6153917, -2.407093, 0, 1, 0.454902, 1,
-0.205944, -1.968815, -4.398374, 0, 1, 0.4588235, 1,
-0.2019249, -0.9165029, -1.93311, 0, 1, 0.4666667, 1,
-0.1981793, -0.5714435, -3.090817, 0, 1, 0.4705882, 1,
-0.193366, 2.444184, -1.577523, 0, 1, 0.4784314, 1,
-0.191869, -1.158357, -2.308245, 0, 1, 0.4823529, 1,
-0.1898188, -2.341357, -3.388994, 0, 1, 0.4901961, 1,
-0.1823784, -0.8217304, -3.976217, 0, 1, 0.4941176, 1,
-0.1798603, 0.2232604, -0.9108304, 0, 1, 0.5019608, 1,
-0.1768796, -1.542023, -2.614532, 0, 1, 0.509804, 1,
-0.1724776, -1.41241, -3.177487, 0, 1, 0.5137255, 1,
-0.1680865, -0.7048414, -0.1456618, 0, 1, 0.5215687, 1,
-0.1611881, 2.683478, 0.2576702, 0, 1, 0.5254902, 1,
-0.1603668, 1.353754, 0.2858431, 0, 1, 0.5333334, 1,
-0.1566252, -0.08891916, -0.3394531, 0, 1, 0.5372549, 1,
-0.1545736, 2.099253, -0.388754, 0, 1, 0.5450981, 1,
-0.1544136, 1.197536, -2.833728, 0, 1, 0.5490196, 1,
-0.1535344, -1.689641, -2.896819, 0, 1, 0.5568628, 1,
-0.1531753, -0.7096676, -1.545576, 0, 1, 0.5607843, 1,
-0.1527092, -0.2372236, -1.997553, 0, 1, 0.5686275, 1,
-0.1493392, -0.8911154, -3.656171, 0, 1, 0.572549, 1,
-0.1455309, -0.7798778, -2.63131, 0, 1, 0.5803922, 1,
-0.1438212, 0.2109967, -1.233885, 0, 1, 0.5843138, 1,
-0.1401134, -0.2735051, -2.480661, 0, 1, 0.5921569, 1,
-0.1393955, -0.3785796, -1.557152, 0, 1, 0.5960785, 1,
-0.1379423, -0.8399235, -2.115075, 0, 1, 0.6039216, 1,
-0.1376718, -0.1113687, -1.382407, 0, 1, 0.6117647, 1,
-0.1348624, 1.035506, -1.115145, 0, 1, 0.6156863, 1,
-0.1207125, -1.464947, -2.679014, 0, 1, 0.6235294, 1,
-0.1187185, 0.6452457, -0.07416343, 0, 1, 0.627451, 1,
-0.1179691, -1.312536, -3.336728, 0, 1, 0.6352941, 1,
-0.1174824, -0.682506, -2.351982, 0, 1, 0.6392157, 1,
-0.115216, -1.052851, -3.846473, 0, 1, 0.6470588, 1,
-0.1044919, -0.2822067, -1.038596, 0, 1, 0.6509804, 1,
-0.1044433, -1.677981, -3.598626, 0, 1, 0.6588235, 1,
-0.1027669, -0.8012033, -4.413436, 0, 1, 0.6627451, 1,
-0.1019418, 0.2184625, 0.2020396, 0, 1, 0.6705883, 1,
-0.09501144, 2.014153, 2.01598, 0, 1, 0.6745098, 1,
-0.09030739, -0.3191028, -3.530694, 0, 1, 0.682353, 1,
-0.08713094, 0.5926138, 0.4878495, 0, 1, 0.6862745, 1,
-0.08518261, 0.06085595, -1.325533, 0, 1, 0.6941177, 1,
-0.08443382, 1.514023, -0.8031942, 0, 1, 0.7019608, 1,
-0.08355426, -0.9014977, -1.902943, 0, 1, 0.7058824, 1,
-0.07513623, -0.7116044, -2.198191, 0, 1, 0.7137255, 1,
-0.07453056, -0.5943526, -4.241111, 0, 1, 0.7176471, 1,
-0.07448044, 0.4100615, 0.911893, 0, 1, 0.7254902, 1,
-0.07193755, -0.6456132, -3.735245, 0, 1, 0.7294118, 1,
-0.07000515, -0.7761985, -2.376504, 0, 1, 0.7372549, 1,
-0.06285004, 0.9601368, -0.5671192, 0, 1, 0.7411765, 1,
-0.06269941, -2.13203, -3.327317, 0, 1, 0.7490196, 1,
-0.06264763, 0.8097443, -0.4414615, 0, 1, 0.7529412, 1,
-0.05796012, 1.052527, 0.8847822, 0, 1, 0.7607843, 1,
-0.05771805, -1.342397, -3.317132, 0, 1, 0.7647059, 1,
-0.05673095, 0.666338, -2.290752, 0, 1, 0.772549, 1,
-0.05226637, -0.02467192, -1.387804, 0, 1, 0.7764706, 1,
-0.05191297, 0.12822, -0.949681, 0, 1, 0.7843137, 1,
-0.04920283, 0.2999652, -1.073538, 0, 1, 0.7882353, 1,
-0.04644049, -0.03653748, -2.24152, 0, 1, 0.7960784, 1,
-0.04332569, 1.126164, 0.3738518, 0, 1, 0.8039216, 1,
-0.04223707, 0.6064703, -1.25016, 0, 1, 0.8078431, 1,
-0.03887916, -0.05919048, -1.768349, 0, 1, 0.8156863, 1,
-0.03814247, 1.981074, 0.8333766, 0, 1, 0.8196079, 1,
-0.0375481, -1.398161, -4.018363, 0, 1, 0.827451, 1,
-0.03519164, 0.6089768, 0.01741009, 0, 1, 0.8313726, 1,
-0.0346846, -0.7387758, -0.9052284, 0, 1, 0.8392157, 1,
-0.03121318, -1.061052, -3.376693, 0, 1, 0.8431373, 1,
-0.02830247, 0.4770125, -3.029477, 0, 1, 0.8509804, 1,
-0.01846849, 1.272718, 1.553069, 0, 1, 0.854902, 1,
-0.01837061, 0.9833384, -0.948652, 0, 1, 0.8627451, 1,
-0.01555723, 0.4371412, -0.578073, 0, 1, 0.8666667, 1,
-0.01145002, 0.359049, -0.2887593, 0, 1, 0.8745098, 1,
-0.005234302, -1.691259, -4.046663, 0, 1, 0.8784314, 1,
-0.004665811, -1.483662, -2.797892, 0, 1, 0.8862745, 1,
-0.002444432, -2.456714, -3.181315, 0, 1, 0.8901961, 1,
-0.00121935, 1.395143, -1.477562, 0, 1, 0.8980392, 1,
0.0006212185, 1.26134, -0.3526725, 0, 1, 0.9058824, 1,
0.002077177, -0.1941987, 4.472435, 0, 1, 0.9098039, 1,
0.005209192, 0.2913051, -0.4970954, 0, 1, 0.9176471, 1,
0.01545255, -0.4987584, 2.202881, 0, 1, 0.9215686, 1,
0.0170766, 0.07689115, -0.5915903, 0, 1, 0.9294118, 1,
0.01778792, -0.3817878, 3.141279, 0, 1, 0.9333333, 1,
0.0190494, -0.5466854, 4.501987, 0, 1, 0.9411765, 1,
0.0226416, 0.7373359, -1.299339, 0, 1, 0.945098, 1,
0.02547254, -0.2073416, 1.657304, 0, 1, 0.9529412, 1,
0.02554545, -0.7500352, 2.402251, 0, 1, 0.9568627, 1,
0.02556431, -0.633803, 4.043451, 0, 1, 0.9647059, 1,
0.03643326, -0.3548195, 3.69177, 0, 1, 0.9686275, 1,
0.03927689, 0.9460862, 0.176633, 0, 1, 0.9764706, 1,
0.04210863, 0.9047115, 0.6066162, 0, 1, 0.9803922, 1,
0.04731908, 0.9590906, -0.1057379, 0, 1, 0.9882353, 1,
0.04775229, -0.8933094, 3.439481, 0, 1, 0.9921569, 1,
0.04855739, 0.3859436, -0.0003078819, 0, 1, 1, 1,
0.05091774, -2.711268, 5.391146, 0, 0.9921569, 1, 1,
0.05315135, 1.872635, -1.714532, 0, 0.9882353, 1, 1,
0.05458855, -0.4488994, 3.870607, 0, 0.9803922, 1, 1,
0.0618619, 0.6075482, -1.12421, 0, 0.9764706, 1, 1,
0.06431808, -1.841466, 3.896645, 0, 0.9686275, 1, 1,
0.06519741, -0.0742342, 1.382212, 0, 0.9647059, 1, 1,
0.06834975, 0.2967881, -0.5958537, 0, 0.9568627, 1, 1,
0.07110783, -0.9723317, 2.85206, 0, 0.9529412, 1, 1,
0.07217043, -0.7724249, 2.577526, 0, 0.945098, 1, 1,
0.07560612, -0.5825107, 1.434644, 0, 0.9411765, 1, 1,
0.07751022, -0.2611624, 2.810126, 0, 0.9333333, 1, 1,
0.08476543, 1.215302, -0.1940547, 0, 0.9294118, 1, 1,
0.08539375, -1.243293, 4.261476, 0, 0.9215686, 1, 1,
0.08921042, -0.7705368, 2.50259, 0, 0.9176471, 1, 1,
0.09157202, 0.002220742, 1.134631, 0, 0.9098039, 1, 1,
0.09158618, 0.07498286, 2.255953, 0, 0.9058824, 1, 1,
0.09312139, 0.08778255, 1.017357, 0, 0.8980392, 1, 1,
0.09610282, 0.4329889, 0.6784914, 0, 0.8901961, 1, 1,
0.1001395, 1.911049, 1.815072, 0, 0.8862745, 1, 1,
0.1004254, 0.1833768, 2.192632, 0, 0.8784314, 1, 1,
0.1005046, -1.463698, 3.404436, 0, 0.8745098, 1, 1,
0.1110877, 0.4627762, -0.2053778, 0, 0.8666667, 1, 1,
0.1177571, 1.188045, 1.130394, 0, 0.8627451, 1, 1,
0.1190207, -2.368432, 5.365765, 0, 0.854902, 1, 1,
0.1203719, 1.314623, 1.89074, 0, 0.8509804, 1, 1,
0.1207681, -0.2681773, 2.928642, 0, 0.8431373, 1, 1,
0.133678, 1.070499, 0.2023611, 0, 0.8392157, 1, 1,
0.1379463, 1.568977, -2.12804, 0, 0.8313726, 1, 1,
0.1463664, 0.4153363, 0.02865499, 0, 0.827451, 1, 1,
0.1536528, 0.5156979, -0.2478267, 0, 0.8196079, 1, 1,
0.1552488, 0.002635299, 0.6537474, 0, 0.8156863, 1, 1,
0.1574384, -1.434666, 2.484182, 0, 0.8078431, 1, 1,
0.1604036, -1.58689, 3.205359, 0, 0.8039216, 1, 1,
0.1640502, -0.7901276, 4.098271, 0, 0.7960784, 1, 1,
0.1644567, -1.657406, 3.219193, 0, 0.7882353, 1, 1,
0.1652683, -0.6475447, 2.196542, 0, 0.7843137, 1, 1,
0.1662991, 0.2059051, -1.036824, 0, 0.7764706, 1, 1,
0.1681805, 2.038803, -0.6047037, 0, 0.772549, 1, 1,
0.1682689, 1.028377, -1.902907, 0, 0.7647059, 1, 1,
0.1687783, 0.8005055, -1.724352, 0, 0.7607843, 1, 1,
0.1689509, 0.7360224, 0.4300363, 0, 0.7529412, 1, 1,
0.1695745, -1.083848, 3.35843, 0, 0.7490196, 1, 1,
0.1710021, -1.662043, 0.7533424, 0, 0.7411765, 1, 1,
0.1718499, 0.3926548, 1.965373, 0, 0.7372549, 1, 1,
0.1750412, -0.6968904, 4.058504, 0, 0.7294118, 1, 1,
0.1754983, 0.6976597, 0.8102633, 0, 0.7254902, 1, 1,
0.1759677, 0.1780654, -2.063807, 0, 0.7176471, 1, 1,
0.177117, -0.5465638, 4.634491, 0, 0.7137255, 1, 1,
0.1822232, -0.2374839, 2.151325, 0, 0.7058824, 1, 1,
0.1824786, -1.373676, 2.028975, 0, 0.6980392, 1, 1,
0.1839917, 1.210527, 2.284217, 0, 0.6941177, 1, 1,
0.1855507, -0.5780279, 3.427167, 0, 0.6862745, 1, 1,
0.1914967, -0.1229939, 3.373679, 0, 0.682353, 1, 1,
0.1953696, 0.487491, 0.868697, 0, 0.6745098, 1, 1,
0.1984676, -1.289152, 2.66807, 0, 0.6705883, 1, 1,
0.2005959, -2.042042, 2.94127, 0, 0.6627451, 1, 1,
0.204716, -0.6408714, 3.998593, 0, 0.6588235, 1, 1,
0.2047337, 1.050897, 1.843854, 0, 0.6509804, 1, 1,
0.2117222, -1.17544, 2.698664, 0, 0.6470588, 1, 1,
0.2134873, -1.411587, 3.37638, 0, 0.6392157, 1, 1,
0.21713, -0.4852338, 3.515378, 0, 0.6352941, 1, 1,
0.2174018, -1.487237, 2.21337, 0, 0.627451, 1, 1,
0.2174458, 0.05645456, 2.333179, 0, 0.6235294, 1, 1,
0.2203465, -0.1299734, 3.404118, 0, 0.6156863, 1, 1,
0.2278116, -1.387066, 3.051424, 0, 0.6117647, 1, 1,
0.2307087, -0.2290617, 4.3391, 0, 0.6039216, 1, 1,
0.2312931, 0.7216468, -1.399206, 0, 0.5960785, 1, 1,
0.2318064, 0.6164252, 0.4574858, 0, 0.5921569, 1, 1,
0.2323087, -0.6140511, 2.756475, 0, 0.5843138, 1, 1,
0.2328694, 1.026642, -1.319473, 0, 0.5803922, 1, 1,
0.2336123, 0.03904154, 0.1296058, 0, 0.572549, 1, 1,
0.2350747, -1.35962, 2.579215, 0, 0.5686275, 1, 1,
0.2378058, 0.6666131, -0.4763627, 0, 0.5607843, 1, 1,
0.2382341, -0.1079318, 1.13829, 0, 0.5568628, 1, 1,
0.2397145, 0.3200088, 1.321971, 0, 0.5490196, 1, 1,
0.2478863, -2.696568, 3.192914, 0, 0.5450981, 1, 1,
0.2491477, 1.432445, -0.7779966, 0, 0.5372549, 1, 1,
0.2625158, -0.08665133, 1.132445, 0, 0.5333334, 1, 1,
0.2680171, 1.362848, 1.250127, 0, 0.5254902, 1, 1,
0.2687101, 0.3489062, -0.1757001, 0, 0.5215687, 1, 1,
0.2728431, 0.9996948, -0.4201455, 0, 0.5137255, 1, 1,
0.2751352, 0.2753727, -0.03038997, 0, 0.509804, 1, 1,
0.2771898, 0.5484717, 1.036266, 0, 0.5019608, 1, 1,
0.2841007, -2.601683, 4.192168, 0, 0.4941176, 1, 1,
0.284907, 0.5393966, 2.259734, 0, 0.4901961, 1, 1,
0.287443, 1.757998, 0.7212774, 0, 0.4823529, 1, 1,
0.2892867, 0.8541154, 0.4520999, 0, 0.4784314, 1, 1,
0.2903592, 0.1360241, 0.35346, 0, 0.4705882, 1, 1,
0.2906069, 0.6211336, 2.034832, 0, 0.4666667, 1, 1,
0.2926321, 0.3095162, 1.139791, 0, 0.4588235, 1, 1,
0.2985893, -1.467385, 3.280398, 0, 0.454902, 1, 1,
0.2995268, -0.8863153, 3.057056, 0, 0.4470588, 1, 1,
0.3003455, -0.9295204, 3.21505, 0, 0.4431373, 1, 1,
0.3023377, 0.1280086, 0.8208004, 0, 0.4352941, 1, 1,
0.3143084, 0.6972432, -0.6168683, 0, 0.4313726, 1, 1,
0.3221276, -0.1218809, 3.551348, 0, 0.4235294, 1, 1,
0.3222719, -0.6948554, 2.87359, 0, 0.4196078, 1, 1,
0.32283, 0.166989, 0.8146107, 0, 0.4117647, 1, 1,
0.325802, -0.9619164, 3.848584, 0, 0.4078431, 1, 1,
0.3275494, -1.51948, 1.597507, 0, 0.4, 1, 1,
0.3281114, -0.569876, 2.3633, 0, 0.3921569, 1, 1,
0.3304428, 0.7016556, -0.6369173, 0, 0.3882353, 1, 1,
0.3321991, 1.466395, 0.9302448, 0, 0.3803922, 1, 1,
0.3345635, 0.7351614, 0.8393673, 0, 0.3764706, 1, 1,
0.3347662, -0.2286051, 2.643883, 0, 0.3686275, 1, 1,
0.3354823, 1.375223, -0.6042054, 0, 0.3647059, 1, 1,
0.3363495, -0.6919473, 3.132715, 0, 0.3568628, 1, 1,
0.3397109, 0.1418459, 0.08325206, 0, 0.3529412, 1, 1,
0.3415945, -0.3827057, 0.5404566, 0, 0.345098, 1, 1,
0.3432725, 1.919997, 0.6698059, 0, 0.3411765, 1, 1,
0.3479178, -0.5606328, 3.160898, 0, 0.3333333, 1, 1,
0.3536083, 1.524479, -0.223905, 0, 0.3294118, 1, 1,
0.3554513, -0.3902752, 0.5932417, 0, 0.3215686, 1, 1,
0.3583536, -0.1317753, 1.211226, 0, 0.3176471, 1, 1,
0.3601116, -1.841751, 3.155514, 0, 0.3098039, 1, 1,
0.3642904, -0.1225158, 2.230231, 0, 0.3058824, 1, 1,
0.3681726, -0.5187004, 2.416718, 0, 0.2980392, 1, 1,
0.3683351, -0.8366898, 1.29302, 0, 0.2901961, 1, 1,
0.3701152, -0.1354497, 0.9572151, 0, 0.2862745, 1, 1,
0.3772091, 0.6603318, 0.6289151, 0, 0.2784314, 1, 1,
0.3802548, 0.9274426, 0.01323392, 0, 0.2745098, 1, 1,
0.385496, -1.044007, 2.208301, 0, 0.2666667, 1, 1,
0.3875521, -0.04115249, 2.318008, 0, 0.2627451, 1, 1,
0.388743, -0.4806274, 2.308101, 0, 0.254902, 1, 1,
0.390384, 0.7019504, -0.3874454, 0, 0.2509804, 1, 1,
0.3916472, -1.258407, 3.358917, 0, 0.2431373, 1, 1,
0.3949995, 1.572148, 0.1343321, 0, 0.2392157, 1, 1,
0.3999703, -0.5559701, 1.492332, 0, 0.2313726, 1, 1,
0.4054882, -1.914498, 2.699591, 0, 0.227451, 1, 1,
0.4076632, -1.276179, 3.275823, 0, 0.2196078, 1, 1,
0.4103404, -0.4420205, 1.978754, 0, 0.2156863, 1, 1,
0.4115056, -0.3258272, 4.359707, 0, 0.2078431, 1, 1,
0.4127559, 1.493454, 0.5842275, 0, 0.2039216, 1, 1,
0.4151861, -0.1276902, 1.524288, 0, 0.1960784, 1, 1,
0.4156145, -0.2369198, 5.21306, 0, 0.1882353, 1, 1,
0.4175093, -0.5971649, 3.164231, 0, 0.1843137, 1, 1,
0.4191684, -0.6723461, 2.924617, 0, 0.1764706, 1, 1,
0.420954, -1.924225, 2.049271, 0, 0.172549, 1, 1,
0.4229676, 1.146544, -0.04591, 0, 0.1647059, 1, 1,
0.4275231, -0.8298388, 2.479982, 0, 0.1607843, 1, 1,
0.4382763, -1.248877, 2.060628, 0, 0.1529412, 1, 1,
0.4434853, 0.002353653, 1.256545, 0, 0.1490196, 1, 1,
0.4440531, 1.365341, -1.420489, 0, 0.1411765, 1, 1,
0.4474352, -0.5894231, 2.283996, 0, 0.1372549, 1, 1,
0.447483, -0.6591104, 2.299226, 0, 0.1294118, 1, 1,
0.4497788, -0.5538238, 2.333716, 0, 0.1254902, 1, 1,
0.450124, 0.5965514, 1.571669, 0, 0.1176471, 1, 1,
0.4598747, 0.3122513, -0.4283944, 0, 0.1137255, 1, 1,
0.4613228, 0.574086, 0.2293286, 0, 0.1058824, 1, 1,
0.4627869, 0.5146052, 1.788793, 0, 0.09803922, 1, 1,
0.4644383, -2.397564, 4.194506, 0, 0.09411765, 1, 1,
0.4654378, -0.16576, 2.834046, 0, 0.08627451, 1, 1,
0.4654742, 0.06137758, 0.9890816, 0, 0.08235294, 1, 1,
0.4656045, -1.321, 1.51354, 0, 0.07450981, 1, 1,
0.4683385, -0.5731274, 3.930234, 0, 0.07058824, 1, 1,
0.4710509, -0.3069028, 2.823573, 0, 0.0627451, 1, 1,
0.4795176, -0.8725077, 3.493092, 0, 0.05882353, 1, 1,
0.4821399, 0.5557279, 0.724734, 0, 0.05098039, 1, 1,
0.4840214, -1.962285, 1.146548, 0, 0.04705882, 1, 1,
0.4856192, 1.156816, 1.580871, 0, 0.03921569, 1, 1,
0.4862962, 1.078784, 0.7087973, 0, 0.03529412, 1, 1,
0.4863031, 0.2332928, 0.8459622, 0, 0.02745098, 1, 1,
0.4888556, 0.2806204, 0.5856611, 0, 0.02352941, 1, 1,
0.4914223, -0.6689445, 2.309066, 0, 0.01568628, 1, 1,
0.4968066, 0.7642898, -0.1137138, 0, 0.01176471, 1, 1,
0.49816, 0.122107, 2.007419, 0, 0.003921569, 1, 1,
0.5081293, -1.582902, 2.372099, 0.003921569, 0, 1, 1,
0.5094469, -0.396155, 1.722732, 0.007843138, 0, 1, 1,
0.5103889, -0.3723707, 1.620854, 0.01568628, 0, 1, 1,
0.5106321, 0.7310644, 1.290046, 0.01960784, 0, 1, 1,
0.5109768, 1.624038, 1.205964, 0.02745098, 0, 1, 1,
0.5148799, -0.4026724, 3.563438, 0.03137255, 0, 1, 1,
0.5165078, 0.7496278, 1.33496, 0.03921569, 0, 1, 1,
0.5184085, 0.6134951, -0.02875705, 0.04313726, 0, 1, 1,
0.5195848, -0.6583115, 2.641855, 0.05098039, 0, 1, 1,
0.5197788, 0.3346413, 0.8898776, 0.05490196, 0, 1, 1,
0.5233797, -0.7981663, 2.486032, 0.0627451, 0, 1, 1,
0.5235446, -2.862954, 1.670113, 0.06666667, 0, 1, 1,
0.537857, -1.389026, 3.484385, 0.07450981, 0, 1, 1,
0.5390419, 0.03201681, 1.666186, 0.07843138, 0, 1, 1,
0.539969, -0.6508888, 1.528686, 0.08627451, 0, 1, 1,
0.5408239, -0.4501885, 2.091291, 0.09019608, 0, 1, 1,
0.5421528, -0.5274626, 1.519512, 0.09803922, 0, 1, 1,
0.5471542, -1.231319, 2.120544, 0.1058824, 0, 1, 1,
0.5475399, 1.153695, 0.2978275, 0.1098039, 0, 1, 1,
0.5475612, -0.7144601, -0.05246477, 0.1176471, 0, 1, 1,
0.5484537, 0.3755399, 0.6556463, 0.1215686, 0, 1, 1,
0.5503607, 0.06477032, 1.311877, 0.1294118, 0, 1, 1,
0.5551051, -1.3471, 2.479748, 0.1333333, 0, 1, 1,
0.5567805, 0.9618212, -0.6500109, 0.1411765, 0, 1, 1,
0.5613818, -0.8585176, 0.9981468, 0.145098, 0, 1, 1,
0.5637063, -0.9709634, 2.684983, 0.1529412, 0, 1, 1,
0.5664555, 0.2369577, -0.7069206, 0.1568628, 0, 1, 1,
0.5686136, 0.09634241, 0.8027884, 0.1647059, 0, 1, 1,
0.5702218, 0.5465234, -0.7206991, 0.1686275, 0, 1, 1,
0.5715263, -0.3871192, 1.575344, 0.1764706, 0, 1, 1,
0.5718021, 0.5943598, 0.2205559, 0.1803922, 0, 1, 1,
0.5738835, -0.592981, 2.750294, 0.1882353, 0, 1, 1,
0.5757011, 0.1571977, 2.784273, 0.1921569, 0, 1, 1,
0.5791598, -0.03404045, 1.186293, 0.2, 0, 1, 1,
0.5834915, -1.893342, 3.810649, 0.2078431, 0, 1, 1,
0.5834978, -0.7935619, 1.626934, 0.2117647, 0, 1, 1,
0.5870405, 1.658619, 0.2607087, 0.2196078, 0, 1, 1,
0.5951125, 0.4072662, 1.931293, 0.2235294, 0, 1, 1,
0.5975075, -2.473842, 3.759165, 0.2313726, 0, 1, 1,
0.598943, 1.577613, 1.865974, 0.2352941, 0, 1, 1,
0.601346, -0.1899312, 0.5744907, 0.2431373, 0, 1, 1,
0.6024157, 0.07050114, 2.780376, 0.2470588, 0, 1, 1,
0.6108735, -0.9270868, 1.89056, 0.254902, 0, 1, 1,
0.6108919, -0.6134534, 0.775585, 0.2588235, 0, 1, 1,
0.6111835, -0.5480593, 2.387042, 0.2666667, 0, 1, 1,
0.6123244, -1.35356, 3.705176, 0.2705882, 0, 1, 1,
0.6130753, 0.09115811, 1.583559, 0.2784314, 0, 1, 1,
0.6151282, -0.0480312, 0.4517645, 0.282353, 0, 1, 1,
0.6168387, -1.902725, 2.375983, 0.2901961, 0, 1, 1,
0.6190961, 0.4577163, -0.5250776, 0.2941177, 0, 1, 1,
0.6227145, -0.7128031, 2.108149, 0.3019608, 0, 1, 1,
0.6256748, 0.008986824, 0.09905206, 0.3098039, 0, 1, 1,
0.6257998, 0.5353369, 1.842342, 0.3137255, 0, 1, 1,
0.6259182, 2.010074, -2.819748, 0.3215686, 0, 1, 1,
0.6260081, -0.6719538, 2.206618, 0.3254902, 0, 1, 1,
0.62712, -0.6411244, 1.639788, 0.3333333, 0, 1, 1,
0.6301934, -0.1696165, 2.308499, 0.3372549, 0, 1, 1,
0.637246, 1.031285, 1.021603, 0.345098, 0, 1, 1,
0.6389046, -0.3611068, 2.525977, 0.3490196, 0, 1, 1,
0.6396611, 0.4444717, 1.654415, 0.3568628, 0, 1, 1,
0.642186, 0.3015114, 2.602483, 0.3607843, 0, 1, 1,
0.6454766, 1.164313, -0.9636369, 0.3686275, 0, 1, 1,
0.6464369, 0.912721, 0.931316, 0.372549, 0, 1, 1,
0.6469974, -0.5012795, 0.6426637, 0.3803922, 0, 1, 1,
0.6470413, -1.487018, 2.386266, 0.3843137, 0, 1, 1,
0.6490482, 0.3500038, -0.1601218, 0.3921569, 0, 1, 1,
0.6513546, 2.897268, -1.336828, 0.3960784, 0, 1, 1,
0.6524406, -0.05309642, 1.24225, 0.4039216, 0, 1, 1,
0.6568926, -0.2205009, 2.822493, 0.4117647, 0, 1, 1,
0.6696027, 2.841149, -0.8085865, 0.4156863, 0, 1, 1,
0.6724111, -0.8413908, 2.664843, 0.4235294, 0, 1, 1,
0.673154, -0.7611914, 3.877018, 0.427451, 0, 1, 1,
0.6747616, -2.054288, 2.7683, 0.4352941, 0, 1, 1,
0.6750526, 0.3545742, -0.7968181, 0.4392157, 0, 1, 1,
0.6759139, 1.694117, 1.090317, 0.4470588, 0, 1, 1,
0.6773903, 0.05169788, 2.692269, 0.4509804, 0, 1, 1,
0.6804303, -0.03887136, 1.013982, 0.4588235, 0, 1, 1,
0.6804497, 0.4368341, 0.6721942, 0.4627451, 0, 1, 1,
0.6872034, 0.8166283, 1.216838, 0.4705882, 0, 1, 1,
0.6892508, 1.498387, -0.4329101, 0.4745098, 0, 1, 1,
0.689849, 0.003967983, 1.230812, 0.4823529, 0, 1, 1,
0.6912335, -0.1320415, 1.209571, 0.4862745, 0, 1, 1,
0.6977172, 0.9766646, 1.195238, 0.4941176, 0, 1, 1,
0.7110866, -0.7640418, 1.978652, 0.5019608, 0, 1, 1,
0.7111345, 1.432014, 0.8572276, 0.5058824, 0, 1, 1,
0.7124104, 0.3789117, 1.087803, 0.5137255, 0, 1, 1,
0.7174066, 0.3822266, 1.226089, 0.5176471, 0, 1, 1,
0.7220264, -0.2863509, 2.275135, 0.5254902, 0, 1, 1,
0.7227042, -1.445853, 2.139937, 0.5294118, 0, 1, 1,
0.7255794, 0.6573291, 0.8261521, 0.5372549, 0, 1, 1,
0.741659, -0.2756768, 3.374417, 0.5411765, 0, 1, 1,
0.7423315, -0.2608995, 1.903908, 0.5490196, 0, 1, 1,
0.747516, -0.2947403, -0.155911, 0.5529412, 0, 1, 1,
0.7483159, 0.1417074, 0.7511888, 0.5607843, 0, 1, 1,
0.7540564, 0.1965534, 1.940487, 0.5647059, 0, 1, 1,
0.7544668, 0.9432965, -0.2145895, 0.572549, 0, 1, 1,
0.7561129, 0.5747451, 2.77055, 0.5764706, 0, 1, 1,
0.7594376, -0.1333999, 3.366291, 0.5843138, 0, 1, 1,
0.7595294, 0.2648403, 2.274299, 0.5882353, 0, 1, 1,
0.7642719, 0.2344902, 0.6842747, 0.5960785, 0, 1, 1,
0.7670311, 0.7365917, 0.6571742, 0.6039216, 0, 1, 1,
0.7755257, -2.018238, 3.404148, 0.6078432, 0, 1, 1,
0.7755844, -0.847029, 1.444975, 0.6156863, 0, 1, 1,
0.7813011, 1.901025, -0.1364745, 0.6196079, 0, 1, 1,
0.7830142, 0.2115073, 1.397897, 0.627451, 0, 1, 1,
0.7831097, -0.5120217, 3.117921, 0.6313726, 0, 1, 1,
0.7865041, 0.3871947, 0.99979, 0.6392157, 0, 1, 1,
0.7867435, 2.020812, 1.50877, 0.6431373, 0, 1, 1,
0.7964141, -0.2278727, 1.738982, 0.6509804, 0, 1, 1,
0.7975895, 0.2329736, 0.632386, 0.654902, 0, 1, 1,
0.7988388, -1.054102, 1.796288, 0.6627451, 0, 1, 1,
0.8074783, 1.752955, 0.2983555, 0.6666667, 0, 1, 1,
0.8157496, -0.1750766, 2.25477, 0.6745098, 0, 1, 1,
0.8234872, 1.55764, 1.18234, 0.6784314, 0, 1, 1,
0.8250523, -1.125271, 4.997231, 0.6862745, 0, 1, 1,
0.8268812, 0.03398557, 2.37728, 0.6901961, 0, 1, 1,
0.8322074, 0.4526876, 0.2331689, 0.6980392, 0, 1, 1,
0.835574, 2.83945, 1.846228, 0.7058824, 0, 1, 1,
0.8402783, -1.408504, 2.105861, 0.7098039, 0, 1, 1,
0.8482078, -0.9420922, 1.314364, 0.7176471, 0, 1, 1,
0.8487818, -0.1701943, 1.547555, 0.7215686, 0, 1, 1,
0.8534892, -0.3325813, 3.539359, 0.7294118, 0, 1, 1,
0.8555778, 0.4209563, 1.552513, 0.7333333, 0, 1, 1,
0.8563448, 1.27138, 1.095803, 0.7411765, 0, 1, 1,
0.8567311, 0.4090604, 0.4417486, 0.7450981, 0, 1, 1,
0.8644478, 0.6180962, 0.8893446, 0.7529412, 0, 1, 1,
0.8680803, 1.498442, -0.808943, 0.7568628, 0, 1, 1,
0.8718661, -0.7669111, 2.305394, 0.7647059, 0, 1, 1,
0.8725276, 0.7698646, -0.0198038, 0.7686275, 0, 1, 1,
0.8787595, -0.6138065, 2.651432, 0.7764706, 0, 1, 1,
0.8809299, 0.5541633, 1.535881, 0.7803922, 0, 1, 1,
0.8889939, 0.6716643, -0.827327, 0.7882353, 0, 1, 1,
0.8908675, -1.627042, 2.913805, 0.7921569, 0, 1, 1,
0.8928164, 2.465384, 1.54591, 0.8, 0, 1, 1,
0.8933926, -0.9671084, 1.480893, 0.8078431, 0, 1, 1,
0.8936219, 1.081807, -1.473698, 0.8117647, 0, 1, 1,
0.8973089, -0.3025451, 3.02004, 0.8196079, 0, 1, 1,
0.8974507, 0.0971244, 0.5813137, 0.8235294, 0, 1, 1,
0.9031277, -0.8735675, 4.424654, 0.8313726, 0, 1, 1,
0.9099806, 1.376698, 0.3424987, 0.8352941, 0, 1, 1,
0.910327, -0.1267987, 3.091807, 0.8431373, 0, 1, 1,
0.9173831, 0.3023394, 0.9042537, 0.8470588, 0, 1, 1,
0.9183045, 0.002675209, 1.542519, 0.854902, 0, 1, 1,
0.9194062, 1.138831, 0.0031877, 0.8588235, 0, 1, 1,
0.9325493, -1.557873, 3.327037, 0.8666667, 0, 1, 1,
0.9340463, 0.6691058, 0.55097, 0.8705882, 0, 1, 1,
0.9416226, 0.6708782, 2.901319, 0.8784314, 0, 1, 1,
0.9418517, 0.03810385, 1.018583, 0.8823529, 0, 1, 1,
0.9418607, -0.1193659, 0.9518896, 0.8901961, 0, 1, 1,
0.9420676, -0.3512961, 2.331778, 0.8941177, 0, 1, 1,
0.9423669, -2.148193, 2.689064, 0.9019608, 0, 1, 1,
0.9451066, 1.113342, 0.3929712, 0.9098039, 0, 1, 1,
0.9468835, -0.4393084, 1.358337, 0.9137255, 0, 1, 1,
0.9470246, 0.1031649, 1.321782, 0.9215686, 0, 1, 1,
0.9499789, -0.9417627, 2.467965, 0.9254902, 0, 1, 1,
0.9573641, 0.3725573, 2.965401, 0.9333333, 0, 1, 1,
0.9597497, -1.146119, 4.130885, 0.9372549, 0, 1, 1,
0.9607006, -0.4605711, 3.361373, 0.945098, 0, 1, 1,
0.9720222, -0.7155538, 2.582339, 0.9490196, 0, 1, 1,
0.9728182, -0.5365834, 1.404085, 0.9568627, 0, 1, 1,
0.9776874, 0.2203906, 1.973842, 0.9607843, 0, 1, 1,
0.9813562, -0.3613793, 1.76399, 0.9686275, 0, 1, 1,
0.9907535, 0.1579904, 1.898715, 0.972549, 0, 1, 1,
0.9930011, 0.7954873, 1.335452, 0.9803922, 0, 1, 1,
0.9957826, 0.5158047, -0.1620244, 0.9843137, 0, 1, 1,
0.9963069, 1.351521, 0.63144, 0.9921569, 0, 1, 1,
0.9974678, -0.3022538, 1.144328, 0.9960784, 0, 1, 1,
0.9995013, 0.590573, -1.223657, 1, 0, 0.9960784, 1,
1.008932, -0.6137889, 3.638387, 1, 0, 0.9882353, 1,
1.010292, -0.8450623, 1.58808, 1, 0, 0.9843137, 1,
1.01695, -2.299929, 3.543004, 1, 0, 0.9764706, 1,
1.018519, -1.137794, 2.593042, 1, 0, 0.972549, 1,
1.044902, 0.4204147, 2.789515, 1, 0, 0.9647059, 1,
1.04556, 0.8011318, -0.5876009, 1, 0, 0.9607843, 1,
1.046459, -0.7224237, 1.066322, 1, 0, 0.9529412, 1,
1.046606, 0.3729296, 2.039264, 1, 0, 0.9490196, 1,
1.051767, -1.411313, 2.856316, 1, 0, 0.9411765, 1,
1.068085, -0.4447014, 1.63397, 1, 0, 0.9372549, 1,
1.069427, 0.4346715, 1.066104, 1, 0, 0.9294118, 1,
1.069756, 0.7998805, 2.020688, 1, 0, 0.9254902, 1,
1.085081, 0.1990404, 0.8821785, 1, 0, 0.9176471, 1,
1.087445, -1.760788, 3.689, 1, 0, 0.9137255, 1,
1.091752, -1.090543, 0.3065612, 1, 0, 0.9058824, 1,
1.095383, -2.895087, 2.037751, 1, 0, 0.9019608, 1,
1.104592, -0.06532586, 1.275267, 1, 0, 0.8941177, 1,
1.106825, 1.503972, 0.6708621, 1, 0, 0.8862745, 1,
1.10768, -1.576691, 2.053478, 1, 0, 0.8823529, 1,
1.111067, 1.236144, 2.468601, 1, 0, 0.8745098, 1,
1.112858, -0.108759, 1.266257, 1, 0, 0.8705882, 1,
1.116179, 1.29097, 1.043312, 1, 0, 0.8627451, 1,
1.119667, -0.4975908, 2.351451, 1, 0, 0.8588235, 1,
1.126556, 0.3289931, 1.362306, 1, 0, 0.8509804, 1,
1.128165, 0.6362032, 0.6656834, 1, 0, 0.8470588, 1,
1.144874, 1.49597, 1.509892, 1, 0, 0.8392157, 1,
1.151037, 0.2218189, 2.139651, 1, 0, 0.8352941, 1,
1.163979, -1.074926, 3.034886, 1, 0, 0.827451, 1,
1.166346, 0.2508902, 1.420035, 1, 0, 0.8235294, 1,
1.192277, -0.004054015, 1.752084, 1, 0, 0.8156863, 1,
1.198142, 1.202857, -0.9260858, 1, 0, 0.8117647, 1,
1.204702, 0.3160434, 2.366167, 1, 0, 0.8039216, 1,
1.205109, 0.4236443, 0.4120698, 1, 0, 0.7960784, 1,
1.206693, 1.042592, 1.537459, 1, 0, 0.7921569, 1,
1.207714, 0.3768423, 0.5384229, 1, 0, 0.7843137, 1,
1.208337, -1.40887, 1.942283, 1, 0, 0.7803922, 1,
1.212663, 1.48626, 1.7351, 1, 0, 0.772549, 1,
1.21395, -1.3821, 1.993521, 1, 0, 0.7686275, 1,
1.219973, -1.488515, 0.08994999, 1, 0, 0.7607843, 1,
1.221999, 1.168847, 1.745667, 1, 0, 0.7568628, 1,
1.224523, 0.1480982, 2.898684, 1, 0, 0.7490196, 1,
1.228302, -0.2488214, 0.2055598, 1, 0, 0.7450981, 1,
1.232117, 0.5304841, 0.7798334, 1, 0, 0.7372549, 1,
1.23687, -0.00203948, 1.146644, 1, 0, 0.7333333, 1,
1.238458, 0.3655224, 0.5651746, 1, 0, 0.7254902, 1,
1.238745, 1.325991, -0.216928, 1, 0, 0.7215686, 1,
1.241083, -0.3914795, 0.07251113, 1, 0, 0.7137255, 1,
1.242968, -0.07135369, 2.141448, 1, 0, 0.7098039, 1,
1.246158, -1.172501, 2.909138, 1, 0, 0.7019608, 1,
1.252313, -0.06094599, 1.288412, 1, 0, 0.6941177, 1,
1.253739, 0.3814654, 0.154891, 1, 0, 0.6901961, 1,
1.256654, 0.7016543, -0.7306474, 1, 0, 0.682353, 1,
1.257054, -0.05471177, 3.007802, 1, 0, 0.6784314, 1,
1.259629, -0.6709434, 1.855375, 1, 0, 0.6705883, 1,
1.262497, 1.35948, 2.313214, 1, 0, 0.6666667, 1,
1.262975, -3.479741, 2.610046, 1, 0, 0.6588235, 1,
1.265589, -0.9882815, 2.342752, 1, 0, 0.654902, 1,
1.279, 0.9915564, 2.007063, 1, 0, 0.6470588, 1,
1.283664, 0.2431815, -0.111813, 1, 0, 0.6431373, 1,
1.285139, -0.5601984, 4.600939, 1, 0, 0.6352941, 1,
1.296685, -1.148009, 2.464736, 1, 0, 0.6313726, 1,
1.304111, 1.518559, 1.080662, 1, 0, 0.6235294, 1,
1.307752, 1.039464, -0.1512152, 1, 0, 0.6196079, 1,
1.307878, -1.095269, 2.128879, 1, 0, 0.6117647, 1,
1.310668, -0.7069318, 1.195986, 1, 0, 0.6078432, 1,
1.316695, 0.6692414, 2.403707, 1, 0, 0.6, 1,
1.323553, -0.3967638, 1.58176, 1, 0, 0.5921569, 1,
1.323682, -0.7032638, 2.742494, 1, 0, 0.5882353, 1,
1.32709, 1.094627, 0.8258126, 1, 0, 0.5803922, 1,
1.331365, -0.3487329, 1.92822, 1, 0, 0.5764706, 1,
1.358838, -0.5212397, 2.340874, 1, 0, 0.5686275, 1,
1.360466, -1.035974, 2.421363, 1, 0, 0.5647059, 1,
1.375968, 1.717892, 0.6391505, 1, 0, 0.5568628, 1,
1.376474, -1.202028, 2.898432, 1, 0, 0.5529412, 1,
1.381384, 0.007044736, 2.305015, 1, 0, 0.5450981, 1,
1.397865, -0.9217786, 0.8523858, 1, 0, 0.5411765, 1,
1.408935, -0.2477989, 0.368362, 1, 0, 0.5333334, 1,
1.415751, -0.8450087, -1.033828, 1, 0, 0.5294118, 1,
1.421312, -0.8071379, 3.056915, 1, 0, 0.5215687, 1,
1.426427, -0.7086794, 1.600025, 1, 0, 0.5176471, 1,
1.427371, 1.015733, 1.813794, 1, 0, 0.509804, 1,
1.433053, 0.2032353, 1.720641, 1, 0, 0.5058824, 1,
1.435581, -2.407271, 2.715039, 1, 0, 0.4980392, 1,
1.438624, 0.5527216, 2.091209, 1, 0, 0.4901961, 1,
1.446748, -1.937966, 1.016261, 1, 0, 0.4862745, 1,
1.4872, -0.5182219, 1.78214, 1, 0, 0.4784314, 1,
1.492737, 2.46962, -0.07495559, 1, 0, 0.4745098, 1,
1.502297, -0.4333716, 1.859924, 1, 0, 0.4666667, 1,
1.504092, 1.617012, 0.8299134, 1, 0, 0.4627451, 1,
1.511332, 0.4406052, 0.4180243, 1, 0, 0.454902, 1,
1.514799, -0.7350917, 0.9069074, 1, 0, 0.4509804, 1,
1.522476, 0.6074531, 2.718672, 1, 0, 0.4431373, 1,
1.52803, -1.12204, 4.682603, 1, 0, 0.4392157, 1,
1.528823, 0.4711387, 2.768227, 1, 0, 0.4313726, 1,
1.54797, -0.006101383, 1.598766, 1, 0, 0.427451, 1,
1.573522, -1.300063, 2.445024, 1, 0, 0.4196078, 1,
1.577096, -0.02212122, 3.03739, 1, 0, 0.4156863, 1,
1.597095, -0.3142422, 0.9510699, 1, 0, 0.4078431, 1,
1.598864, 0.1333516, 2.917982, 1, 0, 0.4039216, 1,
1.610824, 0.3358639, -1.381582, 1, 0, 0.3960784, 1,
1.618188, -1.267882, 2.833021, 1, 0, 0.3882353, 1,
1.622896, -1.151621, 1.944424, 1, 0, 0.3843137, 1,
1.627597, -0.5260211, 2.138243, 1, 0, 0.3764706, 1,
1.629916, -0.8258086, 2.157967, 1, 0, 0.372549, 1,
1.637775, 1.591154, -0.05848864, 1, 0, 0.3647059, 1,
1.638375, -0.2208098, 3.128051, 1, 0, 0.3607843, 1,
1.643743, -0.3800948, 0.3862425, 1, 0, 0.3529412, 1,
1.652702, -0.7084264, 3.09317, 1, 0, 0.3490196, 1,
1.662541, 0.4498659, 1.830213, 1, 0, 0.3411765, 1,
1.669152, -0.1219196, 3.982627, 1, 0, 0.3372549, 1,
1.678626, -0.1575947, 2.159698, 1, 0, 0.3294118, 1,
1.680383, -0.5447831, 1.470883, 1, 0, 0.3254902, 1,
1.680913, -1.196197, 2.099786, 1, 0, 0.3176471, 1,
1.683098, 1.761808, 0.758972, 1, 0, 0.3137255, 1,
1.684766, 1.224912, 0.963295, 1, 0, 0.3058824, 1,
1.685126, 3.001746, 0.8123986, 1, 0, 0.2980392, 1,
1.697745, -0.5156568, 2.028268, 1, 0, 0.2941177, 1,
1.701418, 0.8101927, 3.065507, 1, 0, 0.2862745, 1,
1.702406, 0.7172966, 0.687998, 1, 0, 0.282353, 1,
1.703422, -0.03789168, 1.857156, 1, 0, 0.2745098, 1,
1.710355, 0.9578347, 1.155612, 1, 0, 0.2705882, 1,
1.733494, 0.5536296, 3.437999, 1, 0, 0.2627451, 1,
1.749241, 2.825011, 0.4790137, 1, 0, 0.2588235, 1,
1.761646, 0.8847445, 0.3377233, 1, 0, 0.2509804, 1,
1.763094, -0.2233743, 0.9650254, 1, 0, 0.2470588, 1,
1.776681, 0.1711178, 2.509733, 1, 0, 0.2392157, 1,
1.815995, -0.6595951, 2.143903, 1, 0, 0.2352941, 1,
1.823121, 0.03215167, 1.557798, 1, 0, 0.227451, 1,
1.827607, -1.317448, 1.712325, 1, 0, 0.2235294, 1,
1.828191, -0.5304138, 1.664604, 1, 0, 0.2156863, 1,
1.853308, 0.275918, 0.2424178, 1, 0, 0.2117647, 1,
1.880192, -0.8371512, 1.744258, 1, 0, 0.2039216, 1,
1.891129, 0.7507786, -0.5840982, 1, 0, 0.1960784, 1,
1.892715, 0.4370548, 2.046471, 1, 0, 0.1921569, 1,
1.913621, 0.7084249, 1.047462, 1, 0, 0.1843137, 1,
1.928528, -1.005258, 3.120281, 1, 0, 0.1803922, 1,
1.931867, 0.6465993, 1.548579, 1, 0, 0.172549, 1,
1.950225, -1.433482, 1.854353, 1, 0, 0.1686275, 1,
1.996714, 0.4842533, 0.5788098, 1, 0, 0.1607843, 1,
2.001408, 0.5648375, 1.12432, 1, 0, 0.1568628, 1,
2.003783, 1.185735, -1.029096, 1, 0, 0.1490196, 1,
2.031063, -0.8151706, 0.3673579, 1, 0, 0.145098, 1,
2.04743, -0.07781851, 1.547569, 1, 0, 0.1372549, 1,
2.050542, 0.6096534, 1.968136, 1, 0, 0.1333333, 1,
2.097988, -0.9207826, 0.9181053, 1, 0, 0.1254902, 1,
2.127044, -0.7912291, 0.1639606, 1, 0, 0.1215686, 1,
2.159779, 0.6900885, 2.606077, 1, 0, 0.1137255, 1,
2.170294, 0.8903393, -2.073644, 1, 0, 0.1098039, 1,
2.184247, -0.6051192, 1.583483, 1, 0, 0.1019608, 1,
2.185771, 0.5075905, 1.585388, 1, 0, 0.09411765, 1,
2.240604, -0.9990539, 2.517837, 1, 0, 0.09019608, 1,
2.318211, -0.9693898, 1.310681, 1, 0, 0.08235294, 1,
2.347738, -0.667385, 1.195297, 1, 0, 0.07843138, 1,
2.361933, 0.529231, 0.7804115, 1, 0, 0.07058824, 1,
2.371539, 0.7673417, 0.5823594, 1, 0, 0.06666667, 1,
2.382808, -0.437717, 1.517555, 1, 0, 0.05882353, 1,
2.390151, -0.05071365, 2.933913, 1, 0, 0.05490196, 1,
2.415186, -0.6318868, 2.170186, 1, 0, 0.04705882, 1,
2.439119, -0.9405333, 3.11317, 1, 0, 0.04313726, 1,
2.444544, 0.6526472, 1.054582, 1, 0, 0.03529412, 1,
2.463878, 0.6381927, 1.746398, 1, 0, 0.03137255, 1,
2.569201, 1.393753, -0.1533147, 1, 0, 0.02352941, 1,
2.708963, -0.6549937, 1.353075, 1, 0, 0.01960784, 1,
2.725758, 1.129714, 0.2907117, 1, 0, 0.01176471, 1,
3.5624, 1.128971, 1.759977, 1, 0, 0.007843138, 1
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
-0.009393811, -4.578353, -6.534615, 0, -0.5, 0.5, 0.5,
-0.009393811, -4.578353, -6.534615, 1, -0.5, 0.5, 0.5,
-0.009393811, -4.578353, -6.534615, 1, 1.5, 0.5, 0.5,
-0.009393811, -4.578353, -6.534615, 0, 1.5, 0.5, 0.5
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
-4.792026, -0.2389973, -6.534615, 0, -0.5, 0.5, 0.5,
-4.792026, -0.2389973, -6.534615, 1, -0.5, 0.5, 0.5,
-4.792026, -0.2389973, -6.534615, 1, 1.5, 0.5, 0.5,
-4.792026, -0.2389973, -6.534615, 0, 1.5, 0.5, 0.5
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
-4.792026, -4.578353, 0.2924881, 0, -0.5, 0.5, 0.5,
-4.792026, -4.578353, 0.2924881, 1, -0.5, 0.5, 0.5,
-4.792026, -4.578353, 0.2924881, 1, 1.5, 0.5, 0.5,
-4.792026, -4.578353, 0.2924881, 0, 1.5, 0.5, 0.5
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
-2, -3.576963, -4.959129,
2, -3.576963, -4.959129,
-2, -3.576963, -4.959129,
-2, -3.743861, -5.22171,
0, -3.576963, -4.959129,
0, -3.743861, -5.22171,
2, -3.576963, -4.959129,
2, -3.743861, -5.22171
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
-2, -4.077658, -5.746872, 0, -0.5, 0.5, 0.5,
-2, -4.077658, -5.746872, 1, -0.5, 0.5, 0.5,
-2, -4.077658, -5.746872, 1, 1.5, 0.5, 0.5,
-2, -4.077658, -5.746872, 0, 1.5, 0.5, 0.5,
0, -4.077658, -5.746872, 0, -0.5, 0.5, 0.5,
0, -4.077658, -5.746872, 1, -0.5, 0.5, 0.5,
0, -4.077658, -5.746872, 1, 1.5, 0.5, 0.5,
0, -4.077658, -5.746872, 0, 1.5, 0.5, 0.5,
2, -4.077658, -5.746872, 0, -0.5, 0.5, 0.5,
2, -4.077658, -5.746872, 1, -0.5, 0.5, 0.5,
2, -4.077658, -5.746872, 1, 1.5, 0.5, 0.5,
2, -4.077658, -5.746872, 0, 1.5, 0.5, 0.5
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
-3.688341, -3, -4.959129,
-3.688341, 3, -4.959129,
-3.688341, -3, -4.959129,
-3.872289, -3, -5.22171,
-3.688341, -2, -4.959129,
-3.872289, -2, -5.22171,
-3.688341, -1, -4.959129,
-3.872289, -1, -5.22171,
-3.688341, 0, -4.959129,
-3.872289, 0, -5.22171,
-3.688341, 1, -4.959129,
-3.872289, 1, -5.22171,
-3.688341, 2, -4.959129,
-3.872289, 2, -5.22171,
-3.688341, 3, -4.959129,
-3.872289, 3, -5.22171
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
-4.240183, -3, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, -3, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, -3, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, -3, -5.746872, 0, 1.5, 0.5, 0.5,
-4.240183, -2, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, -2, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, -2, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, -2, -5.746872, 0, 1.5, 0.5, 0.5,
-4.240183, -1, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, -1, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, -1, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, -1, -5.746872, 0, 1.5, 0.5, 0.5,
-4.240183, 0, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, 0, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, 0, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, 0, -5.746872, 0, 1.5, 0.5, 0.5,
-4.240183, 1, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, 1, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, 1, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, 1, -5.746872, 0, 1.5, 0.5, 0.5,
-4.240183, 2, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, 2, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, 2, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, 2, -5.746872, 0, 1.5, 0.5, 0.5,
-4.240183, 3, -5.746872, 0, -0.5, 0.5, 0.5,
-4.240183, 3, -5.746872, 1, -0.5, 0.5, 0.5,
-4.240183, 3, -5.746872, 1, 1.5, 0.5, 0.5,
-4.240183, 3, -5.746872, 0, 1.5, 0.5, 0.5
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
-3.688341, -3.576963, -4,
-3.688341, -3.576963, 4,
-3.688341, -3.576963, -4,
-3.872289, -3.743861, -4,
-3.688341, -3.576963, -2,
-3.872289, -3.743861, -2,
-3.688341, -3.576963, 0,
-3.872289, -3.743861, 0,
-3.688341, -3.576963, 2,
-3.872289, -3.743861, 2,
-3.688341, -3.576963, 4,
-3.872289, -3.743861, 4
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
-4.240183, -4.077658, -4, 0, -0.5, 0.5, 0.5,
-4.240183, -4.077658, -4, 1, -0.5, 0.5, 0.5,
-4.240183, -4.077658, -4, 1, 1.5, 0.5, 0.5,
-4.240183, -4.077658, -4, 0, 1.5, 0.5, 0.5,
-4.240183, -4.077658, -2, 0, -0.5, 0.5, 0.5,
-4.240183, -4.077658, -2, 1, -0.5, 0.5, 0.5,
-4.240183, -4.077658, -2, 1, 1.5, 0.5, 0.5,
-4.240183, -4.077658, -2, 0, 1.5, 0.5, 0.5,
-4.240183, -4.077658, 0, 0, -0.5, 0.5, 0.5,
-4.240183, -4.077658, 0, 1, -0.5, 0.5, 0.5,
-4.240183, -4.077658, 0, 1, 1.5, 0.5, 0.5,
-4.240183, -4.077658, 0, 0, 1.5, 0.5, 0.5,
-4.240183, -4.077658, 2, 0, -0.5, 0.5, 0.5,
-4.240183, -4.077658, 2, 1, -0.5, 0.5, 0.5,
-4.240183, -4.077658, 2, 1, 1.5, 0.5, 0.5,
-4.240183, -4.077658, 2, 0, 1.5, 0.5, 0.5,
-4.240183, -4.077658, 4, 0, -0.5, 0.5, 0.5,
-4.240183, -4.077658, 4, 1, -0.5, 0.5, 0.5,
-4.240183, -4.077658, 4, 1, 1.5, 0.5, 0.5,
-4.240183, -4.077658, 4, 0, 1.5, 0.5, 0.5
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
-3.688341, -3.576963, -4.959129,
-3.688341, 3.098969, -4.959129,
-3.688341, -3.576963, 5.544106,
-3.688341, 3.098969, 5.544106,
-3.688341, -3.576963, -4.959129,
-3.688341, -3.576963, 5.544106,
-3.688341, 3.098969, -4.959129,
-3.688341, 3.098969, 5.544106,
-3.688341, -3.576963, -4.959129,
3.669554, -3.576963, -4.959129,
-3.688341, -3.576963, 5.544106,
3.669554, -3.576963, 5.544106,
-3.688341, 3.098969, -4.959129,
3.669554, 3.098969, -4.959129,
-3.688341, 3.098969, 5.544106,
3.669554, 3.098969, 5.544106,
3.669554, -3.576963, -4.959129,
3.669554, 3.098969, -4.959129,
3.669554, -3.576963, 5.544106,
3.669554, 3.098969, 5.544106,
3.669554, -3.576963, -4.959129,
3.669554, -3.576963, 5.544106,
3.669554, 3.098969, -4.959129,
3.669554, 3.098969, 5.544106
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
var radius = 7.720122;
var distance = 34.3477;
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
mvMatrix.translate( 0.009393811, 0.2389973, -0.2924881 );
mvMatrix.scale( 1.134448, 1.250335, 0.7947216 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3477);
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
isoxapyrifop<-read.table("isoxapyrifop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxapyrifop$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxapyrifop' not found
```

```r
y<-isoxapyrifop$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxapyrifop' not found
```

```r
z<-isoxapyrifop$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxapyrifop' not found
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
-3.581187, -2.274956, 0.0680692, 0, 0, 1, 1, 1,
-3.471972, -0.857011, -0.574415, 1, 0, 0, 1, 1,
-2.50308, -0.6032132, -3.531789, 1, 0, 0, 1, 1,
-2.453561, -0.3192026, -3.551563, 1, 0, 0, 1, 1,
-2.393618, 0.1626082, -2.011838, 1, 0, 0, 1, 1,
-2.392309, -0.1034945, -1.242623, 1, 0, 0, 1, 1,
-2.280659, -0.2925172, -0.8795615, 0, 0, 0, 1, 1,
-2.263097, 0.2671021, -2.667058, 0, 0, 0, 1, 1,
-2.246206, 0.6888781, -2.435958, 0, 0, 0, 1, 1,
-2.24558, 0.7464231, -2.091898, 0, 0, 0, 1, 1,
-2.211608, -1.259903, -1.133897, 0, 0, 0, 1, 1,
-2.186373, 0.8207926, -1.303186, 0, 0, 0, 1, 1,
-2.162672, -0.2523672, -4.366004, 0, 0, 0, 1, 1,
-2.159936, -0.0715684, -1.667646, 1, 1, 1, 1, 1,
-2.136647, -1.254886, -1.938903, 1, 1, 1, 1, 1,
-2.129046, 0.8062394, -3.427264, 1, 1, 1, 1, 1,
-2.111528, -0.3350306, -0.9315563, 1, 1, 1, 1, 1,
-2.088621, -1.086009, -2.630201, 1, 1, 1, 1, 1,
-2.066206, -0.3608696, 0.2864217, 1, 1, 1, 1, 1,
-2.053084, 0.1291753, -1.732124, 1, 1, 1, 1, 1,
-2.050512, 0.8430526, -0.0619988, 1, 1, 1, 1, 1,
-2.020069, 0.3029903, -0.9043984, 1, 1, 1, 1, 1,
-2.005083, 1.382874, -2.810181, 1, 1, 1, 1, 1,
-1.991985, 0.5236852, -2.265261, 1, 1, 1, 1, 1,
-1.981914, -0.6957392, -2.356686, 1, 1, 1, 1, 1,
-1.978677, 1.365484, 0.1332587, 1, 1, 1, 1, 1,
-1.954172, 0.507039, -0.8736871, 1, 1, 1, 1, 1,
-1.951378, -1.012404, -3.983544, 1, 1, 1, 1, 1,
-1.930636, 0.7647669, -2.156921, 0, 0, 1, 1, 1,
-1.928629, 0.5718499, -2.17357, 1, 0, 0, 1, 1,
-1.920974, 0.4947883, -1.014509, 1, 0, 0, 1, 1,
-1.902828, 0.2172605, -1.316029, 1, 0, 0, 1, 1,
-1.89716, -1.769451, -2.529213, 1, 0, 0, 1, 1,
-1.873013, 0.163269, -1.333956, 1, 0, 0, 1, 1,
-1.867807, 1.732178, 0.08469588, 0, 0, 0, 1, 1,
-1.840953, -0.2279959, -1.897269, 0, 0, 0, 1, 1,
-1.833922, -1.046253, -3.154011, 0, 0, 0, 1, 1,
-1.820461, -0.8466145, -0.8650716, 0, 0, 0, 1, 1,
-1.817942, 1.418697, -2.316043, 0, 0, 0, 1, 1,
-1.809584, 0.5182428, -1.204136, 0, 0, 0, 1, 1,
-1.792645, -1.661603, -3.151986, 0, 0, 0, 1, 1,
-1.78895, -0.1342203, -1.492162, 1, 1, 1, 1, 1,
-1.772064, 0.5852332, -0.9663375, 1, 1, 1, 1, 1,
-1.769762, -0.3889084, -0.5315494, 1, 1, 1, 1, 1,
-1.763462, 1.186414, -2.862822, 1, 1, 1, 1, 1,
-1.748688, 0.8373378, -1.45859, 1, 1, 1, 1, 1,
-1.748223, 1.048855, 0.2201317, 1, 1, 1, 1, 1,
-1.747694, 0.8345031, -0.07876739, 1, 1, 1, 1, 1,
-1.731333, 0.1120636, -1.838874, 1, 1, 1, 1, 1,
-1.724134, 0.6433503, -2.323626, 1, 1, 1, 1, 1,
-1.707462, 0.5417287, -0.9850009, 1, 1, 1, 1, 1,
-1.70376, -2.02476, -1.911069, 1, 1, 1, 1, 1,
-1.687987, -0.533173, -1.022926, 1, 1, 1, 1, 1,
-1.682962, 0.3450224, -0.6885487, 1, 1, 1, 1, 1,
-1.679762, 1.378371, -2.158067, 1, 1, 1, 1, 1,
-1.676712, -0.1467481, -1.203709, 1, 1, 1, 1, 1,
-1.655857, 1.071108, -1.021011, 0, 0, 1, 1, 1,
-1.655673, -0.1549938, -1.859221, 1, 0, 0, 1, 1,
-1.653893, -1.56005, -3.39633, 1, 0, 0, 1, 1,
-1.649297, -0.05519978, -1.322152, 1, 0, 0, 1, 1,
-1.645375, 0.9699336, -1.616623, 1, 0, 0, 1, 1,
-1.629701, 0.831492, -0.7472429, 1, 0, 0, 1, 1,
-1.588601, -1.070076, -0.09022828, 0, 0, 0, 1, 1,
-1.568113, -1.145616, -2.793656, 0, 0, 0, 1, 1,
-1.560991, 0.7350885, -0.2080054, 0, 0, 0, 1, 1,
-1.542421, 0.8533791, 0.4379832, 0, 0, 0, 1, 1,
-1.536329, 0.2755135, -1.110764, 0, 0, 0, 1, 1,
-1.528157, -0.05797239, -0.5242629, 0, 0, 0, 1, 1,
-1.509186, -1.158277, -1.273659, 0, 0, 0, 1, 1,
-1.489359, 1.304267, 0.2294433, 1, 1, 1, 1, 1,
-1.488482, -1.555401, -1.68691, 1, 1, 1, 1, 1,
-1.481406, 0.7035037, 0.5271182, 1, 1, 1, 1, 1,
-1.481399, 0.2271898, -0.5227746, 1, 1, 1, 1, 1,
-1.469378, 1.719349, -0.02278008, 1, 1, 1, 1, 1,
-1.450536, 0.05184739, 0.07092123, 1, 1, 1, 1, 1,
-1.448617, 0.6115085, -1.525575, 1, 1, 1, 1, 1,
-1.42682, 0.6724002, -0.8425367, 1, 1, 1, 1, 1,
-1.426537, 0.9321146, -0.9489803, 1, 1, 1, 1, 1,
-1.407684, -0.5453375, -0.3693204, 1, 1, 1, 1, 1,
-1.407555, -1.643572, -2.596237, 1, 1, 1, 1, 1,
-1.392172, 1.071475, -1.561275, 1, 1, 1, 1, 1,
-1.389643, 0.6450078, -1.750295, 1, 1, 1, 1, 1,
-1.385353, 0.9515182, 0.009217981, 1, 1, 1, 1, 1,
-1.382131, -0.7413858, -2.862014, 1, 1, 1, 1, 1,
-1.379702, -1.202827, -2.589283, 0, 0, 1, 1, 1,
-1.376828, -0.7794793, -0.6597438, 1, 0, 0, 1, 1,
-1.372651, 2.293143, -0.1976091, 1, 0, 0, 1, 1,
-1.360905, 0.9019884, -1.790885, 1, 0, 0, 1, 1,
-1.360687, 1.506344, -0.9049976, 1, 0, 0, 1, 1,
-1.359335, 0.5168195, -1.100361, 1, 0, 0, 1, 1,
-1.352556, -0.01949597, -1.625996, 0, 0, 0, 1, 1,
-1.349114, 0.7933617, -0.1471523, 0, 0, 0, 1, 1,
-1.342193, 0.5319949, -1.060392, 0, 0, 0, 1, 1,
-1.337259, 0.1732783, -0.6708131, 0, 0, 0, 1, 1,
-1.336328, 1.682845, -0.3954816, 0, 0, 0, 1, 1,
-1.328376, -1.286711, -1.832369, 0, 0, 0, 1, 1,
-1.319816, 0.08975976, -1.634911, 0, 0, 0, 1, 1,
-1.314137, -0.002350596, -1.281271, 1, 1, 1, 1, 1,
-1.306915, -1.945038, -3.681006, 1, 1, 1, 1, 1,
-1.293155, -1.339006, -2.629539, 1, 1, 1, 1, 1,
-1.284924, 0.8544654, 0.2477623, 1, 1, 1, 1, 1,
-1.282422, 0.2223351, -2.359727, 1, 1, 1, 1, 1,
-1.280779, 0.3637489, -1.546862, 1, 1, 1, 1, 1,
-1.278271, 0.8463902, -0.3534591, 1, 1, 1, 1, 1,
-1.277649, 0.3932201, -2.645488, 1, 1, 1, 1, 1,
-1.271227, 0.2267138, -1.471446, 1, 1, 1, 1, 1,
-1.260858, -0.4030461, -1.71182, 1, 1, 1, 1, 1,
-1.25993, 0.002734636, -0.8491533, 1, 1, 1, 1, 1,
-1.249405, 0.6335907, -1.676943, 1, 1, 1, 1, 1,
-1.249359, 0.6231731, -1.23202, 1, 1, 1, 1, 1,
-1.245481, -1.267222, -0.7844862, 1, 1, 1, 1, 1,
-1.245248, 0.9550908, -1.750599, 1, 1, 1, 1, 1,
-1.24217, 0.4171739, 1.122052, 0, 0, 1, 1, 1,
-1.2399, -1.217732, -3.698584, 1, 0, 0, 1, 1,
-1.229315, -0.6212509, -2.994607, 1, 0, 0, 1, 1,
-1.223366, -0.01080013, -1.11823, 1, 0, 0, 1, 1,
-1.216223, -0.8788934, -2.501279, 1, 0, 0, 1, 1,
-1.212026, -0.05349914, -2.246095, 1, 0, 0, 1, 1,
-1.209504, -0.07102975, -3.193886, 0, 0, 0, 1, 1,
-1.204594, 0.430883, -1.234364, 0, 0, 0, 1, 1,
-1.201734, -0.7089629, -1.115338, 0, 0, 0, 1, 1,
-1.19821, 0.2299018, -1.767485, 0, 0, 0, 1, 1,
-1.189683, 1.744876, -0.438015, 0, 0, 0, 1, 1,
-1.188905, 0.9336504, -1.638221, 0, 0, 0, 1, 1,
-1.185482, -0.7543178, -3.879842, 0, 0, 0, 1, 1,
-1.182391, 0.4652848, -2.390159, 1, 1, 1, 1, 1,
-1.178141, -0.7095895, -2.500129, 1, 1, 1, 1, 1,
-1.172075, 1.305772, -2.153094, 1, 1, 1, 1, 1,
-1.172019, -0.1331032, -1.946597, 1, 1, 1, 1, 1,
-1.17175, -0.09604036, -1.3088, 1, 1, 1, 1, 1,
-1.161461, 1.474199, -0.4733617, 1, 1, 1, 1, 1,
-1.15884, 0.2072742, -2.140294, 1, 1, 1, 1, 1,
-1.157858, 0.936472, 0.001293469, 1, 1, 1, 1, 1,
-1.155083, -0.5243966, -1.149428, 1, 1, 1, 1, 1,
-1.154305, 0.3440399, -0.00294494, 1, 1, 1, 1, 1,
-1.151099, 0.8558009, -1.622614, 1, 1, 1, 1, 1,
-1.148462, -0.1402268, -0.7577496, 1, 1, 1, 1, 1,
-1.135794, 0.07075136, -2.128471, 1, 1, 1, 1, 1,
-1.134301, -1.481361, -3.070333, 1, 1, 1, 1, 1,
-1.132132, 0.7356701, -0.9236842, 1, 1, 1, 1, 1,
-1.132004, -1.741872, -1.844219, 0, 0, 1, 1, 1,
-1.122639, 0.06881741, -0.6965504, 1, 0, 0, 1, 1,
-1.116825, -1.684172, -3.359979, 1, 0, 0, 1, 1,
-1.115945, -0.9416529, -2.457183, 1, 0, 0, 1, 1,
-1.108688, 0.09683193, -0.8092051, 1, 0, 0, 1, 1,
-1.108377, -0.9505321, -3.479743, 1, 0, 0, 1, 1,
-1.10824, -0.2962854, -3.036793, 0, 0, 0, 1, 1,
-1.107812, 1.239638, -1.450971, 0, 0, 0, 1, 1,
-1.103747, -1.449731, -2.88043, 0, 0, 0, 1, 1,
-1.101756, -0.3100254, -1.995691, 0, 0, 0, 1, 1,
-1.070143, -1.533959, -1.454169, 0, 0, 0, 1, 1,
-1.069842, -0.963755, -3.252038, 0, 0, 0, 1, 1,
-1.061441, 0.6033675, -1.153178, 0, 0, 0, 1, 1,
-1.059414, -0.3245475, -1.135137, 1, 1, 1, 1, 1,
-1.058877, 0.124032, -1.204929, 1, 1, 1, 1, 1,
-1.054747, 0.7271969, -1.06058, 1, 1, 1, 1, 1,
-1.042085, 0.2631083, -2.129015, 1, 1, 1, 1, 1,
-1.040356, 0.09572752, -0.333585, 1, 1, 1, 1, 1,
-1.038565, 0.09649348, -0.9185899, 1, 1, 1, 1, 1,
-1.034728, -1.844341, -2.207386, 1, 1, 1, 1, 1,
-1.030655, -1.53052, -2.221131, 1, 1, 1, 1, 1,
-1.030306, 2.001331, -0.6609696, 1, 1, 1, 1, 1,
-1.030041, -0.1944435, -1.73654, 1, 1, 1, 1, 1,
-1.026635, -0.04006921, -3.833944, 1, 1, 1, 1, 1,
-1.020087, 0.5630326, -0.6765891, 1, 1, 1, 1, 1,
-1.009589, 0.3138325, -2.570188, 1, 1, 1, 1, 1,
-1.009438, 0.604993, -0.04573917, 1, 1, 1, 1, 1,
-1.006842, 2.471766, -0.5298942, 1, 1, 1, 1, 1,
-1.004803, 2.114598, 0.2600691, 0, 0, 1, 1, 1,
-0.9974309, -1.196367, -2.634673, 1, 0, 0, 1, 1,
-0.9969681, 0.4595862, -0.6006981, 1, 0, 0, 1, 1,
-0.9962875, -1.708077, -1.855955, 1, 0, 0, 1, 1,
-0.9907455, -0.2278681, -2.072491, 1, 0, 0, 1, 1,
-0.9907092, 0.6845207, -3.229796, 1, 0, 0, 1, 1,
-0.9844927, 0.0953709, -2.026515, 0, 0, 0, 1, 1,
-0.9791542, -0.5400129, -4.80617, 0, 0, 0, 1, 1,
-0.9732613, 0.348551, -2.662668, 0, 0, 0, 1, 1,
-0.9720214, -0.5804332, -1.82562, 0, 0, 0, 1, 1,
-0.960641, -1.210127, -2.398034, 0, 0, 0, 1, 1,
-0.9591646, -1.577905, -2.210487, 0, 0, 0, 1, 1,
-0.9588276, 0.5440894, 0.2659407, 0, 0, 0, 1, 1,
-0.9560586, 0.08545757, -2.180371, 1, 1, 1, 1, 1,
-0.9549591, 1.265756, -0.2750573, 1, 1, 1, 1, 1,
-0.9534764, 0.6357616, -3.367616, 1, 1, 1, 1, 1,
-0.9410888, 0.6110711, -0.3637972, 1, 1, 1, 1, 1,
-0.9401761, -0.6634516, -2.842723, 1, 1, 1, 1, 1,
-0.9336167, -1.033321, -3.615363, 1, 1, 1, 1, 1,
-0.932913, 0.7679003, -1.364455, 1, 1, 1, 1, 1,
-0.9303871, -0.9699314, -3.088431, 1, 1, 1, 1, 1,
-0.9217695, 0.4094636, 0.8949286, 1, 1, 1, 1, 1,
-0.9208204, -0.5297267, -4.091566, 1, 1, 1, 1, 1,
-0.9197132, -0.4624456, -2.60773, 1, 1, 1, 1, 1,
-0.9109794, -0.830996, -1.107906, 1, 1, 1, 1, 1,
-0.9099627, -1.763195, -2.05004, 1, 1, 1, 1, 1,
-0.9058083, 0.09663352, 0.2689813, 1, 1, 1, 1, 1,
-0.9037997, -1.86013, -4.33478, 1, 1, 1, 1, 1,
-0.90114, -0.4989246, -1.702754, 0, 0, 1, 1, 1,
-0.8866905, 0.04801329, -2.130546, 1, 0, 0, 1, 1,
-0.8810126, 1.744429, 0.9341815, 1, 0, 0, 1, 1,
-0.8803086, 1.178982, -0.189943, 1, 0, 0, 1, 1,
-0.8794352, 0.0862238, -2.577777, 1, 0, 0, 1, 1,
-0.8722285, -0.02083958, -2.233008, 1, 0, 0, 1, 1,
-0.8685914, 0.4464989, -2.220517, 0, 0, 0, 1, 1,
-0.8658814, -0.2951663, -0.09941872, 0, 0, 0, 1, 1,
-0.8643257, -1.413445, -2.810941, 0, 0, 0, 1, 1,
-0.8617186, -1.534314, -2.819659, 0, 0, 0, 1, 1,
-0.8597797, -2.678269, -3.847276, 0, 0, 0, 1, 1,
-0.8590132, 0.9695328, 0.9990055, 0, 0, 0, 1, 1,
-0.85712, -0.8561289, -2.73364, 0, 0, 0, 1, 1,
-0.8537982, -0.01029058, -1.854943, 1, 1, 1, 1, 1,
-0.8521671, -0.8050362, -4.096428, 1, 1, 1, 1, 1,
-0.8500274, -1.192387, -2.373394, 1, 1, 1, 1, 1,
-0.841334, -1.171421, -1.498877, 1, 1, 1, 1, 1,
-0.8342394, 0.5659716, -2.068234, 1, 1, 1, 1, 1,
-0.8341484, 0.5765445, -1.1452, 1, 1, 1, 1, 1,
-0.8297951, -0.455437, -2.061904, 1, 1, 1, 1, 1,
-0.8267334, -0.3210123, -2.406969, 1, 1, 1, 1, 1,
-0.8225456, -0.7900764, -1.307615, 1, 1, 1, 1, 1,
-0.8177668, 0.1250405, -1.596267, 1, 1, 1, 1, 1,
-0.8149003, 0.2869548, -1.071311, 1, 1, 1, 1, 1,
-0.7945437, 0.6048849, -0.5972005, 1, 1, 1, 1, 1,
-0.7892896, -0.1005813, -1.257041, 1, 1, 1, 1, 1,
-0.7886598, 1.519492, 0.5792605, 1, 1, 1, 1, 1,
-0.7834024, -0.5066465, -1.047807, 1, 1, 1, 1, 1,
-0.7794323, -0.7391315, -1.366202, 0, 0, 1, 1, 1,
-0.7787815, -2.480365, -2.377333, 1, 0, 0, 1, 1,
-0.7784048, -0.1659491, 0.1039311, 1, 0, 0, 1, 1,
-0.7776766, -3.132795, -1.753744, 1, 0, 0, 1, 1,
-0.7698925, -0.9331143, -2.452939, 1, 0, 0, 1, 1,
-0.7677495, 0.9412321, 0.8573466, 1, 0, 0, 1, 1,
-0.7675286, 1.732092, -0.2254929, 0, 0, 0, 1, 1,
-0.7673225, 0.8699154, 0.3259396, 0, 0, 0, 1, 1,
-0.7620956, -0.6817335, -1.11753, 0, 0, 0, 1, 1,
-0.7565888, 0.3033173, -0.8382205, 0, 0, 0, 1, 1,
-0.754232, -2.241256, -2.145332, 0, 0, 0, 1, 1,
-0.7524901, -1.267184, -3.144278, 0, 0, 0, 1, 1,
-0.7509887, 1.374425, -0.9047434, 0, 0, 0, 1, 1,
-0.7507095, -0.5894751, -2.177983, 1, 1, 1, 1, 1,
-0.7449702, -0.5184477, -3.302937, 1, 1, 1, 1, 1,
-0.7405841, 0.357645, -1.847515, 1, 1, 1, 1, 1,
-0.7390693, -0.2943021, -3.334099, 1, 1, 1, 1, 1,
-0.7373307, -0.4229147, -2.548779, 1, 1, 1, 1, 1,
-0.7339284, -0.2894277, -2.377195, 1, 1, 1, 1, 1,
-0.7205684, -0.6980761, -1.215708, 1, 1, 1, 1, 1,
-0.7130404, -0.2042101, -1.403865, 1, 1, 1, 1, 1,
-0.7129046, -0.6339263, -2.359859, 1, 1, 1, 1, 1,
-0.7073403, -0.4187576, -2.390519, 1, 1, 1, 1, 1,
-0.7073008, 0.5429193, -1.494881, 1, 1, 1, 1, 1,
-0.6960525, -0.6322175, -1.66367, 1, 1, 1, 1, 1,
-0.6895117, -0.78426, -4.349405, 1, 1, 1, 1, 1,
-0.6888612, -0.09949084, -1.754573, 1, 1, 1, 1, 1,
-0.6832601, -1.083821, -3.455615, 1, 1, 1, 1, 1,
-0.6831152, 0.5731047, -0.5106376, 0, 0, 1, 1, 1,
-0.6803526, 0.11403, 0.2885007, 1, 0, 0, 1, 1,
-0.6772557, 0.7538961, 0.1298029, 1, 0, 0, 1, 1,
-0.6739093, -0.4707125, -1.210636, 1, 0, 0, 1, 1,
-0.6718313, -1.112259, -1.822077, 1, 0, 0, 1, 1,
-0.6717914, 0.02493765, 0.9107209, 1, 0, 0, 1, 1,
-0.6703808, -1.277428, -2.922389, 0, 0, 0, 1, 1,
-0.6618833, 0.4755413, -2.144281, 0, 0, 0, 1, 1,
-0.6614996, -1.552195, -2.800997, 0, 0, 0, 1, 1,
-0.6573151, -0.2731315, -2.295266, 0, 0, 0, 1, 1,
-0.6562747, 2.094506, 0.1903029, 0, 0, 0, 1, 1,
-0.6522, 0.7473742, -0.8078966, 0, 0, 0, 1, 1,
-0.6480622, 0.9107755, 0.9947938, 0, 0, 0, 1, 1,
-0.6455398, -0.3324669, -1.261138, 1, 1, 1, 1, 1,
-0.6435512, 0.5641474, 1.07828, 1, 1, 1, 1, 1,
-0.642675, 0.87657, 1.626384, 1, 1, 1, 1, 1,
-0.641748, 0.6382684, 0.1866388, 1, 1, 1, 1, 1,
-0.6407794, -0.5990949, -2.451609, 1, 1, 1, 1, 1,
-0.6398039, 0.9254876, 0.5604448, 1, 1, 1, 1, 1,
-0.6396638, -0.504144, -1.881168, 1, 1, 1, 1, 1,
-0.638716, 0.5384378, -0.138229, 1, 1, 1, 1, 1,
-0.6378933, -0.7373823, -3.946609, 1, 1, 1, 1, 1,
-0.6372018, 0.3253927, -1.038428, 1, 1, 1, 1, 1,
-0.6347421, -0.2911107, -1.153441, 1, 1, 1, 1, 1,
-0.6321011, 0.9541264, -0.06233067, 1, 1, 1, 1, 1,
-0.6319034, -0.2037465, -1.350561, 1, 1, 1, 1, 1,
-0.6279162, -0.8743939, -3.043952, 1, 1, 1, 1, 1,
-0.6265072, -1.804015, -1.916547, 1, 1, 1, 1, 1,
-0.6111121, -0.4066124, -1.119782, 0, 0, 1, 1, 1,
-0.6052973, -0.02184694, -1.444014, 1, 0, 0, 1, 1,
-0.5993577, -1.443062, -2.944221, 1, 0, 0, 1, 1,
-0.5976711, -0.08155313, -1.649545, 1, 0, 0, 1, 1,
-0.5937613, 0.2765009, -0.587122, 1, 0, 0, 1, 1,
-0.5892119, 0.7175757, -1.006861, 1, 0, 0, 1, 1,
-0.5888276, 0.6343194, 0.02607649, 0, 0, 0, 1, 1,
-0.5888257, 0.82509, -1.088468, 0, 0, 0, 1, 1,
-0.5838096, 0.1843047, -2.969794, 0, 0, 0, 1, 1,
-0.582568, 0.5367684, -0.8248159, 0, 0, 0, 1, 1,
-0.5815678, 0.6808231, -1.568485, 0, 0, 0, 1, 1,
-0.580067, 0.1405116, -1.52928, 0, 0, 0, 1, 1,
-0.5747517, -0.908483, -2.637492, 0, 0, 0, 1, 1,
-0.5656626, 1.779029, 0.1277626, 1, 1, 1, 1, 1,
-0.5635208, 0.559875, 0.1060006, 1, 1, 1, 1, 1,
-0.5625644, -2.079617, -3.543225, 1, 1, 1, 1, 1,
-0.561414, -0.6835165, -1.913451, 1, 1, 1, 1, 1,
-0.5595163, 0.4854887, -1.10213, 1, 1, 1, 1, 1,
-0.5584613, 1.259128, 0.9011157, 1, 1, 1, 1, 1,
-0.5562034, -0.7595885, -2.473947, 1, 1, 1, 1, 1,
-0.5502062, -2.084638, -3.912621, 1, 1, 1, 1, 1,
-0.5477074, -0.139377, -2.026291, 1, 1, 1, 1, 1,
-0.5439274, 1.249684, -0.6699328, 1, 1, 1, 1, 1,
-0.543498, -0.2835437, -3.054127, 1, 1, 1, 1, 1,
-0.5431277, -0.1232278, -1.409832, 1, 1, 1, 1, 1,
-0.5376486, 0.1714569, -1.169042, 1, 1, 1, 1, 1,
-0.5324063, -0.5525538, -2.282988, 1, 1, 1, 1, 1,
-0.5315905, 1.171418, -1.694051, 1, 1, 1, 1, 1,
-0.5291778, -2.011026, -3.186233, 0, 0, 1, 1, 1,
-0.5262821, 0.623874, -1.383791, 1, 0, 0, 1, 1,
-0.5183977, 0.4946665, -0.9064565, 1, 0, 0, 1, 1,
-0.5136966, 0.7777234, -1.386699, 1, 0, 0, 1, 1,
-0.510006, 1.865718, -0.6473398, 1, 0, 0, 1, 1,
-0.5083638, 0.1874225, -0.1353746, 1, 0, 0, 1, 1,
-0.5054852, -0.5897194, -0.8996826, 0, 0, 0, 1, 1,
-0.5044402, -0.1088756, -0.5757288, 0, 0, 0, 1, 1,
-0.5041109, 1.392002, 0.4974014, 0, 0, 0, 1, 1,
-0.5029254, -2.099182, -3.493778, 0, 0, 0, 1, 1,
-0.5021659, 1.003176, -0.1309265, 0, 0, 0, 1, 1,
-0.501218, -0.7159508, -1.374164, 0, 0, 0, 1, 1,
-0.4984131, -0.8002412, -2.011943, 0, 0, 0, 1, 1,
-0.4966123, 0.9193794, -2.174339, 1, 1, 1, 1, 1,
-0.4965411, 0.8757843, -0.1894118, 1, 1, 1, 1, 1,
-0.4955958, 0.06285629, -3.234332, 1, 1, 1, 1, 1,
-0.4952106, -1.033623, -2.64081, 1, 1, 1, 1, 1,
-0.4840003, -0.221353, -2.259667, 1, 1, 1, 1, 1,
-0.4789923, -0.7115467, -1.296587, 1, 1, 1, 1, 1,
-0.4789017, -0.4116942, -0.2502266, 1, 1, 1, 1, 1,
-0.4766093, 0.4132471, -0.8021287, 1, 1, 1, 1, 1,
-0.476053, 0.2783948, -0.4024193, 1, 1, 1, 1, 1,
-0.4726749, -0.4011174, -3.053932, 1, 1, 1, 1, 1,
-0.4709541, -0.1248869, -1.688224, 1, 1, 1, 1, 1,
-0.4707388, -1.657278, -4.297917, 1, 1, 1, 1, 1,
-0.4691787, -0.7020213, -2.727118, 1, 1, 1, 1, 1,
-0.4583861, 1.700879, -0.5828286, 1, 1, 1, 1, 1,
-0.4582929, 0.002594539, -2.252571, 1, 1, 1, 1, 1,
-0.4581302, -0.7150774, -0.2027825, 0, 0, 1, 1, 1,
-0.4571237, 1.925978, -0.763211, 1, 0, 0, 1, 1,
-0.4485407, -0.1112571, -0.6936779, 1, 0, 0, 1, 1,
-0.441379, -0.6901565, -1.1644, 1, 0, 0, 1, 1,
-0.4373823, -0.4735043, -1.527396, 1, 0, 0, 1, 1,
-0.4359215, 0.8925118, 0.3814845, 1, 0, 0, 1, 1,
-0.4268822, 1.625375, -0.1663204, 0, 0, 0, 1, 1,
-0.4217239, -0.2608345, -2.395842, 0, 0, 0, 1, 1,
-0.4213858, -0.04267022, -2.061403, 0, 0, 0, 1, 1,
-0.4168734, -1.416314, -3.466034, 0, 0, 0, 1, 1,
-0.4161803, -0.6809158, -2.911765, 0, 0, 0, 1, 1,
-0.4064988, 0.03642611, -0.2051065, 0, 0, 0, 1, 1,
-0.4032593, -0.3716609, -0.5371318, 0, 0, 0, 1, 1,
-0.4008374, 0.140384, 0.2542141, 1, 1, 1, 1, 1,
-0.3933172, 0.8223638, -0.5858482, 1, 1, 1, 1, 1,
-0.3918314, 0.2886421, -0.7424774, 1, 1, 1, 1, 1,
-0.3900413, -0.1656678, -1.898373, 1, 1, 1, 1, 1,
-0.386193, -0.2795537, -2.191336, 1, 1, 1, 1, 1,
-0.3816475, -0.1054608, -1.679526, 1, 1, 1, 1, 1,
-0.37959, -0.03896976, -2.153407, 1, 1, 1, 1, 1,
-0.3786783, 0.8713471, -1.205316, 1, 1, 1, 1, 1,
-0.378574, 1.735175, 0.06703854, 1, 1, 1, 1, 1,
-0.3693352, 0.195328, -1.755503, 1, 1, 1, 1, 1,
-0.357106, 0.7258165, -2.166368, 1, 1, 1, 1, 1,
-0.3558118, -0.4177383, -1.287648, 1, 1, 1, 1, 1,
-0.3479077, 0.1378214, -2.146244, 1, 1, 1, 1, 1,
-0.3466684, 1.819007, -0.8384938, 1, 1, 1, 1, 1,
-0.3427946, 1.052219, -0.5668233, 1, 1, 1, 1, 1,
-0.33785, 0.9039284, 0.01407481, 0, 0, 1, 1, 1,
-0.3374608, -0.8437774, -4.498222, 1, 0, 0, 1, 1,
-0.3350601, 0.9345086, -0.6251873, 1, 0, 0, 1, 1,
-0.3334914, -0.7598056, -1.797875, 1, 0, 0, 1, 1,
-0.3288946, 0.2892236, -0.6830887, 1, 0, 0, 1, 1,
-0.3277328, -1.797968, -2.446907, 1, 0, 0, 1, 1,
-0.3253751, 1.125748, -0.4300703, 0, 0, 0, 1, 1,
-0.3186887, -1.043406, -0.3498677, 0, 0, 0, 1, 1,
-0.3172995, -1.914748, -2.157194, 0, 0, 0, 1, 1,
-0.3170925, -0.315511, -1.698868, 0, 0, 0, 1, 1,
-0.3124532, 0.6983328, 0.1539645, 0, 0, 0, 1, 1,
-0.3067221, -2.44264, -3.821699, 0, 0, 0, 1, 1,
-0.3065884, -0.8196001, -2.907932, 0, 0, 0, 1, 1,
-0.3011431, -0.867417, -3.59379, 1, 1, 1, 1, 1,
-0.2976297, 0.2979628, 0.08147007, 1, 1, 1, 1, 1,
-0.2934312, 0.621883, 0.7055745, 1, 1, 1, 1, 1,
-0.2909629, -0.2937387, -1.491117, 1, 1, 1, 1, 1,
-0.2833498, -1.131882, -3.841075, 1, 1, 1, 1, 1,
-0.278589, -0.7669865, -2.644859, 1, 1, 1, 1, 1,
-0.2774249, -0.2406212, -2.228966, 1, 1, 1, 1, 1,
-0.2769173, 1.013976, -0.06434812, 1, 1, 1, 1, 1,
-0.2745809, -0.9586065, -2.385394, 1, 1, 1, 1, 1,
-0.273048, -0.01199868, -1.203089, 1, 1, 1, 1, 1,
-0.2725381, -1.891662, -4.107259, 1, 1, 1, 1, 1,
-0.2706633, 0.4143372, -1.09179, 1, 1, 1, 1, 1,
-0.2697307, 0.1566031, -1.718679, 1, 1, 1, 1, 1,
-0.2684566, 1.166069, -0.3072754, 1, 1, 1, 1, 1,
-0.2660215, -0.1736441, -2.625508, 1, 1, 1, 1, 1,
-0.2651832, -0.9208143, -4.453045, 0, 0, 1, 1, 1,
-0.2638294, -1.482693, -4.788706, 1, 0, 0, 1, 1,
-0.2570874, 0.4668179, 0.4095551, 1, 0, 0, 1, 1,
-0.2548817, 0.3449996, -0.8107185, 1, 0, 0, 1, 1,
-0.2530395, 1.481022, 1.468915, 1, 0, 0, 1, 1,
-0.2477579, 0.5468508, -1.700832, 1, 0, 0, 1, 1,
-0.2449503, -0.2413278, -2.860103, 0, 0, 0, 1, 1,
-0.2447786, 0.6974354, -1.068328, 0, 0, 0, 1, 1,
-0.2408972, -0.4789963, -1.518386, 0, 0, 0, 1, 1,
-0.2404431, -2.510031, -1.549003, 0, 0, 0, 1, 1,
-0.2337921, 0.1547625, -0.6447692, 0, 0, 0, 1, 1,
-0.2326706, -0.08888746, -2.440182, 0, 0, 0, 1, 1,
-0.22864, -0.6126161, -2.489967, 0, 0, 0, 1, 1,
-0.2209733, 0.9179807, 1.794035, 1, 1, 1, 1, 1,
-0.2190421, 1.012364, 0.1880294, 1, 1, 1, 1, 1,
-0.2179984, 2.288691, 0.2082878, 1, 1, 1, 1, 1,
-0.2161636, -0.8703223, -2.809326, 1, 1, 1, 1, 1,
-0.2069608, -0.6153917, -2.407093, 1, 1, 1, 1, 1,
-0.205944, -1.968815, -4.398374, 1, 1, 1, 1, 1,
-0.2019249, -0.9165029, -1.93311, 1, 1, 1, 1, 1,
-0.1981793, -0.5714435, -3.090817, 1, 1, 1, 1, 1,
-0.193366, 2.444184, -1.577523, 1, 1, 1, 1, 1,
-0.191869, -1.158357, -2.308245, 1, 1, 1, 1, 1,
-0.1898188, -2.341357, -3.388994, 1, 1, 1, 1, 1,
-0.1823784, -0.8217304, -3.976217, 1, 1, 1, 1, 1,
-0.1798603, 0.2232604, -0.9108304, 1, 1, 1, 1, 1,
-0.1768796, -1.542023, -2.614532, 1, 1, 1, 1, 1,
-0.1724776, -1.41241, -3.177487, 1, 1, 1, 1, 1,
-0.1680865, -0.7048414, -0.1456618, 0, 0, 1, 1, 1,
-0.1611881, 2.683478, 0.2576702, 1, 0, 0, 1, 1,
-0.1603668, 1.353754, 0.2858431, 1, 0, 0, 1, 1,
-0.1566252, -0.08891916, -0.3394531, 1, 0, 0, 1, 1,
-0.1545736, 2.099253, -0.388754, 1, 0, 0, 1, 1,
-0.1544136, 1.197536, -2.833728, 1, 0, 0, 1, 1,
-0.1535344, -1.689641, -2.896819, 0, 0, 0, 1, 1,
-0.1531753, -0.7096676, -1.545576, 0, 0, 0, 1, 1,
-0.1527092, -0.2372236, -1.997553, 0, 0, 0, 1, 1,
-0.1493392, -0.8911154, -3.656171, 0, 0, 0, 1, 1,
-0.1455309, -0.7798778, -2.63131, 0, 0, 0, 1, 1,
-0.1438212, 0.2109967, -1.233885, 0, 0, 0, 1, 1,
-0.1401134, -0.2735051, -2.480661, 0, 0, 0, 1, 1,
-0.1393955, -0.3785796, -1.557152, 1, 1, 1, 1, 1,
-0.1379423, -0.8399235, -2.115075, 1, 1, 1, 1, 1,
-0.1376718, -0.1113687, -1.382407, 1, 1, 1, 1, 1,
-0.1348624, 1.035506, -1.115145, 1, 1, 1, 1, 1,
-0.1207125, -1.464947, -2.679014, 1, 1, 1, 1, 1,
-0.1187185, 0.6452457, -0.07416343, 1, 1, 1, 1, 1,
-0.1179691, -1.312536, -3.336728, 1, 1, 1, 1, 1,
-0.1174824, -0.682506, -2.351982, 1, 1, 1, 1, 1,
-0.115216, -1.052851, -3.846473, 1, 1, 1, 1, 1,
-0.1044919, -0.2822067, -1.038596, 1, 1, 1, 1, 1,
-0.1044433, -1.677981, -3.598626, 1, 1, 1, 1, 1,
-0.1027669, -0.8012033, -4.413436, 1, 1, 1, 1, 1,
-0.1019418, 0.2184625, 0.2020396, 1, 1, 1, 1, 1,
-0.09501144, 2.014153, 2.01598, 1, 1, 1, 1, 1,
-0.09030739, -0.3191028, -3.530694, 1, 1, 1, 1, 1,
-0.08713094, 0.5926138, 0.4878495, 0, 0, 1, 1, 1,
-0.08518261, 0.06085595, -1.325533, 1, 0, 0, 1, 1,
-0.08443382, 1.514023, -0.8031942, 1, 0, 0, 1, 1,
-0.08355426, -0.9014977, -1.902943, 1, 0, 0, 1, 1,
-0.07513623, -0.7116044, -2.198191, 1, 0, 0, 1, 1,
-0.07453056, -0.5943526, -4.241111, 1, 0, 0, 1, 1,
-0.07448044, 0.4100615, 0.911893, 0, 0, 0, 1, 1,
-0.07193755, -0.6456132, -3.735245, 0, 0, 0, 1, 1,
-0.07000515, -0.7761985, -2.376504, 0, 0, 0, 1, 1,
-0.06285004, 0.9601368, -0.5671192, 0, 0, 0, 1, 1,
-0.06269941, -2.13203, -3.327317, 0, 0, 0, 1, 1,
-0.06264763, 0.8097443, -0.4414615, 0, 0, 0, 1, 1,
-0.05796012, 1.052527, 0.8847822, 0, 0, 0, 1, 1,
-0.05771805, -1.342397, -3.317132, 1, 1, 1, 1, 1,
-0.05673095, 0.666338, -2.290752, 1, 1, 1, 1, 1,
-0.05226637, -0.02467192, -1.387804, 1, 1, 1, 1, 1,
-0.05191297, 0.12822, -0.949681, 1, 1, 1, 1, 1,
-0.04920283, 0.2999652, -1.073538, 1, 1, 1, 1, 1,
-0.04644049, -0.03653748, -2.24152, 1, 1, 1, 1, 1,
-0.04332569, 1.126164, 0.3738518, 1, 1, 1, 1, 1,
-0.04223707, 0.6064703, -1.25016, 1, 1, 1, 1, 1,
-0.03887916, -0.05919048, -1.768349, 1, 1, 1, 1, 1,
-0.03814247, 1.981074, 0.8333766, 1, 1, 1, 1, 1,
-0.0375481, -1.398161, -4.018363, 1, 1, 1, 1, 1,
-0.03519164, 0.6089768, 0.01741009, 1, 1, 1, 1, 1,
-0.0346846, -0.7387758, -0.9052284, 1, 1, 1, 1, 1,
-0.03121318, -1.061052, -3.376693, 1, 1, 1, 1, 1,
-0.02830247, 0.4770125, -3.029477, 1, 1, 1, 1, 1,
-0.01846849, 1.272718, 1.553069, 0, 0, 1, 1, 1,
-0.01837061, 0.9833384, -0.948652, 1, 0, 0, 1, 1,
-0.01555723, 0.4371412, -0.578073, 1, 0, 0, 1, 1,
-0.01145002, 0.359049, -0.2887593, 1, 0, 0, 1, 1,
-0.005234302, -1.691259, -4.046663, 1, 0, 0, 1, 1,
-0.004665811, -1.483662, -2.797892, 1, 0, 0, 1, 1,
-0.002444432, -2.456714, -3.181315, 0, 0, 0, 1, 1,
-0.00121935, 1.395143, -1.477562, 0, 0, 0, 1, 1,
0.0006212185, 1.26134, -0.3526725, 0, 0, 0, 1, 1,
0.002077177, -0.1941987, 4.472435, 0, 0, 0, 1, 1,
0.005209192, 0.2913051, -0.4970954, 0, 0, 0, 1, 1,
0.01545255, -0.4987584, 2.202881, 0, 0, 0, 1, 1,
0.0170766, 0.07689115, -0.5915903, 0, 0, 0, 1, 1,
0.01778792, -0.3817878, 3.141279, 1, 1, 1, 1, 1,
0.0190494, -0.5466854, 4.501987, 1, 1, 1, 1, 1,
0.0226416, 0.7373359, -1.299339, 1, 1, 1, 1, 1,
0.02547254, -0.2073416, 1.657304, 1, 1, 1, 1, 1,
0.02554545, -0.7500352, 2.402251, 1, 1, 1, 1, 1,
0.02556431, -0.633803, 4.043451, 1, 1, 1, 1, 1,
0.03643326, -0.3548195, 3.69177, 1, 1, 1, 1, 1,
0.03927689, 0.9460862, 0.176633, 1, 1, 1, 1, 1,
0.04210863, 0.9047115, 0.6066162, 1, 1, 1, 1, 1,
0.04731908, 0.9590906, -0.1057379, 1, 1, 1, 1, 1,
0.04775229, -0.8933094, 3.439481, 1, 1, 1, 1, 1,
0.04855739, 0.3859436, -0.0003078819, 1, 1, 1, 1, 1,
0.05091774, -2.711268, 5.391146, 1, 1, 1, 1, 1,
0.05315135, 1.872635, -1.714532, 1, 1, 1, 1, 1,
0.05458855, -0.4488994, 3.870607, 1, 1, 1, 1, 1,
0.0618619, 0.6075482, -1.12421, 0, 0, 1, 1, 1,
0.06431808, -1.841466, 3.896645, 1, 0, 0, 1, 1,
0.06519741, -0.0742342, 1.382212, 1, 0, 0, 1, 1,
0.06834975, 0.2967881, -0.5958537, 1, 0, 0, 1, 1,
0.07110783, -0.9723317, 2.85206, 1, 0, 0, 1, 1,
0.07217043, -0.7724249, 2.577526, 1, 0, 0, 1, 1,
0.07560612, -0.5825107, 1.434644, 0, 0, 0, 1, 1,
0.07751022, -0.2611624, 2.810126, 0, 0, 0, 1, 1,
0.08476543, 1.215302, -0.1940547, 0, 0, 0, 1, 1,
0.08539375, -1.243293, 4.261476, 0, 0, 0, 1, 1,
0.08921042, -0.7705368, 2.50259, 0, 0, 0, 1, 1,
0.09157202, 0.002220742, 1.134631, 0, 0, 0, 1, 1,
0.09158618, 0.07498286, 2.255953, 0, 0, 0, 1, 1,
0.09312139, 0.08778255, 1.017357, 1, 1, 1, 1, 1,
0.09610282, 0.4329889, 0.6784914, 1, 1, 1, 1, 1,
0.1001395, 1.911049, 1.815072, 1, 1, 1, 1, 1,
0.1004254, 0.1833768, 2.192632, 1, 1, 1, 1, 1,
0.1005046, -1.463698, 3.404436, 1, 1, 1, 1, 1,
0.1110877, 0.4627762, -0.2053778, 1, 1, 1, 1, 1,
0.1177571, 1.188045, 1.130394, 1, 1, 1, 1, 1,
0.1190207, -2.368432, 5.365765, 1, 1, 1, 1, 1,
0.1203719, 1.314623, 1.89074, 1, 1, 1, 1, 1,
0.1207681, -0.2681773, 2.928642, 1, 1, 1, 1, 1,
0.133678, 1.070499, 0.2023611, 1, 1, 1, 1, 1,
0.1379463, 1.568977, -2.12804, 1, 1, 1, 1, 1,
0.1463664, 0.4153363, 0.02865499, 1, 1, 1, 1, 1,
0.1536528, 0.5156979, -0.2478267, 1, 1, 1, 1, 1,
0.1552488, 0.002635299, 0.6537474, 1, 1, 1, 1, 1,
0.1574384, -1.434666, 2.484182, 0, 0, 1, 1, 1,
0.1604036, -1.58689, 3.205359, 1, 0, 0, 1, 1,
0.1640502, -0.7901276, 4.098271, 1, 0, 0, 1, 1,
0.1644567, -1.657406, 3.219193, 1, 0, 0, 1, 1,
0.1652683, -0.6475447, 2.196542, 1, 0, 0, 1, 1,
0.1662991, 0.2059051, -1.036824, 1, 0, 0, 1, 1,
0.1681805, 2.038803, -0.6047037, 0, 0, 0, 1, 1,
0.1682689, 1.028377, -1.902907, 0, 0, 0, 1, 1,
0.1687783, 0.8005055, -1.724352, 0, 0, 0, 1, 1,
0.1689509, 0.7360224, 0.4300363, 0, 0, 0, 1, 1,
0.1695745, -1.083848, 3.35843, 0, 0, 0, 1, 1,
0.1710021, -1.662043, 0.7533424, 0, 0, 0, 1, 1,
0.1718499, 0.3926548, 1.965373, 0, 0, 0, 1, 1,
0.1750412, -0.6968904, 4.058504, 1, 1, 1, 1, 1,
0.1754983, 0.6976597, 0.8102633, 1, 1, 1, 1, 1,
0.1759677, 0.1780654, -2.063807, 1, 1, 1, 1, 1,
0.177117, -0.5465638, 4.634491, 1, 1, 1, 1, 1,
0.1822232, -0.2374839, 2.151325, 1, 1, 1, 1, 1,
0.1824786, -1.373676, 2.028975, 1, 1, 1, 1, 1,
0.1839917, 1.210527, 2.284217, 1, 1, 1, 1, 1,
0.1855507, -0.5780279, 3.427167, 1, 1, 1, 1, 1,
0.1914967, -0.1229939, 3.373679, 1, 1, 1, 1, 1,
0.1953696, 0.487491, 0.868697, 1, 1, 1, 1, 1,
0.1984676, -1.289152, 2.66807, 1, 1, 1, 1, 1,
0.2005959, -2.042042, 2.94127, 1, 1, 1, 1, 1,
0.204716, -0.6408714, 3.998593, 1, 1, 1, 1, 1,
0.2047337, 1.050897, 1.843854, 1, 1, 1, 1, 1,
0.2117222, -1.17544, 2.698664, 1, 1, 1, 1, 1,
0.2134873, -1.411587, 3.37638, 0, 0, 1, 1, 1,
0.21713, -0.4852338, 3.515378, 1, 0, 0, 1, 1,
0.2174018, -1.487237, 2.21337, 1, 0, 0, 1, 1,
0.2174458, 0.05645456, 2.333179, 1, 0, 0, 1, 1,
0.2203465, -0.1299734, 3.404118, 1, 0, 0, 1, 1,
0.2278116, -1.387066, 3.051424, 1, 0, 0, 1, 1,
0.2307087, -0.2290617, 4.3391, 0, 0, 0, 1, 1,
0.2312931, 0.7216468, -1.399206, 0, 0, 0, 1, 1,
0.2318064, 0.6164252, 0.4574858, 0, 0, 0, 1, 1,
0.2323087, -0.6140511, 2.756475, 0, 0, 0, 1, 1,
0.2328694, 1.026642, -1.319473, 0, 0, 0, 1, 1,
0.2336123, 0.03904154, 0.1296058, 0, 0, 0, 1, 1,
0.2350747, -1.35962, 2.579215, 0, 0, 0, 1, 1,
0.2378058, 0.6666131, -0.4763627, 1, 1, 1, 1, 1,
0.2382341, -0.1079318, 1.13829, 1, 1, 1, 1, 1,
0.2397145, 0.3200088, 1.321971, 1, 1, 1, 1, 1,
0.2478863, -2.696568, 3.192914, 1, 1, 1, 1, 1,
0.2491477, 1.432445, -0.7779966, 1, 1, 1, 1, 1,
0.2625158, -0.08665133, 1.132445, 1, 1, 1, 1, 1,
0.2680171, 1.362848, 1.250127, 1, 1, 1, 1, 1,
0.2687101, 0.3489062, -0.1757001, 1, 1, 1, 1, 1,
0.2728431, 0.9996948, -0.4201455, 1, 1, 1, 1, 1,
0.2751352, 0.2753727, -0.03038997, 1, 1, 1, 1, 1,
0.2771898, 0.5484717, 1.036266, 1, 1, 1, 1, 1,
0.2841007, -2.601683, 4.192168, 1, 1, 1, 1, 1,
0.284907, 0.5393966, 2.259734, 1, 1, 1, 1, 1,
0.287443, 1.757998, 0.7212774, 1, 1, 1, 1, 1,
0.2892867, 0.8541154, 0.4520999, 1, 1, 1, 1, 1,
0.2903592, 0.1360241, 0.35346, 0, 0, 1, 1, 1,
0.2906069, 0.6211336, 2.034832, 1, 0, 0, 1, 1,
0.2926321, 0.3095162, 1.139791, 1, 0, 0, 1, 1,
0.2985893, -1.467385, 3.280398, 1, 0, 0, 1, 1,
0.2995268, -0.8863153, 3.057056, 1, 0, 0, 1, 1,
0.3003455, -0.9295204, 3.21505, 1, 0, 0, 1, 1,
0.3023377, 0.1280086, 0.8208004, 0, 0, 0, 1, 1,
0.3143084, 0.6972432, -0.6168683, 0, 0, 0, 1, 1,
0.3221276, -0.1218809, 3.551348, 0, 0, 0, 1, 1,
0.3222719, -0.6948554, 2.87359, 0, 0, 0, 1, 1,
0.32283, 0.166989, 0.8146107, 0, 0, 0, 1, 1,
0.325802, -0.9619164, 3.848584, 0, 0, 0, 1, 1,
0.3275494, -1.51948, 1.597507, 0, 0, 0, 1, 1,
0.3281114, -0.569876, 2.3633, 1, 1, 1, 1, 1,
0.3304428, 0.7016556, -0.6369173, 1, 1, 1, 1, 1,
0.3321991, 1.466395, 0.9302448, 1, 1, 1, 1, 1,
0.3345635, 0.7351614, 0.8393673, 1, 1, 1, 1, 1,
0.3347662, -0.2286051, 2.643883, 1, 1, 1, 1, 1,
0.3354823, 1.375223, -0.6042054, 1, 1, 1, 1, 1,
0.3363495, -0.6919473, 3.132715, 1, 1, 1, 1, 1,
0.3397109, 0.1418459, 0.08325206, 1, 1, 1, 1, 1,
0.3415945, -0.3827057, 0.5404566, 1, 1, 1, 1, 1,
0.3432725, 1.919997, 0.6698059, 1, 1, 1, 1, 1,
0.3479178, -0.5606328, 3.160898, 1, 1, 1, 1, 1,
0.3536083, 1.524479, -0.223905, 1, 1, 1, 1, 1,
0.3554513, -0.3902752, 0.5932417, 1, 1, 1, 1, 1,
0.3583536, -0.1317753, 1.211226, 1, 1, 1, 1, 1,
0.3601116, -1.841751, 3.155514, 1, 1, 1, 1, 1,
0.3642904, -0.1225158, 2.230231, 0, 0, 1, 1, 1,
0.3681726, -0.5187004, 2.416718, 1, 0, 0, 1, 1,
0.3683351, -0.8366898, 1.29302, 1, 0, 0, 1, 1,
0.3701152, -0.1354497, 0.9572151, 1, 0, 0, 1, 1,
0.3772091, 0.6603318, 0.6289151, 1, 0, 0, 1, 1,
0.3802548, 0.9274426, 0.01323392, 1, 0, 0, 1, 1,
0.385496, -1.044007, 2.208301, 0, 0, 0, 1, 1,
0.3875521, -0.04115249, 2.318008, 0, 0, 0, 1, 1,
0.388743, -0.4806274, 2.308101, 0, 0, 0, 1, 1,
0.390384, 0.7019504, -0.3874454, 0, 0, 0, 1, 1,
0.3916472, -1.258407, 3.358917, 0, 0, 0, 1, 1,
0.3949995, 1.572148, 0.1343321, 0, 0, 0, 1, 1,
0.3999703, -0.5559701, 1.492332, 0, 0, 0, 1, 1,
0.4054882, -1.914498, 2.699591, 1, 1, 1, 1, 1,
0.4076632, -1.276179, 3.275823, 1, 1, 1, 1, 1,
0.4103404, -0.4420205, 1.978754, 1, 1, 1, 1, 1,
0.4115056, -0.3258272, 4.359707, 1, 1, 1, 1, 1,
0.4127559, 1.493454, 0.5842275, 1, 1, 1, 1, 1,
0.4151861, -0.1276902, 1.524288, 1, 1, 1, 1, 1,
0.4156145, -0.2369198, 5.21306, 1, 1, 1, 1, 1,
0.4175093, -0.5971649, 3.164231, 1, 1, 1, 1, 1,
0.4191684, -0.6723461, 2.924617, 1, 1, 1, 1, 1,
0.420954, -1.924225, 2.049271, 1, 1, 1, 1, 1,
0.4229676, 1.146544, -0.04591, 1, 1, 1, 1, 1,
0.4275231, -0.8298388, 2.479982, 1, 1, 1, 1, 1,
0.4382763, -1.248877, 2.060628, 1, 1, 1, 1, 1,
0.4434853, 0.002353653, 1.256545, 1, 1, 1, 1, 1,
0.4440531, 1.365341, -1.420489, 1, 1, 1, 1, 1,
0.4474352, -0.5894231, 2.283996, 0, 0, 1, 1, 1,
0.447483, -0.6591104, 2.299226, 1, 0, 0, 1, 1,
0.4497788, -0.5538238, 2.333716, 1, 0, 0, 1, 1,
0.450124, 0.5965514, 1.571669, 1, 0, 0, 1, 1,
0.4598747, 0.3122513, -0.4283944, 1, 0, 0, 1, 1,
0.4613228, 0.574086, 0.2293286, 1, 0, 0, 1, 1,
0.4627869, 0.5146052, 1.788793, 0, 0, 0, 1, 1,
0.4644383, -2.397564, 4.194506, 0, 0, 0, 1, 1,
0.4654378, -0.16576, 2.834046, 0, 0, 0, 1, 1,
0.4654742, 0.06137758, 0.9890816, 0, 0, 0, 1, 1,
0.4656045, -1.321, 1.51354, 0, 0, 0, 1, 1,
0.4683385, -0.5731274, 3.930234, 0, 0, 0, 1, 1,
0.4710509, -0.3069028, 2.823573, 0, 0, 0, 1, 1,
0.4795176, -0.8725077, 3.493092, 1, 1, 1, 1, 1,
0.4821399, 0.5557279, 0.724734, 1, 1, 1, 1, 1,
0.4840214, -1.962285, 1.146548, 1, 1, 1, 1, 1,
0.4856192, 1.156816, 1.580871, 1, 1, 1, 1, 1,
0.4862962, 1.078784, 0.7087973, 1, 1, 1, 1, 1,
0.4863031, 0.2332928, 0.8459622, 1, 1, 1, 1, 1,
0.4888556, 0.2806204, 0.5856611, 1, 1, 1, 1, 1,
0.4914223, -0.6689445, 2.309066, 1, 1, 1, 1, 1,
0.4968066, 0.7642898, -0.1137138, 1, 1, 1, 1, 1,
0.49816, 0.122107, 2.007419, 1, 1, 1, 1, 1,
0.5081293, -1.582902, 2.372099, 1, 1, 1, 1, 1,
0.5094469, -0.396155, 1.722732, 1, 1, 1, 1, 1,
0.5103889, -0.3723707, 1.620854, 1, 1, 1, 1, 1,
0.5106321, 0.7310644, 1.290046, 1, 1, 1, 1, 1,
0.5109768, 1.624038, 1.205964, 1, 1, 1, 1, 1,
0.5148799, -0.4026724, 3.563438, 0, 0, 1, 1, 1,
0.5165078, 0.7496278, 1.33496, 1, 0, 0, 1, 1,
0.5184085, 0.6134951, -0.02875705, 1, 0, 0, 1, 1,
0.5195848, -0.6583115, 2.641855, 1, 0, 0, 1, 1,
0.5197788, 0.3346413, 0.8898776, 1, 0, 0, 1, 1,
0.5233797, -0.7981663, 2.486032, 1, 0, 0, 1, 1,
0.5235446, -2.862954, 1.670113, 0, 0, 0, 1, 1,
0.537857, -1.389026, 3.484385, 0, 0, 0, 1, 1,
0.5390419, 0.03201681, 1.666186, 0, 0, 0, 1, 1,
0.539969, -0.6508888, 1.528686, 0, 0, 0, 1, 1,
0.5408239, -0.4501885, 2.091291, 0, 0, 0, 1, 1,
0.5421528, -0.5274626, 1.519512, 0, 0, 0, 1, 1,
0.5471542, -1.231319, 2.120544, 0, 0, 0, 1, 1,
0.5475399, 1.153695, 0.2978275, 1, 1, 1, 1, 1,
0.5475612, -0.7144601, -0.05246477, 1, 1, 1, 1, 1,
0.5484537, 0.3755399, 0.6556463, 1, 1, 1, 1, 1,
0.5503607, 0.06477032, 1.311877, 1, 1, 1, 1, 1,
0.5551051, -1.3471, 2.479748, 1, 1, 1, 1, 1,
0.5567805, 0.9618212, -0.6500109, 1, 1, 1, 1, 1,
0.5613818, -0.8585176, 0.9981468, 1, 1, 1, 1, 1,
0.5637063, -0.9709634, 2.684983, 1, 1, 1, 1, 1,
0.5664555, 0.2369577, -0.7069206, 1, 1, 1, 1, 1,
0.5686136, 0.09634241, 0.8027884, 1, 1, 1, 1, 1,
0.5702218, 0.5465234, -0.7206991, 1, 1, 1, 1, 1,
0.5715263, -0.3871192, 1.575344, 1, 1, 1, 1, 1,
0.5718021, 0.5943598, 0.2205559, 1, 1, 1, 1, 1,
0.5738835, -0.592981, 2.750294, 1, 1, 1, 1, 1,
0.5757011, 0.1571977, 2.784273, 1, 1, 1, 1, 1,
0.5791598, -0.03404045, 1.186293, 0, 0, 1, 1, 1,
0.5834915, -1.893342, 3.810649, 1, 0, 0, 1, 1,
0.5834978, -0.7935619, 1.626934, 1, 0, 0, 1, 1,
0.5870405, 1.658619, 0.2607087, 1, 0, 0, 1, 1,
0.5951125, 0.4072662, 1.931293, 1, 0, 0, 1, 1,
0.5975075, -2.473842, 3.759165, 1, 0, 0, 1, 1,
0.598943, 1.577613, 1.865974, 0, 0, 0, 1, 1,
0.601346, -0.1899312, 0.5744907, 0, 0, 0, 1, 1,
0.6024157, 0.07050114, 2.780376, 0, 0, 0, 1, 1,
0.6108735, -0.9270868, 1.89056, 0, 0, 0, 1, 1,
0.6108919, -0.6134534, 0.775585, 0, 0, 0, 1, 1,
0.6111835, -0.5480593, 2.387042, 0, 0, 0, 1, 1,
0.6123244, -1.35356, 3.705176, 0, 0, 0, 1, 1,
0.6130753, 0.09115811, 1.583559, 1, 1, 1, 1, 1,
0.6151282, -0.0480312, 0.4517645, 1, 1, 1, 1, 1,
0.6168387, -1.902725, 2.375983, 1, 1, 1, 1, 1,
0.6190961, 0.4577163, -0.5250776, 1, 1, 1, 1, 1,
0.6227145, -0.7128031, 2.108149, 1, 1, 1, 1, 1,
0.6256748, 0.008986824, 0.09905206, 1, 1, 1, 1, 1,
0.6257998, 0.5353369, 1.842342, 1, 1, 1, 1, 1,
0.6259182, 2.010074, -2.819748, 1, 1, 1, 1, 1,
0.6260081, -0.6719538, 2.206618, 1, 1, 1, 1, 1,
0.62712, -0.6411244, 1.639788, 1, 1, 1, 1, 1,
0.6301934, -0.1696165, 2.308499, 1, 1, 1, 1, 1,
0.637246, 1.031285, 1.021603, 1, 1, 1, 1, 1,
0.6389046, -0.3611068, 2.525977, 1, 1, 1, 1, 1,
0.6396611, 0.4444717, 1.654415, 1, 1, 1, 1, 1,
0.642186, 0.3015114, 2.602483, 1, 1, 1, 1, 1,
0.6454766, 1.164313, -0.9636369, 0, 0, 1, 1, 1,
0.6464369, 0.912721, 0.931316, 1, 0, 0, 1, 1,
0.6469974, -0.5012795, 0.6426637, 1, 0, 0, 1, 1,
0.6470413, -1.487018, 2.386266, 1, 0, 0, 1, 1,
0.6490482, 0.3500038, -0.1601218, 1, 0, 0, 1, 1,
0.6513546, 2.897268, -1.336828, 1, 0, 0, 1, 1,
0.6524406, -0.05309642, 1.24225, 0, 0, 0, 1, 1,
0.6568926, -0.2205009, 2.822493, 0, 0, 0, 1, 1,
0.6696027, 2.841149, -0.8085865, 0, 0, 0, 1, 1,
0.6724111, -0.8413908, 2.664843, 0, 0, 0, 1, 1,
0.673154, -0.7611914, 3.877018, 0, 0, 0, 1, 1,
0.6747616, -2.054288, 2.7683, 0, 0, 0, 1, 1,
0.6750526, 0.3545742, -0.7968181, 0, 0, 0, 1, 1,
0.6759139, 1.694117, 1.090317, 1, 1, 1, 1, 1,
0.6773903, 0.05169788, 2.692269, 1, 1, 1, 1, 1,
0.6804303, -0.03887136, 1.013982, 1, 1, 1, 1, 1,
0.6804497, 0.4368341, 0.6721942, 1, 1, 1, 1, 1,
0.6872034, 0.8166283, 1.216838, 1, 1, 1, 1, 1,
0.6892508, 1.498387, -0.4329101, 1, 1, 1, 1, 1,
0.689849, 0.003967983, 1.230812, 1, 1, 1, 1, 1,
0.6912335, -0.1320415, 1.209571, 1, 1, 1, 1, 1,
0.6977172, 0.9766646, 1.195238, 1, 1, 1, 1, 1,
0.7110866, -0.7640418, 1.978652, 1, 1, 1, 1, 1,
0.7111345, 1.432014, 0.8572276, 1, 1, 1, 1, 1,
0.7124104, 0.3789117, 1.087803, 1, 1, 1, 1, 1,
0.7174066, 0.3822266, 1.226089, 1, 1, 1, 1, 1,
0.7220264, -0.2863509, 2.275135, 1, 1, 1, 1, 1,
0.7227042, -1.445853, 2.139937, 1, 1, 1, 1, 1,
0.7255794, 0.6573291, 0.8261521, 0, 0, 1, 1, 1,
0.741659, -0.2756768, 3.374417, 1, 0, 0, 1, 1,
0.7423315, -0.2608995, 1.903908, 1, 0, 0, 1, 1,
0.747516, -0.2947403, -0.155911, 1, 0, 0, 1, 1,
0.7483159, 0.1417074, 0.7511888, 1, 0, 0, 1, 1,
0.7540564, 0.1965534, 1.940487, 1, 0, 0, 1, 1,
0.7544668, 0.9432965, -0.2145895, 0, 0, 0, 1, 1,
0.7561129, 0.5747451, 2.77055, 0, 0, 0, 1, 1,
0.7594376, -0.1333999, 3.366291, 0, 0, 0, 1, 1,
0.7595294, 0.2648403, 2.274299, 0, 0, 0, 1, 1,
0.7642719, 0.2344902, 0.6842747, 0, 0, 0, 1, 1,
0.7670311, 0.7365917, 0.6571742, 0, 0, 0, 1, 1,
0.7755257, -2.018238, 3.404148, 0, 0, 0, 1, 1,
0.7755844, -0.847029, 1.444975, 1, 1, 1, 1, 1,
0.7813011, 1.901025, -0.1364745, 1, 1, 1, 1, 1,
0.7830142, 0.2115073, 1.397897, 1, 1, 1, 1, 1,
0.7831097, -0.5120217, 3.117921, 1, 1, 1, 1, 1,
0.7865041, 0.3871947, 0.99979, 1, 1, 1, 1, 1,
0.7867435, 2.020812, 1.50877, 1, 1, 1, 1, 1,
0.7964141, -0.2278727, 1.738982, 1, 1, 1, 1, 1,
0.7975895, 0.2329736, 0.632386, 1, 1, 1, 1, 1,
0.7988388, -1.054102, 1.796288, 1, 1, 1, 1, 1,
0.8074783, 1.752955, 0.2983555, 1, 1, 1, 1, 1,
0.8157496, -0.1750766, 2.25477, 1, 1, 1, 1, 1,
0.8234872, 1.55764, 1.18234, 1, 1, 1, 1, 1,
0.8250523, -1.125271, 4.997231, 1, 1, 1, 1, 1,
0.8268812, 0.03398557, 2.37728, 1, 1, 1, 1, 1,
0.8322074, 0.4526876, 0.2331689, 1, 1, 1, 1, 1,
0.835574, 2.83945, 1.846228, 0, 0, 1, 1, 1,
0.8402783, -1.408504, 2.105861, 1, 0, 0, 1, 1,
0.8482078, -0.9420922, 1.314364, 1, 0, 0, 1, 1,
0.8487818, -0.1701943, 1.547555, 1, 0, 0, 1, 1,
0.8534892, -0.3325813, 3.539359, 1, 0, 0, 1, 1,
0.8555778, 0.4209563, 1.552513, 1, 0, 0, 1, 1,
0.8563448, 1.27138, 1.095803, 0, 0, 0, 1, 1,
0.8567311, 0.4090604, 0.4417486, 0, 0, 0, 1, 1,
0.8644478, 0.6180962, 0.8893446, 0, 0, 0, 1, 1,
0.8680803, 1.498442, -0.808943, 0, 0, 0, 1, 1,
0.8718661, -0.7669111, 2.305394, 0, 0, 0, 1, 1,
0.8725276, 0.7698646, -0.0198038, 0, 0, 0, 1, 1,
0.8787595, -0.6138065, 2.651432, 0, 0, 0, 1, 1,
0.8809299, 0.5541633, 1.535881, 1, 1, 1, 1, 1,
0.8889939, 0.6716643, -0.827327, 1, 1, 1, 1, 1,
0.8908675, -1.627042, 2.913805, 1, 1, 1, 1, 1,
0.8928164, 2.465384, 1.54591, 1, 1, 1, 1, 1,
0.8933926, -0.9671084, 1.480893, 1, 1, 1, 1, 1,
0.8936219, 1.081807, -1.473698, 1, 1, 1, 1, 1,
0.8973089, -0.3025451, 3.02004, 1, 1, 1, 1, 1,
0.8974507, 0.0971244, 0.5813137, 1, 1, 1, 1, 1,
0.9031277, -0.8735675, 4.424654, 1, 1, 1, 1, 1,
0.9099806, 1.376698, 0.3424987, 1, 1, 1, 1, 1,
0.910327, -0.1267987, 3.091807, 1, 1, 1, 1, 1,
0.9173831, 0.3023394, 0.9042537, 1, 1, 1, 1, 1,
0.9183045, 0.002675209, 1.542519, 1, 1, 1, 1, 1,
0.9194062, 1.138831, 0.0031877, 1, 1, 1, 1, 1,
0.9325493, -1.557873, 3.327037, 1, 1, 1, 1, 1,
0.9340463, 0.6691058, 0.55097, 0, 0, 1, 1, 1,
0.9416226, 0.6708782, 2.901319, 1, 0, 0, 1, 1,
0.9418517, 0.03810385, 1.018583, 1, 0, 0, 1, 1,
0.9418607, -0.1193659, 0.9518896, 1, 0, 0, 1, 1,
0.9420676, -0.3512961, 2.331778, 1, 0, 0, 1, 1,
0.9423669, -2.148193, 2.689064, 1, 0, 0, 1, 1,
0.9451066, 1.113342, 0.3929712, 0, 0, 0, 1, 1,
0.9468835, -0.4393084, 1.358337, 0, 0, 0, 1, 1,
0.9470246, 0.1031649, 1.321782, 0, 0, 0, 1, 1,
0.9499789, -0.9417627, 2.467965, 0, 0, 0, 1, 1,
0.9573641, 0.3725573, 2.965401, 0, 0, 0, 1, 1,
0.9597497, -1.146119, 4.130885, 0, 0, 0, 1, 1,
0.9607006, -0.4605711, 3.361373, 0, 0, 0, 1, 1,
0.9720222, -0.7155538, 2.582339, 1, 1, 1, 1, 1,
0.9728182, -0.5365834, 1.404085, 1, 1, 1, 1, 1,
0.9776874, 0.2203906, 1.973842, 1, 1, 1, 1, 1,
0.9813562, -0.3613793, 1.76399, 1, 1, 1, 1, 1,
0.9907535, 0.1579904, 1.898715, 1, 1, 1, 1, 1,
0.9930011, 0.7954873, 1.335452, 1, 1, 1, 1, 1,
0.9957826, 0.5158047, -0.1620244, 1, 1, 1, 1, 1,
0.9963069, 1.351521, 0.63144, 1, 1, 1, 1, 1,
0.9974678, -0.3022538, 1.144328, 1, 1, 1, 1, 1,
0.9995013, 0.590573, -1.223657, 1, 1, 1, 1, 1,
1.008932, -0.6137889, 3.638387, 1, 1, 1, 1, 1,
1.010292, -0.8450623, 1.58808, 1, 1, 1, 1, 1,
1.01695, -2.299929, 3.543004, 1, 1, 1, 1, 1,
1.018519, -1.137794, 2.593042, 1, 1, 1, 1, 1,
1.044902, 0.4204147, 2.789515, 1, 1, 1, 1, 1,
1.04556, 0.8011318, -0.5876009, 0, 0, 1, 1, 1,
1.046459, -0.7224237, 1.066322, 1, 0, 0, 1, 1,
1.046606, 0.3729296, 2.039264, 1, 0, 0, 1, 1,
1.051767, -1.411313, 2.856316, 1, 0, 0, 1, 1,
1.068085, -0.4447014, 1.63397, 1, 0, 0, 1, 1,
1.069427, 0.4346715, 1.066104, 1, 0, 0, 1, 1,
1.069756, 0.7998805, 2.020688, 0, 0, 0, 1, 1,
1.085081, 0.1990404, 0.8821785, 0, 0, 0, 1, 1,
1.087445, -1.760788, 3.689, 0, 0, 0, 1, 1,
1.091752, -1.090543, 0.3065612, 0, 0, 0, 1, 1,
1.095383, -2.895087, 2.037751, 0, 0, 0, 1, 1,
1.104592, -0.06532586, 1.275267, 0, 0, 0, 1, 1,
1.106825, 1.503972, 0.6708621, 0, 0, 0, 1, 1,
1.10768, -1.576691, 2.053478, 1, 1, 1, 1, 1,
1.111067, 1.236144, 2.468601, 1, 1, 1, 1, 1,
1.112858, -0.108759, 1.266257, 1, 1, 1, 1, 1,
1.116179, 1.29097, 1.043312, 1, 1, 1, 1, 1,
1.119667, -0.4975908, 2.351451, 1, 1, 1, 1, 1,
1.126556, 0.3289931, 1.362306, 1, 1, 1, 1, 1,
1.128165, 0.6362032, 0.6656834, 1, 1, 1, 1, 1,
1.144874, 1.49597, 1.509892, 1, 1, 1, 1, 1,
1.151037, 0.2218189, 2.139651, 1, 1, 1, 1, 1,
1.163979, -1.074926, 3.034886, 1, 1, 1, 1, 1,
1.166346, 0.2508902, 1.420035, 1, 1, 1, 1, 1,
1.192277, -0.004054015, 1.752084, 1, 1, 1, 1, 1,
1.198142, 1.202857, -0.9260858, 1, 1, 1, 1, 1,
1.204702, 0.3160434, 2.366167, 1, 1, 1, 1, 1,
1.205109, 0.4236443, 0.4120698, 1, 1, 1, 1, 1,
1.206693, 1.042592, 1.537459, 0, 0, 1, 1, 1,
1.207714, 0.3768423, 0.5384229, 1, 0, 0, 1, 1,
1.208337, -1.40887, 1.942283, 1, 0, 0, 1, 1,
1.212663, 1.48626, 1.7351, 1, 0, 0, 1, 1,
1.21395, -1.3821, 1.993521, 1, 0, 0, 1, 1,
1.219973, -1.488515, 0.08994999, 1, 0, 0, 1, 1,
1.221999, 1.168847, 1.745667, 0, 0, 0, 1, 1,
1.224523, 0.1480982, 2.898684, 0, 0, 0, 1, 1,
1.228302, -0.2488214, 0.2055598, 0, 0, 0, 1, 1,
1.232117, 0.5304841, 0.7798334, 0, 0, 0, 1, 1,
1.23687, -0.00203948, 1.146644, 0, 0, 0, 1, 1,
1.238458, 0.3655224, 0.5651746, 0, 0, 0, 1, 1,
1.238745, 1.325991, -0.216928, 0, 0, 0, 1, 1,
1.241083, -0.3914795, 0.07251113, 1, 1, 1, 1, 1,
1.242968, -0.07135369, 2.141448, 1, 1, 1, 1, 1,
1.246158, -1.172501, 2.909138, 1, 1, 1, 1, 1,
1.252313, -0.06094599, 1.288412, 1, 1, 1, 1, 1,
1.253739, 0.3814654, 0.154891, 1, 1, 1, 1, 1,
1.256654, 0.7016543, -0.7306474, 1, 1, 1, 1, 1,
1.257054, -0.05471177, 3.007802, 1, 1, 1, 1, 1,
1.259629, -0.6709434, 1.855375, 1, 1, 1, 1, 1,
1.262497, 1.35948, 2.313214, 1, 1, 1, 1, 1,
1.262975, -3.479741, 2.610046, 1, 1, 1, 1, 1,
1.265589, -0.9882815, 2.342752, 1, 1, 1, 1, 1,
1.279, 0.9915564, 2.007063, 1, 1, 1, 1, 1,
1.283664, 0.2431815, -0.111813, 1, 1, 1, 1, 1,
1.285139, -0.5601984, 4.600939, 1, 1, 1, 1, 1,
1.296685, -1.148009, 2.464736, 1, 1, 1, 1, 1,
1.304111, 1.518559, 1.080662, 0, 0, 1, 1, 1,
1.307752, 1.039464, -0.1512152, 1, 0, 0, 1, 1,
1.307878, -1.095269, 2.128879, 1, 0, 0, 1, 1,
1.310668, -0.7069318, 1.195986, 1, 0, 0, 1, 1,
1.316695, 0.6692414, 2.403707, 1, 0, 0, 1, 1,
1.323553, -0.3967638, 1.58176, 1, 0, 0, 1, 1,
1.323682, -0.7032638, 2.742494, 0, 0, 0, 1, 1,
1.32709, 1.094627, 0.8258126, 0, 0, 0, 1, 1,
1.331365, -0.3487329, 1.92822, 0, 0, 0, 1, 1,
1.358838, -0.5212397, 2.340874, 0, 0, 0, 1, 1,
1.360466, -1.035974, 2.421363, 0, 0, 0, 1, 1,
1.375968, 1.717892, 0.6391505, 0, 0, 0, 1, 1,
1.376474, -1.202028, 2.898432, 0, 0, 0, 1, 1,
1.381384, 0.007044736, 2.305015, 1, 1, 1, 1, 1,
1.397865, -0.9217786, 0.8523858, 1, 1, 1, 1, 1,
1.408935, -0.2477989, 0.368362, 1, 1, 1, 1, 1,
1.415751, -0.8450087, -1.033828, 1, 1, 1, 1, 1,
1.421312, -0.8071379, 3.056915, 1, 1, 1, 1, 1,
1.426427, -0.7086794, 1.600025, 1, 1, 1, 1, 1,
1.427371, 1.015733, 1.813794, 1, 1, 1, 1, 1,
1.433053, 0.2032353, 1.720641, 1, 1, 1, 1, 1,
1.435581, -2.407271, 2.715039, 1, 1, 1, 1, 1,
1.438624, 0.5527216, 2.091209, 1, 1, 1, 1, 1,
1.446748, -1.937966, 1.016261, 1, 1, 1, 1, 1,
1.4872, -0.5182219, 1.78214, 1, 1, 1, 1, 1,
1.492737, 2.46962, -0.07495559, 1, 1, 1, 1, 1,
1.502297, -0.4333716, 1.859924, 1, 1, 1, 1, 1,
1.504092, 1.617012, 0.8299134, 1, 1, 1, 1, 1,
1.511332, 0.4406052, 0.4180243, 0, 0, 1, 1, 1,
1.514799, -0.7350917, 0.9069074, 1, 0, 0, 1, 1,
1.522476, 0.6074531, 2.718672, 1, 0, 0, 1, 1,
1.52803, -1.12204, 4.682603, 1, 0, 0, 1, 1,
1.528823, 0.4711387, 2.768227, 1, 0, 0, 1, 1,
1.54797, -0.006101383, 1.598766, 1, 0, 0, 1, 1,
1.573522, -1.300063, 2.445024, 0, 0, 0, 1, 1,
1.577096, -0.02212122, 3.03739, 0, 0, 0, 1, 1,
1.597095, -0.3142422, 0.9510699, 0, 0, 0, 1, 1,
1.598864, 0.1333516, 2.917982, 0, 0, 0, 1, 1,
1.610824, 0.3358639, -1.381582, 0, 0, 0, 1, 1,
1.618188, -1.267882, 2.833021, 0, 0, 0, 1, 1,
1.622896, -1.151621, 1.944424, 0, 0, 0, 1, 1,
1.627597, -0.5260211, 2.138243, 1, 1, 1, 1, 1,
1.629916, -0.8258086, 2.157967, 1, 1, 1, 1, 1,
1.637775, 1.591154, -0.05848864, 1, 1, 1, 1, 1,
1.638375, -0.2208098, 3.128051, 1, 1, 1, 1, 1,
1.643743, -0.3800948, 0.3862425, 1, 1, 1, 1, 1,
1.652702, -0.7084264, 3.09317, 1, 1, 1, 1, 1,
1.662541, 0.4498659, 1.830213, 1, 1, 1, 1, 1,
1.669152, -0.1219196, 3.982627, 1, 1, 1, 1, 1,
1.678626, -0.1575947, 2.159698, 1, 1, 1, 1, 1,
1.680383, -0.5447831, 1.470883, 1, 1, 1, 1, 1,
1.680913, -1.196197, 2.099786, 1, 1, 1, 1, 1,
1.683098, 1.761808, 0.758972, 1, 1, 1, 1, 1,
1.684766, 1.224912, 0.963295, 1, 1, 1, 1, 1,
1.685126, 3.001746, 0.8123986, 1, 1, 1, 1, 1,
1.697745, -0.5156568, 2.028268, 1, 1, 1, 1, 1,
1.701418, 0.8101927, 3.065507, 0, 0, 1, 1, 1,
1.702406, 0.7172966, 0.687998, 1, 0, 0, 1, 1,
1.703422, -0.03789168, 1.857156, 1, 0, 0, 1, 1,
1.710355, 0.9578347, 1.155612, 1, 0, 0, 1, 1,
1.733494, 0.5536296, 3.437999, 1, 0, 0, 1, 1,
1.749241, 2.825011, 0.4790137, 1, 0, 0, 1, 1,
1.761646, 0.8847445, 0.3377233, 0, 0, 0, 1, 1,
1.763094, -0.2233743, 0.9650254, 0, 0, 0, 1, 1,
1.776681, 0.1711178, 2.509733, 0, 0, 0, 1, 1,
1.815995, -0.6595951, 2.143903, 0, 0, 0, 1, 1,
1.823121, 0.03215167, 1.557798, 0, 0, 0, 1, 1,
1.827607, -1.317448, 1.712325, 0, 0, 0, 1, 1,
1.828191, -0.5304138, 1.664604, 0, 0, 0, 1, 1,
1.853308, 0.275918, 0.2424178, 1, 1, 1, 1, 1,
1.880192, -0.8371512, 1.744258, 1, 1, 1, 1, 1,
1.891129, 0.7507786, -0.5840982, 1, 1, 1, 1, 1,
1.892715, 0.4370548, 2.046471, 1, 1, 1, 1, 1,
1.913621, 0.7084249, 1.047462, 1, 1, 1, 1, 1,
1.928528, -1.005258, 3.120281, 1, 1, 1, 1, 1,
1.931867, 0.6465993, 1.548579, 1, 1, 1, 1, 1,
1.950225, -1.433482, 1.854353, 1, 1, 1, 1, 1,
1.996714, 0.4842533, 0.5788098, 1, 1, 1, 1, 1,
2.001408, 0.5648375, 1.12432, 1, 1, 1, 1, 1,
2.003783, 1.185735, -1.029096, 1, 1, 1, 1, 1,
2.031063, -0.8151706, 0.3673579, 1, 1, 1, 1, 1,
2.04743, -0.07781851, 1.547569, 1, 1, 1, 1, 1,
2.050542, 0.6096534, 1.968136, 1, 1, 1, 1, 1,
2.097988, -0.9207826, 0.9181053, 1, 1, 1, 1, 1,
2.127044, -0.7912291, 0.1639606, 0, 0, 1, 1, 1,
2.159779, 0.6900885, 2.606077, 1, 0, 0, 1, 1,
2.170294, 0.8903393, -2.073644, 1, 0, 0, 1, 1,
2.184247, -0.6051192, 1.583483, 1, 0, 0, 1, 1,
2.185771, 0.5075905, 1.585388, 1, 0, 0, 1, 1,
2.240604, -0.9990539, 2.517837, 1, 0, 0, 1, 1,
2.318211, -0.9693898, 1.310681, 0, 0, 0, 1, 1,
2.347738, -0.667385, 1.195297, 0, 0, 0, 1, 1,
2.361933, 0.529231, 0.7804115, 0, 0, 0, 1, 1,
2.371539, 0.7673417, 0.5823594, 0, 0, 0, 1, 1,
2.382808, -0.437717, 1.517555, 0, 0, 0, 1, 1,
2.390151, -0.05071365, 2.933913, 0, 0, 0, 1, 1,
2.415186, -0.6318868, 2.170186, 0, 0, 0, 1, 1,
2.439119, -0.9405333, 3.11317, 1, 1, 1, 1, 1,
2.444544, 0.6526472, 1.054582, 1, 1, 1, 1, 1,
2.463878, 0.6381927, 1.746398, 1, 1, 1, 1, 1,
2.569201, 1.393753, -0.1533147, 1, 1, 1, 1, 1,
2.708963, -0.6549937, 1.353075, 1, 1, 1, 1, 1,
2.725758, 1.129714, 0.2907117, 1, 1, 1, 1, 1,
3.5624, 1.128971, 1.759977, 1, 1, 1, 1, 1
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
var radius = 9.59455;
var distance = 33.70045;
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
mvMatrix.translate( 0.009393692, 0.2389975, -0.2924881 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70045);
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
