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
-3.255824, 0.3127295, -0.8391036, 1, 0, 0, 1,
-3.117151, -1.299846, -1.500287, 1, 0.007843138, 0, 1,
-2.982942, 1.334641, -1.766539, 1, 0.01176471, 0, 1,
-2.959878, 0.2905742, 0.2190058, 1, 0.01960784, 0, 1,
-2.744477, -0.2589684, -2.193324, 1, 0.02352941, 0, 1,
-2.671688, -0.95078, -2.050096, 1, 0.03137255, 0, 1,
-2.592266, 0.5468094, -0.3155156, 1, 0.03529412, 0, 1,
-2.565473, 1.087293, -3.356303, 1, 0.04313726, 0, 1,
-2.514673, -0.1237102, -0.9471835, 1, 0.04705882, 0, 1,
-2.412424, -0.6660116, -0.4794703, 1, 0.05490196, 0, 1,
-2.411097, -0.3113709, -2.255815, 1, 0.05882353, 0, 1,
-2.325883, 0.0128617, -2.252043, 1, 0.06666667, 0, 1,
-2.287958, -1.066785, -1.72992, 1, 0.07058824, 0, 1,
-2.261102, -0.8901502, -0.700708, 1, 0.07843138, 0, 1,
-2.187126, -1.553326, -0.7978412, 1, 0.08235294, 0, 1,
-2.144966, 0.2966593, -0.3510703, 1, 0.09019608, 0, 1,
-2.142348, -1.248627, -1.047407, 1, 0.09411765, 0, 1,
-2.134558, 0.04278481, -2.315214, 1, 0.1019608, 0, 1,
-2.108388, 1.913084, -1.110108, 1, 0.1098039, 0, 1,
-2.107396, -0.4065129, -2.244245, 1, 0.1137255, 0, 1,
-2.045039, -0.714979, -1.97288, 1, 0.1215686, 0, 1,
-2.033562, -0.4879142, -1.723173, 1, 0.1254902, 0, 1,
-2.010025, -1.238129, -2.903996, 1, 0.1333333, 0, 1,
-2.007047, -1.330696, -0.0468352, 1, 0.1372549, 0, 1,
-1.984107, 0.4498098, -1.887512, 1, 0.145098, 0, 1,
-1.964058, -0.4503706, -2.06316, 1, 0.1490196, 0, 1,
-1.953628, -0.4630297, -1.971136, 1, 0.1568628, 0, 1,
-1.942317, 0.3093292, -1.954785, 1, 0.1607843, 0, 1,
-1.938953, 0.7152157, -1.451691, 1, 0.1686275, 0, 1,
-1.936653, -1.856371, -1.612281, 1, 0.172549, 0, 1,
-1.926433, 0.2055371, -0.6763432, 1, 0.1803922, 0, 1,
-1.891085, 0.5430321, -1.250722, 1, 0.1843137, 0, 1,
-1.884737, 1.048084, -0.1515223, 1, 0.1921569, 0, 1,
-1.875798, 0.2424945, -1.428556, 1, 0.1960784, 0, 1,
-1.859618, 0.9486979, -0.7544227, 1, 0.2039216, 0, 1,
-1.859502, -0.1848323, -2.429604, 1, 0.2117647, 0, 1,
-1.846488, -0.7493623, -2.575787, 1, 0.2156863, 0, 1,
-1.84557, -0.3433183, 0.09478834, 1, 0.2235294, 0, 1,
-1.838772, -0.1910918, -2.29925, 1, 0.227451, 0, 1,
-1.83097, 0.8070456, -2.054466, 1, 0.2352941, 0, 1,
-1.811152, 0.2879006, -1.123099, 1, 0.2392157, 0, 1,
-1.805528, 0.4147229, 0.8094007, 1, 0.2470588, 0, 1,
-1.800435, -0.4893098, -2.476007, 1, 0.2509804, 0, 1,
-1.798987, 1.189031, -1.868673, 1, 0.2588235, 0, 1,
-1.789006, -2.301993, -1.046893, 1, 0.2627451, 0, 1,
-1.772982, 0.8334074, -2.89181, 1, 0.2705882, 0, 1,
-1.766558, -0.415048, -1.441519, 1, 0.2745098, 0, 1,
-1.752873, -0.389092, -2.463366, 1, 0.282353, 0, 1,
-1.752114, -0.7432427, -3.538125, 1, 0.2862745, 0, 1,
-1.735173, 0.1466423, -2.187414, 1, 0.2941177, 0, 1,
-1.724304, -1.895462, -3.325258, 1, 0.3019608, 0, 1,
-1.717924, 0.8282608, -0.5001314, 1, 0.3058824, 0, 1,
-1.717512, 1.547313, -0.2271203, 1, 0.3137255, 0, 1,
-1.713414, -0.4406415, 0.5253248, 1, 0.3176471, 0, 1,
-1.708879, -0.2857462, -2.240536, 1, 0.3254902, 0, 1,
-1.691893, -0.8458704, -0.733806, 1, 0.3294118, 0, 1,
-1.677758, -1.187917, -2.755579, 1, 0.3372549, 0, 1,
-1.674948, 0.4627925, -2.332739, 1, 0.3411765, 0, 1,
-1.671659, -1.890941, -3.493661, 1, 0.3490196, 0, 1,
-1.670565, 0.4089619, -1.252088, 1, 0.3529412, 0, 1,
-1.657973, 0.6030056, -0.6673056, 1, 0.3607843, 0, 1,
-1.65023, 2.802983, -0.5999444, 1, 0.3647059, 0, 1,
-1.631888, -0.1848181, -2.565198, 1, 0.372549, 0, 1,
-1.629568, -0.3461626, -1.875502, 1, 0.3764706, 0, 1,
-1.621068, -0.8775331, -1.644402, 1, 0.3843137, 0, 1,
-1.566783, 1.1654, -1.542875, 1, 0.3882353, 0, 1,
-1.565544, 0.7960012, -2.388529, 1, 0.3960784, 0, 1,
-1.563793, -0.7548192, -4.104515, 1, 0.4039216, 0, 1,
-1.557281, -0.2249808, -2.370385, 1, 0.4078431, 0, 1,
-1.533165, -1.330788, -0.1965966, 1, 0.4156863, 0, 1,
-1.521435, 1.313306, -1.125709, 1, 0.4196078, 0, 1,
-1.511184, 0.005227768, -2.022786, 1, 0.427451, 0, 1,
-1.504863, 0.8014226, -0.2551714, 1, 0.4313726, 0, 1,
-1.488124, -0.751283, -1.419461, 1, 0.4392157, 0, 1,
-1.479353, 1.574388, -0.4976898, 1, 0.4431373, 0, 1,
-1.472588, 0.4252592, -1.228996, 1, 0.4509804, 0, 1,
-1.46478, -0.813497, -2.479005, 1, 0.454902, 0, 1,
-1.462555, 0.2061717, -1.732045, 1, 0.4627451, 0, 1,
-1.453475, 0.2116734, -1.841777, 1, 0.4666667, 0, 1,
-1.449071, -0.1106654, -1.323683, 1, 0.4745098, 0, 1,
-1.44586, 0.2166408, -1.261461, 1, 0.4784314, 0, 1,
-1.441904, -0.7978715, -1.489969, 1, 0.4862745, 0, 1,
-1.43098, 1.349264, -1.887066, 1, 0.4901961, 0, 1,
-1.427074, -0.001806713, -1.787051, 1, 0.4980392, 0, 1,
-1.425926, -0.3818209, -2.744569, 1, 0.5058824, 0, 1,
-1.422716, -0.3274417, -0.6412726, 1, 0.509804, 0, 1,
-1.42054, -2.35765, -1.560867, 1, 0.5176471, 0, 1,
-1.412891, 0.8924402, -1.956735, 1, 0.5215687, 0, 1,
-1.410129, 1.356206, 0.02799757, 1, 0.5294118, 0, 1,
-1.39878, 1.646958, -0.6768301, 1, 0.5333334, 0, 1,
-1.395015, -0.7918718, -3.645383, 1, 0.5411765, 0, 1,
-1.386823, -1.005995, -2.321477, 1, 0.5450981, 0, 1,
-1.374182, 1.390254, -1.087307, 1, 0.5529412, 0, 1,
-1.369809, -2.696274, -3.034248, 1, 0.5568628, 0, 1,
-1.357501, 1.525532, -1.823679, 1, 0.5647059, 0, 1,
-1.351939, 0.1787814, -3.164494, 1, 0.5686275, 0, 1,
-1.34608, 0.2858019, -0.2732723, 1, 0.5764706, 0, 1,
-1.342328, 0.414958, -1.249825, 1, 0.5803922, 0, 1,
-1.341434, -0.06859909, -2.053109, 1, 0.5882353, 0, 1,
-1.339308, 0.2108304, -1.1773, 1, 0.5921569, 0, 1,
-1.336831, 0.04367622, -2.9642, 1, 0.6, 0, 1,
-1.334691, -0.8916672, -3.401208, 1, 0.6078432, 0, 1,
-1.324455, 1.639489, -1.767262, 1, 0.6117647, 0, 1,
-1.323316, 1.832523, -0.5468127, 1, 0.6196079, 0, 1,
-1.319266, -0.9403482, -1.44932, 1, 0.6235294, 0, 1,
-1.304392, -0.7365201, -0.8620271, 1, 0.6313726, 0, 1,
-1.286916, -0.8270091, -3.714412, 1, 0.6352941, 0, 1,
-1.282014, -0.0537371, -1.900208, 1, 0.6431373, 0, 1,
-1.279444, 0.4080426, -0.5002794, 1, 0.6470588, 0, 1,
-1.27723, 2.599383, -0.5899892, 1, 0.654902, 0, 1,
-1.276772, 1.806519, 0.6394073, 1, 0.6588235, 0, 1,
-1.270361, 0.3892758, 0.06613138, 1, 0.6666667, 0, 1,
-1.267332, 0.8323315, -1.778952, 1, 0.6705883, 0, 1,
-1.265338, -0.6524024, -1.718726, 1, 0.6784314, 0, 1,
-1.263684, 0.5941751, -2.129525, 1, 0.682353, 0, 1,
-1.253938, 0.796581, -1.404914, 1, 0.6901961, 0, 1,
-1.249684, -1.04057, -2.186903, 1, 0.6941177, 0, 1,
-1.240077, -2.094526, -2.61757, 1, 0.7019608, 0, 1,
-1.232735, -0.09604742, -1.141514, 1, 0.7098039, 0, 1,
-1.215455, 0.9746934, -1.079377, 1, 0.7137255, 0, 1,
-1.21511, -0.9072384, -1.430725, 1, 0.7215686, 0, 1,
-1.210359, 0.09497668, -2.022637, 1, 0.7254902, 0, 1,
-1.20912, -0.03858756, -2.35815, 1, 0.7333333, 0, 1,
-1.188154, -2.33666, -3.605536, 1, 0.7372549, 0, 1,
-1.186528, 1.906444, -0.2093945, 1, 0.7450981, 0, 1,
-1.18052, -0.8401454, -1.389017, 1, 0.7490196, 0, 1,
-1.180478, -1.388565, -0.7772248, 1, 0.7568628, 0, 1,
-1.172295, -0.5452853, -3.70689, 1, 0.7607843, 0, 1,
-1.163953, 0.7862071, -2.460419, 1, 0.7686275, 0, 1,
-1.139778, -1.25316, -1.627979, 1, 0.772549, 0, 1,
-1.135877, -0.4350144, -1.877285, 1, 0.7803922, 0, 1,
-1.131931, 0.009260345, -3.163204, 1, 0.7843137, 0, 1,
-1.130949, 0.4274155, -3.85095, 1, 0.7921569, 0, 1,
-1.116789, 1.136371, -2.322995, 1, 0.7960784, 0, 1,
-1.116093, -0.2067941, -2.148566, 1, 0.8039216, 0, 1,
-1.113893, 1.492636, 0.2698003, 1, 0.8117647, 0, 1,
-1.106642, -0.08967565, -2.023218, 1, 0.8156863, 0, 1,
-1.09951, -0.6802559, -3.133535, 1, 0.8235294, 0, 1,
-1.095647, 0.5788879, -1.181785, 1, 0.827451, 0, 1,
-1.095488, 0.1468202, -3.312323, 1, 0.8352941, 0, 1,
-1.092048, -0.5756787, -2.526993, 1, 0.8392157, 0, 1,
-1.09024, 1.758812, 0.2790899, 1, 0.8470588, 0, 1,
-1.07374, -2.119982, -1.916819, 1, 0.8509804, 0, 1,
-1.072703, 1.344691, -0.7814352, 1, 0.8588235, 0, 1,
-1.072684, 1.44404, -0.46389, 1, 0.8627451, 0, 1,
-1.071678, 0.7268565, -1.780063, 1, 0.8705882, 0, 1,
-1.064652, -0.5978392, -0.4539614, 1, 0.8745098, 0, 1,
-1.057617, -0.2781166, -1.636852, 1, 0.8823529, 0, 1,
-1.040431, -0.5120089, -2.32092, 1, 0.8862745, 0, 1,
-1.040274, 1.501668, 1.308462, 1, 0.8941177, 0, 1,
-1.039808, 0.5896277, -1.409781, 1, 0.8980392, 0, 1,
-1.039369, 0.3579271, -1.267248, 1, 0.9058824, 0, 1,
-1.03591, -0.2640462, -2.412193, 1, 0.9137255, 0, 1,
-1.031076, -0.1008882, -1.234123, 1, 0.9176471, 0, 1,
-1.027215, 0.1679756, -0.1232206, 1, 0.9254902, 0, 1,
-1.025459, -0.9774292, -3.456973, 1, 0.9294118, 0, 1,
-1.019821, 0.6952635, -1.047164, 1, 0.9372549, 0, 1,
-1.009671, 1.79841, -0.2827042, 1, 0.9411765, 0, 1,
-0.9941594, 0.4301961, -1.396884, 1, 0.9490196, 0, 1,
-0.9938115, 2.306327, 0.9107872, 1, 0.9529412, 0, 1,
-0.9905776, -0.3902306, -0.8451059, 1, 0.9607843, 0, 1,
-0.9903449, 1.4854, -1.403527, 1, 0.9647059, 0, 1,
-0.9880682, -0.3810866, -4.521891, 1, 0.972549, 0, 1,
-0.9846746, 0.8697647, 0.2255019, 1, 0.9764706, 0, 1,
-0.9832771, -1.002314, -3.920933, 1, 0.9843137, 0, 1,
-0.9801966, -0.3518851, -2.113489, 1, 0.9882353, 0, 1,
-0.977089, 1.312157, 0.6331902, 1, 0.9960784, 0, 1,
-0.9704832, -0.008489144, -1.451097, 0.9960784, 1, 0, 1,
-0.9659048, -0.06036094, -2.840591, 0.9921569, 1, 0, 1,
-0.9648036, -2.024641, -2.532105, 0.9843137, 1, 0, 1,
-0.9646266, 1.247719, -1.874755, 0.9803922, 1, 0, 1,
-0.9636873, 1.518741, -2.189949, 0.972549, 1, 0, 1,
-0.9499321, -2.178442, -4.131455, 0.9686275, 1, 0, 1,
-0.9454079, -2.049717, -1.431706, 0.9607843, 1, 0, 1,
-0.9416552, 1.586893, 1.803131, 0.9568627, 1, 0, 1,
-0.9382687, 0.1453625, -1.278994, 0.9490196, 1, 0, 1,
-0.925245, 0.9973328, -1.014626, 0.945098, 1, 0, 1,
-0.9244562, 0.9337105, 0.9995849, 0.9372549, 1, 0, 1,
-0.9169302, -1.706192, -1.976863, 0.9333333, 1, 0, 1,
-0.9127346, -0.5892324, -1.502256, 0.9254902, 1, 0, 1,
-0.9082537, 0.2116679, -0.7275096, 0.9215686, 1, 0, 1,
-0.907983, -1.42532, -3.957073, 0.9137255, 1, 0, 1,
-0.9018102, -0.7031455, -0.8929413, 0.9098039, 1, 0, 1,
-0.8994558, 0.3046243, -2.151717, 0.9019608, 1, 0, 1,
-0.8988246, -0.9301213, -3.37228, 0.8941177, 1, 0, 1,
-0.8942229, -1.589038, -0.9348654, 0.8901961, 1, 0, 1,
-0.8925127, -0.8658782, -2.674423, 0.8823529, 1, 0, 1,
-0.8910437, -0.5970517, -2.208444, 0.8784314, 1, 0, 1,
-0.8856377, 0.8768982, -1.704072, 0.8705882, 1, 0, 1,
-0.8845736, -0.3853717, -1.279844, 0.8666667, 1, 0, 1,
-0.874107, 0.03365701, -1.047913, 0.8588235, 1, 0, 1,
-0.8709457, 0.1556052, -3.910162, 0.854902, 1, 0, 1,
-0.8656213, -2.106595, -3.815166, 0.8470588, 1, 0, 1,
-0.8649849, 0.7595676, -0.2119247, 0.8431373, 1, 0, 1,
-0.8621855, -0.3250141, -1.059511, 0.8352941, 1, 0, 1,
-0.8608326, 1.637511, -0.9590517, 0.8313726, 1, 0, 1,
-0.8588672, 1.17215, -0.3750459, 0.8235294, 1, 0, 1,
-0.8525437, -1.198861, -2.072347, 0.8196079, 1, 0, 1,
-0.8490863, -1.113342, -0.3842934, 0.8117647, 1, 0, 1,
-0.8438109, -1.192636, -1.130197, 0.8078431, 1, 0, 1,
-0.8433969, -0.75069, -1.514956, 0.8, 1, 0, 1,
-0.8344627, 0.8693251, -1.765755, 0.7921569, 1, 0, 1,
-0.8341137, -0.2179354, -1.464626, 0.7882353, 1, 0, 1,
-0.8268921, -0.4400859, -4.339427, 0.7803922, 1, 0, 1,
-0.8247309, 0.1163796, -2.196903, 0.7764706, 1, 0, 1,
-0.821407, -0.08996425, -0.3246987, 0.7686275, 1, 0, 1,
-0.8182393, -1.947843, -4.472931, 0.7647059, 1, 0, 1,
-0.8165058, -0.1859288, -0.923975, 0.7568628, 1, 0, 1,
-0.8159438, 1.432036, -1.9297, 0.7529412, 1, 0, 1,
-0.8104921, -2.344063, -2.953627, 0.7450981, 1, 0, 1,
-0.8014616, 0.1364121, 0.05732561, 0.7411765, 1, 0, 1,
-0.7995076, -0.1372433, -1.935524, 0.7333333, 1, 0, 1,
-0.7982371, -2.022232, -3.683403, 0.7294118, 1, 0, 1,
-0.7864176, -0.382982, -2.245998, 0.7215686, 1, 0, 1,
-0.7855504, -0.4620866, -0.9840457, 0.7176471, 1, 0, 1,
-0.7837985, 1.236308, -0.8026751, 0.7098039, 1, 0, 1,
-0.779173, -2.149169, -3.559696, 0.7058824, 1, 0, 1,
-0.7776877, -0.648258, -3.235747, 0.6980392, 1, 0, 1,
-0.7760653, -0.6745074, -3.472423, 0.6901961, 1, 0, 1,
-0.7730561, -0.5894652, -1.52434, 0.6862745, 1, 0, 1,
-0.7689835, 0.4323182, -2.742169, 0.6784314, 1, 0, 1,
-0.7674367, -0.3437122, -0.357094, 0.6745098, 1, 0, 1,
-0.7660365, 1.120925, -1.092435, 0.6666667, 1, 0, 1,
-0.7626966, 1.551665, 0.6489994, 0.6627451, 1, 0, 1,
-0.7560551, 0.3951315, 0.387145, 0.654902, 1, 0, 1,
-0.7546365, 1.669647, -1.277653, 0.6509804, 1, 0, 1,
-0.7496163, -0.7853575, -3.127904, 0.6431373, 1, 0, 1,
-0.7397164, 0.896566, 0.1774034, 0.6392157, 1, 0, 1,
-0.7352651, -2.073332, -3.009979, 0.6313726, 1, 0, 1,
-0.7351931, 0.1723543, -1.33514, 0.627451, 1, 0, 1,
-0.7312289, 0.2602577, -1.633163, 0.6196079, 1, 0, 1,
-0.7298213, 1.183302, -2.23604, 0.6156863, 1, 0, 1,
-0.7270209, -0.4242217, 0.261862, 0.6078432, 1, 0, 1,
-0.7263701, 0.8297729, -0.7209822, 0.6039216, 1, 0, 1,
-0.7263581, -2.161633, -3.241481, 0.5960785, 1, 0, 1,
-0.7236793, -1.32961, -2.691411, 0.5882353, 1, 0, 1,
-0.7191526, -1.515214, -4.528629, 0.5843138, 1, 0, 1,
-0.7179716, 0.9106615, -1.124679, 0.5764706, 1, 0, 1,
-0.7085004, 2.656529, -0.8972356, 0.572549, 1, 0, 1,
-0.706909, -1.416999, -2.598676, 0.5647059, 1, 0, 1,
-0.7022051, 1.964328, -0.823501, 0.5607843, 1, 0, 1,
-0.7013944, 0.2133782, -2.463153, 0.5529412, 1, 0, 1,
-0.7007855, -0.2933304, -1.89571, 0.5490196, 1, 0, 1,
-0.6980768, 0.8070914, -1.594919, 0.5411765, 1, 0, 1,
-0.6966681, 0.02030933, -1.164327, 0.5372549, 1, 0, 1,
-0.6948277, 1.091918, -1.267841, 0.5294118, 1, 0, 1,
-0.688262, 0.7709221, 0.9668905, 0.5254902, 1, 0, 1,
-0.6877562, 0.108705, -0.5665914, 0.5176471, 1, 0, 1,
-0.6870753, -2.232533, -2.649219, 0.5137255, 1, 0, 1,
-0.6863621, 0.2402821, 0.205229, 0.5058824, 1, 0, 1,
-0.6823855, -1.171962, -3.615742, 0.5019608, 1, 0, 1,
-0.6794957, -1.020563, -0.4880751, 0.4941176, 1, 0, 1,
-0.6757127, 0.3774177, -1.090522, 0.4862745, 1, 0, 1,
-0.6732112, -1.05274, -2.521361, 0.4823529, 1, 0, 1,
-0.6720467, -0.7005475, -1.697806, 0.4745098, 1, 0, 1,
-0.6702392, 0.1206938, -2.066004, 0.4705882, 1, 0, 1,
-0.6673957, 0.7550653, -1.902939, 0.4627451, 1, 0, 1,
-0.6660024, -0.04224843, -1.321493, 0.4588235, 1, 0, 1,
-0.6627343, -0.0610751, -2.252688, 0.4509804, 1, 0, 1,
-0.6581657, 0.6077718, -1.368524, 0.4470588, 1, 0, 1,
-0.6563262, -2.351618, -2.979034, 0.4392157, 1, 0, 1,
-0.6561775, -0.6971745, -3.163409, 0.4352941, 1, 0, 1,
-0.6515105, 0.192256, -0.6978821, 0.427451, 1, 0, 1,
-0.6503618, -1.059714, -4.670149, 0.4235294, 1, 0, 1,
-0.6464589, 0.1467826, -2.88421, 0.4156863, 1, 0, 1,
-0.6450483, -2.214892, -1.985756, 0.4117647, 1, 0, 1,
-0.6426541, -0.3121355, -2.829604, 0.4039216, 1, 0, 1,
-0.639465, -1.186986, -1.792922, 0.3960784, 1, 0, 1,
-0.6368119, -0.4247024, -2.166847, 0.3921569, 1, 0, 1,
-0.6362662, -0.5601276, -2.321251, 0.3843137, 1, 0, 1,
-0.6324746, 1.217588, -0.7501652, 0.3803922, 1, 0, 1,
-0.6315526, -0.102457, 1.280607, 0.372549, 1, 0, 1,
-0.6297668, -0.06145595, -2.681865, 0.3686275, 1, 0, 1,
-0.6273566, 1.254176, 0.4759788, 0.3607843, 1, 0, 1,
-0.6243992, 1.396727, -0.3152294, 0.3568628, 1, 0, 1,
-0.6216096, -1.09695, -0.8843907, 0.3490196, 1, 0, 1,
-0.6200019, 0.5935288, -0.1749849, 0.345098, 1, 0, 1,
-0.6188501, -0.5027128, -1.287885, 0.3372549, 1, 0, 1,
-0.6149153, 0.4523861, -1.505797, 0.3333333, 1, 0, 1,
-0.6119689, 0.8152245, -1.661797, 0.3254902, 1, 0, 1,
-0.6096648, 0.9630877, -1.015909, 0.3215686, 1, 0, 1,
-0.6070577, -0.1024426, -3.150664, 0.3137255, 1, 0, 1,
-0.6049632, -0.4154338, -2.21823, 0.3098039, 1, 0, 1,
-0.604454, -0.2291815, 0.10712, 0.3019608, 1, 0, 1,
-0.5993978, -0.6911241, -3.127869, 0.2941177, 1, 0, 1,
-0.5966045, 0.6076495, -1.062042, 0.2901961, 1, 0, 1,
-0.593942, -0.0665076, -0.1845063, 0.282353, 1, 0, 1,
-0.5934746, 0.8519691, -2.727221, 0.2784314, 1, 0, 1,
-0.5878907, 0.5206633, 0.6749924, 0.2705882, 1, 0, 1,
-0.5841932, -0.1688467, 0.01181009, 0.2666667, 1, 0, 1,
-0.5824202, 0.02889639, -2.160619, 0.2588235, 1, 0, 1,
-0.5810584, 0.4059102, -1.398396, 0.254902, 1, 0, 1,
-0.5753808, -0.2784042, -2.141154, 0.2470588, 1, 0, 1,
-0.5745815, 2.164085, 1.754902, 0.2431373, 1, 0, 1,
-0.5736554, -1.573096, -2.950673, 0.2352941, 1, 0, 1,
-0.5723693, 1.276927, 0.8093504, 0.2313726, 1, 0, 1,
-0.5495079, 0.9226979, -0.8133789, 0.2235294, 1, 0, 1,
-0.549333, 0.3953212, -1.465324, 0.2196078, 1, 0, 1,
-0.5397573, -0.8980366, -1.516036, 0.2117647, 1, 0, 1,
-0.5369281, -1.393756, -4.181417, 0.2078431, 1, 0, 1,
-0.530264, 0.5582376, 0.08394196, 0.2, 1, 0, 1,
-0.5296077, -0.9342827, -0.6576521, 0.1921569, 1, 0, 1,
-0.525418, -0.9030576, -3.004071, 0.1882353, 1, 0, 1,
-0.5198144, -1.479556, -1.841158, 0.1803922, 1, 0, 1,
-0.5167373, -0.3208209, -2.758107, 0.1764706, 1, 0, 1,
-0.5164688, 1.31897, -1.261993, 0.1686275, 1, 0, 1,
-0.5107977, -1.870175, -2.772986, 0.1647059, 1, 0, 1,
-0.5072666, 0.1938259, -0.8466405, 0.1568628, 1, 0, 1,
-0.5065581, 1.084651, -0.02914215, 0.1529412, 1, 0, 1,
-0.5043431, -0.6627958, -2.206137, 0.145098, 1, 0, 1,
-0.5022863, 0.08838014, 0.4161492, 0.1411765, 1, 0, 1,
-0.500854, -1.074208, -3.696502, 0.1333333, 1, 0, 1,
-0.5001947, -0.4263283, -2.377919, 0.1294118, 1, 0, 1,
-0.4990697, -1.209059, -2.526597, 0.1215686, 1, 0, 1,
-0.4964797, 1.286151, 0.1145759, 0.1176471, 1, 0, 1,
-0.4949331, 0.1289156, -0.2527174, 0.1098039, 1, 0, 1,
-0.490167, -0.4740778, -3.912297, 0.1058824, 1, 0, 1,
-0.4897524, -0.8360853, -2.169067, 0.09803922, 1, 0, 1,
-0.4782397, -0.4478007, -4.121094, 0.09019608, 1, 0, 1,
-0.4737519, 1.026189, -0.5060237, 0.08627451, 1, 0, 1,
-0.4737135, -0.7920431, -2.696509, 0.07843138, 1, 0, 1,
-0.4724331, 0.9466593, -0.5212502, 0.07450981, 1, 0, 1,
-0.468521, 0.4872868, -0.5469918, 0.06666667, 1, 0, 1,
-0.4659439, -0.4083839, -1.484554, 0.0627451, 1, 0, 1,
-0.4656754, -1.02034, -2.503054, 0.05490196, 1, 0, 1,
-0.4628057, 1.849766, -0.508867, 0.05098039, 1, 0, 1,
-0.462004, 0.1403355, -2.660121, 0.04313726, 1, 0, 1,
-0.4558437, 1.138273, 0.2672782, 0.03921569, 1, 0, 1,
-0.4539451, -0.05913132, -1.373148, 0.03137255, 1, 0, 1,
-0.4475698, -0.5145884, -2.438742, 0.02745098, 1, 0, 1,
-0.4461354, -0.8943282, -3.527822, 0.01960784, 1, 0, 1,
-0.440793, -0.3592836, -2.449168, 0.01568628, 1, 0, 1,
-0.440526, -0.7355502, -3.664532, 0.007843138, 1, 0, 1,
-0.4360374, -1.122833, -1.4246, 0.003921569, 1, 0, 1,
-0.4306426, 1.422993, -0.8829026, 0, 1, 0.003921569, 1,
-0.42393, -0.4748327, -0.696499, 0, 1, 0.01176471, 1,
-0.4236713, -1.591831, -1.856591, 0, 1, 0.01568628, 1,
-0.4233845, 0.1399638, -1.486098, 0, 1, 0.02352941, 1,
-0.4216385, -0.5132409, -2.431062, 0, 1, 0.02745098, 1,
-0.419421, -0.5436639, -2.89089, 0, 1, 0.03529412, 1,
-0.4169516, -0.630998, -2.428332, 0, 1, 0.03921569, 1,
-0.4150572, 1.231499, -0.5701232, 0, 1, 0.04705882, 1,
-0.41041, 0.7963427, -1.388947, 0, 1, 0.05098039, 1,
-0.4096119, 1.441895, -1.040226, 0, 1, 0.05882353, 1,
-0.4077363, -1.218408, -1.726949, 0, 1, 0.0627451, 1,
-0.4067871, 0.5243838, -1.743012, 0, 1, 0.07058824, 1,
-0.4050874, 0.7787501, 1.114253, 0, 1, 0.07450981, 1,
-0.4021615, -0.2045102, -2.679094, 0, 1, 0.08235294, 1,
-0.4019433, 0.3675319, -1.764578, 0, 1, 0.08627451, 1,
-0.4018984, -0.3480442, -3.272158, 0, 1, 0.09411765, 1,
-0.399644, 1.585184, -0.6827975, 0, 1, 0.1019608, 1,
-0.3994608, 0.9089016, 0.2466876, 0, 1, 0.1058824, 1,
-0.3957502, -0.4583916, -2.344425, 0, 1, 0.1137255, 1,
-0.3917471, 0.117395, -0.5965019, 0, 1, 0.1176471, 1,
-0.3900083, -1.027152, -1.891086, 0, 1, 0.1254902, 1,
-0.388279, 1.534169, -0.8345389, 0, 1, 0.1294118, 1,
-0.3828533, 0.5158425, 0.3580782, 0, 1, 0.1372549, 1,
-0.3821363, 1.129641, -0.3297804, 0, 1, 0.1411765, 1,
-0.3790002, -0.2146571, -1.20843, 0, 1, 0.1490196, 1,
-0.377665, 1.581637, 0.1462441, 0, 1, 0.1529412, 1,
-0.3768758, 0.7351962, -0.1926796, 0, 1, 0.1607843, 1,
-0.3601615, 0.8893585, 0.265832, 0, 1, 0.1647059, 1,
-0.3525988, -0.4403699, -3.108004, 0, 1, 0.172549, 1,
-0.3523615, -0.5061782, -2.565876, 0, 1, 0.1764706, 1,
-0.3513996, 0.5531942, -0.8121173, 0, 1, 0.1843137, 1,
-0.3486182, -0.5564101, -1.682571, 0, 1, 0.1882353, 1,
-0.3484542, -0.2640777, -2.951977, 0, 1, 0.1960784, 1,
-0.3476144, -1.115033, -1.291935, 0, 1, 0.2039216, 1,
-0.342512, 0.070165, -1.678814, 0, 1, 0.2078431, 1,
-0.3374459, -0.9902319, -2.845652, 0, 1, 0.2156863, 1,
-0.3281557, -0.9049349, -1.520592, 0, 1, 0.2196078, 1,
-0.3277481, 0.1183303, 0.08251876, 0, 1, 0.227451, 1,
-0.3276107, 0.728498, -0.5834111, 0, 1, 0.2313726, 1,
-0.3247791, -0.0300444, -2.154148, 0, 1, 0.2392157, 1,
-0.3215652, 0.4396989, -0.4549482, 0, 1, 0.2431373, 1,
-0.3179117, -0.636481, -1.645576, 0, 1, 0.2509804, 1,
-0.315054, 0.07996109, -0.8600889, 0, 1, 0.254902, 1,
-0.314389, -0.4959038, -1.820192, 0, 1, 0.2627451, 1,
-0.3117616, -1.911163, -4.051238, 0, 1, 0.2666667, 1,
-0.3078633, -0.1178247, -2.180834, 0, 1, 0.2745098, 1,
-0.3063546, 0.1733636, -1.042137, 0, 1, 0.2784314, 1,
-0.3044461, -0.5283644, -2.952256, 0, 1, 0.2862745, 1,
-0.3019718, -1.311738, -1.871557, 0, 1, 0.2901961, 1,
-0.3010704, 0.7497445, 0.6028317, 0, 1, 0.2980392, 1,
-0.3003401, -1.067163, -3.361495, 0, 1, 0.3058824, 1,
-0.2956232, 1.295017, -2.033959, 0, 1, 0.3098039, 1,
-0.2923083, 1.73877, 0.1797057, 0, 1, 0.3176471, 1,
-0.2913356, -0.7194574, -3.96101, 0, 1, 0.3215686, 1,
-0.2901058, -0.4670241, -1.056359, 0, 1, 0.3294118, 1,
-0.2900567, -0.1304323, -3.204748, 0, 1, 0.3333333, 1,
-0.2879235, -0.7753957, -2.853328, 0, 1, 0.3411765, 1,
-0.2877044, -0.277301, -1.055363, 0, 1, 0.345098, 1,
-0.286127, 1.465256, 1.301394, 0, 1, 0.3529412, 1,
-0.2859159, 0.7432238, -1.53106, 0, 1, 0.3568628, 1,
-0.285634, -0.847055, -2.387944, 0, 1, 0.3647059, 1,
-0.2837774, -0.1665632, -3.246122, 0, 1, 0.3686275, 1,
-0.281561, -2.138469, -2.314285, 0, 1, 0.3764706, 1,
-0.2807548, 0.3242602, -1.623494, 0, 1, 0.3803922, 1,
-0.2761845, 0.3892485, -0.2342144, 0, 1, 0.3882353, 1,
-0.2680987, 0.6806954, 0.146184, 0, 1, 0.3921569, 1,
-0.2673877, -0.8186301, -2.837818, 0, 1, 0.4, 1,
-0.2666248, 1.234876, -0.8919645, 0, 1, 0.4078431, 1,
-0.2659519, 0.2235211, 0.7833844, 0, 1, 0.4117647, 1,
-0.2643421, -0.4933699, -1.707364, 0, 1, 0.4196078, 1,
-0.261004, 1.696433, 0.1188022, 0, 1, 0.4235294, 1,
-0.2606975, 0.4419128, -1.568416, 0, 1, 0.4313726, 1,
-0.2596724, 2.664445, 2.114511, 0, 1, 0.4352941, 1,
-0.2596708, 0.1433997, -1.0098, 0, 1, 0.4431373, 1,
-0.2552795, -1.280007, -1.542713, 0, 1, 0.4470588, 1,
-0.2535088, 1.18485, 0.03239384, 0, 1, 0.454902, 1,
-0.2415653, -0.6746407, -1.37299, 0, 1, 0.4588235, 1,
-0.2415318, -0.6340942, -2.039572, 0, 1, 0.4666667, 1,
-0.2414839, 0.403379, -0.4102654, 0, 1, 0.4705882, 1,
-0.2384181, 0.3169055, -1.987284, 0, 1, 0.4784314, 1,
-0.2290336, -0.4098832, -3.622977, 0, 1, 0.4823529, 1,
-0.2238296, 1.924792, -0.7429572, 0, 1, 0.4901961, 1,
-0.2229655, 0.4764022, 0.3571911, 0, 1, 0.4941176, 1,
-0.2189366, -0.327915, -3.006336, 0, 1, 0.5019608, 1,
-0.216098, 0.1557313, -0.8718629, 0, 1, 0.509804, 1,
-0.2087577, 1.20999, 0.4900288, 0, 1, 0.5137255, 1,
-0.207421, 0.2955957, 0.005074907, 0, 1, 0.5215687, 1,
-0.2045208, 1.083895, -0.04875826, 0, 1, 0.5254902, 1,
-0.2033494, -0.01250212, -1.354635, 0, 1, 0.5333334, 1,
-0.2027341, 1.061622, 0.6362646, 0, 1, 0.5372549, 1,
-0.1998822, 0.6405314, -0.7273313, 0, 1, 0.5450981, 1,
-0.1996026, 0.02548935, -1.625644, 0, 1, 0.5490196, 1,
-0.1990672, 0.512581, -0.4391733, 0, 1, 0.5568628, 1,
-0.1972331, -1.051663, -2.494663, 0, 1, 0.5607843, 1,
-0.1940878, 0.9179471, -2.016664, 0, 1, 0.5686275, 1,
-0.1905231, -1.408286, -3.230706, 0, 1, 0.572549, 1,
-0.1871767, 0.3821784, -1.839215, 0, 1, 0.5803922, 1,
-0.1833589, 0.5004431, -1.536878, 0, 1, 0.5843138, 1,
-0.1808734, -1.032177, -1.963, 0, 1, 0.5921569, 1,
-0.1792689, 0.3174231, 0.2362963, 0, 1, 0.5960785, 1,
-0.1779546, -1.566981, -2.316612, 0, 1, 0.6039216, 1,
-0.1749178, 1.868319, 0.3133964, 0, 1, 0.6117647, 1,
-0.1746564, 0.6918291, 0.8026695, 0, 1, 0.6156863, 1,
-0.1733904, -1.870303, -3.152879, 0, 1, 0.6235294, 1,
-0.1674489, 1.738217, -0.3027588, 0, 1, 0.627451, 1,
-0.1600726, -2.291773, -3.429718, 0, 1, 0.6352941, 1,
-0.1564639, -1.811727, -2.565786, 0, 1, 0.6392157, 1,
-0.1559486, 1.240627, 0.6960304, 0, 1, 0.6470588, 1,
-0.1545284, 0.9779683, -0.1971555, 0, 1, 0.6509804, 1,
-0.1544601, -0.4275782, -1.948967, 0, 1, 0.6588235, 1,
-0.1518441, 0.04138586, -1.594405, 0, 1, 0.6627451, 1,
-0.1509916, 1.072746, -0.1730715, 0, 1, 0.6705883, 1,
-0.1506387, 0.2641851, -0.631808, 0, 1, 0.6745098, 1,
-0.140375, 0.2549341, -2.199155, 0, 1, 0.682353, 1,
-0.1388535, -0.7156607, -2.161465, 0, 1, 0.6862745, 1,
-0.1374176, 0.638266, 0.5630277, 0, 1, 0.6941177, 1,
-0.1369056, -0.1383353, -1.987762, 0, 1, 0.7019608, 1,
-0.1350783, -1.737554, -2.118382, 0, 1, 0.7058824, 1,
-0.1326394, 0.496287, 0.3395379, 0, 1, 0.7137255, 1,
-0.1274913, -0.5697067, -2.900244, 0, 1, 0.7176471, 1,
-0.1256166, 1.273952, -1.972049, 0, 1, 0.7254902, 1,
-0.1204617, -0.1796589, -2.035741, 0, 1, 0.7294118, 1,
-0.1176557, 0.8332478, 0.2450404, 0, 1, 0.7372549, 1,
-0.1133678, -1.09426, 0.007426122, 0, 1, 0.7411765, 1,
-0.1099569, -0.7531501, -4.096358, 0, 1, 0.7490196, 1,
-0.1094949, -0.4439111, -1.409766, 0, 1, 0.7529412, 1,
-0.1054987, 2.529437, 1.569635, 0, 1, 0.7607843, 1,
-0.1054154, 0.6034734, -1.182747, 0, 1, 0.7647059, 1,
-0.1047271, 0.4290883, 0.156657, 0, 1, 0.772549, 1,
-0.1039, 0.106164, 0.3325549, 0, 1, 0.7764706, 1,
-0.09497438, 1.042354, 0.459919, 0, 1, 0.7843137, 1,
-0.09077778, 0.7723686, -0.81062, 0, 1, 0.7882353, 1,
-0.08856114, -1.481265, -3.12407, 0, 1, 0.7960784, 1,
-0.08803795, 0.3928093, -0.1947186, 0, 1, 0.8039216, 1,
-0.08548654, 0.4657098, -0.6079144, 0, 1, 0.8078431, 1,
-0.07936443, -0.3284382, -1.797128, 0, 1, 0.8156863, 1,
-0.07757099, 0.362202, -0.8618634, 0, 1, 0.8196079, 1,
-0.07141171, -1.197149, -3.11162, 0, 1, 0.827451, 1,
-0.0657916, -0.2431408, -2.37677, 0, 1, 0.8313726, 1,
-0.06398823, 1.841035, 0.8266735, 0, 1, 0.8392157, 1,
-0.05970688, 0.1522696, -0.2733761, 0, 1, 0.8431373, 1,
-0.05806099, -1.177884, -3.356769, 0, 1, 0.8509804, 1,
-0.05612309, -1.050504, -1.600755, 0, 1, 0.854902, 1,
-0.05380105, 1.77709, 0.5654952, 0, 1, 0.8627451, 1,
-0.04920581, 1.225055, -1.640907, 0, 1, 0.8666667, 1,
-0.04147116, -0.6795605, -1.52044, 0, 1, 0.8745098, 1,
-0.03881919, -0.4974603, -2.399872, 0, 1, 0.8784314, 1,
-0.03880498, -0.6878753, -1.653886, 0, 1, 0.8862745, 1,
-0.03675205, 1.052158, -0.7495063, 0, 1, 0.8901961, 1,
-0.03530126, -0.9217039, -3.379988, 0, 1, 0.8980392, 1,
-0.0314048, -0.8517423, -1.731655, 0, 1, 0.9058824, 1,
-0.02554431, -0.1326661, -4.267992, 0, 1, 0.9098039, 1,
-0.02281939, 0.2705444, 1.483826, 0, 1, 0.9176471, 1,
-0.02039012, -0.9721883, -4.098296, 0, 1, 0.9215686, 1,
-0.0154536, 0.599597, 0.5637383, 0, 1, 0.9294118, 1,
-0.01541362, -0.6841208, -4.34496, 0, 1, 0.9333333, 1,
-0.01483212, 0.1411849, 1.201839, 0, 1, 0.9411765, 1,
-0.01362638, 2.254878, -2.286513, 0, 1, 0.945098, 1,
-0.0129429, 1.283155, -0.255771, 0, 1, 0.9529412, 1,
-0.01220621, 0.008598099, -1.693832, 0, 1, 0.9568627, 1,
-0.01154839, -0.6780829, -2.42571, 0, 1, 0.9647059, 1,
-0.003990228, 0.25851, -0.113066, 0, 1, 0.9686275, 1,
-0.001596398, 0.09917548, -0.7922496, 0, 1, 0.9764706, 1,
-0.001347245, 0.4703824, -0.1070404, 0, 1, 0.9803922, 1,
-0.0006232955, 0.8933397, 1.609753, 0, 1, 0.9882353, 1,
0.002289638, 1.582261, -0.4392383, 0, 1, 0.9921569, 1,
0.007237385, 0.4776251, 0.664373, 0, 1, 1, 1,
0.01202465, -0.2451133, 4.295897, 0, 0.9921569, 1, 1,
0.01508488, 0.8314262, -0.9069939, 0, 0.9882353, 1, 1,
0.02049427, -0.3830338, 3.772443, 0, 0.9803922, 1, 1,
0.02138566, -1.479438, 4.026971, 0, 0.9764706, 1, 1,
0.02209494, -1.333915, 2.994654, 0, 0.9686275, 1, 1,
0.02349615, -0.7802542, 3.604787, 0, 0.9647059, 1, 1,
0.02538579, 0.4976389, 1.787006, 0, 0.9568627, 1, 1,
0.02660525, -0.1817011, 4.790897, 0, 0.9529412, 1, 1,
0.02782274, 0.02203158, 0.4736727, 0, 0.945098, 1, 1,
0.03467682, -0.6830006, 4.810196, 0, 0.9411765, 1, 1,
0.03656923, 1.106944, -0.1888437, 0, 0.9333333, 1, 1,
0.04099645, -1.151638, 2.829229, 0, 0.9294118, 1, 1,
0.04353972, 2.62717, 0.7267199, 0, 0.9215686, 1, 1,
0.04372533, -0.7592966, 2.606614, 0, 0.9176471, 1, 1,
0.04448966, 0.452944, -0.8089135, 0, 0.9098039, 1, 1,
0.0480837, 0.3507347, 0.2389331, 0, 0.9058824, 1, 1,
0.04823048, -0.6615166, 4.296729, 0, 0.8980392, 1, 1,
0.04833174, 1.093389, 0.8752962, 0, 0.8901961, 1, 1,
0.04847435, -0.8209483, 2.779954, 0, 0.8862745, 1, 1,
0.04908434, 1.382395, -0.1832082, 0, 0.8784314, 1, 1,
0.0506102, -0.03121396, 0.9943676, 0, 0.8745098, 1, 1,
0.05165717, -0.7963173, 3.452414, 0, 0.8666667, 1, 1,
0.05299394, -0.8859088, 2.105728, 0, 0.8627451, 1, 1,
0.05672482, 0.3591281, 2.142672, 0, 0.854902, 1, 1,
0.05737889, 1.039886, 1.154844, 0, 0.8509804, 1, 1,
0.05812261, -1.281061, 2.278657, 0, 0.8431373, 1, 1,
0.05877831, -0.4636782, 1.946397, 0, 0.8392157, 1, 1,
0.06020232, 0.252144, -1.44887, 0, 0.8313726, 1, 1,
0.06326553, -0.5630416, 5.57463, 0, 0.827451, 1, 1,
0.06712415, -1.061361, 3.383582, 0, 0.8196079, 1, 1,
0.06749729, -2.129552, 1.09548, 0, 0.8156863, 1, 1,
0.07038607, -0.3200152, 4.11983, 0, 0.8078431, 1, 1,
0.07208451, -0.6947767, 2.514417, 0, 0.8039216, 1, 1,
0.07505926, 1.443513, -0.581324, 0, 0.7960784, 1, 1,
0.07527533, 1.940189, -0.4259731, 0, 0.7882353, 1, 1,
0.07707621, -0.3316166, 3.489408, 0, 0.7843137, 1, 1,
0.0822739, -0.2048639, 3.654992, 0, 0.7764706, 1, 1,
0.083638, 1.066691, 1.154368, 0, 0.772549, 1, 1,
0.08435068, 0.376911, 0.4136481, 0, 0.7647059, 1, 1,
0.08893399, 0.3653402, -0.4733451, 0, 0.7607843, 1, 1,
0.09058437, 0.8562648, 1.936957, 0, 0.7529412, 1, 1,
0.09186642, -0.04542932, 2.562761, 0, 0.7490196, 1, 1,
0.09195203, 0.6968625, -0.6547933, 0, 0.7411765, 1, 1,
0.09317179, -0.8804222, 4.037657, 0, 0.7372549, 1, 1,
0.09560178, -1.101944, 3.577692, 0, 0.7294118, 1, 1,
0.0972895, 0.09982328, 0.9817508, 0, 0.7254902, 1, 1,
0.1052288, -0.651382, 3.020365, 0, 0.7176471, 1, 1,
0.1061639, 1.518106, -0.4928668, 0, 0.7137255, 1, 1,
0.1081906, -1.848345, 3.833405, 0, 0.7058824, 1, 1,
0.1176763, 0.159856, -0.3239862, 0, 0.6980392, 1, 1,
0.1201222, -0.08751245, 3.948268, 0, 0.6941177, 1, 1,
0.1261962, 1.894795, 0.7555991, 0, 0.6862745, 1, 1,
0.1313756, 0.6436443, -1.995611, 0, 0.682353, 1, 1,
0.1315431, 0.714065, 1.595533, 0, 0.6745098, 1, 1,
0.1356042, -0.2935175, 2.268218, 0, 0.6705883, 1, 1,
0.1389831, 0.6789147, 0.5844337, 0, 0.6627451, 1, 1,
0.1436808, -1.542393, 3.345331, 0, 0.6588235, 1, 1,
0.1467551, 0.7004761, 0.2214193, 0, 0.6509804, 1, 1,
0.1505527, 0.1885186, 1.378107, 0, 0.6470588, 1, 1,
0.1514231, 1.072549, 1.266978, 0, 0.6392157, 1, 1,
0.1526824, -0.1812401, 1.484889, 0, 0.6352941, 1, 1,
0.1601459, -1.578784, 2.122048, 0, 0.627451, 1, 1,
0.1629813, 0.7418389, 0.03151448, 0, 0.6235294, 1, 1,
0.1635758, -0.1710629, 3.062847, 0, 0.6156863, 1, 1,
0.1638508, -0.1470737, 4.394203, 0, 0.6117647, 1, 1,
0.1644118, -0.5630603, 3.293084, 0, 0.6039216, 1, 1,
0.1660072, -0.7940571, 0.9003733, 0, 0.5960785, 1, 1,
0.1670828, -0.7928414, 3.119095, 0, 0.5921569, 1, 1,
0.173659, -0.2260978, 2.857617, 0, 0.5843138, 1, 1,
0.1740686, -1.319977, 3.958785, 0, 0.5803922, 1, 1,
0.1747917, 0.7009544, -0.3614657, 0, 0.572549, 1, 1,
0.178211, -0.4351582, 0.9595694, 0, 0.5686275, 1, 1,
0.1885992, -2.197192, 2.810049, 0, 0.5607843, 1, 1,
0.1924722, -1.43113, 2.736638, 0, 0.5568628, 1, 1,
0.1944827, -0.1334928, 1.845599, 0, 0.5490196, 1, 1,
0.1945173, 1.214303, -1.696463, 0, 0.5450981, 1, 1,
0.1977192, -0.7458444, 3.447981, 0, 0.5372549, 1, 1,
0.1984968, 0.8988898, 2.087299, 0, 0.5333334, 1, 1,
0.2029816, 1.582622, -1.340707, 0, 0.5254902, 1, 1,
0.2052744, -1.299841, 3.519685, 0, 0.5215687, 1, 1,
0.2055051, -0.742791, 4.931459, 0, 0.5137255, 1, 1,
0.2064349, 0.02288345, 2.282384, 0, 0.509804, 1, 1,
0.2109011, 1.140717, -0.3507336, 0, 0.5019608, 1, 1,
0.2139178, -0.6363114, 2.071599, 0, 0.4941176, 1, 1,
0.2164507, 0.7591767, -0.7915326, 0, 0.4901961, 1, 1,
0.2187358, -0.6729199, 4.274851, 0, 0.4823529, 1, 1,
0.2279904, -0.4209544, 2.202329, 0, 0.4784314, 1, 1,
0.2301369, -0.2556469, 3.178282, 0, 0.4705882, 1, 1,
0.2355653, -0.5147753, 3.554182, 0, 0.4666667, 1, 1,
0.2373838, 0.9514223, -0.3046093, 0, 0.4588235, 1, 1,
0.2449781, 2.066874, -0.5346544, 0, 0.454902, 1, 1,
0.2471588, -0.5046905, 0.320089, 0, 0.4470588, 1, 1,
0.2487752, 1.586387, 2.752253, 0, 0.4431373, 1, 1,
0.2525456, -0.8370872, 2.976799, 0, 0.4352941, 1, 1,
0.2549897, -0.4630274, 2.398673, 0, 0.4313726, 1, 1,
0.2558341, -0.4305775, 3.713369, 0, 0.4235294, 1, 1,
0.2564106, -0.5755073, 2.135234, 0, 0.4196078, 1, 1,
0.2596037, -1.509194, 2.079806, 0, 0.4117647, 1, 1,
0.2667165, -1.155083, 3.20681, 0, 0.4078431, 1, 1,
0.2667272, 1.34502, -0.1356651, 0, 0.4, 1, 1,
0.2701372, -0.5427669, 3.179818, 0, 0.3921569, 1, 1,
0.2716234, -0.004894973, 1.480256, 0, 0.3882353, 1, 1,
0.2728705, 0.4639522, 2.410064, 0, 0.3803922, 1, 1,
0.2730661, 0.2675861, 1.184437, 0, 0.3764706, 1, 1,
0.2741789, -2.28833, 1.890591, 0, 0.3686275, 1, 1,
0.2779631, -0.4619006, 2.567725, 0, 0.3647059, 1, 1,
0.2812421, 0.795975, -1.441002, 0, 0.3568628, 1, 1,
0.2833449, -1.204996, 1.750157, 0, 0.3529412, 1, 1,
0.2843148, 2.128789, 0.2361118, 0, 0.345098, 1, 1,
0.2866282, 0.2259824, -0.08016936, 0, 0.3411765, 1, 1,
0.2867384, 1.843566, 0.1264833, 0, 0.3333333, 1, 1,
0.2897326, -1.432315, 1.469368, 0, 0.3294118, 1, 1,
0.2898041, 2.02298, 0.1311539, 0, 0.3215686, 1, 1,
0.2914526, 1.091763, 0.4643815, 0, 0.3176471, 1, 1,
0.2919286, -0.39117, 1.699924, 0, 0.3098039, 1, 1,
0.293918, 1.188327, 0.9903449, 0, 0.3058824, 1, 1,
0.2940888, 1.203631, 2.329954, 0, 0.2980392, 1, 1,
0.2978722, -0.5388055, 3.776826, 0, 0.2901961, 1, 1,
0.2999149, -0.9125488, 3.439337, 0, 0.2862745, 1, 1,
0.3023915, 0.4311332, 1.738486, 0, 0.2784314, 1, 1,
0.3034531, -1.06031, 1.650123, 0, 0.2745098, 1, 1,
0.3042698, 0.1691023, 2.477989, 0, 0.2666667, 1, 1,
0.3131034, 0.4620566, -0.820258, 0, 0.2627451, 1, 1,
0.3200338, -0.6994027, 2.971262, 0, 0.254902, 1, 1,
0.3228166, -1.314213, 3.351037, 0, 0.2509804, 1, 1,
0.325551, 2.214733, 0.3438351, 0, 0.2431373, 1, 1,
0.3276796, 0.03478311, 1.445906, 0, 0.2392157, 1, 1,
0.3314304, 1.707028, 0.4026045, 0, 0.2313726, 1, 1,
0.332594, 1.414752, -0.07759605, 0, 0.227451, 1, 1,
0.3330927, 0.5724955, 0.5950841, 0, 0.2196078, 1, 1,
0.3337874, -0.4632559, 2.603673, 0, 0.2156863, 1, 1,
0.3350506, -0.3424464, 4.08682, 0, 0.2078431, 1, 1,
0.3357964, 0.6902112, 0.2076252, 0, 0.2039216, 1, 1,
0.3405124, 0.1946396, -0.632036, 0, 0.1960784, 1, 1,
0.3407378, 0.513917, 1.325519, 0, 0.1882353, 1, 1,
0.3427028, -0.4290621, 1.822026, 0, 0.1843137, 1, 1,
0.3497691, 1.157678, 0.7864251, 0, 0.1764706, 1, 1,
0.3565014, 0.517768, 1.266253, 0, 0.172549, 1, 1,
0.3635329, 0.4190578, 0.06564929, 0, 0.1647059, 1, 1,
0.363837, 0.5085142, 2.439177, 0, 0.1607843, 1, 1,
0.366708, 0.3765185, 2.095608, 0, 0.1529412, 1, 1,
0.3714542, -0.2069851, 2.75154, 0, 0.1490196, 1, 1,
0.372341, -0.1349011, 3.457939, 0, 0.1411765, 1, 1,
0.3734668, -1.611869, 3.53282, 0, 0.1372549, 1, 1,
0.3785503, -0.1029628, 1.372945, 0, 0.1294118, 1, 1,
0.3805721, -0.7583998, 3.440105, 0, 0.1254902, 1, 1,
0.3808272, 0.3641231, 0.5655935, 0, 0.1176471, 1, 1,
0.3825655, 0.5906512, 0.6141189, 0, 0.1137255, 1, 1,
0.3836965, 0.6135904, -0.571372, 0, 0.1058824, 1, 1,
0.384461, 0.5492494, 0.6563902, 0, 0.09803922, 1, 1,
0.3853429, -1.152765, 3.118474, 0, 0.09411765, 1, 1,
0.3863907, -0.07085352, -0.369802, 0, 0.08627451, 1, 1,
0.3869875, -0.8319618, 2.822647, 0, 0.08235294, 1, 1,
0.3902822, -1.098812, 4.46892, 0, 0.07450981, 1, 1,
0.3919636, -1.205962, 2.57949, 0, 0.07058824, 1, 1,
0.3959725, 1.48105, 0.2526162, 0, 0.0627451, 1, 1,
0.3969584, -1.250781, 3.395623, 0, 0.05882353, 1, 1,
0.4010361, 1.947651, 0.898102, 0, 0.05098039, 1, 1,
0.4032519, 1.176299, 3.227031, 0, 0.04705882, 1, 1,
0.4043683, -0.9714705, 4.83272, 0, 0.03921569, 1, 1,
0.4051673, -0.6306598, 3.147193, 0, 0.03529412, 1, 1,
0.4053488, 0.03952695, 1.399692, 0, 0.02745098, 1, 1,
0.4072343, 1.21528, 1.794539, 0, 0.02352941, 1, 1,
0.4083279, 0.013803, 2.997312, 0, 0.01568628, 1, 1,
0.4089657, -1.311766, 2.008327, 0, 0.01176471, 1, 1,
0.4116535, 1.809363, -1.032395, 0, 0.003921569, 1, 1,
0.4133779, -0.4708945, 1.733839, 0.003921569, 0, 1, 1,
0.4168263, -0.3750048, 2.473529, 0.007843138, 0, 1, 1,
0.4191903, 1.155344, 1.926621, 0.01568628, 0, 1, 1,
0.4197936, 0.6495397, 0.4723902, 0.01960784, 0, 1, 1,
0.4219573, 0.2707507, 1.5929, 0.02745098, 0, 1, 1,
0.4235687, 0.1874301, 0.7384354, 0.03137255, 0, 1, 1,
0.426279, -0.2056713, 1.247878, 0.03921569, 0, 1, 1,
0.4278272, 0.864671, -0.9704819, 0.04313726, 0, 1, 1,
0.4308624, -1.1065, 1.655057, 0.05098039, 0, 1, 1,
0.4311976, -0.52768, 2.095637, 0.05490196, 0, 1, 1,
0.4315024, 0.5940745, 0.8266254, 0.0627451, 0, 1, 1,
0.4372225, -0.01372418, 1.42548, 0.06666667, 0, 1, 1,
0.4382926, -0.7309552, 2.573178, 0.07450981, 0, 1, 1,
0.4397336, 0.1030897, 1.091902, 0.07843138, 0, 1, 1,
0.4427029, 0.5349764, 1.252567, 0.08627451, 0, 1, 1,
0.4431343, 0.04474404, 1.9706, 0.09019608, 0, 1, 1,
0.4436907, 0.8102016, 1.109758, 0.09803922, 0, 1, 1,
0.4447064, 1.406071, -0.9632717, 0.1058824, 0, 1, 1,
0.4471244, -0.2800584, 2.929382, 0.1098039, 0, 1, 1,
0.4483421, -0.4155868, 2.849703, 0.1176471, 0, 1, 1,
0.4490535, 0.1535828, 1.146417, 0.1215686, 0, 1, 1,
0.4503154, -0.4397655, -0.08076154, 0.1294118, 0, 1, 1,
0.4509063, -1.201639, 3.175902, 0.1333333, 0, 1, 1,
0.450967, -0.3402518, 2.248993, 0.1411765, 0, 1, 1,
0.4546525, -1.749934, 1.685103, 0.145098, 0, 1, 1,
0.4553334, 0.2802536, 0.3329021, 0.1529412, 0, 1, 1,
0.4588185, 0.01765992, 2.278802, 0.1568628, 0, 1, 1,
0.4593587, -0.3416628, 1.927664, 0.1647059, 0, 1, 1,
0.4746609, 1.93846, 0.7800255, 0.1686275, 0, 1, 1,
0.4797651, 0.1703179, 1.591587, 0.1764706, 0, 1, 1,
0.4814075, 1.555134, 0.6776512, 0.1803922, 0, 1, 1,
0.4814933, -0.2306337, 2.265949, 0.1882353, 0, 1, 1,
0.4885937, 1.093622, 1.957744, 0.1921569, 0, 1, 1,
0.4923002, 0.7479197, 1.536242, 0.2, 0, 1, 1,
0.4926773, 2.023891, 1.275269, 0.2078431, 0, 1, 1,
0.4986245, -1.318528, 4.043378, 0.2117647, 0, 1, 1,
0.5038198, 0.581287, 1.434589, 0.2196078, 0, 1, 1,
0.5049521, 1.205091, 0.7365859, 0.2235294, 0, 1, 1,
0.508501, -0.05621764, 1.365188, 0.2313726, 0, 1, 1,
0.5130033, 1.956648, -0.09158617, 0.2352941, 0, 1, 1,
0.5133178, -0.04460105, 1.95802, 0.2431373, 0, 1, 1,
0.5174823, -0.3088946, 3.459461, 0.2470588, 0, 1, 1,
0.5185572, -0.05969647, 3.365801, 0.254902, 0, 1, 1,
0.5200796, 0.2576561, 1.551215, 0.2588235, 0, 1, 1,
0.5204444, -0.515435, 2.328318, 0.2666667, 0, 1, 1,
0.5208683, 0.6496789, 2.015311, 0.2705882, 0, 1, 1,
0.5249921, -0.07903475, 1.933869, 0.2784314, 0, 1, 1,
0.5260586, -0.8728281, 4.661525, 0.282353, 0, 1, 1,
0.526353, -1.918085, 2.334704, 0.2901961, 0, 1, 1,
0.5279249, 0.6630626, 1.238727, 0.2941177, 0, 1, 1,
0.5287578, -0.03417268, 4.364546, 0.3019608, 0, 1, 1,
0.5326471, -0.7302522, 3.056401, 0.3098039, 0, 1, 1,
0.5328527, 0.706822, 1.842889, 0.3137255, 0, 1, 1,
0.5393769, 0.6084756, 1.400876, 0.3215686, 0, 1, 1,
0.5408418, 0.1167614, 1.98003, 0.3254902, 0, 1, 1,
0.5433202, -2.218638, 3.30444, 0.3333333, 0, 1, 1,
0.5456772, 3.245564, 0.7281126, 0.3372549, 0, 1, 1,
0.5481686, -0.7631129, 3.426222, 0.345098, 0, 1, 1,
0.5518224, -0.6162572, 2.885018, 0.3490196, 0, 1, 1,
0.5541697, 1.652458, -0.7186594, 0.3568628, 0, 1, 1,
0.5551856, -0.8899233, 2.448605, 0.3607843, 0, 1, 1,
0.5658321, -1.063779, 2.382935, 0.3686275, 0, 1, 1,
0.5662316, 0.0349671, -0.7423092, 0.372549, 0, 1, 1,
0.5755712, 0.04249507, 0.6167369, 0.3803922, 0, 1, 1,
0.5760945, -0.8899295, 0.5330987, 0.3843137, 0, 1, 1,
0.5792886, -0.236506, 1.55547, 0.3921569, 0, 1, 1,
0.5822514, 0.8971234, 0.1827211, 0.3960784, 0, 1, 1,
0.5875633, -0.1816548, 2.58203, 0.4039216, 0, 1, 1,
0.5943919, -0.7836401, 1.960188, 0.4117647, 0, 1, 1,
0.5959459, -0.1390062, 2.38635, 0.4156863, 0, 1, 1,
0.5986007, 0.9608091, 0.5801848, 0.4235294, 0, 1, 1,
0.6016381, -0.8173962, 3.764961, 0.427451, 0, 1, 1,
0.606351, 0.2812837, 2.998919, 0.4352941, 0, 1, 1,
0.6093276, -0.8699964, 5.414971, 0.4392157, 0, 1, 1,
0.609737, -0.1419506, 1.93096, 0.4470588, 0, 1, 1,
0.6203977, 1.094072, 0.3581869, 0.4509804, 0, 1, 1,
0.6223608, 0.1455509, -1.141274, 0.4588235, 0, 1, 1,
0.6232427, 1.563819, 0.3076608, 0.4627451, 0, 1, 1,
0.6277156, -1.652657, 1.877771, 0.4705882, 0, 1, 1,
0.6321597, 0.3151304, 1.102621, 0.4745098, 0, 1, 1,
0.6338849, -1.040647, 2.522553, 0.4823529, 0, 1, 1,
0.6377899, 0.2241987, 0.5575863, 0.4862745, 0, 1, 1,
0.6379989, 0.1431216, 1.909328, 0.4941176, 0, 1, 1,
0.6392536, -0.3099528, 0.5208731, 0.5019608, 0, 1, 1,
0.6392941, -0.6509592, 0.8057394, 0.5058824, 0, 1, 1,
0.6394337, 1.922812, -0.5706487, 0.5137255, 0, 1, 1,
0.647337, -1.042372, 2.031713, 0.5176471, 0, 1, 1,
0.6483919, 0.1614437, 0.8162046, 0.5254902, 0, 1, 1,
0.6521118, -2.159073, 3.830161, 0.5294118, 0, 1, 1,
0.6607045, -0.5329422, 0.9947625, 0.5372549, 0, 1, 1,
0.6667764, 1.03929, 2.283349, 0.5411765, 0, 1, 1,
0.6670529, -0.08021307, 0.224523, 0.5490196, 0, 1, 1,
0.6704333, -1.776645, 4.131453, 0.5529412, 0, 1, 1,
0.6740456, 0.7289237, 1.777834, 0.5607843, 0, 1, 1,
0.6848692, -0.2130569, 1.943296, 0.5647059, 0, 1, 1,
0.6852831, 0.3163416, 0.6741567, 0.572549, 0, 1, 1,
0.6885372, -0.1408295, 2.571352, 0.5764706, 0, 1, 1,
0.6897771, -0.7241898, 0.7045351, 0.5843138, 0, 1, 1,
0.6988741, 2.665351, 0.7370023, 0.5882353, 0, 1, 1,
0.6993589, -1.004275, 2.670874, 0.5960785, 0, 1, 1,
0.6995332, 0.6033003, 0.6406374, 0.6039216, 0, 1, 1,
0.6999717, -0.310533, 1.760149, 0.6078432, 0, 1, 1,
0.7021599, 1.331344, -0.6233022, 0.6156863, 0, 1, 1,
0.7040839, -0.831291, 3.012703, 0.6196079, 0, 1, 1,
0.7041627, -1.303281, 2.478735, 0.627451, 0, 1, 1,
0.705714, -0.3748556, 2.001698, 0.6313726, 0, 1, 1,
0.7128394, 0.2685992, 2.317095, 0.6392157, 0, 1, 1,
0.7131584, 1.37598, -0.3261556, 0.6431373, 0, 1, 1,
0.7146421, -1.399199, 3.901812, 0.6509804, 0, 1, 1,
0.7178102, 0.9001079, 0.9778328, 0.654902, 0, 1, 1,
0.7191404, -1.547684, 2.098219, 0.6627451, 0, 1, 1,
0.7193348, -0.2469273, 2.102428, 0.6666667, 0, 1, 1,
0.7212566, 0.7679386, 0.8137774, 0.6745098, 0, 1, 1,
0.7273259, -1.622773, 3.03297, 0.6784314, 0, 1, 1,
0.7283917, 1.561925, 0.6975812, 0.6862745, 0, 1, 1,
0.7288041, -0.5547379, 0.2746925, 0.6901961, 0, 1, 1,
0.7297037, -3.154025, 3.845894, 0.6980392, 0, 1, 1,
0.7303488, 1.625759, -0.7658547, 0.7058824, 0, 1, 1,
0.7345901, -1.820499, 2.105683, 0.7098039, 0, 1, 1,
0.7347926, 0.3577445, 1.90364, 0.7176471, 0, 1, 1,
0.7369351, 0.5186994, 1.701818, 0.7215686, 0, 1, 1,
0.7436209, 0.6241402, 1.880045, 0.7294118, 0, 1, 1,
0.7471777, 0.6751467, 2.225586, 0.7333333, 0, 1, 1,
0.7563942, 2.069099, 0.9819542, 0.7411765, 0, 1, 1,
0.7564747, 0.1270036, 2.321349, 0.7450981, 0, 1, 1,
0.7613897, -0.4258287, 0.996987, 0.7529412, 0, 1, 1,
0.7626351, 0.07492966, 1.189247, 0.7568628, 0, 1, 1,
0.7732795, -0.1368116, 3.735656, 0.7647059, 0, 1, 1,
0.7752726, 0.4584344, 1.0419, 0.7686275, 0, 1, 1,
0.7756298, -0.04422718, -0.4383885, 0.7764706, 0, 1, 1,
0.784224, 0.3861283, 1.214653, 0.7803922, 0, 1, 1,
0.7917921, 0.04573086, 3.057631, 0.7882353, 0, 1, 1,
0.7952459, -0.7293559, 2.676447, 0.7921569, 0, 1, 1,
0.8011304, -0.5602829, 2.318831, 0.8, 0, 1, 1,
0.802233, 1.261859, -0.1609644, 0.8078431, 0, 1, 1,
0.8067676, -0.9802829, 1.840124, 0.8117647, 0, 1, 1,
0.8078974, 0.476553, -0.2032729, 0.8196079, 0, 1, 1,
0.8102532, 0.9300482, 1.853972, 0.8235294, 0, 1, 1,
0.8189605, -0.7435551, 1.608012, 0.8313726, 0, 1, 1,
0.8235226, -0.517294, 2.515121, 0.8352941, 0, 1, 1,
0.8251723, 0.6809625, 0.6893747, 0.8431373, 0, 1, 1,
0.8287355, 0.2505844, 1.605521, 0.8470588, 0, 1, 1,
0.8359553, 0.7026618, 1.390562, 0.854902, 0, 1, 1,
0.840619, 1.042266, 2.59509, 0.8588235, 0, 1, 1,
0.8417627, -0.5195721, 1.734074, 0.8666667, 0, 1, 1,
0.8441368, -1.161231, 2.188477, 0.8705882, 0, 1, 1,
0.8572451, 1.192733, 0.2740906, 0.8784314, 0, 1, 1,
0.8672687, -0.6970689, 2.498066, 0.8823529, 0, 1, 1,
0.8792895, 1.804487, 2.140669, 0.8901961, 0, 1, 1,
0.8811574, 2.361903, 0.4385725, 0.8941177, 0, 1, 1,
0.8841489, 0.7635208, 0.104718, 0.9019608, 0, 1, 1,
0.8889117, -0.028444, 1.44132, 0.9098039, 0, 1, 1,
0.8897064, -0.1205925, 0.3706982, 0.9137255, 0, 1, 1,
0.8901859, -0.1957774, 0.95385, 0.9215686, 0, 1, 1,
0.8947655, -0.736665, 3.241914, 0.9254902, 0, 1, 1,
0.9037319, -0.01922653, 0.7013381, 0.9333333, 0, 1, 1,
0.9041519, 0.07146843, 1.249769, 0.9372549, 0, 1, 1,
0.9089525, 0.02474143, 0.6530145, 0.945098, 0, 1, 1,
0.9133475, 0.4147785, 0.7464538, 0.9490196, 0, 1, 1,
0.9165621, 0.2552333, 0.5959716, 0.9568627, 0, 1, 1,
0.9236875, -1.32171, 3.243512, 0.9607843, 0, 1, 1,
0.9245545, -1.852206, 3.244334, 0.9686275, 0, 1, 1,
0.9288272, -1.841091, 2.322865, 0.972549, 0, 1, 1,
0.9369408, -0.04256098, 2.653747, 0.9803922, 0, 1, 1,
0.9382906, 0.05789321, 2.671253, 0.9843137, 0, 1, 1,
0.9475908, -0.6969594, 2.243471, 0.9921569, 0, 1, 1,
0.948752, -0.6671315, 2.858987, 0.9960784, 0, 1, 1,
0.9540519, -2.637274, 4.005448, 1, 0, 0.9960784, 1,
0.9560765, -0.2786707, 2.776481, 1, 0, 0.9882353, 1,
0.9585844, 0.4890676, -0.5741416, 1, 0, 0.9843137, 1,
0.9587194, 1.559638, 2.028842, 1, 0, 0.9764706, 1,
0.9627016, -0.3561695, -0.5125124, 1, 0, 0.972549, 1,
0.9716872, 0.317516, 2.330857, 1, 0, 0.9647059, 1,
0.9717633, -0.2851059, 0.3774226, 1, 0, 0.9607843, 1,
0.9733601, -2.032384, 3.076632, 1, 0, 0.9529412, 1,
0.9776859, -0.05876865, 2.214411, 1, 0, 0.9490196, 1,
0.9785281, -0.2349646, 1.63556, 1, 0, 0.9411765, 1,
0.993737, 0.005620631, 0.4651985, 1, 0, 0.9372549, 1,
1.002247, 2.182454, -1.815585, 1, 0, 0.9294118, 1,
1.003917, -0.2708285, 1.275203, 1, 0, 0.9254902, 1,
1.006057, 1.982584, 2.636363, 1, 0, 0.9176471, 1,
1.006202, 1.075057, 0.615522, 1, 0, 0.9137255, 1,
1.010906, 1.698328, 1.773369, 1, 0, 0.9058824, 1,
1.013038, -0.1748917, 2.666769, 1, 0, 0.9019608, 1,
1.015106, 0.8815783, 0.762648, 1, 0, 0.8941177, 1,
1.015749, 1.018909, -1.474826, 1, 0, 0.8862745, 1,
1.017862, 0.4167075, 0.2984394, 1, 0, 0.8823529, 1,
1.019445, -1.61709, 3.578744, 1, 0, 0.8745098, 1,
1.025568, -2.049665, 2.494111, 1, 0, 0.8705882, 1,
1.029286, 1.565854, 2.311195, 1, 0, 0.8627451, 1,
1.031538, 0.7879848, -0.136061, 1, 0, 0.8588235, 1,
1.031726, 0.4385737, 0.8377728, 1, 0, 0.8509804, 1,
1.038476, 0.153512, -1.194309, 1, 0, 0.8470588, 1,
1.040945, 0.7443588, 2.25279, 1, 0, 0.8392157, 1,
1.041734, -0.4304777, 0.6054563, 1, 0, 0.8352941, 1,
1.04271, -0.3790441, 1.709991, 1, 0, 0.827451, 1,
1.047542, -0.6214041, 2.492182, 1, 0, 0.8235294, 1,
1.049292, -1.928122, 2.076588, 1, 0, 0.8156863, 1,
1.049442, 0.02836769, 2.927686, 1, 0, 0.8117647, 1,
1.05287, -0.3800025, 3.876812, 1, 0, 0.8039216, 1,
1.054966, 0.5208624, 0.3577394, 1, 0, 0.7960784, 1,
1.05672, 0.5575536, 1.291944, 1, 0, 0.7921569, 1,
1.05682, -1.305774, 3.477623, 1, 0, 0.7843137, 1,
1.068419, 0.1362374, 0.5562058, 1, 0, 0.7803922, 1,
1.077064, 3.508322, -0.8927467, 1, 0, 0.772549, 1,
1.080362, -1.928852, 2.354057, 1, 0, 0.7686275, 1,
1.088112, 1.167491, 0.6857415, 1, 0, 0.7607843, 1,
1.095272, 0.2375618, 1.277295, 1, 0, 0.7568628, 1,
1.102373, 1.693666, 0.5038646, 1, 0, 0.7490196, 1,
1.103334, 0.9467093, 0.4138192, 1, 0, 0.7450981, 1,
1.109725, -0.05384829, 2.489973, 1, 0, 0.7372549, 1,
1.110414, 0.4611353, 1.483191, 1, 0, 0.7333333, 1,
1.12619, 1.540363, 0.2844946, 1, 0, 0.7254902, 1,
1.135741, 0.4877919, 1.145111, 1, 0, 0.7215686, 1,
1.142244, -0.7756097, 1.414064, 1, 0, 0.7137255, 1,
1.143712, -0.09924454, 1.870156, 1, 0, 0.7098039, 1,
1.151208, 0.795123, 2.172704, 1, 0, 0.7019608, 1,
1.151742, 0.3019032, 2.001604, 1, 0, 0.6941177, 1,
1.163483, -0.6045123, 0.9250033, 1, 0, 0.6901961, 1,
1.172986, 0.1456237, 2.517088, 1, 0, 0.682353, 1,
1.178725, 0.06933051, 0.8402713, 1, 0, 0.6784314, 1,
1.181899, 0.01589243, 1.339876, 1, 0, 0.6705883, 1,
1.183499, -0.5247558, 1.11472, 1, 0, 0.6666667, 1,
1.185057, 0.4623571, 0.4617063, 1, 0, 0.6588235, 1,
1.18664, -1.040166, 2.657433, 1, 0, 0.654902, 1,
1.191427, -0.2372679, 1.731804, 1, 0, 0.6470588, 1,
1.193124, -0.2246821, 1.654132, 1, 0, 0.6431373, 1,
1.193447, 0.292149, 2.4133, 1, 0, 0.6352941, 1,
1.200487, 0.2973913, 0.7563457, 1, 0, 0.6313726, 1,
1.202721, -0.665432, 4.094357, 1, 0, 0.6235294, 1,
1.208393, 0.1841125, 2.50958, 1, 0, 0.6196079, 1,
1.212967, 0.7448136, 0.9049436, 1, 0, 0.6117647, 1,
1.214105, 0.5484406, 3.764401, 1, 0, 0.6078432, 1,
1.2153, -0.3453916, 0.4149594, 1, 0, 0.6, 1,
1.217482, -0.5308035, 2.286153, 1, 0, 0.5921569, 1,
1.220807, 0.8680155, 0.7172337, 1, 0, 0.5882353, 1,
1.225241, 2.056062, 0.160827, 1, 0, 0.5803922, 1,
1.225957, -0.09058648, 1.56139, 1, 0, 0.5764706, 1,
1.230301, 0.787753, 0.9034327, 1, 0, 0.5686275, 1,
1.262292, 0.855041, 0.5230308, 1, 0, 0.5647059, 1,
1.269986, -0.436454, 2.495363, 1, 0, 0.5568628, 1,
1.280603, -1.392701, 1.419388, 1, 0, 0.5529412, 1,
1.282548, -0.7797064, 2.401551, 1, 0, 0.5450981, 1,
1.28904, -0.0538457, 1.641645, 1, 0, 0.5411765, 1,
1.301676, 0.7234059, -1.347798, 1, 0, 0.5333334, 1,
1.304222, -0.3648015, 2.959234, 1, 0, 0.5294118, 1,
1.305049, -0.1955649, 0.5832142, 1, 0, 0.5215687, 1,
1.311519, -2.009396, 2.587792, 1, 0, 0.5176471, 1,
1.31284, -0.3919145, 1.645808, 1, 0, 0.509804, 1,
1.324221, -1.506401, 1.587908, 1, 0, 0.5058824, 1,
1.32757, 0.1782369, 1.356687, 1, 0, 0.4980392, 1,
1.329987, -0.3669031, 3.033027, 1, 0, 0.4901961, 1,
1.333339, -1.324028, 1.800372, 1, 0, 0.4862745, 1,
1.339561, -0.3712845, 1.863021, 1, 0, 0.4784314, 1,
1.339785, 0.2979406, 2.692785, 1, 0, 0.4745098, 1,
1.34557, 0.8692963, 0.7459412, 1, 0, 0.4666667, 1,
1.349037, 0.6402182, 1.722462, 1, 0, 0.4627451, 1,
1.349557, 0.4357027, 0.3625501, 1, 0, 0.454902, 1,
1.350875, -0.4609748, 0.795723, 1, 0, 0.4509804, 1,
1.351351, -0.5689187, 2.493565, 1, 0, 0.4431373, 1,
1.359213, -1.970107, 0.9242581, 1, 0, 0.4392157, 1,
1.366419, -1.340136, 2.520977, 1, 0, 0.4313726, 1,
1.367941, -0.3534248, 1.177581, 1, 0, 0.427451, 1,
1.372685, -1.056269, 1.483156, 1, 0, 0.4196078, 1,
1.412874, -0.6363586, 1.157478, 1, 0, 0.4156863, 1,
1.414328, 1.510963, 0.9260305, 1, 0, 0.4078431, 1,
1.433654, -0.7905318, 1.088247, 1, 0, 0.4039216, 1,
1.437015, -0.3210731, 1.040417, 1, 0, 0.3960784, 1,
1.447223, 0.5812324, 0.0371285, 1, 0, 0.3882353, 1,
1.45413, -0.171613, 3.089748, 1, 0, 0.3843137, 1,
1.454796, -1.775604, 1.033288, 1, 0, 0.3764706, 1,
1.469197, -0.3786268, 2.198665, 1, 0, 0.372549, 1,
1.483845, 0.6346901, -0.009705056, 1, 0, 0.3647059, 1,
1.51568, -0.6864291, 1.19258, 1, 0, 0.3607843, 1,
1.52033, -0.7954003, 2.214435, 1, 0, 0.3529412, 1,
1.536103, -1.121308, 1.416244, 1, 0, 0.3490196, 1,
1.536171, -0.8379179, 1.773218, 1, 0, 0.3411765, 1,
1.562148, -1.710036, 2.494263, 1, 0, 0.3372549, 1,
1.569353, -1.087439, 1.431282, 1, 0, 0.3294118, 1,
1.585271, 0.1058356, 2.969833, 1, 0, 0.3254902, 1,
1.58586, 1.472695, -0.4091826, 1, 0, 0.3176471, 1,
1.589676, -1.491755, 1.165892, 1, 0, 0.3137255, 1,
1.591214, 0.2734305, 2.730207, 1, 0, 0.3058824, 1,
1.604468, 0.2555321, 0.01892067, 1, 0, 0.2980392, 1,
1.61194, -1.349795, 1.918291, 1, 0, 0.2941177, 1,
1.627053, -0.06857377, 2.944741, 1, 0, 0.2862745, 1,
1.627077, -0.4170336, 2.744899, 1, 0, 0.282353, 1,
1.635582, 0.06726523, 0.08617412, 1, 0, 0.2745098, 1,
1.64182, 0.0562785, 3.592131, 1, 0, 0.2705882, 1,
1.65423, -1.081698, 0.8053717, 1, 0, 0.2627451, 1,
1.659113, -1.298215, 1.997341, 1, 0, 0.2588235, 1,
1.691145, 0.1367664, 3.710222, 1, 0, 0.2509804, 1,
1.704326, 0.2326724, 1.444929, 1, 0, 0.2470588, 1,
1.730895, 0.1899378, 1.140072, 1, 0, 0.2392157, 1,
1.752282, -0.06698439, -0.1756689, 1, 0, 0.2352941, 1,
1.78489, 1.453369, -2.321696, 1, 0, 0.227451, 1,
1.795577, 1.684232, 0.6892917, 1, 0, 0.2235294, 1,
1.803267, 0.500747, 1.735523, 1, 0, 0.2156863, 1,
1.826117, 0.6976621, 1.818443, 1, 0, 0.2117647, 1,
1.853622, -0.4452627, 2.241612, 1, 0, 0.2039216, 1,
1.865699, 0.1390495, 2.189785, 1, 0, 0.1960784, 1,
1.884043, 2.447412, 1.363844, 1, 0, 0.1921569, 1,
1.886483, 1.312961, 1.527183, 1, 0, 0.1843137, 1,
1.89362, -0.07298606, 1.097948, 1, 0, 0.1803922, 1,
1.924108, -0.7197327, 1.96526, 1, 0, 0.172549, 1,
1.937416, 0.6343188, 1.320229, 1, 0, 0.1686275, 1,
1.941704, -0.006669904, 3.174619, 1, 0, 0.1607843, 1,
1.943507, -0.4681276, 3.200403, 1, 0, 0.1568628, 1,
1.957385, 0.3012309, 1.445111, 1, 0, 0.1490196, 1,
1.96026, -2.752961, 3.289819, 1, 0, 0.145098, 1,
1.973045, -2.345709, 2.286372, 1, 0, 0.1372549, 1,
1.984539, -0.3861947, -0.133116, 1, 0, 0.1333333, 1,
2.006533, 1.179918, -0.1719463, 1, 0, 0.1254902, 1,
2.04315, 0.5099655, 1.830682, 1, 0, 0.1215686, 1,
2.110304, -1.252626, 3.921041, 1, 0, 0.1137255, 1,
2.111069, -0.5490214, 0.145514, 1, 0, 0.1098039, 1,
2.130907, 0.1265398, 1.501525, 1, 0, 0.1019608, 1,
2.158897, 0.9756247, 2.079622, 1, 0, 0.09411765, 1,
2.221727, 0.25418, -0.06365581, 1, 0, 0.09019608, 1,
2.246669, -0.5119631, 3.250818, 1, 0, 0.08235294, 1,
2.246718, 2.689529, 1.081577, 1, 0, 0.07843138, 1,
2.338116, -0.3233893, 0.0476195, 1, 0, 0.07058824, 1,
2.353971, -0.9057671, 1.80833, 1, 0, 0.06666667, 1,
2.356641, -1.339356, 1.814148, 1, 0, 0.05882353, 1,
2.361502, 1.232064, 1.707202, 1, 0, 0.05490196, 1,
2.364589, 0.5031875, 1.263248, 1, 0, 0.04705882, 1,
2.450934, -1.892633, 3.795104, 1, 0, 0.04313726, 1,
2.570624, 0.539416, 3.203865, 1, 0, 0.03529412, 1,
2.632298, 1.476754, 0.2241594, 1, 0, 0.03137255, 1,
2.703613, 0.07830136, 1.156712, 1, 0, 0.02352941, 1,
2.783755, 1.332642, 0.6058137, 1, 0, 0.01960784, 1,
2.931085, -0.5375873, 2.736417, 1, 0, 0.01176471, 1,
2.938751, -1.644093, 1.564155, 1, 0, 0.007843138, 1
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
-0.1585367, -4.283293, -6.406639, 0, -0.5, 0.5, 0.5,
-0.1585367, -4.283293, -6.406639, 1, -0.5, 0.5, 0.5,
-0.1585367, -4.283293, -6.406639, 1, 1.5, 0.5, 0.5,
-0.1585367, -4.283293, -6.406639, 0, 1.5, 0.5, 0.5
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
-4.305804, 0.1771488, -6.406639, 0, -0.5, 0.5, 0.5,
-4.305804, 0.1771488, -6.406639, 1, -0.5, 0.5, 0.5,
-4.305804, 0.1771488, -6.406639, 1, 1.5, 0.5, 0.5,
-4.305804, 0.1771488, -6.406639, 0, 1.5, 0.5, 0.5
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
-4.305804, -4.283293, 0.4522405, 0, -0.5, 0.5, 0.5,
-4.305804, -4.283293, 0.4522405, 1, -0.5, 0.5, 0.5,
-4.305804, -4.283293, 0.4522405, 1, 1.5, 0.5, 0.5,
-4.305804, -4.283293, 0.4522405, 0, 1.5, 0.5, 0.5
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
-3, -3.25396, -4.823821,
2, -3.25396, -4.823821,
-3, -3.25396, -4.823821,
-3, -3.425515, -5.087624,
-2, -3.25396, -4.823821,
-2, -3.425515, -5.087624,
-1, -3.25396, -4.823821,
-1, -3.425515, -5.087624,
0, -3.25396, -4.823821,
0, -3.425515, -5.087624,
1, -3.25396, -4.823821,
1, -3.425515, -5.087624,
2, -3.25396, -4.823821,
2, -3.425515, -5.087624
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
-3, -3.768626, -5.61523, 0, -0.5, 0.5, 0.5,
-3, -3.768626, -5.61523, 1, -0.5, 0.5, 0.5,
-3, -3.768626, -5.61523, 1, 1.5, 0.5, 0.5,
-3, -3.768626, -5.61523, 0, 1.5, 0.5, 0.5,
-2, -3.768626, -5.61523, 0, -0.5, 0.5, 0.5,
-2, -3.768626, -5.61523, 1, -0.5, 0.5, 0.5,
-2, -3.768626, -5.61523, 1, 1.5, 0.5, 0.5,
-2, -3.768626, -5.61523, 0, 1.5, 0.5, 0.5,
-1, -3.768626, -5.61523, 0, -0.5, 0.5, 0.5,
-1, -3.768626, -5.61523, 1, -0.5, 0.5, 0.5,
-1, -3.768626, -5.61523, 1, 1.5, 0.5, 0.5,
-1, -3.768626, -5.61523, 0, 1.5, 0.5, 0.5,
0, -3.768626, -5.61523, 0, -0.5, 0.5, 0.5,
0, -3.768626, -5.61523, 1, -0.5, 0.5, 0.5,
0, -3.768626, -5.61523, 1, 1.5, 0.5, 0.5,
0, -3.768626, -5.61523, 0, 1.5, 0.5, 0.5,
1, -3.768626, -5.61523, 0, -0.5, 0.5, 0.5,
1, -3.768626, -5.61523, 1, -0.5, 0.5, 0.5,
1, -3.768626, -5.61523, 1, 1.5, 0.5, 0.5,
1, -3.768626, -5.61523, 0, 1.5, 0.5, 0.5,
2, -3.768626, -5.61523, 0, -0.5, 0.5, 0.5,
2, -3.768626, -5.61523, 1, -0.5, 0.5, 0.5,
2, -3.768626, -5.61523, 1, 1.5, 0.5, 0.5,
2, -3.768626, -5.61523, 0, 1.5, 0.5, 0.5
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
-3.348742, -3, -4.823821,
-3.348742, 3, -4.823821,
-3.348742, -3, -4.823821,
-3.508253, -3, -5.087624,
-3.348742, -2, -4.823821,
-3.508253, -2, -5.087624,
-3.348742, -1, -4.823821,
-3.508253, -1, -5.087624,
-3.348742, 0, -4.823821,
-3.508253, 0, -5.087624,
-3.348742, 1, -4.823821,
-3.508253, 1, -5.087624,
-3.348742, 2, -4.823821,
-3.508253, 2, -5.087624,
-3.348742, 3, -4.823821,
-3.508253, 3, -5.087624
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
-3.827273, -3, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, -3, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, -3, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, -3, -5.61523, 0, 1.5, 0.5, 0.5,
-3.827273, -2, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, -2, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, -2, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, -2, -5.61523, 0, 1.5, 0.5, 0.5,
-3.827273, -1, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, -1, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, -1, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, -1, -5.61523, 0, 1.5, 0.5, 0.5,
-3.827273, 0, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, 0, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, 0, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, 0, -5.61523, 0, 1.5, 0.5, 0.5,
-3.827273, 1, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, 1, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, 1, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, 1, -5.61523, 0, 1.5, 0.5, 0.5,
-3.827273, 2, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, 2, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, 2, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, 2, -5.61523, 0, 1.5, 0.5, 0.5,
-3.827273, 3, -5.61523, 0, -0.5, 0.5, 0.5,
-3.827273, 3, -5.61523, 1, -0.5, 0.5, 0.5,
-3.827273, 3, -5.61523, 1, 1.5, 0.5, 0.5,
-3.827273, 3, -5.61523, 0, 1.5, 0.5, 0.5
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
-3.348742, -3.25396, -4,
-3.348742, -3.25396, 4,
-3.348742, -3.25396, -4,
-3.508253, -3.425515, -4,
-3.348742, -3.25396, -2,
-3.508253, -3.425515, -2,
-3.348742, -3.25396, 0,
-3.508253, -3.425515, 0,
-3.348742, -3.25396, 2,
-3.508253, -3.425515, 2,
-3.348742, -3.25396, 4,
-3.508253, -3.425515, 4
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
-3.827273, -3.768626, -4, 0, -0.5, 0.5, 0.5,
-3.827273, -3.768626, -4, 1, -0.5, 0.5, 0.5,
-3.827273, -3.768626, -4, 1, 1.5, 0.5, 0.5,
-3.827273, -3.768626, -4, 0, 1.5, 0.5, 0.5,
-3.827273, -3.768626, -2, 0, -0.5, 0.5, 0.5,
-3.827273, -3.768626, -2, 1, -0.5, 0.5, 0.5,
-3.827273, -3.768626, -2, 1, 1.5, 0.5, 0.5,
-3.827273, -3.768626, -2, 0, 1.5, 0.5, 0.5,
-3.827273, -3.768626, 0, 0, -0.5, 0.5, 0.5,
-3.827273, -3.768626, 0, 1, -0.5, 0.5, 0.5,
-3.827273, -3.768626, 0, 1, 1.5, 0.5, 0.5,
-3.827273, -3.768626, 0, 0, 1.5, 0.5, 0.5,
-3.827273, -3.768626, 2, 0, -0.5, 0.5, 0.5,
-3.827273, -3.768626, 2, 1, -0.5, 0.5, 0.5,
-3.827273, -3.768626, 2, 1, 1.5, 0.5, 0.5,
-3.827273, -3.768626, 2, 0, 1.5, 0.5, 0.5,
-3.827273, -3.768626, 4, 0, -0.5, 0.5, 0.5,
-3.827273, -3.768626, 4, 1, -0.5, 0.5, 0.5,
-3.827273, -3.768626, 4, 1, 1.5, 0.5, 0.5,
-3.827273, -3.768626, 4, 0, 1.5, 0.5, 0.5
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
-3.348742, -3.25396, -4.823821,
-3.348742, 3.608258, -4.823821,
-3.348742, -3.25396, 5.728302,
-3.348742, 3.608258, 5.728302,
-3.348742, -3.25396, -4.823821,
-3.348742, -3.25396, 5.728302,
-3.348742, 3.608258, -4.823821,
-3.348742, 3.608258, 5.728302,
-3.348742, -3.25396, -4.823821,
3.031669, -3.25396, -4.823821,
-3.348742, -3.25396, 5.728302,
3.031669, -3.25396, 5.728302,
-3.348742, 3.608258, -4.823821,
3.031669, 3.608258, -4.823821,
-3.348742, 3.608258, 5.728302,
3.031669, 3.608258, 5.728302,
3.031669, -3.25396, -4.823821,
3.031669, 3.608258, -4.823821,
3.031669, -3.25396, 5.728302,
3.031669, 3.608258, 5.728302,
3.031669, -3.25396, -4.823821,
3.031669, -3.25396, 5.728302,
3.031669, 3.608258, -4.823821,
3.031669, 3.608258, 5.728302
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
var radius = 7.535504;
var distance = 33.52631;
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
mvMatrix.translate( 0.1585367, -0.1771488, -0.4522405 );
mvMatrix.scale( 1.276961, 1.187303, 0.7721229 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52631);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
puromycin_aminonucle<-read.table("puromycin_aminonucle.xyz")
```

```
## Error in read.table("puromycin_aminonucle.xyz"): no lines available in input
```

```r
x<-puromycin_aminonucle$V2
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
```

```r
y<-puromycin_aminonucle$V3
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
```

```r
z<-puromycin_aminonucle$V4
```

```
## Error in eval(expr, envir, enclos): object 'puromycin_aminonucle' not found
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
-3.255824, 0.3127295, -0.8391036, 0, 0, 1, 1, 1,
-3.117151, -1.299846, -1.500287, 1, 0, 0, 1, 1,
-2.982942, 1.334641, -1.766539, 1, 0, 0, 1, 1,
-2.959878, 0.2905742, 0.2190058, 1, 0, 0, 1, 1,
-2.744477, -0.2589684, -2.193324, 1, 0, 0, 1, 1,
-2.671688, -0.95078, -2.050096, 1, 0, 0, 1, 1,
-2.592266, 0.5468094, -0.3155156, 0, 0, 0, 1, 1,
-2.565473, 1.087293, -3.356303, 0, 0, 0, 1, 1,
-2.514673, -0.1237102, -0.9471835, 0, 0, 0, 1, 1,
-2.412424, -0.6660116, -0.4794703, 0, 0, 0, 1, 1,
-2.411097, -0.3113709, -2.255815, 0, 0, 0, 1, 1,
-2.325883, 0.0128617, -2.252043, 0, 0, 0, 1, 1,
-2.287958, -1.066785, -1.72992, 0, 0, 0, 1, 1,
-2.261102, -0.8901502, -0.700708, 1, 1, 1, 1, 1,
-2.187126, -1.553326, -0.7978412, 1, 1, 1, 1, 1,
-2.144966, 0.2966593, -0.3510703, 1, 1, 1, 1, 1,
-2.142348, -1.248627, -1.047407, 1, 1, 1, 1, 1,
-2.134558, 0.04278481, -2.315214, 1, 1, 1, 1, 1,
-2.108388, 1.913084, -1.110108, 1, 1, 1, 1, 1,
-2.107396, -0.4065129, -2.244245, 1, 1, 1, 1, 1,
-2.045039, -0.714979, -1.97288, 1, 1, 1, 1, 1,
-2.033562, -0.4879142, -1.723173, 1, 1, 1, 1, 1,
-2.010025, -1.238129, -2.903996, 1, 1, 1, 1, 1,
-2.007047, -1.330696, -0.0468352, 1, 1, 1, 1, 1,
-1.984107, 0.4498098, -1.887512, 1, 1, 1, 1, 1,
-1.964058, -0.4503706, -2.06316, 1, 1, 1, 1, 1,
-1.953628, -0.4630297, -1.971136, 1, 1, 1, 1, 1,
-1.942317, 0.3093292, -1.954785, 1, 1, 1, 1, 1,
-1.938953, 0.7152157, -1.451691, 0, 0, 1, 1, 1,
-1.936653, -1.856371, -1.612281, 1, 0, 0, 1, 1,
-1.926433, 0.2055371, -0.6763432, 1, 0, 0, 1, 1,
-1.891085, 0.5430321, -1.250722, 1, 0, 0, 1, 1,
-1.884737, 1.048084, -0.1515223, 1, 0, 0, 1, 1,
-1.875798, 0.2424945, -1.428556, 1, 0, 0, 1, 1,
-1.859618, 0.9486979, -0.7544227, 0, 0, 0, 1, 1,
-1.859502, -0.1848323, -2.429604, 0, 0, 0, 1, 1,
-1.846488, -0.7493623, -2.575787, 0, 0, 0, 1, 1,
-1.84557, -0.3433183, 0.09478834, 0, 0, 0, 1, 1,
-1.838772, -0.1910918, -2.29925, 0, 0, 0, 1, 1,
-1.83097, 0.8070456, -2.054466, 0, 0, 0, 1, 1,
-1.811152, 0.2879006, -1.123099, 0, 0, 0, 1, 1,
-1.805528, 0.4147229, 0.8094007, 1, 1, 1, 1, 1,
-1.800435, -0.4893098, -2.476007, 1, 1, 1, 1, 1,
-1.798987, 1.189031, -1.868673, 1, 1, 1, 1, 1,
-1.789006, -2.301993, -1.046893, 1, 1, 1, 1, 1,
-1.772982, 0.8334074, -2.89181, 1, 1, 1, 1, 1,
-1.766558, -0.415048, -1.441519, 1, 1, 1, 1, 1,
-1.752873, -0.389092, -2.463366, 1, 1, 1, 1, 1,
-1.752114, -0.7432427, -3.538125, 1, 1, 1, 1, 1,
-1.735173, 0.1466423, -2.187414, 1, 1, 1, 1, 1,
-1.724304, -1.895462, -3.325258, 1, 1, 1, 1, 1,
-1.717924, 0.8282608, -0.5001314, 1, 1, 1, 1, 1,
-1.717512, 1.547313, -0.2271203, 1, 1, 1, 1, 1,
-1.713414, -0.4406415, 0.5253248, 1, 1, 1, 1, 1,
-1.708879, -0.2857462, -2.240536, 1, 1, 1, 1, 1,
-1.691893, -0.8458704, -0.733806, 1, 1, 1, 1, 1,
-1.677758, -1.187917, -2.755579, 0, 0, 1, 1, 1,
-1.674948, 0.4627925, -2.332739, 1, 0, 0, 1, 1,
-1.671659, -1.890941, -3.493661, 1, 0, 0, 1, 1,
-1.670565, 0.4089619, -1.252088, 1, 0, 0, 1, 1,
-1.657973, 0.6030056, -0.6673056, 1, 0, 0, 1, 1,
-1.65023, 2.802983, -0.5999444, 1, 0, 0, 1, 1,
-1.631888, -0.1848181, -2.565198, 0, 0, 0, 1, 1,
-1.629568, -0.3461626, -1.875502, 0, 0, 0, 1, 1,
-1.621068, -0.8775331, -1.644402, 0, 0, 0, 1, 1,
-1.566783, 1.1654, -1.542875, 0, 0, 0, 1, 1,
-1.565544, 0.7960012, -2.388529, 0, 0, 0, 1, 1,
-1.563793, -0.7548192, -4.104515, 0, 0, 0, 1, 1,
-1.557281, -0.2249808, -2.370385, 0, 0, 0, 1, 1,
-1.533165, -1.330788, -0.1965966, 1, 1, 1, 1, 1,
-1.521435, 1.313306, -1.125709, 1, 1, 1, 1, 1,
-1.511184, 0.005227768, -2.022786, 1, 1, 1, 1, 1,
-1.504863, 0.8014226, -0.2551714, 1, 1, 1, 1, 1,
-1.488124, -0.751283, -1.419461, 1, 1, 1, 1, 1,
-1.479353, 1.574388, -0.4976898, 1, 1, 1, 1, 1,
-1.472588, 0.4252592, -1.228996, 1, 1, 1, 1, 1,
-1.46478, -0.813497, -2.479005, 1, 1, 1, 1, 1,
-1.462555, 0.2061717, -1.732045, 1, 1, 1, 1, 1,
-1.453475, 0.2116734, -1.841777, 1, 1, 1, 1, 1,
-1.449071, -0.1106654, -1.323683, 1, 1, 1, 1, 1,
-1.44586, 0.2166408, -1.261461, 1, 1, 1, 1, 1,
-1.441904, -0.7978715, -1.489969, 1, 1, 1, 1, 1,
-1.43098, 1.349264, -1.887066, 1, 1, 1, 1, 1,
-1.427074, -0.001806713, -1.787051, 1, 1, 1, 1, 1,
-1.425926, -0.3818209, -2.744569, 0, 0, 1, 1, 1,
-1.422716, -0.3274417, -0.6412726, 1, 0, 0, 1, 1,
-1.42054, -2.35765, -1.560867, 1, 0, 0, 1, 1,
-1.412891, 0.8924402, -1.956735, 1, 0, 0, 1, 1,
-1.410129, 1.356206, 0.02799757, 1, 0, 0, 1, 1,
-1.39878, 1.646958, -0.6768301, 1, 0, 0, 1, 1,
-1.395015, -0.7918718, -3.645383, 0, 0, 0, 1, 1,
-1.386823, -1.005995, -2.321477, 0, 0, 0, 1, 1,
-1.374182, 1.390254, -1.087307, 0, 0, 0, 1, 1,
-1.369809, -2.696274, -3.034248, 0, 0, 0, 1, 1,
-1.357501, 1.525532, -1.823679, 0, 0, 0, 1, 1,
-1.351939, 0.1787814, -3.164494, 0, 0, 0, 1, 1,
-1.34608, 0.2858019, -0.2732723, 0, 0, 0, 1, 1,
-1.342328, 0.414958, -1.249825, 1, 1, 1, 1, 1,
-1.341434, -0.06859909, -2.053109, 1, 1, 1, 1, 1,
-1.339308, 0.2108304, -1.1773, 1, 1, 1, 1, 1,
-1.336831, 0.04367622, -2.9642, 1, 1, 1, 1, 1,
-1.334691, -0.8916672, -3.401208, 1, 1, 1, 1, 1,
-1.324455, 1.639489, -1.767262, 1, 1, 1, 1, 1,
-1.323316, 1.832523, -0.5468127, 1, 1, 1, 1, 1,
-1.319266, -0.9403482, -1.44932, 1, 1, 1, 1, 1,
-1.304392, -0.7365201, -0.8620271, 1, 1, 1, 1, 1,
-1.286916, -0.8270091, -3.714412, 1, 1, 1, 1, 1,
-1.282014, -0.0537371, -1.900208, 1, 1, 1, 1, 1,
-1.279444, 0.4080426, -0.5002794, 1, 1, 1, 1, 1,
-1.27723, 2.599383, -0.5899892, 1, 1, 1, 1, 1,
-1.276772, 1.806519, 0.6394073, 1, 1, 1, 1, 1,
-1.270361, 0.3892758, 0.06613138, 1, 1, 1, 1, 1,
-1.267332, 0.8323315, -1.778952, 0, 0, 1, 1, 1,
-1.265338, -0.6524024, -1.718726, 1, 0, 0, 1, 1,
-1.263684, 0.5941751, -2.129525, 1, 0, 0, 1, 1,
-1.253938, 0.796581, -1.404914, 1, 0, 0, 1, 1,
-1.249684, -1.04057, -2.186903, 1, 0, 0, 1, 1,
-1.240077, -2.094526, -2.61757, 1, 0, 0, 1, 1,
-1.232735, -0.09604742, -1.141514, 0, 0, 0, 1, 1,
-1.215455, 0.9746934, -1.079377, 0, 0, 0, 1, 1,
-1.21511, -0.9072384, -1.430725, 0, 0, 0, 1, 1,
-1.210359, 0.09497668, -2.022637, 0, 0, 0, 1, 1,
-1.20912, -0.03858756, -2.35815, 0, 0, 0, 1, 1,
-1.188154, -2.33666, -3.605536, 0, 0, 0, 1, 1,
-1.186528, 1.906444, -0.2093945, 0, 0, 0, 1, 1,
-1.18052, -0.8401454, -1.389017, 1, 1, 1, 1, 1,
-1.180478, -1.388565, -0.7772248, 1, 1, 1, 1, 1,
-1.172295, -0.5452853, -3.70689, 1, 1, 1, 1, 1,
-1.163953, 0.7862071, -2.460419, 1, 1, 1, 1, 1,
-1.139778, -1.25316, -1.627979, 1, 1, 1, 1, 1,
-1.135877, -0.4350144, -1.877285, 1, 1, 1, 1, 1,
-1.131931, 0.009260345, -3.163204, 1, 1, 1, 1, 1,
-1.130949, 0.4274155, -3.85095, 1, 1, 1, 1, 1,
-1.116789, 1.136371, -2.322995, 1, 1, 1, 1, 1,
-1.116093, -0.2067941, -2.148566, 1, 1, 1, 1, 1,
-1.113893, 1.492636, 0.2698003, 1, 1, 1, 1, 1,
-1.106642, -0.08967565, -2.023218, 1, 1, 1, 1, 1,
-1.09951, -0.6802559, -3.133535, 1, 1, 1, 1, 1,
-1.095647, 0.5788879, -1.181785, 1, 1, 1, 1, 1,
-1.095488, 0.1468202, -3.312323, 1, 1, 1, 1, 1,
-1.092048, -0.5756787, -2.526993, 0, 0, 1, 1, 1,
-1.09024, 1.758812, 0.2790899, 1, 0, 0, 1, 1,
-1.07374, -2.119982, -1.916819, 1, 0, 0, 1, 1,
-1.072703, 1.344691, -0.7814352, 1, 0, 0, 1, 1,
-1.072684, 1.44404, -0.46389, 1, 0, 0, 1, 1,
-1.071678, 0.7268565, -1.780063, 1, 0, 0, 1, 1,
-1.064652, -0.5978392, -0.4539614, 0, 0, 0, 1, 1,
-1.057617, -0.2781166, -1.636852, 0, 0, 0, 1, 1,
-1.040431, -0.5120089, -2.32092, 0, 0, 0, 1, 1,
-1.040274, 1.501668, 1.308462, 0, 0, 0, 1, 1,
-1.039808, 0.5896277, -1.409781, 0, 0, 0, 1, 1,
-1.039369, 0.3579271, -1.267248, 0, 0, 0, 1, 1,
-1.03591, -0.2640462, -2.412193, 0, 0, 0, 1, 1,
-1.031076, -0.1008882, -1.234123, 1, 1, 1, 1, 1,
-1.027215, 0.1679756, -0.1232206, 1, 1, 1, 1, 1,
-1.025459, -0.9774292, -3.456973, 1, 1, 1, 1, 1,
-1.019821, 0.6952635, -1.047164, 1, 1, 1, 1, 1,
-1.009671, 1.79841, -0.2827042, 1, 1, 1, 1, 1,
-0.9941594, 0.4301961, -1.396884, 1, 1, 1, 1, 1,
-0.9938115, 2.306327, 0.9107872, 1, 1, 1, 1, 1,
-0.9905776, -0.3902306, -0.8451059, 1, 1, 1, 1, 1,
-0.9903449, 1.4854, -1.403527, 1, 1, 1, 1, 1,
-0.9880682, -0.3810866, -4.521891, 1, 1, 1, 1, 1,
-0.9846746, 0.8697647, 0.2255019, 1, 1, 1, 1, 1,
-0.9832771, -1.002314, -3.920933, 1, 1, 1, 1, 1,
-0.9801966, -0.3518851, -2.113489, 1, 1, 1, 1, 1,
-0.977089, 1.312157, 0.6331902, 1, 1, 1, 1, 1,
-0.9704832, -0.008489144, -1.451097, 1, 1, 1, 1, 1,
-0.9659048, -0.06036094, -2.840591, 0, 0, 1, 1, 1,
-0.9648036, -2.024641, -2.532105, 1, 0, 0, 1, 1,
-0.9646266, 1.247719, -1.874755, 1, 0, 0, 1, 1,
-0.9636873, 1.518741, -2.189949, 1, 0, 0, 1, 1,
-0.9499321, -2.178442, -4.131455, 1, 0, 0, 1, 1,
-0.9454079, -2.049717, -1.431706, 1, 0, 0, 1, 1,
-0.9416552, 1.586893, 1.803131, 0, 0, 0, 1, 1,
-0.9382687, 0.1453625, -1.278994, 0, 0, 0, 1, 1,
-0.925245, 0.9973328, -1.014626, 0, 0, 0, 1, 1,
-0.9244562, 0.9337105, 0.9995849, 0, 0, 0, 1, 1,
-0.9169302, -1.706192, -1.976863, 0, 0, 0, 1, 1,
-0.9127346, -0.5892324, -1.502256, 0, 0, 0, 1, 1,
-0.9082537, 0.2116679, -0.7275096, 0, 0, 0, 1, 1,
-0.907983, -1.42532, -3.957073, 1, 1, 1, 1, 1,
-0.9018102, -0.7031455, -0.8929413, 1, 1, 1, 1, 1,
-0.8994558, 0.3046243, -2.151717, 1, 1, 1, 1, 1,
-0.8988246, -0.9301213, -3.37228, 1, 1, 1, 1, 1,
-0.8942229, -1.589038, -0.9348654, 1, 1, 1, 1, 1,
-0.8925127, -0.8658782, -2.674423, 1, 1, 1, 1, 1,
-0.8910437, -0.5970517, -2.208444, 1, 1, 1, 1, 1,
-0.8856377, 0.8768982, -1.704072, 1, 1, 1, 1, 1,
-0.8845736, -0.3853717, -1.279844, 1, 1, 1, 1, 1,
-0.874107, 0.03365701, -1.047913, 1, 1, 1, 1, 1,
-0.8709457, 0.1556052, -3.910162, 1, 1, 1, 1, 1,
-0.8656213, -2.106595, -3.815166, 1, 1, 1, 1, 1,
-0.8649849, 0.7595676, -0.2119247, 1, 1, 1, 1, 1,
-0.8621855, -0.3250141, -1.059511, 1, 1, 1, 1, 1,
-0.8608326, 1.637511, -0.9590517, 1, 1, 1, 1, 1,
-0.8588672, 1.17215, -0.3750459, 0, 0, 1, 1, 1,
-0.8525437, -1.198861, -2.072347, 1, 0, 0, 1, 1,
-0.8490863, -1.113342, -0.3842934, 1, 0, 0, 1, 1,
-0.8438109, -1.192636, -1.130197, 1, 0, 0, 1, 1,
-0.8433969, -0.75069, -1.514956, 1, 0, 0, 1, 1,
-0.8344627, 0.8693251, -1.765755, 1, 0, 0, 1, 1,
-0.8341137, -0.2179354, -1.464626, 0, 0, 0, 1, 1,
-0.8268921, -0.4400859, -4.339427, 0, 0, 0, 1, 1,
-0.8247309, 0.1163796, -2.196903, 0, 0, 0, 1, 1,
-0.821407, -0.08996425, -0.3246987, 0, 0, 0, 1, 1,
-0.8182393, -1.947843, -4.472931, 0, 0, 0, 1, 1,
-0.8165058, -0.1859288, -0.923975, 0, 0, 0, 1, 1,
-0.8159438, 1.432036, -1.9297, 0, 0, 0, 1, 1,
-0.8104921, -2.344063, -2.953627, 1, 1, 1, 1, 1,
-0.8014616, 0.1364121, 0.05732561, 1, 1, 1, 1, 1,
-0.7995076, -0.1372433, -1.935524, 1, 1, 1, 1, 1,
-0.7982371, -2.022232, -3.683403, 1, 1, 1, 1, 1,
-0.7864176, -0.382982, -2.245998, 1, 1, 1, 1, 1,
-0.7855504, -0.4620866, -0.9840457, 1, 1, 1, 1, 1,
-0.7837985, 1.236308, -0.8026751, 1, 1, 1, 1, 1,
-0.779173, -2.149169, -3.559696, 1, 1, 1, 1, 1,
-0.7776877, -0.648258, -3.235747, 1, 1, 1, 1, 1,
-0.7760653, -0.6745074, -3.472423, 1, 1, 1, 1, 1,
-0.7730561, -0.5894652, -1.52434, 1, 1, 1, 1, 1,
-0.7689835, 0.4323182, -2.742169, 1, 1, 1, 1, 1,
-0.7674367, -0.3437122, -0.357094, 1, 1, 1, 1, 1,
-0.7660365, 1.120925, -1.092435, 1, 1, 1, 1, 1,
-0.7626966, 1.551665, 0.6489994, 1, 1, 1, 1, 1,
-0.7560551, 0.3951315, 0.387145, 0, 0, 1, 1, 1,
-0.7546365, 1.669647, -1.277653, 1, 0, 0, 1, 1,
-0.7496163, -0.7853575, -3.127904, 1, 0, 0, 1, 1,
-0.7397164, 0.896566, 0.1774034, 1, 0, 0, 1, 1,
-0.7352651, -2.073332, -3.009979, 1, 0, 0, 1, 1,
-0.7351931, 0.1723543, -1.33514, 1, 0, 0, 1, 1,
-0.7312289, 0.2602577, -1.633163, 0, 0, 0, 1, 1,
-0.7298213, 1.183302, -2.23604, 0, 0, 0, 1, 1,
-0.7270209, -0.4242217, 0.261862, 0, 0, 0, 1, 1,
-0.7263701, 0.8297729, -0.7209822, 0, 0, 0, 1, 1,
-0.7263581, -2.161633, -3.241481, 0, 0, 0, 1, 1,
-0.7236793, -1.32961, -2.691411, 0, 0, 0, 1, 1,
-0.7191526, -1.515214, -4.528629, 0, 0, 0, 1, 1,
-0.7179716, 0.9106615, -1.124679, 1, 1, 1, 1, 1,
-0.7085004, 2.656529, -0.8972356, 1, 1, 1, 1, 1,
-0.706909, -1.416999, -2.598676, 1, 1, 1, 1, 1,
-0.7022051, 1.964328, -0.823501, 1, 1, 1, 1, 1,
-0.7013944, 0.2133782, -2.463153, 1, 1, 1, 1, 1,
-0.7007855, -0.2933304, -1.89571, 1, 1, 1, 1, 1,
-0.6980768, 0.8070914, -1.594919, 1, 1, 1, 1, 1,
-0.6966681, 0.02030933, -1.164327, 1, 1, 1, 1, 1,
-0.6948277, 1.091918, -1.267841, 1, 1, 1, 1, 1,
-0.688262, 0.7709221, 0.9668905, 1, 1, 1, 1, 1,
-0.6877562, 0.108705, -0.5665914, 1, 1, 1, 1, 1,
-0.6870753, -2.232533, -2.649219, 1, 1, 1, 1, 1,
-0.6863621, 0.2402821, 0.205229, 1, 1, 1, 1, 1,
-0.6823855, -1.171962, -3.615742, 1, 1, 1, 1, 1,
-0.6794957, -1.020563, -0.4880751, 1, 1, 1, 1, 1,
-0.6757127, 0.3774177, -1.090522, 0, 0, 1, 1, 1,
-0.6732112, -1.05274, -2.521361, 1, 0, 0, 1, 1,
-0.6720467, -0.7005475, -1.697806, 1, 0, 0, 1, 1,
-0.6702392, 0.1206938, -2.066004, 1, 0, 0, 1, 1,
-0.6673957, 0.7550653, -1.902939, 1, 0, 0, 1, 1,
-0.6660024, -0.04224843, -1.321493, 1, 0, 0, 1, 1,
-0.6627343, -0.0610751, -2.252688, 0, 0, 0, 1, 1,
-0.6581657, 0.6077718, -1.368524, 0, 0, 0, 1, 1,
-0.6563262, -2.351618, -2.979034, 0, 0, 0, 1, 1,
-0.6561775, -0.6971745, -3.163409, 0, 0, 0, 1, 1,
-0.6515105, 0.192256, -0.6978821, 0, 0, 0, 1, 1,
-0.6503618, -1.059714, -4.670149, 0, 0, 0, 1, 1,
-0.6464589, 0.1467826, -2.88421, 0, 0, 0, 1, 1,
-0.6450483, -2.214892, -1.985756, 1, 1, 1, 1, 1,
-0.6426541, -0.3121355, -2.829604, 1, 1, 1, 1, 1,
-0.639465, -1.186986, -1.792922, 1, 1, 1, 1, 1,
-0.6368119, -0.4247024, -2.166847, 1, 1, 1, 1, 1,
-0.6362662, -0.5601276, -2.321251, 1, 1, 1, 1, 1,
-0.6324746, 1.217588, -0.7501652, 1, 1, 1, 1, 1,
-0.6315526, -0.102457, 1.280607, 1, 1, 1, 1, 1,
-0.6297668, -0.06145595, -2.681865, 1, 1, 1, 1, 1,
-0.6273566, 1.254176, 0.4759788, 1, 1, 1, 1, 1,
-0.6243992, 1.396727, -0.3152294, 1, 1, 1, 1, 1,
-0.6216096, -1.09695, -0.8843907, 1, 1, 1, 1, 1,
-0.6200019, 0.5935288, -0.1749849, 1, 1, 1, 1, 1,
-0.6188501, -0.5027128, -1.287885, 1, 1, 1, 1, 1,
-0.6149153, 0.4523861, -1.505797, 1, 1, 1, 1, 1,
-0.6119689, 0.8152245, -1.661797, 1, 1, 1, 1, 1,
-0.6096648, 0.9630877, -1.015909, 0, 0, 1, 1, 1,
-0.6070577, -0.1024426, -3.150664, 1, 0, 0, 1, 1,
-0.6049632, -0.4154338, -2.21823, 1, 0, 0, 1, 1,
-0.604454, -0.2291815, 0.10712, 1, 0, 0, 1, 1,
-0.5993978, -0.6911241, -3.127869, 1, 0, 0, 1, 1,
-0.5966045, 0.6076495, -1.062042, 1, 0, 0, 1, 1,
-0.593942, -0.0665076, -0.1845063, 0, 0, 0, 1, 1,
-0.5934746, 0.8519691, -2.727221, 0, 0, 0, 1, 1,
-0.5878907, 0.5206633, 0.6749924, 0, 0, 0, 1, 1,
-0.5841932, -0.1688467, 0.01181009, 0, 0, 0, 1, 1,
-0.5824202, 0.02889639, -2.160619, 0, 0, 0, 1, 1,
-0.5810584, 0.4059102, -1.398396, 0, 0, 0, 1, 1,
-0.5753808, -0.2784042, -2.141154, 0, 0, 0, 1, 1,
-0.5745815, 2.164085, 1.754902, 1, 1, 1, 1, 1,
-0.5736554, -1.573096, -2.950673, 1, 1, 1, 1, 1,
-0.5723693, 1.276927, 0.8093504, 1, 1, 1, 1, 1,
-0.5495079, 0.9226979, -0.8133789, 1, 1, 1, 1, 1,
-0.549333, 0.3953212, -1.465324, 1, 1, 1, 1, 1,
-0.5397573, -0.8980366, -1.516036, 1, 1, 1, 1, 1,
-0.5369281, -1.393756, -4.181417, 1, 1, 1, 1, 1,
-0.530264, 0.5582376, 0.08394196, 1, 1, 1, 1, 1,
-0.5296077, -0.9342827, -0.6576521, 1, 1, 1, 1, 1,
-0.525418, -0.9030576, -3.004071, 1, 1, 1, 1, 1,
-0.5198144, -1.479556, -1.841158, 1, 1, 1, 1, 1,
-0.5167373, -0.3208209, -2.758107, 1, 1, 1, 1, 1,
-0.5164688, 1.31897, -1.261993, 1, 1, 1, 1, 1,
-0.5107977, -1.870175, -2.772986, 1, 1, 1, 1, 1,
-0.5072666, 0.1938259, -0.8466405, 1, 1, 1, 1, 1,
-0.5065581, 1.084651, -0.02914215, 0, 0, 1, 1, 1,
-0.5043431, -0.6627958, -2.206137, 1, 0, 0, 1, 1,
-0.5022863, 0.08838014, 0.4161492, 1, 0, 0, 1, 1,
-0.500854, -1.074208, -3.696502, 1, 0, 0, 1, 1,
-0.5001947, -0.4263283, -2.377919, 1, 0, 0, 1, 1,
-0.4990697, -1.209059, -2.526597, 1, 0, 0, 1, 1,
-0.4964797, 1.286151, 0.1145759, 0, 0, 0, 1, 1,
-0.4949331, 0.1289156, -0.2527174, 0, 0, 0, 1, 1,
-0.490167, -0.4740778, -3.912297, 0, 0, 0, 1, 1,
-0.4897524, -0.8360853, -2.169067, 0, 0, 0, 1, 1,
-0.4782397, -0.4478007, -4.121094, 0, 0, 0, 1, 1,
-0.4737519, 1.026189, -0.5060237, 0, 0, 0, 1, 1,
-0.4737135, -0.7920431, -2.696509, 0, 0, 0, 1, 1,
-0.4724331, 0.9466593, -0.5212502, 1, 1, 1, 1, 1,
-0.468521, 0.4872868, -0.5469918, 1, 1, 1, 1, 1,
-0.4659439, -0.4083839, -1.484554, 1, 1, 1, 1, 1,
-0.4656754, -1.02034, -2.503054, 1, 1, 1, 1, 1,
-0.4628057, 1.849766, -0.508867, 1, 1, 1, 1, 1,
-0.462004, 0.1403355, -2.660121, 1, 1, 1, 1, 1,
-0.4558437, 1.138273, 0.2672782, 1, 1, 1, 1, 1,
-0.4539451, -0.05913132, -1.373148, 1, 1, 1, 1, 1,
-0.4475698, -0.5145884, -2.438742, 1, 1, 1, 1, 1,
-0.4461354, -0.8943282, -3.527822, 1, 1, 1, 1, 1,
-0.440793, -0.3592836, -2.449168, 1, 1, 1, 1, 1,
-0.440526, -0.7355502, -3.664532, 1, 1, 1, 1, 1,
-0.4360374, -1.122833, -1.4246, 1, 1, 1, 1, 1,
-0.4306426, 1.422993, -0.8829026, 1, 1, 1, 1, 1,
-0.42393, -0.4748327, -0.696499, 1, 1, 1, 1, 1,
-0.4236713, -1.591831, -1.856591, 0, 0, 1, 1, 1,
-0.4233845, 0.1399638, -1.486098, 1, 0, 0, 1, 1,
-0.4216385, -0.5132409, -2.431062, 1, 0, 0, 1, 1,
-0.419421, -0.5436639, -2.89089, 1, 0, 0, 1, 1,
-0.4169516, -0.630998, -2.428332, 1, 0, 0, 1, 1,
-0.4150572, 1.231499, -0.5701232, 1, 0, 0, 1, 1,
-0.41041, 0.7963427, -1.388947, 0, 0, 0, 1, 1,
-0.4096119, 1.441895, -1.040226, 0, 0, 0, 1, 1,
-0.4077363, -1.218408, -1.726949, 0, 0, 0, 1, 1,
-0.4067871, 0.5243838, -1.743012, 0, 0, 0, 1, 1,
-0.4050874, 0.7787501, 1.114253, 0, 0, 0, 1, 1,
-0.4021615, -0.2045102, -2.679094, 0, 0, 0, 1, 1,
-0.4019433, 0.3675319, -1.764578, 0, 0, 0, 1, 1,
-0.4018984, -0.3480442, -3.272158, 1, 1, 1, 1, 1,
-0.399644, 1.585184, -0.6827975, 1, 1, 1, 1, 1,
-0.3994608, 0.9089016, 0.2466876, 1, 1, 1, 1, 1,
-0.3957502, -0.4583916, -2.344425, 1, 1, 1, 1, 1,
-0.3917471, 0.117395, -0.5965019, 1, 1, 1, 1, 1,
-0.3900083, -1.027152, -1.891086, 1, 1, 1, 1, 1,
-0.388279, 1.534169, -0.8345389, 1, 1, 1, 1, 1,
-0.3828533, 0.5158425, 0.3580782, 1, 1, 1, 1, 1,
-0.3821363, 1.129641, -0.3297804, 1, 1, 1, 1, 1,
-0.3790002, -0.2146571, -1.20843, 1, 1, 1, 1, 1,
-0.377665, 1.581637, 0.1462441, 1, 1, 1, 1, 1,
-0.3768758, 0.7351962, -0.1926796, 1, 1, 1, 1, 1,
-0.3601615, 0.8893585, 0.265832, 1, 1, 1, 1, 1,
-0.3525988, -0.4403699, -3.108004, 1, 1, 1, 1, 1,
-0.3523615, -0.5061782, -2.565876, 1, 1, 1, 1, 1,
-0.3513996, 0.5531942, -0.8121173, 0, 0, 1, 1, 1,
-0.3486182, -0.5564101, -1.682571, 1, 0, 0, 1, 1,
-0.3484542, -0.2640777, -2.951977, 1, 0, 0, 1, 1,
-0.3476144, -1.115033, -1.291935, 1, 0, 0, 1, 1,
-0.342512, 0.070165, -1.678814, 1, 0, 0, 1, 1,
-0.3374459, -0.9902319, -2.845652, 1, 0, 0, 1, 1,
-0.3281557, -0.9049349, -1.520592, 0, 0, 0, 1, 1,
-0.3277481, 0.1183303, 0.08251876, 0, 0, 0, 1, 1,
-0.3276107, 0.728498, -0.5834111, 0, 0, 0, 1, 1,
-0.3247791, -0.0300444, -2.154148, 0, 0, 0, 1, 1,
-0.3215652, 0.4396989, -0.4549482, 0, 0, 0, 1, 1,
-0.3179117, -0.636481, -1.645576, 0, 0, 0, 1, 1,
-0.315054, 0.07996109, -0.8600889, 0, 0, 0, 1, 1,
-0.314389, -0.4959038, -1.820192, 1, 1, 1, 1, 1,
-0.3117616, -1.911163, -4.051238, 1, 1, 1, 1, 1,
-0.3078633, -0.1178247, -2.180834, 1, 1, 1, 1, 1,
-0.3063546, 0.1733636, -1.042137, 1, 1, 1, 1, 1,
-0.3044461, -0.5283644, -2.952256, 1, 1, 1, 1, 1,
-0.3019718, -1.311738, -1.871557, 1, 1, 1, 1, 1,
-0.3010704, 0.7497445, 0.6028317, 1, 1, 1, 1, 1,
-0.3003401, -1.067163, -3.361495, 1, 1, 1, 1, 1,
-0.2956232, 1.295017, -2.033959, 1, 1, 1, 1, 1,
-0.2923083, 1.73877, 0.1797057, 1, 1, 1, 1, 1,
-0.2913356, -0.7194574, -3.96101, 1, 1, 1, 1, 1,
-0.2901058, -0.4670241, -1.056359, 1, 1, 1, 1, 1,
-0.2900567, -0.1304323, -3.204748, 1, 1, 1, 1, 1,
-0.2879235, -0.7753957, -2.853328, 1, 1, 1, 1, 1,
-0.2877044, -0.277301, -1.055363, 1, 1, 1, 1, 1,
-0.286127, 1.465256, 1.301394, 0, 0, 1, 1, 1,
-0.2859159, 0.7432238, -1.53106, 1, 0, 0, 1, 1,
-0.285634, -0.847055, -2.387944, 1, 0, 0, 1, 1,
-0.2837774, -0.1665632, -3.246122, 1, 0, 0, 1, 1,
-0.281561, -2.138469, -2.314285, 1, 0, 0, 1, 1,
-0.2807548, 0.3242602, -1.623494, 1, 0, 0, 1, 1,
-0.2761845, 0.3892485, -0.2342144, 0, 0, 0, 1, 1,
-0.2680987, 0.6806954, 0.146184, 0, 0, 0, 1, 1,
-0.2673877, -0.8186301, -2.837818, 0, 0, 0, 1, 1,
-0.2666248, 1.234876, -0.8919645, 0, 0, 0, 1, 1,
-0.2659519, 0.2235211, 0.7833844, 0, 0, 0, 1, 1,
-0.2643421, -0.4933699, -1.707364, 0, 0, 0, 1, 1,
-0.261004, 1.696433, 0.1188022, 0, 0, 0, 1, 1,
-0.2606975, 0.4419128, -1.568416, 1, 1, 1, 1, 1,
-0.2596724, 2.664445, 2.114511, 1, 1, 1, 1, 1,
-0.2596708, 0.1433997, -1.0098, 1, 1, 1, 1, 1,
-0.2552795, -1.280007, -1.542713, 1, 1, 1, 1, 1,
-0.2535088, 1.18485, 0.03239384, 1, 1, 1, 1, 1,
-0.2415653, -0.6746407, -1.37299, 1, 1, 1, 1, 1,
-0.2415318, -0.6340942, -2.039572, 1, 1, 1, 1, 1,
-0.2414839, 0.403379, -0.4102654, 1, 1, 1, 1, 1,
-0.2384181, 0.3169055, -1.987284, 1, 1, 1, 1, 1,
-0.2290336, -0.4098832, -3.622977, 1, 1, 1, 1, 1,
-0.2238296, 1.924792, -0.7429572, 1, 1, 1, 1, 1,
-0.2229655, 0.4764022, 0.3571911, 1, 1, 1, 1, 1,
-0.2189366, -0.327915, -3.006336, 1, 1, 1, 1, 1,
-0.216098, 0.1557313, -0.8718629, 1, 1, 1, 1, 1,
-0.2087577, 1.20999, 0.4900288, 1, 1, 1, 1, 1,
-0.207421, 0.2955957, 0.005074907, 0, 0, 1, 1, 1,
-0.2045208, 1.083895, -0.04875826, 1, 0, 0, 1, 1,
-0.2033494, -0.01250212, -1.354635, 1, 0, 0, 1, 1,
-0.2027341, 1.061622, 0.6362646, 1, 0, 0, 1, 1,
-0.1998822, 0.6405314, -0.7273313, 1, 0, 0, 1, 1,
-0.1996026, 0.02548935, -1.625644, 1, 0, 0, 1, 1,
-0.1990672, 0.512581, -0.4391733, 0, 0, 0, 1, 1,
-0.1972331, -1.051663, -2.494663, 0, 0, 0, 1, 1,
-0.1940878, 0.9179471, -2.016664, 0, 0, 0, 1, 1,
-0.1905231, -1.408286, -3.230706, 0, 0, 0, 1, 1,
-0.1871767, 0.3821784, -1.839215, 0, 0, 0, 1, 1,
-0.1833589, 0.5004431, -1.536878, 0, 0, 0, 1, 1,
-0.1808734, -1.032177, -1.963, 0, 0, 0, 1, 1,
-0.1792689, 0.3174231, 0.2362963, 1, 1, 1, 1, 1,
-0.1779546, -1.566981, -2.316612, 1, 1, 1, 1, 1,
-0.1749178, 1.868319, 0.3133964, 1, 1, 1, 1, 1,
-0.1746564, 0.6918291, 0.8026695, 1, 1, 1, 1, 1,
-0.1733904, -1.870303, -3.152879, 1, 1, 1, 1, 1,
-0.1674489, 1.738217, -0.3027588, 1, 1, 1, 1, 1,
-0.1600726, -2.291773, -3.429718, 1, 1, 1, 1, 1,
-0.1564639, -1.811727, -2.565786, 1, 1, 1, 1, 1,
-0.1559486, 1.240627, 0.6960304, 1, 1, 1, 1, 1,
-0.1545284, 0.9779683, -0.1971555, 1, 1, 1, 1, 1,
-0.1544601, -0.4275782, -1.948967, 1, 1, 1, 1, 1,
-0.1518441, 0.04138586, -1.594405, 1, 1, 1, 1, 1,
-0.1509916, 1.072746, -0.1730715, 1, 1, 1, 1, 1,
-0.1506387, 0.2641851, -0.631808, 1, 1, 1, 1, 1,
-0.140375, 0.2549341, -2.199155, 1, 1, 1, 1, 1,
-0.1388535, -0.7156607, -2.161465, 0, 0, 1, 1, 1,
-0.1374176, 0.638266, 0.5630277, 1, 0, 0, 1, 1,
-0.1369056, -0.1383353, -1.987762, 1, 0, 0, 1, 1,
-0.1350783, -1.737554, -2.118382, 1, 0, 0, 1, 1,
-0.1326394, 0.496287, 0.3395379, 1, 0, 0, 1, 1,
-0.1274913, -0.5697067, -2.900244, 1, 0, 0, 1, 1,
-0.1256166, 1.273952, -1.972049, 0, 0, 0, 1, 1,
-0.1204617, -0.1796589, -2.035741, 0, 0, 0, 1, 1,
-0.1176557, 0.8332478, 0.2450404, 0, 0, 0, 1, 1,
-0.1133678, -1.09426, 0.007426122, 0, 0, 0, 1, 1,
-0.1099569, -0.7531501, -4.096358, 0, 0, 0, 1, 1,
-0.1094949, -0.4439111, -1.409766, 0, 0, 0, 1, 1,
-0.1054987, 2.529437, 1.569635, 0, 0, 0, 1, 1,
-0.1054154, 0.6034734, -1.182747, 1, 1, 1, 1, 1,
-0.1047271, 0.4290883, 0.156657, 1, 1, 1, 1, 1,
-0.1039, 0.106164, 0.3325549, 1, 1, 1, 1, 1,
-0.09497438, 1.042354, 0.459919, 1, 1, 1, 1, 1,
-0.09077778, 0.7723686, -0.81062, 1, 1, 1, 1, 1,
-0.08856114, -1.481265, -3.12407, 1, 1, 1, 1, 1,
-0.08803795, 0.3928093, -0.1947186, 1, 1, 1, 1, 1,
-0.08548654, 0.4657098, -0.6079144, 1, 1, 1, 1, 1,
-0.07936443, -0.3284382, -1.797128, 1, 1, 1, 1, 1,
-0.07757099, 0.362202, -0.8618634, 1, 1, 1, 1, 1,
-0.07141171, -1.197149, -3.11162, 1, 1, 1, 1, 1,
-0.0657916, -0.2431408, -2.37677, 1, 1, 1, 1, 1,
-0.06398823, 1.841035, 0.8266735, 1, 1, 1, 1, 1,
-0.05970688, 0.1522696, -0.2733761, 1, 1, 1, 1, 1,
-0.05806099, -1.177884, -3.356769, 1, 1, 1, 1, 1,
-0.05612309, -1.050504, -1.600755, 0, 0, 1, 1, 1,
-0.05380105, 1.77709, 0.5654952, 1, 0, 0, 1, 1,
-0.04920581, 1.225055, -1.640907, 1, 0, 0, 1, 1,
-0.04147116, -0.6795605, -1.52044, 1, 0, 0, 1, 1,
-0.03881919, -0.4974603, -2.399872, 1, 0, 0, 1, 1,
-0.03880498, -0.6878753, -1.653886, 1, 0, 0, 1, 1,
-0.03675205, 1.052158, -0.7495063, 0, 0, 0, 1, 1,
-0.03530126, -0.9217039, -3.379988, 0, 0, 0, 1, 1,
-0.0314048, -0.8517423, -1.731655, 0, 0, 0, 1, 1,
-0.02554431, -0.1326661, -4.267992, 0, 0, 0, 1, 1,
-0.02281939, 0.2705444, 1.483826, 0, 0, 0, 1, 1,
-0.02039012, -0.9721883, -4.098296, 0, 0, 0, 1, 1,
-0.0154536, 0.599597, 0.5637383, 0, 0, 0, 1, 1,
-0.01541362, -0.6841208, -4.34496, 1, 1, 1, 1, 1,
-0.01483212, 0.1411849, 1.201839, 1, 1, 1, 1, 1,
-0.01362638, 2.254878, -2.286513, 1, 1, 1, 1, 1,
-0.0129429, 1.283155, -0.255771, 1, 1, 1, 1, 1,
-0.01220621, 0.008598099, -1.693832, 1, 1, 1, 1, 1,
-0.01154839, -0.6780829, -2.42571, 1, 1, 1, 1, 1,
-0.003990228, 0.25851, -0.113066, 1, 1, 1, 1, 1,
-0.001596398, 0.09917548, -0.7922496, 1, 1, 1, 1, 1,
-0.001347245, 0.4703824, -0.1070404, 1, 1, 1, 1, 1,
-0.0006232955, 0.8933397, 1.609753, 1, 1, 1, 1, 1,
0.002289638, 1.582261, -0.4392383, 1, 1, 1, 1, 1,
0.007237385, 0.4776251, 0.664373, 1, 1, 1, 1, 1,
0.01202465, -0.2451133, 4.295897, 1, 1, 1, 1, 1,
0.01508488, 0.8314262, -0.9069939, 1, 1, 1, 1, 1,
0.02049427, -0.3830338, 3.772443, 1, 1, 1, 1, 1,
0.02138566, -1.479438, 4.026971, 0, 0, 1, 1, 1,
0.02209494, -1.333915, 2.994654, 1, 0, 0, 1, 1,
0.02349615, -0.7802542, 3.604787, 1, 0, 0, 1, 1,
0.02538579, 0.4976389, 1.787006, 1, 0, 0, 1, 1,
0.02660525, -0.1817011, 4.790897, 1, 0, 0, 1, 1,
0.02782274, 0.02203158, 0.4736727, 1, 0, 0, 1, 1,
0.03467682, -0.6830006, 4.810196, 0, 0, 0, 1, 1,
0.03656923, 1.106944, -0.1888437, 0, 0, 0, 1, 1,
0.04099645, -1.151638, 2.829229, 0, 0, 0, 1, 1,
0.04353972, 2.62717, 0.7267199, 0, 0, 0, 1, 1,
0.04372533, -0.7592966, 2.606614, 0, 0, 0, 1, 1,
0.04448966, 0.452944, -0.8089135, 0, 0, 0, 1, 1,
0.0480837, 0.3507347, 0.2389331, 0, 0, 0, 1, 1,
0.04823048, -0.6615166, 4.296729, 1, 1, 1, 1, 1,
0.04833174, 1.093389, 0.8752962, 1, 1, 1, 1, 1,
0.04847435, -0.8209483, 2.779954, 1, 1, 1, 1, 1,
0.04908434, 1.382395, -0.1832082, 1, 1, 1, 1, 1,
0.0506102, -0.03121396, 0.9943676, 1, 1, 1, 1, 1,
0.05165717, -0.7963173, 3.452414, 1, 1, 1, 1, 1,
0.05299394, -0.8859088, 2.105728, 1, 1, 1, 1, 1,
0.05672482, 0.3591281, 2.142672, 1, 1, 1, 1, 1,
0.05737889, 1.039886, 1.154844, 1, 1, 1, 1, 1,
0.05812261, -1.281061, 2.278657, 1, 1, 1, 1, 1,
0.05877831, -0.4636782, 1.946397, 1, 1, 1, 1, 1,
0.06020232, 0.252144, -1.44887, 1, 1, 1, 1, 1,
0.06326553, -0.5630416, 5.57463, 1, 1, 1, 1, 1,
0.06712415, -1.061361, 3.383582, 1, 1, 1, 1, 1,
0.06749729, -2.129552, 1.09548, 1, 1, 1, 1, 1,
0.07038607, -0.3200152, 4.11983, 0, 0, 1, 1, 1,
0.07208451, -0.6947767, 2.514417, 1, 0, 0, 1, 1,
0.07505926, 1.443513, -0.581324, 1, 0, 0, 1, 1,
0.07527533, 1.940189, -0.4259731, 1, 0, 0, 1, 1,
0.07707621, -0.3316166, 3.489408, 1, 0, 0, 1, 1,
0.0822739, -0.2048639, 3.654992, 1, 0, 0, 1, 1,
0.083638, 1.066691, 1.154368, 0, 0, 0, 1, 1,
0.08435068, 0.376911, 0.4136481, 0, 0, 0, 1, 1,
0.08893399, 0.3653402, -0.4733451, 0, 0, 0, 1, 1,
0.09058437, 0.8562648, 1.936957, 0, 0, 0, 1, 1,
0.09186642, -0.04542932, 2.562761, 0, 0, 0, 1, 1,
0.09195203, 0.6968625, -0.6547933, 0, 0, 0, 1, 1,
0.09317179, -0.8804222, 4.037657, 0, 0, 0, 1, 1,
0.09560178, -1.101944, 3.577692, 1, 1, 1, 1, 1,
0.0972895, 0.09982328, 0.9817508, 1, 1, 1, 1, 1,
0.1052288, -0.651382, 3.020365, 1, 1, 1, 1, 1,
0.1061639, 1.518106, -0.4928668, 1, 1, 1, 1, 1,
0.1081906, -1.848345, 3.833405, 1, 1, 1, 1, 1,
0.1176763, 0.159856, -0.3239862, 1, 1, 1, 1, 1,
0.1201222, -0.08751245, 3.948268, 1, 1, 1, 1, 1,
0.1261962, 1.894795, 0.7555991, 1, 1, 1, 1, 1,
0.1313756, 0.6436443, -1.995611, 1, 1, 1, 1, 1,
0.1315431, 0.714065, 1.595533, 1, 1, 1, 1, 1,
0.1356042, -0.2935175, 2.268218, 1, 1, 1, 1, 1,
0.1389831, 0.6789147, 0.5844337, 1, 1, 1, 1, 1,
0.1436808, -1.542393, 3.345331, 1, 1, 1, 1, 1,
0.1467551, 0.7004761, 0.2214193, 1, 1, 1, 1, 1,
0.1505527, 0.1885186, 1.378107, 1, 1, 1, 1, 1,
0.1514231, 1.072549, 1.266978, 0, 0, 1, 1, 1,
0.1526824, -0.1812401, 1.484889, 1, 0, 0, 1, 1,
0.1601459, -1.578784, 2.122048, 1, 0, 0, 1, 1,
0.1629813, 0.7418389, 0.03151448, 1, 0, 0, 1, 1,
0.1635758, -0.1710629, 3.062847, 1, 0, 0, 1, 1,
0.1638508, -0.1470737, 4.394203, 1, 0, 0, 1, 1,
0.1644118, -0.5630603, 3.293084, 0, 0, 0, 1, 1,
0.1660072, -0.7940571, 0.9003733, 0, 0, 0, 1, 1,
0.1670828, -0.7928414, 3.119095, 0, 0, 0, 1, 1,
0.173659, -0.2260978, 2.857617, 0, 0, 0, 1, 1,
0.1740686, -1.319977, 3.958785, 0, 0, 0, 1, 1,
0.1747917, 0.7009544, -0.3614657, 0, 0, 0, 1, 1,
0.178211, -0.4351582, 0.9595694, 0, 0, 0, 1, 1,
0.1885992, -2.197192, 2.810049, 1, 1, 1, 1, 1,
0.1924722, -1.43113, 2.736638, 1, 1, 1, 1, 1,
0.1944827, -0.1334928, 1.845599, 1, 1, 1, 1, 1,
0.1945173, 1.214303, -1.696463, 1, 1, 1, 1, 1,
0.1977192, -0.7458444, 3.447981, 1, 1, 1, 1, 1,
0.1984968, 0.8988898, 2.087299, 1, 1, 1, 1, 1,
0.2029816, 1.582622, -1.340707, 1, 1, 1, 1, 1,
0.2052744, -1.299841, 3.519685, 1, 1, 1, 1, 1,
0.2055051, -0.742791, 4.931459, 1, 1, 1, 1, 1,
0.2064349, 0.02288345, 2.282384, 1, 1, 1, 1, 1,
0.2109011, 1.140717, -0.3507336, 1, 1, 1, 1, 1,
0.2139178, -0.6363114, 2.071599, 1, 1, 1, 1, 1,
0.2164507, 0.7591767, -0.7915326, 1, 1, 1, 1, 1,
0.2187358, -0.6729199, 4.274851, 1, 1, 1, 1, 1,
0.2279904, -0.4209544, 2.202329, 1, 1, 1, 1, 1,
0.2301369, -0.2556469, 3.178282, 0, 0, 1, 1, 1,
0.2355653, -0.5147753, 3.554182, 1, 0, 0, 1, 1,
0.2373838, 0.9514223, -0.3046093, 1, 0, 0, 1, 1,
0.2449781, 2.066874, -0.5346544, 1, 0, 0, 1, 1,
0.2471588, -0.5046905, 0.320089, 1, 0, 0, 1, 1,
0.2487752, 1.586387, 2.752253, 1, 0, 0, 1, 1,
0.2525456, -0.8370872, 2.976799, 0, 0, 0, 1, 1,
0.2549897, -0.4630274, 2.398673, 0, 0, 0, 1, 1,
0.2558341, -0.4305775, 3.713369, 0, 0, 0, 1, 1,
0.2564106, -0.5755073, 2.135234, 0, 0, 0, 1, 1,
0.2596037, -1.509194, 2.079806, 0, 0, 0, 1, 1,
0.2667165, -1.155083, 3.20681, 0, 0, 0, 1, 1,
0.2667272, 1.34502, -0.1356651, 0, 0, 0, 1, 1,
0.2701372, -0.5427669, 3.179818, 1, 1, 1, 1, 1,
0.2716234, -0.004894973, 1.480256, 1, 1, 1, 1, 1,
0.2728705, 0.4639522, 2.410064, 1, 1, 1, 1, 1,
0.2730661, 0.2675861, 1.184437, 1, 1, 1, 1, 1,
0.2741789, -2.28833, 1.890591, 1, 1, 1, 1, 1,
0.2779631, -0.4619006, 2.567725, 1, 1, 1, 1, 1,
0.2812421, 0.795975, -1.441002, 1, 1, 1, 1, 1,
0.2833449, -1.204996, 1.750157, 1, 1, 1, 1, 1,
0.2843148, 2.128789, 0.2361118, 1, 1, 1, 1, 1,
0.2866282, 0.2259824, -0.08016936, 1, 1, 1, 1, 1,
0.2867384, 1.843566, 0.1264833, 1, 1, 1, 1, 1,
0.2897326, -1.432315, 1.469368, 1, 1, 1, 1, 1,
0.2898041, 2.02298, 0.1311539, 1, 1, 1, 1, 1,
0.2914526, 1.091763, 0.4643815, 1, 1, 1, 1, 1,
0.2919286, -0.39117, 1.699924, 1, 1, 1, 1, 1,
0.293918, 1.188327, 0.9903449, 0, 0, 1, 1, 1,
0.2940888, 1.203631, 2.329954, 1, 0, 0, 1, 1,
0.2978722, -0.5388055, 3.776826, 1, 0, 0, 1, 1,
0.2999149, -0.9125488, 3.439337, 1, 0, 0, 1, 1,
0.3023915, 0.4311332, 1.738486, 1, 0, 0, 1, 1,
0.3034531, -1.06031, 1.650123, 1, 0, 0, 1, 1,
0.3042698, 0.1691023, 2.477989, 0, 0, 0, 1, 1,
0.3131034, 0.4620566, -0.820258, 0, 0, 0, 1, 1,
0.3200338, -0.6994027, 2.971262, 0, 0, 0, 1, 1,
0.3228166, -1.314213, 3.351037, 0, 0, 0, 1, 1,
0.325551, 2.214733, 0.3438351, 0, 0, 0, 1, 1,
0.3276796, 0.03478311, 1.445906, 0, 0, 0, 1, 1,
0.3314304, 1.707028, 0.4026045, 0, 0, 0, 1, 1,
0.332594, 1.414752, -0.07759605, 1, 1, 1, 1, 1,
0.3330927, 0.5724955, 0.5950841, 1, 1, 1, 1, 1,
0.3337874, -0.4632559, 2.603673, 1, 1, 1, 1, 1,
0.3350506, -0.3424464, 4.08682, 1, 1, 1, 1, 1,
0.3357964, 0.6902112, 0.2076252, 1, 1, 1, 1, 1,
0.3405124, 0.1946396, -0.632036, 1, 1, 1, 1, 1,
0.3407378, 0.513917, 1.325519, 1, 1, 1, 1, 1,
0.3427028, -0.4290621, 1.822026, 1, 1, 1, 1, 1,
0.3497691, 1.157678, 0.7864251, 1, 1, 1, 1, 1,
0.3565014, 0.517768, 1.266253, 1, 1, 1, 1, 1,
0.3635329, 0.4190578, 0.06564929, 1, 1, 1, 1, 1,
0.363837, 0.5085142, 2.439177, 1, 1, 1, 1, 1,
0.366708, 0.3765185, 2.095608, 1, 1, 1, 1, 1,
0.3714542, -0.2069851, 2.75154, 1, 1, 1, 1, 1,
0.372341, -0.1349011, 3.457939, 1, 1, 1, 1, 1,
0.3734668, -1.611869, 3.53282, 0, 0, 1, 1, 1,
0.3785503, -0.1029628, 1.372945, 1, 0, 0, 1, 1,
0.3805721, -0.7583998, 3.440105, 1, 0, 0, 1, 1,
0.3808272, 0.3641231, 0.5655935, 1, 0, 0, 1, 1,
0.3825655, 0.5906512, 0.6141189, 1, 0, 0, 1, 1,
0.3836965, 0.6135904, -0.571372, 1, 0, 0, 1, 1,
0.384461, 0.5492494, 0.6563902, 0, 0, 0, 1, 1,
0.3853429, -1.152765, 3.118474, 0, 0, 0, 1, 1,
0.3863907, -0.07085352, -0.369802, 0, 0, 0, 1, 1,
0.3869875, -0.8319618, 2.822647, 0, 0, 0, 1, 1,
0.3902822, -1.098812, 4.46892, 0, 0, 0, 1, 1,
0.3919636, -1.205962, 2.57949, 0, 0, 0, 1, 1,
0.3959725, 1.48105, 0.2526162, 0, 0, 0, 1, 1,
0.3969584, -1.250781, 3.395623, 1, 1, 1, 1, 1,
0.4010361, 1.947651, 0.898102, 1, 1, 1, 1, 1,
0.4032519, 1.176299, 3.227031, 1, 1, 1, 1, 1,
0.4043683, -0.9714705, 4.83272, 1, 1, 1, 1, 1,
0.4051673, -0.6306598, 3.147193, 1, 1, 1, 1, 1,
0.4053488, 0.03952695, 1.399692, 1, 1, 1, 1, 1,
0.4072343, 1.21528, 1.794539, 1, 1, 1, 1, 1,
0.4083279, 0.013803, 2.997312, 1, 1, 1, 1, 1,
0.4089657, -1.311766, 2.008327, 1, 1, 1, 1, 1,
0.4116535, 1.809363, -1.032395, 1, 1, 1, 1, 1,
0.4133779, -0.4708945, 1.733839, 1, 1, 1, 1, 1,
0.4168263, -0.3750048, 2.473529, 1, 1, 1, 1, 1,
0.4191903, 1.155344, 1.926621, 1, 1, 1, 1, 1,
0.4197936, 0.6495397, 0.4723902, 1, 1, 1, 1, 1,
0.4219573, 0.2707507, 1.5929, 1, 1, 1, 1, 1,
0.4235687, 0.1874301, 0.7384354, 0, 0, 1, 1, 1,
0.426279, -0.2056713, 1.247878, 1, 0, 0, 1, 1,
0.4278272, 0.864671, -0.9704819, 1, 0, 0, 1, 1,
0.4308624, -1.1065, 1.655057, 1, 0, 0, 1, 1,
0.4311976, -0.52768, 2.095637, 1, 0, 0, 1, 1,
0.4315024, 0.5940745, 0.8266254, 1, 0, 0, 1, 1,
0.4372225, -0.01372418, 1.42548, 0, 0, 0, 1, 1,
0.4382926, -0.7309552, 2.573178, 0, 0, 0, 1, 1,
0.4397336, 0.1030897, 1.091902, 0, 0, 0, 1, 1,
0.4427029, 0.5349764, 1.252567, 0, 0, 0, 1, 1,
0.4431343, 0.04474404, 1.9706, 0, 0, 0, 1, 1,
0.4436907, 0.8102016, 1.109758, 0, 0, 0, 1, 1,
0.4447064, 1.406071, -0.9632717, 0, 0, 0, 1, 1,
0.4471244, -0.2800584, 2.929382, 1, 1, 1, 1, 1,
0.4483421, -0.4155868, 2.849703, 1, 1, 1, 1, 1,
0.4490535, 0.1535828, 1.146417, 1, 1, 1, 1, 1,
0.4503154, -0.4397655, -0.08076154, 1, 1, 1, 1, 1,
0.4509063, -1.201639, 3.175902, 1, 1, 1, 1, 1,
0.450967, -0.3402518, 2.248993, 1, 1, 1, 1, 1,
0.4546525, -1.749934, 1.685103, 1, 1, 1, 1, 1,
0.4553334, 0.2802536, 0.3329021, 1, 1, 1, 1, 1,
0.4588185, 0.01765992, 2.278802, 1, 1, 1, 1, 1,
0.4593587, -0.3416628, 1.927664, 1, 1, 1, 1, 1,
0.4746609, 1.93846, 0.7800255, 1, 1, 1, 1, 1,
0.4797651, 0.1703179, 1.591587, 1, 1, 1, 1, 1,
0.4814075, 1.555134, 0.6776512, 1, 1, 1, 1, 1,
0.4814933, -0.2306337, 2.265949, 1, 1, 1, 1, 1,
0.4885937, 1.093622, 1.957744, 1, 1, 1, 1, 1,
0.4923002, 0.7479197, 1.536242, 0, 0, 1, 1, 1,
0.4926773, 2.023891, 1.275269, 1, 0, 0, 1, 1,
0.4986245, -1.318528, 4.043378, 1, 0, 0, 1, 1,
0.5038198, 0.581287, 1.434589, 1, 0, 0, 1, 1,
0.5049521, 1.205091, 0.7365859, 1, 0, 0, 1, 1,
0.508501, -0.05621764, 1.365188, 1, 0, 0, 1, 1,
0.5130033, 1.956648, -0.09158617, 0, 0, 0, 1, 1,
0.5133178, -0.04460105, 1.95802, 0, 0, 0, 1, 1,
0.5174823, -0.3088946, 3.459461, 0, 0, 0, 1, 1,
0.5185572, -0.05969647, 3.365801, 0, 0, 0, 1, 1,
0.5200796, 0.2576561, 1.551215, 0, 0, 0, 1, 1,
0.5204444, -0.515435, 2.328318, 0, 0, 0, 1, 1,
0.5208683, 0.6496789, 2.015311, 0, 0, 0, 1, 1,
0.5249921, -0.07903475, 1.933869, 1, 1, 1, 1, 1,
0.5260586, -0.8728281, 4.661525, 1, 1, 1, 1, 1,
0.526353, -1.918085, 2.334704, 1, 1, 1, 1, 1,
0.5279249, 0.6630626, 1.238727, 1, 1, 1, 1, 1,
0.5287578, -0.03417268, 4.364546, 1, 1, 1, 1, 1,
0.5326471, -0.7302522, 3.056401, 1, 1, 1, 1, 1,
0.5328527, 0.706822, 1.842889, 1, 1, 1, 1, 1,
0.5393769, 0.6084756, 1.400876, 1, 1, 1, 1, 1,
0.5408418, 0.1167614, 1.98003, 1, 1, 1, 1, 1,
0.5433202, -2.218638, 3.30444, 1, 1, 1, 1, 1,
0.5456772, 3.245564, 0.7281126, 1, 1, 1, 1, 1,
0.5481686, -0.7631129, 3.426222, 1, 1, 1, 1, 1,
0.5518224, -0.6162572, 2.885018, 1, 1, 1, 1, 1,
0.5541697, 1.652458, -0.7186594, 1, 1, 1, 1, 1,
0.5551856, -0.8899233, 2.448605, 1, 1, 1, 1, 1,
0.5658321, -1.063779, 2.382935, 0, 0, 1, 1, 1,
0.5662316, 0.0349671, -0.7423092, 1, 0, 0, 1, 1,
0.5755712, 0.04249507, 0.6167369, 1, 0, 0, 1, 1,
0.5760945, -0.8899295, 0.5330987, 1, 0, 0, 1, 1,
0.5792886, -0.236506, 1.55547, 1, 0, 0, 1, 1,
0.5822514, 0.8971234, 0.1827211, 1, 0, 0, 1, 1,
0.5875633, -0.1816548, 2.58203, 0, 0, 0, 1, 1,
0.5943919, -0.7836401, 1.960188, 0, 0, 0, 1, 1,
0.5959459, -0.1390062, 2.38635, 0, 0, 0, 1, 1,
0.5986007, 0.9608091, 0.5801848, 0, 0, 0, 1, 1,
0.6016381, -0.8173962, 3.764961, 0, 0, 0, 1, 1,
0.606351, 0.2812837, 2.998919, 0, 0, 0, 1, 1,
0.6093276, -0.8699964, 5.414971, 0, 0, 0, 1, 1,
0.609737, -0.1419506, 1.93096, 1, 1, 1, 1, 1,
0.6203977, 1.094072, 0.3581869, 1, 1, 1, 1, 1,
0.6223608, 0.1455509, -1.141274, 1, 1, 1, 1, 1,
0.6232427, 1.563819, 0.3076608, 1, 1, 1, 1, 1,
0.6277156, -1.652657, 1.877771, 1, 1, 1, 1, 1,
0.6321597, 0.3151304, 1.102621, 1, 1, 1, 1, 1,
0.6338849, -1.040647, 2.522553, 1, 1, 1, 1, 1,
0.6377899, 0.2241987, 0.5575863, 1, 1, 1, 1, 1,
0.6379989, 0.1431216, 1.909328, 1, 1, 1, 1, 1,
0.6392536, -0.3099528, 0.5208731, 1, 1, 1, 1, 1,
0.6392941, -0.6509592, 0.8057394, 1, 1, 1, 1, 1,
0.6394337, 1.922812, -0.5706487, 1, 1, 1, 1, 1,
0.647337, -1.042372, 2.031713, 1, 1, 1, 1, 1,
0.6483919, 0.1614437, 0.8162046, 1, 1, 1, 1, 1,
0.6521118, -2.159073, 3.830161, 1, 1, 1, 1, 1,
0.6607045, -0.5329422, 0.9947625, 0, 0, 1, 1, 1,
0.6667764, 1.03929, 2.283349, 1, 0, 0, 1, 1,
0.6670529, -0.08021307, 0.224523, 1, 0, 0, 1, 1,
0.6704333, -1.776645, 4.131453, 1, 0, 0, 1, 1,
0.6740456, 0.7289237, 1.777834, 1, 0, 0, 1, 1,
0.6848692, -0.2130569, 1.943296, 1, 0, 0, 1, 1,
0.6852831, 0.3163416, 0.6741567, 0, 0, 0, 1, 1,
0.6885372, -0.1408295, 2.571352, 0, 0, 0, 1, 1,
0.6897771, -0.7241898, 0.7045351, 0, 0, 0, 1, 1,
0.6988741, 2.665351, 0.7370023, 0, 0, 0, 1, 1,
0.6993589, -1.004275, 2.670874, 0, 0, 0, 1, 1,
0.6995332, 0.6033003, 0.6406374, 0, 0, 0, 1, 1,
0.6999717, -0.310533, 1.760149, 0, 0, 0, 1, 1,
0.7021599, 1.331344, -0.6233022, 1, 1, 1, 1, 1,
0.7040839, -0.831291, 3.012703, 1, 1, 1, 1, 1,
0.7041627, -1.303281, 2.478735, 1, 1, 1, 1, 1,
0.705714, -0.3748556, 2.001698, 1, 1, 1, 1, 1,
0.7128394, 0.2685992, 2.317095, 1, 1, 1, 1, 1,
0.7131584, 1.37598, -0.3261556, 1, 1, 1, 1, 1,
0.7146421, -1.399199, 3.901812, 1, 1, 1, 1, 1,
0.7178102, 0.9001079, 0.9778328, 1, 1, 1, 1, 1,
0.7191404, -1.547684, 2.098219, 1, 1, 1, 1, 1,
0.7193348, -0.2469273, 2.102428, 1, 1, 1, 1, 1,
0.7212566, 0.7679386, 0.8137774, 1, 1, 1, 1, 1,
0.7273259, -1.622773, 3.03297, 1, 1, 1, 1, 1,
0.7283917, 1.561925, 0.6975812, 1, 1, 1, 1, 1,
0.7288041, -0.5547379, 0.2746925, 1, 1, 1, 1, 1,
0.7297037, -3.154025, 3.845894, 1, 1, 1, 1, 1,
0.7303488, 1.625759, -0.7658547, 0, 0, 1, 1, 1,
0.7345901, -1.820499, 2.105683, 1, 0, 0, 1, 1,
0.7347926, 0.3577445, 1.90364, 1, 0, 0, 1, 1,
0.7369351, 0.5186994, 1.701818, 1, 0, 0, 1, 1,
0.7436209, 0.6241402, 1.880045, 1, 0, 0, 1, 1,
0.7471777, 0.6751467, 2.225586, 1, 0, 0, 1, 1,
0.7563942, 2.069099, 0.9819542, 0, 0, 0, 1, 1,
0.7564747, 0.1270036, 2.321349, 0, 0, 0, 1, 1,
0.7613897, -0.4258287, 0.996987, 0, 0, 0, 1, 1,
0.7626351, 0.07492966, 1.189247, 0, 0, 0, 1, 1,
0.7732795, -0.1368116, 3.735656, 0, 0, 0, 1, 1,
0.7752726, 0.4584344, 1.0419, 0, 0, 0, 1, 1,
0.7756298, -0.04422718, -0.4383885, 0, 0, 0, 1, 1,
0.784224, 0.3861283, 1.214653, 1, 1, 1, 1, 1,
0.7917921, 0.04573086, 3.057631, 1, 1, 1, 1, 1,
0.7952459, -0.7293559, 2.676447, 1, 1, 1, 1, 1,
0.8011304, -0.5602829, 2.318831, 1, 1, 1, 1, 1,
0.802233, 1.261859, -0.1609644, 1, 1, 1, 1, 1,
0.8067676, -0.9802829, 1.840124, 1, 1, 1, 1, 1,
0.8078974, 0.476553, -0.2032729, 1, 1, 1, 1, 1,
0.8102532, 0.9300482, 1.853972, 1, 1, 1, 1, 1,
0.8189605, -0.7435551, 1.608012, 1, 1, 1, 1, 1,
0.8235226, -0.517294, 2.515121, 1, 1, 1, 1, 1,
0.8251723, 0.6809625, 0.6893747, 1, 1, 1, 1, 1,
0.8287355, 0.2505844, 1.605521, 1, 1, 1, 1, 1,
0.8359553, 0.7026618, 1.390562, 1, 1, 1, 1, 1,
0.840619, 1.042266, 2.59509, 1, 1, 1, 1, 1,
0.8417627, -0.5195721, 1.734074, 1, 1, 1, 1, 1,
0.8441368, -1.161231, 2.188477, 0, 0, 1, 1, 1,
0.8572451, 1.192733, 0.2740906, 1, 0, 0, 1, 1,
0.8672687, -0.6970689, 2.498066, 1, 0, 0, 1, 1,
0.8792895, 1.804487, 2.140669, 1, 0, 0, 1, 1,
0.8811574, 2.361903, 0.4385725, 1, 0, 0, 1, 1,
0.8841489, 0.7635208, 0.104718, 1, 0, 0, 1, 1,
0.8889117, -0.028444, 1.44132, 0, 0, 0, 1, 1,
0.8897064, -0.1205925, 0.3706982, 0, 0, 0, 1, 1,
0.8901859, -0.1957774, 0.95385, 0, 0, 0, 1, 1,
0.8947655, -0.736665, 3.241914, 0, 0, 0, 1, 1,
0.9037319, -0.01922653, 0.7013381, 0, 0, 0, 1, 1,
0.9041519, 0.07146843, 1.249769, 0, 0, 0, 1, 1,
0.9089525, 0.02474143, 0.6530145, 0, 0, 0, 1, 1,
0.9133475, 0.4147785, 0.7464538, 1, 1, 1, 1, 1,
0.9165621, 0.2552333, 0.5959716, 1, 1, 1, 1, 1,
0.9236875, -1.32171, 3.243512, 1, 1, 1, 1, 1,
0.9245545, -1.852206, 3.244334, 1, 1, 1, 1, 1,
0.9288272, -1.841091, 2.322865, 1, 1, 1, 1, 1,
0.9369408, -0.04256098, 2.653747, 1, 1, 1, 1, 1,
0.9382906, 0.05789321, 2.671253, 1, 1, 1, 1, 1,
0.9475908, -0.6969594, 2.243471, 1, 1, 1, 1, 1,
0.948752, -0.6671315, 2.858987, 1, 1, 1, 1, 1,
0.9540519, -2.637274, 4.005448, 1, 1, 1, 1, 1,
0.9560765, -0.2786707, 2.776481, 1, 1, 1, 1, 1,
0.9585844, 0.4890676, -0.5741416, 1, 1, 1, 1, 1,
0.9587194, 1.559638, 2.028842, 1, 1, 1, 1, 1,
0.9627016, -0.3561695, -0.5125124, 1, 1, 1, 1, 1,
0.9716872, 0.317516, 2.330857, 1, 1, 1, 1, 1,
0.9717633, -0.2851059, 0.3774226, 0, 0, 1, 1, 1,
0.9733601, -2.032384, 3.076632, 1, 0, 0, 1, 1,
0.9776859, -0.05876865, 2.214411, 1, 0, 0, 1, 1,
0.9785281, -0.2349646, 1.63556, 1, 0, 0, 1, 1,
0.993737, 0.005620631, 0.4651985, 1, 0, 0, 1, 1,
1.002247, 2.182454, -1.815585, 1, 0, 0, 1, 1,
1.003917, -0.2708285, 1.275203, 0, 0, 0, 1, 1,
1.006057, 1.982584, 2.636363, 0, 0, 0, 1, 1,
1.006202, 1.075057, 0.615522, 0, 0, 0, 1, 1,
1.010906, 1.698328, 1.773369, 0, 0, 0, 1, 1,
1.013038, -0.1748917, 2.666769, 0, 0, 0, 1, 1,
1.015106, 0.8815783, 0.762648, 0, 0, 0, 1, 1,
1.015749, 1.018909, -1.474826, 0, 0, 0, 1, 1,
1.017862, 0.4167075, 0.2984394, 1, 1, 1, 1, 1,
1.019445, -1.61709, 3.578744, 1, 1, 1, 1, 1,
1.025568, -2.049665, 2.494111, 1, 1, 1, 1, 1,
1.029286, 1.565854, 2.311195, 1, 1, 1, 1, 1,
1.031538, 0.7879848, -0.136061, 1, 1, 1, 1, 1,
1.031726, 0.4385737, 0.8377728, 1, 1, 1, 1, 1,
1.038476, 0.153512, -1.194309, 1, 1, 1, 1, 1,
1.040945, 0.7443588, 2.25279, 1, 1, 1, 1, 1,
1.041734, -0.4304777, 0.6054563, 1, 1, 1, 1, 1,
1.04271, -0.3790441, 1.709991, 1, 1, 1, 1, 1,
1.047542, -0.6214041, 2.492182, 1, 1, 1, 1, 1,
1.049292, -1.928122, 2.076588, 1, 1, 1, 1, 1,
1.049442, 0.02836769, 2.927686, 1, 1, 1, 1, 1,
1.05287, -0.3800025, 3.876812, 1, 1, 1, 1, 1,
1.054966, 0.5208624, 0.3577394, 1, 1, 1, 1, 1,
1.05672, 0.5575536, 1.291944, 0, 0, 1, 1, 1,
1.05682, -1.305774, 3.477623, 1, 0, 0, 1, 1,
1.068419, 0.1362374, 0.5562058, 1, 0, 0, 1, 1,
1.077064, 3.508322, -0.8927467, 1, 0, 0, 1, 1,
1.080362, -1.928852, 2.354057, 1, 0, 0, 1, 1,
1.088112, 1.167491, 0.6857415, 1, 0, 0, 1, 1,
1.095272, 0.2375618, 1.277295, 0, 0, 0, 1, 1,
1.102373, 1.693666, 0.5038646, 0, 0, 0, 1, 1,
1.103334, 0.9467093, 0.4138192, 0, 0, 0, 1, 1,
1.109725, -0.05384829, 2.489973, 0, 0, 0, 1, 1,
1.110414, 0.4611353, 1.483191, 0, 0, 0, 1, 1,
1.12619, 1.540363, 0.2844946, 0, 0, 0, 1, 1,
1.135741, 0.4877919, 1.145111, 0, 0, 0, 1, 1,
1.142244, -0.7756097, 1.414064, 1, 1, 1, 1, 1,
1.143712, -0.09924454, 1.870156, 1, 1, 1, 1, 1,
1.151208, 0.795123, 2.172704, 1, 1, 1, 1, 1,
1.151742, 0.3019032, 2.001604, 1, 1, 1, 1, 1,
1.163483, -0.6045123, 0.9250033, 1, 1, 1, 1, 1,
1.172986, 0.1456237, 2.517088, 1, 1, 1, 1, 1,
1.178725, 0.06933051, 0.8402713, 1, 1, 1, 1, 1,
1.181899, 0.01589243, 1.339876, 1, 1, 1, 1, 1,
1.183499, -0.5247558, 1.11472, 1, 1, 1, 1, 1,
1.185057, 0.4623571, 0.4617063, 1, 1, 1, 1, 1,
1.18664, -1.040166, 2.657433, 1, 1, 1, 1, 1,
1.191427, -0.2372679, 1.731804, 1, 1, 1, 1, 1,
1.193124, -0.2246821, 1.654132, 1, 1, 1, 1, 1,
1.193447, 0.292149, 2.4133, 1, 1, 1, 1, 1,
1.200487, 0.2973913, 0.7563457, 1, 1, 1, 1, 1,
1.202721, -0.665432, 4.094357, 0, 0, 1, 1, 1,
1.208393, 0.1841125, 2.50958, 1, 0, 0, 1, 1,
1.212967, 0.7448136, 0.9049436, 1, 0, 0, 1, 1,
1.214105, 0.5484406, 3.764401, 1, 0, 0, 1, 1,
1.2153, -0.3453916, 0.4149594, 1, 0, 0, 1, 1,
1.217482, -0.5308035, 2.286153, 1, 0, 0, 1, 1,
1.220807, 0.8680155, 0.7172337, 0, 0, 0, 1, 1,
1.225241, 2.056062, 0.160827, 0, 0, 0, 1, 1,
1.225957, -0.09058648, 1.56139, 0, 0, 0, 1, 1,
1.230301, 0.787753, 0.9034327, 0, 0, 0, 1, 1,
1.262292, 0.855041, 0.5230308, 0, 0, 0, 1, 1,
1.269986, -0.436454, 2.495363, 0, 0, 0, 1, 1,
1.280603, -1.392701, 1.419388, 0, 0, 0, 1, 1,
1.282548, -0.7797064, 2.401551, 1, 1, 1, 1, 1,
1.28904, -0.0538457, 1.641645, 1, 1, 1, 1, 1,
1.301676, 0.7234059, -1.347798, 1, 1, 1, 1, 1,
1.304222, -0.3648015, 2.959234, 1, 1, 1, 1, 1,
1.305049, -0.1955649, 0.5832142, 1, 1, 1, 1, 1,
1.311519, -2.009396, 2.587792, 1, 1, 1, 1, 1,
1.31284, -0.3919145, 1.645808, 1, 1, 1, 1, 1,
1.324221, -1.506401, 1.587908, 1, 1, 1, 1, 1,
1.32757, 0.1782369, 1.356687, 1, 1, 1, 1, 1,
1.329987, -0.3669031, 3.033027, 1, 1, 1, 1, 1,
1.333339, -1.324028, 1.800372, 1, 1, 1, 1, 1,
1.339561, -0.3712845, 1.863021, 1, 1, 1, 1, 1,
1.339785, 0.2979406, 2.692785, 1, 1, 1, 1, 1,
1.34557, 0.8692963, 0.7459412, 1, 1, 1, 1, 1,
1.349037, 0.6402182, 1.722462, 1, 1, 1, 1, 1,
1.349557, 0.4357027, 0.3625501, 0, 0, 1, 1, 1,
1.350875, -0.4609748, 0.795723, 1, 0, 0, 1, 1,
1.351351, -0.5689187, 2.493565, 1, 0, 0, 1, 1,
1.359213, -1.970107, 0.9242581, 1, 0, 0, 1, 1,
1.366419, -1.340136, 2.520977, 1, 0, 0, 1, 1,
1.367941, -0.3534248, 1.177581, 1, 0, 0, 1, 1,
1.372685, -1.056269, 1.483156, 0, 0, 0, 1, 1,
1.412874, -0.6363586, 1.157478, 0, 0, 0, 1, 1,
1.414328, 1.510963, 0.9260305, 0, 0, 0, 1, 1,
1.433654, -0.7905318, 1.088247, 0, 0, 0, 1, 1,
1.437015, -0.3210731, 1.040417, 0, 0, 0, 1, 1,
1.447223, 0.5812324, 0.0371285, 0, 0, 0, 1, 1,
1.45413, -0.171613, 3.089748, 0, 0, 0, 1, 1,
1.454796, -1.775604, 1.033288, 1, 1, 1, 1, 1,
1.469197, -0.3786268, 2.198665, 1, 1, 1, 1, 1,
1.483845, 0.6346901, -0.009705056, 1, 1, 1, 1, 1,
1.51568, -0.6864291, 1.19258, 1, 1, 1, 1, 1,
1.52033, -0.7954003, 2.214435, 1, 1, 1, 1, 1,
1.536103, -1.121308, 1.416244, 1, 1, 1, 1, 1,
1.536171, -0.8379179, 1.773218, 1, 1, 1, 1, 1,
1.562148, -1.710036, 2.494263, 1, 1, 1, 1, 1,
1.569353, -1.087439, 1.431282, 1, 1, 1, 1, 1,
1.585271, 0.1058356, 2.969833, 1, 1, 1, 1, 1,
1.58586, 1.472695, -0.4091826, 1, 1, 1, 1, 1,
1.589676, -1.491755, 1.165892, 1, 1, 1, 1, 1,
1.591214, 0.2734305, 2.730207, 1, 1, 1, 1, 1,
1.604468, 0.2555321, 0.01892067, 1, 1, 1, 1, 1,
1.61194, -1.349795, 1.918291, 1, 1, 1, 1, 1,
1.627053, -0.06857377, 2.944741, 0, 0, 1, 1, 1,
1.627077, -0.4170336, 2.744899, 1, 0, 0, 1, 1,
1.635582, 0.06726523, 0.08617412, 1, 0, 0, 1, 1,
1.64182, 0.0562785, 3.592131, 1, 0, 0, 1, 1,
1.65423, -1.081698, 0.8053717, 1, 0, 0, 1, 1,
1.659113, -1.298215, 1.997341, 1, 0, 0, 1, 1,
1.691145, 0.1367664, 3.710222, 0, 0, 0, 1, 1,
1.704326, 0.2326724, 1.444929, 0, 0, 0, 1, 1,
1.730895, 0.1899378, 1.140072, 0, 0, 0, 1, 1,
1.752282, -0.06698439, -0.1756689, 0, 0, 0, 1, 1,
1.78489, 1.453369, -2.321696, 0, 0, 0, 1, 1,
1.795577, 1.684232, 0.6892917, 0, 0, 0, 1, 1,
1.803267, 0.500747, 1.735523, 0, 0, 0, 1, 1,
1.826117, 0.6976621, 1.818443, 1, 1, 1, 1, 1,
1.853622, -0.4452627, 2.241612, 1, 1, 1, 1, 1,
1.865699, 0.1390495, 2.189785, 1, 1, 1, 1, 1,
1.884043, 2.447412, 1.363844, 1, 1, 1, 1, 1,
1.886483, 1.312961, 1.527183, 1, 1, 1, 1, 1,
1.89362, -0.07298606, 1.097948, 1, 1, 1, 1, 1,
1.924108, -0.7197327, 1.96526, 1, 1, 1, 1, 1,
1.937416, 0.6343188, 1.320229, 1, 1, 1, 1, 1,
1.941704, -0.006669904, 3.174619, 1, 1, 1, 1, 1,
1.943507, -0.4681276, 3.200403, 1, 1, 1, 1, 1,
1.957385, 0.3012309, 1.445111, 1, 1, 1, 1, 1,
1.96026, -2.752961, 3.289819, 1, 1, 1, 1, 1,
1.973045, -2.345709, 2.286372, 1, 1, 1, 1, 1,
1.984539, -0.3861947, -0.133116, 1, 1, 1, 1, 1,
2.006533, 1.179918, -0.1719463, 1, 1, 1, 1, 1,
2.04315, 0.5099655, 1.830682, 0, 0, 1, 1, 1,
2.110304, -1.252626, 3.921041, 1, 0, 0, 1, 1,
2.111069, -0.5490214, 0.145514, 1, 0, 0, 1, 1,
2.130907, 0.1265398, 1.501525, 1, 0, 0, 1, 1,
2.158897, 0.9756247, 2.079622, 1, 0, 0, 1, 1,
2.221727, 0.25418, -0.06365581, 1, 0, 0, 1, 1,
2.246669, -0.5119631, 3.250818, 0, 0, 0, 1, 1,
2.246718, 2.689529, 1.081577, 0, 0, 0, 1, 1,
2.338116, -0.3233893, 0.0476195, 0, 0, 0, 1, 1,
2.353971, -0.9057671, 1.80833, 0, 0, 0, 1, 1,
2.356641, -1.339356, 1.814148, 0, 0, 0, 1, 1,
2.361502, 1.232064, 1.707202, 0, 0, 0, 1, 1,
2.364589, 0.5031875, 1.263248, 0, 0, 0, 1, 1,
2.450934, -1.892633, 3.795104, 1, 1, 1, 1, 1,
2.570624, 0.539416, 3.203865, 1, 1, 1, 1, 1,
2.632298, 1.476754, 0.2241594, 1, 1, 1, 1, 1,
2.703613, 0.07830136, 1.156712, 1, 1, 1, 1, 1,
2.783755, 1.332642, 0.6058137, 1, 1, 1, 1, 1,
2.931085, -0.5375873, 2.736417, 1, 1, 1, 1, 1,
2.938751, -1.644093, 1.564155, 1, 1, 1, 1, 1
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
var radius = 9.400366;
var distance = 33.01839;
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
mvMatrix.translate( 0.1585368, -0.1771488, -0.4522405 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01839);
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
