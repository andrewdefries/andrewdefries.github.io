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
-3.320555, 0.6338216, -2.044521, 1, 0, 0, 1,
-3.199465, -1.102201, -2.007774, 1, 0.007843138, 0, 1,
-3.027651, 1.164287, -1.931589, 1, 0.01176471, 0, 1,
-2.626085, 0.5320162, -0.1047574, 1, 0.01960784, 0, 1,
-2.601952, 2.336557, -0.3061491, 1, 0.02352941, 0, 1,
-2.55388, 1.163084, -1.333339, 1, 0.03137255, 0, 1,
-2.547936, -1.395391, -3.386714, 1, 0.03529412, 0, 1,
-2.416855, -1.521449, -5.031598, 1, 0.04313726, 0, 1,
-2.404996, 0.3983347, -0.1808834, 1, 0.04705882, 0, 1,
-2.360964, -0.1240712, -1.221512, 1, 0.05490196, 0, 1,
-2.328008, 1.584707, -0.2334687, 1, 0.05882353, 0, 1,
-2.304596, -0.5112121, -0.9755233, 1, 0.06666667, 0, 1,
-2.297341, 1.138719, -1.649825, 1, 0.07058824, 0, 1,
-2.289554, -0.5203994, -0.5387304, 1, 0.07843138, 0, 1,
-2.25811, 0.2087384, -3.402347, 1, 0.08235294, 0, 1,
-2.240771, 0.5279821, -0.8570158, 1, 0.09019608, 0, 1,
-2.218554, 0.9571945, 1.374978, 1, 0.09411765, 0, 1,
-2.202869, -0.1990134, -0.8087952, 1, 0.1019608, 0, 1,
-2.193614, -1.562199, -3.630073, 1, 0.1098039, 0, 1,
-2.18837, 1.204584, -1.961597, 1, 0.1137255, 0, 1,
-2.184598, -0.1849472, -1.45505, 1, 0.1215686, 0, 1,
-2.166056, -0.09214038, -2.30832, 1, 0.1254902, 0, 1,
-2.153537, 1.950406, 0.566126, 1, 0.1333333, 0, 1,
-2.141738, -1.860329, -2.519253, 1, 0.1372549, 0, 1,
-2.132998, 0.3171331, -2.884398, 1, 0.145098, 0, 1,
-2.081723, -0.698458, -2.326046, 1, 0.1490196, 0, 1,
-2.037662, 0.266544, -1.546407, 1, 0.1568628, 0, 1,
-2.007464, -0.5844287, -5.838027, 1, 0.1607843, 0, 1,
-1.982813, -1.844169, -3.196343, 1, 0.1686275, 0, 1,
-1.929185, -0.08977631, -2.375886, 1, 0.172549, 0, 1,
-1.921871, 0.005885318, -0.1582691, 1, 0.1803922, 0, 1,
-1.901346, -2.64903, -2.422813, 1, 0.1843137, 0, 1,
-1.887958, -1.500789, -1.731552, 1, 0.1921569, 0, 1,
-1.887303, -1.125604, -2.346617, 1, 0.1960784, 0, 1,
-1.865405, -0.04527473, -0.2837169, 1, 0.2039216, 0, 1,
-1.824723, 1.751529, -1.905085, 1, 0.2117647, 0, 1,
-1.78584, -0.8039234, -3.269135, 1, 0.2156863, 0, 1,
-1.771164, 0.4664357, -1.704055, 1, 0.2235294, 0, 1,
-1.751595, 0.08780037, -0.948132, 1, 0.227451, 0, 1,
-1.749565, -1.988519, -1.910825, 1, 0.2352941, 0, 1,
-1.730324, 0.7184238, -0.6241181, 1, 0.2392157, 0, 1,
-1.725963, -0.9989706, -2.010982, 1, 0.2470588, 0, 1,
-1.725918, 0.9651835, -0.9984931, 1, 0.2509804, 0, 1,
-1.723706, -0.07624943, -1.150824, 1, 0.2588235, 0, 1,
-1.722984, 1.093935, -1.940498, 1, 0.2627451, 0, 1,
-1.703885, -1.485719, -2.3803, 1, 0.2705882, 0, 1,
-1.698618, -0.6308635, -0.5865176, 1, 0.2745098, 0, 1,
-1.680593, 0.6889751, 0.1674536, 1, 0.282353, 0, 1,
-1.675951, -1.300849, -2.444925, 1, 0.2862745, 0, 1,
-1.647843, -0.3130823, -2.661041, 1, 0.2941177, 0, 1,
-1.645668, 0.454059, -0.8632706, 1, 0.3019608, 0, 1,
-1.622249, -0.10791, -1.65726, 1, 0.3058824, 0, 1,
-1.594933, -1.740678, -2.495504, 1, 0.3137255, 0, 1,
-1.582844, 1.67907, -0.2214242, 1, 0.3176471, 0, 1,
-1.581766, 0.1065216, -2.411511, 1, 0.3254902, 0, 1,
-1.572743, -0.7407172, -0.8389925, 1, 0.3294118, 0, 1,
-1.567376, 1.234977, -1.548654, 1, 0.3372549, 0, 1,
-1.564886, -0.5691428, -1.491866, 1, 0.3411765, 0, 1,
-1.563699, -0.2061789, -3.955319, 1, 0.3490196, 0, 1,
-1.55415, 0.5932155, -1.345665, 1, 0.3529412, 0, 1,
-1.520587, -1.700611, -0.9941203, 1, 0.3607843, 0, 1,
-1.513705, 1.18016, -1.034658, 1, 0.3647059, 0, 1,
-1.496176, 0.9984934, -2.505841, 1, 0.372549, 0, 1,
-1.486021, -0.3777539, -3.541307, 1, 0.3764706, 0, 1,
-1.479814, -0.9595537, -3.939173, 1, 0.3843137, 0, 1,
-1.478175, -2.58038, -2.28138, 1, 0.3882353, 0, 1,
-1.477567, -1.09982, -3.112949, 1, 0.3960784, 0, 1,
-1.476194, -0.2328955, -1.692918, 1, 0.4039216, 0, 1,
-1.473572, -1.446414, -1.200182, 1, 0.4078431, 0, 1,
-1.456786, 1.463696, 0.1479923, 1, 0.4156863, 0, 1,
-1.456284, -1.640603, -2.020698, 1, 0.4196078, 0, 1,
-1.449967, -0.9342473, 0.2449877, 1, 0.427451, 0, 1,
-1.443259, 0.4621523, -2.068474, 1, 0.4313726, 0, 1,
-1.440052, -0.2518758, -2.20042, 1, 0.4392157, 0, 1,
-1.438169, 0.6872774, -1.066609, 1, 0.4431373, 0, 1,
-1.42292, -0.9148718, -2.658285, 1, 0.4509804, 0, 1,
-1.414619, 0.2688851, -1.760626, 1, 0.454902, 0, 1,
-1.384442, -0.7801036, -2.206635, 1, 0.4627451, 0, 1,
-1.367081, 0.7769934, -1.928681, 1, 0.4666667, 0, 1,
-1.363199, 0.1080003, -2.535953, 1, 0.4745098, 0, 1,
-1.360096, 0.619746, 0.2291869, 1, 0.4784314, 0, 1,
-1.353047, 1.53239, -1.090289, 1, 0.4862745, 0, 1,
-1.343621, -0.2123745, -2.204201, 1, 0.4901961, 0, 1,
-1.333639, -0.6740246, -2.534214, 1, 0.4980392, 0, 1,
-1.332683, 0.01799097, -1.784687, 1, 0.5058824, 0, 1,
-1.325862, -0.2162789, -3.207968, 1, 0.509804, 0, 1,
-1.324569, -0.1562764, 0.2108305, 1, 0.5176471, 0, 1,
-1.323185, 0.2269397, -3.841308, 1, 0.5215687, 0, 1,
-1.321262, 0.2500895, -0.6975954, 1, 0.5294118, 0, 1,
-1.315447, -1.849924, -1.480475, 1, 0.5333334, 0, 1,
-1.31099, 0.5452284, -1.773906, 1, 0.5411765, 0, 1,
-1.301766, 0.7638001, -0.9620821, 1, 0.5450981, 0, 1,
-1.301266, 0.04454868, 0.2021109, 1, 0.5529412, 0, 1,
-1.298575, -0.6876876, -2.266623, 1, 0.5568628, 0, 1,
-1.296879, -0.175699, -3.057745, 1, 0.5647059, 0, 1,
-1.29648, -0.002844804, -1.499164, 1, 0.5686275, 0, 1,
-1.288883, -0.8846602, -3.881978, 1, 0.5764706, 0, 1,
-1.280604, 0.755618, -2.007211, 1, 0.5803922, 0, 1,
-1.250768, -0.06568182, -2.145977, 1, 0.5882353, 0, 1,
-1.250719, 1.000121, -2.013321, 1, 0.5921569, 0, 1,
-1.244681, -0.5262797, 0.8708495, 1, 0.6, 0, 1,
-1.237989, -0.2771821, -4.893553, 1, 0.6078432, 0, 1,
-1.237566, 1.607599, 0.224516, 1, 0.6117647, 0, 1,
-1.237209, -0.6327369, -1.500464, 1, 0.6196079, 0, 1,
-1.235433, -0.2538107, -2.001195, 1, 0.6235294, 0, 1,
-1.23534, -1.832727, -1.971417, 1, 0.6313726, 0, 1,
-1.235318, -0.5253176, -1.822698, 1, 0.6352941, 0, 1,
-1.234633, -0.1952555, -0.4134745, 1, 0.6431373, 0, 1,
-1.232427, 0.158846, -1.955932, 1, 0.6470588, 0, 1,
-1.224285, -1.497112, -1.815788, 1, 0.654902, 0, 1,
-1.215945, -0.05980247, -2.115404, 1, 0.6588235, 0, 1,
-1.214149, 1.297466, -1.905301, 1, 0.6666667, 0, 1,
-1.214103, 0.5337147, -3.207783, 1, 0.6705883, 0, 1,
-1.209898, 2.134434, -1.476514, 1, 0.6784314, 0, 1,
-1.198405, -0.9005049, -0.6642856, 1, 0.682353, 0, 1,
-1.194277, -0.05395156, -2.172434, 1, 0.6901961, 0, 1,
-1.193697, -1.461119, -2.098051, 1, 0.6941177, 0, 1,
-1.190458, -0.1285836, -2.488157, 1, 0.7019608, 0, 1,
-1.188896, -1.121895, -1.884668, 1, 0.7098039, 0, 1,
-1.187337, 0.007644351, -3.079704, 1, 0.7137255, 0, 1,
-1.184646, 0.4555301, -1.828261, 1, 0.7215686, 0, 1,
-1.181494, 0.8518547, -0.6071222, 1, 0.7254902, 0, 1,
-1.177504, 0.6920099, -2.127134, 1, 0.7333333, 0, 1,
-1.175079, 0.6046412, -1.358546, 1, 0.7372549, 0, 1,
-1.172598, 0.4070664, -1.957781, 1, 0.7450981, 0, 1,
-1.171332, 0.367052, -3.391099, 1, 0.7490196, 0, 1,
-1.170801, -0.2371647, -0.7501963, 1, 0.7568628, 0, 1,
-1.169522, -0.9594492, -2.078148, 1, 0.7607843, 0, 1,
-1.166918, 0.5734054, 0.1694966, 1, 0.7686275, 0, 1,
-1.163588, 1.208369, 0.1164479, 1, 0.772549, 0, 1,
-1.144493, -0.3618555, -4.663099, 1, 0.7803922, 0, 1,
-1.143335, 0.5175443, -1.830307, 1, 0.7843137, 0, 1,
-1.141085, -1.602272, -3.631324, 1, 0.7921569, 0, 1,
-1.140944, 0.2623979, -0.7889747, 1, 0.7960784, 0, 1,
-1.136097, 0.5634325, -1.518096, 1, 0.8039216, 0, 1,
-1.130316, 0.3129252, -1.249103, 1, 0.8117647, 0, 1,
-1.123392, 0.06744885, 0.3313189, 1, 0.8156863, 0, 1,
-1.120993, 0.3842213, -2.324259, 1, 0.8235294, 0, 1,
-1.118902, -1.306177, -0.9799927, 1, 0.827451, 0, 1,
-1.115357, 0.2814569, -0.4038593, 1, 0.8352941, 0, 1,
-1.110515, 0.09725618, -1.35536, 1, 0.8392157, 0, 1,
-1.103775, -0.4523595, -0.6694753, 1, 0.8470588, 0, 1,
-1.101771, 0.420176, -2.071606, 1, 0.8509804, 0, 1,
-1.094107, -0.7311707, -5.663268, 1, 0.8588235, 0, 1,
-1.092827, -0.210267, -1.604505, 1, 0.8627451, 0, 1,
-1.083808, -0.5377024, -0.2719469, 1, 0.8705882, 0, 1,
-1.082784, -0.8157229, -2.278803, 1, 0.8745098, 0, 1,
-1.070175, 1.99488, -0.493524, 1, 0.8823529, 0, 1,
-1.069106, 0.5492972, -0.7146167, 1, 0.8862745, 0, 1,
-1.068536, -1.114516, -1.760432, 1, 0.8941177, 0, 1,
-1.068055, 1.220511, -1.025412, 1, 0.8980392, 0, 1,
-1.061803, 0.1554793, -2.620323, 1, 0.9058824, 0, 1,
-1.061545, 1.142867, -0.9007636, 1, 0.9137255, 0, 1,
-1.054963, 1.663437, 0.2910735, 1, 0.9176471, 0, 1,
-1.053684, -0.1130676, -3.505469, 1, 0.9254902, 0, 1,
-1.05204, 0.7822861, -1.248181, 1, 0.9294118, 0, 1,
-1.051949, -1.517898, -3.724768, 1, 0.9372549, 0, 1,
-1.04408, -0.1695463, -0.1103178, 1, 0.9411765, 0, 1,
-1.033087, 0.999423, 1.345531, 1, 0.9490196, 0, 1,
-1.031582, 0.8449119, -0.5762569, 1, 0.9529412, 0, 1,
-1.020973, 0.4373685, -0.8370941, 1, 0.9607843, 0, 1,
-1.017601, 2.74679, 0.5741122, 1, 0.9647059, 0, 1,
-1.016356, 0.04646615, -3.104393, 1, 0.972549, 0, 1,
-1.011727, 1.499111, -0.08005344, 1, 0.9764706, 0, 1,
-1.007028, -0.9261147, -2.828584, 1, 0.9843137, 0, 1,
-1.00471, -2.867216, -3.567004, 1, 0.9882353, 0, 1,
-1.004322, 0.8452913, -0.5311639, 1, 0.9960784, 0, 1,
-1.002772, 0.8903003, -1.17123, 0.9960784, 1, 0, 1,
-0.9973775, 0.4065432, -1.832383, 0.9921569, 1, 0, 1,
-0.9972555, 0.05142033, -0.8856555, 0.9843137, 1, 0, 1,
-0.9954392, 0.4464039, -0.02975233, 0.9803922, 1, 0, 1,
-0.9950514, -0.8335093, -4.49081, 0.972549, 1, 0, 1,
-0.9946138, -2.254386, -2.924302, 0.9686275, 1, 0, 1,
-0.9942452, 1.256979, -0.8281345, 0.9607843, 1, 0, 1,
-0.9918441, -1.239843, -2.479811, 0.9568627, 1, 0, 1,
-0.9906365, 1.153366, -2.330879, 0.9490196, 1, 0, 1,
-0.9688985, -1.033011, -3.405925, 0.945098, 1, 0, 1,
-0.9658014, -0.3985789, -2.578209, 0.9372549, 1, 0, 1,
-0.9567322, -0.313697, -2.252228, 0.9333333, 1, 0, 1,
-0.9546619, -0.8605732, -3.538337, 0.9254902, 1, 0, 1,
-0.9536324, 1.035547, -1.143513, 0.9215686, 1, 0, 1,
-0.9529101, -1.259111, -2.866503, 0.9137255, 1, 0, 1,
-0.9506271, 0.4124836, -2.69427, 0.9098039, 1, 0, 1,
-0.9481156, 0.1609979, 0.02217625, 0.9019608, 1, 0, 1,
-0.9355954, 1.092137, -1.928328, 0.8941177, 1, 0, 1,
-0.9350679, -0.0034833, -1.721083, 0.8901961, 1, 0, 1,
-0.9334447, 0.5822343, -0.5533603, 0.8823529, 1, 0, 1,
-0.9291278, -0.5863263, -3.5555, 0.8784314, 1, 0, 1,
-0.9259506, -1.551729, -3.361422, 0.8705882, 1, 0, 1,
-0.9213281, -1.628609, -2.864272, 0.8666667, 1, 0, 1,
-0.9187931, 0.4298221, -1.001276, 0.8588235, 1, 0, 1,
-0.9117888, 0.5440835, -1.680377, 0.854902, 1, 0, 1,
-0.9087498, 0.7198747, -1.364567, 0.8470588, 1, 0, 1,
-0.9023643, -1.731092, -0.5851573, 0.8431373, 1, 0, 1,
-0.8753009, 0.154934, -0.7501541, 0.8352941, 1, 0, 1,
-0.8686315, -0.1902224, -1.201898, 0.8313726, 1, 0, 1,
-0.8681992, 0.07539736, -2.389596, 0.8235294, 1, 0, 1,
-0.865382, 0.1010707, -1.078255, 0.8196079, 1, 0, 1,
-0.8615175, -0.2376871, -1.471262, 0.8117647, 1, 0, 1,
-0.8566267, 1.133034, -1.662236, 0.8078431, 1, 0, 1,
-0.8535726, -1.85126, -2.005123, 0.8, 1, 0, 1,
-0.8514179, 0.3954552, -1.004583, 0.7921569, 1, 0, 1,
-0.8444081, 0.4024265, -0.4569875, 0.7882353, 1, 0, 1,
-0.8440139, 0.01286167, -1.071433, 0.7803922, 1, 0, 1,
-0.841379, -1.534217, -4.703261, 0.7764706, 1, 0, 1,
-0.8381357, 0.7598812, -0.06085346, 0.7686275, 1, 0, 1,
-0.8308944, -0.127236, -2.444564, 0.7647059, 1, 0, 1,
-0.8281285, 1.756583, -2.083377, 0.7568628, 1, 0, 1,
-0.8270316, -0.2508088, -3.597591, 0.7529412, 1, 0, 1,
-0.8208178, 1.179149, -1.523209, 0.7450981, 1, 0, 1,
-0.8200276, -0.2953358, -1.450994, 0.7411765, 1, 0, 1,
-0.8174508, 0.5369889, -1.58138, 0.7333333, 1, 0, 1,
-0.8152275, 0.1660393, -0.3835223, 0.7294118, 1, 0, 1,
-0.8145944, 1.343385, 0.00486561, 0.7215686, 1, 0, 1,
-0.8130341, 0.5154573, -3.138603, 0.7176471, 1, 0, 1,
-0.8121561, -1.130519, -3.349513, 0.7098039, 1, 0, 1,
-0.8104537, 0.7005622, -0.8981959, 0.7058824, 1, 0, 1,
-0.8056124, -0.8940511, -2.631646, 0.6980392, 1, 0, 1,
-0.8006357, -1.56683, -2.267761, 0.6901961, 1, 0, 1,
-0.7988604, -0.07934228, -1.28164, 0.6862745, 1, 0, 1,
-0.7962633, 1.376857, -1.5419, 0.6784314, 1, 0, 1,
-0.7946654, 0.568025, -1.186594, 0.6745098, 1, 0, 1,
-0.7930758, -0.3751547, -3.061473, 0.6666667, 1, 0, 1,
-0.7868134, -0.3623522, -2.940388, 0.6627451, 1, 0, 1,
-0.7853837, 0.1289915, -2.422544, 0.654902, 1, 0, 1,
-0.779826, -1.816143, -2.653363, 0.6509804, 1, 0, 1,
-0.7642558, -0.1161973, -3.509668, 0.6431373, 1, 0, 1,
-0.7641578, 1.355719, -0.8812318, 0.6392157, 1, 0, 1,
-0.7591008, -0.4273633, -2.478921, 0.6313726, 1, 0, 1,
-0.7522449, -1.555551, -3.607991, 0.627451, 1, 0, 1,
-0.7520099, -1.987122, -2.910506, 0.6196079, 1, 0, 1,
-0.7508529, 1.396276, 0.1610176, 0.6156863, 1, 0, 1,
-0.7499827, -1.103927, -0.0331542, 0.6078432, 1, 0, 1,
-0.7493711, -0.8976523, -2.788135, 0.6039216, 1, 0, 1,
-0.7492859, -0.383233, -1.861411, 0.5960785, 1, 0, 1,
-0.7487739, 0.7503837, -1.342655, 0.5882353, 1, 0, 1,
-0.7474862, -1.51322, -2.456416, 0.5843138, 1, 0, 1,
-0.7457729, 0.2632945, -0.4063817, 0.5764706, 1, 0, 1,
-0.7443572, -1.674457, -3.042342, 0.572549, 1, 0, 1,
-0.7333163, -0.7416718, -3.003989, 0.5647059, 1, 0, 1,
-0.7320695, -0.644461, -1.280479, 0.5607843, 1, 0, 1,
-0.7247491, 0.8109439, -0.7797938, 0.5529412, 1, 0, 1,
-0.7207534, 1.761357, -1.164001, 0.5490196, 1, 0, 1,
-0.7167223, -0.3834816, -3.125745, 0.5411765, 1, 0, 1,
-0.7161559, 1.832351, 0.2955664, 0.5372549, 1, 0, 1,
-0.7090957, -0.6992854, -1.55966, 0.5294118, 1, 0, 1,
-0.708048, 0.1382135, -0.7346483, 0.5254902, 1, 0, 1,
-0.7075402, 1.545827, -1.737212, 0.5176471, 1, 0, 1,
-0.7063512, 0.09549108, -2.612782, 0.5137255, 1, 0, 1,
-0.7053836, -0.7971811, -2.182519, 0.5058824, 1, 0, 1,
-0.7037998, 0.6166775, 0.4852368, 0.5019608, 1, 0, 1,
-0.7027482, -1.198979, -3.747076, 0.4941176, 1, 0, 1,
-0.702376, 0.2457502, -1.475451, 0.4862745, 1, 0, 1,
-0.6991674, 1.317895, -1.182928, 0.4823529, 1, 0, 1,
-0.6936724, -0.4432035, -1.584275, 0.4745098, 1, 0, 1,
-0.684392, -0.3742178, -1.137168, 0.4705882, 1, 0, 1,
-0.6820601, 0.4821303, -0.3855279, 0.4627451, 1, 0, 1,
-0.6801037, 1.208107, -0.9418975, 0.4588235, 1, 0, 1,
-0.6783071, -1.103926, -0.465151, 0.4509804, 1, 0, 1,
-0.674018, 0.7060174, -1.296331, 0.4470588, 1, 0, 1,
-0.6687019, -0.5029963, -4.062842, 0.4392157, 1, 0, 1,
-0.6679059, 0.2334733, -1.285211, 0.4352941, 1, 0, 1,
-0.6613773, -1.618653, -3.121651, 0.427451, 1, 0, 1,
-0.6547084, -0.144689, -0.4284774, 0.4235294, 1, 0, 1,
-0.6500367, 0.2042145, -2.7181, 0.4156863, 1, 0, 1,
-0.6479611, 1.306554, -0.02793887, 0.4117647, 1, 0, 1,
-0.6470914, 0.3912856, -1.704743, 0.4039216, 1, 0, 1,
-0.644133, -1.051288, -2.388613, 0.3960784, 1, 0, 1,
-0.6429303, -0.6038079, -1.765349, 0.3921569, 1, 0, 1,
-0.6422141, 0.4249336, -1.525465, 0.3843137, 1, 0, 1,
-0.6377754, -0.7857153, -3.598153, 0.3803922, 1, 0, 1,
-0.6367661, 0.5842677, 0.9412711, 0.372549, 1, 0, 1,
-0.6337062, 0.5564201, 1.263944, 0.3686275, 1, 0, 1,
-0.6248964, 2.139856, 0.7634916, 0.3607843, 1, 0, 1,
-0.6215459, 0.3602856, -1.518633, 0.3568628, 1, 0, 1,
-0.6033843, -0.7194612, -1.447979, 0.3490196, 1, 0, 1,
-0.6033084, 0.02929551, -2.266114, 0.345098, 1, 0, 1,
-0.6020872, -2.47753, -2.727349, 0.3372549, 1, 0, 1,
-0.6012368, -0.8906325, -1.59355, 0.3333333, 1, 0, 1,
-0.5982878, 1.702217, 0.5898861, 0.3254902, 1, 0, 1,
-0.5960522, 0.8601037, -1.479918, 0.3215686, 1, 0, 1,
-0.5952063, 1.14024, -0.07796767, 0.3137255, 1, 0, 1,
-0.5934011, 1.212886, 1.711553, 0.3098039, 1, 0, 1,
-0.5921254, 0.9537638, 0.3106422, 0.3019608, 1, 0, 1,
-0.5920525, -0.6937643, -3.926179, 0.2941177, 1, 0, 1,
-0.589384, -0.6589955, -2.582458, 0.2901961, 1, 0, 1,
-0.5845922, 1.450692, -1.164701, 0.282353, 1, 0, 1,
-0.5830574, -2.418005, -1.454992, 0.2784314, 1, 0, 1,
-0.5804842, 0.458289, -0.9603183, 0.2705882, 1, 0, 1,
-0.5752482, 0.3179448, -2.642578, 0.2666667, 1, 0, 1,
-0.5739954, -0.1876981, -2.153678, 0.2588235, 1, 0, 1,
-0.5735776, -0.3499126, -1.927786, 0.254902, 1, 0, 1,
-0.5731748, 1.211078, -1.958691, 0.2470588, 1, 0, 1,
-0.5711966, 0.6842059, -1.523467, 0.2431373, 1, 0, 1,
-0.5693113, -0.623118, -2.220541, 0.2352941, 1, 0, 1,
-0.5666552, 0.05890318, -3.062068, 0.2313726, 1, 0, 1,
-0.565613, 0.6109139, -0.4927821, 0.2235294, 1, 0, 1,
-0.5655703, 1.370258, -0.6058611, 0.2196078, 1, 0, 1,
-0.5648937, -0.5584078, -1.62039, 0.2117647, 1, 0, 1,
-0.5640946, 0.8498034, -1.787668, 0.2078431, 1, 0, 1,
-0.5610172, 1.408826, -0.2878532, 0.2, 1, 0, 1,
-0.5497657, 1.628627, -1.254615, 0.1921569, 1, 0, 1,
-0.5481374, 0.3302666, -1.691741, 0.1882353, 1, 0, 1,
-0.5480671, 0.5271153, -1.632097, 0.1803922, 1, 0, 1,
-0.5308697, 0.1498576, 0.7249495, 0.1764706, 1, 0, 1,
-0.5247777, 0.5137925, -0.4838087, 0.1686275, 1, 0, 1,
-0.5230188, 0.6731872, 1.021377, 0.1647059, 1, 0, 1,
-0.5090564, 1.758545, 0.5593374, 0.1568628, 1, 0, 1,
-0.5021759, -3.019673, -1.050821, 0.1529412, 1, 0, 1,
-0.498391, 1.056897, -0.3500786, 0.145098, 1, 0, 1,
-0.4981605, -1.861218, -2.905308, 0.1411765, 1, 0, 1,
-0.4981579, -1.247004, -2.705344, 0.1333333, 1, 0, 1,
-0.4954588, -1.418014, -3.192675, 0.1294118, 1, 0, 1,
-0.486629, 0.3504693, -1.603403, 0.1215686, 1, 0, 1,
-0.4840405, -1.580337, -3.755153, 0.1176471, 1, 0, 1,
-0.4826286, -0.4939357, -2.849277, 0.1098039, 1, 0, 1,
-0.4778739, 0.5666182, -1.867826, 0.1058824, 1, 0, 1,
-0.4734612, 0.5309849, 1.147883, 0.09803922, 1, 0, 1,
-0.4702841, 1.552642, -0.2035488, 0.09019608, 1, 0, 1,
-0.4611183, 1.445735, 0.4813097, 0.08627451, 1, 0, 1,
-0.461085, -0.3752718, -2.119603, 0.07843138, 1, 0, 1,
-0.4594623, 0.832498, 1.045544, 0.07450981, 1, 0, 1,
-0.4583911, 1.42793, 0.6847976, 0.06666667, 1, 0, 1,
-0.45495, 0.3837712, -0.3892676, 0.0627451, 1, 0, 1,
-0.4547332, -1.980867, -2.219162, 0.05490196, 1, 0, 1,
-0.4532617, 1.220728, -0.741859, 0.05098039, 1, 0, 1,
-0.4514028, -2.039066, -0.9772682, 0.04313726, 1, 0, 1,
-0.4512411, 1.603245, 0.5277017, 0.03921569, 1, 0, 1,
-0.4505325, -0.9988573, -3.845963, 0.03137255, 1, 0, 1,
-0.4440511, -0.7523608, -3.409792, 0.02745098, 1, 0, 1,
-0.4414165, -0.5564117, -2.214114, 0.01960784, 1, 0, 1,
-0.4407255, -1.35941, -3.070643, 0.01568628, 1, 0, 1,
-0.4375353, 0.5172422, -0.7945569, 0.007843138, 1, 0, 1,
-0.4332407, -1.807574, -1.718871, 0.003921569, 1, 0, 1,
-0.432954, -1.698622, -2.910652, 0, 1, 0.003921569, 1,
-0.4277553, -0.7672915, -4.40977, 0, 1, 0.01176471, 1,
-0.4252459, -1.180495, -2.510789, 0, 1, 0.01568628, 1,
-0.4192755, 2.052977, -0.4881771, 0, 1, 0.02352941, 1,
-0.419095, 0.8403116, -0.6878508, 0, 1, 0.02745098, 1,
-0.4183994, -1.448033, -2.810039, 0, 1, 0.03529412, 1,
-0.4142117, -0.7849079, -3.578504, 0, 1, 0.03921569, 1,
-0.4133136, -1.613593, -3.043533, 0, 1, 0.04705882, 1,
-0.4109838, 0.2457695, -2.041518, 0, 1, 0.05098039, 1,
-0.4108096, -0.385519, -2.698083, 0, 1, 0.05882353, 1,
-0.4091979, 0.7577888, -0.9147849, 0, 1, 0.0627451, 1,
-0.4027767, 0.8986318, 0.301829, 0, 1, 0.07058824, 1,
-0.4015568, 0.2499217, -1.0033, 0, 1, 0.07450981, 1,
-0.4014247, 0.4935622, -0.8960785, 0, 1, 0.08235294, 1,
-0.4009166, 0.2533273, -1.383549, 0, 1, 0.08627451, 1,
-0.4001372, 0.2523776, -0.5831657, 0, 1, 0.09411765, 1,
-0.3885534, -0.06531994, -0.1902682, 0, 1, 0.1019608, 1,
-0.3840788, 0.6384287, 0.3302622, 0, 1, 0.1058824, 1,
-0.3827326, 0.2819422, -1.096204, 0, 1, 0.1137255, 1,
-0.381233, 1.164315, 0.3425512, 0, 1, 0.1176471, 1,
-0.3806869, 0.3785163, -2.390626, 0, 1, 0.1254902, 1,
-0.3797813, 1.025127, 0.8854578, 0, 1, 0.1294118, 1,
-0.3732445, 1.210256, -0.1285724, 0, 1, 0.1372549, 1,
-0.3718121, -0.4784555, -3.19776, 0, 1, 0.1411765, 1,
-0.3706949, 2.133557, -0.4642801, 0, 1, 0.1490196, 1,
-0.3685325, -0.4964455, -1.578848, 0, 1, 0.1529412, 1,
-0.3633991, 0.983697, 0.9355209, 0, 1, 0.1607843, 1,
-0.3610242, -0.02000783, -2.039428, 0, 1, 0.1647059, 1,
-0.3609426, 0.1456853, -1.108006, 0, 1, 0.172549, 1,
-0.3545877, -0.06913988, -1.623427, 0, 1, 0.1764706, 1,
-0.3520788, -2.007371, -2.914279, 0, 1, 0.1843137, 1,
-0.3518262, -0.9379248, 0.2143208, 0, 1, 0.1882353, 1,
-0.3517632, -0.268259, -2.77391, 0, 1, 0.1960784, 1,
-0.3495249, 0.1470655, -0.9685921, 0, 1, 0.2039216, 1,
-0.34931, 0.8193488, 1.03545, 0, 1, 0.2078431, 1,
-0.3490224, 1.026298, -1.718931, 0, 1, 0.2156863, 1,
-0.347888, -2.256319, -4.84545, 0, 1, 0.2196078, 1,
-0.3451877, 0.51298, -1.465943, 0, 1, 0.227451, 1,
-0.344454, -0.1042245, -1.67688, 0, 1, 0.2313726, 1,
-0.3440911, -0.5094203, -3.422721, 0, 1, 0.2392157, 1,
-0.3426288, -0.02443786, -1.141046, 0, 1, 0.2431373, 1,
-0.3371198, -0.5880452, -1.865545, 0, 1, 0.2509804, 1,
-0.3360964, -0.3622887, -1.997816, 0, 1, 0.254902, 1,
-0.3341148, -0.1548658, -0.1113777, 0, 1, 0.2627451, 1,
-0.3327395, 0.2529085, -2.074081, 0, 1, 0.2666667, 1,
-0.3321742, 0.8692629, -0.132278, 0, 1, 0.2745098, 1,
-0.3295207, -0.3162508, -1.967888, 0, 1, 0.2784314, 1,
-0.3288315, 1.484162, 0.1620326, 0, 1, 0.2862745, 1,
-0.3272208, -0.4855667, -3.028901, 0, 1, 0.2901961, 1,
-0.3255959, -0.8003721, -0.5229369, 0, 1, 0.2980392, 1,
-0.3254794, 0.2939436, 0.9442309, 0, 1, 0.3058824, 1,
-0.3200031, -1.527207, -3.277649, 0, 1, 0.3098039, 1,
-0.3143196, 0.3677773, -1.297138, 0, 1, 0.3176471, 1,
-0.3130112, 1.029576, 0.9198498, 0, 1, 0.3215686, 1,
-0.3107, -0.2507573, -0.9307311, 0, 1, 0.3294118, 1,
-0.3089916, 1.03326, -0.05234479, 0, 1, 0.3333333, 1,
-0.3071083, 0.4486779, -1.598872, 0, 1, 0.3411765, 1,
-0.3008287, -0.2332112, -3.777111, 0, 1, 0.345098, 1,
-0.2999493, 0.7065713, 2.010536, 0, 1, 0.3529412, 1,
-0.2976447, 0.8273658, 0.8209596, 0, 1, 0.3568628, 1,
-0.2957662, -0.2221074, -3.780283, 0, 1, 0.3647059, 1,
-0.2928303, 0.3559461, -1.385524, 0, 1, 0.3686275, 1,
-0.2862827, 0.6202675, -1.372483, 0, 1, 0.3764706, 1,
-0.2858287, -0.2926572, -1.981819, 0, 1, 0.3803922, 1,
-0.2850131, -1.419651, -2.816866, 0, 1, 0.3882353, 1,
-0.2842164, 0.9513856, -1.106721, 0, 1, 0.3921569, 1,
-0.2838604, 1.403192, -1.115087, 0, 1, 0.4, 1,
-0.2834354, 0.5475855, -0.04840003, 0, 1, 0.4078431, 1,
-0.2786934, 0.8761901, -1.294429, 0, 1, 0.4117647, 1,
-0.2765979, -0.3339056, -3.432367, 0, 1, 0.4196078, 1,
-0.2732346, -1.076445, -3.289056, 0, 1, 0.4235294, 1,
-0.2711721, -1.394838, -3.017176, 0, 1, 0.4313726, 1,
-0.2692847, 1.266012, 0.4577723, 0, 1, 0.4352941, 1,
-0.2664938, -0.241046, -2.906641, 0, 1, 0.4431373, 1,
-0.2630548, 0.2626788, -0.7646837, 0, 1, 0.4470588, 1,
-0.2623855, 0.9483916, -1.369601, 0, 1, 0.454902, 1,
-0.2616833, -1.654127, -4.083286, 0, 1, 0.4588235, 1,
-0.261311, -0.7764236, -0.7126933, 0, 1, 0.4666667, 1,
-0.2560581, -0.1388095, -3.247651, 0, 1, 0.4705882, 1,
-0.2531034, -2.160578, -2.848226, 0, 1, 0.4784314, 1,
-0.2529374, -0.04741042, -2.15426, 0, 1, 0.4823529, 1,
-0.2519834, 1.070428, 0.4145057, 0, 1, 0.4901961, 1,
-0.2502511, -0.33815, -1.604724, 0, 1, 0.4941176, 1,
-0.2500897, 0.417835, 0.5826715, 0, 1, 0.5019608, 1,
-0.2499015, 1.222131, -0.8729873, 0, 1, 0.509804, 1,
-0.2497359, 0.9483708, 0.4349861, 0, 1, 0.5137255, 1,
-0.2452597, -0.9517779, -5.296478, 0, 1, 0.5215687, 1,
-0.24316, -1.971499, -3.309385, 0, 1, 0.5254902, 1,
-0.2418754, -2.01917, -2.833242, 0, 1, 0.5333334, 1,
-0.2341417, -0.7180655, -3.585335, 0, 1, 0.5372549, 1,
-0.2291096, -0.8755678, -2.462273, 0, 1, 0.5450981, 1,
-0.2229223, -1.207198, -1.651883, 0, 1, 0.5490196, 1,
-0.2212072, 0.3814674, -0.0683398, 0, 1, 0.5568628, 1,
-0.2198101, 0.1994894, -1.481313, 0, 1, 0.5607843, 1,
-0.2194487, -1.771315, -4.065265, 0, 1, 0.5686275, 1,
-0.2173764, 0.7773939, 0.1018558, 0, 1, 0.572549, 1,
-0.2144196, 0.5438958, -0.9860207, 0, 1, 0.5803922, 1,
-0.2138422, -0.8087668, -4.357159, 0, 1, 0.5843138, 1,
-0.2115798, 0.2189444, -1.297877, 0, 1, 0.5921569, 1,
-0.2107026, -0.3366194, -1.814384, 0, 1, 0.5960785, 1,
-0.202015, 0.9929157, 0.3281392, 0, 1, 0.6039216, 1,
-0.2005256, -0.06982322, -2.458707, 0, 1, 0.6117647, 1,
-0.1945754, 1.943822, -0.03680829, 0, 1, 0.6156863, 1,
-0.1897435, -0.4785129, -1.973644, 0, 1, 0.6235294, 1,
-0.186813, -1.035147, -4.311619, 0, 1, 0.627451, 1,
-0.1855257, 0.691416, -0.1014507, 0, 1, 0.6352941, 1,
-0.1838193, 0.801419, 1.885532, 0, 1, 0.6392157, 1,
-0.180707, -0.8895686, -1.430791, 0, 1, 0.6470588, 1,
-0.1803162, -0.3824637, -2.150301, 0, 1, 0.6509804, 1,
-0.1760826, 0.5102476, 0.0715118, 0, 1, 0.6588235, 1,
-0.1743132, -0.02056509, -1.565877, 0, 1, 0.6627451, 1,
-0.1736477, 0.09780863, -0.8954681, 0, 1, 0.6705883, 1,
-0.1680311, 0.1063027, -1.562478, 0, 1, 0.6745098, 1,
-0.1658396, 1.54121, 0.1963454, 0, 1, 0.682353, 1,
-0.1621734, -0.1302805, -5.136163, 0, 1, 0.6862745, 1,
-0.1603674, 0.3494635, 0.2276, 0, 1, 0.6941177, 1,
-0.1570963, -0.9828138, -2.949252, 0, 1, 0.7019608, 1,
-0.1565106, -0.09303157, -3.14452, 0, 1, 0.7058824, 1,
-0.1517193, -2.059447, -1.426591, 0, 1, 0.7137255, 1,
-0.1509491, 0.4147373, 0.2875679, 0, 1, 0.7176471, 1,
-0.1491018, -1.807024, -1.563051, 0, 1, 0.7254902, 1,
-0.1465556, -0.4589024, -1.748297, 0, 1, 0.7294118, 1,
-0.1457478, -0.9273775, -3.521262, 0, 1, 0.7372549, 1,
-0.1456609, 0.5547589, -1.154636, 0, 1, 0.7411765, 1,
-0.1353792, -1.477372, -3.46842, 0, 1, 0.7490196, 1,
-0.1320794, -0.9676536, -1.1147, 0, 1, 0.7529412, 1,
-0.1286183, 0.008052566, -2.08934, 0, 1, 0.7607843, 1,
-0.1263044, 1.210835, -0.1986482, 0, 1, 0.7647059, 1,
-0.1249259, -0.6925902, -1.249849, 0, 1, 0.772549, 1,
-0.1230622, 0.5722657, -2.316176, 0, 1, 0.7764706, 1,
-0.1228321, -0.4595236, -0.9385983, 0, 1, 0.7843137, 1,
-0.1206925, 0.1993693, -0.7187473, 0, 1, 0.7882353, 1,
-0.1192204, -1.576208, -2.87891, 0, 1, 0.7960784, 1,
-0.1151547, 0.2867343, -0.807156, 0, 1, 0.8039216, 1,
-0.1121282, -1.202748, -3.568811, 0, 1, 0.8078431, 1,
-0.1108622, -3.128794, -2.906736, 0, 1, 0.8156863, 1,
-0.1098688, 1.576204, 1.041712, 0, 1, 0.8196079, 1,
-0.1089953, -0.8984807, -2.404035, 0, 1, 0.827451, 1,
-0.1084783, -0.3331306, -0.1822829, 0, 1, 0.8313726, 1,
-0.1072176, 0.7844883, -1.357344, 0, 1, 0.8392157, 1,
-0.1052892, -0.1816689, -4.044461, 0, 1, 0.8431373, 1,
-0.1010373, 0.3862073, -1.948256, 0, 1, 0.8509804, 1,
-0.1009265, -1.556377, -2.811341, 0, 1, 0.854902, 1,
-0.1007497, 1.157501, 1.62058, 0, 1, 0.8627451, 1,
-0.1006304, -0.6682936, -4.530877, 0, 1, 0.8666667, 1,
-0.1003404, 2.11878, 0.2664285, 0, 1, 0.8745098, 1,
-0.09972098, 0.4430782, 1.11097, 0, 1, 0.8784314, 1,
-0.09928495, 1.085592, -1.093978, 0, 1, 0.8862745, 1,
-0.09859934, -0.968015, -3.138615, 0, 1, 0.8901961, 1,
-0.09472758, 0.4795716, 1.856914, 0, 1, 0.8980392, 1,
-0.09302707, -1.440444, -3.33264, 0, 1, 0.9058824, 1,
-0.09128449, -0.9061596, -3.263824, 0, 1, 0.9098039, 1,
-0.08760251, 0.4150936, -1.56115, 0, 1, 0.9176471, 1,
-0.08758438, -0.4340886, -2.381639, 0, 1, 0.9215686, 1,
-0.08707005, -0.8611149, -2.666289, 0, 1, 0.9294118, 1,
-0.08272327, -0.4482604, -4.055707, 0, 1, 0.9333333, 1,
-0.08084665, 0.05944563, 0.2100694, 0, 1, 0.9411765, 1,
-0.07961997, 1.103386, 0.9870166, 0, 1, 0.945098, 1,
-0.0786065, 1.032988, 0.5341757, 0, 1, 0.9529412, 1,
-0.07670679, -0.3453955, -2.496179, 0, 1, 0.9568627, 1,
-0.07411182, -0.2652658, -4.318059, 0, 1, 0.9647059, 1,
-0.07348658, -0.4654524, -2.405257, 0, 1, 0.9686275, 1,
-0.07334322, 1.599904, -0.2966174, 0, 1, 0.9764706, 1,
-0.07270849, 1.194185, -1.366066, 0, 1, 0.9803922, 1,
-0.07249086, 1.024292, 1.734955, 0, 1, 0.9882353, 1,
-0.06736498, -0.3038033, -2.202915, 0, 1, 0.9921569, 1,
-0.06629543, -1.380878, -3.733747, 0, 1, 1, 1,
-0.0594888, 0.8257127, -0.2338732, 0, 0.9921569, 1, 1,
-0.05806244, -1.162851, -3.051668, 0, 0.9882353, 1, 1,
-0.05668707, -0.5554521, -3.574934, 0, 0.9803922, 1, 1,
-0.05618034, -0.2511975, -3.118694, 0, 0.9764706, 1, 1,
-0.05565714, -0.3576262, -2.177027, 0, 0.9686275, 1, 1,
-0.05474138, -0.3431984, -3.543167, 0, 0.9647059, 1, 1,
-0.05378543, -0.5121263, -3.733845, 0, 0.9568627, 1, 1,
-0.05177779, 0.3396297, 1.20201, 0, 0.9529412, 1, 1,
-0.0484099, 0.1026081, -0.8850467, 0, 0.945098, 1, 1,
-0.04712297, -2.094436, -4.606131, 0, 0.9411765, 1, 1,
-0.03723182, 1.968075, 0.452158, 0, 0.9333333, 1, 1,
-0.03721398, 0.7333629, 0.3884058, 0, 0.9294118, 1, 1,
-0.03607196, 0.8842348, -1.666974, 0, 0.9215686, 1, 1,
-0.03254492, 0.6601359, 1.162583, 0, 0.9176471, 1, 1,
-0.03080638, -1.096747, -2.685596, 0, 0.9098039, 1, 1,
-0.02803075, 0.1991016, -0.2501674, 0, 0.9058824, 1, 1,
-0.02755129, -0.7208318, -3.662724, 0, 0.8980392, 1, 1,
-0.02046204, -2.34712, -4.903083, 0, 0.8901961, 1, 1,
-0.01408742, -0.4699634, -3.802011, 0, 0.8862745, 1, 1,
-0.01401385, 0.8570139, 1.43001, 0, 0.8784314, 1, 1,
-0.009314362, -0.353188, -3.485421, 0, 0.8745098, 1, 1,
-0.008645545, -0.3174804, -3.076368, 0, 0.8666667, 1, 1,
-0.003222912, -0.6441709, -2.60384, 0, 0.8627451, 1, 1,
-0.002825973, -0.3286341, -3.990168, 0, 0.854902, 1, 1,
-0.0007658984, 0.2646209, -0.06499607, 0, 0.8509804, 1, 1,
0.001023199, 1.567974, 0.2899022, 0, 0.8431373, 1, 1,
0.00170781, 1.784246, -0.1916443, 0, 0.8392157, 1, 1,
0.008209297, -0.01368816, 3.738907, 0, 0.8313726, 1, 1,
0.01579786, 0.05343994, -0.1751901, 0, 0.827451, 1, 1,
0.01603367, -0.1747488, 3.116709, 0, 0.8196079, 1, 1,
0.01624186, -1.846667, 3.582878, 0, 0.8156863, 1, 1,
0.017255, 0.04264745, 1.115245, 0, 0.8078431, 1, 1,
0.01744105, -0.5356974, 2.167391, 0, 0.8039216, 1, 1,
0.01939639, 1.11773, -1.770574, 0, 0.7960784, 1, 1,
0.01958339, -0.5531271, 2.515567, 0, 0.7882353, 1, 1,
0.02464158, -0.9510987, 1.535113, 0, 0.7843137, 1, 1,
0.02523454, 1.371871, -0.2213347, 0, 0.7764706, 1, 1,
0.02535939, -0.8735365, 2.919198, 0, 0.772549, 1, 1,
0.02949557, -1.171169, 4.576584, 0, 0.7647059, 1, 1,
0.03048475, -2.049519, 4.425932, 0, 0.7607843, 1, 1,
0.03085918, -0.2214063, 4.073509, 0, 0.7529412, 1, 1,
0.03153481, 0.3193975, 1.145626, 0, 0.7490196, 1, 1,
0.03477593, -1.41013, 2.975431, 0, 0.7411765, 1, 1,
0.03664244, -1.560922, 0.4426392, 0, 0.7372549, 1, 1,
0.04315495, 0.2065411, 0.7092071, 0, 0.7294118, 1, 1,
0.04346558, -0.818777, 4.307507, 0, 0.7254902, 1, 1,
0.04768734, 0.7214544, 0.4998812, 0, 0.7176471, 1, 1,
0.0478449, 0.318652, -0.1874702, 0, 0.7137255, 1, 1,
0.04813737, 1.439383, -0.1276249, 0, 0.7058824, 1, 1,
0.05274265, -0.2878889, 3.944595, 0, 0.6980392, 1, 1,
0.06009867, 1.072845, -0.3229317, 0, 0.6941177, 1, 1,
0.06032519, 0.2886201, 0.747619, 0, 0.6862745, 1, 1,
0.06571376, 0.7776737, -0.3585524, 0, 0.682353, 1, 1,
0.07030779, -0.2862878, 2.952269, 0, 0.6745098, 1, 1,
0.07356612, 0.7268217, -0.3128213, 0, 0.6705883, 1, 1,
0.08346047, -0.035244, 3.806262, 0, 0.6627451, 1, 1,
0.08931006, 0.9485437, 0.5882082, 0, 0.6588235, 1, 1,
0.09030417, -1.920717, 2.630461, 0, 0.6509804, 1, 1,
0.0919292, -1.586378, 1.877956, 0, 0.6470588, 1, 1,
0.09313656, 0.4863822, 1.007006, 0, 0.6392157, 1, 1,
0.09483143, -1.200554, 3.721154, 0, 0.6352941, 1, 1,
0.09521625, -0.9786394, 4.105873, 0, 0.627451, 1, 1,
0.1003825, 0.1407907, 0.3059103, 0, 0.6235294, 1, 1,
0.1007376, -0.672388, 2.814471, 0, 0.6156863, 1, 1,
0.1031765, 1.605561, 1.055526, 0, 0.6117647, 1, 1,
0.1046654, -0.4636593, 3.176104, 0, 0.6039216, 1, 1,
0.1061052, -0.7965939, 3.714974, 0, 0.5960785, 1, 1,
0.1092942, 0.03587697, 1.417646, 0, 0.5921569, 1, 1,
0.1095681, -0.9908288, 1.795308, 0, 0.5843138, 1, 1,
0.1100715, -0.4076979, 4.30024, 0, 0.5803922, 1, 1,
0.113264, -0.4082208, 3.156174, 0, 0.572549, 1, 1,
0.1172163, -0.9860423, 2.353729, 0, 0.5686275, 1, 1,
0.1242661, -0.9344605, 1.642386, 0, 0.5607843, 1, 1,
0.1293842, 2.233289, -0.1256664, 0, 0.5568628, 1, 1,
0.131914, -0.473182, 3.560477, 0, 0.5490196, 1, 1,
0.1320309, -0.8988922, 4.818722, 0, 0.5450981, 1, 1,
0.1349335, 0.3603905, -0.8575758, 0, 0.5372549, 1, 1,
0.1397584, -0.3934869, 3.884629, 0, 0.5333334, 1, 1,
0.1431576, -1.013651, 1.41871, 0, 0.5254902, 1, 1,
0.1431766, 0.3308214, 1.458743, 0, 0.5215687, 1, 1,
0.1439438, 1.588912, 2.955359, 0, 0.5137255, 1, 1,
0.1444414, 0.7796734, 0.7378445, 0, 0.509804, 1, 1,
0.1468749, -0.3858802, 2.468167, 0, 0.5019608, 1, 1,
0.1469202, -1.568391, 1.798909, 0, 0.4941176, 1, 1,
0.1474404, 0.03516392, -0.2745928, 0, 0.4901961, 1, 1,
0.1505601, 0.6851601, -0.1841837, 0, 0.4823529, 1, 1,
0.1511313, 0.8269851, 0.001756342, 0, 0.4784314, 1, 1,
0.1545372, -3.1457, 2.97095, 0, 0.4705882, 1, 1,
0.159012, -0.08038321, 2.694595, 0, 0.4666667, 1, 1,
0.172975, 0.5666378, 1.115469, 0, 0.4588235, 1, 1,
0.1753194, -0.828326, 3.760416, 0, 0.454902, 1, 1,
0.1798651, -0.3641602, 2.37494, 0, 0.4470588, 1, 1,
0.1848162, 2.178527, 0.1236721, 0, 0.4431373, 1, 1,
0.1886841, 0.6902407, -0.1516304, 0, 0.4352941, 1, 1,
0.1891982, 0.8206122, -0.1686304, 0, 0.4313726, 1, 1,
0.1917135, 0.1557563, -1.051417, 0, 0.4235294, 1, 1,
0.1920354, 0.9772197, -1.084822, 0, 0.4196078, 1, 1,
0.1923815, -0.4846054, 3.85617, 0, 0.4117647, 1, 1,
0.1969202, -1.094141, 3.069321, 0, 0.4078431, 1, 1,
0.1991431, 0.2756319, 0.2031039, 0, 0.4, 1, 1,
0.2069449, -0.2866876, 1.08909, 0, 0.3921569, 1, 1,
0.2074084, -0.0557536, 0.9996198, 0, 0.3882353, 1, 1,
0.209709, -0.3267223, 1.934381, 0, 0.3803922, 1, 1,
0.2114344, -2.084949, 2.778038, 0, 0.3764706, 1, 1,
0.2138656, -1.126769, 3.710487, 0, 0.3686275, 1, 1,
0.2211596, -1.204953, 1.855397, 0, 0.3647059, 1, 1,
0.2221778, -2.573539, 4.284959, 0, 0.3568628, 1, 1,
0.2244496, -0.2006871, 2.933018, 0, 0.3529412, 1, 1,
0.2245535, 0.07612723, 2.166262, 0, 0.345098, 1, 1,
0.2246827, -1.015908, 1.543269, 0, 0.3411765, 1, 1,
0.225809, 1.812766, -0.0008870091, 0, 0.3333333, 1, 1,
0.2300874, -0.1143349, 0.7993177, 0, 0.3294118, 1, 1,
0.2327377, 0.5507266, 1.371157, 0, 0.3215686, 1, 1,
0.2350347, -1.61226, 3.282008, 0, 0.3176471, 1, 1,
0.2358367, 1.896085, -0.1246347, 0, 0.3098039, 1, 1,
0.2379061, -2.791423, 3.270671, 0, 0.3058824, 1, 1,
0.2396498, -1.338223, 4.743924, 0, 0.2980392, 1, 1,
0.2450174, -1.120459, 1.296113, 0, 0.2901961, 1, 1,
0.2454972, -0.7639978, 3.712362, 0, 0.2862745, 1, 1,
0.2457614, -0.5991387, 3.956011, 0, 0.2784314, 1, 1,
0.2470412, -0.216633, 1.507733, 0, 0.2745098, 1, 1,
0.2515675, -0.6480587, 4.604005, 0, 0.2666667, 1, 1,
0.2518157, -0.05897603, 1.851363, 0, 0.2627451, 1, 1,
0.2528564, 0.6656454, -0.8418864, 0, 0.254902, 1, 1,
0.2551556, -0.08584835, 2.899922, 0, 0.2509804, 1, 1,
0.2575763, -1.169208, 3.470706, 0, 0.2431373, 1, 1,
0.2596374, 0.2653315, 3.485391, 0, 0.2392157, 1, 1,
0.2604351, -1.675184, 3.773587, 0, 0.2313726, 1, 1,
0.2635455, 0.4377898, 1.035124, 0, 0.227451, 1, 1,
0.2644685, -0.8124195, 3.122019, 0, 0.2196078, 1, 1,
0.2644863, 0.1244052, -0.3609453, 0, 0.2156863, 1, 1,
0.2650697, -0.9860082, 3.049351, 0, 0.2078431, 1, 1,
0.265266, 0.36462, -1.9362, 0, 0.2039216, 1, 1,
0.2719955, 0.2550207, 2.869951, 0, 0.1960784, 1, 1,
0.2736124, -1.522941, 0.9470255, 0, 0.1882353, 1, 1,
0.2737777, -0.326258, 2.452234, 0, 0.1843137, 1, 1,
0.2748625, -1.060732, 1.178828, 0, 0.1764706, 1, 1,
0.2787523, -0.1750517, 2.11233, 0, 0.172549, 1, 1,
0.2790787, 1.47407, 0.6964406, 0, 0.1647059, 1, 1,
0.2808352, 1.237491, 0.06245905, 0, 0.1607843, 1, 1,
0.2812412, 0.7511123, -0.3783919, 0, 0.1529412, 1, 1,
0.2815201, 0.9694682, -0.7349759, 0, 0.1490196, 1, 1,
0.2829431, 1.418525, 0.6867135, 0, 0.1411765, 1, 1,
0.2854238, -1.77056, 2.176831, 0, 0.1372549, 1, 1,
0.2859675, 0.2243312, 2.224152, 0, 0.1294118, 1, 1,
0.2867903, -0.8785379, 2.692841, 0, 0.1254902, 1, 1,
0.2885336, -0.2002929, 2.12976, 0, 0.1176471, 1, 1,
0.290571, 0.9903834, 0.5924717, 0, 0.1137255, 1, 1,
0.2907587, -0.708291, 3.590969, 0, 0.1058824, 1, 1,
0.2986281, -0.4617476, 3.002718, 0, 0.09803922, 1, 1,
0.3132761, -1.135136, 2.698241, 0, 0.09411765, 1, 1,
0.3138967, -0.6090097, 2.282375, 0, 0.08627451, 1, 1,
0.3145446, -0.4839953, 2.982785, 0, 0.08235294, 1, 1,
0.3198894, -0.1007427, 2.18436, 0, 0.07450981, 1, 1,
0.3212628, 0.4797588, -1.303153, 0, 0.07058824, 1, 1,
0.3266945, 1.198418, 1.043941, 0, 0.0627451, 1, 1,
0.3284152, 1.396187, -1.755407, 0, 0.05882353, 1, 1,
0.3295663, -1.538783, 2.984646, 0, 0.05098039, 1, 1,
0.3314214, 0.1008421, 2.197888, 0, 0.04705882, 1, 1,
0.3317958, 0.3436758, 1.433524, 0, 0.03921569, 1, 1,
0.3333803, -0.05090567, 1.645041, 0, 0.03529412, 1, 1,
0.3349085, -1.307082, 3.851477, 0, 0.02745098, 1, 1,
0.3380933, -0.86538, 1.923937, 0, 0.02352941, 1, 1,
0.3410232, -0.4478846, 2.661728, 0, 0.01568628, 1, 1,
0.3486006, -0.4559659, 4.323308, 0, 0.01176471, 1, 1,
0.3486648, -0.7341426, 2.819129, 0, 0.003921569, 1, 1,
0.3514238, -0.5255381, 0.5227171, 0.003921569, 0, 1, 1,
0.3526472, 0.5171548, -1.009793, 0.007843138, 0, 1, 1,
0.3528797, -0.0004100841, 2.849153, 0.01568628, 0, 1, 1,
0.3620074, 0.5719807, 1.656341, 0.01960784, 0, 1, 1,
0.3632625, 1.695279, -1.196952, 0.02745098, 0, 1, 1,
0.3672681, -2.107229, 4.004017, 0.03137255, 0, 1, 1,
0.3705305, 0.1267388, 1.199208, 0.03921569, 0, 1, 1,
0.3721849, 1.560274, -0.2435709, 0.04313726, 0, 1, 1,
0.3851237, -1.260482, 3.587459, 0.05098039, 0, 1, 1,
0.3854409, 0.6121884, 1.906573, 0.05490196, 0, 1, 1,
0.3874845, 0.7861531, 0.4280072, 0.0627451, 0, 1, 1,
0.3876143, 0.2757259, 0.8261346, 0.06666667, 0, 1, 1,
0.3892536, 0.3634763, 1.089804, 0.07450981, 0, 1, 1,
0.3944514, -0.9954701, 3.347406, 0.07843138, 0, 1, 1,
0.3946034, 1.479117, 0.2958713, 0.08627451, 0, 1, 1,
0.3975444, -0.2801519, 2.54522, 0.09019608, 0, 1, 1,
0.3975459, 0.1365902, 0.9038378, 0.09803922, 0, 1, 1,
0.4009345, -1.139366, 3.013319, 0.1058824, 0, 1, 1,
0.402508, -0.460095, 3.294802, 0.1098039, 0, 1, 1,
0.4053859, -0.1029973, 1.644986, 0.1176471, 0, 1, 1,
0.4071137, -1.165091, 2.417986, 0.1215686, 0, 1, 1,
0.4124812, -0.02155535, 2.278634, 0.1294118, 0, 1, 1,
0.4174029, -0.1724553, 0.7173232, 0.1333333, 0, 1, 1,
0.4262296, 0.8378789, 0.9917164, 0.1411765, 0, 1, 1,
0.4264792, -0.2265009, 1.522403, 0.145098, 0, 1, 1,
0.4270488, -0.8827041, 2.708802, 0.1529412, 0, 1, 1,
0.4282396, -1.751917, 3.898934, 0.1568628, 0, 1, 1,
0.4335555, -0.7973832, 1.750247, 0.1647059, 0, 1, 1,
0.4343438, 1.274592, -0.1147734, 0.1686275, 0, 1, 1,
0.4372582, 0.1348043, 1.776529, 0.1764706, 0, 1, 1,
0.4410587, 1.396761, 0.7972521, 0.1803922, 0, 1, 1,
0.4413136, -1.203385, 2.143744, 0.1882353, 0, 1, 1,
0.4416819, -0.02817502, 1.180579, 0.1921569, 0, 1, 1,
0.4437995, -1.193576, 2.240571, 0.2, 0, 1, 1,
0.4471777, 0.3601239, -0.6881964, 0.2078431, 0, 1, 1,
0.450826, -0.9383235, 1.582015, 0.2117647, 0, 1, 1,
0.4581267, 1.845563, -0.00465447, 0.2196078, 0, 1, 1,
0.4584323, -0.6397213, 3.117561, 0.2235294, 0, 1, 1,
0.4595489, -1.213185, 2.867404, 0.2313726, 0, 1, 1,
0.4599846, -0.2997806, 0.6476235, 0.2352941, 0, 1, 1,
0.4617433, 0.4566742, 0.9974801, 0.2431373, 0, 1, 1,
0.4658947, 0.2018095, -0.4479037, 0.2470588, 0, 1, 1,
0.4664633, 0.06148912, 1.191791, 0.254902, 0, 1, 1,
0.4671506, 0.3780562, 1.052007, 0.2588235, 0, 1, 1,
0.4699723, -0.7092268, 0.4187685, 0.2666667, 0, 1, 1,
0.4739998, -1.52436, 3.032645, 0.2705882, 0, 1, 1,
0.4742304, 0.7581296, 0.5293598, 0.2784314, 0, 1, 1,
0.477885, -1.67735, 2.419577, 0.282353, 0, 1, 1,
0.478383, -1.383383, 1.227521, 0.2901961, 0, 1, 1,
0.4807927, -0.4447511, 1.623297, 0.2941177, 0, 1, 1,
0.4822698, -0.4886342, 1.407615, 0.3019608, 0, 1, 1,
0.4863761, 1.835518, 0.1324353, 0.3098039, 0, 1, 1,
0.4992151, -0.2723255, 2.213176, 0.3137255, 0, 1, 1,
0.5019036, -0.7404453, 2.4126, 0.3215686, 0, 1, 1,
0.5024706, -0.2378921, 2.343948, 0.3254902, 0, 1, 1,
0.5123699, -0.2938913, 1.467626, 0.3333333, 0, 1, 1,
0.515471, -0.3836013, 2.197626, 0.3372549, 0, 1, 1,
0.5168079, 0.6472951, 2.457451, 0.345098, 0, 1, 1,
0.5173497, -0.6820862, 2.569909, 0.3490196, 0, 1, 1,
0.5201324, -0.2328492, 2.732082, 0.3568628, 0, 1, 1,
0.5222846, -1.064557, 2.082284, 0.3607843, 0, 1, 1,
0.5371627, -0.1553518, 2.252582, 0.3686275, 0, 1, 1,
0.539575, -0.335719, 2.514805, 0.372549, 0, 1, 1,
0.5442282, -1.074512, 3.210246, 0.3803922, 0, 1, 1,
0.5451136, -0.448225, 3.19245, 0.3843137, 0, 1, 1,
0.5467204, 0.04292504, 0.4806859, 0.3921569, 0, 1, 1,
0.5471948, -1.075248, 2.714571, 0.3960784, 0, 1, 1,
0.5484291, 0.2021679, 3.568848, 0.4039216, 0, 1, 1,
0.5490754, -1.721083, 3.957087, 0.4117647, 0, 1, 1,
0.5497729, -0.3952558, 2.091496, 0.4156863, 0, 1, 1,
0.5501142, 1.766182, 2.040267, 0.4235294, 0, 1, 1,
0.5605842, 1.106413, -0.185998, 0.427451, 0, 1, 1,
0.562836, -1.188319, 3.680263, 0.4352941, 0, 1, 1,
0.5634823, 1.850058, -0.5959681, 0.4392157, 0, 1, 1,
0.5640051, -0.2093491, 3.122522, 0.4470588, 0, 1, 1,
0.5715307, 0.1676523, 1.039186, 0.4509804, 0, 1, 1,
0.5776679, 0.2074875, 3.122224, 0.4588235, 0, 1, 1,
0.5815102, 0.3705324, 0.6751638, 0.4627451, 0, 1, 1,
0.5821067, 0.3841149, 2.289859, 0.4705882, 0, 1, 1,
0.582643, 0.7991495, 0.7307165, 0.4745098, 0, 1, 1,
0.5848914, -1.643936, 2.402819, 0.4823529, 0, 1, 1,
0.5865024, -0.3039226, 2.777887, 0.4862745, 0, 1, 1,
0.5871475, -0.7282549, 1.388195, 0.4941176, 0, 1, 1,
0.5908264, 0.8759811, 0.4542728, 0.5019608, 0, 1, 1,
0.593142, 0.01591729, 1.506922, 0.5058824, 0, 1, 1,
0.5974005, 1.084655, 0.4388108, 0.5137255, 0, 1, 1,
0.5985718, 0.8145912, -0.8255162, 0.5176471, 0, 1, 1,
0.6012411, 1.987059, 0.4955713, 0.5254902, 0, 1, 1,
0.6074448, -0.5817529, 2.77055, 0.5294118, 0, 1, 1,
0.6082832, 0.2233223, -0.4181291, 0.5372549, 0, 1, 1,
0.6095661, 0.4022894, 1.196007, 0.5411765, 0, 1, 1,
0.6185637, 0.3640353, 2.142256, 0.5490196, 0, 1, 1,
0.6236619, -0.4588277, 0.9401213, 0.5529412, 0, 1, 1,
0.6253878, 0.2493849, -0.1484749, 0.5607843, 0, 1, 1,
0.6255968, -0.1138739, 1.320516, 0.5647059, 0, 1, 1,
0.6278926, 0.04649301, 1.459928, 0.572549, 0, 1, 1,
0.6279261, 0.512595, 0.3987911, 0.5764706, 0, 1, 1,
0.6383923, -1.920043, 3.452139, 0.5843138, 0, 1, 1,
0.6442444, 0.726559, 0.08817039, 0.5882353, 0, 1, 1,
0.6476892, -0.09897747, 3.569337, 0.5960785, 0, 1, 1,
0.6550481, -0.02639103, 3.169713, 0.6039216, 0, 1, 1,
0.6562141, 1.142532, 0.5384552, 0.6078432, 0, 1, 1,
0.6586576, -0.7752445, 2.679712, 0.6156863, 0, 1, 1,
0.6716047, 0.03652864, 3.84768, 0.6196079, 0, 1, 1,
0.6751693, -0.06898522, 2.619767, 0.627451, 0, 1, 1,
0.676537, 0.9431292, 0.3809208, 0.6313726, 0, 1, 1,
0.679546, -0.04570583, 1.800261, 0.6392157, 0, 1, 1,
0.6889532, -1.032054, 3.519209, 0.6431373, 0, 1, 1,
0.6890031, -1.366009, 4.087587, 0.6509804, 0, 1, 1,
0.6915428, 1.292576, -0.04093632, 0.654902, 0, 1, 1,
0.6961222, -1.983421, 3.343534, 0.6627451, 0, 1, 1,
0.7016545, -1.375352, 2.341435, 0.6666667, 0, 1, 1,
0.7022771, 0.4075251, 0.6169945, 0.6745098, 0, 1, 1,
0.7359262, 0.9910402, 1.126848, 0.6784314, 0, 1, 1,
0.7378432, -0.765203, 2.828067, 0.6862745, 0, 1, 1,
0.7446059, 0.01611401, -0.8439569, 0.6901961, 0, 1, 1,
0.7473952, 0.7957356, -0.03772587, 0.6980392, 0, 1, 1,
0.7494612, 0.5904481, -0.1454257, 0.7058824, 0, 1, 1,
0.7496136, 0.9398102, -0.3022616, 0.7098039, 0, 1, 1,
0.7531019, 0.4139334, -0.1832929, 0.7176471, 0, 1, 1,
0.7577661, 1.209282, 1.114834, 0.7215686, 0, 1, 1,
0.7606368, -0.5288616, 2.454351, 0.7294118, 0, 1, 1,
0.7613013, -0.9943066, 2.149177, 0.7333333, 0, 1, 1,
0.7614712, 0.3943904, 1.456964, 0.7411765, 0, 1, 1,
0.7619349, 1.081964, 1.128456, 0.7450981, 0, 1, 1,
0.7630849, 0.1801377, 0.5290436, 0.7529412, 0, 1, 1,
0.7658505, -1.645319, 3.972971, 0.7568628, 0, 1, 1,
0.769243, -0.1296276, 1.907883, 0.7647059, 0, 1, 1,
0.7714356, 1.83218, 0.6141703, 0.7686275, 0, 1, 1,
0.7744089, 1.228178, 0.8239609, 0.7764706, 0, 1, 1,
0.7762228, -0.06961965, 1.579754, 0.7803922, 0, 1, 1,
0.7762392, 0.6022034, 1.256118, 0.7882353, 0, 1, 1,
0.785758, 2.110213, -0.8050506, 0.7921569, 0, 1, 1,
0.7925138, -0.8820827, 2.882573, 0.8, 0, 1, 1,
0.795808, -1.701249, 3.112288, 0.8078431, 0, 1, 1,
0.7973776, -0.7916092, 3.82254, 0.8117647, 0, 1, 1,
0.7975032, -0.6885549, 2.725349, 0.8196079, 0, 1, 1,
0.8003896, 1.471986, 0.397323, 0.8235294, 0, 1, 1,
0.8020206, -0.0935991, 2.890393, 0.8313726, 0, 1, 1,
0.8058289, 0.08159085, 2.199541, 0.8352941, 0, 1, 1,
0.8060383, 1.444413, 0.9298952, 0.8431373, 0, 1, 1,
0.8079342, -0.1708171, 1.27797, 0.8470588, 0, 1, 1,
0.8089346, 0.8620502, 0.4697406, 0.854902, 0, 1, 1,
0.8115545, -0.0459687, 1.146188, 0.8588235, 0, 1, 1,
0.8163756, -0.8637841, 3.075278, 0.8666667, 0, 1, 1,
0.8169692, 0.0229954, 1.004211, 0.8705882, 0, 1, 1,
0.8177125, -0.373545, 1.188588, 0.8784314, 0, 1, 1,
0.824838, 0.783083, 0.9288172, 0.8823529, 0, 1, 1,
0.8248833, -0.2400669, 2.515412, 0.8901961, 0, 1, 1,
0.8258683, 1.661296, 1.12378, 0.8941177, 0, 1, 1,
0.8261088, -1.532911, 3.528215, 0.9019608, 0, 1, 1,
0.827688, 0.3844531, 1.638991, 0.9098039, 0, 1, 1,
0.832431, 0.3201648, 0.05201787, 0.9137255, 0, 1, 1,
0.8375116, 0.939899, 0.02046003, 0.9215686, 0, 1, 1,
0.8388539, -0.4522109, 3.869936, 0.9254902, 0, 1, 1,
0.8395756, -1.196623, 2.900857, 0.9333333, 0, 1, 1,
0.8497968, -0.8525866, 1.300897, 0.9372549, 0, 1, 1,
0.8561708, 0.522558, 1.8405, 0.945098, 0, 1, 1,
0.8603491, 0.4267884, 1.798239, 0.9490196, 0, 1, 1,
0.8712587, 1.265776, 1.1677, 0.9568627, 0, 1, 1,
0.8740073, -0.1731752, 1.557214, 0.9607843, 0, 1, 1,
0.880629, 0.9069541, -1.021457, 0.9686275, 0, 1, 1,
0.884456, -1.638929, 3.626548, 0.972549, 0, 1, 1,
0.8897781, -1.084255, 1.334261, 0.9803922, 0, 1, 1,
0.892976, -0.3603036, 1.193167, 0.9843137, 0, 1, 1,
0.8959836, 0.2986254, 1.239003, 0.9921569, 0, 1, 1,
0.899305, 0.3912598, 0.3886294, 0.9960784, 0, 1, 1,
0.9059423, -0.350552, 1.319705, 1, 0, 0.9960784, 1,
0.9085323, -2.078771, 1.082812, 1, 0, 0.9882353, 1,
0.9166358, -1.116527, 3.576619, 1, 0, 0.9843137, 1,
0.9173056, 0.5122481, 1.31079, 1, 0, 0.9764706, 1,
0.9216353, 0.6276315, 1.817572, 1, 0, 0.972549, 1,
0.9237921, 0.4278102, 0.8061216, 1, 0, 0.9647059, 1,
0.9362872, 0.2971931, 1.516512, 1, 0, 0.9607843, 1,
0.9513741, -1.737133, 3.093944, 1, 0, 0.9529412, 1,
0.9607919, -0.2220948, 1.012801, 1, 0, 0.9490196, 1,
0.9623582, 0.9896861, -0.861764, 1, 0, 0.9411765, 1,
0.9650397, -0.5247638, 2.355765, 1, 0, 0.9372549, 1,
0.9657761, 1.853358, -0.1982776, 1, 0, 0.9294118, 1,
0.9685474, 1.179347, 0.7360106, 1, 0, 0.9254902, 1,
0.9687284, -0.1347622, 2.418375, 1, 0, 0.9176471, 1,
0.9692981, 0.2917804, 0.8366433, 1, 0, 0.9137255, 1,
0.9731203, 0.1046587, 1.345312, 1, 0, 0.9058824, 1,
0.9763606, -0.155002, 1.955675, 1, 0, 0.9019608, 1,
0.9916836, -1.54201, 3.343616, 1, 0, 0.8941177, 1,
1.010108, -0.2908067, 1.593653, 1, 0, 0.8862745, 1,
1.024787, -0.1094117, 0.3844248, 1, 0, 0.8823529, 1,
1.029212, -0.6873373, 2.600536, 1, 0, 0.8745098, 1,
1.029939, -1.362318, 1.2414, 1, 0, 0.8705882, 1,
1.03648, 0.04894855, 0.4938116, 1, 0, 0.8627451, 1,
1.043168, -1.526337, 2.758517, 1, 0, 0.8588235, 1,
1.045445, 0.3012286, 1.386401, 1, 0, 0.8509804, 1,
1.054682, -0.1727904, 1.72837, 1, 0, 0.8470588, 1,
1.055434, 1.219712, 1.221131, 1, 0, 0.8392157, 1,
1.05875, 0.6443419, 0.7831679, 1, 0, 0.8352941, 1,
1.080255, 1.004295, 0.9911505, 1, 0, 0.827451, 1,
1.086178, 1.178756, -0.7535998, 1, 0, 0.8235294, 1,
1.091953, 1.489143, 0.9453198, 1, 0, 0.8156863, 1,
1.092181, 0.6401279, -1.564113, 1, 0, 0.8117647, 1,
1.093391, -0.08243439, 1.645809, 1, 0, 0.8039216, 1,
1.094015, 0.7945192, 1.317286, 1, 0, 0.7960784, 1,
1.096723, 0.3867083, 1.12467, 1, 0, 0.7921569, 1,
1.097337, 0.431722, -0.5746666, 1, 0, 0.7843137, 1,
1.098779, -0.8561119, 2.709658, 1, 0, 0.7803922, 1,
1.09937, -1.970135, 3.251464, 1, 0, 0.772549, 1,
1.102658, -0.2750469, 1.933295, 1, 0, 0.7686275, 1,
1.117142, 0.2547342, 1.082769, 1, 0, 0.7607843, 1,
1.124012, -0.1653944, -0.06010435, 1, 0, 0.7568628, 1,
1.127383, 1.04652, 1.405767, 1, 0, 0.7490196, 1,
1.127963, -0.5478815, 2.48763, 1, 0, 0.7450981, 1,
1.160785, -1.276942, 1.907045, 1, 0, 0.7372549, 1,
1.16375, -0.2001822, 1.391788, 1, 0, 0.7333333, 1,
1.171453, -0.3551961, 2.669217, 1, 0, 0.7254902, 1,
1.180792, 0.3061576, 2.19543, 1, 0, 0.7215686, 1,
1.188491, -0.03309981, 2.565565, 1, 0, 0.7137255, 1,
1.200355, -1.247481, 2.362514, 1, 0, 0.7098039, 1,
1.204781, -0.2577786, 1.136061, 1, 0, 0.7019608, 1,
1.205737, 0.05120008, 0.4824681, 1, 0, 0.6941177, 1,
1.226631, 0.8283325, -0.5021958, 1, 0, 0.6901961, 1,
1.23262, -1.785986, 1.596649, 1, 0, 0.682353, 1,
1.239384, -0.9642124, 1.026078, 1, 0, 0.6784314, 1,
1.254119, -0.8688881, 2.421902, 1, 0, 0.6705883, 1,
1.261794, -0.1228955, 3.183672, 1, 0, 0.6666667, 1,
1.265507, 0.09951653, 0.1034257, 1, 0, 0.6588235, 1,
1.270775, 0.4991776, 2.024898, 1, 0, 0.654902, 1,
1.277545, 1.634489, 1.248586, 1, 0, 0.6470588, 1,
1.289433, -1.448614, 3.89179, 1, 0, 0.6431373, 1,
1.290609, -0.003433304, 0.6458856, 1, 0, 0.6352941, 1,
1.291968, 1.327242, 1.614335, 1, 0, 0.6313726, 1,
1.293525, -1.308497, 1.717278, 1, 0, 0.6235294, 1,
1.293557, -0.4645938, 2.231465, 1, 0, 0.6196079, 1,
1.295312, 0.2046258, 0.01919116, 1, 0, 0.6117647, 1,
1.296211, -0.1642689, 4.354572, 1, 0, 0.6078432, 1,
1.307497, 1.063242, 2.342171, 1, 0, 0.6, 1,
1.312559, 0.7085775, -0.02555352, 1, 0, 0.5921569, 1,
1.315838, 0.3437577, 0.7145082, 1, 0, 0.5882353, 1,
1.328734, 0.8811198, -0.5078976, 1, 0, 0.5803922, 1,
1.329293, -0.0867593, 2.677434, 1, 0, 0.5764706, 1,
1.331967, -0.0246038, 1.167704, 1, 0, 0.5686275, 1,
1.335809, -1.596465, 4.211197, 1, 0, 0.5647059, 1,
1.351438, 0.3814555, 1.740708, 1, 0, 0.5568628, 1,
1.359851, -1.433487, 1.58795, 1, 0, 0.5529412, 1,
1.361595, -1.026585, 2.238308, 1, 0, 0.5450981, 1,
1.36887, -1.704726, 1.187776, 1, 0, 0.5411765, 1,
1.379334, 1.851937, 1.943048, 1, 0, 0.5333334, 1,
1.38822, 1.009577, 1.184009, 1, 0, 0.5294118, 1,
1.391408, -1.950779, 4.295482, 1, 0, 0.5215687, 1,
1.413488, 0.2926111, 1.256944, 1, 0, 0.5176471, 1,
1.419886, -1.10777, 3.029298, 1, 0, 0.509804, 1,
1.423804, -1.437935, 1.539285, 1, 0, 0.5058824, 1,
1.428243, 0.334042, 1.757847, 1, 0, 0.4980392, 1,
1.445544, -0.2581502, 2.265823, 1, 0, 0.4901961, 1,
1.460847, -0.5790841, 2.145979, 1, 0, 0.4862745, 1,
1.476463, -0.04347793, 2.513998, 1, 0, 0.4784314, 1,
1.47654, 0.5057822, 1.389156, 1, 0, 0.4745098, 1,
1.483896, -0.487946, 1.464213, 1, 0, 0.4666667, 1,
1.495025, 0.0707944, 1.558474, 1, 0, 0.4627451, 1,
1.496714, 0.5327249, 2.416079, 1, 0, 0.454902, 1,
1.496822, -0.4488736, 1.215382, 1, 0, 0.4509804, 1,
1.510572, -0.1554057, 3.000924, 1, 0, 0.4431373, 1,
1.513693, 0.5570145, 1.004967, 1, 0, 0.4392157, 1,
1.522191, -0.3499426, 2.014484, 1, 0, 0.4313726, 1,
1.523313, -0.562466, 1.068622, 1, 0, 0.427451, 1,
1.533276, 0.06218325, 0.8696885, 1, 0, 0.4196078, 1,
1.538292, 0.5742183, 0.7841599, 1, 0, 0.4156863, 1,
1.538877, 0.6341083, 1.317085, 1, 0, 0.4078431, 1,
1.546431, -1.822485, 3.650974, 1, 0, 0.4039216, 1,
1.560386, 0.8648188, 1.06123, 1, 0, 0.3960784, 1,
1.562804, -0.4810978, 0.2355997, 1, 0, 0.3882353, 1,
1.564094, -0.5327057, 4.230793, 1, 0, 0.3843137, 1,
1.564991, 0.1853704, 2.295823, 1, 0, 0.3764706, 1,
1.56503, 0.4336857, -0.575017, 1, 0, 0.372549, 1,
1.588426, 1.224351, 0.02496028, 1, 0, 0.3647059, 1,
1.597914, 0.8025413, 2.316181, 1, 0, 0.3607843, 1,
1.59939, 0.8288946, 1.339799, 1, 0, 0.3529412, 1,
1.615949, 0.4873781, 0.5286946, 1, 0, 0.3490196, 1,
1.624346, 1.284869, 0.3456264, 1, 0, 0.3411765, 1,
1.629898, -1.554442, 1.753804, 1, 0, 0.3372549, 1,
1.634233, -0.8969974, 0.6242098, 1, 0, 0.3294118, 1,
1.642165, 0.5204154, 0.08139869, 1, 0, 0.3254902, 1,
1.672425, 1.445825, 1.587801, 1, 0, 0.3176471, 1,
1.708832, 1.272207, 2.988582, 1, 0, 0.3137255, 1,
1.716444, 0.8845179, 3.813141, 1, 0, 0.3058824, 1,
1.722021, 1.029967, -0.5497126, 1, 0, 0.2980392, 1,
1.723274, 3.073923, -0.4977072, 1, 0, 0.2941177, 1,
1.732968, 0.4286397, 1.690784, 1, 0, 0.2862745, 1,
1.733153, 0.4209481, 1.838889, 1, 0, 0.282353, 1,
1.778848, -0.8376225, 1.656588, 1, 0, 0.2745098, 1,
1.783161, -0.9007083, 1.839289, 1, 0, 0.2705882, 1,
1.801805, 1.349782, 1.013312, 1, 0, 0.2627451, 1,
1.805786, -0.1321854, 1.5797, 1, 0, 0.2588235, 1,
1.837199, 0.2723324, 2.677917, 1, 0, 0.2509804, 1,
1.849641, -1.768662, 3.159079, 1, 0, 0.2470588, 1,
1.864198, 0.2792205, 1.090371, 1, 0, 0.2392157, 1,
1.866562, -0.504083, 3.066976, 1, 0, 0.2352941, 1,
1.867218, -0.115444, 1.385783, 1, 0, 0.227451, 1,
1.868017, 1.404091, -1.036463, 1, 0, 0.2235294, 1,
1.870778, 0.1492445, 3.167433, 1, 0, 0.2156863, 1,
1.886304, 0.9499192, 1.237923, 1, 0, 0.2117647, 1,
1.896301, 0.8641738, -0.04586037, 1, 0, 0.2039216, 1,
1.905547, 0.481423, 1.383709, 1, 0, 0.1960784, 1,
1.909324, -1.690817, 2.4626, 1, 0, 0.1921569, 1,
1.912347, 1.27125, 1.065044, 1, 0, 0.1843137, 1,
1.936086, -0.337698, 0.8199819, 1, 0, 0.1803922, 1,
1.961659, -0.7317913, 0.7313914, 1, 0, 0.172549, 1,
1.971383, -0.3842616, 0.5488293, 1, 0, 0.1686275, 1,
1.982529, -0.7770408, 1.697627, 1, 0, 0.1607843, 1,
1.989177, 0.1842969, 2.087961, 1, 0, 0.1568628, 1,
1.99109, -0.6109025, 1.705639, 1, 0, 0.1490196, 1,
1.999853, -0.07061264, 0.5195654, 1, 0, 0.145098, 1,
2.010505, 0.02688491, 3.702808, 1, 0, 0.1372549, 1,
2.049748, -0.01869581, 0.4913329, 1, 0, 0.1333333, 1,
2.051658, 1.112103, 1.060813, 1, 0, 0.1254902, 1,
2.071488, -0.113648, 2.24553, 1, 0, 0.1215686, 1,
2.124309, -1.909697, 2.806219, 1, 0, 0.1137255, 1,
2.180174, 1.455138, 1.670203, 1, 0, 0.1098039, 1,
2.235866, 0.3452016, 2.31255, 1, 0, 0.1019608, 1,
2.238977, 0.2121793, 0.9647552, 1, 0, 0.09411765, 1,
2.253136, -0.9949642, 1.708261, 1, 0, 0.09019608, 1,
2.256418, 0.9881027, 1.266985, 1, 0, 0.08235294, 1,
2.280534, -0.6223989, 0.3361256, 1, 0, 0.07843138, 1,
2.285228, -0.4659602, 0.9105507, 1, 0, 0.07058824, 1,
2.343781, 1.429893, 1.893552, 1, 0, 0.06666667, 1,
2.358753, 1.081821, 0.9580717, 1, 0, 0.05882353, 1,
2.414728, -0.4763923, 1.747507, 1, 0, 0.05490196, 1,
2.422954, -0.6857792, 2.171674, 1, 0, 0.04705882, 1,
2.452198, -0.2888914, 3.236598, 1, 0, 0.04313726, 1,
2.455204, -0.456759, -0.3298936, 1, 0, 0.03529412, 1,
2.515768, 0.1393462, 1.650949, 1, 0, 0.03137255, 1,
2.519648, 0.8950635, 1.03811, 1, 0, 0.02352941, 1,
2.594952, 0.2509393, 0.4929894, 1, 0, 0.01960784, 1,
2.618381, -0.04563414, 1.860251, 1, 0, 0.01176471, 1,
3.542236, 1.133713, 2.026256, 1, 0, 0.007843138, 1
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
0.1108403, -4.199926, -7.644345, 0, -0.5, 0.5, 0.5,
0.1108403, -4.199926, -7.644345, 1, -0.5, 0.5, 0.5,
0.1108403, -4.199926, -7.644345, 1, 1.5, 0.5, 0.5,
0.1108403, -4.199926, -7.644345, 0, 1.5, 0.5, 0.5
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
-4.483799, -0.03588831, -7.644345, 0, -0.5, 0.5, 0.5,
-4.483799, -0.03588831, -7.644345, 1, -0.5, 0.5, 0.5,
-4.483799, -0.03588831, -7.644345, 1, 1.5, 0.5, 0.5,
-4.483799, -0.03588831, -7.644345, 0, 1.5, 0.5, 0.5
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
-4.483799, -4.199926, -0.5096521, 0, -0.5, 0.5, 0.5,
-4.483799, -4.199926, -0.5096521, 1, -0.5, 0.5, 0.5,
-4.483799, -4.199926, -0.5096521, 1, 1.5, 0.5, 0.5,
-4.483799, -4.199926, -0.5096521, 0, 1.5, 0.5, 0.5
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
-3, -3.238994, -5.997878,
3, -3.238994, -5.997878,
-3, -3.238994, -5.997878,
-3, -3.399149, -6.272289,
-2, -3.238994, -5.997878,
-2, -3.399149, -6.272289,
-1, -3.238994, -5.997878,
-1, -3.399149, -6.272289,
0, -3.238994, -5.997878,
0, -3.399149, -6.272289,
1, -3.238994, -5.997878,
1, -3.399149, -6.272289,
2, -3.238994, -5.997878,
2, -3.399149, -6.272289,
3, -3.238994, -5.997878,
3, -3.399149, -6.272289
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
-3, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
-3, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
-3, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
-3, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5,
-2, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
-2, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
-2, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
-2, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5,
-1, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
-1, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
-1, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
-1, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5,
0, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
0, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
0, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
0, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5,
1, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
1, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
1, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
1, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5,
2, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
2, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
2, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
2, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5,
3, -3.71946, -6.821112, 0, -0.5, 0.5, 0.5,
3, -3.71946, -6.821112, 1, -0.5, 0.5, 0.5,
3, -3.71946, -6.821112, 1, 1.5, 0.5, 0.5,
3, -3.71946, -6.821112, 0, 1.5, 0.5, 0.5
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
-3.423497, -3, -5.997878,
-3.423497, 3, -5.997878,
-3.423497, -3, -5.997878,
-3.600214, -3, -6.272289,
-3.423497, -2, -5.997878,
-3.600214, -2, -6.272289,
-3.423497, -1, -5.997878,
-3.600214, -1, -6.272289,
-3.423497, 0, -5.997878,
-3.600214, 0, -6.272289,
-3.423497, 1, -5.997878,
-3.600214, 1, -6.272289,
-3.423497, 2, -5.997878,
-3.600214, 2, -6.272289,
-3.423497, 3, -5.997878,
-3.600214, 3, -6.272289
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
-3.953648, -3, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, -3, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, -3, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, -3, -6.821112, 0, 1.5, 0.5, 0.5,
-3.953648, -2, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, -2, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, -2, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, -2, -6.821112, 0, 1.5, 0.5, 0.5,
-3.953648, -1, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, -1, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, -1, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, -1, -6.821112, 0, 1.5, 0.5, 0.5,
-3.953648, 0, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, 0, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, 0, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, 0, -6.821112, 0, 1.5, 0.5, 0.5,
-3.953648, 1, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, 1, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, 1, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, 1, -6.821112, 0, 1.5, 0.5, 0.5,
-3.953648, 2, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, 2, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, 2, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, 2, -6.821112, 0, 1.5, 0.5, 0.5,
-3.953648, 3, -6.821112, 0, -0.5, 0.5, 0.5,
-3.953648, 3, -6.821112, 1, -0.5, 0.5, 0.5,
-3.953648, 3, -6.821112, 1, 1.5, 0.5, 0.5,
-3.953648, 3, -6.821112, 0, 1.5, 0.5, 0.5
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
-3.423497, -3.238994, -4,
-3.423497, -3.238994, 4,
-3.423497, -3.238994, -4,
-3.600214, -3.399149, -4,
-3.423497, -3.238994, -2,
-3.600214, -3.399149, -2,
-3.423497, -3.238994, 0,
-3.600214, -3.399149, 0,
-3.423497, -3.238994, 2,
-3.600214, -3.399149, 2,
-3.423497, -3.238994, 4,
-3.600214, -3.399149, 4
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
-3.953648, -3.71946, -4, 0, -0.5, 0.5, 0.5,
-3.953648, -3.71946, -4, 1, -0.5, 0.5, 0.5,
-3.953648, -3.71946, -4, 1, 1.5, 0.5, 0.5,
-3.953648, -3.71946, -4, 0, 1.5, 0.5, 0.5,
-3.953648, -3.71946, -2, 0, -0.5, 0.5, 0.5,
-3.953648, -3.71946, -2, 1, -0.5, 0.5, 0.5,
-3.953648, -3.71946, -2, 1, 1.5, 0.5, 0.5,
-3.953648, -3.71946, -2, 0, 1.5, 0.5, 0.5,
-3.953648, -3.71946, 0, 0, -0.5, 0.5, 0.5,
-3.953648, -3.71946, 0, 1, -0.5, 0.5, 0.5,
-3.953648, -3.71946, 0, 1, 1.5, 0.5, 0.5,
-3.953648, -3.71946, 0, 0, 1.5, 0.5, 0.5,
-3.953648, -3.71946, 2, 0, -0.5, 0.5, 0.5,
-3.953648, -3.71946, 2, 1, -0.5, 0.5, 0.5,
-3.953648, -3.71946, 2, 1, 1.5, 0.5, 0.5,
-3.953648, -3.71946, 2, 0, 1.5, 0.5, 0.5,
-3.953648, -3.71946, 4, 0, -0.5, 0.5, 0.5,
-3.953648, -3.71946, 4, 1, -0.5, 0.5, 0.5,
-3.953648, -3.71946, 4, 1, 1.5, 0.5, 0.5,
-3.953648, -3.71946, 4, 0, 1.5, 0.5, 0.5
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
-3.423497, -3.238994, -5.997878,
-3.423497, 3.167217, -5.997878,
-3.423497, -3.238994, 4.978573,
-3.423497, 3.167217, 4.978573,
-3.423497, -3.238994, -5.997878,
-3.423497, -3.238994, 4.978573,
-3.423497, 3.167217, -5.997878,
-3.423497, 3.167217, 4.978573,
-3.423497, -3.238994, -5.997878,
3.645178, -3.238994, -5.997878,
-3.423497, -3.238994, 4.978573,
3.645178, -3.238994, 4.978573,
-3.423497, 3.167217, -5.997878,
3.645178, 3.167217, -5.997878,
-3.423497, 3.167217, 4.978573,
3.645178, 3.167217, 4.978573,
3.645178, -3.238994, -5.997878,
3.645178, 3.167217, -5.997878,
3.645178, -3.238994, 4.978573,
3.645178, 3.167217, 4.978573,
3.645178, -3.238994, -5.997878,
3.645178, -3.238994, 4.978573,
3.645178, 3.167217, -5.997878,
3.645178, 3.167217, 4.978573
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
var radius = 7.765484;
var distance = 34.54951;
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
mvMatrix.translate( -0.1108403, 0.03588831, 0.5096521 );
mvMatrix.scale( 1.187803, 1.310633, 0.7649279 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54951);
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
selfotel<-read.table("selfotel.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-selfotel$V2
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
```

```r
y<-selfotel$V3
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
```

```r
z<-selfotel$V4
```

```
## Error in eval(expr, envir, enclos): object 'selfotel' not found
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
-3.320555, 0.6338216, -2.044521, 0, 0, 1, 1, 1,
-3.199465, -1.102201, -2.007774, 1, 0, 0, 1, 1,
-3.027651, 1.164287, -1.931589, 1, 0, 0, 1, 1,
-2.626085, 0.5320162, -0.1047574, 1, 0, 0, 1, 1,
-2.601952, 2.336557, -0.3061491, 1, 0, 0, 1, 1,
-2.55388, 1.163084, -1.333339, 1, 0, 0, 1, 1,
-2.547936, -1.395391, -3.386714, 0, 0, 0, 1, 1,
-2.416855, -1.521449, -5.031598, 0, 0, 0, 1, 1,
-2.404996, 0.3983347, -0.1808834, 0, 0, 0, 1, 1,
-2.360964, -0.1240712, -1.221512, 0, 0, 0, 1, 1,
-2.328008, 1.584707, -0.2334687, 0, 0, 0, 1, 1,
-2.304596, -0.5112121, -0.9755233, 0, 0, 0, 1, 1,
-2.297341, 1.138719, -1.649825, 0, 0, 0, 1, 1,
-2.289554, -0.5203994, -0.5387304, 1, 1, 1, 1, 1,
-2.25811, 0.2087384, -3.402347, 1, 1, 1, 1, 1,
-2.240771, 0.5279821, -0.8570158, 1, 1, 1, 1, 1,
-2.218554, 0.9571945, 1.374978, 1, 1, 1, 1, 1,
-2.202869, -0.1990134, -0.8087952, 1, 1, 1, 1, 1,
-2.193614, -1.562199, -3.630073, 1, 1, 1, 1, 1,
-2.18837, 1.204584, -1.961597, 1, 1, 1, 1, 1,
-2.184598, -0.1849472, -1.45505, 1, 1, 1, 1, 1,
-2.166056, -0.09214038, -2.30832, 1, 1, 1, 1, 1,
-2.153537, 1.950406, 0.566126, 1, 1, 1, 1, 1,
-2.141738, -1.860329, -2.519253, 1, 1, 1, 1, 1,
-2.132998, 0.3171331, -2.884398, 1, 1, 1, 1, 1,
-2.081723, -0.698458, -2.326046, 1, 1, 1, 1, 1,
-2.037662, 0.266544, -1.546407, 1, 1, 1, 1, 1,
-2.007464, -0.5844287, -5.838027, 1, 1, 1, 1, 1,
-1.982813, -1.844169, -3.196343, 0, 0, 1, 1, 1,
-1.929185, -0.08977631, -2.375886, 1, 0, 0, 1, 1,
-1.921871, 0.005885318, -0.1582691, 1, 0, 0, 1, 1,
-1.901346, -2.64903, -2.422813, 1, 0, 0, 1, 1,
-1.887958, -1.500789, -1.731552, 1, 0, 0, 1, 1,
-1.887303, -1.125604, -2.346617, 1, 0, 0, 1, 1,
-1.865405, -0.04527473, -0.2837169, 0, 0, 0, 1, 1,
-1.824723, 1.751529, -1.905085, 0, 0, 0, 1, 1,
-1.78584, -0.8039234, -3.269135, 0, 0, 0, 1, 1,
-1.771164, 0.4664357, -1.704055, 0, 0, 0, 1, 1,
-1.751595, 0.08780037, -0.948132, 0, 0, 0, 1, 1,
-1.749565, -1.988519, -1.910825, 0, 0, 0, 1, 1,
-1.730324, 0.7184238, -0.6241181, 0, 0, 0, 1, 1,
-1.725963, -0.9989706, -2.010982, 1, 1, 1, 1, 1,
-1.725918, 0.9651835, -0.9984931, 1, 1, 1, 1, 1,
-1.723706, -0.07624943, -1.150824, 1, 1, 1, 1, 1,
-1.722984, 1.093935, -1.940498, 1, 1, 1, 1, 1,
-1.703885, -1.485719, -2.3803, 1, 1, 1, 1, 1,
-1.698618, -0.6308635, -0.5865176, 1, 1, 1, 1, 1,
-1.680593, 0.6889751, 0.1674536, 1, 1, 1, 1, 1,
-1.675951, -1.300849, -2.444925, 1, 1, 1, 1, 1,
-1.647843, -0.3130823, -2.661041, 1, 1, 1, 1, 1,
-1.645668, 0.454059, -0.8632706, 1, 1, 1, 1, 1,
-1.622249, -0.10791, -1.65726, 1, 1, 1, 1, 1,
-1.594933, -1.740678, -2.495504, 1, 1, 1, 1, 1,
-1.582844, 1.67907, -0.2214242, 1, 1, 1, 1, 1,
-1.581766, 0.1065216, -2.411511, 1, 1, 1, 1, 1,
-1.572743, -0.7407172, -0.8389925, 1, 1, 1, 1, 1,
-1.567376, 1.234977, -1.548654, 0, 0, 1, 1, 1,
-1.564886, -0.5691428, -1.491866, 1, 0, 0, 1, 1,
-1.563699, -0.2061789, -3.955319, 1, 0, 0, 1, 1,
-1.55415, 0.5932155, -1.345665, 1, 0, 0, 1, 1,
-1.520587, -1.700611, -0.9941203, 1, 0, 0, 1, 1,
-1.513705, 1.18016, -1.034658, 1, 0, 0, 1, 1,
-1.496176, 0.9984934, -2.505841, 0, 0, 0, 1, 1,
-1.486021, -0.3777539, -3.541307, 0, 0, 0, 1, 1,
-1.479814, -0.9595537, -3.939173, 0, 0, 0, 1, 1,
-1.478175, -2.58038, -2.28138, 0, 0, 0, 1, 1,
-1.477567, -1.09982, -3.112949, 0, 0, 0, 1, 1,
-1.476194, -0.2328955, -1.692918, 0, 0, 0, 1, 1,
-1.473572, -1.446414, -1.200182, 0, 0, 0, 1, 1,
-1.456786, 1.463696, 0.1479923, 1, 1, 1, 1, 1,
-1.456284, -1.640603, -2.020698, 1, 1, 1, 1, 1,
-1.449967, -0.9342473, 0.2449877, 1, 1, 1, 1, 1,
-1.443259, 0.4621523, -2.068474, 1, 1, 1, 1, 1,
-1.440052, -0.2518758, -2.20042, 1, 1, 1, 1, 1,
-1.438169, 0.6872774, -1.066609, 1, 1, 1, 1, 1,
-1.42292, -0.9148718, -2.658285, 1, 1, 1, 1, 1,
-1.414619, 0.2688851, -1.760626, 1, 1, 1, 1, 1,
-1.384442, -0.7801036, -2.206635, 1, 1, 1, 1, 1,
-1.367081, 0.7769934, -1.928681, 1, 1, 1, 1, 1,
-1.363199, 0.1080003, -2.535953, 1, 1, 1, 1, 1,
-1.360096, 0.619746, 0.2291869, 1, 1, 1, 1, 1,
-1.353047, 1.53239, -1.090289, 1, 1, 1, 1, 1,
-1.343621, -0.2123745, -2.204201, 1, 1, 1, 1, 1,
-1.333639, -0.6740246, -2.534214, 1, 1, 1, 1, 1,
-1.332683, 0.01799097, -1.784687, 0, 0, 1, 1, 1,
-1.325862, -0.2162789, -3.207968, 1, 0, 0, 1, 1,
-1.324569, -0.1562764, 0.2108305, 1, 0, 0, 1, 1,
-1.323185, 0.2269397, -3.841308, 1, 0, 0, 1, 1,
-1.321262, 0.2500895, -0.6975954, 1, 0, 0, 1, 1,
-1.315447, -1.849924, -1.480475, 1, 0, 0, 1, 1,
-1.31099, 0.5452284, -1.773906, 0, 0, 0, 1, 1,
-1.301766, 0.7638001, -0.9620821, 0, 0, 0, 1, 1,
-1.301266, 0.04454868, 0.2021109, 0, 0, 0, 1, 1,
-1.298575, -0.6876876, -2.266623, 0, 0, 0, 1, 1,
-1.296879, -0.175699, -3.057745, 0, 0, 0, 1, 1,
-1.29648, -0.002844804, -1.499164, 0, 0, 0, 1, 1,
-1.288883, -0.8846602, -3.881978, 0, 0, 0, 1, 1,
-1.280604, 0.755618, -2.007211, 1, 1, 1, 1, 1,
-1.250768, -0.06568182, -2.145977, 1, 1, 1, 1, 1,
-1.250719, 1.000121, -2.013321, 1, 1, 1, 1, 1,
-1.244681, -0.5262797, 0.8708495, 1, 1, 1, 1, 1,
-1.237989, -0.2771821, -4.893553, 1, 1, 1, 1, 1,
-1.237566, 1.607599, 0.224516, 1, 1, 1, 1, 1,
-1.237209, -0.6327369, -1.500464, 1, 1, 1, 1, 1,
-1.235433, -0.2538107, -2.001195, 1, 1, 1, 1, 1,
-1.23534, -1.832727, -1.971417, 1, 1, 1, 1, 1,
-1.235318, -0.5253176, -1.822698, 1, 1, 1, 1, 1,
-1.234633, -0.1952555, -0.4134745, 1, 1, 1, 1, 1,
-1.232427, 0.158846, -1.955932, 1, 1, 1, 1, 1,
-1.224285, -1.497112, -1.815788, 1, 1, 1, 1, 1,
-1.215945, -0.05980247, -2.115404, 1, 1, 1, 1, 1,
-1.214149, 1.297466, -1.905301, 1, 1, 1, 1, 1,
-1.214103, 0.5337147, -3.207783, 0, 0, 1, 1, 1,
-1.209898, 2.134434, -1.476514, 1, 0, 0, 1, 1,
-1.198405, -0.9005049, -0.6642856, 1, 0, 0, 1, 1,
-1.194277, -0.05395156, -2.172434, 1, 0, 0, 1, 1,
-1.193697, -1.461119, -2.098051, 1, 0, 0, 1, 1,
-1.190458, -0.1285836, -2.488157, 1, 0, 0, 1, 1,
-1.188896, -1.121895, -1.884668, 0, 0, 0, 1, 1,
-1.187337, 0.007644351, -3.079704, 0, 0, 0, 1, 1,
-1.184646, 0.4555301, -1.828261, 0, 0, 0, 1, 1,
-1.181494, 0.8518547, -0.6071222, 0, 0, 0, 1, 1,
-1.177504, 0.6920099, -2.127134, 0, 0, 0, 1, 1,
-1.175079, 0.6046412, -1.358546, 0, 0, 0, 1, 1,
-1.172598, 0.4070664, -1.957781, 0, 0, 0, 1, 1,
-1.171332, 0.367052, -3.391099, 1, 1, 1, 1, 1,
-1.170801, -0.2371647, -0.7501963, 1, 1, 1, 1, 1,
-1.169522, -0.9594492, -2.078148, 1, 1, 1, 1, 1,
-1.166918, 0.5734054, 0.1694966, 1, 1, 1, 1, 1,
-1.163588, 1.208369, 0.1164479, 1, 1, 1, 1, 1,
-1.144493, -0.3618555, -4.663099, 1, 1, 1, 1, 1,
-1.143335, 0.5175443, -1.830307, 1, 1, 1, 1, 1,
-1.141085, -1.602272, -3.631324, 1, 1, 1, 1, 1,
-1.140944, 0.2623979, -0.7889747, 1, 1, 1, 1, 1,
-1.136097, 0.5634325, -1.518096, 1, 1, 1, 1, 1,
-1.130316, 0.3129252, -1.249103, 1, 1, 1, 1, 1,
-1.123392, 0.06744885, 0.3313189, 1, 1, 1, 1, 1,
-1.120993, 0.3842213, -2.324259, 1, 1, 1, 1, 1,
-1.118902, -1.306177, -0.9799927, 1, 1, 1, 1, 1,
-1.115357, 0.2814569, -0.4038593, 1, 1, 1, 1, 1,
-1.110515, 0.09725618, -1.35536, 0, 0, 1, 1, 1,
-1.103775, -0.4523595, -0.6694753, 1, 0, 0, 1, 1,
-1.101771, 0.420176, -2.071606, 1, 0, 0, 1, 1,
-1.094107, -0.7311707, -5.663268, 1, 0, 0, 1, 1,
-1.092827, -0.210267, -1.604505, 1, 0, 0, 1, 1,
-1.083808, -0.5377024, -0.2719469, 1, 0, 0, 1, 1,
-1.082784, -0.8157229, -2.278803, 0, 0, 0, 1, 1,
-1.070175, 1.99488, -0.493524, 0, 0, 0, 1, 1,
-1.069106, 0.5492972, -0.7146167, 0, 0, 0, 1, 1,
-1.068536, -1.114516, -1.760432, 0, 0, 0, 1, 1,
-1.068055, 1.220511, -1.025412, 0, 0, 0, 1, 1,
-1.061803, 0.1554793, -2.620323, 0, 0, 0, 1, 1,
-1.061545, 1.142867, -0.9007636, 0, 0, 0, 1, 1,
-1.054963, 1.663437, 0.2910735, 1, 1, 1, 1, 1,
-1.053684, -0.1130676, -3.505469, 1, 1, 1, 1, 1,
-1.05204, 0.7822861, -1.248181, 1, 1, 1, 1, 1,
-1.051949, -1.517898, -3.724768, 1, 1, 1, 1, 1,
-1.04408, -0.1695463, -0.1103178, 1, 1, 1, 1, 1,
-1.033087, 0.999423, 1.345531, 1, 1, 1, 1, 1,
-1.031582, 0.8449119, -0.5762569, 1, 1, 1, 1, 1,
-1.020973, 0.4373685, -0.8370941, 1, 1, 1, 1, 1,
-1.017601, 2.74679, 0.5741122, 1, 1, 1, 1, 1,
-1.016356, 0.04646615, -3.104393, 1, 1, 1, 1, 1,
-1.011727, 1.499111, -0.08005344, 1, 1, 1, 1, 1,
-1.007028, -0.9261147, -2.828584, 1, 1, 1, 1, 1,
-1.00471, -2.867216, -3.567004, 1, 1, 1, 1, 1,
-1.004322, 0.8452913, -0.5311639, 1, 1, 1, 1, 1,
-1.002772, 0.8903003, -1.17123, 1, 1, 1, 1, 1,
-0.9973775, 0.4065432, -1.832383, 0, 0, 1, 1, 1,
-0.9972555, 0.05142033, -0.8856555, 1, 0, 0, 1, 1,
-0.9954392, 0.4464039, -0.02975233, 1, 0, 0, 1, 1,
-0.9950514, -0.8335093, -4.49081, 1, 0, 0, 1, 1,
-0.9946138, -2.254386, -2.924302, 1, 0, 0, 1, 1,
-0.9942452, 1.256979, -0.8281345, 1, 0, 0, 1, 1,
-0.9918441, -1.239843, -2.479811, 0, 0, 0, 1, 1,
-0.9906365, 1.153366, -2.330879, 0, 0, 0, 1, 1,
-0.9688985, -1.033011, -3.405925, 0, 0, 0, 1, 1,
-0.9658014, -0.3985789, -2.578209, 0, 0, 0, 1, 1,
-0.9567322, -0.313697, -2.252228, 0, 0, 0, 1, 1,
-0.9546619, -0.8605732, -3.538337, 0, 0, 0, 1, 1,
-0.9536324, 1.035547, -1.143513, 0, 0, 0, 1, 1,
-0.9529101, -1.259111, -2.866503, 1, 1, 1, 1, 1,
-0.9506271, 0.4124836, -2.69427, 1, 1, 1, 1, 1,
-0.9481156, 0.1609979, 0.02217625, 1, 1, 1, 1, 1,
-0.9355954, 1.092137, -1.928328, 1, 1, 1, 1, 1,
-0.9350679, -0.0034833, -1.721083, 1, 1, 1, 1, 1,
-0.9334447, 0.5822343, -0.5533603, 1, 1, 1, 1, 1,
-0.9291278, -0.5863263, -3.5555, 1, 1, 1, 1, 1,
-0.9259506, -1.551729, -3.361422, 1, 1, 1, 1, 1,
-0.9213281, -1.628609, -2.864272, 1, 1, 1, 1, 1,
-0.9187931, 0.4298221, -1.001276, 1, 1, 1, 1, 1,
-0.9117888, 0.5440835, -1.680377, 1, 1, 1, 1, 1,
-0.9087498, 0.7198747, -1.364567, 1, 1, 1, 1, 1,
-0.9023643, -1.731092, -0.5851573, 1, 1, 1, 1, 1,
-0.8753009, 0.154934, -0.7501541, 1, 1, 1, 1, 1,
-0.8686315, -0.1902224, -1.201898, 1, 1, 1, 1, 1,
-0.8681992, 0.07539736, -2.389596, 0, 0, 1, 1, 1,
-0.865382, 0.1010707, -1.078255, 1, 0, 0, 1, 1,
-0.8615175, -0.2376871, -1.471262, 1, 0, 0, 1, 1,
-0.8566267, 1.133034, -1.662236, 1, 0, 0, 1, 1,
-0.8535726, -1.85126, -2.005123, 1, 0, 0, 1, 1,
-0.8514179, 0.3954552, -1.004583, 1, 0, 0, 1, 1,
-0.8444081, 0.4024265, -0.4569875, 0, 0, 0, 1, 1,
-0.8440139, 0.01286167, -1.071433, 0, 0, 0, 1, 1,
-0.841379, -1.534217, -4.703261, 0, 0, 0, 1, 1,
-0.8381357, 0.7598812, -0.06085346, 0, 0, 0, 1, 1,
-0.8308944, -0.127236, -2.444564, 0, 0, 0, 1, 1,
-0.8281285, 1.756583, -2.083377, 0, 0, 0, 1, 1,
-0.8270316, -0.2508088, -3.597591, 0, 0, 0, 1, 1,
-0.8208178, 1.179149, -1.523209, 1, 1, 1, 1, 1,
-0.8200276, -0.2953358, -1.450994, 1, 1, 1, 1, 1,
-0.8174508, 0.5369889, -1.58138, 1, 1, 1, 1, 1,
-0.8152275, 0.1660393, -0.3835223, 1, 1, 1, 1, 1,
-0.8145944, 1.343385, 0.00486561, 1, 1, 1, 1, 1,
-0.8130341, 0.5154573, -3.138603, 1, 1, 1, 1, 1,
-0.8121561, -1.130519, -3.349513, 1, 1, 1, 1, 1,
-0.8104537, 0.7005622, -0.8981959, 1, 1, 1, 1, 1,
-0.8056124, -0.8940511, -2.631646, 1, 1, 1, 1, 1,
-0.8006357, -1.56683, -2.267761, 1, 1, 1, 1, 1,
-0.7988604, -0.07934228, -1.28164, 1, 1, 1, 1, 1,
-0.7962633, 1.376857, -1.5419, 1, 1, 1, 1, 1,
-0.7946654, 0.568025, -1.186594, 1, 1, 1, 1, 1,
-0.7930758, -0.3751547, -3.061473, 1, 1, 1, 1, 1,
-0.7868134, -0.3623522, -2.940388, 1, 1, 1, 1, 1,
-0.7853837, 0.1289915, -2.422544, 0, 0, 1, 1, 1,
-0.779826, -1.816143, -2.653363, 1, 0, 0, 1, 1,
-0.7642558, -0.1161973, -3.509668, 1, 0, 0, 1, 1,
-0.7641578, 1.355719, -0.8812318, 1, 0, 0, 1, 1,
-0.7591008, -0.4273633, -2.478921, 1, 0, 0, 1, 1,
-0.7522449, -1.555551, -3.607991, 1, 0, 0, 1, 1,
-0.7520099, -1.987122, -2.910506, 0, 0, 0, 1, 1,
-0.7508529, 1.396276, 0.1610176, 0, 0, 0, 1, 1,
-0.7499827, -1.103927, -0.0331542, 0, 0, 0, 1, 1,
-0.7493711, -0.8976523, -2.788135, 0, 0, 0, 1, 1,
-0.7492859, -0.383233, -1.861411, 0, 0, 0, 1, 1,
-0.7487739, 0.7503837, -1.342655, 0, 0, 0, 1, 1,
-0.7474862, -1.51322, -2.456416, 0, 0, 0, 1, 1,
-0.7457729, 0.2632945, -0.4063817, 1, 1, 1, 1, 1,
-0.7443572, -1.674457, -3.042342, 1, 1, 1, 1, 1,
-0.7333163, -0.7416718, -3.003989, 1, 1, 1, 1, 1,
-0.7320695, -0.644461, -1.280479, 1, 1, 1, 1, 1,
-0.7247491, 0.8109439, -0.7797938, 1, 1, 1, 1, 1,
-0.7207534, 1.761357, -1.164001, 1, 1, 1, 1, 1,
-0.7167223, -0.3834816, -3.125745, 1, 1, 1, 1, 1,
-0.7161559, 1.832351, 0.2955664, 1, 1, 1, 1, 1,
-0.7090957, -0.6992854, -1.55966, 1, 1, 1, 1, 1,
-0.708048, 0.1382135, -0.7346483, 1, 1, 1, 1, 1,
-0.7075402, 1.545827, -1.737212, 1, 1, 1, 1, 1,
-0.7063512, 0.09549108, -2.612782, 1, 1, 1, 1, 1,
-0.7053836, -0.7971811, -2.182519, 1, 1, 1, 1, 1,
-0.7037998, 0.6166775, 0.4852368, 1, 1, 1, 1, 1,
-0.7027482, -1.198979, -3.747076, 1, 1, 1, 1, 1,
-0.702376, 0.2457502, -1.475451, 0, 0, 1, 1, 1,
-0.6991674, 1.317895, -1.182928, 1, 0, 0, 1, 1,
-0.6936724, -0.4432035, -1.584275, 1, 0, 0, 1, 1,
-0.684392, -0.3742178, -1.137168, 1, 0, 0, 1, 1,
-0.6820601, 0.4821303, -0.3855279, 1, 0, 0, 1, 1,
-0.6801037, 1.208107, -0.9418975, 1, 0, 0, 1, 1,
-0.6783071, -1.103926, -0.465151, 0, 0, 0, 1, 1,
-0.674018, 0.7060174, -1.296331, 0, 0, 0, 1, 1,
-0.6687019, -0.5029963, -4.062842, 0, 0, 0, 1, 1,
-0.6679059, 0.2334733, -1.285211, 0, 0, 0, 1, 1,
-0.6613773, -1.618653, -3.121651, 0, 0, 0, 1, 1,
-0.6547084, -0.144689, -0.4284774, 0, 0, 0, 1, 1,
-0.6500367, 0.2042145, -2.7181, 0, 0, 0, 1, 1,
-0.6479611, 1.306554, -0.02793887, 1, 1, 1, 1, 1,
-0.6470914, 0.3912856, -1.704743, 1, 1, 1, 1, 1,
-0.644133, -1.051288, -2.388613, 1, 1, 1, 1, 1,
-0.6429303, -0.6038079, -1.765349, 1, 1, 1, 1, 1,
-0.6422141, 0.4249336, -1.525465, 1, 1, 1, 1, 1,
-0.6377754, -0.7857153, -3.598153, 1, 1, 1, 1, 1,
-0.6367661, 0.5842677, 0.9412711, 1, 1, 1, 1, 1,
-0.6337062, 0.5564201, 1.263944, 1, 1, 1, 1, 1,
-0.6248964, 2.139856, 0.7634916, 1, 1, 1, 1, 1,
-0.6215459, 0.3602856, -1.518633, 1, 1, 1, 1, 1,
-0.6033843, -0.7194612, -1.447979, 1, 1, 1, 1, 1,
-0.6033084, 0.02929551, -2.266114, 1, 1, 1, 1, 1,
-0.6020872, -2.47753, -2.727349, 1, 1, 1, 1, 1,
-0.6012368, -0.8906325, -1.59355, 1, 1, 1, 1, 1,
-0.5982878, 1.702217, 0.5898861, 1, 1, 1, 1, 1,
-0.5960522, 0.8601037, -1.479918, 0, 0, 1, 1, 1,
-0.5952063, 1.14024, -0.07796767, 1, 0, 0, 1, 1,
-0.5934011, 1.212886, 1.711553, 1, 0, 0, 1, 1,
-0.5921254, 0.9537638, 0.3106422, 1, 0, 0, 1, 1,
-0.5920525, -0.6937643, -3.926179, 1, 0, 0, 1, 1,
-0.589384, -0.6589955, -2.582458, 1, 0, 0, 1, 1,
-0.5845922, 1.450692, -1.164701, 0, 0, 0, 1, 1,
-0.5830574, -2.418005, -1.454992, 0, 0, 0, 1, 1,
-0.5804842, 0.458289, -0.9603183, 0, 0, 0, 1, 1,
-0.5752482, 0.3179448, -2.642578, 0, 0, 0, 1, 1,
-0.5739954, -0.1876981, -2.153678, 0, 0, 0, 1, 1,
-0.5735776, -0.3499126, -1.927786, 0, 0, 0, 1, 1,
-0.5731748, 1.211078, -1.958691, 0, 0, 0, 1, 1,
-0.5711966, 0.6842059, -1.523467, 1, 1, 1, 1, 1,
-0.5693113, -0.623118, -2.220541, 1, 1, 1, 1, 1,
-0.5666552, 0.05890318, -3.062068, 1, 1, 1, 1, 1,
-0.565613, 0.6109139, -0.4927821, 1, 1, 1, 1, 1,
-0.5655703, 1.370258, -0.6058611, 1, 1, 1, 1, 1,
-0.5648937, -0.5584078, -1.62039, 1, 1, 1, 1, 1,
-0.5640946, 0.8498034, -1.787668, 1, 1, 1, 1, 1,
-0.5610172, 1.408826, -0.2878532, 1, 1, 1, 1, 1,
-0.5497657, 1.628627, -1.254615, 1, 1, 1, 1, 1,
-0.5481374, 0.3302666, -1.691741, 1, 1, 1, 1, 1,
-0.5480671, 0.5271153, -1.632097, 1, 1, 1, 1, 1,
-0.5308697, 0.1498576, 0.7249495, 1, 1, 1, 1, 1,
-0.5247777, 0.5137925, -0.4838087, 1, 1, 1, 1, 1,
-0.5230188, 0.6731872, 1.021377, 1, 1, 1, 1, 1,
-0.5090564, 1.758545, 0.5593374, 1, 1, 1, 1, 1,
-0.5021759, -3.019673, -1.050821, 0, 0, 1, 1, 1,
-0.498391, 1.056897, -0.3500786, 1, 0, 0, 1, 1,
-0.4981605, -1.861218, -2.905308, 1, 0, 0, 1, 1,
-0.4981579, -1.247004, -2.705344, 1, 0, 0, 1, 1,
-0.4954588, -1.418014, -3.192675, 1, 0, 0, 1, 1,
-0.486629, 0.3504693, -1.603403, 1, 0, 0, 1, 1,
-0.4840405, -1.580337, -3.755153, 0, 0, 0, 1, 1,
-0.4826286, -0.4939357, -2.849277, 0, 0, 0, 1, 1,
-0.4778739, 0.5666182, -1.867826, 0, 0, 0, 1, 1,
-0.4734612, 0.5309849, 1.147883, 0, 0, 0, 1, 1,
-0.4702841, 1.552642, -0.2035488, 0, 0, 0, 1, 1,
-0.4611183, 1.445735, 0.4813097, 0, 0, 0, 1, 1,
-0.461085, -0.3752718, -2.119603, 0, 0, 0, 1, 1,
-0.4594623, 0.832498, 1.045544, 1, 1, 1, 1, 1,
-0.4583911, 1.42793, 0.6847976, 1, 1, 1, 1, 1,
-0.45495, 0.3837712, -0.3892676, 1, 1, 1, 1, 1,
-0.4547332, -1.980867, -2.219162, 1, 1, 1, 1, 1,
-0.4532617, 1.220728, -0.741859, 1, 1, 1, 1, 1,
-0.4514028, -2.039066, -0.9772682, 1, 1, 1, 1, 1,
-0.4512411, 1.603245, 0.5277017, 1, 1, 1, 1, 1,
-0.4505325, -0.9988573, -3.845963, 1, 1, 1, 1, 1,
-0.4440511, -0.7523608, -3.409792, 1, 1, 1, 1, 1,
-0.4414165, -0.5564117, -2.214114, 1, 1, 1, 1, 1,
-0.4407255, -1.35941, -3.070643, 1, 1, 1, 1, 1,
-0.4375353, 0.5172422, -0.7945569, 1, 1, 1, 1, 1,
-0.4332407, -1.807574, -1.718871, 1, 1, 1, 1, 1,
-0.432954, -1.698622, -2.910652, 1, 1, 1, 1, 1,
-0.4277553, -0.7672915, -4.40977, 1, 1, 1, 1, 1,
-0.4252459, -1.180495, -2.510789, 0, 0, 1, 1, 1,
-0.4192755, 2.052977, -0.4881771, 1, 0, 0, 1, 1,
-0.419095, 0.8403116, -0.6878508, 1, 0, 0, 1, 1,
-0.4183994, -1.448033, -2.810039, 1, 0, 0, 1, 1,
-0.4142117, -0.7849079, -3.578504, 1, 0, 0, 1, 1,
-0.4133136, -1.613593, -3.043533, 1, 0, 0, 1, 1,
-0.4109838, 0.2457695, -2.041518, 0, 0, 0, 1, 1,
-0.4108096, -0.385519, -2.698083, 0, 0, 0, 1, 1,
-0.4091979, 0.7577888, -0.9147849, 0, 0, 0, 1, 1,
-0.4027767, 0.8986318, 0.301829, 0, 0, 0, 1, 1,
-0.4015568, 0.2499217, -1.0033, 0, 0, 0, 1, 1,
-0.4014247, 0.4935622, -0.8960785, 0, 0, 0, 1, 1,
-0.4009166, 0.2533273, -1.383549, 0, 0, 0, 1, 1,
-0.4001372, 0.2523776, -0.5831657, 1, 1, 1, 1, 1,
-0.3885534, -0.06531994, -0.1902682, 1, 1, 1, 1, 1,
-0.3840788, 0.6384287, 0.3302622, 1, 1, 1, 1, 1,
-0.3827326, 0.2819422, -1.096204, 1, 1, 1, 1, 1,
-0.381233, 1.164315, 0.3425512, 1, 1, 1, 1, 1,
-0.3806869, 0.3785163, -2.390626, 1, 1, 1, 1, 1,
-0.3797813, 1.025127, 0.8854578, 1, 1, 1, 1, 1,
-0.3732445, 1.210256, -0.1285724, 1, 1, 1, 1, 1,
-0.3718121, -0.4784555, -3.19776, 1, 1, 1, 1, 1,
-0.3706949, 2.133557, -0.4642801, 1, 1, 1, 1, 1,
-0.3685325, -0.4964455, -1.578848, 1, 1, 1, 1, 1,
-0.3633991, 0.983697, 0.9355209, 1, 1, 1, 1, 1,
-0.3610242, -0.02000783, -2.039428, 1, 1, 1, 1, 1,
-0.3609426, 0.1456853, -1.108006, 1, 1, 1, 1, 1,
-0.3545877, -0.06913988, -1.623427, 1, 1, 1, 1, 1,
-0.3520788, -2.007371, -2.914279, 0, 0, 1, 1, 1,
-0.3518262, -0.9379248, 0.2143208, 1, 0, 0, 1, 1,
-0.3517632, -0.268259, -2.77391, 1, 0, 0, 1, 1,
-0.3495249, 0.1470655, -0.9685921, 1, 0, 0, 1, 1,
-0.34931, 0.8193488, 1.03545, 1, 0, 0, 1, 1,
-0.3490224, 1.026298, -1.718931, 1, 0, 0, 1, 1,
-0.347888, -2.256319, -4.84545, 0, 0, 0, 1, 1,
-0.3451877, 0.51298, -1.465943, 0, 0, 0, 1, 1,
-0.344454, -0.1042245, -1.67688, 0, 0, 0, 1, 1,
-0.3440911, -0.5094203, -3.422721, 0, 0, 0, 1, 1,
-0.3426288, -0.02443786, -1.141046, 0, 0, 0, 1, 1,
-0.3371198, -0.5880452, -1.865545, 0, 0, 0, 1, 1,
-0.3360964, -0.3622887, -1.997816, 0, 0, 0, 1, 1,
-0.3341148, -0.1548658, -0.1113777, 1, 1, 1, 1, 1,
-0.3327395, 0.2529085, -2.074081, 1, 1, 1, 1, 1,
-0.3321742, 0.8692629, -0.132278, 1, 1, 1, 1, 1,
-0.3295207, -0.3162508, -1.967888, 1, 1, 1, 1, 1,
-0.3288315, 1.484162, 0.1620326, 1, 1, 1, 1, 1,
-0.3272208, -0.4855667, -3.028901, 1, 1, 1, 1, 1,
-0.3255959, -0.8003721, -0.5229369, 1, 1, 1, 1, 1,
-0.3254794, 0.2939436, 0.9442309, 1, 1, 1, 1, 1,
-0.3200031, -1.527207, -3.277649, 1, 1, 1, 1, 1,
-0.3143196, 0.3677773, -1.297138, 1, 1, 1, 1, 1,
-0.3130112, 1.029576, 0.9198498, 1, 1, 1, 1, 1,
-0.3107, -0.2507573, -0.9307311, 1, 1, 1, 1, 1,
-0.3089916, 1.03326, -0.05234479, 1, 1, 1, 1, 1,
-0.3071083, 0.4486779, -1.598872, 1, 1, 1, 1, 1,
-0.3008287, -0.2332112, -3.777111, 1, 1, 1, 1, 1,
-0.2999493, 0.7065713, 2.010536, 0, 0, 1, 1, 1,
-0.2976447, 0.8273658, 0.8209596, 1, 0, 0, 1, 1,
-0.2957662, -0.2221074, -3.780283, 1, 0, 0, 1, 1,
-0.2928303, 0.3559461, -1.385524, 1, 0, 0, 1, 1,
-0.2862827, 0.6202675, -1.372483, 1, 0, 0, 1, 1,
-0.2858287, -0.2926572, -1.981819, 1, 0, 0, 1, 1,
-0.2850131, -1.419651, -2.816866, 0, 0, 0, 1, 1,
-0.2842164, 0.9513856, -1.106721, 0, 0, 0, 1, 1,
-0.2838604, 1.403192, -1.115087, 0, 0, 0, 1, 1,
-0.2834354, 0.5475855, -0.04840003, 0, 0, 0, 1, 1,
-0.2786934, 0.8761901, -1.294429, 0, 0, 0, 1, 1,
-0.2765979, -0.3339056, -3.432367, 0, 0, 0, 1, 1,
-0.2732346, -1.076445, -3.289056, 0, 0, 0, 1, 1,
-0.2711721, -1.394838, -3.017176, 1, 1, 1, 1, 1,
-0.2692847, 1.266012, 0.4577723, 1, 1, 1, 1, 1,
-0.2664938, -0.241046, -2.906641, 1, 1, 1, 1, 1,
-0.2630548, 0.2626788, -0.7646837, 1, 1, 1, 1, 1,
-0.2623855, 0.9483916, -1.369601, 1, 1, 1, 1, 1,
-0.2616833, -1.654127, -4.083286, 1, 1, 1, 1, 1,
-0.261311, -0.7764236, -0.7126933, 1, 1, 1, 1, 1,
-0.2560581, -0.1388095, -3.247651, 1, 1, 1, 1, 1,
-0.2531034, -2.160578, -2.848226, 1, 1, 1, 1, 1,
-0.2529374, -0.04741042, -2.15426, 1, 1, 1, 1, 1,
-0.2519834, 1.070428, 0.4145057, 1, 1, 1, 1, 1,
-0.2502511, -0.33815, -1.604724, 1, 1, 1, 1, 1,
-0.2500897, 0.417835, 0.5826715, 1, 1, 1, 1, 1,
-0.2499015, 1.222131, -0.8729873, 1, 1, 1, 1, 1,
-0.2497359, 0.9483708, 0.4349861, 1, 1, 1, 1, 1,
-0.2452597, -0.9517779, -5.296478, 0, 0, 1, 1, 1,
-0.24316, -1.971499, -3.309385, 1, 0, 0, 1, 1,
-0.2418754, -2.01917, -2.833242, 1, 0, 0, 1, 1,
-0.2341417, -0.7180655, -3.585335, 1, 0, 0, 1, 1,
-0.2291096, -0.8755678, -2.462273, 1, 0, 0, 1, 1,
-0.2229223, -1.207198, -1.651883, 1, 0, 0, 1, 1,
-0.2212072, 0.3814674, -0.0683398, 0, 0, 0, 1, 1,
-0.2198101, 0.1994894, -1.481313, 0, 0, 0, 1, 1,
-0.2194487, -1.771315, -4.065265, 0, 0, 0, 1, 1,
-0.2173764, 0.7773939, 0.1018558, 0, 0, 0, 1, 1,
-0.2144196, 0.5438958, -0.9860207, 0, 0, 0, 1, 1,
-0.2138422, -0.8087668, -4.357159, 0, 0, 0, 1, 1,
-0.2115798, 0.2189444, -1.297877, 0, 0, 0, 1, 1,
-0.2107026, -0.3366194, -1.814384, 1, 1, 1, 1, 1,
-0.202015, 0.9929157, 0.3281392, 1, 1, 1, 1, 1,
-0.2005256, -0.06982322, -2.458707, 1, 1, 1, 1, 1,
-0.1945754, 1.943822, -0.03680829, 1, 1, 1, 1, 1,
-0.1897435, -0.4785129, -1.973644, 1, 1, 1, 1, 1,
-0.186813, -1.035147, -4.311619, 1, 1, 1, 1, 1,
-0.1855257, 0.691416, -0.1014507, 1, 1, 1, 1, 1,
-0.1838193, 0.801419, 1.885532, 1, 1, 1, 1, 1,
-0.180707, -0.8895686, -1.430791, 1, 1, 1, 1, 1,
-0.1803162, -0.3824637, -2.150301, 1, 1, 1, 1, 1,
-0.1760826, 0.5102476, 0.0715118, 1, 1, 1, 1, 1,
-0.1743132, -0.02056509, -1.565877, 1, 1, 1, 1, 1,
-0.1736477, 0.09780863, -0.8954681, 1, 1, 1, 1, 1,
-0.1680311, 0.1063027, -1.562478, 1, 1, 1, 1, 1,
-0.1658396, 1.54121, 0.1963454, 1, 1, 1, 1, 1,
-0.1621734, -0.1302805, -5.136163, 0, 0, 1, 1, 1,
-0.1603674, 0.3494635, 0.2276, 1, 0, 0, 1, 1,
-0.1570963, -0.9828138, -2.949252, 1, 0, 0, 1, 1,
-0.1565106, -0.09303157, -3.14452, 1, 0, 0, 1, 1,
-0.1517193, -2.059447, -1.426591, 1, 0, 0, 1, 1,
-0.1509491, 0.4147373, 0.2875679, 1, 0, 0, 1, 1,
-0.1491018, -1.807024, -1.563051, 0, 0, 0, 1, 1,
-0.1465556, -0.4589024, -1.748297, 0, 0, 0, 1, 1,
-0.1457478, -0.9273775, -3.521262, 0, 0, 0, 1, 1,
-0.1456609, 0.5547589, -1.154636, 0, 0, 0, 1, 1,
-0.1353792, -1.477372, -3.46842, 0, 0, 0, 1, 1,
-0.1320794, -0.9676536, -1.1147, 0, 0, 0, 1, 1,
-0.1286183, 0.008052566, -2.08934, 0, 0, 0, 1, 1,
-0.1263044, 1.210835, -0.1986482, 1, 1, 1, 1, 1,
-0.1249259, -0.6925902, -1.249849, 1, 1, 1, 1, 1,
-0.1230622, 0.5722657, -2.316176, 1, 1, 1, 1, 1,
-0.1228321, -0.4595236, -0.9385983, 1, 1, 1, 1, 1,
-0.1206925, 0.1993693, -0.7187473, 1, 1, 1, 1, 1,
-0.1192204, -1.576208, -2.87891, 1, 1, 1, 1, 1,
-0.1151547, 0.2867343, -0.807156, 1, 1, 1, 1, 1,
-0.1121282, -1.202748, -3.568811, 1, 1, 1, 1, 1,
-0.1108622, -3.128794, -2.906736, 1, 1, 1, 1, 1,
-0.1098688, 1.576204, 1.041712, 1, 1, 1, 1, 1,
-0.1089953, -0.8984807, -2.404035, 1, 1, 1, 1, 1,
-0.1084783, -0.3331306, -0.1822829, 1, 1, 1, 1, 1,
-0.1072176, 0.7844883, -1.357344, 1, 1, 1, 1, 1,
-0.1052892, -0.1816689, -4.044461, 1, 1, 1, 1, 1,
-0.1010373, 0.3862073, -1.948256, 1, 1, 1, 1, 1,
-0.1009265, -1.556377, -2.811341, 0, 0, 1, 1, 1,
-0.1007497, 1.157501, 1.62058, 1, 0, 0, 1, 1,
-0.1006304, -0.6682936, -4.530877, 1, 0, 0, 1, 1,
-0.1003404, 2.11878, 0.2664285, 1, 0, 0, 1, 1,
-0.09972098, 0.4430782, 1.11097, 1, 0, 0, 1, 1,
-0.09928495, 1.085592, -1.093978, 1, 0, 0, 1, 1,
-0.09859934, -0.968015, -3.138615, 0, 0, 0, 1, 1,
-0.09472758, 0.4795716, 1.856914, 0, 0, 0, 1, 1,
-0.09302707, -1.440444, -3.33264, 0, 0, 0, 1, 1,
-0.09128449, -0.9061596, -3.263824, 0, 0, 0, 1, 1,
-0.08760251, 0.4150936, -1.56115, 0, 0, 0, 1, 1,
-0.08758438, -0.4340886, -2.381639, 0, 0, 0, 1, 1,
-0.08707005, -0.8611149, -2.666289, 0, 0, 0, 1, 1,
-0.08272327, -0.4482604, -4.055707, 1, 1, 1, 1, 1,
-0.08084665, 0.05944563, 0.2100694, 1, 1, 1, 1, 1,
-0.07961997, 1.103386, 0.9870166, 1, 1, 1, 1, 1,
-0.0786065, 1.032988, 0.5341757, 1, 1, 1, 1, 1,
-0.07670679, -0.3453955, -2.496179, 1, 1, 1, 1, 1,
-0.07411182, -0.2652658, -4.318059, 1, 1, 1, 1, 1,
-0.07348658, -0.4654524, -2.405257, 1, 1, 1, 1, 1,
-0.07334322, 1.599904, -0.2966174, 1, 1, 1, 1, 1,
-0.07270849, 1.194185, -1.366066, 1, 1, 1, 1, 1,
-0.07249086, 1.024292, 1.734955, 1, 1, 1, 1, 1,
-0.06736498, -0.3038033, -2.202915, 1, 1, 1, 1, 1,
-0.06629543, -1.380878, -3.733747, 1, 1, 1, 1, 1,
-0.0594888, 0.8257127, -0.2338732, 1, 1, 1, 1, 1,
-0.05806244, -1.162851, -3.051668, 1, 1, 1, 1, 1,
-0.05668707, -0.5554521, -3.574934, 1, 1, 1, 1, 1,
-0.05618034, -0.2511975, -3.118694, 0, 0, 1, 1, 1,
-0.05565714, -0.3576262, -2.177027, 1, 0, 0, 1, 1,
-0.05474138, -0.3431984, -3.543167, 1, 0, 0, 1, 1,
-0.05378543, -0.5121263, -3.733845, 1, 0, 0, 1, 1,
-0.05177779, 0.3396297, 1.20201, 1, 0, 0, 1, 1,
-0.0484099, 0.1026081, -0.8850467, 1, 0, 0, 1, 1,
-0.04712297, -2.094436, -4.606131, 0, 0, 0, 1, 1,
-0.03723182, 1.968075, 0.452158, 0, 0, 0, 1, 1,
-0.03721398, 0.7333629, 0.3884058, 0, 0, 0, 1, 1,
-0.03607196, 0.8842348, -1.666974, 0, 0, 0, 1, 1,
-0.03254492, 0.6601359, 1.162583, 0, 0, 0, 1, 1,
-0.03080638, -1.096747, -2.685596, 0, 0, 0, 1, 1,
-0.02803075, 0.1991016, -0.2501674, 0, 0, 0, 1, 1,
-0.02755129, -0.7208318, -3.662724, 1, 1, 1, 1, 1,
-0.02046204, -2.34712, -4.903083, 1, 1, 1, 1, 1,
-0.01408742, -0.4699634, -3.802011, 1, 1, 1, 1, 1,
-0.01401385, 0.8570139, 1.43001, 1, 1, 1, 1, 1,
-0.009314362, -0.353188, -3.485421, 1, 1, 1, 1, 1,
-0.008645545, -0.3174804, -3.076368, 1, 1, 1, 1, 1,
-0.003222912, -0.6441709, -2.60384, 1, 1, 1, 1, 1,
-0.002825973, -0.3286341, -3.990168, 1, 1, 1, 1, 1,
-0.0007658984, 0.2646209, -0.06499607, 1, 1, 1, 1, 1,
0.001023199, 1.567974, 0.2899022, 1, 1, 1, 1, 1,
0.00170781, 1.784246, -0.1916443, 1, 1, 1, 1, 1,
0.008209297, -0.01368816, 3.738907, 1, 1, 1, 1, 1,
0.01579786, 0.05343994, -0.1751901, 1, 1, 1, 1, 1,
0.01603367, -0.1747488, 3.116709, 1, 1, 1, 1, 1,
0.01624186, -1.846667, 3.582878, 1, 1, 1, 1, 1,
0.017255, 0.04264745, 1.115245, 0, 0, 1, 1, 1,
0.01744105, -0.5356974, 2.167391, 1, 0, 0, 1, 1,
0.01939639, 1.11773, -1.770574, 1, 0, 0, 1, 1,
0.01958339, -0.5531271, 2.515567, 1, 0, 0, 1, 1,
0.02464158, -0.9510987, 1.535113, 1, 0, 0, 1, 1,
0.02523454, 1.371871, -0.2213347, 1, 0, 0, 1, 1,
0.02535939, -0.8735365, 2.919198, 0, 0, 0, 1, 1,
0.02949557, -1.171169, 4.576584, 0, 0, 0, 1, 1,
0.03048475, -2.049519, 4.425932, 0, 0, 0, 1, 1,
0.03085918, -0.2214063, 4.073509, 0, 0, 0, 1, 1,
0.03153481, 0.3193975, 1.145626, 0, 0, 0, 1, 1,
0.03477593, -1.41013, 2.975431, 0, 0, 0, 1, 1,
0.03664244, -1.560922, 0.4426392, 0, 0, 0, 1, 1,
0.04315495, 0.2065411, 0.7092071, 1, 1, 1, 1, 1,
0.04346558, -0.818777, 4.307507, 1, 1, 1, 1, 1,
0.04768734, 0.7214544, 0.4998812, 1, 1, 1, 1, 1,
0.0478449, 0.318652, -0.1874702, 1, 1, 1, 1, 1,
0.04813737, 1.439383, -0.1276249, 1, 1, 1, 1, 1,
0.05274265, -0.2878889, 3.944595, 1, 1, 1, 1, 1,
0.06009867, 1.072845, -0.3229317, 1, 1, 1, 1, 1,
0.06032519, 0.2886201, 0.747619, 1, 1, 1, 1, 1,
0.06571376, 0.7776737, -0.3585524, 1, 1, 1, 1, 1,
0.07030779, -0.2862878, 2.952269, 1, 1, 1, 1, 1,
0.07356612, 0.7268217, -0.3128213, 1, 1, 1, 1, 1,
0.08346047, -0.035244, 3.806262, 1, 1, 1, 1, 1,
0.08931006, 0.9485437, 0.5882082, 1, 1, 1, 1, 1,
0.09030417, -1.920717, 2.630461, 1, 1, 1, 1, 1,
0.0919292, -1.586378, 1.877956, 1, 1, 1, 1, 1,
0.09313656, 0.4863822, 1.007006, 0, 0, 1, 1, 1,
0.09483143, -1.200554, 3.721154, 1, 0, 0, 1, 1,
0.09521625, -0.9786394, 4.105873, 1, 0, 0, 1, 1,
0.1003825, 0.1407907, 0.3059103, 1, 0, 0, 1, 1,
0.1007376, -0.672388, 2.814471, 1, 0, 0, 1, 1,
0.1031765, 1.605561, 1.055526, 1, 0, 0, 1, 1,
0.1046654, -0.4636593, 3.176104, 0, 0, 0, 1, 1,
0.1061052, -0.7965939, 3.714974, 0, 0, 0, 1, 1,
0.1092942, 0.03587697, 1.417646, 0, 0, 0, 1, 1,
0.1095681, -0.9908288, 1.795308, 0, 0, 0, 1, 1,
0.1100715, -0.4076979, 4.30024, 0, 0, 0, 1, 1,
0.113264, -0.4082208, 3.156174, 0, 0, 0, 1, 1,
0.1172163, -0.9860423, 2.353729, 0, 0, 0, 1, 1,
0.1242661, -0.9344605, 1.642386, 1, 1, 1, 1, 1,
0.1293842, 2.233289, -0.1256664, 1, 1, 1, 1, 1,
0.131914, -0.473182, 3.560477, 1, 1, 1, 1, 1,
0.1320309, -0.8988922, 4.818722, 1, 1, 1, 1, 1,
0.1349335, 0.3603905, -0.8575758, 1, 1, 1, 1, 1,
0.1397584, -0.3934869, 3.884629, 1, 1, 1, 1, 1,
0.1431576, -1.013651, 1.41871, 1, 1, 1, 1, 1,
0.1431766, 0.3308214, 1.458743, 1, 1, 1, 1, 1,
0.1439438, 1.588912, 2.955359, 1, 1, 1, 1, 1,
0.1444414, 0.7796734, 0.7378445, 1, 1, 1, 1, 1,
0.1468749, -0.3858802, 2.468167, 1, 1, 1, 1, 1,
0.1469202, -1.568391, 1.798909, 1, 1, 1, 1, 1,
0.1474404, 0.03516392, -0.2745928, 1, 1, 1, 1, 1,
0.1505601, 0.6851601, -0.1841837, 1, 1, 1, 1, 1,
0.1511313, 0.8269851, 0.001756342, 1, 1, 1, 1, 1,
0.1545372, -3.1457, 2.97095, 0, 0, 1, 1, 1,
0.159012, -0.08038321, 2.694595, 1, 0, 0, 1, 1,
0.172975, 0.5666378, 1.115469, 1, 0, 0, 1, 1,
0.1753194, -0.828326, 3.760416, 1, 0, 0, 1, 1,
0.1798651, -0.3641602, 2.37494, 1, 0, 0, 1, 1,
0.1848162, 2.178527, 0.1236721, 1, 0, 0, 1, 1,
0.1886841, 0.6902407, -0.1516304, 0, 0, 0, 1, 1,
0.1891982, 0.8206122, -0.1686304, 0, 0, 0, 1, 1,
0.1917135, 0.1557563, -1.051417, 0, 0, 0, 1, 1,
0.1920354, 0.9772197, -1.084822, 0, 0, 0, 1, 1,
0.1923815, -0.4846054, 3.85617, 0, 0, 0, 1, 1,
0.1969202, -1.094141, 3.069321, 0, 0, 0, 1, 1,
0.1991431, 0.2756319, 0.2031039, 0, 0, 0, 1, 1,
0.2069449, -0.2866876, 1.08909, 1, 1, 1, 1, 1,
0.2074084, -0.0557536, 0.9996198, 1, 1, 1, 1, 1,
0.209709, -0.3267223, 1.934381, 1, 1, 1, 1, 1,
0.2114344, -2.084949, 2.778038, 1, 1, 1, 1, 1,
0.2138656, -1.126769, 3.710487, 1, 1, 1, 1, 1,
0.2211596, -1.204953, 1.855397, 1, 1, 1, 1, 1,
0.2221778, -2.573539, 4.284959, 1, 1, 1, 1, 1,
0.2244496, -0.2006871, 2.933018, 1, 1, 1, 1, 1,
0.2245535, 0.07612723, 2.166262, 1, 1, 1, 1, 1,
0.2246827, -1.015908, 1.543269, 1, 1, 1, 1, 1,
0.225809, 1.812766, -0.0008870091, 1, 1, 1, 1, 1,
0.2300874, -0.1143349, 0.7993177, 1, 1, 1, 1, 1,
0.2327377, 0.5507266, 1.371157, 1, 1, 1, 1, 1,
0.2350347, -1.61226, 3.282008, 1, 1, 1, 1, 1,
0.2358367, 1.896085, -0.1246347, 1, 1, 1, 1, 1,
0.2379061, -2.791423, 3.270671, 0, 0, 1, 1, 1,
0.2396498, -1.338223, 4.743924, 1, 0, 0, 1, 1,
0.2450174, -1.120459, 1.296113, 1, 0, 0, 1, 1,
0.2454972, -0.7639978, 3.712362, 1, 0, 0, 1, 1,
0.2457614, -0.5991387, 3.956011, 1, 0, 0, 1, 1,
0.2470412, -0.216633, 1.507733, 1, 0, 0, 1, 1,
0.2515675, -0.6480587, 4.604005, 0, 0, 0, 1, 1,
0.2518157, -0.05897603, 1.851363, 0, 0, 0, 1, 1,
0.2528564, 0.6656454, -0.8418864, 0, 0, 0, 1, 1,
0.2551556, -0.08584835, 2.899922, 0, 0, 0, 1, 1,
0.2575763, -1.169208, 3.470706, 0, 0, 0, 1, 1,
0.2596374, 0.2653315, 3.485391, 0, 0, 0, 1, 1,
0.2604351, -1.675184, 3.773587, 0, 0, 0, 1, 1,
0.2635455, 0.4377898, 1.035124, 1, 1, 1, 1, 1,
0.2644685, -0.8124195, 3.122019, 1, 1, 1, 1, 1,
0.2644863, 0.1244052, -0.3609453, 1, 1, 1, 1, 1,
0.2650697, -0.9860082, 3.049351, 1, 1, 1, 1, 1,
0.265266, 0.36462, -1.9362, 1, 1, 1, 1, 1,
0.2719955, 0.2550207, 2.869951, 1, 1, 1, 1, 1,
0.2736124, -1.522941, 0.9470255, 1, 1, 1, 1, 1,
0.2737777, -0.326258, 2.452234, 1, 1, 1, 1, 1,
0.2748625, -1.060732, 1.178828, 1, 1, 1, 1, 1,
0.2787523, -0.1750517, 2.11233, 1, 1, 1, 1, 1,
0.2790787, 1.47407, 0.6964406, 1, 1, 1, 1, 1,
0.2808352, 1.237491, 0.06245905, 1, 1, 1, 1, 1,
0.2812412, 0.7511123, -0.3783919, 1, 1, 1, 1, 1,
0.2815201, 0.9694682, -0.7349759, 1, 1, 1, 1, 1,
0.2829431, 1.418525, 0.6867135, 1, 1, 1, 1, 1,
0.2854238, -1.77056, 2.176831, 0, 0, 1, 1, 1,
0.2859675, 0.2243312, 2.224152, 1, 0, 0, 1, 1,
0.2867903, -0.8785379, 2.692841, 1, 0, 0, 1, 1,
0.2885336, -0.2002929, 2.12976, 1, 0, 0, 1, 1,
0.290571, 0.9903834, 0.5924717, 1, 0, 0, 1, 1,
0.2907587, -0.708291, 3.590969, 1, 0, 0, 1, 1,
0.2986281, -0.4617476, 3.002718, 0, 0, 0, 1, 1,
0.3132761, -1.135136, 2.698241, 0, 0, 0, 1, 1,
0.3138967, -0.6090097, 2.282375, 0, 0, 0, 1, 1,
0.3145446, -0.4839953, 2.982785, 0, 0, 0, 1, 1,
0.3198894, -0.1007427, 2.18436, 0, 0, 0, 1, 1,
0.3212628, 0.4797588, -1.303153, 0, 0, 0, 1, 1,
0.3266945, 1.198418, 1.043941, 0, 0, 0, 1, 1,
0.3284152, 1.396187, -1.755407, 1, 1, 1, 1, 1,
0.3295663, -1.538783, 2.984646, 1, 1, 1, 1, 1,
0.3314214, 0.1008421, 2.197888, 1, 1, 1, 1, 1,
0.3317958, 0.3436758, 1.433524, 1, 1, 1, 1, 1,
0.3333803, -0.05090567, 1.645041, 1, 1, 1, 1, 1,
0.3349085, -1.307082, 3.851477, 1, 1, 1, 1, 1,
0.3380933, -0.86538, 1.923937, 1, 1, 1, 1, 1,
0.3410232, -0.4478846, 2.661728, 1, 1, 1, 1, 1,
0.3486006, -0.4559659, 4.323308, 1, 1, 1, 1, 1,
0.3486648, -0.7341426, 2.819129, 1, 1, 1, 1, 1,
0.3514238, -0.5255381, 0.5227171, 1, 1, 1, 1, 1,
0.3526472, 0.5171548, -1.009793, 1, 1, 1, 1, 1,
0.3528797, -0.0004100841, 2.849153, 1, 1, 1, 1, 1,
0.3620074, 0.5719807, 1.656341, 1, 1, 1, 1, 1,
0.3632625, 1.695279, -1.196952, 1, 1, 1, 1, 1,
0.3672681, -2.107229, 4.004017, 0, 0, 1, 1, 1,
0.3705305, 0.1267388, 1.199208, 1, 0, 0, 1, 1,
0.3721849, 1.560274, -0.2435709, 1, 0, 0, 1, 1,
0.3851237, -1.260482, 3.587459, 1, 0, 0, 1, 1,
0.3854409, 0.6121884, 1.906573, 1, 0, 0, 1, 1,
0.3874845, 0.7861531, 0.4280072, 1, 0, 0, 1, 1,
0.3876143, 0.2757259, 0.8261346, 0, 0, 0, 1, 1,
0.3892536, 0.3634763, 1.089804, 0, 0, 0, 1, 1,
0.3944514, -0.9954701, 3.347406, 0, 0, 0, 1, 1,
0.3946034, 1.479117, 0.2958713, 0, 0, 0, 1, 1,
0.3975444, -0.2801519, 2.54522, 0, 0, 0, 1, 1,
0.3975459, 0.1365902, 0.9038378, 0, 0, 0, 1, 1,
0.4009345, -1.139366, 3.013319, 0, 0, 0, 1, 1,
0.402508, -0.460095, 3.294802, 1, 1, 1, 1, 1,
0.4053859, -0.1029973, 1.644986, 1, 1, 1, 1, 1,
0.4071137, -1.165091, 2.417986, 1, 1, 1, 1, 1,
0.4124812, -0.02155535, 2.278634, 1, 1, 1, 1, 1,
0.4174029, -0.1724553, 0.7173232, 1, 1, 1, 1, 1,
0.4262296, 0.8378789, 0.9917164, 1, 1, 1, 1, 1,
0.4264792, -0.2265009, 1.522403, 1, 1, 1, 1, 1,
0.4270488, -0.8827041, 2.708802, 1, 1, 1, 1, 1,
0.4282396, -1.751917, 3.898934, 1, 1, 1, 1, 1,
0.4335555, -0.7973832, 1.750247, 1, 1, 1, 1, 1,
0.4343438, 1.274592, -0.1147734, 1, 1, 1, 1, 1,
0.4372582, 0.1348043, 1.776529, 1, 1, 1, 1, 1,
0.4410587, 1.396761, 0.7972521, 1, 1, 1, 1, 1,
0.4413136, -1.203385, 2.143744, 1, 1, 1, 1, 1,
0.4416819, -0.02817502, 1.180579, 1, 1, 1, 1, 1,
0.4437995, -1.193576, 2.240571, 0, 0, 1, 1, 1,
0.4471777, 0.3601239, -0.6881964, 1, 0, 0, 1, 1,
0.450826, -0.9383235, 1.582015, 1, 0, 0, 1, 1,
0.4581267, 1.845563, -0.00465447, 1, 0, 0, 1, 1,
0.4584323, -0.6397213, 3.117561, 1, 0, 0, 1, 1,
0.4595489, -1.213185, 2.867404, 1, 0, 0, 1, 1,
0.4599846, -0.2997806, 0.6476235, 0, 0, 0, 1, 1,
0.4617433, 0.4566742, 0.9974801, 0, 0, 0, 1, 1,
0.4658947, 0.2018095, -0.4479037, 0, 0, 0, 1, 1,
0.4664633, 0.06148912, 1.191791, 0, 0, 0, 1, 1,
0.4671506, 0.3780562, 1.052007, 0, 0, 0, 1, 1,
0.4699723, -0.7092268, 0.4187685, 0, 0, 0, 1, 1,
0.4739998, -1.52436, 3.032645, 0, 0, 0, 1, 1,
0.4742304, 0.7581296, 0.5293598, 1, 1, 1, 1, 1,
0.477885, -1.67735, 2.419577, 1, 1, 1, 1, 1,
0.478383, -1.383383, 1.227521, 1, 1, 1, 1, 1,
0.4807927, -0.4447511, 1.623297, 1, 1, 1, 1, 1,
0.4822698, -0.4886342, 1.407615, 1, 1, 1, 1, 1,
0.4863761, 1.835518, 0.1324353, 1, 1, 1, 1, 1,
0.4992151, -0.2723255, 2.213176, 1, 1, 1, 1, 1,
0.5019036, -0.7404453, 2.4126, 1, 1, 1, 1, 1,
0.5024706, -0.2378921, 2.343948, 1, 1, 1, 1, 1,
0.5123699, -0.2938913, 1.467626, 1, 1, 1, 1, 1,
0.515471, -0.3836013, 2.197626, 1, 1, 1, 1, 1,
0.5168079, 0.6472951, 2.457451, 1, 1, 1, 1, 1,
0.5173497, -0.6820862, 2.569909, 1, 1, 1, 1, 1,
0.5201324, -0.2328492, 2.732082, 1, 1, 1, 1, 1,
0.5222846, -1.064557, 2.082284, 1, 1, 1, 1, 1,
0.5371627, -0.1553518, 2.252582, 0, 0, 1, 1, 1,
0.539575, -0.335719, 2.514805, 1, 0, 0, 1, 1,
0.5442282, -1.074512, 3.210246, 1, 0, 0, 1, 1,
0.5451136, -0.448225, 3.19245, 1, 0, 0, 1, 1,
0.5467204, 0.04292504, 0.4806859, 1, 0, 0, 1, 1,
0.5471948, -1.075248, 2.714571, 1, 0, 0, 1, 1,
0.5484291, 0.2021679, 3.568848, 0, 0, 0, 1, 1,
0.5490754, -1.721083, 3.957087, 0, 0, 0, 1, 1,
0.5497729, -0.3952558, 2.091496, 0, 0, 0, 1, 1,
0.5501142, 1.766182, 2.040267, 0, 0, 0, 1, 1,
0.5605842, 1.106413, -0.185998, 0, 0, 0, 1, 1,
0.562836, -1.188319, 3.680263, 0, 0, 0, 1, 1,
0.5634823, 1.850058, -0.5959681, 0, 0, 0, 1, 1,
0.5640051, -0.2093491, 3.122522, 1, 1, 1, 1, 1,
0.5715307, 0.1676523, 1.039186, 1, 1, 1, 1, 1,
0.5776679, 0.2074875, 3.122224, 1, 1, 1, 1, 1,
0.5815102, 0.3705324, 0.6751638, 1, 1, 1, 1, 1,
0.5821067, 0.3841149, 2.289859, 1, 1, 1, 1, 1,
0.582643, 0.7991495, 0.7307165, 1, 1, 1, 1, 1,
0.5848914, -1.643936, 2.402819, 1, 1, 1, 1, 1,
0.5865024, -0.3039226, 2.777887, 1, 1, 1, 1, 1,
0.5871475, -0.7282549, 1.388195, 1, 1, 1, 1, 1,
0.5908264, 0.8759811, 0.4542728, 1, 1, 1, 1, 1,
0.593142, 0.01591729, 1.506922, 1, 1, 1, 1, 1,
0.5974005, 1.084655, 0.4388108, 1, 1, 1, 1, 1,
0.5985718, 0.8145912, -0.8255162, 1, 1, 1, 1, 1,
0.6012411, 1.987059, 0.4955713, 1, 1, 1, 1, 1,
0.6074448, -0.5817529, 2.77055, 1, 1, 1, 1, 1,
0.6082832, 0.2233223, -0.4181291, 0, 0, 1, 1, 1,
0.6095661, 0.4022894, 1.196007, 1, 0, 0, 1, 1,
0.6185637, 0.3640353, 2.142256, 1, 0, 0, 1, 1,
0.6236619, -0.4588277, 0.9401213, 1, 0, 0, 1, 1,
0.6253878, 0.2493849, -0.1484749, 1, 0, 0, 1, 1,
0.6255968, -0.1138739, 1.320516, 1, 0, 0, 1, 1,
0.6278926, 0.04649301, 1.459928, 0, 0, 0, 1, 1,
0.6279261, 0.512595, 0.3987911, 0, 0, 0, 1, 1,
0.6383923, -1.920043, 3.452139, 0, 0, 0, 1, 1,
0.6442444, 0.726559, 0.08817039, 0, 0, 0, 1, 1,
0.6476892, -0.09897747, 3.569337, 0, 0, 0, 1, 1,
0.6550481, -0.02639103, 3.169713, 0, 0, 0, 1, 1,
0.6562141, 1.142532, 0.5384552, 0, 0, 0, 1, 1,
0.6586576, -0.7752445, 2.679712, 1, 1, 1, 1, 1,
0.6716047, 0.03652864, 3.84768, 1, 1, 1, 1, 1,
0.6751693, -0.06898522, 2.619767, 1, 1, 1, 1, 1,
0.676537, 0.9431292, 0.3809208, 1, 1, 1, 1, 1,
0.679546, -0.04570583, 1.800261, 1, 1, 1, 1, 1,
0.6889532, -1.032054, 3.519209, 1, 1, 1, 1, 1,
0.6890031, -1.366009, 4.087587, 1, 1, 1, 1, 1,
0.6915428, 1.292576, -0.04093632, 1, 1, 1, 1, 1,
0.6961222, -1.983421, 3.343534, 1, 1, 1, 1, 1,
0.7016545, -1.375352, 2.341435, 1, 1, 1, 1, 1,
0.7022771, 0.4075251, 0.6169945, 1, 1, 1, 1, 1,
0.7359262, 0.9910402, 1.126848, 1, 1, 1, 1, 1,
0.7378432, -0.765203, 2.828067, 1, 1, 1, 1, 1,
0.7446059, 0.01611401, -0.8439569, 1, 1, 1, 1, 1,
0.7473952, 0.7957356, -0.03772587, 1, 1, 1, 1, 1,
0.7494612, 0.5904481, -0.1454257, 0, 0, 1, 1, 1,
0.7496136, 0.9398102, -0.3022616, 1, 0, 0, 1, 1,
0.7531019, 0.4139334, -0.1832929, 1, 0, 0, 1, 1,
0.7577661, 1.209282, 1.114834, 1, 0, 0, 1, 1,
0.7606368, -0.5288616, 2.454351, 1, 0, 0, 1, 1,
0.7613013, -0.9943066, 2.149177, 1, 0, 0, 1, 1,
0.7614712, 0.3943904, 1.456964, 0, 0, 0, 1, 1,
0.7619349, 1.081964, 1.128456, 0, 0, 0, 1, 1,
0.7630849, 0.1801377, 0.5290436, 0, 0, 0, 1, 1,
0.7658505, -1.645319, 3.972971, 0, 0, 0, 1, 1,
0.769243, -0.1296276, 1.907883, 0, 0, 0, 1, 1,
0.7714356, 1.83218, 0.6141703, 0, 0, 0, 1, 1,
0.7744089, 1.228178, 0.8239609, 0, 0, 0, 1, 1,
0.7762228, -0.06961965, 1.579754, 1, 1, 1, 1, 1,
0.7762392, 0.6022034, 1.256118, 1, 1, 1, 1, 1,
0.785758, 2.110213, -0.8050506, 1, 1, 1, 1, 1,
0.7925138, -0.8820827, 2.882573, 1, 1, 1, 1, 1,
0.795808, -1.701249, 3.112288, 1, 1, 1, 1, 1,
0.7973776, -0.7916092, 3.82254, 1, 1, 1, 1, 1,
0.7975032, -0.6885549, 2.725349, 1, 1, 1, 1, 1,
0.8003896, 1.471986, 0.397323, 1, 1, 1, 1, 1,
0.8020206, -0.0935991, 2.890393, 1, 1, 1, 1, 1,
0.8058289, 0.08159085, 2.199541, 1, 1, 1, 1, 1,
0.8060383, 1.444413, 0.9298952, 1, 1, 1, 1, 1,
0.8079342, -0.1708171, 1.27797, 1, 1, 1, 1, 1,
0.8089346, 0.8620502, 0.4697406, 1, 1, 1, 1, 1,
0.8115545, -0.0459687, 1.146188, 1, 1, 1, 1, 1,
0.8163756, -0.8637841, 3.075278, 1, 1, 1, 1, 1,
0.8169692, 0.0229954, 1.004211, 0, 0, 1, 1, 1,
0.8177125, -0.373545, 1.188588, 1, 0, 0, 1, 1,
0.824838, 0.783083, 0.9288172, 1, 0, 0, 1, 1,
0.8248833, -0.2400669, 2.515412, 1, 0, 0, 1, 1,
0.8258683, 1.661296, 1.12378, 1, 0, 0, 1, 1,
0.8261088, -1.532911, 3.528215, 1, 0, 0, 1, 1,
0.827688, 0.3844531, 1.638991, 0, 0, 0, 1, 1,
0.832431, 0.3201648, 0.05201787, 0, 0, 0, 1, 1,
0.8375116, 0.939899, 0.02046003, 0, 0, 0, 1, 1,
0.8388539, -0.4522109, 3.869936, 0, 0, 0, 1, 1,
0.8395756, -1.196623, 2.900857, 0, 0, 0, 1, 1,
0.8497968, -0.8525866, 1.300897, 0, 0, 0, 1, 1,
0.8561708, 0.522558, 1.8405, 0, 0, 0, 1, 1,
0.8603491, 0.4267884, 1.798239, 1, 1, 1, 1, 1,
0.8712587, 1.265776, 1.1677, 1, 1, 1, 1, 1,
0.8740073, -0.1731752, 1.557214, 1, 1, 1, 1, 1,
0.880629, 0.9069541, -1.021457, 1, 1, 1, 1, 1,
0.884456, -1.638929, 3.626548, 1, 1, 1, 1, 1,
0.8897781, -1.084255, 1.334261, 1, 1, 1, 1, 1,
0.892976, -0.3603036, 1.193167, 1, 1, 1, 1, 1,
0.8959836, 0.2986254, 1.239003, 1, 1, 1, 1, 1,
0.899305, 0.3912598, 0.3886294, 1, 1, 1, 1, 1,
0.9059423, -0.350552, 1.319705, 1, 1, 1, 1, 1,
0.9085323, -2.078771, 1.082812, 1, 1, 1, 1, 1,
0.9166358, -1.116527, 3.576619, 1, 1, 1, 1, 1,
0.9173056, 0.5122481, 1.31079, 1, 1, 1, 1, 1,
0.9216353, 0.6276315, 1.817572, 1, 1, 1, 1, 1,
0.9237921, 0.4278102, 0.8061216, 1, 1, 1, 1, 1,
0.9362872, 0.2971931, 1.516512, 0, 0, 1, 1, 1,
0.9513741, -1.737133, 3.093944, 1, 0, 0, 1, 1,
0.9607919, -0.2220948, 1.012801, 1, 0, 0, 1, 1,
0.9623582, 0.9896861, -0.861764, 1, 0, 0, 1, 1,
0.9650397, -0.5247638, 2.355765, 1, 0, 0, 1, 1,
0.9657761, 1.853358, -0.1982776, 1, 0, 0, 1, 1,
0.9685474, 1.179347, 0.7360106, 0, 0, 0, 1, 1,
0.9687284, -0.1347622, 2.418375, 0, 0, 0, 1, 1,
0.9692981, 0.2917804, 0.8366433, 0, 0, 0, 1, 1,
0.9731203, 0.1046587, 1.345312, 0, 0, 0, 1, 1,
0.9763606, -0.155002, 1.955675, 0, 0, 0, 1, 1,
0.9916836, -1.54201, 3.343616, 0, 0, 0, 1, 1,
1.010108, -0.2908067, 1.593653, 0, 0, 0, 1, 1,
1.024787, -0.1094117, 0.3844248, 1, 1, 1, 1, 1,
1.029212, -0.6873373, 2.600536, 1, 1, 1, 1, 1,
1.029939, -1.362318, 1.2414, 1, 1, 1, 1, 1,
1.03648, 0.04894855, 0.4938116, 1, 1, 1, 1, 1,
1.043168, -1.526337, 2.758517, 1, 1, 1, 1, 1,
1.045445, 0.3012286, 1.386401, 1, 1, 1, 1, 1,
1.054682, -0.1727904, 1.72837, 1, 1, 1, 1, 1,
1.055434, 1.219712, 1.221131, 1, 1, 1, 1, 1,
1.05875, 0.6443419, 0.7831679, 1, 1, 1, 1, 1,
1.080255, 1.004295, 0.9911505, 1, 1, 1, 1, 1,
1.086178, 1.178756, -0.7535998, 1, 1, 1, 1, 1,
1.091953, 1.489143, 0.9453198, 1, 1, 1, 1, 1,
1.092181, 0.6401279, -1.564113, 1, 1, 1, 1, 1,
1.093391, -0.08243439, 1.645809, 1, 1, 1, 1, 1,
1.094015, 0.7945192, 1.317286, 1, 1, 1, 1, 1,
1.096723, 0.3867083, 1.12467, 0, 0, 1, 1, 1,
1.097337, 0.431722, -0.5746666, 1, 0, 0, 1, 1,
1.098779, -0.8561119, 2.709658, 1, 0, 0, 1, 1,
1.09937, -1.970135, 3.251464, 1, 0, 0, 1, 1,
1.102658, -0.2750469, 1.933295, 1, 0, 0, 1, 1,
1.117142, 0.2547342, 1.082769, 1, 0, 0, 1, 1,
1.124012, -0.1653944, -0.06010435, 0, 0, 0, 1, 1,
1.127383, 1.04652, 1.405767, 0, 0, 0, 1, 1,
1.127963, -0.5478815, 2.48763, 0, 0, 0, 1, 1,
1.160785, -1.276942, 1.907045, 0, 0, 0, 1, 1,
1.16375, -0.2001822, 1.391788, 0, 0, 0, 1, 1,
1.171453, -0.3551961, 2.669217, 0, 0, 0, 1, 1,
1.180792, 0.3061576, 2.19543, 0, 0, 0, 1, 1,
1.188491, -0.03309981, 2.565565, 1, 1, 1, 1, 1,
1.200355, -1.247481, 2.362514, 1, 1, 1, 1, 1,
1.204781, -0.2577786, 1.136061, 1, 1, 1, 1, 1,
1.205737, 0.05120008, 0.4824681, 1, 1, 1, 1, 1,
1.226631, 0.8283325, -0.5021958, 1, 1, 1, 1, 1,
1.23262, -1.785986, 1.596649, 1, 1, 1, 1, 1,
1.239384, -0.9642124, 1.026078, 1, 1, 1, 1, 1,
1.254119, -0.8688881, 2.421902, 1, 1, 1, 1, 1,
1.261794, -0.1228955, 3.183672, 1, 1, 1, 1, 1,
1.265507, 0.09951653, 0.1034257, 1, 1, 1, 1, 1,
1.270775, 0.4991776, 2.024898, 1, 1, 1, 1, 1,
1.277545, 1.634489, 1.248586, 1, 1, 1, 1, 1,
1.289433, -1.448614, 3.89179, 1, 1, 1, 1, 1,
1.290609, -0.003433304, 0.6458856, 1, 1, 1, 1, 1,
1.291968, 1.327242, 1.614335, 1, 1, 1, 1, 1,
1.293525, -1.308497, 1.717278, 0, 0, 1, 1, 1,
1.293557, -0.4645938, 2.231465, 1, 0, 0, 1, 1,
1.295312, 0.2046258, 0.01919116, 1, 0, 0, 1, 1,
1.296211, -0.1642689, 4.354572, 1, 0, 0, 1, 1,
1.307497, 1.063242, 2.342171, 1, 0, 0, 1, 1,
1.312559, 0.7085775, -0.02555352, 1, 0, 0, 1, 1,
1.315838, 0.3437577, 0.7145082, 0, 0, 0, 1, 1,
1.328734, 0.8811198, -0.5078976, 0, 0, 0, 1, 1,
1.329293, -0.0867593, 2.677434, 0, 0, 0, 1, 1,
1.331967, -0.0246038, 1.167704, 0, 0, 0, 1, 1,
1.335809, -1.596465, 4.211197, 0, 0, 0, 1, 1,
1.351438, 0.3814555, 1.740708, 0, 0, 0, 1, 1,
1.359851, -1.433487, 1.58795, 0, 0, 0, 1, 1,
1.361595, -1.026585, 2.238308, 1, 1, 1, 1, 1,
1.36887, -1.704726, 1.187776, 1, 1, 1, 1, 1,
1.379334, 1.851937, 1.943048, 1, 1, 1, 1, 1,
1.38822, 1.009577, 1.184009, 1, 1, 1, 1, 1,
1.391408, -1.950779, 4.295482, 1, 1, 1, 1, 1,
1.413488, 0.2926111, 1.256944, 1, 1, 1, 1, 1,
1.419886, -1.10777, 3.029298, 1, 1, 1, 1, 1,
1.423804, -1.437935, 1.539285, 1, 1, 1, 1, 1,
1.428243, 0.334042, 1.757847, 1, 1, 1, 1, 1,
1.445544, -0.2581502, 2.265823, 1, 1, 1, 1, 1,
1.460847, -0.5790841, 2.145979, 1, 1, 1, 1, 1,
1.476463, -0.04347793, 2.513998, 1, 1, 1, 1, 1,
1.47654, 0.5057822, 1.389156, 1, 1, 1, 1, 1,
1.483896, -0.487946, 1.464213, 1, 1, 1, 1, 1,
1.495025, 0.0707944, 1.558474, 1, 1, 1, 1, 1,
1.496714, 0.5327249, 2.416079, 0, 0, 1, 1, 1,
1.496822, -0.4488736, 1.215382, 1, 0, 0, 1, 1,
1.510572, -0.1554057, 3.000924, 1, 0, 0, 1, 1,
1.513693, 0.5570145, 1.004967, 1, 0, 0, 1, 1,
1.522191, -0.3499426, 2.014484, 1, 0, 0, 1, 1,
1.523313, -0.562466, 1.068622, 1, 0, 0, 1, 1,
1.533276, 0.06218325, 0.8696885, 0, 0, 0, 1, 1,
1.538292, 0.5742183, 0.7841599, 0, 0, 0, 1, 1,
1.538877, 0.6341083, 1.317085, 0, 0, 0, 1, 1,
1.546431, -1.822485, 3.650974, 0, 0, 0, 1, 1,
1.560386, 0.8648188, 1.06123, 0, 0, 0, 1, 1,
1.562804, -0.4810978, 0.2355997, 0, 0, 0, 1, 1,
1.564094, -0.5327057, 4.230793, 0, 0, 0, 1, 1,
1.564991, 0.1853704, 2.295823, 1, 1, 1, 1, 1,
1.56503, 0.4336857, -0.575017, 1, 1, 1, 1, 1,
1.588426, 1.224351, 0.02496028, 1, 1, 1, 1, 1,
1.597914, 0.8025413, 2.316181, 1, 1, 1, 1, 1,
1.59939, 0.8288946, 1.339799, 1, 1, 1, 1, 1,
1.615949, 0.4873781, 0.5286946, 1, 1, 1, 1, 1,
1.624346, 1.284869, 0.3456264, 1, 1, 1, 1, 1,
1.629898, -1.554442, 1.753804, 1, 1, 1, 1, 1,
1.634233, -0.8969974, 0.6242098, 1, 1, 1, 1, 1,
1.642165, 0.5204154, 0.08139869, 1, 1, 1, 1, 1,
1.672425, 1.445825, 1.587801, 1, 1, 1, 1, 1,
1.708832, 1.272207, 2.988582, 1, 1, 1, 1, 1,
1.716444, 0.8845179, 3.813141, 1, 1, 1, 1, 1,
1.722021, 1.029967, -0.5497126, 1, 1, 1, 1, 1,
1.723274, 3.073923, -0.4977072, 1, 1, 1, 1, 1,
1.732968, 0.4286397, 1.690784, 0, 0, 1, 1, 1,
1.733153, 0.4209481, 1.838889, 1, 0, 0, 1, 1,
1.778848, -0.8376225, 1.656588, 1, 0, 0, 1, 1,
1.783161, -0.9007083, 1.839289, 1, 0, 0, 1, 1,
1.801805, 1.349782, 1.013312, 1, 0, 0, 1, 1,
1.805786, -0.1321854, 1.5797, 1, 0, 0, 1, 1,
1.837199, 0.2723324, 2.677917, 0, 0, 0, 1, 1,
1.849641, -1.768662, 3.159079, 0, 0, 0, 1, 1,
1.864198, 0.2792205, 1.090371, 0, 0, 0, 1, 1,
1.866562, -0.504083, 3.066976, 0, 0, 0, 1, 1,
1.867218, -0.115444, 1.385783, 0, 0, 0, 1, 1,
1.868017, 1.404091, -1.036463, 0, 0, 0, 1, 1,
1.870778, 0.1492445, 3.167433, 0, 0, 0, 1, 1,
1.886304, 0.9499192, 1.237923, 1, 1, 1, 1, 1,
1.896301, 0.8641738, -0.04586037, 1, 1, 1, 1, 1,
1.905547, 0.481423, 1.383709, 1, 1, 1, 1, 1,
1.909324, -1.690817, 2.4626, 1, 1, 1, 1, 1,
1.912347, 1.27125, 1.065044, 1, 1, 1, 1, 1,
1.936086, -0.337698, 0.8199819, 1, 1, 1, 1, 1,
1.961659, -0.7317913, 0.7313914, 1, 1, 1, 1, 1,
1.971383, -0.3842616, 0.5488293, 1, 1, 1, 1, 1,
1.982529, -0.7770408, 1.697627, 1, 1, 1, 1, 1,
1.989177, 0.1842969, 2.087961, 1, 1, 1, 1, 1,
1.99109, -0.6109025, 1.705639, 1, 1, 1, 1, 1,
1.999853, -0.07061264, 0.5195654, 1, 1, 1, 1, 1,
2.010505, 0.02688491, 3.702808, 1, 1, 1, 1, 1,
2.049748, -0.01869581, 0.4913329, 1, 1, 1, 1, 1,
2.051658, 1.112103, 1.060813, 1, 1, 1, 1, 1,
2.071488, -0.113648, 2.24553, 0, 0, 1, 1, 1,
2.124309, -1.909697, 2.806219, 1, 0, 0, 1, 1,
2.180174, 1.455138, 1.670203, 1, 0, 0, 1, 1,
2.235866, 0.3452016, 2.31255, 1, 0, 0, 1, 1,
2.238977, 0.2121793, 0.9647552, 1, 0, 0, 1, 1,
2.253136, -0.9949642, 1.708261, 1, 0, 0, 1, 1,
2.256418, 0.9881027, 1.266985, 0, 0, 0, 1, 1,
2.280534, -0.6223989, 0.3361256, 0, 0, 0, 1, 1,
2.285228, -0.4659602, 0.9105507, 0, 0, 0, 1, 1,
2.343781, 1.429893, 1.893552, 0, 0, 0, 1, 1,
2.358753, 1.081821, 0.9580717, 0, 0, 0, 1, 1,
2.414728, -0.4763923, 1.747507, 0, 0, 0, 1, 1,
2.422954, -0.6857792, 2.171674, 0, 0, 0, 1, 1,
2.452198, -0.2888914, 3.236598, 1, 1, 1, 1, 1,
2.455204, -0.456759, -0.3298936, 1, 1, 1, 1, 1,
2.515768, 0.1393462, 1.650949, 1, 1, 1, 1, 1,
2.519648, 0.8950635, 1.03811, 1, 1, 1, 1, 1,
2.594952, 0.2509393, 0.4929894, 1, 1, 1, 1, 1,
2.618381, -0.04563414, 1.860251, 1, 1, 1, 1, 1,
3.542236, 1.133713, 2.026256, 1, 1, 1, 1, 1
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
var radius = 9.625857;
var distance = 33.81041;
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
mvMatrix.translate( -0.1108403, 0.0358882, 0.5096521 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.81041);
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
