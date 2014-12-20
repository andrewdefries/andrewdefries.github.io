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
-2.874889, 0.215874, -0.1752746, 1, 0, 0, 1,
-2.85361, -0.6752611, -1.837558, 1, 0.007843138, 0, 1,
-2.793052, -0.6505856, -1.91228, 1, 0.01176471, 0, 1,
-2.748691, -0.0457847, -1.51558, 1, 0.01960784, 0, 1,
-2.633397, 1.865919, -0.007290202, 1, 0.02352941, 0, 1,
-2.574216, -0.1803703, -2.147652, 1, 0.03137255, 0, 1,
-2.541515, -0.1183449, -0.9831102, 1, 0.03529412, 0, 1,
-2.526989, -0.08807699, -1.116522, 1, 0.04313726, 0, 1,
-2.459171, 0.5263863, -3.288352, 1, 0.04705882, 0, 1,
-2.410355, 0.8889138, -2.38668, 1, 0.05490196, 0, 1,
-2.403837, -0.6460019, -2.161196, 1, 0.05882353, 0, 1,
-2.382413, -1.196177, -3.238473, 1, 0.06666667, 0, 1,
-2.342955, -1.574871, -1.88869, 1, 0.07058824, 0, 1,
-2.220788, 0.1406227, -1.097258, 1, 0.07843138, 0, 1,
-2.193912, 0.3454668, -3.294844, 1, 0.08235294, 0, 1,
-2.174083, 0.8754989, -0.4158696, 1, 0.09019608, 0, 1,
-2.160698, -0.4523182, -1.96523, 1, 0.09411765, 0, 1,
-2.122384, -1.366966, -2.009921, 1, 0.1019608, 0, 1,
-2.092635, 0.3550745, -1.63614, 1, 0.1098039, 0, 1,
-2.072682, 0.8139277, -1.203515, 1, 0.1137255, 0, 1,
-2.067732, 0.171777, -1.783721, 1, 0.1215686, 0, 1,
-2.037885, 0.2834434, -1.954436, 1, 0.1254902, 0, 1,
-1.972223, 0.5157747, -2.623205, 1, 0.1333333, 0, 1,
-1.967141, -0.6344091, -2.03921, 1, 0.1372549, 0, 1,
-1.965313, 0.2042837, -2.92839, 1, 0.145098, 0, 1,
-1.937088, 0.6162736, -0.6250231, 1, 0.1490196, 0, 1,
-1.890478, 2.03461, 0.4046133, 1, 0.1568628, 0, 1,
-1.843732, 1.037476, -1.244269, 1, 0.1607843, 0, 1,
-1.843607, 0.3135614, 0.02918255, 1, 0.1686275, 0, 1,
-1.842588, 1.492843, -1.298151, 1, 0.172549, 0, 1,
-1.823687, -1.163457, -0.8612027, 1, 0.1803922, 0, 1,
-1.816494, -1.293451, -0.7909061, 1, 0.1843137, 0, 1,
-1.804612, -0.5133948, -0.6203993, 1, 0.1921569, 0, 1,
-1.766895, -0.2059133, -1.907646, 1, 0.1960784, 0, 1,
-1.748968, 0.255929, -1.781559, 1, 0.2039216, 0, 1,
-1.706393, -0.04298989, -3.041322, 1, 0.2117647, 0, 1,
-1.705973, 1.441255, -1.114311, 1, 0.2156863, 0, 1,
-1.693511, -2.547845, -1.283134, 1, 0.2235294, 0, 1,
-1.691446, 0.1816719, -2.367091, 1, 0.227451, 0, 1,
-1.680279, 0.1666748, -0.01008725, 1, 0.2352941, 0, 1,
-1.662068, -0.8214818, -0.3737064, 1, 0.2392157, 0, 1,
-1.65519, -1.823794, -2.667544, 1, 0.2470588, 0, 1,
-1.652643, 1.950695, -0.6335507, 1, 0.2509804, 0, 1,
-1.642272, 0.3646948, -1.558321, 1, 0.2588235, 0, 1,
-1.640443, 0.5928679, -2.530985, 1, 0.2627451, 0, 1,
-1.638103, -1.006195, -2.150754, 1, 0.2705882, 0, 1,
-1.637287, -0.4423423, -3.601553, 1, 0.2745098, 0, 1,
-1.632062, 2.471944, -0.1915784, 1, 0.282353, 0, 1,
-1.623244, -1.122855, -2.399047, 1, 0.2862745, 0, 1,
-1.62085, -1.481735, -2.168133, 1, 0.2941177, 0, 1,
-1.58757, -0.8057616, -1.578713, 1, 0.3019608, 0, 1,
-1.580523, 0.5818507, -1.506092, 1, 0.3058824, 0, 1,
-1.555753, -0.2938092, -1.682154, 1, 0.3137255, 0, 1,
-1.554131, -2.269825, -4.081167, 1, 0.3176471, 0, 1,
-1.536533, 0.8042583, 0.1880389, 1, 0.3254902, 0, 1,
-1.531913, 0.9009991, -0.4163135, 1, 0.3294118, 0, 1,
-1.528473, 0.7407788, 0.3654879, 1, 0.3372549, 0, 1,
-1.518612, 0.9887518, -1.60678, 1, 0.3411765, 0, 1,
-1.488661, -0.8893936, -2.112653, 1, 0.3490196, 0, 1,
-1.487552, -0.1783517, -1.526976, 1, 0.3529412, 0, 1,
-1.487295, -0.6362071, -3.427416, 1, 0.3607843, 0, 1,
-1.476391, -1.339114, -1.778619, 1, 0.3647059, 0, 1,
-1.474437, -0.6466053, -2.115469, 1, 0.372549, 0, 1,
-1.461106, -0.1677772, -2.632617, 1, 0.3764706, 0, 1,
-1.451411, -1.119162, -2.309413, 1, 0.3843137, 0, 1,
-1.447455, -0.1111166, 0.4173688, 1, 0.3882353, 0, 1,
-1.445268, -0.6116749, -2.428983, 1, 0.3960784, 0, 1,
-1.444012, 0.3076629, -1.903792, 1, 0.4039216, 0, 1,
-1.437535, 0.6607117, -2.898382, 1, 0.4078431, 0, 1,
-1.424316, -0.2168027, -1.657278, 1, 0.4156863, 0, 1,
-1.424237, -0.4132425, -1.697793, 1, 0.4196078, 0, 1,
-1.412583, 0.8318236, -1.236088, 1, 0.427451, 0, 1,
-1.412379, 1.245715, -0.6047537, 1, 0.4313726, 0, 1,
-1.40496, 0.8306106, -0.5105764, 1, 0.4392157, 0, 1,
-1.399041, -0.7737303, -2.688019, 1, 0.4431373, 0, 1,
-1.395899, -0.5842097, -1.764546, 1, 0.4509804, 0, 1,
-1.381581, 1.677722, -1.651425, 1, 0.454902, 0, 1,
-1.372703, -1.695696, -0.5801886, 1, 0.4627451, 0, 1,
-1.367585, -0.5016822, -3.759967, 1, 0.4666667, 0, 1,
-1.343776, -0.2195525, -1.718836, 1, 0.4745098, 0, 1,
-1.341601, -0.5533324, -1.923585, 1, 0.4784314, 0, 1,
-1.340842, -0.4428966, -1.236155, 1, 0.4862745, 0, 1,
-1.337384, -0.2418635, -2.536985, 1, 0.4901961, 0, 1,
-1.336365, -0.4146276, -2.748074, 1, 0.4980392, 0, 1,
-1.317778, 0.08632977, -1.229663, 1, 0.5058824, 0, 1,
-1.313778, -0.3985032, -3.034961, 1, 0.509804, 0, 1,
-1.310654, 0.9083331, -0.782874, 1, 0.5176471, 0, 1,
-1.302572, -0.3450579, -1.627349, 1, 0.5215687, 0, 1,
-1.287515, 1.222098, -0.02941463, 1, 0.5294118, 0, 1,
-1.287498, -0.8406633, -1.712377, 1, 0.5333334, 0, 1,
-1.287327, -0.004842768, -0.2293307, 1, 0.5411765, 0, 1,
-1.275755, 0.4385114, -0.2203438, 1, 0.5450981, 0, 1,
-1.268702, -0.8215587, -2.250561, 1, 0.5529412, 0, 1,
-1.26712, -1.210772, -2.216661, 1, 0.5568628, 0, 1,
-1.264799, 0.01431236, -0.7426496, 1, 0.5647059, 0, 1,
-1.260769, 1.05925, -0.02723588, 1, 0.5686275, 0, 1,
-1.25464, -1.485398, -1.000794, 1, 0.5764706, 0, 1,
-1.244961, 2.024136, -1.229552, 1, 0.5803922, 0, 1,
-1.241255, -0.5804533, -2.494187, 1, 0.5882353, 0, 1,
-1.230687, 1.012951, 0.4082284, 1, 0.5921569, 0, 1,
-1.230478, 0.05882761, -0.9897004, 1, 0.6, 0, 1,
-1.227453, -0.8624501, -3.061442, 1, 0.6078432, 0, 1,
-1.223906, -0.7962182, -0.4872901, 1, 0.6117647, 0, 1,
-1.220763, 0.4461215, -2.13023, 1, 0.6196079, 0, 1,
-1.216001, -0.2906567, -0.8645394, 1, 0.6235294, 0, 1,
-1.214174, -1.029271, -1.680798, 1, 0.6313726, 0, 1,
-1.211744, -0.1646595, -2.412586, 1, 0.6352941, 0, 1,
-1.203919, 0.344532, -2.39597, 1, 0.6431373, 0, 1,
-1.200417, -0.003784548, -2.675157, 1, 0.6470588, 0, 1,
-1.193497, -1.11785, -3.361719, 1, 0.654902, 0, 1,
-1.19345, 0.4935026, -1.141276, 1, 0.6588235, 0, 1,
-1.188487, 0.7714154, -2.501505, 1, 0.6666667, 0, 1,
-1.18807, 0.2563857, -0.5029332, 1, 0.6705883, 0, 1,
-1.182248, 0.130558, -1.669317, 1, 0.6784314, 0, 1,
-1.175837, -0.129948, -1.336371, 1, 0.682353, 0, 1,
-1.17074, -1.240304, -3.418927, 1, 0.6901961, 0, 1,
-1.165632, 1.766018, -0.6662776, 1, 0.6941177, 0, 1,
-1.162887, 0.8080479, -0.4691418, 1, 0.7019608, 0, 1,
-1.160401, 0.2721926, 0.134488, 1, 0.7098039, 0, 1,
-1.153279, -0.8923779, -2.485491, 1, 0.7137255, 0, 1,
-1.142791, 1.507864, -1.412963, 1, 0.7215686, 0, 1,
-1.124089, -0.06746572, -1.408683, 1, 0.7254902, 0, 1,
-1.123143, -2.647868, -4.161836, 1, 0.7333333, 0, 1,
-1.122228, -0.4691618, -1.503378, 1, 0.7372549, 0, 1,
-1.120621, 0.3757132, -2.197514, 1, 0.7450981, 0, 1,
-1.113943, -1.626679, -0.2093648, 1, 0.7490196, 0, 1,
-1.106823, -0.4542528, -2.949193, 1, 0.7568628, 0, 1,
-1.09448, 0.464422, -1.658094, 1, 0.7607843, 0, 1,
-1.091076, 0.4363907, -1.3363, 1, 0.7686275, 0, 1,
-1.079307, -0.9034445, -0.3319391, 1, 0.772549, 0, 1,
-1.075514, -0.1131638, -0.9758651, 1, 0.7803922, 0, 1,
-1.074307, 1.684343, -2.163889, 1, 0.7843137, 0, 1,
-1.072734, 1.4922, 0.2617595, 1, 0.7921569, 0, 1,
-1.070581, -0.3092468, -1.908055, 1, 0.7960784, 0, 1,
-1.069223, -0.555912, -1.75093, 1, 0.8039216, 0, 1,
-1.065261, 0.8944968, 0.8612537, 1, 0.8117647, 0, 1,
-1.057053, -1.017287, -3.008472, 1, 0.8156863, 0, 1,
-1.052196, 0.4371301, -0.6318109, 1, 0.8235294, 0, 1,
-1.051987, -1.453096, -2.548422, 1, 0.827451, 0, 1,
-1.05082, -0.4223355, -2.279701, 1, 0.8352941, 0, 1,
-1.044227, -0.3428609, -0.1255103, 1, 0.8392157, 0, 1,
-1.036438, -1.537352, -4.031427, 1, 0.8470588, 0, 1,
-1.033425, -0.9585261, -2.202611, 1, 0.8509804, 0, 1,
-1.028305, 0.4965803, -1.505619, 1, 0.8588235, 0, 1,
-1.024979, -0.6319948, 0.73301, 1, 0.8627451, 0, 1,
-1.023574, -0.2224807, -1.524557, 1, 0.8705882, 0, 1,
-1.022461, 0.3996707, -1.465225, 1, 0.8745098, 0, 1,
-1.016807, -0.7356617, -2.738401, 1, 0.8823529, 0, 1,
-1.016176, -0.08753306, -0.1759617, 1, 0.8862745, 0, 1,
-1.015495, 1.089185, 1.715532, 1, 0.8941177, 0, 1,
-1.014705, 0.1087979, -3.79707, 1, 0.8980392, 0, 1,
-0.9931684, 1.448635, -0.1180999, 1, 0.9058824, 0, 1,
-0.9922401, 0.7642249, 0.4028241, 1, 0.9137255, 0, 1,
-0.991081, -0.02906572, -0.8500858, 1, 0.9176471, 0, 1,
-0.9857311, -0.8435116, -1.903132, 1, 0.9254902, 0, 1,
-0.9772158, 0.3340235, -2.115381, 1, 0.9294118, 0, 1,
-0.9755954, -0.627428, -1.440434, 1, 0.9372549, 0, 1,
-0.9707674, 0.319795, -0.2131693, 1, 0.9411765, 0, 1,
-0.9699576, 0.2001284, -3.390927, 1, 0.9490196, 0, 1,
-0.9480818, 0.264906, -1.672781, 1, 0.9529412, 0, 1,
-0.9480556, 0.03422128, -3.049247, 1, 0.9607843, 0, 1,
-0.9473091, 1.052142, -0.9626094, 1, 0.9647059, 0, 1,
-0.9328123, 1.806102, -1.074363, 1, 0.972549, 0, 1,
-0.9245594, -1.292337, -0.8625754, 1, 0.9764706, 0, 1,
-0.9243094, -0.3982268, -1.392985, 1, 0.9843137, 0, 1,
-0.9226426, -0.1514661, -1.101928, 1, 0.9882353, 0, 1,
-0.9218453, -0.4407147, -2.769461, 1, 0.9960784, 0, 1,
-0.9130902, -0.5014182, -0.5034814, 0.9960784, 1, 0, 1,
-0.9067111, -0.06183085, -1.227421, 0.9921569, 1, 0, 1,
-0.9049318, -2.743349, -1.094199, 0.9843137, 1, 0, 1,
-0.9038319, -0.2272255, -1.471655, 0.9803922, 1, 0, 1,
-0.902471, -0.2446362, -1.181476, 0.972549, 1, 0, 1,
-0.890854, 1.060582, -2.273833, 0.9686275, 1, 0, 1,
-0.8892471, -0.3920658, -2.319407, 0.9607843, 1, 0, 1,
-0.8872379, 0.4057895, 0.2255339, 0.9568627, 1, 0, 1,
-0.8859577, 0.4173268, -2.099058, 0.9490196, 1, 0, 1,
-0.8857065, 1.236002, -0.6900849, 0.945098, 1, 0, 1,
-0.882117, -0.3999867, -1.736703, 0.9372549, 1, 0, 1,
-0.8798803, -1.578595, -3.657617, 0.9333333, 1, 0, 1,
-0.8762239, -0.4607007, -1.130239, 0.9254902, 1, 0, 1,
-0.8748491, 1.229287, -0.4473251, 0.9215686, 1, 0, 1,
-0.8727046, 3.276074, 0.213742, 0.9137255, 1, 0, 1,
-0.8693646, -1.176857, -1.855052, 0.9098039, 1, 0, 1,
-0.8682263, -0.3086624, -2.657284, 0.9019608, 1, 0, 1,
-0.8645025, 1.400368, -1.904203, 0.8941177, 1, 0, 1,
-0.8611491, -2.228355, -2.781799, 0.8901961, 1, 0, 1,
-0.8517866, 1.190753, 0.3276181, 0.8823529, 1, 0, 1,
-0.8497892, -0.9536549, -3.902966, 0.8784314, 1, 0, 1,
-0.8450462, -2.713619, -4.616518, 0.8705882, 1, 0, 1,
-0.8418648, -1.357135, -2.037722, 0.8666667, 1, 0, 1,
-0.8407965, -0.3337264, -0.7719777, 0.8588235, 1, 0, 1,
-0.8369189, -1.158577, -3.098386, 0.854902, 1, 0, 1,
-0.8361323, -1.776649, -0.3722838, 0.8470588, 1, 0, 1,
-0.8355747, 0.4904061, -1.70974, 0.8431373, 1, 0, 1,
-0.8342373, 0.1569476, 0.8635175, 0.8352941, 1, 0, 1,
-0.8328808, -0.2427664, -2.146416, 0.8313726, 1, 0, 1,
-0.8326889, -1.470889, -3.350157, 0.8235294, 1, 0, 1,
-0.8247859, 0.6522112, -0.360871, 0.8196079, 1, 0, 1,
-0.8195289, 1.240192, 0.5299621, 0.8117647, 1, 0, 1,
-0.8193181, 0.3333382, -0.771629, 0.8078431, 1, 0, 1,
-0.8182678, -2.033173, -3.233498, 0.8, 1, 0, 1,
-0.8170167, -0.5472344, -1.340472, 0.7921569, 1, 0, 1,
-0.8138283, -1.013383, -2.764534, 0.7882353, 1, 0, 1,
-0.8083069, -0.7171106, -1.988395, 0.7803922, 1, 0, 1,
-0.8016832, -0.2196926, -2.425419, 0.7764706, 1, 0, 1,
-0.7940124, 1.13109, -1.040526, 0.7686275, 1, 0, 1,
-0.7938673, 0.3479636, -1.103864, 0.7647059, 1, 0, 1,
-0.7829749, 0.5923638, -1.574885, 0.7568628, 1, 0, 1,
-0.7823271, -0.08806019, 0.1476491, 0.7529412, 1, 0, 1,
-0.779121, -2.016595, -2.032054, 0.7450981, 1, 0, 1,
-0.7690235, -0.6700147, -1.876411, 0.7411765, 1, 0, 1,
-0.7664369, -0.4197145, -1.590017, 0.7333333, 1, 0, 1,
-0.7583402, 2.924578, 1.480315, 0.7294118, 1, 0, 1,
-0.7546008, 0.3565255, -1.547033, 0.7215686, 1, 0, 1,
-0.7523353, 0.2386075, -1.406157, 0.7176471, 1, 0, 1,
-0.7414786, -0.2143639, -2.358288, 0.7098039, 1, 0, 1,
-0.7407134, 0.6891632, -0.02608258, 0.7058824, 1, 0, 1,
-0.7395753, 0.01267971, -0.9883758, 0.6980392, 1, 0, 1,
-0.735505, 0.9855894, -0.3794713, 0.6901961, 1, 0, 1,
-0.7341552, -0.7176418, -2.006757, 0.6862745, 1, 0, 1,
-0.7335367, -1.617792, -3.523726, 0.6784314, 1, 0, 1,
-0.7333578, 0.196401, -0.6457099, 0.6745098, 1, 0, 1,
-0.7297983, -1.068293, -1.730186, 0.6666667, 1, 0, 1,
-0.7287068, -1.132111, -1.535875, 0.6627451, 1, 0, 1,
-0.7228796, -0.9059206, -2.054603, 0.654902, 1, 0, 1,
-0.7206072, -0.2872265, -1.249798, 0.6509804, 1, 0, 1,
-0.720253, -0.8351122, -1.805287, 0.6431373, 1, 0, 1,
-0.7186968, -0.7687831, -3.455461, 0.6392157, 1, 0, 1,
-0.7153865, 0.3168486, -0.4359551, 0.6313726, 1, 0, 1,
-0.7017979, -0.4444835, -3.323229, 0.627451, 1, 0, 1,
-0.7006097, -0.6122571, -2.290467, 0.6196079, 1, 0, 1,
-0.698959, 0.4341685, 0.3924594, 0.6156863, 1, 0, 1,
-0.6979252, 0.7169993, 0.01052307, 0.6078432, 1, 0, 1,
-0.6974343, -0.2179354, -1.19566, 0.6039216, 1, 0, 1,
-0.6902499, 0.03697648, -2.208616, 0.5960785, 1, 0, 1,
-0.6829793, -0.05614716, -3.283857, 0.5882353, 1, 0, 1,
-0.6764076, -0.5914626, -1.076322, 0.5843138, 1, 0, 1,
-0.6745985, -0.1094098, -2.150262, 0.5764706, 1, 0, 1,
-0.670338, -0.08363241, -2.515692, 0.572549, 1, 0, 1,
-0.6703258, 0.3186189, -1.293926, 0.5647059, 1, 0, 1,
-0.6687677, 0.2285863, -2.087154, 0.5607843, 1, 0, 1,
-0.6659988, -0.07657313, -0.8631302, 0.5529412, 1, 0, 1,
-0.6658391, 0.8053237, -0.3693596, 0.5490196, 1, 0, 1,
-0.6590596, -0.426731, -2.804712, 0.5411765, 1, 0, 1,
-0.6529122, -0.6348395, -1.827727, 0.5372549, 1, 0, 1,
-0.646355, -0.4331262, -2.451049, 0.5294118, 1, 0, 1,
-0.6432334, 1.545885, -0.1163949, 0.5254902, 1, 0, 1,
-0.6420849, -0.5840687, -4.545765, 0.5176471, 1, 0, 1,
-0.6359069, 2.051339, -1.409609, 0.5137255, 1, 0, 1,
-0.6348282, -1.153352, -2.987839, 0.5058824, 1, 0, 1,
-0.6333569, -0.646277, -2.85693, 0.5019608, 1, 0, 1,
-0.6307263, 1.644576, -1.896012, 0.4941176, 1, 0, 1,
-0.6250811, 1.128996, -0.08915658, 0.4862745, 1, 0, 1,
-0.6220117, -0.1185044, -1.037786, 0.4823529, 1, 0, 1,
-0.6183233, 2.185894, 0.478911, 0.4745098, 1, 0, 1,
-0.6073242, -0.9501394, -3.349814, 0.4705882, 1, 0, 1,
-0.6005904, -0.05721558, -0.7093811, 0.4627451, 1, 0, 1,
-0.5984666, 0.4202602, -0.1274515, 0.4588235, 1, 0, 1,
-0.5970829, 0.6906048, -0.6026315, 0.4509804, 1, 0, 1,
-0.5913044, 0.1758665, -0.4809126, 0.4470588, 1, 0, 1,
-0.5855348, -0.08828303, -3.121152, 0.4392157, 1, 0, 1,
-0.5839628, -0.305885, -3.622023, 0.4352941, 1, 0, 1,
-0.5822034, -2.231579, -3.457806, 0.427451, 1, 0, 1,
-0.5804316, 0.8395171, 0.4607599, 0.4235294, 1, 0, 1,
-0.5789776, -1.75926, -1.228568, 0.4156863, 1, 0, 1,
-0.563396, 0.1377715, -0.7744173, 0.4117647, 1, 0, 1,
-0.5608436, -0.3686596, -0.9397045, 0.4039216, 1, 0, 1,
-0.555063, -1.172873, -3.823159, 0.3960784, 1, 0, 1,
-0.5537027, 1.561054, -1.248302, 0.3921569, 1, 0, 1,
-0.5502214, -0.2418068, -1.64044, 0.3843137, 1, 0, 1,
-0.5495597, 0.2995009, -0.7061101, 0.3803922, 1, 0, 1,
-0.5448912, -0.8997803, -1.793051, 0.372549, 1, 0, 1,
-0.5440476, 1.231079, 0.2814927, 0.3686275, 1, 0, 1,
-0.5397925, -1.671583, -4.481568, 0.3607843, 1, 0, 1,
-0.5395126, 0.600897, -1.300407, 0.3568628, 1, 0, 1,
-0.5366701, -0.6364156, -1.361988, 0.3490196, 1, 0, 1,
-0.5359417, 2.037453, 0.4353756, 0.345098, 1, 0, 1,
-0.5342472, 1.992253, -0.5494016, 0.3372549, 1, 0, 1,
-0.5293278, 0.8449889, -1.234404, 0.3333333, 1, 0, 1,
-0.5224074, 2.132075, 0.3320248, 0.3254902, 1, 0, 1,
-0.5199939, -0.7366201, -3.325081, 0.3215686, 1, 0, 1,
-0.5189888, 0.7277505, 0.8253775, 0.3137255, 1, 0, 1,
-0.5175028, 0.3158557, -1.084713, 0.3098039, 1, 0, 1,
-0.5171106, 0.685113, -1.881097, 0.3019608, 1, 0, 1,
-0.5160906, -0.8842968, -2.266443, 0.2941177, 1, 0, 1,
-0.5107022, 0.2485214, -1.790125, 0.2901961, 1, 0, 1,
-0.5099924, -1.651658, -3.334955, 0.282353, 1, 0, 1,
-0.50598, -1.457622, -3.974915, 0.2784314, 1, 0, 1,
-0.5048859, -0.2914502, -3.393465, 0.2705882, 1, 0, 1,
-0.5044015, 1.341434, -0.7478116, 0.2666667, 1, 0, 1,
-0.4993521, -2.280177, -3.946012, 0.2588235, 1, 0, 1,
-0.4891025, 1.599432, -0.7092858, 0.254902, 1, 0, 1,
-0.4890373, -0.6293355, -3.262496, 0.2470588, 1, 0, 1,
-0.4884183, 1.619807, 0.6315933, 0.2431373, 1, 0, 1,
-0.4879701, 0.5282373, -0.5772809, 0.2352941, 1, 0, 1,
-0.4870796, -0.6592598, -2.121624, 0.2313726, 1, 0, 1,
-0.4822377, -0.1943213, -1.959926, 0.2235294, 1, 0, 1,
-0.4812198, -0.3589669, -1.466901, 0.2196078, 1, 0, 1,
-0.4781033, 0.343481, -0.6609873, 0.2117647, 1, 0, 1,
-0.4776081, -1.092703, -3.069919, 0.2078431, 1, 0, 1,
-0.4774174, 0.7965518, -0.4116414, 0.2, 1, 0, 1,
-0.4753269, 0.02763965, -1.64029, 0.1921569, 1, 0, 1,
-0.4745486, 2.51395, -0.07295758, 0.1882353, 1, 0, 1,
-0.4613644, -0.7581747, -0.9809211, 0.1803922, 1, 0, 1,
-0.4601001, 0.2509773, -0.5056147, 0.1764706, 1, 0, 1,
-0.4593062, 1.318327, 0.7845597, 0.1686275, 1, 0, 1,
-0.4579958, -0.1105217, -2.54151, 0.1647059, 1, 0, 1,
-0.4534932, 0.2578886, -1.279293, 0.1568628, 1, 0, 1,
-0.4530885, 0.06659655, -2.598301, 0.1529412, 1, 0, 1,
-0.4513136, 0.2367875, 0.5381944, 0.145098, 1, 0, 1,
-0.4475481, 0.3524775, -0.8603968, 0.1411765, 1, 0, 1,
-0.4453244, 0.3084717, -1.106883, 0.1333333, 1, 0, 1,
-0.4426087, 0.4006411, -1.959289, 0.1294118, 1, 0, 1,
-0.4386449, 0.7737302, -1.086675, 0.1215686, 1, 0, 1,
-0.4375037, 0.9227303, -0.2971686, 0.1176471, 1, 0, 1,
-0.4343632, 0.5121779, 0.9818324, 0.1098039, 1, 0, 1,
-0.4342932, -0.3386935, -3.328466, 0.1058824, 1, 0, 1,
-0.4301858, 0.7062723, -0.7614129, 0.09803922, 1, 0, 1,
-0.4139093, -0.5651484, -1.919693, 0.09019608, 1, 0, 1,
-0.4135377, 1.464253, -0.5466344, 0.08627451, 1, 0, 1,
-0.4129512, -0.1868458, -3.446489, 0.07843138, 1, 0, 1,
-0.4129215, -0.4683898, -3.726321, 0.07450981, 1, 0, 1,
-0.4116795, -0.4382053, -3.304858, 0.06666667, 1, 0, 1,
-0.4113858, -0.02325648, -3.166258, 0.0627451, 1, 0, 1,
-0.4087446, -1.171678, -1.904057, 0.05490196, 1, 0, 1,
-0.405129, -0.03793333, -2.82366, 0.05098039, 1, 0, 1,
-0.3999989, 0.4926582, -0.09561164, 0.04313726, 1, 0, 1,
-0.3944173, 0.1645471, -2.498695, 0.03921569, 1, 0, 1,
-0.3936231, 0.1648623, 0.4075719, 0.03137255, 1, 0, 1,
-0.3926424, -0.3363563, -1.340046, 0.02745098, 1, 0, 1,
-0.3877114, 0.4572963, -0.5549521, 0.01960784, 1, 0, 1,
-0.3822181, 0.1402484, -2.628448, 0.01568628, 1, 0, 1,
-0.378177, -0.8532385, -3.606881, 0.007843138, 1, 0, 1,
-0.3773136, 1.286299, -1.06044, 0.003921569, 1, 0, 1,
-0.3771928, -0.6799715, -1.916178, 0, 1, 0.003921569, 1,
-0.3765241, -1.360112, -1.665404, 0, 1, 0.01176471, 1,
-0.3757932, -1.170687, -3.742059, 0, 1, 0.01568628, 1,
-0.3752333, -0.5412168, -3.223598, 0, 1, 0.02352941, 1,
-0.3751959, 0.09821439, -2.5971, 0, 1, 0.02745098, 1,
-0.3713132, 0.04756586, -2.213592, 0, 1, 0.03529412, 1,
-0.3704353, -0.501908, -2.800283, 0, 1, 0.03921569, 1,
-0.3696108, -0.4490152, -2.964212, 0, 1, 0.04705882, 1,
-0.3672958, 2.026731, -0.711413, 0, 1, 0.05098039, 1,
-0.3656171, -0.3337716, -3.7847, 0, 1, 0.05882353, 1,
-0.362303, 2.138583, -2.058601, 0, 1, 0.0627451, 1,
-0.3611241, 0.6745054, 1.814269, 0, 1, 0.07058824, 1,
-0.3573103, 0.0545737, -0.642099, 0, 1, 0.07450981, 1,
-0.3566288, -0.8649548, -3.003834, 0, 1, 0.08235294, 1,
-0.3561754, 0.9809484, -0.953002, 0, 1, 0.08627451, 1,
-0.3555552, -1.437882, -4.073942, 0, 1, 0.09411765, 1,
-0.3538656, -0.138932, -4.486585, 0, 1, 0.1019608, 1,
-0.3506064, 0.8103739, -0.5430362, 0, 1, 0.1058824, 1,
-0.3488056, -0.3023481, -0.8791202, 0, 1, 0.1137255, 1,
-0.3463676, 0.2050966, -0.3095644, 0, 1, 0.1176471, 1,
-0.337962, 0.760017, -1.759132, 0, 1, 0.1254902, 1,
-0.3375406, 0.2508709, 0.3190277, 0, 1, 0.1294118, 1,
-0.3369387, -0.8871472, -1.976919, 0, 1, 0.1372549, 1,
-0.3315108, 0.9069002, -0.04497193, 0, 1, 0.1411765, 1,
-0.331084, 0.1053369, -1.27377, 0, 1, 0.1490196, 1,
-0.3307097, -1.87495, -2.833337, 0, 1, 0.1529412, 1,
-0.3285152, -1.485508, -2.515325, 0, 1, 0.1607843, 1,
-0.3229758, -0.03430578, -1.537725, 0, 1, 0.1647059, 1,
-0.3214943, -1.337302, -4.050464, 0, 1, 0.172549, 1,
-0.3206436, -0.6108685, -2.056752, 0, 1, 0.1764706, 1,
-0.3194232, 0.8289936, 0.1659975, 0, 1, 0.1843137, 1,
-0.3137003, -0.2224407, -0.9696166, 0, 1, 0.1882353, 1,
-0.3125836, 0.2421087, -0.5758876, 0, 1, 0.1960784, 1,
-0.3116631, -0.5221672, -4.167754, 0, 1, 0.2039216, 1,
-0.3097495, -1.866613, -3.054946, 0, 1, 0.2078431, 1,
-0.3076413, 0.05019227, 0.2187263, 0, 1, 0.2156863, 1,
-0.3029401, 0.5536399, 1.078061, 0, 1, 0.2196078, 1,
-0.3021499, -1.005116, -2.811289, 0, 1, 0.227451, 1,
-0.3018252, -0.3398172, -3.77104, 0, 1, 0.2313726, 1,
-0.2984808, -0.4580715, -0.9281636, 0, 1, 0.2392157, 1,
-0.2939269, 1.333371, -0.6693802, 0, 1, 0.2431373, 1,
-0.2923819, -0.7442642, -2.276053, 0, 1, 0.2509804, 1,
-0.285995, -0.4315171, -3.6739, 0, 1, 0.254902, 1,
-0.2835669, 0.4325798, -1.130799, 0, 1, 0.2627451, 1,
-0.2829804, 1.052724, 0.1465182, 0, 1, 0.2666667, 1,
-0.2825546, -0.267357, -0.7111498, 0, 1, 0.2745098, 1,
-0.2814581, 1.312723, -0.1157721, 0, 1, 0.2784314, 1,
-0.2813367, -0.8684385, -3.178487, 0, 1, 0.2862745, 1,
-0.2801895, -1.105749, -4.638797, 0, 1, 0.2901961, 1,
-0.2780014, 0.03020392, -2.021839, 0, 1, 0.2980392, 1,
-0.2770162, -0.6430833, -3.7262, 0, 1, 0.3058824, 1,
-0.2745977, -1.267254, -3.836539, 0, 1, 0.3098039, 1,
-0.2563999, 0.6847828, 0.7620762, 0, 1, 0.3176471, 1,
-0.2547514, -0.1677275, -1.492393, 0, 1, 0.3215686, 1,
-0.2501638, -0.5468323, -2.38809, 0, 1, 0.3294118, 1,
-0.2500682, -2.6483, -4.645069, 0, 1, 0.3333333, 1,
-0.247258, 0.4851398, -0.8372287, 0, 1, 0.3411765, 1,
-0.2462865, 1.45087, 0.3878406, 0, 1, 0.345098, 1,
-0.2445893, 0.1904168, -0.04324316, 0, 1, 0.3529412, 1,
-0.2407908, -0.4935551, -2.163945, 0, 1, 0.3568628, 1,
-0.2383295, 1.975043, -0.2148291, 0, 1, 0.3647059, 1,
-0.2383124, -0.8013948, -1.816278, 0, 1, 0.3686275, 1,
-0.2374779, 0.06102671, -0.6715533, 0, 1, 0.3764706, 1,
-0.2361822, 0.7949516, 1.137211, 0, 1, 0.3803922, 1,
-0.2359644, 0.9042052, -0.8661532, 0, 1, 0.3882353, 1,
-0.2350551, 0.3366634, -1.190421, 0, 1, 0.3921569, 1,
-0.2310993, 0.09360303, -0.4879557, 0, 1, 0.4, 1,
-0.2273524, 0.4595609, -0.1167802, 0, 1, 0.4078431, 1,
-0.2270914, 0.4547713, -1.733552, 0, 1, 0.4117647, 1,
-0.2263334, 0.9447501, -2.656096, 0, 1, 0.4196078, 1,
-0.2199236, 0.3073988, -0.1473062, 0, 1, 0.4235294, 1,
-0.2193269, 1.488745, 0.2878635, 0, 1, 0.4313726, 1,
-0.2173999, -0.9677781, -1.897306, 0, 1, 0.4352941, 1,
-0.2173539, 1.458879, 0.8300066, 0, 1, 0.4431373, 1,
-0.214325, -0.7502373, -1.954799, 0, 1, 0.4470588, 1,
-0.2054824, 1.366334, 0.1207917, 0, 1, 0.454902, 1,
-0.2032061, 1.01428, -0.4044781, 0, 1, 0.4588235, 1,
-0.2005955, 0.7473118, -0.8383668, 0, 1, 0.4666667, 1,
-0.1991006, -0.2003254, -2.095329, 0, 1, 0.4705882, 1,
-0.1951821, -0.6513003, -3.769083, 0, 1, 0.4784314, 1,
-0.1948131, -0.9760707, -3.897427, 0, 1, 0.4823529, 1,
-0.1873605, 0.3276662, 1.967242, 0, 1, 0.4901961, 1,
-0.1858482, 0.3293212, -0.5802293, 0, 1, 0.4941176, 1,
-0.1846389, 0.8434201, -0.4861965, 0, 1, 0.5019608, 1,
-0.1829436, -0.8330911, -2.17646, 0, 1, 0.509804, 1,
-0.1804486, -0.5222962, -2.32363, 0, 1, 0.5137255, 1,
-0.1769404, -0.1164777, -2.371726, 0, 1, 0.5215687, 1,
-0.1768168, -0.600156, -1.062511, 0, 1, 0.5254902, 1,
-0.1765157, 0.152012, -1.865156, 0, 1, 0.5333334, 1,
-0.1717794, -0.06086693, -0.9382868, 0, 1, 0.5372549, 1,
-0.1689174, -0.5087501, -2.682224, 0, 1, 0.5450981, 1,
-0.1679473, -0.5925224, -2.331681, 0, 1, 0.5490196, 1,
-0.1662668, 0.4855103, 1.267274, 0, 1, 0.5568628, 1,
-0.1617303, -0.8259959, -2.97548, 0, 1, 0.5607843, 1,
-0.1593431, 1.388296, -1.201558, 0, 1, 0.5686275, 1,
-0.1587442, -0.7587373, -2.81779, 0, 1, 0.572549, 1,
-0.1512749, -0.4464233, -4.295452, 0, 1, 0.5803922, 1,
-0.1510625, -0.6132097, -3.730398, 0, 1, 0.5843138, 1,
-0.1472941, 0.1059343, -0.5958459, 0, 1, 0.5921569, 1,
-0.1348971, -0.09877551, -2.850693, 0, 1, 0.5960785, 1,
-0.131052, -1.223278, -2.576473, 0, 1, 0.6039216, 1,
-0.1301011, -1.788282, -4.084642, 0, 1, 0.6117647, 1,
-0.1299799, 2.14802, -1.262259, 0, 1, 0.6156863, 1,
-0.129163, -0.04266417, -2.126005, 0, 1, 0.6235294, 1,
-0.1248948, 0.925027, -0.242006, 0, 1, 0.627451, 1,
-0.123973, 1.622036, -2.747572, 0, 1, 0.6352941, 1,
-0.1217115, 0.7466589, -1.263032, 0, 1, 0.6392157, 1,
-0.1176986, 1.9186, 0.6611289, 0, 1, 0.6470588, 1,
-0.1161208, -1.379238, -3.56935, 0, 1, 0.6509804, 1,
-0.1157056, -0.7771407, -3.464485, 0, 1, 0.6588235, 1,
-0.1096799, 0.6594162, 1.262898, 0, 1, 0.6627451, 1,
-0.1093553, -0.5146346, -3.241785, 0, 1, 0.6705883, 1,
-0.1077114, 0.4627827, 0.5085296, 0, 1, 0.6745098, 1,
-0.1055336, -0.4415179, -3.443472, 0, 1, 0.682353, 1,
-0.1050617, -0.5880932, -1.357723, 0, 1, 0.6862745, 1,
-0.1042737, -0.3663344, -3.207497, 0, 1, 0.6941177, 1,
-0.1016315, -0.7809176, -2.527029, 0, 1, 0.7019608, 1,
-0.09623407, -1.461616, -3.163016, 0, 1, 0.7058824, 1,
-0.09452705, 1.992749, 0.02166783, 0, 1, 0.7137255, 1,
-0.09313798, -0.1820127, -3.155824, 0, 1, 0.7176471, 1,
-0.09078159, -1.588206, -3.138463, 0, 1, 0.7254902, 1,
-0.08816774, -0.4695428, -1.081628, 0, 1, 0.7294118, 1,
-0.082118, 0.07885948, -0.006842926, 0, 1, 0.7372549, 1,
-0.0814108, 0.251642, -1.367772, 0, 1, 0.7411765, 1,
-0.08120211, -2.415934, -2.254783, 0, 1, 0.7490196, 1,
-0.08069775, -0.1102828, -0.1123647, 0, 1, 0.7529412, 1,
-0.08041601, 0.1022046, 0.1362603, 0, 1, 0.7607843, 1,
-0.07901371, -0.8183322, -2.564586, 0, 1, 0.7647059, 1,
-0.07752511, 1.197605, -0.758184, 0, 1, 0.772549, 1,
-0.07232191, 0.01123794, -2.18638, 0, 1, 0.7764706, 1,
-0.07087291, 0.1454973, -0.7409737, 0, 1, 0.7843137, 1,
-0.06759973, -0.6017421, -3.328196, 0, 1, 0.7882353, 1,
-0.06741473, -0.4818825, -2.661049, 0, 1, 0.7960784, 1,
-0.06691562, 1.081885, 0.2870267, 0, 1, 0.8039216, 1,
-0.06426039, 0.6096801, -0.5845826, 0, 1, 0.8078431, 1,
-0.06391162, 1.040561, 2.648936, 0, 1, 0.8156863, 1,
-0.06238282, -0.5864038, -3.531955, 0, 1, 0.8196079, 1,
-0.05493316, 0.6178955, -0.3885808, 0, 1, 0.827451, 1,
-0.05443067, 0.8834468, 0.158671, 0, 1, 0.8313726, 1,
-0.05401561, -0.8563895, -2.692183, 0, 1, 0.8392157, 1,
-0.0475027, -1.439035, -3.287947, 0, 1, 0.8431373, 1,
-0.04415374, -1.300523, -4.8442, 0, 1, 0.8509804, 1,
-0.04411555, -0.5141591, -2.904513, 0, 1, 0.854902, 1,
-0.04383274, 0.4539512, -0.6532385, 0, 1, 0.8627451, 1,
-0.04263007, 0.1920445, 0.4729541, 0, 1, 0.8666667, 1,
-0.0403649, -0.2109386, -3.430218, 0, 1, 0.8745098, 1,
-0.03852083, 0.007519195, -1.93536, 0, 1, 0.8784314, 1,
-0.03783908, -0.8645237, -3.656689, 0, 1, 0.8862745, 1,
-0.03607731, -0.1184284, -3.802042, 0, 1, 0.8901961, 1,
-0.03339206, -0.5827156, -3.438928, 0, 1, 0.8980392, 1,
-0.03125045, 0.6699319, -1.814721, 0, 1, 0.9058824, 1,
-0.02458047, 0.4360362, 0.5112415, 0, 1, 0.9098039, 1,
-0.02249028, 0.1788469, 1.244509, 0, 1, 0.9176471, 1,
-0.01795264, 0.5203772, -0.8959435, 0, 1, 0.9215686, 1,
-0.01740407, -0.2195089, -4.249858, 0, 1, 0.9294118, 1,
-0.01633749, 0.4559182, -0.7128556, 0, 1, 0.9333333, 1,
-0.01550062, -0.4595064, -2.369018, 0, 1, 0.9411765, 1,
-0.01294381, 0.3451551, -0.5773528, 0, 1, 0.945098, 1,
-0.01244124, -1.212583, -2.282624, 0, 1, 0.9529412, 1,
-0.01091748, 0.2238319, -1.543227, 0, 1, 0.9568627, 1,
-0.008902336, -0.007180459, -0.3718558, 0, 1, 0.9647059, 1,
-0.008757995, 0.3256596, -1.515469, 0, 1, 0.9686275, 1,
-0.006521221, -1.743305, -2.882732, 0, 1, 0.9764706, 1,
-0.00617692, -0.1164436, -3.755124, 0, 1, 0.9803922, 1,
-0.006088039, 0.1360853, 2.838588, 0, 1, 0.9882353, 1,
-6.730952e-05, 1.541077, -0.8680503, 0, 1, 0.9921569, 1,
0.002223457, -0.350099, 3.637937, 0, 1, 1, 1,
0.002936732, 0.04158727, -1.862882, 0, 0.9921569, 1, 1,
0.003331173, 0.9508335, 0.4940699, 0, 0.9882353, 1, 1,
0.007821767, -0.7097893, 4.25741, 0, 0.9803922, 1, 1,
0.009045275, -0.9471946, 2.965739, 0, 0.9764706, 1, 1,
0.0184124, -0.4807135, 1.868533, 0, 0.9686275, 1, 1,
0.02103589, -0.9720186, 5.224958, 0, 0.9647059, 1, 1,
0.02237464, -2.828907, 3.387879, 0, 0.9568627, 1, 1,
0.0231967, -0.2716513, 3.245853, 0, 0.9529412, 1, 1,
0.03330909, 0.2483036, 0.03161516, 0, 0.945098, 1, 1,
0.03435279, 1.943807, 0.153014, 0, 0.9411765, 1, 1,
0.03597448, 0.1764237, -0.8168745, 0, 0.9333333, 1, 1,
0.03661555, -0.7070066, 1.456035, 0, 0.9294118, 1, 1,
0.03795914, -0.6346259, 2.751822, 0, 0.9215686, 1, 1,
0.04428312, -0.8972184, 3.811654, 0, 0.9176471, 1, 1,
0.04476055, -0.4160701, 2.268866, 0, 0.9098039, 1, 1,
0.04551509, -0.9996512, 3.268948, 0, 0.9058824, 1, 1,
0.04938341, 0.328457, 0.5326749, 0, 0.8980392, 1, 1,
0.05095278, 0.3311469, -0.6554408, 0, 0.8901961, 1, 1,
0.05329677, 2.023458, -2.604877, 0, 0.8862745, 1, 1,
0.05649264, 1.02272, -2.067508, 0, 0.8784314, 1, 1,
0.0566157, -0.2315276, 1.251045, 0, 0.8745098, 1, 1,
0.05990578, -0.9790476, 3.947424, 0, 0.8666667, 1, 1,
0.06812106, 0.178763, -1.111423, 0, 0.8627451, 1, 1,
0.0701314, 2.8249, 0.8612127, 0, 0.854902, 1, 1,
0.07117844, -0.5139837, 4.371839, 0, 0.8509804, 1, 1,
0.07550169, -0.3007869, 1.844049, 0, 0.8431373, 1, 1,
0.07786034, 0.1404319, 0.8386658, 0, 0.8392157, 1, 1,
0.07858074, -1.293722, 1.83971, 0, 0.8313726, 1, 1,
0.07867408, -0.7981694, 1.925457, 0, 0.827451, 1, 1,
0.08153486, -0.006580559, 1.344173, 0, 0.8196079, 1, 1,
0.08240933, -0.2947226, 3.039384, 0, 0.8156863, 1, 1,
0.08294048, -1.347279, 3.09798, 0, 0.8078431, 1, 1,
0.08464804, 0.8210611, 0.5541432, 0, 0.8039216, 1, 1,
0.08845338, 2.286634, 0.4753188, 0, 0.7960784, 1, 1,
0.08961029, 0.8820474, 0.5305277, 0, 0.7882353, 1, 1,
0.09317648, -0.1630049, 4.057956, 0, 0.7843137, 1, 1,
0.09715049, 1.422942, 0.5252613, 0, 0.7764706, 1, 1,
0.1008637, -0.05738601, 2.520995, 0, 0.772549, 1, 1,
0.1050225, -2.017334, 2.024801, 0, 0.7647059, 1, 1,
0.1113269, -1.805874, 1.985353, 0, 0.7607843, 1, 1,
0.1149261, 0.3617412, -0.7285845, 0, 0.7529412, 1, 1,
0.1180674, -0.2709493, 1.907933, 0, 0.7490196, 1, 1,
0.1193637, -0.8485383, 3.092449, 0, 0.7411765, 1, 1,
0.1240035, -0.3457971, 2.848699, 0, 0.7372549, 1, 1,
0.1263635, -0.5354522, 1.419247, 0, 0.7294118, 1, 1,
0.1265126, -0.2307165, 4.008818, 0, 0.7254902, 1, 1,
0.1265837, 0.234551, 1.210205, 0, 0.7176471, 1, 1,
0.1305175, 0.913969, -0.9978928, 0, 0.7137255, 1, 1,
0.1352399, -0.08370897, 1.193371, 0, 0.7058824, 1, 1,
0.136527, -0.1519122, 3.157956, 0, 0.6980392, 1, 1,
0.1375535, -1.969536, 3.284029, 0, 0.6941177, 1, 1,
0.1382451, -0.5788375, 2.41056, 0, 0.6862745, 1, 1,
0.1396225, -1.386228, 3.195501, 0, 0.682353, 1, 1,
0.1411497, -0.1384226, 2.270777, 0, 0.6745098, 1, 1,
0.149123, 0.9634564, 0.05015504, 0, 0.6705883, 1, 1,
0.1510005, -0.2816591, 2.971313, 0, 0.6627451, 1, 1,
0.1521983, -0.902434, 1.270686, 0, 0.6588235, 1, 1,
0.1575476, -0.6527463, 2.390417, 0, 0.6509804, 1, 1,
0.1580602, 0.2860675, 0.6155811, 0, 0.6470588, 1, 1,
0.1585845, 1.278847, -0.7254722, 0, 0.6392157, 1, 1,
0.1594965, 0.6756985, -0.3282758, 0, 0.6352941, 1, 1,
0.1695619, -0.9717621, 2.612262, 0, 0.627451, 1, 1,
0.1740237, 1.579461, 1.124484, 0, 0.6235294, 1, 1,
0.1750969, -0.5117282, 2.737334, 0, 0.6156863, 1, 1,
0.1774182, 0.0009097706, 2.320163, 0, 0.6117647, 1, 1,
0.177977, -1.874606, 2.812452, 0, 0.6039216, 1, 1,
0.1786549, -0.1185305, 2.015387, 0, 0.5960785, 1, 1,
0.1793334, -0.4013056, 1.977944, 0, 0.5921569, 1, 1,
0.1801175, 0.6015769, -0.1400128, 0, 0.5843138, 1, 1,
0.1802808, -0.5976813, 2.978139, 0, 0.5803922, 1, 1,
0.1871629, -0.9111204, 3.133201, 0, 0.572549, 1, 1,
0.1920715, 0.06572196, 2.602966, 0, 0.5686275, 1, 1,
0.1960809, -0.3827075, 3.181685, 0, 0.5607843, 1, 1,
0.1974229, -0.6827404, 1.408221, 0, 0.5568628, 1, 1,
0.1992424, 0.4605625, 0.1708558, 0, 0.5490196, 1, 1,
0.2043346, 0.4117552, -0.04266191, 0, 0.5450981, 1, 1,
0.2070652, -0.1306101, 3.212672, 0, 0.5372549, 1, 1,
0.2097923, -0.7286229, 1.663518, 0, 0.5333334, 1, 1,
0.2111889, -0.4390298, 3.340351, 0, 0.5254902, 1, 1,
0.2117075, 0.5581766, -0.4930704, 0, 0.5215687, 1, 1,
0.213269, 0.3866091, 1.265742, 0, 0.5137255, 1, 1,
0.2194946, -0.5046782, 2.449049, 0, 0.509804, 1, 1,
0.2202511, 1.283121, 0.8844445, 0, 0.5019608, 1, 1,
0.2205994, 1.49376, 1.777764, 0, 0.4941176, 1, 1,
0.2259739, 0.2630493, 0.8955186, 0, 0.4901961, 1, 1,
0.2262447, -0.4398097, 2.510811, 0, 0.4823529, 1, 1,
0.2321109, 1.147124, 0.2841413, 0, 0.4784314, 1, 1,
0.2362835, -0.2935788, 1.960214, 0, 0.4705882, 1, 1,
0.2417936, -0.1396426, 2.00084, 0, 0.4666667, 1, 1,
0.2444661, -1.097328, 3.389423, 0, 0.4588235, 1, 1,
0.2457222, 0.6902024, -0.1333564, 0, 0.454902, 1, 1,
0.2468632, -0.3935976, 0.5012287, 0, 0.4470588, 1, 1,
0.2470252, -1.156325, 1.781708, 0, 0.4431373, 1, 1,
0.2480282, 0.5155889, 0.01208411, 0, 0.4352941, 1, 1,
0.2483347, 1.220289, 0.216662, 0, 0.4313726, 1, 1,
0.2498781, -2.518804, 0.5462515, 0, 0.4235294, 1, 1,
0.2500485, -0.6783317, 2.037716, 0, 0.4196078, 1, 1,
0.2511301, 0.6271332, 1.518403, 0, 0.4117647, 1, 1,
0.2557905, -0.466129, 1.543952, 0, 0.4078431, 1, 1,
0.2577001, -0.2563932, 1.67439, 0, 0.4, 1, 1,
0.2620676, 0.7519376, -0.6437527, 0, 0.3921569, 1, 1,
0.2631354, -0.5703337, 1.996897, 0, 0.3882353, 1, 1,
0.2766419, 0.4392572, 1.92179, 0, 0.3803922, 1, 1,
0.2865027, -2.805534, 5.357067, 0, 0.3764706, 1, 1,
0.2920137, 1.568042, 0.4397991, 0, 0.3686275, 1, 1,
0.3028104, 0.6996414, -0.8927391, 0, 0.3647059, 1, 1,
0.3045664, 0.4521219, 0.5823631, 0, 0.3568628, 1, 1,
0.3058076, -1.253454, 2.542214, 0, 0.3529412, 1, 1,
0.306647, 0.7530697, -0.3166555, 0, 0.345098, 1, 1,
0.3068704, -0.697269, 1.643291, 0, 0.3411765, 1, 1,
0.3096499, -0.03187178, 1.187564, 0, 0.3333333, 1, 1,
0.3133245, -0.8966098, 4.928099, 0, 0.3294118, 1, 1,
0.3147108, 1.672124, 0.7941235, 0, 0.3215686, 1, 1,
0.315782, 1.53381, 0.2795574, 0, 0.3176471, 1, 1,
0.3158297, 0.4978003, -0.03055241, 0, 0.3098039, 1, 1,
0.3159392, -0.4159046, 2.23719, 0, 0.3058824, 1, 1,
0.3184074, -0.2493067, 3.385401, 0, 0.2980392, 1, 1,
0.3231289, 0.9325272, 1.102068, 0, 0.2901961, 1, 1,
0.325028, -1.478393, 4.649317, 0, 0.2862745, 1, 1,
0.3279035, 0.009626104, -0.7555799, 0, 0.2784314, 1, 1,
0.3283895, -0.2286799, 1.509896, 0, 0.2745098, 1, 1,
0.329478, -1.118899, 2.827304, 0, 0.2666667, 1, 1,
0.3338664, -0.4068454, 3.135482, 0, 0.2627451, 1, 1,
0.3357802, -0.6106085, 3.601952, 0, 0.254902, 1, 1,
0.3362194, 0.7374308, -2.136428, 0, 0.2509804, 1, 1,
0.3363948, -1.237891, 3.097934, 0, 0.2431373, 1, 1,
0.3368239, 0.3936296, 1.24467, 0, 0.2392157, 1, 1,
0.3368309, 0.1743273, 0.7724569, 0, 0.2313726, 1, 1,
0.3390903, -0.3880278, 2.173009, 0, 0.227451, 1, 1,
0.3446636, 1.516565, 0.07667869, 0, 0.2196078, 1, 1,
0.3479687, -1.121361, 4.630398, 0, 0.2156863, 1, 1,
0.3530755, 1.138946, -1.158162, 0, 0.2078431, 1, 1,
0.3537303, -0.8330573, 3.705787, 0, 0.2039216, 1, 1,
0.3560427, -1.279249, 3.350044, 0, 0.1960784, 1, 1,
0.3581893, -1.021525, 2.687202, 0, 0.1882353, 1, 1,
0.3586071, -0.6457254, 2.461244, 0, 0.1843137, 1, 1,
0.3642106, -0.7441258, 1.58628, 0, 0.1764706, 1, 1,
0.3653094, -0.2657242, 2.581865, 0, 0.172549, 1, 1,
0.3705511, 1.148121, 2.256196, 0, 0.1647059, 1, 1,
0.3778171, 0.4448013, 2.06094, 0, 0.1607843, 1, 1,
0.380175, -1.499686, 4.360091, 0, 0.1529412, 1, 1,
0.386311, 0.4250138, 0.2087925, 0, 0.1490196, 1, 1,
0.3902782, -0.3975645, 2.286756, 0, 0.1411765, 1, 1,
0.3978748, -0.1552579, 1.291147, 0, 0.1372549, 1, 1,
0.4028597, -0.9415957, 2.161885, 0, 0.1294118, 1, 1,
0.4095215, -0.5625464, 1.874991, 0, 0.1254902, 1, 1,
0.4095663, -0.6258196, 3.055192, 0, 0.1176471, 1, 1,
0.4129638, -1.427444, 3.480397, 0, 0.1137255, 1, 1,
0.4142406, -1.693937, 2.182989, 0, 0.1058824, 1, 1,
0.415689, 1.210919, -0.2716601, 0, 0.09803922, 1, 1,
0.4226767, 0.3904302, -0.4507905, 0, 0.09411765, 1, 1,
0.4248719, 0.3318668, 0.4708368, 0, 0.08627451, 1, 1,
0.4281485, -0.9130147, 3.380575, 0, 0.08235294, 1, 1,
0.4291317, -0.8553163, 2.792284, 0, 0.07450981, 1, 1,
0.4318653, 0.3228768, 3.042384, 0, 0.07058824, 1, 1,
0.4357901, 0.7356898, -0.7798428, 0, 0.0627451, 1, 1,
0.4358456, 0.4408151, 2.002963, 0, 0.05882353, 1, 1,
0.4361802, 0.211329, 2.9121, 0, 0.05098039, 1, 1,
0.4366312, 2.74858, 0.8625487, 0, 0.04705882, 1, 1,
0.4367557, 0.165995, 1.499679, 0, 0.03921569, 1, 1,
0.439604, 0.2059135, 1.399523, 0, 0.03529412, 1, 1,
0.4398772, 1.94326, 0.9679374, 0, 0.02745098, 1, 1,
0.4403929, -2.888031, 1.961435, 0, 0.02352941, 1, 1,
0.4440139, -0.02434812, 0.9597569, 0, 0.01568628, 1, 1,
0.4442356, -0.2325856, 2.286732, 0, 0.01176471, 1, 1,
0.4477043, -0.1483227, 0.1097543, 0, 0.003921569, 1, 1,
0.4478931, 0.8987371, 1.49266, 0.003921569, 0, 1, 1,
0.4481051, -1.339757, 1.839985, 0.007843138, 0, 1, 1,
0.4507295, 0.7479018, 1.605093, 0.01568628, 0, 1, 1,
0.4507605, 0.3825487, 1.505352, 0.01960784, 0, 1, 1,
0.4525599, -0.2352698, 2.309186, 0.02745098, 0, 1, 1,
0.4527709, 1.318547, 3.207302, 0.03137255, 0, 1, 1,
0.4536374, -1.491596, 3.135427, 0.03921569, 0, 1, 1,
0.4572189, -0.6433699, 0.7017968, 0.04313726, 0, 1, 1,
0.4618631, 1.212372, 0.35372, 0.05098039, 0, 1, 1,
0.4651763, 0.3521179, 0.8399469, 0.05490196, 0, 1, 1,
0.4667503, -0.2121823, 0.2445102, 0.0627451, 0, 1, 1,
0.4670641, 0.1016183, 0.727616, 0.06666667, 0, 1, 1,
0.474355, 0.7721888, 1.395744, 0.07450981, 0, 1, 1,
0.4781832, 0.457428, 1.936214, 0.07843138, 0, 1, 1,
0.4793701, 1.335786, 2.077766, 0.08627451, 0, 1, 1,
0.4801699, 1.082469, 1.109115, 0.09019608, 0, 1, 1,
0.4890139, 2.085636, -0.30963, 0.09803922, 0, 1, 1,
0.4894128, -0.7431789, 1.043056, 0.1058824, 0, 1, 1,
0.4900657, 0.31033, 2.674272, 0.1098039, 0, 1, 1,
0.4949878, 1.244909, -0.607398, 0.1176471, 0, 1, 1,
0.4959138, -0.07361856, 1.112384, 0.1215686, 0, 1, 1,
0.5039793, -0.9738898, 1.53517, 0.1294118, 0, 1, 1,
0.5044155, -0.6019036, 1.615853, 0.1333333, 0, 1, 1,
0.5045798, 2.151611, 0.7730993, 0.1411765, 0, 1, 1,
0.5093902, 0.1433194, 1.824959, 0.145098, 0, 1, 1,
0.5109524, 0.2368567, 1.424948, 0.1529412, 0, 1, 1,
0.5109966, 0.3549199, -0.7481012, 0.1568628, 0, 1, 1,
0.5128651, -1.155163, 2.467511, 0.1647059, 0, 1, 1,
0.5132942, 2.36235, 0.9821099, 0.1686275, 0, 1, 1,
0.5138338, -0.02972016, 3.277135, 0.1764706, 0, 1, 1,
0.5145856, -0.2555645, 2.509237, 0.1803922, 0, 1, 1,
0.5149888, 0.52021, 0.8765813, 0.1882353, 0, 1, 1,
0.515724, -0.2956392, 2.016811, 0.1921569, 0, 1, 1,
0.5162573, 0.6467541, 0.7298691, 0.2, 0, 1, 1,
0.5192765, 1.125251, 0.3899625, 0.2078431, 0, 1, 1,
0.5210892, -0.2506216, 1.832325, 0.2117647, 0, 1, 1,
0.5212141, -1.850944, 2.560928, 0.2196078, 0, 1, 1,
0.522588, 0.6455416, 0.2846827, 0.2235294, 0, 1, 1,
0.5227425, 0.6854379, 1.322401, 0.2313726, 0, 1, 1,
0.5244588, 0.05680671, 1.414377, 0.2352941, 0, 1, 1,
0.5245277, -0.6179928, 0.8771816, 0.2431373, 0, 1, 1,
0.5305665, -0.4561875, 1.869164, 0.2470588, 0, 1, 1,
0.5327969, 0.4048049, 1.817198, 0.254902, 0, 1, 1,
0.5423102, -0.1068161, 1.512867, 0.2588235, 0, 1, 1,
0.5428793, 1.60689, -0.6485075, 0.2666667, 0, 1, 1,
0.5474074, -0.2724353, 2.225997, 0.2705882, 0, 1, 1,
0.549804, 0.08260153, 1.367193, 0.2784314, 0, 1, 1,
0.5541121, -1.951866, 3.29649, 0.282353, 0, 1, 1,
0.5555924, 0.3121821, 0.4934198, 0.2901961, 0, 1, 1,
0.5601354, -0.2112239, 3.265448, 0.2941177, 0, 1, 1,
0.5670065, 1.465959, -0.8166915, 0.3019608, 0, 1, 1,
0.5692002, 2.00819, -0.3728656, 0.3098039, 0, 1, 1,
0.5716985, 0.07943191, 1.425003, 0.3137255, 0, 1, 1,
0.5762435, 0.3247862, -0.4959339, 0.3215686, 0, 1, 1,
0.5836049, 0.06727479, 0.6798133, 0.3254902, 0, 1, 1,
0.58512, -1.284701, 3.413753, 0.3333333, 0, 1, 1,
0.5894814, 1.001701, 0.5129836, 0.3372549, 0, 1, 1,
0.5923477, -0.9294745, 1.566621, 0.345098, 0, 1, 1,
0.5928126, -0.8329437, 3.603722, 0.3490196, 0, 1, 1,
0.5962574, -0.1114561, 1.685354, 0.3568628, 0, 1, 1,
0.5984312, 1.877406, 0.822944, 0.3607843, 0, 1, 1,
0.6014183, 0.497704, 1.539406, 0.3686275, 0, 1, 1,
0.6049863, 0.5136588, -0.240607, 0.372549, 0, 1, 1,
0.6109454, -0.8473774, 3.797198, 0.3803922, 0, 1, 1,
0.6119806, -1.196349, 2.503289, 0.3843137, 0, 1, 1,
0.6129083, -1.135754, 3.185909, 0.3921569, 0, 1, 1,
0.6163, -0.7817987, 3.482584, 0.3960784, 0, 1, 1,
0.6198744, -0.3364184, 2.306737, 0.4039216, 0, 1, 1,
0.6199892, -0.6612844, 2.892143, 0.4117647, 0, 1, 1,
0.6234837, 0.7105117, 0.4804252, 0.4156863, 0, 1, 1,
0.6255879, -0.0485737, 0.2451544, 0.4235294, 0, 1, 1,
0.6269129, -0.2277094, 1.736214, 0.427451, 0, 1, 1,
0.6304637, 0.9824907, 1.24806, 0.4352941, 0, 1, 1,
0.6501475, 1.123675, 1.289968, 0.4392157, 0, 1, 1,
0.6515288, -0.4768491, 2.596153, 0.4470588, 0, 1, 1,
0.6581708, 0.7526367, 0.1871895, 0.4509804, 0, 1, 1,
0.6588046, -0.3369327, 1.429979, 0.4588235, 0, 1, 1,
0.660894, -1.585371, 2.273833, 0.4627451, 0, 1, 1,
0.669999, 0.1303886, 1.199721, 0.4705882, 0, 1, 1,
0.6746591, -0.6798651, 0.9788425, 0.4745098, 0, 1, 1,
0.6753682, 0.2262102, 1.088547, 0.4823529, 0, 1, 1,
0.6791104, -0.5237405, 2.263792, 0.4862745, 0, 1, 1,
0.6794402, -0.8119202, 2.407148, 0.4941176, 0, 1, 1,
0.6866131, 1.987584, -0.2930395, 0.5019608, 0, 1, 1,
0.6928512, -2.508785, 3.004261, 0.5058824, 0, 1, 1,
0.6990632, 0.0681349, 1.362017, 0.5137255, 0, 1, 1,
0.699183, 0.5320098, 2.261275, 0.5176471, 0, 1, 1,
0.6992577, 0.1221129, 0.1118815, 0.5254902, 0, 1, 1,
0.7063153, 0.5199792, 1.043808, 0.5294118, 0, 1, 1,
0.7067144, 0.8740224, 2.055211, 0.5372549, 0, 1, 1,
0.7164824, 1.212042, 1.817209, 0.5411765, 0, 1, 1,
0.7224182, 1.622339, -0.8324183, 0.5490196, 0, 1, 1,
0.7228228, -0.495653, 2.307172, 0.5529412, 0, 1, 1,
0.7238619, -0.9274988, 2.835761, 0.5607843, 0, 1, 1,
0.7238787, -0.4970178, 0.8696598, 0.5647059, 0, 1, 1,
0.7246318, -0.02915858, -0.7306018, 0.572549, 0, 1, 1,
0.7290393, 0.7035624, -0.4323718, 0.5764706, 0, 1, 1,
0.7308038, 0.767116, 1.178941, 0.5843138, 0, 1, 1,
0.7341881, -0.673754, 2.578996, 0.5882353, 0, 1, 1,
0.7376197, -3.903097, 3.397366, 0.5960785, 0, 1, 1,
0.7391479, 0.7991089, 2.645062, 0.6039216, 0, 1, 1,
0.743383, 0.4764659, 1.392879, 0.6078432, 0, 1, 1,
0.7509561, 1.421796, 2.528558, 0.6156863, 0, 1, 1,
0.7529703, -0.8926118, 2.131586, 0.6196079, 0, 1, 1,
0.7547565, -2.741692, 3.361313, 0.627451, 0, 1, 1,
0.7560122, 0.08284963, 1.20656, 0.6313726, 0, 1, 1,
0.7566268, 1.460141, 0.3765362, 0.6392157, 0, 1, 1,
0.7601141, -1.346342, 3.119992, 0.6431373, 0, 1, 1,
0.7635281, 0.276489, 1.024603, 0.6509804, 0, 1, 1,
0.7639557, 2.214871, 1.670621, 0.654902, 0, 1, 1,
0.7702326, 0.7853549, 1.946367, 0.6627451, 0, 1, 1,
0.7702798, -2.826794, 2.523745, 0.6666667, 0, 1, 1,
0.77288, -2.270176, 3.714301, 0.6745098, 0, 1, 1,
0.7752517, 0.289083, 1.266616, 0.6784314, 0, 1, 1,
0.776937, 1.179731, 0.02527508, 0.6862745, 0, 1, 1,
0.7781728, 0.4294297, 0.4145247, 0.6901961, 0, 1, 1,
0.7908416, -0.3020425, 2.55653, 0.6980392, 0, 1, 1,
0.792232, -1.262382, 2.952839, 0.7058824, 0, 1, 1,
0.7993271, -2.225353, 2.912894, 0.7098039, 0, 1, 1,
0.7993979, 0.4566637, 0.1605849, 0.7176471, 0, 1, 1,
0.8000806, -1.236235, 2.277709, 0.7215686, 0, 1, 1,
0.8006186, 0.8045503, 2.070164, 0.7294118, 0, 1, 1,
0.8055275, 1.583008, 0.4247832, 0.7333333, 0, 1, 1,
0.8083207, 2.164906, -0.7694112, 0.7411765, 0, 1, 1,
0.8122365, -0.7905869, 3.015124, 0.7450981, 0, 1, 1,
0.8127986, 0.5982614, 0.2507142, 0.7529412, 0, 1, 1,
0.8181044, -0.7799814, 4.162543, 0.7568628, 0, 1, 1,
0.8236553, 0.6864561, 0.6930942, 0.7647059, 0, 1, 1,
0.8301905, -0.2682346, 0.8915833, 0.7686275, 0, 1, 1,
0.8350163, -1.136282, 3.146097, 0.7764706, 0, 1, 1,
0.8406587, -1.321823, 2.773324, 0.7803922, 0, 1, 1,
0.8414473, 1.018734, 0.5154452, 0.7882353, 0, 1, 1,
0.8453699, -0.3709372, 5.435123, 0.7921569, 0, 1, 1,
0.8457842, 0.6450843, 0.4073555, 0.8, 0, 1, 1,
0.8482497, 1.724527, -0.02811168, 0.8078431, 0, 1, 1,
0.8541558, -0.2120685, 3.584627, 0.8117647, 0, 1, 1,
0.8624981, -0.4858151, 2.058884, 0.8196079, 0, 1, 1,
0.866539, -2.48219, 2.302263, 0.8235294, 0, 1, 1,
0.8736444, -0.4753671, 3.026838, 0.8313726, 0, 1, 1,
0.8755502, 1.460502, 0.3613963, 0.8352941, 0, 1, 1,
0.8786443, -1.869821, 2.721726, 0.8431373, 0, 1, 1,
0.8801892, 0.831859, 0.9564404, 0.8470588, 0, 1, 1,
0.8819994, 0.1044322, 1.467681, 0.854902, 0, 1, 1,
0.882207, 0.6425452, 1.575345, 0.8588235, 0, 1, 1,
0.8915334, -0.8702845, 2.03906, 0.8666667, 0, 1, 1,
0.8926411, 0.01791443, 2.430058, 0.8705882, 0, 1, 1,
0.9009936, -0.6148368, 1.499274, 0.8784314, 0, 1, 1,
0.9058845, -0.4137354, 0.4654715, 0.8823529, 0, 1, 1,
0.9078199, -1.226975, 2.352676, 0.8901961, 0, 1, 1,
0.9152909, -0.8256088, 1.280027, 0.8941177, 0, 1, 1,
0.9167854, -1.375518, 3.422851, 0.9019608, 0, 1, 1,
0.928053, 1.116137, -1.605464, 0.9098039, 0, 1, 1,
0.9357088, 0.6707117, 1.205334, 0.9137255, 0, 1, 1,
0.9402148, -0.9208273, 2.038697, 0.9215686, 0, 1, 1,
0.9403994, -1.221929, 2.925657, 0.9254902, 0, 1, 1,
0.9412259, -0.6816143, 2.651948, 0.9333333, 0, 1, 1,
0.9419408, -0.3107817, 1.625145, 0.9372549, 0, 1, 1,
0.9695414, 0.2864693, 1.187252, 0.945098, 0, 1, 1,
0.971245, 0.07322761, 1.313577, 0.9490196, 0, 1, 1,
0.9772359, 1.562545, 1.420961, 0.9568627, 0, 1, 1,
0.9779548, -0.7283124, 3.390281, 0.9607843, 0, 1, 1,
0.9798341, 1.107543, 3.007007, 0.9686275, 0, 1, 1,
0.9812371, 2.101027, 0.04645516, 0.972549, 0, 1, 1,
0.9814209, -0.2376852, 2.05568, 0.9803922, 0, 1, 1,
0.9875481, 0.08592681, 1.098848, 0.9843137, 0, 1, 1,
0.9886964, -0.04331287, 1.98001, 0.9921569, 0, 1, 1,
0.9888226, -0.200927, 1.611644, 0.9960784, 0, 1, 1,
0.9925069, -1.376291, 0.8029123, 1, 0, 0.9960784, 1,
0.9931873, -0.2699684, -0.2661642, 1, 0, 0.9882353, 1,
0.9957091, -0.01370266, 1.847095, 1, 0, 0.9843137, 1,
1.005672, -1.809464, 2.765023, 1, 0, 0.9764706, 1,
1.006024, 0.2256177, 2.099188, 1, 0, 0.972549, 1,
1.009149, 1.349986, -0.2851427, 1, 0, 0.9647059, 1,
1.0103, -0.02326852, 0.5567723, 1, 0, 0.9607843, 1,
1.01869, -0.2072571, 1.589093, 1, 0, 0.9529412, 1,
1.027843, 0.06153362, 1.776334, 1, 0, 0.9490196, 1,
1.029624, 0.9752263, 0.5218499, 1, 0, 0.9411765, 1,
1.030957, 0.2698558, 2.285986, 1, 0, 0.9372549, 1,
1.035212, -1.157924, 2.635562, 1, 0, 0.9294118, 1,
1.04364, 0.4817601, 0.3492473, 1, 0, 0.9254902, 1,
1.049688, 1.555215, 0.4963968, 1, 0, 0.9176471, 1,
1.053005, 0.6084077, 1.059587, 1, 0, 0.9137255, 1,
1.057596, -0.3451976, 2.961167, 1, 0, 0.9058824, 1,
1.059736, 1.718885, 0.8282604, 1, 0, 0.9019608, 1,
1.063641, -1.265806, 1.738584, 1, 0, 0.8941177, 1,
1.068456, 0.06378347, 1.411713, 1, 0, 0.8862745, 1,
1.070032, 0.1764476, 0.6710565, 1, 0, 0.8823529, 1,
1.070365, 2.56611, 2.202241, 1, 0, 0.8745098, 1,
1.071418, 1.604163, 0.2761991, 1, 0, 0.8705882, 1,
1.074937, -0.3413144, 2.345649, 1, 0, 0.8627451, 1,
1.077748, 0.1985587, 2.778447, 1, 0, 0.8588235, 1,
1.083221, -1.206689, 1.795694, 1, 0, 0.8509804, 1,
1.083988, 1.129593, 2.507549, 1, 0, 0.8470588, 1,
1.084779, -0.4947559, 1.497972, 1, 0, 0.8392157, 1,
1.087022, 0.5940101, 1.815479, 1, 0, 0.8352941, 1,
1.112324, 0.3787045, 1.822971, 1, 0, 0.827451, 1,
1.113915, -0.8158898, 0.07827253, 1, 0, 0.8235294, 1,
1.118344, 0.2277883, -0.477767, 1, 0, 0.8156863, 1,
1.120826, 1.002347, 0.1660677, 1, 0, 0.8117647, 1,
1.123399, -1.591749, 1.975043, 1, 0, 0.8039216, 1,
1.123718, 0.3615945, 0.8695772, 1, 0, 0.7960784, 1,
1.12548, 1.012144, 0.5953198, 1, 0, 0.7921569, 1,
1.128351, -0.9629911, 1.888905, 1, 0, 0.7843137, 1,
1.128922, -0.4773104, 1.708322, 1, 0, 0.7803922, 1,
1.130729, -0.7506387, 1.532335, 1, 0, 0.772549, 1,
1.134774, -0.7489798, 2.947067, 1, 0, 0.7686275, 1,
1.134852, -0.4449955, 2.094995, 1, 0, 0.7607843, 1,
1.137767, -0.3857553, 1.91514, 1, 0, 0.7568628, 1,
1.14447, -1.374538, 3.075653, 1, 0, 0.7490196, 1,
1.14577, 0.8798798, 0.2418316, 1, 0, 0.7450981, 1,
1.146791, -1.419699, 2.266987, 1, 0, 0.7372549, 1,
1.156412, 0.4630027, 1.255595, 1, 0, 0.7333333, 1,
1.162814, -1.577639, 2.654538, 1, 0, 0.7254902, 1,
1.167749, -0.2565525, 2.492007, 1, 0, 0.7215686, 1,
1.168807, -0.5204876, 2.622486, 1, 0, 0.7137255, 1,
1.175376, 1.209611, 0.8239734, 1, 0, 0.7098039, 1,
1.177263, 0.8403224, 1.705271, 1, 0, 0.7019608, 1,
1.188404, -0.6202069, 3.620175, 1, 0, 0.6941177, 1,
1.21294, 0.5310331, 0.05180452, 1, 0, 0.6901961, 1,
1.213165, 0.6209091, 0.1088032, 1, 0, 0.682353, 1,
1.214271, -0.3486654, 2.699222, 1, 0, 0.6784314, 1,
1.224894, -0.8247302, 1.278729, 1, 0, 0.6705883, 1,
1.235226, -1.514422, 3.887529, 1, 0, 0.6666667, 1,
1.237614, -1.803339, 2.986498, 1, 0, 0.6588235, 1,
1.23807, 1.751198, 0.4056318, 1, 0, 0.654902, 1,
1.238897, -2.565417, 3.960979, 1, 0, 0.6470588, 1,
1.240908, 0.4800349, 2.27803, 1, 0, 0.6431373, 1,
1.248375, -1.054273, 0.8678119, 1, 0, 0.6352941, 1,
1.248445, 1.02788, -0.3353802, 1, 0, 0.6313726, 1,
1.248899, -1.814361, 2.547253, 1, 0, 0.6235294, 1,
1.254884, -1.041072, 3.145379, 1, 0, 0.6196079, 1,
1.259547, 1.867522, -0.118389, 1, 0, 0.6117647, 1,
1.27036, 0.4140721, 0.5686006, 1, 0, 0.6078432, 1,
1.272251, 1.205845, 0.3313911, 1, 0, 0.6, 1,
1.28472, 0.9036583, 0.1279074, 1, 0, 0.5921569, 1,
1.289787, 0.5825904, 1.392626, 1, 0, 0.5882353, 1,
1.294309, -0.2813016, 2.295467, 1, 0, 0.5803922, 1,
1.296519, 0.4748769, 2.777109, 1, 0, 0.5764706, 1,
1.300697, -0.3213229, 2.636895, 1, 0, 0.5686275, 1,
1.307646, -0.05924255, 1.965284, 1, 0, 0.5647059, 1,
1.316052, -1.686738, 3.540235, 1, 0, 0.5568628, 1,
1.320509, 0.8763529, 0.05349489, 1, 0, 0.5529412, 1,
1.32309, 0.4171117, 1.729236, 1, 0, 0.5450981, 1,
1.328068, -1.058407, 2.990091, 1, 0, 0.5411765, 1,
1.350748, 0.6048092, -0.03576479, 1, 0, 0.5333334, 1,
1.359303, 0.7208031, 1.169773, 1, 0, 0.5294118, 1,
1.371122, 0.7477946, 1.224244, 1, 0, 0.5215687, 1,
1.37628, 0.9178327, 1.666027, 1, 0, 0.5176471, 1,
1.380706, -1.183277, 2.032751, 1, 0, 0.509804, 1,
1.382917, 2.037096, -0.1034832, 1, 0, 0.5058824, 1,
1.388705, 1.035268, 1.120897, 1, 0, 0.4980392, 1,
1.392789, -0.6181818, 1.544683, 1, 0, 0.4901961, 1,
1.396766, -0.6604571, 1.613569, 1, 0, 0.4862745, 1,
1.401302, -1.042865, 1.34251, 1, 0, 0.4784314, 1,
1.407036, -2.196919, 2.589752, 1, 0, 0.4745098, 1,
1.421644, 1.182907, 1.23664, 1, 0, 0.4666667, 1,
1.423978, -0.2647798, 2.296676, 1, 0, 0.4627451, 1,
1.43781, 0.2720648, 1.187188, 1, 0, 0.454902, 1,
1.439267, 0.628786, 2.054532, 1, 0, 0.4509804, 1,
1.440539, -2.0704, 3.975242, 1, 0, 0.4431373, 1,
1.440565, -0.2993711, 1.926391, 1, 0, 0.4392157, 1,
1.451941, 0.8008159, 0.3787692, 1, 0, 0.4313726, 1,
1.453285, 1.043851, 1.137541, 1, 0, 0.427451, 1,
1.461775, 0.8230944, 2.843595, 1, 0, 0.4196078, 1,
1.46429, 0.625828, 0.2272665, 1, 0, 0.4156863, 1,
1.468363, 0.0578432, 0.8911367, 1, 0, 0.4078431, 1,
1.474199, -0.1128486, -0.2900045, 1, 0, 0.4039216, 1,
1.484235, -0.6181715, 0.9675395, 1, 0, 0.3960784, 1,
1.498109, -0.8147915, 4.858535, 1, 0, 0.3882353, 1,
1.499421, 0.7280495, 2.158263, 1, 0, 0.3843137, 1,
1.502046, 0.2230378, 3.133239, 1, 0, 0.3764706, 1,
1.51735, 0.7144856, 2.306611, 1, 0, 0.372549, 1,
1.521154, 1.471902, 0.9029379, 1, 0, 0.3647059, 1,
1.529538, -0.1643275, 2.657039, 1, 0, 0.3607843, 1,
1.532676, -0.4419131, 4.024179, 1, 0, 0.3529412, 1,
1.538862, -1.139285, 3.094398, 1, 0, 0.3490196, 1,
1.555076, -0.8207338, 2.381065, 1, 0, 0.3411765, 1,
1.555114, -0.6827626, 1.260484, 1, 0, 0.3372549, 1,
1.55712, 1.654301, 0.2311724, 1, 0, 0.3294118, 1,
1.568886, 0.3911858, 0.6691369, 1, 0, 0.3254902, 1,
1.610214, 0.362518, 0.5737383, 1, 0, 0.3176471, 1,
1.62064, 0.4297165, 0.3144964, 1, 0, 0.3137255, 1,
1.650964, -0.792011, 0.8013105, 1, 0, 0.3058824, 1,
1.679868, 1.045368, 0.5031796, 1, 0, 0.2980392, 1,
1.686603, -2.118731, 1.084267, 1, 0, 0.2941177, 1,
1.687073, -0.2369941, 1.816123, 1, 0, 0.2862745, 1,
1.709564, 0.9638385, 1.454536, 1, 0, 0.282353, 1,
1.715209, 0.239728, 1.400096, 1, 0, 0.2745098, 1,
1.726114, -1.269673, 2.938073, 1, 0, 0.2705882, 1,
1.736014, 0.2788401, 2.637484, 1, 0, 0.2627451, 1,
1.762699, 0.3483165, 2.928421, 1, 0, 0.2588235, 1,
1.772962, -2.419194, 2.318225, 1, 0, 0.2509804, 1,
1.781751, -0.6953717, 2.833546, 1, 0, 0.2470588, 1,
1.783386, -0.668872, 0.5303279, 1, 0, 0.2392157, 1,
1.796225, -0.8223549, 1.879842, 1, 0, 0.2352941, 1,
1.797596, -0.3562081, 2.924796, 1, 0, 0.227451, 1,
1.809035, -1.850613, 1.245746, 1, 0, 0.2235294, 1,
1.822968, 0.1194138, 1.362141, 1, 0, 0.2156863, 1,
1.875363, -1.218408, 0.6064315, 1, 0, 0.2117647, 1,
1.882307, 1.594087, 1.223968, 1, 0, 0.2039216, 1,
1.900961, -1.790471, 1.897949, 1, 0, 0.1960784, 1,
1.905547, 0.4252174, 0.8081822, 1, 0, 0.1921569, 1,
1.914572, 1.149472, 2.166711, 1, 0, 0.1843137, 1,
1.967608, -0.4837622, 2.646651, 1, 0, 0.1803922, 1,
1.996047, 0.6078361, 1.084579, 1, 0, 0.172549, 1,
1.996504, -0.2129398, 2.989853, 1, 0, 0.1686275, 1,
2.012227, 0.2668905, 2.316325, 1, 0, 0.1607843, 1,
2.024108, 0.4489164, -0.4635414, 1, 0, 0.1568628, 1,
2.03076, -0.6305864, 1.29337, 1, 0, 0.1490196, 1,
2.038252, 1.260982, 0.8459083, 1, 0, 0.145098, 1,
2.058521, -1.056879, 1.322156, 1, 0, 0.1372549, 1,
2.067431, 0.821657, 0.7186301, 1, 0, 0.1333333, 1,
2.090203, -0.2290146, 1.386406, 1, 0, 0.1254902, 1,
2.10002, 0.9739969, 1.203213, 1, 0, 0.1215686, 1,
2.10122, 1.490163, 0.480776, 1, 0, 0.1137255, 1,
2.120873, 0.4558512, -1.440133, 1, 0, 0.1098039, 1,
2.138189, 1.397, 1.529635, 1, 0, 0.1019608, 1,
2.15544, 2.588495, 0.6936108, 1, 0, 0.09411765, 1,
2.191877, 0.5345311, 0.08949941, 1, 0, 0.09019608, 1,
2.200733, -0.1413361, 0.9960526, 1, 0, 0.08235294, 1,
2.220786, -0.3808664, 2.049893, 1, 0, 0.07843138, 1,
2.229546, -0.8601251, 1.621742, 1, 0, 0.07058824, 1,
2.267778, 0.9915535, 0.7918879, 1, 0, 0.06666667, 1,
2.289426, 0.4941217, 2.027669, 1, 0, 0.05882353, 1,
2.307067, -1.265619, 2.522017, 1, 0, 0.05490196, 1,
2.310562, 0.5382457, -0.223505, 1, 0, 0.04705882, 1,
2.35826, 0.08091211, 1.157506, 1, 0, 0.04313726, 1,
2.442208, 0.02550788, 1.766917, 1, 0, 0.03529412, 1,
2.5038, -0.2601217, 2.769202, 1, 0, 0.03137255, 1,
2.525167, -0.01901121, 1.550428, 1, 0, 0.02352941, 1,
2.552921, 0.8587813, 0.03608819, 1, 0, 0.01960784, 1,
2.634102, -0.9144352, 1.705753, 1, 0, 0.01176471, 1,
3.133166, 0.3816445, 0.08452028, 1, 0, 0.007843138, 1
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
0.1291387, -5.119966, -6.586545, 0, -0.5, 0.5, 0.5,
0.1291387, -5.119966, -6.586545, 1, -0.5, 0.5, 0.5,
0.1291387, -5.119966, -6.586545, 1, 1.5, 0.5, 0.5,
0.1291387, -5.119966, -6.586545, 0, 1.5, 0.5, 0.5
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
-3.893254, -0.3135115, -6.586545, 0, -0.5, 0.5, 0.5,
-3.893254, -0.3135115, -6.586545, 1, -0.5, 0.5, 0.5,
-3.893254, -0.3135115, -6.586545, 1, 1.5, 0.5, 0.5,
-3.893254, -0.3135115, -6.586545, 0, 1.5, 0.5, 0.5
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
-3.893254, -5.119966, 0.2954619, 0, -0.5, 0.5, 0.5,
-3.893254, -5.119966, 0.2954619, 1, -0.5, 0.5, 0.5,
-3.893254, -5.119966, 0.2954619, 1, 1.5, 0.5, 0.5,
-3.893254, -5.119966, 0.2954619, 0, 1.5, 0.5, 0.5
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
-2, -4.010784, -4.99839,
3, -4.010784, -4.99839,
-2, -4.010784, -4.99839,
-2, -4.195648, -5.263082,
-1, -4.010784, -4.99839,
-1, -4.195648, -5.263082,
0, -4.010784, -4.99839,
0, -4.195648, -5.263082,
1, -4.010784, -4.99839,
1, -4.195648, -5.263082,
2, -4.010784, -4.99839,
2, -4.195648, -5.263082,
3, -4.010784, -4.99839,
3, -4.195648, -5.263082
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
-2, -4.565375, -5.792467, 0, -0.5, 0.5, 0.5,
-2, -4.565375, -5.792467, 1, -0.5, 0.5, 0.5,
-2, -4.565375, -5.792467, 1, 1.5, 0.5, 0.5,
-2, -4.565375, -5.792467, 0, 1.5, 0.5, 0.5,
-1, -4.565375, -5.792467, 0, -0.5, 0.5, 0.5,
-1, -4.565375, -5.792467, 1, -0.5, 0.5, 0.5,
-1, -4.565375, -5.792467, 1, 1.5, 0.5, 0.5,
-1, -4.565375, -5.792467, 0, 1.5, 0.5, 0.5,
0, -4.565375, -5.792467, 0, -0.5, 0.5, 0.5,
0, -4.565375, -5.792467, 1, -0.5, 0.5, 0.5,
0, -4.565375, -5.792467, 1, 1.5, 0.5, 0.5,
0, -4.565375, -5.792467, 0, 1.5, 0.5, 0.5,
1, -4.565375, -5.792467, 0, -0.5, 0.5, 0.5,
1, -4.565375, -5.792467, 1, -0.5, 0.5, 0.5,
1, -4.565375, -5.792467, 1, 1.5, 0.5, 0.5,
1, -4.565375, -5.792467, 0, 1.5, 0.5, 0.5,
2, -4.565375, -5.792467, 0, -0.5, 0.5, 0.5,
2, -4.565375, -5.792467, 1, -0.5, 0.5, 0.5,
2, -4.565375, -5.792467, 1, 1.5, 0.5, 0.5,
2, -4.565375, -5.792467, 0, 1.5, 0.5, 0.5,
3, -4.565375, -5.792467, 0, -0.5, 0.5, 0.5,
3, -4.565375, -5.792467, 1, -0.5, 0.5, 0.5,
3, -4.565375, -5.792467, 1, 1.5, 0.5, 0.5,
3, -4.565375, -5.792467, 0, 1.5, 0.5, 0.5
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
-2.965009, -2, -4.99839,
-2.965009, 2, -4.99839,
-2.965009, -2, -4.99839,
-3.119717, -2, -5.263082,
-2.965009, 0, -4.99839,
-3.119717, 0, -5.263082,
-2.965009, 2, -4.99839,
-3.119717, 2, -5.263082
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
"-2",
"0",
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
-3.429132, -2, -5.792467, 0, -0.5, 0.5, 0.5,
-3.429132, -2, -5.792467, 1, -0.5, 0.5, 0.5,
-3.429132, -2, -5.792467, 1, 1.5, 0.5, 0.5,
-3.429132, -2, -5.792467, 0, 1.5, 0.5, 0.5,
-3.429132, 0, -5.792467, 0, -0.5, 0.5, 0.5,
-3.429132, 0, -5.792467, 1, -0.5, 0.5, 0.5,
-3.429132, 0, -5.792467, 1, 1.5, 0.5, 0.5,
-3.429132, 0, -5.792467, 0, 1.5, 0.5, 0.5,
-3.429132, 2, -5.792467, 0, -0.5, 0.5, 0.5,
-3.429132, 2, -5.792467, 1, -0.5, 0.5, 0.5,
-3.429132, 2, -5.792467, 1, 1.5, 0.5, 0.5,
-3.429132, 2, -5.792467, 0, 1.5, 0.5, 0.5
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
-2.965009, -4.010784, -4,
-2.965009, -4.010784, 4,
-2.965009, -4.010784, -4,
-3.119717, -4.195648, -4,
-2.965009, -4.010784, -2,
-3.119717, -4.195648, -2,
-2.965009, -4.010784, 0,
-3.119717, -4.195648, 0,
-2.965009, -4.010784, 2,
-3.119717, -4.195648, 2,
-2.965009, -4.010784, 4,
-3.119717, -4.195648, 4
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
-3.429132, -4.565375, -4, 0, -0.5, 0.5, 0.5,
-3.429132, -4.565375, -4, 1, -0.5, 0.5, 0.5,
-3.429132, -4.565375, -4, 1, 1.5, 0.5, 0.5,
-3.429132, -4.565375, -4, 0, 1.5, 0.5, 0.5,
-3.429132, -4.565375, -2, 0, -0.5, 0.5, 0.5,
-3.429132, -4.565375, -2, 1, -0.5, 0.5, 0.5,
-3.429132, -4.565375, -2, 1, 1.5, 0.5, 0.5,
-3.429132, -4.565375, -2, 0, 1.5, 0.5, 0.5,
-3.429132, -4.565375, 0, 0, -0.5, 0.5, 0.5,
-3.429132, -4.565375, 0, 1, -0.5, 0.5, 0.5,
-3.429132, -4.565375, 0, 1, 1.5, 0.5, 0.5,
-3.429132, -4.565375, 0, 0, 1.5, 0.5, 0.5,
-3.429132, -4.565375, 2, 0, -0.5, 0.5, 0.5,
-3.429132, -4.565375, 2, 1, -0.5, 0.5, 0.5,
-3.429132, -4.565375, 2, 1, 1.5, 0.5, 0.5,
-3.429132, -4.565375, 2, 0, 1.5, 0.5, 0.5,
-3.429132, -4.565375, 4, 0, -0.5, 0.5, 0.5,
-3.429132, -4.565375, 4, 1, -0.5, 0.5, 0.5,
-3.429132, -4.565375, 4, 1, 1.5, 0.5, 0.5,
-3.429132, -4.565375, 4, 0, 1.5, 0.5, 0.5
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
-2.965009, -4.010784, -4.99839,
-2.965009, 3.383761, -4.99839,
-2.965009, -4.010784, 5.589314,
-2.965009, 3.383761, 5.589314,
-2.965009, -4.010784, -4.99839,
-2.965009, -4.010784, 5.589314,
-2.965009, 3.383761, -4.99839,
-2.965009, 3.383761, 5.589314,
-2.965009, -4.010784, -4.99839,
3.223287, -4.010784, -4.99839,
-2.965009, -4.010784, 5.589314,
3.223287, -4.010784, 5.589314,
-2.965009, 3.383761, -4.99839,
3.223287, 3.383761, -4.99839,
-2.965009, 3.383761, 5.589314,
3.223287, 3.383761, 5.589314,
3.223287, -4.010784, -4.99839,
3.223287, 3.383761, -4.99839,
3.223287, -4.010784, 5.589314,
3.223287, 3.383761, 5.589314,
3.223287, -4.010784, -4.99839,
3.223287, -4.010784, 5.589314,
3.223287, 3.383761, -4.99839,
3.223287, 3.383761, 5.589314
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
var radius = 7.646814;
var distance = 34.02154;
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
mvMatrix.translate( -0.1291387, 0.3135115, -0.2954619 );
mvMatrix.scale( 1.336052, 1.118106, 0.7808951 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.02154);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
manganese_dimethyldi<-read.table("manganese_dimethyldi.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-manganese_dimethyldi$V2
```

```
## Error in eval(expr, envir, enclos): object 'manganese_dimethyldi' not found
```

```r
y<-manganese_dimethyldi$V3
```

```
## Error in eval(expr, envir, enclos): object 'manganese_dimethyldi' not found
```

```r
z<-manganese_dimethyldi$V4
```

```
## Error in eval(expr, envir, enclos): object 'manganese_dimethyldi' not found
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
-2.874889, 0.215874, -0.1752746, 0, 0, 1, 1, 1,
-2.85361, -0.6752611, -1.837558, 1, 0, 0, 1, 1,
-2.793052, -0.6505856, -1.91228, 1, 0, 0, 1, 1,
-2.748691, -0.0457847, -1.51558, 1, 0, 0, 1, 1,
-2.633397, 1.865919, -0.007290202, 1, 0, 0, 1, 1,
-2.574216, -0.1803703, -2.147652, 1, 0, 0, 1, 1,
-2.541515, -0.1183449, -0.9831102, 0, 0, 0, 1, 1,
-2.526989, -0.08807699, -1.116522, 0, 0, 0, 1, 1,
-2.459171, 0.5263863, -3.288352, 0, 0, 0, 1, 1,
-2.410355, 0.8889138, -2.38668, 0, 0, 0, 1, 1,
-2.403837, -0.6460019, -2.161196, 0, 0, 0, 1, 1,
-2.382413, -1.196177, -3.238473, 0, 0, 0, 1, 1,
-2.342955, -1.574871, -1.88869, 0, 0, 0, 1, 1,
-2.220788, 0.1406227, -1.097258, 1, 1, 1, 1, 1,
-2.193912, 0.3454668, -3.294844, 1, 1, 1, 1, 1,
-2.174083, 0.8754989, -0.4158696, 1, 1, 1, 1, 1,
-2.160698, -0.4523182, -1.96523, 1, 1, 1, 1, 1,
-2.122384, -1.366966, -2.009921, 1, 1, 1, 1, 1,
-2.092635, 0.3550745, -1.63614, 1, 1, 1, 1, 1,
-2.072682, 0.8139277, -1.203515, 1, 1, 1, 1, 1,
-2.067732, 0.171777, -1.783721, 1, 1, 1, 1, 1,
-2.037885, 0.2834434, -1.954436, 1, 1, 1, 1, 1,
-1.972223, 0.5157747, -2.623205, 1, 1, 1, 1, 1,
-1.967141, -0.6344091, -2.03921, 1, 1, 1, 1, 1,
-1.965313, 0.2042837, -2.92839, 1, 1, 1, 1, 1,
-1.937088, 0.6162736, -0.6250231, 1, 1, 1, 1, 1,
-1.890478, 2.03461, 0.4046133, 1, 1, 1, 1, 1,
-1.843732, 1.037476, -1.244269, 1, 1, 1, 1, 1,
-1.843607, 0.3135614, 0.02918255, 0, 0, 1, 1, 1,
-1.842588, 1.492843, -1.298151, 1, 0, 0, 1, 1,
-1.823687, -1.163457, -0.8612027, 1, 0, 0, 1, 1,
-1.816494, -1.293451, -0.7909061, 1, 0, 0, 1, 1,
-1.804612, -0.5133948, -0.6203993, 1, 0, 0, 1, 1,
-1.766895, -0.2059133, -1.907646, 1, 0, 0, 1, 1,
-1.748968, 0.255929, -1.781559, 0, 0, 0, 1, 1,
-1.706393, -0.04298989, -3.041322, 0, 0, 0, 1, 1,
-1.705973, 1.441255, -1.114311, 0, 0, 0, 1, 1,
-1.693511, -2.547845, -1.283134, 0, 0, 0, 1, 1,
-1.691446, 0.1816719, -2.367091, 0, 0, 0, 1, 1,
-1.680279, 0.1666748, -0.01008725, 0, 0, 0, 1, 1,
-1.662068, -0.8214818, -0.3737064, 0, 0, 0, 1, 1,
-1.65519, -1.823794, -2.667544, 1, 1, 1, 1, 1,
-1.652643, 1.950695, -0.6335507, 1, 1, 1, 1, 1,
-1.642272, 0.3646948, -1.558321, 1, 1, 1, 1, 1,
-1.640443, 0.5928679, -2.530985, 1, 1, 1, 1, 1,
-1.638103, -1.006195, -2.150754, 1, 1, 1, 1, 1,
-1.637287, -0.4423423, -3.601553, 1, 1, 1, 1, 1,
-1.632062, 2.471944, -0.1915784, 1, 1, 1, 1, 1,
-1.623244, -1.122855, -2.399047, 1, 1, 1, 1, 1,
-1.62085, -1.481735, -2.168133, 1, 1, 1, 1, 1,
-1.58757, -0.8057616, -1.578713, 1, 1, 1, 1, 1,
-1.580523, 0.5818507, -1.506092, 1, 1, 1, 1, 1,
-1.555753, -0.2938092, -1.682154, 1, 1, 1, 1, 1,
-1.554131, -2.269825, -4.081167, 1, 1, 1, 1, 1,
-1.536533, 0.8042583, 0.1880389, 1, 1, 1, 1, 1,
-1.531913, 0.9009991, -0.4163135, 1, 1, 1, 1, 1,
-1.528473, 0.7407788, 0.3654879, 0, 0, 1, 1, 1,
-1.518612, 0.9887518, -1.60678, 1, 0, 0, 1, 1,
-1.488661, -0.8893936, -2.112653, 1, 0, 0, 1, 1,
-1.487552, -0.1783517, -1.526976, 1, 0, 0, 1, 1,
-1.487295, -0.6362071, -3.427416, 1, 0, 0, 1, 1,
-1.476391, -1.339114, -1.778619, 1, 0, 0, 1, 1,
-1.474437, -0.6466053, -2.115469, 0, 0, 0, 1, 1,
-1.461106, -0.1677772, -2.632617, 0, 0, 0, 1, 1,
-1.451411, -1.119162, -2.309413, 0, 0, 0, 1, 1,
-1.447455, -0.1111166, 0.4173688, 0, 0, 0, 1, 1,
-1.445268, -0.6116749, -2.428983, 0, 0, 0, 1, 1,
-1.444012, 0.3076629, -1.903792, 0, 0, 0, 1, 1,
-1.437535, 0.6607117, -2.898382, 0, 0, 0, 1, 1,
-1.424316, -0.2168027, -1.657278, 1, 1, 1, 1, 1,
-1.424237, -0.4132425, -1.697793, 1, 1, 1, 1, 1,
-1.412583, 0.8318236, -1.236088, 1, 1, 1, 1, 1,
-1.412379, 1.245715, -0.6047537, 1, 1, 1, 1, 1,
-1.40496, 0.8306106, -0.5105764, 1, 1, 1, 1, 1,
-1.399041, -0.7737303, -2.688019, 1, 1, 1, 1, 1,
-1.395899, -0.5842097, -1.764546, 1, 1, 1, 1, 1,
-1.381581, 1.677722, -1.651425, 1, 1, 1, 1, 1,
-1.372703, -1.695696, -0.5801886, 1, 1, 1, 1, 1,
-1.367585, -0.5016822, -3.759967, 1, 1, 1, 1, 1,
-1.343776, -0.2195525, -1.718836, 1, 1, 1, 1, 1,
-1.341601, -0.5533324, -1.923585, 1, 1, 1, 1, 1,
-1.340842, -0.4428966, -1.236155, 1, 1, 1, 1, 1,
-1.337384, -0.2418635, -2.536985, 1, 1, 1, 1, 1,
-1.336365, -0.4146276, -2.748074, 1, 1, 1, 1, 1,
-1.317778, 0.08632977, -1.229663, 0, 0, 1, 1, 1,
-1.313778, -0.3985032, -3.034961, 1, 0, 0, 1, 1,
-1.310654, 0.9083331, -0.782874, 1, 0, 0, 1, 1,
-1.302572, -0.3450579, -1.627349, 1, 0, 0, 1, 1,
-1.287515, 1.222098, -0.02941463, 1, 0, 0, 1, 1,
-1.287498, -0.8406633, -1.712377, 1, 0, 0, 1, 1,
-1.287327, -0.004842768, -0.2293307, 0, 0, 0, 1, 1,
-1.275755, 0.4385114, -0.2203438, 0, 0, 0, 1, 1,
-1.268702, -0.8215587, -2.250561, 0, 0, 0, 1, 1,
-1.26712, -1.210772, -2.216661, 0, 0, 0, 1, 1,
-1.264799, 0.01431236, -0.7426496, 0, 0, 0, 1, 1,
-1.260769, 1.05925, -0.02723588, 0, 0, 0, 1, 1,
-1.25464, -1.485398, -1.000794, 0, 0, 0, 1, 1,
-1.244961, 2.024136, -1.229552, 1, 1, 1, 1, 1,
-1.241255, -0.5804533, -2.494187, 1, 1, 1, 1, 1,
-1.230687, 1.012951, 0.4082284, 1, 1, 1, 1, 1,
-1.230478, 0.05882761, -0.9897004, 1, 1, 1, 1, 1,
-1.227453, -0.8624501, -3.061442, 1, 1, 1, 1, 1,
-1.223906, -0.7962182, -0.4872901, 1, 1, 1, 1, 1,
-1.220763, 0.4461215, -2.13023, 1, 1, 1, 1, 1,
-1.216001, -0.2906567, -0.8645394, 1, 1, 1, 1, 1,
-1.214174, -1.029271, -1.680798, 1, 1, 1, 1, 1,
-1.211744, -0.1646595, -2.412586, 1, 1, 1, 1, 1,
-1.203919, 0.344532, -2.39597, 1, 1, 1, 1, 1,
-1.200417, -0.003784548, -2.675157, 1, 1, 1, 1, 1,
-1.193497, -1.11785, -3.361719, 1, 1, 1, 1, 1,
-1.19345, 0.4935026, -1.141276, 1, 1, 1, 1, 1,
-1.188487, 0.7714154, -2.501505, 1, 1, 1, 1, 1,
-1.18807, 0.2563857, -0.5029332, 0, 0, 1, 1, 1,
-1.182248, 0.130558, -1.669317, 1, 0, 0, 1, 1,
-1.175837, -0.129948, -1.336371, 1, 0, 0, 1, 1,
-1.17074, -1.240304, -3.418927, 1, 0, 0, 1, 1,
-1.165632, 1.766018, -0.6662776, 1, 0, 0, 1, 1,
-1.162887, 0.8080479, -0.4691418, 1, 0, 0, 1, 1,
-1.160401, 0.2721926, 0.134488, 0, 0, 0, 1, 1,
-1.153279, -0.8923779, -2.485491, 0, 0, 0, 1, 1,
-1.142791, 1.507864, -1.412963, 0, 0, 0, 1, 1,
-1.124089, -0.06746572, -1.408683, 0, 0, 0, 1, 1,
-1.123143, -2.647868, -4.161836, 0, 0, 0, 1, 1,
-1.122228, -0.4691618, -1.503378, 0, 0, 0, 1, 1,
-1.120621, 0.3757132, -2.197514, 0, 0, 0, 1, 1,
-1.113943, -1.626679, -0.2093648, 1, 1, 1, 1, 1,
-1.106823, -0.4542528, -2.949193, 1, 1, 1, 1, 1,
-1.09448, 0.464422, -1.658094, 1, 1, 1, 1, 1,
-1.091076, 0.4363907, -1.3363, 1, 1, 1, 1, 1,
-1.079307, -0.9034445, -0.3319391, 1, 1, 1, 1, 1,
-1.075514, -0.1131638, -0.9758651, 1, 1, 1, 1, 1,
-1.074307, 1.684343, -2.163889, 1, 1, 1, 1, 1,
-1.072734, 1.4922, 0.2617595, 1, 1, 1, 1, 1,
-1.070581, -0.3092468, -1.908055, 1, 1, 1, 1, 1,
-1.069223, -0.555912, -1.75093, 1, 1, 1, 1, 1,
-1.065261, 0.8944968, 0.8612537, 1, 1, 1, 1, 1,
-1.057053, -1.017287, -3.008472, 1, 1, 1, 1, 1,
-1.052196, 0.4371301, -0.6318109, 1, 1, 1, 1, 1,
-1.051987, -1.453096, -2.548422, 1, 1, 1, 1, 1,
-1.05082, -0.4223355, -2.279701, 1, 1, 1, 1, 1,
-1.044227, -0.3428609, -0.1255103, 0, 0, 1, 1, 1,
-1.036438, -1.537352, -4.031427, 1, 0, 0, 1, 1,
-1.033425, -0.9585261, -2.202611, 1, 0, 0, 1, 1,
-1.028305, 0.4965803, -1.505619, 1, 0, 0, 1, 1,
-1.024979, -0.6319948, 0.73301, 1, 0, 0, 1, 1,
-1.023574, -0.2224807, -1.524557, 1, 0, 0, 1, 1,
-1.022461, 0.3996707, -1.465225, 0, 0, 0, 1, 1,
-1.016807, -0.7356617, -2.738401, 0, 0, 0, 1, 1,
-1.016176, -0.08753306, -0.1759617, 0, 0, 0, 1, 1,
-1.015495, 1.089185, 1.715532, 0, 0, 0, 1, 1,
-1.014705, 0.1087979, -3.79707, 0, 0, 0, 1, 1,
-0.9931684, 1.448635, -0.1180999, 0, 0, 0, 1, 1,
-0.9922401, 0.7642249, 0.4028241, 0, 0, 0, 1, 1,
-0.991081, -0.02906572, -0.8500858, 1, 1, 1, 1, 1,
-0.9857311, -0.8435116, -1.903132, 1, 1, 1, 1, 1,
-0.9772158, 0.3340235, -2.115381, 1, 1, 1, 1, 1,
-0.9755954, -0.627428, -1.440434, 1, 1, 1, 1, 1,
-0.9707674, 0.319795, -0.2131693, 1, 1, 1, 1, 1,
-0.9699576, 0.2001284, -3.390927, 1, 1, 1, 1, 1,
-0.9480818, 0.264906, -1.672781, 1, 1, 1, 1, 1,
-0.9480556, 0.03422128, -3.049247, 1, 1, 1, 1, 1,
-0.9473091, 1.052142, -0.9626094, 1, 1, 1, 1, 1,
-0.9328123, 1.806102, -1.074363, 1, 1, 1, 1, 1,
-0.9245594, -1.292337, -0.8625754, 1, 1, 1, 1, 1,
-0.9243094, -0.3982268, -1.392985, 1, 1, 1, 1, 1,
-0.9226426, -0.1514661, -1.101928, 1, 1, 1, 1, 1,
-0.9218453, -0.4407147, -2.769461, 1, 1, 1, 1, 1,
-0.9130902, -0.5014182, -0.5034814, 1, 1, 1, 1, 1,
-0.9067111, -0.06183085, -1.227421, 0, 0, 1, 1, 1,
-0.9049318, -2.743349, -1.094199, 1, 0, 0, 1, 1,
-0.9038319, -0.2272255, -1.471655, 1, 0, 0, 1, 1,
-0.902471, -0.2446362, -1.181476, 1, 0, 0, 1, 1,
-0.890854, 1.060582, -2.273833, 1, 0, 0, 1, 1,
-0.8892471, -0.3920658, -2.319407, 1, 0, 0, 1, 1,
-0.8872379, 0.4057895, 0.2255339, 0, 0, 0, 1, 1,
-0.8859577, 0.4173268, -2.099058, 0, 0, 0, 1, 1,
-0.8857065, 1.236002, -0.6900849, 0, 0, 0, 1, 1,
-0.882117, -0.3999867, -1.736703, 0, 0, 0, 1, 1,
-0.8798803, -1.578595, -3.657617, 0, 0, 0, 1, 1,
-0.8762239, -0.4607007, -1.130239, 0, 0, 0, 1, 1,
-0.8748491, 1.229287, -0.4473251, 0, 0, 0, 1, 1,
-0.8727046, 3.276074, 0.213742, 1, 1, 1, 1, 1,
-0.8693646, -1.176857, -1.855052, 1, 1, 1, 1, 1,
-0.8682263, -0.3086624, -2.657284, 1, 1, 1, 1, 1,
-0.8645025, 1.400368, -1.904203, 1, 1, 1, 1, 1,
-0.8611491, -2.228355, -2.781799, 1, 1, 1, 1, 1,
-0.8517866, 1.190753, 0.3276181, 1, 1, 1, 1, 1,
-0.8497892, -0.9536549, -3.902966, 1, 1, 1, 1, 1,
-0.8450462, -2.713619, -4.616518, 1, 1, 1, 1, 1,
-0.8418648, -1.357135, -2.037722, 1, 1, 1, 1, 1,
-0.8407965, -0.3337264, -0.7719777, 1, 1, 1, 1, 1,
-0.8369189, -1.158577, -3.098386, 1, 1, 1, 1, 1,
-0.8361323, -1.776649, -0.3722838, 1, 1, 1, 1, 1,
-0.8355747, 0.4904061, -1.70974, 1, 1, 1, 1, 1,
-0.8342373, 0.1569476, 0.8635175, 1, 1, 1, 1, 1,
-0.8328808, -0.2427664, -2.146416, 1, 1, 1, 1, 1,
-0.8326889, -1.470889, -3.350157, 0, 0, 1, 1, 1,
-0.8247859, 0.6522112, -0.360871, 1, 0, 0, 1, 1,
-0.8195289, 1.240192, 0.5299621, 1, 0, 0, 1, 1,
-0.8193181, 0.3333382, -0.771629, 1, 0, 0, 1, 1,
-0.8182678, -2.033173, -3.233498, 1, 0, 0, 1, 1,
-0.8170167, -0.5472344, -1.340472, 1, 0, 0, 1, 1,
-0.8138283, -1.013383, -2.764534, 0, 0, 0, 1, 1,
-0.8083069, -0.7171106, -1.988395, 0, 0, 0, 1, 1,
-0.8016832, -0.2196926, -2.425419, 0, 0, 0, 1, 1,
-0.7940124, 1.13109, -1.040526, 0, 0, 0, 1, 1,
-0.7938673, 0.3479636, -1.103864, 0, 0, 0, 1, 1,
-0.7829749, 0.5923638, -1.574885, 0, 0, 0, 1, 1,
-0.7823271, -0.08806019, 0.1476491, 0, 0, 0, 1, 1,
-0.779121, -2.016595, -2.032054, 1, 1, 1, 1, 1,
-0.7690235, -0.6700147, -1.876411, 1, 1, 1, 1, 1,
-0.7664369, -0.4197145, -1.590017, 1, 1, 1, 1, 1,
-0.7583402, 2.924578, 1.480315, 1, 1, 1, 1, 1,
-0.7546008, 0.3565255, -1.547033, 1, 1, 1, 1, 1,
-0.7523353, 0.2386075, -1.406157, 1, 1, 1, 1, 1,
-0.7414786, -0.2143639, -2.358288, 1, 1, 1, 1, 1,
-0.7407134, 0.6891632, -0.02608258, 1, 1, 1, 1, 1,
-0.7395753, 0.01267971, -0.9883758, 1, 1, 1, 1, 1,
-0.735505, 0.9855894, -0.3794713, 1, 1, 1, 1, 1,
-0.7341552, -0.7176418, -2.006757, 1, 1, 1, 1, 1,
-0.7335367, -1.617792, -3.523726, 1, 1, 1, 1, 1,
-0.7333578, 0.196401, -0.6457099, 1, 1, 1, 1, 1,
-0.7297983, -1.068293, -1.730186, 1, 1, 1, 1, 1,
-0.7287068, -1.132111, -1.535875, 1, 1, 1, 1, 1,
-0.7228796, -0.9059206, -2.054603, 0, 0, 1, 1, 1,
-0.7206072, -0.2872265, -1.249798, 1, 0, 0, 1, 1,
-0.720253, -0.8351122, -1.805287, 1, 0, 0, 1, 1,
-0.7186968, -0.7687831, -3.455461, 1, 0, 0, 1, 1,
-0.7153865, 0.3168486, -0.4359551, 1, 0, 0, 1, 1,
-0.7017979, -0.4444835, -3.323229, 1, 0, 0, 1, 1,
-0.7006097, -0.6122571, -2.290467, 0, 0, 0, 1, 1,
-0.698959, 0.4341685, 0.3924594, 0, 0, 0, 1, 1,
-0.6979252, 0.7169993, 0.01052307, 0, 0, 0, 1, 1,
-0.6974343, -0.2179354, -1.19566, 0, 0, 0, 1, 1,
-0.6902499, 0.03697648, -2.208616, 0, 0, 0, 1, 1,
-0.6829793, -0.05614716, -3.283857, 0, 0, 0, 1, 1,
-0.6764076, -0.5914626, -1.076322, 0, 0, 0, 1, 1,
-0.6745985, -0.1094098, -2.150262, 1, 1, 1, 1, 1,
-0.670338, -0.08363241, -2.515692, 1, 1, 1, 1, 1,
-0.6703258, 0.3186189, -1.293926, 1, 1, 1, 1, 1,
-0.6687677, 0.2285863, -2.087154, 1, 1, 1, 1, 1,
-0.6659988, -0.07657313, -0.8631302, 1, 1, 1, 1, 1,
-0.6658391, 0.8053237, -0.3693596, 1, 1, 1, 1, 1,
-0.6590596, -0.426731, -2.804712, 1, 1, 1, 1, 1,
-0.6529122, -0.6348395, -1.827727, 1, 1, 1, 1, 1,
-0.646355, -0.4331262, -2.451049, 1, 1, 1, 1, 1,
-0.6432334, 1.545885, -0.1163949, 1, 1, 1, 1, 1,
-0.6420849, -0.5840687, -4.545765, 1, 1, 1, 1, 1,
-0.6359069, 2.051339, -1.409609, 1, 1, 1, 1, 1,
-0.6348282, -1.153352, -2.987839, 1, 1, 1, 1, 1,
-0.6333569, -0.646277, -2.85693, 1, 1, 1, 1, 1,
-0.6307263, 1.644576, -1.896012, 1, 1, 1, 1, 1,
-0.6250811, 1.128996, -0.08915658, 0, 0, 1, 1, 1,
-0.6220117, -0.1185044, -1.037786, 1, 0, 0, 1, 1,
-0.6183233, 2.185894, 0.478911, 1, 0, 0, 1, 1,
-0.6073242, -0.9501394, -3.349814, 1, 0, 0, 1, 1,
-0.6005904, -0.05721558, -0.7093811, 1, 0, 0, 1, 1,
-0.5984666, 0.4202602, -0.1274515, 1, 0, 0, 1, 1,
-0.5970829, 0.6906048, -0.6026315, 0, 0, 0, 1, 1,
-0.5913044, 0.1758665, -0.4809126, 0, 0, 0, 1, 1,
-0.5855348, -0.08828303, -3.121152, 0, 0, 0, 1, 1,
-0.5839628, -0.305885, -3.622023, 0, 0, 0, 1, 1,
-0.5822034, -2.231579, -3.457806, 0, 0, 0, 1, 1,
-0.5804316, 0.8395171, 0.4607599, 0, 0, 0, 1, 1,
-0.5789776, -1.75926, -1.228568, 0, 0, 0, 1, 1,
-0.563396, 0.1377715, -0.7744173, 1, 1, 1, 1, 1,
-0.5608436, -0.3686596, -0.9397045, 1, 1, 1, 1, 1,
-0.555063, -1.172873, -3.823159, 1, 1, 1, 1, 1,
-0.5537027, 1.561054, -1.248302, 1, 1, 1, 1, 1,
-0.5502214, -0.2418068, -1.64044, 1, 1, 1, 1, 1,
-0.5495597, 0.2995009, -0.7061101, 1, 1, 1, 1, 1,
-0.5448912, -0.8997803, -1.793051, 1, 1, 1, 1, 1,
-0.5440476, 1.231079, 0.2814927, 1, 1, 1, 1, 1,
-0.5397925, -1.671583, -4.481568, 1, 1, 1, 1, 1,
-0.5395126, 0.600897, -1.300407, 1, 1, 1, 1, 1,
-0.5366701, -0.6364156, -1.361988, 1, 1, 1, 1, 1,
-0.5359417, 2.037453, 0.4353756, 1, 1, 1, 1, 1,
-0.5342472, 1.992253, -0.5494016, 1, 1, 1, 1, 1,
-0.5293278, 0.8449889, -1.234404, 1, 1, 1, 1, 1,
-0.5224074, 2.132075, 0.3320248, 1, 1, 1, 1, 1,
-0.5199939, -0.7366201, -3.325081, 0, 0, 1, 1, 1,
-0.5189888, 0.7277505, 0.8253775, 1, 0, 0, 1, 1,
-0.5175028, 0.3158557, -1.084713, 1, 0, 0, 1, 1,
-0.5171106, 0.685113, -1.881097, 1, 0, 0, 1, 1,
-0.5160906, -0.8842968, -2.266443, 1, 0, 0, 1, 1,
-0.5107022, 0.2485214, -1.790125, 1, 0, 0, 1, 1,
-0.5099924, -1.651658, -3.334955, 0, 0, 0, 1, 1,
-0.50598, -1.457622, -3.974915, 0, 0, 0, 1, 1,
-0.5048859, -0.2914502, -3.393465, 0, 0, 0, 1, 1,
-0.5044015, 1.341434, -0.7478116, 0, 0, 0, 1, 1,
-0.4993521, -2.280177, -3.946012, 0, 0, 0, 1, 1,
-0.4891025, 1.599432, -0.7092858, 0, 0, 0, 1, 1,
-0.4890373, -0.6293355, -3.262496, 0, 0, 0, 1, 1,
-0.4884183, 1.619807, 0.6315933, 1, 1, 1, 1, 1,
-0.4879701, 0.5282373, -0.5772809, 1, 1, 1, 1, 1,
-0.4870796, -0.6592598, -2.121624, 1, 1, 1, 1, 1,
-0.4822377, -0.1943213, -1.959926, 1, 1, 1, 1, 1,
-0.4812198, -0.3589669, -1.466901, 1, 1, 1, 1, 1,
-0.4781033, 0.343481, -0.6609873, 1, 1, 1, 1, 1,
-0.4776081, -1.092703, -3.069919, 1, 1, 1, 1, 1,
-0.4774174, 0.7965518, -0.4116414, 1, 1, 1, 1, 1,
-0.4753269, 0.02763965, -1.64029, 1, 1, 1, 1, 1,
-0.4745486, 2.51395, -0.07295758, 1, 1, 1, 1, 1,
-0.4613644, -0.7581747, -0.9809211, 1, 1, 1, 1, 1,
-0.4601001, 0.2509773, -0.5056147, 1, 1, 1, 1, 1,
-0.4593062, 1.318327, 0.7845597, 1, 1, 1, 1, 1,
-0.4579958, -0.1105217, -2.54151, 1, 1, 1, 1, 1,
-0.4534932, 0.2578886, -1.279293, 1, 1, 1, 1, 1,
-0.4530885, 0.06659655, -2.598301, 0, 0, 1, 1, 1,
-0.4513136, 0.2367875, 0.5381944, 1, 0, 0, 1, 1,
-0.4475481, 0.3524775, -0.8603968, 1, 0, 0, 1, 1,
-0.4453244, 0.3084717, -1.106883, 1, 0, 0, 1, 1,
-0.4426087, 0.4006411, -1.959289, 1, 0, 0, 1, 1,
-0.4386449, 0.7737302, -1.086675, 1, 0, 0, 1, 1,
-0.4375037, 0.9227303, -0.2971686, 0, 0, 0, 1, 1,
-0.4343632, 0.5121779, 0.9818324, 0, 0, 0, 1, 1,
-0.4342932, -0.3386935, -3.328466, 0, 0, 0, 1, 1,
-0.4301858, 0.7062723, -0.7614129, 0, 0, 0, 1, 1,
-0.4139093, -0.5651484, -1.919693, 0, 0, 0, 1, 1,
-0.4135377, 1.464253, -0.5466344, 0, 0, 0, 1, 1,
-0.4129512, -0.1868458, -3.446489, 0, 0, 0, 1, 1,
-0.4129215, -0.4683898, -3.726321, 1, 1, 1, 1, 1,
-0.4116795, -0.4382053, -3.304858, 1, 1, 1, 1, 1,
-0.4113858, -0.02325648, -3.166258, 1, 1, 1, 1, 1,
-0.4087446, -1.171678, -1.904057, 1, 1, 1, 1, 1,
-0.405129, -0.03793333, -2.82366, 1, 1, 1, 1, 1,
-0.3999989, 0.4926582, -0.09561164, 1, 1, 1, 1, 1,
-0.3944173, 0.1645471, -2.498695, 1, 1, 1, 1, 1,
-0.3936231, 0.1648623, 0.4075719, 1, 1, 1, 1, 1,
-0.3926424, -0.3363563, -1.340046, 1, 1, 1, 1, 1,
-0.3877114, 0.4572963, -0.5549521, 1, 1, 1, 1, 1,
-0.3822181, 0.1402484, -2.628448, 1, 1, 1, 1, 1,
-0.378177, -0.8532385, -3.606881, 1, 1, 1, 1, 1,
-0.3773136, 1.286299, -1.06044, 1, 1, 1, 1, 1,
-0.3771928, -0.6799715, -1.916178, 1, 1, 1, 1, 1,
-0.3765241, -1.360112, -1.665404, 1, 1, 1, 1, 1,
-0.3757932, -1.170687, -3.742059, 0, 0, 1, 1, 1,
-0.3752333, -0.5412168, -3.223598, 1, 0, 0, 1, 1,
-0.3751959, 0.09821439, -2.5971, 1, 0, 0, 1, 1,
-0.3713132, 0.04756586, -2.213592, 1, 0, 0, 1, 1,
-0.3704353, -0.501908, -2.800283, 1, 0, 0, 1, 1,
-0.3696108, -0.4490152, -2.964212, 1, 0, 0, 1, 1,
-0.3672958, 2.026731, -0.711413, 0, 0, 0, 1, 1,
-0.3656171, -0.3337716, -3.7847, 0, 0, 0, 1, 1,
-0.362303, 2.138583, -2.058601, 0, 0, 0, 1, 1,
-0.3611241, 0.6745054, 1.814269, 0, 0, 0, 1, 1,
-0.3573103, 0.0545737, -0.642099, 0, 0, 0, 1, 1,
-0.3566288, -0.8649548, -3.003834, 0, 0, 0, 1, 1,
-0.3561754, 0.9809484, -0.953002, 0, 0, 0, 1, 1,
-0.3555552, -1.437882, -4.073942, 1, 1, 1, 1, 1,
-0.3538656, -0.138932, -4.486585, 1, 1, 1, 1, 1,
-0.3506064, 0.8103739, -0.5430362, 1, 1, 1, 1, 1,
-0.3488056, -0.3023481, -0.8791202, 1, 1, 1, 1, 1,
-0.3463676, 0.2050966, -0.3095644, 1, 1, 1, 1, 1,
-0.337962, 0.760017, -1.759132, 1, 1, 1, 1, 1,
-0.3375406, 0.2508709, 0.3190277, 1, 1, 1, 1, 1,
-0.3369387, -0.8871472, -1.976919, 1, 1, 1, 1, 1,
-0.3315108, 0.9069002, -0.04497193, 1, 1, 1, 1, 1,
-0.331084, 0.1053369, -1.27377, 1, 1, 1, 1, 1,
-0.3307097, -1.87495, -2.833337, 1, 1, 1, 1, 1,
-0.3285152, -1.485508, -2.515325, 1, 1, 1, 1, 1,
-0.3229758, -0.03430578, -1.537725, 1, 1, 1, 1, 1,
-0.3214943, -1.337302, -4.050464, 1, 1, 1, 1, 1,
-0.3206436, -0.6108685, -2.056752, 1, 1, 1, 1, 1,
-0.3194232, 0.8289936, 0.1659975, 0, 0, 1, 1, 1,
-0.3137003, -0.2224407, -0.9696166, 1, 0, 0, 1, 1,
-0.3125836, 0.2421087, -0.5758876, 1, 0, 0, 1, 1,
-0.3116631, -0.5221672, -4.167754, 1, 0, 0, 1, 1,
-0.3097495, -1.866613, -3.054946, 1, 0, 0, 1, 1,
-0.3076413, 0.05019227, 0.2187263, 1, 0, 0, 1, 1,
-0.3029401, 0.5536399, 1.078061, 0, 0, 0, 1, 1,
-0.3021499, -1.005116, -2.811289, 0, 0, 0, 1, 1,
-0.3018252, -0.3398172, -3.77104, 0, 0, 0, 1, 1,
-0.2984808, -0.4580715, -0.9281636, 0, 0, 0, 1, 1,
-0.2939269, 1.333371, -0.6693802, 0, 0, 0, 1, 1,
-0.2923819, -0.7442642, -2.276053, 0, 0, 0, 1, 1,
-0.285995, -0.4315171, -3.6739, 0, 0, 0, 1, 1,
-0.2835669, 0.4325798, -1.130799, 1, 1, 1, 1, 1,
-0.2829804, 1.052724, 0.1465182, 1, 1, 1, 1, 1,
-0.2825546, -0.267357, -0.7111498, 1, 1, 1, 1, 1,
-0.2814581, 1.312723, -0.1157721, 1, 1, 1, 1, 1,
-0.2813367, -0.8684385, -3.178487, 1, 1, 1, 1, 1,
-0.2801895, -1.105749, -4.638797, 1, 1, 1, 1, 1,
-0.2780014, 0.03020392, -2.021839, 1, 1, 1, 1, 1,
-0.2770162, -0.6430833, -3.7262, 1, 1, 1, 1, 1,
-0.2745977, -1.267254, -3.836539, 1, 1, 1, 1, 1,
-0.2563999, 0.6847828, 0.7620762, 1, 1, 1, 1, 1,
-0.2547514, -0.1677275, -1.492393, 1, 1, 1, 1, 1,
-0.2501638, -0.5468323, -2.38809, 1, 1, 1, 1, 1,
-0.2500682, -2.6483, -4.645069, 1, 1, 1, 1, 1,
-0.247258, 0.4851398, -0.8372287, 1, 1, 1, 1, 1,
-0.2462865, 1.45087, 0.3878406, 1, 1, 1, 1, 1,
-0.2445893, 0.1904168, -0.04324316, 0, 0, 1, 1, 1,
-0.2407908, -0.4935551, -2.163945, 1, 0, 0, 1, 1,
-0.2383295, 1.975043, -0.2148291, 1, 0, 0, 1, 1,
-0.2383124, -0.8013948, -1.816278, 1, 0, 0, 1, 1,
-0.2374779, 0.06102671, -0.6715533, 1, 0, 0, 1, 1,
-0.2361822, 0.7949516, 1.137211, 1, 0, 0, 1, 1,
-0.2359644, 0.9042052, -0.8661532, 0, 0, 0, 1, 1,
-0.2350551, 0.3366634, -1.190421, 0, 0, 0, 1, 1,
-0.2310993, 0.09360303, -0.4879557, 0, 0, 0, 1, 1,
-0.2273524, 0.4595609, -0.1167802, 0, 0, 0, 1, 1,
-0.2270914, 0.4547713, -1.733552, 0, 0, 0, 1, 1,
-0.2263334, 0.9447501, -2.656096, 0, 0, 0, 1, 1,
-0.2199236, 0.3073988, -0.1473062, 0, 0, 0, 1, 1,
-0.2193269, 1.488745, 0.2878635, 1, 1, 1, 1, 1,
-0.2173999, -0.9677781, -1.897306, 1, 1, 1, 1, 1,
-0.2173539, 1.458879, 0.8300066, 1, 1, 1, 1, 1,
-0.214325, -0.7502373, -1.954799, 1, 1, 1, 1, 1,
-0.2054824, 1.366334, 0.1207917, 1, 1, 1, 1, 1,
-0.2032061, 1.01428, -0.4044781, 1, 1, 1, 1, 1,
-0.2005955, 0.7473118, -0.8383668, 1, 1, 1, 1, 1,
-0.1991006, -0.2003254, -2.095329, 1, 1, 1, 1, 1,
-0.1951821, -0.6513003, -3.769083, 1, 1, 1, 1, 1,
-0.1948131, -0.9760707, -3.897427, 1, 1, 1, 1, 1,
-0.1873605, 0.3276662, 1.967242, 1, 1, 1, 1, 1,
-0.1858482, 0.3293212, -0.5802293, 1, 1, 1, 1, 1,
-0.1846389, 0.8434201, -0.4861965, 1, 1, 1, 1, 1,
-0.1829436, -0.8330911, -2.17646, 1, 1, 1, 1, 1,
-0.1804486, -0.5222962, -2.32363, 1, 1, 1, 1, 1,
-0.1769404, -0.1164777, -2.371726, 0, 0, 1, 1, 1,
-0.1768168, -0.600156, -1.062511, 1, 0, 0, 1, 1,
-0.1765157, 0.152012, -1.865156, 1, 0, 0, 1, 1,
-0.1717794, -0.06086693, -0.9382868, 1, 0, 0, 1, 1,
-0.1689174, -0.5087501, -2.682224, 1, 0, 0, 1, 1,
-0.1679473, -0.5925224, -2.331681, 1, 0, 0, 1, 1,
-0.1662668, 0.4855103, 1.267274, 0, 0, 0, 1, 1,
-0.1617303, -0.8259959, -2.97548, 0, 0, 0, 1, 1,
-0.1593431, 1.388296, -1.201558, 0, 0, 0, 1, 1,
-0.1587442, -0.7587373, -2.81779, 0, 0, 0, 1, 1,
-0.1512749, -0.4464233, -4.295452, 0, 0, 0, 1, 1,
-0.1510625, -0.6132097, -3.730398, 0, 0, 0, 1, 1,
-0.1472941, 0.1059343, -0.5958459, 0, 0, 0, 1, 1,
-0.1348971, -0.09877551, -2.850693, 1, 1, 1, 1, 1,
-0.131052, -1.223278, -2.576473, 1, 1, 1, 1, 1,
-0.1301011, -1.788282, -4.084642, 1, 1, 1, 1, 1,
-0.1299799, 2.14802, -1.262259, 1, 1, 1, 1, 1,
-0.129163, -0.04266417, -2.126005, 1, 1, 1, 1, 1,
-0.1248948, 0.925027, -0.242006, 1, 1, 1, 1, 1,
-0.123973, 1.622036, -2.747572, 1, 1, 1, 1, 1,
-0.1217115, 0.7466589, -1.263032, 1, 1, 1, 1, 1,
-0.1176986, 1.9186, 0.6611289, 1, 1, 1, 1, 1,
-0.1161208, -1.379238, -3.56935, 1, 1, 1, 1, 1,
-0.1157056, -0.7771407, -3.464485, 1, 1, 1, 1, 1,
-0.1096799, 0.6594162, 1.262898, 1, 1, 1, 1, 1,
-0.1093553, -0.5146346, -3.241785, 1, 1, 1, 1, 1,
-0.1077114, 0.4627827, 0.5085296, 1, 1, 1, 1, 1,
-0.1055336, -0.4415179, -3.443472, 1, 1, 1, 1, 1,
-0.1050617, -0.5880932, -1.357723, 0, 0, 1, 1, 1,
-0.1042737, -0.3663344, -3.207497, 1, 0, 0, 1, 1,
-0.1016315, -0.7809176, -2.527029, 1, 0, 0, 1, 1,
-0.09623407, -1.461616, -3.163016, 1, 0, 0, 1, 1,
-0.09452705, 1.992749, 0.02166783, 1, 0, 0, 1, 1,
-0.09313798, -0.1820127, -3.155824, 1, 0, 0, 1, 1,
-0.09078159, -1.588206, -3.138463, 0, 0, 0, 1, 1,
-0.08816774, -0.4695428, -1.081628, 0, 0, 0, 1, 1,
-0.082118, 0.07885948, -0.006842926, 0, 0, 0, 1, 1,
-0.0814108, 0.251642, -1.367772, 0, 0, 0, 1, 1,
-0.08120211, -2.415934, -2.254783, 0, 0, 0, 1, 1,
-0.08069775, -0.1102828, -0.1123647, 0, 0, 0, 1, 1,
-0.08041601, 0.1022046, 0.1362603, 0, 0, 0, 1, 1,
-0.07901371, -0.8183322, -2.564586, 1, 1, 1, 1, 1,
-0.07752511, 1.197605, -0.758184, 1, 1, 1, 1, 1,
-0.07232191, 0.01123794, -2.18638, 1, 1, 1, 1, 1,
-0.07087291, 0.1454973, -0.7409737, 1, 1, 1, 1, 1,
-0.06759973, -0.6017421, -3.328196, 1, 1, 1, 1, 1,
-0.06741473, -0.4818825, -2.661049, 1, 1, 1, 1, 1,
-0.06691562, 1.081885, 0.2870267, 1, 1, 1, 1, 1,
-0.06426039, 0.6096801, -0.5845826, 1, 1, 1, 1, 1,
-0.06391162, 1.040561, 2.648936, 1, 1, 1, 1, 1,
-0.06238282, -0.5864038, -3.531955, 1, 1, 1, 1, 1,
-0.05493316, 0.6178955, -0.3885808, 1, 1, 1, 1, 1,
-0.05443067, 0.8834468, 0.158671, 1, 1, 1, 1, 1,
-0.05401561, -0.8563895, -2.692183, 1, 1, 1, 1, 1,
-0.0475027, -1.439035, -3.287947, 1, 1, 1, 1, 1,
-0.04415374, -1.300523, -4.8442, 1, 1, 1, 1, 1,
-0.04411555, -0.5141591, -2.904513, 0, 0, 1, 1, 1,
-0.04383274, 0.4539512, -0.6532385, 1, 0, 0, 1, 1,
-0.04263007, 0.1920445, 0.4729541, 1, 0, 0, 1, 1,
-0.0403649, -0.2109386, -3.430218, 1, 0, 0, 1, 1,
-0.03852083, 0.007519195, -1.93536, 1, 0, 0, 1, 1,
-0.03783908, -0.8645237, -3.656689, 1, 0, 0, 1, 1,
-0.03607731, -0.1184284, -3.802042, 0, 0, 0, 1, 1,
-0.03339206, -0.5827156, -3.438928, 0, 0, 0, 1, 1,
-0.03125045, 0.6699319, -1.814721, 0, 0, 0, 1, 1,
-0.02458047, 0.4360362, 0.5112415, 0, 0, 0, 1, 1,
-0.02249028, 0.1788469, 1.244509, 0, 0, 0, 1, 1,
-0.01795264, 0.5203772, -0.8959435, 0, 0, 0, 1, 1,
-0.01740407, -0.2195089, -4.249858, 0, 0, 0, 1, 1,
-0.01633749, 0.4559182, -0.7128556, 1, 1, 1, 1, 1,
-0.01550062, -0.4595064, -2.369018, 1, 1, 1, 1, 1,
-0.01294381, 0.3451551, -0.5773528, 1, 1, 1, 1, 1,
-0.01244124, -1.212583, -2.282624, 1, 1, 1, 1, 1,
-0.01091748, 0.2238319, -1.543227, 1, 1, 1, 1, 1,
-0.008902336, -0.007180459, -0.3718558, 1, 1, 1, 1, 1,
-0.008757995, 0.3256596, -1.515469, 1, 1, 1, 1, 1,
-0.006521221, -1.743305, -2.882732, 1, 1, 1, 1, 1,
-0.00617692, -0.1164436, -3.755124, 1, 1, 1, 1, 1,
-0.006088039, 0.1360853, 2.838588, 1, 1, 1, 1, 1,
-6.730952e-05, 1.541077, -0.8680503, 1, 1, 1, 1, 1,
0.002223457, -0.350099, 3.637937, 1, 1, 1, 1, 1,
0.002936732, 0.04158727, -1.862882, 1, 1, 1, 1, 1,
0.003331173, 0.9508335, 0.4940699, 1, 1, 1, 1, 1,
0.007821767, -0.7097893, 4.25741, 1, 1, 1, 1, 1,
0.009045275, -0.9471946, 2.965739, 0, 0, 1, 1, 1,
0.0184124, -0.4807135, 1.868533, 1, 0, 0, 1, 1,
0.02103589, -0.9720186, 5.224958, 1, 0, 0, 1, 1,
0.02237464, -2.828907, 3.387879, 1, 0, 0, 1, 1,
0.0231967, -0.2716513, 3.245853, 1, 0, 0, 1, 1,
0.03330909, 0.2483036, 0.03161516, 1, 0, 0, 1, 1,
0.03435279, 1.943807, 0.153014, 0, 0, 0, 1, 1,
0.03597448, 0.1764237, -0.8168745, 0, 0, 0, 1, 1,
0.03661555, -0.7070066, 1.456035, 0, 0, 0, 1, 1,
0.03795914, -0.6346259, 2.751822, 0, 0, 0, 1, 1,
0.04428312, -0.8972184, 3.811654, 0, 0, 0, 1, 1,
0.04476055, -0.4160701, 2.268866, 0, 0, 0, 1, 1,
0.04551509, -0.9996512, 3.268948, 0, 0, 0, 1, 1,
0.04938341, 0.328457, 0.5326749, 1, 1, 1, 1, 1,
0.05095278, 0.3311469, -0.6554408, 1, 1, 1, 1, 1,
0.05329677, 2.023458, -2.604877, 1, 1, 1, 1, 1,
0.05649264, 1.02272, -2.067508, 1, 1, 1, 1, 1,
0.0566157, -0.2315276, 1.251045, 1, 1, 1, 1, 1,
0.05990578, -0.9790476, 3.947424, 1, 1, 1, 1, 1,
0.06812106, 0.178763, -1.111423, 1, 1, 1, 1, 1,
0.0701314, 2.8249, 0.8612127, 1, 1, 1, 1, 1,
0.07117844, -0.5139837, 4.371839, 1, 1, 1, 1, 1,
0.07550169, -0.3007869, 1.844049, 1, 1, 1, 1, 1,
0.07786034, 0.1404319, 0.8386658, 1, 1, 1, 1, 1,
0.07858074, -1.293722, 1.83971, 1, 1, 1, 1, 1,
0.07867408, -0.7981694, 1.925457, 1, 1, 1, 1, 1,
0.08153486, -0.006580559, 1.344173, 1, 1, 1, 1, 1,
0.08240933, -0.2947226, 3.039384, 1, 1, 1, 1, 1,
0.08294048, -1.347279, 3.09798, 0, 0, 1, 1, 1,
0.08464804, 0.8210611, 0.5541432, 1, 0, 0, 1, 1,
0.08845338, 2.286634, 0.4753188, 1, 0, 0, 1, 1,
0.08961029, 0.8820474, 0.5305277, 1, 0, 0, 1, 1,
0.09317648, -0.1630049, 4.057956, 1, 0, 0, 1, 1,
0.09715049, 1.422942, 0.5252613, 1, 0, 0, 1, 1,
0.1008637, -0.05738601, 2.520995, 0, 0, 0, 1, 1,
0.1050225, -2.017334, 2.024801, 0, 0, 0, 1, 1,
0.1113269, -1.805874, 1.985353, 0, 0, 0, 1, 1,
0.1149261, 0.3617412, -0.7285845, 0, 0, 0, 1, 1,
0.1180674, -0.2709493, 1.907933, 0, 0, 0, 1, 1,
0.1193637, -0.8485383, 3.092449, 0, 0, 0, 1, 1,
0.1240035, -0.3457971, 2.848699, 0, 0, 0, 1, 1,
0.1263635, -0.5354522, 1.419247, 1, 1, 1, 1, 1,
0.1265126, -0.2307165, 4.008818, 1, 1, 1, 1, 1,
0.1265837, 0.234551, 1.210205, 1, 1, 1, 1, 1,
0.1305175, 0.913969, -0.9978928, 1, 1, 1, 1, 1,
0.1352399, -0.08370897, 1.193371, 1, 1, 1, 1, 1,
0.136527, -0.1519122, 3.157956, 1, 1, 1, 1, 1,
0.1375535, -1.969536, 3.284029, 1, 1, 1, 1, 1,
0.1382451, -0.5788375, 2.41056, 1, 1, 1, 1, 1,
0.1396225, -1.386228, 3.195501, 1, 1, 1, 1, 1,
0.1411497, -0.1384226, 2.270777, 1, 1, 1, 1, 1,
0.149123, 0.9634564, 0.05015504, 1, 1, 1, 1, 1,
0.1510005, -0.2816591, 2.971313, 1, 1, 1, 1, 1,
0.1521983, -0.902434, 1.270686, 1, 1, 1, 1, 1,
0.1575476, -0.6527463, 2.390417, 1, 1, 1, 1, 1,
0.1580602, 0.2860675, 0.6155811, 1, 1, 1, 1, 1,
0.1585845, 1.278847, -0.7254722, 0, 0, 1, 1, 1,
0.1594965, 0.6756985, -0.3282758, 1, 0, 0, 1, 1,
0.1695619, -0.9717621, 2.612262, 1, 0, 0, 1, 1,
0.1740237, 1.579461, 1.124484, 1, 0, 0, 1, 1,
0.1750969, -0.5117282, 2.737334, 1, 0, 0, 1, 1,
0.1774182, 0.0009097706, 2.320163, 1, 0, 0, 1, 1,
0.177977, -1.874606, 2.812452, 0, 0, 0, 1, 1,
0.1786549, -0.1185305, 2.015387, 0, 0, 0, 1, 1,
0.1793334, -0.4013056, 1.977944, 0, 0, 0, 1, 1,
0.1801175, 0.6015769, -0.1400128, 0, 0, 0, 1, 1,
0.1802808, -0.5976813, 2.978139, 0, 0, 0, 1, 1,
0.1871629, -0.9111204, 3.133201, 0, 0, 0, 1, 1,
0.1920715, 0.06572196, 2.602966, 0, 0, 0, 1, 1,
0.1960809, -0.3827075, 3.181685, 1, 1, 1, 1, 1,
0.1974229, -0.6827404, 1.408221, 1, 1, 1, 1, 1,
0.1992424, 0.4605625, 0.1708558, 1, 1, 1, 1, 1,
0.2043346, 0.4117552, -0.04266191, 1, 1, 1, 1, 1,
0.2070652, -0.1306101, 3.212672, 1, 1, 1, 1, 1,
0.2097923, -0.7286229, 1.663518, 1, 1, 1, 1, 1,
0.2111889, -0.4390298, 3.340351, 1, 1, 1, 1, 1,
0.2117075, 0.5581766, -0.4930704, 1, 1, 1, 1, 1,
0.213269, 0.3866091, 1.265742, 1, 1, 1, 1, 1,
0.2194946, -0.5046782, 2.449049, 1, 1, 1, 1, 1,
0.2202511, 1.283121, 0.8844445, 1, 1, 1, 1, 1,
0.2205994, 1.49376, 1.777764, 1, 1, 1, 1, 1,
0.2259739, 0.2630493, 0.8955186, 1, 1, 1, 1, 1,
0.2262447, -0.4398097, 2.510811, 1, 1, 1, 1, 1,
0.2321109, 1.147124, 0.2841413, 1, 1, 1, 1, 1,
0.2362835, -0.2935788, 1.960214, 0, 0, 1, 1, 1,
0.2417936, -0.1396426, 2.00084, 1, 0, 0, 1, 1,
0.2444661, -1.097328, 3.389423, 1, 0, 0, 1, 1,
0.2457222, 0.6902024, -0.1333564, 1, 0, 0, 1, 1,
0.2468632, -0.3935976, 0.5012287, 1, 0, 0, 1, 1,
0.2470252, -1.156325, 1.781708, 1, 0, 0, 1, 1,
0.2480282, 0.5155889, 0.01208411, 0, 0, 0, 1, 1,
0.2483347, 1.220289, 0.216662, 0, 0, 0, 1, 1,
0.2498781, -2.518804, 0.5462515, 0, 0, 0, 1, 1,
0.2500485, -0.6783317, 2.037716, 0, 0, 0, 1, 1,
0.2511301, 0.6271332, 1.518403, 0, 0, 0, 1, 1,
0.2557905, -0.466129, 1.543952, 0, 0, 0, 1, 1,
0.2577001, -0.2563932, 1.67439, 0, 0, 0, 1, 1,
0.2620676, 0.7519376, -0.6437527, 1, 1, 1, 1, 1,
0.2631354, -0.5703337, 1.996897, 1, 1, 1, 1, 1,
0.2766419, 0.4392572, 1.92179, 1, 1, 1, 1, 1,
0.2865027, -2.805534, 5.357067, 1, 1, 1, 1, 1,
0.2920137, 1.568042, 0.4397991, 1, 1, 1, 1, 1,
0.3028104, 0.6996414, -0.8927391, 1, 1, 1, 1, 1,
0.3045664, 0.4521219, 0.5823631, 1, 1, 1, 1, 1,
0.3058076, -1.253454, 2.542214, 1, 1, 1, 1, 1,
0.306647, 0.7530697, -0.3166555, 1, 1, 1, 1, 1,
0.3068704, -0.697269, 1.643291, 1, 1, 1, 1, 1,
0.3096499, -0.03187178, 1.187564, 1, 1, 1, 1, 1,
0.3133245, -0.8966098, 4.928099, 1, 1, 1, 1, 1,
0.3147108, 1.672124, 0.7941235, 1, 1, 1, 1, 1,
0.315782, 1.53381, 0.2795574, 1, 1, 1, 1, 1,
0.3158297, 0.4978003, -0.03055241, 1, 1, 1, 1, 1,
0.3159392, -0.4159046, 2.23719, 0, 0, 1, 1, 1,
0.3184074, -0.2493067, 3.385401, 1, 0, 0, 1, 1,
0.3231289, 0.9325272, 1.102068, 1, 0, 0, 1, 1,
0.325028, -1.478393, 4.649317, 1, 0, 0, 1, 1,
0.3279035, 0.009626104, -0.7555799, 1, 0, 0, 1, 1,
0.3283895, -0.2286799, 1.509896, 1, 0, 0, 1, 1,
0.329478, -1.118899, 2.827304, 0, 0, 0, 1, 1,
0.3338664, -0.4068454, 3.135482, 0, 0, 0, 1, 1,
0.3357802, -0.6106085, 3.601952, 0, 0, 0, 1, 1,
0.3362194, 0.7374308, -2.136428, 0, 0, 0, 1, 1,
0.3363948, -1.237891, 3.097934, 0, 0, 0, 1, 1,
0.3368239, 0.3936296, 1.24467, 0, 0, 0, 1, 1,
0.3368309, 0.1743273, 0.7724569, 0, 0, 0, 1, 1,
0.3390903, -0.3880278, 2.173009, 1, 1, 1, 1, 1,
0.3446636, 1.516565, 0.07667869, 1, 1, 1, 1, 1,
0.3479687, -1.121361, 4.630398, 1, 1, 1, 1, 1,
0.3530755, 1.138946, -1.158162, 1, 1, 1, 1, 1,
0.3537303, -0.8330573, 3.705787, 1, 1, 1, 1, 1,
0.3560427, -1.279249, 3.350044, 1, 1, 1, 1, 1,
0.3581893, -1.021525, 2.687202, 1, 1, 1, 1, 1,
0.3586071, -0.6457254, 2.461244, 1, 1, 1, 1, 1,
0.3642106, -0.7441258, 1.58628, 1, 1, 1, 1, 1,
0.3653094, -0.2657242, 2.581865, 1, 1, 1, 1, 1,
0.3705511, 1.148121, 2.256196, 1, 1, 1, 1, 1,
0.3778171, 0.4448013, 2.06094, 1, 1, 1, 1, 1,
0.380175, -1.499686, 4.360091, 1, 1, 1, 1, 1,
0.386311, 0.4250138, 0.2087925, 1, 1, 1, 1, 1,
0.3902782, -0.3975645, 2.286756, 1, 1, 1, 1, 1,
0.3978748, -0.1552579, 1.291147, 0, 0, 1, 1, 1,
0.4028597, -0.9415957, 2.161885, 1, 0, 0, 1, 1,
0.4095215, -0.5625464, 1.874991, 1, 0, 0, 1, 1,
0.4095663, -0.6258196, 3.055192, 1, 0, 0, 1, 1,
0.4129638, -1.427444, 3.480397, 1, 0, 0, 1, 1,
0.4142406, -1.693937, 2.182989, 1, 0, 0, 1, 1,
0.415689, 1.210919, -0.2716601, 0, 0, 0, 1, 1,
0.4226767, 0.3904302, -0.4507905, 0, 0, 0, 1, 1,
0.4248719, 0.3318668, 0.4708368, 0, 0, 0, 1, 1,
0.4281485, -0.9130147, 3.380575, 0, 0, 0, 1, 1,
0.4291317, -0.8553163, 2.792284, 0, 0, 0, 1, 1,
0.4318653, 0.3228768, 3.042384, 0, 0, 0, 1, 1,
0.4357901, 0.7356898, -0.7798428, 0, 0, 0, 1, 1,
0.4358456, 0.4408151, 2.002963, 1, 1, 1, 1, 1,
0.4361802, 0.211329, 2.9121, 1, 1, 1, 1, 1,
0.4366312, 2.74858, 0.8625487, 1, 1, 1, 1, 1,
0.4367557, 0.165995, 1.499679, 1, 1, 1, 1, 1,
0.439604, 0.2059135, 1.399523, 1, 1, 1, 1, 1,
0.4398772, 1.94326, 0.9679374, 1, 1, 1, 1, 1,
0.4403929, -2.888031, 1.961435, 1, 1, 1, 1, 1,
0.4440139, -0.02434812, 0.9597569, 1, 1, 1, 1, 1,
0.4442356, -0.2325856, 2.286732, 1, 1, 1, 1, 1,
0.4477043, -0.1483227, 0.1097543, 1, 1, 1, 1, 1,
0.4478931, 0.8987371, 1.49266, 1, 1, 1, 1, 1,
0.4481051, -1.339757, 1.839985, 1, 1, 1, 1, 1,
0.4507295, 0.7479018, 1.605093, 1, 1, 1, 1, 1,
0.4507605, 0.3825487, 1.505352, 1, 1, 1, 1, 1,
0.4525599, -0.2352698, 2.309186, 1, 1, 1, 1, 1,
0.4527709, 1.318547, 3.207302, 0, 0, 1, 1, 1,
0.4536374, -1.491596, 3.135427, 1, 0, 0, 1, 1,
0.4572189, -0.6433699, 0.7017968, 1, 0, 0, 1, 1,
0.4618631, 1.212372, 0.35372, 1, 0, 0, 1, 1,
0.4651763, 0.3521179, 0.8399469, 1, 0, 0, 1, 1,
0.4667503, -0.2121823, 0.2445102, 1, 0, 0, 1, 1,
0.4670641, 0.1016183, 0.727616, 0, 0, 0, 1, 1,
0.474355, 0.7721888, 1.395744, 0, 0, 0, 1, 1,
0.4781832, 0.457428, 1.936214, 0, 0, 0, 1, 1,
0.4793701, 1.335786, 2.077766, 0, 0, 0, 1, 1,
0.4801699, 1.082469, 1.109115, 0, 0, 0, 1, 1,
0.4890139, 2.085636, -0.30963, 0, 0, 0, 1, 1,
0.4894128, -0.7431789, 1.043056, 0, 0, 0, 1, 1,
0.4900657, 0.31033, 2.674272, 1, 1, 1, 1, 1,
0.4949878, 1.244909, -0.607398, 1, 1, 1, 1, 1,
0.4959138, -0.07361856, 1.112384, 1, 1, 1, 1, 1,
0.5039793, -0.9738898, 1.53517, 1, 1, 1, 1, 1,
0.5044155, -0.6019036, 1.615853, 1, 1, 1, 1, 1,
0.5045798, 2.151611, 0.7730993, 1, 1, 1, 1, 1,
0.5093902, 0.1433194, 1.824959, 1, 1, 1, 1, 1,
0.5109524, 0.2368567, 1.424948, 1, 1, 1, 1, 1,
0.5109966, 0.3549199, -0.7481012, 1, 1, 1, 1, 1,
0.5128651, -1.155163, 2.467511, 1, 1, 1, 1, 1,
0.5132942, 2.36235, 0.9821099, 1, 1, 1, 1, 1,
0.5138338, -0.02972016, 3.277135, 1, 1, 1, 1, 1,
0.5145856, -0.2555645, 2.509237, 1, 1, 1, 1, 1,
0.5149888, 0.52021, 0.8765813, 1, 1, 1, 1, 1,
0.515724, -0.2956392, 2.016811, 1, 1, 1, 1, 1,
0.5162573, 0.6467541, 0.7298691, 0, 0, 1, 1, 1,
0.5192765, 1.125251, 0.3899625, 1, 0, 0, 1, 1,
0.5210892, -0.2506216, 1.832325, 1, 0, 0, 1, 1,
0.5212141, -1.850944, 2.560928, 1, 0, 0, 1, 1,
0.522588, 0.6455416, 0.2846827, 1, 0, 0, 1, 1,
0.5227425, 0.6854379, 1.322401, 1, 0, 0, 1, 1,
0.5244588, 0.05680671, 1.414377, 0, 0, 0, 1, 1,
0.5245277, -0.6179928, 0.8771816, 0, 0, 0, 1, 1,
0.5305665, -0.4561875, 1.869164, 0, 0, 0, 1, 1,
0.5327969, 0.4048049, 1.817198, 0, 0, 0, 1, 1,
0.5423102, -0.1068161, 1.512867, 0, 0, 0, 1, 1,
0.5428793, 1.60689, -0.6485075, 0, 0, 0, 1, 1,
0.5474074, -0.2724353, 2.225997, 0, 0, 0, 1, 1,
0.549804, 0.08260153, 1.367193, 1, 1, 1, 1, 1,
0.5541121, -1.951866, 3.29649, 1, 1, 1, 1, 1,
0.5555924, 0.3121821, 0.4934198, 1, 1, 1, 1, 1,
0.5601354, -0.2112239, 3.265448, 1, 1, 1, 1, 1,
0.5670065, 1.465959, -0.8166915, 1, 1, 1, 1, 1,
0.5692002, 2.00819, -0.3728656, 1, 1, 1, 1, 1,
0.5716985, 0.07943191, 1.425003, 1, 1, 1, 1, 1,
0.5762435, 0.3247862, -0.4959339, 1, 1, 1, 1, 1,
0.5836049, 0.06727479, 0.6798133, 1, 1, 1, 1, 1,
0.58512, -1.284701, 3.413753, 1, 1, 1, 1, 1,
0.5894814, 1.001701, 0.5129836, 1, 1, 1, 1, 1,
0.5923477, -0.9294745, 1.566621, 1, 1, 1, 1, 1,
0.5928126, -0.8329437, 3.603722, 1, 1, 1, 1, 1,
0.5962574, -0.1114561, 1.685354, 1, 1, 1, 1, 1,
0.5984312, 1.877406, 0.822944, 1, 1, 1, 1, 1,
0.6014183, 0.497704, 1.539406, 0, 0, 1, 1, 1,
0.6049863, 0.5136588, -0.240607, 1, 0, 0, 1, 1,
0.6109454, -0.8473774, 3.797198, 1, 0, 0, 1, 1,
0.6119806, -1.196349, 2.503289, 1, 0, 0, 1, 1,
0.6129083, -1.135754, 3.185909, 1, 0, 0, 1, 1,
0.6163, -0.7817987, 3.482584, 1, 0, 0, 1, 1,
0.6198744, -0.3364184, 2.306737, 0, 0, 0, 1, 1,
0.6199892, -0.6612844, 2.892143, 0, 0, 0, 1, 1,
0.6234837, 0.7105117, 0.4804252, 0, 0, 0, 1, 1,
0.6255879, -0.0485737, 0.2451544, 0, 0, 0, 1, 1,
0.6269129, -0.2277094, 1.736214, 0, 0, 0, 1, 1,
0.6304637, 0.9824907, 1.24806, 0, 0, 0, 1, 1,
0.6501475, 1.123675, 1.289968, 0, 0, 0, 1, 1,
0.6515288, -0.4768491, 2.596153, 1, 1, 1, 1, 1,
0.6581708, 0.7526367, 0.1871895, 1, 1, 1, 1, 1,
0.6588046, -0.3369327, 1.429979, 1, 1, 1, 1, 1,
0.660894, -1.585371, 2.273833, 1, 1, 1, 1, 1,
0.669999, 0.1303886, 1.199721, 1, 1, 1, 1, 1,
0.6746591, -0.6798651, 0.9788425, 1, 1, 1, 1, 1,
0.6753682, 0.2262102, 1.088547, 1, 1, 1, 1, 1,
0.6791104, -0.5237405, 2.263792, 1, 1, 1, 1, 1,
0.6794402, -0.8119202, 2.407148, 1, 1, 1, 1, 1,
0.6866131, 1.987584, -0.2930395, 1, 1, 1, 1, 1,
0.6928512, -2.508785, 3.004261, 1, 1, 1, 1, 1,
0.6990632, 0.0681349, 1.362017, 1, 1, 1, 1, 1,
0.699183, 0.5320098, 2.261275, 1, 1, 1, 1, 1,
0.6992577, 0.1221129, 0.1118815, 1, 1, 1, 1, 1,
0.7063153, 0.5199792, 1.043808, 1, 1, 1, 1, 1,
0.7067144, 0.8740224, 2.055211, 0, 0, 1, 1, 1,
0.7164824, 1.212042, 1.817209, 1, 0, 0, 1, 1,
0.7224182, 1.622339, -0.8324183, 1, 0, 0, 1, 1,
0.7228228, -0.495653, 2.307172, 1, 0, 0, 1, 1,
0.7238619, -0.9274988, 2.835761, 1, 0, 0, 1, 1,
0.7238787, -0.4970178, 0.8696598, 1, 0, 0, 1, 1,
0.7246318, -0.02915858, -0.7306018, 0, 0, 0, 1, 1,
0.7290393, 0.7035624, -0.4323718, 0, 0, 0, 1, 1,
0.7308038, 0.767116, 1.178941, 0, 0, 0, 1, 1,
0.7341881, -0.673754, 2.578996, 0, 0, 0, 1, 1,
0.7376197, -3.903097, 3.397366, 0, 0, 0, 1, 1,
0.7391479, 0.7991089, 2.645062, 0, 0, 0, 1, 1,
0.743383, 0.4764659, 1.392879, 0, 0, 0, 1, 1,
0.7509561, 1.421796, 2.528558, 1, 1, 1, 1, 1,
0.7529703, -0.8926118, 2.131586, 1, 1, 1, 1, 1,
0.7547565, -2.741692, 3.361313, 1, 1, 1, 1, 1,
0.7560122, 0.08284963, 1.20656, 1, 1, 1, 1, 1,
0.7566268, 1.460141, 0.3765362, 1, 1, 1, 1, 1,
0.7601141, -1.346342, 3.119992, 1, 1, 1, 1, 1,
0.7635281, 0.276489, 1.024603, 1, 1, 1, 1, 1,
0.7639557, 2.214871, 1.670621, 1, 1, 1, 1, 1,
0.7702326, 0.7853549, 1.946367, 1, 1, 1, 1, 1,
0.7702798, -2.826794, 2.523745, 1, 1, 1, 1, 1,
0.77288, -2.270176, 3.714301, 1, 1, 1, 1, 1,
0.7752517, 0.289083, 1.266616, 1, 1, 1, 1, 1,
0.776937, 1.179731, 0.02527508, 1, 1, 1, 1, 1,
0.7781728, 0.4294297, 0.4145247, 1, 1, 1, 1, 1,
0.7908416, -0.3020425, 2.55653, 1, 1, 1, 1, 1,
0.792232, -1.262382, 2.952839, 0, 0, 1, 1, 1,
0.7993271, -2.225353, 2.912894, 1, 0, 0, 1, 1,
0.7993979, 0.4566637, 0.1605849, 1, 0, 0, 1, 1,
0.8000806, -1.236235, 2.277709, 1, 0, 0, 1, 1,
0.8006186, 0.8045503, 2.070164, 1, 0, 0, 1, 1,
0.8055275, 1.583008, 0.4247832, 1, 0, 0, 1, 1,
0.8083207, 2.164906, -0.7694112, 0, 0, 0, 1, 1,
0.8122365, -0.7905869, 3.015124, 0, 0, 0, 1, 1,
0.8127986, 0.5982614, 0.2507142, 0, 0, 0, 1, 1,
0.8181044, -0.7799814, 4.162543, 0, 0, 0, 1, 1,
0.8236553, 0.6864561, 0.6930942, 0, 0, 0, 1, 1,
0.8301905, -0.2682346, 0.8915833, 0, 0, 0, 1, 1,
0.8350163, -1.136282, 3.146097, 0, 0, 0, 1, 1,
0.8406587, -1.321823, 2.773324, 1, 1, 1, 1, 1,
0.8414473, 1.018734, 0.5154452, 1, 1, 1, 1, 1,
0.8453699, -0.3709372, 5.435123, 1, 1, 1, 1, 1,
0.8457842, 0.6450843, 0.4073555, 1, 1, 1, 1, 1,
0.8482497, 1.724527, -0.02811168, 1, 1, 1, 1, 1,
0.8541558, -0.2120685, 3.584627, 1, 1, 1, 1, 1,
0.8624981, -0.4858151, 2.058884, 1, 1, 1, 1, 1,
0.866539, -2.48219, 2.302263, 1, 1, 1, 1, 1,
0.8736444, -0.4753671, 3.026838, 1, 1, 1, 1, 1,
0.8755502, 1.460502, 0.3613963, 1, 1, 1, 1, 1,
0.8786443, -1.869821, 2.721726, 1, 1, 1, 1, 1,
0.8801892, 0.831859, 0.9564404, 1, 1, 1, 1, 1,
0.8819994, 0.1044322, 1.467681, 1, 1, 1, 1, 1,
0.882207, 0.6425452, 1.575345, 1, 1, 1, 1, 1,
0.8915334, -0.8702845, 2.03906, 1, 1, 1, 1, 1,
0.8926411, 0.01791443, 2.430058, 0, 0, 1, 1, 1,
0.9009936, -0.6148368, 1.499274, 1, 0, 0, 1, 1,
0.9058845, -0.4137354, 0.4654715, 1, 0, 0, 1, 1,
0.9078199, -1.226975, 2.352676, 1, 0, 0, 1, 1,
0.9152909, -0.8256088, 1.280027, 1, 0, 0, 1, 1,
0.9167854, -1.375518, 3.422851, 1, 0, 0, 1, 1,
0.928053, 1.116137, -1.605464, 0, 0, 0, 1, 1,
0.9357088, 0.6707117, 1.205334, 0, 0, 0, 1, 1,
0.9402148, -0.9208273, 2.038697, 0, 0, 0, 1, 1,
0.9403994, -1.221929, 2.925657, 0, 0, 0, 1, 1,
0.9412259, -0.6816143, 2.651948, 0, 0, 0, 1, 1,
0.9419408, -0.3107817, 1.625145, 0, 0, 0, 1, 1,
0.9695414, 0.2864693, 1.187252, 0, 0, 0, 1, 1,
0.971245, 0.07322761, 1.313577, 1, 1, 1, 1, 1,
0.9772359, 1.562545, 1.420961, 1, 1, 1, 1, 1,
0.9779548, -0.7283124, 3.390281, 1, 1, 1, 1, 1,
0.9798341, 1.107543, 3.007007, 1, 1, 1, 1, 1,
0.9812371, 2.101027, 0.04645516, 1, 1, 1, 1, 1,
0.9814209, -0.2376852, 2.05568, 1, 1, 1, 1, 1,
0.9875481, 0.08592681, 1.098848, 1, 1, 1, 1, 1,
0.9886964, -0.04331287, 1.98001, 1, 1, 1, 1, 1,
0.9888226, -0.200927, 1.611644, 1, 1, 1, 1, 1,
0.9925069, -1.376291, 0.8029123, 1, 1, 1, 1, 1,
0.9931873, -0.2699684, -0.2661642, 1, 1, 1, 1, 1,
0.9957091, -0.01370266, 1.847095, 1, 1, 1, 1, 1,
1.005672, -1.809464, 2.765023, 1, 1, 1, 1, 1,
1.006024, 0.2256177, 2.099188, 1, 1, 1, 1, 1,
1.009149, 1.349986, -0.2851427, 1, 1, 1, 1, 1,
1.0103, -0.02326852, 0.5567723, 0, 0, 1, 1, 1,
1.01869, -0.2072571, 1.589093, 1, 0, 0, 1, 1,
1.027843, 0.06153362, 1.776334, 1, 0, 0, 1, 1,
1.029624, 0.9752263, 0.5218499, 1, 0, 0, 1, 1,
1.030957, 0.2698558, 2.285986, 1, 0, 0, 1, 1,
1.035212, -1.157924, 2.635562, 1, 0, 0, 1, 1,
1.04364, 0.4817601, 0.3492473, 0, 0, 0, 1, 1,
1.049688, 1.555215, 0.4963968, 0, 0, 0, 1, 1,
1.053005, 0.6084077, 1.059587, 0, 0, 0, 1, 1,
1.057596, -0.3451976, 2.961167, 0, 0, 0, 1, 1,
1.059736, 1.718885, 0.8282604, 0, 0, 0, 1, 1,
1.063641, -1.265806, 1.738584, 0, 0, 0, 1, 1,
1.068456, 0.06378347, 1.411713, 0, 0, 0, 1, 1,
1.070032, 0.1764476, 0.6710565, 1, 1, 1, 1, 1,
1.070365, 2.56611, 2.202241, 1, 1, 1, 1, 1,
1.071418, 1.604163, 0.2761991, 1, 1, 1, 1, 1,
1.074937, -0.3413144, 2.345649, 1, 1, 1, 1, 1,
1.077748, 0.1985587, 2.778447, 1, 1, 1, 1, 1,
1.083221, -1.206689, 1.795694, 1, 1, 1, 1, 1,
1.083988, 1.129593, 2.507549, 1, 1, 1, 1, 1,
1.084779, -0.4947559, 1.497972, 1, 1, 1, 1, 1,
1.087022, 0.5940101, 1.815479, 1, 1, 1, 1, 1,
1.112324, 0.3787045, 1.822971, 1, 1, 1, 1, 1,
1.113915, -0.8158898, 0.07827253, 1, 1, 1, 1, 1,
1.118344, 0.2277883, -0.477767, 1, 1, 1, 1, 1,
1.120826, 1.002347, 0.1660677, 1, 1, 1, 1, 1,
1.123399, -1.591749, 1.975043, 1, 1, 1, 1, 1,
1.123718, 0.3615945, 0.8695772, 1, 1, 1, 1, 1,
1.12548, 1.012144, 0.5953198, 0, 0, 1, 1, 1,
1.128351, -0.9629911, 1.888905, 1, 0, 0, 1, 1,
1.128922, -0.4773104, 1.708322, 1, 0, 0, 1, 1,
1.130729, -0.7506387, 1.532335, 1, 0, 0, 1, 1,
1.134774, -0.7489798, 2.947067, 1, 0, 0, 1, 1,
1.134852, -0.4449955, 2.094995, 1, 0, 0, 1, 1,
1.137767, -0.3857553, 1.91514, 0, 0, 0, 1, 1,
1.14447, -1.374538, 3.075653, 0, 0, 0, 1, 1,
1.14577, 0.8798798, 0.2418316, 0, 0, 0, 1, 1,
1.146791, -1.419699, 2.266987, 0, 0, 0, 1, 1,
1.156412, 0.4630027, 1.255595, 0, 0, 0, 1, 1,
1.162814, -1.577639, 2.654538, 0, 0, 0, 1, 1,
1.167749, -0.2565525, 2.492007, 0, 0, 0, 1, 1,
1.168807, -0.5204876, 2.622486, 1, 1, 1, 1, 1,
1.175376, 1.209611, 0.8239734, 1, 1, 1, 1, 1,
1.177263, 0.8403224, 1.705271, 1, 1, 1, 1, 1,
1.188404, -0.6202069, 3.620175, 1, 1, 1, 1, 1,
1.21294, 0.5310331, 0.05180452, 1, 1, 1, 1, 1,
1.213165, 0.6209091, 0.1088032, 1, 1, 1, 1, 1,
1.214271, -0.3486654, 2.699222, 1, 1, 1, 1, 1,
1.224894, -0.8247302, 1.278729, 1, 1, 1, 1, 1,
1.235226, -1.514422, 3.887529, 1, 1, 1, 1, 1,
1.237614, -1.803339, 2.986498, 1, 1, 1, 1, 1,
1.23807, 1.751198, 0.4056318, 1, 1, 1, 1, 1,
1.238897, -2.565417, 3.960979, 1, 1, 1, 1, 1,
1.240908, 0.4800349, 2.27803, 1, 1, 1, 1, 1,
1.248375, -1.054273, 0.8678119, 1, 1, 1, 1, 1,
1.248445, 1.02788, -0.3353802, 1, 1, 1, 1, 1,
1.248899, -1.814361, 2.547253, 0, 0, 1, 1, 1,
1.254884, -1.041072, 3.145379, 1, 0, 0, 1, 1,
1.259547, 1.867522, -0.118389, 1, 0, 0, 1, 1,
1.27036, 0.4140721, 0.5686006, 1, 0, 0, 1, 1,
1.272251, 1.205845, 0.3313911, 1, 0, 0, 1, 1,
1.28472, 0.9036583, 0.1279074, 1, 0, 0, 1, 1,
1.289787, 0.5825904, 1.392626, 0, 0, 0, 1, 1,
1.294309, -0.2813016, 2.295467, 0, 0, 0, 1, 1,
1.296519, 0.4748769, 2.777109, 0, 0, 0, 1, 1,
1.300697, -0.3213229, 2.636895, 0, 0, 0, 1, 1,
1.307646, -0.05924255, 1.965284, 0, 0, 0, 1, 1,
1.316052, -1.686738, 3.540235, 0, 0, 0, 1, 1,
1.320509, 0.8763529, 0.05349489, 0, 0, 0, 1, 1,
1.32309, 0.4171117, 1.729236, 1, 1, 1, 1, 1,
1.328068, -1.058407, 2.990091, 1, 1, 1, 1, 1,
1.350748, 0.6048092, -0.03576479, 1, 1, 1, 1, 1,
1.359303, 0.7208031, 1.169773, 1, 1, 1, 1, 1,
1.371122, 0.7477946, 1.224244, 1, 1, 1, 1, 1,
1.37628, 0.9178327, 1.666027, 1, 1, 1, 1, 1,
1.380706, -1.183277, 2.032751, 1, 1, 1, 1, 1,
1.382917, 2.037096, -0.1034832, 1, 1, 1, 1, 1,
1.388705, 1.035268, 1.120897, 1, 1, 1, 1, 1,
1.392789, -0.6181818, 1.544683, 1, 1, 1, 1, 1,
1.396766, -0.6604571, 1.613569, 1, 1, 1, 1, 1,
1.401302, -1.042865, 1.34251, 1, 1, 1, 1, 1,
1.407036, -2.196919, 2.589752, 1, 1, 1, 1, 1,
1.421644, 1.182907, 1.23664, 1, 1, 1, 1, 1,
1.423978, -0.2647798, 2.296676, 1, 1, 1, 1, 1,
1.43781, 0.2720648, 1.187188, 0, 0, 1, 1, 1,
1.439267, 0.628786, 2.054532, 1, 0, 0, 1, 1,
1.440539, -2.0704, 3.975242, 1, 0, 0, 1, 1,
1.440565, -0.2993711, 1.926391, 1, 0, 0, 1, 1,
1.451941, 0.8008159, 0.3787692, 1, 0, 0, 1, 1,
1.453285, 1.043851, 1.137541, 1, 0, 0, 1, 1,
1.461775, 0.8230944, 2.843595, 0, 0, 0, 1, 1,
1.46429, 0.625828, 0.2272665, 0, 0, 0, 1, 1,
1.468363, 0.0578432, 0.8911367, 0, 0, 0, 1, 1,
1.474199, -0.1128486, -0.2900045, 0, 0, 0, 1, 1,
1.484235, -0.6181715, 0.9675395, 0, 0, 0, 1, 1,
1.498109, -0.8147915, 4.858535, 0, 0, 0, 1, 1,
1.499421, 0.7280495, 2.158263, 0, 0, 0, 1, 1,
1.502046, 0.2230378, 3.133239, 1, 1, 1, 1, 1,
1.51735, 0.7144856, 2.306611, 1, 1, 1, 1, 1,
1.521154, 1.471902, 0.9029379, 1, 1, 1, 1, 1,
1.529538, -0.1643275, 2.657039, 1, 1, 1, 1, 1,
1.532676, -0.4419131, 4.024179, 1, 1, 1, 1, 1,
1.538862, -1.139285, 3.094398, 1, 1, 1, 1, 1,
1.555076, -0.8207338, 2.381065, 1, 1, 1, 1, 1,
1.555114, -0.6827626, 1.260484, 1, 1, 1, 1, 1,
1.55712, 1.654301, 0.2311724, 1, 1, 1, 1, 1,
1.568886, 0.3911858, 0.6691369, 1, 1, 1, 1, 1,
1.610214, 0.362518, 0.5737383, 1, 1, 1, 1, 1,
1.62064, 0.4297165, 0.3144964, 1, 1, 1, 1, 1,
1.650964, -0.792011, 0.8013105, 1, 1, 1, 1, 1,
1.679868, 1.045368, 0.5031796, 1, 1, 1, 1, 1,
1.686603, -2.118731, 1.084267, 1, 1, 1, 1, 1,
1.687073, -0.2369941, 1.816123, 0, 0, 1, 1, 1,
1.709564, 0.9638385, 1.454536, 1, 0, 0, 1, 1,
1.715209, 0.239728, 1.400096, 1, 0, 0, 1, 1,
1.726114, -1.269673, 2.938073, 1, 0, 0, 1, 1,
1.736014, 0.2788401, 2.637484, 1, 0, 0, 1, 1,
1.762699, 0.3483165, 2.928421, 1, 0, 0, 1, 1,
1.772962, -2.419194, 2.318225, 0, 0, 0, 1, 1,
1.781751, -0.6953717, 2.833546, 0, 0, 0, 1, 1,
1.783386, -0.668872, 0.5303279, 0, 0, 0, 1, 1,
1.796225, -0.8223549, 1.879842, 0, 0, 0, 1, 1,
1.797596, -0.3562081, 2.924796, 0, 0, 0, 1, 1,
1.809035, -1.850613, 1.245746, 0, 0, 0, 1, 1,
1.822968, 0.1194138, 1.362141, 0, 0, 0, 1, 1,
1.875363, -1.218408, 0.6064315, 1, 1, 1, 1, 1,
1.882307, 1.594087, 1.223968, 1, 1, 1, 1, 1,
1.900961, -1.790471, 1.897949, 1, 1, 1, 1, 1,
1.905547, 0.4252174, 0.8081822, 1, 1, 1, 1, 1,
1.914572, 1.149472, 2.166711, 1, 1, 1, 1, 1,
1.967608, -0.4837622, 2.646651, 1, 1, 1, 1, 1,
1.996047, 0.6078361, 1.084579, 1, 1, 1, 1, 1,
1.996504, -0.2129398, 2.989853, 1, 1, 1, 1, 1,
2.012227, 0.2668905, 2.316325, 1, 1, 1, 1, 1,
2.024108, 0.4489164, -0.4635414, 1, 1, 1, 1, 1,
2.03076, -0.6305864, 1.29337, 1, 1, 1, 1, 1,
2.038252, 1.260982, 0.8459083, 1, 1, 1, 1, 1,
2.058521, -1.056879, 1.322156, 1, 1, 1, 1, 1,
2.067431, 0.821657, 0.7186301, 1, 1, 1, 1, 1,
2.090203, -0.2290146, 1.386406, 1, 1, 1, 1, 1,
2.10002, 0.9739969, 1.203213, 0, 0, 1, 1, 1,
2.10122, 1.490163, 0.480776, 1, 0, 0, 1, 1,
2.120873, 0.4558512, -1.440133, 1, 0, 0, 1, 1,
2.138189, 1.397, 1.529635, 1, 0, 0, 1, 1,
2.15544, 2.588495, 0.6936108, 1, 0, 0, 1, 1,
2.191877, 0.5345311, 0.08949941, 1, 0, 0, 1, 1,
2.200733, -0.1413361, 0.9960526, 0, 0, 0, 1, 1,
2.220786, -0.3808664, 2.049893, 0, 0, 0, 1, 1,
2.229546, -0.8601251, 1.621742, 0, 0, 0, 1, 1,
2.267778, 0.9915535, 0.7918879, 0, 0, 0, 1, 1,
2.289426, 0.4941217, 2.027669, 0, 0, 0, 1, 1,
2.307067, -1.265619, 2.522017, 0, 0, 0, 1, 1,
2.310562, 0.5382457, -0.223505, 0, 0, 0, 1, 1,
2.35826, 0.08091211, 1.157506, 1, 1, 1, 1, 1,
2.442208, 0.02550788, 1.766917, 1, 1, 1, 1, 1,
2.5038, -0.2601217, 2.769202, 1, 1, 1, 1, 1,
2.525167, -0.01901121, 1.550428, 1, 1, 1, 1, 1,
2.552921, 0.8587813, 0.03608819, 1, 1, 1, 1, 1,
2.634102, -0.9144352, 1.705753, 1, 1, 1, 1, 1,
3.133166, 0.3816445, 0.08452028, 1, 1, 1, 1, 1
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
var radius = 9.513059;
var distance = 33.41422;
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
mvMatrix.translate( -0.1291388, 0.3135116, -0.2954619 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41422);
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
