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
-3.744634, 0.5277553, -1.144332, 1, 0, 0, 1,
-3.066401, 1.557405, 0.4579771, 1, 0.007843138, 0, 1,
-2.95633, 0.7037912, -0.3325729, 1, 0.01176471, 0, 1,
-2.774571, -0.2709765, -0.4643215, 1, 0.01960784, 0, 1,
-2.554839, 0.1792551, -1.177293, 1, 0.02352941, 0, 1,
-2.436993, 0.9634436, 0.03179511, 1, 0.03137255, 0, 1,
-2.273359, 0.09637533, -1.553702, 1, 0.03529412, 0, 1,
-2.219403, 1.681503, -1.438595, 1, 0.04313726, 0, 1,
-2.19937, -0.8701659, -2.356548, 1, 0.04705882, 0, 1,
-2.18422, 0.6414297, -1.455207, 1, 0.05490196, 0, 1,
-2.157702, 0.1429504, -1.645584, 1, 0.05882353, 0, 1,
-2.141083, -1.65162, -1.511909, 1, 0.06666667, 0, 1,
-2.110394, -0.1021967, -2.476889, 1, 0.07058824, 0, 1,
-2.0761, 0.8046573, -2.697521, 1, 0.07843138, 0, 1,
-2.074233, 0.4935048, -1.015331, 1, 0.08235294, 0, 1,
-2.047518, -0.5890335, -2.074485, 1, 0.09019608, 0, 1,
-2.022446, -0.008541427, -2.380296, 1, 0.09411765, 0, 1,
-1.922185, 1.383974, -0.8330985, 1, 0.1019608, 0, 1,
-1.911348, -0.172113, -1.679688, 1, 0.1098039, 0, 1,
-1.902291, 2.18638, -0.1163886, 1, 0.1137255, 0, 1,
-1.875549, 0.2725942, 0.1621623, 1, 0.1215686, 0, 1,
-1.839255, -1.248066, -2.465079, 1, 0.1254902, 0, 1,
-1.824448, 0.5791638, -0.234405, 1, 0.1333333, 0, 1,
-1.821378, 0.8793981, 0.2491572, 1, 0.1372549, 0, 1,
-1.801646, 0.3500023, -1.241804, 1, 0.145098, 0, 1,
-1.79484, 0.7294648, -2.373671, 1, 0.1490196, 0, 1,
-1.79392, -0.4585571, -2.427089, 1, 0.1568628, 0, 1,
-1.788522, -0.4290878, -2.194698, 1, 0.1607843, 0, 1,
-1.772162, 0.7920851, 0.8502308, 1, 0.1686275, 0, 1,
-1.763848, -0.9772204, -2.146113, 1, 0.172549, 0, 1,
-1.760186, 1.750485, -1.387233, 1, 0.1803922, 0, 1,
-1.740798, 0.2044596, -2.402035, 1, 0.1843137, 0, 1,
-1.738992, -2.336089, -3.117603, 1, 0.1921569, 0, 1,
-1.714335, 0.9005919, -1.428895, 1, 0.1960784, 0, 1,
-1.705276, -0.2722828, -2.221427, 1, 0.2039216, 0, 1,
-1.70517, 1.36585, -1.088526, 1, 0.2117647, 0, 1,
-1.703452, -1.18033, -3.207954, 1, 0.2156863, 0, 1,
-1.663068, -3.518759, -1.910132, 1, 0.2235294, 0, 1,
-1.661023, -0.1015647, -1.763534, 1, 0.227451, 0, 1,
-1.650359, -0.5403645, -1.899708, 1, 0.2352941, 0, 1,
-1.6268, 0.8511434, 0.8875089, 1, 0.2392157, 0, 1,
-1.625919, 0.4592494, -0.4553449, 1, 0.2470588, 0, 1,
-1.601194, 0.4808837, -0.5433092, 1, 0.2509804, 0, 1,
-1.565858, 0.1528063, 0.4360156, 1, 0.2588235, 0, 1,
-1.56534, 1.403643, -0.9675068, 1, 0.2627451, 0, 1,
-1.560557, 0.9191839, -0.6556504, 1, 0.2705882, 0, 1,
-1.536955, -0.1286623, -2.15124, 1, 0.2745098, 0, 1,
-1.529514, -0.5757539, -2.885026, 1, 0.282353, 0, 1,
-1.518458, 2.058256, 0.8666937, 1, 0.2862745, 0, 1,
-1.512135, 0.9503271, -0.4325827, 1, 0.2941177, 0, 1,
-1.506142, 0.04045685, -1.318326, 1, 0.3019608, 0, 1,
-1.502237, 0.5198473, -1.907197, 1, 0.3058824, 0, 1,
-1.499515, 1.278507, -0.3028085, 1, 0.3137255, 0, 1,
-1.493083, 1.563009, -1.772335, 1, 0.3176471, 0, 1,
-1.478596, -0.004480196, -1.844164, 1, 0.3254902, 0, 1,
-1.47024, -0.3579578, 1.416931, 1, 0.3294118, 0, 1,
-1.467061, -0.4391047, -1.074076, 1, 0.3372549, 0, 1,
-1.466901, -0.9745663, -1.822935, 1, 0.3411765, 0, 1,
-1.465149, -1.632758, -2.406593, 1, 0.3490196, 0, 1,
-1.452257, 0.473924, -2.301449, 1, 0.3529412, 0, 1,
-1.447262, -0.3818304, -4.609767, 1, 0.3607843, 0, 1,
-1.441305, 2.28811, -2.26991, 1, 0.3647059, 0, 1,
-1.427186, -0.3726695, -1.285585, 1, 0.372549, 0, 1,
-1.4189, 1.155261, -0.4896085, 1, 0.3764706, 0, 1,
-1.417429, -1.805774, -3.609705, 1, 0.3843137, 0, 1,
-1.412667, -0.6901374, -1.53331, 1, 0.3882353, 0, 1,
-1.41151, -0.2963431, -2.054966, 1, 0.3960784, 0, 1,
-1.411022, 1.07582, -2.39273, 1, 0.4039216, 0, 1,
-1.390165, -0.2131224, -0.1029525, 1, 0.4078431, 0, 1,
-1.376175, -0.1372214, -1.285903, 1, 0.4156863, 0, 1,
-1.374515, -1.51115, -3.678749, 1, 0.4196078, 0, 1,
-1.373241, -0.9363565, -1.974724, 1, 0.427451, 0, 1,
-1.365479, 0.2626599, -2.792631, 1, 0.4313726, 0, 1,
-1.363134, -1.522018, -2.44224, 1, 0.4392157, 0, 1,
-1.350266, -0.866493, -2.244587, 1, 0.4431373, 0, 1,
-1.34282, 0.5670035, -1.700273, 1, 0.4509804, 0, 1,
-1.326907, 0.5844, -0.8687136, 1, 0.454902, 0, 1,
-1.322755, 1.25538, -1.754357, 1, 0.4627451, 0, 1,
-1.320866, -0.1112117, -1.682957, 1, 0.4666667, 0, 1,
-1.314357, 0.5836055, -0.02175763, 1, 0.4745098, 0, 1,
-1.313502, -0.4089457, -0.5936285, 1, 0.4784314, 0, 1,
-1.30889, 0.8702005, -1.144583, 1, 0.4862745, 0, 1,
-1.308538, -0.3264368, -1.29568, 1, 0.4901961, 0, 1,
-1.30383, -0.7198327, -1.726679, 1, 0.4980392, 0, 1,
-1.274469, -0.8341101, -2.016593, 1, 0.5058824, 0, 1,
-1.274435, -0.2152703, -1.286089, 1, 0.509804, 0, 1,
-1.270814, 0.9613748, -1.82055, 1, 0.5176471, 0, 1,
-1.248211, 0.1118341, -3.268033, 1, 0.5215687, 0, 1,
-1.247337, 1.735323, -1.095586, 1, 0.5294118, 0, 1,
-1.243316, 0.3668404, -0.7540171, 1, 0.5333334, 0, 1,
-1.236315, 0.1555091, -1.103983, 1, 0.5411765, 0, 1,
-1.235336, 1.44589, -2.25785, 1, 0.5450981, 0, 1,
-1.233622, 0.09557366, 0.03537798, 1, 0.5529412, 0, 1,
-1.230818, -2.017861, -3.123016, 1, 0.5568628, 0, 1,
-1.229871, 0.8445542, -1.94089, 1, 0.5647059, 0, 1,
-1.227136, -0.02357218, -2.452036, 1, 0.5686275, 0, 1,
-1.225294, 1.339659, -0.8460683, 1, 0.5764706, 0, 1,
-1.217878, -1.223734, -4.498868, 1, 0.5803922, 0, 1,
-1.216351, -0.5506659, -2.275325, 1, 0.5882353, 0, 1,
-1.213315, -0.7743416, -3.374869, 1, 0.5921569, 0, 1,
-1.208756, -0.8364271, -0.6874364, 1, 0.6, 0, 1,
-1.203208, 0.5917599, -2.324734, 1, 0.6078432, 0, 1,
-1.182262, -0.4647536, -3.291855, 1, 0.6117647, 0, 1,
-1.181274, -1.16948, -2.60536, 1, 0.6196079, 0, 1,
-1.179939, 2.014077, 0.4165627, 1, 0.6235294, 0, 1,
-1.175321, -0.5067652, -3.859367, 1, 0.6313726, 0, 1,
-1.170597, -0.7054504, -0.7832869, 1, 0.6352941, 0, 1,
-1.167519, 0.9703546, -0.3660106, 1, 0.6431373, 0, 1,
-1.165106, 0.3951993, -1.89415, 1, 0.6470588, 0, 1,
-1.163465, -1.058391, -2.552589, 1, 0.654902, 0, 1,
-1.161469, 0.06524124, -3.09982, 1, 0.6588235, 0, 1,
-1.155438, -0.3380899, -2.940549, 1, 0.6666667, 0, 1,
-1.147693, -0.9078685, -2.333578, 1, 0.6705883, 0, 1,
-1.146066, -0.3084575, -1.4843, 1, 0.6784314, 0, 1,
-1.144464, -0.2901989, -1.986834, 1, 0.682353, 0, 1,
-1.142056, -0.6419979, -1.962495, 1, 0.6901961, 0, 1,
-1.138252, 2.127182, -1.045894, 1, 0.6941177, 0, 1,
-1.133383, 1.431842, 0.2192663, 1, 0.7019608, 0, 1,
-1.125769, -0.8420121, -3.841208, 1, 0.7098039, 0, 1,
-1.116834, 0.638561, -0.722941, 1, 0.7137255, 0, 1,
-1.114407, 0.6456193, -2.572065, 1, 0.7215686, 0, 1,
-1.110651, 1.286216, -0.7516232, 1, 0.7254902, 0, 1,
-1.102277, 1.378792, 0.9950421, 1, 0.7333333, 0, 1,
-1.101611, -1.014557, -0.4676799, 1, 0.7372549, 0, 1,
-1.094136, -1.285189, -1.148834, 1, 0.7450981, 0, 1,
-1.092895, -0.2743135, -1.468573, 1, 0.7490196, 0, 1,
-1.091033, 0.3349998, -2.31057, 1, 0.7568628, 0, 1,
-1.086729, -0.9713652, -2.45423, 1, 0.7607843, 0, 1,
-1.085424, -1.596953, -2.091151, 1, 0.7686275, 0, 1,
-1.073224, -0.3961779, -1.210322, 1, 0.772549, 0, 1,
-1.067714, -1.122446, -3.715333, 1, 0.7803922, 0, 1,
-1.067175, 0.3424306, 0.09293013, 1, 0.7843137, 0, 1,
-1.064986, 0.1648623, -2.38659, 1, 0.7921569, 0, 1,
-1.064879, 1.408939, -1.354305, 1, 0.7960784, 0, 1,
-1.063813, 0.8333775, 0.1830196, 1, 0.8039216, 0, 1,
-1.05796, 0.2471458, -1.726436, 1, 0.8117647, 0, 1,
-1.057212, 0.4331728, -1.676303, 1, 0.8156863, 0, 1,
-1.051501, -1.574862, -3.126955, 1, 0.8235294, 0, 1,
-1.051314, 1.282059, -0.1932493, 1, 0.827451, 0, 1,
-1.04786, -1.509004, -1.99029, 1, 0.8352941, 0, 1,
-1.022092, -0.2909447, -0.9671571, 1, 0.8392157, 0, 1,
-1.016575, -0.8730313, -2.650096, 1, 0.8470588, 0, 1,
-1.012449, -0.9679299, -2.656319, 1, 0.8509804, 0, 1,
-1.011797, 0.1471456, -2.8035, 1, 0.8588235, 0, 1,
-1.004555, -0.9261587, -1.721095, 1, 0.8627451, 0, 1,
-1.003499, -1.462019, -2.485308, 1, 0.8705882, 0, 1,
-1.003286, -0.3284182, -0.9576056, 1, 0.8745098, 0, 1,
-0.990469, -0.8522015, -3.593178, 1, 0.8823529, 0, 1,
-0.986854, 0.5272589, -1.303137, 1, 0.8862745, 0, 1,
-0.9830166, 0.2775346, -1.160732, 1, 0.8941177, 0, 1,
-0.9813572, -0.2609551, 0.07047386, 1, 0.8980392, 0, 1,
-0.9768429, -0.6592274, -1.106143, 1, 0.9058824, 0, 1,
-0.9766646, -0.08015037, -2.330913, 1, 0.9137255, 0, 1,
-0.9701183, -1.100521, -4.494114, 1, 0.9176471, 0, 1,
-0.9643596, 0.7412315, -1.308593, 1, 0.9254902, 0, 1,
-0.9541246, -1.069366, -4.354969, 1, 0.9294118, 0, 1,
-0.9529799, 1.152832, -2.145687, 1, 0.9372549, 0, 1,
-0.9521208, -0.5999963, -1.173691, 1, 0.9411765, 0, 1,
-0.9520415, 0.1360237, -0.7377302, 1, 0.9490196, 0, 1,
-0.9470119, -0.999193, -2.186131, 1, 0.9529412, 0, 1,
-0.942687, 0.01269522, -1.983758, 1, 0.9607843, 0, 1,
-0.939541, -0.256289, -2.748937, 1, 0.9647059, 0, 1,
-0.9362318, 0.1675092, 0.5744315, 1, 0.972549, 0, 1,
-0.9354454, -0.01615877, -1.85594, 1, 0.9764706, 0, 1,
-0.935425, -0.4417294, -1.214523, 1, 0.9843137, 0, 1,
-0.9338115, 0.4454467, -0.3004613, 1, 0.9882353, 0, 1,
-0.9333698, -1.185129, -1.814811, 1, 0.9960784, 0, 1,
-0.9326274, -1.176134, -0.7775555, 0.9960784, 1, 0, 1,
-0.9222223, 0.4402821, -1.130517, 0.9921569, 1, 0, 1,
-0.9170538, 0.6700847, -1.718719, 0.9843137, 1, 0, 1,
-0.9169471, 0.8955396, -0.8181529, 0.9803922, 1, 0, 1,
-0.9107262, -0.08475103, -0.3026872, 0.972549, 1, 0, 1,
-0.9043083, -2.75076, -2.290596, 0.9686275, 1, 0, 1,
-0.9030362, -0.8029839, -0.7635722, 0.9607843, 1, 0, 1,
-0.8943685, 0.1652225, -2.275605, 0.9568627, 1, 0, 1,
-0.8918036, 2.119588, 2.295115, 0.9490196, 1, 0, 1,
-0.890972, 1.842517, -0.5192093, 0.945098, 1, 0, 1,
-0.8902828, -2.289633, -3.399327, 0.9372549, 1, 0, 1,
-0.8856257, -0.997802, -2.55282, 0.9333333, 1, 0, 1,
-0.8851177, 0.1289516, -2.027409, 0.9254902, 1, 0, 1,
-0.8834192, -1.530464, -1.603831, 0.9215686, 1, 0, 1,
-0.8786956, -1.490409, -1.482505, 0.9137255, 1, 0, 1,
-0.8771448, -1.266538, -2.190066, 0.9098039, 1, 0, 1,
-0.8697961, -1.543363, -2.075383, 0.9019608, 1, 0, 1,
-0.8656527, -1.260139, -1.308885, 0.8941177, 1, 0, 1,
-0.8641153, 1.244242, -0.003241569, 0.8901961, 1, 0, 1,
-0.8601787, -1.828154, -2.903032, 0.8823529, 1, 0, 1,
-0.8525086, 1.036699, 0.3252121, 0.8784314, 1, 0, 1,
-0.851971, -0.6195093, -2.091784, 0.8705882, 1, 0, 1,
-0.8501576, -0.3321427, -1.816695, 0.8666667, 1, 0, 1,
-0.8460821, 0.3850362, -1.545154, 0.8588235, 1, 0, 1,
-0.8411093, 0.4939465, 0.6590561, 0.854902, 1, 0, 1,
-0.8381081, 0.328875, -1.288994, 0.8470588, 1, 0, 1,
-0.8369241, -0.4494898, -2.52379, 0.8431373, 1, 0, 1,
-0.8346636, 0.2781455, 0.2676184, 0.8352941, 1, 0, 1,
-0.8291859, 0.6073313, -1.859558, 0.8313726, 1, 0, 1,
-0.8235351, -1.019386, -2.090808, 0.8235294, 1, 0, 1,
-0.8175039, 0.6715706, 0.4309391, 0.8196079, 1, 0, 1,
-0.817212, 1.494166, -1.42099, 0.8117647, 1, 0, 1,
-0.8163606, 0.6739199, 0.1152028, 0.8078431, 1, 0, 1,
-0.8144802, -0.09616183, -1.235322, 0.8, 1, 0, 1,
-0.8111328, 0.9011688, -1.436507, 0.7921569, 1, 0, 1,
-0.8106537, 0.1271866, -1.452085, 0.7882353, 1, 0, 1,
-0.8051855, 3.028302, -1.435362, 0.7803922, 1, 0, 1,
-0.804802, 0.6762479, -1.99941, 0.7764706, 1, 0, 1,
-0.801553, -0.3781295, -2.434825, 0.7686275, 1, 0, 1,
-0.8012186, -0.1196387, -2.859631, 0.7647059, 1, 0, 1,
-0.8008204, 0.2732563, -0.7343504, 0.7568628, 1, 0, 1,
-0.7983525, -0.7182232, -0.6517047, 0.7529412, 1, 0, 1,
-0.7978742, -0.8500776, -2.029629, 0.7450981, 1, 0, 1,
-0.7936775, 0.5227911, -0.6283807, 0.7411765, 1, 0, 1,
-0.7875485, 0.5594429, -2.383435, 0.7333333, 1, 0, 1,
-0.7826958, 2.717426, 1.167063, 0.7294118, 1, 0, 1,
-0.7800359, -1.346872, -2.265105, 0.7215686, 1, 0, 1,
-0.7773185, -0.9431249, -2.903612, 0.7176471, 1, 0, 1,
-0.7765957, -1.085318, -2.117932, 0.7098039, 1, 0, 1,
-0.7703898, -0.1981343, -2.074605, 0.7058824, 1, 0, 1,
-0.7667135, 2.711123, -1.707787, 0.6980392, 1, 0, 1,
-0.7557111, 0.1821091, -3.457691, 0.6901961, 1, 0, 1,
-0.753282, 1.560249, -0.24643, 0.6862745, 1, 0, 1,
-0.7521797, -1.865615, -1.736065, 0.6784314, 1, 0, 1,
-0.7507061, 0.208, -1.124334, 0.6745098, 1, 0, 1,
-0.7504206, 1.65455, -0.2191057, 0.6666667, 1, 0, 1,
-0.7494089, 0.5638082, -0.5267231, 0.6627451, 1, 0, 1,
-0.7484837, 1.775504, -1.386688, 0.654902, 1, 0, 1,
-0.7444143, -2.310383, -3.547278, 0.6509804, 1, 0, 1,
-0.7404229, 0.6418963, -1.337993, 0.6431373, 1, 0, 1,
-0.7378998, 0.5750433, -0.2281907, 0.6392157, 1, 0, 1,
-0.7349511, -0.9200971, -3.038019, 0.6313726, 1, 0, 1,
-0.7314579, -0.9371122, -3.455782, 0.627451, 1, 0, 1,
-0.7278167, 0.09885777, -0.5564949, 0.6196079, 1, 0, 1,
-0.707342, -0.787393, -2.709422, 0.6156863, 1, 0, 1,
-0.7072329, -1.774031, -3.039813, 0.6078432, 1, 0, 1,
-0.7047522, 1.47716, -0.8935343, 0.6039216, 1, 0, 1,
-0.7011187, 0.8029935, -0.6169516, 0.5960785, 1, 0, 1,
-0.693521, 1.209069, -1.686082, 0.5882353, 1, 0, 1,
-0.6928183, 0.01970159, -3.189703, 0.5843138, 1, 0, 1,
-0.692542, 0.08244762, 0.1156918, 0.5764706, 1, 0, 1,
-0.690127, 0.9911774, -0.5759878, 0.572549, 1, 0, 1,
-0.6894705, -0.9168765, -2.164099, 0.5647059, 1, 0, 1,
-0.6856354, -0.4375422, -1.924142, 0.5607843, 1, 0, 1,
-0.685513, -0.5457845, -1.729229, 0.5529412, 1, 0, 1,
-0.6852664, 1.170346, -1.550918, 0.5490196, 1, 0, 1,
-0.6820714, 0.7519455, -0.6010137, 0.5411765, 1, 0, 1,
-0.6764746, 1.826119, -1.121692, 0.5372549, 1, 0, 1,
-0.6761379, -0.5267264, -2.232475, 0.5294118, 1, 0, 1,
-0.6744887, -0.8669338, -2.965539, 0.5254902, 1, 0, 1,
-0.6725022, 1.229917, -0.4363596, 0.5176471, 1, 0, 1,
-0.6695305, 0.03555002, -2.597725, 0.5137255, 1, 0, 1,
-0.6694649, -0.7736487, -2.063832, 0.5058824, 1, 0, 1,
-0.662643, -0.9239779, -1.876308, 0.5019608, 1, 0, 1,
-0.6611781, 2.27659, -0.6327029, 0.4941176, 1, 0, 1,
-0.6575664, -0.7808278, -4.11745, 0.4862745, 1, 0, 1,
-0.6567267, 1.50475, -0.1068234, 0.4823529, 1, 0, 1,
-0.652896, 0.6103379, -0.7010819, 0.4745098, 1, 0, 1,
-0.6512815, 1.589538, 0.2984436, 0.4705882, 1, 0, 1,
-0.6480436, 1.199448, -1.994879, 0.4627451, 1, 0, 1,
-0.6428761, -0.5862969, -0.7425205, 0.4588235, 1, 0, 1,
-0.6426771, -0.4464866, -1.324029, 0.4509804, 1, 0, 1,
-0.6370116, -0.6548121, -2.48933, 0.4470588, 1, 0, 1,
-0.6363123, -1.288778, -2.517209, 0.4392157, 1, 0, 1,
-0.635841, -0.03742181, -2.204286, 0.4352941, 1, 0, 1,
-0.6330987, -0.4457672, -2.024049, 0.427451, 1, 0, 1,
-0.6329621, -1.23675, -3.433556, 0.4235294, 1, 0, 1,
-0.6295275, -0.2046216, -2.99666, 0.4156863, 1, 0, 1,
-0.6087583, 1.903779, 1.11772, 0.4117647, 1, 0, 1,
-0.6056464, -0.7376951, -1.657155, 0.4039216, 1, 0, 1,
-0.6036683, -1.574504, -2.314681, 0.3960784, 1, 0, 1,
-0.5948521, -1.404325, -2.175125, 0.3921569, 1, 0, 1,
-0.5943286, 0.4959536, 0.5482225, 0.3843137, 1, 0, 1,
-0.5906503, -0.7337128, -1.002966, 0.3803922, 1, 0, 1,
-0.5887699, -0.1564816, -1.179443, 0.372549, 1, 0, 1,
-0.5876269, 0.7790997, -3.25004, 0.3686275, 1, 0, 1,
-0.5783678, 0.2164508, -1.717458, 0.3607843, 1, 0, 1,
-0.5736244, -0.8650278, -1.914995, 0.3568628, 1, 0, 1,
-0.5687197, 1.600204, -0.2652321, 0.3490196, 1, 0, 1,
-0.5682297, -1.393211, -3.77396, 0.345098, 1, 0, 1,
-0.5648339, 1.143352, -0.05729719, 0.3372549, 1, 0, 1,
-0.561867, 0.4330054, -1.290712, 0.3333333, 1, 0, 1,
-0.5588381, -1.307966, -4.216997, 0.3254902, 1, 0, 1,
-0.5573104, -1.312823, -4.108385, 0.3215686, 1, 0, 1,
-0.5567539, 1.360122, 0.497002, 0.3137255, 1, 0, 1,
-0.5553787, -1.738683, -2.966601, 0.3098039, 1, 0, 1,
-0.5463728, -1.456389, -2.410383, 0.3019608, 1, 0, 1,
-0.5446087, -0.5442551, -3.217751, 0.2941177, 1, 0, 1,
-0.5446069, -0.2425476, -2.067248, 0.2901961, 1, 0, 1,
-0.5433918, -1.332071, -1.516159, 0.282353, 1, 0, 1,
-0.5385065, -0.6467587, -3.063063, 0.2784314, 1, 0, 1,
-0.53835, 1.640958, 0.9269787, 0.2705882, 1, 0, 1,
-0.5338718, 0.5177081, -0.5840475, 0.2666667, 1, 0, 1,
-0.5315602, 1.066161, -0.4798296, 0.2588235, 1, 0, 1,
-0.5301102, 0.6102713, 0.02141711, 0.254902, 1, 0, 1,
-0.5299128, 0.4661916, -1.591261, 0.2470588, 1, 0, 1,
-0.5289211, 1.693849, -2.14373, 0.2431373, 1, 0, 1,
-0.5281464, 0.7494316, -1.483384, 0.2352941, 1, 0, 1,
-0.5209702, 0.9352444, 1.045575, 0.2313726, 1, 0, 1,
-0.5170331, 1.372736, -0.369987, 0.2235294, 1, 0, 1,
-0.5157054, 0.8942484, -1.166788, 0.2196078, 1, 0, 1,
-0.5138201, 0.9368575, 1.587013, 0.2117647, 1, 0, 1,
-0.511295, -0.3877554, -2.036148, 0.2078431, 1, 0, 1,
-0.5052218, -1.792713, -2.034444, 0.2, 1, 0, 1,
-0.5035145, -0.3204125, -2.104448, 0.1921569, 1, 0, 1,
-0.5013697, 2.82165, 1.157021, 0.1882353, 1, 0, 1,
-0.4972954, -0.6478606, -2.428242, 0.1803922, 1, 0, 1,
-0.4966982, -2.173428, -3.123008, 0.1764706, 1, 0, 1,
-0.4943508, -1.356861, -2.821162, 0.1686275, 1, 0, 1,
-0.4935696, -0.9491299, -3.291236, 0.1647059, 1, 0, 1,
-0.4922045, 3.598376, -0.4222665, 0.1568628, 1, 0, 1,
-0.4917244, 0.4125318, -2.758359, 0.1529412, 1, 0, 1,
-0.4900255, 1.575475, -0.4413208, 0.145098, 1, 0, 1,
-0.4822513, -0.1121155, -0.8933377, 0.1411765, 1, 0, 1,
-0.4780343, -0.3026775, -2.003217, 0.1333333, 1, 0, 1,
-0.4767346, -0.6829034, -2.671971, 0.1294118, 1, 0, 1,
-0.4761367, 0.3566075, 0.2951366, 0.1215686, 1, 0, 1,
-0.4728545, -0.6593834, -1.929757, 0.1176471, 1, 0, 1,
-0.4716126, -0.7088854, -3.943758, 0.1098039, 1, 0, 1,
-0.466187, -0.05960033, -1.926106, 0.1058824, 1, 0, 1,
-0.4652774, -2.800217, -3.87648, 0.09803922, 1, 0, 1,
-0.4637327, -0.2523215, -1.728895, 0.09019608, 1, 0, 1,
-0.4524089, -0.990335, -2.136701, 0.08627451, 1, 0, 1,
-0.4470052, 1.128514, -0.1622957, 0.07843138, 1, 0, 1,
-0.4461846, -1.528446, -2.809737, 0.07450981, 1, 0, 1,
-0.4444332, 0.356439, -0.563731, 0.06666667, 1, 0, 1,
-0.4422214, 0.1324299, -1.195402, 0.0627451, 1, 0, 1,
-0.4390848, -1.416786, -2.263831, 0.05490196, 1, 0, 1,
-0.4349889, 0.276056, -1.280671, 0.05098039, 1, 0, 1,
-0.4330679, 0.01751773, -2.30764, 0.04313726, 1, 0, 1,
-0.4310738, -0.4760273, -2.047778, 0.03921569, 1, 0, 1,
-0.4300587, -0.5284356, -2.253353, 0.03137255, 1, 0, 1,
-0.4295583, -1.309075, -1.912981, 0.02745098, 1, 0, 1,
-0.4237238, 0.04080333, -2.121558, 0.01960784, 1, 0, 1,
-0.4178869, -0.6943968, -3.250584, 0.01568628, 1, 0, 1,
-0.4176417, 0.2513307, -3.595803, 0.007843138, 1, 0, 1,
-0.4095576, -0.9694186, -1.887404, 0.003921569, 1, 0, 1,
-0.4089787, 0.1967909, -1.676088, 0, 1, 0.003921569, 1,
-0.406012, 0.2615716, -1.617649, 0, 1, 0.01176471, 1,
-0.4027204, 1.003333, 1.053589, 0, 1, 0.01568628, 1,
-0.4002657, 1.893938, -0.809222, 0, 1, 0.02352941, 1,
-0.3991632, 0.8568956, 0.5638359, 0, 1, 0.02745098, 1,
-0.3989234, 0.2926787, -1.435918, 0, 1, 0.03529412, 1,
-0.3970297, 0.3364955, -1.074587, 0, 1, 0.03921569, 1,
-0.3967384, 0.7393578, 0.633688, 0, 1, 0.04705882, 1,
-0.3912283, 0.683208, -0.2634789, 0, 1, 0.05098039, 1,
-0.3885469, 0.5015999, -1.018537, 0, 1, 0.05882353, 1,
-0.384457, 0.6391256, -1.464335, 0, 1, 0.0627451, 1,
-0.3812274, 0.5090941, 0.3153986, 0, 1, 0.07058824, 1,
-0.3801337, 0.2194528, -1.974052, 0, 1, 0.07450981, 1,
-0.3753997, -0.1229701, -2.397778, 0, 1, 0.08235294, 1,
-0.3724579, 0.590861, -0.1019163, 0, 1, 0.08627451, 1,
-0.3717384, 1.083318, 1.533414, 0, 1, 0.09411765, 1,
-0.3650104, 1.733224, 0.02528267, 0, 1, 0.1019608, 1,
-0.361, -0.4550062, -3.774782, 0, 1, 0.1058824, 1,
-0.3609057, -1.394271, -3.672778, 0, 1, 0.1137255, 1,
-0.3578384, -1.320067, -4.053017, 0, 1, 0.1176471, 1,
-0.3565543, -1.816005, -2.707001, 0, 1, 0.1254902, 1,
-0.3543612, -0.3672656, -1.081163, 0, 1, 0.1294118, 1,
-0.3513008, -0.3531201, -2.391649, 0, 1, 0.1372549, 1,
-0.3485285, -1.496027, -2.050469, 0, 1, 0.1411765, 1,
-0.3464617, -1.275271, -2.721275, 0, 1, 0.1490196, 1,
-0.3405474, -0.07182746, -2.170386, 0, 1, 0.1529412, 1,
-0.3396177, 0.04146773, -0.5240979, 0, 1, 0.1607843, 1,
-0.3335251, -1.07739, -2.686501, 0, 1, 0.1647059, 1,
-0.3322801, 1.412415, 0.1094039, 0, 1, 0.172549, 1,
-0.331469, 0.1770498, -0.6328148, 0, 1, 0.1764706, 1,
-0.3294928, -0.5998415, -1.268641, 0, 1, 0.1843137, 1,
-0.3294328, -0.8507589, -1.319759, 0, 1, 0.1882353, 1,
-0.3251638, -0.9571938, -2.979533, 0, 1, 0.1960784, 1,
-0.322114, 0.05609172, -2.495642, 0, 1, 0.2039216, 1,
-0.3207844, -1.457661, -1.093534, 0, 1, 0.2078431, 1,
-0.3201683, 0.2779659, -1.070477, 0, 1, 0.2156863, 1,
-0.3133674, 0.8662143, -2.550459, 0, 1, 0.2196078, 1,
-0.3130789, -0.7340654, -3.714429, 0, 1, 0.227451, 1,
-0.3091265, -0.4834399, -1.680928, 0, 1, 0.2313726, 1,
-0.3047819, 0.0117875, -2.149966, 0, 1, 0.2392157, 1,
-0.3043367, 0.3488182, -1.214245, 0, 1, 0.2431373, 1,
-0.2983695, 6.830662e-05, -2.118592, 0, 1, 0.2509804, 1,
-0.2972676, 0.03900803, -1.098748, 0, 1, 0.254902, 1,
-0.2891292, -0.4749806, -4.798446, 0, 1, 0.2627451, 1,
-0.2885416, -0.2314641, -3.865696, 0, 1, 0.2666667, 1,
-0.285178, 0.07228977, 0.2461455, 0, 1, 0.2745098, 1,
-0.2832131, 0.452202, -0.3521037, 0, 1, 0.2784314, 1,
-0.2806116, 0.0142906, -1.406434, 0, 1, 0.2862745, 1,
-0.2732644, -0.09047352, -2.634502, 0, 1, 0.2901961, 1,
-0.2714084, 0.3564189, -0.9743573, 0, 1, 0.2980392, 1,
-0.2665971, 0.9747284, 0.6849496, 0, 1, 0.3058824, 1,
-0.2651008, -1.881848, -2.747714, 0, 1, 0.3098039, 1,
-0.2635081, 0.5991328, -1.382921, 0, 1, 0.3176471, 1,
-0.2578047, -1.653287, -2.979, 0, 1, 0.3215686, 1,
-0.2573307, 0.9115176, 0.158479, 0, 1, 0.3294118, 1,
-0.2569869, 1.235564, -1.082457, 0, 1, 0.3333333, 1,
-0.2554089, -1.991385, -1.306106, 0, 1, 0.3411765, 1,
-0.255111, -0.737663, -4.78938, 0, 1, 0.345098, 1,
-0.2538872, 0.2281297, 0.02394134, 0, 1, 0.3529412, 1,
-0.2531598, -0.8724036, -4.583454, 0, 1, 0.3568628, 1,
-0.2521545, -1.271433, -4.270249, 0, 1, 0.3647059, 1,
-0.2512733, -0.4151114, -1.472226, 0, 1, 0.3686275, 1,
-0.2472058, 0.1779609, 0.7662916, 0, 1, 0.3764706, 1,
-0.2468795, 0.1383785, -1.093446, 0, 1, 0.3803922, 1,
-0.2468015, -1.998232, -5.09048, 0, 1, 0.3882353, 1,
-0.2461764, 0.7315568, 0.7057305, 0, 1, 0.3921569, 1,
-0.24541, 0.8998768, -0.01629271, 0, 1, 0.4, 1,
-0.2444259, -1.616346, -2.5818, 0, 1, 0.4078431, 1,
-0.2401619, -1.03779, -3.793666, 0, 1, 0.4117647, 1,
-0.2393213, -0.2547541, -3.331777, 0, 1, 0.4196078, 1,
-0.2338031, 0.4323319, -1.896337, 0, 1, 0.4235294, 1,
-0.233694, 0.1179228, -0.5011078, 0, 1, 0.4313726, 1,
-0.2313479, -0.1447497, -3.625939, 0, 1, 0.4352941, 1,
-0.2303937, 0.594752, 0.02204708, 0, 1, 0.4431373, 1,
-0.227379, -0.1692932, -2.345125, 0, 1, 0.4470588, 1,
-0.2256341, -0.4881462, -2.107827, 0, 1, 0.454902, 1,
-0.2252213, 0.5601258, 0.1729963, 0, 1, 0.4588235, 1,
-0.2244793, 0.2543441, -0.6205739, 0, 1, 0.4666667, 1,
-0.2234944, -0.3262684, -2.736873, 0, 1, 0.4705882, 1,
-0.2232853, -2.000461, -3.416736, 0, 1, 0.4784314, 1,
-0.221531, 0.2435929, -0.4572705, 0, 1, 0.4823529, 1,
-0.2206367, 0.009445167, -2.430892, 0, 1, 0.4901961, 1,
-0.2192989, -0.683359, -2.231976, 0, 1, 0.4941176, 1,
-0.2184727, 0.102417, -1.030429, 0, 1, 0.5019608, 1,
-0.2181716, 0.05232549, -1.798309, 0, 1, 0.509804, 1,
-0.2149975, -0.9305242, -2.290527, 0, 1, 0.5137255, 1,
-0.2115597, 0.6192665, -0.8697702, 0, 1, 0.5215687, 1,
-0.2113669, 0.8448895, -0.05240387, 0, 1, 0.5254902, 1,
-0.2073574, -1.540683, -3.554452, 0, 1, 0.5333334, 1,
-0.2048811, -1.116514, -2.637314, 0, 1, 0.5372549, 1,
-0.2043988, 0.6029915, -1.775977, 0, 1, 0.5450981, 1,
-0.1980819, 0.1220974, 0.1945793, 0, 1, 0.5490196, 1,
-0.1926859, -1.562375, -2.396348, 0, 1, 0.5568628, 1,
-0.1901411, -0.352176, -2.780978, 0, 1, 0.5607843, 1,
-0.1899118, 0.6530079, -0.4459218, 0, 1, 0.5686275, 1,
-0.1862114, -0.279151, -2.991412, 0, 1, 0.572549, 1,
-0.1835388, 1.488779, 1.276132, 0, 1, 0.5803922, 1,
-0.1812258, 0.05780076, -1.71559, 0, 1, 0.5843138, 1,
-0.1688677, -0.3595169, -3.869813, 0, 1, 0.5921569, 1,
-0.1598525, -0.5150279, -2.490587, 0, 1, 0.5960785, 1,
-0.153518, -1.255725, -3.349934, 0, 1, 0.6039216, 1,
-0.1523316, 0.2166019, 0.4589621, 0, 1, 0.6117647, 1,
-0.1513916, 0.7467728, 1.835983, 0, 1, 0.6156863, 1,
-0.1498889, 0.2806487, 0.6137317, 0, 1, 0.6235294, 1,
-0.1461502, 0.348488, 0.294002, 0, 1, 0.627451, 1,
-0.1439298, -0.5933404, -4.776329, 0, 1, 0.6352941, 1,
-0.1412376, 1.536741, -1.54509, 0, 1, 0.6392157, 1,
-0.1406668, 0.6841232, -1.207744, 0, 1, 0.6470588, 1,
-0.1323816, -0.06367654, -2.625054, 0, 1, 0.6509804, 1,
-0.1305163, -0.7966219, -5.160913, 0, 1, 0.6588235, 1,
-0.1281371, -1.405696, -3.31812, 0, 1, 0.6627451, 1,
-0.1249924, -1.141176, -3.073937, 0, 1, 0.6705883, 1,
-0.1247873, -0.6471791, -2.274155, 0, 1, 0.6745098, 1,
-0.1245578, -1.1733, -3.869493, 0, 1, 0.682353, 1,
-0.121523, 0.5026751, 0.7412143, 0, 1, 0.6862745, 1,
-0.1109228, -1.555211, -3.957349, 0, 1, 0.6941177, 1,
-0.1108432, -0.4122099, -0.6715364, 0, 1, 0.7019608, 1,
-0.1071059, -0.5733339, -2.524983, 0, 1, 0.7058824, 1,
-0.102025, 0.646758, -1.409527, 0, 1, 0.7137255, 1,
-0.09781174, -1.020827, -1.924144, 0, 1, 0.7176471, 1,
-0.09762072, -0.6108116, -2.211534, 0, 1, 0.7254902, 1,
-0.09715074, 0.244765, -1.064023, 0, 1, 0.7294118, 1,
-0.09607458, 0.8343582, -2.498974, 0, 1, 0.7372549, 1,
-0.09314726, -1.117644, -3.376102, 0, 1, 0.7411765, 1,
-0.09036084, 1.309185, -0.5681685, 0, 1, 0.7490196, 1,
-0.08850309, -0.6465371, -4.169278, 0, 1, 0.7529412, 1,
-0.08597137, -2.060506, -2.834137, 0, 1, 0.7607843, 1,
-0.08357946, -0.9492255, -3.023572, 0, 1, 0.7647059, 1,
-0.0834772, -0.1880431, -3.111181, 0, 1, 0.772549, 1,
-0.08246762, 0.4556988, 1.809063, 0, 1, 0.7764706, 1,
-0.08068994, -0.4351952, -2.282077, 0, 1, 0.7843137, 1,
-0.07730177, -0.9600037, -3.18082, 0, 1, 0.7882353, 1,
-0.07394911, 1.355213, -0.21283, 0, 1, 0.7960784, 1,
-0.0722575, 1.386907, -1.898148, 0, 1, 0.8039216, 1,
-0.07117472, -1.711383, -3.3415, 0, 1, 0.8078431, 1,
-0.06909855, 0.3355284, 1.713798, 0, 1, 0.8156863, 1,
-0.06859407, -0.8997778, -3.620156, 0, 1, 0.8196079, 1,
-0.06471596, -0.442434, -5.270543, 0, 1, 0.827451, 1,
-0.06453235, -1.121128, -2.887822, 0, 1, 0.8313726, 1,
-0.06334992, 0.537007, -0.06654207, 0, 1, 0.8392157, 1,
-0.06223807, -2.015321, -3.342711, 0, 1, 0.8431373, 1,
-0.05188746, 0.4371389, -0.3630032, 0, 1, 0.8509804, 1,
-0.05062652, -0.1386738, -2.246977, 0, 1, 0.854902, 1,
-0.04743243, 0.05495048, -1.078187, 0, 1, 0.8627451, 1,
-0.04688852, -1.605905, -1.39855, 0, 1, 0.8666667, 1,
-0.04499333, 0.1039731, -0.1296012, 0, 1, 0.8745098, 1,
-0.03949669, 0.5110543, -0.5730599, 0, 1, 0.8784314, 1,
-0.03674133, 1.269466, -0.2489223, 0, 1, 0.8862745, 1,
-0.03543679, 0.9800878, 0.6889482, 0, 1, 0.8901961, 1,
-0.03292566, -0.2054473, -1.97854, 0, 1, 0.8980392, 1,
-0.0284228, -0.4780025, -4.400773, 0, 1, 0.9058824, 1,
-0.02792997, 0.2177432, -0.6545456, 0, 1, 0.9098039, 1,
-0.0263027, 2.342016, -1.406938, 0, 1, 0.9176471, 1,
-0.02627207, 0.6324769, 1.730627, 0, 1, 0.9215686, 1,
-0.02077696, -2.02381, -2.240684, 0, 1, 0.9294118, 1,
-0.02003025, 0.109395, -0.0286573, 0, 1, 0.9333333, 1,
-0.01958391, 0.05684644, -1.695834, 0, 1, 0.9411765, 1,
-0.01884024, 0.02160469, 0.2641585, 0, 1, 0.945098, 1,
-0.016796, 0.2024809, -0.5961578, 0, 1, 0.9529412, 1,
-0.01500849, -0.3060226, -2.853277, 0, 1, 0.9568627, 1,
-0.007497872, 0.2563019, 0.6537911, 0, 1, 0.9647059, 1,
-0.007259189, -0.6566566, -2.940626, 0, 1, 0.9686275, 1,
-0.003431829, 0.5593415, -0.583461, 0, 1, 0.9764706, 1,
-0.003199049, -0.5111277, -1.932444, 0, 1, 0.9803922, 1,
-0.001531544, -0.8244168, -2.920269, 0, 1, 0.9882353, 1,
-0.0009322282, -1.040047, -4.310138, 0, 1, 0.9921569, 1,
0.001422344, -1.040405, 3.268639, 0, 1, 1, 1,
0.002040035, -0.6687416, 4.056551, 0, 0.9921569, 1, 1,
0.002469182, 0.1541801, 1.069858, 0, 0.9882353, 1, 1,
0.00285233, -0.5027142, 2.98008, 0, 0.9803922, 1, 1,
0.003266591, -0.4138767, 1.472808, 0, 0.9764706, 1, 1,
0.01122607, 0.8989005, -0.3563994, 0, 0.9686275, 1, 1,
0.01197105, 1.205279, -0.4820483, 0, 0.9647059, 1, 1,
0.01955587, 0.2058445, 0.07202575, 0, 0.9568627, 1, 1,
0.02036409, 0.3778872, 1.436175, 0, 0.9529412, 1, 1,
0.02111763, -1.791389, 2.957479, 0, 0.945098, 1, 1,
0.02462257, 1.224625, -0.1512243, 0, 0.9411765, 1, 1,
0.0278755, -0.2319092, 2.64868, 0, 0.9333333, 1, 1,
0.02888649, 1.503074, -0.5658941, 0, 0.9294118, 1, 1,
0.03155454, 0.02798565, 0.7687187, 0, 0.9215686, 1, 1,
0.03382175, 1.300026, -0.6106107, 0, 0.9176471, 1, 1,
0.03912271, 1.054668, -0.793605, 0, 0.9098039, 1, 1,
0.03983481, -0.05461572, 0.9328675, 0, 0.9058824, 1, 1,
0.04113117, 0.4791993, -0.7830477, 0, 0.8980392, 1, 1,
0.04404002, -0.7278454, 3.101639, 0, 0.8901961, 1, 1,
0.04407484, -2.160429, 0.9600205, 0, 0.8862745, 1, 1,
0.04527523, 1.084488, 0.1811707, 0, 0.8784314, 1, 1,
0.04710152, 0.7260627, 0.6332726, 0, 0.8745098, 1, 1,
0.04756968, -0.4827794, 4.17838, 0, 0.8666667, 1, 1,
0.05367161, 0.1385331, 0.4198824, 0, 0.8627451, 1, 1,
0.06080784, -0.3690439, 5.14244, 0, 0.854902, 1, 1,
0.0703232, -0.6255798, 2.430554, 0, 0.8509804, 1, 1,
0.07129102, -0.179925, 4.5419, 0, 0.8431373, 1, 1,
0.07670198, 1.171047, -0.3114808, 0, 0.8392157, 1, 1,
0.07949023, -0.7513453, 2.153162, 0, 0.8313726, 1, 1,
0.07981084, 1.263343, -0.7292477, 0, 0.827451, 1, 1,
0.08029059, -0.1601211, 2.516773, 0, 0.8196079, 1, 1,
0.08317767, 1.016601, 0.4755259, 0, 0.8156863, 1, 1,
0.08457071, 0.05438685, 2.437631, 0, 0.8078431, 1, 1,
0.08597908, 1.508941, 1.560572, 0, 0.8039216, 1, 1,
0.08812632, -2.431363, 3.229462, 0, 0.7960784, 1, 1,
0.08858596, 0.5986584, 0.1070364, 0, 0.7882353, 1, 1,
0.09592804, -1.333624, 3.354701, 0, 0.7843137, 1, 1,
0.09683978, 0.4534171, 0.8125076, 0, 0.7764706, 1, 1,
0.09820721, -0.3788213, 2.804441, 0, 0.772549, 1, 1,
0.0992434, -0.002152248, 2.194901, 0, 0.7647059, 1, 1,
0.09970346, -0.5018442, 3.241127, 0, 0.7607843, 1, 1,
0.1014275, 0.6408076, 0.8485969, 0, 0.7529412, 1, 1,
0.1038394, -0.7161903, 2.586063, 0, 0.7490196, 1, 1,
0.1060249, -1.51659, 3.744515, 0, 0.7411765, 1, 1,
0.1105932, -0.05431356, 2.258645, 0, 0.7372549, 1, 1,
0.1122581, -0.8846169, 4.004243, 0, 0.7294118, 1, 1,
0.112448, -0.9458504, 3.119155, 0, 0.7254902, 1, 1,
0.1146756, 1.923261, 0.374137, 0, 0.7176471, 1, 1,
0.1180062, 1.263535, 0.7567136, 0, 0.7137255, 1, 1,
0.120756, -1.562394, 1.851608, 0, 0.7058824, 1, 1,
0.123837, -0.7982839, 2.799647, 0, 0.6980392, 1, 1,
0.1321227, -0.944364, 1.803745, 0, 0.6941177, 1, 1,
0.1406032, -0.03544252, 2.5017, 0, 0.6862745, 1, 1,
0.1406619, 0.06929868, 1.251767, 0, 0.682353, 1, 1,
0.1411354, 0.471585, 0.6460097, 0, 0.6745098, 1, 1,
0.1416203, -0.775396, 4.000284, 0, 0.6705883, 1, 1,
0.143006, 0.8042368, -0.6276434, 0, 0.6627451, 1, 1,
0.1436762, -0.2598543, 1.642436, 0, 0.6588235, 1, 1,
0.1443687, -1.561761, 3.314956, 0, 0.6509804, 1, 1,
0.1475447, 2.030147, 0.3382835, 0, 0.6470588, 1, 1,
0.1483117, 0.2658038, 1.320328, 0, 0.6392157, 1, 1,
0.1496703, 0.7285342, -1.595921, 0, 0.6352941, 1, 1,
0.152532, 0.577798, 1.06287, 0, 0.627451, 1, 1,
0.1543903, -1.097261, 2.706748, 0, 0.6235294, 1, 1,
0.1577405, -0.1051429, 1.872884, 0, 0.6156863, 1, 1,
0.1587031, -1.371958, 2.05355, 0, 0.6117647, 1, 1,
0.1603587, -0.2509054, 0.7141748, 0, 0.6039216, 1, 1,
0.1713348, 0.9995143, 0.7283197, 0, 0.5960785, 1, 1,
0.171587, 1.159443, 0.1726556, 0, 0.5921569, 1, 1,
0.1769406, -1.539953, 3.834099, 0, 0.5843138, 1, 1,
0.1779852, -0.7182945, 2.955667, 0, 0.5803922, 1, 1,
0.1799678, -0.9144124, 5.281107, 0, 0.572549, 1, 1,
0.1837328, 0.3968686, -1.487323, 0, 0.5686275, 1, 1,
0.1910917, -0.1196729, 1.801698, 0, 0.5607843, 1, 1,
0.198004, -1.167727, 1.728432, 0, 0.5568628, 1, 1,
0.1988699, 0.5667847, -0.6998144, 0, 0.5490196, 1, 1,
0.2001294, -0.9084103, 5.189921, 0, 0.5450981, 1, 1,
0.2022324, 0.6937792, 0.8581039, 0, 0.5372549, 1, 1,
0.2057275, -1.213431, 3.138709, 0, 0.5333334, 1, 1,
0.2057288, -0.5142978, 2.290538, 0, 0.5254902, 1, 1,
0.2064281, 1.195878, -0.8187602, 0, 0.5215687, 1, 1,
0.2159495, 0.2964802, 1.222603, 0, 0.5137255, 1, 1,
0.2163502, -0.8151448, 2.826449, 0, 0.509804, 1, 1,
0.2181501, 0.9856635, 0.8040408, 0, 0.5019608, 1, 1,
0.2187607, 0.8729371, 0.7749296, 0, 0.4941176, 1, 1,
0.2259041, -2.842795, 2.637151, 0, 0.4901961, 1, 1,
0.2291161, -0.9137676, 2.183844, 0, 0.4823529, 1, 1,
0.2296766, 1.536718, -0.8329769, 0, 0.4784314, 1, 1,
0.2306991, -0.7618469, 1.885083, 0, 0.4705882, 1, 1,
0.2322172, -1.325733, 4.158131, 0, 0.4666667, 1, 1,
0.2329187, -0.7781971, 2.458264, 0, 0.4588235, 1, 1,
0.2334985, 0.02557484, 0.2947557, 0, 0.454902, 1, 1,
0.2363769, -0.1564664, 1.26973, 0, 0.4470588, 1, 1,
0.2385405, 1.124708, -1.882094, 0, 0.4431373, 1, 1,
0.2386297, 0.3808925, 1.302032, 0, 0.4352941, 1, 1,
0.2390896, -0.3104148, 1.645022, 0, 0.4313726, 1, 1,
0.2416678, -0.8179104, 2.784793, 0, 0.4235294, 1, 1,
0.2449288, 0.5404388, -1.008868, 0, 0.4196078, 1, 1,
0.2528563, 0.9177063, 0.1808014, 0, 0.4117647, 1, 1,
0.2544664, -0.06473333, 0.7469, 0, 0.4078431, 1, 1,
0.259187, -2.015026, 3.359984, 0, 0.4, 1, 1,
0.2599998, -0.1697796, 3.058749, 0, 0.3921569, 1, 1,
0.260165, -1.274358, 3.488545, 0, 0.3882353, 1, 1,
0.2632722, -1.47615, 3.253286, 0, 0.3803922, 1, 1,
0.265357, -0.6962006, 3.077065, 0, 0.3764706, 1, 1,
0.2654586, -0.2285931, 2.927811, 0, 0.3686275, 1, 1,
0.2688621, -0.16641, 1.321323, 0, 0.3647059, 1, 1,
0.2731992, -1.024235, 4.559309, 0, 0.3568628, 1, 1,
0.2750691, -1.3573, 3.043832, 0, 0.3529412, 1, 1,
0.2766109, 1.359774, 0.9545878, 0, 0.345098, 1, 1,
0.2813849, -0.5343912, 4.492748, 0, 0.3411765, 1, 1,
0.2816486, -0.5142464, 3.417224, 0, 0.3333333, 1, 1,
0.2833601, 0.3961717, 0.9329435, 0, 0.3294118, 1, 1,
0.2900225, -2.074022, 3.651285, 0, 0.3215686, 1, 1,
0.2905245, 0.7404726, -0.05131759, 0, 0.3176471, 1, 1,
0.2914591, -0.06923477, 2.3155, 0, 0.3098039, 1, 1,
0.2927641, 0.3324319, 0.192626, 0, 0.3058824, 1, 1,
0.2978101, 1.172082, 0.2257623, 0, 0.2980392, 1, 1,
0.3006238, 2.394549, -0.04554229, 0, 0.2901961, 1, 1,
0.301181, 1.414601, -0.6164662, 0, 0.2862745, 1, 1,
0.3093706, 0.478826, 1.505191, 0, 0.2784314, 1, 1,
0.309903, -0.3777089, 3.269724, 0, 0.2745098, 1, 1,
0.311105, -0.118141, 0.5859773, 0, 0.2666667, 1, 1,
0.3151108, -1.295703, 3.354244, 0, 0.2627451, 1, 1,
0.3172826, -0.5243222, 2.43392, 0, 0.254902, 1, 1,
0.3218598, -0.09712389, 3.091334, 0, 0.2509804, 1, 1,
0.3238028, -0.081035, 2.829053, 0, 0.2431373, 1, 1,
0.3238698, 0.07058775, 1.291023, 0, 0.2392157, 1, 1,
0.3257331, 0.7154032, -0.3845274, 0, 0.2313726, 1, 1,
0.3272026, 0.8066714, 0.9351478, 0, 0.227451, 1, 1,
0.3274748, -1.721632, 1.163334, 0, 0.2196078, 1, 1,
0.3276697, -0.5983085, 2.593504, 0, 0.2156863, 1, 1,
0.3295541, 1.393486, -1.428784, 0, 0.2078431, 1, 1,
0.3296095, 0.1760482, 2.091529, 0, 0.2039216, 1, 1,
0.3320276, 0.9922507, 0.7308502, 0, 0.1960784, 1, 1,
0.3347075, -1.28213, 2.561812, 0, 0.1882353, 1, 1,
0.3414779, 0.1573781, -0.1103913, 0, 0.1843137, 1, 1,
0.3418925, -2.081767, 2.744643, 0, 0.1764706, 1, 1,
0.3442656, 0.02115129, 1.827141, 0, 0.172549, 1, 1,
0.3456008, -0.1764969, 3.290382, 0, 0.1647059, 1, 1,
0.3537423, -0.9303851, 4.239051, 0, 0.1607843, 1, 1,
0.3566398, -1.722831, 4.001615, 0, 0.1529412, 1, 1,
0.3573267, -0.1531415, -0.4184958, 0, 0.1490196, 1, 1,
0.3578944, -1.148617, 2.49398, 0, 0.1411765, 1, 1,
0.3607516, -1.362741, 0.08070159, 0, 0.1372549, 1, 1,
0.360918, -0.1519214, 3.942941, 0, 0.1294118, 1, 1,
0.3617559, -0.6663904, 3.857795, 0, 0.1254902, 1, 1,
0.3630025, -1.301735, 2.58689, 0, 0.1176471, 1, 1,
0.3663673, -0.9478087, 1.35664, 0, 0.1137255, 1, 1,
0.3668837, -0.4169018, 3.840758, 0, 0.1058824, 1, 1,
0.3678893, 0.8399321, -0.7971981, 0, 0.09803922, 1, 1,
0.3693217, -0.1244297, 3.365488, 0, 0.09411765, 1, 1,
0.3708158, -0.464699, 1.467024, 0, 0.08627451, 1, 1,
0.3721758, 0.4378047, 1.149382, 0, 0.08235294, 1, 1,
0.3726424, -0.1219471, 1.10012, 0, 0.07450981, 1, 1,
0.3781031, -0.1150371, 1.089644, 0, 0.07058824, 1, 1,
0.3784769, 0.109244, -0.3089361, 0, 0.0627451, 1, 1,
0.3846547, -0.02008789, 1.72648, 0, 0.05882353, 1, 1,
0.3850083, 0.8066813, 1.173732, 0, 0.05098039, 1, 1,
0.3956183, -0.7899307, 1.814717, 0, 0.04705882, 1, 1,
0.3974775, -0.3902129, 2.23087, 0, 0.03921569, 1, 1,
0.4010863, 0.07113993, 3.124009, 0, 0.03529412, 1, 1,
0.401236, -0.7884188, 1.320993, 0, 0.02745098, 1, 1,
0.401567, -0.8696436, 1.045715, 0, 0.02352941, 1, 1,
0.4047488, 1.116623, 0.7794015, 0, 0.01568628, 1, 1,
0.4070598, -0.3952017, 4.005699, 0, 0.01176471, 1, 1,
0.4080508, 1.214455, 0.07565746, 0, 0.003921569, 1, 1,
0.408249, 0.6681928, 1.540388, 0.003921569, 0, 1, 1,
0.4088648, -0.1249348, 1.722858, 0.007843138, 0, 1, 1,
0.4138948, 0.3997827, 1.313121, 0.01568628, 0, 1, 1,
0.4162249, 1.560648, 1.486143, 0.01960784, 0, 1, 1,
0.416776, -0.09756356, 0.1929452, 0.02745098, 0, 1, 1,
0.4194026, 1.30294, 0.4508785, 0.03137255, 0, 1, 1,
0.4212068, 0.5400484, -1.5509, 0.03921569, 0, 1, 1,
0.4242412, -0.1175721, 0.07155942, 0.04313726, 0, 1, 1,
0.426576, -1.808182, 4.769969, 0.05098039, 0, 1, 1,
0.4268525, 0.6520028, -0.1702336, 0.05490196, 0, 1, 1,
0.42834, 0.5281291, 0.8803105, 0.0627451, 0, 1, 1,
0.4354806, -0.853895, 3.398247, 0.06666667, 0, 1, 1,
0.4364621, 0.922223, -0.2852904, 0.07450981, 0, 1, 1,
0.4365134, 0.8144686, 0.8506436, 0.07843138, 0, 1, 1,
0.4395247, 0.3566934, 1.067777, 0.08627451, 0, 1, 1,
0.4462065, -0.9470064, 4.152792, 0.09019608, 0, 1, 1,
0.4475704, 2.282946, 0.09668903, 0.09803922, 0, 1, 1,
0.4505587, 0.8278711, -0.3174102, 0.1058824, 0, 1, 1,
0.4579721, 0.7036138, -0.5488535, 0.1098039, 0, 1, 1,
0.4589327, 0.1528769, 1.338514, 0.1176471, 0, 1, 1,
0.4600106, -0.5695969, 2.08704, 0.1215686, 0, 1, 1,
0.4662556, -2.036767, 2.840248, 0.1294118, 0, 1, 1,
0.4700009, 2.327154, -0.7482706, 0.1333333, 0, 1, 1,
0.4715155, 0.4885046, 0.09204178, 0.1411765, 0, 1, 1,
0.4723857, -0.2308807, 3.018688, 0.145098, 0, 1, 1,
0.4732336, -1.377929, 2.211503, 0.1529412, 0, 1, 1,
0.4774326, 1.382569, 2.311758, 0.1568628, 0, 1, 1,
0.4795576, 0.9776844, 0.5232433, 0.1647059, 0, 1, 1,
0.4803592, -0.7678079, 3.758626, 0.1686275, 0, 1, 1,
0.4818214, -2.785784, 3.193929, 0.1764706, 0, 1, 1,
0.4847697, 0.4905947, 0.7315712, 0.1803922, 0, 1, 1,
0.4925858, -0.970706, 2.954938, 0.1882353, 0, 1, 1,
0.4926721, 0.2098363, 0.6935044, 0.1921569, 0, 1, 1,
0.5023063, 1.074946, 0.603276, 0.2, 0, 1, 1,
0.5023715, -0.2606925, 2.316444, 0.2078431, 0, 1, 1,
0.503874, 0.8248566, -0.3013294, 0.2117647, 0, 1, 1,
0.5044177, 0.04211257, 3.324487, 0.2196078, 0, 1, 1,
0.5058284, -0.8692675, 3.261579, 0.2235294, 0, 1, 1,
0.507099, 0.3269073, 0.1898378, 0.2313726, 0, 1, 1,
0.5080047, -0.3360923, 0.727133, 0.2352941, 0, 1, 1,
0.5103883, 0.3673431, 0.1288046, 0.2431373, 0, 1, 1,
0.5118073, -0.5693539, 4.069676, 0.2470588, 0, 1, 1,
0.5122488, -0.9315765, 2.368723, 0.254902, 0, 1, 1,
0.5201135, 2.301532, 0.7112351, 0.2588235, 0, 1, 1,
0.5206078, -0.5936225, 2.48268, 0.2666667, 0, 1, 1,
0.5218685, -0.4704697, 2.105146, 0.2705882, 0, 1, 1,
0.5231075, 0.2947975, 1.102181, 0.2784314, 0, 1, 1,
0.5237408, -1.204527, 1.370458, 0.282353, 0, 1, 1,
0.5241139, 0.1555368, 0.6174867, 0.2901961, 0, 1, 1,
0.5319497, 0.08721539, 1.176242, 0.2941177, 0, 1, 1,
0.5351917, 0.9882104, 1.1337, 0.3019608, 0, 1, 1,
0.5383269, -1.219953, 4.072538, 0.3098039, 0, 1, 1,
0.5444052, 0.2426421, 0.4442999, 0.3137255, 0, 1, 1,
0.5498117, 0.4511772, 0.628939, 0.3215686, 0, 1, 1,
0.5509267, 1.4224, 2.10501, 0.3254902, 0, 1, 1,
0.5521586, -0.8216999, 2.643824, 0.3333333, 0, 1, 1,
0.5528, -0.04884519, 1.641317, 0.3372549, 0, 1, 1,
0.5535932, -0.3911167, -0.3934779, 0.345098, 0, 1, 1,
0.5585646, -0.02151514, 0.7172695, 0.3490196, 0, 1, 1,
0.5587288, -0.4512725, 1.241509, 0.3568628, 0, 1, 1,
0.5636982, 0.7934755, 1.231831, 0.3607843, 0, 1, 1,
0.5658211, -0.4402397, 3.691652, 0.3686275, 0, 1, 1,
0.5685228, 2.260476, -0.3810424, 0.372549, 0, 1, 1,
0.5730563, 1.140682, 2.088266, 0.3803922, 0, 1, 1,
0.5744771, -0.2930903, 0.2718925, 0.3843137, 0, 1, 1,
0.5752692, -0.8855318, 1.732229, 0.3921569, 0, 1, 1,
0.5760711, -0.8913294, 2.894311, 0.3960784, 0, 1, 1,
0.5761586, 0.001789099, 0.6749354, 0.4039216, 0, 1, 1,
0.578328, 1.21998, 0.5130891, 0.4117647, 0, 1, 1,
0.580129, 2.527066, 0.3769834, 0.4156863, 0, 1, 1,
0.5809708, 0.1558556, -0.451663, 0.4235294, 0, 1, 1,
0.5815054, -2.44691, 2.647519, 0.427451, 0, 1, 1,
0.5818748, 0.3492655, 0.7042225, 0.4352941, 0, 1, 1,
0.5838933, 1.057726, 1.169626, 0.4392157, 0, 1, 1,
0.5872247, -1.121619, 2.055061, 0.4470588, 0, 1, 1,
0.5883284, 1.952742, 1.005203, 0.4509804, 0, 1, 1,
0.5908889, -1.68756, 0.5954598, 0.4588235, 0, 1, 1,
0.59367, 0.3043723, 1.675658, 0.4627451, 0, 1, 1,
0.596498, -1.815071, 1.678536, 0.4705882, 0, 1, 1,
0.6148181, -0.4182542, 0.7598068, 0.4745098, 0, 1, 1,
0.61779, 1.665265, 0.1822293, 0.4823529, 0, 1, 1,
0.6233914, 0.8249698, 0.2816697, 0.4862745, 0, 1, 1,
0.623556, 0.7165509, 0.684097, 0.4941176, 0, 1, 1,
0.623951, -0.5468919, 2.041347, 0.5019608, 0, 1, 1,
0.6259263, -0.4495102, 1.458176, 0.5058824, 0, 1, 1,
0.6294109, -0.03463034, 2.003157, 0.5137255, 0, 1, 1,
0.6301437, -0.2995095, 1.952322, 0.5176471, 0, 1, 1,
0.6376595, 0.3226678, 0.7779253, 0.5254902, 0, 1, 1,
0.6437985, -0.5401093, 0.5781343, 0.5294118, 0, 1, 1,
0.6515095, -1.479377, 1.144953, 0.5372549, 0, 1, 1,
0.6515507, -0.7895485, 2.22169, 0.5411765, 0, 1, 1,
0.6559336, -1.43488, 1.735517, 0.5490196, 0, 1, 1,
0.6569219, -0.5856239, 2.542454, 0.5529412, 0, 1, 1,
0.6583299, -0.1698884, 2.906202, 0.5607843, 0, 1, 1,
0.6586792, -0.636651, 3.452157, 0.5647059, 0, 1, 1,
0.659849, -0.5912398, 2.780424, 0.572549, 0, 1, 1,
0.6598934, 0.4113491, 1.328908, 0.5764706, 0, 1, 1,
0.6635299, 2.08356, -0.9732021, 0.5843138, 0, 1, 1,
0.6636629, -0.1366536, 3.32654, 0.5882353, 0, 1, 1,
0.6657405, 0.3122319, -0.972288, 0.5960785, 0, 1, 1,
0.676085, 2.170551, 1.36371, 0.6039216, 0, 1, 1,
0.6794292, 1.513662, 0.9553787, 0.6078432, 0, 1, 1,
0.6813694, 1.34583, -0.5097486, 0.6156863, 0, 1, 1,
0.6831154, 0.460019, 2.338137, 0.6196079, 0, 1, 1,
0.6868342, 0.4852156, 1.330213, 0.627451, 0, 1, 1,
0.6900022, -0.6781595, 1.171329, 0.6313726, 0, 1, 1,
0.6927754, 0.2076048, -0.1202659, 0.6392157, 0, 1, 1,
0.6960526, -0.3910826, 1.794149, 0.6431373, 0, 1, 1,
0.6971338, -0.8143201, 1.811447, 0.6509804, 0, 1, 1,
0.6982119, 0.4986528, 1.987121, 0.654902, 0, 1, 1,
0.7060646, -0.7037817, 2.243718, 0.6627451, 0, 1, 1,
0.7077514, 0.2711254, 0.1220512, 0.6666667, 0, 1, 1,
0.717832, 0.1201768, 2.269615, 0.6745098, 0, 1, 1,
0.722953, 0.5895981, 1.595522, 0.6784314, 0, 1, 1,
0.7299032, -0.6546532, 3.084877, 0.6862745, 0, 1, 1,
0.7321426, -1.727327, 3.251044, 0.6901961, 0, 1, 1,
0.7347263, 0.263194, 2.094323, 0.6980392, 0, 1, 1,
0.7355303, -1.990353, 2.855753, 0.7058824, 0, 1, 1,
0.7379178, -0.7931193, 3.070468, 0.7098039, 0, 1, 1,
0.7397823, -1.183729, 3.165534, 0.7176471, 0, 1, 1,
0.7429801, 0.3851135, 1.659044, 0.7215686, 0, 1, 1,
0.7477239, -1.181843, 1.125931, 0.7294118, 0, 1, 1,
0.7486482, -0.4273439, 2.284995, 0.7333333, 0, 1, 1,
0.751045, -0.8488919, 0.6962387, 0.7411765, 0, 1, 1,
0.7548951, 1.654459, 0.2320715, 0.7450981, 0, 1, 1,
0.7588434, -0.9011636, 4.404517, 0.7529412, 0, 1, 1,
0.7607061, -0.2396623, 3.190127, 0.7568628, 0, 1, 1,
0.7613796, 1.393782, 0.3274626, 0.7647059, 0, 1, 1,
0.765479, 0.2321276, 0.6911309, 0.7686275, 0, 1, 1,
0.7689676, 0.4437942, 1.477037, 0.7764706, 0, 1, 1,
0.7767769, -0.7377772, 1.957078, 0.7803922, 0, 1, 1,
0.778271, 1.673038, 0.3097082, 0.7882353, 0, 1, 1,
0.7894893, -0.6347049, 2.976762, 0.7921569, 0, 1, 1,
0.7901989, 0.5279921, -0.3427211, 0.8, 0, 1, 1,
0.7903728, -0.6475535, 1.885234, 0.8078431, 0, 1, 1,
0.7918478, -1.524793, 0.8922067, 0.8117647, 0, 1, 1,
0.795, -0.4511321, 3.335457, 0.8196079, 0, 1, 1,
0.7951198, -0.6155024, 4.63095, 0.8235294, 0, 1, 1,
0.8054683, -0.3831197, 2.252471, 0.8313726, 0, 1, 1,
0.8100115, -0.5766293, 2.147995, 0.8352941, 0, 1, 1,
0.8110313, -0.738507, 2.247861, 0.8431373, 0, 1, 1,
0.8263112, -1.855253, 3.120844, 0.8470588, 0, 1, 1,
0.8263382, 0.1941402, -0.2205126, 0.854902, 0, 1, 1,
0.8287082, -2.014645, 2.729309, 0.8588235, 0, 1, 1,
0.8293335, -0.4896339, 3.677017, 0.8666667, 0, 1, 1,
0.8301452, -0.8555567, 2.628834, 0.8705882, 0, 1, 1,
0.8313197, 0.217394, 2.698775, 0.8784314, 0, 1, 1,
0.8388628, 0.08650406, 2.109074, 0.8823529, 0, 1, 1,
0.8444842, -0.2718697, 2.248526, 0.8901961, 0, 1, 1,
0.8509968, 1.876644, -0.7123067, 0.8941177, 0, 1, 1,
0.8533727, -0.929309, 1.871915, 0.9019608, 0, 1, 1,
0.856699, 0.5239115, 1.266428, 0.9098039, 0, 1, 1,
0.8581454, 0.250476, 2.123503, 0.9137255, 0, 1, 1,
0.8594623, 1.420848, 0.851556, 0.9215686, 0, 1, 1,
0.8617704, -0.2801913, 1.685916, 0.9254902, 0, 1, 1,
0.8661585, -0.6339993, 2.198832, 0.9333333, 0, 1, 1,
0.872061, 1.267089, 1.604787, 0.9372549, 0, 1, 1,
0.8755243, 1.109588, 2.547921, 0.945098, 0, 1, 1,
0.8816906, 0.05720791, 0.7899739, 0.9490196, 0, 1, 1,
0.8832223, 0.512399, 0.7956415, 0.9568627, 0, 1, 1,
0.8868201, -0.344108, 2.511031, 0.9607843, 0, 1, 1,
0.8900661, 1.066117, 1.115152, 0.9686275, 0, 1, 1,
0.8983352, -0.5577232, 0.2057804, 0.972549, 0, 1, 1,
0.9063857, -1.230429, 1.888191, 0.9803922, 0, 1, 1,
0.909842, 0.5079135, 0.5544891, 0.9843137, 0, 1, 1,
0.9136406, 0.04592782, 2.271471, 0.9921569, 0, 1, 1,
0.9205168, 0.810782, 1.256204, 0.9960784, 0, 1, 1,
0.9247821, 0.4655382, 2.68148, 1, 0, 0.9960784, 1,
0.9250103, -0.5306328, 1.945871, 1, 0, 0.9882353, 1,
0.9379913, -0.2246821, 1.707398, 1, 0, 0.9843137, 1,
0.9389443, -0.8987021, 1.587024, 1, 0, 0.9764706, 1,
0.9392475, 1.010896, 0.2371153, 1, 0, 0.972549, 1,
0.9398363, -0.3086891, -0.003474589, 1, 0, 0.9647059, 1,
0.9453716, -0.9300755, 0.929325, 1, 0, 0.9607843, 1,
0.9459933, -0.5824724, 1.910891, 1, 0, 0.9529412, 1,
0.9534631, -1.079121, 3.417869, 1, 0, 0.9490196, 1,
0.9558687, 0.03394618, 1.604297, 1, 0, 0.9411765, 1,
0.9586859, 0.6394064, 0.2292409, 1, 0, 0.9372549, 1,
0.9804292, 0.5644442, 1.892854, 1, 0, 0.9294118, 1,
0.9831276, 0.939618, 0.2406977, 1, 0, 0.9254902, 1,
0.9890794, 1.632, 0.7475745, 1, 0, 0.9176471, 1,
0.9902692, 2.567289, -1.633722, 1, 0, 0.9137255, 1,
0.9932354, 0.1247742, 1.914742, 1, 0, 0.9058824, 1,
0.9938176, 1.093436, -0.7608764, 1, 0, 0.9019608, 1,
0.997888, -0.9018618, 1.689279, 1, 0, 0.8941177, 1,
0.9988154, 0.8044459, 0.3726862, 1, 0, 0.8862745, 1,
1.002592, -0.2242114, 3.157472, 1, 0, 0.8823529, 1,
1.003311, -0.4973941, 2.156301, 1, 0, 0.8745098, 1,
1.009516, 1.110245, 1.113042, 1, 0, 0.8705882, 1,
1.016435, -0.155804, 1.815251, 1, 0, 0.8627451, 1,
1.017496, 0.5527996, 1.985608, 1, 0, 0.8588235, 1,
1.025579, -0.1399059, 1.720369, 1, 0, 0.8509804, 1,
1.028596, 0.1211721, 1.793948, 1, 0, 0.8470588, 1,
1.03069, -0.9430008, 2.25721, 1, 0, 0.8392157, 1,
1.03971, -0.1568627, 1.629473, 1, 0, 0.8352941, 1,
1.040281, 0.4318514, 0.9331996, 1, 0, 0.827451, 1,
1.050898, 0.9149257, 2.195265, 1, 0, 0.8235294, 1,
1.051593, 0.1837394, 2.724453, 1, 0, 0.8156863, 1,
1.053323, 0.2755281, 0.3580904, 1, 0, 0.8117647, 1,
1.05709, -1.074409, 1.966573, 1, 0, 0.8039216, 1,
1.064196, -0.8187703, 1.630452, 1, 0, 0.7960784, 1,
1.065387, -1.341709, 3.18444, 1, 0, 0.7921569, 1,
1.072132, 1.660775, 1.491791, 1, 0, 0.7843137, 1,
1.072627, 0.3356462, 1.237037, 1, 0, 0.7803922, 1,
1.07332, 0.664537, 1.048914, 1, 0, 0.772549, 1,
1.07722, -0.7463545, 3.927096, 1, 0, 0.7686275, 1,
1.083893, 1.900572, 0.5649646, 1, 0, 0.7607843, 1,
1.091213, -0.2428383, 3.180312, 1, 0, 0.7568628, 1,
1.100982, 0.3498853, 2.289958, 1, 0, 0.7490196, 1,
1.104536, -0.678005, 1.975593, 1, 0, 0.7450981, 1,
1.107075, -0.3004685, 1.007312, 1, 0, 0.7372549, 1,
1.107143, -0.1015083, 1.562936, 1, 0, 0.7333333, 1,
1.107435, 0.4082308, 2.315585, 1, 0, 0.7254902, 1,
1.112465, -0.4009333, 1.258532, 1, 0, 0.7215686, 1,
1.113028, -0.8089812, 3.087974, 1, 0, 0.7137255, 1,
1.11676, 0.03484939, 0.09880852, 1, 0, 0.7098039, 1,
1.122546, 0.08856258, 3.367883, 1, 0, 0.7019608, 1,
1.12733, 0.5389298, -0.2704425, 1, 0, 0.6941177, 1,
1.127561, -1.894349, 2.10177, 1, 0, 0.6901961, 1,
1.129157, -0.9691938, 4.055733, 1, 0, 0.682353, 1,
1.133642, 0.08562886, 1.961008, 1, 0, 0.6784314, 1,
1.13847, -0.5773645, 1.614564, 1, 0, 0.6705883, 1,
1.140512, -0.7876847, 2.164078, 1, 0, 0.6666667, 1,
1.149839, 0.2397309, 2.141682, 1, 0, 0.6588235, 1,
1.152273, -0.4679662, 0.5436865, 1, 0, 0.654902, 1,
1.153469, 0.4554068, 0.08413057, 1, 0, 0.6470588, 1,
1.153878, -0.6719739, 2.272789, 1, 0, 0.6431373, 1,
1.155976, -1.591516, 3.465697, 1, 0, 0.6352941, 1,
1.157375, 0.9629123, 1.269863, 1, 0, 0.6313726, 1,
1.157413, -0.1972236, 0.5933589, 1, 0, 0.6235294, 1,
1.163286, 0.3592058, 2.281085, 1, 0, 0.6196079, 1,
1.167927, 1.073815, 0.9123539, 1, 0, 0.6117647, 1,
1.169795, 0.08600579, 1.243455, 1, 0, 0.6078432, 1,
1.174403, -0.7272439, 0.591673, 1, 0, 0.6, 1,
1.176734, 0.9875141, 2.511205, 1, 0, 0.5921569, 1,
1.177845, 1.297209, 3.101146, 1, 0, 0.5882353, 1,
1.180849, -0.01300373, 2.735981, 1, 0, 0.5803922, 1,
1.18182, -1.636613, 2.332229, 1, 0, 0.5764706, 1,
1.183719, 0.267784, -0.5764039, 1, 0, 0.5686275, 1,
1.188465, -0.8509313, 2.046416, 1, 0, 0.5647059, 1,
1.190016, -0.1785908, 3.279017, 1, 0, 0.5568628, 1,
1.202754, 0.3210622, 1.519351, 1, 0, 0.5529412, 1,
1.217958, 0.7509778, 0.4556417, 1, 0, 0.5450981, 1,
1.224411, -0.3635911, 1.117768, 1, 0, 0.5411765, 1,
1.225091, 1.642269, -0.8759869, 1, 0, 0.5333334, 1,
1.226769, -0.4485205, 2.51156, 1, 0, 0.5294118, 1,
1.235448, 1.104516, 0.08824147, 1, 0, 0.5215687, 1,
1.236466, 0.1391277, 0.2916418, 1, 0, 0.5176471, 1,
1.24622, 1.607435, 0.8423238, 1, 0, 0.509804, 1,
1.252369, -0.4330415, 2.457478, 1, 0, 0.5058824, 1,
1.255977, 1.195303, 1.220196, 1, 0, 0.4980392, 1,
1.258238, -0.07467775, 1.456465, 1, 0, 0.4901961, 1,
1.263147, 2.172426, -0.4837672, 1, 0, 0.4862745, 1,
1.265752, -0.1541858, 3.223515, 1, 0, 0.4784314, 1,
1.271088, 1.203939, 2.245553, 1, 0, 0.4745098, 1,
1.276323, 0.6851978, 1.305046, 1, 0, 0.4666667, 1,
1.291535, 0.3944019, 0.3756588, 1, 0, 0.4627451, 1,
1.294332, -2.353328, 3.040093, 1, 0, 0.454902, 1,
1.308662, 0.7069858, 3.276406, 1, 0, 0.4509804, 1,
1.311806, -0.7184491, 2.16217, 1, 0, 0.4431373, 1,
1.312369, -0.1098745, 1.840929, 1, 0, 0.4392157, 1,
1.323391, 0.8316775, 0.3296854, 1, 0, 0.4313726, 1,
1.350197, 0.6720491, 1.987427, 1, 0, 0.427451, 1,
1.355867, 0.1008224, 1.041644, 1, 0, 0.4196078, 1,
1.363193, 0.1889276, 2.121474, 1, 0, 0.4156863, 1,
1.367462, 0.458685, -0.2104791, 1, 0, 0.4078431, 1,
1.38117, 0.5003189, 1.436409, 1, 0, 0.4039216, 1,
1.383503, 0.7973348, 1.119454, 1, 0, 0.3960784, 1,
1.401147, -0.3341274, 1.813941, 1, 0, 0.3882353, 1,
1.406761, 1.357871, -1.764139, 1, 0, 0.3843137, 1,
1.412634, -0.386182, 0.5262408, 1, 0, 0.3764706, 1,
1.425923, 0.9046915, 2.046817, 1, 0, 0.372549, 1,
1.436065, 1.375751, 0.695363, 1, 0, 0.3647059, 1,
1.437794, -1.087033, 2.694623, 1, 0, 0.3607843, 1,
1.438347, -0.6913293, 2.136219, 1, 0, 0.3529412, 1,
1.452335, 0.3795536, 2.064897, 1, 0, 0.3490196, 1,
1.456637, -0.04512707, 2.859669, 1, 0, 0.3411765, 1,
1.457593, -2.116747, 3.503478, 1, 0, 0.3372549, 1,
1.45795, -0.3594996, 2.310979, 1, 0, 0.3294118, 1,
1.492962, -2.240433, 1.598357, 1, 0, 0.3254902, 1,
1.499644, 2.765712, -1.318701, 1, 0, 0.3176471, 1,
1.517482, 0.1536558, 1.934068, 1, 0, 0.3137255, 1,
1.518629, -0.1029745, 0.4278971, 1, 0, 0.3058824, 1,
1.522235, -0.04594816, 1.111055, 1, 0, 0.2980392, 1,
1.529214, -1.201531, 0.1464371, 1, 0, 0.2941177, 1,
1.539675, -0.5150353, 1.062404, 1, 0, 0.2862745, 1,
1.541025, 0.6647019, -0.3391773, 1, 0, 0.282353, 1,
1.541528, -0.4285351, 2.42513, 1, 0, 0.2745098, 1,
1.542501, -1.30566, 2.321766, 1, 0, 0.2705882, 1,
1.550828, -0.6447067, 1.65045, 1, 0, 0.2627451, 1,
1.577823, -0.6586233, 1.834336, 1, 0, 0.2588235, 1,
1.578661, 0.1643909, -0.04454826, 1, 0, 0.2509804, 1,
1.590113, -1.604459, 3.147601, 1, 0, 0.2470588, 1,
1.595219, 1.512204, -0.009662438, 1, 0, 0.2392157, 1,
1.603371, -0.04222355, 1.757344, 1, 0, 0.2352941, 1,
1.611226, -0.5976666, 0.4200137, 1, 0, 0.227451, 1,
1.623555, -0.4872257, 2.988709, 1, 0, 0.2235294, 1,
1.629939, -1.610602, 1.747231, 1, 0, 0.2156863, 1,
1.655941, 1.156496, 0.8561524, 1, 0, 0.2117647, 1,
1.656389, -0.8178333, 2.017705, 1, 0, 0.2039216, 1,
1.669641, 0.6502048, 3.727576, 1, 0, 0.1960784, 1,
1.690143, 0.7780894, 0.9586192, 1, 0, 0.1921569, 1,
1.696806, -1.194633, 1.319864, 1, 0, 0.1843137, 1,
1.708998, -1.136912, 1.990886, 1, 0, 0.1803922, 1,
1.712279, 0.101964, 1.728583, 1, 0, 0.172549, 1,
1.716806, -0.5658751, 1.385215, 1, 0, 0.1686275, 1,
1.736983, 1.869308, -0.8961126, 1, 0, 0.1607843, 1,
1.747698, -0.4199793, 3.081311, 1, 0, 0.1568628, 1,
1.768351, 0.7201014, 1.177158, 1, 0, 0.1490196, 1,
1.770764, 2.834674, 1.494362, 1, 0, 0.145098, 1,
1.795886, 1.599139, 3.24679, 1, 0, 0.1372549, 1,
1.797994, -0.2080882, 1.356898, 1, 0, 0.1333333, 1,
1.827666, 1.728245, 0.8373002, 1, 0, 0.1254902, 1,
1.85271, 0.892128, 1.502847, 1, 0, 0.1215686, 1,
1.868759, -0.08196497, 1.955343, 1, 0, 0.1137255, 1,
1.936246, 0.0938375, 2.982884, 1, 0, 0.1098039, 1,
1.951276, 1.49391, 1.545658, 1, 0, 0.1019608, 1,
1.956228, -1.679443, 2.669876, 1, 0, 0.09411765, 1,
2.017852, -0.05290986, 2.624795, 1, 0, 0.09019608, 1,
2.053499, 0.05971027, 2.840403, 1, 0, 0.08235294, 1,
2.129884, 0.4584193, 1.288756, 1, 0, 0.07843138, 1,
2.142059, 1.047175, 0.05314732, 1, 0, 0.07058824, 1,
2.15652, -0.7652397, 1.744891, 1, 0, 0.06666667, 1,
2.163268, -0.2365423, 2.51404, 1, 0, 0.05882353, 1,
2.164347, 2.50949, 0.7225855, 1, 0, 0.05490196, 1,
2.269515, 0.4026756, -0.2345667, 1, 0, 0.04705882, 1,
2.271716, -1.72084, 2.610765, 1, 0, 0.04313726, 1,
2.27579, 1.79187, 0.5271329, 1, 0, 0.03529412, 1,
2.441447, -0.3943808, 0.9334478, 1, 0, 0.03137255, 1,
2.49903, -0.08703071, 1.904364, 1, 0, 0.02352941, 1,
2.623032, 0.5140504, 3.565223, 1, 0, 0.01960784, 1,
2.708716, -0.5341672, 1.036215, 1, 0, 0.01176471, 1,
3.140723, 1.189241, 1.738518, 1, 0, 0.007843138, 1
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
-0.3019559, -4.725113, -7.059047, 0, -0.5, 0.5, 0.5,
-0.3019559, -4.725113, -7.059047, 1, -0.5, 0.5, 0.5,
-0.3019559, -4.725113, -7.059047, 1, 1.5, 0.5, 0.5,
-0.3019559, -4.725113, -7.059047, 0, 1.5, 0.5, 0.5
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
-4.911702, 0.03980851, -7.059047, 0, -0.5, 0.5, 0.5,
-4.911702, 0.03980851, -7.059047, 1, -0.5, 0.5, 0.5,
-4.911702, 0.03980851, -7.059047, 1, 1.5, 0.5, 0.5,
-4.911702, 0.03980851, -7.059047, 0, 1.5, 0.5, 0.5
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
-4.911702, -4.725113, 0.005282164, 0, -0.5, 0.5, 0.5,
-4.911702, -4.725113, 0.005282164, 1, -0.5, 0.5, 0.5,
-4.911702, -4.725113, 0.005282164, 1, 1.5, 0.5, 0.5,
-4.911702, -4.725113, 0.005282164, 0, 1.5, 0.5, 0.5
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
-3, -3.625516, -5.428817,
3, -3.625516, -5.428817,
-3, -3.625516, -5.428817,
-3, -3.808782, -5.700522,
-2, -3.625516, -5.428817,
-2, -3.808782, -5.700522,
-1, -3.625516, -5.428817,
-1, -3.808782, -5.700522,
0, -3.625516, -5.428817,
0, -3.808782, -5.700522,
1, -3.625516, -5.428817,
1, -3.808782, -5.700522,
2, -3.625516, -5.428817,
2, -3.808782, -5.700522,
3, -3.625516, -5.428817,
3, -3.808782, -5.700522
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
-3, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
-3, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
-3, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
-3, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5,
-2, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
-2, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
-2, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
-2, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5,
-1, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
-1, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
-1, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
-1, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5,
0, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
0, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
0, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
0, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5,
1, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
1, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
1, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
1, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5,
2, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
2, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
2, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
2, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5,
3, -4.175314, -6.243932, 0, -0.5, 0.5, 0.5,
3, -4.175314, -6.243932, 1, -0.5, 0.5, 0.5,
3, -4.175314, -6.243932, 1, 1.5, 0.5, 0.5,
3, -4.175314, -6.243932, 0, 1.5, 0.5, 0.5
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
-3.847915, -2, -5.428817,
-3.847915, 2, -5.428817,
-3.847915, -2, -5.428817,
-4.025213, -2, -5.700522,
-3.847915, 0, -5.428817,
-4.025213, 0, -5.700522,
-3.847915, 2, -5.428817,
-4.025213, 2, -5.700522
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
-4.379808, -2, -6.243932, 0, -0.5, 0.5, 0.5,
-4.379808, -2, -6.243932, 1, -0.5, 0.5, 0.5,
-4.379808, -2, -6.243932, 1, 1.5, 0.5, 0.5,
-4.379808, -2, -6.243932, 0, 1.5, 0.5, 0.5,
-4.379808, 0, -6.243932, 0, -0.5, 0.5, 0.5,
-4.379808, 0, -6.243932, 1, -0.5, 0.5, 0.5,
-4.379808, 0, -6.243932, 1, 1.5, 0.5, 0.5,
-4.379808, 0, -6.243932, 0, 1.5, 0.5, 0.5,
-4.379808, 2, -6.243932, 0, -0.5, 0.5, 0.5,
-4.379808, 2, -6.243932, 1, -0.5, 0.5, 0.5,
-4.379808, 2, -6.243932, 1, 1.5, 0.5, 0.5,
-4.379808, 2, -6.243932, 0, 1.5, 0.5, 0.5
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
-3.847915, -3.625516, -4,
-3.847915, -3.625516, 4,
-3.847915, -3.625516, -4,
-4.025213, -3.808782, -4,
-3.847915, -3.625516, -2,
-4.025213, -3.808782, -2,
-3.847915, -3.625516, 0,
-4.025213, -3.808782, 0,
-3.847915, -3.625516, 2,
-4.025213, -3.808782, 2,
-3.847915, -3.625516, 4,
-4.025213, -3.808782, 4
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
-4.379808, -4.175314, -4, 0, -0.5, 0.5, 0.5,
-4.379808, -4.175314, -4, 1, -0.5, 0.5, 0.5,
-4.379808, -4.175314, -4, 1, 1.5, 0.5, 0.5,
-4.379808, -4.175314, -4, 0, 1.5, 0.5, 0.5,
-4.379808, -4.175314, -2, 0, -0.5, 0.5, 0.5,
-4.379808, -4.175314, -2, 1, -0.5, 0.5, 0.5,
-4.379808, -4.175314, -2, 1, 1.5, 0.5, 0.5,
-4.379808, -4.175314, -2, 0, 1.5, 0.5, 0.5,
-4.379808, -4.175314, 0, 0, -0.5, 0.5, 0.5,
-4.379808, -4.175314, 0, 1, -0.5, 0.5, 0.5,
-4.379808, -4.175314, 0, 1, 1.5, 0.5, 0.5,
-4.379808, -4.175314, 0, 0, 1.5, 0.5, 0.5,
-4.379808, -4.175314, 2, 0, -0.5, 0.5, 0.5,
-4.379808, -4.175314, 2, 1, -0.5, 0.5, 0.5,
-4.379808, -4.175314, 2, 1, 1.5, 0.5, 0.5,
-4.379808, -4.175314, 2, 0, 1.5, 0.5, 0.5,
-4.379808, -4.175314, 4, 0, -0.5, 0.5, 0.5,
-4.379808, -4.175314, 4, 1, -0.5, 0.5, 0.5,
-4.379808, -4.175314, 4, 1, 1.5, 0.5, 0.5,
-4.379808, -4.175314, 4, 0, 1.5, 0.5, 0.5
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
-3.847915, -3.625516, -5.428817,
-3.847915, 3.705133, -5.428817,
-3.847915, -3.625516, 5.439382,
-3.847915, 3.705133, 5.439382,
-3.847915, -3.625516, -5.428817,
-3.847915, -3.625516, 5.439382,
-3.847915, 3.705133, -5.428817,
-3.847915, 3.705133, 5.439382,
-3.847915, -3.625516, -5.428817,
3.244003, -3.625516, -5.428817,
-3.847915, -3.625516, 5.439382,
3.244003, -3.625516, 5.439382,
-3.847915, 3.705133, -5.428817,
3.244003, 3.705133, -5.428817,
-3.847915, 3.705133, 5.439382,
3.244003, 3.705133, 5.439382,
3.244003, -3.625516, -5.428817,
3.244003, 3.705133, -5.428817,
3.244003, -3.625516, 5.439382,
3.244003, 3.705133, 5.439382,
3.244003, -3.625516, -5.428817,
3.244003, -3.625516, 5.439382,
3.244003, 3.705133, -5.428817,
3.244003, 3.705133, 5.439382
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
var radius = 7.958845;
var distance = 35.4098;
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
mvMatrix.translate( 0.3019559, -0.03980851, -0.005282164 );
mvMatrix.scale( 1.21339, 1.173874, 0.7917833 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.4098);
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
pyridaphenthion<-read.table("pyridaphenthion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridaphenthion$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridaphenthion' not found
```

```r
y<-pyridaphenthion$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridaphenthion' not found
```

```r
z<-pyridaphenthion$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridaphenthion' not found
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
-3.744634, 0.5277553, -1.144332, 0, 0, 1, 1, 1,
-3.066401, 1.557405, 0.4579771, 1, 0, 0, 1, 1,
-2.95633, 0.7037912, -0.3325729, 1, 0, 0, 1, 1,
-2.774571, -0.2709765, -0.4643215, 1, 0, 0, 1, 1,
-2.554839, 0.1792551, -1.177293, 1, 0, 0, 1, 1,
-2.436993, 0.9634436, 0.03179511, 1, 0, 0, 1, 1,
-2.273359, 0.09637533, -1.553702, 0, 0, 0, 1, 1,
-2.219403, 1.681503, -1.438595, 0, 0, 0, 1, 1,
-2.19937, -0.8701659, -2.356548, 0, 0, 0, 1, 1,
-2.18422, 0.6414297, -1.455207, 0, 0, 0, 1, 1,
-2.157702, 0.1429504, -1.645584, 0, 0, 0, 1, 1,
-2.141083, -1.65162, -1.511909, 0, 0, 0, 1, 1,
-2.110394, -0.1021967, -2.476889, 0, 0, 0, 1, 1,
-2.0761, 0.8046573, -2.697521, 1, 1, 1, 1, 1,
-2.074233, 0.4935048, -1.015331, 1, 1, 1, 1, 1,
-2.047518, -0.5890335, -2.074485, 1, 1, 1, 1, 1,
-2.022446, -0.008541427, -2.380296, 1, 1, 1, 1, 1,
-1.922185, 1.383974, -0.8330985, 1, 1, 1, 1, 1,
-1.911348, -0.172113, -1.679688, 1, 1, 1, 1, 1,
-1.902291, 2.18638, -0.1163886, 1, 1, 1, 1, 1,
-1.875549, 0.2725942, 0.1621623, 1, 1, 1, 1, 1,
-1.839255, -1.248066, -2.465079, 1, 1, 1, 1, 1,
-1.824448, 0.5791638, -0.234405, 1, 1, 1, 1, 1,
-1.821378, 0.8793981, 0.2491572, 1, 1, 1, 1, 1,
-1.801646, 0.3500023, -1.241804, 1, 1, 1, 1, 1,
-1.79484, 0.7294648, -2.373671, 1, 1, 1, 1, 1,
-1.79392, -0.4585571, -2.427089, 1, 1, 1, 1, 1,
-1.788522, -0.4290878, -2.194698, 1, 1, 1, 1, 1,
-1.772162, 0.7920851, 0.8502308, 0, 0, 1, 1, 1,
-1.763848, -0.9772204, -2.146113, 1, 0, 0, 1, 1,
-1.760186, 1.750485, -1.387233, 1, 0, 0, 1, 1,
-1.740798, 0.2044596, -2.402035, 1, 0, 0, 1, 1,
-1.738992, -2.336089, -3.117603, 1, 0, 0, 1, 1,
-1.714335, 0.9005919, -1.428895, 1, 0, 0, 1, 1,
-1.705276, -0.2722828, -2.221427, 0, 0, 0, 1, 1,
-1.70517, 1.36585, -1.088526, 0, 0, 0, 1, 1,
-1.703452, -1.18033, -3.207954, 0, 0, 0, 1, 1,
-1.663068, -3.518759, -1.910132, 0, 0, 0, 1, 1,
-1.661023, -0.1015647, -1.763534, 0, 0, 0, 1, 1,
-1.650359, -0.5403645, -1.899708, 0, 0, 0, 1, 1,
-1.6268, 0.8511434, 0.8875089, 0, 0, 0, 1, 1,
-1.625919, 0.4592494, -0.4553449, 1, 1, 1, 1, 1,
-1.601194, 0.4808837, -0.5433092, 1, 1, 1, 1, 1,
-1.565858, 0.1528063, 0.4360156, 1, 1, 1, 1, 1,
-1.56534, 1.403643, -0.9675068, 1, 1, 1, 1, 1,
-1.560557, 0.9191839, -0.6556504, 1, 1, 1, 1, 1,
-1.536955, -0.1286623, -2.15124, 1, 1, 1, 1, 1,
-1.529514, -0.5757539, -2.885026, 1, 1, 1, 1, 1,
-1.518458, 2.058256, 0.8666937, 1, 1, 1, 1, 1,
-1.512135, 0.9503271, -0.4325827, 1, 1, 1, 1, 1,
-1.506142, 0.04045685, -1.318326, 1, 1, 1, 1, 1,
-1.502237, 0.5198473, -1.907197, 1, 1, 1, 1, 1,
-1.499515, 1.278507, -0.3028085, 1, 1, 1, 1, 1,
-1.493083, 1.563009, -1.772335, 1, 1, 1, 1, 1,
-1.478596, -0.004480196, -1.844164, 1, 1, 1, 1, 1,
-1.47024, -0.3579578, 1.416931, 1, 1, 1, 1, 1,
-1.467061, -0.4391047, -1.074076, 0, 0, 1, 1, 1,
-1.466901, -0.9745663, -1.822935, 1, 0, 0, 1, 1,
-1.465149, -1.632758, -2.406593, 1, 0, 0, 1, 1,
-1.452257, 0.473924, -2.301449, 1, 0, 0, 1, 1,
-1.447262, -0.3818304, -4.609767, 1, 0, 0, 1, 1,
-1.441305, 2.28811, -2.26991, 1, 0, 0, 1, 1,
-1.427186, -0.3726695, -1.285585, 0, 0, 0, 1, 1,
-1.4189, 1.155261, -0.4896085, 0, 0, 0, 1, 1,
-1.417429, -1.805774, -3.609705, 0, 0, 0, 1, 1,
-1.412667, -0.6901374, -1.53331, 0, 0, 0, 1, 1,
-1.41151, -0.2963431, -2.054966, 0, 0, 0, 1, 1,
-1.411022, 1.07582, -2.39273, 0, 0, 0, 1, 1,
-1.390165, -0.2131224, -0.1029525, 0, 0, 0, 1, 1,
-1.376175, -0.1372214, -1.285903, 1, 1, 1, 1, 1,
-1.374515, -1.51115, -3.678749, 1, 1, 1, 1, 1,
-1.373241, -0.9363565, -1.974724, 1, 1, 1, 1, 1,
-1.365479, 0.2626599, -2.792631, 1, 1, 1, 1, 1,
-1.363134, -1.522018, -2.44224, 1, 1, 1, 1, 1,
-1.350266, -0.866493, -2.244587, 1, 1, 1, 1, 1,
-1.34282, 0.5670035, -1.700273, 1, 1, 1, 1, 1,
-1.326907, 0.5844, -0.8687136, 1, 1, 1, 1, 1,
-1.322755, 1.25538, -1.754357, 1, 1, 1, 1, 1,
-1.320866, -0.1112117, -1.682957, 1, 1, 1, 1, 1,
-1.314357, 0.5836055, -0.02175763, 1, 1, 1, 1, 1,
-1.313502, -0.4089457, -0.5936285, 1, 1, 1, 1, 1,
-1.30889, 0.8702005, -1.144583, 1, 1, 1, 1, 1,
-1.308538, -0.3264368, -1.29568, 1, 1, 1, 1, 1,
-1.30383, -0.7198327, -1.726679, 1, 1, 1, 1, 1,
-1.274469, -0.8341101, -2.016593, 0, 0, 1, 1, 1,
-1.274435, -0.2152703, -1.286089, 1, 0, 0, 1, 1,
-1.270814, 0.9613748, -1.82055, 1, 0, 0, 1, 1,
-1.248211, 0.1118341, -3.268033, 1, 0, 0, 1, 1,
-1.247337, 1.735323, -1.095586, 1, 0, 0, 1, 1,
-1.243316, 0.3668404, -0.7540171, 1, 0, 0, 1, 1,
-1.236315, 0.1555091, -1.103983, 0, 0, 0, 1, 1,
-1.235336, 1.44589, -2.25785, 0, 0, 0, 1, 1,
-1.233622, 0.09557366, 0.03537798, 0, 0, 0, 1, 1,
-1.230818, -2.017861, -3.123016, 0, 0, 0, 1, 1,
-1.229871, 0.8445542, -1.94089, 0, 0, 0, 1, 1,
-1.227136, -0.02357218, -2.452036, 0, 0, 0, 1, 1,
-1.225294, 1.339659, -0.8460683, 0, 0, 0, 1, 1,
-1.217878, -1.223734, -4.498868, 1, 1, 1, 1, 1,
-1.216351, -0.5506659, -2.275325, 1, 1, 1, 1, 1,
-1.213315, -0.7743416, -3.374869, 1, 1, 1, 1, 1,
-1.208756, -0.8364271, -0.6874364, 1, 1, 1, 1, 1,
-1.203208, 0.5917599, -2.324734, 1, 1, 1, 1, 1,
-1.182262, -0.4647536, -3.291855, 1, 1, 1, 1, 1,
-1.181274, -1.16948, -2.60536, 1, 1, 1, 1, 1,
-1.179939, 2.014077, 0.4165627, 1, 1, 1, 1, 1,
-1.175321, -0.5067652, -3.859367, 1, 1, 1, 1, 1,
-1.170597, -0.7054504, -0.7832869, 1, 1, 1, 1, 1,
-1.167519, 0.9703546, -0.3660106, 1, 1, 1, 1, 1,
-1.165106, 0.3951993, -1.89415, 1, 1, 1, 1, 1,
-1.163465, -1.058391, -2.552589, 1, 1, 1, 1, 1,
-1.161469, 0.06524124, -3.09982, 1, 1, 1, 1, 1,
-1.155438, -0.3380899, -2.940549, 1, 1, 1, 1, 1,
-1.147693, -0.9078685, -2.333578, 0, 0, 1, 1, 1,
-1.146066, -0.3084575, -1.4843, 1, 0, 0, 1, 1,
-1.144464, -0.2901989, -1.986834, 1, 0, 0, 1, 1,
-1.142056, -0.6419979, -1.962495, 1, 0, 0, 1, 1,
-1.138252, 2.127182, -1.045894, 1, 0, 0, 1, 1,
-1.133383, 1.431842, 0.2192663, 1, 0, 0, 1, 1,
-1.125769, -0.8420121, -3.841208, 0, 0, 0, 1, 1,
-1.116834, 0.638561, -0.722941, 0, 0, 0, 1, 1,
-1.114407, 0.6456193, -2.572065, 0, 0, 0, 1, 1,
-1.110651, 1.286216, -0.7516232, 0, 0, 0, 1, 1,
-1.102277, 1.378792, 0.9950421, 0, 0, 0, 1, 1,
-1.101611, -1.014557, -0.4676799, 0, 0, 0, 1, 1,
-1.094136, -1.285189, -1.148834, 0, 0, 0, 1, 1,
-1.092895, -0.2743135, -1.468573, 1, 1, 1, 1, 1,
-1.091033, 0.3349998, -2.31057, 1, 1, 1, 1, 1,
-1.086729, -0.9713652, -2.45423, 1, 1, 1, 1, 1,
-1.085424, -1.596953, -2.091151, 1, 1, 1, 1, 1,
-1.073224, -0.3961779, -1.210322, 1, 1, 1, 1, 1,
-1.067714, -1.122446, -3.715333, 1, 1, 1, 1, 1,
-1.067175, 0.3424306, 0.09293013, 1, 1, 1, 1, 1,
-1.064986, 0.1648623, -2.38659, 1, 1, 1, 1, 1,
-1.064879, 1.408939, -1.354305, 1, 1, 1, 1, 1,
-1.063813, 0.8333775, 0.1830196, 1, 1, 1, 1, 1,
-1.05796, 0.2471458, -1.726436, 1, 1, 1, 1, 1,
-1.057212, 0.4331728, -1.676303, 1, 1, 1, 1, 1,
-1.051501, -1.574862, -3.126955, 1, 1, 1, 1, 1,
-1.051314, 1.282059, -0.1932493, 1, 1, 1, 1, 1,
-1.04786, -1.509004, -1.99029, 1, 1, 1, 1, 1,
-1.022092, -0.2909447, -0.9671571, 0, 0, 1, 1, 1,
-1.016575, -0.8730313, -2.650096, 1, 0, 0, 1, 1,
-1.012449, -0.9679299, -2.656319, 1, 0, 0, 1, 1,
-1.011797, 0.1471456, -2.8035, 1, 0, 0, 1, 1,
-1.004555, -0.9261587, -1.721095, 1, 0, 0, 1, 1,
-1.003499, -1.462019, -2.485308, 1, 0, 0, 1, 1,
-1.003286, -0.3284182, -0.9576056, 0, 0, 0, 1, 1,
-0.990469, -0.8522015, -3.593178, 0, 0, 0, 1, 1,
-0.986854, 0.5272589, -1.303137, 0, 0, 0, 1, 1,
-0.9830166, 0.2775346, -1.160732, 0, 0, 0, 1, 1,
-0.9813572, -0.2609551, 0.07047386, 0, 0, 0, 1, 1,
-0.9768429, -0.6592274, -1.106143, 0, 0, 0, 1, 1,
-0.9766646, -0.08015037, -2.330913, 0, 0, 0, 1, 1,
-0.9701183, -1.100521, -4.494114, 1, 1, 1, 1, 1,
-0.9643596, 0.7412315, -1.308593, 1, 1, 1, 1, 1,
-0.9541246, -1.069366, -4.354969, 1, 1, 1, 1, 1,
-0.9529799, 1.152832, -2.145687, 1, 1, 1, 1, 1,
-0.9521208, -0.5999963, -1.173691, 1, 1, 1, 1, 1,
-0.9520415, 0.1360237, -0.7377302, 1, 1, 1, 1, 1,
-0.9470119, -0.999193, -2.186131, 1, 1, 1, 1, 1,
-0.942687, 0.01269522, -1.983758, 1, 1, 1, 1, 1,
-0.939541, -0.256289, -2.748937, 1, 1, 1, 1, 1,
-0.9362318, 0.1675092, 0.5744315, 1, 1, 1, 1, 1,
-0.9354454, -0.01615877, -1.85594, 1, 1, 1, 1, 1,
-0.935425, -0.4417294, -1.214523, 1, 1, 1, 1, 1,
-0.9338115, 0.4454467, -0.3004613, 1, 1, 1, 1, 1,
-0.9333698, -1.185129, -1.814811, 1, 1, 1, 1, 1,
-0.9326274, -1.176134, -0.7775555, 1, 1, 1, 1, 1,
-0.9222223, 0.4402821, -1.130517, 0, 0, 1, 1, 1,
-0.9170538, 0.6700847, -1.718719, 1, 0, 0, 1, 1,
-0.9169471, 0.8955396, -0.8181529, 1, 0, 0, 1, 1,
-0.9107262, -0.08475103, -0.3026872, 1, 0, 0, 1, 1,
-0.9043083, -2.75076, -2.290596, 1, 0, 0, 1, 1,
-0.9030362, -0.8029839, -0.7635722, 1, 0, 0, 1, 1,
-0.8943685, 0.1652225, -2.275605, 0, 0, 0, 1, 1,
-0.8918036, 2.119588, 2.295115, 0, 0, 0, 1, 1,
-0.890972, 1.842517, -0.5192093, 0, 0, 0, 1, 1,
-0.8902828, -2.289633, -3.399327, 0, 0, 0, 1, 1,
-0.8856257, -0.997802, -2.55282, 0, 0, 0, 1, 1,
-0.8851177, 0.1289516, -2.027409, 0, 0, 0, 1, 1,
-0.8834192, -1.530464, -1.603831, 0, 0, 0, 1, 1,
-0.8786956, -1.490409, -1.482505, 1, 1, 1, 1, 1,
-0.8771448, -1.266538, -2.190066, 1, 1, 1, 1, 1,
-0.8697961, -1.543363, -2.075383, 1, 1, 1, 1, 1,
-0.8656527, -1.260139, -1.308885, 1, 1, 1, 1, 1,
-0.8641153, 1.244242, -0.003241569, 1, 1, 1, 1, 1,
-0.8601787, -1.828154, -2.903032, 1, 1, 1, 1, 1,
-0.8525086, 1.036699, 0.3252121, 1, 1, 1, 1, 1,
-0.851971, -0.6195093, -2.091784, 1, 1, 1, 1, 1,
-0.8501576, -0.3321427, -1.816695, 1, 1, 1, 1, 1,
-0.8460821, 0.3850362, -1.545154, 1, 1, 1, 1, 1,
-0.8411093, 0.4939465, 0.6590561, 1, 1, 1, 1, 1,
-0.8381081, 0.328875, -1.288994, 1, 1, 1, 1, 1,
-0.8369241, -0.4494898, -2.52379, 1, 1, 1, 1, 1,
-0.8346636, 0.2781455, 0.2676184, 1, 1, 1, 1, 1,
-0.8291859, 0.6073313, -1.859558, 1, 1, 1, 1, 1,
-0.8235351, -1.019386, -2.090808, 0, 0, 1, 1, 1,
-0.8175039, 0.6715706, 0.4309391, 1, 0, 0, 1, 1,
-0.817212, 1.494166, -1.42099, 1, 0, 0, 1, 1,
-0.8163606, 0.6739199, 0.1152028, 1, 0, 0, 1, 1,
-0.8144802, -0.09616183, -1.235322, 1, 0, 0, 1, 1,
-0.8111328, 0.9011688, -1.436507, 1, 0, 0, 1, 1,
-0.8106537, 0.1271866, -1.452085, 0, 0, 0, 1, 1,
-0.8051855, 3.028302, -1.435362, 0, 0, 0, 1, 1,
-0.804802, 0.6762479, -1.99941, 0, 0, 0, 1, 1,
-0.801553, -0.3781295, -2.434825, 0, 0, 0, 1, 1,
-0.8012186, -0.1196387, -2.859631, 0, 0, 0, 1, 1,
-0.8008204, 0.2732563, -0.7343504, 0, 0, 0, 1, 1,
-0.7983525, -0.7182232, -0.6517047, 0, 0, 0, 1, 1,
-0.7978742, -0.8500776, -2.029629, 1, 1, 1, 1, 1,
-0.7936775, 0.5227911, -0.6283807, 1, 1, 1, 1, 1,
-0.7875485, 0.5594429, -2.383435, 1, 1, 1, 1, 1,
-0.7826958, 2.717426, 1.167063, 1, 1, 1, 1, 1,
-0.7800359, -1.346872, -2.265105, 1, 1, 1, 1, 1,
-0.7773185, -0.9431249, -2.903612, 1, 1, 1, 1, 1,
-0.7765957, -1.085318, -2.117932, 1, 1, 1, 1, 1,
-0.7703898, -0.1981343, -2.074605, 1, 1, 1, 1, 1,
-0.7667135, 2.711123, -1.707787, 1, 1, 1, 1, 1,
-0.7557111, 0.1821091, -3.457691, 1, 1, 1, 1, 1,
-0.753282, 1.560249, -0.24643, 1, 1, 1, 1, 1,
-0.7521797, -1.865615, -1.736065, 1, 1, 1, 1, 1,
-0.7507061, 0.208, -1.124334, 1, 1, 1, 1, 1,
-0.7504206, 1.65455, -0.2191057, 1, 1, 1, 1, 1,
-0.7494089, 0.5638082, -0.5267231, 1, 1, 1, 1, 1,
-0.7484837, 1.775504, -1.386688, 0, 0, 1, 1, 1,
-0.7444143, -2.310383, -3.547278, 1, 0, 0, 1, 1,
-0.7404229, 0.6418963, -1.337993, 1, 0, 0, 1, 1,
-0.7378998, 0.5750433, -0.2281907, 1, 0, 0, 1, 1,
-0.7349511, -0.9200971, -3.038019, 1, 0, 0, 1, 1,
-0.7314579, -0.9371122, -3.455782, 1, 0, 0, 1, 1,
-0.7278167, 0.09885777, -0.5564949, 0, 0, 0, 1, 1,
-0.707342, -0.787393, -2.709422, 0, 0, 0, 1, 1,
-0.7072329, -1.774031, -3.039813, 0, 0, 0, 1, 1,
-0.7047522, 1.47716, -0.8935343, 0, 0, 0, 1, 1,
-0.7011187, 0.8029935, -0.6169516, 0, 0, 0, 1, 1,
-0.693521, 1.209069, -1.686082, 0, 0, 0, 1, 1,
-0.6928183, 0.01970159, -3.189703, 0, 0, 0, 1, 1,
-0.692542, 0.08244762, 0.1156918, 1, 1, 1, 1, 1,
-0.690127, 0.9911774, -0.5759878, 1, 1, 1, 1, 1,
-0.6894705, -0.9168765, -2.164099, 1, 1, 1, 1, 1,
-0.6856354, -0.4375422, -1.924142, 1, 1, 1, 1, 1,
-0.685513, -0.5457845, -1.729229, 1, 1, 1, 1, 1,
-0.6852664, 1.170346, -1.550918, 1, 1, 1, 1, 1,
-0.6820714, 0.7519455, -0.6010137, 1, 1, 1, 1, 1,
-0.6764746, 1.826119, -1.121692, 1, 1, 1, 1, 1,
-0.6761379, -0.5267264, -2.232475, 1, 1, 1, 1, 1,
-0.6744887, -0.8669338, -2.965539, 1, 1, 1, 1, 1,
-0.6725022, 1.229917, -0.4363596, 1, 1, 1, 1, 1,
-0.6695305, 0.03555002, -2.597725, 1, 1, 1, 1, 1,
-0.6694649, -0.7736487, -2.063832, 1, 1, 1, 1, 1,
-0.662643, -0.9239779, -1.876308, 1, 1, 1, 1, 1,
-0.6611781, 2.27659, -0.6327029, 1, 1, 1, 1, 1,
-0.6575664, -0.7808278, -4.11745, 0, 0, 1, 1, 1,
-0.6567267, 1.50475, -0.1068234, 1, 0, 0, 1, 1,
-0.652896, 0.6103379, -0.7010819, 1, 0, 0, 1, 1,
-0.6512815, 1.589538, 0.2984436, 1, 0, 0, 1, 1,
-0.6480436, 1.199448, -1.994879, 1, 0, 0, 1, 1,
-0.6428761, -0.5862969, -0.7425205, 1, 0, 0, 1, 1,
-0.6426771, -0.4464866, -1.324029, 0, 0, 0, 1, 1,
-0.6370116, -0.6548121, -2.48933, 0, 0, 0, 1, 1,
-0.6363123, -1.288778, -2.517209, 0, 0, 0, 1, 1,
-0.635841, -0.03742181, -2.204286, 0, 0, 0, 1, 1,
-0.6330987, -0.4457672, -2.024049, 0, 0, 0, 1, 1,
-0.6329621, -1.23675, -3.433556, 0, 0, 0, 1, 1,
-0.6295275, -0.2046216, -2.99666, 0, 0, 0, 1, 1,
-0.6087583, 1.903779, 1.11772, 1, 1, 1, 1, 1,
-0.6056464, -0.7376951, -1.657155, 1, 1, 1, 1, 1,
-0.6036683, -1.574504, -2.314681, 1, 1, 1, 1, 1,
-0.5948521, -1.404325, -2.175125, 1, 1, 1, 1, 1,
-0.5943286, 0.4959536, 0.5482225, 1, 1, 1, 1, 1,
-0.5906503, -0.7337128, -1.002966, 1, 1, 1, 1, 1,
-0.5887699, -0.1564816, -1.179443, 1, 1, 1, 1, 1,
-0.5876269, 0.7790997, -3.25004, 1, 1, 1, 1, 1,
-0.5783678, 0.2164508, -1.717458, 1, 1, 1, 1, 1,
-0.5736244, -0.8650278, -1.914995, 1, 1, 1, 1, 1,
-0.5687197, 1.600204, -0.2652321, 1, 1, 1, 1, 1,
-0.5682297, -1.393211, -3.77396, 1, 1, 1, 1, 1,
-0.5648339, 1.143352, -0.05729719, 1, 1, 1, 1, 1,
-0.561867, 0.4330054, -1.290712, 1, 1, 1, 1, 1,
-0.5588381, -1.307966, -4.216997, 1, 1, 1, 1, 1,
-0.5573104, -1.312823, -4.108385, 0, 0, 1, 1, 1,
-0.5567539, 1.360122, 0.497002, 1, 0, 0, 1, 1,
-0.5553787, -1.738683, -2.966601, 1, 0, 0, 1, 1,
-0.5463728, -1.456389, -2.410383, 1, 0, 0, 1, 1,
-0.5446087, -0.5442551, -3.217751, 1, 0, 0, 1, 1,
-0.5446069, -0.2425476, -2.067248, 1, 0, 0, 1, 1,
-0.5433918, -1.332071, -1.516159, 0, 0, 0, 1, 1,
-0.5385065, -0.6467587, -3.063063, 0, 0, 0, 1, 1,
-0.53835, 1.640958, 0.9269787, 0, 0, 0, 1, 1,
-0.5338718, 0.5177081, -0.5840475, 0, 0, 0, 1, 1,
-0.5315602, 1.066161, -0.4798296, 0, 0, 0, 1, 1,
-0.5301102, 0.6102713, 0.02141711, 0, 0, 0, 1, 1,
-0.5299128, 0.4661916, -1.591261, 0, 0, 0, 1, 1,
-0.5289211, 1.693849, -2.14373, 1, 1, 1, 1, 1,
-0.5281464, 0.7494316, -1.483384, 1, 1, 1, 1, 1,
-0.5209702, 0.9352444, 1.045575, 1, 1, 1, 1, 1,
-0.5170331, 1.372736, -0.369987, 1, 1, 1, 1, 1,
-0.5157054, 0.8942484, -1.166788, 1, 1, 1, 1, 1,
-0.5138201, 0.9368575, 1.587013, 1, 1, 1, 1, 1,
-0.511295, -0.3877554, -2.036148, 1, 1, 1, 1, 1,
-0.5052218, -1.792713, -2.034444, 1, 1, 1, 1, 1,
-0.5035145, -0.3204125, -2.104448, 1, 1, 1, 1, 1,
-0.5013697, 2.82165, 1.157021, 1, 1, 1, 1, 1,
-0.4972954, -0.6478606, -2.428242, 1, 1, 1, 1, 1,
-0.4966982, -2.173428, -3.123008, 1, 1, 1, 1, 1,
-0.4943508, -1.356861, -2.821162, 1, 1, 1, 1, 1,
-0.4935696, -0.9491299, -3.291236, 1, 1, 1, 1, 1,
-0.4922045, 3.598376, -0.4222665, 1, 1, 1, 1, 1,
-0.4917244, 0.4125318, -2.758359, 0, 0, 1, 1, 1,
-0.4900255, 1.575475, -0.4413208, 1, 0, 0, 1, 1,
-0.4822513, -0.1121155, -0.8933377, 1, 0, 0, 1, 1,
-0.4780343, -0.3026775, -2.003217, 1, 0, 0, 1, 1,
-0.4767346, -0.6829034, -2.671971, 1, 0, 0, 1, 1,
-0.4761367, 0.3566075, 0.2951366, 1, 0, 0, 1, 1,
-0.4728545, -0.6593834, -1.929757, 0, 0, 0, 1, 1,
-0.4716126, -0.7088854, -3.943758, 0, 0, 0, 1, 1,
-0.466187, -0.05960033, -1.926106, 0, 0, 0, 1, 1,
-0.4652774, -2.800217, -3.87648, 0, 0, 0, 1, 1,
-0.4637327, -0.2523215, -1.728895, 0, 0, 0, 1, 1,
-0.4524089, -0.990335, -2.136701, 0, 0, 0, 1, 1,
-0.4470052, 1.128514, -0.1622957, 0, 0, 0, 1, 1,
-0.4461846, -1.528446, -2.809737, 1, 1, 1, 1, 1,
-0.4444332, 0.356439, -0.563731, 1, 1, 1, 1, 1,
-0.4422214, 0.1324299, -1.195402, 1, 1, 1, 1, 1,
-0.4390848, -1.416786, -2.263831, 1, 1, 1, 1, 1,
-0.4349889, 0.276056, -1.280671, 1, 1, 1, 1, 1,
-0.4330679, 0.01751773, -2.30764, 1, 1, 1, 1, 1,
-0.4310738, -0.4760273, -2.047778, 1, 1, 1, 1, 1,
-0.4300587, -0.5284356, -2.253353, 1, 1, 1, 1, 1,
-0.4295583, -1.309075, -1.912981, 1, 1, 1, 1, 1,
-0.4237238, 0.04080333, -2.121558, 1, 1, 1, 1, 1,
-0.4178869, -0.6943968, -3.250584, 1, 1, 1, 1, 1,
-0.4176417, 0.2513307, -3.595803, 1, 1, 1, 1, 1,
-0.4095576, -0.9694186, -1.887404, 1, 1, 1, 1, 1,
-0.4089787, 0.1967909, -1.676088, 1, 1, 1, 1, 1,
-0.406012, 0.2615716, -1.617649, 1, 1, 1, 1, 1,
-0.4027204, 1.003333, 1.053589, 0, 0, 1, 1, 1,
-0.4002657, 1.893938, -0.809222, 1, 0, 0, 1, 1,
-0.3991632, 0.8568956, 0.5638359, 1, 0, 0, 1, 1,
-0.3989234, 0.2926787, -1.435918, 1, 0, 0, 1, 1,
-0.3970297, 0.3364955, -1.074587, 1, 0, 0, 1, 1,
-0.3967384, 0.7393578, 0.633688, 1, 0, 0, 1, 1,
-0.3912283, 0.683208, -0.2634789, 0, 0, 0, 1, 1,
-0.3885469, 0.5015999, -1.018537, 0, 0, 0, 1, 1,
-0.384457, 0.6391256, -1.464335, 0, 0, 0, 1, 1,
-0.3812274, 0.5090941, 0.3153986, 0, 0, 0, 1, 1,
-0.3801337, 0.2194528, -1.974052, 0, 0, 0, 1, 1,
-0.3753997, -0.1229701, -2.397778, 0, 0, 0, 1, 1,
-0.3724579, 0.590861, -0.1019163, 0, 0, 0, 1, 1,
-0.3717384, 1.083318, 1.533414, 1, 1, 1, 1, 1,
-0.3650104, 1.733224, 0.02528267, 1, 1, 1, 1, 1,
-0.361, -0.4550062, -3.774782, 1, 1, 1, 1, 1,
-0.3609057, -1.394271, -3.672778, 1, 1, 1, 1, 1,
-0.3578384, -1.320067, -4.053017, 1, 1, 1, 1, 1,
-0.3565543, -1.816005, -2.707001, 1, 1, 1, 1, 1,
-0.3543612, -0.3672656, -1.081163, 1, 1, 1, 1, 1,
-0.3513008, -0.3531201, -2.391649, 1, 1, 1, 1, 1,
-0.3485285, -1.496027, -2.050469, 1, 1, 1, 1, 1,
-0.3464617, -1.275271, -2.721275, 1, 1, 1, 1, 1,
-0.3405474, -0.07182746, -2.170386, 1, 1, 1, 1, 1,
-0.3396177, 0.04146773, -0.5240979, 1, 1, 1, 1, 1,
-0.3335251, -1.07739, -2.686501, 1, 1, 1, 1, 1,
-0.3322801, 1.412415, 0.1094039, 1, 1, 1, 1, 1,
-0.331469, 0.1770498, -0.6328148, 1, 1, 1, 1, 1,
-0.3294928, -0.5998415, -1.268641, 0, 0, 1, 1, 1,
-0.3294328, -0.8507589, -1.319759, 1, 0, 0, 1, 1,
-0.3251638, -0.9571938, -2.979533, 1, 0, 0, 1, 1,
-0.322114, 0.05609172, -2.495642, 1, 0, 0, 1, 1,
-0.3207844, -1.457661, -1.093534, 1, 0, 0, 1, 1,
-0.3201683, 0.2779659, -1.070477, 1, 0, 0, 1, 1,
-0.3133674, 0.8662143, -2.550459, 0, 0, 0, 1, 1,
-0.3130789, -0.7340654, -3.714429, 0, 0, 0, 1, 1,
-0.3091265, -0.4834399, -1.680928, 0, 0, 0, 1, 1,
-0.3047819, 0.0117875, -2.149966, 0, 0, 0, 1, 1,
-0.3043367, 0.3488182, -1.214245, 0, 0, 0, 1, 1,
-0.2983695, 6.830662e-05, -2.118592, 0, 0, 0, 1, 1,
-0.2972676, 0.03900803, -1.098748, 0, 0, 0, 1, 1,
-0.2891292, -0.4749806, -4.798446, 1, 1, 1, 1, 1,
-0.2885416, -0.2314641, -3.865696, 1, 1, 1, 1, 1,
-0.285178, 0.07228977, 0.2461455, 1, 1, 1, 1, 1,
-0.2832131, 0.452202, -0.3521037, 1, 1, 1, 1, 1,
-0.2806116, 0.0142906, -1.406434, 1, 1, 1, 1, 1,
-0.2732644, -0.09047352, -2.634502, 1, 1, 1, 1, 1,
-0.2714084, 0.3564189, -0.9743573, 1, 1, 1, 1, 1,
-0.2665971, 0.9747284, 0.6849496, 1, 1, 1, 1, 1,
-0.2651008, -1.881848, -2.747714, 1, 1, 1, 1, 1,
-0.2635081, 0.5991328, -1.382921, 1, 1, 1, 1, 1,
-0.2578047, -1.653287, -2.979, 1, 1, 1, 1, 1,
-0.2573307, 0.9115176, 0.158479, 1, 1, 1, 1, 1,
-0.2569869, 1.235564, -1.082457, 1, 1, 1, 1, 1,
-0.2554089, -1.991385, -1.306106, 1, 1, 1, 1, 1,
-0.255111, -0.737663, -4.78938, 1, 1, 1, 1, 1,
-0.2538872, 0.2281297, 0.02394134, 0, 0, 1, 1, 1,
-0.2531598, -0.8724036, -4.583454, 1, 0, 0, 1, 1,
-0.2521545, -1.271433, -4.270249, 1, 0, 0, 1, 1,
-0.2512733, -0.4151114, -1.472226, 1, 0, 0, 1, 1,
-0.2472058, 0.1779609, 0.7662916, 1, 0, 0, 1, 1,
-0.2468795, 0.1383785, -1.093446, 1, 0, 0, 1, 1,
-0.2468015, -1.998232, -5.09048, 0, 0, 0, 1, 1,
-0.2461764, 0.7315568, 0.7057305, 0, 0, 0, 1, 1,
-0.24541, 0.8998768, -0.01629271, 0, 0, 0, 1, 1,
-0.2444259, -1.616346, -2.5818, 0, 0, 0, 1, 1,
-0.2401619, -1.03779, -3.793666, 0, 0, 0, 1, 1,
-0.2393213, -0.2547541, -3.331777, 0, 0, 0, 1, 1,
-0.2338031, 0.4323319, -1.896337, 0, 0, 0, 1, 1,
-0.233694, 0.1179228, -0.5011078, 1, 1, 1, 1, 1,
-0.2313479, -0.1447497, -3.625939, 1, 1, 1, 1, 1,
-0.2303937, 0.594752, 0.02204708, 1, 1, 1, 1, 1,
-0.227379, -0.1692932, -2.345125, 1, 1, 1, 1, 1,
-0.2256341, -0.4881462, -2.107827, 1, 1, 1, 1, 1,
-0.2252213, 0.5601258, 0.1729963, 1, 1, 1, 1, 1,
-0.2244793, 0.2543441, -0.6205739, 1, 1, 1, 1, 1,
-0.2234944, -0.3262684, -2.736873, 1, 1, 1, 1, 1,
-0.2232853, -2.000461, -3.416736, 1, 1, 1, 1, 1,
-0.221531, 0.2435929, -0.4572705, 1, 1, 1, 1, 1,
-0.2206367, 0.009445167, -2.430892, 1, 1, 1, 1, 1,
-0.2192989, -0.683359, -2.231976, 1, 1, 1, 1, 1,
-0.2184727, 0.102417, -1.030429, 1, 1, 1, 1, 1,
-0.2181716, 0.05232549, -1.798309, 1, 1, 1, 1, 1,
-0.2149975, -0.9305242, -2.290527, 1, 1, 1, 1, 1,
-0.2115597, 0.6192665, -0.8697702, 0, 0, 1, 1, 1,
-0.2113669, 0.8448895, -0.05240387, 1, 0, 0, 1, 1,
-0.2073574, -1.540683, -3.554452, 1, 0, 0, 1, 1,
-0.2048811, -1.116514, -2.637314, 1, 0, 0, 1, 1,
-0.2043988, 0.6029915, -1.775977, 1, 0, 0, 1, 1,
-0.1980819, 0.1220974, 0.1945793, 1, 0, 0, 1, 1,
-0.1926859, -1.562375, -2.396348, 0, 0, 0, 1, 1,
-0.1901411, -0.352176, -2.780978, 0, 0, 0, 1, 1,
-0.1899118, 0.6530079, -0.4459218, 0, 0, 0, 1, 1,
-0.1862114, -0.279151, -2.991412, 0, 0, 0, 1, 1,
-0.1835388, 1.488779, 1.276132, 0, 0, 0, 1, 1,
-0.1812258, 0.05780076, -1.71559, 0, 0, 0, 1, 1,
-0.1688677, -0.3595169, -3.869813, 0, 0, 0, 1, 1,
-0.1598525, -0.5150279, -2.490587, 1, 1, 1, 1, 1,
-0.153518, -1.255725, -3.349934, 1, 1, 1, 1, 1,
-0.1523316, 0.2166019, 0.4589621, 1, 1, 1, 1, 1,
-0.1513916, 0.7467728, 1.835983, 1, 1, 1, 1, 1,
-0.1498889, 0.2806487, 0.6137317, 1, 1, 1, 1, 1,
-0.1461502, 0.348488, 0.294002, 1, 1, 1, 1, 1,
-0.1439298, -0.5933404, -4.776329, 1, 1, 1, 1, 1,
-0.1412376, 1.536741, -1.54509, 1, 1, 1, 1, 1,
-0.1406668, 0.6841232, -1.207744, 1, 1, 1, 1, 1,
-0.1323816, -0.06367654, -2.625054, 1, 1, 1, 1, 1,
-0.1305163, -0.7966219, -5.160913, 1, 1, 1, 1, 1,
-0.1281371, -1.405696, -3.31812, 1, 1, 1, 1, 1,
-0.1249924, -1.141176, -3.073937, 1, 1, 1, 1, 1,
-0.1247873, -0.6471791, -2.274155, 1, 1, 1, 1, 1,
-0.1245578, -1.1733, -3.869493, 1, 1, 1, 1, 1,
-0.121523, 0.5026751, 0.7412143, 0, 0, 1, 1, 1,
-0.1109228, -1.555211, -3.957349, 1, 0, 0, 1, 1,
-0.1108432, -0.4122099, -0.6715364, 1, 0, 0, 1, 1,
-0.1071059, -0.5733339, -2.524983, 1, 0, 0, 1, 1,
-0.102025, 0.646758, -1.409527, 1, 0, 0, 1, 1,
-0.09781174, -1.020827, -1.924144, 1, 0, 0, 1, 1,
-0.09762072, -0.6108116, -2.211534, 0, 0, 0, 1, 1,
-0.09715074, 0.244765, -1.064023, 0, 0, 0, 1, 1,
-0.09607458, 0.8343582, -2.498974, 0, 0, 0, 1, 1,
-0.09314726, -1.117644, -3.376102, 0, 0, 0, 1, 1,
-0.09036084, 1.309185, -0.5681685, 0, 0, 0, 1, 1,
-0.08850309, -0.6465371, -4.169278, 0, 0, 0, 1, 1,
-0.08597137, -2.060506, -2.834137, 0, 0, 0, 1, 1,
-0.08357946, -0.9492255, -3.023572, 1, 1, 1, 1, 1,
-0.0834772, -0.1880431, -3.111181, 1, 1, 1, 1, 1,
-0.08246762, 0.4556988, 1.809063, 1, 1, 1, 1, 1,
-0.08068994, -0.4351952, -2.282077, 1, 1, 1, 1, 1,
-0.07730177, -0.9600037, -3.18082, 1, 1, 1, 1, 1,
-0.07394911, 1.355213, -0.21283, 1, 1, 1, 1, 1,
-0.0722575, 1.386907, -1.898148, 1, 1, 1, 1, 1,
-0.07117472, -1.711383, -3.3415, 1, 1, 1, 1, 1,
-0.06909855, 0.3355284, 1.713798, 1, 1, 1, 1, 1,
-0.06859407, -0.8997778, -3.620156, 1, 1, 1, 1, 1,
-0.06471596, -0.442434, -5.270543, 1, 1, 1, 1, 1,
-0.06453235, -1.121128, -2.887822, 1, 1, 1, 1, 1,
-0.06334992, 0.537007, -0.06654207, 1, 1, 1, 1, 1,
-0.06223807, -2.015321, -3.342711, 1, 1, 1, 1, 1,
-0.05188746, 0.4371389, -0.3630032, 1, 1, 1, 1, 1,
-0.05062652, -0.1386738, -2.246977, 0, 0, 1, 1, 1,
-0.04743243, 0.05495048, -1.078187, 1, 0, 0, 1, 1,
-0.04688852, -1.605905, -1.39855, 1, 0, 0, 1, 1,
-0.04499333, 0.1039731, -0.1296012, 1, 0, 0, 1, 1,
-0.03949669, 0.5110543, -0.5730599, 1, 0, 0, 1, 1,
-0.03674133, 1.269466, -0.2489223, 1, 0, 0, 1, 1,
-0.03543679, 0.9800878, 0.6889482, 0, 0, 0, 1, 1,
-0.03292566, -0.2054473, -1.97854, 0, 0, 0, 1, 1,
-0.0284228, -0.4780025, -4.400773, 0, 0, 0, 1, 1,
-0.02792997, 0.2177432, -0.6545456, 0, 0, 0, 1, 1,
-0.0263027, 2.342016, -1.406938, 0, 0, 0, 1, 1,
-0.02627207, 0.6324769, 1.730627, 0, 0, 0, 1, 1,
-0.02077696, -2.02381, -2.240684, 0, 0, 0, 1, 1,
-0.02003025, 0.109395, -0.0286573, 1, 1, 1, 1, 1,
-0.01958391, 0.05684644, -1.695834, 1, 1, 1, 1, 1,
-0.01884024, 0.02160469, 0.2641585, 1, 1, 1, 1, 1,
-0.016796, 0.2024809, -0.5961578, 1, 1, 1, 1, 1,
-0.01500849, -0.3060226, -2.853277, 1, 1, 1, 1, 1,
-0.007497872, 0.2563019, 0.6537911, 1, 1, 1, 1, 1,
-0.007259189, -0.6566566, -2.940626, 1, 1, 1, 1, 1,
-0.003431829, 0.5593415, -0.583461, 1, 1, 1, 1, 1,
-0.003199049, -0.5111277, -1.932444, 1, 1, 1, 1, 1,
-0.001531544, -0.8244168, -2.920269, 1, 1, 1, 1, 1,
-0.0009322282, -1.040047, -4.310138, 1, 1, 1, 1, 1,
0.001422344, -1.040405, 3.268639, 1, 1, 1, 1, 1,
0.002040035, -0.6687416, 4.056551, 1, 1, 1, 1, 1,
0.002469182, 0.1541801, 1.069858, 1, 1, 1, 1, 1,
0.00285233, -0.5027142, 2.98008, 1, 1, 1, 1, 1,
0.003266591, -0.4138767, 1.472808, 0, 0, 1, 1, 1,
0.01122607, 0.8989005, -0.3563994, 1, 0, 0, 1, 1,
0.01197105, 1.205279, -0.4820483, 1, 0, 0, 1, 1,
0.01955587, 0.2058445, 0.07202575, 1, 0, 0, 1, 1,
0.02036409, 0.3778872, 1.436175, 1, 0, 0, 1, 1,
0.02111763, -1.791389, 2.957479, 1, 0, 0, 1, 1,
0.02462257, 1.224625, -0.1512243, 0, 0, 0, 1, 1,
0.0278755, -0.2319092, 2.64868, 0, 0, 0, 1, 1,
0.02888649, 1.503074, -0.5658941, 0, 0, 0, 1, 1,
0.03155454, 0.02798565, 0.7687187, 0, 0, 0, 1, 1,
0.03382175, 1.300026, -0.6106107, 0, 0, 0, 1, 1,
0.03912271, 1.054668, -0.793605, 0, 0, 0, 1, 1,
0.03983481, -0.05461572, 0.9328675, 0, 0, 0, 1, 1,
0.04113117, 0.4791993, -0.7830477, 1, 1, 1, 1, 1,
0.04404002, -0.7278454, 3.101639, 1, 1, 1, 1, 1,
0.04407484, -2.160429, 0.9600205, 1, 1, 1, 1, 1,
0.04527523, 1.084488, 0.1811707, 1, 1, 1, 1, 1,
0.04710152, 0.7260627, 0.6332726, 1, 1, 1, 1, 1,
0.04756968, -0.4827794, 4.17838, 1, 1, 1, 1, 1,
0.05367161, 0.1385331, 0.4198824, 1, 1, 1, 1, 1,
0.06080784, -0.3690439, 5.14244, 1, 1, 1, 1, 1,
0.0703232, -0.6255798, 2.430554, 1, 1, 1, 1, 1,
0.07129102, -0.179925, 4.5419, 1, 1, 1, 1, 1,
0.07670198, 1.171047, -0.3114808, 1, 1, 1, 1, 1,
0.07949023, -0.7513453, 2.153162, 1, 1, 1, 1, 1,
0.07981084, 1.263343, -0.7292477, 1, 1, 1, 1, 1,
0.08029059, -0.1601211, 2.516773, 1, 1, 1, 1, 1,
0.08317767, 1.016601, 0.4755259, 1, 1, 1, 1, 1,
0.08457071, 0.05438685, 2.437631, 0, 0, 1, 1, 1,
0.08597908, 1.508941, 1.560572, 1, 0, 0, 1, 1,
0.08812632, -2.431363, 3.229462, 1, 0, 0, 1, 1,
0.08858596, 0.5986584, 0.1070364, 1, 0, 0, 1, 1,
0.09592804, -1.333624, 3.354701, 1, 0, 0, 1, 1,
0.09683978, 0.4534171, 0.8125076, 1, 0, 0, 1, 1,
0.09820721, -0.3788213, 2.804441, 0, 0, 0, 1, 1,
0.0992434, -0.002152248, 2.194901, 0, 0, 0, 1, 1,
0.09970346, -0.5018442, 3.241127, 0, 0, 0, 1, 1,
0.1014275, 0.6408076, 0.8485969, 0, 0, 0, 1, 1,
0.1038394, -0.7161903, 2.586063, 0, 0, 0, 1, 1,
0.1060249, -1.51659, 3.744515, 0, 0, 0, 1, 1,
0.1105932, -0.05431356, 2.258645, 0, 0, 0, 1, 1,
0.1122581, -0.8846169, 4.004243, 1, 1, 1, 1, 1,
0.112448, -0.9458504, 3.119155, 1, 1, 1, 1, 1,
0.1146756, 1.923261, 0.374137, 1, 1, 1, 1, 1,
0.1180062, 1.263535, 0.7567136, 1, 1, 1, 1, 1,
0.120756, -1.562394, 1.851608, 1, 1, 1, 1, 1,
0.123837, -0.7982839, 2.799647, 1, 1, 1, 1, 1,
0.1321227, -0.944364, 1.803745, 1, 1, 1, 1, 1,
0.1406032, -0.03544252, 2.5017, 1, 1, 1, 1, 1,
0.1406619, 0.06929868, 1.251767, 1, 1, 1, 1, 1,
0.1411354, 0.471585, 0.6460097, 1, 1, 1, 1, 1,
0.1416203, -0.775396, 4.000284, 1, 1, 1, 1, 1,
0.143006, 0.8042368, -0.6276434, 1, 1, 1, 1, 1,
0.1436762, -0.2598543, 1.642436, 1, 1, 1, 1, 1,
0.1443687, -1.561761, 3.314956, 1, 1, 1, 1, 1,
0.1475447, 2.030147, 0.3382835, 1, 1, 1, 1, 1,
0.1483117, 0.2658038, 1.320328, 0, 0, 1, 1, 1,
0.1496703, 0.7285342, -1.595921, 1, 0, 0, 1, 1,
0.152532, 0.577798, 1.06287, 1, 0, 0, 1, 1,
0.1543903, -1.097261, 2.706748, 1, 0, 0, 1, 1,
0.1577405, -0.1051429, 1.872884, 1, 0, 0, 1, 1,
0.1587031, -1.371958, 2.05355, 1, 0, 0, 1, 1,
0.1603587, -0.2509054, 0.7141748, 0, 0, 0, 1, 1,
0.1713348, 0.9995143, 0.7283197, 0, 0, 0, 1, 1,
0.171587, 1.159443, 0.1726556, 0, 0, 0, 1, 1,
0.1769406, -1.539953, 3.834099, 0, 0, 0, 1, 1,
0.1779852, -0.7182945, 2.955667, 0, 0, 0, 1, 1,
0.1799678, -0.9144124, 5.281107, 0, 0, 0, 1, 1,
0.1837328, 0.3968686, -1.487323, 0, 0, 0, 1, 1,
0.1910917, -0.1196729, 1.801698, 1, 1, 1, 1, 1,
0.198004, -1.167727, 1.728432, 1, 1, 1, 1, 1,
0.1988699, 0.5667847, -0.6998144, 1, 1, 1, 1, 1,
0.2001294, -0.9084103, 5.189921, 1, 1, 1, 1, 1,
0.2022324, 0.6937792, 0.8581039, 1, 1, 1, 1, 1,
0.2057275, -1.213431, 3.138709, 1, 1, 1, 1, 1,
0.2057288, -0.5142978, 2.290538, 1, 1, 1, 1, 1,
0.2064281, 1.195878, -0.8187602, 1, 1, 1, 1, 1,
0.2159495, 0.2964802, 1.222603, 1, 1, 1, 1, 1,
0.2163502, -0.8151448, 2.826449, 1, 1, 1, 1, 1,
0.2181501, 0.9856635, 0.8040408, 1, 1, 1, 1, 1,
0.2187607, 0.8729371, 0.7749296, 1, 1, 1, 1, 1,
0.2259041, -2.842795, 2.637151, 1, 1, 1, 1, 1,
0.2291161, -0.9137676, 2.183844, 1, 1, 1, 1, 1,
0.2296766, 1.536718, -0.8329769, 1, 1, 1, 1, 1,
0.2306991, -0.7618469, 1.885083, 0, 0, 1, 1, 1,
0.2322172, -1.325733, 4.158131, 1, 0, 0, 1, 1,
0.2329187, -0.7781971, 2.458264, 1, 0, 0, 1, 1,
0.2334985, 0.02557484, 0.2947557, 1, 0, 0, 1, 1,
0.2363769, -0.1564664, 1.26973, 1, 0, 0, 1, 1,
0.2385405, 1.124708, -1.882094, 1, 0, 0, 1, 1,
0.2386297, 0.3808925, 1.302032, 0, 0, 0, 1, 1,
0.2390896, -0.3104148, 1.645022, 0, 0, 0, 1, 1,
0.2416678, -0.8179104, 2.784793, 0, 0, 0, 1, 1,
0.2449288, 0.5404388, -1.008868, 0, 0, 0, 1, 1,
0.2528563, 0.9177063, 0.1808014, 0, 0, 0, 1, 1,
0.2544664, -0.06473333, 0.7469, 0, 0, 0, 1, 1,
0.259187, -2.015026, 3.359984, 0, 0, 0, 1, 1,
0.2599998, -0.1697796, 3.058749, 1, 1, 1, 1, 1,
0.260165, -1.274358, 3.488545, 1, 1, 1, 1, 1,
0.2632722, -1.47615, 3.253286, 1, 1, 1, 1, 1,
0.265357, -0.6962006, 3.077065, 1, 1, 1, 1, 1,
0.2654586, -0.2285931, 2.927811, 1, 1, 1, 1, 1,
0.2688621, -0.16641, 1.321323, 1, 1, 1, 1, 1,
0.2731992, -1.024235, 4.559309, 1, 1, 1, 1, 1,
0.2750691, -1.3573, 3.043832, 1, 1, 1, 1, 1,
0.2766109, 1.359774, 0.9545878, 1, 1, 1, 1, 1,
0.2813849, -0.5343912, 4.492748, 1, 1, 1, 1, 1,
0.2816486, -0.5142464, 3.417224, 1, 1, 1, 1, 1,
0.2833601, 0.3961717, 0.9329435, 1, 1, 1, 1, 1,
0.2900225, -2.074022, 3.651285, 1, 1, 1, 1, 1,
0.2905245, 0.7404726, -0.05131759, 1, 1, 1, 1, 1,
0.2914591, -0.06923477, 2.3155, 1, 1, 1, 1, 1,
0.2927641, 0.3324319, 0.192626, 0, 0, 1, 1, 1,
0.2978101, 1.172082, 0.2257623, 1, 0, 0, 1, 1,
0.3006238, 2.394549, -0.04554229, 1, 0, 0, 1, 1,
0.301181, 1.414601, -0.6164662, 1, 0, 0, 1, 1,
0.3093706, 0.478826, 1.505191, 1, 0, 0, 1, 1,
0.309903, -0.3777089, 3.269724, 1, 0, 0, 1, 1,
0.311105, -0.118141, 0.5859773, 0, 0, 0, 1, 1,
0.3151108, -1.295703, 3.354244, 0, 0, 0, 1, 1,
0.3172826, -0.5243222, 2.43392, 0, 0, 0, 1, 1,
0.3218598, -0.09712389, 3.091334, 0, 0, 0, 1, 1,
0.3238028, -0.081035, 2.829053, 0, 0, 0, 1, 1,
0.3238698, 0.07058775, 1.291023, 0, 0, 0, 1, 1,
0.3257331, 0.7154032, -0.3845274, 0, 0, 0, 1, 1,
0.3272026, 0.8066714, 0.9351478, 1, 1, 1, 1, 1,
0.3274748, -1.721632, 1.163334, 1, 1, 1, 1, 1,
0.3276697, -0.5983085, 2.593504, 1, 1, 1, 1, 1,
0.3295541, 1.393486, -1.428784, 1, 1, 1, 1, 1,
0.3296095, 0.1760482, 2.091529, 1, 1, 1, 1, 1,
0.3320276, 0.9922507, 0.7308502, 1, 1, 1, 1, 1,
0.3347075, -1.28213, 2.561812, 1, 1, 1, 1, 1,
0.3414779, 0.1573781, -0.1103913, 1, 1, 1, 1, 1,
0.3418925, -2.081767, 2.744643, 1, 1, 1, 1, 1,
0.3442656, 0.02115129, 1.827141, 1, 1, 1, 1, 1,
0.3456008, -0.1764969, 3.290382, 1, 1, 1, 1, 1,
0.3537423, -0.9303851, 4.239051, 1, 1, 1, 1, 1,
0.3566398, -1.722831, 4.001615, 1, 1, 1, 1, 1,
0.3573267, -0.1531415, -0.4184958, 1, 1, 1, 1, 1,
0.3578944, -1.148617, 2.49398, 1, 1, 1, 1, 1,
0.3607516, -1.362741, 0.08070159, 0, 0, 1, 1, 1,
0.360918, -0.1519214, 3.942941, 1, 0, 0, 1, 1,
0.3617559, -0.6663904, 3.857795, 1, 0, 0, 1, 1,
0.3630025, -1.301735, 2.58689, 1, 0, 0, 1, 1,
0.3663673, -0.9478087, 1.35664, 1, 0, 0, 1, 1,
0.3668837, -0.4169018, 3.840758, 1, 0, 0, 1, 1,
0.3678893, 0.8399321, -0.7971981, 0, 0, 0, 1, 1,
0.3693217, -0.1244297, 3.365488, 0, 0, 0, 1, 1,
0.3708158, -0.464699, 1.467024, 0, 0, 0, 1, 1,
0.3721758, 0.4378047, 1.149382, 0, 0, 0, 1, 1,
0.3726424, -0.1219471, 1.10012, 0, 0, 0, 1, 1,
0.3781031, -0.1150371, 1.089644, 0, 0, 0, 1, 1,
0.3784769, 0.109244, -0.3089361, 0, 0, 0, 1, 1,
0.3846547, -0.02008789, 1.72648, 1, 1, 1, 1, 1,
0.3850083, 0.8066813, 1.173732, 1, 1, 1, 1, 1,
0.3956183, -0.7899307, 1.814717, 1, 1, 1, 1, 1,
0.3974775, -0.3902129, 2.23087, 1, 1, 1, 1, 1,
0.4010863, 0.07113993, 3.124009, 1, 1, 1, 1, 1,
0.401236, -0.7884188, 1.320993, 1, 1, 1, 1, 1,
0.401567, -0.8696436, 1.045715, 1, 1, 1, 1, 1,
0.4047488, 1.116623, 0.7794015, 1, 1, 1, 1, 1,
0.4070598, -0.3952017, 4.005699, 1, 1, 1, 1, 1,
0.4080508, 1.214455, 0.07565746, 1, 1, 1, 1, 1,
0.408249, 0.6681928, 1.540388, 1, 1, 1, 1, 1,
0.4088648, -0.1249348, 1.722858, 1, 1, 1, 1, 1,
0.4138948, 0.3997827, 1.313121, 1, 1, 1, 1, 1,
0.4162249, 1.560648, 1.486143, 1, 1, 1, 1, 1,
0.416776, -0.09756356, 0.1929452, 1, 1, 1, 1, 1,
0.4194026, 1.30294, 0.4508785, 0, 0, 1, 1, 1,
0.4212068, 0.5400484, -1.5509, 1, 0, 0, 1, 1,
0.4242412, -0.1175721, 0.07155942, 1, 0, 0, 1, 1,
0.426576, -1.808182, 4.769969, 1, 0, 0, 1, 1,
0.4268525, 0.6520028, -0.1702336, 1, 0, 0, 1, 1,
0.42834, 0.5281291, 0.8803105, 1, 0, 0, 1, 1,
0.4354806, -0.853895, 3.398247, 0, 0, 0, 1, 1,
0.4364621, 0.922223, -0.2852904, 0, 0, 0, 1, 1,
0.4365134, 0.8144686, 0.8506436, 0, 0, 0, 1, 1,
0.4395247, 0.3566934, 1.067777, 0, 0, 0, 1, 1,
0.4462065, -0.9470064, 4.152792, 0, 0, 0, 1, 1,
0.4475704, 2.282946, 0.09668903, 0, 0, 0, 1, 1,
0.4505587, 0.8278711, -0.3174102, 0, 0, 0, 1, 1,
0.4579721, 0.7036138, -0.5488535, 1, 1, 1, 1, 1,
0.4589327, 0.1528769, 1.338514, 1, 1, 1, 1, 1,
0.4600106, -0.5695969, 2.08704, 1, 1, 1, 1, 1,
0.4662556, -2.036767, 2.840248, 1, 1, 1, 1, 1,
0.4700009, 2.327154, -0.7482706, 1, 1, 1, 1, 1,
0.4715155, 0.4885046, 0.09204178, 1, 1, 1, 1, 1,
0.4723857, -0.2308807, 3.018688, 1, 1, 1, 1, 1,
0.4732336, -1.377929, 2.211503, 1, 1, 1, 1, 1,
0.4774326, 1.382569, 2.311758, 1, 1, 1, 1, 1,
0.4795576, 0.9776844, 0.5232433, 1, 1, 1, 1, 1,
0.4803592, -0.7678079, 3.758626, 1, 1, 1, 1, 1,
0.4818214, -2.785784, 3.193929, 1, 1, 1, 1, 1,
0.4847697, 0.4905947, 0.7315712, 1, 1, 1, 1, 1,
0.4925858, -0.970706, 2.954938, 1, 1, 1, 1, 1,
0.4926721, 0.2098363, 0.6935044, 1, 1, 1, 1, 1,
0.5023063, 1.074946, 0.603276, 0, 0, 1, 1, 1,
0.5023715, -0.2606925, 2.316444, 1, 0, 0, 1, 1,
0.503874, 0.8248566, -0.3013294, 1, 0, 0, 1, 1,
0.5044177, 0.04211257, 3.324487, 1, 0, 0, 1, 1,
0.5058284, -0.8692675, 3.261579, 1, 0, 0, 1, 1,
0.507099, 0.3269073, 0.1898378, 1, 0, 0, 1, 1,
0.5080047, -0.3360923, 0.727133, 0, 0, 0, 1, 1,
0.5103883, 0.3673431, 0.1288046, 0, 0, 0, 1, 1,
0.5118073, -0.5693539, 4.069676, 0, 0, 0, 1, 1,
0.5122488, -0.9315765, 2.368723, 0, 0, 0, 1, 1,
0.5201135, 2.301532, 0.7112351, 0, 0, 0, 1, 1,
0.5206078, -0.5936225, 2.48268, 0, 0, 0, 1, 1,
0.5218685, -0.4704697, 2.105146, 0, 0, 0, 1, 1,
0.5231075, 0.2947975, 1.102181, 1, 1, 1, 1, 1,
0.5237408, -1.204527, 1.370458, 1, 1, 1, 1, 1,
0.5241139, 0.1555368, 0.6174867, 1, 1, 1, 1, 1,
0.5319497, 0.08721539, 1.176242, 1, 1, 1, 1, 1,
0.5351917, 0.9882104, 1.1337, 1, 1, 1, 1, 1,
0.5383269, -1.219953, 4.072538, 1, 1, 1, 1, 1,
0.5444052, 0.2426421, 0.4442999, 1, 1, 1, 1, 1,
0.5498117, 0.4511772, 0.628939, 1, 1, 1, 1, 1,
0.5509267, 1.4224, 2.10501, 1, 1, 1, 1, 1,
0.5521586, -0.8216999, 2.643824, 1, 1, 1, 1, 1,
0.5528, -0.04884519, 1.641317, 1, 1, 1, 1, 1,
0.5535932, -0.3911167, -0.3934779, 1, 1, 1, 1, 1,
0.5585646, -0.02151514, 0.7172695, 1, 1, 1, 1, 1,
0.5587288, -0.4512725, 1.241509, 1, 1, 1, 1, 1,
0.5636982, 0.7934755, 1.231831, 1, 1, 1, 1, 1,
0.5658211, -0.4402397, 3.691652, 0, 0, 1, 1, 1,
0.5685228, 2.260476, -0.3810424, 1, 0, 0, 1, 1,
0.5730563, 1.140682, 2.088266, 1, 0, 0, 1, 1,
0.5744771, -0.2930903, 0.2718925, 1, 0, 0, 1, 1,
0.5752692, -0.8855318, 1.732229, 1, 0, 0, 1, 1,
0.5760711, -0.8913294, 2.894311, 1, 0, 0, 1, 1,
0.5761586, 0.001789099, 0.6749354, 0, 0, 0, 1, 1,
0.578328, 1.21998, 0.5130891, 0, 0, 0, 1, 1,
0.580129, 2.527066, 0.3769834, 0, 0, 0, 1, 1,
0.5809708, 0.1558556, -0.451663, 0, 0, 0, 1, 1,
0.5815054, -2.44691, 2.647519, 0, 0, 0, 1, 1,
0.5818748, 0.3492655, 0.7042225, 0, 0, 0, 1, 1,
0.5838933, 1.057726, 1.169626, 0, 0, 0, 1, 1,
0.5872247, -1.121619, 2.055061, 1, 1, 1, 1, 1,
0.5883284, 1.952742, 1.005203, 1, 1, 1, 1, 1,
0.5908889, -1.68756, 0.5954598, 1, 1, 1, 1, 1,
0.59367, 0.3043723, 1.675658, 1, 1, 1, 1, 1,
0.596498, -1.815071, 1.678536, 1, 1, 1, 1, 1,
0.6148181, -0.4182542, 0.7598068, 1, 1, 1, 1, 1,
0.61779, 1.665265, 0.1822293, 1, 1, 1, 1, 1,
0.6233914, 0.8249698, 0.2816697, 1, 1, 1, 1, 1,
0.623556, 0.7165509, 0.684097, 1, 1, 1, 1, 1,
0.623951, -0.5468919, 2.041347, 1, 1, 1, 1, 1,
0.6259263, -0.4495102, 1.458176, 1, 1, 1, 1, 1,
0.6294109, -0.03463034, 2.003157, 1, 1, 1, 1, 1,
0.6301437, -0.2995095, 1.952322, 1, 1, 1, 1, 1,
0.6376595, 0.3226678, 0.7779253, 1, 1, 1, 1, 1,
0.6437985, -0.5401093, 0.5781343, 1, 1, 1, 1, 1,
0.6515095, -1.479377, 1.144953, 0, 0, 1, 1, 1,
0.6515507, -0.7895485, 2.22169, 1, 0, 0, 1, 1,
0.6559336, -1.43488, 1.735517, 1, 0, 0, 1, 1,
0.6569219, -0.5856239, 2.542454, 1, 0, 0, 1, 1,
0.6583299, -0.1698884, 2.906202, 1, 0, 0, 1, 1,
0.6586792, -0.636651, 3.452157, 1, 0, 0, 1, 1,
0.659849, -0.5912398, 2.780424, 0, 0, 0, 1, 1,
0.6598934, 0.4113491, 1.328908, 0, 0, 0, 1, 1,
0.6635299, 2.08356, -0.9732021, 0, 0, 0, 1, 1,
0.6636629, -0.1366536, 3.32654, 0, 0, 0, 1, 1,
0.6657405, 0.3122319, -0.972288, 0, 0, 0, 1, 1,
0.676085, 2.170551, 1.36371, 0, 0, 0, 1, 1,
0.6794292, 1.513662, 0.9553787, 0, 0, 0, 1, 1,
0.6813694, 1.34583, -0.5097486, 1, 1, 1, 1, 1,
0.6831154, 0.460019, 2.338137, 1, 1, 1, 1, 1,
0.6868342, 0.4852156, 1.330213, 1, 1, 1, 1, 1,
0.6900022, -0.6781595, 1.171329, 1, 1, 1, 1, 1,
0.6927754, 0.2076048, -0.1202659, 1, 1, 1, 1, 1,
0.6960526, -0.3910826, 1.794149, 1, 1, 1, 1, 1,
0.6971338, -0.8143201, 1.811447, 1, 1, 1, 1, 1,
0.6982119, 0.4986528, 1.987121, 1, 1, 1, 1, 1,
0.7060646, -0.7037817, 2.243718, 1, 1, 1, 1, 1,
0.7077514, 0.2711254, 0.1220512, 1, 1, 1, 1, 1,
0.717832, 0.1201768, 2.269615, 1, 1, 1, 1, 1,
0.722953, 0.5895981, 1.595522, 1, 1, 1, 1, 1,
0.7299032, -0.6546532, 3.084877, 1, 1, 1, 1, 1,
0.7321426, -1.727327, 3.251044, 1, 1, 1, 1, 1,
0.7347263, 0.263194, 2.094323, 1, 1, 1, 1, 1,
0.7355303, -1.990353, 2.855753, 0, 0, 1, 1, 1,
0.7379178, -0.7931193, 3.070468, 1, 0, 0, 1, 1,
0.7397823, -1.183729, 3.165534, 1, 0, 0, 1, 1,
0.7429801, 0.3851135, 1.659044, 1, 0, 0, 1, 1,
0.7477239, -1.181843, 1.125931, 1, 0, 0, 1, 1,
0.7486482, -0.4273439, 2.284995, 1, 0, 0, 1, 1,
0.751045, -0.8488919, 0.6962387, 0, 0, 0, 1, 1,
0.7548951, 1.654459, 0.2320715, 0, 0, 0, 1, 1,
0.7588434, -0.9011636, 4.404517, 0, 0, 0, 1, 1,
0.7607061, -0.2396623, 3.190127, 0, 0, 0, 1, 1,
0.7613796, 1.393782, 0.3274626, 0, 0, 0, 1, 1,
0.765479, 0.2321276, 0.6911309, 0, 0, 0, 1, 1,
0.7689676, 0.4437942, 1.477037, 0, 0, 0, 1, 1,
0.7767769, -0.7377772, 1.957078, 1, 1, 1, 1, 1,
0.778271, 1.673038, 0.3097082, 1, 1, 1, 1, 1,
0.7894893, -0.6347049, 2.976762, 1, 1, 1, 1, 1,
0.7901989, 0.5279921, -0.3427211, 1, 1, 1, 1, 1,
0.7903728, -0.6475535, 1.885234, 1, 1, 1, 1, 1,
0.7918478, -1.524793, 0.8922067, 1, 1, 1, 1, 1,
0.795, -0.4511321, 3.335457, 1, 1, 1, 1, 1,
0.7951198, -0.6155024, 4.63095, 1, 1, 1, 1, 1,
0.8054683, -0.3831197, 2.252471, 1, 1, 1, 1, 1,
0.8100115, -0.5766293, 2.147995, 1, 1, 1, 1, 1,
0.8110313, -0.738507, 2.247861, 1, 1, 1, 1, 1,
0.8263112, -1.855253, 3.120844, 1, 1, 1, 1, 1,
0.8263382, 0.1941402, -0.2205126, 1, 1, 1, 1, 1,
0.8287082, -2.014645, 2.729309, 1, 1, 1, 1, 1,
0.8293335, -0.4896339, 3.677017, 1, 1, 1, 1, 1,
0.8301452, -0.8555567, 2.628834, 0, 0, 1, 1, 1,
0.8313197, 0.217394, 2.698775, 1, 0, 0, 1, 1,
0.8388628, 0.08650406, 2.109074, 1, 0, 0, 1, 1,
0.8444842, -0.2718697, 2.248526, 1, 0, 0, 1, 1,
0.8509968, 1.876644, -0.7123067, 1, 0, 0, 1, 1,
0.8533727, -0.929309, 1.871915, 1, 0, 0, 1, 1,
0.856699, 0.5239115, 1.266428, 0, 0, 0, 1, 1,
0.8581454, 0.250476, 2.123503, 0, 0, 0, 1, 1,
0.8594623, 1.420848, 0.851556, 0, 0, 0, 1, 1,
0.8617704, -0.2801913, 1.685916, 0, 0, 0, 1, 1,
0.8661585, -0.6339993, 2.198832, 0, 0, 0, 1, 1,
0.872061, 1.267089, 1.604787, 0, 0, 0, 1, 1,
0.8755243, 1.109588, 2.547921, 0, 0, 0, 1, 1,
0.8816906, 0.05720791, 0.7899739, 1, 1, 1, 1, 1,
0.8832223, 0.512399, 0.7956415, 1, 1, 1, 1, 1,
0.8868201, -0.344108, 2.511031, 1, 1, 1, 1, 1,
0.8900661, 1.066117, 1.115152, 1, 1, 1, 1, 1,
0.8983352, -0.5577232, 0.2057804, 1, 1, 1, 1, 1,
0.9063857, -1.230429, 1.888191, 1, 1, 1, 1, 1,
0.909842, 0.5079135, 0.5544891, 1, 1, 1, 1, 1,
0.9136406, 0.04592782, 2.271471, 1, 1, 1, 1, 1,
0.9205168, 0.810782, 1.256204, 1, 1, 1, 1, 1,
0.9247821, 0.4655382, 2.68148, 1, 1, 1, 1, 1,
0.9250103, -0.5306328, 1.945871, 1, 1, 1, 1, 1,
0.9379913, -0.2246821, 1.707398, 1, 1, 1, 1, 1,
0.9389443, -0.8987021, 1.587024, 1, 1, 1, 1, 1,
0.9392475, 1.010896, 0.2371153, 1, 1, 1, 1, 1,
0.9398363, -0.3086891, -0.003474589, 1, 1, 1, 1, 1,
0.9453716, -0.9300755, 0.929325, 0, 0, 1, 1, 1,
0.9459933, -0.5824724, 1.910891, 1, 0, 0, 1, 1,
0.9534631, -1.079121, 3.417869, 1, 0, 0, 1, 1,
0.9558687, 0.03394618, 1.604297, 1, 0, 0, 1, 1,
0.9586859, 0.6394064, 0.2292409, 1, 0, 0, 1, 1,
0.9804292, 0.5644442, 1.892854, 1, 0, 0, 1, 1,
0.9831276, 0.939618, 0.2406977, 0, 0, 0, 1, 1,
0.9890794, 1.632, 0.7475745, 0, 0, 0, 1, 1,
0.9902692, 2.567289, -1.633722, 0, 0, 0, 1, 1,
0.9932354, 0.1247742, 1.914742, 0, 0, 0, 1, 1,
0.9938176, 1.093436, -0.7608764, 0, 0, 0, 1, 1,
0.997888, -0.9018618, 1.689279, 0, 0, 0, 1, 1,
0.9988154, 0.8044459, 0.3726862, 0, 0, 0, 1, 1,
1.002592, -0.2242114, 3.157472, 1, 1, 1, 1, 1,
1.003311, -0.4973941, 2.156301, 1, 1, 1, 1, 1,
1.009516, 1.110245, 1.113042, 1, 1, 1, 1, 1,
1.016435, -0.155804, 1.815251, 1, 1, 1, 1, 1,
1.017496, 0.5527996, 1.985608, 1, 1, 1, 1, 1,
1.025579, -0.1399059, 1.720369, 1, 1, 1, 1, 1,
1.028596, 0.1211721, 1.793948, 1, 1, 1, 1, 1,
1.03069, -0.9430008, 2.25721, 1, 1, 1, 1, 1,
1.03971, -0.1568627, 1.629473, 1, 1, 1, 1, 1,
1.040281, 0.4318514, 0.9331996, 1, 1, 1, 1, 1,
1.050898, 0.9149257, 2.195265, 1, 1, 1, 1, 1,
1.051593, 0.1837394, 2.724453, 1, 1, 1, 1, 1,
1.053323, 0.2755281, 0.3580904, 1, 1, 1, 1, 1,
1.05709, -1.074409, 1.966573, 1, 1, 1, 1, 1,
1.064196, -0.8187703, 1.630452, 1, 1, 1, 1, 1,
1.065387, -1.341709, 3.18444, 0, 0, 1, 1, 1,
1.072132, 1.660775, 1.491791, 1, 0, 0, 1, 1,
1.072627, 0.3356462, 1.237037, 1, 0, 0, 1, 1,
1.07332, 0.664537, 1.048914, 1, 0, 0, 1, 1,
1.07722, -0.7463545, 3.927096, 1, 0, 0, 1, 1,
1.083893, 1.900572, 0.5649646, 1, 0, 0, 1, 1,
1.091213, -0.2428383, 3.180312, 0, 0, 0, 1, 1,
1.100982, 0.3498853, 2.289958, 0, 0, 0, 1, 1,
1.104536, -0.678005, 1.975593, 0, 0, 0, 1, 1,
1.107075, -0.3004685, 1.007312, 0, 0, 0, 1, 1,
1.107143, -0.1015083, 1.562936, 0, 0, 0, 1, 1,
1.107435, 0.4082308, 2.315585, 0, 0, 0, 1, 1,
1.112465, -0.4009333, 1.258532, 0, 0, 0, 1, 1,
1.113028, -0.8089812, 3.087974, 1, 1, 1, 1, 1,
1.11676, 0.03484939, 0.09880852, 1, 1, 1, 1, 1,
1.122546, 0.08856258, 3.367883, 1, 1, 1, 1, 1,
1.12733, 0.5389298, -0.2704425, 1, 1, 1, 1, 1,
1.127561, -1.894349, 2.10177, 1, 1, 1, 1, 1,
1.129157, -0.9691938, 4.055733, 1, 1, 1, 1, 1,
1.133642, 0.08562886, 1.961008, 1, 1, 1, 1, 1,
1.13847, -0.5773645, 1.614564, 1, 1, 1, 1, 1,
1.140512, -0.7876847, 2.164078, 1, 1, 1, 1, 1,
1.149839, 0.2397309, 2.141682, 1, 1, 1, 1, 1,
1.152273, -0.4679662, 0.5436865, 1, 1, 1, 1, 1,
1.153469, 0.4554068, 0.08413057, 1, 1, 1, 1, 1,
1.153878, -0.6719739, 2.272789, 1, 1, 1, 1, 1,
1.155976, -1.591516, 3.465697, 1, 1, 1, 1, 1,
1.157375, 0.9629123, 1.269863, 1, 1, 1, 1, 1,
1.157413, -0.1972236, 0.5933589, 0, 0, 1, 1, 1,
1.163286, 0.3592058, 2.281085, 1, 0, 0, 1, 1,
1.167927, 1.073815, 0.9123539, 1, 0, 0, 1, 1,
1.169795, 0.08600579, 1.243455, 1, 0, 0, 1, 1,
1.174403, -0.7272439, 0.591673, 1, 0, 0, 1, 1,
1.176734, 0.9875141, 2.511205, 1, 0, 0, 1, 1,
1.177845, 1.297209, 3.101146, 0, 0, 0, 1, 1,
1.180849, -0.01300373, 2.735981, 0, 0, 0, 1, 1,
1.18182, -1.636613, 2.332229, 0, 0, 0, 1, 1,
1.183719, 0.267784, -0.5764039, 0, 0, 0, 1, 1,
1.188465, -0.8509313, 2.046416, 0, 0, 0, 1, 1,
1.190016, -0.1785908, 3.279017, 0, 0, 0, 1, 1,
1.202754, 0.3210622, 1.519351, 0, 0, 0, 1, 1,
1.217958, 0.7509778, 0.4556417, 1, 1, 1, 1, 1,
1.224411, -0.3635911, 1.117768, 1, 1, 1, 1, 1,
1.225091, 1.642269, -0.8759869, 1, 1, 1, 1, 1,
1.226769, -0.4485205, 2.51156, 1, 1, 1, 1, 1,
1.235448, 1.104516, 0.08824147, 1, 1, 1, 1, 1,
1.236466, 0.1391277, 0.2916418, 1, 1, 1, 1, 1,
1.24622, 1.607435, 0.8423238, 1, 1, 1, 1, 1,
1.252369, -0.4330415, 2.457478, 1, 1, 1, 1, 1,
1.255977, 1.195303, 1.220196, 1, 1, 1, 1, 1,
1.258238, -0.07467775, 1.456465, 1, 1, 1, 1, 1,
1.263147, 2.172426, -0.4837672, 1, 1, 1, 1, 1,
1.265752, -0.1541858, 3.223515, 1, 1, 1, 1, 1,
1.271088, 1.203939, 2.245553, 1, 1, 1, 1, 1,
1.276323, 0.6851978, 1.305046, 1, 1, 1, 1, 1,
1.291535, 0.3944019, 0.3756588, 1, 1, 1, 1, 1,
1.294332, -2.353328, 3.040093, 0, 0, 1, 1, 1,
1.308662, 0.7069858, 3.276406, 1, 0, 0, 1, 1,
1.311806, -0.7184491, 2.16217, 1, 0, 0, 1, 1,
1.312369, -0.1098745, 1.840929, 1, 0, 0, 1, 1,
1.323391, 0.8316775, 0.3296854, 1, 0, 0, 1, 1,
1.350197, 0.6720491, 1.987427, 1, 0, 0, 1, 1,
1.355867, 0.1008224, 1.041644, 0, 0, 0, 1, 1,
1.363193, 0.1889276, 2.121474, 0, 0, 0, 1, 1,
1.367462, 0.458685, -0.2104791, 0, 0, 0, 1, 1,
1.38117, 0.5003189, 1.436409, 0, 0, 0, 1, 1,
1.383503, 0.7973348, 1.119454, 0, 0, 0, 1, 1,
1.401147, -0.3341274, 1.813941, 0, 0, 0, 1, 1,
1.406761, 1.357871, -1.764139, 0, 0, 0, 1, 1,
1.412634, -0.386182, 0.5262408, 1, 1, 1, 1, 1,
1.425923, 0.9046915, 2.046817, 1, 1, 1, 1, 1,
1.436065, 1.375751, 0.695363, 1, 1, 1, 1, 1,
1.437794, -1.087033, 2.694623, 1, 1, 1, 1, 1,
1.438347, -0.6913293, 2.136219, 1, 1, 1, 1, 1,
1.452335, 0.3795536, 2.064897, 1, 1, 1, 1, 1,
1.456637, -0.04512707, 2.859669, 1, 1, 1, 1, 1,
1.457593, -2.116747, 3.503478, 1, 1, 1, 1, 1,
1.45795, -0.3594996, 2.310979, 1, 1, 1, 1, 1,
1.492962, -2.240433, 1.598357, 1, 1, 1, 1, 1,
1.499644, 2.765712, -1.318701, 1, 1, 1, 1, 1,
1.517482, 0.1536558, 1.934068, 1, 1, 1, 1, 1,
1.518629, -0.1029745, 0.4278971, 1, 1, 1, 1, 1,
1.522235, -0.04594816, 1.111055, 1, 1, 1, 1, 1,
1.529214, -1.201531, 0.1464371, 1, 1, 1, 1, 1,
1.539675, -0.5150353, 1.062404, 0, 0, 1, 1, 1,
1.541025, 0.6647019, -0.3391773, 1, 0, 0, 1, 1,
1.541528, -0.4285351, 2.42513, 1, 0, 0, 1, 1,
1.542501, -1.30566, 2.321766, 1, 0, 0, 1, 1,
1.550828, -0.6447067, 1.65045, 1, 0, 0, 1, 1,
1.577823, -0.6586233, 1.834336, 1, 0, 0, 1, 1,
1.578661, 0.1643909, -0.04454826, 0, 0, 0, 1, 1,
1.590113, -1.604459, 3.147601, 0, 0, 0, 1, 1,
1.595219, 1.512204, -0.009662438, 0, 0, 0, 1, 1,
1.603371, -0.04222355, 1.757344, 0, 0, 0, 1, 1,
1.611226, -0.5976666, 0.4200137, 0, 0, 0, 1, 1,
1.623555, -0.4872257, 2.988709, 0, 0, 0, 1, 1,
1.629939, -1.610602, 1.747231, 0, 0, 0, 1, 1,
1.655941, 1.156496, 0.8561524, 1, 1, 1, 1, 1,
1.656389, -0.8178333, 2.017705, 1, 1, 1, 1, 1,
1.669641, 0.6502048, 3.727576, 1, 1, 1, 1, 1,
1.690143, 0.7780894, 0.9586192, 1, 1, 1, 1, 1,
1.696806, -1.194633, 1.319864, 1, 1, 1, 1, 1,
1.708998, -1.136912, 1.990886, 1, 1, 1, 1, 1,
1.712279, 0.101964, 1.728583, 1, 1, 1, 1, 1,
1.716806, -0.5658751, 1.385215, 1, 1, 1, 1, 1,
1.736983, 1.869308, -0.8961126, 1, 1, 1, 1, 1,
1.747698, -0.4199793, 3.081311, 1, 1, 1, 1, 1,
1.768351, 0.7201014, 1.177158, 1, 1, 1, 1, 1,
1.770764, 2.834674, 1.494362, 1, 1, 1, 1, 1,
1.795886, 1.599139, 3.24679, 1, 1, 1, 1, 1,
1.797994, -0.2080882, 1.356898, 1, 1, 1, 1, 1,
1.827666, 1.728245, 0.8373002, 1, 1, 1, 1, 1,
1.85271, 0.892128, 1.502847, 0, 0, 1, 1, 1,
1.868759, -0.08196497, 1.955343, 1, 0, 0, 1, 1,
1.936246, 0.0938375, 2.982884, 1, 0, 0, 1, 1,
1.951276, 1.49391, 1.545658, 1, 0, 0, 1, 1,
1.956228, -1.679443, 2.669876, 1, 0, 0, 1, 1,
2.017852, -0.05290986, 2.624795, 1, 0, 0, 1, 1,
2.053499, 0.05971027, 2.840403, 0, 0, 0, 1, 1,
2.129884, 0.4584193, 1.288756, 0, 0, 0, 1, 1,
2.142059, 1.047175, 0.05314732, 0, 0, 0, 1, 1,
2.15652, -0.7652397, 1.744891, 0, 0, 0, 1, 1,
2.163268, -0.2365423, 2.51404, 0, 0, 0, 1, 1,
2.164347, 2.50949, 0.7225855, 0, 0, 0, 1, 1,
2.269515, 0.4026756, -0.2345667, 0, 0, 0, 1, 1,
2.271716, -1.72084, 2.610765, 1, 1, 1, 1, 1,
2.27579, 1.79187, 0.5271329, 1, 1, 1, 1, 1,
2.441447, -0.3943808, 0.9334478, 1, 1, 1, 1, 1,
2.49903, -0.08703071, 1.904364, 1, 1, 1, 1, 1,
2.623032, 0.5140504, 3.565223, 1, 1, 1, 1, 1,
2.708716, -0.5341672, 1.036215, 1, 1, 1, 1, 1,
3.140723, 1.189241, 1.738518, 1, 1, 1, 1, 1
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
var radius = 9.832788;
var distance = 34.53725;
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
mvMatrix.translate( 0.3019562, -0.03980851, -0.005282164 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.53725);
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
