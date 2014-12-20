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
-3.211553, -1.990382, -2.419232, 1, 0, 0, 1,
-2.60074, 0.8540303, -2.404737, 1, 0.007843138, 0, 1,
-2.464554, -0.860245, -0.7313888, 1, 0.01176471, 0, 1,
-2.449897, 0.1587443, -2.183291, 1, 0.01960784, 0, 1,
-2.412865, -1.417497, -0.7442913, 1, 0.02352941, 0, 1,
-2.361721, 0.3718061, -1.750477, 1, 0.03137255, 0, 1,
-2.235703, 1.726896, -0.4831482, 1, 0.03529412, 0, 1,
-2.231043, -0.4901007, -3.318555, 1, 0.04313726, 0, 1,
-2.225607, -1.427821, -2.982677, 1, 0.04705882, 0, 1,
-2.217567, 0.009327719, -1.108468, 1, 0.05490196, 0, 1,
-2.20787, -1.041555, 0.09114942, 1, 0.05882353, 0, 1,
-2.192199, 0.02161078, 0.6064356, 1, 0.06666667, 0, 1,
-2.189762, 0.456411, -0.7511582, 1, 0.07058824, 0, 1,
-2.158059, -0.8365867, -1.812796, 1, 0.07843138, 0, 1,
-2.084174, -0.4099558, -3.582615, 1, 0.08235294, 0, 1,
-2.074072, 0.5789964, -1.198454, 1, 0.09019608, 0, 1,
-2.064486, -0.1725163, -1.491412, 1, 0.09411765, 0, 1,
-2.064167, 0.7183996, -1.335914, 1, 0.1019608, 0, 1,
-2.053082, 0.408513, -2.601861, 1, 0.1098039, 0, 1,
-2.027819, 2.179648, -0.5194409, 1, 0.1137255, 0, 1,
-2.017617, -0.6766548, -1.367446, 1, 0.1215686, 0, 1,
-2.013749, -0.5217246, -1.632375, 1, 0.1254902, 0, 1,
-1.961362, 1.334936, -3.016982, 1, 0.1333333, 0, 1,
-1.960325, -0.6854454, -0.7424071, 1, 0.1372549, 0, 1,
-1.950595, 1.562956, -1.336999, 1, 0.145098, 0, 1,
-1.947659, 0.005222678, -0.9937615, 1, 0.1490196, 0, 1,
-1.926175, -0.7953236, -0.5668144, 1, 0.1568628, 0, 1,
-1.860932, -0.1808596, -2.532762, 1, 0.1607843, 0, 1,
-1.842806, 0.5758031, 0.247426, 1, 0.1686275, 0, 1,
-1.838611, 1.704635, -0.6368937, 1, 0.172549, 0, 1,
-1.798525, -0.7380161, -3.115019, 1, 0.1803922, 0, 1,
-1.750914, 1.56212, -1.111732, 1, 0.1843137, 0, 1,
-1.731326, 0.7917671, -1.040399, 1, 0.1921569, 0, 1,
-1.728785, 1.04313, -1.75656, 1, 0.1960784, 0, 1,
-1.719232, 0.1341887, -0.8208881, 1, 0.2039216, 0, 1,
-1.714642, -1.063327, -2.671176, 1, 0.2117647, 0, 1,
-1.712304, -0.1271641, -3.24218, 1, 0.2156863, 0, 1,
-1.70899, 0.8498055, -0.936725, 1, 0.2235294, 0, 1,
-1.703161, -1.154971, -1.478307, 1, 0.227451, 0, 1,
-1.691828, 0.07402556, -1.489565, 1, 0.2352941, 0, 1,
-1.672176, 0.1732073, 0.4429568, 1, 0.2392157, 0, 1,
-1.619927, 0.9481412, -0.5674552, 1, 0.2470588, 0, 1,
-1.604946, 0.225708, -0.8024398, 1, 0.2509804, 0, 1,
-1.602713, -0.4611201, -0.2600045, 1, 0.2588235, 0, 1,
-1.590769, -0.5059659, -3.519472, 1, 0.2627451, 0, 1,
-1.577394, 0.3311374, -2.578323, 1, 0.2705882, 0, 1,
-1.567195, 1.275282, -0.3370723, 1, 0.2745098, 0, 1,
-1.561363, -0.1026745, -2.308822, 1, 0.282353, 0, 1,
-1.552606, 1.56837, -1.003408, 1, 0.2862745, 0, 1,
-1.53608, -2.196218, -0.3481359, 1, 0.2941177, 0, 1,
-1.518568, 0.8875413, -2.23915, 1, 0.3019608, 0, 1,
-1.499865, -0.9747855, -1.57578, 1, 0.3058824, 0, 1,
-1.492436, 0.7026664, -1.658759, 1, 0.3137255, 0, 1,
-1.483248, -1.194409, -1.937171, 1, 0.3176471, 0, 1,
-1.480601, -0.1931947, -2.577312, 1, 0.3254902, 0, 1,
-1.479713, 0.004236333, -2.024477, 1, 0.3294118, 0, 1,
-1.477647, 0.7361034, -1.401989, 1, 0.3372549, 0, 1,
-1.46703, -0.1165905, -1.864347, 1, 0.3411765, 0, 1,
-1.459541, 0.7147132, 1.176299, 1, 0.3490196, 0, 1,
-1.453189, -0.4361261, -1.216626, 1, 0.3529412, 0, 1,
-1.414938, 0.5801896, -1.048433, 1, 0.3607843, 0, 1,
-1.399902, -0.8472734, -2.023764, 1, 0.3647059, 0, 1,
-1.384071, -0.490933, -2.356373, 1, 0.372549, 0, 1,
-1.367333, 0.752657, -0.3978692, 1, 0.3764706, 0, 1,
-1.362389, 0.8175458, -1.501654, 1, 0.3843137, 0, 1,
-1.359522, 0.4143413, -2.490166, 1, 0.3882353, 0, 1,
-1.354693, -0.0946501, -3.437887, 1, 0.3960784, 0, 1,
-1.338619, -1.963483, -2.440329, 1, 0.4039216, 0, 1,
-1.336303, -0.3485002, -1.874504, 1, 0.4078431, 0, 1,
-1.328479, -1.76494, -2.836248, 1, 0.4156863, 0, 1,
-1.323439, 1.863116, -0.9400712, 1, 0.4196078, 0, 1,
-1.314943, -0.4391094, -2.096542, 1, 0.427451, 0, 1,
-1.303016, 0.9021703, -2.571531, 1, 0.4313726, 0, 1,
-1.302447, -0.3115793, -0.4744635, 1, 0.4392157, 0, 1,
-1.300312, -1.95131, -2.144068, 1, 0.4431373, 0, 1,
-1.291967, 0.07426479, -3.978892, 1, 0.4509804, 0, 1,
-1.273241, 1.768411, -1.538197, 1, 0.454902, 0, 1,
-1.269436, -1.657437, -1.787961, 1, 0.4627451, 0, 1,
-1.266295, -1.140114, -2.483228, 1, 0.4666667, 0, 1,
-1.265044, -0.7718648, -1.886185, 1, 0.4745098, 0, 1,
-1.256332, -1.372136, -0.5428014, 1, 0.4784314, 0, 1,
-1.251988, 0.08182544, -0.9412068, 1, 0.4862745, 0, 1,
-1.238507, 0.3558378, -1.862591, 1, 0.4901961, 0, 1,
-1.22662, 0.6271918, -0.5916286, 1, 0.4980392, 0, 1,
-1.225062, -0.6435889, -0.2415302, 1, 0.5058824, 0, 1,
-1.22443, -0.2785593, -1.371173, 1, 0.509804, 0, 1,
-1.219464, -0.5873666, -1.346928, 1, 0.5176471, 0, 1,
-1.209817, -1.514414, -2.131259, 1, 0.5215687, 0, 1,
-1.20832, -0.4937021, -0.6446961, 1, 0.5294118, 0, 1,
-1.206427, 1.081946, 0.4206407, 1, 0.5333334, 0, 1,
-1.201451, 0.1816187, -2.428956, 1, 0.5411765, 0, 1,
-1.200177, -1.025019, -2.446865, 1, 0.5450981, 0, 1,
-1.200159, 1.277162, -1.305355, 1, 0.5529412, 0, 1,
-1.189166, -1.744742, -0.5024245, 1, 0.5568628, 0, 1,
-1.187217, -2.128017, -0.7076436, 1, 0.5647059, 0, 1,
-1.171967, -0.2726635, -1.556226, 1, 0.5686275, 0, 1,
-1.170918, -0.8252226, -2.438921, 1, 0.5764706, 0, 1,
-1.16419, -0.9771926, -4.319549, 1, 0.5803922, 0, 1,
-1.158624, 0.403405, -2.020531, 1, 0.5882353, 0, 1,
-1.136255, 0.8511007, 0.1964315, 1, 0.5921569, 0, 1,
-1.12941, -0.5733015, -2.053614, 1, 0.6, 0, 1,
-1.121797, 1.649151, -1.110301, 1, 0.6078432, 0, 1,
-1.119245, -0.05460273, -1.29436, 1, 0.6117647, 0, 1,
-1.116211, 0.5450706, -3.301458, 1, 0.6196079, 0, 1,
-1.106811, -0.5748788, -1.585575, 1, 0.6235294, 0, 1,
-1.105104, 0.47471, -1.736795, 1, 0.6313726, 0, 1,
-1.101496, -0.9368126, -0.1757165, 1, 0.6352941, 0, 1,
-1.101066, 0.6005977, -0.6106343, 1, 0.6431373, 0, 1,
-1.092607, -0.05702807, -2.259928, 1, 0.6470588, 0, 1,
-1.083259, -0.01321159, -1.714115, 1, 0.654902, 0, 1,
-1.082273, -0.2747083, -0.35757, 1, 0.6588235, 0, 1,
-1.065331, 0.9324231, 0.06889425, 1, 0.6666667, 0, 1,
-1.065236, -0.7774999, -0.6788039, 1, 0.6705883, 0, 1,
-1.055057, -1.465145, -4.627681, 1, 0.6784314, 0, 1,
-1.054525, 1.123351, -0.6488435, 1, 0.682353, 0, 1,
-1.049992, -1.046311, -1.777021, 1, 0.6901961, 0, 1,
-1.049467, 0.7505707, -2.197823, 1, 0.6941177, 0, 1,
-1.038272, 1.503403, -0.270357, 1, 0.7019608, 0, 1,
-1.036571, -1.374961, -3.520411, 1, 0.7098039, 0, 1,
-1.035877, -1.608099, -3.689792, 1, 0.7137255, 0, 1,
-1.034637, 0.1161819, -1.744831, 1, 0.7215686, 0, 1,
-1.033419, 0.4049566, -0.6110904, 1, 0.7254902, 0, 1,
-1.028168, 2.192476, -1.00273, 1, 0.7333333, 0, 1,
-1.025107, -1.345308, -3.331758, 1, 0.7372549, 0, 1,
-1.019833, -0.09981408, 0.009248324, 1, 0.7450981, 0, 1,
-1.019748, 0.8927745, -1.228744, 1, 0.7490196, 0, 1,
-1.015674, 2.126411, -0.1260216, 1, 0.7568628, 0, 1,
-1.015022, 0.7684827, -0.9853073, 1, 0.7607843, 0, 1,
-1.014862, 0.5555451, -2.192253, 1, 0.7686275, 0, 1,
-1.005035, -0.7740059, -1.813662, 1, 0.772549, 0, 1,
-1.002191, -0.201012, -1.737582, 1, 0.7803922, 0, 1,
-0.9930423, 1.601999, -0.02385379, 1, 0.7843137, 0, 1,
-0.9880254, -0.2152584, -2.717595, 1, 0.7921569, 0, 1,
-0.9813381, 0.273907, -2.579517, 1, 0.7960784, 0, 1,
-0.9799562, -1.803573, -2.929164, 1, 0.8039216, 0, 1,
-0.9791073, -0.006021346, -2.216445, 1, 0.8117647, 0, 1,
-0.978436, 0.6561839, 0.1162096, 1, 0.8156863, 0, 1,
-0.9782329, 0.07062946, -2.446309, 1, 0.8235294, 0, 1,
-0.9726338, -0.5460353, -1.464378, 1, 0.827451, 0, 1,
-0.9676917, 0.2314286, -1.364283, 1, 0.8352941, 0, 1,
-0.9672984, 0.3590567, -0.3921334, 1, 0.8392157, 0, 1,
-0.9644285, -1.925318, -2.883017, 1, 0.8470588, 0, 1,
-0.9583066, -1.145195, -2.878602, 1, 0.8509804, 0, 1,
-0.9563311, -0.2649242, -0.6171914, 1, 0.8588235, 0, 1,
-0.9507582, -1.068043, -2.515567, 1, 0.8627451, 0, 1,
-0.9451838, 1.410935, -0.3538988, 1, 0.8705882, 0, 1,
-0.9432951, -0.9619551, -2.769576, 1, 0.8745098, 0, 1,
-0.9383072, -1.081138, -2.969814, 1, 0.8823529, 0, 1,
-0.9364436, 0.1547486, -0.7501881, 1, 0.8862745, 0, 1,
-0.9315248, 1.333539, -0.8074112, 1, 0.8941177, 0, 1,
-0.9285609, -1.636957, -3.41641, 1, 0.8980392, 0, 1,
-0.9276271, 1.101479, 0.03533112, 1, 0.9058824, 0, 1,
-0.9262155, 0.1855345, -0.9739769, 1, 0.9137255, 0, 1,
-0.9254345, -2.791941, -1.841434, 1, 0.9176471, 0, 1,
-0.9208795, 0.511961, -0.4324957, 1, 0.9254902, 0, 1,
-0.9135789, 0.06775552, -1.869381, 1, 0.9294118, 0, 1,
-0.9066272, 0.5783583, -3.069007, 1, 0.9372549, 0, 1,
-0.9052143, 0.1064612, -0.8041847, 1, 0.9411765, 0, 1,
-0.8942485, 0.3040965, -2.182612, 1, 0.9490196, 0, 1,
-0.8894911, 0.25472, -2.899006, 1, 0.9529412, 0, 1,
-0.8876848, -0.1678708, -1.559632, 1, 0.9607843, 0, 1,
-0.8869132, 0.1675953, -0.9649304, 1, 0.9647059, 0, 1,
-0.8858867, 1.285942, -0.3283019, 1, 0.972549, 0, 1,
-0.8845406, 0.7859994, -1.99961, 1, 0.9764706, 0, 1,
-0.8828622, -1.188999, -2.686126, 1, 0.9843137, 0, 1,
-0.8800478, 0.02760051, -1.25373, 1, 0.9882353, 0, 1,
-0.8789774, -0.1703964, -2.241569, 1, 0.9960784, 0, 1,
-0.8666884, 0.8686001, -0.9325485, 0.9960784, 1, 0, 1,
-0.8644305, 1.353821, -0.9329327, 0.9921569, 1, 0, 1,
-0.8578625, -0.6754612, -3.328804, 0.9843137, 1, 0, 1,
-0.8576616, 0.4066351, -2.238023, 0.9803922, 1, 0, 1,
-0.8558126, 0.1270945, -2.338584, 0.972549, 1, 0, 1,
-0.8543, -0.434553, -2.825958, 0.9686275, 1, 0, 1,
-0.8508121, -0.5589656, -1.355896, 0.9607843, 1, 0, 1,
-0.8480155, 0.9699486, -0.7359351, 0.9568627, 1, 0, 1,
-0.843801, 1.164171, -2.524993, 0.9490196, 1, 0, 1,
-0.8294263, -0.1595169, -0.3092236, 0.945098, 1, 0, 1,
-0.8262644, -1.646468, -6.013517, 0.9372549, 1, 0, 1,
-0.8253505, -0.4689662, -1.733374, 0.9333333, 1, 0, 1,
-0.8240889, 0.250372, -2.127805, 0.9254902, 1, 0, 1,
-0.8234668, -0.8042626, -2.996187, 0.9215686, 1, 0, 1,
-0.8218361, 0.08139626, -1.158935, 0.9137255, 1, 0, 1,
-0.8180731, 1.177235, -0.4704788, 0.9098039, 1, 0, 1,
-0.8179636, -0.7530481, -0.8023878, 0.9019608, 1, 0, 1,
-0.8136848, 0.0692855, -0.9775789, 0.8941177, 1, 0, 1,
-0.8130274, -0.8297653, -2.721428, 0.8901961, 1, 0, 1,
-0.8021476, -1.027316, -1.618832, 0.8823529, 1, 0, 1,
-0.797833, -1.028116, -2.485835, 0.8784314, 1, 0, 1,
-0.7910169, 1.572114, -0.8926628, 0.8705882, 1, 0, 1,
-0.7908381, -2.403618, -3.448552, 0.8666667, 1, 0, 1,
-0.7881772, 1.799414, -0.3473452, 0.8588235, 1, 0, 1,
-0.7846757, -0.2267717, -1.105912, 0.854902, 1, 0, 1,
-0.7840555, -0.02632684, -2.83377, 0.8470588, 1, 0, 1,
-0.7824399, -0.7818109, -1.440409, 0.8431373, 1, 0, 1,
-0.780984, -0.1481798, -1.198305, 0.8352941, 1, 0, 1,
-0.7764652, 1.100406, 0.2327506, 0.8313726, 1, 0, 1,
-0.7754383, -0.5395967, -0.4684338, 0.8235294, 1, 0, 1,
-0.7738879, 0.5715613, -0.5329551, 0.8196079, 1, 0, 1,
-0.7735862, -0.3322859, -0.829832, 0.8117647, 1, 0, 1,
-0.7681735, 0.07963241, -1.075719, 0.8078431, 1, 0, 1,
-0.7526379, -0.2454949, -0.5637364, 0.8, 1, 0, 1,
-0.7522072, 0.1888932, -1.000329, 0.7921569, 1, 0, 1,
-0.7490732, 2.136452, 0.2112943, 0.7882353, 1, 0, 1,
-0.7460679, -0.5616696, -2.6161, 0.7803922, 1, 0, 1,
-0.742846, 0.2745965, -1.650072, 0.7764706, 1, 0, 1,
-0.737367, 1.672873, 0.05304175, 0.7686275, 1, 0, 1,
-0.7333289, -0.70689, -4.418257, 0.7647059, 1, 0, 1,
-0.7296592, 0.04169583, -0.3331901, 0.7568628, 1, 0, 1,
-0.7278038, 1.82348, 0.007737593, 0.7529412, 1, 0, 1,
-0.7196746, -0.01616477, -0.5129122, 0.7450981, 1, 0, 1,
-0.7183573, -0.2755252, -0.9221267, 0.7411765, 1, 0, 1,
-0.7182311, 2.686599, -0.6083912, 0.7333333, 1, 0, 1,
-0.7157267, -0.8722726, -0.1165359, 0.7294118, 1, 0, 1,
-0.714678, -0.1790166, -1.786147, 0.7215686, 1, 0, 1,
-0.7120578, -0.5646974, -3.364332, 0.7176471, 1, 0, 1,
-0.711244, -0.5382662, -2.456828, 0.7098039, 1, 0, 1,
-0.7090793, -1.283874, -2.227481, 0.7058824, 1, 0, 1,
-0.7044581, -0.3565714, -1.549902, 0.6980392, 1, 0, 1,
-0.6959057, 0.6838809, -0.7342291, 0.6901961, 1, 0, 1,
-0.6946248, -0.5200656, -1.459263, 0.6862745, 1, 0, 1,
-0.6902891, 0.3589766, -1.843732, 0.6784314, 1, 0, 1,
-0.6876939, 0.2812568, -2.055231, 0.6745098, 1, 0, 1,
-0.6867221, 0.1806841, -0.9610513, 0.6666667, 1, 0, 1,
-0.6865968, -0.4318376, -1.749799, 0.6627451, 1, 0, 1,
-0.6777478, 0.4226103, -0.7680302, 0.654902, 1, 0, 1,
-0.6763015, -2.575962, -3.107819, 0.6509804, 1, 0, 1,
-0.675944, 1.187421, -0.6171728, 0.6431373, 1, 0, 1,
-0.6736484, 0.2712756, 0.2765017, 0.6392157, 1, 0, 1,
-0.67207, -0.04140755, -2.948114, 0.6313726, 1, 0, 1,
-0.6709583, -0.3913965, -3.473069, 0.627451, 1, 0, 1,
-0.6692733, -0.5060011, -2.778045, 0.6196079, 1, 0, 1,
-0.668447, -0.7787586, -2.672822, 0.6156863, 1, 0, 1,
-0.6671746, 2.622818, -0.1235484, 0.6078432, 1, 0, 1,
-0.6670612, -1.423528, -2.858582, 0.6039216, 1, 0, 1,
-0.6663521, 1.655833, 0.5761261, 0.5960785, 1, 0, 1,
-0.6660662, 0.4502798, -1.350342, 0.5882353, 1, 0, 1,
-0.6629015, -0.009595408, -2.111446, 0.5843138, 1, 0, 1,
-0.6628354, 0.8279697, 0.05034021, 0.5764706, 1, 0, 1,
-0.6623609, 1.209805, -0.2671441, 0.572549, 1, 0, 1,
-0.6613618, -0.4931763, -1.946538, 0.5647059, 1, 0, 1,
-0.6609916, 0.501127, -0.5880696, 0.5607843, 1, 0, 1,
-0.6599095, 0.03083815, -1.661243, 0.5529412, 1, 0, 1,
-0.6587868, -0.6144648, -1.016982, 0.5490196, 1, 0, 1,
-0.6587821, 0.3610365, -1.437136, 0.5411765, 1, 0, 1,
-0.6581502, -0.01656588, -3.280777, 0.5372549, 1, 0, 1,
-0.6549681, 1.736907, -0.1485231, 0.5294118, 1, 0, 1,
-0.6530758, 1.885048, 1.439454, 0.5254902, 1, 0, 1,
-0.6492014, 0.9669965, 0.4386871, 0.5176471, 1, 0, 1,
-0.6491707, -0.2098487, -2.13396, 0.5137255, 1, 0, 1,
-0.6416457, 0.8193836, -2.379919, 0.5058824, 1, 0, 1,
-0.6395465, 0.7497648, -0.8726878, 0.5019608, 1, 0, 1,
-0.6391748, -0.2395484, -2.921901, 0.4941176, 1, 0, 1,
-0.6377906, 2.504007, -0.8336756, 0.4862745, 1, 0, 1,
-0.6376749, 0.3462865, -1.219525, 0.4823529, 1, 0, 1,
-0.6341892, -2.047453, -3.811366, 0.4745098, 1, 0, 1,
-0.6311533, 0.6272901, -0.9687307, 0.4705882, 1, 0, 1,
-0.6286312, -1.227889, -3.047919, 0.4627451, 1, 0, 1,
-0.6199216, 0.3664855, 0.2262838, 0.4588235, 1, 0, 1,
-0.619559, -1.713603, -1.164765, 0.4509804, 1, 0, 1,
-0.6125868, -0.4259206, -2.619788, 0.4470588, 1, 0, 1,
-0.6106842, -0.9001421, -3.999842, 0.4392157, 1, 0, 1,
-0.6089503, 0.297683, -1.410258, 0.4352941, 1, 0, 1,
-0.607641, -2.696275, -0.1699562, 0.427451, 1, 0, 1,
-0.604179, -1.376368, -2.669158, 0.4235294, 1, 0, 1,
-0.6037862, 0.8699065, -0.3365539, 0.4156863, 1, 0, 1,
-0.6017224, -0.0110302, -2.621623, 0.4117647, 1, 0, 1,
-0.6002538, 0.2568602, -1.307614, 0.4039216, 1, 0, 1,
-0.5952389, 1.059432, 0.7389269, 0.3960784, 1, 0, 1,
-0.5935279, -0.6709191, -2.435534, 0.3921569, 1, 0, 1,
-0.5910272, 1.354118, -0.06855272, 0.3843137, 1, 0, 1,
-0.5841521, 0.1395089, 0.1709505, 0.3803922, 1, 0, 1,
-0.5715916, -0.4821079, -1.58257, 0.372549, 1, 0, 1,
-0.5697923, -1.886715, -2.629885, 0.3686275, 1, 0, 1,
-0.5651328, 1.905957, -0.8943266, 0.3607843, 1, 0, 1,
-0.5640289, -2.087886, -4.104775, 0.3568628, 1, 0, 1,
-0.5586933, 0.2563272, -0.5461715, 0.3490196, 1, 0, 1,
-0.5546189, 1.782328, -0.8620628, 0.345098, 1, 0, 1,
-0.5511343, -0.9487311, -1.439808, 0.3372549, 1, 0, 1,
-0.5495422, -2.841906, -2.274537, 0.3333333, 1, 0, 1,
-0.5452967, 0.1019481, -1.575469, 0.3254902, 1, 0, 1,
-0.5429628, 0.4376563, -0.2843204, 0.3215686, 1, 0, 1,
-0.5391396, -0.01155587, 0.9861906, 0.3137255, 1, 0, 1,
-0.5373334, 0.8164389, -1.100496, 0.3098039, 1, 0, 1,
-0.5369229, 1.450294, -0.4424561, 0.3019608, 1, 0, 1,
-0.5343376, 0.5946416, -0.2185179, 0.2941177, 1, 0, 1,
-0.5293938, 0.3812571, 0.7390839, 0.2901961, 1, 0, 1,
-0.5244253, 1.03062, -0.636159, 0.282353, 1, 0, 1,
-0.5200324, 0.4624933, -1.227471, 0.2784314, 1, 0, 1,
-0.518225, -1.078093, -2.861951, 0.2705882, 1, 0, 1,
-0.516281, 0.1919881, -2.468106, 0.2666667, 1, 0, 1,
-0.5113996, 2.149484, 0.1154317, 0.2588235, 1, 0, 1,
-0.505026, -0.1174321, -0.1741663, 0.254902, 1, 0, 1,
-0.5012429, -1.015932, -2.609359, 0.2470588, 1, 0, 1,
-0.4973117, -0.7442339, -1.446203, 0.2431373, 1, 0, 1,
-0.4895605, 0.2860963, -0.5101636, 0.2352941, 1, 0, 1,
-0.485186, 0.6496372, -0.9823508, 0.2313726, 1, 0, 1,
-0.4824809, -0.5894805, -1.01485, 0.2235294, 1, 0, 1,
-0.481771, 1.544959, 0.2786817, 0.2196078, 1, 0, 1,
-0.4798866, 0.01400184, -0.8795964, 0.2117647, 1, 0, 1,
-0.4798536, 0.4506925, 0.1141603, 0.2078431, 1, 0, 1,
-0.4750393, 0.1686814, -1.918319, 0.2, 1, 0, 1,
-0.4742022, -0.4831394, -2.107599, 0.1921569, 1, 0, 1,
-0.4710818, 0.0537218, -1.51368, 0.1882353, 1, 0, 1,
-0.4707078, 0.1894372, 0.513631, 0.1803922, 1, 0, 1,
-0.4700831, -1.692672, -4.200036, 0.1764706, 1, 0, 1,
-0.4668307, 0.9273249, 0.05564707, 0.1686275, 1, 0, 1,
-0.4579622, 1.818914, -1.149735, 0.1647059, 1, 0, 1,
-0.4566319, 0.113362, -2.090949, 0.1568628, 1, 0, 1,
-0.4563693, -0.8124229, -1.788891, 0.1529412, 1, 0, 1,
-0.4544001, 2.041855, 2.096707, 0.145098, 1, 0, 1,
-0.4526028, -0.9828625, -3.865675, 0.1411765, 1, 0, 1,
-0.4467006, 0.7710612, 0.3919517, 0.1333333, 1, 0, 1,
-0.4465252, -0.7698552, -1.70152, 0.1294118, 1, 0, 1,
-0.4465219, -0.6305335, -5.094127, 0.1215686, 1, 0, 1,
-0.4454799, -2.145059, -4.891588, 0.1176471, 1, 0, 1,
-0.4425759, -0.1462105, -1.736044, 0.1098039, 1, 0, 1,
-0.441293, -1.194357, -3.422674, 0.1058824, 1, 0, 1,
-0.4410757, 1.94625, -1.639271, 0.09803922, 1, 0, 1,
-0.4407824, 0.5512508, -0.3623639, 0.09019608, 1, 0, 1,
-0.4360624, -1.517252, -3.179788, 0.08627451, 1, 0, 1,
-0.4339783, -0.4984807, -2.511971, 0.07843138, 1, 0, 1,
-0.4326296, 2.045903, 0.9009885, 0.07450981, 1, 0, 1,
-0.4306906, -0.1909714, -0.6953349, 0.06666667, 1, 0, 1,
-0.4292495, 0.667206, 1.201807, 0.0627451, 1, 0, 1,
-0.4279044, -0.8758501, -2.303947, 0.05490196, 1, 0, 1,
-0.4261392, -0.2778464, -2.018229, 0.05098039, 1, 0, 1,
-0.4201574, 1.282253, -0.3975273, 0.04313726, 1, 0, 1,
-0.4159029, -1.10258, -2.608725, 0.03921569, 1, 0, 1,
-0.4154637, -1.013954, -1.547959, 0.03137255, 1, 0, 1,
-0.4149833, 0.9471077, -0.6790743, 0.02745098, 1, 0, 1,
-0.4076178, -2.603693, -2.560237, 0.01960784, 1, 0, 1,
-0.407217, -0.2523791, -0.5980933, 0.01568628, 1, 0, 1,
-0.4043181, 0.8180392, -1.248526, 0.007843138, 1, 0, 1,
-0.3991677, 0.7188565, -1.190485, 0.003921569, 1, 0, 1,
-0.39745, -0.3360396, -2.396961, 0, 1, 0.003921569, 1,
-0.3865651, -1.133802, -2.71716, 0, 1, 0.01176471, 1,
-0.3844593, 0.2220678, -2.768228, 0, 1, 0.01568628, 1,
-0.3827873, 0.3577327, -1.045623, 0, 1, 0.02352941, 1,
-0.3812111, 1.647514, -0.327987, 0, 1, 0.02745098, 1,
-0.3764957, 2.659478, 1.256744, 0, 1, 0.03529412, 1,
-0.3718295, -0.4896778, -1.671774, 0, 1, 0.03921569, 1,
-0.371123, -0.8803671, -2.883702, 0, 1, 0.04705882, 1,
-0.3646965, 1.425094, 0.05193743, 0, 1, 0.05098039, 1,
-0.3640389, -0.7273497, -2.216482, 0, 1, 0.05882353, 1,
-0.3603823, -1.215283, -1.042444, 0, 1, 0.0627451, 1,
-0.3577732, -0.1911682, -2.964916, 0, 1, 0.07058824, 1,
-0.3560308, -1.402672, -3.566389, 0, 1, 0.07450981, 1,
-0.354562, 0.9437492, 0.008546852, 0, 1, 0.08235294, 1,
-0.3533535, 0.4189941, -0.3299915, 0, 1, 0.08627451, 1,
-0.3514277, 0.6581478, -1.433423, 0, 1, 0.09411765, 1,
-0.3505949, -0.005748111, -0.008066797, 0, 1, 0.1019608, 1,
-0.3480782, -1.859039, -2.295351, 0, 1, 0.1058824, 1,
-0.3459954, 0.5284837, -0.1362341, 0, 1, 0.1137255, 1,
-0.3341373, 0.03287646, -1.704401, 0, 1, 0.1176471, 1,
-0.3333174, 0.6533987, 0.1315998, 0, 1, 0.1254902, 1,
-0.3291582, 1.612928, -0.6922764, 0, 1, 0.1294118, 1,
-0.3277669, 0.5627392, -1.125671, 0, 1, 0.1372549, 1,
-0.3253277, 0.2771009, -0.1133729, 0, 1, 0.1411765, 1,
-0.3199252, -0.9661524, -1.605732, 0, 1, 0.1490196, 1,
-0.31896, -0.3135136, -1.066126, 0, 1, 0.1529412, 1,
-0.3187131, 1.13886, 0.5108454, 0, 1, 0.1607843, 1,
-0.306251, -0.8890185, -2.165615, 0, 1, 0.1647059, 1,
-0.3046688, -1.034015, -3.578396, 0, 1, 0.172549, 1,
-0.2982424, 0.472777, 0.312818, 0, 1, 0.1764706, 1,
-0.2974133, -0.4337609, -1.317892, 0, 1, 0.1843137, 1,
-0.2967187, -0.8348311, -2.519607, 0, 1, 0.1882353, 1,
-0.2966793, 0.6016517, 0.2004163, 0, 1, 0.1960784, 1,
-0.2926492, -0.288664, -3.310386, 0, 1, 0.2039216, 1,
-0.2873853, 0.3725819, -1.565293, 0, 1, 0.2078431, 1,
-0.2861081, -0.06914447, -2.870308, 0, 1, 0.2156863, 1,
-0.2860368, -0.7750556, -2.00567, 0, 1, 0.2196078, 1,
-0.2858369, 1.083912, -0.04727108, 0, 1, 0.227451, 1,
-0.2829427, 1.375667, 0.9645981, 0, 1, 0.2313726, 1,
-0.2780222, 1.147929, 0.2098804, 0, 1, 0.2392157, 1,
-0.2754883, 1.431423, -0.6780736, 0, 1, 0.2431373, 1,
-0.2702996, 0.3071897, -3.801655, 0, 1, 0.2509804, 1,
-0.2674417, -0.4788505, -2.096297, 0, 1, 0.254902, 1,
-0.2673561, 1.306244, 0.1131371, 0, 1, 0.2627451, 1,
-0.2635383, 0.8647178, 0.02391875, 0, 1, 0.2666667, 1,
-0.2624713, 0.3254818, -0.5741963, 0, 1, 0.2745098, 1,
-0.262355, -0.8353642, -1.735202, 0, 1, 0.2784314, 1,
-0.2604723, 1.488528, 1.627868, 0, 1, 0.2862745, 1,
-0.2543985, -0.5848484, -3.456863, 0, 1, 0.2901961, 1,
-0.2499732, 0.6953092, 0.6051811, 0, 1, 0.2980392, 1,
-0.2418181, -1.877243, -2.540627, 0, 1, 0.3058824, 1,
-0.2395139, -0.795473, -1.823928, 0, 1, 0.3098039, 1,
-0.2291918, 1.171262, -1.056346, 0, 1, 0.3176471, 1,
-0.2263319, 0.4248636, 0.4838373, 0, 1, 0.3215686, 1,
-0.2003801, 1.020533, -1.24468, 0, 1, 0.3294118, 1,
-0.1912355, -0.1871939, -2.840587, 0, 1, 0.3333333, 1,
-0.1897103, 0.8863733, -1.286236, 0, 1, 0.3411765, 1,
-0.1818382, 1.199857, -0.5119907, 0, 1, 0.345098, 1,
-0.1780987, -0.3985422, -1.133538, 0, 1, 0.3529412, 1,
-0.1724853, 1.076468, 1.596222, 0, 1, 0.3568628, 1,
-0.1717988, -1.268947, -3.129855, 0, 1, 0.3647059, 1,
-0.1674266, 0.4939108, 1.072141, 0, 1, 0.3686275, 1,
-0.1632812, 0.1386752, 1.25741, 0, 1, 0.3764706, 1,
-0.1622834, 1.267361, -0.124658, 0, 1, 0.3803922, 1,
-0.1608804, 0.1048582, -1.569296, 0, 1, 0.3882353, 1,
-0.1599205, -0.1193013, -1.301895, 0, 1, 0.3921569, 1,
-0.1572245, -1.865125, -3.559262, 0, 1, 0.4, 1,
-0.156913, 0.4196205, -1.366119, 0, 1, 0.4078431, 1,
-0.156518, -0.545122, -3.897338, 0, 1, 0.4117647, 1,
-0.1559493, -1.901176, -3.003189, 0, 1, 0.4196078, 1,
-0.1531218, 1.041531, 0.2520099, 0, 1, 0.4235294, 1,
-0.1523456, -0.2474254, -3.992463, 0, 1, 0.4313726, 1,
-0.1519926, -0.8029434, -2.413877, 0, 1, 0.4352941, 1,
-0.145264, -1.367109, -2.279404, 0, 1, 0.4431373, 1,
-0.1386652, 1.185857, -0.7511713, 0, 1, 0.4470588, 1,
-0.1382811, -0.4815118, -2.63733, 0, 1, 0.454902, 1,
-0.1380262, -0.1248408, -2.459936, 0, 1, 0.4588235, 1,
-0.1361005, -2.051172, -2.649646, 0, 1, 0.4666667, 1,
-0.1315931, 0.9132353, 0.3282042, 0, 1, 0.4705882, 1,
-0.1297979, 0.08878431, -1.71954, 0, 1, 0.4784314, 1,
-0.1290316, -0.02773749, -2.56959, 0, 1, 0.4823529, 1,
-0.127455, 0.9252041, -0.8197385, 0, 1, 0.4901961, 1,
-0.1203343, 0.7282311, -1.714777, 0, 1, 0.4941176, 1,
-0.1101534, 0.76709, -0.3846633, 0, 1, 0.5019608, 1,
-0.1082034, 0.3939467, -1.645513, 0, 1, 0.509804, 1,
-0.1055354, -1.817654, -3.097364, 0, 1, 0.5137255, 1,
-0.1013804, 1.164283, 0.3688636, 0, 1, 0.5215687, 1,
-0.09890807, 1.830704, -1.648178, 0, 1, 0.5254902, 1,
-0.09777454, 0.4287103, -1.513888, 0, 1, 0.5333334, 1,
-0.09670591, -0.06061535, -0.6018684, 0, 1, 0.5372549, 1,
-0.09653635, 0.05392621, 0.02269333, 0, 1, 0.5450981, 1,
-0.08976482, -0.3240977, -3.459031, 0, 1, 0.5490196, 1,
-0.08804476, 0.6856622, -1.884591, 0, 1, 0.5568628, 1,
-0.08764624, -2.109993, -3.423164, 0, 1, 0.5607843, 1,
-0.08756497, 0.3893814, -1.439665, 0, 1, 0.5686275, 1,
-0.08718123, -0.4207752, -3.364053, 0, 1, 0.572549, 1,
-0.08640388, 0.7061879, -1.187157, 0, 1, 0.5803922, 1,
-0.08187863, -0.4601327, -3.116067, 0, 1, 0.5843138, 1,
-0.08012341, -1.147366, -3.474377, 0, 1, 0.5921569, 1,
-0.07763267, 1.809758, -0.2985412, 0, 1, 0.5960785, 1,
-0.07725132, 0.8507801, -2.372764, 0, 1, 0.6039216, 1,
-0.07701588, 0.1057236, -0.7502295, 0, 1, 0.6117647, 1,
-0.0719969, 2.118967, -1.106156, 0, 1, 0.6156863, 1,
-0.07143003, -0.2551797, -3.905936, 0, 1, 0.6235294, 1,
-0.06950463, 1.205736, -0.5474461, 0, 1, 0.627451, 1,
-0.06868508, 0.5684015, -0.6326259, 0, 1, 0.6352941, 1,
-0.06723538, -1.706005, -3.698311, 0, 1, 0.6392157, 1,
-0.06468156, 0.6377239, 1.128332, 0, 1, 0.6470588, 1,
-0.06465383, 2.025245, -0.8500654, 0, 1, 0.6509804, 1,
-0.06103206, -0.8071684, -3.310108, 0, 1, 0.6588235, 1,
-0.05806884, 0.2537163, -1.74607, 0, 1, 0.6627451, 1,
-0.05692968, 1.037452, 0.5894266, 0, 1, 0.6705883, 1,
-0.05583223, 0.1660563, -0.5950593, 0, 1, 0.6745098, 1,
-0.05533442, -0.1338045, -2.576333, 0, 1, 0.682353, 1,
-0.05233842, 1.16273, -0.7187413, 0, 1, 0.6862745, 1,
-0.04820615, 0.451117, -0.2996216, 0, 1, 0.6941177, 1,
-0.04702506, 0.1673364, -0.6849052, 0, 1, 0.7019608, 1,
-0.04571692, 0.9008786, -1.717322, 0, 1, 0.7058824, 1,
-0.04266638, -1.867198, -3.621994, 0, 1, 0.7137255, 1,
-0.03789364, 0.2912759, -1.214329, 0, 1, 0.7176471, 1,
-0.03484957, 0.0008064747, -1.161116, 0, 1, 0.7254902, 1,
-0.03475513, -2.078898, -2.375007, 0, 1, 0.7294118, 1,
-0.0337742, -0.07992464, -1.413598, 0, 1, 0.7372549, 1,
-0.03222843, -1.091039, -3.11691, 0, 1, 0.7411765, 1,
-0.02987523, 1.28685, -0.228515, 0, 1, 0.7490196, 1,
-0.025042, 0.91632, 1.185895, 0, 1, 0.7529412, 1,
-0.02248805, -1.548764, -3.256184, 0, 1, 0.7607843, 1,
-0.0193133, -1.158531, -2.605926, 0, 1, 0.7647059, 1,
-0.01527042, -0.514493, -3.243606, 0, 1, 0.772549, 1,
-0.01523655, 0.7150583, 0.2915539, 0, 1, 0.7764706, 1,
-0.01506172, -1.311326, -1.400739, 0, 1, 0.7843137, 1,
-0.0128644, -0.9775433, -4.191246, 0, 1, 0.7882353, 1,
-0.008686833, -0.5809295, -4.586517, 0, 1, 0.7960784, 1,
-0.008450402, -1.403289, -1.230549, 0, 1, 0.8039216, 1,
-0.007917926, -0.9459357, -3.047035, 0, 1, 0.8078431, 1,
-0.006311272, 1.569395, 0.2001044, 0, 1, 0.8156863, 1,
-0.006155226, -1.496078, -2.038671, 0, 1, 0.8196079, 1,
-0.001913738, -0.8560641, -3.051056, 0, 1, 0.827451, 1,
-0.0005947289, 1.568546, 0.9597681, 0, 1, 0.8313726, 1,
-0.0003709363, 0.3071387, 1.459432, 0, 1, 0.8392157, 1,
0.001003201, -0.3025762, 3.340211, 0, 1, 0.8431373, 1,
0.004790448, -0.4550677, 3.553095, 0, 1, 0.8509804, 1,
0.007869985, 0.1890648, 1.271196, 0, 1, 0.854902, 1,
0.01352878, -1.214205, 4.19225, 0, 1, 0.8627451, 1,
0.01413767, 0.6715686, 0.2474297, 0, 1, 0.8666667, 1,
0.01467267, -0.9869468, 3.186575, 0, 1, 0.8745098, 1,
0.01664593, 1.601163, -1.880023, 0, 1, 0.8784314, 1,
0.01843394, 0.7730039, 0.8876811, 0, 1, 0.8862745, 1,
0.01971036, -0.8543702, 1.493817, 0, 1, 0.8901961, 1,
0.02195858, -3.058109, 2.64157, 0, 1, 0.8980392, 1,
0.02224392, 0.7100659, 1.90987, 0, 1, 0.9058824, 1,
0.02373411, -0.1611282, 3.918311, 0, 1, 0.9098039, 1,
0.02434722, 0.8464174, -0.1328017, 0, 1, 0.9176471, 1,
0.03087403, 1.556942, -1.417106, 0, 1, 0.9215686, 1,
0.03729589, 0.2894619, 1.306601, 0, 1, 0.9294118, 1,
0.03828249, 0.4535257, -1.247712, 0, 1, 0.9333333, 1,
0.03947166, 0.9943776, 1.023425, 0, 1, 0.9411765, 1,
0.04050539, 0.3964156, -0.8160495, 0, 1, 0.945098, 1,
0.04117209, 0.1134783, 1.958932, 0, 1, 0.9529412, 1,
0.0453641, 0.1266918, 1.212713, 0, 1, 0.9568627, 1,
0.04654322, 1.085361, -0.1840783, 0, 1, 0.9647059, 1,
0.04692468, 0.2999205, 0.7511944, 0, 1, 0.9686275, 1,
0.05256711, 1.363752, 1.041144, 0, 1, 0.9764706, 1,
0.05257733, 0.864424, 1.530712, 0, 1, 0.9803922, 1,
0.06871191, 0.4377792, -0.8805574, 0, 1, 0.9882353, 1,
0.06877072, -1.9017, 0.4173856, 0, 1, 0.9921569, 1,
0.07041372, 1.12038, 0.5185176, 0, 1, 1, 1,
0.07613342, -0.4694022, 5.358547, 0, 0.9921569, 1, 1,
0.07907835, 0.5979346, -0.5086609, 0, 0.9882353, 1, 1,
0.08236971, 0.5412422, 0.5713596, 0, 0.9803922, 1, 1,
0.08601163, 0.4890669, -1.321081, 0, 0.9764706, 1, 1,
0.0871006, 0.354992, -0.996544, 0, 0.9686275, 1, 1,
0.0890156, -0.8935735, 5.24646, 0, 0.9647059, 1, 1,
0.09423229, 0.9130708, 0.2975628, 0, 0.9568627, 1, 1,
0.09658669, -0.3597839, 4.485526, 0, 0.9529412, 1, 1,
0.100235, 0.4498633, 1.443877, 0, 0.945098, 1, 1,
0.1014485, -1.45696, 5.043936, 0, 0.9411765, 1, 1,
0.1045242, 0.8119258, -0.5459898, 0, 0.9333333, 1, 1,
0.1053674, 0.963532, -0.1798511, 0, 0.9294118, 1, 1,
0.1076831, -0.3326449, 2.970345, 0, 0.9215686, 1, 1,
0.1106779, 0.4405844, -0.5957104, 0, 0.9176471, 1, 1,
0.1174365, -0.1077674, 1.825963, 0, 0.9098039, 1, 1,
0.1238138, -1.448478, 2.797616, 0, 0.9058824, 1, 1,
0.1319749, 0.1830023, 2.000455, 0, 0.8980392, 1, 1,
0.1321014, 0.4422216, 0.2601263, 0, 0.8901961, 1, 1,
0.1346983, -1.524447, 2.87933, 0, 0.8862745, 1, 1,
0.139049, -1.258488, 3.253994, 0, 0.8784314, 1, 1,
0.1394454, 0.145797, -0.2182809, 0, 0.8745098, 1, 1,
0.1457923, 0.05490818, -0.4754995, 0, 0.8666667, 1, 1,
0.1516687, 1.072189, 0.3920875, 0, 0.8627451, 1, 1,
0.1542996, -0.3305593, 3.07776, 0, 0.854902, 1, 1,
0.1548073, 0.6429855, 0.1796482, 0, 0.8509804, 1, 1,
0.155626, -0.5136093, -0.300967, 0, 0.8431373, 1, 1,
0.1556461, -0.3707792, 3.555522, 0, 0.8392157, 1, 1,
0.1567489, -1.205852, 4.364288, 0, 0.8313726, 1, 1,
0.1585439, 0.5422054, 1.485488, 0, 0.827451, 1, 1,
0.1628105, 0.3332905, -0.6631559, 0, 0.8196079, 1, 1,
0.1731687, -1.31697, 3.801808, 0, 0.8156863, 1, 1,
0.1758004, -0.8457035, 3.304111, 0, 0.8078431, 1, 1,
0.1761756, -1.619119, 3.083921, 0, 0.8039216, 1, 1,
0.1774107, 2.261557, 0.9410477, 0, 0.7960784, 1, 1,
0.1783962, -0.3596156, 2.658314, 0, 0.7882353, 1, 1,
0.1819097, -0.02888356, 1.891275, 0, 0.7843137, 1, 1,
0.1837834, 0.7170698, -0.2648902, 0, 0.7764706, 1, 1,
0.185603, -0.5413668, 1.554985, 0, 0.772549, 1, 1,
0.1880587, 0.4208554, 2.623035, 0, 0.7647059, 1, 1,
0.1908491, 0.8543957, -1.600001, 0, 0.7607843, 1, 1,
0.194646, -0.9551671, 2.442871, 0, 0.7529412, 1, 1,
0.1964462, -0.1329528, 2.123594, 0, 0.7490196, 1, 1,
0.2008042, 0.4290369, 0.664682, 0, 0.7411765, 1, 1,
0.2008123, -0.6488521, 1.618591, 0, 0.7372549, 1, 1,
0.201217, 1.612827, 0.2501276, 0, 0.7294118, 1, 1,
0.2081804, 0.3450587, 0.5794979, 0, 0.7254902, 1, 1,
0.2089728, -0.2112598, 1.601214, 0, 0.7176471, 1, 1,
0.2188902, -0.2178323, 0.7021866, 0, 0.7137255, 1, 1,
0.2192748, -0.08435458, 4.694003, 0, 0.7058824, 1, 1,
0.2235407, -0.3884751, 2.390172, 0, 0.6980392, 1, 1,
0.2238503, 1.867854, 0.5459257, 0, 0.6941177, 1, 1,
0.2265492, 0.2424335, 2.834941, 0, 0.6862745, 1, 1,
0.2293385, 0.9214988, -1.443856, 0, 0.682353, 1, 1,
0.233252, 0.4221721, 0.09730608, 0, 0.6745098, 1, 1,
0.2355609, 0.5036882, 1.349134, 0, 0.6705883, 1, 1,
0.2361398, -0.6298611, 2.082362, 0, 0.6627451, 1, 1,
0.238054, 0.5005375, -0.0435883, 0, 0.6588235, 1, 1,
0.2385909, 0.2799431, -0.4966145, 0, 0.6509804, 1, 1,
0.2388227, 0.03500172, 1.343413, 0, 0.6470588, 1, 1,
0.2424385, 0.9618492, -0.2961202, 0, 0.6392157, 1, 1,
0.2441811, -0.6170735, 3.294834, 0, 0.6352941, 1, 1,
0.2447772, -1.159346, 2.34328, 0, 0.627451, 1, 1,
0.2465328, -0.8667952, 3.406659, 0, 0.6235294, 1, 1,
0.2475809, 2.70166, -0.5590513, 0, 0.6156863, 1, 1,
0.2506041, 0.7082991, 0.4232775, 0, 0.6117647, 1, 1,
0.2510722, 0.852964, 1.278751, 0, 0.6039216, 1, 1,
0.2561369, -0.3976242, 1.331074, 0, 0.5960785, 1, 1,
0.2629352, -0.7666741, 1.176264, 0, 0.5921569, 1, 1,
0.266781, -0.367114, 3.076341, 0, 0.5843138, 1, 1,
0.2669947, 1.144593, 0.2804706, 0, 0.5803922, 1, 1,
0.2737399, -0.1664206, 3.298521, 0, 0.572549, 1, 1,
0.2789544, 2.105899, 0.8301398, 0, 0.5686275, 1, 1,
0.2791771, -0.804692, 3.742273, 0, 0.5607843, 1, 1,
0.2809265, -0.1172709, 2.390193, 0, 0.5568628, 1, 1,
0.2815889, 0.02521365, -0.6779021, 0, 0.5490196, 1, 1,
0.2818924, -2.091991, 3.430981, 0, 0.5450981, 1, 1,
0.2825029, 0.831673, 0.8455408, 0, 0.5372549, 1, 1,
0.2871159, 1.115965, 0.5757325, 0, 0.5333334, 1, 1,
0.2912029, -1.755905, 2.79792, 0, 0.5254902, 1, 1,
0.2913153, -0.4429592, 2.121095, 0, 0.5215687, 1, 1,
0.297685, -2.375697, 2.965622, 0, 0.5137255, 1, 1,
0.3019356, 0.4437558, 1.186291, 0, 0.509804, 1, 1,
0.3082944, -0.001763195, -0.7909068, 0, 0.5019608, 1, 1,
0.3147874, 1.327429, 0.6528111, 0, 0.4941176, 1, 1,
0.3169599, -0.7610603, 4.671026, 0, 0.4901961, 1, 1,
0.3178788, 0.735665, -0.6741961, 0, 0.4823529, 1, 1,
0.3181144, 1.376467, 0.06496927, 0, 0.4784314, 1, 1,
0.3188647, -0.8329076, 2.151517, 0, 0.4705882, 1, 1,
0.3193955, -0.3601061, 1.863468, 0, 0.4666667, 1, 1,
0.3204183, 0.6073624, 2.940099, 0, 0.4588235, 1, 1,
0.3207383, -1.005151, 4.432212, 0, 0.454902, 1, 1,
0.3245411, -0.2617787, 0.8177034, 0, 0.4470588, 1, 1,
0.3268297, 0.3496453, 0.001308307, 0, 0.4431373, 1, 1,
0.3299936, -0.9408455, 2.27223, 0, 0.4352941, 1, 1,
0.332238, 0.009776534, 2.711126, 0, 0.4313726, 1, 1,
0.3360057, 0.547239, 1.602219, 0, 0.4235294, 1, 1,
0.3384496, -1.502521, 1.767964, 0, 0.4196078, 1, 1,
0.3400211, -0.2565495, 3.222334, 0, 0.4117647, 1, 1,
0.3407447, -1.409935, 4.816327, 0, 0.4078431, 1, 1,
0.3414466, 0.699008, -0.06461722, 0, 0.4, 1, 1,
0.3416646, -2.157194, 3.684383, 0, 0.3921569, 1, 1,
0.3426719, -0.3507707, 0.2380756, 0, 0.3882353, 1, 1,
0.3443081, 0.5807034, 0.02021155, 0, 0.3803922, 1, 1,
0.3464636, 1.954853, 0.1799657, 0, 0.3764706, 1, 1,
0.3507083, -0.4322817, 1.991637, 0, 0.3686275, 1, 1,
0.3514633, -1.259137, 2.464079, 0, 0.3647059, 1, 1,
0.3540445, -0.5356045, 0.2012598, 0, 0.3568628, 1, 1,
0.3560567, -0.04665282, 2.282465, 0, 0.3529412, 1, 1,
0.3588997, -1.082787, 1.805384, 0, 0.345098, 1, 1,
0.3600741, 0.642272, -0.02303551, 0, 0.3411765, 1, 1,
0.3600812, 0.4212949, 0.583929, 0, 0.3333333, 1, 1,
0.3608704, 0.1385981, -0.6162361, 0, 0.3294118, 1, 1,
0.3621962, 0.6156549, 1.647673, 0, 0.3215686, 1, 1,
0.3649763, -0.1048193, 2.386969, 0, 0.3176471, 1, 1,
0.3670822, 1.79282, -0.649488, 0, 0.3098039, 1, 1,
0.3727949, 0.3968454, -0.2577834, 0, 0.3058824, 1, 1,
0.3748726, 0.2218877, 3.042191, 0, 0.2980392, 1, 1,
0.3764569, -1.861575, 1.635008, 0, 0.2901961, 1, 1,
0.381094, -0.3428606, 1.375071, 0, 0.2862745, 1, 1,
0.382149, 0.6133589, 0.4723955, 0, 0.2784314, 1, 1,
0.3840623, 2.023278, -0.622779, 0, 0.2745098, 1, 1,
0.3841999, -1.061879, 3.417491, 0, 0.2666667, 1, 1,
0.3842388, 0.3735103, -1.138314, 0, 0.2627451, 1, 1,
0.3895449, 0.7535713, 0.6080264, 0, 0.254902, 1, 1,
0.3927346, 1.321082, -0.1264297, 0, 0.2509804, 1, 1,
0.3932659, -0.5332242, 0.7404428, 0, 0.2431373, 1, 1,
0.3965949, 1.069309, 3.061505, 0, 0.2392157, 1, 1,
0.3986669, 1.194944, -0.2932674, 0, 0.2313726, 1, 1,
0.401713, 1.209105, 1.616237, 0, 0.227451, 1, 1,
0.4027182, 1.045816, 0.2514468, 0, 0.2196078, 1, 1,
0.4271514, 0.07170857, 1.005978, 0, 0.2156863, 1, 1,
0.4343516, -0.6881993, 2.484578, 0, 0.2078431, 1, 1,
0.4353836, -0.8381439, 3.450945, 0, 0.2039216, 1, 1,
0.4397721, 0.709868, 1.687749, 0, 0.1960784, 1, 1,
0.4417761, -0.06146553, 1.140236, 0, 0.1882353, 1, 1,
0.4422569, -0.8222547, 2.124882, 0, 0.1843137, 1, 1,
0.4424713, 1.181949, 0.5647176, 0, 0.1764706, 1, 1,
0.4445015, -0.02144579, 1.10044, 0, 0.172549, 1, 1,
0.4474013, -0.5091095, 2.105798, 0, 0.1647059, 1, 1,
0.4475994, -0.6323168, 1.592408, 0, 0.1607843, 1, 1,
0.4511808, -0.9493081, 3.200436, 0, 0.1529412, 1, 1,
0.4533165, -1.662678, 4.669369, 0, 0.1490196, 1, 1,
0.4587008, 0.6029105, -0.4792082, 0, 0.1411765, 1, 1,
0.4601678, -0.7182481, 1.64961, 0, 0.1372549, 1, 1,
0.4634874, -1.238033, 2.447877, 0, 0.1294118, 1, 1,
0.46448, 1.415141, 1.722518, 0, 0.1254902, 1, 1,
0.4680607, 0.1482024, 0.6207098, 0, 0.1176471, 1, 1,
0.4718018, 0.4419501, 1.250322, 0, 0.1137255, 1, 1,
0.472955, 0.05754187, 1.639114, 0, 0.1058824, 1, 1,
0.4751179, 0.5047888, 1.754967, 0, 0.09803922, 1, 1,
0.4801154, -0.3137423, 1.750142, 0, 0.09411765, 1, 1,
0.4826421, 1.901145, -1.285254, 0, 0.08627451, 1, 1,
0.485221, -2.132563, 3.084199, 0, 0.08235294, 1, 1,
0.4861864, -1.757019, 2.188521, 0, 0.07450981, 1, 1,
0.4869161, 0.5815278, 1.214463, 0, 0.07058824, 1, 1,
0.4870387, 0.6210216, 0.3316344, 0, 0.0627451, 1, 1,
0.4873137, -0.4651591, 2.351631, 0, 0.05882353, 1, 1,
0.4888466, 0.3341838, 2.312604, 0, 0.05098039, 1, 1,
0.4898578, 1.173863, 0.7485988, 0, 0.04705882, 1, 1,
0.4905472, 1.361345, 1.425262, 0, 0.03921569, 1, 1,
0.4907078, 0.7995101, 1.268689, 0, 0.03529412, 1, 1,
0.4925823, -0.2563615, 1.720961, 0, 0.02745098, 1, 1,
0.4946772, 0.6897519, 1.64308, 0, 0.02352941, 1, 1,
0.4970013, 0.468697, -0.7328062, 0, 0.01568628, 1, 1,
0.498109, 1.010649, 2.283297, 0, 0.01176471, 1, 1,
0.5001775, -0.08882207, 1.522092, 0, 0.003921569, 1, 1,
0.5039887, -0.4200674, 1.380839, 0.003921569, 0, 1, 1,
0.50533, 0.536028, 2.596603, 0.007843138, 0, 1, 1,
0.5065905, -1.253989, 2.358175, 0.01568628, 0, 1, 1,
0.5068423, -0.006703201, 1.132017, 0.01960784, 0, 1, 1,
0.510215, 0.3592858, 1.674765, 0.02745098, 0, 1, 1,
0.5108017, -0.7788908, 1.183482, 0.03137255, 0, 1, 1,
0.511378, 0.2009077, 0.08570647, 0.03921569, 0, 1, 1,
0.5138767, -1.894864, 2.013234, 0.04313726, 0, 1, 1,
0.5158439, 0.2623724, 1.589397, 0.05098039, 0, 1, 1,
0.5164598, -0.3126967, 0.7064031, 0.05490196, 0, 1, 1,
0.5203021, -0.2373164, 2.158428, 0.0627451, 0, 1, 1,
0.5227681, -0.9442683, 2.848649, 0.06666667, 0, 1, 1,
0.5232158, -0.3305134, 2.589396, 0.07450981, 0, 1, 1,
0.5238771, 1.174128, 0.07330763, 0.07843138, 0, 1, 1,
0.5254977, 0.2666184, 2.212906, 0.08627451, 0, 1, 1,
0.5265904, -0.5078055, 1.283092, 0.09019608, 0, 1, 1,
0.5299059, 1.707532, 1.431018, 0.09803922, 0, 1, 1,
0.5301769, 0.1555026, 1.193191, 0.1058824, 0, 1, 1,
0.5320823, 0.5918254, 0.4783041, 0.1098039, 0, 1, 1,
0.5320967, 1.42198, 0.8065861, 0.1176471, 0, 1, 1,
0.5332934, -0.1943123, 0.6965531, 0.1215686, 0, 1, 1,
0.533988, -1.185964, 3.307028, 0.1294118, 0, 1, 1,
0.5351677, -0.7590904, 2.967783, 0.1333333, 0, 1, 1,
0.5389112, -1.207617, 0.5297024, 0.1411765, 0, 1, 1,
0.544259, 1.036914, 0.9545919, 0.145098, 0, 1, 1,
0.5445262, -0.4741404, 3.068608, 0.1529412, 0, 1, 1,
0.5491174, 0.6748165, 1.089829, 0.1568628, 0, 1, 1,
0.5520107, -1.672178, 3.122228, 0.1647059, 0, 1, 1,
0.552669, 1.481771, 2.153119, 0.1686275, 0, 1, 1,
0.557439, -1.191709, 0.846858, 0.1764706, 0, 1, 1,
0.5579738, 0.979471, 0.7131543, 0.1803922, 0, 1, 1,
0.5580851, 0.09683467, 1.831056, 0.1882353, 0, 1, 1,
0.5589328, 0.6954395, -0.3802454, 0.1921569, 0, 1, 1,
0.5657449, 1.341982, 0.9043338, 0.2, 0, 1, 1,
0.5672145, -0.233719, 3.171536, 0.2078431, 0, 1, 1,
0.568862, 0.2812711, 2.062858, 0.2117647, 0, 1, 1,
0.5722465, -0.1622538, 3.566339, 0.2196078, 0, 1, 1,
0.5728413, -0.4223717, 2.746439, 0.2235294, 0, 1, 1,
0.572987, -1.767873, 1.678929, 0.2313726, 0, 1, 1,
0.5730649, 0.1555019, 1.468297, 0.2352941, 0, 1, 1,
0.5734216, 1.520623, -0.468721, 0.2431373, 0, 1, 1,
0.5734523, 0.6795083, 0.06353719, 0.2470588, 0, 1, 1,
0.5757321, 1.332571, 1.140218, 0.254902, 0, 1, 1,
0.5793408, 0.2837409, 0.5335799, 0.2588235, 0, 1, 1,
0.5839422, 0.6127808, 0.3759785, 0.2666667, 0, 1, 1,
0.5853156, 0.2509918, 0.9191478, 0.2705882, 0, 1, 1,
0.5918323, -0.9795805, 1.467759, 0.2784314, 0, 1, 1,
0.5932028, 0.9626238, 2.147664, 0.282353, 0, 1, 1,
0.5990811, 0.6053779, 1.946846, 0.2901961, 0, 1, 1,
0.6005116, 1.689992, 1.802089, 0.2941177, 0, 1, 1,
0.6011369, -0.5750852, 2.5215, 0.3019608, 0, 1, 1,
0.6021962, -0.4457758, 3.241171, 0.3098039, 0, 1, 1,
0.602267, 0.7709436, 1.207885, 0.3137255, 0, 1, 1,
0.6038863, 1.393683, 1.45958, 0.3215686, 0, 1, 1,
0.6055684, 0.480857, 1.257537, 0.3254902, 0, 1, 1,
0.6089475, -0.5192375, 1.780649, 0.3333333, 0, 1, 1,
0.6111527, 0.2357709, 0.6796237, 0.3372549, 0, 1, 1,
0.6144676, -1.207887, 3.471282, 0.345098, 0, 1, 1,
0.6147344, -0.520191, 2.279938, 0.3490196, 0, 1, 1,
0.6157676, 0.3724506, 2.134531, 0.3568628, 0, 1, 1,
0.6192075, -0.4725888, 1.632811, 0.3607843, 0, 1, 1,
0.6192555, 1.357215, 1.488364, 0.3686275, 0, 1, 1,
0.6197745, 0.4398449, 1.329532, 0.372549, 0, 1, 1,
0.6258433, -0.3540737, 3.366028, 0.3803922, 0, 1, 1,
0.626067, -1.749455, 4.889558, 0.3843137, 0, 1, 1,
0.6304393, -0.02657802, 1.445429, 0.3921569, 0, 1, 1,
0.6308395, 1.100902, 0.5195444, 0.3960784, 0, 1, 1,
0.6313159, -1.155961, 2.303287, 0.4039216, 0, 1, 1,
0.6385135, 1.42622, -0.3572362, 0.4117647, 0, 1, 1,
0.6421636, 0.1824457, 3.380125, 0.4156863, 0, 1, 1,
0.6433097, -1.901905, 1.816337, 0.4235294, 0, 1, 1,
0.6484429, 0.5846774, 0.9100899, 0.427451, 0, 1, 1,
0.6490688, -1.747425, 3.006132, 0.4352941, 0, 1, 1,
0.6532385, 3.037977, 0.4815954, 0.4392157, 0, 1, 1,
0.656083, 0.9245956, -1.683045, 0.4470588, 0, 1, 1,
0.6605264, -0.2098603, 2.16677, 0.4509804, 0, 1, 1,
0.6617427, -0.5377126, 2.419595, 0.4588235, 0, 1, 1,
0.6642122, 0.8926939, 0.5780913, 0.4627451, 0, 1, 1,
0.6668342, -1.158782, 2.149273, 0.4705882, 0, 1, 1,
0.6672934, -1.057168, 2.346254, 0.4745098, 0, 1, 1,
0.6715401, 1.150598, -0.9279175, 0.4823529, 0, 1, 1,
0.6717157, -0.7348069, 0.6587674, 0.4862745, 0, 1, 1,
0.6755094, -0.498715, 3.666116, 0.4941176, 0, 1, 1,
0.6779422, -0.9984121, 1.78597, 0.5019608, 0, 1, 1,
0.6826821, 0.7500545, 2.085342, 0.5058824, 0, 1, 1,
0.6837904, 0.4843556, 3.426085, 0.5137255, 0, 1, 1,
0.6867576, -0.03577807, 1.217598, 0.5176471, 0, 1, 1,
0.7006078, 0.6339234, 0.1648328, 0.5254902, 0, 1, 1,
0.7045022, -1.29245, 2.614326, 0.5294118, 0, 1, 1,
0.7100701, -2.733006, 3.212257, 0.5372549, 0, 1, 1,
0.7106953, -0.9248533, 2.447736, 0.5411765, 0, 1, 1,
0.7140821, 0.8982388, -0.9524648, 0.5490196, 0, 1, 1,
0.7153138, -0.4265108, 3.129394, 0.5529412, 0, 1, 1,
0.7208729, 0.9785359, 0.07058257, 0.5607843, 0, 1, 1,
0.7218147, 0.5813456, 0.7911643, 0.5647059, 0, 1, 1,
0.7223229, 1.488582, 1.59161, 0.572549, 0, 1, 1,
0.7272422, -1.490257, 2.176908, 0.5764706, 0, 1, 1,
0.728213, 0.1432692, 0.7766139, 0.5843138, 0, 1, 1,
0.7292636, -1.520813, 2.885231, 0.5882353, 0, 1, 1,
0.7315642, 0.6416511, 1.269546, 0.5960785, 0, 1, 1,
0.7333296, 1.654026, -2.390626, 0.6039216, 0, 1, 1,
0.737507, -1.016201, 3.081977, 0.6078432, 0, 1, 1,
0.7387472, 0.7310605, 0.2836055, 0.6156863, 0, 1, 1,
0.739353, 0.2900451, 1.046831, 0.6196079, 0, 1, 1,
0.7424045, 1.530354, -0.2645431, 0.627451, 0, 1, 1,
0.7469676, 0.473184, 1.356493, 0.6313726, 0, 1, 1,
0.7477032, -0.8079783, 3.363943, 0.6392157, 0, 1, 1,
0.7485391, 0.04311255, 1.080615, 0.6431373, 0, 1, 1,
0.7495372, 0.3607842, 1.29296, 0.6509804, 0, 1, 1,
0.7526546, -0.4634958, 2.745046, 0.654902, 0, 1, 1,
0.7550578, 1.108304, -1.328151, 0.6627451, 0, 1, 1,
0.7602838, -0.3524275, 1.187954, 0.6666667, 0, 1, 1,
0.7602907, -0.8878734, 4.044121, 0.6745098, 0, 1, 1,
0.7620397, -0.6250408, 2.46222, 0.6784314, 0, 1, 1,
0.7634564, -1.437972, 3.069138, 0.6862745, 0, 1, 1,
0.7667914, -0.9345734, 1.849809, 0.6901961, 0, 1, 1,
0.7669337, -0.1879898, 0.2069871, 0.6980392, 0, 1, 1,
0.7677422, 0.123184, 1.378103, 0.7058824, 0, 1, 1,
0.7687269, 0.8015683, -0.06214224, 0.7098039, 0, 1, 1,
0.7697082, -1.389482, 4.774471, 0.7176471, 0, 1, 1,
0.7735795, 0.2764391, 1.230125, 0.7215686, 0, 1, 1,
0.7893375, 0.9724687, 0.6244999, 0.7294118, 0, 1, 1,
0.7940297, 0.5167552, 0.4696284, 0.7333333, 0, 1, 1,
0.7972584, 0.03243113, 2.711736, 0.7411765, 0, 1, 1,
0.798308, -1.063172, 1.037142, 0.7450981, 0, 1, 1,
0.803332, 0.5099399, 0.8173431, 0.7529412, 0, 1, 1,
0.8071964, 0.5178005, 0.01308119, 0.7568628, 0, 1, 1,
0.8118793, -0.5588248, 2.180459, 0.7647059, 0, 1, 1,
0.8244473, -0.9416955, 2.568804, 0.7686275, 0, 1, 1,
0.8252209, -0.1336415, 0.7890447, 0.7764706, 0, 1, 1,
0.8262371, -1.584477, 3.769229, 0.7803922, 0, 1, 1,
0.8286611, -0.7497925, 3.545816, 0.7882353, 0, 1, 1,
0.8418449, 1.109078, 1.638982, 0.7921569, 0, 1, 1,
0.8445911, -0.833803, 2.518197, 0.8, 0, 1, 1,
0.8448665, -0.1481484, 0.7104071, 0.8078431, 0, 1, 1,
0.8496531, -0.8415775, 3.166375, 0.8117647, 0, 1, 1,
0.8533838, -0.3517223, 0.4738095, 0.8196079, 0, 1, 1,
0.8660219, -0.2001599, 3.188109, 0.8235294, 0, 1, 1,
0.8764158, -0.09779956, 1.150967, 0.8313726, 0, 1, 1,
0.8816556, -2.294141, 2.804279, 0.8352941, 0, 1, 1,
0.8901329, -0.07551745, 1.633308, 0.8431373, 0, 1, 1,
0.8920702, -0.1312798, 2.913311, 0.8470588, 0, 1, 1,
0.8940266, -1.824536, 2.469842, 0.854902, 0, 1, 1,
0.8944159, 1.018917, -0.6694077, 0.8588235, 0, 1, 1,
0.894738, 1.667386, 0.1329359, 0.8666667, 0, 1, 1,
0.896548, 0.2552839, 3.141822, 0.8705882, 0, 1, 1,
0.8971658, 1.227628, -1.217136, 0.8784314, 0, 1, 1,
0.8972818, 0.03603841, 0.645307, 0.8823529, 0, 1, 1,
0.8998102, -0.9570805, 3.669029, 0.8901961, 0, 1, 1,
0.9069475, 1.571219, 1.792645, 0.8941177, 0, 1, 1,
0.9070849, 0.3334545, 1.588712, 0.9019608, 0, 1, 1,
0.9075077, -0.4981359, 1.003895, 0.9098039, 0, 1, 1,
0.9076228, -0.6516619, 3.006099, 0.9137255, 0, 1, 1,
0.9109273, -1.830139, 2.491843, 0.9215686, 0, 1, 1,
0.9120457, 0.07556316, 1.037955, 0.9254902, 0, 1, 1,
0.9152777, 0.8602962, 1.679124, 0.9333333, 0, 1, 1,
0.9177376, -1.227531, 4.074041, 0.9372549, 0, 1, 1,
0.9362116, 0.3851812, 0.07672051, 0.945098, 0, 1, 1,
0.946289, 0.1648158, -0.2634588, 0.9490196, 0, 1, 1,
0.9466412, 0.4233076, 0.8384817, 0.9568627, 0, 1, 1,
0.9529628, -1.755096, 1.4182, 0.9607843, 0, 1, 1,
0.9572096, 1.448295, 1.722635, 0.9686275, 0, 1, 1,
0.9617433, -0.1902259, 1.786281, 0.972549, 0, 1, 1,
0.974852, -2.147437, 3.567954, 0.9803922, 0, 1, 1,
0.9804532, 0.03819618, 1.763011, 0.9843137, 0, 1, 1,
0.9809952, 0.3801068, 0.8779158, 0.9921569, 0, 1, 1,
0.9840997, -0.8936976, 4.439209, 0.9960784, 0, 1, 1,
0.9841068, -1.410926, 1.67016, 1, 0, 0.9960784, 1,
0.9926736, -0.8087991, 0.8807255, 1, 0, 0.9882353, 1,
0.9997084, 0.1575611, 2.178741, 1, 0, 0.9843137, 1,
1.004993, -1.335419, 1.699578, 1, 0, 0.9764706, 1,
1.005229, -0.07064539, 0.9441952, 1, 0, 0.972549, 1,
1.01384, 0.06741296, 1.649126, 1, 0, 0.9647059, 1,
1.041777, -0.09387661, 2.158376, 1, 0, 0.9607843, 1,
1.044645, 0.6188608, 1.042175, 1, 0, 0.9529412, 1,
1.054408, 1.165668, 0.7714958, 1, 0, 0.9490196, 1,
1.054801, -0.5476815, 2.635127, 1, 0, 0.9411765, 1,
1.059931, -0.2476794, 0.8684762, 1, 0, 0.9372549, 1,
1.060088, 1.59099, 0.2778633, 1, 0, 0.9294118, 1,
1.074163, -0.1732425, 2.606003, 1, 0, 0.9254902, 1,
1.074617, -0.834859, 0.8195406, 1, 0, 0.9176471, 1,
1.080067, -0.6093602, 2.353993, 1, 0, 0.9137255, 1,
1.084082, -0.5628186, 3.48863, 1, 0, 0.9058824, 1,
1.086049, 0.7153984, 1.316512, 1, 0, 0.9019608, 1,
1.0877, -0.9121905, 1.008677, 1, 0, 0.8941177, 1,
1.088704, 0.2946495, 2.434805, 1, 0, 0.8862745, 1,
1.091558, -0.4371214, 1.221088, 1, 0, 0.8823529, 1,
1.096732, -1.275866, 0.8757766, 1, 0, 0.8745098, 1,
1.101406, 0.03866258, 0.4932653, 1, 0, 0.8705882, 1,
1.105178, -0.7033961, 2.577785, 1, 0, 0.8627451, 1,
1.111727, 0.6181464, 1.488093, 1, 0, 0.8588235, 1,
1.126389, -1.023846, 1.688748, 1, 0, 0.8509804, 1,
1.12725, -1.155235, 2.791731, 1, 0, 0.8470588, 1,
1.129845, -2.112136, 2.371098, 1, 0, 0.8392157, 1,
1.137412, -1.529649, 3.359962, 1, 0, 0.8352941, 1,
1.14644, 0.9204712, -0.3139644, 1, 0, 0.827451, 1,
1.146487, -0.8987969, 1.598239, 1, 0, 0.8235294, 1,
1.150179, -1.20264, 3.509048, 1, 0, 0.8156863, 1,
1.152625, 0.4955683, 1.129252, 1, 0, 0.8117647, 1,
1.173837, 1.003968, 0.4679248, 1, 0, 0.8039216, 1,
1.174444, 1.42359, -0.8469615, 1, 0, 0.7960784, 1,
1.176052, -0.5517246, 1.673329, 1, 0, 0.7921569, 1,
1.177624, -1.484486, 1.640156, 1, 0, 0.7843137, 1,
1.180301, -1.94069, 1.558111, 1, 0, 0.7803922, 1,
1.180421, 0.3086522, 0.01508219, 1, 0, 0.772549, 1,
1.185611, -0.7942905, 2.734799, 1, 0, 0.7686275, 1,
1.188114, 0.4038192, 2.533374, 1, 0, 0.7607843, 1,
1.190404, 0.901019, 0.2706603, 1, 0, 0.7568628, 1,
1.19852, -0.5275484, 1.301791, 1, 0, 0.7490196, 1,
1.209085, -0.5944074, 2.566807, 1, 0, 0.7450981, 1,
1.212385, 1.599251, 2.135119, 1, 0, 0.7372549, 1,
1.212431, -0.3775648, 2.384345, 1, 0, 0.7333333, 1,
1.213309, 0.4426761, 2.098823, 1, 0, 0.7254902, 1,
1.215923, 0.6725485, 1.057286, 1, 0, 0.7215686, 1,
1.216714, -2.436267, 4.344757, 1, 0, 0.7137255, 1,
1.217764, -0.9450818, 2.415415, 1, 0, 0.7098039, 1,
1.223142, -0.1034411, 1.382778, 1, 0, 0.7019608, 1,
1.225454, -0.3525812, 2.398391, 1, 0, 0.6941177, 1,
1.234394, 1.05093, 0.7911562, 1, 0, 0.6901961, 1,
1.237097, 0.3247606, 1.679117, 1, 0, 0.682353, 1,
1.240316, -0.9464931, 1.251849, 1, 0, 0.6784314, 1,
1.247197, -0.98579, 1.699323, 1, 0, 0.6705883, 1,
1.253444, 0.5417769, -0.160847, 1, 0, 0.6666667, 1,
1.25728, 0.8900031, 0.7973471, 1, 0, 0.6588235, 1,
1.263642, -0.876964, 1.623391, 1, 0, 0.654902, 1,
1.267707, -1.000837, 0.01745688, 1, 0, 0.6470588, 1,
1.273674, 0.8498539, 1.117289, 1, 0, 0.6431373, 1,
1.273798, -0.2387737, 1.82602, 1, 0, 0.6352941, 1,
1.27607, -0.9407773, 1.090279, 1, 0, 0.6313726, 1,
1.281773, 0.4688683, 2.189964, 1, 0, 0.6235294, 1,
1.288534, -0.5097489, 2.440328, 1, 0, 0.6196079, 1,
1.290694, -1.304957, 2.06024, 1, 0, 0.6117647, 1,
1.291913, 0.7221113, 2.790075, 1, 0, 0.6078432, 1,
1.311151, -0.8787358, 2.161922, 1, 0, 0.6, 1,
1.320239, -1.364646, 2.538897, 1, 0, 0.5921569, 1,
1.320639, 1.048659, 2.880111, 1, 0, 0.5882353, 1,
1.324762, 0.8966312, 2.354312, 1, 0, 0.5803922, 1,
1.328165, -1.205261, 3.153758, 1, 0, 0.5764706, 1,
1.328754, 0.2779697, 1.676142, 1, 0, 0.5686275, 1,
1.331287, 1.496289, 0.4239466, 1, 0, 0.5647059, 1,
1.34369, -1.212979, 3.44608, 1, 0, 0.5568628, 1,
1.354878, 1.038046, 0.788461, 1, 0, 0.5529412, 1,
1.360501, -1.183983, 2.42857, 1, 0, 0.5450981, 1,
1.360991, -0.691464, 1.509396, 1, 0, 0.5411765, 1,
1.368393, -0.2307038, 2.499857, 1, 0, 0.5333334, 1,
1.375006, 1.581104, 2.088886, 1, 0, 0.5294118, 1,
1.377635, -0.3090491, 3.937631, 1, 0, 0.5215687, 1,
1.390589, 0.01490639, 1.170638, 1, 0, 0.5176471, 1,
1.402815, -1.117045, 2.981407, 1, 0, 0.509804, 1,
1.404596, 1.978766, -2.292796, 1, 0, 0.5058824, 1,
1.405437, 0.5649765, 2.175943, 1, 0, 0.4980392, 1,
1.416328, -0.2555543, 2.057681, 1, 0, 0.4901961, 1,
1.417691, -1.018997, 1.1363, 1, 0, 0.4862745, 1,
1.444775, -0.2281014, 1.886087, 1, 0, 0.4784314, 1,
1.445275, -1.38695, 2.738615, 1, 0, 0.4745098, 1,
1.451485, 1.015777, 1.385298, 1, 0, 0.4666667, 1,
1.454468, -0.7875916, 1.473387, 1, 0, 0.4627451, 1,
1.457836, 0.8445013, 0.4544567, 1, 0, 0.454902, 1,
1.458211, 0.4708576, 4.000554, 1, 0, 0.4509804, 1,
1.463208, 2.301374, 0.5516487, 1, 0, 0.4431373, 1,
1.469047, -0.7304112, 3.77979, 1, 0, 0.4392157, 1,
1.472521, 0.04672545, 1.650721, 1, 0, 0.4313726, 1,
1.523049, -0.175824, 1.669964, 1, 0, 0.427451, 1,
1.529449, -0.7566794, 1.651041, 1, 0, 0.4196078, 1,
1.533713, 0.3383273, 1.309821, 1, 0, 0.4156863, 1,
1.537408, -0.5796244, 1.996027, 1, 0, 0.4078431, 1,
1.542491, 0.5775157, 1.416028, 1, 0, 0.4039216, 1,
1.54546, -0.0641045, 1.414409, 1, 0, 0.3960784, 1,
1.564919, 3.448176, 0.6319109, 1, 0, 0.3882353, 1,
1.58173, 0.9707374, 1.680067, 1, 0, 0.3843137, 1,
1.58219, -0.3772102, 3.170787, 1, 0, 0.3764706, 1,
1.591172, -1.381038, 2.084531, 1, 0, 0.372549, 1,
1.600271, -0.1518334, 1.659297, 1, 0, 0.3647059, 1,
1.602398, -0.7344515, 0.3304453, 1, 0, 0.3607843, 1,
1.606771, -0.05499539, 2.465739, 1, 0, 0.3529412, 1,
1.609406, -0.2021696, 2.820258, 1, 0, 0.3490196, 1,
1.622111, 0.8698261, 0.6175489, 1, 0, 0.3411765, 1,
1.622667, 1.664389, -0.6375666, 1, 0, 0.3372549, 1,
1.641424, 0.03881426, 2.757464, 1, 0, 0.3294118, 1,
1.65833, -0.5155787, 1.208795, 1, 0, 0.3254902, 1,
1.663096, -0.1720744, 1.550623, 1, 0, 0.3176471, 1,
1.66985, -0.03085864, 0.704472, 1, 0, 0.3137255, 1,
1.675435, -0.782909, 3.527179, 1, 0, 0.3058824, 1,
1.675529, 1.085675, 0.6870718, 1, 0, 0.2980392, 1,
1.681628, 0.08579184, 2.547464, 1, 0, 0.2941177, 1,
1.685645, -0.02202117, 0.3864877, 1, 0, 0.2862745, 1,
1.702168, -0.6209746, 3.481472, 1, 0, 0.282353, 1,
1.720802, -0.1322293, 3.210351, 1, 0, 0.2745098, 1,
1.720854, 0.6643031, -0.9590835, 1, 0, 0.2705882, 1,
1.72972, 0.6521642, 1.230821, 1, 0, 0.2627451, 1,
1.759759, 0.7793009, 0.7872208, 1, 0, 0.2588235, 1,
1.780779, 1.458516, 1.848969, 1, 0, 0.2509804, 1,
1.787219, -0.6850645, 3.457378, 1, 0, 0.2470588, 1,
1.788645, 0.3366732, 0.7101921, 1, 0, 0.2392157, 1,
1.820225, 0.618887, 2.091565, 1, 0, 0.2352941, 1,
1.828527, -0.4878016, 1.800637, 1, 0, 0.227451, 1,
1.840711, -0.1555642, 4.244475, 1, 0, 0.2235294, 1,
1.847243, -1.589105, 2.070071, 1, 0, 0.2156863, 1,
1.869021, -1.056212, 0.8991563, 1, 0, 0.2117647, 1,
1.897907, -0.9155552, 0.9136881, 1, 0, 0.2039216, 1,
1.912954, -1.235926, 2.634228, 1, 0, 0.1960784, 1,
1.921919, -0.02419805, -0.00655175, 1, 0, 0.1921569, 1,
1.952858, -2.329032, 1.277538, 1, 0, 0.1843137, 1,
1.953811, 0.78912, 2.067221, 1, 0, 0.1803922, 1,
1.960328, 0.2178235, 2.842533, 1, 0, 0.172549, 1,
1.979304, -0.9304627, 1.871515, 1, 0, 0.1686275, 1,
2.012768, 1.47781, 1.785924, 1, 0, 0.1607843, 1,
2.018944, 1.513005, 0.7702512, 1, 0, 0.1568628, 1,
2.032023, 0.3165558, 2.408799, 1, 0, 0.1490196, 1,
2.06585, 0.2850533, 3.426786, 1, 0, 0.145098, 1,
2.086144, 0.3324524, 1.980104, 1, 0, 0.1372549, 1,
2.128057, -0.2133542, 4.003993, 1, 0, 0.1333333, 1,
2.130961, -0.3165067, 2.21105, 1, 0, 0.1254902, 1,
2.159314, -2.214256, 2.905775, 1, 0, 0.1215686, 1,
2.174988, 0.09881096, 1.986472, 1, 0, 0.1137255, 1,
2.187423, 0.7965156, 1.33861, 1, 0, 0.1098039, 1,
2.214704, 0.9320871, 0.7151371, 1, 0, 0.1019608, 1,
2.258632, -2.706503, 4.876809, 1, 0, 0.09411765, 1,
2.272308, -0.1832488, 1.439445, 1, 0, 0.09019608, 1,
2.285581, -0.5667306, 2.181389, 1, 0, 0.08235294, 1,
2.318359, 1.768303, 2.05258, 1, 0, 0.07843138, 1,
2.322335, -0.6086857, 2.315963, 1, 0, 0.07058824, 1,
2.337143, -0.3459643, 1.880663, 1, 0, 0.06666667, 1,
2.371538, -0.2369168, 1.808799, 1, 0, 0.05882353, 1,
2.414082, 1.26413, -0.1583653, 1, 0, 0.05490196, 1,
2.495443, 1.354488, 1.173985, 1, 0, 0.04705882, 1,
2.559752, -1.008941, 1.03375, 1, 0, 0.04313726, 1,
2.658115, -1.392916, 3.329187, 1, 0, 0.03529412, 1,
2.780461, -1.165291, 0.5322745, 1, 0, 0.03137255, 1,
2.780982, 0.5831755, 2.23029, 1, 0, 0.02352941, 1,
2.891038, -0.6595877, 1.961785, 1, 0, 0.01960784, 1,
2.97648, 0.995816, 0.6004147, 1, 0, 0.01176471, 1,
3.14762, -0.2570924, 2.070093, 1, 0, 0.007843138, 1
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
-0.03196657, -4.160924, -7.941082, 0, -0.5, 0.5, 0.5,
-0.03196657, -4.160924, -7.941082, 1, -0.5, 0.5, 0.5,
-0.03196657, -4.160924, -7.941082, 1, 1.5, 0.5, 0.5,
-0.03196657, -4.160924, -7.941082, 0, 1.5, 0.5, 0.5
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
-4.289433, 0.1950337, -7.941082, 0, -0.5, 0.5, 0.5,
-4.289433, 0.1950337, -7.941082, 1, -0.5, 0.5, 0.5,
-4.289433, 0.1950337, -7.941082, 1, 1.5, 0.5, 0.5,
-4.289433, 0.1950337, -7.941082, 0, 1.5, 0.5, 0.5
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
-4.289433, -4.160924, -0.3274851, 0, -0.5, 0.5, 0.5,
-4.289433, -4.160924, -0.3274851, 1, -0.5, 0.5, 0.5,
-4.289433, -4.160924, -0.3274851, 1, 1.5, 0.5, 0.5,
-4.289433, -4.160924, -0.3274851, 0, 1.5, 0.5, 0.5
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
-3, -3.155703, -6.184098,
3, -3.155703, -6.184098,
-3, -3.155703, -6.184098,
-3, -3.32324, -6.476929,
-2, -3.155703, -6.184098,
-2, -3.32324, -6.476929,
-1, -3.155703, -6.184098,
-1, -3.32324, -6.476929,
0, -3.155703, -6.184098,
0, -3.32324, -6.476929,
1, -3.155703, -6.184098,
1, -3.32324, -6.476929,
2, -3.155703, -6.184098,
2, -3.32324, -6.476929,
3, -3.155703, -6.184098,
3, -3.32324, -6.476929
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
-3, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
-3, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
-3, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
-3, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5,
-2, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
-2, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
-2, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
-2, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5,
-1, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
-1, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
-1, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
-1, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5,
0, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
0, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
0, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
0, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5,
1, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
1, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
1, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
1, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5,
2, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
2, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
2, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
2, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5,
3, -3.658313, -7.06259, 0, -0.5, 0.5, 0.5,
3, -3.658313, -7.06259, 1, -0.5, 0.5, 0.5,
3, -3.658313, -7.06259, 1, 1.5, 0.5, 0.5,
3, -3.658313, -7.06259, 0, 1.5, 0.5, 0.5
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
-3.306941, -3, -6.184098,
-3.306941, 3, -6.184098,
-3.306941, -3, -6.184098,
-3.470689, -3, -6.476929,
-3.306941, -2, -6.184098,
-3.470689, -2, -6.476929,
-3.306941, -1, -6.184098,
-3.470689, -1, -6.476929,
-3.306941, 0, -6.184098,
-3.470689, 0, -6.476929,
-3.306941, 1, -6.184098,
-3.470689, 1, -6.476929,
-3.306941, 2, -6.184098,
-3.470689, 2, -6.476929,
-3.306941, 3, -6.184098,
-3.470689, 3, -6.476929
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
-3.798187, -3, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, -3, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, -3, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, -3, -7.06259, 0, 1.5, 0.5, 0.5,
-3.798187, -2, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, -2, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, -2, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, -2, -7.06259, 0, 1.5, 0.5, 0.5,
-3.798187, -1, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, -1, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, -1, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, -1, -7.06259, 0, 1.5, 0.5, 0.5,
-3.798187, 0, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, 0, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, 0, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, 0, -7.06259, 0, 1.5, 0.5, 0.5,
-3.798187, 1, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, 1, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, 1, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, 1, -7.06259, 0, 1.5, 0.5, 0.5,
-3.798187, 2, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, 2, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, 2, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, 2, -7.06259, 0, 1.5, 0.5, 0.5,
-3.798187, 3, -7.06259, 0, -0.5, 0.5, 0.5,
-3.798187, 3, -7.06259, 1, -0.5, 0.5, 0.5,
-3.798187, 3, -7.06259, 1, 1.5, 0.5, 0.5,
-3.798187, 3, -7.06259, 0, 1.5, 0.5, 0.5
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
-3.306941, -3.155703, -6,
-3.306941, -3.155703, 4,
-3.306941, -3.155703, -6,
-3.470689, -3.32324, -6,
-3.306941, -3.155703, -4,
-3.470689, -3.32324, -4,
-3.306941, -3.155703, -2,
-3.470689, -3.32324, -2,
-3.306941, -3.155703, 0,
-3.470689, -3.32324, 0,
-3.306941, -3.155703, 2,
-3.470689, -3.32324, 2,
-3.306941, -3.155703, 4,
-3.470689, -3.32324, 4
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
-3.798187, -3.658313, -6, 0, -0.5, 0.5, 0.5,
-3.798187, -3.658313, -6, 1, -0.5, 0.5, 0.5,
-3.798187, -3.658313, -6, 1, 1.5, 0.5, 0.5,
-3.798187, -3.658313, -6, 0, 1.5, 0.5, 0.5,
-3.798187, -3.658313, -4, 0, -0.5, 0.5, 0.5,
-3.798187, -3.658313, -4, 1, -0.5, 0.5, 0.5,
-3.798187, -3.658313, -4, 1, 1.5, 0.5, 0.5,
-3.798187, -3.658313, -4, 0, 1.5, 0.5, 0.5,
-3.798187, -3.658313, -2, 0, -0.5, 0.5, 0.5,
-3.798187, -3.658313, -2, 1, -0.5, 0.5, 0.5,
-3.798187, -3.658313, -2, 1, 1.5, 0.5, 0.5,
-3.798187, -3.658313, -2, 0, 1.5, 0.5, 0.5,
-3.798187, -3.658313, 0, 0, -0.5, 0.5, 0.5,
-3.798187, -3.658313, 0, 1, -0.5, 0.5, 0.5,
-3.798187, -3.658313, 0, 1, 1.5, 0.5, 0.5,
-3.798187, -3.658313, 0, 0, 1.5, 0.5, 0.5,
-3.798187, -3.658313, 2, 0, -0.5, 0.5, 0.5,
-3.798187, -3.658313, 2, 1, -0.5, 0.5, 0.5,
-3.798187, -3.658313, 2, 1, 1.5, 0.5, 0.5,
-3.798187, -3.658313, 2, 0, 1.5, 0.5, 0.5,
-3.798187, -3.658313, 4, 0, -0.5, 0.5, 0.5,
-3.798187, -3.658313, 4, 1, -0.5, 0.5, 0.5,
-3.798187, -3.658313, 4, 1, 1.5, 0.5, 0.5,
-3.798187, -3.658313, 4, 0, 1.5, 0.5, 0.5
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
-3.306941, -3.155703, -6.184098,
-3.306941, 3.54577, -6.184098,
-3.306941, -3.155703, 5.529128,
-3.306941, 3.54577, 5.529128,
-3.306941, -3.155703, -6.184098,
-3.306941, -3.155703, 5.529128,
-3.306941, 3.54577, -6.184098,
-3.306941, 3.54577, 5.529128,
-3.306941, -3.155703, -6.184098,
3.243008, -3.155703, -6.184098,
-3.306941, -3.155703, 5.529128,
3.243008, -3.155703, 5.529128,
-3.306941, 3.54577, -6.184098,
3.243008, 3.54577, -6.184098,
-3.306941, 3.54577, 5.529128,
3.243008, 3.54577, 5.529128,
3.243008, -3.155703, -6.184098,
3.243008, 3.54577, -6.184098,
3.243008, -3.155703, 5.529128,
3.243008, 3.54577, 5.529128,
3.243008, -3.155703, -6.184098,
3.243008, -3.155703, 5.529128,
3.243008, 3.54577, -6.184098,
3.243008, 3.54577, 5.529128
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
var radius = 8.009909;
var distance = 35.63699;
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
mvMatrix.translate( 0.03196657, -0.1950337, 0.3274851 );
mvMatrix.scale( 1.32222, 1.292323, 0.7393753 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.63699);
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
nicotine_nicotine_su<-read.table("nicotine_nicotine_su.xyz")
```

```
## Error in read.table("nicotine_nicotine_su.xyz"): no lines available in input
```

```r
x<-nicotine_nicotine_su$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_nicotine_su' not found
```

```r
y<-nicotine_nicotine_su$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_nicotine_su' not found
```

```r
z<-nicotine_nicotine_su$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_nicotine_su' not found
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
-3.211553, -1.990382, -2.419232, 0, 0, 1, 1, 1,
-2.60074, 0.8540303, -2.404737, 1, 0, 0, 1, 1,
-2.464554, -0.860245, -0.7313888, 1, 0, 0, 1, 1,
-2.449897, 0.1587443, -2.183291, 1, 0, 0, 1, 1,
-2.412865, -1.417497, -0.7442913, 1, 0, 0, 1, 1,
-2.361721, 0.3718061, -1.750477, 1, 0, 0, 1, 1,
-2.235703, 1.726896, -0.4831482, 0, 0, 0, 1, 1,
-2.231043, -0.4901007, -3.318555, 0, 0, 0, 1, 1,
-2.225607, -1.427821, -2.982677, 0, 0, 0, 1, 1,
-2.217567, 0.009327719, -1.108468, 0, 0, 0, 1, 1,
-2.20787, -1.041555, 0.09114942, 0, 0, 0, 1, 1,
-2.192199, 0.02161078, 0.6064356, 0, 0, 0, 1, 1,
-2.189762, 0.456411, -0.7511582, 0, 0, 0, 1, 1,
-2.158059, -0.8365867, -1.812796, 1, 1, 1, 1, 1,
-2.084174, -0.4099558, -3.582615, 1, 1, 1, 1, 1,
-2.074072, 0.5789964, -1.198454, 1, 1, 1, 1, 1,
-2.064486, -0.1725163, -1.491412, 1, 1, 1, 1, 1,
-2.064167, 0.7183996, -1.335914, 1, 1, 1, 1, 1,
-2.053082, 0.408513, -2.601861, 1, 1, 1, 1, 1,
-2.027819, 2.179648, -0.5194409, 1, 1, 1, 1, 1,
-2.017617, -0.6766548, -1.367446, 1, 1, 1, 1, 1,
-2.013749, -0.5217246, -1.632375, 1, 1, 1, 1, 1,
-1.961362, 1.334936, -3.016982, 1, 1, 1, 1, 1,
-1.960325, -0.6854454, -0.7424071, 1, 1, 1, 1, 1,
-1.950595, 1.562956, -1.336999, 1, 1, 1, 1, 1,
-1.947659, 0.005222678, -0.9937615, 1, 1, 1, 1, 1,
-1.926175, -0.7953236, -0.5668144, 1, 1, 1, 1, 1,
-1.860932, -0.1808596, -2.532762, 1, 1, 1, 1, 1,
-1.842806, 0.5758031, 0.247426, 0, 0, 1, 1, 1,
-1.838611, 1.704635, -0.6368937, 1, 0, 0, 1, 1,
-1.798525, -0.7380161, -3.115019, 1, 0, 0, 1, 1,
-1.750914, 1.56212, -1.111732, 1, 0, 0, 1, 1,
-1.731326, 0.7917671, -1.040399, 1, 0, 0, 1, 1,
-1.728785, 1.04313, -1.75656, 1, 0, 0, 1, 1,
-1.719232, 0.1341887, -0.8208881, 0, 0, 0, 1, 1,
-1.714642, -1.063327, -2.671176, 0, 0, 0, 1, 1,
-1.712304, -0.1271641, -3.24218, 0, 0, 0, 1, 1,
-1.70899, 0.8498055, -0.936725, 0, 0, 0, 1, 1,
-1.703161, -1.154971, -1.478307, 0, 0, 0, 1, 1,
-1.691828, 0.07402556, -1.489565, 0, 0, 0, 1, 1,
-1.672176, 0.1732073, 0.4429568, 0, 0, 0, 1, 1,
-1.619927, 0.9481412, -0.5674552, 1, 1, 1, 1, 1,
-1.604946, 0.225708, -0.8024398, 1, 1, 1, 1, 1,
-1.602713, -0.4611201, -0.2600045, 1, 1, 1, 1, 1,
-1.590769, -0.5059659, -3.519472, 1, 1, 1, 1, 1,
-1.577394, 0.3311374, -2.578323, 1, 1, 1, 1, 1,
-1.567195, 1.275282, -0.3370723, 1, 1, 1, 1, 1,
-1.561363, -0.1026745, -2.308822, 1, 1, 1, 1, 1,
-1.552606, 1.56837, -1.003408, 1, 1, 1, 1, 1,
-1.53608, -2.196218, -0.3481359, 1, 1, 1, 1, 1,
-1.518568, 0.8875413, -2.23915, 1, 1, 1, 1, 1,
-1.499865, -0.9747855, -1.57578, 1, 1, 1, 1, 1,
-1.492436, 0.7026664, -1.658759, 1, 1, 1, 1, 1,
-1.483248, -1.194409, -1.937171, 1, 1, 1, 1, 1,
-1.480601, -0.1931947, -2.577312, 1, 1, 1, 1, 1,
-1.479713, 0.004236333, -2.024477, 1, 1, 1, 1, 1,
-1.477647, 0.7361034, -1.401989, 0, 0, 1, 1, 1,
-1.46703, -0.1165905, -1.864347, 1, 0, 0, 1, 1,
-1.459541, 0.7147132, 1.176299, 1, 0, 0, 1, 1,
-1.453189, -0.4361261, -1.216626, 1, 0, 0, 1, 1,
-1.414938, 0.5801896, -1.048433, 1, 0, 0, 1, 1,
-1.399902, -0.8472734, -2.023764, 1, 0, 0, 1, 1,
-1.384071, -0.490933, -2.356373, 0, 0, 0, 1, 1,
-1.367333, 0.752657, -0.3978692, 0, 0, 0, 1, 1,
-1.362389, 0.8175458, -1.501654, 0, 0, 0, 1, 1,
-1.359522, 0.4143413, -2.490166, 0, 0, 0, 1, 1,
-1.354693, -0.0946501, -3.437887, 0, 0, 0, 1, 1,
-1.338619, -1.963483, -2.440329, 0, 0, 0, 1, 1,
-1.336303, -0.3485002, -1.874504, 0, 0, 0, 1, 1,
-1.328479, -1.76494, -2.836248, 1, 1, 1, 1, 1,
-1.323439, 1.863116, -0.9400712, 1, 1, 1, 1, 1,
-1.314943, -0.4391094, -2.096542, 1, 1, 1, 1, 1,
-1.303016, 0.9021703, -2.571531, 1, 1, 1, 1, 1,
-1.302447, -0.3115793, -0.4744635, 1, 1, 1, 1, 1,
-1.300312, -1.95131, -2.144068, 1, 1, 1, 1, 1,
-1.291967, 0.07426479, -3.978892, 1, 1, 1, 1, 1,
-1.273241, 1.768411, -1.538197, 1, 1, 1, 1, 1,
-1.269436, -1.657437, -1.787961, 1, 1, 1, 1, 1,
-1.266295, -1.140114, -2.483228, 1, 1, 1, 1, 1,
-1.265044, -0.7718648, -1.886185, 1, 1, 1, 1, 1,
-1.256332, -1.372136, -0.5428014, 1, 1, 1, 1, 1,
-1.251988, 0.08182544, -0.9412068, 1, 1, 1, 1, 1,
-1.238507, 0.3558378, -1.862591, 1, 1, 1, 1, 1,
-1.22662, 0.6271918, -0.5916286, 1, 1, 1, 1, 1,
-1.225062, -0.6435889, -0.2415302, 0, 0, 1, 1, 1,
-1.22443, -0.2785593, -1.371173, 1, 0, 0, 1, 1,
-1.219464, -0.5873666, -1.346928, 1, 0, 0, 1, 1,
-1.209817, -1.514414, -2.131259, 1, 0, 0, 1, 1,
-1.20832, -0.4937021, -0.6446961, 1, 0, 0, 1, 1,
-1.206427, 1.081946, 0.4206407, 1, 0, 0, 1, 1,
-1.201451, 0.1816187, -2.428956, 0, 0, 0, 1, 1,
-1.200177, -1.025019, -2.446865, 0, 0, 0, 1, 1,
-1.200159, 1.277162, -1.305355, 0, 0, 0, 1, 1,
-1.189166, -1.744742, -0.5024245, 0, 0, 0, 1, 1,
-1.187217, -2.128017, -0.7076436, 0, 0, 0, 1, 1,
-1.171967, -0.2726635, -1.556226, 0, 0, 0, 1, 1,
-1.170918, -0.8252226, -2.438921, 0, 0, 0, 1, 1,
-1.16419, -0.9771926, -4.319549, 1, 1, 1, 1, 1,
-1.158624, 0.403405, -2.020531, 1, 1, 1, 1, 1,
-1.136255, 0.8511007, 0.1964315, 1, 1, 1, 1, 1,
-1.12941, -0.5733015, -2.053614, 1, 1, 1, 1, 1,
-1.121797, 1.649151, -1.110301, 1, 1, 1, 1, 1,
-1.119245, -0.05460273, -1.29436, 1, 1, 1, 1, 1,
-1.116211, 0.5450706, -3.301458, 1, 1, 1, 1, 1,
-1.106811, -0.5748788, -1.585575, 1, 1, 1, 1, 1,
-1.105104, 0.47471, -1.736795, 1, 1, 1, 1, 1,
-1.101496, -0.9368126, -0.1757165, 1, 1, 1, 1, 1,
-1.101066, 0.6005977, -0.6106343, 1, 1, 1, 1, 1,
-1.092607, -0.05702807, -2.259928, 1, 1, 1, 1, 1,
-1.083259, -0.01321159, -1.714115, 1, 1, 1, 1, 1,
-1.082273, -0.2747083, -0.35757, 1, 1, 1, 1, 1,
-1.065331, 0.9324231, 0.06889425, 1, 1, 1, 1, 1,
-1.065236, -0.7774999, -0.6788039, 0, 0, 1, 1, 1,
-1.055057, -1.465145, -4.627681, 1, 0, 0, 1, 1,
-1.054525, 1.123351, -0.6488435, 1, 0, 0, 1, 1,
-1.049992, -1.046311, -1.777021, 1, 0, 0, 1, 1,
-1.049467, 0.7505707, -2.197823, 1, 0, 0, 1, 1,
-1.038272, 1.503403, -0.270357, 1, 0, 0, 1, 1,
-1.036571, -1.374961, -3.520411, 0, 0, 0, 1, 1,
-1.035877, -1.608099, -3.689792, 0, 0, 0, 1, 1,
-1.034637, 0.1161819, -1.744831, 0, 0, 0, 1, 1,
-1.033419, 0.4049566, -0.6110904, 0, 0, 0, 1, 1,
-1.028168, 2.192476, -1.00273, 0, 0, 0, 1, 1,
-1.025107, -1.345308, -3.331758, 0, 0, 0, 1, 1,
-1.019833, -0.09981408, 0.009248324, 0, 0, 0, 1, 1,
-1.019748, 0.8927745, -1.228744, 1, 1, 1, 1, 1,
-1.015674, 2.126411, -0.1260216, 1, 1, 1, 1, 1,
-1.015022, 0.7684827, -0.9853073, 1, 1, 1, 1, 1,
-1.014862, 0.5555451, -2.192253, 1, 1, 1, 1, 1,
-1.005035, -0.7740059, -1.813662, 1, 1, 1, 1, 1,
-1.002191, -0.201012, -1.737582, 1, 1, 1, 1, 1,
-0.9930423, 1.601999, -0.02385379, 1, 1, 1, 1, 1,
-0.9880254, -0.2152584, -2.717595, 1, 1, 1, 1, 1,
-0.9813381, 0.273907, -2.579517, 1, 1, 1, 1, 1,
-0.9799562, -1.803573, -2.929164, 1, 1, 1, 1, 1,
-0.9791073, -0.006021346, -2.216445, 1, 1, 1, 1, 1,
-0.978436, 0.6561839, 0.1162096, 1, 1, 1, 1, 1,
-0.9782329, 0.07062946, -2.446309, 1, 1, 1, 1, 1,
-0.9726338, -0.5460353, -1.464378, 1, 1, 1, 1, 1,
-0.9676917, 0.2314286, -1.364283, 1, 1, 1, 1, 1,
-0.9672984, 0.3590567, -0.3921334, 0, 0, 1, 1, 1,
-0.9644285, -1.925318, -2.883017, 1, 0, 0, 1, 1,
-0.9583066, -1.145195, -2.878602, 1, 0, 0, 1, 1,
-0.9563311, -0.2649242, -0.6171914, 1, 0, 0, 1, 1,
-0.9507582, -1.068043, -2.515567, 1, 0, 0, 1, 1,
-0.9451838, 1.410935, -0.3538988, 1, 0, 0, 1, 1,
-0.9432951, -0.9619551, -2.769576, 0, 0, 0, 1, 1,
-0.9383072, -1.081138, -2.969814, 0, 0, 0, 1, 1,
-0.9364436, 0.1547486, -0.7501881, 0, 0, 0, 1, 1,
-0.9315248, 1.333539, -0.8074112, 0, 0, 0, 1, 1,
-0.9285609, -1.636957, -3.41641, 0, 0, 0, 1, 1,
-0.9276271, 1.101479, 0.03533112, 0, 0, 0, 1, 1,
-0.9262155, 0.1855345, -0.9739769, 0, 0, 0, 1, 1,
-0.9254345, -2.791941, -1.841434, 1, 1, 1, 1, 1,
-0.9208795, 0.511961, -0.4324957, 1, 1, 1, 1, 1,
-0.9135789, 0.06775552, -1.869381, 1, 1, 1, 1, 1,
-0.9066272, 0.5783583, -3.069007, 1, 1, 1, 1, 1,
-0.9052143, 0.1064612, -0.8041847, 1, 1, 1, 1, 1,
-0.8942485, 0.3040965, -2.182612, 1, 1, 1, 1, 1,
-0.8894911, 0.25472, -2.899006, 1, 1, 1, 1, 1,
-0.8876848, -0.1678708, -1.559632, 1, 1, 1, 1, 1,
-0.8869132, 0.1675953, -0.9649304, 1, 1, 1, 1, 1,
-0.8858867, 1.285942, -0.3283019, 1, 1, 1, 1, 1,
-0.8845406, 0.7859994, -1.99961, 1, 1, 1, 1, 1,
-0.8828622, -1.188999, -2.686126, 1, 1, 1, 1, 1,
-0.8800478, 0.02760051, -1.25373, 1, 1, 1, 1, 1,
-0.8789774, -0.1703964, -2.241569, 1, 1, 1, 1, 1,
-0.8666884, 0.8686001, -0.9325485, 1, 1, 1, 1, 1,
-0.8644305, 1.353821, -0.9329327, 0, 0, 1, 1, 1,
-0.8578625, -0.6754612, -3.328804, 1, 0, 0, 1, 1,
-0.8576616, 0.4066351, -2.238023, 1, 0, 0, 1, 1,
-0.8558126, 0.1270945, -2.338584, 1, 0, 0, 1, 1,
-0.8543, -0.434553, -2.825958, 1, 0, 0, 1, 1,
-0.8508121, -0.5589656, -1.355896, 1, 0, 0, 1, 1,
-0.8480155, 0.9699486, -0.7359351, 0, 0, 0, 1, 1,
-0.843801, 1.164171, -2.524993, 0, 0, 0, 1, 1,
-0.8294263, -0.1595169, -0.3092236, 0, 0, 0, 1, 1,
-0.8262644, -1.646468, -6.013517, 0, 0, 0, 1, 1,
-0.8253505, -0.4689662, -1.733374, 0, 0, 0, 1, 1,
-0.8240889, 0.250372, -2.127805, 0, 0, 0, 1, 1,
-0.8234668, -0.8042626, -2.996187, 0, 0, 0, 1, 1,
-0.8218361, 0.08139626, -1.158935, 1, 1, 1, 1, 1,
-0.8180731, 1.177235, -0.4704788, 1, 1, 1, 1, 1,
-0.8179636, -0.7530481, -0.8023878, 1, 1, 1, 1, 1,
-0.8136848, 0.0692855, -0.9775789, 1, 1, 1, 1, 1,
-0.8130274, -0.8297653, -2.721428, 1, 1, 1, 1, 1,
-0.8021476, -1.027316, -1.618832, 1, 1, 1, 1, 1,
-0.797833, -1.028116, -2.485835, 1, 1, 1, 1, 1,
-0.7910169, 1.572114, -0.8926628, 1, 1, 1, 1, 1,
-0.7908381, -2.403618, -3.448552, 1, 1, 1, 1, 1,
-0.7881772, 1.799414, -0.3473452, 1, 1, 1, 1, 1,
-0.7846757, -0.2267717, -1.105912, 1, 1, 1, 1, 1,
-0.7840555, -0.02632684, -2.83377, 1, 1, 1, 1, 1,
-0.7824399, -0.7818109, -1.440409, 1, 1, 1, 1, 1,
-0.780984, -0.1481798, -1.198305, 1, 1, 1, 1, 1,
-0.7764652, 1.100406, 0.2327506, 1, 1, 1, 1, 1,
-0.7754383, -0.5395967, -0.4684338, 0, 0, 1, 1, 1,
-0.7738879, 0.5715613, -0.5329551, 1, 0, 0, 1, 1,
-0.7735862, -0.3322859, -0.829832, 1, 0, 0, 1, 1,
-0.7681735, 0.07963241, -1.075719, 1, 0, 0, 1, 1,
-0.7526379, -0.2454949, -0.5637364, 1, 0, 0, 1, 1,
-0.7522072, 0.1888932, -1.000329, 1, 0, 0, 1, 1,
-0.7490732, 2.136452, 0.2112943, 0, 0, 0, 1, 1,
-0.7460679, -0.5616696, -2.6161, 0, 0, 0, 1, 1,
-0.742846, 0.2745965, -1.650072, 0, 0, 0, 1, 1,
-0.737367, 1.672873, 0.05304175, 0, 0, 0, 1, 1,
-0.7333289, -0.70689, -4.418257, 0, 0, 0, 1, 1,
-0.7296592, 0.04169583, -0.3331901, 0, 0, 0, 1, 1,
-0.7278038, 1.82348, 0.007737593, 0, 0, 0, 1, 1,
-0.7196746, -0.01616477, -0.5129122, 1, 1, 1, 1, 1,
-0.7183573, -0.2755252, -0.9221267, 1, 1, 1, 1, 1,
-0.7182311, 2.686599, -0.6083912, 1, 1, 1, 1, 1,
-0.7157267, -0.8722726, -0.1165359, 1, 1, 1, 1, 1,
-0.714678, -0.1790166, -1.786147, 1, 1, 1, 1, 1,
-0.7120578, -0.5646974, -3.364332, 1, 1, 1, 1, 1,
-0.711244, -0.5382662, -2.456828, 1, 1, 1, 1, 1,
-0.7090793, -1.283874, -2.227481, 1, 1, 1, 1, 1,
-0.7044581, -0.3565714, -1.549902, 1, 1, 1, 1, 1,
-0.6959057, 0.6838809, -0.7342291, 1, 1, 1, 1, 1,
-0.6946248, -0.5200656, -1.459263, 1, 1, 1, 1, 1,
-0.6902891, 0.3589766, -1.843732, 1, 1, 1, 1, 1,
-0.6876939, 0.2812568, -2.055231, 1, 1, 1, 1, 1,
-0.6867221, 0.1806841, -0.9610513, 1, 1, 1, 1, 1,
-0.6865968, -0.4318376, -1.749799, 1, 1, 1, 1, 1,
-0.6777478, 0.4226103, -0.7680302, 0, 0, 1, 1, 1,
-0.6763015, -2.575962, -3.107819, 1, 0, 0, 1, 1,
-0.675944, 1.187421, -0.6171728, 1, 0, 0, 1, 1,
-0.6736484, 0.2712756, 0.2765017, 1, 0, 0, 1, 1,
-0.67207, -0.04140755, -2.948114, 1, 0, 0, 1, 1,
-0.6709583, -0.3913965, -3.473069, 1, 0, 0, 1, 1,
-0.6692733, -0.5060011, -2.778045, 0, 0, 0, 1, 1,
-0.668447, -0.7787586, -2.672822, 0, 0, 0, 1, 1,
-0.6671746, 2.622818, -0.1235484, 0, 0, 0, 1, 1,
-0.6670612, -1.423528, -2.858582, 0, 0, 0, 1, 1,
-0.6663521, 1.655833, 0.5761261, 0, 0, 0, 1, 1,
-0.6660662, 0.4502798, -1.350342, 0, 0, 0, 1, 1,
-0.6629015, -0.009595408, -2.111446, 0, 0, 0, 1, 1,
-0.6628354, 0.8279697, 0.05034021, 1, 1, 1, 1, 1,
-0.6623609, 1.209805, -0.2671441, 1, 1, 1, 1, 1,
-0.6613618, -0.4931763, -1.946538, 1, 1, 1, 1, 1,
-0.6609916, 0.501127, -0.5880696, 1, 1, 1, 1, 1,
-0.6599095, 0.03083815, -1.661243, 1, 1, 1, 1, 1,
-0.6587868, -0.6144648, -1.016982, 1, 1, 1, 1, 1,
-0.6587821, 0.3610365, -1.437136, 1, 1, 1, 1, 1,
-0.6581502, -0.01656588, -3.280777, 1, 1, 1, 1, 1,
-0.6549681, 1.736907, -0.1485231, 1, 1, 1, 1, 1,
-0.6530758, 1.885048, 1.439454, 1, 1, 1, 1, 1,
-0.6492014, 0.9669965, 0.4386871, 1, 1, 1, 1, 1,
-0.6491707, -0.2098487, -2.13396, 1, 1, 1, 1, 1,
-0.6416457, 0.8193836, -2.379919, 1, 1, 1, 1, 1,
-0.6395465, 0.7497648, -0.8726878, 1, 1, 1, 1, 1,
-0.6391748, -0.2395484, -2.921901, 1, 1, 1, 1, 1,
-0.6377906, 2.504007, -0.8336756, 0, 0, 1, 1, 1,
-0.6376749, 0.3462865, -1.219525, 1, 0, 0, 1, 1,
-0.6341892, -2.047453, -3.811366, 1, 0, 0, 1, 1,
-0.6311533, 0.6272901, -0.9687307, 1, 0, 0, 1, 1,
-0.6286312, -1.227889, -3.047919, 1, 0, 0, 1, 1,
-0.6199216, 0.3664855, 0.2262838, 1, 0, 0, 1, 1,
-0.619559, -1.713603, -1.164765, 0, 0, 0, 1, 1,
-0.6125868, -0.4259206, -2.619788, 0, 0, 0, 1, 1,
-0.6106842, -0.9001421, -3.999842, 0, 0, 0, 1, 1,
-0.6089503, 0.297683, -1.410258, 0, 0, 0, 1, 1,
-0.607641, -2.696275, -0.1699562, 0, 0, 0, 1, 1,
-0.604179, -1.376368, -2.669158, 0, 0, 0, 1, 1,
-0.6037862, 0.8699065, -0.3365539, 0, 0, 0, 1, 1,
-0.6017224, -0.0110302, -2.621623, 1, 1, 1, 1, 1,
-0.6002538, 0.2568602, -1.307614, 1, 1, 1, 1, 1,
-0.5952389, 1.059432, 0.7389269, 1, 1, 1, 1, 1,
-0.5935279, -0.6709191, -2.435534, 1, 1, 1, 1, 1,
-0.5910272, 1.354118, -0.06855272, 1, 1, 1, 1, 1,
-0.5841521, 0.1395089, 0.1709505, 1, 1, 1, 1, 1,
-0.5715916, -0.4821079, -1.58257, 1, 1, 1, 1, 1,
-0.5697923, -1.886715, -2.629885, 1, 1, 1, 1, 1,
-0.5651328, 1.905957, -0.8943266, 1, 1, 1, 1, 1,
-0.5640289, -2.087886, -4.104775, 1, 1, 1, 1, 1,
-0.5586933, 0.2563272, -0.5461715, 1, 1, 1, 1, 1,
-0.5546189, 1.782328, -0.8620628, 1, 1, 1, 1, 1,
-0.5511343, -0.9487311, -1.439808, 1, 1, 1, 1, 1,
-0.5495422, -2.841906, -2.274537, 1, 1, 1, 1, 1,
-0.5452967, 0.1019481, -1.575469, 1, 1, 1, 1, 1,
-0.5429628, 0.4376563, -0.2843204, 0, 0, 1, 1, 1,
-0.5391396, -0.01155587, 0.9861906, 1, 0, 0, 1, 1,
-0.5373334, 0.8164389, -1.100496, 1, 0, 0, 1, 1,
-0.5369229, 1.450294, -0.4424561, 1, 0, 0, 1, 1,
-0.5343376, 0.5946416, -0.2185179, 1, 0, 0, 1, 1,
-0.5293938, 0.3812571, 0.7390839, 1, 0, 0, 1, 1,
-0.5244253, 1.03062, -0.636159, 0, 0, 0, 1, 1,
-0.5200324, 0.4624933, -1.227471, 0, 0, 0, 1, 1,
-0.518225, -1.078093, -2.861951, 0, 0, 0, 1, 1,
-0.516281, 0.1919881, -2.468106, 0, 0, 0, 1, 1,
-0.5113996, 2.149484, 0.1154317, 0, 0, 0, 1, 1,
-0.505026, -0.1174321, -0.1741663, 0, 0, 0, 1, 1,
-0.5012429, -1.015932, -2.609359, 0, 0, 0, 1, 1,
-0.4973117, -0.7442339, -1.446203, 1, 1, 1, 1, 1,
-0.4895605, 0.2860963, -0.5101636, 1, 1, 1, 1, 1,
-0.485186, 0.6496372, -0.9823508, 1, 1, 1, 1, 1,
-0.4824809, -0.5894805, -1.01485, 1, 1, 1, 1, 1,
-0.481771, 1.544959, 0.2786817, 1, 1, 1, 1, 1,
-0.4798866, 0.01400184, -0.8795964, 1, 1, 1, 1, 1,
-0.4798536, 0.4506925, 0.1141603, 1, 1, 1, 1, 1,
-0.4750393, 0.1686814, -1.918319, 1, 1, 1, 1, 1,
-0.4742022, -0.4831394, -2.107599, 1, 1, 1, 1, 1,
-0.4710818, 0.0537218, -1.51368, 1, 1, 1, 1, 1,
-0.4707078, 0.1894372, 0.513631, 1, 1, 1, 1, 1,
-0.4700831, -1.692672, -4.200036, 1, 1, 1, 1, 1,
-0.4668307, 0.9273249, 0.05564707, 1, 1, 1, 1, 1,
-0.4579622, 1.818914, -1.149735, 1, 1, 1, 1, 1,
-0.4566319, 0.113362, -2.090949, 1, 1, 1, 1, 1,
-0.4563693, -0.8124229, -1.788891, 0, 0, 1, 1, 1,
-0.4544001, 2.041855, 2.096707, 1, 0, 0, 1, 1,
-0.4526028, -0.9828625, -3.865675, 1, 0, 0, 1, 1,
-0.4467006, 0.7710612, 0.3919517, 1, 0, 0, 1, 1,
-0.4465252, -0.7698552, -1.70152, 1, 0, 0, 1, 1,
-0.4465219, -0.6305335, -5.094127, 1, 0, 0, 1, 1,
-0.4454799, -2.145059, -4.891588, 0, 0, 0, 1, 1,
-0.4425759, -0.1462105, -1.736044, 0, 0, 0, 1, 1,
-0.441293, -1.194357, -3.422674, 0, 0, 0, 1, 1,
-0.4410757, 1.94625, -1.639271, 0, 0, 0, 1, 1,
-0.4407824, 0.5512508, -0.3623639, 0, 0, 0, 1, 1,
-0.4360624, -1.517252, -3.179788, 0, 0, 0, 1, 1,
-0.4339783, -0.4984807, -2.511971, 0, 0, 0, 1, 1,
-0.4326296, 2.045903, 0.9009885, 1, 1, 1, 1, 1,
-0.4306906, -0.1909714, -0.6953349, 1, 1, 1, 1, 1,
-0.4292495, 0.667206, 1.201807, 1, 1, 1, 1, 1,
-0.4279044, -0.8758501, -2.303947, 1, 1, 1, 1, 1,
-0.4261392, -0.2778464, -2.018229, 1, 1, 1, 1, 1,
-0.4201574, 1.282253, -0.3975273, 1, 1, 1, 1, 1,
-0.4159029, -1.10258, -2.608725, 1, 1, 1, 1, 1,
-0.4154637, -1.013954, -1.547959, 1, 1, 1, 1, 1,
-0.4149833, 0.9471077, -0.6790743, 1, 1, 1, 1, 1,
-0.4076178, -2.603693, -2.560237, 1, 1, 1, 1, 1,
-0.407217, -0.2523791, -0.5980933, 1, 1, 1, 1, 1,
-0.4043181, 0.8180392, -1.248526, 1, 1, 1, 1, 1,
-0.3991677, 0.7188565, -1.190485, 1, 1, 1, 1, 1,
-0.39745, -0.3360396, -2.396961, 1, 1, 1, 1, 1,
-0.3865651, -1.133802, -2.71716, 1, 1, 1, 1, 1,
-0.3844593, 0.2220678, -2.768228, 0, 0, 1, 1, 1,
-0.3827873, 0.3577327, -1.045623, 1, 0, 0, 1, 1,
-0.3812111, 1.647514, -0.327987, 1, 0, 0, 1, 1,
-0.3764957, 2.659478, 1.256744, 1, 0, 0, 1, 1,
-0.3718295, -0.4896778, -1.671774, 1, 0, 0, 1, 1,
-0.371123, -0.8803671, -2.883702, 1, 0, 0, 1, 1,
-0.3646965, 1.425094, 0.05193743, 0, 0, 0, 1, 1,
-0.3640389, -0.7273497, -2.216482, 0, 0, 0, 1, 1,
-0.3603823, -1.215283, -1.042444, 0, 0, 0, 1, 1,
-0.3577732, -0.1911682, -2.964916, 0, 0, 0, 1, 1,
-0.3560308, -1.402672, -3.566389, 0, 0, 0, 1, 1,
-0.354562, 0.9437492, 0.008546852, 0, 0, 0, 1, 1,
-0.3533535, 0.4189941, -0.3299915, 0, 0, 0, 1, 1,
-0.3514277, 0.6581478, -1.433423, 1, 1, 1, 1, 1,
-0.3505949, -0.005748111, -0.008066797, 1, 1, 1, 1, 1,
-0.3480782, -1.859039, -2.295351, 1, 1, 1, 1, 1,
-0.3459954, 0.5284837, -0.1362341, 1, 1, 1, 1, 1,
-0.3341373, 0.03287646, -1.704401, 1, 1, 1, 1, 1,
-0.3333174, 0.6533987, 0.1315998, 1, 1, 1, 1, 1,
-0.3291582, 1.612928, -0.6922764, 1, 1, 1, 1, 1,
-0.3277669, 0.5627392, -1.125671, 1, 1, 1, 1, 1,
-0.3253277, 0.2771009, -0.1133729, 1, 1, 1, 1, 1,
-0.3199252, -0.9661524, -1.605732, 1, 1, 1, 1, 1,
-0.31896, -0.3135136, -1.066126, 1, 1, 1, 1, 1,
-0.3187131, 1.13886, 0.5108454, 1, 1, 1, 1, 1,
-0.306251, -0.8890185, -2.165615, 1, 1, 1, 1, 1,
-0.3046688, -1.034015, -3.578396, 1, 1, 1, 1, 1,
-0.2982424, 0.472777, 0.312818, 1, 1, 1, 1, 1,
-0.2974133, -0.4337609, -1.317892, 0, 0, 1, 1, 1,
-0.2967187, -0.8348311, -2.519607, 1, 0, 0, 1, 1,
-0.2966793, 0.6016517, 0.2004163, 1, 0, 0, 1, 1,
-0.2926492, -0.288664, -3.310386, 1, 0, 0, 1, 1,
-0.2873853, 0.3725819, -1.565293, 1, 0, 0, 1, 1,
-0.2861081, -0.06914447, -2.870308, 1, 0, 0, 1, 1,
-0.2860368, -0.7750556, -2.00567, 0, 0, 0, 1, 1,
-0.2858369, 1.083912, -0.04727108, 0, 0, 0, 1, 1,
-0.2829427, 1.375667, 0.9645981, 0, 0, 0, 1, 1,
-0.2780222, 1.147929, 0.2098804, 0, 0, 0, 1, 1,
-0.2754883, 1.431423, -0.6780736, 0, 0, 0, 1, 1,
-0.2702996, 0.3071897, -3.801655, 0, 0, 0, 1, 1,
-0.2674417, -0.4788505, -2.096297, 0, 0, 0, 1, 1,
-0.2673561, 1.306244, 0.1131371, 1, 1, 1, 1, 1,
-0.2635383, 0.8647178, 0.02391875, 1, 1, 1, 1, 1,
-0.2624713, 0.3254818, -0.5741963, 1, 1, 1, 1, 1,
-0.262355, -0.8353642, -1.735202, 1, 1, 1, 1, 1,
-0.2604723, 1.488528, 1.627868, 1, 1, 1, 1, 1,
-0.2543985, -0.5848484, -3.456863, 1, 1, 1, 1, 1,
-0.2499732, 0.6953092, 0.6051811, 1, 1, 1, 1, 1,
-0.2418181, -1.877243, -2.540627, 1, 1, 1, 1, 1,
-0.2395139, -0.795473, -1.823928, 1, 1, 1, 1, 1,
-0.2291918, 1.171262, -1.056346, 1, 1, 1, 1, 1,
-0.2263319, 0.4248636, 0.4838373, 1, 1, 1, 1, 1,
-0.2003801, 1.020533, -1.24468, 1, 1, 1, 1, 1,
-0.1912355, -0.1871939, -2.840587, 1, 1, 1, 1, 1,
-0.1897103, 0.8863733, -1.286236, 1, 1, 1, 1, 1,
-0.1818382, 1.199857, -0.5119907, 1, 1, 1, 1, 1,
-0.1780987, -0.3985422, -1.133538, 0, 0, 1, 1, 1,
-0.1724853, 1.076468, 1.596222, 1, 0, 0, 1, 1,
-0.1717988, -1.268947, -3.129855, 1, 0, 0, 1, 1,
-0.1674266, 0.4939108, 1.072141, 1, 0, 0, 1, 1,
-0.1632812, 0.1386752, 1.25741, 1, 0, 0, 1, 1,
-0.1622834, 1.267361, -0.124658, 1, 0, 0, 1, 1,
-0.1608804, 0.1048582, -1.569296, 0, 0, 0, 1, 1,
-0.1599205, -0.1193013, -1.301895, 0, 0, 0, 1, 1,
-0.1572245, -1.865125, -3.559262, 0, 0, 0, 1, 1,
-0.156913, 0.4196205, -1.366119, 0, 0, 0, 1, 1,
-0.156518, -0.545122, -3.897338, 0, 0, 0, 1, 1,
-0.1559493, -1.901176, -3.003189, 0, 0, 0, 1, 1,
-0.1531218, 1.041531, 0.2520099, 0, 0, 0, 1, 1,
-0.1523456, -0.2474254, -3.992463, 1, 1, 1, 1, 1,
-0.1519926, -0.8029434, -2.413877, 1, 1, 1, 1, 1,
-0.145264, -1.367109, -2.279404, 1, 1, 1, 1, 1,
-0.1386652, 1.185857, -0.7511713, 1, 1, 1, 1, 1,
-0.1382811, -0.4815118, -2.63733, 1, 1, 1, 1, 1,
-0.1380262, -0.1248408, -2.459936, 1, 1, 1, 1, 1,
-0.1361005, -2.051172, -2.649646, 1, 1, 1, 1, 1,
-0.1315931, 0.9132353, 0.3282042, 1, 1, 1, 1, 1,
-0.1297979, 0.08878431, -1.71954, 1, 1, 1, 1, 1,
-0.1290316, -0.02773749, -2.56959, 1, 1, 1, 1, 1,
-0.127455, 0.9252041, -0.8197385, 1, 1, 1, 1, 1,
-0.1203343, 0.7282311, -1.714777, 1, 1, 1, 1, 1,
-0.1101534, 0.76709, -0.3846633, 1, 1, 1, 1, 1,
-0.1082034, 0.3939467, -1.645513, 1, 1, 1, 1, 1,
-0.1055354, -1.817654, -3.097364, 1, 1, 1, 1, 1,
-0.1013804, 1.164283, 0.3688636, 0, 0, 1, 1, 1,
-0.09890807, 1.830704, -1.648178, 1, 0, 0, 1, 1,
-0.09777454, 0.4287103, -1.513888, 1, 0, 0, 1, 1,
-0.09670591, -0.06061535, -0.6018684, 1, 0, 0, 1, 1,
-0.09653635, 0.05392621, 0.02269333, 1, 0, 0, 1, 1,
-0.08976482, -0.3240977, -3.459031, 1, 0, 0, 1, 1,
-0.08804476, 0.6856622, -1.884591, 0, 0, 0, 1, 1,
-0.08764624, -2.109993, -3.423164, 0, 0, 0, 1, 1,
-0.08756497, 0.3893814, -1.439665, 0, 0, 0, 1, 1,
-0.08718123, -0.4207752, -3.364053, 0, 0, 0, 1, 1,
-0.08640388, 0.7061879, -1.187157, 0, 0, 0, 1, 1,
-0.08187863, -0.4601327, -3.116067, 0, 0, 0, 1, 1,
-0.08012341, -1.147366, -3.474377, 0, 0, 0, 1, 1,
-0.07763267, 1.809758, -0.2985412, 1, 1, 1, 1, 1,
-0.07725132, 0.8507801, -2.372764, 1, 1, 1, 1, 1,
-0.07701588, 0.1057236, -0.7502295, 1, 1, 1, 1, 1,
-0.0719969, 2.118967, -1.106156, 1, 1, 1, 1, 1,
-0.07143003, -0.2551797, -3.905936, 1, 1, 1, 1, 1,
-0.06950463, 1.205736, -0.5474461, 1, 1, 1, 1, 1,
-0.06868508, 0.5684015, -0.6326259, 1, 1, 1, 1, 1,
-0.06723538, -1.706005, -3.698311, 1, 1, 1, 1, 1,
-0.06468156, 0.6377239, 1.128332, 1, 1, 1, 1, 1,
-0.06465383, 2.025245, -0.8500654, 1, 1, 1, 1, 1,
-0.06103206, -0.8071684, -3.310108, 1, 1, 1, 1, 1,
-0.05806884, 0.2537163, -1.74607, 1, 1, 1, 1, 1,
-0.05692968, 1.037452, 0.5894266, 1, 1, 1, 1, 1,
-0.05583223, 0.1660563, -0.5950593, 1, 1, 1, 1, 1,
-0.05533442, -0.1338045, -2.576333, 1, 1, 1, 1, 1,
-0.05233842, 1.16273, -0.7187413, 0, 0, 1, 1, 1,
-0.04820615, 0.451117, -0.2996216, 1, 0, 0, 1, 1,
-0.04702506, 0.1673364, -0.6849052, 1, 0, 0, 1, 1,
-0.04571692, 0.9008786, -1.717322, 1, 0, 0, 1, 1,
-0.04266638, -1.867198, -3.621994, 1, 0, 0, 1, 1,
-0.03789364, 0.2912759, -1.214329, 1, 0, 0, 1, 1,
-0.03484957, 0.0008064747, -1.161116, 0, 0, 0, 1, 1,
-0.03475513, -2.078898, -2.375007, 0, 0, 0, 1, 1,
-0.0337742, -0.07992464, -1.413598, 0, 0, 0, 1, 1,
-0.03222843, -1.091039, -3.11691, 0, 0, 0, 1, 1,
-0.02987523, 1.28685, -0.228515, 0, 0, 0, 1, 1,
-0.025042, 0.91632, 1.185895, 0, 0, 0, 1, 1,
-0.02248805, -1.548764, -3.256184, 0, 0, 0, 1, 1,
-0.0193133, -1.158531, -2.605926, 1, 1, 1, 1, 1,
-0.01527042, -0.514493, -3.243606, 1, 1, 1, 1, 1,
-0.01523655, 0.7150583, 0.2915539, 1, 1, 1, 1, 1,
-0.01506172, -1.311326, -1.400739, 1, 1, 1, 1, 1,
-0.0128644, -0.9775433, -4.191246, 1, 1, 1, 1, 1,
-0.008686833, -0.5809295, -4.586517, 1, 1, 1, 1, 1,
-0.008450402, -1.403289, -1.230549, 1, 1, 1, 1, 1,
-0.007917926, -0.9459357, -3.047035, 1, 1, 1, 1, 1,
-0.006311272, 1.569395, 0.2001044, 1, 1, 1, 1, 1,
-0.006155226, -1.496078, -2.038671, 1, 1, 1, 1, 1,
-0.001913738, -0.8560641, -3.051056, 1, 1, 1, 1, 1,
-0.0005947289, 1.568546, 0.9597681, 1, 1, 1, 1, 1,
-0.0003709363, 0.3071387, 1.459432, 1, 1, 1, 1, 1,
0.001003201, -0.3025762, 3.340211, 1, 1, 1, 1, 1,
0.004790448, -0.4550677, 3.553095, 1, 1, 1, 1, 1,
0.007869985, 0.1890648, 1.271196, 0, 0, 1, 1, 1,
0.01352878, -1.214205, 4.19225, 1, 0, 0, 1, 1,
0.01413767, 0.6715686, 0.2474297, 1, 0, 0, 1, 1,
0.01467267, -0.9869468, 3.186575, 1, 0, 0, 1, 1,
0.01664593, 1.601163, -1.880023, 1, 0, 0, 1, 1,
0.01843394, 0.7730039, 0.8876811, 1, 0, 0, 1, 1,
0.01971036, -0.8543702, 1.493817, 0, 0, 0, 1, 1,
0.02195858, -3.058109, 2.64157, 0, 0, 0, 1, 1,
0.02224392, 0.7100659, 1.90987, 0, 0, 0, 1, 1,
0.02373411, -0.1611282, 3.918311, 0, 0, 0, 1, 1,
0.02434722, 0.8464174, -0.1328017, 0, 0, 0, 1, 1,
0.03087403, 1.556942, -1.417106, 0, 0, 0, 1, 1,
0.03729589, 0.2894619, 1.306601, 0, 0, 0, 1, 1,
0.03828249, 0.4535257, -1.247712, 1, 1, 1, 1, 1,
0.03947166, 0.9943776, 1.023425, 1, 1, 1, 1, 1,
0.04050539, 0.3964156, -0.8160495, 1, 1, 1, 1, 1,
0.04117209, 0.1134783, 1.958932, 1, 1, 1, 1, 1,
0.0453641, 0.1266918, 1.212713, 1, 1, 1, 1, 1,
0.04654322, 1.085361, -0.1840783, 1, 1, 1, 1, 1,
0.04692468, 0.2999205, 0.7511944, 1, 1, 1, 1, 1,
0.05256711, 1.363752, 1.041144, 1, 1, 1, 1, 1,
0.05257733, 0.864424, 1.530712, 1, 1, 1, 1, 1,
0.06871191, 0.4377792, -0.8805574, 1, 1, 1, 1, 1,
0.06877072, -1.9017, 0.4173856, 1, 1, 1, 1, 1,
0.07041372, 1.12038, 0.5185176, 1, 1, 1, 1, 1,
0.07613342, -0.4694022, 5.358547, 1, 1, 1, 1, 1,
0.07907835, 0.5979346, -0.5086609, 1, 1, 1, 1, 1,
0.08236971, 0.5412422, 0.5713596, 1, 1, 1, 1, 1,
0.08601163, 0.4890669, -1.321081, 0, 0, 1, 1, 1,
0.0871006, 0.354992, -0.996544, 1, 0, 0, 1, 1,
0.0890156, -0.8935735, 5.24646, 1, 0, 0, 1, 1,
0.09423229, 0.9130708, 0.2975628, 1, 0, 0, 1, 1,
0.09658669, -0.3597839, 4.485526, 1, 0, 0, 1, 1,
0.100235, 0.4498633, 1.443877, 1, 0, 0, 1, 1,
0.1014485, -1.45696, 5.043936, 0, 0, 0, 1, 1,
0.1045242, 0.8119258, -0.5459898, 0, 0, 0, 1, 1,
0.1053674, 0.963532, -0.1798511, 0, 0, 0, 1, 1,
0.1076831, -0.3326449, 2.970345, 0, 0, 0, 1, 1,
0.1106779, 0.4405844, -0.5957104, 0, 0, 0, 1, 1,
0.1174365, -0.1077674, 1.825963, 0, 0, 0, 1, 1,
0.1238138, -1.448478, 2.797616, 0, 0, 0, 1, 1,
0.1319749, 0.1830023, 2.000455, 1, 1, 1, 1, 1,
0.1321014, 0.4422216, 0.2601263, 1, 1, 1, 1, 1,
0.1346983, -1.524447, 2.87933, 1, 1, 1, 1, 1,
0.139049, -1.258488, 3.253994, 1, 1, 1, 1, 1,
0.1394454, 0.145797, -0.2182809, 1, 1, 1, 1, 1,
0.1457923, 0.05490818, -0.4754995, 1, 1, 1, 1, 1,
0.1516687, 1.072189, 0.3920875, 1, 1, 1, 1, 1,
0.1542996, -0.3305593, 3.07776, 1, 1, 1, 1, 1,
0.1548073, 0.6429855, 0.1796482, 1, 1, 1, 1, 1,
0.155626, -0.5136093, -0.300967, 1, 1, 1, 1, 1,
0.1556461, -0.3707792, 3.555522, 1, 1, 1, 1, 1,
0.1567489, -1.205852, 4.364288, 1, 1, 1, 1, 1,
0.1585439, 0.5422054, 1.485488, 1, 1, 1, 1, 1,
0.1628105, 0.3332905, -0.6631559, 1, 1, 1, 1, 1,
0.1731687, -1.31697, 3.801808, 1, 1, 1, 1, 1,
0.1758004, -0.8457035, 3.304111, 0, 0, 1, 1, 1,
0.1761756, -1.619119, 3.083921, 1, 0, 0, 1, 1,
0.1774107, 2.261557, 0.9410477, 1, 0, 0, 1, 1,
0.1783962, -0.3596156, 2.658314, 1, 0, 0, 1, 1,
0.1819097, -0.02888356, 1.891275, 1, 0, 0, 1, 1,
0.1837834, 0.7170698, -0.2648902, 1, 0, 0, 1, 1,
0.185603, -0.5413668, 1.554985, 0, 0, 0, 1, 1,
0.1880587, 0.4208554, 2.623035, 0, 0, 0, 1, 1,
0.1908491, 0.8543957, -1.600001, 0, 0, 0, 1, 1,
0.194646, -0.9551671, 2.442871, 0, 0, 0, 1, 1,
0.1964462, -0.1329528, 2.123594, 0, 0, 0, 1, 1,
0.2008042, 0.4290369, 0.664682, 0, 0, 0, 1, 1,
0.2008123, -0.6488521, 1.618591, 0, 0, 0, 1, 1,
0.201217, 1.612827, 0.2501276, 1, 1, 1, 1, 1,
0.2081804, 0.3450587, 0.5794979, 1, 1, 1, 1, 1,
0.2089728, -0.2112598, 1.601214, 1, 1, 1, 1, 1,
0.2188902, -0.2178323, 0.7021866, 1, 1, 1, 1, 1,
0.2192748, -0.08435458, 4.694003, 1, 1, 1, 1, 1,
0.2235407, -0.3884751, 2.390172, 1, 1, 1, 1, 1,
0.2238503, 1.867854, 0.5459257, 1, 1, 1, 1, 1,
0.2265492, 0.2424335, 2.834941, 1, 1, 1, 1, 1,
0.2293385, 0.9214988, -1.443856, 1, 1, 1, 1, 1,
0.233252, 0.4221721, 0.09730608, 1, 1, 1, 1, 1,
0.2355609, 0.5036882, 1.349134, 1, 1, 1, 1, 1,
0.2361398, -0.6298611, 2.082362, 1, 1, 1, 1, 1,
0.238054, 0.5005375, -0.0435883, 1, 1, 1, 1, 1,
0.2385909, 0.2799431, -0.4966145, 1, 1, 1, 1, 1,
0.2388227, 0.03500172, 1.343413, 1, 1, 1, 1, 1,
0.2424385, 0.9618492, -0.2961202, 0, 0, 1, 1, 1,
0.2441811, -0.6170735, 3.294834, 1, 0, 0, 1, 1,
0.2447772, -1.159346, 2.34328, 1, 0, 0, 1, 1,
0.2465328, -0.8667952, 3.406659, 1, 0, 0, 1, 1,
0.2475809, 2.70166, -0.5590513, 1, 0, 0, 1, 1,
0.2506041, 0.7082991, 0.4232775, 1, 0, 0, 1, 1,
0.2510722, 0.852964, 1.278751, 0, 0, 0, 1, 1,
0.2561369, -0.3976242, 1.331074, 0, 0, 0, 1, 1,
0.2629352, -0.7666741, 1.176264, 0, 0, 0, 1, 1,
0.266781, -0.367114, 3.076341, 0, 0, 0, 1, 1,
0.2669947, 1.144593, 0.2804706, 0, 0, 0, 1, 1,
0.2737399, -0.1664206, 3.298521, 0, 0, 0, 1, 1,
0.2789544, 2.105899, 0.8301398, 0, 0, 0, 1, 1,
0.2791771, -0.804692, 3.742273, 1, 1, 1, 1, 1,
0.2809265, -0.1172709, 2.390193, 1, 1, 1, 1, 1,
0.2815889, 0.02521365, -0.6779021, 1, 1, 1, 1, 1,
0.2818924, -2.091991, 3.430981, 1, 1, 1, 1, 1,
0.2825029, 0.831673, 0.8455408, 1, 1, 1, 1, 1,
0.2871159, 1.115965, 0.5757325, 1, 1, 1, 1, 1,
0.2912029, -1.755905, 2.79792, 1, 1, 1, 1, 1,
0.2913153, -0.4429592, 2.121095, 1, 1, 1, 1, 1,
0.297685, -2.375697, 2.965622, 1, 1, 1, 1, 1,
0.3019356, 0.4437558, 1.186291, 1, 1, 1, 1, 1,
0.3082944, -0.001763195, -0.7909068, 1, 1, 1, 1, 1,
0.3147874, 1.327429, 0.6528111, 1, 1, 1, 1, 1,
0.3169599, -0.7610603, 4.671026, 1, 1, 1, 1, 1,
0.3178788, 0.735665, -0.6741961, 1, 1, 1, 1, 1,
0.3181144, 1.376467, 0.06496927, 1, 1, 1, 1, 1,
0.3188647, -0.8329076, 2.151517, 0, 0, 1, 1, 1,
0.3193955, -0.3601061, 1.863468, 1, 0, 0, 1, 1,
0.3204183, 0.6073624, 2.940099, 1, 0, 0, 1, 1,
0.3207383, -1.005151, 4.432212, 1, 0, 0, 1, 1,
0.3245411, -0.2617787, 0.8177034, 1, 0, 0, 1, 1,
0.3268297, 0.3496453, 0.001308307, 1, 0, 0, 1, 1,
0.3299936, -0.9408455, 2.27223, 0, 0, 0, 1, 1,
0.332238, 0.009776534, 2.711126, 0, 0, 0, 1, 1,
0.3360057, 0.547239, 1.602219, 0, 0, 0, 1, 1,
0.3384496, -1.502521, 1.767964, 0, 0, 0, 1, 1,
0.3400211, -0.2565495, 3.222334, 0, 0, 0, 1, 1,
0.3407447, -1.409935, 4.816327, 0, 0, 0, 1, 1,
0.3414466, 0.699008, -0.06461722, 0, 0, 0, 1, 1,
0.3416646, -2.157194, 3.684383, 1, 1, 1, 1, 1,
0.3426719, -0.3507707, 0.2380756, 1, 1, 1, 1, 1,
0.3443081, 0.5807034, 0.02021155, 1, 1, 1, 1, 1,
0.3464636, 1.954853, 0.1799657, 1, 1, 1, 1, 1,
0.3507083, -0.4322817, 1.991637, 1, 1, 1, 1, 1,
0.3514633, -1.259137, 2.464079, 1, 1, 1, 1, 1,
0.3540445, -0.5356045, 0.2012598, 1, 1, 1, 1, 1,
0.3560567, -0.04665282, 2.282465, 1, 1, 1, 1, 1,
0.3588997, -1.082787, 1.805384, 1, 1, 1, 1, 1,
0.3600741, 0.642272, -0.02303551, 1, 1, 1, 1, 1,
0.3600812, 0.4212949, 0.583929, 1, 1, 1, 1, 1,
0.3608704, 0.1385981, -0.6162361, 1, 1, 1, 1, 1,
0.3621962, 0.6156549, 1.647673, 1, 1, 1, 1, 1,
0.3649763, -0.1048193, 2.386969, 1, 1, 1, 1, 1,
0.3670822, 1.79282, -0.649488, 1, 1, 1, 1, 1,
0.3727949, 0.3968454, -0.2577834, 0, 0, 1, 1, 1,
0.3748726, 0.2218877, 3.042191, 1, 0, 0, 1, 1,
0.3764569, -1.861575, 1.635008, 1, 0, 0, 1, 1,
0.381094, -0.3428606, 1.375071, 1, 0, 0, 1, 1,
0.382149, 0.6133589, 0.4723955, 1, 0, 0, 1, 1,
0.3840623, 2.023278, -0.622779, 1, 0, 0, 1, 1,
0.3841999, -1.061879, 3.417491, 0, 0, 0, 1, 1,
0.3842388, 0.3735103, -1.138314, 0, 0, 0, 1, 1,
0.3895449, 0.7535713, 0.6080264, 0, 0, 0, 1, 1,
0.3927346, 1.321082, -0.1264297, 0, 0, 0, 1, 1,
0.3932659, -0.5332242, 0.7404428, 0, 0, 0, 1, 1,
0.3965949, 1.069309, 3.061505, 0, 0, 0, 1, 1,
0.3986669, 1.194944, -0.2932674, 0, 0, 0, 1, 1,
0.401713, 1.209105, 1.616237, 1, 1, 1, 1, 1,
0.4027182, 1.045816, 0.2514468, 1, 1, 1, 1, 1,
0.4271514, 0.07170857, 1.005978, 1, 1, 1, 1, 1,
0.4343516, -0.6881993, 2.484578, 1, 1, 1, 1, 1,
0.4353836, -0.8381439, 3.450945, 1, 1, 1, 1, 1,
0.4397721, 0.709868, 1.687749, 1, 1, 1, 1, 1,
0.4417761, -0.06146553, 1.140236, 1, 1, 1, 1, 1,
0.4422569, -0.8222547, 2.124882, 1, 1, 1, 1, 1,
0.4424713, 1.181949, 0.5647176, 1, 1, 1, 1, 1,
0.4445015, -0.02144579, 1.10044, 1, 1, 1, 1, 1,
0.4474013, -0.5091095, 2.105798, 1, 1, 1, 1, 1,
0.4475994, -0.6323168, 1.592408, 1, 1, 1, 1, 1,
0.4511808, -0.9493081, 3.200436, 1, 1, 1, 1, 1,
0.4533165, -1.662678, 4.669369, 1, 1, 1, 1, 1,
0.4587008, 0.6029105, -0.4792082, 1, 1, 1, 1, 1,
0.4601678, -0.7182481, 1.64961, 0, 0, 1, 1, 1,
0.4634874, -1.238033, 2.447877, 1, 0, 0, 1, 1,
0.46448, 1.415141, 1.722518, 1, 0, 0, 1, 1,
0.4680607, 0.1482024, 0.6207098, 1, 0, 0, 1, 1,
0.4718018, 0.4419501, 1.250322, 1, 0, 0, 1, 1,
0.472955, 0.05754187, 1.639114, 1, 0, 0, 1, 1,
0.4751179, 0.5047888, 1.754967, 0, 0, 0, 1, 1,
0.4801154, -0.3137423, 1.750142, 0, 0, 0, 1, 1,
0.4826421, 1.901145, -1.285254, 0, 0, 0, 1, 1,
0.485221, -2.132563, 3.084199, 0, 0, 0, 1, 1,
0.4861864, -1.757019, 2.188521, 0, 0, 0, 1, 1,
0.4869161, 0.5815278, 1.214463, 0, 0, 0, 1, 1,
0.4870387, 0.6210216, 0.3316344, 0, 0, 0, 1, 1,
0.4873137, -0.4651591, 2.351631, 1, 1, 1, 1, 1,
0.4888466, 0.3341838, 2.312604, 1, 1, 1, 1, 1,
0.4898578, 1.173863, 0.7485988, 1, 1, 1, 1, 1,
0.4905472, 1.361345, 1.425262, 1, 1, 1, 1, 1,
0.4907078, 0.7995101, 1.268689, 1, 1, 1, 1, 1,
0.4925823, -0.2563615, 1.720961, 1, 1, 1, 1, 1,
0.4946772, 0.6897519, 1.64308, 1, 1, 1, 1, 1,
0.4970013, 0.468697, -0.7328062, 1, 1, 1, 1, 1,
0.498109, 1.010649, 2.283297, 1, 1, 1, 1, 1,
0.5001775, -0.08882207, 1.522092, 1, 1, 1, 1, 1,
0.5039887, -0.4200674, 1.380839, 1, 1, 1, 1, 1,
0.50533, 0.536028, 2.596603, 1, 1, 1, 1, 1,
0.5065905, -1.253989, 2.358175, 1, 1, 1, 1, 1,
0.5068423, -0.006703201, 1.132017, 1, 1, 1, 1, 1,
0.510215, 0.3592858, 1.674765, 1, 1, 1, 1, 1,
0.5108017, -0.7788908, 1.183482, 0, 0, 1, 1, 1,
0.511378, 0.2009077, 0.08570647, 1, 0, 0, 1, 1,
0.5138767, -1.894864, 2.013234, 1, 0, 0, 1, 1,
0.5158439, 0.2623724, 1.589397, 1, 0, 0, 1, 1,
0.5164598, -0.3126967, 0.7064031, 1, 0, 0, 1, 1,
0.5203021, -0.2373164, 2.158428, 1, 0, 0, 1, 1,
0.5227681, -0.9442683, 2.848649, 0, 0, 0, 1, 1,
0.5232158, -0.3305134, 2.589396, 0, 0, 0, 1, 1,
0.5238771, 1.174128, 0.07330763, 0, 0, 0, 1, 1,
0.5254977, 0.2666184, 2.212906, 0, 0, 0, 1, 1,
0.5265904, -0.5078055, 1.283092, 0, 0, 0, 1, 1,
0.5299059, 1.707532, 1.431018, 0, 0, 0, 1, 1,
0.5301769, 0.1555026, 1.193191, 0, 0, 0, 1, 1,
0.5320823, 0.5918254, 0.4783041, 1, 1, 1, 1, 1,
0.5320967, 1.42198, 0.8065861, 1, 1, 1, 1, 1,
0.5332934, -0.1943123, 0.6965531, 1, 1, 1, 1, 1,
0.533988, -1.185964, 3.307028, 1, 1, 1, 1, 1,
0.5351677, -0.7590904, 2.967783, 1, 1, 1, 1, 1,
0.5389112, -1.207617, 0.5297024, 1, 1, 1, 1, 1,
0.544259, 1.036914, 0.9545919, 1, 1, 1, 1, 1,
0.5445262, -0.4741404, 3.068608, 1, 1, 1, 1, 1,
0.5491174, 0.6748165, 1.089829, 1, 1, 1, 1, 1,
0.5520107, -1.672178, 3.122228, 1, 1, 1, 1, 1,
0.552669, 1.481771, 2.153119, 1, 1, 1, 1, 1,
0.557439, -1.191709, 0.846858, 1, 1, 1, 1, 1,
0.5579738, 0.979471, 0.7131543, 1, 1, 1, 1, 1,
0.5580851, 0.09683467, 1.831056, 1, 1, 1, 1, 1,
0.5589328, 0.6954395, -0.3802454, 1, 1, 1, 1, 1,
0.5657449, 1.341982, 0.9043338, 0, 0, 1, 1, 1,
0.5672145, -0.233719, 3.171536, 1, 0, 0, 1, 1,
0.568862, 0.2812711, 2.062858, 1, 0, 0, 1, 1,
0.5722465, -0.1622538, 3.566339, 1, 0, 0, 1, 1,
0.5728413, -0.4223717, 2.746439, 1, 0, 0, 1, 1,
0.572987, -1.767873, 1.678929, 1, 0, 0, 1, 1,
0.5730649, 0.1555019, 1.468297, 0, 0, 0, 1, 1,
0.5734216, 1.520623, -0.468721, 0, 0, 0, 1, 1,
0.5734523, 0.6795083, 0.06353719, 0, 0, 0, 1, 1,
0.5757321, 1.332571, 1.140218, 0, 0, 0, 1, 1,
0.5793408, 0.2837409, 0.5335799, 0, 0, 0, 1, 1,
0.5839422, 0.6127808, 0.3759785, 0, 0, 0, 1, 1,
0.5853156, 0.2509918, 0.9191478, 0, 0, 0, 1, 1,
0.5918323, -0.9795805, 1.467759, 1, 1, 1, 1, 1,
0.5932028, 0.9626238, 2.147664, 1, 1, 1, 1, 1,
0.5990811, 0.6053779, 1.946846, 1, 1, 1, 1, 1,
0.6005116, 1.689992, 1.802089, 1, 1, 1, 1, 1,
0.6011369, -0.5750852, 2.5215, 1, 1, 1, 1, 1,
0.6021962, -0.4457758, 3.241171, 1, 1, 1, 1, 1,
0.602267, 0.7709436, 1.207885, 1, 1, 1, 1, 1,
0.6038863, 1.393683, 1.45958, 1, 1, 1, 1, 1,
0.6055684, 0.480857, 1.257537, 1, 1, 1, 1, 1,
0.6089475, -0.5192375, 1.780649, 1, 1, 1, 1, 1,
0.6111527, 0.2357709, 0.6796237, 1, 1, 1, 1, 1,
0.6144676, -1.207887, 3.471282, 1, 1, 1, 1, 1,
0.6147344, -0.520191, 2.279938, 1, 1, 1, 1, 1,
0.6157676, 0.3724506, 2.134531, 1, 1, 1, 1, 1,
0.6192075, -0.4725888, 1.632811, 1, 1, 1, 1, 1,
0.6192555, 1.357215, 1.488364, 0, 0, 1, 1, 1,
0.6197745, 0.4398449, 1.329532, 1, 0, 0, 1, 1,
0.6258433, -0.3540737, 3.366028, 1, 0, 0, 1, 1,
0.626067, -1.749455, 4.889558, 1, 0, 0, 1, 1,
0.6304393, -0.02657802, 1.445429, 1, 0, 0, 1, 1,
0.6308395, 1.100902, 0.5195444, 1, 0, 0, 1, 1,
0.6313159, -1.155961, 2.303287, 0, 0, 0, 1, 1,
0.6385135, 1.42622, -0.3572362, 0, 0, 0, 1, 1,
0.6421636, 0.1824457, 3.380125, 0, 0, 0, 1, 1,
0.6433097, -1.901905, 1.816337, 0, 0, 0, 1, 1,
0.6484429, 0.5846774, 0.9100899, 0, 0, 0, 1, 1,
0.6490688, -1.747425, 3.006132, 0, 0, 0, 1, 1,
0.6532385, 3.037977, 0.4815954, 0, 0, 0, 1, 1,
0.656083, 0.9245956, -1.683045, 1, 1, 1, 1, 1,
0.6605264, -0.2098603, 2.16677, 1, 1, 1, 1, 1,
0.6617427, -0.5377126, 2.419595, 1, 1, 1, 1, 1,
0.6642122, 0.8926939, 0.5780913, 1, 1, 1, 1, 1,
0.6668342, -1.158782, 2.149273, 1, 1, 1, 1, 1,
0.6672934, -1.057168, 2.346254, 1, 1, 1, 1, 1,
0.6715401, 1.150598, -0.9279175, 1, 1, 1, 1, 1,
0.6717157, -0.7348069, 0.6587674, 1, 1, 1, 1, 1,
0.6755094, -0.498715, 3.666116, 1, 1, 1, 1, 1,
0.6779422, -0.9984121, 1.78597, 1, 1, 1, 1, 1,
0.6826821, 0.7500545, 2.085342, 1, 1, 1, 1, 1,
0.6837904, 0.4843556, 3.426085, 1, 1, 1, 1, 1,
0.6867576, -0.03577807, 1.217598, 1, 1, 1, 1, 1,
0.7006078, 0.6339234, 0.1648328, 1, 1, 1, 1, 1,
0.7045022, -1.29245, 2.614326, 1, 1, 1, 1, 1,
0.7100701, -2.733006, 3.212257, 0, 0, 1, 1, 1,
0.7106953, -0.9248533, 2.447736, 1, 0, 0, 1, 1,
0.7140821, 0.8982388, -0.9524648, 1, 0, 0, 1, 1,
0.7153138, -0.4265108, 3.129394, 1, 0, 0, 1, 1,
0.7208729, 0.9785359, 0.07058257, 1, 0, 0, 1, 1,
0.7218147, 0.5813456, 0.7911643, 1, 0, 0, 1, 1,
0.7223229, 1.488582, 1.59161, 0, 0, 0, 1, 1,
0.7272422, -1.490257, 2.176908, 0, 0, 0, 1, 1,
0.728213, 0.1432692, 0.7766139, 0, 0, 0, 1, 1,
0.7292636, -1.520813, 2.885231, 0, 0, 0, 1, 1,
0.7315642, 0.6416511, 1.269546, 0, 0, 0, 1, 1,
0.7333296, 1.654026, -2.390626, 0, 0, 0, 1, 1,
0.737507, -1.016201, 3.081977, 0, 0, 0, 1, 1,
0.7387472, 0.7310605, 0.2836055, 1, 1, 1, 1, 1,
0.739353, 0.2900451, 1.046831, 1, 1, 1, 1, 1,
0.7424045, 1.530354, -0.2645431, 1, 1, 1, 1, 1,
0.7469676, 0.473184, 1.356493, 1, 1, 1, 1, 1,
0.7477032, -0.8079783, 3.363943, 1, 1, 1, 1, 1,
0.7485391, 0.04311255, 1.080615, 1, 1, 1, 1, 1,
0.7495372, 0.3607842, 1.29296, 1, 1, 1, 1, 1,
0.7526546, -0.4634958, 2.745046, 1, 1, 1, 1, 1,
0.7550578, 1.108304, -1.328151, 1, 1, 1, 1, 1,
0.7602838, -0.3524275, 1.187954, 1, 1, 1, 1, 1,
0.7602907, -0.8878734, 4.044121, 1, 1, 1, 1, 1,
0.7620397, -0.6250408, 2.46222, 1, 1, 1, 1, 1,
0.7634564, -1.437972, 3.069138, 1, 1, 1, 1, 1,
0.7667914, -0.9345734, 1.849809, 1, 1, 1, 1, 1,
0.7669337, -0.1879898, 0.2069871, 1, 1, 1, 1, 1,
0.7677422, 0.123184, 1.378103, 0, 0, 1, 1, 1,
0.7687269, 0.8015683, -0.06214224, 1, 0, 0, 1, 1,
0.7697082, -1.389482, 4.774471, 1, 0, 0, 1, 1,
0.7735795, 0.2764391, 1.230125, 1, 0, 0, 1, 1,
0.7893375, 0.9724687, 0.6244999, 1, 0, 0, 1, 1,
0.7940297, 0.5167552, 0.4696284, 1, 0, 0, 1, 1,
0.7972584, 0.03243113, 2.711736, 0, 0, 0, 1, 1,
0.798308, -1.063172, 1.037142, 0, 0, 0, 1, 1,
0.803332, 0.5099399, 0.8173431, 0, 0, 0, 1, 1,
0.8071964, 0.5178005, 0.01308119, 0, 0, 0, 1, 1,
0.8118793, -0.5588248, 2.180459, 0, 0, 0, 1, 1,
0.8244473, -0.9416955, 2.568804, 0, 0, 0, 1, 1,
0.8252209, -0.1336415, 0.7890447, 0, 0, 0, 1, 1,
0.8262371, -1.584477, 3.769229, 1, 1, 1, 1, 1,
0.8286611, -0.7497925, 3.545816, 1, 1, 1, 1, 1,
0.8418449, 1.109078, 1.638982, 1, 1, 1, 1, 1,
0.8445911, -0.833803, 2.518197, 1, 1, 1, 1, 1,
0.8448665, -0.1481484, 0.7104071, 1, 1, 1, 1, 1,
0.8496531, -0.8415775, 3.166375, 1, 1, 1, 1, 1,
0.8533838, -0.3517223, 0.4738095, 1, 1, 1, 1, 1,
0.8660219, -0.2001599, 3.188109, 1, 1, 1, 1, 1,
0.8764158, -0.09779956, 1.150967, 1, 1, 1, 1, 1,
0.8816556, -2.294141, 2.804279, 1, 1, 1, 1, 1,
0.8901329, -0.07551745, 1.633308, 1, 1, 1, 1, 1,
0.8920702, -0.1312798, 2.913311, 1, 1, 1, 1, 1,
0.8940266, -1.824536, 2.469842, 1, 1, 1, 1, 1,
0.8944159, 1.018917, -0.6694077, 1, 1, 1, 1, 1,
0.894738, 1.667386, 0.1329359, 1, 1, 1, 1, 1,
0.896548, 0.2552839, 3.141822, 0, 0, 1, 1, 1,
0.8971658, 1.227628, -1.217136, 1, 0, 0, 1, 1,
0.8972818, 0.03603841, 0.645307, 1, 0, 0, 1, 1,
0.8998102, -0.9570805, 3.669029, 1, 0, 0, 1, 1,
0.9069475, 1.571219, 1.792645, 1, 0, 0, 1, 1,
0.9070849, 0.3334545, 1.588712, 1, 0, 0, 1, 1,
0.9075077, -0.4981359, 1.003895, 0, 0, 0, 1, 1,
0.9076228, -0.6516619, 3.006099, 0, 0, 0, 1, 1,
0.9109273, -1.830139, 2.491843, 0, 0, 0, 1, 1,
0.9120457, 0.07556316, 1.037955, 0, 0, 0, 1, 1,
0.9152777, 0.8602962, 1.679124, 0, 0, 0, 1, 1,
0.9177376, -1.227531, 4.074041, 0, 0, 0, 1, 1,
0.9362116, 0.3851812, 0.07672051, 0, 0, 0, 1, 1,
0.946289, 0.1648158, -0.2634588, 1, 1, 1, 1, 1,
0.9466412, 0.4233076, 0.8384817, 1, 1, 1, 1, 1,
0.9529628, -1.755096, 1.4182, 1, 1, 1, 1, 1,
0.9572096, 1.448295, 1.722635, 1, 1, 1, 1, 1,
0.9617433, -0.1902259, 1.786281, 1, 1, 1, 1, 1,
0.974852, -2.147437, 3.567954, 1, 1, 1, 1, 1,
0.9804532, 0.03819618, 1.763011, 1, 1, 1, 1, 1,
0.9809952, 0.3801068, 0.8779158, 1, 1, 1, 1, 1,
0.9840997, -0.8936976, 4.439209, 1, 1, 1, 1, 1,
0.9841068, -1.410926, 1.67016, 1, 1, 1, 1, 1,
0.9926736, -0.8087991, 0.8807255, 1, 1, 1, 1, 1,
0.9997084, 0.1575611, 2.178741, 1, 1, 1, 1, 1,
1.004993, -1.335419, 1.699578, 1, 1, 1, 1, 1,
1.005229, -0.07064539, 0.9441952, 1, 1, 1, 1, 1,
1.01384, 0.06741296, 1.649126, 1, 1, 1, 1, 1,
1.041777, -0.09387661, 2.158376, 0, 0, 1, 1, 1,
1.044645, 0.6188608, 1.042175, 1, 0, 0, 1, 1,
1.054408, 1.165668, 0.7714958, 1, 0, 0, 1, 1,
1.054801, -0.5476815, 2.635127, 1, 0, 0, 1, 1,
1.059931, -0.2476794, 0.8684762, 1, 0, 0, 1, 1,
1.060088, 1.59099, 0.2778633, 1, 0, 0, 1, 1,
1.074163, -0.1732425, 2.606003, 0, 0, 0, 1, 1,
1.074617, -0.834859, 0.8195406, 0, 0, 0, 1, 1,
1.080067, -0.6093602, 2.353993, 0, 0, 0, 1, 1,
1.084082, -0.5628186, 3.48863, 0, 0, 0, 1, 1,
1.086049, 0.7153984, 1.316512, 0, 0, 0, 1, 1,
1.0877, -0.9121905, 1.008677, 0, 0, 0, 1, 1,
1.088704, 0.2946495, 2.434805, 0, 0, 0, 1, 1,
1.091558, -0.4371214, 1.221088, 1, 1, 1, 1, 1,
1.096732, -1.275866, 0.8757766, 1, 1, 1, 1, 1,
1.101406, 0.03866258, 0.4932653, 1, 1, 1, 1, 1,
1.105178, -0.7033961, 2.577785, 1, 1, 1, 1, 1,
1.111727, 0.6181464, 1.488093, 1, 1, 1, 1, 1,
1.126389, -1.023846, 1.688748, 1, 1, 1, 1, 1,
1.12725, -1.155235, 2.791731, 1, 1, 1, 1, 1,
1.129845, -2.112136, 2.371098, 1, 1, 1, 1, 1,
1.137412, -1.529649, 3.359962, 1, 1, 1, 1, 1,
1.14644, 0.9204712, -0.3139644, 1, 1, 1, 1, 1,
1.146487, -0.8987969, 1.598239, 1, 1, 1, 1, 1,
1.150179, -1.20264, 3.509048, 1, 1, 1, 1, 1,
1.152625, 0.4955683, 1.129252, 1, 1, 1, 1, 1,
1.173837, 1.003968, 0.4679248, 1, 1, 1, 1, 1,
1.174444, 1.42359, -0.8469615, 1, 1, 1, 1, 1,
1.176052, -0.5517246, 1.673329, 0, 0, 1, 1, 1,
1.177624, -1.484486, 1.640156, 1, 0, 0, 1, 1,
1.180301, -1.94069, 1.558111, 1, 0, 0, 1, 1,
1.180421, 0.3086522, 0.01508219, 1, 0, 0, 1, 1,
1.185611, -0.7942905, 2.734799, 1, 0, 0, 1, 1,
1.188114, 0.4038192, 2.533374, 1, 0, 0, 1, 1,
1.190404, 0.901019, 0.2706603, 0, 0, 0, 1, 1,
1.19852, -0.5275484, 1.301791, 0, 0, 0, 1, 1,
1.209085, -0.5944074, 2.566807, 0, 0, 0, 1, 1,
1.212385, 1.599251, 2.135119, 0, 0, 0, 1, 1,
1.212431, -0.3775648, 2.384345, 0, 0, 0, 1, 1,
1.213309, 0.4426761, 2.098823, 0, 0, 0, 1, 1,
1.215923, 0.6725485, 1.057286, 0, 0, 0, 1, 1,
1.216714, -2.436267, 4.344757, 1, 1, 1, 1, 1,
1.217764, -0.9450818, 2.415415, 1, 1, 1, 1, 1,
1.223142, -0.1034411, 1.382778, 1, 1, 1, 1, 1,
1.225454, -0.3525812, 2.398391, 1, 1, 1, 1, 1,
1.234394, 1.05093, 0.7911562, 1, 1, 1, 1, 1,
1.237097, 0.3247606, 1.679117, 1, 1, 1, 1, 1,
1.240316, -0.9464931, 1.251849, 1, 1, 1, 1, 1,
1.247197, -0.98579, 1.699323, 1, 1, 1, 1, 1,
1.253444, 0.5417769, -0.160847, 1, 1, 1, 1, 1,
1.25728, 0.8900031, 0.7973471, 1, 1, 1, 1, 1,
1.263642, -0.876964, 1.623391, 1, 1, 1, 1, 1,
1.267707, -1.000837, 0.01745688, 1, 1, 1, 1, 1,
1.273674, 0.8498539, 1.117289, 1, 1, 1, 1, 1,
1.273798, -0.2387737, 1.82602, 1, 1, 1, 1, 1,
1.27607, -0.9407773, 1.090279, 1, 1, 1, 1, 1,
1.281773, 0.4688683, 2.189964, 0, 0, 1, 1, 1,
1.288534, -0.5097489, 2.440328, 1, 0, 0, 1, 1,
1.290694, -1.304957, 2.06024, 1, 0, 0, 1, 1,
1.291913, 0.7221113, 2.790075, 1, 0, 0, 1, 1,
1.311151, -0.8787358, 2.161922, 1, 0, 0, 1, 1,
1.320239, -1.364646, 2.538897, 1, 0, 0, 1, 1,
1.320639, 1.048659, 2.880111, 0, 0, 0, 1, 1,
1.324762, 0.8966312, 2.354312, 0, 0, 0, 1, 1,
1.328165, -1.205261, 3.153758, 0, 0, 0, 1, 1,
1.328754, 0.2779697, 1.676142, 0, 0, 0, 1, 1,
1.331287, 1.496289, 0.4239466, 0, 0, 0, 1, 1,
1.34369, -1.212979, 3.44608, 0, 0, 0, 1, 1,
1.354878, 1.038046, 0.788461, 0, 0, 0, 1, 1,
1.360501, -1.183983, 2.42857, 1, 1, 1, 1, 1,
1.360991, -0.691464, 1.509396, 1, 1, 1, 1, 1,
1.368393, -0.2307038, 2.499857, 1, 1, 1, 1, 1,
1.375006, 1.581104, 2.088886, 1, 1, 1, 1, 1,
1.377635, -0.3090491, 3.937631, 1, 1, 1, 1, 1,
1.390589, 0.01490639, 1.170638, 1, 1, 1, 1, 1,
1.402815, -1.117045, 2.981407, 1, 1, 1, 1, 1,
1.404596, 1.978766, -2.292796, 1, 1, 1, 1, 1,
1.405437, 0.5649765, 2.175943, 1, 1, 1, 1, 1,
1.416328, -0.2555543, 2.057681, 1, 1, 1, 1, 1,
1.417691, -1.018997, 1.1363, 1, 1, 1, 1, 1,
1.444775, -0.2281014, 1.886087, 1, 1, 1, 1, 1,
1.445275, -1.38695, 2.738615, 1, 1, 1, 1, 1,
1.451485, 1.015777, 1.385298, 1, 1, 1, 1, 1,
1.454468, -0.7875916, 1.473387, 1, 1, 1, 1, 1,
1.457836, 0.8445013, 0.4544567, 0, 0, 1, 1, 1,
1.458211, 0.4708576, 4.000554, 1, 0, 0, 1, 1,
1.463208, 2.301374, 0.5516487, 1, 0, 0, 1, 1,
1.469047, -0.7304112, 3.77979, 1, 0, 0, 1, 1,
1.472521, 0.04672545, 1.650721, 1, 0, 0, 1, 1,
1.523049, -0.175824, 1.669964, 1, 0, 0, 1, 1,
1.529449, -0.7566794, 1.651041, 0, 0, 0, 1, 1,
1.533713, 0.3383273, 1.309821, 0, 0, 0, 1, 1,
1.537408, -0.5796244, 1.996027, 0, 0, 0, 1, 1,
1.542491, 0.5775157, 1.416028, 0, 0, 0, 1, 1,
1.54546, -0.0641045, 1.414409, 0, 0, 0, 1, 1,
1.564919, 3.448176, 0.6319109, 0, 0, 0, 1, 1,
1.58173, 0.9707374, 1.680067, 0, 0, 0, 1, 1,
1.58219, -0.3772102, 3.170787, 1, 1, 1, 1, 1,
1.591172, -1.381038, 2.084531, 1, 1, 1, 1, 1,
1.600271, -0.1518334, 1.659297, 1, 1, 1, 1, 1,
1.602398, -0.7344515, 0.3304453, 1, 1, 1, 1, 1,
1.606771, -0.05499539, 2.465739, 1, 1, 1, 1, 1,
1.609406, -0.2021696, 2.820258, 1, 1, 1, 1, 1,
1.622111, 0.8698261, 0.6175489, 1, 1, 1, 1, 1,
1.622667, 1.664389, -0.6375666, 1, 1, 1, 1, 1,
1.641424, 0.03881426, 2.757464, 1, 1, 1, 1, 1,
1.65833, -0.5155787, 1.208795, 1, 1, 1, 1, 1,
1.663096, -0.1720744, 1.550623, 1, 1, 1, 1, 1,
1.66985, -0.03085864, 0.704472, 1, 1, 1, 1, 1,
1.675435, -0.782909, 3.527179, 1, 1, 1, 1, 1,
1.675529, 1.085675, 0.6870718, 1, 1, 1, 1, 1,
1.681628, 0.08579184, 2.547464, 1, 1, 1, 1, 1,
1.685645, -0.02202117, 0.3864877, 0, 0, 1, 1, 1,
1.702168, -0.6209746, 3.481472, 1, 0, 0, 1, 1,
1.720802, -0.1322293, 3.210351, 1, 0, 0, 1, 1,
1.720854, 0.6643031, -0.9590835, 1, 0, 0, 1, 1,
1.72972, 0.6521642, 1.230821, 1, 0, 0, 1, 1,
1.759759, 0.7793009, 0.7872208, 1, 0, 0, 1, 1,
1.780779, 1.458516, 1.848969, 0, 0, 0, 1, 1,
1.787219, -0.6850645, 3.457378, 0, 0, 0, 1, 1,
1.788645, 0.3366732, 0.7101921, 0, 0, 0, 1, 1,
1.820225, 0.618887, 2.091565, 0, 0, 0, 1, 1,
1.828527, -0.4878016, 1.800637, 0, 0, 0, 1, 1,
1.840711, -0.1555642, 4.244475, 0, 0, 0, 1, 1,
1.847243, -1.589105, 2.070071, 0, 0, 0, 1, 1,
1.869021, -1.056212, 0.8991563, 1, 1, 1, 1, 1,
1.897907, -0.9155552, 0.9136881, 1, 1, 1, 1, 1,
1.912954, -1.235926, 2.634228, 1, 1, 1, 1, 1,
1.921919, -0.02419805, -0.00655175, 1, 1, 1, 1, 1,
1.952858, -2.329032, 1.277538, 1, 1, 1, 1, 1,
1.953811, 0.78912, 2.067221, 1, 1, 1, 1, 1,
1.960328, 0.2178235, 2.842533, 1, 1, 1, 1, 1,
1.979304, -0.9304627, 1.871515, 1, 1, 1, 1, 1,
2.012768, 1.47781, 1.785924, 1, 1, 1, 1, 1,
2.018944, 1.513005, 0.7702512, 1, 1, 1, 1, 1,
2.032023, 0.3165558, 2.408799, 1, 1, 1, 1, 1,
2.06585, 0.2850533, 3.426786, 1, 1, 1, 1, 1,
2.086144, 0.3324524, 1.980104, 1, 1, 1, 1, 1,
2.128057, -0.2133542, 4.003993, 1, 1, 1, 1, 1,
2.130961, -0.3165067, 2.21105, 1, 1, 1, 1, 1,
2.159314, -2.214256, 2.905775, 0, 0, 1, 1, 1,
2.174988, 0.09881096, 1.986472, 1, 0, 0, 1, 1,
2.187423, 0.7965156, 1.33861, 1, 0, 0, 1, 1,
2.214704, 0.9320871, 0.7151371, 1, 0, 0, 1, 1,
2.258632, -2.706503, 4.876809, 1, 0, 0, 1, 1,
2.272308, -0.1832488, 1.439445, 1, 0, 0, 1, 1,
2.285581, -0.5667306, 2.181389, 0, 0, 0, 1, 1,
2.318359, 1.768303, 2.05258, 0, 0, 0, 1, 1,
2.322335, -0.6086857, 2.315963, 0, 0, 0, 1, 1,
2.337143, -0.3459643, 1.880663, 0, 0, 0, 1, 1,
2.371538, -0.2369168, 1.808799, 0, 0, 0, 1, 1,
2.414082, 1.26413, -0.1583653, 0, 0, 0, 1, 1,
2.495443, 1.354488, 1.173985, 0, 0, 0, 1, 1,
2.559752, -1.008941, 1.03375, 1, 1, 1, 1, 1,
2.658115, -1.392916, 3.329187, 1, 1, 1, 1, 1,
2.780461, -1.165291, 0.5322745, 1, 1, 1, 1, 1,
2.780982, 0.5831755, 2.23029, 1, 1, 1, 1, 1,
2.891038, -0.6595877, 1.961785, 1, 1, 1, 1, 1,
2.97648, 0.995816, 0.6004147, 1, 1, 1, 1, 1,
3.14762, -0.2570924, 2.070093, 1, 1, 1, 1, 1
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
var radius = 9.854747;
var distance = 34.61438;
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
mvMatrix.translate( 0.03196645, -0.1950338, 0.3274851 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61438);
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
