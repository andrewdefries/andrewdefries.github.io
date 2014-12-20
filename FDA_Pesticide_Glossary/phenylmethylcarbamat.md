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
-3.643464, 1.687865, -1.092437, 1, 0, 0, 1,
-2.907245, -0.1746102, -2.02765, 1, 0.007843138, 0, 1,
-2.629594, 0.4819448, -0.4202772, 1, 0.01176471, 0, 1,
-2.509181, -1.711522, -2.120335, 1, 0.01960784, 0, 1,
-2.474777, 0.7831424, -1.826677, 1, 0.02352941, 0, 1,
-2.469052, 0.1268849, -1.548324, 1, 0.03137255, 0, 1,
-2.40983, -2.493042, -1.087372, 1, 0.03529412, 0, 1,
-2.391087, -0.1828854, -2.881068, 1, 0.04313726, 0, 1,
-2.38656, -0.7590172, -2.658462, 1, 0.04705882, 0, 1,
-2.378481, 0.6734018, -0.8547226, 1, 0.05490196, 0, 1,
-2.319037, 0.3264422, -2.780769, 1, 0.05882353, 0, 1,
-2.260222, -1.215301, -2.768503, 1, 0.06666667, 0, 1,
-2.257574, -0.954055, -2.534101, 1, 0.07058824, 0, 1,
-2.245912, -2.875303, -1.972801, 1, 0.07843138, 0, 1,
-2.157137, 1.07008, 0.2297867, 1, 0.08235294, 0, 1,
-2.122326, -0.07279599, -2.505656, 1, 0.09019608, 0, 1,
-2.091143, -0.6579857, -2.728795, 1, 0.09411765, 0, 1,
-2.056062, -0.7465001, -1.914572, 1, 0.1019608, 0, 1,
-2.051951, 0.7898698, -1.57575, 1, 0.1098039, 0, 1,
-2.046597, 0.8974966, -1.55354, 1, 0.1137255, 0, 1,
-2.042686, -0.8469809, -1.147229, 1, 0.1215686, 0, 1,
-2.025959, -0.5876686, -3.407844, 1, 0.1254902, 0, 1,
-1.986505, 0.8337998, -0.8190701, 1, 0.1333333, 0, 1,
-1.984853, -0.15602, -1.837945, 1, 0.1372549, 0, 1,
-1.980014, -1.750751, -2.695642, 1, 0.145098, 0, 1,
-1.978413, -0.7012676, -2.199761, 1, 0.1490196, 0, 1,
-1.978243, 0.5950255, -1.564992, 1, 0.1568628, 0, 1,
-1.96267, 0.8905862, -1.152614, 1, 0.1607843, 0, 1,
-1.945228, 1.357412, 0.01793604, 1, 0.1686275, 0, 1,
-1.938287, 0.3360929, -0.5892705, 1, 0.172549, 0, 1,
-1.885427, 0.4138616, -1.376222, 1, 0.1803922, 0, 1,
-1.863725, 0.720516, -1.911758, 1, 0.1843137, 0, 1,
-1.851726, -0.4707655, -0.1276755, 1, 0.1921569, 0, 1,
-1.851417, 0.1249679, -1.74646, 1, 0.1960784, 0, 1,
-1.84711, 1.279547, 0.2403653, 1, 0.2039216, 0, 1,
-1.806402, -0.2953588, -1.078685, 1, 0.2117647, 0, 1,
-1.804981, -1.368241, -0.6327391, 1, 0.2156863, 0, 1,
-1.79838, 0.1832302, -0.5411554, 1, 0.2235294, 0, 1,
-1.781931, 0.256424, -1.474798, 1, 0.227451, 0, 1,
-1.781405, 1.759963, -0.7008318, 1, 0.2352941, 0, 1,
-1.763504, -1.011652, -4.108795, 1, 0.2392157, 0, 1,
-1.754828, 1.605165, -0.3816667, 1, 0.2470588, 0, 1,
-1.74412, 0.4182791, -1.050326, 1, 0.2509804, 0, 1,
-1.713065, 0.2540595, -0.1183877, 1, 0.2588235, 0, 1,
-1.712061, -0.1654, -0.01577846, 1, 0.2627451, 0, 1,
-1.710335, -0.6410493, -2.41048, 1, 0.2705882, 0, 1,
-1.704328, 1.247502, -1.761445, 1, 0.2745098, 0, 1,
-1.699874, -1.25999, -1.847843, 1, 0.282353, 0, 1,
-1.694185, 0.2315973, -2.008678, 1, 0.2862745, 0, 1,
-1.686605, 1.217951, -0.8627368, 1, 0.2941177, 0, 1,
-1.684258, 0.006603709, -2.845398, 1, 0.3019608, 0, 1,
-1.68293, -2.152362, -0.005901261, 1, 0.3058824, 0, 1,
-1.679981, 1.024604, -0.6524443, 1, 0.3137255, 0, 1,
-1.676808, 1.315937, -1.08411, 1, 0.3176471, 0, 1,
-1.654125, -0.6805896, -2.667491, 1, 0.3254902, 0, 1,
-1.653447, -0.6087064, -2.838475, 1, 0.3294118, 0, 1,
-1.636815, 1.677413, -1.431483, 1, 0.3372549, 0, 1,
-1.628461, 1.92445, -0.7779506, 1, 0.3411765, 0, 1,
-1.625693, 1.832806, -0.7412865, 1, 0.3490196, 0, 1,
-1.625358, 1.055463, 0.8500866, 1, 0.3529412, 0, 1,
-1.614778, 0.8649331, 1.29022, 1, 0.3607843, 0, 1,
-1.592257, -0.3735067, -1.112394, 1, 0.3647059, 0, 1,
-1.585333, 0.2701187, -1.798457, 1, 0.372549, 0, 1,
-1.580706, 0.4757651, -1.601858, 1, 0.3764706, 0, 1,
-1.573932, -0.008062125, -1.338416, 1, 0.3843137, 0, 1,
-1.566393, 0.5944491, 0.6514115, 1, 0.3882353, 0, 1,
-1.558904, 0.2959131, -2.376926, 1, 0.3960784, 0, 1,
-1.558744, -0.6895061, -1.967759, 1, 0.4039216, 0, 1,
-1.536557, -0.5888439, -2.590394, 1, 0.4078431, 0, 1,
-1.507363, 0.6389149, -2.063224, 1, 0.4156863, 0, 1,
-1.502104, -0.9681576, -1.475133, 1, 0.4196078, 0, 1,
-1.501823, 0.6977054, -1.783232, 1, 0.427451, 0, 1,
-1.496617, 1.589754, -2.201766, 1, 0.4313726, 0, 1,
-1.487443, -0.3275805, -3.121119, 1, 0.4392157, 0, 1,
-1.483604, -0.05593372, -0.5035228, 1, 0.4431373, 0, 1,
-1.481288, -0.6594104, -1.509884, 1, 0.4509804, 0, 1,
-1.473681, 1.010532, -0.8466161, 1, 0.454902, 0, 1,
-1.468627, -0.04111406, -1.109724, 1, 0.4627451, 0, 1,
-1.467518, 0.1829016, -3.591329, 1, 0.4666667, 0, 1,
-1.457651, -1.264614, -2.425826, 1, 0.4745098, 0, 1,
-1.440623, -0.2078556, -2.209893, 1, 0.4784314, 0, 1,
-1.430661, 0.1599174, -3.448159, 1, 0.4862745, 0, 1,
-1.420102, 0.4873101, -1.208404, 1, 0.4901961, 0, 1,
-1.416378, 0.5018041, -1.284971, 1, 0.4980392, 0, 1,
-1.40479, 1.69492, -0.8372851, 1, 0.5058824, 0, 1,
-1.403536, 0.1323909, -2.501662, 1, 0.509804, 0, 1,
-1.393438, 0.5872524, -2.210959, 1, 0.5176471, 0, 1,
-1.391796, 1.107544, -0.8572015, 1, 0.5215687, 0, 1,
-1.385232, -0.2825304, -2.280251, 1, 0.5294118, 0, 1,
-1.384609, 0.6701883, -2.038875, 1, 0.5333334, 0, 1,
-1.374491, -0.1122877, -1.353382, 1, 0.5411765, 0, 1,
-1.368006, -1.186528, -1.136377, 1, 0.5450981, 0, 1,
-1.35808, -0.4011947, -2.049191, 1, 0.5529412, 0, 1,
-1.350236, 0.2233314, -1.470053, 1, 0.5568628, 0, 1,
-1.349463, 2.762415, -3.006491, 1, 0.5647059, 0, 1,
-1.346285, -2.001743, -2.53551, 1, 0.5686275, 0, 1,
-1.342445, -0.78934, -3.776896, 1, 0.5764706, 0, 1,
-1.342338, -0.2194246, -0.2543241, 1, 0.5803922, 0, 1,
-1.336841, 0.06631248, -0.7864023, 1, 0.5882353, 0, 1,
-1.332414, -0.8923419, -1.810992, 1, 0.5921569, 0, 1,
-1.313124, -1.023725, -1.7661, 1, 0.6, 0, 1,
-1.310304, -0.0350293, -0.2300054, 1, 0.6078432, 0, 1,
-1.308559, -0.5625556, -2.203815, 1, 0.6117647, 0, 1,
-1.307629, 1.955738, 0.4160251, 1, 0.6196079, 0, 1,
-1.30275, -0.2017573, 0.6059377, 1, 0.6235294, 0, 1,
-1.299738, -2.238816, -2.213349, 1, 0.6313726, 0, 1,
-1.297336, -0.2582761, -1.607784, 1, 0.6352941, 0, 1,
-1.288944, 0.5502914, -0.7496356, 1, 0.6431373, 0, 1,
-1.287398, -0.242344, -1.158289, 1, 0.6470588, 0, 1,
-1.286452, 1.049671, 0.3041461, 1, 0.654902, 0, 1,
-1.283886, 0.536705, -1.904992, 1, 0.6588235, 0, 1,
-1.282904, -0.547669, -1.814969, 1, 0.6666667, 0, 1,
-1.273776, 0.6971652, -1.314782, 1, 0.6705883, 0, 1,
-1.273545, 0.7331867, -0.5152673, 1, 0.6784314, 0, 1,
-1.271108, 0.02721834, -0.9182142, 1, 0.682353, 0, 1,
-1.266104, 2.87133, -0.7886143, 1, 0.6901961, 0, 1,
-1.264961, -0.7594213, -0.9559859, 1, 0.6941177, 0, 1,
-1.262125, -1.643716, -1.573294, 1, 0.7019608, 0, 1,
-1.257683, 1.265386, -0.6578499, 1, 0.7098039, 0, 1,
-1.249644, 2.06329, -1.119864, 1, 0.7137255, 0, 1,
-1.247872, 0.5515339, -0.5975237, 1, 0.7215686, 0, 1,
-1.230827, 0.8407702, -2.469194, 1, 0.7254902, 0, 1,
-1.229888, 0.7357143, -1.839326, 1, 0.7333333, 0, 1,
-1.223624, 2.291203, 0.3070251, 1, 0.7372549, 0, 1,
-1.200252, -0.6605991, -2.583691, 1, 0.7450981, 0, 1,
-1.198716, 0.7106746, -1.595507, 1, 0.7490196, 0, 1,
-1.197556, -0.5752712, -2.106294, 1, 0.7568628, 0, 1,
-1.193117, -0.3569047, -0.9625039, 1, 0.7607843, 0, 1,
-1.193008, -0.06460226, -2.915692, 1, 0.7686275, 0, 1,
-1.19116, 0.6661986, -0.4723159, 1, 0.772549, 0, 1,
-1.186573, 0.1537794, -1.705556, 1, 0.7803922, 0, 1,
-1.183009, -0.2540559, -0.07708003, 1, 0.7843137, 0, 1,
-1.172462, -0.5037177, -3.572499, 1, 0.7921569, 0, 1,
-1.157227, 1.183467, 0.07991005, 1, 0.7960784, 0, 1,
-1.155313, -0.775341, -1.808854, 1, 0.8039216, 0, 1,
-1.155067, 1.010383, -1.583892, 1, 0.8117647, 0, 1,
-1.153305, 0.2949079, -1.850141, 1, 0.8156863, 0, 1,
-1.149472, 2.756959, -1.157775, 1, 0.8235294, 0, 1,
-1.143925, 0.6966366, -1.344788, 1, 0.827451, 0, 1,
-1.143596, -0.8947826, -1.266555, 1, 0.8352941, 0, 1,
-1.143547, 2.568397, 1.590702, 1, 0.8392157, 0, 1,
-1.14067, -0.4023386, -3.155788, 1, 0.8470588, 0, 1,
-1.132002, -1.891768, -3.653257, 1, 0.8509804, 0, 1,
-1.131975, 0.7788924, -1.520439, 1, 0.8588235, 0, 1,
-1.131001, -0.3954266, -1.924972, 1, 0.8627451, 0, 1,
-1.130875, 0.4379337, -0.8787069, 1, 0.8705882, 0, 1,
-1.128163, -0.6539392, -1.284931, 1, 0.8745098, 0, 1,
-1.127235, 1.121596, 0.5632479, 1, 0.8823529, 0, 1,
-1.124664, 1.122126, -1.295135, 1, 0.8862745, 0, 1,
-1.117229, -0.2935981, -1.414595, 1, 0.8941177, 0, 1,
-1.109989, -0.1748132, -2.638198, 1, 0.8980392, 0, 1,
-1.098844, 0.5870344, -0.6997602, 1, 0.9058824, 0, 1,
-1.097633, -0.3003542, -1.517071, 1, 0.9137255, 0, 1,
-1.093408, 0.6631444, -0.4154358, 1, 0.9176471, 0, 1,
-1.088704, 0.2919518, -2.611576, 1, 0.9254902, 0, 1,
-1.075438, -1.153571, -1.397812, 1, 0.9294118, 0, 1,
-1.067095, -0.9377334, -4.073113, 1, 0.9372549, 0, 1,
-1.064336, 0.4022287, -0.656318, 1, 0.9411765, 0, 1,
-1.061936, -0.677296, -2.563041, 1, 0.9490196, 0, 1,
-1.046902, 0.5631214, -0.4726729, 1, 0.9529412, 0, 1,
-1.037831, 0.3286943, -1.375568, 1, 0.9607843, 0, 1,
-1.033525, 0.03413421, -3.501451, 1, 0.9647059, 0, 1,
-1.025348, -0.39185, -0.9252249, 1, 0.972549, 0, 1,
-1.024112, -0.7649562, -1.535593, 1, 0.9764706, 0, 1,
-1.016146, 0.8183494, -1.851919, 1, 0.9843137, 0, 1,
-1.015658, -0.2639209, -1.187414, 1, 0.9882353, 0, 1,
-1.010297, -0.6588283, -2.758407, 1, 0.9960784, 0, 1,
-0.9990625, -0.4226258, -1.940769, 0.9960784, 1, 0, 1,
-0.9968786, -0.7448509, -2.257222, 0.9921569, 1, 0, 1,
-0.9959471, 0.932126, -0.3919262, 0.9843137, 1, 0, 1,
-0.9951295, 0.4436903, -0.9795462, 0.9803922, 1, 0, 1,
-0.9872722, 0.3277392, -2.17922, 0.972549, 1, 0, 1,
-0.9852112, 0.5369357, -1.310464, 0.9686275, 1, 0, 1,
-0.9838481, -0.315609, -1.701972, 0.9607843, 1, 0, 1,
-0.983437, -1.234118, -2.172288, 0.9568627, 1, 0, 1,
-0.9760208, -0.7463785, -4.152999, 0.9490196, 1, 0, 1,
-0.9666923, 2.026604, -0.04604877, 0.945098, 1, 0, 1,
-0.9654813, 1.391395, 0.05368261, 0.9372549, 1, 0, 1,
-0.965225, -0.8756847, -3.252375, 0.9333333, 1, 0, 1,
-0.956656, 1.537075, 0.4826419, 0.9254902, 1, 0, 1,
-0.9527755, 1.275636, -0.4546929, 0.9215686, 1, 0, 1,
-0.9487967, 0.1137016, -0.9888108, 0.9137255, 1, 0, 1,
-0.9330204, 0.5911697, -1.222219, 0.9098039, 1, 0, 1,
-0.9321981, -0.2775582, -2.738643, 0.9019608, 1, 0, 1,
-0.9240163, -2.17916, -3.17636, 0.8941177, 1, 0, 1,
-0.9234608, 0.6300402, -0.7727076, 0.8901961, 1, 0, 1,
-0.9184076, 0.513967, -0.9624165, 0.8823529, 1, 0, 1,
-0.9177023, 0.5861053, -0.9899659, 0.8784314, 1, 0, 1,
-0.9174152, 0.5837997, -1.691982, 0.8705882, 1, 0, 1,
-0.9141397, -0.6560768, -2.203869, 0.8666667, 1, 0, 1,
-0.9139834, 1.252312, -2.018178, 0.8588235, 1, 0, 1,
-0.9132142, -0.07904318, -2.490717, 0.854902, 1, 0, 1,
-0.911444, -0.4084918, -0.9220906, 0.8470588, 1, 0, 1,
-0.9109372, -2.586589, -2.790542, 0.8431373, 1, 0, 1,
-0.9077263, -2.390021, -1.286881, 0.8352941, 1, 0, 1,
-0.9002073, 0.06193165, -1.404532, 0.8313726, 1, 0, 1,
-0.8996778, 0.7985716, 0.1289144, 0.8235294, 1, 0, 1,
-0.8875996, -0.99529, -3.950056, 0.8196079, 1, 0, 1,
-0.8865421, -1.033336, -2.1411, 0.8117647, 1, 0, 1,
-0.8853523, -0.5102639, -2.743652, 0.8078431, 1, 0, 1,
-0.8826746, 1.786539, -0.5766159, 0.8, 1, 0, 1,
-0.8653367, 0.1696374, -2.171655, 0.7921569, 1, 0, 1,
-0.860639, 0.3043549, -1.814262, 0.7882353, 1, 0, 1,
-0.8593076, -1.450142, -1.599944, 0.7803922, 1, 0, 1,
-0.8562758, 0.1158133, -1.149362, 0.7764706, 1, 0, 1,
-0.8468773, 1.047461, 1.164714, 0.7686275, 1, 0, 1,
-0.8467099, -0.9938571, -4.229771, 0.7647059, 1, 0, 1,
-0.8306841, -0.4143657, -1.095083, 0.7568628, 1, 0, 1,
-0.8235697, 1.030647, 0.2624803, 0.7529412, 1, 0, 1,
-0.8222882, 0.6036388, -1.516428, 0.7450981, 1, 0, 1,
-0.8199542, 0.487383, -1.968341, 0.7411765, 1, 0, 1,
-0.8136806, -1.044897, -3.71912, 0.7333333, 1, 0, 1,
-0.810559, -0.6620084, -0.9459349, 0.7294118, 1, 0, 1,
-0.8096982, 0.6718983, -1.724222, 0.7215686, 1, 0, 1,
-0.8094504, -1.579174, -3.803188, 0.7176471, 1, 0, 1,
-0.8056401, -1.685305, -2.360164, 0.7098039, 1, 0, 1,
-0.7980227, -0.1797992, -1.877121, 0.7058824, 1, 0, 1,
-0.7975376, 0.8344472, -2.965237, 0.6980392, 1, 0, 1,
-0.7951651, -1.530782, -1.694441, 0.6901961, 1, 0, 1,
-0.7881395, 1.148745, 0.3162879, 0.6862745, 1, 0, 1,
-0.7863449, 0.738074, 0.4653024, 0.6784314, 1, 0, 1,
-0.7823581, 0.1274051, -1.339376, 0.6745098, 1, 0, 1,
-0.7815362, 1.415243, 0.6571442, 0.6666667, 1, 0, 1,
-0.7755362, 0.04081361, 0.3126802, 0.6627451, 1, 0, 1,
-0.7752839, 2.082998, -1.301177, 0.654902, 1, 0, 1,
-0.7732131, 0.04038539, -2.986328, 0.6509804, 1, 0, 1,
-0.7704093, 1.05665, -0.09105378, 0.6431373, 1, 0, 1,
-0.7611023, -1.061395, -2.829431, 0.6392157, 1, 0, 1,
-0.7576588, 0.4884198, -0.726585, 0.6313726, 1, 0, 1,
-0.7567673, 0.06735047, -0.9825655, 0.627451, 1, 0, 1,
-0.7515247, -1.488372, -3.097975, 0.6196079, 1, 0, 1,
-0.7493379, 0.4283496, 1.767934, 0.6156863, 1, 0, 1,
-0.7484949, 1.760247, -0.0576136, 0.6078432, 1, 0, 1,
-0.7472172, -0.3773143, -0.6910174, 0.6039216, 1, 0, 1,
-0.7468584, -0.8563491, -3.130522, 0.5960785, 1, 0, 1,
-0.744585, -0.3949521, -0.7731209, 0.5882353, 1, 0, 1,
-0.7370797, -0.1685278, -1.600798, 0.5843138, 1, 0, 1,
-0.7348236, -2.108929, -1.456383, 0.5764706, 1, 0, 1,
-0.7264097, -1.941261, -1.271371, 0.572549, 1, 0, 1,
-0.7248099, -0.03575108, -0.4635946, 0.5647059, 1, 0, 1,
-0.7169948, 1.241232, -0.7489353, 0.5607843, 1, 0, 1,
-0.7160548, -0.235955, -2.396937, 0.5529412, 1, 0, 1,
-0.7127801, 1.297678, 0.6109877, 0.5490196, 1, 0, 1,
-0.7097802, 1.082131, 0.8735535, 0.5411765, 1, 0, 1,
-0.7003291, -2.248028, -3.934226, 0.5372549, 1, 0, 1,
-0.6965808, -0.8460816, -1.440854, 0.5294118, 1, 0, 1,
-0.6965471, -0.7820916, -1.544542, 0.5254902, 1, 0, 1,
-0.6951328, -0.9957358, -2.15142, 0.5176471, 1, 0, 1,
-0.6928052, 0.8241292, -0.1003563, 0.5137255, 1, 0, 1,
-0.6923378, -0.88503, 0.1856265, 0.5058824, 1, 0, 1,
-0.685784, -0.8460042, -1.418409, 0.5019608, 1, 0, 1,
-0.6814508, 0.08656986, -2.144591, 0.4941176, 1, 0, 1,
-0.680097, 0.6234996, -0.1584415, 0.4862745, 1, 0, 1,
-0.6789963, -0.5533886, -1.488924, 0.4823529, 1, 0, 1,
-0.6774004, -1.14609, -2.701693, 0.4745098, 1, 0, 1,
-0.6760483, -0.3589714, -2.409503, 0.4705882, 1, 0, 1,
-0.6706547, -0.1878919, -1.730083, 0.4627451, 1, 0, 1,
-0.6703355, -1.77009, -3.720794, 0.4588235, 1, 0, 1,
-0.6621087, 0.06999533, -2.024848, 0.4509804, 1, 0, 1,
-0.6575907, 0.7554889, -1.439439, 0.4470588, 1, 0, 1,
-0.6569633, -0.1618077, -1.849856, 0.4392157, 1, 0, 1,
-0.6568041, -0.06064761, -0.7339594, 0.4352941, 1, 0, 1,
-0.6567868, -0.3397514, -3.050207, 0.427451, 1, 0, 1,
-0.6544684, -1.290269, -1.032181, 0.4235294, 1, 0, 1,
-0.6526703, -0.7691672, -1.873737, 0.4156863, 1, 0, 1,
-0.6526265, -1.373062, -2.958361, 0.4117647, 1, 0, 1,
-0.6477641, -1.207383, -1.430669, 0.4039216, 1, 0, 1,
-0.6388212, -0.6230776, -2.536459, 0.3960784, 1, 0, 1,
-0.638751, -0.8450972, -1.701506, 0.3921569, 1, 0, 1,
-0.6369606, -1.448097, -1.745823, 0.3843137, 1, 0, 1,
-0.6234109, -0.4404646, -0.8287686, 0.3803922, 1, 0, 1,
-0.6231482, 0.5190661, -0.5960794, 0.372549, 1, 0, 1,
-0.6208664, 0.7883436, -1.659938, 0.3686275, 1, 0, 1,
-0.6185307, -0.3774117, -1.912191, 0.3607843, 1, 0, 1,
-0.6175273, 0.0984075, -0.628717, 0.3568628, 1, 0, 1,
-0.615256, 1.194588, 0.2511817, 0.3490196, 1, 0, 1,
-0.6149088, -1.142031, -2.362067, 0.345098, 1, 0, 1,
-0.6093671, -1.454672, -3.986818, 0.3372549, 1, 0, 1,
-0.6087598, 1.561079, -0.4280668, 0.3333333, 1, 0, 1,
-0.6019808, -1.915568, -2.429879, 0.3254902, 1, 0, 1,
-0.5993477, -0.7352458, -0.9571617, 0.3215686, 1, 0, 1,
-0.5984815, -0.2950614, -0.8548031, 0.3137255, 1, 0, 1,
-0.5971636, -0.2795103, -0.7352406, 0.3098039, 1, 0, 1,
-0.5819067, -0.01815261, -1.990588, 0.3019608, 1, 0, 1,
-0.5796651, -2.887066, -1.420084, 0.2941177, 1, 0, 1,
-0.5792041, -0.4348445, -2.920333, 0.2901961, 1, 0, 1,
-0.5783017, 0.5163085, -1.684334, 0.282353, 1, 0, 1,
-0.5770661, -0.5615504, -3.484616, 0.2784314, 1, 0, 1,
-0.575744, 1.041088, -1.427152, 0.2705882, 1, 0, 1,
-0.5706189, -1.138193, -2.908432, 0.2666667, 1, 0, 1,
-0.5562201, -0.7262319, -3.23248, 0.2588235, 1, 0, 1,
-0.5505698, 0.5207529, -0.6994411, 0.254902, 1, 0, 1,
-0.5486742, 0.9632925, 0.1876422, 0.2470588, 1, 0, 1,
-0.5481333, 1.119858, 0.3253267, 0.2431373, 1, 0, 1,
-0.5459191, -0.1828573, -2.293272, 0.2352941, 1, 0, 1,
-0.5444586, 0.5458742, 0.7016992, 0.2313726, 1, 0, 1,
-0.5427034, -0.08567686, -2.003211, 0.2235294, 1, 0, 1,
-0.5380567, 0.04487935, -2.520819, 0.2196078, 1, 0, 1,
-0.538047, 0.1361178, -1.202361, 0.2117647, 1, 0, 1,
-0.5376204, -0.03867281, -2.034927, 0.2078431, 1, 0, 1,
-0.5373607, -1.918981, -1.735231, 0.2, 1, 0, 1,
-0.5335287, -0.1958253, -0.803259, 0.1921569, 1, 0, 1,
-0.5303448, -1.252352, -2.68805, 0.1882353, 1, 0, 1,
-0.5286905, -0.959776, -1.753862, 0.1803922, 1, 0, 1,
-0.5261249, -0.04245298, -1.308319, 0.1764706, 1, 0, 1,
-0.5261155, 0.4358597, -1.968906, 0.1686275, 1, 0, 1,
-0.5145976, -2.125863, -0.9202167, 0.1647059, 1, 0, 1,
-0.5067082, -0.6819036, -3.413908, 0.1568628, 1, 0, 1,
-0.5048005, -0.2501368, -1.613489, 0.1529412, 1, 0, 1,
-0.5036348, 0.03964191, -1.106638, 0.145098, 1, 0, 1,
-0.4948607, -0.08571156, -1.004212, 0.1411765, 1, 0, 1,
-0.4944531, 0.5393187, -1.478573, 0.1333333, 1, 0, 1,
-0.4936877, 0.03928217, -0.631357, 0.1294118, 1, 0, 1,
-0.4928385, -0.7469395, -2.056773, 0.1215686, 1, 0, 1,
-0.4923163, -0.2158631, -0.3431689, 0.1176471, 1, 0, 1,
-0.4916247, 1.633064, -0.5672385, 0.1098039, 1, 0, 1,
-0.4888571, -0.6570572, -2.335636, 0.1058824, 1, 0, 1,
-0.4842524, 0.6658631, -0.5580618, 0.09803922, 1, 0, 1,
-0.482384, 0.4319912, -2.132346, 0.09019608, 1, 0, 1,
-0.4817084, -0.5580841, -1.16713, 0.08627451, 1, 0, 1,
-0.4812745, -0.04821594, -2.077829, 0.07843138, 1, 0, 1,
-0.480778, 0.1898231, -1.973235, 0.07450981, 1, 0, 1,
-0.4755841, 0.6576055, -1.294047, 0.06666667, 1, 0, 1,
-0.4754167, 0.4452745, -1.242323, 0.0627451, 1, 0, 1,
-0.4735229, -1.278414, -2.6856, 0.05490196, 1, 0, 1,
-0.4716071, -1.838992, -3.169965, 0.05098039, 1, 0, 1,
-0.4706169, 1.328201, -0.9321758, 0.04313726, 1, 0, 1,
-0.4655586, -1.492711, -3.322196, 0.03921569, 1, 0, 1,
-0.4631476, -1.20594, -1.300676, 0.03137255, 1, 0, 1,
-0.4604579, -0.3002163, -0.6276696, 0.02745098, 1, 0, 1,
-0.4558924, -1.158635, -2.413889, 0.01960784, 1, 0, 1,
-0.4543938, -0.4690816, -3.712683, 0.01568628, 1, 0, 1,
-0.4525158, -0.2377839, -1.897625, 0.007843138, 1, 0, 1,
-0.4509682, -0.5370316, -2.731331, 0.003921569, 1, 0, 1,
-0.4471447, -1.235284, -1.955686, 0, 1, 0.003921569, 1,
-0.4446319, 1.096698, -0.5705335, 0, 1, 0.01176471, 1,
-0.4421135, 0.1921677, -0.7418365, 0, 1, 0.01568628, 1,
-0.4420527, 0.7671066, 1.321749, 0, 1, 0.02352941, 1,
-0.4394591, -0.7389163, -2.346652, 0, 1, 0.02745098, 1,
-0.4380432, 2.062314, -0.7099471, 0, 1, 0.03529412, 1,
-0.431486, 1.840409, -0.1186768, 0, 1, 0.03921569, 1,
-0.4290009, -1.444786, -2.83089, 0, 1, 0.04705882, 1,
-0.4219875, 0.2138834, -0.6325795, 0, 1, 0.05098039, 1,
-0.4167487, 0.1832208, -1.234638, 0, 1, 0.05882353, 1,
-0.4161475, 2.060171, 0.34727, 0, 1, 0.0627451, 1,
-0.4127114, 0.3354248, -0.7230328, 0, 1, 0.07058824, 1,
-0.402067, 0.3377132, 0.1735068, 0, 1, 0.07450981, 1,
-0.401805, -0.1858963, -1.204246, 0, 1, 0.08235294, 1,
-0.4002267, 0.9609798, 1.215962, 0, 1, 0.08627451, 1,
-0.3952924, 0.1913836, -1.346866, 0, 1, 0.09411765, 1,
-0.3952427, -0.3077663, -2.622929, 0, 1, 0.1019608, 1,
-0.3945855, 0.01698539, -1.768076, 0, 1, 0.1058824, 1,
-0.3867234, -2.463954, -1.649348, 0, 1, 0.1137255, 1,
-0.38611, 0.3012453, -1.563311, 0, 1, 0.1176471, 1,
-0.383638, 0.9228989, -1.240072, 0, 1, 0.1254902, 1,
-0.3827473, 1.313201, -1.621539, 0, 1, 0.1294118, 1,
-0.3820128, 0.5062214, -2.679585, 0, 1, 0.1372549, 1,
-0.3805345, -1.428919, -1.878147, 0, 1, 0.1411765, 1,
-0.3688031, 0.4626576, -0.7987045, 0, 1, 0.1490196, 1,
-0.3657313, -0.2073799, -2.17364, 0, 1, 0.1529412, 1,
-0.355114, 0.05579672, -2.91438, 0, 1, 0.1607843, 1,
-0.3519509, -0.8985469, -3.45307, 0, 1, 0.1647059, 1,
-0.3507995, -2.230182, -3.571462, 0, 1, 0.172549, 1,
-0.3409203, -0.09145035, -0.9686984, 0, 1, 0.1764706, 1,
-0.3406529, 0.8942651, 0.5392956, 0, 1, 0.1843137, 1,
-0.3396599, -0.8771142, -4.508357, 0, 1, 0.1882353, 1,
-0.3325764, 0.263047, -1.884592, 0, 1, 0.1960784, 1,
-0.3162439, -0.01553214, -0.9938218, 0, 1, 0.2039216, 1,
-0.3157972, -2.858587, -3.779891, 0, 1, 0.2078431, 1,
-0.3153715, -1.229275, -3.493713, 0, 1, 0.2156863, 1,
-0.3132859, -0.6303312, -1.986651, 0, 1, 0.2196078, 1,
-0.3129554, -2.095813, -2.61803, 0, 1, 0.227451, 1,
-0.3110798, -0.01685827, -3.23836, 0, 1, 0.2313726, 1,
-0.3094056, 1.142179, -0.4496976, 0, 1, 0.2392157, 1,
-0.3035529, 1.282084, 1.666031, 0, 1, 0.2431373, 1,
-0.3016775, 0.1058857, -1.668392, 0, 1, 0.2509804, 1,
-0.3010471, 0.07425619, -3.624469, 0, 1, 0.254902, 1,
-0.2888735, -0.9157803, -2.902042, 0, 1, 0.2627451, 1,
-0.278387, 0.5095544, -1.039768, 0, 1, 0.2666667, 1,
-0.2771229, -0.5179505, -2.389709, 0, 1, 0.2745098, 1,
-0.2762996, -0.5926877, -1.448302, 0, 1, 0.2784314, 1,
-0.2745737, 0.5159241, -1.494114, 0, 1, 0.2862745, 1,
-0.2714692, -0.4221788, -1.746004, 0, 1, 0.2901961, 1,
-0.2708394, 0.2615041, -2.227976, 0, 1, 0.2980392, 1,
-0.2704205, -1.195242, -3.614617, 0, 1, 0.3058824, 1,
-0.2665778, 1.592526, -0.3881688, 0, 1, 0.3098039, 1,
-0.264806, -0.5846304, -2.070127, 0, 1, 0.3176471, 1,
-0.2552111, 0.2036011, 0.80102, 0, 1, 0.3215686, 1,
-0.2506504, 0.4203131, -2.571013, 0, 1, 0.3294118, 1,
-0.2505768, -0.7841032, -3.0953, 0, 1, 0.3333333, 1,
-0.2481834, -2.013096, -3.215487, 0, 1, 0.3411765, 1,
-0.2477025, 0.07171156, -1.797902, 0, 1, 0.345098, 1,
-0.2465532, 0.1952602, -0.7063408, 0, 1, 0.3529412, 1,
-0.2410767, 0.5222545, 0.8338744, 0, 1, 0.3568628, 1,
-0.2404864, -1.241396, -0.9289802, 0, 1, 0.3647059, 1,
-0.2394874, -1.349986, -3.750011, 0, 1, 0.3686275, 1,
-0.2326496, 0.6812233, 1.435453, 0, 1, 0.3764706, 1,
-0.230377, -0.9813349, -1.533683, 0, 1, 0.3803922, 1,
-0.2288843, 0.2381304, -0.5333242, 0, 1, 0.3882353, 1,
-0.2288736, -0.6029956, -2.115665, 0, 1, 0.3921569, 1,
-0.2255394, -0.721293, -3.080887, 0, 1, 0.4, 1,
-0.2244547, 2.344559, 0.9812621, 0, 1, 0.4078431, 1,
-0.2239612, 1.296737, 0.5664173, 0, 1, 0.4117647, 1,
-0.2237485, 0.8409626, -1.961133, 0, 1, 0.4196078, 1,
-0.223262, 1.859895, 0.5538921, 0, 1, 0.4235294, 1,
-0.218964, -0.9472365, -5.717322, 0, 1, 0.4313726, 1,
-0.2180605, -1.552621, -2.848928, 0, 1, 0.4352941, 1,
-0.2164128, -0.825088, -2.511708, 0, 1, 0.4431373, 1,
-0.2147551, -0.4364257, -4.126888, 0, 1, 0.4470588, 1,
-0.2001279, 0.5037385, 0.8730311, 0, 1, 0.454902, 1,
-0.199437, -0.8650978, -2.838584, 0, 1, 0.4588235, 1,
-0.1979928, -0.2261955, -2.227193, 0, 1, 0.4666667, 1,
-0.1935727, -0.2627969, -4.907453, 0, 1, 0.4705882, 1,
-0.1911052, -1.614096, -3.575701, 0, 1, 0.4784314, 1,
-0.1860245, 0.4546764, 1.692114, 0, 1, 0.4823529, 1,
-0.1839485, -0.03994108, -0.1288963, 0, 1, 0.4901961, 1,
-0.1835439, -0.2957629, -2.43539, 0, 1, 0.4941176, 1,
-0.1816064, -1.499974, -3.445768, 0, 1, 0.5019608, 1,
-0.1792144, -0.6245183, -2.824886, 0, 1, 0.509804, 1,
-0.1768073, 0.007219926, 0.3780977, 0, 1, 0.5137255, 1,
-0.1750052, -0.9914864, -2.215433, 0, 1, 0.5215687, 1,
-0.1718, -0.7434781, -5.18365, 0, 1, 0.5254902, 1,
-0.1696118, -0.06508441, -1.863241, 0, 1, 0.5333334, 1,
-0.1691867, -0.005001009, -1.921566, 0, 1, 0.5372549, 1,
-0.1689331, 1.271734, -1.316431, 0, 1, 0.5450981, 1,
-0.1631974, 0.6087979, 0.2398432, 0, 1, 0.5490196, 1,
-0.161208, 0.3730744, -1.295061, 0, 1, 0.5568628, 1,
-0.1597378, -0.524081, -1.757385, 0, 1, 0.5607843, 1,
-0.1594908, -0.4869848, -3.351428, 0, 1, 0.5686275, 1,
-0.1581541, 1.676781, -1.426462, 0, 1, 0.572549, 1,
-0.1579285, 0.6207594, -2.503208, 0, 1, 0.5803922, 1,
-0.1535646, -1.868836, -2.835749, 0, 1, 0.5843138, 1,
-0.1532328, 0.1672219, -0.3748331, 0, 1, 0.5921569, 1,
-0.1469947, -1.146557, -3.545474, 0, 1, 0.5960785, 1,
-0.1467151, 0.5415056, 0.4052652, 0, 1, 0.6039216, 1,
-0.1450613, 0.5673463, -0.6242452, 0, 1, 0.6117647, 1,
-0.1438662, -1.514975, -1.670774, 0, 1, 0.6156863, 1,
-0.1383549, -0.1402991, -0.9758639, 0, 1, 0.6235294, 1,
-0.1377801, 0.7576793, -1.193341, 0, 1, 0.627451, 1,
-0.136844, -1.740358, -3.087397, 0, 1, 0.6352941, 1,
-0.1356816, 0.3054928, 0.2444632, 0, 1, 0.6392157, 1,
-0.1350044, -0.2945673, -3.65902, 0, 1, 0.6470588, 1,
-0.1342415, 2.136726, 0.6972585, 0, 1, 0.6509804, 1,
-0.1331221, 0.2284385, 0.1870038, 0, 1, 0.6588235, 1,
-0.1315978, -0.1165379, -1.419672, 0, 1, 0.6627451, 1,
-0.1295829, -0.1886017, -2.601511, 0, 1, 0.6705883, 1,
-0.1217115, 1.70812, 0.7563493, 0, 1, 0.6745098, 1,
-0.1149901, 0.3655833, 0.06377075, 0, 1, 0.682353, 1,
-0.1100735, 0.4416065, 1.327315, 0, 1, 0.6862745, 1,
-0.1082417, 0.8519238, 1.012774, 0, 1, 0.6941177, 1,
-0.1043113, 0.01840023, -1.635616, 0, 1, 0.7019608, 1,
-0.1019848, -0.1953514, -4.408213, 0, 1, 0.7058824, 1,
-0.1001574, 0.2660043, 0.8295522, 0, 1, 0.7137255, 1,
-0.09922478, 1.604842, 0.9157546, 0, 1, 0.7176471, 1,
-0.09499302, 0.2513475, -0.752132, 0, 1, 0.7254902, 1,
-0.09490405, -1.974147, -3.377244, 0, 1, 0.7294118, 1,
-0.0924968, -2.039439, -3.374845, 0, 1, 0.7372549, 1,
-0.08010274, 2.153624, 0.5018552, 0, 1, 0.7411765, 1,
-0.07714303, -0.07872579, -3.12253, 0, 1, 0.7490196, 1,
-0.07606184, 0.1863715, 0.3219786, 0, 1, 0.7529412, 1,
-0.07310141, -0.6647409, -4.127459, 0, 1, 0.7607843, 1,
-0.07127334, -0.3448765, -2.544564, 0, 1, 0.7647059, 1,
-0.06921495, -0.7900254, -2.633592, 0, 1, 0.772549, 1,
-0.06906641, -0.9471393, -1.437031, 0, 1, 0.7764706, 1,
-0.06706373, -0.08216558, -1.190816, 0, 1, 0.7843137, 1,
-0.05667556, 0.107198, -1.252543, 0, 1, 0.7882353, 1,
-0.05601573, 1.047483, 0.7333587, 0, 1, 0.7960784, 1,
-0.05005315, -0.5427451, -2.538474, 0, 1, 0.8039216, 1,
-0.04369217, 0.8313913, -1.173492, 0, 1, 0.8078431, 1,
-0.04076533, 0.1175521, -0.1525411, 0, 1, 0.8156863, 1,
-0.03834362, -0.3554081, -4.403857, 0, 1, 0.8196079, 1,
-0.03292942, 1.335418, 0.6632268, 0, 1, 0.827451, 1,
-0.03232161, 0.7844255, -0.8985412, 0, 1, 0.8313726, 1,
-0.03111892, -0.1135639, -3.449867, 0, 1, 0.8392157, 1,
-0.03013982, 0.2777167, 1.039867, 0, 1, 0.8431373, 1,
-0.02163888, -0.08272296, -3.007724, 0, 1, 0.8509804, 1,
-0.02046156, 2.010129, 0.1447253, 0, 1, 0.854902, 1,
-0.01901381, 1.092719, -1.398911, 0, 1, 0.8627451, 1,
-0.0173171, -0.3835394, -2.216083, 0, 1, 0.8666667, 1,
-0.01523995, 0.1402569, 1.273909, 0, 1, 0.8745098, 1,
-0.0106234, -0.4289616, -2.142624, 0, 1, 0.8784314, 1,
-0.00669081, 2.031039, 1.078627, 0, 1, 0.8862745, 1,
-0.004288627, -1.147525, -3.763138, 0, 1, 0.8901961, 1,
-0.002743879, -0.3383413, -0.9438482, 0, 1, 0.8980392, 1,
-0.002561999, -0.3585598, -3.869922, 0, 1, 0.9058824, 1,
-0.001625026, 0.5310711, -1.56154, 0, 1, 0.9098039, 1,
-0.001571106, 1.358299, 1.695461, 0, 1, 0.9176471, 1,
-0.00128926, 0.2222292, 0.6625314, 0, 1, 0.9215686, 1,
0.00360748, 0.05269031, 1.702903, 0, 1, 0.9294118, 1,
0.004662752, -0.5984409, 2.849567, 0, 1, 0.9333333, 1,
0.00847042, -0.4265088, 3.36904, 0, 1, 0.9411765, 1,
0.01033726, 0.6516011, -1.762882, 0, 1, 0.945098, 1,
0.01295131, -0.1747506, 4.199943, 0, 1, 0.9529412, 1,
0.01327248, -0.4791799, 3.575485, 0, 1, 0.9568627, 1,
0.01444861, -0.4685145, 5.005354, 0, 1, 0.9647059, 1,
0.01449703, -1.56183, 2.888113, 0, 1, 0.9686275, 1,
0.01460298, -1.406561, 2.417779, 0, 1, 0.9764706, 1,
0.0165987, -0.1624029, 1.46269, 0, 1, 0.9803922, 1,
0.01757213, 0.1627854, 0.9654116, 0, 1, 0.9882353, 1,
0.02288296, -0.7182842, 1.801509, 0, 1, 0.9921569, 1,
0.02312405, -0.7360445, 3.619766, 0, 1, 1, 1,
0.02457453, -2.047183, 2.964373, 0, 0.9921569, 1, 1,
0.02590474, -0.7106886, 2.834619, 0, 0.9882353, 1, 1,
0.029057, -0.5885851, 4.418892, 0, 0.9803922, 1, 1,
0.0303612, 0.8879468, -0.3626598, 0, 0.9764706, 1, 1,
0.03194067, -2.253136, 3.177387, 0, 0.9686275, 1, 1,
0.03210457, -1.32023, 3.536228, 0, 0.9647059, 1, 1,
0.03305871, -0.9134991, 3.722307, 0, 0.9568627, 1, 1,
0.03388254, 0.6447808, -0.04049112, 0, 0.9529412, 1, 1,
0.03488311, -0.08215073, 3.431592, 0, 0.945098, 1, 1,
0.03792503, 0.137477, -0.3576541, 0, 0.9411765, 1, 1,
0.03867581, -0.04819034, 2.605762, 0, 0.9333333, 1, 1,
0.04299881, 0.6180785, -0.9867201, 0, 0.9294118, 1, 1,
0.04462183, -0.33539, 4.782158, 0, 0.9215686, 1, 1,
0.04588211, 1.807219, -0.250392, 0, 0.9176471, 1, 1,
0.04815266, -0.9847506, 3.138731, 0, 0.9098039, 1, 1,
0.04879819, 0.01611714, 1.761991, 0, 0.9058824, 1, 1,
0.05091104, 1.997463, -0.06987486, 0, 0.8980392, 1, 1,
0.05402675, -0.5730259, 3.300293, 0, 0.8901961, 1, 1,
0.05829922, 1.796397, 0.6407278, 0, 0.8862745, 1, 1,
0.05929758, -1.076447, 3.149309, 0, 0.8784314, 1, 1,
0.05994282, -0.9409584, 4.594774, 0, 0.8745098, 1, 1,
0.06124991, 0.6976231, -1.733968, 0, 0.8666667, 1, 1,
0.06411769, -0.9655379, 2.716247, 0, 0.8627451, 1, 1,
0.07011943, 0.5893899, 0.1129587, 0, 0.854902, 1, 1,
0.07118381, -1.01293, 1.700835, 0, 0.8509804, 1, 1,
0.07143484, 0.5110383, -0.2653357, 0, 0.8431373, 1, 1,
0.0760036, 0.9455477, -0.422414, 0, 0.8392157, 1, 1,
0.07615204, -1.224047, 3.689364, 0, 0.8313726, 1, 1,
0.08424667, -0.2277683, 1.516457, 0, 0.827451, 1, 1,
0.0855802, 0.9553126, 1.791215, 0, 0.8196079, 1, 1,
0.087189, -0.09378071, 1.328757, 0, 0.8156863, 1, 1,
0.08857404, 0.4968385, 0.9466102, 0, 0.8078431, 1, 1,
0.08891775, 1.142618, 0.155543, 0, 0.8039216, 1, 1,
0.09317756, 0.5332826, -0.5900043, 0, 0.7960784, 1, 1,
0.09916516, -0.7745876, 0.7913997, 0, 0.7882353, 1, 1,
0.1005308, -0.2888622, 2.428629, 0, 0.7843137, 1, 1,
0.1013353, -0.9535981, 2.882047, 0, 0.7764706, 1, 1,
0.1060071, 0.9719119, -0.2861917, 0, 0.772549, 1, 1,
0.1068664, -0.09798538, 3.340784, 0, 0.7647059, 1, 1,
0.1080712, -1.172416, 2.27907, 0, 0.7607843, 1, 1,
0.1090807, -0.1780724, 1.699783, 0, 0.7529412, 1, 1,
0.1092998, 1.376261, 0.2703085, 0, 0.7490196, 1, 1,
0.114322, 1.540849, 1.319826, 0, 0.7411765, 1, 1,
0.1152386, -1.876373, 3.05572, 0, 0.7372549, 1, 1,
0.1188846, -0.4617956, 3.126048, 0, 0.7294118, 1, 1,
0.121896, 0.6433908, -0.3618089, 0, 0.7254902, 1, 1,
0.1259229, -0.7483535, 3.485208, 0, 0.7176471, 1, 1,
0.1287082, -1.072093, 2.807835, 0, 0.7137255, 1, 1,
0.1352669, 0.9421301, 0.07633059, 0, 0.7058824, 1, 1,
0.1356897, 2.084833, -1.272206, 0, 0.6980392, 1, 1,
0.135712, -0.3584751, 2.297889, 0, 0.6941177, 1, 1,
0.1373661, -2.731343, 3.73239, 0, 0.6862745, 1, 1,
0.1447777, 0.8489037, 2.643734, 0, 0.682353, 1, 1,
0.1449312, 0.3302406, -1.57268, 0, 0.6745098, 1, 1,
0.1518928, -0.6484362, 3.871425, 0, 0.6705883, 1, 1,
0.1534319, 1.020625, 0.3512785, 0, 0.6627451, 1, 1,
0.159728, 0.0796684, 0.6981785, 0, 0.6588235, 1, 1,
0.1611222, 0.4686667, 0.4915497, 0, 0.6509804, 1, 1,
0.1618727, 1.131845, -1.241322, 0, 0.6470588, 1, 1,
0.1654282, 0.9107849, -0.5347254, 0, 0.6392157, 1, 1,
0.1668874, -1.274877, 2.944704, 0, 0.6352941, 1, 1,
0.1671497, -1.456241, 0.9183022, 0, 0.627451, 1, 1,
0.1672472, 0.1134149, 2.273964, 0, 0.6235294, 1, 1,
0.1683675, -0.004603031, 1.765996, 0, 0.6156863, 1, 1,
0.1705508, 0.1925498, 0.6443163, 0, 0.6117647, 1, 1,
0.1719973, -0.7812161, 3.733652, 0, 0.6039216, 1, 1,
0.1729051, 0.1327926, 0.7489311, 0, 0.5960785, 1, 1,
0.1746298, 0.8061526, 1.164786, 0, 0.5921569, 1, 1,
0.1748473, 1.416485, -0.9995068, 0, 0.5843138, 1, 1,
0.186512, 0.4893481, 2.990149, 0, 0.5803922, 1, 1,
0.1876094, 1.071093, 1.070441, 0, 0.572549, 1, 1,
0.193616, 1.234881, -0.2430377, 0, 0.5686275, 1, 1,
0.1978236, -0.02989713, 1.816531, 0, 0.5607843, 1, 1,
0.2024564, -0.7134007, 2.641087, 0, 0.5568628, 1, 1,
0.2038032, -0.708254, 4.365295, 0, 0.5490196, 1, 1,
0.2046142, 2.016149, -0.2971656, 0, 0.5450981, 1, 1,
0.2068474, 1.759407, -0.4915943, 0, 0.5372549, 1, 1,
0.213528, 0.2443106, 1.401605, 0, 0.5333334, 1, 1,
0.2155431, -0.3091161, 0.9613573, 0, 0.5254902, 1, 1,
0.2244899, 0.4996036, -0.09328816, 0, 0.5215687, 1, 1,
0.2294115, -0.6246027, 3.109173, 0, 0.5137255, 1, 1,
0.230139, 0.6170619, 1.908185, 0, 0.509804, 1, 1,
0.2346197, -0.8543578, 1.673837, 0, 0.5019608, 1, 1,
0.2348935, -0.7828291, 5.824811, 0, 0.4941176, 1, 1,
0.2381857, -0.3008438, 2.698766, 0, 0.4901961, 1, 1,
0.238556, 0.3256791, 1.870922, 0, 0.4823529, 1, 1,
0.2406155, 0.4731008, -0.5830742, 0, 0.4784314, 1, 1,
0.2438286, 1.798032, -0.7401359, 0, 0.4705882, 1, 1,
0.2461457, 0.7166908, -0.6371953, 0, 0.4666667, 1, 1,
0.2466842, 1.044326, 1.934627, 0, 0.4588235, 1, 1,
0.2480147, 1.223138, 0.3826842, 0, 0.454902, 1, 1,
0.2581593, -1.764397, 2.039325, 0, 0.4470588, 1, 1,
0.2586978, 0.4658, 0.6409402, 0, 0.4431373, 1, 1,
0.2600683, -0.4010546, 2.412563, 0, 0.4352941, 1, 1,
0.260231, 1.124358, -0.861581, 0, 0.4313726, 1, 1,
0.2651176, -0.5517604, 2.872946, 0, 0.4235294, 1, 1,
0.2676487, 0.7898801, -0.5051884, 0, 0.4196078, 1, 1,
0.2680609, -0.6730908, 3.187602, 0, 0.4117647, 1, 1,
0.2773716, 0.7144526, 0.9539265, 0, 0.4078431, 1, 1,
0.278061, 0.5545274, 0.4135005, 0, 0.4, 1, 1,
0.2783023, 0.551109, -1.245796, 0, 0.3921569, 1, 1,
0.2818953, -0.2511997, 1.848442, 0, 0.3882353, 1, 1,
0.2856626, -0.05437097, 1.690595, 0, 0.3803922, 1, 1,
0.2882923, 1.93356, 1.064479, 0, 0.3764706, 1, 1,
0.2883407, 0.7466098, -0.4333411, 0, 0.3686275, 1, 1,
0.2906582, -0.5477164, 3.622066, 0, 0.3647059, 1, 1,
0.2916287, -0.8558097, 3.038073, 0, 0.3568628, 1, 1,
0.2917028, 0.4417195, 0.7848988, 0, 0.3529412, 1, 1,
0.2930251, 0.8740409, 1.072897, 0, 0.345098, 1, 1,
0.293048, 0.3984863, 1.675007, 0, 0.3411765, 1, 1,
0.2937753, 0.3654324, -0.1043438, 0, 0.3333333, 1, 1,
0.2942601, 0.03608278, 0.3792398, 0, 0.3294118, 1, 1,
0.2974143, -0.02704528, 1.254917, 0, 0.3215686, 1, 1,
0.2991626, 1.150334, -0.9586189, 0, 0.3176471, 1, 1,
0.3022819, -0.1166184, 4.099713, 0, 0.3098039, 1, 1,
0.3070303, -0.7065284, 2.704223, 0, 0.3058824, 1, 1,
0.3126899, -0.3580762, 1.916458, 0, 0.2980392, 1, 1,
0.3180903, 0.0602402, -0.1419394, 0, 0.2901961, 1, 1,
0.3228948, -0.3126093, 1.268729, 0, 0.2862745, 1, 1,
0.3272413, -1.168701, 3.369337, 0, 0.2784314, 1, 1,
0.3302169, 2.339678, 0.682223, 0, 0.2745098, 1, 1,
0.3335486, -1.567441, 3.113981, 0, 0.2666667, 1, 1,
0.3350656, -0.9238161, 2.940786, 0, 0.2627451, 1, 1,
0.3354321, 0.3406787, 1.952498, 0, 0.254902, 1, 1,
0.3398245, -1.058387, 2.857224, 0, 0.2509804, 1, 1,
0.3404695, 0.2219918, 1.943782, 0, 0.2431373, 1, 1,
0.3441185, 0.5785837, -0.1392493, 0, 0.2392157, 1, 1,
0.3512884, 0.1802841, 1.34274, 0, 0.2313726, 1, 1,
0.3518819, -0.6432498, 4.023322, 0, 0.227451, 1, 1,
0.3559954, 0.0286908, 0.6953694, 0, 0.2196078, 1, 1,
0.3574599, 0.9377369, 1.223705, 0, 0.2156863, 1, 1,
0.3637741, -1.570561, 1.91222, 0, 0.2078431, 1, 1,
0.3640556, 0.9079886, 0.4014836, 0, 0.2039216, 1, 1,
0.3647915, 1.638177, -0.1886839, 0, 0.1960784, 1, 1,
0.3680258, -0.7111022, 4.797966, 0, 0.1882353, 1, 1,
0.369463, -1.299846, 2.179781, 0, 0.1843137, 1, 1,
0.3747728, -1.049024, 2.954921, 0, 0.1764706, 1, 1,
0.3814204, -1.1132, 2.741651, 0, 0.172549, 1, 1,
0.3826682, 0.6908301, -0.6943933, 0, 0.1647059, 1, 1,
0.3829879, -1.666849, 2.580028, 0, 0.1607843, 1, 1,
0.3868092, -0.9307037, 2.535335, 0, 0.1529412, 1, 1,
0.3876475, -0.7038496, 4.426535, 0, 0.1490196, 1, 1,
0.3880795, -0.03934705, 2.071836, 0, 0.1411765, 1, 1,
0.3890673, 0.2538253, 0.5584465, 0, 0.1372549, 1, 1,
0.3916854, -0.7715659, 5.340335, 0, 0.1294118, 1, 1,
0.3949628, -0.1263831, 2.642365, 0, 0.1254902, 1, 1,
0.3978635, -1.871374, 3.322164, 0, 0.1176471, 1, 1,
0.4006558, 0.5154377, -0.7208784, 0, 0.1137255, 1, 1,
0.4036576, -1.32753, 2.946103, 0, 0.1058824, 1, 1,
0.4046825, 0.8970541, -0.4683892, 0, 0.09803922, 1, 1,
0.4063576, 1.355498, 0.05163264, 0, 0.09411765, 1, 1,
0.4072431, 0.2381786, 0.7349563, 0, 0.08627451, 1, 1,
0.4170638, 0.03686834, 1.571184, 0, 0.08235294, 1, 1,
0.4184989, -1.019846, 3.923445, 0, 0.07450981, 1, 1,
0.4235066, 0.2164253, 1.623671, 0, 0.07058824, 1, 1,
0.42555, -0.3552794, 2.661686, 0, 0.0627451, 1, 1,
0.4256865, 1.393893, 0.1213545, 0, 0.05882353, 1, 1,
0.4298088, -1.389887, 2.389641, 0, 0.05098039, 1, 1,
0.4370078, -1.308408, 2.665305, 0, 0.04705882, 1, 1,
0.441556, 0.1808468, -0.7817111, 0, 0.03921569, 1, 1,
0.4434464, -0.4532713, 2.23805, 0, 0.03529412, 1, 1,
0.4441656, -2.282171, 2.406635, 0, 0.02745098, 1, 1,
0.4497913, 0.2251027, 2.719072, 0, 0.02352941, 1, 1,
0.4541209, -1.057883, 4.441642, 0, 0.01568628, 1, 1,
0.4576322, -0.8194388, 5.172978, 0, 0.01176471, 1, 1,
0.4576951, 0.2657451, 2.343189, 0, 0.003921569, 1, 1,
0.4603093, -0.9383, 3.464487, 0.003921569, 0, 1, 1,
0.4612722, -0.9582681, 2.970418, 0.007843138, 0, 1, 1,
0.4623361, 0.09850639, 0.06634855, 0.01568628, 0, 1, 1,
0.4652751, -1.606795, 1.287011, 0.01960784, 0, 1, 1,
0.4690964, -0.5686604, 2.11078, 0.02745098, 0, 1, 1,
0.4704292, 0.1981634, -1.081176, 0.03137255, 0, 1, 1,
0.4758621, 0.305477, -0.3213523, 0.03921569, 0, 1, 1,
0.4765521, -0.7777055, 2.921896, 0.04313726, 0, 1, 1,
0.4812595, 0.689908, 1.869612, 0.05098039, 0, 1, 1,
0.4842963, -1.233563, 0.5467548, 0.05490196, 0, 1, 1,
0.489383, -0.7147782, 1.46288, 0.0627451, 0, 1, 1,
0.491184, -0.06228253, 2.645699, 0.06666667, 0, 1, 1,
0.4958405, -1.100337, 3.648818, 0.07450981, 0, 1, 1,
0.4961601, 0.770366, -0.1165856, 0.07843138, 0, 1, 1,
0.4992282, -0.1110973, 2.8162, 0.08627451, 0, 1, 1,
0.50841, 0.3981409, 1.596257, 0.09019608, 0, 1, 1,
0.5101728, -0.8214582, 1.909968, 0.09803922, 0, 1, 1,
0.5109683, 0.06502388, -0.511605, 0.1058824, 0, 1, 1,
0.5172927, -0.589598, 4.659907, 0.1098039, 0, 1, 1,
0.5268468, 0.7914374, -0.1971489, 0.1176471, 0, 1, 1,
0.5285924, 0.3377142, 0.4376756, 0.1215686, 0, 1, 1,
0.5327161, 0.7383565, 0.007802318, 0.1294118, 0, 1, 1,
0.5329593, 1.398636, -0.1587955, 0.1333333, 0, 1, 1,
0.5333511, 0.3844335, -0.3706649, 0.1411765, 0, 1, 1,
0.5345823, -0.5996615, 2.229102, 0.145098, 0, 1, 1,
0.5373451, -0.5962985, 3.511417, 0.1529412, 0, 1, 1,
0.5413221, 0.3120204, 1.109289, 0.1568628, 0, 1, 1,
0.543538, -0.2666465, 0.06813938, 0.1647059, 0, 1, 1,
0.5436609, 0.8485875, 0.639368, 0.1686275, 0, 1, 1,
0.5452555, 0.7736473, 0.7316311, 0.1764706, 0, 1, 1,
0.5462773, 1.561908, -0.890464, 0.1803922, 0, 1, 1,
0.547825, 1.13048, -1.22114, 0.1882353, 0, 1, 1,
0.5480539, 0.7656224, 1.895488, 0.1921569, 0, 1, 1,
0.5489008, -0.4955114, 3.631873, 0.2, 0, 1, 1,
0.5501559, -0.1653859, 1.975599, 0.2078431, 0, 1, 1,
0.5502333, 1.259822, 0.7463376, 0.2117647, 0, 1, 1,
0.553344, 0.1231256, 2.425297, 0.2196078, 0, 1, 1,
0.5535035, 2.190641, -0.3548621, 0.2235294, 0, 1, 1,
0.5549757, 0.02860696, 0.4814786, 0.2313726, 0, 1, 1,
0.5560761, 1.191964, 0.8977512, 0.2352941, 0, 1, 1,
0.5566802, -0.2674384, 0.6261209, 0.2431373, 0, 1, 1,
0.559132, 0.09799874, 2.937247, 0.2470588, 0, 1, 1,
0.5626741, -0.7131299, 1.475314, 0.254902, 0, 1, 1,
0.5688229, 0.8264182, 0.4657715, 0.2588235, 0, 1, 1,
0.5853165, 1.063499, -0.8962153, 0.2666667, 0, 1, 1,
0.5855374, 0.2318517, 1.059543, 0.2705882, 0, 1, 1,
0.5860734, -0.2928695, 2.903003, 0.2784314, 0, 1, 1,
0.5866249, 0.4501365, 2.260541, 0.282353, 0, 1, 1,
0.5911089, -0.2285641, 2.420517, 0.2901961, 0, 1, 1,
0.5911371, -1.324169, 2.183544, 0.2941177, 0, 1, 1,
0.592624, -0.5740271, 1.76992, 0.3019608, 0, 1, 1,
0.5931032, -0.6998596, 2.290649, 0.3098039, 0, 1, 1,
0.593884, -2.661631, 3.186131, 0.3137255, 0, 1, 1,
0.5970668, 0.4799336, 0.9358056, 0.3215686, 0, 1, 1,
0.5978421, -0.568334, 2.259042, 0.3254902, 0, 1, 1,
0.6016923, 1.792326, 0.1544712, 0.3333333, 0, 1, 1,
0.602411, -0.1085102, 1.623547, 0.3372549, 0, 1, 1,
0.6026388, -1.531631, 3.030966, 0.345098, 0, 1, 1,
0.6044835, 0.0355125, 1.690236, 0.3490196, 0, 1, 1,
0.6072631, 2.064134, -0.07636389, 0.3568628, 0, 1, 1,
0.6086476, 0.1491975, 2.391585, 0.3607843, 0, 1, 1,
0.6091071, 1.496495, 0.5684038, 0.3686275, 0, 1, 1,
0.6094973, -1.229383, 3.059801, 0.372549, 0, 1, 1,
0.6146301, 1.258277, 1.336691, 0.3803922, 0, 1, 1,
0.619122, -0.3635202, 2.534093, 0.3843137, 0, 1, 1,
0.6224209, -0.8381662, 2.541002, 0.3921569, 0, 1, 1,
0.6277792, 1.777908, 1.391573, 0.3960784, 0, 1, 1,
0.6294968, 0.6404487, 0.4903618, 0.4039216, 0, 1, 1,
0.6360567, -2.35544, 4.348623, 0.4117647, 0, 1, 1,
0.6375052, -0.6477559, 3.164508, 0.4156863, 0, 1, 1,
0.6375684, -0.8146543, 2.48304, 0.4235294, 0, 1, 1,
0.6392758, -1.731732, 2.002446, 0.427451, 0, 1, 1,
0.6400413, -0.8186511, 2.892037, 0.4352941, 0, 1, 1,
0.6405267, -0.9697175, 3.263209, 0.4392157, 0, 1, 1,
0.6408297, -1.329176, 1.727069, 0.4470588, 0, 1, 1,
0.6461586, -0.21928, 0.5030573, 0.4509804, 0, 1, 1,
0.6473354, 1.20063, 0.0030085, 0.4588235, 0, 1, 1,
0.6511476, -0.7871054, 2.586295, 0.4627451, 0, 1, 1,
0.6516445, 1.178186, 0.01054996, 0.4705882, 0, 1, 1,
0.6534289, -1.319603, 3.496652, 0.4745098, 0, 1, 1,
0.6555678, -1.447028, 4.036712, 0.4823529, 0, 1, 1,
0.6565429, 0.9035645, 0.3290401, 0.4862745, 0, 1, 1,
0.6632375, 1.496317, -1.239725, 0.4941176, 0, 1, 1,
0.6684768, 0.7950619, -0.5879715, 0.5019608, 0, 1, 1,
0.6711916, -0.06420737, -0.1582588, 0.5058824, 0, 1, 1,
0.6747853, 0.3052532, 2.688714, 0.5137255, 0, 1, 1,
0.6751788, 1.230513, 0.1295286, 0.5176471, 0, 1, 1,
0.6753184, 1.4814, 0.4185186, 0.5254902, 0, 1, 1,
0.676026, 0.8750938, 0.2651342, 0.5294118, 0, 1, 1,
0.677899, 1.308898, 1.426647, 0.5372549, 0, 1, 1,
0.6807362, 0.5020745, 0.2634469, 0.5411765, 0, 1, 1,
0.6817744, -1.249509, 2.517591, 0.5490196, 0, 1, 1,
0.6847792, 0.8693835, 1.248831, 0.5529412, 0, 1, 1,
0.6921695, -0.8939034, 3.071852, 0.5607843, 0, 1, 1,
0.6980225, 0.06960906, 0.6793855, 0.5647059, 0, 1, 1,
0.7004563, 0.9760967, -0.5101852, 0.572549, 0, 1, 1,
0.7048934, 0.9128001, 0.5847273, 0.5764706, 0, 1, 1,
0.7145107, -1.408766, 3.355205, 0.5843138, 0, 1, 1,
0.7148741, -0.7420066, 2.155205, 0.5882353, 0, 1, 1,
0.7151123, -2.491009, 5.09351, 0.5960785, 0, 1, 1,
0.7159085, 1.246593, 0.5676682, 0.6039216, 0, 1, 1,
0.7348605, -1.14466, 3.436108, 0.6078432, 0, 1, 1,
0.7350104, -2.824049, 4.212723, 0.6156863, 0, 1, 1,
0.735825, -0.8624728, 3.301527, 0.6196079, 0, 1, 1,
0.7362268, 1.67684, 1.11659, 0.627451, 0, 1, 1,
0.7410833, -0.221459, 1.690566, 0.6313726, 0, 1, 1,
0.7421856, 1.223424, 0.6735249, 0.6392157, 0, 1, 1,
0.7437271, -0.6949158, 1.203166, 0.6431373, 0, 1, 1,
0.7443804, -0.9543273, 1.676679, 0.6509804, 0, 1, 1,
0.7449509, -0.7473818, 1.144567, 0.654902, 0, 1, 1,
0.7521295, -0.5247347, 2.035971, 0.6627451, 0, 1, 1,
0.7529841, 0.1597508, 1.550353, 0.6666667, 0, 1, 1,
0.7545339, 1.442349, -0.7403473, 0.6745098, 0, 1, 1,
0.763026, 0.7664344, 2.497521, 0.6784314, 0, 1, 1,
0.7641609, 1.42324, 0.5407822, 0.6862745, 0, 1, 1,
0.7647955, 0.4911978, 3.604089, 0.6901961, 0, 1, 1,
0.7656044, 0.3826424, 0.9223276, 0.6980392, 0, 1, 1,
0.7730553, 0.3504423, 0.3284902, 0.7058824, 0, 1, 1,
0.7745467, -0.7133553, 3.116729, 0.7098039, 0, 1, 1,
0.7754443, 0.1874592, 2.431948, 0.7176471, 0, 1, 1,
0.7774065, -0.3086448, 1.884542, 0.7215686, 0, 1, 1,
0.7797803, -0.6081258, 2.512213, 0.7294118, 0, 1, 1,
0.7811394, 0.0982572, 1.085917, 0.7333333, 0, 1, 1,
0.7843325, 0.4147904, 0.2575462, 0.7411765, 0, 1, 1,
0.7933804, 0.1614169, 1.752623, 0.7450981, 0, 1, 1,
0.7955884, -0.5919672, 3.258811, 0.7529412, 0, 1, 1,
0.7961374, 0.4129476, 0.7522337, 0.7568628, 0, 1, 1,
0.7985622, -0.6125287, 0.6963164, 0.7647059, 0, 1, 1,
0.7986992, 0.7255583, 0.3733302, 0.7686275, 0, 1, 1,
0.800179, -0.6891946, 2.722832, 0.7764706, 0, 1, 1,
0.804344, -0.09754299, 3.010898, 0.7803922, 0, 1, 1,
0.8051784, -0.760034, 1.165027, 0.7882353, 0, 1, 1,
0.8086306, -0.5124292, 1.600035, 0.7921569, 0, 1, 1,
0.8161744, -0.7070065, 0.9100278, 0.8, 0, 1, 1,
0.8235798, -0.1395415, 0.7881455, 0.8078431, 0, 1, 1,
0.827548, 1.143205, 0.4852161, 0.8117647, 0, 1, 1,
0.8285382, -0.6485633, 1.343297, 0.8196079, 0, 1, 1,
0.8293229, 0.7355298, 1.463553, 0.8235294, 0, 1, 1,
0.8306766, -1.026959, 2.482552, 0.8313726, 0, 1, 1,
0.8331424, 0.8153222, 1.22273, 0.8352941, 0, 1, 1,
0.8351066, 0.4864357, 0.9494534, 0.8431373, 0, 1, 1,
0.8389508, 0.5188679, 0.9901331, 0.8470588, 0, 1, 1,
0.8392627, 0.9387739, 0.06158264, 0.854902, 0, 1, 1,
0.8407421, 1.33029, 0.6350674, 0.8588235, 0, 1, 1,
0.8413593, 1.833271, 0.352109, 0.8666667, 0, 1, 1,
0.849329, 0.05212687, 1.406801, 0.8705882, 0, 1, 1,
0.8618398, -2.37712, 3.379986, 0.8784314, 0, 1, 1,
0.8632661, 0.09211875, 1.837284, 0.8823529, 0, 1, 1,
0.8699438, -0.06004592, 2.09991, 0.8901961, 0, 1, 1,
0.871527, -0.8528472, 3.815243, 0.8941177, 0, 1, 1,
0.8740568, -1.002658, 4.145004, 0.9019608, 0, 1, 1,
0.8765329, -1.37863, 2.347681, 0.9098039, 0, 1, 1,
0.8803642, 0.7441558, 1.491561, 0.9137255, 0, 1, 1,
0.8910372, -0.4721374, 4.113084, 0.9215686, 0, 1, 1,
0.8916221, 0.1656653, 1.06628, 0.9254902, 0, 1, 1,
0.8955579, 0.956441, 0.1826218, 0.9333333, 0, 1, 1,
0.8971907, 0.9300234, 0.2348866, 0.9372549, 0, 1, 1,
0.8975722, -1.872237, 1.929857, 0.945098, 0, 1, 1,
0.9071798, 0.9238011, 1.42086, 0.9490196, 0, 1, 1,
0.9082841, -1.514928, 3.291271, 0.9568627, 0, 1, 1,
0.9157328, -0.4022988, 1.910321, 0.9607843, 0, 1, 1,
0.9175594, -1.750398, 3.241126, 0.9686275, 0, 1, 1,
0.9214037, 2.234559, 0.7175519, 0.972549, 0, 1, 1,
0.9267989, 0.7120966, 2.889379, 0.9803922, 0, 1, 1,
0.9273291, -1.124637, 1.549064, 0.9843137, 0, 1, 1,
0.9278392, -0.286433, 2.187989, 0.9921569, 0, 1, 1,
0.9327469, -0.02755365, 2.070074, 0.9960784, 0, 1, 1,
0.933857, 0.8544654, -0.1444119, 1, 0, 0.9960784, 1,
0.9348042, -0.335117, 3.288802, 1, 0, 0.9882353, 1,
0.9351013, 0.5786626, 0.1694868, 1, 0, 0.9843137, 1,
0.9361877, -0.7043593, 0.7374383, 1, 0, 0.9764706, 1,
0.9376726, -0.4271386, 2.018289, 1, 0, 0.972549, 1,
0.9407501, 1.20103, 0.5421988, 1, 0, 0.9647059, 1,
0.9450024, -0.8989688, 1.831475, 1, 0, 0.9607843, 1,
0.9503606, -0.2146086, -0.02008944, 1, 0, 0.9529412, 1,
0.9584034, 0.8782547, -1.060323, 1, 0, 0.9490196, 1,
0.9633136, 0.2476453, 0.8153418, 1, 0, 0.9411765, 1,
0.9671998, 1.119911, -0.6339256, 1, 0, 0.9372549, 1,
0.9810623, -0.3559983, 2.349575, 1, 0, 0.9294118, 1,
0.9855, -0.1165856, 2.681038, 1, 0, 0.9254902, 1,
0.9882486, 1.298452, 0.7974259, 1, 0, 0.9176471, 1,
0.9936709, 0.5840229, -0.3267237, 1, 0, 0.9137255, 1,
1.00065, -0.974424, 3.021194, 1, 0, 0.9058824, 1,
1.006321, 0.05765259, -1.148746, 1, 0, 0.9019608, 1,
1.008884, 0.3483405, 0.8570811, 1, 0, 0.8941177, 1,
1.013265, 0.1579855, 1.472144, 1, 0, 0.8862745, 1,
1.016147, -0.4837221, 0.7766933, 1, 0, 0.8823529, 1,
1.043044, -0.2954001, 2.859874, 1, 0, 0.8745098, 1,
1.061624, 0.8617324, 0.2302012, 1, 0, 0.8705882, 1,
1.062417, -0.4646425, 3.114209, 1, 0, 0.8627451, 1,
1.064472, -0.4658121, 2.448652, 1, 0, 0.8588235, 1,
1.064975, 1.40345, 0.496738, 1, 0, 0.8509804, 1,
1.073115, -1.212386, 2.941385, 1, 0, 0.8470588, 1,
1.079963, -1.607129, 1.54044, 1, 0, 0.8392157, 1,
1.081493, -0.08919238, 0.4534161, 1, 0, 0.8352941, 1,
1.083517, -1.158179, 1.559689, 1, 0, 0.827451, 1,
1.092062, 0.8982983, 0.04153623, 1, 0, 0.8235294, 1,
1.094439, 0.4198691, 1.3625, 1, 0, 0.8156863, 1,
1.097713, -0.7071303, 2.544042, 1, 0, 0.8117647, 1,
1.098835, 2.016215, -1.355974, 1, 0, 0.8039216, 1,
1.101203, 0.8471616, 0.4426619, 1, 0, 0.7960784, 1,
1.101796, 1.142602, 0.8410593, 1, 0, 0.7921569, 1,
1.104154, 0.2901122, 1.104463, 1, 0, 0.7843137, 1,
1.111798, 0.7763284, 0.932461, 1, 0, 0.7803922, 1,
1.12807, 1.113428, 0.7085392, 1, 0, 0.772549, 1,
1.138735, 0.02640249, 1.060595, 1, 0, 0.7686275, 1,
1.146657, 0.3666113, 2.060725, 1, 0, 0.7607843, 1,
1.157158, -0.2675864, 0.8926082, 1, 0, 0.7568628, 1,
1.170713, 0.2745102, 1.951885, 1, 0, 0.7490196, 1,
1.174146, 0.1426533, 0.9479018, 1, 0, 0.7450981, 1,
1.175217, 2.109214, 2.468894, 1, 0, 0.7372549, 1,
1.175481, -2.091841, 3.494525, 1, 0, 0.7333333, 1,
1.180517, 0.5657987, 0.5584999, 1, 0, 0.7254902, 1,
1.181597, -0.8542659, 2.848008, 1, 0, 0.7215686, 1,
1.184054, 0.1102654, 1.664878, 1, 0, 0.7137255, 1,
1.193125, 0.05051547, 1.496898, 1, 0, 0.7098039, 1,
1.197743, 0.7144901, 0.6909472, 1, 0, 0.7019608, 1,
1.206161, -0.1679696, 1.336835, 1, 0, 0.6941177, 1,
1.207715, -0.212724, 2.66763, 1, 0, 0.6901961, 1,
1.212303, 0.1501633, 3.26478, 1, 0, 0.682353, 1,
1.219993, 0.7844677, 1.766503, 1, 0, 0.6784314, 1,
1.228905, 0.2041245, 2.941208, 1, 0, 0.6705883, 1,
1.229925, -1.780363, 2.429583, 1, 0, 0.6666667, 1,
1.232172, -0.04170829, 0.5184944, 1, 0, 0.6588235, 1,
1.235322, -0.4276808, 0.98009, 1, 0, 0.654902, 1,
1.240932, -1.895024, 1.46768, 1, 0, 0.6470588, 1,
1.258759, -0.2286533, 1.601765, 1, 0, 0.6431373, 1,
1.260305, 0.08934494, 2.590577, 1, 0, 0.6352941, 1,
1.264002, -1.009942, 1.169443, 1, 0, 0.6313726, 1,
1.271312, 2.025836, 1.288048, 1, 0, 0.6235294, 1,
1.275829, 0.4717568, 1.700926, 1, 0, 0.6196079, 1,
1.280328, 0.4650103, 1.449577, 1, 0, 0.6117647, 1,
1.28772, 0.04574795, 3.201112, 1, 0, 0.6078432, 1,
1.306584, -0.5326794, 0.5756396, 1, 0, 0.6, 1,
1.316193, -0.208125, 0.4865759, 1, 0, 0.5921569, 1,
1.317141, -0.3822734, 2.202229, 1, 0, 0.5882353, 1,
1.323496, 0.1243147, 0.4078808, 1, 0, 0.5803922, 1,
1.327489, 0.03076617, 0.2662763, 1, 0, 0.5764706, 1,
1.338554, -1.042751, 2.736216, 1, 0, 0.5686275, 1,
1.339751, -0.4626006, 2.925535, 1, 0, 0.5647059, 1,
1.347205, -1.040956, 3.293181, 1, 0, 0.5568628, 1,
1.347606, 0.493361, 2.578339, 1, 0, 0.5529412, 1,
1.349266, 1.075165, 0.7694603, 1, 0, 0.5450981, 1,
1.358232, -0.258069, 0.4141723, 1, 0, 0.5411765, 1,
1.358614, -1.138488, 4.091767, 1, 0, 0.5333334, 1,
1.365273, 0.293662, -0.1626249, 1, 0, 0.5294118, 1,
1.396555, 1.423933, 0.8451087, 1, 0, 0.5215687, 1,
1.397216, 1.355999, 0.8395334, 1, 0, 0.5176471, 1,
1.413849, -1.005783, 2.620914, 1, 0, 0.509804, 1,
1.419093, 0.0548899, 1.783697, 1, 0, 0.5058824, 1,
1.419842, -1.181859, 2.894522, 1, 0, 0.4980392, 1,
1.419897, -1.410658, 2.331591, 1, 0, 0.4901961, 1,
1.435762, 0.2511396, 2.890719, 1, 0, 0.4862745, 1,
1.448374, -1.281986, 2.044017, 1, 0, 0.4784314, 1,
1.457754, 0.596895, 0.5582445, 1, 0, 0.4745098, 1,
1.457883, 1.24848, -0.5240483, 1, 0, 0.4666667, 1,
1.459463, 0.2811689, 1.017375, 1, 0, 0.4627451, 1,
1.461031, 0.4733011, 1.688421, 1, 0, 0.454902, 1,
1.475472, 0.3031064, 1.48546, 1, 0, 0.4509804, 1,
1.482644, -1.216305, 0.6172709, 1, 0, 0.4431373, 1,
1.488603, -1.406682, 0.8915923, 1, 0, 0.4392157, 1,
1.492838, 0.7698984, 0.7305986, 1, 0, 0.4313726, 1,
1.502858, -0.1299062, 1.640148, 1, 0, 0.427451, 1,
1.507265, -0.96845, 2.994441, 1, 0, 0.4196078, 1,
1.528435, 0.9142532, 1.574423, 1, 0, 0.4156863, 1,
1.545581, 0.2555403, -0.1315012, 1, 0, 0.4078431, 1,
1.549219, 0.6684852, 0.7471448, 1, 0, 0.4039216, 1,
1.552283, 0.2067225, 2.161509, 1, 0, 0.3960784, 1,
1.57646, -1.036619, 1.595861, 1, 0, 0.3882353, 1,
1.587405, -0.7011401, 2.754122, 1, 0, 0.3843137, 1,
1.587745, -1.386034, 2.149444, 1, 0, 0.3764706, 1,
1.591118, -1.527146, 4.153162, 1, 0, 0.372549, 1,
1.607127, 0.7814938, 0.8006973, 1, 0, 0.3647059, 1,
1.624642, -1.330944, 1.354539, 1, 0, 0.3607843, 1,
1.637368, -0.1579924, 2.438922, 1, 0, 0.3529412, 1,
1.640482, 0.7220794, 1.284882, 1, 0, 0.3490196, 1,
1.648107, -2.606703, 1.196209, 1, 0, 0.3411765, 1,
1.648214, -0.3961486, 3.227224, 1, 0, 0.3372549, 1,
1.660201, 0.1807783, 1.732695, 1, 0, 0.3294118, 1,
1.66723, -1.633283, 2.433097, 1, 0, 0.3254902, 1,
1.667516, -1.769137, 2.352407, 1, 0, 0.3176471, 1,
1.695817, -1.285918, 1.024404, 1, 0, 0.3137255, 1,
1.695951, -0.363861, 2.211629, 1, 0, 0.3058824, 1,
1.706344, -1.36681, 3.681178, 1, 0, 0.2980392, 1,
1.721564, -0.8518437, 1.550378, 1, 0, 0.2941177, 1,
1.724703, -0.8962437, 2.602516, 1, 0, 0.2862745, 1,
1.728901, 0.6176922, 1.187088, 1, 0, 0.282353, 1,
1.743039, -0.2257528, 2.3957, 1, 0, 0.2745098, 1,
1.75081, -0.4813867, 2.544136, 1, 0, 0.2705882, 1,
1.752193, -0.2269179, 1.54256, 1, 0, 0.2627451, 1,
1.756955, 1.839664, -0.2109039, 1, 0, 0.2588235, 1,
1.769696, 1.794986, 2.235033, 1, 0, 0.2509804, 1,
1.781519, 0.03906442, 1.397435, 1, 0, 0.2470588, 1,
1.789839, 0.7872192, 0.7589693, 1, 0, 0.2392157, 1,
1.791148, 1.862546, 1.602533, 1, 0, 0.2352941, 1,
1.82899, 0.8684549, -0.7354044, 1, 0, 0.227451, 1,
1.842753, -0.2457965, 1.991301, 1, 0, 0.2235294, 1,
1.853889, -0.7991548, 1.638169, 1, 0, 0.2156863, 1,
1.857412, -1.511745, 2.264125, 1, 0, 0.2117647, 1,
1.868181, -0.01692486, 1.528735, 1, 0, 0.2039216, 1,
1.895756, 0.4248018, 1.136795, 1, 0, 0.1960784, 1,
1.899795, -0.215434, 1.59991, 1, 0, 0.1921569, 1,
1.907349, -1.153287, -0.01832334, 1, 0, 0.1843137, 1,
1.907425, -1.625026, 2.038866, 1, 0, 0.1803922, 1,
1.925196, -0.1846217, 2.245903, 1, 0, 0.172549, 1,
1.925504, -0.3258536, 3.153197, 1, 0, 0.1686275, 1,
1.932271, -0.0659614, 2.14684, 1, 0, 0.1607843, 1,
1.944169, 0.6813814, 2.582656, 1, 0, 0.1568628, 1,
1.952327, 0.02632568, 1.39409, 1, 0, 0.1490196, 1,
1.953372, -1.449543, 0.2599314, 1, 0, 0.145098, 1,
1.956278, -0.03512938, 1.596832, 1, 0, 0.1372549, 1,
1.960358, -0.6463181, 2.110292, 1, 0, 0.1333333, 1,
1.969114, -1.191352, 3.285287, 1, 0, 0.1254902, 1,
1.980598, 0.4920057, 0.04574481, 1, 0, 0.1215686, 1,
1.981047, -1.162967, 0.4034119, 1, 0, 0.1137255, 1,
1.993085, -0.1554974, 0.817254, 1, 0, 0.1098039, 1,
2.001259, -0.3490688, 1.43933, 1, 0, 0.1019608, 1,
2.006542, -0.3371333, 3.568998, 1, 0, 0.09411765, 1,
2.023413, -0.2543131, 1.248705, 1, 0, 0.09019608, 1,
2.05144, 1.132858, 0.8764763, 1, 0, 0.08235294, 1,
2.057136, 0.5599743, 1.629112, 1, 0, 0.07843138, 1,
2.093795, -0.6635491, 2.30539, 1, 0, 0.07058824, 1,
2.1344, 1.194762, 2.340066, 1, 0, 0.06666667, 1,
2.211129, 0.2607831, 0.8800567, 1, 0, 0.05882353, 1,
2.211639, -0.6026484, 0.6005877, 1, 0, 0.05490196, 1,
2.235057, 1.058596, 2.169822, 1, 0, 0.04705882, 1,
2.276078, 1.648511, 2.293676, 1, 0, 0.04313726, 1,
2.447081, -0.9844361, 2.777777, 1, 0, 0.03529412, 1,
2.539378, 0.3557245, 2.307664, 1, 0, 0.03137255, 1,
2.61602, 1.321838, 0.8643689, 1, 0, 0.02352941, 1,
2.636885, 0.250733, -0.7530905, 1, 0, 0.01960784, 1,
2.716025, -2.030681, 1.987545, 1, 0, 0.01176471, 1,
2.878582, -0.2659974, 0.50324, 1, 0, 0.007843138, 1
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
-0.3824409, -3.863114, -7.673713, 0, -0.5, 0.5, 0.5,
-0.3824409, -3.863114, -7.673713, 1, -0.5, 0.5, 0.5,
-0.3824409, -3.863114, -7.673713, 1, 1.5, 0.5, 0.5,
-0.3824409, -3.863114, -7.673713, 0, 1.5, 0.5, 0.5
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
-4.74895, -0.007868052, -7.673713, 0, -0.5, 0.5, 0.5,
-4.74895, -0.007868052, -7.673713, 1, -0.5, 0.5, 0.5,
-4.74895, -0.007868052, -7.673713, 1, 1.5, 0.5, 0.5,
-4.74895, -0.007868052, -7.673713, 0, 1.5, 0.5, 0.5
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
-4.74895, -3.863114, 0.05374432, 0, -0.5, 0.5, 0.5,
-4.74895, -3.863114, 0.05374432, 1, -0.5, 0.5, 0.5,
-4.74895, -3.863114, 0.05374432, 1, 1.5, 0.5, 0.5,
-4.74895, -3.863114, 0.05374432, 0, 1.5, 0.5, 0.5
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
-3, -2.973442, -5.890454,
2, -2.973442, -5.890454,
-3, -2.973442, -5.890454,
-3, -3.12172, -6.187664,
-2, -2.973442, -5.890454,
-2, -3.12172, -6.187664,
-1, -2.973442, -5.890454,
-1, -3.12172, -6.187664,
0, -2.973442, -5.890454,
0, -3.12172, -6.187664,
1, -2.973442, -5.890454,
1, -3.12172, -6.187664,
2, -2.973442, -5.890454,
2, -3.12172, -6.187664
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
-3, -3.418278, -6.782084, 0, -0.5, 0.5, 0.5,
-3, -3.418278, -6.782084, 1, -0.5, 0.5, 0.5,
-3, -3.418278, -6.782084, 1, 1.5, 0.5, 0.5,
-3, -3.418278, -6.782084, 0, 1.5, 0.5, 0.5,
-2, -3.418278, -6.782084, 0, -0.5, 0.5, 0.5,
-2, -3.418278, -6.782084, 1, -0.5, 0.5, 0.5,
-2, -3.418278, -6.782084, 1, 1.5, 0.5, 0.5,
-2, -3.418278, -6.782084, 0, 1.5, 0.5, 0.5,
-1, -3.418278, -6.782084, 0, -0.5, 0.5, 0.5,
-1, -3.418278, -6.782084, 1, -0.5, 0.5, 0.5,
-1, -3.418278, -6.782084, 1, 1.5, 0.5, 0.5,
-1, -3.418278, -6.782084, 0, 1.5, 0.5, 0.5,
0, -3.418278, -6.782084, 0, -0.5, 0.5, 0.5,
0, -3.418278, -6.782084, 1, -0.5, 0.5, 0.5,
0, -3.418278, -6.782084, 1, 1.5, 0.5, 0.5,
0, -3.418278, -6.782084, 0, 1.5, 0.5, 0.5,
1, -3.418278, -6.782084, 0, -0.5, 0.5, 0.5,
1, -3.418278, -6.782084, 1, -0.5, 0.5, 0.5,
1, -3.418278, -6.782084, 1, 1.5, 0.5, 0.5,
1, -3.418278, -6.782084, 0, 1.5, 0.5, 0.5,
2, -3.418278, -6.782084, 0, -0.5, 0.5, 0.5,
2, -3.418278, -6.782084, 1, -0.5, 0.5, 0.5,
2, -3.418278, -6.782084, 1, 1.5, 0.5, 0.5,
2, -3.418278, -6.782084, 0, 1.5, 0.5, 0.5
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
-3.741295, -2, -5.890454,
-3.741295, 2, -5.890454,
-3.741295, -2, -5.890454,
-3.909237, -2, -6.187664,
-3.741295, -1, -5.890454,
-3.909237, -1, -6.187664,
-3.741295, 0, -5.890454,
-3.909237, 0, -6.187664,
-3.741295, 1, -5.890454,
-3.909237, 1, -6.187664,
-3.741295, 2, -5.890454,
-3.909237, 2, -6.187664
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
-4.245122, -2, -6.782084, 0, -0.5, 0.5, 0.5,
-4.245122, -2, -6.782084, 1, -0.5, 0.5, 0.5,
-4.245122, -2, -6.782084, 1, 1.5, 0.5, 0.5,
-4.245122, -2, -6.782084, 0, 1.5, 0.5, 0.5,
-4.245122, -1, -6.782084, 0, -0.5, 0.5, 0.5,
-4.245122, -1, -6.782084, 1, -0.5, 0.5, 0.5,
-4.245122, -1, -6.782084, 1, 1.5, 0.5, 0.5,
-4.245122, -1, -6.782084, 0, 1.5, 0.5, 0.5,
-4.245122, 0, -6.782084, 0, -0.5, 0.5, 0.5,
-4.245122, 0, -6.782084, 1, -0.5, 0.5, 0.5,
-4.245122, 0, -6.782084, 1, 1.5, 0.5, 0.5,
-4.245122, 0, -6.782084, 0, 1.5, 0.5, 0.5,
-4.245122, 1, -6.782084, 0, -0.5, 0.5, 0.5,
-4.245122, 1, -6.782084, 1, -0.5, 0.5, 0.5,
-4.245122, 1, -6.782084, 1, 1.5, 0.5, 0.5,
-4.245122, 1, -6.782084, 0, 1.5, 0.5, 0.5,
-4.245122, 2, -6.782084, 0, -0.5, 0.5, 0.5,
-4.245122, 2, -6.782084, 1, -0.5, 0.5, 0.5,
-4.245122, 2, -6.782084, 1, 1.5, 0.5, 0.5,
-4.245122, 2, -6.782084, 0, 1.5, 0.5, 0.5
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
-3.741295, -2.973442, -4,
-3.741295, -2.973442, 4,
-3.741295, -2.973442, -4,
-3.909237, -3.12172, -4,
-3.741295, -2.973442, -2,
-3.909237, -3.12172, -2,
-3.741295, -2.973442, 0,
-3.909237, -3.12172, 0,
-3.741295, -2.973442, 2,
-3.909237, -3.12172, 2,
-3.741295, -2.973442, 4,
-3.909237, -3.12172, 4
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
-4.245122, -3.418278, -4, 0, -0.5, 0.5, 0.5,
-4.245122, -3.418278, -4, 1, -0.5, 0.5, 0.5,
-4.245122, -3.418278, -4, 1, 1.5, 0.5, 0.5,
-4.245122, -3.418278, -4, 0, 1.5, 0.5, 0.5,
-4.245122, -3.418278, -2, 0, -0.5, 0.5, 0.5,
-4.245122, -3.418278, -2, 1, -0.5, 0.5, 0.5,
-4.245122, -3.418278, -2, 1, 1.5, 0.5, 0.5,
-4.245122, -3.418278, -2, 0, 1.5, 0.5, 0.5,
-4.245122, -3.418278, 0, 0, -0.5, 0.5, 0.5,
-4.245122, -3.418278, 0, 1, -0.5, 0.5, 0.5,
-4.245122, -3.418278, 0, 1, 1.5, 0.5, 0.5,
-4.245122, -3.418278, 0, 0, 1.5, 0.5, 0.5,
-4.245122, -3.418278, 2, 0, -0.5, 0.5, 0.5,
-4.245122, -3.418278, 2, 1, -0.5, 0.5, 0.5,
-4.245122, -3.418278, 2, 1, 1.5, 0.5, 0.5,
-4.245122, -3.418278, 2, 0, 1.5, 0.5, 0.5,
-4.245122, -3.418278, 4, 0, -0.5, 0.5, 0.5,
-4.245122, -3.418278, 4, 1, -0.5, 0.5, 0.5,
-4.245122, -3.418278, 4, 1, 1.5, 0.5, 0.5,
-4.245122, -3.418278, 4, 0, 1.5, 0.5, 0.5
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
-3.741295, -2.973442, -5.890454,
-3.741295, 2.957705, -5.890454,
-3.741295, -2.973442, 5.997942,
-3.741295, 2.957705, 5.997942,
-3.741295, -2.973442, -5.890454,
-3.741295, -2.973442, 5.997942,
-3.741295, 2.957705, -5.890454,
-3.741295, 2.957705, 5.997942,
-3.741295, -2.973442, -5.890454,
2.976413, -2.973442, -5.890454,
-3.741295, -2.973442, 5.997942,
2.976413, -2.973442, 5.997942,
-3.741295, 2.957705, -5.890454,
2.976413, 2.957705, -5.890454,
-3.741295, 2.957705, 5.997942,
2.976413, 2.957705, 5.997942,
2.976413, -2.973442, -5.890454,
2.976413, 2.957705, -5.890454,
2.976413, -2.973442, 5.997942,
2.976413, 2.957705, 5.997942,
2.976413, -2.973442, -5.890454,
2.976413, -2.973442, 5.997942,
2.976413, 2.957705, -5.890454,
2.976413, 2.957705, 5.997942
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
var radius = 7.949679;
var distance = 35.36902;
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
mvMatrix.translate( 0.3824409, 0.007868052, -0.05374432 );
mvMatrix.scale( 1.279506, 1.449188, 0.7230032 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.36902);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
phenylmethylcarbamat<-read.table("phenylmethylcarbamat.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenylmethylcarbamat$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenylmethylcarbamat' not found
```

```r
y<-phenylmethylcarbamat$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenylmethylcarbamat' not found
```

```r
z<-phenylmethylcarbamat$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenylmethylcarbamat' not found
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
-3.643464, 1.687865, -1.092437, 0, 0, 1, 1, 1,
-2.907245, -0.1746102, -2.02765, 1, 0, 0, 1, 1,
-2.629594, 0.4819448, -0.4202772, 1, 0, 0, 1, 1,
-2.509181, -1.711522, -2.120335, 1, 0, 0, 1, 1,
-2.474777, 0.7831424, -1.826677, 1, 0, 0, 1, 1,
-2.469052, 0.1268849, -1.548324, 1, 0, 0, 1, 1,
-2.40983, -2.493042, -1.087372, 0, 0, 0, 1, 1,
-2.391087, -0.1828854, -2.881068, 0, 0, 0, 1, 1,
-2.38656, -0.7590172, -2.658462, 0, 0, 0, 1, 1,
-2.378481, 0.6734018, -0.8547226, 0, 0, 0, 1, 1,
-2.319037, 0.3264422, -2.780769, 0, 0, 0, 1, 1,
-2.260222, -1.215301, -2.768503, 0, 0, 0, 1, 1,
-2.257574, -0.954055, -2.534101, 0, 0, 0, 1, 1,
-2.245912, -2.875303, -1.972801, 1, 1, 1, 1, 1,
-2.157137, 1.07008, 0.2297867, 1, 1, 1, 1, 1,
-2.122326, -0.07279599, -2.505656, 1, 1, 1, 1, 1,
-2.091143, -0.6579857, -2.728795, 1, 1, 1, 1, 1,
-2.056062, -0.7465001, -1.914572, 1, 1, 1, 1, 1,
-2.051951, 0.7898698, -1.57575, 1, 1, 1, 1, 1,
-2.046597, 0.8974966, -1.55354, 1, 1, 1, 1, 1,
-2.042686, -0.8469809, -1.147229, 1, 1, 1, 1, 1,
-2.025959, -0.5876686, -3.407844, 1, 1, 1, 1, 1,
-1.986505, 0.8337998, -0.8190701, 1, 1, 1, 1, 1,
-1.984853, -0.15602, -1.837945, 1, 1, 1, 1, 1,
-1.980014, -1.750751, -2.695642, 1, 1, 1, 1, 1,
-1.978413, -0.7012676, -2.199761, 1, 1, 1, 1, 1,
-1.978243, 0.5950255, -1.564992, 1, 1, 1, 1, 1,
-1.96267, 0.8905862, -1.152614, 1, 1, 1, 1, 1,
-1.945228, 1.357412, 0.01793604, 0, 0, 1, 1, 1,
-1.938287, 0.3360929, -0.5892705, 1, 0, 0, 1, 1,
-1.885427, 0.4138616, -1.376222, 1, 0, 0, 1, 1,
-1.863725, 0.720516, -1.911758, 1, 0, 0, 1, 1,
-1.851726, -0.4707655, -0.1276755, 1, 0, 0, 1, 1,
-1.851417, 0.1249679, -1.74646, 1, 0, 0, 1, 1,
-1.84711, 1.279547, 0.2403653, 0, 0, 0, 1, 1,
-1.806402, -0.2953588, -1.078685, 0, 0, 0, 1, 1,
-1.804981, -1.368241, -0.6327391, 0, 0, 0, 1, 1,
-1.79838, 0.1832302, -0.5411554, 0, 0, 0, 1, 1,
-1.781931, 0.256424, -1.474798, 0, 0, 0, 1, 1,
-1.781405, 1.759963, -0.7008318, 0, 0, 0, 1, 1,
-1.763504, -1.011652, -4.108795, 0, 0, 0, 1, 1,
-1.754828, 1.605165, -0.3816667, 1, 1, 1, 1, 1,
-1.74412, 0.4182791, -1.050326, 1, 1, 1, 1, 1,
-1.713065, 0.2540595, -0.1183877, 1, 1, 1, 1, 1,
-1.712061, -0.1654, -0.01577846, 1, 1, 1, 1, 1,
-1.710335, -0.6410493, -2.41048, 1, 1, 1, 1, 1,
-1.704328, 1.247502, -1.761445, 1, 1, 1, 1, 1,
-1.699874, -1.25999, -1.847843, 1, 1, 1, 1, 1,
-1.694185, 0.2315973, -2.008678, 1, 1, 1, 1, 1,
-1.686605, 1.217951, -0.8627368, 1, 1, 1, 1, 1,
-1.684258, 0.006603709, -2.845398, 1, 1, 1, 1, 1,
-1.68293, -2.152362, -0.005901261, 1, 1, 1, 1, 1,
-1.679981, 1.024604, -0.6524443, 1, 1, 1, 1, 1,
-1.676808, 1.315937, -1.08411, 1, 1, 1, 1, 1,
-1.654125, -0.6805896, -2.667491, 1, 1, 1, 1, 1,
-1.653447, -0.6087064, -2.838475, 1, 1, 1, 1, 1,
-1.636815, 1.677413, -1.431483, 0, 0, 1, 1, 1,
-1.628461, 1.92445, -0.7779506, 1, 0, 0, 1, 1,
-1.625693, 1.832806, -0.7412865, 1, 0, 0, 1, 1,
-1.625358, 1.055463, 0.8500866, 1, 0, 0, 1, 1,
-1.614778, 0.8649331, 1.29022, 1, 0, 0, 1, 1,
-1.592257, -0.3735067, -1.112394, 1, 0, 0, 1, 1,
-1.585333, 0.2701187, -1.798457, 0, 0, 0, 1, 1,
-1.580706, 0.4757651, -1.601858, 0, 0, 0, 1, 1,
-1.573932, -0.008062125, -1.338416, 0, 0, 0, 1, 1,
-1.566393, 0.5944491, 0.6514115, 0, 0, 0, 1, 1,
-1.558904, 0.2959131, -2.376926, 0, 0, 0, 1, 1,
-1.558744, -0.6895061, -1.967759, 0, 0, 0, 1, 1,
-1.536557, -0.5888439, -2.590394, 0, 0, 0, 1, 1,
-1.507363, 0.6389149, -2.063224, 1, 1, 1, 1, 1,
-1.502104, -0.9681576, -1.475133, 1, 1, 1, 1, 1,
-1.501823, 0.6977054, -1.783232, 1, 1, 1, 1, 1,
-1.496617, 1.589754, -2.201766, 1, 1, 1, 1, 1,
-1.487443, -0.3275805, -3.121119, 1, 1, 1, 1, 1,
-1.483604, -0.05593372, -0.5035228, 1, 1, 1, 1, 1,
-1.481288, -0.6594104, -1.509884, 1, 1, 1, 1, 1,
-1.473681, 1.010532, -0.8466161, 1, 1, 1, 1, 1,
-1.468627, -0.04111406, -1.109724, 1, 1, 1, 1, 1,
-1.467518, 0.1829016, -3.591329, 1, 1, 1, 1, 1,
-1.457651, -1.264614, -2.425826, 1, 1, 1, 1, 1,
-1.440623, -0.2078556, -2.209893, 1, 1, 1, 1, 1,
-1.430661, 0.1599174, -3.448159, 1, 1, 1, 1, 1,
-1.420102, 0.4873101, -1.208404, 1, 1, 1, 1, 1,
-1.416378, 0.5018041, -1.284971, 1, 1, 1, 1, 1,
-1.40479, 1.69492, -0.8372851, 0, 0, 1, 1, 1,
-1.403536, 0.1323909, -2.501662, 1, 0, 0, 1, 1,
-1.393438, 0.5872524, -2.210959, 1, 0, 0, 1, 1,
-1.391796, 1.107544, -0.8572015, 1, 0, 0, 1, 1,
-1.385232, -0.2825304, -2.280251, 1, 0, 0, 1, 1,
-1.384609, 0.6701883, -2.038875, 1, 0, 0, 1, 1,
-1.374491, -0.1122877, -1.353382, 0, 0, 0, 1, 1,
-1.368006, -1.186528, -1.136377, 0, 0, 0, 1, 1,
-1.35808, -0.4011947, -2.049191, 0, 0, 0, 1, 1,
-1.350236, 0.2233314, -1.470053, 0, 0, 0, 1, 1,
-1.349463, 2.762415, -3.006491, 0, 0, 0, 1, 1,
-1.346285, -2.001743, -2.53551, 0, 0, 0, 1, 1,
-1.342445, -0.78934, -3.776896, 0, 0, 0, 1, 1,
-1.342338, -0.2194246, -0.2543241, 1, 1, 1, 1, 1,
-1.336841, 0.06631248, -0.7864023, 1, 1, 1, 1, 1,
-1.332414, -0.8923419, -1.810992, 1, 1, 1, 1, 1,
-1.313124, -1.023725, -1.7661, 1, 1, 1, 1, 1,
-1.310304, -0.0350293, -0.2300054, 1, 1, 1, 1, 1,
-1.308559, -0.5625556, -2.203815, 1, 1, 1, 1, 1,
-1.307629, 1.955738, 0.4160251, 1, 1, 1, 1, 1,
-1.30275, -0.2017573, 0.6059377, 1, 1, 1, 1, 1,
-1.299738, -2.238816, -2.213349, 1, 1, 1, 1, 1,
-1.297336, -0.2582761, -1.607784, 1, 1, 1, 1, 1,
-1.288944, 0.5502914, -0.7496356, 1, 1, 1, 1, 1,
-1.287398, -0.242344, -1.158289, 1, 1, 1, 1, 1,
-1.286452, 1.049671, 0.3041461, 1, 1, 1, 1, 1,
-1.283886, 0.536705, -1.904992, 1, 1, 1, 1, 1,
-1.282904, -0.547669, -1.814969, 1, 1, 1, 1, 1,
-1.273776, 0.6971652, -1.314782, 0, 0, 1, 1, 1,
-1.273545, 0.7331867, -0.5152673, 1, 0, 0, 1, 1,
-1.271108, 0.02721834, -0.9182142, 1, 0, 0, 1, 1,
-1.266104, 2.87133, -0.7886143, 1, 0, 0, 1, 1,
-1.264961, -0.7594213, -0.9559859, 1, 0, 0, 1, 1,
-1.262125, -1.643716, -1.573294, 1, 0, 0, 1, 1,
-1.257683, 1.265386, -0.6578499, 0, 0, 0, 1, 1,
-1.249644, 2.06329, -1.119864, 0, 0, 0, 1, 1,
-1.247872, 0.5515339, -0.5975237, 0, 0, 0, 1, 1,
-1.230827, 0.8407702, -2.469194, 0, 0, 0, 1, 1,
-1.229888, 0.7357143, -1.839326, 0, 0, 0, 1, 1,
-1.223624, 2.291203, 0.3070251, 0, 0, 0, 1, 1,
-1.200252, -0.6605991, -2.583691, 0, 0, 0, 1, 1,
-1.198716, 0.7106746, -1.595507, 1, 1, 1, 1, 1,
-1.197556, -0.5752712, -2.106294, 1, 1, 1, 1, 1,
-1.193117, -0.3569047, -0.9625039, 1, 1, 1, 1, 1,
-1.193008, -0.06460226, -2.915692, 1, 1, 1, 1, 1,
-1.19116, 0.6661986, -0.4723159, 1, 1, 1, 1, 1,
-1.186573, 0.1537794, -1.705556, 1, 1, 1, 1, 1,
-1.183009, -0.2540559, -0.07708003, 1, 1, 1, 1, 1,
-1.172462, -0.5037177, -3.572499, 1, 1, 1, 1, 1,
-1.157227, 1.183467, 0.07991005, 1, 1, 1, 1, 1,
-1.155313, -0.775341, -1.808854, 1, 1, 1, 1, 1,
-1.155067, 1.010383, -1.583892, 1, 1, 1, 1, 1,
-1.153305, 0.2949079, -1.850141, 1, 1, 1, 1, 1,
-1.149472, 2.756959, -1.157775, 1, 1, 1, 1, 1,
-1.143925, 0.6966366, -1.344788, 1, 1, 1, 1, 1,
-1.143596, -0.8947826, -1.266555, 1, 1, 1, 1, 1,
-1.143547, 2.568397, 1.590702, 0, 0, 1, 1, 1,
-1.14067, -0.4023386, -3.155788, 1, 0, 0, 1, 1,
-1.132002, -1.891768, -3.653257, 1, 0, 0, 1, 1,
-1.131975, 0.7788924, -1.520439, 1, 0, 0, 1, 1,
-1.131001, -0.3954266, -1.924972, 1, 0, 0, 1, 1,
-1.130875, 0.4379337, -0.8787069, 1, 0, 0, 1, 1,
-1.128163, -0.6539392, -1.284931, 0, 0, 0, 1, 1,
-1.127235, 1.121596, 0.5632479, 0, 0, 0, 1, 1,
-1.124664, 1.122126, -1.295135, 0, 0, 0, 1, 1,
-1.117229, -0.2935981, -1.414595, 0, 0, 0, 1, 1,
-1.109989, -0.1748132, -2.638198, 0, 0, 0, 1, 1,
-1.098844, 0.5870344, -0.6997602, 0, 0, 0, 1, 1,
-1.097633, -0.3003542, -1.517071, 0, 0, 0, 1, 1,
-1.093408, 0.6631444, -0.4154358, 1, 1, 1, 1, 1,
-1.088704, 0.2919518, -2.611576, 1, 1, 1, 1, 1,
-1.075438, -1.153571, -1.397812, 1, 1, 1, 1, 1,
-1.067095, -0.9377334, -4.073113, 1, 1, 1, 1, 1,
-1.064336, 0.4022287, -0.656318, 1, 1, 1, 1, 1,
-1.061936, -0.677296, -2.563041, 1, 1, 1, 1, 1,
-1.046902, 0.5631214, -0.4726729, 1, 1, 1, 1, 1,
-1.037831, 0.3286943, -1.375568, 1, 1, 1, 1, 1,
-1.033525, 0.03413421, -3.501451, 1, 1, 1, 1, 1,
-1.025348, -0.39185, -0.9252249, 1, 1, 1, 1, 1,
-1.024112, -0.7649562, -1.535593, 1, 1, 1, 1, 1,
-1.016146, 0.8183494, -1.851919, 1, 1, 1, 1, 1,
-1.015658, -0.2639209, -1.187414, 1, 1, 1, 1, 1,
-1.010297, -0.6588283, -2.758407, 1, 1, 1, 1, 1,
-0.9990625, -0.4226258, -1.940769, 1, 1, 1, 1, 1,
-0.9968786, -0.7448509, -2.257222, 0, 0, 1, 1, 1,
-0.9959471, 0.932126, -0.3919262, 1, 0, 0, 1, 1,
-0.9951295, 0.4436903, -0.9795462, 1, 0, 0, 1, 1,
-0.9872722, 0.3277392, -2.17922, 1, 0, 0, 1, 1,
-0.9852112, 0.5369357, -1.310464, 1, 0, 0, 1, 1,
-0.9838481, -0.315609, -1.701972, 1, 0, 0, 1, 1,
-0.983437, -1.234118, -2.172288, 0, 0, 0, 1, 1,
-0.9760208, -0.7463785, -4.152999, 0, 0, 0, 1, 1,
-0.9666923, 2.026604, -0.04604877, 0, 0, 0, 1, 1,
-0.9654813, 1.391395, 0.05368261, 0, 0, 0, 1, 1,
-0.965225, -0.8756847, -3.252375, 0, 0, 0, 1, 1,
-0.956656, 1.537075, 0.4826419, 0, 0, 0, 1, 1,
-0.9527755, 1.275636, -0.4546929, 0, 0, 0, 1, 1,
-0.9487967, 0.1137016, -0.9888108, 1, 1, 1, 1, 1,
-0.9330204, 0.5911697, -1.222219, 1, 1, 1, 1, 1,
-0.9321981, -0.2775582, -2.738643, 1, 1, 1, 1, 1,
-0.9240163, -2.17916, -3.17636, 1, 1, 1, 1, 1,
-0.9234608, 0.6300402, -0.7727076, 1, 1, 1, 1, 1,
-0.9184076, 0.513967, -0.9624165, 1, 1, 1, 1, 1,
-0.9177023, 0.5861053, -0.9899659, 1, 1, 1, 1, 1,
-0.9174152, 0.5837997, -1.691982, 1, 1, 1, 1, 1,
-0.9141397, -0.6560768, -2.203869, 1, 1, 1, 1, 1,
-0.9139834, 1.252312, -2.018178, 1, 1, 1, 1, 1,
-0.9132142, -0.07904318, -2.490717, 1, 1, 1, 1, 1,
-0.911444, -0.4084918, -0.9220906, 1, 1, 1, 1, 1,
-0.9109372, -2.586589, -2.790542, 1, 1, 1, 1, 1,
-0.9077263, -2.390021, -1.286881, 1, 1, 1, 1, 1,
-0.9002073, 0.06193165, -1.404532, 1, 1, 1, 1, 1,
-0.8996778, 0.7985716, 0.1289144, 0, 0, 1, 1, 1,
-0.8875996, -0.99529, -3.950056, 1, 0, 0, 1, 1,
-0.8865421, -1.033336, -2.1411, 1, 0, 0, 1, 1,
-0.8853523, -0.5102639, -2.743652, 1, 0, 0, 1, 1,
-0.8826746, 1.786539, -0.5766159, 1, 0, 0, 1, 1,
-0.8653367, 0.1696374, -2.171655, 1, 0, 0, 1, 1,
-0.860639, 0.3043549, -1.814262, 0, 0, 0, 1, 1,
-0.8593076, -1.450142, -1.599944, 0, 0, 0, 1, 1,
-0.8562758, 0.1158133, -1.149362, 0, 0, 0, 1, 1,
-0.8468773, 1.047461, 1.164714, 0, 0, 0, 1, 1,
-0.8467099, -0.9938571, -4.229771, 0, 0, 0, 1, 1,
-0.8306841, -0.4143657, -1.095083, 0, 0, 0, 1, 1,
-0.8235697, 1.030647, 0.2624803, 0, 0, 0, 1, 1,
-0.8222882, 0.6036388, -1.516428, 1, 1, 1, 1, 1,
-0.8199542, 0.487383, -1.968341, 1, 1, 1, 1, 1,
-0.8136806, -1.044897, -3.71912, 1, 1, 1, 1, 1,
-0.810559, -0.6620084, -0.9459349, 1, 1, 1, 1, 1,
-0.8096982, 0.6718983, -1.724222, 1, 1, 1, 1, 1,
-0.8094504, -1.579174, -3.803188, 1, 1, 1, 1, 1,
-0.8056401, -1.685305, -2.360164, 1, 1, 1, 1, 1,
-0.7980227, -0.1797992, -1.877121, 1, 1, 1, 1, 1,
-0.7975376, 0.8344472, -2.965237, 1, 1, 1, 1, 1,
-0.7951651, -1.530782, -1.694441, 1, 1, 1, 1, 1,
-0.7881395, 1.148745, 0.3162879, 1, 1, 1, 1, 1,
-0.7863449, 0.738074, 0.4653024, 1, 1, 1, 1, 1,
-0.7823581, 0.1274051, -1.339376, 1, 1, 1, 1, 1,
-0.7815362, 1.415243, 0.6571442, 1, 1, 1, 1, 1,
-0.7755362, 0.04081361, 0.3126802, 1, 1, 1, 1, 1,
-0.7752839, 2.082998, -1.301177, 0, 0, 1, 1, 1,
-0.7732131, 0.04038539, -2.986328, 1, 0, 0, 1, 1,
-0.7704093, 1.05665, -0.09105378, 1, 0, 0, 1, 1,
-0.7611023, -1.061395, -2.829431, 1, 0, 0, 1, 1,
-0.7576588, 0.4884198, -0.726585, 1, 0, 0, 1, 1,
-0.7567673, 0.06735047, -0.9825655, 1, 0, 0, 1, 1,
-0.7515247, -1.488372, -3.097975, 0, 0, 0, 1, 1,
-0.7493379, 0.4283496, 1.767934, 0, 0, 0, 1, 1,
-0.7484949, 1.760247, -0.0576136, 0, 0, 0, 1, 1,
-0.7472172, -0.3773143, -0.6910174, 0, 0, 0, 1, 1,
-0.7468584, -0.8563491, -3.130522, 0, 0, 0, 1, 1,
-0.744585, -0.3949521, -0.7731209, 0, 0, 0, 1, 1,
-0.7370797, -0.1685278, -1.600798, 0, 0, 0, 1, 1,
-0.7348236, -2.108929, -1.456383, 1, 1, 1, 1, 1,
-0.7264097, -1.941261, -1.271371, 1, 1, 1, 1, 1,
-0.7248099, -0.03575108, -0.4635946, 1, 1, 1, 1, 1,
-0.7169948, 1.241232, -0.7489353, 1, 1, 1, 1, 1,
-0.7160548, -0.235955, -2.396937, 1, 1, 1, 1, 1,
-0.7127801, 1.297678, 0.6109877, 1, 1, 1, 1, 1,
-0.7097802, 1.082131, 0.8735535, 1, 1, 1, 1, 1,
-0.7003291, -2.248028, -3.934226, 1, 1, 1, 1, 1,
-0.6965808, -0.8460816, -1.440854, 1, 1, 1, 1, 1,
-0.6965471, -0.7820916, -1.544542, 1, 1, 1, 1, 1,
-0.6951328, -0.9957358, -2.15142, 1, 1, 1, 1, 1,
-0.6928052, 0.8241292, -0.1003563, 1, 1, 1, 1, 1,
-0.6923378, -0.88503, 0.1856265, 1, 1, 1, 1, 1,
-0.685784, -0.8460042, -1.418409, 1, 1, 1, 1, 1,
-0.6814508, 0.08656986, -2.144591, 1, 1, 1, 1, 1,
-0.680097, 0.6234996, -0.1584415, 0, 0, 1, 1, 1,
-0.6789963, -0.5533886, -1.488924, 1, 0, 0, 1, 1,
-0.6774004, -1.14609, -2.701693, 1, 0, 0, 1, 1,
-0.6760483, -0.3589714, -2.409503, 1, 0, 0, 1, 1,
-0.6706547, -0.1878919, -1.730083, 1, 0, 0, 1, 1,
-0.6703355, -1.77009, -3.720794, 1, 0, 0, 1, 1,
-0.6621087, 0.06999533, -2.024848, 0, 0, 0, 1, 1,
-0.6575907, 0.7554889, -1.439439, 0, 0, 0, 1, 1,
-0.6569633, -0.1618077, -1.849856, 0, 0, 0, 1, 1,
-0.6568041, -0.06064761, -0.7339594, 0, 0, 0, 1, 1,
-0.6567868, -0.3397514, -3.050207, 0, 0, 0, 1, 1,
-0.6544684, -1.290269, -1.032181, 0, 0, 0, 1, 1,
-0.6526703, -0.7691672, -1.873737, 0, 0, 0, 1, 1,
-0.6526265, -1.373062, -2.958361, 1, 1, 1, 1, 1,
-0.6477641, -1.207383, -1.430669, 1, 1, 1, 1, 1,
-0.6388212, -0.6230776, -2.536459, 1, 1, 1, 1, 1,
-0.638751, -0.8450972, -1.701506, 1, 1, 1, 1, 1,
-0.6369606, -1.448097, -1.745823, 1, 1, 1, 1, 1,
-0.6234109, -0.4404646, -0.8287686, 1, 1, 1, 1, 1,
-0.6231482, 0.5190661, -0.5960794, 1, 1, 1, 1, 1,
-0.6208664, 0.7883436, -1.659938, 1, 1, 1, 1, 1,
-0.6185307, -0.3774117, -1.912191, 1, 1, 1, 1, 1,
-0.6175273, 0.0984075, -0.628717, 1, 1, 1, 1, 1,
-0.615256, 1.194588, 0.2511817, 1, 1, 1, 1, 1,
-0.6149088, -1.142031, -2.362067, 1, 1, 1, 1, 1,
-0.6093671, -1.454672, -3.986818, 1, 1, 1, 1, 1,
-0.6087598, 1.561079, -0.4280668, 1, 1, 1, 1, 1,
-0.6019808, -1.915568, -2.429879, 1, 1, 1, 1, 1,
-0.5993477, -0.7352458, -0.9571617, 0, 0, 1, 1, 1,
-0.5984815, -0.2950614, -0.8548031, 1, 0, 0, 1, 1,
-0.5971636, -0.2795103, -0.7352406, 1, 0, 0, 1, 1,
-0.5819067, -0.01815261, -1.990588, 1, 0, 0, 1, 1,
-0.5796651, -2.887066, -1.420084, 1, 0, 0, 1, 1,
-0.5792041, -0.4348445, -2.920333, 1, 0, 0, 1, 1,
-0.5783017, 0.5163085, -1.684334, 0, 0, 0, 1, 1,
-0.5770661, -0.5615504, -3.484616, 0, 0, 0, 1, 1,
-0.575744, 1.041088, -1.427152, 0, 0, 0, 1, 1,
-0.5706189, -1.138193, -2.908432, 0, 0, 0, 1, 1,
-0.5562201, -0.7262319, -3.23248, 0, 0, 0, 1, 1,
-0.5505698, 0.5207529, -0.6994411, 0, 0, 0, 1, 1,
-0.5486742, 0.9632925, 0.1876422, 0, 0, 0, 1, 1,
-0.5481333, 1.119858, 0.3253267, 1, 1, 1, 1, 1,
-0.5459191, -0.1828573, -2.293272, 1, 1, 1, 1, 1,
-0.5444586, 0.5458742, 0.7016992, 1, 1, 1, 1, 1,
-0.5427034, -0.08567686, -2.003211, 1, 1, 1, 1, 1,
-0.5380567, 0.04487935, -2.520819, 1, 1, 1, 1, 1,
-0.538047, 0.1361178, -1.202361, 1, 1, 1, 1, 1,
-0.5376204, -0.03867281, -2.034927, 1, 1, 1, 1, 1,
-0.5373607, -1.918981, -1.735231, 1, 1, 1, 1, 1,
-0.5335287, -0.1958253, -0.803259, 1, 1, 1, 1, 1,
-0.5303448, -1.252352, -2.68805, 1, 1, 1, 1, 1,
-0.5286905, -0.959776, -1.753862, 1, 1, 1, 1, 1,
-0.5261249, -0.04245298, -1.308319, 1, 1, 1, 1, 1,
-0.5261155, 0.4358597, -1.968906, 1, 1, 1, 1, 1,
-0.5145976, -2.125863, -0.9202167, 1, 1, 1, 1, 1,
-0.5067082, -0.6819036, -3.413908, 1, 1, 1, 1, 1,
-0.5048005, -0.2501368, -1.613489, 0, 0, 1, 1, 1,
-0.5036348, 0.03964191, -1.106638, 1, 0, 0, 1, 1,
-0.4948607, -0.08571156, -1.004212, 1, 0, 0, 1, 1,
-0.4944531, 0.5393187, -1.478573, 1, 0, 0, 1, 1,
-0.4936877, 0.03928217, -0.631357, 1, 0, 0, 1, 1,
-0.4928385, -0.7469395, -2.056773, 1, 0, 0, 1, 1,
-0.4923163, -0.2158631, -0.3431689, 0, 0, 0, 1, 1,
-0.4916247, 1.633064, -0.5672385, 0, 0, 0, 1, 1,
-0.4888571, -0.6570572, -2.335636, 0, 0, 0, 1, 1,
-0.4842524, 0.6658631, -0.5580618, 0, 0, 0, 1, 1,
-0.482384, 0.4319912, -2.132346, 0, 0, 0, 1, 1,
-0.4817084, -0.5580841, -1.16713, 0, 0, 0, 1, 1,
-0.4812745, -0.04821594, -2.077829, 0, 0, 0, 1, 1,
-0.480778, 0.1898231, -1.973235, 1, 1, 1, 1, 1,
-0.4755841, 0.6576055, -1.294047, 1, 1, 1, 1, 1,
-0.4754167, 0.4452745, -1.242323, 1, 1, 1, 1, 1,
-0.4735229, -1.278414, -2.6856, 1, 1, 1, 1, 1,
-0.4716071, -1.838992, -3.169965, 1, 1, 1, 1, 1,
-0.4706169, 1.328201, -0.9321758, 1, 1, 1, 1, 1,
-0.4655586, -1.492711, -3.322196, 1, 1, 1, 1, 1,
-0.4631476, -1.20594, -1.300676, 1, 1, 1, 1, 1,
-0.4604579, -0.3002163, -0.6276696, 1, 1, 1, 1, 1,
-0.4558924, -1.158635, -2.413889, 1, 1, 1, 1, 1,
-0.4543938, -0.4690816, -3.712683, 1, 1, 1, 1, 1,
-0.4525158, -0.2377839, -1.897625, 1, 1, 1, 1, 1,
-0.4509682, -0.5370316, -2.731331, 1, 1, 1, 1, 1,
-0.4471447, -1.235284, -1.955686, 1, 1, 1, 1, 1,
-0.4446319, 1.096698, -0.5705335, 1, 1, 1, 1, 1,
-0.4421135, 0.1921677, -0.7418365, 0, 0, 1, 1, 1,
-0.4420527, 0.7671066, 1.321749, 1, 0, 0, 1, 1,
-0.4394591, -0.7389163, -2.346652, 1, 0, 0, 1, 1,
-0.4380432, 2.062314, -0.7099471, 1, 0, 0, 1, 1,
-0.431486, 1.840409, -0.1186768, 1, 0, 0, 1, 1,
-0.4290009, -1.444786, -2.83089, 1, 0, 0, 1, 1,
-0.4219875, 0.2138834, -0.6325795, 0, 0, 0, 1, 1,
-0.4167487, 0.1832208, -1.234638, 0, 0, 0, 1, 1,
-0.4161475, 2.060171, 0.34727, 0, 0, 0, 1, 1,
-0.4127114, 0.3354248, -0.7230328, 0, 0, 0, 1, 1,
-0.402067, 0.3377132, 0.1735068, 0, 0, 0, 1, 1,
-0.401805, -0.1858963, -1.204246, 0, 0, 0, 1, 1,
-0.4002267, 0.9609798, 1.215962, 0, 0, 0, 1, 1,
-0.3952924, 0.1913836, -1.346866, 1, 1, 1, 1, 1,
-0.3952427, -0.3077663, -2.622929, 1, 1, 1, 1, 1,
-0.3945855, 0.01698539, -1.768076, 1, 1, 1, 1, 1,
-0.3867234, -2.463954, -1.649348, 1, 1, 1, 1, 1,
-0.38611, 0.3012453, -1.563311, 1, 1, 1, 1, 1,
-0.383638, 0.9228989, -1.240072, 1, 1, 1, 1, 1,
-0.3827473, 1.313201, -1.621539, 1, 1, 1, 1, 1,
-0.3820128, 0.5062214, -2.679585, 1, 1, 1, 1, 1,
-0.3805345, -1.428919, -1.878147, 1, 1, 1, 1, 1,
-0.3688031, 0.4626576, -0.7987045, 1, 1, 1, 1, 1,
-0.3657313, -0.2073799, -2.17364, 1, 1, 1, 1, 1,
-0.355114, 0.05579672, -2.91438, 1, 1, 1, 1, 1,
-0.3519509, -0.8985469, -3.45307, 1, 1, 1, 1, 1,
-0.3507995, -2.230182, -3.571462, 1, 1, 1, 1, 1,
-0.3409203, -0.09145035, -0.9686984, 1, 1, 1, 1, 1,
-0.3406529, 0.8942651, 0.5392956, 0, 0, 1, 1, 1,
-0.3396599, -0.8771142, -4.508357, 1, 0, 0, 1, 1,
-0.3325764, 0.263047, -1.884592, 1, 0, 0, 1, 1,
-0.3162439, -0.01553214, -0.9938218, 1, 0, 0, 1, 1,
-0.3157972, -2.858587, -3.779891, 1, 0, 0, 1, 1,
-0.3153715, -1.229275, -3.493713, 1, 0, 0, 1, 1,
-0.3132859, -0.6303312, -1.986651, 0, 0, 0, 1, 1,
-0.3129554, -2.095813, -2.61803, 0, 0, 0, 1, 1,
-0.3110798, -0.01685827, -3.23836, 0, 0, 0, 1, 1,
-0.3094056, 1.142179, -0.4496976, 0, 0, 0, 1, 1,
-0.3035529, 1.282084, 1.666031, 0, 0, 0, 1, 1,
-0.3016775, 0.1058857, -1.668392, 0, 0, 0, 1, 1,
-0.3010471, 0.07425619, -3.624469, 0, 0, 0, 1, 1,
-0.2888735, -0.9157803, -2.902042, 1, 1, 1, 1, 1,
-0.278387, 0.5095544, -1.039768, 1, 1, 1, 1, 1,
-0.2771229, -0.5179505, -2.389709, 1, 1, 1, 1, 1,
-0.2762996, -0.5926877, -1.448302, 1, 1, 1, 1, 1,
-0.2745737, 0.5159241, -1.494114, 1, 1, 1, 1, 1,
-0.2714692, -0.4221788, -1.746004, 1, 1, 1, 1, 1,
-0.2708394, 0.2615041, -2.227976, 1, 1, 1, 1, 1,
-0.2704205, -1.195242, -3.614617, 1, 1, 1, 1, 1,
-0.2665778, 1.592526, -0.3881688, 1, 1, 1, 1, 1,
-0.264806, -0.5846304, -2.070127, 1, 1, 1, 1, 1,
-0.2552111, 0.2036011, 0.80102, 1, 1, 1, 1, 1,
-0.2506504, 0.4203131, -2.571013, 1, 1, 1, 1, 1,
-0.2505768, -0.7841032, -3.0953, 1, 1, 1, 1, 1,
-0.2481834, -2.013096, -3.215487, 1, 1, 1, 1, 1,
-0.2477025, 0.07171156, -1.797902, 1, 1, 1, 1, 1,
-0.2465532, 0.1952602, -0.7063408, 0, 0, 1, 1, 1,
-0.2410767, 0.5222545, 0.8338744, 1, 0, 0, 1, 1,
-0.2404864, -1.241396, -0.9289802, 1, 0, 0, 1, 1,
-0.2394874, -1.349986, -3.750011, 1, 0, 0, 1, 1,
-0.2326496, 0.6812233, 1.435453, 1, 0, 0, 1, 1,
-0.230377, -0.9813349, -1.533683, 1, 0, 0, 1, 1,
-0.2288843, 0.2381304, -0.5333242, 0, 0, 0, 1, 1,
-0.2288736, -0.6029956, -2.115665, 0, 0, 0, 1, 1,
-0.2255394, -0.721293, -3.080887, 0, 0, 0, 1, 1,
-0.2244547, 2.344559, 0.9812621, 0, 0, 0, 1, 1,
-0.2239612, 1.296737, 0.5664173, 0, 0, 0, 1, 1,
-0.2237485, 0.8409626, -1.961133, 0, 0, 0, 1, 1,
-0.223262, 1.859895, 0.5538921, 0, 0, 0, 1, 1,
-0.218964, -0.9472365, -5.717322, 1, 1, 1, 1, 1,
-0.2180605, -1.552621, -2.848928, 1, 1, 1, 1, 1,
-0.2164128, -0.825088, -2.511708, 1, 1, 1, 1, 1,
-0.2147551, -0.4364257, -4.126888, 1, 1, 1, 1, 1,
-0.2001279, 0.5037385, 0.8730311, 1, 1, 1, 1, 1,
-0.199437, -0.8650978, -2.838584, 1, 1, 1, 1, 1,
-0.1979928, -0.2261955, -2.227193, 1, 1, 1, 1, 1,
-0.1935727, -0.2627969, -4.907453, 1, 1, 1, 1, 1,
-0.1911052, -1.614096, -3.575701, 1, 1, 1, 1, 1,
-0.1860245, 0.4546764, 1.692114, 1, 1, 1, 1, 1,
-0.1839485, -0.03994108, -0.1288963, 1, 1, 1, 1, 1,
-0.1835439, -0.2957629, -2.43539, 1, 1, 1, 1, 1,
-0.1816064, -1.499974, -3.445768, 1, 1, 1, 1, 1,
-0.1792144, -0.6245183, -2.824886, 1, 1, 1, 1, 1,
-0.1768073, 0.007219926, 0.3780977, 1, 1, 1, 1, 1,
-0.1750052, -0.9914864, -2.215433, 0, 0, 1, 1, 1,
-0.1718, -0.7434781, -5.18365, 1, 0, 0, 1, 1,
-0.1696118, -0.06508441, -1.863241, 1, 0, 0, 1, 1,
-0.1691867, -0.005001009, -1.921566, 1, 0, 0, 1, 1,
-0.1689331, 1.271734, -1.316431, 1, 0, 0, 1, 1,
-0.1631974, 0.6087979, 0.2398432, 1, 0, 0, 1, 1,
-0.161208, 0.3730744, -1.295061, 0, 0, 0, 1, 1,
-0.1597378, -0.524081, -1.757385, 0, 0, 0, 1, 1,
-0.1594908, -0.4869848, -3.351428, 0, 0, 0, 1, 1,
-0.1581541, 1.676781, -1.426462, 0, 0, 0, 1, 1,
-0.1579285, 0.6207594, -2.503208, 0, 0, 0, 1, 1,
-0.1535646, -1.868836, -2.835749, 0, 0, 0, 1, 1,
-0.1532328, 0.1672219, -0.3748331, 0, 0, 0, 1, 1,
-0.1469947, -1.146557, -3.545474, 1, 1, 1, 1, 1,
-0.1467151, 0.5415056, 0.4052652, 1, 1, 1, 1, 1,
-0.1450613, 0.5673463, -0.6242452, 1, 1, 1, 1, 1,
-0.1438662, -1.514975, -1.670774, 1, 1, 1, 1, 1,
-0.1383549, -0.1402991, -0.9758639, 1, 1, 1, 1, 1,
-0.1377801, 0.7576793, -1.193341, 1, 1, 1, 1, 1,
-0.136844, -1.740358, -3.087397, 1, 1, 1, 1, 1,
-0.1356816, 0.3054928, 0.2444632, 1, 1, 1, 1, 1,
-0.1350044, -0.2945673, -3.65902, 1, 1, 1, 1, 1,
-0.1342415, 2.136726, 0.6972585, 1, 1, 1, 1, 1,
-0.1331221, 0.2284385, 0.1870038, 1, 1, 1, 1, 1,
-0.1315978, -0.1165379, -1.419672, 1, 1, 1, 1, 1,
-0.1295829, -0.1886017, -2.601511, 1, 1, 1, 1, 1,
-0.1217115, 1.70812, 0.7563493, 1, 1, 1, 1, 1,
-0.1149901, 0.3655833, 0.06377075, 1, 1, 1, 1, 1,
-0.1100735, 0.4416065, 1.327315, 0, 0, 1, 1, 1,
-0.1082417, 0.8519238, 1.012774, 1, 0, 0, 1, 1,
-0.1043113, 0.01840023, -1.635616, 1, 0, 0, 1, 1,
-0.1019848, -0.1953514, -4.408213, 1, 0, 0, 1, 1,
-0.1001574, 0.2660043, 0.8295522, 1, 0, 0, 1, 1,
-0.09922478, 1.604842, 0.9157546, 1, 0, 0, 1, 1,
-0.09499302, 0.2513475, -0.752132, 0, 0, 0, 1, 1,
-0.09490405, -1.974147, -3.377244, 0, 0, 0, 1, 1,
-0.0924968, -2.039439, -3.374845, 0, 0, 0, 1, 1,
-0.08010274, 2.153624, 0.5018552, 0, 0, 0, 1, 1,
-0.07714303, -0.07872579, -3.12253, 0, 0, 0, 1, 1,
-0.07606184, 0.1863715, 0.3219786, 0, 0, 0, 1, 1,
-0.07310141, -0.6647409, -4.127459, 0, 0, 0, 1, 1,
-0.07127334, -0.3448765, -2.544564, 1, 1, 1, 1, 1,
-0.06921495, -0.7900254, -2.633592, 1, 1, 1, 1, 1,
-0.06906641, -0.9471393, -1.437031, 1, 1, 1, 1, 1,
-0.06706373, -0.08216558, -1.190816, 1, 1, 1, 1, 1,
-0.05667556, 0.107198, -1.252543, 1, 1, 1, 1, 1,
-0.05601573, 1.047483, 0.7333587, 1, 1, 1, 1, 1,
-0.05005315, -0.5427451, -2.538474, 1, 1, 1, 1, 1,
-0.04369217, 0.8313913, -1.173492, 1, 1, 1, 1, 1,
-0.04076533, 0.1175521, -0.1525411, 1, 1, 1, 1, 1,
-0.03834362, -0.3554081, -4.403857, 1, 1, 1, 1, 1,
-0.03292942, 1.335418, 0.6632268, 1, 1, 1, 1, 1,
-0.03232161, 0.7844255, -0.8985412, 1, 1, 1, 1, 1,
-0.03111892, -0.1135639, -3.449867, 1, 1, 1, 1, 1,
-0.03013982, 0.2777167, 1.039867, 1, 1, 1, 1, 1,
-0.02163888, -0.08272296, -3.007724, 1, 1, 1, 1, 1,
-0.02046156, 2.010129, 0.1447253, 0, 0, 1, 1, 1,
-0.01901381, 1.092719, -1.398911, 1, 0, 0, 1, 1,
-0.0173171, -0.3835394, -2.216083, 1, 0, 0, 1, 1,
-0.01523995, 0.1402569, 1.273909, 1, 0, 0, 1, 1,
-0.0106234, -0.4289616, -2.142624, 1, 0, 0, 1, 1,
-0.00669081, 2.031039, 1.078627, 1, 0, 0, 1, 1,
-0.004288627, -1.147525, -3.763138, 0, 0, 0, 1, 1,
-0.002743879, -0.3383413, -0.9438482, 0, 0, 0, 1, 1,
-0.002561999, -0.3585598, -3.869922, 0, 0, 0, 1, 1,
-0.001625026, 0.5310711, -1.56154, 0, 0, 0, 1, 1,
-0.001571106, 1.358299, 1.695461, 0, 0, 0, 1, 1,
-0.00128926, 0.2222292, 0.6625314, 0, 0, 0, 1, 1,
0.00360748, 0.05269031, 1.702903, 0, 0, 0, 1, 1,
0.004662752, -0.5984409, 2.849567, 1, 1, 1, 1, 1,
0.00847042, -0.4265088, 3.36904, 1, 1, 1, 1, 1,
0.01033726, 0.6516011, -1.762882, 1, 1, 1, 1, 1,
0.01295131, -0.1747506, 4.199943, 1, 1, 1, 1, 1,
0.01327248, -0.4791799, 3.575485, 1, 1, 1, 1, 1,
0.01444861, -0.4685145, 5.005354, 1, 1, 1, 1, 1,
0.01449703, -1.56183, 2.888113, 1, 1, 1, 1, 1,
0.01460298, -1.406561, 2.417779, 1, 1, 1, 1, 1,
0.0165987, -0.1624029, 1.46269, 1, 1, 1, 1, 1,
0.01757213, 0.1627854, 0.9654116, 1, 1, 1, 1, 1,
0.02288296, -0.7182842, 1.801509, 1, 1, 1, 1, 1,
0.02312405, -0.7360445, 3.619766, 1, 1, 1, 1, 1,
0.02457453, -2.047183, 2.964373, 1, 1, 1, 1, 1,
0.02590474, -0.7106886, 2.834619, 1, 1, 1, 1, 1,
0.029057, -0.5885851, 4.418892, 1, 1, 1, 1, 1,
0.0303612, 0.8879468, -0.3626598, 0, 0, 1, 1, 1,
0.03194067, -2.253136, 3.177387, 1, 0, 0, 1, 1,
0.03210457, -1.32023, 3.536228, 1, 0, 0, 1, 1,
0.03305871, -0.9134991, 3.722307, 1, 0, 0, 1, 1,
0.03388254, 0.6447808, -0.04049112, 1, 0, 0, 1, 1,
0.03488311, -0.08215073, 3.431592, 1, 0, 0, 1, 1,
0.03792503, 0.137477, -0.3576541, 0, 0, 0, 1, 1,
0.03867581, -0.04819034, 2.605762, 0, 0, 0, 1, 1,
0.04299881, 0.6180785, -0.9867201, 0, 0, 0, 1, 1,
0.04462183, -0.33539, 4.782158, 0, 0, 0, 1, 1,
0.04588211, 1.807219, -0.250392, 0, 0, 0, 1, 1,
0.04815266, -0.9847506, 3.138731, 0, 0, 0, 1, 1,
0.04879819, 0.01611714, 1.761991, 0, 0, 0, 1, 1,
0.05091104, 1.997463, -0.06987486, 1, 1, 1, 1, 1,
0.05402675, -0.5730259, 3.300293, 1, 1, 1, 1, 1,
0.05829922, 1.796397, 0.6407278, 1, 1, 1, 1, 1,
0.05929758, -1.076447, 3.149309, 1, 1, 1, 1, 1,
0.05994282, -0.9409584, 4.594774, 1, 1, 1, 1, 1,
0.06124991, 0.6976231, -1.733968, 1, 1, 1, 1, 1,
0.06411769, -0.9655379, 2.716247, 1, 1, 1, 1, 1,
0.07011943, 0.5893899, 0.1129587, 1, 1, 1, 1, 1,
0.07118381, -1.01293, 1.700835, 1, 1, 1, 1, 1,
0.07143484, 0.5110383, -0.2653357, 1, 1, 1, 1, 1,
0.0760036, 0.9455477, -0.422414, 1, 1, 1, 1, 1,
0.07615204, -1.224047, 3.689364, 1, 1, 1, 1, 1,
0.08424667, -0.2277683, 1.516457, 1, 1, 1, 1, 1,
0.0855802, 0.9553126, 1.791215, 1, 1, 1, 1, 1,
0.087189, -0.09378071, 1.328757, 1, 1, 1, 1, 1,
0.08857404, 0.4968385, 0.9466102, 0, 0, 1, 1, 1,
0.08891775, 1.142618, 0.155543, 1, 0, 0, 1, 1,
0.09317756, 0.5332826, -0.5900043, 1, 0, 0, 1, 1,
0.09916516, -0.7745876, 0.7913997, 1, 0, 0, 1, 1,
0.1005308, -0.2888622, 2.428629, 1, 0, 0, 1, 1,
0.1013353, -0.9535981, 2.882047, 1, 0, 0, 1, 1,
0.1060071, 0.9719119, -0.2861917, 0, 0, 0, 1, 1,
0.1068664, -0.09798538, 3.340784, 0, 0, 0, 1, 1,
0.1080712, -1.172416, 2.27907, 0, 0, 0, 1, 1,
0.1090807, -0.1780724, 1.699783, 0, 0, 0, 1, 1,
0.1092998, 1.376261, 0.2703085, 0, 0, 0, 1, 1,
0.114322, 1.540849, 1.319826, 0, 0, 0, 1, 1,
0.1152386, -1.876373, 3.05572, 0, 0, 0, 1, 1,
0.1188846, -0.4617956, 3.126048, 1, 1, 1, 1, 1,
0.121896, 0.6433908, -0.3618089, 1, 1, 1, 1, 1,
0.1259229, -0.7483535, 3.485208, 1, 1, 1, 1, 1,
0.1287082, -1.072093, 2.807835, 1, 1, 1, 1, 1,
0.1352669, 0.9421301, 0.07633059, 1, 1, 1, 1, 1,
0.1356897, 2.084833, -1.272206, 1, 1, 1, 1, 1,
0.135712, -0.3584751, 2.297889, 1, 1, 1, 1, 1,
0.1373661, -2.731343, 3.73239, 1, 1, 1, 1, 1,
0.1447777, 0.8489037, 2.643734, 1, 1, 1, 1, 1,
0.1449312, 0.3302406, -1.57268, 1, 1, 1, 1, 1,
0.1518928, -0.6484362, 3.871425, 1, 1, 1, 1, 1,
0.1534319, 1.020625, 0.3512785, 1, 1, 1, 1, 1,
0.159728, 0.0796684, 0.6981785, 1, 1, 1, 1, 1,
0.1611222, 0.4686667, 0.4915497, 1, 1, 1, 1, 1,
0.1618727, 1.131845, -1.241322, 1, 1, 1, 1, 1,
0.1654282, 0.9107849, -0.5347254, 0, 0, 1, 1, 1,
0.1668874, -1.274877, 2.944704, 1, 0, 0, 1, 1,
0.1671497, -1.456241, 0.9183022, 1, 0, 0, 1, 1,
0.1672472, 0.1134149, 2.273964, 1, 0, 0, 1, 1,
0.1683675, -0.004603031, 1.765996, 1, 0, 0, 1, 1,
0.1705508, 0.1925498, 0.6443163, 1, 0, 0, 1, 1,
0.1719973, -0.7812161, 3.733652, 0, 0, 0, 1, 1,
0.1729051, 0.1327926, 0.7489311, 0, 0, 0, 1, 1,
0.1746298, 0.8061526, 1.164786, 0, 0, 0, 1, 1,
0.1748473, 1.416485, -0.9995068, 0, 0, 0, 1, 1,
0.186512, 0.4893481, 2.990149, 0, 0, 0, 1, 1,
0.1876094, 1.071093, 1.070441, 0, 0, 0, 1, 1,
0.193616, 1.234881, -0.2430377, 0, 0, 0, 1, 1,
0.1978236, -0.02989713, 1.816531, 1, 1, 1, 1, 1,
0.2024564, -0.7134007, 2.641087, 1, 1, 1, 1, 1,
0.2038032, -0.708254, 4.365295, 1, 1, 1, 1, 1,
0.2046142, 2.016149, -0.2971656, 1, 1, 1, 1, 1,
0.2068474, 1.759407, -0.4915943, 1, 1, 1, 1, 1,
0.213528, 0.2443106, 1.401605, 1, 1, 1, 1, 1,
0.2155431, -0.3091161, 0.9613573, 1, 1, 1, 1, 1,
0.2244899, 0.4996036, -0.09328816, 1, 1, 1, 1, 1,
0.2294115, -0.6246027, 3.109173, 1, 1, 1, 1, 1,
0.230139, 0.6170619, 1.908185, 1, 1, 1, 1, 1,
0.2346197, -0.8543578, 1.673837, 1, 1, 1, 1, 1,
0.2348935, -0.7828291, 5.824811, 1, 1, 1, 1, 1,
0.2381857, -0.3008438, 2.698766, 1, 1, 1, 1, 1,
0.238556, 0.3256791, 1.870922, 1, 1, 1, 1, 1,
0.2406155, 0.4731008, -0.5830742, 1, 1, 1, 1, 1,
0.2438286, 1.798032, -0.7401359, 0, 0, 1, 1, 1,
0.2461457, 0.7166908, -0.6371953, 1, 0, 0, 1, 1,
0.2466842, 1.044326, 1.934627, 1, 0, 0, 1, 1,
0.2480147, 1.223138, 0.3826842, 1, 0, 0, 1, 1,
0.2581593, -1.764397, 2.039325, 1, 0, 0, 1, 1,
0.2586978, 0.4658, 0.6409402, 1, 0, 0, 1, 1,
0.2600683, -0.4010546, 2.412563, 0, 0, 0, 1, 1,
0.260231, 1.124358, -0.861581, 0, 0, 0, 1, 1,
0.2651176, -0.5517604, 2.872946, 0, 0, 0, 1, 1,
0.2676487, 0.7898801, -0.5051884, 0, 0, 0, 1, 1,
0.2680609, -0.6730908, 3.187602, 0, 0, 0, 1, 1,
0.2773716, 0.7144526, 0.9539265, 0, 0, 0, 1, 1,
0.278061, 0.5545274, 0.4135005, 0, 0, 0, 1, 1,
0.2783023, 0.551109, -1.245796, 1, 1, 1, 1, 1,
0.2818953, -0.2511997, 1.848442, 1, 1, 1, 1, 1,
0.2856626, -0.05437097, 1.690595, 1, 1, 1, 1, 1,
0.2882923, 1.93356, 1.064479, 1, 1, 1, 1, 1,
0.2883407, 0.7466098, -0.4333411, 1, 1, 1, 1, 1,
0.2906582, -0.5477164, 3.622066, 1, 1, 1, 1, 1,
0.2916287, -0.8558097, 3.038073, 1, 1, 1, 1, 1,
0.2917028, 0.4417195, 0.7848988, 1, 1, 1, 1, 1,
0.2930251, 0.8740409, 1.072897, 1, 1, 1, 1, 1,
0.293048, 0.3984863, 1.675007, 1, 1, 1, 1, 1,
0.2937753, 0.3654324, -0.1043438, 1, 1, 1, 1, 1,
0.2942601, 0.03608278, 0.3792398, 1, 1, 1, 1, 1,
0.2974143, -0.02704528, 1.254917, 1, 1, 1, 1, 1,
0.2991626, 1.150334, -0.9586189, 1, 1, 1, 1, 1,
0.3022819, -0.1166184, 4.099713, 1, 1, 1, 1, 1,
0.3070303, -0.7065284, 2.704223, 0, 0, 1, 1, 1,
0.3126899, -0.3580762, 1.916458, 1, 0, 0, 1, 1,
0.3180903, 0.0602402, -0.1419394, 1, 0, 0, 1, 1,
0.3228948, -0.3126093, 1.268729, 1, 0, 0, 1, 1,
0.3272413, -1.168701, 3.369337, 1, 0, 0, 1, 1,
0.3302169, 2.339678, 0.682223, 1, 0, 0, 1, 1,
0.3335486, -1.567441, 3.113981, 0, 0, 0, 1, 1,
0.3350656, -0.9238161, 2.940786, 0, 0, 0, 1, 1,
0.3354321, 0.3406787, 1.952498, 0, 0, 0, 1, 1,
0.3398245, -1.058387, 2.857224, 0, 0, 0, 1, 1,
0.3404695, 0.2219918, 1.943782, 0, 0, 0, 1, 1,
0.3441185, 0.5785837, -0.1392493, 0, 0, 0, 1, 1,
0.3512884, 0.1802841, 1.34274, 0, 0, 0, 1, 1,
0.3518819, -0.6432498, 4.023322, 1, 1, 1, 1, 1,
0.3559954, 0.0286908, 0.6953694, 1, 1, 1, 1, 1,
0.3574599, 0.9377369, 1.223705, 1, 1, 1, 1, 1,
0.3637741, -1.570561, 1.91222, 1, 1, 1, 1, 1,
0.3640556, 0.9079886, 0.4014836, 1, 1, 1, 1, 1,
0.3647915, 1.638177, -0.1886839, 1, 1, 1, 1, 1,
0.3680258, -0.7111022, 4.797966, 1, 1, 1, 1, 1,
0.369463, -1.299846, 2.179781, 1, 1, 1, 1, 1,
0.3747728, -1.049024, 2.954921, 1, 1, 1, 1, 1,
0.3814204, -1.1132, 2.741651, 1, 1, 1, 1, 1,
0.3826682, 0.6908301, -0.6943933, 1, 1, 1, 1, 1,
0.3829879, -1.666849, 2.580028, 1, 1, 1, 1, 1,
0.3868092, -0.9307037, 2.535335, 1, 1, 1, 1, 1,
0.3876475, -0.7038496, 4.426535, 1, 1, 1, 1, 1,
0.3880795, -0.03934705, 2.071836, 1, 1, 1, 1, 1,
0.3890673, 0.2538253, 0.5584465, 0, 0, 1, 1, 1,
0.3916854, -0.7715659, 5.340335, 1, 0, 0, 1, 1,
0.3949628, -0.1263831, 2.642365, 1, 0, 0, 1, 1,
0.3978635, -1.871374, 3.322164, 1, 0, 0, 1, 1,
0.4006558, 0.5154377, -0.7208784, 1, 0, 0, 1, 1,
0.4036576, -1.32753, 2.946103, 1, 0, 0, 1, 1,
0.4046825, 0.8970541, -0.4683892, 0, 0, 0, 1, 1,
0.4063576, 1.355498, 0.05163264, 0, 0, 0, 1, 1,
0.4072431, 0.2381786, 0.7349563, 0, 0, 0, 1, 1,
0.4170638, 0.03686834, 1.571184, 0, 0, 0, 1, 1,
0.4184989, -1.019846, 3.923445, 0, 0, 0, 1, 1,
0.4235066, 0.2164253, 1.623671, 0, 0, 0, 1, 1,
0.42555, -0.3552794, 2.661686, 0, 0, 0, 1, 1,
0.4256865, 1.393893, 0.1213545, 1, 1, 1, 1, 1,
0.4298088, -1.389887, 2.389641, 1, 1, 1, 1, 1,
0.4370078, -1.308408, 2.665305, 1, 1, 1, 1, 1,
0.441556, 0.1808468, -0.7817111, 1, 1, 1, 1, 1,
0.4434464, -0.4532713, 2.23805, 1, 1, 1, 1, 1,
0.4441656, -2.282171, 2.406635, 1, 1, 1, 1, 1,
0.4497913, 0.2251027, 2.719072, 1, 1, 1, 1, 1,
0.4541209, -1.057883, 4.441642, 1, 1, 1, 1, 1,
0.4576322, -0.8194388, 5.172978, 1, 1, 1, 1, 1,
0.4576951, 0.2657451, 2.343189, 1, 1, 1, 1, 1,
0.4603093, -0.9383, 3.464487, 1, 1, 1, 1, 1,
0.4612722, -0.9582681, 2.970418, 1, 1, 1, 1, 1,
0.4623361, 0.09850639, 0.06634855, 1, 1, 1, 1, 1,
0.4652751, -1.606795, 1.287011, 1, 1, 1, 1, 1,
0.4690964, -0.5686604, 2.11078, 1, 1, 1, 1, 1,
0.4704292, 0.1981634, -1.081176, 0, 0, 1, 1, 1,
0.4758621, 0.305477, -0.3213523, 1, 0, 0, 1, 1,
0.4765521, -0.7777055, 2.921896, 1, 0, 0, 1, 1,
0.4812595, 0.689908, 1.869612, 1, 0, 0, 1, 1,
0.4842963, -1.233563, 0.5467548, 1, 0, 0, 1, 1,
0.489383, -0.7147782, 1.46288, 1, 0, 0, 1, 1,
0.491184, -0.06228253, 2.645699, 0, 0, 0, 1, 1,
0.4958405, -1.100337, 3.648818, 0, 0, 0, 1, 1,
0.4961601, 0.770366, -0.1165856, 0, 0, 0, 1, 1,
0.4992282, -0.1110973, 2.8162, 0, 0, 0, 1, 1,
0.50841, 0.3981409, 1.596257, 0, 0, 0, 1, 1,
0.5101728, -0.8214582, 1.909968, 0, 0, 0, 1, 1,
0.5109683, 0.06502388, -0.511605, 0, 0, 0, 1, 1,
0.5172927, -0.589598, 4.659907, 1, 1, 1, 1, 1,
0.5268468, 0.7914374, -0.1971489, 1, 1, 1, 1, 1,
0.5285924, 0.3377142, 0.4376756, 1, 1, 1, 1, 1,
0.5327161, 0.7383565, 0.007802318, 1, 1, 1, 1, 1,
0.5329593, 1.398636, -0.1587955, 1, 1, 1, 1, 1,
0.5333511, 0.3844335, -0.3706649, 1, 1, 1, 1, 1,
0.5345823, -0.5996615, 2.229102, 1, 1, 1, 1, 1,
0.5373451, -0.5962985, 3.511417, 1, 1, 1, 1, 1,
0.5413221, 0.3120204, 1.109289, 1, 1, 1, 1, 1,
0.543538, -0.2666465, 0.06813938, 1, 1, 1, 1, 1,
0.5436609, 0.8485875, 0.639368, 1, 1, 1, 1, 1,
0.5452555, 0.7736473, 0.7316311, 1, 1, 1, 1, 1,
0.5462773, 1.561908, -0.890464, 1, 1, 1, 1, 1,
0.547825, 1.13048, -1.22114, 1, 1, 1, 1, 1,
0.5480539, 0.7656224, 1.895488, 1, 1, 1, 1, 1,
0.5489008, -0.4955114, 3.631873, 0, 0, 1, 1, 1,
0.5501559, -0.1653859, 1.975599, 1, 0, 0, 1, 1,
0.5502333, 1.259822, 0.7463376, 1, 0, 0, 1, 1,
0.553344, 0.1231256, 2.425297, 1, 0, 0, 1, 1,
0.5535035, 2.190641, -0.3548621, 1, 0, 0, 1, 1,
0.5549757, 0.02860696, 0.4814786, 1, 0, 0, 1, 1,
0.5560761, 1.191964, 0.8977512, 0, 0, 0, 1, 1,
0.5566802, -0.2674384, 0.6261209, 0, 0, 0, 1, 1,
0.559132, 0.09799874, 2.937247, 0, 0, 0, 1, 1,
0.5626741, -0.7131299, 1.475314, 0, 0, 0, 1, 1,
0.5688229, 0.8264182, 0.4657715, 0, 0, 0, 1, 1,
0.5853165, 1.063499, -0.8962153, 0, 0, 0, 1, 1,
0.5855374, 0.2318517, 1.059543, 0, 0, 0, 1, 1,
0.5860734, -0.2928695, 2.903003, 1, 1, 1, 1, 1,
0.5866249, 0.4501365, 2.260541, 1, 1, 1, 1, 1,
0.5911089, -0.2285641, 2.420517, 1, 1, 1, 1, 1,
0.5911371, -1.324169, 2.183544, 1, 1, 1, 1, 1,
0.592624, -0.5740271, 1.76992, 1, 1, 1, 1, 1,
0.5931032, -0.6998596, 2.290649, 1, 1, 1, 1, 1,
0.593884, -2.661631, 3.186131, 1, 1, 1, 1, 1,
0.5970668, 0.4799336, 0.9358056, 1, 1, 1, 1, 1,
0.5978421, -0.568334, 2.259042, 1, 1, 1, 1, 1,
0.6016923, 1.792326, 0.1544712, 1, 1, 1, 1, 1,
0.602411, -0.1085102, 1.623547, 1, 1, 1, 1, 1,
0.6026388, -1.531631, 3.030966, 1, 1, 1, 1, 1,
0.6044835, 0.0355125, 1.690236, 1, 1, 1, 1, 1,
0.6072631, 2.064134, -0.07636389, 1, 1, 1, 1, 1,
0.6086476, 0.1491975, 2.391585, 1, 1, 1, 1, 1,
0.6091071, 1.496495, 0.5684038, 0, 0, 1, 1, 1,
0.6094973, -1.229383, 3.059801, 1, 0, 0, 1, 1,
0.6146301, 1.258277, 1.336691, 1, 0, 0, 1, 1,
0.619122, -0.3635202, 2.534093, 1, 0, 0, 1, 1,
0.6224209, -0.8381662, 2.541002, 1, 0, 0, 1, 1,
0.6277792, 1.777908, 1.391573, 1, 0, 0, 1, 1,
0.6294968, 0.6404487, 0.4903618, 0, 0, 0, 1, 1,
0.6360567, -2.35544, 4.348623, 0, 0, 0, 1, 1,
0.6375052, -0.6477559, 3.164508, 0, 0, 0, 1, 1,
0.6375684, -0.8146543, 2.48304, 0, 0, 0, 1, 1,
0.6392758, -1.731732, 2.002446, 0, 0, 0, 1, 1,
0.6400413, -0.8186511, 2.892037, 0, 0, 0, 1, 1,
0.6405267, -0.9697175, 3.263209, 0, 0, 0, 1, 1,
0.6408297, -1.329176, 1.727069, 1, 1, 1, 1, 1,
0.6461586, -0.21928, 0.5030573, 1, 1, 1, 1, 1,
0.6473354, 1.20063, 0.0030085, 1, 1, 1, 1, 1,
0.6511476, -0.7871054, 2.586295, 1, 1, 1, 1, 1,
0.6516445, 1.178186, 0.01054996, 1, 1, 1, 1, 1,
0.6534289, -1.319603, 3.496652, 1, 1, 1, 1, 1,
0.6555678, -1.447028, 4.036712, 1, 1, 1, 1, 1,
0.6565429, 0.9035645, 0.3290401, 1, 1, 1, 1, 1,
0.6632375, 1.496317, -1.239725, 1, 1, 1, 1, 1,
0.6684768, 0.7950619, -0.5879715, 1, 1, 1, 1, 1,
0.6711916, -0.06420737, -0.1582588, 1, 1, 1, 1, 1,
0.6747853, 0.3052532, 2.688714, 1, 1, 1, 1, 1,
0.6751788, 1.230513, 0.1295286, 1, 1, 1, 1, 1,
0.6753184, 1.4814, 0.4185186, 1, 1, 1, 1, 1,
0.676026, 0.8750938, 0.2651342, 1, 1, 1, 1, 1,
0.677899, 1.308898, 1.426647, 0, 0, 1, 1, 1,
0.6807362, 0.5020745, 0.2634469, 1, 0, 0, 1, 1,
0.6817744, -1.249509, 2.517591, 1, 0, 0, 1, 1,
0.6847792, 0.8693835, 1.248831, 1, 0, 0, 1, 1,
0.6921695, -0.8939034, 3.071852, 1, 0, 0, 1, 1,
0.6980225, 0.06960906, 0.6793855, 1, 0, 0, 1, 1,
0.7004563, 0.9760967, -0.5101852, 0, 0, 0, 1, 1,
0.7048934, 0.9128001, 0.5847273, 0, 0, 0, 1, 1,
0.7145107, -1.408766, 3.355205, 0, 0, 0, 1, 1,
0.7148741, -0.7420066, 2.155205, 0, 0, 0, 1, 1,
0.7151123, -2.491009, 5.09351, 0, 0, 0, 1, 1,
0.7159085, 1.246593, 0.5676682, 0, 0, 0, 1, 1,
0.7348605, -1.14466, 3.436108, 0, 0, 0, 1, 1,
0.7350104, -2.824049, 4.212723, 1, 1, 1, 1, 1,
0.735825, -0.8624728, 3.301527, 1, 1, 1, 1, 1,
0.7362268, 1.67684, 1.11659, 1, 1, 1, 1, 1,
0.7410833, -0.221459, 1.690566, 1, 1, 1, 1, 1,
0.7421856, 1.223424, 0.6735249, 1, 1, 1, 1, 1,
0.7437271, -0.6949158, 1.203166, 1, 1, 1, 1, 1,
0.7443804, -0.9543273, 1.676679, 1, 1, 1, 1, 1,
0.7449509, -0.7473818, 1.144567, 1, 1, 1, 1, 1,
0.7521295, -0.5247347, 2.035971, 1, 1, 1, 1, 1,
0.7529841, 0.1597508, 1.550353, 1, 1, 1, 1, 1,
0.7545339, 1.442349, -0.7403473, 1, 1, 1, 1, 1,
0.763026, 0.7664344, 2.497521, 1, 1, 1, 1, 1,
0.7641609, 1.42324, 0.5407822, 1, 1, 1, 1, 1,
0.7647955, 0.4911978, 3.604089, 1, 1, 1, 1, 1,
0.7656044, 0.3826424, 0.9223276, 1, 1, 1, 1, 1,
0.7730553, 0.3504423, 0.3284902, 0, 0, 1, 1, 1,
0.7745467, -0.7133553, 3.116729, 1, 0, 0, 1, 1,
0.7754443, 0.1874592, 2.431948, 1, 0, 0, 1, 1,
0.7774065, -0.3086448, 1.884542, 1, 0, 0, 1, 1,
0.7797803, -0.6081258, 2.512213, 1, 0, 0, 1, 1,
0.7811394, 0.0982572, 1.085917, 1, 0, 0, 1, 1,
0.7843325, 0.4147904, 0.2575462, 0, 0, 0, 1, 1,
0.7933804, 0.1614169, 1.752623, 0, 0, 0, 1, 1,
0.7955884, -0.5919672, 3.258811, 0, 0, 0, 1, 1,
0.7961374, 0.4129476, 0.7522337, 0, 0, 0, 1, 1,
0.7985622, -0.6125287, 0.6963164, 0, 0, 0, 1, 1,
0.7986992, 0.7255583, 0.3733302, 0, 0, 0, 1, 1,
0.800179, -0.6891946, 2.722832, 0, 0, 0, 1, 1,
0.804344, -0.09754299, 3.010898, 1, 1, 1, 1, 1,
0.8051784, -0.760034, 1.165027, 1, 1, 1, 1, 1,
0.8086306, -0.5124292, 1.600035, 1, 1, 1, 1, 1,
0.8161744, -0.7070065, 0.9100278, 1, 1, 1, 1, 1,
0.8235798, -0.1395415, 0.7881455, 1, 1, 1, 1, 1,
0.827548, 1.143205, 0.4852161, 1, 1, 1, 1, 1,
0.8285382, -0.6485633, 1.343297, 1, 1, 1, 1, 1,
0.8293229, 0.7355298, 1.463553, 1, 1, 1, 1, 1,
0.8306766, -1.026959, 2.482552, 1, 1, 1, 1, 1,
0.8331424, 0.8153222, 1.22273, 1, 1, 1, 1, 1,
0.8351066, 0.4864357, 0.9494534, 1, 1, 1, 1, 1,
0.8389508, 0.5188679, 0.9901331, 1, 1, 1, 1, 1,
0.8392627, 0.9387739, 0.06158264, 1, 1, 1, 1, 1,
0.8407421, 1.33029, 0.6350674, 1, 1, 1, 1, 1,
0.8413593, 1.833271, 0.352109, 1, 1, 1, 1, 1,
0.849329, 0.05212687, 1.406801, 0, 0, 1, 1, 1,
0.8618398, -2.37712, 3.379986, 1, 0, 0, 1, 1,
0.8632661, 0.09211875, 1.837284, 1, 0, 0, 1, 1,
0.8699438, -0.06004592, 2.09991, 1, 0, 0, 1, 1,
0.871527, -0.8528472, 3.815243, 1, 0, 0, 1, 1,
0.8740568, -1.002658, 4.145004, 1, 0, 0, 1, 1,
0.8765329, -1.37863, 2.347681, 0, 0, 0, 1, 1,
0.8803642, 0.7441558, 1.491561, 0, 0, 0, 1, 1,
0.8910372, -0.4721374, 4.113084, 0, 0, 0, 1, 1,
0.8916221, 0.1656653, 1.06628, 0, 0, 0, 1, 1,
0.8955579, 0.956441, 0.1826218, 0, 0, 0, 1, 1,
0.8971907, 0.9300234, 0.2348866, 0, 0, 0, 1, 1,
0.8975722, -1.872237, 1.929857, 0, 0, 0, 1, 1,
0.9071798, 0.9238011, 1.42086, 1, 1, 1, 1, 1,
0.9082841, -1.514928, 3.291271, 1, 1, 1, 1, 1,
0.9157328, -0.4022988, 1.910321, 1, 1, 1, 1, 1,
0.9175594, -1.750398, 3.241126, 1, 1, 1, 1, 1,
0.9214037, 2.234559, 0.7175519, 1, 1, 1, 1, 1,
0.9267989, 0.7120966, 2.889379, 1, 1, 1, 1, 1,
0.9273291, -1.124637, 1.549064, 1, 1, 1, 1, 1,
0.9278392, -0.286433, 2.187989, 1, 1, 1, 1, 1,
0.9327469, -0.02755365, 2.070074, 1, 1, 1, 1, 1,
0.933857, 0.8544654, -0.1444119, 1, 1, 1, 1, 1,
0.9348042, -0.335117, 3.288802, 1, 1, 1, 1, 1,
0.9351013, 0.5786626, 0.1694868, 1, 1, 1, 1, 1,
0.9361877, -0.7043593, 0.7374383, 1, 1, 1, 1, 1,
0.9376726, -0.4271386, 2.018289, 1, 1, 1, 1, 1,
0.9407501, 1.20103, 0.5421988, 1, 1, 1, 1, 1,
0.9450024, -0.8989688, 1.831475, 0, 0, 1, 1, 1,
0.9503606, -0.2146086, -0.02008944, 1, 0, 0, 1, 1,
0.9584034, 0.8782547, -1.060323, 1, 0, 0, 1, 1,
0.9633136, 0.2476453, 0.8153418, 1, 0, 0, 1, 1,
0.9671998, 1.119911, -0.6339256, 1, 0, 0, 1, 1,
0.9810623, -0.3559983, 2.349575, 1, 0, 0, 1, 1,
0.9855, -0.1165856, 2.681038, 0, 0, 0, 1, 1,
0.9882486, 1.298452, 0.7974259, 0, 0, 0, 1, 1,
0.9936709, 0.5840229, -0.3267237, 0, 0, 0, 1, 1,
1.00065, -0.974424, 3.021194, 0, 0, 0, 1, 1,
1.006321, 0.05765259, -1.148746, 0, 0, 0, 1, 1,
1.008884, 0.3483405, 0.8570811, 0, 0, 0, 1, 1,
1.013265, 0.1579855, 1.472144, 0, 0, 0, 1, 1,
1.016147, -0.4837221, 0.7766933, 1, 1, 1, 1, 1,
1.043044, -0.2954001, 2.859874, 1, 1, 1, 1, 1,
1.061624, 0.8617324, 0.2302012, 1, 1, 1, 1, 1,
1.062417, -0.4646425, 3.114209, 1, 1, 1, 1, 1,
1.064472, -0.4658121, 2.448652, 1, 1, 1, 1, 1,
1.064975, 1.40345, 0.496738, 1, 1, 1, 1, 1,
1.073115, -1.212386, 2.941385, 1, 1, 1, 1, 1,
1.079963, -1.607129, 1.54044, 1, 1, 1, 1, 1,
1.081493, -0.08919238, 0.4534161, 1, 1, 1, 1, 1,
1.083517, -1.158179, 1.559689, 1, 1, 1, 1, 1,
1.092062, 0.8982983, 0.04153623, 1, 1, 1, 1, 1,
1.094439, 0.4198691, 1.3625, 1, 1, 1, 1, 1,
1.097713, -0.7071303, 2.544042, 1, 1, 1, 1, 1,
1.098835, 2.016215, -1.355974, 1, 1, 1, 1, 1,
1.101203, 0.8471616, 0.4426619, 1, 1, 1, 1, 1,
1.101796, 1.142602, 0.8410593, 0, 0, 1, 1, 1,
1.104154, 0.2901122, 1.104463, 1, 0, 0, 1, 1,
1.111798, 0.7763284, 0.932461, 1, 0, 0, 1, 1,
1.12807, 1.113428, 0.7085392, 1, 0, 0, 1, 1,
1.138735, 0.02640249, 1.060595, 1, 0, 0, 1, 1,
1.146657, 0.3666113, 2.060725, 1, 0, 0, 1, 1,
1.157158, -0.2675864, 0.8926082, 0, 0, 0, 1, 1,
1.170713, 0.2745102, 1.951885, 0, 0, 0, 1, 1,
1.174146, 0.1426533, 0.9479018, 0, 0, 0, 1, 1,
1.175217, 2.109214, 2.468894, 0, 0, 0, 1, 1,
1.175481, -2.091841, 3.494525, 0, 0, 0, 1, 1,
1.180517, 0.5657987, 0.5584999, 0, 0, 0, 1, 1,
1.181597, -0.8542659, 2.848008, 0, 0, 0, 1, 1,
1.184054, 0.1102654, 1.664878, 1, 1, 1, 1, 1,
1.193125, 0.05051547, 1.496898, 1, 1, 1, 1, 1,
1.197743, 0.7144901, 0.6909472, 1, 1, 1, 1, 1,
1.206161, -0.1679696, 1.336835, 1, 1, 1, 1, 1,
1.207715, -0.212724, 2.66763, 1, 1, 1, 1, 1,
1.212303, 0.1501633, 3.26478, 1, 1, 1, 1, 1,
1.219993, 0.7844677, 1.766503, 1, 1, 1, 1, 1,
1.228905, 0.2041245, 2.941208, 1, 1, 1, 1, 1,
1.229925, -1.780363, 2.429583, 1, 1, 1, 1, 1,
1.232172, -0.04170829, 0.5184944, 1, 1, 1, 1, 1,
1.235322, -0.4276808, 0.98009, 1, 1, 1, 1, 1,
1.240932, -1.895024, 1.46768, 1, 1, 1, 1, 1,
1.258759, -0.2286533, 1.601765, 1, 1, 1, 1, 1,
1.260305, 0.08934494, 2.590577, 1, 1, 1, 1, 1,
1.264002, -1.009942, 1.169443, 1, 1, 1, 1, 1,
1.271312, 2.025836, 1.288048, 0, 0, 1, 1, 1,
1.275829, 0.4717568, 1.700926, 1, 0, 0, 1, 1,
1.280328, 0.4650103, 1.449577, 1, 0, 0, 1, 1,
1.28772, 0.04574795, 3.201112, 1, 0, 0, 1, 1,
1.306584, -0.5326794, 0.5756396, 1, 0, 0, 1, 1,
1.316193, -0.208125, 0.4865759, 1, 0, 0, 1, 1,
1.317141, -0.3822734, 2.202229, 0, 0, 0, 1, 1,
1.323496, 0.1243147, 0.4078808, 0, 0, 0, 1, 1,
1.327489, 0.03076617, 0.2662763, 0, 0, 0, 1, 1,
1.338554, -1.042751, 2.736216, 0, 0, 0, 1, 1,
1.339751, -0.4626006, 2.925535, 0, 0, 0, 1, 1,
1.347205, -1.040956, 3.293181, 0, 0, 0, 1, 1,
1.347606, 0.493361, 2.578339, 0, 0, 0, 1, 1,
1.349266, 1.075165, 0.7694603, 1, 1, 1, 1, 1,
1.358232, -0.258069, 0.4141723, 1, 1, 1, 1, 1,
1.358614, -1.138488, 4.091767, 1, 1, 1, 1, 1,
1.365273, 0.293662, -0.1626249, 1, 1, 1, 1, 1,
1.396555, 1.423933, 0.8451087, 1, 1, 1, 1, 1,
1.397216, 1.355999, 0.8395334, 1, 1, 1, 1, 1,
1.413849, -1.005783, 2.620914, 1, 1, 1, 1, 1,
1.419093, 0.0548899, 1.783697, 1, 1, 1, 1, 1,
1.419842, -1.181859, 2.894522, 1, 1, 1, 1, 1,
1.419897, -1.410658, 2.331591, 1, 1, 1, 1, 1,
1.435762, 0.2511396, 2.890719, 1, 1, 1, 1, 1,
1.448374, -1.281986, 2.044017, 1, 1, 1, 1, 1,
1.457754, 0.596895, 0.5582445, 1, 1, 1, 1, 1,
1.457883, 1.24848, -0.5240483, 1, 1, 1, 1, 1,
1.459463, 0.2811689, 1.017375, 1, 1, 1, 1, 1,
1.461031, 0.4733011, 1.688421, 0, 0, 1, 1, 1,
1.475472, 0.3031064, 1.48546, 1, 0, 0, 1, 1,
1.482644, -1.216305, 0.6172709, 1, 0, 0, 1, 1,
1.488603, -1.406682, 0.8915923, 1, 0, 0, 1, 1,
1.492838, 0.7698984, 0.7305986, 1, 0, 0, 1, 1,
1.502858, -0.1299062, 1.640148, 1, 0, 0, 1, 1,
1.507265, -0.96845, 2.994441, 0, 0, 0, 1, 1,
1.528435, 0.9142532, 1.574423, 0, 0, 0, 1, 1,
1.545581, 0.2555403, -0.1315012, 0, 0, 0, 1, 1,
1.549219, 0.6684852, 0.7471448, 0, 0, 0, 1, 1,
1.552283, 0.2067225, 2.161509, 0, 0, 0, 1, 1,
1.57646, -1.036619, 1.595861, 0, 0, 0, 1, 1,
1.587405, -0.7011401, 2.754122, 0, 0, 0, 1, 1,
1.587745, -1.386034, 2.149444, 1, 1, 1, 1, 1,
1.591118, -1.527146, 4.153162, 1, 1, 1, 1, 1,
1.607127, 0.7814938, 0.8006973, 1, 1, 1, 1, 1,
1.624642, -1.330944, 1.354539, 1, 1, 1, 1, 1,
1.637368, -0.1579924, 2.438922, 1, 1, 1, 1, 1,
1.640482, 0.7220794, 1.284882, 1, 1, 1, 1, 1,
1.648107, -2.606703, 1.196209, 1, 1, 1, 1, 1,
1.648214, -0.3961486, 3.227224, 1, 1, 1, 1, 1,
1.660201, 0.1807783, 1.732695, 1, 1, 1, 1, 1,
1.66723, -1.633283, 2.433097, 1, 1, 1, 1, 1,
1.667516, -1.769137, 2.352407, 1, 1, 1, 1, 1,
1.695817, -1.285918, 1.024404, 1, 1, 1, 1, 1,
1.695951, -0.363861, 2.211629, 1, 1, 1, 1, 1,
1.706344, -1.36681, 3.681178, 1, 1, 1, 1, 1,
1.721564, -0.8518437, 1.550378, 1, 1, 1, 1, 1,
1.724703, -0.8962437, 2.602516, 0, 0, 1, 1, 1,
1.728901, 0.6176922, 1.187088, 1, 0, 0, 1, 1,
1.743039, -0.2257528, 2.3957, 1, 0, 0, 1, 1,
1.75081, -0.4813867, 2.544136, 1, 0, 0, 1, 1,
1.752193, -0.2269179, 1.54256, 1, 0, 0, 1, 1,
1.756955, 1.839664, -0.2109039, 1, 0, 0, 1, 1,
1.769696, 1.794986, 2.235033, 0, 0, 0, 1, 1,
1.781519, 0.03906442, 1.397435, 0, 0, 0, 1, 1,
1.789839, 0.7872192, 0.7589693, 0, 0, 0, 1, 1,
1.791148, 1.862546, 1.602533, 0, 0, 0, 1, 1,
1.82899, 0.8684549, -0.7354044, 0, 0, 0, 1, 1,
1.842753, -0.2457965, 1.991301, 0, 0, 0, 1, 1,
1.853889, -0.7991548, 1.638169, 0, 0, 0, 1, 1,
1.857412, -1.511745, 2.264125, 1, 1, 1, 1, 1,
1.868181, -0.01692486, 1.528735, 1, 1, 1, 1, 1,
1.895756, 0.4248018, 1.136795, 1, 1, 1, 1, 1,
1.899795, -0.215434, 1.59991, 1, 1, 1, 1, 1,
1.907349, -1.153287, -0.01832334, 1, 1, 1, 1, 1,
1.907425, -1.625026, 2.038866, 1, 1, 1, 1, 1,
1.925196, -0.1846217, 2.245903, 1, 1, 1, 1, 1,
1.925504, -0.3258536, 3.153197, 1, 1, 1, 1, 1,
1.932271, -0.0659614, 2.14684, 1, 1, 1, 1, 1,
1.944169, 0.6813814, 2.582656, 1, 1, 1, 1, 1,
1.952327, 0.02632568, 1.39409, 1, 1, 1, 1, 1,
1.953372, -1.449543, 0.2599314, 1, 1, 1, 1, 1,
1.956278, -0.03512938, 1.596832, 1, 1, 1, 1, 1,
1.960358, -0.6463181, 2.110292, 1, 1, 1, 1, 1,
1.969114, -1.191352, 3.285287, 1, 1, 1, 1, 1,
1.980598, 0.4920057, 0.04574481, 0, 0, 1, 1, 1,
1.981047, -1.162967, 0.4034119, 1, 0, 0, 1, 1,
1.993085, -0.1554974, 0.817254, 1, 0, 0, 1, 1,
2.001259, -0.3490688, 1.43933, 1, 0, 0, 1, 1,
2.006542, -0.3371333, 3.568998, 1, 0, 0, 1, 1,
2.023413, -0.2543131, 1.248705, 1, 0, 0, 1, 1,
2.05144, 1.132858, 0.8764763, 0, 0, 0, 1, 1,
2.057136, 0.5599743, 1.629112, 0, 0, 0, 1, 1,
2.093795, -0.6635491, 2.30539, 0, 0, 0, 1, 1,
2.1344, 1.194762, 2.340066, 0, 0, 0, 1, 1,
2.211129, 0.2607831, 0.8800567, 0, 0, 0, 1, 1,
2.211639, -0.6026484, 0.6005877, 0, 0, 0, 1, 1,
2.235057, 1.058596, 2.169822, 0, 0, 0, 1, 1,
2.276078, 1.648511, 2.293676, 1, 1, 1, 1, 1,
2.447081, -0.9844361, 2.777777, 1, 1, 1, 1, 1,
2.539378, 0.3557245, 2.307664, 1, 1, 1, 1, 1,
2.61602, 1.321838, 0.8643689, 1, 1, 1, 1, 1,
2.636885, 0.250733, -0.7530905, 1, 1, 1, 1, 1,
2.716025, -2.030681, 1.987545, 1, 1, 1, 1, 1,
2.878582, -0.2659974, 0.50324, 1, 1, 1, 1, 1
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
var radius = 9.78022;
var distance = 34.35261;
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
mvMatrix.translate( 0.382441, 0.007868052, -0.05374432 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35261);
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
