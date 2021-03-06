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
-3.59911, 0.001282468, -2.444006, 1, 0, 0, 1,
-3.46578, -0.3530318, -1.6337, 1, 0.007843138, 0, 1,
-3.348119, 0.03403814, -1.189638, 1, 0.01176471, 0, 1,
-2.801785, 0.3264398, -0.5913967, 1, 0.01960784, 0, 1,
-2.639917, -0.6526198, -1.763968, 1, 0.02352941, 0, 1,
-2.572272, 0.4601134, -1.994446, 1, 0.03137255, 0, 1,
-2.478797, -3.13464, -1.833715, 1, 0.03529412, 0, 1,
-2.455625, 0.7102193, -1.887191, 1, 0.04313726, 0, 1,
-2.448909, 0.1096128, -1.887874, 1, 0.04705882, 0, 1,
-2.42757, 0.9135447, 0.3767033, 1, 0.05490196, 0, 1,
-2.392254, -1.770693, -2.315639, 1, 0.05882353, 0, 1,
-2.339842, -1.491732, -1.985585, 1, 0.06666667, 0, 1,
-2.329219, 1.256282, -0.992074, 1, 0.07058824, 0, 1,
-2.31831, -1.156182, -1.339226, 1, 0.07843138, 0, 1,
-2.26874, -0.7380707, -1.953824, 1, 0.08235294, 0, 1,
-2.199442, 0.213207, -2.768606, 1, 0.09019608, 0, 1,
-2.180998, -1.67533, -1.909999, 1, 0.09411765, 0, 1,
-2.16787, 0.7618788, -1.12164, 1, 0.1019608, 0, 1,
-2.139093, -0.3946297, -2.152463, 1, 0.1098039, 0, 1,
-2.127568, -0.2579039, -1.142599, 1, 0.1137255, 0, 1,
-2.115513, -1.620388, -2.86914, 1, 0.1215686, 0, 1,
-2.114323, -0.8419561, -2.706079, 1, 0.1254902, 0, 1,
-2.090961, -0.6254521, -3.202043, 1, 0.1333333, 0, 1,
-2.079924, 0.3447843, -0.01870291, 1, 0.1372549, 0, 1,
-2.078313, 1.474181, -0.7744572, 1, 0.145098, 0, 1,
-2.074913, -1.162871, -1.52048, 1, 0.1490196, 0, 1,
-2.051164, 1.103389, -0.3457028, 1, 0.1568628, 0, 1,
-2.041031, -0.1895099, -1.727523, 1, 0.1607843, 0, 1,
-2.019149, -2.033371, -1.766626, 1, 0.1686275, 0, 1,
-2.008755, -0.09572297, -2.011815, 1, 0.172549, 0, 1,
-2.007235, -3.161212, -3.164332, 1, 0.1803922, 0, 1,
-1.991636, -0.6145145, -0.5321094, 1, 0.1843137, 0, 1,
-1.989976, -0.5538872, -2.995816, 1, 0.1921569, 0, 1,
-1.90129, -0.2612108, -2.467678, 1, 0.1960784, 0, 1,
-1.898068, -0.7976091, -1.880682, 1, 0.2039216, 0, 1,
-1.876828, -1.011672, -2.793426, 1, 0.2117647, 0, 1,
-1.855667, -1.968794, -1.780942, 1, 0.2156863, 0, 1,
-1.825284, 0.640506, -0.595951, 1, 0.2235294, 0, 1,
-1.81852, -0.3897928, -2.069336, 1, 0.227451, 0, 1,
-1.794534, -0.05505786, -0.9235111, 1, 0.2352941, 0, 1,
-1.787471, 0.7315896, -1.059891, 1, 0.2392157, 0, 1,
-1.768803, 0.2471275, -2.347024, 1, 0.2470588, 0, 1,
-1.74739, 0.295045, -0.2924541, 1, 0.2509804, 0, 1,
-1.745554, 1.658805, -1.106759, 1, 0.2588235, 0, 1,
-1.742122, 0.8724737, -0.3022819, 1, 0.2627451, 0, 1,
-1.741839, 1.006201, -0.9675858, 1, 0.2705882, 0, 1,
-1.734969, -0.3801903, -2.915623, 1, 0.2745098, 0, 1,
-1.734718, 0.1609705, -1.565119, 1, 0.282353, 0, 1,
-1.730697, 0.4064726, -0.8217287, 1, 0.2862745, 0, 1,
-1.729467, 0.07758255, -0.3300734, 1, 0.2941177, 0, 1,
-1.728945, 1.029151, 0.3566197, 1, 0.3019608, 0, 1,
-1.723641, 0.3091262, -2.164569, 1, 0.3058824, 0, 1,
-1.712399, 0.1982643, -0.6379035, 1, 0.3137255, 0, 1,
-1.70509, 0.7180938, -1.252656, 1, 0.3176471, 0, 1,
-1.699445, -0.3636402, -2.899343, 1, 0.3254902, 0, 1,
-1.689565, 0.5023541, -0.4902375, 1, 0.3294118, 0, 1,
-1.667066, -1.098037, -0.9654621, 1, 0.3372549, 0, 1,
-1.647412, -0.7410612, -2.557121, 1, 0.3411765, 0, 1,
-1.644133, -0.9458363, -1.204517, 1, 0.3490196, 0, 1,
-1.643765, 0.2460231, -1.86702, 1, 0.3529412, 0, 1,
-1.639608, 0.2729096, -1.265071, 1, 0.3607843, 0, 1,
-1.633801, 0.878224, -0.1636434, 1, 0.3647059, 0, 1,
-1.601291, 1.182974, -0.5659134, 1, 0.372549, 0, 1,
-1.588684, 0.126262, -3.85496, 1, 0.3764706, 0, 1,
-1.588146, -0.4610182, -1.578808, 1, 0.3843137, 0, 1,
-1.575438, 0.9242039, 0.6586271, 1, 0.3882353, 0, 1,
-1.571629, -0.1415461, -0.4745101, 1, 0.3960784, 0, 1,
-1.570385, 0.1696798, -1.659955, 1, 0.4039216, 0, 1,
-1.566799, -0.4252502, -2.363448, 1, 0.4078431, 0, 1,
-1.560011, 0.2022154, -1.290314, 1, 0.4156863, 0, 1,
-1.548097, -1.158845, -1.287469, 1, 0.4196078, 0, 1,
-1.546306, 0.7306366, -0.2006119, 1, 0.427451, 0, 1,
-1.524245, -1.036605, -2.761832, 1, 0.4313726, 0, 1,
-1.522831, -0.2471083, -0.6906536, 1, 0.4392157, 0, 1,
-1.519353, -2.219923, -1.53905, 1, 0.4431373, 0, 1,
-1.515011, -0.8770804, -3.141172, 1, 0.4509804, 0, 1,
-1.513192, 0.8867766, 0.07402705, 1, 0.454902, 0, 1,
-1.47192, -0.2238876, -0.4635421, 1, 0.4627451, 0, 1,
-1.470993, 0.4312897, -2.271399, 1, 0.4666667, 0, 1,
-1.457274, 1.205029, 0.678759, 1, 0.4745098, 0, 1,
-1.456513, -1.042341, -0.5011618, 1, 0.4784314, 0, 1,
-1.439955, -1.286495, -1.378237, 1, 0.4862745, 0, 1,
-1.419952, -0.7395471, -2.611763, 1, 0.4901961, 0, 1,
-1.41535, -0.291545, -1.926987, 1, 0.4980392, 0, 1,
-1.413807, 1.211895, -0.8247923, 1, 0.5058824, 0, 1,
-1.413291, 1.010067, -2.693105, 1, 0.509804, 0, 1,
-1.411645, 0.8297722, -1.442817, 1, 0.5176471, 0, 1,
-1.410303, -1.404878, -1.381016, 1, 0.5215687, 0, 1,
-1.405564, 0.5058811, -1.427233, 1, 0.5294118, 0, 1,
-1.394593, 0.2478738, -1.705361, 1, 0.5333334, 0, 1,
-1.378989, -3.51487, -1.99419, 1, 0.5411765, 0, 1,
-1.378376, -0.1544359, -0.3459991, 1, 0.5450981, 0, 1,
-1.356427, 1.975371, -1.653683, 1, 0.5529412, 0, 1,
-1.347466, -1.434191, -3.367876, 1, 0.5568628, 0, 1,
-1.333514, 1.103508, 0.4771735, 1, 0.5647059, 0, 1,
-1.315425, -0.7549698, -0.6230179, 1, 0.5686275, 0, 1,
-1.293204, -0.4940943, -0.6972745, 1, 0.5764706, 0, 1,
-1.290118, -1.314913, -2.399983, 1, 0.5803922, 0, 1,
-1.289956, 0.6329979, -0.8702551, 1, 0.5882353, 0, 1,
-1.262805, -1.169003, -3.221331, 1, 0.5921569, 0, 1,
-1.261398, -1.628039, -2.291678, 1, 0.6, 0, 1,
-1.261005, -1.395097, -2.25608, 1, 0.6078432, 0, 1,
-1.250622, 1.237724, -1.389252, 1, 0.6117647, 0, 1,
-1.247889, -0.3040257, -2.840207, 1, 0.6196079, 0, 1,
-1.242763, -0.9426653, -1.898238, 1, 0.6235294, 0, 1,
-1.240296, 1.066253, 0.2473891, 1, 0.6313726, 0, 1,
-1.21622, -0.7909878, -2.009727, 1, 0.6352941, 0, 1,
-1.215677, 0.4963878, 1.490578, 1, 0.6431373, 0, 1,
-1.208797, 1.170405, 0.6802251, 1, 0.6470588, 0, 1,
-1.207655, -1.050726, -2.49462, 1, 0.654902, 0, 1,
-1.205475, 0.6842884, 0.5562325, 1, 0.6588235, 0, 1,
-1.205289, 0.9393913, -0.6278383, 1, 0.6666667, 0, 1,
-1.198275, 1.398667, -2.029719, 1, 0.6705883, 0, 1,
-1.194132, -1.482399, -0.9657532, 1, 0.6784314, 0, 1,
-1.189264, 1.536067, -0.00134294, 1, 0.682353, 0, 1,
-1.18502, 1.025701, -1.615628, 1, 0.6901961, 0, 1,
-1.177463, 0.5893068, -1.310046, 1, 0.6941177, 0, 1,
-1.172807, 0.2225855, -1.961554, 1, 0.7019608, 0, 1,
-1.170185, 1.123358, -0.4571356, 1, 0.7098039, 0, 1,
-1.168647, 1.050054, 0.1117934, 1, 0.7137255, 0, 1,
-1.166393, -0.4306836, -3.634059, 1, 0.7215686, 0, 1,
-1.161861, 0.4452557, -0.06243179, 1, 0.7254902, 0, 1,
-1.154135, 0.1177114, -2.388274, 1, 0.7333333, 0, 1,
-1.153138, 2.591079, -0.3793395, 1, 0.7372549, 0, 1,
-1.147848, 0.541886, -2.062852, 1, 0.7450981, 0, 1,
-1.139593, -0.3292952, -1.807279, 1, 0.7490196, 0, 1,
-1.135602, -1.304548, -0.7299435, 1, 0.7568628, 0, 1,
-1.131742, 0.4472196, 0.4581533, 1, 0.7607843, 0, 1,
-1.125578, 0.2507252, -0.896049, 1, 0.7686275, 0, 1,
-1.108812, -1.439856, -3.623143, 1, 0.772549, 0, 1,
-1.10328, -0.21054, -0.2769884, 1, 0.7803922, 0, 1,
-1.102866, 1.046144, -0.9320982, 1, 0.7843137, 0, 1,
-1.094156, 0.4186327, -1.331559, 1, 0.7921569, 0, 1,
-1.085114, -0.590561, -0.3165292, 1, 0.7960784, 0, 1,
-1.083028, 0.04781597, -1.018932, 1, 0.8039216, 0, 1,
-1.078818, -0.04729381, -2.325295, 1, 0.8117647, 0, 1,
-1.076952, 0.3318447, -1.343362, 1, 0.8156863, 0, 1,
-1.076668, -1.265924, -1.273997, 1, 0.8235294, 0, 1,
-1.075568, 0.3331117, -1.285982, 1, 0.827451, 0, 1,
-1.073217, 0.3726618, -2.035756, 1, 0.8352941, 0, 1,
-1.073037, 0.7829745, -0.4769335, 1, 0.8392157, 0, 1,
-1.069227, -1.372864, -2.978539, 1, 0.8470588, 0, 1,
-1.065985, 2.08884, -0.4184164, 1, 0.8509804, 0, 1,
-1.064291, 1.283581, -1.209188, 1, 0.8588235, 0, 1,
-1.06352, -0.6813812, -2.696861, 1, 0.8627451, 0, 1,
-1.061924, 0.01962764, -1.921309, 1, 0.8705882, 0, 1,
-1.052123, 0.4218494, -2.488404, 1, 0.8745098, 0, 1,
-1.049538, -0.05029034, -0.6376314, 1, 0.8823529, 0, 1,
-1.046942, 2.291604, -0.6719861, 1, 0.8862745, 0, 1,
-1.043326, 0.3906017, -2.892755, 1, 0.8941177, 0, 1,
-1.037727, 0.4487386, -0.6109171, 1, 0.8980392, 0, 1,
-1.031963, 1.071648, -2.575046, 1, 0.9058824, 0, 1,
-1.030595, 0.5633137, -1.419034, 1, 0.9137255, 0, 1,
-1.02066, 0.8216272, 0.1149203, 1, 0.9176471, 0, 1,
-1.019888, -1.666663, -2.929601, 1, 0.9254902, 0, 1,
-1.01446, -1.321293, -3.725941, 1, 0.9294118, 0, 1,
-1.008609, -0.05032059, -1.43734, 1, 0.9372549, 0, 1,
-0.9967793, -1.521805, -1.71355, 1, 0.9411765, 0, 1,
-0.9960885, -0.02038183, -1.425347, 1, 0.9490196, 0, 1,
-0.985028, 0.4944162, 0.8155438, 1, 0.9529412, 0, 1,
-0.984552, 0.5220826, -0.8574516, 1, 0.9607843, 0, 1,
-0.9833373, 0.2458907, 0.7065099, 1, 0.9647059, 0, 1,
-0.9725324, 0.3837127, -1.198333, 1, 0.972549, 0, 1,
-0.9658379, 1.373149, -2.346719, 1, 0.9764706, 0, 1,
-0.9630577, -0.1622533, -1.732922, 1, 0.9843137, 0, 1,
-0.9629453, 0.3564979, -1.113057, 1, 0.9882353, 0, 1,
-0.9584972, 2.350364, -1.383037, 1, 0.9960784, 0, 1,
-0.9529176, 1.219318, -0.06981497, 0.9960784, 1, 0, 1,
-0.944148, -0.5120057, -1.809917, 0.9921569, 1, 0, 1,
-0.9436039, -0.06522627, -2.385979, 0.9843137, 1, 0, 1,
-0.933926, 1.282257, -2.588788, 0.9803922, 1, 0, 1,
-0.9322683, -0.138272, -1.18711, 0.972549, 1, 0, 1,
-0.9235965, 0.08369678, -3.465531, 0.9686275, 1, 0, 1,
-0.9233702, 0.5831218, 0.9151703, 0.9607843, 1, 0, 1,
-0.9218887, 0.6904914, 0.3639199, 0.9568627, 1, 0, 1,
-0.9180329, -0.5634084, -0.5178902, 0.9490196, 1, 0, 1,
-0.9177087, -0.7993628, -3.379686, 0.945098, 1, 0, 1,
-0.9166635, 0.2664409, -0.7140326, 0.9372549, 1, 0, 1,
-0.9162263, 0.6994692, -1.630892, 0.9333333, 1, 0, 1,
-0.9057525, 1.353073, -0.1630161, 0.9254902, 1, 0, 1,
-0.8927975, -1.150584, -2.750482, 0.9215686, 1, 0, 1,
-0.8847158, 0.401893, -0.4367967, 0.9137255, 1, 0, 1,
-0.8674877, 0.5859, -1.996502, 0.9098039, 1, 0, 1,
-0.8637283, -0.9140259, -4.684209, 0.9019608, 1, 0, 1,
-0.8583222, -1.063261, -4.684753, 0.8941177, 1, 0, 1,
-0.8527918, -1.336534, -2.726411, 0.8901961, 1, 0, 1,
-0.8474678, 0.320927, 0.04547435, 0.8823529, 1, 0, 1,
-0.8460476, -0.6284098, -2.583481, 0.8784314, 1, 0, 1,
-0.8441173, 0.9065322, 0.7531672, 0.8705882, 1, 0, 1,
-0.8420594, 1.726576, -0.9585184, 0.8666667, 1, 0, 1,
-0.8406052, 0.5978183, -0.5846223, 0.8588235, 1, 0, 1,
-0.8399011, 0.5453286, 1.127633, 0.854902, 1, 0, 1,
-0.8373946, 0.6526811, -0.6634196, 0.8470588, 1, 0, 1,
-0.833461, 1.03309, -1.124444, 0.8431373, 1, 0, 1,
-0.8332177, -0.4872555, -3.447423, 0.8352941, 1, 0, 1,
-0.8322807, -0.3470715, -0.8099466, 0.8313726, 1, 0, 1,
-0.829981, 1.441772, -1.421938, 0.8235294, 1, 0, 1,
-0.8252071, -0.4647275, -2.922073, 0.8196079, 1, 0, 1,
-0.82416, 0.2598042, 0.9115092, 0.8117647, 1, 0, 1,
-0.8230146, 0.4128761, -1.084369, 0.8078431, 1, 0, 1,
-0.8203753, -0.6726357, -2.602124, 0.8, 1, 0, 1,
-0.8200808, -1.524304, -3.533433, 0.7921569, 1, 0, 1,
-0.811188, 0.6573583, -1.016739, 0.7882353, 1, 0, 1,
-0.8087251, -0.8765489, -3.01017, 0.7803922, 1, 0, 1,
-0.8084804, 1.141367, 0.8478243, 0.7764706, 1, 0, 1,
-0.8076941, -0.4746014, -0.8597714, 0.7686275, 1, 0, 1,
-0.7970925, 1.794677, -0.8241601, 0.7647059, 1, 0, 1,
-0.7960845, 0.5269803, -0.2917511, 0.7568628, 1, 0, 1,
-0.7919573, -0.6497703, -3.008369, 0.7529412, 1, 0, 1,
-0.7916254, -1.88627, -2.813898, 0.7450981, 1, 0, 1,
-0.7908744, 1.081328, -1.766955, 0.7411765, 1, 0, 1,
-0.7878096, 0.2808366, -0.9409658, 0.7333333, 1, 0, 1,
-0.7851825, -0.0920124, -2.891888, 0.7294118, 1, 0, 1,
-0.782101, 1.379045, -1.258964, 0.7215686, 1, 0, 1,
-0.7808937, -0.6850986, -4.094228, 0.7176471, 1, 0, 1,
-0.7794192, -0.3412958, -2.130436, 0.7098039, 1, 0, 1,
-0.7791814, 0.6064897, -1.360086, 0.7058824, 1, 0, 1,
-0.7713825, -0.5552366, -3.158776, 0.6980392, 1, 0, 1,
-0.7631142, -1.513958, -3.506678, 0.6901961, 1, 0, 1,
-0.7594876, -0.06601737, -1.572189, 0.6862745, 1, 0, 1,
-0.7439421, -0.5532199, -1.28238, 0.6784314, 1, 0, 1,
-0.7388926, -0.9487461, -2.482628, 0.6745098, 1, 0, 1,
-0.7311048, -1.574607, -3.383476, 0.6666667, 1, 0, 1,
-0.7287562, 0.4836501, -1.050449, 0.6627451, 1, 0, 1,
-0.7279807, -0.3101103, -2.88219, 0.654902, 1, 0, 1,
-0.7261462, -0.6366065, -1.512394, 0.6509804, 1, 0, 1,
-0.723109, -0.3880447, -2.191198, 0.6431373, 1, 0, 1,
-0.7152619, -0.1626901, -2.291708, 0.6392157, 1, 0, 1,
-0.7030141, -1.283522, -3.030943, 0.6313726, 1, 0, 1,
-0.6997997, -0.303879, -1.241832, 0.627451, 1, 0, 1,
-0.6928181, 0.6169685, -1.184086, 0.6196079, 1, 0, 1,
-0.6890265, -0.824992, -1.746739, 0.6156863, 1, 0, 1,
-0.6864458, -1.723613, -3.004826, 0.6078432, 1, 0, 1,
-0.6818108, 1.906748, -0.4106666, 0.6039216, 1, 0, 1,
-0.6808252, -0.9634827, -2.270988, 0.5960785, 1, 0, 1,
-0.6806035, -0.3724134, -2.538152, 0.5882353, 1, 0, 1,
-0.676034, -2.132811, -2.035659, 0.5843138, 1, 0, 1,
-0.6715288, 0.5412955, -0.5473928, 0.5764706, 1, 0, 1,
-0.6705593, 0.128098, -2.494905, 0.572549, 1, 0, 1,
-0.6690719, 1.253225, 0.8105429, 0.5647059, 1, 0, 1,
-0.6677886, -0.3893738, -4.077639, 0.5607843, 1, 0, 1,
-0.6672138, -1.471355, -1.566864, 0.5529412, 1, 0, 1,
-0.6661888, -0.7081442, -2.296041, 0.5490196, 1, 0, 1,
-0.6595684, -0.0186074, 0.6725443, 0.5411765, 1, 0, 1,
-0.6573273, -1.482823, -3.041972, 0.5372549, 1, 0, 1,
-0.6564569, -0.2874206, 0.2100942, 0.5294118, 1, 0, 1,
-0.6525331, -1.768587, -1.78842, 0.5254902, 1, 0, 1,
-0.6489451, 0.5816988, -1.980367, 0.5176471, 1, 0, 1,
-0.6466582, -0.8666088, -1.04088, 0.5137255, 1, 0, 1,
-0.6448181, -0.4163779, -2.235877, 0.5058824, 1, 0, 1,
-0.640682, -1.093902, -1.692219, 0.5019608, 1, 0, 1,
-0.6403806, 1.419114, -0.5758657, 0.4941176, 1, 0, 1,
-0.639784, -0.1074672, -0.8184258, 0.4862745, 1, 0, 1,
-0.6383916, -0.4975518, -3.138782, 0.4823529, 1, 0, 1,
-0.6346781, 0.2771306, -0.2948107, 0.4745098, 1, 0, 1,
-0.6306019, 1.809969, 0.3205588, 0.4705882, 1, 0, 1,
-0.6285537, 1.497527, 1.032609, 0.4627451, 1, 0, 1,
-0.6285403, -0.4772518, -1.715967, 0.4588235, 1, 0, 1,
-0.6247111, 0.5545024, -0.9281833, 0.4509804, 1, 0, 1,
-0.6145582, -0.8865555, -2.230585, 0.4470588, 1, 0, 1,
-0.6135334, 0.6233633, 0.2000061, 0.4392157, 1, 0, 1,
-0.6086559, -1.589306, -2.975519, 0.4352941, 1, 0, 1,
-0.6077316, 0.07965867, -1.736959, 0.427451, 1, 0, 1,
-0.6021931, -1.237132, -2.218461, 0.4235294, 1, 0, 1,
-0.5985561, 1.340481, -0.543985, 0.4156863, 1, 0, 1,
-0.5943441, -0.9848385, -3.530559, 0.4117647, 1, 0, 1,
-0.5933881, -0.1040291, -3.712502, 0.4039216, 1, 0, 1,
-0.5876861, 0.8236582, 0.4268478, 0.3960784, 1, 0, 1,
-0.5855952, 0.4189517, -0.3930291, 0.3921569, 1, 0, 1,
-0.5846192, 0.4460963, 0.05236371, 0.3843137, 1, 0, 1,
-0.5833356, 1.321852, 0.1166416, 0.3803922, 1, 0, 1,
-0.5805969, -0.4900674, -2.759413, 0.372549, 1, 0, 1,
-0.5733832, 0.7422723, 1.065341, 0.3686275, 1, 0, 1,
-0.570742, 0.5034562, -0.3124705, 0.3607843, 1, 0, 1,
-0.566093, -1.070832, -3.010458, 0.3568628, 1, 0, 1,
-0.5638522, -0.8319153, -5.326339, 0.3490196, 1, 0, 1,
-0.5566582, -0.7095222, -4.202261, 0.345098, 1, 0, 1,
-0.5553958, -1.830569, -2.563904, 0.3372549, 1, 0, 1,
-0.554917, -0.2378701, -1.520662, 0.3333333, 1, 0, 1,
-0.554438, 0.07444902, -2.253179, 0.3254902, 1, 0, 1,
-0.5522427, 0.6862962, 0.03479885, 0.3215686, 1, 0, 1,
-0.5505778, 0.2608754, -0.8089861, 0.3137255, 1, 0, 1,
-0.5472921, -0.3265237, -3.574327, 0.3098039, 1, 0, 1,
-0.5457775, 0.5827807, 0.2410883, 0.3019608, 1, 0, 1,
-0.5450886, -0.3134806, -2.602258, 0.2941177, 1, 0, 1,
-0.5424246, 0.5727129, 0.0596832, 0.2901961, 1, 0, 1,
-0.5326809, 0.04510633, -3.085055, 0.282353, 1, 0, 1,
-0.5305293, 2.111088, -0.7176144, 0.2784314, 1, 0, 1,
-0.5279974, 0.9700966, -2.846595, 0.2705882, 1, 0, 1,
-0.5247822, 1.248438, 0.1469235, 0.2666667, 1, 0, 1,
-0.5183846, 0.1886227, -0.8021684, 0.2588235, 1, 0, 1,
-0.518042, 0.5437822, -0.9891898, 0.254902, 1, 0, 1,
-0.5172189, -1.404798, -3.177723, 0.2470588, 1, 0, 1,
-0.5170159, -1.399802, -3.813888, 0.2431373, 1, 0, 1,
-0.5169917, -0.3679782, -3.884015, 0.2352941, 1, 0, 1,
-0.5153123, 0.50046, -0.4439798, 0.2313726, 1, 0, 1,
-0.5127335, -0.7523773, -3.812839, 0.2235294, 1, 0, 1,
-0.5102916, 1.096225, -0.09895917, 0.2196078, 1, 0, 1,
-0.5045645, 0.02322227, -0.9781106, 0.2117647, 1, 0, 1,
-0.5039171, 0.4922928, -0.7554884, 0.2078431, 1, 0, 1,
-0.502696, 0.9772475, -0.7329819, 0.2, 1, 0, 1,
-0.4970765, -0.7332192, -2.298486, 0.1921569, 1, 0, 1,
-0.4960991, 0.5058478, -0.756267, 0.1882353, 1, 0, 1,
-0.4860289, 0.4860097, -1.218652, 0.1803922, 1, 0, 1,
-0.4846793, 0.2695791, 0.6627719, 0.1764706, 1, 0, 1,
-0.483087, 0.5005881, -0.003508025, 0.1686275, 1, 0, 1,
-0.4823702, 0.1770143, -0.007395287, 0.1647059, 1, 0, 1,
-0.4815754, -1.104989, -3.185999, 0.1568628, 1, 0, 1,
-0.4647003, 0.05783823, -0.8313636, 0.1529412, 1, 0, 1,
-0.4642769, 1.983161, -0.1217171, 0.145098, 1, 0, 1,
-0.462357, 1.531829, 0.6635236, 0.1411765, 1, 0, 1,
-0.4623494, -0.1013412, -1.295092, 0.1333333, 1, 0, 1,
-0.4614772, -0.419064, -2.987958, 0.1294118, 1, 0, 1,
-0.460727, -0.6178011, -3.669674, 0.1215686, 1, 0, 1,
-0.4572622, -0.09506742, -1.024409, 0.1176471, 1, 0, 1,
-0.4482406, -0.6576583, -2.665288, 0.1098039, 1, 0, 1,
-0.4424366, -0.4342026, -2.677618, 0.1058824, 1, 0, 1,
-0.4414501, 0.07261064, -2.795536, 0.09803922, 1, 0, 1,
-0.4389641, -0.0787286, -1.172382, 0.09019608, 1, 0, 1,
-0.438826, 0.1833083, -1.889457, 0.08627451, 1, 0, 1,
-0.4385565, 0.2512597, -0.5395788, 0.07843138, 1, 0, 1,
-0.4358205, 0.03329509, -2.666991, 0.07450981, 1, 0, 1,
-0.430597, -0.2953822, -1.851175, 0.06666667, 1, 0, 1,
-0.428522, 0.8565396, -0.7061327, 0.0627451, 1, 0, 1,
-0.4257858, 1.298532, 0.4369853, 0.05490196, 1, 0, 1,
-0.4243236, -0.3507641, -1.785134, 0.05098039, 1, 0, 1,
-0.418826, -0.5892267, -3.394735, 0.04313726, 1, 0, 1,
-0.4166461, -0.2334698, -2.616973, 0.03921569, 1, 0, 1,
-0.4146329, -0.7199596, -3.389504, 0.03137255, 1, 0, 1,
-0.4140149, -0.2200814, -3.113975, 0.02745098, 1, 0, 1,
-0.4125036, 0.2694409, 0.3704749, 0.01960784, 1, 0, 1,
-0.4081547, -1.202332, -2.190838, 0.01568628, 1, 0, 1,
-0.4052942, 0.3073471, -2.119105, 0.007843138, 1, 0, 1,
-0.4047428, -1.116387, -2.306674, 0.003921569, 1, 0, 1,
-0.4036236, 1.140212, -0.2931539, 0, 1, 0.003921569, 1,
-0.4029721, -1.114762, -4.5026, 0, 1, 0.01176471, 1,
-0.4025053, -0.9301815, -1.928494, 0, 1, 0.01568628, 1,
-0.4012559, 0.1222329, -3.294308, 0, 1, 0.02352941, 1,
-0.398741, 0.5150602, -1.481721, 0, 1, 0.02745098, 1,
-0.3971846, 1.249189, 0.3837881, 0, 1, 0.03529412, 1,
-0.3961989, 0.0292172, -2.344323, 0, 1, 0.03921569, 1,
-0.3860528, -0.3783599, -1.763175, 0, 1, 0.04705882, 1,
-0.385395, 0.2676854, -1.348642, 0, 1, 0.05098039, 1,
-0.3828066, 0.1772304, -0.778046, 0, 1, 0.05882353, 1,
-0.3793098, -0.3932044, -2.396412, 0, 1, 0.0627451, 1,
-0.3648437, -0.2333193, -0.5507091, 0, 1, 0.07058824, 1,
-0.362975, -0.04293276, -0.4262084, 0, 1, 0.07450981, 1,
-0.3626086, 2.089708, -0.747505, 0, 1, 0.08235294, 1,
-0.3623425, -0.1879093, -2.61463, 0, 1, 0.08627451, 1,
-0.3595477, -0.9856423, -2.349296, 0, 1, 0.09411765, 1,
-0.3588271, 0.7160476, -0.02993758, 0, 1, 0.1019608, 1,
-0.358088, -1.379942, -4.101605, 0, 1, 0.1058824, 1,
-0.3558105, 1.050052, -2.914614, 0, 1, 0.1137255, 1,
-0.3557157, -1.771242, -2.869483, 0, 1, 0.1176471, 1,
-0.3549718, 0.3540967, 0.8561391, 0, 1, 0.1254902, 1,
-0.3483103, 0.07838439, -0.6931257, 0, 1, 0.1294118, 1,
-0.3456069, -0.4208651, -0.7689435, 0, 1, 0.1372549, 1,
-0.3445031, -0.3311073, -2.573075, 0, 1, 0.1411765, 1,
-0.3433539, 0.3743855, -2.802595, 0, 1, 0.1490196, 1,
-0.3432231, -0.1642379, -0.8226407, 0, 1, 0.1529412, 1,
-0.3411305, 1.031784, 1.940594, 0, 1, 0.1607843, 1,
-0.3403213, -0.5747752, -1.389076, 0, 1, 0.1647059, 1,
-0.3398468, -0.4150221, -2.20171, 0, 1, 0.172549, 1,
-0.3335499, 1.411214, 0.1005664, 0, 1, 0.1764706, 1,
-0.3323288, -1.359503, -2.648599, 0, 1, 0.1843137, 1,
-0.3272017, 0.9541261, 0.4785494, 0, 1, 0.1882353, 1,
-0.3224016, -0.9675749, -2.529652, 0, 1, 0.1960784, 1,
-0.3201007, -1.136458, -3.449139, 0, 1, 0.2039216, 1,
-0.3199855, 1.124215, 0.08936536, 0, 1, 0.2078431, 1,
-0.3193485, -0.7717378, -2.485739, 0, 1, 0.2156863, 1,
-0.317847, -0.5938966, -1.877308, 0, 1, 0.2196078, 1,
-0.310528, 0.5180752, -0.7174168, 0, 1, 0.227451, 1,
-0.3068004, 0.878942, -0.4070402, 0, 1, 0.2313726, 1,
-0.3046313, -0.4668728, -2.995444, 0, 1, 0.2392157, 1,
-0.3031632, -0.8758657, -3.191619, 0, 1, 0.2431373, 1,
-0.302372, 1.026803, -1.703129, 0, 1, 0.2509804, 1,
-0.3008314, 1.759556, -0.3798875, 0, 1, 0.254902, 1,
-0.3002665, -0.4454015, -2.29827, 0, 1, 0.2627451, 1,
-0.2996055, -0.1621132, -2.635955, 0, 1, 0.2666667, 1,
-0.2991976, 0.6158566, -1.661127, 0, 1, 0.2745098, 1,
-0.2969549, 0.5128189, 0.5913205, 0, 1, 0.2784314, 1,
-0.2920573, 0.4916076, -0.813301, 0, 1, 0.2862745, 1,
-0.2867686, -1.725982, -3.469878, 0, 1, 0.2901961, 1,
-0.2862598, -0.7985129, -2.18293, 0, 1, 0.2980392, 1,
-0.2847193, -0.3485027, -2.134159, 0, 1, 0.3058824, 1,
-0.2845723, 0.5829948, -1.711761, 0, 1, 0.3098039, 1,
-0.2786655, 1.980455, 0.02201432, 0, 1, 0.3176471, 1,
-0.2772728, 0.548867, -0.02043321, 0, 1, 0.3215686, 1,
-0.2772565, -0.6783168, -1.88225, 0, 1, 0.3294118, 1,
-0.2749831, 0.7984741, -1.108847, 0, 1, 0.3333333, 1,
-0.2730239, 0.09727354, -2.102199, 0, 1, 0.3411765, 1,
-0.2721561, -1.677755, -3.654047, 0, 1, 0.345098, 1,
-0.2673894, 0.4610742, -1.235363, 0, 1, 0.3529412, 1,
-0.265002, -0.06120697, -1.142498, 0, 1, 0.3568628, 1,
-0.2623944, 0.8715694, 1.358933, 0, 1, 0.3647059, 1,
-0.2574525, 0.6151881, -0.603373, 0, 1, 0.3686275, 1,
-0.2452092, -0.4285106, -3.317924, 0, 1, 0.3764706, 1,
-0.2440197, -0.1607275, -2.705496, 0, 1, 0.3803922, 1,
-0.2410799, -1.251721, -2.581509, 0, 1, 0.3882353, 1,
-0.2401429, 0.8014072, 0.4606, 0, 1, 0.3921569, 1,
-0.2389686, -0.6048344, -4.130541, 0, 1, 0.4, 1,
-0.23761, 0.04913596, 1.567183, 0, 1, 0.4078431, 1,
-0.237164, 2.408557, -0.7631664, 0, 1, 0.4117647, 1,
-0.2364026, -0.3020255, -2.382466, 0, 1, 0.4196078, 1,
-0.2355743, -0.2776851, -3.840996, 0, 1, 0.4235294, 1,
-0.2352373, 1.240378, 0.1489517, 0, 1, 0.4313726, 1,
-0.2255685, 1.155553, -0.227183, 0, 1, 0.4352941, 1,
-0.2249426, -1.301968, -3.587831, 0, 1, 0.4431373, 1,
-0.2189352, -0.2264443, -1.986251, 0, 1, 0.4470588, 1,
-0.218533, 0.8098674, -0.5180153, 0, 1, 0.454902, 1,
-0.2072535, -1.551376, -2.099923, 0, 1, 0.4588235, 1,
-0.2066791, 1.476743, -0.4959994, 0, 1, 0.4666667, 1,
-0.2057251, -0.3020991, -2.008155, 0, 1, 0.4705882, 1,
-0.2053422, -0.5743016, -1.464644, 0, 1, 0.4784314, 1,
-0.2013882, -0.7901305, -3.045225, 0, 1, 0.4823529, 1,
-0.1915254, -2.098156, -3.62505, 0, 1, 0.4901961, 1,
-0.1832131, -0.357926, -3.322952, 0, 1, 0.4941176, 1,
-0.1820243, 1.045881, 0.2788349, 0, 1, 0.5019608, 1,
-0.1816297, -0.1833353, -4.10027, 0, 1, 0.509804, 1,
-0.1803921, -0.1118006, -2.389557, 0, 1, 0.5137255, 1,
-0.1803785, -1.16146, -4.288982, 0, 1, 0.5215687, 1,
-0.1780567, 0.6624942, -0.6181844, 0, 1, 0.5254902, 1,
-0.1779994, -0.07241543, -0.9593114, 0, 1, 0.5333334, 1,
-0.1760164, -1.391584, -2.239274, 0, 1, 0.5372549, 1,
-0.1759534, 1.376821, -0.9307212, 0, 1, 0.5450981, 1,
-0.1751529, 1.075677, -0.1115316, 0, 1, 0.5490196, 1,
-0.1714707, -0.2058949, -3.562201, 0, 1, 0.5568628, 1,
-0.1647016, -1.274029, -2.423601, 0, 1, 0.5607843, 1,
-0.1632365, -1.174697, -5.876797, 0, 1, 0.5686275, 1,
-0.1623514, -0.4228247, -2.535415, 0, 1, 0.572549, 1,
-0.1607814, -0.9106298, -4.178327, 0, 1, 0.5803922, 1,
-0.1581079, 1.705244, -0.3434699, 0, 1, 0.5843138, 1,
-0.1577301, 0.595229, -0.925492, 0, 1, 0.5921569, 1,
-0.1556901, -0.8145489, -3.239607, 0, 1, 0.5960785, 1,
-0.1527476, -1.058017, -1.491131, 0, 1, 0.6039216, 1,
-0.1502676, -0.6305467, -2.596104, 0, 1, 0.6117647, 1,
-0.1462436, -0.4303928, -1.875376, 0, 1, 0.6156863, 1,
-0.1446804, 1.131065, -0.02933641, 0, 1, 0.6235294, 1,
-0.1433572, 0.0971825, -1.83279, 0, 1, 0.627451, 1,
-0.1423893, -0.3899528, -2.226175, 0, 1, 0.6352941, 1,
-0.1388666, 1.144013, 1.092567, 0, 1, 0.6392157, 1,
-0.1368712, 1.225911, 1.56407, 0, 1, 0.6470588, 1,
-0.1362982, 0.2303175, 0.3768828, 0, 1, 0.6509804, 1,
-0.1341245, 1.321096, 0.5053364, 0, 1, 0.6588235, 1,
-0.1253704, 1.077036, -0.7767265, 0, 1, 0.6627451, 1,
-0.123881, 0.1159496, -1.06504, 0, 1, 0.6705883, 1,
-0.121729, 0.3452823, -0.3990913, 0, 1, 0.6745098, 1,
-0.1191272, -0.4680626, -5.501431, 0, 1, 0.682353, 1,
-0.1175493, 1.943676, 0.2383351, 0, 1, 0.6862745, 1,
-0.1148514, 0.5317273, -1.101681, 0, 1, 0.6941177, 1,
-0.1147881, -1.909824, -2.921273, 0, 1, 0.7019608, 1,
-0.1137117, 1.189365, -2.210386, 0, 1, 0.7058824, 1,
-0.1121709, 0.8531206, -2.150909, 0, 1, 0.7137255, 1,
-0.111541, 1.340181, -0.7057886, 0, 1, 0.7176471, 1,
-0.1090765, -0.6396212, -2.291675, 0, 1, 0.7254902, 1,
-0.1069578, 1.050485, -0.1049556, 0, 1, 0.7294118, 1,
-0.1048491, 1.80105, 0.07814745, 0, 1, 0.7372549, 1,
-0.1031169, -0.9154781, -3.290214, 0, 1, 0.7411765, 1,
-0.1028626, -1.357895, -2.183963, 0, 1, 0.7490196, 1,
-0.1018901, 1.308259, 1.766706, 0, 1, 0.7529412, 1,
-0.1004049, -1.012064, -2.869412, 0, 1, 0.7607843, 1,
-0.09521106, -0.7328702, -4.522691, 0, 1, 0.7647059, 1,
-0.09498139, -0.2735213, -3.321855, 0, 1, 0.772549, 1,
-0.093352, 0.1582834, -0.1801113, 0, 1, 0.7764706, 1,
-0.08915466, 0.00641731, -1.3216, 0, 1, 0.7843137, 1,
-0.0888322, 0.33973, -1.362582, 0, 1, 0.7882353, 1,
-0.08333084, -0.3736764, -3.433949, 0, 1, 0.7960784, 1,
-0.08207036, 0.187616, -0.7653167, 0, 1, 0.8039216, 1,
-0.08068608, 0.3139938, -0.6614468, 0, 1, 0.8078431, 1,
-0.07948883, -1.345519, -3.28079, 0, 1, 0.8156863, 1,
-0.07744472, -1.698002, -2.832519, 0, 1, 0.8196079, 1,
-0.06963666, -1.003845, -4.459375, 0, 1, 0.827451, 1,
-0.06950951, -1.747913, -2.207362, 0, 1, 0.8313726, 1,
-0.06512912, -0.5192851, -4.720095, 0, 1, 0.8392157, 1,
-0.06394862, 0.6903166, -1.503726, 0, 1, 0.8431373, 1,
-0.06020211, -0.00319539, -2.189627, 0, 1, 0.8509804, 1,
-0.05682102, -0.1822197, -1.370669, 0, 1, 0.854902, 1,
-0.05393218, -0.5844437, -3.011668, 0, 1, 0.8627451, 1,
-0.05311929, 2.507726, 0.2410483, 0, 1, 0.8666667, 1,
-0.0521965, 2.665197, 0.06013231, 0, 1, 0.8745098, 1,
-0.05215914, -1.856328, -2.574762, 0, 1, 0.8784314, 1,
-0.04749451, 1.078614, -0.3353363, 0, 1, 0.8862745, 1,
-0.0471713, -2.116684, -4.144396, 0, 1, 0.8901961, 1,
-0.04580601, -1.897545, -1.886583, 0, 1, 0.8980392, 1,
-0.04498875, -0.1198232, -2.681618, 0, 1, 0.9058824, 1,
-0.04253118, 0.8722212, -1.013751, 0, 1, 0.9098039, 1,
-0.04081374, 0.1339538, -0.1318604, 0, 1, 0.9176471, 1,
-0.0403908, -0.2963719, -3.57775, 0, 1, 0.9215686, 1,
-0.03943494, -0.3798548, -3.882255, 0, 1, 0.9294118, 1,
-0.03848662, -0.04362907, -2.422855, 0, 1, 0.9333333, 1,
-0.0312265, 0.3663308, -0.7300498, 0, 1, 0.9411765, 1,
-0.02466024, 0.8521503, 0.6292967, 0, 1, 0.945098, 1,
-0.02255776, 0.680618, -1.02776, 0, 1, 0.9529412, 1,
-0.02101423, -0.2202478, -3.85712, 0, 1, 0.9568627, 1,
-0.0145361, -0.01968307, -3.698402, 0, 1, 0.9647059, 1,
-0.01427961, -0.7092709, -2.790191, 0, 1, 0.9686275, 1,
-0.01376537, -1.076763, -3.851593, 0, 1, 0.9764706, 1,
-0.01327132, 0.03538842, -0.3135157, 0, 1, 0.9803922, 1,
-0.01078717, 0.4851114, -0.4635692, 0, 1, 0.9882353, 1,
-0.009303959, -0.4839168, -2.63284, 0, 1, 0.9921569, 1,
-0.008863571, 0.01651299, -1.31984, 0, 1, 1, 1,
-0.004204581, -0.01109977, -3.003448, 0, 0.9921569, 1, 1,
0.001847544, 1.283629, 1.209205, 0, 0.9882353, 1, 1,
0.002162649, -0.4765791, 3.722242, 0, 0.9803922, 1, 1,
0.003089113, 0.4506744, 0.7203879, 0, 0.9764706, 1, 1,
0.003553114, 0.3496428, -0.4765196, 0, 0.9686275, 1, 1,
0.005771202, -0.3461921, 4.419731, 0, 0.9647059, 1, 1,
0.008698124, 0.851763, -1.298655, 0, 0.9568627, 1, 1,
0.009069288, -0.5028279, 3.172006, 0, 0.9529412, 1, 1,
0.01214971, -0.1815165, 2.366623, 0, 0.945098, 1, 1,
0.01471021, 0.1552445, -2.252994, 0, 0.9411765, 1, 1,
0.01673401, 0.8797677, -0.6469169, 0, 0.9333333, 1, 1,
0.02042704, 0.3475871, 0.1701205, 0, 0.9294118, 1, 1,
0.02167592, -0.2218776, 2.016395, 0, 0.9215686, 1, 1,
0.02466347, -0.3540018, 4.08867, 0, 0.9176471, 1, 1,
0.02606302, -0.1026155, 1.109828, 0, 0.9098039, 1, 1,
0.02703265, -1.109744, 2.581128, 0, 0.9058824, 1, 1,
0.02719317, -0.3044645, 3.884067, 0, 0.8980392, 1, 1,
0.0273816, -0.4167097, 3.413311, 0, 0.8901961, 1, 1,
0.0283167, 2.00017, -0.5359013, 0, 0.8862745, 1, 1,
0.03127739, 1.387843, -0.6416117, 0, 0.8784314, 1, 1,
0.03193214, -1.050691, 2.772293, 0, 0.8745098, 1, 1,
0.03398952, -1.272572, 2.793001, 0, 0.8666667, 1, 1,
0.03586467, -0.02646664, 0.4188024, 0, 0.8627451, 1, 1,
0.0366309, -0.3072045, 3.795656, 0, 0.854902, 1, 1,
0.04094183, 0.05206871, 1.62075, 0, 0.8509804, 1, 1,
0.0420285, 0.03316876, 1.795297, 0, 0.8431373, 1, 1,
0.04718462, -0.07544514, 4.368232, 0, 0.8392157, 1, 1,
0.04814953, 1.006916, 1.922499, 0, 0.8313726, 1, 1,
0.04879538, -1.123603, 1.419814, 0, 0.827451, 1, 1,
0.05013779, 0.5429807, 1.738838, 0, 0.8196079, 1, 1,
0.05295461, 0.2484231, 0.7146649, 0, 0.8156863, 1, 1,
0.05470144, -0.2986006, 2.164442, 0, 0.8078431, 1, 1,
0.05851324, 0.640417, 2.389907, 0, 0.8039216, 1, 1,
0.061443, 0.6055617, -0.9457019, 0, 0.7960784, 1, 1,
0.06916582, 1.442115, 1.120251, 0, 0.7882353, 1, 1,
0.07044127, 0.0825808, -0.3733343, 0, 0.7843137, 1, 1,
0.07246202, -1.576429, 3.426953, 0, 0.7764706, 1, 1,
0.07367527, 0.749384, -0.7387299, 0, 0.772549, 1, 1,
0.07644601, -0.9948542, 3.895586, 0, 0.7647059, 1, 1,
0.07818334, 1.055734, 0.9699363, 0, 0.7607843, 1, 1,
0.07985008, 0.09550971, 2.701176, 0, 0.7529412, 1, 1,
0.08258088, -0.5887998, 5.260642, 0, 0.7490196, 1, 1,
0.08493823, 0.6355755, 0.5514753, 0, 0.7411765, 1, 1,
0.08628284, 0.5312836, -0.2787999, 0, 0.7372549, 1, 1,
0.08870688, 0.3284627, 0.221342, 0, 0.7294118, 1, 1,
0.08890051, -0.4826531, 3.055233, 0, 0.7254902, 1, 1,
0.09002316, 0.5411119, 1.326661, 0, 0.7176471, 1, 1,
0.09069339, -0.0699596, 2.822957, 0, 0.7137255, 1, 1,
0.09854481, 1.765607, -0.4720939, 0, 0.7058824, 1, 1,
0.1021769, 0.8067386, 1.775506, 0, 0.6980392, 1, 1,
0.1031086, 1.844147, -0.7080616, 0, 0.6941177, 1, 1,
0.1042796, 0.8500927, 1.572426, 0, 0.6862745, 1, 1,
0.1059927, 0.258104, 0.1560751, 0, 0.682353, 1, 1,
0.1077185, -0.2013736, 2.955205, 0, 0.6745098, 1, 1,
0.1089303, 0.8346563, 1.004786, 0, 0.6705883, 1, 1,
0.1092528, 0.2659833, 1.620112, 0, 0.6627451, 1, 1,
0.1096221, -0.5115307, 2.389834, 0, 0.6588235, 1, 1,
0.1135121, 0.4279411, -1.136326, 0, 0.6509804, 1, 1,
0.1147332, -0.355038, 3.079997, 0, 0.6470588, 1, 1,
0.1151805, 0.9137153, -0.2182664, 0, 0.6392157, 1, 1,
0.1213299, -0.06478855, 4.269775, 0, 0.6352941, 1, 1,
0.1218231, 0.1309623, 0.7565096, 0, 0.627451, 1, 1,
0.1246273, -0.9991221, 4.81956, 0, 0.6235294, 1, 1,
0.1291679, -0.5256357, 3.721767, 0, 0.6156863, 1, 1,
0.129856, 0.9099316, -1.176468, 0, 0.6117647, 1, 1,
0.130627, 1.286302, -0.1103746, 0, 0.6039216, 1, 1,
0.1317385, 0.2418695, 1.685379, 0, 0.5960785, 1, 1,
0.1334272, 0.4695468, -0.4610834, 0, 0.5921569, 1, 1,
0.1393865, -0.9557855, 2.033863, 0, 0.5843138, 1, 1,
0.1450029, 0.96385, 0.4378496, 0, 0.5803922, 1, 1,
0.1456858, 1.276399, 0.4154739, 0, 0.572549, 1, 1,
0.1468587, -0.7266399, 3.265307, 0, 0.5686275, 1, 1,
0.1468863, 0.1153142, 1.666614, 0, 0.5607843, 1, 1,
0.1499677, -1.587105, 3.620547, 0, 0.5568628, 1, 1,
0.1530873, 0.8165839, -0.4348326, 0, 0.5490196, 1, 1,
0.1624607, 1.009372, -0.9045165, 0, 0.5450981, 1, 1,
0.1640373, -0.4529506, 2.027819, 0, 0.5372549, 1, 1,
0.1652818, -1.953368, 1.92279, 0, 0.5333334, 1, 1,
0.1664139, -0.1595726, 1.168619, 0, 0.5254902, 1, 1,
0.1666006, 1.468841, 0.1523824, 0, 0.5215687, 1, 1,
0.1729108, 0.08751416, -0.4476796, 0, 0.5137255, 1, 1,
0.193857, 0.8823886, -0.7935007, 0, 0.509804, 1, 1,
0.1948597, 0.3416297, 0.8172519, 0, 0.5019608, 1, 1,
0.195717, 0.05678609, 0.4701975, 0, 0.4941176, 1, 1,
0.1967293, -0.3689404, 3.783489, 0, 0.4901961, 1, 1,
0.1978548, -0.181868, 1.939853, 0, 0.4823529, 1, 1,
0.1993981, 0.1013181, -0.4232721, 0, 0.4784314, 1, 1,
0.2003039, -0.8330845, 2.821416, 0, 0.4705882, 1, 1,
0.2027314, 0.5107503, -1.936868, 0, 0.4666667, 1, 1,
0.2038493, -1.395587, 1.52841, 0, 0.4588235, 1, 1,
0.2052079, -0.9258212, 3.414186, 0, 0.454902, 1, 1,
0.2061677, 0.1931842, -0.34508, 0, 0.4470588, 1, 1,
0.2065355, -1.402412, 3.195543, 0, 0.4431373, 1, 1,
0.2080476, -0.7358536, 4.922128, 0, 0.4352941, 1, 1,
0.2094948, 0.08492322, 1.842432, 0, 0.4313726, 1, 1,
0.2096861, 0.1898652, 0.7428451, 0, 0.4235294, 1, 1,
0.2115465, -0.5630712, 2.602319, 0, 0.4196078, 1, 1,
0.2127942, -1.213762, 2.729844, 0, 0.4117647, 1, 1,
0.2181879, 0.9647691, 0.05418634, 0, 0.4078431, 1, 1,
0.2226668, -0.4864446, 2.804751, 0, 0.4, 1, 1,
0.2278198, -0.4907547, 3.465285, 0, 0.3921569, 1, 1,
0.2336585, -1.473187, 2.5882, 0, 0.3882353, 1, 1,
0.2337427, 0.2507554, 1.5131, 0, 0.3803922, 1, 1,
0.2356608, 0.3794558, 1.119887, 0, 0.3764706, 1, 1,
0.2357148, -0.2364041, 1.858579, 0, 0.3686275, 1, 1,
0.2361484, -0.009133019, 0.4386452, 0, 0.3647059, 1, 1,
0.2393616, 0.2536664, 1.163411, 0, 0.3568628, 1, 1,
0.2464555, 0.3758242, 1.155093, 0, 0.3529412, 1, 1,
0.2474737, 0.1972886, -0.1457623, 0, 0.345098, 1, 1,
0.2518911, -2.445126, 1.779032, 0, 0.3411765, 1, 1,
0.253046, -0.1940925, 3.267901, 0, 0.3333333, 1, 1,
0.2537124, 0.2739283, 0.407288, 0, 0.3294118, 1, 1,
0.2540157, -0.7954342, 2.468809, 0, 0.3215686, 1, 1,
0.257098, 0.7319772, 0.2062352, 0, 0.3176471, 1, 1,
0.2571143, -0.7866614, 4.028439, 0, 0.3098039, 1, 1,
0.2580173, -1.820229, 2.230415, 0, 0.3058824, 1, 1,
0.260501, -0.5756053, 2.790322, 0, 0.2980392, 1, 1,
0.263491, -1.624259, 3.840379, 0, 0.2901961, 1, 1,
0.2646525, -0.1967278, 0.9796332, 0, 0.2862745, 1, 1,
0.2670151, -1.01134, 3.042724, 0, 0.2784314, 1, 1,
0.2679255, -0.3137006, 2.720732, 0, 0.2745098, 1, 1,
0.2778355, -0.5821375, 2.671194, 0, 0.2666667, 1, 1,
0.2836384, 0.245667, -1.173004, 0, 0.2627451, 1, 1,
0.2914333, -0.0227786, 0.9711863, 0, 0.254902, 1, 1,
0.2930143, 0.9842759, -0.7162956, 0, 0.2509804, 1, 1,
0.3025477, 0.2617149, 0.9310912, 0, 0.2431373, 1, 1,
0.3027005, 1.272771, 0.02887842, 0, 0.2392157, 1, 1,
0.3086115, 0.4133665, 0.2311978, 0, 0.2313726, 1, 1,
0.3091274, 0.3513549, 1.379839, 0, 0.227451, 1, 1,
0.3102705, -0.6460829, 2.502633, 0, 0.2196078, 1, 1,
0.3103102, -0.1958753, 2.069665, 0, 0.2156863, 1, 1,
0.3109319, -1.624007, 3.233918, 0, 0.2078431, 1, 1,
0.3157733, -0.4637112, 1.984861, 0, 0.2039216, 1, 1,
0.3167719, -0.1418693, 1.964023, 0, 0.1960784, 1, 1,
0.3269361, -1.28587, 3.924513, 0, 0.1882353, 1, 1,
0.331397, 1.983666, -0.9006776, 0, 0.1843137, 1, 1,
0.3336183, 1.388578, -0.6414297, 0, 0.1764706, 1, 1,
0.3371501, 0.09775589, 3.47139, 0, 0.172549, 1, 1,
0.3382374, 1.095658, -0.8078312, 0, 0.1647059, 1, 1,
0.3451918, 1.399237, -0.7376382, 0, 0.1607843, 1, 1,
0.3452517, 1.663859, 1.365098, 0, 0.1529412, 1, 1,
0.3468392, 0.2878012, 0.3388772, 0, 0.1490196, 1, 1,
0.3479744, 0.0544469, 0.9239173, 0, 0.1411765, 1, 1,
0.3491263, 1.053694, -0.3045521, 0, 0.1372549, 1, 1,
0.3516525, -1.239092, 1.059757, 0, 0.1294118, 1, 1,
0.3542696, -0.5032822, 3.013863, 0, 0.1254902, 1, 1,
0.3581709, 1.832306, -0.4961172, 0, 0.1176471, 1, 1,
0.3658937, -0.2354313, 1.628424, 0, 0.1137255, 1, 1,
0.3683163, 0.2699932, 1.393731, 0, 0.1058824, 1, 1,
0.370125, 0.707773, 1.303272, 0, 0.09803922, 1, 1,
0.3760813, 0.3007311, 0.2660957, 0, 0.09411765, 1, 1,
0.3793463, 1.253993, 1.835813, 0, 0.08627451, 1, 1,
0.3796267, -0.509783, 3.973637, 0, 0.08235294, 1, 1,
0.3798544, -0.07956428, 1.187047, 0, 0.07450981, 1, 1,
0.3826676, 0.8282986, 0.2190378, 0, 0.07058824, 1, 1,
0.3836173, 2.014044, 0.03942268, 0, 0.0627451, 1, 1,
0.3850711, -0.566862, 2.066672, 0, 0.05882353, 1, 1,
0.3861473, 0.3971112, -0.5315014, 0, 0.05098039, 1, 1,
0.3874366, -0.2005233, 2.183904, 0, 0.04705882, 1, 1,
0.3888899, 1.536903, 1.06289, 0, 0.03921569, 1, 1,
0.4011089, 0.5003251, -0.4604259, 0, 0.03529412, 1, 1,
0.4020668, -0.2538918, 0.2860523, 0, 0.02745098, 1, 1,
0.4083522, -0.4713989, 1.509854, 0, 0.02352941, 1, 1,
0.4167878, 1.480562, 1.632261, 0, 0.01568628, 1, 1,
0.4170339, 0.4659928, 0.4057865, 0, 0.01176471, 1, 1,
0.4192941, 0.1548281, 0.1395519, 0, 0.003921569, 1, 1,
0.4217844, 0.1085001, 1.372867, 0.003921569, 0, 1, 1,
0.4231694, -1.322627, 4.726578, 0.007843138, 0, 1, 1,
0.4245986, 0.1853187, -1.180211, 0.01568628, 0, 1, 1,
0.4297241, -0.2283702, 3.019177, 0.01960784, 0, 1, 1,
0.4311497, 0.8993305, 1.654021, 0.02745098, 0, 1, 1,
0.433296, 0.8125508, 2.186561, 0.03137255, 0, 1, 1,
0.4355581, -1.872864, 3.679175, 0.03921569, 0, 1, 1,
0.4368509, -1.38159, 1.871798, 0.04313726, 0, 1, 1,
0.4397689, -0.7315347, 3.01194, 0.05098039, 0, 1, 1,
0.4399648, 0.1816256, 0.6820935, 0.05490196, 0, 1, 1,
0.4433434, 1.709508, 1.128997, 0.0627451, 0, 1, 1,
0.4444599, 0.6626114, 1.703753, 0.06666667, 0, 1, 1,
0.4454802, 1.064754, 0.8811823, 0.07450981, 0, 1, 1,
0.446601, 2.330407, -0.3886378, 0.07843138, 0, 1, 1,
0.447851, 1.002621, -1.732239, 0.08627451, 0, 1, 1,
0.4499175, 0.1106428, 1.98897, 0.09019608, 0, 1, 1,
0.4501056, -0.7805408, 4.510309, 0.09803922, 0, 1, 1,
0.4502446, -0.1174451, 2.67486, 0.1058824, 0, 1, 1,
0.4530104, 0.5964984, 0.2642547, 0.1098039, 0, 1, 1,
0.4553885, 0.6731375, 2.340998, 0.1176471, 0, 1, 1,
0.4588108, -0.3792172, 3.008245, 0.1215686, 0, 1, 1,
0.46378, 0.8816562, 0.6870758, 0.1294118, 0, 1, 1,
0.4792079, 1.138752, -0.198047, 0.1333333, 0, 1, 1,
0.4850448, 0.6112896, 0.3566288, 0.1411765, 0, 1, 1,
0.4862762, -2.040163, 1.632055, 0.145098, 0, 1, 1,
0.4871344, -1.52449, 3.859501, 0.1529412, 0, 1, 1,
0.4894082, 1.015204, -0.1564223, 0.1568628, 0, 1, 1,
0.4945978, 0.1398376, 1.570901, 0.1647059, 0, 1, 1,
0.5028625, -1.24077, 2.384016, 0.1686275, 0, 1, 1,
0.503619, 0.3017063, 2.932224, 0.1764706, 0, 1, 1,
0.5059252, 0.3199338, -0.2180523, 0.1803922, 0, 1, 1,
0.5087492, 0.05166498, 3.611535, 0.1882353, 0, 1, 1,
0.5094981, -0.1754816, 2.998805, 0.1921569, 0, 1, 1,
0.5129598, -0.1357573, 1.636179, 0.2, 0, 1, 1,
0.5146052, -0.0023567, -0.3508487, 0.2078431, 0, 1, 1,
0.5150775, -1.098984, 2.794816, 0.2117647, 0, 1, 1,
0.5174042, 1.840933, 2.144644, 0.2196078, 0, 1, 1,
0.5186449, 1.458118, 0.04310028, 0.2235294, 0, 1, 1,
0.5188488, -1.860426, 4.561044, 0.2313726, 0, 1, 1,
0.5206105, 1.000252, 0.4305305, 0.2352941, 0, 1, 1,
0.5215336, 0.2257715, 0.6418636, 0.2431373, 0, 1, 1,
0.5220556, -0.2826473, 3.81268, 0.2470588, 0, 1, 1,
0.5227432, 0.1135039, -0.03884776, 0.254902, 0, 1, 1,
0.5299028, -0.1686122, 0.4788545, 0.2588235, 0, 1, 1,
0.53136, 1.448696, -0.8862863, 0.2666667, 0, 1, 1,
0.5335791, -1.042664, 1.975992, 0.2705882, 0, 1, 1,
0.5344071, 0.616082, 1.042543, 0.2784314, 0, 1, 1,
0.5347325, 0.4021553, -0.6542265, 0.282353, 0, 1, 1,
0.5431464, -0.4861912, 2.775164, 0.2901961, 0, 1, 1,
0.5437944, 0.3197535, -0.4423709, 0.2941177, 0, 1, 1,
0.5474883, -0.4308328, 1.128072, 0.3019608, 0, 1, 1,
0.5490344, 0.1921869, 0.04652145, 0.3098039, 0, 1, 1,
0.549112, -0.6718137, 2.627048, 0.3137255, 0, 1, 1,
0.5507182, 1.185982, 1.006668, 0.3215686, 0, 1, 1,
0.5538562, 1.123084, 1.522866, 0.3254902, 0, 1, 1,
0.5548868, -1.629307, 1.61097, 0.3333333, 0, 1, 1,
0.5568998, 1.812835, 1.360516, 0.3372549, 0, 1, 1,
0.5588395, -0.3665029, 1.98927, 0.345098, 0, 1, 1,
0.5598773, 0.7637504, -1.526219, 0.3490196, 0, 1, 1,
0.5618832, -0.04922545, 1.939637, 0.3568628, 0, 1, 1,
0.5637742, 1.236617, -0.1931597, 0.3607843, 0, 1, 1,
0.5648979, -0.5548419, 2.657844, 0.3686275, 0, 1, 1,
0.5711865, -0.3709551, 3.515456, 0.372549, 0, 1, 1,
0.5738402, -0.2297713, 0.8571027, 0.3803922, 0, 1, 1,
0.5810933, 0.7150576, 1.173868, 0.3843137, 0, 1, 1,
0.5840486, -0.1123382, 2.978182, 0.3921569, 0, 1, 1,
0.5857565, -1.075274, 2.148268, 0.3960784, 0, 1, 1,
0.5861531, -1.171589, 1.166262, 0.4039216, 0, 1, 1,
0.5873377, -0.06366501, 0.9983854, 0.4117647, 0, 1, 1,
0.5873863, -1.46211, 2.657193, 0.4156863, 0, 1, 1,
0.5882749, 0.1285927, 0.5490046, 0.4235294, 0, 1, 1,
0.5895156, 0.5364049, 1.288438, 0.427451, 0, 1, 1,
0.5917467, 0.5640302, -0.2779539, 0.4352941, 0, 1, 1,
0.5937748, -0.00109791, 1.387416, 0.4392157, 0, 1, 1,
0.5958543, 0.1160236, 1.119073, 0.4470588, 0, 1, 1,
0.5959548, -0.4634476, 2.089074, 0.4509804, 0, 1, 1,
0.5965984, 1.00707, 0.5327074, 0.4588235, 0, 1, 1,
0.6042438, 1.96249, 0.8891318, 0.4627451, 0, 1, 1,
0.6068325, -0.3015793, 0.8775914, 0.4705882, 0, 1, 1,
0.6080737, 1.941974, 0.9496205, 0.4745098, 0, 1, 1,
0.6082879, -0.9347438, 1.974601, 0.4823529, 0, 1, 1,
0.6129528, 1.019878, 1.899102, 0.4862745, 0, 1, 1,
0.6131883, 2.917549, -0.02136031, 0.4941176, 0, 1, 1,
0.6148338, -0.2658727, 2.158151, 0.5019608, 0, 1, 1,
0.6157265, 0.1536183, 2.000377, 0.5058824, 0, 1, 1,
0.6165078, -0.4495416, 1.979715, 0.5137255, 0, 1, 1,
0.6197377, -1.376412, 3.146462, 0.5176471, 0, 1, 1,
0.6219484, -0.6736137, 2.1205, 0.5254902, 0, 1, 1,
0.6230071, -0.160751, 0.4251399, 0.5294118, 0, 1, 1,
0.6290324, -0.908154, 2.629391, 0.5372549, 0, 1, 1,
0.6296809, 0.2542145, 0.7751876, 0.5411765, 0, 1, 1,
0.6337981, 0.7563582, 0.9451392, 0.5490196, 0, 1, 1,
0.6367306, -1.002861, 2.519758, 0.5529412, 0, 1, 1,
0.6392727, 0.2416896, 3.565393, 0.5607843, 0, 1, 1,
0.640458, -2.736323, 2.252227, 0.5647059, 0, 1, 1,
0.6421043, 0.512651, 0.5724468, 0.572549, 0, 1, 1,
0.6462687, 0.4778874, 1.596819, 0.5764706, 0, 1, 1,
0.6502924, 0.6590904, 0.3183215, 0.5843138, 0, 1, 1,
0.6571361, -0.2906383, 2.196014, 0.5882353, 0, 1, 1,
0.6571589, -1.649085, 3.352008, 0.5960785, 0, 1, 1,
0.6573915, -0.3739848, 3.009979, 0.6039216, 0, 1, 1,
0.667284, 0.01644908, 0.8749335, 0.6078432, 0, 1, 1,
0.6748578, -0.5063131, 4.141846, 0.6156863, 0, 1, 1,
0.6750562, -2.245234, 0.5647908, 0.6196079, 0, 1, 1,
0.6771849, 1.272422, 1.109089, 0.627451, 0, 1, 1,
0.6809995, 0.1601628, 0.734341, 0.6313726, 0, 1, 1,
0.6819894, -0.6030222, 2.394887, 0.6392157, 0, 1, 1,
0.6829625, 0.6840758, 0.03515111, 0.6431373, 0, 1, 1,
0.6845415, -0.3562123, 2.732839, 0.6509804, 0, 1, 1,
0.6913164, -0.679051, 2.549836, 0.654902, 0, 1, 1,
0.6966617, 0.5502861, 1.784259, 0.6627451, 0, 1, 1,
0.7010235, 1.952243, -0.2486072, 0.6666667, 0, 1, 1,
0.7091267, 0.3269728, 2.425394, 0.6745098, 0, 1, 1,
0.7092277, 1.004131, 2.438587, 0.6784314, 0, 1, 1,
0.7105711, 0.8823526, 0.5943465, 0.6862745, 0, 1, 1,
0.7114131, 0.4887369, -0.3266229, 0.6901961, 0, 1, 1,
0.7129676, 0.6280912, 1.937088, 0.6980392, 0, 1, 1,
0.7155535, 0.5989032, 1.111159, 0.7058824, 0, 1, 1,
0.7173209, -1.292498, 3.289073, 0.7098039, 0, 1, 1,
0.7215058, -2.108172, 2.376486, 0.7176471, 0, 1, 1,
0.7281896, -0.3430183, 1.865105, 0.7215686, 0, 1, 1,
0.7346446, 0.2605689, -0.9948842, 0.7294118, 0, 1, 1,
0.7348194, 0.311084, 2.04652, 0.7333333, 0, 1, 1,
0.7355101, -0.06535731, 0.3246575, 0.7411765, 0, 1, 1,
0.7378196, -0.645022, 1.96533, 0.7450981, 0, 1, 1,
0.74208, -0.0351379, 2.123821, 0.7529412, 0, 1, 1,
0.7424424, 0.3719989, 1.051698, 0.7568628, 0, 1, 1,
0.7438503, 0.3444829, 0.02494817, 0.7647059, 0, 1, 1,
0.7447335, 2.857054, 2.098471, 0.7686275, 0, 1, 1,
0.7456318, 0.1396234, 1.08207, 0.7764706, 0, 1, 1,
0.7474964, 0.6060426, 1.618682, 0.7803922, 0, 1, 1,
0.7475451, -0.0740667, 2.200878, 0.7882353, 0, 1, 1,
0.7560578, -1.257898, 4.372121, 0.7921569, 0, 1, 1,
0.7564299, 0.07466278, 2.834946, 0.8, 0, 1, 1,
0.7598294, 1.283265, 0.6947819, 0.8078431, 0, 1, 1,
0.7653491, -0.2243377, 1.699114, 0.8117647, 0, 1, 1,
0.768528, 0.6280517, 1.027141, 0.8196079, 0, 1, 1,
0.7743954, 0.6233166, -0.1398472, 0.8235294, 0, 1, 1,
0.7786391, -0.1747892, 3.60167, 0.8313726, 0, 1, 1,
0.7796899, 0.5310897, 2.5634, 0.8352941, 0, 1, 1,
0.7875142, -0.9524478, 3.56777, 0.8431373, 0, 1, 1,
0.7930486, -0.7270648, 4.727224, 0.8470588, 0, 1, 1,
0.7970835, 1.735747, 0.2603829, 0.854902, 0, 1, 1,
0.8004796, -1.123284, 4.756008, 0.8588235, 0, 1, 1,
0.8069442, -1.786656, 3.078158, 0.8666667, 0, 1, 1,
0.8092446, 1.163237, 1.248112, 0.8705882, 0, 1, 1,
0.8173735, 0.107374, 2.129106, 0.8784314, 0, 1, 1,
0.8177288, 1.136357, -1.126494, 0.8823529, 0, 1, 1,
0.81875, -1.394674, 0.8131629, 0.8901961, 0, 1, 1,
0.8202305, 0.08233954, 2.891382, 0.8941177, 0, 1, 1,
0.8243278, 0.8715102, 1.599723, 0.9019608, 0, 1, 1,
0.8275634, 0.848616, -0.5761528, 0.9098039, 0, 1, 1,
0.828567, 0.1898763, 1.183839, 0.9137255, 0, 1, 1,
0.8301637, -0.1563032, 1.103434, 0.9215686, 0, 1, 1,
0.8335078, -1.598454, 2.707695, 0.9254902, 0, 1, 1,
0.8378016, 0.6738572, 0.7828173, 0.9333333, 0, 1, 1,
0.8537582, 0.3080371, 0.5492504, 0.9372549, 0, 1, 1,
0.8567772, -0.4521446, 2.11587, 0.945098, 0, 1, 1,
0.858313, -0.07644249, 1.425305, 0.9490196, 0, 1, 1,
0.8630157, 0.4466238, -0.7726461, 0.9568627, 0, 1, 1,
0.8701642, 2.403494, 0.5063221, 0.9607843, 0, 1, 1,
0.8805411, 0.3708415, 2.537479, 0.9686275, 0, 1, 1,
0.881802, 1.493114, 0.9028282, 0.972549, 0, 1, 1,
0.8866859, 0.5531732, 0.7410902, 0.9803922, 0, 1, 1,
0.8871318, -1.540695, 1.4411, 0.9843137, 0, 1, 1,
0.8915036, -0.2901852, 2.422869, 0.9921569, 0, 1, 1,
0.8916513, 0.02864108, 1.891376, 0.9960784, 0, 1, 1,
0.8929516, -0.3598704, 2.335371, 1, 0, 0.9960784, 1,
0.894011, 0.690363, 1.74445, 1, 0, 0.9882353, 1,
0.8987896, 0.2897258, 1.466387, 1, 0, 0.9843137, 1,
0.8997668, -1.560188, 3.259058, 1, 0, 0.9764706, 1,
0.9012038, 0.5698922, 1.434835, 1, 0, 0.972549, 1,
0.9074289, 1.397428, 0.5636643, 1, 0, 0.9647059, 1,
0.9080067, -0.5515206, 2.724697, 1, 0, 0.9607843, 1,
0.9091834, -1.599865, 3.206755, 1, 0, 0.9529412, 1,
0.9118437, -0.8043371, 0.3890223, 1, 0, 0.9490196, 1,
0.915018, -1.085034, 1.901515, 1, 0, 0.9411765, 1,
0.9153205, 0.09017519, 0.4308377, 1, 0, 0.9372549, 1,
0.9211065, -0.08574124, 2.65456, 1, 0, 0.9294118, 1,
0.9256759, 1.270561, -0.4867972, 1, 0, 0.9254902, 1,
0.9257851, 2.376762, -0.3988779, 1, 0, 0.9176471, 1,
0.9278547, -0.8881403, 0.4390854, 1, 0, 0.9137255, 1,
0.9299496, 1.188081, 0.5913349, 1, 0, 0.9058824, 1,
0.9338627, -0.06354358, 0.2375162, 1, 0, 0.9019608, 1,
0.9346402, 0.3609715, 3.39378, 1, 0, 0.8941177, 1,
0.9378952, -2.054999, 1.622018, 1, 0, 0.8862745, 1,
0.9429759, -1.177907, 2.363158, 1, 0, 0.8823529, 1,
0.9495499, -1.552821, 0.2199093, 1, 0, 0.8745098, 1,
0.9567188, 0.1655487, 1.970796, 1, 0, 0.8705882, 1,
0.9650021, -0.02426433, 1.652412, 1, 0, 0.8627451, 1,
0.9670734, -0.102852, 2.953053, 1, 0, 0.8588235, 1,
0.9813578, 0.4095801, -0.01409614, 1, 0, 0.8509804, 1,
0.9913152, 0.5754636, -0.1544357, 1, 0, 0.8470588, 1,
0.9975482, 0.7901954, 1.213831, 1, 0, 0.8392157, 1,
0.9996657, -0.2707691, 1.227687, 1, 0, 0.8352941, 1,
1.001996, -2.329891, 3.986009, 1, 0, 0.827451, 1,
1.010194, -0.729646, 3.199171, 1, 0, 0.8235294, 1,
1.015759, -0.6174635, 3.554686, 1, 0, 0.8156863, 1,
1.019134, 0.7820979, -0.4355497, 1, 0, 0.8117647, 1,
1.021331, -1.214778, 1.015487, 1, 0, 0.8039216, 1,
1.023484, 1.280471, -0.4516896, 1, 0, 0.7960784, 1,
1.025479, -1.571054, 1.958745, 1, 0, 0.7921569, 1,
1.027035, 0.08566003, 0.6867314, 1, 0, 0.7843137, 1,
1.032271, 0.6220641, -0.7977664, 1, 0, 0.7803922, 1,
1.032737, 1.9232, 1.781992, 1, 0, 0.772549, 1,
1.039268, -0.8463514, 2.188558, 1, 0, 0.7686275, 1,
1.04127, 0.2893313, 0.1437769, 1, 0, 0.7607843, 1,
1.04687, -0.2832014, 2.674617, 1, 0, 0.7568628, 1,
1.047415, 1.059278, 2.241743, 1, 0, 0.7490196, 1,
1.055668, -1.017153, 1.102711, 1, 0, 0.7450981, 1,
1.067536, 0.3813006, 1.362616, 1, 0, 0.7372549, 1,
1.071116, 0.6907119, 1.952009, 1, 0, 0.7333333, 1,
1.081611, -0.2884892, 3.460643, 1, 0, 0.7254902, 1,
1.091206, 0.2760755, -0.5046496, 1, 0, 0.7215686, 1,
1.094256, 0.327189, 1.81454, 1, 0, 0.7137255, 1,
1.096188, 0.6930181, -0.02749504, 1, 0, 0.7098039, 1,
1.110282, -1.872749, 1.254985, 1, 0, 0.7019608, 1,
1.112309, 0.3628107, 0.5418872, 1, 0, 0.6941177, 1,
1.116005, -0.4722688, 3.521712, 1, 0, 0.6901961, 1,
1.124011, 1.594744, 1.045234, 1, 0, 0.682353, 1,
1.130802, -0.09173521, 2.800502, 1, 0, 0.6784314, 1,
1.135739, 1.097647, 1.474189, 1, 0, 0.6705883, 1,
1.145233, 0.7009286, 1.18333, 1, 0, 0.6666667, 1,
1.160537, 0.9576581, -0.3779002, 1, 0, 0.6588235, 1,
1.162884, 0.7799832, 0.9529243, 1, 0, 0.654902, 1,
1.16946, -0.8634765, 2.768821, 1, 0, 0.6470588, 1,
1.177249, -0.9594725, 1.736617, 1, 0, 0.6431373, 1,
1.18081, 1.573768, 1.968637, 1, 0, 0.6352941, 1,
1.181706, -0.2506425, 3.108175, 1, 0, 0.6313726, 1,
1.182337, -1.323133, 1.468707, 1, 0, 0.6235294, 1,
1.186152, -0.2161327, 0.6835144, 1, 0, 0.6196079, 1,
1.190016, 0.9494108, 1.389102, 1, 0, 0.6117647, 1,
1.192129, 0.02319779, 2.665735, 1, 0, 0.6078432, 1,
1.193356, 2.443318, 0.2585756, 1, 0, 0.6, 1,
1.212198, -1.411507, 1.100267, 1, 0, 0.5921569, 1,
1.217291, -0.06424265, 0.1541382, 1, 0, 0.5882353, 1,
1.228749, -0.1035434, 2.588606, 1, 0, 0.5803922, 1,
1.229694, -0.7387816, 2.059978, 1, 0, 0.5764706, 1,
1.230422, 2.027133, 0.2832158, 1, 0, 0.5686275, 1,
1.235555, 1.598383, 0.6559067, 1, 0, 0.5647059, 1,
1.251127, 1.331089, 1.179192, 1, 0, 0.5568628, 1,
1.26109, 0.5343125, 3.919986, 1, 0, 0.5529412, 1,
1.280843, -0.8941653, 2.089041, 1, 0, 0.5450981, 1,
1.280963, 1.214599, 1.265356, 1, 0, 0.5411765, 1,
1.28516, 0.2888628, 0.263501, 1, 0, 0.5333334, 1,
1.289381, 0.7900116, 2.13073, 1, 0, 0.5294118, 1,
1.291067, 1.743374, 0.4257162, 1, 0, 0.5215687, 1,
1.318081, -0.7570845, 3.164379, 1, 0, 0.5176471, 1,
1.324089, -0.07147419, 0.8606009, 1, 0, 0.509804, 1,
1.329193, 0.01463592, 1.927465, 1, 0, 0.5058824, 1,
1.329848, 0.1268016, 1.608568, 1, 0, 0.4980392, 1,
1.332035, -0.9654975, 2.752594, 1, 0, 0.4901961, 1,
1.354125, -0.07202628, 2.214752, 1, 0, 0.4862745, 1,
1.358549, 3.04019, 1.850715, 1, 0, 0.4784314, 1,
1.363718, -0.1077609, 0.212665, 1, 0, 0.4745098, 1,
1.379237, 0.1005894, 1.957395, 1, 0, 0.4666667, 1,
1.413163, -1.237993, 2.522622, 1, 0, 0.4627451, 1,
1.413626, -1.405727, 3.059556, 1, 0, 0.454902, 1,
1.421698, 0.1783619, 0.9170864, 1, 0, 0.4509804, 1,
1.433778, 0.6375718, 1.549481, 1, 0, 0.4431373, 1,
1.448875, -0.3346534, 1.161763, 1, 0, 0.4392157, 1,
1.463137, 0.09283764, 1.230001, 1, 0, 0.4313726, 1,
1.468246, 1.905788, 1.155681, 1, 0, 0.427451, 1,
1.472294, 1.687876, -1.520745, 1, 0, 0.4196078, 1,
1.493713, -1.08813, 2.348411, 1, 0, 0.4156863, 1,
1.49866, 0.5781378, 0.8500973, 1, 0, 0.4078431, 1,
1.503569, 2.377436, -0.2645036, 1, 0, 0.4039216, 1,
1.506359, -1.23275, 1.254475, 1, 0, 0.3960784, 1,
1.525729, -2.175936, 2.133131, 1, 0, 0.3882353, 1,
1.539846, 0.2214572, 1.6363, 1, 0, 0.3843137, 1,
1.540295, 1.120641, -0.1801914, 1, 0, 0.3764706, 1,
1.54505, 1.237348, -1.006667, 1, 0, 0.372549, 1,
1.550533, -0.3169861, 4.073019, 1, 0, 0.3647059, 1,
1.561958, -0.7816257, 2.944689, 1, 0, 0.3607843, 1,
1.56947, -0.08811751, 1.273572, 1, 0, 0.3529412, 1,
1.59, -0.7625891, 2.222693, 1, 0, 0.3490196, 1,
1.600671, -0.2715372, 1.702946, 1, 0, 0.3411765, 1,
1.605147, -0.8449744, -1.306868, 1, 0, 0.3372549, 1,
1.62012, -0.5954233, 1.347444, 1, 0, 0.3294118, 1,
1.620944, -0.7244575, 2.779118, 1, 0, 0.3254902, 1,
1.622033, 0.2825552, 0.6041201, 1, 0, 0.3176471, 1,
1.627538, 0.2854043, 0.89979, 1, 0, 0.3137255, 1,
1.629302, -1.254793, -0.0303125, 1, 0, 0.3058824, 1,
1.636801, -0.7319319, 2.974531, 1, 0, 0.2980392, 1,
1.645714, -1.397612, 2.855099, 1, 0, 0.2941177, 1,
1.647476, -0.8325219, 1.361918, 1, 0, 0.2862745, 1,
1.64847, 1.215334, 0.8567693, 1, 0, 0.282353, 1,
1.657051, 0.7964821, 2.7834, 1, 0, 0.2745098, 1,
1.662352, 1.10554, 0.9395329, 1, 0, 0.2705882, 1,
1.663544, 0.7221419, 1.088066, 1, 0, 0.2627451, 1,
1.672061, -0.4702478, 0.01288028, 1, 0, 0.2588235, 1,
1.678137, -0.1858533, 1.598695, 1, 0, 0.2509804, 1,
1.683908, 0.6927288, 0.4282097, 1, 0, 0.2470588, 1,
1.692644, -0.06014327, 0.4584727, 1, 0, 0.2392157, 1,
1.701437, -1.094916, 0.9253973, 1, 0, 0.2352941, 1,
1.712398, 1.170591, 0.08272721, 1, 0, 0.227451, 1,
1.72458, 0.3461816, 0.664413, 1, 0, 0.2235294, 1,
1.72497, 0.5479628, -0.2654554, 1, 0, 0.2156863, 1,
1.73148, 0.2433996, 1.836026, 1, 0, 0.2117647, 1,
1.750273, 0.656489, 0.6270913, 1, 0, 0.2039216, 1,
1.761433, 0.3648193, 1.587249, 1, 0, 0.1960784, 1,
1.765416, -1.223876, 0.7232016, 1, 0, 0.1921569, 1,
1.770691, -0.09563304, 2.669233, 1, 0, 0.1843137, 1,
1.771606, -0.3459652, 2.653761, 1, 0, 0.1803922, 1,
1.773641, -0.5060641, 1.84593, 1, 0, 0.172549, 1,
1.777224, 1.010839, 1.922455, 1, 0, 0.1686275, 1,
1.800031, 0.6238973, 0.867595, 1, 0, 0.1607843, 1,
1.801999, -0.8574671, 1.370012, 1, 0, 0.1568628, 1,
1.805071, 0.2750837, 2.600593, 1, 0, 0.1490196, 1,
1.810721, -1.037063, 1.764072, 1, 0, 0.145098, 1,
1.828355, 0.1511361, 2.734781, 1, 0, 0.1372549, 1,
1.839818, -1.216894, 1.581888, 1, 0, 0.1333333, 1,
1.868875, -1.355355, 1.075458, 1, 0, 0.1254902, 1,
1.872584, 0.1829941, 0.6050904, 1, 0, 0.1215686, 1,
1.885261, 0.1001758, -0.4804076, 1, 0, 0.1137255, 1,
1.903354, -1.344481, 2.489764, 1, 0, 0.1098039, 1,
1.94987, -0.3853602, 3.014585, 1, 0, 0.1019608, 1,
1.967609, 1.294076, -0.278852, 1, 0, 0.09411765, 1,
1.975417, 0.4254293, 3.457053, 1, 0, 0.09019608, 1,
1.982965, 0.659955, 2.31397, 1, 0, 0.08235294, 1,
2.014905, -0.9206457, 2.404854, 1, 0, 0.07843138, 1,
2.075281, -1.094135, 0.6435043, 1, 0, 0.07058824, 1,
2.096169, 0.01899041, 3.732148, 1, 0, 0.06666667, 1,
2.211522, 0.954585, 1.98926, 1, 0, 0.05882353, 1,
2.217618, 1.192038, 1.382766, 1, 0, 0.05490196, 1,
2.288078, 1.451003, 1.821693, 1, 0, 0.04705882, 1,
2.292927, 2.139526, 1.084244, 1, 0, 0.04313726, 1,
2.30577, -2.022861, 1.215935, 1, 0, 0.03529412, 1,
2.334776, 1.534051, -0.2503664, 1, 0, 0.03137255, 1,
2.390815, 1.42196, 2.479007, 1, 0, 0.02352941, 1,
2.524351, 0.0364587, 1.511228, 1, 0, 0.01960784, 1,
2.630962, -0.9734437, 1.587008, 1, 0, 0.01176471, 1,
2.65121, 1.144067, 0.1232825, 1, 0, 0.007843138, 1
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
-0.4739498, -4.625952, -7.764593, 0, -0.5, 0.5, 0.5,
-0.4739498, -4.625952, -7.764593, 1, -0.5, 0.5, 0.5,
-0.4739498, -4.625952, -7.764593, 1, 1.5, 0.5, 0.5,
-0.4739498, -4.625952, -7.764593, 0, 1.5, 0.5, 0.5
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
-4.658539, -0.2373397, -7.764593, 0, -0.5, 0.5, 0.5,
-4.658539, -0.2373397, -7.764593, 1, -0.5, 0.5, 0.5,
-4.658539, -0.2373397, -7.764593, 1, 1.5, 0.5, 0.5,
-4.658539, -0.2373397, -7.764593, 0, 1.5, 0.5, 0.5
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
-4.658539, -4.625952, -0.3080776, 0, -0.5, 0.5, 0.5,
-4.658539, -4.625952, -0.3080776, 1, -0.5, 0.5, 0.5,
-4.658539, -4.625952, -0.3080776, 1, 1.5, 0.5, 0.5,
-4.658539, -4.625952, -0.3080776, 0, 1.5, 0.5, 0.5
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
-3, -3.613196, -6.043859,
2, -3.613196, -6.043859,
-3, -3.613196, -6.043859,
-3, -3.781988, -6.330648,
-2, -3.613196, -6.043859,
-2, -3.781988, -6.330648,
-1, -3.613196, -6.043859,
-1, -3.781988, -6.330648,
0, -3.613196, -6.043859,
0, -3.781988, -6.330648,
1, -3.613196, -6.043859,
1, -3.781988, -6.330648,
2, -3.613196, -6.043859,
2, -3.781988, -6.330648
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
-3, -4.119574, -6.904226, 0, -0.5, 0.5, 0.5,
-3, -4.119574, -6.904226, 1, -0.5, 0.5, 0.5,
-3, -4.119574, -6.904226, 1, 1.5, 0.5, 0.5,
-3, -4.119574, -6.904226, 0, 1.5, 0.5, 0.5,
-2, -4.119574, -6.904226, 0, -0.5, 0.5, 0.5,
-2, -4.119574, -6.904226, 1, -0.5, 0.5, 0.5,
-2, -4.119574, -6.904226, 1, 1.5, 0.5, 0.5,
-2, -4.119574, -6.904226, 0, 1.5, 0.5, 0.5,
-1, -4.119574, -6.904226, 0, -0.5, 0.5, 0.5,
-1, -4.119574, -6.904226, 1, -0.5, 0.5, 0.5,
-1, -4.119574, -6.904226, 1, 1.5, 0.5, 0.5,
-1, -4.119574, -6.904226, 0, 1.5, 0.5, 0.5,
0, -4.119574, -6.904226, 0, -0.5, 0.5, 0.5,
0, -4.119574, -6.904226, 1, -0.5, 0.5, 0.5,
0, -4.119574, -6.904226, 1, 1.5, 0.5, 0.5,
0, -4.119574, -6.904226, 0, 1.5, 0.5, 0.5,
1, -4.119574, -6.904226, 0, -0.5, 0.5, 0.5,
1, -4.119574, -6.904226, 1, -0.5, 0.5, 0.5,
1, -4.119574, -6.904226, 1, 1.5, 0.5, 0.5,
1, -4.119574, -6.904226, 0, 1.5, 0.5, 0.5,
2, -4.119574, -6.904226, 0, -0.5, 0.5, 0.5,
2, -4.119574, -6.904226, 1, -0.5, 0.5, 0.5,
2, -4.119574, -6.904226, 1, 1.5, 0.5, 0.5,
2, -4.119574, -6.904226, 0, 1.5, 0.5, 0.5
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
-3.692865, -3, -6.043859,
-3.692865, 3, -6.043859,
-3.692865, -3, -6.043859,
-3.853811, -3, -6.330648,
-3.692865, -2, -6.043859,
-3.853811, -2, -6.330648,
-3.692865, -1, -6.043859,
-3.853811, -1, -6.330648,
-3.692865, 0, -6.043859,
-3.853811, 0, -6.330648,
-3.692865, 1, -6.043859,
-3.853811, 1, -6.330648,
-3.692865, 2, -6.043859,
-3.853811, 2, -6.330648,
-3.692865, 3, -6.043859,
-3.853811, 3, -6.330648
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
-4.175702, -3, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, -3, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, -3, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, -3, -6.904226, 0, 1.5, 0.5, 0.5,
-4.175702, -2, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, -2, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, -2, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, -2, -6.904226, 0, 1.5, 0.5, 0.5,
-4.175702, -1, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, -1, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, -1, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, -1, -6.904226, 0, 1.5, 0.5, 0.5,
-4.175702, 0, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, 0, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, 0, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, 0, -6.904226, 0, 1.5, 0.5, 0.5,
-4.175702, 1, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, 1, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, 1, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, 1, -6.904226, 0, 1.5, 0.5, 0.5,
-4.175702, 2, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, 2, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, 2, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, 2, -6.904226, 0, 1.5, 0.5, 0.5,
-4.175702, 3, -6.904226, 0, -0.5, 0.5, 0.5,
-4.175702, 3, -6.904226, 1, -0.5, 0.5, 0.5,
-4.175702, 3, -6.904226, 1, 1.5, 0.5, 0.5,
-4.175702, 3, -6.904226, 0, 1.5, 0.5, 0.5
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
-3.692865, -3.613196, -4,
-3.692865, -3.613196, 4,
-3.692865, -3.613196, -4,
-3.853811, -3.781988, -4,
-3.692865, -3.613196, -2,
-3.853811, -3.781988, -2,
-3.692865, -3.613196, 0,
-3.853811, -3.781988, 0,
-3.692865, -3.613196, 2,
-3.853811, -3.781988, 2,
-3.692865, -3.613196, 4,
-3.853811, -3.781988, 4
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
-4.175702, -4.119574, -4, 0, -0.5, 0.5, 0.5,
-4.175702, -4.119574, -4, 1, -0.5, 0.5, 0.5,
-4.175702, -4.119574, -4, 1, 1.5, 0.5, 0.5,
-4.175702, -4.119574, -4, 0, 1.5, 0.5, 0.5,
-4.175702, -4.119574, -2, 0, -0.5, 0.5, 0.5,
-4.175702, -4.119574, -2, 1, -0.5, 0.5, 0.5,
-4.175702, -4.119574, -2, 1, 1.5, 0.5, 0.5,
-4.175702, -4.119574, -2, 0, 1.5, 0.5, 0.5,
-4.175702, -4.119574, 0, 0, -0.5, 0.5, 0.5,
-4.175702, -4.119574, 0, 1, -0.5, 0.5, 0.5,
-4.175702, -4.119574, 0, 1, 1.5, 0.5, 0.5,
-4.175702, -4.119574, 0, 0, 1.5, 0.5, 0.5,
-4.175702, -4.119574, 2, 0, -0.5, 0.5, 0.5,
-4.175702, -4.119574, 2, 1, -0.5, 0.5, 0.5,
-4.175702, -4.119574, 2, 1, 1.5, 0.5, 0.5,
-4.175702, -4.119574, 2, 0, 1.5, 0.5, 0.5,
-4.175702, -4.119574, 4, 0, -0.5, 0.5, 0.5,
-4.175702, -4.119574, 4, 1, -0.5, 0.5, 0.5,
-4.175702, -4.119574, 4, 1, 1.5, 0.5, 0.5,
-4.175702, -4.119574, 4, 0, 1.5, 0.5, 0.5
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
-3.692865, -3.613196, -6.043859,
-3.692865, 3.138516, -6.043859,
-3.692865, -3.613196, 5.427704,
-3.692865, 3.138516, 5.427704,
-3.692865, -3.613196, -6.043859,
-3.692865, -3.613196, 5.427704,
-3.692865, 3.138516, -6.043859,
-3.692865, 3.138516, 5.427704,
-3.692865, -3.613196, -6.043859,
2.744965, -3.613196, -6.043859,
-3.692865, -3.613196, 5.427704,
2.744965, -3.613196, 5.427704,
-3.692865, 3.138516, -6.043859,
2.744965, 3.138516, -6.043859,
-3.692865, 3.138516, 5.427704,
2.744965, 3.138516, 5.427704,
2.744965, -3.613196, -6.043859,
2.744965, 3.138516, -6.043859,
2.744965, -3.613196, 5.427704,
2.744965, 3.138516, 5.427704,
2.744965, -3.613196, -6.043859,
2.744965, -3.613196, 5.427704,
2.744965, 3.138516, -6.043859,
2.744965, 3.138516, 5.427704
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
var radius = 7.895477;
var distance = 35.12787;
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
mvMatrix.translate( 0.4739498, 0.2373397, 0.3080776 );
mvMatrix.scale( 1.326028, 1.264382, 0.7441658 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12787);
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


