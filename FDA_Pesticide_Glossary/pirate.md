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
-3.287539, 1.492335, -0.1658186, 1, 0, 0, 1,
-2.888697, -0.1944587, -0.1477671, 1, 0.007843138, 0, 1,
-2.857251, 1.460212, -0.3211015, 1, 0.01176471, 0, 1,
-2.679767, 0.172058, -0.1917189, 1, 0.01960784, 0, 1,
-2.560033, 2.647319, -0.8761007, 1, 0.02352941, 0, 1,
-2.511212, 0.6282988, -0.1524861, 1, 0.03137255, 0, 1,
-2.50825, 0.8323752, -1.83791, 1, 0.03529412, 0, 1,
-2.461089, -2.734969, -1.884407, 1, 0.04313726, 0, 1,
-2.458644, -1.225458, -1.718118, 1, 0.04705882, 0, 1,
-2.364268, 0.5185683, -1.62492, 1, 0.05490196, 0, 1,
-2.361746, -1.057257, -2.491806, 1, 0.05882353, 0, 1,
-2.359901, -1.21199, 0.2069266, 1, 0.06666667, 0, 1,
-2.345999, 0.9073912, 1.102678, 1, 0.07058824, 0, 1,
-2.335339, -1.01783, -2.794505, 1, 0.07843138, 0, 1,
-2.275208, 0.1672852, -1.944802, 1, 0.08235294, 0, 1,
-2.259585, 0.5981799, 0.2906862, 1, 0.09019608, 0, 1,
-2.227467, 0.8793706, -1.129191, 1, 0.09411765, 0, 1,
-2.221934, -0.3613032, -3.556862, 1, 0.1019608, 0, 1,
-2.219462, -0.3645384, -0.4569484, 1, 0.1098039, 0, 1,
-2.219073, 0.9441034, -2.600034, 1, 0.1137255, 0, 1,
-2.178473, -0.1307476, -4.068107, 1, 0.1215686, 0, 1,
-2.146253, -1.554274, -2.592668, 1, 0.1254902, 0, 1,
-2.142779, 0.1176227, -0.7370709, 1, 0.1333333, 0, 1,
-2.136599, -0.8916952, -2.218626, 1, 0.1372549, 0, 1,
-2.047096, 0.8985472, -1.31412, 1, 0.145098, 0, 1,
-2.027088, -0.234215, -1.53281, 1, 0.1490196, 0, 1,
-2.010183, 0.001840219, -2.072652, 1, 0.1568628, 0, 1,
-1.995726, 1.07515, -0.2049685, 1, 0.1607843, 0, 1,
-1.989264, -1.207092, -1.924239, 1, 0.1686275, 0, 1,
-1.960041, -1.695131, -3.999109, 1, 0.172549, 0, 1,
-1.941162, 1.223408, -0.9966817, 1, 0.1803922, 0, 1,
-1.90706, -0.1258088, -2.66301, 1, 0.1843137, 0, 1,
-1.894119, 0.6238121, -1.28567, 1, 0.1921569, 0, 1,
-1.890591, 1.306643, 0.4829721, 1, 0.1960784, 0, 1,
-1.876356, -1.466928, -3.011123, 1, 0.2039216, 0, 1,
-1.864539, 1.234922, -3.029223, 1, 0.2117647, 0, 1,
-1.859185, -0.8368858, -1.7835, 1, 0.2156863, 0, 1,
-1.85561, 0.0426544, -1.343183, 1, 0.2235294, 0, 1,
-1.823101, 1.888039, -0.5920146, 1, 0.227451, 0, 1,
-1.818412, 0.7758166, -0.7167777, 1, 0.2352941, 0, 1,
-1.811794, -1.006935, -3.384211, 1, 0.2392157, 0, 1,
-1.795322, -0.6702591, -2.804011, 1, 0.2470588, 0, 1,
-1.775818, -1.801181, -1.646647, 1, 0.2509804, 0, 1,
-1.769427, -0.004158683, -2.347343, 1, 0.2588235, 0, 1,
-1.769369, -1.133675, -2.320172, 1, 0.2627451, 0, 1,
-1.751611, 0.5340085, -0.9625863, 1, 0.2705882, 0, 1,
-1.741951, -1.826449, -0.5418339, 1, 0.2745098, 0, 1,
-1.721416, 0.3634148, -0.1515785, 1, 0.282353, 0, 1,
-1.719556, 1.062933, -0.3584614, 1, 0.2862745, 0, 1,
-1.715616, -0.3621755, -1.706609, 1, 0.2941177, 0, 1,
-1.700906, -0.4235512, -2.436017, 1, 0.3019608, 0, 1,
-1.699717, -0.05929731, -2.188576, 1, 0.3058824, 0, 1,
-1.694144, 0.8368098, -0.3416575, 1, 0.3137255, 0, 1,
-1.68047, -0.438032, -2.039949, 1, 0.3176471, 0, 1,
-1.666718, 0.5392683, -0.9427276, 1, 0.3254902, 0, 1,
-1.640014, 0.5236478, -1.148921, 1, 0.3294118, 0, 1,
-1.616532, 1.715855, -0.4755127, 1, 0.3372549, 0, 1,
-1.614366, 0.6857893, -1.254258, 1, 0.3411765, 0, 1,
-1.61045, -0.4785789, -1.953788, 1, 0.3490196, 0, 1,
-1.607159, 2.038831, -0.5974514, 1, 0.3529412, 0, 1,
-1.603478, -0.9236329, -3.002303, 1, 0.3607843, 0, 1,
-1.599367, -0.9060317, -1.59041, 1, 0.3647059, 0, 1,
-1.586105, 0.4814117, -1.575186, 1, 0.372549, 0, 1,
-1.579742, -0.9314898, -2.240869, 1, 0.3764706, 0, 1,
-1.571072, -1.32125, -2.308335, 1, 0.3843137, 0, 1,
-1.570326, 1.074476, -1.019928, 1, 0.3882353, 0, 1,
-1.562355, 1.697747, -2.304791, 1, 0.3960784, 0, 1,
-1.557264, -0.9215835, -1.542272, 1, 0.4039216, 0, 1,
-1.553776, -0.5178666, -2.294038, 1, 0.4078431, 0, 1,
-1.542744, -0.9837832, -2.469437, 1, 0.4156863, 0, 1,
-1.526823, -1.135403, -0.4360411, 1, 0.4196078, 0, 1,
-1.525963, -0.5440077, -2.110885, 1, 0.427451, 0, 1,
-1.525929, -1.612615, -2.728489, 1, 0.4313726, 0, 1,
-1.509543, 2.278131, 0.1721834, 1, 0.4392157, 0, 1,
-1.503248, -0.5466312, -3.083314, 1, 0.4431373, 0, 1,
-1.497646, 0.5272827, -2.970123, 1, 0.4509804, 0, 1,
-1.491657, 0.7961711, -1.131687, 1, 0.454902, 0, 1,
-1.464764, -0.4870492, -1.23265, 1, 0.4627451, 0, 1,
-1.462933, 1.471811, -1.119923, 1, 0.4666667, 0, 1,
-1.460947, 0.009814478, -1.502253, 1, 0.4745098, 0, 1,
-1.459343, -0.3122402, -2.119758, 1, 0.4784314, 0, 1,
-1.443105, 0.5956963, -1.464963, 1, 0.4862745, 0, 1,
-1.440282, -0.1436061, -2.56078, 1, 0.4901961, 0, 1,
-1.440233, 0.5354748, 0.2202318, 1, 0.4980392, 0, 1,
-1.437928, -0.121062, -0.7908215, 1, 0.5058824, 0, 1,
-1.434932, -1.677292, -2.091249, 1, 0.509804, 0, 1,
-1.433843, -0.4406698, -1.615187, 1, 0.5176471, 0, 1,
-1.421998, -0.83977, -2.981024, 1, 0.5215687, 0, 1,
-1.409531, -0.8269711, 0.461601, 1, 0.5294118, 0, 1,
-1.398822, 0.1124193, 0.4548367, 1, 0.5333334, 0, 1,
-1.397387, 0.5747941, -2.013452, 1, 0.5411765, 0, 1,
-1.393509, -2.255266, -3.216288, 1, 0.5450981, 0, 1,
-1.37918, 0.03820354, -1.720507, 1, 0.5529412, 0, 1,
-1.372236, 1.48901, -0.4526916, 1, 0.5568628, 0, 1,
-1.371947, 0.8881696, -2.365493, 1, 0.5647059, 0, 1,
-1.339325, 0.3980901, -0.2551415, 1, 0.5686275, 0, 1,
-1.335309, 0.2868583, -1.074652, 1, 0.5764706, 0, 1,
-1.32293, -0.3434163, -1.841033, 1, 0.5803922, 0, 1,
-1.314542, -1.558257, -2.252828, 1, 0.5882353, 0, 1,
-1.313343, -2.715682, -3.24157, 1, 0.5921569, 0, 1,
-1.310853, 1.42116, -0.4004912, 1, 0.6, 0, 1,
-1.309577, -0.2141625, -1.328043, 1, 0.6078432, 0, 1,
-1.304611, -1.077993, -3.83367, 1, 0.6117647, 0, 1,
-1.299885, -0.2503642, -1.832748, 1, 0.6196079, 0, 1,
-1.297416, 0.955362, 0.1867902, 1, 0.6235294, 0, 1,
-1.295776, 1.555888, -2.182587, 1, 0.6313726, 0, 1,
-1.285677, 0.2581853, -0.6140941, 1, 0.6352941, 0, 1,
-1.285051, 0.7933833, 0.07394867, 1, 0.6431373, 0, 1,
-1.280535, 0.8330515, -0.5454019, 1, 0.6470588, 0, 1,
-1.277319, 2.07816, -1.978426, 1, 0.654902, 0, 1,
-1.265795, 0.6623507, -0.6807517, 1, 0.6588235, 0, 1,
-1.265384, 2.07243, -1.663976, 1, 0.6666667, 0, 1,
-1.257172, -0.8886368, -2.372789, 1, 0.6705883, 0, 1,
-1.239923, 1.264975, -1.486551, 1, 0.6784314, 0, 1,
-1.236926, -1.349503, -3.22119, 1, 0.682353, 0, 1,
-1.236728, -0.04060764, -0.6003946, 1, 0.6901961, 0, 1,
-1.233646, -1.580771, -1.629922, 1, 0.6941177, 0, 1,
-1.220558, 1.016065, -0.6961166, 1, 0.7019608, 0, 1,
-1.217252, 1.628766, -0.9189638, 1, 0.7098039, 0, 1,
-1.217214, 1.648921, -0.7823095, 1, 0.7137255, 0, 1,
-1.217074, -0.8587039, -0.6257494, 1, 0.7215686, 0, 1,
-1.215127, -1.425187, -2.173383, 1, 0.7254902, 0, 1,
-1.190345, -0.9290389, -3.114285, 1, 0.7333333, 0, 1,
-1.179766, -0.04557004, -1.579121, 1, 0.7372549, 0, 1,
-1.178849, -1.653774, -1.781542, 1, 0.7450981, 0, 1,
-1.168998, 0.6647113, -1.852397, 1, 0.7490196, 0, 1,
-1.160812, -2.026811, -1.478384, 1, 0.7568628, 0, 1,
-1.15834, -0.7736447, -3.569164, 1, 0.7607843, 0, 1,
-1.157228, 0.5257694, -1.811779, 1, 0.7686275, 0, 1,
-1.156455, -0.7888638, -1.847405, 1, 0.772549, 0, 1,
-1.153272, 0.3053016, -1.251039, 1, 0.7803922, 0, 1,
-1.146426, 0.8221112, -0.4427769, 1, 0.7843137, 0, 1,
-1.130132, -1.03778, -3.174322, 1, 0.7921569, 0, 1,
-1.130049, 0.8363367, -2.249105, 1, 0.7960784, 0, 1,
-1.130026, 0.6992036, -1.459217, 1, 0.8039216, 0, 1,
-1.128783, 1.722975, -0.9644548, 1, 0.8117647, 0, 1,
-1.114444, 0.05344772, -1.542925, 1, 0.8156863, 0, 1,
-1.111956, 0.0458701, -4.545351, 1, 0.8235294, 0, 1,
-1.10197, 2.203934, -1.027048, 1, 0.827451, 0, 1,
-1.101321, -1.486194, -3.817118, 1, 0.8352941, 0, 1,
-1.09859, -1.220711, -0.7101752, 1, 0.8392157, 0, 1,
-1.098302, -0.5388362, -3.049838, 1, 0.8470588, 0, 1,
-1.097746, 0.7837026, -1.714899, 1, 0.8509804, 0, 1,
-1.096828, -0.3160822, -2.568828, 1, 0.8588235, 0, 1,
-1.091221, -0.5168971, -1.54752, 1, 0.8627451, 0, 1,
-1.09028, -1.786546, -2.302703, 1, 0.8705882, 0, 1,
-1.080425, 0.8236028, -1.03241, 1, 0.8745098, 0, 1,
-1.076583, -0.459514, -1.527128, 1, 0.8823529, 0, 1,
-1.076494, 0.7751001, -0.6621496, 1, 0.8862745, 0, 1,
-1.066368, -0.9833418, -1.626474, 1, 0.8941177, 0, 1,
-1.065452, 0.2119707, -0.8604145, 1, 0.8980392, 0, 1,
-1.064268, 2.352584, -0.02558298, 1, 0.9058824, 0, 1,
-1.047613, -0.1596688, -0.3106213, 1, 0.9137255, 0, 1,
-1.046731, -0.3345132, -2.064367, 1, 0.9176471, 0, 1,
-1.041234, -0.9080921, 0.01743839, 1, 0.9254902, 0, 1,
-1.040843, -0.5974823, -2.035753, 1, 0.9294118, 0, 1,
-1.038018, -0.1129014, -3.385559, 1, 0.9372549, 0, 1,
-1.033668, 1.233149, -0.6085599, 1, 0.9411765, 0, 1,
-1.033515, 0.9531673, -1.479952, 1, 0.9490196, 0, 1,
-1.022759, 0.1367305, -1.679346, 1, 0.9529412, 0, 1,
-1.019881, 1.644015, -1.483492, 1, 0.9607843, 0, 1,
-1.019091, -0.732242, -2.377735, 1, 0.9647059, 0, 1,
-1.006707, 0.3100208, -2.012031, 1, 0.972549, 0, 1,
-1.006461, 0.2866085, -2.400339, 1, 0.9764706, 0, 1,
-1.003861, -0.4195447, -1.740511, 1, 0.9843137, 0, 1,
-1.002501, 0.9111058, 0.1354965, 1, 0.9882353, 0, 1,
-0.9913421, -0.6518778, -2.416379, 1, 0.9960784, 0, 1,
-0.9838749, -0.3489208, -2.075932, 0.9960784, 1, 0, 1,
-0.9698297, 0.4485941, -1.719348, 0.9921569, 1, 0, 1,
-0.9657028, 0.8426264, -1.461315, 0.9843137, 1, 0, 1,
-0.96504, 2.355869, -0.9446484, 0.9803922, 1, 0, 1,
-0.9645115, -0.5345116, -3.287987, 0.972549, 1, 0, 1,
-0.9628025, -0.2290939, -2.149754, 0.9686275, 1, 0, 1,
-0.9613369, 1.012769, 0.0605999, 0.9607843, 1, 0, 1,
-0.958917, 0.3914417, -1.970027, 0.9568627, 1, 0, 1,
-0.9504674, -1.0677, -1.472644, 0.9490196, 1, 0, 1,
-0.9360328, 0.9822311, -1.575273, 0.945098, 1, 0, 1,
-0.93353, 0.65658, -3.337354, 0.9372549, 1, 0, 1,
-0.9334086, -0.2966308, -1.01501, 0.9333333, 1, 0, 1,
-0.9289465, 1.408072, -1.623211, 0.9254902, 1, 0, 1,
-0.9247017, -0.7771643, -3.475014, 0.9215686, 1, 0, 1,
-0.9229994, 1.818559, -0.4990603, 0.9137255, 1, 0, 1,
-0.913214, -0.70576, -3.497194, 0.9098039, 1, 0, 1,
-0.9098625, 0.9373529, -2.517003, 0.9019608, 1, 0, 1,
-0.9075395, 0.6795225, 0.5915623, 0.8941177, 1, 0, 1,
-0.9032277, -0.583928, -2.083772, 0.8901961, 1, 0, 1,
-0.8974559, -0.0384848, -1.003587, 0.8823529, 1, 0, 1,
-0.8964598, 0.4394243, -1.008745, 0.8784314, 1, 0, 1,
-0.8962004, 0.7299196, -2.639893, 0.8705882, 1, 0, 1,
-0.8959609, 0.6455492, -0.3109216, 0.8666667, 1, 0, 1,
-0.8927484, 0.3238404, -1.043584, 0.8588235, 1, 0, 1,
-0.8891646, 1.243449, -0.62244, 0.854902, 1, 0, 1,
-0.8857588, -1.435092, -3.313957, 0.8470588, 1, 0, 1,
-0.8837177, 0.2046185, -1.304993, 0.8431373, 1, 0, 1,
-0.8837164, -1.635568, -4.656587, 0.8352941, 1, 0, 1,
-0.8821474, 0.4426964, -0.1573911, 0.8313726, 1, 0, 1,
-0.8809382, 0.9479994, -1.548656, 0.8235294, 1, 0, 1,
-0.8764432, 1.967752, -0.6611716, 0.8196079, 1, 0, 1,
-0.8739793, 0.3340092, -2.878025, 0.8117647, 1, 0, 1,
-0.8504094, 1.137855, -0.147904, 0.8078431, 1, 0, 1,
-0.8470548, 0.7857155, -0.5750911, 0.8, 1, 0, 1,
-0.8456994, 0.041499, -1.78229, 0.7921569, 1, 0, 1,
-0.8412421, -0.3150961, -1.986244, 0.7882353, 1, 0, 1,
-0.8389726, 1.632846, 0.6819863, 0.7803922, 1, 0, 1,
-0.8343951, -0.04283536, -1.504393, 0.7764706, 1, 0, 1,
-0.8245954, -0.6697442, -2.488078, 0.7686275, 1, 0, 1,
-0.8215975, 0.7389761, -0.7137987, 0.7647059, 1, 0, 1,
-0.8146049, 0.1078591, -1.438383, 0.7568628, 1, 0, 1,
-0.8135689, -0.03335565, -2.11186, 0.7529412, 1, 0, 1,
-0.8115624, -0.08288042, -3.063082, 0.7450981, 1, 0, 1,
-0.8013855, -1.366077, -3.594782, 0.7411765, 1, 0, 1,
-0.8010584, -1.685652, -4.172996, 0.7333333, 1, 0, 1,
-0.798553, 0.2802523, -1.376431, 0.7294118, 1, 0, 1,
-0.7968189, -0.3713761, -2.029612, 0.7215686, 1, 0, 1,
-0.7908056, 1.437626, 0.3304089, 0.7176471, 1, 0, 1,
-0.7905315, -0.7329608, -3.256103, 0.7098039, 1, 0, 1,
-0.7809797, 1.366765, 0.8735934, 0.7058824, 1, 0, 1,
-0.7785959, 0.4867612, -3.10957, 0.6980392, 1, 0, 1,
-0.7779372, 0.8636124, -2.17623, 0.6901961, 1, 0, 1,
-0.7652487, 1.14354, -0.5152988, 0.6862745, 1, 0, 1,
-0.7569488, -1.453179, -2.489163, 0.6784314, 1, 0, 1,
-0.7565324, 1.214424, -2.145518, 0.6745098, 1, 0, 1,
-0.7558467, 1.863587, 1.686349, 0.6666667, 1, 0, 1,
-0.7549867, 0.1163625, -1.432697, 0.6627451, 1, 0, 1,
-0.7450507, -0.6352659, -2.475382, 0.654902, 1, 0, 1,
-0.7444609, 0.1936627, -0.8744724, 0.6509804, 1, 0, 1,
-0.7433325, 0.9130756, -0.4361787, 0.6431373, 1, 0, 1,
-0.7414623, 1.669041, 1.5171, 0.6392157, 1, 0, 1,
-0.7362365, 0.9146937, -0.4094466, 0.6313726, 1, 0, 1,
-0.7360229, -0.9314361, -2.194692, 0.627451, 1, 0, 1,
-0.732125, 0.2489194, -0.7789117, 0.6196079, 1, 0, 1,
-0.727357, 0.04348949, -1.994402, 0.6156863, 1, 0, 1,
-0.7245997, -0.0836757, -1.481858, 0.6078432, 1, 0, 1,
-0.7224345, -0.1457288, -1.402058, 0.6039216, 1, 0, 1,
-0.72095, 0.1423188, -1.145897, 0.5960785, 1, 0, 1,
-0.7195978, -1.015059, -0.724306, 0.5882353, 1, 0, 1,
-0.7192367, -1.464288, -1.178296, 0.5843138, 1, 0, 1,
-0.7170164, -1.627936, -1.989073, 0.5764706, 1, 0, 1,
-0.7088706, 0.4176384, 0.8962358, 0.572549, 1, 0, 1,
-0.6998841, 1.271263, -2.021842, 0.5647059, 1, 0, 1,
-0.6977916, 0.7308545, -1.143649, 0.5607843, 1, 0, 1,
-0.6950859, 0.5759612, -0.2758145, 0.5529412, 1, 0, 1,
-0.6949298, -0.9399647, -3.051351, 0.5490196, 1, 0, 1,
-0.6946206, 0.9216032, -1.532557, 0.5411765, 1, 0, 1,
-0.6827693, 1.306025, -1.738554, 0.5372549, 1, 0, 1,
-0.6805812, 0.1973351, -1.185559, 0.5294118, 1, 0, 1,
-0.6746239, 1.345948, -0.3263587, 0.5254902, 1, 0, 1,
-0.6741382, -0.9693963, -2.55546, 0.5176471, 1, 0, 1,
-0.668057, 0.6438577, 0.8085352, 0.5137255, 1, 0, 1,
-0.6638575, -0.722382, -2.055831, 0.5058824, 1, 0, 1,
-0.6617897, -1.562431, -2.319143, 0.5019608, 1, 0, 1,
-0.6612331, 1.476531, 0.5065901, 0.4941176, 1, 0, 1,
-0.6594634, -0.9812131, -1.988602, 0.4862745, 1, 0, 1,
-0.6481982, 0.3524536, -1.44076, 0.4823529, 1, 0, 1,
-0.6461548, 1.106282, 0.07167725, 0.4745098, 1, 0, 1,
-0.6372855, 0.9389837, -1.680092, 0.4705882, 1, 0, 1,
-0.6295282, 1.428247, -2.134198, 0.4627451, 1, 0, 1,
-0.624423, -1.636275, -3.600124, 0.4588235, 1, 0, 1,
-0.6242128, 0.5191337, -1.086307, 0.4509804, 1, 0, 1,
-0.623688, -0.4687487, -3.582315, 0.4470588, 1, 0, 1,
-0.6200838, 1.277425, 0.3002195, 0.4392157, 1, 0, 1,
-0.614424, 0.1144226, -2.304043, 0.4352941, 1, 0, 1,
-0.6144007, 1.160846, -0.2164836, 0.427451, 1, 0, 1,
-0.6085548, -0.1226944, -1.477077, 0.4235294, 1, 0, 1,
-0.6074356, 1.378736, 2.053236, 0.4156863, 1, 0, 1,
-0.6053738, 0.07777999, -0.1590879, 0.4117647, 1, 0, 1,
-0.6052212, 0.2138319, -1.747476, 0.4039216, 1, 0, 1,
-0.6038051, -1.935778, -3.333266, 0.3960784, 1, 0, 1,
-0.6013113, 1.841741, 0.8432367, 0.3921569, 1, 0, 1,
-0.5995134, 1.427069, -0.2656063, 0.3843137, 1, 0, 1,
-0.5975381, 0.9552478, 0.4632789, 0.3803922, 1, 0, 1,
-0.5958992, -1.534044, -3.078549, 0.372549, 1, 0, 1,
-0.5956723, -0.9701818, -2.568821, 0.3686275, 1, 0, 1,
-0.5933626, 0.8364639, -0.6040309, 0.3607843, 1, 0, 1,
-0.5900475, -1.50381, -2.120623, 0.3568628, 1, 0, 1,
-0.5858808, 0.2186665, -0.1061884, 0.3490196, 1, 0, 1,
-0.5853032, -0.9289824, -2.944014, 0.345098, 1, 0, 1,
-0.584258, -0.1679623, -0.5819912, 0.3372549, 1, 0, 1,
-0.5827876, -0.297133, -3.464952, 0.3333333, 1, 0, 1,
-0.5805748, -0.2812994, -2.461979, 0.3254902, 1, 0, 1,
-0.5784377, -1.060565, -4.567325, 0.3215686, 1, 0, 1,
-0.5685634, -0.3741211, -2.920359, 0.3137255, 1, 0, 1,
-0.5681612, -0.06137777, -2.125492, 0.3098039, 1, 0, 1,
-0.554568, 0.6440623, -1.361423, 0.3019608, 1, 0, 1,
-0.5497374, 0.9957163, 1.142133, 0.2941177, 1, 0, 1,
-0.5481238, -1.294873, -3.432133, 0.2901961, 1, 0, 1,
-0.5408893, 0.3224725, -1.4232, 0.282353, 1, 0, 1,
-0.5340161, 1.80067, 0.8534362, 0.2784314, 1, 0, 1,
-0.5295299, -0.7490888, -4.443539, 0.2705882, 1, 0, 1,
-0.5264848, -0.2535588, -1.179003, 0.2666667, 1, 0, 1,
-0.5189757, -0.3355697, -2.744036, 0.2588235, 1, 0, 1,
-0.5179827, 0.2757196, -0.6133314, 0.254902, 1, 0, 1,
-0.5160221, -0.6325015, -2.84341, 0.2470588, 1, 0, 1,
-0.5158191, -1.593744, -3.013745, 0.2431373, 1, 0, 1,
-0.5126055, 1.037656, 0.3829575, 0.2352941, 1, 0, 1,
-0.5122392, -1.722327, -3.081634, 0.2313726, 1, 0, 1,
-0.5099301, 0.6871703, -1.332552, 0.2235294, 1, 0, 1,
-0.5093661, -0.584466, -2.024417, 0.2196078, 1, 0, 1,
-0.4979796, 0.02638156, -0.1226783, 0.2117647, 1, 0, 1,
-0.496682, 0.05798784, -1.138581, 0.2078431, 1, 0, 1,
-0.4954423, 0.9972131, 0.3359056, 0.2, 1, 0, 1,
-0.4953513, -0.9166601, -3.44946, 0.1921569, 1, 0, 1,
-0.4952365, -0.6185817, -1.660916, 0.1882353, 1, 0, 1,
-0.4921024, -0.8584098, -3.302216, 0.1803922, 1, 0, 1,
-0.4905912, 0.6040069, -2.914207, 0.1764706, 1, 0, 1,
-0.489917, -0.4484891, -3.155636, 0.1686275, 1, 0, 1,
-0.489007, -0.7617851, -3.164261, 0.1647059, 1, 0, 1,
-0.4848966, 0.5378059, -0.1329992, 0.1568628, 1, 0, 1,
-0.4842019, -0.5124001, -2.569388, 0.1529412, 1, 0, 1,
-0.4773076, -1.820728, -3.437569, 0.145098, 1, 0, 1,
-0.4695075, -1.384041, -3.959999, 0.1411765, 1, 0, 1,
-0.4682986, 0.7175342, 0.1753044, 0.1333333, 1, 0, 1,
-0.4655016, -0.6261523, -2.455437, 0.1294118, 1, 0, 1,
-0.4580218, -0.8892548, -2.245639, 0.1215686, 1, 0, 1,
-0.4540316, 0.4990225, -0.3876443, 0.1176471, 1, 0, 1,
-0.4539704, 0.9090526, 0.1138021, 0.1098039, 1, 0, 1,
-0.4536994, -1.621293, -3.286373, 0.1058824, 1, 0, 1,
-0.4493085, -0.08987322, -2.846124, 0.09803922, 1, 0, 1,
-0.4476607, 1.697332, -0.2814162, 0.09019608, 1, 0, 1,
-0.4471468, 0.2473184, -1.298867, 0.08627451, 1, 0, 1,
-0.4434931, -1.047331, -4.470461, 0.07843138, 1, 0, 1,
-0.4397463, 0.2098886, -2.804626, 0.07450981, 1, 0, 1,
-0.4373156, 1.352383, -0.7593265, 0.06666667, 1, 0, 1,
-0.4336064, -0.5949133, -1.693778, 0.0627451, 1, 0, 1,
-0.4204752, 0.825644, -1.49243, 0.05490196, 1, 0, 1,
-0.4188144, -0.2388968, -2.034337, 0.05098039, 1, 0, 1,
-0.4182717, 0.42007, -0.8768042, 0.04313726, 1, 0, 1,
-0.4144405, -0.3929437, -3.830595, 0.03921569, 1, 0, 1,
-0.4106193, 0.4431028, -0.8124676, 0.03137255, 1, 0, 1,
-0.4080671, -0.2353612, -3.426179, 0.02745098, 1, 0, 1,
-0.407358, 0.6042337, -0.6487136, 0.01960784, 1, 0, 1,
-0.4041004, 1.113071, -2.199601, 0.01568628, 1, 0, 1,
-0.403136, 1.126432, -0.8318013, 0.007843138, 1, 0, 1,
-0.4017552, 1.649909, -0.2387429, 0.003921569, 1, 0, 1,
-0.4016775, -0.2411716, -2.16682, 0, 1, 0.003921569, 1,
-0.3948646, 0.2317185, -1.312639, 0, 1, 0.01176471, 1,
-0.386641, -0.8636267, -3.012752, 0, 1, 0.01568628, 1,
-0.3833333, -0.4860664, -2.141016, 0, 1, 0.02352941, 1,
-0.3830441, 0.2981563, -1.582032, 0, 1, 0.02745098, 1,
-0.3722971, 0.4720145, 0.1339883, 0, 1, 0.03529412, 1,
-0.3706899, -0.7598063, -2.25617, 0, 1, 0.03921569, 1,
-0.3694632, 0.07846561, -1.980833, 0, 1, 0.04705882, 1,
-0.3684751, 0.3077414, -1.866933, 0, 1, 0.05098039, 1,
-0.3681609, -1.540216, -4.538902, 0, 1, 0.05882353, 1,
-0.3675146, -0.01236623, -2.501868, 0, 1, 0.0627451, 1,
-0.367272, -0.5384299, -0.6688398, 0, 1, 0.07058824, 1,
-0.3572922, 2.006672, 1.09581, 0, 1, 0.07450981, 1,
-0.3535825, -1.391577, -3.470556, 0, 1, 0.08235294, 1,
-0.349144, -0.6723726, -2.53305, 0, 1, 0.08627451, 1,
-0.3458917, 0.1636849, -0.05845466, 0, 1, 0.09411765, 1,
-0.344295, 0.002562098, -1.349791, 0, 1, 0.1019608, 1,
-0.3426911, -1.093555, -3.823735, 0, 1, 0.1058824, 1,
-0.3391641, 0.2902854, -0.6182179, 0, 1, 0.1137255, 1,
-0.3371788, -0.6005248, -2.257665, 0, 1, 0.1176471, 1,
-0.3328188, 1.057462, -0.178962, 0, 1, 0.1254902, 1,
-0.3311311, 0.8878751, -2.724117, 0, 1, 0.1294118, 1,
-0.3308346, -0.08220642, -2.416654, 0, 1, 0.1372549, 1,
-0.3246329, 1.16969, -0.656486, 0, 1, 0.1411765, 1,
-0.3162205, -0.10064, -0.9320257, 0, 1, 0.1490196, 1,
-0.3136711, 1.114362, 1.093541, 0, 1, 0.1529412, 1,
-0.3091891, -0.3180372, -2.055055, 0, 1, 0.1607843, 1,
-0.3084708, 0.6091456, -0.5137195, 0, 1, 0.1647059, 1,
-0.3066873, 1.870089, -0.07416069, 0, 1, 0.172549, 1,
-0.3056338, 0.7117465, -0.8998672, 0, 1, 0.1764706, 1,
-0.3004276, 1.183161, 1.13659, 0, 1, 0.1843137, 1,
-0.3002362, -0.1655582, -2.394016, 0, 1, 0.1882353, 1,
-0.2953292, 0.3192395, 0.07952816, 0, 1, 0.1960784, 1,
-0.294841, -1.398635, -3.937926, 0, 1, 0.2039216, 1,
-0.2919806, 0.8492658, -0.4936656, 0, 1, 0.2078431, 1,
-0.289823, 0.7746456, -0.6959263, 0, 1, 0.2156863, 1,
-0.2896183, -1.199237, -3.129577, 0, 1, 0.2196078, 1,
-0.285559, 0.06266356, -2.173324, 0, 1, 0.227451, 1,
-0.2812079, -0.4199542, -0.6083444, 0, 1, 0.2313726, 1,
-0.2783217, 0.5858853, -0.4503108, 0, 1, 0.2392157, 1,
-0.2774907, -0.6810495, -2.96619, 0, 1, 0.2431373, 1,
-0.2730069, -2.75018, -1.500209, 0, 1, 0.2509804, 1,
-0.270125, 1.554882, -0.8096421, 0, 1, 0.254902, 1,
-0.268614, -1.55177, -2.284892, 0, 1, 0.2627451, 1,
-0.2620218, 0.2299333, -0.5280838, 0, 1, 0.2666667, 1,
-0.2615404, 0.2315398, -0.2429401, 0, 1, 0.2745098, 1,
-0.2608658, -0.3797464, -2.374295, 0, 1, 0.2784314, 1,
-0.2548253, 0.5484682, -0.1701609, 0, 1, 0.2862745, 1,
-0.2535885, -0.7314057, -2.823486, 0, 1, 0.2901961, 1,
-0.253241, -0.5026432, -2.940285, 0, 1, 0.2980392, 1,
-0.2529747, -0.5099611, -3.757987, 0, 1, 0.3058824, 1,
-0.2527768, -1.281916, -4.928126, 0, 1, 0.3098039, 1,
-0.2522892, 0.6919211, -0.178582, 0, 1, 0.3176471, 1,
-0.2496111, 0.6568235, -0.6899142, 0, 1, 0.3215686, 1,
-0.2476874, 0.2769381, -0.2139699, 0, 1, 0.3294118, 1,
-0.2414943, 0.9929933, -0.5795305, 0, 1, 0.3333333, 1,
-0.2404809, -0.388387, -2.673918, 0, 1, 0.3411765, 1,
-0.2357246, -1.291565, -3.008409, 0, 1, 0.345098, 1,
-0.2199548, 0.2201798, -1.06441, 0, 1, 0.3529412, 1,
-0.2185001, -0.9548811, -3.062337, 0, 1, 0.3568628, 1,
-0.2162139, 0.6802153, -0.762201, 0, 1, 0.3647059, 1,
-0.2158487, -0.2494958, -1.33494, 0, 1, 0.3686275, 1,
-0.212268, -0.330814, -1.21544, 0, 1, 0.3764706, 1,
-0.2103438, -1.161402, -1.523357, 0, 1, 0.3803922, 1,
-0.2100622, -3.239578, -5.121959, 0, 1, 0.3882353, 1,
-0.2096717, 1.554646, -2.567936, 0, 1, 0.3921569, 1,
-0.2096164, 0.6253939, 0.7113402, 0, 1, 0.4, 1,
-0.2074833, 1.022715, 0.9835693, 0, 1, 0.4078431, 1,
-0.203477, 0.2282792, 0.6934677, 0, 1, 0.4117647, 1,
-0.203171, 0.6878222, -0.01995761, 0, 1, 0.4196078, 1,
-0.2010266, -0.8215467, -2.965409, 0, 1, 0.4235294, 1,
-0.197941, -0.0401518, -0.1492555, 0, 1, 0.4313726, 1,
-0.196258, -0.7897751, -2.459407, 0, 1, 0.4352941, 1,
-0.1958576, -0.05256718, -3.510677, 0, 1, 0.4431373, 1,
-0.1955485, -0.7994255, -0.5413885, 0, 1, 0.4470588, 1,
-0.1939021, 0.5758632, -1.34445, 0, 1, 0.454902, 1,
-0.1918601, -0.06797542, -1.59789, 0, 1, 0.4588235, 1,
-0.1905277, -0.5325662, -1.663925, 0, 1, 0.4666667, 1,
-0.1873923, -1.466043, -3.552805, 0, 1, 0.4705882, 1,
-0.184887, 0.01952142, -2.455172, 0, 1, 0.4784314, 1,
-0.1837129, 1.557934, -0.6288755, 0, 1, 0.4823529, 1,
-0.1798578, -1.169756, -3.190232, 0, 1, 0.4901961, 1,
-0.1795955, -0.6768765, -2.694371, 0, 1, 0.4941176, 1,
-0.1793431, 1.15965, 0.5391948, 0, 1, 0.5019608, 1,
-0.1755429, 0.8190379, 0.2022205, 0, 1, 0.509804, 1,
-0.1731937, 0.6253713, -0.004197359, 0, 1, 0.5137255, 1,
-0.1731486, -0.878933, -1.765627, 0, 1, 0.5215687, 1,
-0.1726698, -1.014682, -0.5875047, 0, 1, 0.5254902, 1,
-0.1680478, -0.1885792, -2.487144, 0, 1, 0.5333334, 1,
-0.1626149, -0.8358479, -1.633172, 0, 1, 0.5372549, 1,
-0.1605687, -0.319406, -4.950737, 0, 1, 0.5450981, 1,
-0.159526, -0.7722248, -4.023653, 0, 1, 0.5490196, 1,
-0.1547066, 0.3048398, -1.34401, 0, 1, 0.5568628, 1,
-0.1545126, -0.3881227, -1.960825, 0, 1, 0.5607843, 1,
-0.1522145, -0.6729341, -4.004936, 0, 1, 0.5686275, 1,
-0.1461456, -0.5797635, -3.662086, 0, 1, 0.572549, 1,
-0.1426011, 0.8196049, -1.096844, 0, 1, 0.5803922, 1,
-0.1391436, 0.6069167, 0.1321323, 0, 1, 0.5843138, 1,
-0.1368701, 1.128701, 0.4473645, 0, 1, 0.5921569, 1,
-0.131807, 0.6970537, 0.6524791, 0, 1, 0.5960785, 1,
-0.1317021, 0.9916229, 0.9488624, 0, 1, 0.6039216, 1,
-0.1311106, -1.894735, -3.414299, 0, 1, 0.6117647, 1,
-0.1309532, 1.630906, -0.6836724, 0, 1, 0.6156863, 1,
-0.130894, 0.361193, 0.1076041, 0, 1, 0.6235294, 1,
-0.1301896, -1.122755, -1.624016, 0, 1, 0.627451, 1,
-0.1299036, 0.6873705, 0.5475548, 0, 1, 0.6352941, 1,
-0.1279492, 0.5563349, -1.871536, 0, 1, 0.6392157, 1,
-0.1272283, -0.6129913, -1.741201, 0, 1, 0.6470588, 1,
-0.1265508, 0.5700212, 0.122099, 0, 1, 0.6509804, 1,
-0.1204241, 1.529867, -1.28436, 0, 1, 0.6588235, 1,
-0.1153224, 0.03441069, 0.04740884, 0, 1, 0.6627451, 1,
-0.1071731, -1.371476, -3.898982, 0, 1, 0.6705883, 1,
-0.1062859, -0.5381142, -3.493085, 0, 1, 0.6745098, 1,
-0.1059053, 2.061679, -1.02362, 0, 1, 0.682353, 1,
-0.1058476, 0.2096566, -1.02334, 0, 1, 0.6862745, 1,
-0.1034965, 0.698535, -1.072386, 0, 1, 0.6941177, 1,
-0.1027043, -1.258426, -1.566781, 0, 1, 0.7019608, 1,
-0.1026602, 0.1440729, -1.312546, 0, 1, 0.7058824, 1,
-0.1000841, -0.3901968, -3.285671, 0, 1, 0.7137255, 1,
-0.09955288, 0.2717328, -0.74128, 0, 1, 0.7176471, 1,
-0.09944114, -0.5568919, -3.540093, 0, 1, 0.7254902, 1,
-0.09611512, 0.6453303, -0.6450096, 0, 1, 0.7294118, 1,
-0.09490286, -0.3689455, -2.423249, 0, 1, 0.7372549, 1,
-0.09323122, 0.2017155, -0.7115396, 0, 1, 0.7411765, 1,
-0.09319149, -0.3422524, -2.100664, 0, 1, 0.7490196, 1,
-0.08954621, 1.131426, 1.618546, 0, 1, 0.7529412, 1,
-0.08703279, -0.1380939, -4.110208, 0, 1, 0.7607843, 1,
-0.08312649, -0.4985271, -1.786513, 0, 1, 0.7647059, 1,
-0.08297016, 0.8115424, -1.363431, 0, 1, 0.772549, 1,
-0.07920734, 0.3635339, 1.413352, 0, 1, 0.7764706, 1,
-0.07138624, 0.3411249, -1.566578, 0, 1, 0.7843137, 1,
-0.06957283, -0.8817049, -2.003302, 0, 1, 0.7882353, 1,
-0.06740298, -0.3629971, -3.314459, 0, 1, 0.7960784, 1,
-0.05681857, 1.442788, 0.09878287, 0, 1, 0.8039216, 1,
-0.05678147, -0.5192618, -2.634996, 0, 1, 0.8078431, 1,
-0.05495662, -1.77048, -2.652306, 0, 1, 0.8156863, 1,
-0.05416912, 0.3242744, -0.06891693, 0, 1, 0.8196079, 1,
-0.0536978, 1.040013, -0.8794857, 0, 1, 0.827451, 1,
-0.05312841, 0.7129402, 2.195305, 0, 1, 0.8313726, 1,
-0.05128926, -0.512053, -1.749762, 0, 1, 0.8392157, 1,
-0.05047426, -0.02753226, -2.896999, 0, 1, 0.8431373, 1,
-0.04738608, 2.122729, 2.167251, 0, 1, 0.8509804, 1,
-0.0418888, 0.1203203, -0.7265861, 0, 1, 0.854902, 1,
-0.04093077, -0.6926023, -0.75538, 0, 1, 0.8627451, 1,
-0.03882593, 0.8589662, 0.1254702, 0, 1, 0.8666667, 1,
-0.03414948, -0.2880754, -2.864641, 0, 1, 0.8745098, 1,
-0.03252831, -0.4781932, -2.442374, 0, 1, 0.8784314, 1,
-0.03236897, 0.9071492, 0.6189492, 0, 1, 0.8862745, 1,
-0.03114671, -0.433032, -1.487897, 0, 1, 0.8901961, 1,
-0.02980396, 2.346249, 0.8193538, 0, 1, 0.8980392, 1,
-0.02890628, 1.525261, -1.016236, 0, 1, 0.9058824, 1,
-0.02162844, 0.9885254, 0.07595656, 0, 1, 0.9098039, 1,
-0.02065034, 0.4761758, -0.02476196, 0, 1, 0.9176471, 1,
-0.01936954, 0.7261901, -0.586299, 0, 1, 0.9215686, 1,
-0.01807155, -0.198454, -2.707229, 0, 1, 0.9294118, 1,
-0.01549071, 0.8713387, -1.465924, 0, 1, 0.9333333, 1,
-0.008962412, -0.1770447, -3.050275, 0, 1, 0.9411765, 1,
-0.004735631, 0.1885106, -0.3361508, 0, 1, 0.945098, 1,
-0.004623897, -0.01443761, -3.686215, 0, 1, 0.9529412, 1,
-0.0003894065, -0.1804579, -0.7862147, 0, 1, 0.9568627, 1,
0.000658448, 1.27944, 0.05250343, 0, 1, 0.9647059, 1,
0.01014573, 0.2747748, 0.7931157, 0, 1, 0.9686275, 1,
0.01107647, 0.4935468, -0.9036544, 0, 1, 0.9764706, 1,
0.01126752, -0.09302539, 2.041222, 0, 1, 0.9803922, 1,
0.01511663, 1.864299, 1.589001, 0, 1, 0.9882353, 1,
0.01659094, 1.103335, 0.5952899, 0, 1, 0.9921569, 1,
0.01957144, -0.4565277, 4.80473, 0, 1, 1, 1,
0.01995698, 1.836663, 0.6331634, 0, 0.9921569, 1, 1,
0.02356184, -0.8462628, 4.281607, 0, 0.9882353, 1, 1,
0.02369046, 1.348431, -2.173497, 0, 0.9803922, 1, 1,
0.02750551, -0.196399, 2.517599, 0, 0.9764706, 1, 1,
0.02803244, 0.5143827, 1.353361, 0, 0.9686275, 1, 1,
0.02827217, 0.9091207, -0.3371204, 0, 0.9647059, 1, 1,
0.03003579, -0.04958086, 2.642431, 0, 0.9568627, 1, 1,
0.03186339, -0.3858068, 3.774767, 0, 0.9529412, 1, 1,
0.03228102, 0.6960362, -0.1981336, 0, 0.945098, 1, 1,
0.03238231, 1.601066, -2.470349, 0, 0.9411765, 1, 1,
0.03530444, 0.03792479, 1.706381, 0, 0.9333333, 1, 1,
0.03559177, 1.045112, 1.061965, 0, 0.9294118, 1, 1,
0.03996874, 0.9268308, -0.1073715, 0, 0.9215686, 1, 1,
0.04179686, 0.0063007, 2.972814, 0, 0.9176471, 1, 1,
0.04268261, -0.7636822, 1.506128, 0, 0.9098039, 1, 1,
0.04454356, 1.142647, 1.255135, 0, 0.9058824, 1, 1,
0.05122751, 0.3838449, -0.2767233, 0, 0.8980392, 1, 1,
0.05205977, 0.9482496, -0.3926278, 0, 0.8901961, 1, 1,
0.0533196, 2.951885, -1.304855, 0, 0.8862745, 1, 1,
0.0556265, 1.110927, 0.6522565, 0, 0.8784314, 1, 1,
0.05570037, 1.198659, 0.1155991, 0, 0.8745098, 1, 1,
0.05602842, -0.9737087, 4.410339, 0, 0.8666667, 1, 1,
0.057048, -0.4913844, 4.434839, 0, 0.8627451, 1, 1,
0.06234229, 0.1901589, 0.468713, 0, 0.854902, 1, 1,
0.06311593, 0.1659613, -0.8522603, 0, 0.8509804, 1, 1,
0.06416671, 0.2546059, -0.914509, 0, 0.8431373, 1, 1,
0.0649235, -0.4921029, 0.7476748, 0, 0.8392157, 1, 1,
0.0655809, 0.2308514, -0.9046161, 0, 0.8313726, 1, 1,
0.07579226, -0.4377828, 4.859746, 0, 0.827451, 1, 1,
0.07636791, 1.645727, 1.137006, 0, 0.8196079, 1, 1,
0.0790389, -0.0106725, 2.759425, 0, 0.8156863, 1, 1,
0.08033709, -1.187211, 3.424246, 0, 0.8078431, 1, 1,
0.08144974, -0.214347, 3.116767, 0, 0.8039216, 1, 1,
0.08517515, -0.03889686, 1.184561, 0, 0.7960784, 1, 1,
0.08970859, 0.923283, 1.049352, 0, 0.7882353, 1, 1,
0.09308702, -0.162335, 3.054848, 0, 0.7843137, 1, 1,
0.09454224, 0.2101933, 1.603333, 0, 0.7764706, 1, 1,
0.09692779, 0.0834596, 0.7151828, 0, 0.772549, 1, 1,
0.1005001, -1.537905, 6.514245, 0, 0.7647059, 1, 1,
0.1054106, -0.1069054, 2.961625, 0, 0.7607843, 1, 1,
0.1058595, 1.311315e-05, -0.1511897, 0, 0.7529412, 1, 1,
0.1070227, 1.513349, 1.686129, 0, 0.7490196, 1, 1,
0.1099242, -0.3028092, 1.697342, 0, 0.7411765, 1, 1,
0.116149, -0.2606946, 1.692588, 0, 0.7372549, 1, 1,
0.1175873, 1.772098, -0.4257724, 0, 0.7294118, 1, 1,
0.1186653, 0.9413686, 0.2796617, 0, 0.7254902, 1, 1,
0.1196922, 0.9086136, -1.362949, 0, 0.7176471, 1, 1,
0.1226791, 0.1575978, 0.8688308, 0, 0.7137255, 1, 1,
0.1243734, -0.9070829, 3.008327, 0, 0.7058824, 1, 1,
0.1308646, -0.2990923, 3.347294, 0, 0.6980392, 1, 1,
0.137184, 0.2478928, 1.091803, 0, 0.6941177, 1, 1,
0.1417305, -0.6847061, 2.833485, 0, 0.6862745, 1, 1,
0.150595, 0.1073238, -0.1256649, 0, 0.682353, 1, 1,
0.1506869, -1.342065, 4.157556, 0, 0.6745098, 1, 1,
0.1517553, 0.09269691, 0.06844479, 0, 0.6705883, 1, 1,
0.1518945, 2.859198, 0.8734522, 0, 0.6627451, 1, 1,
0.1546289, 1.088482, -1.379487, 0, 0.6588235, 1, 1,
0.1563302, -1.060453, 2.064497, 0, 0.6509804, 1, 1,
0.1567571, 0.3231299, -0.8115149, 0, 0.6470588, 1, 1,
0.157597, -1.975698, 1.818256, 0, 0.6392157, 1, 1,
0.1622466, -0.1481947, 3.052763, 0, 0.6352941, 1, 1,
0.1623092, -0.2074626, 3.116172, 0, 0.627451, 1, 1,
0.1690916, 0.5279172, 1.92514, 0, 0.6235294, 1, 1,
0.1759768, 0.8932656, 0.5029519, 0, 0.6156863, 1, 1,
0.1761494, 1.411904, 0.0311811, 0, 0.6117647, 1, 1,
0.1762276, 1.085037, 0.9154505, 0, 0.6039216, 1, 1,
0.178634, 0.1056275, 1.67504, 0, 0.5960785, 1, 1,
0.181445, -1.680571, 3.116714, 0, 0.5921569, 1, 1,
0.1870238, -0.2606072, 2.978835, 0, 0.5843138, 1, 1,
0.199842, -0.4304823, 3.0111, 0, 0.5803922, 1, 1,
0.2019456, -0.01673486, 0.8432874, 0, 0.572549, 1, 1,
0.202537, 0.1963903, -0.9800333, 0, 0.5686275, 1, 1,
0.2055411, -0.2402645, 1.225579, 0, 0.5607843, 1, 1,
0.2059174, -0.7035648, 2.503366, 0, 0.5568628, 1, 1,
0.2077286, 0.9408223, 0.4208575, 0, 0.5490196, 1, 1,
0.2080867, 1.475187, 1.203361, 0, 0.5450981, 1, 1,
0.208175, -0.4930241, 2.429318, 0, 0.5372549, 1, 1,
0.2089163, 2.83592, 1.311909, 0, 0.5333334, 1, 1,
0.2107016, -1.02214, 2.355133, 0, 0.5254902, 1, 1,
0.2147133, -1.226965, 2.96475, 0, 0.5215687, 1, 1,
0.2162749, 1.113766, 0.8798719, 0, 0.5137255, 1, 1,
0.2166723, 1.212366, 0.3114897, 0, 0.509804, 1, 1,
0.2186607, -1.564096, 4.008514, 0, 0.5019608, 1, 1,
0.2192305, 0.02561916, 1.529062, 0, 0.4941176, 1, 1,
0.2205401, -0.002203502, 1.220491, 0, 0.4901961, 1, 1,
0.2230742, 0.2985857, 1.155897, 0, 0.4823529, 1, 1,
0.2247201, 0.1907662, 0.5879411, 0, 0.4784314, 1, 1,
0.2305699, -0.8067743, 3.325678, 0, 0.4705882, 1, 1,
0.2312539, 1.180182, 1.158973, 0, 0.4666667, 1, 1,
0.2419621, 0.4124659, 0.9025061, 0, 0.4588235, 1, 1,
0.2432974, 0.7816345, 2.169458, 0, 0.454902, 1, 1,
0.2487969, -0.2354579, 3.340679, 0, 0.4470588, 1, 1,
0.250043, 0.3243159, -0.8918735, 0, 0.4431373, 1, 1,
0.2506737, 0.3188345, 0.8147271, 0, 0.4352941, 1, 1,
0.2549978, 1.435609, 0.8000093, 0, 0.4313726, 1, 1,
0.2611727, -0.5508146, 3.256114, 0, 0.4235294, 1, 1,
0.2665676, -0.5801354, 2.367733, 0, 0.4196078, 1, 1,
0.2716853, 1.170846, 0.6146782, 0, 0.4117647, 1, 1,
0.2827083, -1.677098, 2.157306, 0, 0.4078431, 1, 1,
0.2829666, 1.218807, -0.5974494, 0, 0.4, 1, 1,
0.2833936, -0.0740137, 0.3617862, 0, 0.3921569, 1, 1,
0.2834294, 0.9919763, -0.1086754, 0, 0.3882353, 1, 1,
0.285731, 0.5531216, 1.102594, 0, 0.3803922, 1, 1,
0.2884481, 0.2486111, 0.8448023, 0, 0.3764706, 1, 1,
0.290388, 1.062144, -2.100415, 0, 0.3686275, 1, 1,
0.2916113, -2.278475, 4.136406, 0, 0.3647059, 1, 1,
0.3022088, -1.665381, 4.068739, 0, 0.3568628, 1, 1,
0.3066905, 0.5251124, 1.208614, 0, 0.3529412, 1, 1,
0.3087834, -1.965173, 3.083771, 0, 0.345098, 1, 1,
0.3092982, 0.6312845, 0.4692389, 0, 0.3411765, 1, 1,
0.3099453, 0.4302137, 1.379027, 0, 0.3333333, 1, 1,
0.3127507, 0.1219943, 2.16953, 0, 0.3294118, 1, 1,
0.31299, 0.9610325, 1.573876, 0, 0.3215686, 1, 1,
0.3152536, 0.682798, -0.9509701, 0, 0.3176471, 1, 1,
0.3194447, -0.1720813, 5.833993, 0, 0.3098039, 1, 1,
0.3225131, 1.090756, 0.7321054, 0, 0.3058824, 1, 1,
0.3235111, 0.2562058, 0.5376775, 0, 0.2980392, 1, 1,
0.3249222, -0.9956904, 3.537436, 0, 0.2901961, 1, 1,
0.3301799, -0.456846, 3.2771, 0, 0.2862745, 1, 1,
0.3313965, 1.519126, -0.764721, 0, 0.2784314, 1, 1,
0.333313, -1.636349, 2.382219, 0, 0.2745098, 1, 1,
0.3343254, 1.297734, 1.457462, 0, 0.2666667, 1, 1,
0.3353799, 0.620165, -0.1646033, 0, 0.2627451, 1, 1,
0.3365576, 1.896811, -0.5306768, 0, 0.254902, 1, 1,
0.3405967, -1.77921, 1.436401, 0, 0.2509804, 1, 1,
0.3469618, 0.7172669, 0.008137679, 0, 0.2431373, 1, 1,
0.3475956, 1.508096, -0.1961973, 0, 0.2392157, 1, 1,
0.349964, 1.383718, 0.2604427, 0, 0.2313726, 1, 1,
0.3515838, 1.988926, -1.072673, 0, 0.227451, 1, 1,
0.3526266, -0.4618793, 2.971529, 0, 0.2196078, 1, 1,
0.3532447, -0.1423174, 2.294926, 0, 0.2156863, 1, 1,
0.3532697, -0.8950106, 3.832241, 0, 0.2078431, 1, 1,
0.3574985, -0.290317, 0.6622998, 0, 0.2039216, 1, 1,
0.3588246, 0.3821483, 0.9870738, 0, 0.1960784, 1, 1,
0.3630048, 1.378541, 0.3079119, 0, 0.1882353, 1, 1,
0.3641629, -0.3398638, 2.180287, 0, 0.1843137, 1, 1,
0.3664243, -0.7910516, 2.505572, 0, 0.1764706, 1, 1,
0.3709005, -0.1219466, 1.087736, 0, 0.172549, 1, 1,
0.3746704, 0.7470539, 0.2013299, 0, 0.1647059, 1, 1,
0.3813875, -0.01079878, 1.071863, 0, 0.1607843, 1, 1,
0.3823799, -1.05838, 3.40076, 0, 0.1529412, 1, 1,
0.3850561, -0.03343132, 1.668816, 0, 0.1490196, 1, 1,
0.3852037, 0.9846681, -1.173133, 0, 0.1411765, 1, 1,
0.3865218, -1.216512, 2.387409, 0, 0.1372549, 1, 1,
0.3886156, 0.3401737, 1.124653, 0, 0.1294118, 1, 1,
0.3908667, 0.2755541, 1.152474, 0, 0.1254902, 1, 1,
0.3920056, 0.6731004, 0.8723915, 0, 0.1176471, 1, 1,
0.3932852, 0.1587375, 1.938095, 0, 0.1137255, 1, 1,
0.3952336, -0.06383596, 1.788339, 0, 0.1058824, 1, 1,
0.3953178, -0.2356631, 1.720091, 0, 0.09803922, 1, 1,
0.3954427, -0.740005, 2.839631, 0, 0.09411765, 1, 1,
0.4016379, 1.944914, 1.193859, 0, 0.08627451, 1, 1,
0.402369, 1.780001, 0.1790107, 0, 0.08235294, 1, 1,
0.4026653, -0.9052762, 1.911647, 0, 0.07450981, 1, 1,
0.406583, 1.90954, 1.810521, 0, 0.07058824, 1, 1,
0.4065971, -0.1775171, 1.101193, 0, 0.0627451, 1, 1,
0.4069441, -0.5335332, 2.442307, 0, 0.05882353, 1, 1,
0.411401, -1.401015, 2.666898, 0, 0.05098039, 1, 1,
0.41398, 1.321265, -0.1411215, 0, 0.04705882, 1, 1,
0.4175272, 0.3337551, 1.722589, 0, 0.03921569, 1, 1,
0.425194, -0.6433471, 3.267868, 0, 0.03529412, 1, 1,
0.4254717, 2.15446, -1.67191, 0, 0.02745098, 1, 1,
0.4258077, -0.03325407, 1.982883, 0, 0.02352941, 1, 1,
0.4301209, 0.7053329, 0.9399976, 0, 0.01568628, 1, 1,
0.4314175, 0.5150625, -0.6021836, 0, 0.01176471, 1, 1,
0.4316259, 0.7485062, 1.819517, 0, 0.003921569, 1, 1,
0.4402871, -2.986249, 3.509143, 0.003921569, 0, 1, 1,
0.4436209, 1.579622, 1.723373, 0.007843138, 0, 1, 1,
0.4443726, -0.2689602, 1.781964, 0.01568628, 0, 1, 1,
0.445018, 0.6190925, 0.4020226, 0.01960784, 0, 1, 1,
0.4498918, 1.682451, 1.089958, 0.02745098, 0, 1, 1,
0.4499049, -0.8755366, 1.506638, 0.03137255, 0, 1, 1,
0.4517513, -1.454121, 4.065444, 0.03921569, 0, 1, 1,
0.4585647, 1.242822, 3.143929, 0.04313726, 0, 1, 1,
0.4631396, -0.7268291, 2.485682, 0.05098039, 0, 1, 1,
0.4637506, -1.229094, 4.942518, 0.05490196, 0, 1, 1,
0.4731148, -0.8092396, -0.5479864, 0.0627451, 0, 1, 1,
0.4740171, -0.5582639, 1.171954, 0.06666667, 0, 1, 1,
0.4789286, 0.2954867, 1.171683, 0.07450981, 0, 1, 1,
0.480287, -0.08960389, 1.925231, 0.07843138, 0, 1, 1,
0.4835282, 0.8396298, 1.074218, 0.08627451, 0, 1, 1,
0.483675, -0.8188801, 4.337466, 0.09019608, 0, 1, 1,
0.4846072, -1.643873, 3.463422, 0.09803922, 0, 1, 1,
0.4974712, -1.563004, 1.823285, 0.1058824, 0, 1, 1,
0.4987542, -0.8958043, 0.5656605, 0.1098039, 0, 1, 1,
0.5000121, -0.8309545, 2.664657, 0.1176471, 0, 1, 1,
0.5005159, 0.5867115, 1.426624, 0.1215686, 0, 1, 1,
0.505818, 0.3685056, -0.6913369, 0.1294118, 0, 1, 1,
0.5115324, -1.093536, 2.693509, 0.1333333, 0, 1, 1,
0.5130779, 1.756672, 2.345388, 0.1411765, 0, 1, 1,
0.5136234, 0.1136018, 4.194788, 0.145098, 0, 1, 1,
0.5149222, 0.41198, -1.305089, 0.1529412, 0, 1, 1,
0.5169323, 2.144029, 1.19398, 0.1568628, 0, 1, 1,
0.5177536, 0.0008758124, 1.175342, 0.1647059, 0, 1, 1,
0.5178127, -0.8855187, 3.409086, 0.1686275, 0, 1, 1,
0.5182232, 2.697825, 1.088055, 0.1764706, 0, 1, 1,
0.5199891, 2.127492, -0.4102146, 0.1803922, 0, 1, 1,
0.5206511, 0.5741212, 0.9360699, 0.1882353, 0, 1, 1,
0.5225511, 0.03990659, 2.03151, 0.1921569, 0, 1, 1,
0.522843, -0.08600923, 2.913506, 0.2, 0, 1, 1,
0.5231373, 1.058153, 2.035915, 0.2078431, 0, 1, 1,
0.5281292, -1.937864, 2.184975, 0.2117647, 0, 1, 1,
0.5327742, -0.1361417, 1.165717, 0.2196078, 0, 1, 1,
0.534086, 1.372083, 0.4550907, 0.2235294, 0, 1, 1,
0.5360822, 0.8601153, 0.6239672, 0.2313726, 0, 1, 1,
0.5364187, 0.2975689, 2.076679, 0.2352941, 0, 1, 1,
0.5468256, -0.03193273, 1.589322, 0.2431373, 0, 1, 1,
0.5592768, 1.193635, -0.7144329, 0.2470588, 0, 1, 1,
0.56733, 0.6145999, 0.02948347, 0.254902, 0, 1, 1,
0.5681764, -0.6308882, 1.026175, 0.2588235, 0, 1, 1,
0.5741471, -0.8189409, 1.935107, 0.2666667, 0, 1, 1,
0.5767279, 0.2201342, 1.19535, 0.2705882, 0, 1, 1,
0.5783947, 1.699897, -0.3168338, 0.2784314, 0, 1, 1,
0.5793887, -0.587769, 3.828243, 0.282353, 0, 1, 1,
0.5800956, 0.4597691, 1.243646, 0.2901961, 0, 1, 1,
0.5860091, -2.217635, 5.487126, 0.2941177, 0, 1, 1,
0.5899484, -0.3148218, 1.921571, 0.3019608, 0, 1, 1,
0.5902762, 0.4955727, 0.4484751, 0.3098039, 0, 1, 1,
0.5941167, -0.003470587, 3.165952, 0.3137255, 0, 1, 1,
0.5992085, -0.8711308, 2.977521, 0.3215686, 0, 1, 1,
0.5992546, -1.443916, 1.110261, 0.3254902, 0, 1, 1,
0.5995451, -1.448392, 1.540159, 0.3333333, 0, 1, 1,
0.6023433, -0.5884652, 2.193391, 0.3372549, 0, 1, 1,
0.6071271, -2.005586, 3.513758, 0.345098, 0, 1, 1,
0.6076669, 0.06250756, 1.241829, 0.3490196, 0, 1, 1,
0.6105452, -0.7550099, 2.829345, 0.3568628, 0, 1, 1,
0.6146571, -0.06240796, 3.531816, 0.3607843, 0, 1, 1,
0.6155169, -0.2845992, 3.396741, 0.3686275, 0, 1, 1,
0.6166941, 0.5881488, 0.7270213, 0.372549, 0, 1, 1,
0.617466, -0.4860727, 2.350114, 0.3803922, 0, 1, 1,
0.6271639, -1.192541, 4.057246, 0.3843137, 0, 1, 1,
0.6284207, -0.1019021, 1.459055, 0.3921569, 0, 1, 1,
0.6286238, 1.232802, 1.012962, 0.3960784, 0, 1, 1,
0.6308479, -0.4995737, 3.183003, 0.4039216, 0, 1, 1,
0.6313942, -1.465283, 1.682658, 0.4117647, 0, 1, 1,
0.6328123, 0.5816014, 1.538668, 0.4156863, 0, 1, 1,
0.6338164, -0.1677794, 2.60796, 0.4235294, 0, 1, 1,
0.6366456, 0.2722845, 0.663966, 0.427451, 0, 1, 1,
0.6419412, 0.2137433, 1.324514, 0.4352941, 0, 1, 1,
0.6454505, -0.7389985, 3.068017, 0.4392157, 0, 1, 1,
0.6456056, -1.715851, 3.783226, 0.4470588, 0, 1, 1,
0.6475236, 0.06811727, 1.800926, 0.4509804, 0, 1, 1,
0.6516401, 1.630372, 0.641144, 0.4588235, 0, 1, 1,
0.6521416, -1.677104, 1.267518, 0.4627451, 0, 1, 1,
0.658919, -0.1785036, 3.555798, 0.4705882, 0, 1, 1,
0.660729, 0.3048761, 0.7541761, 0.4745098, 0, 1, 1,
0.6663964, -0.2079205, 1.518991, 0.4823529, 0, 1, 1,
0.6680387, -0.3761674, 2.703943, 0.4862745, 0, 1, 1,
0.6699021, 2.42533, -0.03202784, 0.4941176, 0, 1, 1,
0.6722862, -2.259101, 2.599423, 0.5019608, 0, 1, 1,
0.6749423, -0.6660359, 1.23443, 0.5058824, 0, 1, 1,
0.6785209, -0.679231, 1.921377, 0.5137255, 0, 1, 1,
0.6826485, -0.07531805, -0.1166267, 0.5176471, 0, 1, 1,
0.6826592, -0.5362445, 3.854748, 0.5254902, 0, 1, 1,
0.6937758, 0.9495732, 0.3383057, 0.5294118, 0, 1, 1,
0.6959789, -0.1385537, 1.805766, 0.5372549, 0, 1, 1,
0.6966084, 0.2790228, 1.946632, 0.5411765, 0, 1, 1,
0.7006449, 0.5088218, 0.2185341, 0.5490196, 0, 1, 1,
0.7051492, -0.5959482, 1.218448, 0.5529412, 0, 1, 1,
0.7076149, 0.9516358, 1.609912, 0.5607843, 0, 1, 1,
0.7100277, 0.1948404, 2.316782, 0.5647059, 0, 1, 1,
0.7134697, -0.03138054, 0.4287836, 0.572549, 0, 1, 1,
0.7135791, -0.06796581, 2.606076, 0.5764706, 0, 1, 1,
0.7170768, 0.7074769, -0.08575075, 0.5843138, 0, 1, 1,
0.7186624, 0.2003996, 1.575584, 0.5882353, 0, 1, 1,
0.7187416, -0.09163103, -1.534688, 0.5960785, 0, 1, 1,
0.7193168, -0.2385186, 1.452771, 0.6039216, 0, 1, 1,
0.7211681, 1.648055, 0.6203647, 0.6078432, 0, 1, 1,
0.7238362, 1.59834, 0.853035, 0.6156863, 0, 1, 1,
0.7293193, 1.356067, 0.736607, 0.6196079, 0, 1, 1,
0.7372417, 0.4326047, 1.902086, 0.627451, 0, 1, 1,
0.7415658, 0.4957628, 2.727213, 0.6313726, 0, 1, 1,
0.7454574, 0.1088158, 1.233885, 0.6392157, 0, 1, 1,
0.7462153, -2.175275, 2.353448, 0.6431373, 0, 1, 1,
0.74841, -1.449757, 2.221056, 0.6509804, 0, 1, 1,
0.7513522, 0.4538293, 0.8217189, 0.654902, 0, 1, 1,
0.7564647, 0.01817401, 3.356395, 0.6627451, 0, 1, 1,
0.7655318, -0.3703275, 2.190042, 0.6666667, 0, 1, 1,
0.7687375, 0.4513077, -0.4631183, 0.6745098, 0, 1, 1,
0.7687526, -0.7984314, 1.826006, 0.6784314, 0, 1, 1,
0.7704038, -0.7352047, 2.501984, 0.6862745, 0, 1, 1,
0.773568, -0.3157706, 1.377956, 0.6901961, 0, 1, 1,
0.7754603, -0.1196149, 0.974573, 0.6980392, 0, 1, 1,
0.7863914, 1.088641, 0.6051701, 0.7058824, 0, 1, 1,
0.7866398, -0.09471714, 3.185065, 0.7098039, 0, 1, 1,
0.7886831, 0.1122937, 3.082349, 0.7176471, 0, 1, 1,
0.7925916, 0.07377933, 2.22069, 0.7215686, 0, 1, 1,
0.7928359, -1.445045, 4.180171, 0.7294118, 0, 1, 1,
0.7936654, -0.1029233, 2.80153, 0.7333333, 0, 1, 1,
0.7949943, -0.5720283, 3.173918, 0.7411765, 0, 1, 1,
0.7957654, 1.054531, 1.68997, 0.7450981, 0, 1, 1,
0.8011809, 1.00553, -1.114342, 0.7529412, 0, 1, 1,
0.8015753, 0.1333077, 0.5660387, 0.7568628, 0, 1, 1,
0.8128091, -0.611846, 1.397231, 0.7647059, 0, 1, 1,
0.8152902, -0.2365364, 1.640035, 0.7686275, 0, 1, 1,
0.8201428, 1.187294, -0.7549303, 0.7764706, 0, 1, 1,
0.8204018, -1.101836, 2.703491, 0.7803922, 0, 1, 1,
0.8231304, 0.8964595, 0.05042517, 0.7882353, 0, 1, 1,
0.82757, -1.243252, 2.273748, 0.7921569, 0, 1, 1,
0.8282187, 1.581201, -1.365358, 0.8, 0, 1, 1,
0.8290561, -0.3292665, 2.500417, 0.8078431, 0, 1, 1,
0.8306452, -0.5814962, 3.495341, 0.8117647, 0, 1, 1,
0.8355774, -0.07254411, 2.10178, 0.8196079, 0, 1, 1,
0.8374954, -0.5206264, -0.3911955, 0.8235294, 0, 1, 1,
0.8375593, -1.150215, 2.952855, 0.8313726, 0, 1, 1,
0.8384161, -0.6599739, 2.895155, 0.8352941, 0, 1, 1,
0.8424084, 0.5571663, 0.7067046, 0.8431373, 0, 1, 1,
0.8440611, 0.6700004, 2.002235, 0.8470588, 0, 1, 1,
0.8453833, 0.7401986, -0.4201561, 0.854902, 0, 1, 1,
0.8495443, 0.7900241, 1.814596, 0.8588235, 0, 1, 1,
0.8549885, 1.673672, 1.133639, 0.8666667, 0, 1, 1,
0.8556734, 0.5568121, -0.08877441, 0.8705882, 0, 1, 1,
0.8559527, -1.697852, 1.78565, 0.8784314, 0, 1, 1,
0.8562902, 1.31336, 1.178111, 0.8823529, 0, 1, 1,
0.8605137, 0.2032503, 1.100193, 0.8901961, 0, 1, 1,
0.8638499, -0.4168891, 1.06603, 0.8941177, 0, 1, 1,
0.864119, -1.458459, 2.180787, 0.9019608, 0, 1, 1,
0.8689421, 1.270167, 0.1631789, 0.9098039, 0, 1, 1,
0.8734262, -0.01699747, 1.099285, 0.9137255, 0, 1, 1,
0.8775442, -1.733013, 2.166915, 0.9215686, 0, 1, 1,
0.8784786, 0.19302, 1.024238, 0.9254902, 0, 1, 1,
0.8789393, -1.046244, 2.026975, 0.9333333, 0, 1, 1,
0.8866578, -0.2927592, 2.421189, 0.9372549, 0, 1, 1,
0.8944833, -1.81029, 2.933712, 0.945098, 0, 1, 1,
0.8945875, -0.1924445, 1.244019, 0.9490196, 0, 1, 1,
0.898587, -0.03885065, 3.256399, 0.9568627, 0, 1, 1,
0.9009376, 0.4220703, 0.6329765, 0.9607843, 0, 1, 1,
0.9018822, 0.7061719, 0.4335845, 0.9686275, 0, 1, 1,
0.9106555, 1.153197, -0.09893693, 0.972549, 0, 1, 1,
0.9173529, 1.229419, 0.8750202, 0.9803922, 0, 1, 1,
0.9292883, 0.1062063, 1.797063, 0.9843137, 0, 1, 1,
0.9356638, -0.6607497, 2.410591, 0.9921569, 0, 1, 1,
0.9398037, 0.5186285, 1.268175, 0.9960784, 0, 1, 1,
0.9508018, -0.07045829, 2.215072, 1, 0, 0.9960784, 1,
0.954056, -0.01850254, 0.7683226, 1, 0, 0.9882353, 1,
0.9560682, -1.379385, 2.656006, 1, 0, 0.9843137, 1,
0.9674972, 0.7347009, 0.8943473, 1, 0, 0.9764706, 1,
0.974726, -1.841971, 2.140852, 1, 0, 0.972549, 1,
0.9762675, -1.818726, 1.920384, 1, 0, 0.9647059, 1,
0.9839121, 1.41233, 2.284089, 1, 0, 0.9607843, 1,
0.985747, -0.07411347, 1.605616, 1, 0, 0.9529412, 1,
0.9860353, -1.595907, 2.118868, 1, 0, 0.9490196, 1,
0.9881247, -0.8628049, 1.808536, 1, 0, 0.9411765, 1,
0.991539, -2.370148, 2.740399, 1, 0, 0.9372549, 1,
1.000612, -0.5308371, 1.508889, 1, 0, 0.9294118, 1,
1.002028, 0.2454582, -0.8427275, 1, 0, 0.9254902, 1,
1.007607, 0.2292953, -1.08273, 1, 0, 0.9176471, 1,
1.008942, -0.854975, 1.145468, 1, 0, 0.9137255, 1,
1.012508, -0.413071, 2.906977, 1, 0, 0.9058824, 1,
1.015375, -0.8441269, 1.129804, 1, 0, 0.9019608, 1,
1.017664, -1.079288, 2.426208, 1, 0, 0.8941177, 1,
1.028763, -0.1123394, 2.2988, 1, 0, 0.8862745, 1,
1.04122, -1.268052, 1.167459, 1, 0, 0.8823529, 1,
1.046919, -0.3871259, 2.495292, 1, 0, 0.8745098, 1,
1.05078, -1.44592, 2.670974, 1, 0, 0.8705882, 1,
1.053423, -0.026028, 1.326938, 1, 0, 0.8627451, 1,
1.065127, -1.128007, 2.322537, 1, 0, 0.8588235, 1,
1.068142, -0.5007123, 2.039391, 1, 0, 0.8509804, 1,
1.068237, 1.554318, 0.2250823, 1, 0, 0.8470588, 1,
1.069684, -1.994895, 3.626441, 1, 0, 0.8392157, 1,
1.071088, 2.09488, -1.43257, 1, 0, 0.8352941, 1,
1.073662, -0.2501271, 0.2199339, 1, 0, 0.827451, 1,
1.083907, 1.601964, -1.127301, 1, 0, 0.8235294, 1,
1.087554, -1.255457, 4.506058, 1, 0, 0.8156863, 1,
1.088408, -1.260351, 3.175294, 1, 0, 0.8117647, 1,
1.102962, -1.019599, 2.50738, 1, 0, 0.8039216, 1,
1.107462, 0.9381716, 1.430885, 1, 0, 0.7960784, 1,
1.123907, -0.3688762, 2.986388, 1, 0, 0.7921569, 1,
1.123911, -2.108691, 3.184443, 1, 0, 0.7843137, 1,
1.132351, 0.4510873, 2.599001, 1, 0, 0.7803922, 1,
1.1334, -0.08688049, 2.854107, 1, 0, 0.772549, 1,
1.146052, -0.5212185, 3.873764, 1, 0, 0.7686275, 1,
1.158703, 0.07079948, 2.158005, 1, 0, 0.7607843, 1,
1.163384, -0.1896806, -0.4540079, 1, 0, 0.7568628, 1,
1.180584, -0.08468182, 1.321461, 1, 0, 0.7490196, 1,
1.183715, -1.907772, 2.704077, 1, 0, 0.7450981, 1,
1.184096, -1.31884, 2.272246, 1, 0, 0.7372549, 1,
1.188277, -0.7350613, 2.349234, 1, 0, 0.7333333, 1,
1.197316, -1.123003, 3.068637, 1, 0, 0.7254902, 1,
1.204779, -0.490604, 3.09468, 1, 0, 0.7215686, 1,
1.216972, 0.7441691, 2.42122, 1, 0, 0.7137255, 1,
1.231012, -0.31798, 0.9433657, 1, 0, 0.7098039, 1,
1.232739, -0.7477862, 2.419023, 1, 0, 0.7019608, 1,
1.235895, 2.292598, 0.05533902, 1, 0, 0.6941177, 1,
1.240601, 1.266948, 0.6405438, 1, 0, 0.6901961, 1,
1.265584, -0.04414417, 3.486983, 1, 0, 0.682353, 1,
1.266038, -1.044296, 2.765142, 1, 0, 0.6784314, 1,
1.268124, 0.5466097, 1.271997, 1, 0, 0.6705883, 1,
1.275801, -0.8749714, 4.86667, 1, 0, 0.6666667, 1,
1.276537, 0.9552497, 0.765799, 1, 0, 0.6588235, 1,
1.295585, 0.5029677, -0.08686754, 1, 0, 0.654902, 1,
1.300434, -0.9134108, 3.5341, 1, 0, 0.6470588, 1,
1.306443, 0.4454717, 1.492032, 1, 0, 0.6431373, 1,
1.310544, -0.279196, 0.7134553, 1, 0, 0.6352941, 1,
1.311116, -0.8767328, 1.060262, 1, 0, 0.6313726, 1,
1.321336, -0.05229757, 1.763412, 1, 0, 0.6235294, 1,
1.331364, 0.6851536, 1.715702, 1, 0, 0.6196079, 1,
1.34107, 0.1935991, 1.551122, 1, 0, 0.6117647, 1,
1.344035, -0.2191179, 1.299865, 1, 0, 0.6078432, 1,
1.344064, -1.63728, 2.633536, 1, 0, 0.6, 1,
1.351918, -0.07759846, 0.289518, 1, 0, 0.5921569, 1,
1.35281, 0.03171388, 1.840769, 1, 0, 0.5882353, 1,
1.355531, 0.4342206, 1.727267, 1, 0, 0.5803922, 1,
1.357618, -0.6825426, 1.630521, 1, 0, 0.5764706, 1,
1.372963, 0.764367, 0.6156136, 1, 0, 0.5686275, 1,
1.382561, 1.869966, 1.550701, 1, 0, 0.5647059, 1,
1.422359, -0.4615337, 3.949151, 1, 0, 0.5568628, 1,
1.429062, 1.305744, 2.359086, 1, 0, 0.5529412, 1,
1.431381, 0.2583266, 1.97373, 1, 0, 0.5450981, 1,
1.433724, -0.554351, 2.924636, 1, 0, 0.5411765, 1,
1.436603, 0.7066987, 1.547122, 1, 0, 0.5333334, 1,
1.437111, -0.8772248, 3.106046, 1, 0, 0.5294118, 1,
1.445475, 0.7145628, 0.4594002, 1, 0, 0.5215687, 1,
1.462071, 0.5063605, 2.485302, 1, 0, 0.5176471, 1,
1.4638, 0.2299728, 0.1380315, 1, 0, 0.509804, 1,
1.467233, 1.264274, 3.039018, 1, 0, 0.5058824, 1,
1.492406, 1.204661, 0.984812, 1, 0, 0.4980392, 1,
1.493643, -0.4626975, 1.682699, 1, 0, 0.4901961, 1,
1.498359, -1.305425, 4.082882, 1, 0, 0.4862745, 1,
1.501066, 0.4795921, 1.832663, 1, 0, 0.4784314, 1,
1.504491, 0.6656005, 1.166886, 1, 0, 0.4745098, 1,
1.514433, -0.518831, 2.558909, 1, 0, 0.4666667, 1,
1.517018, 1.163464, 0.9958614, 1, 0, 0.4627451, 1,
1.519977, 0.9912742, 0.5062499, 1, 0, 0.454902, 1,
1.520888, -0.8340076, 2.2191, 1, 0, 0.4509804, 1,
1.522207, -0.02206535, 2.243688, 1, 0, 0.4431373, 1,
1.535446, -2.010194, 2.144184, 1, 0, 0.4392157, 1,
1.53831, -1.252479, 1.095084, 1, 0, 0.4313726, 1,
1.542307, 0.4498826, 4.950086, 1, 0, 0.427451, 1,
1.543092, 0.5568741, 1.928963, 1, 0, 0.4196078, 1,
1.543835, 0.1374221, 2.431046, 1, 0, 0.4156863, 1,
1.554295, 2.406823, -0.3640448, 1, 0, 0.4078431, 1,
1.556463, 0.4957193, 0.07228668, 1, 0, 0.4039216, 1,
1.566071, 1.051047, 0.4083682, 1, 0, 0.3960784, 1,
1.568187, 0.6160943, 2.204398, 1, 0, 0.3882353, 1,
1.578361, -0.1138253, 3.684245, 1, 0, 0.3843137, 1,
1.589758, 0.9683803, 2.006362, 1, 0, 0.3764706, 1,
1.589818, -0.1427893, 1.32287, 1, 0, 0.372549, 1,
1.595833, 0.6437755, 0.7348193, 1, 0, 0.3647059, 1,
1.60632, -0.03682901, 1.325156, 1, 0, 0.3607843, 1,
1.611104, -0.4977867, 3.05461, 1, 0, 0.3529412, 1,
1.633465, -1.295084, 2.706119, 1, 0, 0.3490196, 1,
1.635344, 1.086453, 1.788521, 1, 0, 0.3411765, 1,
1.652085, -1.089219, 2.510374, 1, 0, 0.3372549, 1,
1.678892, -2.072808, 3.013655, 1, 0, 0.3294118, 1,
1.681015, -1.188841, 1.900066, 1, 0, 0.3254902, 1,
1.683432, 0.4439928, 1.751217, 1, 0, 0.3176471, 1,
1.694382, 0.2485627, 2.00292, 1, 0, 0.3137255, 1,
1.709767, -1.316839, 2.380488, 1, 0, 0.3058824, 1,
1.715605, 0.2283477, 2.525566, 1, 0, 0.2980392, 1,
1.728472, 1.191969, 0.3683394, 1, 0, 0.2941177, 1,
1.728623, -0.3377565, 2.422437, 1, 0, 0.2862745, 1,
1.738126, 1.220023, 1.608349, 1, 0, 0.282353, 1,
1.74604, -0.7914569, 0.7220852, 1, 0, 0.2745098, 1,
1.750624, 0.5313061, 1.762534, 1, 0, 0.2705882, 1,
1.763206, 0.01229886, 0.3809535, 1, 0, 0.2627451, 1,
1.770978, -0.979914, 0.4317649, 1, 0, 0.2588235, 1,
1.775925, 1.335189, 1.642199, 1, 0, 0.2509804, 1,
1.783411, -1.493896, 1.542048, 1, 0, 0.2470588, 1,
1.787522, 0.4309984, 3.534995, 1, 0, 0.2392157, 1,
1.792806, 0.2439476, 1.587105, 1, 0, 0.2352941, 1,
1.804547, -0.3875976, 3.312894, 1, 0, 0.227451, 1,
1.806738, -0.5657545, 1.720808, 1, 0, 0.2235294, 1,
1.821121, 0.04435514, 0.7464152, 1, 0, 0.2156863, 1,
1.82816, -0.08783656, 1.874282, 1, 0, 0.2117647, 1,
1.829386, 0.1508096, 1.989004, 1, 0, 0.2039216, 1,
1.830542, 1.369994, -0.4524617, 1, 0, 0.1960784, 1,
1.87212, -0.05736112, 3.672985, 1, 0, 0.1921569, 1,
1.875585, -1.633176, 1.652412, 1, 0, 0.1843137, 1,
1.881735, -0.6537615, 1.951087, 1, 0, 0.1803922, 1,
1.882111, 0.1436225, 2.189157, 1, 0, 0.172549, 1,
1.903262, 0.2086221, 0.7858184, 1, 0, 0.1686275, 1,
1.937578, -0.3468895, 0.7532737, 1, 0, 0.1607843, 1,
1.970298, 2.618627, -0.8004364, 1, 0, 0.1568628, 1,
1.993139, 0.5252956, 1.966457, 1, 0, 0.1490196, 1,
2.001997, -0.8155895, 2.0723, 1, 0, 0.145098, 1,
2.004024, -0.4300631, 2.921214, 1, 0, 0.1372549, 1,
2.004818, -0.2269902, 2.662105, 1, 0, 0.1333333, 1,
2.01666, 0.1990825, 1.834043, 1, 0, 0.1254902, 1,
2.016792, -1.6093, 2.170161, 1, 0, 0.1215686, 1,
2.023448, -0.8359311, 2.416244, 1, 0, 0.1137255, 1,
2.091522, -0.793954, 3.464881, 1, 0, 0.1098039, 1,
2.107087, -0.578455, 1.869746, 1, 0, 0.1019608, 1,
2.109292, -1.396884, 2.090079, 1, 0, 0.09411765, 1,
2.12519, -0.04612216, 0.5568241, 1, 0, 0.09019608, 1,
2.156911, -0.9945765, 2.630656, 1, 0, 0.08235294, 1,
2.184361, 0.5887801, -0.08103069, 1, 0, 0.07843138, 1,
2.194145, 0.6058513, -0.6094211, 1, 0, 0.07058824, 1,
2.210817, 0.6287624, 1.38442, 1, 0, 0.06666667, 1,
2.229042, 1.433077, 0.5791664, 1, 0, 0.05882353, 1,
2.274193, -0.8689336, 0.8080584, 1, 0, 0.05490196, 1,
2.332912, -0.6401067, 0.4836819, 1, 0, 0.04705882, 1,
2.404393, -2.103894, 2.684957, 1, 0, 0.04313726, 1,
2.417426, -1.695204, 1.833082, 1, 0, 0.03529412, 1,
2.506663, -1.602962, 2.181451, 1, 0, 0.03137255, 1,
2.543471, -2.123115, 2.947774, 1, 0, 0.02352941, 1,
2.676314, -0.08589448, 0.2605575, 1, 0, 0.01960784, 1,
3.019288, -0.04928281, 1.041124, 1, 0, 0.01176471, 1,
3.312789, -1.088526, 0.6575016, 1, 0, 0.007843138, 1
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
0.01262522, -4.289032, -7.094296, 0, -0.5, 0.5, 0.5,
0.01262522, -4.289032, -7.094296, 1, -0.5, 0.5, 0.5,
0.01262522, -4.289032, -7.094296, 1, 1.5, 0.5, 0.5,
0.01262522, -4.289032, -7.094296, 0, 1.5, 0.5, 0.5
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
-4.406295, -0.1438468, -7.094296, 0, -0.5, 0.5, 0.5,
-4.406295, -0.1438468, -7.094296, 1, -0.5, 0.5, 0.5,
-4.406295, -0.1438468, -7.094296, 1, 1.5, 0.5, 0.5,
-4.406295, -0.1438468, -7.094296, 0, 1.5, 0.5, 0.5
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
-4.406295, -4.289032, 0.6961427, 0, -0.5, 0.5, 0.5,
-4.406295, -4.289032, 0.6961427, 1, -0.5, 0.5, 0.5,
-4.406295, -4.289032, 0.6961427, 1, 1.5, 0.5, 0.5,
-4.406295, -4.289032, 0.6961427, 0, 1.5, 0.5, 0.5
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
-3, -3.33245, -5.296502,
3, -3.33245, -5.296502,
-3, -3.33245, -5.296502,
-3, -3.491881, -5.596135,
-2, -3.33245, -5.296502,
-2, -3.491881, -5.596135,
-1, -3.33245, -5.296502,
-1, -3.491881, -5.596135,
0, -3.33245, -5.296502,
0, -3.491881, -5.596135,
1, -3.33245, -5.296502,
1, -3.491881, -5.596135,
2, -3.33245, -5.296502,
2, -3.491881, -5.596135,
3, -3.33245, -5.296502,
3, -3.491881, -5.596135
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
-3, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
-3, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
-3, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
-3, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5,
-2, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
-2, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
-2, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
-2, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5,
-1, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
-1, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
-1, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
-1, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5,
0, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
0, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
0, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
0, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5,
1, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
1, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
1, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
1, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5,
2, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
2, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
2, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
2, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5,
3, -3.810741, -6.195399, 0, -0.5, 0.5, 0.5,
3, -3.810741, -6.195399, 1, -0.5, 0.5, 0.5,
3, -3.810741, -6.195399, 1, 1.5, 0.5, 0.5,
3, -3.810741, -6.195399, 0, 1.5, 0.5, 0.5
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
-3.386544, -3, -5.296502,
-3.386544, 2, -5.296502,
-3.386544, -3, -5.296502,
-3.556502, -3, -5.596135,
-3.386544, -2, -5.296502,
-3.556502, -2, -5.596135,
-3.386544, -1, -5.296502,
-3.556502, -1, -5.596135,
-3.386544, 0, -5.296502,
-3.556502, 0, -5.596135,
-3.386544, 1, -5.296502,
-3.556502, 1, -5.596135,
-3.386544, 2, -5.296502,
-3.556502, 2, -5.596135
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
-3.896419, -3, -6.195399, 0, -0.5, 0.5, 0.5,
-3.896419, -3, -6.195399, 1, -0.5, 0.5, 0.5,
-3.896419, -3, -6.195399, 1, 1.5, 0.5, 0.5,
-3.896419, -3, -6.195399, 0, 1.5, 0.5, 0.5,
-3.896419, -2, -6.195399, 0, -0.5, 0.5, 0.5,
-3.896419, -2, -6.195399, 1, -0.5, 0.5, 0.5,
-3.896419, -2, -6.195399, 1, 1.5, 0.5, 0.5,
-3.896419, -2, -6.195399, 0, 1.5, 0.5, 0.5,
-3.896419, -1, -6.195399, 0, -0.5, 0.5, 0.5,
-3.896419, -1, -6.195399, 1, -0.5, 0.5, 0.5,
-3.896419, -1, -6.195399, 1, 1.5, 0.5, 0.5,
-3.896419, -1, -6.195399, 0, 1.5, 0.5, 0.5,
-3.896419, 0, -6.195399, 0, -0.5, 0.5, 0.5,
-3.896419, 0, -6.195399, 1, -0.5, 0.5, 0.5,
-3.896419, 0, -6.195399, 1, 1.5, 0.5, 0.5,
-3.896419, 0, -6.195399, 0, 1.5, 0.5, 0.5,
-3.896419, 1, -6.195399, 0, -0.5, 0.5, 0.5,
-3.896419, 1, -6.195399, 1, -0.5, 0.5, 0.5,
-3.896419, 1, -6.195399, 1, 1.5, 0.5, 0.5,
-3.896419, 1, -6.195399, 0, 1.5, 0.5, 0.5,
-3.896419, 2, -6.195399, 0, -0.5, 0.5, 0.5,
-3.896419, 2, -6.195399, 1, -0.5, 0.5, 0.5,
-3.896419, 2, -6.195399, 1, 1.5, 0.5, 0.5,
-3.896419, 2, -6.195399, 0, 1.5, 0.5, 0.5
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
-3.386544, -3.33245, -4,
-3.386544, -3.33245, 6,
-3.386544, -3.33245, -4,
-3.556502, -3.491881, -4,
-3.386544, -3.33245, -2,
-3.556502, -3.491881, -2,
-3.386544, -3.33245, 0,
-3.556502, -3.491881, 0,
-3.386544, -3.33245, 2,
-3.556502, -3.491881, 2,
-3.386544, -3.33245, 4,
-3.556502, -3.491881, 4,
-3.386544, -3.33245, 6,
-3.556502, -3.491881, 6
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
-3.896419, -3.810741, -4, 0, -0.5, 0.5, 0.5,
-3.896419, -3.810741, -4, 1, -0.5, 0.5, 0.5,
-3.896419, -3.810741, -4, 1, 1.5, 0.5, 0.5,
-3.896419, -3.810741, -4, 0, 1.5, 0.5, 0.5,
-3.896419, -3.810741, -2, 0, -0.5, 0.5, 0.5,
-3.896419, -3.810741, -2, 1, -0.5, 0.5, 0.5,
-3.896419, -3.810741, -2, 1, 1.5, 0.5, 0.5,
-3.896419, -3.810741, -2, 0, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 0, 0, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 0, 1, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 0, 1, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 0, 0, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 2, 0, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 2, 1, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 2, 1, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 2, 0, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 4, 0, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 4, 1, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 4, 1, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 4, 0, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 6, 0, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 6, 1, -0.5, 0.5, 0.5,
-3.896419, -3.810741, 6, 1, 1.5, 0.5, 0.5,
-3.896419, -3.810741, 6, 0, 1.5, 0.5, 0.5
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
-3.386544, -3.33245, -5.296502,
-3.386544, 3.044757, -5.296502,
-3.386544, -3.33245, 6.688787,
-3.386544, 3.044757, 6.688787,
-3.386544, -3.33245, -5.296502,
-3.386544, -3.33245, 6.688787,
-3.386544, 3.044757, -5.296502,
-3.386544, 3.044757, 6.688787,
-3.386544, -3.33245, -5.296502,
3.411794, -3.33245, -5.296502,
-3.386544, -3.33245, 6.688787,
3.411794, -3.33245, 6.688787,
-3.386544, 3.044757, -5.296502,
3.411794, 3.044757, -5.296502,
-3.386544, 3.044757, 6.688787,
3.411794, 3.044757, 6.688787,
3.411794, -3.33245, -5.296502,
3.411794, 3.044757, -5.296502,
3.411794, -3.33245, 6.688787,
3.411794, 3.044757, 6.688787,
3.411794, -3.33245, -5.296502,
3.411794, -3.33245, 6.688787,
3.411794, 3.044757, -5.296502,
3.411794, 3.044757, 6.688787
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
var radius = 8.107601;
var distance = 36.07163;
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
mvMatrix.translate( -0.01262522, 0.1438468, -0.6961427 );
mvMatrix.scale( 1.289447, 1.374598, 0.7314047 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.07163);
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
pirate<-read.table("pirate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pirate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pirate' not found
```

```r
y<-pirate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pirate' not found
```

```r
z<-pirate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pirate' not found
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
-3.287539, 1.492335, -0.1658186, 0, 0, 1, 1, 1,
-2.888697, -0.1944587, -0.1477671, 1, 0, 0, 1, 1,
-2.857251, 1.460212, -0.3211015, 1, 0, 0, 1, 1,
-2.679767, 0.172058, -0.1917189, 1, 0, 0, 1, 1,
-2.560033, 2.647319, -0.8761007, 1, 0, 0, 1, 1,
-2.511212, 0.6282988, -0.1524861, 1, 0, 0, 1, 1,
-2.50825, 0.8323752, -1.83791, 0, 0, 0, 1, 1,
-2.461089, -2.734969, -1.884407, 0, 0, 0, 1, 1,
-2.458644, -1.225458, -1.718118, 0, 0, 0, 1, 1,
-2.364268, 0.5185683, -1.62492, 0, 0, 0, 1, 1,
-2.361746, -1.057257, -2.491806, 0, 0, 0, 1, 1,
-2.359901, -1.21199, 0.2069266, 0, 0, 0, 1, 1,
-2.345999, 0.9073912, 1.102678, 0, 0, 0, 1, 1,
-2.335339, -1.01783, -2.794505, 1, 1, 1, 1, 1,
-2.275208, 0.1672852, -1.944802, 1, 1, 1, 1, 1,
-2.259585, 0.5981799, 0.2906862, 1, 1, 1, 1, 1,
-2.227467, 0.8793706, -1.129191, 1, 1, 1, 1, 1,
-2.221934, -0.3613032, -3.556862, 1, 1, 1, 1, 1,
-2.219462, -0.3645384, -0.4569484, 1, 1, 1, 1, 1,
-2.219073, 0.9441034, -2.600034, 1, 1, 1, 1, 1,
-2.178473, -0.1307476, -4.068107, 1, 1, 1, 1, 1,
-2.146253, -1.554274, -2.592668, 1, 1, 1, 1, 1,
-2.142779, 0.1176227, -0.7370709, 1, 1, 1, 1, 1,
-2.136599, -0.8916952, -2.218626, 1, 1, 1, 1, 1,
-2.047096, 0.8985472, -1.31412, 1, 1, 1, 1, 1,
-2.027088, -0.234215, -1.53281, 1, 1, 1, 1, 1,
-2.010183, 0.001840219, -2.072652, 1, 1, 1, 1, 1,
-1.995726, 1.07515, -0.2049685, 1, 1, 1, 1, 1,
-1.989264, -1.207092, -1.924239, 0, 0, 1, 1, 1,
-1.960041, -1.695131, -3.999109, 1, 0, 0, 1, 1,
-1.941162, 1.223408, -0.9966817, 1, 0, 0, 1, 1,
-1.90706, -0.1258088, -2.66301, 1, 0, 0, 1, 1,
-1.894119, 0.6238121, -1.28567, 1, 0, 0, 1, 1,
-1.890591, 1.306643, 0.4829721, 1, 0, 0, 1, 1,
-1.876356, -1.466928, -3.011123, 0, 0, 0, 1, 1,
-1.864539, 1.234922, -3.029223, 0, 0, 0, 1, 1,
-1.859185, -0.8368858, -1.7835, 0, 0, 0, 1, 1,
-1.85561, 0.0426544, -1.343183, 0, 0, 0, 1, 1,
-1.823101, 1.888039, -0.5920146, 0, 0, 0, 1, 1,
-1.818412, 0.7758166, -0.7167777, 0, 0, 0, 1, 1,
-1.811794, -1.006935, -3.384211, 0, 0, 0, 1, 1,
-1.795322, -0.6702591, -2.804011, 1, 1, 1, 1, 1,
-1.775818, -1.801181, -1.646647, 1, 1, 1, 1, 1,
-1.769427, -0.004158683, -2.347343, 1, 1, 1, 1, 1,
-1.769369, -1.133675, -2.320172, 1, 1, 1, 1, 1,
-1.751611, 0.5340085, -0.9625863, 1, 1, 1, 1, 1,
-1.741951, -1.826449, -0.5418339, 1, 1, 1, 1, 1,
-1.721416, 0.3634148, -0.1515785, 1, 1, 1, 1, 1,
-1.719556, 1.062933, -0.3584614, 1, 1, 1, 1, 1,
-1.715616, -0.3621755, -1.706609, 1, 1, 1, 1, 1,
-1.700906, -0.4235512, -2.436017, 1, 1, 1, 1, 1,
-1.699717, -0.05929731, -2.188576, 1, 1, 1, 1, 1,
-1.694144, 0.8368098, -0.3416575, 1, 1, 1, 1, 1,
-1.68047, -0.438032, -2.039949, 1, 1, 1, 1, 1,
-1.666718, 0.5392683, -0.9427276, 1, 1, 1, 1, 1,
-1.640014, 0.5236478, -1.148921, 1, 1, 1, 1, 1,
-1.616532, 1.715855, -0.4755127, 0, 0, 1, 1, 1,
-1.614366, 0.6857893, -1.254258, 1, 0, 0, 1, 1,
-1.61045, -0.4785789, -1.953788, 1, 0, 0, 1, 1,
-1.607159, 2.038831, -0.5974514, 1, 0, 0, 1, 1,
-1.603478, -0.9236329, -3.002303, 1, 0, 0, 1, 1,
-1.599367, -0.9060317, -1.59041, 1, 0, 0, 1, 1,
-1.586105, 0.4814117, -1.575186, 0, 0, 0, 1, 1,
-1.579742, -0.9314898, -2.240869, 0, 0, 0, 1, 1,
-1.571072, -1.32125, -2.308335, 0, 0, 0, 1, 1,
-1.570326, 1.074476, -1.019928, 0, 0, 0, 1, 1,
-1.562355, 1.697747, -2.304791, 0, 0, 0, 1, 1,
-1.557264, -0.9215835, -1.542272, 0, 0, 0, 1, 1,
-1.553776, -0.5178666, -2.294038, 0, 0, 0, 1, 1,
-1.542744, -0.9837832, -2.469437, 1, 1, 1, 1, 1,
-1.526823, -1.135403, -0.4360411, 1, 1, 1, 1, 1,
-1.525963, -0.5440077, -2.110885, 1, 1, 1, 1, 1,
-1.525929, -1.612615, -2.728489, 1, 1, 1, 1, 1,
-1.509543, 2.278131, 0.1721834, 1, 1, 1, 1, 1,
-1.503248, -0.5466312, -3.083314, 1, 1, 1, 1, 1,
-1.497646, 0.5272827, -2.970123, 1, 1, 1, 1, 1,
-1.491657, 0.7961711, -1.131687, 1, 1, 1, 1, 1,
-1.464764, -0.4870492, -1.23265, 1, 1, 1, 1, 1,
-1.462933, 1.471811, -1.119923, 1, 1, 1, 1, 1,
-1.460947, 0.009814478, -1.502253, 1, 1, 1, 1, 1,
-1.459343, -0.3122402, -2.119758, 1, 1, 1, 1, 1,
-1.443105, 0.5956963, -1.464963, 1, 1, 1, 1, 1,
-1.440282, -0.1436061, -2.56078, 1, 1, 1, 1, 1,
-1.440233, 0.5354748, 0.2202318, 1, 1, 1, 1, 1,
-1.437928, -0.121062, -0.7908215, 0, 0, 1, 1, 1,
-1.434932, -1.677292, -2.091249, 1, 0, 0, 1, 1,
-1.433843, -0.4406698, -1.615187, 1, 0, 0, 1, 1,
-1.421998, -0.83977, -2.981024, 1, 0, 0, 1, 1,
-1.409531, -0.8269711, 0.461601, 1, 0, 0, 1, 1,
-1.398822, 0.1124193, 0.4548367, 1, 0, 0, 1, 1,
-1.397387, 0.5747941, -2.013452, 0, 0, 0, 1, 1,
-1.393509, -2.255266, -3.216288, 0, 0, 0, 1, 1,
-1.37918, 0.03820354, -1.720507, 0, 0, 0, 1, 1,
-1.372236, 1.48901, -0.4526916, 0, 0, 0, 1, 1,
-1.371947, 0.8881696, -2.365493, 0, 0, 0, 1, 1,
-1.339325, 0.3980901, -0.2551415, 0, 0, 0, 1, 1,
-1.335309, 0.2868583, -1.074652, 0, 0, 0, 1, 1,
-1.32293, -0.3434163, -1.841033, 1, 1, 1, 1, 1,
-1.314542, -1.558257, -2.252828, 1, 1, 1, 1, 1,
-1.313343, -2.715682, -3.24157, 1, 1, 1, 1, 1,
-1.310853, 1.42116, -0.4004912, 1, 1, 1, 1, 1,
-1.309577, -0.2141625, -1.328043, 1, 1, 1, 1, 1,
-1.304611, -1.077993, -3.83367, 1, 1, 1, 1, 1,
-1.299885, -0.2503642, -1.832748, 1, 1, 1, 1, 1,
-1.297416, 0.955362, 0.1867902, 1, 1, 1, 1, 1,
-1.295776, 1.555888, -2.182587, 1, 1, 1, 1, 1,
-1.285677, 0.2581853, -0.6140941, 1, 1, 1, 1, 1,
-1.285051, 0.7933833, 0.07394867, 1, 1, 1, 1, 1,
-1.280535, 0.8330515, -0.5454019, 1, 1, 1, 1, 1,
-1.277319, 2.07816, -1.978426, 1, 1, 1, 1, 1,
-1.265795, 0.6623507, -0.6807517, 1, 1, 1, 1, 1,
-1.265384, 2.07243, -1.663976, 1, 1, 1, 1, 1,
-1.257172, -0.8886368, -2.372789, 0, 0, 1, 1, 1,
-1.239923, 1.264975, -1.486551, 1, 0, 0, 1, 1,
-1.236926, -1.349503, -3.22119, 1, 0, 0, 1, 1,
-1.236728, -0.04060764, -0.6003946, 1, 0, 0, 1, 1,
-1.233646, -1.580771, -1.629922, 1, 0, 0, 1, 1,
-1.220558, 1.016065, -0.6961166, 1, 0, 0, 1, 1,
-1.217252, 1.628766, -0.9189638, 0, 0, 0, 1, 1,
-1.217214, 1.648921, -0.7823095, 0, 0, 0, 1, 1,
-1.217074, -0.8587039, -0.6257494, 0, 0, 0, 1, 1,
-1.215127, -1.425187, -2.173383, 0, 0, 0, 1, 1,
-1.190345, -0.9290389, -3.114285, 0, 0, 0, 1, 1,
-1.179766, -0.04557004, -1.579121, 0, 0, 0, 1, 1,
-1.178849, -1.653774, -1.781542, 0, 0, 0, 1, 1,
-1.168998, 0.6647113, -1.852397, 1, 1, 1, 1, 1,
-1.160812, -2.026811, -1.478384, 1, 1, 1, 1, 1,
-1.15834, -0.7736447, -3.569164, 1, 1, 1, 1, 1,
-1.157228, 0.5257694, -1.811779, 1, 1, 1, 1, 1,
-1.156455, -0.7888638, -1.847405, 1, 1, 1, 1, 1,
-1.153272, 0.3053016, -1.251039, 1, 1, 1, 1, 1,
-1.146426, 0.8221112, -0.4427769, 1, 1, 1, 1, 1,
-1.130132, -1.03778, -3.174322, 1, 1, 1, 1, 1,
-1.130049, 0.8363367, -2.249105, 1, 1, 1, 1, 1,
-1.130026, 0.6992036, -1.459217, 1, 1, 1, 1, 1,
-1.128783, 1.722975, -0.9644548, 1, 1, 1, 1, 1,
-1.114444, 0.05344772, -1.542925, 1, 1, 1, 1, 1,
-1.111956, 0.0458701, -4.545351, 1, 1, 1, 1, 1,
-1.10197, 2.203934, -1.027048, 1, 1, 1, 1, 1,
-1.101321, -1.486194, -3.817118, 1, 1, 1, 1, 1,
-1.09859, -1.220711, -0.7101752, 0, 0, 1, 1, 1,
-1.098302, -0.5388362, -3.049838, 1, 0, 0, 1, 1,
-1.097746, 0.7837026, -1.714899, 1, 0, 0, 1, 1,
-1.096828, -0.3160822, -2.568828, 1, 0, 0, 1, 1,
-1.091221, -0.5168971, -1.54752, 1, 0, 0, 1, 1,
-1.09028, -1.786546, -2.302703, 1, 0, 0, 1, 1,
-1.080425, 0.8236028, -1.03241, 0, 0, 0, 1, 1,
-1.076583, -0.459514, -1.527128, 0, 0, 0, 1, 1,
-1.076494, 0.7751001, -0.6621496, 0, 0, 0, 1, 1,
-1.066368, -0.9833418, -1.626474, 0, 0, 0, 1, 1,
-1.065452, 0.2119707, -0.8604145, 0, 0, 0, 1, 1,
-1.064268, 2.352584, -0.02558298, 0, 0, 0, 1, 1,
-1.047613, -0.1596688, -0.3106213, 0, 0, 0, 1, 1,
-1.046731, -0.3345132, -2.064367, 1, 1, 1, 1, 1,
-1.041234, -0.9080921, 0.01743839, 1, 1, 1, 1, 1,
-1.040843, -0.5974823, -2.035753, 1, 1, 1, 1, 1,
-1.038018, -0.1129014, -3.385559, 1, 1, 1, 1, 1,
-1.033668, 1.233149, -0.6085599, 1, 1, 1, 1, 1,
-1.033515, 0.9531673, -1.479952, 1, 1, 1, 1, 1,
-1.022759, 0.1367305, -1.679346, 1, 1, 1, 1, 1,
-1.019881, 1.644015, -1.483492, 1, 1, 1, 1, 1,
-1.019091, -0.732242, -2.377735, 1, 1, 1, 1, 1,
-1.006707, 0.3100208, -2.012031, 1, 1, 1, 1, 1,
-1.006461, 0.2866085, -2.400339, 1, 1, 1, 1, 1,
-1.003861, -0.4195447, -1.740511, 1, 1, 1, 1, 1,
-1.002501, 0.9111058, 0.1354965, 1, 1, 1, 1, 1,
-0.9913421, -0.6518778, -2.416379, 1, 1, 1, 1, 1,
-0.9838749, -0.3489208, -2.075932, 1, 1, 1, 1, 1,
-0.9698297, 0.4485941, -1.719348, 0, 0, 1, 1, 1,
-0.9657028, 0.8426264, -1.461315, 1, 0, 0, 1, 1,
-0.96504, 2.355869, -0.9446484, 1, 0, 0, 1, 1,
-0.9645115, -0.5345116, -3.287987, 1, 0, 0, 1, 1,
-0.9628025, -0.2290939, -2.149754, 1, 0, 0, 1, 1,
-0.9613369, 1.012769, 0.0605999, 1, 0, 0, 1, 1,
-0.958917, 0.3914417, -1.970027, 0, 0, 0, 1, 1,
-0.9504674, -1.0677, -1.472644, 0, 0, 0, 1, 1,
-0.9360328, 0.9822311, -1.575273, 0, 0, 0, 1, 1,
-0.93353, 0.65658, -3.337354, 0, 0, 0, 1, 1,
-0.9334086, -0.2966308, -1.01501, 0, 0, 0, 1, 1,
-0.9289465, 1.408072, -1.623211, 0, 0, 0, 1, 1,
-0.9247017, -0.7771643, -3.475014, 0, 0, 0, 1, 1,
-0.9229994, 1.818559, -0.4990603, 1, 1, 1, 1, 1,
-0.913214, -0.70576, -3.497194, 1, 1, 1, 1, 1,
-0.9098625, 0.9373529, -2.517003, 1, 1, 1, 1, 1,
-0.9075395, 0.6795225, 0.5915623, 1, 1, 1, 1, 1,
-0.9032277, -0.583928, -2.083772, 1, 1, 1, 1, 1,
-0.8974559, -0.0384848, -1.003587, 1, 1, 1, 1, 1,
-0.8964598, 0.4394243, -1.008745, 1, 1, 1, 1, 1,
-0.8962004, 0.7299196, -2.639893, 1, 1, 1, 1, 1,
-0.8959609, 0.6455492, -0.3109216, 1, 1, 1, 1, 1,
-0.8927484, 0.3238404, -1.043584, 1, 1, 1, 1, 1,
-0.8891646, 1.243449, -0.62244, 1, 1, 1, 1, 1,
-0.8857588, -1.435092, -3.313957, 1, 1, 1, 1, 1,
-0.8837177, 0.2046185, -1.304993, 1, 1, 1, 1, 1,
-0.8837164, -1.635568, -4.656587, 1, 1, 1, 1, 1,
-0.8821474, 0.4426964, -0.1573911, 1, 1, 1, 1, 1,
-0.8809382, 0.9479994, -1.548656, 0, 0, 1, 1, 1,
-0.8764432, 1.967752, -0.6611716, 1, 0, 0, 1, 1,
-0.8739793, 0.3340092, -2.878025, 1, 0, 0, 1, 1,
-0.8504094, 1.137855, -0.147904, 1, 0, 0, 1, 1,
-0.8470548, 0.7857155, -0.5750911, 1, 0, 0, 1, 1,
-0.8456994, 0.041499, -1.78229, 1, 0, 0, 1, 1,
-0.8412421, -0.3150961, -1.986244, 0, 0, 0, 1, 1,
-0.8389726, 1.632846, 0.6819863, 0, 0, 0, 1, 1,
-0.8343951, -0.04283536, -1.504393, 0, 0, 0, 1, 1,
-0.8245954, -0.6697442, -2.488078, 0, 0, 0, 1, 1,
-0.8215975, 0.7389761, -0.7137987, 0, 0, 0, 1, 1,
-0.8146049, 0.1078591, -1.438383, 0, 0, 0, 1, 1,
-0.8135689, -0.03335565, -2.11186, 0, 0, 0, 1, 1,
-0.8115624, -0.08288042, -3.063082, 1, 1, 1, 1, 1,
-0.8013855, -1.366077, -3.594782, 1, 1, 1, 1, 1,
-0.8010584, -1.685652, -4.172996, 1, 1, 1, 1, 1,
-0.798553, 0.2802523, -1.376431, 1, 1, 1, 1, 1,
-0.7968189, -0.3713761, -2.029612, 1, 1, 1, 1, 1,
-0.7908056, 1.437626, 0.3304089, 1, 1, 1, 1, 1,
-0.7905315, -0.7329608, -3.256103, 1, 1, 1, 1, 1,
-0.7809797, 1.366765, 0.8735934, 1, 1, 1, 1, 1,
-0.7785959, 0.4867612, -3.10957, 1, 1, 1, 1, 1,
-0.7779372, 0.8636124, -2.17623, 1, 1, 1, 1, 1,
-0.7652487, 1.14354, -0.5152988, 1, 1, 1, 1, 1,
-0.7569488, -1.453179, -2.489163, 1, 1, 1, 1, 1,
-0.7565324, 1.214424, -2.145518, 1, 1, 1, 1, 1,
-0.7558467, 1.863587, 1.686349, 1, 1, 1, 1, 1,
-0.7549867, 0.1163625, -1.432697, 1, 1, 1, 1, 1,
-0.7450507, -0.6352659, -2.475382, 0, 0, 1, 1, 1,
-0.7444609, 0.1936627, -0.8744724, 1, 0, 0, 1, 1,
-0.7433325, 0.9130756, -0.4361787, 1, 0, 0, 1, 1,
-0.7414623, 1.669041, 1.5171, 1, 0, 0, 1, 1,
-0.7362365, 0.9146937, -0.4094466, 1, 0, 0, 1, 1,
-0.7360229, -0.9314361, -2.194692, 1, 0, 0, 1, 1,
-0.732125, 0.2489194, -0.7789117, 0, 0, 0, 1, 1,
-0.727357, 0.04348949, -1.994402, 0, 0, 0, 1, 1,
-0.7245997, -0.0836757, -1.481858, 0, 0, 0, 1, 1,
-0.7224345, -0.1457288, -1.402058, 0, 0, 0, 1, 1,
-0.72095, 0.1423188, -1.145897, 0, 0, 0, 1, 1,
-0.7195978, -1.015059, -0.724306, 0, 0, 0, 1, 1,
-0.7192367, -1.464288, -1.178296, 0, 0, 0, 1, 1,
-0.7170164, -1.627936, -1.989073, 1, 1, 1, 1, 1,
-0.7088706, 0.4176384, 0.8962358, 1, 1, 1, 1, 1,
-0.6998841, 1.271263, -2.021842, 1, 1, 1, 1, 1,
-0.6977916, 0.7308545, -1.143649, 1, 1, 1, 1, 1,
-0.6950859, 0.5759612, -0.2758145, 1, 1, 1, 1, 1,
-0.6949298, -0.9399647, -3.051351, 1, 1, 1, 1, 1,
-0.6946206, 0.9216032, -1.532557, 1, 1, 1, 1, 1,
-0.6827693, 1.306025, -1.738554, 1, 1, 1, 1, 1,
-0.6805812, 0.1973351, -1.185559, 1, 1, 1, 1, 1,
-0.6746239, 1.345948, -0.3263587, 1, 1, 1, 1, 1,
-0.6741382, -0.9693963, -2.55546, 1, 1, 1, 1, 1,
-0.668057, 0.6438577, 0.8085352, 1, 1, 1, 1, 1,
-0.6638575, -0.722382, -2.055831, 1, 1, 1, 1, 1,
-0.6617897, -1.562431, -2.319143, 1, 1, 1, 1, 1,
-0.6612331, 1.476531, 0.5065901, 1, 1, 1, 1, 1,
-0.6594634, -0.9812131, -1.988602, 0, 0, 1, 1, 1,
-0.6481982, 0.3524536, -1.44076, 1, 0, 0, 1, 1,
-0.6461548, 1.106282, 0.07167725, 1, 0, 0, 1, 1,
-0.6372855, 0.9389837, -1.680092, 1, 0, 0, 1, 1,
-0.6295282, 1.428247, -2.134198, 1, 0, 0, 1, 1,
-0.624423, -1.636275, -3.600124, 1, 0, 0, 1, 1,
-0.6242128, 0.5191337, -1.086307, 0, 0, 0, 1, 1,
-0.623688, -0.4687487, -3.582315, 0, 0, 0, 1, 1,
-0.6200838, 1.277425, 0.3002195, 0, 0, 0, 1, 1,
-0.614424, 0.1144226, -2.304043, 0, 0, 0, 1, 1,
-0.6144007, 1.160846, -0.2164836, 0, 0, 0, 1, 1,
-0.6085548, -0.1226944, -1.477077, 0, 0, 0, 1, 1,
-0.6074356, 1.378736, 2.053236, 0, 0, 0, 1, 1,
-0.6053738, 0.07777999, -0.1590879, 1, 1, 1, 1, 1,
-0.6052212, 0.2138319, -1.747476, 1, 1, 1, 1, 1,
-0.6038051, -1.935778, -3.333266, 1, 1, 1, 1, 1,
-0.6013113, 1.841741, 0.8432367, 1, 1, 1, 1, 1,
-0.5995134, 1.427069, -0.2656063, 1, 1, 1, 1, 1,
-0.5975381, 0.9552478, 0.4632789, 1, 1, 1, 1, 1,
-0.5958992, -1.534044, -3.078549, 1, 1, 1, 1, 1,
-0.5956723, -0.9701818, -2.568821, 1, 1, 1, 1, 1,
-0.5933626, 0.8364639, -0.6040309, 1, 1, 1, 1, 1,
-0.5900475, -1.50381, -2.120623, 1, 1, 1, 1, 1,
-0.5858808, 0.2186665, -0.1061884, 1, 1, 1, 1, 1,
-0.5853032, -0.9289824, -2.944014, 1, 1, 1, 1, 1,
-0.584258, -0.1679623, -0.5819912, 1, 1, 1, 1, 1,
-0.5827876, -0.297133, -3.464952, 1, 1, 1, 1, 1,
-0.5805748, -0.2812994, -2.461979, 1, 1, 1, 1, 1,
-0.5784377, -1.060565, -4.567325, 0, 0, 1, 1, 1,
-0.5685634, -0.3741211, -2.920359, 1, 0, 0, 1, 1,
-0.5681612, -0.06137777, -2.125492, 1, 0, 0, 1, 1,
-0.554568, 0.6440623, -1.361423, 1, 0, 0, 1, 1,
-0.5497374, 0.9957163, 1.142133, 1, 0, 0, 1, 1,
-0.5481238, -1.294873, -3.432133, 1, 0, 0, 1, 1,
-0.5408893, 0.3224725, -1.4232, 0, 0, 0, 1, 1,
-0.5340161, 1.80067, 0.8534362, 0, 0, 0, 1, 1,
-0.5295299, -0.7490888, -4.443539, 0, 0, 0, 1, 1,
-0.5264848, -0.2535588, -1.179003, 0, 0, 0, 1, 1,
-0.5189757, -0.3355697, -2.744036, 0, 0, 0, 1, 1,
-0.5179827, 0.2757196, -0.6133314, 0, 0, 0, 1, 1,
-0.5160221, -0.6325015, -2.84341, 0, 0, 0, 1, 1,
-0.5158191, -1.593744, -3.013745, 1, 1, 1, 1, 1,
-0.5126055, 1.037656, 0.3829575, 1, 1, 1, 1, 1,
-0.5122392, -1.722327, -3.081634, 1, 1, 1, 1, 1,
-0.5099301, 0.6871703, -1.332552, 1, 1, 1, 1, 1,
-0.5093661, -0.584466, -2.024417, 1, 1, 1, 1, 1,
-0.4979796, 0.02638156, -0.1226783, 1, 1, 1, 1, 1,
-0.496682, 0.05798784, -1.138581, 1, 1, 1, 1, 1,
-0.4954423, 0.9972131, 0.3359056, 1, 1, 1, 1, 1,
-0.4953513, -0.9166601, -3.44946, 1, 1, 1, 1, 1,
-0.4952365, -0.6185817, -1.660916, 1, 1, 1, 1, 1,
-0.4921024, -0.8584098, -3.302216, 1, 1, 1, 1, 1,
-0.4905912, 0.6040069, -2.914207, 1, 1, 1, 1, 1,
-0.489917, -0.4484891, -3.155636, 1, 1, 1, 1, 1,
-0.489007, -0.7617851, -3.164261, 1, 1, 1, 1, 1,
-0.4848966, 0.5378059, -0.1329992, 1, 1, 1, 1, 1,
-0.4842019, -0.5124001, -2.569388, 0, 0, 1, 1, 1,
-0.4773076, -1.820728, -3.437569, 1, 0, 0, 1, 1,
-0.4695075, -1.384041, -3.959999, 1, 0, 0, 1, 1,
-0.4682986, 0.7175342, 0.1753044, 1, 0, 0, 1, 1,
-0.4655016, -0.6261523, -2.455437, 1, 0, 0, 1, 1,
-0.4580218, -0.8892548, -2.245639, 1, 0, 0, 1, 1,
-0.4540316, 0.4990225, -0.3876443, 0, 0, 0, 1, 1,
-0.4539704, 0.9090526, 0.1138021, 0, 0, 0, 1, 1,
-0.4536994, -1.621293, -3.286373, 0, 0, 0, 1, 1,
-0.4493085, -0.08987322, -2.846124, 0, 0, 0, 1, 1,
-0.4476607, 1.697332, -0.2814162, 0, 0, 0, 1, 1,
-0.4471468, 0.2473184, -1.298867, 0, 0, 0, 1, 1,
-0.4434931, -1.047331, -4.470461, 0, 0, 0, 1, 1,
-0.4397463, 0.2098886, -2.804626, 1, 1, 1, 1, 1,
-0.4373156, 1.352383, -0.7593265, 1, 1, 1, 1, 1,
-0.4336064, -0.5949133, -1.693778, 1, 1, 1, 1, 1,
-0.4204752, 0.825644, -1.49243, 1, 1, 1, 1, 1,
-0.4188144, -0.2388968, -2.034337, 1, 1, 1, 1, 1,
-0.4182717, 0.42007, -0.8768042, 1, 1, 1, 1, 1,
-0.4144405, -0.3929437, -3.830595, 1, 1, 1, 1, 1,
-0.4106193, 0.4431028, -0.8124676, 1, 1, 1, 1, 1,
-0.4080671, -0.2353612, -3.426179, 1, 1, 1, 1, 1,
-0.407358, 0.6042337, -0.6487136, 1, 1, 1, 1, 1,
-0.4041004, 1.113071, -2.199601, 1, 1, 1, 1, 1,
-0.403136, 1.126432, -0.8318013, 1, 1, 1, 1, 1,
-0.4017552, 1.649909, -0.2387429, 1, 1, 1, 1, 1,
-0.4016775, -0.2411716, -2.16682, 1, 1, 1, 1, 1,
-0.3948646, 0.2317185, -1.312639, 1, 1, 1, 1, 1,
-0.386641, -0.8636267, -3.012752, 0, 0, 1, 1, 1,
-0.3833333, -0.4860664, -2.141016, 1, 0, 0, 1, 1,
-0.3830441, 0.2981563, -1.582032, 1, 0, 0, 1, 1,
-0.3722971, 0.4720145, 0.1339883, 1, 0, 0, 1, 1,
-0.3706899, -0.7598063, -2.25617, 1, 0, 0, 1, 1,
-0.3694632, 0.07846561, -1.980833, 1, 0, 0, 1, 1,
-0.3684751, 0.3077414, -1.866933, 0, 0, 0, 1, 1,
-0.3681609, -1.540216, -4.538902, 0, 0, 0, 1, 1,
-0.3675146, -0.01236623, -2.501868, 0, 0, 0, 1, 1,
-0.367272, -0.5384299, -0.6688398, 0, 0, 0, 1, 1,
-0.3572922, 2.006672, 1.09581, 0, 0, 0, 1, 1,
-0.3535825, -1.391577, -3.470556, 0, 0, 0, 1, 1,
-0.349144, -0.6723726, -2.53305, 0, 0, 0, 1, 1,
-0.3458917, 0.1636849, -0.05845466, 1, 1, 1, 1, 1,
-0.344295, 0.002562098, -1.349791, 1, 1, 1, 1, 1,
-0.3426911, -1.093555, -3.823735, 1, 1, 1, 1, 1,
-0.3391641, 0.2902854, -0.6182179, 1, 1, 1, 1, 1,
-0.3371788, -0.6005248, -2.257665, 1, 1, 1, 1, 1,
-0.3328188, 1.057462, -0.178962, 1, 1, 1, 1, 1,
-0.3311311, 0.8878751, -2.724117, 1, 1, 1, 1, 1,
-0.3308346, -0.08220642, -2.416654, 1, 1, 1, 1, 1,
-0.3246329, 1.16969, -0.656486, 1, 1, 1, 1, 1,
-0.3162205, -0.10064, -0.9320257, 1, 1, 1, 1, 1,
-0.3136711, 1.114362, 1.093541, 1, 1, 1, 1, 1,
-0.3091891, -0.3180372, -2.055055, 1, 1, 1, 1, 1,
-0.3084708, 0.6091456, -0.5137195, 1, 1, 1, 1, 1,
-0.3066873, 1.870089, -0.07416069, 1, 1, 1, 1, 1,
-0.3056338, 0.7117465, -0.8998672, 1, 1, 1, 1, 1,
-0.3004276, 1.183161, 1.13659, 0, 0, 1, 1, 1,
-0.3002362, -0.1655582, -2.394016, 1, 0, 0, 1, 1,
-0.2953292, 0.3192395, 0.07952816, 1, 0, 0, 1, 1,
-0.294841, -1.398635, -3.937926, 1, 0, 0, 1, 1,
-0.2919806, 0.8492658, -0.4936656, 1, 0, 0, 1, 1,
-0.289823, 0.7746456, -0.6959263, 1, 0, 0, 1, 1,
-0.2896183, -1.199237, -3.129577, 0, 0, 0, 1, 1,
-0.285559, 0.06266356, -2.173324, 0, 0, 0, 1, 1,
-0.2812079, -0.4199542, -0.6083444, 0, 0, 0, 1, 1,
-0.2783217, 0.5858853, -0.4503108, 0, 0, 0, 1, 1,
-0.2774907, -0.6810495, -2.96619, 0, 0, 0, 1, 1,
-0.2730069, -2.75018, -1.500209, 0, 0, 0, 1, 1,
-0.270125, 1.554882, -0.8096421, 0, 0, 0, 1, 1,
-0.268614, -1.55177, -2.284892, 1, 1, 1, 1, 1,
-0.2620218, 0.2299333, -0.5280838, 1, 1, 1, 1, 1,
-0.2615404, 0.2315398, -0.2429401, 1, 1, 1, 1, 1,
-0.2608658, -0.3797464, -2.374295, 1, 1, 1, 1, 1,
-0.2548253, 0.5484682, -0.1701609, 1, 1, 1, 1, 1,
-0.2535885, -0.7314057, -2.823486, 1, 1, 1, 1, 1,
-0.253241, -0.5026432, -2.940285, 1, 1, 1, 1, 1,
-0.2529747, -0.5099611, -3.757987, 1, 1, 1, 1, 1,
-0.2527768, -1.281916, -4.928126, 1, 1, 1, 1, 1,
-0.2522892, 0.6919211, -0.178582, 1, 1, 1, 1, 1,
-0.2496111, 0.6568235, -0.6899142, 1, 1, 1, 1, 1,
-0.2476874, 0.2769381, -0.2139699, 1, 1, 1, 1, 1,
-0.2414943, 0.9929933, -0.5795305, 1, 1, 1, 1, 1,
-0.2404809, -0.388387, -2.673918, 1, 1, 1, 1, 1,
-0.2357246, -1.291565, -3.008409, 1, 1, 1, 1, 1,
-0.2199548, 0.2201798, -1.06441, 0, 0, 1, 1, 1,
-0.2185001, -0.9548811, -3.062337, 1, 0, 0, 1, 1,
-0.2162139, 0.6802153, -0.762201, 1, 0, 0, 1, 1,
-0.2158487, -0.2494958, -1.33494, 1, 0, 0, 1, 1,
-0.212268, -0.330814, -1.21544, 1, 0, 0, 1, 1,
-0.2103438, -1.161402, -1.523357, 1, 0, 0, 1, 1,
-0.2100622, -3.239578, -5.121959, 0, 0, 0, 1, 1,
-0.2096717, 1.554646, -2.567936, 0, 0, 0, 1, 1,
-0.2096164, 0.6253939, 0.7113402, 0, 0, 0, 1, 1,
-0.2074833, 1.022715, 0.9835693, 0, 0, 0, 1, 1,
-0.203477, 0.2282792, 0.6934677, 0, 0, 0, 1, 1,
-0.203171, 0.6878222, -0.01995761, 0, 0, 0, 1, 1,
-0.2010266, -0.8215467, -2.965409, 0, 0, 0, 1, 1,
-0.197941, -0.0401518, -0.1492555, 1, 1, 1, 1, 1,
-0.196258, -0.7897751, -2.459407, 1, 1, 1, 1, 1,
-0.1958576, -0.05256718, -3.510677, 1, 1, 1, 1, 1,
-0.1955485, -0.7994255, -0.5413885, 1, 1, 1, 1, 1,
-0.1939021, 0.5758632, -1.34445, 1, 1, 1, 1, 1,
-0.1918601, -0.06797542, -1.59789, 1, 1, 1, 1, 1,
-0.1905277, -0.5325662, -1.663925, 1, 1, 1, 1, 1,
-0.1873923, -1.466043, -3.552805, 1, 1, 1, 1, 1,
-0.184887, 0.01952142, -2.455172, 1, 1, 1, 1, 1,
-0.1837129, 1.557934, -0.6288755, 1, 1, 1, 1, 1,
-0.1798578, -1.169756, -3.190232, 1, 1, 1, 1, 1,
-0.1795955, -0.6768765, -2.694371, 1, 1, 1, 1, 1,
-0.1793431, 1.15965, 0.5391948, 1, 1, 1, 1, 1,
-0.1755429, 0.8190379, 0.2022205, 1, 1, 1, 1, 1,
-0.1731937, 0.6253713, -0.004197359, 1, 1, 1, 1, 1,
-0.1731486, -0.878933, -1.765627, 0, 0, 1, 1, 1,
-0.1726698, -1.014682, -0.5875047, 1, 0, 0, 1, 1,
-0.1680478, -0.1885792, -2.487144, 1, 0, 0, 1, 1,
-0.1626149, -0.8358479, -1.633172, 1, 0, 0, 1, 1,
-0.1605687, -0.319406, -4.950737, 1, 0, 0, 1, 1,
-0.159526, -0.7722248, -4.023653, 1, 0, 0, 1, 1,
-0.1547066, 0.3048398, -1.34401, 0, 0, 0, 1, 1,
-0.1545126, -0.3881227, -1.960825, 0, 0, 0, 1, 1,
-0.1522145, -0.6729341, -4.004936, 0, 0, 0, 1, 1,
-0.1461456, -0.5797635, -3.662086, 0, 0, 0, 1, 1,
-0.1426011, 0.8196049, -1.096844, 0, 0, 0, 1, 1,
-0.1391436, 0.6069167, 0.1321323, 0, 0, 0, 1, 1,
-0.1368701, 1.128701, 0.4473645, 0, 0, 0, 1, 1,
-0.131807, 0.6970537, 0.6524791, 1, 1, 1, 1, 1,
-0.1317021, 0.9916229, 0.9488624, 1, 1, 1, 1, 1,
-0.1311106, -1.894735, -3.414299, 1, 1, 1, 1, 1,
-0.1309532, 1.630906, -0.6836724, 1, 1, 1, 1, 1,
-0.130894, 0.361193, 0.1076041, 1, 1, 1, 1, 1,
-0.1301896, -1.122755, -1.624016, 1, 1, 1, 1, 1,
-0.1299036, 0.6873705, 0.5475548, 1, 1, 1, 1, 1,
-0.1279492, 0.5563349, -1.871536, 1, 1, 1, 1, 1,
-0.1272283, -0.6129913, -1.741201, 1, 1, 1, 1, 1,
-0.1265508, 0.5700212, 0.122099, 1, 1, 1, 1, 1,
-0.1204241, 1.529867, -1.28436, 1, 1, 1, 1, 1,
-0.1153224, 0.03441069, 0.04740884, 1, 1, 1, 1, 1,
-0.1071731, -1.371476, -3.898982, 1, 1, 1, 1, 1,
-0.1062859, -0.5381142, -3.493085, 1, 1, 1, 1, 1,
-0.1059053, 2.061679, -1.02362, 1, 1, 1, 1, 1,
-0.1058476, 0.2096566, -1.02334, 0, 0, 1, 1, 1,
-0.1034965, 0.698535, -1.072386, 1, 0, 0, 1, 1,
-0.1027043, -1.258426, -1.566781, 1, 0, 0, 1, 1,
-0.1026602, 0.1440729, -1.312546, 1, 0, 0, 1, 1,
-0.1000841, -0.3901968, -3.285671, 1, 0, 0, 1, 1,
-0.09955288, 0.2717328, -0.74128, 1, 0, 0, 1, 1,
-0.09944114, -0.5568919, -3.540093, 0, 0, 0, 1, 1,
-0.09611512, 0.6453303, -0.6450096, 0, 0, 0, 1, 1,
-0.09490286, -0.3689455, -2.423249, 0, 0, 0, 1, 1,
-0.09323122, 0.2017155, -0.7115396, 0, 0, 0, 1, 1,
-0.09319149, -0.3422524, -2.100664, 0, 0, 0, 1, 1,
-0.08954621, 1.131426, 1.618546, 0, 0, 0, 1, 1,
-0.08703279, -0.1380939, -4.110208, 0, 0, 0, 1, 1,
-0.08312649, -0.4985271, -1.786513, 1, 1, 1, 1, 1,
-0.08297016, 0.8115424, -1.363431, 1, 1, 1, 1, 1,
-0.07920734, 0.3635339, 1.413352, 1, 1, 1, 1, 1,
-0.07138624, 0.3411249, -1.566578, 1, 1, 1, 1, 1,
-0.06957283, -0.8817049, -2.003302, 1, 1, 1, 1, 1,
-0.06740298, -0.3629971, -3.314459, 1, 1, 1, 1, 1,
-0.05681857, 1.442788, 0.09878287, 1, 1, 1, 1, 1,
-0.05678147, -0.5192618, -2.634996, 1, 1, 1, 1, 1,
-0.05495662, -1.77048, -2.652306, 1, 1, 1, 1, 1,
-0.05416912, 0.3242744, -0.06891693, 1, 1, 1, 1, 1,
-0.0536978, 1.040013, -0.8794857, 1, 1, 1, 1, 1,
-0.05312841, 0.7129402, 2.195305, 1, 1, 1, 1, 1,
-0.05128926, -0.512053, -1.749762, 1, 1, 1, 1, 1,
-0.05047426, -0.02753226, -2.896999, 1, 1, 1, 1, 1,
-0.04738608, 2.122729, 2.167251, 1, 1, 1, 1, 1,
-0.0418888, 0.1203203, -0.7265861, 0, 0, 1, 1, 1,
-0.04093077, -0.6926023, -0.75538, 1, 0, 0, 1, 1,
-0.03882593, 0.8589662, 0.1254702, 1, 0, 0, 1, 1,
-0.03414948, -0.2880754, -2.864641, 1, 0, 0, 1, 1,
-0.03252831, -0.4781932, -2.442374, 1, 0, 0, 1, 1,
-0.03236897, 0.9071492, 0.6189492, 1, 0, 0, 1, 1,
-0.03114671, -0.433032, -1.487897, 0, 0, 0, 1, 1,
-0.02980396, 2.346249, 0.8193538, 0, 0, 0, 1, 1,
-0.02890628, 1.525261, -1.016236, 0, 0, 0, 1, 1,
-0.02162844, 0.9885254, 0.07595656, 0, 0, 0, 1, 1,
-0.02065034, 0.4761758, -0.02476196, 0, 0, 0, 1, 1,
-0.01936954, 0.7261901, -0.586299, 0, 0, 0, 1, 1,
-0.01807155, -0.198454, -2.707229, 0, 0, 0, 1, 1,
-0.01549071, 0.8713387, -1.465924, 1, 1, 1, 1, 1,
-0.008962412, -0.1770447, -3.050275, 1, 1, 1, 1, 1,
-0.004735631, 0.1885106, -0.3361508, 1, 1, 1, 1, 1,
-0.004623897, -0.01443761, -3.686215, 1, 1, 1, 1, 1,
-0.0003894065, -0.1804579, -0.7862147, 1, 1, 1, 1, 1,
0.000658448, 1.27944, 0.05250343, 1, 1, 1, 1, 1,
0.01014573, 0.2747748, 0.7931157, 1, 1, 1, 1, 1,
0.01107647, 0.4935468, -0.9036544, 1, 1, 1, 1, 1,
0.01126752, -0.09302539, 2.041222, 1, 1, 1, 1, 1,
0.01511663, 1.864299, 1.589001, 1, 1, 1, 1, 1,
0.01659094, 1.103335, 0.5952899, 1, 1, 1, 1, 1,
0.01957144, -0.4565277, 4.80473, 1, 1, 1, 1, 1,
0.01995698, 1.836663, 0.6331634, 1, 1, 1, 1, 1,
0.02356184, -0.8462628, 4.281607, 1, 1, 1, 1, 1,
0.02369046, 1.348431, -2.173497, 1, 1, 1, 1, 1,
0.02750551, -0.196399, 2.517599, 0, 0, 1, 1, 1,
0.02803244, 0.5143827, 1.353361, 1, 0, 0, 1, 1,
0.02827217, 0.9091207, -0.3371204, 1, 0, 0, 1, 1,
0.03003579, -0.04958086, 2.642431, 1, 0, 0, 1, 1,
0.03186339, -0.3858068, 3.774767, 1, 0, 0, 1, 1,
0.03228102, 0.6960362, -0.1981336, 1, 0, 0, 1, 1,
0.03238231, 1.601066, -2.470349, 0, 0, 0, 1, 1,
0.03530444, 0.03792479, 1.706381, 0, 0, 0, 1, 1,
0.03559177, 1.045112, 1.061965, 0, 0, 0, 1, 1,
0.03996874, 0.9268308, -0.1073715, 0, 0, 0, 1, 1,
0.04179686, 0.0063007, 2.972814, 0, 0, 0, 1, 1,
0.04268261, -0.7636822, 1.506128, 0, 0, 0, 1, 1,
0.04454356, 1.142647, 1.255135, 0, 0, 0, 1, 1,
0.05122751, 0.3838449, -0.2767233, 1, 1, 1, 1, 1,
0.05205977, 0.9482496, -0.3926278, 1, 1, 1, 1, 1,
0.0533196, 2.951885, -1.304855, 1, 1, 1, 1, 1,
0.0556265, 1.110927, 0.6522565, 1, 1, 1, 1, 1,
0.05570037, 1.198659, 0.1155991, 1, 1, 1, 1, 1,
0.05602842, -0.9737087, 4.410339, 1, 1, 1, 1, 1,
0.057048, -0.4913844, 4.434839, 1, 1, 1, 1, 1,
0.06234229, 0.1901589, 0.468713, 1, 1, 1, 1, 1,
0.06311593, 0.1659613, -0.8522603, 1, 1, 1, 1, 1,
0.06416671, 0.2546059, -0.914509, 1, 1, 1, 1, 1,
0.0649235, -0.4921029, 0.7476748, 1, 1, 1, 1, 1,
0.0655809, 0.2308514, -0.9046161, 1, 1, 1, 1, 1,
0.07579226, -0.4377828, 4.859746, 1, 1, 1, 1, 1,
0.07636791, 1.645727, 1.137006, 1, 1, 1, 1, 1,
0.0790389, -0.0106725, 2.759425, 1, 1, 1, 1, 1,
0.08033709, -1.187211, 3.424246, 0, 0, 1, 1, 1,
0.08144974, -0.214347, 3.116767, 1, 0, 0, 1, 1,
0.08517515, -0.03889686, 1.184561, 1, 0, 0, 1, 1,
0.08970859, 0.923283, 1.049352, 1, 0, 0, 1, 1,
0.09308702, -0.162335, 3.054848, 1, 0, 0, 1, 1,
0.09454224, 0.2101933, 1.603333, 1, 0, 0, 1, 1,
0.09692779, 0.0834596, 0.7151828, 0, 0, 0, 1, 1,
0.1005001, -1.537905, 6.514245, 0, 0, 0, 1, 1,
0.1054106, -0.1069054, 2.961625, 0, 0, 0, 1, 1,
0.1058595, 1.311315e-05, -0.1511897, 0, 0, 0, 1, 1,
0.1070227, 1.513349, 1.686129, 0, 0, 0, 1, 1,
0.1099242, -0.3028092, 1.697342, 0, 0, 0, 1, 1,
0.116149, -0.2606946, 1.692588, 0, 0, 0, 1, 1,
0.1175873, 1.772098, -0.4257724, 1, 1, 1, 1, 1,
0.1186653, 0.9413686, 0.2796617, 1, 1, 1, 1, 1,
0.1196922, 0.9086136, -1.362949, 1, 1, 1, 1, 1,
0.1226791, 0.1575978, 0.8688308, 1, 1, 1, 1, 1,
0.1243734, -0.9070829, 3.008327, 1, 1, 1, 1, 1,
0.1308646, -0.2990923, 3.347294, 1, 1, 1, 1, 1,
0.137184, 0.2478928, 1.091803, 1, 1, 1, 1, 1,
0.1417305, -0.6847061, 2.833485, 1, 1, 1, 1, 1,
0.150595, 0.1073238, -0.1256649, 1, 1, 1, 1, 1,
0.1506869, -1.342065, 4.157556, 1, 1, 1, 1, 1,
0.1517553, 0.09269691, 0.06844479, 1, 1, 1, 1, 1,
0.1518945, 2.859198, 0.8734522, 1, 1, 1, 1, 1,
0.1546289, 1.088482, -1.379487, 1, 1, 1, 1, 1,
0.1563302, -1.060453, 2.064497, 1, 1, 1, 1, 1,
0.1567571, 0.3231299, -0.8115149, 1, 1, 1, 1, 1,
0.157597, -1.975698, 1.818256, 0, 0, 1, 1, 1,
0.1622466, -0.1481947, 3.052763, 1, 0, 0, 1, 1,
0.1623092, -0.2074626, 3.116172, 1, 0, 0, 1, 1,
0.1690916, 0.5279172, 1.92514, 1, 0, 0, 1, 1,
0.1759768, 0.8932656, 0.5029519, 1, 0, 0, 1, 1,
0.1761494, 1.411904, 0.0311811, 1, 0, 0, 1, 1,
0.1762276, 1.085037, 0.9154505, 0, 0, 0, 1, 1,
0.178634, 0.1056275, 1.67504, 0, 0, 0, 1, 1,
0.181445, -1.680571, 3.116714, 0, 0, 0, 1, 1,
0.1870238, -0.2606072, 2.978835, 0, 0, 0, 1, 1,
0.199842, -0.4304823, 3.0111, 0, 0, 0, 1, 1,
0.2019456, -0.01673486, 0.8432874, 0, 0, 0, 1, 1,
0.202537, 0.1963903, -0.9800333, 0, 0, 0, 1, 1,
0.2055411, -0.2402645, 1.225579, 1, 1, 1, 1, 1,
0.2059174, -0.7035648, 2.503366, 1, 1, 1, 1, 1,
0.2077286, 0.9408223, 0.4208575, 1, 1, 1, 1, 1,
0.2080867, 1.475187, 1.203361, 1, 1, 1, 1, 1,
0.208175, -0.4930241, 2.429318, 1, 1, 1, 1, 1,
0.2089163, 2.83592, 1.311909, 1, 1, 1, 1, 1,
0.2107016, -1.02214, 2.355133, 1, 1, 1, 1, 1,
0.2147133, -1.226965, 2.96475, 1, 1, 1, 1, 1,
0.2162749, 1.113766, 0.8798719, 1, 1, 1, 1, 1,
0.2166723, 1.212366, 0.3114897, 1, 1, 1, 1, 1,
0.2186607, -1.564096, 4.008514, 1, 1, 1, 1, 1,
0.2192305, 0.02561916, 1.529062, 1, 1, 1, 1, 1,
0.2205401, -0.002203502, 1.220491, 1, 1, 1, 1, 1,
0.2230742, 0.2985857, 1.155897, 1, 1, 1, 1, 1,
0.2247201, 0.1907662, 0.5879411, 1, 1, 1, 1, 1,
0.2305699, -0.8067743, 3.325678, 0, 0, 1, 1, 1,
0.2312539, 1.180182, 1.158973, 1, 0, 0, 1, 1,
0.2419621, 0.4124659, 0.9025061, 1, 0, 0, 1, 1,
0.2432974, 0.7816345, 2.169458, 1, 0, 0, 1, 1,
0.2487969, -0.2354579, 3.340679, 1, 0, 0, 1, 1,
0.250043, 0.3243159, -0.8918735, 1, 0, 0, 1, 1,
0.2506737, 0.3188345, 0.8147271, 0, 0, 0, 1, 1,
0.2549978, 1.435609, 0.8000093, 0, 0, 0, 1, 1,
0.2611727, -0.5508146, 3.256114, 0, 0, 0, 1, 1,
0.2665676, -0.5801354, 2.367733, 0, 0, 0, 1, 1,
0.2716853, 1.170846, 0.6146782, 0, 0, 0, 1, 1,
0.2827083, -1.677098, 2.157306, 0, 0, 0, 1, 1,
0.2829666, 1.218807, -0.5974494, 0, 0, 0, 1, 1,
0.2833936, -0.0740137, 0.3617862, 1, 1, 1, 1, 1,
0.2834294, 0.9919763, -0.1086754, 1, 1, 1, 1, 1,
0.285731, 0.5531216, 1.102594, 1, 1, 1, 1, 1,
0.2884481, 0.2486111, 0.8448023, 1, 1, 1, 1, 1,
0.290388, 1.062144, -2.100415, 1, 1, 1, 1, 1,
0.2916113, -2.278475, 4.136406, 1, 1, 1, 1, 1,
0.3022088, -1.665381, 4.068739, 1, 1, 1, 1, 1,
0.3066905, 0.5251124, 1.208614, 1, 1, 1, 1, 1,
0.3087834, -1.965173, 3.083771, 1, 1, 1, 1, 1,
0.3092982, 0.6312845, 0.4692389, 1, 1, 1, 1, 1,
0.3099453, 0.4302137, 1.379027, 1, 1, 1, 1, 1,
0.3127507, 0.1219943, 2.16953, 1, 1, 1, 1, 1,
0.31299, 0.9610325, 1.573876, 1, 1, 1, 1, 1,
0.3152536, 0.682798, -0.9509701, 1, 1, 1, 1, 1,
0.3194447, -0.1720813, 5.833993, 1, 1, 1, 1, 1,
0.3225131, 1.090756, 0.7321054, 0, 0, 1, 1, 1,
0.3235111, 0.2562058, 0.5376775, 1, 0, 0, 1, 1,
0.3249222, -0.9956904, 3.537436, 1, 0, 0, 1, 1,
0.3301799, -0.456846, 3.2771, 1, 0, 0, 1, 1,
0.3313965, 1.519126, -0.764721, 1, 0, 0, 1, 1,
0.333313, -1.636349, 2.382219, 1, 0, 0, 1, 1,
0.3343254, 1.297734, 1.457462, 0, 0, 0, 1, 1,
0.3353799, 0.620165, -0.1646033, 0, 0, 0, 1, 1,
0.3365576, 1.896811, -0.5306768, 0, 0, 0, 1, 1,
0.3405967, -1.77921, 1.436401, 0, 0, 0, 1, 1,
0.3469618, 0.7172669, 0.008137679, 0, 0, 0, 1, 1,
0.3475956, 1.508096, -0.1961973, 0, 0, 0, 1, 1,
0.349964, 1.383718, 0.2604427, 0, 0, 0, 1, 1,
0.3515838, 1.988926, -1.072673, 1, 1, 1, 1, 1,
0.3526266, -0.4618793, 2.971529, 1, 1, 1, 1, 1,
0.3532447, -0.1423174, 2.294926, 1, 1, 1, 1, 1,
0.3532697, -0.8950106, 3.832241, 1, 1, 1, 1, 1,
0.3574985, -0.290317, 0.6622998, 1, 1, 1, 1, 1,
0.3588246, 0.3821483, 0.9870738, 1, 1, 1, 1, 1,
0.3630048, 1.378541, 0.3079119, 1, 1, 1, 1, 1,
0.3641629, -0.3398638, 2.180287, 1, 1, 1, 1, 1,
0.3664243, -0.7910516, 2.505572, 1, 1, 1, 1, 1,
0.3709005, -0.1219466, 1.087736, 1, 1, 1, 1, 1,
0.3746704, 0.7470539, 0.2013299, 1, 1, 1, 1, 1,
0.3813875, -0.01079878, 1.071863, 1, 1, 1, 1, 1,
0.3823799, -1.05838, 3.40076, 1, 1, 1, 1, 1,
0.3850561, -0.03343132, 1.668816, 1, 1, 1, 1, 1,
0.3852037, 0.9846681, -1.173133, 1, 1, 1, 1, 1,
0.3865218, -1.216512, 2.387409, 0, 0, 1, 1, 1,
0.3886156, 0.3401737, 1.124653, 1, 0, 0, 1, 1,
0.3908667, 0.2755541, 1.152474, 1, 0, 0, 1, 1,
0.3920056, 0.6731004, 0.8723915, 1, 0, 0, 1, 1,
0.3932852, 0.1587375, 1.938095, 1, 0, 0, 1, 1,
0.3952336, -0.06383596, 1.788339, 1, 0, 0, 1, 1,
0.3953178, -0.2356631, 1.720091, 0, 0, 0, 1, 1,
0.3954427, -0.740005, 2.839631, 0, 0, 0, 1, 1,
0.4016379, 1.944914, 1.193859, 0, 0, 0, 1, 1,
0.402369, 1.780001, 0.1790107, 0, 0, 0, 1, 1,
0.4026653, -0.9052762, 1.911647, 0, 0, 0, 1, 1,
0.406583, 1.90954, 1.810521, 0, 0, 0, 1, 1,
0.4065971, -0.1775171, 1.101193, 0, 0, 0, 1, 1,
0.4069441, -0.5335332, 2.442307, 1, 1, 1, 1, 1,
0.411401, -1.401015, 2.666898, 1, 1, 1, 1, 1,
0.41398, 1.321265, -0.1411215, 1, 1, 1, 1, 1,
0.4175272, 0.3337551, 1.722589, 1, 1, 1, 1, 1,
0.425194, -0.6433471, 3.267868, 1, 1, 1, 1, 1,
0.4254717, 2.15446, -1.67191, 1, 1, 1, 1, 1,
0.4258077, -0.03325407, 1.982883, 1, 1, 1, 1, 1,
0.4301209, 0.7053329, 0.9399976, 1, 1, 1, 1, 1,
0.4314175, 0.5150625, -0.6021836, 1, 1, 1, 1, 1,
0.4316259, 0.7485062, 1.819517, 1, 1, 1, 1, 1,
0.4402871, -2.986249, 3.509143, 1, 1, 1, 1, 1,
0.4436209, 1.579622, 1.723373, 1, 1, 1, 1, 1,
0.4443726, -0.2689602, 1.781964, 1, 1, 1, 1, 1,
0.445018, 0.6190925, 0.4020226, 1, 1, 1, 1, 1,
0.4498918, 1.682451, 1.089958, 1, 1, 1, 1, 1,
0.4499049, -0.8755366, 1.506638, 0, 0, 1, 1, 1,
0.4517513, -1.454121, 4.065444, 1, 0, 0, 1, 1,
0.4585647, 1.242822, 3.143929, 1, 0, 0, 1, 1,
0.4631396, -0.7268291, 2.485682, 1, 0, 0, 1, 1,
0.4637506, -1.229094, 4.942518, 1, 0, 0, 1, 1,
0.4731148, -0.8092396, -0.5479864, 1, 0, 0, 1, 1,
0.4740171, -0.5582639, 1.171954, 0, 0, 0, 1, 1,
0.4789286, 0.2954867, 1.171683, 0, 0, 0, 1, 1,
0.480287, -0.08960389, 1.925231, 0, 0, 0, 1, 1,
0.4835282, 0.8396298, 1.074218, 0, 0, 0, 1, 1,
0.483675, -0.8188801, 4.337466, 0, 0, 0, 1, 1,
0.4846072, -1.643873, 3.463422, 0, 0, 0, 1, 1,
0.4974712, -1.563004, 1.823285, 0, 0, 0, 1, 1,
0.4987542, -0.8958043, 0.5656605, 1, 1, 1, 1, 1,
0.5000121, -0.8309545, 2.664657, 1, 1, 1, 1, 1,
0.5005159, 0.5867115, 1.426624, 1, 1, 1, 1, 1,
0.505818, 0.3685056, -0.6913369, 1, 1, 1, 1, 1,
0.5115324, -1.093536, 2.693509, 1, 1, 1, 1, 1,
0.5130779, 1.756672, 2.345388, 1, 1, 1, 1, 1,
0.5136234, 0.1136018, 4.194788, 1, 1, 1, 1, 1,
0.5149222, 0.41198, -1.305089, 1, 1, 1, 1, 1,
0.5169323, 2.144029, 1.19398, 1, 1, 1, 1, 1,
0.5177536, 0.0008758124, 1.175342, 1, 1, 1, 1, 1,
0.5178127, -0.8855187, 3.409086, 1, 1, 1, 1, 1,
0.5182232, 2.697825, 1.088055, 1, 1, 1, 1, 1,
0.5199891, 2.127492, -0.4102146, 1, 1, 1, 1, 1,
0.5206511, 0.5741212, 0.9360699, 1, 1, 1, 1, 1,
0.5225511, 0.03990659, 2.03151, 1, 1, 1, 1, 1,
0.522843, -0.08600923, 2.913506, 0, 0, 1, 1, 1,
0.5231373, 1.058153, 2.035915, 1, 0, 0, 1, 1,
0.5281292, -1.937864, 2.184975, 1, 0, 0, 1, 1,
0.5327742, -0.1361417, 1.165717, 1, 0, 0, 1, 1,
0.534086, 1.372083, 0.4550907, 1, 0, 0, 1, 1,
0.5360822, 0.8601153, 0.6239672, 1, 0, 0, 1, 1,
0.5364187, 0.2975689, 2.076679, 0, 0, 0, 1, 1,
0.5468256, -0.03193273, 1.589322, 0, 0, 0, 1, 1,
0.5592768, 1.193635, -0.7144329, 0, 0, 0, 1, 1,
0.56733, 0.6145999, 0.02948347, 0, 0, 0, 1, 1,
0.5681764, -0.6308882, 1.026175, 0, 0, 0, 1, 1,
0.5741471, -0.8189409, 1.935107, 0, 0, 0, 1, 1,
0.5767279, 0.2201342, 1.19535, 0, 0, 0, 1, 1,
0.5783947, 1.699897, -0.3168338, 1, 1, 1, 1, 1,
0.5793887, -0.587769, 3.828243, 1, 1, 1, 1, 1,
0.5800956, 0.4597691, 1.243646, 1, 1, 1, 1, 1,
0.5860091, -2.217635, 5.487126, 1, 1, 1, 1, 1,
0.5899484, -0.3148218, 1.921571, 1, 1, 1, 1, 1,
0.5902762, 0.4955727, 0.4484751, 1, 1, 1, 1, 1,
0.5941167, -0.003470587, 3.165952, 1, 1, 1, 1, 1,
0.5992085, -0.8711308, 2.977521, 1, 1, 1, 1, 1,
0.5992546, -1.443916, 1.110261, 1, 1, 1, 1, 1,
0.5995451, -1.448392, 1.540159, 1, 1, 1, 1, 1,
0.6023433, -0.5884652, 2.193391, 1, 1, 1, 1, 1,
0.6071271, -2.005586, 3.513758, 1, 1, 1, 1, 1,
0.6076669, 0.06250756, 1.241829, 1, 1, 1, 1, 1,
0.6105452, -0.7550099, 2.829345, 1, 1, 1, 1, 1,
0.6146571, -0.06240796, 3.531816, 1, 1, 1, 1, 1,
0.6155169, -0.2845992, 3.396741, 0, 0, 1, 1, 1,
0.6166941, 0.5881488, 0.7270213, 1, 0, 0, 1, 1,
0.617466, -0.4860727, 2.350114, 1, 0, 0, 1, 1,
0.6271639, -1.192541, 4.057246, 1, 0, 0, 1, 1,
0.6284207, -0.1019021, 1.459055, 1, 0, 0, 1, 1,
0.6286238, 1.232802, 1.012962, 1, 0, 0, 1, 1,
0.6308479, -0.4995737, 3.183003, 0, 0, 0, 1, 1,
0.6313942, -1.465283, 1.682658, 0, 0, 0, 1, 1,
0.6328123, 0.5816014, 1.538668, 0, 0, 0, 1, 1,
0.6338164, -0.1677794, 2.60796, 0, 0, 0, 1, 1,
0.6366456, 0.2722845, 0.663966, 0, 0, 0, 1, 1,
0.6419412, 0.2137433, 1.324514, 0, 0, 0, 1, 1,
0.6454505, -0.7389985, 3.068017, 0, 0, 0, 1, 1,
0.6456056, -1.715851, 3.783226, 1, 1, 1, 1, 1,
0.6475236, 0.06811727, 1.800926, 1, 1, 1, 1, 1,
0.6516401, 1.630372, 0.641144, 1, 1, 1, 1, 1,
0.6521416, -1.677104, 1.267518, 1, 1, 1, 1, 1,
0.658919, -0.1785036, 3.555798, 1, 1, 1, 1, 1,
0.660729, 0.3048761, 0.7541761, 1, 1, 1, 1, 1,
0.6663964, -0.2079205, 1.518991, 1, 1, 1, 1, 1,
0.6680387, -0.3761674, 2.703943, 1, 1, 1, 1, 1,
0.6699021, 2.42533, -0.03202784, 1, 1, 1, 1, 1,
0.6722862, -2.259101, 2.599423, 1, 1, 1, 1, 1,
0.6749423, -0.6660359, 1.23443, 1, 1, 1, 1, 1,
0.6785209, -0.679231, 1.921377, 1, 1, 1, 1, 1,
0.6826485, -0.07531805, -0.1166267, 1, 1, 1, 1, 1,
0.6826592, -0.5362445, 3.854748, 1, 1, 1, 1, 1,
0.6937758, 0.9495732, 0.3383057, 1, 1, 1, 1, 1,
0.6959789, -0.1385537, 1.805766, 0, 0, 1, 1, 1,
0.6966084, 0.2790228, 1.946632, 1, 0, 0, 1, 1,
0.7006449, 0.5088218, 0.2185341, 1, 0, 0, 1, 1,
0.7051492, -0.5959482, 1.218448, 1, 0, 0, 1, 1,
0.7076149, 0.9516358, 1.609912, 1, 0, 0, 1, 1,
0.7100277, 0.1948404, 2.316782, 1, 0, 0, 1, 1,
0.7134697, -0.03138054, 0.4287836, 0, 0, 0, 1, 1,
0.7135791, -0.06796581, 2.606076, 0, 0, 0, 1, 1,
0.7170768, 0.7074769, -0.08575075, 0, 0, 0, 1, 1,
0.7186624, 0.2003996, 1.575584, 0, 0, 0, 1, 1,
0.7187416, -0.09163103, -1.534688, 0, 0, 0, 1, 1,
0.7193168, -0.2385186, 1.452771, 0, 0, 0, 1, 1,
0.7211681, 1.648055, 0.6203647, 0, 0, 0, 1, 1,
0.7238362, 1.59834, 0.853035, 1, 1, 1, 1, 1,
0.7293193, 1.356067, 0.736607, 1, 1, 1, 1, 1,
0.7372417, 0.4326047, 1.902086, 1, 1, 1, 1, 1,
0.7415658, 0.4957628, 2.727213, 1, 1, 1, 1, 1,
0.7454574, 0.1088158, 1.233885, 1, 1, 1, 1, 1,
0.7462153, -2.175275, 2.353448, 1, 1, 1, 1, 1,
0.74841, -1.449757, 2.221056, 1, 1, 1, 1, 1,
0.7513522, 0.4538293, 0.8217189, 1, 1, 1, 1, 1,
0.7564647, 0.01817401, 3.356395, 1, 1, 1, 1, 1,
0.7655318, -0.3703275, 2.190042, 1, 1, 1, 1, 1,
0.7687375, 0.4513077, -0.4631183, 1, 1, 1, 1, 1,
0.7687526, -0.7984314, 1.826006, 1, 1, 1, 1, 1,
0.7704038, -0.7352047, 2.501984, 1, 1, 1, 1, 1,
0.773568, -0.3157706, 1.377956, 1, 1, 1, 1, 1,
0.7754603, -0.1196149, 0.974573, 1, 1, 1, 1, 1,
0.7863914, 1.088641, 0.6051701, 0, 0, 1, 1, 1,
0.7866398, -0.09471714, 3.185065, 1, 0, 0, 1, 1,
0.7886831, 0.1122937, 3.082349, 1, 0, 0, 1, 1,
0.7925916, 0.07377933, 2.22069, 1, 0, 0, 1, 1,
0.7928359, -1.445045, 4.180171, 1, 0, 0, 1, 1,
0.7936654, -0.1029233, 2.80153, 1, 0, 0, 1, 1,
0.7949943, -0.5720283, 3.173918, 0, 0, 0, 1, 1,
0.7957654, 1.054531, 1.68997, 0, 0, 0, 1, 1,
0.8011809, 1.00553, -1.114342, 0, 0, 0, 1, 1,
0.8015753, 0.1333077, 0.5660387, 0, 0, 0, 1, 1,
0.8128091, -0.611846, 1.397231, 0, 0, 0, 1, 1,
0.8152902, -0.2365364, 1.640035, 0, 0, 0, 1, 1,
0.8201428, 1.187294, -0.7549303, 0, 0, 0, 1, 1,
0.8204018, -1.101836, 2.703491, 1, 1, 1, 1, 1,
0.8231304, 0.8964595, 0.05042517, 1, 1, 1, 1, 1,
0.82757, -1.243252, 2.273748, 1, 1, 1, 1, 1,
0.8282187, 1.581201, -1.365358, 1, 1, 1, 1, 1,
0.8290561, -0.3292665, 2.500417, 1, 1, 1, 1, 1,
0.8306452, -0.5814962, 3.495341, 1, 1, 1, 1, 1,
0.8355774, -0.07254411, 2.10178, 1, 1, 1, 1, 1,
0.8374954, -0.5206264, -0.3911955, 1, 1, 1, 1, 1,
0.8375593, -1.150215, 2.952855, 1, 1, 1, 1, 1,
0.8384161, -0.6599739, 2.895155, 1, 1, 1, 1, 1,
0.8424084, 0.5571663, 0.7067046, 1, 1, 1, 1, 1,
0.8440611, 0.6700004, 2.002235, 1, 1, 1, 1, 1,
0.8453833, 0.7401986, -0.4201561, 1, 1, 1, 1, 1,
0.8495443, 0.7900241, 1.814596, 1, 1, 1, 1, 1,
0.8549885, 1.673672, 1.133639, 1, 1, 1, 1, 1,
0.8556734, 0.5568121, -0.08877441, 0, 0, 1, 1, 1,
0.8559527, -1.697852, 1.78565, 1, 0, 0, 1, 1,
0.8562902, 1.31336, 1.178111, 1, 0, 0, 1, 1,
0.8605137, 0.2032503, 1.100193, 1, 0, 0, 1, 1,
0.8638499, -0.4168891, 1.06603, 1, 0, 0, 1, 1,
0.864119, -1.458459, 2.180787, 1, 0, 0, 1, 1,
0.8689421, 1.270167, 0.1631789, 0, 0, 0, 1, 1,
0.8734262, -0.01699747, 1.099285, 0, 0, 0, 1, 1,
0.8775442, -1.733013, 2.166915, 0, 0, 0, 1, 1,
0.8784786, 0.19302, 1.024238, 0, 0, 0, 1, 1,
0.8789393, -1.046244, 2.026975, 0, 0, 0, 1, 1,
0.8866578, -0.2927592, 2.421189, 0, 0, 0, 1, 1,
0.8944833, -1.81029, 2.933712, 0, 0, 0, 1, 1,
0.8945875, -0.1924445, 1.244019, 1, 1, 1, 1, 1,
0.898587, -0.03885065, 3.256399, 1, 1, 1, 1, 1,
0.9009376, 0.4220703, 0.6329765, 1, 1, 1, 1, 1,
0.9018822, 0.7061719, 0.4335845, 1, 1, 1, 1, 1,
0.9106555, 1.153197, -0.09893693, 1, 1, 1, 1, 1,
0.9173529, 1.229419, 0.8750202, 1, 1, 1, 1, 1,
0.9292883, 0.1062063, 1.797063, 1, 1, 1, 1, 1,
0.9356638, -0.6607497, 2.410591, 1, 1, 1, 1, 1,
0.9398037, 0.5186285, 1.268175, 1, 1, 1, 1, 1,
0.9508018, -0.07045829, 2.215072, 1, 1, 1, 1, 1,
0.954056, -0.01850254, 0.7683226, 1, 1, 1, 1, 1,
0.9560682, -1.379385, 2.656006, 1, 1, 1, 1, 1,
0.9674972, 0.7347009, 0.8943473, 1, 1, 1, 1, 1,
0.974726, -1.841971, 2.140852, 1, 1, 1, 1, 1,
0.9762675, -1.818726, 1.920384, 1, 1, 1, 1, 1,
0.9839121, 1.41233, 2.284089, 0, 0, 1, 1, 1,
0.985747, -0.07411347, 1.605616, 1, 0, 0, 1, 1,
0.9860353, -1.595907, 2.118868, 1, 0, 0, 1, 1,
0.9881247, -0.8628049, 1.808536, 1, 0, 0, 1, 1,
0.991539, -2.370148, 2.740399, 1, 0, 0, 1, 1,
1.000612, -0.5308371, 1.508889, 1, 0, 0, 1, 1,
1.002028, 0.2454582, -0.8427275, 0, 0, 0, 1, 1,
1.007607, 0.2292953, -1.08273, 0, 0, 0, 1, 1,
1.008942, -0.854975, 1.145468, 0, 0, 0, 1, 1,
1.012508, -0.413071, 2.906977, 0, 0, 0, 1, 1,
1.015375, -0.8441269, 1.129804, 0, 0, 0, 1, 1,
1.017664, -1.079288, 2.426208, 0, 0, 0, 1, 1,
1.028763, -0.1123394, 2.2988, 0, 0, 0, 1, 1,
1.04122, -1.268052, 1.167459, 1, 1, 1, 1, 1,
1.046919, -0.3871259, 2.495292, 1, 1, 1, 1, 1,
1.05078, -1.44592, 2.670974, 1, 1, 1, 1, 1,
1.053423, -0.026028, 1.326938, 1, 1, 1, 1, 1,
1.065127, -1.128007, 2.322537, 1, 1, 1, 1, 1,
1.068142, -0.5007123, 2.039391, 1, 1, 1, 1, 1,
1.068237, 1.554318, 0.2250823, 1, 1, 1, 1, 1,
1.069684, -1.994895, 3.626441, 1, 1, 1, 1, 1,
1.071088, 2.09488, -1.43257, 1, 1, 1, 1, 1,
1.073662, -0.2501271, 0.2199339, 1, 1, 1, 1, 1,
1.083907, 1.601964, -1.127301, 1, 1, 1, 1, 1,
1.087554, -1.255457, 4.506058, 1, 1, 1, 1, 1,
1.088408, -1.260351, 3.175294, 1, 1, 1, 1, 1,
1.102962, -1.019599, 2.50738, 1, 1, 1, 1, 1,
1.107462, 0.9381716, 1.430885, 1, 1, 1, 1, 1,
1.123907, -0.3688762, 2.986388, 0, 0, 1, 1, 1,
1.123911, -2.108691, 3.184443, 1, 0, 0, 1, 1,
1.132351, 0.4510873, 2.599001, 1, 0, 0, 1, 1,
1.1334, -0.08688049, 2.854107, 1, 0, 0, 1, 1,
1.146052, -0.5212185, 3.873764, 1, 0, 0, 1, 1,
1.158703, 0.07079948, 2.158005, 1, 0, 0, 1, 1,
1.163384, -0.1896806, -0.4540079, 0, 0, 0, 1, 1,
1.180584, -0.08468182, 1.321461, 0, 0, 0, 1, 1,
1.183715, -1.907772, 2.704077, 0, 0, 0, 1, 1,
1.184096, -1.31884, 2.272246, 0, 0, 0, 1, 1,
1.188277, -0.7350613, 2.349234, 0, 0, 0, 1, 1,
1.197316, -1.123003, 3.068637, 0, 0, 0, 1, 1,
1.204779, -0.490604, 3.09468, 0, 0, 0, 1, 1,
1.216972, 0.7441691, 2.42122, 1, 1, 1, 1, 1,
1.231012, -0.31798, 0.9433657, 1, 1, 1, 1, 1,
1.232739, -0.7477862, 2.419023, 1, 1, 1, 1, 1,
1.235895, 2.292598, 0.05533902, 1, 1, 1, 1, 1,
1.240601, 1.266948, 0.6405438, 1, 1, 1, 1, 1,
1.265584, -0.04414417, 3.486983, 1, 1, 1, 1, 1,
1.266038, -1.044296, 2.765142, 1, 1, 1, 1, 1,
1.268124, 0.5466097, 1.271997, 1, 1, 1, 1, 1,
1.275801, -0.8749714, 4.86667, 1, 1, 1, 1, 1,
1.276537, 0.9552497, 0.765799, 1, 1, 1, 1, 1,
1.295585, 0.5029677, -0.08686754, 1, 1, 1, 1, 1,
1.300434, -0.9134108, 3.5341, 1, 1, 1, 1, 1,
1.306443, 0.4454717, 1.492032, 1, 1, 1, 1, 1,
1.310544, -0.279196, 0.7134553, 1, 1, 1, 1, 1,
1.311116, -0.8767328, 1.060262, 1, 1, 1, 1, 1,
1.321336, -0.05229757, 1.763412, 0, 0, 1, 1, 1,
1.331364, 0.6851536, 1.715702, 1, 0, 0, 1, 1,
1.34107, 0.1935991, 1.551122, 1, 0, 0, 1, 1,
1.344035, -0.2191179, 1.299865, 1, 0, 0, 1, 1,
1.344064, -1.63728, 2.633536, 1, 0, 0, 1, 1,
1.351918, -0.07759846, 0.289518, 1, 0, 0, 1, 1,
1.35281, 0.03171388, 1.840769, 0, 0, 0, 1, 1,
1.355531, 0.4342206, 1.727267, 0, 0, 0, 1, 1,
1.357618, -0.6825426, 1.630521, 0, 0, 0, 1, 1,
1.372963, 0.764367, 0.6156136, 0, 0, 0, 1, 1,
1.382561, 1.869966, 1.550701, 0, 0, 0, 1, 1,
1.422359, -0.4615337, 3.949151, 0, 0, 0, 1, 1,
1.429062, 1.305744, 2.359086, 0, 0, 0, 1, 1,
1.431381, 0.2583266, 1.97373, 1, 1, 1, 1, 1,
1.433724, -0.554351, 2.924636, 1, 1, 1, 1, 1,
1.436603, 0.7066987, 1.547122, 1, 1, 1, 1, 1,
1.437111, -0.8772248, 3.106046, 1, 1, 1, 1, 1,
1.445475, 0.7145628, 0.4594002, 1, 1, 1, 1, 1,
1.462071, 0.5063605, 2.485302, 1, 1, 1, 1, 1,
1.4638, 0.2299728, 0.1380315, 1, 1, 1, 1, 1,
1.467233, 1.264274, 3.039018, 1, 1, 1, 1, 1,
1.492406, 1.204661, 0.984812, 1, 1, 1, 1, 1,
1.493643, -0.4626975, 1.682699, 1, 1, 1, 1, 1,
1.498359, -1.305425, 4.082882, 1, 1, 1, 1, 1,
1.501066, 0.4795921, 1.832663, 1, 1, 1, 1, 1,
1.504491, 0.6656005, 1.166886, 1, 1, 1, 1, 1,
1.514433, -0.518831, 2.558909, 1, 1, 1, 1, 1,
1.517018, 1.163464, 0.9958614, 1, 1, 1, 1, 1,
1.519977, 0.9912742, 0.5062499, 0, 0, 1, 1, 1,
1.520888, -0.8340076, 2.2191, 1, 0, 0, 1, 1,
1.522207, -0.02206535, 2.243688, 1, 0, 0, 1, 1,
1.535446, -2.010194, 2.144184, 1, 0, 0, 1, 1,
1.53831, -1.252479, 1.095084, 1, 0, 0, 1, 1,
1.542307, 0.4498826, 4.950086, 1, 0, 0, 1, 1,
1.543092, 0.5568741, 1.928963, 0, 0, 0, 1, 1,
1.543835, 0.1374221, 2.431046, 0, 0, 0, 1, 1,
1.554295, 2.406823, -0.3640448, 0, 0, 0, 1, 1,
1.556463, 0.4957193, 0.07228668, 0, 0, 0, 1, 1,
1.566071, 1.051047, 0.4083682, 0, 0, 0, 1, 1,
1.568187, 0.6160943, 2.204398, 0, 0, 0, 1, 1,
1.578361, -0.1138253, 3.684245, 0, 0, 0, 1, 1,
1.589758, 0.9683803, 2.006362, 1, 1, 1, 1, 1,
1.589818, -0.1427893, 1.32287, 1, 1, 1, 1, 1,
1.595833, 0.6437755, 0.7348193, 1, 1, 1, 1, 1,
1.60632, -0.03682901, 1.325156, 1, 1, 1, 1, 1,
1.611104, -0.4977867, 3.05461, 1, 1, 1, 1, 1,
1.633465, -1.295084, 2.706119, 1, 1, 1, 1, 1,
1.635344, 1.086453, 1.788521, 1, 1, 1, 1, 1,
1.652085, -1.089219, 2.510374, 1, 1, 1, 1, 1,
1.678892, -2.072808, 3.013655, 1, 1, 1, 1, 1,
1.681015, -1.188841, 1.900066, 1, 1, 1, 1, 1,
1.683432, 0.4439928, 1.751217, 1, 1, 1, 1, 1,
1.694382, 0.2485627, 2.00292, 1, 1, 1, 1, 1,
1.709767, -1.316839, 2.380488, 1, 1, 1, 1, 1,
1.715605, 0.2283477, 2.525566, 1, 1, 1, 1, 1,
1.728472, 1.191969, 0.3683394, 1, 1, 1, 1, 1,
1.728623, -0.3377565, 2.422437, 0, 0, 1, 1, 1,
1.738126, 1.220023, 1.608349, 1, 0, 0, 1, 1,
1.74604, -0.7914569, 0.7220852, 1, 0, 0, 1, 1,
1.750624, 0.5313061, 1.762534, 1, 0, 0, 1, 1,
1.763206, 0.01229886, 0.3809535, 1, 0, 0, 1, 1,
1.770978, -0.979914, 0.4317649, 1, 0, 0, 1, 1,
1.775925, 1.335189, 1.642199, 0, 0, 0, 1, 1,
1.783411, -1.493896, 1.542048, 0, 0, 0, 1, 1,
1.787522, 0.4309984, 3.534995, 0, 0, 0, 1, 1,
1.792806, 0.2439476, 1.587105, 0, 0, 0, 1, 1,
1.804547, -0.3875976, 3.312894, 0, 0, 0, 1, 1,
1.806738, -0.5657545, 1.720808, 0, 0, 0, 1, 1,
1.821121, 0.04435514, 0.7464152, 0, 0, 0, 1, 1,
1.82816, -0.08783656, 1.874282, 1, 1, 1, 1, 1,
1.829386, 0.1508096, 1.989004, 1, 1, 1, 1, 1,
1.830542, 1.369994, -0.4524617, 1, 1, 1, 1, 1,
1.87212, -0.05736112, 3.672985, 1, 1, 1, 1, 1,
1.875585, -1.633176, 1.652412, 1, 1, 1, 1, 1,
1.881735, -0.6537615, 1.951087, 1, 1, 1, 1, 1,
1.882111, 0.1436225, 2.189157, 1, 1, 1, 1, 1,
1.903262, 0.2086221, 0.7858184, 1, 1, 1, 1, 1,
1.937578, -0.3468895, 0.7532737, 1, 1, 1, 1, 1,
1.970298, 2.618627, -0.8004364, 1, 1, 1, 1, 1,
1.993139, 0.5252956, 1.966457, 1, 1, 1, 1, 1,
2.001997, -0.8155895, 2.0723, 1, 1, 1, 1, 1,
2.004024, -0.4300631, 2.921214, 1, 1, 1, 1, 1,
2.004818, -0.2269902, 2.662105, 1, 1, 1, 1, 1,
2.01666, 0.1990825, 1.834043, 1, 1, 1, 1, 1,
2.016792, -1.6093, 2.170161, 0, 0, 1, 1, 1,
2.023448, -0.8359311, 2.416244, 1, 0, 0, 1, 1,
2.091522, -0.793954, 3.464881, 1, 0, 0, 1, 1,
2.107087, -0.578455, 1.869746, 1, 0, 0, 1, 1,
2.109292, -1.396884, 2.090079, 1, 0, 0, 1, 1,
2.12519, -0.04612216, 0.5568241, 1, 0, 0, 1, 1,
2.156911, -0.9945765, 2.630656, 0, 0, 0, 1, 1,
2.184361, 0.5887801, -0.08103069, 0, 0, 0, 1, 1,
2.194145, 0.6058513, -0.6094211, 0, 0, 0, 1, 1,
2.210817, 0.6287624, 1.38442, 0, 0, 0, 1, 1,
2.229042, 1.433077, 0.5791664, 0, 0, 0, 1, 1,
2.274193, -0.8689336, 0.8080584, 0, 0, 0, 1, 1,
2.332912, -0.6401067, 0.4836819, 0, 0, 0, 1, 1,
2.404393, -2.103894, 2.684957, 1, 1, 1, 1, 1,
2.417426, -1.695204, 1.833082, 1, 1, 1, 1, 1,
2.506663, -1.602962, 2.181451, 1, 1, 1, 1, 1,
2.543471, -2.123115, 2.947774, 1, 1, 1, 1, 1,
2.676314, -0.08589448, 0.2605575, 1, 1, 1, 1, 1,
3.019288, -0.04928281, 1.041124, 1, 1, 1, 1, 1,
3.312789, -1.088526, 0.6575016, 1, 1, 1, 1, 1
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
var radius = 9.945907;
var distance = 34.93458;
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
mvMatrix.translate( -0.01262522, 0.1438466, -0.6961427 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.93458);
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
