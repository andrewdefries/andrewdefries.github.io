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
-2.959013, -0.05715517, -0.3233304, 1, 0, 0, 1,
-2.814105, -0.5115709, -2.173215, 1, 0.007843138, 0, 1,
-2.78846, 0.6594244, -0.3991359, 1, 0.01176471, 0, 1,
-2.768933, 1.001103, -1.956997, 1, 0.01960784, 0, 1,
-2.748914, 1.252509, -1.271407, 1, 0.02352941, 0, 1,
-2.73773, -0.5290006, -3.598026, 1, 0.03137255, 0, 1,
-2.668679, 1.809976, 0.3992472, 1, 0.03529412, 0, 1,
-2.661523, 0.4382252, -1.243739, 1, 0.04313726, 0, 1,
-2.658121, 1.308239, -2.989582, 1, 0.04705882, 0, 1,
-2.531513, -0.124875, -1.622257, 1, 0.05490196, 0, 1,
-2.469676, 0.9891486, -2.49182, 1, 0.05882353, 0, 1,
-2.438354, -1.319657, -3.054289, 1, 0.06666667, 0, 1,
-2.387906, -0.2043179, -1.863131, 1, 0.07058824, 0, 1,
-2.370038, -0.3174099, -0.3190718, 1, 0.07843138, 0, 1,
-2.34156, 0.1478354, -3.239427, 1, 0.08235294, 0, 1,
-2.280466, 0.7074931, -1.285236, 1, 0.09019608, 0, 1,
-2.27958, -1.477619, -1.926937, 1, 0.09411765, 0, 1,
-2.225233, -0.2320489, -1.650326, 1, 0.1019608, 0, 1,
-2.214531, -1.18212, -2.192648, 1, 0.1098039, 0, 1,
-2.202636, 0.8809102, -0.5778431, 1, 0.1137255, 0, 1,
-2.17326, 2.346583, -1.672332, 1, 0.1215686, 0, 1,
-2.126851, 0.04249766, -1.76617, 1, 0.1254902, 0, 1,
-2.103818, 1.849029, 1.197205, 1, 0.1333333, 0, 1,
-2.064723, -1.618328, -2.254477, 1, 0.1372549, 0, 1,
-2.045387, -1.030321, -1.342569, 1, 0.145098, 0, 1,
-2.036894, -0.09671152, -1.827528, 1, 0.1490196, 0, 1,
-2.021648, -0.5671846, -1.41918, 1, 0.1568628, 0, 1,
-2.014139, 1.753266, -0.92519, 1, 0.1607843, 0, 1,
-2.003579, -1.982574, -3.305364, 1, 0.1686275, 0, 1,
-1.980493, -0.1363288, -2.380695, 1, 0.172549, 0, 1,
-1.977938, -0.8801257, -1.75947, 1, 0.1803922, 0, 1,
-1.974365, -0.9040205, -1.223282, 1, 0.1843137, 0, 1,
-1.931848, -0.4465475, -2.095229, 1, 0.1921569, 0, 1,
-1.930893, -1.902975, -2.945324, 1, 0.1960784, 0, 1,
-1.854578, 1.475264, 1.211465, 1, 0.2039216, 0, 1,
-1.82936, -2.171096, -1.245367, 1, 0.2117647, 0, 1,
-1.813887, -0.3133816, -2.753126, 1, 0.2156863, 0, 1,
-1.796237, -0.4309479, -1.051921, 1, 0.2235294, 0, 1,
-1.786655, -0.5077838, -1.81117, 1, 0.227451, 0, 1,
-1.781985, -0.4008914, -1.09358, 1, 0.2352941, 0, 1,
-1.772369, -0.1054852, -0.2414418, 1, 0.2392157, 0, 1,
-1.770613, -1.970093, -3.711526, 1, 0.2470588, 0, 1,
-1.75289, 0.8451183, -0.6225111, 1, 0.2509804, 0, 1,
-1.75075, 1.620453, -1.295901, 1, 0.2588235, 0, 1,
-1.745624, -1.302356, -0.9502895, 1, 0.2627451, 0, 1,
-1.728938, -0.9693977, -1.768388, 1, 0.2705882, 0, 1,
-1.716365, -1.435673, -2.199166, 1, 0.2745098, 0, 1,
-1.710673, 0.8998964, 0.6130343, 1, 0.282353, 0, 1,
-1.684567, 1.303807, -1.849106, 1, 0.2862745, 0, 1,
-1.674877, -0.556577, -0.7450319, 1, 0.2941177, 0, 1,
-1.661436, -0.8971496, -1.38207, 1, 0.3019608, 0, 1,
-1.6391, -1.083309, -3.617415, 1, 0.3058824, 0, 1,
-1.637468, -1.484194, -1.946048, 1, 0.3137255, 0, 1,
-1.630929, -0.6550862, -2.00675, 1, 0.3176471, 0, 1,
-1.629597, -0.0466676, -1.35789, 1, 0.3254902, 0, 1,
-1.625065, 1.186314, -0.1659929, 1, 0.3294118, 0, 1,
-1.615022, 0.2401448, -1.244874, 1, 0.3372549, 0, 1,
-1.60464, 0.6634002, 0.3045924, 1, 0.3411765, 0, 1,
-1.580968, -0.3080398, -2.188612, 1, 0.3490196, 0, 1,
-1.579366, 2.449562, -0.6364564, 1, 0.3529412, 0, 1,
-1.5569, 0.6641346, -1.642251, 1, 0.3607843, 0, 1,
-1.555584, -1.604414, -4.449066, 1, 0.3647059, 0, 1,
-1.551162, -1.042641, -2.46989, 1, 0.372549, 0, 1,
-1.550269, -0.04066304, -3.005925, 1, 0.3764706, 0, 1,
-1.530534, 0.1796426, -1.056767, 1, 0.3843137, 0, 1,
-1.529209, 1.388744, -0.01309347, 1, 0.3882353, 0, 1,
-1.519903, -0.2588344, -2.142973, 1, 0.3960784, 0, 1,
-1.473866, 1.290103, -1.286649, 1, 0.4039216, 0, 1,
-1.470364, 0.05054844, -2.071971, 1, 0.4078431, 0, 1,
-1.463706, -0.1055744, -1.252199, 1, 0.4156863, 0, 1,
-1.437339, 0.2848694, -0.6640318, 1, 0.4196078, 0, 1,
-1.4363, -0.08494195, -0.7467918, 1, 0.427451, 0, 1,
-1.428854, -0.06170679, -2.045727, 1, 0.4313726, 0, 1,
-1.427777, 0.6919118, -1.51342, 1, 0.4392157, 0, 1,
-1.417025, 0.2313406, -3.195534, 1, 0.4431373, 0, 1,
-1.409956, -0.8029947, -2.030586, 1, 0.4509804, 0, 1,
-1.407049, -0.9226199, -1.79447, 1, 0.454902, 0, 1,
-1.395535, 0.761566, -2.405194, 1, 0.4627451, 0, 1,
-1.383964, -1.332116, -1.67939, 1, 0.4666667, 0, 1,
-1.383371, -0.3183808, -2.829346, 1, 0.4745098, 0, 1,
-1.383291, 0.6620213, -0.7205136, 1, 0.4784314, 0, 1,
-1.373112, 0.7992738, -0.1005209, 1, 0.4862745, 0, 1,
-1.371153, -0.1658675, -1.192078, 1, 0.4901961, 0, 1,
-1.359445, 0.3592989, -1.842297, 1, 0.4980392, 0, 1,
-1.353838, -0.4975621, -1.558121, 1, 0.5058824, 0, 1,
-1.349406, 1.360292, -1.524467, 1, 0.509804, 0, 1,
-1.34937, 0.5325872, -1.667625, 1, 0.5176471, 0, 1,
-1.344051, 1.081057, -1.208959, 1, 0.5215687, 0, 1,
-1.339139, 1.125047, -1.835007, 1, 0.5294118, 0, 1,
-1.332478, 1.225009, -1.95366, 1, 0.5333334, 0, 1,
-1.331589, 1.273022, -0.6957504, 1, 0.5411765, 0, 1,
-1.328769, 1.918521, -0.1088383, 1, 0.5450981, 0, 1,
-1.325014, -0.9632833, -2.207817, 1, 0.5529412, 0, 1,
-1.322659, 0.203385, -2.144013, 1, 0.5568628, 0, 1,
-1.299235, -1.567841, -3.613471, 1, 0.5647059, 0, 1,
-1.298195, -0.4582733, -1.134421, 1, 0.5686275, 0, 1,
-1.290934, 0.1113768, -0.7353673, 1, 0.5764706, 0, 1,
-1.285992, -0.229034, -2.896271, 1, 0.5803922, 0, 1,
-1.284091, 0.3422996, -1.65003, 1, 0.5882353, 0, 1,
-1.282814, -0.889358, -1.268303, 1, 0.5921569, 0, 1,
-1.282133, -0.8314561, -2.63263, 1, 0.6, 0, 1,
-1.277976, -0.08848618, -1.001948, 1, 0.6078432, 0, 1,
-1.2761, 0.830419, -1.854012, 1, 0.6117647, 0, 1,
-1.26843, -0.9511397, -2.31016, 1, 0.6196079, 0, 1,
-1.268093, -0.1220987, -2.549227, 1, 0.6235294, 0, 1,
-1.265835, -0.62279, -1.557747, 1, 0.6313726, 0, 1,
-1.261979, -0.1512384, -1.703937, 1, 0.6352941, 0, 1,
-1.256003, 1.588067, -1.999768, 1, 0.6431373, 0, 1,
-1.254585, 1.365476, 0.2433834, 1, 0.6470588, 0, 1,
-1.242061, 0.3705168, -0.9127799, 1, 0.654902, 0, 1,
-1.233788, -0.2724229, -2.689983, 1, 0.6588235, 0, 1,
-1.231126, -0.8007197, 0.5861346, 1, 0.6666667, 0, 1,
-1.228288, -0.03625757, -1.85428, 1, 0.6705883, 0, 1,
-1.22604, -1.009995, -2.484003, 1, 0.6784314, 0, 1,
-1.224669, 0.2429658, -2.068405, 1, 0.682353, 0, 1,
-1.218559, -1.87285, -1.329035, 1, 0.6901961, 0, 1,
-1.215616, -0.5605096, -2.092083, 1, 0.6941177, 0, 1,
-1.213089, -1.231367, -2.645135, 1, 0.7019608, 0, 1,
-1.208007, -0.849565, -3.670466, 1, 0.7098039, 0, 1,
-1.207052, -2.15019, -1.105756, 1, 0.7137255, 0, 1,
-1.203882, 0.8850715, -0.2581724, 1, 0.7215686, 0, 1,
-1.203029, -0.1319777, -2.024418, 1, 0.7254902, 0, 1,
-1.202157, -0.7387163, -0.2427516, 1, 0.7333333, 0, 1,
-1.200687, 0.1429121, -4.436598, 1, 0.7372549, 0, 1,
-1.193493, -0.01253632, -1.443025, 1, 0.7450981, 0, 1,
-1.192904, -1.332674, -2.584849, 1, 0.7490196, 0, 1,
-1.18918, -0.8974156, -1.594299, 1, 0.7568628, 0, 1,
-1.184958, 0.9737239, -1.393436, 1, 0.7607843, 0, 1,
-1.180208, -0.3927101, 0.9229747, 1, 0.7686275, 0, 1,
-1.170733, 0.5985988, -2.070141, 1, 0.772549, 0, 1,
-1.170119, -0.8151276, -3.650293, 1, 0.7803922, 0, 1,
-1.158714, 1.442096, 1.029706, 1, 0.7843137, 0, 1,
-1.155208, 1.274083, -0.6466327, 1, 0.7921569, 0, 1,
-1.151329, -0.03662847, -3.081103, 1, 0.7960784, 0, 1,
-1.145991, -0.2304963, -1.405757, 1, 0.8039216, 0, 1,
-1.142922, 0.08952833, -0.1724452, 1, 0.8117647, 0, 1,
-1.13284, 0.6004559, -2.093128, 1, 0.8156863, 0, 1,
-1.119163, 0.6372868, 0.06866083, 1, 0.8235294, 0, 1,
-1.113816, -0.4399351, -1.411783, 1, 0.827451, 0, 1,
-1.113699, -0.9757265, -2.957653, 1, 0.8352941, 0, 1,
-1.109783, 0.6363806, -0.009221701, 1, 0.8392157, 0, 1,
-1.108389, -1.724081, -3.309495, 1, 0.8470588, 0, 1,
-1.107392, -0.1648894, -2.016506, 1, 0.8509804, 0, 1,
-1.105556, 1.015485, -0.7582558, 1, 0.8588235, 0, 1,
-1.101384, -1.585872, -2.642627, 1, 0.8627451, 0, 1,
-1.090418, 1.016401, -1.241649, 1, 0.8705882, 0, 1,
-1.087526, -0.4746308, -2.092782, 1, 0.8745098, 0, 1,
-1.083188, 0.8653653, -1.252678, 1, 0.8823529, 0, 1,
-1.082902, 1.764578, 0.5786875, 1, 0.8862745, 0, 1,
-1.082051, 0.5239937, -0.1177526, 1, 0.8941177, 0, 1,
-1.070029, -0.7036542, -1.831405, 1, 0.8980392, 0, 1,
-1.069771, -0.00458558, -1.494109, 1, 0.9058824, 0, 1,
-1.068334, 1.771816, -0.7632996, 1, 0.9137255, 0, 1,
-1.064065, -0.9173601, -1.373486, 1, 0.9176471, 0, 1,
-1.060038, -0.05323192, -1.845476, 1, 0.9254902, 0, 1,
-1.047907, 0.6561798, -0.8622298, 1, 0.9294118, 0, 1,
-1.045485, -1.292065, -1.313448, 1, 0.9372549, 0, 1,
-1.045123, -0.3954755, -1.94401, 1, 0.9411765, 0, 1,
-1.044463, 1.434241, -1.987242, 1, 0.9490196, 0, 1,
-1.04341, 1.35786, -0.3626277, 1, 0.9529412, 0, 1,
-1.037645, 0.753038, -1.896914, 1, 0.9607843, 0, 1,
-1.037151, 0.7561412, -1.724886, 1, 0.9647059, 0, 1,
-1.028698, -1.863367, -1.81355, 1, 0.972549, 0, 1,
-1.021358, 0.6459722, -0.6540598, 1, 0.9764706, 0, 1,
-1.019863, -1.38547, -2.609017, 1, 0.9843137, 0, 1,
-1.014711, -0.5729488, -2.030016, 1, 0.9882353, 0, 1,
-1.014401, 1.564321, 1.151166, 1, 0.9960784, 0, 1,
-1.010405, -0.8463248, -2.35126, 0.9960784, 1, 0, 1,
-1.008996, 0.8137031, 0.130875, 0.9921569, 1, 0, 1,
-1.001105, 0.6307905, 0.5178192, 0.9843137, 1, 0, 1,
-0.9685965, -1.376523, -1.362749, 0.9803922, 1, 0, 1,
-0.9682235, 0.7504247, -0.1257604, 0.972549, 1, 0, 1,
-0.9646368, 0.2294432, 1.252821, 0.9686275, 1, 0, 1,
-0.9558752, 0.2286556, -0.3908735, 0.9607843, 1, 0, 1,
-0.9541367, 0.6152817, -0.3997099, 0.9568627, 1, 0, 1,
-0.9469935, -0.1041836, -2.357342, 0.9490196, 1, 0, 1,
-0.9463107, -0.711171, -1.862673, 0.945098, 1, 0, 1,
-0.9455889, -1.171052, -3.258358, 0.9372549, 1, 0, 1,
-0.9453024, -0.9344682, -1.80222, 0.9333333, 1, 0, 1,
-0.9370829, -1.504052, -1.605955, 0.9254902, 1, 0, 1,
-0.9323766, 1.11099, -1.851648, 0.9215686, 1, 0, 1,
-0.9271763, -0.8451628, -2.655089, 0.9137255, 1, 0, 1,
-0.9261667, -0.2024374, -0.2746734, 0.9098039, 1, 0, 1,
-0.9254546, -0.2611464, -2.413889, 0.9019608, 1, 0, 1,
-0.924646, -1.197947, -2.252961, 0.8941177, 1, 0, 1,
-0.9115923, -0.5133331, -0.9161785, 0.8901961, 1, 0, 1,
-0.9075196, 0.1042682, -0.4250635, 0.8823529, 1, 0, 1,
-0.9066913, 0.7645054, 0.917066, 0.8784314, 1, 0, 1,
-0.9045576, -0.2541988, -1.388413, 0.8705882, 1, 0, 1,
-0.90386, 2.099164, 1.003846, 0.8666667, 1, 0, 1,
-0.8972782, 0.1476955, -3.119442, 0.8588235, 1, 0, 1,
-0.8891823, -1.876394, -1.41778, 0.854902, 1, 0, 1,
-0.8765051, -1.531763, -2.377214, 0.8470588, 1, 0, 1,
-0.8759171, -0.2975466, -2.065271, 0.8431373, 1, 0, 1,
-0.8741888, 0.454105, -1.475324, 0.8352941, 1, 0, 1,
-0.8693533, -2.995183, -1.396012, 0.8313726, 1, 0, 1,
-0.8637762, 1.023565, -1.286971, 0.8235294, 1, 0, 1,
-0.8608044, -1.414487, -3.005278, 0.8196079, 1, 0, 1,
-0.8582581, -1.43117, -2.914201, 0.8117647, 1, 0, 1,
-0.8543487, 0.4598895, 0.2169866, 0.8078431, 1, 0, 1,
-0.8519642, 0.771895, 0.1396046, 0.8, 1, 0, 1,
-0.8504092, -0.3971386, -1.993776, 0.7921569, 1, 0, 1,
-0.8469476, 0.2973403, -0.01530924, 0.7882353, 1, 0, 1,
-0.8461523, 0.3867867, -0.6493204, 0.7803922, 1, 0, 1,
-0.8431688, 0.9028899, -0.04117592, 0.7764706, 1, 0, 1,
-0.8429916, -2.219697, -1.586297, 0.7686275, 1, 0, 1,
-0.8419139, 0.4482904, -1.593031, 0.7647059, 1, 0, 1,
-0.8366498, 0.3069354, -2.847345, 0.7568628, 1, 0, 1,
-0.8330197, 2.174532, -1.394596, 0.7529412, 1, 0, 1,
-0.8320259, 0.9854183, -0.6070742, 0.7450981, 1, 0, 1,
-0.8286184, 2.18567, -0.2280435, 0.7411765, 1, 0, 1,
-0.8286176, -1.062699, -3.014764, 0.7333333, 1, 0, 1,
-0.8264275, 0.7602599, -1.452344, 0.7294118, 1, 0, 1,
-0.826321, -0.1044131, -2.157182, 0.7215686, 1, 0, 1,
-0.8181429, -1.676829, -3.466328, 0.7176471, 1, 0, 1,
-0.8175371, 1.247127, -0.4984676, 0.7098039, 1, 0, 1,
-0.814815, -0.2022732, -2.51771, 0.7058824, 1, 0, 1,
-0.8119156, -0.1202884, -2.66176, 0.6980392, 1, 0, 1,
-0.8116304, 0.6527027, -3.111916, 0.6901961, 1, 0, 1,
-0.8108735, 0.2730245, -2.258165, 0.6862745, 1, 0, 1,
-0.8063388, 0.3306619, -1.704635, 0.6784314, 1, 0, 1,
-0.8050341, -0.2296241, -1.359886, 0.6745098, 1, 0, 1,
-0.8043694, 0.7163117, -0.7379261, 0.6666667, 1, 0, 1,
-0.8024076, 1.032865, 0.07381398, 0.6627451, 1, 0, 1,
-0.7993801, 0.3138466, 1.371199, 0.654902, 1, 0, 1,
-0.7873195, 0.07629047, 0.677723, 0.6509804, 1, 0, 1,
-0.7855187, -0.4630684, -2.047513, 0.6431373, 1, 0, 1,
-0.7847484, -1.992607, -4.031952, 0.6392157, 1, 0, 1,
-0.7738327, 0.1747535, -1.377647, 0.6313726, 1, 0, 1,
-0.7609814, -0.1359069, -0.9587857, 0.627451, 1, 0, 1,
-0.7593389, 1.395251, -1.06285, 0.6196079, 1, 0, 1,
-0.7555242, -1.537624, -0.7895651, 0.6156863, 1, 0, 1,
-0.7542913, -1.157512, -3.211127, 0.6078432, 1, 0, 1,
-0.7533613, -1.791986, -3.099837, 0.6039216, 1, 0, 1,
-0.750607, 0.3547037, -0.3709209, 0.5960785, 1, 0, 1,
-0.7359324, 0.4638464, 0.1365784, 0.5882353, 1, 0, 1,
-0.735172, 0.636688, -2.586499, 0.5843138, 1, 0, 1,
-0.7336442, -2.118406, -4.795216, 0.5764706, 1, 0, 1,
-0.7268754, -1.39605, -1.898007, 0.572549, 1, 0, 1,
-0.7140312, -0.7748563, -2.424133, 0.5647059, 1, 0, 1,
-0.7135026, 0.1627305, -1.05905, 0.5607843, 1, 0, 1,
-0.7105529, -0.6555048, -2.167487, 0.5529412, 1, 0, 1,
-0.7104765, 0.2303704, -3.173775, 0.5490196, 1, 0, 1,
-0.7081524, 0.2740069, -1.710628, 0.5411765, 1, 0, 1,
-0.707587, -0.595951, -1.713014, 0.5372549, 1, 0, 1,
-0.6924354, -1.136684, -2.335189, 0.5294118, 1, 0, 1,
-0.6917831, 0.8400105, -0.7520953, 0.5254902, 1, 0, 1,
-0.6905001, 0.3919813, -1.066645, 0.5176471, 1, 0, 1,
-0.6870267, -0.34328, -0.5757952, 0.5137255, 1, 0, 1,
-0.6861848, -0.8622698, -3.358245, 0.5058824, 1, 0, 1,
-0.6829445, -0.6177236, -1.989473, 0.5019608, 1, 0, 1,
-0.6777743, -0.120771, -1.184831, 0.4941176, 1, 0, 1,
-0.6753296, 1.475587, -0.8893602, 0.4862745, 1, 0, 1,
-0.6746917, -0.09459688, -1.719389, 0.4823529, 1, 0, 1,
-0.6712333, -0.2850301, -1.9252, 0.4745098, 1, 0, 1,
-0.6694431, 0.5343021, -0.5006704, 0.4705882, 1, 0, 1,
-0.6649929, -0.6104671, -0.9965139, 0.4627451, 1, 0, 1,
-0.6629586, -0.03502172, -1.158092, 0.4588235, 1, 0, 1,
-0.6612487, -0.0267657, -2.199644, 0.4509804, 1, 0, 1,
-0.6602836, 0.07630434, -3.641324, 0.4470588, 1, 0, 1,
-0.6552613, 0.6628075, -3.321384, 0.4392157, 1, 0, 1,
-0.6538355, -0.1944889, -0.8916362, 0.4352941, 1, 0, 1,
-0.6514402, 0.987496, 0.3544052, 0.427451, 1, 0, 1,
-0.635173, 0.439638, -1.53284, 0.4235294, 1, 0, 1,
-0.6327661, -0.2130672, -1.278783, 0.4156863, 1, 0, 1,
-0.6294333, -0.5070773, -1.747244, 0.4117647, 1, 0, 1,
-0.6261014, 0.4553269, -2.220235, 0.4039216, 1, 0, 1,
-0.6216058, 0.07009613, -1.111397, 0.3960784, 1, 0, 1,
-0.6199524, -0.7969698, -3.093516, 0.3921569, 1, 0, 1,
-0.6187254, -1.045802, -2.214398, 0.3843137, 1, 0, 1,
-0.618313, 0.9631351, -0.8920931, 0.3803922, 1, 0, 1,
-0.6093553, -0.3015083, -3.526073, 0.372549, 1, 0, 1,
-0.6079491, -0.7768401, -2.060463, 0.3686275, 1, 0, 1,
-0.6030314, 0.2988323, -1.91118, 0.3607843, 1, 0, 1,
-0.593676, -0.04509298, -1.668339, 0.3568628, 1, 0, 1,
-0.5900663, -0.5557903, -2.894402, 0.3490196, 1, 0, 1,
-0.5861352, -0.2884575, -1.639475, 0.345098, 1, 0, 1,
-0.5858665, 1.443054, -0.7795837, 0.3372549, 1, 0, 1,
-0.5768406, 0.08606155, -2.379214, 0.3333333, 1, 0, 1,
-0.5697067, 0.3137589, -1.56981, 0.3254902, 1, 0, 1,
-0.5659703, -0.426908, -3.167333, 0.3215686, 1, 0, 1,
-0.5630828, -0.5903429, -1.682483, 0.3137255, 1, 0, 1,
-0.5621762, 0.101049, -0.7534078, 0.3098039, 1, 0, 1,
-0.5601938, -1.947348, -2.608475, 0.3019608, 1, 0, 1,
-0.5566642, 0.3982645, -0.9513889, 0.2941177, 1, 0, 1,
-0.5560116, 0.02314226, -0.9579081, 0.2901961, 1, 0, 1,
-0.5557117, 0.2328066, -1.184247, 0.282353, 1, 0, 1,
-0.5473285, 0.5528406, 0.289719, 0.2784314, 1, 0, 1,
-0.5456492, -1.220056, -3.874618, 0.2705882, 1, 0, 1,
-0.540756, 0.7917175, -1.035933, 0.2666667, 1, 0, 1,
-0.5301082, 1.652464, -0.1415446, 0.2588235, 1, 0, 1,
-0.5175189, -0.6358114, -1.499922, 0.254902, 1, 0, 1,
-0.5158104, -0.3791644, -3.43988, 0.2470588, 1, 0, 1,
-0.5147974, -2.232325, -3.230866, 0.2431373, 1, 0, 1,
-0.5078681, -1.680242, -1.463873, 0.2352941, 1, 0, 1,
-0.50137, -2.745963, -4.060855, 0.2313726, 1, 0, 1,
-0.5009121, -0.2232809, -2.587192, 0.2235294, 1, 0, 1,
-0.5004074, -2.040528, -2.787312, 0.2196078, 1, 0, 1,
-0.4998452, 0.5554091, -3.143963, 0.2117647, 1, 0, 1,
-0.4948935, -2.013075, -2.428953, 0.2078431, 1, 0, 1,
-0.4944239, 0.5141113, 0.5307961, 0.2, 1, 0, 1,
-0.4901245, -0.9779797, -2.32495, 0.1921569, 1, 0, 1,
-0.4893935, -3.06519, -3.589525, 0.1882353, 1, 0, 1,
-0.4879746, 0.3491895, -0.8045651, 0.1803922, 1, 0, 1,
-0.4863918, -0.2853997, -2.09828, 0.1764706, 1, 0, 1,
-0.4785143, 1.690425, -1.146161, 0.1686275, 1, 0, 1,
-0.4779895, -0.2967548, -3.26872, 0.1647059, 1, 0, 1,
-0.4773006, 0.5855171, -2.959179, 0.1568628, 1, 0, 1,
-0.4754435, 1.207391, -0.1817099, 0.1529412, 1, 0, 1,
-0.4745312, 1.417527, 1.112867, 0.145098, 1, 0, 1,
-0.4714816, -0.9460523, -3.251853, 0.1411765, 1, 0, 1,
-0.4699664, 0.05152651, -2.213099, 0.1333333, 1, 0, 1,
-0.4674088, 0.1886704, 0.1308894, 0.1294118, 1, 0, 1,
-0.4596896, -0.8581159, -3.01825, 0.1215686, 1, 0, 1,
-0.4584923, 0.1285412, -1.23412, 0.1176471, 1, 0, 1,
-0.4551796, 0.2895602, -1.364438, 0.1098039, 1, 0, 1,
-0.4541085, -1.305314, -1.933143, 0.1058824, 1, 0, 1,
-0.4534537, 1.697029, 0.8273463, 0.09803922, 1, 0, 1,
-0.4493409, -1.84339, -2.889032, 0.09019608, 1, 0, 1,
-0.4462397, -0.1057564, -1.38252, 0.08627451, 1, 0, 1,
-0.4458846, -0.3848571, -2.482444, 0.07843138, 1, 0, 1,
-0.4416843, -0.3314471, -2.6143, 0.07450981, 1, 0, 1,
-0.439096, -0.2137504, -2.217293, 0.06666667, 1, 0, 1,
-0.4315008, -0.168553, -1.576837, 0.0627451, 1, 0, 1,
-0.4303846, 0.157783, -1.903613, 0.05490196, 1, 0, 1,
-0.4297587, 0.3051335, -1.539894, 0.05098039, 1, 0, 1,
-0.4295978, 0.7108466, -1.882906, 0.04313726, 1, 0, 1,
-0.4280184, 1.953545, 0.06301586, 0.03921569, 1, 0, 1,
-0.422325, -2.041562, -2.958384, 0.03137255, 1, 0, 1,
-0.4186115, 0.7140976, -0.4685796, 0.02745098, 1, 0, 1,
-0.416986, 1.300306, -0.6674166, 0.01960784, 1, 0, 1,
-0.4167238, 0.3820271, -1.722799, 0.01568628, 1, 0, 1,
-0.412759, 0.2038058, -0.5090848, 0.007843138, 1, 0, 1,
-0.4124904, -1.053467, -3.047189, 0.003921569, 1, 0, 1,
-0.411909, -1.034272, -3.815498, 0, 1, 0.003921569, 1,
-0.407236, 0.7197219, -1.559708, 0, 1, 0.01176471, 1,
-0.4064315, -2.507982, -2.897553, 0, 1, 0.01568628, 1,
-0.4057985, 0.327478, 1.222044, 0, 1, 0.02352941, 1,
-0.4044866, -0.8184078, -3.133766, 0, 1, 0.02745098, 1,
-0.404246, -1.216432, -2.549247, 0, 1, 0.03529412, 1,
-0.4028209, -1.23137, -1.940502, 0, 1, 0.03921569, 1,
-0.4009424, -1.388968, -3.696053, 0, 1, 0.04705882, 1,
-0.3908642, -1.204607, -0.6895646, 0, 1, 0.05098039, 1,
-0.3886853, 0.1924272, -1.556657, 0, 1, 0.05882353, 1,
-0.3831684, 0.5883366, -0.348018, 0, 1, 0.0627451, 1,
-0.3794991, 0.2247474, -0.4900384, 0, 1, 0.07058824, 1,
-0.3779303, 0.2347596, -1.552574, 0, 1, 0.07450981, 1,
-0.3770306, 0.09441824, -1.670948, 0, 1, 0.08235294, 1,
-0.3751241, -2.366135, -2.702607, 0, 1, 0.08627451, 1,
-0.3731778, -0.2255153, -3.265841, 0, 1, 0.09411765, 1,
-0.3719546, -1.269676, -3.565487, 0, 1, 0.1019608, 1,
-0.3661799, 0.8055539, -0.2791537, 0, 1, 0.1058824, 1,
-0.3652124, -0.2429207, -1.644691, 0, 1, 0.1137255, 1,
-0.364482, 1.032984, -0.5704137, 0, 1, 0.1176471, 1,
-0.3558069, 0.5035773, -0.08081468, 0, 1, 0.1254902, 1,
-0.3550086, -0.1313197, -1.947596, 0, 1, 0.1294118, 1,
-0.3546085, -1.666101, -1.290079, 0, 1, 0.1372549, 1,
-0.3527464, -0.3539622, -1.257907, 0, 1, 0.1411765, 1,
-0.3422838, 3.949267, -0.06597199, 0, 1, 0.1490196, 1,
-0.3415922, 2.253739, -0.3937759, 0, 1, 0.1529412, 1,
-0.3413833, 0.8195821, 1.274686, 0, 1, 0.1607843, 1,
-0.3390406, -1.089428, -2.536977, 0, 1, 0.1647059, 1,
-0.3376407, -0.6779313, -3.261774, 0, 1, 0.172549, 1,
-0.3370389, -1.944352, -2.31212, 0, 1, 0.1764706, 1,
-0.3337165, -0.2161639, 0.5510406, 0, 1, 0.1843137, 1,
-0.3328766, -1.622583, -1.399807, 0, 1, 0.1882353, 1,
-0.330998, 0.4121371, -2.154796, 0, 1, 0.1960784, 1,
-0.3293097, 0.004244848, -2.731272, 0, 1, 0.2039216, 1,
-0.3281589, 1.283627, -0.3534097, 0, 1, 0.2078431, 1,
-0.3262895, -8.125849e-06, -1.640289, 0, 1, 0.2156863, 1,
-0.3229096, 1.067356, 1.452646, 0, 1, 0.2196078, 1,
-0.3208996, 0.727416, -0.1036373, 0, 1, 0.227451, 1,
-0.3203141, 0.1832344, -0.3099867, 0, 1, 0.2313726, 1,
-0.3198631, -0.6183453, -2.124173, 0, 1, 0.2392157, 1,
-0.3181305, 0.04870845, -1.40313, 0, 1, 0.2431373, 1,
-0.3133228, 1.191939, -1.745308, 0, 1, 0.2509804, 1,
-0.3113013, 0.4519146, -0.7454651, 0, 1, 0.254902, 1,
-0.3084133, 0.9447669, 0.08047481, 0, 1, 0.2627451, 1,
-0.3066444, 1.39248, -0.6284963, 0, 1, 0.2666667, 1,
-0.300523, 1.343786, 1.315659, 0, 1, 0.2745098, 1,
-0.3004032, -0.04418108, -1.277715, 0, 1, 0.2784314, 1,
-0.2994004, 1.489102, -0.1514959, 0, 1, 0.2862745, 1,
-0.2905341, 0.07659065, -1.417659, 0, 1, 0.2901961, 1,
-0.2895092, 0.09015636, 0.1407764, 0, 1, 0.2980392, 1,
-0.2883927, -0.08962641, -2.273588, 0, 1, 0.3058824, 1,
-0.2716935, 0.6828363, 0.5602964, 0, 1, 0.3098039, 1,
-0.2703179, 1.988923, 1.306898, 0, 1, 0.3176471, 1,
-0.2656046, -0.9045637, -1.660205, 0, 1, 0.3215686, 1,
-0.2613001, 1.40594, -2.162314, 0, 1, 0.3294118, 1,
-0.2610138, 1.276443, -0.4362043, 0, 1, 0.3333333, 1,
-0.2593428, 0.3993656, 0.01592722, 0, 1, 0.3411765, 1,
-0.2571297, 1.048159, 0.5935327, 0, 1, 0.345098, 1,
-0.2566757, 0.1483726, -0.8771532, 0, 1, 0.3529412, 1,
-0.2550192, -0.03725581, -0.9045933, 0, 1, 0.3568628, 1,
-0.2537588, 1.453685, -0.808476, 0, 1, 0.3647059, 1,
-0.2520247, -0.8360307, -2.898992, 0, 1, 0.3686275, 1,
-0.2442594, -2.48014, -3.204551, 0, 1, 0.3764706, 1,
-0.2435602, -0.71479, -2.905777, 0, 1, 0.3803922, 1,
-0.2429139, -0.8933969, -3.860993, 0, 1, 0.3882353, 1,
-0.2425522, 0.07934952, -1.158854, 0, 1, 0.3921569, 1,
-0.2401603, -0.2000433, -3.058513, 0, 1, 0.4, 1,
-0.2366314, -1.966583, -1.758441, 0, 1, 0.4078431, 1,
-0.2352203, -1.021953, -2.148663, 0, 1, 0.4117647, 1,
-0.2338851, 0.5726935, -0.3279615, 0, 1, 0.4196078, 1,
-0.2306538, 0.3405989, -1.419091, 0, 1, 0.4235294, 1,
-0.2303341, 0.5882276, -0.2131754, 0, 1, 0.4313726, 1,
-0.2237093, -0.3706571, -2.726724, 0, 1, 0.4352941, 1,
-0.2216272, -1.185487, -2.3498, 0, 1, 0.4431373, 1,
-0.2202257, 1.725508, 0.1133268, 0, 1, 0.4470588, 1,
-0.21813, 0.2834364, -0.3099477, 0, 1, 0.454902, 1,
-0.2169156, 1.152169, -0.05595438, 0, 1, 0.4588235, 1,
-0.216894, -0.4118718, -2.88434, 0, 1, 0.4666667, 1,
-0.2144895, -0.01740309, -3.393617, 0, 1, 0.4705882, 1,
-0.2140436, -1.123706, -3.39261, 0, 1, 0.4784314, 1,
-0.2133497, -0.1701809, -1.264293, 0, 1, 0.4823529, 1,
-0.2130263, 1.006169, -0.6666607, 0, 1, 0.4901961, 1,
-0.2114185, -0.4148182, -2.011495, 0, 1, 0.4941176, 1,
-0.2088101, -0.3917351, -2.712032, 0, 1, 0.5019608, 1,
-0.2020186, -0.1014868, -0.3926147, 0, 1, 0.509804, 1,
-0.2001946, -1.891306, -2.793432, 0, 1, 0.5137255, 1,
-0.1956595, 0.004456719, -0.902828, 0, 1, 0.5215687, 1,
-0.1952416, -0.6663122, -1.315836, 0, 1, 0.5254902, 1,
-0.1908434, -0.3462573, -2.586286, 0, 1, 0.5333334, 1,
-0.1884968, -1.661623, -3.556949, 0, 1, 0.5372549, 1,
-0.1853986, -0.2131045, -2.747052, 0, 1, 0.5450981, 1,
-0.1823955, 1.24905, -0.656957, 0, 1, 0.5490196, 1,
-0.1785248, -0.3418259, -3.092395, 0, 1, 0.5568628, 1,
-0.1763571, -0.875245, -2.166609, 0, 1, 0.5607843, 1,
-0.176178, 0.4890491, -1.857004, 0, 1, 0.5686275, 1,
-0.1758811, -1.624876, -3.099363, 0, 1, 0.572549, 1,
-0.17308, -1.479314, -1.793205, 0, 1, 0.5803922, 1,
-0.1718285, -0.126504, -2.48145, 0, 1, 0.5843138, 1,
-0.1668249, -1.864396, -3.056272, 0, 1, 0.5921569, 1,
-0.1646971, -1.694932, -1.181373, 0, 1, 0.5960785, 1,
-0.1645668, 2.120283, 0.3537546, 0, 1, 0.6039216, 1,
-0.163914, -0.6181884, -2.93421, 0, 1, 0.6117647, 1,
-0.1634403, 0.978684, -0.3933547, 0, 1, 0.6156863, 1,
-0.1600894, 0.7424285, -0.07878233, 0, 1, 0.6235294, 1,
-0.1571966, 0.5694855, 0.09683445, 0, 1, 0.627451, 1,
-0.1571031, -0.8447633, -2.003224, 0, 1, 0.6352941, 1,
-0.1542211, -1.772351, -3.622989, 0, 1, 0.6392157, 1,
-0.1515212, -1.210534, -2.99022, 0, 1, 0.6470588, 1,
-0.1473807, 0.1928054, -0.3946058, 0, 1, 0.6509804, 1,
-0.1471377, 0.002930302, -2.662254, 0, 1, 0.6588235, 1,
-0.146509, 0.07453006, -0.4389265, 0, 1, 0.6627451, 1,
-0.1455561, -1.547255, -2.753198, 0, 1, 0.6705883, 1,
-0.1448999, -0.4468149, -3.005808, 0, 1, 0.6745098, 1,
-0.1441143, 1.479285, -1.380714, 0, 1, 0.682353, 1,
-0.1429743, -0.9318848, -2.547396, 0, 1, 0.6862745, 1,
-0.1423678, 0.08892326, -1.483241, 0, 1, 0.6941177, 1,
-0.1409975, -2.625688, -3.429388, 0, 1, 0.7019608, 1,
-0.1403143, -0.8457236, -3.332134, 0, 1, 0.7058824, 1,
-0.1402167, -0.6123438, -3.189303, 0, 1, 0.7137255, 1,
-0.1380326, -1.525456, -2.525701, 0, 1, 0.7176471, 1,
-0.1303921, -1.568458, -3.686392, 0, 1, 0.7254902, 1,
-0.1288497, -0.3460387, -1.622666, 0, 1, 0.7294118, 1,
-0.1274433, -1.774425, -4.911411, 0, 1, 0.7372549, 1,
-0.1272962, -0.5161683, -3.94128, 0, 1, 0.7411765, 1,
-0.1262858, 1.168522, -0.3402579, 0, 1, 0.7490196, 1,
-0.1254701, 0.06391871, -1.231677, 0, 1, 0.7529412, 1,
-0.119614, 0.08286382, -1.611028, 0, 1, 0.7607843, 1,
-0.1154112, -3.293184, -3.913893, 0, 1, 0.7647059, 1,
-0.1147797, 0.03004888, -0.3291031, 0, 1, 0.772549, 1,
-0.113449, 0.0008425421, -1.438968, 0, 1, 0.7764706, 1,
-0.1130564, 0.2863731, -0.735075, 0, 1, 0.7843137, 1,
-0.1082246, -0.8215696, -2.28395, 0, 1, 0.7882353, 1,
-0.1068794, 0.5679736, -0.3991719, 0, 1, 0.7960784, 1,
-0.09358271, 0.2175261, 1.406726, 0, 1, 0.8039216, 1,
-0.09289496, -0.6647592, -4.197824, 0, 1, 0.8078431, 1,
-0.09220047, 0.283753, -1.480499, 0, 1, 0.8156863, 1,
-0.09077016, 0.4635084, -1.757056, 0, 1, 0.8196079, 1,
-0.08610626, 0.705474, -0.05657328, 0, 1, 0.827451, 1,
-0.08379214, -1.513389, -4.256114, 0, 1, 0.8313726, 1,
-0.0799247, -0.6532366, -5.199627, 0, 1, 0.8392157, 1,
-0.07710771, -0.9638122, -2.946069, 0, 1, 0.8431373, 1,
-0.07394148, -1.928967, -3.080183, 0, 1, 0.8509804, 1,
-0.07071274, -1.063661, -1.70326, 0, 1, 0.854902, 1,
-0.06855391, 0.1800541, -0.4403637, 0, 1, 0.8627451, 1,
-0.06715372, 1.99694, -2.836329, 0, 1, 0.8666667, 1,
-0.06562979, 0.09953263, 0.5923125, 0, 1, 0.8745098, 1,
-0.06369776, 0.07074562, -2.992356, 0, 1, 0.8784314, 1,
-0.06334014, -0.7739765, -3.429476, 0, 1, 0.8862745, 1,
-0.0575648, 0.02957349, -2.315141, 0, 1, 0.8901961, 1,
-0.05300777, -0.1370042, -1.642439, 0, 1, 0.8980392, 1,
-0.04983532, 0.2026822, 1.934103, 0, 1, 0.9058824, 1,
-0.04947785, -1.07914, -3.778832, 0, 1, 0.9098039, 1,
-0.04942173, 1.128891, 0.6010395, 0, 1, 0.9176471, 1,
-0.04585476, 0.5681472, -0.6154267, 0, 1, 0.9215686, 1,
-0.04529949, -1.172799, -3.54254, 0, 1, 0.9294118, 1,
-0.04271268, 1.043581, -0.8823757, 0, 1, 0.9333333, 1,
-0.03798999, 1.103608, -0.1048943, 0, 1, 0.9411765, 1,
-0.03667708, 0.7647861, -0.08899994, 0, 1, 0.945098, 1,
-0.03180494, 1.523612, -1.180483, 0, 1, 0.9529412, 1,
-0.02715648, -0.8478924, -3.218796, 0, 1, 0.9568627, 1,
-0.02433611, -0.2841938, -3.021125, 0, 1, 0.9647059, 1,
-0.02079784, -0.8648061, -2.657704, 0, 1, 0.9686275, 1,
-0.01990595, 0.5973023, 0.3531769, 0, 1, 0.9764706, 1,
-0.01921725, 0.4661873, 0.1485602, 0, 1, 0.9803922, 1,
-0.01868376, -0.7819861, -2.034534, 0, 1, 0.9882353, 1,
-0.01831225, 1.041796, -1.774976, 0, 1, 0.9921569, 1,
-0.01693874, 0.8100094, 0.07715172, 0, 1, 1, 1,
-0.01518315, 0.5426074, -1.645717, 0, 0.9921569, 1, 1,
-0.01107482, 0.6679148, 1.225598, 0, 0.9882353, 1, 1,
-0.00415909, -0.9003271, -4.506906, 0, 0.9803922, 1, 1,
-0.003526563, 0.1121536, 0.3229651, 0, 0.9764706, 1, 1,
-0.0004167505, -0.5775372, -3.013717, 0, 0.9686275, 1, 1,
0.001291719, -1.335877, 4.837651, 0, 0.9647059, 1, 1,
0.002304846, -0.7368053, 2.451798, 0, 0.9568627, 1, 1,
0.002778153, 0.6678731, 0.1214685, 0, 0.9529412, 1, 1,
0.005713727, 1.121969, -1.337608, 0, 0.945098, 1, 1,
0.007661077, 0.573693, -0.8093389, 0, 0.9411765, 1, 1,
0.01057878, -1.041286, 2.753326, 0, 0.9333333, 1, 1,
0.0152135, -0.01935409, 3.284955, 0, 0.9294118, 1, 1,
0.01525753, -0.4104977, 1.441952, 0, 0.9215686, 1, 1,
0.01647037, 0.2449253, 0.6502154, 0, 0.9176471, 1, 1,
0.01647885, 0.4026799, -0.6433411, 0, 0.9098039, 1, 1,
0.01927134, -0.191169, 2.633436, 0, 0.9058824, 1, 1,
0.01971367, -1.836212, 1.221928, 0, 0.8980392, 1, 1,
0.02026174, 0.0308215, 0.7748058, 0, 0.8901961, 1, 1,
0.02635634, 0.4769707, 0.06310175, 0, 0.8862745, 1, 1,
0.02899802, 0.6227633, 0.2706124, 0, 0.8784314, 1, 1,
0.0369157, -0.8766043, 3.007752, 0, 0.8745098, 1, 1,
0.03723418, 1.943971, -0.3807227, 0, 0.8666667, 1, 1,
0.03733186, 1.288688, -0.5007855, 0, 0.8627451, 1, 1,
0.0417875, 0.5718794, 0.1215362, 0, 0.854902, 1, 1,
0.04424574, 0.8841056, -0.4468238, 0, 0.8509804, 1, 1,
0.04517071, -0.8313561, 3.662733, 0, 0.8431373, 1, 1,
0.047186, 0.8319654, -1.490872, 0, 0.8392157, 1, 1,
0.04794756, 1.126354, 0.168048, 0, 0.8313726, 1, 1,
0.05346507, 1.736673, -0.08830402, 0, 0.827451, 1, 1,
0.05803795, -0.2603208, 2.028213, 0, 0.8196079, 1, 1,
0.05825602, 1.429368, 0.9252493, 0, 0.8156863, 1, 1,
0.05872844, -1.006879, 2.214521, 0, 0.8078431, 1, 1,
0.06096258, 0.9354972, 0.2128597, 0, 0.8039216, 1, 1,
0.06344901, 0.2365737, 1.587246, 0, 0.7960784, 1, 1,
0.06845039, -0.5584707, 3.505466, 0, 0.7882353, 1, 1,
0.07069378, 0.3513903, 1.166967, 0, 0.7843137, 1, 1,
0.07113998, -1.288867, 3.90515, 0, 0.7764706, 1, 1,
0.0754635, -0.8297028, 3.218153, 0, 0.772549, 1, 1,
0.07604976, -0.3221223, 2.95344, 0, 0.7647059, 1, 1,
0.07632446, -1.398426, 4.547836, 0, 0.7607843, 1, 1,
0.08382212, 1.414947, 0.8222769, 0, 0.7529412, 1, 1,
0.08736519, -0.1443085, 1.81802, 0, 0.7490196, 1, 1,
0.08764975, 1.140094, -0.3808534, 0, 0.7411765, 1, 1,
0.08806655, 0.2529328, 0.9603617, 0, 0.7372549, 1, 1,
0.09106109, -0.4802246, 2.480628, 0, 0.7294118, 1, 1,
0.09807182, -0.9588756, 2.536188, 0, 0.7254902, 1, 1,
0.0989857, -0.1768925, 3.712759, 0, 0.7176471, 1, 1,
0.1011385, -1.54385, 2.749442, 0, 0.7137255, 1, 1,
0.1015293, -0.7502753, 1.878947, 0, 0.7058824, 1, 1,
0.1027964, 1.078566, -0.2424572, 0, 0.6980392, 1, 1,
0.1036099, 0.007964503, 2.695542, 0, 0.6941177, 1, 1,
0.1076908, -0.8778705, 1.888081, 0, 0.6862745, 1, 1,
0.1104133, -0.8697911, 3.996627, 0, 0.682353, 1, 1,
0.1146291, 0.3861994, 2.739471, 0, 0.6745098, 1, 1,
0.1167312, 1.452959, -1.09783, 0, 0.6705883, 1, 1,
0.1190962, 1.342077, 0.7914859, 0, 0.6627451, 1, 1,
0.1212013, 0.6572883, -0.4677249, 0, 0.6588235, 1, 1,
0.1235645, 1.325778, 0.1298412, 0, 0.6509804, 1, 1,
0.1319255, 0.1836661, 2.122134, 0, 0.6470588, 1, 1,
0.1359392, 0.7063539, 1.288018, 0, 0.6392157, 1, 1,
0.1379314, -0.4381474, 2.126176, 0, 0.6352941, 1, 1,
0.1417208, 0.06902745, 0.04683875, 0, 0.627451, 1, 1,
0.1463273, 0.4658602, -0.9970649, 0, 0.6235294, 1, 1,
0.1492973, -0.2785096, 2.873295, 0, 0.6156863, 1, 1,
0.1498627, -0.5499271, 3.348001, 0, 0.6117647, 1, 1,
0.150951, 0.6275581, 0.7462081, 0, 0.6039216, 1, 1,
0.1515021, -0.4284008, -0.199752, 0, 0.5960785, 1, 1,
0.1526549, 0.1279821, 0.3686815, 0, 0.5921569, 1, 1,
0.1528615, 0.4698672, 0.1604576, 0, 0.5843138, 1, 1,
0.1595177, -1.303033, 1.069689, 0, 0.5803922, 1, 1,
0.1598257, 1.183725, 0.2265166, 0, 0.572549, 1, 1,
0.1668005, 0.5502594, 0.8188048, 0, 0.5686275, 1, 1,
0.1676839, 1.917835, 1.068739, 0, 0.5607843, 1, 1,
0.1711253, -0.9832577, 3.367345, 0, 0.5568628, 1, 1,
0.1738573, 0.9098369, -0.4580936, 0, 0.5490196, 1, 1,
0.1742692, -0.8095686, 2.436041, 0, 0.5450981, 1, 1,
0.1767197, -0.1106866, 2.586053, 0, 0.5372549, 1, 1,
0.1798207, 1.275746, 0.6093901, 0, 0.5333334, 1, 1,
0.1853158, 0.2824618, -1.199257, 0, 0.5254902, 1, 1,
0.1864157, -0.5893545, 3.649135, 0, 0.5215687, 1, 1,
0.193696, -0.7880122, 3.895764, 0, 0.5137255, 1, 1,
0.194438, -0.3336211, 2.119361, 0, 0.509804, 1, 1,
0.1947928, -1.630164, 1.174106, 0, 0.5019608, 1, 1,
0.1959981, -1.825199, 4.482644, 0, 0.4941176, 1, 1,
0.2013659, 0.5205182, -0.6315516, 0, 0.4901961, 1, 1,
0.2028107, 0.07469989, 1.371979, 0, 0.4823529, 1, 1,
0.2029801, -1.120424, 3.159319, 0, 0.4784314, 1, 1,
0.204745, 0.4702526, 1.023429, 0, 0.4705882, 1, 1,
0.2063224, -0.08346666, 1.595731, 0, 0.4666667, 1, 1,
0.207626, -1.001948, 3.263209, 0, 0.4588235, 1, 1,
0.20842, 2.116768, 2.140839, 0, 0.454902, 1, 1,
0.2105347, 0.4438889, 0.2924022, 0, 0.4470588, 1, 1,
0.2128922, 0.09174474, 1.244113, 0, 0.4431373, 1, 1,
0.2173899, 0.5507338, -0.7456017, 0, 0.4352941, 1, 1,
0.2242635, 0.2125516, 0.4398582, 0, 0.4313726, 1, 1,
0.2300089, 1.163684, 1.372573, 0, 0.4235294, 1, 1,
0.2344568, 0.203103, 1.334496, 0, 0.4196078, 1, 1,
0.235247, -0.8359128, 1.944791, 0, 0.4117647, 1, 1,
0.2379993, -0.2615573, 2.019065, 0, 0.4078431, 1, 1,
0.238766, 0.5169988, -1.085521, 0, 0.4, 1, 1,
0.2405004, -1.564716, 2.126687, 0, 0.3921569, 1, 1,
0.2405652, -0.2889074, 1.782914, 0, 0.3882353, 1, 1,
0.2451035, 1.640159, 1.799049, 0, 0.3803922, 1, 1,
0.25254, 1.199769, 1.440943, 0, 0.3764706, 1, 1,
0.2527118, 0.9375971, 2.62593, 0, 0.3686275, 1, 1,
0.2545122, -0.003522753, 0.3767255, 0, 0.3647059, 1, 1,
0.2630422, -0.8171757, 1.69048, 0, 0.3568628, 1, 1,
0.2633677, 1.380726, -0.01959212, 0, 0.3529412, 1, 1,
0.2651432, 0.1000628, 2.350579, 0, 0.345098, 1, 1,
0.2652854, -0.3475694, 1.730602, 0, 0.3411765, 1, 1,
0.2657222, 0.1284273, -0.6562397, 0, 0.3333333, 1, 1,
0.2657782, 1.003877, -1.645917, 0, 0.3294118, 1, 1,
0.269532, -0.8544501, 2.791812, 0, 0.3215686, 1, 1,
0.2711991, -0.4355385, 2.870674, 0, 0.3176471, 1, 1,
0.2716001, -0.1418999, 2.426746, 0, 0.3098039, 1, 1,
0.2718514, -0.07968006, 1.235326, 0, 0.3058824, 1, 1,
0.272776, -1.190198, 2.765164, 0, 0.2980392, 1, 1,
0.2728274, 0.5010332, -0.1897682, 0, 0.2901961, 1, 1,
0.2735134, -1.03934, 2.177482, 0, 0.2862745, 1, 1,
0.2741793, 0.451093, 0.8768117, 0, 0.2784314, 1, 1,
0.2762281, 1.346321, 0.1020515, 0, 0.2745098, 1, 1,
0.2783825, 0.7789605, 1.485854, 0, 0.2666667, 1, 1,
0.2798707, -0.7292312, 3.090248, 0, 0.2627451, 1, 1,
0.2829754, -0.667525, 2.549725, 0, 0.254902, 1, 1,
0.2850249, 1.548358, -0.6404076, 0, 0.2509804, 1, 1,
0.2929013, 0.05514721, 1.504553, 0, 0.2431373, 1, 1,
0.2934927, -1.149159, 2.83765, 0, 0.2392157, 1, 1,
0.2976438, 0.7150896, -0.5522125, 0, 0.2313726, 1, 1,
0.3001397, 1.016665, 0.4811997, 0, 0.227451, 1, 1,
0.3016941, -1.830576, 1.780078, 0, 0.2196078, 1, 1,
0.306803, -0.5195609, 3.267773, 0, 0.2156863, 1, 1,
0.3077606, 0.2762871, 0.5637454, 0, 0.2078431, 1, 1,
0.309444, -0.887864, 3.748612, 0, 0.2039216, 1, 1,
0.3115042, -0.2662732, 1.77959, 0, 0.1960784, 1, 1,
0.3129543, -0.3799326, 1.051416, 0, 0.1882353, 1, 1,
0.3135279, 0.6816875, 0.3870109, 0, 0.1843137, 1, 1,
0.3169762, -0.5688441, 2.272097, 0, 0.1764706, 1, 1,
0.3206909, 1.291752, 1.248587, 0, 0.172549, 1, 1,
0.3227302, -1.133461, 4.40862, 0, 0.1647059, 1, 1,
0.3250107, -0.7269558, 4.826453, 0, 0.1607843, 1, 1,
0.3274542, 1.241046, -0.8483961, 0, 0.1529412, 1, 1,
0.3276772, -0.2670773, 1.383045, 0, 0.1490196, 1, 1,
0.3277035, -0.8318375, 3.369284, 0, 0.1411765, 1, 1,
0.3304485, -0.02134751, 2.069914, 0, 0.1372549, 1, 1,
0.3352115, 0.641665, -0.8268099, 0, 0.1294118, 1, 1,
0.3353184, -1.125397, 4.288957, 0, 0.1254902, 1, 1,
0.3381009, -0.5709447, 1.949289, 0, 0.1176471, 1, 1,
0.3388178, -1.916681, 3.536134, 0, 0.1137255, 1, 1,
0.339784, -0.8576075, 3.031043, 0, 0.1058824, 1, 1,
0.3431728, -0.4820402, 1.535544, 0, 0.09803922, 1, 1,
0.3461626, -0.5248638, 2.369326, 0, 0.09411765, 1, 1,
0.3473227, -1.080766, 4.622767, 0, 0.08627451, 1, 1,
0.347413, -0.4902033, 1.566786, 0, 0.08235294, 1, 1,
0.3484681, -0.08916147, 3.803931, 0, 0.07450981, 1, 1,
0.3506333, -1.494576, 4.702606, 0, 0.07058824, 1, 1,
0.3514853, -0.5030713, 2.301075, 0, 0.0627451, 1, 1,
0.3515535, 0.5286124, -1.425842, 0, 0.05882353, 1, 1,
0.3534292, -1.496428, 3.573571, 0, 0.05098039, 1, 1,
0.354337, 0.4418804, 2.077577, 0, 0.04705882, 1, 1,
0.3550671, 0.3470255, 0.6247203, 0, 0.03921569, 1, 1,
0.3565239, 1.035113, 1.168454, 0, 0.03529412, 1, 1,
0.3575588, 0.9169784, 0.8716872, 0, 0.02745098, 1, 1,
0.3585153, -0.6044429, 1.931799, 0, 0.02352941, 1, 1,
0.3585231, 0.2530274, 0.9722504, 0, 0.01568628, 1, 1,
0.3617499, -0.7442124, 3.304388, 0, 0.01176471, 1, 1,
0.3626875, -1.07294, 2.009753, 0, 0.003921569, 1, 1,
0.3643355, -0.07214244, 2.93705, 0.003921569, 0, 1, 1,
0.3645474, -0.6080561, 0.8914433, 0.007843138, 0, 1, 1,
0.3730627, -1.01828, 1.693767, 0.01568628, 0, 1, 1,
0.3733796, 0.09410189, 1.31242, 0.01960784, 0, 1, 1,
0.3751589, -0.9415077, 3.436575, 0.02745098, 0, 1, 1,
0.3759054, -1.598008, 1.534588, 0.03137255, 0, 1, 1,
0.3876335, -0.85316, 3.528772, 0.03921569, 0, 1, 1,
0.3896174, 0.6429808, -0.2518952, 0.04313726, 0, 1, 1,
0.3929259, 0.7108558, 0.2755727, 0.05098039, 0, 1, 1,
0.3943275, 0.06268816, -0.2623771, 0.05490196, 0, 1, 1,
0.4025995, -1.281534, 3.537785, 0.0627451, 0, 1, 1,
0.4028119, -0.2793868, 1.535252, 0.06666667, 0, 1, 1,
0.4041401, -0.4111982, 2.991077, 0.07450981, 0, 1, 1,
0.4046262, 1.855303, -0.2752996, 0.07843138, 0, 1, 1,
0.4067439, 0.2604378, 1.592369, 0.08627451, 0, 1, 1,
0.4105932, -0.7050993, 2.802114, 0.09019608, 0, 1, 1,
0.4123038, -0.5785879, 1.239344, 0.09803922, 0, 1, 1,
0.4137398, -0.2389903, 1.320433, 0.1058824, 0, 1, 1,
0.4141639, -1.332435, 5.022154, 0.1098039, 0, 1, 1,
0.4157266, -0.842887, 3.037307, 0.1176471, 0, 1, 1,
0.4157302, -0.6999742, 2.890496, 0.1215686, 0, 1, 1,
0.4224083, -3.137226, 4.51997, 0.1294118, 0, 1, 1,
0.4225286, -0.6047536, 2.769022, 0.1333333, 0, 1, 1,
0.4233061, -0.2085711, 3.24429, 0.1411765, 0, 1, 1,
0.4301634, -0.9099923, 4.242173, 0.145098, 0, 1, 1,
0.4321372, 0.1819959, 3.899532, 0.1529412, 0, 1, 1,
0.4339088, -1.498129, 2.770937, 0.1568628, 0, 1, 1,
0.4360932, 1.162093, -0.1607991, 0.1647059, 0, 1, 1,
0.4365686, -1.132231, 2.930583, 0.1686275, 0, 1, 1,
0.4374566, -0.453189, 3.611144, 0.1764706, 0, 1, 1,
0.4376928, -0.5762967, 2.654856, 0.1803922, 0, 1, 1,
0.4389141, -0.2646936, 1.605959, 0.1882353, 0, 1, 1,
0.4431604, -0.8645617, 2.472111, 0.1921569, 0, 1, 1,
0.4461091, -1.060878, 2.38393, 0.2, 0, 1, 1,
0.4471097, 0.06810611, 0.985346, 0.2078431, 0, 1, 1,
0.4574257, 0.4466456, 0.7773989, 0.2117647, 0, 1, 1,
0.4655525, 1.148116, 1.25143, 0.2196078, 0, 1, 1,
0.4704712, -0.103673, 1.265027, 0.2235294, 0, 1, 1,
0.472874, -0.9472154, 2.440948, 0.2313726, 0, 1, 1,
0.4740819, -0.4708064, 2.82311, 0.2352941, 0, 1, 1,
0.4750632, 0.109675, 1.698446, 0.2431373, 0, 1, 1,
0.4806809, -0.5804834, 0.5568112, 0.2470588, 0, 1, 1,
0.4827629, -0.2868188, 0.610613, 0.254902, 0, 1, 1,
0.4846718, -0.3668508, 0.6465707, 0.2588235, 0, 1, 1,
0.4847756, 1.326389, 0.644899, 0.2666667, 0, 1, 1,
0.4928958, -0.5487135, 4.298277, 0.2705882, 0, 1, 1,
0.4952677, 0.5792048, -0.5811909, 0.2784314, 0, 1, 1,
0.4966745, 0.7292622, 1.133768, 0.282353, 0, 1, 1,
0.4971069, 0.9502525, -0.2260746, 0.2901961, 0, 1, 1,
0.4988505, 0.8624105, 0.3531448, 0.2941177, 0, 1, 1,
0.4990649, 0.3552539, 2.084581, 0.3019608, 0, 1, 1,
0.5087283, -0.3992395, 1.752834, 0.3098039, 0, 1, 1,
0.5124845, 0.6895813, 0.9309245, 0.3137255, 0, 1, 1,
0.5184296, 0.5164509, 1.282246, 0.3215686, 0, 1, 1,
0.5298954, 1.447987, 1.786184, 0.3254902, 0, 1, 1,
0.5314947, -0.9445004, 1.974518, 0.3333333, 0, 1, 1,
0.5316347, -0.2840128, 1.770223, 0.3372549, 0, 1, 1,
0.5336977, -1.459872, 4.093753, 0.345098, 0, 1, 1,
0.5394431, 0.9991501, 1.54714, 0.3490196, 0, 1, 1,
0.5428755, -0.929786, 2.014418, 0.3568628, 0, 1, 1,
0.5473028, 0.6210204, 1.372592, 0.3607843, 0, 1, 1,
0.5489879, 1.556791, 0.3018041, 0.3686275, 0, 1, 1,
0.5521442, -0.03901087, 3.028188, 0.372549, 0, 1, 1,
0.5564597, 0.8520818, -0.1046684, 0.3803922, 0, 1, 1,
0.5574678, 0.06499324, 2.48417, 0.3843137, 0, 1, 1,
0.5585869, 1.26463, 2.242819, 0.3921569, 0, 1, 1,
0.5626203, -1.015201, 1.987986, 0.3960784, 0, 1, 1,
0.5627354, 0.7103672, 0.1990327, 0.4039216, 0, 1, 1,
0.5665017, -0.3901258, 2.69042, 0.4117647, 0, 1, 1,
0.5679268, -0.2587757, 1.450104, 0.4156863, 0, 1, 1,
0.5685204, 1.067801, 0.3418546, 0.4235294, 0, 1, 1,
0.5685605, -0.170875, 2.728204, 0.427451, 0, 1, 1,
0.5692784, -0.2082104, 2.105707, 0.4352941, 0, 1, 1,
0.5718723, 0.2374375, -0.07326625, 0.4392157, 0, 1, 1,
0.5720856, -0.6422737, 2.136591, 0.4470588, 0, 1, 1,
0.5775422, -1.860926, 3.293022, 0.4509804, 0, 1, 1,
0.5801854, -1.458628, 4.208593, 0.4588235, 0, 1, 1,
0.5822957, -1.050241, 1.995055, 0.4627451, 0, 1, 1,
0.5865694, 1.263174, 1.443069, 0.4705882, 0, 1, 1,
0.5925524, -1.014565, 1.355568, 0.4745098, 0, 1, 1,
0.5955877, 1.226583, 0.8571, 0.4823529, 0, 1, 1,
0.5965874, 1.961984, -0.9735196, 0.4862745, 0, 1, 1,
0.6050946, -1.012423, 3.386442, 0.4941176, 0, 1, 1,
0.6077384, 0.7052802, 2.374042, 0.5019608, 0, 1, 1,
0.6087408, -3.358864, 1.977715, 0.5058824, 0, 1, 1,
0.6182849, -0.708728, 4.147107, 0.5137255, 0, 1, 1,
0.6185375, -1.37101, 3.36306, 0.5176471, 0, 1, 1,
0.6255043, 0.5159013, 1.797542, 0.5254902, 0, 1, 1,
0.6270366, -1.233781, 0.3648196, 0.5294118, 0, 1, 1,
0.6288117, 0.4595254, 0.4218588, 0.5372549, 0, 1, 1,
0.629167, -0.7409448, 1.993111, 0.5411765, 0, 1, 1,
0.6303537, 2.781108, -0.863428, 0.5490196, 0, 1, 1,
0.6324397, 0.04148012, 1.121761, 0.5529412, 0, 1, 1,
0.633175, 0.1732169, 1.280515, 0.5607843, 0, 1, 1,
0.6411585, -1.227018, 1.180469, 0.5647059, 0, 1, 1,
0.6418613, -1.32679, 3.189571, 0.572549, 0, 1, 1,
0.6432072, 0.5304368, 0.5657406, 0.5764706, 0, 1, 1,
0.6456192, -0.3270797, 2.842378, 0.5843138, 0, 1, 1,
0.6520267, 0.2549366, 0.3177848, 0.5882353, 0, 1, 1,
0.6597049, 0.5812423, 0.6491569, 0.5960785, 0, 1, 1,
0.6622983, -1.163918, 2.076194, 0.6039216, 0, 1, 1,
0.6643607, -1.511284, 1.68612, 0.6078432, 0, 1, 1,
0.6693031, 0.01201806, 1.580969, 0.6156863, 0, 1, 1,
0.6698029, -0.1436792, 0.671137, 0.6196079, 0, 1, 1,
0.6718341, 1.374891, 1.521491, 0.627451, 0, 1, 1,
0.6736779, -0.3583767, 0.04024121, 0.6313726, 0, 1, 1,
0.6765828, -0.1304754, 0.3668073, 0.6392157, 0, 1, 1,
0.681429, -0.3933321, 1.535056, 0.6431373, 0, 1, 1,
0.6940817, 1.796285, 1.674145, 0.6509804, 0, 1, 1,
0.7016808, 0.270091, 0.7935961, 0.654902, 0, 1, 1,
0.7080964, 1.888025, 0.06484736, 0.6627451, 0, 1, 1,
0.7083101, -1.74052, 3.407359, 0.6666667, 0, 1, 1,
0.7099563, 1.602235, 1.101369, 0.6745098, 0, 1, 1,
0.7112446, -0.705276, 2.267849, 0.6784314, 0, 1, 1,
0.7116169, -0.9944819, 3.817013, 0.6862745, 0, 1, 1,
0.7171282, -0.3881723, 2.281723, 0.6901961, 0, 1, 1,
0.7178854, 0.3443967, -0.3367887, 0.6980392, 0, 1, 1,
0.72897, 0.5097594, 1.735093, 0.7058824, 0, 1, 1,
0.7296542, 0.4855815, 0.6075694, 0.7098039, 0, 1, 1,
0.7318949, 0.5008202, 1.658501, 0.7176471, 0, 1, 1,
0.7432263, -0.2258607, 2.107561, 0.7215686, 0, 1, 1,
0.7496576, -1.52501, 2.298007, 0.7294118, 0, 1, 1,
0.750183, -0.8751731, 2.344681, 0.7333333, 0, 1, 1,
0.752511, -0.9883182, 3.877542, 0.7411765, 0, 1, 1,
0.7526348, -0.2161633, 2.319518, 0.7450981, 0, 1, 1,
0.7601039, -0.169911, 0.480033, 0.7529412, 0, 1, 1,
0.7635056, -2.858745, 2.424531, 0.7568628, 0, 1, 1,
0.7651373, 0.3189596, 0.2596966, 0.7647059, 0, 1, 1,
0.7753148, 0.7999074, 0.9263594, 0.7686275, 0, 1, 1,
0.7809177, -0.7053763, 3.155208, 0.7764706, 0, 1, 1,
0.7895391, 1.4646, -0.2215978, 0.7803922, 0, 1, 1,
0.7965806, 0.0320357, 2.260012, 0.7882353, 0, 1, 1,
0.7972434, -1.011857, 3.267342, 0.7921569, 0, 1, 1,
0.7975409, -1.378438, 3.819835, 0.8, 0, 1, 1,
0.7984375, 1.762576, -0.2156638, 0.8078431, 0, 1, 1,
0.7995064, -2.218967, 2.129222, 0.8117647, 0, 1, 1,
0.8071948, -1.882258, 4.223043, 0.8196079, 0, 1, 1,
0.8080792, -0.7390555, 1.9562, 0.8235294, 0, 1, 1,
0.8100088, -0.07581238, 0.7924399, 0.8313726, 0, 1, 1,
0.8125465, -0.7094859, 2.359672, 0.8352941, 0, 1, 1,
0.8237971, -0.6446121, 2.033935, 0.8431373, 0, 1, 1,
0.824921, -0.1577312, 1.852499, 0.8470588, 0, 1, 1,
0.8263654, -1.526991, 2.963763, 0.854902, 0, 1, 1,
0.8277894, -1.006539, 1.37472, 0.8588235, 0, 1, 1,
0.8280725, 0.6805666, 2.375127, 0.8666667, 0, 1, 1,
0.8296992, 1.667356, 0.7019633, 0.8705882, 0, 1, 1,
0.8301609, 1.7839, 0.9391063, 0.8784314, 0, 1, 1,
0.8312207, 1.249818, 1.000749, 0.8823529, 0, 1, 1,
0.8340989, 0.5083656, 0.902976, 0.8901961, 0, 1, 1,
0.8466796, 1.186908, 2.187568, 0.8941177, 0, 1, 1,
0.8489308, 0.9771442, 2.802967, 0.9019608, 0, 1, 1,
0.8563538, -0.6063554, 0.1229302, 0.9098039, 0, 1, 1,
0.8571706, 0.07841348, 0.9253131, 0.9137255, 0, 1, 1,
0.862011, 0.15221, 1.585539, 0.9215686, 0, 1, 1,
0.8663917, 0.3640552, 0.870757, 0.9254902, 0, 1, 1,
0.8673451, 0.330979, 0.8504492, 0.9333333, 0, 1, 1,
0.868328, 0.9755899, 2.456889, 0.9372549, 0, 1, 1,
0.8695757, 1.037887, 1.917613, 0.945098, 0, 1, 1,
0.8699443, -0.5262901, 1.625012, 0.9490196, 0, 1, 1,
0.8734748, -1.257281, 1.730911, 0.9568627, 0, 1, 1,
0.8756673, 1.356218, 0.9520604, 0.9607843, 0, 1, 1,
0.8796578, -1.23684, 0.8319239, 0.9686275, 0, 1, 1,
0.881922, 0.4727753, 0.6792572, 0.972549, 0, 1, 1,
0.8865, 0.3662533, 1.123038, 0.9803922, 0, 1, 1,
0.8878185, -1.129689, 2.18723, 0.9843137, 0, 1, 1,
0.9042644, -0.01528918, 0.9201478, 0.9921569, 0, 1, 1,
0.9065973, 0.7493102, -0.1686662, 0.9960784, 0, 1, 1,
0.9168805, -1.758269, 1.748676, 1, 0, 0.9960784, 1,
0.9176083, 1.027993, -0.3921066, 1, 0, 0.9882353, 1,
0.9180223, 0.9957339, 0.8995997, 1, 0, 0.9843137, 1,
0.9195735, -0.1885492, 2.279495, 1, 0, 0.9764706, 1,
0.925348, 0.5220444, 1.444495, 1, 0, 0.972549, 1,
0.9294196, 1.217158, 0.6815259, 1, 0, 0.9647059, 1,
0.934989, -0.02679012, 1.601814, 1, 0, 0.9607843, 1,
0.937234, -0.4321946, 1.132531, 1, 0, 0.9529412, 1,
0.9485562, 0.02004223, 3.112334, 1, 0, 0.9490196, 1,
0.9498791, -0.8896872, 1.930717, 1, 0, 0.9411765, 1,
0.9554009, 0.3112292, 0.1961781, 1, 0, 0.9372549, 1,
0.9580156, -1.163833, 2.062305, 1, 0, 0.9294118, 1,
0.9624975, 0.2398908, -0.05620252, 1, 0, 0.9254902, 1,
0.9652755, -0.8487229, 1.895715, 1, 0, 0.9176471, 1,
0.973437, 1.243934, -0.3412141, 1, 0, 0.9137255, 1,
0.9750109, 0.3372194, 0.1819927, 1, 0, 0.9058824, 1,
0.9754499, -0.4970532, 2.408226, 1, 0, 0.9019608, 1,
1.001961, -0.452042, 2.005161, 1, 0, 0.8941177, 1,
1.010817, 0.3422358, 0.2049933, 1, 0, 0.8862745, 1,
1.023222, -0.3012998, 0.6743401, 1, 0, 0.8823529, 1,
1.034866, 0.4117578, 0.1098098, 1, 0, 0.8745098, 1,
1.035338, -2.030653, 2.1624, 1, 0, 0.8705882, 1,
1.037779, 1.705561, 2.177852, 1, 0, 0.8627451, 1,
1.041334, -0.0729674, 2.66784, 1, 0, 0.8588235, 1,
1.041644, 1.744396, 1.028361, 1, 0, 0.8509804, 1,
1.041809, -1.939158, 3.482875, 1, 0, 0.8470588, 1,
1.042495, -1.461044, 2.929432, 1, 0, 0.8392157, 1,
1.049217, -0.2818012, 1.087074, 1, 0, 0.8352941, 1,
1.059528, -1.49568, 2.786754, 1, 0, 0.827451, 1,
1.060331, 1.116359, 0.3970789, 1, 0, 0.8235294, 1,
1.066408, -0.4617942, 1.426772, 1, 0, 0.8156863, 1,
1.074031, 0.2601214, 1.309066, 1, 0, 0.8117647, 1,
1.083735, 1.272818, 2.110664, 1, 0, 0.8039216, 1,
1.084185, -0.6342705, 1.045401, 1, 0, 0.7960784, 1,
1.092215, 0.5022671, 1.683666, 1, 0, 0.7921569, 1,
1.09297, 1.653244, 0.6345229, 1, 0, 0.7843137, 1,
1.093326, 1.039897, 2.000514, 1, 0, 0.7803922, 1,
1.102827, 0.5510216, 1.699279, 1, 0, 0.772549, 1,
1.105312, 1.773963, -0.8462286, 1, 0, 0.7686275, 1,
1.106037, 2.425874, 1.046306, 1, 0, 0.7607843, 1,
1.11331, -1.418906, 4.354802, 1, 0, 0.7568628, 1,
1.118321, 1.658343, -0.1493193, 1, 0, 0.7490196, 1,
1.120565, 0.4344445, 0.4179446, 1, 0, 0.7450981, 1,
1.122629, 0.4192426, 0.2804399, 1, 0, 0.7372549, 1,
1.136709, -1.39397, 0.3942318, 1, 0, 0.7333333, 1,
1.152528, -0.8185617, 0.7865608, 1, 0, 0.7254902, 1,
1.157315, -0.4795043, 2.702668, 1, 0, 0.7215686, 1,
1.159753, -0.6487234, 0.5157861, 1, 0, 0.7137255, 1,
1.163442, -0.4015656, 3.058972, 1, 0, 0.7098039, 1,
1.163917, -0.1880616, 0.5227164, 1, 0, 0.7019608, 1,
1.167293, 0.270986, 1.458709, 1, 0, 0.6941177, 1,
1.17348, -0.07581896, 1.219469, 1, 0, 0.6901961, 1,
1.175383, -0.2983319, 1.593604, 1, 0, 0.682353, 1,
1.1825, -0.03115444, 1.036564, 1, 0, 0.6784314, 1,
1.183551, 1.272694, 0.4141577, 1, 0, 0.6705883, 1,
1.206529, -1.125489, 2.400491, 1, 0, 0.6666667, 1,
1.212618, -1.466924, 2.042672, 1, 0, 0.6588235, 1,
1.216726, 0.04469348, 1.480097, 1, 0, 0.654902, 1,
1.217332, 1.043496, 0.6300034, 1, 0, 0.6470588, 1,
1.222779, -0.1848138, 1.491917, 1, 0, 0.6431373, 1,
1.229957, 1.299122, -0.7646332, 1, 0, 0.6352941, 1,
1.24017, 0.4782951, 2.813648, 1, 0, 0.6313726, 1,
1.243651, 1.064974, 1.448039, 1, 0, 0.6235294, 1,
1.251519, -1.122461, 2.573719, 1, 0, 0.6196079, 1,
1.251545, -0.4676943, -0.2895549, 1, 0, 0.6117647, 1,
1.259039, -1.141611, 2.078662, 1, 0, 0.6078432, 1,
1.263894, -1.076007, 1.0798, 1, 0, 0.6, 1,
1.269649, 0.3612282, 1.213162, 1, 0, 0.5921569, 1,
1.274801, 0.4128102, 0.05162451, 1, 0, 0.5882353, 1,
1.276547, -0.7151182, 2.00401, 1, 0, 0.5803922, 1,
1.289097, -0.6767753, 0.7002386, 1, 0, 0.5764706, 1,
1.310627, 0.7593254, -0.5536309, 1, 0, 0.5686275, 1,
1.31254, -0.7779856, 1.859538, 1, 0, 0.5647059, 1,
1.33451, -1.741594, 3.707638, 1, 0, 0.5568628, 1,
1.343827, -0.8716068, 0.6431441, 1, 0, 0.5529412, 1,
1.353339, 0.1070699, 1.611571, 1, 0, 0.5450981, 1,
1.353651, 0.3446209, 1.538127, 1, 0, 0.5411765, 1,
1.357452, -0.1989778, 2.993363, 1, 0, 0.5333334, 1,
1.361759, 0.3030035, 1.147616, 1, 0, 0.5294118, 1,
1.378714, -1.068407, 1.977802, 1, 0, 0.5215687, 1,
1.385219, -0.04937445, 1.736054, 1, 0, 0.5176471, 1,
1.387073, -1.062669, 2.648704, 1, 0, 0.509804, 1,
1.387478, -1.653328, 2.15472, 1, 0, 0.5058824, 1,
1.390407, -0.1964672, 1.847308, 1, 0, 0.4980392, 1,
1.391198, 0.2722189, 1.571925, 1, 0, 0.4901961, 1,
1.40381, 0.8439039, 2.386996, 1, 0, 0.4862745, 1,
1.408791, -0.8578541, 0.4959041, 1, 0, 0.4784314, 1,
1.413557, 0.352497, 2.122478, 1, 0, 0.4745098, 1,
1.414687, -1.439507, 0.6533651, 1, 0, 0.4666667, 1,
1.417148, -0.6178961, 0.4844346, 1, 0, 0.4627451, 1,
1.418992, -1.09601, 1.105604, 1, 0, 0.454902, 1,
1.438246, -1.509074, 1.673751, 1, 0, 0.4509804, 1,
1.447447, 0.1372223, -0.2239282, 1, 0, 0.4431373, 1,
1.4482, -1.559215, 3.355002, 1, 0, 0.4392157, 1,
1.452221, -0.9111634, 2.294626, 1, 0, 0.4313726, 1,
1.457228, 0.5935206, 0.7537008, 1, 0, 0.427451, 1,
1.468008, 0.03101456, 2.715677, 1, 0, 0.4196078, 1,
1.475721, 0.3928327, 0.2199013, 1, 0, 0.4156863, 1,
1.480874, -0.1375681, 2.896518, 1, 0, 0.4078431, 1,
1.482641, -1.802765, 3.148571, 1, 0, 0.4039216, 1,
1.486455, 2.425684, 0.8106862, 1, 0, 0.3960784, 1,
1.487315, -0.06784618, 1.623788, 1, 0, 0.3882353, 1,
1.490727, -1.015768, 2.931559, 1, 0, 0.3843137, 1,
1.507949, -0.7573543, 2.637145, 1, 0, 0.3764706, 1,
1.513812, 0.03702181, 1.079118, 1, 0, 0.372549, 1,
1.529032, 0.04148041, 1.506392, 1, 0, 0.3647059, 1,
1.530814, -0.2685147, 1.814216, 1, 0, 0.3607843, 1,
1.533551, 0.7625705, 3.882467, 1, 0, 0.3529412, 1,
1.542673, -0.8404523, 2.333193, 1, 0, 0.3490196, 1,
1.543873, -0.08839364, 0.4999937, 1, 0, 0.3411765, 1,
1.547101, -0.9375849, 2.585295, 1, 0, 0.3372549, 1,
1.550738, -1.287758, 1.708979, 1, 0, 0.3294118, 1,
1.562784, 1.616294, 0.8066722, 1, 0, 0.3254902, 1,
1.567739, -0.9522392, 0.5712054, 1, 0, 0.3176471, 1,
1.570289, 1.110072, -0.1292839, 1, 0, 0.3137255, 1,
1.590481, -2.257891, 3.215076, 1, 0, 0.3058824, 1,
1.597708, -0.4533907, 2.403448, 1, 0, 0.2980392, 1,
1.60609, -1.519343, 1.110793, 1, 0, 0.2941177, 1,
1.622831, -0.2845672, 0.7589353, 1, 0, 0.2862745, 1,
1.639699, -1.288082, 1.362145, 1, 0, 0.282353, 1,
1.644384, 1.087248, -0.6075061, 1, 0, 0.2745098, 1,
1.648282, 0.6189465, 0.1953455, 1, 0, 0.2705882, 1,
1.664062, -0.3671767, 0.9146524, 1, 0, 0.2627451, 1,
1.671907, -0.8827752, 2.945762, 1, 0, 0.2588235, 1,
1.691941, 0.3132443, 2.73214, 1, 0, 0.2509804, 1,
1.694312, 1.002159, 0.2838812, 1, 0, 0.2470588, 1,
1.727833, 0.9496617, 1.88279, 1, 0, 0.2392157, 1,
1.733803, 0.3440297, -0.4814051, 1, 0, 0.2352941, 1,
1.750676, -0.81375, 3.509273, 1, 0, 0.227451, 1,
1.755444, 1.373921, 0.9697677, 1, 0, 0.2235294, 1,
1.765411, 0.07769252, 0.9768993, 1, 0, 0.2156863, 1,
1.793042, 0.3823611, 0.5334399, 1, 0, 0.2117647, 1,
1.800798, 0.2055331, 1.565438, 1, 0, 0.2039216, 1,
1.826207, 0.3092598, 1.476085, 1, 0, 0.1960784, 1,
1.845724, -0.5335955, 2.09746, 1, 0, 0.1921569, 1,
1.901551, -0.1804868, 0.8722591, 1, 0, 0.1843137, 1,
1.915963, -1.911255, 2.430779, 1, 0, 0.1803922, 1,
1.919588, 1.171492, 1.307301, 1, 0, 0.172549, 1,
1.919591, -0.904464, 4.80728, 1, 0, 0.1686275, 1,
1.921937, -0.2119879, 1.977775, 1, 0, 0.1607843, 1,
1.925766, -0.4081837, 0.822117, 1, 0, 0.1568628, 1,
1.950011, -0.3947312, 1.965606, 1, 0, 0.1490196, 1,
1.96272, 0.09109158, 2.886285, 1, 0, 0.145098, 1,
1.966694, -1.072189, 0.4616135, 1, 0, 0.1372549, 1,
1.972151, 1.114779, 0.7919747, 1, 0, 0.1333333, 1,
1.991157, 0.9650887, 1.118432, 1, 0, 0.1254902, 1,
2.018066, 2.071182, 0.5735018, 1, 0, 0.1215686, 1,
2.019723, 0.2033733, 0.2232237, 1, 0, 0.1137255, 1,
2.037271, 0.7619311, 1.027904, 1, 0, 0.1098039, 1,
2.058441, 1.140253, 3.346794, 1, 0, 0.1019608, 1,
2.069843, -0.867983, 2.161445, 1, 0, 0.09411765, 1,
2.070374, -0.9394214, 0.9059186, 1, 0, 0.09019608, 1,
2.099782, -0.7816252, 3.027935, 1, 0, 0.08235294, 1,
2.109197, 0.9624175, 2.911371, 1, 0, 0.07843138, 1,
2.109897, -0.2498324, 2.303072, 1, 0, 0.07058824, 1,
2.13289, -0.150454, 1.563533, 1, 0, 0.06666667, 1,
2.134499, -0.04996895, 0.9166183, 1, 0, 0.05882353, 1,
2.158321, -0.1913456, 1.796891, 1, 0, 0.05490196, 1,
2.339391, -0.1358116, 3.197317, 1, 0, 0.04705882, 1,
2.369344, 0.8551242, 1.292283, 1, 0, 0.04313726, 1,
2.371109, 1.93052, -0.00382468, 1, 0, 0.03529412, 1,
2.430686, 1.188035, 1.671758, 1, 0, 0.03137255, 1,
2.451248, -0.6174094, 1.633614, 1, 0, 0.02352941, 1,
2.517279, 0.2198168, 0.4424698, 1, 0, 0.01960784, 1,
2.689834, 1.169169, 0.904207, 1, 0, 0.01176471, 1,
3.023628, 0.4407447, 2.805009, 1, 0, 0.007843138, 1
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
0.03230715, -4.597592, -6.93222, 0, -0.5, 0.5, 0.5,
0.03230715, -4.597592, -6.93222, 1, -0.5, 0.5, 0.5,
0.03230715, -4.597592, -6.93222, 1, 1.5, 0.5, 0.5,
0.03230715, -4.597592, -6.93222, 0, 1.5, 0.5, 0.5
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
-3.973071, 0.2952017, -6.93222, 0, -0.5, 0.5, 0.5,
-3.973071, 0.2952017, -6.93222, 1, -0.5, 0.5, 0.5,
-3.973071, 0.2952017, -6.93222, 1, 1.5, 0.5, 0.5,
-3.973071, 0.2952017, -6.93222, 0, 1.5, 0.5, 0.5
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
-3.973071, -4.597592, -0.08873653, 0, -0.5, 0.5, 0.5,
-3.973071, -4.597592, -0.08873653, 1, -0.5, 0.5, 0.5,
-3.973071, -4.597592, -0.08873653, 1, 1.5, 0.5, 0.5,
-3.973071, -4.597592, -0.08873653, 0, 1.5, 0.5, 0.5
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
-2, -3.468486, -5.352954,
3, -3.468486, -5.352954,
-2, -3.468486, -5.352954,
-2, -3.65667, -5.616165,
-1, -3.468486, -5.352954,
-1, -3.65667, -5.616165,
0, -3.468486, -5.352954,
0, -3.65667, -5.616165,
1, -3.468486, -5.352954,
1, -3.65667, -5.616165,
2, -3.468486, -5.352954,
2, -3.65667, -5.616165,
3, -3.468486, -5.352954,
3, -3.65667, -5.616165
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
-2, -4.033039, -6.142587, 0, -0.5, 0.5, 0.5,
-2, -4.033039, -6.142587, 1, -0.5, 0.5, 0.5,
-2, -4.033039, -6.142587, 1, 1.5, 0.5, 0.5,
-2, -4.033039, -6.142587, 0, 1.5, 0.5, 0.5,
-1, -4.033039, -6.142587, 0, -0.5, 0.5, 0.5,
-1, -4.033039, -6.142587, 1, -0.5, 0.5, 0.5,
-1, -4.033039, -6.142587, 1, 1.5, 0.5, 0.5,
-1, -4.033039, -6.142587, 0, 1.5, 0.5, 0.5,
0, -4.033039, -6.142587, 0, -0.5, 0.5, 0.5,
0, -4.033039, -6.142587, 1, -0.5, 0.5, 0.5,
0, -4.033039, -6.142587, 1, 1.5, 0.5, 0.5,
0, -4.033039, -6.142587, 0, 1.5, 0.5, 0.5,
1, -4.033039, -6.142587, 0, -0.5, 0.5, 0.5,
1, -4.033039, -6.142587, 1, -0.5, 0.5, 0.5,
1, -4.033039, -6.142587, 1, 1.5, 0.5, 0.5,
1, -4.033039, -6.142587, 0, 1.5, 0.5, 0.5,
2, -4.033039, -6.142587, 0, -0.5, 0.5, 0.5,
2, -4.033039, -6.142587, 1, -0.5, 0.5, 0.5,
2, -4.033039, -6.142587, 1, 1.5, 0.5, 0.5,
2, -4.033039, -6.142587, 0, 1.5, 0.5, 0.5,
3, -4.033039, -6.142587, 0, -0.5, 0.5, 0.5,
3, -4.033039, -6.142587, 1, -0.5, 0.5, 0.5,
3, -4.033039, -6.142587, 1, 1.5, 0.5, 0.5,
3, -4.033039, -6.142587, 0, 1.5, 0.5, 0.5
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
-3.048753, -2, -5.352954,
-3.048753, 2, -5.352954,
-3.048753, -2, -5.352954,
-3.202806, -2, -5.616165,
-3.048753, 0, -5.352954,
-3.202806, 0, -5.616165,
-3.048753, 2, -5.352954,
-3.202806, 2, -5.616165
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
-3.510912, -2, -6.142587, 0, -0.5, 0.5, 0.5,
-3.510912, -2, -6.142587, 1, -0.5, 0.5, 0.5,
-3.510912, -2, -6.142587, 1, 1.5, 0.5, 0.5,
-3.510912, -2, -6.142587, 0, 1.5, 0.5, 0.5,
-3.510912, 0, -6.142587, 0, -0.5, 0.5, 0.5,
-3.510912, 0, -6.142587, 1, -0.5, 0.5, 0.5,
-3.510912, 0, -6.142587, 1, 1.5, 0.5, 0.5,
-3.510912, 0, -6.142587, 0, 1.5, 0.5, 0.5,
-3.510912, 2, -6.142587, 0, -0.5, 0.5, 0.5,
-3.510912, 2, -6.142587, 1, -0.5, 0.5, 0.5,
-3.510912, 2, -6.142587, 1, 1.5, 0.5, 0.5,
-3.510912, 2, -6.142587, 0, 1.5, 0.5, 0.5
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
-3.048753, -3.468486, -4,
-3.048753, -3.468486, 4,
-3.048753, -3.468486, -4,
-3.202806, -3.65667, -4,
-3.048753, -3.468486, -2,
-3.202806, -3.65667, -2,
-3.048753, -3.468486, 0,
-3.202806, -3.65667, 0,
-3.048753, -3.468486, 2,
-3.202806, -3.65667, 2,
-3.048753, -3.468486, 4,
-3.202806, -3.65667, 4
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
-3.510912, -4.033039, -4, 0, -0.5, 0.5, 0.5,
-3.510912, -4.033039, -4, 1, -0.5, 0.5, 0.5,
-3.510912, -4.033039, -4, 1, 1.5, 0.5, 0.5,
-3.510912, -4.033039, -4, 0, 1.5, 0.5, 0.5,
-3.510912, -4.033039, -2, 0, -0.5, 0.5, 0.5,
-3.510912, -4.033039, -2, 1, -0.5, 0.5, 0.5,
-3.510912, -4.033039, -2, 1, 1.5, 0.5, 0.5,
-3.510912, -4.033039, -2, 0, 1.5, 0.5, 0.5,
-3.510912, -4.033039, 0, 0, -0.5, 0.5, 0.5,
-3.510912, -4.033039, 0, 1, -0.5, 0.5, 0.5,
-3.510912, -4.033039, 0, 1, 1.5, 0.5, 0.5,
-3.510912, -4.033039, 0, 0, 1.5, 0.5, 0.5,
-3.510912, -4.033039, 2, 0, -0.5, 0.5, 0.5,
-3.510912, -4.033039, 2, 1, -0.5, 0.5, 0.5,
-3.510912, -4.033039, 2, 1, 1.5, 0.5, 0.5,
-3.510912, -4.033039, 2, 0, 1.5, 0.5, 0.5,
-3.510912, -4.033039, 4, 0, -0.5, 0.5, 0.5,
-3.510912, -4.033039, 4, 1, -0.5, 0.5, 0.5,
-3.510912, -4.033039, 4, 1, 1.5, 0.5, 0.5,
-3.510912, -4.033039, 4, 0, 1.5, 0.5, 0.5
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
-3.048753, -3.468486, -5.352954,
-3.048753, 4.058889, -5.352954,
-3.048753, -3.468486, 5.175481,
-3.048753, 4.058889, 5.175481,
-3.048753, -3.468486, -5.352954,
-3.048753, -3.468486, 5.175481,
-3.048753, 4.058889, -5.352954,
-3.048753, 4.058889, 5.175481,
-3.048753, -3.468486, -5.352954,
3.113367, -3.468486, -5.352954,
-3.048753, -3.468486, 5.175481,
3.113367, -3.468486, 5.175481,
-3.048753, 4.058889, -5.352954,
3.113367, 4.058889, -5.352954,
-3.048753, 4.058889, 5.175481,
3.113367, 4.058889, 5.175481,
3.113367, -3.468486, -5.352954,
3.113367, 4.058889, -5.352954,
3.113367, -3.468486, 5.175481,
3.113367, 4.058889, 5.175481,
3.113367, -3.468486, -5.352954,
3.113367, -3.468486, 5.175481,
3.113367, 4.058889, -5.352954,
3.113367, 4.058889, 5.175481
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
var radius = 7.654403;
var distance = 34.05531;
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
mvMatrix.translate( -0.03230715, -0.2952017, 0.08873653 );
mvMatrix.scale( 1.343059, 1.099466, 0.7860703 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05531);
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
oxadixyl<-read.table("oxadixyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxadixyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxadixyl' not found
```

```r
y<-oxadixyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxadixyl' not found
```

```r
z<-oxadixyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxadixyl' not found
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
-2.959013, -0.05715517, -0.3233304, 0, 0, 1, 1, 1,
-2.814105, -0.5115709, -2.173215, 1, 0, 0, 1, 1,
-2.78846, 0.6594244, -0.3991359, 1, 0, 0, 1, 1,
-2.768933, 1.001103, -1.956997, 1, 0, 0, 1, 1,
-2.748914, 1.252509, -1.271407, 1, 0, 0, 1, 1,
-2.73773, -0.5290006, -3.598026, 1, 0, 0, 1, 1,
-2.668679, 1.809976, 0.3992472, 0, 0, 0, 1, 1,
-2.661523, 0.4382252, -1.243739, 0, 0, 0, 1, 1,
-2.658121, 1.308239, -2.989582, 0, 0, 0, 1, 1,
-2.531513, -0.124875, -1.622257, 0, 0, 0, 1, 1,
-2.469676, 0.9891486, -2.49182, 0, 0, 0, 1, 1,
-2.438354, -1.319657, -3.054289, 0, 0, 0, 1, 1,
-2.387906, -0.2043179, -1.863131, 0, 0, 0, 1, 1,
-2.370038, -0.3174099, -0.3190718, 1, 1, 1, 1, 1,
-2.34156, 0.1478354, -3.239427, 1, 1, 1, 1, 1,
-2.280466, 0.7074931, -1.285236, 1, 1, 1, 1, 1,
-2.27958, -1.477619, -1.926937, 1, 1, 1, 1, 1,
-2.225233, -0.2320489, -1.650326, 1, 1, 1, 1, 1,
-2.214531, -1.18212, -2.192648, 1, 1, 1, 1, 1,
-2.202636, 0.8809102, -0.5778431, 1, 1, 1, 1, 1,
-2.17326, 2.346583, -1.672332, 1, 1, 1, 1, 1,
-2.126851, 0.04249766, -1.76617, 1, 1, 1, 1, 1,
-2.103818, 1.849029, 1.197205, 1, 1, 1, 1, 1,
-2.064723, -1.618328, -2.254477, 1, 1, 1, 1, 1,
-2.045387, -1.030321, -1.342569, 1, 1, 1, 1, 1,
-2.036894, -0.09671152, -1.827528, 1, 1, 1, 1, 1,
-2.021648, -0.5671846, -1.41918, 1, 1, 1, 1, 1,
-2.014139, 1.753266, -0.92519, 1, 1, 1, 1, 1,
-2.003579, -1.982574, -3.305364, 0, 0, 1, 1, 1,
-1.980493, -0.1363288, -2.380695, 1, 0, 0, 1, 1,
-1.977938, -0.8801257, -1.75947, 1, 0, 0, 1, 1,
-1.974365, -0.9040205, -1.223282, 1, 0, 0, 1, 1,
-1.931848, -0.4465475, -2.095229, 1, 0, 0, 1, 1,
-1.930893, -1.902975, -2.945324, 1, 0, 0, 1, 1,
-1.854578, 1.475264, 1.211465, 0, 0, 0, 1, 1,
-1.82936, -2.171096, -1.245367, 0, 0, 0, 1, 1,
-1.813887, -0.3133816, -2.753126, 0, 0, 0, 1, 1,
-1.796237, -0.4309479, -1.051921, 0, 0, 0, 1, 1,
-1.786655, -0.5077838, -1.81117, 0, 0, 0, 1, 1,
-1.781985, -0.4008914, -1.09358, 0, 0, 0, 1, 1,
-1.772369, -0.1054852, -0.2414418, 0, 0, 0, 1, 1,
-1.770613, -1.970093, -3.711526, 1, 1, 1, 1, 1,
-1.75289, 0.8451183, -0.6225111, 1, 1, 1, 1, 1,
-1.75075, 1.620453, -1.295901, 1, 1, 1, 1, 1,
-1.745624, -1.302356, -0.9502895, 1, 1, 1, 1, 1,
-1.728938, -0.9693977, -1.768388, 1, 1, 1, 1, 1,
-1.716365, -1.435673, -2.199166, 1, 1, 1, 1, 1,
-1.710673, 0.8998964, 0.6130343, 1, 1, 1, 1, 1,
-1.684567, 1.303807, -1.849106, 1, 1, 1, 1, 1,
-1.674877, -0.556577, -0.7450319, 1, 1, 1, 1, 1,
-1.661436, -0.8971496, -1.38207, 1, 1, 1, 1, 1,
-1.6391, -1.083309, -3.617415, 1, 1, 1, 1, 1,
-1.637468, -1.484194, -1.946048, 1, 1, 1, 1, 1,
-1.630929, -0.6550862, -2.00675, 1, 1, 1, 1, 1,
-1.629597, -0.0466676, -1.35789, 1, 1, 1, 1, 1,
-1.625065, 1.186314, -0.1659929, 1, 1, 1, 1, 1,
-1.615022, 0.2401448, -1.244874, 0, 0, 1, 1, 1,
-1.60464, 0.6634002, 0.3045924, 1, 0, 0, 1, 1,
-1.580968, -0.3080398, -2.188612, 1, 0, 0, 1, 1,
-1.579366, 2.449562, -0.6364564, 1, 0, 0, 1, 1,
-1.5569, 0.6641346, -1.642251, 1, 0, 0, 1, 1,
-1.555584, -1.604414, -4.449066, 1, 0, 0, 1, 1,
-1.551162, -1.042641, -2.46989, 0, 0, 0, 1, 1,
-1.550269, -0.04066304, -3.005925, 0, 0, 0, 1, 1,
-1.530534, 0.1796426, -1.056767, 0, 0, 0, 1, 1,
-1.529209, 1.388744, -0.01309347, 0, 0, 0, 1, 1,
-1.519903, -0.2588344, -2.142973, 0, 0, 0, 1, 1,
-1.473866, 1.290103, -1.286649, 0, 0, 0, 1, 1,
-1.470364, 0.05054844, -2.071971, 0, 0, 0, 1, 1,
-1.463706, -0.1055744, -1.252199, 1, 1, 1, 1, 1,
-1.437339, 0.2848694, -0.6640318, 1, 1, 1, 1, 1,
-1.4363, -0.08494195, -0.7467918, 1, 1, 1, 1, 1,
-1.428854, -0.06170679, -2.045727, 1, 1, 1, 1, 1,
-1.427777, 0.6919118, -1.51342, 1, 1, 1, 1, 1,
-1.417025, 0.2313406, -3.195534, 1, 1, 1, 1, 1,
-1.409956, -0.8029947, -2.030586, 1, 1, 1, 1, 1,
-1.407049, -0.9226199, -1.79447, 1, 1, 1, 1, 1,
-1.395535, 0.761566, -2.405194, 1, 1, 1, 1, 1,
-1.383964, -1.332116, -1.67939, 1, 1, 1, 1, 1,
-1.383371, -0.3183808, -2.829346, 1, 1, 1, 1, 1,
-1.383291, 0.6620213, -0.7205136, 1, 1, 1, 1, 1,
-1.373112, 0.7992738, -0.1005209, 1, 1, 1, 1, 1,
-1.371153, -0.1658675, -1.192078, 1, 1, 1, 1, 1,
-1.359445, 0.3592989, -1.842297, 1, 1, 1, 1, 1,
-1.353838, -0.4975621, -1.558121, 0, 0, 1, 1, 1,
-1.349406, 1.360292, -1.524467, 1, 0, 0, 1, 1,
-1.34937, 0.5325872, -1.667625, 1, 0, 0, 1, 1,
-1.344051, 1.081057, -1.208959, 1, 0, 0, 1, 1,
-1.339139, 1.125047, -1.835007, 1, 0, 0, 1, 1,
-1.332478, 1.225009, -1.95366, 1, 0, 0, 1, 1,
-1.331589, 1.273022, -0.6957504, 0, 0, 0, 1, 1,
-1.328769, 1.918521, -0.1088383, 0, 0, 0, 1, 1,
-1.325014, -0.9632833, -2.207817, 0, 0, 0, 1, 1,
-1.322659, 0.203385, -2.144013, 0, 0, 0, 1, 1,
-1.299235, -1.567841, -3.613471, 0, 0, 0, 1, 1,
-1.298195, -0.4582733, -1.134421, 0, 0, 0, 1, 1,
-1.290934, 0.1113768, -0.7353673, 0, 0, 0, 1, 1,
-1.285992, -0.229034, -2.896271, 1, 1, 1, 1, 1,
-1.284091, 0.3422996, -1.65003, 1, 1, 1, 1, 1,
-1.282814, -0.889358, -1.268303, 1, 1, 1, 1, 1,
-1.282133, -0.8314561, -2.63263, 1, 1, 1, 1, 1,
-1.277976, -0.08848618, -1.001948, 1, 1, 1, 1, 1,
-1.2761, 0.830419, -1.854012, 1, 1, 1, 1, 1,
-1.26843, -0.9511397, -2.31016, 1, 1, 1, 1, 1,
-1.268093, -0.1220987, -2.549227, 1, 1, 1, 1, 1,
-1.265835, -0.62279, -1.557747, 1, 1, 1, 1, 1,
-1.261979, -0.1512384, -1.703937, 1, 1, 1, 1, 1,
-1.256003, 1.588067, -1.999768, 1, 1, 1, 1, 1,
-1.254585, 1.365476, 0.2433834, 1, 1, 1, 1, 1,
-1.242061, 0.3705168, -0.9127799, 1, 1, 1, 1, 1,
-1.233788, -0.2724229, -2.689983, 1, 1, 1, 1, 1,
-1.231126, -0.8007197, 0.5861346, 1, 1, 1, 1, 1,
-1.228288, -0.03625757, -1.85428, 0, 0, 1, 1, 1,
-1.22604, -1.009995, -2.484003, 1, 0, 0, 1, 1,
-1.224669, 0.2429658, -2.068405, 1, 0, 0, 1, 1,
-1.218559, -1.87285, -1.329035, 1, 0, 0, 1, 1,
-1.215616, -0.5605096, -2.092083, 1, 0, 0, 1, 1,
-1.213089, -1.231367, -2.645135, 1, 0, 0, 1, 1,
-1.208007, -0.849565, -3.670466, 0, 0, 0, 1, 1,
-1.207052, -2.15019, -1.105756, 0, 0, 0, 1, 1,
-1.203882, 0.8850715, -0.2581724, 0, 0, 0, 1, 1,
-1.203029, -0.1319777, -2.024418, 0, 0, 0, 1, 1,
-1.202157, -0.7387163, -0.2427516, 0, 0, 0, 1, 1,
-1.200687, 0.1429121, -4.436598, 0, 0, 0, 1, 1,
-1.193493, -0.01253632, -1.443025, 0, 0, 0, 1, 1,
-1.192904, -1.332674, -2.584849, 1, 1, 1, 1, 1,
-1.18918, -0.8974156, -1.594299, 1, 1, 1, 1, 1,
-1.184958, 0.9737239, -1.393436, 1, 1, 1, 1, 1,
-1.180208, -0.3927101, 0.9229747, 1, 1, 1, 1, 1,
-1.170733, 0.5985988, -2.070141, 1, 1, 1, 1, 1,
-1.170119, -0.8151276, -3.650293, 1, 1, 1, 1, 1,
-1.158714, 1.442096, 1.029706, 1, 1, 1, 1, 1,
-1.155208, 1.274083, -0.6466327, 1, 1, 1, 1, 1,
-1.151329, -0.03662847, -3.081103, 1, 1, 1, 1, 1,
-1.145991, -0.2304963, -1.405757, 1, 1, 1, 1, 1,
-1.142922, 0.08952833, -0.1724452, 1, 1, 1, 1, 1,
-1.13284, 0.6004559, -2.093128, 1, 1, 1, 1, 1,
-1.119163, 0.6372868, 0.06866083, 1, 1, 1, 1, 1,
-1.113816, -0.4399351, -1.411783, 1, 1, 1, 1, 1,
-1.113699, -0.9757265, -2.957653, 1, 1, 1, 1, 1,
-1.109783, 0.6363806, -0.009221701, 0, 0, 1, 1, 1,
-1.108389, -1.724081, -3.309495, 1, 0, 0, 1, 1,
-1.107392, -0.1648894, -2.016506, 1, 0, 0, 1, 1,
-1.105556, 1.015485, -0.7582558, 1, 0, 0, 1, 1,
-1.101384, -1.585872, -2.642627, 1, 0, 0, 1, 1,
-1.090418, 1.016401, -1.241649, 1, 0, 0, 1, 1,
-1.087526, -0.4746308, -2.092782, 0, 0, 0, 1, 1,
-1.083188, 0.8653653, -1.252678, 0, 0, 0, 1, 1,
-1.082902, 1.764578, 0.5786875, 0, 0, 0, 1, 1,
-1.082051, 0.5239937, -0.1177526, 0, 0, 0, 1, 1,
-1.070029, -0.7036542, -1.831405, 0, 0, 0, 1, 1,
-1.069771, -0.00458558, -1.494109, 0, 0, 0, 1, 1,
-1.068334, 1.771816, -0.7632996, 0, 0, 0, 1, 1,
-1.064065, -0.9173601, -1.373486, 1, 1, 1, 1, 1,
-1.060038, -0.05323192, -1.845476, 1, 1, 1, 1, 1,
-1.047907, 0.6561798, -0.8622298, 1, 1, 1, 1, 1,
-1.045485, -1.292065, -1.313448, 1, 1, 1, 1, 1,
-1.045123, -0.3954755, -1.94401, 1, 1, 1, 1, 1,
-1.044463, 1.434241, -1.987242, 1, 1, 1, 1, 1,
-1.04341, 1.35786, -0.3626277, 1, 1, 1, 1, 1,
-1.037645, 0.753038, -1.896914, 1, 1, 1, 1, 1,
-1.037151, 0.7561412, -1.724886, 1, 1, 1, 1, 1,
-1.028698, -1.863367, -1.81355, 1, 1, 1, 1, 1,
-1.021358, 0.6459722, -0.6540598, 1, 1, 1, 1, 1,
-1.019863, -1.38547, -2.609017, 1, 1, 1, 1, 1,
-1.014711, -0.5729488, -2.030016, 1, 1, 1, 1, 1,
-1.014401, 1.564321, 1.151166, 1, 1, 1, 1, 1,
-1.010405, -0.8463248, -2.35126, 1, 1, 1, 1, 1,
-1.008996, 0.8137031, 0.130875, 0, 0, 1, 1, 1,
-1.001105, 0.6307905, 0.5178192, 1, 0, 0, 1, 1,
-0.9685965, -1.376523, -1.362749, 1, 0, 0, 1, 1,
-0.9682235, 0.7504247, -0.1257604, 1, 0, 0, 1, 1,
-0.9646368, 0.2294432, 1.252821, 1, 0, 0, 1, 1,
-0.9558752, 0.2286556, -0.3908735, 1, 0, 0, 1, 1,
-0.9541367, 0.6152817, -0.3997099, 0, 0, 0, 1, 1,
-0.9469935, -0.1041836, -2.357342, 0, 0, 0, 1, 1,
-0.9463107, -0.711171, -1.862673, 0, 0, 0, 1, 1,
-0.9455889, -1.171052, -3.258358, 0, 0, 0, 1, 1,
-0.9453024, -0.9344682, -1.80222, 0, 0, 0, 1, 1,
-0.9370829, -1.504052, -1.605955, 0, 0, 0, 1, 1,
-0.9323766, 1.11099, -1.851648, 0, 0, 0, 1, 1,
-0.9271763, -0.8451628, -2.655089, 1, 1, 1, 1, 1,
-0.9261667, -0.2024374, -0.2746734, 1, 1, 1, 1, 1,
-0.9254546, -0.2611464, -2.413889, 1, 1, 1, 1, 1,
-0.924646, -1.197947, -2.252961, 1, 1, 1, 1, 1,
-0.9115923, -0.5133331, -0.9161785, 1, 1, 1, 1, 1,
-0.9075196, 0.1042682, -0.4250635, 1, 1, 1, 1, 1,
-0.9066913, 0.7645054, 0.917066, 1, 1, 1, 1, 1,
-0.9045576, -0.2541988, -1.388413, 1, 1, 1, 1, 1,
-0.90386, 2.099164, 1.003846, 1, 1, 1, 1, 1,
-0.8972782, 0.1476955, -3.119442, 1, 1, 1, 1, 1,
-0.8891823, -1.876394, -1.41778, 1, 1, 1, 1, 1,
-0.8765051, -1.531763, -2.377214, 1, 1, 1, 1, 1,
-0.8759171, -0.2975466, -2.065271, 1, 1, 1, 1, 1,
-0.8741888, 0.454105, -1.475324, 1, 1, 1, 1, 1,
-0.8693533, -2.995183, -1.396012, 1, 1, 1, 1, 1,
-0.8637762, 1.023565, -1.286971, 0, 0, 1, 1, 1,
-0.8608044, -1.414487, -3.005278, 1, 0, 0, 1, 1,
-0.8582581, -1.43117, -2.914201, 1, 0, 0, 1, 1,
-0.8543487, 0.4598895, 0.2169866, 1, 0, 0, 1, 1,
-0.8519642, 0.771895, 0.1396046, 1, 0, 0, 1, 1,
-0.8504092, -0.3971386, -1.993776, 1, 0, 0, 1, 1,
-0.8469476, 0.2973403, -0.01530924, 0, 0, 0, 1, 1,
-0.8461523, 0.3867867, -0.6493204, 0, 0, 0, 1, 1,
-0.8431688, 0.9028899, -0.04117592, 0, 0, 0, 1, 1,
-0.8429916, -2.219697, -1.586297, 0, 0, 0, 1, 1,
-0.8419139, 0.4482904, -1.593031, 0, 0, 0, 1, 1,
-0.8366498, 0.3069354, -2.847345, 0, 0, 0, 1, 1,
-0.8330197, 2.174532, -1.394596, 0, 0, 0, 1, 1,
-0.8320259, 0.9854183, -0.6070742, 1, 1, 1, 1, 1,
-0.8286184, 2.18567, -0.2280435, 1, 1, 1, 1, 1,
-0.8286176, -1.062699, -3.014764, 1, 1, 1, 1, 1,
-0.8264275, 0.7602599, -1.452344, 1, 1, 1, 1, 1,
-0.826321, -0.1044131, -2.157182, 1, 1, 1, 1, 1,
-0.8181429, -1.676829, -3.466328, 1, 1, 1, 1, 1,
-0.8175371, 1.247127, -0.4984676, 1, 1, 1, 1, 1,
-0.814815, -0.2022732, -2.51771, 1, 1, 1, 1, 1,
-0.8119156, -0.1202884, -2.66176, 1, 1, 1, 1, 1,
-0.8116304, 0.6527027, -3.111916, 1, 1, 1, 1, 1,
-0.8108735, 0.2730245, -2.258165, 1, 1, 1, 1, 1,
-0.8063388, 0.3306619, -1.704635, 1, 1, 1, 1, 1,
-0.8050341, -0.2296241, -1.359886, 1, 1, 1, 1, 1,
-0.8043694, 0.7163117, -0.7379261, 1, 1, 1, 1, 1,
-0.8024076, 1.032865, 0.07381398, 1, 1, 1, 1, 1,
-0.7993801, 0.3138466, 1.371199, 0, 0, 1, 1, 1,
-0.7873195, 0.07629047, 0.677723, 1, 0, 0, 1, 1,
-0.7855187, -0.4630684, -2.047513, 1, 0, 0, 1, 1,
-0.7847484, -1.992607, -4.031952, 1, 0, 0, 1, 1,
-0.7738327, 0.1747535, -1.377647, 1, 0, 0, 1, 1,
-0.7609814, -0.1359069, -0.9587857, 1, 0, 0, 1, 1,
-0.7593389, 1.395251, -1.06285, 0, 0, 0, 1, 1,
-0.7555242, -1.537624, -0.7895651, 0, 0, 0, 1, 1,
-0.7542913, -1.157512, -3.211127, 0, 0, 0, 1, 1,
-0.7533613, -1.791986, -3.099837, 0, 0, 0, 1, 1,
-0.750607, 0.3547037, -0.3709209, 0, 0, 0, 1, 1,
-0.7359324, 0.4638464, 0.1365784, 0, 0, 0, 1, 1,
-0.735172, 0.636688, -2.586499, 0, 0, 0, 1, 1,
-0.7336442, -2.118406, -4.795216, 1, 1, 1, 1, 1,
-0.7268754, -1.39605, -1.898007, 1, 1, 1, 1, 1,
-0.7140312, -0.7748563, -2.424133, 1, 1, 1, 1, 1,
-0.7135026, 0.1627305, -1.05905, 1, 1, 1, 1, 1,
-0.7105529, -0.6555048, -2.167487, 1, 1, 1, 1, 1,
-0.7104765, 0.2303704, -3.173775, 1, 1, 1, 1, 1,
-0.7081524, 0.2740069, -1.710628, 1, 1, 1, 1, 1,
-0.707587, -0.595951, -1.713014, 1, 1, 1, 1, 1,
-0.6924354, -1.136684, -2.335189, 1, 1, 1, 1, 1,
-0.6917831, 0.8400105, -0.7520953, 1, 1, 1, 1, 1,
-0.6905001, 0.3919813, -1.066645, 1, 1, 1, 1, 1,
-0.6870267, -0.34328, -0.5757952, 1, 1, 1, 1, 1,
-0.6861848, -0.8622698, -3.358245, 1, 1, 1, 1, 1,
-0.6829445, -0.6177236, -1.989473, 1, 1, 1, 1, 1,
-0.6777743, -0.120771, -1.184831, 1, 1, 1, 1, 1,
-0.6753296, 1.475587, -0.8893602, 0, 0, 1, 1, 1,
-0.6746917, -0.09459688, -1.719389, 1, 0, 0, 1, 1,
-0.6712333, -0.2850301, -1.9252, 1, 0, 0, 1, 1,
-0.6694431, 0.5343021, -0.5006704, 1, 0, 0, 1, 1,
-0.6649929, -0.6104671, -0.9965139, 1, 0, 0, 1, 1,
-0.6629586, -0.03502172, -1.158092, 1, 0, 0, 1, 1,
-0.6612487, -0.0267657, -2.199644, 0, 0, 0, 1, 1,
-0.6602836, 0.07630434, -3.641324, 0, 0, 0, 1, 1,
-0.6552613, 0.6628075, -3.321384, 0, 0, 0, 1, 1,
-0.6538355, -0.1944889, -0.8916362, 0, 0, 0, 1, 1,
-0.6514402, 0.987496, 0.3544052, 0, 0, 0, 1, 1,
-0.635173, 0.439638, -1.53284, 0, 0, 0, 1, 1,
-0.6327661, -0.2130672, -1.278783, 0, 0, 0, 1, 1,
-0.6294333, -0.5070773, -1.747244, 1, 1, 1, 1, 1,
-0.6261014, 0.4553269, -2.220235, 1, 1, 1, 1, 1,
-0.6216058, 0.07009613, -1.111397, 1, 1, 1, 1, 1,
-0.6199524, -0.7969698, -3.093516, 1, 1, 1, 1, 1,
-0.6187254, -1.045802, -2.214398, 1, 1, 1, 1, 1,
-0.618313, 0.9631351, -0.8920931, 1, 1, 1, 1, 1,
-0.6093553, -0.3015083, -3.526073, 1, 1, 1, 1, 1,
-0.6079491, -0.7768401, -2.060463, 1, 1, 1, 1, 1,
-0.6030314, 0.2988323, -1.91118, 1, 1, 1, 1, 1,
-0.593676, -0.04509298, -1.668339, 1, 1, 1, 1, 1,
-0.5900663, -0.5557903, -2.894402, 1, 1, 1, 1, 1,
-0.5861352, -0.2884575, -1.639475, 1, 1, 1, 1, 1,
-0.5858665, 1.443054, -0.7795837, 1, 1, 1, 1, 1,
-0.5768406, 0.08606155, -2.379214, 1, 1, 1, 1, 1,
-0.5697067, 0.3137589, -1.56981, 1, 1, 1, 1, 1,
-0.5659703, -0.426908, -3.167333, 0, 0, 1, 1, 1,
-0.5630828, -0.5903429, -1.682483, 1, 0, 0, 1, 1,
-0.5621762, 0.101049, -0.7534078, 1, 0, 0, 1, 1,
-0.5601938, -1.947348, -2.608475, 1, 0, 0, 1, 1,
-0.5566642, 0.3982645, -0.9513889, 1, 0, 0, 1, 1,
-0.5560116, 0.02314226, -0.9579081, 1, 0, 0, 1, 1,
-0.5557117, 0.2328066, -1.184247, 0, 0, 0, 1, 1,
-0.5473285, 0.5528406, 0.289719, 0, 0, 0, 1, 1,
-0.5456492, -1.220056, -3.874618, 0, 0, 0, 1, 1,
-0.540756, 0.7917175, -1.035933, 0, 0, 0, 1, 1,
-0.5301082, 1.652464, -0.1415446, 0, 0, 0, 1, 1,
-0.5175189, -0.6358114, -1.499922, 0, 0, 0, 1, 1,
-0.5158104, -0.3791644, -3.43988, 0, 0, 0, 1, 1,
-0.5147974, -2.232325, -3.230866, 1, 1, 1, 1, 1,
-0.5078681, -1.680242, -1.463873, 1, 1, 1, 1, 1,
-0.50137, -2.745963, -4.060855, 1, 1, 1, 1, 1,
-0.5009121, -0.2232809, -2.587192, 1, 1, 1, 1, 1,
-0.5004074, -2.040528, -2.787312, 1, 1, 1, 1, 1,
-0.4998452, 0.5554091, -3.143963, 1, 1, 1, 1, 1,
-0.4948935, -2.013075, -2.428953, 1, 1, 1, 1, 1,
-0.4944239, 0.5141113, 0.5307961, 1, 1, 1, 1, 1,
-0.4901245, -0.9779797, -2.32495, 1, 1, 1, 1, 1,
-0.4893935, -3.06519, -3.589525, 1, 1, 1, 1, 1,
-0.4879746, 0.3491895, -0.8045651, 1, 1, 1, 1, 1,
-0.4863918, -0.2853997, -2.09828, 1, 1, 1, 1, 1,
-0.4785143, 1.690425, -1.146161, 1, 1, 1, 1, 1,
-0.4779895, -0.2967548, -3.26872, 1, 1, 1, 1, 1,
-0.4773006, 0.5855171, -2.959179, 1, 1, 1, 1, 1,
-0.4754435, 1.207391, -0.1817099, 0, 0, 1, 1, 1,
-0.4745312, 1.417527, 1.112867, 1, 0, 0, 1, 1,
-0.4714816, -0.9460523, -3.251853, 1, 0, 0, 1, 1,
-0.4699664, 0.05152651, -2.213099, 1, 0, 0, 1, 1,
-0.4674088, 0.1886704, 0.1308894, 1, 0, 0, 1, 1,
-0.4596896, -0.8581159, -3.01825, 1, 0, 0, 1, 1,
-0.4584923, 0.1285412, -1.23412, 0, 0, 0, 1, 1,
-0.4551796, 0.2895602, -1.364438, 0, 0, 0, 1, 1,
-0.4541085, -1.305314, -1.933143, 0, 0, 0, 1, 1,
-0.4534537, 1.697029, 0.8273463, 0, 0, 0, 1, 1,
-0.4493409, -1.84339, -2.889032, 0, 0, 0, 1, 1,
-0.4462397, -0.1057564, -1.38252, 0, 0, 0, 1, 1,
-0.4458846, -0.3848571, -2.482444, 0, 0, 0, 1, 1,
-0.4416843, -0.3314471, -2.6143, 1, 1, 1, 1, 1,
-0.439096, -0.2137504, -2.217293, 1, 1, 1, 1, 1,
-0.4315008, -0.168553, -1.576837, 1, 1, 1, 1, 1,
-0.4303846, 0.157783, -1.903613, 1, 1, 1, 1, 1,
-0.4297587, 0.3051335, -1.539894, 1, 1, 1, 1, 1,
-0.4295978, 0.7108466, -1.882906, 1, 1, 1, 1, 1,
-0.4280184, 1.953545, 0.06301586, 1, 1, 1, 1, 1,
-0.422325, -2.041562, -2.958384, 1, 1, 1, 1, 1,
-0.4186115, 0.7140976, -0.4685796, 1, 1, 1, 1, 1,
-0.416986, 1.300306, -0.6674166, 1, 1, 1, 1, 1,
-0.4167238, 0.3820271, -1.722799, 1, 1, 1, 1, 1,
-0.412759, 0.2038058, -0.5090848, 1, 1, 1, 1, 1,
-0.4124904, -1.053467, -3.047189, 1, 1, 1, 1, 1,
-0.411909, -1.034272, -3.815498, 1, 1, 1, 1, 1,
-0.407236, 0.7197219, -1.559708, 1, 1, 1, 1, 1,
-0.4064315, -2.507982, -2.897553, 0, 0, 1, 1, 1,
-0.4057985, 0.327478, 1.222044, 1, 0, 0, 1, 1,
-0.4044866, -0.8184078, -3.133766, 1, 0, 0, 1, 1,
-0.404246, -1.216432, -2.549247, 1, 0, 0, 1, 1,
-0.4028209, -1.23137, -1.940502, 1, 0, 0, 1, 1,
-0.4009424, -1.388968, -3.696053, 1, 0, 0, 1, 1,
-0.3908642, -1.204607, -0.6895646, 0, 0, 0, 1, 1,
-0.3886853, 0.1924272, -1.556657, 0, 0, 0, 1, 1,
-0.3831684, 0.5883366, -0.348018, 0, 0, 0, 1, 1,
-0.3794991, 0.2247474, -0.4900384, 0, 0, 0, 1, 1,
-0.3779303, 0.2347596, -1.552574, 0, 0, 0, 1, 1,
-0.3770306, 0.09441824, -1.670948, 0, 0, 0, 1, 1,
-0.3751241, -2.366135, -2.702607, 0, 0, 0, 1, 1,
-0.3731778, -0.2255153, -3.265841, 1, 1, 1, 1, 1,
-0.3719546, -1.269676, -3.565487, 1, 1, 1, 1, 1,
-0.3661799, 0.8055539, -0.2791537, 1, 1, 1, 1, 1,
-0.3652124, -0.2429207, -1.644691, 1, 1, 1, 1, 1,
-0.364482, 1.032984, -0.5704137, 1, 1, 1, 1, 1,
-0.3558069, 0.5035773, -0.08081468, 1, 1, 1, 1, 1,
-0.3550086, -0.1313197, -1.947596, 1, 1, 1, 1, 1,
-0.3546085, -1.666101, -1.290079, 1, 1, 1, 1, 1,
-0.3527464, -0.3539622, -1.257907, 1, 1, 1, 1, 1,
-0.3422838, 3.949267, -0.06597199, 1, 1, 1, 1, 1,
-0.3415922, 2.253739, -0.3937759, 1, 1, 1, 1, 1,
-0.3413833, 0.8195821, 1.274686, 1, 1, 1, 1, 1,
-0.3390406, -1.089428, -2.536977, 1, 1, 1, 1, 1,
-0.3376407, -0.6779313, -3.261774, 1, 1, 1, 1, 1,
-0.3370389, -1.944352, -2.31212, 1, 1, 1, 1, 1,
-0.3337165, -0.2161639, 0.5510406, 0, 0, 1, 1, 1,
-0.3328766, -1.622583, -1.399807, 1, 0, 0, 1, 1,
-0.330998, 0.4121371, -2.154796, 1, 0, 0, 1, 1,
-0.3293097, 0.004244848, -2.731272, 1, 0, 0, 1, 1,
-0.3281589, 1.283627, -0.3534097, 1, 0, 0, 1, 1,
-0.3262895, -8.125849e-06, -1.640289, 1, 0, 0, 1, 1,
-0.3229096, 1.067356, 1.452646, 0, 0, 0, 1, 1,
-0.3208996, 0.727416, -0.1036373, 0, 0, 0, 1, 1,
-0.3203141, 0.1832344, -0.3099867, 0, 0, 0, 1, 1,
-0.3198631, -0.6183453, -2.124173, 0, 0, 0, 1, 1,
-0.3181305, 0.04870845, -1.40313, 0, 0, 0, 1, 1,
-0.3133228, 1.191939, -1.745308, 0, 0, 0, 1, 1,
-0.3113013, 0.4519146, -0.7454651, 0, 0, 0, 1, 1,
-0.3084133, 0.9447669, 0.08047481, 1, 1, 1, 1, 1,
-0.3066444, 1.39248, -0.6284963, 1, 1, 1, 1, 1,
-0.300523, 1.343786, 1.315659, 1, 1, 1, 1, 1,
-0.3004032, -0.04418108, -1.277715, 1, 1, 1, 1, 1,
-0.2994004, 1.489102, -0.1514959, 1, 1, 1, 1, 1,
-0.2905341, 0.07659065, -1.417659, 1, 1, 1, 1, 1,
-0.2895092, 0.09015636, 0.1407764, 1, 1, 1, 1, 1,
-0.2883927, -0.08962641, -2.273588, 1, 1, 1, 1, 1,
-0.2716935, 0.6828363, 0.5602964, 1, 1, 1, 1, 1,
-0.2703179, 1.988923, 1.306898, 1, 1, 1, 1, 1,
-0.2656046, -0.9045637, -1.660205, 1, 1, 1, 1, 1,
-0.2613001, 1.40594, -2.162314, 1, 1, 1, 1, 1,
-0.2610138, 1.276443, -0.4362043, 1, 1, 1, 1, 1,
-0.2593428, 0.3993656, 0.01592722, 1, 1, 1, 1, 1,
-0.2571297, 1.048159, 0.5935327, 1, 1, 1, 1, 1,
-0.2566757, 0.1483726, -0.8771532, 0, 0, 1, 1, 1,
-0.2550192, -0.03725581, -0.9045933, 1, 0, 0, 1, 1,
-0.2537588, 1.453685, -0.808476, 1, 0, 0, 1, 1,
-0.2520247, -0.8360307, -2.898992, 1, 0, 0, 1, 1,
-0.2442594, -2.48014, -3.204551, 1, 0, 0, 1, 1,
-0.2435602, -0.71479, -2.905777, 1, 0, 0, 1, 1,
-0.2429139, -0.8933969, -3.860993, 0, 0, 0, 1, 1,
-0.2425522, 0.07934952, -1.158854, 0, 0, 0, 1, 1,
-0.2401603, -0.2000433, -3.058513, 0, 0, 0, 1, 1,
-0.2366314, -1.966583, -1.758441, 0, 0, 0, 1, 1,
-0.2352203, -1.021953, -2.148663, 0, 0, 0, 1, 1,
-0.2338851, 0.5726935, -0.3279615, 0, 0, 0, 1, 1,
-0.2306538, 0.3405989, -1.419091, 0, 0, 0, 1, 1,
-0.2303341, 0.5882276, -0.2131754, 1, 1, 1, 1, 1,
-0.2237093, -0.3706571, -2.726724, 1, 1, 1, 1, 1,
-0.2216272, -1.185487, -2.3498, 1, 1, 1, 1, 1,
-0.2202257, 1.725508, 0.1133268, 1, 1, 1, 1, 1,
-0.21813, 0.2834364, -0.3099477, 1, 1, 1, 1, 1,
-0.2169156, 1.152169, -0.05595438, 1, 1, 1, 1, 1,
-0.216894, -0.4118718, -2.88434, 1, 1, 1, 1, 1,
-0.2144895, -0.01740309, -3.393617, 1, 1, 1, 1, 1,
-0.2140436, -1.123706, -3.39261, 1, 1, 1, 1, 1,
-0.2133497, -0.1701809, -1.264293, 1, 1, 1, 1, 1,
-0.2130263, 1.006169, -0.6666607, 1, 1, 1, 1, 1,
-0.2114185, -0.4148182, -2.011495, 1, 1, 1, 1, 1,
-0.2088101, -0.3917351, -2.712032, 1, 1, 1, 1, 1,
-0.2020186, -0.1014868, -0.3926147, 1, 1, 1, 1, 1,
-0.2001946, -1.891306, -2.793432, 1, 1, 1, 1, 1,
-0.1956595, 0.004456719, -0.902828, 0, 0, 1, 1, 1,
-0.1952416, -0.6663122, -1.315836, 1, 0, 0, 1, 1,
-0.1908434, -0.3462573, -2.586286, 1, 0, 0, 1, 1,
-0.1884968, -1.661623, -3.556949, 1, 0, 0, 1, 1,
-0.1853986, -0.2131045, -2.747052, 1, 0, 0, 1, 1,
-0.1823955, 1.24905, -0.656957, 1, 0, 0, 1, 1,
-0.1785248, -0.3418259, -3.092395, 0, 0, 0, 1, 1,
-0.1763571, -0.875245, -2.166609, 0, 0, 0, 1, 1,
-0.176178, 0.4890491, -1.857004, 0, 0, 0, 1, 1,
-0.1758811, -1.624876, -3.099363, 0, 0, 0, 1, 1,
-0.17308, -1.479314, -1.793205, 0, 0, 0, 1, 1,
-0.1718285, -0.126504, -2.48145, 0, 0, 0, 1, 1,
-0.1668249, -1.864396, -3.056272, 0, 0, 0, 1, 1,
-0.1646971, -1.694932, -1.181373, 1, 1, 1, 1, 1,
-0.1645668, 2.120283, 0.3537546, 1, 1, 1, 1, 1,
-0.163914, -0.6181884, -2.93421, 1, 1, 1, 1, 1,
-0.1634403, 0.978684, -0.3933547, 1, 1, 1, 1, 1,
-0.1600894, 0.7424285, -0.07878233, 1, 1, 1, 1, 1,
-0.1571966, 0.5694855, 0.09683445, 1, 1, 1, 1, 1,
-0.1571031, -0.8447633, -2.003224, 1, 1, 1, 1, 1,
-0.1542211, -1.772351, -3.622989, 1, 1, 1, 1, 1,
-0.1515212, -1.210534, -2.99022, 1, 1, 1, 1, 1,
-0.1473807, 0.1928054, -0.3946058, 1, 1, 1, 1, 1,
-0.1471377, 0.002930302, -2.662254, 1, 1, 1, 1, 1,
-0.146509, 0.07453006, -0.4389265, 1, 1, 1, 1, 1,
-0.1455561, -1.547255, -2.753198, 1, 1, 1, 1, 1,
-0.1448999, -0.4468149, -3.005808, 1, 1, 1, 1, 1,
-0.1441143, 1.479285, -1.380714, 1, 1, 1, 1, 1,
-0.1429743, -0.9318848, -2.547396, 0, 0, 1, 1, 1,
-0.1423678, 0.08892326, -1.483241, 1, 0, 0, 1, 1,
-0.1409975, -2.625688, -3.429388, 1, 0, 0, 1, 1,
-0.1403143, -0.8457236, -3.332134, 1, 0, 0, 1, 1,
-0.1402167, -0.6123438, -3.189303, 1, 0, 0, 1, 1,
-0.1380326, -1.525456, -2.525701, 1, 0, 0, 1, 1,
-0.1303921, -1.568458, -3.686392, 0, 0, 0, 1, 1,
-0.1288497, -0.3460387, -1.622666, 0, 0, 0, 1, 1,
-0.1274433, -1.774425, -4.911411, 0, 0, 0, 1, 1,
-0.1272962, -0.5161683, -3.94128, 0, 0, 0, 1, 1,
-0.1262858, 1.168522, -0.3402579, 0, 0, 0, 1, 1,
-0.1254701, 0.06391871, -1.231677, 0, 0, 0, 1, 1,
-0.119614, 0.08286382, -1.611028, 0, 0, 0, 1, 1,
-0.1154112, -3.293184, -3.913893, 1, 1, 1, 1, 1,
-0.1147797, 0.03004888, -0.3291031, 1, 1, 1, 1, 1,
-0.113449, 0.0008425421, -1.438968, 1, 1, 1, 1, 1,
-0.1130564, 0.2863731, -0.735075, 1, 1, 1, 1, 1,
-0.1082246, -0.8215696, -2.28395, 1, 1, 1, 1, 1,
-0.1068794, 0.5679736, -0.3991719, 1, 1, 1, 1, 1,
-0.09358271, 0.2175261, 1.406726, 1, 1, 1, 1, 1,
-0.09289496, -0.6647592, -4.197824, 1, 1, 1, 1, 1,
-0.09220047, 0.283753, -1.480499, 1, 1, 1, 1, 1,
-0.09077016, 0.4635084, -1.757056, 1, 1, 1, 1, 1,
-0.08610626, 0.705474, -0.05657328, 1, 1, 1, 1, 1,
-0.08379214, -1.513389, -4.256114, 1, 1, 1, 1, 1,
-0.0799247, -0.6532366, -5.199627, 1, 1, 1, 1, 1,
-0.07710771, -0.9638122, -2.946069, 1, 1, 1, 1, 1,
-0.07394148, -1.928967, -3.080183, 1, 1, 1, 1, 1,
-0.07071274, -1.063661, -1.70326, 0, 0, 1, 1, 1,
-0.06855391, 0.1800541, -0.4403637, 1, 0, 0, 1, 1,
-0.06715372, 1.99694, -2.836329, 1, 0, 0, 1, 1,
-0.06562979, 0.09953263, 0.5923125, 1, 0, 0, 1, 1,
-0.06369776, 0.07074562, -2.992356, 1, 0, 0, 1, 1,
-0.06334014, -0.7739765, -3.429476, 1, 0, 0, 1, 1,
-0.0575648, 0.02957349, -2.315141, 0, 0, 0, 1, 1,
-0.05300777, -0.1370042, -1.642439, 0, 0, 0, 1, 1,
-0.04983532, 0.2026822, 1.934103, 0, 0, 0, 1, 1,
-0.04947785, -1.07914, -3.778832, 0, 0, 0, 1, 1,
-0.04942173, 1.128891, 0.6010395, 0, 0, 0, 1, 1,
-0.04585476, 0.5681472, -0.6154267, 0, 0, 0, 1, 1,
-0.04529949, -1.172799, -3.54254, 0, 0, 0, 1, 1,
-0.04271268, 1.043581, -0.8823757, 1, 1, 1, 1, 1,
-0.03798999, 1.103608, -0.1048943, 1, 1, 1, 1, 1,
-0.03667708, 0.7647861, -0.08899994, 1, 1, 1, 1, 1,
-0.03180494, 1.523612, -1.180483, 1, 1, 1, 1, 1,
-0.02715648, -0.8478924, -3.218796, 1, 1, 1, 1, 1,
-0.02433611, -0.2841938, -3.021125, 1, 1, 1, 1, 1,
-0.02079784, -0.8648061, -2.657704, 1, 1, 1, 1, 1,
-0.01990595, 0.5973023, 0.3531769, 1, 1, 1, 1, 1,
-0.01921725, 0.4661873, 0.1485602, 1, 1, 1, 1, 1,
-0.01868376, -0.7819861, -2.034534, 1, 1, 1, 1, 1,
-0.01831225, 1.041796, -1.774976, 1, 1, 1, 1, 1,
-0.01693874, 0.8100094, 0.07715172, 1, 1, 1, 1, 1,
-0.01518315, 0.5426074, -1.645717, 1, 1, 1, 1, 1,
-0.01107482, 0.6679148, 1.225598, 1, 1, 1, 1, 1,
-0.00415909, -0.9003271, -4.506906, 1, 1, 1, 1, 1,
-0.003526563, 0.1121536, 0.3229651, 0, 0, 1, 1, 1,
-0.0004167505, -0.5775372, -3.013717, 1, 0, 0, 1, 1,
0.001291719, -1.335877, 4.837651, 1, 0, 0, 1, 1,
0.002304846, -0.7368053, 2.451798, 1, 0, 0, 1, 1,
0.002778153, 0.6678731, 0.1214685, 1, 0, 0, 1, 1,
0.005713727, 1.121969, -1.337608, 1, 0, 0, 1, 1,
0.007661077, 0.573693, -0.8093389, 0, 0, 0, 1, 1,
0.01057878, -1.041286, 2.753326, 0, 0, 0, 1, 1,
0.0152135, -0.01935409, 3.284955, 0, 0, 0, 1, 1,
0.01525753, -0.4104977, 1.441952, 0, 0, 0, 1, 1,
0.01647037, 0.2449253, 0.6502154, 0, 0, 0, 1, 1,
0.01647885, 0.4026799, -0.6433411, 0, 0, 0, 1, 1,
0.01927134, -0.191169, 2.633436, 0, 0, 0, 1, 1,
0.01971367, -1.836212, 1.221928, 1, 1, 1, 1, 1,
0.02026174, 0.0308215, 0.7748058, 1, 1, 1, 1, 1,
0.02635634, 0.4769707, 0.06310175, 1, 1, 1, 1, 1,
0.02899802, 0.6227633, 0.2706124, 1, 1, 1, 1, 1,
0.0369157, -0.8766043, 3.007752, 1, 1, 1, 1, 1,
0.03723418, 1.943971, -0.3807227, 1, 1, 1, 1, 1,
0.03733186, 1.288688, -0.5007855, 1, 1, 1, 1, 1,
0.0417875, 0.5718794, 0.1215362, 1, 1, 1, 1, 1,
0.04424574, 0.8841056, -0.4468238, 1, 1, 1, 1, 1,
0.04517071, -0.8313561, 3.662733, 1, 1, 1, 1, 1,
0.047186, 0.8319654, -1.490872, 1, 1, 1, 1, 1,
0.04794756, 1.126354, 0.168048, 1, 1, 1, 1, 1,
0.05346507, 1.736673, -0.08830402, 1, 1, 1, 1, 1,
0.05803795, -0.2603208, 2.028213, 1, 1, 1, 1, 1,
0.05825602, 1.429368, 0.9252493, 1, 1, 1, 1, 1,
0.05872844, -1.006879, 2.214521, 0, 0, 1, 1, 1,
0.06096258, 0.9354972, 0.2128597, 1, 0, 0, 1, 1,
0.06344901, 0.2365737, 1.587246, 1, 0, 0, 1, 1,
0.06845039, -0.5584707, 3.505466, 1, 0, 0, 1, 1,
0.07069378, 0.3513903, 1.166967, 1, 0, 0, 1, 1,
0.07113998, -1.288867, 3.90515, 1, 0, 0, 1, 1,
0.0754635, -0.8297028, 3.218153, 0, 0, 0, 1, 1,
0.07604976, -0.3221223, 2.95344, 0, 0, 0, 1, 1,
0.07632446, -1.398426, 4.547836, 0, 0, 0, 1, 1,
0.08382212, 1.414947, 0.8222769, 0, 0, 0, 1, 1,
0.08736519, -0.1443085, 1.81802, 0, 0, 0, 1, 1,
0.08764975, 1.140094, -0.3808534, 0, 0, 0, 1, 1,
0.08806655, 0.2529328, 0.9603617, 0, 0, 0, 1, 1,
0.09106109, -0.4802246, 2.480628, 1, 1, 1, 1, 1,
0.09807182, -0.9588756, 2.536188, 1, 1, 1, 1, 1,
0.0989857, -0.1768925, 3.712759, 1, 1, 1, 1, 1,
0.1011385, -1.54385, 2.749442, 1, 1, 1, 1, 1,
0.1015293, -0.7502753, 1.878947, 1, 1, 1, 1, 1,
0.1027964, 1.078566, -0.2424572, 1, 1, 1, 1, 1,
0.1036099, 0.007964503, 2.695542, 1, 1, 1, 1, 1,
0.1076908, -0.8778705, 1.888081, 1, 1, 1, 1, 1,
0.1104133, -0.8697911, 3.996627, 1, 1, 1, 1, 1,
0.1146291, 0.3861994, 2.739471, 1, 1, 1, 1, 1,
0.1167312, 1.452959, -1.09783, 1, 1, 1, 1, 1,
0.1190962, 1.342077, 0.7914859, 1, 1, 1, 1, 1,
0.1212013, 0.6572883, -0.4677249, 1, 1, 1, 1, 1,
0.1235645, 1.325778, 0.1298412, 1, 1, 1, 1, 1,
0.1319255, 0.1836661, 2.122134, 1, 1, 1, 1, 1,
0.1359392, 0.7063539, 1.288018, 0, 0, 1, 1, 1,
0.1379314, -0.4381474, 2.126176, 1, 0, 0, 1, 1,
0.1417208, 0.06902745, 0.04683875, 1, 0, 0, 1, 1,
0.1463273, 0.4658602, -0.9970649, 1, 0, 0, 1, 1,
0.1492973, -0.2785096, 2.873295, 1, 0, 0, 1, 1,
0.1498627, -0.5499271, 3.348001, 1, 0, 0, 1, 1,
0.150951, 0.6275581, 0.7462081, 0, 0, 0, 1, 1,
0.1515021, -0.4284008, -0.199752, 0, 0, 0, 1, 1,
0.1526549, 0.1279821, 0.3686815, 0, 0, 0, 1, 1,
0.1528615, 0.4698672, 0.1604576, 0, 0, 0, 1, 1,
0.1595177, -1.303033, 1.069689, 0, 0, 0, 1, 1,
0.1598257, 1.183725, 0.2265166, 0, 0, 0, 1, 1,
0.1668005, 0.5502594, 0.8188048, 0, 0, 0, 1, 1,
0.1676839, 1.917835, 1.068739, 1, 1, 1, 1, 1,
0.1711253, -0.9832577, 3.367345, 1, 1, 1, 1, 1,
0.1738573, 0.9098369, -0.4580936, 1, 1, 1, 1, 1,
0.1742692, -0.8095686, 2.436041, 1, 1, 1, 1, 1,
0.1767197, -0.1106866, 2.586053, 1, 1, 1, 1, 1,
0.1798207, 1.275746, 0.6093901, 1, 1, 1, 1, 1,
0.1853158, 0.2824618, -1.199257, 1, 1, 1, 1, 1,
0.1864157, -0.5893545, 3.649135, 1, 1, 1, 1, 1,
0.193696, -0.7880122, 3.895764, 1, 1, 1, 1, 1,
0.194438, -0.3336211, 2.119361, 1, 1, 1, 1, 1,
0.1947928, -1.630164, 1.174106, 1, 1, 1, 1, 1,
0.1959981, -1.825199, 4.482644, 1, 1, 1, 1, 1,
0.2013659, 0.5205182, -0.6315516, 1, 1, 1, 1, 1,
0.2028107, 0.07469989, 1.371979, 1, 1, 1, 1, 1,
0.2029801, -1.120424, 3.159319, 1, 1, 1, 1, 1,
0.204745, 0.4702526, 1.023429, 0, 0, 1, 1, 1,
0.2063224, -0.08346666, 1.595731, 1, 0, 0, 1, 1,
0.207626, -1.001948, 3.263209, 1, 0, 0, 1, 1,
0.20842, 2.116768, 2.140839, 1, 0, 0, 1, 1,
0.2105347, 0.4438889, 0.2924022, 1, 0, 0, 1, 1,
0.2128922, 0.09174474, 1.244113, 1, 0, 0, 1, 1,
0.2173899, 0.5507338, -0.7456017, 0, 0, 0, 1, 1,
0.2242635, 0.2125516, 0.4398582, 0, 0, 0, 1, 1,
0.2300089, 1.163684, 1.372573, 0, 0, 0, 1, 1,
0.2344568, 0.203103, 1.334496, 0, 0, 0, 1, 1,
0.235247, -0.8359128, 1.944791, 0, 0, 0, 1, 1,
0.2379993, -0.2615573, 2.019065, 0, 0, 0, 1, 1,
0.238766, 0.5169988, -1.085521, 0, 0, 0, 1, 1,
0.2405004, -1.564716, 2.126687, 1, 1, 1, 1, 1,
0.2405652, -0.2889074, 1.782914, 1, 1, 1, 1, 1,
0.2451035, 1.640159, 1.799049, 1, 1, 1, 1, 1,
0.25254, 1.199769, 1.440943, 1, 1, 1, 1, 1,
0.2527118, 0.9375971, 2.62593, 1, 1, 1, 1, 1,
0.2545122, -0.003522753, 0.3767255, 1, 1, 1, 1, 1,
0.2630422, -0.8171757, 1.69048, 1, 1, 1, 1, 1,
0.2633677, 1.380726, -0.01959212, 1, 1, 1, 1, 1,
0.2651432, 0.1000628, 2.350579, 1, 1, 1, 1, 1,
0.2652854, -0.3475694, 1.730602, 1, 1, 1, 1, 1,
0.2657222, 0.1284273, -0.6562397, 1, 1, 1, 1, 1,
0.2657782, 1.003877, -1.645917, 1, 1, 1, 1, 1,
0.269532, -0.8544501, 2.791812, 1, 1, 1, 1, 1,
0.2711991, -0.4355385, 2.870674, 1, 1, 1, 1, 1,
0.2716001, -0.1418999, 2.426746, 1, 1, 1, 1, 1,
0.2718514, -0.07968006, 1.235326, 0, 0, 1, 1, 1,
0.272776, -1.190198, 2.765164, 1, 0, 0, 1, 1,
0.2728274, 0.5010332, -0.1897682, 1, 0, 0, 1, 1,
0.2735134, -1.03934, 2.177482, 1, 0, 0, 1, 1,
0.2741793, 0.451093, 0.8768117, 1, 0, 0, 1, 1,
0.2762281, 1.346321, 0.1020515, 1, 0, 0, 1, 1,
0.2783825, 0.7789605, 1.485854, 0, 0, 0, 1, 1,
0.2798707, -0.7292312, 3.090248, 0, 0, 0, 1, 1,
0.2829754, -0.667525, 2.549725, 0, 0, 0, 1, 1,
0.2850249, 1.548358, -0.6404076, 0, 0, 0, 1, 1,
0.2929013, 0.05514721, 1.504553, 0, 0, 0, 1, 1,
0.2934927, -1.149159, 2.83765, 0, 0, 0, 1, 1,
0.2976438, 0.7150896, -0.5522125, 0, 0, 0, 1, 1,
0.3001397, 1.016665, 0.4811997, 1, 1, 1, 1, 1,
0.3016941, -1.830576, 1.780078, 1, 1, 1, 1, 1,
0.306803, -0.5195609, 3.267773, 1, 1, 1, 1, 1,
0.3077606, 0.2762871, 0.5637454, 1, 1, 1, 1, 1,
0.309444, -0.887864, 3.748612, 1, 1, 1, 1, 1,
0.3115042, -0.2662732, 1.77959, 1, 1, 1, 1, 1,
0.3129543, -0.3799326, 1.051416, 1, 1, 1, 1, 1,
0.3135279, 0.6816875, 0.3870109, 1, 1, 1, 1, 1,
0.3169762, -0.5688441, 2.272097, 1, 1, 1, 1, 1,
0.3206909, 1.291752, 1.248587, 1, 1, 1, 1, 1,
0.3227302, -1.133461, 4.40862, 1, 1, 1, 1, 1,
0.3250107, -0.7269558, 4.826453, 1, 1, 1, 1, 1,
0.3274542, 1.241046, -0.8483961, 1, 1, 1, 1, 1,
0.3276772, -0.2670773, 1.383045, 1, 1, 1, 1, 1,
0.3277035, -0.8318375, 3.369284, 1, 1, 1, 1, 1,
0.3304485, -0.02134751, 2.069914, 0, 0, 1, 1, 1,
0.3352115, 0.641665, -0.8268099, 1, 0, 0, 1, 1,
0.3353184, -1.125397, 4.288957, 1, 0, 0, 1, 1,
0.3381009, -0.5709447, 1.949289, 1, 0, 0, 1, 1,
0.3388178, -1.916681, 3.536134, 1, 0, 0, 1, 1,
0.339784, -0.8576075, 3.031043, 1, 0, 0, 1, 1,
0.3431728, -0.4820402, 1.535544, 0, 0, 0, 1, 1,
0.3461626, -0.5248638, 2.369326, 0, 0, 0, 1, 1,
0.3473227, -1.080766, 4.622767, 0, 0, 0, 1, 1,
0.347413, -0.4902033, 1.566786, 0, 0, 0, 1, 1,
0.3484681, -0.08916147, 3.803931, 0, 0, 0, 1, 1,
0.3506333, -1.494576, 4.702606, 0, 0, 0, 1, 1,
0.3514853, -0.5030713, 2.301075, 0, 0, 0, 1, 1,
0.3515535, 0.5286124, -1.425842, 1, 1, 1, 1, 1,
0.3534292, -1.496428, 3.573571, 1, 1, 1, 1, 1,
0.354337, 0.4418804, 2.077577, 1, 1, 1, 1, 1,
0.3550671, 0.3470255, 0.6247203, 1, 1, 1, 1, 1,
0.3565239, 1.035113, 1.168454, 1, 1, 1, 1, 1,
0.3575588, 0.9169784, 0.8716872, 1, 1, 1, 1, 1,
0.3585153, -0.6044429, 1.931799, 1, 1, 1, 1, 1,
0.3585231, 0.2530274, 0.9722504, 1, 1, 1, 1, 1,
0.3617499, -0.7442124, 3.304388, 1, 1, 1, 1, 1,
0.3626875, -1.07294, 2.009753, 1, 1, 1, 1, 1,
0.3643355, -0.07214244, 2.93705, 1, 1, 1, 1, 1,
0.3645474, -0.6080561, 0.8914433, 1, 1, 1, 1, 1,
0.3730627, -1.01828, 1.693767, 1, 1, 1, 1, 1,
0.3733796, 0.09410189, 1.31242, 1, 1, 1, 1, 1,
0.3751589, -0.9415077, 3.436575, 1, 1, 1, 1, 1,
0.3759054, -1.598008, 1.534588, 0, 0, 1, 1, 1,
0.3876335, -0.85316, 3.528772, 1, 0, 0, 1, 1,
0.3896174, 0.6429808, -0.2518952, 1, 0, 0, 1, 1,
0.3929259, 0.7108558, 0.2755727, 1, 0, 0, 1, 1,
0.3943275, 0.06268816, -0.2623771, 1, 0, 0, 1, 1,
0.4025995, -1.281534, 3.537785, 1, 0, 0, 1, 1,
0.4028119, -0.2793868, 1.535252, 0, 0, 0, 1, 1,
0.4041401, -0.4111982, 2.991077, 0, 0, 0, 1, 1,
0.4046262, 1.855303, -0.2752996, 0, 0, 0, 1, 1,
0.4067439, 0.2604378, 1.592369, 0, 0, 0, 1, 1,
0.4105932, -0.7050993, 2.802114, 0, 0, 0, 1, 1,
0.4123038, -0.5785879, 1.239344, 0, 0, 0, 1, 1,
0.4137398, -0.2389903, 1.320433, 0, 0, 0, 1, 1,
0.4141639, -1.332435, 5.022154, 1, 1, 1, 1, 1,
0.4157266, -0.842887, 3.037307, 1, 1, 1, 1, 1,
0.4157302, -0.6999742, 2.890496, 1, 1, 1, 1, 1,
0.4224083, -3.137226, 4.51997, 1, 1, 1, 1, 1,
0.4225286, -0.6047536, 2.769022, 1, 1, 1, 1, 1,
0.4233061, -0.2085711, 3.24429, 1, 1, 1, 1, 1,
0.4301634, -0.9099923, 4.242173, 1, 1, 1, 1, 1,
0.4321372, 0.1819959, 3.899532, 1, 1, 1, 1, 1,
0.4339088, -1.498129, 2.770937, 1, 1, 1, 1, 1,
0.4360932, 1.162093, -0.1607991, 1, 1, 1, 1, 1,
0.4365686, -1.132231, 2.930583, 1, 1, 1, 1, 1,
0.4374566, -0.453189, 3.611144, 1, 1, 1, 1, 1,
0.4376928, -0.5762967, 2.654856, 1, 1, 1, 1, 1,
0.4389141, -0.2646936, 1.605959, 1, 1, 1, 1, 1,
0.4431604, -0.8645617, 2.472111, 1, 1, 1, 1, 1,
0.4461091, -1.060878, 2.38393, 0, 0, 1, 1, 1,
0.4471097, 0.06810611, 0.985346, 1, 0, 0, 1, 1,
0.4574257, 0.4466456, 0.7773989, 1, 0, 0, 1, 1,
0.4655525, 1.148116, 1.25143, 1, 0, 0, 1, 1,
0.4704712, -0.103673, 1.265027, 1, 0, 0, 1, 1,
0.472874, -0.9472154, 2.440948, 1, 0, 0, 1, 1,
0.4740819, -0.4708064, 2.82311, 0, 0, 0, 1, 1,
0.4750632, 0.109675, 1.698446, 0, 0, 0, 1, 1,
0.4806809, -0.5804834, 0.5568112, 0, 0, 0, 1, 1,
0.4827629, -0.2868188, 0.610613, 0, 0, 0, 1, 1,
0.4846718, -0.3668508, 0.6465707, 0, 0, 0, 1, 1,
0.4847756, 1.326389, 0.644899, 0, 0, 0, 1, 1,
0.4928958, -0.5487135, 4.298277, 0, 0, 0, 1, 1,
0.4952677, 0.5792048, -0.5811909, 1, 1, 1, 1, 1,
0.4966745, 0.7292622, 1.133768, 1, 1, 1, 1, 1,
0.4971069, 0.9502525, -0.2260746, 1, 1, 1, 1, 1,
0.4988505, 0.8624105, 0.3531448, 1, 1, 1, 1, 1,
0.4990649, 0.3552539, 2.084581, 1, 1, 1, 1, 1,
0.5087283, -0.3992395, 1.752834, 1, 1, 1, 1, 1,
0.5124845, 0.6895813, 0.9309245, 1, 1, 1, 1, 1,
0.5184296, 0.5164509, 1.282246, 1, 1, 1, 1, 1,
0.5298954, 1.447987, 1.786184, 1, 1, 1, 1, 1,
0.5314947, -0.9445004, 1.974518, 1, 1, 1, 1, 1,
0.5316347, -0.2840128, 1.770223, 1, 1, 1, 1, 1,
0.5336977, -1.459872, 4.093753, 1, 1, 1, 1, 1,
0.5394431, 0.9991501, 1.54714, 1, 1, 1, 1, 1,
0.5428755, -0.929786, 2.014418, 1, 1, 1, 1, 1,
0.5473028, 0.6210204, 1.372592, 1, 1, 1, 1, 1,
0.5489879, 1.556791, 0.3018041, 0, 0, 1, 1, 1,
0.5521442, -0.03901087, 3.028188, 1, 0, 0, 1, 1,
0.5564597, 0.8520818, -0.1046684, 1, 0, 0, 1, 1,
0.5574678, 0.06499324, 2.48417, 1, 0, 0, 1, 1,
0.5585869, 1.26463, 2.242819, 1, 0, 0, 1, 1,
0.5626203, -1.015201, 1.987986, 1, 0, 0, 1, 1,
0.5627354, 0.7103672, 0.1990327, 0, 0, 0, 1, 1,
0.5665017, -0.3901258, 2.69042, 0, 0, 0, 1, 1,
0.5679268, -0.2587757, 1.450104, 0, 0, 0, 1, 1,
0.5685204, 1.067801, 0.3418546, 0, 0, 0, 1, 1,
0.5685605, -0.170875, 2.728204, 0, 0, 0, 1, 1,
0.5692784, -0.2082104, 2.105707, 0, 0, 0, 1, 1,
0.5718723, 0.2374375, -0.07326625, 0, 0, 0, 1, 1,
0.5720856, -0.6422737, 2.136591, 1, 1, 1, 1, 1,
0.5775422, -1.860926, 3.293022, 1, 1, 1, 1, 1,
0.5801854, -1.458628, 4.208593, 1, 1, 1, 1, 1,
0.5822957, -1.050241, 1.995055, 1, 1, 1, 1, 1,
0.5865694, 1.263174, 1.443069, 1, 1, 1, 1, 1,
0.5925524, -1.014565, 1.355568, 1, 1, 1, 1, 1,
0.5955877, 1.226583, 0.8571, 1, 1, 1, 1, 1,
0.5965874, 1.961984, -0.9735196, 1, 1, 1, 1, 1,
0.6050946, -1.012423, 3.386442, 1, 1, 1, 1, 1,
0.6077384, 0.7052802, 2.374042, 1, 1, 1, 1, 1,
0.6087408, -3.358864, 1.977715, 1, 1, 1, 1, 1,
0.6182849, -0.708728, 4.147107, 1, 1, 1, 1, 1,
0.6185375, -1.37101, 3.36306, 1, 1, 1, 1, 1,
0.6255043, 0.5159013, 1.797542, 1, 1, 1, 1, 1,
0.6270366, -1.233781, 0.3648196, 1, 1, 1, 1, 1,
0.6288117, 0.4595254, 0.4218588, 0, 0, 1, 1, 1,
0.629167, -0.7409448, 1.993111, 1, 0, 0, 1, 1,
0.6303537, 2.781108, -0.863428, 1, 0, 0, 1, 1,
0.6324397, 0.04148012, 1.121761, 1, 0, 0, 1, 1,
0.633175, 0.1732169, 1.280515, 1, 0, 0, 1, 1,
0.6411585, -1.227018, 1.180469, 1, 0, 0, 1, 1,
0.6418613, -1.32679, 3.189571, 0, 0, 0, 1, 1,
0.6432072, 0.5304368, 0.5657406, 0, 0, 0, 1, 1,
0.6456192, -0.3270797, 2.842378, 0, 0, 0, 1, 1,
0.6520267, 0.2549366, 0.3177848, 0, 0, 0, 1, 1,
0.6597049, 0.5812423, 0.6491569, 0, 0, 0, 1, 1,
0.6622983, -1.163918, 2.076194, 0, 0, 0, 1, 1,
0.6643607, -1.511284, 1.68612, 0, 0, 0, 1, 1,
0.6693031, 0.01201806, 1.580969, 1, 1, 1, 1, 1,
0.6698029, -0.1436792, 0.671137, 1, 1, 1, 1, 1,
0.6718341, 1.374891, 1.521491, 1, 1, 1, 1, 1,
0.6736779, -0.3583767, 0.04024121, 1, 1, 1, 1, 1,
0.6765828, -0.1304754, 0.3668073, 1, 1, 1, 1, 1,
0.681429, -0.3933321, 1.535056, 1, 1, 1, 1, 1,
0.6940817, 1.796285, 1.674145, 1, 1, 1, 1, 1,
0.7016808, 0.270091, 0.7935961, 1, 1, 1, 1, 1,
0.7080964, 1.888025, 0.06484736, 1, 1, 1, 1, 1,
0.7083101, -1.74052, 3.407359, 1, 1, 1, 1, 1,
0.7099563, 1.602235, 1.101369, 1, 1, 1, 1, 1,
0.7112446, -0.705276, 2.267849, 1, 1, 1, 1, 1,
0.7116169, -0.9944819, 3.817013, 1, 1, 1, 1, 1,
0.7171282, -0.3881723, 2.281723, 1, 1, 1, 1, 1,
0.7178854, 0.3443967, -0.3367887, 1, 1, 1, 1, 1,
0.72897, 0.5097594, 1.735093, 0, 0, 1, 1, 1,
0.7296542, 0.4855815, 0.6075694, 1, 0, 0, 1, 1,
0.7318949, 0.5008202, 1.658501, 1, 0, 0, 1, 1,
0.7432263, -0.2258607, 2.107561, 1, 0, 0, 1, 1,
0.7496576, -1.52501, 2.298007, 1, 0, 0, 1, 1,
0.750183, -0.8751731, 2.344681, 1, 0, 0, 1, 1,
0.752511, -0.9883182, 3.877542, 0, 0, 0, 1, 1,
0.7526348, -0.2161633, 2.319518, 0, 0, 0, 1, 1,
0.7601039, -0.169911, 0.480033, 0, 0, 0, 1, 1,
0.7635056, -2.858745, 2.424531, 0, 0, 0, 1, 1,
0.7651373, 0.3189596, 0.2596966, 0, 0, 0, 1, 1,
0.7753148, 0.7999074, 0.9263594, 0, 0, 0, 1, 1,
0.7809177, -0.7053763, 3.155208, 0, 0, 0, 1, 1,
0.7895391, 1.4646, -0.2215978, 1, 1, 1, 1, 1,
0.7965806, 0.0320357, 2.260012, 1, 1, 1, 1, 1,
0.7972434, -1.011857, 3.267342, 1, 1, 1, 1, 1,
0.7975409, -1.378438, 3.819835, 1, 1, 1, 1, 1,
0.7984375, 1.762576, -0.2156638, 1, 1, 1, 1, 1,
0.7995064, -2.218967, 2.129222, 1, 1, 1, 1, 1,
0.8071948, -1.882258, 4.223043, 1, 1, 1, 1, 1,
0.8080792, -0.7390555, 1.9562, 1, 1, 1, 1, 1,
0.8100088, -0.07581238, 0.7924399, 1, 1, 1, 1, 1,
0.8125465, -0.7094859, 2.359672, 1, 1, 1, 1, 1,
0.8237971, -0.6446121, 2.033935, 1, 1, 1, 1, 1,
0.824921, -0.1577312, 1.852499, 1, 1, 1, 1, 1,
0.8263654, -1.526991, 2.963763, 1, 1, 1, 1, 1,
0.8277894, -1.006539, 1.37472, 1, 1, 1, 1, 1,
0.8280725, 0.6805666, 2.375127, 1, 1, 1, 1, 1,
0.8296992, 1.667356, 0.7019633, 0, 0, 1, 1, 1,
0.8301609, 1.7839, 0.9391063, 1, 0, 0, 1, 1,
0.8312207, 1.249818, 1.000749, 1, 0, 0, 1, 1,
0.8340989, 0.5083656, 0.902976, 1, 0, 0, 1, 1,
0.8466796, 1.186908, 2.187568, 1, 0, 0, 1, 1,
0.8489308, 0.9771442, 2.802967, 1, 0, 0, 1, 1,
0.8563538, -0.6063554, 0.1229302, 0, 0, 0, 1, 1,
0.8571706, 0.07841348, 0.9253131, 0, 0, 0, 1, 1,
0.862011, 0.15221, 1.585539, 0, 0, 0, 1, 1,
0.8663917, 0.3640552, 0.870757, 0, 0, 0, 1, 1,
0.8673451, 0.330979, 0.8504492, 0, 0, 0, 1, 1,
0.868328, 0.9755899, 2.456889, 0, 0, 0, 1, 1,
0.8695757, 1.037887, 1.917613, 0, 0, 0, 1, 1,
0.8699443, -0.5262901, 1.625012, 1, 1, 1, 1, 1,
0.8734748, -1.257281, 1.730911, 1, 1, 1, 1, 1,
0.8756673, 1.356218, 0.9520604, 1, 1, 1, 1, 1,
0.8796578, -1.23684, 0.8319239, 1, 1, 1, 1, 1,
0.881922, 0.4727753, 0.6792572, 1, 1, 1, 1, 1,
0.8865, 0.3662533, 1.123038, 1, 1, 1, 1, 1,
0.8878185, -1.129689, 2.18723, 1, 1, 1, 1, 1,
0.9042644, -0.01528918, 0.9201478, 1, 1, 1, 1, 1,
0.9065973, 0.7493102, -0.1686662, 1, 1, 1, 1, 1,
0.9168805, -1.758269, 1.748676, 1, 1, 1, 1, 1,
0.9176083, 1.027993, -0.3921066, 1, 1, 1, 1, 1,
0.9180223, 0.9957339, 0.8995997, 1, 1, 1, 1, 1,
0.9195735, -0.1885492, 2.279495, 1, 1, 1, 1, 1,
0.925348, 0.5220444, 1.444495, 1, 1, 1, 1, 1,
0.9294196, 1.217158, 0.6815259, 1, 1, 1, 1, 1,
0.934989, -0.02679012, 1.601814, 0, 0, 1, 1, 1,
0.937234, -0.4321946, 1.132531, 1, 0, 0, 1, 1,
0.9485562, 0.02004223, 3.112334, 1, 0, 0, 1, 1,
0.9498791, -0.8896872, 1.930717, 1, 0, 0, 1, 1,
0.9554009, 0.3112292, 0.1961781, 1, 0, 0, 1, 1,
0.9580156, -1.163833, 2.062305, 1, 0, 0, 1, 1,
0.9624975, 0.2398908, -0.05620252, 0, 0, 0, 1, 1,
0.9652755, -0.8487229, 1.895715, 0, 0, 0, 1, 1,
0.973437, 1.243934, -0.3412141, 0, 0, 0, 1, 1,
0.9750109, 0.3372194, 0.1819927, 0, 0, 0, 1, 1,
0.9754499, -0.4970532, 2.408226, 0, 0, 0, 1, 1,
1.001961, -0.452042, 2.005161, 0, 0, 0, 1, 1,
1.010817, 0.3422358, 0.2049933, 0, 0, 0, 1, 1,
1.023222, -0.3012998, 0.6743401, 1, 1, 1, 1, 1,
1.034866, 0.4117578, 0.1098098, 1, 1, 1, 1, 1,
1.035338, -2.030653, 2.1624, 1, 1, 1, 1, 1,
1.037779, 1.705561, 2.177852, 1, 1, 1, 1, 1,
1.041334, -0.0729674, 2.66784, 1, 1, 1, 1, 1,
1.041644, 1.744396, 1.028361, 1, 1, 1, 1, 1,
1.041809, -1.939158, 3.482875, 1, 1, 1, 1, 1,
1.042495, -1.461044, 2.929432, 1, 1, 1, 1, 1,
1.049217, -0.2818012, 1.087074, 1, 1, 1, 1, 1,
1.059528, -1.49568, 2.786754, 1, 1, 1, 1, 1,
1.060331, 1.116359, 0.3970789, 1, 1, 1, 1, 1,
1.066408, -0.4617942, 1.426772, 1, 1, 1, 1, 1,
1.074031, 0.2601214, 1.309066, 1, 1, 1, 1, 1,
1.083735, 1.272818, 2.110664, 1, 1, 1, 1, 1,
1.084185, -0.6342705, 1.045401, 1, 1, 1, 1, 1,
1.092215, 0.5022671, 1.683666, 0, 0, 1, 1, 1,
1.09297, 1.653244, 0.6345229, 1, 0, 0, 1, 1,
1.093326, 1.039897, 2.000514, 1, 0, 0, 1, 1,
1.102827, 0.5510216, 1.699279, 1, 0, 0, 1, 1,
1.105312, 1.773963, -0.8462286, 1, 0, 0, 1, 1,
1.106037, 2.425874, 1.046306, 1, 0, 0, 1, 1,
1.11331, -1.418906, 4.354802, 0, 0, 0, 1, 1,
1.118321, 1.658343, -0.1493193, 0, 0, 0, 1, 1,
1.120565, 0.4344445, 0.4179446, 0, 0, 0, 1, 1,
1.122629, 0.4192426, 0.2804399, 0, 0, 0, 1, 1,
1.136709, -1.39397, 0.3942318, 0, 0, 0, 1, 1,
1.152528, -0.8185617, 0.7865608, 0, 0, 0, 1, 1,
1.157315, -0.4795043, 2.702668, 0, 0, 0, 1, 1,
1.159753, -0.6487234, 0.5157861, 1, 1, 1, 1, 1,
1.163442, -0.4015656, 3.058972, 1, 1, 1, 1, 1,
1.163917, -0.1880616, 0.5227164, 1, 1, 1, 1, 1,
1.167293, 0.270986, 1.458709, 1, 1, 1, 1, 1,
1.17348, -0.07581896, 1.219469, 1, 1, 1, 1, 1,
1.175383, -0.2983319, 1.593604, 1, 1, 1, 1, 1,
1.1825, -0.03115444, 1.036564, 1, 1, 1, 1, 1,
1.183551, 1.272694, 0.4141577, 1, 1, 1, 1, 1,
1.206529, -1.125489, 2.400491, 1, 1, 1, 1, 1,
1.212618, -1.466924, 2.042672, 1, 1, 1, 1, 1,
1.216726, 0.04469348, 1.480097, 1, 1, 1, 1, 1,
1.217332, 1.043496, 0.6300034, 1, 1, 1, 1, 1,
1.222779, -0.1848138, 1.491917, 1, 1, 1, 1, 1,
1.229957, 1.299122, -0.7646332, 1, 1, 1, 1, 1,
1.24017, 0.4782951, 2.813648, 1, 1, 1, 1, 1,
1.243651, 1.064974, 1.448039, 0, 0, 1, 1, 1,
1.251519, -1.122461, 2.573719, 1, 0, 0, 1, 1,
1.251545, -0.4676943, -0.2895549, 1, 0, 0, 1, 1,
1.259039, -1.141611, 2.078662, 1, 0, 0, 1, 1,
1.263894, -1.076007, 1.0798, 1, 0, 0, 1, 1,
1.269649, 0.3612282, 1.213162, 1, 0, 0, 1, 1,
1.274801, 0.4128102, 0.05162451, 0, 0, 0, 1, 1,
1.276547, -0.7151182, 2.00401, 0, 0, 0, 1, 1,
1.289097, -0.6767753, 0.7002386, 0, 0, 0, 1, 1,
1.310627, 0.7593254, -0.5536309, 0, 0, 0, 1, 1,
1.31254, -0.7779856, 1.859538, 0, 0, 0, 1, 1,
1.33451, -1.741594, 3.707638, 0, 0, 0, 1, 1,
1.343827, -0.8716068, 0.6431441, 0, 0, 0, 1, 1,
1.353339, 0.1070699, 1.611571, 1, 1, 1, 1, 1,
1.353651, 0.3446209, 1.538127, 1, 1, 1, 1, 1,
1.357452, -0.1989778, 2.993363, 1, 1, 1, 1, 1,
1.361759, 0.3030035, 1.147616, 1, 1, 1, 1, 1,
1.378714, -1.068407, 1.977802, 1, 1, 1, 1, 1,
1.385219, -0.04937445, 1.736054, 1, 1, 1, 1, 1,
1.387073, -1.062669, 2.648704, 1, 1, 1, 1, 1,
1.387478, -1.653328, 2.15472, 1, 1, 1, 1, 1,
1.390407, -0.1964672, 1.847308, 1, 1, 1, 1, 1,
1.391198, 0.2722189, 1.571925, 1, 1, 1, 1, 1,
1.40381, 0.8439039, 2.386996, 1, 1, 1, 1, 1,
1.408791, -0.8578541, 0.4959041, 1, 1, 1, 1, 1,
1.413557, 0.352497, 2.122478, 1, 1, 1, 1, 1,
1.414687, -1.439507, 0.6533651, 1, 1, 1, 1, 1,
1.417148, -0.6178961, 0.4844346, 1, 1, 1, 1, 1,
1.418992, -1.09601, 1.105604, 0, 0, 1, 1, 1,
1.438246, -1.509074, 1.673751, 1, 0, 0, 1, 1,
1.447447, 0.1372223, -0.2239282, 1, 0, 0, 1, 1,
1.4482, -1.559215, 3.355002, 1, 0, 0, 1, 1,
1.452221, -0.9111634, 2.294626, 1, 0, 0, 1, 1,
1.457228, 0.5935206, 0.7537008, 1, 0, 0, 1, 1,
1.468008, 0.03101456, 2.715677, 0, 0, 0, 1, 1,
1.475721, 0.3928327, 0.2199013, 0, 0, 0, 1, 1,
1.480874, -0.1375681, 2.896518, 0, 0, 0, 1, 1,
1.482641, -1.802765, 3.148571, 0, 0, 0, 1, 1,
1.486455, 2.425684, 0.8106862, 0, 0, 0, 1, 1,
1.487315, -0.06784618, 1.623788, 0, 0, 0, 1, 1,
1.490727, -1.015768, 2.931559, 0, 0, 0, 1, 1,
1.507949, -0.7573543, 2.637145, 1, 1, 1, 1, 1,
1.513812, 0.03702181, 1.079118, 1, 1, 1, 1, 1,
1.529032, 0.04148041, 1.506392, 1, 1, 1, 1, 1,
1.530814, -0.2685147, 1.814216, 1, 1, 1, 1, 1,
1.533551, 0.7625705, 3.882467, 1, 1, 1, 1, 1,
1.542673, -0.8404523, 2.333193, 1, 1, 1, 1, 1,
1.543873, -0.08839364, 0.4999937, 1, 1, 1, 1, 1,
1.547101, -0.9375849, 2.585295, 1, 1, 1, 1, 1,
1.550738, -1.287758, 1.708979, 1, 1, 1, 1, 1,
1.562784, 1.616294, 0.8066722, 1, 1, 1, 1, 1,
1.567739, -0.9522392, 0.5712054, 1, 1, 1, 1, 1,
1.570289, 1.110072, -0.1292839, 1, 1, 1, 1, 1,
1.590481, -2.257891, 3.215076, 1, 1, 1, 1, 1,
1.597708, -0.4533907, 2.403448, 1, 1, 1, 1, 1,
1.60609, -1.519343, 1.110793, 1, 1, 1, 1, 1,
1.622831, -0.2845672, 0.7589353, 0, 0, 1, 1, 1,
1.639699, -1.288082, 1.362145, 1, 0, 0, 1, 1,
1.644384, 1.087248, -0.6075061, 1, 0, 0, 1, 1,
1.648282, 0.6189465, 0.1953455, 1, 0, 0, 1, 1,
1.664062, -0.3671767, 0.9146524, 1, 0, 0, 1, 1,
1.671907, -0.8827752, 2.945762, 1, 0, 0, 1, 1,
1.691941, 0.3132443, 2.73214, 0, 0, 0, 1, 1,
1.694312, 1.002159, 0.2838812, 0, 0, 0, 1, 1,
1.727833, 0.9496617, 1.88279, 0, 0, 0, 1, 1,
1.733803, 0.3440297, -0.4814051, 0, 0, 0, 1, 1,
1.750676, -0.81375, 3.509273, 0, 0, 0, 1, 1,
1.755444, 1.373921, 0.9697677, 0, 0, 0, 1, 1,
1.765411, 0.07769252, 0.9768993, 0, 0, 0, 1, 1,
1.793042, 0.3823611, 0.5334399, 1, 1, 1, 1, 1,
1.800798, 0.2055331, 1.565438, 1, 1, 1, 1, 1,
1.826207, 0.3092598, 1.476085, 1, 1, 1, 1, 1,
1.845724, -0.5335955, 2.09746, 1, 1, 1, 1, 1,
1.901551, -0.1804868, 0.8722591, 1, 1, 1, 1, 1,
1.915963, -1.911255, 2.430779, 1, 1, 1, 1, 1,
1.919588, 1.171492, 1.307301, 1, 1, 1, 1, 1,
1.919591, -0.904464, 4.80728, 1, 1, 1, 1, 1,
1.921937, -0.2119879, 1.977775, 1, 1, 1, 1, 1,
1.925766, -0.4081837, 0.822117, 1, 1, 1, 1, 1,
1.950011, -0.3947312, 1.965606, 1, 1, 1, 1, 1,
1.96272, 0.09109158, 2.886285, 1, 1, 1, 1, 1,
1.966694, -1.072189, 0.4616135, 1, 1, 1, 1, 1,
1.972151, 1.114779, 0.7919747, 1, 1, 1, 1, 1,
1.991157, 0.9650887, 1.118432, 1, 1, 1, 1, 1,
2.018066, 2.071182, 0.5735018, 0, 0, 1, 1, 1,
2.019723, 0.2033733, 0.2232237, 1, 0, 0, 1, 1,
2.037271, 0.7619311, 1.027904, 1, 0, 0, 1, 1,
2.058441, 1.140253, 3.346794, 1, 0, 0, 1, 1,
2.069843, -0.867983, 2.161445, 1, 0, 0, 1, 1,
2.070374, -0.9394214, 0.9059186, 1, 0, 0, 1, 1,
2.099782, -0.7816252, 3.027935, 0, 0, 0, 1, 1,
2.109197, 0.9624175, 2.911371, 0, 0, 0, 1, 1,
2.109897, -0.2498324, 2.303072, 0, 0, 0, 1, 1,
2.13289, -0.150454, 1.563533, 0, 0, 0, 1, 1,
2.134499, -0.04996895, 0.9166183, 0, 0, 0, 1, 1,
2.158321, -0.1913456, 1.796891, 0, 0, 0, 1, 1,
2.339391, -0.1358116, 3.197317, 0, 0, 0, 1, 1,
2.369344, 0.8551242, 1.292283, 1, 1, 1, 1, 1,
2.371109, 1.93052, -0.00382468, 1, 1, 1, 1, 1,
2.430686, 1.188035, 1.671758, 1, 1, 1, 1, 1,
2.451248, -0.6174094, 1.633614, 1, 1, 1, 1, 1,
2.517279, 0.2198168, 0.4424698, 1, 1, 1, 1, 1,
2.689834, 1.169169, 0.904207, 1, 1, 1, 1, 1,
3.023628, 0.4407447, 2.805009, 1, 1, 1, 1, 1
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
var radius = 9.522084;
var distance = 33.44592;
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
mvMatrix.translate( -0.03230703, -0.2952015, 0.08873653 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44592);
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
