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
-3.027935, -2.290314, -1.223966, 1, 0, 0, 1,
-2.94697, -1.12794, -1.803012, 1, 0.007843138, 0, 1,
-2.848437, -1.640791, -2.872263, 1, 0.01176471, 0, 1,
-2.828238, -1.647427, -1.418041, 1, 0.01960784, 0, 1,
-2.763387, -0.6742147, -1.863881, 1, 0.02352941, 0, 1,
-2.747255, 0.9345403, -2.005288, 1, 0.03137255, 0, 1,
-2.702091, 0.1431211, -2.708885, 1, 0.03529412, 0, 1,
-2.607188, -1.818344, -0.3474124, 1, 0.04313726, 0, 1,
-2.554357, 0.870438, -2.228208, 1, 0.04705882, 0, 1,
-2.511601, 1.171925, -1.715233, 1, 0.05490196, 0, 1,
-2.440876, 0.5227373, -2.063689, 1, 0.05882353, 0, 1,
-2.260404, -1.449455, -3.614875, 1, 0.06666667, 0, 1,
-2.259466, -0.9765564, -0.6753798, 1, 0.07058824, 0, 1,
-2.231754, -1.175173, -3.495155, 1, 0.07843138, 0, 1,
-2.217115, 0.1561399, -3.012454, 1, 0.08235294, 0, 1,
-2.193704, 0.3091593, -0.5197494, 1, 0.09019608, 0, 1,
-2.137491, 1.629175, -0.8889215, 1, 0.09411765, 0, 1,
-2.132088, -0.3860244, -3.072763, 1, 0.1019608, 0, 1,
-2.117028, 0.729826, 1.010569, 1, 0.1098039, 0, 1,
-2.097024, -0.08508964, -0.8928722, 1, 0.1137255, 0, 1,
-2.090257, 3.180196, 0.1068576, 1, 0.1215686, 0, 1,
-2.049254, 1.536669, -1.375808, 1, 0.1254902, 0, 1,
-2.032154, -0.7289869, -0.1499348, 1, 0.1333333, 0, 1,
-1.980732, 1.287317, -0.5774983, 1, 0.1372549, 0, 1,
-1.976678, 0.6992509, 0.3835646, 1, 0.145098, 0, 1,
-1.955383, 0.2637025, -1.029474, 1, 0.1490196, 0, 1,
-1.949622, 0.4108374, -1.847013, 1, 0.1568628, 0, 1,
-1.947468, -0.6900396, -1.94399, 1, 0.1607843, 0, 1,
-1.943668, 0.3053719, -2.879457, 1, 0.1686275, 0, 1,
-1.925558, -0.1293856, -1.830319, 1, 0.172549, 0, 1,
-1.923686, -1.641887, -1.059408, 1, 0.1803922, 0, 1,
-1.922861, -1.836699, -3.12473, 1, 0.1843137, 0, 1,
-1.912146, 0.09754694, -0.9219154, 1, 0.1921569, 0, 1,
-1.901589, 1.585157, 1.011739, 1, 0.1960784, 0, 1,
-1.878689, 0.317081, 1.07811, 1, 0.2039216, 0, 1,
-1.871694, -0.424755, -1.788254, 1, 0.2117647, 0, 1,
-1.850293, 1.325041, -0.2155505, 1, 0.2156863, 0, 1,
-1.841344, -0.07919623, -1.558, 1, 0.2235294, 0, 1,
-1.839316, -1.550034, -0.871599, 1, 0.227451, 0, 1,
-1.836104, -0.6919982, -1.815983, 1, 0.2352941, 0, 1,
-1.824064, 0.5671697, -0.7644155, 1, 0.2392157, 0, 1,
-1.821982, -0.7505805, -3.309386, 1, 0.2470588, 0, 1,
-1.816449, -0.26065, -1.601013, 1, 0.2509804, 0, 1,
-1.810233, 1.274513, -0.1582443, 1, 0.2588235, 0, 1,
-1.805923, -2.363819, -2.390688, 1, 0.2627451, 0, 1,
-1.758881, 0.05972131, -3.041085, 1, 0.2705882, 0, 1,
-1.756741, 0.8994742, -1.514152, 1, 0.2745098, 0, 1,
-1.741983, 0.00361347, -1.825477, 1, 0.282353, 0, 1,
-1.739488, -0.5915583, -1.435627, 1, 0.2862745, 0, 1,
-1.730633, 0.09324711, -1.700433, 1, 0.2941177, 0, 1,
-1.715765, 0.3226222, -2.208842, 1, 0.3019608, 0, 1,
-1.705985, -1.268607, -2.864852, 1, 0.3058824, 0, 1,
-1.704948, 0.2024808, -1.310083, 1, 0.3137255, 0, 1,
-1.696856, 1.001715, -2.475874, 1, 0.3176471, 0, 1,
-1.687676, 0.3160509, -2.426304, 1, 0.3254902, 0, 1,
-1.68449, -0.1233355, -0.4513858, 1, 0.3294118, 0, 1,
-1.675679, -1.552572, -1.327928, 1, 0.3372549, 0, 1,
-1.673995, -0.0416839, -1.667385, 1, 0.3411765, 0, 1,
-1.663208, 0.05734488, -1.437977, 1, 0.3490196, 0, 1,
-1.660555, 0.3775097, -1.534626, 1, 0.3529412, 0, 1,
-1.658762, 0.2034661, -0.778749, 1, 0.3607843, 0, 1,
-1.657393, 1.936017, -0.7616084, 1, 0.3647059, 0, 1,
-1.656658, -0.03591363, -0.5787038, 1, 0.372549, 0, 1,
-1.653984, 0.4629421, -0.9411075, 1, 0.3764706, 0, 1,
-1.644356, -0.3253995, -0.7063437, 1, 0.3843137, 0, 1,
-1.631527, -1.696735, -1.889982, 1, 0.3882353, 0, 1,
-1.620407, -0.1094482, -4.157912, 1, 0.3960784, 0, 1,
-1.589813, 0.5747678, -1.11473, 1, 0.4039216, 0, 1,
-1.585734, 0.8288015, -0.9722024, 1, 0.4078431, 0, 1,
-1.572721, -0.1460354, -0.9520661, 1, 0.4156863, 0, 1,
-1.57063, -1.108428, -4.185693, 1, 0.4196078, 0, 1,
-1.560616, -0.4666123, -0.9275275, 1, 0.427451, 0, 1,
-1.556284, 0.006204755, -0.4428129, 1, 0.4313726, 0, 1,
-1.545569, 0.2010383, -0.9261624, 1, 0.4392157, 0, 1,
-1.537853, -0.2915212, -0.9403099, 1, 0.4431373, 0, 1,
-1.535563, 0.5353867, -1.425416, 1, 0.4509804, 0, 1,
-1.529983, -0.3819775, -0.315381, 1, 0.454902, 0, 1,
-1.528147, 0.2582365, -1.251705, 1, 0.4627451, 0, 1,
-1.507488, 1.267055, -0.7956944, 1, 0.4666667, 0, 1,
-1.502237, 0.3742487, 0.638097, 1, 0.4745098, 0, 1,
-1.489853, -0.6261219, 0.03176804, 1, 0.4784314, 0, 1,
-1.471458, -0.6913462, -2.151089, 1, 0.4862745, 0, 1,
-1.471281, 1.512218, -1.45322, 1, 0.4901961, 0, 1,
-1.465454, -0.5795124, -2.48862, 1, 0.4980392, 0, 1,
-1.46512, 0.2544311, -0.2568438, 1, 0.5058824, 0, 1,
-1.45476, -0.1633734, -1.327569, 1, 0.509804, 0, 1,
-1.446123, -0.6298117, -2.518079, 1, 0.5176471, 0, 1,
-1.439057, 0.9654024, 1.629345, 1, 0.5215687, 0, 1,
-1.435037, 0.3227714, -1.867201, 1, 0.5294118, 0, 1,
-1.434731, 0.585748, -1.482664, 1, 0.5333334, 0, 1,
-1.410866, -1.124283, -3.160899, 1, 0.5411765, 0, 1,
-1.408341, 2.298577, -1.679422, 1, 0.5450981, 0, 1,
-1.405996, 1.488137, 0.7059867, 1, 0.5529412, 0, 1,
-1.404851, 1.350258, 0.3794269, 1, 0.5568628, 0, 1,
-1.404579, -1.151487, -2.972284, 1, 0.5647059, 0, 1,
-1.401783, 0.6880727, 1.074295, 1, 0.5686275, 0, 1,
-1.400142, 0.4629469, -0.04280924, 1, 0.5764706, 0, 1,
-1.39469, 0.5206757, 1.20446, 1, 0.5803922, 0, 1,
-1.390228, -0.8015726, -1.496143, 1, 0.5882353, 0, 1,
-1.383783, 0.4212204, -0.2988394, 1, 0.5921569, 0, 1,
-1.382463, 0.1696702, -1.419157, 1, 0.6, 0, 1,
-1.377738, -0.006536807, -1.011605, 1, 0.6078432, 0, 1,
-1.375375, 0.4962599, -0.9924123, 1, 0.6117647, 0, 1,
-1.374711, 1.069564, -1.87246, 1, 0.6196079, 0, 1,
-1.37334, 0.197354, -2.222043, 1, 0.6235294, 0, 1,
-1.37283, -0.3927607, -1.717362, 1, 0.6313726, 0, 1,
-1.362574, -2.410722, -1.319895, 1, 0.6352941, 0, 1,
-1.360937, -0.8367641, -0.870189, 1, 0.6431373, 0, 1,
-1.355005, 0.7314743, -1.263104, 1, 0.6470588, 0, 1,
-1.345044, -0.8589735, -2.789142, 1, 0.654902, 0, 1,
-1.344528, -0.6103057, -1.43264, 1, 0.6588235, 0, 1,
-1.339706, 0.2234268, -1.958427, 1, 0.6666667, 0, 1,
-1.339404, -0.274911, -2.616702, 1, 0.6705883, 0, 1,
-1.337284, -0.3107177, -2.707017, 1, 0.6784314, 0, 1,
-1.331961, -1.328751, -2.935144, 1, 0.682353, 0, 1,
-1.33, 0.1892886, -0.688248, 1, 0.6901961, 0, 1,
-1.318004, 0.07707079, -1.685569, 1, 0.6941177, 0, 1,
-1.312959, 1.002655, -0.4942677, 1, 0.7019608, 0, 1,
-1.312099, 0.901858, -0.3816478, 1, 0.7098039, 0, 1,
-1.309332, -0.05336274, -2.253386, 1, 0.7137255, 0, 1,
-1.301309, 0.3744338, -1.218063, 1, 0.7215686, 0, 1,
-1.286782, -1.517461, -1.557949, 1, 0.7254902, 0, 1,
-1.28116, -1.028883, -3.198386, 1, 0.7333333, 0, 1,
-1.280657, -1.156338, -1.43045, 1, 0.7372549, 0, 1,
-1.277176, -1.385063, -1.93775, 1, 0.7450981, 0, 1,
-1.275629, 0.8059293, -0.7184566, 1, 0.7490196, 0, 1,
-1.263154, -0.726048, -2.954204, 1, 0.7568628, 0, 1,
-1.255707, -0.7250735, -1.578681, 1, 0.7607843, 0, 1,
-1.254651, 0.2919633, -2.874765, 1, 0.7686275, 0, 1,
-1.254333, -2.439184, -4.681978, 1, 0.772549, 0, 1,
-1.245138, -1.390646, -4.923544, 1, 0.7803922, 0, 1,
-1.231735, 0.4972776, -1.660803, 1, 0.7843137, 0, 1,
-1.202163, -0.9232651, -3.028876, 1, 0.7921569, 0, 1,
-1.196913, 0.384655, -1.949156, 1, 0.7960784, 0, 1,
-1.193988, 0.4902793, -2.504366, 1, 0.8039216, 0, 1,
-1.192049, -1.035444, -2.294476, 1, 0.8117647, 0, 1,
-1.185652, -0.4445182, -2.157828, 1, 0.8156863, 0, 1,
-1.184005, 0.1448693, -1.782932, 1, 0.8235294, 0, 1,
-1.183003, 0.119947, -1.543986, 1, 0.827451, 0, 1,
-1.173179, -0.6899899, -3.250548, 1, 0.8352941, 0, 1,
-1.172494, 0.1854048, -1.100587, 1, 0.8392157, 0, 1,
-1.152588, -0.1016329, -1.755105, 1, 0.8470588, 0, 1,
-1.142323, -0.4970911, -1.316074, 1, 0.8509804, 0, 1,
-1.141253, 0.6409597, -1.212538, 1, 0.8588235, 0, 1,
-1.138569, -0.4437182, 0.03984778, 1, 0.8627451, 0, 1,
-1.130353, -0.5471337, -1.658955, 1, 0.8705882, 0, 1,
-1.128843, -0.1602885, -1.062131, 1, 0.8745098, 0, 1,
-1.12549, 1.330238, -1.109468, 1, 0.8823529, 0, 1,
-1.12218, -1.987032, -3.599053, 1, 0.8862745, 0, 1,
-1.117367, -1.067707, -3.241301, 1, 0.8941177, 0, 1,
-1.109933, 1.049301, -1.4571, 1, 0.8980392, 0, 1,
-1.102577, 1.279554, -1.899802, 1, 0.9058824, 0, 1,
-1.101811, 0.3890014, -0.7516776, 1, 0.9137255, 0, 1,
-1.100503, -0.8713831, -2.962011, 1, 0.9176471, 0, 1,
-1.099981, 1.002633, 0.7130938, 1, 0.9254902, 0, 1,
-1.095213, 1.657004, 0.02984899, 1, 0.9294118, 0, 1,
-1.094365, 0.9060836, -1.247663, 1, 0.9372549, 0, 1,
-1.093822, 0.9565913, -0.6845819, 1, 0.9411765, 0, 1,
-1.086173, -0.4853542, -2.183841, 1, 0.9490196, 0, 1,
-1.084924, 0.2226455, -0.1013046, 1, 0.9529412, 0, 1,
-1.074014, -0.4349231, -1.14117, 1, 0.9607843, 0, 1,
-1.065044, -1.302796, -0.1463098, 1, 0.9647059, 0, 1,
-1.064935, -1.019959, -3.281959, 1, 0.972549, 0, 1,
-1.060221, 0.5546061, -0.2766908, 1, 0.9764706, 0, 1,
-1.05486, 1.011494, -2.155368, 1, 0.9843137, 0, 1,
-1.053696, -0.5860527, -1.381508, 1, 0.9882353, 0, 1,
-1.045679, -0.9095291, -2.945054, 1, 0.9960784, 0, 1,
-1.044026, 0.9196066, -0.2595266, 0.9960784, 1, 0, 1,
-1.042241, 0.1030018, -1.238198, 0.9921569, 1, 0, 1,
-1.041997, 0.9821997, 0.02034004, 0.9843137, 1, 0, 1,
-1.025374, 0.6754372, -1.550116, 0.9803922, 1, 0, 1,
-1.016995, 0.2898631, -1.299885, 0.972549, 1, 0, 1,
-1.013513, 0.2253512, -1.516656, 0.9686275, 1, 0, 1,
-1.012199, 0.4619968, 0.8864199, 0.9607843, 1, 0, 1,
-1.011742, -0.5878714, -3.568369, 0.9568627, 1, 0, 1,
-1.008188, -0.907537, -2.311365, 0.9490196, 1, 0, 1,
-1.002753, 0.2049365, -1.104125, 0.945098, 1, 0, 1,
-0.9918564, 0.6241347, -1.580516, 0.9372549, 1, 0, 1,
-0.9913165, 0.8408191, 0.4697013, 0.9333333, 1, 0, 1,
-0.9864297, 0.7483591, -2.869689, 0.9254902, 1, 0, 1,
-0.9801448, 0.1256887, -0.9454398, 0.9215686, 1, 0, 1,
-0.9760563, -0.715088, -1.132141, 0.9137255, 1, 0, 1,
-0.9722607, 1.89167, -1.090732, 0.9098039, 1, 0, 1,
-0.9678629, -0.370372, -0.1737594, 0.9019608, 1, 0, 1,
-0.9656469, -0.9178506, -2.787348, 0.8941177, 1, 0, 1,
-0.9586796, 0.4690603, 0.3914836, 0.8901961, 1, 0, 1,
-0.9524224, 0.05084642, -0.1065618, 0.8823529, 1, 0, 1,
-0.9517926, 0.5589389, 1.778341, 0.8784314, 1, 0, 1,
-0.9499384, -0.8678547, -0.6030216, 0.8705882, 1, 0, 1,
-0.9496464, 0.9426765, -0.6011602, 0.8666667, 1, 0, 1,
-0.9428777, -0.2363733, -2.751431, 0.8588235, 1, 0, 1,
-0.9390553, -0.4309821, -2.243077, 0.854902, 1, 0, 1,
-0.9368351, 0.03904725, -1.268965, 0.8470588, 1, 0, 1,
-0.9301561, 0.3738116, -2.388387, 0.8431373, 1, 0, 1,
-0.929033, -0.7393785, -3.606563, 0.8352941, 1, 0, 1,
-0.9273371, -0.4996998, -0.8191014, 0.8313726, 1, 0, 1,
-0.9246582, 1.170038, -2.617068, 0.8235294, 1, 0, 1,
-0.92019, -0.6093916, -2.977401, 0.8196079, 1, 0, 1,
-0.9111915, -0.7470397, -2.147319, 0.8117647, 1, 0, 1,
-0.9111606, 0.7463797, 0.2268887, 0.8078431, 1, 0, 1,
-0.9109251, -0.07569263, -0.2360461, 0.8, 1, 0, 1,
-0.9040994, 0.5456916, -0.9548338, 0.7921569, 1, 0, 1,
-0.9024205, -0.332191, -1.332783, 0.7882353, 1, 0, 1,
-0.8986189, -0.467469, -2.064118, 0.7803922, 1, 0, 1,
-0.8984907, -0.4967897, -2.446621, 0.7764706, 1, 0, 1,
-0.8972293, -0.3240943, -2.658664, 0.7686275, 1, 0, 1,
-0.8954808, 1.382729, 1.262857, 0.7647059, 1, 0, 1,
-0.8948538, -0.503504, -2.156169, 0.7568628, 1, 0, 1,
-0.892674, 0.215727, -0.4774232, 0.7529412, 1, 0, 1,
-0.8864576, 1.053464, -0.3764306, 0.7450981, 1, 0, 1,
-0.8838187, -0.6565399, -1.094103, 0.7411765, 1, 0, 1,
-0.8814824, -0.2548301, -2.458026, 0.7333333, 1, 0, 1,
-0.8802765, 0.5376801, -1.562432, 0.7294118, 1, 0, 1,
-0.8783395, 1.820491, 0.7692915, 0.7215686, 1, 0, 1,
-0.8741859, -1.250404, -2.724569, 0.7176471, 1, 0, 1,
-0.8738089, 1.096095, -3.452643, 0.7098039, 1, 0, 1,
-0.8720255, -0.9410281, -2.218114, 0.7058824, 1, 0, 1,
-0.8695644, 1.707691, -2.013299, 0.6980392, 1, 0, 1,
-0.8678454, -0.0946402, -4.250823, 0.6901961, 1, 0, 1,
-0.8671632, -1.402379, -1.928558, 0.6862745, 1, 0, 1,
-0.8514884, 0.6123148, 0.02677796, 0.6784314, 1, 0, 1,
-0.848564, -0.01400332, -1.548671, 0.6745098, 1, 0, 1,
-0.8458375, 0.2034014, -0.8017464, 0.6666667, 1, 0, 1,
-0.8337955, 1.132747, -0.2123021, 0.6627451, 1, 0, 1,
-0.8335145, 0.6367006, -1.392235, 0.654902, 1, 0, 1,
-0.83298, 1.508838, 1.60954, 0.6509804, 1, 0, 1,
-0.8252874, 0.2552734, -2.468252, 0.6431373, 1, 0, 1,
-0.8140689, 0.9116963, -0.01363664, 0.6392157, 1, 0, 1,
-0.810023, -0.09680146, -2.053312, 0.6313726, 1, 0, 1,
-0.8097412, -0.7150416, -1.168211, 0.627451, 1, 0, 1,
-0.8076718, -1.236263, -1.948363, 0.6196079, 1, 0, 1,
-0.8056541, -0.6270216, -3.77445, 0.6156863, 1, 0, 1,
-0.8050166, -0.3798614, -2.031866, 0.6078432, 1, 0, 1,
-0.7996519, -0.3394806, -2.492687, 0.6039216, 1, 0, 1,
-0.7964443, -0.6653238, -3.160709, 0.5960785, 1, 0, 1,
-0.7921577, 0.1497829, -0.9153425, 0.5882353, 1, 0, 1,
-0.7913057, -0.6498684, -2.050739, 0.5843138, 1, 0, 1,
-0.7896968, 0.8659409, 0.2265041, 0.5764706, 1, 0, 1,
-0.788452, 2.001194, 2.131142, 0.572549, 1, 0, 1,
-0.7884022, 1.13985, -0.2167966, 0.5647059, 1, 0, 1,
-0.7882898, 2.382325, -0.5122126, 0.5607843, 1, 0, 1,
-0.7845539, -0.2015644, 0.1124685, 0.5529412, 1, 0, 1,
-0.7825371, 0.9551194, -0.03407379, 0.5490196, 1, 0, 1,
-0.7825003, 0.951322, 0.2621778, 0.5411765, 1, 0, 1,
-0.7820485, 0.7496222, -0.9778394, 0.5372549, 1, 0, 1,
-0.7776904, -0.6953899, -2.808614, 0.5294118, 1, 0, 1,
-0.774083, 0.2855189, 1.17295, 0.5254902, 1, 0, 1,
-0.7702407, 0.1878969, -1.854577, 0.5176471, 1, 0, 1,
-0.7682418, 1.022484, -1.787582, 0.5137255, 1, 0, 1,
-0.7625703, -0.8694673, -0.7642701, 0.5058824, 1, 0, 1,
-0.7614166, 0.6807064, 1.651214, 0.5019608, 1, 0, 1,
-0.7596986, 0.559132, -0.7362567, 0.4941176, 1, 0, 1,
-0.7575004, 0.223404, -4.060329, 0.4862745, 1, 0, 1,
-0.7484422, 1.823967, -2.043756, 0.4823529, 1, 0, 1,
-0.7463456, 0.2643836, -1.106137, 0.4745098, 1, 0, 1,
-0.739913, 0.699204, -1.072204, 0.4705882, 1, 0, 1,
-0.7388085, 0.0803888, -3.297868, 0.4627451, 1, 0, 1,
-0.7385264, -2.624769, -1.252436, 0.4588235, 1, 0, 1,
-0.7306048, 0.6345857, -1.153775, 0.4509804, 1, 0, 1,
-0.7261234, -0.8086136, -3.427191, 0.4470588, 1, 0, 1,
-0.7246679, 0.9115592, -0.01054966, 0.4392157, 1, 0, 1,
-0.7245765, -0.7570311, -2.659567, 0.4352941, 1, 0, 1,
-0.7145848, 0.593369, -0.08692452, 0.427451, 1, 0, 1,
-0.7050914, -0.05332777, -2.445104, 0.4235294, 1, 0, 1,
-0.6998791, 1.539562, 0.3698163, 0.4156863, 1, 0, 1,
-0.6910253, -1.258805, -4.286441, 0.4117647, 1, 0, 1,
-0.6905239, 0.3543627, -1.720783, 0.4039216, 1, 0, 1,
-0.6866831, 1.195267, -0.9858457, 0.3960784, 1, 0, 1,
-0.6763912, 1.778879, -0.5704552, 0.3921569, 1, 0, 1,
-0.6696292, 0.3049346, 0.2088459, 0.3843137, 1, 0, 1,
-0.6696137, 0.9786472, -0.7029878, 0.3803922, 1, 0, 1,
-0.6671333, 1.729764, -1.056258, 0.372549, 1, 0, 1,
-0.6653753, -0.01306373, -2.047984, 0.3686275, 1, 0, 1,
-0.6577851, -1.768359, -2.4624, 0.3607843, 1, 0, 1,
-0.6553598, 0.2132076, -1.090354, 0.3568628, 1, 0, 1,
-0.6550931, 0.2829229, -1.511203, 0.3490196, 1, 0, 1,
-0.6539083, -0.9192653, -2.33092, 0.345098, 1, 0, 1,
-0.6521181, -0.5140253, -3.933746, 0.3372549, 1, 0, 1,
-0.6509757, 1.152016, 1.576368, 0.3333333, 1, 0, 1,
-0.6498506, -2.641296, -4.427372, 0.3254902, 1, 0, 1,
-0.646251, 0.2153811, -2.067865, 0.3215686, 1, 0, 1,
-0.6395396, 0.08835461, -1.666951, 0.3137255, 1, 0, 1,
-0.6374004, -1.425542, -2.646897, 0.3098039, 1, 0, 1,
-0.6367846, 0.2600767, -2.20546, 0.3019608, 1, 0, 1,
-0.6278772, 1.58575, 1.332587, 0.2941177, 1, 0, 1,
-0.627836, 0.4337963, -0.6430285, 0.2901961, 1, 0, 1,
-0.6252287, 1.312308, -2.833565, 0.282353, 1, 0, 1,
-0.6173952, -0.6622689, -3.266966, 0.2784314, 1, 0, 1,
-0.6111993, 1.864429, -1.870542, 0.2705882, 1, 0, 1,
-0.6073607, -0.2777823, -2.06111, 0.2666667, 1, 0, 1,
-0.6034728, 0.6138631, 1.101209, 0.2588235, 1, 0, 1,
-0.5999184, -0.2873464, -0.6974258, 0.254902, 1, 0, 1,
-0.5991877, 0.415611, -2.091842, 0.2470588, 1, 0, 1,
-0.597143, -0.1830938, -3.323046, 0.2431373, 1, 0, 1,
-0.5941332, -2.04382, -3.522767, 0.2352941, 1, 0, 1,
-0.5934865, 0.9703417, -0.0681195, 0.2313726, 1, 0, 1,
-0.5926051, -2.218564, -5.017342, 0.2235294, 1, 0, 1,
-0.5909376, -1.410023, -1.18671, 0.2196078, 1, 0, 1,
-0.5898876, 1.486802, -1.821057, 0.2117647, 1, 0, 1,
-0.5894287, 0.2342654, -2.379136, 0.2078431, 1, 0, 1,
-0.5884456, 0.253935, -1.577369, 0.2, 1, 0, 1,
-0.5873471, -0.06278158, -2.103487, 0.1921569, 1, 0, 1,
-0.5856779, -0.2440795, -2.184805, 0.1882353, 1, 0, 1,
-0.5817488, -1.968502, -2.486749, 0.1803922, 1, 0, 1,
-0.5803534, 0.6156663, -1.225552, 0.1764706, 1, 0, 1,
-0.5782633, 1.262013, -0.7227581, 0.1686275, 1, 0, 1,
-0.577525, 1.110944, -0.2031623, 0.1647059, 1, 0, 1,
-0.5774901, 1.807095, -0.03496581, 0.1568628, 1, 0, 1,
-0.575012, -0.2410034, -3.073593, 0.1529412, 1, 0, 1,
-0.5734509, -0.1140907, -2.157959, 0.145098, 1, 0, 1,
-0.5704904, 0.06335361, -2.334225, 0.1411765, 1, 0, 1,
-0.5677813, -0.9417673, -2.117016, 0.1333333, 1, 0, 1,
-0.5650529, -0.5479981, -2.378606, 0.1294118, 1, 0, 1,
-0.5636513, 0.4471177, -1.837165, 0.1215686, 1, 0, 1,
-0.5626058, 0.03370086, -2.914517, 0.1176471, 1, 0, 1,
-0.5571053, 0.2419367, -0.8504783, 0.1098039, 1, 0, 1,
-0.553654, 0.2185275, -0.5763206, 0.1058824, 1, 0, 1,
-0.5521677, -0.2059859, -3.112832, 0.09803922, 1, 0, 1,
-0.5465869, -0.9456358, -2.680622, 0.09019608, 1, 0, 1,
-0.5450892, 1.193551, 1.563691, 0.08627451, 1, 0, 1,
-0.543697, 0.9880849, -1.106922, 0.07843138, 1, 0, 1,
-0.5429063, -1.930107, -1.711499, 0.07450981, 1, 0, 1,
-0.5377471, 1.154395, -1.242879, 0.06666667, 1, 0, 1,
-0.5354061, -1.799705, -4.356978, 0.0627451, 1, 0, 1,
-0.5332407, 0.2712401, -1.896672, 0.05490196, 1, 0, 1,
-0.5327753, -0.6536811, -4.80401, 0.05098039, 1, 0, 1,
-0.5265015, 2.001565, -0.1777801, 0.04313726, 1, 0, 1,
-0.5227468, 0.01150944, -0.3108542, 0.03921569, 1, 0, 1,
-0.5159966, -0.4995795, -2.61791, 0.03137255, 1, 0, 1,
-0.5158533, 1.013493, 0.6774494, 0.02745098, 1, 0, 1,
-0.5143775, -0.2850864, -1.695596, 0.01960784, 1, 0, 1,
-0.5120742, 1.097239, 1.307456, 0.01568628, 1, 0, 1,
-0.5073461, 1.577034, -1.144746, 0.007843138, 1, 0, 1,
-0.5062451, 0.7813839, -0.9831812, 0.003921569, 1, 0, 1,
-0.5057366, -1.01365, -1.850822, 0, 1, 0.003921569, 1,
-0.5024264, 0.4162684, -1.452654, 0, 1, 0.01176471, 1,
-0.498489, -0.9045941, -3.436967, 0, 1, 0.01568628, 1,
-0.4977027, 0.9682196, 0.4748374, 0, 1, 0.02352941, 1,
-0.4897597, 0.7699295, -1.449768, 0, 1, 0.02745098, 1,
-0.4848146, 1.268305, -2.32483, 0, 1, 0.03529412, 1,
-0.4843163, -0.9436919, -3.171279, 0, 1, 0.03921569, 1,
-0.4832067, -0.05650345, -1.07556, 0, 1, 0.04705882, 1,
-0.4816158, 1.095387, -0.4693167, 0, 1, 0.05098039, 1,
-0.4815421, 0.4763251, -1.858486, 0, 1, 0.05882353, 1,
-0.4804511, -0.9169602, -3.252182, 0, 1, 0.0627451, 1,
-0.4775425, 1.228659, 0.01072694, 0, 1, 0.07058824, 1,
-0.4706721, -0.2101968, -2.776577, 0, 1, 0.07450981, 1,
-0.4690152, -0.617418, -0.8765963, 0, 1, 0.08235294, 1,
-0.4609109, -0.07425605, -3.84947, 0, 1, 0.08627451, 1,
-0.4547517, 1.570206, -0.8666901, 0, 1, 0.09411765, 1,
-0.4534857, -0.535844, -3.331816, 0, 1, 0.1019608, 1,
-0.4526536, -1.525101, -3.015064, 0, 1, 0.1058824, 1,
-0.4503459, -0.09182081, -2.013216, 0, 1, 0.1137255, 1,
-0.4500322, -0.8631995, -2.648448, 0, 1, 0.1176471, 1,
-0.4469559, -0.3048256, -1.318284, 0, 1, 0.1254902, 1,
-0.4461195, 2.939757, -0.7587681, 0, 1, 0.1294118, 1,
-0.4446321, 1.533431, 0.3966146, 0, 1, 0.1372549, 1,
-0.4439219, -0.485719, -3.950438, 0, 1, 0.1411765, 1,
-0.4424248, 1.058236, -1.422584, 0, 1, 0.1490196, 1,
-0.4422634, -0.3638725, -1.803072, 0, 1, 0.1529412, 1,
-0.4403585, -1.329156, -3.391011, 0, 1, 0.1607843, 1,
-0.4393468, -1.928996, -3.808406, 0, 1, 0.1647059, 1,
-0.4380782, 0.005794478, -1.877584, 0, 1, 0.172549, 1,
-0.4329615, -0.2137367, -2.18592, 0, 1, 0.1764706, 1,
-0.4321512, 0.5857154, -0.5317803, 0, 1, 0.1843137, 1,
-0.4280498, 0.5043972, -0.8121431, 0, 1, 0.1882353, 1,
-0.4275469, -0.3550354, 0.1396198, 0, 1, 0.1960784, 1,
-0.4273349, 0.3468418, -0.4398248, 0, 1, 0.2039216, 1,
-0.4243971, -0.4147475, -2.49933, 0, 1, 0.2078431, 1,
-0.4240418, 0.5654413, -1.96154, 0, 1, 0.2156863, 1,
-0.4239012, 0.8654101, 0.4512985, 0, 1, 0.2196078, 1,
-0.4200709, -0.5822188, -1.378952, 0, 1, 0.227451, 1,
-0.4165922, 0.7600541, 0.08681702, 0, 1, 0.2313726, 1,
-0.4072172, -0.8374373, -2.629042, 0, 1, 0.2392157, 1,
-0.4064932, -0.7832208, -2.462913, 0, 1, 0.2431373, 1,
-0.4063543, 1.166554, -1.676908, 0, 1, 0.2509804, 1,
-0.4008995, -0.169201, -1.655521, 0, 1, 0.254902, 1,
-0.3976288, 0.2700534, -3.135306, 0, 1, 0.2627451, 1,
-0.3971776, -0.735711, -3.382397, 0, 1, 0.2666667, 1,
-0.3969731, -0.3737883, -2.669359, 0, 1, 0.2745098, 1,
-0.3956648, 0.8743772, -0.9306936, 0, 1, 0.2784314, 1,
-0.3866563, 1.11568, -0.8230797, 0, 1, 0.2862745, 1,
-0.3839635, -0.4593709, -2.305575, 0, 1, 0.2901961, 1,
-0.3836405, -0.0971039, -2.496647, 0, 1, 0.2980392, 1,
-0.3830454, -0.7391709, -1.47705, 0, 1, 0.3058824, 1,
-0.3818092, -1.21902, -1.126832, 0, 1, 0.3098039, 1,
-0.3782402, 1.532825, -1.019716, 0, 1, 0.3176471, 1,
-0.3727986, 2.137532, -1.053197, 0, 1, 0.3215686, 1,
-0.3714157, -0.7714491, -3.88716, 0, 1, 0.3294118, 1,
-0.3709229, 0.02269957, -0.1788827, 0, 1, 0.3333333, 1,
-0.3708996, 0.7763921, 1.036054, 0, 1, 0.3411765, 1,
-0.3708409, -0.8907526, -3.599362, 0, 1, 0.345098, 1,
-0.3670115, 0.02465151, -1.983361, 0, 1, 0.3529412, 1,
-0.3628934, -0.2735561, -2.296859, 0, 1, 0.3568628, 1,
-0.3593593, 0.3163706, -0.1228399, 0, 1, 0.3647059, 1,
-0.3590302, 0.1764271, -0.8587444, 0, 1, 0.3686275, 1,
-0.3546527, -0.9179474, -3.771448, 0, 1, 0.3764706, 1,
-0.3534139, -1.551652, -3.047362, 0, 1, 0.3803922, 1,
-0.3457649, -0.1203932, -0.5052817, 0, 1, 0.3882353, 1,
-0.3399625, 0.05516792, -3.335707, 0, 1, 0.3921569, 1,
-0.3396146, -0.2147333, -3.083383, 0, 1, 0.4, 1,
-0.337669, 0.03429496, -2.017027, 0, 1, 0.4078431, 1,
-0.3355015, 0.3025383, -1.655199, 0, 1, 0.4117647, 1,
-0.3306488, -1.129934, -2.88335, 0, 1, 0.4196078, 1,
-0.3269439, -0.8112118, -1.270851, 0, 1, 0.4235294, 1,
-0.3258241, -0.1107931, -1.870253, 0, 1, 0.4313726, 1,
-0.3255087, 3.01231, 0.3378752, 0, 1, 0.4352941, 1,
-0.3182847, 0.4674263, -0.264531, 0, 1, 0.4431373, 1,
-0.3175542, -2.588648, -3.002892, 0, 1, 0.4470588, 1,
-0.3163202, 0.1723562, -0.4525152, 0, 1, 0.454902, 1,
-0.3152173, -1.43752, -5.010786, 0, 1, 0.4588235, 1,
-0.3133277, -0.5246867, -2.459862, 0, 1, 0.4666667, 1,
-0.3127283, 1.930404, -0.8789389, 0, 1, 0.4705882, 1,
-0.3109996, -0.03255028, -1.188899, 0, 1, 0.4784314, 1,
-0.3092417, 1.216886, -0.09374738, 0, 1, 0.4823529, 1,
-0.3082224, 0.01561775, -1.654363, 0, 1, 0.4901961, 1,
-0.3076322, -0.8003903, -3.050204, 0, 1, 0.4941176, 1,
-0.3051362, -1.727217, -2.304499, 0, 1, 0.5019608, 1,
-0.3043918, -0.4664876, -3.264555, 0, 1, 0.509804, 1,
-0.3038515, -0.7506332, -1.445287, 0, 1, 0.5137255, 1,
-0.3029552, -0.769787, -2.45496, 0, 1, 0.5215687, 1,
-0.2936566, -2.756999, -1.380754, 0, 1, 0.5254902, 1,
-0.2934084, 1.746568, 1.46488, 0, 1, 0.5333334, 1,
-0.291022, 0.1040483, 0.2396112, 0, 1, 0.5372549, 1,
-0.2903357, 0.9829995, -1.396898, 0, 1, 0.5450981, 1,
-0.2829836, 1.501917, 0.1278035, 0, 1, 0.5490196, 1,
-0.2815403, -0.3819909, -3.819604, 0, 1, 0.5568628, 1,
-0.280315, -0.8385329, -2.188149, 0, 1, 0.5607843, 1,
-0.2802767, 0.3060255, -0.644138, 0, 1, 0.5686275, 1,
-0.27756, 1.271824, -0.1351914, 0, 1, 0.572549, 1,
-0.2755966, -0.9375637, -3.765399, 0, 1, 0.5803922, 1,
-0.2751932, 0.6615604, -0.746439, 0, 1, 0.5843138, 1,
-0.2743599, 0.5500018, 1.682073, 0, 1, 0.5921569, 1,
-0.2742816, 0.2739416, -2.432127, 0, 1, 0.5960785, 1,
-0.2742477, -1.404282, -3.373124, 0, 1, 0.6039216, 1,
-0.2592131, -0.07512723, -1.859161, 0, 1, 0.6117647, 1,
-0.2580852, -1.567896, -2.783339, 0, 1, 0.6156863, 1,
-0.2530695, 1.130191, 1.467893, 0, 1, 0.6235294, 1,
-0.2527106, -0.7850514, -5.726501, 0, 1, 0.627451, 1,
-0.2518148, 0.1471444, -0.1208997, 0, 1, 0.6352941, 1,
-0.2455425, 2.013868, -0.146115, 0, 1, 0.6392157, 1,
-0.2442625, -0.8097308, -2.39902, 0, 1, 0.6470588, 1,
-0.2439615, 1.969792, -0.2214851, 0, 1, 0.6509804, 1,
-0.2359276, 0.09513096, -1.069655, 0, 1, 0.6588235, 1,
-0.2343837, -1.399727, -3.088783, 0, 1, 0.6627451, 1,
-0.2290722, -0.4822535, -0.1073651, 0, 1, 0.6705883, 1,
-0.2275661, 0.7127538, -2.167783, 0, 1, 0.6745098, 1,
-0.2257663, 0.3180756, -1.920691, 0, 1, 0.682353, 1,
-0.2154979, -0.2805401, -1.289457, 0, 1, 0.6862745, 1,
-0.2065066, 0.8313537, 2.334814, 0, 1, 0.6941177, 1,
-0.2059402, 0.6148807, 0.4748193, 0, 1, 0.7019608, 1,
-0.2036146, -0.09336568, -2.582233, 0, 1, 0.7058824, 1,
-0.2021818, -0.1613133, -1.449387, 0, 1, 0.7137255, 1,
-0.2011566, 0.2192373, -2.734948, 0, 1, 0.7176471, 1,
-0.1985495, 0.7419084, 0.1153411, 0, 1, 0.7254902, 1,
-0.1953081, -0.4276609, -2.242138, 0, 1, 0.7294118, 1,
-0.1923953, 0.6515222, 0.7055148, 0, 1, 0.7372549, 1,
-0.1908534, 0.397779, -0.1061538, 0, 1, 0.7411765, 1,
-0.1826311, 0.2994818, 0.4692873, 0, 1, 0.7490196, 1,
-0.1738632, 0.5944433, -2.332931, 0, 1, 0.7529412, 1,
-0.1731889, 1.062042, -0.4944043, 0, 1, 0.7607843, 1,
-0.1629822, 0.992121, -0.8989232, 0, 1, 0.7647059, 1,
-0.1592329, -1.210337, -3.241988, 0, 1, 0.772549, 1,
-0.1528118, 0.8325959, 0.9162869, 0, 1, 0.7764706, 1,
-0.1500237, 0.1460885, -1.07026, 0, 1, 0.7843137, 1,
-0.1485887, -0.8316775, -2.536796, 0, 1, 0.7882353, 1,
-0.1448862, -0.007089864, -0.7605282, 0, 1, 0.7960784, 1,
-0.141623, -0.830029, -2.528194, 0, 1, 0.8039216, 1,
-0.139212, -0.4419631, -1.298321, 0, 1, 0.8078431, 1,
-0.1359891, 0.8711473, 0.7223088, 0, 1, 0.8156863, 1,
-0.13472, -0.5819989, -3.16231, 0, 1, 0.8196079, 1,
-0.1280791, -0.4034187, -3.883901, 0, 1, 0.827451, 1,
-0.1272124, 0.1687651, -1.220859, 0, 1, 0.8313726, 1,
-0.1208365, 1.264692, -1.585411, 0, 1, 0.8392157, 1,
-0.1172878, -0.2453039, -2.227671, 0, 1, 0.8431373, 1,
-0.1166866, -0.5295851, -3.355235, 0, 1, 0.8509804, 1,
-0.1166682, -2.24086, -3.145804, 0, 1, 0.854902, 1,
-0.1164, -0.09411398, -1.425928, 0, 1, 0.8627451, 1,
-0.1163645, 0.2399245, -1.269054, 0, 1, 0.8666667, 1,
-0.1145088, 0.8290867, -0.6006638, 0, 1, 0.8745098, 1,
-0.1142195, -0.6308162, -1.481483, 0, 1, 0.8784314, 1,
-0.1126107, -1.01976, -0.6125018, 0, 1, 0.8862745, 1,
-0.1066638, -0.01338977, -3.096351, 0, 1, 0.8901961, 1,
-0.1061928, 1.26559, -0.7077867, 0, 1, 0.8980392, 1,
-0.1046062, 1.340629, 0.7168072, 0, 1, 0.9058824, 1,
-0.1041319, 1.558868, 2.567455, 0, 1, 0.9098039, 1,
-0.1018832, -1.212551, -2.861052, 0, 1, 0.9176471, 1,
-0.09699079, -0.09041823, -0.3863974, 0, 1, 0.9215686, 1,
-0.09640088, -0.4547838, -2.579565, 0, 1, 0.9294118, 1,
-0.09508447, 0.9157057, 0.2276471, 0, 1, 0.9333333, 1,
-0.08614577, -0.1790879, -2.464304, 0, 1, 0.9411765, 1,
-0.08466773, 1.264705, -1.219666, 0, 1, 0.945098, 1,
-0.08445992, 0.7834036, 0.2312938, 0, 1, 0.9529412, 1,
-0.07186139, -0.3164158, -2.672225, 0, 1, 0.9568627, 1,
-0.07114219, 1.11806, 1.555357, 0, 1, 0.9647059, 1,
-0.07107671, -0.4369434, -2.980058, 0, 1, 0.9686275, 1,
-0.06802556, -1.309858, -2.070096, 0, 1, 0.9764706, 1,
-0.06641439, 0.3421655, 0.3384319, 0, 1, 0.9803922, 1,
-0.06587441, -1.883836, -1.947065, 0, 1, 0.9882353, 1,
-0.06411494, 0.479037, 1.023612, 0, 1, 0.9921569, 1,
-0.06295455, -0.982235, -3.7566, 0, 1, 1, 1,
-0.06212936, 0.4995084, -0.0602503, 0, 0.9921569, 1, 1,
-0.05896259, -0.6650203, -2.135975, 0, 0.9882353, 1, 1,
-0.05339305, 0.7581775, -0.452507, 0, 0.9803922, 1, 1,
-0.05254806, -0.6134207, -2.08111, 0, 0.9764706, 1, 1,
-0.05138439, -0.7024941, -4.633295, 0, 0.9686275, 1, 1,
-0.04306947, -2.008674, -4.207597, 0, 0.9647059, 1, 1,
-0.03636048, 1.617082, -1.444847, 0, 0.9568627, 1, 1,
-0.03302228, 0.008755226, -2.249347, 0, 0.9529412, 1, 1,
-0.03271486, -1.509586, -2.763875, 0, 0.945098, 1, 1,
-0.0315035, -0.8268597, -2.110834, 0, 0.9411765, 1, 1,
-0.02971767, 1.198653, 0.1212885, 0, 0.9333333, 1, 1,
-0.02841946, -0.2571425, -5.204865, 0, 0.9294118, 1, 1,
-0.02596894, -0.6723669, -4.082854, 0, 0.9215686, 1, 1,
-0.02237752, -0.9122381, -4.596484, 0, 0.9176471, 1, 1,
-0.01887146, 0.02758404, -1.101935, 0, 0.9098039, 1, 1,
-0.01835753, 0.2936279, 1.081898, 0, 0.9058824, 1, 1,
-0.01506843, -0.5895352, -4.256488, 0, 0.8980392, 1, 1,
-0.01230394, 0.403015, -1.260747, 0, 0.8901961, 1, 1,
-0.00847757, 2.684201, -0.555573, 0, 0.8862745, 1, 1,
-0.006194296, -0.4557149, -3.227368, 0, 0.8784314, 1, 1,
-0.003649746, 1.238544, 0.2828908, 0, 0.8745098, 1, 1,
0.006083834, 1.519166, 0.2187361, 0, 0.8666667, 1, 1,
0.00670861, 0.3842623, 0.1982108, 0, 0.8627451, 1, 1,
0.007526502, -1.777867, 4.74031, 0, 0.854902, 1, 1,
0.009994227, 1.084437, 0.180627, 0, 0.8509804, 1, 1,
0.0124801, 0.2044342, 0.07495226, 0, 0.8431373, 1, 1,
0.013996, 1.420652, -1.106945, 0, 0.8392157, 1, 1,
0.01788328, 1.775844, 0.007700752, 0, 0.8313726, 1, 1,
0.01818213, -0.1577611, 2.865205, 0, 0.827451, 1, 1,
0.02113836, -2.128954, 3.229325, 0, 0.8196079, 1, 1,
0.02362855, -0.4491692, 3.82725, 0, 0.8156863, 1, 1,
0.02604352, 0.486902, -0.5648792, 0, 0.8078431, 1, 1,
0.03069648, -0.8221688, 4.206764, 0, 0.8039216, 1, 1,
0.03815324, 1.040755, 1.55045, 0, 0.7960784, 1, 1,
0.04171319, -0.1186842, 2.010217, 0, 0.7882353, 1, 1,
0.05301222, 0.0842669, 0.1981264, 0, 0.7843137, 1, 1,
0.05435778, -0.2487989, 3.327918, 0, 0.7764706, 1, 1,
0.05664356, 0.2851256, 1.060691, 0, 0.772549, 1, 1,
0.06380088, -0.04706701, 3.062433, 0, 0.7647059, 1, 1,
0.06830969, -0.8431737, 2.50131, 0, 0.7607843, 1, 1,
0.06903513, 0.5929211, -0.1270221, 0, 0.7529412, 1, 1,
0.07515099, -0.9461131, 2.95198, 0, 0.7490196, 1, 1,
0.07675896, -0.6221657, 3.364992, 0, 0.7411765, 1, 1,
0.08028609, 0.6747174, 0.9629307, 0, 0.7372549, 1, 1,
0.083607, 1.7448, -0.6079727, 0, 0.7294118, 1, 1,
0.08411513, 0.3930312, 1.15596, 0, 0.7254902, 1, 1,
0.09072784, -0.09429611, 2.106558, 0, 0.7176471, 1, 1,
0.09181291, -0.4677423, 3.828133, 0, 0.7137255, 1, 1,
0.09197264, -0.5803176, 2.372987, 0, 0.7058824, 1, 1,
0.09271869, -0.4040752, 2.759231, 0, 0.6980392, 1, 1,
0.09284636, -0.7414008, 3.170279, 0, 0.6941177, 1, 1,
0.09472367, 0.9130358, 0.7556645, 0, 0.6862745, 1, 1,
0.09693588, -0.1861116, 3.946224, 0, 0.682353, 1, 1,
0.09704586, -0.8526971, 1.011039, 0, 0.6745098, 1, 1,
0.09882999, -1.723642, 3.790091, 0, 0.6705883, 1, 1,
0.1059433, -1.763738, 3.213236, 0, 0.6627451, 1, 1,
0.1103026, 0.7997345, 0.8441439, 0, 0.6588235, 1, 1,
0.1107359, -1.82312, 5.386768, 0, 0.6509804, 1, 1,
0.1110903, 0.4514953, -1.920635, 0, 0.6470588, 1, 1,
0.1142585, -0.3933406, 3.831132, 0, 0.6392157, 1, 1,
0.1158936, 0.2582927, 0.1086171, 0, 0.6352941, 1, 1,
0.116311, 0.4706046, -0.124594, 0, 0.627451, 1, 1,
0.1225358, 1.140296, -0.08219901, 0, 0.6235294, 1, 1,
0.1235235, -0.5662764, 3.35051, 0, 0.6156863, 1, 1,
0.1256775, 1.684039, 0.2065945, 0, 0.6117647, 1, 1,
0.1264754, 1.981431, 0.147004, 0, 0.6039216, 1, 1,
0.1265997, -1.118957, 2.117581, 0, 0.5960785, 1, 1,
0.1311604, -0.08995971, 3.084222, 0, 0.5921569, 1, 1,
0.1348452, -0.4876132, 3.361841, 0, 0.5843138, 1, 1,
0.1358652, -0.03258549, 2.43349, 0, 0.5803922, 1, 1,
0.1382195, 0.8888284, -0.02828132, 0, 0.572549, 1, 1,
0.1395763, -0.4431668, 0.9752311, 0, 0.5686275, 1, 1,
0.1404133, -1.523578, 3.480542, 0, 0.5607843, 1, 1,
0.1423645, -0.05460003, 0.4167202, 0, 0.5568628, 1, 1,
0.1434076, 0.7175441, -0.3621214, 0, 0.5490196, 1, 1,
0.1454471, 2.146595, -0.3241439, 0, 0.5450981, 1, 1,
0.147739, -0.5155836, 4.164651, 0, 0.5372549, 1, 1,
0.1483939, -0.2719356, 2.907113, 0, 0.5333334, 1, 1,
0.1491077, 1.454762, 0.3439007, 0, 0.5254902, 1, 1,
0.1540545, -0.2277761, 2.989524, 0, 0.5215687, 1, 1,
0.15737, 0.8255631, -0.2370696, 0, 0.5137255, 1, 1,
0.1578172, -1.461767, -0.2376215, 0, 0.509804, 1, 1,
0.1635907, 0.0206014, 0.3989191, 0, 0.5019608, 1, 1,
0.1656239, 1.82454, 2.124704, 0, 0.4941176, 1, 1,
0.1698956, -0.1302234, 3.165354, 0, 0.4901961, 1, 1,
0.1715144, 0.4137304, 0.340683, 0, 0.4823529, 1, 1,
0.1720266, -0.3197941, 3.625756, 0, 0.4784314, 1, 1,
0.1779353, 0.8607047, -0.8475506, 0, 0.4705882, 1, 1,
0.1788488, -0.9512054, 2.365412, 0, 0.4666667, 1, 1,
0.1821244, 0.04925795, 0.8136742, 0, 0.4588235, 1, 1,
0.1838586, -0.1997927, 1.619653, 0, 0.454902, 1, 1,
0.1841931, 0.8517332, 0.596274, 0, 0.4470588, 1, 1,
0.1845949, 1.470773, 0.8538666, 0, 0.4431373, 1, 1,
0.1857482, -0.7276708, 2.458145, 0, 0.4352941, 1, 1,
0.1909669, -1.243095, 3.410846, 0, 0.4313726, 1, 1,
0.1917281, 0.115623, -0.1419563, 0, 0.4235294, 1, 1,
0.2019068, -0.2593846, 2.45832, 0, 0.4196078, 1, 1,
0.2081253, 0.1533531, 0.4941973, 0, 0.4117647, 1, 1,
0.2162973, 0.06017696, -0.02828372, 0, 0.4078431, 1, 1,
0.2180346, -0.09986358, -0.3232854, 0, 0.4, 1, 1,
0.21995, -1.964828, 3.515468, 0, 0.3921569, 1, 1,
0.2263908, 1.399415, -1.413455, 0, 0.3882353, 1, 1,
0.2269292, -1.357822, 2.483179, 0, 0.3803922, 1, 1,
0.2299592, 1.083706, 1.030434, 0, 0.3764706, 1, 1,
0.2307745, 0.4566152, 1.292486, 0, 0.3686275, 1, 1,
0.2333065, 1.570277, 0.7376277, 0, 0.3647059, 1, 1,
0.236478, -1.317467, 3.025091, 0, 0.3568628, 1, 1,
0.238111, -0.745146, 3.938526, 0, 0.3529412, 1, 1,
0.2399214, 0.7247767, 0.2060916, 0, 0.345098, 1, 1,
0.2465007, 0.09214703, 1.186133, 0, 0.3411765, 1, 1,
0.2470883, 0.03056748, 1.772071, 0, 0.3333333, 1, 1,
0.2488195, 1.784466, 1.715064, 0, 0.3294118, 1, 1,
0.2495919, 1.858987, 0.4970077, 0, 0.3215686, 1, 1,
0.2559516, -0.3747656, 5.243538, 0, 0.3176471, 1, 1,
0.2606593, -0.2922176, 3.413663, 0, 0.3098039, 1, 1,
0.2639717, -1.108049, 3.577076, 0, 0.3058824, 1, 1,
0.2727691, -1.006356, 2.739559, 0, 0.2980392, 1, 1,
0.2784458, 1.384276, -1.713137, 0, 0.2901961, 1, 1,
0.2790508, 1.414832, -0.5761804, 0, 0.2862745, 1, 1,
0.2814835, -0.7825985, 2.835283, 0, 0.2784314, 1, 1,
0.2847992, 1.085641, -0.5518115, 0, 0.2745098, 1, 1,
0.2869845, -1.435504, 2.867864, 0, 0.2666667, 1, 1,
0.2871976, 0.7436209, 2.572812, 0, 0.2627451, 1, 1,
0.2886752, 0.8376573, 1.36631, 0, 0.254902, 1, 1,
0.2919637, -0.156549, 2.475153, 0, 0.2509804, 1, 1,
0.2932411, 0.5362524, -1.29811, 0, 0.2431373, 1, 1,
0.293999, 0.2496608, -0.808348, 0, 0.2392157, 1, 1,
0.2945032, 0.4060352, -0.9155135, 0, 0.2313726, 1, 1,
0.2950716, 1.743119, 1.672965, 0, 0.227451, 1, 1,
0.2953622, 1.005357, 0.3580334, 0, 0.2196078, 1, 1,
0.2977195, -0.3357272, 3.7671, 0, 0.2156863, 1, 1,
0.3018855, 0.3001248, 1.126927, 0, 0.2078431, 1, 1,
0.3038225, -0.2361644, 2.064075, 0, 0.2039216, 1, 1,
0.3070206, 0.7032549, -0.7222531, 0, 0.1960784, 1, 1,
0.3091635, 0.103896, 2.253204, 0, 0.1882353, 1, 1,
0.3130161, -0.5377537, 1.215434, 0, 0.1843137, 1, 1,
0.3230323, 1.72945, -0.1088324, 0, 0.1764706, 1, 1,
0.3264026, -3.330947, 3.994823, 0, 0.172549, 1, 1,
0.3315537, 0.3764302, 0.3953331, 0, 0.1647059, 1, 1,
0.3353817, -0.5159636, 4.473377, 0, 0.1607843, 1, 1,
0.3408639, -0.6157427, 1.322759, 0, 0.1529412, 1, 1,
0.3414341, -0.9983114, 3.108015, 0, 0.1490196, 1, 1,
0.3466328, 0.06669602, -0.4198494, 0, 0.1411765, 1, 1,
0.3507436, 0.1015019, 2.057839, 0, 0.1372549, 1, 1,
0.3512911, 1.669009, 0.5358925, 0, 0.1294118, 1, 1,
0.3516541, 1.271638, 1.635073, 0, 0.1254902, 1, 1,
0.3518706, 0.9953229, -1.443402, 0, 0.1176471, 1, 1,
0.3523078, 0.0907178, 1.719833, 0, 0.1137255, 1, 1,
0.3593003, -1.279785, 2.11932, 0, 0.1058824, 1, 1,
0.3611668, -2.926848, 3.091287, 0, 0.09803922, 1, 1,
0.3651435, -0.5486869, 3.264164, 0, 0.09411765, 1, 1,
0.3653717, 0.2368233, 0.4466335, 0, 0.08627451, 1, 1,
0.3663445, 1.129726, -0.1330871, 0, 0.08235294, 1, 1,
0.3669517, 0.2621258, 0.5421988, 0, 0.07450981, 1, 1,
0.3677577, -0.8496783, 1.738487, 0, 0.07058824, 1, 1,
0.3692715, 0.7774854, 0.2470883, 0, 0.0627451, 1, 1,
0.3720306, -0.4324517, 4.277409, 0, 0.05882353, 1, 1,
0.3756988, -0.556491, 4.078376, 0, 0.05098039, 1, 1,
0.3773647, -0.7030227, 1.318438, 0, 0.04705882, 1, 1,
0.3810435, -0.2236839, 1.592149, 0, 0.03921569, 1, 1,
0.3835216, -0.3269672, 0.9438868, 0, 0.03529412, 1, 1,
0.3849581, 2.026073, -0.5400175, 0, 0.02745098, 1, 1,
0.3857777, 0.2365734, 1.713004, 0, 0.02352941, 1, 1,
0.3880137, 0.392052, -0.9374245, 0, 0.01568628, 1, 1,
0.3881423, -1.688237, 3.358206, 0, 0.01176471, 1, 1,
0.3982419, -0.3796593, 2.02297, 0, 0.003921569, 1, 1,
0.4000687, -0.1371208, 1.25737, 0.003921569, 0, 1, 1,
0.4042289, 1.006227, -0.2761234, 0.007843138, 0, 1, 1,
0.4048009, -0.9489352, 2.53066, 0.01568628, 0, 1, 1,
0.4075514, 0.1921543, 1.723547, 0.01960784, 0, 1, 1,
0.4121915, -1.78626, -0.874684, 0.02745098, 0, 1, 1,
0.4137649, -1.552291, 1.788847, 0.03137255, 0, 1, 1,
0.4145304, 1.735576, 1.821605, 0.03921569, 0, 1, 1,
0.4151447, -0.5947655, 1.813028, 0.04313726, 0, 1, 1,
0.4166501, 1.13216, 0.8447452, 0.05098039, 0, 1, 1,
0.423792, 2.471187, -0.1251719, 0.05490196, 0, 1, 1,
0.4263088, 1.067331, -0.3517508, 0.0627451, 0, 1, 1,
0.4291918, 0.2772818, 0.9388945, 0.06666667, 0, 1, 1,
0.4294513, 0.4204928, -0.05103778, 0.07450981, 0, 1, 1,
0.4317132, -2.07333, 2.08817, 0.07843138, 0, 1, 1,
0.4319474, -0.6191269, 2.934961, 0.08627451, 0, 1, 1,
0.4330899, -0.8633735, 3.114718, 0.09019608, 0, 1, 1,
0.4363923, 0.4816246, 1.037235, 0.09803922, 0, 1, 1,
0.4390686, -0.3345221, 1.244108, 0.1058824, 0, 1, 1,
0.4407266, 0.195108, 2.606354, 0.1098039, 0, 1, 1,
0.4433794, -0.02412078, 0.6753925, 0.1176471, 0, 1, 1,
0.4465221, 1.228466, 0.5133113, 0.1215686, 0, 1, 1,
0.4473415, 0.2875172, 0.8054689, 0.1294118, 0, 1, 1,
0.4523736, -0.09600827, 0.483902, 0.1333333, 0, 1, 1,
0.4566701, 0.3733574, 0.114594, 0.1411765, 0, 1, 1,
0.4568237, -3.68184, 4.175308, 0.145098, 0, 1, 1,
0.4617777, -0.2192856, 3.066632, 0.1529412, 0, 1, 1,
0.4719713, -0.9040121, 1.499331, 0.1568628, 0, 1, 1,
0.4737822, 0.8512729, -0.3937255, 0.1647059, 0, 1, 1,
0.4745004, -0.5054845, 2.230581, 0.1686275, 0, 1, 1,
0.4807004, -0.7760674, 0.2383607, 0.1764706, 0, 1, 1,
0.4853364, -0.4425828, 1.944289, 0.1803922, 0, 1, 1,
0.4864494, 0.6276594, 1.881758, 0.1882353, 0, 1, 1,
0.4866248, -0.2939932, 2.684211, 0.1921569, 0, 1, 1,
0.4892815, -0.4435212, 2.458204, 0.2, 0, 1, 1,
0.4920653, -0.2800454, 1.701805, 0.2078431, 0, 1, 1,
0.4932, 0.2601293, 0.494801, 0.2117647, 0, 1, 1,
0.4975238, 0.8646296, -0.7562422, 0.2196078, 0, 1, 1,
0.4987394, 1.138845, 0.8109803, 0.2235294, 0, 1, 1,
0.5017849, -0.8200795, 2.915549, 0.2313726, 0, 1, 1,
0.5099677, 0.2244808, 1.771528, 0.2352941, 0, 1, 1,
0.5141808, 0.7255948, 0.1564613, 0.2431373, 0, 1, 1,
0.5215573, -0.00721089, 1.11376, 0.2470588, 0, 1, 1,
0.5309523, 1.145719, -0.2083875, 0.254902, 0, 1, 1,
0.5325606, 0.1358331, 2.333645, 0.2588235, 0, 1, 1,
0.5333098, -2.006628, 2.124794, 0.2666667, 0, 1, 1,
0.5351487, 1.062657, -1.572216, 0.2705882, 0, 1, 1,
0.5397778, 0.2375438, 1.244391, 0.2784314, 0, 1, 1,
0.5403161, -0.8572122, 0.8746406, 0.282353, 0, 1, 1,
0.5439714, -0.08907892, 2.299752, 0.2901961, 0, 1, 1,
0.5573038, 1.647527, 1.09296, 0.2941177, 0, 1, 1,
0.5657477, 1.228953, 0.8712706, 0.3019608, 0, 1, 1,
0.5701327, 2.101532, 1.358641, 0.3098039, 0, 1, 1,
0.5791534, -1.103334, 1.166422, 0.3137255, 0, 1, 1,
0.580957, -1.238182, 2.29846, 0.3215686, 0, 1, 1,
0.5828147, -1.568431, 3.486512, 0.3254902, 0, 1, 1,
0.5891085, 0.6550219, 1.530576, 0.3333333, 0, 1, 1,
0.5897454, -0.3329628, 3.220069, 0.3372549, 0, 1, 1,
0.5935302, -1.206026, 2.98704, 0.345098, 0, 1, 1,
0.5957162, -0.4550495, 1.378002, 0.3490196, 0, 1, 1,
0.5964584, 0.1062615, 2.39468, 0.3568628, 0, 1, 1,
0.5998899, 0.7105426, -0.8287244, 0.3607843, 0, 1, 1,
0.6004319, 0.987304, 1.466623, 0.3686275, 0, 1, 1,
0.601849, -0.1687646, 1.967061, 0.372549, 0, 1, 1,
0.605839, -1.592615, 3.044314, 0.3803922, 0, 1, 1,
0.6063409, 1.012069, 0.4710679, 0.3843137, 0, 1, 1,
0.6119994, 0.8606227, 2.751433, 0.3921569, 0, 1, 1,
0.6135624, 1.124866, 1.265599, 0.3960784, 0, 1, 1,
0.6163738, 1.216458, 0.2818941, 0.4039216, 0, 1, 1,
0.6169922, 0.2016975, 0.1684918, 0.4117647, 0, 1, 1,
0.6182891, -0.1783986, 2.738585, 0.4156863, 0, 1, 1,
0.624297, -0.1172696, 2.451772, 0.4235294, 0, 1, 1,
0.6245279, -1.049845, 3.086288, 0.427451, 0, 1, 1,
0.6267781, 1.525156, -0.04367265, 0.4352941, 0, 1, 1,
0.6290507, 0.7553749, 0.01195457, 0.4392157, 0, 1, 1,
0.6312339, -0.3059504, 3.165634, 0.4470588, 0, 1, 1,
0.6335969, -1.390456, 4.213589, 0.4509804, 0, 1, 1,
0.6371603, 0.1105789, 0.899555, 0.4588235, 0, 1, 1,
0.6420833, 1.375649, -0.3220174, 0.4627451, 0, 1, 1,
0.6423873, -1.654689, 4.572888, 0.4705882, 0, 1, 1,
0.6557976, 1.63887, 1.575657, 0.4745098, 0, 1, 1,
0.6566763, 1.150585, -0.7203759, 0.4823529, 0, 1, 1,
0.6580999, -0.04713301, 1.321398, 0.4862745, 0, 1, 1,
0.658884, -0.6620245, 0.1230333, 0.4941176, 0, 1, 1,
0.6720243, -0.1716969, 0.9542151, 0.5019608, 0, 1, 1,
0.6743459, 0.8712087, -1.253904, 0.5058824, 0, 1, 1,
0.6753628, -0.3101055, 2.311919, 0.5137255, 0, 1, 1,
0.6767418, -2.047903, 3.127823, 0.5176471, 0, 1, 1,
0.6767589, 0.9715142, 0.6797561, 0.5254902, 0, 1, 1,
0.681183, -0.289411, 2.29676, 0.5294118, 0, 1, 1,
0.6882143, -0.2820534, 2.949307, 0.5372549, 0, 1, 1,
0.6962788, 0.1131792, 0.3012991, 0.5411765, 0, 1, 1,
0.6980599, -1.298828, 3.986373, 0.5490196, 0, 1, 1,
0.6985874, -0.3318685, 1.587659, 0.5529412, 0, 1, 1,
0.7080278, 0.2753237, 2.27597, 0.5607843, 0, 1, 1,
0.7080829, 1.472027, 0.4994478, 0.5647059, 0, 1, 1,
0.7106779, -2.254903, 3.478286, 0.572549, 0, 1, 1,
0.7176364, 0.5776953, 1.197778, 0.5764706, 0, 1, 1,
0.7222592, 1.993165, -0.6934685, 0.5843138, 0, 1, 1,
0.7235116, 0.09629581, 1.233544, 0.5882353, 0, 1, 1,
0.7304996, -1.073997, 1.584381, 0.5960785, 0, 1, 1,
0.7325504, -0.601506, 2.518225, 0.6039216, 0, 1, 1,
0.7363699, -0.6087937, 2.234875, 0.6078432, 0, 1, 1,
0.738578, 1.61446, 1.461726, 0.6156863, 0, 1, 1,
0.7478327, -1.322869, 2.132371, 0.6196079, 0, 1, 1,
0.7591425, -0.2661586, 2.272108, 0.627451, 0, 1, 1,
0.7592235, -0.624723, 1.043161, 0.6313726, 0, 1, 1,
0.7737218, -2.479106, 4.729588, 0.6392157, 0, 1, 1,
0.779305, 0.4576932, 1.245503, 0.6431373, 0, 1, 1,
0.7793778, -1.035094, 1.683291, 0.6509804, 0, 1, 1,
0.7802603, -1.058333, 2.990437, 0.654902, 0, 1, 1,
0.7821788, -2.076461, 1.858038, 0.6627451, 0, 1, 1,
0.7827414, -0.3799466, 2.591717, 0.6666667, 0, 1, 1,
0.7842262, -1.292628, 3.420259, 0.6745098, 0, 1, 1,
0.7875756, 0.8403491, 0.9104122, 0.6784314, 0, 1, 1,
0.7964954, 0.5619416, -0.1160846, 0.6862745, 0, 1, 1,
0.7998728, 1.407442, 0.5179179, 0.6901961, 0, 1, 1,
0.8018759, -0.6435851, 1.432026, 0.6980392, 0, 1, 1,
0.8037968, 1.207394, 3.244911, 0.7058824, 0, 1, 1,
0.8038716, -0.699014, 0.5980697, 0.7098039, 0, 1, 1,
0.8051301, -0.5488256, 3.605589, 0.7176471, 0, 1, 1,
0.8051547, -1.055294, 3.078684, 0.7215686, 0, 1, 1,
0.8060526, 1.220637, 1.403567, 0.7294118, 0, 1, 1,
0.8066106, 0.3559841, 0.08898547, 0.7333333, 0, 1, 1,
0.8073869, -0.8091829, 0.3805387, 0.7411765, 0, 1, 1,
0.8215613, -1.79411, 2.136283, 0.7450981, 0, 1, 1,
0.8232547, -0.02429345, 2.001737, 0.7529412, 0, 1, 1,
0.8237078, 1.039063, 1.769919, 0.7568628, 0, 1, 1,
0.8254789, -0.06383077, 3.14397, 0.7647059, 0, 1, 1,
0.8271176, -0.519127, 2.130866, 0.7686275, 0, 1, 1,
0.8374023, 0.7156779, 0.01420164, 0.7764706, 0, 1, 1,
0.8379775, 0.8837668, 1.331047, 0.7803922, 0, 1, 1,
0.8383226, -1.167607, 2.04049, 0.7882353, 0, 1, 1,
0.8412946, 0.5382858, 1.544371, 0.7921569, 0, 1, 1,
0.8423433, 1.132897, 0.925017, 0.8, 0, 1, 1,
0.8491579, 1.426057, 0.8284823, 0.8078431, 0, 1, 1,
0.8501761, -0.8902519, 1.825567, 0.8117647, 0, 1, 1,
0.8516767, 0.4471141, 0.9583699, 0.8196079, 0, 1, 1,
0.8549063, 0.5376261, 1.8308, 0.8235294, 0, 1, 1,
0.8602965, -1.62988, 2.101712, 0.8313726, 0, 1, 1,
0.8630474, 1.223339, 1.773965, 0.8352941, 0, 1, 1,
0.8643439, 0.8246726, -0.04091034, 0.8431373, 0, 1, 1,
0.8654375, -0.1148385, 2.163695, 0.8470588, 0, 1, 1,
0.8656884, 0.4525582, 1.170313, 0.854902, 0, 1, 1,
0.866338, -1.108401, 4.632559, 0.8588235, 0, 1, 1,
0.8703492, 1.065388, 0.1048173, 0.8666667, 0, 1, 1,
0.8726726, 0.03044195, 3.368655, 0.8705882, 0, 1, 1,
0.8767181, -1.319351, 4.00944, 0.8784314, 0, 1, 1,
0.8795394, 0.3544934, 0.4830963, 0.8823529, 0, 1, 1,
0.8850014, -1.449912, 0.1318094, 0.8901961, 0, 1, 1,
0.8887345, -1.074098, 3.524668, 0.8941177, 0, 1, 1,
0.8903834, -0.1561484, 1.929347, 0.9019608, 0, 1, 1,
0.8946412, 0.7347235, 2.460907, 0.9098039, 0, 1, 1,
0.895476, -2.516796, 2.050343, 0.9137255, 0, 1, 1,
0.9150146, 1.456752, 0.5432901, 0.9215686, 0, 1, 1,
0.9244872, 2.263267, 3.150918, 0.9254902, 0, 1, 1,
0.9273354, 1.423856, 1.084153, 0.9333333, 0, 1, 1,
0.9350529, 0.5335675, 0.5349414, 0.9372549, 0, 1, 1,
0.9353526, -0.0329662, 1.157989, 0.945098, 0, 1, 1,
0.9364227, -0.949554, 2.8066, 0.9490196, 0, 1, 1,
0.9391093, 0.3186616, 2.383837, 0.9568627, 0, 1, 1,
0.9433525, -0.4128912, 1.142288, 0.9607843, 0, 1, 1,
0.9450604, -0.2565278, 1.294592, 0.9686275, 0, 1, 1,
0.9506136, -0.9962674, 3.952592, 0.972549, 0, 1, 1,
0.952028, -0.3926637, 0.5140752, 0.9803922, 0, 1, 1,
0.955425, -0.01839692, 0.9861981, 0.9843137, 0, 1, 1,
0.9655466, -1.225464, 1.141462, 0.9921569, 0, 1, 1,
0.9688436, 0.8941799, -0.5247027, 0.9960784, 0, 1, 1,
0.9689184, -0.02327349, 2.19876, 1, 0, 0.9960784, 1,
0.9691901, 2.174755, -0.7486314, 1, 0, 0.9882353, 1,
0.9740145, 0.09740332, 1.291771, 1, 0, 0.9843137, 1,
0.9779888, 0.1855813, 0.2730419, 1, 0, 0.9764706, 1,
0.9814942, -0.7881925, 3.600978, 1, 0, 0.972549, 1,
0.9818661, 0.556564, 0.4546024, 1, 0, 0.9647059, 1,
0.9829515, -0.2791804, 0.07514041, 1, 0, 0.9607843, 1,
0.9834717, -0.4330918, 3.111709, 1, 0, 0.9529412, 1,
0.9844797, 1.282596, -1.793515, 1, 0, 0.9490196, 1,
0.9896597, 1.311782, 1.395299, 1, 0, 0.9411765, 1,
0.9905599, -1.06335, 1.199224, 1, 0, 0.9372549, 1,
0.9913275, 0.9418662, -0.393039, 1, 0, 0.9294118, 1,
0.9968008, 1.080482, 0.3607745, 1, 0, 0.9254902, 1,
1.000707, 1.40469, -1.973498, 1, 0, 0.9176471, 1,
1.005625, -0.1719406, 3.072273, 1, 0, 0.9137255, 1,
1.005802, -0.6516997, 2.536086, 1, 0, 0.9058824, 1,
1.014794, 0.8463039, 1.151661, 1, 0, 0.9019608, 1,
1.027327, -0.2686779, 2.440179, 1, 0, 0.8941177, 1,
1.030457, -0.9285162, 3.208781, 1, 0, 0.8862745, 1,
1.041361, -0.04798231, 2.352533, 1, 0, 0.8823529, 1,
1.04491, 0.4047384, 1.628871, 1, 0, 0.8745098, 1,
1.047595, 0.6154984, 2.06409, 1, 0, 0.8705882, 1,
1.049483, 0.3862195, 2.165126, 1, 0, 0.8627451, 1,
1.052553, 0.8170204, 0.5716822, 1, 0, 0.8588235, 1,
1.053653, 0.05789027, 2.128226, 1, 0, 0.8509804, 1,
1.059837, -0.6259563, 5.337955, 1, 0, 0.8470588, 1,
1.060487, -0.1996555, 1.606031, 1, 0, 0.8392157, 1,
1.0651, 0.231118, 1.018094, 1, 0, 0.8352941, 1,
1.071695, -0.4554395, 0.7993749, 1, 0, 0.827451, 1,
1.071962, -0.138757, 2.603361, 1, 0, 0.8235294, 1,
1.081051, -0.1756074, 1.406419, 1, 0, 0.8156863, 1,
1.087186, -0.6975753, 4.129057, 1, 0, 0.8117647, 1,
1.100599, -0.271051, 0.8685352, 1, 0, 0.8039216, 1,
1.110711, 0.3261053, 1.348156, 1, 0, 0.7960784, 1,
1.111027, 1.746725, 0.5015922, 1, 0, 0.7921569, 1,
1.112549, -0.2113404, 1.582432, 1, 0, 0.7843137, 1,
1.113222, -0.1222416, 0.1950966, 1, 0, 0.7803922, 1,
1.116883, 0.5184789, 2.180132, 1, 0, 0.772549, 1,
1.126809, -0.6270559, 2.048836, 1, 0, 0.7686275, 1,
1.132514, -0.281993, 0.3176301, 1, 0, 0.7607843, 1,
1.135981, 0.4014455, 0.7989231, 1, 0, 0.7568628, 1,
1.143644, -0.6246518, 1.923849, 1, 0, 0.7490196, 1,
1.147186, 0.9960696, 1.901478, 1, 0, 0.7450981, 1,
1.149709, 0.4076773, 0.9856962, 1, 0, 0.7372549, 1,
1.150602, -2.828098, 2.788719, 1, 0, 0.7333333, 1,
1.15447, 0.4992745, 2.752566, 1, 0, 0.7254902, 1,
1.166996, -1.063221, 3.125705, 1, 0, 0.7215686, 1,
1.179685, 0.306218, 0.4475989, 1, 0, 0.7137255, 1,
1.181044, -1.025795, 0.4665373, 1, 0, 0.7098039, 1,
1.181628, 1.797708, 2.177138, 1, 0, 0.7019608, 1,
1.182478, -1.333583, 1.536424, 1, 0, 0.6941177, 1,
1.186998, 0.7162798, 0.1798051, 1, 0, 0.6901961, 1,
1.187634, -1.364274, 1.777175, 1, 0, 0.682353, 1,
1.190462, 0.6232952, 2.257253, 1, 0, 0.6784314, 1,
1.19414, 1.691707, 0.05711941, 1, 0, 0.6705883, 1,
1.194244, -1.889413, -0.9538274, 1, 0, 0.6666667, 1,
1.197481, -0.7621168, 2.444958, 1, 0, 0.6588235, 1,
1.21267, -0.4281881, 2.839653, 1, 0, 0.654902, 1,
1.215505, -1.28472, 3.875613, 1, 0, 0.6470588, 1,
1.21615, 1.386582, 2.022693, 1, 0, 0.6431373, 1,
1.216841, -0.287057, 2.318994, 1, 0, 0.6352941, 1,
1.218507, -1.56647, 4.103278, 1, 0, 0.6313726, 1,
1.221274, -0.1456802, 1.063699, 1, 0, 0.6235294, 1,
1.22156, -0.8945501, 1.239997, 1, 0, 0.6196079, 1,
1.221569, -2.091132, 3.043993, 1, 0, 0.6117647, 1,
1.236576, -0.7635649, 1.591365, 1, 0, 0.6078432, 1,
1.243158, 2.365658, -2.508055, 1, 0, 0.6, 1,
1.245259, -0.05615012, 1.772868, 1, 0, 0.5921569, 1,
1.246301, -0.6070397, 2.100166, 1, 0, 0.5882353, 1,
1.249575, 1.316964, -0.4699824, 1, 0, 0.5803922, 1,
1.25046, 0.07845698, 0.7035475, 1, 0, 0.5764706, 1,
1.257303, -0.006443839, 1.111705, 1, 0, 0.5686275, 1,
1.270484, 0.597868, 0.7928477, 1, 0, 0.5647059, 1,
1.282114, -0.1168118, 3.18736, 1, 0, 0.5568628, 1,
1.282292, -1.406307, 3.743864, 1, 0, 0.5529412, 1,
1.282451, 1.161199, 0.658572, 1, 0, 0.5450981, 1,
1.285915, 0.5781465, 1.189138, 1, 0, 0.5411765, 1,
1.286343, -0.9718242, 2.670005, 1, 0, 0.5333334, 1,
1.286459, -0.7453147, 2.109883, 1, 0, 0.5294118, 1,
1.289984, -0.09772916, 2.580065, 1, 0, 0.5215687, 1,
1.290541, 0.1516262, 0.4848838, 1, 0, 0.5176471, 1,
1.292304, 0.9711545, 0.7512479, 1, 0, 0.509804, 1,
1.309287, -1.089739, 1.506269, 1, 0, 0.5058824, 1,
1.321404, -0.02611502, 1.473647, 1, 0, 0.4980392, 1,
1.326387, -0.3908994, 1.560911, 1, 0, 0.4901961, 1,
1.337868, 0.7272615, 1.630163, 1, 0, 0.4862745, 1,
1.340431, 1.013221, 0.5234006, 1, 0, 0.4784314, 1,
1.340473, -0.2752796, 0.8591354, 1, 0, 0.4745098, 1,
1.340764, 1.76991, 1.067723, 1, 0, 0.4666667, 1,
1.35215, 0.882194, 1.167776, 1, 0, 0.4627451, 1,
1.367781, -0.8280628, 1.596778, 1, 0, 0.454902, 1,
1.388181, 1.177098, 1.941661, 1, 0, 0.4509804, 1,
1.407656, 0.7551658, 0.7649587, 1, 0, 0.4431373, 1,
1.413653, -0.9737371, 3.653152, 1, 0, 0.4392157, 1,
1.413788, -1.404989, 1.655591, 1, 0, 0.4313726, 1,
1.417891, -0.2717609, 0.1210633, 1, 0, 0.427451, 1,
1.421693, -0.4459275, 3.732991, 1, 0, 0.4196078, 1,
1.421962, 0.514262, 0.5160879, 1, 0, 0.4156863, 1,
1.437483, -0.8090373, 1.869713, 1, 0, 0.4078431, 1,
1.439518, 0.9505737, 1.079188, 1, 0, 0.4039216, 1,
1.447895, -0.7389271, 1.729741, 1, 0, 0.3960784, 1,
1.455276, -0.4263328, 3.884327, 1, 0, 0.3882353, 1,
1.456363, -2.334496, 1.598032, 1, 0, 0.3843137, 1,
1.457758, -0.6422107, 1.125469, 1, 0, 0.3764706, 1,
1.458458, -0.5981451, 1.233425, 1, 0, 0.372549, 1,
1.466463, -0.4914875, 1.258837, 1, 0, 0.3647059, 1,
1.479889, 1.992884, -0.07799077, 1, 0, 0.3607843, 1,
1.481813, -0.815973, 0.7634318, 1, 0, 0.3529412, 1,
1.488498, 0.3050326, 2.213228, 1, 0, 0.3490196, 1,
1.497529, -1.601622, 3.862421, 1, 0, 0.3411765, 1,
1.499958, 1.190698, -0.2081372, 1, 0, 0.3372549, 1,
1.501307, -1.291396, 1.767276, 1, 0, 0.3294118, 1,
1.503555, 0.7199867, 0.02907098, 1, 0, 0.3254902, 1,
1.507397, -1.080912, 1.62386, 1, 0, 0.3176471, 1,
1.508272, -1.708869, 2.364618, 1, 0, 0.3137255, 1,
1.534259, 0.5919164, 1.182403, 1, 0, 0.3058824, 1,
1.535995, -1.025967, 1.922711, 1, 0, 0.2980392, 1,
1.572961, 0.6101485, 0.9608738, 1, 0, 0.2941177, 1,
1.58742, 1.417937, 1.686319, 1, 0, 0.2862745, 1,
1.606097, 0.0280555, 2.370605, 1, 0, 0.282353, 1,
1.611304, 0.6238772, 0.7438488, 1, 0, 0.2745098, 1,
1.62114, 0.8989527, 0.8970218, 1, 0, 0.2705882, 1,
1.625432, -0.2836078, 0.4852291, 1, 0, 0.2627451, 1,
1.636358, 0.3718306, 1.356351, 1, 0, 0.2588235, 1,
1.637827, 1.393308, 1.521581, 1, 0, 0.2509804, 1,
1.665602, -0.4929433, 1.604292, 1, 0, 0.2470588, 1,
1.704147, -0.2514759, 2.808518, 1, 0, 0.2392157, 1,
1.709767, 0.2539823, -0.5727162, 1, 0, 0.2352941, 1,
1.709884, 0.3044837, 2.156045, 1, 0, 0.227451, 1,
1.714259, -2.314483, 2.865772, 1, 0, 0.2235294, 1,
1.723943, -1.109684, 4.051436, 1, 0, 0.2156863, 1,
1.729412, -0.2268377, 1.988311, 1, 0, 0.2117647, 1,
1.729678, 0.1366418, 0.7478033, 1, 0, 0.2039216, 1,
1.739311, 0.6145483, 2.032549, 1, 0, 0.1960784, 1,
1.756427, -0.4000139, 0.849119, 1, 0, 0.1921569, 1,
1.759117, 1.009718, 0.7890213, 1, 0, 0.1843137, 1,
1.779575, 0.836099, 1.340029, 1, 0, 0.1803922, 1,
1.790211, -0.6495826, 2.671244, 1, 0, 0.172549, 1,
1.804181, -1.341136, 1.925828, 1, 0, 0.1686275, 1,
1.804572, 1.74502, 2.51932, 1, 0, 0.1607843, 1,
1.820283, -1.451177, 1.710466, 1, 0, 0.1568628, 1,
1.830072, 0.4103599, 1.288439, 1, 0, 0.1490196, 1,
1.842378, 1.041885, 0.180715, 1, 0, 0.145098, 1,
1.8946, -0.6209596, 0.3312518, 1, 0, 0.1372549, 1,
1.907593, -0.3921173, 1.749967, 1, 0, 0.1333333, 1,
1.927625, 0.4179655, 0.6385695, 1, 0, 0.1254902, 1,
1.939167, -0.7452072, 0.2563962, 1, 0, 0.1215686, 1,
1.939784, 0.06104641, 1.855687, 1, 0, 0.1137255, 1,
1.977138, 0.007288526, 0.9454129, 1, 0, 0.1098039, 1,
1.986405, 0.7095942, 1.901097, 1, 0, 0.1019608, 1,
2.027068, -0.1746425, 1.855751, 1, 0, 0.09411765, 1,
2.038515, -0.7461637, 2.998366, 1, 0, 0.09019608, 1,
2.044714, 1.022529, 1.088341, 1, 0, 0.08235294, 1,
2.060921, 0.432605, 1.4694, 1, 0, 0.07843138, 1,
2.159294, -0.2465803, 3.174853, 1, 0, 0.07058824, 1,
2.164976, 1.185966, 1.441054, 1, 0, 0.06666667, 1,
2.17487, 0.5146633, 1.313825, 1, 0, 0.05882353, 1,
2.178166, 1.315272, -0.105337, 1, 0, 0.05490196, 1,
2.214612, -1.507321, 2.592867, 1, 0, 0.04705882, 1,
2.242895, 0.3730371, 2.817262, 1, 0, 0.04313726, 1,
2.288453, -0.8445142, 1.476424, 1, 0, 0.03529412, 1,
2.369707, -0.2266949, 2.583469, 1, 0, 0.03137255, 1,
2.48459, -0.3624099, 3.463104, 1, 0, 0.02352941, 1,
2.593717, 1.104758, 0.7096039, 1, 0, 0.01960784, 1,
2.696178, -1.156831, 2.598937, 1, 0, 0.01176471, 1,
2.925597, 3.222929, 0.936097, 1, 0, 0.007843138, 1
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
-0.0511688, -4.852198, -7.6102, 0, -0.5, 0.5, 0.5,
-0.0511688, -4.852198, -7.6102, 1, -0.5, 0.5, 0.5,
-0.0511688, -4.852198, -7.6102, 1, 1.5, 0.5, 0.5,
-0.0511688, -4.852198, -7.6102, 0, 1.5, 0.5, 0.5
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
-4.037058, -0.2294554, -7.6102, 0, -0.5, 0.5, 0.5,
-4.037058, -0.2294554, -7.6102, 1, -0.5, 0.5, 0.5,
-4.037058, -0.2294554, -7.6102, 1, 1.5, 0.5, 0.5,
-4.037058, -0.2294554, -7.6102, 0, 1.5, 0.5, 0.5
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
-4.037058, -4.852198, -0.1698666, 0, -0.5, 0.5, 0.5,
-4.037058, -4.852198, -0.1698666, 1, -0.5, 0.5, 0.5,
-4.037058, -4.852198, -0.1698666, 1, 1.5, 0.5, 0.5,
-4.037058, -4.852198, -0.1698666, 0, 1.5, 0.5, 0.5
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
-3, -3.785411, -5.8932,
2, -3.785411, -5.8932,
-3, -3.785411, -5.8932,
-3, -3.963209, -6.179367,
-2, -3.785411, -5.8932,
-2, -3.963209, -6.179367,
-1, -3.785411, -5.8932,
-1, -3.963209, -6.179367,
0, -3.785411, -5.8932,
0, -3.963209, -6.179367,
1, -3.785411, -5.8932,
1, -3.963209, -6.179367,
2, -3.785411, -5.8932,
2, -3.963209, -6.179367
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
-3, -4.318805, -6.7517, 0, -0.5, 0.5, 0.5,
-3, -4.318805, -6.7517, 1, -0.5, 0.5, 0.5,
-3, -4.318805, -6.7517, 1, 1.5, 0.5, 0.5,
-3, -4.318805, -6.7517, 0, 1.5, 0.5, 0.5,
-2, -4.318805, -6.7517, 0, -0.5, 0.5, 0.5,
-2, -4.318805, -6.7517, 1, -0.5, 0.5, 0.5,
-2, -4.318805, -6.7517, 1, 1.5, 0.5, 0.5,
-2, -4.318805, -6.7517, 0, 1.5, 0.5, 0.5,
-1, -4.318805, -6.7517, 0, -0.5, 0.5, 0.5,
-1, -4.318805, -6.7517, 1, -0.5, 0.5, 0.5,
-1, -4.318805, -6.7517, 1, 1.5, 0.5, 0.5,
-1, -4.318805, -6.7517, 0, 1.5, 0.5, 0.5,
0, -4.318805, -6.7517, 0, -0.5, 0.5, 0.5,
0, -4.318805, -6.7517, 1, -0.5, 0.5, 0.5,
0, -4.318805, -6.7517, 1, 1.5, 0.5, 0.5,
0, -4.318805, -6.7517, 0, 1.5, 0.5, 0.5,
1, -4.318805, -6.7517, 0, -0.5, 0.5, 0.5,
1, -4.318805, -6.7517, 1, -0.5, 0.5, 0.5,
1, -4.318805, -6.7517, 1, 1.5, 0.5, 0.5,
1, -4.318805, -6.7517, 0, 1.5, 0.5, 0.5,
2, -4.318805, -6.7517, 0, -0.5, 0.5, 0.5,
2, -4.318805, -6.7517, 1, -0.5, 0.5, 0.5,
2, -4.318805, -6.7517, 1, 1.5, 0.5, 0.5,
2, -4.318805, -6.7517, 0, 1.5, 0.5, 0.5
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
-3.117238, -3, -5.8932,
-3.117238, 3, -5.8932,
-3.117238, -3, -5.8932,
-3.270541, -3, -6.179367,
-3.117238, -2, -5.8932,
-3.270541, -2, -6.179367,
-3.117238, -1, -5.8932,
-3.270541, -1, -6.179367,
-3.117238, 0, -5.8932,
-3.270541, 0, -6.179367,
-3.117238, 1, -5.8932,
-3.270541, 1, -6.179367,
-3.117238, 2, -5.8932,
-3.270541, 2, -6.179367,
-3.117238, 3, -5.8932,
-3.270541, 3, -6.179367
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
-3.577148, -3, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, -3, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, -3, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, -3, -6.7517, 0, 1.5, 0.5, 0.5,
-3.577148, -2, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, -2, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, -2, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, -2, -6.7517, 0, 1.5, 0.5, 0.5,
-3.577148, -1, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, -1, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, -1, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, -1, -6.7517, 0, 1.5, 0.5, 0.5,
-3.577148, 0, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, 0, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, 0, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, 0, -6.7517, 0, 1.5, 0.5, 0.5,
-3.577148, 1, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, 1, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, 1, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, 1, -6.7517, 0, 1.5, 0.5, 0.5,
-3.577148, 2, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, 2, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, 2, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, 2, -6.7517, 0, 1.5, 0.5, 0.5,
-3.577148, 3, -6.7517, 0, -0.5, 0.5, 0.5,
-3.577148, 3, -6.7517, 1, -0.5, 0.5, 0.5,
-3.577148, 3, -6.7517, 1, 1.5, 0.5, 0.5,
-3.577148, 3, -6.7517, 0, 1.5, 0.5, 0.5
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
-3.117238, -3.785411, -4,
-3.117238, -3.785411, 4,
-3.117238, -3.785411, -4,
-3.270541, -3.963209, -4,
-3.117238, -3.785411, -2,
-3.270541, -3.963209, -2,
-3.117238, -3.785411, 0,
-3.270541, -3.963209, 0,
-3.117238, -3.785411, 2,
-3.270541, -3.963209, 2,
-3.117238, -3.785411, 4,
-3.270541, -3.963209, 4
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
-3.577148, -4.318805, -4, 0, -0.5, 0.5, 0.5,
-3.577148, -4.318805, -4, 1, -0.5, 0.5, 0.5,
-3.577148, -4.318805, -4, 1, 1.5, 0.5, 0.5,
-3.577148, -4.318805, -4, 0, 1.5, 0.5, 0.5,
-3.577148, -4.318805, -2, 0, -0.5, 0.5, 0.5,
-3.577148, -4.318805, -2, 1, -0.5, 0.5, 0.5,
-3.577148, -4.318805, -2, 1, 1.5, 0.5, 0.5,
-3.577148, -4.318805, -2, 0, 1.5, 0.5, 0.5,
-3.577148, -4.318805, 0, 0, -0.5, 0.5, 0.5,
-3.577148, -4.318805, 0, 1, -0.5, 0.5, 0.5,
-3.577148, -4.318805, 0, 1, 1.5, 0.5, 0.5,
-3.577148, -4.318805, 0, 0, 1.5, 0.5, 0.5,
-3.577148, -4.318805, 2, 0, -0.5, 0.5, 0.5,
-3.577148, -4.318805, 2, 1, -0.5, 0.5, 0.5,
-3.577148, -4.318805, 2, 1, 1.5, 0.5, 0.5,
-3.577148, -4.318805, 2, 0, 1.5, 0.5, 0.5,
-3.577148, -4.318805, 4, 0, -0.5, 0.5, 0.5,
-3.577148, -4.318805, 4, 1, -0.5, 0.5, 0.5,
-3.577148, -4.318805, 4, 1, 1.5, 0.5, 0.5,
-3.577148, -4.318805, 4, 0, 1.5, 0.5, 0.5
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
-3.117238, -3.785411, -5.8932,
-3.117238, 3.3265, -5.8932,
-3.117238, -3.785411, 5.553467,
-3.117238, 3.3265, 5.553467,
-3.117238, -3.785411, -5.8932,
-3.117238, -3.785411, 5.553467,
-3.117238, 3.3265, -5.8932,
-3.117238, 3.3265, 5.553467,
-3.117238, -3.785411, -5.8932,
3.0149, -3.785411, -5.8932,
-3.117238, -3.785411, 5.553467,
3.0149, -3.785411, 5.553467,
-3.117238, 3.3265, -5.8932,
3.0149, 3.3265, -5.8932,
-3.117238, 3.3265, 5.553467,
3.0149, 3.3265, 5.553467,
3.0149, -3.785411, -5.8932,
3.0149, 3.3265, -5.8932,
3.0149, -3.785411, 5.553467,
3.0149, 3.3265, 5.553467,
3.0149, -3.785411, -5.8932,
3.0149, -3.785411, 5.553467,
3.0149, 3.3265, -5.8932,
3.0149, 3.3265, 5.553467
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
var radius = 7.905953;
var distance = 35.17448;
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
mvMatrix.translate( 0.0511688, 0.2294554, 0.1698666 );
mvMatrix.scale( 1.393979, 1.201937, 0.7467738 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17448);
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
sulprophos<-read.table("sulprophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulprophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulprophos' not found
```

```r
y<-sulprophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulprophos' not found
```

```r
z<-sulprophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulprophos' not found
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
-3.027935, -2.290314, -1.223966, 0, 0, 1, 1, 1,
-2.94697, -1.12794, -1.803012, 1, 0, 0, 1, 1,
-2.848437, -1.640791, -2.872263, 1, 0, 0, 1, 1,
-2.828238, -1.647427, -1.418041, 1, 0, 0, 1, 1,
-2.763387, -0.6742147, -1.863881, 1, 0, 0, 1, 1,
-2.747255, 0.9345403, -2.005288, 1, 0, 0, 1, 1,
-2.702091, 0.1431211, -2.708885, 0, 0, 0, 1, 1,
-2.607188, -1.818344, -0.3474124, 0, 0, 0, 1, 1,
-2.554357, 0.870438, -2.228208, 0, 0, 0, 1, 1,
-2.511601, 1.171925, -1.715233, 0, 0, 0, 1, 1,
-2.440876, 0.5227373, -2.063689, 0, 0, 0, 1, 1,
-2.260404, -1.449455, -3.614875, 0, 0, 0, 1, 1,
-2.259466, -0.9765564, -0.6753798, 0, 0, 0, 1, 1,
-2.231754, -1.175173, -3.495155, 1, 1, 1, 1, 1,
-2.217115, 0.1561399, -3.012454, 1, 1, 1, 1, 1,
-2.193704, 0.3091593, -0.5197494, 1, 1, 1, 1, 1,
-2.137491, 1.629175, -0.8889215, 1, 1, 1, 1, 1,
-2.132088, -0.3860244, -3.072763, 1, 1, 1, 1, 1,
-2.117028, 0.729826, 1.010569, 1, 1, 1, 1, 1,
-2.097024, -0.08508964, -0.8928722, 1, 1, 1, 1, 1,
-2.090257, 3.180196, 0.1068576, 1, 1, 1, 1, 1,
-2.049254, 1.536669, -1.375808, 1, 1, 1, 1, 1,
-2.032154, -0.7289869, -0.1499348, 1, 1, 1, 1, 1,
-1.980732, 1.287317, -0.5774983, 1, 1, 1, 1, 1,
-1.976678, 0.6992509, 0.3835646, 1, 1, 1, 1, 1,
-1.955383, 0.2637025, -1.029474, 1, 1, 1, 1, 1,
-1.949622, 0.4108374, -1.847013, 1, 1, 1, 1, 1,
-1.947468, -0.6900396, -1.94399, 1, 1, 1, 1, 1,
-1.943668, 0.3053719, -2.879457, 0, 0, 1, 1, 1,
-1.925558, -0.1293856, -1.830319, 1, 0, 0, 1, 1,
-1.923686, -1.641887, -1.059408, 1, 0, 0, 1, 1,
-1.922861, -1.836699, -3.12473, 1, 0, 0, 1, 1,
-1.912146, 0.09754694, -0.9219154, 1, 0, 0, 1, 1,
-1.901589, 1.585157, 1.011739, 1, 0, 0, 1, 1,
-1.878689, 0.317081, 1.07811, 0, 0, 0, 1, 1,
-1.871694, -0.424755, -1.788254, 0, 0, 0, 1, 1,
-1.850293, 1.325041, -0.2155505, 0, 0, 0, 1, 1,
-1.841344, -0.07919623, -1.558, 0, 0, 0, 1, 1,
-1.839316, -1.550034, -0.871599, 0, 0, 0, 1, 1,
-1.836104, -0.6919982, -1.815983, 0, 0, 0, 1, 1,
-1.824064, 0.5671697, -0.7644155, 0, 0, 0, 1, 1,
-1.821982, -0.7505805, -3.309386, 1, 1, 1, 1, 1,
-1.816449, -0.26065, -1.601013, 1, 1, 1, 1, 1,
-1.810233, 1.274513, -0.1582443, 1, 1, 1, 1, 1,
-1.805923, -2.363819, -2.390688, 1, 1, 1, 1, 1,
-1.758881, 0.05972131, -3.041085, 1, 1, 1, 1, 1,
-1.756741, 0.8994742, -1.514152, 1, 1, 1, 1, 1,
-1.741983, 0.00361347, -1.825477, 1, 1, 1, 1, 1,
-1.739488, -0.5915583, -1.435627, 1, 1, 1, 1, 1,
-1.730633, 0.09324711, -1.700433, 1, 1, 1, 1, 1,
-1.715765, 0.3226222, -2.208842, 1, 1, 1, 1, 1,
-1.705985, -1.268607, -2.864852, 1, 1, 1, 1, 1,
-1.704948, 0.2024808, -1.310083, 1, 1, 1, 1, 1,
-1.696856, 1.001715, -2.475874, 1, 1, 1, 1, 1,
-1.687676, 0.3160509, -2.426304, 1, 1, 1, 1, 1,
-1.68449, -0.1233355, -0.4513858, 1, 1, 1, 1, 1,
-1.675679, -1.552572, -1.327928, 0, 0, 1, 1, 1,
-1.673995, -0.0416839, -1.667385, 1, 0, 0, 1, 1,
-1.663208, 0.05734488, -1.437977, 1, 0, 0, 1, 1,
-1.660555, 0.3775097, -1.534626, 1, 0, 0, 1, 1,
-1.658762, 0.2034661, -0.778749, 1, 0, 0, 1, 1,
-1.657393, 1.936017, -0.7616084, 1, 0, 0, 1, 1,
-1.656658, -0.03591363, -0.5787038, 0, 0, 0, 1, 1,
-1.653984, 0.4629421, -0.9411075, 0, 0, 0, 1, 1,
-1.644356, -0.3253995, -0.7063437, 0, 0, 0, 1, 1,
-1.631527, -1.696735, -1.889982, 0, 0, 0, 1, 1,
-1.620407, -0.1094482, -4.157912, 0, 0, 0, 1, 1,
-1.589813, 0.5747678, -1.11473, 0, 0, 0, 1, 1,
-1.585734, 0.8288015, -0.9722024, 0, 0, 0, 1, 1,
-1.572721, -0.1460354, -0.9520661, 1, 1, 1, 1, 1,
-1.57063, -1.108428, -4.185693, 1, 1, 1, 1, 1,
-1.560616, -0.4666123, -0.9275275, 1, 1, 1, 1, 1,
-1.556284, 0.006204755, -0.4428129, 1, 1, 1, 1, 1,
-1.545569, 0.2010383, -0.9261624, 1, 1, 1, 1, 1,
-1.537853, -0.2915212, -0.9403099, 1, 1, 1, 1, 1,
-1.535563, 0.5353867, -1.425416, 1, 1, 1, 1, 1,
-1.529983, -0.3819775, -0.315381, 1, 1, 1, 1, 1,
-1.528147, 0.2582365, -1.251705, 1, 1, 1, 1, 1,
-1.507488, 1.267055, -0.7956944, 1, 1, 1, 1, 1,
-1.502237, 0.3742487, 0.638097, 1, 1, 1, 1, 1,
-1.489853, -0.6261219, 0.03176804, 1, 1, 1, 1, 1,
-1.471458, -0.6913462, -2.151089, 1, 1, 1, 1, 1,
-1.471281, 1.512218, -1.45322, 1, 1, 1, 1, 1,
-1.465454, -0.5795124, -2.48862, 1, 1, 1, 1, 1,
-1.46512, 0.2544311, -0.2568438, 0, 0, 1, 1, 1,
-1.45476, -0.1633734, -1.327569, 1, 0, 0, 1, 1,
-1.446123, -0.6298117, -2.518079, 1, 0, 0, 1, 1,
-1.439057, 0.9654024, 1.629345, 1, 0, 0, 1, 1,
-1.435037, 0.3227714, -1.867201, 1, 0, 0, 1, 1,
-1.434731, 0.585748, -1.482664, 1, 0, 0, 1, 1,
-1.410866, -1.124283, -3.160899, 0, 0, 0, 1, 1,
-1.408341, 2.298577, -1.679422, 0, 0, 0, 1, 1,
-1.405996, 1.488137, 0.7059867, 0, 0, 0, 1, 1,
-1.404851, 1.350258, 0.3794269, 0, 0, 0, 1, 1,
-1.404579, -1.151487, -2.972284, 0, 0, 0, 1, 1,
-1.401783, 0.6880727, 1.074295, 0, 0, 0, 1, 1,
-1.400142, 0.4629469, -0.04280924, 0, 0, 0, 1, 1,
-1.39469, 0.5206757, 1.20446, 1, 1, 1, 1, 1,
-1.390228, -0.8015726, -1.496143, 1, 1, 1, 1, 1,
-1.383783, 0.4212204, -0.2988394, 1, 1, 1, 1, 1,
-1.382463, 0.1696702, -1.419157, 1, 1, 1, 1, 1,
-1.377738, -0.006536807, -1.011605, 1, 1, 1, 1, 1,
-1.375375, 0.4962599, -0.9924123, 1, 1, 1, 1, 1,
-1.374711, 1.069564, -1.87246, 1, 1, 1, 1, 1,
-1.37334, 0.197354, -2.222043, 1, 1, 1, 1, 1,
-1.37283, -0.3927607, -1.717362, 1, 1, 1, 1, 1,
-1.362574, -2.410722, -1.319895, 1, 1, 1, 1, 1,
-1.360937, -0.8367641, -0.870189, 1, 1, 1, 1, 1,
-1.355005, 0.7314743, -1.263104, 1, 1, 1, 1, 1,
-1.345044, -0.8589735, -2.789142, 1, 1, 1, 1, 1,
-1.344528, -0.6103057, -1.43264, 1, 1, 1, 1, 1,
-1.339706, 0.2234268, -1.958427, 1, 1, 1, 1, 1,
-1.339404, -0.274911, -2.616702, 0, 0, 1, 1, 1,
-1.337284, -0.3107177, -2.707017, 1, 0, 0, 1, 1,
-1.331961, -1.328751, -2.935144, 1, 0, 0, 1, 1,
-1.33, 0.1892886, -0.688248, 1, 0, 0, 1, 1,
-1.318004, 0.07707079, -1.685569, 1, 0, 0, 1, 1,
-1.312959, 1.002655, -0.4942677, 1, 0, 0, 1, 1,
-1.312099, 0.901858, -0.3816478, 0, 0, 0, 1, 1,
-1.309332, -0.05336274, -2.253386, 0, 0, 0, 1, 1,
-1.301309, 0.3744338, -1.218063, 0, 0, 0, 1, 1,
-1.286782, -1.517461, -1.557949, 0, 0, 0, 1, 1,
-1.28116, -1.028883, -3.198386, 0, 0, 0, 1, 1,
-1.280657, -1.156338, -1.43045, 0, 0, 0, 1, 1,
-1.277176, -1.385063, -1.93775, 0, 0, 0, 1, 1,
-1.275629, 0.8059293, -0.7184566, 1, 1, 1, 1, 1,
-1.263154, -0.726048, -2.954204, 1, 1, 1, 1, 1,
-1.255707, -0.7250735, -1.578681, 1, 1, 1, 1, 1,
-1.254651, 0.2919633, -2.874765, 1, 1, 1, 1, 1,
-1.254333, -2.439184, -4.681978, 1, 1, 1, 1, 1,
-1.245138, -1.390646, -4.923544, 1, 1, 1, 1, 1,
-1.231735, 0.4972776, -1.660803, 1, 1, 1, 1, 1,
-1.202163, -0.9232651, -3.028876, 1, 1, 1, 1, 1,
-1.196913, 0.384655, -1.949156, 1, 1, 1, 1, 1,
-1.193988, 0.4902793, -2.504366, 1, 1, 1, 1, 1,
-1.192049, -1.035444, -2.294476, 1, 1, 1, 1, 1,
-1.185652, -0.4445182, -2.157828, 1, 1, 1, 1, 1,
-1.184005, 0.1448693, -1.782932, 1, 1, 1, 1, 1,
-1.183003, 0.119947, -1.543986, 1, 1, 1, 1, 1,
-1.173179, -0.6899899, -3.250548, 1, 1, 1, 1, 1,
-1.172494, 0.1854048, -1.100587, 0, 0, 1, 1, 1,
-1.152588, -0.1016329, -1.755105, 1, 0, 0, 1, 1,
-1.142323, -0.4970911, -1.316074, 1, 0, 0, 1, 1,
-1.141253, 0.6409597, -1.212538, 1, 0, 0, 1, 1,
-1.138569, -0.4437182, 0.03984778, 1, 0, 0, 1, 1,
-1.130353, -0.5471337, -1.658955, 1, 0, 0, 1, 1,
-1.128843, -0.1602885, -1.062131, 0, 0, 0, 1, 1,
-1.12549, 1.330238, -1.109468, 0, 0, 0, 1, 1,
-1.12218, -1.987032, -3.599053, 0, 0, 0, 1, 1,
-1.117367, -1.067707, -3.241301, 0, 0, 0, 1, 1,
-1.109933, 1.049301, -1.4571, 0, 0, 0, 1, 1,
-1.102577, 1.279554, -1.899802, 0, 0, 0, 1, 1,
-1.101811, 0.3890014, -0.7516776, 0, 0, 0, 1, 1,
-1.100503, -0.8713831, -2.962011, 1, 1, 1, 1, 1,
-1.099981, 1.002633, 0.7130938, 1, 1, 1, 1, 1,
-1.095213, 1.657004, 0.02984899, 1, 1, 1, 1, 1,
-1.094365, 0.9060836, -1.247663, 1, 1, 1, 1, 1,
-1.093822, 0.9565913, -0.6845819, 1, 1, 1, 1, 1,
-1.086173, -0.4853542, -2.183841, 1, 1, 1, 1, 1,
-1.084924, 0.2226455, -0.1013046, 1, 1, 1, 1, 1,
-1.074014, -0.4349231, -1.14117, 1, 1, 1, 1, 1,
-1.065044, -1.302796, -0.1463098, 1, 1, 1, 1, 1,
-1.064935, -1.019959, -3.281959, 1, 1, 1, 1, 1,
-1.060221, 0.5546061, -0.2766908, 1, 1, 1, 1, 1,
-1.05486, 1.011494, -2.155368, 1, 1, 1, 1, 1,
-1.053696, -0.5860527, -1.381508, 1, 1, 1, 1, 1,
-1.045679, -0.9095291, -2.945054, 1, 1, 1, 1, 1,
-1.044026, 0.9196066, -0.2595266, 1, 1, 1, 1, 1,
-1.042241, 0.1030018, -1.238198, 0, 0, 1, 1, 1,
-1.041997, 0.9821997, 0.02034004, 1, 0, 0, 1, 1,
-1.025374, 0.6754372, -1.550116, 1, 0, 0, 1, 1,
-1.016995, 0.2898631, -1.299885, 1, 0, 0, 1, 1,
-1.013513, 0.2253512, -1.516656, 1, 0, 0, 1, 1,
-1.012199, 0.4619968, 0.8864199, 1, 0, 0, 1, 1,
-1.011742, -0.5878714, -3.568369, 0, 0, 0, 1, 1,
-1.008188, -0.907537, -2.311365, 0, 0, 0, 1, 1,
-1.002753, 0.2049365, -1.104125, 0, 0, 0, 1, 1,
-0.9918564, 0.6241347, -1.580516, 0, 0, 0, 1, 1,
-0.9913165, 0.8408191, 0.4697013, 0, 0, 0, 1, 1,
-0.9864297, 0.7483591, -2.869689, 0, 0, 0, 1, 1,
-0.9801448, 0.1256887, -0.9454398, 0, 0, 0, 1, 1,
-0.9760563, -0.715088, -1.132141, 1, 1, 1, 1, 1,
-0.9722607, 1.89167, -1.090732, 1, 1, 1, 1, 1,
-0.9678629, -0.370372, -0.1737594, 1, 1, 1, 1, 1,
-0.9656469, -0.9178506, -2.787348, 1, 1, 1, 1, 1,
-0.9586796, 0.4690603, 0.3914836, 1, 1, 1, 1, 1,
-0.9524224, 0.05084642, -0.1065618, 1, 1, 1, 1, 1,
-0.9517926, 0.5589389, 1.778341, 1, 1, 1, 1, 1,
-0.9499384, -0.8678547, -0.6030216, 1, 1, 1, 1, 1,
-0.9496464, 0.9426765, -0.6011602, 1, 1, 1, 1, 1,
-0.9428777, -0.2363733, -2.751431, 1, 1, 1, 1, 1,
-0.9390553, -0.4309821, -2.243077, 1, 1, 1, 1, 1,
-0.9368351, 0.03904725, -1.268965, 1, 1, 1, 1, 1,
-0.9301561, 0.3738116, -2.388387, 1, 1, 1, 1, 1,
-0.929033, -0.7393785, -3.606563, 1, 1, 1, 1, 1,
-0.9273371, -0.4996998, -0.8191014, 1, 1, 1, 1, 1,
-0.9246582, 1.170038, -2.617068, 0, 0, 1, 1, 1,
-0.92019, -0.6093916, -2.977401, 1, 0, 0, 1, 1,
-0.9111915, -0.7470397, -2.147319, 1, 0, 0, 1, 1,
-0.9111606, 0.7463797, 0.2268887, 1, 0, 0, 1, 1,
-0.9109251, -0.07569263, -0.2360461, 1, 0, 0, 1, 1,
-0.9040994, 0.5456916, -0.9548338, 1, 0, 0, 1, 1,
-0.9024205, -0.332191, -1.332783, 0, 0, 0, 1, 1,
-0.8986189, -0.467469, -2.064118, 0, 0, 0, 1, 1,
-0.8984907, -0.4967897, -2.446621, 0, 0, 0, 1, 1,
-0.8972293, -0.3240943, -2.658664, 0, 0, 0, 1, 1,
-0.8954808, 1.382729, 1.262857, 0, 0, 0, 1, 1,
-0.8948538, -0.503504, -2.156169, 0, 0, 0, 1, 1,
-0.892674, 0.215727, -0.4774232, 0, 0, 0, 1, 1,
-0.8864576, 1.053464, -0.3764306, 1, 1, 1, 1, 1,
-0.8838187, -0.6565399, -1.094103, 1, 1, 1, 1, 1,
-0.8814824, -0.2548301, -2.458026, 1, 1, 1, 1, 1,
-0.8802765, 0.5376801, -1.562432, 1, 1, 1, 1, 1,
-0.8783395, 1.820491, 0.7692915, 1, 1, 1, 1, 1,
-0.8741859, -1.250404, -2.724569, 1, 1, 1, 1, 1,
-0.8738089, 1.096095, -3.452643, 1, 1, 1, 1, 1,
-0.8720255, -0.9410281, -2.218114, 1, 1, 1, 1, 1,
-0.8695644, 1.707691, -2.013299, 1, 1, 1, 1, 1,
-0.8678454, -0.0946402, -4.250823, 1, 1, 1, 1, 1,
-0.8671632, -1.402379, -1.928558, 1, 1, 1, 1, 1,
-0.8514884, 0.6123148, 0.02677796, 1, 1, 1, 1, 1,
-0.848564, -0.01400332, -1.548671, 1, 1, 1, 1, 1,
-0.8458375, 0.2034014, -0.8017464, 1, 1, 1, 1, 1,
-0.8337955, 1.132747, -0.2123021, 1, 1, 1, 1, 1,
-0.8335145, 0.6367006, -1.392235, 0, 0, 1, 1, 1,
-0.83298, 1.508838, 1.60954, 1, 0, 0, 1, 1,
-0.8252874, 0.2552734, -2.468252, 1, 0, 0, 1, 1,
-0.8140689, 0.9116963, -0.01363664, 1, 0, 0, 1, 1,
-0.810023, -0.09680146, -2.053312, 1, 0, 0, 1, 1,
-0.8097412, -0.7150416, -1.168211, 1, 0, 0, 1, 1,
-0.8076718, -1.236263, -1.948363, 0, 0, 0, 1, 1,
-0.8056541, -0.6270216, -3.77445, 0, 0, 0, 1, 1,
-0.8050166, -0.3798614, -2.031866, 0, 0, 0, 1, 1,
-0.7996519, -0.3394806, -2.492687, 0, 0, 0, 1, 1,
-0.7964443, -0.6653238, -3.160709, 0, 0, 0, 1, 1,
-0.7921577, 0.1497829, -0.9153425, 0, 0, 0, 1, 1,
-0.7913057, -0.6498684, -2.050739, 0, 0, 0, 1, 1,
-0.7896968, 0.8659409, 0.2265041, 1, 1, 1, 1, 1,
-0.788452, 2.001194, 2.131142, 1, 1, 1, 1, 1,
-0.7884022, 1.13985, -0.2167966, 1, 1, 1, 1, 1,
-0.7882898, 2.382325, -0.5122126, 1, 1, 1, 1, 1,
-0.7845539, -0.2015644, 0.1124685, 1, 1, 1, 1, 1,
-0.7825371, 0.9551194, -0.03407379, 1, 1, 1, 1, 1,
-0.7825003, 0.951322, 0.2621778, 1, 1, 1, 1, 1,
-0.7820485, 0.7496222, -0.9778394, 1, 1, 1, 1, 1,
-0.7776904, -0.6953899, -2.808614, 1, 1, 1, 1, 1,
-0.774083, 0.2855189, 1.17295, 1, 1, 1, 1, 1,
-0.7702407, 0.1878969, -1.854577, 1, 1, 1, 1, 1,
-0.7682418, 1.022484, -1.787582, 1, 1, 1, 1, 1,
-0.7625703, -0.8694673, -0.7642701, 1, 1, 1, 1, 1,
-0.7614166, 0.6807064, 1.651214, 1, 1, 1, 1, 1,
-0.7596986, 0.559132, -0.7362567, 1, 1, 1, 1, 1,
-0.7575004, 0.223404, -4.060329, 0, 0, 1, 1, 1,
-0.7484422, 1.823967, -2.043756, 1, 0, 0, 1, 1,
-0.7463456, 0.2643836, -1.106137, 1, 0, 0, 1, 1,
-0.739913, 0.699204, -1.072204, 1, 0, 0, 1, 1,
-0.7388085, 0.0803888, -3.297868, 1, 0, 0, 1, 1,
-0.7385264, -2.624769, -1.252436, 1, 0, 0, 1, 1,
-0.7306048, 0.6345857, -1.153775, 0, 0, 0, 1, 1,
-0.7261234, -0.8086136, -3.427191, 0, 0, 0, 1, 1,
-0.7246679, 0.9115592, -0.01054966, 0, 0, 0, 1, 1,
-0.7245765, -0.7570311, -2.659567, 0, 0, 0, 1, 1,
-0.7145848, 0.593369, -0.08692452, 0, 0, 0, 1, 1,
-0.7050914, -0.05332777, -2.445104, 0, 0, 0, 1, 1,
-0.6998791, 1.539562, 0.3698163, 0, 0, 0, 1, 1,
-0.6910253, -1.258805, -4.286441, 1, 1, 1, 1, 1,
-0.6905239, 0.3543627, -1.720783, 1, 1, 1, 1, 1,
-0.6866831, 1.195267, -0.9858457, 1, 1, 1, 1, 1,
-0.6763912, 1.778879, -0.5704552, 1, 1, 1, 1, 1,
-0.6696292, 0.3049346, 0.2088459, 1, 1, 1, 1, 1,
-0.6696137, 0.9786472, -0.7029878, 1, 1, 1, 1, 1,
-0.6671333, 1.729764, -1.056258, 1, 1, 1, 1, 1,
-0.6653753, -0.01306373, -2.047984, 1, 1, 1, 1, 1,
-0.6577851, -1.768359, -2.4624, 1, 1, 1, 1, 1,
-0.6553598, 0.2132076, -1.090354, 1, 1, 1, 1, 1,
-0.6550931, 0.2829229, -1.511203, 1, 1, 1, 1, 1,
-0.6539083, -0.9192653, -2.33092, 1, 1, 1, 1, 1,
-0.6521181, -0.5140253, -3.933746, 1, 1, 1, 1, 1,
-0.6509757, 1.152016, 1.576368, 1, 1, 1, 1, 1,
-0.6498506, -2.641296, -4.427372, 1, 1, 1, 1, 1,
-0.646251, 0.2153811, -2.067865, 0, 0, 1, 1, 1,
-0.6395396, 0.08835461, -1.666951, 1, 0, 0, 1, 1,
-0.6374004, -1.425542, -2.646897, 1, 0, 0, 1, 1,
-0.6367846, 0.2600767, -2.20546, 1, 0, 0, 1, 1,
-0.6278772, 1.58575, 1.332587, 1, 0, 0, 1, 1,
-0.627836, 0.4337963, -0.6430285, 1, 0, 0, 1, 1,
-0.6252287, 1.312308, -2.833565, 0, 0, 0, 1, 1,
-0.6173952, -0.6622689, -3.266966, 0, 0, 0, 1, 1,
-0.6111993, 1.864429, -1.870542, 0, 0, 0, 1, 1,
-0.6073607, -0.2777823, -2.06111, 0, 0, 0, 1, 1,
-0.6034728, 0.6138631, 1.101209, 0, 0, 0, 1, 1,
-0.5999184, -0.2873464, -0.6974258, 0, 0, 0, 1, 1,
-0.5991877, 0.415611, -2.091842, 0, 0, 0, 1, 1,
-0.597143, -0.1830938, -3.323046, 1, 1, 1, 1, 1,
-0.5941332, -2.04382, -3.522767, 1, 1, 1, 1, 1,
-0.5934865, 0.9703417, -0.0681195, 1, 1, 1, 1, 1,
-0.5926051, -2.218564, -5.017342, 1, 1, 1, 1, 1,
-0.5909376, -1.410023, -1.18671, 1, 1, 1, 1, 1,
-0.5898876, 1.486802, -1.821057, 1, 1, 1, 1, 1,
-0.5894287, 0.2342654, -2.379136, 1, 1, 1, 1, 1,
-0.5884456, 0.253935, -1.577369, 1, 1, 1, 1, 1,
-0.5873471, -0.06278158, -2.103487, 1, 1, 1, 1, 1,
-0.5856779, -0.2440795, -2.184805, 1, 1, 1, 1, 1,
-0.5817488, -1.968502, -2.486749, 1, 1, 1, 1, 1,
-0.5803534, 0.6156663, -1.225552, 1, 1, 1, 1, 1,
-0.5782633, 1.262013, -0.7227581, 1, 1, 1, 1, 1,
-0.577525, 1.110944, -0.2031623, 1, 1, 1, 1, 1,
-0.5774901, 1.807095, -0.03496581, 1, 1, 1, 1, 1,
-0.575012, -0.2410034, -3.073593, 0, 0, 1, 1, 1,
-0.5734509, -0.1140907, -2.157959, 1, 0, 0, 1, 1,
-0.5704904, 0.06335361, -2.334225, 1, 0, 0, 1, 1,
-0.5677813, -0.9417673, -2.117016, 1, 0, 0, 1, 1,
-0.5650529, -0.5479981, -2.378606, 1, 0, 0, 1, 1,
-0.5636513, 0.4471177, -1.837165, 1, 0, 0, 1, 1,
-0.5626058, 0.03370086, -2.914517, 0, 0, 0, 1, 1,
-0.5571053, 0.2419367, -0.8504783, 0, 0, 0, 1, 1,
-0.553654, 0.2185275, -0.5763206, 0, 0, 0, 1, 1,
-0.5521677, -0.2059859, -3.112832, 0, 0, 0, 1, 1,
-0.5465869, -0.9456358, -2.680622, 0, 0, 0, 1, 1,
-0.5450892, 1.193551, 1.563691, 0, 0, 0, 1, 1,
-0.543697, 0.9880849, -1.106922, 0, 0, 0, 1, 1,
-0.5429063, -1.930107, -1.711499, 1, 1, 1, 1, 1,
-0.5377471, 1.154395, -1.242879, 1, 1, 1, 1, 1,
-0.5354061, -1.799705, -4.356978, 1, 1, 1, 1, 1,
-0.5332407, 0.2712401, -1.896672, 1, 1, 1, 1, 1,
-0.5327753, -0.6536811, -4.80401, 1, 1, 1, 1, 1,
-0.5265015, 2.001565, -0.1777801, 1, 1, 1, 1, 1,
-0.5227468, 0.01150944, -0.3108542, 1, 1, 1, 1, 1,
-0.5159966, -0.4995795, -2.61791, 1, 1, 1, 1, 1,
-0.5158533, 1.013493, 0.6774494, 1, 1, 1, 1, 1,
-0.5143775, -0.2850864, -1.695596, 1, 1, 1, 1, 1,
-0.5120742, 1.097239, 1.307456, 1, 1, 1, 1, 1,
-0.5073461, 1.577034, -1.144746, 1, 1, 1, 1, 1,
-0.5062451, 0.7813839, -0.9831812, 1, 1, 1, 1, 1,
-0.5057366, -1.01365, -1.850822, 1, 1, 1, 1, 1,
-0.5024264, 0.4162684, -1.452654, 1, 1, 1, 1, 1,
-0.498489, -0.9045941, -3.436967, 0, 0, 1, 1, 1,
-0.4977027, 0.9682196, 0.4748374, 1, 0, 0, 1, 1,
-0.4897597, 0.7699295, -1.449768, 1, 0, 0, 1, 1,
-0.4848146, 1.268305, -2.32483, 1, 0, 0, 1, 1,
-0.4843163, -0.9436919, -3.171279, 1, 0, 0, 1, 1,
-0.4832067, -0.05650345, -1.07556, 1, 0, 0, 1, 1,
-0.4816158, 1.095387, -0.4693167, 0, 0, 0, 1, 1,
-0.4815421, 0.4763251, -1.858486, 0, 0, 0, 1, 1,
-0.4804511, -0.9169602, -3.252182, 0, 0, 0, 1, 1,
-0.4775425, 1.228659, 0.01072694, 0, 0, 0, 1, 1,
-0.4706721, -0.2101968, -2.776577, 0, 0, 0, 1, 1,
-0.4690152, -0.617418, -0.8765963, 0, 0, 0, 1, 1,
-0.4609109, -0.07425605, -3.84947, 0, 0, 0, 1, 1,
-0.4547517, 1.570206, -0.8666901, 1, 1, 1, 1, 1,
-0.4534857, -0.535844, -3.331816, 1, 1, 1, 1, 1,
-0.4526536, -1.525101, -3.015064, 1, 1, 1, 1, 1,
-0.4503459, -0.09182081, -2.013216, 1, 1, 1, 1, 1,
-0.4500322, -0.8631995, -2.648448, 1, 1, 1, 1, 1,
-0.4469559, -0.3048256, -1.318284, 1, 1, 1, 1, 1,
-0.4461195, 2.939757, -0.7587681, 1, 1, 1, 1, 1,
-0.4446321, 1.533431, 0.3966146, 1, 1, 1, 1, 1,
-0.4439219, -0.485719, -3.950438, 1, 1, 1, 1, 1,
-0.4424248, 1.058236, -1.422584, 1, 1, 1, 1, 1,
-0.4422634, -0.3638725, -1.803072, 1, 1, 1, 1, 1,
-0.4403585, -1.329156, -3.391011, 1, 1, 1, 1, 1,
-0.4393468, -1.928996, -3.808406, 1, 1, 1, 1, 1,
-0.4380782, 0.005794478, -1.877584, 1, 1, 1, 1, 1,
-0.4329615, -0.2137367, -2.18592, 1, 1, 1, 1, 1,
-0.4321512, 0.5857154, -0.5317803, 0, 0, 1, 1, 1,
-0.4280498, 0.5043972, -0.8121431, 1, 0, 0, 1, 1,
-0.4275469, -0.3550354, 0.1396198, 1, 0, 0, 1, 1,
-0.4273349, 0.3468418, -0.4398248, 1, 0, 0, 1, 1,
-0.4243971, -0.4147475, -2.49933, 1, 0, 0, 1, 1,
-0.4240418, 0.5654413, -1.96154, 1, 0, 0, 1, 1,
-0.4239012, 0.8654101, 0.4512985, 0, 0, 0, 1, 1,
-0.4200709, -0.5822188, -1.378952, 0, 0, 0, 1, 1,
-0.4165922, 0.7600541, 0.08681702, 0, 0, 0, 1, 1,
-0.4072172, -0.8374373, -2.629042, 0, 0, 0, 1, 1,
-0.4064932, -0.7832208, -2.462913, 0, 0, 0, 1, 1,
-0.4063543, 1.166554, -1.676908, 0, 0, 0, 1, 1,
-0.4008995, -0.169201, -1.655521, 0, 0, 0, 1, 1,
-0.3976288, 0.2700534, -3.135306, 1, 1, 1, 1, 1,
-0.3971776, -0.735711, -3.382397, 1, 1, 1, 1, 1,
-0.3969731, -0.3737883, -2.669359, 1, 1, 1, 1, 1,
-0.3956648, 0.8743772, -0.9306936, 1, 1, 1, 1, 1,
-0.3866563, 1.11568, -0.8230797, 1, 1, 1, 1, 1,
-0.3839635, -0.4593709, -2.305575, 1, 1, 1, 1, 1,
-0.3836405, -0.0971039, -2.496647, 1, 1, 1, 1, 1,
-0.3830454, -0.7391709, -1.47705, 1, 1, 1, 1, 1,
-0.3818092, -1.21902, -1.126832, 1, 1, 1, 1, 1,
-0.3782402, 1.532825, -1.019716, 1, 1, 1, 1, 1,
-0.3727986, 2.137532, -1.053197, 1, 1, 1, 1, 1,
-0.3714157, -0.7714491, -3.88716, 1, 1, 1, 1, 1,
-0.3709229, 0.02269957, -0.1788827, 1, 1, 1, 1, 1,
-0.3708996, 0.7763921, 1.036054, 1, 1, 1, 1, 1,
-0.3708409, -0.8907526, -3.599362, 1, 1, 1, 1, 1,
-0.3670115, 0.02465151, -1.983361, 0, 0, 1, 1, 1,
-0.3628934, -0.2735561, -2.296859, 1, 0, 0, 1, 1,
-0.3593593, 0.3163706, -0.1228399, 1, 0, 0, 1, 1,
-0.3590302, 0.1764271, -0.8587444, 1, 0, 0, 1, 1,
-0.3546527, -0.9179474, -3.771448, 1, 0, 0, 1, 1,
-0.3534139, -1.551652, -3.047362, 1, 0, 0, 1, 1,
-0.3457649, -0.1203932, -0.5052817, 0, 0, 0, 1, 1,
-0.3399625, 0.05516792, -3.335707, 0, 0, 0, 1, 1,
-0.3396146, -0.2147333, -3.083383, 0, 0, 0, 1, 1,
-0.337669, 0.03429496, -2.017027, 0, 0, 0, 1, 1,
-0.3355015, 0.3025383, -1.655199, 0, 0, 0, 1, 1,
-0.3306488, -1.129934, -2.88335, 0, 0, 0, 1, 1,
-0.3269439, -0.8112118, -1.270851, 0, 0, 0, 1, 1,
-0.3258241, -0.1107931, -1.870253, 1, 1, 1, 1, 1,
-0.3255087, 3.01231, 0.3378752, 1, 1, 1, 1, 1,
-0.3182847, 0.4674263, -0.264531, 1, 1, 1, 1, 1,
-0.3175542, -2.588648, -3.002892, 1, 1, 1, 1, 1,
-0.3163202, 0.1723562, -0.4525152, 1, 1, 1, 1, 1,
-0.3152173, -1.43752, -5.010786, 1, 1, 1, 1, 1,
-0.3133277, -0.5246867, -2.459862, 1, 1, 1, 1, 1,
-0.3127283, 1.930404, -0.8789389, 1, 1, 1, 1, 1,
-0.3109996, -0.03255028, -1.188899, 1, 1, 1, 1, 1,
-0.3092417, 1.216886, -0.09374738, 1, 1, 1, 1, 1,
-0.3082224, 0.01561775, -1.654363, 1, 1, 1, 1, 1,
-0.3076322, -0.8003903, -3.050204, 1, 1, 1, 1, 1,
-0.3051362, -1.727217, -2.304499, 1, 1, 1, 1, 1,
-0.3043918, -0.4664876, -3.264555, 1, 1, 1, 1, 1,
-0.3038515, -0.7506332, -1.445287, 1, 1, 1, 1, 1,
-0.3029552, -0.769787, -2.45496, 0, 0, 1, 1, 1,
-0.2936566, -2.756999, -1.380754, 1, 0, 0, 1, 1,
-0.2934084, 1.746568, 1.46488, 1, 0, 0, 1, 1,
-0.291022, 0.1040483, 0.2396112, 1, 0, 0, 1, 1,
-0.2903357, 0.9829995, -1.396898, 1, 0, 0, 1, 1,
-0.2829836, 1.501917, 0.1278035, 1, 0, 0, 1, 1,
-0.2815403, -0.3819909, -3.819604, 0, 0, 0, 1, 1,
-0.280315, -0.8385329, -2.188149, 0, 0, 0, 1, 1,
-0.2802767, 0.3060255, -0.644138, 0, 0, 0, 1, 1,
-0.27756, 1.271824, -0.1351914, 0, 0, 0, 1, 1,
-0.2755966, -0.9375637, -3.765399, 0, 0, 0, 1, 1,
-0.2751932, 0.6615604, -0.746439, 0, 0, 0, 1, 1,
-0.2743599, 0.5500018, 1.682073, 0, 0, 0, 1, 1,
-0.2742816, 0.2739416, -2.432127, 1, 1, 1, 1, 1,
-0.2742477, -1.404282, -3.373124, 1, 1, 1, 1, 1,
-0.2592131, -0.07512723, -1.859161, 1, 1, 1, 1, 1,
-0.2580852, -1.567896, -2.783339, 1, 1, 1, 1, 1,
-0.2530695, 1.130191, 1.467893, 1, 1, 1, 1, 1,
-0.2527106, -0.7850514, -5.726501, 1, 1, 1, 1, 1,
-0.2518148, 0.1471444, -0.1208997, 1, 1, 1, 1, 1,
-0.2455425, 2.013868, -0.146115, 1, 1, 1, 1, 1,
-0.2442625, -0.8097308, -2.39902, 1, 1, 1, 1, 1,
-0.2439615, 1.969792, -0.2214851, 1, 1, 1, 1, 1,
-0.2359276, 0.09513096, -1.069655, 1, 1, 1, 1, 1,
-0.2343837, -1.399727, -3.088783, 1, 1, 1, 1, 1,
-0.2290722, -0.4822535, -0.1073651, 1, 1, 1, 1, 1,
-0.2275661, 0.7127538, -2.167783, 1, 1, 1, 1, 1,
-0.2257663, 0.3180756, -1.920691, 1, 1, 1, 1, 1,
-0.2154979, -0.2805401, -1.289457, 0, 0, 1, 1, 1,
-0.2065066, 0.8313537, 2.334814, 1, 0, 0, 1, 1,
-0.2059402, 0.6148807, 0.4748193, 1, 0, 0, 1, 1,
-0.2036146, -0.09336568, -2.582233, 1, 0, 0, 1, 1,
-0.2021818, -0.1613133, -1.449387, 1, 0, 0, 1, 1,
-0.2011566, 0.2192373, -2.734948, 1, 0, 0, 1, 1,
-0.1985495, 0.7419084, 0.1153411, 0, 0, 0, 1, 1,
-0.1953081, -0.4276609, -2.242138, 0, 0, 0, 1, 1,
-0.1923953, 0.6515222, 0.7055148, 0, 0, 0, 1, 1,
-0.1908534, 0.397779, -0.1061538, 0, 0, 0, 1, 1,
-0.1826311, 0.2994818, 0.4692873, 0, 0, 0, 1, 1,
-0.1738632, 0.5944433, -2.332931, 0, 0, 0, 1, 1,
-0.1731889, 1.062042, -0.4944043, 0, 0, 0, 1, 1,
-0.1629822, 0.992121, -0.8989232, 1, 1, 1, 1, 1,
-0.1592329, -1.210337, -3.241988, 1, 1, 1, 1, 1,
-0.1528118, 0.8325959, 0.9162869, 1, 1, 1, 1, 1,
-0.1500237, 0.1460885, -1.07026, 1, 1, 1, 1, 1,
-0.1485887, -0.8316775, -2.536796, 1, 1, 1, 1, 1,
-0.1448862, -0.007089864, -0.7605282, 1, 1, 1, 1, 1,
-0.141623, -0.830029, -2.528194, 1, 1, 1, 1, 1,
-0.139212, -0.4419631, -1.298321, 1, 1, 1, 1, 1,
-0.1359891, 0.8711473, 0.7223088, 1, 1, 1, 1, 1,
-0.13472, -0.5819989, -3.16231, 1, 1, 1, 1, 1,
-0.1280791, -0.4034187, -3.883901, 1, 1, 1, 1, 1,
-0.1272124, 0.1687651, -1.220859, 1, 1, 1, 1, 1,
-0.1208365, 1.264692, -1.585411, 1, 1, 1, 1, 1,
-0.1172878, -0.2453039, -2.227671, 1, 1, 1, 1, 1,
-0.1166866, -0.5295851, -3.355235, 1, 1, 1, 1, 1,
-0.1166682, -2.24086, -3.145804, 0, 0, 1, 1, 1,
-0.1164, -0.09411398, -1.425928, 1, 0, 0, 1, 1,
-0.1163645, 0.2399245, -1.269054, 1, 0, 0, 1, 1,
-0.1145088, 0.8290867, -0.6006638, 1, 0, 0, 1, 1,
-0.1142195, -0.6308162, -1.481483, 1, 0, 0, 1, 1,
-0.1126107, -1.01976, -0.6125018, 1, 0, 0, 1, 1,
-0.1066638, -0.01338977, -3.096351, 0, 0, 0, 1, 1,
-0.1061928, 1.26559, -0.7077867, 0, 0, 0, 1, 1,
-0.1046062, 1.340629, 0.7168072, 0, 0, 0, 1, 1,
-0.1041319, 1.558868, 2.567455, 0, 0, 0, 1, 1,
-0.1018832, -1.212551, -2.861052, 0, 0, 0, 1, 1,
-0.09699079, -0.09041823, -0.3863974, 0, 0, 0, 1, 1,
-0.09640088, -0.4547838, -2.579565, 0, 0, 0, 1, 1,
-0.09508447, 0.9157057, 0.2276471, 1, 1, 1, 1, 1,
-0.08614577, -0.1790879, -2.464304, 1, 1, 1, 1, 1,
-0.08466773, 1.264705, -1.219666, 1, 1, 1, 1, 1,
-0.08445992, 0.7834036, 0.2312938, 1, 1, 1, 1, 1,
-0.07186139, -0.3164158, -2.672225, 1, 1, 1, 1, 1,
-0.07114219, 1.11806, 1.555357, 1, 1, 1, 1, 1,
-0.07107671, -0.4369434, -2.980058, 1, 1, 1, 1, 1,
-0.06802556, -1.309858, -2.070096, 1, 1, 1, 1, 1,
-0.06641439, 0.3421655, 0.3384319, 1, 1, 1, 1, 1,
-0.06587441, -1.883836, -1.947065, 1, 1, 1, 1, 1,
-0.06411494, 0.479037, 1.023612, 1, 1, 1, 1, 1,
-0.06295455, -0.982235, -3.7566, 1, 1, 1, 1, 1,
-0.06212936, 0.4995084, -0.0602503, 1, 1, 1, 1, 1,
-0.05896259, -0.6650203, -2.135975, 1, 1, 1, 1, 1,
-0.05339305, 0.7581775, -0.452507, 1, 1, 1, 1, 1,
-0.05254806, -0.6134207, -2.08111, 0, 0, 1, 1, 1,
-0.05138439, -0.7024941, -4.633295, 1, 0, 0, 1, 1,
-0.04306947, -2.008674, -4.207597, 1, 0, 0, 1, 1,
-0.03636048, 1.617082, -1.444847, 1, 0, 0, 1, 1,
-0.03302228, 0.008755226, -2.249347, 1, 0, 0, 1, 1,
-0.03271486, -1.509586, -2.763875, 1, 0, 0, 1, 1,
-0.0315035, -0.8268597, -2.110834, 0, 0, 0, 1, 1,
-0.02971767, 1.198653, 0.1212885, 0, 0, 0, 1, 1,
-0.02841946, -0.2571425, -5.204865, 0, 0, 0, 1, 1,
-0.02596894, -0.6723669, -4.082854, 0, 0, 0, 1, 1,
-0.02237752, -0.9122381, -4.596484, 0, 0, 0, 1, 1,
-0.01887146, 0.02758404, -1.101935, 0, 0, 0, 1, 1,
-0.01835753, 0.2936279, 1.081898, 0, 0, 0, 1, 1,
-0.01506843, -0.5895352, -4.256488, 1, 1, 1, 1, 1,
-0.01230394, 0.403015, -1.260747, 1, 1, 1, 1, 1,
-0.00847757, 2.684201, -0.555573, 1, 1, 1, 1, 1,
-0.006194296, -0.4557149, -3.227368, 1, 1, 1, 1, 1,
-0.003649746, 1.238544, 0.2828908, 1, 1, 1, 1, 1,
0.006083834, 1.519166, 0.2187361, 1, 1, 1, 1, 1,
0.00670861, 0.3842623, 0.1982108, 1, 1, 1, 1, 1,
0.007526502, -1.777867, 4.74031, 1, 1, 1, 1, 1,
0.009994227, 1.084437, 0.180627, 1, 1, 1, 1, 1,
0.0124801, 0.2044342, 0.07495226, 1, 1, 1, 1, 1,
0.013996, 1.420652, -1.106945, 1, 1, 1, 1, 1,
0.01788328, 1.775844, 0.007700752, 1, 1, 1, 1, 1,
0.01818213, -0.1577611, 2.865205, 1, 1, 1, 1, 1,
0.02113836, -2.128954, 3.229325, 1, 1, 1, 1, 1,
0.02362855, -0.4491692, 3.82725, 1, 1, 1, 1, 1,
0.02604352, 0.486902, -0.5648792, 0, 0, 1, 1, 1,
0.03069648, -0.8221688, 4.206764, 1, 0, 0, 1, 1,
0.03815324, 1.040755, 1.55045, 1, 0, 0, 1, 1,
0.04171319, -0.1186842, 2.010217, 1, 0, 0, 1, 1,
0.05301222, 0.0842669, 0.1981264, 1, 0, 0, 1, 1,
0.05435778, -0.2487989, 3.327918, 1, 0, 0, 1, 1,
0.05664356, 0.2851256, 1.060691, 0, 0, 0, 1, 1,
0.06380088, -0.04706701, 3.062433, 0, 0, 0, 1, 1,
0.06830969, -0.8431737, 2.50131, 0, 0, 0, 1, 1,
0.06903513, 0.5929211, -0.1270221, 0, 0, 0, 1, 1,
0.07515099, -0.9461131, 2.95198, 0, 0, 0, 1, 1,
0.07675896, -0.6221657, 3.364992, 0, 0, 0, 1, 1,
0.08028609, 0.6747174, 0.9629307, 0, 0, 0, 1, 1,
0.083607, 1.7448, -0.6079727, 1, 1, 1, 1, 1,
0.08411513, 0.3930312, 1.15596, 1, 1, 1, 1, 1,
0.09072784, -0.09429611, 2.106558, 1, 1, 1, 1, 1,
0.09181291, -0.4677423, 3.828133, 1, 1, 1, 1, 1,
0.09197264, -0.5803176, 2.372987, 1, 1, 1, 1, 1,
0.09271869, -0.4040752, 2.759231, 1, 1, 1, 1, 1,
0.09284636, -0.7414008, 3.170279, 1, 1, 1, 1, 1,
0.09472367, 0.9130358, 0.7556645, 1, 1, 1, 1, 1,
0.09693588, -0.1861116, 3.946224, 1, 1, 1, 1, 1,
0.09704586, -0.8526971, 1.011039, 1, 1, 1, 1, 1,
0.09882999, -1.723642, 3.790091, 1, 1, 1, 1, 1,
0.1059433, -1.763738, 3.213236, 1, 1, 1, 1, 1,
0.1103026, 0.7997345, 0.8441439, 1, 1, 1, 1, 1,
0.1107359, -1.82312, 5.386768, 1, 1, 1, 1, 1,
0.1110903, 0.4514953, -1.920635, 1, 1, 1, 1, 1,
0.1142585, -0.3933406, 3.831132, 0, 0, 1, 1, 1,
0.1158936, 0.2582927, 0.1086171, 1, 0, 0, 1, 1,
0.116311, 0.4706046, -0.124594, 1, 0, 0, 1, 1,
0.1225358, 1.140296, -0.08219901, 1, 0, 0, 1, 1,
0.1235235, -0.5662764, 3.35051, 1, 0, 0, 1, 1,
0.1256775, 1.684039, 0.2065945, 1, 0, 0, 1, 1,
0.1264754, 1.981431, 0.147004, 0, 0, 0, 1, 1,
0.1265997, -1.118957, 2.117581, 0, 0, 0, 1, 1,
0.1311604, -0.08995971, 3.084222, 0, 0, 0, 1, 1,
0.1348452, -0.4876132, 3.361841, 0, 0, 0, 1, 1,
0.1358652, -0.03258549, 2.43349, 0, 0, 0, 1, 1,
0.1382195, 0.8888284, -0.02828132, 0, 0, 0, 1, 1,
0.1395763, -0.4431668, 0.9752311, 0, 0, 0, 1, 1,
0.1404133, -1.523578, 3.480542, 1, 1, 1, 1, 1,
0.1423645, -0.05460003, 0.4167202, 1, 1, 1, 1, 1,
0.1434076, 0.7175441, -0.3621214, 1, 1, 1, 1, 1,
0.1454471, 2.146595, -0.3241439, 1, 1, 1, 1, 1,
0.147739, -0.5155836, 4.164651, 1, 1, 1, 1, 1,
0.1483939, -0.2719356, 2.907113, 1, 1, 1, 1, 1,
0.1491077, 1.454762, 0.3439007, 1, 1, 1, 1, 1,
0.1540545, -0.2277761, 2.989524, 1, 1, 1, 1, 1,
0.15737, 0.8255631, -0.2370696, 1, 1, 1, 1, 1,
0.1578172, -1.461767, -0.2376215, 1, 1, 1, 1, 1,
0.1635907, 0.0206014, 0.3989191, 1, 1, 1, 1, 1,
0.1656239, 1.82454, 2.124704, 1, 1, 1, 1, 1,
0.1698956, -0.1302234, 3.165354, 1, 1, 1, 1, 1,
0.1715144, 0.4137304, 0.340683, 1, 1, 1, 1, 1,
0.1720266, -0.3197941, 3.625756, 1, 1, 1, 1, 1,
0.1779353, 0.8607047, -0.8475506, 0, 0, 1, 1, 1,
0.1788488, -0.9512054, 2.365412, 1, 0, 0, 1, 1,
0.1821244, 0.04925795, 0.8136742, 1, 0, 0, 1, 1,
0.1838586, -0.1997927, 1.619653, 1, 0, 0, 1, 1,
0.1841931, 0.8517332, 0.596274, 1, 0, 0, 1, 1,
0.1845949, 1.470773, 0.8538666, 1, 0, 0, 1, 1,
0.1857482, -0.7276708, 2.458145, 0, 0, 0, 1, 1,
0.1909669, -1.243095, 3.410846, 0, 0, 0, 1, 1,
0.1917281, 0.115623, -0.1419563, 0, 0, 0, 1, 1,
0.2019068, -0.2593846, 2.45832, 0, 0, 0, 1, 1,
0.2081253, 0.1533531, 0.4941973, 0, 0, 0, 1, 1,
0.2162973, 0.06017696, -0.02828372, 0, 0, 0, 1, 1,
0.2180346, -0.09986358, -0.3232854, 0, 0, 0, 1, 1,
0.21995, -1.964828, 3.515468, 1, 1, 1, 1, 1,
0.2263908, 1.399415, -1.413455, 1, 1, 1, 1, 1,
0.2269292, -1.357822, 2.483179, 1, 1, 1, 1, 1,
0.2299592, 1.083706, 1.030434, 1, 1, 1, 1, 1,
0.2307745, 0.4566152, 1.292486, 1, 1, 1, 1, 1,
0.2333065, 1.570277, 0.7376277, 1, 1, 1, 1, 1,
0.236478, -1.317467, 3.025091, 1, 1, 1, 1, 1,
0.238111, -0.745146, 3.938526, 1, 1, 1, 1, 1,
0.2399214, 0.7247767, 0.2060916, 1, 1, 1, 1, 1,
0.2465007, 0.09214703, 1.186133, 1, 1, 1, 1, 1,
0.2470883, 0.03056748, 1.772071, 1, 1, 1, 1, 1,
0.2488195, 1.784466, 1.715064, 1, 1, 1, 1, 1,
0.2495919, 1.858987, 0.4970077, 1, 1, 1, 1, 1,
0.2559516, -0.3747656, 5.243538, 1, 1, 1, 1, 1,
0.2606593, -0.2922176, 3.413663, 1, 1, 1, 1, 1,
0.2639717, -1.108049, 3.577076, 0, 0, 1, 1, 1,
0.2727691, -1.006356, 2.739559, 1, 0, 0, 1, 1,
0.2784458, 1.384276, -1.713137, 1, 0, 0, 1, 1,
0.2790508, 1.414832, -0.5761804, 1, 0, 0, 1, 1,
0.2814835, -0.7825985, 2.835283, 1, 0, 0, 1, 1,
0.2847992, 1.085641, -0.5518115, 1, 0, 0, 1, 1,
0.2869845, -1.435504, 2.867864, 0, 0, 0, 1, 1,
0.2871976, 0.7436209, 2.572812, 0, 0, 0, 1, 1,
0.2886752, 0.8376573, 1.36631, 0, 0, 0, 1, 1,
0.2919637, -0.156549, 2.475153, 0, 0, 0, 1, 1,
0.2932411, 0.5362524, -1.29811, 0, 0, 0, 1, 1,
0.293999, 0.2496608, -0.808348, 0, 0, 0, 1, 1,
0.2945032, 0.4060352, -0.9155135, 0, 0, 0, 1, 1,
0.2950716, 1.743119, 1.672965, 1, 1, 1, 1, 1,
0.2953622, 1.005357, 0.3580334, 1, 1, 1, 1, 1,
0.2977195, -0.3357272, 3.7671, 1, 1, 1, 1, 1,
0.3018855, 0.3001248, 1.126927, 1, 1, 1, 1, 1,
0.3038225, -0.2361644, 2.064075, 1, 1, 1, 1, 1,
0.3070206, 0.7032549, -0.7222531, 1, 1, 1, 1, 1,
0.3091635, 0.103896, 2.253204, 1, 1, 1, 1, 1,
0.3130161, -0.5377537, 1.215434, 1, 1, 1, 1, 1,
0.3230323, 1.72945, -0.1088324, 1, 1, 1, 1, 1,
0.3264026, -3.330947, 3.994823, 1, 1, 1, 1, 1,
0.3315537, 0.3764302, 0.3953331, 1, 1, 1, 1, 1,
0.3353817, -0.5159636, 4.473377, 1, 1, 1, 1, 1,
0.3408639, -0.6157427, 1.322759, 1, 1, 1, 1, 1,
0.3414341, -0.9983114, 3.108015, 1, 1, 1, 1, 1,
0.3466328, 0.06669602, -0.4198494, 1, 1, 1, 1, 1,
0.3507436, 0.1015019, 2.057839, 0, 0, 1, 1, 1,
0.3512911, 1.669009, 0.5358925, 1, 0, 0, 1, 1,
0.3516541, 1.271638, 1.635073, 1, 0, 0, 1, 1,
0.3518706, 0.9953229, -1.443402, 1, 0, 0, 1, 1,
0.3523078, 0.0907178, 1.719833, 1, 0, 0, 1, 1,
0.3593003, -1.279785, 2.11932, 1, 0, 0, 1, 1,
0.3611668, -2.926848, 3.091287, 0, 0, 0, 1, 1,
0.3651435, -0.5486869, 3.264164, 0, 0, 0, 1, 1,
0.3653717, 0.2368233, 0.4466335, 0, 0, 0, 1, 1,
0.3663445, 1.129726, -0.1330871, 0, 0, 0, 1, 1,
0.3669517, 0.2621258, 0.5421988, 0, 0, 0, 1, 1,
0.3677577, -0.8496783, 1.738487, 0, 0, 0, 1, 1,
0.3692715, 0.7774854, 0.2470883, 0, 0, 0, 1, 1,
0.3720306, -0.4324517, 4.277409, 1, 1, 1, 1, 1,
0.3756988, -0.556491, 4.078376, 1, 1, 1, 1, 1,
0.3773647, -0.7030227, 1.318438, 1, 1, 1, 1, 1,
0.3810435, -0.2236839, 1.592149, 1, 1, 1, 1, 1,
0.3835216, -0.3269672, 0.9438868, 1, 1, 1, 1, 1,
0.3849581, 2.026073, -0.5400175, 1, 1, 1, 1, 1,
0.3857777, 0.2365734, 1.713004, 1, 1, 1, 1, 1,
0.3880137, 0.392052, -0.9374245, 1, 1, 1, 1, 1,
0.3881423, -1.688237, 3.358206, 1, 1, 1, 1, 1,
0.3982419, -0.3796593, 2.02297, 1, 1, 1, 1, 1,
0.4000687, -0.1371208, 1.25737, 1, 1, 1, 1, 1,
0.4042289, 1.006227, -0.2761234, 1, 1, 1, 1, 1,
0.4048009, -0.9489352, 2.53066, 1, 1, 1, 1, 1,
0.4075514, 0.1921543, 1.723547, 1, 1, 1, 1, 1,
0.4121915, -1.78626, -0.874684, 1, 1, 1, 1, 1,
0.4137649, -1.552291, 1.788847, 0, 0, 1, 1, 1,
0.4145304, 1.735576, 1.821605, 1, 0, 0, 1, 1,
0.4151447, -0.5947655, 1.813028, 1, 0, 0, 1, 1,
0.4166501, 1.13216, 0.8447452, 1, 0, 0, 1, 1,
0.423792, 2.471187, -0.1251719, 1, 0, 0, 1, 1,
0.4263088, 1.067331, -0.3517508, 1, 0, 0, 1, 1,
0.4291918, 0.2772818, 0.9388945, 0, 0, 0, 1, 1,
0.4294513, 0.4204928, -0.05103778, 0, 0, 0, 1, 1,
0.4317132, -2.07333, 2.08817, 0, 0, 0, 1, 1,
0.4319474, -0.6191269, 2.934961, 0, 0, 0, 1, 1,
0.4330899, -0.8633735, 3.114718, 0, 0, 0, 1, 1,
0.4363923, 0.4816246, 1.037235, 0, 0, 0, 1, 1,
0.4390686, -0.3345221, 1.244108, 0, 0, 0, 1, 1,
0.4407266, 0.195108, 2.606354, 1, 1, 1, 1, 1,
0.4433794, -0.02412078, 0.6753925, 1, 1, 1, 1, 1,
0.4465221, 1.228466, 0.5133113, 1, 1, 1, 1, 1,
0.4473415, 0.2875172, 0.8054689, 1, 1, 1, 1, 1,
0.4523736, -0.09600827, 0.483902, 1, 1, 1, 1, 1,
0.4566701, 0.3733574, 0.114594, 1, 1, 1, 1, 1,
0.4568237, -3.68184, 4.175308, 1, 1, 1, 1, 1,
0.4617777, -0.2192856, 3.066632, 1, 1, 1, 1, 1,
0.4719713, -0.9040121, 1.499331, 1, 1, 1, 1, 1,
0.4737822, 0.8512729, -0.3937255, 1, 1, 1, 1, 1,
0.4745004, -0.5054845, 2.230581, 1, 1, 1, 1, 1,
0.4807004, -0.7760674, 0.2383607, 1, 1, 1, 1, 1,
0.4853364, -0.4425828, 1.944289, 1, 1, 1, 1, 1,
0.4864494, 0.6276594, 1.881758, 1, 1, 1, 1, 1,
0.4866248, -0.2939932, 2.684211, 1, 1, 1, 1, 1,
0.4892815, -0.4435212, 2.458204, 0, 0, 1, 1, 1,
0.4920653, -0.2800454, 1.701805, 1, 0, 0, 1, 1,
0.4932, 0.2601293, 0.494801, 1, 0, 0, 1, 1,
0.4975238, 0.8646296, -0.7562422, 1, 0, 0, 1, 1,
0.4987394, 1.138845, 0.8109803, 1, 0, 0, 1, 1,
0.5017849, -0.8200795, 2.915549, 1, 0, 0, 1, 1,
0.5099677, 0.2244808, 1.771528, 0, 0, 0, 1, 1,
0.5141808, 0.7255948, 0.1564613, 0, 0, 0, 1, 1,
0.5215573, -0.00721089, 1.11376, 0, 0, 0, 1, 1,
0.5309523, 1.145719, -0.2083875, 0, 0, 0, 1, 1,
0.5325606, 0.1358331, 2.333645, 0, 0, 0, 1, 1,
0.5333098, -2.006628, 2.124794, 0, 0, 0, 1, 1,
0.5351487, 1.062657, -1.572216, 0, 0, 0, 1, 1,
0.5397778, 0.2375438, 1.244391, 1, 1, 1, 1, 1,
0.5403161, -0.8572122, 0.8746406, 1, 1, 1, 1, 1,
0.5439714, -0.08907892, 2.299752, 1, 1, 1, 1, 1,
0.5573038, 1.647527, 1.09296, 1, 1, 1, 1, 1,
0.5657477, 1.228953, 0.8712706, 1, 1, 1, 1, 1,
0.5701327, 2.101532, 1.358641, 1, 1, 1, 1, 1,
0.5791534, -1.103334, 1.166422, 1, 1, 1, 1, 1,
0.580957, -1.238182, 2.29846, 1, 1, 1, 1, 1,
0.5828147, -1.568431, 3.486512, 1, 1, 1, 1, 1,
0.5891085, 0.6550219, 1.530576, 1, 1, 1, 1, 1,
0.5897454, -0.3329628, 3.220069, 1, 1, 1, 1, 1,
0.5935302, -1.206026, 2.98704, 1, 1, 1, 1, 1,
0.5957162, -0.4550495, 1.378002, 1, 1, 1, 1, 1,
0.5964584, 0.1062615, 2.39468, 1, 1, 1, 1, 1,
0.5998899, 0.7105426, -0.8287244, 1, 1, 1, 1, 1,
0.6004319, 0.987304, 1.466623, 0, 0, 1, 1, 1,
0.601849, -0.1687646, 1.967061, 1, 0, 0, 1, 1,
0.605839, -1.592615, 3.044314, 1, 0, 0, 1, 1,
0.6063409, 1.012069, 0.4710679, 1, 0, 0, 1, 1,
0.6119994, 0.8606227, 2.751433, 1, 0, 0, 1, 1,
0.6135624, 1.124866, 1.265599, 1, 0, 0, 1, 1,
0.6163738, 1.216458, 0.2818941, 0, 0, 0, 1, 1,
0.6169922, 0.2016975, 0.1684918, 0, 0, 0, 1, 1,
0.6182891, -0.1783986, 2.738585, 0, 0, 0, 1, 1,
0.624297, -0.1172696, 2.451772, 0, 0, 0, 1, 1,
0.6245279, -1.049845, 3.086288, 0, 0, 0, 1, 1,
0.6267781, 1.525156, -0.04367265, 0, 0, 0, 1, 1,
0.6290507, 0.7553749, 0.01195457, 0, 0, 0, 1, 1,
0.6312339, -0.3059504, 3.165634, 1, 1, 1, 1, 1,
0.6335969, -1.390456, 4.213589, 1, 1, 1, 1, 1,
0.6371603, 0.1105789, 0.899555, 1, 1, 1, 1, 1,
0.6420833, 1.375649, -0.3220174, 1, 1, 1, 1, 1,
0.6423873, -1.654689, 4.572888, 1, 1, 1, 1, 1,
0.6557976, 1.63887, 1.575657, 1, 1, 1, 1, 1,
0.6566763, 1.150585, -0.7203759, 1, 1, 1, 1, 1,
0.6580999, -0.04713301, 1.321398, 1, 1, 1, 1, 1,
0.658884, -0.6620245, 0.1230333, 1, 1, 1, 1, 1,
0.6720243, -0.1716969, 0.9542151, 1, 1, 1, 1, 1,
0.6743459, 0.8712087, -1.253904, 1, 1, 1, 1, 1,
0.6753628, -0.3101055, 2.311919, 1, 1, 1, 1, 1,
0.6767418, -2.047903, 3.127823, 1, 1, 1, 1, 1,
0.6767589, 0.9715142, 0.6797561, 1, 1, 1, 1, 1,
0.681183, -0.289411, 2.29676, 1, 1, 1, 1, 1,
0.6882143, -0.2820534, 2.949307, 0, 0, 1, 1, 1,
0.6962788, 0.1131792, 0.3012991, 1, 0, 0, 1, 1,
0.6980599, -1.298828, 3.986373, 1, 0, 0, 1, 1,
0.6985874, -0.3318685, 1.587659, 1, 0, 0, 1, 1,
0.7080278, 0.2753237, 2.27597, 1, 0, 0, 1, 1,
0.7080829, 1.472027, 0.4994478, 1, 0, 0, 1, 1,
0.7106779, -2.254903, 3.478286, 0, 0, 0, 1, 1,
0.7176364, 0.5776953, 1.197778, 0, 0, 0, 1, 1,
0.7222592, 1.993165, -0.6934685, 0, 0, 0, 1, 1,
0.7235116, 0.09629581, 1.233544, 0, 0, 0, 1, 1,
0.7304996, -1.073997, 1.584381, 0, 0, 0, 1, 1,
0.7325504, -0.601506, 2.518225, 0, 0, 0, 1, 1,
0.7363699, -0.6087937, 2.234875, 0, 0, 0, 1, 1,
0.738578, 1.61446, 1.461726, 1, 1, 1, 1, 1,
0.7478327, -1.322869, 2.132371, 1, 1, 1, 1, 1,
0.7591425, -0.2661586, 2.272108, 1, 1, 1, 1, 1,
0.7592235, -0.624723, 1.043161, 1, 1, 1, 1, 1,
0.7737218, -2.479106, 4.729588, 1, 1, 1, 1, 1,
0.779305, 0.4576932, 1.245503, 1, 1, 1, 1, 1,
0.7793778, -1.035094, 1.683291, 1, 1, 1, 1, 1,
0.7802603, -1.058333, 2.990437, 1, 1, 1, 1, 1,
0.7821788, -2.076461, 1.858038, 1, 1, 1, 1, 1,
0.7827414, -0.3799466, 2.591717, 1, 1, 1, 1, 1,
0.7842262, -1.292628, 3.420259, 1, 1, 1, 1, 1,
0.7875756, 0.8403491, 0.9104122, 1, 1, 1, 1, 1,
0.7964954, 0.5619416, -0.1160846, 1, 1, 1, 1, 1,
0.7998728, 1.407442, 0.5179179, 1, 1, 1, 1, 1,
0.8018759, -0.6435851, 1.432026, 1, 1, 1, 1, 1,
0.8037968, 1.207394, 3.244911, 0, 0, 1, 1, 1,
0.8038716, -0.699014, 0.5980697, 1, 0, 0, 1, 1,
0.8051301, -0.5488256, 3.605589, 1, 0, 0, 1, 1,
0.8051547, -1.055294, 3.078684, 1, 0, 0, 1, 1,
0.8060526, 1.220637, 1.403567, 1, 0, 0, 1, 1,
0.8066106, 0.3559841, 0.08898547, 1, 0, 0, 1, 1,
0.8073869, -0.8091829, 0.3805387, 0, 0, 0, 1, 1,
0.8215613, -1.79411, 2.136283, 0, 0, 0, 1, 1,
0.8232547, -0.02429345, 2.001737, 0, 0, 0, 1, 1,
0.8237078, 1.039063, 1.769919, 0, 0, 0, 1, 1,
0.8254789, -0.06383077, 3.14397, 0, 0, 0, 1, 1,
0.8271176, -0.519127, 2.130866, 0, 0, 0, 1, 1,
0.8374023, 0.7156779, 0.01420164, 0, 0, 0, 1, 1,
0.8379775, 0.8837668, 1.331047, 1, 1, 1, 1, 1,
0.8383226, -1.167607, 2.04049, 1, 1, 1, 1, 1,
0.8412946, 0.5382858, 1.544371, 1, 1, 1, 1, 1,
0.8423433, 1.132897, 0.925017, 1, 1, 1, 1, 1,
0.8491579, 1.426057, 0.8284823, 1, 1, 1, 1, 1,
0.8501761, -0.8902519, 1.825567, 1, 1, 1, 1, 1,
0.8516767, 0.4471141, 0.9583699, 1, 1, 1, 1, 1,
0.8549063, 0.5376261, 1.8308, 1, 1, 1, 1, 1,
0.8602965, -1.62988, 2.101712, 1, 1, 1, 1, 1,
0.8630474, 1.223339, 1.773965, 1, 1, 1, 1, 1,
0.8643439, 0.8246726, -0.04091034, 1, 1, 1, 1, 1,
0.8654375, -0.1148385, 2.163695, 1, 1, 1, 1, 1,
0.8656884, 0.4525582, 1.170313, 1, 1, 1, 1, 1,
0.866338, -1.108401, 4.632559, 1, 1, 1, 1, 1,
0.8703492, 1.065388, 0.1048173, 1, 1, 1, 1, 1,
0.8726726, 0.03044195, 3.368655, 0, 0, 1, 1, 1,
0.8767181, -1.319351, 4.00944, 1, 0, 0, 1, 1,
0.8795394, 0.3544934, 0.4830963, 1, 0, 0, 1, 1,
0.8850014, -1.449912, 0.1318094, 1, 0, 0, 1, 1,
0.8887345, -1.074098, 3.524668, 1, 0, 0, 1, 1,
0.8903834, -0.1561484, 1.929347, 1, 0, 0, 1, 1,
0.8946412, 0.7347235, 2.460907, 0, 0, 0, 1, 1,
0.895476, -2.516796, 2.050343, 0, 0, 0, 1, 1,
0.9150146, 1.456752, 0.5432901, 0, 0, 0, 1, 1,
0.9244872, 2.263267, 3.150918, 0, 0, 0, 1, 1,
0.9273354, 1.423856, 1.084153, 0, 0, 0, 1, 1,
0.9350529, 0.5335675, 0.5349414, 0, 0, 0, 1, 1,
0.9353526, -0.0329662, 1.157989, 0, 0, 0, 1, 1,
0.9364227, -0.949554, 2.8066, 1, 1, 1, 1, 1,
0.9391093, 0.3186616, 2.383837, 1, 1, 1, 1, 1,
0.9433525, -0.4128912, 1.142288, 1, 1, 1, 1, 1,
0.9450604, -0.2565278, 1.294592, 1, 1, 1, 1, 1,
0.9506136, -0.9962674, 3.952592, 1, 1, 1, 1, 1,
0.952028, -0.3926637, 0.5140752, 1, 1, 1, 1, 1,
0.955425, -0.01839692, 0.9861981, 1, 1, 1, 1, 1,
0.9655466, -1.225464, 1.141462, 1, 1, 1, 1, 1,
0.9688436, 0.8941799, -0.5247027, 1, 1, 1, 1, 1,
0.9689184, -0.02327349, 2.19876, 1, 1, 1, 1, 1,
0.9691901, 2.174755, -0.7486314, 1, 1, 1, 1, 1,
0.9740145, 0.09740332, 1.291771, 1, 1, 1, 1, 1,
0.9779888, 0.1855813, 0.2730419, 1, 1, 1, 1, 1,
0.9814942, -0.7881925, 3.600978, 1, 1, 1, 1, 1,
0.9818661, 0.556564, 0.4546024, 1, 1, 1, 1, 1,
0.9829515, -0.2791804, 0.07514041, 0, 0, 1, 1, 1,
0.9834717, -0.4330918, 3.111709, 1, 0, 0, 1, 1,
0.9844797, 1.282596, -1.793515, 1, 0, 0, 1, 1,
0.9896597, 1.311782, 1.395299, 1, 0, 0, 1, 1,
0.9905599, -1.06335, 1.199224, 1, 0, 0, 1, 1,
0.9913275, 0.9418662, -0.393039, 1, 0, 0, 1, 1,
0.9968008, 1.080482, 0.3607745, 0, 0, 0, 1, 1,
1.000707, 1.40469, -1.973498, 0, 0, 0, 1, 1,
1.005625, -0.1719406, 3.072273, 0, 0, 0, 1, 1,
1.005802, -0.6516997, 2.536086, 0, 0, 0, 1, 1,
1.014794, 0.8463039, 1.151661, 0, 0, 0, 1, 1,
1.027327, -0.2686779, 2.440179, 0, 0, 0, 1, 1,
1.030457, -0.9285162, 3.208781, 0, 0, 0, 1, 1,
1.041361, -0.04798231, 2.352533, 1, 1, 1, 1, 1,
1.04491, 0.4047384, 1.628871, 1, 1, 1, 1, 1,
1.047595, 0.6154984, 2.06409, 1, 1, 1, 1, 1,
1.049483, 0.3862195, 2.165126, 1, 1, 1, 1, 1,
1.052553, 0.8170204, 0.5716822, 1, 1, 1, 1, 1,
1.053653, 0.05789027, 2.128226, 1, 1, 1, 1, 1,
1.059837, -0.6259563, 5.337955, 1, 1, 1, 1, 1,
1.060487, -0.1996555, 1.606031, 1, 1, 1, 1, 1,
1.0651, 0.231118, 1.018094, 1, 1, 1, 1, 1,
1.071695, -0.4554395, 0.7993749, 1, 1, 1, 1, 1,
1.071962, -0.138757, 2.603361, 1, 1, 1, 1, 1,
1.081051, -0.1756074, 1.406419, 1, 1, 1, 1, 1,
1.087186, -0.6975753, 4.129057, 1, 1, 1, 1, 1,
1.100599, -0.271051, 0.8685352, 1, 1, 1, 1, 1,
1.110711, 0.3261053, 1.348156, 1, 1, 1, 1, 1,
1.111027, 1.746725, 0.5015922, 0, 0, 1, 1, 1,
1.112549, -0.2113404, 1.582432, 1, 0, 0, 1, 1,
1.113222, -0.1222416, 0.1950966, 1, 0, 0, 1, 1,
1.116883, 0.5184789, 2.180132, 1, 0, 0, 1, 1,
1.126809, -0.6270559, 2.048836, 1, 0, 0, 1, 1,
1.132514, -0.281993, 0.3176301, 1, 0, 0, 1, 1,
1.135981, 0.4014455, 0.7989231, 0, 0, 0, 1, 1,
1.143644, -0.6246518, 1.923849, 0, 0, 0, 1, 1,
1.147186, 0.9960696, 1.901478, 0, 0, 0, 1, 1,
1.149709, 0.4076773, 0.9856962, 0, 0, 0, 1, 1,
1.150602, -2.828098, 2.788719, 0, 0, 0, 1, 1,
1.15447, 0.4992745, 2.752566, 0, 0, 0, 1, 1,
1.166996, -1.063221, 3.125705, 0, 0, 0, 1, 1,
1.179685, 0.306218, 0.4475989, 1, 1, 1, 1, 1,
1.181044, -1.025795, 0.4665373, 1, 1, 1, 1, 1,
1.181628, 1.797708, 2.177138, 1, 1, 1, 1, 1,
1.182478, -1.333583, 1.536424, 1, 1, 1, 1, 1,
1.186998, 0.7162798, 0.1798051, 1, 1, 1, 1, 1,
1.187634, -1.364274, 1.777175, 1, 1, 1, 1, 1,
1.190462, 0.6232952, 2.257253, 1, 1, 1, 1, 1,
1.19414, 1.691707, 0.05711941, 1, 1, 1, 1, 1,
1.194244, -1.889413, -0.9538274, 1, 1, 1, 1, 1,
1.197481, -0.7621168, 2.444958, 1, 1, 1, 1, 1,
1.21267, -0.4281881, 2.839653, 1, 1, 1, 1, 1,
1.215505, -1.28472, 3.875613, 1, 1, 1, 1, 1,
1.21615, 1.386582, 2.022693, 1, 1, 1, 1, 1,
1.216841, -0.287057, 2.318994, 1, 1, 1, 1, 1,
1.218507, -1.56647, 4.103278, 1, 1, 1, 1, 1,
1.221274, -0.1456802, 1.063699, 0, 0, 1, 1, 1,
1.22156, -0.8945501, 1.239997, 1, 0, 0, 1, 1,
1.221569, -2.091132, 3.043993, 1, 0, 0, 1, 1,
1.236576, -0.7635649, 1.591365, 1, 0, 0, 1, 1,
1.243158, 2.365658, -2.508055, 1, 0, 0, 1, 1,
1.245259, -0.05615012, 1.772868, 1, 0, 0, 1, 1,
1.246301, -0.6070397, 2.100166, 0, 0, 0, 1, 1,
1.249575, 1.316964, -0.4699824, 0, 0, 0, 1, 1,
1.25046, 0.07845698, 0.7035475, 0, 0, 0, 1, 1,
1.257303, -0.006443839, 1.111705, 0, 0, 0, 1, 1,
1.270484, 0.597868, 0.7928477, 0, 0, 0, 1, 1,
1.282114, -0.1168118, 3.18736, 0, 0, 0, 1, 1,
1.282292, -1.406307, 3.743864, 0, 0, 0, 1, 1,
1.282451, 1.161199, 0.658572, 1, 1, 1, 1, 1,
1.285915, 0.5781465, 1.189138, 1, 1, 1, 1, 1,
1.286343, -0.9718242, 2.670005, 1, 1, 1, 1, 1,
1.286459, -0.7453147, 2.109883, 1, 1, 1, 1, 1,
1.289984, -0.09772916, 2.580065, 1, 1, 1, 1, 1,
1.290541, 0.1516262, 0.4848838, 1, 1, 1, 1, 1,
1.292304, 0.9711545, 0.7512479, 1, 1, 1, 1, 1,
1.309287, -1.089739, 1.506269, 1, 1, 1, 1, 1,
1.321404, -0.02611502, 1.473647, 1, 1, 1, 1, 1,
1.326387, -0.3908994, 1.560911, 1, 1, 1, 1, 1,
1.337868, 0.7272615, 1.630163, 1, 1, 1, 1, 1,
1.340431, 1.013221, 0.5234006, 1, 1, 1, 1, 1,
1.340473, -0.2752796, 0.8591354, 1, 1, 1, 1, 1,
1.340764, 1.76991, 1.067723, 1, 1, 1, 1, 1,
1.35215, 0.882194, 1.167776, 1, 1, 1, 1, 1,
1.367781, -0.8280628, 1.596778, 0, 0, 1, 1, 1,
1.388181, 1.177098, 1.941661, 1, 0, 0, 1, 1,
1.407656, 0.7551658, 0.7649587, 1, 0, 0, 1, 1,
1.413653, -0.9737371, 3.653152, 1, 0, 0, 1, 1,
1.413788, -1.404989, 1.655591, 1, 0, 0, 1, 1,
1.417891, -0.2717609, 0.1210633, 1, 0, 0, 1, 1,
1.421693, -0.4459275, 3.732991, 0, 0, 0, 1, 1,
1.421962, 0.514262, 0.5160879, 0, 0, 0, 1, 1,
1.437483, -0.8090373, 1.869713, 0, 0, 0, 1, 1,
1.439518, 0.9505737, 1.079188, 0, 0, 0, 1, 1,
1.447895, -0.7389271, 1.729741, 0, 0, 0, 1, 1,
1.455276, -0.4263328, 3.884327, 0, 0, 0, 1, 1,
1.456363, -2.334496, 1.598032, 0, 0, 0, 1, 1,
1.457758, -0.6422107, 1.125469, 1, 1, 1, 1, 1,
1.458458, -0.5981451, 1.233425, 1, 1, 1, 1, 1,
1.466463, -0.4914875, 1.258837, 1, 1, 1, 1, 1,
1.479889, 1.992884, -0.07799077, 1, 1, 1, 1, 1,
1.481813, -0.815973, 0.7634318, 1, 1, 1, 1, 1,
1.488498, 0.3050326, 2.213228, 1, 1, 1, 1, 1,
1.497529, -1.601622, 3.862421, 1, 1, 1, 1, 1,
1.499958, 1.190698, -0.2081372, 1, 1, 1, 1, 1,
1.501307, -1.291396, 1.767276, 1, 1, 1, 1, 1,
1.503555, 0.7199867, 0.02907098, 1, 1, 1, 1, 1,
1.507397, -1.080912, 1.62386, 1, 1, 1, 1, 1,
1.508272, -1.708869, 2.364618, 1, 1, 1, 1, 1,
1.534259, 0.5919164, 1.182403, 1, 1, 1, 1, 1,
1.535995, -1.025967, 1.922711, 1, 1, 1, 1, 1,
1.572961, 0.6101485, 0.9608738, 1, 1, 1, 1, 1,
1.58742, 1.417937, 1.686319, 0, 0, 1, 1, 1,
1.606097, 0.0280555, 2.370605, 1, 0, 0, 1, 1,
1.611304, 0.6238772, 0.7438488, 1, 0, 0, 1, 1,
1.62114, 0.8989527, 0.8970218, 1, 0, 0, 1, 1,
1.625432, -0.2836078, 0.4852291, 1, 0, 0, 1, 1,
1.636358, 0.3718306, 1.356351, 1, 0, 0, 1, 1,
1.637827, 1.393308, 1.521581, 0, 0, 0, 1, 1,
1.665602, -0.4929433, 1.604292, 0, 0, 0, 1, 1,
1.704147, -0.2514759, 2.808518, 0, 0, 0, 1, 1,
1.709767, 0.2539823, -0.5727162, 0, 0, 0, 1, 1,
1.709884, 0.3044837, 2.156045, 0, 0, 0, 1, 1,
1.714259, -2.314483, 2.865772, 0, 0, 0, 1, 1,
1.723943, -1.109684, 4.051436, 0, 0, 0, 1, 1,
1.729412, -0.2268377, 1.988311, 1, 1, 1, 1, 1,
1.729678, 0.1366418, 0.7478033, 1, 1, 1, 1, 1,
1.739311, 0.6145483, 2.032549, 1, 1, 1, 1, 1,
1.756427, -0.4000139, 0.849119, 1, 1, 1, 1, 1,
1.759117, 1.009718, 0.7890213, 1, 1, 1, 1, 1,
1.779575, 0.836099, 1.340029, 1, 1, 1, 1, 1,
1.790211, -0.6495826, 2.671244, 1, 1, 1, 1, 1,
1.804181, -1.341136, 1.925828, 1, 1, 1, 1, 1,
1.804572, 1.74502, 2.51932, 1, 1, 1, 1, 1,
1.820283, -1.451177, 1.710466, 1, 1, 1, 1, 1,
1.830072, 0.4103599, 1.288439, 1, 1, 1, 1, 1,
1.842378, 1.041885, 0.180715, 1, 1, 1, 1, 1,
1.8946, -0.6209596, 0.3312518, 1, 1, 1, 1, 1,
1.907593, -0.3921173, 1.749967, 1, 1, 1, 1, 1,
1.927625, 0.4179655, 0.6385695, 1, 1, 1, 1, 1,
1.939167, -0.7452072, 0.2563962, 0, 0, 1, 1, 1,
1.939784, 0.06104641, 1.855687, 1, 0, 0, 1, 1,
1.977138, 0.007288526, 0.9454129, 1, 0, 0, 1, 1,
1.986405, 0.7095942, 1.901097, 1, 0, 0, 1, 1,
2.027068, -0.1746425, 1.855751, 1, 0, 0, 1, 1,
2.038515, -0.7461637, 2.998366, 1, 0, 0, 1, 1,
2.044714, 1.022529, 1.088341, 0, 0, 0, 1, 1,
2.060921, 0.432605, 1.4694, 0, 0, 0, 1, 1,
2.159294, -0.2465803, 3.174853, 0, 0, 0, 1, 1,
2.164976, 1.185966, 1.441054, 0, 0, 0, 1, 1,
2.17487, 0.5146633, 1.313825, 0, 0, 0, 1, 1,
2.178166, 1.315272, -0.105337, 0, 0, 0, 1, 1,
2.214612, -1.507321, 2.592867, 0, 0, 0, 1, 1,
2.242895, 0.3730371, 2.817262, 1, 1, 1, 1, 1,
2.288453, -0.8445142, 1.476424, 1, 1, 1, 1, 1,
2.369707, -0.2266949, 2.583469, 1, 1, 1, 1, 1,
2.48459, -0.3624099, 3.463104, 1, 1, 1, 1, 1,
2.593717, 1.104758, 0.7096039, 1, 1, 1, 1, 1,
2.696178, -1.156831, 2.598937, 1, 1, 1, 1, 1,
2.925597, 3.222929, 0.936097, 1, 1, 1, 1, 1
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
var radius = 9.753958;
var distance = 34.26036;
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
mvMatrix.translate( 0.0511688, 0.2294555, 0.1698666 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26036);
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