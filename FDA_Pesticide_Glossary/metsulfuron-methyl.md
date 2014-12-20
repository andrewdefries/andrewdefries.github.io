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
-2.604502, 0.4748728, -0.3274314, 1, 0, 0, 1,
-2.564367, 0.1250799, -0.617834, 1, 0.007843138, 0, 1,
-2.404353, -0.4014536, -3.900411, 1, 0.01176471, 0, 1,
-2.402829, -0.6276603, -1.855983, 1, 0.01960784, 0, 1,
-2.396524, 0.5473955, -1.530041, 1, 0.02352941, 0, 1,
-2.377237, -0.1247861, -3.375703, 1, 0.03137255, 0, 1,
-2.353208, -0.2468055, -2.550374, 1, 0.03529412, 0, 1,
-2.334368, -0.4718866, 0.03388122, 1, 0.04313726, 0, 1,
-2.27886, 0.4331056, -1.493454, 1, 0.04705882, 0, 1,
-2.249196, -0.7300522, -2.718137, 1, 0.05490196, 0, 1,
-2.247662, 0.05986384, -2.112097, 1, 0.05882353, 0, 1,
-2.229031, -0.5833797, -0.9993567, 1, 0.06666667, 0, 1,
-2.225376, -1.689048, -1.640415, 1, 0.07058824, 0, 1,
-2.217664, -1.13971, -3.560388, 1, 0.07843138, 0, 1,
-2.165706, 0.6540096, -1.673257, 1, 0.08235294, 0, 1,
-2.148316, 0.09612685, -1.646749, 1, 0.09019608, 0, 1,
-2.143536, -1.060865, -1.073218, 1, 0.09411765, 0, 1,
-2.093962, 1.243304, -1.012027, 1, 0.1019608, 0, 1,
-2.068066, -0.218912, -2.781629, 1, 0.1098039, 0, 1,
-2.043819, 1.876072, -1.666179, 1, 0.1137255, 0, 1,
-2.040669, -0.7667414, -2.56927, 1, 0.1215686, 0, 1,
-2.013138, -1.797101, -2.636809, 1, 0.1254902, 0, 1,
-2.006496, -0.2841552, 0.005771243, 1, 0.1333333, 0, 1,
-1.987902, -0.6414641, -0.6481923, 1, 0.1372549, 0, 1,
-1.979389, 0.4014163, 0.03347344, 1, 0.145098, 0, 1,
-1.968026, -0.4540331, -0.2916551, 1, 0.1490196, 0, 1,
-1.964425, -1.062928, -1.569705, 1, 0.1568628, 0, 1,
-1.959043, 0.235975, 0.6247973, 1, 0.1607843, 0, 1,
-1.946823, 1.088783, -2.331622, 1, 0.1686275, 0, 1,
-1.941797, 0.5171128, -0.6700525, 1, 0.172549, 0, 1,
-1.919486, 0.7040154, -1.785218, 1, 0.1803922, 0, 1,
-1.919461, -1.719805, -1.579921, 1, 0.1843137, 0, 1,
-1.849356, 0.6405957, -3.396659, 1, 0.1921569, 0, 1,
-1.838469, 0.9325887, -0.9889967, 1, 0.1960784, 0, 1,
-1.837748, -0.2824844, -0.9246954, 1, 0.2039216, 0, 1,
-1.816206, 0.08543699, -1.887364, 1, 0.2117647, 0, 1,
-1.799543, 0.2012779, -2.216767, 1, 0.2156863, 0, 1,
-1.789566, -1.679443, -4.203373, 1, 0.2235294, 0, 1,
-1.781685, 0.2321727, 0.1498747, 1, 0.227451, 0, 1,
-1.779163, 0.9779394, -1.932278, 1, 0.2352941, 0, 1,
-1.771581, 1.445538, -2.403593, 1, 0.2392157, 0, 1,
-1.760708, 2.352671, -1.276458, 1, 0.2470588, 0, 1,
-1.750072, 1.828314, -0.5551934, 1, 0.2509804, 0, 1,
-1.742589, 1.173118, -1.651979, 1, 0.2588235, 0, 1,
-1.729247, 1.284583, -1.155438, 1, 0.2627451, 0, 1,
-1.709591, -1.545983, -3.825185, 1, 0.2705882, 0, 1,
-1.705599, 2.466264, -0.7694812, 1, 0.2745098, 0, 1,
-1.689869, -0.8945204, -3.00937, 1, 0.282353, 0, 1,
-1.689248, 0.4724099, -1.017974, 1, 0.2862745, 0, 1,
-1.683356, 0.1135408, -0.9200111, 1, 0.2941177, 0, 1,
-1.681442, -0.2921996, -1.850141, 1, 0.3019608, 0, 1,
-1.671217, -1.719165, -1.422494, 1, 0.3058824, 0, 1,
-1.667029, 0.5705587, -0.8601091, 1, 0.3137255, 0, 1,
-1.660373, 0.5665677, -1.316486, 1, 0.3176471, 0, 1,
-1.652763, -1.110921, -2.298871, 1, 0.3254902, 0, 1,
-1.645098, 0.9383025, -0.07486778, 1, 0.3294118, 0, 1,
-1.603209, -0.8306699, -2.533372, 1, 0.3372549, 0, 1,
-1.571432, 0.3820112, -0.8204302, 1, 0.3411765, 0, 1,
-1.551975, -0.008686635, -0.7668236, 1, 0.3490196, 0, 1,
-1.5488, -1.02784, -1.069893, 1, 0.3529412, 0, 1,
-1.541896, -1.224297, -1.267841, 1, 0.3607843, 0, 1,
-1.532424, -0.7951519, -1.49103, 1, 0.3647059, 0, 1,
-1.521235, 1.658069, -0.7056651, 1, 0.372549, 0, 1,
-1.509132, 1.508437, -1.622621, 1, 0.3764706, 0, 1,
-1.503348, 1.436042, -0.6930866, 1, 0.3843137, 0, 1,
-1.498598, 0.9404938, -1.527748, 1, 0.3882353, 0, 1,
-1.497985, -0.3591801, -0.6855008, 1, 0.3960784, 0, 1,
-1.497442, 0.8157352, -0.2953365, 1, 0.4039216, 0, 1,
-1.493464, -2.771358, -1.992705, 1, 0.4078431, 0, 1,
-1.490561, -0.05380929, -1.093171, 1, 0.4156863, 0, 1,
-1.485605, 0.6810548, -0.603554, 1, 0.4196078, 0, 1,
-1.484846, 0.3792969, -1.225695, 1, 0.427451, 0, 1,
-1.47592, -1.684839, -3.353465, 1, 0.4313726, 0, 1,
-1.46591, 0.04898778, -1.416303, 1, 0.4392157, 0, 1,
-1.456957, 0.4169206, -1.655638, 1, 0.4431373, 0, 1,
-1.454971, 2.134111, -0.1935645, 1, 0.4509804, 0, 1,
-1.446023, -1.318516, -2.176297, 1, 0.454902, 0, 1,
-1.443535, 0.9508266, -1.020786, 1, 0.4627451, 0, 1,
-1.443411, 0.5322905, -2.406044, 1, 0.4666667, 0, 1,
-1.442488, 1.174001, -1.673011, 1, 0.4745098, 0, 1,
-1.440324, 0.2070831, -0.3694143, 1, 0.4784314, 0, 1,
-1.437448, -1.236154, -2.277412, 1, 0.4862745, 0, 1,
-1.436621, 2.011427, -0.2247658, 1, 0.4901961, 0, 1,
-1.432887, 0.5796465, 0.6337759, 1, 0.4980392, 0, 1,
-1.419701, -2.144236, -2.361473, 1, 0.5058824, 0, 1,
-1.406295, -0.6849654, -0.1225724, 1, 0.509804, 0, 1,
-1.405007, 0.4653271, -2.368148, 1, 0.5176471, 0, 1,
-1.403433, 1.2425, -1.413966, 1, 0.5215687, 0, 1,
-1.401108, -0.1079059, -1.562356, 1, 0.5294118, 0, 1,
-1.397724, 0.258483, -1.18881, 1, 0.5333334, 0, 1,
-1.393519, 0.102688, -0.07069926, 1, 0.5411765, 0, 1,
-1.384669, 1.591738, -0.8889161, 1, 0.5450981, 0, 1,
-1.375989, -0.262327, -0.9727266, 1, 0.5529412, 0, 1,
-1.375402, -0.3954048, -2.939498, 1, 0.5568628, 0, 1,
-1.370263, 0.2780435, -0.3731976, 1, 0.5647059, 0, 1,
-1.361077, -1.608979, -0.3757018, 1, 0.5686275, 0, 1,
-1.354102, 0.8050368, -0.2613075, 1, 0.5764706, 0, 1,
-1.353304, 2.479152, -1.008109, 1, 0.5803922, 0, 1,
-1.350164, -2.49616, -2.3697, 1, 0.5882353, 0, 1,
-1.337824, 1.55991, -0.7256852, 1, 0.5921569, 0, 1,
-1.331666, 1.006485, -1.783143, 1, 0.6, 0, 1,
-1.329823, -0.08370556, -1.347688, 1, 0.6078432, 0, 1,
-1.329226, -0.07646219, -1.628444, 1, 0.6117647, 0, 1,
-1.327009, 1.38017, -0.2146979, 1, 0.6196079, 0, 1,
-1.318116, -0.3762966, -1.19186, 1, 0.6235294, 0, 1,
-1.317247, -1.298691, -2.969416, 1, 0.6313726, 0, 1,
-1.31469, -0.8808507, -3.056305, 1, 0.6352941, 0, 1,
-1.299044, 0.7687533, -1.016837, 1, 0.6431373, 0, 1,
-1.298094, -1.464881, -2.341427, 1, 0.6470588, 0, 1,
-1.286999, 1.400182, -0.1094742, 1, 0.654902, 0, 1,
-1.270581, -2.153387, -3.078846, 1, 0.6588235, 0, 1,
-1.268775, -0.8015725, -2.967882, 1, 0.6666667, 0, 1,
-1.264103, -0.271162, 0.1950247, 1, 0.6705883, 0, 1,
-1.254983, -0.4472452, -1.65284, 1, 0.6784314, 0, 1,
-1.250399, 2.396895, -1.130893, 1, 0.682353, 0, 1,
-1.249674, -1.389872, -3.194995, 1, 0.6901961, 0, 1,
-1.242051, -0.4031475, 0.2787248, 1, 0.6941177, 0, 1,
-1.234684, 0.327854, -0.2450155, 1, 0.7019608, 0, 1,
-1.228131, 1.382526, -0.287616, 1, 0.7098039, 0, 1,
-1.227318, -1.29649, -1.980055, 1, 0.7137255, 0, 1,
-1.226714, -0.1646201, -1.453748, 1, 0.7215686, 0, 1,
-1.214429, -0.3438259, -1.195265, 1, 0.7254902, 0, 1,
-1.200345, 0.1859417, -1.913432, 1, 0.7333333, 0, 1,
-1.196191, -0.3445634, -1.733917, 1, 0.7372549, 0, 1,
-1.194992, 0.6212518, -0.3440288, 1, 0.7450981, 0, 1,
-1.183117, 0.2352512, -0.7532084, 1, 0.7490196, 0, 1,
-1.178383, -0.2494164, -1.588676, 1, 0.7568628, 0, 1,
-1.161151, -0.2842114, -1.717639, 1, 0.7607843, 0, 1,
-1.157696, -0.3425299, -3.829423, 1, 0.7686275, 0, 1,
-1.153965, 0.4591893, -3.352343, 1, 0.772549, 0, 1,
-1.149133, 0.08725785, -0.07253972, 1, 0.7803922, 0, 1,
-1.146566, 0.9036668, -0.8227679, 1, 0.7843137, 0, 1,
-1.144743, 0.59313, -1.656224, 1, 0.7921569, 0, 1,
-1.141183, 0.145943, -2.509973, 1, 0.7960784, 0, 1,
-1.13854, 0.995478, -1.477041, 1, 0.8039216, 0, 1,
-1.13835, -0.4221165, -2.239895, 1, 0.8117647, 0, 1,
-1.137243, 0.283412, -1.037688, 1, 0.8156863, 0, 1,
-1.135454, 0.3110359, -2.819149, 1, 0.8235294, 0, 1,
-1.134512, 0.9335309, -0.755016, 1, 0.827451, 0, 1,
-1.134058, 1.731045, -0.6234351, 1, 0.8352941, 0, 1,
-1.132429, 0.2839555, -0.09578127, 1, 0.8392157, 0, 1,
-1.12657, 1.63987, -2.370707, 1, 0.8470588, 0, 1,
-1.126185, -0.4895726, -1.240327, 1, 0.8509804, 0, 1,
-1.124845, -0.3628696, -0.5529113, 1, 0.8588235, 0, 1,
-1.124045, 0.8709685, 1.312907, 1, 0.8627451, 0, 1,
-1.122921, -1.344416, -2.544174, 1, 0.8705882, 0, 1,
-1.121574, 0.03017391, -1.736629, 1, 0.8745098, 0, 1,
-1.11849, -0.7705015, -0.1896381, 1, 0.8823529, 0, 1,
-1.117095, 1.642924, 0.539333, 1, 0.8862745, 0, 1,
-1.116038, -0.05229243, -3.730301, 1, 0.8941177, 0, 1,
-1.111452, 0.907293, -0.7236397, 1, 0.8980392, 0, 1,
-1.098934, -0.5042403, -3.09817, 1, 0.9058824, 0, 1,
-1.095259, -0.2148813, -1.98168, 1, 0.9137255, 0, 1,
-1.093513, 0.4054578, -2.83658, 1, 0.9176471, 0, 1,
-1.093265, -0.8284049, -2.46463, 1, 0.9254902, 0, 1,
-1.092721, -0.2466224, -2.546055, 1, 0.9294118, 0, 1,
-1.089673, 0.00319115, -1.924918, 1, 0.9372549, 0, 1,
-1.089649, -0.9292931, -1.871143, 1, 0.9411765, 0, 1,
-1.088295, -0.4881496, -1.707705, 1, 0.9490196, 0, 1,
-1.081325, 0.1063628, -2.580722, 1, 0.9529412, 0, 1,
-1.081263, 1.553543, -0.8538054, 1, 0.9607843, 0, 1,
-1.070051, -0.2516313, -1.626672, 1, 0.9647059, 0, 1,
-1.057428, 0.3929504, -3.359788, 1, 0.972549, 0, 1,
-1.05429, 1.538592, -4.018276, 1, 0.9764706, 0, 1,
-1.0476, 0.410122, -2.705132, 1, 0.9843137, 0, 1,
-1.045096, 2.155603, -0.199912, 1, 0.9882353, 0, 1,
-1.042731, 1.989154, -1.7577, 1, 0.9960784, 0, 1,
-1.039337, -0.8838916, -2.855136, 0.9960784, 1, 0, 1,
-1.036939, 0.6355451, -1.449119, 0.9921569, 1, 0, 1,
-1.031625, 0.6250944, -0.06571162, 0.9843137, 1, 0, 1,
-1.030713, 0.2497172, -0.7282158, 0.9803922, 1, 0, 1,
-1.030625, 0.4189542, -3.332545, 0.972549, 1, 0, 1,
-1.028851, -0.7161772, -2.321869, 0.9686275, 1, 0, 1,
-1.023932, 0.7513911, -1.878387, 0.9607843, 1, 0, 1,
-1.018084, 0.546486, -0.4471929, 0.9568627, 1, 0, 1,
-1.018072, -0.2119223, -2.734143, 0.9490196, 1, 0, 1,
-1.013597, 0.06290777, -0.8582727, 0.945098, 1, 0, 1,
-1.009052, -1.844691, -3.785347, 0.9372549, 1, 0, 1,
-1.00697, 0.6118557, -2.756231, 0.9333333, 1, 0, 1,
-1.001797, 0.2925686, -1.893286, 0.9254902, 1, 0, 1,
-0.9972854, 0.05684686, -1.854462, 0.9215686, 1, 0, 1,
-0.9948503, 2.284512, -0.6846948, 0.9137255, 1, 0, 1,
-0.9944007, -0.3665237, -2.856865, 0.9098039, 1, 0, 1,
-0.9935014, -0.6866054, -4.625547, 0.9019608, 1, 0, 1,
-0.9863071, -0.9721256, -1.36941, 0.8941177, 1, 0, 1,
-0.9861905, -1.029091, -4.437553, 0.8901961, 1, 0, 1,
-0.9800593, -0.7464644, -2.87343, 0.8823529, 1, 0, 1,
-0.9629955, -1.460755, -2.285737, 0.8784314, 1, 0, 1,
-0.9611734, 0.8057148, -1.31471, 0.8705882, 1, 0, 1,
-0.9499373, 2.117049, -0.4836942, 0.8666667, 1, 0, 1,
-0.9484056, -0.7752605, -1.639127, 0.8588235, 1, 0, 1,
-0.9455848, 0.3722708, -1.453609, 0.854902, 1, 0, 1,
-0.9443219, 0.2838421, -0.5792969, 0.8470588, 1, 0, 1,
-0.9299546, -0.9650672, -2.511876, 0.8431373, 1, 0, 1,
-0.9299452, 2.005631, 0.1897106, 0.8352941, 1, 0, 1,
-0.9170544, 0.2921744, -1.472829, 0.8313726, 1, 0, 1,
-0.9167807, 0.34403, -0.6098917, 0.8235294, 1, 0, 1,
-0.9117916, 1.028094, -0.70536, 0.8196079, 1, 0, 1,
-0.9067298, 1.705844, -0.7736999, 0.8117647, 1, 0, 1,
-0.9039313, -0.7417423, -1.783092, 0.8078431, 1, 0, 1,
-0.8937862, -0.958058, -3.383469, 0.8, 1, 0, 1,
-0.8929208, 0.6587567, -1.162791, 0.7921569, 1, 0, 1,
-0.8910141, 0.39256, -1.564862, 0.7882353, 1, 0, 1,
-0.8866543, 0.9329037, -0.7887096, 0.7803922, 1, 0, 1,
-0.8865741, -0.5561924, -2.659772, 0.7764706, 1, 0, 1,
-0.8788491, 0.2432208, -2.841544, 0.7686275, 1, 0, 1,
-0.87638, 0.2259644, 0.7591109, 0.7647059, 1, 0, 1,
-0.8735391, -0.03546224, -1.058634, 0.7568628, 1, 0, 1,
-0.8724721, -1.077255, -2.71313, 0.7529412, 1, 0, 1,
-0.8723925, 0.6350057, -1.324782, 0.7450981, 1, 0, 1,
-0.8704665, -1.276518, 0.2723132, 0.7411765, 1, 0, 1,
-0.8694996, 0.307337, -1.853114, 0.7333333, 1, 0, 1,
-0.8694964, -0.7540399, -1.938008, 0.7294118, 1, 0, 1,
-0.8642949, -0.2770563, -3.342614, 0.7215686, 1, 0, 1,
-0.859952, 1.368818, 0.1431887, 0.7176471, 1, 0, 1,
-0.8545372, 0.7200931, -2.069371, 0.7098039, 1, 0, 1,
-0.8540758, -0.6743129, -0.2060062, 0.7058824, 1, 0, 1,
-0.8538534, 1.381483, -0.8368149, 0.6980392, 1, 0, 1,
-0.8399352, 0.7009796, -0.9058174, 0.6901961, 1, 0, 1,
-0.8376605, -1.311704, -2.636033, 0.6862745, 1, 0, 1,
-0.8356701, 0.1078194, -1.178275, 0.6784314, 1, 0, 1,
-0.830733, -0.1111066, -2.189792, 0.6745098, 1, 0, 1,
-0.8294713, -0.4379289, -3.082333, 0.6666667, 1, 0, 1,
-0.8284928, -1.214905, -2.704455, 0.6627451, 1, 0, 1,
-0.826929, 0.4351606, -1.67981, 0.654902, 1, 0, 1,
-0.8257754, 0.7364746, -1.381066, 0.6509804, 1, 0, 1,
-0.8105812, -0.210602, -2.881763, 0.6431373, 1, 0, 1,
-0.8100182, -0.005909294, -2.705014, 0.6392157, 1, 0, 1,
-0.8044185, -0.3358029, -0.989788, 0.6313726, 1, 0, 1,
-0.8020299, 0.1951786, -1.402369, 0.627451, 1, 0, 1,
-0.8003074, 1.501808, -1.928722, 0.6196079, 1, 0, 1,
-0.794723, 0.5456052, -0.5446731, 0.6156863, 1, 0, 1,
-0.7908583, 1.339793, -0.5451263, 0.6078432, 1, 0, 1,
-0.7879101, -0.1641906, -3.185751, 0.6039216, 1, 0, 1,
-0.7800735, -1.007881, -3.339196, 0.5960785, 1, 0, 1,
-0.7780122, 0.7979687, -0.8486271, 0.5882353, 1, 0, 1,
-0.7750915, 0.401132, -0.1147633, 0.5843138, 1, 0, 1,
-0.7750487, 0.3949911, -1.195877, 0.5764706, 1, 0, 1,
-0.7729725, -0.3242929, -2.97526, 0.572549, 1, 0, 1,
-0.7694805, 1.468708, -0.5494345, 0.5647059, 1, 0, 1,
-0.7622957, 1.454623, -0.5920699, 0.5607843, 1, 0, 1,
-0.7621967, -0.6519743, -2.310113, 0.5529412, 1, 0, 1,
-0.7605526, 0.814479, -0.937471, 0.5490196, 1, 0, 1,
-0.7526736, -0.9158767, -2.017795, 0.5411765, 1, 0, 1,
-0.7514939, 0.5456516, -0.8015313, 0.5372549, 1, 0, 1,
-0.7513263, 2.077977, -0.1189271, 0.5294118, 1, 0, 1,
-0.7494022, 0.3906622, -0.8805814, 0.5254902, 1, 0, 1,
-0.7477708, 0.9674568, -0.9069461, 0.5176471, 1, 0, 1,
-0.743171, 0.992965, -1.678521, 0.5137255, 1, 0, 1,
-0.7300678, 1.350176, -1.434862, 0.5058824, 1, 0, 1,
-0.7261101, 0.59192, -0.06879478, 0.5019608, 1, 0, 1,
-0.7247583, -0.5668479, -2.595406, 0.4941176, 1, 0, 1,
-0.7227193, 0.2282043, -1.717584, 0.4862745, 1, 0, 1,
-0.7211785, 0.695554, 0.1494804, 0.4823529, 1, 0, 1,
-0.7125719, 0.06851412, -2.288441, 0.4745098, 1, 0, 1,
-0.7087108, 0.2050974, -0.6645026, 0.4705882, 1, 0, 1,
-0.7050975, 0.2863794, -2.865386, 0.4627451, 1, 0, 1,
-0.7004222, 0.8137295, 0.3678759, 0.4588235, 1, 0, 1,
-0.6991391, 0.6797276, -0.5541265, 0.4509804, 1, 0, 1,
-0.6966085, -0.7364091, -3.251909, 0.4470588, 1, 0, 1,
-0.6962315, -0.5060256, -0.8374205, 0.4392157, 1, 0, 1,
-0.6957445, 0.4351822, -1.19947, 0.4352941, 1, 0, 1,
-0.691484, 0.5879832, -3.42889, 0.427451, 1, 0, 1,
-0.6889338, 1.980895, -0.9736576, 0.4235294, 1, 0, 1,
-0.6870643, 1.352699, -3.022943, 0.4156863, 1, 0, 1,
-0.6847554, 0.1170889, -1.714916, 0.4117647, 1, 0, 1,
-0.684175, -1.464017, -2.373102, 0.4039216, 1, 0, 1,
-0.6805065, 0.04429764, -2.747414, 0.3960784, 1, 0, 1,
-0.6786723, -0.1131306, -1.67976, 0.3921569, 1, 0, 1,
-0.6772344, -1.162927, -4.153684, 0.3843137, 1, 0, 1,
-0.6756294, -0.7580152, -2.254073, 0.3803922, 1, 0, 1,
-0.6703902, -1.022169, -2.705634, 0.372549, 1, 0, 1,
-0.6670344, -1.406485, -2.330177, 0.3686275, 1, 0, 1,
-0.6654306, 0.243867, -1.115392, 0.3607843, 1, 0, 1,
-0.6613579, 0.5114174, -0.2172211, 0.3568628, 1, 0, 1,
-0.6565118, -0.7120806, -1.33914, 0.3490196, 1, 0, 1,
-0.6563347, -2.363847, -2.774373, 0.345098, 1, 0, 1,
-0.6562176, 0.4234839, -2.149596, 0.3372549, 1, 0, 1,
-0.6540985, 1.305646, -0.5649744, 0.3333333, 1, 0, 1,
-0.652427, 0.5312055, -1.806227, 0.3254902, 1, 0, 1,
-0.6473675, -0.08367167, -3.008183, 0.3215686, 1, 0, 1,
-0.6460428, 0.4018881, -1.897829, 0.3137255, 1, 0, 1,
-0.6440784, -0.6116913, -6.070033, 0.3098039, 1, 0, 1,
-0.6401763, -2.093741, -3.788847, 0.3019608, 1, 0, 1,
-0.6294435, -0.5385824, -4.002595, 0.2941177, 1, 0, 1,
-0.6289812, -0.4425898, -2.54176, 0.2901961, 1, 0, 1,
-0.6242575, 0.06377697, -2.009628, 0.282353, 1, 0, 1,
-0.6035618, 0.7021582, -1.160199, 0.2784314, 1, 0, 1,
-0.6001324, -0.1852307, -1.901223, 0.2705882, 1, 0, 1,
-0.5975701, -1.450522, -2.625988, 0.2666667, 1, 0, 1,
-0.589693, 1.570766, -0.3248594, 0.2588235, 1, 0, 1,
-0.5893605, 0.4349692, -1.488711, 0.254902, 1, 0, 1,
-0.5856241, -0.2423462, -3.287373, 0.2470588, 1, 0, 1,
-0.5855414, 1.04439, -0.8623645, 0.2431373, 1, 0, 1,
-0.584845, -0.2695535, -4.266478, 0.2352941, 1, 0, 1,
-0.5832915, 0.717222, -0.1000619, 0.2313726, 1, 0, 1,
-0.5798442, 0.3638171, -2.27616, 0.2235294, 1, 0, 1,
-0.5790765, 0.3346907, -0.5515646, 0.2196078, 1, 0, 1,
-0.5778849, -0.3235703, -2.36062, 0.2117647, 1, 0, 1,
-0.5772607, -0.4990572, -1.608564, 0.2078431, 1, 0, 1,
-0.5772176, -0.4954775, -1.191058, 0.2, 1, 0, 1,
-0.5748942, -0.8970773, -5.16142, 0.1921569, 1, 0, 1,
-0.5736542, -0.7962766, -3.012233, 0.1882353, 1, 0, 1,
-0.5730926, 2.610351, 0.3712684, 0.1803922, 1, 0, 1,
-0.5705304, -1.158194, -1.845573, 0.1764706, 1, 0, 1,
-0.5657032, -0.5763445, -2.14399, 0.1686275, 1, 0, 1,
-0.5626287, -0.8568007, -2.004776, 0.1647059, 1, 0, 1,
-0.5581686, -1.08399, -2.083792, 0.1568628, 1, 0, 1,
-0.5579296, 0.391874, -1.561296, 0.1529412, 1, 0, 1,
-0.5518429, -0.002791313, -0.6891869, 0.145098, 1, 0, 1,
-0.5514486, 0.2882677, -0.5623155, 0.1411765, 1, 0, 1,
-0.5461329, 0.7530369, -1.232975, 0.1333333, 1, 0, 1,
-0.5445754, 0.5732746, -1.188761, 0.1294118, 1, 0, 1,
-0.5426742, -0.7782739, -2.576597, 0.1215686, 1, 0, 1,
-0.536485, -0.04654546, -1.062293, 0.1176471, 1, 0, 1,
-0.531243, 0.4399126, -0.3800929, 0.1098039, 1, 0, 1,
-0.5309866, 0.8727065, 0.853102, 0.1058824, 1, 0, 1,
-0.5278713, 0.7948912, -0.1438495, 0.09803922, 1, 0, 1,
-0.5183159, -0.6054389, -3.096531, 0.09019608, 1, 0, 1,
-0.5171452, -0.6083229, -3.497445, 0.08627451, 1, 0, 1,
-0.5160927, 0.4547809, -0.8422811, 0.07843138, 1, 0, 1,
-0.5145677, -0.7300457, -3.060431, 0.07450981, 1, 0, 1,
-0.5109395, -0.5340261, -2.781235, 0.06666667, 1, 0, 1,
-0.5094129, 0.2445297, -1.825858, 0.0627451, 1, 0, 1,
-0.5055041, 1.145424, 1.684172, 0.05490196, 1, 0, 1,
-0.5050145, -1.795863, -2.968685, 0.05098039, 1, 0, 1,
-0.5012789, -1.631646, 0.5014827, 0.04313726, 1, 0, 1,
-0.5001277, -0.9245557, -4.009874, 0.03921569, 1, 0, 1,
-0.4926576, 0.5215895, -0.6428931, 0.03137255, 1, 0, 1,
-0.4833053, -0.7192215, -2.748256, 0.02745098, 1, 0, 1,
-0.4809992, -0.5491554, -4.898831, 0.01960784, 1, 0, 1,
-0.4773147, 0.06575909, -1.60158, 0.01568628, 1, 0, 1,
-0.4748397, -0.5833879, -2.545635, 0.007843138, 1, 0, 1,
-0.4728062, 0.4397195, 0.6075426, 0.003921569, 1, 0, 1,
-0.4703424, -0.2202578, -1.606658, 0, 1, 0.003921569, 1,
-0.467683, 0.6667423, 0.2551646, 0, 1, 0.01176471, 1,
-0.4671277, -1.396881, -4.010686, 0, 1, 0.01568628, 1,
-0.4647799, -0.08166013, -1.894988, 0, 1, 0.02352941, 1,
-0.4640033, 0.1939283, -0.7114334, 0, 1, 0.02745098, 1,
-0.4599185, -0.4203887, -2.228966, 0, 1, 0.03529412, 1,
-0.4592615, -1.746836, -3.739075, 0, 1, 0.03921569, 1,
-0.4554778, 0.005279596, -1.353897, 0, 1, 0.04705882, 1,
-0.4519661, -0.8812767, -1.831044, 0, 1, 0.05098039, 1,
-0.4500645, -2.101688, -3.18278, 0, 1, 0.05882353, 1,
-0.4484413, 0.463306, -1.046002, 0, 1, 0.0627451, 1,
-0.4457732, 0.04459014, -1.642367, 0, 1, 0.07058824, 1,
-0.4390789, 1.447554, -0.3579635, 0, 1, 0.07450981, 1,
-0.4352262, -0.9068547, -1.57188, 0, 1, 0.08235294, 1,
-0.4327897, -0.1162656, -2.178549, 0, 1, 0.08627451, 1,
-0.4272966, -0.1049033, -0.763467, 0, 1, 0.09411765, 1,
-0.4266638, -0.4065981, -2.728819, 0, 1, 0.1019608, 1,
-0.4258049, -0.7497636, -2.698798, 0, 1, 0.1058824, 1,
-0.4208434, -1.100903, -4.229611, 0, 1, 0.1137255, 1,
-0.4172626, 0.258265, -1.567058, 0, 1, 0.1176471, 1,
-0.4143838, 0.0894936, 0.3290195, 0, 1, 0.1254902, 1,
-0.4136317, -0.9285268, -1.735628, 0, 1, 0.1294118, 1,
-0.4132363, -0.981131, -1.422105, 0, 1, 0.1372549, 1,
-0.4122821, 0.3079968, -0.8311661, 0, 1, 0.1411765, 1,
-0.3999648, 0.238296, -0.8660932, 0, 1, 0.1490196, 1,
-0.392111, -1.215223, -0.9089655, 0, 1, 0.1529412, 1,
-0.3836756, 0.1533542, -1.427558, 0, 1, 0.1607843, 1,
-0.3805784, -1.127351, -1.831715, 0, 1, 0.1647059, 1,
-0.377401, 1.382136, -1.377934, 0, 1, 0.172549, 1,
-0.3748885, -1.287977, -2.772865, 0, 1, 0.1764706, 1,
-0.3732527, 0.2345565, -2.774101, 0, 1, 0.1843137, 1,
-0.3680021, 0.6921466, -0.3646601, 0, 1, 0.1882353, 1,
-0.3660972, 1.375474, 0.9171985, 0, 1, 0.1960784, 1,
-0.3543778, -0.9483177, -3.467101, 0, 1, 0.2039216, 1,
-0.3534158, 1.17539, 0.5472095, 0, 1, 0.2078431, 1,
-0.3532252, 2.661382, 1.91776, 0, 1, 0.2156863, 1,
-0.3497606, -0.07314816, -2.74354, 0, 1, 0.2196078, 1,
-0.3434955, -2.999602, -2.467213, 0, 1, 0.227451, 1,
-0.341783, 0.9059455, -0.9787087, 0, 1, 0.2313726, 1,
-0.3323029, -0.4491693, -2.775418, 0, 1, 0.2392157, 1,
-0.3313472, -0.4225014, -0.8209163, 0, 1, 0.2431373, 1,
-0.3302115, -0.9094937, -3.433236, 0, 1, 0.2509804, 1,
-0.326236, 0.3907137, 0.697619, 0, 1, 0.254902, 1,
-0.3259079, -1.078715, -3.757278, 0, 1, 0.2627451, 1,
-0.3257922, -0.2502545, -3.235995, 0, 1, 0.2666667, 1,
-0.3254366, -0.1888081, -1.550855, 0, 1, 0.2745098, 1,
-0.3237604, -0.160065, -1.203184, 0, 1, 0.2784314, 1,
-0.322575, -1.050251, -1.697772, 0, 1, 0.2862745, 1,
-0.3225681, -0.8068212, -2.38532, 0, 1, 0.2901961, 1,
-0.3224213, -0.7184275, -3.506812, 0, 1, 0.2980392, 1,
-0.3220381, -0.05757179, -1.074133, 0, 1, 0.3058824, 1,
-0.3216889, -0.496664, -4.769761, 0, 1, 0.3098039, 1,
-0.321095, 1.828154, -2.011182, 0, 1, 0.3176471, 1,
-0.3186206, -0.2624581, -1.322622, 0, 1, 0.3215686, 1,
-0.3176315, 0.4093529, -2.707571, 0, 1, 0.3294118, 1,
-0.3161664, -0.6093142, -2.00495, 0, 1, 0.3333333, 1,
-0.3137437, 0.8873053, 0.5619221, 0, 1, 0.3411765, 1,
-0.3131828, -1.186224, -2.634455, 0, 1, 0.345098, 1,
-0.3113107, -2.891471, -2.563882, 0, 1, 0.3529412, 1,
-0.3093343, -0.2194209, -3.978211, 0, 1, 0.3568628, 1,
-0.3041629, -0.2605152, -2.655143, 0, 1, 0.3647059, 1,
-0.3015195, 2.371779, -0.8956198, 0, 1, 0.3686275, 1,
-0.2993193, 0.2029495, -2.466057, 0, 1, 0.3764706, 1,
-0.2986105, 1.798294, -1.26875, 0, 1, 0.3803922, 1,
-0.2909408, -0.8427081, -3.684722, 0, 1, 0.3882353, 1,
-0.2813499, -0.9766613, -3.687836, 0, 1, 0.3921569, 1,
-0.2771453, -0.2820547, -2.129507, 0, 1, 0.4, 1,
-0.2763604, -1.104256, -4.009314, 0, 1, 0.4078431, 1,
-0.2703404, 0.470558, -1.034216, 0, 1, 0.4117647, 1,
-0.2680705, 0.1855076, -1.64882, 0, 1, 0.4196078, 1,
-0.2627852, -0.9720713, -2.564709, 0, 1, 0.4235294, 1,
-0.2555242, -2.317491, -2.83685, 0, 1, 0.4313726, 1,
-0.2554303, -0.1385799, -4.444786, 0, 1, 0.4352941, 1,
-0.2539699, 0.9484593, 0.1158712, 0, 1, 0.4431373, 1,
-0.2530893, 0.6541009, -1.881258, 0, 1, 0.4470588, 1,
-0.2527982, -0.04354329, -2.074693, 0, 1, 0.454902, 1,
-0.2526805, 0.3691945, -0.9014394, 0, 1, 0.4588235, 1,
-0.2468102, -1.49924, -2.573091, 0, 1, 0.4666667, 1,
-0.242673, -1.088032, -3.56569, 0, 1, 0.4705882, 1,
-0.2416507, -1.126776, -2.710665, 0, 1, 0.4784314, 1,
-0.2412149, 0.9666873, -1.955166, 0, 1, 0.4823529, 1,
-0.2411016, -2.270649, -3.171471, 0, 1, 0.4901961, 1,
-0.2410584, -0.5856123, -2.990734, 0, 1, 0.4941176, 1,
-0.2360814, -0.7009565, -2.532266, 0, 1, 0.5019608, 1,
-0.2304429, 0.1487483, -0.6560208, 0, 1, 0.509804, 1,
-0.2285424, 0.08608482, -0.7689729, 0, 1, 0.5137255, 1,
-0.2270295, -0.3469683, -1.454866, 0, 1, 0.5215687, 1,
-0.2242338, -2.204731, -4.980074, 0, 1, 0.5254902, 1,
-0.2234882, 0.8149565, -1.683655, 0, 1, 0.5333334, 1,
-0.2228117, 1.39025, -1.543784, 0, 1, 0.5372549, 1,
-0.2214212, -1.462081, -3.290981, 0, 1, 0.5450981, 1,
-0.2190415, 0.2941583, 0.8160965, 0, 1, 0.5490196, 1,
-0.2127611, -0.6523889, -3.565885, 0, 1, 0.5568628, 1,
-0.2092494, 0.4926034, 0.5954348, 0, 1, 0.5607843, 1,
-0.2061773, 1.491636, -0.441029, 0, 1, 0.5686275, 1,
-0.2043812, -0.963976, -1.778968, 0, 1, 0.572549, 1,
-0.2030164, -0.5304994, -2.203079, 0, 1, 0.5803922, 1,
-0.1982283, -0.01772691, -0.8689012, 0, 1, 0.5843138, 1,
-0.1974029, -1.387368, -4.258915, 0, 1, 0.5921569, 1,
-0.1971298, 1.071395, -0.9122962, 0, 1, 0.5960785, 1,
-0.1942249, 0.3032107, 0.4349229, 0, 1, 0.6039216, 1,
-0.1897271, 0.657902, -0.650762, 0, 1, 0.6117647, 1,
-0.1873462, 0.7771141, -3.024845, 0, 1, 0.6156863, 1,
-0.1843794, -0.7432338, -3.60403, 0, 1, 0.6235294, 1,
-0.1776188, 0.6106345, -0.4470387, 0, 1, 0.627451, 1,
-0.1728783, 0.1797041, -0.3086371, 0, 1, 0.6352941, 1,
-0.1700796, 0.8110482, -2.170982, 0, 1, 0.6392157, 1,
-0.1684857, -0.4469329, -1.037831, 0, 1, 0.6470588, 1,
-0.1676372, -1.326366, -3.14554, 0, 1, 0.6509804, 1,
-0.1674744, 1.83128, 0.8367892, 0, 1, 0.6588235, 1,
-0.1621605, -0.03597591, -1.342507, 0, 1, 0.6627451, 1,
-0.1605114, 0.545996, -0.8487421, 0, 1, 0.6705883, 1,
-0.1540247, -0.7092312, -2.787649, 0, 1, 0.6745098, 1,
-0.1484391, -0.2937731, -4.493025, 0, 1, 0.682353, 1,
-0.1475845, 2.237373, -0.3760774, 0, 1, 0.6862745, 1,
-0.1470862, -0.6089737, -5.27064, 0, 1, 0.6941177, 1,
-0.1465014, 1.128002, 0.7517059, 0, 1, 0.7019608, 1,
-0.14579, 0.4459624, -0.07219047, 0, 1, 0.7058824, 1,
-0.1431207, 0.5741667, -0.3257556, 0, 1, 0.7137255, 1,
-0.1417034, 0.4243558, 3.033786, 0, 1, 0.7176471, 1,
-0.1414604, -1.516837, -2.530052, 0, 1, 0.7254902, 1,
-0.1356632, -0.1852576, -2.720221, 0, 1, 0.7294118, 1,
-0.1309831, 0.1283526, -1.289483, 0, 1, 0.7372549, 1,
-0.1273065, -0.5138867, -2.96836, 0, 1, 0.7411765, 1,
-0.1264243, -1.520894, -2.890968, 0, 1, 0.7490196, 1,
-0.122256, 0.2181249, -0.4229824, 0, 1, 0.7529412, 1,
-0.1202045, 0.5374718, -0.8310142, 0, 1, 0.7607843, 1,
-0.1177786, -0.06486338, -4.15425, 0, 1, 0.7647059, 1,
-0.1165907, 0.2410225, -1.297124, 0, 1, 0.772549, 1,
-0.1165384, -0.06507131, -1.845208, 0, 1, 0.7764706, 1,
-0.1118847, -0.2722925, -4.352264, 0, 1, 0.7843137, 1,
-0.1100996, -0.7489969, -2.736719, 0, 1, 0.7882353, 1,
-0.1080637, 0.8769194, -0.2542175, 0, 1, 0.7960784, 1,
-0.1063318, -0.2621894, -2.762325, 0, 1, 0.8039216, 1,
-0.1056878, 1.276843, -0.0138824, 0, 1, 0.8078431, 1,
-0.1052029, 0.6573109, 0.6933896, 0, 1, 0.8156863, 1,
-0.1012345, 0.5561801, 0.08817452, 0, 1, 0.8196079, 1,
-0.0839631, 0.6047507, 0.9788041, 0, 1, 0.827451, 1,
-0.08256941, -0.9746675, -4.488914, 0, 1, 0.8313726, 1,
-0.08075525, 0.2446802, 0.4889387, 0, 1, 0.8392157, 1,
-0.07829462, -1.749669, -3.805261, 0, 1, 0.8431373, 1,
-0.07695451, -2.107898, -2.551074, 0, 1, 0.8509804, 1,
-0.07248629, 0.1194912, -0.4943594, 0, 1, 0.854902, 1,
-0.06542843, 0.7805675, -1.561908, 0, 1, 0.8627451, 1,
-0.06499191, 0.2657428, -0.6505516, 0, 1, 0.8666667, 1,
-0.06365898, -0.6691523, -3.509784, 0, 1, 0.8745098, 1,
-0.06162281, -0.2824235, -2.118344, 0, 1, 0.8784314, 1,
-0.06037715, -1.226607, -1.903983, 0, 1, 0.8862745, 1,
-0.05652419, -1.04107, -3.641746, 0, 1, 0.8901961, 1,
-0.05308551, 0.3337149, -0.8882217, 0, 1, 0.8980392, 1,
-0.03945808, -2.197044, -3.172724, 0, 1, 0.9058824, 1,
-0.03406061, -0.1416898, -3.586016, 0, 1, 0.9098039, 1,
-0.03399032, -0.8236011, -4.421279, 0, 1, 0.9176471, 1,
-0.03376145, -0.04752202, -3.099119, 0, 1, 0.9215686, 1,
-0.02978981, -0.7419167, -3.405038, 0, 1, 0.9294118, 1,
-0.02881145, -0.1159797, -3.513556, 0, 1, 0.9333333, 1,
-0.02725224, -0.4132029, -3.601679, 0, 1, 0.9411765, 1,
-0.02653495, 0.2452433, 1.187402, 0, 1, 0.945098, 1,
-0.01968294, 0.3085855, 2.29684, 0, 1, 0.9529412, 1,
-0.01812206, 0.3211799, 1.296439, 0, 1, 0.9568627, 1,
-0.01805306, -1.991942, -1.629602, 0, 1, 0.9647059, 1,
-0.01800099, -0.5461546, -2.045312, 0, 1, 0.9686275, 1,
-0.01168577, -0.150631, -2.774512, 0, 1, 0.9764706, 1,
-0.01051025, 1.084092, 0.9165969, 0, 1, 0.9803922, 1,
-0.01045005, 0.001469569, -1.961614, 0, 1, 0.9882353, 1,
-0.00906602, -0.1573749, -4.070633, 0, 1, 0.9921569, 1,
-0.008826842, -0.8517926, -3.576996, 0, 1, 1, 1,
-0.008793432, 0.05565848, -0.04338285, 0, 0.9921569, 1, 1,
-0.00667956, 0.1817769, 0.291912, 0, 0.9882353, 1, 1,
-0.002778372, 0.8758675, 0.2633607, 0, 0.9803922, 1, 1,
0.001333357, -0.7865439, 3.607936, 0, 0.9764706, 1, 1,
0.006569775, -1.465812, 2.324473, 0, 0.9686275, 1, 1,
0.006605464, 1.260488, 1.721358, 0, 0.9647059, 1, 1,
0.01204781, 1.035437, -0.3782324, 0, 0.9568627, 1, 1,
0.01956853, 0.4864895, 2.725299, 0, 0.9529412, 1, 1,
0.023926, -0.5373349, 3.951202, 0, 0.945098, 1, 1,
0.02701374, 0.8651667, 2.030021, 0, 0.9411765, 1, 1,
0.0287874, -1.626251, 1.83021, 0, 0.9333333, 1, 1,
0.03344056, -0.5092476, 3.084238, 0, 0.9294118, 1, 1,
0.03901447, -2.102772, 4.548125, 0, 0.9215686, 1, 1,
0.03999034, -0.2395661, 4.123568, 0, 0.9176471, 1, 1,
0.04274861, 0.7996536, -0.1165452, 0, 0.9098039, 1, 1,
0.04536302, -0.9132242, 3.843419, 0, 0.9058824, 1, 1,
0.04609401, -0.3620366, 3.952404, 0, 0.8980392, 1, 1,
0.04787523, -0.03850619, 2.437506, 0, 0.8901961, 1, 1,
0.05527704, -1.613008, 3.415274, 0, 0.8862745, 1, 1,
0.05855476, -0.3466714, 2.27339, 0, 0.8784314, 1, 1,
0.06005258, -0.5022298, 4.032313, 0, 0.8745098, 1, 1,
0.06166326, -0.983274, 4.286549, 0, 0.8666667, 1, 1,
0.06471659, -2.74888, 4.487945, 0, 0.8627451, 1, 1,
0.06483337, -1.426086, 3.096066, 0, 0.854902, 1, 1,
0.06496134, -1.273367, 3.104205, 0, 0.8509804, 1, 1,
0.06505162, 2.174572, -0.371197, 0, 0.8431373, 1, 1,
0.06788059, -0.3862982, 2.553978, 0, 0.8392157, 1, 1,
0.07248001, 0.2921067, 0.3385645, 0, 0.8313726, 1, 1,
0.07256018, 0.0460985, 1.586774, 0, 0.827451, 1, 1,
0.07531895, 1.153105, -1.013012, 0, 0.8196079, 1, 1,
0.07625778, -1.689018, 3.099588, 0, 0.8156863, 1, 1,
0.07675186, -1.069431, 3.130029, 0, 0.8078431, 1, 1,
0.07745247, -1.463933, 1.697627, 0, 0.8039216, 1, 1,
0.08319291, -0.4332718, 4.021229, 0, 0.7960784, 1, 1,
0.08344668, -0.07568847, 1.388677, 0, 0.7882353, 1, 1,
0.0863765, 0.6815147, 0.1190616, 0, 0.7843137, 1, 1,
0.08767915, -0.9821558, 4.223483, 0, 0.7764706, 1, 1,
0.08825296, 1.003269, 0.4829162, 0, 0.772549, 1, 1,
0.0887276, -0.414958, 2.817482, 0, 0.7647059, 1, 1,
0.09240875, 0.02620265, 1.807553, 0, 0.7607843, 1, 1,
0.09304079, 1.145169, -1.334265, 0, 0.7529412, 1, 1,
0.09402037, -1.882357, 4.380498, 0, 0.7490196, 1, 1,
0.0956153, 0.8774104, -0.1132721, 0, 0.7411765, 1, 1,
0.09680054, -0.8293294, 3.884381, 0, 0.7372549, 1, 1,
0.1003417, 0.4651637, 1.178973, 0, 0.7294118, 1, 1,
0.1022417, 0.1902288, 0.9170901, 0, 0.7254902, 1, 1,
0.1042302, 1.335996, 1.202399, 0, 0.7176471, 1, 1,
0.1047059, 0.2710952, 1.278097, 0, 0.7137255, 1, 1,
0.1078011, -1.222369, 1.997836, 0, 0.7058824, 1, 1,
0.1102714, 0.03725677, 1.674604, 0, 0.6980392, 1, 1,
0.1117916, 1.293319, 0.2396545, 0, 0.6941177, 1, 1,
0.112142, -0.7246569, 3.866342, 0, 0.6862745, 1, 1,
0.1123263, -0.6634247, 3.697163, 0, 0.682353, 1, 1,
0.1150632, -2.375422, 3.052906, 0, 0.6745098, 1, 1,
0.1155889, 0.5870996, 0.1579814, 0, 0.6705883, 1, 1,
0.1167096, 0.1600491, -0.4653896, 0, 0.6627451, 1, 1,
0.1181439, -0.3637851, 1.910896, 0, 0.6588235, 1, 1,
0.1191798, 0.1661408, -0.7361774, 0, 0.6509804, 1, 1,
0.1211362, 0.3973958, 2.678261, 0, 0.6470588, 1, 1,
0.1252489, -1.44296, 4.489556, 0, 0.6392157, 1, 1,
0.128027, 0.1813335, 0.9258558, 0, 0.6352941, 1, 1,
0.1367295, 1.07874, -0.4516202, 0, 0.627451, 1, 1,
0.1505542, -1.193171, 3.290005, 0, 0.6235294, 1, 1,
0.1515933, 1.434251, -0.7052845, 0, 0.6156863, 1, 1,
0.1535976, 0.5606738, 0.1087903, 0, 0.6117647, 1, 1,
0.1538988, 1.900708, 0.1934094, 0, 0.6039216, 1, 1,
0.1539695, -1.105719, 3.712774, 0, 0.5960785, 1, 1,
0.1546932, -1.625709, 1.136729, 0, 0.5921569, 1, 1,
0.1572163, -1.494893, 2.407876, 0, 0.5843138, 1, 1,
0.1621919, 0.486797, 0.5961282, 0, 0.5803922, 1, 1,
0.1627129, -2.059583, 3.724434, 0, 0.572549, 1, 1,
0.1628809, -1.566311, 2.96829, 0, 0.5686275, 1, 1,
0.164043, -0.007954524, 0.7379183, 0, 0.5607843, 1, 1,
0.1647497, -1.24464, 2.274606, 0, 0.5568628, 1, 1,
0.1666314, -0.8715192, 3.033403, 0, 0.5490196, 1, 1,
0.1678473, 1.380099, -1.605001, 0, 0.5450981, 1, 1,
0.1785223, -0.02618704, 0.5007865, 0, 0.5372549, 1, 1,
0.1809135, -0.1812411, 2.890089, 0, 0.5333334, 1, 1,
0.1927352, 1.764429, -0.8383051, 0, 0.5254902, 1, 1,
0.1936249, 0.020143, 2.139126, 0, 0.5215687, 1, 1,
0.1970057, 1.022546, 1.532016, 0, 0.5137255, 1, 1,
0.1983669, -1.004642, 4.444562, 0, 0.509804, 1, 1,
0.1987182, -0.7513698, 2.717695, 0, 0.5019608, 1, 1,
0.2012551, 1.355005, -0.8844305, 0, 0.4941176, 1, 1,
0.20243, 0.4351629, 1.636788, 0, 0.4901961, 1, 1,
0.2030277, -1.030229, 1.694148, 0, 0.4823529, 1, 1,
0.203187, 0.04431433, -1.553824, 0, 0.4784314, 1, 1,
0.2051004, 0.255248, 0.2630008, 0, 0.4705882, 1, 1,
0.2064373, 0.9323969, -0.1104757, 0, 0.4666667, 1, 1,
0.2091347, 1.635411, 0.4113264, 0, 0.4588235, 1, 1,
0.2122521, -1.024901, 4.165875, 0, 0.454902, 1, 1,
0.2129054, 0.05204134, 1.889385, 0, 0.4470588, 1, 1,
0.2151131, -0.02057316, 1.375434, 0, 0.4431373, 1, 1,
0.2162913, -0.6924694, 2.4626, 0, 0.4352941, 1, 1,
0.221581, -1.016993, 2.888302, 0, 0.4313726, 1, 1,
0.2239199, 1.118594, -0.1675758, 0, 0.4235294, 1, 1,
0.2241375, 0.202867, 1.600351, 0, 0.4196078, 1, 1,
0.2278167, 0.3456953, 0.006240915, 0, 0.4117647, 1, 1,
0.2328773, 0.9734274, 2.609969, 0, 0.4078431, 1, 1,
0.2342898, -0.4409874, 2.516627, 0, 0.4, 1, 1,
0.2383471, -0.241203, 2.349504, 0, 0.3921569, 1, 1,
0.2411595, 0.0140724, 3.023287, 0, 0.3882353, 1, 1,
0.2446838, -0.2847719, 0.9803311, 0, 0.3803922, 1, 1,
0.2581523, 1.629387, 1.097037, 0, 0.3764706, 1, 1,
0.2612927, -2.228978, 4.01219, 0, 0.3686275, 1, 1,
0.2618257, 0.2464646, 1.936911, 0, 0.3647059, 1, 1,
0.2641587, 0.5798783, -0.07169634, 0, 0.3568628, 1, 1,
0.2652096, 0.7218811, 1.389432, 0, 0.3529412, 1, 1,
0.2685033, -0.07792863, 3.566914, 0, 0.345098, 1, 1,
0.2688352, 0.5825498, 0.3100671, 0, 0.3411765, 1, 1,
0.2695121, -1.329802, 3.735813, 0, 0.3333333, 1, 1,
0.2704865, 1.140397, 1.255289, 0, 0.3294118, 1, 1,
0.2709437, -1.42878, 2.583766, 0, 0.3215686, 1, 1,
0.2743509, -0.4120244, 2.038882, 0, 0.3176471, 1, 1,
0.2806238, -1.235864, 3.95926, 0, 0.3098039, 1, 1,
0.2817772, -2.113505, 4.338778, 0, 0.3058824, 1, 1,
0.2821971, -1.898231, 3.755047, 0, 0.2980392, 1, 1,
0.2835422, -0.2930063, 0.4902144, 0, 0.2901961, 1, 1,
0.2838525, -1.066091, 2.319575, 0, 0.2862745, 1, 1,
0.2870076, 1.463838, 1.143303, 0, 0.2784314, 1, 1,
0.302426, -0.3573409, 1.4384, 0, 0.2745098, 1, 1,
0.3024645, 0.614654, 0.4879729, 0, 0.2666667, 1, 1,
0.3040144, -0.9611732, 2.754846, 0, 0.2627451, 1, 1,
0.3058503, -0.6854317, 2.690487, 0, 0.254902, 1, 1,
0.3064603, 0.8310453, -0.2721508, 0, 0.2509804, 1, 1,
0.3065687, 0.09992446, 0.735562, 0, 0.2431373, 1, 1,
0.3069271, -1.065784, 3.581424, 0, 0.2392157, 1, 1,
0.3075398, -0.1184805, 1.738468, 0, 0.2313726, 1, 1,
0.3084096, -0.4279918, 1.905346, 0, 0.227451, 1, 1,
0.3102489, 0.5175682, -0.6130316, 0, 0.2196078, 1, 1,
0.311528, -0.3388262, 2.764313, 0, 0.2156863, 1, 1,
0.311932, 0.07755571, 1.080534, 0, 0.2078431, 1, 1,
0.3148792, -0.1300175, 1.033525, 0, 0.2039216, 1, 1,
0.3153464, 1.02255, 1.416429, 0, 0.1960784, 1, 1,
0.3209015, -0.7262315, 4.57479, 0, 0.1882353, 1, 1,
0.322924, -0.332132, 2.931151, 0, 0.1843137, 1, 1,
0.324144, 0.1889084, 0.6742768, 0, 0.1764706, 1, 1,
0.3261274, -0.01121848, 2.786947, 0, 0.172549, 1, 1,
0.328726, 0.1989921, 1.488673, 0, 0.1647059, 1, 1,
0.3292087, -1.206115, 3.532347, 0, 0.1607843, 1, 1,
0.3293492, -0.6671095, 2.4845, 0, 0.1529412, 1, 1,
0.3388454, -1.004619, 1.085306, 0, 0.1490196, 1, 1,
0.3401824, -2.539613, 3.466497, 0, 0.1411765, 1, 1,
0.3447334, -0.4043595, 1.427934, 0, 0.1372549, 1, 1,
0.3473287, 0.0003480529, 1.871207, 0, 0.1294118, 1, 1,
0.3475755, 1.87997, -0.1944281, 0, 0.1254902, 1, 1,
0.3515416, 0.2360352, 0.7919586, 0, 0.1176471, 1, 1,
0.3528434, -0.4515939, 2.80865, 0, 0.1137255, 1, 1,
0.3618731, 1.669413, -2.114031, 0, 0.1058824, 1, 1,
0.3632839, -0.8143809, 2.176335, 0, 0.09803922, 1, 1,
0.3665581, 0.6271557, 0.6983643, 0, 0.09411765, 1, 1,
0.3678225, 0.1538609, 1.780736, 0, 0.08627451, 1, 1,
0.3685137, -0.5087616, 3.389103, 0, 0.08235294, 1, 1,
0.3712476, -1.704592, 2.201787, 0, 0.07450981, 1, 1,
0.3720363, 0.7728381, 0.2902715, 0, 0.07058824, 1, 1,
0.3736456, -0.01315901, 1.199897, 0, 0.0627451, 1, 1,
0.3776351, 0.1610541, 2.987734, 0, 0.05882353, 1, 1,
0.377668, -0.586371, 3.399355, 0, 0.05098039, 1, 1,
0.3782378, 0.4991244, 0.9853335, 0, 0.04705882, 1, 1,
0.3791542, 0.47544, -0.4273976, 0, 0.03921569, 1, 1,
0.3816509, 1.712858, -0.3863827, 0, 0.03529412, 1, 1,
0.3832395, 0.7272742, 1.549116, 0, 0.02745098, 1, 1,
0.3854158, -0.2481099, 1.255271, 0, 0.02352941, 1, 1,
0.3885379, 0.04782808, 3.529139, 0, 0.01568628, 1, 1,
0.3952324, 1.457166, -1.416218, 0, 0.01176471, 1, 1,
0.4002628, 1.30818, -0.04843329, 0, 0.003921569, 1, 1,
0.4078596, 1.102008, 1.311081, 0.003921569, 0, 1, 1,
0.4094863, 0.8552537, 1.236938, 0.007843138, 0, 1, 1,
0.4114848, 0.8859894, 0.1568389, 0.01568628, 0, 1, 1,
0.4123484, -1.012846, 3.748555, 0.01960784, 0, 1, 1,
0.4126913, -0.7369435, 1.501315, 0.02745098, 0, 1, 1,
0.4145943, -0.05585082, 1.477452, 0.03137255, 0, 1, 1,
0.417417, 1.193756, -1.142838, 0.03921569, 0, 1, 1,
0.420249, 0.2725029, 1.594607, 0.04313726, 0, 1, 1,
0.422381, -0.1307224, 2.016884, 0.05098039, 0, 1, 1,
0.4229074, -0.1963656, 1.875326, 0.05490196, 0, 1, 1,
0.4269756, 1.729922, -0.09565921, 0.0627451, 0, 1, 1,
0.4285922, -0.5525061, 1.612437, 0.06666667, 0, 1, 1,
0.4296931, -0.4084898, 2.207731, 0.07450981, 0, 1, 1,
0.4355817, -0.2070405, 1.405045, 0.07843138, 0, 1, 1,
0.4375448, 1.035341, -0.6788734, 0.08627451, 0, 1, 1,
0.4412363, -0.3618471, 2.15178, 0.09019608, 0, 1, 1,
0.4417604, -0.4365864, 3.708134, 0.09803922, 0, 1, 1,
0.4434952, -0.4924379, 3.158998, 0.1058824, 0, 1, 1,
0.4456694, -0.3612791, 1.638261, 0.1098039, 0, 1, 1,
0.4501904, 1.338672, 1.387216, 0.1176471, 0, 1, 1,
0.4526813, 1.824462, -0.6363485, 0.1215686, 0, 1, 1,
0.4553176, -1.19311, 2.219224, 0.1294118, 0, 1, 1,
0.4568629, 0.8222649, 1.414073, 0.1333333, 0, 1, 1,
0.4610504, 1.723941, 2.248147, 0.1411765, 0, 1, 1,
0.4615717, -2.576744, 2.564111, 0.145098, 0, 1, 1,
0.4677275, 0.2755844, 0.2170949, 0.1529412, 0, 1, 1,
0.4738849, -0.6846464, 0.9567441, 0.1568628, 0, 1, 1,
0.4742306, -1.609596, 1.761561, 0.1647059, 0, 1, 1,
0.4753087, -0.6207482, 2.885921, 0.1686275, 0, 1, 1,
0.4817879, 1.064077, -0.5605957, 0.1764706, 0, 1, 1,
0.4849641, -0.977376, 2.517401, 0.1803922, 0, 1, 1,
0.4859993, -0.3196147, 3.538439, 0.1882353, 0, 1, 1,
0.4878646, -0.7715087, 1.100261, 0.1921569, 0, 1, 1,
0.4885019, -0.1521002, 3.294278, 0.2, 0, 1, 1,
0.4928932, 0.346226, 1.265568, 0.2078431, 0, 1, 1,
0.4936896, -1.315476, 4.627975, 0.2117647, 0, 1, 1,
0.501021, -1.908037, 4.822879, 0.2196078, 0, 1, 1,
0.5043034, -0.2849948, 2.782268, 0.2235294, 0, 1, 1,
0.5043108, 0.8101332, -0.03649337, 0.2313726, 0, 1, 1,
0.5056599, 1.3112, -0.7534812, 0.2352941, 0, 1, 1,
0.5065901, 0.3973053, 2.009966, 0.2431373, 0, 1, 1,
0.510725, 0.3155983, -0.1437921, 0.2470588, 0, 1, 1,
0.5173184, -0.5862542, 2.137481, 0.254902, 0, 1, 1,
0.5183245, -0.1054473, 1.396139, 0.2588235, 0, 1, 1,
0.525444, 1.653674, 1.527843, 0.2666667, 0, 1, 1,
0.5273622, -0.3861389, 1.707446, 0.2705882, 0, 1, 1,
0.5281383, 0.3745635, 0.9393595, 0.2784314, 0, 1, 1,
0.5285752, -0.7591485, 1.500325, 0.282353, 0, 1, 1,
0.5312814, -0.389055, 1.635468, 0.2901961, 0, 1, 1,
0.5480931, -0.8596348, 2.127513, 0.2941177, 0, 1, 1,
0.5524487, 1.167001, 1.281469, 0.3019608, 0, 1, 1,
0.5580111, -0.7547871, 1.774772, 0.3098039, 0, 1, 1,
0.5604627, 1.005865, 1.160142, 0.3137255, 0, 1, 1,
0.5625781, -1.450943, 3.509173, 0.3215686, 0, 1, 1,
0.5656564, 0.5437362, -1.384326, 0.3254902, 0, 1, 1,
0.570136, 1.788357, 0.9926194, 0.3333333, 0, 1, 1,
0.5720341, 0.6468628, 3.185622, 0.3372549, 0, 1, 1,
0.5770255, -1.324091, 3.744374, 0.345098, 0, 1, 1,
0.5775683, -0.1633094, 2.059761, 0.3490196, 0, 1, 1,
0.5806345, -0.2853605, 0.04674165, 0.3568628, 0, 1, 1,
0.5877252, -0.1855238, 2.71689, 0.3607843, 0, 1, 1,
0.5890763, 0.3090283, 0.4976842, 0.3686275, 0, 1, 1,
0.5904616, -0.9533795, 2.969941, 0.372549, 0, 1, 1,
0.5968921, -0.726147, 0.6639773, 0.3803922, 0, 1, 1,
0.5991951, -0.9033526, 3.927061, 0.3843137, 0, 1, 1,
0.6029631, 0.6771019, 1.551375, 0.3921569, 0, 1, 1,
0.6064149, 0.2984423, 1.345472, 0.3960784, 0, 1, 1,
0.6066993, -0.0866074, 1.314029, 0.4039216, 0, 1, 1,
0.6078891, 0.6812744, 1.271222, 0.4117647, 0, 1, 1,
0.6093529, -0.367962, 3.040017, 0.4156863, 0, 1, 1,
0.6094975, -0.9794951, 4.226077, 0.4235294, 0, 1, 1,
0.6155153, 0.4604044, 1.072051, 0.427451, 0, 1, 1,
0.6188304, -1.512102, 4.229762, 0.4352941, 0, 1, 1,
0.6207737, -1.722111, 1.975326, 0.4392157, 0, 1, 1,
0.6246093, -0.717568, 2.409769, 0.4470588, 0, 1, 1,
0.629311, -0.2532568, -0.2535717, 0.4509804, 0, 1, 1,
0.6336922, -0.5215953, 3.06839, 0.4588235, 0, 1, 1,
0.6361321, -0.4868829, 3.012629, 0.4627451, 0, 1, 1,
0.6410525, -0.6765102, 2.649805, 0.4705882, 0, 1, 1,
0.6468804, 0.8068797, 0.7846572, 0.4745098, 0, 1, 1,
0.6500899, -0.9129454, 1.687259, 0.4823529, 0, 1, 1,
0.6534696, 0.2983365, 0.6201748, 0.4862745, 0, 1, 1,
0.653626, 0.4111641, 0.6963842, 0.4941176, 0, 1, 1,
0.6700855, 0.1465278, 1.358951, 0.5019608, 0, 1, 1,
0.6703166, 1.578797, 0.5582254, 0.5058824, 0, 1, 1,
0.6801905, -0.5400444, 1.972131, 0.5137255, 0, 1, 1,
0.680332, 0.1460825, 2.52819, 0.5176471, 0, 1, 1,
0.6832417, -0.9520746, 1.272446, 0.5254902, 0, 1, 1,
0.6846854, -0.9187564, 3.995375, 0.5294118, 0, 1, 1,
0.6875204, 0.3221933, 0.6719464, 0.5372549, 0, 1, 1,
0.6886076, -1.338343, 2.871734, 0.5411765, 0, 1, 1,
0.6890423, 1.550024, 0.3972089, 0.5490196, 0, 1, 1,
0.6896356, 0.4362166, 1.033828, 0.5529412, 0, 1, 1,
0.6963141, -0.5159001, 2.130786, 0.5607843, 0, 1, 1,
0.698358, 1.587284, 1.859697, 0.5647059, 0, 1, 1,
0.7140431, -1.189361, 1.983231, 0.572549, 0, 1, 1,
0.717016, 1.106467, 0.7086311, 0.5764706, 0, 1, 1,
0.7205189, 1.45927, 0.03465848, 0.5843138, 0, 1, 1,
0.7221446, 1.321659, 0.5414129, 0.5882353, 0, 1, 1,
0.7227957, 0.02972537, 2.309762, 0.5960785, 0, 1, 1,
0.724113, -1.075144, 2.553744, 0.6039216, 0, 1, 1,
0.7246717, 0.9878572, 2.396422, 0.6078432, 0, 1, 1,
0.730719, 2.081907, 1.789404, 0.6156863, 0, 1, 1,
0.7327101, -1.322078, 3.948092, 0.6196079, 0, 1, 1,
0.7365332, 0.5250538, 1.5528, 0.627451, 0, 1, 1,
0.7384539, -1.314444, 0.8552803, 0.6313726, 0, 1, 1,
0.7412256, -1.423035, 3.337072, 0.6392157, 0, 1, 1,
0.741891, 0.4709275, 3.112813, 0.6431373, 0, 1, 1,
0.7433429, 0.116596, 1.772353, 0.6509804, 0, 1, 1,
0.7442187, -0.2741201, 2.131266, 0.654902, 0, 1, 1,
0.7445703, 0.1830832, -0.6760949, 0.6627451, 0, 1, 1,
0.7457344, -0.2777849, 2.998464, 0.6666667, 0, 1, 1,
0.7472774, -0.7172387, 1.86459, 0.6745098, 0, 1, 1,
0.7513985, 0.7446972, 0.03024544, 0.6784314, 0, 1, 1,
0.7636043, -0.9296311, 3.206884, 0.6862745, 0, 1, 1,
0.7640036, 0.5244494, 0.9745257, 0.6901961, 0, 1, 1,
0.7648646, -0.754907, 0.9498789, 0.6980392, 0, 1, 1,
0.772747, -0.06287273, 2.618649, 0.7058824, 0, 1, 1,
0.7787887, -1.286251, 1.55336, 0.7098039, 0, 1, 1,
0.7863729, -0.06560982, 1.374809, 0.7176471, 0, 1, 1,
0.7876414, -0.3238811, 2.04055, 0.7215686, 0, 1, 1,
0.7879011, -1.482164, 0.3280106, 0.7294118, 0, 1, 1,
0.7930897, -1.369926, 2.170566, 0.7333333, 0, 1, 1,
0.7963844, -0.1112945, 1.289953, 0.7411765, 0, 1, 1,
0.8007036, -1.179147, 2.069583, 0.7450981, 0, 1, 1,
0.8021267, -0.7008448, 1.798345, 0.7529412, 0, 1, 1,
0.8057267, 2.120199, 0.6907501, 0.7568628, 0, 1, 1,
0.8059349, 0.3574664, 0.8499364, 0.7647059, 0, 1, 1,
0.8078089, -2.184507, 3.079326, 0.7686275, 0, 1, 1,
0.8100725, -0.1324157, 0.3624604, 0.7764706, 0, 1, 1,
0.8130922, 0.6114037, -0.4889958, 0.7803922, 0, 1, 1,
0.8163779, -0.2092213, 0.1070509, 0.7882353, 0, 1, 1,
0.8206877, 0.2714603, 0.9483535, 0.7921569, 0, 1, 1,
0.8214153, -1.246124, 2.398042, 0.8, 0, 1, 1,
0.8250666, -0.1226964, 1.282505, 0.8078431, 0, 1, 1,
0.8252199, 0.4198337, 2.441274, 0.8117647, 0, 1, 1,
0.8371625, -1.355012, 2.950527, 0.8196079, 0, 1, 1,
0.8455688, -0.2527409, 1.667285, 0.8235294, 0, 1, 1,
0.8491761, 1.29835, 0.8263827, 0.8313726, 0, 1, 1,
0.8531625, -0.2639539, 2.819955, 0.8352941, 0, 1, 1,
0.8561567, -0.1758563, 1.353485, 0.8431373, 0, 1, 1,
0.8608848, -0.1336646, 1.43197, 0.8470588, 0, 1, 1,
0.862342, 0.8939612, 0.4044291, 0.854902, 0, 1, 1,
0.8653591, 0.9658927, -0.592726, 0.8588235, 0, 1, 1,
0.8779746, 0.5119861, 1.688114, 0.8666667, 0, 1, 1,
0.881034, -0.7402161, 1.004192, 0.8705882, 0, 1, 1,
0.881229, 0.5487932, 0.3847962, 0.8784314, 0, 1, 1,
0.8880109, -0.7798649, 1.126444, 0.8823529, 0, 1, 1,
0.8889763, -0.2255147, 1.916902, 0.8901961, 0, 1, 1,
0.9007625, -1.039732, 4.086064, 0.8941177, 0, 1, 1,
0.9089735, -0.1750463, 0.9497346, 0.9019608, 0, 1, 1,
0.9148783, 1.386268, -0.6459666, 0.9098039, 0, 1, 1,
0.9156103, 1.571674, -0.1024242, 0.9137255, 0, 1, 1,
0.9183847, 0.2637994, -0.1208168, 0.9215686, 0, 1, 1,
0.928305, 0.051778, 1.561065, 0.9254902, 0, 1, 1,
0.9293106, 0.1987056, 1.341528, 0.9333333, 0, 1, 1,
0.9295765, 1.34755, 0.1672362, 0.9372549, 0, 1, 1,
0.9334027, -0.2873112, 1.411436, 0.945098, 0, 1, 1,
0.9337429, 1.11222, 0.9377785, 0.9490196, 0, 1, 1,
0.9341394, -1.316699, 2.92314, 0.9568627, 0, 1, 1,
0.9371673, 1.135425, -0.6555693, 0.9607843, 0, 1, 1,
0.9408329, 1.367476, 1.619937, 0.9686275, 0, 1, 1,
0.9463679, 0.06780155, -0.2349412, 0.972549, 0, 1, 1,
0.9477742, 0.05990284, 0.5987256, 0.9803922, 0, 1, 1,
0.9494731, 1.048059, 1.650407, 0.9843137, 0, 1, 1,
0.9494973, -0.7351447, 2.869429, 0.9921569, 0, 1, 1,
0.9611835, 0.5659755, 1.317894, 0.9960784, 0, 1, 1,
0.9635758, -0.4355237, 2.802427, 1, 0, 0.9960784, 1,
0.9644272, 0.2840697, 1.655601, 1, 0, 0.9882353, 1,
0.9648651, -0.05415107, 1.384706, 1, 0, 0.9843137, 1,
0.9651824, -0.381511, 1.346498, 1, 0, 0.9764706, 1,
0.9667506, 0.9680572, 0.3002608, 1, 0, 0.972549, 1,
0.9673856, 0.1722287, 2.243504, 1, 0, 0.9647059, 1,
0.9699932, 1.026401, 1.956944, 1, 0, 0.9607843, 1,
0.9775093, -0.06560907, 1.336939, 1, 0, 0.9529412, 1,
0.9825808, -1.968066, 0.08025447, 1, 0, 0.9490196, 1,
0.9957473, 1.026175, 1.337946, 1, 0, 0.9411765, 1,
1.009497, 0.2081867, 1.348368, 1, 0, 0.9372549, 1,
1.012981, 1.679457, -1.18462, 1, 0, 0.9294118, 1,
1.014871, -0.05174481, 0.7322441, 1, 0, 0.9254902, 1,
1.021355, 0.3776443, 2.912268, 1, 0, 0.9176471, 1,
1.031072, 1.661042, 1.20958, 1, 0, 0.9137255, 1,
1.035369, -0.3838899, 3.558259, 1, 0, 0.9058824, 1,
1.046128, 0.8937438, 2.309012, 1, 0, 0.9019608, 1,
1.046858, 0.7997527, -0.007094754, 1, 0, 0.8941177, 1,
1.053025, -0.01300542, 1.405002, 1, 0, 0.8862745, 1,
1.053957, -0.05260177, 1.541889, 1, 0, 0.8823529, 1,
1.054688, -0.9142826, 1.780203, 1, 0, 0.8745098, 1,
1.057216, -1.519171, 1.783632, 1, 0, 0.8705882, 1,
1.065487, 1.374222, 1.433735, 1, 0, 0.8627451, 1,
1.075601, -0.09433363, 1.441219, 1, 0, 0.8588235, 1,
1.083598, -0.5075738, 2.844506, 1, 0, 0.8509804, 1,
1.089537, 0.3903003, 0.8137772, 1, 0, 0.8470588, 1,
1.090368, 0.2618017, 2.046009, 1, 0, 0.8392157, 1,
1.094322, 1.542053, -0.3975768, 1, 0, 0.8352941, 1,
1.100117, 0.6757846, 1.414016, 1, 0, 0.827451, 1,
1.100718, -0.7543573, 1.875572, 1, 0, 0.8235294, 1,
1.102549, -1.707659, 2.833196, 1, 0, 0.8156863, 1,
1.102833, 0.4513063, 2.833272, 1, 0, 0.8117647, 1,
1.104049, 2.137881, 1.116766, 1, 0, 0.8039216, 1,
1.126482, 1.498728, 3.223929, 1, 0, 0.7960784, 1,
1.126885, 0.4891312, 2.163449, 1, 0, 0.7921569, 1,
1.133064, -0.7101567, 2.094324, 1, 0, 0.7843137, 1,
1.139813, -0.1226016, 2.14929, 1, 0, 0.7803922, 1,
1.141072, -0.4179277, 2.338175, 1, 0, 0.772549, 1,
1.141566, 0.9614397, 0.3543755, 1, 0, 0.7686275, 1,
1.142724, -0.08820145, 0.4012514, 1, 0, 0.7607843, 1,
1.147585, -1.117231, 0.7358466, 1, 0, 0.7568628, 1,
1.147867, 1.268061, -1.355742, 1, 0, 0.7490196, 1,
1.150012, -2.599884, 3.516093, 1, 0, 0.7450981, 1,
1.150227, 0.5944867, 1.441364, 1, 0, 0.7372549, 1,
1.154865, 0.5988538, 1.862275, 1, 0, 0.7333333, 1,
1.162938, -0.8803771, 1.018909, 1, 0, 0.7254902, 1,
1.165974, -0.29649, 1.708562, 1, 0, 0.7215686, 1,
1.173617, -0.6988162, 2.476884, 1, 0, 0.7137255, 1,
1.193958, -0.1762738, 1.691539, 1, 0, 0.7098039, 1,
1.203063, 2.40341, 0.4597642, 1, 0, 0.7019608, 1,
1.212902, 0.2578002, 1.31195, 1, 0, 0.6941177, 1,
1.220637, -0.1007042, -0.02298738, 1, 0, 0.6901961, 1,
1.227879, -2.719841, 3.787448, 1, 0, 0.682353, 1,
1.233759, -0.4111072, 1.696886, 1, 0, 0.6784314, 1,
1.23674, 0.4218187, 2.756207, 1, 0, 0.6705883, 1,
1.24045, -0.2006845, 2.350115, 1, 0, 0.6666667, 1,
1.255598, 1.985124, 1.324123, 1, 0, 0.6588235, 1,
1.265872, -1.484447, 3.478441, 1, 0, 0.654902, 1,
1.267514, -0.3522805, 1.634515, 1, 0, 0.6470588, 1,
1.268308, -0.3141674, 0.7197678, 1, 0, 0.6431373, 1,
1.270391, -2.050538, 1.680474, 1, 0, 0.6352941, 1,
1.274786, -1.084697, 2.205539, 1, 0, 0.6313726, 1,
1.274962, -0.09972499, 1.941045, 1, 0, 0.6235294, 1,
1.279493, -0.3814776, 1.672419, 1, 0, 0.6196079, 1,
1.280895, 2.282224, -0.6251773, 1, 0, 0.6117647, 1,
1.295205, 3.107085, 0.9202317, 1, 0, 0.6078432, 1,
1.30303, -0.02452874, 0.6629719, 1, 0, 0.6, 1,
1.310254, 0.3532195, 1.531577, 1, 0, 0.5921569, 1,
1.311506, 1.872506, -0.4370733, 1, 0, 0.5882353, 1,
1.319372, 0.04980087, 2.699863, 1, 0, 0.5803922, 1,
1.32288, -1.016442, 1.063292, 1, 0, 0.5764706, 1,
1.329909, -1.057675, 3.171689, 1, 0, 0.5686275, 1,
1.341405, -1.304201, 2.541787, 1, 0, 0.5647059, 1,
1.362828, -0.7018048, 2.003119, 1, 0, 0.5568628, 1,
1.370411, -2.008752, 3.535671, 1, 0, 0.5529412, 1,
1.379083, 2.313206, 1.064731, 1, 0, 0.5450981, 1,
1.389808, 0.4887615, -0.6544189, 1, 0, 0.5411765, 1,
1.390459, -0.4163209, 0.8100644, 1, 0, 0.5333334, 1,
1.404607, -1.086747, 1.872846, 1, 0, 0.5294118, 1,
1.407557, -0.3035154, 0.5965675, 1, 0, 0.5215687, 1,
1.415348, -0.9674892, 2.725419, 1, 0, 0.5176471, 1,
1.415846, -1.298914, 3.233936, 1, 0, 0.509804, 1,
1.417207, -0.1415397, 2.843681, 1, 0, 0.5058824, 1,
1.418096, -0.02637671, 1.335065, 1, 0, 0.4980392, 1,
1.419966, -0.1494486, 1.314841, 1, 0, 0.4901961, 1,
1.422345, -0.806057, 3.254355, 1, 0, 0.4862745, 1,
1.425082, 2.189838, 1.117383, 1, 0, 0.4784314, 1,
1.426791, -0.203161, 3.149219, 1, 0, 0.4745098, 1,
1.433388, -0.255074, 2.309541, 1, 0, 0.4666667, 1,
1.436249, -0.5393634, 1.693254, 1, 0, 0.4627451, 1,
1.439108, 0.9092737, 2.243054, 1, 0, 0.454902, 1,
1.448029, -1.074603, 3.573172, 1, 0, 0.4509804, 1,
1.462748, 0.7431005, -0.4097444, 1, 0, 0.4431373, 1,
1.466575, 0.7252661, 0.6500432, 1, 0, 0.4392157, 1,
1.481738, 0.6260346, 1.474643, 1, 0, 0.4313726, 1,
1.501653, -1.082, 1.155889, 1, 0, 0.427451, 1,
1.513642, 2.010252, 2.052646, 1, 0, 0.4196078, 1,
1.514326, 0.08004763, 2.389247, 1, 0, 0.4156863, 1,
1.523486, 1.514473, 0.1566317, 1, 0, 0.4078431, 1,
1.524491, 0.2731817, 3.31017, 1, 0, 0.4039216, 1,
1.524722, 0.3803367, 2.197969, 1, 0, 0.3960784, 1,
1.529886, -0.959416, 2.434035, 1, 0, 0.3882353, 1,
1.541345, -1.717005, 3.838913, 1, 0, 0.3843137, 1,
1.551114, 0.6506552, 1.073097, 1, 0, 0.3764706, 1,
1.553433, -1.190752, 2.234375, 1, 0, 0.372549, 1,
1.558406, 0.9856369, 0.4477699, 1, 0, 0.3647059, 1,
1.566051, 1.344178, 2.333285, 1, 0, 0.3607843, 1,
1.58127, 0.1886849, 2.620805, 1, 0, 0.3529412, 1,
1.599, -1.844609, 1.921506, 1, 0, 0.3490196, 1,
1.599783, 0.500811, 2.019077, 1, 0, 0.3411765, 1,
1.603186, 0.5449139, 2.314596, 1, 0, 0.3372549, 1,
1.607588, -0.0009106669, 0.7951364, 1, 0, 0.3294118, 1,
1.625376, 0.2921515, -0.3654203, 1, 0, 0.3254902, 1,
1.632453, -1.554414, 2.178775, 1, 0, 0.3176471, 1,
1.636389, -0.1861819, 2.585571, 1, 0, 0.3137255, 1,
1.644929, 1.585897, 2.673601, 1, 0, 0.3058824, 1,
1.663184, -0.7741652, 3.086141, 1, 0, 0.2980392, 1,
1.675526, -0.07132178, 1.789413, 1, 0, 0.2941177, 1,
1.682008, -0.1773504, 0.1709184, 1, 0, 0.2862745, 1,
1.686741, 0.9288312, 0.8195541, 1, 0, 0.282353, 1,
1.688302, 0.6943867, 0.3717824, 1, 0, 0.2745098, 1,
1.721562, 1.158318, 2.008609, 1, 0, 0.2705882, 1,
1.725661, -0.9618984, 2.88643, 1, 0, 0.2627451, 1,
1.72785, -0.9051426, 3.023846, 1, 0, 0.2588235, 1,
1.728487, -0.4287318, 0.983593, 1, 0, 0.2509804, 1,
1.744871, -0.09830333, 2.495237, 1, 0, 0.2470588, 1,
1.748622, 0.8637972, -1.016868, 1, 0, 0.2392157, 1,
1.777513, -1.48324, 2.39647, 1, 0, 0.2352941, 1,
1.790003, -0.01473393, 2.432577, 1, 0, 0.227451, 1,
1.810924, 0.5386088, 2.298127, 1, 0, 0.2235294, 1,
1.815539, 0.1131239, 0.7747571, 1, 0, 0.2156863, 1,
1.820665, -1.177518, 1.75843, 1, 0, 0.2117647, 1,
1.820766, 0.2515714, -0.4377358, 1, 0, 0.2039216, 1,
1.871181, -1.070543, 4.151677, 1, 0, 0.1960784, 1,
1.872037, -1.36392, 1.283855, 1, 0, 0.1921569, 1,
1.875342, 1.1388, -0.8708823, 1, 0, 0.1843137, 1,
1.877528, 2.260728, -0.04258557, 1, 0, 0.1803922, 1,
1.900231, 0.6550619, -0.197603, 1, 0, 0.172549, 1,
1.927838, 0.1094102, 1.504365, 1, 0, 0.1686275, 1,
1.932069, 1.426164, -1.031731, 1, 0, 0.1607843, 1,
1.933702, -0.553991, 2.091426, 1, 0, 0.1568628, 1,
1.982536, 0.369689, -0.3275734, 1, 0, 0.1490196, 1,
1.994631, 1.331911, 0.005268878, 1, 0, 0.145098, 1,
2.014659, -0.1644395, 1.990842, 1, 0, 0.1372549, 1,
2.043776, -0.2860329, 0.975192, 1, 0, 0.1333333, 1,
2.061753, -0.6635627, 0.2511227, 1, 0, 0.1254902, 1,
2.071315, 0.8232198, 1.382082, 1, 0, 0.1215686, 1,
2.086061, -0.1995126, 1.902355, 1, 0, 0.1137255, 1,
2.09483, -0.474374, 3.879335, 1, 0, 0.1098039, 1,
2.120645, -0.0981666, 1.016728, 1, 0, 0.1019608, 1,
2.173213, -0.0848444, -0.2254607, 1, 0, 0.09411765, 1,
2.17976, 0.67486, 2.264103, 1, 0, 0.09019608, 1,
2.184882, -1.515475, 1.243013, 1, 0, 0.08235294, 1,
2.263855, -0.9332687, 3.605116, 1, 0, 0.07843138, 1,
2.374082, -0.1400322, 2.03909, 1, 0, 0.07058824, 1,
2.47698, 1.234737, 1.499172, 1, 0, 0.06666667, 1,
2.499727, 1.245691, 1.215504, 1, 0, 0.05882353, 1,
2.524901, -0.866789, 2.616031, 1, 0, 0.05490196, 1,
2.526563, -0.1050514, 1.794551, 1, 0, 0.04705882, 1,
2.544848, -0.06075137, 0.9954157, 1, 0, 0.04313726, 1,
2.628476, -0.1690441, 3.593606, 1, 0, 0.03529412, 1,
2.766976, -0.0005754076, 3.356889, 1, 0, 0.03137255, 1,
2.778404, -0.7124668, 2.744919, 1, 0, 0.02352941, 1,
2.829115, -1.755212, 2.304407, 1, 0, 0.01960784, 1,
2.898502, 1.104226, 0.6413003, 1, 0, 0.01176471, 1,
3.104475, 0.483196, 1.284688, 1, 0, 0.007843138, 1
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
0.2499863, -4.034686, -7.916381, 0, -0.5, 0.5, 0.5,
0.2499863, -4.034686, -7.916381, 1, -0.5, 0.5, 0.5,
0.2499863, -4.034686, -7.916381, 1, 1.5, 0.5, 0.5,
0.2499863, -4.034686, -7.916381, 0, 1.5, 0.5, 0.5
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
-3.572174, 0.05374122, -7.916381, 0, -0.5, 0.5, 0.5,
-3.572174, 0.05374122, -7.916381, 1, -0.5, 0.5, 0.5,
-3.572174, 0.05374122, -7.916381, 1, 1.5, 0.5, 0.5,
-3.572174, 0.05374122, -7.916381, 0, 1.5, 0.5, 0.5
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
-3.572174, -4.034686, -0.6235769, 0, -0.5, 0.5, 0.5,
-3.572174, -4.034686, -0.6235769, 1, -0.5, 0.5, 0.5,
-3.572174, -4.034686, -0.6235769, 1, 1.5, 0.5, 0.5,
-3.572174, -4.034686, -0.6235769, 0, 1.5, 0.5, 0.5
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
-2, -3.091202, -6.233426,
3, -3.091202, -6.233426,
-2, -3.091202, -6.233426,
-2, -3.24845, -6.513919,
-1, -3.091202, -6.233426,
-1, -3.24845, -6.513919,
0, -3.091202, -6.233426,
0, -3.24845, -6.513919,
1, -3.091202, -6.233426,
1, -3.24845, -6.513919,
2, -3.091202, -6.233426,
2, -3.24845, -6.513919,
3, -3.091202, -6.233426,
3, -3.24845, -6.513919
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
-2, -3.562944, -7.074903, 0, -0.5, 0.5, 0.5,
-2, -3.562944, -7.074903, 1, -0.5, 0.5, 0.5,
-2, -3.562944, -7.074903, 1, 1.5, 0.5, 0.5,
-2, -3.562944, -7.074903, 0, 1.5, 0.5, 0.5,
-1, -3.562944, -7.074903, 0, -0.5, 0.5, 0.5,
-1, -3.562944, -7.074903, 1, -0.5, 0.5, 0.5,
-1, -3.562944, -7.074903, 1, 1.5, 0.5, 0.5,
-1, -3.562944, -7.074903, 0, 1.5, 0.5, 0.5,
0, -3.562944, -7.074903, 0, -0.5, 0.5, 0.5,
0, -3.562944, -7.074903, 1, -0.5, 0.5, 0.5,
0, -3.562944, -7.074903, 1, 1.5, 0.5, 0.5,
0, -3.562944, -7.074903, 0, 1.5, 0.5, 0.5,
1, -3.562944, -7.074903, 0, -0.5, 0.5, 0.5,
1, -3.562944, -7.074903, 1, -0.5, 0.5, 0.5,
1, -3.562944, -7.074903, 1, 1.5, 0.5, 0.5,
1, -3.562944, -7.074903, 0, 1.5, 0.5, 0.5,
2, -3.562944, -7.074903, 0, -0.5, 0.5, 0.5,
2, -3.562944, -7.074903, 1, -0.5, 0.5, 0.5,
2, -3.562944, -7.074903, 1, 1.5, 0.5, 0.5,
2, -3.562944, -7.074903, 0, 1.5, 0.5, 0.5,
3, -3.562944, -7.074903, 0, -0.5, 0.5, 0.5,
3, -3.562944, -7.074903, 1, -0.5, 0.5, 0.5,
3, -3.562944, -7.074903, 1, 1.5, 0.5, 0.5,
3, -3.562944, -7.074903, 0, 1.5, 0.5, 0.5
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
-2.690137, -2, -6.233426,
-2.690137, 3, -6.233426,
-2.690137, -2, -6.233426,
-2.837143, -2, -6.513919,
-2.690137, -1, -6.233426,
-2.837143, -1, -6.513919,
-2.690137, 0, -6.233426,
-2.837143, 0, -6.513919,
-2.690137, 1, -6.233426,
-2.837143, 1, -6.513919,
-2.690137, 2, -6.233426,
-2.837143, 2, -6.513919,
-2.690137, 3, -6.233426,
-2.837143, 3, -6.513919
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
-3.131155, -2, -7.074903, 0, -0.5, 0.5, 0.5,
-3.131155, -2, -7.074903, 1, -0.5, 0.5, 0.5,
-3.131155, -2, -7.074903, 1, 1.5, 0.5, 0.5,
-3.131155, -2, -7.074903, 0, 1.5, 0.5, 0.5,
-3.131155, -1, -7.074903, 0, -0.5, 0.5, 0.5,
-3.131155, -1, -7.074903, 1, -0.5, 0.5, 0.5,
-3.131155, -1, -7.074903, 1, 1.5, 0.5, 0.5,
-3.131155, -1, -7.074903, 0, 1.5, 0.5, 0.5,
-3.131155, 0, -7.074903, 0, -0.5, 0.5, 0.5,
-3.131155, 0, -7.074903, 1, -0.5, 0.5, 0.5,
-3.131155, 0, -7.074903, 1, 1.5, 0.5, 0.5,
-3.131155, 0, -7.074903, 0, 1.5, 0.5, 0.5,
-3.131155, 1, -7.074903, 0, -0.5, 0.5, 0.5,
-3.131155, 1, -7.074903, 1, -0.5, 0.5, 0.5,
-3.131155, 1, -7.074903, 1, 1.5, 0.5, 0.5,
-3.131155, 1, -7.074903, 0, 1.5, 0.5, 0.5,
-3.131155, 2, -7.074903, 0, -0.5, 0.5, 0.5,
-3.131155, 2, -7.074903, 1, -0.5, 0.5, 0.5,
-3.131155, 2, -7.074903, 1, 1.5, 0.5, 0.5,
-3.131155, 2, -7.074903, 0, 1.5, 0.5, 0.5,
-3.131155, 3, -7.074903, 0, -0.5, 0.5, 0.5,
-3.131155, 3, -7.074903, 1, -0.5, 0.5, 0.5,
-3.131155, 3, -7.074903, 1, 1.5, 0.5, 0.5,
-3.131155, 3, -7.074903, 0, 1.5, 0.5, 0.5
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
-2.690137, -3.091202, -6,
-2.690137, -3.091202, 4,
-2.690137, -3.091202, -6,
-2.837143, -3.24845, -6,
-2.690137, -3.091202, -4,
-2.837143, -3.24845, -4,
-2.690137, -3.091202, -2,
-2.837143, -3.24845, -2,
-2.690137, -3.091202, 0,
-2.837143, -3.24845, 0,
-2.690137, -3.091202, 2,
-2.837143, -3.24845, 2,
-2.690137, -3.091202, 4,
-2.837143, -3.24845, 4
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
"-6",
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
-3.131155, -3.562944, -6, 0, -0.5, 0.5, 0.5,
-3.131155, -3.562944, -6, 1, -0.5, 0.5, 0.5,
-3.131155, -3.562944, -6, 1, 1.5, 0.5, 0.5,
-3.131155, -3.562944, -6, 0, 1.5, 0.5, 0.5,
-3.131155, -3.562944, -4, 0, -0.5, 0.5, 0.5,
-3.131155, -3.562944, -4, 1, -0.5, 0.5, 0.5,
-3.131155, -3.562944, -4, 1, 1.5, 0.5, 0.5,
-3.131155, -3.562944, -4, 0, 1.5, 0.5, 0.5,
-3.131155, -3.562944, -2, 0, -0.5, 0.5, 0.5,
-3.131155, -3.562944, -2, 1, -0.5, 0.5, 0.5,
-3.131155, -3.562944, -2, 1, 1.5, 0.5, 0.5,
-3.131155, -3.562944, -2, 0, 1.5, 0.5, 0.5,
-3.131155, -3.562944, 0, 0, -0.5, 0.5, 0.5,
-3.131155, -3.562944, 0, 1, -0.5, 0.5, 0.5,
-3.131155, -3.562944, 0, 1, 1.5, 0.5, 0.5,
-3.131155, -3.562944, 0, 0, 1.5, 0.5, 0.5,
-3.131155, -3.562944, 2, 0, -0.5, 0.5, 0.5,
-3.131155, -3.562944, 2, 1, -0.5, 0.5, 0.5,
-3.131155, -3.562944, 2, 1, 1.5, 0.5, 0.5,
-3.131155, -3.562944, 2, 0, 1.5, 0.5, 0.5,
-3.131155, -3.562944, 4, 0, -0.5, 0.5, 0.5,
-3.131155, -3.562944, 4, 1, -0.5, 0.5, 0.5,
-3.131155, -3.562944, 4, 1, 1.5, 0.5, 0.5,
-3.131155, -3.562944, 4, 0, 1.5, 0.5, 0.5
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
-2.690137, -3.091202, -6.233426,
-2.690137, 3.198685, -6.233426,
-2.690137, -3.091202, 4.986272,
-2.690137, 3.198685, 4.986272,
-2.690137, -3.091202, -6.233426,
-2.690137, -3.091202, 4.986272,
-2.690137, 3.198685, -6.233426,
-2.690137, 3.198685, 4.986272,
-2.690137, -3.091202, -6.233426,
3.190109, -3.091202, -6.233426,
-2.690137, -3.091202, 4.986272,
3.190109, -3.091202, 4.986272,
-2.690137, 3.198685, -6.233426,
3.190109, 3.198685, -6.233426,
-2.690137, 3.198685, 4.986272,
3.190109, 3.198685, 4.986272,
3.190109, -3.091202, -6.233426,
3.190109, 3.198685, -6.233426,
3.190109, -3.091202, 4.986272,
3.190109, 3.198685, 4.986272,
3.190109, -3.091202, -6.233426,
3.190109, -3.091202, 4.986272,
3.190109, 3.198685, -6.233426,
3.190109, 3.198685, 4.986272
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
var radius = 7.552034;
var distance = 33.59985;
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
mvMatrix.translate( -0.2499863, -0.05374122, 0.6235769 );
mvMatrix.scale( 1.388617, 1.29818, 0.7277742 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.59985);
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
metsulfuron-methyl<-read.table("metsulfuron-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metsulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'metsulfuron' not found
```

```r
y<-metsulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'metsulfuron' not found
```

```r
z<-metsulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'metsulfuron' not found
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
-2.604502, 0.4748728, -0.3274314, 0, 0, 1, 1, 1,
-2.564367, 0.1250799, -0.617834, 1, 0, 0, 1, 1,
-2.404353, -0.4014536, -3.900411, 1, 0, 0, 1, 1,
-2.402829, -0.6276603, -1.855983, 1, 0, 0, 1, 1,
-2.396524, 0.5473955, -1.530041, 1, 0, 0, 1, 1,
-2.377237, -0.1247861, -3.375703, 1, 0, 0, 1, 1,
-2.353208, -0.2468055, -2.550374, 0, 0, 0, 1, 1,
-2.334368, -0.4718866, 0.03388122, 0, 0, 0, 1, 1,
-2.27886, 0.4331056, -1.493454, 0, 0, 0, 1, 1,
-2.249196, -0.7300522, -2.718137, 0, 0, 0, 1, 1,
-2.247662, 0.05986384, -2.112097, 0, 0, 0, 1, 1,
-2.229031, -0.5833797, -0.9993567, 0, 0, 0, 1, 1,
-2.225376, -1.689048, -1.640415, 0, 0, 0, 1, 1,
-2.217664, -1.13971, -3.560388, 1, 1, 1, 1, 1,
-2.165706, 0.6540096, -1.673257, 1, 1, 1, 1, 1,
-2.148316, 0.09612685, -1.646749, 1, 1, 1, 1, 1,
-2.143536, -1.060865, -1.073218, 1, 1, 1, 1, 1,
-2.093962, 1.243304, -1.012027, 1, 1, 1, 1, 1,
-2.068066, -0.218912, -2.781629, 1, 1, 1, 1, 1,
-2.043819, 1.876072, -1.666179, 1, 1, 1, 1, 1,
-2.040669, -0.7667414, -2.56927, 1, 1, 1, 1, 1,
-2.013138, -1.797101, -2.636809, 1, 1, 1, 1, 1,
-2.006496, -0.2841552, 0.005771243, 1, 1, 1, 1, 1,
-1.987902, -0.6414641, -0.6481923, 1, 1, 1, 1, 1,
-1.979389, 0.4014163, 0.03347344, 1, 1, 1, 1, 1,
-1.968026, -0.4540331, -0.2916551, 1, 1, 1, 1, 1,
-1.964425, -1.062928, -1.569705, 1, 1, 1, 1, 1,
-1.959043, 0.235975, 0.6247973, 1, 1, 1, 1, 1,
-1.946823, 1.088783, -2.331622, 0, 0, 1, 1, 1,
-1.941797, 0.5171128, -0.6700525, 1, 0, 0, 1, 1,
-1.919486, 0.7040154, -1.785218, 1, 0, 0, 1, 1,
-1.919461, -1.719805, -1.579921, 1, 0, 0, 1, 1,
-1.849356, 0.6405957, -3.396659, 1, 0, 0, 1, 1,
-1.838469, 0.9325887, -0.9889967, 1, 0, 0, 1, 1,
-1.837748, -0.2824844, -0.9246954, 0, 0, 0, 1, 1,
-1.816206, 0.08543699, -1.887364, 0, 0, 0, 1, 1,
-1.799543, 0.2012779, -2.216767, 0, 0, 0, 1, 1,
-1.789566, -1.679443, -4.203373, 0, 0, 0, 1, 1,
-1.781685, 0.2321727, 0.1498747, 0, 0, 0, 1, 1,
-1.779163, 0.9779394, -1.932278, 0, 0, 0, 1, 1,
-1.771581, 1.445538, -2.403593, 0, 0, 0, 1, 1,
-1.760708, 2.352671, -1.276458, 1, 1, 1, 1, 1,
-1.750072, 1.828314, -0.5551934, 1, 1, 1, 1, 1,
-1.742589, 1.173118, -1.651979, 1, 1, 1, 1, 1,
-1.729247, 1.284583, -1.155438, 1, 1, 1, 1, 1,
-1.709591, -1.545983, -3.825185, 1, 1, 1, 1, 1,
-1.705599, 2.466264, -0.7694812, 1, 1, 1, 1, 1,
-1.689869, -0.8945204, -3.00937, 1, 1, 1, 1, 1,
-1.689248, 0.4724099, -1.017974, 1, 1, 1, 1, 1,
-1.683356, 0.1135408, -0.9200111, 1, 1, 1, 1, 1,
-1.681442, -0.2921996, -1.850141, 1, 1, 1, 1, 1,
-1.671217, -1.719165, -1.422494, 1, 1, 1, 1, 1,
-1.667029, 0.5705587, -0.8601091, 1, 1, 1, 1, 1,
-1.660373, 0.5665677, -1.316486, 1, 1, 1, 1, 1,
-1.652763, -1.110921, -2.298871, 1, 1, 1, 1, 1,
-1.645098, 0.9383025, -0.07486778, 1, 1, 1, 1, 1,
-1.603209, -0.8306699, -2.533372, 0, 0, 1, 1, 1,
-1.571432, 0.3820112, -0.8204302, 1, 0, 0, 1, 1,
-1.551975, -0.008686635, -0.7668236, 1, 0, 0, 1, 1,
-1.5488, -1.02784, -1.069893, 1, 0, 0, 1, 1,
-1.541896, -1.224297, -1.267841, 1, 0, 0, 1, 1,
-1.532424, -0.7951519, -1.49103, 1, 0, 0, 1, 1,
-1.521235, 1.658069, -0.7056651, 0, 0, 0, 1, 1,
-1.509132, 1.508437, -1.622621, 0, 0, 0, 1, 1,
-1.503348, 1.436042, -0.6930866, 0, 0, 0, 1, 1,
-1.498598, 0.9404938, -1.527748, 0, 0, 0, 1, 1,
-1.497985, -0.3591801, -0.6855008, 0, 0, 0, 1, 1,
-1.497442, 0.8157352, -0.2953365, 0, 0, 0, 1, 1,
-1.493464, -2.771358, -1.992705, 0, 0, 0, 1, 1,
-1.490561, -0.05380929, -1.093171, 1, 1, 1, 1, 1,
-1.485605, 0.6810548, -0.603554, 1, 1, 1, 1, 1,
-1.484846, 0.3792969, -1.225695, 1, 1, 1, 1, 1,
-1.47592, -1.684839, -3.353465, 1, 1, 1, 1, 1,
-1.46591, 0.04898778, -1.416303, 1, 1, 1, 1, 1,
-1.456957, 0.4169206, -1.655638, 1, 1, 1, 1, 1,
-1.454971, 2.134111, -0.1935645, 1, 1, 1, 1, 1,
-1.446023, -1.318516, -2.176297, 1, 1, 1, 1, 1,
-1.443535, 0.9508266, -1.020786, 1, 1, 1, 1, 1,
-1.443411, 0.5322905, -2.406044, 1, 1, 1, 1, 1,
-1.442488, 1.174001, -1.673011, 1, 1, 1, 1, 1,
-1.440324, 0.2070831, -0.3694143, 1, 1, 1, 1, 1,
-1.437448, -1.236154, -2.277412, 1, 1, 1, 1, 1,
-1.436621, 2.011427, -0.2247658, 1, 1, 1, 1, 1,
-1.432887, 0.5796465, 0.6337759, 1, 1, 1, 1, 1,
-1.419701, -2.144236, -2.361473, 0, 0, 1, 1, 1,
-1.406295, -0.6849654, -0.1225724, 1, 0, 0, 1, 1,
-1.405007, 0.4653271, -2.368148, 1, 0, 0, 1, 1,
-1.403433, 1.2425, -1.413966, 1, 0, 0, 1, 1,
-1.401108, -0.1079059, -1.562356, 1, 0, 0, 1, 1,
-1.397724, 0.258483, -1.18881, 1, 0, 0, 1, 1,
-1.393519, 0.102688, -0.07069926, 0, 0, 0, 1, 1,
-1.384669, 1.591738, -0.8889161, 0, 0, 0, 1, 1,
-1.375989, -0.262327, -0.9727266, 0, 0, 0, 1, 1,
-1.375402, -0.3954048, -2.939498, 0, 0, 0, 1, 1,
-1.370263, 0.2780435, -0.3731976, 0, 0, 0, 1, 1,
-1.361077, -1.608979, -0.3757018, 0, 0, 0, 1, 1,
-1.354102, 0.8050368, -0.2613075, 0, 0, 0, 1, 1,
-1.353304, 2.479152, -1.008109, 1, 1, 1, 1, 1,
-1.350164, -2.49616, -2.3697, 1, 1, 1, 1, 1,
-1.337824, 1.55991, -0.7256852, 1, 1, 1, 1, 1,
-1.331666, 1.006485, -1.783143, 1, 1, 1, 1, 1,
-1.329823, -0.08370556, -1.347688, 1, 1, 1, 1, 1,
-1.329226, -0.07646219, -1.628444, 1, 1, 1, 1, 1,
-1.327009, 1.38017, -0.2146979, 1, 1, 1, 1, 1,
-1.318116, -0.3762966, -1.19186, 1, 1, 1, 1, 1,
-1.317247, -1.298691, -2.969416, 1, 1, 1, 1, 1,
-1.31469, -0.8808507, -3.056305, 1, 1, 1, 1, 1,
-1.299044, 0.7687533, -1.016837, 1, 1, 1, 1, 1,
-1.298094, -1.464881, -2.341427, 1, 1, 1, 1, 1,
-1.286999, 1.400182, -0.1094742, 1, 1, 1, 1, 1,
-1.270581, -2.153387, -3.078846, 1, 1, 1, 1, 1,
-1.268775, -0.8015725, -2.967882, 1, 1, 1, 1, 1,
-1.264103, -0.271162, 0.1950247, 0, 0, 1, 1, 1,
-1.254983, -0.4472452, -1.65284, 1, 0, 0, 1, 1,
-1.250399, 2.396895, -1.130893, 1, 0, 0, 1, 1,
-1.249674, -1.389872, -3.194995, 1, 0, 0, 1, 1,
-1.242051, -0.4031475, 0.2787248, 1, 0, 0, 1, 1,
-1.234684, 0.327854, -0.2450155, 1, 0, 0, 1, 1,
-1.228131, 1.382526, -0.287616, 0, 0, 0, 1, 1,
-1.227318, -1.29649, -1.980055, 0, 0, 0, 1, 1,
-1.226714, -0.1646201, -1.453748, 0, 0, 0, 1, 1,
-1.214429, -0.3438259, -1.195265, 0, 0, 0, 1, 1,
-1.200345, 0.1859417, -1.913432, 0, 0, 0, 1, 1,
-1.196191, -0.3445634, -1.733917, 0, 0, 0, 1, 1,
-1.194992, 0.6212518, -0.3440288, 0, 0, 0, 1, 1,
-1.183117, 0.2352512, -0.7532084, 1, 1, 1, 1, 1,
-1.178383, -0.2494164, -1.588676, 1, 1, 1, 1, 1,
-1.161151, -0.2842114, -1.717639, 1, 1, 1, 1, 1,
-1.157696, -0.3425299, -3.829423, 1, 1, 1, 1, 1,
-1.153965, 0.4591893, -3.352343, 1, 1, 1, 1, 1,
-1.149133, 0.08725785, -0.07253972, 1, 1, 1, 1, 1,
-1.146566, 0.9036668, -0.8227679, 1, 1, 1, 1, 1,
-1.144743, 0.59313, -1.656224, 1, 1, 1, 1, 1,
-1.141183, 0.145943, -2.509973, 1, 1, 1, 1, 1,
-1.13854, 0.995478, -1.477041, 1, 1, 1, 1, 1,
-1.13835, -0.4221165, -2.239895, 1, 1, 1, 1, 1,
-1.137243, 0.283412, -1.037688, 1, 1, 1, 1, 1,
-1.135454, 0.3110359, -2.819149, 1, 1, 1, 1, 1,
-1.134512, 0.9335309, -0.755016, 1, 1, 1, 1, 1,
-1.134058, 1.731045, -0.6234351, 1, 1, 1, 1, 1,
-1.132429, 0.2839555, -0.09578127, 0, 0, 1, 1, 1,
-1.12657, 1.63987, -2.370707, 1, 0, 0, 1, 1,
-1.126185, -0.4895726, -1.240327, 1, 0, 0, 1, 1,
-1.124845, -0.3628696, -0.5529113, 1, 0, 0, 1, 1,
-1.124045, 0.8709685, 1.312907, 1, 0, 0, 1, 1,
-1.122921, -1.344416, -2.544174, 1, 0, 0, 1, 1,
-1.121574, 0.03017391, -1.736629, 0, 0, 0, 1, 1,
-1.11849, -0.7705015, -0.1896381, 0, 0, 0, 1, 1,
-1.117095, 1.642924, 0.539333, 0, 0, 0, 1, 1,
-1.116038, -0.05229243, -3.730301, 0, 0, 0, 1, 1,
-1.111452, 0.907293, -0.7236397, 0, 0, 0, 1, 1,
-1.098934, -0.5042403, -3.09817, 0, 0, 0, 1, 1,
-1.095259, -0.2148813, -1.98168, 0, 0, 0, 1, 1,
-1.093513, 0.4054578, -2.83658, 1, 1, 1, 1, 1,
-1.093265, -0.8284049, -2.46463, 1, 1, 1, 1, 1,
-1.092721, -0.2466224, -2.546055, 1, 1, 1, 1, 1,
-1.089673, 0.00319115, -1.924918, 1, 1, 1, 1, 1,
-1.089649, -0.9292931, -1.871143, 1, 1, 1, 1, 1,
-1.088295, -0.4881496, -1.707705, 1, 1, 1, 1, 1,
-1.081325, 0.1063628, -2.580722, 1, 1, 1, 1, 1,
-1.081263, 1.553543, -0.8538054, 1, 1, 1, 1, 1,
-1.070051, -0.2516313, -1.626672, 1, 1, 1, 1, 1,
-1.057428, 0.3929504, -3.359788, 1, 1, 1, 1, 1,
-1.05429, 1.538592, -4.018276, 1, 1, 1, 1, 1,
-1.0476, 0.410122, -2.705132, 1, 1, 1, 1, 1,
-1.045096, 2.155603, -0.199912, 1, 1, 1, 1, 1,
-1.042731, 1.989154, -1.7577, 1, 1, 1, 1, 1,
-1.039337, -0.8838916, -2.855136, 1, 1, 1, 1, 1,
-1.036939, 0.6355451, -1.449119, 0, 0, 1, 1, 1,
-1.031625, 0.6250944, -0.06571162, 1, 0, 0, 1, 1,
-1.030713, 0.2497172, -0.7282158, 1, 0, 0, 1, 1,
-1.030625, 0.4189542, -3.332545, 1, 0, 0, 1, 1,
-1.028851, -0.7161772, -2.321869, 1, 0, 0, 1, 1,
-1.023932, 0.7513911, -1.878387, 1, 0, 0, 1, 1,
-1.018084, 0.546486, -0.4471929, 0, 0, 0, 1, 1,
-1.018072, -0.2119223, -2.734143, 0, 0, 0, 1, 1,
-1.013597, 0.06290777, -0.8582727, 0, 0, 0, 1, 1,
-1.009052, -1.844691, -3.785347, 0, 0, 0, 1, 1,
-1.00697, 0.6118557, -2.756231, 0, 0, 0, 1, 1,
-1.001797, 0.2925686, -1.893286, 0, 0, 0, 1, 1,
-0.9972854, 0.05684686, -1.854462, 0, 0, 0, 1, 1,
-0.9948503, 2.284512, -0.6846948, 1, 1, 1, 1, 1,
-0.9944007, -0.3665237, -2.856865, 1, 1, 1, 1, 1,
-0.9935014, -0.6866054, -4.625547, 1, 1, 1, 1, 1,
-0.9863071, -0.9721256, -1.36941, 1, 1, 1, 1, 1,
-0.9861905, -1.029091, -4.437553, 1, 1, 1, 1, 1,
-0.9800593, -0.7464644, -2.87343, 1, 1, 1, 1, 1,
-0.9629955, -1.460755, -2.285737, 1, 1, 1, 1, 1,
-0.9611734, 0.8057148, -1.31471, 1, 1, 1, 1, 1,
-0.9499373, 2.117049, -0.4836942, 1, 1, 1, 1, 1,
-0.9484056, -0.7752605, -1.639127, 1, 1, 1, 1, 1,
-0.9455848, 0.3722708, -1.453609, 1, 1, 1, 1, 1,
-0.9443219, 0.2838421, -0.5792969, 1, 1, 1, 1, 1,
-0.9299546, -0.9650672, -2.511876, 1, 1, 1, 1, 1,
-0.9299452, 2.005631, 0.1897106, 1, 1, 1, 1, 1,
-0.9170544, 0.2921744, -1.472829, 1, 1, 1, 1, 1,
-0.9167807, 0.34403, -0.6098917, 0, 0, 1, 1, 1,
-0.9117916, 1.028094, -0.70536, 1, 0, 0, 1, 1,
-0.9067298, 1.705844, -0.7736999, 1, 0, 0, 1, 1,
-0.9039313, -0.7417423, -1.783092, 1, 0, 0, 1, 1,
-0.8937862, -0.958058, -3.383469, 1, 0, 0, 1, 1,
-0.8929208, 0.6587567, -1.162791, 1, 0, 0, 1, 1,
-0.8910141, 0.39256, -1.564862, 0, 0, 0, 1, 1,
-0.8866543, 0.9329037, -0.7887096, 0, 0, 0, 1, 1,
-0.8865741, -0.5561924, -2.659772, 0, 0, 0, 1, 1,
-0.8788491, 0.2432208, -2.841544, 0, 0, 0, 1, 1,
-0.87638, 0.2259644, 0.7591109, 0, 0, 0, 1, 1,
-0.8735391, -0.03546224, -1.058634, 0, 0, 0, 1, 1,
-0.8724721, -1.077255, -2.71313, 0, 0, 0, 1, 1,
-0.8723925, 0.6350057, -1.324782, 1, 1, 1, 1, 1,
-0.8704665, -1.276518, 0.2723132, 1, 1, 1, 1, 1,
-0.8694996, 0.307337, -1.853114, 1, 1, 1, 1, 1,
-0.8694964, -0.7540399, -1.938008, 1, 1, 1, 1, 1,
-0.8642949, -0.2770563, -3.342614, 1, 1, 1, 1, 1,
-0.859952, 1.368818, 0.1431887, 1, 1, 1, 1, 1,
-0.8545372, 0.7200931, -2.069371, 1, 1, 1, 1, 1,
-0.8540758, -0.6743129, -0.2060062, 1, 1, 1, 1, 1,
-0.8538534, 1.381483, -0.8368149, 1, 1, 1, 1, 1,
-0.8399352, 0.7009796, -0.9058174, 1, 1, 1, 1, 1,
-0.8376605, -1.311704, -2.636033, 1, 1, 1, 1, 1,
-0.8356701, 0.1078194, -1.178275, 1, 1, 1, 1, 1,
-0.830733, -0.1111066, -2.189792, 1, 1, 1, 1, 1,
-0.8294713, -0.4379289, -3.082333, 1, 1, 1, 1, 1,
-0.8284928, -1.214905, -2.704455, 1, 1, 1, 1, 1,
-0.826929, 0.4351606, -1.67981, 0, 0, 1, 1, 1,
-0.8257754, 0.7364746, -1.381066, 1, 0, 0, 1, 1,
-0.8105812, -0.210602, -2.881763, 1, 0, 0, 1, 1,
-0.8100182, -0.005909294, -2.705014, 1, 0, 0, 1, 1,
-0.8044185, -0.3358029, -0.989788, 1, 0, 0, 1, 1,
-0.8020299, 0.1951786, -1.402369, 1, 0, 0, 1, 1,
-0.8003074, 1.501808, -1.928722, 0, 0, 0, 1, 1,
-0.794723, 0.5456052, -0.5446731, 0, 0, 0, 1, 1,
-0.7908583, 1.339793, -0.5451263, 0, 0, 0, 1, 1,
-0.7879101, -0.1641906, -3.185751, 0, 0, 0, 1, 1,
-0.7800735, -1.007881, -3.339196, 0, 0, 0, 1, 1,
-0.7780122, 0.7979687, -0.8486271, 0, 0, 0, 1, 1,
-0.7750915, 0.401132, -0.1147633, 0, 0, 0, 1, 1,
-0.7750487, 0.3949911, -1.195877, 1, 1, 1, 1, 1,
-0.7729725, -0.3242929, -2.97526, 1, 1, 1, 1, 1,
-0.7694805, 1.468708, -0.5494345, 1, 1, 1, 1, 1,
-0.7622957, 1.454623, -0.5920699, 1, 1, 1, 1, 1,
-0.7621967, -0.6519743, -2.310113, 1, 1, 1, 1, 1,
-0.7605526, 0.814479, -0.937471, 1, 1, 1, 1, 1,
-0.7526736, -0.9158767, -2.017795, 1, 1, 1, 1, 1,
-0.7514939, 0.5456516, -0.8015313, 1, 1, 1, 1, 1,
-0.7513263, 2.077977, -0.1189271, 1, 1, 1, 1, 1,
-0.7494022, 0.3906622, -0.8805814, 1, 1, 1, 1, 1,
-0.7477708, 0.9674568, -0.9069461, 1, 1, 1, 1, 1,
-0.743171, 0.992965, -1.678521, 1, 1, 1, 1, 1,
-0.7300678, 1.350176, -1.434862, 1, 1, 1, 1, 1,
-0.7261101, 0.59192, -0.06879478, 1, 1, 1, 1, 1,
-0.7247583, -0.5668479, -2.595406, 1, 1, 1, 1, 1,
-0.7227193, 0.2282043, -1.717584, 0, 0, 1, 1, 1,
-0.7211785, 0.695554, 0.1494804, 1, 0, 0, 1, 1,
-0.7125719, 0.06851412, -2.288441, 1, 0, 0, 1, 1,
-0.7087108, 0.2050974, -0.6645026, 1, 0, 0, 1, 1,
-0.7050975, 0.2863794, -2.865386, 1, 0, 0, 1, 1,
-0.7004222, 0.8137295, 0.3678759, 1, 0, 0, 1, 1,
-0.6991391, 0.6797276, -0.5541265, 0, 0, 0, 1, 1,
-0.6966085, -0.7364091, -3.251909, 0, 0, 0, 1, 1,
-0.6962315, -0.5060256, -0.8374205, 0, 0, 0, 1, 1,
-0.6957445, 0.4351822, -1.19947, 0, 0, 0, 1, 1,
-0.691484, 0.5879832, -3.42889, 0, 0, 0, 1, 1,
-0.6889338, 1.980895, -0.9736576, 0, 0, 0, 1, 1,
-0.6870643, 1.352699, -3.022943, 0, 0, 0, 1, 1,
-0.6847554, 0.1170889, -1.714916, 1, 1, 1, 1, 1,
-0.684175, -1.464017, -2.373102, 1, 1, 1, 1, 1,
-0.6805065, 0.04429764, -2.747414, 1, 1, 1, 1, 1,
-0.6786723, -0.1131306, -1.67976, 1, 1, 1, 1, 1,
-0.6772344, -1.162927, -4.153684, 1, 1, 1, 1, 1,
-0.6756294, -0.7580152, -2.254073, 1, 1, 1, 1, 1,
-0.6703902, -1.022169, -2.705634, 1, 1, 1, 1, 1,
-0.6670344, -1.406485, -2.330177, 1, 1, 1, 1, 1,
-0.6654306, 0.243867, -1.115392, 1, 1, 1, 1, 1,
-0.6613579, 0.5114174, -0.2172211, 1, 1, 1, 1, 1,
-0.6565118, -0.7120806, -1.33914, 1, 1, 1, 1, 1,
-0.6563347, -2.363847, -2.774373, 1, 1, 1, 1, 1,
-0.6562176, 0.4234839, -2.149596, 1, 1, 1, 1, 1,
-0.6540985, 1.305646, -0.5649744, 1, 1, 1, 1, 1,
-0.652427, 0.5312055, -1.806227, 1, 1, 1, 1, 1,
-0.6473675, -0.08367167, -3.008183, 0, 0, 1, 1, 1,
-0.6460428, 0.4018881, -1.897829, 1, 0, 0, 1, 1,
-0.6440784, -0.6116913, -6.070033, 1, 0, 0, 1, 1,
-0.6401763, -2.093741, -3.788847, 1, 0, 0, 1, 1,
-0.6294435, -0.5385824, -4.002595, 1, 0, 0, 1, 1,
-0.6289812, -0.4425898, -2.54176, 1, 0, 0, 1, 1,
-0.6242575, 0.06377697, -2.009628, 0, 0, 0, 1, 1,
-0.6035618, 0.7021582, -1.160199, 0, 0, 0, 1, 1,
-0.6001324, -0.1852307, -1.901223, 0, 0, 0, 1, 1,
-0.5975701, -1.450522, -2.625988, 0, 0, 0, 1, 1,
-0.589693, 1.570766, -0.3248594, 0, 0, 0, 1, 1,
-0.5893605, 0.4349692, -1.488711, 0, 0, 0, 1, 1,
-0.5856241, -0.2423462, -3.287373, 0, 0, 0, 1, 1,
-0.5855414, 1.04439, -0.8623645, 1, 1, 1, 1, 1,
-0.584845, -0.2695535, -4.266478, 1, 1, 1, 1, 1,
-0.5832915, 0.717222, -0.1000619, 1, 1, 1, 1, 1,
-0.5798442, 0.3638171, -2.27616, 1, 1, 1, 1, 1,
-0.5790765, 0.3346907, -0.5515646, 1, 1, 1, 1, 1,
-0.5778849, -0.3235703, -2.36062, 1, 1, 1, 1, 1,
-0.5772607, -0.4990572, -1.608564, 1, 1, 1, 1, 1,
-0.5772176, -0.4954775, -1.191058, 1, 1, 1, 1, 1,
-0.5748942, -0.8970773, -5.16142, 1, 1, 1, 1, 1,
-0.5736542, -0.7962766, -3.012233, 1, 1, 1, 1, 1,
-0.5730926, 2.610351, 0.3712684, 1, 1, 1, 1, 1,
-0.5705304, -1.158194, -1.845573, 1, 1, 1, 1, 1,
-0.5657032, -0.5763445, -2.14399, 1, 1, 1, 1, 1,
-0.5626287, -0.8568007, -2.004776, 1, 1, 1, 1, 1,
-0.5581686, -1.08399, -2.083792, 1, 1, 1, 1, 1,
-0.5579296, 0.391874, -1.561296, 0, 0, 1, 1, 1,
-0.5518429, -0.002791313, -0.6891869, 1, 0, 0, 1, 1,
-0.5514486, 0.2882677, -0.5623155, 1, 0, 0, 1, 1,
-0.5461329, 0.7530369, -1.232975, 1, 0, 0, 1, 1,
-0.5445754, 0.5732746, -1.188761, 1, 0, 0, 1, 1,
-0.5426742, -0.7782739, -2.576597, 1, 0, 0, 1, 1,
-0.536485, -0.04654546, -1.062293, 0, 0, 0, 1, 1,
-0.531243, 0.4399126, -0.3800929, 0, 0, 0, 1, 1,
-0.5309866, 0.8727065, 0.853102, 0, 0, 0, 1, 1,
-0.5278713, 0.7948912, -0.1438495, 0, 0, 0, 1, 1,
-0.5183159, -0.6054389, -3.096531, 0, 0, 0, 1, 1,
-0.5171452, -0.6083229, -3.497445, 0, 0, 0, 1, 1,
-0.5160927, 0.4547809, -0.8422811, 0, 0, 0, 1, 1,
-0.5145677, -0.7300457, -3.060431, 1, 1, 1, 1, 1,
-0.5109395, -0.5340261, -2.781235, 1, 1, 1, 1, 1,
-0.5094129, 0.2445297, -1.825858, 1, 1, 1, 1, 1,
-0.5055041, 1.145424, 1.684172, 1, 1, 1, 1, 1,
-0.5050145, -1.795863, -2.968685, 1, 1, 1, 1, 1,
-0.5012789, -1.631646, 0.5014827, 1, 1, 1, 1, 1,
-0.5001277, -0.9245557, -4.009874, 1, 1, 1, 1, 1,
-0.4926576, 0.5215895, -0.6428931, 1, 1, 1, 1, 1,
-0.4833053, -0.7192215, -2.748256, 1, 1, 1, 1, 1,
-0.4809992, -0.5491554, -4.898831, 1, 1, 1, 1, 1,
-0.4773147, 0.06575909, -1.60158, 1, 1, 1, 1, 1,
-0.4748397, -0.5833879, -2.545635, 1, 1, 1, 1, 1,
-0.4728062, 0.4397195, 0.6075426, 1, 1, 1, 1, 1,
-0.4703424, -0.2202578, -1.606658, 1, 1, 1, 1, 1,
-0.467683, 0.6667423, 0.2551646, 1, 1, 1, 1, 1,
-0.4671277, -1.396881, -4.010686, 0, 0, 1, 1, 1,
-0.4647799, -0.08166013, -1.894988, 1, 0, 0, 1, 1,
-0.4640033, 0.1939283, -0.7114334, 1, 0, 0, 1, 1,
-0.4599185, -0.4203887, -2.228966, 1, 0, 0, 1, 1,
-0.4592615, -1.746836, -3.739075, 1, 0, 0, 1, 1,
-0.4554778, 0.005279596, -1.353897, 1, 0, 0, 1, 1,
-0.4519661, -0.8812767, -1.831044, 0, 0, 0, 1, 1,
-0.4500645, -2.101688, -3.18278, 0, 0, 0, 1, 1,
-0.4484413, 0.463306, -1.046002, 0, 0, 0, 1, 1,
-0.4457732, 0.04459014, -1.642367, 0, 0, 0, 1, 1,
-0.4390789, 1.447554, -0.3579635, 0, 0, 0, 1, 1,
-0.4352262, -0.9068547, -1.57188, 0, 0, 0, 1, 1,
-0.4327897, -0.1162656, -2.178549, 0, 0, 0, 1, 1,
-0.4272966, -0.1049033, -0.763467, 1, 1, 1, 1, 1,
-0.4266638, -0.4065981, -2.728819, 1, 1, 1, 1, 1,
-0.4258049, -0.7497636, -2.698798, 1, 1, 1, 1, 1,
-0.4208434, -1.100903, -4.229611, 1, 1, 1, 1, 1,
-0.4172626, 0.258265, -1.567058, 1, 1, 1, 1, 1,
-0.4143838, 0.0894936, 0.3290195, 1, 1, 1, 1, 1,
-0.4136317, -0.9285268, -1.735628, 1, 1, 1, 1, 1,
-0.4132363, -0.981131, -1.422105, 1, 1, 1, 1, 1,
-0.4122821, 0.3079968, -0.8311661, 1, 1, 1, 1, 1,
-0.3999648, 0.238296, -0.8660932, 1, 1, 1, 1, 1,
-0.392111, -1.215223, -0.9089655, 1, 1, 1, 1, 1,
-0.3836756, 0.1533542, -1.427558, 1, 1, 1, 1, 1,
-0.3805784, -1.127351, -1.831715, 1, 1, 1, 1, 1,
-0.377401, 1.382136, -1.377934, 1, 1, 1, 1, 1,
-0.3748885, -1.287977, -2.772865, 1, 1, 1, 1, 1,
-0.3732527, 0.2345565, -2.774101, 0, 0, 1, 1, 1,
-0.3680021, 0.6921466, -0.3646601, 1, 0, 0, 1, 1,
-0.3660972, 1.375474, 0.9171985, 1, 0, 0, 1, 1,
-0.3543778, -0.9483177, -3.467101, 1, 0, 0, 1, 1,
-0.3534158, 1.17539, 0.5472095, 1, 0, 0, 1, 1,
-0.3532252, 2.661382, 1.91776, 1, 0, 0, 1, 1,
-0.3497606, -0.07314816, -2.74354, 0, 0, 0, 1, 1,
-0.3434955, -2.999602, -2.467213, 0, 0, 0, 1, 1,
-0.341783, 0.9059455, -0.9787087, 0, 0, 0, 1, 1,
-0.3323029, -0.4491693, -2.775418, 0, 0, 0, 1, 1,
-0.3313472, -0.4225014, -0.8209163, 0, 0, 0, 1, 1,
-0.3302115, -0.9094937, -3.433236, 0, 0, 0, 1, 1,
-0.326236, 0.3907137, 0.697619, 0, 0, 0, 1, 1,
-0.3259079, -1.078715, -3.757278, 1, 1, 1, 1, 1,
-0.3257922, -0.2502545, -3.235995, 1, 1, 1, 1, 1,
-0.3254366, -0.1888081, -1.550855, 1, 1, 1, 1, 1,
-0.3237604, -0.160065, -1.203184, 1, 1, 1, 1, 1,
-0.322575, -1.050251, -1.697772, 1, 1, 1, 1, 1,
-0.3225681, -0.8068212, -2.38532, 1, 1, 1, 1, 1,
-0.3224213, -0.7184275, -3.506812, 1, 1, 1, 1, 1,
-0.3220381, -0.05757179, -1.074133, 1, 1, 1, 1, 1,
-0.3216889, -0.496664, -4.769761, 1, 1, 1, 1, 1,
-0.321095, 1.828154, -2.011182, 1, 1, 1, 1, 1,
-0.3186206, -0.2624581, -1.322622, 1, 1, 1, 1, 1,
-0.3176315, 0.4093529, -2.707571, 1, 1, 1, 1, 1,
-0.3161664, -0.6093142, -2.00495, 1, 1, 1, 1, 1,
-0.3137437, 0.8873053, 0.5619221, 1, 1, 1, 1, 1,
-0.3131828, -1.186224, -2.634455, 1, 1, 1, 1, 1,
-0.3113107, -2.891471, -2.563882, 0, 0, 1, 1, 1,
-0.3093343, -0.2194209, -3.978211, 1, 0, 0, 1, 1,
-0.3041629, -0.2605152, -2.655143, 1, 0, 0, 1, 1,
-0.3015195, 2.371779, -0.8956198, 1, 0, 0, 1, 1,
-0.2993193, 0.2029495, -2.466057, 1, 0, 0, 1, 1,
-0.2986105, 1.798294, -1.26875, 1, 0, 0, 1, 1,
-0.2909408, -0.8427081, -3.684722, 0, 0, 0, 1, 1,
-0.2813499, -0.9766613, -3.687836, 0, 0, 0, 1, 1,
-0.2771453, -0.2820547, -2.129507, 0, 0, 0, 1, 1,
-0.2763604, -1.104256, -4.009314, 0, 0, 0, 1, 1,
-0.2703404, 0.470558, -1.034216, 0, 0, 0, 1, 1,
-0.2680705, 0.1855076, -1.64882, 0, 0, 0, 1, 1,
-0.2627852, -0.9720713, -2.564709, 0, 0, 0, 1, 1,
-0.2555242, -2.317491, -2.83685, 1, 1, 1, 1, 1,
-0.2554303, -0.1385799, -4.444786, 1, 1, 1, 1, 1,
-0.2539699, 0.9484593, 0.1158712, 1, 1, 1, 1, 1,
-0.2530893, 0.6541009, -1.881258, 1, 1, 1, 1, 1,
-0.2527982, -0.04354329, -2.074693, 1, 1, 1, 1, 1,
-0.2526805, 0.3691945, -0.9014394, 1, 1, 1, 1, 1,
-0.2468102, -1.49924, -2.573091, 1, 1, 1, 1, 1,
-0.242673, -1.088032, -3.56569, 1, 1, 1, 1, 1,
-0.2416507, -1.126776, -2.710665, 1, 1, 1, 1, 1,
-0.2412149, 0.9666873, -1.955166, 1, 1, 1, 1, 1,
-0.2411016, -2.270649, -3.171471, 1, 1, 1, 1, 1,
-0.2410584, -0.5856123, -2.990734, 1, 1, 1, 1, 1,
-0.2360814, -0.7009565, -2.532266, 1, 1, 1, 1, 1,
-0.2304429, 0.1487483, -0.6560208, 1, 1, 1, 1, 1,
-0.2285424, 0.08608482, -0.7689729, 1, 1, 1, 1, 1,
-0.2270295, -0.3469683, -1.454866, 0, 0, 1, 1, 1,
-0.2242338, -2.204731, -4.980074, 1, 0, 0, 1, 1,
-0.2234882, 0.8149565, -1.683655, 1, 0, 0, 1, 1,
-0.2228117, 1.39025, -1.543784, 1, 0, 0, 1, 1,
-0.2214212, -1.462081, -3.290981, 1, 0, 0, 1, 1,
-0.2190415, 0.2941583, 0.8160965, 1, 0, 0, 1, 1,
-0.2127611, -0.6523889, -3.565885, 0, 0, 0, 1, 1,
-0.2092494, 0.4926034, 0.5954348, 0, 0, 0, 1, 1,
-0.2061773, 1.491636, -0.441029, 0, 0, 0, 1, 1,
-0.2043812, -0.963976, -1.778968, 0, 0, 0, 1, 1,
-0.2030164, -0.5304994, -2.203079, 0, 0, 0, 1, 1,
-0.1982283, -0.01772691, -0.8689012, 0, 0, 0, 1, 1,
-0.1974029, -1.387368, -4.258915, 0, 0, 0, 1, 1,
-0.1971298, 1.071395, -0.9122962, 1, 1, 1, 1, 1,
-0.1942249, 0.3032107, 0.4349229, 1, 1, 1, 1, 1,
-0.1897271, 0.657902, -0.650762, 1, 1, 1, 1, 1,
-0.1873462, 0.7771141, -3.024845, 1, 1, 1, 1, 1,
-0.1843794, -0.7432338, -3.60403, 1, 1, 1, 1, 1,
-0.1776188, 0.6106345, -0.4470387, 1, 1, 1, 1, 1,
-0.1728783, 0.1797041, -0.3086371, 1, 1, 1, 1, 1,
-0.1700796, 0.8110482, -2.170982, 1, 1, 1, 1, 1,
-0.1684857, -0.4469329, -1.037831, 1, 1, 1, 1, 1,
-0.1676372, -1.326366, -3.14554, 1, 1, 1, 1, 1,
-0.1674744, 1.83128, 0.8367892, 1, 1, 1, 1, 1,
-0.1621605, -0.03597591, -1.342507, 1, 1, 1, 1, 1,
-0.1605114, 0.545996, -0.8487421, 1, 1, 1, 1, 1,
-0.1540247, -0.7092312, -2.787649, 1, 1, 1, 1, 1,
-0.1484391, -0.2937731, -4.493025, 1, 1, 1, 1, 1,
-0.1475845, 2.237373, -0.3760774, 0, 0, 1, 1, 1,
-0.1470862, -0.6089737, -5.27064, 1, 0, 0, 1, 1,
-0.1465014, 1.128002, 0.7517059, 1, 0, 0, 1, 1,
-0.14579, 0.4459624, -0.07219047, 1, 0, 0, 1, 1,
-0.1431207, 0.5741667, -0.3257556, 1, 0, 0, 1, 1,
-0.1417034, 0.4243558, 3.033786, 1, 0, 0, 1, 1,
-0.1414604, -1.516837, -2.530052, 0, 0, 0, 1, 1,
-0.1356632, -0.1852576, -2.720221, 0, 0, 0, 1, 1,
-0.1309831, 0.1283526, -1.289483, 0, 0, 0, 1, 1,
-0.1273065, -0.5138867, -2.96836, 0, 0, 0, 1, 1,
-0.1264243, -1.520894, -2.890968, 0, 0, 0, 1, 1,
-0.122256, 0.2181249, -0.4229824, 0, 0, 0, 1, 1,
-0.1202045, 0.5374718, -0.8310142, 0, 0, 0, 1, 1,
-0.1177786, -0.06486338, -4.15425, 1, 1, 1, 1, 1,
-0.1165907, 0.2410225, -1.297124, 1, 1, 1, 1, 1,
-0.1165384, -0.06507131, -1.845208, 1, 1, 1, 1, 1,
-0.1118847, -0.2722925, -4.352264, 1, 1, 1, 1, 1,
-0.1100996, -0.7489969, -2.736719, 1, 1, 1, 1, 1,
-0.1080637, 0.8769194, -0.2542175, 1, 1, 1, 1, 1,
-0.1063318, -0.2621894, -2.762325, 1, 1, 1, 1, 1,
-0.1056878, 1.276843, -0.0138824, 1, 1, 1, 1, 1,
-0.1052029, 0.6573109, 0.6933896, 1, 1, 1, 1, 1,
-0.1012345, 0.5561801, 0.08817452, 1, 1, 1, 1, 1,
-0.0839631, 0.6047507, 0.9788041, 1, 1, 1, 1, 1,
-0.08256941, -0.9746675, -4.488914, 1, 1, 1, 1, 1,
-0.08075525, 0.2446802, 0.4889387, 1, 1, 1, 1, 1,
-0.07829462, -1.749669, -3.805261, 1, 1, 1, 1, 1,
-0.07695451, -2.107898, -2.551074, 1, 1, 1, 1, 1,
-0.07248629, 0.1194912, -0.4943594, 0, 0, 1, 1, 1,
-0.06542843, 0.7805675, -1.561908, 1, 0, 0, 1, 1,
-0.06499191, 0.2657428, -0.6505516, 1, 0, 0, 1, 1,
-0.06365898, -0.6691523, -3.509784, 1, 0, 0, 1, 1,
-0.06162281, -0.2824235, -2.118344, 1, 0, 0, 1, 1,
-0.06037715, -1.226607, -1.903983, 1, 0, 0, 1, 1,
-0.05652419, -1.04107, -3.641746, 0, 0, 0, 1, 1,
-0.05308551, 0.3337149, -0.8882217, 0, 0, 0, 1, 1,
-0.03945808, -2.197044, -3.172724, 0, 0, 0, 1, 1,
-0.03406061, -0.1416898, -3.586016, 0, 0, 0, 1, 1,
-0.03399032, -0.8236011, -4.421279, 0, 0, 0, 1, 1,
-0.03376145, -0.04752202, -3.099119, 0, 0, 0, 1, 1,
-0.02978981, -0.7419167, -3.405038, 0, 0, 0, 1, 1,
-0.02881145, -0.1159797, -3.513556, 1, 1, 1, 1, 1,
-0.02725224, -0.4132029, -3.601679, 1, 1, 1, 1, 1,
-0.02653495, 0.2452433, 1.187402, 1, 1, 1, 1, 1,
-0.01968294, 0.3085855, 2.29684, 1, 1, 1, 1, 1,
-0.01812206, 0.3211799, 1.296439, 1, 1, 1, 1, 1,
-0.01805306, -1.991942, -1.629602, 1, 1, 1, 1, 1,
-0.01800099, -0.5461546, -2.045312, 1, 1, 1, 1, 1,
-0.01168577, -0.150631, -2.774512, 1, 1, 1, 1, 1,
-0.01051025, 1.084092, 0.9165969, 1, 1, 1, 1, 1,
-0.01045005, 0.001469569, -1.961614, 1, 1, 1, 1, 1,
-0.00906602, -0.1573749, -4.070633, 1, 1, 1, 1, 1,
-0.008826842, -0.8517926, -3.576996, 1, 1, 1, 1, 1,
-0.008793432, 0.05565848, -0.04338285, 1, 1, 1, 1, 1,
-0.00667956, 0.1817769, 0.291912, 1, 1, 1, 1, 1,
-0.002778372, 0.8758675, 0.2633607, 1, 1, 1, 1, 1,
0.001333357, -0.7865439, 3.607936, 0, 0, 1, 1, 1,
0.006569775, -1.465812, 2.324473, 1, 0, 0, 1, 1,
0.006605464, 1.260488, 1.721358, 1, 0, 0, 1, 1,
0.01204781, 1.035437, -0.3782324, 1, 0, 0, 1, 1,
0.01956853, 0.4864895, 2.725299, 1, 0, 0, 1, 1,
0.023926, -0.5373349, 3.951202, 1, 0, 0, 1, 1,
0.02701374, 0.8651667, 2.030021, 0, 0, 0, 1, 1,
0.0287874, -1.626251, 1.83021, 0, 0, 0, 1, 1,
0.03344056, -0.5092476, 3.084238, 0, 0, 0, 1, 1,
0.03901447, -2.102772, 4.548125, 0, 0, 0, 1, 1,
0.03999034, -0.2395661, 4.123568, 0, 0, 0, 1, 1,
0.04274861, 0.7996536, -0.1165452, 0, 0, 0, 1, 1,
0.04536302, -0.9132242, 3.843419, 0, 0, 0, 1, 1,
0.04609401, -0.3620366, 3.952404, 1, 1, 1, 1, 1,
0.04787523, -0.03850619, 2.437506, 1, 1, 1, 1, 1,
0.05527704, -1.613008, 3.415274, 1, 1, 1, 1, 1,
0.05855476, -0.3466714, 2.27339, 1, 1, 1, 1, 1,
0.06005258, -0.5022298, 4.032313, 1, 1, 1, 1, 1,
0.06166326, -0.983274, 4.286549, 1, 1, 1, 1, 1,
0.06471659, -2.74888, 4.487945, 1, 1, 1, 1, 1,
0.06483337, -1.426086, 3.096066, 1, 1, 1, 1, 1,
0.06496134, -1.273367, 3.104205, 1, 1, 1, 1, 1,
0.06505162, 2.174572, -0.371197, 1, 1, 1, 1, 1,
0.06788059, -0.3862982, 2.553978, 1, 1, 1, 1, 1,
0.07248001, 0.2921067, 0.3385645, 1, 1, 1, 1, 1,
0.07256018, 0.0460985, 1.586774, 1, 1, 1, 1, 1,
0.07531895, 1.153105, -1.013012, 1, 1, 1, 1, 1,
0.07625778, -1.689018, 3.099588, 1, 1, 1, 1, 1,
0.07675186, -1.069431, 3.130029, 0, 0, 1, 1, 1,
0.07745247, -1.463933, 1.697627, 1, 0, 0, 1, 1,
0.08319291, -0.4332718, 4.021229, 1, 0, 0, 1, 1,
0.08344668, -0.07568847, 1.388677, 1, 0, 0, 1, 1,
0.0863765, 0.6815147, 0.1190616, 1, 0, 0, 1, 1,
0.08767915, -0.9821558, 4.223483, 1, 0, 0, 1, 1,
0.08825296, 1.003269, 0.4829162, 0, 0, 0, 1, 1,
0.0887276, -0.414958, 2.817482, 0, 0, 0, 1, 1,
0.09240875, 0.02620265, 1.807553, 0, 0, 0, 1, 1,
0.09304079, 1.145169, -1.334265, 0, 0, 0, 1, 1,
0.09402037, -1.882357, 4.380498, 0, 0, 0, 1, 1,
0.0956153, 0.8774104, -0.1132721, 0, 0, 0, 1, 1,
0.09680054, -0.8293294, 3.884381, 0, 0, 0, 1, 1,
0.1003417, 0.4651637, 1.178973, 1, 1, 1, 1, 1,
0.1022417, 0.1902288, 0.9170901, 1, 1, 1, 1, 1,
0.1042302, 1.335996, 1.202399, 1, 1, 1, 1, 1,
0.1047059, 0.2710952, 1.278097, 1, 1, 1, 1, 1,
0.1078011, -1.222369, 1.997836, 1, 1, 1, 1, 1,
0.1102714, 0.03725677, 1.674604, 1, 1, 1, 1, 1,
0.1117916, 1.293319, 0.2396545, 1, 1, 1, 1, 1,
0.112142, -0.7246569, 3.866342, 1, 1, 1, 1, 1,
0.1123263, -0.6634247, 3.697163, 1, 1, 1, 1, 1,
0.1150632, -2.375422, 3.052906, 1, 1, 1, 1, 1,
0.1155889, 0.5870996, 0.1579814, 1, 1, 1, 1, 1,
0.1167096, 0.1600491, -0.4653896, 1, 1, 1, 1, 1,
0.1181439, -0.3637851, 1.910896, 1, 1, 1, 1, 1,
0.1191798, 0.1661408, -0.7361774, 1, 1, 1, 1, 1,
0.1211362, 0.3973958, 2.678261, 1, 1, 1, 1, 1,
0.1252489, -1.44296, 4.489556, 0, 0, 1, 1, 1,
0.128027, 0.1813335, 0.9258558, 1, 0, 0, 1, 1,
0.1367295, 1.07874, -0.4516202, 1, 0, 0, 1, 1,
0.1505542, -1.193171, 3.290005, 1, 0, 0, 1, 1,
0.1515933, 1.434251, -0.7052845, 1, 0, 0, 1, 1,
0.1535976, 0.5606738, 0.1087903, 1, 0, 0, 1, 1,
0.1538988, 1.900708, 0.1934094, 0, 0, 0, 1, 1,
0.1539695, -1.105719, 3.712774, 0, 0, 0, 1, 1,
0.1546932, -1.625709, 1.136729, 0, 0, 0, 1, 1,
0.1572163, -1.494893, 2.407876, 0, 0, 0, 1, 1,
0.1621919, 0.486797, 0.5961282, 0, 0, 0, 1, 1,
0.1627129, -2.059583, 3.724434, 0, 0, 0, 1, 1,
0.1628809, -1.566311, 2.96829, 0, 0, 0, 1, 1,
0.164043, -0.007954524, 0.7379183, 1, 1, 1, 1, 1,
0.1647497, -1.24464, 2.274606, 1, 1, 1, 1, 1,
0.1666314, -0.8715192, 3.033403, 1, 1, 1, 1, 1,
0.1678473, 1.380099, -1.605001, 1, 1, 1, 1, 1,
0.1785223, -0.02618704, 0.5007865, 1, 1, 1, 1, 1,
0.1809135, -0.1812411, 2.890089, 1, 1, 1, 1, 1,
0.1927352, 1.764429, -0.8383051, 1, 1, 1, 1, 1,
0.1936249, 0.020143, 2.139126, 1, 1, 1, 1, 1,
0.1970057, 1.022546, 1.532016, 1, 1, 1, 1, 1,
0.1983669, -1.004642, 4.444562, 1, 1, 1, 1, 1,
0.1987182, -0.7513698, 2.717695, 1, 1, 1, 1, 1,
0.2012551, 1.355005, -0.8844305, 1, 1, 1, 1, 1,
0.20243, 0.4351629, 1.636788, 1, 1, 1, 1, 1,
0.2030277, -1.030229, 1.694148, 1, 1, 1, 1, 1,
0.203187, 0.04431433, -1.553824, 1, 1, 1, 1, 1,
0.2051004, 0.255248, 0.2630008, 0, 0, 1, 1, 1,
0.2064373, 0.9323969, -0.1104757, 1, 0, 0, 1, 1,
0.2091347, 1.635411, 0.4113264, 1, 0, 0, 1, 1,
0.2122521, -1.024901, 4.165875, 1, 0, 0, 1, 1,
0.2129054, 0.05204134, 1.889385, 1, 0, 0, 1, 1,
0.2151131, -0.02057316, 1.375434, 1, 0, 0, 1, 1,
0.2162913, -0.6924694, 2.4626, 0, 0, 0, 1, 1,
0.221581, -1.016993, 2.888302, 0, 0, 0, 1, 1,
0.2239199, 1.118594, -0.1675758, 0, 0, 0, 1, 1,
0.2241375, 0.202867, 1.600351, 0, 0, 0, 1, 1,
0.2278167, 0.3456953, 0.006240915, 0, 0, 0, 1, 1,
0.2328773, 0.9734274, 2.609969, 0, 0, 0, 1, 1,
0.2342898, -0.4409874, 2.516627, 0, 0, 0, 1, 1,
0.2383471, -0.241203, 2.349504, 1, 1, 1, 1, 1,
0.2411595, 0.0140724, 3.023287, 1, 1, 1, 1, 1,
0.2446838, -0.2847719, 0.9803311, 1, 1, 1, 1, 1,
0.2581523, 1.629387, 1.097037, 1, 1, 1, 1, 1,
0.2612927, -2.228978, 4.01219, 1, 1, 1, 1, 1,
0.2618257, 0.2464646, 1.936911, 1, 1, 1, 1, 1,
0.2641587, 0.5798783, -0.07169634, 1, 1, 1, 1, 1,
0.2652096, 0.7218811, 1.389432, 1, 1, 1, 1, 1,
0.2685033, -0.07792863, 3.566914, 1, 1, 1, 1, 1,
0.2688352, 0.5825498, 0.3100671, 1, 1, 1, 1, 1,
0.2695121, -1.329802, 3.735813, 1, 1, 1, 1, 1,
0.2704865, 1.140397, 1.255289, 1, 1, 1, 1, 1,
0.2709437, -1.42878, 2.583766, 1, 1, 1, 1, 1,
0.2743509, -0.4120244, 2.038882, 1, 1, 1, 1, 1,
0.2806238, -1.235864, 3.95926, 1, 1, 1, 1, 1,
0.2817772, -2.113505, 4.338778, 0, 0, 1, 1, 1,
0.2821971, -1.898231, 3.755047, 1, 0, 0, 1, 1,
0.2835422, -0.2930063, 0.4902144, 1, 0, 0, 1, 1,
0.2838525, -1.066091, 2.319575, 1, 0, 0, 1, 1,
0.2870076, 1.463838, 1.143303, 1, 0, 0, 1, 1,
0.302426, -0.3573409, 1.4384, 1, 0, 0, 1, 1,
0.3024645, 0.614654, 0.4879729, 0, 0, 0, 1, 1,
0.3040144, -0.9611732, 2.754846, 0, 0, 0, 1, 1,
0.3058503, -0.6854317, 2.690487, 0, 0, 0, 1, 1,
0.3064603, 0.8310453, -0.2721508, 0, 0, 0, 1, 1,
0.3065687, 0.09992446, 0.735562, 0, 0, 0, 1, 1,
0.3069271, -1.065784, 3.581424, 0, 0, 0, 1, 1,
0.3075398, -0.1184805, 1.738468, 0, 0, 0, 1, 1,
0.3084096, -0.4279918, 1.905346, 1, 1, 1, 1, 1,
0.3102489, 0.5175682, -0.6130316, 1, 1, 1, 1, 1,
0.311528, -0.3388262, 2.764313, 1, 1, 1, 1, 1,
0.311932, 0.07755571, 1.080534, 1, 1, 1, 1, 1,
0.3148792, -0.1300175, 1.033525, 1, 1, 1, 1, 1,
0.3153464, 1.02255, 1.416429, 1, 1, 1, 1, 1,
0.3209015, -0.7262315, 4.57479, 1, 1, 1, 1, 1,
0.322924, -0.332132, 2.931151, 1, 1, 1, 1, 1,
0.324144, 0.1889084, 0.6742768, 1, 1, 1, 1, 1,
0.3261274, -0.01121848, 2.786947, 1, 1, 1, 1, 1,
0.328726, 0.1989921, 1.488673, 1, 1, 1, 1, 1,
0.3292087, -1.206115, 3.532347, 1, 1, 1, 1, 1,
0.3293492, -0.6671095, 2.4845, 1, 1, 1, 1, 1,
0.3388454, -1.004619, 1.085306, 1, 1, 1, 1, 1,
0.3401824, -2.539613, 3.466497, 1, 1, 1, 1, 1,
0.3447334, -0.4043595, 1.427934, 0, 0, 1, 1, 1,
0.3473287, 0.0003480529, 1.871207, 1, 0, 0, 1, 1,
0.3475755, 1.87997, -0.1944281, 1, 0, 0, 1, 1,
0.3515416, 0.2360352, 0.7919586, 1, 0, 0, 1, 1,
0.3528434, -0.4515939, 2.80865, 1, 0, 0, 1, 1,
0.3618731, 1.669413, -2.114031, 1, 0, 0, 1, 1,
0.3632839, -0.8143809, 2.176335, 0, 0, 0, 1, 1,
0.3665581, 0.6271557, 0.6983643, 0, 0, 0, 1, 1,
0.3678225, 0.1538609, 1.780736, 0, 0, 0, 1, 1,
0.3685137, -0.5087616, 3.389103, 0, 0, 0, 1, 1,
0.3712476, -1.704592, 2.201787, 0, 0, 0, 1, 1,
0.3720363, 0.7728381, 0.2902715, 0, 0, 0, 1, 1,
0.3736456, -0.01315901, 1.199897, 0, 0, 0, 1, 1,
0.3776351, 0.1610541, 2.987734, 1, 1, 1, 1, 1,
0.377668, -0.586371, 3.399355, 1, 1, 1, 1, 1,
0.3782378, 0.4991244, 0.9853335, 1, 1, 1, 1, 1,
0.3791542, 0.47544, -0.4273976, 1, 1, 1, 1, 1,
0.3816509, 1.712858, -0.3863827, 1, 1, 1, 1, 1,
0.3832395, 0.7272742, 1.549116, 1, 1, 1, 1, 1,
0.3854158, -0.2481099, 1.255271, 1, 1, 1, 1, 1,
0.3885379, 0.04782808, 3.529139, 1, 1, 1, 1, 1,
0.3952324, 1.457166, -1.416218, 1, 1, 1, 1, 1,
0.4002628, 1.30818, -0.04843329, 1, 1, 1, 1, 1,
0.4078596, 1.102008, 1.311081, 1, 1, 1, 1, 1,
0.4094863, 0.8552537, 1.236938, 1, 1, 1, 1, 1,
0.4114848, 0.8859894, 0.1568389, 1, 1, 1, 1, 1,
0.4123484, -1.012846, 3.748555, 1, 1, 1, 1, 1,
0.4126913, -0.7369435, 1.501315, 1, 1, 1, 1, 1,
0.4145943, -0.05585082, 1.477452, 0, 0, 1, 1, 1,
0.417417, 1.193756, -1.142838, 1, 0, 0, 1, 1,
0.420249, 0.2725029, 1.594607, 1, 0, 0, 1, 1,
0.422381, -0.1307224, 2.016884, 1, 0, 0, 1, 1,
0.4229074, -0.1963656, 1.875326, 1, 0, 0, 1, 1,
0.4269756, 1.729922, -0.09565921, 1, 0, 0, 1, 1,
0.4285922, -0.5525061, 1.612437, 0, 0, 0, 1, 1,
0.4296931, -0.4084898, 2.207731, 0, 0, 0, 1, 1,
0.4355817, -0.2070405, 1.405045, 0, 0, 0, 1, 1,
0.4375448, 1.035341, -0.6788734, 0, 0, 0, 1, 1,
0.4412363, -0.3618471, 2.15178, 0, 0, 0, 1, 1,
0.4417604, -0.4365864, 3.708134, 0, 0, 0, 1, 1,
0.4434952, -0.4924379, 3.158998, 0, 0, 0, 1, 1,
0.4456694, -0.3612791, 1.638261, 1, 1, 1, 1, 1,
0.4501904, 1.338672, 1.387216, 1, 1, 1, 1, 1,
0.4526813, 1.824462, -0.6363485, 1, 1, 1, 1, 1,
0.4553176, -1.19311, 2.219224, 1, 1, 1, 1, 1,
0.4568629, 0.8222649, 1.414073, 1, 1, 1, 1, 1,
0.4610504, 1.723941, 2.248147, 1, 1, 1, 1, 1,
0.4615717, -2.576744, 2.564111, 1, 1, 1, 1, 1,
0.4677275, 0.2755844, 0.2170949, 1, 1, 1, 1, 1,
0.4738849, -0.6846464, 0.9567441, 1, 1, 1, 1, 1,
0.4742306, -1.609596, 1.761561, 1, 1, 1, 1, 1,
0.4753087, -0.6207482, 2.885921, 1, 1, 1, 1, 1,
0.4817879, 1.064077, -0.5605957, 1, 1, 1, 1, 1,
0.4849641, -0.977376, 2.517401, 1, 1, 1, 1, 1,
0.4859993, -0.3196147, 3.538439, 1, 1, 1, 1, 1,
0.4878646, -0.7715087, 1.100261, 1, 1, 1, 1, 1,
0.4885019, -0.1521002, 3.294278, 0, 0, 1, 1, 1,
0.4928932, 0.346226, 1.265568, 1, 0, 0, 1, 1,
0.4936896, -1.315476, 4.627975, 1, 0, 0, 1, 1,
0.501021, -1.908037, 4.822879, 1, 0, 0, 1, 1,
0.5043034, -0.2849948, 2.782268, 1, 0, 0, 1, 1,
0.5043108, 0.8101332, -0.03649337, 1, 0, 0, 1, 1,
0.5056599, 1.3112, -0.7534812, 0, 0, 0, 1, 1,
0.5065901, 0.3973053, 2.009966, 0, 0, 0, 1, 1,
0.510725, 0.3155983, -0.1437921, 0, 0, 0, 1, 1,
0.5173184, -0.5862542, 2.137481, 0, 0, 0, 1, 1,
0.5183245, -0.1054473, 1.396139, 0, 0, 0, 1, 1,
0.525444, 1.653674, 1.527843, 0, 0, 0, 1, 1,
0.5273622, -0.3861389, 1.707446, 0, 0, 0, 1, 1,
0.5281383, 0.3745635, 0.9393595, 1, 1, 1, 1, 1,
0.5285752, -0.7591485, 1.500325, 1, 1, 1, 1, 1,
0.5312814, -0.389055, 1.635468, 1, 1, 1, 1, 1,
0.5480931, -0.8596348, 2.127513, 1, 1, 1, 1, 1,
0.5524487, 1.167001, 1.281469, 1, 1, 1, 1, 1,
0.5580111, -0.7547871, 1.774772, 1, 1, 1, 1, 1,
0.5604627, 1.005865, 1.160142, 1, 1, 1, 1, 1,
0.5625781, -1.450943, 3.509173, 1, 1, 1, 1, 1,
0.5656564, 0.5437362, -1.384326, 1, 1, 1, 1, 1,
0.570136, 1.788357, 0.9926194, 1, 1, 1, 1, 1,
0.5720341, 0.6468628, 3.185622, 1, 1, 1, 1, 1,
0.5770255, -1.324091, 3.744374, 1, 1, 1, 1, 1,
0.5775683, -0.1633094, 2.059761, 1, 1, 1, 1, 1,
0.5806345, -0.2853605, 0.04674165, 1, 1, 1, 1, 1,
0.5877252, -0.1855238, 2.71689, 1, 1, 1, 1, 1,
0.5890763, 0.3090283, 0.4976842, 0, 0, 1, 1, 1,
0.5904616, -0.9533795, 2.969941, 1, 0, 0, 1, 1,
0.5968921, -0.726147, 0.6639773, 1, 0, 0, 1, 1,
0.5991951, -0.9033526, 3.927061, 1, 0, 0, 1, 1,
0.6029631, 0.6771019, 1.551375, 1, 0, 0, 1, 1,
0.6064149, 0.2984423, 1.345472, 1, 0, 0, 1, 1,
0.6066993, -0.0866074, 1.314029, 0, 0, 0, 1, 1,
0.6078891, 0.6812744, 1.271222, 0, 0, 0, 1, 1,
0.6093529, -0.367962, 3.040017, 0, 0, 0, 1, 1,
0.6094975, -0.9794951, 4.226077, 0, 0, 0, 1, 1,
0.6155153, 0.4604044, 1.072051, 0, 0, 0, 1, 1,
0.6188304, -1.512102, 4.229762, 0, 0, 0, 1, 1,
0.6207737, -1.722111, 1.975326, 0, 0, 0, 1, 1,
0.6246093, -0.717568, 2.409769, 1, 1, 1, 1, 1,
0.629311, -0.2532568, -0.2535717, 1, 1, 1, 1, 1,
0.6336922, -0.5215953, 3.06839, 1, 1, 1, 1, 1,
0.6361321, -0.4868829, 3.012629, 1, 1, 1, 1, 1,
0.6410525, -0.6765102, 2.649805, 1, 1, 1, 1, 1,
0.6468804, 0.8068797, 0.7846572, 1, 1, 1, 1, 1,
0.6500899, -0.9129454, 1.687259, 1, 1, 1, 1, 1,
0.6534696, 0.2983365, 0.6201748, 1, 1, 1, 1, 1,
0.653626, 0.4111641, 0.6963842, 1, 1, 1, 1, 1,
0.6700855, 0.1465278, 1.358951, 1, 1, 1, 1, 1,
0.6703166, 1.578797, 0.5582254, 1, 1, 1, 1, 1,
0.6801905, -0.5400444, 1.972131, 1, 1, 1, 1, 1,
0.680332, 0.1460825, 2.52819, 1, 1, 1, 1, 1,
0.6832417, -0.9520746, 1.272446, 1, 1, 1, 1, 1,
0.6846854, -0.9187564, 3.995375, 1, 1, 1, 1, 1,
0.6875204, 0.3221933, 0.6719464, 0, 0, 1, 1, 1,
0.6886076, -1.338343, 2.871734, 1, 0, 0, 1, 1,
0.6890423, 1.550024, 0.3972089, 1, 0, 0, 1, 1,
0.6896356, 0.4362166, 1.033828, 1, 0, 0, 1, 1,
0.6963141, -0.5159001, 2.130786, 1, 0, 0, 1, 1,
0.698358, 1.587284, 1.859697, 1, 0, 0, 1, 1,
0.7140431, -1.189361, 1.983231, 0, 0, 0, 1, 1,
0.717016, 1.106467, 0.7086311, 0, 0, 0, 1, 1,
0.7205189, 1.45927, 0.03465848, 0, 0, 0, 1, 1,
0.7221446, 1.321659, 0.5414129, 0, 0, 0, 1, 1,
0.7227957, 0.02972537, 2.309762, 0, 0, 0, 1, 1,
0.724113, -1.075144, 2.553744, 0, 0, 0, 1, 1,
0.7246717, 0.9878572, 2.396422, 0, 0, 0, 1, 1,
0.730719, 2.081907, 1.789404, 1, 1, 1, 1, 1,
0.7327101, -1.322078, 3.948092, 1, 1, 1, 1, 1,
0.7365332, 0.5250538, 1.5528, 1, 1, 1, 1, 1,
0.7384539, -1.314444, 0.8552803, 1, 1, 1, 1, 1,
0.7412256, -1.423035, 3.337072, 1, 1, 1, 1, 1,
0.741891, 0.4709275, 3.112813, 1, 1, 1, 1, 1,
0.7433429, 0.116596, 1.772353, 1, 1, 1, 1, 1,
0.7442187, -0.2741201, 2.131266, 1, 1, 1, 1, 1,
0.7445703, 0.1830832, -0.6760949, 1, 1, 1, 1, 1,
0.7457344, -0.2777849, 2.998464, 1, 1, 1, 1, 1,
0.7472774, -0.7172387, 1.86459, 1, 1, 1, 1, 1,
0.7513985, 0.7446972, 0.03024544, 1, 1, 1, 1, 1,
0.7636043, -0.9296311, 3.206884, 1, 1, 1, 1, 1,
0.7640036, 0.5244494, 0.9745257, 1, 1, 1, 1, 1,
0.7648646, -0.754907, 0.9498789, 1, 1, 1, 1, 1,
0.772747, -0.06287273, 2.618649, 0, 0, 1, 1, 1,
0.7787887, -1.286251, 1.55336, 1, 0, 0, 1, 1,
0.7863729, -0.06560982, 1.374809, 1, 0, 0, 1, 1,
0.7876414, -0.3238811, 2.04055, 1, 0, 0, 1, 1,
0.7879011, -1.482164, 0.3280106, 1, 0, 0, 1, 1,
0.7930897, -1.369926, 2.170566, 1, 0, 0, 1, 1,
0.7963844, -0.1112945, 1.289953, 0, 0, 0, 1, 1,
0.8007036, -1.179147, 2.069583, 0, 0, 0, 1, 1,
0.8021267, -0.7008448, 1.798345, 0, 0, 0, 1, 1,
0.8057267, 2.120199, 0.6907501, 0, 0, 0, 1, 1,
0.8059349, 0.3574664, 0.8499364, 0, 0, 0, 1, 1,
0.8078089, -2.184507, 3.079326, 0, 0, 0, 1, 1,
0.8100725, -0.1324157, 0.3624604, 0, 0, 0, 1, 1,
0.8130922, 0.6114037, -0.4889958, 1, 1, 1, 1, 1,
0.8163779, -0.2092213, 0.1070509, 1, 1, 1, 1, 1,
0.8206877, 0.2714603, 0.9483535, 1, 1, 1, 1, 1,
0.8214153, -1.246124, 2.398042, 1, 1, 1, 1, 1,
0.8250666, -0.1226964, 1.282505, 1, 1, 1, 1, 1,
0.8252199, 0.4198337, 2.441274, 1, 1, 1, 1, 1,
0.8371625, -1.355012, 2.950527, 1, 1, 1, 1, 1,
0.8455688, -0.2527409, 1.667285, 1, 1, 1, 1, 1,
0.8491761, 1.29835, 0.8263827, 1, 1, 1, 1, 1,
0.8531625, -0.2639539, 2.819955, 1, 1, 1, 1, 1,
0.8561567, -0.1758563, 1.353485, 1, 1, 1, 1, 1,
0.8608848, -0.1336646, 1.43197, 1, 1, 1, 1, 1,
0.862342, 0.8939612, 0.4044291, 1, 1, 1, 1, 1,
0.8653591, 0.9658927, -0.592726, 1, 1, 1, 1, 1,
0.8779746, 0.5119861, 1.688114, 1, 1, 1, 1, 1,
0.881034, -0.7402161, 1.004192, 0, 0, 1, 1, 1,
0.881229, 0.5487932, 0.3847962, 1, 0, 0, 1, 1,
0.8880109, -0.7798649, 1.126444, 1, 0, 0, 1, 1,
0.8889763, -0.2255147, 1.916902, 1, 0, 0, 1, 1,
0.9007625, -1.039732, 4.086064, 1, 0, 0, 1, 1,
0.9089735, -0.1750463, 0.9497346, 1, 0, 0, 1, 1,
0.9148783, 1.386268, -0.6459666, 0, 0, 0, 1, 1,
0.9156103, 1.571674, -0.1024242, 0, 0, 0, 1, 1,
0.9183847, 0.2637994, -0.1208168, 0, 0, 0, 1, 1,
0.928305, 0.051778, 1.561065, 0, 0, 0, 1, 1,
0.9293106, 0.1987056, 1.341528, 0, 0, 0, 1, 1,
0.9295765, 1.34755, 0.1672362, 0, 0, 0, 1, 1,
0.9334027, -0.2873112, 1.411436, 0, 0, 0, 1, 1,
0.9337429, 1.11222, 0.9377785, 1, 1, 1, 1, 1,
0.9341394, -1.316699, 2.92314, 1, 1, 1, 1, 1,
0.9371673, 1.135425, -0.6555693, 1, 1, 1, 1, 1,
0.9408329, 1.367476, 1.619937, 1, 1, 1, 1, 1,
0.9463679, 0.06780155, -0.2349412, 1, 1, 1, 1, 1,
0.9477742, 0.05990284, 0.5987256, 1, 1, 1, 1, 1,
0.9494731, 1.048059, 1.650407, 1, 1, 1, 1, 1,
0.9494973, -0.7351447, 2.869429, 1, 1, 1, 1, 1,
0.9611835, 0.5659755, 1.317894, 1, 1, 1, 1, 1,
0.9635758, -0.4355237, 2.802427, 1, 1, 1, 1, 1,
0.9644272, 0.2840697, 1.655601, 1, 1, 1, 1, 1,
0.9648651, -0.05415107, 1.384706, 1, 1, 1, 1, 1,
0.9651824, -0.381511, 1.346498, 1, 1, 1, 1, 1,
0.9667506, 0.9680572, 0.3002608, 1, 1, 1, 1, 1,
0.9673856, 0.1722287, 2.243504, 1, 1, 1, 1, 1,
0.9699932, 1.026401, 1.956944, 0, 0, 1, 1, 1,
0.9775093, -0.06560907, 1.336939, 1, 0, 0, 1, 1,
0.9825808, -1.968066, 0.08025447, 1, 0, 0, 1, 1,
0.9957473, 1.026175, 1.337946, 1, 0, 0, 1, 1,
1.009497, 0.2081867, 1.348368, 1, 0, 0, 1, 1,
1.012981, 1.679457, -1.18462, 1, 0, 0, 1, 1,
1.014871, -0.05174481, 0.7322441, 0, 0, 0, 1, 1,
1.021355, 0.3776443, 2.912268, 0, 0, 0, 1, 1,
1.031072, 1.661042, 1.20958, 0, 0, 0, 1, 1,
1.035369, -0.3838899, 3.558259, 0, 0, 0, 1, 1,
1.046128, 0.8937438, 2.309012, 0, 0, 0, 1, 1,
1.046858, 0.7997527, -0.007094754, 0, 0, 0, 1, 1,
1.053025, -0.01300542, 1.405002, 0, 0, 0, 1, 1,
1.053957, -0.05260177, 1.541889, 1, 1, 1, 1, 1,
1.054688, -0.9142826, 1.780203, 1, 1, 1, 1, 1,
1.057216, -1.519171, 1.783632, 1, 1, 1, 1, 1,
1.065487, 1.374222, 1.433735, 1, 1, 1, 1, 1,
1.075601, -0.09433363, 1.441219, 1, 1, 1, 1, 1,
1.083598, -0.5075738, 2.844506, 1, 1, 1, 1, 1,
1.089537, 0.3903003, 0.8137772, 1, 1, 1, 1, 1,
1.090368, 0.2618017, 2.046009, 1, 1, 1, 1, 1,
1.094322, 1.542053, -0.3975768, 1, 1, 1, 1, 1,
1.100117, 0.6757846, 1.414016, 1, 1, 1, 1, 1,
1.100718, -0.7543573, 1.875572, 1, 1, 1, 1, 1,
1.102549, -1.707659, 2.833196, 1, 1, 1, 1, 1,
1.102833, 0.4513063, 2.833272, 1, 1, 1, 1, 1,
1.104049, 2.137881, 1.116766, 1, 1, 1, 1, 1,
1.126482, 1.498728, 3.223929, 1, 1, 1, 1, 1,
1.126885, 0.4891312, 2.163449, 0, 0, 1, 1, 1,
1.133064, -0.7101567, 2.094324, 1, 0, 0, 1, 1,
1.139813, -0.1226016, 2.14929, 1, 0, 0, 1, 1,
1.141072, -0.4179277, 2.338175, 1, 0, 0, 1, 1,
1.141566, 0.9614397, 0.3543755, 1, 0, 0, 1, 1,
1.142724, -0.08820145, 0.4012514, 1, 0, 0, 1, 1,
1.147585, -1.117231, 0.7358466, 0, 0, 0, 1, 1,
1.147867, 1.268061, -1.355742, 0, 0, 0, 1, 1,
1.150012, -2.599884, 3.516093, 0, 0, 0, 1, 1,
1.150227, 0.5944867, 1.441364, 0, 0, 0, 1, 1,
1.154865, 0.5988538, 1.862275, 0, 0, 0, 1, 1,
1.162938, -0.8803771, 1.018909, 0, 0, 0, 1, 1,
1.165974, -0.29649, 1.708562, 0, 0, 0, 1, 1,
1.173617, -0.6988162, 2.476884, 1, 1, 1, 1, 1,
1.193958, -0.1762738, 1.691539, 1, 1, 1, 1, 1,
1.203063, 2.40341, 0.4597642, 1, 1, 1, 1, 1,
1.212902, 0.2578002, 1.31195, 1, 1, 1, 1, 1,
1.220637, -0.1007042, -0.02298738, 1, 1, 1, 1, 1,
1.227879, -2.719841, 3.787448, 1, 1, 1, 1, 1,
1.233759, -0.4111072, 1.696886, 1, 1, 1, 1, 1,
1.23674, 0.4218187, 2.756207, 1, 1, 1, 1, 1,
1.24045, -0.2006845, 2.350115, 1, 1, 1, 1, 1,
1.255598, 1.985124, 1.324123, 1, 1, 1, 1, 1,
1.265872, -1.484447, 3.478441, 1, 1, 1, 1, 1,
1.267514, -0.3522805, 1.634515, 1, 1, 1, 1, 1,
1.268308, -0.3141674, 0.7197678, 1, 1, 1, 1, 1,
1.270391, -2.050538, 1.680474, 1, 1, 1, 1, 1,
1.274786, -1.084697, 2.205539, 1, 1, 1, 1, 1,
1.274962, -0.09972499, 1.941045, 0, 0, 1, 1, 1,
1.279493, -0.3814776, 1.672419, 1, 0, 0, 1, 1,
1.280895, 2.282224, -0.6251773, 1, 0, 0, 1, 1,
1.295205, 3.107085, 0.9202317, 1, 0, 0, 1, 1,
1.30303, -0.02452874, 0.6629719, 1, 0, 0, 1, 1,
1.310254, 0.3532195, 1.531577, 1, 0, 0, 1, 1,
1.311506, 1.872506, -0.4370733, 0, 0, 0, 1, 1,
1.319372, 0.04980087, 2.699863, 0, 0, 0, 1, 1,
1.32288, -1.016442, 1.063292, 0, 0, 0, 1, 1,
1.329909, -1.057675, 3.171689, 0, 0, 0, 1, 1,
1.341405, -1.304201, 2.541787, 0, 0, 0, 1, 1,
1.362828, -0.7018048, 2.003119, 0, 0, 0, 1, 1,
1.370411, -2.008752, 3.535671, 0, 0, 0, 1, 1,
1.379083, 2.313206, 1.064731, 1, 1, 1, 1, 1,
1.389808, 0.4887615, -0.6544189, 1, 1, 1, 1, 1,
1.390459, -0.4163209, 0.8100644, 1, 1, 1, 1, 1,
1.404607, -1.086747, 1.872846, 1, 1, 1, 1, 1,
1.407557, -0.3035154, 0.5965675, 1, 1, 1, 1, 1,
1.415348, -0.9674892, 2.725419, 1, 1, 1, 1, 1,
1.415846, -1.298914, 3.233936, 1, 1, 1, 1, 1,
1.417207, -0.1415397, 2.843681, 1, 1, 1, 1, 1,
1.418096, -0.02637671, 1.335065, 1, 1, 1, 1, 1,
1.419966, -0.1494486, 1.314841, 1, 1, 1, 1, 1,
1.422345, -0.806057, 3.254355, 1, 1, 1, 1, 1,
1.425082, 2.189838, 1.117383, 1, 1, 1, 1, 1,
1.426791, -0.203161, 3.149219, 1, 1, 1, 1, 1,
1.433388, -0.255074, 2.309541, 1, 1, 1, 1, 1,
1.436249, -0.5393634, 1.693254, 1, 1, 1, 1, 1,
1.439108, 0.9092737, 2.243054, 0, 0, 1, 1, 1,
1.448029, -1.074603, 3.573172, 1, 0, 0, 1, 1,
1.462748, 0.7431005, -0.4097444, 1, 0, 0, 1, 1,
1.466575, 0.7252661, 0.6500432, 1, 0, 0, 1, 1,
1.481738, 0.6260346, 1.474643, 1, 0, 0, 1, 1,
1.501653, -1.082, 1.155889, 1, 0, 0, 1, 1,
1.513642, 2.010252, 2.052646, 0, 0, 0, 1, 1,
1.514326, 0.08004763, 2.389247, 0, 0, 0, 1, 1,
1.523486, 1.514473, 0.1566317, 0, 0, 0, 1, 1,
1.524491, 0.2731817, 3.31017, 0, 0, 0, 1, 1,
1.524722, 0.3803367, 2.197969, 0, 0, 0, 1, 1,
1.529886, -0.959416, 2.434035, 0, 0, 0, 1, 1,
1.541345, -1.717005, 3.838913, 0, 0, 0, 1, 1,
1.551114, 0.6506552, 1.073097, 1, 1, 1, 1, 1,
1.553433, -1.190752, 2.234375, 1, 1, 1, 1, 1,
1.558406, 0.9856369, 0.4477699, 1, 1, 1, 1, 1,
1.566051, 1.344178, 2.333285, 1, 1, 1, 1, 1,
1.58127, 0.1886849, 2.620805, 1, 1, 1, 1, 1,
1.599, -1.844609, 1.921506, 1, 1, 1, 1, 1,
1.599783, 0.500811, 2.019077, 1, 1, 1, 1, 1,
1.603186, 0.5449139, 2.314596, 1, 1, 1, 1, 1,
1.607588, -0.0009106669, 0.7951364, 1, 1, 1, 1, 1,
1.625376, 0.2921515, -0.3654203, 1, 1, 1, 1, 1,
1.632453, -1.554414, 2.178775, 1, 1, 1, 1, 1,
1.636389, -0.1861819, 2.585571, 1, 1, 1, 1, 1,
1.644929, 1.585897, 2.673601, 1, 1, 1, 1, 1,
1.663184, -0.7741652, 3.086141, 1, 1, 1, 1, 1,
1.675526, -0.07132178, 1.789413, 1, 1, 1, 1, 1,
1.682008, -0.1773504, 0.1709184, 0, 0, 1, 1, 1,
1.686741, 0.9288312, 0.8195541, 1, 0, 0, 1, 1,
1.688302, 0.6943867, 0.3717824, 1, 0, 0, 1, 1,
1.721562, 1.158318, 2.008609, 1, 0, 0, 1, 1,
1.725661, -0.9618984, 2.88643, 1, 0, 0, 1, 1,
1.72785, -0.9051426, 3.023846, 1, 0, 0, 1, 1,
1.728487, -0.4287318, 0.983593, 0, 0, 0, 1, 1,
1.744871, -0.09830333, 2.495237, 0, 0, 0, 1, 1,
1.748622, 0.8637972, -1.016868, 0, 0, 0, 1, 1,
1.777513, -1.48324, 2.39647, 0, 0, 0, 1, 1,
1.790003, -0.01473393, 2.432577, 0, 0, 0, 1, 1,
1.810924, 0.5386088, 2.298127, 0, 0, 0, 1, 1,
1.815539, 0.1131239, 0.7747571, 0, 0, 0, 1, 1,
1.820665, -1.177518, 1.75843, 1, 1, 1, 1, 1,
1.820766, 0.2515714, -0.4377358, 1, 1, 1, 1, 1,
1.871181, -1.070543, 4.151677, 1, 1, 1, 1, 1,
1.872037, -1.36392, 1.283855, 1, 1, 1, 1, 1,
1.875342, 1.1388, -0.8708823, 1, 1, 1, 1, 1,
1.877528, 2.260728, -0.04258557, 1, 1, 1, 1, 1,
1.900231, 0.6550619, -0.197603, 1, 1, 1, 1, 1,
1.927838, 0.1094102, 1.504365, 1, 1, 1, 1, 1,
1.932069, 1.426164, -1.031731, 1, 1, 1, 1, 1,
1.933702, -0.553991, 2.091426, 1, 1, 1, 1, 1,
1.982536, 0.369689, -0.3275734, 1, 1, 1, 1, 1,
1.994631, 1.331911, 0.005268878, 1, 1, 1, 1, 1,
2.014659, -0.1644395, 1.990842, 1, 1, 1, 1, 1,
2.043776, -0.2860329, 0.975192, 1, 1, 1, 1, 1,
2.061753, -0.6635627, 0.2511227, 1, 1, 1, 1, 1,
2.071315, 0.8232198, 1.382082, 0, 0, 1, 1, 1,
2.086061, -0.1995126, 1.902355, 1, 0, 0, 1, 1,
2.09483, -0.474374, 3.879335, 1, 0, 0, 1, 1,
2.120645, -0.0981666, 1.016728, 1, 0, 0, 1, 1,
2.173213, -0.0848444, -0.2254607, 1, 0, 0, 1, 1,
2.17976, 0.67486, 2.264103, 1, 0, 0, 1, 1,
2.184882, -1.515475, 1.243013, 0, 0, 0, 1, 1,
2.263855, -0.9332687, 3.605116, 0, 0, 0, 1, 1,
2.374082, -0.1400322, 2.03909, 0, 0, 0, 1, 1,
2.47698, 1.234737, 1.499172, 0, 0, 0, 1, 1,
2.499727, 1.245691, 1.215504, 0, 0, 0, 1, 1,
2.524901, -0.866789, 2.616031, 0, 0, 0, 1, 1,
2.526563, -0.1050514, 1.794551, 0, 0, 0, 1, 1,
2.544848, -0.06075137, 0.9954157, 1, 1, 1, 1, 1,
2.628476, -0.1690441, 3.593606, 1, 1, 1, 1, 1,
2.766976, -0.0005754076, 3.356889, 1, 1, 1, 1, 1,
2.778404, -0.7124668, 2.744919, 1, 1, 1, 1, 1,
2.829115, -1.755212, 2.304407, 1, 1, 1, 1, 1,
2.898502, 1.104226, 0.6413003, 1, 1, 1, 1, 1,
3.104475, 0.483196, 1.284688, 1, 1, 1, 1, 1
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
var radius = 9.388322;
var distance = 32.97609;
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
mvMatrix.translate( -0.2499864, -0.0537411, 0.6235769 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97609);
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
