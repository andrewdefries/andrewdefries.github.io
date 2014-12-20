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
-3.138264, -1.042738, -3.515205, 1, 0, 0, 1,
-3.035529, -0.1780643, -1.536834, 1, 0.007843138, 0, 1,
-2.862836, -2.371562, -3.41582, 1, 0.01176471, 0, 1,
-2.793426, 0.07722379, -1.312478, 1, 0.01960784, 0, 1,
-2.672085, 0.8415046, 0.01928547, 1, 0.02352941, 0, 1,
-2.589559, -1.102808, -1.600907, 1, 0.03137255, 0, 1,
-2.584109, -1.505027, -2.156877, 1, 0.03529412, 0, 1,
-2.565781, 2.576918, -1.100868, 1, 0.04313726, 0, 1,
-2.561155, 1.5566, -0.4917062, 1, 0.04705882, 0, 1,
-2.524712, -0.1163538, -3.05594, 1, 0.05490196, 0, 1,
-2.435733, 0.3126622, 0.1909443, 1, 0.05882353, 0, 1,
-2.380101, 0.1918187, -0.2736555, 1, 0.06666667, 0, 1,
-2.34944, -0.4123609, -0.7934371, 1, 0.07058824, 0, 1,
-2.334416, 0.4110028, -0.8382939, 1, 0.07843138, 0, 1,
-2.314426, 0.9012831, -1.038115, 1, 0.08235294, 0, 1,
-2.292163, -0.6456399, -2.245975, 1, 0.09019608, 0, 1,
-2.256404, 0.2337695, 0.05644875, 1, 0.09411765, 0, 1,
-2.212638, -1.490756, -0.2900807, 1, 0.1019608, 0, 1,
-2.206987, -0.6145177, -2.13847, 1, 0.1098039, 0, 1,
-2.195799, 0.7287872, -2.427457, 1, 0.1137255, 0, 1,
-2.154855, 0.4547902, -1.788041, 1, 0.1215686, 0, 1,
-2.127527, 0.2231931, -0.2225564, 1, 0.1254902, 0, 1,
-2.105796, -0.3242297, -0.9818001, 1, 0.1333333, 0, 1,
-2.094493, 0.3138663, -1.041979, 1, 0.1372549, 0, 1,
-2.073826, -1.622384, -2.589194, 1, 0.145098, 0, 1,
-1.989463, -1.063201, -1.320411, 1, 0.1490196, 0, 1,
-1.987164, 0.5041075, -2.953527, 1, 0.1568628, 0, 1,
-1.958815, 2.680414, -1.856468, 1, 0.1607843, 0, 1,
-1.951347, 0.3530097, 0.5090021, 1, 0.1686275, 0, 1,
-1.930764, -0.2126968, -0.3931561, 1, 0.172549, 0, 1,
-1.907132, -0.4143712, -1.765742, 1, 0.1803922, 0, 1,
-1.901706, 0.2717964, -1.374584, 1, 0.1843137, 0, 1,
-1.88299, -2.992983, -3.001807, 1, 0.1921569, 0, 1,
-1.865225, -1.072079, -1.210634, 1, 0.1960784, 0, 1,
-1.841621, 0.2491471, -1.245603, 1, 0.2039216, 0, 1,
-1.839825, -0.2890877, -0.1309177, 1, 0.2117647, 0, 1,
-1.835004, -0.1097102, -0.2573613, 1, 0.2156863, 0, 1,
-1.825501, -0.0415341, -0.56192, 1, 0.2235294, 0, 1,
-1.818133, 1.000854, -0.7887662, 1, 0.227451, 0, 1,
-1.812446, 0.04055512, -0.4620933, 1, 0.2352941, 0, 1,
-1.800094, -1.435141, -2.693973, 1, 0.2392157, 0, 1,
-1.79875, 1.320088, 0.4344194, 1, 0.2470588, 0, 1,
-1.772752, -0.5798256, -3.294198, 1, 0.2509804, 0, 1,
-1.770734, 1.086367, -1.834645, 1, 0.2588235, 0, 1,
-1.739687, -0.1076593, -0.3853949, 1, 0.2627451, 0, 1,
-1.729829, -0.8601981, -1.266086, 1, 0.2705882, 0, 1,
-1.723361, 0.9197236, -1.745644, 1, 0.2745098, 0, 1,
-1.712632, -0.2995887, -1.110868, 1, 0.282353, 0, 1,
-1.710554, 0.5714154, -2.169316, 1, 0.2862745, 0, 1,
-1.703925, 0.698394, -1.310446, 1, 0.2941177, 0, 1,
-1.694313, -0.5480396, -3.340329, 1, 0.3019608, 0, 1,
-1.693281, 1.494827, 0.1387688, 1, 0.3058824, 0, 1,
-1.687525, 0.6420349, -1.562976, 1, 0.3137255, 0, 1,
-1.683969, 1.683414, 1.131945, 1, 0.3176471, 0, 1,
-1.678276, 0.152095, 0.6333846, 1, 0.3254902, 0, 1,
-1.675784, -0.3080562, -1.02218, 1, 0.3294118, 0, 1,
-1.667472, 0.7757293, 0.4154505, 1, 0.3372549, 0, 1,
-1.641836, -0.1435175, -2.369683, 1, 0.3411765, 0, 1,
-1.628085, -0.8412451, -2.832804, 1, 0.3490196, 0, 1,
-1.621005, -0.3653484, -1.243418, 1, 0.3529412, 0, 1,
-1.618116, -1.061205, 0.008636347, 1, 0.3607843, 0, 1,
-1.615844, -1.533812, -1.04838, 1, 0.3647059, 0, 1,
-1.604045, -0.1209241, -0.2205717, 1, 0.372549, 0, 1,
-1.587136, 0.9583894, -1.649933, 1, 0.3764706, 0, 1,
-1.586632, -0.5849833, -1.413884, 1, 0.3843137, 0, 1,
-1.586246, -0.04803659, 0.4945674, 1, 0.3882353, 0, 1,
-1.579105, -0.2499075, -1.318323, 1, 0.3960784, 0, 1,
-1.568837, 0.0598391, -3.530373, 1, 0.4039216, 0, 1,
-1.561522, 0.09072521, -1.032065, 1, 0.4078431, 0, 1,
-1.552628, -0.4347209, -0.5219693, 1, 0.4156863, 0, 1,
-1.545818, -0.9671283, -2.519187, 1, 0.4196078, 0, 1,
-1.542736, 1.556162, -0.9612883, 1, 0.427451, 0, 1,
-1.539843, -2.94104, -2.217286, 1, 0.4313726, 0, 1,
-1.538428, 1.2566, -1.459294, 1, 0.4392157, 0, 1,
-1.537319, 0.3032757, -0.9532551, 1, 0.4431373, 0, 1,
-1.532537, 0.07271232, -0.6091294, 1, 0.4509804, 0, 1,
-1.523669, 0.7355543, 0.3455293, 1, 0.454902, 0, 1,
-1.518248, -1.605727, -4.234767, 1, 0.4627451, 0, 1,
-1.517725, 1.576079, -0.3028774, 1, 0.4666667, 0, 1,
-1.487376, 1.646063, -0.131683, 1, 0.4745098, 0, 1,
-1.474277, -0.5981843, -1.749834, 1, 0.4784314, 0, 1,
-1.468211, 0.7945948, 1.492375, 1, 0.4862745, 0, 1,
-1.454241, 0.5121166, -1.875371, 1, 0.4901961, 0, 1,
-1.449889, 0.1788789, -1.415341, 1, 0.4980392, 0, 1,
-1.435665, 0.2054788, -0.9771298, 1, 0.5058824, 0, 1,
-1.409938, 1.218868, -1.300341, 1, 0.509804, 0, 1,
-1.407749, -0.1762312, -2.210787, 1, 0.5176471, 0, 1,
-1.396149, -0.9944418, -3.967283, 1, 0.5215687, 0, 1,
-1.392514, 1.256356, 0.5177517, 1, 0.5294118, 0, 1,
-1.38617, -0.7265492, -1.342517, 1, 0.5333334, 0, 1,
-1.382716, 0.268522, -1.981914, 1, 0.5411765, 0, 1,
-1.371336, 0.09530081, -1.111137, 1, 0.5450981, 0, 1,
-1.362242, -0.2098001, -3.48656, 1, 0.5529412, 0, 1,
-1.359395, -0.1662484, -1.545053, 1, 0.5568628, 0, 1,
-1.350426, -0.4032966, -0.9569651, 1, 0.5647059, 0, 1,
-1.348987, -1.361947, -1.468685, 1, 0.5686275, 0, 1,
-1.341206, -1.804289, -2.163209, 1, 0.5764706, 0, 1,
-1.339781, -0.9034199, -2.220642, 1, 0.5803922, 0, 1,
-1.335291, -1.383863, -3.632005, 1, 0.5882353, 0, 1,
-1.331448, 1.11015, -2.215533, 1, 0.5921569, 0, 1,
-1.324327, -0.7217268, -1.364353, 1, 0.6, 0, 1,
-1.320304, 0.7788469, -0.7794024, 1, 0.6078432, 0, 1,
-1.299363, -1.029763, -1.692869, 1, 0.6117647, 0, 1,
-1.297337, 0.2762903, -0.661356, 1, 0.6196079, 0, 1,
-1.295088, 0.1045059, 0.05951597, 1, 0.6235294, 0, 1,
-1.294444, 0.668798, -2.854209, 1, 0.6313726, 0, 1,
-1.290184, -1.443672, -0.9689847, 1, 0.6352941, 0, 1,
-1.288979, 0.839322, -0.5168676, 1, 0.6431373, 0, 1,
-1.288833, -0.198463, -1.027358, 1, 0.6470588, 0, 1,
-1.286021, -1.546579, -0.3015747, 1, 0.654902, 0, 1,
-1.283178, 0.2928201, -0.03324752, 1, 0.6588235, 0, 1,
-1.277198, 1.491597, -0.4519064, 1, 0.6666667, 0, 1,
-1.272952, 0.4405879, -1.283714, 1, 0.6705883, 0, 1,
-1.270806, -0.704915, -0.2207598, 1, 0.6784314, 0, 1,
-1.257912, -1.679403, -5.240555, 1, 0.682353, 0, 1,
-1.257303, 0.8401498, 0.1786697, 1, 0.6901961, 0, 1,
-1.256005, 0.3606876, -0.2966126, 1, 0.6941177, 0, 1,
-1.255691, 1.688503, -0.7298222, 1, 0.7019608, 0, 1,
-1.255195, 0.5456226, -1.36272, 1, 0.7098039, 0, 1,
-1.253311, -0.665003, -4.190339, 1, 0.7137255, 0, 1,
-1.2524, -0.9810855, -3.328551, 1, 0.7215686, 0, 1,
-1.245386, 1.914911, -1.430482, 1, 0.7254902, 0, 1,
-1.215557, 0.1621199, -1.224177, 1, 0.7333333, 0, 1,
-1.214256, -0.10431, -0.1576804, 1, 0.7372549, 0, 1,
-1.210804, -0.2108253, -3.596911, 1, 0.7450981, 0, 1,
-1.197068, -1.361316, -2.686226, 1, 0.7490196, 0, 1,
-1.191325, 0.268521, -1.497778, 1, 0.7568628, 0, 1,
-1.186788, 0.2305795, -2.249525, 1, 0.7607843, 0, 1,
-1.177891, 1.055857, -1.410549, 1, 0.7686275, 0, 1,
-1.167386, -0.3040249, -1.671373, 1, 0.772549, 0, 1,
-1.165096, -0.7504782, -1.623283, 1, 0.7803922, 0, 1,
-1.160446, -3.330757, -4.434691, 1, 0.7843137, 0, 1,
-1.152281, -0.8614303, -2.102865, 1, 0.7921569, 0, 1,
-1.15206, -2.032154, -3.236128, 1, 0.7960784, 0, 1,
-1.149653, -1.164573, -1.786737, 1, 0.8039216, 0, 1,
-1.148314, -0.4655965, -1.461472, 1, 0.8117647, 0, 1,
-1.135596, -0.3033316, -2.072044, 1, 0.8156863, 0, 1,
-1.130237, -0.4654308, -1.242079, 1, 0.8235294, 0, 1,
-1.125395, 1.078617, -1.012628, 1, 0.827451, 0, 1,
-1.110029, -1.236583, -2.351294, 1, 0.8352941, 0, 1,
-1.105768, 1.291188, -0.5553954, 1, 0.8392157, 0, 1,
-1.099891, 0.8538965, -0.3943858, 1, 0.8470588, 0, 1,
-1.098244, -0.2894764, -1.959858, 1, 0.8509804, 0, 1,
-1.09243, -0.9792037, -3.953267, 1, 0.8588235, 0, 1,
-1.088704, -1.877833, -3.370748, 1, 0.8627451, 0, 1,
-1.085626, -1.205555, -2.347007, 1, 0.8705882, 0, 1,
-1.083341, 0.4753949, -1.304133, 1, 0.8745098, 0, 1,
-1.08035, 0.3374698, -2.412881, 1, 0.8823529, 0, 1,
-1.077628, 0.6938736, -2.047609, 1, 0.8862745, 0, 1,
-1.06294, 0.3278687, -1.462533, 1, 0.8941177, 0, 1,
-1.050495, -0.1159486, -0.1893359, 1, 0.8980392, 0, 1,
-1.047747, 1.308967, -0.7366768, 1, 0.9058824, 0, 1,
-1.038473, -1.483472, -1.512595, 1, 0.9137255, 0, 1,
-1.038336, -0.3101831, -2.676762, 1, 0.9176471, 0, 1,
-1.023802, -1.301569, -1.679774, 1, 0.9254902, 0, 1,
-1.020903, 1.198306, 0.7255117, 1, 0.9294118, 0, 1,
-1.012306, 0.6860344, 0.8510535, 1, 0.9372549, 0, 1,
-1.011737, -2.772763, -1.754502, 1, 0.9411765, 0, 1,
-1.01054, -1.512364, -2.796499, 1, 0.9490196, 0, 1,
-1.001094, 0.07926406, -1.804796, 1, 0.9529412, 0, 1,
-0.9916929, -1.548585, -2.059336, 1, 0.9607843, 0, 1,
-0.9884405, 0.7517176, -1.671883, 1, 0.9647059, 0, 1,
-0.986917, -0.5367885, -2.360594, 1, 0.972549, 0, 1,
-0.9866647, 2.935545, -0.3366049, 1, 0.9764706, 0, 1,
-0.9802238, -0.7784929, -4.503338, 1, 0.9843137, 0, 1,
-0.9673997, -0.96334, -2.506455, 1, 0.9882353, 0, 1,
-0.9667646, -0.4718658, -1.989367, 1, 0.9960784, 0, 1,
-0.9623181, 0.8776237, -2.45739, 0.9960784, 1, 0, 1,
-0.9556362, -0.8265851, -2.993204, 0.9921569, 1, 0, 1,
-0.9473431, -0.7356998, -1.696479, 0.9843137, 1, 0, 1,
-0.9429199, -1.146383, -1.383938, 0.9803922, 1, 0, 1,
-0.9412333, 0.4953585, -0.100481, 0.972549, 1, 0, 1,
-0.9408919, 1.080928, -1.322232, 0.9686275, 1, 0, 1,
-0.9357861, -1.442946, -1.924839, 0.9607843, 1, 0, 1,
-0.9336362, -0.2315948, -2.059994, 0.9568627, 1, 0, 1,
-0.9333761, -0.4294084, -1.913939, 0.9490196, 1, 0, 1,
-0.9308544, -2.033899, -3.069911, 0.945098, 1, 0, 1,
-0.9289486, -1.36015, -2.736718, 0.9372549, 1, 0, 1,
-0.9225487, -0.827311, -2.452361, 0.9333333, 1, 0, 1,
-0.9220141, -1.72824, -2.517144, 0.9254902, 1, 0, 1,
-0.919919, 0.7674077, -1.534276, 0.9215686, 1, 0, 1,
-0.9159622, 1.161041, -2.228378, 0.9137255, 1, 0, 1,
-0.9142652, 0.8093666, 0.2760903, 0.9098039, 1, 0, 1,
-0.9096635, 1.303609, 0.2462953, 0.9019608, 1, 0, 1,
-0.9077334, 2.480209, -2.03597, 0.8941177, 1, 0, 1,
-0.9066572, 1.76366, 0.08115114, 0.8901961, 1, 0, 1,
-0.8998232, -1.492649, -2.44975, 0.8823529, 1, 0, 1,
-0.8923075, 0.03950825, -2.144398, 0.8784314, 1, 0, 1,
-0.8879419, -0.477087, 0.1976866, 0.8705882, 1, 0, 1,
-0.8856693, -0.7932111, -2.111452, 0.8666667, 1, 0, 1,
-0.8816092, 2.238477, -0.7897968, 0.8588235, 1, 0, 1,
-0.8806492, 1.128606, -0.3029525, 0.854902, 1, 0, 1,
-0.8800013, -1.415361, -3.911206, 0.8470588, 1, 0, 1,
-0.8730057, -0.06989002, -3.083342, 0.8431373, 1, 0, 1,
-0.8666162, 0.5297121, -1.15291, 0.8352941, 1, 0, 1,
-0.8626068, -0.2568177, -3.104379, 0.8313726, 1, 0, 1,
-0.8622164, -0.9741033, -2.161756, 0.8235294, 1, 0, 1,
-0.8603873, 1.007664, -0.3289433, 0.8196079, 1, 0, 1,
-0.8479835, 0.09459442, -1.086948, 0.8117647, 1, 0, 1,
-0.8430619, -0.4354778, -0.9962727, 0.8078431, 1, 0, 1,
-0.8426435, 0.1380314, -1.434035, 0.8, 1, 0, 1,
-0.8384586, -1.332352, -1.720441, 0.7921569, 1, 0, 1,
-0.836679, -0.2521491, -0.30751, 0.7882353, 1, 0, 1,
-0.8292971, 1.035761, -0.406473, 0.7803922, 1, 0, 1,
-0.8225138, -0.425377, -3.160712, 0.7764706, 1, 0, 1,
-0.8091874, 0.6499612, 0.1116844, 0.7686275, 1, 0, 1,
-0.803111, -0.4808631, -1.592372, 0.7647059, 1, 0, 1,
-0.7981249, -0.1211013, -1.134974, 0.7568628, 1, 0, 1,
-0.7975828, 0.3785881, 0.1894386, 0.7529412, 1, 0, 1,
-0.7953433, -2.201251, -2.259606, 0.7450981, 1, 0, 1,
-0.7908707, -0.6931373, -2.164961, 0.7411765, 1, 0, 1,
-0.787845, -1.082875, -3.54881, 0.7333333, 1, 0, 1,
-0.7837677, 0.7263151, -0.6252391, 0.7294118, 1, 0, 1,
-0.7836231, 0.8213766, -1.496056, 0.7215686, 1, 0, 1,
-0.7819662, -0.3520704, -2.006361, 0.7176471, 1, 0, 1,
-0.781039, 2.592561, -0.6739802, 0.7098039, 1, 0, 1,
-0.7779756, 0.8943195, -1.121374, 0.7058824, 1, 0, 1,
-0.7747833, -0.860615, -3.968615, 0.6980392, 1, 0, 1,
-0.769682, -0.01013826, -2.356076, 0.6901961, 1, 0, 1,
-0.7587402, 0.3416414, -2.062268, 0.6862745, 1, 0, 1,
-0.7465842, 1.724925, 0.9893636, 0.6784314, 1, 0, 1,
-0.7436004, -1.066192, -4.613059, 0.6745098, 1, 0, 1,
-0.7435992, -0.8854358, -2.610457, 0.6666667, 1, 0, 1,
-0.7405558, -0.5271931, -0.4611735, 0.6627451, 1, 0, 1,
-0.7387325, -0.0009156, -2.772602, 0.654902, 1, 0, 1,
-0.7317278, -0.09826511, -2.062869, 0.6509804, 1, 0, 1,
-0.7298312, 1.16333, 0.04351538, 0.6431373, 1, 0, 1,
-0.7282571, -0.9113086, -2.574175, 0.6392157, 1, 0, 1,
-0.7201343, -0.4613768, -1.838975, 0.6313726, 1, 0, 1,
-0.7159342, 0.001098653, -2.524276, 0.627451, 1, 0, 1,
-0.7140037, -0.5161036, -3.607955, 0.6196079, 1, 0, 1,
-0.7120104, -0.202874, -3.172534, 0.6156863, 1, 0, 1,
-0.7111746, 0.2862026, -0.9444185, 0.6078432, 1, 0, 1,
-0.7107328, -0.4064492, -3.555974, 0.6039216, 1, 0, 1,
-0.7094859, 0.03641304, -1.583584, 0.5960785, 1, 0, 1,
-0.7082248, 0.6253881, -1.813935, 0.5882353, 1, 0, 1,
-0.7075209, 0.1651412, -1.200686, 0.5843138, 1, 0, 1,
-0.7016815, -0.7274663, -3.00862, 0.5764706, 1, 0, 1,
-0.7010522, -0.0102893, 0.007825216, 0.572549, 1, 0, 1,
-0.6993217, 1.962075, -1.381753, 0.5647059, 1, 0, 1,
-0.6857035, 0.5784472, -0.7118804, 0.5607843, 1, 0, 1,
-0.6850351, 0.2200616, -3.060512, 0.5529412, 1, 0, 1,
-0.683333, 0.9769955, -0.4065358, 0.5490196, 1, 0, 1,
-0.6827741, -0.9661528, -2.692194, 0.5411765, 1, 0, 1,
-0.6759913, -1.670902, -1.975831, 0.5372549, 1, 0, 1,
-0.6741464, -2.012084, -3.367879, 0.5294118, 1, 0, 1,
-0.6703171, -2.256865, -2.868681, 0.5254902, 1, 0, 1,
-0.6697918, 2.198169, 2.228913, 0.5176471, 1, 0, 1,
-0.6688916, 0.3138541, -0.9412817, 0.5137255, 1, 0, 1,
-0.6557501, -0.8190687, -3.564509, 0.5058824, 1, 0, 1,
-0.6501141, -0.2108425, -2.153612, 0.5019608, 1, 0, 1,
-0.6492712, 0.9214782, -2.083822, 0.4941176, 1, 0, 1,
-0.6475945, 0.4637641, -1.612036, 0.4862745, 1, 0, 1,
-0.6444257, -0.2615779, -2.848071, 0.4823529, 1, 0, 1,
-0.6424754, -0.2562497, -2.042985, 0.4745098, 1, 0, 1,
-0.6408359, 1.421313, -0.5918477, 0.4705882, 1, 0, 1,
-0.6328875, -1.206928, -2.309026, 0.4627451, 1, 0, 1,
-0.6311598, 0.6238832, 0.3691607, 0.4588235, 1, 0, 1,
-0.6284932, -0.1163924, -3.78948, 0.4509804, 1, 0, 1,
-0.6228058, 0.04984249, -1.499805, 0.4470588, 1, 0, 1,
-0.6222348, 0.750473, -2.07598, 0.4392157, 1, 0, 1,
-0.6186508, 0.2753459, -1.316125, 0.4352941, 1, 0, 1,
-0.6182187, -0.2148335, -3.638986, 0.427451, 1, 0, 1,
-0.6181547, 1.581536, -0.1559552, 0.4235294, 1, 0, 1,
-0.61336, 0.3725278, -1.319486, 0.4156863, 1, 0, 1,
-0.6121061, -0.6659997, -3.844986, 0.4117647, 1, 0, 1,
-0.6114229, -0.9658555, -1.806092, 0.4039216, 1, 0, 1,
-0.6030486, 0.8226014, -1.904568, 0.3960784, 1, 0, 1,
-0.6021798, -0.08387002, -3.423022, 0.3921569, 1, 0, 1,
-0.5973942, 1.498219, -1.532881, 0.3843137, 1, 0, 1,
-0.5960439, 1.098303, 1.265925, 0.3803922, 1, 0, 1,
-0.5905355, 0.09617412, -2.033825, 0.372549, 1, 0, 1,
-0.5903606, -0.2692456, -2.974219, 0.3686275, 1, 0, 1,
-0.5811743, 1.070788, 0.3878694, 0.3607843, 1, 0, 1,
-0.5810765, -0.2583058, -1.027327, 0.3568628, 1, 0, 1,
-0.580955, 0.09772792, -1.417987, 0.3490196, 1, 0, 1,
-0.5774106, 1.168245, 0.9050384, 0.345098, 1, 0, 1,
-0.5742634, -0.5367733, -2.572012, 0.3372549, 1, 0, 1,
-0.5727477, -1.648507, -3.197654, 0.3333333, 1, 0, 1,
-0.5718516, -0.4334003, -2.832642, 0.3254902, 1, 0, 1,
-0.5690915, 1.072366, -0.3224285, 0.3215686, 1, 0, 1,
-0.5631886, 0.78577, -0.2022518, 0.3137255, 1, 0, 1,
-0.5624983, 1.140769, -0.6930265, 0.3098039, 1, 0, 1,
-0.559825, 0.5096021, -0.3753124, 0.3019608, 1, 0, 1,
-0.5507987, 0.6968895, -1.576986, 0.2941177, 1, 0, 1,
-0.5485985, 0.6032865, -0.08765765, 0.2901961, 1, 0, 1,
-0.5469766, 0.3315089, -0.9676502, 0.282353, 1, 0, 1,
-0.5460425, -0.2081291, 0.3899702, 0.2784314, 1, 0, 1,
-0.5428004, 0.6843519, -2.310874, 0.2705882, 1, 0, 1,
-0.5333278, 0.6860232, 0.2185847, 0.2666667, 1, 0, 1,
-0.5303587, 0.156116, -1.50803, 0.2588235, 1, 0, 1,
-0.5249381, 0.1291447, -2.334165, 0.254902, 1, 0, 1,
-0.5218085, -0.1169151, -3.122644, 0.2470588, 1, 0, 1,
-0.5217833, 1.294648, 0.1448404, 0.2431373, 1, 0, 1,
-0.5211179, -0.7101676, -1.580985, 0.2352941, 1, 0, 1,
-0.5187597, -1.624217, -3.423093, 0.2313726, 1, 0, 1,
-0.5170724, -1.196552, -2.022417, 0.2235294, 1, 0, 1,
-0.516351, 0.7816622, -0.7015595, 0.2196078, 1, 0, 1,
-0.5146436, -1.483645, -3.089731, 0.2117647, 1, 0, 1,
-0.5143189, 0.3453201, -1.429036, 0.2078431, 1, 0, 1,
-0.512525, 0.5087869, -2.656209, 0.2, 1, 0, 1,
-0.5118161, -0.3421186, -4.20672, 0.1921569, 1, 0, 1,
-0.5108824, 0.1189123, -0.8671516, 0.1882353, 1, 0, 1,
-0.5096478, -1.552397, -2.721149, 0.1803922, 1, 0, 1,
-0.5046294, 1.812413, 0.7013978, 0.1764706, 1, 0, 1,
-0.5040098, -0.1349843, -2.973272, 0.1686275, 1, 0, 1,
-0.4975949, 0.7348984, -0.02464785, 0.1647059, 1, 0, 1,
-0.4969867, 0.08122763, -1.198673, 0.1568628, 1, 0, 1,
-0.4897059, 0.2350426, -1.17989, 0.1529412, 1, 0, 1,
-0.4891493, 0.1606586, -2.410822, 0.145098, 1, 0, 1,
-0.4871489, -0.4181133, -2.129281, 0.1411765, 1, 0, 1,
-0.4856022, -0.09141122, -1.115241, 0.1333333, 1, 0, 1,
-0.4839211, 1.000956, 0.6185989, 0.1294118, 1, 0, 1,
-0.4809604, 0.4158288, 0.01365166, 0.1215686, 1, 0, 1,
-0.4804503, 0.7969887, -0.4435247, 0.1176471, 1, 0, 1,
-0.4765033, -1.855234, -2.631967, 0.1098039, 1, 0, 1,
-0.4754901, 0.6750925, -1.209447, 0.1058824, 1, 0, 1,
-0.4740106, -0.4918443, -2.48566, 0.09803922, 1, 0, 1,
-0.4702495, 2.095385, -0.946761, 0.09019608, 1, 0, 1,
-0.4696174, 0.7004977, -0.8483181, 0.08627451, 1, 0, 1,
-0.4677367, 0.5837818, -0.5958886, 0.07843138, 1, 0, 1,
-0.4591064, 0.1622414, -1.629069, 0.07450981, 1, 0, 1,
-0.4494263, 0.1674826, 0.1446794, 0.06666667, 1, 0, 1,
-0.4417638, -0.1783784, -0.9830124, 0.0627451, 1, 0, 1,
-0.4394701, -0.8877115, -1.384747, 0.05490196, 1, 0, 1,
-0.4361843, -0.05450999, -0.3658357, 0.05098039, 1, 0, 1,
-0.4343364, -0.4440542, -2.998945, 0.04313726, 1, 0, 1,
-0.4313498, -1.272741, -1.424571, 0.03921569, 1, 0, 1,
-0.42703, -0.8389509, -3.663512, 0.03137255, 1, 0, 1,
-0.4268915, -0.2228012, -3.333113, 0.02745098, 1, 0, 1,
-0.4261292, -1.172256, -2.901684, 0.01960784, 1, 0, 1,
-0.4228154, 0.5475892, -0.5236141, 0.01568628, 1, 0, 1,
-0.4206967, -0.6002913, -2.811149, 0.007843138, 1, 0, 1,
-0.4206287, 0.2312306, -2.037659, 0.003921569, 1, 0, 1,
-0.4191371, -0.07650671, -1.138316, 0, 1, 0.003921569, 1,
-0.4131364, 0.8529038, -0.2831845, 0, 1, 0.01176471, 1,
-0.4112445, -0.02690751, -1.022847, 0, 1, 0.01568628, 1,
-0.402535, -1.436192, -2.847731, 0, 1, 0.02352941, 1,
-0.4021221, -1.524764, -2.162411, 0, 1, 0.02745098, 1,
-0.3987832, 0.6910034, -1.386014, 0, 1, 0.03529412, 1,
-0.3961664, -0.5125199, -3.286797, 0, 1, 0.03921569, 1,
-0.3954728, 0.333469, 1.134645, 0, 1, 0.04705882, 1,
-0.393252, 0.04026329, -1.438851, 0, 1, 0.05098039, 1,
-0.3904742, -0.4872835, -2.903116, 0, 1, 0.05882353, 1,
-0.3902578, 0.3616253, -1.308304, 0, 1, 0.0627451, 1,
-0.3854825, 0.4755373, -0.3613612, 0, 1, 0.07058824, 1,
-0.3837109, -1.45009, -1.851951, 0, 1, 0.07450981, 1,
-0.3809541, 1.486666, 0.5237184, 0, 1, 0.08235294, 1,
-0.378087, -0.7457002, -2.854913, 0, 1, 0.08627451, 1,
-0.3769762, 0.7783193, 0.1101179, 0, 1, 0.09411765, 1,
-0.3742616, -1.546333, -2.510646, 0, 1, 0.1019608, 1,
-0.3709392, -0.5476531, -3.105204, 0, 1, 0.1058824, 1,
-0.369604, 0.2448577, -1.51872, 0, 1, 0.1137255, 1,
-0.3688951, 1.519297, -1.024225, 0, 1, 0.1176471, 1,
-0.3611182, -1.364396, -3.860297, 0, 1, 0.1254902, 1,
-0.3604242, -0.5617101, -4.466909, 0, 1, 0.1294118, 1,
-0.3602017, -0.6235091, -1.896045, 0, 1, 0.1372549, 1,
-0.3544976, 0.8336512, 0.7210184, 0, 1, 0.1411765, 1,
-0.3523702, 0.6153029, -2.137952, 0, 1, 0.1490196, 1,
-0.3497144, 1.306684, -1.091761, 0, 1, 0.1529412, 1,
-0.3470479, 0.1883248, -0.6784554, 0, 1, 0.1607843, 1,
-0.3413984, -0.3228681, -1.931504, 0, 1, 0.1647059, 1,
-0.3377877, -0.4509732, -1.812254, 0, 1, 0.172549, 1,
-0.3333364, -1.166578, -1.965972, 0, 1, 0.1764706, 1,
-0.330715, 0.82744, -2.214876, 0, 1, 0.1843137, 1,
-0.3296481, -0.7271519, -1.372453, 0, 1, 0.1882353, 1,
-0.3197274, -0.1684148, -0.04886313, 0, 1, 0.1960784, 1,
-0.3181385, 0.5729051, -1.831293, 0, 1, 0.2039216, 1,
-0.3180511, 1.273687, -0.5620891, 0, 1, 0.2078431, 1,
-0.3172632, -0.2214956, -2.263077, 0, 1, 0.2156863, 1,
-0.3148364, 1.12681, 1.656006, 0, 1, 0.2196078, 1,
-0.3142216, 0.4519144, -0.51066, 0, 1, 0.227451, 1,
-0.3130259, 0.209779, 0.0277164, 0, 1, 0.2313726, 1,
-0.3111926, 1.375333, 1.644918, 0, 1, 0.2392157, 1,
-0.3059384, 0.3744371, 0.1870988, 0, 1, 0.2431373, 1,
-0.3026336, 0.3635804, -2.222191, 0, 1, 0.2509804, 1,
-0.2955188, -0.3444513, -1.797863, 0, 1, 0.254902, 1,
-0.2869747, -1.139178, -4.056968, 0, 1, 0.2627451, 1,
-0.2855076, 0.2918754, -0.2124007, 0, 1, 0.2666667, 1,
-0.2849783, -1.071965, -4.007063, 0, 1, 0.2745098, 1,
-0.2834098, -1.585978, -4.163854, 0, 1, 0.2784314, 1,
-0.2830506, 1.354, -0.8071498, 0, 1, 0.2862745, 1,
-0.2828485, -0.4807718, -2.154662, 0, 1, 0.2901961, 1,
-0.2793624, -1.176374, -4.209951, 0, 1, 0.2980392, 1,
-0.2791044, -0.7563233, -1.350114, 0, 1, 0.3058824, 1,
-0.2787365, -0.3018385, -3.245983, 0, 1, 0.3098039, 1,
-0.2775135, 0.4187911, -2.229472, 0, 1, 0.3176471, 1,
-0.2771605, 0.2864833, -0.2050294, 0, 1, 0.3215686, 1,
-0.2755661, -0.1835199, -2.686514, 0, 1, 0.3294118, 1,
-0.2745793, -0.3800323, -2.071471, 0, 1, 0.3333333, 1,
-0.2726948, 1.080067, -1.196116, 0, 1, 0.3411765, 1,
-0.2708822, -0.2048857, -1.838739, 0, 1, 0.345098, 1,
-0.2698502, 0.1893917, -1.488398, 0, 1, 0.3529412, 1,
-0.2692026, -0.2681341, -3.086104, 0, 1, 0.3568628, 1,
-0.2629727, -0.441263, -1.894356, 0, 1, 0.3647059, 1,
-0.2611158, 0.1125544, -0.4640492, 0, 1, 0.3686275, 1,
-0.2528515, -0.01611327, -0.4542612, 0, 1, 0.3764706, 1,
-0.2503354, -1.027009, -2.691827, 0, 1, 0.3803922, 1,
-0.2458826, -1.21905, -2.238905, 0, 1, 0.3882353, 1,
-0.2387973, -2.005077, -4.640757, 0, 1, 0.3921569, 1,
-0.2386603, 0.1565107, -0.8211208, 0, 1, 0.4, 1,
-0.2380144, -0.2381572, -2.839939, 0, 1, 0.4078431, 1,
-0.2378679, 0.4180869, -0.997828, 0, 1, 0.4117647, 1,
-0.2368, -1.612885, -2.847992, 0, 1, 0.4196078, 1,
-0.233655, -0.7444345, -3.199982, 0, 1, 0.4235294, 1,
-0.2284302, -0.02145138, -3.429903, 0, 1, 0.4313726, 1,
-0.2253879, 0.1074457, -2.068736, 0, 1, 0.4352941, 1,
-0.2226873, -0.1831104, -1.973448, 0, 1, 0.4431373, 1,
-0.2183022, -0.2144, -0.7149704, 0, 1, 0.4470588, 1,
-0.2172984, -0.5016868, -2.802827, 0, 1, 0.454902, 1,
-0.2169908, -0.8360423, -2.21332, 0, 1, 0.4588235, 1,
-0.2150133, 2.941775, -1.289972, 0, 1, 0.4666667, 1,
-0.2143973, 1.117123, 1.81975, 0, 1, 0.4705882, 1,
-0.2143535, -1.504796, -3.326851, 0, 1, 0.4784314, 1,
-0.2108364, -1.676889, -2.781473, 0, 1, 0.4823529, 1,
-0.2075565, -1.928593, -4.853562, 0, 1, 0.4901961, 1,
-0.2049679, 0.9246393, -0.1786407, 0, 1, 0.4941176, 1,
-0.2049369, 0.6183051, -1.026852, 0, 1, 0.5019608, 1,
-0.1990674, -0.5920064, -1.673813, 0, 1, 0.509804, 1,
-0.1985081, 1.053235, -0.8511407, 0, 1, 0.5137255, 1,
-0.1975762, 0.3467332, 0.5851087, 0, 1, 0.5215687, 1,
-0.1973205, -1.413958, -2.360408, 0, 1, 0.5254902, 1,
-0.1947715, 0.3902133, 1.068575, 0, 1, 0.5333334, 1,
-0.1904299, -0.961345, -1.923634, 0, 1, 0.5372549, 1,
-0.1899843, -1.213905, -2.507865, 0, 1, 0.5450981, 1,
-0.1895006, -0.3779059, -1.93769, 0, 1, 0.5490196, 1,
-0.18709, -1.905999, -1.767499, 0, 1, 0.5568628, 1,
-0.1868541, 0.3048305, 0.9911115, 0, 1, 0.5607843, 1,
-0.185389, 0.2328622, -2.001259, 0, 1, 0.5686275, 1,
-0.1844535, -1.166098, -2.02404, 0, 1, 0.572549, 1,
-0.181553, -1.084349, -2.417372, 0, 1, 0.5803922, 1,
-0.1766416, -0.8195786, -1.240848, 0, 1, 0.5843138, 1,
-0.1737532, 0.1805303, -0.7674474, 0, 1, 0.5921569, 1,
-0.1729448, -0.8718629, -3.467173, 0, 1, 0.5960785, 1,
-0.1725169, 0.4541839, -0.1622711, 0, 1, 0.6039216, 1,
-0.1677837, 0.3559476, -0.8039597, 0, 1, 0.6117647, 1,
-0.1647662, 0.1190042, -0.5495892, 0, 1, 0.6156863, 1,
-0.163726, 0.9102067, 0.09209926, 0, 1, 0.6235294, 1,
-0.161252, 0.8140919, -0.06839437, 0, 1, 0.627451, 1,
-0.1598438, -1.23378, -2.508703, 0, 1, 0.6352941, 1,
-0.157488, -1.334831, -3.180352, 0, 1, 0.6392157, 1,
-0.155643, 0.2498865, -1.223763, 0, 1, 0.6470588, 1,
-0.1552634, -1.084135, -2.391278, 0, 1, 0.6509804, 1,
-0.1527376, 1.094966, -0.524124, 0, 1, 0.6588235, 1,
-0.152641, -0.5708508, -2.23572, 0, 1, 0.6627451, 1,
-0.1511443, 0.7385451, 1.847572, 0, 1, 0.6705883, 1,
-0.1494839, 0.902557, -0.9265063, 0, 1, 0.6745098, 1,
-0.1460844, 0.2697905, -0.1764611, 0, 1, 0.682353, 1,
-0.1423371, 0.5601118, -1.268949, 0, 1, 0.6862745, 1,
-0.1398696, 0.7296575, 0.8493019, 0, 1, 0.6941177, 1,
-0.1386861, -1.311456, -3.645774, 0, 1, 0.7019608, 1,
-0.1306198, -1.039311, -2.14147, 0, 1, 0.7058824, 1,
-0.1237108, 1.429334, -0.8194278, 0, 1, 0.7137255, 1,
-0.1209204, -2.228578, -3.105511, 0, 1, 0.7176471, 1,
-0.1175742, 0.9566535, 0.4769912, 0, 1, 0.7254902, 1,
-0.1129858, 0.9268438, -0.3562063, 0, 1, 0.7294118, 1,
-0.1122544, -0.6211232, -2.574696, 0, 1, 0.7372549, 1,
-0.1098541, -1.40659, -2.538421, 0, 1, 0.7411765, 1,
-0.1047354, -0.2156098, -1.235772, 0, 1, 0.7490196, 1,
-0.1033768, 1.115475, -0.3420476, 0, 1, 0.7529412, 1,
-0.09284144, 0.478531, -0.9302516, 0, 1, 0.7607843, 1,
-0.09133392, 0.740486, 0.3415213, 0, 1, 0.7647059, 1,
-0.0913175, -1.839163, -2.013348, 0, 1, 0.772549, 1,
-0.0870384, 0.09267677, -2.074893, 0, 1, 0.7764706, 1,
-0.08382989, 0.8904189, 0.2976586, 0, 1, 0.7843137, 1,
-0.08129545, 1.692269, 0.3758948, 0, 1, 0.7882353, 1,
-0.0799016, -1.740631, -2.827692, 0, 1, 0.7960784, 1,
-0.07951327, 1.854685, 0.6857847, 0, 1, 0.8039216, 1,
-0.07837988, 0.06297381, -1.026213, 0, 1, 0.8078431, 1,
-0.07667694, 0.281344, 0.2057973, 0, 1, 0.8156863, 1,
-0.07635937, -0.4364791, -1.239945, 0, 1, 0.8196079, 1,
-0.07122205, 1.265036, -0.2534846, 0, 1, 0.827451, 1,
-0.06769457, -0.709312, -1.688555, 0, 1, 0.8313726, 1,
-0.06320071, 1.281445, -1.457684, 0, 1, 0.8392157, 1,
-0.05373342, 1.046307, 1.931477, 0, 1, 0.8431373, 1,
-0.05370935, 0.4811592, -1.037858, 0, 1, 0.8509804, 1,
-0.05184087, -1.184868, -1.084117, 0, 1, 0.854902, 1,
-0.04501231, -0.5426956, -3.359089, 0, 1, 0.8627451, 1,
-0.04485938, 1.780464, -1.666883, 0, 1, 0.8666667, 1,
-0.03879878, -1.33511, -3.142044, 0, 1, 0.8745098, 1,
-0.03413981, -1.102273, -2.029929, 0, 1, 0.8784314, 1,
-0.02903479, 0.7807174, 0.4643639, 0, 1, 0.8862745, 1,
-0.02802077, -0.4588593, -3.077338, 0, 1, 0.8901961, 1,
-0.02497073, -1.061559, -3.218814, 0, 1, 0.8980392, 1,
-0.02351795, 1.081692, 1.26615, 0, 1, 0.9058824, 1,
-0.0232957, -1.499395, -4.1335, 0, 1, 0.9098039, 1,
-0.02191047, 0.7852337, -1.519683, 0, 1, 0.9176471, 1,
-0.02101249, 0.2477598, -0.4118575, 0, 1, 0.9215686, 1,
-0.01240086, 1.019851, -2.301577, 0, 1, 0.9294118, 1,
-0.01107735, 1.967513, -0.7448565, 0, 1, 0.9333333, 1,
-0.01093599, -0.7907567, -3.482548, 0, 1, 0.9411765, 1,
-0.01012833, -0.534404, -2.428488, 0, 1, 0.945098, 1,
-0.007793262, 0.7118349, -0.607398, 0, 1, 0.9529412, 1,
-0.004955681, -0.3319225, -0.4250282, 0, 1, 0.9568627, 1,
-0.004729152, -0.06213479, -2.570041, 0, 1, 0.9647059, 1,
-0.004205072, 0.8952757, -0.7763128, 0, 1, 0.9686275, 1,
-0.003957088, -0.1955468, -2.132254, 0, 1, 0.9764706, 1,
-0.003807804, -0.4787401, -3.381096, 0, 1, 0.9803922, 1,
-0.0013779, -1.611435, -2.73155, 0, 1, 0.9882353, 1,
0.002226867, 0.8078712, -0.2261851, 0, 1, 0.9921569, 1,
0.00235796, 1.151577, 1.938212, 0, 1, 1, 1,
0.003503702, 2.052046, 1.154984, 0, 0.9921569, 1, 1,
0.007410286, 0.3873291, -1.164424, 0, 0.9882353, 1, 1,
0.01332131, -0.05741703, 2.381905, 0, 0.9803922, 1, 1,
0.01974113, -1.539178, 3.710098, 0, 0.9764706, 1, 1,
0.02228201, 2.760225, -1.316653, 0, 0.9686275, 1, 1,
0.02296716, 1.770901, -2.439003, 0, 0.9647059, 1, 1,
0.02429453, 0.6606767, 0.9490702, 0, 0.9568627, 1, 1,
0.02828144, -0.1302236, 2.363538, 0, 0.9529412, 1, 1,
0.02934481, -2.124898, 3.464787, 0, 0.945098, 1, 1,
0.03314571, 0.3861656, 0.5142725, 0, 0.9411765, 1, 1,
0.03344357, -1.482935, 3.461193, 0, 0.9333333, 1, 1,
0.03447367, -0.3308957, 2.954875, 0, 0.9294118, 1, 1,
0.03684074, -2.050403, 1.759947, 0, 0.9215686, 1, 1,
0.04245113, 0.3325151, 1.063199, 0, 0.9176471, 1, 1,
0.04678237, 0.8285941, 0.1115152, 0, 0.9098039, 1, 1,
0.04749123, -0.162894, 2.491123, 0, 0.9058824, 1, 1,
0.04884426, -0.492294, 1.56447, 0, 0.8980392, 1, 1,
0.05592726, -0.04889966, 2.574637, 0, 0.8901961, 1, 1,
0.05721804, -0.6634507, 4.193659, 0, 0.8862745, 1, 1,
0.05823516, 0.5503699, 0.7386863, 0, 0.8784314, 1, 1,
0.06230826, 0.05037003, -0.01098355, 0, 0.8745098, 1, 1,
0.06483426, -0.1698911, 3.955902, 0, 0.8666667, 1, 1,
0.06841836, 1.08994, 0.5165141, 0, 0.8627451, 1, 1,
0.06987921, 0.5038356, 1.094213, 0, 0.854902, 1, 1,
0.07076258, 0.2103013, -0.7804107, 0, 0.8509804, 1, 1,
0.07280132, 0.6594495, 0.6800196, 0, 0.8431373, 1, 1,
0.07508036, 0.8282194, -0.8224583, 0, 0.8392157, 1, 1,
0.07968109, 0.237077, 1.762221, 0, 0.8313726, 1, 1,
0.08221034, -1.060393, 3.250898, 0, 0.827451, 1, 1,
0.08803048, -0.1905945, 2.9254, 0, 0.8196079, 1, 1,
0.08836479, 0.2607394, -0.2584015, 0, 0.8156863, 1, 1,
0.09180526, -0.2828282, 2.925731, 0, 0.8078431, 1, 1,
0.09471142, -0.8000977, 2.970201, 0, 0.8039216, 1, 1,
0.1020223, -0.9476918, 2.642379, 0, 0.7960784, 1, 1,
0.1044255, 0.7031242, 1.254303, 0, 0.7882353, 1, 1,
0.1055277, -0.6896493, 2.033559, 0, 0.7843137, 1, 1,
0.1185836, -1.164406, 3.249738, 0, 0.7764706, 1, 1,
0.1199573, -0.2314726, 2.823704, 0, 0.772549, 1, 1,
0.1212357, 0.4733078, -0.1541364, 0, 0.7647059, 1, 1,
0.1251905, 1.999513, -0.5060067, 0, 0.7607843, 1, 1,
0.1255169, -0.8366636, 1.857171, 0, 0.7529412, 1, 1,
0.1266494, 0.0005497243, 2.555748, 0, 0.7490196, 1, 1,
0.1283688, 0.09993775, -0.9370386, 0, 0.7411765, 1, 1,
0.1312241, 0.0730123, 0.6562962, 0, 0.7372549, 1, 1,
0.1380318, 0.01395803, 1.310483, 0, 0.7294118, 1, 1,
0.1389007, -0.6138169, 5.096428, 0, 0.7254902, 1, 1,
0.1427367, 1.744192, 2.771448, 0, 0.7176471, 1, 1,
0.147127, 0.1769536, 0.1427125, 0, 0.7137255, 1, 1,
0.1519965, -1.2096, 3.105058, 0, 0.7058824, 1, 1,
0.1623417, -0.8699766, 3.231572, 0, 0.6980392, 1, 1,
0.1633726, -1.148043, 2.947616, 0, 0.6941177, 1, 1,
0.1651714, 0.1010066, 0.8339491, 0, 0.6862745, 1, 1,
0.1665941, 0.8387546, -0.6667563, 0, 0.682353, 1, 1,
0.1674328, 1.774882, -2.308959, 0, 0.6745098, 1, 1,
0.1702993, -0.05437952, 1.722326, 0, 0.6705883, 1, 1,
0.1739453, -0.263722, 3.116513, 0, 0.6627451, 1, 1,
0.1795937, -1.533247, 1.886037, 0, 0.6588235, 1, 1,
0.1851894, -0.4436, 2.268868, 0, 0.6509804, 1, 1,
0.1855681, -0.6928458, 2.301279, 0, 0.6470588, 1, 1,
0.1870555, 0.05660067, 0.00573054, 0, 0.6392157, 1, 1,
0.191238, 1.391388, -0.19407, 0, 0.6352941, 1, 1,
0.1920326, -0.5565498, 2.99166, 0, 0.627451, 1, 1,
0.1941806, -0.3619676, 2.271504, 0, 0.6235294, 1, 1,
0.1948109, 0.2876079, 1.331419, 0, 0.6156863, 1, 1,
0.1951032, -0.837348, 3.473541, 0, 0.6117647, 1, 1,
0.1973705, -0.5162469, 1.4464, 0, 0.6039216, 1, 1,
0.1984002, 0.135561, 0.6897675, 0, 0.5960785, 1, 1,
0.2001196, -0.3045728, 3.073649, 0, 0.5921569, 1, 1,
0.2085526, -1.443706, 2.976061, 0, 0.5843138, 1, 1,
0.2102447, -1.375672, 3.120939, 0, 0.5803922, 1, 1,
0.2153074, -1.965834, 5.006511, 0, 0.572549, 1, 1,
0.2168336, -1.047965, 4.138453, 0, 0.5686275, 1, 1,
0.2174305, 1.439279, -0.02367699, 0, 0.5607843, 1, 1,
0.2189539, -0.845157, 0.7200505, 0, 0.5568628, 1, 1,
0.2194729, -2.205335, 2.890632, 0, 0.5490196, 1, 1,
0.2222299, -0.1574081, 3.62423, 0, 0.5450981, 1, 1,
0.2225666, -1.167201, 4.507346, 0, 0.5372549, 1, 1,
0.227687, 1.097225, -1.512841, 0, 0.5333334, 1, 1,
0.2308497, 0.01654924, 0.9267852, 0, 0.5254902, 1, 1,
0.2346796, 0.3979926, -1.417119, 0, 0.5215687, 1, 1,
0.2354369, -1.448402, 1.562302, 0, 0.5137255, 1, 1,
0.2367086, 0.2270235, 0.561781, 0, 0.509804, 1, 1,
0.2371144, 0.5557321, 0.1813137, 0, 0.5019608, 1, 1,
0.2373771, 1.399711, -0.16009, 0, 0.4941176, 1, 1,
0.2422891, -1.212894, 2.698668, 0, 0.4901961, 1, 1,
0.2443458, -0.9171951, 3.590638, 0, 0.4823529, 1, 1,
0.2467204, -2.176192, 2.359231, 0, 0.4784314, 1, 1,
0.2481955, -1.031707, 1.788917, 0, 0.4705882, 1, 1,
0.2484159, 2.238786, -0.7426705, 0, 0.4666667, 1, 1,
0.2544802, 0.1015249, -0.8835274, 0, 0.4588235, 1, 1,
0.2552478, 2.034781, 1.332976, 0, 0.454902, 1, 1,
0.2581476, -0.9532943, 1.75905, 0, 0.4470588, 1, 1,
0.259077, 0.01232904, 2.387305, 0, 0.4431373, 1, 1,
0.2597499, 0.6346666, 0.2818785, 0, 0.4352941, 1, 1,
0.2611443, 0.9644147, -0.6844468, 0, 0.4313726, 1, 1,
0.2629076, -0.8496777, 1.76001, 0, 0.4235294, 1, 1,
0.2663117, 0.3800277, -0.4585124, 0, 0.4196078, 1, 1,
0.2667804, -0.3188659, 3.742136, 0, 0.4117647, 1, 1,
0.2692808, -1.549165, 2.319571, 0, 0.4078431, 1, 1,
0.2705774, 0.1018332, 1.838396, 0, 0.4, 1, 1,
0.2706349, 2.135776, -0.07880334, 0, 0.3921569, 1, 1,
0.2718856, 1.327298, 1.312631, 0, 0.3882353, 1, 1,
0.2756037, 0.639803, 0.9796854, 0, 0.3803922, 1, 1,
0.2786885, 1.314874, -0.1536436, 0, 0.3764706, 1, 1,
0.2791388, -0.3707814, 2.331943, 0, 0.3686275, 1, 1,
0.2834274, -0.5157206, 2.612706, 0, 0.3647059, 1, 1,
0.2858452, 0.2040899, 1.567217, 0, 0.3568628, 1, 1,
0.2871073, 0.4819633, -0.6735722, 0, 0.3529412, 1, 1,
0.2921275, -0.9052098, 4.911213, 0, 0.345098, 1, 1,
0.2926633, -0.06370545, 0.9891511, 0, 0.3411765, 1, 1,
0.292856, 0.6172046, 0.3091144, 0, 0.3333333, 1, 1,
0.2966504, -0.7880741, 2.682326, 0, 0.3294118, 1, 1,
0.2988418, 2.09018, 2.215313, 0, 0.3215686, 1, 1,
0.3005612, -0.3446846, 1.810772, 0, 0.3176471, 1, 1,
0.3074296, -0.2976979, 3.281245, 0, 0.3098039, 1, 1,
0.3079238, -0.1095319, 0.9218273, 0, 0.3058824, 1, 1,
0.3096175, 1.628759, -1.515503, 0, 0.2980392, 1, 1,
0.3132942, 0.6039963, 0.3512534, 0, 0.2901961, 1, 1,
0.3147893, -0.1258705, 3.129866, 0, 0.2862745, 1, 1,
0.3163297, -1.248039, 3.182674, 0, 0.2784314, 1, 1,
0.3167111, -1.171654, 1.953591, 0, 0.2745098, 1, 1,
0.3182763, -0.03598063, 1.190001, 0, 0.2666667, 1, 1,
0.320018, -0.1852696, 1.136648, 0, 0.2627451, 1, 1,
0.3283216, -0.4743878, 3.163811, 0, 0.254902, 1, 1,
0.3301046, 0.6297081, 1.206744, 0, 0.2509804, 1, 1,
0.3373538, 0.001739687, 1.126931, 0, 0.2431373, 1, 1,
0.3385863, 0.482234, 0.9126151, 0, 0.2392157, 1, 1,
0.3394307, 0.9716356, -0.07625926, 0, 0.2313726, 1, 1,
0.3405354, 0.477605, 1.962692, 0, 0.227451, 1, 1,
0.3417661, -0.04712766, 0.5572379, 0, 0.2196078, 1, 1,
0.3444597, -1.299986, 1.475756, 0, 0.2156863, 1, 1,
0.3467137, -0.4471451, 1.894993, 0, 0.2078431, 1, 1,
0.3478602, 0.6225705, -0.6455977, 0, 0.2039216, 1, 1,
0.3483369, -0.7625099, 5.125508, 0, 0.1960784, 1, 1,
0.3492872, -0.8817708, 2.735398, 0, 0.1882353, 1, 1,
0.3548092, -1.721067, 2.756624, 0, 0.1843137, 1, 1,
0.3568169, 1.446243, 0.0950235, 0, 0.1764706, 1, 1,
0.3583645, 0.4034733, 0.8853608, 0, 0.172549, 1, 1,
0.3585542, 2.575032, 1.376768, 0, 0.1647059, 1, 1,
0.363002, 0.2045382, 1.967755, 0, 0.1607843, 1, 1,
0.3654223, 0.8442492, 2.256954, 0, 0.1529412, 1, 1,
0.3674334, -0.9566498, 2.8255, 0, 0.1490196, 1, 1,
0.3681383, -0.5896263, 3.470743, 0, 0.1411765, 1, 1,
0.3698367, -0.9129978, 3.219067, 0, 0.1372549, 1, 1,
0.3729078, 0.7876422, -0.5656452, 0, 0.1294118, 1, 1,
0.3740501, -0.5635788, 2.27744, 0, 0.1254902, 1, 1,
0.3774085, -0.2971947, 3.612093, 0, 0.1176471, 1, 1,
0.3806147, 0.3783602, 0.5252366, 0, 0.1137255, 1, 1,
0.3864233, -0.3747195, 1.407586, 0, 0.1058824, 1, 1,
0.3946379, 0.8633906, 2.65091, 0, 0.09803922, 1, 1,
0.3996933, 1.251583, 0.001541379, 0, 0.09411765, 1, 1,
0.4022953, 0.1433592, 0.5325035, 0, 0.08627451, 1, 1,
0.4026954, -0.9766436, 3.955785, 0, 0.08235294, 1, 1,
0.40341, -0.07430769, 1.077051, 0, 0.07450981, 1, 1,
0.4069506, 0.2985191, -0.07772628, 0, 0.07058824, 1, 1,
0.4142986, -1.678305, 2.264646, 0, 0.0627451, 1, 1,
0.4149541, 2.355453, 1.835245, 0, 0.05882353, 1, 1,
0.4226495, -1.104308, 1.111209, 0, 0.05098039, 1, 1,
0.4240942, 1.419747, 0.2072229, 0, 0.04705882, 1, 1,
0.4252474, -1.176769, 1.675521, 0, 0.03921569, 1, 1,
0.4277698, -0.05431359, 2.838017, 0, 0.03529412, 1, 1,
0.432322, -1.176684, 3.435125, 0, 0.02745098, 1, 1,
0.4327699, -0.07667147, 2.104191, 0, 0.02352941, 1, 1,
0.4355503, -1.554855, 4.900151, 0, 0.01568628, 1, 1,
0.4361441, 1.796181, -0.8413259, 0, 0.01176471, 1, 1,
0.4392953, 0.6475376, -0.2210281, 0, 0.003921569, 1, 1,
0.4399786, -1.134356, 1.50959, 0.003921569, 0, 1, 1,
0.442312, 1.027777, -1.771737, 0.007843138, 0, 1, 1,
0.4436924, 0.3910763, 1.354369, 0.01568628, 0, 1, 1,
0.4469411, 1.226207, 0.879729, 0.01960784, 0, 1, 1,
0.4480841, -1.537009, 2.680678, 0.02745098, 0, 1, 1,
0.4502984, 1.794721, -1.618734, 0.03137255, 0, 1, 1,
0.4517285, -0.5280759, 2.085186, 0.03921569, 0, 1, 1,
0.4552339, 1.617435, 2.196725, 0.04313726, 0, 1, 1,
0.4566554, -0.2966176, 2.694968, 0.05098039, 0, 1, 1,
0.4674105, -0.700682, 0.4677712, 0.05490196, 0, 1, 1,
0.4680623, -1.360211, 3.700304, 0.0627451, 0, 1, 1,
0.4687651, -0.4832147, 2.475847, 0.06666667, 0, 1, 1,
0.4693876, 0.4852765, 0.1584458, 0.07450981, 0, 1, 1,
0.4695372, 0.1375437, 2.27035, 0.07843138, 0, 1, 1,
0.4718205, -1.80242, 3.465175, 0.08627451, 0, 1, 1,
0.4752767, -1.259943, 2.320473, 0.09019608, 0, 1, 1,
0.4761655, -0.1282341, 2.110867, 0.09803922, 0, 1, 1,
0.4772689, -0.4514464, 2.960949, 0.1058824, 0, 1, 1,
0.4825195, -0.08422729, 2.002181, 0.1098039, 0, 1, 1,
0.4874102, -2.119008, 3.430826, 0.1176471, 0, 1, 1,
0.4876097, 1.241126, 0.06761176, 0.1215686, 0, 1, 1,
0.4914457, -1.011026, 2.855599, 0.1294118, 0, 1, 1,
0.4930376, 1.304848, 1.530743, 0.1333333, 0, 1, 1,
0.4943356, 0.4827815, 1.059071, 0.1411765, 0, 1, 1,
0.5008145, 1.872306, -0.2552697, 0.145098, 0, 1, 1,
0.5090073, 0.4883088, -0.349896, 0.1529412, 0, 1, 1,
0.5093647, -0.7679104, 1.362553, 0.1568628, 0, 1, 1,
0.5104555, -0.2838728, 2.010785, 0.1647059, 0, 1, 1,
0.5114924, -1.391197, 1.997455, 0.1686275, 0, 1, 1,
0.5141472, -1.109363, 2.014287, 0.1764706, 0, 1, 1,
0.5167723, 1.830746, -1.390496, 0.1803922, 0, 1, 1,
0.5170267, 0.3710349, 0.9781601, 0.1882353, 0, 1, 1,
0.5196116, 1.273847, 0.9377414, 0.1921569, 0, 1, 1,
0.5221977, 0.1062937, 0.6665773, 0.2, 0, 1, 1,
0.5279538, 0.3935725, -0.09117043, 0.2078431, 0, 1, 1,
0.5293465, -0.1274409, 1.236595, 0.2117647, 0, 1, 1,
0.5301462, 0.6194559, 0.06452873, 0.2196078, 0, 1, 1,
0.5348006, -0.3059195, 2.197514, 0.2235294, 0, 1, 1,
0.5389826, -0.5257741, 1.202712, 0.2313726, 0, 1, 1,
0.5415922, 0.6870692, 1.300754, 0.2352941, 0, 1, 1,
0.5470402, -0.3312325, 1.67311, 0.2431373, 0, 1, 1,
0.5490949, -0.4880719, 1.740929, 0.2470588, 0, 1, 1,
0.5515965, -1.170079, 2.806681, 0.254902, 0, 1, 1,
0.5516365, 0.2115516, -0.7185009, 0.2588235, 0, 1, 1,
0.5529363, 0.7608403, 0.5473884, 0.2666667, 0, 1, 1,
0.5593691, -0.9167615, 3.672287, 0.2705882, 0, 1, 1,
0.559702, 0.1254287, 1.750102, 0.2784314, 0, 1, 1,
0.561838, -1.11618, 3.309584, 0.282353, 0, 1, 1,
0.5650975, 0.1467566, 1.789383, 0.2901961, 0, 1, 1,
0.5682443, 0.2818378, 1.749784, 0.2941177, 0, 1, 1,
0.5778657, 0.647934, 0.3594796, 0.3019608, 0, 1, 1,
0.583265, -0.3666234, 3.393052, 0.3098039, 0, 1, 1,
0.5860304, 0.7499072, -0.2379916, 0.3137255, 0, 1, 1,
0.5899264, -0.04485098, 3.036539, 0.3215686, 0, 1, 1,
0.6043806, 1.161267, 2.228058, 0.3254902, 0, 1, 1,
0.604687, 0.7441076, 0.9033713, 0.3333333, 0, 1, 1,
0.6053146, -0.3790781, 2.313653, 0.3372549, 0, 1, 1,
0.6060835, 0.9898868, 1.328089, 0.345098, 0, 1, 1,
0.6071447, 0.5967233, -0.1925168, 0.3490196, 0, 1, 1,
0.608817, -2.010829, 3.016137, 0.3568628, 0, 1, 1,
0.6098347, 0.7648664, -0.08468788, 0.3607843, 0, 1, 1,
0.6133173, 0.8992462, -0.1517418, 0.3686275, 0, 1, 1,
0.6251647, 1.185671, -0.4954574, 0.372549, 0, 1, 1,
0.6292303, -0.810316, 1.587919, 0.3803922, 0, 1, 1,
0.6298914, -0.2577026, 0.5773728, 0.3843137, 0, 1, 1,
0.6302323, 0.8587931, 1.33255, 0.3921569, 0, 1, 1,
0.6325129, -0.1256543, 1.385279, 0.3960784, 0, 1, 1,
0.6327459, -0.1753775, 1.817138, 0.4039216, 0, 1, 1,
0.6403251, 0.3735493, 2.414433, 0.4117647, 0, 1, 1,
0.6405967, -1.274338, 4.931625, 0.4156863, 0, 1, 1,
0.6416644, -0.5713291, 2.180547, 0.4235294, 0, 1, 1,
0.6477596, 1.121828, 1.194209, 0.427451, 0, 1, 1,
0.6484177, 0.5626496, 0.2781726, 0.4352941, 0, 1, 1,
0.653354, 0.8107929, 0.64004, 0.4392157, 0, 1, 1,
0.6533985, 0.1226763, 0.6144108, 0.4470588, 0, 1, 1,
0.6544834, 0.7844819, 1.582251, 0.4509804, 0, 1, 1,
0.6576478, -0.4902579, 2.585835, 0.4588235, 0, 1, 1,
0.6645097, 0.986495, 0.3114712, 0.4627451, 0, 1, 1,
0.6678327, 0.1692258, 0.2872058, 0.4705882, 0, 1, 1,
0.6706559, -0.1843695, 0.787316, 0.4745098, 0, 1, 1,
0.6724353, -0.3433825, 2.609505, 0.4823529, 0, 1, 1,
0.6731064, -1.746223, 3.570269, 0.4862745, 0, 1, 1,
0.6752079, 0.865378, 0.09863361, 0.4941176, 0, 1, 1,
0.6771457, -1.158668, 2.077859, 0.5019608, 0, 1, 1,
0.6796418, 0.8821751, 1.165422, 0.5058824, 0, 1, 1,
0.6811746, 1.162392, 1.58471, 0.5137255, 0, 1, 1,
0.6820023, -3.680021, 3.673423, 0.5176471, 0, 1, 1,
0.6911895, 0.628672, 2.058572, 0.5254902, 0, 1, 1,
0.6919028, 0.9148495, 1.168623, 0.5294118, 0, 1, 1,
0.6919054, -0.5612676, 2.169624, 0.5372549, 0, 1, 1,
0.6929753, -0.6659294, 2.479697, 0.5411765, 0, 1, 1,
0.6962383, -1.189796, 3.792315, 0.5490196, 0, 1, 1,
0.704991, -0.09419696, 1.494066, 0.5529412, 0, 1, 1,
0.7058401, 1.590164, -0.1539818, 0.5607843, 0, 1, 1,
0.7127671, -0.9569635, 2.609738, 0.5647059, 0, 1, 1,
0.7250177, 0.9301444, 0.4512931, 0.572549, 0, 1, 1,
0.7259607, -0.5123827, 1.585241, 0.5764706, 0, 1, 1,
0.7260334, -1.776512, 1.253605, 0.5843138, 0, 1, 1,
0.727241, -0.2820702, 2.592523, 0.5882353, 0, 1, 1,
0.7276059, -0.5094953, 0.3310373, 0.5960785, 0, 1, 1,
0.7316864, 0.9140592, 1.093971, 0.6039216, 0, 1, 1,
0.732804, -0.8540898, 2.942607, 0.6078432, 0, 1, 1,
0.7370751, 0.5826845, 0.7967454, 0.6156863, 0, 1, 1,
0.7429619, -0.985186, 2.112567, 0.6196079, 0, 1, 1,
0.7466055, -0.6188068, 1.902547, 0.627451, 0, 1, 1,
0.7514632, -1.738362, 3.593514, 0.6313726, 0, 1, 1,
0.7518993, 1.261527, 0.006044192, 0.6392157, 0, 1, 1,
0.7530639, 0.9907494, 0.7605617, 0.6431373, 0, 1, 1,
0.7561978, 1.753601, 0.5268553, 0.6509804, 0, 1, 1,
0.7580471, -1.596048, 3.790052, 0.654902, 0, 1, 1,
0.7599639, -1.401458, 1.780532, 0.6627451, 0, 1, 1,
0.7654281, -2.18967, 3.109241, 0.6666667, 0, 1, 1,
0.7657031, -0.2216832, 2.850781, 0.6745098, 0, 1, 1,
0.7658666, 0.393398, 0.08138961, 0.6784314, 0, 1, 1,
0.7736917, 0.1005067, 1.378554, 0.6862745, 0, 1, 1,
0.7757956, 0.6544507, -0.1053936, 0.6901961, 0, 1, 1,
0.7830037, -1.746942, 4.116099, 0.6980392, 0, 1, 1,
0.7893096, 0.5420877, 1.046469, 0.7058824, 0, 1, 1,
0.7949985, -1.06183, 0.9366284, 0.7098039, 0, 1, 1,
0.8003478, 0.8722818, -0.2733864, 0.7176471, 0, 1, 1,
0.8020739, 1.540687, -0.106027, 0.7215686, 0, 1, 1,
0.8025427, -0.8587183, 4.330564, 0.7294118, 0, 1, 1,
0.8055284, 0.9592056, -0.1146716, 0.7333333, 0, 1, 1,
0.8067451, 1.097155, 0.2391766, 0.7411765, 0, 1, 1,
0.8120638, -0.738664, 3.470758, 0.7450981, 0, 1, 1,
0.8137782, -1.980834, 1.024559, 0.7529412, 0, 1, 1,
0.8146167, 0.8648701, 1.323866, 0.7568628, 0, 1, 1,
0.8172933, -1.883396, 2.430926, 0.7647059, 0, 1, 1,
0.8191503, 0.1680395, 1.298774, 0.7686275, 0, 1, 1,
0.8201044, 0.08048742, 2.696881, 0.7764706, 0, 1, 1,
0.8225363, 0.3305245, 0.7793946, 0.7803922, 0, 1, 1,
0.8266091, 0.1890558, 0.4691563, 0.7882353, 0, 1, 1,
0.8280147, -0.2245678, 1.334533, 0.7921569, 0, 1, 1,
0.8340918, 1.039907, 2.004286, 0.8, 0, 1, 1,
0.8383783, -0.4181674, 0.9562522, 0.8078431, 0, 1, 1,
0.8464128, 1.281804, 0.183526, 0.8117647, 0, 1, 1,
0.8488935, 0.153424, 0.02675713, 0.8196079, 0, 1, 1,
0.8507027, -1.482122, 2.427182, 0.8235294, 0, 1, 1,
0.8538091, -0.599359, 2.077598, 0.8313726, 0, 1, 1,
0.8613772, -2.488468, 2.846814, 0.8352941, 0, 1, 1,
0.8714228, -0.9605779, 0.3234287, 0.8431373, 0, 1, 1,
0.8734332, -0.3259648, 1.371462, 0.8470588, 0, 1, 1,
0.8765527, 0.1082001, 4.091671, 0.854902, 0, 1, 1,
0.8770349, 2.00698, -0.5155756, 0.8588235, 0, 1, 1,
0.883913, 0.6953471, 1.083572, 0.8666667, 0, 1, 1,
0.8888335, 0.1352579, 2.386416, 0.8705882, 0, 1, 1,
0.8924348, -0.5330378, 2.51399, 0.8784314, 0, 1, 1,
0.8990039, -0.443341, 2.55466, 0.8823529, 0, 1, 1,
0.9011276, 0.1934435, 2.668281, 0.8901961, 0, 1, 1,
0.9013583, -0.9648055, 1.790902, 0.8941177, 0, 1, 1,
0.903047, -0.04635488, 1.544412, 0.9019608, 0, 1, 1,
0.9041302, 0.6995533, 0.82601, 0.9098039, 0, 1, 1,
0.9129933, 0.2355109, 0.2623914, 0.9137255, 0, 1, 1,
0.9181897, -1.105413, 2.140145, 0.9215686, 0, 1, 1,
0.91864, 1.194356, -0.2529829, 0.9254902, 0, 1, 1,
0.9210254, -1.325988, 4.070064, 0.9333333, 0, 1, 1,
0.9264797, -0.2292474, 1.6038, 0.9372549, 0, 1, 1,
0.9281822, 0.5468466, 0.9263123, 0.945098, 0, 1, 1,
0.9284135, 0.923643, -0.2784881, 0.9490196, 0, 1, 1,
0.9322826, 0.03030996, 0.6590374, 0.9568627, 0, 1, 1,
0.9324967, 0.9952874, 0.02373496, 0.9607843, 0, 1, 1,
0.9364197, 0.1941357, 0.7286067, 0.9686275, 0, 1, 1,
0.9385737, -0.7616041, 2.20266, 0.972549, 0, 1, 1,
0.9419262, -0.0001239054, 1.245766, 0.9803922, 0, 1, 1,
0.9424996, 1.567369, 0.7303512, 0.9843137, 0, 1, 1,
0.9455528, -1.187549, 2.597827, 0.9921569, 0, 1, 1,
0.9492797, -0.4252578, 2.542044, 0.9960784, 0, 1, 1,
0.9497417, -1.121302, 1.903261, 1, 0, 0.9960784, 1,
0.9551963, -1.738802, 4.009901, 1, 0, 0.9882353, 1,
0.9766596, 1.237126, 0.7035326, 1, 0, 0.9843137, 1,
0.98033, 0.3986568, 1.639426, 1, 0, 0.9764706, 1,
0.9821814, 1.502, 1.427217, 1, 0, 0.972549, 1,
0.985675, -1.544568, 0.5787078, 1, 0, 0.9647059, 1,
0.9873919, -1.302612, 2.266521, 1, 0, 0.9607843, 1,
0.9878107, -0.8818882, 1.4925, 1, 0, 0.9529412, 1,
0.9953001, -0.7035746, 0.8162111, 1, 0, 0.9490196, 1,
1.001492, 1.114634, 2.009086, 1, 0, 0.9411765, 1,
1.006678, -1.840598, 0.7058417, 1, 0, 0.9372549, 1,
1.019331, -0.05512003, 1.199253, 1, 0, 0.9294118, 1,
1.029573, 0.09391063, 1.806599, 1, 0, 0.9254902, 1,
1.031756, 2.165153, 2.031262, 1, 0, 0.9176471, 1,
1.035791, 0.1988544, 1.241813, 1, 0, 0.9137255, 1,
1.040319, 0.5009203, 0.1074983, 1, 0, 0.9058824, 1,
1.040345, 0.1468463, 2.483087, 1, 0, 0.9019608, 1,
1.045722, 1.03257, 1.323307, 1, 0, 0.8941177, 1,
1.052011, -0.04161767, 0.6900166, 1, 0, 0.8862745, 1,
1.058172, -0.8543396, 1.804354, 1, 0, 0.8823529, 1,
1.064746, -0.2594791, 1.743196, 1, 0, 0.8745098, 1,
1.067371, -1.299463, 3.666615, 1, 0, 0.8705882, 1,
1.075837, -0.9265673, 3.777298, 1, 0, 0.8627451, 1,
1.075997, 0.4531602, 0.5108467, 1, 0, 0.8588235, 1,
1.077303, 0.1159642, 2.492235, 1, 0, 0.8509804, 1,
1.07815, 0.9378805, 2.060945, 1, 0, 0.8470588, 1,
1.084182, -0.6085129, 1.222277, 1, 0, 0.8392157, 1,
1.087844, 0.6840327, 1.540799, 1, 0, 0.8352941, 1,
1.088317, -1.350769, 1.805729, 1, 0, 0.827451, 1,
1.089924, -0.5520577, 2.795846, 1, 0, 0.8235294, 1,
1.095067, 0.5202073, 1.489316, 1, 0, 0.8156863, 1,
1.096378, 0.5088622, 0.4846774, 1, 0, 0.8117647, 1,
1.100948, 0.1427102, 1.541552, 1, 0, 0.8039216, 1,
1.10497, -1.314356, 3.418193, 1, 0, 0.7960784, 1,
1.111214, -1.158225, 1.81843, 1, 0, 0.7921569, 1,
1.121545, 2.031244, 1.257938, 1, 0, 0.7843137, 1,
1.122871, -0.2520161, 0.7263756, 1, 0, 0.7803922, 1,
1.128663, -1.648405, 3.069622, 1, 0, 0.772549, 1,
1.133301, -1.603655, 0.06144345, 1, 0, 0.7686275, 1,
1.133444, -0.9932262, 1.289734, 1, 0, 0.7607843, 1,
1.133762, -0.07884462, 0.8322159, 1, 0, 0.7568628, 1,
1.136435, -0.1951195, 2.578241, 1, 0, 0.7490196, 1,
1.138558, 0.4171979, -0.9940602, 1, 0, 0.7450981, 1,
1.150581, -0.3285238, 2.414053, 1, 0, 0.7372549, 1,
1.15837, 1.429514, 0.08153825, 1, 0, 0.7333333, 1,
1.160467, -1.046347, 1.28269, 1, 0, 0.7254902, 1,
1.16933, 1.060696, 0.7730083, 1, 0, 0.7215686, 1,
1.178226, 0.8437106, -0.2263842, 1, 0, 0.7137255, 1,
1.183944, -0.1580108, 3.641314, 1, 0, 0.7098039, 1,
1.190063, -0.5625184, 1.230098, 1, 0, 0.7019608, 1,
1.192136, 0.8175308, 2.344922, 1, 0, 0.6941177, 1,
1.194586, 0.8898612, 1.92016, 1, 0, 0.6901961, 1,
1.203056, 0.2691724, 2.465688, 1, 0, 0.682353, 1,
1.210861, 0.2223316, 1.077995, 1, 0, 0.6784314, 1,
1.214944, 0.9301096, 1.41149, 1, 0, 0.6705883, 1,
1.231155, -1.049434, 1.464852, 1, 0, 0.6666667, 1,
1.239688, 0.3150935, 1.244623, 1, 0, 0.6588235, 1,
1.244557, 0.5248432, -1.137405, 1, 0, 0.654902, 1,
1.262491, -0.9644934, 1.968557, 1, 0, 0.6470588, 1,
1.264339, 0.06711226, 0.3599107, 1, 0, 0.6431373, 1,
1.266293, -0.80019, -0.1449966, 1, 0, 0.6352941, 1,
1.270521, 0.3259318, 0.7006686, 1, 0, 0.6313726, 1,
1.2725, 0.2055284, 2.080178, 1, 0, 0.6235294, 1,
1.276299, -0.4175857, 0.538275, 1, 0, 0.6196079, 1,
1.276343, -1.054592, 1.631958, 1, 0, 0.6117647, 1,
1.285344, 2.092166, -1.111761, 1, 0, 0.6078432, 1,
1.302729, 0.1472579, 1.332805, 1, 0, 0.6, 1,
1.303184, 0.2333539, 1.344912, 1, 0, 0.5921569, 1,
1.310021, -1.199676, 2.519489, 1, 0, 0.5882353, 1,
1.310624, -0.5823063, 0.9760125, 1, 0, 0.5803922, 1,
1.314667, 0.008178888, 2.298935, 1, 0, 0.5764706, 1,
1.325009, 0.3395969, 1.904829, 1, 0, 0.5686275, 1,
1.325744, -0.05815272, 2.832003, 1, 0, 0.5647059, 1,
1.326809, -1.321985, 1.507419, 1, 0, 0.5568628, 1,
1.335167, 1.756794, 1.296393, 1, 0, 0.5529412, 1,
1.355606, -1.548311, 0.9072164, 1, 0, 0.5450981, 1,
1.357234, -0.2148674, 3.347287, 1, 0, 0.5411765, 1,
1.357661, 0.9227799, -0.8673945, 1, 0, 0.5333334, 1,
1.370017, 1.284523, 0.07972276, 1, 0, 0.5294118, 1,
1.394127, 1.063029, -0.1785593, 1, 0, 0.5215687, 1,
1.398477, 0.2623421, 1.051469, 1, 0, 0.5176471, 1,
1.409608, -0.9857607, 3.80104, 1, 0, 0.509804, 1,
1.414258, -0.02774291, 0.02255, 1, 0, 0.5058824, 1,
1.420891, 0.237821, 1.775657, 1, 0, 0.4980392, 1,
1.424275, -1.507874, 1.673896, 1, 0, 0.4901961, 1,
1.444721, -0.2911203, 0.7226872, 1, 0, 0.4862745, 1,
1.450757, -1.369475, 1.436045, 1, 0, 0.4784314, 1,
1.453643, 1.559888, 0.3018129, 1, 0, 0.4745098, 1,
1.459001, -0.4823325, 2.765083, 1, 0, 0.4666667, 1,
1.467022, 0.3632957, 1.278555, 1, 0, 0.4627451, 1,
1.467978, -0.4283261, 1.452279, 1, 0, 0.454902, 1,
1.471457, 1.713456, 1.244136, 1, 0, 0.4509804, 1,
1.477524, -0.279688, 1.881542, 1, 0, 0.4431373, 1,
1.483902, -3.106133, 1.49479, 1, 0, 0.4392157, 1,
1.494283, 0.06696645, 1.922805, 1, 0, 0.4313726, 1,
1.495708, 1.628215, 1.37793, 1, 0, 0.427451, 1,
1.496855, -0.07358482, 0.3067988, 1, 0, 0.4196078, 1,
1.503711, -0.2410208, 1.833868, 1, 0, 0.4156863, 1,
1.513317, -1.504338, 2.592288, 1, 0, 0.4078431, 1,
1.524312, 0.747454, 2.054342, 1, 0, 0.4039216, 1,
1.533537, 0.3450339, 2.409822, 1, 0, 0.3960784, 1,
1.544494, -0.03758993, 3.214157, 1, 0, 0.3882353, 1,
1.582765, -1.782835, 3.299716, 1, 0, 0.3843137, 1,
1.590389, 1.385793, 1.462522, 1, 0, 0.3764706, 1,
1.592283, -0.6850165, 2.657705, 1, 0, 0.372549, 1,
1.59249, 0.6450421, 0.7483755, 1, 0, 0.3647059, 1,
1.623988, 1.302456, 1.675349, 1, 0, 0.3607843, 1,
1.629749, -1.150095, 0.9940419, 1, 0, 0.3529412, 1,
1.656663, -0.1219616, -0.2467701, 1, 0, 0.3490196, 1,
1.686964, -1.494427, 0.9831821, 1, 0, 0.3411765, 1,
1.705169, -1.192765, 1.728942, 1, 0, 0.3372549, 1,
1.712152, -1.021097, 2.032548, 1, 0, 0.3294118, 1,
1.720837, 0.7424264, 1.061339, 1, 0, 0.3254902, 1,
1.739524, -0.1002691, 0.8304264, 1, 0, 0.3176471, 1,
1.742685, 0.1933757, 2.611232, 1, 0, 0.3137255, 1,
1.746665, -1.487344, 1.382866, 1, 0, 0.3058824, 1,
1.747816, -0.07904647, 2.55796, 1, 0, 0.2980392, 1,
1.750435, 0.2770032, 0.8786076, 1, 0, 0.2941177, 1,
1.764089, 0.09560434, 1.161284, 1, 0, 0.2862745, 1,
1.794672, -0.9431328, 1.851368, 1, 0, 0.282353, 1,
1.802971, 0.3935713, 4.730703, 1, 0, 0.2745098, 1,
1.814074, -0.2292439, 2.666188, 1, 0, 0.2705882, 1,
1.818205, 1.152265, -1.030002, 1, 0, 0.2627451, 1,
1.826626, 0.1458886, 2.855294, 1, 0, 0.2588235, 1,
1.84324, 0.7902048, 1.543416, 1, 0, 0.2509804, 1,
1.854605, 0.05321816, 0.7348396, 1, 0, 0.2470588, 1,
1.859099, 1.29447, 2.043734, 1, 0, 0.2392157, 1,
1.864772, 0.4699394, -0.1054386, 1, 0, 0.2352941, 1,
1.865285, -0.7171806, 0.9626526, 1, 0, 0.227451, 1,
1.86639, 0.08511948, 1.28906, 1, 0, 0.2235294, 1,
1.894712, -0.04555875, 3.641377, 1, 0, 0.2156863, 1,
1.925969, 0.7747891, 3.952664, 1, 0, 0.2117647, 1,
1.927236, 1.62201, -0.3962243, 1, 0, 0.2039216, 1,
1.937565, -0.3554589, 1.407418, 1, 0, 0.1960784, 1,
1.950588, -0.6159061, 2.384948, 1, 0, 0.1921569, 1,
1.95148, -1.107746, 4.212804, 1, 0, 0.1843137, 1,
1.965119, 0.2328126, 0.3436986, 1, 0, 0.1803922, 1,
1.985639, 0.3635956, 2.062911, 1, 0, 0.172549, 1,
2.026438, -0.01459636, 0.8513006, 1, 0, 0.1686275, 1,
2.033357, 1.018481, 1.150562, 1, 0, 0.1607843, 1,
2.046852, -1.026235, 2.612387, 1, 0, 0.1568628, 1,
2.053188, 1.098766, 3.439889, 1, 0, 0.1490196, 1,
2.059684, 0.8821419, 0.09286059, 1, 0, 0.145098, 1,
2.079147, -2.486761, 3.136635, 1, 0, 0.1372549, 1,
2.105863, 0.06936476, 0.5389069, 1, 0, 0.1333333, 1,
2.114076, -0.2624253, 2.055252, 1, 0, 0.1254902, 1,
2.115903, -0.684344, 2.857657, 1, 0, 0.1215686, 1,
2.208865, -2.533385, 1.982268, 1, 0, 0.1137255, 1,
2.218725, -0.05611511, 1.300115, 1, 0, 0.1098039, 1,
2.244613, 1.039223, -0.01302901, 1, 0, 0.1019608, 1,
2.312122, 0.5019251, -0.4967075, 1, 0, 0.09411765, 1,
2.339941, 0.06247666, 1.57718, 1, 0, 0.09019608, 1,
2.3507, -1.088134, 3.439294, 1, 0, 0.08235294, 1,
2.366714, 0.004527375, 4.563588, 1, 0, 0.07843138, 1,
2.429243, 0.6443447, 2.551941, 1, 0, 0.07058824, 1,
2.432007, 1.197903, 1.680964, 1, 0, 0.06666667, 1,
2.447176, -0.4212433, 1.721061, 1, 0, 0.05882353, 1,
2.456558, -0.4854873, 2.629315, 1, 0, 0.05490196, 1,
2.490012, 0.007906799, 1.171709, 1, 0, 0.04705882, 1,
2.560228, 1.120554, 0.5013825, 1, 0, 0.04313726, 1,
2.718235, -1.256639, 1.402047, 1, 0, 0.03529412, 1,
2.741075, -0.163691, 2.094139, 1, 0, 0.03137255, 1,
2.760018, 0.6554399, 1.820962, 1, 0, 0.02352941, 1,
2.779983, -1.17502, 1.409761, 1, 0, 0.01960784, 1,
2.794302, -0.590055, 2.645676, 1, 0, 0.01176471, 1,
3.732198, 0.05611002, 0.6738247, 1, 0, 0.007843138, 1
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
0.2969668, -4.802415, -6.997602, 0, -0.5, 0.5, 0.5,
0.2969668, -4.802415, -6.997602, 1, -0.5, 0.5, 0.5,
0.2969668, -4.802415, -6.997602, 1, 1.5, 0.5, 0.5,
0.2969668, -4.802415, -6.997602, 0, 1.5, 0.5, 0.5
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
-4.302807, -0.3691227, -6.997602, 0, -0.5, 0.5, 0.5,
-4.302807, -0.3691227, -6.997602, 1, -0.5, 0.5, 0.5,
-4.302807, -0.3691227, -6.997602, 1, 1.5, 0.5, 0.5,
-4.302807, -0.3691227, -6.997602, 0, 1.5, 0.5, 0.5
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
-4.302807, -4.802415, -0.05752325, 0, -0.5, 0.5, 0.5,
-4.302807, -4.802415, -0.05752325, 1, -0.5, 0.5, 0.5,
-4.302807, -4.802415, -0.05752325, 1, 1.5, 0.5, 0.5,
-4.302807, -4.802415, -0.05752325, 0, 1.5, 0.5, 0.5
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
-3, -3.779348, -5.396046,
3, -3.779348, -5.396046,
-3, -3.779348, -5.396046,
-3, -3.949859, -5.662972,
-2, -3.779348, -5.396046,
-2, -3.949859, -5.662972,
-1, -3.779348, -5.396046,
-1, -3.949859, -5.662972,
0, -3.779348, -5.396046,
0, -3.949859, -5.662972,
1, -3.779348, -5.396046,
1, -3.949859, -5.662972,
2, -3.779348, -5.396046,
2, -3.949859, -5.662972,
3, -3.779348, -5.396046,
3, -3.949859, -5.662972
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
-3, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
-3, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
-3, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
-3, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5,
-2, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
-2, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
-2, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
-2, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5,
-1, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
-1, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
-1, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
-1, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5,
0, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
0, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
0, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
0, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5,
1, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
1, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
1, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
1, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5,
2, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
2, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
2, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
2, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5,
3, -4.290882, -6.196824, 0, -0.5, 0.5, 0.5,
3, -4.290882, -6.196824, 1, -0.5, 0.5, 0.5,
3, -4.290882, -6.196824, 1, 1.5, 0.5, 0.5,
3, -4.290882, -6.196824, 0, 1.5, 0.5, 0.5
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
-3.241321, -3, -5.396046,
-3.241321, 2, -5.396046,
-3.241321, -3, -5.396046,
-3.418235, -3, -5.662972,
-3.241321, -2, -5.396046,
-3.418235, -2, -5.662972,
-3.241321, -1, -5.396046,
-3.418235, -1, -5.662972,
-3.241321, 0, -5.396046,
-3.418235, 0, -5.662972,
-3.241321, 1, -5.396046,
-3.418235, 1, -5.662972,
-3.241321, 2, -5.396046,
-3.418235, 2, -5.662972
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
-3.772064, -3, -6.196824, 0, -0.5, 0.5, 0.5,
-3.772064, -3, -6.196824, 1, -0.5, 0.5, 0.5,
-3.772064, -3, -6.196824, 1, 1.5, 0.5, 0.5,
-3.772064, -3, -6.196824, 0, 1.5, 0.5, 0.5,
-3.772064, -2, -6.196824, 0, -0.5, 0.5, 0.5,
-3.772064, -2, -6.196824, 1, -0.5, 0.5, 0.5,
-3.772064, -2, -6.196824, 1, 1.5, 0.5, 0.5,
-3.772064, -2, -6.196824, 0, 1.5, 0.5, 0.5,
-3.772064, -1, -6.196824, 0, -0.5, 0.5, 0.5,
-3.772064, -1, -6.196824, 1, -0.5, 0.5, 0.5,
-3.772064, -1, -6.196824, 1, 1.5, 0.5, 0.5,
-3.772064, -1, -6.196824, 0, 1.5, 0.5, 0.5,
-3.772064, 0, -6.196824, 0, -0.5, 0.5, 0.5,
-3.772064, 0, -6.196824, 1, -0.5, 0.5, 0.5,
-3.772064, 0, -6.196824, 1, 1.5, 0.5, 0.5,
-3.772064, 0, -6.196824, 0, 1.5, 0.5, 0.5,
-3.772064, 1, -6.196824, 0, -0.5, 0.5, 0.5,
-3.772064, 1, -6.196824, 1, -0.5, 0.5, 0.5,
-3.772064, 1, -6.196824, 1, 1.5, 0.5, 0.5,
-3.772064, 1, -6.196824, 0, 1.5, 0.5, 0.5,
-3.772064, 2, -6.196824, 0, -0.5, 0.5, 0.5,
-3.772064, 2, -6.196824, 1, -0.5, 0.5, 0.5,
-3.772064, 2, -6.196824, 1, 1.5, 0.5, 0.5,
-3.772064, 2, -6.196824, 0, 1.5, 0.5, 0.5
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
-3.241321, -3.779348, -4,
-3.241321, -3.779348, 4,
-3.241321, -3.779348, -4,
-3.418235, -3.949859, -4,
-3.241321, -3.779348, -2,
-3.418235, -3.949859, -2,
-3.241321, -3.779348, 0,
-3.418235, -3.949859, 0,
-3.241321, -3.779348, 2,
-3.418235, -3.949859, 2,
-3.241321, -3.779348, 4,
-3.418235, -3.949859, 4
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
-3.772064, -4.290882, -4, 0, -0.5, 0.5, 0.5,
-3.772064, -4.290882, -4, 1, -0.5, 0.5, 0.5,
-3.772064, -4.290882, -4, 1, 1.5, 0.5, 0.5,
-3.772064, -4.290882, -4, 0, 1.5, 0.5, 0.5,
-3.772064, -4.290882, -2, 0, -0.5, 0.5, 0.5,
-3.772064, -4.290882, -2, 1, -0.5, 0.5, 0.5,
-3.772064, -4.290882, -2, 1, 1.5, 0.5, 0.5,
-3.772064, -4.290882, -2, 0, 1.5, 0.5, 0.5,
-3.772064, -4.290882, 0, 0, -0.5, 0.5, 0.5,
-3.772064, -4.290882, 0, 1, -0.5, 0.5, 0.5,
-3.772064, -4.290882, 0, 1, 1.5, 0.5, 0.5,
-3.772064, -4.290882, 0, 0, 1.5, 0.5, 0.5,
-3.772064, -4.290882, 2, 0, -0.5, 0.5, 0.5,
-3.772064, -4.290882, 2, 1, -0.5, 0.5, 0.5,
-3.772064, -4.290882, 2, 1, 1.5, 0.5, 0.5,
-3.772064, -4.290882, 2, 0, 1.5, 0.5, 0.5,
-3.772064, -4.290882, 4, 0, -0.5, 0.5, 0.5,
-3.772064, -4.290882, 4, 1, -0.5, 0.5, 0.5,
-3.772064, -4.290882, 4, 1, 1.5, 0.5, 0.5,
-3.772064, -4.290882, 4, 0, 1.5, 0.5, 0.5
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
-3.241321, -3.779348, -5.396046,
-3.241321, 3.041102, -5.396046,
-3.241321, -3.779348, 5.280999,
-3.241321, 3.041102, 5.280999,
-3.241321, -3.779348, -5.396046,
-3.241321, -3.779348, 5.280999,
-3.241321, 3.041102, -5.396046,
-3.241321, 3.041102, 5.280999,
-3.241321, -3.779348, -5.396046,
3.835254, -3.779348, -5.396046,
-3.241321, -3.779348, 5.280999,
3.835254, -3.779348, 5.280999,
-3.241321, 3.041102, -5.396046,
3.835254, 3.041102, -5.396046,
-3.241321, 3.041102, 5.280999,
3.835254, 3.041102, 5.280999,
3.835254, -3.779348, -5.396046,
3.835254, 3.041102, -5.396046,
3.835254, -3.779348, 5.280999,
3.835254, 3.041102, 5.280999,
3.835254, -3.779348, -5.396046,
3.835254, -3.779348, 5.280999,
3.835254, 3.041102, -5.396046,
3.835254, 3.041102, 5.280999
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
var radius = 7.749082;
var distance = 34.47654;
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
mvMatrix.translate( -0.2969668, 0.3691227, 0.05752325 );
mvMatrix.scale( 1.183971, 1.228432, 0.7847171 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.47654);
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
quinclorac<-read.table("quinclorac.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinclorac$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinclorac' not found
```

```r
y<-quinclorac$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinclorac' not found
```

```r
z<-quinclorac$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinclorac' not found
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
-3.138264, -1.042738, -3.515205, 0, 0, 1, 1, 1,
-3.035529, -0.1780643, -1.536834, 1, 0, 0, 1, 1,
-2.862836, -2.371562, -3.41582, 1, 0, 0, 1, 1,
-2.793426, 0.07722379, -1.312478, 1, 0, 0, 1, 1,
-2.672085, 0.8415046, 0.01928547, 1, 0, 0, 1, 1,
-2.589559, -1.102808, -1.600907, 1, 0, 0, 1, 1,
-2.584109, -1.505027, -2.156877, 0, 0, 0, 1, 1,
-2.565781, 2.576918, -1.100868, 0, 0, 0, 1, 1,
-2.561155, 1.5566, -0.4917062, 0, 0, 0, 1, 1,
-2.524712, -0.1163538, -3.05594, 0, 0, 0, 1, 1,
-2.435733, 0.3126622, 0.1909443, 0, 0, 0, 1, 1,
-2.380101, 0.1918187, -0.2736555, 0, 0, 0, 1, 1,
-2.34944, -0.4123609, -0.7934371, 0, 0, 0, 1, 1,
-2.334416, 0.4110028, -0.8382939, 1, 1, 1, 1, 1,
-2.314426, 0.9012831, -1.038115, 1, 1, 1, 1, 1,
-2.292163, -0.6456399, -2.245975, 1, 1, 1, 1, 1,
-2.256404, 0.2337695, 0.05644875, 1, 1, 1, 1, 1,
-2.212638, -1.490756, -0.2900807, 1, 1, 1, 1, 1,
-2.206987, -0.6145177, -2.13847, 1, 1, 1, 1, 1,
-2.195799, 0.7287872, -2.427457, 1, 1, 1, 1, 1,
-2.154855, 0.4547902, -1.788041, 1, 1, 1, 1, 1,
-2.127527, 0.2231931, -0.2225564, 1, 1, 1, 1, 1,
-2.105796, -0.3242297, -0.9818001, 1, 1, 1, 1, 1,
-2.094493, 0.3138663, -1.041979, 1, 1, 1, 1, 1,
-2.073826, -1.622384, -2.589194, 1, 1, 1, 1, 1,
-1.989463, -1.063201, -1.320411, 1, 1, 1, 1, 1,
-1.987164, 0.5041075, -2.953527, 1, 1, 1, 1, 1,
-1.958815, 2.680414, -1.856468, 1, 1, 1, 1, 1,
-1.951347, 0.3530097, 0.5090021, 0, 0, 1, 1, 1,
-1.930764, -0.2126968, -0.3931561, 1, 0, 0, 1, 1,
-1.907132, -0.4143712, -1.765742, 1, 0, 0, 1, 1,
-1.901706, 0.2717964, -1.374584, 1, 0, 0, 1, 1,
-1.88299, -2.992983, -3.001807, 1, 0, 0, 1, 1,
-1.865225, -1.072079, -1.210634, 1, 0, 0, 1, 1,
-1.841621, 0.2491471, -1.245603, 0, 0, 0, 1, 1,
-1.839825, -0.2890877, -0.1309177, 0, 0, 0, 1, 1,
-1.835004, -0.1097102, -0.2573613, 0, 0, 0, 1, 1,
-1.825501, -0.0415341, -0.56192, 0, 0, 0, 1, 1,
-1.818133, 1.000854, -0.7887662, 0, 0, 0, 1, 1,
-1.812446, 0.04055512, -0.4620933, 0, 0, 0, 1, 1,
-1.800094, -1.435141, -2.693973, 0, 0, 0, 1, 1,
-1.79875, 1.320088, 0.4344194, 1, 1, 1, 1, 1,
-1.772752, -0.5798256, -3.294198, 1, 1, 1, 1, 1,
-1.770734, 1.086367, -1.834645, 1, 1, 1, 1, 1,
-1.739687, -0.1076593, -0.3853949, 1, 1, 1, 1, 1,
-1.729829, -0.8601981, -1.266086, 1, 1, 1, 1, 1,
-1.723361, 0.9197236, -1.745644, 1, 1, 1, 1, 1,
-1.712632, -0.2995887, -1.110868, 1, 1, 1, 1, 1,
-1.710554, 0.5714154, -2.169316, 1, 1, 1, 1, 1,
-1.703925, 0.698394, -1.310446, 1, 1, 1, 1, 1,
-1.694313, -0.5480396, -3.340329, 1, 1, 1, 1, 1,
-1.693281, 1.494827, 0.1387688, 1, 1, 1, 1, 1,
-1.687525, 0.6420349, -1.562976, 1, 1, 1, 1, 1,
-1.683969, 1.683414, 1.131945, 1, 1, 1, 1, 1,
-1.678276, 0.152095, 0.6333846, 1, 1, 1, 1, 1,
-1.675784, -0.3080562, -1.02218, 1, 1, 1, 1, 1,
-1.667472, 0.7757293, 0.4154505, 0, 0, 1, 1, 1,
-1.641836, -0.1435175, -2.369683, 1, 0, 0, 1, 1,
-1.628085, -0.8412451, -2.832804, 1, 0, 0, 1, 1,
-1.621005, -0.3653484, -1.243418, 1, 0, 0, 1, 1,
-1.618116, -1.061205, 0.008636347, 1, 0, 0, 1, 1,
-1.615844, -1.533812, -1.04838, 1, 0, 0, 1, 1,
-1.604045, -0.1209241, -0.2205717, 0, 0, 0, 1, 1,
-1.587136, 0.9583894, -1.649933, 0, 0, 0, 1, 1,
-1.586632, -0.5849833, -1.413884, 0, 0, 0, 1, 1,
-1.586246, -0.04803659, 0.4945674, 0, 0, 0, 1, 1,
-1.579105, -0.2499075, -1.318323, 0, 0, 0, 1, 1,
-1.568837, 0.0598391, -3.530373, 0, 0, 0, 1, 1,
-1.561522, 0.09072521, -1.032065, 0, 0, 0, 1, 1,
-1.552628, -0.4347209, -0.5219693, 1, 1, 1, 1, 1,
-1.545818, -0.9671283, -2.519187, 1, 1, 1, 1, 1,
-1.542736, 1.556162, -0.9612883, 1, 1, 1, 1, 1,
-1.539843, -2.94104, -2.217286, 1, 1, 1, 1, 1,
-1.538428, 1.2566, -1.459294, 1, 1, 1, 1, 1,
-1.537319, 0.3032757, -0.9532551, 1, 1, 1, 1, 1,
-1.532537, 0.07271232, -0.6091294, 1, 1, 1, 1, 1,
-1.523669, 0.7355543, 0.3455293, 1, 1, 1, 1, 1,
-1.518248, -1.605727, -4.234767, 1, 1, 1, 1, 1,
-1.517725, 1.576079, -0.3028774, 1, 1, 1, 1, 1,
-1.487376, 1.646063, -0.131683, 1, 1, 1, 1, 1,
-1.474277, -0.5981843, -1.749834, 1, 1, 1, 1, 1,
-1.468211, 0.7945948, 1.492375, 1, 1, 1, 1, 1,
-1.454241, 0.5121166, -1.875371, 1, 1, 1, 1, 1,
-1.449889, 0.1788789, -1.415341, 1, 1, 1, 1, 1,
-1.435665, 0.2054788, -0.9771298, 0, 0, 1, 1, 1,
-1.409938, 1.218868, -1.300341, 1, 0, 0, 1, 1,
-1.407749, -0.1762312, -2.210787, 1, 0, 0, 1, 1,
-1.396149, -0.9944418, -3.967283, 1, 0, 0, 1, 1,
-1.392514, 1.256356, 0.5177517, 1, 0, 0, 1, 1,
-1.38617, -0.7265492, -1.342517, 1, 0, 0, 1, 1,
-1.382716, 0.268522, -1.981914, 0, 0, 0, 1, 1,
-1.371336, 0.09530081, -1.111137, 0, 0, 0, 1, 1,
-1.362242, -0.2098001, -3.48656, 0, 0, 0, 1, 1,
-1.359395, -0.1662484, -1.545053, 0, 0, 0, 1, 1,
-1.350426, -0.4032966, -0.9569651, 0, 0, 0, 1, 1,
-1.348987, -1.361947, -1.468685, 0, 0, 0, 1, 1,
-1.341206, -1.804289, -2.163209, 0, 0, 0, 1, 1,
-1.339781, -0.9034199, -2.220642, 1, 1, 1, 1, 1,
-1.335291, -1.383863, -3.632005, 1, 1, 1, 1, 1,
-1.331448, 1.11015, -2.215533, 1, 1, 1, 1, 1,
-1.324327, -0.7217268, -1.364353, 1, 1, 1, 1, 1,
-1.320304, 0.7788469, -0.7794024, 1, 1, 1, 1, 1,
-1.299363, -1.029763, -1.692869, 1, 1, 1, 1, 1,
-1.297337, 0.2762903, -0.661356, 1, 1, 1, 1, 1,
-1.295088, 0.1045059, 0.05951597, 1, 1, 1, 1, 1,
-1.294444, 0.668798, -2.854209, 1, 1, 1, 1, 1,
-1.290184, -1.443672, -0.9689847, 1, 1, 1, 1, 1,
-1.288979, 0.839322, -0.5168676, 1, 1, 1, 1, 1,
-1.288833, -0.198463, -1.027358, 1, 1, 1, 1, 1,
-1.286021, -1.546579, -0.3015747, 1, 1, 1, 1, 1,
-1.283178, 0.2928201, -0.03324752, 1, 1, 1, 1, 1,
-1.277198, 1.491597, -0.4519064, 1, 1, 1, 1, 1,
-1.272952, 0.4405879, -1.283714, 0, 0, 1, 1, 1,
-1.270806, -0.704915, -0.2207598, 1, 0, 0, 1, 1,
-1.257912, -1.679403, -5.240555, 1, 0, 0, 1, 1,
-1.257303, 0.8401498, 0.1786697, 1, 0, 0, 1, 1,
-1.256005, 0.3606876, -0.2966126, 1, 0, 0, 1, 1,
-1.255691, 1.688503, -0.7298222, 1, 0, 0, 1, 1,
-1.255195, 0.5456226, -1.36272, 0, 0, 0, 1, 1,
-1.253311, -0.665003, -4.190339, 0, 0, 0, 1, 1,
-1.2524, -0.9810855, -3.328551, 0, 0, 0, 1, 1,
-1.245386, 1.914911, -1.430482, 0, 0, 0, 1, 1,
-1.215557, 0.1621199, -1.224177, 0, 0, 0, 1, 1,
-1.214256, -0.10431, -0.1576804, 0, 0, 0, 1, 1,
-1.210804, -0.2108253, -3.596911, 0, 0, 0, 1, 1,
-1.197068, -1.361316, -2.686226, 1, 1, 1, 1, 1,
-1.191325, 0.268521, -1.497778, 1, 1, 1, 1, 1,
-1.186788, 0.2305795, -2.249525, 1, 1, 1, 1, 1,
-1.177891, 1.055857, -1.410549, 1, 1, 1, 1, 1,
-1.167386, -0.3040249, -1.671373, 1, 1, 1, 1, 1,
-1.165096, -0.7504782, -1.623283, 1, 1, 1, 1, 1,
-1.160446, -3.330757, -4.434691, 1, 1, 1, 1, 1,
-1.152281, -0.8614303, -2.102865, 1, 1, 1, 1, 1,
-1.15206, -2.032154, -3.236128, 1, 1, 1, 1, 1,
-1.149653, -1.164573, -1.786737, 1, 1, 1, 1, 1,
-1.148314, -0.4655965, -1.461472, 1, 1, 1, 1, 1,
-1.135596, -0.3033316, -2.072044, 1, 1, 1, 1, 1,
-1.130237, -0.4654308, -1.242079, 1, 1, 1, 1, 1,
-1.125395, 1.078617, -1.012628, 1, 1, 1, 1, 1,
-1.110029, -1.236583, -2.351294, 1, 1, 1, 1, 1,
-1.105768, 1.291188, -0.5553954, 0, 0, 1, 1, 1,
-1.099891, 0.8538965, -0.3943858, 1, 0, 0, 1, 1,
-1.098244, -0.2894764, -1.959858, 1, 0, 0, 1, 1,
-1.09243, -0.9792037, -3.953267, 1, 0, 0, 1, 1,
-1.088704, -1.877833, -3.370748, 1, 0, 0, 1, 1,
-1.085626, -1.205555, -2.347007, 1, 0, 0, 1, 1,
-1.083341, 0.4753949, -1.304133, 0, 0, 0, 1, 1,
-1.08035, 0.3374698, -2.412881, 0, 0, 0, 1, 1,
-1.077628, 0.6938736, -2.047609, 0, 0, 0, 1, 1,
-1.06294, 0.3278687, -1.462533, 0, 0, 0, 1, 1,
-1.050495, -0.1159486, -0.1893359, 0, 0, 0, 1, 1,
-1.047747, 1.308967, -0.7366768, 0, 0, 0, 1, 1,
-1.038473, -1.483472, -1.512595, 0, 0, 0, 1, 1,
-1.038336, -0.3101831, -2.676762, 1, 1, 1, 1, 1,
-1.023802, -1.301569, -1.679774, 1, 1, 1, 1, 1,
-1.020903, 1.198306, 0.7255117, 1, 1, 1, 1, 1,
-1.012306, 0.6860344, 0.8510535, 1, 1, 1, 1, 1,
-1.011737, -2.772763, -1.754502, 1, 1, 1, 1, 1,
-1.01054, -1.512364, -2.796499, 1, 1, 1, 1, 1,
-1.001094, 0.07926406, -1.804796, 1, 1, 1, 1, 1,
-0.9916929, -1.548585, -2.059336, 1, 1, 1, 1, 1,
-0.9884405, 0.7517176, -1.671883, 1, 1, 1, 1, 1,
-0.986917, -0.5367885, -2.360594, 1, 1, 1, 1, 1,
-0.9866647, 2.935545, -0.3366049, 1, 1, 1, 1, 1,
-0.9802238, -0.7784929, -4.503338, 1, 1, 1, 1, 1,
-0.9673997, -0.96334, -2.506455, 1, 1, 1, 1, 1,
-0.9667646, -0.4718658, -1.989367, 1, 1, 1, 1, 1,
-0.9623181, 0.8776237, -2.45739, 1, 1, 1, 1, 1,
-0.9556362, -0.8265851, -2.993204, 0, 0, 1, 1, 1,
-0.9473431, -0.7356998, -1.696479, 1, 0, 0, 1, 1,
-0.9429199, -1.146383, -1.383938, 1, 0, 0, 1, 1,
-0.9412333, 0.4953585, -0.100481, 1, 0, 0, 1, 1,
-0.9408919, 1.080928, -1.322232, 1, 0, 0, 1, 1,
-0.9357861, -1.442946, -1.924839, 1, 0, 0, 1, 1,
-0.9336362, -0.2315948, -2.059994, 0, 0, 0, 1, 1,
-0.9333761, -0.4294084, -1.913939, 0, 0, 0, 1, 1,
-0.9308544, -2.033899, -3.069911, 0, 0, 0, 1, 1,
-0.9289486, -1.36015, -2.736718, 0, 0, 0, 1, 1,
-0.9225487, -0.827311, -2.452361, 0, 0, 0, 1, 1,
-0.9220141, -1.72824, -2.517144, 0, 0, 0, 1, 1,
-0.919919, 0.7674077, -1.534276, 0, 0, 0, 1, 1,
-0.9159622, 1.161041, -2.228378, 1, 1, 1, 1, 1,
-0.9142652, 0.8093666, 0.2760903, 1, 1, 1, 1, 1,
-0.9096635, 1.303609, 0.2462953, 1, 1, 1, 1, 1,
-0.9077334, 2.480209, -2.03597, 1, 1, 1, 1, 1,
-0.9066572, 1.76366, 0.08115114, 1, 1, 1, 1, 1,
-0.8998232, -1.492649, -2.44975, 1, 1, 1, 1, 1,
-0.8923075, 0.03950825, -2.144398, 1, 1, 1, 1, 1,
-0.8879419, -0.477087, 0.1976866, 1, 1, 1, 1, 1,
-0.8856693, -0.7932111, -2.111452, 1, 1, 1, 1, 1,
-0.8816092, 2.238477, -0.7897968, 1, 1, 1, 1, 1,
-0.8806492, 1.128606, -0.3029525, 1, 1, 1, 1, 1,
-0.8800013, -1.415361, -3.911206, 1, 1, 1, 1, 1,
-0.8730057, -0.06989002, -3.083342, 1, 1, 1, 1, 1,
-0.8666162, 0.5297121, -1.15291, 1, 1, 1, 1, 1,
-0.8626068, -0.2568177, -3.104379, 1, 1, 1, 1, 1,
-0.8622164, -0.9741033, -2.161756, 0, 0, 1, 1, 1,
-0.8603873, 1.007664, -0.3289433, 1, 0, 0, 1, 1,
-0.8479835, 0.09459442, -1.086948, 1, 0, 0, 1, 1,
-0.8430619, -0.4354778, -0.9962727, 1, 0, 0, 1, 1,
-0.8426435, 0.1380314, -1.434035, 1, 0, 0, 1, 1,
-0.8384586, -1.332352, -1.720441, 1, 0, 0, 1, 1,
-0.836679, -0.2521491, -0.30751, 0, 0, 0, 1, 1,
-0.8292971, 1.035761, -0.406473, 0, 0, 0, 1, 1,
-0.8225138, -0.425377, -3.160712, 0, 0, 0, 1, 1,
-0.8091874, 0.6499612, 0.1116844, 0, 0, 0, 1, 1,
-0.803111, -0.4808631, -1.592372, 0, 0, 0, 1, 1,
-0.7981249, -0.1211013, -1.134974, 0, 0, 0, 1, 1,
-0.7975828, 0.3785881, 0.1894386, 0, 0, 0, 1, 1,
-0.7953433, -2.201251, -2.259606, 1, 1, 1, 1, 1,
-0.7908707, -0.6931373, -2.164961, 1, 1, 1, 1, 1,
-0.787845, -1.082875, -3.54881, 1, 1, 1, 1, 1,
-0.7837677, 0.7263151, -0.6252391, 1, 1, 1, 1, 1,
-0.7836231, 0.8213766, -1.496056, 1, 1, 1, 1, 1,
-0.7819662, -0.3520704, -2.006361, 1, 1, 1, 1, 1,
-0.781039, 2.592561, -0.6739802, 1, 1, 1, 1, 1,
-0.7779756, 0.8943195, -1.121374, 1, 1, 1, 1, 1,
-0.7747833, -0.860615, -3.968615, 1, 1, 1, 1, 1,
-0.769682, -0.01013826, -2.356076, 1, 1, 1, 1, 1,
-0.7587402, 0.3416414, -2.062268, 1, 1, 1, 1, 1,
-0.7465842, 1.724925, 0.9893636, 1, 1, 1, 1, 1,
-0.7436004, -1.066192, -4.613059, 1, 1, 1, 1, 1,
-0.7435992, -0.8854358, -2.610457, 1, 1, 1, 1, 1,
-0.7405558, -0.5271931, -0.4611735, 1, 1, 1, 1, 1,
-0.7387325, -0.0009156, -2.772602, 0, 0, 1, 1, 1,
-0.7317278, -0.09826511, -2.062869, 1, 0, 0, 1, 1,
-0.7298312, 1.16333, 0.04351538, 1, 0, 0, 1, 1,
-0.7282571, -0.9113086, -2.574175, 1, 0, 0, 1, 1,
-0.7201343, -0.4613768, -1.838975, 1, 0, 0, 1, 1,
-0.7159342, 0.001098653, -2.524276, 1, 0, 0, 1, 1,
-0.7140037, -0.5161036, -3.607955, 0, 0, 0, 1, 1,
-0.7120104, -0.202874, -3.172534, 0, 0, 0, 1, 1,
-0.7111746, 0.2862026, -0.9444185, 0, 0, 0, 1, 1,
-0.7107328, -0.4064492, -3.555974, 0, 0, 0, 1, 1,
-0.7094859, 0.03641304, -1.583584, 0, 0, 0, 1, 1,
-0.7082248, 0.6253881, -1.813935, 0, 0, 0, 1, 1,
-0.7075209, 0.1651412, -1.200686, 0, 0, 0, 1, 1,
-0.7016815, -0.7274663, -3.00862, 1, 1, 1, 1, 1,
-0.7010522, -0.0102893, 0.007825216, 1, 1, 1, 1, 1,
-0.6993217, 1.962075, -1.381753, 1, 1, 1, 1, 1,
-0.6857035, 0.5784472, -0.7118804, 1, 1, 1, 1, 1,
-0.6850351, 0.2200616, -3.060512, 1, 1, 1, 1, 1,
-0.683333, 0.9769955, -0.4065358, 1, 1, 1, 1, 1,
-0.6827741, -0.9661528, -2.692194, 1, 1, 1, 1, 1,
-0.6759913, -1.670902, -1.975831, 1, 1, 1, 1, 1,
-0.6741464, -2.012084, -3.367879, 1, 1, 1, 1, 1,
-0.6703171, -2.256865, -2.868681, 1, 1, 1, 1, 1,
-0.6697918, 2.198169, 2.228913, 1, 1, 1, 1, 1,
-0.6688916, 0.3138541, -0.9412817, 1, 1, 1, 1, 1,
-0.6557501, -0.8190687, -3.564509, 1, 1, 1, 1, 1,
-0.6501141, -0.2108425, -2.153612, 1, 1, 1, 1, 1,
-0.6492712, 0.9214782, -2.083822, 1, 1, 1, 1, 1,
-0.6475945, 0.4637641, -1.612036, 0, 0, 1, 1, 1,
-0.6444257, -0.2615779, -2.848071, 1, 0, 0, 1, 1,
-0.6424754, -0.2562497, -2.042985, 1, 0, 0, 1, 1,
-0.6408359, 1.421313, -0.5918477, 1, 0, 0, 1, 1,
-0.6328875, -1.206928, -2.309026, 1, 0, 0, 1, 1,
-0.6311598, 0.6238832, 0.3691607, 1, 0, 0, 1, 1,
-0.6284932, -0.1163924, -3.78948, 0, 0, 0, 1, 1,
-0.6228058, 0.04984249, -1.499805, 0, 0, 0, 1, 1,
-0.6222348, 0.750473, -2.07598, 0, 0, 0, 1, 1,
-0.6186508, 0.2753459, -1.316125, 0, 0, 0, 1, 1,
-0.6182187, -0.2148335, -3.638986, 0, 0, 0, 1, 1,
-0.6181547, 1.581536, -0.1559552, 0, 0, 0, 1, 1,
-0.61336, 0.3725278, -1.319486, 0, 0, 0, 1, 1,
-0.6121061, -0.6659997, -3.844986, 1, 1, 1, 1, 1,
-0.6114229, -0.9658555, -1.806092, 1, 1, 1, 1, 1,
-0.6030486, 0.8226014, -1.904568, 1, 1, 1, 1, 1,
-0.6021798, -0.08387002, -3.423022, 1, 1, 1, 1, 1,
-0.5973942, 1.498219, -1.532881, 1, 1, 1, 1, 1,
-0.5960439, 1.098303, 1.265925, 1, 1, 1, 1, 1,
-0.5905355, 0.09617412, -2.033825, 1, 1, 1, 1, 1,
-0.5903606, -0.2692456, -2.974219, 1, 1, 1, 1, 1,
-0.5811743, 1.070788, 0.3878694, 1, 1, 1, 1, 1,
-0.5810765, -0.2583058, -1.027327, 1, 1, 1, 1, 1,
-0.580955, 0.09772792, -1.417987, 1, 1, 1, 1, 1,
-0.5774106, 1.168245, 0.9050384, 1, 1, 1, 1, 1,
-0.5742634, -0.5367733, -2.572012, 1, 1, 1, 1, 1,
-0.5727477, -1.648507, -3.197654, 1, 1, 1, 1, 1,
-0.5718516, -0.4334003, -2.832642, 1, 1, 1, 1, 1,
-0.5690915, 1.072366, -0.3224285, 0, 0, 1, 1, 1,
-0.5631886, 0.78577, -0.2022518, 1, 0, 0, 1, 1,
-0.5624983, 1.140769, -0.6930265, 1, 0, 0, 1, 1,
-0.559825, 0.5096021, -0.3753124, 1, 0, 0, 1, 1,
-0.5507987, 0.6968895, -1.576986, 1, 0, 0, 1, 1,
-0.5485985, 0.6032865, -0.08765765, 1, 0, 0, 1, 1,
-0.5469766, 0.3315089, -0.9676502, 0, 0, 0, 1, 1,
-0.5460425, -0.2081291, 0.3899702, 0, 0, 0, 1, 1,
-0.5428004, 0.6843519, -2.310874, 0, 0, 0, 1, 1,
-0.5333278, 0.6860232, 0.2185847, 0, 0, 0, 1, 1,
-0.5303587, 0.156116, -1.50803, 0, 0, 0, 1, 1,
-0.5249381, 0.1291447, -2.334165, 0, 0, 0, 1, 1,
-0.5218085, -0.1169151, -3.122644, 0, 0, 0, 1, 1,
-0.5217833, 1.294648, 0.1448404, 1, 1, 1, 1, 1,
-0.5211179, -0.7101676, -1.580985, 1, 1, 1, 1, 1,
-0.5187597, -1.624217, -3.423093, 1, 1, 1, 1, 1,
-0.5170724, -1.196552, -2.022417, 1, 1, 1, 1, 1,
-0.516351, 0.7816622, -0.7015595, 1, 1, 1, 1, 1,
-0.5146436, -1.483645, -3.089731, 1, 1, 1, 1, 1,
-0.5143189, 0.3453201, -1.429036, 1, 1, 1, 1, 1,
-0.512525, 0.5087869, -2.656209, 1, 1, 1, 1, 1,
-0.5118161, -0.3421186, -4.20672, 1, 1, 1, 1, 1,
-0.5108824, 0.1189123, -0.8671516, 1, 1, 1, 1, 1,
-0.5096478, -1.552397, -2.721149, 1, 1, 1, 1, 1,
-0.5046294, 1.812413, 0.7013978, 1, 1, 1, 1, 1,
-0.5040098, -0.1349843, -2.973272, 1, 1, 1, 1, 1,
-0.4975949, 0.7348984, -0.02464785, 1, 1, 1, 1, 1,
-0.4969867, 0.08122763, -1.198673, 1, 1, 1, 1, 1,
-0.4897059, 0.2350426, -1.17989, 0, 0, 1, 1, 1,
-0.4891493, 0.1606586, -2.410822, 1, 0, 0, 1, 1,
-0.4871489, -0.4181133, -2.129281, 1, 0, 0, 1, 1,
-0.4856022, -0.09141122, -1.115241, 1, 0, 0, 1, 1,
-0.4839211, 1.000956, 0.6185989, 1, 0, 0, 1, 1,
-0.4809604, 0.4158288, 0.01365166, 1, 0, 0, 1, 1,
-0.4804503, 0.7969887, -0.4435247, 0, 0, 0, 1, 1,
-0.4765033, -1.855234, -2.631967, 0, 0, 0, 1, 1,
-0.4754901, 0.6750925, -1.209447, 0, 0, 0, 1, 1,
-0.4740106, -0.4918443, -2.48566, 0, 0, 0, 1, 1,
-0.4702495, 2.095385, -0.946761, 0, 0, 0, 1, 1,
-0.4696174, 0.7004977, -0.8483181, 0, 0, 0, 1, 1,
-0.4677367, 0.5837818, -0.5958886, 0, 0, 0, 1, 1,
-0.4591064, 0.1622414, -1.629069, 1, 1, 1, 1, 1,
-0.4494263, 0.1674826, 0.1446794, 1, 1, 1, 1, 1,
-0.4417638, -0.1783784, -0.9830124, 1, 1, 1, 1, 1,
-0.4394701, -0.8877115, -1.384747, 1, 1, 1, 1, 1,
-0.4361843, -0.05450999, -0.3658357, 1, 1, 1, 1, 1,
-0.4343364, -0.4440542, -2.998945, 1, 1, 1, 1, 1,
-0.4313498, -1.272741, -1.424571, 1, 1, 1, 1, 1,
-0.42703, -0.8389509, -3.663512, 1, 1, 1, 1, 1,
-0.4268915, -0.2228012, -3.333113, 1, 1, 1, 1, 1,
-0.4261292, -1.172256, -2.901684, 1, 1, 1, 1, 1,
-0.4228154, 0.5475892, -0.5236141, 1, 1, 1, 1, 1,
-0.4206967, -0.6002913, -2.811149, 1, 1, 1, 1, 1,
-0.4206287, 0.2312306, -2.037659, 1, 1, 1, 1, 1,
-0.4191371, -0.07650671, -1.138316, 1, 1, 1, 1, 1,
-0.4131364, 0.8529038, -0.2831845, 1, 1, 1, 1, 1,
-0.4112445, -0.02690751, -1.022847, 0, 0, 1, 1, 1,
-0.402535, -1.436192, -2.847731, 1, 0, 0, 1, 1,
-0.4021221, -1.524764, -2.162411, 1, 0, 0, 1, 1,
-0.3987832, 0.6910034, -1.386014, 1, 0, 0, 1, 1,
-0.3961664, -0.5125199, -3.286797, 1, 0, 0, 1, 1,
-0.3954728, 0.333469, 1.134645, 1, 0, 0, 1, 1,
-0.393252, 0.04026329, -1.438851, 0, 0, 0, 1, 1,
-0.3904742, -0.4872835, -2.903116, 0, 0, 0, 1, 1,
-0.3902578, 0.3616253, -1.308304, 0, 0, 0, 1, 1,
-0.3854825, 0.4755373, -0.3613612, 0, 0, 0, 1, 1,
-0.3837109, -1.45009, -1.851951, 0, 0, 0, 1, 1,
-0.3809541, 1.486666, 0.5237184, 0, 0, 0, 1, 1,
-0.378087, -0.7457002, -2.854913, 0, 0, 0, 1, 1,
-0.3769762, 0.7783193, 0.1101179, 1, 1, 1, 1, 1,
-0.3742616, -1.546333, -2.510646, 1, 1, 1, 1, 1,
-0.3709392, -0.5476531, -3.105204, 1, 1, 1, 1, 1,
-0.369604, 0.2448577, -1.51872, 1, 1, 1, 1, 1,
-0.3688951, 1.519297, -1.024225, 1, 1, 1, 1, 1,
-0.3611182, -1.364396, -3.860297, 1, 1, 1, 1, 1,
-0.3604242, -0.5617101, -4.466909, 1, 1, 1, 1, 1,
-0.3602017, -0.6235091, -1.896045, 1, 1, 1, 1, 1,
-0.3544976, 0.8336512, 0.7210184, 1, 1, 1, 1, 1,
-0.3523702, 0.6153029, -2.137952, 1, 1, 1, 1, 1,
-0.3497144, 1.306684, -1.091761, 1, 1, 1, 1, 1,
-0.3470479, 0.1883248, -0.6784554, 1, 1, 1, 1, 1,
-0.3413984, -0.3228681, -1.931504, 1, 1, 1, 1, 1,
-0.3377877, -0.4509732, -1.812254, 1, 1, 1, 1, 1,
-0.3333364, -1.166578, -1.965972, 1, 1, 1, 1, 1,
-0.330715, 0.82744, -2.214876, 0, 0, 1, 1, 1,
-0.3296481, -0.7271519, -1.372453, 1, 0, 0, 1, 1,
-0.3197274, -0.1684148, -0.04886313, 1, 0, 0, 1, 1,
-0.3181385, 0.5729051, -1.831293, 1, 0, 0, 1, 1,
-0.3180511, 1.273687, -0.5620891, 1, 0, 0, 1, 1,
-0.3172632, -0.2214956, -2.263077, 1, 0, 0, 1, 1,
-0.3148364, 1.12681, 1.656006, 0, 0, 0, 1, 1,
-0.3142216, 0.4519144, -0.51066, 0, 0, 0, 1, 1,
-0.3130259, 0.209779, 0.0277164, 0, 0, 0, 1, 1,
-0.3111926, 1.375333, 1.644918, 0, 0, 0, 1, 1,
-0.3059384, 0.3744371, 0.1870988, 0, 0, 0, 1, 1,
-0.3026336, 0.3635804, -2.222191, 0, 0, 0, 1, 1,
-0.2955188, -0.3444513, -1.797863, 0, 0, 0, 1, 1,
-0.2869747, -1.139178, -4.056968, 1, 1, 1, 1, 1,
-0.2855076, 0.2918754, -0.2124007, 1, 1, 1, 1, 1,
-0.2849783, -1.071965, -4.007063, 1, 1, 1, 1, 1,
-0.2834098, -1.585978, -4.163854, 1, 1, 1, 1, 1,
-0.2830506, 1.354, -0.8071498, 1, 1, 1, 1, 1,
-0.2828485, -0.4807718, -2.154662, 1, 1, 1, 1, 1,
-0.2793624, -1.176374, -4.209951, 1, 1, 1, 1, 1,
-0.2791044, -0.7563233, -1.350114, 1, 1, 1, 1, 1,
-0.2787365, -0.3018385, -3.245983, 1, 1, 1, 1, 1,
-0.2775135, 0.4187911, -2.229472, 1, 1, 1, 1, 1,
-0.2771605, 0.2864833, -0.2050294, 1, 1, 1, 1, 1,
-0.2755661, -0.1835199, -2.686514, 1, 1, 1, 1, 1,
-0.2745793, -0.3800323, -2.071471, 1, 1, 1, 1, 1,
-0.2726948, 1.080067, -1.196116, 1, 1, 1, 1, 1,
-0.2708822, -0.2048857, -1.838739, 1, 1, 1, 1, 1,
-0.2698502, 0.1893917, -1.488398, 0, 0, 1, 1, 1,
-0.2692026, -0.2681341, -3.086104, 1, 0, 0, 1, 1,
-0.2629727, -0.441263, -1.894356, 1, 0, 0, 1, 1,
-0.2611158, 0.1125544, -0.4640492, 1, 0, 0, 1, 1,
-0.2528515, -0.01611327, -0.4542612, 1, 0, 0, 1, 1,
-0.2503354, -1.027009, -2.691827, 1, 0, 0, 1, 1,
-0.2458826, -1.21905, -2.238905, 0, 0, 0, 1, 1,
-0.2387973, -2.005077, -4.640757, 0, 0, 0, 1, 1,
-0.2386603, 0.1565107, -0.8211208, 0, 0, 0, 1, 1,
-0.2380144, -0.2381572, -2.839939, 0, 0, 0, 1, 1,
-0.2378679, 0.4180869, -0.997828, 0, 0, 0, 1, 1,
-0.2368, -1.612885, -2.847992, 0, 0, 0, 1, 1,
-0.233655, -0.7444345, -3.199982, 0, 0, 0, 1, 1,
-0.2284302, -0.02145138, -3.429903, 1, 1, 1, 1, 1,
-0.2253879, 0.1074457, -2.068736, 1, 1, 1, 1, 1,
-0.2226873, -0.1831104, -1.973448, 1, 1, 1, 1, 1,
-0.2183022, -0.2144, -0.7149704, 1, 1, 1, 1, 1,
-0.2172984, -0.5016868, -2.802827, 1, 1, 1, 1, 1,
-0.2169908, -0.8360423, -2.21332, 1, 1, 1, 1, 1,
-0.2150133, 2.941775, -1.289972, 1, 1, 1, 1, 1,
-0.2143973, 1.117123, 1.81975, 1, 1, 1, 1, 1,
-0.2143535, -1.504796, -3.326851, 1, 1, 1, 1, 1,
-0.2108364, -1.676889, -2.781473, 1, 1, 1, 1, 1,
-0.2075565, -1.928593, -4.853562, 1, 1, 1, 1, 1,
-0.2049679, 0.9246393, -0.1786407, 1, 1, 1, 1, 1,
-0.2049369, 0.6183051, -1.026852, 1, 1, 1, 1, 1,
-0.1990674, -0.5920064, -1.673813, 1, 1, 1, 1, 1,
-0.1985081, 1.053235, -0.8511407, 1, 1, 1, 1, 1,
-0.1975762, 0.3467332, 0.5851087, 0, 0, 1, 1, 1,
-0.1973205, -1.413958, -2.360408, 1, 0, 0, 1, 1,
-0.1947715, 0.3902133, 1.068575, 1, 0, 0, 1, 1,
-0.1904299, -0.961345, -1.923634, 1, 0, 0, 1, 1,
-0.1899843, -1.213905, -2.507865, 1, 0, 0, 1, 1,
-0.1895006, -0.3779059, -1.93769, 1, 0, 0, 1, 1,
-0.18709, -1.905999, -1.767499, 0, 0, 0, 1, 1,
-0.1868541, 0.3048305, 0.9911115, 0, 0, 0, 1, 1,
-0.185389, 0.2328622, -2.001259, 0, 0, 0, 1, 1,
-0.1844535, -1.166098, -2.02404, 0, 0, 0, 1, 1,
-0.181553, -1.084349, -2.417372, 0, 0, 0, 1, 1,
-0.1766416, -0.8195786, -1.240848, 0, 0, 0, 1, 1,
-0.1737532, 0.1805303, -0.7674474, 0, 0, 0, 1, 1,
-0.1729448, -0.8718629, -3.467173, 1, 1, 1, 1, 1,
-0.1725169, 0.4541839, -0.1622711, 1, 1, 1, 1, 1,
-0.1677837, 0.3559476, -0.8039597, 1, 1, 1, 1, 1,
-0.1647662, 0.1190042, -0.5495892, 1, 1, 1, 1, 1,
-0.163726, 0.9102067, 0.09209926, 1, 1, 1, 1, 1,
-0.161252, 0.8140919, -0.06839437, 1, 1, 1, 1, 1,
-0.1598438, -1.23378, -2.508703, 1, 1, 1, 1, 1,
-0.157488, -1.334831, -3.180352, 1, 1, 1, 1, 1,
-0.155643, 0.2498865, -1.223763, 1, 1, 1, 1, 1,
-0.1552634, -1.084135, -2.391278, 1, 1, 1, 1, 1,
-0.1527376, 1.094966, -0.524124, 1, 1, 1, 1, 1,
-0.152641, -0.5708508, -2.23572, 1, 1, 1, 1, 1,
-0.1511443, 0.7385451, 1.847572, 1, 1, 1, 1, 1,
-0.1494839, 0.902557, -0.9265063, 1, 1, 1, 1, 1,
-0.1460844, 0.2697905, -0.1764611, 1, 1, 1, 1, 1,
-0.1423371, 0.5601118, -1.268949, 0, 0, 1, 1, 1,
-0.1398696, 0.7296575, 0.8493019, 1, 0, 0, 1, 1,
-0.1386861, -1.311456, -3.645774, 1, 0, 0, 1, 1,
-0.1306198, -1.039311, -2.14147, 1, 0, 0, 1, 1,
-0.1237108, 1.429334, -0.8194278, 1, 0, 0, 1, 1,
-0.1209204, -2.228578, -3.105511, 1, 0, 0, 1, 1,
-0.1175742, 0.9566535, 0.4769912, 0, 0, 0, 1, 1,
-0.1129858, 0.9268438, -0.3562063, 0, 0, 0, 1, 1,
-0.1122544, -0.6211232, -2.574696, 0, 0, 0, 1, 1,
-0.1098541, -1.40659, -2.538421, 0, 0, 0, 1, 1,
-0.1047354, -0.2156098, -1.235772, 0, 0, 0, 1, 1,
-0.1033768, 1.115475, -0.3420476, 0, 0, 0, 1, 1,
-0.09284144, 0.478531, -0.9302516, 0, 0, 0, 1, 1,
-0.09133392, 0.740486, 0.3415213, 1, 1, 1, 1, 1,
-0.0913175, -1.839163, -2.013348, 1, 1, 1, 1, 1,
-0.0870384, 0.09267677, -2.074893, 1, 1, 1, 1, 1,
-0.08382989, 0.8904189, 0.2976586, 1, 1, 1, 1, 1,
-0.08129545, 1.692269, 0.3758948, 1, 1, 1, 1, 1,
-0.0799016, -1.740631, -2.827692, 1, 1, 1, 1, 1,
-0.07951327, 1.854685, 0.6857847, 1, 1, 1, 1, 1,
-0.07837988, 0.06297381, -1.026213, 1, 1, 1, 1, 1,
-0.07667694, 0.281344, 0.2057973, 1, 1, 1, 1, 1,
-0.07635937, -0.4364791, -1.239945, 1, 1, 1, 1, 1,
-0.07122205, 1.265036, -0.2534846, 1, 1, 1, 1, 1,
-0.06769457, -0.709312, -1.688555, 1, 1, 1, 1, 1,
-0.06320071, 1.281445, -1.457684, 1, 1, 1, 1, 1,
-0.05373342, 1.046307, 1.931477, 1, 1, 1, 1, 1,
-0.05370935, 0.4811592, -1.037858, 1, 1, 1, 1, 1,
-0.05184087, -1.184868, -1.084117, 0, 0, 1, 1, 1,
-0.04501231, -0.5426956, -3.359089, 1, 0, 0, 1, 1,
-0.04485938, 1.780464, -1.666883, 1, 0, 0, 1, 1,
-0.03879878, -1.33511, -3.142044, 1, 0, 0, 1, 1,
-0.03413981, -1.102273, -2.029929, 1, 0, 0, 1, 1,
-0.02903479, 0.7807174, 0.4643639, 1, 0, 0, 1, 1,
-0.02802077, -0.4588593, -3.077338, 0, 0, 0, 1, 1,
-0.02497073, -1.061559, -3.218814, 0, 0, 0, 1, 1,
-0.02351795, 1.081692, 1.26615, 0, 0, 0, 1, 1,
-0.0232957, -1.499395, -4.1335, 0, 0, 0, 1, 1,
-0.02191047, 0.7852337, -1.519683, 0, 0, 0, 1, 1,
-0.02101249, 0.2477598, -0.4118575, 0, 0, 0, 1, 1,
-0.01240086, 1.019851, -2.301577, 0, 0, 0, 1, 1,
-0.01107735, 1.967513, -0.7448565, 1, 1, 1, 1, 1,
-0.01093599, -0.7907567, -3.482548, 1, 1, 1, 1, 1,
-0.01012833, -0.534404, -2.428488, 1, 1, 1, 1, 1,
-0.007793262, 0.7118349, -0.607398, 1, 1, 1, 1, 1,
-0.004955681, -0.3319225, -0.4250282, 1, 1, 1, 1, 1,
-0.004729152, -0.06213479, -2.570041, 1, 1, 1, 1, 1,
-0.004205072, 0.8952757, -0.7763128, 1, 1, 1, 1, 1,
-0.003957088, -0.1955468, -2.132254, 1, 1, 1, 1, 1,
-0.003807804, -0.4787401, -3.381096, 1, 1, 1, 1, 1,
-0.0013779, -1.611435, -2.73155, 1, 1, 1, 1, 1,
0.002226867, 0.8078712, -0.2261851, 1, 1, 1, 1, 1,
0.00235796, 1.151577, 1.938212, 1, 1, 1, 1, 1,
0.003503702, 2.052046, 1.154984, 1, 1, 1, 1, 1,
0.007410286, 0.3873291, -1.164424, 1, 1, 1, 1, 1,
0.01332131, -0.05741703, 2.381905, 1, 1, 1, 1, 1,
0.01974113, -1.539178, 3.710098, 0, 0, 1, 1, 1,
0.02228201, 2.760225, -1.316653, 1, 0, 0, 1, 1,
0.02296716, 1.770901, -2.439003, 1, 0, 0, 1, 1,
0.02429453, 0.6606767, 0.9490702, 1, 0, 0, 1, 1,
0.02828144, -0.1302236, 2.363538, 1, 0, 0, 1, 1,
0.02934481, -2.124898, 3.464787, 1, 0, 0, 1, 1,
0.03314571, 0.3861656, 0.5142725, 0, 0, 0, 1, 1,
0.03344357, -1.482935, 3.461193, 0, 0, 0, 1, 1,
0.03447367, -0.3308957, 2.954875, 0, 0, 0, 1, 1,
0.03684074, -2.050403, 1.759947, 0, 0, 0, 1, 1,
0.04245113, 0.3325151, 1.063199, 0, 0, 0, 1, 1,
0.04678237, 0.8285941, 0.1115152, 0, 0, 0, 1, 1,
0.04749123, -0.162894, 2.491123, 0, 0, 0, 1, 1,
0.04884426, -0.492294, 1.56447, 1, 1, 1, 1, 1,
0.05592726, -0.04889966, 2.574637, 1, 1, 1, 1, 1,
0.05721804, -0.6634507, 4.193659, 1, 1, 1, 1, 1,
0.05823516, 0.5503699, 0.7386863, 1, 1, 1, 1, 1,
0.06230826, 0.05037003, -0.01098355, 1, 1, 1, 1, 1,
0.06483426, -0.1698911, 3.955902, 1, 1, 1, 1, 1,
0.06841836, 1.08994, 0.5165141, 1, 1, 1, 1, 1,
0.06987921, 0.5038356, 1.094213, 1, 1, 1, 1, 1,
0.07076258, 0.2103013, -0.7804107, 1, 1, 1, 1, 1,
0.07280132, 0.6594495, 0.6800196, 1, 1, 1, 1, 1,
0.07508036, 0.8282194, -0.8224583, 1, 1, 1, 1, 1,
0.07968109, 0.237077, 1.762221, 1, 1, 1, 1, 1,
0.08221034, -1.060393, 3.250898, 1, 1, 1, 1, 1,
0.08803048, -0.1905945, 2.9254, 1, 1, 1, 1, 1,
0.08836479, 0.2607394, -0.2584015, 1, 1, 1, 1, 1,
0.09180526, -0.2828282, 2.925731, 0, 0, 1, 1, 1,
0.09471142, -0.8000977, 2.970201, 1, 0, 0, 1, 1,
0.1020223, -0.9476918, 2.642379, 1, 0, 0, 1, 1,
0.1044255, 0.7031242, 1.254303, 1, 0, 0, 1, 1,
0.1055277, -0.6896493, 2.033559, 1, 0, 0, 1, 1,
0.1185836, -1.164406, 3.249738, 1, 0, 0, 1, 1,
0.1199573, -0.2314726, 2.823704, 0, 0, 0, 1, 1,
0.1212357, 0.4733078, -0.1541364, 0, 0, 0, 1, 1,
0.1251905, 1.999513, -0.5060067, 0, 0, 0, 1, 1,
0.1255169, -0.8366636, 1.857171, 0, 0, 0, 1, 1,
0.1266494, 0.0005497243, 2.555748, 0, 0, 0, 1, 1,
0.1283688, 0.09993775, -0.9370386, 0, 0, 0, 1, 1,
0.1312241, 0.0730123, 0.6562962, 0, 0, 0, 1, 1,
0.1380318, 0.01395803, 1.310483, 1, 1, 1, 1, 1,
0.1389007, -0.6138169, 5.096428, 1, 1, 1, 1, 1,
0.1427367, 1.744192, 2.771448, 1, 1, 1, 1, 1,
0.147127, 0.1769536, 0.1427125, 1, 1, 1, 1, 1,
0.1519965, -1.2096, 3.105058, 1, 1, 1, 1, 1,
0.1623417, -0.8699766, 3.231572, 1, 1, 1, 1, 1,
0.1633726, -1.148043, 2.947616, 1, 1, 1, 1, 1,
0.1651714, 0.1010066, 0.8339491, 1, 1, 1, 1, 1,
0.1665941, 0.8387546, -0.6667563, 1, 1, 1, 1, 1,
0.1674328, 1.774882, -2.308959, 1, 1, 1, 1, 1,
0.1702993, -0.05437952, 1.722326, 1, 1, 1, 1, 1,
0.1739453, -0.263722, 3.116513, 1, 1, 1, 1, 1,
0.1795937, -1.533247, 1.886037, 1, 1, 1, 1, 1,
0.1851894, -0.4436, 2.268868, 1, 1, 1, 1, 1,
0.1855681, -0.6928458, 2.301279, 1, 1, 1, 1, 1,
0.1870555, 0.05660067, 0.00573054, 0, 0, 1, 1, 1,
0.191238, 1.391388, -0.19407, 1, 0, 0, 1, 1,
0.1920326, -0.5565498, 2.99166, 1, 0, 0, 1, 1,
0.1941806, -0.3619676, 2.271504, 1, 0, 0, 1, 1,
0.1948109, 0.2876079, 1.331419, 1, 0, 0, 1, 1,
0.1951032, -0.837348, 3.473541, 1, 0, 0, 1, 1,
0.1973705, -0.5162469, 1.4464, 0, 0, 0, 1, 1,
0.1984002, 0.135561, 0.6897675, 0, 0, 0, 1, 1,
0.2001196, -0.3045728, 3.073649, 0, 0, 0, 1, 1,
0.2085526, -1.443706, 2.976061, 0, 0, 0, 1, 1,
0.2102447, -1.375672, 3.120939, 0, 0, 0, 1, 1,
0.2153074, -1.965834, 5.006511, 0, 0, 0, 1, 1,
0.2168336, -1.047965, 4.138453, 0, 0, 0, 1, 1,
0.2174305, 1.439279, -0.02367699, 1, 1, 1, 1, 1,
0.2189539, -0.845157, 0.7200505, 1, 1, 1, 1, 1,
0.2194729, -2.205335, 2.890632, 1, 1, 1, 1, 1,
0.2222299, -0.1574081, 3.62423, 1, 1, 1, 1, 1,
0.2225666, -1.167201, 4.507346, 1, 1, 1, 1, 1,
0.227687, 1.097225, -1.512841, 1, 1, 1, 1, 1,
0.2308497, 0.01654924, 0.9267852, 1, 1, 1, 1, 1,
0.2346796, 0.3979926, -1.417119, 1, 1, 1, 1, 1,
0.2354369, -1.448402, 1.562302, 1, 1, 1, 1, 1,
0.2367086, 0.2270235, 0.561781, 1, 1, 1, 1, 1,
0.2371144, 0.5557321, 0.1813137, 1, 1, 1, 1, 1,
0.2373771, 1.399711, -0.16009, 1, 1, 1, 1, 1,
0.2422891, -1.212894, 2.698668, 1, 1, 1, 1, 1,
0.2443458, -0.9171951, 3.590638, 1, 1, 1, 1, 1,
0.2467204, -2.176192, 2.359231, 1, 1, 1, 1, 1,
0.2481955, -1.031707, 1.788917, 0, 0, 1, 1, 1,
0.2484159, 2.238786, -0.7426705, 1, 0, 0, 1, 1,
0.2544802, 0.1015249, -0.8835274, 1, 0, 0, 1, 1,
0.2552478, 2.034781, 1.332976, 1, 0, 0, 1, 1,
0.2581476, -0.9532943, 1.75905, 1, 0, 0, 1, 1,
0.259077, 0.01232904, 2.387305, 1, 0, 0, 1, 1,
0.2597499, 0.6346666, 0.2818785, 0, 0, 0, 1, 1,
0.2611443, 0.9644147, -0.6844468, 0, 0, 0, 1, 1,
0.2629076, -0.8496777, 1.76001, 0, 0, 0, 1, 1,
0.2663117, 0.3800277, -0.4585124, 0, 0, 0, 1, 1,
0.2667804, -0.3188659, 3.742136, 0, 0, 0, 1, 1,
0.2692808, -1.549165, 2.319571, 0, 0, 0, 1, 1,
0.2705774, 0.1018332, 1.838396, 0, 0, 0, 1, 1,
0.2706349, 2.135776, -0.07880334, 1, 1, 1, 1, 1,
0.2718856, 1.327298, 1.312631, 1, 1, 1, 1, 1,
0.2756037, 0.639803, 0.9796854, 1, 1, 1, 1, 1,
0.2786885, 1.314874, -0.1536436, 1, 1, 1, 1, 1,
0.2791388, -0.3707814, 2.331943, 1, 1, 1, 1, 1,
0.2834274, -0.5157206, 2.612706, 1, 1, 1, 1, 1,
0.2858452, 0.2040899, 1.567217, 1, 1, 1, 1, 1,
0.2871073, 0.4819633, -0.6735722, 1, 1, 1, 1, 1,
0.2921275, -0.9052098, 4.911213, 1, 1, 1, 1, 1,
0.2926633, -0.06370545, 0.9891511, 1, 1, 1, 1, 1,
0.292856, 0.6172046, 0.3091144, 1, 1, 1, 1, 1,
0.2966504, -0.7880741, 2.682326, 1, 1, 1, 1, 1,
0.2988418, 2.09018, 2.215313, 1, 1, 1, 1, 1,
0.3005612, -0.3446846, 1.810772, 1, 1, 1, 1, 1,
0.3074296, -0.2976979, 3.281245, 1, 1, 1, 1, 1,
0.3079238, -0.1095319, 0.9218273, 0, 0, 1, 1, 1,
0.3096175, 1.628759, -1.515503, 1, 0, 0, 1, 1,
0.3132942, 0.6039963, 0.3512534, 1, 0, 0, 1, 1,
0.3147893, -0.1258705, 3.129866, 1, 0, 0, 1, 1,
0.3163297, -1.248039, 3.182674, 1, 0, 0, 1, 1,
0.3167111, -1.171654, 1.953591, 1, 0, 0, 1, 1,
0.3182763, -0.03598063, 1.190001, 0, 0, 0, 1, 1,
0.320018, -0.1852696, 1.136648, 0, 0, 0, 1, 1,
0.3283216, -0.4743878, 3.163811, 0, 0, 0, 1, 1,
0.3301046, 0.6297081, 1.206744, 0, 0, 0, 1, 1,
0.3373538, 0.001739687, 1.126931, 0, 0, 0, 1, 1,
0.3385863, 0.482234, 0.9126151, 0, 0, 0, 1, 1,
0.3394307, 0.9716356, -0.07625926, 0, 0, 0, 1, 1,
0.3405354, 0.477605, 1.962692, 1, 1, 1, 1, 1,
0.3417661, -0.04712766, 0.5572379, 1, 1, 1, 1, 1,
0.3444597, -1.299986, 1.475756, 1, 1, 1, 1, 1,
0.3467137, -0.4471451, 1.894993, 1, 1, 1, 1, 1,
0.3478602, 0.6225705, -0.6455977, 1, 1, 1, 1, 1,
0.3483369, -0.7625099, 5.125508, 1, 1, 1, 1, 1,
0.3492872, -0.8817708, 2.735398, 1, 1, 1, 1, 1,
0.3548092, -1.721067, 2.756624, 1, 1, 1, 1, 1,
0.3568169, 1.446243, 0.0950235, 1, 1, 1, 1, 1,
0.3583645, 0.4034733, 0.8853608, 1, 1, 1, 1, 1,
0.3585542, 2.575032, 1.376768, 1, 1, 1, 1, 1,
0.363002, 0.2045382, 1.967755, 1, 1, 1, 1, 1,
0.3654223, 0.8442492, 2.256954, 1, 1, 1, 1, 1,
0.3674334, -0.9566498, 2.8255, 1, 1, 1, 1, 1,
0.3681383, -0.5896263, 3.470743, 1, 1, 1, 1, 1,
0.3698367, -0.9129978, 3.219067, 0, 0, 1, 1, 1,
0.3729078, 0.7876422, -0.5656452, 1, 0, 0, 1, 1,
0.3740501, -0.5635788, 2.27744, 1, 0, 0, 1, 1,
0.3774085, -0.2971947, 3.612093, 1, 0, 0, 1, 1,
0.3806147, 0.3783602, 0.5252366, 1, 0, 0, 1, 1,
0.3864233, -0.3747195, 1.407586, 1, 0, 0, 1, 1,
0.3946379, 0.8633906, 2.65091, 0, 0, 0, 1, 1,
0.3996933, 1.251583, 0.001541379, 0, 0, 0, 1, 1,
0.4022953, 0.1433592, 0.5325035, 0, 0, 0, 1, 1,
0.4026954, -0.9766436, 3.955785, 0, 0, 0, 1, 1,
0.40341, -0.07430769, 1.077051, 0, 0, 0, 1, 1,
0.4069506, 0.2985191, -0.07772628, 0, 0, 0, 1, 1,
0.4142986, -1.678305, 2.264646, 0, 0, 0, 1, 1,
0.4149541, 2.355453, 1.835245, 1, 1, 1, 1, 1,
0.4226495, -1.104308, 1.111209, 1, 1, 1, 1, 1,
0.4240942, 1.419747, 0.2072229, 1, 1, 1, 1, 1,
0.4252474, -1.176769, 1.675521, 1, 1, 1, 1, 1,
0.4277698, -0.05431359, 2.838017, 1, 1, 1, 1, 1,
0.432322, -1.176684, 3.435125, 1, 1, 1, 1, 1,
0.4327699, -0.07667147, 2.104191, 1, 1, 1, 1, 1,
0.4355503, -1.554855, 4.900151, 1, 1, 1, 1, 1,
0.4361441, 1.796181, -0.8413259, 1, 1, 1, 1, 1,
0.4392953, 0.6475376, -0.2210281, 1, 1, 1, 1, 1,
0.4399786, -1.134356, 1.50959, 1, 1, 1, 1, 1,
0.442312, 1.027777, -1.771737, 1, 1, 1, 1, 1,
0.4436924, 0.3910763, 1.354369, 1, 1, 1, 1, 1,
0.4469411, 1.226207, 0.879729, 1, 1, 1, 1, 1,
0.4480841, -1.537009, 2.680678, 1, 1, 1, 1, 1,
0.4502984, 1.794721, -1.618734, 0, 0, 1, 1, 1,
0.4517285, -0.5280759, 2.085186, 1, 0, 0, 1, 1,
0.4552339, 1.617435, 2.196725, 1, 0, 0, 1, 1,
0.4566554, -0.2966176, 2.694968, 1, 0, 0, 1, 1,
0.4674105, -0.700682, 0.4677712, 1, 0, 0, 1, 1,
0.4680623, -1.360211, 3.700304, 1, 0, 0, 1, 1,
0.4687651, -0.4832147, 2.475847, 0, 0, 0, 1, 1,
0.4693876, 0.4852765, 0.1584458, 0, 0, 0, 1, 1,
0.4695372, 0.1375437, 2.27035, 0, 0, 0, 1, 1,
0.4718205, -1.80242, 3.465175, 0, 0, 0, 1, 1,
0.4752767, -1.259943, 2.320473, 0, 0, 0, 1, 1,
0.4761655, -0.1282341, 2.110867, 0, 0, 0, 1, 1,
0.4772689, -0.4514464, 2.960949, 0, 0, 0, 1, 1,
0.4825195, -0.08422729, 2.002181, 1, 1, 1, 1, 1,
0.4874102, -2.119008, 3.430826, 1, 1, 1, 1, 1,
0.4876097, 1.241126, 0.06761176, 1, 1, 1, 1, 1,
0.4914457, -1.011026, 2.855599, 1, 1, 1, 1, 1,
0.4930376, 1.304848, 1.530743, 1, 1, 1, 1, 1,
0.4943356, 0.4827815, 1.059071, 1, 1, 1, 1, 1,
0.5008145, 1.872306, -0.2552697, 1, 1, 1, 1, 1,
0.5090073, 0.4883088, -0.349896, 1, 1, 1, 1, 1,
0.5093647, -0.7679104, 1.362553, 1, 1, 1, 1, 1,
0.5104555, -0.2838728, 2.010785, 1, 1, 1, 1, 1,
0.5114924, -1.391197, 1.997455, 1, 1, 1, 1, 1,
0.5141472, -1.109363, 2.014287, 1, 1, 1, 1, 1,
0.5167723, 1.830746, -1.390496, 1, 1, 1, 1, 1,
0.5170267, 0.3710349, 0.9781601, 1, 1, 1, 1, 1,
0.5196116, 1.273847, 0.9377414, 1, 1, 1, 1, 1,
0.5221977, 0.1062937, 0.6665773, 0, 0, 1, 1, 1,
0.5279538, 0.3935725, -0.09117043, 1, 0, 0, 1, 1,
0.5293465, -0.1274409, 1.236595, 1, 0, 0, 1, 1,
0.5301462, 0.6194559, 0.06452873, 1, 0, 0, 1, 1,
0.5348006, -0.3059195, 2.197514, 1, 0, 0, 1, 1,
0.5389826, -0.5257741, 1.202712, 1, 0, 0, 1, 1,
0.5415922, 0.6870692, 1.300754, 0, 0, 0, 1, 1,
0.5470402, -0.3312325, 1.67311, 0, 0, 0, 1, 1,
0.5490949, -0.4880719, 1.740929, 0, 0, 0, 1, 1,
0.5515965, -1.170079, 2.806681, 0, 0, 0, 1, 1,
0.5516365, 0.2115516, -0.7185009, 0, 0, 0, 1, 1,
0.5529363, 0.7608403, 0.5473884, 0, 0, 0, 1, 1,
0.5593691, -0.9167615, 3.672287, 0, 0, 0, 1, 1,
0.559702, 0.1254287, 1.750102, 1, 1, 1, 1, 1,
0.561838, -1.11618, 3.309584, 1, 1, 1, 1, 1,
0.5650975, 0.1467566, 1.789383, 1, 1, 1, 1, 1,
0.5682443, 0.2818378, 1.749784, 1, 1, 1, 1, 1,
0.5778657, 0.647934, 0.3594796, 1, 1, 1, 1, 1,
0.583265, -0.3666234, 3.393052, 1, 1, 1, 1, 1,
0.5860304, 0.7499072, -0.2379916, 1, 1, 1, 1, 1,
0.5899264, -0.04485098, 3.036539, 1, 1, 1, 1, 1,
0.6043806, 1.161267, 2.228058, 1, 1, 1, 1, 1,
0.604687, 0.7441076, 0.9033713, 1, 1, 1, 1, 1,
0.6053146, -0.3790781, 2.313653, 1, 1, 1, 1, 1,
0.6060835, 0.9898868, 1.328089, 1, 1, 1, 1, 1,
0.6071447, 0.5967233, -0.1925168, 1, 1, 1, 1, 1,
0.608817, -2.010829, 3.016137, 1, 1, 1, 1, 1,
0.6098347, 0.7648664, -0.08468788, 1, 1, 1, 1, 1,
0.6133173, 0.8992462, -0.1517418, 0, 0, 1, 1, 1,
0.6251647, 1.185671, -0.4954574, 1, 0, 0, 1, 1,
0.6292303, -0.810316, 1.587919, 1, 0, 0, 1, 1,
0.6298914, -0.2577026, 0.5773728, 1, 0, 0, 1, 1,
0.6302323, 0.8587931, 1.33255, 1, 0, 0, 1, 1,
0.6325129, -0.1256543, 1.385279, 1, 0, 0, 1, 1,
0.6327459, -0.1753775, 1.817138, 0, 0, 0, 1, 1,
0.6403251, 0.3735493, 2.414433, 0, 0, 0, 1, 1,
0.6405967, -1.274338, 4.931625, 0, 0, 0, 1, 1,
0.6416644, -0.5713291, 2.180547, 0, 0, 0, 1, 1,
0.6477596, 1.121828, 1.194209, 0, 0, 0, 1, 1,
0.6484177, 0.5626496, 0.2781726, 0, 0, 0, 1, 1,
0.653354, 0.8107929, 0.64004, 0, 0, 0, 1, 1,
0.6533985, 0.1226763, 0.6144108, 1, 1, 1, 1, 1,
0.6544834, 0.7844819, 1.582251, 1, 1, 1, 1, 1,
0.6576478, -0.4902579, 2.585835, 1, 1, 1, 1, 1,
0.6645097, 0.986495, 0.3114712, 1, 1, 1, 1, 1,
0.6678327, 0.1692258, 0.2872058, 1, 1, 1, 1, 1,
0.6706559, -0.1843695, 0.787316, 1, 1, 1, 1, 1,
0.6724353, -0.3433825, 2.609505, 1, 1, 1, 1, 1,
0.6731064, -1.746223, 3.570269, 1, 1, 1, 1, 1,
0.6752079, 0.865378, 0.09863361, 1, 1, 1, 1, 1,
0.6771457, -1.158668, 2.077859, 1, 1, 1, 1, 1,
0.6796418, 0.8821751, 1.165422, 1, 1, 1, 1, 1,
0.6811746, 1.162392, 1.58471, 1, 1, 1, 1, 1,
0.6820023, -3.680021, 3.673423, 1, 1, 1, 1, 1,
0.6911895, 0.628672, 2.058572, 1, 1, 1, 1, 1,
0.6919028, 0.9148495, 1.168623, 1, 1, 1, 1, 1,
0.6919054, -0.5612676, 2.169624, 0, 0, 1, 1, 1,
0.6929753, -0.6659294, 2.479697, 1, 0, 0, 1, 1,
0.6962383, -1.189796, 3.792315, 1, 0, 0, 1, 1,
0.704991, -0.09419696, 1.494066, 1, 0, 0, 1, 1,
0.7058401, 1.590164, -0.1539818, 1, 0, 0, 1, 1,
0.7127671, -0.9569635, 2.609738, 1, 0, 0, 1, 1,
0.7250177, 0.9301444, 0.4512931, 0, 0, 0, 1, 1,
0.7259607, -0.5123827, 1.585241, 0, 0, 0, 1, 1,
0.7260334, -1.776512, 1.253605, 0, 0, 0, 1, 1,
0.727241, -0.2820702, 2.592523, 0, 0, 0, 1, 1,
0.7276059, -0.5094953, 0.3310373, 0, 0, 0, 1, 1,
0.7316864, 0.9140592, 1.093971, 0, 0, 0, 1, 1,
0.732804, -0.8540898, 2.942607, 0, 0, 0, 1, 1,
0.7370751, 0.5826845, 0.7967454, 1, 1, 1, 1, 1,
0.7429619, -0.985186, 2.112567, 1, 1, 1, 1, 1,
0.7466055, -0.6188068, 1.902547, 1, 1, 1, 1, 1,
0.7514632, -1.738362, 3.593514, 1, 1, 1, 1, 1,
0.7518993, 1.261527, 0.006044192, 1, 1, 1, 1, 1,
0.7530639, 0.9907494, 0.7605617, 1, 1, 1, 1, 1,
0.7561978, 1.753601, 0.5268553, 1, 1, 1, 1, 1,
0.7580471, -1.596048, 3.790052, 1, 1, 1, 1, 1,
0.7599639, -1.401458, 1.780532, 1, 1, 1, 1, 1,
0.7654281, -2.18967, 3.109241, 1, 1, 1, 1, 1,
0.7657031, -0.2216832, 2.850781, 1, 1, 1, 1, 1,
0.7658666, 0.393398, 0.08138961, 1, 1, 1, 1, 1,
0.7736917, 0.1005067, 1.378554, 1, 1, 1, 1, 1,
0.7757956, 0.6544507, -0.1053936, 1, 1, 1, 1, 1,
0.7830037, -1.746942, 4.116099, 1, 1, 1, 1, 1,
0.7893096, 0.5420877, 1.046469, 0, 0, 1, 1, 1,
0.7949985, -1.06183, 0.9366284, 1, 0, 0, 1, 1,
0.8003478, 0.8722818, -0.2733864, 1, 0, 0, 1, 1,
0.8020739, 1.540687, -0.106027, 1, 0, 0, 1, 1,
0.8025427, -0.8587183, 4.330564, 1, 0, 0, 1, 1,
0.8055284, 0.9592056, -0.1146716, 1, 0, 0, 1, 1,
0.8067451, 1.097155, 0.2391766, 0, 0, 0, 1, 1,
0.8120638, -0.738664, 3.470758, 0, 0, 0, 1, 1,
0.8137782, -1.980834, 1.024559, 0, 0, 0, 1, 1,
0.8146167, 0.8648701, 1.323866, 0, 0, 0, 1, 1,
0.8172933, -1.883396, 2.430926, 0, 0, 0, 1, 1,
0.8191503, 0.1680395, 1.298774, 0, 0, 0, 1, 1,
0.8201044, 0.08048742, 2.696881, 0, 0, 0, 1, 1,
0.8225363, 0.3305245, 0.7793946, 1, 1, 1, 1, 1,
0.8266091, 0.1890558, 0.4691563, 1, 1, 1, 1, 1,
0.8280147, -0.2245678, 1.334533, 1, 1, 1, 1, 1,
0.8340918, 1.039907, 2.004286, 1, 1, 1, 1, 1,
0.8383783, -0.4181674, 0.9562522, 1, 1, 1, 1, 1,
0.8464128, 1.281804, 0.183526, 1, 1, 1, 1, 1,
0.8488935, 0.153424, 0.02675713, 1, 1, 1, 1, 1,
0.8507027, -1.482122, 2.427182, 1, 1, 1, 1, 1,
0.8538091, -0.599359, 2.077598, 1, 1, 1, 1, 1,
0.8613772, -2.488468, 2.846814, 1, 1, 1, 1, 1,
0.8714228, -0.9605779, 0.3234287, 1, 1, 1, 1, 1,
0.8734332, -0.3259648, 1.371462, 1, 1, 1, 1, 1,
0.8765527, 0.1082001, 4.091671, 1, 1, 1, 1, 1,
0.8770349, 2.00698, -0.5155756, 1, 1, 1, 1, 1,
0.883913, 0.6953471, 1.083572, 1, 1, 1, 1, 1,
0.8888335, 0.1352579, 2.386416, 0, 0, 1, 1, 1,
0.8924348, -0.5330378, 2.51399, 1, 0, 0, 1, 1,
0.8990039, -0.443341, 2.55466, 1, 0, 0, 1, 1,
0.9011276, 0.1934435, 2.668281, 1, 0, 0, 1, 1,
0.9013583, -0.9648055, 1.790902, 1, 0, 0, 1, 1,
0.903047, -0.04635488, 1.544412, 1, 0, 0, 1, 1,
0.9041302, 0.6995533, 0.82601, 0, 0, 0, 1, 1,
0.9129933, 0.2355109, 0.2623914, 0, 0, 0, 1, 1,
0.9181897, -1.105413, 2.140145, 0, 0, 0, 1, 1,
0.91864, 1.194356, -0.2529829, 0, 0, 0, 1, 1,
0.9210254, -1.325988, 4.070064, 0, 0, 0, 1, 1,
0.9264797, -0.2292474, 1.6038, 0, 0, 0, 1, 1,
0.9281822, 0.5468466, 0.9263123, 0, 0, 0, 1, 1,
0.9284135, 0.923643, -0.2784881, 1, 1, 1, 1, 1,
0.9322826, 0.03030996, 0.6590374, 1, 1, 1, 1, 1,
0.9324967, 0.9952874, 0.02373496, 1, 1, 1, 1, 1,
0.9364197, 0.1941357, 0.7286067, 1, 1, 1, 1, 1,
0.9385737, -0.7616041, 2.20266, 1, 1, 1, 1, 1,
0.9419262, -0.0001239054, 1.245766, 1, 1, 1, 1, 1,
0.9424996, 1.567369, 0.7303512, 1, 1, 1, 1, 1,
0.9455528, -1.187549, 2.597827, 1, 1, 1, 1, 1,
0.9492797, -0.4252578, 2.542044, 1, 1, 1, 1, 1,
0.9497417, -1.121302, 1.903261, 1, 1, 1, 1, 1,
0.9551963, -1.738802, 4.009901, 1, 1, 1, 1, 1,
0.9766596, 1.237126, 0.7035326, 1, 1, 1, 1, 1,
0.98033, 0.3986568, 1.639426, 1, 1, 1, 1, 1,
0.9821814, 1.502, 1.427217, 1, 1, 1, 1, 1,
0.985675, -1.544568, 0.5787078, 1, 1, 1, 1, 1,
0.9873919, -1.302612, 2.266521, 0, 0, 1, 1, 1,
0.9878107, -0.8818882, 1.4925, 1, 0, 0, 1, 1,
0.9953001, -0.7035746, 0.8162111, 1, 0, 0, 1, 1,
1.001492, 1.114634, 2.009086, 1, 0, 0, 1, 1,
1.006678, -1.840598, 0.7058417, 1, 0, 0, 1, 1,
1.019331, -0.05512003, 1.199253, 1, 0, 0, 1, 1,
1.029573, 0.09391063, 1.806599, 0, 0, 0, 1, 1,
1.031756, 2.165153, 2.031262, 0, 0, 0, 1, 1,
1.035791, 0.1988544, 1.241813, 0, 0, 0, 1, 1,
1.040319, 0.5009203, 0.1074983, 0, 0, 0, 1, 1,
1.040345, 0.1468463, 2.483087, 0, 0, 0, 1, 1,
1.045722, 1.03257, 1.323307, 0, 0, 0, 1, 1,
1.052011, -0.04161767, 0.6900166, 0, 0, 0, 1, 1,
1.058172, -0.8543396, 1.804354, 1, 1, 1, 1, 1,
1.064746, -0.2594791, 1.743196, 1, 1, 1, 1, 1,
1.067371, -1.299463, 3.666615, 1, 1, 1, 1, 1,
1.075837, -0.9265673, 3.777298, 1, 1, 1, 1, 1,
1.075997, 0.4531602, 0.5108467, 1, 1, 1, 1, 1,
1.077303, 0.1159642, 2.492235, 1, 1, 1, 1, 1,
1.07815, 0.9378805, 2.060945, 1, 1, 1, 1, 1,
1.084182, -0.6085129, 1.222277, 1, 1, 1, 1, 1,
1.087844, 0.6840327, 1.540799, 1, 1, 1, 1, 1,
1.088317, -1.350769, 1.805729, 1, 1, 1, 1, 1,
1.089924, -0.5520577, 2.795846, 1, 1, 1, 1, 1,
1.095067, 0.5202073, 1.489316, 1, 1, 1, 1, 1,
1.096378, 0.5088622, 0.4846774, 1, 1, 1, 1, 1,
1.100948, 0.1427102, 1.541552, 1, 1, 1, 1, 1,
1.10497, -1.314356, 3.418193, 1, 1, 1, 1, 1,
1.111214, -1.158225, 1.81843, 0, 0, 1, 1, 1,
1.121545, 2.031244, 1.257938, 1, 0, 0, 1, 1,
1.122871, -0.2520161, 0.7263756, 1, 0, 0, 1, 1,
1.128663, -1.648405, 3.069622, 1, 0, 0, 1, 1,
1.133301, -1.603655, 0.06144345, 1, 0, 0, 1, 1,
1.133444, -0.9932262, 1.289734, 1, 0, 0, 1, 1,
1.133762, -0.07884462, 0.8322159, 0, 0, 0, 1, 1,
1.136435, -0.1951195, 2.578241, 0, 0, 0, 1, 1,
1.138558, 0.4171979, -0.9940602, 0, 0, 0, 1, 1,
1.150581, -0.3285238, 2.414053, 0, 0, 0, 1, 1,
1.15837, 1.429514, 0.08153825, 0, 0, 0, 1, 1,
1.160467, -1.046347, 1.28269, 0, 0, 0, 1, 1,
1.16933, 1.060696, 0.7730083, 0, 0, 0, 1, 1,
1.178226, 0.8437106, -0.2263842, 1, 1, 1, 1, 1,
1.183944, -0.1580108, 3.641314, 1, 1, 1, 1, 1,
1.190063, -0.5625184, 1.230098, 1, 1, 1, 1, 1,
1.192136, 0.8175308, 2.344922, 1, 1, 1, 1, 1,
1.194586, 0.8898612, 1.92016, 1, 1, 1, 1, 1,
1.203056, 0.2691724, 2.465688, 1, 1, 1, 1, 1,
1.210861, 0.2223316, 1.077995, 1, 1, 1, 1, 1,
1.214944, 0.9301096, 1.41149, 1, 1, 1, 1, 1,
1.231155, -1.049434, 1.464852, 1, 1, 1, 1, 1,
1.239688, 0.3150935, 1.244623, 1, 1, 1, 1, 1,
1.244557, 0.5248432, -1.137405, 1, 1, 1, 1, 1,
1.262491, -0.9644934, 1.968557, 1, 1, 1, 1, 1,
1.264339, 0.06711226, 0.3599107, 1, 1, 1, 1, 1,
1.266293, -0.80019, -0.1449966, 1, 1, 1, 1, 1,
1.270521, 0.3259318, 0.7006686, 1, 1, 1, 1, 1,
1.2725, 0.2055284, 2.080178, 0, 0, 1, 1, 1,
1.276299, -0.4175857, 0.538275, 1, 0, 0, 1, 1,
1.276343, -1.054592, 1.631958, 1, 0, 0, 1, 1,
1.285344, 2.092166, -1.111761, 1, 0, 0, 1, 1,
1.302729, 0.1472579, 1.332805, 1, 0, 0, 1, 1,
1.303184, 0.2333539, 1.344912, 1, 0, 0, 1, 1,
1.310021, -1.199676, 2.519489, 0, 0, 0, 1, 1,
1.310624, -0.5823063, 0.9760125, 0, 0, 0, 1, 1,
1.314667, 0.008178888, 2.298935, 0, 0, 0, 1, 1,
1.325009, 0.3395969, 1.904829, 0, 0, 0, 1, 1,
1.325744, -0.05815272, 2.832003, 0, 0, 0, 1, 1,
1.326809, -1.321985, 1.507419, 0, 0, 0, 1, 1,
1.335167, 1.756794, 1.296393, 0, 0, 0, 1, 1,
1.355606, -1.548311, 0.9072164, 1, 1, 1, 1, 1,
1.357234, -0.2148674, 3.347287, 1, 1, 1, 1, 1,
1.357661, 0.9227799, -0.8673945, 1, 1, 1, 1, 1,
1.370017, 1.284523, 0.07972276, 1, 1, 1, 1, 1,
1.394127, 1.063029, -0.1785593, 1, 1, 1, 1, 1,
1.398477, 0.2623421, 1.051469, 1, 1, 1, 1, 1,
1.409608, -0.9857607, 3.80104, 1, 1, 1, 1, 1,
1.414258, -0.02774291, 0.02255, 1, 1, 1, 1, 1,
1.420891, 0.237821, 1.775657, 1, 1, 1, 1, 1,
1.424275, -1.507874, 1.673896, 1, 1, 1, 1, 1,
1.444721, -0.2911203, 0.7226872, 1, 1, 1, 1, 1,
1.450757, -1.369475, 1.436045, 1, 1, 1, 1, 1,
1.453643, 1.559888, 0.3018129, 1, 1, 1, 1, 1,
1.459001, -0.4823325, 2.765083, 1, 1, 1, 1, 1,
1.467022, 0.3632957, 1.278555, 1, 1, 1, 1, 1,
1.467978, -0.4283261, 1.452279, 0, 0, 1, 1, 1,
1.471457, 1.713456, 1.244136, 1, 0, 0, 1, 1,
1.477524, -0.279688, 1.881542, 1, 0, 0, 1, 1,
1.483902, -3.106133, 1.49479, 1, 0, 0, 1, 1,
1.494283, 0.06696645, 1.922805, 1, 0, 0, 1, 1,
1.495708, 1.628215, 1.37793, 1, 0, 0, 1, 1,
1.496855, -0.07358482, 0.3067988, 0, 0, 0, 1, 1,
1.503711, -0.2410208, 1.833868, 0, 0, 0, 1, 1,
1.513317, -1.504338, 2.592288, 0, 0, 0, 1, 1,
1.524312, 0.747454, 2.054342, 0, 0, 0, 1, 1,
1.533537, 0.3450339, 2.409822, 0, 0, 0, 1, 1,
1.544494, -0.03758993, 3.214157, 0, 0, 0, 1, 1,
1.582765, -1.782835, 3.299716, 0, 0, 0, 1, 1,
1.590389, 1.385793, 1.462522, 1, 1, 1, 1, 1,
1.592283, -0.6850165, 2.657705, 1, 1, 1, 1, 1,
1.59249, 0.6450421, 0.7483755, 1, 1, 1, 1, 1,
1.623988, 1.302456, 1.675349, 1, 1, 1, 1, 1,
1.629749, -1.150095, 0.9940419, 1, 1, 1, 1, 1,
1.656663, -0.1219616, -0.2467701, 1, 1, 1, 1, 1,
1.686964, -1.494427, 0.9831821, 1, 1, 1, 1, 1,
1.705169, -1.192765, 1.728942, 1, 1, 1, 1, 1,
1.712152, -1.021097, 2.032548, 1, 1, 1, 1, 1,
1.720837, 0.7424264, 1.061339, 1, 1, 1, 1, 1,
1.739524, -0.1002691, 0.8304264, 1, 1, 1, 1, 1,
1.742685, 0.1933757, 2.611232, 1, 1, 1, 1, 1,
1.746665, -1.487344, 1.382866, 1, 1, 1, 1, 1,
1.747816, -0.07904647, 2.55796, 1, 1, 1, 1, 1,
1.750435, 0.2770032, 0.8786076, 1, 1, 1, 1, 1,
1.764089, 0.09560434, 1.161284, 0, 0, 1, 1, 1,
1.794672, -0.9431328, 1.851368, 1, 0, 0, 1, 1,
1.802971, 0.3935713, 4.730703, 1, 0, 0, 1, 1,
1.814074, -0.2292439, 2.666188, 1, 0, 0, 1, 1,
1.818205, 1.152265, -1.030002, 1, 0, 0, 1, 1,
1.826626, 0.1458886, 2.855294, 1, 0, 0, 1, 1,
1.84324, 0.7902048, 1.543416, 0, 0, 0, 1, 1,
1.854605, 0.05321816, 0.7348396, 0, 0, 0, 1, 1,
1.859099, 1.29447, 2.043734, 0, 0, 0, 1, 1,
1.864772, 0.4699394, -0.1054386, 0, 0, 0, 1, 1,
1.865285, -0.7171806, 0.9626526, 0, 0, 0, 1, 1,
1.86639, 0.08511948, 1.28906, 0, 0, 0, 1, 1,
1.894712, -0.04555875, 3.641377, 0, 0, 0, 1, 1,
1.925969, 0.7747891, 3.952664, 1, 1, 1, 1, 1,
1.927236, 1.62201, -0.3962243, 1, 1, 1, 1, 1,
1.937565, -0.3554589, 1.407418, 1, 1, 1, 1, 1,
1.950588, -0.6159061, 2.384948, 1, 1, 1, 1, 1,
1.95148, -1.107746, 4.212804, 1, 1, 1, 1, 1,
1.965119, 0.2328126, 0.3436986, 1, 1, 1, 1, 1,
1.985639, 0.3635956, 2.062911, 1, 1, 1, 1, 1,
2.026438, -0.01459636, 0.8513006, 1, 1, 1, 1, 1,
2.033357, 1.018481, 1.150562, 1, 1, 1, 1, 1,
2.046852, -1.026235, 2.612387, 1, 1, 1, 1, 1,
2.053188, 1.098766, 3.439889, 1, 1, 1, 1, 1,
2.059684, 0.8821419, 0.09286059, 1, 1, 1, 1, 1,
2.079147, -2.486761, 3.136635, 1, 1, 1, 1, 1,
2.105863, 0.06936476, 0.5389069, 1, 1, 1, 1, 1,
2.114076, -0.2624253, 2.055252, 1, 1, 1, 1, 1,
2.115903, -0.684344, 2.857657, 0, 0, 1, 1, 1,
2.208865, -2.533385, 1.982268, 1, 0, 0, 1, 1,
2.218725, -0.05611511, 1.300115, 1, 0, 0, 1, 1,
2.244613, 1.039223, -0.01302901, 1, 0, 0, 1, 1,
2.312122, 0.5019251, -0.4967075, 1, 0, 0, 1, 1,
2.339941, 0.06247666, 1.57718, 1, 0, 0, 1, 1,
2.3507, -1.088134, 3.439294, 0, 0, 0, 1, 1,
2.366714, 0.004527375, 4.563588, 0, 0, 0, 1, 1,
2.429243, 0.6443447, 2.551941, 0, 0, 0, 1, 1,
2.432007, 1.197903, 1.680964, 0, 0, 0, 1, 1,
2.447176, -0.4212433, 1.721061, 0, 0, 0, 1, 1,
2.456558, -0.4854873, 2.629315, 0, 0, 0, 1, 1,
2.490012, 0.007906799, 1.171709, 0, 0, 0, 1, 1,
2.560228, 1.120554, 0.5013825, 1, 1, 1, 1, 1,
2.718235, -1.256639, 1.402047, 1, 1, 1, 1, 1,
2.741075, -0.163691, 2.094139, 1, 1, 1, 1, 1,
2.760018, 0.6554399, 1.820962, 1, 1, 1, 1, 1,
2.779983, -1.17502, 1.409761, 1, 1, 1, 1, 1,
2.794302, -0.590055, 2.645676, 1, 1, 1, 1, 1,
3.732198, 0.05611002, 0.6738247, 1, 1, 1, 1, 1
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
var radius = 9.620127;
var distance = 33.79028;
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
mvMatrix.translate( -0.296967, 0.3691227, 0.05752325 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79028);
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
