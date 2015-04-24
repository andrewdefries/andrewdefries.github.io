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
-2.787285, 0.4513718, 0.8639737, 1, 0, 0, 1,
-2.752502, 0.471321, -1.809815, 1, 0.007843138, 0, 1,
-2.685106, 0.7041088, -1.086242, 1, 0.01176471, 0, 1,
-2.633254, -0.06886894, -3.000408, 1, 0.01960784, 0, 1,
-2.564219, -0.5417714, -1.354037, 1, 0.02352941, 0, 1,
-2.52684, 0.2802493, -0.2695211, 1, 0.03137255, 0, 1,
-2.475311, 1.564883, -2.138973, 1, 0.03529412, 0, 1,
-2.383036, -0.8882818, -1.325854, 1, 0.04313726, 0, 1,
-2.294268, 0.1906111, -0.9429843, 1, 0.04705882, 0, 1,
-2.240869, -0.2399366, -2.267813, 1, 0.05490196, 0, 1,
-2.22608, -2.143023, -5.030063, 1, 0.05882353, 0, 1,
-2.210502, -1.284391, -0.6297633, 1, 0.06666667, 0, 1,
-2.210058, -0.1325162, -1.876024, 1, 0.07058824, 0, 1,
-2.16635, 0.8707228, -1.517389, 1, 0.07843138, 0, 1,
-2.166074, -0.3742962, -1.785874, 1, 0.08235294, 0, 1,
-2.14092, -0.3853655, -2.945177, 1, 0.09019608, 0, 1,
-2.140411, -0.2505825, -2.872908, 1, 0.09411765, 0, 1,
-2.108108, 0.6101835, -1.214486, 1, 0.1019608, 0, 1,
-2.089676, -0.2998646, -0.4740087, 1, 0.1098039, 0, 1,
-2.047985, -0.259499, -2.135323, 1, 0.1137255, 0, 1,
-2.035487, -0.8202485, -1.763826, 1, 0.1215686, 0, 1,
-2.022289, -0.4328173, -2.534559, 1, 0.1254902, 0, 1,
-1.988118, -0.6354245, -1.095225, 1, 0.1333333, 0, 1,
-1.976971, 1.294271, -1.117461, 1, 0.1372549, 0, 1,
-1.962392, -0.3677728, -3.167948, 1, 0.145098, 0, 1,
-1.956462, -1.182817, -1.351078, 1, 0.1490196, 0, 1,
-1.940797, -0.9470634, -1.504516, 1, 0.1568628, 0, 1,
-1.920071, 0.4643159, -1.464762, 1, 0.1607843, 0, 1,
-1.91223, 0.4760282, 0.2573877, 1, 0.1686275, 0, 1,
-1.890725, -0.0002193978, -0.1311741, 1, 0.172549, 0, 1,
-1.877373, -1.470879, -1.590518, 1, 0.1803922, 0, 1,
-1.869211, -0.1850297, -1.275183, 1, 0.1843137, 0, 1,
-1.851282, -1.208946, -1.514564, 1, 0.1921569, 0, 1,
-1.816542, 0.07434952, -2.181546, 1, 0.1960784, 0, 1,
-1.794327, 1.748569, -1.475185, 1, 0.2039216, 0, 1,
-1.778554, -0.958115, -0.6506922, 1, 0.2117647, 0, 1,
-1.750639, -0.7203194, -1.948625, 1, 0.2156863, 0, 1,
-1.750382, -0.8835642, -2.096788, 1, 0.2235294, 0, 1,
-1.714722, 1.750931, -1.983594, 1, 0.227451, 0, 1,
-1.704292, -0.2495588, -2.393924, 1, 0.2352941, 0, 1,
-1.703199, -1.757322, -2.07842, 1, 0.2392157, 0, 1,
-1.697088, -2.194807, -3.797862, 1, 0.2470588, 0, 1,
-1.694086, 0.9101282, 0.6153955, 1, 0.2509804, 0, 1,
-1.682155, -0.08997586, -1.349134, 1, 0.2588235, 0, 1,
-1.662961, 0.1019983, -1.995247, 1, 0.2627451, 0, 1,
-1.656386, -1.364199, -2.132195, 1, 0.2705882, 0, 1,
-1.621009, 0.1236931, -1.514253, 1, 0.2745098, 0, 1,
-1.598396, 1.551029, 0.121478, 1, 0.282353, 0, 1,
-1.597299, 0.5439387, -1.300727, 1, 0.2862745, 0, 1,
-1.590095, 0.2238639, -1.744042, 1, 0.2941177, 0, 1,
-1.587968, 0.6040524, -2.771728, 1, 0.3019608, 0, 1,
-1.573328, 0.8831545, -0.661667, 1, 0.3058824, 0, 1,
-1.563766, 1.083663, 1.290732, 1, 0.3137255, 0, 1,
-1.556198, -0.4972099, -0.00103485, 1, 0.3176471, 0, 1,
-1.554453, -0.1087336, -0.03590784, 1, 0.3254902, 0, 1,
-1.550479, -0.5227362, -2.362089, 1, 0.3294118, 0, 1,
-1.544864, -0.4439199, -2.142348, 1, 0.3372549, 0, 1,
-1.537531, 1.583627, -2.507255, 1, 0.3411765, 0, 1,
-1.504301, -0.1859957, -0.7974796, 1, 0.3490196, 0, 1,
-1.503581, -0.8303862, -2.859395, 1, 0.3529412, 0, 1,
-1.499353, 1.251141, 0.05393845, 1, 0.3607843, 0, 1,
-1.494498, -0.4280336, -3.419388, 1, 0.3647059, 0, 1,
-1.491309, 2.01574, 0.002118106, 1, 0.372549, 0, 1,
-1.490424, 0.1485307, -2.533355, 1, 0.3764706, 0, 1,
-1.488335, 0.5752419, -0.1801589, 1, 0.3843137, 0, 1,
-1.48151, -1.76774, -5.025198, 1, 0.3882353, 0, 1,
-1.477672, -0.4378131, -1.44709, 1, 0.3960784, 0, 1,
-1.473422, 2.045119, -0.358052, 1, 0.4039216, 0, 1,
-1.470444, 0.9850159, 0.6163058, 1, 0.4078431, 0, 1,
-1.462232, 0.6737949, -1.182796, 1, 0.4156863, 0, 1,
-1.449477, -2.975939, -2.820705, 1, 0.4196078, 0, 1,
-1.444062, -1.165542, -1.287248, 1, 0.427451, 0, 1,
-1.443161, -0.1662026, -0.9437249, 1, 0.4313726, 0, 1,
-1.434938, 0.8966502, -1.62281, 1, 0.4392157, 0, 1,
-1.426927, -1.760442, -1.877241, 1, 0.4431373, 0, 1,
-1.407906, -0.355428, -2.190163, 1, 0.4509804, 0, 1,
-1.395938, 0.9933532, -2.496728, 1, 0.454902, 0, 1,
-1.387271, 0.7040691, -1.558066, 1, 0.4627451, 0, 1,
-1.376923, -0.6646252, -2.798192, 1, 0.4666667, 0, 1,
-1.355999, 1.770062, 0.4235147, 1, 0.4745098, 0, 1,
-1.339222, 1.232981, -2.433975, 1, 0.4784314, 0, 1,
-1.3378, 0.3973987, -1.156242, 1, 0.4862745, 0, 1,
-1.33684, 0.2507977, -2.182688, 1, 0.4901961, 0, 1,
-1.336619, -0.3811319, -2.706363, 1, 0.4980392, 0, 1,
-1.327388, -0.440126, -1.402658, 1, 0.5058824, 0, 1,
-1.308982, 0.5370636, -0.3301411, 1, 0.509804, 0, 1,
-1.30845, 0.4670046, -1.278563, 1, 0.5176471, 0, 1,
-1.305614, -0.2906405, -2.058975, 1, 0.5215687, 0, 1,
-1.30485, 0.2025248, -1.045787, 1, 0.5294118, 0, 1,
-1.295968, -0.1118942, -1.107058, 1, 0.5333334, 0, 1,
-1.294834, -1.430161, -1.515149, 1, 0.5411765, 0, 1,
-1.291888, 2.092672, 0.3229315, 1, 0.5450981, 0, 1,
-1.291077, 0.2475336, -2.253937, 1, 0.5529412, 0, 1,
-1.280821, -0.4744779, -3.073979, 1, 0.5568628, 0, 1,
-1.279195, 1.825904, -0.177006, 1, 0.5647059, 0, 1,
-1.274199, -1.436849, -2.451924, 1, 0.5686275, 0, 1,
-1.264068, -1.162286, -3.412639, 1, 0.5764706, 0, 1,
-1.263502, 0.8762161, -0.7387529, 1, 0.5803922, 0, 1,
-1.253352, -0.9096584, -1.150207, 1, 0.5882353, 0, 1,
-1.241271, 0.7911578, -0.534938, 1, 0.5921569, 0, 1,
-1.232466, 0.5691448, -0.602015, 1, 0.6, 0, 1,
-1.225174, 1.139036, -0.5516781, 1, 0.6078432, 0, 1,
-1.218295, -1.153692, -3.467497, 1, 0.6117647, 0, 1,
-1.212297, 0.06073708, 0.5020165, 1, 0.6196079, 0, 1,
-1.204575, -1.089836, -1.678031, 1, 0.6235294, 0, 1,
-1.195807, -1.874737, -2.855353, 1, 0.6313726, 0, 1,
-1.191479, 0.4519504, -0.7684304, 1, 0.6352941, 0, 1,
-1.186963, -0.7353703, -1.934828, 1, 0.6431373, 0, 1,
-1.176208, 0.2466203, -1.138853, 1, 0.6470588, 0, 1,
-1.169871, 0.2607952, -0.6139249, 1, 0.654902, 0, 1,
-1.167349, 0.8066435, -3.392988, 1, 0.6588235, 0, 1,
-1.161455, -1.183116, -3.345232, 1, 0.6666667, 0, 1,
-1.156132, -0.09809362, -2.648407, 1, 0.6705883, 0, 1,
-1.155672, 1.188021, -1.730744, 1, 0.6784314, 0, 1,
-1.148159, 0.2814403, -2.271852, 1, 0.682353, 0, 1,
-1.146789, 0.1894733, -0.6660611, 1, 0.6901961, 0, 1,
-1.143661, -1.639759, -1.954872, 1, 0.6941177, 0, 1,
-1.138826, -1.791981, -3.431412, 1, 0.7019608, 0, 1,
-1.136126, -0.7796584, -1.068, 1, 0.7098039, 0, 1,
-1.128518, -0.07198031, -2.269516, 1, 0.7137255, 0, 1,
-1.114845, -0.7782379, -0.6351104, 1, 0.7215686, 0, 1,
-1.110053, 0.8550941, -1.238617, 1, 0.7254902, 0, 1,
-1.108671, -0.4612594, -1.094546, 1, 0.7333333, 0, 1,
-1.106783, -0.5508974, -1.880746, 1, 0.7372549, 0, 1,
-1.097309, 1.867382, -0.7875873, 1, 0.7450981, 0, 1,
-1.095509, -0.3673456, -0.4398279, 1, 0.7490196, 0, 1,
-1.081885, -0.668722, -2.55572, 1, 0.7568628, 0, 1,
-1.078701, -1.327909, -2.062485, 1, 0.7607843, 0, 1,
-1.076083, -0.05191159, -3.077694, 1, 0.7686275, 0, 1,
-1.075409, 0.4253392, -0.1795307, 1, 0.772549, 0, 1,
-1.074087, -0.01472084, 0.3098597, 1, 0.7803922, 0, 1,
-1.073995, -0.5201169, -3.821019, 1, 0.7843137, 0, 1,
-1.069783, -0.1472615, -1.856044, 1, 0.7921569, 0, 1,
-1.069099, 0.6320889, 0.4493126, 1, 0.7960784, 0, 1,
-1.068104, -1.702206, -2.409309, 1, 0.8039216, 0, 1,
-1.066817, 0.3160043, -2.615266, 1, 0.8117647, 0, 1,
-1.061959, 0.1825909, -2.398777, 1, 0.8156863, 0, 1,
-1.057437, -0.8885857, -1.714574, 1, 0.8235294, 0, 1,
-1.056936, 0.3131043, -2.457195, 1, 0.827451, 0, 1,
-1.054799, 1.143959, -0.507997, 1, 0.8352941, 0, 1,
-1.041072, -0.04511098, -3.350761, 1, 0.8392157, 0, 1,
-1.040971, 0.1657085, -2.220624, 1, 0.8470588, 0, 1,
-1.03638, -0.1957097, -2.44805, 1, 0.8509804, 0, 1,
-1.029586, -0.9803271, -3.264097, 1, 0.8588235, 0, 1,
-1.028155, -0.7848796, -0.4848124, 1, 0.8627451, 0, 1,
-1.027337, -1.388332, -2.027903, 1, 0.8705882, 0, 1,
-1.015708, -0.836556, -3.960831, 1, 0.8745098, 0, 1,
-1.008324, -0.01556305, -0.5261541, 1, 0.8823529, 0, 1,
-1.0078, 0.8472332, 0.9507517, 1, 0.8862745, 0, 1,
-1.003021, 2.125897, -0.8926971, 1, 0.8941177, 0, 1,
-1.001475, 0.03237957, -1.013412, 1, 0.8980392, 0, 1,
-1.0014, -1.043287, -2.906926, 1, 0.9058824, 0, 1,
-0.9961049, 0.6749527, -1.16046, 1, 0.9137255, 0, 1,
-0.991312, -2.470474, -2.226465, 1, 0.9176471, 0, 1,
-0.9862974, 1.739708, -1.017804, 1, 0.9254902, 0, 1,
-0.9849713, 0.8578414, -1.634033, 1, 0.9294118, 0, 1,
-0.9817159, -1.075539, -1.066555, 1, 0.9372549, 0, 1,
-0.9794958, 0.527749, -0.7910135, 1, 0.9411765, 0, 1,
-0.9773655, 0.4220889, -0.3095472, 1, 0.9490196, 0, 1,
-0.9655999, -0.7445468, -3.067326, 1, 0.9529412, 0, 1,
-0.9586925, -1.27413, -3.041011, 1, 0.9607843, 0, 1,
-0.9532105, -0.2217629, -2.549055, 1, 0.9647059, 0, 1,
-0.9531178, -0.4567548, -1.134634, 1, 0.972549, 0, 1,
-0.948027, -0.6642324, -2.007242, 1, 0.9764706, 0, 1,
-0.9407424, -0.1266765, -2.569358, 1, 0.9843137, 0, 1,
-0.9211296, 0.06457252, -1.115186, 1, 0.9882353, 0, 1,
-0.9197212, -0.01375827, -1.123135, 1, 0.9960784, 0, 1,
-0.9196034, -0.09641205, -2.359685, 0.9960784, 1, 0, 1,
-0.9166113, 1.580941, 0.1264303, 0.9921569, 1, 0, 1,
-0.9140742, 1.720288, -0.4348183, 0.9843137, 1, 0, 1,
-0.8990498, -0.3566028, -1.366981, 0.9803922, 1, 0, 1,
-0.8967207, 0.21634, -0.9716013, 0.972549, 1, 0, 1,
-0.8947682, 0.6446118, -1.619193, 0.9686275, 1, 0, 1,
-0.888944, 0.3091542, -2.167391, 0.9607843, 1, 0, 1,
-0.8806064, 0.9270128, -1.338354, 0.9568627, 1, 0, 1,
-0.8798347, 1.40393, -0.4068241, 0.9490196, 1, 0, 1,
-0.8738216, -0.4210128, -2.272106, 0.945098, 1, 0, 1,
-0.8724456, -0.09112284, -0.417717, 0.9372549, 1, 0, 1,
-0.8650668, 0.8223589, -1.375309, 0.9333333, 1, 0, 1,
-0.8569429, 0.4536126, -1.165624, 0.9254902, 1, 0, 1,
-0.8551762, 0.8290762, -0.560231, 0.9215686, 1, 0, 1,
-0.853304, -0.1765054, -1.846682, 0.9137255, 1, 0, 1,
-0.853044, 0.5090472, 0.487516, 0.9098039, 1, 0, 1,
-0.852354, 0.470843, -1.05723, 0.9019608, 1, 0, 1,
-0.8514683, -0.776908, -2.312433, 0.8941177, 1, 0, 1,
-0.8513008, -1.466361, -2.792231, 0.8901961, 1, 0, 1,
-0.849219, -0.4065105, -2.717445, 0.8823529, 1, 0, 1,
-0.8451692, 0.2834444, -1.808226, 0.8784314, 1, 0, 1,
-0.8420438, 0.8547674, -1.068626, 0.8705882, 1, 0, 1,
-0.8354623, 0.1695804, -2.178766, 0.8666667, 1, 0, 1,
-0.8331907, -0.4237257, -1.575637, 0.8588235, 1, 0, 1,
-0.8295522, 0.9091507, -1.615903, 0.854902, 1, 0, 1,
-0.8290973, 1.1008, -0.2569076, 0.8470588, 1, 0, 1,
-0.8259366, -1.227563, -2.164156, 0.8431373, 1, 0, 1,
-0.8235778, -1.320543, -3.874918, 0.8352941, 1, 0, 1,
-0.8191129, -0.4004838, -3.283629, 0.8313726, 1, 0, 1,
-0.8174126, 1.945371, 0.5287511, 0.8235294, 1, 0, 1,
-0.8108957, 0.09023418, -1.175851, 0.8196079, 1, 0, 1,
-0.8062254, -1.210643, -2.365359, 0.8117647, 1, 0, 1,
-0.8008074, 0.1633067, -3.310192, 0.8078431, 1, 0, 1,
-0.7998049, -1.119902, -1.921863, 0.8, 1, 0, 1,
-0.7993811, 0.620904, -2.497705, 0.7921569, 1, 0, 1,
-0.7990337, 0.7541827, -1.153461, 0.7882353, 1, 0, 1,
-0.7967514, 0.8940535, -1.89814, 0.7803922, 1, 0, 1,
-0.7927285, -0.7922007, -1.305334, 0.7764706, 1, 0, 1,
-0.7906333, -1.703736, -3.032938, 0.7686275, 1, 0, 1,
-0.7894518, 1.673599, -0.2682515, 0.7647059, 1, 0, 1,
-0.7746797, -1.343835, -1.845441, 0.7568628, 1, 0, 1,
-0.7647595, -0.5233836, -0.9438032, 0.7529412, 1, 0, 1,
-0.7625323, -1.229001, -3.530178, 0.7450981, 1, 0, 1,
-0.7557748, 1.295176, -1.000839, 0.7411765, 1, 0, 1,
-0.7443471, 1.207195, -0.2365202, 0.7333333, 1, 0, 1,
-0.7417883, -0.2519126, -1.801977, 0.7294118, 1, 0, 1,
-0.7397168, 0.1890295, -2.719347, 0.7215686, 1, 0, 1,
-0.733997, -0.7967119, -2.280883, 0.7176471, 1, 0, 1,
-0.7334229, -0.8477624, -1.891613, 0.7098039, 1, 0, 1,
-0.7327031, -0.8602489, -3.430658, 0.7058824, 1, 0, 1,
-0.7267212, -0.4620302, -2.135935, 0.6980392, 1, 0, 1,
-0.7198494, 0.3186251, -1.018017, 0.6901961, 1, 0, 1,
-0.7185076, -0.1046335, -2.160294, 0.6862745, 1, 0, 1,
-0.7178903, 0.1153624, -1.373028, 0.6784314, 1, 0, 1,
-0.7148272, 0.3476917, -1.879781, 0.6745098, 1, 0, 1,
-0.7084489, -0.2705407, -1.924911, 0.6666667, 1, 0, 1,
-0.7068812, -0.429494, -1.076158, 0.6627451, 1, 0, 1,
-0.7056471, -0.5465235, -1.197898, 0.654902, 1, 0, 1,
-0.7051479, 0.138943, -1.321779, 0.6509804, 1, 0, 1,
-0.7033979, -0.2647178, -2.528638, 0.6431373, 1, 0, 1,
-0.7009786, -0.6214374, -3.621136, 0.6392157, 1, 0, 1,
-0.6990105, -1.15809, -4.671594, 0.6313726, 1, 0, 1,
-0.6985191, 0.4842387, 1.168909, 0.627451, 1, 0, 1,
-0.691834, 0.4398067, -0.5701932, 0.6196079, 1, 0, 1,
-0.6887896, 0.9978261, -0.5343733, 0.6156863, 1, 0, 1,
-0.6850104, -0.2886342, -1.262503, 0.6078432, 1, 0, 1,
-0.6829669, 1.435045, -1.404217, 0.6039216, 1, 0, 1,
-0.6797335, -0.5837252, -0.7860398, 0.5960785, 1, 0, 1,
-0.67853, 0.8879359, -1.05434, 0.5882353, 1, 0, 1,
-0.6738005, 1.487131, 0.0782745, 0.5843138, 1, 0, 1,
-0.6714597, 1.056838, 0.7913806, 0.5764706, 1, 0, 1,
-0.6701011, 0.7702168, -1.954334, 0.572549, 1, 0, 1,
-0.6654235, 0.01442107, -0.9684601, 0.5647059, 1, 0, 1,
-0.6631925, 1.171848, 0.6535764, 0.5607843, 1, 0, 1,
-0.6616736, 0.5369033, -0.8219534, 0.5529412, 1, 0, 1,
-0.6534536, -0.07398906, -0.7115245, 0.5490196, 1, 0, 1,
-0.648265, -0.5387112, -1.83852, 0.5411765, 1, 0, 1,
-0.6380143, 0.6448959, 0.1022059, 0.5372549, 1, 0, 1,
-0.63572, -1.762718, -3.118604, 0.5294118, 1, 0, 1,
-0.6278533, 0.8614472, 0.1943843, 0.5254902, 1, 0, 1,
-0.6239041, 0.1508893, -1.576315, 0.5176471, 1, 0, 1,
-0.6173949, -0.05385709, -3.700556, 0.5137255, 1, 0, 1,
-0.6164529, -0.4799315, -3.539227, 0.5058824, 1, 0, 1,
-0.61635, -0.40871, -2.809752, 0.5019608, 1, 0, 1,
-0.6131346, -0.2556393, -2.588938, 0.4941176, 1, 0, 1,
-0.612039, 0.5457129, -1.179905, 0.4862745, 1, 0, 1,
-0.6086686, -1.177222, -2.851516, 0.4823529, 1, 0, 1,
-0.6086158, 1.158728, -0.8311358, 0.4745098, 1, 0, 1,
-0.6059823, -1.775094, -5.272844, 0.4705882, 1, 0, 1,
-0.6053358, 0.6684598, -1.349303, 0.4627451, 1, 0, 1,
-0.6047595, 1.036321, -0.4258735, 0.4588235, 1, 0, 1,
-0.6037562, 0.5485355, -2.045041, 0.4509804, 1, 0, 1,
-0.6012455, -2.323841, -1.873513, 0.4470588, 1, 0, 1,
-0.599214, 0.09062144, -1.92447, 0.4392157, 1, 0, 1,
-0.597782, -0.07375873, -3.158384, 0.4352941, 1, 0, 1,
-0.5927062, -0.4300252, -2.937469, 0.427451, 1, 0, 1,
-0.5915977, -1.661768, -2.413699, 0.4235294, 1, 0, 1,
-0.5902103, -1.793386, -3.535098, 0.4156863, 1, 0, 1,
-0.585313, 0.551178, 0.4358403, 0.4117647, 1, 0, 1,
-0.5819332, -0.1740348, -2.553095, 0.4039216, 1, 0, 1,
-0.5801402, 0.7858213, -2.247626, 0.3960784, 1, 0, 1,
-0.571236, -0.6672246, -3.136818, 0.3921569, 1, 0, 1,
-0.5675317, 0.6476414, 0.1569286, 0.3843137, 1, 0, 1,
-0.5577481, 1.240684, -1.196524, 0.3803922, 1, 0, 1,
-0.551733, 0.3294256, -1.091733, 0.372549, 1, 0, 1,
-0.5515931, -0.02695989, -2.106105, 0.3686275, 1, 0, 1,
-0.5513136, -0.1334152, -3.143958, 0.3607843, 1, 0, 1,
-0.5498412, -0.04476809, -0.7041208, 0.3568628, 1, 0, 1,
-0.5479684, 0.9619035, -1.340356, 0.3490196, 1, 0, 1,
-0.5373049, -0.7285715, -1.744121, 0.345098, 1, 0, 1,
-0.537259, -0.01510093, -2.906319, 0.3372549, 1, 0, 1,
-0.5342306, -0.6608832, -2.362531, 0.3333333, 1, 0, 1,
-0.5323729, 0.2591501, -1.591011, 0.3254902, 1, 0, 1,
-0.5303175, -1.72896, -2.418161, 0.3215686, 1, 0, 1,
-0.5278689, 0.2779189, -0.732368, 0.3137255, 1, 0, 1,
-0.5276296, 0.4702588, -1.014992, 0.3098039, 1, 0, 1,
-0.5240728, 0.2842261, 0.1991666, 0.3019608, 1, 0, 1,
-0.5236195, 0.7918567, -1.328692, 0.2941177, 1, 0, 1,
-0.5215026, -0.5301229, -2.941909, 0.2901961, 1, 0, 1,
-0.5102989, 0.8924805, 0.1494031, 0.282353, 1, 0, 1,
-0.509935, 0.5916911, 0.2578049, 0.2784314, 1, 0, 1,
-0.5096177, -0.480912, -1.49862, 0.2705882, 1, 0, 1,
-0.507966, 0.7276779, -0.5872002, 0.2666667, 1, 0, 1,
-0.5045173, 0.4200859, 0.4554139, 0.2588235, 1, 0, 1,
-0.5033834, 0.5922105, -0.6185181, 0.254902, 1, 0, 1,
-0.4947333, 0.4347992, -0.7135866, 0.2470588, 1, 0, 1,
-0.49459, -1.541238, -2.629011, 0.2431373, 1, 0, 1,
-0.4939628, 1.015736, -0.6242153, 0.2352941, 1, 0, 1,
-0.489603, -1.421858, -2.354726, 0.2313726, 1, 0, 1,
-0.4864867, -0.1383554, -3.595915, 0.2235294, 1, 0, 1,
-0.4853899, 0.1751145, -1.76271, 0.2196078, 1, 0, 1,
-0.4834606, -0.1482313, -3.171251, 0.2117647, 1, 0, 1,
-0.4829917, -0.1128783, -1.243499, 0.2078431, 1, 0, 1,
-0.477383, 0.2284716, -1.50591, 0.2, 1, 0, 1,
-0.4749539, -0.1482544, -1.198841, 0.1921569, 1, 0, 1,
-0.4743867, 0.9261435, 0.4829007, 0.1882353, 1, 0, 1,
-0.4692689, -0.1174393, -2.103271, 0.1803922, 1, 0, 1,
-0.4687748, -2.493811, -1.613316, 0.1764706, 1, 0, 1,
-0.4683322, -1.404455, -2.406246, 0.1686275, 1, 0, 1,
-0.4646417, 1.395822, -0.08255487, 0.1647059, 1, 0, 1,
-0.4643949, 1.416723, 0.5913974, 0.1568628, 1, 0, 1,
-0.4640883, -2.291944, -1.239543, 0.1529412, 1, 0, 1,
-0.4630426, -0.9224219, -2.468778, 0.145098, 1, 0, 1,
-0.4614502, 0.9697183, -0.6925421, 0.1411765, 1, 0, 1,
-0.4610195, 1.164189, -0.6969258, 0.1333333, 1, 0, 1,
-0.4571167, 0.1418727, 0.2672493, 0.1294118, 1, 0, 1,
-0.4570067, 2.513088, -0.3636671, 0.1215686, 1, 0, 1,
-0.4553362, 0.9179708, 0.7399607, 0.1176471, 1, 0, 1,
-0.4536276, 1.591559, 0.3581125, 0.1098039, 1, 0, 1,
-0.4521971, 0.09929268, -0.8968403, 0.1058824, 1, 0, 1,
-0.4511627, 0.026808, -2.503897, 0.09803922, 1, 0, 1,
-0.4414366, -1.200271, -1.711112, 0.09019608, 1, 0, 1,
-0.4386061, -1.133145, -0.7413762, 0.08627451, 1, 0, 1,
-0.4355954, 0.2610557, -0.1589484, 0.07843138, 1, 0, 1,
-0.4345396, 1.322887, -0.078756, 0.07450981, 1, 0, 1,
-0.4330654, -0.1661948, -2.062519, 0.06666667, 1, 0, 1,
-0.431919, -1.150169, -1.217621, 0.0627451, 1, 0, 1,
-0.4252814, 0.6886483, 0.1447771, 0.05490196, 1, 0, 1,
-0.4228578, -0.5355878, -2.836173, 0.05098039, 1, 0, 1,
-0.418868, -0.5966904, -2.499553, 0.04313726, 1, 0, 1,
-0.4176666, -0.3675591, -2.385709, 0.03921569, 1, 0, 1,
-0.414947, -2.605562, -2.415236, 0.03137255, 1, 0, 1,
-0.4047167, 0.8972555, -1.310644, 0.02745098, 1, 0, 1,
-0.4028052, -0.4619026, -1.989652, 0.01960784, 1, 0, 1,
-0.4022318, 0.6251254, -1.966022, 0.01568628, 1, 0, 1,
-0.3998781, 1.491705, -2.115321, 0.007843138, 1, 0, 1,
-0.3994635, -1.158615, -1.26156, 0.003921569, 1, 0, 1,
-0.3978845, 0.1196547, -2.809135, 0, 1, 0.003921569, 1,
-0.3977158, -0.1867848, -0.367945, 0, 1, 0.01176471, 1,
-0.3971159, 0.5270251, -0.4367747, 0, 1, 0.01568628, 1,
-0.3942628, 0.5529446, -0.6128507, 0, 1, 0.02352941, 1,
-0.3935142, 0.2327655, -1.248359, 0, 1, 0.02745098, 1,
-0.3890855, 2.807348, 0.3804354, 0, 1, 0.03529412, 1,
-0.3882737, -1.572069, -2.378015, 0, 1, 0.03921569, 1,
-0.3858766, -0.07222121, -0.4876421, 0, 1, 0.04705882, 1,
-0.3850085, 0.8765144, 0.5962316, 0, 1, 0.05098039, 1,
-0.3845343, 0.2329486, -0.8048605, 0, 1, 0.05882353, 1,
-0.3762389, 1.099369, -0.3270208, 0, 1, 0.0627451, 1,
-0.3747205, -2.065654, -3.620402, 0, 1, 0.07058824, 1,
-0.3704979, -0.5181292, -2.376559, 0, 1, 0.07450981, 1,
-0.3702638, -0.1637814, -2.184197, 0, 1, 0.08235294, 1,
-0.3666947, -0.2291491, -2.032752, 0, 1, 0.08627451, 1,
-0.3649804, 0.5434001, 0.05432219, 0, 1, 0.09411765, 1,
-0.3637899, -0.4631153, -3.748032, 0, 1, 0.1019608, 1,
-0.3627253, -0.1896766, -2.06283, 0, 1, 0.1058824, 1,
-0.3582648, 0.01358453, -2.984369, 0, 1, 0.1137255, 1,
-0.3539989, 1.003348, 0.7271757, 0, 1, 0.1176471, 1,
-0.3525575, -1.610932, -3.680582, 0, 1, 0.1254902, 1,
-0.3503539, -0.3241763, -3.703233, 0, 1, 0.1294118, 1,
-0.3501416, 0.01260346, -2.865792, 0, 1, 0.1372549, 1,
-0.3492624, 0.2244081, -1.049016, 0, 1, 0.1411765, 1,
-0.3457637, 0.5651282, -0.2649843, 0, 1, 0.1490196, 1,
-0.3447617, 0.9803886, -0.408195, 0, 1, 0.1529412, 1,
-0.3438326, 1.231134, -1.678421, 0, 1, 0.1607843, 1,
-0.3424224, 0.1470218, -2.1368, 0, 1, 0.1647059, 1,
-0.3364857, -2.000411, -2.558108, 0, 1, 0.172549, 1,
-0.3333631, -0.4347865, -2.529963, 0, 1, 0.1764706, 1,
-0.3298807, 0.5956721, -0.6055639, 0, 1, 0.1843137, 1,
-0.3296457, 1.188878, -0.03744732, 0, 1, 0.1882353, 1,
-0.3154962, 0.8994641, 0.7240606, 0, 1, 0.1960784, 1,
-0.3152007, 0.8641073, -0.9766501, 0, 1, 0.2039216, 1,
-0.3052634, -0.4884093, -2.135665, 0, 1, 0.2078431, 1,
-0.304446, -1.737545, -3.271071, 0, 1, 0.2156863, 1,
-0.3020644, -0.5981308, -2.185494, 0, 1, 0.2196078, 1,
-0.3008482, 0.6893572, 3.211293, 0, 1, 0.227451, 1,
-0.3003826, -0.01257002, -1.28874, 0, 1, 0.2313726, 1,
-0.2998258, -0.3259467, -2.234144, 0, 1, 0.2392157, 1,
-0.299688, 0.1116396, -0.4753085, 0, 1, 0.2431373, 1,
-0.2972318, 0.0687656, -3.053521, 0, 1, 0.2509804, 1,
-0.2865532, 2.054243, -0.4482801, 0, 1, 0.254902, 1,
-0.2848116, -0.3303855, -2.347635, 0, 1, 0.2627451, 1,
-0.2816482, 0.007335217, -1.000489, 0, 1, 0.2666667, 1,
-0.2815773, 0.3782877, -0.3382224, 0, 1, 0.2745098, 1,
-0.2785991, 2.140473, 0.2737541, 0, 1, 0.2784314, 1,
-0.277067, 0.3561954, 0.01527385, 0, 1, 0.2862745, 1,
-0.2751259, -1.286954, -1.745764, 0, 1, 0.2901961, 1,
-0.2739518, -0.1875371, -3.62891, 0, 1, 0.2980392, 1,
-0.2721831, -1.42744, -2.871697, 0, 1, 0.3058824, 1,
-0.2698881, 0.1841929, -2.156794, 0, 1, 0.3098039, 1,
-0.2665183, 0.07458009, 0.9489579, 0, 1, 0.3176471, 1,
-0.2664586, -0.3187982, -3.030496, 0, 1, 0.3215686, 1,
-0.2634468, 0.1616816, -0.1299817, 0, 1, 0.3294118, 1,
-0.2630533, 1.207255, -0.2917409, 0, 1, 0.3333333, 1,
-0.2600293, 0.2229923, -0.8632184, 0, 1, 0.3411765, 1,
-0.2590015, -0.2286298, -3.404457, 0, 1, 0.345098, 1,
-0.2578563, -0.009385488, -0.8923328, 0, 1, 0.3529412, 1,
-0.255937, 1.115496, 0.902303, 0, 1, 0.3568628, 1,
-0.2536624, 0.4810411, -1.007593, 0, 1, 0.3647059, 1,
-0.2534645, -1.619562, -3.828445, 0, 1, 0.3686275, 1,
-0.2497875, 1.190115, -1.987778, 0, 1, 0.3764706, 1,
-0.2485165, 0.8740137, 0.7635122, 0, 1, 0.3803922, 1,
-0.2483906, -0.06711299, -1.964833, 0, 1, 0.3882353, 1,
-0.24293, 0.1230446, -1.446332, 0, 1, 0.3921569, 1,
-0.2412845, 1.146918, -0.6565986, 0, 1, 0.4, 1,
-0.2385894, -0.9277544, -2.468219, 0, 1, 0.4078431, 1,
-0.2366072, -0.4693406, -3.488881, 0, 1, 0.4117647, 1,
-0.234299, 0.1129347, 0.007817003, 0, 1, 0.4196078, 1,
-0.23319, 0.0212337, -0.8251001, 0, 1, 0.4235294, 1,
-0.2324563, 0.4567499, 0.7903767, 0, 1, 0.4313726, 1,
-0.2311473, 0.8943972, -0.03940596, 0, 1, 0.4352941, 1,
-0.228617, 0.8546383, -2.08967, 0, 1, 0.4431373, 1,
-0.2250066, 1.547272, 0.5757809, 0, 1, 0.4470588, 1,
-0.2235398, 1.099925, 0.6750958, 0, 1, 0.454902, 1,
-0.2210478, -1.905111, -3.459894, 0, 1, 0.4588235, 1,
-0.2204332, -1.047327, -2.644461, 0, 1, 0.4666667, 1,
-0.2188604, 0.8654651, 0.7156905, 0, 1, 0.4705882, 1,
-0.2152556, 1.743415, 2.817694, 0, 1, 0.4784314, 1,
-0.2134103, -0.7831593, -1.941845, 0, 1, 0.4823529, 1,
-0.2087285, 0.4861389, -1.522498, 0, 1, 0.4901961, 1,
-0.207559, -0.1643135, -2.181204, 0, 1, 0.4941176, 1,
-0.2032704, 1.30892, 0.05175162, 0, 1, 0.5019608, 1,
-0.1997284, 0.7826861, 0.6834666, 0, 1, 0.509804, 1,
-0.1987336, 0.4745976, -0.532304, 0, 1, 0.5137255, 1,
-0.1983886, 0.544987, -0.2832724, 0, 1, 0.5215687, 1,
-0.1971189, 0.321396, -1.461998, 0, 1, 0.5254902, 1,
-0.1970541, 0.2199619, -0.7094632, 0, 1, 0.5333334, 1,
-0.1833074, -0.9927585, -4.58483, 0, 1, 0.5372549, 1,
-0.1799195, 1.542883, 0.5454012, 0, 1, 0.5450981, 1,
-0.1784873, 0.07664602, 0.01785751, 0, 1, 0.5490196, 1,
-0.1775712, -0.8413532, -1.701349, 0, 1, 0.5568628, 1,
-0.1756147, -0.3996349, -2.12393, 0, 1, 0.5607843, 1,
-0.1734087, -1.002628, -3.449823, 0, 1, 0.5686275, 1,
-0.1657873, 0.7304382, -1.123865, 0, 1, 0.572549, 1,
-0.1644392, -1.730441, -2.712584, 0, 1, 0.5803922, 1,
-0.1623078, 0.6234388, -0.4020516, 0, 1, 0.5843138, 1,
-0.1614766, 0.459832, 0.4488532, 0, 1, 0.5921569, 1,
-0.1611448, -0.5911216, -2.148299, 0, 1, 0.5960785, 1,
-0.1599088, -0.7560554, -3.986884, 0, 1, 0.6039216, 1,
-0.1594961, 0.4470265, 0.1334008, 0, 1, 0.6117647, 1,
-0.1591634, 0.3359465, -0.2545713, 0, 1, 0.6156863, 1,
-0.1576779, -0.1727224, -3.40702, 0, 1, 0.6235294, 1,
-0.1571586, 1.243562, -2.382052, 0, 1, 0.627451, 1,
-0.150433, 1.082734, 0.8888405, 0, 1, 0.6352941, 1,
-0.1497209, -0.01396944, -1.99912, 0, 1, 0.6392157, 1,
-0.1461049, -1.343428, -1.94298, 0, 1, 0.6470588, 1,
-0.1427205, -0.1118121, -2.68087, 0, 1, 0.6509804, 1,
-0.1420987, -0.9661111, -4.358833, 0, 1, 0.6588235, 1,
-0.1412605, -1.236138, -2.577146, 0, 1, 0.6627451, 1,
-0.1340394, -1.980431, -3.598663, 0, 1, 0.6705883, 1,
-0.1334481, 0.5414519, 0.8572323, 0, 1, 0.6745098, 1,
-0.1304848, 0.5956516, 1.125556, 0, 1, 0.682353, 1,
-0.1302813, -0.4484494, -1.58018, 0, 1, 0.6862745, 1,
-0.1273016, 0.2756141, -0.5681576, 0, 1, 0.6941177, 1,
-0.1269688, 1.726968, 0.2035364, 0, 1, 0.7019608, 1,
-0.1210832, -0.003139647, -3.026561, 0, 1, 0.7058824, 1,
-0.1173676, -0.1255558, -2.313768, 0, 1, 0.7137255, 1,
-0.1141053, -0.1960166, -3.013205, 0, 1, 0.7176471, 1,
-0.1022399, 1.440098, 0.2314665, 0, 1, 0.7254902, 1,
-0.09972793, 1.793363, -1.13205, 0, 1, 0.7294118, 1,
-0.09312156, -1.804634, -1.180963, 0, 1, 0.7372549, 1,
-0.08519837, -0.9971855, -1.870653, 0, 1, 0.7411765, 1,
-0.08463671, 0.9491597, 0.6679682, 0, 1, 0.7490196, 1,
-0.0839179, 0.3018648, -0.3113128, 0, 1, 0.7529412, 1,
-0.07907553, -0.3815055, -3.73686, 0, 1, 0.7607843, 1,
-0.07698027, -0.6234061, -2.538712, 0, 1, 0.7647059, 1,
-0.06943081, 0.1876812, -0.1394974, 0, 1, 0.772549, 1,
-0.06863246, 1.040425, -1.382213, 0, 1, 0.7764706, 1,
-0.06815657, -0.3482653, -3.637709, 0, 1, 0.7843137, 1,
-0.0681287, 0.6835008, -0.038934, 0, 1, 0.7882353, 1,
-0.06733964, 0.2442832, -1.213911, 0, 1, 0.7960784, 1,
-0.06570359, -0.03006367, -1.512173, 0, 1, 0.8039216, 1,
-0.063114, 1.59949, 0.9682854, 0, 1, 0.8078431, 1,
-0.06292126, -1.110393, -2.352631, 0, 1, 0.8156863, 1,
-0.05893856, -1.954593, -2.586834, 0, 1, 0.8196079, 1,
-0.05729135, -0.8868683, -3.089569, 0, 1, 0.827451, 1,
-0.04965923, -0.6103323, -1.980332, 0, 1, 0.8313726, 1,
-0.04382212, 1.798381, -0.9326013, 0, 1, 0.8392157, 1,
-0.04317683, 0.3242154, 0.1980297, 0, 1, 0.8431373, 1,
-0.03870104, -0.8709837, -2.965854, 0, 1, 0.8509804, 1,
-0.03647558, 0.3732502, -0.1475761, 0, 1, 0.854902, 1,
-0.03630232, 0.9205534, 0.8212682, 0, 1, 0.8627451, 1,
-0.03257967, 0.7014445, -1.515258, 0, 1, 0.8666667, 1,
-0.03192897, -0.2887479, -3.942069, 0, 1, 0.8745098, 1,
-0.02904005, 2.934156, -0.8942222, 0, 1, 0.8784314, 1,
-0.01517436, 0.6248615, -1.22644, 0, 1, 0.8862745, 1,
-0.01276433, 1.135012, -0.04465324, 0, 1, 0.8901961, 1,
-0.01081306, -1.242021, -2.873394, 0, 1, 0.8980392, 1,
-0.01074858, -1.437618, -3.169166, 0, 1, 0.9058824, 1,
-0.01061728, -0.9107033, -2.509236, 0, 1, 0.9098039, 1,
-0.006435246, -0.3201444, -4.819936, 0, 1, 0.9176471, 1,
-0.001700463, 0.939126, 0.3780288, 0, 1, 0.9215686, 1,
-0.001118663, -0.1210001, -2.595134, 0, 1, 0.9294118, 1,
0.002225011, -0.9088852, 3.434618, 0, 1, 0.9333333, 1,
0.004616184, 0.5727391, 0.8327124, 0, 1, 0.9411765, 1,
0.004989438, -1.985264, 2.556789, 0, 1, 0.945098, 1,
0.01111222, 0.3309983, -0.05604488, 0, 1, 0.9529412, 1,
0.01392473, 0.3897003, -0.6410149, 0, 1, 0.9568627, 1,
0.01659132, -0.4154708, 3.880423, 0, 1, 0.9647059, 1,
0.0205013, -0.06903135, 2.893347, 0, 1, 0.9686275, 1,
0.02345899, -0.7302597, 0.02907487, 0, 1, 0.9764706, 1,
0.02476097, -0.3467081, 3.066421, 0, 1, 0.9803922, 1,
0.02514453, -0.7677981, 2.857922, 0, 1, 0.9882353, 1,
0.02537631, -1.10867, 3.736667, 0, 1, 0.9921569, 1,
0.02721986, -0.5900376, 2.05497, 0, 1, 1, 1,
0.03093977, -0.4370901, 2.537241, 0, 0.9921569, 1, 1,
0.0344957, -0.1825265, 2.462471, 0, 0.9882353, 1, 1,
0.03898783, -1.450575, 4.291115, 0, 0.9803922, 1, 1,
0.04662486, -0.5542701, 1.974318, 0, 0.9764706, 1, 1,
0.05035399, -0.9520835, 2.23605, 0, 0.9686275, 1, 1,
0.05092683, 0.7802673, 0.9925606, 0, 0.9647059, 1, 1,
0.05324275, 0.6982667, 1.899555, 0, 0.9568627, 1, 1,
0.05757173, -0.5035974, 2.730562, 0, 0.9529412, 1, 1,
0.06379889, 1.141414, 0.8583549, 0, 0.945098, 1, 1,
0.0662135, 0.03374055, 0.9406676, 0, 0.9411765, 1, 1,
0.06624368, -1.205423, 2.919044, 0, 0.9333333, 1, 1,
0.06640855, 0.4252813, 1.187658, 0, 0.9294118, 1, 1,
0.06929821, 0.3763693, -0.3257332, 0, 0.9215686, 1, 1,
0.07092916, 0.2851138, 0.9180915, 0, 0.9176471, 1, 1,
0.07234317, -1.239592, 2.656926, 0, 0.9098039, 1, 1,
0.08215725, 0.9880142, 1.413467, 0, 0.9058824, 1, 1,
0.09258956, -0.6589702, 3.680844, 0, 0.8980392, 1, 1,
0.09618536, 0.9037596, 1.852647, 0, 0.8901961, 1, 1,
0.1004479, 0.7960404, 0.2031198, 0, 0.8862745, 1, 1,
0.1020897, -1.392904, 2.851998, 0, 0.8784314, 1, 1,
0.107154, -0.4328872, 3.322532, 0, 0.8745098, 1, 1,
0.1083958, 0.7070101, -1.835809, 0, 0.8666667, 1, 1,
0.1139705, -0.5413224, 2.626734, 0, 0.8627451, 1, 1,
0.116134, -1.353941, 2.998804, 0, 0.854902, 1, 1,
0.1175615, 1.788836, -0.3327372, 0, 0.8509804, 1, 1,
0.1183343, 0.5889911, 0.9473569, 0, 0.8431373, 1, 1,
0.1197256, -0.3962417, 2.81092, 0, 0.8392157, 1, 1,
0.1216043, -1.042038, 5.310508, 0, 0.8313726, 1, 1,
0.1225352, -0.4405509, 5.307605, 0, 0.827451, 1, 1,
0.125425, 0.01319533, 2.95252, 0, 0.8196079, 1, 1,
0.1272785, 1.176562, -0.8215064, 0, 0.8156863, 1, 1,
0.128145, 1.261574, 0.7045186, 0, 0.8078431, 1, 1,
0.1317554, 2.07238, -1.977381, 0, 0.8039216, 1, 1,
0.1335301, -1.143156, 3.777187, 0, 0.7960784, 1, 1,
0.1368376, -0.3899607, 3.364487, 0, 0.7882353, 1, 1,
0.1399509, -1.301028, 2.767567, 0, 0.7843137, 1, 1,
0.1399677, -0.9161096, 3.73149, 0, 0.7764706, 1, 1,
0.1410832, -0.4975868, 2.395517, 0, 0.772549, 1, 1,
0.1432907, 0.05045374, 2.765007, 0, 0.7647059, 1, 1,
0.1472673, -0.08237647, 1.651121, 0, 0.7607843, 1, 1,
0.1482575, 0.9693606, 1.571625, 0, 0.7529412, 1, 1,
0.1558589, 2.430326, -0.8809738, 0, 0.7490196, 1, 1,
0.1638689, -1.421284, 3.468254, 0, 0.7411765, 1, 1,
0.1692719, 0.9110352, 1.100826, 0, 0.7372549, 1, 1,
0.1725118, 1.708389, -1.068693, 0, 0.7294118, 1, 1,
0.175934, -1.669409, 2.186635, 0, 0.7254902, 1, 1,
0.1837636, 1.369998, -1.015766, 0, 0.7176471, 1, 1,
0.1840512, -1.304013, 4.949574, 0, 0.7137255, 1, 1,
0.1873173, -0.2192021, 2.08097, 0, 0.7058824, 1, 1,
0.1895496, -0.9251251, 2.079201, 0, 0.6980392, 1, 1,
0.1896407, 0.04849575, 1.312331, 0, 0.6941177, 1, 1,
0.196034, 2.592752, 1.416377, 0, 0.6862745, 1, 1,
0.2017698, 0.6759683, -0.4325024, 0, 0.682353, 1, 1,
0.2019546, 0.1768513, 2.438605, 0, 0.6745098, 1, 1,
0.2027134, 0.2552861, -1.196136, 0, 0.6705883, 1, 1,
0.2035781, -0.9282601, 2.532748, 0, 0.6627451, 1, 1,
0.2058044, -0.1923545, 3.375178, 0, 0.6588235, 1, 1,
0.2080404, -0.6826987, 3.610147, 0, 0.6509804, 1, 1,
0.208307, 0.5898393, -0.3534058, 0, 0.6470588, 1, 1,
0.2105536, 2.118513, 0.03588441, 0, 0.6392157, 1, 1,
0.2117728, -1.1699, 3.71419, 0, 0.6352941, 1, 1,
0.214745, -0.1973658, 2.828241, 0, 0.627451, 1, 1,
0.2156226, -0.6756368, 3.928276, 0, 0.6235294, 1, 1,
0.2163189, -1.284378, 2.636307, 0, 0.6156863, 1, 1,
0.2181619, -0.8449792, 2.184444, 0, 0.6117647, 1, 1,
0.2188103, -0.7910828, 4.191218, 0, 0.6039216, 1, 1,
0.2192779, -0.3105186, 2.884939, 0, 0.5960785, 1, 1,
0.221083, -1.555373, 2.474427, 0, 0.5921569, 1, 1,
0.2212863, 0.3840097, 0.9532806, 0, 0.5843138, 1, 1,
0.2215721, -0.00541779, 1.495002, 0, 0.5803922, 1, 1,
0.2222271, 0.484925, -1.288652, 0, 0.572549, 1, 1,
0.2225098, -1.59515, 2.831591, 0, 0.5686275, 1, 1,
0.2227629, -1.170786, 3.389301, 0, 0.5607843, 1, 1,
0.2235071, -0.01424926, 2.510952, 0, 0.5568628, 1, 1,
0.2309716, 0.659, 0.3607636, 0, 0.5490196, 1, 1,
0.2331726, 0.9007048, 3.301119, 0, 0.5450981, 1, 1,
0.2341515, 0.4768061, 0.3213429, 0, 0.5372549, 1, 1,
0.2391935, -1.47873, 3.236952, 0, 0.5333334, 1, 1,
0.2414976, 0.5663478, 0.4522549, 0, 0.5254902, 1, 1,
0.2470823, 0.3570044, -0.8991085, 0, 0.5215687, 1, 1,
0.248529, -1.745242, 0.868692, 0, 0.5137255, 1, 1,
0.2515597, 0.5033556, 2.727235, 0, 0.509804, 1, 1,
0.253151, -1.202801, 2.64217, 0, 0.5019608, 1, 1,
0.2532985, -0.05930001, 0.6051378, 0, 0.4941176, 1, 1,
0.254221, -2.08719, 2.867973, 0, 0.4901961, 1, 1,
0.2553385, -2.094063, 3.441561, 0, 0.4823529, 1, 1,
0.2567023, 0.556035, 1.05955, 0, 0.4784314, 1, 1,
0.2594224, -0.01586869, 0.8934089, 0, 0.4705882, 1, 1,
0.2633567, 0.2576855, 1.40756, 0, 0.4666667, 1, 1,
0.2645456, 0.272995, -0.8486663, 0, 0.4588235, 1, 1,
0.2650685, -1.589364, 4.909791, 0, 0.454902, 1, 1,
0.2663349, -0.1628836, 2.259852, 0, 0.4470588, 1, 1,
0.2667837, -1.006681, 3.032845, 0, 0.4431373, 1, 1,
0.2728071, -0.4813412, 3.375558, 0, 0.4352941, 1, 1,
0.2745428, 2.638003, -0.718663, 0, 0.4313726, 1, 1,
0.2757154, 1.185579, 1.213634, 0, 0.4235294, 1, 1,
0.2800265, 2.324065, 0.8487941, 0, 0.4196078, 1, 1,
0.2801814, -0.6501122, 3.348503, 0, 0.4117647, 1, 1,
0.2824, 1.291977, -0.4015686, 0, 0.4078431, 1, 1,
0.2835724, 0.3244679, 0.9931134, 0, 0.4, 1, 1,
0.2848827, 0.7487771, -1.033008, 0, 0.3921569, 1, 1,
0.2862914, -1.768114, 3.38543, 0, 0.3882353, 1, 1,
0.2872666, 0.9246083, 0.0190187, 0, 0.3803922, 1, 1,
0.2880592, 0.773103, 1.955073, 0, 0.3764706, 1, 1,
0.2890859, -1.268751, 3.58016, 0, 0.3686275, 1, 1,
0.2895172, -0.5669246, 3.458109, 0, 0.3647059, 1, 1,
0.2919003, -0.07227425, 1.729638, 0, 0.3568628, 1, 1,
0.29564, -2.156979, 1.430512, 0, 0.3529412, 1, 1,
0.2962545, -0.4696416, 2.312436, 0, 0.345098, 1, 1,
0.2977147, 0.822022, 0.9268895, 0, 0.3411765, 1, 1,
0.2989762, -1.293368, 3.181463, 0, 0.3333333, 1, 1,
0.2990068, -0.6834796, 3.346391, 0, 0.3294118, 1, 1,
0.3003657, -0.9790958, 3.149559, 0, 0.3215686, 1, 1,
0.3014081, 0.3408917, 0.8096797, 0, 0.3176471, 1, 1,
0.3045402, -0.2942964, 0.9173638, 0, 0.3098039, 1, 1,
0.3047074, -0.4469542, 2.429995, 0, 0.3058824, 1, 1,
0.3075879, -0.461505, 1.985082, 0, 0.2980392, 1, 1,
0.3083386, -2.004881, 2.087488, 0, 0.2901961, 1, 1,
0.3084374, 2.069033, -0.02313751, 0, 0.2862745, 1, 1,
0.3111144, 2.122032, -0.4805288, 0, 0.2784314, 1, 1,
0.3146784, 0.7802291, 0.6557705, 0, 0.2745098, 1, 1,
0.3168756, -0.8940103, 2.629878, 0, 0.2666667, 1, 1,
0.3188346, 0.2981987, -0.609711, 0, 0.2627451, 1, 1,
0.3240496, -0.7053109, 1.81029, 0, 0.254902, 1, 1,
0.3383835, -0.7466837, 3.988155, 0, 0.2509804, 1, 1,
0.3408241, 0.4869503, 1.331752, 0, 0.2431373, 1, 1,
0.3454456, 1.273425, 0.1155387, 0, 0.2392157, 1, 1,
0.3464817, 1.310783, 0.417647, 0, 0.2313726, 1, 1,
0.3515023, 0.8052843, -0.8227898, 0, 0.227451, 1, 1,
0.3563452, -1.371335, 0.953274, 0, 0.2196078, 1, 1,
0.3580182, -0.3737498, 3.814939, 0, 0.2156863, 1, 1,
0.3600325, -0.6577934, 0.5750686, 0, 0.2078431, 1, 1,
0.3606174, -1.399024, 3.783795, 0, 0.2039216, 1, 1,
0.3623246, 1.443472, -0.415828, 0, 0.1960784, 1, 1,
0.3633696, 0.7463382, -0.07995538, 0, 0.1882353, 1, 1,
0.3668141, 1.221403, 0.7179282, 0, 0.1843137, 1, 1,
0.3668412, 0.2237347, 2.191836, 0, 0.1764706, 1, 1,
0.3681847, 1.466138, -0.302931, 0, 0.172549, 1, 1,
0.3683425, -2.468294, 4.629003, 0, 0.1647059, 1, 1,
0.3690431, 0.6557328, 1.16539, 0, 0.1607843, 1, 1,
0.3712479, 0.8934923, 0.5944329, 0, 0.1529412, 1, 1,
0.3725185, 0.3916952, -0.3361191, 0, 0.1490196, 1, 1,
0.3729705, 0.237853, 0.7042323, 0, 0.1411765, 1, 1,
0.3748004, -0.8855636, 2.170561, 0, 0.1372549, 1, 1,
0.3768681, -0.3667419, 1.388555, 0, 0.1294118, 1, 1,
0.3794588, -0.110879, 2.650317, 0, 0.1254902, 1, 1,
0.379495, 2.233324, -1.150952, 0, 0.1176471, 1, 1,
0.3806898, -2.366864, 2.44413, 0, 0.1137255, 1, 1,
0.3853626, -0.2207857, 3.690759, 0, 0.1058824, 1, 1,
0.390926, -0.8746776, 2.581729, 0, 0.09803922, 1, 1,
0.3969715, 1.00179, 1.795889, 0, 0.09411765, 1, 1,
0.3988108, 1.273291, -0.06625989, 0, 0.08627451, 1, 1,
0.4011866, 0.6914174, 0.6212825, 0, 0.08235294, 1, 1,
0.4023602, -1.258291, 0.0651883, 0, 0.07450981, 1, 1,
0.4048162, 0.6726961, -1.083592, 0, 0.07058824, 1, 1,
0.4058366, -0.9369386, 4.022699, 0, 0.0627451, 1, 1,
0.4064507, 1.541372, 1.713717, 0, 0.05882353, 1, 1,
0.4106966, 1.487999, 0.04889172, 0, 0.05098039, 1, 1,
0.4138827, 0.210564, 1.374273, 0, 0.04705882, 1, 1,
0.4162405, 1.251274, 0.9751201, 0, 0.03921569, 1, 1,
0.4265981, 0.4248053, -1.527233, 0, 0.03529412, 1, 1,
0.4295494, 1.935076, 1.101027, 0, 0.02745098, 1, 1,
0.4363885, -0.2214746, 2.541489, 0, 0.02352941, 1, 1,
0.4451774, -0.6512371, 2.479823, 0, 0.01568628, 1, 1,
0.4477883, 0.4649071, 1.540586, 0, 0.01176471, 1, 1,
0.4504428, 0.1296145, 1.647569, 0, 0.003921569, 1, 1,
0.4554044, 0.1324753, 0.2313044, 0.003921569, 0, 1, 1,
0.4563427, -0.7910133, 3.340034, 0.007843138, 0, 1, 1,
0.4575402, -0.5147353, 2.861092, 0.01568628, 0, 1, 1,
0.4591266, 0.153542, 2.517585, 0.01960784, 0, 1, 1,
0.4591445, -1.438668, 2.682917, 0.02745098, 0, 1, 1,
0.4623684, 0.5913952, 3.205009, 0.03137255, 0, 1, 1,
0.4625697, 0.03464502, 0.9608685, 0.03921569, 0, 1, 1,
0.4626867, -1.321725, 3.662341, 0.04313726, 0, 1, 1,
0.4634244, 1.581968, 0.03605586, 0.05098039, 0, 1, 1,
0.4650615, -0.5485243, 2.589435, 0.05490196, 0, 1, 1,
0.4670306, -0.9590057, 3.626325, 0.0627451, 0, 1, 1,
0.4683483, 1.029248, 0.3860524, 0.06666667, 0, 1, 1,
0.4720647, 0.6721866, 2.698792, 0.07450981, 0, 1, 1,
0.4760438, -0.8308735, 2.45645, 0.07843138, 0, 1, 1,
0.4770178, -0.1059472, 0.9735907, 0.08627451, 0, 1, 1,
0.4814635, -0.04229426, 1.760727, 0.09019608, 0, 1, 1,
0.4817831, -0.8569984, 2.036916, 0.09803922, 0, 1, 1,
0.4849571, -1.308099, 2.813482, 0.1058824, 0, 1, 1,
0.4858618, -1.392372, 3.081624, 0.1098039, 0, 1, 1,
0.4876835, 1.077436, 0.4913461, 0.1176471, 0, 1, 1,
0.4892585, -2.321045, 1.765824, 0.1215686, 0, 1, 1,
0.4935293, -0.2258433, 1.951897, 0.1294118, 0, 1, 1,
0.4977568, -1.101679, 2.651562, 0.1333333, 0, 1, 1,
0.500019, -0.5732855, 4.704628, 0.1411765, 0, 1, 1,
0.5079163, 0.8484268, 0.2875265, 0.145098, 0, 1, 1,
0.5099839, -0.1111559, 1.17504, 0.1529412, 0, 1, 1,
0.5149385, -1.510182, 3.621385, 0.1568628, 0, 1, 1,
0.5187923, -0.8395385, 3.557503, 0.1647059, 0, 1, 1,
0.5192606, -0.1320557, 1.424541, 0.1686275, 0, 1, 1,
0.52006, 0.2608595, 2.312045, 0.1764706, 0, 1, 1,
0.525822, 1.234826, -0.1599298, 0.1803922, 0, 1, 1,
0.5297601, -0.1271191, 1.776794, 0.1882353, 0, 1, 1,
0.5298408, -0.6973093, 2.346671, 0.1921569, 0, 1, 1,
0.5324058, -0.4459434, 2.115393, 0.2, 0, 1, 1,
0.5357957, 1.341402, -0.5283511, 0.2078431, 0, 1, 1,
0.5363235, 0.5086941, -0.2187088, 0.2117647, 0, 1, 1,
0.5375015, 2.008577, -0.02444377, 0.2196078, 0, 1, 1,
0.5410608, 0.841141, 0.8090296, 0.2235294, 0, 1, 1,
0.5415125, 0.3116535, 0.4039849, 0.2313726, 0, 1, 1,
0.5434052, -0.3603438, 2.383919, 0.2352941, 0, 1, 1,
0.5455572, 0.6062177, 0.4182341, 0.2431373, 0, 1, 1,
0.5504185, -1.03429, 2.491166, 0.2470588, 0, 1, 1,
0.5538378, -2.32842, 2.722497, 0.254902, 0, 1, 1,
0.5581646, -0.157033, 3.294616, 0.2588235, 0, 1, 1,
0.5696405, -0.3891925, 0.1085344, 0.2666667, 0, 1, 1,
0.5754545, 1.036283, -0.5718217, 0.2705882, 0, 1, 1,
0.5759555, 0.01968037, 2.080623, 0.2784314, 0, 1, 1,
0.5773634, 1.491812, 0.996646, 0.282353, 0, 1, 1,
0.5780876, -1.534498, 3.869636, 0.2901961, 0, 1, 1,
0.578707, 0.4552535, 0.4115462, 0.2941177, 0, 1, 1,
0.5791065, 0.8027358, 0.3572041, 0.3019608, 0, 1, 1,
0.5795451, 0.1635382, 1.382322, 0.3098039, 0, 1, 1,
0.5894526, 0.400876, 2.209888, 0.3137255, 0, 1, 1,
0.5938823, -0.4505469, 2.328499, 0.3215686, 0, 1, 1,
0.5990788, 0.1770447, 1.594776, 0.3254902, 0, 1, 1,
0.6086665, -1.576946, 3.941565, 0.3333333, 0, 1, 1,
0.6087685, -0.1839333, 1.280565, 0.3372549, 0, 1, 1,
0.6153702, -1.680601, 2.602216, 0.345098, 0, 1, 1,
0.6165187, -2.53529, 2.514436, 0.3490196, 0, 1, 1,
0.6184489, -0.02668761, 1.590847, 0.3568628, 0, 1, 1,
0.6202816, -0.834387, 3.090702, 0.3607843, 0, 1, 1,
0.6305782, -0.1194974, 1.994715, 0.3686275, 0, 1, 1,
0.6313165, -0.3981528, 3.384962, 0.372549, 0, 1, 1,
0.6313229, 0.1067468, 1.359725, 0.3803922, 0, 1, 1,
0.6328049, -0.3678732, 1.613085, 0.3843137, 0, 1, 1,
0.6433516, -0.1755104, 3.153069, 0.3921569, 0, 1, 1,
0.6444859, 0.7576722, 2.875566, 0.3960784, 0, 1, 1,
0.6494467, -0.3026233, 2.818636, 0.4039216, 0, 1, 1,
0.6573489, 1.381067, -0.7480066, 0.4117647, 0, 1, 1,
0.6581426, -0.560935, 1.428448, 0.4156863, 0, 1, 1,
0.6592894, 0.2601582, 0.8275562, 0.4235294, 0, 1, 1,
0.6601961, -1.708328, 2.237929, 0.427451, 0, 1, 1,
0.6611639, 0.03257919, 1.780006, 0.4352941, 0, 1, 1,
0.6643845, -0.007764451, 0.4026541, 0.4392157, 0, 1, 1,
0.6673419, -0.1758146, 3.289966, 0.4470588, 0, 1, 1,
0.6713551, 0.8098466, 0.3836965, 0.4509804, 0, 1, 1,
0.674044, -0.815809, 6.205668, 0.4588235, 0, 1, 1,
0.6772535, -0.3107707, 0.7563855, 0.4627451, 0, 1, 1,
0.6831053, -1.400074, 2.717356, 0.4705882, 0, 1, 1,
0.6855036, -0.5140527, 2.200763, 0.4745098, 0, 1, 1,
0.6941485, -1.532299, 2.379535, 0.4823529, 0, 1, 1,
0.7041082, -1.057303, 1.456838, 0.4862745, 0, 1, 1,
0.7043, 1.313696, 0.3154127, 0.4941176, 0, 1, 1,
0.707891, 1.500458, 1.634967, 0.5019608, 0, 1, 1,
0.7192269, 1.465846, -0.4204291, 0.5058824, 0, 1, 1,
0.7231002, 0.1419065, 4.187393, 0.5137255, 0, 1, 1,
0.7266197, -0.2868659, 1.019745, 0.5176471, 0, 1, 1,
0.7289324, 0.6363038, 1.347847, 0.5254902, 0, 1, 1,
0.7347128, -0.6451887, -0.01688177, 0.5294118, 0, 1, 1,
0.7352978, -1.55762, 2.73945, 0.5372549, 0, 1, 1,
0.7363343, -2.199519, 4.970903, 0.5411765, 0, 1, 1,
0.7380384, -1.082811, 2.998349, 0.5490196, 0, 1, 1,
0.7382178, -0.01910488, 0.6449218, 0.5529412, 0, 1, 1,
0.7392926, -0.434762, 2.490001, 0.5607843, 0, 1, 1,
0.7425913, -0.4124841, 1.956908, 0.5647059, 0, 1, 1,
0.7430551, 1.453709, -0.5710818, 0.572549, 0, 1, 1,
0.745562, -0.7865012, 1.489371, 0.5764706, 0, 1, 1,
0.7487845, 0.291038, 2.13196, 0.5843138, 0, 1, 1,
0.7602008, 0.6772329, 0.2470447, 0.5882353, 0, 1, 1,
0.7619737, 0.9542745, 1.439883, 0.5960785, 0, 1, 1,
0.7631601, 0.6763384, 0.7400635, 0.6039216, 0, 1, 1,
0.7718017, -0.46883, 1.935854, 0.6078432, 0, 1, 1,
0.7733895, 0.6311296, 1.764344, 0.6156863, 0, 1, 1,
0.7756008, 1.701622, 1.345944, 0.6196079, 0, 1, 1,
0.7759659, -0.6301553, 2.437383, 0.627451, 0, 1, 1,
0.7785751, -1.075676, 3.978152, 0.6313726, 0, 1, 1,
0.7876873, -1.020755, 2.817262, 0.6392157, 0, 1, 1,
0.7893654, -3.187218, 3.455864, 0.6431373, 0, 1, 1,
0.790968, -0.5960403, 2.519521, 0.6509804, 0, 1, 1,
0.7922673, 0.4645644, 0.8120327, 0.654902, 0, 1, 1,
0.7951015, -1.385069, 3.330105, 0.6627451, 0, 1, 1,
0.7987232, 1.231341, 0.3031727, 0.6666667, 0, 1, 1,
0.8012921, -1.278673, 0.9859303, 0.6745098, 0, 1, 1,
0.8013981, 0.3437941, 1.373722, 0.6784314, 0, 1, 1,
0.8060079, 1.592402, 0.1662306, 0.6862745, 0, 1, 1,
0.8138905, -2.004574, 4.123628, 0.6901961, 0, 1, 1,
0.8189649, -1.3493, 4.306279, 0.6980392, 0, 1, 1,
0.8192323, 0.6459563, 1.728998, 0.7058824, 0, 1, 1,
0.824095, -0.7665462, 1.096245, 0.7098039, 0, 1, 1,
0.8315881, 3.373023, 0.5662591, 0.7176471, 0, 1, 1,
0.8345888, 0.2784608, 1.310399, 0.7215686, 0, 1, 1,
0.8376117, -0.5872487, 0.8296205, 0.7294118, 0, 1, 1,
0.840374, -0.5669071, 1.698315, 0.7333333, 0, 1, 1,
0.8439595, 1.653825, 0.7771348, 0.7411765, 0, 1, 1,
0.8476138, -0.6323721, 2.982439, 0.7450981, 0, 1, 1,
0.8536081, -0.223799, 2.697561, 0.7529412, 0, 1, 1,
0.8545955, 0.9076125, 0.2924613, 0.7568628, 0, 1, 1,
0.8592064, -0.4072064, 2.842073, 0.7647059, 0, 1, 1,
0.8602141, 1.294512, 0.9500657, 0.7686275, 0, 1, 1,
0.8614385, -0.2569756, 3.148442, 0.7764706, 0, 1, 1,
0.8648534, -0.07946143, 1.276929, 0.7803922, 0, 1, 1,
0.8671544, -0.707792, 2.349297, 0.7882353, 0, 1, 1,
0.8789998, -0.1853362, 3.19782, 0.7921569, 0, 1, 1,
0.8796149, -0.8651288, 4.524755, 0.8, 0, 1, 1,
0.8861458, -0.7681335, 1.52017, 0.8078431, 0, 1, 1,
0.8890222, 1.255664, 1.09954, 0.8117647, 0, 1, 1,
0.8916801, -0.5185846, 2.851828, 0.8196079, 0, 1, 1,
0.8917128, 0.5435306, -1.437731, 0.8235294, 0, 1, 1,
0.8971131, 0.3155418, 2.523659, 0.8313726, 0, 1, 1,
0.9051805, -0.04267161, 2.637207, 0.8352941, 0, 1, 1,
0.9058198, -1.368046, 2.456794, 0.8431373, 0, 1, 1,
0.9103046, -0.7410597, 2.134401, 0.8470588, 0, 1, 1,
0.9107985, -1.278178, 2.25437, 0.854902, 0, 1, 1,
0.9183087, -0.9006205, 2.316004, 0.8588235, 0, 1, 1,
0.9295461, -0.34485, 3.016045, 0.8666667, 0, 1, 1,
0.9384313, -0.2714823, 0.8479212, 0.8705882, 0, 1, 1,
0.9392119, -0.04573636, 2.511122, 0.8784314, 0, 1, 1,
0.9421008, 0.8502882, 0.9364829, 0.8823529, 0, 1, 1,
0.9462099, 1.424545, 1.163013, 0.8901961, 0, 1, 1,
0.9471042, 0.8375473, 0.3115002, 0.8941177, 0, 1, 1,
0.9497617, 1.115763, 1.302427, 0.9019608, 0, 1, 1,
0.9518859, 0.06549323, 2.589639, 0.9098039, 0, 1, 1,
0.9574998, -0.9157659, 2.926797, 0.9137255, 0, 1, 1,
0.9594612, 0.5208757, 1.991809, 0.9215686, 0, 1, 1,
0.9736273, -2.112243, 3.278363, 0.9254902, 0, 1, 1,
0.9826549, 1.203602, 1.472751, 0.9333333, 0, 1, 1,
0.9892367, 1.088207, 0.3953888, 0.9372549, 0, 1, 1,
0.9937757, -1.882089, 3.639548, 0.945098, 0, 1, 1,
0.9950658, -0.5219323, 2.873799, 0.9490196, 0, 1, 1,
0.9960285, 0.02175033, 1.192383, 0.9568627, 0, 1, 1,
1.003632, -1.072765, 1.940565, 0.9607843, 0, 1, 1,
1.005153, 0.9766747, -0.5570954, 0.9686275, 0, 1, 1,
1.006256, -0.4534784, 2.374064, 0.972549, 0, 1, 1,
1.007079, 0.9572204, 1.627188, 0.9803922, 0, 1, 1,
1.019615, -1.244857, 4.22235, 0.9843137, 0, 1, 1,
1.025669, 0.7848311, 0.7914428, 0.9921569, 0, 1, 1,
1.030914, -0.6585524, 1.074185, 0.9960784, 0, 1, 1,
1.036939, -1.546933, 3.905122, 1, 0, 0.9960784, 1,
1.038796, 0.3448097, 1.157977, 1, 0, 0.9882353, 1,
1.052736, -0.64738, 3.012817, 1, 0, 0.9843137, 1,
1.053879, -0.03727302, 0.948285, 1, 0, 0.9764706, 1,
1.06131, 0.07075049, 1.920225, 1, 0, 0.972549, 1,
1.063673, 0.5814708, 1.449721, 1, 0, 0.9647059, 1,
1.064647, -0.8646389, 2.219243, 1, 0, 0.9607843, 1,
1.070156, 0.06667034, 1.628455, 1, 0, 0.9529412, 1,
1.07649, -0.5044864, 3.323381, 1, 0, 0.9490196, 1,
1.08101, -0.8925674, 2.28367, 1, 0, 0.9411765, 1,
1.081023, -0.4772353, 3.672911, 1, 0, 0.9372549, 1,
1.084261, 0.2427395, -0.9337329, 1, 0, 0.9294118, 1,
1.086748, -0.9978439, 1.624733, 1, 0, 0.9254902, 1,
1.088517, -0.06459528, 2.029149, 1, 0, 0.9176471, 1,
1.107627, -0.7222466, 2.638984, 1, 0, 0.9137255, 1,
1.108688, 1.267262, 1.918289, 1, 0, 0.9058824, 1,
1.113984, 0.008421877, 1.622893, 1, 0, 0.9019608, 1,
1.118803, 0.5881559, 0.8397729, 1, 0, 0.8941177, 1,
1.132722, 0.111351, 0.7979958, 1, 0, 0.8862745, 1,
1.13698, 1.522979, -0.7054886, 1, 0, 0.8823529, 1,
1.146538, 1.14046, -0.2590417, 1, 0, 0.8745098, 1,
1.161263, -1.278502, 1.431227, 1, 0, 0.8705882, 1,
1.161507, 1.241071, -0.03238828, 1, 0, 0.8627451, 1,
1.171116, 0.9098794, 1.374831, 1, 0, 0.8588235, 1,
1.17223, 0.9002095, 0.6849643, 1, 0, 0.8509804, 1,
1.177529, 0.9650893, 2.076299, 1, 0, 0.8470588, 1,
1.181124, -0.08490332, 1.486196, 1, 0, 0.8392157, 1,
1.184952, 0.157207, 0.08877683, 1, 0, 0.8352941, 1,
1.185187, 1.041438, -0.2012547, 1, 0, 0.827451, 1,
1.196044, 2.0627, 0.7108512, 1, 0, 0.8235294, 1,
1.199437, 1.463998, 1.521175, 1, 0, 0.8156863, 1,
1.203831, -0.2867536, 2.561241, 1, 0, 0.8117647, 1,
1.207697, -1.453557, 3.57966, 1, 0, 0.8039216, 1,
1.21993, -0.0485297, 0.8295084, 1, 0, 0.7960784, 1,
1.227375, 0.2497216, 3.774387, 1, 0, 0.7921569, 1,
1.228421, -0.2708045, 0.8799723, 1, 0, 0.7843137, 1,
1.231485, 0.09891135, 0.2370044, 1, 0, 0.7803922, 1,
1.238282, 1.858892, 0.5928958, 1, 0, 0.772549, 1,
1.239606, -1.147904, 1.970999, 1, 0, 0.7686275, 1,
1.243712, -0.3025341, 1.676599, 1, 0, 0.7607843, 1,
1.243923, 0.4617479, 2.053309, 1, 0, 0.7568628, 1,
1.25133, 0.6864682, 1.905742, 1, 0, 0.7490196, 1,
1.251949, -0.8344858, 1.323734, 1, 0, 0.7450981, 1,
1.268472, -0.8907868, 2.565481, 1, 0, 0.7372549, 1,
1.276834, -1.118725, 3.1058, 1, 0, 0.7333333, 1,
1.280988, 0.0538751, 1.468331, 1, 0, 0.7254902, 1,
1.292091, -0.8859262, 1.674451, 1, 0, 0.7215686, 1,
1.293971, -1.344186, 0.8757342, 1, 0, 0.7137255, 1,
1.300433, 0.1090204, 0.4717431, 1, 0, 0.7098039, 1,
1.307052, 1.239621, 0.2217135, 1, 0, 0.7019608, 1,
1.308099, -0.3812333, 2.028488, 1, 0, 0.6941177, 1,
1.31536, -0.1407534, 0.7029559, 1, 0, 0.6901961, 1,
1.315472, 0.4592722, 2.511499, 1, 0, 0.682353, 1,
1.320353, -0.3591191, 0.2140979, 1, 0, 0.6784314, 1,
1.329757, -0.512037, 3.752454, 1, 0, 0.6705883, 1,
1.330773, -1.247864, 3.009969, 1, 0, 0.6666667, 1,
1.331509, -2.104503, 2.056783, 1, 0, 0.6588235, 1,
1.336569, -0.7825022, 1.60869, 1, 0, 0.654902, 1,
1.343047, -1.073166, 2.818962, 1, 0, 0.6470588, 1,
1.343363, 1.200858, 0.03849484, 1, 0, 0.6431373, 1,
1.343544, 0.3467687, 0.7379797, 1, 0, 0.6352941, 1,
1.347822, 1.965802, -0.1093908, 1, 0, 0.6313726, 1,
1.384286, -0.3619041, 3.745216, 1, 0, 0.6235294, 1,
1.397537, -0.1193814, 2.179442, 1, 0, 0.6196079, 1,
1.401493, -1.59463, 3.793153, 1, 0, 0.6117647, 1,
1.406572, -0.6575437, 2.038733, 1, 0, 0.6078432, 1,
1.415339, -0.6561667, 0.4331632, 1, 0, 0.6, 1,
1.417396, -0.2231155, 1.076817, 1, 0, 0.5921569, 1,
1.420979, -1.033106, 1.414619, 1, 0, 0.5882353, 1,
1.437209, 0.5715156, 2.981137, 1, 0, 0.5803922, 1,
1.440403, 0.06919294, 2.083957, 1, 0, 0.5764706, 1,
1.445404, 1.517843, 1.042966, 1, 0, 0.5686275, 1,
1.454272, 0.5790506, 1.62712, 1, 0, 0.5647059, 1,
1.45881, 0.05751003, 2.456449, 1, 0, 0.5568628, 1,
1.45934, 1.107097, 2.207021, 1, 0, 0.5529412, 1,
1.460168, 1.784091, -0.7082866, 1, 0, 0.5450981, 1,
1.464091, -0.6761295, 1.60283, 1, 0, 0.5411765, 1,
1.465282, 0.1401483, 3.859671, 1, 0, 0.5333334, 1,
1.466502, -0.3114227, -0.1426032, 1, 0, 0.5294118, 1,
1.494507, 0.5810324, 0.3373212, 1, 0, 0.5215687, 1,
1.502923, 1.220688, -2.056314, 1, 0, 0.5176471, 1,
1.513334, -0.4001708, 1.507853, 1, 0, 0.509804, 1,
1.52685, -0.712263, 0.3465074, 1, 0, 0.5058824, 1,
1.529879, 0.02046141, 2.215477, 1, 0, 0.4980392, 1,
1.533037, 0.5700352, 2.016735, 1, 0, 0.4901961, 1,
1.539093, -0.1096566, 0.1111389, 1, 0, 0.4862745, 1,
1.544506, 1.051611, 1.878192, 1, 0, 0.4784314, 1,
1.557765, -2.178119, 1.986322, 1, 0, 0.4745098, 1,
1.580243, 0.6804463, 2.064703, 1, 0, 0.4666667, 1,
1.58442, 0.524065, 1.078333, 1, 0, 0.4627451, 1,
1.586674, 1.192513, 0.3166819, 1, 0, 0.454902, 1,
1.594736, 0.7265378, -1.008043, 1, 0, 0.4509804, 1,
1.600383, -1.775828, 3.53502, 1, 0, 0.4431373, 1,
1.617933, 0.1384518, 2.926173, 1, 0, 0.4392157, 1,
1.620029, 1.214609, 1.794047, 1, 0, 0.4313726, 1,
1.630618, 0.1891308, 1.992116, 1, 0, 0.427451, 1,
1.632401, -0.1737266, 1.659999, 1, 0, 0.4196078, 1,
1.640145, -1.210796, 3.924649, 1, 0, 0.4156863, 1,
1.641042, 1.586675, -2.353124, 1, 0, 0.4078431, 1,
1.655707, -0.01368675, 1.207465, 1, 0, 0.4039216, 1,
1.677153, 1.2835, 0.972047, 1, 0, 0.3960784, 1,
1.686867, -0.0654396, 1.338874, 1, 0, 0.3882353, 1,
1.693482, -0.4779102, 2.181487, 1, 0, 0.3843137, 1,
1.704364, -1.106046, -0.1676166, 1, 0, 0.3764706, 1,
1.704426, -1.743054, 2.703846, 1, 0, 0.372549, 1,
1.704834, -0.1759729, 1.675759, 1, 0, 0.3647059, 1,
1.71544, 0.4583419, 0.5451531, 1, 0, 0.3607843, 1,
1.716348, 0.9432953, 1.862197, 1, 0, 0.3529412, 1,
1.724596, 0.656591, 0.1356301, 1, 0, 0.3490196, 1,
1.735667, -1.155003, 3.216497, 1, 0, 0.3411765, 1,
1.740502, 3.329337, 2.202659, 1, 0, 0.3372549, 1,
1.754932, -1.009339, 3.027205, 1, 0, 0.3294118, 1,
1.756626, 0.02744869, 1.385696, 1, 0, 0.3254902, 1,
1.764492, -2.41967, 2.469699, 1, 0, 0.3176471, 1,
1.776835, 0.02885111, 2.514678, 1, 0, 0.3137255, 1,
1.805215, -0.1996059, 2.051055, 1, 0, 0.3058824, 1,
1.807746, 0.3078197, 2.821937, 1, 0, 0.2980392, 1,
1.811397, -0.4996991, 2.956138, 1, 0, 0.2941177, 1,
1.827995, 0.834783, 2.935743, 1, 0, 0.2862745, 1,
1.839329, 1.209206, 0.04019839, 1, 0, 0.282353, 1,
1.845037, -1.696287, 2.308258, 1, 0, 0.2745098, 1,
1.850179, 0.9688451, 1.625948, 1, 0, 0.2705882, 1,
1.86356, 0.2638147, 1.973375, 1, 0, 0.2627451, 1,
1.894293, 0.3548291, 2.292195, 1, 0, 0.2588235, 1,
1.915156, -1.331934, 2.516015, 1, 0, 0.2509804, 1,
1.922496, -1.064341, 2.008774, 1, 0, 0.2470588, 1,
1.952067, 0.8403847, 1.1109, 1, 0, 0.2392157, 1,
1.954925, 1.303713, 0.5569016, 1, 0, 0.2352941, 1,
1.95873, -1.151649, 3.052443, 1, 0, 0.227451, 1,
1.959273, -1.095052, 2.70501, 1, 0, 0.2235294, 1,
1.974736, -1.059824, 1.481601, 1, 0, 0.2156863, 1,
1.985804, 1.07459, 1.500476, 1, 0, 0.2117647, 1,
1.998379, 1.412129, 0.8186906, 1, 0, 0.2039216, 1,
2.001388, 0.7521113, 0.6065298, 1, 0, 0.1960784, 1,
2.001996, 1.395178, 0.3395704, 1, 0, 0.1921569, 1,
2.004882, 0.07652882, 2.584991, 1, 0, 0.1843137, 1,
2.011002, 1.30128, 1.076486, 1, 0, 0.1803922, 1,
2.017695, -0.1042851, 2.741131, 1, 0, 0.172549, 1,
2.032816, -0.228309, 2.254269, 1, 0, 0.1686275, 1,
2.034798, 0.3930199, 0.5005111, 1, 0, 0.1607843, 1,
2.043643, 2.319212, 0.5689769, 1, 0, 0.1568628, 1,
2.053481, -1.469435, 3.663667, 1, 0, 0.1490196, 1,
2.067788, -0.5953354, 3.63611, 1, 0, 0.145098, 1,
2.076566, 0.2731908, 0.366093, 1, 0, 0.1372549, 1,
2.08578, -0.1765088, 0.9277387, 1, 0, 0.1333333, 1,
2.091193, 2.049047, 1.30809, 1, 0, 0.1254902, 1,
2.094909, -1.09571, 1.48734, 1, 0, 0.1215686, 1,
2.132006, 1.247053, 1.38245, 1, 0, 0.1137255, 1,
2.197954, 1.076716, 1.237289, 1, 0, 0.1098039, 1,
2.236053, -0.1012022, -0.1169199, 1, 0, 0.1019608, 1,
2.291462, -1.047992, 1.875653, 1, 0, 0.09411765, 1,
2.291536, 1.583426, 2.393855, 1, 0, 0.09019608, 1,
2.292619, -0.3033286, 1.634548, 1, 0, 0.08235294, 1,
2.324576, 0.6065167, 1.439047, 1, 0, 0.07843138, 1,
2.371517, 1.685685, 1.937164, 1, 0, 0.07058824, 1,
2.389528, 0.1490453, 3.574853, 1, 0, 0.06666667, 1,
2.424252, -1.418971, 2.264713, 1, 0, 0.05882353, 1,
2.638782, 1.964924, 1.752785, 1, 0, 0.05490196, 1,
2.668535, -1.195741, 1.789973, 1, 0, 0.04705882, 1,
2.670715, 0.4278361, 1.996528, 1, 0, 0.04313726, 1,
2.698427, -0.7633169, 0.7339509, 1, 0, 0.03529412, 1,
2.731554, 0.5338801, 0.508943, 1, 0, 0.03137255, 1,
2.884018, -0.8644493, 2.100167, 1, 0, 0.02352941, 1,
2.905106, -1.869205, 3.826339, 1, 0, 0.01960784, 1,
2.933067, -0.5337301, 1.415588, 1, 0, 0.01176471, 1,
2.97715, -1.837358, 1.08135, 1, 0, 0.007843138, 1
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
0.09493268, -4.299179, -7.218451, 0, -0.5, 0.5, 0.5,
0.09493268, -4.299179, -7.218451, 1, -0.5, 0.5, 0.5,
0.09493268, -4.299179, -7.218451, 1, 1.5, 0.5, 0.5,
0.09493268, -4.299179, -7.218451, 0, 1.5, 0.5, 0.5
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
-3.764357, 0.09290242, -7.218451, 0, -0.5, 0.5, 0.5,
-3.764357, 0.09290242, -7.218451, 1, -0.5, 0.5, 0.5,
-3.764357, 0.09290242, -7.218451, 1, 1.5, 0.5, 0.5,
-3.764357, 0.09290242, -7.218451, 0, 1.5, 0.5, 0.5
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
-3.764357, -4.299179, 0.4664123, 0, -0.5, 0.5, 0.5,
-3.764357, -4.299179, 0.4664123, 1, -0.5, 0.5, 0.5,
-3.764357, -4.299179, 0.4664123, 1, 1.5, 0.5, 0.5,
-3.764357, -4.299179, 0.4664123, 0, 1.5, 0.5, 0.5
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
-2, -3.285622, -5.445022,
2, -3.285622, -5.445022,
-2, -3.285622, -5.445022,
-2, -3.454548, -5.740593,
-1, -3.285622, -5.445022,
-1, -3.454548, -5.740593,
0, -3.285622, -5.445022,
0, -3.454548, -5.740593,
1, -3.285622, -5.445022,
1, -3.454548, -5.740593,
2, -3.285622, -5.445022,
2, -3.454548, -5.740593
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
-2, -3.7924, -6.331737, 0, -0.5, 0.5, 0.5,
-2, -3.7924, -6.331737, 1, -0.5, 0.5, 0.5,
-2, -3.7924, -6.331737, 1, 1.5, 0.5, 0.5,
-2, -3.7924, -6.331737, 0, 1.5, 0.5, 0.5,
-1, -3.7924, -6.331737, 0, -0.5, 0.5, 0.5,
-1, -3.7924, -6.331737, 1, -0.5, 0.5, 0.5,
-1, -3.7924, -6.331737, 1, 1.5, 0.5, 0.5,
-1, -3.7924, -6.331737, 0, 1.5, 0.5, 0.5,
0, -3.7924, -6.331737, 0, -0.5, 0.5, 0.5,
0, -3.7924, -6.331737, 1, -0.5, 0.5, 0.5,
0, -3.7924, -6.331737, 1, 1.5, 0.5, 0.5,
0, -3.7924, -6.331737, 0, 1.5, 0.5, 0.5,
1, -3.7924, -6.331737, 0, -0.5, 0.5, 0.5,
1, -3.7924, -6.331737, 1, -0.5, 0.5, 0.5,
1, -3.7924, -6.331737, 1, 1.5, 0.5, 0.5,
1, -3.7924, -6.331737, 0, 1.5, 0.5, 0.5,
2, -3.7924, -6.331737, 0, -0.5, 0.5, 0.5,
2, -3.7924, -6.331737, 1, -0.5, 0.5, 0.5,
2, -3.7924, -6.331737, 1, 1.5, 0.5, 0.5,
2, -3.7924, -6.331737, 0, 1.5, 0.5, 0.5
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
-2.873752, -3, -5.445022,
-2.873752, 3, -5.445022,
-2.873752, -3, -5.445022,
-3.022186, -3, -5.740593,
-2.873752, -2, -5.445022,
-3.022186, -2, -5.740593,
-2.873752, -1, -5.445022,
-3.022186, -1, -5.740593,
-2.873752, 0, -5.445022,
-3.022186, 0, -5.740593,
-2.873752, 1, -5.445022,
-3.022186, 1, -5.740593,
-2.873752, 2, -5.445022,
-3.022186, 2, -5.740593,
-2.873752, 3, -5.445022,
-3.022186, 3, -5.740593
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
-3.319054, -3, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, -3, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, -3, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, -3, -6.331737, 0, 1.5, 0.5, 0.5,
-3.319054, -2, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, -2, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, -2, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, -2, -6.331737, 0, 1.5, 0.5, 0.5,
-3.319054, -1, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, -1, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, -1, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, -1, -6.331737, 0, 1.5, 0.5, 0.5,
-3.319054, 0, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, 0, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, 0, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, 0, -6.331737, 0, 1.5, 0.5, 0.5,
-3.319054, 1, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, 1, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, 1, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, 1, -6.331737, 0, 1.5, 0.5, 0.5,
-3.319054, 2, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, 2, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, 2, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, 2, -6.331737, 0, 1.5, 0.5, 0.5,
-3.319054, 3, -6.331737, 0, -0.5, 0.5, 0.5,
-3.319054, 3, -6.331737, 1, -0.5, 0.5, 0.5,
-3.319054, 3, -6.331737, 1, 1.5, 0.5, 0.5,
-3.319054, 3, -6.331737, 0, 1.5, 0.5, 0.5
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
-2.873752, -3.285622, -4,
-2.873752, -3.285622, 6,
-2.873752, -3.285622, -4,
-3.022186, -3.454548, -4,
-2.873752, -3.285622, -2,
-3.022186, -3.454548, -2,
-2.873752, -3.285622, 0,
-3.022186, -3.454548, 0,
-2.873752, -3.285622, 2,
-3.022186, -3.454548, 2,
-2.873752, -3.285622, 4,
-3.022186, -3.454548, 4,
-2.873752, -3.285622, 6,
-3.022186, -3.454548, 6
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
-3.319054, -3.7924, -4, 0, -0.5, 0.5, 0.5,
-3.319054, -3.7924, -4, 1, -0.5, 0.5, 0.5,
-3.319054, -3.7924, -4, 1, 1.5, 0.5, 0.5,
-3.319054, -3.7924, -4, 0, 1.5, 0.5, 0.5,
-3.319054, -3.7924, -2, 0, -0.5, 0.5, 0.5,
-3.319054, -3.7924, -2, 1, -0.5, 0.5, 0.5,
-3.319054, -3.7924, -2, 1, 1.5, 0.5, 0.5,
-3.319054, -3.7924, -2, 0, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 0, 0, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 0, 1, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 0, 1, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 0, 0, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 2, 0, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 2, 1, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 2, 1, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 2, 0, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 4, 0, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 4, 1, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 4, 1, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 4, 0, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 6, 0, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 6, 1, -0.5, 0.5, 0.5,
-3.319054, -3.7924, 6, 1, 1.5, 0.5, 0.5,
-3.319054, -3.7924, 6, 0, 1.5, 0.5, 0.5
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
-2.873752, -3.285622, -5.445022,
-2.873752, 3.471427, -5.445022,
-2.873752, -3.285622, 6.377846,
-2.873752, 3.471427, 6.377846,
-2.873752, -3.285622, -5.445022,
-2.873752, -3.285622, 6.377846,
-2.873752, 3.471427, -5.445022,
-2.873752, 3.471427, 6.377846,
-2.873752, -3.285622, -5.445022,
3.063617, -3.285622, -5.445022,
-2.873752, -3.285622, 6.377846,
3.063617, -3.285622, 6.377846,
-2.873752, 3.471427, -5.445022,
3.063617, 3.471427, -5.445022,
-2.873752, 3.471427, 6.377846,
3.063617, 3.471427, 6.377846,
3.063617, -3.285622, -5.445022,
3.063617, 3.471427, -5.445022,
3.063617, -3.285622, 6.377846,
3.063617, 3.471427, 6.377846,
3.063617, -3.285622, -5.445022,
3.063617, -3.285622, 6.377846,
3.063617, 3.471427, -5.445022,
3.063617, 3.471427, 6.377846
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
var radius = 7.932627;
var distance = 35.29316;
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
mvMatrix.translate( -0.09493268, -0.09290242, -0.4664123 );
mvMatrix.scale( 1.444564, 1.269328, 0.7254511 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29316);
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
methyl_hydrogen_sulf<-read.table("methyl_hydrogen_sulf.xyz", skip=1)
```

```
## Error in read.table("methyl_hydrogen_sulf.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-methyl_hydrogen_sulf$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_hydrogen_sulf' not found
```

```r
y<-methyl_hydrogen_sulf$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_hydrogen_sulf' not found
```

```r
z<-methyl_hydrogen_sulf$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_hydrogen_sulf' not found
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
-2.787285, 0.4513718, 0.8639737, 0, 0, 1, 1, 1,
-2.752502, 0.471321, -1.809815, 1, 0, 0, 1, 1,
-2.685106, 0.7041088, -1.086242, 1, 0, 0, 1, 1,
-2.633254, -0.06886894, -3.000408, 1, 0, 0, 1, 1,
-2.564219, -0.5417714, -1.354037, 1, 0, 0, 1, 1,
-2.52684, 0.2802493, -0.2695211, 1, 0, 0, 1, 1,
-2.475311, 1.564883, -2.138973, 0, 0, 0, 1, 1,
-2.383036, -0.8882818, -1.325854, 0, 0, 0, 1, 1,
-2.294268, 0.1906111, -0.9429843, 0, 0, 0, 1, 1,
-2.240869, -0.2399366, -2.267813, 0, 0, 0, 1, 1,
-2.22608, -2.143023, -5.030063, 0, 0, 0, 1, 1,
-2.210502, -1.284391, -0.6297633, 0, 0, 0, 1, 1,
-2.210058, -0.1325162, -1.876024, 0, 0, 0, 1, 1,
-2.16635, 0.8707228, -1.517389, 1, 1, 1, 1, 1,
-2.166074, -0.3742962, -1.785874, 1, 1, 1, 1, 1,
-2.14092, -0.3853655, -2.945177, 1, 1, 1, 1, 1,
-2.140411, -0.2505825, -2.872908, 1, 1, 1, 1, 1,
-2.108108, 0.6101835, -1.214486, 1, 1, 1, 1, 1,
-2.089676, -0.2998646, -0.4740087, 1, 1, 1, 1, 1,
-2.047985, -0.259499, -2.135323, 1, 1, 1, 1, 1,
-2.035487, -0.8202485, -1.763826, 1, 1, 1, 1, 1,
-2.022289, -0.4328173, -2.534559, 1, 1, 1, 1, 1,
-1.988118, -0.6354245, -1.095225, 1, 1, 1, 1, 1,
-1.976971, 1.294271, -1.117461, 1, 1, 1, 1, 1,
-1.962392, -0.3677728, -3.167948, 1, 1, 1, 1, 1,
-1.956462, -1.182817, -1.351078, 1, 1, 1, 1, 1,
-1.940797, -0.9470634, -1.504516, 1, 1, 1, 1, 1,
-1.920071, 0.4643159, -1.464762, 1, 1, 1, 1, 1,
-1.91223, 0.4760282, 0.2573877, 0, 0, 1, 1, 1,
-1.890725, -0.0002193978, -0.1311741, 1, 0, 0, 1, 1,
-1.877373, -1.470879, -1.590518, 1, 0, 0, 1, 1,
-1.869211, -0.1850297, -1.275183, 1, 0, 0, 1, 1,
-1.851282, -1.208946, -1.514564, 1, 0, 0, 1, 1,
-1.816542, 0.07434952, -2.181546, 1, 0, 0, 1, 1,
-1.794327, 1.748569, -1.475185, 0, 0, 0, 1, 1,
-1.778554, -0.958115, -0.6506922, 0, 0, 0, 1, 1,
-1.750639, -0.7203194, -1.948625, 0, 0, 0, 1, 1,
-1.750382, -0.8835642, -2.096788, 0, 0, 0, 1, 1,
-1.714722, 1.750931, -1.983594, 0, 0, 0, 1, 1,
-1.704292, -0.2495588, -2.393924, 0, 0, 0, 1, 1,
-1.703199, -1.757322, -2.07842, 0, 0, 0, 1, 1,
-1.697088, -2.194807, -3.797862, 1, 1, 1, 1, 1,
-1.694086, 0.9101282, 0.6153955, 1, 1, 1, 1, 1,
-1.682155, -0.08997586, -1.349134, 1, 1, 1, 1, 1,
-1.662961, 0.1019983, -1.995247, 1, 1, 1, 1, 1,
-1.656386, -1.364199, -2.132195, 1, 1, 1, 1, 1,
-1.621009, 0.1236931, -1.514253, 1, 1, 1, 1, 1,
-1.598396, 1.551029, 0.121478, 1, 1, 1, 1, 1,
-1.597299, 0.5439387, -1.300727, 1, 1, 1, 1, 1,
-1.590095, 0.2238639, -1.744042, 1, 1, 1, 1, 1,
-1.587968, 0.6040524, -2.771728, 1, 1, 1, 1, 1,
-1.573328, 0.8831545, -0.661667, 1, 1, 1, 1, 1,
-1.563766, 1.083663, 1.290732, 1, 1, 1, 1, 1,
-1.556198, -0.4972099, -0.00103485, 1, 1, 1, 1, 1,
-1.554453, -0.1087336, -0.03590784, 1, 1, 1, 1, 1,
-1.550479, -0.5227362, -2.362089, 1, 1, 1, 1, 1,
-1.544864, -0.4439199, -2.142348, 0, 0, 1, 1, 1,
-1.537531, 1.583627, -2.507255, 1, 0, 0, 1, 1,
-1.504301, -0.1859957, -0.7974796, 1, 0, 0, 1, 1,
-1.503581, -0.8303862, -2.859395, 1, 0, 0, 1, 1,
-1.499353, 1.251141, 0.05393845, 1, 0, 0, 1, 1,
-1.494498, -0.4280336, -3.419388, 1, 0, 0, 1, 1,
-1.491309, 2.01574, 0.002118106, 0, 0, 0, 1, 1,
-1.490424, 0.1485307, -2.533355, 0, 0, 0, 1, 1,
-1.488335, 0.5752419, -0.1801589, 0, 0, 0, 1, 1,
-1.48151, -1.76774, -5.025198, 0, 0, 0, 1, 1,
-1.477672, -0.4378131, -1.44709, 0, 0, 0, 1, 1,
-1.473422, 2.045119, -0.358052, 0, 0, 0, 1, 1,
-1.470444, 0.9850159, 0.6163058, 0, 0, 0, 1, 1,
-1.462232, 0.6737949, -1.182796, 1, 1, 1, 1, 1,
-1.449477, -2.975939, -2.820705, 1, 1, 1, 1, 1,
-1.444062, -1.165542, -1.287248, 1, 1, 1, 1, 1,
-1.443161, -0.1662026, -0.9437249, 1, 1, 1, 1, 1,
-1.434938, 0.8966502, -1.62281, 1, 1, 1, 1, 1,
-1.426927, -1.760442, -1.877241, 1, 1, 1, 1, 1,
-1.407906, -0.355428, -2.190163, 1, 1, 1, 1, 1,
-1.395938, 0.9933532, -2.496728, 1, 1, 1, 1, 1,
-1.387271, 0.7040691, -1.558066, 1, 1, 1, 1, 1,
-1.376923, -0.6646252, -2.798192, 1, 1, 1, 1, 1,
-1.355999, 1.770062, 0.4235147, 1, 1, 1, 1, 1,
-1.339222, 1.232981, -2.433975, 1, 1, 1, 1, 1,
-1.3378, 0.3973987, -1.156242, 1, 1, 1, 1, 1,
-1.33684, 0.2507977, -2.182688, 1, 1, 1, 1, 1,
-1.336619, -0.3811319, -2.706363, 1, 1, 1, 1, 1,
-1.327388, -0.440126, -1.402658, 0, 0, 1, 1, 1,
-1.308982, 0.5370636, -0.3301411, 1, 0, 0, 1, 1,
-1.30845, 0.4670046, -1.278563, 1, 0, 0, 1, 1,
-1.305614, -0.2906405, -2.058975, 1, 0, 0, 1, 1,
-1.30485, 0.2025248, -1.045787, 1, 0, 0, 1, 1,
-1.295968, -0.1118942, -1.107058, 1, 0, 0, 1, 1,
-1.294834, -1.430161, -1.515149, 0, 0, 0, 1, 1,
-1.291888, 2.092672, 0.3229315, 0, 0, 0, 1, 1,
-1.291077, 0.2475336, -2.253937, 0, 0, 0, 1, 1,
-1.280821, -0.4744779, -3.073979, 0, 0, 0, 1, 1,
-1.279195, 1.825904, -0.177006, 0, 0, 0, 1, 1,
-1.274199, -1.436849, -2.451924, 0, 0, 0, 1, 1,
-1.264068, -1.162286, -3.412639, 0, 0, 0, 1, 1,
-1.263502, 0.8762161, -0.7387529, 1, 1, 1, 1, 1,
-1.253352, -0.9096584, -1.150207, 1, 1, 1, 1, 1,
-1.241271, 0.7911578, -0.534938, 1, 1, 1, 1, 1,
-1.232466, 0.5691448, -0.602015, 1, 1, 1, 1, 1,
-1.225174, 1.139036, -0.5516781, 1, 1, 1, 1, 1,
-1.218295, -1.153692, -3.467497, 1, 1, 1, 1, 1,
-1.212297, 0.06073708, 0.5020165, 1, 1, 1, 1, 1,
-1.204575, -1.089836, -1.678031, 1, 1, 1, 1, 1,
-1.195807, -1.874737, -2.855353, 1, 1, 1, 1, 1,
-1.191479, 0.4519504, -0.7684304, 1, 1, 1, 1, 1,
-1.186963, -0.7353703, -1.934828, 1, 1, 1, 1, 1,
-1.176208, 0.2466203, -1.138853, 1, 1, 1, 1, 1,
-1.169871, 0.2607952, -0.6139249, 1, 1, 1, 1, 1,
-1.167349, 0.8066435, -3.392988, 1, 1, 1, 1, 1,
-1.161455, -1.183116, -3.345232, 1, 1, 1, 1, 1,
-1.156132, -0.09809362, -2.648407, 0, 0, 1, 1, 1,
-1.155672, 1.188021, -1.730744, 1, 0, 0, 1, 1,
-1.148159, 0.2814403, -2.271852, 1, 0, 0, 1, 1,
-1.146789, 0.1894733, -0.6660611, 1, 0, 0, 1, 1,
-1.143661, -1.639759, -1.954872, 1, 0, 0, 1, 1,
-1.138826, -1.791981, -3.431412, 1, 0, 0, 1, 1,
-1.136126, -0.7796584, -1.068, 0, 0, 0, 1, 1,
-1.128518, -0.07198031, -2.269516, 0, 0, 0, 1, 1,
-1.114845, -0.7782379, -0.6351104, 0, 0, 0, 1, 1,
-1.110053, 0.8550941, -1.238617, 0, 0, 0, 1, 1,
-1.108671, -0.4612594, -1.094546, 0, 0, 0, 1, 1,
-1.106783, -0.5508974, -1.880746, 0, 0, 0, 1, 1,
-1.097309, 1.867382, -0.7875873, 0, 0, 0, 1, 1,
-1.095509, -0.3673456, -0.4398279, 1, 1, 1, 1, 1,
-1.081885, -0.668722, -2.55572, 1, 1, 1, 1, 1,
-1.078701, -1.327909, -2.062485, 1, 1, 1, 1, 1,
-1.076083, -0.05191159, -3.077694, 1, 1, 1, 1, 1,
-1.075409, 0.4253392, -0.1795307, 1, 1, 1, 1, 1,
-1.074087, -0.01472084, 0.3098597, 1, 1, 1, 1, 1,
-1.073995, -0.5201169, -3.821019, 1, 1, 1, 1, 1,
-1.069783, -0.1472615, -1.856044, 1, 1, 1, 1, 1,
-1.069099, 0.6320889, 0.4493126, 1, 1, 1, 1, 1,
-1.068104, -1.702206, -2.409309, 1, 1, 1, 1, 1,
-1.066817, 0.3160043, -2.615266, 1, 1, 1, 1, 1,
-1.061959, 0.1825909, -2.398777, 1, 1, 1, 1, 1,
-1.057437, -0.8885857, -1.714574, 1, 1, 1, 1, 1,
-1.056936, 0.3131043, -2.457195, 1, 1, 1, 1, 1,
-1.054799, 1.143959, -0.507997, 1, 1, 1, 1, 1,
-1.041072, -0.04511098, -3.350761, 0, 0, 1, 1, 1,
-1.040971, 0.1657085, -2.220624, 1, 0, 0, 1, 1,
-1.03638, -0.1957097, -2.44805, 1, 0, 0, 1, 1,
-1.029586, -0.9803271, -3.264097, 1, 0, 0, 1, 1,
-1.028155, -0.7848796, -0.4848124, 1, 0, 0, 1, 1,
-1.027337, -1.388332, -2.027903, 1, 0, 0, 1, 1,
-1.015708, -0.836556, -3.960831, 0, 0, 0, 1, 1,
-1.008324, -0.01556305, -0.5261541, 0, 0, 0, 1, 1,
-1.0078, 0.8472332, 0.9507517, 0, 0, 0, 1, 1,
-1.003021, 2.125897, -0.8926971, 0, 0, 0, 1, 1,
-1.001475, 0.03237957, -1.013412, 0, 0, 0, 1, 1,
-1.0014, -1.043287, -2.906926, 0, 0, 0, 1, 1,
-0.9961049, 0.6749527, -1.16046, 0, 0, 0, 1, 1,
-0.991312, -2.470474, -2.226465, 1, 1, 1, 1, 1,
-0.9862974, 1.739708, -1.017804, 1, 1, 1, 1, 1,
-0.9849713, 0.8578414, -1.634033, 1, 1, 1, 1, 1,
-0.9817159, -1.075539, -1.066555, 1, 1, 1, 1, 1,
-0.9794958, 0.527749, -0.7910135, 1, 1, 1, 1, 1,
-0.9773655, 0.4220889, -0.3095472, 1, 1, 1, 1, 1,
-0.9655999, -0.7445468, -3.067326, 1, 1, 1, 1, 1,
-0.9586925, -1.27413, -3.041011, 1, 1, 1, 1, 1,
-0.9532105, -0.2217629, -2.549055, 1, 1, 1, 1, 1,
-0.9531178, -0.4567548, -1.134634, 1, 1, 1, 1, 1,
-0.948027, -0.6642324, -2.007242, 1, 1, 1, 1, 1,
-0.9407424, -0.1266765, -2.569358, 1, 1, 1, 1, 1,
-0.9211296, 0.06457252, -1.115186, 1, 1, 1, 1, 1,
-0.9197212, -0.01375827, -1.123135, 1, 1, 1, 1, 1,
-0.9196034, -0.09641205, -2.359685, 1, 1, 1, 1, 1,
-0.9166113, 1.580941, 0.1264303, 0, 0, 1, 1, 1,
-0.9140742, 1.720288, -0.4348183, 1, 0, 0, 1, 1,
-0.8990498, -0.3566028, -1.366981, 1, 0, 0, 1, 1,
-0.8967207, 0.21634, -0.9716013, 1, 0, 0, 1, 1,
-0.8947682, 0.6446118, -1.619193, 1, 0, 0, 1, 1,
-0.888944, 0.3091542, -2.167391, 1, 0, 0, 1, 1,
-0.8806064, 0.9270128, -1.338354, 0, 0, 0, 1, 1,
-0.8798347, 1.40393, -0.4068241, 0, 0, 0, 1, 1,
-0.8738216, -0.4210128, -2.272106, 0, 0, 0, 1, 1,
-0.8724456, -0.09112284, -0.417717, 0, 0, 0, 1, 1,
-0.8650668, 0.8223589, -1.375309, 0, 0, 0, 1, 1,
-0.8569429, 0.4536126, -1.165624, 0, 0, 0, 1, 1,
-0.8551762, 0.8290762, -0.560231, 0, 0, 0, 1, 1,
-0.853304, -0.1765054, -1.846682, 1, 1, 1, 1, 1,
-0.853044, 0.5090472, 0.487516, 1, 1, 1, 1, 1,
-0.852354, 0.470843, -1.05723, 1, 1, 1, 1, 1,
-0.8514683, -0.776908, -2.312433, 1, 1, 1, 1, 1,
-0.8513008, -1.466361, -2.792231, 1, 1, 1, 1, 1,
-0.849219, -0.4065105, -2.717445, 1, 1, 1, 1, 1,
-0.8451692, 0.2834444, -1.808226, 1, 1, 1, 1, 1,
-0.8420438, 0.8547674, -1.068626, 1, 1, 1, 1, 1,
-0.8354623, 0.1695804, -2.178766, 1, 1, 1, 1, 1,
-0.8331907, -0.4237257, -1.575637, 1, 1, 1, 1, 1,
-0.8295522, 0.9091507, -1.615903, 1, 1, 1, 1, 1,
-0.8290973, 1.1008, -0.2569076, 1, 1, 1, 1, 1,
-0.8259366, -1.227563, -2.164156, 1, 1, 1, 1, 1,
-0.8235778, -1.320543, -3.874918, 1, 1, 1, 1, 1,
-0.8191129, -0.4004838, -3.283629, 1, 1, 1, 1, 1,
-0.8174126, 1.945371, 0.5287511, 0, 0, 1, 1, 1,
-0.8108957, 0.09023418, -1.175851, 1, 0, 0, 1, 1,
-0.8062254, -1.210643, -2.365359, 1, 0, 0, 1, 1,
-0.8008074, 0.1633067, -3.310192, 1, 0, 0, 1, 1,
-0.7998049, -1.119902, -1.921863, 1, 0, 0, 1, 1,
-0.7993811, 0.620904, -2.497705, 1, 0, 0, 1, 1,
-0.7990337, 0.7541827, -1.153461, 0, 0, 0, 1, 1,
-0.7967514, 0.8940535, -1.89814, 0, 0, 0, 1, 1,
-0.7927285, -0.7922007, -1.305334, 0, 0, 0, 1, 1,
-0.7906333, -1.703736, -3.032938, 0, 0, 0, 1, 1,
-0.7894518, 1.673599, -0.2682515, 0, 0, 0, 1, 1,
-0.7746797, -1.343835, -1.845441, 0, 0, 0, 1, 1,
-0.7647595, -0.5233836, -0.9438032, 0, 0, 0, 1, 1,
-0.7625323, -1.229001, -3.530178, 1, 1, 1, 1, 1,
-0.7557748, 1.295176, -1.000839, 1, 1, 1, 1, 1,
-0.7443471, 1.207195, -0.2365202, 1, 1, 1, 1, 1,
-0.7417883, -0.2519126, -1.801977, 1, 1, 1, 1, 1,
-0.7397168, 0.1890295, -2.719347, 1, 1, 1, 1, 1,
-0.733997, -0.7967119, -2.280883, 1, 1, 1, 1, 1,
-0.7334229, -0.8477624, -1.891613, 1, 1, 1, 1, 1,
-0.7327031, -0.8602489, -3.430658, 1, 1, 1, 1, 1,
-0.7267212, -0.4620302, -2.135935, 1, 1, 1, 1, 1,
-0.7198494, 0.3186251, -1.018017, 1, 1, 1, 1, 1,
-0.7185076, -0.1046335, -2.160294, 1, 1, 1, 1, 1,
-0.7178903, 0.1153624, -1.373028, 1, 1, 1, 1, 1,
-0.7148272, 0.3476917, -1.879781, 1, 1, 1, 1, 1,
-0.7084489, -0.2705407, -1.924911, 1, 1, 1, 1, 1,
-0.7068812, -0.429494, -1.076158, 1, 1, 1, 1, 1,
-0.7056471, -0.5465235, -1.197898, 0, 0, 1, 1, 1,
-0.7051479, 0.138943, -1.321779, 1, 0, 0, 1, 1,
-0.7033979, -0.2647178, -2.528638, 1, 0, 0, 1, 1,
-0.7009786, -0.6214374, -3.621136, 1, 0, 0, 1, 1,
-0.6990105, -1.15809, -4.671594, 1, 0, 0, 1, 1,
-0.6985191, 0.4842387, 1.168909, 1, 0, 0, 1, 1,
-0.691834, 0.4398067, -0.5701932, 0, 0, 0, 1, 1,
-0.6887896, 0.9978261, -0.5343733, 0, 0, 0, 1, 1,
-0.6850104, -0.2886342, -1.262503, 0, 0, 0, 1, 1,
-0.6829669, 1.435045, -1.404217, 0, 0, 0, 1, 1,
-0.6797335, -0.5837252, -0.7860398, 0, 0, 0, 1, 1,
-0.67853, 0.8879359, -1.05434, 0, 0, 0, 1, 1,
-0.6738005, 1.487131, 0.0782745, 0, 0, 0, 1, 1,
-0.6714597, 1.056838, 0.7913806, 1, 1, 1, 1, 1,
-0.6701011, 0.7702168, -1.954334, 1, 1, 1, 1, 1,
-0.6654235, 0.01442107, -0.9684601, 1, 1, 1, 1, 1,
-0.6631925, 1.171848, 0.6535764, 1, 1, 1, 1, 1,
-0.6616736, 0.5369033, -0.8219534, 1, 1, 1, 1, 1,
-0.6534536, -0.07398906, -0.7115245, 1, 1, 1, 1, 1,
-0.648265, -0.5387112, -1.83852, 1, 1, 1, 1, 1,
-0.6380143, 0.6448959, 0.1022059, 1, 1, 1, 1, 1,
-0.63572, -1.762718, -3.118604, 1, 1, 1, 1, 1,
-0.6278533, 0.8614472, 0.1943843, 1, 1, 1, 1, 1,
-0.6239041, 0.1508893, -1.576315, 1, 1, 1, 1, 1,
-0.6173949, -0.05385709, -3.700556, 1, 1, 1, 1, 1,
-0.6164529, -0.4799315, -3.539227, 1, 1, 1, 1, 1,
-0.61635, -0.40871, -2.809752, 1, 1, 1, 1, 1,
-0.6131346, -0.2556393, -2.588938, 1, 1, 1, 1, 1,
-0.612039, 0.5457129, -1.179905, 0, 0, 1, 1, 1,
-0.6086686, -1.177222, -2.851516, 1, 0, 0, 1, 1,
-0.6086158, 1.158728, -0.8311358, 1, 0, 0, 1, 1,
-0.6059823, -1.775094, -5.272844, 1, 0, 0, 1, 1,
-0.6053358, 0.6684598, -1.349303, 1, 0, 0, 1, 1,
-0.6047595, 1.036321, -0.4258735, 1, 0, 0, 1, 1,
-0.6037562, 0.5485355, -2.045041, 0, 0, 0, 1, 1,
-0.6012455, -2.323841, -1.873513, 0, 0, 0, 1, 1,
-0.599214, 0.09062144, -1.92447, 0, 0, 0, 1, 1,
-0.597782, -0.07375873, -3.158384, 0, 0, 0, 1, 1,
-0.5927062, -0.4300252, -2.937469, 0, 0, 0, 1, 1,
-0.5915977, -1.661768, -2.413699, 0, 0, 0, 1, 1,
-0.5902103, -1.793386, -3.535098, 0, 0, 0, 1, 1,
-0.585313, 0.551178, 0.4358403, 1, 1, 1, 1, 1,
-0.5819332, -0.1740348, -2.553095, 1, 1, 1, 1, 1,
-0.5801402, 0.7858213, -2.247626, 1, 1, 1, 1, 1,
-0.571236, -0.6672246, -3.136818, 1, 1, 1, 1, 1,
-0.5675317, 0.6476414, 0.1569286, 1, 1, 1, 1, 1,
-0.5577481, 1.240684, -1.196524, 1, 1, 1, 1, 1,
-0.551733, 0.3294256, -1.091733, 1, 1, 1, 1, 1,
-0.5515931, -0.02695989, -2.106105, 1, 1, 1, 1, 1,
-0.5513136, -0.1334152, -3.143958, 1, 1, 1, 1, 1,
-0.5498412, -0.04476809, -0.7041208, 1, 1, 1, 1, 1,
-0.5479684, 0.9619035, -1.340356, 1, 1, 1, 1, 1,
-0.5373049, -0.7285715, -1.744121, 1, 1, 1, 1, 1,
-0.537259, -0.01510093, -2.906319, 1, 1, 1, 1, 1,
-0.5342306, -0.6608832, -2.362531, 1, 1, 1, 1, 1,
-0.5323729, 0.2591501, -1.591011, 1, 1, 1, 1, 1,
-0.5303175, -1.72896, -2.418161, 0, 0, 1, 1, 1,
-0.5278689, 0.2779189, -0.732368, 1, 0, 0, 1, 1,
-0.5276296, 0.4702588, -1.014992, 1, 0, 0, 1, 1,
-0.5240728, 0.2842261, 0.1991666, 1, 0, 0, 1, 1,
-0.5236195, 0.7918567, -1.328692, 1, 0, 0, 1, 1,
-0.5215026, -0.5301229, -2.941909, 1, 0, 0, 1, 1,
-0.5102989, 0.8924805, 0.1494031, 0, 0, 0, 1, 1,
-0.509935, 0.5916911, 0.2578049, 0, 0, 0, 1, 1,
-0.5096177, -0.480912, -1.49862, 0, 0, 0, 1, 1,
-0.507966, 0.7276779, -0.5872002, 0, 0, 0, 1, 1,
-0.5045173, 0.4200859, 0.4554139, 0, 0, 0, 1, 1,
-0.5033834, 0.5922105, -0.6185181, 0, 0, 0, 1, 1,
-0.4947333, 0.4347992, -0.7135866, 0, 0, 0, 1, 1,
-0.49459, -1.541238, -2.629011, 1, 1, 1, 1, 1,
-0.4939628, 1.015736, -0.6242153, 1, 1, 1, 1, 1,
-0.489603, -1.421858, -2.354726, 1, 1, 1, 1, 1,
-0.4864867, -0.1383554, -3.595915, 1, 1, 1, 1, 1,
-0.4853899, 0.1751145, -1.76271, 1, 1, 1, 1, 1,
-0.4834606, -0.1482313, -3.171251, 1, 1, 1, 1, 1,
-0.4829917, -0.1128783, -1.243499, 1, 1, 1, 1, 1,
-0.477383, 0.2284716, -1.50591, 1, 1, 1, 1, 1,
-0.4749539, -0.1482544, -1.198841, 1, 1, 1, 1, 1,
-0.4743867, 0.9261435, 0.4829007, 1, 1, 1, 1, 1,
-0.4692689, -0.1174393, -2.103271, 1, 1, 1, 1, 1,
-0.4687748, -2.493811, -1.613316, 1, 1, 1, 1, 1,
-0.4683322, -1.404455, -2.406246, 1, 1, 1, 1, 1,
-0.4646417, 1.395822, -0.08255487, 1, 1, 1, 1, 1,
-0.4643949, 1.416723, 0.5913974, 1, 1, 1, 1, 1,
-0.4640883, -2.291944, -1.239543, 0, 0, 1, 1, 1,
-0.4630426, -0.9224219, -2.468778, 1, 0, 0, 1, 1,
-0.4614502, 0.9697183, -0.6925421, 1, 0, 0, 1, 1,
-0.4610195, 1.164189, -0.6969258, 1, 0, 0, 1, 1,
-0.4571167, 0.1418727, 0.2672493, 1, 0, 0, 1, 1,
-0.4570067, 2.513088, -0.3636671, 1, 0, 0, 1, 1,
-0.4553362, 0.9179708, 0.7399607, 0, 0, 0, 1, 1,
-0.4536276, 1.591559, 0.3581125, 0, 0, 0, 1, 1,
-0.4521971, 0.09929268, -0.8968403, 0, 0, 0, 1, 1,
-0.4511627, 0.026808, -2.503897, 0, 0, 0, 1, 1,
-0.4414366, -1.200271, -1.711112, 0, 0, 0, 1, 1,
-0.4386061, -1.133145, -0.7413762, 0, 0, 0, 1, 1,
-0.4355954, 0.2610557, -0.1589484, 0, 0, 0, 1, 1,
-0.4345396, 1.322887, -0.078756, 1, 1, 1, 1, 1,
-0.4330654, -0.1661948, -2.062519, 1, 1, 1, 1, 1,
-0.431919, -1.150169, -1.217621, 1, 1, 1, 1, 1,
-0.4252814, 0.6886483, 0.1447771, 1, 1, 1, 1, 1,
-0.4228578, -0.5355878, -2.836173, 1, 1, 1, 1, 1,
-0.418868, -0.5966904, -2.499553, 1, 1, 1, 1, 1,
-0.4176666, -0.3675591, -2.385709, 1, 1, 1, 1, 1,
-0.414947, -2.605562, -2.415236, 1, 1, 1, 1, 1,
-0.4047167, 0.8972555, -1.310644, 1, 1, 1, 1, 1,
-0.4028052, -0.4619026, -1.989652, 1, 1, 1, 1, 1,
-0.4022318, 0.6251254, -1.966022, 1, 1, 1, 1, 1,
-0.3998781, 1.491705, -2.115321, 1, 1, 1, 1, 1,
-0.3994635, -1.158615, -1.26156, 1, 1, 1, 1, 1,
-0.3978845, 0.1196547, -2.809135, 1, 1, 1, 1, 1,
-0.3977158, -0.1867848, -0.367945, 1, 1, 1, 1, 1,
-0.3971159, 0.5270251, -0.4367747, 0, 0, 1, 1, 1,
-0.3942628, 0.5529446, -0.6128507, 1, 0, 0, 1, 1,
-0.3935142, 0.2327655, -1.248359, 1, 0, 0, 1, 1,
-0.3890855, 2.807348, 0.3804354, 1, 0, 0, 1, 1,
-0.3882737, -1.572069, -2.378015, 1, 0, 0, 1, 1,
-0.3858766, -0.07222121, -0.4876421, 1, 0, 0, 1, 1,
-0.3850085, 0.8765144, 0.5962316, 0, 0, 0, 1, 1,
-0.3845343, 0.2329486, -0.8048605, 0, 0, 0, 1, 1,
-0.3762389, 1.099369, -0.3270208, 0, 0, 0, 1, 1,
-0.3747205, -2.065654, -3.620402, 0, 0, 0, 1, 1,
-0.3704979, -0.5181292, -2.376559, 0, 0, 0, 1, 1,
-0.3702638, -0.1637814, -2.184197, 0, 0, 0, 1, 1,
-0.3666947, -0.2291491, -2.032752, 0, 0, 0, 1, 1,
-0.3649804, 0.5434001, 0.05432219, 1, 1, 1, 1, 1,
-0.3637899, -0.4631153, -3.748032, 1, 1, 1, 1, 1,
-0.3627253, -0.1896766, -2.06283, 1, 1, 1, 1, 1,
-0.3582648, 0.01358453, -2.984369, 1, 1, 1, 1, 1,
-0.3539989, 1.003348, 0.7271757, 1, 1, 1, 1, 1,
-0.3525575, -1.610932, -3.680582, 1, 1, 1, 1, 1,
-0.3503539, -0.3241763, -3.703233, 1, 1, 1, 1, 1,
-0.3501416, 0.01260346, -2.865792, 1, 1, 1, 1, 1,
-0.3492624, 0.2244081, -1.049016, 1, 1, 1, 1, 1,
-0.3457637, 0.5651282, -0.2649843, 1, 1, 1, 1, 1,
-0.3447617, 0.9803886, -0.408195, 1, 1, 1, 1, 1,
-0.3438326, 1.231134, -1.678421, 1, 1, 1, 1, 1,
-0.3424224, 0.1470218, -2.1368, 1, 1, 1, 1, 1,
-0.3364857, -2.000411, -2.558108, 1, 1, 1, 1, 1,
-0.3333631, -0.4347865, -2.529963, 1, 1, 1, 1, 1,
-0.3298807, 0.5956721, -0.6055639, 0, 0, 1, 1, 1,
-0.3296457, 1.188878, -0.03744732, 1, 0, 0, 1, 1,
-0.3154962, 0.8994641, 0.7240606, 1, 0, 0, 1, 1,
-0.3152007, 0.8641073, -0.9766501, 1, 0, 0, 1, 1,
-0.3052634, -0.4884093, -2.135665, 1, 0, 0, 1, 1,
-0.304446, -1.737545, -3.271071, 1, 0, 0, 1, 1,
-0.3020644, -0.5981308, -2.185494, 0, 0, 0, 1, 1,
-0.3008482, 0.6893572, 3.211293, 0, 0, 0, 1, 1,
-0.3003826, -0.01257002, -1.28874, 0, 0, 0, 1, 1,
-0.2998258, -0.3259467, -2.234144, 0, 0, 0, 1, 1,
-0.299688, 0.1116396, -0.4753085, 0, 0, 0, 1, 1,
-0.2972318, 0.0687656, -3.053521, 0, 0, 0, 1, 1,
-0.2865532, 2.054243, -0.4482801, 0, 0, 0, 1, 1,
-0.2848116, -0.3303855, -2.347635, 1, 1, 1, 1, 1,
-0.2816482, 0.007335217, -1.000489, 1, 1, 1, 1, 1,
-0.2815773, 0.3782877, -0.3382224, 1, 1, 1, 1, 1,
-0.2785991, 2.140473, 0.2737541, 1, 1, 1, 1, 1,
-0.277067, 0.3561954, 0.01527385, 1, 1, 1, 1, 1,
-0.2751259, -1.286954, -1.745764, 1, 1, 1, 1, 1,
-0.2739518, -0.1875371, -3.62891, 1, 1, 1, 1, 1,
-0.2721831, -1.42744, -2.871697, 1, 1, 1, 1, 1,
-0.2698881, 0.1841929, -2.156794, 1, 1, 1, 1, 1,
-0.2665183, 0.07458009, 0.9489579, 1, 1, 1, 1, 1,
-0.2664586, -0.3187982, -3.030496, 1, 1, 1, 1, 1,
-0.2634468, 0.1616816, -0.1299817, 1, 1, 1, 1, 1,
-0.2630533, 1.207255, -0.2917409, 1, 1, 1, 1, 1,
-0.2600293, 0.2229923, -0.8632184, 1, 1, 1, 1, 1,
-0.2590015, -0.2286298, -3.404457, 1, 1, 1, 1, 1,
-0.2578563, -0.009385488, -0.8923328, 0, 0, 1, 1, 1,
-0.255937, 1.115496, 0.902303, 1, 0, 0, 1, 1,
-0.2536624, 0.4810411, -1.007593, 1, 0, 0, 1, 1,
-0.2534645, -1.619562, -3.828445, 1, 0, 0, 1, 1,
-0.2497875, 1.190115, -1.987778, 1, 0, 0, 1, 1,
-0.2485165, 0.8740137, 0.7635122, 1, 0, 0, 1, 1,
-0.2483906, -0.06711299, -1.964833, 0, 0, 0, 1, 1,
-0.24293, 0.1230446, -1.446332, 0, 0, 0, 1, 1,
-0.2412845, 1.146918, -0.6565986, 0, 0, 0, 1, 1,
-0.2385894, -0.9277544, -2.468219, 0, 0, 0, 1, 1,
-0.2366072, -0.4693406, -3.488881, 0, 0, 0, 1, 1,
-0.234299, 0.1129347, 0.007817003, 0, 0, 0, 1, 1,
-0.23319, 0.0212337, -0.8251001, 0, 0, 0, 1, 1,
-0.2324563, 0.4567499, 0.7903767, 1, 1, 1, 1, 1,
-0.2311473, 0.8943972, -0.03940596, 1, 1, 1, 1, 1,
-0.228617, 0.8546383, -2.08967, 1, 1, 1, 1, 1,
-0.2250066, 1.547272, 0.5757809, 1, 1, 1, 1, 1,
-0.2235398, 1.099925, 0.6750958, 1, 1, 1, 1, 1,
-0.2210478, -1.905111, -3.459894, 1, 1, 1, 1, 1,
-0.2204332, -1.047327, -2.644461, 1, 1, 1, 1, 1,
-0.2188604, 0.8654651, 0.7156905, 1, 1, 1, 1, 1,
-0.2152556, 1.743415, 2.817694, 1, 1, 1, 1, 1,
-0.2134103, -0.7831593, -1.941845, 1, 1, 1, 1, 1,
-0.2087285, 0.4861389, -1.522498, 1, 1, 1, 1, 1,
-0.207559, -0.1643135, -2.181204, 1, 1, 1, 1, 1,
-0.2032704, 1.30892, 0.05175162, 1, 1, 1, 1, 1,
-0.1997284, 0.7826861, 0.6834666, 1, 1, 1, 1, 1,
-0.1987336, 0.4745976, -0.532304, 1, 1, 1, 1, 1,
-0.1983886, 0.544987, -0.2832724, 0, 0, 1, 1, 1,
-0.1971189, 0.321396, -1.461998, 1, 0, 0, 1, 1,
-0.1970541, 0.2199619, -0.7094632, 1, 0, 0, 1, 1,
-0.1833074, -0.9927585, -4.58483, 1, 0, 0, 1, 1,
-0.1799195, 1.542883, 0.5454012, 1, 0, 0, 1, 1,
-0.1784873, 0.07664602, 0.01785751, 1, 0, 0, 1, 1,
-0.1775712, -0.8413532, -1.701349, 0, 0, 0, 1, 1,
-0.1756147, -0.3996349, -2.12393, 0, 0, 0, 1, 1,
-0.1734087, -1.002628, -3.449823, 0, 0, 0, 1, 1,
-0.1657873, 0.7304382, -1.123865, 0, 0, 0, 1, 1,
-0.1644392, -1.730441, -2.712584, 0, 0, 0, 1, 1,
-0.1623078, 0.6234388, -0.4020516, 0, 0, 0, 1, 1,
-0.1614766, 0.459832, 0.4488532, 0, 0, 0, 1, 1,
-0.1611448, -0.5911216, -2.148299, 1, 1, 1, 1, 1,
-0.1599088, -0.7560554, -3.986884, 1, 1, 1, 1, 1,
-0.1594961, 0.4470265, 0.1334008, 1, 1, 1, 1, 1,
-0.1591634, 0.3359465, -0.2545713, 1, 1, 1, 1, 1,
-0.1576779, -0.1727224, -3.40702, 1, 1, 1, 1, 1,
-0.1571586, 1.243562, -2.382052, 1, 1, 1, 1, 1,
-0.150433, 1.082734, 0.8888405, 1, 1, 1, 1, 1,
-0.1497209, -0.01396944, -1.99912, 1, 1, 1, 1, 1,
-0.1461049, -1.343428, -1.94298, 1, 1, 1, 1, 1,
-0.1427205, -0.1118121, -2.68087, 1, 1, 1, 1, 1,
-0.1420987, -0.9661111, -4.358833, 1, 1, 1, 1, 1,
-0.1412605, -1.236138, -2.577146, 1, 1, 1, 1, 1,
-0.1340394, -1.980431, -3.598663, 1, 1, 1, 1, 1,
-0.1334481, 0.5414519, 0.8572323, 1, 1, 1, 1, 1,
-0.1304848, 0.5956516, 1.125556, 1, 1, 1, 1, 1,
-0.1302813, -0.4484494, -1.58018, 0, 0, 1, 1, 1,
-0.1273016, 0.2756141, -0.5681576, 1, 0, 0, 1, 1,
-0.1269688, 1.726968, 0.2035364, 1, 0, 0, 1, 1,
-0.1210832, -0.003139647, -3.026561, 1, 0, 0, 1, 1,
-0.1173676, -0.1255558, -2.313768, 1, 0, 0, 1, 1,
-0.1141053, -0.1960166, -3.013205, 1, 0, 0, 1, 1,
-0.1022399, 1.440098, 0.2314665, 0, 0, 0, 1, 1,
-0.09972793, 1.793363, -1.13205, 0, 0, 0, 1, 1,
-0.09312156, -1.804634, -1.180963, 0, 0, 0, 1, 1,
-0.08519837, -0.9971855, -1.870653, 0, 0, 0, 1, 1,
-0.08463671, 0.9491597, 0.6679682, 0, 0, 0, 1, 1,
-0.0839179, 0.3018648, -0.3113128, 0, 0, 0, 1, 1,
-0.07907553, -0.3815055, -3.73686, 0, 0, 0, 1, 1,
-0.07698027, -0.6234061, -2.538712, 1, 1, 1, 1, 1,
-0.06943081, 0.1876812, -0.1394974, 1, 1, 1, 1, 1,
-0.06863246, 1.040425, -1.382213, 1, 1, 1, 1, 1,
-0.06815657, -0.3482653, -3.637709, 1, 1, 1, 1, 1,
-0.0681287, 0.6835008, -0.038934, 1, 1, 1, 1, 1,
-0.06733964, 0.2442832, -1.213911, 1, 1, 1, 1, 1,
-0.06570359, -0.03006367, -1.512173, 1, 1, 1, 1, 1,
-0.063114, 1.59949, 0.9682854, 1, 1, 1, 1, 1,
-0.06292126, -1.110393, -2.352631, 1, 1, 1, 1, 1,
-0.05893856, -1.954593, -2.586834, 1, 1, 1, 1, 1,
-0.05729135, -0.8868683, -3.089569, 1, 1, 1, 1, 1,
-0.04965923, -0.6103323, -1.980332, 1, 1, 1, 1, 1,
-0.04382212, 1.798381, -0.9326013, 1, 1, 1, 1, 1,
-0.04317683, 0.3242154, 0.1980297, 1, 1, 1, 1, 1,
-0.03870104, -0.8709837, -2.965854, 1, 1, 1, 1, 1,
-0.03647558, 0.3732502, -0.1475761, 0, 0, 1, 1, 1,
-0.03630232, 0.9205534, 0.8212682, 1, 0, 0, 1, 1,
-0.03257967, 0.7014445, -1.515258, 1, 0, 0, 1, 1,
-0.03192897, -0.2887479, -3.942069, 1, 0, 0, 1, 1,
-0.02904005, 2.934156, -0.8942222, 1, 0, 0, 1, 1,
-0.01517436, 0.6248615, -1.22644, 1, 0, 0, 1, 1,
-0.01276433, 1.135012, -0.04465324, 0, 0, 0, 1, 1,
-0.01081306, -1.242021, -2.873394, 0, 0, 0, 1, 1,
-0.01074858, -1.437618, -3.169166, 0, 0, 0, 1, 1,
-0.01061728, -0.9107033, -2.509236, 0, 0, 0, 1, 1,
-0.006435246, -0.3201444, -4.819936, 0, 0, 0, 1, 1,
-0.001700463, 0.939126, 0.3780288, 0, 0, 0, 1, 1,
-0.001118663, -0.1210001, -2.595134, 0, 0, 0, 1, 1,
0.002225011, -0.9088852, 3.434618, 1, 1, 1, 1, 1,
0.004616184, 0.5727391, 0.8327124, 1, 1, 1, 1, 1,
0.004989438, -1.985264, 2.556789, 1, 1, 1, 1, 1,
0.01111222, 0.3309983, -0.05604488, 1, 1, 1, 1, 1,
0.01392473, 0.3897003, -0.6410149, 1, 1, 1, 1, 1,
0.01659132, -0.4154708, 3.880423, 1, 1, 1, 1, 1,
0.0205013, -0.06903135, 2.893347, 1, 1, 1, 1, 1,
0.02345899, -0.7302597, 0.02907487, 1, 1, 1, 1, 1,
0.02476097, -0.3467081, 3.066421, 1, 1, 1, 1, 1,
0.02514453, -0.7677981, 2.857922, 1, 1, 1, 1, 1,
0.02537631, -1.10867, 3.736667, 1, 1, 1, 1, 1,
0.02721986, -0.5900376, 2.05497, 1, 1, 1, 1, 1,
0.03093977, -0.4370901, 2.537241, 1, 1, 1, 1, 1,
0.0344957, -0.1825265, 2.462471, 1, 1, 1, 1, 1,
0.03898783, -1.450575, 4.291115, 1, 1, 1, 1, 1,
0.04662486, -0.5542701, 1.974318, 0, 0, 1, 1, 1,
0.05035399, -0.9520835, 2.23605, 1, 0, 0, 1, 1,
0.05092683, 0.7802673, 0.9925606, 1, 0, 0, 1, 1,
0.05324275, 0.6982667, 1.899555, 1, 0, 0, 1, 1,
0.05757173, -0.5035974, 2.730562, 1, 0, 0, 1, 1,
0.06379889, 1.141414, 0.8583549, 1, 0, 0, 1, 1,
0.0662135, 0.03374055, 0.9406676, 0, 0, 0, 1, 1,
0.06624368, -1.205423, 2.919044, 0, 0, 0, 1, 1,
0.06640855, 0.4252813, 1.187658, 0, 0, 0, 1, 1,
0.06929821, 0.3763693, -0.3257332, 0, 0, 0, 1, 1,
0.07092916, 0.2851138, 0.9180915, 0, 0, 0, 1, 1,
0.07234317, -1.239592, 2.656926, 0, 0, 0, 1, 1,
0.08215725, 0.9880142, 1.413467, 0, 0, 0, 1, 1,
0.09258956, -0.6589702, 3.680844, 1, 1, 1, 1, 1,
0.09618536, 0.9037596, 1.852647, 1, 1, 1, 1, 1,
0.1004479, 0.7960404, 0.2031198, 1, 1, 1, 1, 1,
0.1020897, -1.392904, 2.851998, 1, 1, 1, 1, 1,
0.107154, -0.4328872, 3.322532, 1, 1, 1, 1, 1,
0.1083958, 0.7070101, -1.835809, 1, 1, 1, 1, 1,
0.1139705, -0.5413224, 2.626734, 1, 1, 1, 1, 1,
0.116134, -1.353941, 2.998804, 1, 1, 1, 1, 1,
0.1175615, 1.788836, -0.3327372, 1, 1, 1, 1, 1,
0.1183343, 0.5889911, 0.9473569, 1, 1, 1, 1, 1,
0.1197256, -0.3962417, 2.81092, 1, 1, 1, 1, 1,
0.1216043, -1.042038, 5.310508, 1, 1, 1, 1, 1,
0.1225352, -0.4405509, 5.307605, 1, 1, 1, 1, 1,
0.125425, 0.01319533, 2.95252, 1, 1, 1, 1, 1,
0.1272785, 1.176562, -0.8215064, 1, 1, 1, 1, 1,
0.128145, 1.261574, 0.7045186, 0, 0, 1, 1, 1,
0.1317554, 2.07238, -1.977381, 1, 0, 0, 1, 1,
0.1335301, -1.143156, 3.777187, 1, 0, 0, 1, 1,
0.1368376, -0.3899607, 3.364487, 1, 0, 0, 1, 1,
0.1399509, -1.301028, 2.767567, 1, 0, 0, 1, 1,
0.1399677, -0.9161096, 3.73149, 1, 0, 0, 1, 1,
0.1410832, -0.4975868, 2.395517, 0, 0, 0, 1, 1,
0.1432907, 0.05045374, 2.765007, 0, 0, 0, 1, 1,
0.1472673, -0.08237647, 1.651121, 0, 0, 0, 1, 1,
0.1482575, 0.9693606, 1.571625, 0, 0, 0, 1, 1,
0.1558589, 2.430326, -0.8809738, 0, 0, 0, 1, 1,
0.1638689, -1.421284, 3.468254, 0, 0, 0, 1, 1,
0.1692719, 0.9110352, 1.100826, 0, 0, 0, 1, 1,
0.1725118, 1.708389, -1.068693, 1, 1, 1, 1, 1,
0.175934, -1.669409, 2.186635, 1, 1, 1, 1, 1,
0.1837636, 1.369998, -1.015766, 1, 1, 1, 1, 1,
0.1840512, -1.304013, 4.949574, 1, 1, 1, 1, 1,
0.1873173, -0.2192021, 2.08097, 1, 1, 1, 1, 1,
0.1895496, -0.9251251, 2.079201, 1, 1, 1, 1, 1,
0.1896407, 0.04849575, 1.312331, 1, 1, 1, 1, 1,
0.196034, 2.592752, 1.416377, 1, 1, 1, 1, 1,
0.2017698, 0.6759683, -0.4325024, 1, 1, 1, 1, 1,
0.2019546, 0.1768513, 2.438605, 1, 1, 1, 1, 1,
0.2027134, 0.2552861, -1.196136, 1, 1, 1, 1, 1,
0.2035781, -0.9282601, 2.532748, 1, 1, 1, 1, 1,
0.2058044, -0.1923545, 3.375178, 1, 1, 1, 1, 1,
0.2080404, -0.6826987, 3.610147, 1, 1, 1, 1, 1,
0.208307, 0.5898393, -0.3534058, 1, 1, 1, 1, 1,
0.2105536, 2.118513, 0.03588441, 0, 0, 1, 1, 1,
0.2117728, -1.1699, 3.71419, 1, 0, 0, 1, 1,
0.214745, -0.1973658, 2.828241, 1, 0, 0, 1, 1,
0.2156226, -0.6756368, 3.928276, 1, 0, 0, 1, 1,
0.2163189, -1.284378, 2.636307, 1, 0, 0, 1, 1,
0.2181619, -0.8449792, 2.184444, 1, 0, 0, 1, 1,
0.2188103, -0.7910828, 4.191218, 0, 0, 0, 1, 1,
0.2192779, -0.3105186, 2.884939, 0, 0, 0, 1, 1,
0.221083, -1.555373, 2.474427, 0, 0, 0, 1, 1,
0.2212863, 0.3840097, 0.9532806, 0, 0, 0, 1, 1,
0.2215721, -0.00541779, 1.495002, 0, 0, 0, 1, 1,
0.2222271, 0.484925, -1.288652, 0, 0, 0, 1, 1,
0.2225098, -1.59515, 2.831591, 0, 0, 0, 1, 1,
0.2227629, -1.170786, 3.389301, 1, 1, 1, 1, 1,
0.2235071, -0.01424926, 2.510952, 1, 1, 1, 1, 1,
0.2309716, 0.659, 0.3607636, 1, 1, 1, 1, 1,
0.2331726, 0.9007048, 3.301119, 1, 1, 1, 1, 1,
0.2341515, 0.4768061, 0.3213429, 1, 1, 1, 1, 1,
0.2391935, -1.47873, 3.236952, 1, 1, 1, 1, 1,
0.2414976, 0.5663478, 0.4522549, 1, 1, 1, 1, 1,
0.2470823, 0.3570044, -0.8991085, 1, 1, 1, 1, 1,
0.248529, -1.745242, 0.868692, 1, 1, 1, 1, 1,
0.2515597, 0.5033556, 2.727235, 1, 1, 1, 1, 1,
0.253151, -1.202801, 2.64217, 1, 1, 1, 1, 1,
0.2532985, -0.05930001, 0.6051378, 1, 1, 1, 1, 1,
0.254221, -2.08719, 2.867973, 1, 1, 1, 1, 1,
0.2553385, -2.094063, 3.441561, 1, 1, 1, 1, 1,
0.2567023, 0.556035, 1.05955, 1, 1, 1, 1, 1,
0.2594224, -0.01586869, 0.8934089, 0, 0, 1, 1, 1,
0.2633567, 0.2576855, 1.40756, 1, 0, 0, 1, 1,
0.2645456, 0.272995, -0.8486663, 1, 0, 0, 1, 1,
0.2650685, -1.589364, 4.909791, 1, 0, 0, 1, 1,
0.2663349, -0.1628836, 2.259852, 1, 0, 0, 1, 1,
0.2667837, -1.006681, 3.032845, 1, 0, 0, 1, 1,
0.2728071, -0.4813412, 3.375558, 0, 0, 0, 1, 1,
0.2745428, 2.638003, -0.718663, 0, 0, 0, 1, 1,
0.2757154, 1.185579, 1.213634, 0, 0, 0, 1, 1,
0.2800265, 2.324065, 0.8487941, 0, 0, 0, 1, 1,
0.2801814, -0.6501122, 3.348503, 0, 0, 0, 1, 1,
0.2824, 1.291977, -0.4015686, 0, 0, 0, 1, 1,
0.2835724, 0.3244679, 0.9931134, 0, 0, 0, 1, 1,
0.2848827, 0.7487771, -1.033008, 1, 1, 1, 1, 1,
0.2862914, -1.768114, 3.38543, 1, 1, 1, 1, 1,
0.2872666, 0.9246083, 0.0190187, 1, 1, 1, 1, 1,
0.2880592, 0.773103, 1.955073, 1, 1, 1, 1, 1,
0.2890859, -1.268751, 3.58016, 1, 1, 1, 1, 1,
0.2895172, -0.5669246, 3.458109, 1, 1, 1, 1, 1,
0.2919003, -0.07227425, 1.729638, 1, 1, 1, 1, 1,
0.29564, -2.156979, 1.430512, 1, 1, 1, 1, 1,
0.2962545, -0.4696416, 2.312436, 1, 1, 1, 1, 1,
0.2977147, 0.822022, 0.9268895, 1, 1, 1, 1, 1,
0.2989762, -1.293368, 3.181463, 1, 1, 1, 1, 1,
0.2990068, -0.6834796, 3.346391, 1, 1, 1, 1, 1,
0.3003657, -0.9790958, 3.149559, 1, 1, 1, 1, 1,
0.3014081, 0.3408917, 0.8096797, 1, 1, 1, 1, 1,
0.3045402, -0.2942964, 0.9173638, 1, 1, 1, 1, 1,
0.3047074, -0.4469542, 2.429995, 0, 0, 1, 1, 1,
0.3075879, -0.461505, 1.985082, 1, 0, 0, 1, 1,
0.3083386, -2.004881, 2.087488, 1, 0, 0, 1, 1,
0.3084374, 2.069033, -0.02313751, 1, 0, 0, 1, 1,
0.3111144, 2.122032, -0.4805288, 1, 0, 0, 1, 1,
0.3146784, 0.7802291, 0.6557705, 1, 0, 0, 1, 1,
0.3168756, -0.8940103, 2.629878, 0, 0, 0, 1, 1,
0.3188346, 0.2981987, -0.609711, 0, 0, 0, 1, 1,
0.3240496, -0.7053109, 1.81029, 0, 0, 0, 1, 1,
0.3383835, -0.7466837, 3.988155, 0, 0, 0, 1, 1,
0.3408241, 0.4869503, 1.331752, 0, 0, 0, 1, 1,
0.3454456, 1.273425, 0.1155387, 0, 0, 0, 1, 1,
0.3464817, 1.310783, 0.417647, 0, 0, 0, 1, 1,
0.3515023, 0.8052843, -0.8227898, 1, 1, 1, 1, 1,
0.3563452, -1.371335, 0.953274, 1, 1, 1, 1, 1,
0.3580182, -0.3737498, 3.814939, 1, 1, 1, 1, 1,
0.3600325, -0.6577934, 0.5750686, 1, 1, 1, 1, 1,
0.3606174, -1.399024, 3.783795, 1, 1, 1, 1, 1,
0.3623246, 1.443472, -0.415828, 1, 1, 1, 1, 1,
0.3633696, 0.7463382, -0.07995538, 1, 1, 1, 1, 1,
0.3668141, 1.221403, 0.7179282, 1, 1, 1, 1, 1,
0.3668412, 0.2237347, 2.191836, 1, 1, 1, 1, 1,
0.3681847, 1.466138, -0.302931, 1, 1, 1, 1, 1,
0.3683425, -2.468294, 4.629003, 1, 1, 1, 1, 1,
0.3690431, 0.6557328, 1.16539, 1, 1, 1, 1, 1,
0.3712479, 0.8934923, 0.5944329, 1, 1, 1, 1, 1,
0.3725185, 0.3916952, -0.3361191, 1, 1, 1, 1, 1,
0.3729705, 0.237853, 0.7042323, 1, 1, 1, 1, 1,
0.3748004, -0.8855636, 2.170561, 0, 0, 1, 1, 1,
0.3768681, -0.3667419, 1.388555, 1, 0, 0, 1, 1,
0.3794588, -0.110879, 2.650317, 1, 0, 0, 1, 1,
0.379495, 2.233324, -1.150952, 1, 0, 0, 1, 1,
0.3806898, -2.366864, 2.44413, 1, 0, 0, 1, 1,
0.3853626, -0.2207857, 3.690759, 1, 0, 0, 1, 1,
0.390926, -0.8746776, 2.581729, 0, 0, 0, 1, 1,
0.3969715, 1.00179, 1.795889, 0, 0, 0, 1, 1,
0.3988108, 1.273291, -0.06625989, 0, 0, 0, 1, 1,
0.4011866, 0.6914174, 0.6212825, 0, 0, 0, 1, 1,
0.4023602, -1.258291, 0.0651883, 0, 0, 0, 1, 1,
0.4048162, 0.6726961, -1.083592, 0, 0, 0, 1, 1,
0.4058366, -0.9369386, 4.022699, 0, 0, 0, 1, 1,
0.4064507, 1.541372, 1.713717, 1, 1, 1, 1, 1,
0.4106966, 1.487999, 0.04889172, 1, 1, 1, 1, 1,
0.4138827, 0.210564, 1.374273, 1, 1, 1, 1, 1,
0.4162405, 1.251274, 0.9751201, 1, 1, 1, 1, 1,
0.4265981, 0.4248053, -1.527233, 1, 1, 1, 1, 1,
0.4295494, 1.935076, 1.101027, 1, 1, 1, 1, 1,
0.4363885, -0.2214746, 2.541489, 1, 1, 1, 1, 1,
0.4451774, -0.6512371, 2.479823, 1, 1, 1, 1, 1,
0.4477883, 0.4649071, 1.540586, 1, 1, 1, 1, 1,
0.4504428, 0.1296145, 1.647569, 1, 1, 1, 1, 1,
0.4554044, 0.1324753, 0.2313044, 1, 1, 1, 1, 1,
0.4563427, -0.7910133, 3.340034, 1, 1, 1, 1, 1,
0.4575402, -0.5147353, 2.861092, 1, 1, 1, 1, 1,
0.4591266, 0.153542, 2.517585, 1, 1, 1, 1, 1,
0.4591445, -1.438668, 2.682917, 1, 1, 1, 1, 1,
0.4623684, 0.5913952, 3.205009, 0, 0, 1, 1, 1,
0.4625697, 0.03464502, 0.9608685, 1, 0, 0, 1, 1,
0.4626867, -1.321725, 3.662341, 1, 0, 0, 1, 1,
0.4634244, 1.581968, 0.03605586, 1, 0, 0, 1, 1,
0.4650615, -0.5485243, 2.589435, 1, 0, 0, 1, 1,
0.4670306, -0.9590057, 3.626325, 1, 0, 0, 1, 1,
0.4683483, 1.029248, 0.3860524, 0, 0, 0, 1, 1,
0.4720647, 0.6721866, 2.698792, 0, 0, 0, 1, 1,
0.4760438, -0.8308735, 2.45645, 0, 0, 0, 1, 1,
0.4770178, -0.1059472, 0.9735907, 0, 0, 0, 1, 1,
0.4814635, -0.04229426, 1.760727, 0, 0, 0, 1, 1,
0.4817831, -0.8569984, 2.036916, 0, 0, 0, 1, 1,
0.4849571, -1.308099, 2.813482, 0, 0, 0, 1, 1,
0.4858618, -1.392372, 3.081624, 1, 1, 1, 1, 1,
0.4876835, 1.077436, 0.4913461, 1, 1, 1, 1, 1,
0.4892585, -2.321045, 1.765824, 1, 1, 1, 1, 1,
0.4935293, -0.2258433, 1.951897, 1, 1, 1, 1, 1,
0.4977568, -1.101679, 2.651562, 1, 1, 1, 1, 1,
0.500019, -0.5732855, 4.704628, 1, 1, 1, 1, 1,
0.5079163, 0.8484268, 0.2875265, 1, 1, 1, 1, 1,
0.5099839, -0.1111559, 1.17504, 1, 1, 1, 1, 1,
0.5149385, -1.510182, 3.621385, 1, 1, 1, 1, 1,
0.5187923, -0.8395385, 3.557503, 1, 1, 1, 1, 1,
0.5192606, -0.1320557, 1.424541, 1, 1, 1, 1, 1,
0.52006, 0.2608595, 2.312045, 1, 1, 1, 1, 1,
0.525822, 1.234826, -0.1599298, 1, 1, 1, 1, 1,
0.5297601, -0.1271191, 1.776794, 1, 1, 1, 1, 1,
0.5298408, -0.6973093, 2.346671, 1, 1, 1, 1, 1,
0.5324058, -0.4459434, 2.115393, 0, 0, 1, 1, 1,
0.5357957, 1.341402, -0.5283511, 1, 0, 0, 1, 1,
0.5363235, 0.5086941, -0.2187088, 1, 0, 0, 1, 1,
0.5375015, 2.008577, -0.02444377, 1, 0, 0, 1, 1,
0.5410608, 0.841141, 0.8090296, 1, 0, 0, 1, 1,
0.5415125, 0.3116535, 0.4039849, 1, 0, 0, 1, 1,
0.5434052, -0.3603438, 2.383919, 0, 0, 0, 1, 1,
0.5455572, 0.6062177, 0.4182341, 0, 0, 0, 1, 1,
0.5504185, -1.03429, 2.491166, 0, 0, 0, 1, 1,
0.5538378, -2.32842, 2.722497, 0, 0, 0, 1, 1,
0.5581646, -0.157033, 3.294616, 0, 0, 0, 1, 1,
0.5696405, -0.3891925, 0.1085344, 0, 0, 0, 1, 1,
0.5754545, 1.036283, -0.5718217, 0, 0, 0, 1, 1,
0.5759555, 0.01968037, 2.080623, 1, 1, 1, 1, 1,
0.5773634, 1.491812, 0.996646, 1, 1, 1, 1, 1,
0.5780876, -1.534498, 3.869636, 1, 1, 1, 1, 1,
0.578707, 0.4552535, 0.4115462, 1, 1, 1, 1, 1,
0.5791065, 0.8027358, 0.3572041, 1, 1, 1, 1, 1,
0.5795451, 0.1635382, 1.382322, 1, 1, 1, 1, 1,
0.5894526, 0.400876, 2.209888, 1, 1, 1, 1, 1,
0.5938823, -0.4505469, 2.328499, 1, 1, 1, 1, 1,
0.5990788, 0.1770447, 1.594776, 1, 1, 1, 1, 1,
0.6086665, -1.576946, 3.941565, 1, 1, 1, 1, 1,
0.6087685, -0.1839333, 1.280565, 1, 1, 1, 1, 1,
0.6153702, -1.680601, 2.602216, 1, 1, 1, 1, 1,
0.6165187, -2.53529, 2.514436, 1, 1, 1, 1, 1,
0.6184489, -0.02668761, 1.590847, 1, 1, 1, 1, 1,
0.6202816, -0.834387, 3.090702, 1, 1, 1, 1, 1,
0.6305782, -0.1194974, 1.994715, 0, 0, 1, 1, 1,
0.6313165, -0.3981528, 3.384962, 1, 0, 0, 1, 1,
0.6313229, 0.1067468, 1.359725, 1, 0, 0, 1, 1,
0.6328049, -0.3678732, 1.613085, 1, 0, 0, 1, 1,
0.6433516, -0.1755104, 3.153069, 1, 0, 0, 1, 1,
0.6444859, 0.7576722, 2.875566, 1, 0, 0, 1, 1,
0.6494467, -0.3026233, 2.818636, 0, 0, 0, 1, 1,
0.6573489, 1.381067, -0.7480066, 0, 0, 0, 1, 1,
0.6581426, -0.560935, 1.428448, 0, 0, 0, 1, 1,
0.6592894, 0.2601582, 0.8275562, 0, 0, 0, 1, 1,
0.6601961, -1.708328, 2.237929, 0, 0, 0, 1, 1,
0.6611639, 0.03257919, 1.780006, 0, 0, 0, 1, 1,
0.6643845, -0.007764451, 0.4026541, 0, 0, 0, 1, 1,
0.6673419, -0.1758146, 3.289966, 1, 1, 1, 1, 1,
0.6713551, 0.8098466, 0.3836965, 1, 1, 1, 1, 1,
0.674044, -0.815809, 6.205668, 1, 1, 1, 1, 1,
0.6772535, -0.3107707, 0.7563855, 1, 1, 1, 1, 1,
0.6831053, -1.400074, 2.717356, 1, 1, 1, 1, 1,
0.6855036, -0.5140527, 2.200763, 1, 1, 1, 1, 1,
0.6941485, -1.532299, 2.379535, 1, 1, 1, 1, 1,
0.7041082, -1.057303, 1.456838, 1, 1, 1, 1, 1,
0.7043, 1.313696, 0.3154127, 1, 1, 1, 1, 1,
0.707891, 1.500458, 1.634967, 1, 1, 1, 1, 1,
0.7192269, 1.465846, -0.4204291, 1, 1, 1, 1, 1,
0.7231002, 0.1419065, 4.187393, 1, 1, 1, 1, 1,
0.7266197, -0.2868659, 1.019745, 1, 1, 1, 1, 1,
0.7289324, 0.6363038, 1.347847, 1, 1, 1, 1, 1,
0.7347128, -0.6451887, -0.01688177, 1, 1, 1, 1, 1,
0.7352978, -1.55762, 2.73945, 0, 0, 1, 1, 1,
0.7363343, -2.199519, 4.970903, 1, 0, 0, 1, 1,
0.7380384, -1.082811, 2.998349, 1, 0, 0, 1, 1,
0.7382178, -0.01910488, 0.6449218, 1, 0, 0, 1, 1,
0.7392926, -0.434762, 2.490001, 1, 0, 0, 1, 1,
0.7425913, -0.4124841, 1.956908, 1, 0, 0, 1, 1,
0.7430551, 1.453709, -0.5710818, 0, 0, 0, 1, 1,
0.745562, -0.7865012, 1.489371, 0, 0, 0, 1, 1,
0.7487845, 0.291038, 2.13196, 0, 0, 0, 1, 1,
0.7602008, 0.6772329, 0.2470447, 0, 0, 0, 1, 1,
0.7619737, 0.9542745, 1.439883, 0, 0, 0, 1, 1,
0.7631601, 0.6763384, 0.7400635, 0, 0, 0, 1, 1,
0.7718017, -0.46883, 1.935854, 0, 0, 0, 1, 1,
0.7733895, 0.6311296, 1.764344, 1, 1, 1, 1, 1,
0.7756008, 1.701622, 1.345944, 1, 1, 1, 1, 1,
0.7759659, -0.6301553, 2.437383, 1, 1, 1, 1, 1,
0.7785751, -1.075676, 3.978152, 1, 1, 1, 1, 1,
0.7876873, -1.020755, 2.817262, 1, 1, 1, 1, 1,
0.7893654, -3.187218, 3.455864, 1, 1, 1, 1, 1,
0.790968, -0.5960403, 2.519521, 1, 1, 1, 1, 1,
0.7922673, 0.4645644, 0.8120327, 1, 1, 1, 1, 1,
0.7951015, -1.385069, 3.330105, 1, 1, 1, 1, 1,
0.7987232, 1.231341, 0.3031727, 1, 1, 1, 1, 1,
0.8012921, -1.278673, 0.9859303, 1, 1, 1, 1, 1,
0.8013981, 0.3437941, 1.373722, 1, 1, 1, 1, 1,
0.8060079, 1.592402, 0.1662306, 1, 1, 1, 1, 1,
0.8138905, -2.004574, 4.123628, 1, 1, 1, 1, 1,
0.8189649, -1.3493, 4.306279, 1, 1, 1, 1, 1,
0.8192323, 0.6459563, 1.728998, 0, 0, 1, 1, 1,
0.824095, -0.7665462, 1.096245, 1, 0, 0, 1, 1,
0.8315881, 3.373023, 0.5662591, 1, 0, 0, 1, 1,
0.8345888, 0.2784608, 1.310399, 1, 0, 0, 1, 1,
0.8376117, -0.5872487, 0.8296205, 1, 0, 0, 1, 1,
0.840374, -0.5669071, 1.698315, 1, 0, 0, 1, 1,
0.8439595, 1.653825, 0.7771348, 0, 0, 0, 1, 1,
0.8476138, -0.6323721, 2.982439, 0, 0, 0, 1, 1,
0.8536081, -0.223799, 2.697561, 0, 0, 0, 1, 1,
0.8545955, 0.9076125, 0.2924613, 0, 0, 0, 1, 1,
0.8592064, -0.4072064, 2.842073, 0, 0, 0, 1, 1,
0.8602141, 1.294512, 0.9500657, 0, 0, 0, 1, 1,
0.8614385, -0.2569756, 3.148442, 0, 0, 0, 1, 1,
0.8648534, -0.07946143, 1.276929, 1, 1, 1, 1, 1,
0.8671544, -0.707792, 2.349297, 1, 1, 1, 1, 1,
0.8789998, -0.1853362, 3.19782, 1, 1, 1, 1, 1,
0.8796149, -0.8651288, 4.524755, 1, 1, 1, 1, 1,
0.8861458, -0.7681335, 1.52017, 1, 1, 1, 1, 1,
0.8890222, 1.255664, 1.09954, 1, 1, 1, 1, 1,
0.8916801, -0.5185846, 2.851828, 1, 1, 1, 1, 1,
0.8917128, 0.5435306, -1.437731, 1, 1, 1, 1, 1,
0.8971131, 0.3155418, 2.523659, 1, 1, 1, 1, 1,
0.9051805, -0.04267161, 2.637207, 1, 1, 1, 1, 1,
0.9058198, -1.368046, 2.456794, 1, 1, 1, 1, 1,
0.9103046, -0.7410597, 2.134401, 1, 1, 1, 1, 1,
0.9107985, -1.278178, 2.25437, 1, 1, 1, 1, 1,
0.9183087, -0.9006205, 2.316004, 1, 1, 1, 1, 1,
0.9295461, -0.34485, 3.016045, 1, 1, 1, 1, 1,
0.9384313, -0.2714823, 0.8479212, 0, 0, 1, 1, 1,
0.9392119, -0.04573636, 2.511122, 1, 0, 0, 1, 1,
0.9421008, 0.8502882, 0.9364829, 1, 0, 0, 1, 1,
0.9462099, 1.424545, 1.163013, 1, 0, 0, 1, 1,
0.9471042, 0.8375473, 0.3115002, 1, 0, 0, 1, 1,
0.9497617, 1.115763, 1.302427, 1, 0, 0, 1, 1,
0.9518859, 0.06549323, 2.589639, 0, 0, 0, 1, 1,
0.9574998, -0.9157659, 2.926797, 0, 0, 0, 1, 1,
0.9594612, 0.5208757, 1.991809, 0, 0, 0, 1, 1,
0.9736273, -2.112243, 3.278363, 0, 0, 0, 1, 1,
0.9826549, 1.203602, 1.472751, 0, 0, 0, 1, 1,
0.9892367, 1.088207, 0.3953888, 0, 0, 0, 1, 1,
0.9937757, -1.882089, 3.639548, 0, 0, 0, 1, 1,
0.9950658, -0.5219323, 2.873799, 1, 1, 1, 1, 1,
0.9960285, 0.02175033, 1.192383, 1, 1, 1, 1, 1,
1.003632, -1.072765, 1.940565, 1, 1, 1, 1, 1,
1.005153, 0.9766747, -0.5570954, 1, 1, 1, 1, 1,
1.006256, -0.4534784, 2.374064, 1, 1, 1, 1, 1,
1.007079, 0.9572204, 1.627188, 1, 1, 1, 1, 1,
1.019615, -1.244857, 4.22235, 1, 1, 1, 1, 1,
1.025669, 0.7848311, 0.7914428, 1, 1, 1, 1, 1,
1.030914, -0.6585524, 1.074185, 1, 1, 1, 1, 1,
1.036939, -1.546933, 3.905122, 1, 1, 1, 1, 1,
1.038796, 0.3448097, 1.157977, 1, 1, 1, 1, 1,
1.052736, -0.64738, 3.012817, 1, 1, 1, 1, 1,
1.053879, -0.03727302, 0.948285, 1, 1, 1, 1, 1,
1.06131, 0.07075049, 1.920225, 1, 1, 1, 1, 1,
1.063673, 0.5814708, 1.449721, 1, 1, 1, 1, 1,
1.064647, -0.8646389, 2.219243, 0, 0, 1, 1, 1,
1.070156, 0.06667034, 1.628455, 1, 0, 0, 1, 1,
1.07649, -0.5044864, 3.323381, 1, 0, 0, 1, 1,
1.08101, -0.8925674, 2.28367, 1, 0, 0, 1, 1,
1.081023, -0.4772353, 3.672911, 1, 0, 0, 1, 1,
1.084261, 0.2427395, -0.9337329, 1, 0, 0, 1, 1,
1.086748, -0.9978439, 1.624733, 0, 0, 0, 1, 1,
1.088517, -0.06459528, 2.029149, 0, 0, 0, 1, 1,
1.107627, -0.7222466, 2.638984, 0, 0, 0, 1, 1,
1.108688, 1.267262, 1.918289, 0, 0, 0, 1, 1,
1.113984, 0.008421877, 1.622893, 0, 0, 0, 1, 1,
1.118803, 0.5881559, 0.8397729, 0, 0, 0, 1, 1,
1.132722, 0.111351, 0.7979958, 0, 0, 0, 1, 1,
1.13698, 1.522979, -0.7054886, 1, 1, 1, 1, 1,
1.146538, 1.14046, -0.2590417, 1, 1, 1, 1, 1,
1.161263, -1.278502, 1.431227, 1, 1, 1, 1, 1,
1.161507, 1.241071, -0.03238828, 1, 1, 1, 1, 1,
1.171116, 0.9098794, 1.374831, 1, 1, 1, 1, 1,
1.17223, 0.9002095, 0.6849643, 1, 1, 1, 1, 1,
1.177529, 0.9650893, 2.076299, 1, 1, 1, 1, 1,
1.181124, -0.08490332, 1.486196, 1, 1, 1, 1, 1,
1.184952, 0.157207, 0.08877683, 1, 1, 1, 1, 1,
1.185187, 1.041438, -0.2012547, 1, 1, 1, 1, 1,
1.196044, 2.0627, 0.7108512, 1, 1, 1, 1, 1,
1.199437, 1.463998, 1.521175, 1, 1, 1, 1, 1,
1.203831, -0.2867536, 2.561241, 1, 1, 1, 1, 1,
1.207697, -1.453557, 3.57966, 1, 1, 1, 1, 1,
1.21993, -0.0485297, 0.8295084, 1, 1, 1, 1, 1,
1.227375, 0.2497216, 3.774387, 0, 0, 1, 1, 1,
1.228421, -0.2708045, 0.8799723, 1, 0, 0, 1, 1,
1.231485, 0.09891135, 0.2370044, 1, 0, 0, 1, 1,
1.238282, 1.858892, 0.5928958, 1, 0, 0, 1, 1,
1.239606, -1.147904, 1.970999, 1, 0, 0, 1, 1,
1.243712, -0.3025341, 1.676599, 1, 0, 0, 1, 1,
1.243923, 0.4617479, 2.053309, 0, 0, 0, 1, 1,
1.25133, 0.6864682, 1.905742, 0, 0, 0, 1, 1,
1.251949, -0.8344858, 1.323734, 0, 0, 0, 1, 1,
1.268472, -0.8907868, 2.565481, 0, 0, 0, 1, 1,
1.276834, -1.118725, 3.1058, 0, 0, 0, 1, 1,
1.280988, 0.0538751, 1.468331, 0, 0, 0, 1, 1,
1.292091, -0.8859262, 1.674451, 0, 0, 0, 1, 1,
1.293971, -1.344186, 0.8757342, 1, 1, 1, 1, 1,
1.300433, 0.1090204, 0.4717431, 1, 1, 1, 1, 1,
1.307052, 1.239621, 0.2217135, 1, 1, 1, 1, 1,
1.308099, -0.3812333, 2.028488, 1, 1, 1, 1, 1,
1.31536, -0.1407534, 0.7029559, 1, 1, 1, 1, 1,
1.315472, 0.4592722, 2.511499, 1, 1, 1, 1, 1,
1.320353, -0.3591191, 0.2140979, 1, 1, 1, 1, 1,
1.329757, -0.512037, 3.752454, 1, 1, 1, 1, 1,
1.330773, -1.247864, 3.009969, 1, 1, 1, 1, 1,
1.331509, -2.104503, 2.056783, 1, 1, 1, 1, 1,
1.336569, -0.7825022, 1.60869, 1, 1, 1, 1, 1,
1.343047, -1.073166, 2.818962, 1, 1, 1, 1, 1,
1.343363, 1.200858, 0.03849484, 1, 1, 1, 1, 1,
1.343544, 0.3467687, 0.7379797, 1, 1, 1, 1, 1,
1.347822, 1.965802, -0.1093908, 1, 1, 1, 1, 1,
1.384286, -0.3619041, 3.745216, 0, 0, 1, 1, 1,
1.397537, -0.1193814, 2.179442, 1, 0, 0, 1, 1,
1.401493, -1.59463, 3.793153, 1, 0, 0, 1, 1,
1.406572, -0.6575437, 2.038733, 1, 0, 0, 1, 1,
1.415339, -0.6561667, 0.4331632, 1, 0, 0, 1, 1,
1.417396, -0.2231155, 1.076817, 1, 0, 0, 1, 1,
1.420979, -1.033106, 1.414619, 0, 0, 0, 1, 1,
1.437209, 0.5715156, 2.981137, 0, 0, 0, 1, 1,
1.440403, 0.06919294, 2.083957, 0, 0, 0, 1, 1,
1.445404, 1.517843, 1.042966, 0, 0, 0, 1, 1,
1.454272, 0.5790506, 1.62712, 0, 0, 0, 1, 1,
1.45881, 0.05751003, 2.456449, 0, 0, 0, 1, 1,
1.45934, 1.107097, 2.207021, 0, 0, 0, 1, 1,
1.460168, 1.784091, -0.7082866, 1, 1, 1, 1, 1,
1.464091, -0.6761295, 1.60283, 1, 1, 1, 1, 1,
1.465282, 0.1401483, 3.859671, 1, 1, 1, 1, 1,
1.466502, -0.3114227, -0.1426032, 1, 1, 1, 1, 1,
1.494507, 0.5810324, 0.3373212, 1, 1, 1, 1, 1,
1.502923, 1.220688, -2.056314, 1, 1, 1, 1, 1,
1.513334, -0.4001708, 1.507853, 1, 1, 1, 1, 1,
1.52685, -0.712263, 0.3465074, 1, 1, 1, 1, 1,
1.529879, 0.02046141, 2.215477, 1, 1, 1, 1, 1,
1.533037, 0.5700352, 2.016735, 1, 1, 1, 1, 1,
1.539093, -0.1096566, 0.1111389, 1, 1, 1, 1, 1,
1.544506, 1.051611, 1.878192, 1, 1, 1, 1, 1,
1.557765, -2.178119, 1.986322, 1, 1, 1, 1, 1,
1.580243, 0.6804463, 2.064703, 1, 1, 1, 1, 1,
1.58442, 0.524065, 1.078333, 1, 1, 1, 1, 1,
1.586674, 1.192513, 0.3166819, 0, 0, 1, 1, 1,
1.594736, 0.7265378, -1.008043, 1, 0, 0, 1, 1,
1.600383, -1.775828, 3.53502, 1, 0, 0, 1, 1,
1.617933, 0.1384518, 2.926173, 1, 0, 0, 1, 1,
1.620029, 1.214609, 1.794047, 1, 0, 0, 1, 1,
1.630618, 0.1891308, 1.992116, 1, 0, 0, 1, 1,
1.632401, -0.1737266, 1.659999, 0, 0, 0, 1, 1,
1.640145, -1.210796, 3.924649, 0, 0, 0, 1, 1,
1.641042, 1.586675, -2.353124, 0, 0, 0, 1, 1,
1.655707, -0.01368675, 1.207465, 0, 0, 0, 1, 1,
1.677153, 1.2835, 0.972047, 0, 0, 0, 1, 1,
1.686867, -0.0654396, 1.338874, 0, 0, 0, 1, 1,
1.693482, -0.4779102, 2.181487, 0, 0, 0, 1, 1,
1.704364, -1.106046, -0.1676166, 1, 1, 1, 1, 1,
1.704426, -1.743054, 2.703846, 1, 1, 1, 1, 1,
1.704834, -0.1759729, 1.675759, 1, 1, 1, 1, 1,
1.71544, 0.4583419, 0.5451531, 1, 1, 1, 1, 1,
1.716348, 0.9432953, 1.862197, 1, 1, 1, 1, 1,
1.724596, 0.656591, 0.1356301, 1, 1, 1, 1, 1,
1.735667, -1.155003, 3.216497, 1, 1, 1, 1, 1,
1.740502, 3.329337, 2.202659, 1, 1, 1, 1, 1,
1.754932, -1.009339, 3.027205, 1, 1, 1, 1, 1,
1.756626, 0.02744869, 1.385696, 1, 1, 1, 1, 1,
1.764492, -2.41967, 2.469699, 1, 1, 1, 1, 1,
1.776835, 0.02885111, 2.514678, 1, 1, 1, 1, 1,
1.805215, -0.1996059, 2.051055, 1, 1, 1, 1, 1,
1.807746, 0.3078197, 2.821937, 1, 1, 1, 1, 1,
1.811397, -0.4996991, 2.956138, 1, 1, 1, 1, 1,
1.827995, 0.834783, 2.935743, 0, 0, 1, 1, 1,
1.839329, 1.209206, 0.04019839, 1, 0, 0, 1, 1,
1.845037, -1.696287, 2.308258, 1, 0, 0, 1, 1,
1.850179, 0.9688451, 1.625948, 1, 0, 0, 1, 1,
1.86356, 0.2638147, 1.973375, 1, 0, 0, 1, 1,
1.894293, 0.3548291, 2.292195, 1, 0, 0, 1, 1,
1.915156, -1.331934, 2.516015, 0, 0, 0, 1, 1,
1.922496, -1.064341, 2.008774, 0, 0, 0, 1, 1,
1.952067, 0.8403847, 1.1109, 0, 0, 0, 1, 1,
1.954925, 1.303713, 0.5569016, 0, 0, 0, 1, 1,
1.95873, -1.151649, 3.052443, 0, 0, 0, 1, 1,
1.959273, -1.095052, 2.70501, 0, 0, 0, 1, 1,
1.974736, -1.059824, 1.481601, 0, 0, 0, 1, 1,
1.985804, 1.07459, 1.500476, 1, 1, 1, 1, 1,
1.998379, 1.412129, 0.8186906, 1, 1, 1, 1, 1,
2.001388, 0.7521113, 0.6065298, 1, 1, 1, 1, 1,
2.001996, 1.395178, 0.3395704, 1, 1, 1, 1, 1,
2.004882, 0.07652882, 2.584991, 1, 1, 1, 1, 1,
2.011002, 1.30128, 1.076486, 1, 1, 1, 1, 1,
2.017695, -0.1042851, 2.741131, 1, 1, 1, 1, 1,
2.032816, -0.228309, 2.254269, 1, 1, 1, 1, 1,
2.034798, 0.3930199, 0.5005111, 1, 1, 1, 1, 1,
2.043643, 2.319212, 0.5689769, 1, 1, 1, 1, 1,
2.053481, -1.469435, 3.663667, 1, 1, 1, 1, 1,
2.067788, -0.5953354, 3.63611, 1, 1, 1, 1, 1,
2.076566, 0.2731908, 0.366093, 1, 1, 1, 1, 1,
2.08578, -0.1765088, 0.9277387, 1, 1, 1, 1, 1,
2.091193, 2.049047, 1.30809, 1, 1, 1, 1, 1,
2.094909, -1.09571, 1.48734, 0, 0, 1, 1, 1,
2.132006, 1.247053, 1.38245, 1, 0, 0, 1, 1,
2.197954, 1.076716, 1.237289, 1, 0, 0, 1, 1,
2.236053, -0.1012022, -0.1169199, 1, 0, 0, 1, 1,
2.291462, -1.047992, 1.875653, 1, 0, 0, 1, 1,
2.291536, 1.583426, 2.393855, 1, 0, 0, 1, 1,
2.292619, -0.3033286, 1.634548, 0, 0, 0, 1, 1,
2.324576, 0.6065167, 1.439047, 0, 0, 0, 1, 1,
2.371517, 1.685685, 1.937164, 0, 0, 0, 1, 1,
2.389528, 0.1490453, 3.574853, 0, 0, 0, 1, 1,
2.424252, -1.418971, 2.264713, 0, 0, 0, 1, 1,
2.638782, 1.964924, 1.752785, 0, 0, 0, 1, 1,
2.668535, -1.195741, 1.789973, 0, 0, 0, 1, 1,
2.670715, 0.4278361, 1.996528, 1, 1, 1, 1, 1,
2.698427, -0.7633169, 0.7339509, 1, 1, 1, 1, 1,
2.731554, 0.5338801, 0.508943, 1, 1, 1, 1, 1,
2.884018, -0.8644493, 2.100167, 1, 1, 1, 1, 1,
2.905106, -1.869205, 3.826339, 1, 1, 1, 1, 1,
2.933067, -0.5337301, 1.415588, 1, 1, 1, 1, 1,
2.97715, -1.837358, 1.08135, 1, 1, 1, 1, 1
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
var radius = 9.765164;
var distance = 34.29972;
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
mvMatrix.translate( -0.09493268, -0.09290242, -0.4664123 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.29972);
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