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
-3.509529, -1.65134, -2.320527, 1, 0, 0, 1,
-2.876228, -0.7465962, -0.6488723, 1, 0.007843138, 0, 1,
-2.800931, -0.4221693, -2.143154, 1, 0.01176471, 0, 1,
-2.643478, 0.2073297, -1.759984, 1, 0.01960784, 0, 1,
-2.549413, -0.5290422, -1.312848, 1, 0.02352941, 0, 1,
-2.488632, -0.4198912, -2.115437, 1, 0.03137255, 0, 1,
-2.435879, -0.1779743, -0.2915344, 1, 0.03529412, 0, 1,
-2.400917, 0.01219816, -1.53582, 1, 0.04313726, 0, 1,
-2.353889, 0.2118483, -2.945584, 1, 0.04705882, 0, 1,
-2.260621, 1.394579, -1.471816, 1, 0.05490196, 0, 1,
-2.242562, 0.02681973, -2.682663, 1, 0.05882353, 0, 1,
-2.218474, -0.666865, -1.607952, 1, 0.06666667, 0, 1,
-2.214209, -0.3907715, -2.453175, 1, 0.07058824, 0, 1,
-2.204432, -0.8066001, -2.236334, 1, 0.07843138, 0, 1,
-2.187817, 0.3446575, -0.6860625, 1, 0.08235294, 0, 1,
-2.174742, -9.019161e-05, -1.334361, 1, 0.09019608, 0, 1,
-2.150901, 0.4424227, -2.355781, 1, 0.09411765, 0, 1,
-2.119485, -1.591949, -0.6717222, 1, 0.1019608, 0, 1,
-2.105469, 0.9285369, -0.8987545, 1, 0.1098039, 0, 1,
-2.050205, 1.210966, -1.647123, 1, 0.1137255, 0, 1,
-2.012487, -0.7491904, -0.5891977, 1, 0.1215686, 0, 1,
-1.989918, 0.2580312, -0.2291483, 1, 0.1254902, 0, 1,
-1.971112, -0.3670731, 0.2894963, 1, 0.1333333, 0, 1,
-1.96485, 0.05273947, -0.8962501, 1, 0.1372549, 0, 1,
-1.955828, -0.0112264, -1.762616, 1, 0.145098, 0, 1,
-1.909473, 2.182694, -1.66976, 1, 0.1490196, 0, 1,
-1.904765, -0.1295992, -1.632944, 1, 0.1568628, 0, 1,
-1.902381, -0.4396324, -0.6493084, 1, 0.1607843, 0, 1,
-1.89987, -0.5493387, -1.524812, 1, 0.1686275, 0, 1,
-1.897825, 2.585764, -1.995497, 1, 0.172549, 0, 1,
-1.895458, -0.3268684, -2.126017, 1, 0.1803922, 0, 1,
-1.885678, -0.7576734, -1.540963, 1, 0.1843137, 0, 1,
-1.874435, -0.7312154, -0.5344944, 1, 0.1921569, 0, 1,
-1.85961, 0.5772371, -0.2015392, 1, 0.1960784, 0, 1,
-1.853725, -0.4770624, -1.196362, 1, 0.2039216, 0, 1,
-1.85063, 0.4626403, 0.3303918, 1, 0.2117647, 0, 1,
-1.839263, -0.6733961, -3.409006, 1, 0.2156863, 0, 1,
-1.827488, -1.464091, -4.627119, 1, 0.2235294, 0, 1,
-1.797441, -0.8917306, -3.04154, 1, 0.227451, 0, 1,
-1.789356, 1.618094, 0.5416924, 1, 0.2352941, 0, 1,
-1.759308, 0.666888, -1.447484, 1, 0.2392157, 0, 1,
-1.756741, 0.3833511, -0.1278469, 1, 0.2470588, 0, 1,
-1.746218, 1.276005, -1.0043, 1, 0.2509804, 0, 1,
-1.724621, 0.8309808, -1.642505, 1, 0.2588235, 0, 1,
-1.715119, 0.7487292, -0.2128665, 1, 0.2627451, 0, 1,
-1.714143, 0.7523164, -1.374469, 1, 0.2705882, 0, 1,
-1.664208, 0.6618255, -1.521853, 1, 0.2745098, 0, 1,
-1.658999, 0.9956976, -1.339501, 1, 0.282353, 0, 1,
-1.657359, -0.3010557, -1.621187, 1, 0.2862745, 0, 1,
-1.654557, 0.8269338, -1.437283, 1, 0.2941177, 0, 1,
-1.650389, 1.039037, -1.828608, 1, 0.3019608, 0, 1,
-1.650361, 0.3192733, -0.968577, 1, 0.3058824, 0, 1,
-1.640397, -0.500531, -2.620826, 1, 0.3137255, 0, 1,
-1.632794, 0.07129722, -2.239266, 1, 0.3176471, 0, 1,
-1.632346, 0.1029135, -1.147368, 1, 0.3254902, 0, 1,
-1.624325, 1.139046, -0.6656169, 1, 0.3294118, 0, 1,
-1.621161, 1.61043, -0.8780817, 1, 0.3372549, 0, 1,
-1.615676, -0.4127138, -2.337552, 1, 0.3411765, 0, 1,
-1.612261, -0.4210597, -1.560922, 1, 0.3490196, 0, 1,
-1.603531, 1.015686, -0.6615145, 1, 0.3529412, 0, 1,
-1.599542, 1.046225, -0.08111879, 1, 0.3607843, 0, 1,
-1.596774, 0.1534149, -0.4044969, 1, 0.3647059, 0, 1,
-1.576408, 0.02073829, -1.322132, 1, 0.372549, 0, 1,
-1.550213, -0.3879162, -2.36553, 1, 0.3764706, 0, 1,
-1.545536, -0.2082127, -2.225096, 1, 0.3843137, 0, 1,
-1.545074, 0.5347776, -2.189473, 1, 0.3882353, 0, 1,
-1.540953, 1.201725, -1.032809, 1, 0.3960784, 0, 1,
-1.530149, 1.08234, -0.8964501, 1, 0.4039216, 0, 1,
-1.527923, 0.7875925, -0.6079946, 1, 0.4078431, 0, 1,
-1.520815, 0.1870722, -1.625781, 1, 0.4156863, 0, 1,
-1.517371, 0.8724387, -1.785082, 1, 0.4196078, 0, 1,
-1.516199, -0.2208377, -3.420005, 1, 0.427451, 0, 1,
-1.512919, 0.1245371, -0.7394288, 1, 0.4313726, 0, 1,
-1.509176, -1.158945, -2.78944, 1, 0.4392157, 0, 1,
-1.499931, 1.441243, -2.672302, 1, 0.4431373, 0, 1,
-1.490317, 1.067596, -1.12396, 1, 0.4509804, 0, 1,
-1.4742, -1.901388, -3.944529, 1, 0.454902, 0, 1,
-1.457467, 2.628157, -0.06032176, 1, 0.4627451, 0, 1,
-1.435835, -1.043389, -3.548442, 1, 0.4666667, 0, 1,
-1.434686, 0.6979488, -2.38808, 1, 0.4745098, 0, 1,
-1.414107, -0.01455817, -0.9538302, 1, 0.4784314, 0, 1,
-1.411374, -0.807484, -0.9178062, 1, 0.4862745, 0, 1,
-1.406374, 1.821083, 0.9427262, 1, 0.4901961, 0, 1,
-1.390432, 1.337577, 0.309567, 1, 0.4980392, 0, 1,
-1.379035, 0.7257441, -1.642056, 1, 0.5058824, 0, 1,
-1.370717, 1.38632, 0.5618238, 1, 0.509804, 0, 1,
-1.364941, 0.1365609, -0.4521347, 1, 0.5176471, 0, 1,
-1.358862, 0.3926037, -1.265216, 1, 0.5215687, 0, 1,
-1.34939, -0.9658179, -3.35601, 1, 0.5294118, 0, 1,
-1.344013, -0.2371627, -1.86963, 1, 0.5333334, 0, 1,
-1.339448, -0.2791989, -3.052825, 1, 0.5411765, 0, 1,
-1.335763, 0.2897768, -1.201128, 1, 0.5450981, 0, 1,
-1.32598, -0.9375571, -2.404234, 1, 0.5529412, 0, 1,
-1.321659, -0.9465731, -3.300445, 1, 0.5568628, 0, 1,
-1.313717, 0.001843827, -1.968909, 1, 0.5647059, 0, 1,
-1.305004, 0.1866793, -0.5251186, 1, 0.5686275, 0, 1,
-1.299214, 2.148415, 0.624904, 1, 0.5764706, 0, 1,
-1.292967, 0.2427794, -1.399708, 1, 0.5803922, 0, 1,
-1.281821, 0.008592012, 0.6114349, 1, 0.5882353, 0, 1,
-1.280105, 0.3430565, -0.9320036, 1, 0.5921569, 0, 1,
-1.273137, -0.9796926, -0.6862123, 1, 0.6, 0, 1,
-1.271784, -0.5819981, -1.950446, 1, 0.6078432, 0, 1,
-1.269246, -1.439939, -1.424342, 1, 0.6117647, 0, 1,
-1.267399, 0.8111584, -0.2680106, 1, 0.6196079, 0, 1,
-1.267021, -0.7433804, -2.786283, 1, 0.6235294, 0, 1,
-1.265604, -0.3811724, -2.817677, 1, 0.6313726, 0, 1,
-1.264346, 0.6149218, -1.652233, 1, 0.6352941, 0, 1,
-1.261998, -1.546703, -1.033628, 1, 0.6431373, 0, 1,
-1.248397, -2.453297, -2.439942, 1, 0.6470588, 0, 1,
-1.239186, -2.234249, -3.833971, 1, 0.654902, 0, 1,
-1.239172, -0.0392308, -2.405368, 1, 0.6588235, 0, 1,
-1.238156, 1.998383, -1.290206, 1, 0.6666667, 0, 1,
-1.234305, 0.7400927, -0.2428776, 1, 0.6705883, 0, 1,
-1.228629, 0.5064204, -2.465019, 1, 0.6784314, 0, 1,
-1.227728, 0.6953551, -0.6953079, 1, 0.682353, 0, 1,
-1.223526, 0.558856, -0.611056, 1, 0.6901961, 0, 1,
-1.222565, 0.5985827, 1.665731, 1, 0.6941177, 0, 1,
-1.220232, 0.7298062, 0.2471403, 1, 0.7019608, 0, 1,
-1.2161, 0.5844933, 0.3062327, 1, 0.7098039, 0, 1,
-1.211057, 0.6131073, 1.047435, 1, 0.7137255, 0, 1,
-1.207042, -0.1736319, -1.845574, 1, 0.7215686, 0, 1,
-1.200208, 0.292628, -0.2612953, 1, 0.7254902, 0, 1,
-1.200161, 0.05007138, -2.134501, 1, 0.7333333, 0, 1,
-1.199193, 0.2480431, -1.947904, 1, 0.7372549, 0, 1,
-1.191144, 0.6213024, -1.664671, 1, 0.7450981, 0, 1,
-1.182434, 1.743726, -0.9450071, 1, 0.7490196, 0, 1,
-1.181204, 0.7509633, -2.772866, 1, 0.7568628, 0, 1,
-1.179441, 1.245123, -1.065934, 1, 0.7607843, 0, 1,
-1.163078, 1.904425, -1.196449, 1, 0.7686275, 0, 1,
-1.160348, -0.658774, -1.897044, 1, 0.772549, 0, 1,
-1.137231, -0.1796399, -1.923458, 1, 0.7803922, 0, 1,
-1.131575, -0.9214865, -2.772109, 1, 0.7843137, 0, 1,
-1.12824, -0.5217791, -1.32042, 1, 0.7921569, 0, 1,
-1.125654, -1.428098, -1.43002, 1, 0.7960784, 0, 1,
-1.120206, -1.93718, -1.112579, 1, 0.8039216, 0, 1,
-1.11997, 1.289147, -1.0507, 1, 0.8117647, 0, 1,
-1.115349, 0.6595906, -0.7289206, 1, 0.8156863, 0, 1,
-1.109386, -0.5082088, -2.771161, 1, 0.8235294, 0, 1,
-1.109133, 0.7332643, -0.3851361, 1, 0.827451, 0, 1,
-1.106851, -0.8289159, -1.646307, 1, 0.8352941, 0, 1,
-1.085274, 2.193627, 0.1905775, 1, 0.8392157, 0, 1,
-1.078903, 1.046692, 0.01423672, 1, 0.8470588, 0, 1,
-1.078016, 0.88704, 0.1015148, 1, 0.8509804, 0, 1,
-1.075766, -0.1034911, -1.86619, 1, 0.8588235, 0, 1,
-1.070258, -1.960904, -0.3749484, 1, 0.8627451, 0, 1,
-1.06844, 0.5966572, -2.14023, 1, 0.8705882, 0, 1,
-1.061546, -1.112638, -3.615035, 1, 0.8745098, 0, 1,
-1.052643, 1.22511, 1.285544, 1, 0.8823529, 0, 1,
-1.0488, -0.007664479, -0.8619475, 1, 0.8862745, 0, 1,
-1.048792, 2.511216, -0.5294895, 1, 0.8941177, 0, 1,
-1.046895, 1.058781, -0.3349991, 1, 0.8980392, 0, 1,
-1.04623, -2.699067, -3.178812, 1, 0.9058824, 0, 1,
-1.04501, -0.5715804, 0.1422338, 1, 0.9137255, 0, 1,
-1.043702, 1.9938, 0.7188445, 1, 0.9176471, 0, 1,
-1.040631, 0.4453156, -1.300892, 1, 0.9254902, 0, 1,
-1.035872, 0.8847489, 0.5654537, 1, 0.9294118, 0, 1,
-1.031315, 0.6023619, -1.333316, 1, 0.9372549, 0, 1,
-1.02655, 0.3289564, -1.965358, 1, 0.9411765, 0, 1,
-1.02315, 0.1910724, -1.71889, 1, 0.9490196, 0, 1,
-1.019534, -0.9361902, -2.646167, 1, 0.9529412, 0, 1,
-1.01559, 1.699427, -1.672876, 1, 0.9607843, 0, 1,
-1.015568, -0.5974278, -0.1003744, 1, 0.9647059, 0, 1,
-1.013411, -0.00577803, -2.182514, 1, 0.972549, 0, 1,
-1.010977, 0.07355616, -1.491972, 1, 0.9764706, 0, 1,
-1.009174, 1.165314, -0.3758533, 1, 0.9843137, 0, 1,
-1.002835, 0.6468928, -0.459033, 1, 0.9882353, 0, 1,
-1.000262, -0.07324865, -1.786698, 1, 0.9960784, 0, 1,
-0.9977146, -0.06629533, -3.278384, 0.9960784, 1, 0, 1,
-0.9952572, -1.68082, -2.086766, 0.9921569, 1, 0, 1,
-0.9935604, 1.89077, -1.589729, 0.9843137, 1, 0, 1,
-0.9931228, 0.4251113, -2.730109, 0.9803922, 1, 0, 1,
-0.985373, -1.508318, -2.360745, 0.972549, 1, 0, 1,
-0.9803265, -1.10257, -2.454474, 0.9686275, 1, 0, 1,
-0.9772444, 0.1363682, -0.8650913, 0.9607843, 1, 0, 1,
-0.9770339, -1.574388, 0.0009162519, 0.9568627, 1, 0, 1,
-0.9757212, -0.05379918, -0.9935545, 0.9490196, 1, 0, 1,
-0.9646401, -0.2674268, -1.705474, 0.945098, 1, 0, 1,
-0.9588705, 0.5153716, -0.8623984, 0.9372549, 1, 0, 1,
-0.9588316, 1.667902, -0.2436348, 0.9333333, 1, 0, 1,
-0.9585204, -2.240664, -2.125154, 0.9254902, 1, 0, 1,
-0.948381, -0.1322181, -0.2636715, 0.9215686, 1, 0, 1,
-0.9455638, -1.434438, -2.537689, 0.9137255, 1, 0, 1,
-0.9202688, -1.273993, -1.768189, 0.9098039, 1, 0, 1,
-0.9199272, -0.8162219, -2.536343, 0.9019608, 1, 0, 1,
-0.918495, 0.3295568, -0.8893287, 0.8941177, 1, 0, 1,
-0.9157982, -0.5121326, -0.8545708, 0.8901961, 1, 0, 1,
-0.9152141, 0.0930078, -2.35541, 0.8823529, 1, 0, 1,
-0.9115376, 0.4568037, -2.36893, 0.8784314, 1, 0, 1,
-0.9106292, -0.5319579, -1.155923, 0.8705882, 1, 0, 1,
-0.9044338, -0.1590436, -2.978224, 0.8666667, 1, 0, 1,
-0.9038264, -0.7170229, -2.88876, 0.8588235, 1, 0, 1,
-0.9007722, -0.203545, -0.3545794, 0.854902, 1, 0, 1,
-0.8967139, -0.2249648, -0.9614128, 0.8470588, 1, 0, 1,
-0.8966088, -0.08193659, -1.010869, 0.8431373, 1, 0, 1,
-0.8916408, 0.2880219, -3.149338, 0.8352941, 1, 0, 1,
-0.8896894, -0.4472187, -2.735766, 0.8313726, 1, 0, 1,
-0.8874819, -0.6569978, -2.345295, 0.8235294, 1, 0, 1,
-0.8874785, -0.4037133, -3.215509, 0.8196079, 1, 0, 1,
-0.8851975, -0.101776, -3.409959, 0.8117647, 1, 0, 1,
-0.8840992, 1.176795, 0.9202887, 0.8078431, 1, 0, 1,
-0.883553, -1.701027, -1.905428, 0.8, 1, 0, 1,
-0.8703029, -0.4706698, -0.8909433, 0.7921569, 1, 0, 1,
-0.869103, 1.159434, -0.6820428, 0.7882353, 1, 0, 1,
-0.8687325, 0.3583004, -0.3705279, 0.7803922, 1, 0, 1,
-0.8669614, -0.05324028, -1.025002, 0.7764706, 1, 0, 1,
-0.8636971, -0.2267419, -3.359143, 0.7686275, 1, 0, 1,
-0.862781, 1.058098, -1.429886, 0.7647059, 1, 0, 1,
-0.8626127, -0.3162413, -2.084606, 0.7568628, 1, 0, 1,
-0.8586789, 2.416599, -0.8186557, 0.7529412, 1, 0, 1,
-0.8567669, -0.3791454, -0.710387, 0.7450981, 1, 0, 1,
-0.8533427, 0.5718018, 0.2562345, 0.7411765, 1, 0, 1,
-0.8497156, -0.2936113, -2.722027, 0.7333333, 1, 0, 1,
-0.8488083, 0.3788583, -3.139286, 0.7294118, 1, 0, 1,
-0.8471134, -0.3204152, -2.002485, 0.7215686, 1, 0, 1,
-0.8454072, 1.455963, -0.8183808, 0.7176471, 1, 0, 1,
-0.8453151, 0.7405918, -0.3061271, 0.7098039, 1, 0, 1,
-0.8446622, 0.04271707, -1.829841, 0.7058824, 1, 0, 1,
-0.8348602, -0.1365418, -0.928856, 0.6980392, 1, 0, 1,
-0.8139139, 0.05125654, -3.853703, 0.6901961, 1, 0, 1,
-0.8127716, 1.105351, -0.4763468, 0.6862745, 1, 0, 1,
-0.8122523, -1.020017, -4.124269, 0.6784314, 1, 0, 1,
-0.8099575, 1.497577, -0.849419, 0.6745098, 1, 0, 1,
-0.8067492, 0.9640512, -1.451762, 0.6666667, 1, 0, 1,
-0.8057297, 0.8742352, -0.04985305, 0.6627451, 1, 0, 1,
-0.7990699, -0.7786027, -1.738944, 0.654902, 1, 0, 1,
-0.7970083, 0.2000924, -2.001296, 0.6509804, 1, 0, 1,
-0.7949892, 0.1484985, -1.767453, 0.6431373, 1, 0, 1,
-0.7929367, 0.3396373, -1.760843, 0.6392157, 1, 0, 1,
-0.7834169, -0.3217048, -2.951091, 0.6313726, 1, 0, 1,
-0.7822041, -0.5162567, -2.763971, 0.627451, 1, 0, 1,
-0.7807936, -1.049393, -1.369271, 0.6196079, 1, 0, 1,
-0.7732717, -1.262269, -2.904373, 0.6156863, 1, 0, 1,
-0.7710163, -0.2696232, -2.650554, 0.6078432, 1, 0, 1,
-0.7708527, -1.552014, -3.27987, 0.6039216, 1, 0, 1,
-0.7698756, -0.8674312, -2.44532, 0.5960785, 1, 0, 1,
-0.7683192, -1.139281, -2.481977, 0.5882353, 1, 0, 1,
-0.7518502, -0.1377348, -0.4873746, 0.5843138, 1, 0, 1,
-0.7502993, -0.279915, -1.27994, 0.5764706, 1, 0, 1,
-0.7500138, -0.5395812, -4.01324, 0.572549, 1, 0, 1,
-0.7479054, 1.268968, -1.903121, 0.5647059, 1, 0, 1,
-0.7450728, -0.2595512, -1.410052, 0.5607843, 1, 0, 1,
-0.7442662, -0.8584619, -2.180544, 0.5529412, 1, 0, 1,
-0.7435492, 0.9408584, -0.9936572, 0.5490196, 1, 0, 1,
-0.7426502, -1.896734, -3.15595, 0.5411765, 1, 0, 1,
-0.7387998, -2.02926, -4.078767, 0.5372549, 1, 0, 1,
-0.7375146, -0.05163707, -1.445339, 0.5294118, 1, 0, 1,
-0.7345526, 1.847854, 0.416973, 0.5254902, 1, 0, 1,
-0.7226266, 0.0243741, -3.337913, 0.5176471, 1, 0, 1,
-0.7223258, -0.1958512, -2.343619, 0.5137255, 1, 0, 1,
-0.7197435, -1.34623, -3.446249, 0.5058824, 1, 0, 1,
-0.7158091, -1.171151, -4.42123, 0.5019608, 1, 0, 1,
-0.7152687, -1.753969, -2.439954, 0.4941176, 1, 0, 1,
-0.7134975, -0.816292, -3.805516, 0.4862745, 1, 0, 1,
-0.7077044, -1.031176, -1.890417, 0.4823529, 1, 0, 1,
-0.70044, 1.74262, -0.9660419, 0.4745098, 1, 0, 1,
-0.6900291, 0.7341097, 0.3175117, 0.4705882, 1, 0, 1,
-0.6849171, -1.632593, -4.249369, 0.4627451, 1, 0, 1,
-0.684795, 0.3626381, -2.08951, 0.4588235, 1, 0, 1,
-0.6846878, 0.160974, -0.483293, 0.4509804, 1, 0, 1,
-0.6825464, -0.6350017, -1.193693, 0.4470588, 1, 0, 1,
-0.6801855, -1.14474, -3.131394, 0.4392157, 1, 0, 1,
-0.6765869, -0.3188763, 0.1318974, 0.4352941, 1, 0, 1,
-0.6741314, 1.146765, -0.7497071, 0.427451, 1, 0, 1,
-0.6736426, 0.9283572, -1.267462, 0.4235294, 1, 0, 1,
-0.6719541, 0.5749676, 2.128526, 0.4156863, 1, 0, 1,
-0.6692749, -1.256, -4.685623, 0.4117647, 1, 0, 1,
-0.6666031, -1.26697, -2.994876, 0.4039216, 1, 0, 1,
-0.6646185, -0.6100041, -3.456858, 0.3960784, 1, 0, 1,
-0.6636111, -0.8692163, -2.62467, 0.3921569, 1, 0, 1,
-0.6632154, 0.2959204, -1.167019, 0.3843137, 1, 0, 1,
-0.6623059, -0.1421106, -1.906753, 0.3803922, 1, 0, 1,
-0.661601, -1.095978, -4.215505, 0.372549, 1, 0, 1,
-0.6603231, 0.6105102, 0.3451989, 0.3686275, 1, 0, 1,
-0.6576699, 1.839878, 1.3552, 0.3607843, 1, 0, 1,
-0.6536943, 0.9518781, -2.695186, 0.3568628, 1, 0, 1,
-0.6536486, -0.009958802, -1.082481, 0.3490196, 1, 0, 1,
-0.6523409, 0.8336284, -2.376405, 0.345098, 1, 0, 1,
-0.651338, 0.4856887, -1.283721, 0.3372549, 1, 0, 1,
-0.6512445, 0.5317996, -0.5500649, 0.3333333, 1, 0, 1,
-0.6411943, 2.590218, 1.502016, 0.3254902, 1, 0, 1,
-0.641095, -0.1362568, -1.475907, 0.3215686, 1, 0, 1,
-0.6393549, -1.593584, -3.322792, 0.3137255, 1, 0, 1,
-0.6363969, -0.2425723, -2.323888, 0.3098039, 1, 0, 1,
-0.6360534, 0.1761026, -1.500154, 0.3019608, 1, 0, 1,
-0.6360246, 0.861616, -1.238191, 0.2941177, 1, 0, 1,
-0.6317053, 0.8488801, -0.7320133, 0.2901961, 1, 0, 1,
-0.6276035, -1.036566, -3.225401, 0.282353, 1, 0, 1,
-0.6234536, -0.3091549, -1.819103, 0.2784314, 1, 0, 1,
-0.6230764, 0.285093, -1.419316, 0.2705882, 1, 0, 1,
-0.6219348, -0.03857165, -1.70181, 0.2666667, 1, 0, 1,
-0.6212626, -0.03442997, -2.869086, 0.2588235, 1, 0, 1,
-0.6185685, 0.3690517, -1.842692, 0.254902, 1, 0, 1,
-0.6149724, -1.135703, -2.413811, 0.2470588, 1, 0, 1,
-0.6137209, -0.7043834, -4.448128, 0.2431373, 1, 0, 1,
-0.5996442, 0.4150496, -1.689906, 0.2352941, 1, 0, 1,
-0.5914241, -0.04522881, -2.581362, 0.2313726, 1, 0, 1,
-0.5831206, 0.8113582, -1.071478, 0.2235294, 1, 0, 1,
-0.5830922, 0.2163745, -0.09944112, 0.2196078, 1, 0, 1,
-0.575543, -0.8413376, -1.793085, 0.2117647, 1, 0, 1,
-0.5713018, 0.8076799, -0.05985567, 0.2078431, 1, 0, 1,
-0.5703328, 1.495029, -0.7712827, 0.2, 1, 0, 1,
-0.5689905, -1.266353, -1.790613, 0.1921569, 1, 0, 1,
-0.5641015, 0.1040224, -1.039084, 0.1882353, 1, 0, 1,
-0.5516922, 0.6434956, -0.4813614, 0.1803922, 1, 0, 1,
-0.5370085, -0.3402105, -1.219075, 0.1764706, 1, 0, 1,
-0.5351788, 0.6357876, -2.315325, 0.1686275, 1, 0, 1,
-0.5337952, -1.43843, -3.17032, 0.1647059, 1, 0, 1,
-0.5336694, 0.6987095, -1.037851, 0.1568628, 1, 0, 1,
-0.5273684, 0.373669, -0.9443568, 0.1529412, 1, 0, 1,
-0.5245721, -0.1208075, 1.174029, 0.145098, 1, 0, 1,
-0.5230935, 1.189316, -0.2989473, 0.1411765, 1, 0, 1,
-0.5213852, 0.6547288, -0.3055405, 0.1333333, 1, 0, 1,
-0.5203224, -0.844983, -2.679005, 0.1294118, 1, 0, 1,
-0.5195693, 0.1267064, -1.266056, 0.1215686, 1, 0, 1,
-0.5173134, -0.5002999, -1.508448, 0.1176471, 1, 0, 1,
-0.5149246, 0.4826187, -2.438374, 0.1098039, 1, 0, 1,
-0.5113801, -0.1948631, -1.709768, 0.1058824, 1, 0, 1,
-0.5101773, -0.6832739, -3.969517, 0.09803922, 1, 0, 1,
-0.5092237, -1.180255, -4.157597, 0.09019608, 1, 0, 1,
-0.5073081, -0.8592102, -2.791554, 0.08627451, 1, 0, 1,
-0.503868, 0.4376816, -1.31205, 0.07843138, 1, 0, 1,
-0.5037137, -0.2788891, -2.039992, 0.07450981, 1, 0, 1,
-0.5023798, 0.2346647, 1.124056, 0.06666667, 1, 0, 1,
-0.4947614, 0.5942727, -0.9432816, 0.0627451, 1, 0, 1,
-0.492471, 1.008572, -1.794913, 0.05490196, 1, 0, 1,
-0.48588, -0.1313595, -1.342008, 0.05098039, 1, 0, 1,
-0.485321, -0.4251078, -2.094015, 0.04313726, 1, 0, 1,
-0.4829071, -0.9571939, -0.8404393, 0.03921569, 1, 0, 1,
-0.4799714, 0.03701451, -0.9572811, 0.03137255, 1, 0, 1,
-0.4798438, -0.7844637, -4.232182, 0.02745098, 1, 0, 1,
-0.4790309, 0.3234723, -2.802037, 0.01960784, 1, 0, 1,
-0.4784074, -0.8856174, -1.844087, 0.01568628, 1, 0, 1,
-0.4750779, 1.443613, 1.84058, 0.007843138, 1, 0, 1,
-0.4748848, -0.7300199, -2.261698, 0.003921569, 1, 0, 1,
-0.4742977, 1.578233, -0.622515, 0, 1, 0.003921569, 1,
-0.4715007, -0.3405645, -2.510074, 0, 1, 0.01176471, 1,
-0.4695235, -1.480246, -4.021832, 0, 1, 0.01568628, 1,
-0.46766, 0.6533317, 0.2008824, 0, 1, 0.02352941, 1,
-0.4665952, -0.6386028, -3.620813, 0, 1, 0.02745098, 1,
-0.4658552, -1.437822, -2.126673, 0, 1, 0.03529412, 1,
-0.4625757, -1.332044, -2.968287, 0, 1, 0.03921569, 1,
-0.461233, 0.18432, -0.3981096, 0, 1, 0.04705882, 1,
-0.4566105, -0.2367303, -1.975354, 0, 1, 0.05098039, 1,
-0.4545366, 1.199698, -0.7601476, 0, 1, 0.05882353, 1,
-0.4479831, -1.855806, -3.835703, 0, 1, 0.0627451, 1,
-0.4464264, -0.6158902, -3.016389, 0, 1, 0.07058824, 1,
-0.4436662, 0.0124791, -2.340692, 0, 1, 0.07450981, 1,
-0.4282161, 0.01216629, -3.002392, 0, 1, 0.08235294, 1,
-0.4234738, 1.10357, -0.6312432, 0, 1, 0.08627451, 1,
-0.4206523, -1.831231, -2.102085, 0, 1, 0.09411765, 1,
-0.41968, 1.651089, -0.6982352, 0, 1, 0.1019608, 1,
-0.4171009, 0.285524, -1.411937, 0, 1, 0.1058824, 1,
-0.4160743, -0.1736041, -3.007766, 0, 1, 0.1137255, 1,
-0.4154271, -0.3385864, -2.291537, 0, 1, 0.1176471, 1,
-0.4129726, -1.647548, -3.579119, 0, 1, 0.1254902, 1,
-0.4121542, -0.4776581, -2.523805, 0, 1, 0.1294118, 1,
-0.4103148, -0.9692016, -3.858175, 0, 1, 0.1372549, 1,
-0.4089313, -0.4122989, -1.247588, 0, 1, 0.1411765, 1,
-0.4025202, 0.5641506, -0.03937268, 0, 1, 0.1490196, 1,
-0.3978679, 1.864334, -0.6496386, 0, 1, 0.1529412, 1,
-0.3930857, -1.299387, -4.174603, 0, 1, 0.1607843, 1,
-0.3927083, 1.756061, 0.3015161, 0, 1, 0.1647059, 1,
-0.3844203, 0.7604765, 0.8221533, 0, 1, 0.172549, 1,
-0.3739825, -0.4758224, -2.421526, 0, 1, 0.1764706, 1,
-0.3739227, -1.157458, -2.742527, 0, 1, 0.1843137, 1,
-0.3706482, -0.3941839, -0.7461866, 0, 1, 0.1882353, 1,
-0.3669384, 0.7743229, -1.587113, 0, 1, 0.1960784, 1,
-0.3600513, -0.9107925, -3.169076, 0, 1, 0.2039216, 1,
-0.3596858, 0.181485, 0.04872089, 0, 1, 0.2078431, 1,
-0.3535851, 1.272762, -0.4027851, 0, 1, 0.2156863, 1,
-0.3528876, -1.542919, -4.639412, 0, 1, 0.2196078, 1,
-0.3437733, 1.845171, 0.1903156, 0, 1, 0.227451, 1,
-0.3437657, -0.1936517, -2.395348, 0, 1, 0.2313726, 1,
-0.3418454, -0.2162724, -3.73, 0, 1, 0.2392157, 1,
-0.3403692, -0.850643, -3.078292, 0, 1, 0.2431373, 1,
-0.3333818, -0.1516893, -0.4755177, 0, 1, 0.2509804, 1,
-0.3328104, 2.153628, -0.5091614, 0, 1, 0.254902, 1,
-0.3260705, -1.411137, -3.195889, 0, 1, 0.2627451, 1,
-0.3229454, 0.5046405, -0.1975958, 0, 1, 0.2666667, 1,
-0.3188238, -1.247768, -3.350709, 0, 1, 0.2745098, 1,
-0.3131281, 0.431156, -1.610885, 0, 1, 0.2784314, 1,
-0.3129752, 0.6132941, 0.2011257, 0, 1, 0.2862745, 1,
-0.3114289, 1.121012, 0.06643863, 0, 1, 0.2901961, 1,
-0.3013756, -0.8075284, -1.996534, 0, 1, 0.2980392, 1,
-0.2963698, -0.4529635, -2.920989, 0, 1, 0.3058824, 1,
-0.2959594, 0.1831863, -1.706039, 0, 1, 0.3098039, 1,
-0.2897814, -0.2505809, -2.750876, 0, 1, 0.3176471, 1,
-0.2885427, -0.09213625, -1.567513, 0, 1, 0.3215686, 1,
-0.2856663, 0.6682445, 0.4899392, 0, 1, 0.3294118, 1,
-0.2833762, 1.106548, -0.4735081, 0, 1, 0.3333333, 1,
-0.2788883, -0.2763099, -2.994454, 0, 1, 0.3411765, 1,
-0.273909, 0.2826053, 0.6789696, 0, 1, 0.345098, 1,
-0.2659901, 1.171427, -1.609131, 0, 1, 0.3529412, 1,
-0.2641982, 2.513597, 0.6744839, 0, 1, 0.3568628, 1,
-0.2626704, 1.017393, -0.2946038, 0, 1, 0.3647059, 1,
-0.260718, 0.5271981, -1.340276, 0, 1, 0.3686275, 1,
-0.2590671, -0.0100886, -0.05086679, 0, 1, 0.3764706, 1,
-0.2547071, -0.01283718, -2.013638, 0, 1, 0.3803922, 1,
-0.2463768, -1.210816, -2.120161, 0, 1, 0.3882353, 1,
-0.2439069, -1.787558, -3.405656, 0, 1, 0.3921569, 1,
-0.2422497, -0.8461608, -3.225311, 0, 1, 0.4, 1,
-0.2409291, -1.578792, -2.770916, 0, 1, 0.4078431, 1,
-0.2394472, 0.3284152, -0.1221509, 0, 1, 0.4117647, 1,
-0.2375465, -0.9092227, -2.34981, 0, 1, 0.4196078, 1,
-0.2371175, -0.888054, -2.585072, 0, 1, 0.4235294, 1,
-0.2359909, -0.7993037, -0.7350257, 0, 1, 0.4313726, 1,
-0.2357386, 1.035918, -1.781093, 0, 1, 0.4352941, 1,
-0.2332267, -0.1261857, -0.273462, 0, 1, 0.4431373, 1,
-0.2321625, -0.2507392, -2.937095, 0, 1, 0.4470588, 1,
-0.2309221, 0.8848522, -0.9866418, 0, 1, 0.454902, 1,
-0.230354, 2.467269, 1.063856, 0, 1, 0.4588235, 1,
-0.2270889, 0.2816305, 0.7557639, 0, 1, 0.4666667, 1,
-0.2262682, -0.434919, -4.689051, 0, 1, 0.4705882, 1,
-0.2234723, -1.312051, -0.6827754, 0, 1, 0.4784314, 1,
-0.2213178, -0.8530518, -1.258659, 0, 1, 0.4823529, 1,
-0.220167, -0.3807292, -1.95391, 0, 1, 0.4901961, 1,
-0.2162144, -0.6468199, -3.634837, 0, 1, 0.4941176, 1,
-0.2113023, -1.562254, -3.339856, 0, 1, 0.5019608, 1,
-0.2023286, 1.191157, -0.01221365, 0, 1, 0.509804, 1,
-0.1996459, 1.251985, -0.5948094, 0, 1, 0.5137255, 1,
-0.1981095, -0.04399408, -2.773589, 0, 1, 0.5215687, 1,
-0.1969774, -0.3907185, -2.77071, 0, 1, 0.5254902, 1,
-0.1895176, 0.02926782, -2.126609, 0, 1, 0.5333334, 1,
-0.1895173, 1.210553, 0.4773163, 0, 1, 0.5372549, 1,
-0.1858036, 0.4859621, -0.4675093, 0, 1, 0.5450981, 1,
-0.1832182, -0.1496279, -1.457864, 0, 1, 0.5490196, 1,
-0.1832001, -0.4777834, -3.371435, 0, 1, 0.5568628, 1,
-0.1830776, 0.3050007, 0.07447384, 0, 1, 0.5607843, 1,
-0.1799592, -0.9524348, -3.184329, 0, 1, 0.5686275, 1,
-0.1786756, -0.302944, -2.805177, 0, 1, 0.572549, 1,
-0.1777513, 1.005687, -1.586982, 0, 1, 0.5803922, 1,
-0.1765153, 0.1394397, -2.282565, 0, 1, 0.5843138, 1,
-0.1756272, -1.197231, -2.460454, 0, 1, 0.5921569, 1,
-0.1680012, -0.01103643, -1.812474, 0, 1, 0.5960785, 1,
-0.1667881, -0.9749358, -1.372436, 0, 1, 0.6039216, 1,
-0.1617419, -0.9207706, -3.074353, 0, 1, 0.6117647, 1,
-0.1569761, -0.1344868, -1.668872, 0, 1, 0.6156863, 1,
-0.1548884, 0.4830054, 1.176904, 0, 1, 0.6235294, 1,
-0.1514177, -0.7729103, -2.048519, 0, 1, 0.627451, 1,
-0.1509321, -0.8922563, -3.878941, 0, 1, 0.6352941, 1,
-0.1490865, 1.488551, -0.09384853, 0, 1, 0.6392157, 1,
-0.1453501, 0.4262645, -1.932466, 0, 1, 0.6470588, 1,
-0.1403647, 1.197441, 0.4181376, 0, 1, 0.6509804, 1,
-0.1402498, -1.737007, -5.177812, 0, 1, 0.6588235, 1,
-0.1372721, -0.4868176, -1.320818, 0, 1, 0.6627451, 1,
-0.1365983, 2.582786, -0.8361369, 0, 1, 0.6705883, 1,
-0.1341366, -0.3505876, -1.831729, 0, 1, 0.6745098, 1,
-0.130654, 0.4219856, -0.8272361, 0, 1, 0.682353, 1,
-0.1304452, 0.4456336, -0.5460276, 0, 1, 0.6862745, 1,
-0.12939, 0.2113519, 0.2446976, 0, 1, 0.6941177, 1,
-0.1262446, 0.7010657, -0.1298713, 0, 1, 0.7019608, 1,
-0.1224997, 0.5033753, -6.181583e-06, 0, 1, 0.7058824, 1,
-0.1193124, -0.7849616, -1.559085, 0, 1, 0.7137255, 1,
-0.118889, -1.014154, -4.922957, 0, 1, 0.7176471, 1,
-0.1137744, 2.049126, 0.7991219, 0, 1, 0.7254902, 1,
-0.1128753, 1.123999, -1.305609, 0, 1, 0.7294118, 1,
-0.1057289, 0.3478675, -0.8015618, 0, 1, 0.7372549, 1,
-0.1038403, -0.8094359, -3.574168, 0, 1, 0.7411765, 1,
-0.1014789, 0.88485, -0.1214565, 0, 1, 0.7490196, 1,
-0.101088, -0.2369238, -3.188562, 0, 1, 0.7529412, 1,
-0.1008975, 1.128734, 1.236744, 0, 1, 0.7607843, 1,
-0.0998523, -2.240258, -4.001228, 0, 1, 0.7647059, 1,
-0.09810479, -0.3167376, -4.182106, 0, 1, 0.772549, 1,
-0.08693491, 0.6249806, -0.06161146, 0, 1, 0.7764706, 1,
-0.08630648, 0.9921741, -0.3814133, 0, 1, 0.7843137, 1,
-0.08414025, -0.8761408, -3.315982, 0, 1, 0.7882353, 1,
-0.08257867, -0.6574, -1.771029, 0, 1, 0.7960784, 1,
-0.08237411, 0.8231573, -1.295949, 0, 1, 0.8039216, 1,
-0.08169572, 1.694981, 0.9084498, 0, 1, 0.8078431, 1,
-0.08013532, 2.089185, 0.3887584, 0, 1, 0.8156863, 1,
-0.07799906, 1.124717, 0.1734596, 0, 1, 0.8196079, 1,
-0.07035543, 0.1459042, 0.1892191, 0, 1, 0.827451, 1,
-0.06970395, 0.07893581, -0.4417642, 0, 1, 0.8313726, 1,
-0.06658067, 0.9633579, 0.8109431, 0, 1, 0.8392157, 1,
-0.06129128, 0.8416278, 0.01732848, 0, 1, 0.8431373, 1,
-0.06057526, 0.1478723, 0.8091741, 0, 1, 0.8509804, 1,
-0.05852297, -0.4325729, -3.19818, 0, 1, 0.854902, 1,
-0.05825837, 1.524243, -0.5936274, 0, 1, 0.8627451, 1,
-0.05519324, 0.1270418, -1.343315, 0, 1, 0.8666667, 1,
-0.05332765, 1.083785, 0.1285186, 0, 1, 0.8745098, 1,
-0.05031343, 0.1150611, 0.2233356, 0, 1, 0.8784314, 1,
-0.04150321, -0.8544001, -3.659153, 0, 1, 0.8862745, 1,
-0.03744468, -0.2391811, -3.21406, 0, 1, 0.8901961, 1,
-0.03603214, -0.9383775, -2.628364, 0, 1, 0.8980392, 1,
-0.03239689, -1.442898, -3.960552, 0, 1, 0.9058824, 1,
-0.02805735, 0.2133878, 1.148016, 0, 1, 0.9098039, 1,
-0.02621032, 1.154557, -1.0712, 0, 1, 0.9176471, 1,
-0.02272518, -0.6739011, -4.575575, 0, 1, 0.9215686, 1,
-0.02094969, 0.8480154, -0.4756857, 0, 1, 0.9294118, 1,
-0.02030352, -0.07586487, -4.310401, 0, 1, 0.9333333, 1,
-0.01883697, 0.3240946, 0.4800668, 0, 1, 0.9411765, 1,
-0.009244159, 0.3876631, -0.00486218, 0, 1, 0.945098, 1,
-0.006502396, -0.2198853, -3.588622, 0, 1, 0.9529412, 1,
-0.003475755, -0.5571308, -2.718833, 0, 1, 0.9568627, 1,
-0.0002048817, 1.945445, -0.1755014, 0, 1, 0.9647059, 1,
0.00100685, -0.6761913, 3.045306, 0, 1, 0.9686275, 1,
0.007210983, -0.5282822, 2.671262, 0, 1, 0.9764706, 1,
0.009407949, 0.4223585, 0.9895661, 0, 1, 0.9803922, 1,
0.009935136, 0.2884348, 0.2093034, 0, 1, 0.9882353, 1,
0.01746912, 0.4655853, 0.4202015, 0, 1, 0.9921569, 1,
0.01965715, 1.755094, -1.003746, 0, 1, 1, 1,
0.02213888, -1.356585, 5.534309, 0, 0.9921569, 1, 1,
0.02364067, 0.6445176, 0.6830241, 0, 0.9882353, 1, 1,
0.02493284, -0.5868884, 1.007395, 0, 0.9803922, 1, 1,
0.02749619, -0.2313873, 2.038598, 0, 0.9764706, 1, 1,
0.02881026, 1.116769, -0.614176, 0, 0.9686275, 1, 1,
0.03341645, -2.030431, 5.848864, 0, 0.9647059, 1, 1,
0.03373999, -0.7902656, 3.401563, 0, 0.9568627, 1, 1,
0.0408568, -0.1047947, 1.231753, 0, 0.9529412, 1, 1,
0.04521163, -0.2340815, 4.103581, 0, 0.945098, 1, 1,
0.04722472, 0.3885676, -0.5208466, 0, 0.9411765, 1, 1,
0.04758062, 0.2008013, 1.009727, 0, 0.9333333, 1, 1,
0.05225782, -0.7856488, 3.129021, 0, 0.9294118, 1, 1,
0.05232295, -0.8962241, 2.500841, 0, 0.9215686, 1, 1,
0.05288636, -0.2621178, 2.794413, 0, 0.9176471, 1, 1,
0.05391029, 1.351602, -0.5816647, 0, 0.9098039, 1, 1,
0.05664616, -0.4798336, 1.426642, 0, 0.9058824, 1, 1,
0.05747374, 0.1854426, 0.4984855, 0, 0.8980392, 1, 1,
0.05925242, 0.2211739, 0.3621498, 0, 0.8901961, 1, 1,
0.06408624, -1.308225, 5.424736, 0, 0.8862745, 1, 1,
0.06527283, -0.8923692, 4.195299, 0, 0.8784314, 1, 1,
0.06635678, 0.5718758, 1.365385, 0, 0.8745098, 1, 1,
0.06652777, -0.785736, 3.024172, 0, 0.8666667, 1, 1,
0.06889179, 0.0624847, 1.674147, 0, 0.8627451, 1, 1,
0.07009274, -0.464572, 2.290171, 0, 0.854902, 1, 1,
0.08002266, 2.220246, -0.05275461, 0, 0.8509804, 1, 1,
0.08236045, 0.8897541, -0.1478318, 0, 0.8431373, 1, 1,
0.08484686, -0.6357152, 1.15712, 0, 0.8392157, 1, 1,
0.08825481, 0.2192968, 0.1118979, 0, 0.8313726, 1, 1,
0.08897018, 0.6230052, 0.5334781, 0, 0.827451, 1, 1,
0.09107434, -0.2720631, 4.433943, 0, 0.8196079, 1, 1,
0.09144253, -2.048944, 4.356066, 0, 0.8156863, 1, 1,
0.09506808, 0.08705761, -0.1332924, 0, 0.8078431, 1, 1,
0.09615201, 0.5964035, -1.052536, 0, 0.8039216, 1, 1,
0.09737173, -0.05807134, 1.03156, 0, 0.7960784, 1, 1,
0.1061084, -1.870434, 4.55228, 0, 0.7882353, 1, 1,
0.1078806, 0.5877386, 2.325913, 0, 0.7843137, 1, 1,
0.1080534, 0.5950735, 1.832804, 0, 0.7764706, 1, 1,
0.1097214, -0.06892375, 1.693508, 0, 0.772549, 1, 1,
0.1124806, -0.2652844, 1.173712, 0, 0.7647059, 1, 1,
0.1130004, -0.5604485, 1.064321, 0, 0.7607843, 1, 1,
0.1137525, -0.2388363, 2.50631, 0, 0.7529412, 1, 1,
0.1137542, 0.9073814, 0.590555, 0, 0.7490196, 1, 1,
0.116733, 0.3358447, -0.6736665, 0, 0.7411765, 1, 1,
0.1174676, 0.244566, 0.610833, 0, 0.7372549, 1, 1,
0.1180481, 1.597307, 2.184018, 0, 0.7294118, 1, 1,
0.1201111, 0.4049134, 1.260506, 0, 0.7254902, 1, 1,
0.1228114, 1.48033, 0.551284, 0, 0.7176471, 1, 1,
0.1236626, -0.7897971, 4.876102, 0, 0.7137255, 1, 1,
0.1258369, 0.5624419, 0.04027965, 0, 0.7058824, 1, 1,
0.1284391, 0.3802015, 1.278386, 0, 0.6980392, 1, 1,
0.1286495, 0.3004368, 1.576462, 0, 0.6941177, 1, 1,
0.1325374, 0.5809984, 1.425166, 0, 0.6862745, 1, 1,
0.139356, -0.7290066, 1.718308, 0, 0.682353, 1, 1,
0.1395237, 0.07915417, 0.3341343, 0, 0.6745098, 1, 1,
0.1421402, 0.9448168, -2.451597, 0, 0.6705883, 1, 1,
0.1427489, -0.6050915, 4.890734, 0, 0.6627451, 1, 1,
0.1446604, 1.321945, -0.724328, 0, 0.6588235, 1, 1,
0.1455957, 0.3676715, 2.152313, 0, 0.6509804, 1, 1,
0.1472165, 0.2923383, 0.1660515, 0, 0.6470588, 1, 1,
0.1475623, -0.3897102, 3.391039, 0, 0.6392157, 1, 1,
0.1510502, -0.477548, 2.321818, 0, 0.6352941, 1, 1,
0.1576399, -0.8476996, 3.146762, 0, 0.627451, 1, 1,
0.1609931, -1.140913, 3.949256, 0, 0.6235294, 1, 1,
0.1627019, -2.310071, 3.677067, 0, 0.6156863, 1, 1,
0.1636563, -1.406071, 4.265529, 0, 0.6117647, 1, 1,
0.1640881, 0.4491537, 0.3112111, 0, 0.6039216, 1, 1,
0.1646611, -0.9241333, 3.297017, 0, 0.5960785, 1, 1,
0.1669788, 0.2708663, 3.195423, 0, 0.5921569, 1, 1,
0.1674094, 0.8491229, 0.6931606, 0, 0.5843138, 1, 1,
0.1720403, -1.436695, 3.956331, 0, 0.5803922, 1, 1,
0.1757258, -0.05908566, 1.198746, 0, 0.572549, 1, 1,
0.1760456, -1.778055, 2.447437, 0, 0.5686275, 1, 1,
0.1761269, -1.375712, 4.264712, 0, 0.5607843, 1, 1,
0.1771453, -0.9543497, 2.309396, 0, 0.5568628, 1, 1,
0.1781572, 0.5362508, 0.624605, 0, 0.5490196, 1, 1,
0.1818571, -0.8155184, 4.519287, 0, 0.5450981, 1, 1,
0.1830389, 0.766643, 0.3141921, 0, 0.5372549, 1, 1,
0.1865819, 0.1821071, 3.202913, 0, 0.5333334, 1, 1,
0.1904866, 1.109825, -0.08407879, 0, 0.5254902, 1, 1,
0.1918235, 0.4929797, 0.3807273, 0, 0.5215687, 1, 1,
0.1963872, -1.228977, 3.036043, 0, 0.5137255, 1, 1,
0.1980363, 3.539269, -1.388617, 0, 0.509804, 1, 1,
0.2002142, -0.286786, 2.734248, 0, 0.5019608, 1, 1,
0.2015598, -0.07861497, 2.620185, 0, 0.4941176, 1, 1,
0.2023867, -0.05379868, 1.636982, 0, 0.4901961, 1, 1,
0.2042587, -1.042423, 1.800005, 0, 0.4823529, 1, 1,
0.2057717, -1.090728, 2.208962, 0, 0.4784314, 1, 1,
0.2074631, -0.3507493, 3.531619, 0, 0.4705882, 1, 1,
0.2074784, 0.02034505, 0.6024648, 0, 0.4666667, 1, 1,
0.2090936, 0.9459154, 2.48543, 0, 0.4588235, 1, 1,
0.2144495, -0.1518202, 0.9115086, 0, 0.454902, 1, 1,
0.2297256, -1.891263, 1.323896, 0, 0.4470588, 1, 1,
0.2344252, -2.000738, 4.151908, 0, 0.4431373, 1, 1,
0.2389616, 0.2604508, 0.3960159, 0, 0.4352941, 1, 1,
0.2393766, -1.594313, 1.575452, 0, 0.4313726, 1, 1,
0.2426426, -0.001603216, 0.4716451, 0, 0.4235294, 1, 1,
0.243746, -0.874955, 2.773402, 0, 0.4196078, 1, 1,
0.2441765, -0.2394898, 1.135573, 0, 0.4117647, 1, 1,
0.2445645, -0.4266695, 1.366782, 0, 0.4078431, 1, 1,
0.2450848, 0.2778671, 0.7862625, 0, 0.4, 1, 1,
0.2478301, -1.051148, 3.935716, 0, 0.3921569, 1, 1,
0.2489507, -0.6448092, 2.265509, 0, 0.3882353, 1, 1,
0.2546364, 0.9906163, -0.2574467, 0, 0.3803922, 1, 1,
0.2556185, -0.1870482, 1.389459, 0, 0.3764706, 1, 1,
0.2565713, 1.772975, 1.273393, 0, 0.3686275, 1, 1,
0.2575789, -0.07219774, 1.061384, 0, 0.3647059, 1, 1,
0.2608521, -0.7503497, 1.784228, 0, 0.3568628, 1, 1,
0.2694424, -0.00568562, 1.745861, 0, 0.3529412, 1, 1,
0.2696784, -0.7128826, 1.933667, 0, 0.345098, 1, 1,
0.2722134, 0.5216143, 0.5823368, 0, 0.3411765, 1, 1,
0.2735007, -1.740817, 2.759341, 0, 0.3333333, 1, 1,
0.2780114, 0.1426025, 2.069109, 0, 0.3294118, 1, 1,
0.2785449, -0.2507674, 3.858492, 0, 0.3215686, 1, 1,
0.2816807, 0.7723905, 1.214724, 0, 0.3176471, 1, 1,
0.2825956, 0.08189713, 0.9156232, 0, 0.3098039, 1, 1,
0.2837646, -0.07768402, 2.177032, 0, 0.3058824, 1, 1,
0.2913128, 1.080343, 0.05396722, 0, 0.2980392, 1, 1,
0.2927301, -0.4974056, 1.196348, 0, 0.2901961, 1, 1,
0.2992018, -0.1457349, 2.213555, 0, 0.2862745, 1, 1,
0.2992298, -0.7537176, 3.298345, 0, 0.2784314, 1, 1,
0.2993122, 0.6614332, -0.009102344, 0, 0.2745098, 1, 1,
0.3056679, 0.2384953, 1.675052, 0, 0.2666667, 1, 1,
0.3096766, 0.02000869, 0.6700806, 0, 0.2627451, 1, 1,
0.3103172, 1.321322, 1.581096, 0, 0.254902, 1, 1,
0.3111679, 0.5716839, 0.09769792, 0, 0.2509804, 1, 1,
0.3150759, 0.4868659, -1.748132, 0, 0.2431373, 1, 1,
0.3170132, 0.1888472, -0.344526, 0, 0.2392157, 1, 1,
0.3180392, 1.139618, 0.3283979, 0, 0.2313726, 1, 1,
0.3197661, -0.1497685, 1.075186, 0, 0.227451, 1, 1,
0.3217124, 0.6635296, 0.4852438, 0, 0.2196078, 1, 1,
0.3260618, -1.588022, 3.475039, 0, 0.2156863, 1, 1,
0.3278902, -0.6593487, 1.82957, 0, 0.2078431, 1, 1,
0.3325263, -1.751678, 2.238987, 0, 0.2039216, 1, 1,
0.3344037, -2.792111, 1.96498, 0, 0.1960784, 1, 1,
0.3459476, 1.257025, 1.044224, 0, 0.1882353, 1, 1,
0.3485848, 1.363582, -0.756985, 0, 0.1843137, 1, 1,
0.3493424, -0.03961222, 1.927691, 0, 0.1764706, 1, 1,
0.3574867, 0.1113863, 1.802312, 0, 0.172549, 1, 1,
0.3582472, 0.07730439, 1.953104, 0, 0.1647059, 1, 1,
0.3609972, -0.7192931, 2.112643, 0, 0.1607843, 1, 1,
0.3625396, -0.3433623, 0.5528247, 0, 0.1529412, 1, 1,
0.3648893, 0.737583, 0.2074192, 0, 0.1490196, 1, 1,
0.3724062, 0.6204436, 1.238537, 0, 0.1411765, 1, 1,
0.3775308, -0.6010255, 0.9840879, 0, 0.1372549, 1, 1,
0.3863259, -1.113473, 3.109735, 0, 0.1294118, 1, 1,
0.3878206, 0.1961259, -0.03662328, 0, 0.1254902, 1, 1,
0.3887396, -0.01480292, 0.7930859, 0, 0.1176471, 1, 1,
0.3915788, 0.7206265, 0.3492573, 0, 0.1137255, 1, 1,
0.3929423, -1.368672, 1.306135, 0, 0.1058824, 1, 1,
0.3989071, -0.4452365, 2.678925, 0, 0.09803922, 1, 1,
0.4004206, 0.7122189, 1.818833, 0, 0.09411765, 1, 1,
0.4017374, 0.8806612, 1.802208, 0, 0.08627451, 1, 1,
0.4082365, 0.6291354, 0.7742005, 0, 0.08235294, 1, 1,
0.4112329, -0.3383232, 1.161493, 0, 0.07450981, 1, 1,
0.4125779, -0.532495, 2.767694, 0, 0.07058824, 1, 1,
0.4142973, 0.8661757, -0.2966833, 0, 0.0627451, 1, 1,
0.4169134, 0.2269056, 2.185381, 0, 0.05882353, 1, 1,
0.4174485, 1.369519, -0.4075994, 0, 0.05098039, 1, 1,
0.4174899, 0.8128611, -0.03707095, 0, 0.04705882, 1, 1,
0.4183106, -0.7347845, 4.376336, 0, 0.03921569, 1, 1,
0.4263861, 0.9517121, 0.8673279, 0, 0.03529412, 1, 1,
0.4317238, 0.01949426, -0.1494491, 0, 0.02745098, 1, 1,
0.4346393, 0.4564976, 0.9870265, 0, 0.02352941, 1, 1,
0.4350085, 0.9120892, 0.02212385, 0, 0.01568628, 1, 1,
0.435296, -0.5366596, 2.737174, 0, 0.01176471, 1, 1,
0.4354226, 1.466774, 1.248314, 0, 0.003921569, 1, 1,
0.4361327, 1.694188, 1.618325, 0.003921569, 0, 1, 1,
0.4374757, 0.3586378, 0.4517887, 0.007843138, 0, 1, 1,
0.4393993, -0.9655027, 2.8515, 0.01568628, 0, 1, 1,
0.4414059, 0.3638815, -0.973874, 0.01960784, 0, 1, 1,
0.444432, -0.938239, 1.929433, 0.02745098, 0, 1, 1,
0.4493558, -0.500455, 3.355876, 0.03137255, 0, 1, 1,
0.4499562, 1.448977, -0.8160003, 0.03921569, 0, 1, 1,
0.4532185, 1.8846, 1.114414, 0.04313726, 0, 1, 1,
0.4557027, 0.2079514, -0.2611517, 0.05098039, 0, 1, 1,
0.4567362, -1.126726, 3.425165, 0.05490196, 0, 1, 1,
0.4580612, 0.6127343, 0.4810837, 0.0627451, 0, 1, 1,
0.4585086, 0.3009765, 2.008635, 0.06666667, 0, 1, 1,
0.4604956, 0.5666695, -0.5876476, 0.07450981, 0, 1, 1,
0.4636015, 0.2969601, -0.2165617, 0.07843138, 0, 1, 1,
0.4683934, -0.7361686, 1.838796, 0.08627451, 0, 1, 1,
0.4715855, 1.312971, -0.1514538, 0.09019608, 0, 1, 1,
0.4725261, 0.09868013, 1.271292, 0.09803922, 0, 1, 1,
0.4728638, 0.03823188, 1.390456, 0.1058824, 0, 1, 1,
0.4742545, 0.2658912, 0.3420858, 0.1098039, 0, 1, 1,
0.474636, -0.8730952, 3.317561, 0.1176471, 0, 1, 1,
0.4757493, 1.855482, -1.115196, 0.1215686, 0, 1, 1,
0.4797731, -0.1485566, 2.684562, 0.1294118, 0, 1, 1,
0.4838867, -1.198114, 3.528736, 0.1333333, 0, 1, 1,
0.4874333, 0.9164189, 1.446543, 0.1411765, 0, 1, 1,
0.4886468, 0.1270573, 1.539069, 0.145098, 0, 1, 1,
0.4891353, 1.402943, -0.2708111, 0.1529412, 0, 1, 1,
0.490757, 0.3226535, 0.02047857, 0.1568628, 0, 1, 1,
0.4908714, -2.088224, 2.11862, 0.1647059, 0, 1, 1,
0.498098, 0.7742729, -0.1126376, 0.1686275, 0, 1, 1,
0.5021043, 1.032694, 2.104909, 0.1764706, 0, 1, 1,
0.50635, 1.615749, 1.839957, 0.1803922, 0, 1, 1,
0.5093003, 0.8112061, 0.2015716, 0.1882353, 0, 1, 1,
0.5112925, -0.3198139, 3.268981, 0.1921569, 0, 1, 1,
0.5134838, -0.4101666, 1.19163, 0.2, 0, 1, 1,
0.5163792, -0.9411741, 1.321057, 0.2078431, 0, 1, 1,
0.5165119, -0.8960108, 2.968198, 0.2117647, 0, 1, 1,
0.5166207, -0.2769053, 0.6602782, 0.2196078, 0, 1, 1,
0.5178102, -1.610915, 2.498727, 0.2235294, 0, 1, 1,
0.523186, 0.8051041, 0.943992, 0.2313726, 0, 1, 1,
0.5288299, -0.3534876, 2.105856, 0.2352941, 0, 1, 1,
0.5347155, -0.7411647, 4.670704, 0.2431373, 0, 1, 1,
0.5350929, -1.271554, 4.719675, 0.2470588, 0, 1, 1,
0.5361477, -0.3732944, 1.979355, 0.254902, 0, 1, 1,
0.5394642, 0.1461553, 2.849262, 0.2588235, 0, 1, 1,
0.5407541, 0.2572685, -0.4822706, 0.2666667, 0, 1, 1,
0.5409062, 1.191409, 0.5132871, 0.2705882, 0, 1, 1,
0.541034, -1.046714, 1.771473, 0.2784314, 0, 1, 1,
0.5432765, -1.064283, 2.174506, 0.282353, 0, 1, 1,
0.5478298, -0.1948655, 1.405607, 0.2901961, 0, 1, 1,
0.5563545, 1.029567, -0.001000976, 0.2941177, 0, 1, 1,
0.5622458, -1.551628, 1.967003, 0.3019608, 0, 1, 1,
0.5645348, -0.4363013, 3.62121, 0.3098039, 0, 1, 1,
0.567516, 0.1477168, 1.609882, 0.3137255, 0, 1, 1,
0.5777053, -0.413014, 1.725452, 0.3215686, 0, 1, 1,
0.5826447, 2.206825, -0.6347758, 0.3254902, 0, 1, 1,
0.5831757, -0.530521, 1.845155, 0.3333333, 0, 1, 1,
0.5923841, -0.4292621, 3.464647, 0.3372549, 0, 1, 1,
0.6001706, -0.3965351, 2.416171, 0.345098, 0, 1, 1,
0.6058266, 1.039734, -0.09935436, 0.3490196, 0, 1, 1,
0.6066772, -1.536211, 5.52003, 0.3568628, 0, 1, 1,
0.6138804, 0.7993926, 0.9007872, 0.3607843, 0, 1, 1,
0.6154669, -0.4393495, 2.09742, 0.3686275, 0, 1, 1,
0.62186, -0.490554, 2.358558, 0.372549, 0, 1, 1,
0.6224254, 1.024856, -0.7651168, 0.3803922, 0, 1, 1,
0.622477, 0.03606397, -0.1906957, 0.3843137, 0, 1, 1,
0.6240923, -1.160481, 3.414546, 0.3921569, 0, 1, 1,
0.6293976, 0.2856508, 1.276983, 0.3960784, 0, 1, 1,
0.6312512, 0.9435597, 0.6037309, 0.4039216, 0, 1, 1,
0.6337098, 0.5879824, -0.9610493, 0.4117647, 0, 1, 1,
0.6360655, 0.4529893, 0.6069579, 0.4156863, 0, 1, 1,
0.6377739, -0.9028819, 1.724237, 0.4235294, 0, 1, 1,
0.6388264, -2.200808, 4.725483, 0.427451, 0, 1, 1,
0.6501293, 0.6188315, 2.922298, 0.4352941, 0, 1, 1,
0.6551092, -0.6340936, 1.887295, 0.4392157, 0, 1, 1,
0.6570854, 0.6487929, 0.6184724, 0.4470588, 0, 1, 1,
0.6591869, 0.7537893, 1.468026, 0.4509804, 0, 1, 1,
0.6604142, -1.111994, 1.805095, 0.4588235, 0, 1, 1,
0.6616827, -0.2205399, 0.7830588, 0.4627451, 0, 1, 1,
0.6644727, 0.3956603, 0.9928687, 0.4705882, 0, 1, 1,
0.6654772, -0.4548916, 0.8691772, 0.4745098, 0, 1, 1,
0.6657971, 0.4758033, -1.487429, 0.4823529, 0, 1, 1,
0.6704535, 1.03616, 0.9394067, 0.4862745, 0, 1, 1,
0.6720282, -1.124173, 1.386119, 0.4941176, 0, 1, 1,
0.6722691, 1.527996, -0.5331147, 0.5019608, 0, 1, 1,
0.673596, -0.5828584, 1.391639, 0.5058824, 0, 1, 1,
0.6764991, -0.8229519, 2.241494, 0.5137255, 0, 1, 1,
0.6804043, 0.245283, -0.01076424, 0.5176471, 0, 1, 1,
0.6806102, 0.04181709, 0.05079776, 0.5254902, 0, 1, 1,
0.681377, -0.1754654, 2.913105, 0.5294118, 0, 1, 1,
0.682317, 1.092362, 3.541142, 0.5372549, 0, 1, 1,
0.6877043, -0.8810057, 2.007248, 0.5411765, 0, 1, 1,
0.687786, 2.338095, -1.21676, 0.5490196, 0, 1, 1,
0.6921478, -0.519549, 2.617659, 0.5529412, 0, 1, 1,
0.6925869, 1.019687, -0.3596138, 0.5607843, 0, 1, 1,
0.6981627, -0.9887192, 2.547004, 0.5647059, 0, 1, 1,
0.7031209, -1.810335, 1.056932, 0.572549, 0, 1, 1,
0.7032852, -1.241757, 1.666979, 0.5764706, 0, 1, 1,
0.7050797, -0.5419492, 0.9055573, 0.5843138, 0, 1, 1,
0.7055054, 3.049312, 2.063303, 0.5882353, 0, 1, 1,
0.7077962, 0.04187349, 2.759974, 0.5960785, 0, 1, 1,
0.7118717, -0.8689871, 2.237728, 0.6039216, 0, 1, 1,
0.7155976, -1.647273, 4.35988, 0.6078432, 0, 1, 1,
0.719964, -2.840768, 1.6294, 0.6156863, 0, 1, 1,
0.720237, -0.8698236, 0.5199237, 0.6196079, 0, 1, 1,
0.7428271, -0.7149348, 4.164579, 0.627451, 0, 1, 1,
0.7436144, 0.3494564, -0.4488421, 0.6313726, 0, 1, 1,
0.7445979, 0.2792965, 0.1620131, 0.6392157, 0, 1, 1,
0.7553011, -0.2992193, 2.839699, 0.6431373, 0, 1, 1,
0.7576565, -0.2882217, -0.173987, 0.6509804, 0, 1, 1,
0.7620394, 0.2921135, 0.8762271, 0.654902, 0, 1, 1,
0.7632378, 0.2377675, 3.97615, 0.6627451, 0, 1, 1,
0.7757131, 0.1036423, -0.0282417, 0.6666667, 0, 1, 1,
0.7775133, 0.03706894, 1.314217, 0.6745098, 0, 1, 1,
0.7789477, -0.02751694, 0.8453589, 0.6784314, 0, 1, 1,
0.779135, -0.1637948, 2.231898, 0.6862745, 0, 1, 1,
0.7823601, 0.7216355, 0.3081289, 0.6901961, 0, 1, 1,
0.7855338, 1.183247, 0.2690215, 0.6980392, 0, 1, 1,
0.7867094, 0.4712712, -0.2191473, 0.7058824, 0, 1, 1,
0.7892146, 0.8811087, 0.009987265, 0.7098039, 0, 1, 1,
0.7893839, -0.9072219, 0.644909, 0.7176471, 0, 1, 1,
0.7949346, -1.525161, 1.876446, 0.7215686, 0, 1, 1,
0.7959881, 0.01431392, 1.081121, 0.7294118, 0, 1, 1,
0.7965186, -2.067205, 3.709956, 0.7333333, 0, 1, 1,
0.797169, 1.144897, 2.375662, 0.7411765, 0, 1, 1,
0.7977778, 0.144392, 0.6215367, 0.7450981, 0, 1, 1,
0.7987324, 0.1985393, 1.219581, 0.7529412, 0, 1, 1,
0.8003963, -0.993445, 3.74902, 0.7568628, 0, 1, 1,
0.8025506, -1.307458, 2.017377, 0.7647059, 0, 1, 1,
0.8138041, -0.1634782, 0.9517174, 0.7686275, 0, 1, 1,
0.8148285, 0.393065, 1.871228, 0.7764706, 0, 1, 1,
0.8156551, 0.8870987, 0.1816389, 0.7803922, 0, 1, 1,
0.8184103, -0.3058557, 0.895084, 0.7882353, 0, 1, 1,
0.8241279, 2.032652, 1.284211, 0.7921569, 0, 1, 1,
0.8246253, 0.5605868, 1.529764, 0.8, 0, 1, 1,
0.8288584, 0.4167962, 1.592396, 0.8078431, 0, 1, 1,
0.830985, 0.8798475, 2.296328, 0.8117647, 0, 1, 1,
0.837318, -0.316909, 2.692163, 0.8196079, 0, 1, 1,
0.8492023, 0.3082247, 2.374513, 0.8235294, 0, 1, 1,
0.8516878, 0.4081726, 2.258725, 0.8313726, 0, 1, 1,
0.8522152, -0.7984294, 2.752099, 0.8352941, 0, 1, 1,
0.8530385, -0.671556, 0.8993565, 0.8431373, 0, 1, 1,
0.8560529, 1.90231, -1.204533, 0.8470588, 0, 1, 1,
0.8594622, 1.593821, 0.3338284, 0.854902, 0, 1, 1,
0.8644896, 0.06247319, 1.771205, 0.8588235, 0, 1, 1,
0.8646498, -1.093311, 1.93229, 0.8666667, 0, 1, 1,
0.8666878, 0.3031118, 1.472473, 0.8705882, 0, 1, 1,
0.8695288, -1.997673, 2.781098, 0.8784314, 0, 1, 1,
0.8779991, -0.05005279, 0.04143928, 0.8823529, 0, 1, 1,
0.8789212, -1.850928, 4.322605, 0.8901961, 0, 1, 1,
0.8801618, -1.377597, 3.268989, 0.8941177, 0, 1, 1,
0.8861636, 1.370736, -0.5603456, 0.9019608, 0, 1, 1,
0.8898737, 1.029954, 1.726583, 0.9098039, 0, 1, 1,
0.8977628, 0.6851389, 2.818552, 0.9137255, 0, 1, 1,
0.8987693, -1.218379, 1.747811, 0.9215686, 0, 1, 1,
0.9005983, -1.047349, 0.9438475, 0.9254902, 0, 1, 1,
0.903427, 1.269322, 1.736973, 0.9333333, 0, 1, 1,
0.9041955, 1.424322, -0.6197551, 0.9372549, 0, 1, 1,
0.9044497, 2.523873, -0.4269411, 0.945098, 0, 1, 1,
0.9084637, 0.3769548, -0.4516434, 0.9490196, 0, 1, 1,
0.9091877, 1.757691, -0.8102524, 0.9568627, 0, 1, 1,
0.9120644, -0.5538103, 1.947425, 0.9607843, 0, 1, 1,
0.913964, -1.432569, 3.570263, 0.9686275, 0, 1, 1,
0.9183214, 1.991395, 1.339715, 0.972549, 0, 1, 1,
0.9201106, 1.071024, 0.7213457, 0.9803922, 0, 1, 1,
0.9203872, -1.73061, 2.638734, 0.9843137, 0, 1, 1,
0.9231927, 1.679601, 0.01843314, 0.9921569, 0, 1, 1,
0.9250146, 1.681619, 0.3911629, 0.9960784, 0, 1, 1,
0.9302808, -0.3583231, 1.885718, 1, 0, 0.9960784, 1,
0.9305467, 0.7789524, -0.2532375, 1, 0, 0.9882353, 1,
0.9361254, -0.6927003, 2.408723, 1, 0, 0.9843137, 1,
0.9381601, -0.4434181, 1.281802, 1, 0, 0.9764706, 1,
0.9423455, -0.3620316, 2.639249, 1, 0, 0.972549, 1,
0.9458239, -0.3378923, 3.159193, 1, 0, 0.9647059, 1,
0.9461829, -0.1121984, 2.663446, 1, 0, 0.9607843, 1,
0.9551954, 1.519868, -0.5334561, 1, 0, 0.9529412, 1,
0.9569179, -0.142421, 3.172211, 1, 0, 0.9490196, 1,
0.9588826, -0.4201382, 0.8296605, 1, 0, 0.9411765, 1,
0.9632651, -0.8665298, 1.697555, 1, 0, 0.9372549, 1,
0.9660352, -0.368122, 2.848795, 1, 0, 0.9294118, 1,
0.9666166, 1.495242, 1.960326, 1, 0, 0.9254902, 1,
0.9672554, -0.4321432, 2.488101, 1, 0, 0.9176471, 1,
0.9679177, 0.1158768, 0.4843081, 1, 0, 0.9137255, 1,
0.9710651, -0.6641206, 1.946984, 1, 0, 0.9058824, 1,
0.973638, -1.219203, 2.729167, 1, 0, 0.9019608, 1,
0.9769985, 1.09358, 0.7363276, 1, 0, 0.8941177, 1,
0.978747, 1.136513, 0.6659247, 1, 0, 0.8862745, 1,
0.9790083, 0.1933124, 1.596471, 1, 0, 0.8823529, 1,
0.9938372, 1.026202, -1.568961, 1, 0, 0.8745098, 1,
0.9961585, -0.3880684, 2.738162, 1, 0, 0.8705882, 1,
1.006178, -0.9411081, 1.829219, 1, 0, 0.8627451, 1,
1.012318, -0.01177345, 0.4542565, 1, 0, 0.8588235, 1,
1.014651, -1.379213, 4.233449, 1, 0, 0.8509804, 1,
1.018744, -0.7326069, 2.901932, 1, 0, 0.8470588, 1,
1.019153, -0.3469231, 1.280014, 1, 0, 0.8392157, 1,
1.027324, 0.1801311, 0.7413921, 1, 0, 0.8352941, 1,
1.041301, 0.1549505, 3.271865, 1, 0, 0.827451, 1,
1.043497, -1.410897, 3.15466, 1, 0, 0.8235294, 1,
1.050851, 1.144249, -0.5345905, 1, 0, 0.8156863, 1,
1.050955, -1.550296, 3.218773, 1, 0, 0.8117647, 1,
1.057119, -0.09505054, 2.703465, 1, 0, 0.8039216, 1,
1.078771, 1.176204, 2.506274, 1, 0, 0.7960784, 1,
1.081538, -0.3401253, 1.150297, 1, 0, 0.7921569, 1,
1.083164, 0.1463044, 2.33362, 1, 0, 0.7843137, 1,
1.091412, -0.1282419, 1.548182, 1, 0, 0.7803922, 1,
1.093371, 0.2212776, 0.8924044, 1, 0, 0.772549, 1,
1.095855, -0.4250181, 1.729387, 1, 0, 0.7686275, 1,
1.104227, 2.259372, 0.09838476, 1, 0, 0.7607843, 1,
1.108044, 0.4944066, 1.912219, 1, 0, 0.7568628, 1,
1.113884, 1.550943, -0.6904169, 1, 0, 0.7490196, 1,
1.115683, 0.9331073, 0.4620873, 1, 0, 0.7450981, 1,
1.119885, -0.9261405, 1.383148, 1, 0, 0.7372549, 1,
1.127912, -1.367996, 3.823926, 1, 0, 0.7333333, 1,
1.131827, -0.2485628, -0.7322859, 1, 0, 0.7254902, 1,
1.13502, 0.8817168, 2.977068, 1, 0, 0.7215686, 1,
1.144573, -0.5267057, 2.633129, 1, 0, 0.7137255, 1,
1.147659, -0.01875478, 1.020978, 1, 0, 0.7098039, 1,
1.151181, 0.4638449, 1.640826, 1, 0, 0.7019608, 1,
1.161671, 0.2017383, 0.2497563, 1, 0, 0.6941177, 1,
1.170461, 0.04760648, 2.195235, 1, 0, 0.6901961, 1,
1.177728, -0.1362192, 1.52693, 1, 0, 0.682353, 1,
1.190168, 1.12719, 0.8442664, 1, 0, 0.6784314, 1,
1.200121, -0.04996233, 2.835443, 1, 0, 0.6705883, 1,
1.200987, -1.772202, 2.492132, 1, 0, 0.6666667, 1,
1.206373, 0.7608191, 0.9499227, 1, 0, 0.6588235, 1,
1.212253, 0.3617417, 1.331202, 1, 0, 0.654902, 1,
1.221038, 0.7183191, 0.9708958, 1, 0, 0.6470588, 1,
1.222313, -1.62046, 4.142853, 1, 0, 0.6431373, 1,
1.227047, -1.816704, -0.08909221, 1, 0, 0.6352941, 1,
1.233431, 0.8267046, 0.7788196, 1, 0, 0.6313726, 1,
1.234529, -0.6124718, 0.4909071, 1, 0, 0.6235294, 1,
1.235166, 1.04378, 1.103407, 1, 0, 0.6196079, 1,
1.236061, -0.9630059, 0.854177, 1, 0, 0.6117647, 1,
1.23798, -0.3015867, 2.701653, 1, 0, 0.6078432, 1,
1.238584, 0.6843964, 0.3787528, 1, 0, 0.6, 1,
1.260518, 0.7717152, 0.736333, 1, 0, 0.5921569, 1,
1.262553, 0.1774229, 0.02851517, 1, 0, 0.5882353, 1,
1.263557, -2.633528, 2.81257, 1, 0, 0.5803922, 1,
1.272967, -0.09294518, 1.632965, 1, 0, 0.5764706, 1,
1.274705, 0.3105401, -0.1176803, 1, 0, 0.5686275, 1,
1.288851, 1.101562, 0.2677614, 1, 0, 0.5647059, 1,
1.29523, -1.208866, 1.804474, 1, 0, 0.5568628, 1,
1.307779, 1.448416, 0.4180349, 1, 0, 0.5529412, 1,
1.311525, -2.428944, 2.071454, 1, 0, 0.5450981, 1,
1.32368, -1.19276, 3.159283, 1, 0, 0.5411765, 1,
1.326672, 0.7906724, 0.1664626, 1, 0, 0.5333334, 1,
1.328492, -0.7832581, 3.022141, 1, 0, 0.5294118, 1,
1.33744, 1.912004, -1.158867, 1, 0, 0.5215687, 1,
1.345703, -0.06375631, 3.046545, 1, 0, 0.5176471, 1,
1.348218, -1.280418, 2.693126, 1, 0, 0.509804, 1,
1.348263, 1.053043, -0.4042908, 1, 0, 0.5058824, 1,
1.357418, 0.2008857, 1.136384, 1, 0, 0.4980392, 1,
1.358778, 1.029329, 1.80256, 1, 0, 0.4901961, 1,
1.376859, 0.5256379, -0.8265249, 1, 0, 0.4862745, 1,
1.380393, -1.381806, 3.389296, 1, 0, 0.4784314, 1,
1.38966, 0.3295341, 1.218844, 1, 0, 0.4745098, 1,
1.397819, 0.3444776, 0.9093575, 1, 0, 0.4666667, 1,
1.404719, 0.4124739, 1.243263, 1, 0, 0.4627451, 1,
1.410761, -0.3564676, 0.0270945, 1, 0, 0.454902, 1,
1.411633, 1.546869, 0.7673647, 1, 0, 0.4509804, 1,
1.41673, 0.4312783, 2.681024, 1, 0, 0.4431373, 1,
1.419448, -0.9360513, 1.313472, 1, 0, 0.4392157, 1,
1.424902, -0.1021931, 0.9933462, 1, 0, 0.4313726, 1,
1.441846, 0.1390541, 0.5393512, 1, 0, 0.427451, 1,
1.443313, 1.72784, 1.457044, 1, 0, 0.4196078, 1,
1.444126, -0.4226204, 1.637914, 1, 0, 0.4156863, 1,
1.455792, 2.579579, 1.205451, 1, 0, 0.4078431, 1,
1.464103, 1.423428, 0.6510124, 1, 0, 0.4039216, 1,
1.467461, -0.420175, 2.485845, 1, 0, 0.3960784, 1,
1.468806, -0.316973, 3.108032, 1, 0, 0.3882353, 1,
1.472075, 1.200223, -0.7333741, 1, 0, 0.3843137, 1,
1.485264, -0.2444256, 2.944257, 1, 0, 0.3764706, 1,
1.494651, 1.242806, 1.675435, 1, 0, 0.372549, 1,
1.504338, 0.0394207, 0.2357217, 1, 0, 0.3647059, 1,
1.511037, -0.6880192, 2.289433, 1, 0, 0.3607843, 1,
1.512682, 0.2749327, 1.000918, 1, 0, 0.3529412, 1,
1.533383, 1.290882, 1.785635, 1, 0, 0.3490196, 1,
1.537213, -0.9994909, 1.249346, 1, 0, 0.3411765, 1,
1.5435, -0.8585423, -0.1387815, 1, 0, 0.3372549, 1,
1.548585, -0.4643102, 2.497065, 1, 0, 0.3294118, 1,
1.556018, 0.9283699, 0.5373296, 1, 0, 0.3254902, 1,
1.561812, 2.374562, 0.6474712, 1, 0, 0.3176471, 1,
1.564205, -0.3003434, 2.407682, 1, 0, 0.3137255, 1,
1.56486, 0.7402761, 1.510054, 1, 0, 0.3058824, 1,
1.571526, 0.663512, 1.364785, 1, 0, 0.2980392, 1,
1.58011, -0.554125, 1.318003, 1, 0, 0.2941177, 1,
1.594952, 0.5199977, -0.1035263, 1, 0, 0.2862745, 1,
1.595328, 1.455035, 0.4614203, 1, 0, 0.282353, 1,
1.598553, -1.63041, 2.158522, 1, 0, 0.2745098, 1,
1.604375, -0.3365119, 1.448221, 1, 0, 0.2705882, 1,
1.608706, 0.9935654, 0.5189655, 1, 0, 0.2627451, 1,
1.666099, 0.5296444, 1.163182, 1, 0, 0.2588235, 1,
1.674274, 1.581203, 0.3791266, 1, 0, 0.2509804, 1,
1.709752, -0.3749313, 1.911001, 1, 0, 0.2470588, 1,
1.720215, 0.7427282, -0.3835405, 1, 0, 0.2392157, 1,
1.723006, 1.889177, 1.526852, 1, 0, 0.2352941, 1,
1.738669, -1.176172, 1.158316, 1, 0, 0.227451, 1,
1.751719, -0.03831938, 1.51919, 1, 0, 0.2235294, 1,
1.760168, -0.396712, 2.732031, 1, 0, 0.2156863, 1,
1.767472, -0.9309639, 3.239845, 1, 0, 0.2117647, 1,
1.772857, -2.373, 2.202164, 1, 0, 0.2039216, 1,
1.799945, 0.5149137, 2.043412, 1, 0, 0.1960784, 1,
1.803643, 0.6476936, 2.00306, 1, 0, 0.1921569, 1,
1.807273, -0.1673569, 1.993918, 1, 0, 0.1843137, 1,
1.808385, 0.5654519, 0.9844536, 1, 0, 0.1803922, 1,
1.824257, -1.010699, 0.9994771, 1, 0, 0.172549, 1,
1.907499, -0.1971102, 2.647824, 1, 0, 0.1686275, 1,
1.919305, 1.281644, 0.9326897, 1, 0, 0.1607843, 1,
1.934738, 0.1523543, 2.240944, 1, 0, 0.1568628, 1,
1.974741, -0.5868632, 2.140782, 1, 0, 0.1490196, 1,
1.981965, 0.5324675, -0.1830887, 1, 0, 0.145098, 1,
1.987794, -1.481396, 1.760531, 1, 0, 0.1372549, 1,
2.016436, -1.30687, 4.021519, 1, 0, 0.1333333, 1,
2.04122, 2.237482, 0.707268, 1, 0, 0.1254902, 1,
2.049998, 0.6911952, 1.465263, 1, 0, 0.1215686, 1,
2.057751, 0.2375922, 1.41792, 1, 0, 0.1137255, 1,
2.071284, 0.03813338, 0.7033543, 1, 0, 0.1098039, 1,
2.096234, 0.4873691, 1.618951, 1, 0, 0.1019608, 1,
2.09636, -0.2128845, 1.453332, 1, 0, 0.09411765, 1,
2.113147, 0.7821259, 2.853226, 1, 0, 0.09019608, 1,
2.129745, -1.542584, 3.404425, 1, 0, 0.08235294, 1,
2.139501, -0.6591758, 3.741744, 1, 0, 0.07843138, 1,
2.155835, 1.843199, 1.532692, 1, 0, 0.07058824, 1,
2.171002, 0.4679306, 0.1162421, 1, 0, 0.06666667, 1,
2.24769, 0.497337, 1.66628, 1, 0, 0.05882353, 1,
2.290389, 0.5154268, 1.414029, 1, 0, 0.05490196, 1,
2.327231, 0.02562549, 3.962673, 1, 0, 0.04705882, 1,
2.34075, 0.1443327, 3.062325, 1, 0, 0.04313726, 1,
2.567451, -1.21566, 2.944566, 1, 0, 0.03529412, 1,
2.647128, 1.376294, 1.686664, 1, 0, 0.03137255, 1,
2.654217, -0.544891, 2.710119, 1, 0, 0.02352941, 1,
2.657082, 1.551322, 0.8575296, 1, 0, 0.01960784, 1,
2.795549, -0.4166507, 0.4178372, 1, 0, 0.01176471, 1,
3.286772, 1.133371, -0.5477874, 1, 0, 0.007843138, 1
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
-0.1113786, -3.922185, -7.046834, 0, -0.5, 0.5, 0.5,
-0.1113786, -3.922185, -7.046834, 1, -0.5, 0.5, 0.5,
-0.1113786, -3.922185, -7.046834, 1, 1.5, 0.5, 0.5,
-0.1113786, -3.922185, -7.046834, 0, 1.5, 0.5, 0.5
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
-4.661501, 0.3492506, -7.046834, 0, -0.5, 0.5, 0.5,
-4.661501, 0.3492506, -7.046834, 1, -0.5, 0.5, 0.5,
-4.661501, 0.3492506, -7.046834, 1, 1.5, 0.5, 0.5,
-4.661501, 0.3492506, -7.046834, 0, 1.5, 0.5, 0.5
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
-4.661501, -3.922185, 0.335526, 0, -0.5, 0.5, 0.5,
-4.661501, -3.922185, 0.335526, 1, -0.5, 0.5, 0.5,
-4.661501, -3.922185, 0.335526, 1, 1.5, 0.5, 0.5,
-4.661501, -3.922185, 0.335526, 0, 1.5, 0.5, 0.5
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
-3, -2.936469, -5.343212,
3, -2.936469, -5.343212,
-3, -2.936469, -5.343212,
-3, -3.100755, -5.627149,
-2, -2.936469, -5.343212,
-2, -3.100755, -5.627149,
-1, -2.936469, -5.343212,
-1, -3.100755, -5.627149,
0, -2.936469, -5.343212,
0, -3.100755, -5.627149,
1, -2.936469, -5.343212,
1, -3.100755, -5.627149,
2, -2.936469, -5.343212,
2, -3.100755, -5.627149,
3, -2.936469, -5.343212,
3, -3.100755, -5.627149
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
-3, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
-3, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
-3, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
-3, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5,
-2, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
-2, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
-2, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
-2, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5,
-1, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
-1, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
-1, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
-1, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5,
0, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
0, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
0, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
0, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5,
1, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
1, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
1, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
1, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5,
2, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
2, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
2, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
2, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5,
3, -3.429327, -6.195023, 0, -0.5, 0.5, 0.5,
3, -3.429327, -6.195023, 1, -0.5, 0.5, 0.5,
3, -3.429327, -6.195023, 1, 1.5, 0.5, 0.5,
3, -3.429327, -6.195023, 0, 1.5, 0.5, 0.5
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
-3.611473, -2, -5.343212,
-3.611473, 3, -5.343212,
-3.611473, -2, -5.343212,
-3.786478, -2, -5.627149,
-3.611473, -1, -5.343212,
-3.786478, -1, -5.627149,
-3.611473, 0, -5.343212,
-3.786478, 0, -5.627149,
-3.611473, 1, -5.343212,
-3.786478, 1, -5.627149,
-3.611473, 2, -5.343212,
-3.786478, 2, -5.627149,
-3.611473, 3, -5.343212,
-3.786478, 3, -5.627149
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
-4.136487, -2, -6.195023, 0, -0.5, 0.5, 0.5,
-4.136487, -2, -6.195023, 1, -0.5, 0.5, 0.5,
-4.136487, -2, -6.195023, 1, 1.5, 0.5, 0.5,
-4.136487, -2, -6.195023, 0, 1.5, 0.5, 0.5,
-4.136487, -1, -6.195023, 0, -0.5, 0.5, 0.5,
-4.136487, -1, -6.195023, 1, -0.5, 0.5, 0.5,
-4.136487, -1, -6.195023, 1, 1.5, 0.5, 0.5,
-4.136487, -1, -6.195023, 0, 1.5, 0.5, 0.5,
-4.136487, 0, -6.195023, 0, -0.5, 0.5, 0.5,
-4.136487, 0, -6.195023, 1, -0.5, 0.5, 0.5,
-4.136487, 0, -6.195023, 1, 1.5, 0.5, 0.5,
-4.136487, 0, -6.195023, 0, 1.5, 0.5, 0.5,
-4.136487, 1, -6.195023, 0, -0.5, 0.5, 0.5,
-4.136487, 1, -6.195023, 1, -0.5, 0.5, 0.5,
-4.136487, 1, -6.195023, 1, 1.5, 0.5, 0.5,
-4.136487, 1, -6.195023, 0, 1.5, 0.5, 0.5,
-4.136487, 2, -6.195023, 0, -0.5, 0.5, 0.5,
-4.136487, 2, -6.195023, 1, -0.5, 0.5, 0.5,
-4.136487, 2, -6.195023, 1, 1.5, 0.5, 0.5,
-4.136487, 2, -6.195023, 0, 1.5, 0.5, 0.5,
-4.136487, 3, -6.195023, 0, -0.5, 0.5, 0.5,
-4.136487, 3, -6.195023, 1, -0.5, 0.5, 0.5,
-4.136487, 3, -6.195023, 1, 1.5, 0.5, 0.5,
-4.136487, 3, -6.195023, 0, 1.5, 0.5, 0.5
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
-3.611473, -2.936469, -4,
-3.611473, -2.936469, 4,
-3.611473, -2.936469, -4,
-3.786478, -3.100755, -4,
-3.611473, -2.936469, -2,
-3.786478, -3.100755, -2,
-3.611473, -2.936469, 0,
-3.786478, -3.100755, 0,
-3.611473, -2.936469, 2,
-3.786478, -3.100755, 2,
-3.611473, -2.936469, 4,
-3.786478, -3.100755, 4
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
-4.136487, -3.429327, -4, 0, -0.5, 0.5, 0.5,
-4.136487, -3.429327, -4, 1, -0.5, 0.5, 0.5,
-4.136487, -3.429327, -4, 1, 1.5, 0.5, 0.5,
-4.136487, -3.429327, -4, 0, 1.5, 0.5, 0.5,
-4.136487, -3.429327, -2, 0, -0.5, 0.5, 0.5,
-4.136487, -3.429327, -2, 1, -0.5, 0.5, 0.5,
-4.136487, -3.429327, -2, 1, 1.5, 0.5, 0.5,
-4.136487, -3.429327, -2, 0, 1.5, 0.5, 0.5,
-4.136487, -3.429327, 0, 0, -0.5, 0.5, 0.5,
-4.136487, -3.429327, 0, 1, -0.5, 0.5, 0.5,
-4.136487, -3.429327, 0, 1, 1.5, 0.5, 0.5,
-4.136487, -3.429327, 0, 0, 1.5, 0.5, 0.5,
-4.136487, -3.429327, 2, 0, -0.5, 0.5, 0.5,
-4.136487, -3.429327, 2, 1, -0.5, 0.5, 0.5,
-4.136487, -3.429327, 2, 1, 1.5, 0.5, 0.5,
-4.136487, -3.429327, 2, 0, 1.5, 0.5, 0.5,
-4.136487, -3.429327, 4, 0, -0.5, 0.5, 0.5,
-4.136487, -3.429327, 4, 1, -0.5, 0.5, 0.5,
-4.136487, -3.429327, 4, 1, 1.5, 0.5, 0.5,
-4.136487, -3.429327, 4, 0, 1.5, 0.5, 0.5
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
-3.611473, -2.936469, -5.343212,
-3.611473, 3.63497, -5.343212,
-3.611473, -2.936469, 6.014264,
-3.611473, 3.63497, 6.014264,
-3.611473, -2.936469, -5.343212,
-3.611473, -2.936469, 6.014264,
-3.611473, 3.63497, -5.343212,
-3.611473, 3.63497, 6.014264,
-3.611473, -2.936469, -5.343212,
3.388716, -2.936469, -5.343212,
-3.611473, -2.936469, 6.014264,
3.388716, -2.936469, 6.014264,
-3.611473, 3.63497, -5.343212,
3.388716, 3.63497, -5.343212,
-3.611473, 3.63497, 6.014264,
3.388716, 3.63497, 6.014264,
3.388716, -2.936469, -5.343212,
3.388716, 3.63497, -5.343212,
3.388716, -2.936469, 6.014264,
3.388716, 3.63497, 6.014264,
3.388716, -2.936469, -5.343212,
3.388716, -2.936469, 6.014264,
3.388716, 3.63497, -5.343212,
3.388716, 3.63497, 6.014264
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
var radius = 7.941401;
var distance = 35.33219;
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
mvMatrix.translate( 0.1113786, -0.3492506, -0.335526 );
mvMatrix.scale( 1.226595, 1.306624, 0.7560129 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.33219);
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
propanamine<-read.table("propanamine.xyz")
```

```
## Error in read.table("propanamine.xyz"): no lines available in input
```

```r
x<-propanamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanamine' not found
```

```r
y<-propanamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanamine' not found
```

```r
z<-propanamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanamine' not found
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
-3.509529, -1.65134, -2.320527, 0, 0, 1, 1, 1,
-2.876228, -0.7465962, -0.6488723, 1, 0, 0, 1, 1,
-2.800931, -0.4221693, -2.143154, 1, 0, 0, 1, 1,
-2.643478, 0.2073297, -1.759984, 1, 0, 0, 1, 1,
-2.549413, -0.5290422, -1.312848, 1, 0, 0, 1, 1,
-2.488632, -0.4198912, -2.115437, 1, 0, 0, 1, 1,
-2.435879, -0.1779743, -0.2915344, 0, 0, 0, 1, 1,
-2.400917, 0.01219816, -1.53582, 0, 0, 0, 1, 1,
-2.353889, 0.2118483, -2.945584, 0, 0, 0, 1, 1,
-2.260621, 1.394579, -1.471816, 0, 0, 0, 1, 1,
-2.242562, 0.02681973, -2.682663, 0, 0, 0, 1, 1,
-2.218474, -0.666865, -1.607952, 0, 0, 0, 1, 1,
-2.214209, -0.3907715, -2.453175, 0, 0, 0, 1, 1,
-2.204432, -0.8066001, -2.236334, 1, 1, 1, 1, 1,
-2.187817, 0.3446575, -0.6860625, 1, 1, 1, 1, 1,
-2.174742, -9.019161e-05, -1.334361, 1, 1, 1, 1, 1,
-2.150901, 0.4424227, -2.355781, 1, 1, 1, 1, 1,
-2.119485, -1.591949, -0.6717222, 1, 1, 1, 1, 1,
-2.105469, 0.9285369, -0.8987545, 1, 1, 1, 1, 1,
-2.050205, 1.210966, -1.647123, 1, 1, 1, 1, 1,
-2.012487, -0.7491904, -0.5891977, 1, 1, 1, 1, 1,
-1.989918, 0.2580312, -0.2291483, 1, 1, 1, 1, 1,
-1.971112, -0.3670731, 0.2894963, 1, 1, 1, 1, 1,
-1.96485, 0.05273947, -0.8962501, 1, 1, 1, 1, 1,
-1.955828, -0.0112264, -1.762616, 1, 1, 1, 1, 1,
-1.909473, 2.182694, -1.66976, 1, 1, 1, 1, 1,
-1.904765, -0.1295992, -1.632944, 1, 1, 1, 1, 1,
-1.902381, -0.4396324, -0.6493084, 1, 1, 1, 1, 1,
-1.89987, -0.5493387, -1.524812, 0, 0, 1, 1, 1,
-1.897825, 2.585764, -1.995497, 1, 0, 0, 1, 1,
-1.895458, -0.3268684, -2.126017, 1, 0, 0, 1, 1,
-1.885678, -0.7576734, -1.540963, 1, 0, 0, 1, 1,
-1.874435, -0.7312154, -0.5344944, 1, 0, 0, 1, 1,
-1.85961, 0.5772371, -0.2015392, 1, 0, 0, 1, 1,
-1.853725, -0.4770624, -1.196362, 0, 0, 0, 1, 1,
-1.85063, 0.4626403, 0.3303918, 0, 0, 0, 1, 1,
-1.839263, -0.6733961, -3.409006, 0, 0, 0, 1, 1,
-1.827488, -1.464091, -4.627119, 0, 0, 0, 1, 1,
-1.797441, -0.8917306, -3.04154, 0, 0, 0, 1, 1,
-1.789356, 1.618094, 0.5416924, 0, 0, 0, 1, 1,
-1.759308, 0.666888, -1.447484, 0, 0, 0, 1, 1,
-1.756741, 0.3833511, -0.1278469, 1, 1, 1, 1, 1,
-1.746218, 1.276005, -1.0043, 1, 1, 1, 1, 1,
-1.724621, 0.8309808, -1.642505, 1, 1, 1, 1, 1,
-1.715119, 0.7487292, -0.2128665, 1, 1, 1, 1, 1,
-1.714143, 0.7523164, -1.374469, 1, 1, 1, 1, 1,
-1.664208, 0.6618255, -1.521853, 1, 1, 1, 1, 1,
-1.658999, 0.9956976, -1.339501, 1, 1, 1, 1, 1,
-1.657359, -0.3010557, -1.621187, 1, 1, 1, 1, 1,
-1.654557, 0.8269338, -1.437283, 1, 1, 1, 1, 1,
-1.650389, 1.039037, -1.828608, 1, 1, 1, 1, 1,
-1.650361, 0.3192733, -0.968577, 1, 1, 1, 1, 1,
-1.640397, -0.500531, -2.620826, 1, 1, 1, 1, 1,
-1.632794, 0.07129722, -2.239266, 1, 1, 1, 1, 1,
-1.632346, 0.1029135, -1.147368, 1, 1, 1, 1, 1,
-1.624325, 1.139046, -0.6656169, 1, 1, 1, 1, 1,
-1.621161, 1.61043, -0.8780817, 0, 0, 1, 1, 1,
-1.615676, -0.4127138, -2.337552, 1, 0, 0, 1, 1,
-1.612261, -0.4210597, -1.560922, 1, 0, 0, 1, 1,
-1.603531, 1.015686, -0.6615145, 1, 0, 0, 1, 1,
-1.599542, 1.046225, -0.08111879, 1, 0, 0, 1, 1,
-1.596774, 0.1534149, -0.4044969, 1, 0, 0, 1, 1,
-1.576408, 0.02073829, -1.322132, 0, 0, 0, 1, 1,
-1.550213, -0.3879162, -2.36553, 0, 0, 0, 1, 1,
-1.545536, -0.2082127, -2.225096, 0, 0, 0, 1, 1,
-1.545074, 0.5347776, -2.189473, 0, 0, 0, 1, 1,
-1.540953, 1.201725, -1.032809, 0, 0, 0, 1, 1,
-1.530149, 1.08234, -0.8964501, 0, 0, 0, 1, 1,
-1.527923, 0.7875925, -0.6079946, 0, 0, 0, 1, 1,
-1.520815, 0.1870722, -1.625781, 1, 1, 1, 1, 1,
-1.517371, 0.8724387, -1.785082, 1, 1, 1, 1, 1,
-1.516199, -0.2208377, -3.420005, 1, 1, 1, 1, 1,
-1.512919, 0.1245371, -0.7394288, 1, 1, 1, 1, 1,
-1.509176, -1.158945, -2.78944, 1, 1, 1, 1, 1,
-1.499931, 1.441243, -2.672302, 1, 1, 1, 1, 1,
-1.490317, 1.067596, -1.12396, 1, 1, 1, 1, 1,
-1.4742, -1.901388, -3.944529, 1, 1, 1, 1, 1,
-1.457467, 2.628157, -0.06032176, 1, 1, 1, 1, 1,
-1.435835, -1.043389, -3.548442, 1, 1, 1, 1, 1,
-1.434686, 0.6979488, -2.38808, 1, 1, 1, 1, 1,
-1.414107, -0.01455817, -0.9538302, 1, 1, 1, 1, 1,
-1.411374, -0.807484, -0.9178062, 1, 1, 1, 1, 1,
-1.406374, 1.821083, 0.9427262, 1, 1, 1, 1, 1,
-1.390432, 1.337577, 0.309567, 1, 1, 1, 1, 1,
-1.379035, 0.7257441, -1.642056, 0, 0, 1, 1, 1,
-1.370717, 1.38632, 0.5618238, 1, 0, 0, 1, 1,
-1.364941, 0.1365609, -0.4521347, 1, 0, 0, 1, 1,
-1.358862, 0.3926037, -1.265216, 1, 0, 0, 1, 1,
-1.34939, -0.9658179, -3.35601, 1, 0, 0, 1, 1,
-1.344013, -0.2371627, -1.86963, 1, 0, 0, 1, 1,
-1.339448, -0.2791989, -3.052825, 0, 0, 0, 1, 1,
-1.335763, 0.2897768, -1.201128, 0, 0, 0, 1, 1,
-1.32598, -0.9375571, -2.404234, 0, 0, 0, 1, 1,
-1.321659, -0.9465731, -3.300445, 0, 0, 0, 1, 1,
-1.313717, 0.001843827, -1.968909, 0, 0, 0, 1, 1,
-1.305004, 0.1866793, -0.5251186, 0, 0, 0, 1, 1,
-1.299214, 2.148415, 0.624904, 0, 0, 0, 1, 1,
-1.292967, 0.2427794, -1.399708, 1, 1, 1, 1, 1,
-1.281821, 0.008592012, 0.6114349, 1, 1, 1, 1, 1,
-1.280105, 0.3430565, -0.9320036, 1, 1, 1, 1, 1,
-1.273137, -0.9796926, -0.6862123, 1, 1, 1, 1, 1,
-1.271784, -0.5819981, -1.950446, 1, 1, 1, 1, 1,
-1.269246, -1.439939, -1.424342, 1, 1, 1, 1, 1,
-1.267399, 0.8111584, -0.2680106, 1, 1, 1, 1, 1,
-1.267021, -0.7433804, -2.786283, 1, 1, 1, 1, 1,
-1.265604, -0.3811724, -2.817677, 1, 1, 1, 1, 1,
-1.264346, 0.6149218, -1.652233, 1, 1, 1, 1, 1,
-1.261998, -1.546703, -1.033628, 1, 1, 1, 1, 1,
-1.248397, -2.453297, -2.439942, 1, 1, 1, 1, 1,
-1.239186, -2.234249, -3.833971, 1, 1, 1, 1, 1,
-1.239172, -0.0392308, -2.405368, 1, 1, 1, 1, 1,
-1.238156, 1.998383, -1.290206, 1, 1, 1, 1, 1,
-1.234305, 0.7400927, -0.2428776, 0, 0, 1, 1, 1,
-1.228629, 0.5064204, -2.465019, 1, 0, 0, 1, 1,
-1.227728, 0.6953551, -0.6953079, 1, 0, 0, 1, 1,
-1.223526, 0.558856, -0.611056, 1, 0, 0, 1, 1,
-1.222565, 0.5985827, 1.665731, 1, 0, 0, 1, 1,
-1.220232, 0.7298062, 0.2471403, 1, 0, 0, 1, 1,
-1.2161, 0.5844933, 0.3062327, 0, 0, 0, 1, 1,
-1.211057, 0.6131073, 1.047435, 0, 0, 0, 1, 1,
-1.207042, -0.1736319, -1.845574, 0, 0, 0, 1, 1,
-1.200208, 0.292628, -0.2612953, 0, 0, 0, 1, 1,
-1.200161, 0.05007138, -2.134501, 0, 0, 0, 1, 1,
-1.199193, 0.2480431, -1.947904, 0, 0, 0, 1, 1,
-1.191144, 0.6213024, -1.664671, 0, 0, 0, 1, 1,
-1.182434, 1.743726, -0.9450071, 1, 1, 1, 1, 1,
-1.181204, 0.7509633, -2.772866, 1, 1, 1, 1, 1,
-1.179441, 1.245123, -1.065934, 1, 1, 1, 1, 1,
-1.163078, 1.904425, -1.196449, 1, 1, 1, 1, 1,
-1.160348, -0.658774, -1.897044, 1, 1, 1, 1, 1,
-1.137231, -0.1796399, -1.923458, 1, 1, 1, 1, 1,
-1.131575, -0.9214865, -2.772109, 1, 1, 1, 1, 1,
-1.12824, -0.5217791, -1.32042, 1, 1, 1, 1, 1,
-1.125654, -1.428098, -1.43002, 1, 1, 1, 1, 1,
-1.120206, -1.93718, -1.112579, 1, 1, 1, 1, 1,
-1.11997, 1.289147, -1.0507, 1, 1, 1, 1, 1,
-1.115349, 0.6595906, -0.7289206, 1, 1, 1, 1, 1,
-1.109386, -0.5082088, -2.771161, 1, 1, 1, 1, 1,
-1.109133, 0.7332643, -0.3851361, 1, 1, 1, 1, 1,
-1.106851, -0.8289159, -1.646307, 1, 1, 1, 1, 1,
-1.085274, 2.193627, 0.1905775, 0, 0, 1, 1, 1,
-1.078903, 1.046692, 0.01423672, 1, 0, 0, 1, 1,
-1.078016, 0.88704, 0.1015148, 1, 0, 0, 1, 1,
-1.075766, -0.1034911, -1.86619, 1, 0, 0, 1, 1,
-1.070258, -1.960904, -0.3749484, 1, 0, 0, 1, 1,
-1.06844, 0.5966572, -2.14023, 1, 0, 0, 1, 1,
-1.061546, -1.112638, -3.615035, 0, 0, 0, 1, 1,
-1.052643, 1.22511, 1.285544, 0, 0, 0, 1, 1,
-1.0488, -0.007664479, -0.8619475, 0, 0, 0, 1, 1,
-1.048792, 2.511216, -0.5294895, 0, 0, 0, 1, 1,
-1.046895, 1.058781, -0.3349991, 0, 0, 0, 1, 1,
-1.04623, -2.699067, -3.178812, 0, 0, 0, 1, 1,
-1.04501, -0.5715804, 0.1422338, 0, 0, 0, 1, 1,
-1.043702, 1.9938, 0.7188445, 1, 1, 1, 1, 1,
-1.040631, 0.4453156, -1.300892, 1, 1, 1, 1, 1,
-1.035872, 0.8847489, 0.5654537, 1, 1, 1, 1, 1,
-1.031315, 0.6023619, -1.333316, 1, 1, 1, 1, 1,
-1.02655, 0.3289564, -1.965358, 1, 1, 1, 1, 1,
-1.02315, 0.1910724, -1.71889, 1, 1, 1, 1, 1,
-1.019534, -0.9361902, -2.646167, 1, 1, 1, 1, 1,
-1.01559, 1.699427, -1.672876, 1, 1, 1, 1, 1,
-1.015568, -0.5974278, -0.1003744, 1, 1, 1, 1, 1,
-1.013411, -0.00577803, -2.182514, 1, 1, 1, 1, 1,
-1.010977, 0.07355616, -1.491972, 1, 1, 1, 1, 1,
-1.009174, 1.165314, -0.3758533, 1, 1, 1, 1, 1,
-1.002835, 0.6468928, -0.459033, 1, 1, 1, 1, 1,
-1.000262, -0.07324865, -1.786698, 1, 1, 1, 1, 1,
-0.9977146, -0.06629533, -3.278384, 1, 1, 1, 1, 1,
-0.9952572, -1.68082, -2.086766, 0, 0, 1, 1, 1,
-0.9935604, 1.89077, -1.589729, 1, 0, 0, 1, 1,
-0.9931228, 0.4251113, -2.730109, 1, 0, 0, 1, 1,
-0.985373, -1.508318, -2.360745, 1, 0, 0, 1, 1,
-0.9803265, -1.10257, -2.454474, 1, 0, 0, 1, 1,
-0.9772444, 0.1363682, -0.8650913, 1, 0, 0, 1, 1,
-0.9770339, -1.574388, 0.0009162519, 0, 0, 0, 1, 1,
-0.9757212, -0.05379918, -0.9935545, 0, 0, 0, 1, 1,
-0.9646401, -0.2674268, -1.705474, 0, 0, 0, 1, 1,
-0.9588705, 0.5153716, -0.8623984, 0, 0, 0, 1, 1,
-0.9588316, 1.667902, -0.2436348, 0, 0, 0, 1, 1,
-0.9585204, -2.240664, -2.125154, 0, 0, 0, 1, 1,
-0.948381, -0.1322181, -0.2636715, 0, 0, 0, 1, 1,
-0.9455638, -1.434438, -2.537689, 1, 1, 1, 1, 1,
-0.9202688, -1.273993, -1.768189, 1, 1, 1, 1, 1,
-0.9199272, -0.8162219, -2.536343, 1, 1, 1, 1, 1,
-0.918495, 0.3295568, -0.8893287, 1, 1, 1, 1, 1,
-0.9157982, -0.5121326, -0.8545708, 1, 1, 1, 1, 1,
-0.9152141, 0.0930078, -2.35541, 1, 1, 1, 1, 1,
-0.9115376, 0.4568037, -2.36893, 1, 1, 1, 1, 1,
-0.9106292, -0.5319579, -1.155923, 1, 1, 1, 1, 1,
-0.9044338, -0.1590436, -2.978224, 1, 1, 1, 1, 1,
-0.9038264, -0.7170229, -2.88876, 1, 1, 1, 1, 1,
-0.9007722, -0.203545, -0.3545794, 1, 1, 1, 1, 1,
-0.8967139, -0.2249648, -0.9614128, 1, 1, 1, 1, 1,
-0.8966088, -0.08193659, -1.010869, 1, 1, 1, 1, 1,
-0.8916408, 0.2880219, -3.149338, 1, 1, 1, 1, 1,
-0.8896894, -0.4472187, -2.735766, 1, 1, 1, 1, 1,
-0.8874819, -0.6569978, -2.345295, 0, 0, 1, 1, 1,
-0.8874785, -0.4037133, -3.215509, 1, 0, 0, 1, 1,
-0.8851975, -0.101776, -3.409959, 1, 0, 0, 1, 1,
-0.8840992, 1.176795, 0.9202887, 1, 0, 0, 1, 1,
-0.883553, -1.701027, -1.905428, 1, 0, 0, 1, 1,
-0.8703029, -0.4706698, -0.8909433, 1, 0, 0, 1, 1,
-0.869103, 1.159434, -0.6820428, 0, 0, 0, 1, 1,
-0.8687325, 0.3583004, -0.3705279, 0, 0, 0, 1, 1,
-0.8669614, -0.05324028, -1.025002, 0, 0, 0, 1, 1,
-0.8636971, -0.2267419, -3.359143, 0, 0, 0, 1, 1,
-0.862781, 1.058098, -1.429886, 0, 0, 0, 1, 1,
-0.8626127, -0.3162413, -2.084606, 0, 0, 0, 1, 1,
-0.8586789, 2.416599, -0.8186557, 0, 0, 0, 1, 1,
-0.8567669, -0.3791454, -0.710387, 1, 1, 1, 1, 1,
-0.8533427, 0.5718018, 0.2562345, 1, 1, 1, 1, 1,
-0.8497156, -0.2936113, -2.722027, 1, 1, 1, 1, 1,
-0.8488083, 0.3788583, -3.139286, 1, 1, 1, 1, 1,
-0.8471134, -0.3204152, -2.002485, 1, 1, 1, 1, 1,
-0.8454072, 1.455963, -0.8183808, 1, 1, 1, 1, 1,
-0.8453151, 0.7405918, -0.3061271, 1, 1, 1, 1, 1,
-0.8446622, 0.04271707, -1.829841, 1, 1, 1, 1, 1,
-0.8348602, -0.1365418, -0.928856, 1, 1, 1, 1, 1,
-0.8139139, 0.05125654, -3.853703, 1, 1, 1, 1, 1,
-0.8127716, 1.105351, -0.4763468, 1, 1, 1, 1, 1,
-0.8122523, -1.020017, -4.124269, 1, 1, 1, 1, 1,
-0.8099575, 1.497577, -0.849419, 1, 1, 1, 1, 1,
-0.8067492, 0.9640512, -1.451762, 1, 1, 1, 1, 1,
-0.8057297, 0.8742352, -0.04985305, 1, 1, 1, 1, 1,
-0.7990699, -0.7786027, -1.738944, 0, 0, 1, 1, 1,
-0.7970083, 0.2000924, -2.001296, 1, 0, 0, 1, 1,
-0.7949892, 0.1484985, -1.767453, 1, 0, 0, 1, 1,
-0.7929367, 0.3396373, -1.760843, 1, 0, 0, 1, 1,
-0.7834169, -0.3217048, -2.951091, 1, 0, 0, 1, 1,
-0.7822041, -0.5162567, -2.763971, 1, 0, 0, 1, 1,
-0.7807936, -1.049393, -1.369271, 0, 0, 0, 1, 1,
-0.7732717, -1.262269, -2.904373, 0, 0, 0, 1, 1,
-0.7710163, -0.2696232, -2.650554, 0, 0, 0, 1, 1,
-0.7708527, -1.552014, -3.27987, 0, 0, 0, 1, 1,
-0.7698756, -0.8674312, -2.44532, 0, 0, 0, 1, 1,
-0.7683192, -1.139281, -2.481977, 0, 0, 0, 1, 1,
-0.7518502, -0.1377348, -0.4873746, 0, 0, 0, 1, 1,
-0.7502993, -0.279915, -1.27994, 1, 1, 1, 1, 1,
-0.7500138, -0.5395812, -4.01324, 1, 1, 1, 1, 1,
-0.7479054, 1.268968, -1.903121, 1, 1, 1, 1, 1,
-0.7450728, -0.2595512, -1.410052, 1, 1, 1, 1, 1,
-0.7442662, -0.8584619, -2.180544, 1, 1, 1, 1, 1,
-0.7435492, 0.9408584, -0.9936572, 1, 1, 1, 1, 1,
-0.7426502, -1.896734, -3.15595, 1, 1, 1, 1, 1,
-0.7387998, -2.02926, -4.078767, 1, 1, 1, 1, 1,
-0.7375146, -0.05163707, -1.445339, 1, 1, 1, 1, 1,
-0.7345526, 1.847854, 0.416973, 1, 1, 1, 1, 1,
-0.7226266, 0.0243741, -3.337913, 1, 1, 1, 1, 1,
-0.7223258, -0.1958512, -2.343619, 1, 1, 1, 1, 1,
-0.7197435, -1.34623, -3.446249, 1, 1, 1, 1, 1,
-0.7158091, -1.171151, -4.42123, 1, 1, 1, 1, 1,
-0.7152687, -1.753969, -2.439954, 1, 1, 1, 1, 1,
-0.7134975, -0.816292, -3.805516, 0, 0, 1, 1, 1,
-0.7077044, -1.031176, -1.890417, 1, 0, 0, 1, 1,
-0.70044, 1.74262, -0.9660419, 1, 0, 0, 1, 1,
-0.6900291, 0.7341097, 0.3175117, 1, 0, 0, 1, 1,
-0.6849171, -1.632593, -4.249369, 1, 0, 0, 1, 1,
-0.684795, 0.3626381, -2.08951, 1, 0, 0, 1, 1,
-0.6846878, 0.160974, -0.483293, 0, 0, 0, 1, 1,
-0.6825464, -0.6350017, -1.193693, 0, 0, 0, 1, 1,
-0.6801855, -1.14474, -3.131394, 0, 0, 0, 1, 1,
-0.6765869, -0.3188763, 0.1318974, 0, 0, 0, 1, 1,
-0.6741314, 1.146765, -0.7497071, 0, 0, 0, 1, 1,
-0.6736426, 0.9283572, -1.267462, 0, 0, 0, 1, 1,
-0.6719541, 0.5749676, 2.128526, 0, 0, 0, 1, 1,
-0.6692749, -1.256, -4.685623, 1, 1, 1, 1, 1,
-0.6666031, -1.26697, -2.994876, 1, 1, 1, 1, 1,
-0.6646185, -0.6100041, -3.456858, 1, 1, 1, 1, 1,
-0.6636111, -0.8692163, -2.62467, 1, 1, 1, 1, 1,
-0.6632154, 0.2959204, -1.167019, 1, 1, 1, 1, 1,
-0.6623059, -0.1421106, -1.906753, 1, 1, 1, 1, 1,
-0.661601, -1.095978, -4.215505, 1, 1, 1, 1, 1,
-0.6603231, 0.6105102, 0.3451989, 1, 1, 1, 1, 1,
-0.6576699, 1.839878, 1.3552, 1, 1, 1, 1, 1,
-0.6536943, 0.9518781, -2.695186, 1, 1, 1, 1, 1,
-0.6536486, -0.009958802, -1.082481, 1, 1, 1, 1, 1,
-0.6523409, 0.8336284, -2.376405, 1, 1, 1, 1, 1,
-0.651338, 0.4856887, -1.283721, 1, 1, 1, 1, 1,
-0.6512445, 0.5317996, -0.5500649, 1, 1, 1, 1, 1,
-0.6411943, 2.590218, 1.502016, 1, 1, 1, 1, 1,
-0.641095, -0.1362568, -1.475907, 0, 0, 1, 1, 1,
-0.6393549, -1.593584, -3.322792, 1, 0, 0, 1, 1,
-0.6363969, -0.2425723, -2.323888, 1, 0, 0, 1, 1,
-0.6360534, 0.1761026, -1.500154, 1, 0, 0, 1, 1,
-0.6360246, 0.861616, -1.238191, 1, 0, 0, 1, 1,
-0.6317053, 0.8488801, -0.7320133, 1, 0, 0, 1, 1,
-0.6276035, -1.036566, -3.225401, 0, 0, 0, 1, 1,
-0.6234536, -0.3091549, -1.819103, 0, 0, 0, 1, 1,
-0.6230764, 0.285093, -1.419316, 0, 0, 0, 1, 1,
-0.6219348, -0.03857165, -1.70181, 0, 0, 0, 1, 1,
-0.6212626, -0.03442997, -2.869086, 0, 0, 0, 1, 1,
-0.6185685, 0.3690517, -1.842692, 0, 0, 0, 1, 1,
-0.6149724, -1.135703, -2.413811, 0, 0, 0, 1, 1,
-0.6137209, -0.7043834, -4.448128, 1, 1, 1, 1, 1,
-0.5996442, 0.4150496, -1.689906, 1, 1, 1, 1, 1,
-0.5914241, -0.04522881, -2.581362, 1, 1, 1, 1, 1,
-0.5831206, 0.8113582, -1.071478, 1, 1, 1, 1, 1,
-0.5830922, 0.2163745, -0.09944112, 1, 1, 1, 1, 1,
-0.575543, -0.8413376, -1.793085, 1, 1, 1, 1, 1,
-0.5713018, 0.8076799, -0.05985567, 1, 1, 1, 1, 1,
-0.5703328, 1.495029, -0.7712827, 1, 1, 1, 1, 1,
-0.5689905, -1.266353, -1.790613, 1, 1, 1, 1, 1,
-0.5641015, 0.1040224, -1.039084, 1, 1, 1, 1, 1,
-0.5516922, 0.6434956, -0.4813614, 1, 1, 1, 1, 1,
-0.5370085, -0.3402105, -1.219075, 1, 1, 1, 1, 1,
-0.5351788, 0.6357876, -2.315325, 1, 1, 1, 1, 1,
-0.5337952, -1.43843, -3.17032, 1, 1, 1, 1, 1,
-0.5336694, 0.6987095, -1.037851, 1, 1, 1, 1, 1,
-0.5273684, 0.373669, -0.9443568, 0, 0, 1, 1, 1,
-0.5245721, -0.1208075, 1.174029, 1, 0, 0, 1, 1,
-0.5230935, 1.189316, -0.2989473, 1, 0, 0, 1, 1,
-0.5213852, 0.6547288, -0.3055405, 1, 0, 0, 1, 1,
-0.5203224, -0.844983, -2.679005, 1, 0, 0, 1, 1,
-0.5195693, 0.1267064, -1.266056, 1, 0, 0, 1, 1,
-0.5173134, -0.5002999, -1.508448, 0, 0, 0, 1, 1,
-0.5149246, 0.4826187, -2.438374, 0, 0, 0, 1, 1,
-0.5113801, -0.1948631, -1.709768, 0, 0, 0, 1, 1,
-0.5101773, -0.6832739, -3.969517, 0, 0, 0, 1, 1,
-0.5092237, -1.180255, -4.157597, 0, 0, 0, 1, 1,
-0.5073081, -0.8592102, -2.791554, 0, 0, 0, 1, 1,
-0.503868, 0.4376816, -1.31205, 0, 0, 0, 1, 1,
-0.5037137, -0.2788891, -2.039992, 1, 1, 1, 1, 1,
-0.5023798, 0.2346647, 1.124056, 1, 1, 1, 1, 1,
-0.4947614, 0.5942727, -0.9432816, 1, 1, 1, 1, 1,
-0.492471, 1.008572, -1.794913, 1, 1, 1, 1, 1,
-0.48588, -0.1313595, -1.342008, 1, 1, 1, 1, 1,
-0.485321, -0.4251078, -2.094015, 1, 1, 1, 1, 1,
-0.4829071, -0.9571939, -0.8404393, 1, 1, 1, 1, 1,
-0.4799714, 0.03701451, -0.9572811, 1, 1, 1, 1, 1,
-0.4798438, -0.7844637, -4.232182, 1, 1, 1, 1, 1,
-0.4790309, 0.3234723, -2.802037, 1, 1, 1, 1, 1,
-0.4784074, -0.8856174, -1.844087, 1, 1, 1, 1, 1,
-0.4750779, 1.443613, 1.84058, 1, 1, 1, 1, 1,
-0.4748848, -0.7300199, -2.261698, 1, 1, 1, 1, 1,
-0.4742977, 1.578233, -0.622515, 1, 1, 1, 1, 1,
-0.4715007, -0.3405645, -2.510074, 1, 1, 1, 1, 1,
-0.4695235, -1.480246, -4.021832, 0, 0, 1, 1, 1,
-0.46766, 0.6533317, 0.2008824, 1, 0, 0, 1, 1,
-0.4665952, -0.6386028, -3.620813, 1, 0, 0, 1, 1,
-0.4658552, -1.437822, -2.126673, 1, 0, 0, 1, 1,
-0.4625757, -1.332044, -2.968287, 1, 0, 0, 1, 1,
-0.461233, 0.18432, -0.3981096, 1, 0, 0, 1, 1,
-0.4566105, -0.2367303, -1.975354, 0, 0, 0, 1, 1,
-0.4545366, 1.199698, -0.7601476, 0, 0, 0, 1, 1,
-0.4479831, -1.855806, -3.835703, 0, 0, 0, 1, 1,
-0.4464264, -0.6158902, -3.016389, 0, 0, 0, 1, 1,
-0.4436662, 0.0124791, -2.340692, 0, 0, 0, 1, 1,
-0.4282161, 0.01216629, -3.002392, 0, 0, 0, 1, 1,
-0.4234738, 1.10357, -0.6312432, 0, 0, 0, 1, 1,
-0.4206523, -1.831231, -2.102085, 1, 1, 1, 1, 1,
-0.41968, 1.651089, -0.6982352, 1, 1, 1, 1, 1,
-0.4171009, 0.285524, -1.411937, 1, 1, 1, 1, 1,
-0.4160743, -0.1736041, -3.007766, 1, 1, 1, 1, 1,
-0.4154271, -0.3385864, -2.291537, 1, 1, 1, 1, 1,
-0.4129726, -1.647548, -3.579119, 1, 1, 1, 1, 1,
-0.4121542, -0.4776581, -2.523805, 1, 1, 1, 1, 1,
-0.4103148, -0.9692016, -3.858175, 1, 1, 1, 1, 1,
-0.4089313, -0.4122989, -1.247588, 1, 1, 1, 1, 1,
-0.4025202, 0.5641506, -0.03937268, 1, 1, 1, 1, 1,
-0.3978679, 1.864334, -0.6496386, 1, 1, 1, 1, 1,
-0.3930857, -1.299387, -4.174603, 1, 1, 1, 1, 1,
-0.3927083, 1.756061, 0.3015161, 1, 1, 1, 1, 1,
-0.3844203, 0.7604765, 0.8221533, 1, 1, 1, 1, 1,
-0.3739825, -0.4758224, -2.421526, 1, 1, 1, 1, 1,
-0.3739227, -1.157458, -2.742527, 0, 0, 1, 1, 1,
-0.3706482, -0.3941839, -0.7461866, 1, 0, 0, 1, 1,
-0.3669384, 0.7743229, -1.587113, 1, 0, 0, 1, 1,
-0.3600513, -0.9107925, -3.169076, 1, 0, 0, 1, 1,
-0.3596858, 0.181485, 0.04872089, 1, 0, 0, 1, 1,
-0.3535851, 1.272762, -0.4027851, 1, 0, 0, 1, 1,
-0.3528876, -1.542919, -4.639412, 0, 0, 0, 1, 1,
-0.3437733, 1.845171, 0.1903156, 0, 0, 0, 1, 1,
-0.3437657, -0.1936517, -2.395348, 0, 0, 0, 1, 1,
-0.3418454, -0.2162724, -3.73, 0, 0, 0, 1, 1,
-0.3403692, -0.850643, -3.078292, 0, 0, 0, 1, 1,
-0.3333818, -0.1516893, -0.4755177, 0, 0, 0, 1, 1,
-0.3328104, 2.153628, -0.5091614, 0, 0, 0, 1, 1,
-0.3260705, -1.411137, -3.195889, 1, 1, 1, 1, 1,
-0.3229454, 0.5046405, -0.1975958, 1, 1, 1, 1, 1,
-0.3188238, -1.247768, -3.350709, 1, 1, 1, 1, 1,
-0.3131281, 0.431156, -1.610885, 1, 1, 1, 1, 1,
-0.3129752, 0.6132941, 0.2011257, 1, 1, 1, 1, 1,
-0.3114289, 1.121012, 0.06643863, 1, 1, 1, 1, 1,
-0.3013756, -0.8075284, -1.996534, 1, 1, 1, 1, 1,
-0.2963698, -0.4529635, -2.920989, 1, 1, 1, 1, 1,
-0.2959594, 0.1831863, -1.706039, 1, 1, 1, 1, 1,
-0.2897814, -0.2505809, -2.750876, 1, 1, 1, 1, 1,
-0.2885427, -0.09213625, -1.567513, 1, 1, 1, 1, 1,
-0.2856663, 0.6682445, 0.4899392, 1, 1, 1, 1, 1,
-0.2833762, 1.106548, -0.4735081, 1, 1, 1, 1, 1,
-0.2788883, -0.2763099, -2.994454, 1, 1, 1, 1, 1,
-0.273909, 0.2826053, 0.6789696, 1, 1, 1, 1, 1,
-0.2659901, 1.171427, -1.609131, 0, 0, 1, 1, 1,
-0.2641982, 2.513597, 0.6744839, 1, 0, 0, 1, 1,
-0.2626704, 1.017393, -0.2946038, 1, 0, 0, 1, 1,
-0.260718, 0.5271981, -1.340276, 1, 0, 0, 1, 1,
-0.2590671, -0.0100886, -0.05086679, 1, 0, 0, 1, 1,
-0.2547071, -0.01283718, -2.013638, 1, 0, 0, 1, 1,
-0.2463768, -1.210816, -2.120161, 0, 0, 0, 1, 1,
-0.2439069, -1.787558, -3.405656, 0, 0, 0, 1, 1,
-0.2422497, -0.8461608, -3.225311, 0, 0, 0, 1, 1,
-0.2409291, -1.578792, -2.770916, 0, 0, 0, 1, 1,
-0.2394472, 0.3284152, -0.1221509, 0, 0, 0, 1, 1,
-0.2375465, -0.9092227, -2.34981, 0, 0, 0, 1, 1,
-0.2371175, -0.888054, -2.585072, 0, 0, 0, 1, 1,
-0.2359909, -0.7993037, -0.7350257, 1, 1, 1, 1, 1,
-0.2357386, 1.035918, -1.781093, 1, 1, 1, 1, 1,
-0.2332267, -0.1261857, -0.273462, 1, 1, 1, 1, 1,
-0.2321625, -0.2507392, -2.937095, 1, 1, 1, 1, 1,
-0.2309221, 0.8848522, -0.9866418, 1, 1, 1, 1, 1,
-0.230354, 2.467269, 1.063856, 1, 1, 1, 1, 1,
-0.2270889, 0.2816305, 0.7557639, 1, 1, 1, 1, 1,
-0.2262682, -0.434919, -4.689051, 1, 1, 1, 1, 1,
-0.2234723, -1.312051, -0.6827754, 1, 1, 1, 1, 1,
-0.2213178, -0.8530518, -1.258659, 1, 1, 1, 1, 1,
-0.220167, -0.3807292, -1.95391, 1, 1, 1, 1, 1,
-0.2162144, -0.6468199, -3.634837, 1, 1, 1, 1, 1,
-0.2113023, -1.562254, -3.339856, 1, 1, 1, 1, 1,
-0.2023286, 1.191157, -0.01221365, 1, 1, 1, 1, 1,
-0.1996459, 1.251985, -0.5948094, 1, 1, 1, 1, 1,
-0.1981095, -0.04399408, -2.773589, 0, 0, 1, 1, 1,
-0.1969774, -0.3907185, -2.77071, 1, 0, 0, 1, 1,
-0.1895176, 0.02926782, -2.126609, 1, 0, 0, 1, 1,
-0.1895173, 1.210553, 0.4773163, 1, 0, 0, 1, 1,
-0.1858036, 0.4859621, -0.4675093, 1, 0, 0, 1, 1,
-0.1832182, -0.1496279, -1.457864, 1, 0, 0, 1, 1,
-0.1832001, -0.4777834, -3.371435, 0, 0, 0, 1, 1,
-0.1830776, 0.3050007, 0.07447384, 0, 0, 0, 1, 1,
-0.1799592, -0.9524348, -3.184329, 0, 0, 0, 1, 1,
-0.1786756, -0.302944, -2.805177, 0, 0, 0, 1, 1,
-0.1777513, 1.005687, -1.586982, 0, 0, 0, 1, 1,
-0.1765153, 0.1394397, -2.282565, 0, 0, 0, 1, 1,
-0.1756272, -1.197231, -2.460454, 0, 0, 0, 1, 1,
-0.1680012, -0.01103643, -1.812474, 1, 1, 1, 1, 1,
-0.1667881, -0.9749358, -1.372436, 1, 1, 1, 1, 1,
-0.1617419, -0.9207706, -3.074353, 1, 1, 1, 1, 1,
-0.1569761, -0.1344868, -1.668872, 1, 1, 1, 1, 1,
-0.1548884, 0.4830054, 1.176904, 1, 1, 1, 1, 1,
-0.1514177, -0.7729103, -2.048519, 1, 1, 1, 1, 1,
-0.1509321, -0.8922563, -3.878941, 1, 1, 1, 1, 1,
-0.1490865, 1.488551, -0.09384853, 1, 1, 1, 1, 1,
-0.1453501, 0.4262645, -1.932466, 1, 1, 1, 1, 1,
-0.1403647, 1.197441, 0.4181376, 1, 1, 1, 1, 1,
-0.1402498, -1.737007, -5.177812, 1, 1, 1, 1, 1,
-0.1372721, -0.4868176, -1.320818, 1, 1, 1, 1, 1,
-0.1365983, 2.582786, -0.8361369, 1, 1, 1, 1, 1,
-0.1341366, -0.3505876, -1.831729, 1, 1, 1, 1, 1,
-0.130654, 0.4219856, -0.8272361, 1, 1, 1, 1, 1,
-0.1304452, 0.4456336, -0.5460276, 0, 0, 1, 1, 1,
-0.12939, 0.2113519, 0.2446976, 1, 0, 0, 1, 1,
-0.1262446, 0.7010657, -0.1298713, 1, 0, 0, 1, 1,
-0.1224997, 0.5033753, -6.181583e-06, 1, 0, 0, 1, 1,
-0.1193124, -0.7849616, -1.559085, 1, 0, 0, 1, 1,
-0.118889, -1.014154, -4.922957, 1, 0, 0, 1, 1,
-0.1137744, 2.049126, 0.7991219, 0, 0, 0, 1, 1,
-0.1128753, 1.123999, -1.305609, 0, 0, 0, 1, 1,
-0.1057289, 0.3478675, -0.8015618, 0, 0, 0, 1, 1,
-0.1038403, -0.8094359, -3.574168, 0, 0, 0, 1, 1,
-0.1014789, 0.88485, -0.1214565, 0, 0, 0, 1, 1,
-0.101088, -0.2369238, -3.188562, 0, 0, 0, 1, 1,
-0.1008975, 1.128734, 1.236744, 0, 0, 0, 1, 1,
-0.0998523, -2.240258, -4.001228, 1, 1, 1, 1, 1,
-0.09810479, -0.3167376, -4.182106, 1, 1, 1, 1, 1,
-0.08693491, 0.6249806, -0.06161146, 1, 1, 1, 1, 1,
-0.08630648, 0.9921741, -0.3814133, 1, 1, 1, 1, 1,
-0.08414025, -0.8761408, -3.315982, 1, 1, 1, 1, 1,
-0.08257867, -0.6574, -1.771029, 1, 1, 1, 1, 1,
-0.08237411, 0.8231573, -1.295949, 1, 1, 1, 1, 1,
-0.08169572, 1.694981, 0.9084498, 1, 1, 1, 1, 1,
-0.08013532, 2.089185, 0.3887584, 1, 1, 1, 1, 1,
-0.07799906, 1.124717, 0.1734596, 1, 1, 1, 1, 1,
-0.07035543, 0.1459042, 0.1892191, 1, 1, 1, 1, 1,
-0.06970395, 0.07893581, -0.4417642, 1, 1, 1, 1, 1,
-0.06658067, 0.9633579, 0.8109431, 1, 1, 1, 1, 1,
-0.06129128, 0.8416278, 0.01732848, 1, 1, 1, 1, 1,
-0.06057526, 0.1478723, 0.8091741, 1, 1, 1, 1, 1,
-0.05852297, -0.4325729, -3.19818, 0, 0, 1, 1, 1,
-0.05825837, 1.524243, -0.5936274, 1, 0, 0, 1, 1,
-0.05519324, 0.1270418, -1.343315, 1, 0, 0, 1, 1,
-0.05332765, 1.083785, 0.1285186, 1, 0, 0, 1, 1,
-0.05031343, 0.1150611, 0.2233356, 1, 0, 0, 1, 1,
-0.04150321, -0.8544001, -3.659153, 1, 0, 0, 1, 1,
-0.03744468, -0.2391811, -3.21406, 0, 0, 0, 1, 1,
-0.03603214, -0.9383775, -2.628364, 0, 0, 0, 1, 1,
-0.03239689, -1.442898, -3.960552, 0, 0, 0, 1, 1,
-0.02805735, 0.2133878, 1.148016, 0, 0, 0, 1, 1,
-0.02621032, 1.154557, -1.0712, 0, 0, 0, 1, 1,
-0.02272518, -0.6739011, -4.575575, 0, 0, 0, 1, 1,
-0.02094969, 0.8480154, -0.4756857, 0, 0, 0, 1, 1,
-0.02030352, -0.07586487, -4.310401, 1, 1, 1, 1, 1,
-0.01883697, 0.3240946, 0.4800668, 1, 1, 1, 1, 1,
-0.009244159, 0.3876631, -0.00486218, 1, 1, 1, 1, 1,
-0.006502396, -0.2198853, -3.588622, 1, 1, 1, 1, 1,
-0.003475755, -0.5571308, -2.718833, 1, 1, 1, 1, 1,
-0.0002048817, 1.945445, -0.1755014, 1, 1, 1, 1, 1,
0.00100685, -0.6761913, 3.045306, 1, 1, 1, 1, 1,
0.007210983, -0.5282822, 2.671262, 1, 1, 1, 1, 1,
0.009407949, 0.4223585, 0.9895661, 1, 1, 1, 1, 1,
0.009935136, 0.2884348, 0.2093034, 1, 1, 1, 1, 1,
0.01746912, 0.4655853, 0.4202015, 1, 1, 1, 1, 1,
0.01965715, 1.755094, -1.003746, 1, 1, 1, 1, 1,
0.02213888, -1.356585, 5.534309, 1, 1, 1, 1, 1,
0.02364067, 0.6445176, 0.6830241, 1, 1, 1, 1, 1,
0.02493284, -0.5868884, 1.007395, 1, 1, 1, 1, 1,
0.02749619, -0.2313873, 2.038598, 0, 0, 1, 1, 1,
0.02881026, 1.116769, -0.614176, 1, 0, 0, 1, 1,
0.03341645, -2.030431, 5.848864, 1, 0, 0, 1, 1,
0.03373999, -0.7902656, 3.401563, 1, 0, 0, 1, 1,
0.0408568, -0.1047947, 1.231753, 1, 0, 0, 1, 1,
0.04521163, -0.2340815, 4.103581, 1, 0, 0, 1, 1,
0.04722472, 0.3885676, -0.5208466, 0, 0, 0, 1, 1,
0.04758062, 0.2008013, 1.009727, 0, 0, 0, 1, 1,
0.05225782, -0.7856488, 3.129021, 0, 0, 0, 1, 1,
0.05232295, -0.8962241, 2.500841, 0, 0, 0, 1, 1,
0.05288636, -0.2621178, 2.794413, 0, 0, 0, 1, 1,
0.05391029, 1.351602, -0.5816647, 0, 0, 0, 1, 1,
0.05664616, -0.4798336, 1.426642, 0, 0, 0, 1, 1,
0.05747374, 0.1854426, 0.4984855, 1, 1, 1, 1, 1,
0.05925242, 0.2211739, 0.3621498, 1, 1, 1, 1, 1,
0.06408624, -1.308225, 5.424736, 1, 1, 1, 1, 1,
0.06527283, -0.8923692, 4.195299, 1, 1, 1, 1, 1,
0.06635678, 0.5718758, 1.365385, 1, 1, 1, 1, 1,
0.06652777, -0.785736, 3.024172, 1, 1, 1, 1, 1,
0.06889179, 0.0624847, 1.674147, 1, 1, 1, 1, 1,
0.07009274, -0.464572, 2.290171, 1, 1, 1, 1, 1,
0.08002266, 2.220246, -0.05275461, 1, 1, 1, 1, 1,
0.08236045, 0.8897541, -0.1478318, 1, 1, 1, 1, 1,
0.08484686, -0.6357152, 1.15712, 1, 1, 1, 1, 1,
0.08825481, 0.2192968, 0.1118979, 1, 1, 1, 1, 1,
0.08897018, 0.6230052, 0.5334781, 1, 1, 1, 1, 1,
0.09107434, -0.2720631, 4.433943, 1, 1, 1, 1, 1,
0.09144253, -2.048944, 4.356066, 1, 1, 1, 1, 1,
0.09506808, 0.08705761, -0.1332924, 0, 0, 1, 1, 1,
0.09615201, 0.5964035, -1.052536, 1, 0, 0, 1, 1,
0.09737173, -0.05807134, 1.03156, 1, 0, 0, 1, 1,
0.1061084, -1.870434, 4.55228, 1, 0, 0, 1, 1,
0.1078806, 0.5877386, 2.325913, 1, 0, 0, 1, 1,
0.1080534, 0.5950735, 1.832804, 1, 0, 0, 1, 1,
0.1097214, -0.06892375, 1.693508, 0, 0, 0, 1, 1,
0.1124806, -0.2652844, 1.173712, 0, 0, 0, 1, 1,
0.1130004, -0.5604485, 1.064321, 0, 0, 0, 1, 1,
0.1137525, -0.2388363, 2.50631, 0, 0, 0, 1, 1,
0.1137542, 0.9073814, 0.590555, 0, 0, 0, 1, 1,
0.116733, 0.3358447, -0.6736665, 0, 0, 0, 1, 1,
0.1174676, 0.244566, 0.610833, 0, 0, 0, 1, 1,
0.1180481, 1.597307, 2.184018, 1, 1, 1, 1, 1,
0.1201111, 0.4049134, 1.260506, 1, 1, 1, 1, 1,
0.1228114, 1.48033, 0.551284, 1, 1, 1, 1, 1,
0.1236626, -0.7897971, 4.876102, 1, 1, 1, 1, 1,
0.1258369, 0.5624419, 0.04027965, 1, 1, 1, 1, 1,
0.1284391, 0.3802015, 1.278386, 1, 1, 1, 1, 1,
0.1286495, 0.3004368, 1.576462, 1, 1, 1, 1, 1,
0.1325374, 0.5809984, 1.425166, 1, 1, 1, 1, 1,
0.139356, -0.7290066, 1.718308, 1, 1, 1, 1, 1,
0.1395237, 0.07915417, 0.3341343, 1, 1, 1, 1, 1,
0.1421402, 0.9448168, -2.451597, 1, 1, 1, 1, 1,
0.1427489, -0.6050915, 4.890734, 1, 1, 1, 1, 1,
0.1446604, 1.321945, -0.724328, 1, 1, 1, 1, 1,
0.1455957, 0.3676715, 2.152313, 1, 1, 1, 1, 1,
0.1472165, 0.2923383, 0.1660515, 1, 1, 1, 1, 1,
0.1475623, -0.3897102, 3.391039, 0, 0, 1, 1, 1,
0.1510502, -0.477548, 2.321818, 1, 0, 0, 1, 1,
0.1576399, -0.8476996, 3.146762, 1, 0, 0, 1, 1,
0.1609931, -1.140913, 3.949256, 1, 0, 0, 1, 1,
0.1627019, -2.310071, 3.677067, 1, 0, 0, 1, 1,
0.1636563, -1.406071, 4.265529, 1, 0, 0, 1, 1,
0.1640881, 0.4491537, 0.3112111, 0, 0, 0, 1, 1,
0.1646611, -0.9241333, 3.297017, 0, 0, 0, 1, 1,
0.1669788, 0.2708663, 3.195423, 0, 0, 0, 1, 1,
0.1674094, 0.8491229, 0.6931606, 0, 0, 0, 1, 1,
0.1720403, -1.436695, 3.956331, 0, 0, 0, 1, 1,
0.1757258, -0.05908566, 1.198746, 0, 0, 0, 1, 1,
0.1760456, -1.778055, 2.447437, 0, 0, 0, 1, 1,
0.1761269, -1.375712, 4.264712, 1, 1, 1, 1, 1,
0.1771453, -0.9543497, 2.309396, 1, 1, 1, 1, 1,
0.1781572, 0.5362508, 0.624605, 1, 1, 1, 1, 1,
0.1818571, -0.8155184, 4.519287, 1, 1, 1, 1, 1,
0.1830389, 0.766643, 0.3141921, 1, 1, 1, 1, 1,
0.1865819, 0.1821071, 3.202913, 1, 1, 1, 1, 1,
0.1904866, 1.109825, -0.08407879, 1, 1, 1, 1, 1,
0.1918235, 0.4929797, 0.3807273, 1, 1, 1, 1, 1,
0.1963872, -1.228977, 3.036043, 1, 1, 1, 1, 1,
0.1980363, 3.539269, -1.388617, 1, 1, 1, 1, 1,
0.2002142, -0.286786, 2.734248, 1, 1, 1, 1, 1,
0.2015598, -0.07861497, 2.620185, 1, 1, 1, 1, 1,
0.2023867, -0.05379868, 1.636982, 1, 1, 1, 1, 1,
0.2042587, -1.042423, 1.800005, 1, 1, 1, 1, 1,
0.2057717, -1.090728, 2.208962, 1, 1, 1, 1, 1,
0.2074631, -0.3507493, 3.531619, 0, 0, 1, 1, 1,
0.2074784, 0.02034505, 0.6024648, 1, 0, 0, 1, 1,
0.2090936, 0.9459154, 2.48543, 1, 0, 0, 1, 1,
0.2144495, -0.1518202, 0.9115086, 1, 0, 0, 1, 1,
0.2297256, -1.891263, 1.323896, 1, 0, 0, 1, 1,
0.2344252, -2.000738, 4.151908, 1, 0, 0, 1, 1,
0.2389616, 0.2604508, 0.3960159, 0, 0, 0, 1, 1,
0.2393766, -1.594313, 1.575452, 0, 0, 0, 1, 1,
0.2426426, -0.001603216, 0.4716451, 0, 0, 0, 1, 1,
0.243746, -0.874955, 2.773402, 0, 0, 0, 1, 1,
0.2441765, -0.2394898, 1.135573, 0, 0, 0, 1, 1,
0.2445645, -0.4266695, 1.366782, 0, 0, 0, 1, 1,
0.2450848, 0.2778671, 0.7862625, 0, 0, 0, 1, 1,
0.2478301, -1.051148, 3.935716, 1, 1, 1, 1, 1,
0.2489507, -0.6448092, 2.265509, 1, 1, 1, 1, 1,
0.2546364, 0.9906163, -0.2574467, 1, 1, 1, 1, 1,
0.2556185, -0.1870482, 1.389459, 1, 1, 1, 1, 1,
0.2565713, 1.772975, 1.273393, 1, 1, 1, 1, 1,
0.2575789, -0.07219774, 1.061384, 1, 1, 1, 1, 1,
0.2608521, -0.7503497, 1.784228, 1, 1, 1, 1, 1,
0.2694424, -0.00568562, 1.745861, 1, 1, 1, 1, 1,
0.2696784, -0.7128826, 1.933667, 1, 1, 1, 1, 1,
0.2722134, 0.5216143, 0.5823368, 1, 1, 1, 1, 1,
0.2735007, -1.740817, 2.759341, 1, 1, 1, 1, 1,
0.2780114, 0.1426025, 2.069109, 1, 1, 1, 1, 1,
0.2785449, -0.2507674, 3.858492, 1, 1, 1, 1, 1,
0.2816807, 0.7723905, 1.214724, 1, 1, 1, 1, 1,
0.2825956, 0.08189713, 0.9156232, 1, 1, 1, 1, 1,
0.2837646, -0.07768402, 2.177032, 0, 0, 1, 1, 1,
0.2913128, 1.080343, 0.05396722, 1, 0, 0, 1, 1,
0.2927301, -0.4974056, 1.196348, 1, 0, 0, 1, 1,
0.2992018, -0.1457349, 2.213555, 1, 0, 0, 1, 1,
0.2992298, -0.7537176, 3.298345, 1, 0, 0, 1, 1,
0.2993122, 0.6614332, -0.009102344, 1, 0, 0, 1, 1,
0.3056679, 0.2384953, 1.675052, 0, 0, 0, 1, 1,
0.3096766, 0.02000869, 0.6700806, 0, 0, 0, 1, 1,
0.3103172, 1.321322, 1.581096, 0, 0, 0, 1, 1,
0.3111679, 0.5716839, 0.09769792, 0, 0, 0, 1, 1,
0.3150759, 0.4868659, -1.748132, 0, 0, 0, 1, 1,
0.3170132, 0.1888472, -0.344526, 0, 0, 0, 1, 1,
0.3180392, 1.139618, 0.3283979, 0, 0, 0, 1, 1,
0.3197661, -0.1497685, 1.075186, 1, 1, 1, 1, 1,
0.3217124, 0.6635296, 0.4852438, 1, 1, 1, 1, 1,
0.3260618, -1.588022, 3.475039, 1, 1, 1, 1, 1,
0.3278902, -0.6593487, 1.82957, 1, 1, 1, 1, 1,
0.3325263, -1.751678, 2.238987, 1, 1, 1, 1, 1,
0.3344037, -2.792111, 1.96498, 1, 1, 1, 1, 1,
0.3459476, 1.257025, 1.044224, 1, 1, 1, 1, 1,
0.3485848, 1.363582, -0.756985, 1, 1, 1, 1, 1,
0.3493424, -0.03961222, 1.927691, 1, 1, 1, 1, 1,
0.3574867, 0.1113863, 1.802312, 1, 1, 1, 1, 1,
0.3582472, 0.07730439, 1.953104, 1, 1, 1, 1, 1,
0.3609972, -0.7192931, 2.112643, 1, 1, 1, 1, 1,
0.3625396, -0.3433623, 0.5528247, 1, 1, 1, 1, 1,
0.3648893, 0.737583, 0.2074192, 1, 1, 1, 1, 1,
0.3724062, 0.6204436, 1.238537, 1, 1, 1, 1, 1,
0.3775308, -0.6010255, 0.9840879, 0, 0, 1, 1, 1,
0.3863259, -1.113473, 3.109735, 1, 0, 0, 1, 1,
0.3878206, 0.1961259, -0.03662328, 1, 0, 0, 1, 1,
0.3887396, -0.01480292, 0.7930859, 1, 0, 0, 1, 1,
0.3915788, 0.7206265, 0.3492573, 1, 0, 0, 1, 1,
0.3929423, -1.368672, 1.306135, 1, 0, 0, 1, 1,
0.3989071, -0.4452365, 2.678925, 0, 0, 0, 1, 1,
0.4004206, 0.7122189, 1.818833, 0, 0, 0, 1, 1,
0.4017374, 0.8806612, 1.802208, 0, 0, 0, 1, 1,
0.4082365, 0.6291354, 0.7742005, 0, 0, 0, 1, 1,
0.4112329, -0.3383232, 1.161493, 0, 0, 0, 1, 1,
0.4125779, -0.532495, 2.767694, 0, 0, 0, 1, 1,
0.4142973, 0.8661757, -0.2966833, 0, 0, 0, 1, 1,
0.4169134, 0.2269056, 2.185381, 1, 1, 1, 1, 1,
0.4174485, 1.369519, -0.4075994, 1, 1, 1, 1, 1,
0.4174899, 0.8128611, -0.03707095, 1, 1, 1, 1, 1,
0.4183106, -0.7347845, 4.376336, 1, 1, 1, 1, 1,
0.4263861, 0.9517121, 0.8673279, 1, 1, 1, 1, 1,
0.4317238, 0.01949426, -0.1494491, 1, 1, 1, 1, 1,
0.4346393, 0.4564976, 0.9870265, 1, 1, 1, 1, 1,
0.4350085, 0.9120892, 0.02212385, 1, 1, 1, 1, 1,
0.435296, -0.5366596, 2.737174, 1, 1, 1, 1, 1,
0.4354226, 1.466774, 1.248314, 1, 1, 1, 1, 1,
0.4361327, 1.694188, 1.618325, 1, 1, 1, 1, 1,
0.4374757, 0.3586378, 0.4517887, 1, 1, 1, 1, 1,
0.4393993, -0.9655027, 2.8515, 1, 1, 1, 1, 1,
0.4414059, 0.3638815, -0.973874, 1, 1, 1, 1, 1,
0.444432, -0.938239, 1.929433, 1, 1, 1, 1, 1,
0.4493558, -0.500455, 3.355876, 0, 0, 1, 1, 1,
0.4499562, 1.448977, -0.8160003, 1, 0, 0, 1, 1,
0.4532185, 1.8846, 1.114414, 1, 0, 0, 1, 1,
0.4557027, 0.2079514, -0.2611517, 1, 0, 0, 1, 1,
0.4567362, -1.126726, 3.425165, 1, 0, 0, 1, 1,
0.4580612, 0.6127343, 0.4810837, 1, 0, 0, 1, 1,
0.4585086, 0.3009765, 2.008635, 0, 0, 0, 1, 1,
0.4604956, 0.5666695, -0.5876476, 0, 0, 0, 1, 1,
0.4636015, 0.2969601, -0.2165617, 0, 0, 0, 1, 1,
0.4683934, -0.7361686, 1.838796, 0, 0, 0, 1, 1,
0.4715855, 1.312971, -0.1514538, 0, 0, 0, 1, 1,
0.4725261, 0.09868013, 1.271292, 0, 0, 0, 1, 1,
0.4728638, 0.03823188, 1.390456, 0, 0, 0, 1, 1,
0.4742545, 0.2658912, 0.3420858, 1, 1, 1, 1, 1,
0.474636, -0.8730952, 3.317561, 1, 1, 1, 1, 1,
0.4757493, 1.855482, -1.115196, 1, 1, 1, 1, 1,
0.4797731, -0.1485566, 2.684562, 1, 1, 1, 1, 1,
0.4838867, -1.198114, 3.528736, 1, 1, 1, 1, 1,
0.4874333, 0.9164189, 1.446543, 1, 1, 1, 1, 1,
0.4886468, 0.1270573, 1.539069, 1, 1, 1, 1, 1,
0.4891353, 1.402943, -0.2708111, 1, 1, 1, 1, 1,
0.490757, 0.3226535, 0.02047857, 1, 1, 1, 1, 1,
0.4908714, -2.088224, 2.11862, 1, 1, 1, 1, 1,
0.498098, 0.7742729, -0.1126376, 1, 1, 1, 1, 1,
0.5021043, 1.032694, 2.104909, 1, 1, 1, 1, 1,
0.50635, 1.615749, 1.839957, 1, 1, 1, 1, 1,
0.5093003, 0.8112061, 0.2015716, 1, 1, 1, 1, 1,
0.5112925, -0.3198139, 3.268981, 1, 1, 1, 1, 1,
0.5134838, -0.4101666, 1.19163, 0, 0, 1, 1, 1,
0.5163792, -0.9411741, 1.321057, 1, 0, 0, 1, 1,
0.5165119, -0.8960108, 2.968198, 1, 0, 0, 1, 1,
0.5166207, -0.2769053, 0.6602782, 1, 0, 0, 1, 1,
0.5178102, -1.610915, 2.498727, 1, 0, 0, 1, 1,
0.523186, 0.8051041, 0.943992, 1, 0, 0, 1, 1,
0.5288299, -0.3534876, 2.105856, 0, 0, 0, 1, 1,
0.5347155, -0.7411647, 4.670704, 0, 0, 0, 1, 1,
0.5350929, -1.271554, 4.719675, 0, 0, 0, 1, 1,
0.5361477, -0.3732944, 1.979355, 0, 0, 0, 1, 1,
0.5394642, 0.1461553, 2.849262, 0, 0, 0, 1, 1,
0.5407541, 0.2572685, -0.4822706, 0, 0, 0, 1, 1,
0.5409062, 1.191409, 0.5132871, 0, 0, 0, 1, 1,
0.541034, -1.046714, 1.771473, 1, 1, 1, 1, 1,
0.5432765, -1.064283, 2.174506, 1, 1, 1, 1, 1,
0.5478298, -0.1948655, 1.405607, 1, 1, 1, 1, 1,
0.5563545, 1.029567, -0.001000976, 1, 1, 1, 1, 1,
0.5622458, -1.551628, 1.967003, 1, 1, 1, 1, 1,
0.5645348, -0.4363013, 3.62121, 1, 1, 1, 1, 1,
0.567516, 0.1477168, 1.609882, 1, 1, 1, 1, 1,
0.5777053, -0.413014, 1.725452, 1, 1, 1, 1, 1,
0.5826447, 2.206825, -0.6347758, 1, 1, 1, 1, 1,
0.5831757, -0.530521, 1.845155, 1, 1, 1, 1, 1,
0.5923841, -0.4292621, 3.464647, 1, 1, 1, 1, 1,
0.6001706, -0.3965351, 2.416171, 1, 1, 1, 1, 1,
0.6058266, 1.039734, -0.09935436, 1, 1, 1, 1, 1,
0.6066772, -1.536211, 5.52003, 1, 1, 1, 1, 1,
0.6138804, 0.7993926, 0.9007872, 1, 1, 1, 1, 1,
0.6154669, -0.4393495, 2.09742, 0, 0, 1, 1, 1,
0.62186, -0.490554, 2.358558, 1, 0, 0, 1, 1,
0.6224254, 1.024856, -0.7651168, 1, 0, 0, 1, 1,
0.622477, 0.03606397, -0.1906957, 1, 0, 0, 1, 1,
0.6240923, -1.160481, 3.414546, 1, 0, 0, 1, 1,
0.6293976, 0.2856508, 1.276983, 1, 0, 0, 1, 1,
0.6312512, 0.9435597, 0.6037309, 0, 0, 0, 1, 1,
0.6337098, 0.5879824, -0.9610493, 0, 0, 0, 1, 1,
0.6360655, 0.4529893, 0.6069579, 0, 0, 0, 1, 1,
0.6377739, -0.9028819, 1.724237, 0, 0, 0, 1, 1,
0.6388264, -2.200808, 4.725483, 0, 0, 0, 1, 1,
0.6501293, 0.6188315, 2.922298, 0, 0, 0, 1, 1,
0.6551092, -0.6340936, 1.887295, 0, 0, 0, 1, 1,
0.6570854, 0.6487929, 0.6184724, 1, 1, 1, 1, 1,
0.6591869, 0.7537893, 1.468026, 1, 1, 1, 1, 1,
0.6604142, -1.111994, 1.805095, 1, 1, 1, 1, 1,
0.6616827, -0.2205399, 0.7830588, 1, 1, 1, 1, 1,
0.6644727, 0.3956603, 0.9928687, 1, 1, 1, 1, 1,
0.6654772, -0.4548916, 0.8691772, 1, 1, 1, 1, 1,
0.6657971, 0.4758033, -1.487429, 1, 1, 1, 1, 1,
0.6704535, 1.03616, 0.9394067, 1, 1, 1, 1, 1,
0.6720282, -1.124173, 1.386119, 1, 1, 1, 1, 1,
0.6722691, 1.527996, -0.5331147, 1, 1, 1, 1, 1,
0.673596, -0.5828584, 1.391639, 1, 1, 1, 1, 1,
0.6764991, -0.8229519, 2.241494, 1, 1, 1, 1, 1,
0.6804043, 0.245283, -0.01076424, 1, 1, 1, 1, 1,
0.6806102, 0.04181709, 0.05079776, 1, 1, 1, 1, 1,
0.681377, -0.1754654, 2.913105, 1, 1, 1, 1, 1,
0.682317, 1.092362, 3.541142, 0, 0, 1, 1, 1,
0.6877043, -0.8810057, 2.007248, 1, 0, 0, 1, 1,
0.687786, 2.338095, -1.21676, 1, 0, 0, 1, 1,
0.6921478, -0.519549, 2.617659, 1, 0, 0, 1, 1,
0.6925869, 1.019687, -0.3596138, 1, 0, 0, 1, 1,
0.6981627, -0.9887192, 2.547004, 1, 0, 0, 1, 1,
0.7031209, -1.810335, 1.056932, 0, 0, 0, 1, 1,
0.7032852, -1.241757, 1.666979, 0, 0, 0, 1, 1,
0.7050797, -0.5419492, 0.9055573, 0, 0, 0, 1, 1,
0.7055054, 3.049312, 2.063303, 0, 0, 0, 1, 1,
0.7077962, 0.04187349, 2.759974, 0, 0, 0, 1, 1,
0.7118717, -0.8689871, 2.237728, 0, 0, 0, 1, 1,
0.7155976, -1.647273, 4.35988, 0, 0, 0, 1, 1,
0.719964, -2.840768, 1.6294, 1, 1, 1, 1, 1,
0.720237, -0.8698236, 0.5199237, 1, 1, 1, 1, 1,
0.7428271, -0.7149348, 4.164579, 1, 1, 1, 1, 1,
0.7436144, 0.3494564, -0.4488421, 1, 1, 1, 1, 1,
0.7445979, 0.2792965, 0.1620131, 1, 1, 1, 1, 1,
0.7553011, -0.2992193, 2.839699, 1, 1, 1, 1, 1,
0.7576565, -0.2882217, -0.173987, 1, 1, 1, 1, 1,
0.7620394, 0.2921135, 0.8762271, 1, 1, 1, 1, 1,
0.7632378, 0.2377675, 3.97615, 1, 1, 1, 1, 1,
0.7757131, 0.1036423, -0.0282417, 1, 1, 1, 1, 1,
0.7775133, 0.03706894, 1.314217, 1, 1, 1, 1, 1,
0.7789477, -0.02751694, 0.8453589, 1, 1, 1, 1, 1,
0.779135, -0.1637948, 2.231898, 1, 1, 1, 1, 1,
0.7823601, 0.7216355, 0.3081289, 1, 1, 1, 1, 1,
0.7855338, 1.183247, 0.2690215, 1, 1, 1, 1, 1,
0.7867094, 0.4712712, -0.2191473, 0, 0, 1, 1, 1,
0.7892146, 0.8811087, 0.009987265, 1, 0, 0, 1, 1,
0.7893839, -0.9072219, 0.644909, 1, 0, 0, 1, 1,
0.7949346, -1.525161, 1.876446, 1, 0, 0, 1, 1,
0.7959881, 0.01431392, 1.081121, 1, 0, 0, 1, 1,
0.7965186, -2.067205, 3.709956, 1, 0, 0, 1, 1,
0.797169, 1.144897, 2.375662, 0, 0, 0, 1, 1,
0.7977778, 0.144392, 0.6215367, 0, 0, 0, 1, 1,
0.7987324, 0.1985393, 1.219581, 0, 0, 0, 1, 1,
0.8003963, -0.993445, 3.74902, 0, 0, 0, 1, 1,
0.8025506, -1.307458, 2.017377, 0, 0, 0, 1, 1,
0.8138041, -0.1634782, 0.9517174, 0, 0, 0, 1, 1,
0.8148285, 0.393065, 1.871228, 0, 0, 0, 1, 1,
0.8156551, 0.8870987, 0.1816389, 1, 1, 1, 1, 1,
0.8184103, -0.3058557, 0.895084, 1, 1, 1, 1, 1,
0.8241279, 2.032652, 1.284211, 1, 1, 1, 1, 1,
0.8246253, 0.5605868, 1.529764, 1, 1, 1, 1, 1,
0.8288584, 0.4167962, 1.592396, 1, 1, 1, 1, 1,
0.830985, 0.8798475, 2.296328, 1, 1, 1, 1, 1,
0.837318, -0.316909, 2.692163, 1, 1, 1, 1, 1,
0.8492023, 0.3082247, 2.374513, 1, 1, 1, 1, 1,
0.8516878, 0.4081726, 2.258725, 1, 1, 1, 1, 1,
0.8522152, -0.7984294, 2.752099, 1, 1, 1, 1, 1,
0.8530385, -0.671556, 0.8993565, 1, 1, 1, 1, 1,
0.8560529, 1.90231, -1.204533, 1, 1, 1, 1, 1,
0.8594622, 1.593821, 0.3338284, 1, 1, 1, 1, 1,
0.8644896, 0.06247319, 1.771205, 1, 1, 1, 1, 1,
0.8646498, -1.093311, 1.93229, 1, 1, 1, 1, 1,
0.8666878, 0.3031118, 1.472473, 0, 0, 1, 1, 1,
0.8695288, -1.997673, 2.781098, 1, 0, 0, 1, 1,
0.8779991, -0.05005279, 0.04143928, 1, 0, 0, 1, 1,
0.8789212, -1.850928, 4.322605, 1, 0, 0, 1, 1,
0.8801618, -1.377597, 3.268989, 1, 0, 0, 1, 1,
0.8861636, 1.370736, -0.5603456, 1, 0, 0, 1, 1,
0.8898737, 1.029954, 1.726583, 0, 0, 0, 1, 1,
0.8977628, 0.6851389, 2.818552, 0, 0, 0, 1, 1,
0.8987693, -1.218379, 1.747811, 0, 0, 0, 1, 1,
0.9005983, -1.047349, 0.9438475, 0, 0, 0, 1, 1,
0.903427, 1.269322, 1.736973, 0, 0, 0, 1, 1,
0.9041955, 1.424322, -0.6197551, 0, 0, 0, 1, 1,
0.9044497, 2.523873, -0.4269411, 0, 0, 0, 1, 1,
0.9084637, 0.3769548, -0.4516434, 1, 1, 1, 1, 1,
0.9091877, 1.757691, -0.8102524, 1, 1, 1, 1, 1,
0.9120644, -0.5538103, 1.947425, 1, 1, 1, 1, 1,
0.913964, -1.432569, 3.570263, 1, 1, 1, 1, 1,
0.9183214, 1.991395, 1.339715, 1, 1, 1, 1, 1,
0.9201106, 1.071024, 0.7213457, 1, 1, 1, 1, 1,
0.9203872, -1.73061, 2.638734, 1, 1, 1, 1, 1,
0.9231927, 1.679601, 0.01843314, 1, 1, 1, 1, 1,
0.9250146, 1.681619, 0.3911629, 1, 1, 1, 1, 1,
0.9302808, -0.3583231, 1.885718, 1, 1, 1, 1, 1,
0.9305467, 0.7789524, -0.2532375, 1, 1, 1, 1, 1,
0.9361254, -0.6927003, 2.408723, 1, 1, 1, 1, 1,
0.9381601, -0.4434181, 1.281802, 1, 1, 1, 1, 1,
0.9423455, -0.3620316, 2.639249, 1, 1, 1, 1, 1,
0.9458239, -0.3378923, 3.159193, 1, 1, 1, 1, 1,
0.9461829, -0.1121984, 2.663446, 0, 0, 1, 1, 1,
0.9551954, 1.519868, -0.5334561, 1, 0, 0, 1, 1,
0.9569179, -0.142421, 3.172211, 1, 0, 0, 1, 1,
0.9588826, -0.4201382, 0.8296605, 1, 0, 0, 1, 1,
0.9632651, -0.8665298, 1.697555, 1, 0, 0, 1, 1,
0.9660352, -0.368122, 2.848795, 1, 0, 0, 1, 1,
0.9666166, 1.495242, 1.960326, 0, 0, 0, 1, 1,
0.9672554, -0.4321432, 2.488101, 0, 0, 0, 1, 1,
0.9679177, 0.1158768, 0.4843081, 0, 0, 0, 1, 1,
0.9710651, -0.6641206, 1.946984, 0, 0, 0, 1, 1,
0.973638, -1.219203, 2.729167, 0, 0, 0, 1, 1,
0.9769985, 1.09358, 0.7363276, 0, 0, 0, 1, 1,
0.978747, 1.136513, 0.6659247, 0, 0, 0, 1, 1,
0.9790083, 0.1933124, 1.596471, 1, 1, 1, 1, 1,
0.9938372, 1.026202, -1.568961, 1, 1, 1, 1, 1,
0.9961585, -0.3880684, 2.738162, 1, 1, 1, 1, 1,
1.006178, -0.9411081, 1.829219, 1, 1, 1, 1, 1,
1.012318, -0.01177345, 0.4542565, 1, 1, 1, 1, 1,
1.014651, -1.379213, 4.233449, 1, 1, 1, 1, 1,
1.018744, -0.7326069, 2.901932, 1, 1, 1, 1, 1,
1.019153, -0.3469231, 1.280014, 1, 1, 1, 1, 1,
1.027324, 0.1801311, 0.7413921, 1, 1, 1, 1, 1,
1.041301, 0.1549505, 3.271865, 1, 1, 1, 1, 1,
1.043497, -1.410897, 3.15466, 1, 1, 1, 1, 1,
1.050851, 1.144249, -0.5345905, 1, 1, 1, 1, 1,
1.050955, -1.550296, 3.218773, 1, 1, 1, 1, 1,
1.057119, -0.09505054, 2.703465, 1, 1, 1, 1, 1,
1.078771, 1.176204, 2.506274, 1, 1, 1, 1, 1,
1.081538, -0.3401253, 1.150297, 0, 0, 1, 1, 1,
1.083164, 0.1463044, 2.33362, 1, 0, 0, 1, 1,
1.091412, -0.1282419, 1.548182, 1, 0, 0, 1, 1,
1.093371, 0.2212776, 0.8924044, 1, 0, 0, 1, 1,
1.095855, -0.4250181, 1.729387, 1, 0, 0, 1, 1,
1.104227, 2.259372, 0.09838476, 1, 0, 0, 1, 1,
1.108044, 0.4944066, 1.912219, 0, 0, 0, 1, 1,
1.113884, 1.550943, -0.6904169, 0, 0, 0, 1, 1,
1.115683, 0.9331073, 0.4620873, 0, 0, 0, 1, 1,
1.119885, -0.9261405, 1.383148, 0, 0, 0, 1, 1,
1.127912, -1.367996, 3.823926, 0, 0, 0, 1, 1,
1.131827, -0.2485628, -0.7322859, 0, 0, 0, 1, 1,
1.13502, 0.8817168, 2.977068, 0, 0, 0, 1, 1,
1.144573, -0.5267057, 2.633129, 1, 1, 1, 1, 1,
1.147659, -0.01875478, 1.020978, 1, 1, 1, 1, 1,
1.151181, 0.4638449, 1.640826, 1, 1, 1, 1, 1,
1.161671, 0.2017383, 0.2497563, 1, 1, 1, 1, 1,
1.170461, 0.04760648, 2.195235, 1, 1, 1, 1, 1,
1.177728, -0.1362192, 1.52693, 1, 1, 1, 1, 1,
1.190168, 1.12719, 0.8442664, 1, 1, 1, 1, 1,
1.200121, -0.04996233, 2.835443, 1, 1, 1, 1, 1,
1.200987, -1.772202, 2.492132, 1, 1, 1, 1, 1,
1.206373, 0.7608191, 0.9499227, 1, 1, 1, 1, 1,
1.212253, 0.3617417, 1.331202, 1, 1, 1, 1, 1,
1.221038, 0.7183191, 0.9708958, 1, 1, 1, 1, 1,
1.222313, -1.62046, 4.142853, 1, 1, 1, 1, 1,
1.227047, -1.816704, -0.08909221, 1, 1, 1, 1, 1,
1.233431, 0.8267046, 0.7788196, 1, 1, 1, 1, 1,
1.234529, -0.6124718, 0.4909071, 0, 0, 1, 1, 1,
1.235166, 1.04378, 1.103407, 1, 0, 0, 1, 1,
1.236061, -0.9630059, 0.854177, 1, 0, 0, 1, 1,
1.23798, -0.3015867, 2.701653, 1, 0, 0, 1, 1,
1.238584, 0.6843964, 0.3787528, 1, 0, 0, 1, 1,
1.260518, 0.7717152, 0.736333, 1, 0, 0, 1, 1,
1.262553, 0.1774229, 0.02851517, 0, 0, 0, 1, 1,
1.263557, -2.633528, 2.81257, 0, 0, 0, 1, 1,
1.272967, -0.09294518, 1.632965, 0, 0, 0, 1, 1,
1.274705, 0.3105401, -0.1176803, 0, 0, 0, 1, 1,
1.288851, 1.101562, 0.2677614, 0, 0, 0, 1, 1,
1.29523, -1.208866, 1.804474, 0, 0, 0, 1, 1,
1.307779, 1.448416, 0.4180349, 0, 0, 0, 1, 1,
1.311525, -2.428944, 2.071454, 1, 1, 1, 1, 1,
1.32368, -1.19276, 3.159283, 1, 1, 1, 1, 1,
1.326672, 0.7906724, 0.1664626, 1, 1, 1, 1, 1,
1.328492, -0.7832581, 3.022141, 1, 1, 1, 1, 1,
1.33744, 1.912004, -1.158867, 1, 1, 1, 1, 1,
1.345703, -0.06375631, 3.046545, 1, 1, 1, 1, 1,
1.348218, -1.280418, 2.693126, 1, 1, 1, 1, 1,
1.348263, 1.053043, -0.4042908, 1, 1, 1, 1, 1,
1.357418, 0.2008857, 1.136384, 1, 1, 1, 1, 1,
1.358778, 1.029329, 1.80256, 1, 1, 1, 1, 1,
1.376859, 0.5256379, -0.8265249, 1, 1, 1, 1, 1,
1.380393, -1.381806, 3.389296, 1, 1, 1, 1, 1,
1.38966, 0.3295341, 1.218844, 1, 1, 1, 1, 1,
1.397819, 0.3444776, 0.9093575, 1, 1, 1, 1, 1,
1.404719, 0.4124739, 1.243263, 1, 1, 1, 1, 1,
1.410761, -0.3564676, 0.0270945, 0, 0, 1, 1, 1,
1.411633, 1.546869, 0.7673647, 1, 0, 0, 1, 1,
1.41673, 0.4312783, 2.681024, 1, 0, 0, 1, 1,
1.419448, -0.9360513, 1.313472, 1, 0, 0, 1, 1,
1.424902, -0.1021931, 0.9933462, 1, 0, 0, 1, 1,
1.441846, 0.1390541, 0.5393512, 1, 0, 0, 1, 1,
1.443313, 1.72784, 1.457044, 0, 0, 0, 1, 1,
1.444126, -0.4226204, 1.637914, 0, 0, 0, 1, 1,
1.455792, 2.579579, 1.205451, 0, 0, 0, 1, 1,
1.464103, 1.423428, 0.6510124, 0, 0, 0, 1, 1,
1.467461, -0.420175, 2.485845, 0, 0, 0, 1, 1,
1.468806, -0.316973, 3.108032, 0, 0, 0, 1, 1,
1.472075, 1.200223, -0.7333741, 0, 0, 0, 1, 1,
1.485264, -0.2444256, 2.944257, 1, 1, 1, 1, 1,
1.494651, 1.242806, 1.675435, 1, 1, 1, 1, 1,
1.504338, 0.0394207, 0.2357217, 1, 1, 1, 1, 1,
1.511037, -0.6880192, 2.289433, 1, 1, 1, 1, 1,
1.512682, 0.2749327, 1.000918, 1, 1, 1, 1, 1,
1.533383, 1.290882, 1.785635, 1, 1, 1, 1, 1,
1.537213, -0.9994909, 1.249346, 1, 1, 1, 1, 1,
1.5435, -0.8585423, -0.1387815, 1, 1, 1, 1, 1,
1.548585, -0.4643102, 2.497065, 1, 1, 1, 1, 1,
1.556018, 0.9283699, 0.5373296, 1, 1, 1, 1, 1,
1.561812, 2.374562, 0.6474712, 1, 1, 1, 1, 1,
1.564205, -0.3003434, 2.407682, 1, 1, 1, 1, 1,
1.56486, 0.7402761, 1.510054, 1, 1, 1, 1, 1,
1.571526, 0.663512, 1.364785, 1, 1, 1, 1, 1,
1.58011, -0.554125, 1.318003, 1, 1, 1, 1, 1,
1.594952, 0.5199977, -0.1035263, 0, 0, 1, 1, 1,
1.595328, 1.455035, 0.4614203, 1, 0, 0, 1, 1,
1.598553, -1.63041, 2.158522, 1, 0, 0, 1, 1,
1.604375, -0.3365119, 1.448221, 1, 0, 0, 1, 1,
1.608706, 0.9935654, 0.5189655, 1, 0, 0, 1, 1,
1.666099, 0.5296444, 1.163182, 1, 0, 0, 1, 1,
1.674274, 1.581203, 0.3791266, 0, 0, 0, 1, 1,
1.709752, -0.3749313, 1.911001, 0, 0, 0, 1, 1,
1.720215, 0.7427282, -0.3835405, 0, 0, 0, 1, 1,
1.723006, 1.889177, 1.526852, 0, 0, 0, 1, 1,
1.738669, -1.176172, 1.158316, 0, 0, 0, 1, 1,
1.751719, -0.03831938, 1.51919, 0, 0, 0, 1, 1,
1.760168, -0.396712, 2.732031, 0, 0, 0, 1, 1,
1.767472, -0.9309639, 3.239845, 1, 1, 1, 1, 1,
1.772857, -2.373, 2.202164, 1, 1, 1, 1, 1,
1.799945, 0.5149137, 2.043412, 1, 1, 1, 1, 1,
1.803643, 0.6476936, 2.00306, 1, 1, 1, 1, 1,
1.807273, -0.1673569, 1.993918, 1, 1, 1, 1, 1,
1.808385, 0.5654519, 0.9844536, 1, 1, 1, 1, 1,
1.824257, -1.010699, 0.9994771, 1, 1, 1, 1, 1,
1.907499, -0.1971102, 2.647824, 1, 1, 1, 1, 1,
1.919305, 1.281644, 0.9326897, 1, 1, 1, 1, 1,
1.934738, 0.1523543, 2.240944, 1, 1, 1, 1, 1,
1.974741, -0.5868632, 2.140782, 1, 1, 1, 1, 1,
1.981965, 0.5324675, -0.1830887, 1, 1, 1, 1, 1,
1.987794, -1.481396, 1.760531, 1, 1, 1, 1, 1,
2.016436, -1.30687, 4.021519, 1, 1, 1, 1, 1,
2.04122, 2.237482, 0.707268, 1, 1, 1, 1, 1,
2.049998, 0.6911952, 1.465263, 0, 0, 1, 1, 1,
2.057751, 0.2375922, 1.41792, 1, 0, 0, 1, 1,
2.071284, 0.03813338, 0.7033543, 1, 0, 0, 1, 1,
2.096234, 0.4873691, 1.618951, 1, 0, 0, 1, 1,
2.09636, -0.2128845, 1.453332, 1, 0, 0, 1, 1,
2.113147, 0.7821259, 2.853226, 1, 0, 0, 1, 1,
2.129745, -1.542584, 3.404425, 0, 0, 0, 1, 1,
2.139501, -0.6591758, 3.741744, 0, 0, 0, 1, 1,
2.155835, 1.843199, 1.532692, 0, 0, 0, 1, 1,
2.171002, 0.4679306, 0.1162421, 0, 0, 0, 1, 1,
2.24769, 0.497337, 1.66628, 0, 0, 0, 1, 1,
2.290389, 0.5154268, 1.414029, 0, 0, 0, 1, 1,
2.327231, 0.02562549, 3.962673, 0, 0, 0, 1, 1,
2.34075, 0.1443327, 3.062325, 1, 1, 1, 1, 1,
2.567451, -1.21566, 2.944566, 1, 1, 1, 1, 1,
2.647128, 1.376294, 1.686664, 1, 1, 1, 1, 1,
2.654217, -0.544891, 2.710119, 1, 1, 1, 1, 1,
2.657082, 1.551322, 0.8575296, 1, 1, 1, 1, 1,
2.795549, -0.4166507, 0.4178372, 1, 1, 1, 1, 1,
3.286772, 1.133371, -0.5477874, 1, 1, 1, 1, 1
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
var radius = 9.797015;
var distance = 34.4116;
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
mvMatrix.translate( 0.1113784, -0.3492506, -0.335526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.4116);
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
