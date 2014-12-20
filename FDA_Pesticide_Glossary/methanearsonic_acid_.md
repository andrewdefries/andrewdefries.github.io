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
-3.557191, -1.248607, -2.473607, 1, 0, 0, 1,
-2.704683, 1.976892, -1.363323, 1, 0.007843138, 0, 1,
-2.68415, -0.6038514, -0.9459174, 1, 0.01176471, 0, 1,
-2.673358, 1.296514, -2.945553, 1, 0.01960784, 0, 1,
-2.645982, -1.645043, -1.985977, 1, 0.02352941, 0, 1,
-2.609301, 0.9130487, -1.666827, 1, 0.03137255, 0, 1,
-2.553513, 1.790741, -2.082598, 1, 0.03529412, 0, 1,
-2.481142, 0.9012212, 0.5942308, 1, 0.04313726, 0, 1,
-2.436923, -0.9135186, 0.7998243, 1, 0.04705882, 0, 1,
-2.41289, 1.011452, -3.861312, 1, 0.05490196, 0, 1,
-2.320706, 1.104356, -1.048737, 1, 0.05882353, 0, 1,
-2.263452, -0.03856025, -2.639833, 1, 0.06666667, 0, 1,
-2.21359, 0.2641132, -0.5377157, 1, 0.07058824, 0, 1,
-2.18561, 0.8445471, -1.38237, 1, 0.07843138, 0, 1,
-2.178788, 0.9893335, -3.864335, 1, 0.08235294, 0, 1,
-2.1777, 1.119134, -2.237218, 1, 0.09019608, 0, 1,
-2.158843, 0.8855063, 0.651642, 1, 0.09411765, 0, 1,
-2.147942, -0.7332042, -2.562609, 1, 0.1019608, 0, 1,
-2.114311, -2.904333, -3.456279, 1, 0.1098039, 0, 1,
-2.109983, 0.5023631, -1.583535, 1, 0.1137255, 0, 1,
-2.096114, 0.4111207, -2.647981, 1, 0.1215686, 0, 1,
-2.057945, -0.1891167, -2.361096, 1, 0.1254902, 0, 1,
-2.021673, 1.346055, 0.9742119, 1, 0.1333333, 0, 1,
-2.020165, -2.075108, -3.780352, 1, 0.1372549, 0, 1,
-2.018535, 0.04976176, -2.613787, 1, 0.145098, 0, 1,
-1.95414, 1.234712, -1.147167, 1, 0.1490196, 0, 1,
-1.951971, 0.5362073, -0.1521356, 1, 0.1568628, 0, 1,
-1.944797, 0.4727708, -1.875367, 1, 0.1607843, 0, 1,
-1.926195, 1.507442, -1.018674, 1, 0.1686275, 0, 1,
-1.902552, 0.4616012, 0.8015129, 1, 0.172549, 0, 1,
-1.89769, -0.8746329, -0.7809253, 1, 0.1803922, 0, 1,
-1.877693, -0.3908738, -2.143771, 1, 0.1843137, 0, 1,
-1.846508, -0.6452348, -2.195116, 1, 0.1921569, 0, 1,
-1.821634, 0.4538504, -0.8676054, 1, 0.1960784, 0, 1,
-1.814654, -0.1891813, -3.401431, 1, 0.2039216, 0, 1,
-1.810658, 0.7055418, -1.54714, 1, 0.2117647, 0, 1,
-1.801148, -2.106959, -0.7243624, 1, 0.2156863, 0, 1,
-1.79284, 0.2728058, 0.2071059, 1, 0.2235294, 0, 1,
-1.79133, -0.2783045, -3.07828, 1, 0.227451, 0, 1,
-1.781508, 1.680044, 0.1798059, 1, 0.2352941, 0, 1,
-1.778982, 1.276635, -1.280264, 1, 0.2392157, 0, 1,
-1.773545, 0.1680928, -1.025069, 1, 0.2470588, 0, 1,
-1.773428, -1.279608, -2.300999, 1, 0.2509804, 0, 1,
-1.753904, -0.7713165, -1.236242, 1, 0.2588235, 0, 1,
-1.750143, -0.2184846, 0.225286, 1, 0.2627451, 0, 1,
-1.747314, -0.8983698, -3.640512, 1, 0.2705882, 0, 1,
-1.747275, 0.4761406, -1.397048, 1, 0.2745098, 0, 1,
-1.744973, -0.4388734, -2.059377, 1, 0.282353, 0, 1,
-1.709393, 2.011334, -2.401554, 1, 0.2862745, 0, 1,
-1.681294, -1.018477, -1.178956, 1, 0.2941177, 0, 1,
-1.678255, 0.5980101, -0.1039883, 1, 0.3019608, 0, 1,
-1.674623, 0.4054841, -0.002851909, 1, 0.3058824, 0, 1,
-1.652281, -1.161755, -1.455787, 1, 0.3137255, 0, 1,
-1.650434, 1.184481, -1.68391, 1, 0.3176471, 0, 1,
-1.638116, 2.341905, 0.1394576, 1, 0.3254902, 0, 1,
-1.609986, 0.2244679, -2.877984, 1, 0.3294118, 0, 1,
-1.595324, -1.694148, -2.749414, 1, 0.3372549, 0, 1,
-1.581653, -0.7992187, -1.508323, 1, 0.3411765, 0, 1,
-1.581578, -0.4349349, -3.080064, 1, 0.3490196, 0, 1,
-1.570506, 0.4942586, -3.181578, 1, 0.3529412, 0, 1,
-1.566815, -0.3441257, -2.230302, 1, 0.3607843, 0, 1,
-1.550564, -0.2788209, -1.668329, 1, 0.3647059, 0, 1,
-1.544933, 1.034441, 0.4136478, 1, 0.372549, 0, 1,
-1.515367, 0.2451108, 0.6551335, 1, 0.3764706, 0, 1,
-1.514067, -0.5739843, -0.9844801, 1, 0.3843137, 0, 1,
-1.490387, -0.1630044, -2.131213, 1, 0.3882353, 0, 1,
-1.474234, 0.8188113, -0.4951862, 1, 0.3960784, 0, 1,
-1.465395, -1.349639, -0.5964481, 1, 0.4039216, 0, 1,
-1.461085, 0.2549095, -0.3949948, 1, 0.4078431, 0, 1,
-1.459863, 0.1036577, -1.721147, 1, 0.4156863, 0, 1,
-1.458974, 0.6017908, 0.9762808, 1, 0.4196078, 0, 1,
-1.45858, -0.2298228, -2.112498, 1, 0.427451, 0, 1,
-1.456197, 2.012216, -1.26784, 1, 0.4313726, 0, 1,
-1.452041, -0.2576435, -2.46206, 1, 0.4392157, 0, 1,
-1.431956, -0.2896485, -1.543524, 1, 0.4431373, 0, 1,
-1.431244, 0.1727673, -1.115839, 1, 0.4509804, 0, 1,
-1.402484, 0.1186934, -2.381832, 1, 0.454902, 0, 1,
-1.402271, -0.5850099, -2.602066, 1, 0.4627451, 0, 1,
-1.394333, 1.503024, 0.1040289, 1, 0.4666667, 0, 1,
-1.392886, -0.3204266, -2.174854, 1, 0.4745098, 0, 1,
-1.389416, -1.759559, -3.541534, 1, 0.4784314, 0, 1,
-1.386531, 0.2030515, -3.678337, 1, 0.4862745, 0, 1,
-1.377826, 0.08202391, -1.636911, 1, 0.4901961, 0, 1,
-1.37443, 1.735922, 0.5917864, 1, 0.4980392, 0, 1,
-1.36408, 0.4289932, -1.281846, 1, 0.5058824, 0, 1,
-1.360952, 0.4104583, -1.780157, 1, 0.509804, 0, 1,
-1.355823, 1.282874, 0.7856536, 1, 0.5176471, 0, 1,
-1.349732, 0.2086461, -1.771998, 1, 0.5215687, 0, 1,
-1.349397, 0.4183128, -0.498634, 1, 0.5294118, 0, 1,
-1.348031, 1.155277, -2.302814, 1, 0.5333334, 0, 1,
-1.347802, 0.1411863, -1.383852, 1, 0.5411765, 0, 1,
-1.337758, 0.3987921, 0.04469778, 1, 0.5450981, 0, 1,
-1.331604, -0.6173584, -2.835032, 1, 0.5529412, 0, 1,
-1.327657, 0.3756408, -0.653138, 1, 0.5568628, 0, 1,
-1.323831, -0.2330128, -1.306482, 1, 0.5647059, 0, 1,
-1.315625, 0.05482886, -0.5370365, 1, 0.5686275, 0, 1,
-1.310356, 0.8071768, 0.8611152, 1, 0.5764706, 0, 1,
-1.309663, 0.6921417, 0.2040952, 1, 0.5803922, 0, 1,
-1.3047, -0.7330366, -3.210174, 1, 0.5882353, 0, 1,
-1.301699, 1.299968, -1.29154, 1, 0.5921569, 0, 1,
-1.29424, -0.4215671, -2.350994, 1, 0.6, 0, 1,
-1.292498, 1.543918, -1.44503, 1, 0.6078432, 0, 1,
-1.282275, 0.6603654, -0.01383922, 1, 0.6117647, 0, 1,
-1.273507, 0.6211947, -0.6248834, 1, 0.6196079, 0, 1,
-1.263797, 0.4883983, -1.356699, 1, 0.6235294, 0, 1,
-1.246422, 0.5857368, -0.7338291, 1, 0.6313726, 0, 1,
-1.240326, 0.6412981, -1.629023, 1, 0.6352941, 0, 1,
-1.239921, 0.8797495, -0.9096318, 1, 0.6431373, 0, 1,
-1.23956, 0.258653, 0.06119357, 1, 0.6470588, 0, 1,
-1.23062, 0.1096643, -1.819972, 1, 0.654902, 0, 1,
-1.215876, 0.629663, -1.534016, 1, 0.6588235, 0, 1,
-1.213955, 0.4623135, -1.948927, 1, 0.6666667, 0, 1,
-1.212769, -0.09858379, -0.8674176, 1, 0.6705883, 0, 1,
-1.209561, -0.8566206, -0.9784532, 1, 0.6784314, 0, 1,
-1.206539, -0.05555683, -1.405015, 1, 0.682353, 0, 1,
-1.202071, 2.117736, -0.4419719, 1, 0.6901961, 0, 1,
-1.201957, 0.8478844, -1.505063, 1, 0.6941177, 0, 1,
-1.197057, -0.05281546, -2.574907, 1, 0.7019608, 0, 1,
-1.191041, -0.8034433, -1.836705, 1, 0.7098039, 0, 1,
-1.189507, 0.4048527, -1.222336, 1, 0.7137255, 0, 1,
-1.185651, 0.8340541, -0.1929876, 1, 0.7215686, 0, 1,
-1.182453, -1.686879, -2.080358, 1, 0.7254902, 0, 1,
-1.18212, 0.6080716, -1.633484, 1, 0.7333333, 0, 1,
-1.179973, -0.02698154, -2.114978, 1, 0.7372549, 0, 1,
-1.179012, 0.3472705, -1.097722, 1, 0.7450981, 0, 1,
-1.159663, 0.1909575, -1.514351, 1, 0.7490196, 0, 1,
-1.158798, 0.1805479, -2.324709, 1, 0.7568628, 0, 1,
-1.153288, -0.04074591, -2.955158, 1, 0.7607843, 0, 1,
-1.142584, 0.3229408, -1.626774, 1, 0.7686275, 0, 1,
-1.141891, 0.1961685, -1.097172, 1, 0.772549, 0, 1,
-1.136507, -1.423333, -1.969502, 1, 0.7803922, 0, 1,
-1.133776, 0.4618301, -0.8800849, 1, 0.7843137, 0, 1,
-1.129418, 0.3264356, -1.817385, 1, 0.7921569, 0, 1,
-1.124382, 1.595987, 0.3058757, 1, 0.7960784, 0, 1,
-1.124346, -1.433315, -3.460628, 1, 0.8039216, 0, 1,
-1.12069, -0.01263961, -1.301898, 1, 0.8117647, 0, 1,
-1.115981, -1.246945, -2.089397, 1, 0.8156863, 0, 1,
-1.112258, 0.3384435, 0.1925069, 1, 0.8235294, 0, 1,
-1.112016, 0.9605092, -0.7977743, 1, 0.827451, 0, 1,
-1.110046, -0.987457, -2.338664, 1, 0.8352941, 0, 1,
-1.108966, 1.472655, -0.4528512, 1, 0.8392157, 0, 1,
-1.100718, -1.22149, -3.069538, 1, 0.8470588, 0, 1,
-1.099448, -0.5040206, -2.895535, 1, 0.8509804, 0, 1,
-1.09606, -0.8628697, -1.85065, 1, 0.8588235, 0, 1,
-1.095156, -1.141922, -4.475008, 1, 0.8627451, 0, 1,
-1.094328, 0.1601566, -1.777359, 1, 0.8705882, 0, 1,
-1.092102, -0.1284161, -0.7234141, 1, 0.8745098, 0, 1,
-1.09163, 1.347467, 0.7207885, 1, 0.8823529, 0, 1,
-1.08555, -1.184681, -2.751124, 1, 0.8862745, 0, 1,
-1.07782, 0.428288, -0.4683178, 1, 0.8941177, 0, 1,
-1.065748, 1.006886, -1.012975, 1, 0.8980392, 0, 1,
-1.057834, -0.6034254, -1.031979, 1, 0.9058824, 0, 1,
-1.05702, -0.7979529, -3.097751, 1, 0.9137255, 0, 1,
-1.054052, -0.7410595, -1.043471, 1, 0.9176471, 0, 1,
-1.049086, -0.2542405, -1.883443, 1, 0.9254902, 0, 1,
-1.048381, 0.004799138, -2.084328, 1, 0.9294118, 0, 1,
-1.048321, -0.5073966, -2.036464, 1, 0.9372549, 0, 1,
-1.047505, -1.052688, -3.83778, 1, 0.9411765, 0, 1,
-1.045072, 0.5183869, 2.267619, 1, 0.9490196, 0, 1,
-1.033058, -0.2966639, -1.266323, 1, 0.9529412, 0, 1,
-1.032391, -1.580705, -2.412689, 1, 0.9607843, 0, 1,
-1.030342, 0.03663505, -1.29896, 1, 0.9647059, 0, 1,
-1.011183, -1.375463, -3.830606, 1, 0.972549, 0, 1,
-1.011, -0.5707452, -1.688525, 1, 0.9764706, 0, 1,
-1.008604, 0.363552, -0.2123363, 1, 0.9843137, 0, 1,
-1.007254, -2.653888, -0.3143489, 1, 0.9882353, 0, 1,
-1.00438, -2.534927, -1.808548, 1, 0.9960784, 0, 1,
-1.003608, -0.7009675, -0.5886125, 0.9960784, 1, 0, 1,
-1.003284, 2.347293, 0.260051, 0.9921569, 1, 0, 1,
-1.003065, -0.1005965, 0.3070445, 0.9843137, 1, 0, 1,
-0.9928472, 0.6444261, -0.9067475, 0.9803922, 1, 0, 1,
-0.9913356, 0.1543868, -2.65665, 0.972549, 1, 0, 1,
-0.9897923, 0.1829166, -1.80698, 0.9686275, 1, 0, 1,
-0.9890323, -0.832134, -1.924011, 0.9607843, 1, 0, 1,
-0.9850147, 0.9841899, -1.345391, 0.9568627, 1, 0, 1,
-0.9767987, -1.390635, -2.458389, 0.9490196, 1, 0, 1,
-0.9764606, 0.7695989, 0.2658944, 0.945098, 1, 0, 1,
-0.9736777, 2.547225, -0.5601718, 0.9372549, 1, 0, 1,
-0.9725029, -0.2278222, -2.214625, 0.9333333, 1, 0, 1,
-0.9688544, 0.4071839, -0.1493215, 0.9254902, 1, 0, 1,
-0.962009, -1.670125, -1.343724, 0.9215686, 1, 0, 1,
-0.9535021, 0.34547, -1.13119, 0.9137255, 1, 0, 1,
-0.9521237, -1.297431, -2.33379, 0.9098039, 1, 0, 1,
-0.9467264, 0.6765499, -0.4163419, 0.9019608, 1, 0, 1,
-0.9434167, 0.8901783, -0.6786431, 0.8941177, 1, 0, 1,
-0.9361583, -1.437273, -3.963721, 0.8901961, 1, 0, 1,
-0.9198431, 0.8719354, -1.607715, 0.8823529, 1, 0, 1,
-0.9164559, 0.6398035, -2.18375, 0.8784314, 1, 0, 1,
-0.9123843, -0.4051093, -0.8243203, 0.8705882, 1, 0, 1,
-0.9001676, 0.7500144, -1.487813, 0.8666667, 1, 0, 1,
-0.89994, 0.5421802, -0.3526618, 0.8588235, 1, 0, 1,
-0.8995756, 0.6288503, -0.02848086, 0.854902, 1, 0, 1,
-0.8980699, 1.112358, -0.949015, 0.8470588, 1, 0, 1,
-0.8902724, -0.857483, -2.357208, 0.8431373, 1, 0, 1,
-0.8890885, -0.8321931, -2.705086, 0.8352941, 1, 0, 1,
-0.8874734, -1.014747, -2.036676, 0.8313726, 1, 0, 1,
-0.8845301, 1.598496, -1.75136, 0.8235294, 1, 0, 1,
-0.8806751, -0.4006383, 0.2119232, 0.8196079, 1, 0, 1,
-0.8752029, 1.04904, 0.3107345, 0.8117647, 1, 0, 1,
-0.8748258, -0.5613972, -2.089538, 0.8078431, 1, 0, 1,
-0.8745388, 0.5683361, -2.974429, 0.8, 1, 0, 1,
-0.8581181, -0.9976147, -2.674421, 0.7921569, 1, 0, 1,
-0.8556448, -1.068426, -3.343421, 0.7882353, 1, 0, 1,
-0.8545205, 0.1841439, -1.228121, 0.7803922, 1, 0, 1,
-0.8518177, 0.3301955, -0.5764156, 0.7764706, 1, 0, 1,
-0.8463253, -1.222815, -3.675606, 0.7686275, 1, 0, 1,
-0.8440363, -0.4205271, -2.794436, 0.7647059, 1, 0, 1,
-0.8416283, 0.8685705, -3.124333, 0.7568628, 1, 0, 1,
-0.8355119, 0.7983016, -3.505002, 0.7529412, 1, 0, 1,
-0.8350637, -0.5427833, -0.2212174, 0.7450981, 1, 0, 1,
-0.8313344, 1.498213, 1.39176, 0.7411765, 1, 0, 1,
-0.812672, 0.1111103, -2.842476, 0.7333333, 1, 0, 1,
-0.8038954, -0.9624709, -2.045262, 0.7294118, 1, 0, 1,
-0.7997808, -1.273495, -2.185833, 0.7215686, 1, 0, 1,
-0.7925456, 0.6335557, 0.5200783, 0.7176471, 1, 0, 1,
-0.7780433, -0.6919274, 0.221276, 0.7098039, 1, 0, 1,
-0.7776569, -0.8720562, -4.418692, 0.7058824, 1, 0, 1,
-0.7718055, 0.2192461, -2.430395, 0.6980392, 1, 0, 1,
-0.7680091, 3.330971, -1.383328, 0.6901961, 1, 0, 1,
-0.7619169, 1.203951, -0.2394431, 0.6862745, 1, 0, 1,
-0.7517084, -0.4479082, -2.594505, 0.6784314, 1, 0, 1,
-0.7484463, -1.266561, -2.517582, 0.6745098, 1, 0, 1,
-0.7475321, -1.028395, -2.674639, 0.6666667, 1, 0, 1,
-0.7464138, 1.071594, -0.1654032, 0.6627451, 1, 0, 1,
-0.7399368, -0.4543603, -2.554048, 0.654902, 1, 0, 1,
-0.7379155, 1.733121, -0.5957404, 0.6509804, 1, 0, 1,
-0.7338884, -0.5382985, -3.007402, 0.6431373, 1, 0, 1,
-0.7307838, -0.3386633, -0.3645972, 0.6392157, 1, 0, 1,
-0.729948, -0.7386044, -2.690725, 0.6313726, 1, 0, 1,
-0.7283856, 1.37807, 0.657587, 0.627451, 1, 0, 1,
-0.7262477, -0.5265957, -1.042944, 0.6196079, 1, 0, 1,
-0.7240751, 0.6808383, -1.216896, 0.6156863, 1, 0, 1,
-0.7153124, 1.908073, 0.1090503, 0.6078432, 1, 0, 1,
-0.7142393, 1.360916, 1.326553, 0.6039216, 1, 0, 1,
-0.7111335, 0.2812778, -1.466571, 0.5960785, 1, 0, 1,
-0.7098964, 0.1219466, -0.8925223, 0.5882353, 1, 0, 1,
-0.7081245, -0.6636951, -2.530036, 0.5843138, 1, 0, 1,
-0.7030083, 2.010153, 0.7549103, 0.5764706, 1, 0, 1,
-0.7023635, 1.406125, -2.370919, 0.572549, 1, 0, 1,
-0.7010139, -0.9072884, -3.544231, 0.5647059, 1, 0, 1,
-0.6948854, 0.2723766, -0.2107436, 0.5607843, 1, 0, 1,
-0.6874886, -1.391964, -4.011465, 0.5529412, 1, 0, 1,
-0.68573, -1.24387, -3.678475, 0.5490196, 1, 0, 1,
-0.6849584, -0.1690611, -2.672558, 0.5411765, 1, 0, 1,
-0.6845294, -0.8321587, -1.444215, 0.5372549, 1, 0, 1,
-0.683954, 0.2384181, -2.359454, 0.5294118, 1, 0, 1,
-0.6789846, 1.372987, -0.7676495, 0.5254902, 1, 0, 1,
-0.6760506, 0.04007123, 0.3625821, 0.5176471, 1, 0, 1,
-0.6702247, -0.5292523, -3.272317, 0.5137255, 1, 0, 1,
-0.6688217, -0.452305, -2.285633, 0.5058824, 1, 0, 1,
-0.6686715, 0.8044068, -2.408862, 0.5019608, 1, 0, 1,
-0.6685054, 1.328919, -0.647386, 0.4941176, 1, 0, 1,
-0.6605605, -0.3723798, -2.949169, 0.4862745, 1, 0, 1,
-0.6569315, 0.3530675, -1.595328, 0.4823529, 1, 0, 1,
-0.6503642, 1.77524, -0.03170455, 0.4745098, 1, 0, 1,
-0.6475478, 0.2570628, -1.882126, 0.4705882, 1, 0, 1,
-0.6473399, 0.3797492, 0.2323954, 0.4627451, 1, 0, 1,
-0.6462316, -0.4292348, -2.583302, 0.4588235, 1, 0, 1,
-0.6306139, 1.006197, -0.939285, 0.4509804, 1, 0, 1,
-0.6273115, 0.5056349, 0.3764877, 0.4470588, 1, 0, 1,
-0.6226273, -0.4336942, 0.1505386, 0.4392157, 1, 0, 1,
-0.6212053, -0.2418502, -1.658536, 0.4352941, 1, 0, 1,
-0.6186517, -0.1779426, -4.366814, 0.427451, 1, 0, 1,
-0.6136048, 1.039442, 0.7552375, 0.4235294, 1, 0, 1,
-0.6090932, -0.1212253, -2.254919, 0.4156863, 1, 0, 1,
-0.6073895, 0.5862855, -0.5207084, 0.4117647, 1, 0, 1,
-0.6069004, -0.3528669, -2.509014, 0.4039216, 1, 0, 1,
-0.6059464, 0.3035287, -0.2521432, 0.3960784, 1, 0, 1,
-0.6052766, -0.2012921, -2.236614, 0.3921569, 1, 0, 1,
-0.604508, 0.7428063, -1.481331, 0.3843137, 1, 0, 1,
-0.6016551, -0.4985484, -1.728904, 0.3803922, 1, 0, 1,
-0.5975125, 0.2387733, -1.730527, 0.372549, 1, 0, 1,
-0.597398, -0.3590056, -2.858591, 0.3686275, 1, 0, 1,
-0.5962422, 1.372747, 0.4542336, 0.3607843, 1, 0, 1,
-0.5954372, 0.03086066, -0.5927666, 0.3568628, 1, 0, 1,
-0.5932086, 2.981846, 0.9541125, 0.3490196, 1, 0, 1,
-0.5842762, -1.178402, -0.6174083, 0.345098, 1, 0, 1,
-0.5822181, 0.03148267, -0.1598398, 0.3372549, 1, 0, 1,
-0.5806351, -1.444219, -3.251124, 0.3333333, 1, 0, 1,
-0.5793282, -1.210188, -3.428608, 0.3254902, 1, 0, 1,
-0.5793088, 0.3202732, -2.33584, 0.3215686, 1, 0, 1,
-0.5716859, 0.09228291, 0.136273, 0.3137255, 1, 0, 1,
-0.5702561, 0.9141966, -0.4215859, 0.3098039, 1, 0, 1,
-0.5696023, 0.2873169, 0.1099389, 0.3019608, 1, 0, 1,
-0.5676782, -0.06293283, -0.3881134, 0.2941177, 1, 0, 1,
-0.5592405, -0.3288597, -1.391713, 0.2901961, 1, 0, 1,
-0.5586347, 1.956493, 0.1166212, 0.282353, 1, 0, 1,
-0.5586056, -0.1602763, -2.003105, 0.2784314, 1, 0, 1,
-0.5563666, 0.6543671, 0.4903021, 0.2705882, 1, 0, 1,
-0.5548128, -1.880583, -2.215847, 0.2666667, 1, 0, 1,
-0.5536267, 0.3246718, -2.5562, 0.2588235, 1, 0, 1,
-0.5526523, 2.277766, 0.4746908, 0.254902, 1, 0, 1,
-0.5491384, 0.9352305, -0.1272913, 0.2470588, 1, 0, 1,
-0.5491327, -0.8158689, -2.748863, 0.2431373, 1, 0, 1,
-0.5453478, 1.722586, -1.131596, 0.2352941, 1, 0, 1,
-0.543707, -2.038202, -2.894794, 0.2313726, 1, 0, 1,
-0.5433849, -0.09832197, 0.5489474, 0.2235294, 1, 0, 1,
-0.5432203, -0.1742813, -1.732353, 0.2196078, 1, 0, 1,
-0.5427721, -0.1421492, -1.369528, 0.2117647, 1, 0, 1,
-0.5418741, 0.4073429, 1.059034, 0.2078431, 1, 0, 1,
-0.541582, 0.8232949, -1.631875, 0.2, 1, 0, 1,
-0.539301, 1.588673, -0.6947571, 0.1921569, 1, 0, 1,
-0.5385927, 0.8510016, 0.3635779, 0.1882353, 1, 0, 1,
-0.5347868, 0.3790105, -2.242727, 0.1803922, 1, 0, 1,
-0.5286595, -0.4624256, -1.083033, 0.1764706, 1, 0, 1,
-0.5283509, -2.042603, -1.163531, 0.1686275, 1, 0, 1,
-0.5228742, -0.9202028, -2.427665, 0.1647059, 1, 0, 1,
-0.5175462, 1.363525, -0.1151463, 0.1568628, 1, 0, 1,
-0.5167264, -0.9382931, -2.187837, 0.1529412, 1, 0, 1,
-0.5137159, -0.1730087, -2.06907, 0.145098, 1, 0, 1,
-0.5125262, 1.494112, -0.07916646, 0.1411765, 1, 0, 1,
-0.5108311, 0.6685829, 0.3717064, 0.1333333, 1, 0, 1,
-0.5088901, 1.24004, -1.810751, 0.1294118, 1, 0, 1,
-0.5087245, 0.6871272, -1.626241, 0.1215686, 1, 0, 1,
-0.501213, 0.2123714, -0.7481867, 0.1176471, 1, 0, 1,
-0.4941524, 0.2191481, -1.746235, 0.1098039, 1, 0, 1,
-0.4920855, -0.9981608, -3.949923, 0.1058824, 1, 0, 1,
-0.4895929, 0.3106383, -0.7351455, 0.09803922, 1, 0, 1,
-0.4844173, -0.3776292, -1.970963, 0.09019608, 1, 0, 1,
-0.4840233, -0.129715, -1.959886, 0.08627451, 1, 0, 1,
-0.4831875, -1.564941, -2.486124, 0.07843138, 1, 0, 1,
-0.4831797, -0.7910876, -2.399887, 0.07450981, 1, 0, 1,
-0.4815946, -1.208682, -1.139326, 0.06666667, 1, 0, 1,
-0.4731595, 0.1138271, -1.896004, 0.0627451, 1, 0, 1,
-0.4731121, -0.8824384, -1.598709, 0.05490196, 1, 0, 1,
-0.4691793, -0.4057366, -3.815655, 0.05098039, 1, 0, 1,
-0.4691031, 0.5156382, -1.482662, 0.04313726, 1, 0, 1,
-0.4571658, 1.318714, -1.692695, 0.03921569, 1, 0, 1,
-0.4561764, 0.1341616, -2.184942, 0.03137255, 1, 0, 1,
-0.4560343, -0.463684, -1.063034, 0.02745098, 1, 0, 1,
-0.4532432, -1.233372, -3.017497, 0.01960784, 1, 0, 1,
-0.4499445, 0.2645287, -2.049172, 0.01568628, 1, 0, 1,
-0.4440668, 0.6946377, -0.1124673, 0.007843138, 1, 0, 1,
-0.4434674, -0.7716734, -3.30388, 0.003921569, 1, 0, 1,
-0.443113, 1.177963, -0.2985998, 0, 1, 0.003921569, 1,
-0.4399631, -0.126886, -2.228418, 0, 1, 0.01176471, 1,
-0.4363016, 0.03700186, -0.9244123, 0, 1, 0.01568628, 1,
-0.4340605, -0.0958091, -1.815264, 0, 1, 0.02352941, 1,
-0.4339387, -0.3102497, -3.575101, 0, 1, 0.02745098, 1,
-0.4336953, 0.1444049, -1.726488, 0, 1, 0.03529412, 1,
-0.4303097, -0.4765138, -3.595511, 0, 1, 0.03921569, 1,
-0.4297654, 1.265423, -0.3657745, 0, 1, 0.04705882, 1,
-0.4296235, 0.0007831561, -0.8889837, 0, 1, 0.05098039, 1,
-0.4285755, -1.31939, -2.200108, 0, 1, 0.05882353, 1,
-0.4261045, 0.6673338, -1.537372, 0, 1, 0.0627451, 1,
-0.4206493, -0.4924526, -1.50901, 0, 1, 0.07058824, 1,
-0.4194307, -0.3715701, -2.258337, 0, 1, 0.07450981, 1,
-0.4185071, -0.3911622, -2.626407, 0, 1, 0.08235294, 1,
-0.4146168, 0.1111255, -0.9369521, 0, 1, 0.08627451, 1,
-0.4125959, 0.2037596, -0.9552059, 0, 1, 0.09411765, 1,
-0.4075018, -1.113875, -2.088983, 0, 1, 0.1019608, 1,
-0.4054091, 1.216317, -0.4812855, 0, 1, 0.1058824, 1,
-0.4038701, -0.8323864, -2.989691, 0, 1, 0.1137255, 1,
-0.4033912, -0.2935471, -0.4794317, 0, 1, 0.1176471, 1,
-0.4005866, -0.7765003, -4.010292, 0, 1, 0.1254902, 1,
-0.3983672, -0.3441669, -0.5583516, 0, 1, 0.1294118, 1,
-0.3978685, -0.2577034, -1.368781, 0, 1, 0.1372549, 1,
-0.3963687, -0.7858791, -1.133668, 0, 1, 0.1411765, 1,
-0.3909161, -0.05787232, -0.3476931, 0, 1, 0.1490196, 1,
-0.3906057, -0.5973134, -2.60366, 0, 1, 0.1529412, 1,
-0.3876179, 1.709511, -1.641858, 0, 1, 0.1607843, 1,
-0.3854055, -0.5328932, -0.6813974, 0, 1, 0.1647059, 1,
-0.3835944, -0.8147954, -1.861566, 0, 1, 0.172549, 1,
-0.3830853, -0.2810503, -1.790589, 0, 1, 0.1764706, 1,
-0.3805901, 0.5279412, -0.8899842, 0, 1, 0.1843137, 1,
-0.3794768, 0.9065206, -1.395763, 0, 1, 0.1882353, 1,
-0.3793567, -0.9227295, -2.109549, 0, 1, 0.1960784, 1,
-0.3787884, 1.381123, 0.9327795, 0, 1, 0.2039216, 1,
-0.3748974, -1.454768, -2.352326, 0, 1, 0.2078431, 1,
-0.3716384, 1.910342, -0.2353757, 0, 1, 0.2156863, 1,
-0.3685963, -0.7418863, -3.608829, 0, 1, 0.2196078, 1,
-0.3524025, -1.234415, -3.413392, 0, 1, 0.227451, 1,
-0.3494546, 0.1502016, -1.470089, 0, 1, 0.2313726, 1,
-0.3488806, -0.6300421, -2.220042, 0, 1, 0.2392157, 1,
-0.3450835, -1.201352, -1.660109, 0, 1, 0.2431373, 1,
-0.3402146, -0.02065935, -0.5850028, 0, 1, 0.2509804, 1,
-0.3349101, -0.9595252, -2.944726, 0, 1, 0.254902, 1,
-0.3316881, 1.451128, 0.5366766, 0, 1, 0.2627451, 1,
-0.3316329, 0.6333861, 0.9153975, 0, 1, 0.2666667, 1,
-0.3291933, 1.673365, -0.6652106, 0, 1, 0.2745098, 1,
-0.329115, -0.6977586, -2.427639, 0, 1, 0.2784314, 1,
-0.3287319, -0.4046775, -3.935654, 0, 1, 0.2862745, 1,
-0.3258828, 0.06384247, -3.386156, 0, 1, 0.2901961, 1,
-0.3256645, -0.4457199, -3.124128, 0, 1, 0.2980392, 1,
-0.3227209, 2.151294, 0.7906134, 0, 1, 0.3058824, 1,
-0.3222927, -1.343628, -2.069212, 0, 1, 0.3098039, 1,
-0.3200469, -0.7560494, -3.096812, 0, 1, 0.3176471, 1,
-0.3199787, -0.2886573, -2.426699, 0, 1, 0.3215686, 1,
-0.3191337, -0.208249, -1.337652, 0, 1, 0.3294118, 1,
-0.3186125, 0.4804505, 0.6329201, 0, 1, 0.3333333, 1,
-0.3169276, -0.06009476, -3.236522, 0, 1, 0.3411765, 1,
-0.3149506, 0.8665957, -1.434966, 0, 1, 0.345098, 1,
-0.3147172, 0.82688, -0.7019233, 0, 1, 0.3529412, 1,
-0.3119959, 0.2551501, -1.13391, 0, 1, 0.3568628, 1,
-0.3094458, -0.3462449, -3.313241, 0, 1, 0.3647059, 1,
-0.306794, -0.8044798, -2.852485, 0, 1, 0.3686275, 1,
-0.3056119, 0.4608661, -0.766387, 0, 1, 0.3764706, 1,
-0.3025324, -0.6073307, -3.184561, 0, 1, 0.3803922, 1,
-0.2995379, -0.4891568, -2.800216, 0, 1, 0.3882353, 1,
-0.297231, -0.01661854, -3.197683, 0, 1, 0.3921569, 1,
-0.2958516, 0.3394318, -0.6057532, 0, 1, 0.4, 1,
-0.2949, 0.4262859, -0.1578629, 0, 1, 0.4078431, 1,
-0.2894599, -0.8620447, -1.243246, 0, 1, 0.4117647, 1,
-0.2873705, -0.3110045, -3.261196, 0, 1, 0.4196078, 1,
-0.2856748, -0.9608629, -4.211295, 0, 1, 0.4235294, 1,
-0.2856401, -0.4968437, -1.911837, 0, 1, 0.4313726, 1,
-0.2767813, 0.8969012, -0.652118, 0, 1, 0.4352941, 1,
-0.2749728, 0.4468632, 1.531447, 0, 1, 0.4431373, 1,
-0.2747846, 0.9482478, -0.4213664, 0, 1, 0.4470588, 1,
-0.2713838, -0.6985621, -4.516453, 0, 1, 0.454902, 1,
-0.2701122, 1.342368, 0.02195767, 0, 1, 0.4588235, 1,
-0.2684868, 1.050225, -0.1138035, 0, 1, 0.4666667, 1,
-0.2677698, 0.9521952, 1.221705, 0, 1, 0.4705882, 1,
-0.2664562, -1.506408, -1.489737, 0, 1, 0.4784314, 1,
-0.2651301, 0.5797812, -0.8901751, 0, 1, 0.4823529, 1,
-0.2638071, 0.1423558, -0.7488105, 0, 1, 0.4901961, 1,
-0.2568966, 0.1663541, -1.091418, 0, 1, 0.4941176, 1,
-0.2536116, 0.2168346, -0.9205723, 0, 1, 0.5019608, 1,
-0.252326, -0.6623865, -2.853038, 0, 1, 0.509804, 1,
-0.2453433, -0.2220487, -4.599717, 0, 1, 0.5137255, 1,
-0.2448949, 2.216306, 1.107034, 0, 1, 0.5215687, 1,
-0.2442358, -0.3525071, -2.786192, 0, 1, 0.5254902, 1,
-0.2415671, -0.8085934, -1.550817, 0, 1, 0.5333334, 1,
-0.2414599, -0.4097994, -1.742994, 0, 1, 0.5372549, 1,
-0.2402759, 0.9054034, -0.8174018, 0, 1, 0.5450981, 1,
-0.2392815, 0.979813, -0.347353, 0, 1, 0.5490196, 1,
-0.2313653, 1.477371, 0.1174202, 0, 1, 0.5568628, 1,
-0.2228651, -0.4341073, -2.076553, 0, 1, 0.5607843, 1,
-0.2173126, 1.083565, -0.06987551, 0, 1, 0.5686275, 1,
-0.2143695, -1.487392, -1.670229, 0, 1, 0.572549, 1,
-0.2108614, -1.313179, -4.145202, 0, 1, 0.5803922, 1,
-0.2104793, 0.01192883, -0.7343063, 0, 1, 0.5843138, 1,
-0.2058748, -1.148381, -2.947938, 0, 1, 0.5921569, 1,
-0.2049239, -0.9426728, -0.93012, 0, 1, 0.5960785, 1,
-0.2045335, -1.278002, -3.182291, 0, 1, 0.6039216, 1,
-0.2041172, 0.1329702, 0.2019311, 0, 1, 0.6117647, 1,
-0.2016253, -0.8974885, -1.263782, 0, 1, 0.6156863, 1,
-0.2001131, -0.07355511, -0.4973408, 0, 1, 0.6235294, 1,
-0.1995969, 1.125188, -0.2490041, 0, 1, 0.627451, 1,
-0.1984849, -1.048146, -3.696551, 0, 1, 0.6352941, 1,
-0.1968554, -0.5438842, -3.227288, 0, 1, 0.6392157, 1,
-0.1895305, -0.310999, -3.551559, 0, 1, 0.6470588, 1,
-0.1888566, -1.649965, -1.359124, 0, 1, 0.6509804, 1,
-0.188571, 0.7417751, -0.08937731, 0, 1, 0.6588235, 1,
-0.1728682, -0.3283106, -2.686685, 0, 1, 0.6627451, 1,
-0.1678503, -0.7091202, -3.099881, 0, 1, 0.6705883, 1,
-0.1677967, -0.6478413, -4.33218, 0, 1, 0.6745098, 1,
-0.1642153, 0.4101528, -0.3463059, 0, 1, 0.682353, 1,
-0.1577526, 0.4852647, -0.08544564, 0, 1, 0.6862745, 1,
-0.1571865, -0.1148046, -1.233913, 0, 1, 0.6941177, 1,
-0.153664, -0.5554183, -3.327381, 0, 1, 0.7019608, 1,
-0.1528595, -0.9232779, -2.174186, 0, 1, 0.7058824, 1,
-0.1499034, -1.227077, -5.014205, 0, 1, 0.7137255, 1,
-0.1497502, 0.5545802, -0.1625348, 0, 1, 0.7176471, 1,
-0.1488042, -0.359612, -1.731553, 0, 1, 0.7254902, 1,
-0.1477667, 0.07284361, -1.026139, 0, 1, 0.7294118, 1,
-0.1477504, -1.935701, -4.906997, 0, 1, 0.7372549, 1,
-0.1468968, -1.338521, -3.272611, 0, 1, 0.7411765, 1,
-0.1450739, 1.36001, -0.7040655, 0, 1, 0.7490196, 1,
-0.1407483, 0.6717234, -0.3923801, 0, 1, 0.7529412, 1,
-0.139319, 0.7523749, -0.7096149, 0, 1, 0.7607843, 1,
-0.1373425, -0.6118105, -2.714021, 0, 1, 0.7647059, 1,
-0.137031, 0.01507656, -1.280236, 0, 1, 0.772549, 1,
-0.1339408, -0.1291907, -2.149266, 0, 1, 0.7764706, 1,
-0.1284013, 0.6999382, -0.1314272, 0, 1, 0.7843137, 1,
-0.1273549, 0.3195536, -2.096532, 0, 1, 0.7882353, 1,
-0.125363, 0.9272764, 1.097439, 0, 1, 0.7960784, 1,
-0.1246073, -0.4492708, -4.851253, 0, 1, 0.8039216, 1,
-0.1243783, -0.07595222, -2.622545, 0, 1, 0.8078431, 1,
-0.1232289, 1.66544, -1.571245, 0, 1, 0.8156863, 1,
-0.1184051, -1.494373, -1.968775, 0, 1, 0.8196079, 1,
-0.117007, -0.01116017, 0.4471026, 0, 1, 0.827451, 1,
-0.116767, 1.53581, 0.7464471, 0, 1, 0.8313726, 1,
-0.1147582, -0.09110239, -1.189741, 0, 1, 0.8392157, 1,
-0.1136787, -0.4781905, -3.007864, 0, 1, 0.8431373, 1,
-0.112728, -0.9578665, -2.229552, 0, 1, 0.8509804, 1,
-0.1113983, -1.199563, -2.062632, 0, 1, 0.854902, 1,
-0.1048626, 1.290671, -0.01964719, 0, 1, 0.8627451, 1,
-0.1018247, 0.9444489, 0.1687734, 0, 1, 0.8666667, 1,
-0.09963313, -0.2773671, -2.865691, 0, 1, 0.8745098, 1,
-0.09385001, -0.7375088, -3.073168, 0, 1, 0.8784314, 1,
-0.09272756, 0.82932, 0.9494501, 0, 1, 0.8862745, 1,
-0.09076986, -0.8089899, -4.020881, 0, 1, 0.8901961, 1,
-0.08537068, 1.550816, 0.7159743, 0, 1, 0.8980392, 1,
-0.08417704, -1.270261, -3.486481, 0, 1, 0.9058824, 1,
-0.07202087, -1.563749, -2.828953, 0, 1, 0.9098039, 1,
-0.07179855, -0.1103965, -2.493281, 0, 1, 0.9176471, 1,
-0.06828777, 0.251424, -1.045807, 0, 1, 0.9215686, 1,
-0.06292288, -0.2151813, -3.136186, 0, 1, 0.9294118, 1,
-0.06056944, 0.9980718, -0.1466229, 0, 1, 0.9333333, 1,
-0.05719665, 1.083863, -0.5918199, 0, 1, 0.9411765, 1,
-0.05546166, 1.162656, -0.3362723, 0, 1, 0.945098, 1,
-0.05424317, 1.059426, -1.522234, 0, 1, 0.9529412, 1,
-0.05241273, 1.467267, -0.2918618, 0, 1, 0.9568627, 1,
-0.05197011, -0.09043077, -1.581751, 0, 1, 0.9647059, 1,
-0.04629415, 0.6994283, -1.583732, 0, 1, 0.9686275, 1,
-0.03808326, -0.4639484, -3.134902, 0, 1, 0.9764706, 1,
-0.03646028, -0.873192, -1.686592, 0, 1, 0.9803922, 1,
-0.03291062, 0.5412045, 0.7667333, 0, 1, 0.9882353, 1,
-0.03070584, 0.7733928, 0.4849979, 0, 1, 0.9921569, 1,
-0.0304766, 1.575693, -0.06899961, 0, 1, 1, 1,
-0.02977575, -1.234713, -4.090672, 0, 0.9921569, 1, 1,
-0.02425976, 0.4266411, -1.598351, 0, 0.9882353, 1, 1,
-0.02078258, -0.6198912, -3.58947, 0, 0.9803922, 1, 1,
-0.0207735, 0.002711565, -2.279715, 0, 0.9764706, 1, 1,
-0.01933048, 1.030262, -0.7098895, 0, 0.9686275, 1, 1,
-0.01743732, 1.040805, 1.523613, 0, 0.9647059, 1, 1,
-0.01085141, 1.964711, 0.9293039, 0, 0.9568627, 1, 1,
-0.01004371, 0.05124288, -0.867479, 0, 0.9529412, 1, 1,
-0.008810719, -1.14504, -3.092996, 0, 0.945098, 1, 1,
-4.164973e-05, 1.07113, -0.8765298, 0, 0.9411765, 1, 1,
-2.493174e-05, 0.3516203, 0.5306884, 0, 0.9333333, 1, 1,
0.001432016, -0.8687972, 4.50968, 0, 0.9294118, 1, 1,
0.001644157, -1.012323, 3.110633, 0, 0.9215686, 1, 1,
0.001825549, -0.375894, 2.645974, 0, 0.9176471, 1, 1,
0.01276382, -1.905056, 2.610352, 0, 0.9098039, 1, 1,
0.0137902, -0.2800382, 4.544402, 0, 0.9058824, 1, 1,
0.01549616, 1.108183, 0.2722787, 0, 0.8980392, 1, 1,
0.01644531, -0.6269667, 2.552032, 0, 0.8901961, 1, 1,
0.01673172, 0.09378935, 0.1900276, 0, 0.8862745, 1, 1,
0.01817879, 0.1121358, 1.260942, 0, 0.8784314, 1, 1,
0.02008026, -0.2274526, 3.934063, 0, 0.8745098, 1, 1,
0.02118194, 0.6235555, -1.103626, 0, 0.8666667, 1, 1,
0.02234702, -0.3242475, 2.598335, 0, 0.8627451, 1, 1,
0.02250535, -0.362707, 1.21062, 0, 0.854902, 1, 1,
0.0236638, -0.05774089, 1.477249, 0, 0.8509804, 1, 1,
0.02527685, 0.7466435, 1.046744, 0, 0.8431373, 1, 1,
0.02567964, 0.5159329, 0.7264535, 0, 0.8392157, 1, 1,
0.03060665, -0.6405472, 1.742601, 0, 0.8313726, 1, 1,
0.04276125, -0.2807092, 1.381932, 0, 0.827451, 1, 1,
0.04417989, -0.6776934, 1.70325, 0, 0.8196079, 1, 1,
0.04482869, 2.238693, -0.3029428, 0, 0.8156863, 1, 1,
0.04775549, 0.1677411, -1.352433, 0, 0.8078431, 1, 1,
0.04785125, 1.056818, 1.088004, 0, 0.8039216, 1, 1,
0.05319507, 0.4400213, -1.494453, 0, 0.7960784, 1, 1,
0.05367747, 0.0309988, -0.683556, 0, 0.7882353, 1, 1,
0.05448505, 1.315279, 1.616011, 0, 0.7843137, 1, 1,
0.06009452, -0.2776685, 1.44275, 0, 0.7764706, 1, 1,
0.06021655, -1.20773, 3.67531, 0, 0.772549, 1, 1,
0.06047394, -0.8111343, 1.867674, 0, 0.7647059, 1, 1,
0.06241362, -0.6465953, 2.464982, 0, 0.7607843, 1, 1,
0.06241591, 2.385433, 1.561882, 0, 0.7529412, 1, 1,
0.06289876, -0.819064, 2.645074, 0, 0.7490196, 1, 1,
0.06489992, 1.266304, -1.977132, 0, 0.7411765, 1, 1,
0.06543953, 0.6810815, -0.7463848, 0, 0.7372549, 1, 1,
0.06697793, -0.9179342, 2.66556, 0, 0.7294118, 1, 1,
0.06853463, 0.441585, 0.04210575, 0, 0.7254902, 1, 1,
0.06894638, -0.5166545, 2.77207, 0, 0.7176471, 1, 1,
0.07129319, 2.041819, 0.2491837, 0, 0.7137255, 1, 1,
0.07537471, -1.979754, 1.47261, 0, 0.7058824, 1, 1,
0.07553397, 0.1978803, 0.695698, 0, 0.6980392, 1, 1,
0.07826275, 0.1446034, 0.9497172, 0, 0.6941177, 1, 1,
0.08205408, -0.5808081, 2.041874, 0, 0.6862745, 1, 1,
0.08252946, -0.974692, 4.242515, 0, 0.682353, 1, 1,
0.08331583, 0.5701226, 1.025932, 0, 0.6745098, 1, 1,
0.08331912, -2.29175, 2.138501, 0, 0.6705883, 1, 1,
0.08851533, 0.1737878, 0.5445307, 0, 0.6627451, 1, 1,
0.08885733, 0.02744527, -0.04091556, 0, 0.6588235, 1, 1,
0.08966368, 0.9078957, -1.315178, 0, 0.6509804, 1, 1,
0.1000369, 0.9229717, 0.04707452, 0, 0.6470588, 1, 1,
0.1005278, 0.6097963, 0.742442, 0, 0.6392157, 1, 1,
0.1007853, -0.04639369, 1.47622, 0, 0.6352941, 1, 1,
0.1033075, 0.6783525, 1.03396, 0, 0.627451, 1, 1,
0.1036089, -0.05393025, 1.461484, 0, 0.6235294, 1, 1,
0.1097966, 0.8937882, 0.06496056, 0, 0.6156863, 1, 1,
0.1106592, -2.766786, 4.401662, 0, 0.6117647, 1, 1,
0.1135915, 1.269277, 0.2178774, 0, 0.6039216, 1, 1,
0.1147181, 0.1305231, -0.430261, 0, 0.5960785, 1, 1,
0.1197096, -0.2143002, 2.766253, 0, 0.5921569, 1, 1,
0.1220453, 1.223222, 1.811662, 0, 0.5843138, 1, 1,
0.1227343, -1.323352, 4.869554, 0, 0.5803922, 1, 1,
0.1235128, -0.3425741, 3.48399, 0, 0.572549, 1, 1,
0.1247526, -1.23217, 3.040737, 0, 0.5686275, 1, 1,
0.1308747, -0.2510734, 2.557914, 0, 0.5607843, 1, 1,
0.1315355, -0.9357616, 4.24544, 0, 0.5568628, 1, 1,
0.1360345, 1.072284, -0.2310958, 0, 0.5490196, 1, 1,
0.1365674, 1.387438, 1.613628, 0, 0.5450981, 1, 1,
0.1472209, 1.22503, 1.285995, 0, 0.5372549, 1, 1,
0.1566135, -0.09254642, 1.899792, 0, 0.5333334, 1, 1,
0.1578635, 1.050588, 0.1515333, 0, 0.5254902, 1, 1,
0.1608973, 0.5137541, 0.1409533, 0, 0.5215687, 1, 1,
0.164436, -0.5215774, 1.282262, 0, 0.5137255, 1, 1,
0.1734025, 0.6369959, 0.5747176, 0, 0.509804, 1, 1,
0.178597, 0.2956176, 0.4715579, 0, 0.5019608, 1, 1,
0.1796317, -0.2507526, 1.619909, 0, 0.4941176, 1, 1,
0.1823313, 0.4257534, 1.346542, 0, 0.4901961, 1, 1,
0.1936591, 2.006279, -0.1346736, 0, 0.4823529, 1, 1,
0.1936914, -0.07320983, 1.731688, 0, 0.4784314, 1, 1,
0.201306, -0.5487685, 1.593014, 0, 0.4705882, 1, 1,
0.2013996, -1.31289, 5.778209, 0, 0.4666667, 1, 1,
0.2034249, 0.1057487, 1.959457, 0, 0.4588235, 1, 1,
0.203701, 0.5539973, -0.7622351, 0, 0.454902, 1, 1,
0.2045111, 1.797796, -0.5940352, 0, 0.4470588, 1, 1,
0.2049228, -0.4072084, 3.024621, 0, 0.4431373, 1, 1,
0.2095896, 0.3684341, 1.830994, 0, 0.4352941, 1, 1,
0.2104921, -0.08158192, 1.552088, 0, 0.4313726, 1, 1,
0.211584, 0.1770396, 0.7455832, 0, 0.4235294, 1, 1,
0.2124201, 0.5000302, 0.1182094, 0, 0.4196078, 1, 1,
0.2140226, -1.06987, 2.765099, 0, 0.4117647, 1, 1,
0.2143615, 0.3139545, 0.6750326, 0, 0.4078431, 1, 1,
0.2177552, 1.262505, 1.227421, 0, 0.4, 1, 1,
0.2238667, -0.6650919, 4.566993, 0, 0.3921569, 1, 1,
0.2275623, 0.7627927, 0.09261921, 0, 0.3882353, 1, 1,
0.2320202, -1.530532, 3.664009, 0, 0.3803922, 1, 1,
0.2337967, 0.5250715, 0.8319103, 0, 0.3764706, 1, 1,
0.241386, -0.4259745, 1.62186, 0, 0.3686275, 1, 1,
0.2478615, -1.115332, 4.82574, 0, 0.3647059, 1, 1,
0.2494787, -0.2416635, 2.664166, 0, 0.3568628, 1, 1,
0.2514138, -0.1571157, 1.517835, 0, 0.3529412, 1, 1,
0.2517808, -0.5837476, 2.799131, 0, 0.345098, 1, 1,
0.2540984, 0.07092838, 2.221046, 0, 0.3411765, 1, 1,
0.256516, -1.178495, 2.417808, 0, 0.3333333, 1, 1,
0.2582687, -0.1587933, 1.62029, 0, 0.3294118, 1, 1,
0.2588299, -0.5340062, 2.622702, 0, 0.3215686, 1, 1,
0.259117, -1.470782, 1.718846, 0, 0.3176471, 1, 1,
0.2597177, -1.902068, 4.650737, 0, 0.3098039, 1, 1,
0.2606778, -0.4571899, 1.813816, 0, 0.3058824, 1, 1,
0.2623163, 0.642678, -0.0471227, 0, 0.2980392, 1, 1,
0.2640279, -1.056816, 3.148865, 0, 0.2901961, 1, 1,
0.2664606, -0.7555827, 2.665226, 0, 0.2862745, 1, 1,
0.2733395, 0.4140166, 1.194028, 0, 0.2784314, 1, 1,
0.2747209, 0.8654081, -1.474549, 0, 0.2745098, 1, 1,
0.2809412, -0.3157609, 2.530141, 0, 0.2666667, 1, 1,
0.2815094, -1.202022, 2.651274, 0, 0.2627451, 1, 1,
0.2820601, 1.103073, 0.04601223, 0, 0.254902, 1, 1,
0.2828936, -0.6091481, 2.086014, 0, 0.2509804, 1, 1,
0.2862445, 0.8637919, 1.658668, 0, 0.2431373, 1, 1,
0.2877756, -0.1613718, 2.555476, 0, 0.2392157, 1, 1,
0.2903574, -1.066954, 4.468525, 0, 0.2313726, 1, 1,
0.291168, -0.4504018, 2.937051, 0, 0.227451, 1, 1,
0.2912126, 0.3455066, 1.057812, 0, 0.2196078, 1, 1,
0.2947134, -1.828164, 1.999962, 0, 0.2156863, 1, 1,
0.2966137, -0.4063652, 2.201299, 0, 0.2078431, 1, 1,
0.298918, -1.502722, 2.86004, 0, 0.2039216, 1, 1,
0.3042293, -0.1863122, 0.06225143, 0, 0.1960784, 1, 1,
0.3048109, -1.321967, 1.852383, 0, 0.1882353, 1, 1,
0.306493, 0.9582456, 0.07273609, 0, 0.1843137, 1, 1,
0.3132217, -0.1596231, 2.242378, 0, 0.1764706, 1, 1,
0.3173037, -0.1528132, 1.635476, 0, 0.172549, 1, 1,
0.3272231, 0.3235702, 1.172682, 0, 0.1647059, 1, 1,
0.3287029, 0.03253561, 3.020017, 0, 0.1607843, 1, 1,
0.3324566, -0.4455811, 2.361322, 0, 0.1529412, 1, 1,
0.3505461, -1.640696, 3.844776, 0, 0.1490196, 1, 1,
0.3516868, 1.492475, -0.4423239, 0, 0.1411765, 1, 1,
0.3520089, -1.323133, 2.177157, 0, 0.1372549, 1, 1,
0.3607329, 1.131105, 1.070953, 0, 0.1294118, 1, 1,
0.3610824, 0.340468, 1.13379, 0, 0.1254902, 1, 1,
0.3627517, -1.251119, 3.991525, 0, 0.1176471, 1, 1,
0.3631301, -0.0399191, 0.7959924, 0, 0.1137255, 1, 1,
0.3680666, 0.8383766, -0.6437534, 0, 0.1058824, 1, 1,
0.3693703, 0.6754801, -0.1955327, 0, 0.09803922, 1, 1,
0.3708149, -0.3680631, 3.948107, 0, 0.09411765, 1, 1,
0.3711676, -1.534403, 1.640898, 0, 0.08627451, 1, 1,
0.3714646, -1.538971, 2.645289, 0, 0.08235294, 1, 1,
0.3732316, -0.01990188, 2.263086, 0, 0.07450981, 1, 1,
0.3737766, 1.364669, 1.320689, 0, 0.07058824, 1, 1,
0.374084, 0.3754881, 2.216845, 0, 0.0627451, 1, 1,
0.3749654, -0.9874917, 3.459826, 0, 0.05882353, 1, 1,
0.377864, -0.2629904, 2.941387, 0, 0.05098039, 1, 1,
0.3782332, 1.157254, 0.4573716, 0, 0.04705882, 1, 1,
0.3892202, -0.2957903, 2.552642, 0, 0.03921569, 1, 1,
0.3941902, -1.03892, 4.309898, 0, 0.03529412, 1, 1,
0.3965233, 0.04559269, 0.8188348, 0, 0.02745098, 1, 1,
0.4005913, 1.309646, 0.4239505, 0, 0.02352941, 1, 1,
0.4010805, 0.4887028, -1.093238, 0, 0.01568628, 1, 1,
0.4020525, -0.3415163, 2.330194, 0, 0.01176471, 1, 1,
0.4034388, -0.4192125, 3.337517, 0, 0.003921569, 1, 1,
0.4053106, 0.8736191, -0.009334983, 0.003921569, 0, 1, 1,
0.4072062, -0.6121289, 3.311371, 0.007843138, 0, 1, 1,
0.4102983, 2.41592, 0.2974497, 0.01568628, 0, 1, 1,
0.4114102, 1.227225, 1.007561, 0.01960784, 0, 1, 1,
0.4189931, 0.2828054, 2.706255, 0.02745098, 0, 1, 1,
0.4248006, -1.146109, 2.139481, 0.03137255, 0, 1, 1,
0.4253871, -0.4454071, 1.466268, 0.03921569, 0, 1, 1,
0.431522, -1.997716, 3.938782, 0.04313726, 0, 1, 1,
0.4321316, 1.274885, 0.459248, 0.05098039, 0, 1, 1,
0.4325572, -0.2030165, 3.366481, 0.05490196, 0, 1, 1,
0.4345021, 1.81245, 2.28532, 0.0627451, 0, 1, 1,
0.4360143, 0.9778773, 0.1743021, 0.06666667, 0, 1, 1,
0.4371134, -0.1742833, 2.956355, 0.07450981, 0, 1, 1,
0.4410041, 1.025428, -0.5010905, 0.07843138, 0, 1, 1,
0.4445392, -1.139432, 2.998289, 0.08627451, 0, 1, 1,
0.4457376, 1.886397, 0.7685566, 0.09019608, 0, 1, 1,
0.4483201, 0.4946337, 0.341235, 0.09803922, 0, 1, 1,
0.4527756, -1.062871, 1.718347, 0.1058824, 0, 1, 1,
0.4534879, 0.5215127, 1.105473, 0.1098039, 0, 1, 1,
0.4566214, -0.5952488, 3.39864, 0.1176471, 0, 1, 1,
0.4601313, 1.072534, 1.211536, 0.1215686, 0, 1, 1,
0.4604282, -0.2697619, 1.370026, 0.1294118, 0, 1, 1,
0.460886, -0.4734532, 2.065988, 0.1333333, 0, 1, 1,
0.4643467, 2.119028, -0.9210769, 0.1411765, 0, 1, 1,
0.4651806, 1.39408, -1.083493, 0.145098, 0, 1, 1,
0.4660007, 1.802409, 0.3317027, 0.1529412, 0, 1, 1,
0.4669566, -1.066477, 2.000402, 0.1568628, 0, 1, 1,
0.4698981, -0.5962669, 2.781611, 0.1647059, 0, 1, 1,
0.4700396, -0.5798629, 2.896251, 0.1686275, 0, 1, 1,
0.4733059, 0.9318678, 1.886333, 0.1764706, 0, 1, 1,
0.4749999, 0.5299172, 0.9683626, 0.1803922, 0, 1, 1,
0.4846496, 0.4987637, 0.08893061, 0.1882353, 0, 1, 1,
0.4860917, 0.6464654, -0.07081655, 0.1921569, 0, 1, 1,
0.4932073, 0.942897, 0.2292987, 0.2, 0, 1, 1,
0.4934083, -0.8761374, 3.643264, 0.2078431, 0, 1, 1,
0.4964099, 0.01923494, 1.501855, 0.2117647, 0, 1, 1,
0.4968484, 1.119006, 1.127653, 0.2196078, 0, 1, 1,
0.5033624, 1.027602, 1.665312, 0.2235294, 0, 1, 1,
0.5034276, 0.5589494, 0.5574662, 0.2313726, 0, 1, 1,
0.5062575, -0.3258947, 2.284491, 0.2352941, 0, 1, 1,
0.5063192, 0.369268, 1.533144, 0.2431373, 0, 1, 1,
0.5111676, 0.3540693, 1.857128, 0.2470588, 0, 1, 1,
0.5120924, -0.657577, 2.54773, 0.254902, 0, 1, 1,
0.52144, 0.7474269, 1.652951, 0.2588235, 0, 1, 1,
0.5322036, 0.4808109, 0.7150147, 0.2666667, 0, 1, 1,
0.5323625, -0.6891949, 1.610469, 0.2705882, 0, 1, 1,
0.5378302, 1.203433, -1.219928, 0.2784314, 0, 1, 1,
0.5404366, 0.3615386, 0.4179247, 0.282353, 0, 1, 1,
0.5463009, 0.3973823, 1.821556, 0.2901961, 0, 1, 1,
0.5478372, -2.108189, 2.271721, 0.2941177, 0, 1, 1,
0.5485246, 0.8856696, -1.067822, 0.3019608, 0, 1, 1,
0.5492218, -0.2963292, 0.6455496, 0.3098039, 0, 1, 1,
0.5532576, 0.9628386, 1.353578, 0.3137255, 0, 1, 1,
0.5575876, 2.167323, -0.573231, 0.3215686, 0, 1, 1,
0.5636697, 0.094432, 0.4178982, 0.3254902, 0, 1, 1,
0.5651094, 0.892538, 1.489069, 0.3333333, 0, 1, 1,
0.570482, -0.3256617, 0.6699085, 0.3372549, 0, 1, 1,
0.572037, -0.9172558, 1.13022, 0.345098, 0, 1, 1,
0.5727917, -0.5849088, 2.027522, 0.3490196, 0, 1, 1,
0.5892462, -1.847091, 3.111368, 0.3568628, 0, 1, 1,
0.5910193, -1.133959, 0.9883202, 0.3607843, 0, 1, 1,
0.5911747, 1.081461, 0.09327643, 0.3686275, 0, 1, 1,
0.5919498, 0.08425176, 3.146209, 0.372549, 0, 1, 1,
0.5930192, 0.9701132, 1.456264, 0.3803922, 0, 1, 1,
0.5943964, 1.149165, -1.678227, 0.3843137, 0, 1, 1,
0.5966533, -0.1077829, 3.257492, 0.3921569, 0, 1, 1,
0.5993271, 0.2265159, 2.16338, 0.3960784, 0, 1, 1,
0.5996888, -1.647886, 3.089191, 0.4039216, 0, 1, 1,
0.6012099, 0.5814111, 1.433851, 0.4117647, 0, 1, 1,
0.6025382, 0.3427209, 0.3217763, 0.4156863, 0, 1, 1,
0.603034, 1.150047, 0.7111523, 0.4235294, 0, 1, 1,
0.6033991, -0.7916036, 2.602783, 0.427451, 0, 1, 1,
0.6205246, -0.305284, 2.571182, 0.4352941, 0, 1, 1,
0.6223021, -2.059602, 3.306322, 0.4392157, 0, 1, 1,
0.6269944, -1.383107, 2.465645, 0.4470588, 0, 1, 1,
0.627252, 1.205462, 0.1977668, 0.4509804, 0, 1, 1,
0.6306655, -1.746162, 2.19864, 0.4588235, 0, 1, 1,
0.6365296, -0.6750712, 2.276033, 0.4627451, 0, 1, 1,
0.6386074, -2.053959, 3.917447, 0.4705882, 0, 1, 1,
0.6391426, -1.29655, 3.367342, 0.4745098, 0, 1, 1,
0.6397023, -0.09999031, 1.770901, 0.4823529, 0, 1, 1,
0.641608, 0.07960887, 3.928666, 0.4862745, 0, 1, 1,
0.642533, -0.7681447, 1.976456, 0.4941176, 0, 1, 1,
0.6450343, 0.571476, 0.07079499, 0.5019608, 0, 1, 1,
0.6455886, -0.8284315, 2.733156, 0.5058824, 0, 1, 1,
0.6509097, 1.021736, 0.7314975, 0.5137255, 0, 1, 1,
0.6517083, 0.7609864, -0.1568737, 0.5176471, 0, 1, 1,
0.65674, 0.9827677, 1.773461, 0.5254902, 0, 1, 1,
0.6618276, 0.7747515, 0.03836547, 0.5294118, 0, 1, 1,
0.6636598, -1.95093, 2.830491, 0.5372549, 0, 1, 1,
0.6656644, 0.4410325, -0.5577365, 0.5411765, 0, 1, 1,
0.6676378, -0.6066806, 1.960896, 0.5490196, 0, 1, 1,
0.6712654, 3.198025, 0.4289127, 0.5529412, 0, 1, 1,
0.6888309, 0.7236305, 1.321109, 0.5607843, 0, 1, 1,
0.6906611, -1.809023, 3.540494, 0.5647059, 0, 1, 1,
0.6954234, -0.9145205, 3.955457, 0.572549, 0, 1, 1,
0.6988398, -1.523574, 3.844211, 0.5764706, 0, 1, 1,
0.7034442, -1.209914, 3.758745, 0.5843138, 0, 1, 1,
0.7039033, 0.9076189, -0.3149969, 0.5882353, 0, 1, 1,
0.705105, -0.04150839, 3.57684, 0.5960785, 0, 1, 1,
0.7095015, -0.1305923, 3.610708, 0.6039216, 0, 1, 1,
0.7100253, -0.4235171, 2.698915, 0.6078432, 0, 1, 1,
0.712935, 0.1012013, 1.189578, 0.6156863, 0, 1, 1,
0.7153351, 1.050946, 1.683136, 0.6196079, 0, 1, 1,
0.7199219, -1.697047, 3.958172, 0.627451, 0, 1, 1,
0.7204456, 0.4745282, 1.534972, 0.6313726, 0, 1, 1,
0.739862, -0.7419192, 0.9365566, 0.6392157, 0, 1, 1,
0.7405829, -0.4763738, 2.468244, 0.6431373, 0, 1, 1,
0.7408029, 0.9445833, 2.363145, 0.6509804, 0, 1, 1,
0.7438678, 0.05166393, 0.7011, 0.654902, 0, 1, 1,
0.7441697, -1.365352, 2.362833, 0.6627451, 0, 1, 1,
0.7525399, -1.52229, 2.631164, 0.6666667, 0, 1, 1,
0.7570246, 1.074166, 1.413243, 0.6745098, 0, 1, 1,
0.7589788, -0.08344665, 2.014433, 0.6784314, 0, 1, 1,
0.7614803, 0.3183965, 1.08593, 0.6862745, 0, 1, 1,
0.7638512, -0.3050296, 2.446142, 0.6901961, 0, 1, 1,
0.7646928, 0.05170035, 2.815141, 0.6980392, 0, 1, 1,
0.7655375, -0.2750705, 1.847368, 0.7058824, 0, 1, 1,
0.773257, -2.173808, 3.100316, 0.7098039, 0, 1, 1,
0.7754449, -1.643301, 2.706053, 0.7176471, 0, 1, 1,
0.7780381, -0.1778271, 1.675163, 0.7215686, 0, 1, 1,
0.7842489, 0.5062101, -0.4226447, 0.7294118, 0, 1, 1,
0.7848213, 0.1427084, 0.8500419, 0.7333333, 0, 1, 1,
0.785471, -0.9849501, 3.301003, 0.7411765, 0, 1, 1,
0.7877045, -1.419607, 3.927279, 0.7450981, 0, 1, 1,
0.7957553, -1.487716, 2.990236, 0.7529412, 0, 1, 1,
0.7959612, -0.9920281, 4.322936, 0.7568628, 0, 1, 1,
0.814083, -0.3309404, 0.5500711, 0.7647059, 0, 1, 1,
0.8162116, -0.2041232, 3.320694, 0.7686275, 0, 1, 1,
0.8164227, -1.536328, 2.692271, 0.7764706, 0, 1, 1,
0.8183256, -1.598088, 2.811134, 0.7803922, 0, 1, 1,
0.820691, -0.8733432, 2.371334, 0.7882353, 0, 1, 1,
0.826433, 0.1927381, 1.452154, 0.7921569, 0, 1, 1,
0.8268017, -0.1590095, 1.927379, 0.8, 0, 1, 1,
0.8326316, 0.6536307, 1.582944, 0.8078431, 0, 1, 1,
0.8338218, -1.641067, 2.68202, 0.8117647, 0, 1, 1,
0.8344495, -0.773221, 3.507594, 0.8196079, 0, 1, 1,
0.836301, 1.164264, 0.4113382, 0.8235294, 0, 1, 1,
0.8368038, -0.7960964, 2.059135, 0.8313726, 0, 1, 1,
0.8377039, 0.2508246, 1.346519, 0.8352941, 0, 1, 1,
0.848282, 3.41238, 1.528794, 0.8431373, 0, 1, 1,
0.8493029, -0.1454075, 1.378083, 0.8470588, 0, 1, 1,
0.8531147, -1.123182, 3.688795, 0.854902, 0, 1, 1,
0.854709, -0.5069393, 2.493719, 0.8588235, 0, 1, 1,
0.8625271, -1.396591, 2.961008, 0.8666667, 0, 1, 1,
0.8644489, 0.2914062, -0.2638809, 0.8705882, 0, 1, 1,
0.8655791, 0.7361848, -0.4197513, 0.8784314, 0, 1, 1,
0.8684369, -0.6903028, 1.576884, 0.8823529, 0, 1, 1,
0.8693172, -0.9141794, 2.927211, 0.8901961, 0, 1, 1,
0.8707839, -1.819805, 1.786492, 0.8941177, 0, 1, 1,
0.8755038, 0.9509531, 1.447938, 0.9019608, 0, 1, 1,
0.8784091, 0.8490213, 0.2435513, 0.9098039, 0, 1, 1,
0.8923264, -1.308808, 1.624753, 0.9137255, 0, 1, 1,
0.8958943, -1.011145, 3.810635, 0.9215686, 0, 1, 1,
0.896329, -0.7265082, 1.290324, 0.9254902, 0, 1, 1,
0.9040535, -1.838935, 2.705328, 0.9333333, 0, 1, 1,
0.9042989, -0.09662477, 1.417915, 0.9372549, 0, 1, 1,
0.9083482, -0.1920751, 1.412892, 0.945098, 0, 1, 1,
0.909104, 0.1017151, 1.111942, 0.9490196, 0, 1, 1,
0.9105802, -0.09723615, 3.613095, 0.9568627, 0, 1, 1,
0.9167717, 0.354498, 1.042738, 0.9607843, 0, 1, 1,
0.919556, 1.484069, 1.142406, 0.9686275, 0, 1, 1,
0.9199945, 1.471401, 1.18816, 0.972549, 0, 1, 1,
0.9213196, 1.674744, 0.007158764, 0.9803922, 0, 1, 1,
0.9221682, 0.6454365, 1.496181, 0.9843137, 0, 1, 1,
0.9240975, -0.113667, 1.774233, 0.9921569, 0, 1, 1,
0.9271142, 1.077936, -0.2000006, 0.9960784, 0, 1, 1,
0.9300799, 0.6542134, 2.629121, 1, 0, 0.9960784, 1,
0.9313515, 0.3951404, 0.8536215, 1, 0, 0.9882353, 1,
0.9369045, -1.095308, 2.678168, 1, 0, 0.9843137, 1,
0.938558, 1.559163, 1.313081, 1, 0, 0.9764706, 1,
0.9387149, 0.4059524, 1.008113, 1, 0, 0.972549, 1,
0.9419236, -0.1120678, 0.9255813, 1, 0, 0.9647059, 1,
0.9427504, -0.480119, 2.409202, 1, 0, 0.9607843, 1,
0.94429, 0.07240307, 0.7802891, 1, 0, 0.9529412, 1,
0.9453068, -0.8177714, 1.297276, 1, 0, 0.9490196, 1,
0.9479159, 1.092175, 1.72128, 1, 0, 0.9411765, 1,
0.9490916, 1.274231, -0.2100444, 1, 0, 0.9372549, 1,
0.9494755, -0.9267592, 0.9328044, 1, 0, 0.9294118, 1,
0.9533492, 0.3710155, 1.956236, 1, 0, 0.9254902, 1,
0.9540454, -0.9189942, 2.808637, 1, 0, 0.9176471, 1,
0.9575711, 1.749513, 0.9814925, 1, 0, 0.9137255, 1,
0.9614114, 0.3328539, 1.462258, 1, 0, 0.9058824, 1,
0.9730113, -1.174436, 2.013076, 1, 0, 0.9019608, 1,
0.9743674, 1.522694, -0.3807214, 1, 0, 0.8941177, 1,
0.9788137, -0.5259299, 2.246689, 1, 0, 0.8862745, 1,
0.9790757, 1.150327, 1.70402, 1, 0, 0.8823529, 1,
0.9795299, -0.2771521, 1.494021, 1, 0, 0.8745098, 1,
0.9805614, 0.7314729, 1.937657, 1, 0, 0.8705882, 1,
0.9814118, -0.5957326, 2.188368, 1, 0, 0.8627451, 1,
0.9860616, -0.9446847, 2.196175, 1, 0, 0.8588235, 1,
0.9877126, -0.6458954, 4.141998, 1, 0, 0.8509804, 1,
0.9968129, 0.1306636, 1.412185, 1, 0, 0.8470588, 1,
1.021145, -0.3725932, 1.647108, 1, 0, 0.8392157, 1,
1.032714, -0.5699525, 2.944485, 1, 0, 0.8352941, 1,
1.036228, -0.5069255, 3.584875, 1, 0, 0.827451, 1,
1.039303, 0.1795478, 1.439571, 1, 0, 0.8235294, 1,
1.041243, -1.511363, 2.616749, 1, 0, 0.8156863, 1,
1.048699, 1.566419, 0.3871582, 1, 0, 0.8117647, 1,
1.062418, -0.07117563, 1.302751, 1, 0, 0.8039216, 1,
1.077505, -0.2583744, 1.839235, 1, 0, 0.7960784, 1,
1.098649, 2.109771, 0.9551069, 1, 0, 0.7921569, 1,
1.101969, 1.187488, 0.7456932, 1, 0, 0.7843137, 1,
1.104428, 0.8680863, 0.4983861, 1, 0, 0.7803922, 1,
1.107581, -0.5594608, 0.3476529, 1, 0, 0.772549, 1,
1.112418, -0.5128245, 2.513353, 1, 0, 0.7686275, 1,
1.11586, -0.3008144, 1.503511, 1, 0, 0.7607843, 1,
1.121568, -0.5838506, 1.428171, 1, 0, 0.7568628, 1,
1.127062, 1.010615, 1.284863, 1, 0, 0.7490196, 1,
1.136832, -0.6657531, 1.554379, 1, 0, 0.7450981, 1,
1.139189, -1.812369, 2.627067, 1, 0, 0.7372549, 1,
1.141347, -0.9357156, 1.615013, 1, 0, 0.7333333, 1,
1.141354, -0.9047616, 3.50877, 1, 0, 0.7254902, 1,
1.145424, 0.6121099, 2.010505, 1, 0, 0.7215686, 1,
1.146677, -1.118916, 1.138783, 1, 0, 0.7137255, 1,
1.147272, 0.3494688, 2.768675, 1, 0, 0.7098039, 1,
1.156155, 0.1952439, 2.273055, 1, 0, 0.7019608, 1,
1.162209, 0.3590463, 3.12923, 1, 0, 0.6941177, 1,
1.164239, -0.4586361, 2.169138, 1, 0, 0.6901961, 1,
1.168495, 0.06223341, 0.8319931, 1, 0, 0.682353, 1,
1.169849, -0.5378127, 3.20891, 1, 0, 0.6784314, 1,
1.18354, 0.1048278, 1.515142, 1, 0, 0.6705883, 1,
1.184289, 2.33409, 0.8430683, 1, 0, 0.6666667, 1,
1.188888, 1.298868, 0.9375007, 1, 0, 0.6588235, 1,
1.195312, -0.9789468, 1.971734, 1, 0, 0.654902, 1,
1.215591, -0.9829188, 1.893863, 1, 0, 0.6470588, 1,
1.224117, -0.5141118, 1.984647, 1, 0, 0.6431373, 1,
1.227666, -0.8219743, 2.192641, 1, 0, 0.6352941, 1,
1.244894, 1.335685, 1.204837, 1, 0, 0.6313726, 1,
1.249166, 1.280975, 2.408831, 1, 0, 0.6235294, 1,
1.255807, 0.3492207, 1.470796, 1, 0, 0.6196079, 1,
1.279478, 1.177482, 1.050134, 1, 0, 0.6117647, 1,
1.292247, -1.317943, 1.32996, 1, 0, 0.6078432, 1,
1.296568, 0.7609841, 0.9197224, 1, 0, 0.6, 1,
1.301499, -0.02795739, 1.796475, 1, 0, 0.5921569, 1,
1.305573, -1.581737, 0.3944379, 1, 0, 0.5882353, 1,
1.315752, -0.7025877, 2.267491, 1, 0, 0.5803922, 1,
1.348391, 1.391483, 0.8414161, 1, 0, 0.5764706, 1,
1.358893, 0.74858, 0.5893146, 1, 0, 0.5686275, 1,
1.362293, -0.225646, 2.536765, 1, 0, 0.5647059, 1,
1.371389, -1.885837, 1.876465, 1, 0, 0.5568628, 1,
1.375062, -1.024625, 1.892461, 1, 0, 0.5529412, 1,
1.38105, 0.7345843, 1.863412, 1, 0, 0.5450981, 1,
1.386158, 0.2006745, 0.303441, 1, 0, 0.5411765, 1,
1.389827, -0.06393086, -0.3351413, 1, 0, 0.5333334, 1,
1.391184, -1.778531, 3.30759, 1, 0, 0.5294118, 1,
1.39934, -0.4191284, 3.190792, 1, 0, 0.5215687, 1,
1.410925, 0.1696294, 2.097921, 1, 0, 0.5176471, 1,
1.421522, 1.598476, 0.9502968, 1, 0, 0.509804, 1,
1.422306, 0.6669356, -0.6301357, 1, 0, 0.5058824, 1,
1.422797, 0.5738103, 0.9253658, 1, 0, 0.4980392, 1,
1.432474, 0.2010889, 1.038024, 1, 0, 0.4901961, 1,
1.43493, -1.958798, 1.739447, 1, 0, 0.4862745, 1,
1.437988, 0.04628128, 1.488182, 1, 0, 0.4784314, 1,
1.441385, 3.117669, -1.156178, 1, 0, 0.4745098, 1,
1.442749, 0.2795396, 1.413721, 1, 0, 0.4666667, 1,
1.448088, -0.11968, 0.3644505, 1, 0, 0.4627451, 1,
1.451483, -0.4035484, 0.1922899, 1, 0, 0.454902, 1,
1.467803, 2.229134, 0.5192247, 1, 0, 0.4509804, 1,
1.484093, 0.227797, 0.520259, 1, 0, 0.4431373, 1,
1.489019, 0.0437732, 1.270332, 1, 0, 0.4392157, 1,
1.492787, 0.4167881, 1.716509, 1, 0, 0.4313726, 1,
1.495613, -1.510608, 1.795188, 1, 0, 0.427451, 1,
1.500294, -0.5525579, 1.26989, 1, 0, 0.4196078, 1,
1.507716, 0.8500051, 1.232908, 1, 0, 0.4156863, 1,
1.513247, 0.7443561, 2.481789, 1, 0, 0.4078431, 1,
1.522008, -0.1113595, 1.556243, 1, 0, 0.4039216, 1,
1.523284, -0.5394129, 1.025095, 1, 0, 0.3960784, 1,
1.530689, -0.7869876, 1.83283, 1, 0, 0.3882353, 1,
1.538154, 1.06802, -0.6152477, 1, 0, 0.3843137, 1,
1.547689, -0.8491613, 1.800511, 1, 0, 0.3764706, 1,
1.572434, 0.06798171, 0.9881922, 1, 0, 0.372549, 1,
1.575168, -0.2618871, 0.689783, 1, 0, 0.3647059, 1,
1.578902, 1.688776, 1.819431, 1, 0, 0.3607843, 1,
1.583862, -1.020183, 3.260839, 1, 0, 0.3529412, 1,
1.58949, 1.632427, 1.863526, 1, 0, 0.3490196, 1,
1.600832, 0.04278155, 2.740674, 1, 0, 0.3411765, 1,
1.60132, -0.1937785, 0.7411945, 1, 0, 0.3372549, 1,
1.610916, 0.4570794, 1.8214, 1, 0, 0.3294118, 1,
1.610992, 1.45039, -0.2632514, 1, 0, 0.3254902, 1,
1.620476, 1.575402, -0.1734476, 1, 0, 0.3176471, 1,
1.623709, -0.09443772, 2.626296, 1, 0, 0.3137255, 1,
1.625563, 0.4716974, 2.902709, 1, 0, 0.3058824, 1,
1.629895, 0.8699528, 0.6979087, 1, 0, 0.2980392, 1,
1.635599, -0.4826561, 0.3182508, 1, 0, 0.2941177, 1,
1.63721, 1.352408, 0.5598998, 1, 0, 0.2862745, 1,
1.665354, -0.9909353, -0.3682431, 1, 0, 0.282353, 1,
1.672364, 1.061205, 3.473945, 1, 0, 0.2745098, 1,
1.682874, 0.3268548, 1.882306, 1, 0, 0.2705882, 1,
1.685648, 0.9349736, -0.2580986, 1, 0, 0.2627451, 1,
1.697224, 1.536477, 1.800158, 1, 0, 0.2588235, 1,
1.710092, 0.285404, 1.942616, 1, 0, 0.2509804, 1,
1.716757, 0.3218201, 1.253407, 1, 0, 0.2470588, 1,
1.745925, 0.02123555, 3.07636, 1, 0, 0.2392157, 1,
1.748026, -0.2630028, 2.848291, 1, 0, 0.2352941, 1,
1.766879, 1.563934, 1.123792, 1, 0, 0.227451, 1,
1.779896, -2.710881, 1.863401, 1, 0, 0.2235294, 1,
1.792669, 0.01671957, 0.6064458, 1, 0, 0.2156863, 1,
1.824403, -0.1915448, 1.891645, 1, 0, 0.2117647, 1,
1.841189, 0.5450578, 0.458226, 1, 0, 0.2039216, 1,
1.863357, -0.6566406, 1.273011, 1, 0, 0.1960784, 1,
1.877218, 1.62135, 1.904349, 1, 0, 0.1921569, 1,
1.881558, 0.6502159, 0.7885088, 1, 0, 0.1843137, 1,
1.888067, 1.437545, -0.6027712, 1, 0, 0.1803922, 1,
1.888672, 0.2622305, 1.410799, 1, 0, 0.172549, 1,
1.921796, 1.058994, 2.828948, 1, 0, 0.1686275, 1,
1.931192, -0.4365138, 2.335463, 1, 0, 0.1607843, 1,
1.939373, 0.8731953, 1.838437, 1, 0, 0.1568628, 1,
1.944325, -0.5516194, 0.2463101, 1, 0, 0.1490196, 1,
1.970142, 0.9607386, 1.109296, 1, 0, 0.145098, 1,
1.972134, -0.4101342, 1.076202, 1, 0, 0.1372549, 1,
2.000613, -1.057595, 3.042364, 1, 0, 0.1333333, 1,
2.033238, 0.08754094, 3.976917, 1, 0, 0.1254902, 1,
2.044716, 2.61696, 0.5793803, 1, 0, 0.1215686, 1,
2.057496, -0.3673346, 3.032921, 1, 0, 0.1137255, 1,
2.074318, 0.248801, 1.04281, 1, 0, 0.1098039, 1,
2.089916, 0.378322, 2.252793, 1, 0, 0.1019608, 1,
2.101406, -0.1522129, 1.327833, 1, 0, 0.09411765, 1,
2.125011, 1.760732, 1.175336, 1, 0, 0.09019608, 1,
2.125936, 0.0768899, 2.767706, 1, 0, 0.08235294, 1,
2.178288, -0.6536199, 2.202088, 1, 0, 0.07843138, 1,
2.186984, 0.4213581, 0.984077, 1, 0, 0.07058824, 1,
2.248541, 0.04338537, 1.756277, 1, 0, 0.06666667, 1,
2.254169, 0.5225038, 1.672041, 1, 0, 0.05882353, 1,
2.309518, 1.451203, 0.2735755, 1, 0, 0.05490196, 1,
2.345086, 1.544449, 1.012426, 1, 0, 0.04705882, 1,
2.352259, -0.1872332, 1.246695, 1, 0, 0.04313726, 1,
2.390748, -1.283466, 2.248591, 1, 0, 0.03529412, 1,
2.418496, -0.1484334, 1.924373, 1, 0, 0.03137255, 1,
2.468105, -2.202943, 1.255126, 1, 0, 0.02352941, 1,
2.512605, -0.6270526, 2.41783, 1, 0, 0.01960784, 1,
2.606229, 0.4400443, 2.06543, 1, 0, 0.01176471, 1,
2.675174, 1.236595, 1.207121, 1, 0, 0.007843138, 1
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
-0.4410087, -3.975016, -6.84352, 0, -0.5, 0.5, 0.5,
-0.4410087, -3.975016, -6.84352, 1, -0.5, 0.5, 0.5,
-0.4410087, -3.975016, -6.84352, 1, 1.5, 0.5, 0.5,
-0.4410087, -3.975016, -6.84352, 0, 1.5, 0.5, 0.5
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
-4.613577, 0.2540232, -6.84352, 0, -0.5, 0.5, 0.5,
-4.613577, 0.2540232, -6.84352, 1, -0.5, 0.5, 0.5,
-4.613577, 0.2540232, -6.84352, 1, 1.5, 0.5, 0.5,
-4.613577, 0.2540232, -6.84352, 0, 1.5, 0.5, 0.5
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
-4.613577, -3.975016, 0.3820019, 0, -0.5, 0.5, 0.5,
-4.613577, -3.975016, 0.3820019, 1, -0.5, 0.5, 0.5,
-4.613577, -3.975016, 0.3820019, 1, 1.5, 0.5, 0.5,
-4.613577, -3.975016, 0.3820019, 0, 1.5, 0.5, 0.5
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
-3, -2.999084, -5.176092,
2, -2.999084, -5.176092,
-3, -2.999084, -5.176092,
-3, -3.161739, -5.453996,
-2, -2.999084, -5.176092,
-2, -3.161739, -5.453996,
-1, -2.999084, -5.176092,
-1, -3.161739, -5.453996,
0, -2.999084, -5.176092,
0, -3.161739, -5.453996,
1, -2.999084, -5.176092,
1, -3.161739, -5.453996,
2, -2.999084, -5.176092,
2, -3.161739, -5.453996
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
-3, -3.48705, -6.009806, 0, -0.5, 0.5, 0.5,
-3, -3.48705, -6.009806, 1, -0.5, 0.5, 0.5,
-3, -3.48705, -6.009806, 1, 1.5, 0.5, 0.5,
-3, -3.48705, -6.009806, 0, 1.5, 0.5, 0.5,
-2, -3.48705, -6.009806, 0, -0.5, 0.5, 0.5,
-2, -3.48705, -6.009806, 1, -0.5, 0.5, 0.5,
-2, -3.48705, -6.009806, 1, 1.5, 0.5, 0.5,
-2, -3.48705, -6.009806, 0, 1.5, 0.5, 0.5,
-1, -3.48705, -6.009806, 0, -0.5, 0.5, 0.5,
-1, -3.48705, -6.009806, 1, -0.5, 0.5, 0.5,
-1, -3.48705, -6.009806, 1, 1.5, 0.5, 0.5,
-1, -3.48705, -6.009806, 0, 1.5, 0.5, 0.5,
0, -3.48705, -6.009806, 0, -0.5, 0.5, 0.5,
0, -3.48705, -6.009806, 1, -0.5, 0.5, 0.5,
0, -3.48705, -6.009806, 1, 1.5, 0.5, 0.5,
0, -3.48705, -6.009806, 0, 1.5, 0.5, 0.5,
1, -3.48705, -6.009806, 0, -0.5, 0.5, 0.5,
1, -3.48705, -6.009806, 1, -0.5, 0.5, 0.5,
1, -3.48705, -6.009806, 1, 1.5, 0.5, 0.5,
1, -3.48705, -6.009806, 0, 1.5, 0.5, 0.5,
2, -3.48705, -6.009806, 0, -0.5, 0.5, 0.5,
2, -3.48705, -6.009806, 1, -0.5, 0.5, 0.5,
2, -3.48705, -6.009806, 1, 1.5, 0.5, 0.5,
2, -3.48705, -6.009806, 0, 1.5, 0.5, 0.5
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
-3.650676, -2, -5.176092,
-3.650676, 3, -5.176092,
-3.650676, -2, -5.176092,
-3.81116, -2, -5.453996,
-3.650676, -1, -5.176092,
-3.81116, -1, -5.453996,
-3.650676, 0, -5.176092,
-3.81116, 0, -5.453996,
-3.650676, 1, -5.176092,
-3.81116, 1, -5.453996,
-3.650676, 2, -5.176092,
-3.81116, 2, -5.453996,
-3.650676, 3, -5.176092,
-3.81116, 3, -5.453996
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
-4.132127, -2, -6.009806, 0, -0.5, 0.5, 0.5,
-4.132127, -2, -6.009806, 1, -0.5, 0.5, 0.5,
-4.132127, -2, -6.009806, 1, 1.5, 0.5, 0.5,
-4.132127, -2, -6.009806, 0, 1.5, 0.5, 0.5,
-4.132127, -1, -6.009806, 0, -0.5, 0.5, 0.5,
-4.132127, -1, -6.009806, 1, -0.5, 0.5, 0.5,
-4.132127, -1, -6.009806, 1, 1.5, 0.5, 0.5,
-4.132127, -1, -6.009806, 0, 1.5, 0.5, 0.5,
-4.132127, 0, -6.009806, 0, -0.5, 0.5, 0.5,
-4.132127, 0, -6.009806, 1, -0.5, 0.5, 0.5,
-4.132127, 0, -6.009806, 1, 1.5, 0.5, 0.5,
-4.132127, 0, -6.009806, 0, 1.5, 0.5, 0.5,
-4.132127, 1, -6.009806, 0, -0.5, 0.5, 0.5,
-4.132127, 1, -6.009806, 1, -0.5, 0.5, 0.5,
-4.132127, 1, -6.009806, 1, 1.5, 0.5, 0.5,
-4.132127, 1, -6.009806, 0, 1.5, 0.5, 0.5,
-4.132127, 2, -6.009806, 0, -0.5, 0.5, 0.5,
-4.132127, 2, -6.009806, 1, -0.5, 0.5, 0.5,
-4.132127, 2, -6.009806, 1, 1.5, 0.5, 0.5,
-4.132127, 2, -6.009806, 0, 1.5, 0.5, 0.5,
-4.132127, 3, -6.009806, 0, -0.5, 0.5, 0.5,
-4.132127, 3, -6.009806, 1, -0.5, 0.5, 0.5,
-4.132127, 3, -6.009806, 1, 1.5, 0.5, 0.5,
-4.132127, 3, -6.009806, 0, 1.5, 0.5, 0.5
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
-3.650676, -2.999084, -4,
-3.650676, -2.999084, 4,
-3.650676, -2.999084, -4,
-3.81116, -3.161739, -4,
-3.650676, -2.999084, -2,
-3.81116, -3.161739, -2,
-3.650676, -2.999084, 0,
-3.81116, -3.161739, 0,
-3.650676, -2.999084, 2,
-3.81116, -3.161739, 2,
-3.650676, -2.999084, 4,
-3.81116, -3.161739, 4
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
-4.132127, -3.48705, -4, 0, -0.5, 0.5, 0.5,
-4.132127, -3.48705, -4, 1, -0.5, 0.5, 0.5,
-4.132127, -3.48705, -4, 1, 1.5, 0.5, 0.5,
-4.132127, -3.48705, -4, 0, 1.5, 0.5, 0.5,
-4.132127, -3.48705, -2, 0, -0.5, 0.5, 0.5,
-4.132127, -3.48705, -2, 1, -0.5, 0.5, 0.5,
-4.132127, -3.48705, -2, 1, 1.5, 0.5, 0.5,
-4.132127, -3.48705, -2, 0, 1.5, 0.5, 0.5,
-4.132127, -3.48705, 0, 0, -0.5, 0.5, 0.5,
-4.132127, -3.48705, 0, 1, -0.5, 0.5, 0.5,
-4.132127, -3.48705, 0, 1, 1.5, 0.5, 0.5,
-4.132127, -3.48705, 0, 0, 1.5, 0.5, 0.5,
-4.132127, -3.48705, 2, 0, -0.5, 0.5, 0.5,
-4.132127, -3.48705, 2, 1, -0.5, 0.5, 0.5,
-4.132127, -3.48705, 2, 1, 1.5, 0.5, 0.5,
-4.132127, -3.48705, 2, 0, 1.5, 0.5, 0.5,
-4.132127, -3.48705, 4, 0, -0.5, 0.5, 0.5,
-4.132127, -3.48705, 4, 1, -0.5, 0.5, 0.5,
-4.132127, -3.48705, 4, 1, 1.5, 0.5, 0.5,
-4.132127, -3.48705, 4, 0, 1.5, 0.5, 0.5
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
-3.650676, -2.999084, -5.176092,
-3.650676, 3.50713, -5.176092,
-3.650676, -2.999084, 5.940095,
-3.650676, 3.50713, 5.940095,
-3.650676, -2.999084, -5.176092,
-3.650676, -2.999084, 5.940095,
-3.650676, 3.50713, -5.176092,
-3.650676, 3.50713, 5.940095,
-3.650676, -2.999084, -5.176092,
2.768659, -2.999084, -5.176092,
-3.650676, -2.999084, 5.940095,
2.768659, -2.999084, 5.940095,
-3.650676, 3.50713, -5.176092,
2.768659, 3.50713, -5.176092,
-3.650676, 3.50713, 5.940095,
2.768659, 3.50713, 5.940095,
2.768659, -2.999084, -5.176092,
2.768659, 3.50713, -5.176092,
2.768659, -2.999084, 5.940095,
2.768659, 3.50713, 5.940095,
2.768659, -2.999084, -5.176092,
2.768659, -2.999084, 5.940095,
2.768659, 3.50713, -5.176092,
2.768659, 3.50713, 5.940095
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
var radius = 7.684653;
var distance = 34.18989;
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
mvMatrix.translate( 0.4410087, -0.2540232, -0.3820019 );
mvMatrix.scale( 1.294339, 1.277056, 0.7474502 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18989);
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
methanearsonic_acid_<-read.table("methanearsonic_acid_.xyz")
```

```
## Error in read.table("methanearsonic_acid_.xyz"): no lines available in input
```

```r
x<-methanearsonic_acid_$V2
```

```
## Error in eval(expr, envir, enclos): object 'methanearsonic_acid_' not found
```

```r
y<-methanearsonic_acid_$V3
```

```
## Error in eval(expr, envir, enclos): object 'methanearsonic_acid_' not found
```

```r
z<-methanearsonic_acid_$V4
```

```
## Error in eval(expr, envir, enclos): object 'methanearsonic_acid_' not found
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
-3.557191, -1.248607, -2.473607, 0, 0, 1, 1, 1,
-2.704683, 1.976892, -1.363323, 1, 0, 0, 1, 1,
-2.68415, -0.6038514, -0.9459174, 1, 0, 0, 1, 1,
-2.673358, 1.296514, -2.945553, 1, 0, 0, 1, 1,
-2.645982, -1.645043, -1.985977, 1, 0, 0, 1, 1,
-2.609301, 0.9130487, -1.666827, 1, 0, 0, 1, 1,
-2.553513, 1.790741, -2.082598, 0, 0, 0, 1, 1,
-2.481142, 0.9012212, 0.5942308, 0, 0, 0, 1, 1,
-2.436923, -0.9135186, 0.7998243, 0, 0, 0, 1, 1,
-2.41289, 1.011452, -3.861312, 0, 0, 0, 1, 1,
-2.320706, 1.104356, -1.048737, 0, 0, 0, 1, 1,
-2.263452, -0.03856025, -2.639833, 0, 0, 0, 1, 1,
-2.21359, 0.2641132, -0.5377157, 0, 0, 0, 1, 1,
-2.18561, 0.8445471, -1.38237, 1, 1, 1, 1, 1,
-2.178788, 0.9893335, -3.864335, 1, 1, 1, 1, 1,
-2.1777, 1.119134, -2.237218, 1, 1, 1, 1, 1,
-2.158843, 0.8855063, 0.651642, 1, 1, 1, 1, 1,
-2.147942, -0.7332042, -2.562609, 1, 1, 1, 1, 1,
-2.114311, -2.904333, -3.456279, 1, 1, 1, 1, 1,
-2.109983, 0.5023631, -1.583535, 1, 1, 1, 1, 1,
-2.096114, 0.4111207, -2.647981, 1, 1, 1, 1, 1,
-2.057945, -0.1891167, -2.361096, 1, 1, 1, 1, 1,
-2.021673, 1.346055, 0.9742119, 1, 1, 1, 1, 1,
-2.020165, -2.075108, -3.780352, 1, 1, 1, 1, 1,
-2.018535, 0.04976176, -2.613787, 1, 1, 1, 1, 1,
-1.95414, 1.234712, -1.147167, 1, 1, 1, 1, 1,
-1.951971, 0.5362073, -0.1521356, 1, 1, 1, 1, 1,
-1.944797, 0.4727708, -1.875367, 1, 1, 1, 1, 1,
-1.926195, 1.507442, -1.018674, 0, 0, 1, 1, 1,
-1.902552, 0.4616012, 0.8015129, 1, 0, 0, 1, 1,
-1.89769, -0.8746329, -0.7809253, 1, 0, 0, 1, 1,
-1.877693, -0.3908738, -2.143771, 1, 0, 0, 1, 1,
-1.846508, -0.6452348, -2.195116, 1, 0, 0, 1, 1,
-1.821634, 0.4538504, -0.8676054, 1, 0, 0, 1, 1,
-1.814654, -0.1891813, -3.401431, 0, 0, 0, 1, 1,
-1.810658, 0.7055418, -1.54714, 0, 0, 0, 1, 1,
-1.801148, -2.106959, -0.7243624, 0, 0, 0, 1, 1,
-1.79284, 0.2728058, 0.2071059, 0, 0, 0, 1, 1,
-1.79133, -0.2783045, -3.07828, 0, 0, 0, 1, 1,
-1.781508, 1.680044, 0.1798059, 0, 0, 0, 1, 1,
-1.778982, 1.276635, -1.280264, 0, 0, 0, 1, 1,
-1.773545, 0.1680928, -1.025069, 1, 1, 1, 1, 1,
-1.773428, -1.279608, -2.300999, 1, 1, 1, 1, 1,
-1.753904, -0.7713165, -1.236242, 1, 1, 1, 1, 1,
-1.750143, -0.2184846, 0.225286, 1, 1, 1, 1, 1,
-1.747314, -0.8983698, -3.640512, 1, 1, 1, 1, 1,
-1.747275, 0.4761406, -1.397048, 1, 1, 1, 1, 1,
-1.744973, -0.4388734, -2.059377, 1, 1, 1, 1, 1,
-1.709393, 2.011334, -2.401554, 1, 1, 1, 1, 1,
-1.681294, -1.018477, -1.178956, 1, 1, 1, 1, 1,
-1.678255, 0.5980101, -0.1039883, 1, 1, 1, 1, 1,
-1.674623, 0.4054841, -0.002851909, 1, 1, 1, 1, 1,
-1.652281, -1.161755, -1.455787, 1, 1, 1, 1, 1,
-1.650434, 1.184481, -1.68391, 1, 1, 1, 1, 1,
-1.638116, 2.341905, 0.1394576, 1, 1, 1, 1, 1,
-1.609986, 0.2244679, -2.877984, 1, 1, 1, 1, 1,
-1.595324, -1.694148, -2.749414, 0, 0, 1, 1, 1,
-1.581653, -0.7992187, -1.508323, 1, 0, 0, 1, 1,
-1.581578, -0.4349349, -3.080064, 1, 0, 0, 1, 1,
-1.570506, 0.4942586, -3.181578, 1, 0, 0, 1, 1,
-1.566815, -0.3441257, -2.230302, 1, 0, 0, 1, 1,
-1.550564, -0.2788209, -1.668329, 1, 0, 0, 1, 1,
-1.544933, 1.034441, 0.4136478, 0, 0, 0, 1, 1,
-1.515367, 0.2451108, 0.6551335, 0, 0, 0, 1, 1,
-1.514067, -0.5739843, -0.9844801, 0, 0, 0, 1, 1,
-1.490387, -0.1630044, -2.131213, 0, 0, 0, 1, 1,
-1.474234, 0.8188113, -0.4951862, 0, 0, 0, 1, 1,
-1.465395, -1.349639, -0.5964481, 0, 0, 0, 1, 1,
-1.461085, 0.2549095, -0.3949948, 0, 0, 0, 1, 1,
-1.459863, 0.1036577, -1.721147, 1, 1, 1, 1, 1,
-1.458974, 0.6017908, 0.9762808, 1, 1, 1, 1, 1,
-1.45858, -0.2298228, -2.112498, 1, 1, 1, 1, 1,
-1.456197, 2.012216, -1.26784, 1, 1, 1, 1, 1,
-1.452041, -0.2576435, -2.46206, 1, 1, 1, 1, 1,
-1.431956, -0.2896485, -1.543524, 1, 1, 1, 1, 1,
-1.431244, 0.1727673, -1.115839, 1, 1, 1, 1, 1,
-1.402484, 0.1186934, -2.381832, 1, 1, 1, 1, 1,
-1.402271, -0.5850099, -2.602066, 1, 1, 1, 1, 1,
-1.394333, 1.503024, 0.1040289, 1, 1, 1, 1, 1,
-1.392886, -0.3204266, -2.174854, 1, 1, 1, 1, 1,
-1.389416, -1.759559, -3.541534, 1, 1, 1, 1, 1,
-1.386531, 0.2030515, -3.678337, 1, 1, 1, 1, 1,
-1.377826, 0.08202391, -1.636911, 1, 1, 1, 1, 1,
-1.37443, 1.735922, 0.5917864, 1, 1, 1, 1, 1,
-1.36408, 0.4289932, -1.281846, 0, 0, 1, 1, 1,
-1.360952, 0.4104583, -1.780157, 1, 0, 0, 1, 1,
-1.355823, 1.282874, 0.7856536, 1, 0, 0, 1, 1,
-1.349732, 0.2086461, -1.771998, 1, 0, 0, 1, 1,
-1.349397, 0.4183128, -0.498634, 1, 0, 0, 1, 1,
-1.348031, 1.155277, -2.302814, 1, 0, 0, 1, 1,
-1.347802, 0.1411863, -1.383852, 0, 0, 0, 1, 1,
-1.337758, 0.3987921, 0.04469778, 0, 0, 0, 1, 1,
-1.331604, -0.6173584, -2.835032, 0, 0, 0, 1, 1,
-1.327657, 0.3756408, -0.653138, 0, 0, 0, 1, 1,
-1.323831, -0.2330128, -1.306482, 0, 0, 0, 1, 1,
-1.315625, 0.05482886, -0.5370365, 0, 0, 0, 1, 1,
-1.310356, 0.8071768, 0.8611152, 0, 0, 0, 1, 1,
-1.309663, 0.6921417, 0.2040952, 1, 1, 1, 1, 1,
-1.3047, -0.7330366, -3.210174, 1, 1, 1, 1, 1,
-1.301699, 1.299968, -1.29154, 1, 1, 1, 1, 1,
-1.29424, -0.4215671, -2.350994, 1, 1, 1, 1, 1,
-1.292498, 1.543918, -1.44503, 1, 1, 1, 1, 1,
-1.282275, 0.6603654, -0.01383922, 1, 1, 1, 1, 1,
-1.273507, 0.6211947, -0.6248834, 1, 1, 1, 1, 1,
-1.263797, 0.4883983, -1.356699, 1, 1, 1, 1, 1,
-1.246422, 0.5857368, -0.7338291, 1, 1, 1, 1, 1,
-1.240326, 0.6412981, -1.629023, 1, 1, 1, 1, 1,
-1.239921, 0.8797495, -0.9096318, 1, 1, 1, 1, 1,
-1.23956, 0.258653, 0.06119357, 1, 1, 1, 1, 1,
-1.23062, 0.1096643, -1.819972, 1, 1, 1, 1, 1,
-1.215876, 0.629663, -1.534016, 1, 1, 1, 1, 1,
-1.213955, 0.4623135, -1.948927, 1, 1, 1, 1, 1,
-1.212769, -0.09858379, -0.8674176, 0, 0, 1, 1, 1,
-1.209561, -0.8566206, -0.9784532, 1, 0, 0, 1, 1,
-1.206539, -0.05555683, -1.405015, 1, 0, 0, 1, 1,
-1.202071, 2.117736, -0.4419719, 1, 0, 0, 1, 1,
-1.201957, 0.8478844, -1.505063, 1, 0, 0, 1, 1,
-1.197057, -0.05281546, -2.574907, 1, 0, 0, 1, 1,
-1.191041, -0.8034433, -1.836705, 0, 0, 0, 1, 1,
-1.189507, 0.4048527, -1.222336, 0, 0, 0, 1, 1,
-1.185651, 0.8340541, -0.1929876, 0, 0, 0, 1, 1,
-1.182453, -1.686879, -2.080358, 0, 0, 0, 1, 1,
-1.18212, 0.6080716, -1.633484, 0, 0, 0, 1, 1,
-1.179973, -0.02698154, -2.114978, 0, 0, 0, 1, 1,
-1.179012, 0.3472705, -1.097722, 0, 0, 0, 1, 1,
-1.159663, 0.1909575, -1.514351, 1, 1, 1, 1, 1,
-1.158798, 0.1805479, -2.324709, 1, 1, 1, 1, 1,
-1.153288, -0.04074591, -2.955158, 1, 1, 1, 1, 1,
-1.142584, 0.3229408, -1.626774, 1, 1, 1, 1, 1,
-1.141891, 0.1961685, -1.097172, 1, 1, 1, 1, 1,
-1.136507, -1.423333, -1.969502, 1, 1, 1, 1, 1,
-1.133776, 0.4618301, -0.8800849, 1, 1, 1, 1, 1,
-1.129418, 0.3264356, -1.817385, 1, 1, 1, 1, 1,
-1.124382, 1.595987, 0.3058757, 1, 1, 1, 1, 1,
-1.124346, -1.433315, -3.460628, 1, 1, 1, 1, 1,
-1.12069, -0.01263961, -1.301898, 1, 1, 1, 1, 1,
-1.115981, -1.246945, -2.089397, 1, 1, 1, 1, 1,
-1.112258, 0.3384435, 0.1925069, 1, 1, 1, 1, 1,
-1.112016, 0.9605092, -0.7977743, 1, 1, 1, 1, 1,
-1.110046, -0.987457, -2.338664, 1, 1, 1, 1, 1,
-1.108966, 1.472655, -0.4528512, 0, 0, 1, 1, 1,
-1.100718, -1.22149, -3.069538, 1, 0, 0, 1, 1,
-1.099448, -0.5040206, -2.895535, 1, 0, 0, 1, 1,
-1.09606, -0.8628697, -1.85065, 1, 0, 0, 1, 1,
-1.095156, -1.141922, -4.475008, 1, 0, 0, 1, 1,
-1.094328, 0.1601566, -1.777359, 1, 0, 0, 1, 1,
-1.092102, -0.1284161, -0.7234141, 0, 0, 0, 1, 1,
-1.09163, 1.347467, 0.7207885, 0, 0, 0, 1, 1,
-1.08555, -1.184681, -2.751124, 0, 0, 0, 1, 1,
-1.07782, 0.428288, -0.4683178, 0, 0, 0, 1, 1,
-1.065748, 1.006886, -1.012975, 0, 0, 0, 1, 1,
-1.057834, -0.6034254, -1.031979, 0, 0, 0, 1, 1,
-1.05702, -0.7979529, -3.097751, 0, 0, 0, 1, 1,
-1.054052, -0.7410595, -1.043471, 1, 1, 1, 1, 1,
-1.049086, -0.2542405, -1.883443, 1, 1, 1, 1, 1,
-1.048381, 0.004799138, -2.084328, 1, 1, 1, 1, 1,
-1.048321, -0.5073966, -2.036464, 1, 1, 1, 1, 1,
-1.047505, -1.052688, -3.83778, 1, 1, 1, 1, 1,
-1.045072, 0.5183869, 2.267619, 1, 1, 1, 1, 1,
-1.033058, -0.2966639, -1.266323, 1, 1, 1, 1, 1,
-1.032391, -1.580705, -2.412689, 1, 1, 1, 1, 1,
-1.030342, 0.03663505, -1.29896, 1, 1, 1, 1, 1,
-1.011183, -1.375463, -3.830606, 1, 1, 1, 1, 1,
-1.011, -0.5707452, -1.688525, 1, 1, 1, 1, 1,
-1.008604, 0.363552, -0.2123363, 1, 1, 1, 1, 1,
-1.007254, -2.653888, -0.3143489, 1, 1, 1, 1, 1,
-1.00438, -2.534927, -1.808548, 1, 1, 1, 1, 1,
-1.003608, -0.7009675, -0.5886125, 1, 1, 1, 1, 1,
-1.003284, 2.347293, 0.260051, 0, 0, 1, 1, 1,
-1.003065, -0.1005965, 0.3070445, 1, 0, 0, 1, 1,
-0.9928472, 0.6444261, -0.9067475, 1, 0, 0, 1, 1,
-0.9913356, 0.1543868, -2.65665, 1, 0, 0, 1, 1,
-0.9897923, 0.1829166, -1.80698, 1, 0, 0, 1, 1,
-0.9890323, -0.832134, -1.924011, 1, 0, 0, 1, 1,
-0.9850147, 0.9841899, -1.345391, 0, 0, 0, 1, 1,
-0.9767987, -1.390635, -2.458389, 0, 0, 0, 1, 1,
-0.9764606, 0.7695989, 0.2658944, 0, 0, 0, 1, 1,
-0.9736777, 2.547225, -0.5601718, 0, 0, 0, 1, 1,
-0.9725029, -0.2278222, -2.214625, 0, 0, 0, 1, 1,
-0.9688544, 0.4071839, -0.1493215, 0, 0, 0, 1, 1,
-0.962009, -1.670125, -1.343724, 0, 0, 0, 1, 1,
-0.9535021, 0.34547, -1.13119, 1, 1, 1, 1, 1,
-0.9521237, -1.297431, -2.33379, 1, 1, 1, 1, 1,
-0.9467264, 0.6765499, -0.4163419, 1, 1, 1, 1, 1,
-0.9434167, 0.8901783, -0.6786431, 1, 1, 1, 1, 1,
-0.9361583, -1.437273, -3.963721, 1, 1, 1, 1, 1,
-0.9198431, 0.8719354, -1.607715, 1, 1, 1, 1, 1,
-0.9164559, 0.6398035, -2.18375, 1, 1, 1, 1, 1,
-0.9123843, -0.4051093, -0.8243203, 1, 1, 1, 1, 1,
-0.9001676, 0.7500144, -1.487813, 1, 1, 1, 1, 1,
-0.89994, 0.5421802, -0.3526618, 1, 1, 1, 1, 1,
-0.8995756, 0.6288503, -0.02848086, 1, 1, 1, 1, 1,
-0.8980699, 1.112358, -0.949015, 1, 1, 1, 1, 1,
-0.8902724, -0.857483, -2.357208, 1, 1, 1, 1, 1,
-0.8890885, -0.8321931, -2.705086, 1, 1, 1, 1, 1,
-0.8874734, -1.014747, -2.036676, 1, 1, 1, 1, 1,
-0.8845301, 1.598496, -1.75136, 0, 0, 1, 1, 1,
-0.8806751, -0.4006383, 0.2119232, 1, 0, 0, 1, 1,
-0.8752029, 1.04904, 0.3107345, 1, 0, 0, 1, 1,
-0.8748258, -0.5613972, -2.089538, 1, 0, 0, 1, 1,
-0.8745388, 0.5683361, -2.974429, 1, 0, 0, 1, 1,
-0.8581181, -0.9976147, -2.674421, 1, 0, 0, 1, 1,
-0.8556448, -1.068426, -3.343421, 0, 0, 0, 1, 1,
-0.8545205, 0.1841439, -1.228121, 0, 0, 0, 1, 1,
-0.8518177, 0.3301955, -0.5764156, 0, 0, 0, 1, 1,
-0.8463253, -1.222815, -3.675606, 0, 0, 0, 1, 1,
-0.8440363, -0.4205271, -2.794436, 0, 0, 0, 1, 1,
-0.8416283, 0.8685705, -3.124333, 0, 0, 0, 1, 1,
-0.8355119, 0.7983016, -3.505002, 0, 0, 0, 1, 1,
-0.8350637, -0.5427833, -0.2212174, 1, 1, 1, 1, 1,
-0.8313344, 1.498213, 1.39176, 1, 1, 1, 1, 1,
-0.812672, 0.1111103, -2.842476, 1, 1, 1, 1, 1,
-0.8038954, -0.9624709, -2.045262, 1, 1, 1, 1, 1,
-0.7997808, -1.273495, -2.185833, 1, 1, 1, 1, 1,
-0.7925456, 0.6335557, 0.5200783, 1, 1, 1, 1, 1,
-0.7780433, -0.6919274, 0.221276, 1, 1, 1, 1, 1,
-0.7776569, -0.8720562, -4.418692, 1, 1, 1, 1, 1,
-0.7718055, 0.2192461, -2.430395, 1, 1, 1, 1, 1,
-0.7680091, 3.330971, -1.383328, 1, 1, 1, 1, 1,
-0.7619169, 1.203951, -0.2394431, 1, 1, 1, 1, 1,
-0.7517084, -0.4479082, -2.594505, 1, 1, 1, 1, 1,
-0.7484463, -1.266561, -2.517582, 1, 1, 1, 1, 1,
-0.7475321, -1.028395, -2.674639, 1, 1, 1, 1, 1,
-0.7464138, 1.071594, -0.1654032, 1, 1, 1, 1, 1,
-0.7399368, -0.4543603, -2.554048, 0, 0, 1, 1, 1,
-0.7379155, 1.733121, -0.5957404, 1, 0, 0, 1, 1,
-0.7338884, -0.5382985, -3.007402, 1, 0, 0, 1, 1,
-0.7307838, -0.3386633, -0.3645972, 1, 0, 0, 1, 1,
-0.729948, -0.7386044, -2.690725, 1, 0, 0, 1, 1,
-0.7283856, 1.37807, 0.657587, 1, 0, 0, 1, 1,
-0.7262477, -0.5265957, -1.042944, 0, 0, 0, 1, 1,
-0.7240751, 0.6808383, -1.216896, 0, 0, 0, 1, 1,
-0.7153124, 1.908073, 0.1090503, 0, 0, 0, 1, 1,
-0.7142393, 1.360916, 1.326553, 0, 0, 0, 1, 1,
-0.7111335, 0.2812778, -1.466571, 0, 0, 0, 1, 1,
-0.7098964, 0.1219466, -0.8925223, 0, 0, 0, 1, 1,
-0.7081245, -0.6636951, -2.530036, 0, 0, 0, 1, 1,
-0.7030083, 2.010153, 0.7549103, 1, 1, 1, 1, 1,
-0.7023635, 1.406125, -2.370919, 1, 1, 1, 1, 1,
-0.7010139, -0.9072884, -3.544231, 1, 1, 1, 1, 1,
-0.6948854, 0.2723766, -0.2107436, 1, 1, 1, 1, 1,
-0.6874886, -1.391964, -4.011465, 1, 1, 1, 1, 1,
-0.68573, -1.24387, -3.678475, 1, 1, 1, 1, 1,
-0.6849584, -0.1690611, -2.672558, 1, 1, 1, 1, 1,
-0.6845294, -0.8321587, -1.444215, 1, 1, 1, 1, 1,
-0.683954, 0.2384181, -2.359454, 1, 1, 1, 1, 1,
-0.6789846, 1.372987, -0.7676495, 1, 1, 1, 1, 1,
-0.6760506, 0.04007123, 0.3625821, 1, 1, 1, 1, 1,
-0.6702247, -0.5292523, -3.272317, 1, 1, 1, 1, 1,
-0.6688217, -0.452305, -2.285633, 1, 1, 1, 1, 1,
-0.6686715, 0.8044068, -2.408862, 1, 1, 1, 1, 1,
-0.6685054, 1.328919, -0.647386, 1, 1, 1, 1, 1,
-0.6605605, -0.3723798, -2.949169, 0, 0, 1, 1, 1,
-0.6569315, 0.3530675, -1.595328, 1, 0, 0, 1, 1,
-0.6503642, 1.77524, -0.03170455, 1, 0, 0, 1, 1,
-0.6475478, 0.2570628, -1.882126, 1, 0, 0, 1, 1,
-0.6473399, 0.3797492, 0.2323954, 1, 0, 0, 1, 1,
-0.6462316, -0.4292348, -2.583302, 1, 0, 0, 1, 1,
-0.6306139, 1.006197, -0.939285, 0, 0, 0, 1, 1,
-0.6273115, 0.5056349, 0.3764877, 0, 0, 0, 1, 1,
-0.6226273, -0.4336942, 0.1505386, 0, 0, 0, 1, 1,
-0.6212053, -0.2418502, -1.658536, 0, 0, 0, 1, 1,
-0.6186517, -0.1779426, -4.366814, 0, 0, 0, 1, 1,
-0.6136048, 1.039442, 0.7552375, 0, 0, 0, 1, 1,
-0.6090932, -0.1212253, -2.254919, 0, 0, 0, 1, 1,
-0.6073895, 0.5862855, -0.5207084, 1, 1, 1, 1, 1,
-0.6069004, -0.3528669, -2.509014, 1, 1, 1, 1, 1,
-0.6059464, 0.3035287, -0.2521432, 1, 1, 1, 1, 1,
-0.6052766, -0.2012921, -2.236614, 1, 1, 1, 1, 1,
-0.604508, 0.7428063, -1.481331, 1, 1, 1, 1, 1,
-0.6016551, -0.4985484, -1.728904, 1, 1, 1, 1, 1,
-0.5975125, 0.2387733, -1.730527, 1, 1, 1, 1, 1,
-0.597398, -0.3590056, -2.858591, 1, 1, 1, 1, 1,
-0.5962422, 1.372747, 0.4542336, 1, 1, 1, 1, 1,
-0.5954372, 0.03086066, -0.5927666, 1, 1, 1, 1, 1,
-0.5932086, 2.981846, 0.9541125, 1, 1, 1, 1, 1,
-0.5842762, -1.178402, -0.6174083, 1, 1, 1, 1, 1,
-0.5822181, 0.03148267, -0.1598398, 1, 1, 1, 1, 1,
-0.5806351, -1.444219, -3.251124, 1, 1, 1, 1, 1,
-0.5793282, -1.210188, -3.428608, 1, 1, 1, 1, 1,
-0.5793088, 0.3202732, -2.33584, 0, 0, 1, 1, 1,
-0.5716859, 0.09228291, 0.136273, 1, 0, 0, 1, 1,
-0.5702561, 0.9141966, -0.4215859, 1, 0, 0, 1, 1,
-0.5696023, 0.2873169, 0.1099389, 1, 0, 0, 1, 1,
-0.5676782, -0.06293283, -0.3881134, 1, 0, 0, 1, 1,
-0.5592405, -0.3288597, -1.391713, 1, 0, 0, 1, 1,
-0.5586347, 1.956493, 0.1166212, 0, 0, 0, 1, 1,
-0.5586056, -0.1602763, -2.003105, 0, 0, 0, 1, 1,
-0.5563666, 0.6543671, 0.4903021, 0, 0, 0, 1, 1,
-0.5548128, -1.880583, -2.215847, 0, 0, 0, 1, 1,
-0.5536267, 0.3246718, -2.5562, 0, 0, 0, 1, 1,
-0.5526523, 2.277766, 0.4746908, 0, 0, 0, 1, 1,
-0.5491384, 0.9352305, -0.1272913, 0, 0, 0, 1, 1,
-0.5491327, -0.8158689, -2.748863, 1, 1, 1, 1, 1,
-0.5453478, 1.722586, -1.131596, 1, 1, 1, 1, 1,
-0.543707, -2.038202, -2.894794, 1, 1, 1, 1, 1,
-0.5433849, -0.09832197, 0.5489474, 1, 1, 1, 1, 1,
-0.5432203, -0.1742813, -1.732353, 1, 1, 1, 1, 1,
-0.5427721, -0.1421492, -1.369528, 1, 1, 1, 1, 1,
-0.5418741, 0.4073429, 1.059034, 1, 1, 1, 1, 1,
-0.541582, 0.8232949, -1.631875, 1, 1, 1, 1, 1,
-0.539301, 1.588673, -0.6947571, 1, 1, 1, 1, 1,
-0.5385927, 0.8510016, 0.3635779, 1, 1, 1, 1, 1,
-0.5347868, 0.3790105, -2.242727, 1, 1, 1, 1, 1,
-0.5286595, -0.4624256, -1.083033, 1, 1, 1, 1, 1,
-0.5283509, -2.042603, -1.163531, 1, 1, 1, 1, 1,
-0.5228742, -0.9202028, -2.427665, 1, 1, 1, 1, 1,
-0.5175462, 1.363525, -0.1151463, 1, 1, 1, 1, 1,
-0.5167264, -0.9382931, -2.187837, 0, 0, 1, 1, 1,
-0.5137159, -0.1730087, -2.06907, 1, 0, 0, 1, 1,
-0.5125262, 1.494112, -0.07916646, 1, 0, 0, 1, 1,
-0.5108311, 0.6685829, 0.3717064, 1, 0, 0, 1, 1,
-0.5088901, 1.24004, -1.810751, 1, 0, 0, 1, 1,
-0.5087245, 0.6871272, -1.626241, 1, 0, 0, 1, 1,
-0.501213, 0.2123714, -0.7481867, 0, 0, 0, 1, 1,
-0.4941524, 0.2191481, -1.746235, 0, 0, 0, 1, 1,
-0.4920855, -0.9981608, -3.949923, 0, 0, 0, 1, 1,
-0.4895929, 0.3106383, -0.7351455, 0, 0, 0, 1, 1,
-0.4844173, -0.3776292, -1.970963, 0, 0, 0, 1, 1,
-0.4840233, -0.129715, -1.959886, 0, 0, 0, 1, 1,
-0.4831875, -1.564941, -2.486124, 0, 0, 0, 1, 1,
-0.4831797, -0.7910876, -2.399887, 1, 1, 1, 1, 1,
-0.4815946, -1.208682, -1.139326, 1, 1, 1, 1, 1,
-0.4731595, 0.1138271, -1.896004, 1, 1, 1, 1, 1,
-0.4731121, -0.8824384, -1.598709, 1, 1, 1, 1, 1,
-0.4691793, -0.4057366, -3.815655, 1, 1, 1, 1, 1,
-0.4691031, 0.5156382, -1.482662, 1, 1, 1, 1, 1,
-0.4571658, 1.318714, -1.692695, 1, 1, 1, 1, 1,
-0.4561764, 0.1341616, -2.184942, 1, 1, 1, 1, 1,
-0.4560343, -0.463684, -1.063034, 1, 1, 1, 1, 1,
-0.4532432, -1.233372, -3.017497, 1, 1, 1, 1, 1,
-0.4499445, 0.2645287, -2.049172, 1, 1, 1, 1, 1,
-0.4440668, 0.6946377, -0.1124673, 1, 1, 1, 1, 1,
-0.4434674, -0.7716734, -3.30388, 1, 1, 1, 1, 1,
-0.443113, 1.177963, -0.2985998, 1, 1, 1, 1, 1,
-0.4399631, -0.126886, -2.228418, 1, 1, 1, 1, 1,
-0.4363016, 0.03700186, -0.9244123, 0, 0, 1, 1, 1,
-0.4340605, -0.0958091, -1.815264, 1, 0, 0, 1, 1,
-0.4339387, -0.3102497, -3.575101, 1, 0, 0, 1, 1,
-0.4336953, 0.1444049, -1.726488, 1, 0, 0, 1, 1,
-0.4303097, -0.4765138, -3.595511, 1, 0, 0, 1, 1,
-0.4297654, 1.265423, -0.3657745, 1, 0, 0, 1, 1,
-0.4296235, 0.0007831561, -0.8889837, 0, 0, 0, 1, 1,
-0.4285755, -1.31939, -2.200108, 0, 0, 0, 1, 1,
-0.4261045, 0.6673338, -1.537372, 0, 0, 0, 1, 1,
-0.4206493, -0.4924526, -1.50901, 0, 0, 0, 1, 1,
-0.4194307, -0.3715701, -2.258337, 0, 0, 0, 1, 1,
-0.4185071, -0.3911622, -2.626407, 0, 0, 0, 1, 1,
-0.4146168, 0.1111255, -0.9369521, 0, 0, 0, 1, 1,
-0.4125959, 0.2037596, -0.9552059, 1, 1, 1, 1, 1,
-0.4075018, -1.113875, -2.088983, 1, 1, 1, 1, 1,
-0.4054091, 1.216317, -0.4812855, 1, 1, 1, 1, 1,
-0.4038701, -0.8323864, -2.989691, 1, 1, 1, 1, 1,
-0.4033912, -0.2935471, -0.4794317, 1, 1, 1, 1, 1,
-0.4005866, -0.7765003, -4.010292, 1, 1, 1, 1, 1,
-0.3983672, -0.3441669, -0.5583516, 1, 1, 1, 1, 1,
-0.3978685, -0.2577034, -1.368781, 1, 1, 1, 1, 1,
-0.3963687, -0.7858791, -1.133668, 1, 1, 1, 1, 1,
-0.3909161, -0.05787232, -0.3476931, 1, 1, 1, 1, 1,
-0.3906057, -0.5973134, -2.60366, 1, 1, 1, 1, 1,
-0.3876179, 1.709511, -1.641858, 1, 1, 1, 1, 1,
-0.3854055, -0.5328932, -0.6813974, 1, 1, 1, 1, 1,
-0.3835944, -0.8147954, -1.861566, 1, 1, 1, 1, 1,
-0.3830853, -0.2810503, -1.790589, 1, 1, 1, 1, 1,
-0.3805901, 0.5279412, -0.8899842, 0, 0, 1, 1, 1,
-0.3794768, 0.9065206, -1.395763, 1, 0, 0, 1, 1,
-0.3793567, -0.9227295, -2.109549, 1, 0, 0, 1, 1,
-0.3787884, 1.381123, 0.9327795, 1, 0, 0, 1, 1,
-0.3748974, -1.454768, -2.352326, 1, 0, 0, 1, 1,
-0.3716384, 1.910342, -0.2353757, 1, 0, 0, 1, 1,
-0.3685963, -0.7418863, -3.608829, 0, 0, 0, 1, 1,
-0.3524025, -1.234415, -3.413392, 0, 0, 0, 1, 1,
-0.3494546, 0.1502016, -1.470089, 0, 0, 0, 1, 1,
-0.3488806, -0.6300421, -2.220042, 0, 0, 0, 1, 1,
-0.3450835, -1.201352, -1.660109, 0, 0, 0, 1, 1,
-0.3402146, -0.02065935, -0.5850028, 0, 0, 0, 1, 1,
-0.3349101, -0.9595252, -2.944726, 0, 0, 0, 1, 1,
-0.3316881, 1.451128, 0.5366766, 1, 1, 1, 1, 1,
-0.3316329, 0.6333861, 0.9153975, 1, 1, 1, 1, 1,
-0.3291933, 1.673365, -0.6652106, 1, 1, 1, 1, 1,
-0.329115, -0.6977586, -2.427639, 1, 1, 1, 1, 1,
-0.3287319, -0.4046775, -3.935654, 1, 1, 1, 1, 1,
-0.3258828, 0.06384247, -3.386156, 1, 1, 1, 1, 1,
-0.3256645, -0.4457199, -3.124128, 1, 1, 1, 1, 1,
-0.3227209, 2.151294, 0.7906134, 1, 1, 1, 1, 1,
-0.3222927, -1.343628, -2.069212, 1, 1, 1, 1, 1,
-0.3200469, -0.7560494, -3.096812, 1, 1, 1, 1, 1,
-0.3199787, -0.2886573, -2.426699, 1, 1, 1, 1, 1,
-0.3191337, -0.208249, -1.337652, 1, 1, 1, 1, 1,
-0.3186125, 0.4804505, 0.6329201, 1, 1, 1, 1, 1,
-0.3169276, -0.06009476, -3.236522, 1, 1, 1, 1, 1,
-0.3149506, 0.8665957, -1.434966, 1, 1, 1, 1, 1,
-0.3147172, 0.82688, -0.7019233, 0, 0, 1, 1, 1,
-0.3119959, 0.2551501, -1.13391, 1, 0, 0, 1, 1,
-0.3094458, -0.3462449, -3.313241, 1, 0, 0, 1, 1,
-0.306794, -0.8044798, -2.852485, 1, 0, 0, 1, 1,
-0.3056119, 0.4608661, -0.766387, 1, 0, 0, 1, 1,
-0.3025324, -0.6073307, -3.184561, 1, 0, 0, 1, 1,
-0.2995379, -0.4891568, -2.800216, 0, 0, 0, 1, 1,
-0.297231, -0.01661854, -3.197683, 0, 0, 0, 1, 1,
-0.2958516, 0.3394318, -0.6057532, 0, 0, 0, 1, 1,
-0.2949, 0.4262859, -0.1578629, 0, 0, 0, 1, 1,
-0.2894599, -0.8620447, -1.243246, 0, 0, 0, 1, 1,
-0.2873705, -0.3110045, -3.261196, 0, 0, 0, 1, 1,
-0.2856748, -0.9608629, -4.211295, 0, 0, 0, 1, 1,
-0.2856401, -0.4968437, -1.911837, 1, 1, 1, 1, 1,
-0.2767813, 0.8969012, -0.652118, 1, 1, 1, 1, 1,
-0.2749728, 0.4468632, 1.531447, 1, 1, 1, 1, 1,
-0.2747846, 0.9482478, -0.4213664, 1, 1, 1, 1, 1,
-0.2713838, -0.6985621, -4.516453, 1, 1, 1, 1, 1,
-0.2701122, 1.342368, 0.02195767, 1, 1, 1, 1, 1,
-0.2684868, 1.050225, -0.1138035, 1, 1, 1, 1, 1,
-0.2677698, 0.9521952, 1.221705, 1, 1, 1, 1, 1,
-0.2664562, -1.506408, -1.489737, 1, 1, 1, 1, 1,
-0.2651301, 0.5797812, -0.8901751, 1, 1, 1, 1, 1,
-0.2638071, 0.1423558, -0.7488105, 1, 1, 1, 1, 1,
-0.2568966, 0.1663541, -1.091418, 1, 1, 1, 1, 1,
-0.2536116, 0.2168346, -0.9205723, 1, 1, 1, 1, 1,
-0.252326, -0.6623865, -2.853038, 1, 1, 1, 1, 1,
-0.2453433, -0.2220487, -4.599717, 1, 1, 1, 1, 1,
-0.2448949, 2.216306, 1.107034, 0, 0, 1, 1, 1,
-0.2442358, -0.3525071, -2.786192, 1, 0, 0, 1, 1,
-0.2415671, -0.8085934, -1.550817, 1, 0, 0, 1, 1,
-0.2414599, -0.4097994, -1.742994, 1, 0, 0, 1, 1,
-0.2402759, 0.9054034, -0.8174018, 1, 0, 0, 1, 1,
-0.2392815, 0.979813, -0.347353, 1, 0, 0, 1, 1,
-0.2313653, 1.477371, 0.1174202, 0, 0, 0, 1, 1,
-0.2228651, -0.4341073, -2.076553, 0, 0, 0, 1, 1,
-0.2173126, 1.083565, -0.06987551, 0, 0, 0, 1, 1,
-0.2143695, -1.487392, -1.670229, 0, 0, 0, 1, 1,
-0.2108614, -1.313179, -4.145202, 0, 0, 0, 1, 1,
-0.2104793, 0.01192883, -0.7343063, 0, 0, 0, 1, 1,
-0.2058748, -1.148381, -2.947938, 0, 0, 0, 1, 1,
-0.2049239, -0.9426728, -0.93012, 1, 1, 1, 1, 1,
-0.2045335, -1.278002, -3.182291, 1, 1, 1, 1, 1,
-0.2041172, 0.1329702, 0.2019311, 1, 1, 1, 1, 1,
-0.2016253, -0.8974885, -1.263782, 1, 1, 1, 1, 1,
-0.2001131, -0.07355511, -0.4973408, 1, 1, 1, 1, 1,
-0.1995969, 1.125188, -0.2490041, 1, 1, 1, 1, 1,
-0.1984849, -1.048146, -3.696551, 1, 1, 1, 1, 1,
-0.1968554, -0.5438842, -3.227288, 1, 1, 1, 1, 1,
-0.1895305, -0.310999, -3.551559, 1, 1, 1, 1, 1,
-0.1888566, -1.649965, -1.359124, 1, 1, 1, 1, 1,
-0.188571, 0.7417751, -0.08937731, 1, 1, 1, 1, 1,
-0.1728682, -0.3283106, -2.686685, 1, 1, 1, 1, 1,
-0.1678503, -0.7091202, -3.099881, 1, 1, 1, 1, 1,
-0.1677967, -0.6478413, -4.33218, 1, 1, 1, 1, 1,
-0.1642153, 0.4101528, -0.3463059, 1, 1, 1, 1, 1,
-0.1577526, 0.4852647, -0.08544564, 0, 0, 1, 1, 1,
-0.1571865, -0.1148046, -1.233913, 1, 0, 0, 1, 1,
-0.153664, -0.5554183, -3.327381, 1, 0, 0, 1, 1,
-0.1528595, -0.9232779, -2.174186, 1, 0, 0, 1, 1,
-0.1499034, -1.227077, -5.014205, 1, 0, 0, 1, 1,
-0.1497502, 0.5545802, -0.1625348, 1, 0, 0, 1, 1,
-0.1488042, -0.359612, -1.731553, 0, 0, 0, 1, 1,
-0.1477667, 0.07284361, -1.026139, 0, 0, 0, 1, 1,
-0.1477504, -1.935701, -4.906997, 0, 0, 0, 1, 1,
-0.1468968, -1.338521, -3.272611, 0, 0, 0, 1, 1,
-0.1450739, 1.36001, -0.7040655, 0, 0, 0, 1, 1,
-0.1407483, 0.6717234, -0.3923801, 0, 0, 0, 1, 1,
-0.139319, 0.7523749, -0.7096149, 0, 0, 0, 1, 1,
-0.1373425, -0.6118105, -2.714021, 1, 1, 1, 1, 1,
-0.137031, 0.01507656, -1.280236, 1, 1, 1, 1, 1,
-0.1339408, -0.1291907, -2.149266, 1, 1, 1, 1, 1,
-0.1284013, 0.6999382, -0.1314272, 1, 1, 1, 1, 1,
-0.1273549, 0.3195536, -2.096532, 1, 1, 1, 1, 1,
-0.125363, 0.9272764, 1.097439, 1, 1, 1, 1, 1,
-0.1246073, -0.4492708, -4.851253, 1, 1, 1, 1, 1,
-0.1243783, -0.07595222, -2.622545, 1, 1, 1, 1, 1,
-0.1232289, 1.66544, -1.571245, 1, 1, 1, 1, 1,
-0.1184051, -1.494373, -1.968775, 1, 1, 1, 1, 1,
-0.117007, -0.01116017, 0.4471026, 1, 1, 1, 1, 1,
-0.116767, 1.53581, 0.7464471, 1, 1, 1, 1, 1,
-0.1147582, -0.09110239, -1.189741, 1, 1, 1, 1, 1,
-0.1136787, -0.4781905, -3.007864, 1, 1, 1, 1, 1,
-0.112728, -0.9578665, -2.229552, 1, 1, 1, 1, 1,
-0.1113983, -1.199563, -2.062632, 0, 0, 1, 1, 1,
-0.1048626, 1.290671, -0.01964719, 1, 0, 0, 1, 1,
-0.1018247, 0.9444489, 0.1687734, 1, 0, 0, 1, 1,
-0.09963313, -0.2773671, -2.865691, 1, 0, 0, 1, 1,
-0.09385001, -0.7375088, -3.073168, 1, 0, 0, 1, 1,
-0.09272756, 0.82932, 0.9494501, 1, 0, 0, 1, 1,
-0.09076986, -0.8089899, -4.020881, 0, 0, 0, 1, 1,
-0.08537068, 1.550816, 0.7159743, 0, 0, 0, 1, 1,
-0.08417704, -1.270261, -3.486481, 0, 0, 0, 1, 1,
-0.07202087, -1.563749, -2.828953, 0, 0, 0, 1, 1,
-0.07179855, -0.1103965, -2.493281, 0, 0, 0, 1, 1,
-0.06828777, 0.251424, -1.045807, 0, 0, 0, 1, 1,
-0.06292288, -0.2151813, -3.136186, 0, 0, 0, 1, 1,
-0.06056944, 0.9980718, -0.1466229, 1, 1, 1, 1, 1,
-0.05719665, 1.083863, -0.5918199, 1, 1, 1, 1, 1,
-0.05546166, 1.162656, -0.3362723, 1, 1, 1, 1, 1,
-0.05424317, 1.059426, -1.522234, 1, 1, 1, 1, 1,
-0.05241273, 1.467267, -0.2918618, 1, 1, 1, 1, 1,
-0.05197011, -0.09043077, -1.581751, 1, 1, 1, 1, 1,
-0.04629415, 0.6994283, -1.583732, 1, 1, 1, 1, 1,
-0.03808326, -0.4639484, -3.134902, 1, 1, 1, 1, 1,
-0.03646028, -0.873192, -1.686592, 1, 1, 1, 1, 1,
-0.03291062, 0.5412045, 0.7667333, 1, 1, 1, 1, 1,
-0.03070584, 0.7733928, 0.4849979, 1, 1, 1, 1, 1,
-0.0304766, 1.575693, -0.06899961, 1, 1, 1, 1, 1,
-0.02977575, -1.234713, -4.090672, 1, 1, 1, 1, 1,
-0.02425976, 0.4266411, -1.598351, 1, 1, 1, 1, 1,
-0.02078258, -0.6198912, -3.58947, 1, 1, 1, 1, 1,
-0.0207735, 0.002711565, -2.279715, 0, 0, 1, 1, 1,
-0.01933048, 1.030262, -0.7098895, 1, 0, 0, 1, 1,
-0.01743732, 1.040805, 1.523613, 1, 0, 0, 1, 1,
-0.01085141, 1.964711, 0.9293039, 1, 0, 0, 1, 1,
-0.01004371, 0.05124288, -0.867479, 1, 0, 0, 1, 1,
-0.008810719, -1.14504, -3.092996, 1, 0, 0, 1, 1,
-4.164973e-05, 1.07113, -0.8765298, 0, 0, 0, 1, 1,
-2.493174e-05, 0.3516203, 0.5306884, 0, 0, 0, 1, 1,
0.001432016, -0.8687972, 4.50968, 0, 0, 0, 1, 1,
0.001644157, -1.012323, 3.110633, 0, 0, 0, 1, 1,
0.001825549, -0.375894, 2.645974, 0, 0, 0, 1, 1,
0.01276382, -1.905056, 2.610352, 0, 0, 0, 1, 1,
0.0137902, -0.2800382, 4.544402, 0, 0, 0, 1, 1,
0.01549616, 1.108183, 0.2722787, 1, 1, 1, 1, 1,
0.01644531, -0.6269667, 2.552032, 1, 1, 1, 1, 1,
0.01673172, 0.09378935, 0.1900276, 1, 1, 1, 1, 1,
0.01817879, 0.1121358, 1.260942, 1, 1, 1, 1, 1,
0.02008026, -0.2274526, 3.934063, 1, 1, 1, 1, 1,
0.02118194, 0.6235555, -1.103626, 1, 1, 1, 1, 1,
0.02234702, -0.3242475, 2.598335, 1, 1, 1, 1, 1,
0.02250535, -0.362707, 1.21062, 1, 1, 1, 1, 1,
0.0236638, -0.05774089, 1.477249, 1, 1, 1, 1, 1,
0.02527685, 0.7466435, 1.046744, 1, 1, 1, 1, 1,
0.02567964, 0.5159329, 0.7264535, 1, 1, 1, 1, 1,
0.03060665, -0.6405472, 1.742601, 1, 1, 1, 1, 1,
0.04276125, -0.2807092, 1.381932, 1, 1, 1, 1, 1,
0.04417989, -0.6776934, 1.70325, 1, 1, 1, 1, 1,
0.04482869, 2.238693, -0.3029428, 1, 1, 1, 1, 1,
0.04775549, 0.1677411, -1.352433, 0, 0, 1, 1, 1,
0.04785125, 1.056818, 1.088004, 1, 0, 0, 1, 1,
0.05319507, 0.4400213, -1.494453, 1, 0, 0, 1, 1,
0.05367747, 0.0309988, -0.683556, 1, 0, 0, 1, 1,
0.05448505, 1.315279, 1.616011, 1, 0, 0, 1, 1,
0.06009452, -0.2776685, 1.44275, 1, 0, 0, 1, 1,
0.06021655, -1.20773, 3.67531, 0, 0, 0, 1, 1,
0.06047394, -0.8111343, 1.867674, 0, 0, 0, 1, 1,
0.06241362, -0.6465953, 2.464982, 0, 0, 0, 1, 1,
0.06241591, 2.385433, 1.561882, 0, 0, 0, 1, 1,
0.06289876, -0.819064, 2.645074, 0, 0, 0, 1, 1,
0.06489992, 1.266304, -1.977132, 0, 0, 0, 1, 1,
0.06543953, 0.6810815, -0.7463848, 0, 0, 0, 1, 1,
0.06697793, -0.9179342, 2.66556, 1, 1, 1, 1, 1,
0.06853463, 0.441585, 0.04210575, 1, 1, 1, 1, 1,
0.06894638, -0.5166545, 2.77207, 1, 1, 1, 1, 1,
0.07129319, 2.041819, 0.2491837, 1, 1, 1, 1, 1,
0.07537471, -1.979754, 1.47261, 1, 1, 1, 1, 1,
0.07553397, 0.1978803, 0.695698, 1, 1, 1, 1, 1,
0.07826275, 0.1446034, 0.9497172, 1, 1, 1, 1, 1,
0.08205408, -0.5808081, 2.041874, 1, 1, 1, 1, 1,
0.08252946, -0.974692, 4.242515, 1, 1, 1, 1, 1,
0.08331583, 0.5701226, 1.025932, 1, 1, 1, 1, 1,
0.08331912, -2.29175, 2.138501, 1, 1, 1, 1, 1,
0.08851533, 0.1737878, 0.5445307, 1, 1, 1, 1, 1,
0.08885733, 0.02744527, -0.04091556, 1, 1, 1, 1, 1,
0.08966368, 0.9078957, -1.315178, 1, 1, 1, 1, 1,
0.1000369, 0.9229717, 0.04707452, 1, 1, 1, 1, 1,
0.1005278, 0.6097963, 0.742442, 0, 0, 1, 1, 1,
0.1007853, -0.04639369, 1.47622, 1, 0, 0, 1, 1,
0.1033075, 0.6783525, 1.03396, 1, 0, 0, 1, 1,
0.1036089, -0.05393025, 1.461484, 1, 0, 0, 1, 1,
0.1097966, 0.8937882, 0.06496056, 1, 0, 0, 1, 1,
0.1106592, -2.766786, 4.401662, 1, 0, 0, 1, 1,
0.1135915, 1.269277, 0.2178774, 0, 0, 0, 1, 1,
0.1147181, 0.1305231, -0.430261, 0, 0, 0, 1, 1,
0.1197096, -0.2143002, 2.766253, 0, 0, 0, 1, 1,
0.1220453, 1.223222, 1.811662, 0, 0, 0, 1, 1,
0.1227343, -1.323352, 4.869554, 0, 0, 0, 1, 1,
0.1235128, -0.3425741, 3.48399, 0, 0, 0, 1, 1,
0.1247526, -1.23217, 3.040737, 0, 0, 0, 1, 1,
0.1308747, -0.2510734, 2.557914, 1, 1, 1, 1, 1,
0.1315355, -0.9357616, 4.24544, 1, 1, 1, 1, 1,
0.1360345, 1.072284, -0.2310958, 1, 1, 1, 1, 1,
0.1365674, 1.387438, 1.613628, 1, 1, 1, 1, 1,
0.1472209, 1.22503, 1.285995, 1, 1, 1, 1, 1,
0.1566135, -0.09254642, 1.899792, 1, 1, 1, 1, 1,
0.1578635, 1.050588, 0.1515333, 1, 1, 1, 1, 1,
0.1608973, 0.5137541, 0.1409533, 1, 1, 1, 1, 1,
0.164436, -0.5215774, 1.282262, 1, 1, 1, 1, 1,
0.1734025, 0.6369959, 0.5747176, 1, 1, 1, 1, 1,
0.178597, 0.2956176, 0.4715579, 1, 1, 1, 1, 1,
0.1796317, -0.2507526, 1.619909, 1, 1, 1, 1, 1,
0.1823313, 0.4257534, 1.346542, 1, 1, 1, 1, 1,
0.1936591, 2.006279, -0.1346736, 1, 1, 1, 1, 1,
0.1936914, -0.07320983, 1.731688, 1, 1, 1, 1, 1,
0.201306, -0.5487685, 1.593014, 0, 0, 1, 1, 1,
0.2013996, -1.31289, 5.778209, 1, 0, 0, 1, 1,
0.2034249, 0.1057487, 1.959457, 1, 0, 0, 1, 1,
0.203701, 0.5539973, -0.7622351, 1, 0, 0, 1, 1,
0.2045111, 1.797796, -0.5940352, 1, 0, 0, 1, 1,
0.2049228, -0.4072084, 3.024621, 1, 0, 0, 1, 1,
0.2095896, 0.3684341, 1.830994, 0, 0, 0, 1, 1,
0.2104921, -0.08158192, 1.552088, 0, 0, 0, 1, 1,
0.211584, 0.1770396, 0.7455832, 0, 0, 0, 1, 1,
0.2124201, 0.5000302, 0.1182094, 0, 0, 0, 1, 1,
0.2140226, -1.06987, 2.765099, 0, 0, 0, 1, 1,
0.2143615, 0.3139545, 0.6750326, 0, 0, 0, 1, 1,
0.2177552, 1.262505, 1.227421, 0, 0, 0, 1, 1,
0.2238667, -0.6650919, 4.566993, 1, 1, 1, 1, 1,
0.2275623, 0.7627927, 0.09261921, 1, 1, 1, 1, 1,
0.2320202, -1.530532, 3.664009, 1, 1, 1, 1, 1,
0.2337967, 0.5250715, 0.8319103, 1, 1, 1, 1, 1,
0.241386, -0.4259745, 1.62186, 1, 1, 1, 1, 1,
0.2478615, -1.115332, 4.82574, 1, 1, 1, 1, 1,
0.2494787, -0.2416635, 2.664166, 1, 1, 1, 1, 1,
0.2514138, -0.1571157, 1.517835, 1, 1, 1, 1, 1,
0.2517808, -0.5837476, 2.799131, 1, 1, 1, 1, 1,
0.2540984, 0.07092838, 2.221046, 1, 1, 1, 1, 1,
0.256516, -1.178495, 2.417808, 1, 1, 1, 1, 1,
0.2582687, -0.1587933, 1.62029, 1, 1, 1, 1, 1,
0.2588299, -0.5340062, 2.622702, 1, 1, 1, 1, 1,
0.259117, -1.470782, 1.718846, 1, 1, 1, 1, 1,
0.2597177, -1.902068, 4.650737, 1, 1, 1, 1, 1,
0.2606778, -0.4571899, 1.813816, 0, 0, 1, 1, 1,
0.2623163, 0.642678, -0.0471227, 1, 0, 0, 1, 1,
0.2640279, -1.056816, 3.148865, 1, 0, 0, 1, 1,
0.2664606, -0.7555827, 2.665226, 1, 0, 0, 1, 1,
0.2733395, 0.4140166, 1.194028, 1, 0, 0, 1, 1,
0.2747209, 0.8654081, -1.474549, 1, 0, 0, 1, 1,
0.2809412, -0.3157609, 2.530141, 0, 0, 0, 1, 1,
0.2815094, -1.202022, 2.651274, 0, 0, 0, 1, 1,
0.2820601, 1.103073, 0.04601223, 0, 0, 0, 1, 1,
0.2828936, -0.6091481, 2.086014, 0, 0, 0, 1, 1,
0.2862445, 0.8637919, 1.658668, 0, 0, 0, 1, 1,
0.2877756, -0.1613718, 2.555476, 0, 0, 0, 1, 1,
0.2903574, -1.066954, 4.468525, 0, 0, 0, 1, 1,
0.291168, -0.4504018, 2.937051, 1, 1, 1, 1, 1,
0.2912126, 0.3455066, 1.057812, 1, 1, 1, 1, 1,
0.2947134, -1.828164, 1.999962, 1, 1, 1, 1, 1,
0.2966137, -0.4063652, 2.201299, 1, 1, 1, 1, 1,
0.298918, -1.502722, 2.86004, 1, 1, 1, 1, 1,
0.3042293, -0.1863122, 0.06225143, 1, 1, 1, 1, 1,
0.3048109, -1.321967, 1.852383, 1, 1, 1, 1, 1,
0.306493, 0.9582456, 0.07273609, 1, 1, 1, 1, 1,
0.3132217, -0.1596231, 2.242378, 1, 1, 1, 1, 1,
0.3173037, -0.1528132, 1.635476, 1, 1, 1, 1, 1,
0.3272231, 0.3235702, 1.172682, 1, 1, 1, 1, 1,
0.3287029, 0.03253561, 3.020017, 1, 1, 1, 1, 1,
0.3324566, -0.4455811, 2.361322, 1, 1, 1, 1, 1,
0.3505461, -1.640696, 3.844776, 1, 1, 1, 1, 1,
0.3516868, 1.492475, -0.4423239, 1, 1, 1, 1, 1,
0.3520089, -1.323133, 2.177157, 0, 0, 1, 1, 1,
0.3607329, 1.131105, 1.070953, 1, 0, 0, 1, 1,
0.3610824, 0.340468, 1.13379, 1, 0, 0, 1, 1,
0.3627517, -1.251119, 3.991525, 1, 0, 0, 1, 1,
0.3631301, -0.0399191, 0.7959924, 1, 0, 0, 1, 1,
0.3680666, 0.8383766, -0.6437534, 1, 0, 0, 1, 1,
0.3693703, 0.6754801, -0.1955327, 0, 0, 0, 1, 1,
0.3708149, -0.3680631, 3.948107, 0, 0, 0, 1, 1,
0.3711676, -1.534403, 1.640898, 0, 0, 0, 1, 1,
0.3714646, -1.538971, 2.645289, 0, 0, 0, 1, 1,
0.3732316, -0.01990188, 2.263086, 0, 0, 0, 1, 1,
0.3737766, 1.364669, 1.320689, 0, 0, 0, 1, 1,
0.374084, 0.3754881, 2.216845, 0, 0, 0, 1, 1,
0.3749654, -0.9874917, 3.459826, 1, 1, 1, 1, 1,
0.377864, -0.2629904, 2.941387, 1, 1, 1, 1, 1,
0.3782332, 1.157254, 0.4573716, 1, 1, 1, 1, 1,
0.3892202, -0.2957903, 2.552642, 1, 1, 1, 1, 1,
0.3941902, -1.03892, 4.309898, 1, 1, 1, 1, 1,
0.3965233, 0.04559269, 0.8188348, 1, 1, 1, 1, 1,
0.4005913, 1.309646, 0.4239505, 1, 1, 1, 1, 1,
0.4010805, 0.4887028, -1.093238, 1, 1, 1, 1, 1,
0.4020525, -0.3415163, 2.330194, 1, 1, 1, 1, 1,
0.4034388, -0.4192125, 3.337517, 1, 1, 1, 1, 1,
0.4053106, 0.8736191, -0.009334983, 1, 1, 1, 1, 1,
0.4072062, -0.6121289, 3.311371, 1, 1, 1, 1, 1,
0.4102983, 2.41592, 0.2974497, 1, 1, 1, 1, 1,
0.4114102, 1.227225, 1.007561, 1, 1, 1, 1, 1,
0.4189931, 0.2828054, 2.706255, 1, 1, 1, 1, 1,
0.4248006, -1.146109, 2.139481, 0, 0, 1, 1, 1,
0.4253871, -0.4454071, 1.466268, 1, 0, 0, 1, 1,
0.431522, -1.997716, 3.938782, 1, 0, 0, 1, 1,
0.4321316, 1.274885, 0.459248, 1, 0, 0, 1, 1,
0.4325572, -0.2030165, 3.366481, 1, 0, 0, 1, 1,
0.4345021, 1.81245, 2.28532, 1, 0, 0, 1, 1,
0.4360143, 0.9778773, 0.1743021, 0, 0, 0, 1, 1,
0.4371134, -0.1742833, 2.956355, 0, 0, 0, 1, 1,
0.4410041, 1.025428, -0.5010905, 0, 0, 0, 1, 1,
0.4445392, -1.139432, 2.998289, 0, 0, 0, 1, 1,
0.4457376, 1.886397, 0.7685566, 0, 0, 0, 1, 1,
0.4483201, 0.4946337, 0.341235, 0, 0, 0, 1, 1,
0.4527756, -1.062871, 1.718347, 0, 0, 0, 1, 1,
0.4534879, 0.5215127, 1.105473, 1, 1, 1, 1, 1,
0.4566214, -0.5952488, 3.39864, 1, 1, 1, 1, 1,
0.4601313, 1.072534, 1.211536, 1, 1, 1, 1, 1,
0.4604282, -0.2697619, 1.370026, 1, 1, 1, 1, 1,
0.460886, -0.4734532, 2.065988, 1, 1, 1, 1, 1,
0.4643467, 2.119028, -0.9210769, 1, 1, 1, 1, 1,
0.4651806, 1.39408, -1.083493, 1, 1, 1, 1, 1,
0.4660007, 1.802409, 0.3317027, 1, 1, 1, 1, 1,
0.4669566, -1.066477, 2.000402, 1, 1, 1, 1, 1,
0.4698981, -0.5962669, 2.781611, 1, 1, 1, 1, 1,
0.4700396, -0.5798629, 2.896251, 1, 1, 1, 1, 1,
0.4733059, 0.9318678, 1.886333, 1, 1, 1, 1, 1,
0.4749999, 0.5299172, 0.9683626, 1, 1, 1, 1, 1,
0.4846496, 0.4987637, 0.08893061, 1, 1, 1, 1, 1,
0.4860917, 0.6464654, -0.07081655, 1, 1, 1, 1, 1,
0.4932073, 0.942897, 0.2292987, 0, 0, 1, 1, 1,
0.4934083, -0.8761374, 3.643264, 1, 0, 0, 1, 1,
0.4964099, 0.01923494, 1.501855, 1, 0, 0, 1, 1,
0.4968484, 1.119006, 1.127653, 1, 0, 0, 1, 1,
0.5033624, 1.027602, 1.665312, 1, 0, 0, 1, 1,
0.5034276, 0.5589494, 0.5574662, 1, 0, 0, 1, 1,
0.5062575, -0.3258947, 2.284491, 0, 0, 0, 1, 1,
0.5063192, 0.369268, 1.533144, 0, 0, 0, 1, 1,
0.5111676, 0.3540693, 1.857128, 0, 0, 0, 1, 1,
0.5120924, -0.657577, 2.54773, 0, 0, 0, 1, 1,
0.52144, 0.7474269, 1.652951, 0, 0, 0, 1, 1,
0.5322036, 0.4808109, 0.7150147, 0, 0, 0, 1, 1,
0.5323625, -0.6891949, 1.610469, 0, 0, 0, 1, 1,
0.5378302, 1.203433, -1.219928, 1, 1, 1, 1, 1,
0.5404366, 0.3615386, 0.4179247, 1, 1, 1, 1, 1,
0.5463009, 0.3973823, 1.821556, 1, 1, 1, 1, 1,
0.5478372, -2.108189, 2.271721, 1, 1, 1, 1, 1,
0.5485246, 0.8856696, -1.067822, 1, 1, 1, 1, 1,
0.5492218, -0.2963292, 0.6455496, 1, 1, 1, 1, 1,
0.5532576, 0.9628386, 1.353578, 1, 1, 1, 1, 1,
0.5575876, 2.167323, -0.573231, 1, 1, 1, 1, 1,
0.5636697, 0.094432, 0.4178982, 1, 1, 1, 1, 1,
0.5651094, 0.892538, 1.489069, 1, 1, 1, 1, 1,
0.570482, -0.3256617, 0.6699085, 1, 1, 1, 1, 1,
0.572037, -0.9172558, 1.13022, 1, 1, 1, 1, 1,
0.5727917, -0.5849088, 2.027522, 1, 1, 1, 1, 1,
0.5892462, -1.847091, 3.111368, 1, 1, 1, 1, 1,
0.5910193, -1.133959, 0.9883202, 1, 1, 1, 1, 1,
0.5911747, 1.081461, 0.09327643, 0, 0, 1, 1, 1,
0.5919498, 0.08425176, 3.146209, 1, 0, 0, 1, 1,
0.5930192, 0.9701132, 1.456264, 1, 0, 0, 1, 1,
0.5943964, 1.149165, -1.678227, 1, 0, 0, 1, 1,
0.5966533, -0.1077829, 3.257492, 1, 0, 0, 1, 1,
0.5993271, 0.2265159, 2.16338, 1, 0, 0, 1, 1,
0.5996888, -1.647886, 3.089191, 0, 0, 0, 1, 1,
0.6012099, 0.5814111, 1.433851, 0, 0, 0, 1, 1,
0.6025382, 0.3427209, 0.3217763, 0, 0, 0, 1, 1,
0.603034, 1.150047, 0.7111523, 0, 0, 0, 1, 1,
0.6033991, -0.7916036, 2.602783, 0, 0, 0, 1, 1,
0.6205246, -0.305284, 2.571182, 0, 0, 0, 1, 1,
0.6223021, -2.059602, 3.306322, 0, 0, 0, 1, 1,
0.6269944, -1.383107, 2.465645, 1, 1, 1, 1, 1,
0.627252, 1.205462, 0.1977668, 1, 1, 1, 1, 1,
0.6306655, -1.746162, 2.19864, 1, 1, 1, 1, 1,
0.6365296, -0.6750712, 2.276033, 1, 1, 1, 1, 1,
0.6386074, -2.053959, 3.917447, 1, 1, 1, 1, 1,
0.6391426, -1.29655, 3.367342, 1, 1, 1, 1, 1,
0.6397023, -0.09999031, 1.770901, 1, 1, 1, 1, 1,
0.641608, 0.07960887, 3.928666, 1, 1, 1, 1, 1,
0.642533, -0.7681447, 1.976456, 1, 1, 1, 1, 1,
0.6450343, 0.571476, 0.07079499, 1, 1, 1, 1, 1,
0.6455886, -0.8284315, 2.733156, 1, 1, 1, 1, 1,
0.6509097, 1.021736, 0.7314975, 1, 1, 1, 1, 1,
0.6517083, 0.7609864, -0.1568737, 1, 1, 1, 1, 1,
0.65674, 0.9827677, 1.773461, 1, 1, 1, 1, 1,
0.6618276, 0.7747515, 0.03836547, 1, 1, 1, 1, 1,
0.6636598, -1.95093, 2.830491, 0, 0, 1, 1, 1,
0.6656644, 0.4410325, -0.5577365, 1, 0, 0, 1, 1,
0.6676378, -0.6066806, 1.960896, 1, 0, 0, 1, 1,
0.6712654, 3.198025, 0.4289127, 1, 0, 0, 1, 1,
0.6888309, 0.7236305, 1.321109, 1, 0, 0, 1, 1,
0.6906611, -1.809023, 3.540494, 1, 0, 0, 1, 1,
0.6954234, -0.9145205, 3.955457, 0, 0, 0, 1, 1,
0.6988398, -1.523574, 3.844211, 0, 0, 0, 1, 1,
0.7034442, -1.209914, 3.758745, 0, 0, 0, 1, 1,
0.7039033, 0.9076189, -0.3149969, 0, 0, 0, 1, 1,
0.705105, -0.04150839, 3.57684, 0, 0, 0, 1, 1,
0.7095015, -0.1305923, 3.610708, 0, 0, 0, 1, 1,
0.7100253, -0.4235171, 2.698915, 0, 0, 0, 1, 1,
0.712935, 0.1012013, 1.189578, 1, 1, 1, 1, 1,
0.7153351, 1.050946, 1.683136, 1, 1, 1, 1, 1,
0.7199219, -1.697047, 3.958172, 1, 1, 1, 1, 1,
0.7204456, 0.4745282, 1.534972, 1, 1, 1, 1, 1,
0.739862, -0.7419192, 0.9365566, 1, 1, 1, 1, 1,
0.7405829, -0.4763738, 2.468244, 1, 1, 1, 1, 1,
0.7408029, 0.9445833, 2.363145, 1, 1, 1, 1, 1,
0.7438678, 0.05166393, 0.7011, 1, 1, 1, 1, 1,
0.7441697, -1.365352, 2.362833, 1, 1, 1, 1, 1,
0.7525399, -1.52229, 2.631164, 1, 1, 1, 1, 1,
0.7570246, 1.074166, 1.413243, 1, 1, 1, 1, 1,
0.7589788, -0.08344665, 2.014433, 1, 1, 1, 1, 1,
0.7614803, 0.3183965, 1.08593, 1, 1, 1, 1, 1,
0.7638512, -0.3050296, 2.446142, 1, 1, 1, 1, 1,
0.7646928, 0.05170035, 2.815141, 1, 1, 1, 1, 1,
0.7655375, -0.2750705, 1.847368, 0, 0, 1, 1, 1,
0.773257, -2.173808, 3.100316, 1, 0, 0, 1, 1,
0.7754449, -1.643301, 2.706053, 1, 0, 0, 1, 1,
0.7780381, -0.1778271, 1.675163, 1, 0, 0, 1, 1,
0.7842489, 0.5062101, -0.4226447, 1, 0, 0, 1, 1,
0.7848213, 0.1427084, 0.8500419, 1, 0, 0, 1, 1,
0.785471, -0.9849501, 3.301003, 0, 0, 0, 1, 1,
0.7877045, -1.419607, 3.927279, 0, 0, 0, 1, 1,
0.7957553, -1.487716, 2.990236, 0, 0, 0, 1, 1,
0.7959612, -0.9920281, 4.322936, 0, 0, 0, 1, 1,
0.814083, -0.3309404, 0.5500711, 0, 0, 0, 1, 1,
0.8162116, -0.2041232, 3.320694, 0, 0, 0, 1, 1,
0.8164227, -1.536328, 2.692271, 0, 0, 0, 1, 1,
0.8183256, -1.598088, 2.811134, 1, 1, 1, 1, 1,
0.820691, -0.8733432, 2.371334, 1, 1, 1, 1, 1,
0.826433, 0.1927381, 1.452154, 1, 1, 1, 1, 1,
0.8268017, -0.1590095, 1.927379, 1, 1, 1, 1, 1,
0.8326316, 0.6536307, 1.582944, 1, 1, 1, 1, 1,
0.8338218, -1.641067, 2.68202, 1, 1, 1, 1, 1,
0.8344495, -0.773221, 3.507594, 1, 1, 1, 1, 1,
0.836301, 1.164264, 0.4113382, 1, 1, 1, 1, 1,
0.8368038, -0.7960964, 2.059135, 1, 1, 1, 1, 1,
0.8377039, 0.2508246, 1.346519, 1, 1, 1, 1, 1,
0.848282, 3.41238, 1.528794, 1, 1, 1, 1, 1,
0.8493029, -0.1454075, 1.378083, 1, 1, 1, 1, 1,
0.8531147, -1.123182, 3.688795, 1, 1, 1, 1, 1,
0.854709, -0.5069393, 2.493719, 1, 1, 1, 1, 1,
0.8625271, -1.396591, 2.961008, 1, 1, 1, 1, 1,
0.8644489, 0.2914062, -0.2638809, 0, 0, 1, 1, 1,
0.8655791, 0.7361848, -0.4197513, 1, 0, 0, 1, 1,
0.8684369, -0.6903028, 1.576884, 1, 0, 0, 1, 1,
0.8693172, -0.9141794, 2.927211, 1, 0, 0, 1, 1,
0.8707839, -1.819805, 1.786492, 1, 0, 0, 1, 1,
0.8755038, 0.9509531, 1.447938, 1, 0, 0, 1, 1,
0.8784091, 0.8490213, 0.2435513, 0, 0, 0, 1, 1,
0.8923264, -1.308808, 1.624753, 0, 0, 0, 1, 1,
0.8958943, -1.011145, 3.810635, 0, 0, 0, 1, 1,
0.896329, -0.7265082, 1.290324, 0, 0, 0, 1, 1,
0.9040535, -1.838935, 2.705328, 0, 0, 0, 1, 1,
0.9042989, -0.09662477, 1.417915, 0, 0, 0, 1, 1,
0.9083482, -0.1920751, 1.412892, 0, 0, 0, 1, 1,
0.909104, 0.1017151, 1.111942, 1, 1, 1, 1, 1,
0.9105802, -0.09723615, 3.613095, 1, 1, 1, 1, 1,
0.9167717, 0.354498, 1.042738, 1, 1, 1, 1, 1,
0.919556, 1.484069, 1.142406, 1, 1, 1, 1, 1,
0.9199945, 1.471401, 1.18816, 1, 1, 1, 1, 1,
0.9213196, 1.674744, 0.007158764, 1, 1, 1, 1, 1,
0.9221682, 0.6454365, 1.496181, 1, 1, 1, 1, 1,
0.9240975, -0.113667, 1.774233, 1, 1, 1, 1, 1,
0.9271142, 1.077936, -0.2000006, 1, 1, 1, 1, 1,
0.9300799, 0.6542134, 2.629121, 1, 1, 1, 1, 1,
0.9313515, 0.3951404, 0.8536215, 1, 1, 1, 1, 1,
0.9369045, -1.095308, 2.678168, 1, 1, 1, 1, 1,
0.938558, 1.559163, 1.313081, 1, 1, 1, 1, 1,
0.9387149, 0.4059524, 1.008113, 1, 1, 1, 1, 1,
0.9419236, -0.1120678, 0.9255813, 1, 1, 1, 1, 1,
0.9427504, -0.480119, 2.409202, 0, 0, 1, 1, 1,
0.94429, 0.07240307, 0.7802891, 1, 0, 0, 1, 1,
0.9453068, -0.8177714, 1.297276, 1, 0, 0, 1, 1,
0.9479159, 1.092175, 1.72128, 1, 0, 0, 1, 1,
0.9490916, 1.274231, -0.2100444, 1, 0, 0, 1, 1,
0.9494755, -0.9267592, 0.9328044, 1, 0, 0, 1, 1,
0.9533492, 0.3710155, 1.956236, 0, 0, 0, 1, 1,
0.9540454, -0.9189942, 2.808637, 0, 0, 0, 1, 1,
0.9575711, 1.749513, 0.9814925, 0, 0, 0, 1, 1,
0.9614114, 0.3328539, 1.462258, 0, 0, 0, 1, 1,
0.9730113, -1.174436, 2.013076, 0, 0, 0, 1, 1,
0.9743674, 1.522694, -0.3807214, 0, 0, 0, 1, 1,
0.9788137, -0.5259299, 2.246689, 0, 0, 0, 1, 1,
0.9790757, 1.150327, 1.70402, 1, 1, 1, 1, 1,
0.9795299, -0.2771521, 1.494021, 1, 1, 1, 1, 1,
0.9805614, 0.7314729, 1.937657, 1, 1, 1, 1, 1,
0.9814118, -0.5957326, 2.188368, 1, 1, 1, 1, 1,
0.9860616, -0.9446847, 2.196175, 1, 1, 1, 1, 1,
0.9877126, -0.6458954, 4.141998, 1, 1, 1, 1, 1,
0.9968129, 0.1306636, 1.412185, 1, 1, 1, 1, 1,
1.021145, -0.3725932, 1.647108, 1, 1, 1, 1, 1,
1.032714, -0.5699525, 2.944485, 1, 1, 1, 1, 1,
1.036228, -0.5069255, 3.584875, 1, 1, 1, 1, 1,
1.039303, 0.1795478, 1.439571, 1, 1, 1, 1, 1,
1.041243, -1.511363, 2.616749, 1, 1, 1, 1, 1,
1.048699, 1.566419, 0.3871582, 1, 1, 1, 1, 1,
1.062418, -0.07117563, 1.302751, 1, 1, 1, 1, 1,
1.077505, -0.2583744, 1.839235, 1, 1, 1, 1, 1,
1.098649, 2.109771, 0.9551069, 0, 0, 1, 1, 1,
1.101969, 1.187488, 0.7456932, 1, 0, 0, 1, 1,
1.104428, 0.8680863, 0.4983861, 1, 0, 0, 1, 1,
1.107581, -0.5594608, 0.3476529, 1, 0, 0, 1, 1,
1.112418, -0.5128245, 2.513353, 1, 0, 0, 1, 1,
1.11586, -0.3008144, 1.503511, 1, 0, 0, 1, 1,
1.121568, -0.5838506, 1.428171, 0, 0, 0, 1, 1,
1.127062, 1.010615, 1.284863, 0, 0, 0, 1, 1,
1.136832, -0.6657531, 1.554379, 0, 0, 0, 1, 1,
1.139189, -1.812369, 2.627067, 0, 0, 0, 1, 1,
1.141347, -0.9357156, 1.615013, 0, 0, 0, 1, 1,
1.141354, -0.9047616, 3.50877, 0, 0, 0, 1, 1,
1.145424, 0.6121099, 2.010505, 0, 0, 0, 1, 1,
1.146677, -1.118916, 1.138783, 1, 1, 1, 1, 1,
1.147272, 0.3494688, 2.768675, 1, 1, 1, 1, 1,
1.156155, 0.1952439, 2.273055, 1, 1, 1, 1, 1,
1.162209, 0.3590463, 3.12923, 1, 1, 1, 1, 1,
1.164239, -0.4586361, 2.169138, 1, 1, 1, 1, 1,
1.168495, 0.06223341, 0.8319931, 1, 1, 1, 1, 1,
1.169849, -0.5378127, 3.20891, 1, 1, 1, 1, 1,
1.18354, 0.1048278, 1.515142, 1, 1, 1, 1, 1,
1.184289, 2.33409, 0.8430683, 1, 1, 1, 1, 1,
1.188888, 1.298868, 0.9375007, 1, 1, 1, 1, 1,
1.195312, -0.9789468, 1.971734, 1, 1, 1, 1, 1,
1.215591, -0.9829188, 1.893863, 1, 1, 1, 1, 1,
1.224117, -0.5141118, 1.984647, 1, 1, 1, 1, 1,
1.227666, -0.8219743, 2.192641, 1, 1, 1, 1, 1,
1.244894, 1.335685, 1.204837, 1, 1, 1, 1, 1,
1.249166, 1.280975, 2.408831, 0, 0, 1, 1, 1,
1.255807, 0.3492207, 1.470796, 1, 0, 0, 1, 1,
1.279478, 1.177482, 1.050134, 1, 0, 0, 1, 1,
1.292247, -1.317943, 1.32996, 1, 0, 0, 1, 1,
1.296568, 0.7609841, 0.9197224, 1, 0, 0, 1, 1,
1.301499, -0.02795739, 1.796475, 1, 0, 0, 1, 1,
1.305573, -1.581737, 0.3944379, 0, 0, 0, 1, 1,
1.315752, -0.7025877, 2.267491, 0, 0, 0, 1, 1,
1.348391, 1.391483, 0.8414161, 0, 0, 0, 1, 1,
1.358893, 0.74858, 0.5893146, 0, 0, 0, 1, 1,
1.362293, -0.225646, 2.536765, 0, 0, 0, 1, 1,
1.371389, -1.885837, 1.876465, 0, 0, 0, 1, 1,
1.375062, -1.024625, 1.892461, 0, 0, 0, 1, 1,
1.38105, 0.7345843, 1.863412, 1, 1, 1, 1, 1,
1.386158, 0.2006745, 0.303441, 1, 1, 1, 1, 1,
1.389827, -0.06393086, -0.3351413, 1, 1, 1, 1, 1,
1.391184, -1.778531, 3.30759, 1, 1, 1, 1, 1,
1.39934, -0.4191284, 3.190792, 1, 1, 1, 1, 1,
1.410925, 0.1696294, 2.097921, 1, 1, 1, 1, 1,
1.421522, 1.598476, 0.9502968, 1, 1, 1, 1, 1,
1.422306, 0.6669356, -0.6301357, 1, 1, 1, 1, 1,
1.422797, 0.5738103, 0.9253658, 1, 1, 1, 1, 1,
1.432474, 0.2010889, 1.038024, 1, 1, 1, 1, 1,
1.43493, -1.958798, 1.739447, 1, 1, 1, 1, 1,
1.437988, 0.04628128, 1.488182, 1, 1, 1, 1, 1,
1.441385, 3.117669, -1.156178, 1, 1, 1, 1, 1,
1.442749, 0.2795396, 1.413721, 1, 1, 1, 1, 1,
1.448088, -0.11968, 0.3644505, 1, 1, 1, 1, 1,
1.451483, -0.4035484, 0.1922899, 0, 0, 1, 1, 1,
1.467803, 2.229134, 0.5192247, 1, 0, 0, 1, 1,
1.484093, 0.227797, 0.520259, 1, 0, 0, 1, 1,
1.489019, 0.0437732, 1.270332, 1, 0, 0, 1, 1,
1.492787, 0.4167881, 1.716509, 1, 0, 0, 1, 1,
1.495613, -1.510608, 1.795188, 1, 0, 0, 1, 1,
1.500294, -0.5525579, 1.26989, 0, 0, 0, 1, 1,
1.507716, 0.8500051, 1.232908, 0, 0, 0, 1, 1,
1.513247, 0.7443561, 2.481789, 0, 0, 0, 1, 1,
1.522008, -0.1113595, 1.556243, 0, 0, 0, 1, 1,
1.523284, -0.5394129, 1.025095, 0, 0, 0, 1, 1,
1.530689, -0.7869876, 1.83283, 0, 0, 0, 1, 1,
1.538154, 1.06802, -0.6152477, 0, 0, 0, 1, 1,
1.547689, -0.8491613, 1.800511, 1, 1, 1, 1, 1,
1.572434, 0.06798171, 0.9881922, 1, 1, 1, 1, 1,
1.575168, -0.2618871, 0.689783, 1, 1, 1, 1, 1,
1.578902, 1.688776, 1.819431, 1, 1, 1, 1, 1,
1.583862, -1.020183, 3.260839, 1, 1, 1, 1, 1,
1.58949, 1.632427, 1.863526, 1, 1, 1, 1, 1,
1.600832, 0.04278155, 2.740674, 1, 1, 1, 1, 1,
1.60132, -0.1937785, 0.7411945, 1, 1, 1, 1, 1,
1.610916, 0.4570794, 1.8214, 1, 1, 1, 1, 1,
1.610992, 1.45039, -0.2632514, 1, 1, 1, 1, 1,
1.620476, 1.575402, -0.1734476, 1, 1, 1, 1, 1,
1.623709, -0.09443772, 2.626296, 1, 1, 1, 1, 1,
1.625563, 0.4716974, 2.902709, 1, 1, 1, 1, 1,
1.629895, 0.8699528, 0.6979087, 1, 1, 1, 1, 1,
1.635599, -0.4826561, 0.3182508, 1, 1, 1, 1, 1,
1.63721, 1.352408, 0.5598998, 0, 0, 1, 1, 1,
1.665354, -0.9909353, -0.3682431, 1, 0, 0, 1, 1,
1.672364, 1.061205, 3.473945, 1, 0, 0, 1, 1,
1.682874, 0.3268548, 1.882306, 1, 0, 0, 1, 1,
1.685648, 0.9349736, -0.2580986, 1, 0, 0, 1, 1,
1.697224, 1.536477, 1.800158, 1, 0, 0, 1, 1,
1.710092, 0.285404, 1.942616, 0, 0, 0, 1, 1,
1.716757, 0.3218201, 1.253407, 0, 0, 0, 1, 1,
1.745925, 0.02123555, 3.07636, 0, 0, 0, 1, 1,
1.748026, -0.2630028, 2.848291, 0, 0, 0, 1, 1,
1.766879, 1.563934, 1.123792, 0, 0, 0, 1, 1,
1.779896, -2.710881, 1.863401, 0, 0, 0, 1, 1,
1.792669, 0.01671957, 0.6064458, 0, 0, 0, 1, 1,
1.824403, -0.1915448, 1.891645, 1, 1, 1, 1, 1,
1.841189, 0.5450578, 0.458226, 1, 1, 1, 1, 1,
1.863357, -0.6566406, 1.273011, 1, 1, 1, 1, 1,
1.877218, 1.62135, 1.904349, 1, 1, 1, 1, 1,
1.881558, 0.6502159, 0.7885088, 1, 1, 1, 1, 1,
1.888067, 1.437545, -0.6027712, 1, 1, 1, 1, 1,
1.888672, 0.2622305, 1.410799, 1, 1, 1, 1, 1,
1.921796, 1.058994, 2.828948, 1, 1, 1, 1, 1,
1.931192, -0.4365138, 2.335463, 1, 1, 1, 1, 1,
1.939373, 0.8731953, 1.838437, 1, 1, 1, 1, 1,
1.944325, -0.5516194, 0.2463101, 1, 1, 1, 1, 1,
1.970142, 0.9607386, 1.109296, 1, 1, 1, 1, 1,
1.972134, -0.4101342, 1.076202, 1, 1, 1, 1, 1,
2.000613, -1.057595, 3.042364, 1, 1, 1, 1, 1,
2.033238, 0.08754094, 3.976917, 1, 1, 1, 1, 1,
2.044716, 2.61696, 0.5793803, 0, 0, 1, 1, 1,
2.057496, -0.3673346, 3.032921, 1, 0, 0, 1, 1,
2.074318, 0.248801, 1.04281, 1, 0, 0, 1, 1,
2.089916, 0.378322, 2.252793, 1, 0, 0, 1, 1,
2.101406, -0.1522129, 1.327833, 1, 0, 0, 1, 1,
2.125011, 1.760732, 1.175336, 1, 0, 0, 1, 1,
2.125936, 0.0768899, 2.767706, 0, 0, 0, 1, 1,
2.178288, -0.6536199, 2.202088, 0, 0, 0, 1, 1,
2.186984, 0.4213581, 0.984077, 0, 0, 0, 1, 1,
2.248541, 0.04338537, 1.756277, 0, 0, 0, 1, 1,
2.254169, 0.5225038, 1.672041, 0, 0, 0, 1, 1,
2.309518, 1.451203, 0.2735755, 0, 0, 0, 1, 1,
2.345086, 1.544449, 1.012426, 0, 0, 0, 1, 1,
2.352259, -0.1872332, 1.246695, 1, 1, 1, 1, 1,
2.390748, -1.283466, 2.248591, 1, 1, 1, 1, 1,
2.418496, -0.1484334, 1.924373, 1, 1, 1, 1, 1,
2.468105, -2.202943, 1.255126, 1, 1, 1, 1, 1,
2.512605, -0.6270526, 2.41783, 1, 1, 1, 1, 1,
2.606229, 0.4400443, 2.06543, 1, 1, 1, 1, 1,
2.675174, 1.236595, 1.207121, 1, 1, 1, 1, 1
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
var radius = 9.53557;
var distance = 33.49328;
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
mvMatrix.translate( 0.4410086, -0.2540232, -0.3820019 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49328);
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
