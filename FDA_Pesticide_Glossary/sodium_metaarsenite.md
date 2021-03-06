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
-3.204221, 0.7516887, -2.756901, 1, 0, 0, 1,
-2.933459, 2.301852, -1.873119, 1, 0.007843138, 0, 1,
-2.845765, 0.4626743, -1.544052, 1, 0.01176471, 0, 1,
-2.65498, -0.09835061, -1.241569, 1, 0.01960784, 0, 1,
-2.386792, -0.7439594, -1.741052, 1, 0.02352941, 0, 1,
-2.32887, 0.6392376, -2.107584, 1, 0.03137255, 0, 1,
-2.319759, -0.2707551, -2.830634, 1, 0.03529412, 0, 1,
-2.30907, 0.1875365, -0.9728925, 1, 0.04313726, 0, 1,
-2.255789, -0.5620502, -2.967649, 1, 0.04705882, 0, 1,
-2.254059, 0.9097285, -1.421094, 1, 0.05490196, 0, 1,
-2.246966, 0.8189241, -0.5276176, 1, 0.05882353, 0, 1,
-2.246157, -0.7062397, -2.456044, 1, 0.06666667, 0, 1,
-2.238166, 0.214616, -2.319546, 1, 0.07058824, 0, 1,
-2.221452, -0.5110057, -1.518336, 1, 0.07843138, 0, 1,
-2.206148, 1.794594, 0.6043907, 1, 0.08235294, 0, 1,
-2.147983, -0.8229021, -1.421327, 1, 0.09019608, 0, 1,
-2.105468, -1.425203, -3.212817, 1, 0.09411765, 0, 1,
-2.104054, -1.373908, -3.056292, 1, 0.1019608, 0, 1,
-2.072193, -0.6540089, 0.5814928, 1, 0.1098039, 0, 1,
-2.070371, -0.8053729, -3.400753, 1, 0.1137255, 0, 1,
-2.027017, 1.010237, -0.1980108, 1, 0.1215686, 0, 1,
-1.976994, 0.7166802, -1.71819, 1, 0.1254902, 0, 1,
-1.97577, -1.417175, -3.31707, 1, 0.1333333, 0, 1,
-1.974112, -0.6249508, -1.961089, 1, 0.1372549, 0, 1,
-1.958475, -0.1930098, -1.86742, 1, 0.145098, 0, 1,
-1.946233, -0.3987568, -0.1250372, 1, 0.1490196, 0, 1,
-1.922943, -0.9777071, -1.813023, 1, 0.1568628, 0, 1,
-1.916775, -2.253946, -2.131238, 1, 0.1607843, 0, 1,
-1.906202, -1.258965, -2.510131, 1, 0.1686275, 0, 1,
-1.898043, 0.3490674, -1.767569, 1, 0.172549, 0, 1,
-1.837013, 1.671197, 0.5657381, 1, 0.1803922, 0, 1,
-1.822369, -0.05476679, -2.173025, 1, 0.1843137, 0, 1,
-1.819274, 0.4029627, -1.409085, 1, 0.1921569, 0, 1,
-1.795663, -1.076272, -1.096423, 1, 0.1960784, 0, 1,
-1.788835, 0.3183149, -2.263247, 1, 0.2039216, 0, 1,
-1.777455, -0.1929036, -0.8966653, 1, 0.2117647, 0, 1,
-1.774978, -0.130642, -1.233399, 1, 0.2156863, 0, 1,
-1.769673, 1.878016, 0.04378822, 1, 0.2235294, 0, 1,
-1.762848, -0.6323904, -3.252151, 1, 0.227451, 0, 1,
-1.744615, -0.6390761, -2.073522, 1, 0.2352941, 0, 1,
-1.733199, -0.5600715, -1.176105, 1, 0.2392157, 0, 1,
-1.718724, -1.005623, -3.33857, 1, 0.2470588, 0, 1,
-1.699966, -0.5528928, -2.355116, 1, 0.2509804, 0, 1,
-1.687571, 0.2521086, 1.609627, 1, 0.2588235, 0, 1,
-1.674365, -1.006819, -2.420097, 1, 0.2627451, 0, 1,
-1.661681, -0.3372235, -2.027869, 1, 0.2705882, 0, 1,
-1.660174, -0.4459561, -2.016897, 1, 0.2745098, 0, 1,
-1.654027, 0.3698899, -3.526302, 1, 0.282353, 0, 1,
-1.648284, -0.8448063, -2.050921, 1, 0.2862745, 0, 1,
-1.644486, -0.07152548, -0.5300174, 1, 0.2941177, 0, 1,
-1.633004, 0.1165612, -0.9105401, 1, 0.3019608, 0, 1,
-1.627632, -0.3208914, -1.534123, 1, 0.3058824, 0, 1,
-1.614155, 1.433626, -1.988092, 1, 0.3137255, 0, 1,
-1.610462, -1.314086, -2.610344, 1, 0.3176471, 0, 1,
-1.603895, 0.3011092, -1.617413, 1, 0.3254902, 0, 1,
-1.594516, -0.1132276, -2.036527, 1, 0.3294118, 0, 1,
-1.58822, -0.05146742, -2.936335, 1, 0.3372549, 0, 1,
-1.570329, -0.3514585, -1.356101, 1, 0.3411765, 0, 1,
-1.557904, 0.5977707, -0.9332804, 1, 0.3490196, 0, 1,
-1.554517, -1.269449, -1.913091, 1, 0.3529412, 0, 1,
-1.554063, 0.9126153, -1.046872, 1, 0.3607843, 0, 1,
-1.549383, 1.698484, -0.8388816, 1, 0.3647059, 0, 1,
-1.549104, 0.2104336, -0.180133, 1, 0.372549, 0, 1,
-1.547001, 0.8412849, 0.04841725, 1, 0.3764706, 0, 1,
-1.541741, -0.4745759, -0.7442349, 1, 0.3843137, 0, 1,
-1.539132, -0.05996577, -0.602917, 1, 0.3882353, 0, 1,
-1.538063, 0.8609385, -0.1310871, 1, 0.3960784, 0, 1,
-1.533673, 1.134501, -1.054947, 1, 0.4039216, 0, 1,
-1.526902, 0.6196591, 0.7695147, 1, 0.4078431, 0, 1,
-1.503065, 0.3953696, -3.926157, 1, 0.4156863, 0, 1,
-1.49046, -0.3895338, -1.376601, 1, 0.4196078, 0, 1,
-1.467907, 0.8906733, -1.616225, 1, 0.427451, 0, 1,
-1.467061, -0.6233576, -2.529004, 1, 0.4313726, 0, 1,
-1.451838, 0.08279146, -0.6457831, 1, 0.4392157, 0, 1,
-1.420803, -0.4978243, 0.2932281, 1, 0.4431373, 0, 1,
-1.419152, -1.245133, -2.501587, 1, 0.4509804, 0, 1,
-1.418405, 0.4323195, -1.436497, 1, 0.454902, 0, 1,
-1.412996, -0.686579, -1.692838, 1, 0.4627451, 0, 1,
-1.408966, -0.3946, -0.1182579, 1, 0.4666667, 0, 1,
-1.393492, -0.2484647, -0.005663704, 1, 0.4745098, 0, 1,
-1.384838, -0.04188449, 0.1207155, 1, 0.4784314, 0, 1,
-1.383647, -0.2258629, -2.141752, 1, 0.4862745, 0, 1,
-1.375782, 1.924565, -1.238425, 1, 0.4901961, 0, 1,
-1.375638, 1.452071, -1.486946, 1, 0.4980392, 0, 1,
-1.374313, -0.3771424, -2.240721, 1, 0.5058824, 0, 1,
-1.364373, -1.262825, -1.946713, 1, 0.509804, 0, 1,
-1.3619, 0.6666291, 0.995689, 1, 0.5176471, 0, 1,
-1.346045, 0.11616, -0.416637, 1, 0.5215687, 0, 1,
-1.343111, -1.233527, -4.042956, 1, 0.5294118, 0, 1,
-1.341967, 1.725724, 0.7050843, 1, 0.5333334, 0, 1,
-1.340583, 2.739738, 1.116201, 1, 0.5411765, 0, 1,
-1.33889, -0.1775874, -1.020107, 1, 0.5450981, 0, 1,
-1.306804, 0.9984123, -1.101633, 1, 0.5529412, 0, 1,
-1.294536, 0.2302743, -2.231517, 1, 0.5568628, 0, 1,
-1.293139, 1.064401, -0.6151914, 1, 0.5647059, 0, 1,
-1.291441, 2.1411, -1.617646, 1, 0.5686275, 0, 1,
-1.264122, 1.047582, -0.6774262, 1, 0.5764706, 0, 1,
-1.261529, 2.782795, -0.879302, 1, 0.5803922, 0, 1,
-1.251729, -0.1245478, -1.245789, 1, 0.5882353, 0, 1,
-1.248259, -0.08017358, 0.4769866, 1, 0.5921569, 0, 1,
-1.240887, 1.049631, -1.520154, 1, 0.6, 0, 1,
-1.238425, 0.187914, -1.231591, 1, 0.6078432, 0, 1,
-1.236023, 0.03061466, -0.7914643, 1, 0.6117647, 0, 1,
-1.233024, -0.3166088, -2.719989, 1, 0.6196079, 0, 1,
-1.231216, -2.076022, -3.4357, 1, 0.6235294, 0, 1,
-1.226314, 0.7823271, -0.7252656, 1, 0.6313726, 0, 1,
-1.222131, -0.6821911, -3.621492, 1, 0.6352941, 0, 1,
-1.220341, 0.5479601, -1.949716, 1, 0.6431373, 0, 1,
-1.219971, 1.270389, -1.317613, 1, 0.6470588, 0, 1,
-1.219366, 0.5001932, 0.1783243, 1, 0.654902, 0, 1,
-1.218716, 1.229201, -2.470078, 1, 0.6588235, 0, 1,
-1.218059, 0.4536987, -0.5021461, 1, 0.6666667, 0, 1,
-1.216919, -0.2941813, -2.261836, 1, 0.6705883, 0, 1,
-1.21392, -0.1890038, 0.572549, 1, 0.6784314, 0, 1,
-1.206986, 0.9080067, -2.021801, 1, 0.682353, 0, 1,
-1.206887, 0.03180327, -2.040722, 1, 0.6901961, 0, 1,
-1.204775, -0.5350873, -0.7061452, 1, 0.6941177, 0, 1,
-1.203734, 1.139265, -1.38318, 1, 0.7019608, 0, 1,
-1.19948, 0.2193006, -2.009231, 1, 0.7098039, 0, 1,
-1.191583, -0.03889184, -1.572612, 1, 0.7137255, 0, 1,
-1.186869, 0.01676073, 1.112615, 1, 0.7215686, 0, 1,
-1.185392, 0.2023473, -1.310759, 1, 0.7254902, 0, 1,
-1.182922, 2.06076, 0.7863722, 1, 0.7333333, 0, 1,
-1.178853, -1.916985, -2.970676, 1, 0.7372549, 0, 1,
-1.178476, 0.3460683, -1.024961, 1, 0.7450981, 0, 1,
-1.156029, -1.351732, -2.430209, 1, 0.7490196, 0, 1,
-1.154735, 0.2578875, -2.144363, 1, 0.7568628, 0, 1,
-1.151209, -0.6463875, -1.323493, 1, 0.7607843, 0, 1,
-1.150327, 1.30885, 1.0194, 1, 0.7686275, 0, 1,
-1.149158, 0.1598589, -1.488701, 1, 0.772549, 0, 1,
-1.141186, -1.361371, -2.329707, 1, 0.7803922, 0, 1,
-1.13596, -1.685973, -1.414554, 1, 0.7843137, 0, 1,
-1.133348, -0.3589797, -1.081293, 1, 0.7921569, 0, 1,
-1.125778, -0.2758945, -1.233664, 1, 0.7960784, 0, 1,
-1.125397, 0.04807881, -1.550953, 1, 0.8039216, 0, 1,
-1.124487, 0.2378604, -0.2546399, 1, 0.8117647, 0, 1,
-1.117889, -2.09852, -2.897311, 1, 0.8156863, 0, 1,
-1.108073, -0.3314055, -2.950431, 1, 0.8235294, 0, 1,
-1.106448, -0.5797113, -0.6862612, 1, 0.827451, 0, 1,
-1.100445, -0.85186, -2.155472, 1, 0.8352941, 0, 1,
-1.099517, 0.6233286, -0.06271327, 1, 0.8392157, 0, 1,
-1.090265, 1.643687, -0.7800195, 1, 0.8470588, 0, 1,
-1.085753, 0.7255976, -1.526963, 1, 0.8509804, 0, 1,
-1.080503, 1.911182, 1.256779, 1, 0.8588235, 0, 1,
-1.074813, 1.738812, -1.465304, 1, 0.8627451, 0, 1,
-1.074506, -0.6578254, -1.532728, 1, 0.8705882, 0, 1,
-1.072905, 0.4652837, 1.161406, 1, 0.8745098, 0, 1,
-1.06897, -1.092597, -1.707741, 1, 0.8823529, 0, 1,
-1.057332, 0.1139673, -2.521199, 1, 0.8862745, 0, 1,
-1.052326, -0.7004069, -0.7958277, 1, 0.8941177, 0, 1,
-1.04933, 0.5791589, -0.298542, 1, 0.8980392, 0, 1,
-1.046225, 0.03265032, -2.013602, 1, 0.9058824, 0, 1,
-1.039839, 0.2654989, -0.9956762, 1, 0.9137255, 0, 1,
-1.007106, -0.4426921, -0.7685439, 1, 0.9176471, 0, 1,
-1.006682, 0.8003048, -1.393702, 1, 0.9254902, 0, 1,
-1.004352, 0.852233, -1.074033, 1, 0.9294118, 0, 1,
-0.9914274, -1.356881, -5.114019, 1, 0.9372549, 0, 1,
-0.9906963, -0.8167598, -3.930078, 1, 0.9411765, 0, 1,
-0.9873256, -1.075223, -0.9455372, 1, 0.9490196, 0, 1,
-0.9865864, -1.306855, -1.728362, 1, 0.9529412, 0, 1,
-0.9795867, -0.304298, -3.505705, 1, 0.9607843, 0, 1,
-0.9676264, -0.8261725, -2.766455, 1, 0.9647059, 0, 1,
-0.9614697, 0.4921079, -1.202152, 1, 0.972549, 0, 1,
-0.9545771, 0.03117678, -0.5728904, 1, 0.9764706, 0, 1,
-0.943776, -1.120973, -2.708413, 1, 0.9843137, 0, 1,
-0.9385371, 0.2447993, -1.591208, 1, 0.9882353, 0, 1,
-0.9378861, 0.3370641, -0.9240115, 1, 0.9960784, 0, 1,
-0.9375737, 0.1488119, 0.6486862, 0.9960784, 1, 0, 1,
-0.9354662, -0.3126279, -1.105331, 0.9921569, 1, 0, 1,
-0.9313974, 0.3170362, -1.50661, 0.9843137, 1, 0, 1,
-0.9306256, 1.525996, -2.338608, 0.9803922, 1, 0, 1,
-0.9233535, -0.8044761, -1.60529, 0.972549, 1, 0, 1,
-0.9217775, 0.7087308, -0.601425, 0.9686275, 1, 0, 1,
-0.9178762, -0.4458478, -2.421476, 0.9607843, 1, 0, 1,
-0.9169632, -0.002078006, -2.675059, 0.9568627, 1, 0, 1,
-0.9150276, 1.167416, -1.814982, 0.9490196, 1, 0, 1,
-0.8986664, -0.6376749, -2.195861, 0.945098, 1, 0, 1,
-0.8967949, -0.88067, -1.946394, 0.9372549, 1, 0, 1,
-0.8937613, 0.5343197, 0.119311, 0.9333333, 1, 0, 1,
-0.8924868, 0.2920243, -2.281464, 0.9254902, 1, 0, 1,
-0.8851536, -0.3067344, -2.987557, 0.9215686, 1, 0, 1,
-0.8798713, -3.676924, -4.70788, 0.9137255, 1, 0, 1,
-0.8775424, 0.6618182, -0.6862078, 0.9098039, 1, 0, 1,
-0.8741044, -0.6938055, -2.493684, 0.9019608, 1, 0, 1,
-0.8640751, -0.154062, -0.2689885, 0.8941177, 1, 0, 1,
-0.8497829, -2.284619, -3.033942, 0.8901961, 1, 0, 1,
-0.8453699, 1.410357, -0.5283236, 0.8823529, 1, 0, 1,
-0.8407232, -1.42799, -3.864976, 0.8784314, 1, 0, 1,
-0.8396298, 1.57271, 0.2326232, 0.8705882, 1, 0, 1,
-0.8389055, 0.2155376, -1.059421, 0.8666667, 1, 0, 1,
-0.8348277, -1.941877, -0.9569567, 0.8588235, 1, 0, 1,
-0.8311579, 1.403368, 1.080982, 0.854902, 1, 0, 1,
-0.8254298, -0.7875342, -3.711203, 0.8470588, 1, 0, 1,
-0.8238978, -0.3263164, -1.261885, 0.8431373, 1, 0, 1,
-0.8218489, 0.4163187, -0.7288053, 0.8352941, 1, 0, 1,
-0.8214096, 0.7153306, -0.5567238, 0.8313726, 1, 0, 1,
-0.8049206, 0.2674944, -3.241923, 0.8235294, 1, 0, 1,
-0.8048771, 1.855874, 0.09332068, 0.8196079, 1, 0, 1,
-0.8033479, 1.821991, -1.735472, 0.8117647, 1, 0, 1,
-0.8010847, 0.6169695, -1.160645, 0.8078431, 1, 0, 1,
-0.800135, -0.1667178, -0.5609354, 0.8, 1, 0, 1,
-0.7979651, 0.8523951, -0.476374, 0.7921569, 1, 0, 1,
-0.7933565, 0.1594547, -2.458935, 0.7882353, 1, 0, 1,
-0.7892461, -0.2102962, -1.967808, 0.7803922, 1, 0, 1,
-0.7861786, -0.8675246, -3.037011, 0.7764706, 1, 0, 1,
-0.7845085, 0.04008424, -1.694171, 0.7686275, 1, 0, 1,
-0.7816119, -0.154866, -1.675233, 0.7647059, 1, 0, 1,
-0.7799911, -0.09089993, 1.33262, 0.7568628, 1, 0, 1,
-0.7751995, -1.894487, -2.750964, 0.7529412, 1, 0, 1,
-0.7691225, -0.524867, -2.188352, 0.7450981, 1, 0, 1,
-0.7647555, 0.332113, -1.719067, 0.7411765, 1, 0, 1,
-0.7642325, -1.176299, -1.240184, 0.7333333, 1, 0, 1,
-0.762523, -0.05712141, -3.501747, 0.7294118, 1, 0, 1,
-0.7609607, 0.1277191, -2.52422, 0.7215686, 1, 0, 1,
-0.7594444, -0.3316222, -2.482246, 0.7176471, 1, 0, 1,
-0.7551367, 2.17862, -0.04824187, 0.7098039, 1, 0, 1,
-0.7518958, 1.781682, -0.9942173, 0.7058824, 1, 0, 1,
-0.7508796, 0.8358817, 0.1887498, 0.6980392, 1, 0, 1,
-0.750447, 0.5733995, -1.404384, 0.6901961, 1, 0, 1,
-0.7502171, -0.3570518, -1.526184, 0.6862745, 1, 0, 1,
-0.7414994, 0.7252263, -1.097707, 0.6784314, 1, 0, 1,
-0.7318037, 0.4709828, -1.333223, 0.6745098, 1, 0, 1,
-0.7283699, -1.999418, -2.957359, 0.6666667, 1, 0, 1,
-0.725046, 0.9195108, -1.609817, 0.6627451, 1, 0, 1,
-0.7248503, 0.9391087, -0.7911773, 0.654902, 1, 0, 1,
-0.7195236, 0.05394024, -0.06816392, 0.6509804, 1, 0, 1,
-0.7172953, 0.7369587, -0.1028991, 0.6431373, 1, 0, 1,
-0.713545, 0.3581187, -3.335337, 0.6392157, 1, 0, 1,
-0.7131585, -0.5865395, -1.547386, 0.6313726, 1, 0, 1,
-0.7130004, 1.057478, -0.6274821, 0.627451, 1, 0, 1,
-0.7124941, 0.6850975, -0.8180797, 0.6196079, 1, 0, 1,
-0.7124348, -0.9588162, -2.644554, 0.6156863, 1, 0, 1,
-0.7116264, 0.7787786, -0.8329965, 0.6078432, 1, 0, 1,
-0.7094932, -1.783539, -2.100423, 0.6039216, 1, 0, 1,
-0.7081203, -0.3494721, -3.56594, 0.5960785, 1, 0, 1,
-0.7066354, 1.589588, -2.642781, 0.5882353, 1, 0, 1,
-0.6968688, -0.8044266, -1.669997, 0.5843138, 1, 0, 1,
-0.6919864, -0.3112347, -1.373856, 0.5764706, 1, 0, 1,
-0.6900385, 1.914177, -0.6896467, 0.572549, 1, 0, 1,
-0.6869974, 0.8778465, -1.495474, 0.5647059, 1, 0, 1,
-0.6840295, -1.243853, -1.493, 0.5607843, 1, 0, 1,
-0.6831114, 0.4896078, -1.847245, 0.5529412, 1, 0, 1,
-0.6830721, 0.3968888, -0.9576777, 0.5490196, 1, 0, 1,
-0.6796222, -0.3152296, -3.113896, 0.5411765, 1, 0, 1,
-0.6792215, 0.8616878, -1.414161, 0.5372549, 1, 0, 1,
-0.6724201, 0.3540854, 1.510069, 0.5294118, 1, 0, 1,
-0.6720449, -0.7370796, -2.454233, 0.5254902, 1, 0, 1,
-0.6710207, -0.2373804, -2.848251, 0.5176471, 1, 0, 1,
-0.6693585, -2.247791, -4.836687, 0.5137255, 1, 0, 1,
-0.6662027, -1.383764, -2.705546, 0.5058824, 1, 0, 1,
-0.6610385, -0.5969105, -2.849348, 0.5019608, 1, 0, 1,
-0.6591909, -0.9030761, -3.620342, 0.4941176, 1, 0, 1,
-0.656925, -0.2165748, -1.473918, 0.4862745, 1, 0, 1,
-0.655753, -0.22655, -1.37485, 0.4823529, 1, 0, 1,
-0.6534545, 0.9285957, 0.6361539, 0.4745098, 1, 0, 1,
-0.6532223, -0.5649371, -1.390048, 0.4705882, 1, 0, 1,
-0.6481859, 1.606291, -0.1104585, 0.4627451, 1, 0, 1,
-0.6398288, -1.10767, -1.421607, 0.4588235, 1, 0, 1,
-0.6384528, 1.397686, -1.582974, 0.4509804, 1, 0, 1,
-0.6283602, -0.120659, -1.875126, 0.4470588, 1, 0, 1,
-0.6193351, -0.6363531, -1.633791, 0.4392157, 1, 0, 1,
-0.600208, 0.03127734, -1.100662, 0.4352941, 1, 0, 1,
-0.5961877, -1.094509, -2.820207, 0.427451, 1, 0, 1,
-0.5838189, 1.133601, -1.698574, 0.4235294, 1, 0, 1,
-0.5816931, -0.7068107, -3.189014, 0.4156863, 1, 0, 1,
-0.5807649, -0.05793658, -1.664961, 0.4117647, 1, 0, 1,
-0.5782132, 0.4491858, 0.4198095, 0.4039216, 1, 0, 1,
-0.5755052, -0.4746696, -2.133405, 0.3960784, 1, 0, 1,
-0.5712678, 1.310249, 2.050427, 0.3921569, 1, 0, 1,
-0.569873, 0.2992307, -2.592049, 0.3843137, 1, 0, 1,
-0.5693073, -1.745721, -3.189745, 0.3803922, 1, 0, 1,
-0.5692055, -1.232731, -2.523705, 0.372549, 1, 0, 1,
-0.5683991, 0.7075641, -0.4897941, 0.3686275, 1, 0, 1,
-0.567696, 0.5380924, -2.460647, 0.3607843, 1, 0, 1,
-0.5651104, -0.3418847, -1.347776, 0.3568628, 1, 0, 1,
-0.56473, 1.200049, -1.331486, 0.3490196, 1, 0, 1,
-0.5636681, 0.7451583, -1.889058, 0.345098, 1, 0, 1,
-0.5634815, -1.993593, -3.761641, 0.3372549, 1, 0, 1,
-0.5538214, -0.4520229, -0.8218132, 0.3333333, 1, 0, 1,
-0.5536095, -0.2269824, -2.26303, 0.3254902, 1, 0, 1,
-0.5517811, 0.5516591, -0.3154026, 0.3215686, 1, 0, 1,
-0.5497178, -0.4453077, -1.621065, 0.3137255, 1, 0, 1,
-0.5454957, 0.3691784, -1.171954, 0.3098039, 1, 0, 1,
-0.5352131, 0.3263295, -0.1893634, 0.3019608, 1, 0, 1,
-0.5293031, 0.6272623, -0.5818131, 0.2941177, 1, 0, 1,
-0.5241174, -0.310273, -3.426121, 0.2901961, 1, 0, 1,
-0.5218439, -1.533295, -6.404075, 0.282353, 1, 0, 1,
-0.5217891, -0.4140152, -1.4329, 0.2784314, 1, 0, 1,
-0.5153768, 1.754456, 1.659575, 0.2705882, 1, 0, 1,
-0.5124242, -0.5236449, -3.88417, 0.2666667, 1, 0, 1,
-0.510236, -0.5271103, -1.628033, 0.2588235, 1, 0, 1,
-0.5043268, 0.9522088, 0.1089535, 0.254902, 1, 0, 1,
-0.5005002, 0.07057839, -0.3763681, 0.2470588, 1, 0, 1,
-0.4997508, 1.132358, -0.2919591, 0.2431373, 1, 0, 1,
-0.4959516, -0.7216709, -1.571359, 0.2352941, 1, 0, 1,
-0.4917612, -1.055957, -2.700032, 0.2313726, 1, 0, 1,
-0.4917278, -1.268615, -3.027954, 0.2235294, 1, 0, 1,
-0.4867874, -0.2179988, -1.055057, 0.2196078, 1, 0, 1,
-0.4797714, -0.906154, -2.429384, 0.2117647, 1, 0, 1,
-0.4751664, 1.277767, -0.2459576, 0.2078431, 1, 0, 1,
-0.4675783, 0.3217612, 0.3502933, 0.2, 1, 0, 1,
-0.4668907, -0.07051832, -2.166747, 0.1921569, 1, 0, 1,
-0.4646791, -0.8700228, -3.109467, 0.1882353, 1, 0, 1,
-0.4628215, 0.1796256, -4.430146, 0.1803922, 1, 0, 1,
-0.4608033, 0.3155432, -1.29459, 0.1764706, 1, 0, 1,
-0.4595153, 0.1604186, -1.121845, 0.1686275, 1, 0, 1,
-0.4528763, -0.7241009, -3.033922, 0.1647059, 1, 0, 1,
-0.4516463, 1.16398, -0.5578133, 0.1568628, 1, 0, 1,
-0.4474003, 0.6201845, 0.8136127, 0.1529412, 1, 0, 1,
-0.4458309, -0.7203969, -1.649794, 0.145098, 1, 0, 1,
-0.4421582, -2.366927, -4.467044, 0.1411765, 1, 0, 1,
-0.4396667, -0.02480975, -1.876918, 0.1333333, 1, 0, 1,
-0.4386581, 0.6064922, 1.315351, 0.1294118, 1, 0, 1,
-0.4386332, 0.1650694, -1.781768, 0.1215686, 1, 0, 1,
-0.4363936, -0.1805686, -2.989739, 0.1176471, 1, 0, 1,
-0.4305699, -0.8814946, -3.655926, 0.1098039, 1, 0, 1,
-0.4302156, -1.232738, -2.373678, 0.1058824, 1, 0, 1,
-0.4286269, 0.9746951, -0.5119337, 0.09803922, 1, 0, 1,
-0.4272174, -0.8858436, -2.797024, 0.09019608, 1, 0, 1,
-0.4265033, 0.7398164, -1.169807, 0.08627451, 1, 0, 1,
-0.4174902, 1.545786, 0.7122961, 0.07843138, 1, 0, 1,
-0.4164103, -1.070618, -1.516735, 0.07450981, 1, 0, 1,
-0.4089936, 2.314734, 0.8702509, 0.06666667, 1, 0, 1,
-0.4051787, 1.213778, 0.01711586, 0.0627451, 1, 0, 1,
-0.3964313, 1.225754, 0.1705854, 0.05490196, 1, 0, 1,
-0.396096, -0.4160661, -2.859285, 0.05098039, 1, 0, 1,
-0.3956797, 0.9155181, -1.399334, 0.04313726, 1, 0, 1,
-0.3941092, 0.07102729, -1.124892, 0.03921569, 1, 0, 1,
-0.393969, -1.242415, -3.328013, 0.03137255, 1, 0, 1,
-0.393337, 2.007796, -0.2536313, 0.02745098, 1, 0, 1,
-0.3917776, 2.214785, 0.859334, 0.01960784, 1, 0, 1,
-0.3895539, -0.8928534, -2.465298, 0.01568628, 1, 0, 1,
-0.3890181, 0.8468941, 0.5259829, 0.007843138, 1, 0, 1,
-0.3766704, -0.9246088, -3.684286, 0.003921569, 1, 0, 1,
-0.37654, -0.9054028, -3.679667, 0, 1, 0.003921569, 1,
-0.3745475, -0.5633413, -1.34637, 0, 1, 0.01176471, 1,
-0.374535, -0.4919689, -4.240433, 0, 1, 0.01568628, 1,
-0.3735199, 1.874035, 0.1892889, 0, 1, 0.02352941, 1,
-0.371939, -0.2885422, -2.51808, 0, 1, 0.02745098, 1,
-0.3715003, 0.02036476, -2.148233, 0, 1, 0.03529412, 1,
-0.3705459, 0.5414046, 0.08394841, 0, 1, 0.03921569, 1,
-0.3674346, -0.04984948, -1.801774, 0, 1, 0.04705882, 1,
-0.3567459, 0.3804519, 0.0357983, 0, 1, 0.05098039, 1,
-0.3488289, -0.03198459, -3.634359, 0, 1, 0.05882353, 1,
-0.3478211, -1.214878, -3.278475, 0, 1, 0.0627451, 1,
-0.3476932, 0.1528293, -1.038973, 0, 1, 0.07058824, 1,
-0.3463114, 0.07320584, 0.08992627, 0, 1, 0.07450981, 1,
-0.3409077, -0.3314268, -3.997704, 0, 1, 0.08235294, 1,
-0.3394482, -2.147229, -3.316984, 0, 1, 0.08627451, 1,
-0.3332578, -0.6236906, -1.977788, 0, 1, 0.09411765, 1,
-0.3307946, -0.1144171, -3.794958, 0, 1, 0.1019608, 1,
-0.3275691, 1.70099, -1.40318, 0, 1, 0.1058824, 1,
-0.326871, -0.4565768, -4.424754, 0, 1, 0.1137255, 1,
-0.325106, -2.385149, -1.015812, 0, 1, 0.1176471, 1,
-0.3228133, -0.1607152, -1.818498, 0, 1, 0.1254902, 1,
-0.322559, 0.4856902, 0.4818208, 0, 1, 0.1294118, 1,
-0.3215471, -1.006612, -0.5118597, 0, 1, 0.1372549, 1,
-0.3200051, -2.090618, -3.820215, 0, 1, 0.1411765, 1,
-0.317694, -0.1475738, -1.408489, 0, 1, 0.1490196, 1,
-0.3166823, -1.636136, -3.511215, 0, 1, 0.1529412, 1,
-0.3135116, -0.529027, -3.829597, 0, 1, 0.1607843, 1,
-0.3080924, 1.93837, 0.1097329, 0, 1, 0.1647059, 1,
-0.3071783, 0.9684119, 1.122484, 0, 1, 0.172549, 1,
-0.3049161, -0.4904759, -3.305136, 0, 1, 0.1764706, 1,
-0.3033256, 1.321469, 0.3162687, 0, 1, 0.1843137, 1,
-0.3001447, -1.826216, -2.455957, 0, 1, 0.1882353, 1,
-0.2970086, -0.789876, -3.113597, 0, 1, 0.1960784, 1,
-0.2924518, 0.9562975, 1.00979, 0, 1, 0.2039216, 1,
-0.2870222, 0.3226314, -1.00109, 0, 1, 0.2078431, 1,
-0.284813, 1.652679, -0.7886027, 0, 1, 0.2156863, 1,
-0.28435, 0.4049164, -0.5035858, 0, 1, 0.2196078, 1,
-0.2750705, -0.7406009, -2.947877, 0, 1, 0.227451, 1,
-0.2737359, -0.08683537, -2.084401, 0, 1, 0.2313726, 1,
-0.2707653, 0.2364366, 0.7839462, 0, 1, 0.2392157, 1,
-0.2677891, -0.04076036, -2.30651, 0, 1, 0.2431373, 1,
-0.2665593, 1.558833, 0.476418, 0, 1, 0.2509804, 1,
-0.2639836, -1.851646, -1.909555, 0, 1, 0.254902, 1,
-0.2611755, -0.5768006, -3.609724, 0, 1, 0.2627451, 1,
-0.2575012, -0.07206722, -2.271523, 0, 1, 0.2666667, 1,
-0.2574371, 0.5798219, -1.586027, 0, 1, 0.2745098, 1,
-0.2557035, 1.529067, -1.197753, 0, 1, 0.2784314, 1,
-0.2519081, 1.099878, 0.1319627, 0, 1, 0.2862745, 1,
-0.2502556, 0.1587246, -1.367073, 0, 1, 0.2901961, 1,
-0.2496573, -1.041269, -2.380305, 0, 1, 0.2980392, 1,
-0.246347, 2.114898, -0.9391571, 0, 1, 0.3058824, 1,
-0.245424, -2.257928, -3.070858, 0, 1, 0.3098039, 1,
-0.2408451, -0.7175649, -1.240172, 0, 1, 0.3176471, 1,
-0.2380992, 1.666654, -0.4469515, 0, 1, 0.3215686, 1,
-0.2376924, -1.353053, -2.980658, 0, 1, 0.3294118, 1,
-0.227731, -0.03205933, -0.2946285, 0, 1, 0.3333333, 1,
-0.2273223, -0.3900222, -3.630909, 0, 1, 0.3411765, 1,
-0.2208966, -0.0182935, -2.118082, 0, 1, 0.345098, 1,
-0.220654, -0.3182865, -2.53312, 0, 1, 0.3529412, 1,
-0.217661, 1.36503, 0.8037605, 0, 1, 0.3568628, 1,
-0.2128803, -0.3954163, -2.341563, 0, 1, 0.3647059, 1,
-0.2078827, -1.612978, -3.622553, 0, 1, 0.3686275, 1,
-0.2074685, -0.775551, -3.785481, 0, 1, 0.3764706, 1,
-0.2067164, 1.342261, 0.772974, 0, 1, 0.3803922, 1,
-0.2054163, -1.2469, -2.48021, 0, 1, 0.3882353, 1,
-0.2052188, 1.642909, 0.0570905, 0, 1, 0.3921569, 1,
-0.2012492, 0.3076459, -0.1854798, 0, 1, 0.4, 1,
-0.1981436, 0.5671546, -1.093314, 0, 1, 0.4078431, 1,
-0.1960125, 0.8447596, -1.646219, 0, 1, 0.4117647, 1,
-0.19527, -0.009527314, -1.608714, 0, 1, 0.4196078, 1,
-0.194881, 0.1710514, 0.1459208, 0, 1, 0.4235294, 1,
-0.189677, 1.763898, -0.8261158, 0, 1, 0.4313726, 1,
-0.1874125, 0.06745677, -1.08753, 0, 1, 0.4352941, 1,
-0.1844093, 0.1619734, -2.522092, 0, 1, 0.4431373, 1,
-0.180061, -0.005674483, -2.765599, 0, 1, 0.4470588, 1,
-0.1747317, -0.09772509, -1.23152, 0, 1, 0.454902, 1,
-0.1743132, 1.537816, -1.276164, 0, 1, 0.4588235, 1,
-0.170379, -1.060253, -1.838108, 0, 1, 0.4666667, 1,
-0.1639253, 0.4852512, -0.9191715, 0, 1, 0.4705882, 1,
-0.160466, -1.055185, -4.042864, 0, 1, 0.4784314, 1,
-0.1597108, -0.2484064, -2.102677, 0, 1, 0.4823529, 1,
-0.1578134, 0.9979714, 0.4437766, 0, 1, 0.4901961, 1,
-0.1537883, 0.8030323, -0.03396125, 0, 1, 0.4941176, 1,
-0.1517568, -0.4270358, -1.610532, 0, 1, 0.5019608, 1,
-0.1513378, -0.4380556, -4.05221, 0, 1, 0.509804, 1,
-0.1496156, -1.484576, -2.340781, 0, 1, 0.5137255, 1,
-0.1470808, 0.2348874, -0.01805315, 0, 1, 0.5215687, 1,
-0.1456853, -0.878919, -3.262307, 0, 1, 0.5254902, 1,
-0.1456622, 0.1848817, -1.870794, 0, 1, 0.5333334, 1,
-0.1404227, -1.218851, -2.473203, 0, 1, 0.5372549, 1,
-0.1395804, 0.4026295, -0.5299324, 0, 1, 0.5450981, 1,
-0.1395132, -0.2032213, -2.553673, 0, 1, 0.5490196, 1,
-0.1324992, -1.408149, -2.402039, 0, 1, 0.5568628, 1,
-0.1323037, -0.7289728, -2.087115, 0, 1, 0.5607843, 1,
-0.1318352, -1.466356, -3.077423, 0, 1, 0.5686275, 1,
-0.1314293, -1.153815, -1.585091, 0, 1, 0.572549, 1,
-0.129339, 1.83689, -1.04479, 0, 1, 0.5803922, 1,
-0.1275605, 0.3143505, -1.657117, 0, 1, 0.5843138, 1,
-0.1232986, -0.1880469, -2.797541, 0, 1, 0.5921569, 1,
-0.1228902, -0.2351175, -4.346717, 0, 1, 0.5960785, 1,
-0.1212312, -1.033479, -1.695629, 0, 1, 0.6039216, 1,
-0.1204922, 0.1384001, -0.3038943, 0, 1, 0.6117647, 1,
-0.1181527, 0.8307236, 0.4753125, 0, 1, 0.6156863, 1,
-0.1181514, 0.2600383, -0.4785811, 0, 1, 0.6235294, 1,
-0.1181035, 0.5089161, -1.897501, 0, 1, 0.627451, 1,
-0.1169058, 0.6993532, -1.71144, 0, 1, 0.6352941, 1,
-0.1152294, 0.6735436, -1.012149, 0, 1, 0.6392157, 1,
-0.1123702, 0.4164556, 0.0003068153, 0, 1, 0.6470588, 1,
-0.1083705, 0.4190671, 0.3336303, 0, 1, 0.6509804, 1,
-0.1064559, -0.2699492, -4.318974, 0, 1, 0.6588235, 1,
-0.1050014, -0.6021492, -2.504972, 0, 1, 0.6627451, 1,
-0.09892359, -0.9775037, -2.341499, 0, 1, 0.6705883, 1,
-0.09743709, 0.04619587, -1.22997, 0, 1, 0.6745098, 1,
-0.09661336, -0.8182451, -1.655047, 0, 1, 0.682353, 1,
-0.09621979, -0.3314769, -1.99706, 0, 1, 0.6862745, 1,
-0.09503693, 0.6675054, -0.6456873, 0, 1, 0.6941177, 1,
-0.09334821, 0.2756178, -0.5261856, 0, 1, 0.7019608, 1,
-0.09273592, 1.605243, -1.094073, 0, 1, 0.7058824, 1,
-0.0882317, 0.4564426, 0.0560094, 0, 1, 0.7137255, 1,
-0.08760852, -0.2781177, -4.482578, 0, 1, 0.7176471, 1,
-0.07229614, -0.08692944, 0.1143975, 0, 1, 0.7254902, 1,
-0.07219982, -1.149443, -3.379922, 0, 1, 0.7294118, 1,
-0.07054694, -0.2836064, -2.635686, 0, 1, 0.7372549, 1,
-0.06805258, 1.030229, -0.4105888, 0, 1, 0.7411765, 1,
-0.06682522, 0.8452205, 0.6301523, 0, 1, 0.7490196, 1,
-0.06462744, -0.1652146, -3.726279, 0, 1, 0.7529412, 1,
-0.06417432, -0.7926511, -1.014654, 0, 1, 0.7607843, 1,
-0.05684865, 0.1301973, -1.54214, 0, 1, 0.7647059, 1,
-0.05668034, -0.872328, -4.339299, 0, 1, 0.772549, 1,
-0.05577041, -2.807607, -3.596976, 0, 1, 0.7764706, 1,
-0.05445444, -1.07332, -3.934597, 0, 1, 0.7843137, 1,
-0.05366443, 0.6022013, 0.7158287, 0, 1, 0.7882353, 1,
-0.05146972, 0.44716, 0.7667632, 0, 1, 0.7960784, 1,
-0.051372, -1.468747, -2.714087, 0, 1, 0.8039216, 1,
-0.04978881, 1.338667, -0.8750563, 0, 1, 0.8078431, 1,
-0.04953692, -1.943664, -4.781919, 0, 1, 0.8156863, 1,
-0.04676257, 0.1997212, 0.06026362, 0, 1, 0.8196079, 1,
-0.04560756, 0.9817293, 0.7587376, 0, 1, 0.827451, 1,
-0.04521586, 0.3198297, 1.108695, 0, 1, 0.8313726, 1,
-0.04411156, -1.931056, -4.258946, 0, 1, 0.8392157, 1,
-0.03910615, 1.147266, 2.600112, 0, 1, 0.8431373, 1,
-0.03879824, -0.2332005, -4.199864, 0, 1, 0.8509804, 1,
-0.03797241, -0.3055976, -3.633286, 0, 1, 0.854902, 1,
-0.03792547, -0.7878556, -3.10995, 0, 1, 0.8627451, 1,
-0.03611011, 0.09670965, -0.4567787, 0, 1, 0.8666667, 1,
-0.02725555, -0.7876123, -3.880843, 0, 1, 0.8745098, 1,
-0.024256, -0.8371792, -2.066515, 0, 1, 0.8784314, 1,
-0.02153541, -0.4318246, -2.638951, 0, 1, 0.8862745, 1,
-0.0139359, -0.9445325, -5.580059, 0, 1, 0.8901961, 1,
-0.01092424, -0.5038896, -1.536895, 0, 1, 0.8980392, 1,
-0.01008677, 0.4709947, 0.8382066, 0, 1, 0.9058824, 1,
-0.00934488, -0.7675155, -2.424513, 0, 1, 0.9098039, 1,
-0.006732382, -1.144289, -2.011689, 0, 1, 0.9176471, 1,
-0.004650589, 0.9062089, 0.2161469, 0, 1, 0.9215686, 1,
-0.004428513, -0.5309861, -2.631639, 0, 1, 0.9294118, 1,
-0.0007044275, 0.3215428, -0.4148417, 0, 1, 0.9333333, 1,
-5.727735e-05, 0.1869453, 0.8395718, 0, 1, 0.9411765, 1,
0.002750353, 0.3573179, -0.7290498, 0, 1, 0.945098, 1,
0.00512365, 0.1564037, -0.2601126, 0, 1, 0.9529412, 1,
0.005629679, 0.733036, 0.8656224, 0, 1, 0.9568627, 1,
0.007309507, 0.7379564, -0.09903518, 0, 1, 0.9647059, 1,
0.007409689, -1.440995, 3.790491, 0, 1, 0.9686275, 1,
0.01405733, 1.770297, 0.08834421, 0, 1, 0.9764706, 1,
0.01596331, 1.155517, 0.4974857, 0, 1, 0.9803922, 1,
0.01633056, 1.954188, -0.695735, 0, 1, 0.9882353, 1,
0.01769801, 0.6752343, 1.32397, 0, 1, 0.9921569, 1,
0.0178325, -0.8861171, 4.998752, 0, 1, 1, 1,
0.02324836, -0.4756922, 2.7523, 0, 0.9921569, 1, 1,
0.02372724, -0.5822827, 3.001963, 0, 0.9882353, 1, 1,
0.02430834, -0.2473146, 4.430868, 0, 0.9803922, 1, 1,
0.02471683, 0.6512658, 1.474561, 0, 0.9764706, 1, 1,
0.03013602, 0.7445325, 1.931659, 0, 0.9686275, 1, 1,
0.03089929, 0.7394373, 1.534213, 0, 0.9647059, 1, 1,
0.03540593, 0.4680952, 0.9681925, 0, 0.9568627, 1, 1,
0.0376046, -1.480122, 3.090126, 0, 0.9529412, 1, 1,
0.03821673, 0.4312933, -1.411262, 0, 0.945098, 1, 1,
0.03829023, -0.4024421, 2.493894, 0, 0.9411765, 1, 1,
0.0384648, 1.576972, 0.1073127, 0, 0.9333333, 1, 1,
0.04640157, 0.1560547, 0.03276001, 0, 0.9294118, 1, 1,
0.05144366, 3.32394, 0.4967168, 0, 0.9215686, 1, 1,
0.05348316, -0.7552318, 3.555479, 0, 0.9176471, 1, 1,
0.05470858, -0.1750349, 3.859562, 0, 0.9098039, 1, 1,
0.05476418, 0.3776706, 1.886693, 0, 0.9058824, 1, 1,
0.0574406, -2.733372, 4.78859, 0, 0.8980392, 1, 1,
0.06149323, -0.1232108, 1.796856, 0, 0.8901961, 1, 1,
0.06262449, 0.9155765, -0.6320302, 0, 0.8862745, 1, 1,
0.06829794, 0.4889611, 0.5349644, 0, 0.8784314, 1, 1,
0.0684732, 0.4364274, 0.1973453, 0, 0.8745098, 1, 1,
0.06955609, -1.060468, 3.523535, 0, 0.8666667, 1, 1,
0.06979786, -0.3254845, 3.302587, 0, 0.8627451, 1, 1,
0.07337619, -0.4989669, 2.735476, 0, 0.854902, 1, 1,
0.07395013, -0.2885914, 1.984316, 0, 0.8509804, 1, 1,
0.0757084, 1.173629, -0.9430238, 0, 0.8431373, 1, 1,
0.07926638, -0.4331961, 2.280947, 0, 0.8392157, 1, 1,
0.07991104, -1.241798, 1.438897, 0, 0.8313726, 1, 1,
0.08379413, -0.4230268, 2.939349, 0, 0.827451, 1, 1,
0.08475394, -0.7216603, 2.862687, 0, 0.8196079, 1, 1,
0.08585628, 0.1606342, 0.03866949, 0, 0.8156863, 1, 1,
0.09012438, -0.1979893, 2.981159, 0, 0.8078431, 1, 1,
0.0976484, 0.6562939, -0.4291584, 0, 0.8039216, 1, 1,
0.09982068, 0.4160512, 0.04615027, 0, 0.7960784, 1, 1,
0.1018564, -0.7380767, 2.746912, 0, 0.7882353, 1, 1,
0.1042347, -1.887762, 2.642586, 0, 0.7843137, 1, 1,
0.1044996, -1.001655, 3.598266, 0, 0.7764706, 1, 1,
0.1054569, -1.017781, 5.190762, 0, 0.772549, 1, 1,
0.1072487, 0.5546296, 0.649174, 0, 0.7647059, 1, 1,
0.1082029, 0.6495531, -0.04958015, 0, 0.7607843, 1, 1,
0.1113489, 1.522141, -0.7591714, 0, 0.7529412, 1, 1,
0.1135288, -0.9971877, 2.08719, 0, 0.7490196, 1, 1,
0.1164138, 0.3183808, -0.8556172, 0, 0.7411765, 1, 1,
0.1195257, -1.519569, 1.660427, 0, 0.7372549, 1, 1,
0.1221548, 0.7100462, -1.2859, 0, 0.7294118, 1, 1,
0.1319913, -0.1644465, 2.052288, 0, 0.7254902, 1, 1,
0.1322613, 0.932472, 0.1272252, 0, 0.7176471, 1, 1,
0.1337784, 0.282887, 0.3420771, 0, 0.7137255, 1, 1,
0.1367836, -1.29882, 3.756485, 0, 0.7058824, 1, 1,
0.1381785, -0.6207203, 2.887132, 0, 0.6980392, 1, 1,
0.1385492, -0.881009, 2.649865, 0, 0.6941177, 1, 1,
0.1416528, 0.4085415, 2.145849, 0, 0.6862745, 1, 1,
0.1520831, 1.624938, -0.2201243, 0, 0.682353, 1, 1,
0.1521085, 1.249603, 0.4877407, 0, 0.6745098, 1, 1,
0.1560755, 1.122428, -2.534675, 0, 0.6705883, 1, 1,
0.1566208, -0.0856554, 2.000845, 0, 0.6627451, 1, 1,
0.1570259, 0.7750108, -2.052346, 0, 0.6588235, 1, 1,
0.1680257, -1.126283, 3.077114, 0, 0.6509804, 1, 1,
0.1707419, -0.02733566, 3.292393, 0, 0.6470588, 1, 1,
0.1780033, -0.7243825, 3.536759, 0, 0.6392157, 1, 1,
0.1784506, -0.3388718, 1.89855, 0, 0.6352941, 1, 1,
0.180024, 1.279173, 0.2092011, 0, 0.627451, 1, 1,
0.1803149, 0.07579831, 2.162937, 0, 0.6235294, 1, 1,
0.1821013, -0.1429361, 3.035133, 0, 0.6156863, 1, 1,
0.1859681, -1.700221, 3.827518, 0, 0.6117647, 1, 1,
0.1865434, -0.8135698, 3.97321, 0, 0.6039216, 1, 1,
0.1897031, 0.6634415, -1.607861, 0, 0.5960785, 1, 1,
0.1972613, -1.422086, 1.941955, 0, 0.5921569, 1, 1,
0.2006265, -0.8104432, 2.922474, 0, 0.5843138, 1, 1,
0.2009662, 0.5101265, 2.20574, 0, 0.5803922, 1, 1,
0.2020417, 0.9238632, -1.623161, 0, 0.572549, 1, 1,
0.2038471, 0.007575011, -0.04559681, 0, 0.5686275, 1, 1,
0.2053986, -0.8479887, 0.9665252, 0, 0.5607843, 1, 1,
0.2054811, 1.422518, 0.9173868, 0, 0.5568628, 1, 1,
0.2058265, 0.0274326, -0.1344549, 0, 0.5490196, 1, 1,
0.2087062, 0.5057506, -0.09702113, 0, 0.5450981, 1, 1,
0.2089604, 0.6341949, 1.053501, 0, 0.5372549, 1, 1,
0.2134436, 0.8275408, 1.83513, 0, 0.5333334, 1, 1,
0.2197108, -0.7494127, 2.484813, 0, 0.5254902, 1, 1,
0.2201152, 0.8386424, 0.2460148, 0, 0.5215687, 1, 1,
0.2213286, 0.6220794, -1.932461, 0, 0.5137255, 1, 1,
0.2229383, 2.207384, 0.4739364, 0, 0.509804, 1, 1,
0.2253996, -1.21373, 5.033861, 0, 0.5019608, 1, 1,
0.2270658, 1.138055, 0.4639523, 0, 0.4941176, 1, 1,
0.2282165, -0.7868108, 3.245126, 0, 0.4901961, 1, 1,
0.2303877, -0.7666547, 1.431717, 0, 0.4823529, 1, 1,
0.2342158, 1.171887, -0.6685917, 0, 0.4784314, 1, 1,
0.236698, 0.2100058, 0.08153582, 0, 0.4705882, 1, 1,
0.2419301, -0.9278943, 3.428374, 0, 0.4666667, 1, 1,
0.2479129, 1.41013, 0.6481918, 0, 0.4588235, 1, 1,
0.25761, 0.6406335, 2.293777, 0, 0.454902, 1, 1,
0.2598799, -1.81879, 3.36757, 0, 0.4470588, 1, 1,
0.2608408, 0.106139, 2.712639, 0, 0.4431373, 1, 1,
0.2627269, -0.1628747, 2.141301, 0, 0.4352941, 1, 1,
0.2641134, 0.1029511, 1.641885, 0, 0.4313726, 1, 1,
0.2692873, 0.6409214, -0.6232457, 0, 0.4235294, 1, 1,
0.2710791, 0.8108085, 1.495563, 0, 0.4196078, 1, 1,
0.2795089, 0.783415, 1.547408, 0, 0.4117647, 1, 1,
0.2819862, 1.585086, -0.8027684, 0, 0.4078431, 1, 1,
0.282006, 0.4196177, 0.4104626, 0, 0.4, 1, 1,
0.2843149, 1.500461, 1.185637, 0, 0.3921569, 1, 1,
0.2890927, -2.236387, 3.13246, 0, 0.3882353, 1, 1,
0.2957991, 0.6659632, -0.5658079, 0, 0.3803922, 1, 1,
0.2972482, 0.2198135, 0.7066125, 0, 0.3764706, 1, 1,
0.3065678, 1.133692, 0.5198557, 0, 0.3686275, 1, 1,
0.308138, -0.07641263, 0.4767464, 0, 0.3647059, 1, 1,
0.3092781, 1.035924, 0.1168726, 0, 0.3568628, 1, 1,
0.3126373, 1.200084, 0.1641495, 0, 0.3529412, 1, 1,
0.3129714, -0.5781329, 2.303956, 0, 0.345098, 1, 1,
0.3162422, 0.9607527, -1.525678, 0, 0.3411765, 1, 1,
0.3188552, -1.05313, 2.48, 0, 0.3333333, 1, 1,
0.3196408, -0.6131667, 4.19009, 0, 0.3294118, 1, 1,
0.3216068, 1.483017, 0.3813679, 0, 0.3215686, 1, 1,
0.3250289, -1.159806, 1.529762, 0, 0.3176471, 1, 1,
0.326944, -0.7042174, 2.182249, 0, 0.3098039, 1, 1,
0.3269703, 0.946969, 0.8133519, 0, 0.3058824, 1, 1,
0.3295789, 2.004902, 0.5763947, 0, 0.2980392, 1, 1,
0.3310933, -0.1464395, 2.569538, 0, 0.2901961, 1, 1,
0.3317429, 0.1842014, 1.386938, 0, 0.2862745, 1, 1,
0.3331598, -0.7142266, 2.902679, 0, 0.2784314, 1, 1,
0.3406342, -0.3580521, 2.284182, 0, 0.2745098, 1, 1,
0.3421418, -0.8766164, 3.949548, 0, 0.2666667, 1, 1,
0.3484004, 0.2039056, 0.8038737, 0, 0.2627451, 1, 1,
0.3491871, -0.06376352, 2.535389, 0, 0.254902, 1, 1,
0.349853, -0.7413905, 1.325168, 0, 0.2509804, 1, 1,
0.352011, -2.566112, 2.89569, 0, 0.2431373, 1, 1,
0.3521805, -0.6652149, 1.738895, 0, 0.2392157, 1, 1,
0.3523867, -0.7973391, 2.445008, 0, 0.2313726, 1, 1,
0.3570439, -0.3838615, 2.967846, 0, 0.227451, 1, 1,
0.3616958, 0.134374, 0.6731265, 0, 0.2196078, 1, 1,
0.362885, -0.5214437, 3.305253, 0, 0.2156863, 1, 1,
0.3633071, -1.207801, 3.640587, 0, 0.2078431, 1, 1,
0.3651229, -0.0805926, 1.925872, 0, 0.2039216, 1, 1,
0.3676261, -1.335154, 3.643277, 0, 0.1960784, 1, 1,
0.3705159, 1.439754, 0.6220564, 0, 0.1882353, 1, 1,
0.3707036, -0.518012, 3.357446, 0, 0.1843137, 1, 1,
0.3777792, 2.012931, -0.9859086, 0, 0.1764706, 1, 1,
0.378419, -0.5423067, 3.517094, 0, 0.172549, 1, 1,
0.382861, 0.2095487, -1.407239, 0, 0.1647059, 1, 1,
0.3848454, 2.393778, -0.7629991, 0, 0.1607843, 1, 1,
0.38904, -0.330734, 1.307803, 0, 0.1529412, 1, 1,
0.3917587, 1.2118, -0.3656251, 0, 0.1490196, 1, 1,
0.3979273, 0.02489212, 1.045104, 0, 0.1411765, 1, 1,
0.4035679, 0.09380662, 1.006434, 0, 0.1372549, 1, 1,
0.4037893, 0.1459347, 1.538994, 0, 0.1294118, 1, 1,
0.4055117, -1.820261, 2.173295, 0, 0.1254902, 1, 1,
0.4069841, -0.3702942, 1.801678, 0, 0.1176471, 1, 1,
0.4072262, -0.7228872, 1.087735, 0, 0.1137255, 1, 1,
0.4085003, 1.500101, 0.5957574, 0, 0.1058824, 1, 1,
0.4117818, 0.8189872, 1.910133, 0, 0.09803922, 1, 1,
0.4122416, 0.7517456, 0.3130793, 0, 0.09411765, 1, 1,
0.4132485, -0.6708763, 1.561474, 0, 0.08627451, 1, 1,
0.4161414, 2.051015, -0.6775908, 0, 0.08235294, 1, 1,
0.4236656, 0.65264, 0.01594577, 0, 0.07450981, 1, 1,
0.4255193, 0.1212919, 0.5342475, 0, 0.07058824, 1, 1,
0.4340449, 1.201546, 0.3647897, 0, 0.0627451, 1, 1,
0.4343651, 0.3633593, 0.4651312, 0, 0.05882353, 1, 1,
0.4353039, 1.815028, 0.8012618, 0, 0.05098039, 1, 1,
0.4358087, 0.9225383, 1.787122, 0, 0.04705882, 1, 1,
0.4379719, 0.3596618, -1.396952, 0, 0.03921569, 1, 1,
0.4380145, 0.9314103, 0.01499797, 0, 0.03529412, 1, 1,
0.4388435, -0.3372535, 2.349014, 0, 0.02745098, 1, 1,
0.4471977, -0.362253, 1.579383, 0, 0.02352941, 1, 1,
0.4475639, -1.172096, 1.834512, 0, 0.01568628, 1, 1,
0.4479738, 0.07310928, 2.520247, 0, 0.01176471, 1, 1,
0.4489917, 0.386857, 1.754472, 0, 0.003921569, 1, 1,
0.4504786, -0.1651447, 2.064577, 0.003921569, 0, 1, 1,
0.4527099, 0.350098, -0.7029042, 0.007843138, 0, 1, 1,
0.4590979, 1.293602, 0.3927576, 0.01568628, 0, 1, 1,
0.4593703, 0.3389026, 2.202177, 0.01960784, 0, 1, 1,
0.4603797, -2.158708, 3.196543, 0.02745098, 0, 1, 1,
0.4608753, -0.4408752, 3.812896, 0.03137255, 0, 1, 1,
0.4631793, 2.815031, 1.112411, 0.03921569, 0, 1, 1,
0.4640139, 0.7248068, 1.786749, 0.04313726, 0, 1, 1,
0.4640296, 0.07778692, 0.9361398, 0.05098039, 0, 1, 1,
0.4693026, -0.5261699, 2.466455, 0.05490196, 0, 1, 1,
0.4706981, 0.9065214, 0.808793, 0.0627451, 0, 1, 1,
0.4711868, -3.065719, 2.191572, 0.06666667, 0, 1, 1,
0.4804983, 0.4471931, 0.8423928, 0.07450981, 0, 1, 1,
0.4880719, -0.356991, 3.931894, 0.07843138, 0, 1, 1,
0.4911747, 0.9349778, 0.07461978, 0.08627451, 0, 1, 1,
0.4919432, -1.735722, 3.24962, 0.09019608, 0, 1, 1,
0.500268, 0.04678255, 1.51632, 0.09803922, 0, 1, 1,
0.5003611, -0.8276885, 3.899997, 0.1058824, 0, 1, 1,
0.5045096, 0.7055327, -0.02488134, 0.1098039, 0, 1, 1,
0.5094215, 1.365695, 1.090637, 0.1176471, 0, 1, 1,
0.5177974, 1.391111, 0.2929508, 0.1215686, 0, 1, 1,
0.5287044, -0.04214779, 0.1328839, 0.1294118, 0, 1, 1,
0.5295627, 0.1846619, 2.745419, 0.1333333, 0, 1, 1,
0.5298552, -0.7346838, 3.040905, 0.1411765, 0, 1, 1,
0.5325233, -1.112991, 3.711862, 0.145098, 0, 1, 1,
0.5328703, -1.419156, 2.640217, 0.1529412, 0, 1, 1,
0.5374268, -0.05913152, 1.50991, 0.1568628, 0, 1, 1,
0.543075, -0.4636813, 3.525534, 0.1647059, 0, 1, 1,
0.5461834, -1.096448, 2.259754, 0.1686275, 0, 1, 1,
0.5480611, -0.1483885, 1.416514, 0.1764706, 0, 1, 1,
0.5490861, 0.02699926, 0.5279617, 0.1803922, 0, 1, 1,
0.5550545, 0.6929937, 0.4476018, 0.1882353, 0, 1, 1,
0.5565478, -1.811649, 3.183963, 0.1921569, 0, 1, 1,
0.5641837, -1.019569, 3.065361, 0.2, 0, 1, 1,
0.5686796, -0.4692766, 3.559739, 0.2078431, 0, 1, 1,
0.572404, -0.7551384, 1.960001, 0.2117647, 0, 1, 1,
0.5760617, 0.1540737, 2.500833, 0.2196078, 0, 1, 1,
0.5767842, -0.9913489, 0.4222721, 0.2235294, 0, 1, 1,
0.5860197, 1.043324, 0.247946, 0.2313726, 0, 1, 1,
0.5944257, 0.6336755, 1.549009, 0.2352941, 0, 1, 1,
0.6017621, -1.10173, 1.093035, 0.2431373, 0, 1, 1,
0.6032384, 0.6279696, 2.355888, 0.2470588, 0, 1, 1,
0.6037813, -1.757897, 3.848264, 0.254902, 0, 1, 1,
0.6043168, 1.061056, 0.3134, 0.2588235, 0, 1, 1,
0.6058463, 0.2055281, 2.329612, 0.2666667, 0, 1, 1,
0.6117587, -0.002973265, 0.2102, 0.2705882, 0, 1, 1,
0.6183823, -0.9822104, 2.445674, 0.2784314, 0, 1, 1,
0.6186706, 0.1244896, 1.771073, 0.282353, 0, 1, 1,
0.6217971, -1.539698, 3.936006, 0.2901961, 0, 1, 1,
0.6222093, -2.610401, 3.855577, 0.2941177, 0, 1, 1,
0.6255721, 0.205414, 0.1529027, 0.3019608, 0, 1, 1,
0.6268381, -0.4449542, 3.035244, 0.3098039, 0, 1, 1,
0.6312611, 0.2599708, -0.3068651, 0.3137255, 0, 1, 1,
0.6341827, 0.6924762, -1.433946, 0.3215686, 0, 1, 1,
0.6375539, 0.70362, 2.341272, 0.3254902, 0, 1, 1,
0.6415589, 0.3412781, 0.7491042, 0.3333333, 0, 1, 1,
0.6559901, -0.9946977, 2.853573, 0.3372549, 0, 1, 1,
0.6564606, 0.2288614, 0.5910084, 0.345098, 0, 1, 1,
0.6575856, -0.8664647, 3.170194, 0.3490196, 0, 1, 1,
0.6645119, -0.917551, 2.178723, 0.3568628, 0, 1, 1,
0.6677616, -1.58347, 2.774921, 0.3607843, 0, 1, 1,
0.6682525, 1.591951, 0.5193797, 0.3686275, 0, 1, 1,
0.6776321, 0.04807176, 1.453297, 0.372549, 0, 1, 1,
0.6783448, -0.6048636, 2.5207, 0.3803922, 0, 1, 1,
0.6787011, -0.06188773, 4.101959, 0.3843137, 0, 1, 1,
0.6804152, 0.7805456, 3.166613, 0.3921569, 0, 1, 1,
0.6805699, 0.02797519, 0.9092538, 0.3960784, 0, 1, 1,
0.6848121, -1.102848, 2.199208, 0.4039216, 0, 1, 1,
0.6913944, -0.3638526, 2.510555, 0.4117647, 0, 1, 1,
0.6964781, 0.9990957, 0.2522544, 0.4156863, 0, 1, 1,
0.7017806, -1.084277, 1.969583, 0.4235294, 0, 1, 1,
0.7024857, -0.7183107, 3.776823, 0.427451, 0, 1, 1,
0.7047161, 0.8284141, 0.318233, 0.4352941, 0, 1, 1,
0.707217, -2.238107, 4.894274, 0.4392157, 0, 1, 1,
0.7098168, -0.1710937, 2.03745, 0.4470588, 0, 1, 1,
0.7127758, -0.2094086, 3.272664, 0.4509804, 0, 1, 1,
0.7137245, 1.125913, 0.739008, 0.4588235, 0, 1, 1,
0.7187759, 0.01890091, 1.912856, 0.4627451, 0, 1, 1,
0.7291656, -1.430304, 2.34587, 0.4705882, 0, 1, 1,
0.7302228, 0.9321668, 1.304327, 0.4745098, 0, 1, 1,
0.7352418, -0.2167307, 3.124888, 0.4823529, 0, 1, 1,
0.7527307, 1.356257, 0.8173379, 0.4862745, 0, 1, 1,
0.7638937, 0.1704527, 2.137908, 0.4941176, 0, 1, 1,
0.7683275, 0.8650426, 0.8545974, 0.5019608, 0, 1, 1,
0.7684844, -1.141473, 4.211783, 0.5058824, 0, 1, 1,
0.7690652, -0.04429293, -0.2388431, 0.5137255, 0, 1, 1,
0.7691693, 0.1216123, 2.635389, 0.5176471, 0, 1, 1,
0.7700911, 0.6431945, 2.207216, 0.5254902, 0, 1, 1,
0.7717826, 0.270697, 0.3165275, 0.5294118, 0, 1, 1,
0.7806792, -0.4024594, -0.2377269, 0.5372549, 0, 1, 1,
0.7830107, 0.3750651, 0.7872294, 0.5411765, 0, 1, 1,
0.7898386, -0.8856533, 1.402732, 0.5490196, 0, 1, 1,
0.7928846, 0.3263555, 2.542282, 0.5529412, 0, 1, 1,
0.7971851, -0.0779302, 2.695141, 0.5607843, 0, 1, 1,
0.8000768, -0.1351723, 0.3877562, 0.5647059, 0, 1, 1,
0.802746, 0.265078, 1.567979, 0.572549, 0, 1, 1,
0.8087821, 0.3426665, 1.325324, 0.5764706, 0, 1, 1,
0.811837, 0.4074502, -0.3370478, 0.5843138, 0, 1, 1,
0.8134853, -0.8853171, 0.3489636, 0.5882353, 0, 1, 1,
0.8141453, -0.6451521, 1.133414, 0.5960785, 0, 1, 1,
0.8164677, -1.297033, 2.680778, 0.6039216, 0, 1, 1,
0.8222687, 0.8931564, -0.06433039, 0.6078432, 0, 1, 1,
0.8269066, -1.416817, 2.532796, 0.6156863, 0, 1, 1,
0.8273943, 1.649616, -0.08302145, 0.6196079, 0, 1, 1,
0.8343529, 0.6431004, 1.539558, 0.627451, 0, 1, 1,
0.8343999, -0.5042465, 1.537771, 0.6313726, 0, 1, 1,
0.8394783, -0.364552, 1.646515, 0.6392157, 0, 1, 1,
0.8502862, 0.8077741, 1.695851, 0.6431373, 0, 1, 1,
0.8562315, 0.492509, 0.997331, 0.6509804, 0, 1, 1,
0.8569338, -1.040617, 3.902341, 0.654902, 0, 1, 1,
0.8594335, -0.8714311, 2.544852, 0.6627451, 0, 1, 1,
0.8613721, -0.06044291, 1.056811, 0.6666667, 0, 1, 1,
0.8683829, 1.74016, 0.6256846, 0.6745098, 0, 1, 1,
0.8694224, 0.6568549, -1.20354, 0.6784314, 0, 1, 1,
0.8792496, 1.997192, 1.097136, 0.6862745, 0, 1, 1,
0.879917, -0.753095, 3.309517, 0.6901961, 0, 1, 1,
0.8911259, -0.4588166, 1.127112, 0.6980392, 0, 1, 1,
0.8923113, -1.507783, 1.713586, 0.7058824, 0, 1, 1,
0.9003712, 0.4874631, 0.6756958, 0.7098039, 0, 1, 1,
0.9035868, -0.4595414, 1.113427, 0.7176471, 0, 1, 1,
0.9077039, 1.059819, 0.703686, 0.7215686, 0, 1, 1,
0.9147148, 0.8550221, -0.5369138, 0.7294118, 0, 1, 1,
0.9171039, -2.447798, 2.028706, 0.7333333, 0, 1, 1,
0.9239197, -1.345359, 2.560497, 0.7411765, 0, 1, 1,
0.9258208, 0.3960704, 2.500636, 0.7450981, 0, 1, 1,
0.9309632, -0.4007353, 2.157163, 0.7529412, 0, 1, 1,
0.9358643, -0.02957291, 1.772422, 0.7568628, 0, 1, 1,
0.9389226, 0.3581865, -0.1544206, 0.7647059, 0, 1, 1,
0.9547002, -1.96579, 2.565599, 0.7686275, 0, 1, 1,
0.9547644, -0.1596446, 0.1470615, 0.7764706, 0, 1, 1,
0.9556487, -0.7002655, 2.053027, 0.7803922, 0, 1, 1,
0.9557056, -0.166085, 2.685525, 0.7882353, 0, 1, 1,
0.9562213, 0.4354705, 0.7554799, 0.7921569, 0, 1, 1,
0.9563687, 1.140813, 2.030348, 0.8, 0, 1, 1,
0.960066, 0.3264747, 1.31006, 0.8078431, 0, 1, 1,
0.9625025, 0.8910406, 0.5852543, 0.8117647, 0, 1, 1,
0.9703645, 0.9559193, 0.7093087, 0.8196079, 0, 1, 1,
0.984043, -0.7784092, 2.754976, 0.8235294, 0, 1, 1,
0.9929045, 0.5885677, 1.167282, 0.8313726, 0, 1, 1,
0.9929423, -3.085428, 2.776009, 0.8352941, 0, 1, 1,
0.9954994, -0.202971, 1.100514, 0.8431373, 0, 1, 1,
1.00448, 1.776622, 0.5463459, 0.8470588, 0, 1, 1,
1.007323, -0.8760386, 2.341766, 0.854902, 0, 1, 1,
1.009637, -0.8394296, 3.018865, 0.8588235, 0, 1, 1,
1.01055, 0.6130465, 0.776121, 0.8666667, 0, 1, 1,
1.010737, -1.141504, 1.660913, 0.8705882, 0, 1, 1,
1.020644, 0.9188316, 0.6391904, 0.8784314, 0, 1, 1,
1.021082, 0.3736586, 1.416294, 0.8823529, 0, 1, 1,
1.021988, 0.3161268, -0.2420504, 0.8901961, 0, 1, 1,
1.030512, -0.1301014, 1.376883, 0.8941177, 0, 1, 1,
1.031308, 0.5995963, 1.566441, 0.9019608, 0, 1, 1,
1.037485, 1.017955, 1.040691, 0.9098039, 0, 1, 1,
1.03878, 1.060148, 1.096266, 0.9137255, 0, 1, 1,
1.040033, -0.9219147, 1.963407, 0.9215686, 0, 1, 1,
1.040036, 1.016232, 0.1915499, 0.9254902, 0, 1, 1,
1.05129, 0.7434376, 2.336859, 0.9333333, 0, 1, 1,
1.060503, -0.7196164, 0.8884192, 0.9372549, 0, 1, 1,
1.071462, 0.5197176, 2.277802, 0.945098, 0, 1, 1,
1.086738, -2.044296, 3.027355, 0.9490196, 0, 1, 1,
1.092175, 0.7771173, -0.7689, 0.9568627, 0, 1, 1,
1.09381, -1.074909, 1.958427, 0.9607843, 0, 1, 1,
1.095722, 0.4428701, 0.6295607, 0.9686275, 0, 1, 1,
1.10102, 0.07241061, 1.20955, 0.972549, 0, 1, 1,
1.101675, 0.8687912, 0.8686895, 0.9803922, 0, 1, 1,
1.102357, 1.172077, 0.2922851, 0.9843137, 0, 1, 1,
1.103164, 0.7672592, -1.053805, 0.9921569, 0, 1, 1,
1.10823, 1.378786, 1.807233, 0.9960784, 0, 1, 1,
1.108448, 1.289674, 1.060036, 1, 0, 0.9960784, 1,
1.109839, -1.481104, 3.64423, 1, 0, 0.9882353, 1,
1.110489, 1.510712, -0.1328687, 1, 0, 0.9843137, 1,
1.115585, -1.249325, 1.080415, 1, 0, 0.9764706, 1,
1.116415, -0.8395702, 3.567459, 1, 0, 0.972549, 1,
1.11931, -0.219764, 1.671649, 1, 0, 0.9647059, 1,
1.128526, -0.5420382, -0.5910693, 1, 0, 0.9607843, 1,
1.129357, 0.0112223, 2.259146, 1, 0, 0.9529412, 1,
1.138312, -0.6740598, 0.876928, 1, 0, 0.9490196, 1,
1.138808, -1.696487, 4.526393, 1, 0, 0.9411765, 1,
1.141401, -0.5130737, 2.162409, 1, 0, 0.9372549, 1,
1.141496, 1.794389, 0.9228182, 1, 0, 0.9294118, 1,
1.147327, -0.9288622, 3.856697, 1, 0, 0.9254902, 1,
1.156323, 1.157257, -1.004029, 1, 0, 0.9176471, 1,
1.157876, 1.145006, -0.7730285, 1, 0, 0.9137255, 1,
1.173338, 0.6251433, 1.604501, 1, 0, 0.9058824, 1,
1.174007, 0.9465149, 1.650597, 1, 0, 0.9019608, 1,
1.176254, -0.1135282, 2.568889, 1, 0, 0.8941177, 1,
1.176663, 0.05090913, 2.821263, 1, 0, 0.8862745, 1,
1.177977, 0.2629597, 1.963265, 1, 0, 0.8823529, 1,
1.188946, 0.4090984, 0.6034493, 1, 0, 0.8745098, 1,
1.189015, -2.215238, 2.811722, 1, 0, 0.8705882, 1,
1.194418, -1.835705, 0.7090207, 1, 0, 0.8627451, 1,
1.19984, -1.428804, 2.215377, 1, 0, 0.8588235, 1,
1.207244, -0.435892, 2.340661, 1, 0, 0.8509804, 1,
1.208073, -0.006975354, 0.2918195, 1, 0, 0.8470588, 1,
1.211017, 0.2053355, 2.185416, 1, 0, 0.8392157, 1,
1.219012, 0.4276242, 1.444572, 1, 0, 0.8352941, 1,
1.22093, -0.413155, 2.7905, 1, 0, 0.827451, 1,
1.225151, -0.08185861, 1.245359, 1, 0, 0.8235294, 1,
1.225469, -0.3729817, 2.616671, 1, 0, 0.8156863, 1,
1.23422, 0.7691611, 1.32654, 1, 0, 0.8117647, 1,
1.236205, 0.7979282, 1.650501, 1, 0, 0.8039216, 1,
1.242641, 0.4998572, 1.906419, 1, 0, 0.7960784, 1,
1.243542, 1.549229, 1.061771, 1, 0, 0.7921569, 1,
1.251428, 0.1834256, 2.077347, 1, 0, 0.7843137, 1,
1.252788, -0.6753412, 3.305611, 1, 0, 0.7803922, 1,
1.254114, 0.7892874, 1.356513, 1, 0, 0.772549, 1,
1.255515, 0.3080075, 1.957363, 1, 0, 0.7686275, 1,
1.259024, -1.139469, 2.230123, 1, 0, 0.7607843, 1,
1.268917, 0.383828, 1.141722, 1, 0, 0.7568628, 1,
1.27174, -0.1049344, 2.572079, 1, 0, 0.7490196, 1,
1.273301, -0.4732163, 1.506228, 1, 0, 0.7450981, 1,
1.2774, 0.5809605, 1.549382, 1, 0, 0.7372549, 1,
1.277999, -0.7050446, 1.913608, 1, 0, 0.7333333, 1,
1.282789, 0.8430225, 0.09118452, 1, 0, 0.7254902, 1,
1.285303, 1.010814, 0.9894596, 1, 0, 0.7215686, 1,
1.286677, -0.01577114, 0.4392151, 1, 0, 0.7137255, 1,
1.287093, -0.39543, 2.591435, 1, 0, 0.7098039, 1,
1.289076, 0.5372933, 0.5296307, 1, 0, 0.7019608, 1,
1.289116, -0.02369293, 4.023619, 1, 0, 0.6941177, 1,
1.299809, -0.004199674, 2.576837, 1, 0, 0.6901961, 1,
1.301424, 1.18051, 1.011036, 1, 0, 0.682353, 1,
1.301782, -0.847369, 2.452511, 1, 0, 0.6784314, 1,
1.30548, 0.4074698, 1.301506, 1, 0, 0.6705883, 1,
1.313186, -0.9596503, 0.8724339, 1, 0, 0.6666667, 1,
1.321924, 0.8191094, 0.4726663, 1, 0, 0.6588235, 1,
1.323539, -0.2856365, 1.024366, 1, 0, 0.654902, 1,
1.324724, -0.6549019, 0.565695, 1, 0, 0.6470588, 1,
1.325101, -0.2051004, 2.216061, 1, 0, 0.6431373, 1,
1.334049, 1.124212, -0.1530983, 1, 0, 0.6352941, 1,
1.341828, 0.6452986, 0.7253262, 1, 0, 0.6313726, 1,
1.349291, -1.879664, 3.026091, 1, 0, 0.6235294, 1,
1.354308, -1.74208, 2.333153, 1, 0, 0.6196079, 1,
1.359676, 0.9318591, 1.579519, 1, 0, 0.6117647, 1,
1.360474, -1.123824, 2.909921, 1, 0, 0.6078432, 1,
1.361967, -0.702047, 2.164994, 1, 0, 0.6, 1,
1.361982, 0.1383004, -0.7526618, 1, 0, 0.5921569, 1,
1.362108, -2.169455, 1.652692, 1, 0, 0.5882353, 1,
1.365047, 2.033392, 0.7568078, 1, 0, 0.5803922, 1,
1.367821, 1.459129, 0.2931742, 1, 0, 0.5764706, 1,
1.370143, 0.1132843, 3.148502, 1, 0, 0.5686275, 1,
1.371464, 0.8521546, 0.5579209, 1, 0, 0.5647059, 1,
1.373732, 0.500204, 1.020513, 1, 0, 0.5568628, 1,
1.385049, 1.424044, 1.27103, 1, 0, 0.5529412, 1,
1.391752, -0.6198002, 0.2153723, 1, 0, 0.5450981, 1,
1.399639, -0.3433904, 2.067843, 1, 0, 0.5411765, 1,
1.402945, 1.698375, 1.557276, 1, 0, 0.5333334, 1,
1.404488, -1.574353, 3.406599, 1, 0, 0.5294118, 1,
1.418905, 0.4190004, 1.60105, 1, 0, 0.5215687, 1,
1.422561, 0.1749, 2.371123, 1, 0, 0.5176471, 1,
1.42326, -2.793701, 0.8111393, 1, 0, 0.509804, 1,
1.431311, -0.504388, 2.246455, 1, 0, 0.5058824, 1,
1.431791, -0.3622696, 1.990885, 1, 0, 0.4980392, 1,
1.439813, 2.026362, 1.093408, 1, 0, 0.4901961, 1,
1.449132, -0.7225945, 1.932738, 1, 0, 0.4862745, 1,
1.449609, -0.6563673, 1.747023, 1, 0, 0.4784314, 1,
1.450446, 1.195458, 1.504866, 1, 0, 0.4745098, 1,
1.451391, 0.7114034, 0.708339, 1, 0, 0.4666667, 1,
1.459069, 2.119329, -0.876339, 1, 0, 0.4627451, 1,
1.479896, 0.2208075, 1.128236, 1, 0, 0.454902, 1,
1.490178, -0.2419419, 0.08286159, 1, 0, 0.4509804, 1,
1.498755, -1.334387, 1.511394, 1, 0, 0.4431373, 1,
1.514949, -0.3682612, 1.871563, 1, 0, 0.4392157, 1,
1.525978, -0.1676384, 1.759657, 1, 0, 0.4313726, 1,
1.534012, -1.813421, 3.676116, 1, 0, 0.427451, 1,
1.538539, -0.2063983, 0.1111577, 1, 0, 0.4196078, 1,
1.540331, 0.01107127, 0.03543931, 1, 0, 0.4156863, 1,
1.551295, -0.1839787, 1.834122, 1, 0, 0.4078431, 1,
1.55761, -1.554104, 1.578629, 1, 0, 0.4039216, 1,
1.561737, -0.2741622, 2.062639, 1, 0, 0.3960784, 1,
1.564397, -0.2109681, 0.3549817, 1, 0, 0.3882353, 1,
1.587945, -1.413296, 4.289589, 1, 0, 0.3843137, 1,
1.592235, 0.6378767, 0.3495525, 1, 0, 0.3764706, 1,
1.593291, 0.4488948, 2.226874, 1, 0, 0.372549, 1,
1.596798, 0.2517343, 2.906892, 1, 0, 0.3647059, 1,
1.607271, -0.2597116, 1.431771, 1, 0, 0.3607843, 1,
1.611727, 0.7604684, 0.3140888, 1, 0, 0.3529412, 1,
1.626001, 1.73994, 0.7941194, 1, 0, 0.3490196, 1,
1.626578, -1.07618, 1.6686, 1, 0, 0.3411765, 1,
1.650287, 1.387574, 0.820183, 1, 0, 0.3372549, 1,
1.657879, -0.174234, 0.301257, 1, 0, 0.3294118, 1,
1.658337, 0.1411088, 1.587901, 1, 0, 0.3254902, 1,
1.675488, 0.6586125, 0.1925068, 1, 0, 0.3176471, 1,
1.695857, -0.2475529, 0.1741838, 1, 0, 0.3137255, 1,
1.700771, -0.7739468, 2.958709, 1, 0, 0.3058824, 1,
1.722207, 0.8474833, 2.315785, 1, 0, 0.2980392, 1,
1.734582, -0.7454901, 1.87361, 1, 0, 0.2941177, 1,
1.73594, 0.281254, 1.597021, 1, 0, 0.2862745, 1,
1.759314, -1.057765, 0.8157015, 1, 0, 0.282353, 1,
1.762592, 0.518558, 1.032562, 1, 0, 0.2745098, 1,
1.772615, 2.62591, 0.3071534, 1, 0, 0.2705882, 1,
1.781677, -1.019, 1.677386, 1, 0, 0.2627451, 1,
1.805875, 0.04480948, 1.381074, 1, 0, 0.2588235, 1,
1.806634, 0.6461112, 1.750545, 1, 0, 0.2509804, 1,
1.809766, -0.4936344, 3.322661, 1, 0, 0.2470588, 1,
1.810924, -0.3892058, 1.030188, 1, 0, 0.2392157, 1,
1.831492, -1.254438, 1.888242, 1, 0, 0.2352941, 1,
1.840943, 0.2897045, 1.910706, 1, 0, 0.227451, 1,
1.854576, 0.507338, 1.355404, 1, 0, 0.2235294, 1,
1.869239, -0.6826046, 3.240376, 1, 0, 0.2156863, 1,
1.870683, 0.2117505, 1.588959, 1, 0, 0.2117647, 1,
1.878914, 0.4657396, 2.173288, 1, 0, 0.2039216, 1,
1.900715, 1.091734, 0.7337767, 1, 0, 0.1960784, 1,
1.915104, 0.04954365, 2.592087, 1, 0, 0.1921569, 1,
1.950904, 1.242818, -0.06902612, 1, 0, 0.1843137, 1,
1.99891, -1.165425, 3.613062, 1, 0, 0.1803922, 1,
2.022714, 1.652332, 0.9105258, 1, 0, 0.172549, 1,
2.02709, 0.2248816, 2.236338, 1, 0, 0.1686275, 1,
2.031337, -0.9325207, 4.916114, 1, 0, 0.1607843, 1,
2.044042, -0.4845134, 1.204537, 1, 0, 0.1568628, 1,
2.06172, -0.08691868, 0.3957994, 1, 0, 0.1490196, 1,
2.074079, -1.271975, 2.382002, 1, 0, 0.145098, 1,
2.099497, -0.7921093, 1.637473, 1, 0, 0.1372549, 1,
2.143126, 0.03822487, -0.1494083, 1, 0, 0.1333333, 1,
2.145299, 0.1377056, 1.808703, 1, 0, 0.1254902, 1,
2.152152, 0.6415623, 1.183069, 1, 0, 0.1215686, 1,
2.163532, 1.144716, 1.459918, 1, 0, 0.1137255, 1,
2.182224, 0.4443758, 0.3563974, 1, 0, 0.1098039, 1,
2.187969, 0.644277, 2.001853, 1, 0, 0.1019608, 1,
2.188401, 0.5704662, -1.142344, 1, 0, 0.09411765, 1,
2.217383, -0.4589433, 2.099031, 1, 0, 0.09019608, 1,
2.246111, -1.07818, 1.445492, 1, 0, 0.08235294, 1,
2.305346, -0.1971203, 1.025932, 1, 0, 0.07843138, 1,
2.30756, 1.240111, 0.5250325, 1, 0, 0.07058824, 1,
2.333859, 1.624235, 0.3673798, 1, 0, 0.06666667, 1,
2.336931, -1.010488, 2.627274, 1, 0, 0.05882353, 1,
2.360893, 0.533224, 1.410125, 1, 0, 0.05490196, 1,
2.375599, -1.373544, 2.925118, 1, 0, 0.04705882, 1,
2.408624, 0.2654022, 1.307221, 1, 0, 0.04313726, 1,
2.550744, 0.8198374, 1.186186, 1, 0, 0.03529412, 1,
2.607991, -0.378406, 3.172662, 1, 0, 0.03137255, 1,
2.675045, -0.246966, 2.865984, 1, 0, 0.02352941, 1,
2.675443, -0.6994656, 2.142482, 1, 0, 0.01960784, 1,
2.901202, -1.596978, 1.29591, 1, 0, 0.01176471, 1,
3.006333, 0.7358707, -0.8221251, 1, 0, 0.007843138, 1
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
-0.09894395, -4.863571, -8.369399, 0, -0.5, 0.5, 0.5,
-0.09894395, -4.863571, -8.369399, 1, -0.5, 0.5, 0.5,
-0.09894395, -4.863571, -8.369399, 1, 1.5, 0.5, 0.5,
-0.09894395, -4.863571, -8.369399, 0, 1.5, 0.5, 0.5
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
-4.25691, -0.1764919, -8.369399, 0, -0.5, 0.5, 0.5,
-4.25691, -0.1764919, -8.369399, 1, -0.5, 0.5, 0.5,
-4.25691, -0.1764919, -8.369399, 1, 1.5, 0.5, 0.5,
-4.25691, -0.1764919, -8.369399, 0, 1.5, 0.5, 0.5
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
-4.25691, -4.863571, -0.6066566, 0, -0.5, 0.5, 0.5,
-4.25691, -4.863571, -0.6066566, 1, -0.5, 0.5, 0.5,
-4.25691, -4.863571, -0.6066566, 1, 1.5, 0.5, 0.5,
-4.25691, -4.863571, -0.6066566, 0, 1.5, 0.5, 0.5
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
-3, -3.781937, -6.577997,
3, -3.781937, -6.577997,
-3, -3.781937, -6.577997,
-3, -3.962209, -6.876564,
-2, -3.781937, -6.577997,
-2, -3.962209, -6.876564,
-1, -3.781937, -6.577997,
-1, -3.962209, -6.876564,
0, -3.781937, -6.577997,
0, -3.962209, -6.876564,
1, -3.781937, -6.577997,
1, -3.962209, -6.876564,
2, -3.781937, -6.577997,
2, -3.962209, -6.876564,
3, -3.781937, -6.577997,
3, -3.962209, -6.876564
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
-3, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
-3, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
-3, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
-3, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5,
-2, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
-2, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
-2, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
-2, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5,
-1, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
-1, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
-1, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
-1, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5,
0, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
0, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
0, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
0, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5,
1, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
1, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
1, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
1, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5,
2, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
2, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
2, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
2, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5,
3, -4.322754, -7.473698, 0, -0.5, 0.5, 0.5,
3, -4.322754, -7.473698, 1, -0.5, 0.5, 0.5,
3, -4.322754, -7.473698, 1, 1.5, 0.5, 0.5,
3, -4.322754, -7.473698, 0, 1.5, 0.5, 0.5
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
-3.297379, -2, -6.577997,
-3.297379, 2, -6.577997,
-3.297379, -2, -6.577997,
-3.457301, -2, -6.876564,
-3.297379, 0, -6.577997,
-3.457301, 0, -6.876564,
-3.297379, 2, -6.577997,
-3.457301, 2, -6.876564
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
-3.777144, -2, -7.473698, 0, -0.5, 0.5, 0.5,
-3.777144, -2, -7.473698, 1, -0.5, 0.5, 0.5,
-3.777144, -2, -7.473698, 1, 1.5, 0.5, 0.5,
-3.777144, -2, -7.473698, 0, 1.5, 0.5, 0.5,
-3.777144, 0, -7.473698, 0, -0.5, 0.5, 0.5,
-3.777144, 0, -7.473698, 1, -0.5, 0.5, 0.5,
-3.777144, 0, -7.473698, 1, 1.5, 0.5, 0.5,
-3.777144, 0, -7.473698, 0, 1.5, 0.5, 0.5,
-3.777144, 2, -7.473698, 0, -0.5, 0.5, 0.5,
-3.777144, 2, -7.473698, 1, -0.5, 0.5, 0.5,
-3.777144, 2, -7.473698, 1, 1.5, 0.5, 0.5,
-3.777144, 2, -7.473698, 0, 1.5, 0.5, 0.5
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
-3.297379, -3.781937, -6,
-3.297379, -3.781937, 4,
-3.297379, -3.781937, -6,
-3.457301, -3.962209, -6,
-3.297379, -3.781937, -4,
-3.457301, -3.962209, -4,
-3.297379, -3.781937, -2,
-3.457301, -3.962209, -2,
-3.297379, -3.781937, 0,
-3.457301, -3.962209, 0,
-3.297379, -3.781937, 2,
-3.457301, -3.962209, 2,
-3.297379, -3.781937, 4,
-3.457301, -3.962209, 4
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
-3.777144, -4.322754, -6, 0, -0.5, 0.5, 0.5,
-3.777144, -4.322754, -6, 1, -0.5, 0.5, 0.5,
-3.777144, -4.322754, -6, 1, 1.5, 0.5, 0.5,
-3.777144, -4.322754, -6, 0, 1.5, 0.5, 0.5,
-3.777144, -4.322754, -4, 0, -0.5, 0.5, 0.5,
-3.777144, -4.322754, -4, 1, -0.5, 0.5, 0.5,
-3.777144, -4.322754, -4, 1, 1.5, 0.5, 0.5,
-3.777144, -4.322754, -4, 0, 1.5, 0.5, 0.5,
-3.777144, -4.322754, -2, 0, -0.5, 0.5, 0.5,
-3.777144, -4.322754, -2, 1, -0.5, 0.5, 0.5,
-3.777144, -4.322754, -2, 1, 1.5, 0.5, 0.5,
-3.777144, -4.322754, -2, 0, 1.5, 0.5, 0.5,
-3.777144, -4.322754, 0, 0, -0.5, 0.5, 0.5,
-3.777144, -4.322754, 0, 1, -0.5, 0.5, 0.5,
-3.777144, -4.322754, 0, 1, 1.5, 0.5, 0.5,
-3.777144, -4.322754, 0, 0, 1.5, 0.5, 0.5,
-3.777144, -4.322754, 2, 0, -0.5, 0.5, 0.5,
-3.777144, -4.322754, 2, 1, -0.5, 0.5, 0.5,
-3.777144, -4.322754, 2, 1, 1.5, 0.5, 0.5,
-3.777144, -4.322754, 2, 0, 1.5, 0.5, 0.5,
-3.777144, -4.322754, 4, 0, -0.5, 0.5, 0.5,
-3.777144, -4.322754, 4, 1, -0.5, 0.5, 0.5,
-3.777144, -4.322754, 4, 1, 1.5, 0.5, 0.5,
-3.777144, -4.322754, 4, 0, 1.5, 0.5, 0.5
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
-3.297379, -3.781937, -6.577997,
-3.297379, 3.428953, -6.577997,
-3.297379, -3.781937, 5.364684,
-3.297379, 3.428953, 5.364684,
-3.297379, -3.781937, -6.577997,
-3.297379, -3.781937, 5.364684,
-3.297379, 3.428953, -6.577997,
-3.297379, 3.428953, 5.364684,
-3.297379, -3.781937, -6.577997,
3.099491, -3.781937, -6.577997,
-3.297379, -3.781937, 5.364684,
3.099491, -3.781937, 5.364684,
-3.297379, 3.428953, -6.577997,
3.099491, 3.428953, -6.577997,
-3.297379, 3.428953, 5.364684,
3.099491, 3.428953, 5.364684,
3.099491, -3.781937, -6.577997,
3.099491, 3.428953, -6.577997,
3.099491, -3.781937, 5.364684,
3.099491, 3.428953, 5.364684,
3.099491, -3.781937, -6.577997,
3.099491, -3.781937, 5.364684,
3.099491, 3.428953, -6.577997,
3.099491, 3.428953, 5.364684
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
var radius = 8.195246;
var distance = 36.46157;
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
mvMatrix.translate( 0.09894395, 0.1764919, 0.6066566 );
mvMatrix.scale( 1.385187, 1.228816, 0.741949 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.46157);
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
sodium_metaarsenite<-read.table("sodium_metaarsenite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_metaarsenite$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_metaarsenite' not found
```

```r
y<-sodium_metaarsenite$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_metaarsenite' not found
```

```r
z<-sodium_metaarsenite$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_metaarsenite' not found
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
-3.204221, 0.7516887, -2.756901, 0, 0, 1, 1, 1,
-2.933459, 2.301852, -1.873119, 1, 0, 0, 1, 1,
-2.845765, 0.4626743, -1.544052, 1, 0, 0, 1, 1,
-2.65498, -0.09835061, -1.241569, 1, 0, 0, 1, 1,
-2.386792, -0.7439594, -1.741052, 1, 0, 0, 1, 1,
-2.32887, 0.6392376, -2.107584, 1, 0, 0, 1, 1,
-2.319759, -0.2707551, -2.830634, 0, 0, 0, 1, 1,
-2.30907, 0.1875365, -0.9728925, 0, 0, 0, 1, 1,
-2.255789, -0.5620502, -2.967649, 0, 0, 0, 1, 1,
-2.254059, 0.9097285, -1.421094, 0, 0, 0, 1, 1,
-2.246966, 0.8189241, -0.5276176, 0, 0, 0, 1, 1,
-2.246157, -0.7062397, -2.456044, 0, 0, 0, 1, 1,
-2.238166, 0.214616, -2.319546, 0, 0, 0, 1, 1,
-2.221452, -0.5110057, -1.518336, 1, 1, 1, 1, 1,
-2.206148, 1.794594, 0.6043907, 1, 1, 1, 1, 1,
-2.147983, -0.8229021, -1.421327, 1, 1, 1, 1, 1,
-2.105468, -1.425203, -3.212817, 1, 1, 1, 1, 1,
-2.104054, -1.373908, -3.056292, 1, 1, 1, 1, 1,
-2.072193, -0.6540089, 0.5814928, 1, 1, 1, 1, 1,
-2.070371, -0.8053729, -3.400753, 1, 1, 1, 1, 1,
-2.027017, 1.010237, -0.1980108, 1, 1, 1, 1, 1,
-1.976994, 0.7166802, -1.71819, 1, 1, 1, 1, 1,
-1.97577, -1.417175, -3.31707, 1, 1, 1, 1, 1,
-1.974112, -0.6249508, -1.961089, 1, 1, 1, 1, 1,
-1.958475, -0.1930098, -1.86742, 1, 1, 1, 1, 1,
-1.946233, -0.3987568, -0.1250372, 1, 1, 1, 1, 1,
-1.922943, -0.9777071, -1.813023, 1, 1, 1, 1, 1,
-1.916775, -2.253946, -2.131238, 1, 1, 1, 1, 1,
-1.906202, -1.258965, -2.510131, 0, 0, 1, 1, 1,
-1.898043, 0.3490674, -1.767569, 1, 0, 0, 1, 1,
-1.837013, 1.671197, 0.5657381, 1, 0, 0, 1, 1,
-1.822369, -0.05476679, -2.173025, 1, 0, 0, 1, 1,
-1.819274, 0.4029627, -1.409085, 1, 0, 0, 1, 1,
-1.795663, -1.076272, -1.096423, 1, 0, 0, 1, 1,
-1.788835, 0.3183149, -2.263247, 0, 0, 0, 1, 1,
-1.777455, -0.1929036, -0.8966653, 0, 0, 0, 1, 1,
-1.774978, -0.130642, -1.233399, 0, 0, 0, 1, 1,
-1.769673, 1.878016, 0.04378822, 0, 0, 0, 1, 1,
-1.762848, -0.6323904, -3.252151, 0, 0, 0, 1, 1,
-1.744615, -0.6390761, -2.073522, 0, 0, 0, 1, 1,
-1.733199, -0.5600715, -1.176105, 0, 0, 0, 1, 1,
-1.718724, -1.005623, -3.33857, 1, 1, 1, 1, 1,
-1.699966, -0.5528928, -2.355116, 1, 1, 1, 1, 1,
-1.687571, 0.2521086, 1.609627, 1, 1, 1, 1, 1,
-1.674365, -1.006819, -2.420097, 1, 1, 1, 1, 1,
-1.661681, -0.3372235, -2.027869, 1, 1, 1, 1, 1,
-1.660174, -0.4459561, -2.016897, 1, 1, 1, 1, 1,
-1.654027, 0.3698899, -3.526302, 1, 1, 1, 1, 1,
-1.648284, -0.8448063, -2.050921, 1, 1, 1, 1, 1,
-1.644486, -0.07152548, -0.5300174, 1, 1, 1, 1, 1,
-1.633004, 0.1165612, -0.9105401, 1, 1, 1, 1, 1,
-1.627632, -0.3208914, -1.534123, 1, 1, 1, 1, 1,
-1.614155, 1.433626, -1.988092, 1, 1, 1, 1, 1,
-1.610462, -1.314086, -2.610344, 1, 1, 1, 1, 1,
-1.603895, 0.3011092, -1.617413, 1, 1, 1, 1, 1,
-1.594516, -0.1132276, -2.036527, 1, 1, 1, 1, 1,
-1.58822, -0.05146742, -2.936335, 0, 0, 1, 1, 1,
-1.570329, -0.3514585, -1.356101, 1, 0, 0, 1, 1,
-1.557904, 0.5977707, -0.9332804, 1, 0, 0, 1, 1,
-1.554517, -1.269449, -1.913091, 1, 0, 0, 1, 1,
-1.554063, 0.9126153, -1.046872, 1, 0, 0, 1, 1,
-1.549383, 1.698484, -0.8388816, 1, 0, 0, 1, 1,
-1.549104, 0.2104336, -0.180133, 0, 0, 0, 1, 1,
-1.547001, 0.8412849, 0.04841725, 0, 0, 0, 1, 1,
-1.541741, -0.4745759, -0.7442349, 0, 0, 0, 1, 1,
-1.539132, -0.05996577, -0.602917, 0, 0, 0, 1, 1,
-1.538063, 0.8609385, -0.1310871, 0, 0, 0, 1, 1,
-1.533673, 1.134501, -1.054947, 0, 0, 0, 1, 1,
-1.526902, 0.6196591, 0.7695147, 0, 0, 0, 1, 1,
-1.503065, 0.3953696, -3.926157, 1, 1, 1, 1, 1,
-1.49046, -0.3895338, -1.376601, 1, 1, 1, 1, 1,
-1.467907, 0.8906733, -1.616225, 1, 1, 1, 1, 1,
-1.467061, -0.6233576, -2.529004, 1, 1, 1, 1, 1,
-1.451838, 0.08279146, -0.6457831, 1, 1, 1, 1, 1,
-1.420803, -0.4978243, 0.2932281, 1, 1, 1, 1, 1,
-1.419152, -1.245133, -2.501587, 1, 1, 1, 1, 1,
-1.418405, 0.4323195, -1.436497, 1, 1, 1, 1, 1,
-1.412996, -0.686579, -1.692838, 1, 1, 1, 1, 1,
-1.408966, -0.3946, -0.1182579, 1, 1, 1, 1, 1,
-1.393492, -0.2484647, -0.005663704, 1, 1, 1, 1, 1,
-1.384838, -0.04188449, 0.1207155, 1, 1, 1, 1, 1,
-1.383647, -0.2258629, -2.141752, 1, 1, 1, 1, 1,
-1.375782, 1.924565, -1.238425, 1, 1, 1, 1, 1,
-1.375638, 1.452071, -1.486946, 1, 1, 1, 1, 1,
-1.374313, -0.3771424, -2.240721, 0, 0, 1, 1, 1,
-1.364373, -1.262825, -1.946713, 1, 0, 0, 1, 1,
-1.3619, 0.6666291, 0.995689, 1, 0, 0, 1, 1,
-1.346045, 0.11616, -0.416637, 1, 0, 0, 1, 1,
-1.343111, -1.233527, -4.042956, 1, 0, 0, 1, 1,
-1.341967, 1.725724, 0.7050843, 1, 0, 0, 1, 1,
-1.340583, 2.739738, 1.116201, 0, 0, 0, 1, 1,
-1.33889, -0.1775874, -1.020107, 0, 0, 0, 1, 1,
-1.306804, 0.9984123, -1.101633, 0, 0, 0, 1, 1,
-1.294536, 0.2302743, -2.231517, 0, 0, 0, 1, 1,
-1.293139, 1.064401, -0.6151914, 0, 0, 0, 1, 1,
-1.291441, 2.1411, -1.617646, 0, 0, 0, 1, 1,
-1.264122, 1.047582, -0.6774262, 0, 0, 0, 1, 1,
-1.261529, 2.782795, -0.879302, 1, 1, 1, 1, 1,
-1.251729, -0.1245478, -1.245789, 1, 1, 1, 1, 1,
-1.248259, -0.08017358, 0.4769866, 1, 1, 1, 1, 1,
-1.240887, 1.049631, -1.520154, 1, 1, 1, 1, 1,
-1.238425, 0.187914, -1.231591, 1, 1, 1, 1, 1,
-1.236023, 0.03061466, -0.7914643, 1, 1, 1, 1, 1,
-1.233024, -0.3166088, -2.719989, 1, 1, 1, 1, 1,
-1.231216, -2.076022, -3.4357, 1, 1, 1, 1, 1,
-1.226314, 0.7823271, -0.7252656, 1, 1, 1, 1, 1,
-1.222131, -0.6821911, -3.621492, 1, 1, 1, 1, 1,
-1.220341, 0.5479601, -1.949716, 1, 1, 1, 1, 1,
-1.219971, 1.270389, -1.317613, 1, 1, 1, 1, 1,
-1.219366, 0.5001932, 0.1783243, 1, 1, 1, 1, 1,
-1.218716, 1.229201, -2.470078, 1, 1, 1, 1, 1,
-1.218059, 0.4536987, -0.5021461, 1, 1, 1, 1, 1,
-1.216919, -0.2941813, -2.261836, 0, 0, 1, 1, 1,
-1.21392, -0.1890038, 0.572549, 1, 0, 0, 1, 1,
-1.206986, 0.9080067, -2.021801, 1, 0, 0, 1, 1,
-1.206887, 0.03180327, -2.040722, 1, 0, 0, 1, 1,
-1.204775, -0.5350873, -0.7061452, 1, 0, 0, 1, 1,
-1.203734, 1.139265, -1.38318, 1, 0, 0, 1, 1,
-1.19948, 0.2193006, -2.009231, 0, 0, 0, 1, 1,
-1.191583, -0.03889184, -1.572612, 0, 0, 0, 1, 1,
-1.186869, 0.01676073, 1.112615, 0, 0, 0, 1, 1,
-1.185392, 0.2023473, -1.310759, 0, 0, 0, 1, 1,
-1.182922, 2.06076, 0.7863722, 0, 0, 0, 1, 1,
-1.178853, -1.916985, -2.970676, 0, 0, 0, 1, 1,
-1.178476, 0.3460683, -1.024961, 0, 0, 0, 1, 1,
-1.156029, -1.351732, -2.430209, 1, 1, 1, 1, 1,
-1.154735, 0.2578875, -2.144363, 1, 1, 1, 1, 1,
-1.151209, -0.6463875, -1.323493, 1, 1, 1, 1, 1,
-1.150327, 1.30885, 1.0194, 1, 1, 1, 1, 1,
-1.149158, 0.1598589, -1.488701, 1, 1, 1, 1, 1,
-1.141186, -1.361371, -2.329707, 1, 1, 1, 1, 1,
-1.13596, -1.685973, -1.414554, 1, 1, 1, 1, 1,
-1.133348, -0.3589797, -1.081293, 1, 1, 1, 1, 1,
-1.125778, -0.2758945, -1.233664, 1, 1, 1, 1, 1,
-1.125397, 0.04807881, -1.550953, 1, 1, 1, 1, 1,
-1.124487, 0.2378604, -0.2546399, 1, 1, 1, 1, 1,
-1.117889, -2.09852, -2.897311, 1, 1, 1, 1, 1,
-1.108073, -0.3314055, -2.950431, 1, 1, 1, 1, 1,
-1.106448, -0.5797113, -0.6862612, 1, 1, 1, 1, 1,
-1.100445, -0.85186, -2.155472, 1, 1, 1, 1, 1,
-1.099517, 0.6233286, -0.06271327, 0, 0, 1, 1, 1,
-1.090265, 1.643687, -0.7800195, 1, 0, 0, 1, 1,
-1.085753, 0.7255976, -1.526963, 1, 0, 0, 1, 1,
-1.080503, 1.911182, 1.256779, 1, 0, 0, 1, 1,
-1.074813, 1.738812, -1.465304, 1, 0, 0, 1, 1,
-1.074506, -0.6578254, -1.532728, 1, 0, 0, 1, 1,
-1.072905, 0.4652837, 1.161406, 0, 0, 0, 1, 1,
-1.06897, -1.092597, -1.707741, 0, 0, 0, 1, 1,
-1.057332, 0.1139673, -2.521199, 0, 0, 0, 1, 1,
-1.052326, -0.7004069, -0.7958277, 0, 0, 0, 1, 1,
-1.04933, 0.5791589, -0.298542, 0, 0, 0, 1, 1,
-1.046225, 0.03265032, -2.013602, 0, 0, 0, 1, 1,
-1.039839, 0.2654989, -0.9956762, 0, 0, 0, 1, 1,
-1.007106, -0.4426921, -0.7685439, 1, 1, 1, 1, 1,
-1.006682, 0.8003048, -1.393702, 1, 1, 1, 1, 1,
-1.004352, 0.852233, -1.074033, 1, 1, 1, 1, 1,
-0.9914274, -1.356881, -5.114019, 1, 1, 1, 1, 1,
-0.9906963, -0.8167598, -3.930078, 1, 1, 1, 1, 1,
-0.9873256, -1.075223, -0.9455372, 1, 1, 1, 1, 1,
-0.9865864, -1.306855, -1.728362, 1, 1, 1, 1, 1,
-0.9795867, -0.304298, -3.505705, 1, 1, 1, 1, 1,
-0.9676264, -0.8261725, -2.766455, 1, 1, 1, 1, 1,
-0.9614697, 0.4921079, -1.202152, 1, 1, 1, 1, 1,
-0.9545771, 0.03117678, -0.5728904, 1, 1, 1, 1, 1,
-0.943776, -1.120973, -2.708413, 1, 1, 1, 1, 1,
-0.9385371, 0.2447993, -1.591208, 1, 1, 1, 1, 1,
-0.9378861, 0.3370641, -0.9240115, 1, 1, 1, 1, 1,
-0.9375737, 0.1488119, 0.6486862, 1, 1, 1, 1, 1,
-0.9354662, -0.3126279, -1.105331, 0, 0, 1, 1, 1,
-0.9313974, 0.3170362, -1.50661, 1, 0, 0, 1, 1,
-0.9306256, 1.525996, -2.338608, 1, 0, 0, 1, 1,
-0.9233535, -0.8044761, -1.60529, 1, 0, 0, 1, 1,
-0.9217775, 0.7087308, -0.601425, 1, 0, 0, 1, 1,
-0.9178762, -0.4458478, -2.421476, 1, 0, 0, 1, 1,
-0.9169632, -0.002078006, -2.675059, 0, 0, 0, 1, 1,
-0.9150276, 1.167416, -1.814982, 0, 0, 0, 1, 1,
-0.8986664, -0.6376749, -2.195861, 0, 0, 0, 1, 1,
-0.8967949, -0.88067, -1.946394, 0, 0, 0, 1, 1,
-0.8937613, 0.5343197, 0.119311, 0, 0, 0, 1, 1,
-0.8924868, 0.2920243, -2.281464, 0, 0, 0, 1, 1,
-0.8851536, -0.3067344, -2.987557, 0, 0, 0, 1, 1,
-0.8798713, -3.676924, -4.70788, 1, 1, 1, 1, 1,
-0.8775424, 0.6618182, -0.6862078, 1, 1, 1, 1, 1,
-0.8741044, -0.6938055, -2.493684, 1, 1, 1, 1, 1,
-0.8640751, -0.154062, -0.2689885, 1, 1, 1, 1, 1,
-0.8497829, -2.284619, -3.033942, 1, 1, 1, 1, 1,
-0.8453699, 1.410357, -0.5283236, 1, 1, 1, 1, 1,
-0.8407232, -1.42799, -3.864976, 1, 1, 1, 1, 1,
-0.8396298, 1.57271, 0.2326232, 1, 1, 1, 1, 1,
-0.8389055, 0.2155376, -1.059421, 1, 1, 1, 1, 1,
-0.8348277, -1.941877, -0.9569567, 1, 1, 1, 1, 1,
-0.8311579, 1.403368, 1.080982, 1, 1, 1, 1, 1,
-0.8254298, -0.7875342, -3.711203, 1, 1, 1, 1, 1,
-0.8238978, -0.3263164, -1.261885, 1, 1, 1, 1, 1,
-0.8218489, 0.4163187, -0.7288053, 1, 1, 1, 1, 1,
-0.8214096, 0.7153306, -0.5567238, 1, 1, 1, 1, 1,
-0.8049206, 0.2674944, -3.241923, 0, 0, 1, 1, 1,
-0.8048771, 1.855874, 0.09332068, 1, 0, 0, 1, 1,
-0.8033479, 1.821991, -1.735472, 1, 0, 0, 1, 1,
-0.8010847, 0.6169695, -1.160645, 1, 0, 0, 1, 1,
-0.800135, -0.1667178, -0.5609354, 1, 0, 0, 1, 1,
-0.7979651, 0.8523951, -0.476374, 1, 0, 0, 1, 1,
-0.7933565, 0.1594547, -2.458935, 0, 0, 0, 1, 1,
-0.7892461, -0.2102962, -1.967808, 0, 0, 0, 1, 1,
-0.7861786, -0.8675246, -3.037011, 0, 0, 0, 1, 1,
-0.7845085, 0.04008424, -1.694171, 0, 0, 0, 1, 1,
-0.7816119, -0.154866, -1.675233, 0, 0, 0, 1, 1,
-0.7799911, -0.09089993, 1.33262, 0, 0, 0, 1, 1,
-0.7751995, -1.894487, -2.750964, 0, 0, 0, 1, 1,
-0.7691225, -0.524867, -2.188352, 1, 1, 1, 1, 1,
-0.7647555, 0.332113, -1.719067, 1, 1, 1, 1, 1,
-0.7642325, -1.176299, -1.240184, 1, 1, 1, 1, 1,
-0.762523, -0.05712141, -3.501747, 1, 1, 1, 1, 1,
-0.7609607, 0.1277191, -2.52422, 1, 1, 1, 1, 1,
-0.7594444, -0.3316222, -2.482246, 1, 1, 1, 1, 1,
-0.7551367, 2.17862, -0.04824187, 1, 1, 1, 1, 1,
-0.7518958, 1.781682, -0.9942173, 1, 1, 1, 1, 1,
-0.7508796, 0.8358817, 0.1887498, 1, 1, 1, 1, 1,
-0.750447, 0.5733995, -1.404384, 1, 1, 1, 1, 1,
-0.7502171, -0.3570518, -1.526184, 1, 1, 1, 1, 1,
-0.7414994, 0.7252263, -1.097707, 1, 1, 1, 1, 1,
-0.7318037, 0.4709828, -1.333223, 1, 1, 1, 1, 1,
-0.7283699, -1.999418, -2.957359, 1, 1, 1, 1, 1,
-0.725046, 0.9195108, -1.609817, 1, 1, 1, 1, 1,
-0.7248503, 0.9391087, -0.7911773, 0, 0, 1, 1, 1,
-0.7195236, 0.05394024, -0.06816392, 1, 0, 0, 1, 1,
-0.7172953, 0.7369587, -0.1028991, 1, 0, 0, 1, 1,
-0.713545, 0.3581187, -3.335337, 1, 0, 0, 1, 1,
-0.7131585, -0.5865395, -1.547386, 1, 0, 0, 1, 1,
-0.7130004, 1.057478, -0.6274821, 1, 0, 0, 1, 1,
-0.7124941, 0.6850975, -0.8180797, 0, 0, 0, 1, 1,
-0.7124348, -0.9588162, -2.644554, 0, 0, 0, 1, 1,
-0.7116264, 0.7787786, -0.8329965, 0, 0, 0, 1, 1,
-0.7094932, -1.783539, -2.100423, 0, 0, 0, 1, 1,
-0.7081203, -0.3494721, -3.56594, 0, 0, 0, 1, 1,
-0.7066354, 1.589588, -2.642781, 0, 0, 0, 1, 1,
-0.6968688, -0.8044266, -1.669997, 0, 0, 0, 1, 1,
-0.6919864, -0.3112347, -1.373856, 1, 1, 1, 1, 1,
-0.6900385, 1.914177, -0.6896467, 1, 1, 1, 1, 1,
-0.6869974, 0.8778465, -1.495474, 1, 1, 1, 1, 1,
-0.6840295, -1.243853, -1.493, 1, 1, 1, 1, 1,
-0.6831114, 0.4896078, -1.847245, 1, 1, 1, 1, 1,
-0.6830721, 0.3968888, -0.9576777, 1, 1, 1, 1, 1,
-0.6796222, -0.3152296, -3.113896, 1, 1, 1, 1, 1,
-0.6792215, 0.8616878, -1.414161, 1, 1, 1, 1, 1,
-0.6724201, 0.3540854, 1.510069, 1, 1, 1, 1, 1,
-0.6720449, -0.7370796, -2.454233, 1, 1, 1, 1, 1,
-0.6710207, -0.2373804, -2.848251, 1, 1, 1, 1, 1,
-0.6693585, -2.247791, -4.836687, 1, 1, 1, 1, 1,
-0.6662027, -1.383764, -2.705546, 1, 1, 1, 1, 1,
-0.6610385, -0.5969105, -2.849348, 1, 1, 1, 1, 1,
-0.6591909, -0.9030761, -3.620342, 1, 1, 1, 1, 1,
-0.656925, -0.2165748, -1.473918, 0, 0, 1, 1, 1,
-0.655753, -0.22655, -1.37485, 1, 0, 0, 1, 1,
-0.6534545, 0.9285957, 0.6361539, 1, 0, 0, 1, 1,
-0.6532223, -0.5649371, -1.390048, 1, 0, 0, 1, 1,
-0.6481859, 1.606291, -0.1104585, 1, 0, 0, 1, 1,
-0.6398288, -1.10767, -1.421607, 1, 0, 0, 1, 1,
-0.6384528, 1.397686, -1.582974, 0, 0, 0, 1, 1,
-0.6283602, -0.120659, -1.875126, 0, 0, 0, 1, 1,
-0.6193351, -0.6363531, -1.633791, 0, 0, 0, 1, 1,
-0.600208, 0.03127734, -1.100662, 0, 0, 0, 1, 1,
-0.5961877, -1.094509, -2.820207, 0, 0, 0, 1, 1,
-0.5838189, 1.133601, -1.698574, 0, 0, 0, 1, 1,
-0.5816931, -0.7068107, -3.189014, 0, 0, 0, 1, 1,
-0.5807649, -0.05793658, -1.664961, 1, 1, 1, 1, 1,
-0.5782132, 0.4491858, 0.4198095, 1, 1, 1, 1, 1,
-0.5755052, -0.4746696, -2.133405, 1, 1, 1, 1, 1,
-0.5712678, 1.310249, 2.050427, 1, 1, 1, 1, 1,
-0.569873, 0.2992307, -2.592049, 1, 1, 1, 1, 1,
-0.5693073, -1.745721, -3.189745, 1, 1, 1, 1, 1,
-0.5692055, -1.232731, -2.523705, 1, 1, 1, 1, 1,
-0.5683991, 0.7075641, -0.4897941, 1, 1, 1, 1, 1,
-0.567696, 0.5380924, -2.460647, 1, 1, 1, 1, 1,
-0.5651104, -0.3418847, -1.347776, 1, 1, 1, 1, 1,
-0.56473, 1.200049, -1.331486, 1, 1, 1, 1, 1,
-0.5636681, 0.7451583, -1.889058, 1, 1, 1, 1, 1,
-0.5634815, -1.993593, -3.761641, 1, 1, 1, 1, 1,
-0.5538214, -0.4520229, -0.8218132, 1, 1, 1, 1, 1,
-0.5536095, -0.2269824, -2.26303, 1, 1, 1, 1, 1,
-0.5517811, 0.5516591, -0.3154026, 0, 0, 1, 1, 1,
-0.5497178, -0.4453077, -1.621065, 1, 0, 0, 1, 1,
-0.5454957, 0.3691784, -1.171954, 1, 0, 0, 1, 1,
-0.5352131, 0.3263295, -0.1893634, 1, 0, 0, 1, 1,
-0.5293031, 0.6272623, -0.5818131, 1, 0, 0, 1, 1,
-0.5241174, -0.310273, -3.426121, 1, 0, 0, 1, 1,
-0.5218439, -1.533295, -6.404075, 0, 0, 0, 1, 1,
-0.5217891, -0.4140152, -1.4329, 0, 0, 0, 1, 1,
-0.5153768, 1.754456, 1.659575, 0, 0, 0, 1, 1,
-0.5124242, -0.5236449, -3.88417, 0, 0, 0, 1, 1,
-0.510236, -0.5271103, -1.628033, 0, 0, 0, 1, 1,
-0.5043268, 0.9522088, 0.1089535, 0, 0, 0, 1, 1,
-0.5005002, 0.07057839, -0.3763681, 0, 0, 0, 1, 1,
-0.4997508, 1.132358, -0.2919591, 1, 1, 1, 1, 1,
-0.4959516, -0.7216709, -1.571359, 1, 1, 1, 1, 1,
-0.4917612, -1.055957, -2.700032, 1, 1, 1, 1, 1,
-0.4917278, -1.268615, -3.027954, 1, 1, 1, 1, 1,
-0.4867874, -0.2179988, -1.055057, 1, 1, 1, 1, 1,
-0.4797714, -0.906154, -2.429384, 1, 1, 1, 1, 1,
-0.4751664, 1.277767, -0.2459576, 1, 1, 1, 1, 1,
-0.4675783, 0.3217612, 0.3502933, 1, 1, 1, 1, 1,
-0.4668907, -0.07051832, -2.166747, 1, 1, 1, 1, 1,
-0.4646791, -0.8700228, -3.109467, 1, 1, 1, 1, 1,
-0.4628215, 0.1796256, -4.430146, 1, 1, 1, 1, 1,
-0.4608033, 0.3155432, -1.29459, 1, 1, 1, 1, 1,
-0.4595153, 0.1604186, -1.121845, 1, 1, 1, 1, 1,
-0.4528763, -0.7241009, -3.033922, 1, 1, 1, 1, 1,
-0.4516463, 1.16398, -0.5578133, 1, 1, 1, 1, 1,
-0.4474003, 0.6201845, 0.8136127, 0, 0, 1, 1, 1,
-0.4458309, -0.7203969, -1.649794, 1, 0, 0, 1, 1,
-0.4421582, -2.366927, -4.467044, 1, 0, 0, 1, 1,
-0.4396667, -0.02480975, -1.876918, 1, 0, 0, 1, 1,
-0.4386581, 0.6064922, 1.315351, 1, 0, 0, 1, 1,
-0.4386332, 0.1650694, -1.781768, 1, 0, 0, 1, 1,
-0.4363936, -0.1805686, -2.989739, 0, 0, 0, 1, 1,
-0.4305699, -0.8814946, -3.655926, 0, 0, 0, 1, 1,
-0.4302156, -1.232738, -2.373678, 0, 0, 0, 1, 1,
-0.4286269, 0.9746951, -0.5119337, 0, 0, 0, 1, 1,
-0.4272174, -0.8858436, -2.797024, 0, 0, 0, 1, 1,
-0.4265033, 0.7398164, -1.169807, 0, 0, 0, 1, 1,
-0.4174902, 1.545786, 0.7122961, 0, 0, 0, 1, 1,
-0.4164103, -1.070618, -1.516735, 1, 1, 1, 1, 1,
-0.4089936, 2.314734, 0.8702509, 1, 1, 1, 1, 1,
-0.4051787, 1.213778, 0.01711586, 1, 1, 1, 1, 1,
-0.3964313, 1.225754, 0.1705854, 1, 1, 1, 1, 1,
-0.396096, -0.4160661, -2.859285, 1, 1, 1, 1, 1,
-0.3956797, 0.9155181, -1.399334, 1, 1, 1, 1, 1,
-0.3941092, 0.07102729, -1.124892, 1, 1, 1, 1, 1,
-0.393969, -1.242415, -3.328013, 1, 1, 1, 1, 1,
-0.393337, 2.007796, -0.2536313, 1, 1, 1, 1, 1,
-0.3917776, 2.214785, 0.859334, 1, 1, 1, 1, 1,
-0.3895539, -0.8928534, -2.465298, 1, 1, 1, 1, 1,
-0.3890181, 0.8468941, 0.5259829, 1, 1, 1, 1, 1,
-0.3766704, -0.9246088, -3.684286, 1, 1, 1, 1, 1,
-0.37654, -0.9054028, -3.679667, 1, 1, 1, 1, 1,
-0.3745475, -0.5633413, -1.34637, 1, 1, 1, 1, 1,
-0.374535, -0.4919689, -4.240433, 0, 0, 1, 1, 1,
-0.3735199, 1.874035, 0.1892889, 1, 0, 0, 1, 1,
-0.371939, -0.2885422, -2.51808, 1, 0, 0, 1, 1,
-0.3715003, 0.02036476, -2.148233, 1, 0, 0, 1, 1,
-0.3705459, 0.5414046, 0.08394841, 1, 0, 0, 1, 1,
-0.3674346, -0.04984948, -1.801774, 1, 0, 0, 1, 1,
-0.3567459, 0.3804519, 0.0357983, 0, 0, 0, 1, 1,
-0.3488289, -0.03198459, -3.634359, 0, 0, 0, 1, 1,
-0.3478211, -1.214878, -3.278475, 0, 0, 0, 1, 1,
-0.3476932, 0.1528293, -1.038973, 0, 0, 0, 1, 1,
-0.3463114, 0.07320584, 0.08992627, 0, 0, 0, 1, 1,
-0.3409077, -0.3314268, -3.997704, 0, 0, 0, 1, 1,
-0.3394482, -2.147229, -3.316984, 0, 0, 0, 1, 1,
-0.3332578, -0.6236906, -1.977788, 1, 1, 1, 1, 1,
-0.3307946, -0.1144171, -3.794958, 1, 1, 1, 1, 1,
-0.3275691, 1.70099, -1.40318, 1, 1, 1, 1, 1,
-0.326871, -0.4565768, -4.424754, 1, 1, 1, 1, 1,
-0.325106, -2.385149, -1.015812, 1, 1, 1, 1, 1,
-0.3228133, -0.1607152, -1.818498, 1, 1, 1, 1, 1,
-0.322559, 0.4856902, 0.4818208, 1, 1, 1, 1, 1,
-0.3215471, -1.006612, -0.5118597, 1, 1, 1, 1, 1,
-0.3200051, -2.090618, -3.820215, 1, 1, 1, 1, 1,
-0.317694, -0.1475738, -1.408489, 1, 1, 1, 1, 1,
-0.3166823, -1.636136, -3.511215, 1, 1, 1, 1, 1,
-0.3135116, -0.529027, -3.829597, 1, 1, 1, 1, 1,
-0.3080924, 1.93837, 0.1097329, 1, 1, 1, 1, 1,
-0.3071783, 0.9684119, 1.122484, 1, 1, 1, 1, 1,
-0.3049161, -0.4904759, -3.305136, 1, 1, 1, 1, 1,
-0.3033256, 1.321469, 0.3162687, 0, 0, 1, 1, 1,
-0.3001447, -1.826216, -2.455957, 1, 0, 0, 1, 1,
-0.2970086, -0.789876, -3.113597, 1, 0, 0, 1, 1,
-0.2924518, 0.9562975, 1.00979, 1, 0, 0, 1, 1,
-0.2870222, 0.3226314, -1.00109, 1, 0, 0, 1, 1,
-0.284813, 1.652679, -0.7886027, 1, 0, 0, 1, 1,
-0.28435, 0.4049164, -0.5035858, 0, 0, 0, 1, 1,
-0.2750705, -0.7406009, -2.947877, 0, 0, 0, 1, 1,
-0.2737359, -0.08683537, -2.084401, 0, 0, 0, 1, 1,
-0.2707653, 0.2364366, 0.7839462, 0, 0, 0, 1, 1,
-0.2677891, -0.04076036, -2.30651, 0, 0, 0, 1, 1,
-0.2665593, 1.558833, 0.476418, 0, 0, 0, 1, 1,
-0.2639836, -1.851646, -1.909555, 0, 0, 0, 1, 1,
-0.2611755, -0.5768006, -3.609724, 1, 1, 1, 1, 1,
-0.2575012, -0.07206722, -2.271523, 1, 1, 1, 1, 1,
-0.2574371, 0.5798219, -1.586027, 1, 1, 1, 1, 1,
-0.2557035, 1.529067, -1.197753, 1, 1, 1, 1, 1,
-0.2519081, 1.099878, 0.1319627, 1, 1, 1, 1, 1,
-0.2502556, 0.1587246, -1.367073, 1, 1, 1, 1, 1,
-0.2496573, -1.041269, -2.380305, 1, 1, 1, 1, 1,
-0.246347, 2.114898, -0.9391571, 1, 1, 1, 1, 1,
-0.245424, -2.257928, -3.070858, 1, 1, 1, 1, 1,
-0.2408451, -0.7175649, -1.240172, 1, 1, 1, 1, 1,
-0.2380992, 1.666654, -0.4469515, 1, 1, 1, 1, 1,
-0.2376924, -1.353053, -2.980658, 1, 1, 1, 1, 1,
-0.227731, -0.03205933, -0.2946285, 1, 1, 1, 1, 1,
-0.2273223, -0.3900222, -3.630909, 1, 1, 1, 1, 1,
-0.2208966, -0.0182935, -2.118082, 1, 1, 1, 1, 1,
-0.220654, -0.3182865, -2.53312, 0, 0, 1, 1, 1,
-0.217661, 1.36503, 0.8037605, 1, 0, 0, 1, 1,
-0.2128803, -0.3954163, -2.341563, 1, 0, 0, 1, 1,
-0.2078827, -1.612978, -3.622553, 1, 0, 0, 1, 1,
-0.2074685, -0.775551, -3.785481, 1, 0, 0, 1, 1,
-0.2067164, 1.342261, 0.772974, 1, 0, 0, 1, 1,
-0.2054163, -1.2469, -2.48021, 0, 0, 0, 1, 1,
-0.2052188, 1.642909, 0.0570905, 0, 0, 0, 1, 1,
-0.2012492, 0.3076459, -0.1854798, 0, 0, 0, 1, 1,
-0.1981436, 0.5671546, -1.093314, 0, 0, 0, 1, 1,
-0.1960125, 0.8447596, -1.646219, 0, 0, 0, 1, 1,
-0.19527, -0.009527314, -1.608714, 0, 0, 0, 1, 1,
-0.194881, 0.1710514, 0.1459208, 0, 0, 0, 1, 1,
-0.189677, 1.763898, -0.8261158, 1, 1, 1, 1, 1,
-0.1874125, 0.06745677, -1.08753, 1, 1, 1, 1, 1,
-0.1844093, 0.1619734, -2.522092, 1, 1, 1, 1, 1,
-0.180061, -0.005674483, -2.765599, 1, 1, 1, 1, 1,
-0.1747317, -0.09772509, -1.23152, 1, 1, 1, 1, 1,
-0.1743132, 1.537816, -1.276164, 1, 1, 1, 1, 1,
-0.170379, -1.060253, -1.838108, 1, 1, 1, 1, 1,
-0.1639253, 0.4852512, -0.9191715, 1, 1, 1, 1, 1,
-0.160466, -1.055185, -4.042864, 1, 1, 1, 1, 1,
-0.1597108, -0.2484064, -2.102677, 1, 1, 1, 1, 1,
-0.1578134, 0.9979714, 0.4437766, 1, 1, 1, 1, 1,
-0.1537883, 0.8030323, -0.03396125, 1, 1, 1, 1, 1,
-0.1517568, -0.4270358, -1.610532, 1, 1, 1, 1, 1,
-0.1513378, -0.4380556, -4.05221, 1, 1, 1, 1, 1,
-0.1496156, -1.484576, -2.340781, 1, 1, 1, 1, 1,
-0.1470808, 0.2348874, -0.01805315, 0, 0, 1, 1, 1,
-0.1456853, -0.878919, -3.262307, 1, 0, 0, 1, 1,
-0.1456622, 0.1848817, -1.870794, 1, 0, 0, 1, 1,
-0.1404227, -1.218851, -2.473203, 1, 0, 0, 1, 1,
-0.1395804, 0.4026295, -0.5299324, 1, 0, 0, 1, 1,
-0.1395132, -0.2032213, -2.553673, 1, 0, 0, 1, 1,
-0.1324992, -1.408149, -2.402039, 0, 0, 0, 1, 1,
-0.1323037, -0.7289728, -2.087115, 0, 0, 0, 1, 1,
-0.1318352, -1.466356, -3.077423, 0, 0, 0, 1, 1,
-0.1314293, -1.153815, -1.585091, 0, 0, 0, 1, 1,
-0.129339, 1.83689, -1.04479, 0, 0, 0, 1, 1,
-0.1275605, 0.3143505, -1.657117, 0, 0, 0, 1, 1,
-0.1232986, -0.1880469, -2.797541, 0, 0, 0, 1, 1,
-0.1228902, -0.2351175, -4.346717, 1, 1, 1, 1, 1,
-0.1212312, -1.033479, -1.695629, 1, 1, 1, 1, 1,
-0.1204922, 0.1384001, -0.3038943, 1, 1, 1, 1, 1,
-0.1181527, 0.8307236, 0.4753125, 1, 1, 1, 1, 1,
-0.1181514, 0.2600383, -0.4785811, 1, 1, 1, 1, 1,
-0.1181035, 0.5089161, -1.897501, 1, 1, 1, 1, 1,
-0.1169058, 0.6993532, -1.71144, 1, 1, 1, 1, 1,
-0.1152294, 0.6735436, -1.012149, 1, 1, 1, 1, 1,
-0.1123702, 0.4164556, 0.0003068153, 1, 1, 1, 1, 1,
-0.1083705, 0.4190671, 0.3336303, 1, 1, 1, 1, 1,
-0.1064559, -0.2699492, -4.318974, 1, 1, 1, 1, 1,
-0.1050014, -0.6021492, -2.504972, 1, 1, 1, 1, 1,
-0.09892359, -0.9775037, -2.341499, 1, 1, 1, 1, 1,
-0.09743709, 0.04619587, -1.22997, 1, 1, 1, 1, 1,
-0.09661336, -0.8182451, -1.655047, 1, 1, 1, 1, 1,
-0.09621979, -0.3314769, -1.99706, 0, 0, 1, 1, 1,
-0.09503693, 0.6675054, -0.6456873, 1, 0, 0, 1, 1,
-0.09334821, 0.2756178, -0.5261856, 1, 0, 0, 1, 1,
-0.09273592, 1.605243, -1.094073, 1, 0, 0, 1, 1,
-0.0882317, 0.4564426, 0.0560094, 1, 0, 0, 1, 1,
-0.08760852, -0.2781177, -4.482578, 1, 0, 0, 1, 1,
-0.07229614, -0.08692944, 0.1143975, 0, 0, 0, 1, 1,
-0.07219982, -1.149443, -3.379922, 0, 0, 0, 1, 1,
-0.07054694, -0.2836064, -2.635686, 0, 0, 0, 1, 1,
-0.06805258, 1.030229, -0.4105888, 0, 0, 0, 1, 1,
-0.06682522, 0.8452205, 0.6301523, 0, 0, 0, 1, 1,
-0.06462744, -0.1652146, -3.726279, 0, 0, 0, 1, 1,
-0.06417432, -0.7926511, -1.014654, 0, 0, 0, 1, 1,
-0.05684865, 0.1301973, -1.54214, 1, 1, 1, 1, 1,
-0.05668034, -0.872328, -4.339299, 1, 1, 1, 1, 1,
-0.05577041, -2.807607, -3.596976, 1, 1, 1, 1, 1,
-0.05445444, -1.07332, -3.934597, 1, 1, 1, 1, 1,
-0.05366443, 0.6022013, 0.7158287, 1, 1, 1, 1, 1,
-0.05146972, 0.44716, 0.7667632, 1, 1, 1, 1, 1,
-0.051372, -1.468747, -2.714087, 1, 1, 1, 1, 1,
-0.04978881, 1.338667, -0.8750563, 1, 1, 1, 1, 1,
-0.04953692, -1.943664, -4.781919, 1, 1, 1, 1, 1,
-0.04676257, 0.1997212, 0.06026362, 1, 1, 1, 1, 1,
-0.04560756, 0.9817293, 0.7587376, 1, 1, 1, 1, 1,
-0.04521586, 0.3198297, 1.108695, 1, 1, 1, 1, 1,
-0.04411156, -1.931056, -4.258946, 1, 1, 1, 1, 1,
-0.03910615, 1.147266, 2.600112, 1, 1, 1, 1, 1,
-0.03879824, -0.2332005, -4.199864, 1, 1, 1, 1, 1,
-0.03797241, -0.3055976, -3.633286, 0, 0, 1, 1, 1,
-0.03792547, -0.7878556, -3.10995, 1, 0, 0, 1, 1,
-0.03611011, 0.09670965, -0.4567787, 1, 0, 0, 1, 1,
-0.02725555, -0.7876123, -3.880843, 1, 0, 0, 1, 1,
-0.024256, -0.8371792, -2.066515, 1, 0, 0, 1, 1,
-0.02153541, -0.4318246, -2.638951, 1, 0, 0, 1, 1,
-0.0139359, -0.9445325, -5.580059, 0, 0, 0, 1, 1,
-0.01092424, -0.5038896, -1.536895, 0, 0, 0, 1, 1,
-0.01008677, 0.4709947, 0.8382066, 0, 0, 0, 1, 1,
-0.00934488, -0.7675155, -2.424513, 0, 0, 0, 1, 1,
-0.006732382, -1.144289, -2.011689, 0, 0, 0, 1, 1,
-0.004650589, 0.9062089, 0.2161469, 0, 0, 0, 1, 1,
-0.004428513, -0.5309861, -2.631639, 0, 0, 0, 1, 1,
-0.0007044275, 0.3215428, -0.4148417, 1, 1, 1, 1, 1,
-5.727735e-05, 0.1869453, 0.8395718, 1, 1, 1, 1, 1,
0.002750353, 0.3573179, -0.7290498, 1, 1, 1, 1, 1,
0.00512365, 0.1564037, -0.2601126, 1, 1, 1, 1, 1,
0.005629679, 0.733036, 0.8656224, 1, 1, 1, 1, 1,
0.007309507, 0.7379564, -0.09903518, 1, 1, 1, 1, 1,
0.007409689, -1.440995, 3.790491, 1, 1, 1, 1, 1,
0.01405733, 1.770297, 0.08834421, 1, 1, 1, 1, 1,
0.01596331, 1.155517, 0.4974857, 1, 1, 1, 1, 1,
0.01633056, 1.954188, -0.695735, 1, 1, 1, 1, 1,
0.01769801, 0.6752343, 1.32397, 1, 1, 1, 1, 1,
0.0178325, -0.8861171, 4.998752, 1, 1, 1, 1, 1,
0.02324836, -0.4756922, 2.7523, 1, 1, 1, 1, 1,
0.02372724, -0.5822827, 3.001963, 1, 1, 1, 1, 1,
0.02430834, -0.2473146, 4.430868, 1, 1, 1, 1, 1,
0.02471683, 0.6512658, 1.474561, 0, 0, 1, 1, 1,
0.03013602, 0.7445325, 1.931659, 1, 0, 0, 1, 1,
0.03089929, 0.7394373, 1.534213, 1, 0, 0, 1, 1,
0.03540593, 0.4680952, 0.9681925, 1, 0, 0, 1, 1,
0.0376046, -1.480122, 3.090126, 1, 0, 0, 1, 1,
0.03821673, 0.4312933, -1.411262, 1, 0, 0, 1, 1,
0.03829023, -0.4024421, 2.493894, 0, 0, 0, 1, 1,
0.0384648, 1.576972, 0.1073127, 0, 0, 0, 1, 1,
0.04640157, 0.1560547, 0.03276001, 0, 0, 0, 1, 1,
0.05144366, 3.32394, 0.4967168, 0, 0, 0, 1, 1,
0.05348316, -0.7552318, 3.555479, 0, 0, 0, 1, 1,
0.05470858, -0.1750349, 3.859562, 0, 0, 0, 1, 1,
0.05476418, 0.3776706, 1.886693, 0, 0, 0, 1, 1,
0.0574406, -2.733372, 4.78859, 1, 1, 1, 1, 1,
0.06149323, -0.1232108, 1.796856, 1, 1, 1, 1, 1,
0.06262449, 0.9155765, -0.6320302, 1, 1, 1, 1, 1,
0.06829794, 0.4889611, 0.5349644, 1, 1, 1, 1, 1,
0.0684732, 0.4364274, 0.1973453, 1, 1, 1, 1, 1,
0.06955609, -1.060468, 3.523535, 1, 1, 1, 1, 1,
0.06979786, -0.3254845, 3.302587, 1, 1, 1, 1, 1,
0.07337619, -0.4989669, 2.735476, 1, 1, 1, 1, 1,
0.07395013, -0.2885914, 1.984316, 1, 1, 1, 1, 1,
0.0757084, 1.173629, -0.9430238, 1, 1, 1, 1, 1,
0.07926638, -0.4331961, 2.280947, 1, 1, 1, 1, 1,
0.07991104, -1.241798, 1.438897, 1, 1, 1, 1, 1,
0.08379413, -0.4230268, 2.939349, 1, 1, 1, 1, 1,
0.08475394, -0.7216603, 2.862687, 1, 1, 1, 1, 1,
0.08585628, 0.1606342, 0.03866949, 1, 1, 1, 1, 1,
0.09012438, -0.1979893, 2.981159, 0, 0, 1, 1, 1,
0.0976484, 0.6562939, -0.4291584, 1, 0, 0, 1, 1,
0.09982068, 0.4160512, 0.04615027, 1, 0, 0, 1, 1,
0.1018564, -0.7380767, 2.746912, 1, 0, 0, 1, 1,
0.1042347, -1.887762, 2.642586, 1, 0, 0, 1, 1,
0.1044996, -1.001655, 3.598266, 1, 0, 0, 1, 1,
0.1054569, -1.017781, 5.190762, 0, 0, 0, 1, 1,
0.1072487, 0.5546296, 0.649174, 0, 0, 0, 1, 1,
0.1082029, 0.6495531, -0.04958015, 0, 0, 0, 1, 1,
0.1113489, 1.522141, -0.7591714, 0, 0, 0, 1, 1,
0.1135288, -0.9971877, 2.08719, 0, 0, 0, 1, 1,
0.1164138, 0.3183808, -0.8556172, 0, 0, 0, 1, 1,
0.1195257, -1.519569, 1.660427, 0, 0, 0, 1, 1,
0.1221548, 0.7100462, -1.2859, 1, 1, 1, 1, 1,
0.1319913, -0.1644465, 2.052288, 1, 1, 1, 1, 1,
0.1322613, 0.932472, 0.1272252, 1, 1, 1, 1, 1,
0.1337784, 0.282887, 0.3420771, 1, 1, 1, 1, 1,
0.1367836, -1.29882, 3.756485, 1, 1, 1, 1, 1,
0.1381785, -0.6207203, 2.887132, 1, 1, 1, 1, 1,
0.1385492, -0.881009, 2.649865, 1, 1, 1, 1, 1,
0.1416528, 0.4085415, 2.145849, 1, 1, 1, 1, 1,
0.1520831, 1.624938, -0.2201243, 1, 1, 1, 1, 1,
0.1521085, 1.249603, 0.4877407, 1, 1, 1, 1, 1,
0.1560755, 1.122428, -2.534675, 1, 1, 1, 1, 1,
0.1566208, -0.0856554, 2.000845, 1, 1, 1, 1, 1,
0.1570259, 0.7750108, -2.052346, 1, 1, 1, 1, 1,
0.1680257, -1.126283, 3.077114, 1, 1, 1, 1, 1,
0.1707419, -0.02733566, 3.292393, 1, 1, 1, 1, 1,
0.1780033, -0.7243825, 3.536759, 0, 0, 1, 1, 1,
0.1784506, -0.3388718, 1.89855, 1, 0, 0, 1, 1,
0.180024, 1.279173, 0.2092011, 1, 0, 0, 1, 1,
0.1803149, 0.07579831, 2.162937, 1, 0, 0, 1, 1,
0.1821013, -0.1429361, 3.035133, 1, 0, 0, 1, 1,
0.1859681, -1.700221, 3.827518, 1, 0, 0, 1, 1,
0.1865434, -0.8135698, 3.97321, 0, 0, 0, 1, 1,
0.1897031, 0.6634415, -1.607861, 0, 0, 0, 1, 1,
0.1972613, -1.422086, 1.941955, 0, 0, 0, 1, 1,
0.2006265, -0.8104432, 2.922474, 0, 0, 0, 1, 1,
0.2009662, 0.5101265, 2.20574, 0, 0, 0, 1, 1,
0.2020417, 0.9238632, -1.623161, 0, 0, 0, 1, 1,
0.2038471, 0.007575011, -0.04559681, 0, 0, 0, 1, 1,
0.2053986, -0.8479887, 0.9665252, 1, 1, 1, 1, 1,
0.2054811, 1.422518, 0.9173868, 1, 1, 1, 1, 1,
0.2058265, 0.0274326, -0.1344549, 1, 1, 1, 1, 1,
0.2087062, 0.5057506, -0.09702113, 1, 1, 1, 1, 1,
0.2089604, 0.6341949, 1.053501, 1, 1, 1, 1, 1,
0.2134436, 0.8275408, 1.83513, 1, 1, 1, 1, 1,
0.2197108, -0.7494127, 2.484813, 1, 1, 1, 1, 1,
0.2201152, 0.8386424, 0.2460148, 1, 1, 1, 1, 1,
0.2213286, 0.6220794, -1.932461, 1, 1, 1, 1, 1,
0.2229383, 2.207384, 0.4739364, 1, 1, 1, 1, 1,
0.2253996, -1.21373, 5.033861, 1, 1, 1, 1, 1,
0.2270658, 1.138055, 0.4639523, 1, 1, 1, 1, 1,
0.2282165, -0.7868108, 3.245126, 1, 1, 1, 1, 1,
0.2303877, -0.7666547, 1.431717, 1, 1, 1, 1, 1,
0.2342158, 1.171887, -0.6685917, 1, 1, 1, 1, 1,
0.236698, 0.2100058, 0.08153582, 0, 0, 1, 1, 1,
0.2419301, -0.9278943, 3.428374, 1, 0, 0, 1, 1,
0.2479129, 1.41013, 0.6481918, 1, 0, 0, 1, 1,
0.25761, 0.6406335, 2.293777, 1, 0, 0, 1, 1,
0.2598799, -1.81879, 3.36757, 1, 0, 0, 1, 1,
0.2608408, 0.106139, 2.712639, 1, 0, 0, 1, 1,
0.2627269, -0.1628747, 2.141301, 0, 0, 0, 1, 1,
0.2641134, 0.1029511, 1.641885, 0, 0, 0, 1, 1,
0.2692873, 0.6409214, -0.6232457, 0, 0, 0, 1, 1,
0.2710791, 0.8108085, 1.495563, 0, 0, 0, 1, 1,
0.2795089, 0.783415, 1.547408, 0, 0, 0, 1, 1,
0.2819862, 1.585086, -0.8027684, 0, 0, 0, 1, 1,
0.282006, 0.4196177, 0.4104626, 0, 0, 0, 1, 1,
0.2843149, 1.500461, 1.185637, 1, 1, 1, 1, 1,
0.2890927, -2.236387, 3.13246, 1, 1, 1, 1, 1,
0.2957991, 0.6659632, -0.5658079, 1, 1, 1, 1, 1,
0.2972482, 0.2198135, 0.7066125, 1, 1, 1, 1, 1,
0.3065678, 1.133692, 0.5198557, 1, 1, 1, 1, 1,
0.308138, -0.07641263, 0.4767464, 1, 1, 1, 1, 1,
0.3092781, 1.035924, 0.1168726, 1, 1, 1, 1, 1,
0.3126373, 1.200084, 0.1641495, 1, 1, 1, 1, 1,
0.3129714, -0.5781329, 2.303956, 1, 1, 1, 1, 1,
0.3162422, 0.9607527, -1.525678, 1, 1, 1, 1, 1,
0.3188552, -1.05313, 2.48, 1, 1, 1, 1, 1,
0.3196408, -0.6131667, 4.19009, 1, 1, 1, 1, 1,
0.3216068, 1.483017, 0.3813679, 1, 1, 1, 1, 1,
0.3250289, -1.159806, 1.529762, 1, 1, 1, 1, 1,
0.326944, -0.7042174, 2.182249, 1, 1, 1, 1, 1,
0.3269703, 0.946969, 0.8133519, 0, 0, 1, 1, 1,
0.3295789, 2.004902, 0.5763947, 1, 0, 0, 1, 1,
0.3310933, -0.1464395, 2.569538, 1, 0, 0, 1, 1,
0.3317429, 0.1842014, 1.386938, 1, 0, 0, 1, 1,
0.3331598, -0.7142266, 2.902679, 1, 0, 0, 1, 1,
0.3406342, -0.3580521, 2.284182, 1, 0, 0, 1, 1,
0.3421418, -0.8766164, 3.949548, 0, 0, 0, 1, 1,
0.3484004, 0.2039056, 0.8038737, 0, 0, 0, 1, 1,
0.3491871, -0.06376352, 2.535389, 0, 0, 0, 1, 1,
0.349853, -0.7413905, 1.325168, 0, 0, 0, 1, 1,
0.352011, -2.566112, 2.89569, 0, 0, 0, 1, 1,
0.3521805, -0.6652149, 1.738895, 0, 0, 0, 1, 1,
0.3523867, -0.7973391, 2.445008, 0, 0, 0, 1, 1,
0.3570439, -0.3838615, 2.967846, 1, 1, 1, 1, 1,
0.3616958, 0.134374, 0.6731265, 1, 1, 1, 1, 1,
0.362885, -0.5214437, 3.305253, 1, 1, 1, 1, 1,
0.3633071, -1.207801, 3.640587, 1, 1, 1, 1, 1,
0.3651229, -0.0805926, 1.925872, 1, 1, 1, 1, 1,
0.3676261, -1.335154, 3.643277, 1, 1, 1, 1, 1,
0.3705159, 1.439754, 0.6220564, 1, 1, 1, 1, 1,
0.3707036, -0.518012, 3.357446, 1, 1, 1, 1, 1,
0.3777792, 2.012931, -0.9859086, 1, 1, 1, 1, 1,
0.378419, -0.5423067, 3.517094, 1, 1, 1, 1, 1,
0.382861, 0.2095487, -1.407239, 1, 1, 1, 1, 1,
0.3848454, 2.393778, -0.7629991, 1, 1, 1, 1, 1,
0.38904, -0.330734, 1.307803, 1, 1, 1, 1, 1,
0.3917587, 1.2118, -0.3656251, 1, 1, 1, 1, 1,
0.3979273, 0.02489212, 1.045104, 1, 1, 1, 1, 1,
0.4035679, 0.09380662, 1.006434, 0, 0, 1, 1, 1,
0.4037893, 0.1459347, 1.538994, 1, 0, 0, 1, 1,
0.4055117, -1.820261, 2.173295, 1, 0, 0, 1, 1,
0.4069841, -0.3702942, 1.801678, 1, 0, 0, 1, 1,
0.4072262, -0.7228872, 1.087735, 1, 0, 0, 1, 1,
0.4085003, 1.500101, 0.5957574, 1, 0, 0, 1, 1,
0.4117818, 0.8189872, 1.910133, 0, 0, 0, 1, 1,
0.4122416, 0.7517456, 0.3130793, 0, 0, 0, 1, 1,
0.4132485, -0.6708763, 1.561474, 0, 0, 0, 1, 1,
0.4161414, 2.051015, -0.6775908, 0, 0, 0, 1, 1,
0.4236656, 0.65264, 0.01594577, 0, 0, 0, 1, 1,
0.4255193, 0.1212919, 0.5342475, 0, 0, 0, 1, 1,
0.4340449, 1.201546, 0.3647897, 0, 0, 0, 1, 1,
0.4343651, 0.3633593, 0.4651312, 1, 1, 1, 1, 1,
0.4353039, 1.815028, 0.8012618, 1, 1, 1, 1, 1,
0.4358087, 0.9225383, 1.787122, 1, 1, 1, 1, 1,
0.4379719, 0.3596618, -1.396952, 1, 1, 1, 1, 1,
0.4380145, 0.9314103, 0.01499797, 1, 1, 1, 1, 1,
0.4388435, -0.3372535, 2.349014, 1, 1, 1, 1, 1,
0.4471977, -0.362253, 1.579383, 1, 1, 1, 1, 1,
0.4475639, -1.172096, 1.834512, 1, 1, 1, 1, 1,
0.4479738, 0.07310928, 2.520247, 1, 1, 1, 1, 1,
0.4489917, 0.386857, 1.754472, 1, 1, 1, 1, 1,
0.4504786, -0.1651447, 2.064577, 1, 1, 1, 1, 1,
0.4527099, 0.350098, -0.7029042, 1, 1, 1, 1, 1,
0.4590979, 1.293602, 0.3927576, 1, 1, 1, 1, 1,
0.4593703, 0.3389026, 2.202177, 1, 1, 1, 1, 1,
0.4603797, -2.158708, 3.196543, 1, 1, 1, 1, 1,
0.4608753, -0.4408752, 3.812896, 0, 0, 1, 1, 1,
0.4631793, 2.815031, 1.112411, 1, 0, 0, 1, 1,
0.4640139, 0.7248068, 1.786749, 1, 0, 0, 1, 1,
0.4640296, 0.07778692, 0.9361398, 1, 0, 0, 1, 1,
0.4693026, -0.5261699, 2.466455, 1, 0, 0, 1, 1,
0.4706981, 0.9065214, 0.808793, 1, 0, 0, 1, 1,
0.4711868, -3.065719, 2.191572, 0, 0, 0, 1, 1,
0.4804983, 0.4471931, 0.8423928, 0, 0, 0, 1, 1,
0.4880719, -0.356991, 3.931894, 0, 0, 0, 1, 1,
0.4911747, 0.9349778, 0.07461978, 0, 0, 0, 1, 1,
0.4919432, -1.735722, 3.24962, 0, 0, 0, 1, 1,
0.500268, 0.04678255, 1.51632, 0, 0, 0, 1, 1,
0.5003611, -0.8276885, 3.899997, 0, 0, 0, 1, 1,
0.5045096, 0.7055327, -0.02488134, 1, 1, 1, 1, 1,
0.5094215, 1.365695, 1.090637, 1, 1, 1, 1, 1,
0.5177974, 1.391111, 0.2929508, 1, 1, 1, 1, 1,
0.5287044, -0.04214779, 0.1328839, 1, 1, 1, 1, 1,
0.5295627, 0.1846619, 2.745419, 1, 1, 1, 1, 1,
0.5298552, -0.7346838, 3.040905, 1, 1, 1, 1, 1,
0.5325233, -1.112991, 3.711862, 1, 1, 1, 1, 1,
0.5328703, -1.419156, 2.640217, 1, 1, 1, 1, 1,
0.5374268, -0.05913152, 1.50991, 1, 1, 1, 1, 1,
0.543075, -0.4636813, 3.525534, 1, 1, 1, 1, 1,
0.5461834, -1.096448, 2.259754, 1, 1, 1, 1, 1,
0.5480611, -0.1483885, 1.416514, 1, 1, 1, 1, 1,
0.5490861, 0.02699926, 0.5279617, 1, 1, 1, 1, 1,
0.5550545, 0.6929937, 0.4476018, 1, 1, 1, 1, 1,
0.5565478, -1.811649, 3.183963, 1, 1, 1, 1, 1,
0.5641837, -1.019569, 3.065361, 0, 0, 1, 1, 1,
0.5686796, -0.4692766, 3.559739, 1, 0, 0, 1, 1,
0.572404, -0.7551384, 1.960001, 1, 0, 0, 1, 1,
0.5760617, 0.1540737, 2.500833, 1, 0, 0, 1, 1,
0.5767842, -0.9913489, 0.4222721, 1, 0, 0, 1, 1,
0.5860197, 1.043324, 0.247946, 1, 0, 0, 1, 1,
0.5944257, 0.6336755, 1.549009, 0, 0, 0, 1, 1,
0.6017621, -1.10173, 1.093035, 0, 0, 0, 1, 1,
0.6032384, 0.6279696, 2.355888, 0, 0, 0, 1, 1,
0.6037813, -1.757897, 3.848264, 0, 0, 0, 1, 1,
0.6043168, 1.061056, 0.3134, 0, 0, 0, 1, 1,
0.6058463, 0.2055281, 2.329612, 0, 0, 0, 1, 1,
0.6117587, -0.002973265, 0.2102, 0, 0, 0, 1, 1,
0.6183823, -0.9822104, 2.445674, 1, 1, 1, 1, 1,
0.6186706, 0.1244896, 1.771073, 1, 1, 1, 1, 1,
0.6217971, -1.539698, 3.936006, 1, 1, 1, 1, 1,
0.6222093, -2.610401, 3.855577, 1, 1, 1, 1, 1,
0.6255721, 0.205414, 0.1529027, 1, 1, 1, 1, 1,
0.6268381, -0.4449542, 3.035244, 1, 1, 1, 1, 1,
0.6312611, 0.2599708, -0.3068651, 1, 1, 1, 1, 1,
0.6341827, 0.6924762, -1.433946, 1, 1, 1, 1, 1,
0.6375539, 0.70362, 2.341272, 1, 1, 1, 1, 1,
0.6415589, 0.3412781, 0.7491042, 1, 1, 1, 1, 1,
0.6559901, -0.9946977, 2.853573, 1, 1, 1, 1, 1,
0.6564606, 0.2288614, 0.5910084, 1, 1, 1, 1, 1,
0.6575856, -0.8664647, 3.170194, 1, 1, 1, 1, 1,
0.6645119, -0.917551, 2.178723, 1, 1, 1, 1, 1,
0.6677616, -1.58347, 2.774921, 1, 1, 1, 1, 1,
0.6682525, 1.591951, 0.5193797, 0, 0, 1, 1, 1,
0.6776321, 0.04807176, 1.453297, 1, 0, 0, 1, 1,
0.6783448, -0.6048636, 2.5207, 1, 0, 0, 1, 1,
0.6787011, -0.06188773, 4.101959, 1, 0, 0, 1, 1,
0.6804152, 0.7805456, 3.166613, 1, 0, 0, 1, 1,
0.6805699, 0.02797519, 0.9092538, 1, 0, 0, 1, 1,
0.6848121, -1.102848, 2.199208, 0, 0, 0, 1, 1,
0.6913944, -0.3638526, 2.510555, 0, 0, 0, 1, 1,
0.6964781, 0.9990957, 0.2522544, 0, 0, 0, 1, 1,
0.7017806, -1.084277, 1.969583, 0, 0, 0, 1, 1,
0.7024857, -0.7183107, 3.776823, 0, 0, 0, 1, 1,
0.7047161, 0.8284141, 0.318233, 0, 0, 0, 1, 1,
0.707217, -2.238107, 4.894274, 0, 0, 0, 1, 1,
0.7098168, -0.1710937, 2.03745, 1, 1, 1, 1, 1,
0.7127758, -0.2094086, 3.272664, 1, 1, 1, 1, 1,
0.7137245, 1.125913, 0.739008, 1, 1, 1, 1, 1,
0.7187759, 0.01890091, 1.912856, 1, 1, 1, 1, 1,
0.7291656, -1.430304, 2.34587, 1, 1, 1, 1, 1,
0.7302228, 0.9321668, 1.304327, 1, 1, 1, 1, 1,
0.7352418, -0.2167307, 3.124888, 1, 1, 1, 1, 1,
0.7527307, 1.356257, 0.8173379, 1, 1, 1, 1, 1,
0.7638937, 0.1704527, 2.137908, 1, 1, 1, 1, 1,
0.7683275, 0.8650426, 0.8545974, 1, 1, 1, 1, 1,
0.7684844, -1.141473, 4.211783, 1, 1, 1, 1, 1,
0.7690652, -0.04429293, -0.2388431, 1, 1, 1, 1, 1,
0.7691693, 0.1216123, 2.635389, 1, 1, 1, 1, 1,
0.7700911, 0.6431945, 2.207216, 1, 1, 1, 1, 1,
0.7717826, 0.270697, 0.3165275, 1, 1, 1, 1, 1,
0.7806792, -0.4024594, -0.2377269, 0, 0, 1, 1, 1,
0.7830107, 0.3750651, 0.7872294, 1, 0, 0, 1, 1,
0.7898386, -0.8856533, 1.402732, 1, 0, 0, 1, 1,
0.7928846, 0.3263555, 2.542282, 1, 0, 0, 1, 1,
0.7971851, -0.0779302, 2.695141, 1, 0, 0, 1, 1,
0.8000768, -0.1351723, 0.3877562, 1, 0, 0, 1, 1,
0.802746, 0.265078, 1.567979, 0, 0, 0, 1, 1,
0.8087821, 0.3426665, 1.325324, 0, 0, 0, 1, 1,
0.811837, 0.4074502, -0.3370478, 0, 0, 0, 1, 1,
0.8134853, -0.8853171, 0.3489636, 0, 0, 0, 1, 1,
0.8141453, -0.6451521, 1.133414, 0, 0, 0, 1, 1,
0.8164677, -1.297033, 2.680778, 0, 0, 0, 1, 1,
0.8222687, 0.8931564, -0.06433039, 0, 0, 0, 1, 1,
0.8269066, -1.416817, 2.532796, 1, 1, 1, 1, 1,
0.8273943, 1.649616, -0.08302145, 1, 1, 1, 1, 1,
0.8343529, 0.6431004, 1.539558, 1, 1, 1, 1, 1,
0.8343999, -0.5042465, 1.537771, 1, 1, 1, 1, 1,
0.8394783, -0.364552, 1.646515, 1, 1, 1, 1, 1,
0.8502862, 0.8077741, 1.695851, 1, 1, 1, 1, 1,
0.8562315, 0.492509, 0.997331, 1, 1, 1, 1, 1,
0.8569338, -1.040617, 3.902341, 1, 1, 1, 1, 1,
0.8594335, -0.8714311, 2.544852, 1, 1, 1, 1, 1,
0.8613721, -0.06044291, 1.056811, 1, 1, 1, 1, 1,
0.8683829, 1.74016, 0.6256846, 1, 1, 1, 1, 1,
0.8694224, 0.6568549, -1.20354, 1, 1, 1, 1, 1,
0.8792496, 1.997192, 1.097136, 1, 1, 1, 1, 1,
0.879917, -0.753095, 3.309517, 1, 1, 1, 1, 1,
0.8911259, -0.4588166, 1.127112, 1, 1, 1, 1, 1,
0.8923113, -1.507783, 1.713586, 0, 0, 1, 1, 1,
0.9003712, 0.4874631, 0.6756958, 1, 0, 0, 1, 1,
0.9035868, -0.4595414, 1.113427, 1, 0, 0, 1, 1,
0.9077039, 1.059819, 0.703686, 1, 0, 0, 1, 1,
0.9147148, 0.8550221, -0.5369138, 1, 0, 0, 1, 1,
0.9171039, -2.447798, 2.028706, 1, 0, 0, 1, 1,
0.9239197, -1.345359, 2.560497, 0, 0, 0, 1, 1,
0.9258208, 0.3960704, 2.500636, 0, 0, 0, 1, 1,
0.9309632, -0.4007353, 2.157163, 0, 0, 0, 1, 1,
0.9358643, -0.02957291, 1.772422, 0, 0, 0, 1, 1,
0.9389226, 0.3581865, -0.1544206, 0, 0, 0, 1, 1,
0.9547002, -1.96579, 2.565599, 0, 0, 0, 1, 1,
0.9547644, -0.1596446, 0.1470615, 0, 0, 0, 1, 1,
0.9556487, -0.7002655, 2.053027, 1, 1, 1, 1, 1,
0.9557056, -0.166085, 2.685525, 1, 1, 1, 1, 1,
0.9562213, 0.4354705, 0.7554799, 1, 1, 1, 1, 1,
0.9563687, 1.140813, 2.030348, 1, 1, 1, 1, 1,
0.960066, 0.3264747, 1.31006, 1, 1, 1, 1, 1,
0.9625025, 0.8910406, 0.5852543, 1, 1, 1, 1, 1,
0.9703645, 0.9559193, 0.7093087, 1, 1, 1, 1, 1,
0.984043, -0.7784092, 2.754976, 1, 1, 1, 1, 1,
0.9929045, 0.5885677, 1.167282, 1, 1, 1, 1, 1,
0.9929423, -3.085428, 2.776009, 1, 1, 1, 1, 1,
0.9954994, -0.202971, 1.100514, 1, 1, 1, 1, 1,
1.00448, 1.776622, 0.5463459, 1, 1, 1, 1, 1,
1.007323, -0.8760386, 2.341766, 1, 1, 1, 1, 1,
1.009637, -0.8394296, 3.018865, 1, 1, 1, 1, 1,
1.01055, 0.6130465, 0.776121, 1, 1, 1, 1, 1,
1.010737, -1.141504, 1.660913, 0, 0, 1, 1, 1,
1.020644, 0.9188316, 0.6391904, 1, 0, 0, 1, 1,
1.021082, 0.3736586, 1.416294, 1, 0, 0, 1, 1,
1.021988, 0.3161268, -0.2420504, 1, 0, 0, 1, 1,
1.030512, -0.1301014, 1.376883, 1, 0, 0, 1, 1,
1.031308, 0.5995963, 1.566441, 1, 0, 0, 1, 1,
1.037485, 1.017955, 1.040691, 0, 0, 0, 1, 1,
1.03878, 1.060148, 1.096266, 0, 0, 0, 1, 1,
1.040033, -0.9219147, 1.963407, 0, 0, 0, 1, 1,
1.040036, 1.016232, 0.1915499, 0, 0, 0, 1, 1,
1.05129, 0.7434376, 2.336859, 0, 0, 0, 1, 1,
1.060503, -0.7196164, 0.8884192, 0, 0, 0, 1, 1,
1.071462, 0.5197176, 2.277802, 0, 0, 0, 1, 1,
1.086738, -2.044296, 3.027355, 1, 1, 1, 1, 1,
1.092175, 0.7771173, -0.7689, 1, 1, 1, 1, 1,
1.09381, -1.074909, 1.958427, 1, 1, 1, 1, 1,
1.095722, 0.4428701, 0.6295607, 1, 1, 1, 1, 1,
1.10102, 0.07241061, 1.20955, 1, 1, 1, 1, 1,
1.101675, 0.8687912, 0.8686895, 1, 1, 1, 1, 1,
1.102357, 1.172077, 0.2922851, 1, 1, 1, 1, 1,
1.103164, 0.7672592, -1.053805, 1, 1, 1, 1, 1,
1.10823, 1.378786, 1.807233, 1, 1, 1, 1, 1,
1.108448, 1.289674, 1.060036, 1, 1, 1, 1, 1,
1.109839, -1.481104, 3.64423, 1, 1, 1, 1, 1,
1.110489, 1.510712, -0.1328687, 1, 1, 1, 1, 1,
1.115585, -1.249325, 1.080415, 1, 1, 1, 1, 1,
1.116415, -0.8395702, 3.567459, 1, 1, 1, 1, 1,
1.11931, -0.219764, 1.671649, 1, 1, 1, 1, 1,
1.128526, -0.5420382, -0.5910693, 0, 0, 1, 1, 1,
1.129357, 0.0112223, 2.259146, 1, 0, 0, 1, 1,
1.138312, -0.6740598, 0.876928, 1, 0, 0, 1, 1,
1.138808, -1.696487, 4.526393, 1, 0, 0, 1, 1,
1.141401, -0.5130737, 2.162409, 1, 0, 0, 1, 1,
1.141496, 1.794389, 0.9228182, 1, 0, 0, 1, 1,
1.147327, -0.9288622, 3.856697, 0, 0, 0, 1, 1,
1.156323, 1.157257, -1.004029, 0, 0, 0, 1, 1,
1.157876, 1.145006, -0.7730285, 0, 0, 0, 1, 1,
1.173338, 0.6251433, 1.604501, 0, 0, 0, 1, 1,
1.174007, 0.9465149, 1.650597, 0, 0, 0, 1, 1,
1.176254, -0.1135282, 2.568889, 0, 0, 0, 1, 1,
1.176663, 0.05090913, 2.821263, 0, 0, 0, 1, 1,
1.177977, 0.2629597, 1.963265, 1, 1, 1, 1, 1,
1.188946, 0.4090984, 0.6034493, 1, 1, 1, 1, 1,
1.189015, -2.215238, 2.811722, 1, 1, 1, 1, 1,
1.194418, -1.835705, 0.7090207, 1, 1, 1, 1, 1,
1.19984, -1.428804, 2.215377, 1, 1, 1, 1, 1,
1.207244, -0.435892, 2.340661, 1, 1, 1, 1, 1,
1.208073, -0.006975354, 0.2918195, 1, 1, 1, 1, 1,
1.211017, 0.2053355, 2.185416, 1, 1, 1, 1, 1,
1.219012, 0.4276242, 1.444572, 1, 1, 1, 1, 1,
1.22093, -0.413155, 2.7905, 1, 1, 1, 1, 1,
1.225151, -0.08185861, 1.245359, 1, 1, 1, 1, 1,
1.225469, -0.3729817, 2.616671, 1, 1, 1, 1, 1,
1.23422, 0.7691611, 1.32654, 1, 1, 1, 1, 1,
1.236205, 0.7979282, 1.650501, 1, 1, 1, 1, 1,
1.242641, 0.4998572, 1.906419, 1, 1, 1, 1, 1,
1.243542, 1.549229, 1.061771, 0, 0, 1, 1, 1,
1.251428, 0.1834256, 2.077347, 1, 0, 0, 1, 1,
1.252788, -0.6753412, 3.305611, 1, 0, 0, 1, 1,
1.254114, 0.7892874, 1.356513, 1, 0, 0, 1, 1,
1.255515, 0.3080075, 1.957363, 1, 0, 0, 1, 1,
1.259024, -1.139469, 2.230123, 1, 0, 0, 1, 1,
1.268917, 0.383828, 1.141722, 0, 0, 0, 1, 1,
1.27174, -0.1049344, 2.572079, 0, 0, 0, 1, 1,
1.273301, -0.4732163, 1.506228, 0, 0, 0, 1, 1,
1.2774, 0.5809605, 1.549382, 0, 0, 0, 1, 1,
1.277999, -0.7050446, 1.913608, 0, 0, 0, 1, 1,
1.282789, 0.8430225, 0.09118452, 0, 0, 0, 1, 1,
1.285303, 1.010814, 0.9894596, 0, 0, 0, 1, 1,
1.286677, -0.01577114, 0.4392151, 1, 1, 1, 1, 1,
1.287093, -0.39543, 2.591435, 1, 1, 1, 1, 1,
1.289076, 0.5372933, 0.5296307, 1, 1, 1, 1, 1,
1.289116, -0.02369293, 4.023619, 1, 1, 1, 1, 1,
1.299809, -0.004199674, 2.576837, 1, 1, 1, 1, 1,
1.301424, 1.18051, 1.011036, 1, 1, 1, 1, 1,
1.301782, -0.847369, 2.452511, 1, 1, 1, 1, 1,
1.30548, 0.4074698, 1.301506, 1, 1, 1, 1, 1,
1.313186, -0.9596503, 0.8724339, 1, 1, 1, 1, 1,
1.321924, 0.8191094, 0.4726663, 1, 1, 1, 1, 1,
1.323539, -0.2856365, 1.024366, 1, 1, 1, 1, 1,
1.324724, -0.6549019, 0.565695, 1, 1, 1, 1, 1,
1.325101, -0.2051004, 2.216061, 1, 1, 1, 1, 1,
1.334049, 1.124212, -0.1530983, 1, 1, 1, 1, 1,
1.341828, 0.6452986, 0.7253262, 1, 1, 1, 1, 1,
1.349291, -1.879664, 3.026091, 0, 0, 1, 1, 1,
1.354308, -1.74208, 2.333153, 1, 0, 0, 1, 1,
1.359676, 0.9318591, 1.579519, 1, 0, 0, 1, 1,
1.360474, -1.123824, 2.909921, 1, 0, 0, 1, 1,
1.361967, -0.702047, 2.164994, 1, 0, 0, 1, 1,
1.361982, 0.1383004, -0.7526618, 1, 0, 0, 1, 1,
1.362108, -2.169455, 1.652692, 0, 0, 0, 1, 1,
1.365047, 2.033392, 0.7568078, 0, 0, 0, 1, 1,
1.367821, 1.459129, 0.2931742, 0, 0, 0, 1, 1,
1.370143, 0.1132843, 3.148502, 0, 0, 0, 1, 1,
1.371464, 0.8521546, 0.5579209, 0, 0, 0, 1, 1,
1.373732, 0.500204, 1.020513, 0, 0, 0, 1, 1,
1.385049, 1.424044, 1.27103, 0, 0, 0, 1, 1,
1.391752, -0.6198002, 0.2153723, 1, 1, 1, 1, 1,
1.399639, -0.3433904, 2.067843, 1, 1, 1, 1, 1,
1.402945, 1.698375, 1.557276, 1, 1, 1, 1, 1,
1.404488, -1.574353, 3.406599, 1, 1, 1, 1, 1,
1.418905, 0.4190004, 1.60105, 1, 1, 1, 1, 1,
1.422561, 0.1749, 2.371123, 1, 1, 1, 1, 1,
1.42326, -2.793701, 0.8111393, 1, 1, 1, 1, 1,
1.431311, -0.504388, 2.246455, 1, 1, 1, 1, 1,
1.431791, -0.3622696, 1.990885, 1, 1, 1, 1, 1,
1.439813, 2.026362, 1.093408, 1, 1, 1, 1, 1,
1.449132, -0.7225945, 1.932738, 1, 1, 1, 1, 1,
1.449609, -0.6563673, 1.747023, 1, 1, 1, 1, 1,
1.450446, 1.195458, 1.504866, 1, 1, 1, 1, 1,
1.451391, 0.7114034, 0.708339, 1, 1, 1, 1, 1,
1.459069, 2.119329, -0.876339, 1, 1, 1, 1, 1,
1.479896, 0.2208075, 1.128236, 0, 0, 1, 1, 1,
1.490178, -0.2419419, 0.08286159, 1, 0, 0, 1, 1,
1.498755, -1.334387, 1.511394, 1, 0, 0, 1, 1,
1.514949, -0.3682612, 1.871563, 1, 0, 0, 1, 1,
1.525978, -0.1676384, 1.759657, 1, 0, 0, 1, 1,
1.534012, -1.813421, 3.676116, 1, 0, 0, 1, 1,
1.538539, -0.2063983, 0.1111577, 0, 0, 0, 1, 1,
1.540331, 0.01107127, 0.03543931, 0, 0, 0, 1, 1,
1.551295, -0.1839787, 1.834122, 0, 0, 0, 1, 1,
1.55761, -1.554104, 1.578629, 0, 0, 0, 1, 1,
1.561737, -0.2741622, 2.062639, 0, 0, 0, 1, 1,
1.564397, -0.2109681, 0.3549817, 0, 0, 0, 1, 1,
1.587945, -1.413296, 4.289589, 0, 0, 0, 1, 1,
1.592235, 0.6378767, 0.3495525, 1, 1, 1, 1, 1,
1.593291, 0.4488948, 2.226874, 1, 1, 1, 1, 1,
1.596798, 0.2517343, 2.906892, 1, 1, 1, 1, 1,
1.607271, -0.2597116, 1.431771, 1, 1, 1, 1, 1,
1.611727, 0.7604684, 0.3140888, 1, 1, 1, 1, 1,
1.626001, 1.73994, 0.7941194, 1, 1, 1, 1, 1,
1.626578, -1.07618, 1.6686, 1, 1, 1, 1, 1,
1.650287, 1.387574, 0.820183, 1, 1, 1, 1, 1,
1.657879, -0.174234, 0.301257, 1, 1, 1, 1, 1,
1.658337, 0.1411088, 1.587901, 1, 1, 1, 1, 1,
1.675488, 0.6586125, 0.1925068, 1, 1, 1, 1, 1,
1.695857, -0.2475529, 0.1741838, 1, 1, 1, 1, 1,
1.700771, -0.7739468, 2.958709, 1, 1, 1, 1, 1,
1.722207, 0.8474833, 2.315785, 1, 1, 1, 1, 1,
1.734582, -0.7454901, 1.87361, 1, 1, 1, 1, 1,
1.73594, 0.281254, 1.597021, 0, 0, 1, 1, 1,
1.759314, -1.057765, 0.8157015, 1, 0, 0, 1, 1,
1.762592, 0.518558, 1.032562, 1, 0, 0, 1, 1,
1.772615, 2.62591, 0.3071534, 1, 0, 0, 1, 1,
1.781677, -1.019, 1.677386, 1, 0, 0, 1, 1,
1.805875, 0.04480948, 1.381074, 1, 0, 0, 1, 1,
1.806634, 0.6461112, 1.750545, 0, 0, 0, 1, 1,
1.809766, -0.4936344, 3.322661, 0, 0, 0, 1, 1,
1.810924, -0.3892058, 1.030188, 0, 0, 0, 1, 1,
1.831492, -1.254438, 1.888242, 0, 0, 0, 1, 1,
1.840943, 0.2897045, 1.910706, 0, 0, 0, 1, 1,
1.854576, 0.507338, 1.355404, 0, 0, 0, 1, 1,
1.869239, -0.6826046, 3.240376, 0, 0, 0, 1, 1,
1.870683, 0.2117505, 1.588959, 1, 1, 1, 1, 1,
1.878914, 0.4657396, 2.173288, 1, 1, 1, 1, 1,
1.900715, 1.091734, 0.7337767, 1, 1, 1, 1, 1,
1.915104, 0.04954365, 2.592087, 1, 1, 1, 1, 1,
1.950904, 1.242818, -0.06902612, 1, 1, 1, 1, 1,
1.99891, -1.165425, 3.613062, 1, 1, 1, 1, 1,
2.022714, 1.652332, 0.9105258, 1, 1, 1, 1, 1,
2.02709, 0.2248816, 2.236338, 1, 1, 1, 1, 1,
2.031337, -0.9325207, 4.916114, 1, 1, 1, 1, 1,
2.044042, -0.4845134, 1.204537, 1, 1, 1, 1, 1,
2.06172, -0.08691868, 0.3957994, 1, 1, 1, 1, 1,
2.074079, -1.271975, 2.382002, 1, 1, 1, 1, 1,
2.099497, -0.7921093, 1.637473, 1, 1, 1, 1, 1,
2.143126, 0.03822487, -0.1494083, 1, 1, 1, 1, 1,
2.145299, 0.1377056, 1.808703, 1, 1, 1, 1, 1,
2.152152, 0.6415623, 1.183069, 0, 0, 1, 1, 1,
2.163532, 1.144716, 1.459918, 1, 0, 0, 1, 1,
2.182224, 0.4443758, 0.3563974, 1, 0, 0, 1, 1,
2.187969, 0.644277, 2.001853, 1, 0, 0, 1, 1,
2.188401, 0.5704662, -1.142344, 1, 0, 0, 1, 1,
2.217383, -0.4589433, 2.099031, 1, 0, 0, 1, 1,
2.246111, -1.07818, 1.445492, 0, 0, 0, 1, 1,
2.305346, -0.1971203, 1.025932, 0, 0, 0, 1, 1,
2.30756, 1.240111, 0.5250325, 0, 0, 0, 1, 1,
2.333859, 1.624235, 0.3673798, 0, 0, 0, 1, 1,
2.336931, -1.010488, 2.627274, 0, 0, 0, 1, 1,
2.360893, 0.533224, 1.410125, 0, 0, 0, 1, 1,
2.375599, -1.373544, 2.925118, 0, 0, 0, 1, 1,
2.408624, 0.2654022, 1.307221, 1, 1, 1, 1, 1,
2.550744, 0.8198374, 1.186186, 1, 1, 1, 1, 1,
2.607991, -0.378406, 3.172662, 1, 1, 1, 1, 1,
2.675045, -0.246966, 2.865984, 1, 1, 1, 1, 1,
2.675443, -0.6994656, 2.142482, 1, 1, 1, 1, 1,
2.901202, -1.596978, 1.29591, 1, 1, 1, 1, 1,
3.006333, 0.7358707, -0.8221251, 1, 1, 1, 1, 1
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
var radius = 10.0403;
var distance = 35.26613;
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
mvMatrix.translate( 0.09894395, 0.1764917, 0.6066566 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.26613);
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
