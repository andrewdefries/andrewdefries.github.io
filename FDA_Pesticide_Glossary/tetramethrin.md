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
-3.579257, -0.101354, -1.327544, 1, 0, 0, 1,
-2.871978, -0.2560149, -0.3909627, 1, 0.007843138, 0, 1,
-2.765924, -1.197125, -1.038967, 1, 0.01176471, 0, 1,
-2.548861, 1.100181, -0.7005252, 1, 0.01960784, 0, 1,
-2.502394, -0.9033208, -0.7451858, 1, 0.02352941, 0, 1,
-2.480681, 0.671611, -0.2439819, 1, 0.03137255, 0, 1,
-2.398775, 1.275865, -1.117396, 1, 0.03529412, 0, 1,
-2.358949, -1.550556, -2.402653, 1, 0.04313726, 0, 1,
-2.358404, -1.62174, -1.922274, 1, 0.04705882, 0, 1,
-2.354751, 0.3115934, -0.3921663, 1, 0.05490196, 0, 1,
-2.320184, 1.578664, -0.02598268, 1, 0.05882353, 0, 1,
-2.289136, 0.2418125, -2.13145, 1, 0.06666667, 0, 1,
-2.278638, -1.368038, -1.346657, 1, 0.07058824, 0, 1,
-2.242895, -0.5318028, -1.303078, 1, 0.07843138, 0, 1,
-2.239914, -0.2616425, -2.428196, 1, 0.08235294, 0, 1,
-2.212603, -1.074605, -3.167743, 1, 0.09019608, 0, 1,
-2.183412, 0.7003209, -0.7871606, 1, 0.09411765, 0, 1,
-2.176368, 2.152834, -0.06257159, 1, 0.1019608, 0, 1,
-2.166749, -1.918632, -2.474535, 1, 0.1098039, 0, 1,
-2.134331, -0.05783284, -2.392759, 1, 0.1137255, 0, 1,
-2.132958, -0.5003973, -1.306267, 1, 0.1215686, 0, 1,
-2.095055, 0.6957288, -0.9412073, 1, 0.1254902, 0, 1,
-2.074331, -0.5483095, -1.693104, 1, 0.1333333, 0, 1,
-2.072924, 0.3688028, -2.557868, 1, 0.1372549, 0, 1,
-2.062648, -1.698516, -3.202905, 1, 0.145098, 0, 1,
-2.037393, -1.958597, -2.49523, 1, 0.1490196, 0, 1,
-2.036636, 0.5608897, -0.5480533, 1, 0.1568628, 0, 1,
-1.996769, -0.3250061, -1.635516, 1, 0.1607843, 0, 1,
-1.977845, 1.18052, -1.546537, 1, 0.1686275, 0, 1,
-1.926383, 0.9488325, 0.1811264, 1, 0.172549, 0, 1,
-1.903987, -0.7015994, -0.7410986, 1, 0.1803922, 0, 1,
-1.895499, 0.4523136, -2.460508, 1, 0.1843137, 0, 1,
-1.894082, -0.2633537, -1.351205, 1, 0.1921569, 0, 1,
-1.883931, 0.7146388, -1.203606, 1, 0.1960784, 0, 1,
-1.857598, -0.2650934, 0.1562693, 1, 0.2039216, 0, 1,
-1.856075, 0.3179926, -2.67769, 1, 0.2117647, 0, 1,
-1.85037, -1.169375, -2.957589, 1, 0.2156863, 0, 1,
-1.826786, -0.7014076, -2.447531, 1, 0.2235294, 0, 1,
-1.809419, 0.507734, -0.4238419, 1, 0.227451, 0, 1,
-1.807285, -0.1948553, -1.075166, 1, 0.2352941, 0, 1,
-1.799199, 0.05082876, -0.4905022, 1, 0.2392157, 0, 1,
-1.798841, 0.4694063, -2.619093, 1, 0.2470588, 0, 1,
-1.79183, -0.5175545, -1.924942, 1, 0.2509804, 0, 1,
-1.789922, -1.024869, -0.2176982, 1, 0.2588235, 0, 1,
-1.787427, 1.282412, -0.0003780216, 1, 0.2627451, 0, 1,
-1.777986, 0.1418485, -2.06096, 1, 0.2705882, 0, 1,
-1.773343, -0.05369285, -1.774437, 1, 0.2745098, 0, 1,
-1.763185, -2.731427, -3.406402, 1, 0.282353, 0, 1,
-1.729896, 0.4312004, -0.7425678, 1, 0.2862745, 0, 1,
-1.699685, 0.6620714, -1.011619, 1, 0.2941177, 0, 1,
-1.686715, 0.3345812, -1.775871, 1, 0.3019608, 0, 1,
-1.673054, -1.144851, -2.226552, 1, 0.3058824, 0, 1,
-1.666897, 1.555374, -0.6896663, 1, 0.3137255, 0, 1,
-1.65337, 1.137167, 0.8059597, 1, 0.3176471, 0, 1,
-1.648245, -1.390286, -1.192821, 1, 0.3254902, 0, 1,
-1.64595, 0.4423971, 0.8413085, 1, 0.3294118, 0, 1,
-1.62278, -1.538195, -3.599468, 1, 0.3372549, 0, 1,
-1.616919, 0.4898547, -2.112529, 1, 0.3411765, 0, 1,
-1.615626, 0.2302199, -1.79217, 1, 0.3490196, 0, 1,
-1.606041, -0.4200832, -1.197318, 1, 0.3529412, 0, 1,
-1.599581, 1.234526, -1.793533, 1, 0.3607843, 0, 1,
-1.599229, -0.3880083, -1.289926, 1, 0.3647059, 0, 1,
-1.585406, -0.04587878, -0.529464, 1, 0.372549, 0, 1,
-1.581189, 0.6129673, -0.6062355, 1, 0.3764706, 0, 1,
-1.544259, -2.273875, -4.318986, 1, 0.3843137, 0, 1,
-1.540687, -0.9554936, -3.206386, 1, 0.3882353, 0, 1,
-1.538209, -1.738069, -1.466676, 1, 0.3960784, 0, 1,
-1.528226, 1.618567, -0.7828689, 1, 0.4039216, 0, 1,
-1.487331, -1.165171, -1.951786, 1, 0.4078431, 0, 1,
-1.478776, -1.44004, -1.36135, 1, 0.4156863, 0, 1,
-1.476406, -2.190185, -2.205861, 1, 0.4196078, 0, 1,
-1.461785, 0.1873347, -1.321657, 1, 0.427451, 0, 1,
-1.460047, -0.7917339, -1.363626, 1, 0.4313726, 0, 1,
-1.459589, 0.7142275, -0.2615674, 1, 0.4392157, 0, 1,
-1.450133, -1.106905, -3.433112, 1, 0.4431373, 0, 1,
-1.44999, 0.210586, -0.1027851, 1, 0.4509804, 0, 1,
-1.446447, -0.6042958, -1.272998, 1, 0.454902, 0, 1,
-1.439455, 0.1636836, -1.072894, 1, 0.4627451, 0, 1,
-1.43555, -0.2234213, -0.2036005, 1, 0.4666667, 0, 1,
-1.408214, -0.5029232, -2.54508, 1, 0.4745098, 0, 1,
-1.402146, 0.3054504, -1.252084, 1, 0.4784314, 0, 1,
-1.400956, -0.3056517, -0.9837283, 1, 0.4862745, 0, 1,
-1.388264, -1.547237, -4.304377, 1, 0.4901961, 0, 1,
-1.38676, -0.03977335, -0.6487186, 1, 0.4980392, 0, 1,
-1.385969, -0.009572185, -3.387449, 1, 0.5058824, 0, 1,
-1.385265, 0.2595798, -1.107387, 1, 0.509804, 0, 1,
-1.384454, -0.03442473, -3.178208, 1, 0.5176471, 0, 1,
-1.371306, -1.554967, -1.677163, 1, 0.5215687, 0, 1,
-1.363571, 1.399115, -0.9338418, 1, 0.5294118, 0, 1,
-1.362371, 0.5049539, -2.009179, 1, 0.5333334, 0, 1,
-1.335297, 0.9961364, 0.2089613, 1, 0.5411765, 0, 1,
-1.334455, -0.9420464, -1.698452, 1, 0.5450981, 0, 1,
-1.33043, -1.88391, -3.176598, 1, 0.5529412, 0, 1,
-1.324218, -0.0135471, -0.1089615, 1, 0.5568628, 0, 1,
-1.315078, 0.3365326, -0.9155914, 1, 0.5647059, 0, 1,
-1.31414, 0.6395299, -1.807015, 1, 0.5686275, 0, 1,
-1.309784, -2.342152, -1.559572, 1, 0.5764706, 0, 1,
-1.306201, -0.8534182, -3.91926, 1, 0.5803922, 0, 1,
-1.306041, -0.1108648, -1.502573, 1, 0.5882353, 0, 1,
-1.301544, 0.6459352, -1.543021, 1, 0.5921569, 0, 1,
-1.300954, 0.1064337, -0.4535719, 1, 0.6, 0, 1,
-1.297785, -0.1643093, -2.454205, 1, 0.6078432, 0, 1,
-1.294611, 1.253021, -1.991531, 1, 0.6117647, 0, 1,
-1.289441, -0.03337286, -1.807504, 1, 0.6196079, 0, 1,
-1.249501, -1.193809, -1.434084, 1, 0.6235294, 0, 1,
-1.249013, 2.137148, 1.83889, 1, 0.6313726, 0, 1,
-1.24749, 0.8161342, -1.413553, 1, 0.6352941, 0, 1,
-1.246156, -0.09490493, -1.208475, 1, 0.6431373, 0, 1,
-1.246011, 3.036389, -1.203419, 1, 0.6470588, 0, 1,
-1.241934, -1.307442, -3.05759, 1, 0.654902, 0, 1,
-1.235449, 1.034947, -0.1274821, 1, 0.6588235, 0, 1,
-1.228768, 0.4606257, -1.923625, 1, 0.6666667, 0, 1,
-1.22685, 0.7211888, -1.223626, 1, 0.6705883, 0, 1,
-1.220295, -0.2917153, -0.2095495, 1, 0.6784314, 0, 1,
-1.217368, -0.5883411, -1.561609, 1, 0.682353, 0, 1,
-1.216224, 1.251053, -1.221006, 1, 0.6901961, 0, 1,
-1.214753, -0.07895937, -2.187493, 1, 0.6941177, 0, 1,
-1.204785, 3.677775, 0.6774887, 1, 0.7019608, 0, 1,
-1.198002, 0.5208859, -0.4599109, 1, 0.7098039, 0, 1,
-1.191081, -0.1975463, -1.484872, 1, 0.7137255, 0, 1,
-1.182712, 0.05666187, 0.06665955, 1, 0.7215686, 0, 1,
-1.182205, 0.01927398, -1.788336, 1, 0.7254902, 0, 1,
-1.181958, -1.499474, -4.46068, 1, 0.7333333, 0, 1,
-1.181822, -0.5476691, -1.339126, 1, 0.7372549, 0, 1,
-1.175952, -0.4643491, -0.8239573, 1, 0.7450981, 0, 1,
-1.16802, -0.7938046, -1.560699, 1, 0.7490196, 0, 1,
-1.164489, -0.1895117, -2.195788, 1, 0.7568628, 0, 1,
-1.151428, 0.4026401, -1.365484, 1, 0.7607843, 0, 1,
-1.151349, -0.5721534, -2.991367, 1, 0.7686275, 0, 1,
-1.143142, 0.7177843, 0.2731587, 1, 0.772549, 0, 1,
-1.136725, 0.1876937, -1.158963, 1, 0.7803922, 0, 1,
-1.131997, -0.8610046, -0.1631901, 1, 0.7843137, 0, 1,
-1.131671, -0.2602061, -1.905848, 1, 0.7921569, 0, 1,
-1.130323, 0.4663938, -1.129175, 1, 0.7960784, 0, 1,
-1.121874, -0.1467821, -1.814952, 1, 0.8039216, 0, 1,
-1.121197, 1.203441, -1.220304, 1, 0.8117647, 0, 1,
-1.119553, 0.2992604, -1.450165, 1, 0.8156863, 0, 1,
-1.111774, -1.55156, -3.448125, 1, 0.8235294, 0, 1,
-1.111554, -0.02800749, -0.566807, 1, 0.827451, 0, 1,
-1.10868, -0.1993351, -1.906559, 1, 0.8352941, 0, 1,
-1.104005, 0.5147369, -1.339265, 1, 0.8392157, 0, 1,
-1.089227, 1.105482, -0.7082395, 1, 0.8470588, 0, 1,
-1.089014, -1.559855, -0.7953063, 1, 0.8509804, 0, 1,
-1.088544, -0.0009427799, -2.338758, 1, 0.8588235, 0, 1,
-1.08662, 0.2940316, -1.098622, 1, 0.8627451, 0, 1,
-1.085387, 0.5437831, -0.0745825, 1, 0.8705882, 0, 1,
-1.085046, 0.06490251, -0.163437, 1, 0.8745098, 0, 1,
-1.084174, 1.174356, -1.883885, 1, 0.8823529, 0, 1,
-1.081614, -0.2791126, -0.9522854, 1, 0.8862745, 0, 1,
-1.080985, 0.3150264, -1.01575, 1, 0.8941177, 0, 1,
-1.076491, 0.1439319, -0.7578024, 1, 0.8980392, 0, 1,
-1.074166, -1.770788, -3.238173, 1, 0.9058824, 0, 1,
-1.073841, -0.932759, -2.788866, 1, 0.9137255, 0, 1,
-1.069502, -1.003708, -2.174013, 1, 0.9176471, 0, 1,
-1.069231, 1.327024, -0.7278262, 1, 0.9254902, 0, 1,
-1.062542, -0.9424956, -2.85825, 1, 0.9294118, 0, 1,
-1.055728, 0.3322774, -2.542045, 1, 0.9372549, 0, 1,
-1.054673, 0.4144257, -1.09788, 1, 0.9411765, 0, 1,
-1.051818, 0.5113226, -1.984868, 1, 0.9490196, 0, 1,
-1.051479, 0.7306724, -2.097729, 1, 0.9529412, 0, 1,
-1.049964, -2.063504, -2.016053, 1, 0.9607843, 0, 1,
-1.049613, 1.272276, -1.196813, 1, 0.9647059, 0, 1,
-1.044851, 0.2897891, -1.3451, 1, 0.972549, 0, 1,
-1.044292, 0.7685233, -0.3736998, 1, 0.9764706, 0, 1,
-1.042592, 0.1707298, -0.2485507, 1, 0.9843137, 0, 1,
-1.034449, -1.101413, -2.315833, 1, 0.9882353, 0, 1,
-1.033927, -0.6309345, -1.786752, 1, 0.9960784, 0, 1,
-1.031067, -0.7637553, -3.167308, 0.9960784, 1, 0, 1,
-1.026613, 0.08291337, -0.9832145, 0.9921569, 1, 0, 1,
-1.026253, 1.028758, 0.516122, 0.9843137, 1, 0, 1,
-1.02591, -0.2264331, -2.249204, 0.9803922, 1, 0, 1,
-1.014323, -0.5276851, -2.831818, 0.972549, 1, 0, 1,
-1.010365, -1.050968, -1.288086, 0.9686275, 1, 0, 1,
-1.005906, 1.523231, -0.5265445, 0.9607843, 1, 0, 1,
-1.000909, -0.6362922, -2.561324, 0.9568627, 1, 0, 1,
-0.9928384, -1.22952, -0.6856694, 0.9490196, 1, 0, 1,
-0.9903479, 1.244277, 1.047296, 0.945098, 1, 0, 1,
-0.9869849, 1.28426, 0.1236659, 0.9372549, 1, 0, 1,
-0.9762756, 0.3449988, -1.034122, 0.9333333, 1, 0, 1,
-0.9590475, 0.09355243, -1.318587, 0.9254902, 1, 0, 1,
-0.9584636, -0.7618915, -2.901095, 0.9215686, 1, 0, 1,
-0.949849, 1.152889, -2.679924, 0.9137255, 1, 0, 1,
-0.9433192, -0.9688023, -3.345501, 0.9098039, 1, 0, 1,
-0.9424795, -0.3550291, -1.930638, 0.9019608, 1, 0, 1,
-0.9405853, 1.101047, -0.2313366, 0.8941177, 1, 0, 1,
-0.9205914, -0.5307351, -2.036955, 0.8901961, 1, 0, 1,
-0.9182087, -0.2617185, -0.6980461, 0.8823529, 1, 0, 1,
-0.9149759, -0.002168087, -0.1758107, 0.8784314, 1, 0, 1,
-0.9146785, -0.5741752, -0.4894747, 0.8705882, 1, 0, 1,
-0.9144497, -0.2551154, -2.930223, 0.8666667, 1, 0, 1,
-0.9080105, 1.103551, -1.034833, 0.8588235, 1, 0, 1,
-0.902075, 0.3226809, -2.541764, 0.854902, 1, 0, 1,
-0.9011919, 1.181335, 0.7204123, 0.8470588, 1, 0, 1,
-0.8991869, -0.6560816, 0.3569339, 0.8431373, 1, 0, 1,
-0.8970603, 0.2415957, -0.8716513, 0.8352941, 1, 0, 1,
-0.8937781, 0.2840176, -2.074716, 0.8313726, 1, 0, 1,
-0.890058, 1.568539, 1.228031, 0.8235294, 1, 0, 1,
-0.8856791, 0.2451749, -0.4068864, 0.8196079, 1, 0, 1,
-0.8827949, 0.2784233, -1.207072, 0.8117647, 1, 0, 1,
-0.8811526, 2.100893, -1.676471, 0.8078431, 1, 0, 1,
-0.8796468, 0.8867409, -0.8358964, 0.8, 1, 0, 1,
-0.8789654, -0.9311677, -3.436226, 0.7921569, 1, 0, 1,
-0.8771919, 0.7800649, -1.439008, 0.7882353, 1, 0, 1,
-0.8730527, 1.279918, 1.745216, 0.7803922, 1, 0, 1,
-0.872041, 0.2696692, -3.364412, 0.7764706, 1, 0, 1,
-0.8685188, -1.189809, -1.83425, 0.7686275, 1, 0, 1,
-0.8669426, -0.8033454, -2.796684, 0.7647059, 1, 0, 1,
-0.8664925, 1.144826, -1.761225, 0.7568628, 1, 0, 1,
-0.8655894, 0.6706714, -0.9748674, 0.7529412, 1, 0, 1,
-0.8647419, -1.803157, -2.568649, 0.7450981, 1, 0, 1,
-0.8575709, 0.5670613, 0.9450905, 0.7411765, 1, 0, 1,
-0.8520206, 0.519135, 0.2762541, 0.7333333, 1, 0, 1,
-0.8457154, 1.185516, -0.3867836, 0.7294118, 1, 0, 1,
-0.8358147, 0.2351149, -2.458337, 0.7215686, 1, 0, 1,
-0.8214633, 0.01174416, -1.229147, 0.7176471, 1, 0, 1,
-0.8213215, -0.5903727, -2.075207, 0.7098039, 1, 0, 1,
-0.8196411, -0.02118359, 0.2757703, 0.7058824, 1, 0, 1,
-0.8175135, 1.475935, 1.198861, 0.6980392, 1, 0, 1,
-0.8168577, -0.4311951, -1.110649, 0.6901961, 1, 0, 1,
-0.8166314, 0.6179135, -0.6581079, 0.6862745, 1, 0, 1,
-0.8126807, -0.06626431, -1.138774, 0.6784314, 1, 0, 1,
-0.8094314, 1.065468, -0.3982224, 0.6745098, 1, 0, 1,
-0.8083998, -0.2761037, -3.913694, 0.6666667, 1, 0, 1,
-0.8081906, 1.404426, -1.736691, 0.6627451, 1, 0, 1,
-0.8003711, 1.289979, -2.417333, 0.654902, 1, 0, 1,
-0.7977892, -0.6252725, -0.2079959, 0.6509804, 1, 0, 1,
-0.7950875, -1.169444, -2.435894, 0.6431373, 1, 0, 1,
-0.7913441, -1.156548, -2.071939, 0.6392157, 1, 0, 1,
-0.7849364, -0.719084, -3.372924, 0.6313726, 1, 0, 1,
-0.7849159, 0.1751277, -0.9971214, 0.627451, 1, 0, 1,
-0.7834571, -0.4371538, -4.153167, 0.6196079, 1, 0, 1,
-0.7767041, -0.8457782, -3.64965, 0.6156863, 1, 0, 1,
-0.7660976, 0.07985262, -0.7462994, 0.6078432, 1, 0, 1,
-0.7640387, 0.8100175, 0.04363884, 0.6039216, 1, 0, 1,
-0.7632208, -0.6135765, -0.4301636, 0.5960785, 1, 0, 1,
-0.7627079, -0.4020608, -2.392617, 0.5882353, 1, 0, 1,
-0.7545853, -0.1792419, -2.701004, 0.5843138, 1, 0, 1,
-0.7495632, 1.989795, -0.5325559, 0.5764706, 1, 0, 1,
-0.748235, -0.3451413, -1.401011, 0.572549, 1, 0, 1,
-0.7458701, -1.226539, -2.07409, 0.5647059, 1, 0, 1,
-0.7427493, 0.3012296, -1.701864, 0.5607843, 1, 0, 1,
-0.739574, 0.4236291, -0.5928323, 0.5529412, 1, 0, 1,
-0.7392299, -0.4338926, -1.955983, 0.5490196, 1, 0, 1,
-0.7327968, -0.8899108, -1.664994, 0.5411765, 1, 0, 1,
-0.7291279, 0.333984, -0.6784648, 0.5372549, 1, 0, 1,
-0.7253467, 0.1228195, -1.034247, 0.5294118, 1, 0, 1,
-0.7236668, 1.215678, 0.134957, 0.5254902, 1, 0, 1,
-0.7143153, -1.226301, -3.934285, 0.5176471, 1, 0, 1,
-0.7106817, -0.7485443, -3.357919, 0.5137255, 1, 0, 1,
-0.7062693, -0.05444659, -1.644419, 0.5058824, 1, 0, 1,
-0.7042664, 0.9758267, -0.06543309, 0.5019608, 1, 0, 1,
-0.703397, 0.003220954, -0.4056802, 0.4941176, 1, 0, 1,
-0.7030357, 1.229493, -1.447744, 0.4862745, 1, 0, 1,
-0.7002454, -2.562093, -3.640106, 0.4823529, 1, 0, 1,
-0.6979717, 0.7762089, -1.297782, 0.4745098, 1, 0, 1,
-0.6890545, 0.6985513, 0.1187517, 0.4705882, 1, 0, 1,
-0.6889718, -1.560035, -3.472389, 0.4627451, 1, 0, 1,
-0.6827455, -0.7438805, -0.6584176, 0.4588235, 1, 0, 1,
-0.6801565, -0.04114632, -1.544364, 0.4509804, 1, 0, 1,
-0.6782416, -2.450464, -3.013174, 0.4470588, 1, 0, 1,
-0.6742632, -0.376719, -0.5984753, 0.4392157, 1, 0, 1,
-0.6717941, 0.306984, -2.045962, 0.4352941, 1, 0, 1,
-0.671617, -0.4393879, -3.155212, 0.427451, 1, 0, 1,
-0.6710338, -0.161598, -3.437582, 0.4235294, 1, 0, 1,
-0.6647993, 0.8761539, -0.91874, 0.4156863, 1, 0, 1,
-0.664768, -0.7167923, -2.497831, 0.4117647, 1, 0, 1,
-0.663877, -0.1135978, -1.337353, 0.4039216, 1, 0, 1,
-0.6563054, -0.1669223, -2.190022, 0.3960784, 1, 0, 1,
-0.654856, -0.6785457, -4.497968, 0.3921569, 1, 0, 1,
-0.650956, -0.2430734, -0.2852695, 0.3843137, 1, 0, 1,
-0.6508607, -0.8436683, -2.028359, 0.3803922, 1, 0, 1,
-0.648504, 0.196148, -2.506793, 0.372549, 1, 0, 1,
-0.6484262, -0.7876997, -1.473182, 0.3686275, 1, 0, 1,
-0.6478828, 1.008154, 0.1487343, 0.3607843, 1, 0, 1,
-0.6478432, -0.5675578, -1.450113, 0.3568628, 1, 0, 1,
-0.6445188, 0.09540658, 0.4257872, 0.3490196, 1, 0, 1,
-0.6412899, 0.4370243, -1.479486, 0.345098, 1, 0, 1,
-0.6376348, -0.5635368, -2.025805, 0.3372549, 1, 0, 1,
-0.6322256, 0.874204, -1.867242, 0.3333333, 1, 0, 1,
-0.6255581, 0.3880879, -1.551453, 0.3254902, 1, 0, 1,
-0.6229733, -1.304486, -0.4429349, 0.3215686, 1, 0, 1,
-0.6162102, 0.5822871, 0.1275969, 0.3137255, 1, 0, 1,
-0.6131776, 1.179105, -0.1183879, 0.3098039, 1, 0, 1,
-0.6119948, -0.41855, -2.852273, 0.3019608, 1, 0, 1,
-0.6110553, -0.5557787, -4.868278, 0.2941177, 1, 0, 1,
-0.6034793, 0.2586039, 0.1280058, 0.2901961, 1, 0, 1,
-0.5995969, 0.6224908, -0.6334586, 0.282353, 1, 0, 1,
-0.5890319, -0.5384799, -1.823978, 0.2784314, 1, 0, 1,
-0.586186, -0.02421384, -2.470343, 0.2705882, 1, 0, 1,
-0.5859974, 0.6160292, -1.432207, 0.2666667, 1, 0, 1,
-0.5829618, -1.492084, -2.529142, 0.2588235, 1, 0, 1,
-0.5765398, 1.660256, 0.5383382, 0.254902, 1, 0, 1,
-0.5738817, -0.4586765, -2.760748, 0.2470588, 1, 0, 1,
-0.5718838, -0.4293278, -1.383866, 0.2431373, 1, 0, 1,
-0.5702918, -0.3750932, -0.4295854, 0.2352941, 1, 0, 1,
-0.5675016, -0.5978695, -3.522267, 0.2313726, 1, 0, 1,
-0.5668285, -0.2010236, -0.428002, 0.2235294, 1, 0, 1,
-0.5663177, 3.092055, 0.2021077, 0.2196078, 1, 0, 1,
-0.5660512, 0.4881462, -1.417027, 0.2117647, 1, 0, 1,
-0.5652023, 0.07527651, 0.06018121, 0.2078431, 1, 0, 1,
-0.5641689, 0.4027127, -1.073837, 0.2, 1, 0, 1,
-0.5590816, 1.895579, 0.1926456, 0.1921569, 1, 0, 1,
-0.5579216, -0.501915, -4.158698, 0.1882353, 1, 0, 1,
-0.5519078, -0.4098513, -5.032301, 0.1803922, 1, 0, 1,
-0.5465307, -0.5640996, -3.148063, 0.1764706, 1, 0, 1,
-0.5446441, 0.7018493, -0.2790357, 0.1686275, 1, 0, 1,
-0.5439153, 0.9460108, -0.3805987, 0.1647059, 1, 0, 1,
-0.5402361, -0.6003699, -1.139019, 0.1568628, 1, 0, 1,
-0.5278154, 0.7132456, -1.097994, 0.1529412, 1, 0, 1,
-0.524359, -0.552282, -1.924401, 0.145098, 1, 0, 1,
-0.5206403, 0.1329627, -2.157971, 0.1411765, 1, 0, 1,
-0.5180652, 0.552831, -1.672472, 0.1333333, 1, 0, 1,
-0.513126, -1.073968, -2.831115, 0.1294118, 1, 0, 1,
-0.5130349, 1.610476, 0.08050525, 0.1215686, 1, 0, 1,
-0.5067853, 1.225694, -1.271366, 0.1176471, 1, 0, 1,
-0.5028231, -0.1127938, -0.9633574, 0.1098039, 1, 0, 1,
-0.4990528, 0.2449473, 1.094725, 0.1058824, 1, 0, 1,
-0.4903919, -0.8487242, -3.184057, 0.09803922, 1, 0, 1,
-0.4897166, -0.5024951, -3.270205, 0.09019608, 1, 0, 1,
-0.4883423, -1.138622, -2.176587, 0.08627451, 1, 0, 1,
-0.4843203, 0.4712588, -1.090811, 0.07843138, 1, 0, 1,
-0.4768502, 1.329803, -0.557856, 0.07450981, 1, 0, 1,
-0.4750961, -0.723388, -3.83758, 0.06666667, 1, 0, 1,
-0.4726436, 1.051786, -0.6557126, 0.0627451, 1, 0, 1,
-0.468731, -2.10909, -3.82734, 0.05490196, 1, 0, 1,
-0.4677147, -0.1740397, -2.677923, 0.05098039, 1, 0, 1,
-0.4657615, -0.4835947, -2.857523, 0.04313726, 1, 0, 1,
-0.462556, -1.566853, -3.185796, 0.03921569, 1, 0, 1,
-0.4583067, -0.3704466, -2.339339, 0.03137255, 1, 0, 1,
-0.4569188, -0.005565457, -1.71345, 0.02745098, 1, 0, 1,
-0.4492386, 0.1192331, -0.4239185, 0.01960784, 1, 0, 1,
-0.4473131, 0.9334633, -1.871822, 0.01568628, 1, 0, 1,
-0.4387741, -0.3673176, -2.004142, 0.007843138, 1, 0, 1,
-0.4344031, -1.385434, -2.431602, 0.003921569, 1, 0, 1,
-0.432607, 0.2887603, 0.4205552, 0, 1, 0.003921569, 1,
-0.429503, -0.2793936, 0.1385202, 0, 1, 0.01176471, 1,
-0.4279841, -1.597347, -2.940071, 0, 1, 0.01568628, 1,
-0.4228295, -0.2942759, -2.343928, 0, 1, 0.02352941, 1,
-0.4172587, -0.6334578, -1.842508, 0, 1, 0.02745098, 1,
-0.4096084, 0.6339166, -0.5835461, 0, 1, 0.03529412, 1,
-0.4081956, 0.1211316, -1.753586, 0, 1, 0.03921569, 1,
-0.405497, 1.386022, -0.900906, 0, 1, 0.04705882, 1,
-0.4037576, -0.1260767, 0.1316984, 0, 1, 0.05098039, 1,
-0.4006529, 0.1036035, -1.212546, 0, 1, 0.05882353, 1,
-0.3996859, -0.05562871, -1.210461, 0, 1, 0.0627451, 1,
-0.3993046, 0.8172028, -1.210953, 0, 1, 0.07058824, 1,
-0.3974683, -0.1275645, -1.484047, 0, 1, 0.07450981, 1,
-0.3877647, 1.158384, -2.668178, 0, 1, 0.08235294, 1,
-0.3860106, 0.5353813, -0.3383703, 0, 1, 0.08627451, 1,
-0.3821518, 2.262873, -1.513369, 0, 1, 0.09411765, 1,
-0.3758068, -1.631756, -3.962714, 0, 1, 0.1019608, 1,
-0.3754456, -0.4959286, -2.716548, 0, 1, 0.1058824, 1,
-0.3722034, 0.7325794, -2.15705, 0, 1, 0.1137255, 1,
-0.3680324, -0.4404273, -2.867944, 0, 1, 0.1176471, 1,
-0.3675734, -0.961606, -2.547332, 0, 1, 0.1254902, 1,
-0.3663089, 1.12534, 0.7950848, 0, 1, 0.1294118, 1,
-0.3646604, 1.169094, -2.507993, 0, 1, 0.1372549, 1,
-0.363946, -2.079002, -1.771171, 0, 1, 0.1411765, 1,
-0.361194, 0.9318734, -0.9345769, 0, 1, 0.1490196, 1,
-0.3609799, -0.4340515, -2.024705, 0, 1, 0.1529412, 1,
-0.3554286, 0.02202395, -2.410751, 0, 1, 0.1607843, 1,
-0.354109, 0.3403541, 0.7913327, 0, 1, 0.1647059, 1,
-0.3537649, 0.01810104, -2.080909, 0, 1, 0.172549, 1,
-0.3520705, -0.525225, -2.120096, 0, 1, 0.1764706, 1,
-0.3456831, 0.7606155, -0.8377716, 0, 1, 0.1843137, 1,
-0.3444395, -2.429063, -2.056371, 0, 1, 0.1882353, 1,
-0.3436827, -0.9944779, -2.006241, 0, 1, 0.1960784, 1,
-0.3417356, 1.54916, 0.7894449, 0, 1, 0.2039216, 1,
-0.3413657, 0.09145496, -1.794395, 0, 1, 0.2078431, 1,
-0.3347686, 0.008004933, -1.138674, 0, 1, 0.2156863, 1,
-0.3343315, -0.7598748, -1.751224, 0, 1, 0.2196078, 1,
-0.3318739, -0.4126557, -4.102852, 0, 1, 0.227451, 1,
-0.3296204, -0.5156759, -2.803659, 0, 1, 0.2313726, 1,
-0.3266316, 0.3599959, 0.2492383, 0, 1, 0.2392157, 1,
-0.326334, -0.007433909, -2.56329, 0, 1, 0.2431373, 1,
-0.3232368, 0.4783929, -1.202703, 0, 1, 0.2509804, 1,
-0.3128192, 1.449012, 1.410853, 0, 1, 0.254902, 1,
-0.3094241, -0.07680431, -2.450875, 0, 1, 0.2627451, 1,
-0.307977, -0.8118513, -3.216253, 0, 1, 0.2666667, 1,
-0.3071657, 0.4198543, -0.3616065, 0, 1, 0.2745098, 1,
-0.3018661, -1.358946, -2.931557, 0, 1, 0.2784314, 1,
-0.2963536, -0.260208, -1.799087, 0, 1, 0.2862745, 1,
-0.2905821, -0.2887676, -3.458853, 0, 1, 0.2901961, 1,
-0.288702, 0.2169618, -0.1909372, 0, 1, 0.2980392, 1,
-0.2801451, 0.06830584, -1.697714, 0, 1, 0.3058824, 1,
-0.2774685, -0.6204594, -2.039484, 0, 1, 0.3098039, 1,
-0.2751335, 0.2213455, -1.669828, 0, 1, 0.3176471, 1,
-0.2711478, -0.1705584, -2.46874, 0, 1, 0.3215686, 1,
-0.2707091, 0.8461469, -0.1864385, 0, 1, 0.3294118, 1,
-0.2684896, -0.395524, -1.412538, 0, 1, 0.3333333, 1,
-0.2670693, -0.137367, -2.144518, 0, 1, 0.3411765, 1,
-0.2644745, 0.006488115, -0.2136078, 0, 1, 0.345098, 1,
-0.2618012, 0.5594353, -1.038815, 0, 1, 0.3529412, 1,
-0.2607073, 1.213648, -0.06955363, 0, 1, 0.3568628, 1,
-0.2595786, -0.1366085, -2.003659, 0, 1, 0.3647059, 1,
-0.2575198, -0.04791026, -1.629535, 0, 1, 0.3686275, 1,
-0.2554474, -1.709487, -1.513376, 0, 1, 0.3764706, 1,
-0.2533152, 0.3373998, -0.7768078, 0, 1, 0.3803922, 1,
-0.2525048, 1.261893, -1.460825, 0, 1, 0.3882353, 1,
-0.2502325, 1.453907, -0.8727881, 0, 1, 0.3921569, 1,
-0.2430679, 0.4200681, 0.3609908, 0, 1, 0.4, 1,
-0.2415963, -1.588958, -3.010736, 0, 1, 0.4078431, 1,
-0.2415363, -0.5872011, -0.9703743, 0, 1, 0.4117647, 1,
-0.2406698, -0.5901532, -3.150897, 0, 1, 0.4196078, 1,
-0.2372326, 1.873536, -1.118165, 0, 1, 0.4235294, 1,
-0.2332627, -0.2517104, -2.918118, 0, 1, 0.4313726, 1,
-0.232858, -0.5597479, -3.669347, 0, 1, 0.4352941, 1,
-0.2311347, 0.3906119, -1.206384, 0, 1, 0.4431373, 1,
-0.2300778, 0.04885471, -1.781919, 0, 1, 0.4470588, 1,
-0.2296564, -1.534545, -3.805791, 0, 1, 0.454902, 1,
-0.2282116, -0.7172118, -3.084515, 0, 1, 0.4588235, 1,
-0.2253628, 0.8317, -0.860168, 0, 1, 0.4666667, 1,
-0.2248092, -1.458485, -2.401347, 0, 1, 0.4705882, 1,
-0.2237982, 0.1962763, -1.628794, 0, 1, 0.4784314, 1,
-0.2159129, -0.5994087, -3.125819, 0, 1, 0.4823529, 1,
-0.2131421, 0.5793552, 1.867288, 0, 1, 0.4901961, 1,
-0.2129957, -0.7763187, -3.447293, 0, 1, 0.4941176, 1,
-0.2110837, -0.4980431, -2.542743, 0, 1, 0.5019608, 1,
-0.2105048, -0.03609869, -1.987375, 0, 1, 0.509804, 1,
-0.2037042, 0.9749589, -1.440547, 0, 1, 0.5137255, 1,
-0.1993293, -2.248728, -2.453344, 0, 1, 0.5215687, 1,
-0.1990028, -0.3141237, -1.296401, 0, 1, 0.5254902, 1,
-0.1935195, -2.658889, -2.414386, 0, 1, 0.5333334, 1,
-0.1901408, 0.326861, -0.1900664, 0, 1, 0.5372549, 1,
-0.1899215, -0.8150527, -3.294303, 0, 1, 0.5450981, 1,
-0.1885107, 1.542276, -0.8321726, 0, 1, 0.5490196, 1,
-0.1823449, -1.228023, -3.520882, 0, 1, 0.5568628, 1,
-0.1820697, -1.193736, -4.317297, 0, 1, 0.5607843, 1,
-0.1801769, -0.2638408, -2.678449, 0, 1, 0.5686275, 1,
-0.1780891, 0.875254, 0.408092, 0, 1, 0.572549, 1,
-0.1694213, -0.5038594, -2.27083, 0, 1, 0.5803922, 1,
-0.1679969, -0.3754543, -2.305816, 0, 1, 0.5843138, 1,
-0.1677453, 0.4539374, 1.08549, 0, 1, 0.5921569, 1,
-0.1673597, -0.80971, -2.64799, 0, 1, 0.5960785, 1,
-0.1661327, 0.03296477, -1.022361, 0, 1, 0.6039216, 1,
-0.1649692, 0.99806, -1.385318, 0, 1, 0.6117647, 1,
-0.1625795, -1.216912, -2.75936, 0, 1, 0.6156863, 1,
-0.1623752, -0.9561938, -2.943064, 0, 1, 0.6235294, 1,
-0.161864, 0.2398284, -0.8939157, 0, 1, 0.627451, 1,
-0.1466637, -1.606633, -3.069248, 0, 1, 0.6352941, 1,
-0.1446617, -1.36933, -2.128018, 0, 1, 0.6392157, 1,
-0.1445105, 0.6214548, -1.978524, 0, 1, 0.6470588, 1,
-0.1435623, 1.334333, -1.152432, 0, 1, 0.6509804, 1,
-0.1419952, -0.2456025, -3.2869, 0, 1, 0.6588235, 1,
-0.140622, -0.1103936, -2.16328, 0, 1, 0.6627451, 1,
-0.1401192, 0.8286605, -0.3027694, 0, 1, 0.6705883, 1,
-0.1399462, -0.857404, -3.732988, 0, 1, 0.6745098, 1,
-0.1389759, 0.01991499, -2.037965, 0, 1, 0.682353, 1,
-0.1377949, -0.7141725, -2.410613, 0, 1, 0.6862745, 1,
-0.1336114, 0.1539404, -0.4352399, 0, 1, 0.6941177, 1,
-0.1224012, -1.133188, -2.308745, 0, 1, 0.7019608, 1,
-0.1125858, 0.3511172, -0.692432, 0, 1, 0.7058824, 1,
-0.1093356, -0.2307396, -1.04187, 0, 1, 0.7137255, 1,
-0.1079671, -1.014954, -4.320559, 0, 1, 0.7176471, 1,
-0.1037814, -0.9099264, -2.108006, 0, 1, 0.7254902, 1,
-0.1023944, 1.605785, -0.8779405, 0, 1, 0.7294118, 1,
-0.101422, -1.067192, -4.515323, 0, 1, 0.7372549, 1,
-0.09909783, 1.093946, 1.348024, 0, 1, 0.7411765, 1,
-0.09818268, -0.5069166, -3.445892, 0, 1, 0.7490196, 1,
-0.09698569, -0.3293586, -1.744493, 0, 1, 0.7529412, 1,
-0.09686209, 0.6600836, 0.5400867, 0, 1, 0.7607843, 1,
-0.09641193, 2.674807, 0.1465644, 0, 1, 0.7647059, 1,
-0.09387285, -0.007659105, -1.934286, 0, 1, 0.772549, 1,
-0.09321388, 0.8919588, -0.3233439, 0, 1, 0.7764706, 1,
-0.09255613, 0.7145808, -1.236146, 0, 1, 0.7843137, 1,
-0.09035996, -1.403518, -4.410038, 0, 1, 0.7882353, 1,
-0.08597434, 0.1518516, -1.685305, 0, 1, 0.7960784, 1,
-0.08580255, 0.6449649, -0.8254914, 0, 1, 0.8039216, 1,
-0.08290028, -0.576345, -3.451416, 0, 1, 0.8078431, 1,
-0.08179175, 0.4532635, -1.186587, 0, 1, 0.8156863, 1,
-0.07942994, 1.566499, -2.303404, 0, 1, 0.8196079, 1,
-0.07732782, 0.7290761, -0.321702, 0, 1, 0.827451, 1,
-0.07457708, 0.2373756, 0.4584151, 0, 1, 0.8313726, 1,
-0.07392287, -0.1328204, -1.297699, 0, 1, 0.8392157, 1,
-0.07271916, -0.9009148, -2.049046, 0, 1, 0.8431373, 1,
-0.06454057, -0.1652458, -1.428344, 0, 1, 0.8509804, 1,
-0.06399964, -0.7132651, -2.832962, 0, 1, 0.854902, 1,
-0.06295338, 0.3789409, -0.03648384, 0, 1, 0.8627451, 1,
-0.06030584, -0.51838, -1.779588, 0, 1, 0.8666667, 1,
-0.05739768, 0.08892898, -0.8499303, 0, 1, 0.8745098, 1,
-0.05388063, 0.769442, -2.023623, 0, 1, 0.8784314, 1,
-0.05254922, 1.227694, 0.05779524, 0, 1, 0.8862745, 1,
-0.04841438, -0.8851951, -3.583826, 0, 1, 0.8901961, 1,
-0.04808198, 0.7672024, 0.7053641, 0, 1, 0.8980392, 1,
-0.04711518, -0.417388, -2.852761, 0, 1, 0.9058824, 1,
-0.04691229, 0.7188833, -0.2724684, 0, 1, 0.9098039, 1,
-0.04625089, 0.489745, -0.1632409, 0, 1, 0.9176471, 1,
-0.04510364, -0.7030641, -2.756774, 0, 1, 0.9215686, 1,
-0.04351904, 0.3849541, -0.163895, 0, 1, 0.9294118, 1,
-0.04142405, 0.8501224, 1.312291, 0, 1, 0.9333333, 1,
-0.0397863, 1.002405, 0.5987886, 0, 1, 0.9411765, 1,
-0.03866046, -0.06084941, -3.153096, 0, 1, 0.945098, 1,
-0.03141672, -0.4862762, -4.465488, 0, 1, 0.9529412, 1,
-0.02932258, 1.465484, 1.425919, 0, 1, 0.9568627, 1,
-0.02925913, -1.823105, -3.929767, 0, 1, 0.9647059, 1,
-0.02665159, 0.08583876, -0.5961785, 0, 1, 0.9686275, 1,
-0.02653266, 1.970014, 0.3537853, 0, 1, 0.9764706, 1,
-0.02544397, 0.2730195, 0.3425933, 0, 1, 0.9803922, 1,
-0.01972385, -0.5888874, -2.141115, 0, 1, 0.9882353, 1,
-0.008848392, 1.150708, 1.232659, 0, 1, 0.9921569, 1,
-0.00439731, 0.2994652, -0.1107319, 0, 1, 1, 1,
-0.001216694, -0.7453436, -1.873056, 0, 0.9921569, 1, 1,
-0.0001820847, 1.223753, -1.689139, 0, 0.9882353, 1, 1,
0.004810906, 0.8413312, 0.8827997, 0, 0.9803922, 1, 1,
0.005006344, -0.6481964, 3.04214, 0, 0.9764706, 1, 1,
0.006055445, -0.5701283, 1.878331, 0, 0.9686275, 1, 1,
0.01631352, -0.7582039, 4.319517, 0, 0.9647059, 1, 1,
0.01648523, -0.2908579, 3.118107, 0, 0.9568627, 1, 1,
0.0182043, 0.1411566, -0.2482714, 0, 0.9529412, 1, 1,
0.01841813, -1.159051, 1.777107, 0, 0.945098, 1, 1,
0.01995852, 0.3842941, 0.8821667, 0, 0.9411765, 1, 1,
0.02267525, 0.1294501, 0.9988803, 0, 0.9333333, 1, 1,
0.02483823, -1.29234, 3.878418, 0, 0.9294118, 1, 1,
0.02565692, -1.349218, 2.385707, 0, 0.9215686, 1, 1,
0.02753302, -0.3350995, 3.015262, 0, 0.9176471, 1, 1,
0.02783522, 1.570707, -0.8726175, 0, 0.9098039, 1, 1,
0.03447927, -0.4872526, 3.928816, 0, 0.9058824, 1, 1,
0.03588671, 0.4963999, 0.482444, 0, 0.8980392, 1, 1,
0.03821569, -1.189562, 2.602981, 0, 0.8901961, 1, 1,
0.0405313, 0.4862398, -2.474071, 0, 0.8862745, 1, 1,
0.04121272, 0.7716491, -0.07112981, 0, 0.8784314, 1, 1,
0.04611591, -0.7594763, 2.17116, 0, 0.8745098, 1, 1,
0.04967359, 1.423031, 0.8516093, 0, 0.8666667, 1, 1,
0.05465699, -0.2243456, 3.507429, 0, 0.8627451, 1, 1,
0.0570241, -0.9949359, 5.056224, 0, 0.854902, 1, 1,
0.05982947, -1.694057, 3.234954, 0, 0.8509804, 1, 1,
0.06127442, -1.183962, 5.009725, 0, 0.8431373, 1, 1,
0.06345388, -0.8859047, 4.250215, 0, 0.8392157, 1, 1,
0.064105, -0.9060985, 1.592566, 0, 0.8313726, 1, 1,
0.07190658, 1.549562, 1.192112, 0, 0.827451, 1, 1,
0.07223798, -1.609129, 2.516553, 0, 0.8196079, 1, 1,
0.07392327, 0.1363857, 1.293984, 0, 0.8156863, 1, 1,
0.08101904, 0.2959406, 1.100175, 0, 0.8078431, 1, 1,
0.08122811, 1.138168, 1.629775, 0, 0.8039216, 1, 1,
0.08501508, 0.0410018, -0.4884362, 0, 0.7960784, 1, 1,
0.08635817, 1.560599, -0.6204554, 0, 0.7882353, 1, 1,
0.0870299, 0.3543343, -2.676514, 0, 0.7843137, 1, 1,
0.1079488, 1.039958, -0.3424459, 0, 0.7764706, 1, 1,
0.1081188, 0.5668473, -0.2702415, 0, 0.772549, 1, 1,
0.1094164, -1.234044, 2.647544, 0, 0.7647059, 1, 1,
0.1137058, 2.105385, -0.7950501, 0, 0.7607843, 1, 1,
0.1147868, 0.4901276, -1.346301, 0, 0.7529412, 1, 1,
0.1153991, -0.4032455, 1.379945, 0, 0.7490196, 1, 1,
0.1182979, -0.02961994, 2.076908, 0, 0.7411765, 1, 1,
0.1200813, 0.04543605, 2.89458, 0, 0.7372549, 1, 1,
0.1208315, 0.4919007, 1.191365, 0, 0.7294118, 1, 1,
0.1210326, 0.6077139, 0.4149494, 0, 0.7254902, 1, 1,
0.1217084, -0.1946782, 2.353022, 0, 0.7176471, 1, 1,
0.1236575, -1.841977, 3.915884, 0, 0.7137255, 1, 1,
0.1243911, -0.2669839, 2.058977, 0, 0.7058824, 1, 1,
0.1253307, 0.08677348, 0.7453063, 0, 0.6980392, 1, 1,
0.1273606, -0.2664918, 2.641461, 0, 0.6941177, 1, 1,
0.1276632, 1.271034, 1.163012, 0, 0.6862745, 1, 1,
0.1285324, -0.4853754, 4.483365, 0, 0.682353, 1, 1,
0.1307115, -0.5007666, 1.627388, 0, 0.6745098, 1, 1,
0.1312759, 0.5032132, -0.1339939, 0, 0.6705883, 1, 1,
0.1320076, 1.370807, -0.8832428, 0, 0.6627451, 1, 1,
0.1368666, -1.045264, 2.545998, 0, 0.6588235, 1, 1,
0.1436716, -0.4089091, 1.5107, 0, 0.6509804, 1, 1,
0.1447362, 0.1195547, 2.61359, 0, 0.6470588, 1, 1,
0.1480404, -0.960339, 2.838769, 0, 0.6392157, 1, 1,
0.1534828, -0.01034737, 0.4677723, 0, 0.6352941, 1, 1,
0.1543151, 0.09249305, 0.5903407, 0, 0.627451, 1, 1,
0.1552792, 1.182215, 1.577098, 0, 0.6235294, 1, 1,
0.1553998, -1.516057, 1.800797, 0, 0.6156863, 1, 1,
0.1589094, 1.16837, 1.016427, 0, 0.6117647, 1, 1,
0.159101, -0.3958372, 5.40822, 0, 0.6039216, 1, 1,
0.1736789, 0.7890545, 1.678809, 0, 0.5960785, 1, 1,
0.1863441, 0.1586366, 0.8080349, 0, 0.5921569, 1, 1,
0.1890435, 1.356314, -0.8140262, 0, 0.5843138, 1, 1,
0.1926563, 0.7076397, 0.3888417, 0, 0.5803922, 1, 1,
0.1987529, 0.1311994, 0.363336, 0, 0.572549, 1, 1,
0.2008108, -0.4066289, 2.956225, 0, 0.5686275, 1, 1,
0.2022454, 0.09999281, 0.9172429, 0, 0.5607843, 1, 1,
0.2041303, -1.384119, 3.752927, 0, 0.5568628, 1, 1,
0.2053848, 1.574849, -0.1072151, 0, 0.5490196, 1, 1,
0.206114, 1.781916, -0.3584449, 0, 0.5450981, 1, 1,
0.2090889, -1.627382, 2.314656, 0, 0.5372549, 1, 1,
0.2116216, -0.632202, 3.431391, 0, 0.5333334, 1, 1,
0.2175427, 0.08079675, 1.659655, 0, 0.5254902, 1, 1,
0.2181074, 0.9135819, -0.4858468, 0, 0.5215687, 1, 1,
0.220261, -0.9803681, 3.386595, 0, 0.5137255, 1, 1,
0.2218448, 0.5413823, 2.280862, 0, 0.509804, 1, 1,
0.2225922, -0.3234983, 3.186184, 0, 0.5019608, 1, 1,
0.2270757, 0.8666738, 0.2398629, 0, 0.4941176, 1, 1,
0.2301429, 1.224311, 0.4228871, 0, 0.4901961, 1, 1,
0.2335877, 0.02527096, 1.077731, 0, 0.4823529, 1, 1,
0.2353007, 1.214355, 1.365353, 0, 0.4784314, 1, 1,
0.2372083, -1.235432, 3.175197, 0, 0.4705882, 1, 1,
0.2421615, -1.145764, 3.298377, 0, 0.4666667, 1, 1,
0.2423255, 0.006428008, 1.136226, 0, 0.4588235, 1, 1,
0.2424584, -0.1328385, 2.475848, 0, 0.454902, 1, 1,
0.2451744, 1.548882, 1.971619, 0, 0.4470588, 1, 1,
0.2486873, 0.07136688, 1.41389, 0, 0.4431373, 1, 1,
0.2525673, 0.188925, 1.341511, 0, 0.4352941, 1, 1,
0.2541224, -0.6622979, 1.121042, 0, 0.4313726, 1, 1,
0.2553734, 0.03021923, 1.346611, 0, 0.4235294, 1, 1,
0.2596698, 0.2851192, -0.1158689, 0, 0.4196078, 1, 1,
0.2610963, 1.163785, 0.02245842, 0, 0.4117647, 1, 1,
0.2616405, -1.162288, 5.491513, 0, 0.4078431, 1, 1,
0.2625642, 0.663432, 1.640524, 0, 0.4, 1, 1,
0.2653982, -0.2477804, 2.208469, 0, 0.3921569, 1, 1,
0.2695706, 2.311824, 0.2420567, 0, 0.3882353, 1, 1,
0.2820777, 0.3223001, 1.090953, 0, 0.3803922, 1, 1,
0.2829621, 0.1883626, 1.03379, 0, 0.3764706, 1, 1,
0.2830743, -0.3929668, 1.31276, 0, 0.3686275, 1, 1,
0.2837435, 0.472341, -0.3850737, 0, 0.3647059, 1, 1,
0.2852231, 0.6529728, -0.06795394, 0, 0.3568628, 1, 1,
0.2856007, -0.1755138, 3.660813, 0, 0.3529412, 1, 1,
0.2862816, 1.144492, 0.05184979, 0, 0.345098, 1, 1,
0.2893812, 0.06939744, 2.048845, 0, 0.3411765, 1, 1,
0.2949583, 0.5463943, 1.223223, 0, 0.3333333, 1, 1,
0.3072271, -0.1746718, 1.159271, 0, 0.3294118, 1, 1,
0.3072751, 0.03478244, 0.9704539, 0, 0.3215686, 1, 1,
0.3078298, -1.746628, 2.599125, 0, 0.3176471, 1, 1,
0.3081548, 0.6689655, 0.3598373, 0, 0.3098039, 1, 1,
0.3084317, -0.02480958, 2.107065, 0, 0.3058824, 1, 1,
0.3091584, 1.662407, -0.181675, 0, 0.2980392, 1, 1,
0.3095312, 1.57868, -0.5774295, 0, 0.2901961, 1, 1,
0.3096097, -1.601828, 0.6822578, 0, 0.2862745, 1, 1,
0.3099624, 0.2661597, -0.3155145, 0, 0.2784314, 1, 1,
0.3143544, -0.1716357, 1.40116, 0, 0.2745098, 1, 1,
0.3167042, -0.19407, 3.733939, 0, 0.2666667, 1, 1,
0.3188828, -1.781589, 2.158729, 0, 0.2627451, 1, 1,
0.3224819, -1.498931, 2.258401, 0, 0.254902, 1, 1,
0.3229345, 0.8615488, 1.703984, 0, 0.2509804, 1, 1,
0.3277371, 2.063044, -1.739525, 0, 0.2431373, 1, 1,
0.3292044, 0.5693558, 1.902019, 0, 0.2392157, 1, 1,
0.3300392, -2.59122, 1.513211, 0, 0.2313726, 1, 1,
0.334142, -0.4157762, 3.626804, 0, 0.227451, 1, 1,
0.3344055, 1.040968, 1.643372, 0, 0.2196078, 1, 1,
0.3442419, -2.513781, 3.473637, 0, 0.2156863, 1, 1,
0.3524196, -0.7863007, 1.279527, 0, 0.2078431, 1, 1,
0.3539967, 0.2325017, -0.2314736, 0, 0.2039216, 1, 1,
0.3592821, -1.610514, 3.558721, 0, 0.1960784, 1, 1,
0.3686412, -1.216553, 4.422702, 0, 0.1882353, 1, 1,
0.3715762, -0.7040116, 2.084106, 0, 0.1843137, 1, 1,
0.3732812, -1.203335, 2.452133, 0, 0.1764706, 1, 1,
0.373977, -2.008437, 2.00458, 0, 0.172549, 1, 1,
0.3740125, -0.9391869, 2.36092, 0, 0.1647059, 1, 1,
0.3742943, -0.3097263, 3.425306, 0, 0.1607843, 1, 1,
0.3756037, 0.226079, 0.7049494, 0, 0.1529412, 1, 1,
0.3771268, 1.293145, 0.3522093, 0, 0.1490196, 1, 1,
0.3781407, -0.3076832, 3.198199, 0, 0.1411765, 1, 1,
0.3783035, -0.6089635, 2.348198, 0, 0.1372549, 1, 1,
0.38264, 1.417729, 1.424232, 0, 0.1294118, 1, 1,
0.388191, -0.6920747, 3.568998, 0, 0.1254902, 1, 1,
0.3913707, -2.214513, 1.628832, 0, 0.1176471, 1, 1,
0.392399, 0.008033209, 3.011537, 0, 0.1137255, 1, 1,
0.3952061, -0.4064291, 1.386175, 0, 0.1058824, 1, 1,
0.3954376, 0.3460932, 1.205752, 0, 0.09803922, 1, 1,
0.3957411, 2.09674, 0.3652855, 0, 0.09411765, 1, 1,
0.4023664, 2.640674, 1.06031, 0, 0.08627451, 1, 1,
0.4026255, 0.1193138, 2.193681, 0, 0.08235294, 1, 1,
0.4048818, -0.2213763, 4.006861, 0, 0.07450981, 1, 1,
0.4090033, -0.4787774, 1.267825, 0, 0.07058824, 1, 1,
0.4121917, -2.133122, 2.83158, 0, 0.0627451, 1, 1,
0.4126919, -0.7298299, 2.92778, 0, 0.05882353, 1, 1,
0.4139267, 0.6819155, 1.819534, 0, 0.05098039, 1, 1,
0.4140257, 1.473454, -1.484796, 0, 0.04705882, 1, 1,
0.4212528, -0.3064236, 3.57995, 0, 0.03921569, 1, 1,
0.4213475, -0.3616837, 3.390396, 0, 0.03529412, 1, 1,
0.4214422, -1.039273, 2.158816, 0, 0.02745098, 1, 1,
0.4214659, 0.5331065, 0.9945729, 0, 0.02352941, 1, 1,
0.4281888, 0.1648359, 1.047161, 0, 0.01568628, 1, 1,
0.4293318, 1.277085, -2.054332, 0, 0.01176471, 1, 1,
0.4324764, -1.10063, 3.294529, 0, 0.003921569, 1, 1,
0.4384617, -0.1825548, 1.158596, 0.003921569, 0, 1, 1,
0.4422859, -1.43126, 1.601549, 0.007843138, 0, 1, 1,
0.4435427, 0.5122834, 0.546754, 0.01568628, 0, 1, 1,
0.444174, 0.682409, -0.4813432, 0.01960784, 0, 1, 1,
0.4461334, -0.6454, 3.011746, 0.02745098, 0, 1, 1,
0.4531878, -0.6327865, 1.336446, 0.03137255, 0, 1, 1,
0.4557444, 0.5209141, -0.3308608, 0.03921569, 0, 1, 1,
0.4594169, -2.705374, 4.119812, 0.04313726, 0, 1, 1,
0.459417, 0.5006289, 0.3067693, 0.05098039, 0, 1, 1,
0.461233, 0.9389256, -0.3311404, 0.05490196, 0, 1, 1,
0.4620826, -0.1443498, 0.7004663, 0.0627451, 0, 1, 1,
0.4689067, 2.338798, -1.940727, 0.06666667, 0, 1, 1,
0.4759423, -0.9106526, 1.974545, 0.07450981, 0, 1, 1,
0.4763441, 0.6528894, 0.6975391, 0.07843138, 0, 1, 1,
0.4768123, 0.7141774, 0.7868018, 0.08627451, 0, 1, 1,
0.4770905, 1.232851, 0.4458602, 0.09019608, 0, 1, 1,
0.4781646, -1.110006, 1.582196, 0.09803922, 0, 1, 1,
0.4791183, -0.8100567, 3.295075, 0.1058824, 0, 1, 1,
0.4922779, -0.1766178, 0.5260786, 0.1098039, 0, 1, 1,
0.4991539, -0.6217601, 3.686381, 0.1176471, 0, 1, 1,
0.5013902, -0.3321692, 2.482345, 0.1215686, 0, 1, 1,
0.5048137, -1.985081, 1.955621, 0.1294118, 0, 1, 1,
0.5076621, 0.08173056, 1.333371, 0.1333333, 0, 1, 1,
0.5103328, 0.7121913, 1.514625, 0.1411765, 0, 1, 1,
0.5115056, -0.07583112, 3.4893, 0.145098, 0, 1, 1,
0.5138221, -1.663561, 3.235428, 0.1529412, 0, 1, 1,
0.5169971, -0.5154988, 0.2564657, 0.1568628, 0, 1, 1,
0.5173582, 1.394593, 0.6298692, 0.1647059, 0, 1, 1,
0.5199713, -0.1524878, 0.2229248, 0.1686275, 0, 1, 1,
0.5200468, -0.7629089, 1.704912, 0.1764706, 0, 1, 1,
0.5218128, -0.7008824, 2.99389, 0.1803922, 0, 1, 1,
0.5234362, -0.4979815, 1.4526, 0.1882353, 0, 1, 1,
0.5248219, 1.250225, 0.1381881, 0.1921569, 0, 1, 1,
0.5254951, 1.782565, -0.5097263, 0.2, 0, 1, 1,
0.5274812, 0.8091834, -0.98813, 0.2078431, 0, 1, 1,
0.5299814, 1.639547, 0.287556, 0.2117647, 0, 1, 1,
0.5312877, 1.226663, 1.158766, 0.2196078, 0, 1, 1,
0.5318946, -0.5346816, 1.566781, 0.2235294, 0, 1, 1,
0.5364174, -0.2173936, 2.652439, 0.2313726, 0, 1, 1,
0.5373155, -0.07782269, 2.766928, 0.2352941, 0, 1, 1,
0.5388598, 1.263086, 0.2163141, 0.2431373, 0, 1, 1,
0.5438909, -1.734048, 0.8209018, 0.2470588, 0, 1, 1,
0.5450194, 0.2205588, 2.152035, 0.254902, 0, 1, 1,
0.546978, -0.5651315, 2.746764, 0.2588235, 0, 1, 1,
0.5498607, 1.494549, 0.5896608, 0.2666667, 0, 1, 1,
0.5520251, -0.4981596, 3.269005, 0.2705882, 0, 1, 1,
0.5542468, 1.219142, -1.144483, 0.2784314, 0, 1, 1,
0.5542812, 0.26658, 2.092623, 0.282353, 0, 1, 1,
0.5543966, 0.4478755, 1.219851, 0.2901961, 0, 1, 1,
0.56498, 0.4650503, 1.431373, 0.2941177, 0, 1, 1,
0.5681382, 0.8745872, 0.3251968, 0.3019608, 0, 1, 1,
0.578599, 1.361928, -0.06084055, 0.3098039, 0, 1, 1,
0.5865968, 0.4106064, -0.3677289, 0.3137255, 0, 1, 1,
0.5872306, 2.816145, -0.1658656, 0.3215686, 0, 1, 1,
0.5963352, -0.5025509, 2.554788, 0.3254902, 0, 1, 1,
0.6054047, 0.1984412, -0.3617391, 0.3333333, 0, 1, 1,
0.6075098, 1.199265, 2.390225, 0.3372549, 0, 1, 1,
0.608521, 0.009160106, -0.9989098, 0.345098, 0, 1, 1,
0.6111353, 0.9849768, 1.281753, 0.3490196, 0, 1, 1,
0.6158072, 0.5627064, -0.4802948, 0.3568628, 0, 1, 1,
0.6161715, 1.063145, 0.7731799, 0.3607843, 0, 1, 1,
0.6237535, -1.273467, 0.3135145, 0.3686275, 0, 1, 1,
0.6276934, -0.7048905, 3.980269, 0.372549, 0, 1, 1,
0.6366028, 0.6452199, 1.088979, 0.3803922, 0, 1, 1,
0.6381791, -0.2343093, 2.484331, 0.3843137, 0, 1, 1,
0.6432346, 1.106486, 1.752379, 0.3921569, 0, 1, 1,
0.6449335, -0.9427385, 2.955455, 0.3960784, 0, 1, 1,
0.6461226, 0.9702535, -0.09737384, 0.4039216, 0, 1, 1,
0.6467543, 1.325663, 0.3986866, 0.4117647, 0, 1, 1,
0.6489522, 0.7263621, 1.341737, 0.4156863, 0, 1, 1,
0.6528954, 1.0023, 1.978777, 0.4235294, 0, 1, 1,
0.6603019, -0.7737437, 3.290183, 0.427451, 0, 1, 1,
0.6604314, -0.1353641, 4.886458, 0.4352941, 0, 1, 1,
0.6631228, -0.9769022, 2.821012, 0.4392157, 0, 1, 1,
0.6692207, 0.06889823, 0.8946129, 0.4470588, 0, 1, 1,
0.6737232, -1.153514, 1.32093, 0.4509804, 0, 1, 1,
0.674058, -0.6388665, 2.566003, 0.4588235, 0, 1, 1,
0.6777306, 0.9698117, 1.392797, 0.4627451, 0, 1, 1,
0.6825729, -0.08908053, 3.064552, 0.4705882, 0, 1, 1,
0.6922731, 0.07811094, 3.290662, 0.4745098, 0, 1, 1,
0.6939084, 2.387457, 0.7526277, 0.4823529, 0, 1, 1,
0.6974261, -0.9987844, -0.1011384, 0.4862745, 0, 1, 1,
0.6985846, -0.6783414, 1.779182, 0.4941176, 0, 1, 1,
0.7009615, 0.09535993, 2.029907, 0.5019608, 0, 1, 1,
0.7056968, 0.3662473, 1.500776, 0.5058824, 0, 1, 1,
0.7085946, 0.1793211, -0.2433837, 0.5137255, 0, 1, 1,
0.7091134, 0.4936984, -1.424782, 0.5176471, 0, 1, 1,
0.709517, -2.350871, 1.142197, 0.5254902, 0, 1, 1,
0.7112367, -0.9466379, 3.350343, 0.5294118, 0, 1, 1,
0.7115958, -1.793522, 1.730202, 0.5372549, 0, 1, 1,
0.7218453, -0.6588127, 2.911797, 0.5411765, 0, 1, 1,
0.7245213, 0.2734803, 0.4153375, 0.5490196, 0, 1, 1,
0.7295746, 0.8716838, -1.026874, 0.5529412, 0, 1, 1,
0.7329761, 2.430197, 0.2319621, 0.5607843, 0, 1, 1,
0.7338842, 0.2997934, 0.8705169, 0.5647059, 0, 1, 1,
0.7354516, 2.140054, 0.9445909, 0.572549, 0, 1, 1,
0.7372229, -1.850692, 4.629365, 0.5764706, 0, 1, 1,
0.7380167, -2.098365, 2.956882, 0.5843138, 0, 1, 1,
0.73871, 1.521986, -0.9621711, 0.5882353, 0, 1, 1,
0.7396983, 0.700904, 2.476937, 0.5960785, 0, 1, 1,
0.7429066, 1.032326, 0.9739432, 0.6039216, 0, 1, 1,
0.7460368, -1.23815, 2.804464, 0.6078432, 0, 1, 1,
0.7464437, 0.04935327, 1.546159, 0.6156863, 0, 1, 1,
0.7488993, -2.065482, 1.297487, 0.6196079, 0, 1, 1,
0.7576557, -0.6104276, 1.32514, 0.627451, 0, 1, 1,
0.7603113, -0.758807, 4.398809, 0.6313726, 0, 1, 1,
0.7635497, 1.896765, 1.702818, 0.6392157, 0, 1, 1,
0.7657129, 0.38918, 0.8272389, 0.6431373, 0, 1, 1,
0.7669097, 0.4947689, 1.636533, 0.6509804, 0, 1, 1,
0.7728025, 1.854423, 1.046457, 0.654902, 0, 1, 1,
0.7802929, -1.923619, 3.743313, 0.6627451, 0, 1, 1,
0.7836223, -0.3407675, 2.495286, 0.6666667, 0, 1, 1,
0.787503, 0.6352694, 0.6417092, 0.6745098, 0, 1, 1,
0.7910069, -0.8840148, 1.69514, 0.6784314, 0, 1, 1,
0.7952771, 1.13553, 1.178726, 0.6862745, 0, 1, 1,
0.7987703, -0.7280345, 3.689623, 0.6901961, 0, 1, 1,
0.8003876, 0.988876, 1.261894, 0.6980392, 0, 1, 1,
0.8068407, -0.7413619, 1.869347, 0.7058824, 0, 1, 1,
0.8090255, -1.091701, 2.063809, 0.7098039, 0, 1, 1,
0.8238586, 0.249975, 2.614036, 0.7176471, 0, 1, 1,
0.8365702, -0.6391451, 1.343023, 0.7215686, 0, 1, 1,
0.8377253, 0.834335, 0.9750097, 0.7294118, 0, 1, 1,
0.840506, 0.07472082, 2.756612, 0.7333333, 0, 1, 1,
0.8408673, 0.8698242, 1.72713, 0.7411765, 0, 1, 1,
0.8446988, 1.240057, 0.7859797, 0.7450981, 0, 1, 1,
0.8448761, 0.4848116, 2.141386, 0.7529412, 0, 1, 1,
0.8579603, -0.1982185, 2.541701, 0.7568628, 0, 1, 1,
0.873258, -0.9037599, 0.7409637, 0.7647059, 0, 1, 1,
0.8748088, 0.629176, 0.9577132, 0.7686275, 0, 1, 1,
0.8757225, -0.1119278, 2.864473, 0.7764706, 0, 1, 1,
0.8769293, 0.1611509, 0.7387537, 0.7803922, 0, 1, 1,
0.8802389, 0.8914447, -0.06940057, 0.7882353, 0, 1, 1,
0.8815331, 0.005286347, 1.428178, 0.7921569, 0, 1, 1,
0.8869258, -0.8136615, 0.1589897, 0.8, 0, 1, 1,
0.8877389, -0.1018453, 3.302323, 0.8078431, 0, 1, 1,
0.8879106, -0.1305429, 0.3410337, 0.8117647, 0, 1, 1,
0.8890916, -1.616649, 2.640509, 0.8196079, 0, 1, 1,
0.8916469, 0.1101461, 3.061621, 0.8235294, 0, 1, 1,
0.8951543, 0.04706124, 0.7721233, 0.8313726, 0, 1, 1,
0.9012173, 1.935689, -0.8399138, 0.8352941, 0, 1, 1,
0.9015384, 0.3958161, 1.889219, 0.8431373, 0, 1, 1,
0.9087112, 0.7573994, 0.6952599, 0.8470588, 0, 1, 1,
0.9089037, -0.8740191, 4.263422, 0.854902, 0, 1, 1,
0.9102585, 1.465461, -1.775666, 0.8588235, 0, 1, 1,
0.9114341, -0.1685583, 2.701452, 0.8666667, 0, 1, 1,
0.9123924, 0.7261477, -1.971358, 0.8705882, 0, 1, 1,
0.9149146, 1.181041, 1.760959, 0.8784314, 0, 1, 1,
0.9239864, 0.9472735, 1.818378, 0.8823529, 0, 1, 1,
0.9334874, 0.5599806, -0.7434954, 0.8901961, 0, 1, 1,
0.942145, 0.4538156, 1.58166, 0.8941177, 0, 1, 1,
0.942553, 0.7088227, -0.05228451, 0.9019608, 0, 1, 1,
0.9475209, -0.6690934, 1.678851, 0.9098039, 0, 1, 1,
0.9514454, 0.7232045, -0.3313806, 0.9137255, 0, 1, 1,
0.9517072, -0.2361939, 0.7344272, 0.9215686, 0, 1, 1,
0.9548664, 0.2324917, 2.018784, 0.9254902, 0, 1, 1,
0.9553489, 0.01870122, 1.929695, 0.9333333, 0, 1, 1,
0.9567081, 0.3198688, 1.109162, 0.9372549, 0, 1, 1,
0.9635886, 0.4321619, 2.117252, 0.945098, 0, 1, 1,
0.9646062, -0.4174042, 2.831379, 0.9490196, 0, 1, 1,
0.9673028, -0.2643821, 2.572818, 0.9568627, 0, 1, 1,
0.9700751, -0.6318771, 2.110762, 0.9607843, 0, 1, 1,
0.9746164, -0.3883801, 0.8019498, 0.9686275, 0, 1, 1,
1.004441, 0.508011, -0.2325074, 0.972549, 0, 1, 1,
1.006924, -1.8844, 4.296688, 0.9803922, 0, 1, 1,
1.007987, 0.006380897, 0.01958873, 0.9843137, 0, 1, 1,
1.013537, -0.9181685, 4.176542, 0.9921569, 0, 1, 1,
1.014115, 0.7704883, 0.1564514, 0.9960784, 0, 1, 1,
1.031049, 0.3942654, 1.54141, 1, 0, 0.9960784, 1,
1.031769, 0.88351, 2.113712, 1, 0, 0.9882353, 1,
1.032947, 1.506077, -0.1955321, 1, 0, 0.9843137, 1,
1.040808, -0.9737554, 4.486527, 1, 0, 0.9764706, 1,
1.042189, -1.57106, 2.662537, 1, 0, 0.972549, 1,
1.042518, 0.2913996, 0.5501145, 1, 0, 0.9647059, 1,
1.04412, 1.701041, 2.275533, 1, 0, 0.9607843, 1,
1.046813, 2.216966, 1.60603, 1, 0, 0.9529412, 1,
1.048127, -0.5057244, 0.9375688, 1, 0, 0.9490196, 1,
1.056424, -0.4349062, 1.815513, 1, 0, 0.9411765, 1,
1.058061, -0.01367417, 1.021806, 1, 0, 0.9372549, 1,
1.059679, -0.696439, 3.06054, 1, 0, 0.9294118, 1,
1.059871, -0.3993225, 2.215364, 1, 0, 0.9254902, 1,
1.070143, -0.7693508, 2.253936, 1, 0, 0.9176471, 1,
1.073883, 1.680289, 1.139046, 1, 0, 0.9137255, 1,
1.075206, -1.429293, 2.245567, 1, 0, 0.9058824, 1,
1.081339, 0.2851939, 1.316051, 1, 0, 0.9019608, 1,
1.081636, -1.688689, 2.529143, 1, 0, 0.8941177, 1,
1.084058, -0.04946913, 1.06986, 1, 0, 0.8862745, 1,
1.08642, 0.677913, -0.2337793, 1, 0, 0.8823529, 1,
1.091586, 0.1512326, 0.9164279, 1, 0, 0.8745098, 1,
1.092009, 1.100435, -1.359836, 1, 0, 0.8705882, 1,
1.103234, -0.7102305, 4.049843, 1, 0, 0.8627451, 1,
1.109842, 2.539425, -0.2474447, 1, 0, 0.8588235, 1,
1.110592, -0.7523395, 2.756509, 1, 0, 0.8509804, 1,
1.11322, 0.1218308, 0.85312, 1, 0, 0.8470588, 1,
1.114368, -0.5188387, 3.776746, 1, 0, 0.8392157, 1,
1.120124, 0.9901399, 1.927727, 1, 0, 0.8352941, 1,
1.123834, 1.089377, -0.1005677, 1, 0, 0.827451, 1,
1.124729, -0.1810233, 3.05177, 1, 0, 0.8235294, 1,
1.130474, 0.01863548, 1.835638, 1, 0, 0.8156863, 1,
1.140261, -0.9852096, 2.245317, 1, 0, 0.8117647, 1,
1.142561, 0.1165637, 1.526644, 1, 0, 0.8039216, 1,
1.155305, -1.205452, 0.1380632, 1, 0, 0.7960784, 1,
1.156855, -0.9646511, 4.136816, 1, 0, 0.7921569, 1,
1.167822, 1.36332, 1.167983, 1, 0, 0.7843137, 1,
1.174927, 1.372497, 2.013207, 1, 0, 0.7803922, 1,
1.182287, -0.853018, 1.816674, 1, 0, 0.772549, 1,
1.18242, -1.302537, 0.7757851, 1, 0, 0.7686275, 1,
1.182503, -1.350172, 2.099422, 1, 0, 0.7607843, 1,
1.185459, 1.661409, 0.06389623, 1, 0, 0.7568628, 1,
1.186868, 1.1634, -0.2419835, 1, 0, 0.7490196, 1,
1.190422, 0.8082845, -0.826896, 1, 0, 0.7450981, 1,
1.199054, 0.6255785, 2.529907, 1, 0, 0.7372549, 1,
1.202415, 1.402685, 2.365545, 1, 0, 0.7333333, 1,
1.208476, -0.9981369, 2.374985, 1, 0, 0.7254902, 1,
1.213496, -0.742132, 1.825655, 1, 0, 0.7215686, 1,
1.219319, 0.1667887, -0.731074, 1, 0, 0.7137255, 1,
1.226318, -0.3080564, 0.8556839, 1, 0, 0.7098039, 1,
1.228354, -0.3123111, 0.7385067, 1, 0, 0.7019608, 1,
1.241661, -0.1598968, 2.165477, 1, 0, 0.6941177, 1,
1.242553, 1.159273, 1.95194, 1, 0, 0.6901961, 1,
1.24291, -1.587815, 1.926917, 1, 0, 0.682353, 1,
1.250596, 1.449274, -0.6991658, 1, 0, 0.6784314, 1,
1.251627, -1.482185, 0.6203635, 1, 0, 0.6705883, 1,
1.258813, 0.7572008, 2.116511, 1, 0, 0.6666667, 1,
1.268601, -0.01652031, 1.786449, 1, 0, 0.6588235, 1,
1.272014, 1.618313, 2.16331, 1, 0, 0.654902, 1,
1.273667, -0.1089108, 1.682146, 1, 0, 0.6470588, 1,
1.286379, 1.618986, 0.23473, 1, 0, 0.6431373, 1,
1.297821, -0.4271245, 1.02424, 1, 0, 0.6352941, 1,
1.303871, -0.1715951, 0.5525851, 1, 0, 0.6313726, 1,
1.321003, -0.1607758, 2.855684, 1, 0, 0.6235294, 1,
1.321739, -0.4947141, 3.142251, 1, 0, 0.6196079, 1,
1.325467, 0.2888868, 2.215258, 1, 0, 0.6117647, 1,
1.330143, 0.9885077, 0.8481052, 1, 0, 0.6078432, 1,
1.332995, 1.0263, 0.9733366, 1, 0, 0.6, 1,
1.335896, -1.395981, 3.647212, 1, 0, 0.5921569, 1,
1.336322, 0.7841159, 0.03315436, 1, 0, 0.5882353, 1,
1.353102, -0.4385467, 2.436017, 1, 0, 0.5803922, 1,
1.354564, 2.302361, 1.514476, 1, 0, 0.5764706, 1,
1.355211, -0.3268251, 2.224397, 1, 0, 0.5686275, 1,
1.35715, -1.432325, 1.291687, 1, 0, 0.5647059, 1,
1.360485, -0.7326447, 2.01147, 1, 0, 0.5568628, 1,
1.368388, 2.043212, 0.160427, 1, 0, 0.5529412, 1,
1.37639, 0.7847468, -1.301888, 1, 0, 0.5450981, 1,
1.383588, 0.9302701, 2.263511, 1, 0, 0.5411765, 1,
1.391159, 0.8266097, 1.983154, 1, 0, 0.5333334, 1,
1.405863, 2.56763, 1.647664, 1, 0, 0.5294118, 1,
1.408558, 1.026816, 1.855232, 1, 0, 0.5215687, 1,
1.419873, 0.05374615, 0.927652, 1, 0, 0.5176471, 1,
1.420757, 0.8561732, 1.245023, 1, 0, 0.509804, 1,
1.423009, -0.3108267, 0.1807829, 1, 0, 0.5058824, 1,
1.427838, 0.3632754, 1.386467, 1, 0, 0.4980392, 1,
1.440412, -0.392646, 1.626956, 1, 0, 0.4901961, 1,
1.441052, -1.333575, 2.339439, 1, 0, 0.4862745, 1,
1.445246, -0.7039317, 2.105855, 1, 0, 0.4784314, 1,
1.450592, 3.126966, -0.2685305, 1, 0, 0.4745098, 1,
1.458984, -1.510741, 2.370538, 1, 0, 0.4666667, 1,
1.463045, -0.1394157, 0.03394517, 1, 0, 0.4627451, 1,
1.463778, -0.1366963, 2.613259, 1, 0, 0.454902, 1,
1.472326, -0.1043775, 2.71753, 1, 0, 0.4509804, 1,
1.477441, -0.20453, 1.11134, 1, 0, 0.4431373, 1,
1.478439, -0.9407284, 1.53289, 1, 0, 0.4392157, 1,
1.485761, -2.644054, 2.596556, 1, 0, 0.4313726, 1,
1.493069, -1.030294, 2.616968, 1, 0, 0.427451, 1,
1.496595, -1.806982, 2.318951, 1, 0, 0.4196078, 1,
1.50508, -1.234313, 3.366383, 1, 0, 0.4156863, 1,
1.506791, -0.1834335, 2.561913, 1, 0, 0.4078431, 1,
1.512865, 0.1903245, 2.123222, 1, 0, 0.4039216, 1,
1.52146, 0.01210778, 0.3117886, 1, 0, 0.3960784, 1,
1.521881, -1.13692, 0.4732572, 1, 0, 0.3882353, 1,
1.528626, -0.7326221, 2.830386, 1, 0, 0.3843137, 1,
1.536052, 0.708046, 1.708539, 1, 0, 0.3764706, 1,
1.552628, -0.7416579, 2.145583, 1, 0, 0.372549, 1,
1.56883, 0.5319448, -1.265906, 1, 0, 0.3647059, 1,
1.575656, 0.484495, 0.7242851, 1, 0, 0.3607843, 1,
1.583151, -1.196114, -0.2292598, 1, 0, 0.3529412, 1,
1.590072, 0.0712212, 0.2470621, 1, 0, 0.3490196, 1,
1.596991, 0.02307193, 1.018939, 1, 0, 0.3411765, 1,
1.601162, -0.1149268, 0.5054151, 1, 0, 0.3372549, 1,
1.602966, 0.9579992, 0.6167935, 1, 0, 0.3294118, 1,
1.613151, 1.871352, 2.428721, 1, 0, 0.3254902, 1,
1.623902, -0.3179375, 4.13483, 1, 0, 0.3176471, 1,
1.634741, 0.1814613, -0.01368987, 1, 0, 0.3137255, 1,
1.648712, -0.1897517, 2.793012, 1, 0, 0.3058824, 1,
1.661721, 0.5112725, -1.037714, 1, 0, 0.2980392, 1,
1.665612, -0.119861, 1.858838, 1, 0, 0.2941177, 1,
1.666233, 0.6661624, 0.3473039, 1, 0, 0.2862745, 1,
1.674198, -1.016644, 2.254904, 1, 0, 0.282353, 1,
1.676849, 0.1666744, 1.925552, 1, 0, 0.2745098, 1,
1.684882, 1.022133, 1.4593, 1, 0, 0.2705882, 1,
1.702283, -0.4965377, 1.113605, 1, 0, 0.2627451, 1,
1.706057, 0.6169665, 2.199145, 1, 0, 0.2588235, 1,
1.709462, 0.8741633, 1.882604, 1, 0, 0.2509804, 1,
1.725971, 0.9334314, -0.8164286, 1, 0, 0.2470588, 1,
1.751578, 0.5989511, 2.060038, 1, 0, 0.2392157, 1,
1.755286, 0.796429, 2.31892, 1, 0, 0.2352941, 1,
1.768087, -0.1166581, 3.232874, 1, 0, 0.227451, 1,
1.775067, -0.5476829, 3.072716, 1, 0, 0.2235294, 1,
1.783157, -0.2919304, 0.3749679, 1, 0, 0.2156863, 1,
1.788787, -1.907837, 2.430242, 1, 0, 0.2117647, 1,
1.788908, 0.8243836, 1.318388, 1, 0, 0.2039216, 1,
1.789289, 0.349695, 1.446923, 1, 0, 0.1960784, 1,
1.798038, 1.390654, 0.6712015, 1, 0, 0.1921569, 1,
1.804351, -0.5333748, 1.513546, 1, 0, 0.1843137, 1,
1.810318, -1.25082, 2.002271, 1, 0, 0.1803922, 1,
1.842385, 0.344878, 1.036766, 1, 0, 0.172549, 1,
1.928923, 1.869823, 2.349825, 1, 0, 0.1686275, 1,
1.944323, 0.3889606, 1.950724, 1, 0, 0.1607843, 1,
1.954136, 0.6621698, 1.250793, 1, 0, 0.1568628, 1,
1.973046, -1.038046, 2.139734, 1, 0, 0.1490196, 1,
1.985145, 1.272155, 1.314253, 1, 0, 0.145098, 1,
2.005505, 0.3248624, 1.77377, 1, 0, 0.1372549, 1,
2.041677, 1.098274, 1.338427, 1, 0, 0.1333333, 1,
2.044947, -0.8046033, 1.130141, 1, 0, 0.1254902, 1,
2.051477, 0.8400097, 1.530421, 1, 0, 0.1215686, 1,
2.066694, -0.09135284, 4.055946, 1, 0, 0.1137255, 1,
2.07147, -0.05949575, 1.522781, 1, 0, 0.1098039, 1,
2.083379, -0.3865891, 2.907746, 1, 0, 0.1019608, 1,
2.136072, 0.1218516, 0.7827186, 1, 0, 0.09411765, 1,
2.171567, -1.124174, 1.239257, 1, 0, 0.09019608, 1,
2.187297, 1.272485, 0.6549523, 1, 0, 0.08235294, 1,
2.229272, -0.4447518, 2.186093, 1, 0, 0.07843138, 1,
2.266144, -0.06447379, 1.511827, 1, 0, 0.07058824, 1,
2.349485, 2.32392, 2.047382, 1, 0, 0.06666667, 1,
2.367933, -0.3781923, 1.616794, 1, 0, 0.05882353, 1,
2.404507, -0.8681264, 1.721221, 1, 0, 0.05490196, 1,
2.432667, 0.8489863, 1.863344, 1, 0, 0.04705882, 1,
2.437217, 0.7921679, -0.3254816, 1, 0, 0.04313726, 1,
2.551896, 0.3448372, 1.539308, 1, 0, 0.03529412, 1,
2.590001, 0.5097633, 0.7707241, 1, 0, 0.03137255, 1,
2.606065, -0.6068775, 2.997773, 1, 0, 0.02352941, 1,
2.606665, 0.5406082, 1.601296, 1, 0, 0.01960784, 1,
2.655603, -1.868469, 2.576289, 1, 0, 0.01176471, 1,
3.311717, -2.118928, 3.064143, 1, 0, 0.007843138, 1
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
-0.1337696, -3.817787, -6.816088, 0, -0.5, 0.5, 0.5,
-0.1337696, -3.817787, -6.816088, 1, -0.5, 0.5, 0.5,
-0.1337696, -3.817787, -6.816088, 1, 1.5, 0.5, 0.5,
-0.1337696, -3.817787, -6.816088, 0, 1.5, 0.5, 0.5
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
-4.747277, 0.4731737, -6.816088, 0, -0.5, 0.5, 0.5,
-4.747277, 0.4731737, -6.816088, 1, -0.5, 0.5, 0.5,
-4.747277, 0.4731737, -6.816088, 1, 1.5, 0.5, 0.5,
-4.747277, 0.4731737, -6.816088, 0, 1.5, 0.5, 0.5
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
-4.747277, -3.817787, 0.2296057, 0, -0.5, 0.5, 0.5,
-4.747277, -3.817787, 0.2296057, 1, -0.5, 0.5, 0.5,
-4.747277, -3.817787, 0.2296057, 1, 1.5, 0.5, 0.5,
-4.747277, -3.817787, 0.2296057, 0, 1.5, 0.5, 0.5
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
-3, -2.827565, -5.190159,
3, -2.827565, -5.190159,
-3, -2.827565, -5.190159,
-3, -2.992602, -5.461147,
-2, -2.827565, -5.190159,
-2, -2.992602, -5.461147,
-1, -2.827565, -5.190159,
-1, -2.992602, -5.461147,
0, -2.827565, -5.190159,
0, -2.992602, -5.461147,
1, -2.827565, -5.190159,
1, -2.992602, -5.461147,
2, -2.827565, -5.190159,
2, -2.992602, -5.461147,
3, -2.827565, -5.190159,
3, -2.992602, -5.461147
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
-3, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
-3, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
-3, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
-3, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5,
-2, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
-2, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
-2, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
-2, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5,
-1, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
-1, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
-1, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
-1, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5,
0, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
0, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
0, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
0, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5,
1, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
1, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
1, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
1, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5,
2, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
2, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
2, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
2, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5,
3, -3.322676, -6.003123, 0, -0.5, 0.5, 0.5,
3, -3.322676, -6.003123, 1, -0.5, 0.5, 0.5,
3, -3.322676, -6.003123, 1, 1.5, 0.5, 0.5,
3, -3.322676, -6.003123, 0, 1.5, 0.5, 0.5
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
-3.682621, -2, -5.190159,
-3.682621, 3, -5.190159,
-3.682621, -2, -5.190159,
-3.860064, -2, -5.461147,
-3.682621, -1, -5.190159,
-3.860064, -1, -5.461147,
-3.682621, 0, -5.190159,
-3.860064, 0, -5.461147,
-3.682621, 1, -5.190159,
-3.860064, 1, -5.461147,
-3.682621, 2, -5.190159,
-3.860064, 2, -5.461147,
-3.682621, 3, -5.190159,
-3.860064, 3, -5.461147
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
-4.214949, -2, -6.003123, 0, -0.5, 0.5, 0.5,
-4.214949, -2, -6.003123, 1, -0.5, 0.5, 0.5,
-4.214949, -2, -6.003123, 1, 1.5, 0.5, 0.5,
-4.214949, -2, -6.003123, 0, 1.5, 0.5, 0.5,
-4.214949, -1, -6.003123, 0, -0.5, 0.5, 0.5,
-4.214949, -1, -6.003123, 1, -0.5, 0.5, 0.5,
-4.214949, -1, -6.003123, 1, 1.5, 0.5, 0.5,
-4.214949, -1, -6.003123, 0, 1.5, 0.5, 0.5,
-4.214949, 0, -6.003123, 0, -0.5, 0.5, 0.5,
-4.214949, 0, -6.003123, 1, -0.5, 0.5, 0.5,
-4.214949, 0, -6.003123, 1, 1.5, 0.5, 0.5,
-4.214949, 0, -6.003123, 0, 1.5, 0.5, 0.5,
-4.214949, 1, -6.003123, 0, -0.5, 0.5, 0.5,
-4.214949, 1, -6.003123, 1, -0.5, 0.5, 0.5,
-4.214949, 1, -6.003123, 1, 1.5, 0.5, 0.5,
-4.214949, 1, -6.003123, 0, 1.5, 0.5, 0.5,
-4.214949, 2, -6.003123, 0, -0.5, 0.5, 0.5,
-4.214949, 2, -6.003123, 1, -0.5, 0.5, 0.5,
-4.214949, 2, -6.003123, 1, 1.5, 0.5, 0.5,
-4.214949, 2, -6.003123, 0, 1.5, 0.5, 0.5,
-4.214949, 3, -6.003123, 0, -0.5, 0.5, 0.5,
-4.214949, 3, -6.003123, 1, -0.5, 0.5, 0.5,
-4.214949, 3, -6.003123, 1, 1.5, 0.5, 0.5,
-4.214949, 3, -6.003123, 0, 1.5, 0.5, 0.5
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
-3.682621, -2.827565, -4,
-3.682621, -2.827565, 4,
-3.682621, -2.827565, -4,
-3.860064, -2.992602, -4,
-3.682621, -2.827565, -2,
-3.860064, -2.992602, -2,
-3.682621, -2.827565, 0,
-3.860064, -2.992602, 0,
-3.682621, -2.827565, 2,
-3.860064, -2.992602, 2,
-3.682621, -2.827565, 4,
-3.860064, -2.992602, 4
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
-4.214949, -3.322676, -4, 0, -0.5, 0.5, 0.5,
-4.214949, -3.322676, -4, 1, -0.5, 0.5, 0.5,
-4.214949, -3.322676, -4, 1, 1.5, 0.5, 0.5,
-4.214949, -3.322676, -4, 0, 1.5, 0.5, 0.5,
-4.214949, -3.322676, -2, 0, -0.5, 0.5, 0.5,
-4.214949, -3.322676, -2, 1, -0.5, 0.5, 0.5,
-4.214949, -3.322676, -2, 1, 1.5, 0.5, 0.5,
-4.214949, -3.322676, -2, 0, 1.5, 0.5, 0.5,
-4.214949, -3.322676, 0, 0, -0.5, 0.5, 0.5,
-4.214949, -3.322676, 0, 1, -0.5, 0.5, 0.5,
-4.214949, -3.322676, 0, 1, 1.5, 0.5, 0.5,
-4.214949, -3.322676, 0, 0, 1.5, 0.5, 0.5,
-4.214949, -3.322676, 2, 0, -0.5, 0.5, 0.5,
-4.214949, -3.322676, 2, 1, -0.5, 0.5, 0.5,
-4.214949, -3.322676, 2, 1, 1.5, 0.5, 0.5,
-4.214949, -3.322676, 2, 0, 1.5, 0.5, 0.5,
-4.214949, -3.322676, 4, 0, -0.5, 0.5, 0.5,
-4.214949, -3.322676, 4, 1, -0.5, 0.5, 0.5,
-4.214949, -3.322676, 4, 1, 1.5, 0.5, 0.5,
-4.214949, -3.322676, 4, 0, 1.5, 0.5, 0.5
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
-3.682621, -2.827565, -5.190159,
-3.682621, 3.773913, -5.190159,
-3.682621, -2.827565, 5.64937,
-3.682621, 3.773913, 5.64937,
-3.682621, -2.827565, -5.190159,
-3.682621, -2.827565, 5.64937,
-3.682621, 3.773913, -5.190159,
-3.682621, 3.773913, 5.64937,
-3.682621, -2.827565, -5.190159,
3.415082, -2.827565, -5.190159,
-3.682621, -2.827565, 5.64937,
3.415082, -2.827565, 5.64937,
-3.682621, 3.773913, -5.190159,
3.415082, 3.773913, -5.190159,
-3.682621, 3.773913, 5.64937,
3.415082, 3.773913, 5.64937,
3.415082, -2.827565, -5.190159,
3.415082, 3.773913, -5.190159,
3.415082, -2.827565, 5.64937,
3.415082, 3.773913, 5.64937,
3.415082, -2.827565, -5.190159,
3.415082, -2.827565, 5.64937,
3.415082, 3.773913, -5.190159,
3.415082, 3.773913, 5.64937
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
var radius = 7.764825;
var distance = 34.54658;
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
mvMatrix.translate( 0.1337696, -0.4731737, -0.2296057 );
mvMatrix.scale( 1.182845, 1.271758, 0.7745245 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54658);
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
tetramethrin<-read.table("tetramethrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetramethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
```

```r
y<-tetramethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
```

```r
z<-tetramethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
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
-3.579257, -0.101354, -1.327544, 0, 0, 1, 1, 1,
-2.871978, -0.2560149, -0.3909627, 1, 0, 0, 1, 1,
-2.765924, -1.197125, -1.038967, 1, 0, 0, 1, 1,
-2.548861, 1.100181, -0.7005252, 1, 0, 0, 1, 1,
-2.502394, -0.9033208, -0.7451858, 1, 0, 0, 1, 1,
-2.480681, 0.671611, -0.2439819, 1, 0, 0, 1, 1,
-2.398775, 1.275865, -1.117396, 0, 0, 0, 1, 1,
-2.358949, -1.550556, -2.402653, 0, 0, 0, 1, 1,
-2.358404, -1.62174, -1.922274, 0, 0, 0, 1, 1,
-2.354751, 0.3115934, -0.3921663, 0, 0, 0, 1, 1,
-2.320184, 1.578664, -0.02598268, 0, 0, 0, 1, 1,
-2.289136, 0.2418125, -2.13145, 0, 0, 0, 1, 1,
-2.278638, -1.368038, -1.346657, 0, 0, 0, 1, 1,
-2.242895, -0.5318028, -1.303078, 1, 1, 1, 1, 1,
-2.239914, -0.2616425, -2.428196, 1, 1, 1, 1, 1,
-2.212603, -1.074605, -3.167743, 1, 1, 1, 1, 1,
-2.183412, 0.7003209, -0.7871606, 1, 1, 1, 1, 1,
-2.176368, 2.152834, -0.06257159, 1, 1, 1, 1, 1,
-2.166749, -1.918632, -2.474535, 1, 1, 1, 1, 1,
-2.134331, -0.05783284, -2.392759, 1, 1, 1, 1, 1,
-2.132958, -0.5003973, -1.306267, 1, 1, 1, 1, 1,
-2.095055, 0.6957288, -0.9412073, 1, 1, 1, 1, 1,
-2.074331, -0.5483095, -1.693104, 1, 1, 1, 1, 1,
-2.072924, 0.3688028, -2.557868, 1, 1, 1, 1, 1,
-2.062648, -1.698516, -3.202905, 1, 1, 1, 1, 1,
-2.037393, -1.958597, -2.49523, 1, 1, 1, 1, 1,
-2.036636, 0.5608897, -0.5480533, 1, 1, 1, 1, 1,
-1.996769, -0.3250061, -1.635516, 1, 1, 1, 1, 1,
-1.977845, 1.18052, -1.546537, 0, 0, 1, 1, 1,
-1.926383, 0.9488325, 0.1811264, 1, 0, 0, 1, 1,
-1.903987, -0.7015994, -0.7410986, 1, 0, 0, 1, 1,
-1.895499, 0.4523136, -2.460508, 1, 0, 0, 1, 1,
-1.894082, -0.2633537, -1.351205, 1, 0, 0, 1, 1,
-1.883931, 0.7146388, -1.203606, 1, 0, 0, 1, 1,
-1.857598, -0.2650934, 0.1562693, 0, 0, 0, 1, 1,
-1.856075, 0.3179926, -2.67769, 0, 0, 0, 1, 1,
-1.85037, -1.169375, -2.957589, 0, 0, 0, 1, 1,
-1.826786, -0.7014076, -2.447531, 0, 0, 0, 1, 1,
-1.809419, 0.507734, -0.4238419, 0, 0, 0, 1, 1,
-1.807285, -0.1948553, -1.075166, 0, 0, 0, 1, 1,
-1.799199, 0.05082876, -0.4905022, 0, 0, 0, 1, 1,
-1.798841, 0.4694063, -2.619093, 1, 1, 1, 1, 1,
-1.79183, -0.5175545, -1.924942, 1, 1, 1, 1, 1,
-1.789922, -1.024869, -0.2176982, 1, 1, 1, 1, 1,
-1.787427, 1.282412, -0.0003780216, 1, 1, 1, 1, 1,
-1.777986, 0.1418485, -2.06096, 1, 1, 1, 1, 1,
-1.773343, -0.05369285, -1.774437, 1, 1, 1, 1, 1,
-1.763185, -2.731427, -3.406402, 1, 1, 1, 1, 1,
-1.729896, 0.4312004, -0.7425678, 1, 1, 1, 1, 1,
-1.699685, 0.6620714, -1.011619, 1, 1, 1, 1, 1,
-1.686715, 0.3345812, -1.775871, 1, 1, 1, 1, 1,
-1.673054, -1.144851, -2.226552, 1, 1, 1, 1, 1,
-1.666897, 1.555374, -0.6896663, 1, 1, 1, 1, 1,
-1.65337, 1.137167, 0.8059597, 1, 1, 1, 1, 1,
-1.648245, -1.390286, -1.192821, 1, 1, 1, 1, 1,
-1.64595, 0.4423971, 0.8413085, 1, 1, 1, 1, 1,
-1.62278, -1.538195, -3.599468, 0, 0, 1, 1, 1,
-1.616919, 0.4898547, -2.112529, 1, 0, 0, 1, 1,
-1.615626, 0.2302199, -1.79217, 1, 0, 0, 1, 1,
-1.606041, -0.4200832, -1.197318, 1, 0, 0, 1, 1,
-1.599581, 1.234526, -1.793533, 1, 0, 0, 1, 1,
-1.599229, -0.3880083, -1.289926, 1, 0, 0, 1, 1,
-1.585406, -0.04587878, -0.529464, 0, 0, 0, 1, 1,
-1.581189, 0.6129673, -0.6062355, 0, 0, 0, 1, 1,
-1.544259, -2.273875, -4.318986, 0, 0, 0, 1, 1,
-1.540687, -0.9554936, -3.206386, 0, 0, 0, 1, 1,
-1.538209, -1.738069, -1.466676, 0, 0, 0, 1, 1,
-1.528226, 1.618567, -0.7828689, 0, 0, 0, 1, 1,
-1.487331, -1.165171, -1.951786, 0, 0, 0, 1, 1,
-1.478776, -1.44004, -1.36135, 1, 1, 1, 1, 1,
-1.476406, -2.190185, -2.205861, 1, 1, 1, 1, 1,
-1.461785, 0.1873347, -1.321657, 1, 1, 1, 1, 1,
-1.460047, -0.7917339, -1.363626, 1, 1, 1, 1, 1,
-1.459589, 0.7142275, -0.2615674, 1, 1, 1, 1, 1,
-1.450133, -1.106905, -3.433112, 1, 1, 1, 1, 1,
-1.44999, 0.210586, -0.1027851, 1, 1, 1, 1, 1,
-1.446447, -0.6042958, -1.272998, 1, 1, 1, 1, 1,
-1.439455, 0.1636836, -1.072894, 1, 1, 1, 1, 1,
-1.43555, -0.2234213, -0.2036005, 1, 1, 1, 1, 1,
-1.408214, -0.5029232, -2.54508, 1, 1, 1, 1, 1,
-1.402146, 0.3054504, -1.252084, 1, 1, 1, 1, 1,
-1.400956, -0.3056517, -0.9837283, 1, 1, 1, 1, 1,
-1.388264, -1.547237, -4.304377, 1, 1, 1, 1, 1,
-1.38676, -0.03977335, -0.6487186, 1, 1, 1, 1, 1,
-1.385969, -0.009572185, -3.387449, 0, 0, 1, 1, 1,
-1.385265, 0.2595798, -1.107387, 1, 0, 0, 1, 1,
-1.384454, -0.03442473, -3.178208, 1, 0, 0, 1, 1,
-1.371306, -1.554967, -1.677163, 1, 0, 0, 1, 1,
-1.363571, 1.399115, -0.9338418, 1, 0, 0, 1, 1,
-1.362371, 0.5049539, -2.009179, 1, 0, 0, 1, 1,
-1.335297, 0.9961364, 0.2089613, 0, 0, 0, 1, 1,
-1.334455, -0.9420464, -1.698452, 0, 0, 0, 1, 1,
-1.33043, -1.88391, -3.176598, 0, 0, 0, 1, 1,
-1.324218, -0.0135471, -0.1089615, 0, 0, 0, 1, 1,
-1.315078, 0.3365326, -0.9155914, 0, 0, 0, 1, 1,
-1.31414, 0.6395299, -1.807015, 0, 0, 0, 1, 1,
-1.309784, -2.342152, -1.559572, 0, 0, 0, 1, 1,
-1.306201, -0.8534182, -3.91926, 1, 1, 1, 1, 1,
-1.306041, -0.1108648, -1.502573, 1, 1, 1, 1, 1,
-1.301544, 0.6459352, -1.543021, 1, 1, 1, 1, 1,
-1.300954, 0.1064337, -0.4535719, 1, 1, 1, 1, 1,
-1.297785, -0.1643093, -2.454205, 1, 1, 1, 1, 1,
-1.294611, 1.253021, -1.991531, 1, 1, 1, 1, 1,
-1.289441, -0.03337286, -1.807504, 1, 1, 1, 1, 1,
-1.249501, -1.193809, -1.434084, 1, 1, 1, 1, 1,
-1.249013, 2.137148, 1.83889, 1, 1, 1, 1, 1,
-1.24749, 0.8161342, -1.413553, 1, 1, 1, 1, 1,
-1.246156, -0.09490493, -1.208475, 1, 1, 1, 1, 1,
-1.246011, 3.036389, -1.203419, 1, 1, 1, 1, 1,
-1.241934, -1.307442, -3.05759, 1, 1, 1, 1, 1,
-1.235449, 1.034947, -0.1274821, 1, 1, 1, 1, 1,
-1.228768, 0.4606257, -1.923625, 1, 1, 1, 1, 1,
-1.22685, 0.7211888, -1.223626, 0, 0, 1, 1, 1,
-1.220295, -0.2917153, -0.2095495, 1, 0, 0, 1, 1,
-1.217368, -0.5883411, -1.561609, 1, 0, 0, 1, 1,
-1.216224, 1.251053, -1.221006, 1, 0, 0, 1, 1,
-1.214753, -0.07895937, -2.187493, 1, 0, 0, 1, 1,
-1.204785, 3.677775, 0.6774887, 1, 0, 0, 1, 1,
-1.198002, 0.5208859, -0.4599109, 0, 0, 0, 1, 1,
-1.191081, -0.1975463, -1.484872, 0, 0, 0, 1, 1,
-1.182712, 0.05666187, 0.06665955, 0, 0, 0, 1, 1,
-1.182205, 0.01927398, -1.788336, 0, 0, 0, 1, 1,
-1.181958, -1.499474, -4.46068, 0, 0, 0, 1, 1,
-1.181822, -0.5476691, -1.339126, 0, 0, 0, 1, 1,
-1.175952, -0.4643491, -0.8239573, 0, 0, 0, 1, 1,
-1.16802, -0.7938046, -1.560699, 1, 1, 1, 1, 1,
-1.164489, -0.1895117, -2.195788, 1, 1, 1, 1, 1,
-1.151428, 0.4026401, -1.365484, 1, 1, 1, 1, 1,
-1.151349, -0.5721534, -2.991367, 1, 1, 1, 1, 1,
-1.143142, 0.7177843, 0.2731587, 1, 1, 1, 1, 1,
-1.136725, 0.1876937, -1.158963, 1, 1, 1, 1, 1,
-1.131997, -0.8610046, -0.1631901, 1, 1, 1, 1, 1,
-1.131671, -0.2602061, -1.905848, 1, 1, 1, 1, 1,
-1.130323, 0.4663938, -1.129175, 1, 1, 1, 1, 1,
-1.121874, -0.1467821, -1.814952, 1, 1, 1, 1, 1,
-1.121197, 1.203441, -1.220304, 1, 1, 1, 1, 1,
-1.119553, 0.2992604, -1.450165, 1, 1, 1, 1, 1,
-1.111774, -1.55156, -3.448125, 1, 1, 1, 1, 1,
-1.111554, -0.02800749, -0.566807, 1, 1, 1, 1, 1,
-1.10868, -0.1993351, -1.906559, 1, 1, 1, 1, 1,
-1.104005, 0.5147369, -1.339265, 0, 0, 1, 1, 1,
-1.089227, 1.105482, -0.7082395, 1, 0, 0, 1, 1,
-1.089014, -1.559855, -0.7953063, 1, 0, 0, 1, 1,
-1.088544, -0.0009427799, -2.338758, 1, 0, 0, 1, 1,
-1.08662, 0.2940316, -1.098622, 1, 0, 0, 1, 1,
-1.085387, 0.5437831, -0.0745825, 1, 0, 0, 1, 1,
-1.085046, 0.06490251, -0.163437, 0, 0, 0, 1, 1,
-1.084174, 1.174356, -1.883885, 0, 0, 0, 1, 1,
-1.081614, -0.2791126, -0.9522854, 0, 0, 0, 1, 1,
-1.080985, 0.3150264, -1.01575, 0, 0, 0, 1, 1,
-1.076491, 0.1439319, -0.7578024, 0, 0, 0, 1, 1,
-1.074166, -1.770788, -3.238173, 0, 0, 0, 1, 1,
-1.073841, -0.932759, -2.788866, 0, 0, 0, 1, 1,
-1.069502, -1.003708, -2.174013, 1, 1, 1, 1, 1,
-1.069231, 1.327024, -0.7278262, 1, 1, 1, 1, 1,
-1.062542, -0.9424956, -2.85825, 1, 1, 1, 1, 1,
-1.055728, 0.3322774, -2.542045, 1, 1, 1, 1, 1,
-1.054673, 0.4144257, -1.09788, 1, 1, 1, 1, 1,
-1.051818, 0.5113226, -1.984868, 1, 1, 1, 1, 1,
-1.051479, 0.7306724, -2.097729, 1, 1, 1, 1, 1,
-1.049964, -2.063504, -2.016053, 1, 1, 1, 1, 1,
-1.049613, 1.272276, -1.196813, 1, 1, 1, 1, 1,
-1.044851, 0.2897891, -1.3451, 1, 1, 1, 1, 1,
-1.044292, 0.7685233, -0.3736998, 1, 1, 1, 1, 1,
-1.042592, 0.1707298, -0.2485507, 1, 1, 1, 1, 1,
-1.034449, -1.101413, -2.315833, 1, 1, 1, 1, 1,
-1.033927, -0.6309345, -1.786752, 1, 1, 1, 1, 1,
-1.031067, -0.7637553, -3.167308, 1, 1, 1, 1, 1,
-1.026613, 0.08291337, -0.9832145, 0, 0, 1, 1, 1,
-1.026253, 1.028758, 0.516122, 1, 0, 0, 1, 1,
-1.02591, -0.2264331, -2.249204, 1, 0, 0, 1, 1,
-1.014323, -0.5276851, -2.831818, 1, 0, 0, 1, 1,
-1.010365, -1.050968, -1.288086, 1, 0, 0, 1, 1,
-1.005906, 1.523231, -0.5265445, 1, 0, 0, 1, 1,
-1.000909, -0.6362922, -2.561324, 0, 0, 0, 1, 1,
-0.9928384, -1.22952, -0.6856694, 0, 0, 0, 1, 1,
-0.9903479, 1.244277, 1.047296, 0, 0, 0, 1, 1,
-0.9869849, 1.28426, 0.1236659, 0, 0, 0, 1, 1,
-0.9762756, 0.3449988, -1.034122, 0, 0, 0, 1, 1,
-0.9590475, 0.09355243, -1.318587, 0, 0, 0, 1, 1,
-0.9584636, -0.7618915, -2.901095, 0, 0, 0, 1, 1,
-0.949849, 1.152889, -2.679924, 1, 1, 1, 1, 1,
-0.9433192, -0.9688023, -3.345501, 1, 1, 1, 1, 1,
-0.9424795, -0.3550291, -1.930638, 1, 1, 1, 1, 1,
-0.9405853, 1.101047, -0.2313366, 1, 1, 1, 1, 1,
-0.9205914, -0.5307351, -2.036955, 1, 1, 1, 1, 1,
-0.9182087, -0.2617185, -0.6980461, 1, 1, 1, 1, 1,
-0.9149759, -0.002168087, -0.1758107, 1, 1, 1, 1, 1,
-0.9146785, -0.5741752, -0.4894747, 1, 1, 1, 1, 1,
-0.9144497, -0.2551154, -2.930223, 1, 1, 1, 1, 1,
-0.9080105, 1.103551, -1.034833, 1, 1, 1, 1, 1,
-0.902075, 0.3226809, -2.541764, 1, 1, 1, 1, 1,
-0.9011919, 1.181335, 0.7204123, 1, 1, 1, 1, 1,
-0.8991869, -0.6560816, 0.3569339, 1, 1, 1, 1, 1,
-0.8970603, 0.2415957, -0.8716513, 1, 1, 1, 1, 1,
-0.8937781, 0.2840176, -2.074716, 1, 1, 1, 1, 1,
-0.890058, 1.568539, 1.228031, 0, 0, 1, 1, 1,
-0.8856791, 0.2451749, -0.4068864, 1, 0, 0, 1, 1,
-0.8827949, 0.2784233, -1.207072, 1, 0, 0, 1, 1,
-0.8811526, 2.100893, -1.676471, 1, 0, 0, 1, 1,
-0.8796468, 0.8867409, -0.8358964, 1, 0, 0, 1, 1,
-0.8789654, -0.9311677, -3.436226, 1, 0, 0, 1, 1,
-0.8771919, 0.7800649, -1.439008, 0, 0, 0, 1, 1,
-0.8730527, 1.279918, 1.745216, 0, 0, 0, 1, 1,
-0.872041, 0.2696692, -3.364412, 0, 0, 0, 1, 1,
-0.8685188, -1.189809, -1.83425, 0, 0, 0, 1, 1,
-0.8669426, -0.8033454, -2.796684, 0, 0, 0, 1, 1,
-0.8664925, 1.144826, -1.761225, 0, 0, 0, 1, 1,
-0.8655894, 0.6706714, -0.9748674, 0, 0, 0, 1, 1,
-0.8647419, -1.803157, -2.568649, 1, 1, 1, 1, 1,
-0.8575709, 0.5670613, 0.9450905, 1, 1, 1, 1, 1,
-0.8520206, 0.519135, 0.2762541, 1, 1, 1, 1, 1,
-0.8457154, 1.185516, -0.3867836, 1, 1, 1, 1, 1,
-0.8358147, 0.2351149, -2.458337, 1, 1, 1, 1, 1,
-0.8214633, 0.01174416, -1.229147, 1, 1, 1, 1, 1,
-0.8213215, -0.5903727, -2.075207, 1, 1, 1, 1, 1,
-0.8196411, -0.02118359, 0.2757703, 1, 1, 1, 1, 1,
-0.8175135, 1.475935, 1.198861, 1, 1, 1, 1, 1,
-0.8168577, -0.4311951, -1.110649, 1, 1, 1, 1, 1,
-0.8166314, 0.6179135, -0.6581079, 1, 1, 1, 1, 1,
-0.8126807, -0.06626431, -1.138774, 1, 1, 1, 1, 1,
-0.8094314, 1.065468, -0.3982224, 1, 1, 1, 1, 1,
-0.8083998, -0.2761037, -3.913694, 1, 1, 1, 1, 1,
-0.8081906, 1.404426, -1.736691, 1, 1, 1, 1, 1,
-0.8003711, 1.289979, -2.417333, 0, 0, 1, 1, 1,
-0.7977892, -0.6252725, -0.2079959, 1, 0, 0, 1, 1,
-0.7950875, -1.169444, -2.435894, 1, 0, 0, 1, 1,
-0.7913441, -1.156548, -2.071939, 1, 0, 0, 1, 1,
-0.7849364, -0.719084, -3.372924, 1, 0, 0, 1, 1,
-0.7849159, 0.1751277, -0.9971214, 1, 0, 0, 1, 1,
-0.7834571, -0.4371538, -4.153167, 0, 0, 0, 1, 1,
-0.7767041, -0.8457782, -3.64965, 0, 0, 0, 1, 1,
-0.7660976, 0.07985262, -0.7462994, 0, 0, 0, 1, 1,
-0.7640387, 0.8100175, 0.04363884, 0, 0, 0, 1, 1,
-0.7632208, -0.6135765, -0.4301636, 0, 0, 0, 1, 1,
-0.7627079, -0.4020608, -2.392617, 0, 0, 0, 1, 1,
-0.7545853, -0.1792419, -2.701004, 0, 0, 0, 1, 1,
-0.7495632, 1.989795, -0.5325559, 1, 1, 1, 1, 1,
-0.748235, -0.3451413, -1.401011, 1, 1, 1, 1, 1,
-0.7458701, -1.226539, -2.07409, 1, 1, 1, 1, 1,
-0.7427493, 0.3012296, -1.701864, 1, 1, 1, 1, 1,
-0.739574, 0.4236291, -0.5928323, 1, 1, 1, 1, 1,
-0.7392299, -0.4338926, -1.955983, 1, 1, 1, 1, 1,
-0.7327968, -0.8899108, -1.664994, 1, 1, 1, 1, 1,
-0.7291279, 0.333984, -0.6784648, 1, 1, 1, 1, 1,
-0.7253467, 0.1228195, -1.034247, 1, 1, 1, 1, 1,
-0.7236668, 1.215678, 0.134957, 1, 1, 1, 1, 1,
-0.7143153, -1.226301, -3.934285, 1, 1, 1, 1, 1,
-0.7106817, -0.7485443, -3.357919, 1, 1, 1, 1, 1,
-0.7062693, -0.05444659, -1.644419, 1, 1, 1, 1, 1,
-0.7042664, 0.9758267, -0.06543309, 1, 1, 1, 1, 1,
-0.703397, 0.003220954, -0.4056802, 1, 1, 1, 1, 1,
-0.7030357, 1.229493, -1.447744, 0, 0, 1, 1, 1,
-0.7002454, -2.562093, -3.640106, 1, 0, 0, 1, 1,
-0.6979717, 0.7762089, -1.297782, 1, 0, 0, 1, 1,
-0.6890545, 0.6985513, 0.1187517, 1, 0, 0, 1, 1,
-0.6889718, -1.560035, -3.472389, 1, 0, 0, 1, 1,
-0.6827455, -0.7438805, -0.6584176, 1, 0, 0, 1, 1,
-0.6801565, -0.04114632, -1.544364, 0, 0, 0, 1, 1,
-0.6782416, -2.450464, -3.013174, 0, 0, 0, 1, 1,
-0.6742632, -0.376719, -0.5984753, 0, 0, 0, 1, 1,
-0.6717941, 0.306984, -2.045962, 0, 0, 0, 1, 1,
-0.671617, -0.4393879, -3.155212, 0, 0, 0, 1, 1,
-0.6710338, -0.161598, -3.437582, 0, 0, 0, 1, 1,
-0.6647993, 0.8761539, -0.91874, 0, 0, 0, 1, 1,
-0.664768, -0.7167923, -2.497831, 1, 1, 1, 1, 1,
-0.663877, -0.1135978, -1.337353, 1, 1, 1, 1, 1,
-0.6563054, -0.1669223, -2.190022, 1, 1, 1, 1, 1,
-0.654856, -0.6785457, -4.497968, 1, 1, 1, 1, 1,
-0.650956, -0.2430734, -0.2852695, 1, 1, 1, 1, 1,
-0.6508607, -0.8436683, -2.028359, 1, 1, 1, 1, 1,
-0.648504, 0.196148, -2.506793, 1, 1, 1, 1, 1,
-0.6484262, -0.7876997, -1.473182, 1, 1, 1, 1, 1,
-0.6478828, 1.008154, 0.1487343, 1, 1, 1, 1, 1,
-0.6478432, -0.5675578, -1.450113, 1, 1, 1, 1, 1,
-0.6445188, 0.09540658, 0.4257872, 1, 1, 1, 1, 1,
-0.6412899, 0.4370243, -1.479486, 1, 1, 1, 1, 1,
-0.6376348, -0.5635368, -2.025805, 1, 1, 1, 1, 1,
-0.6322256, 0.874204, -1.867242, 1, 1, 1, 1, 1,
-0.6255581, 0.3880879, -1.551453, 1, 1, 1, 1, 1,
-0.6229733, -1.304486, -0.4429349, 0, 0, 1, 1, 1,
-0.6162102, 0.5822871, 0.1275969, 1, 0, 0, 1, 1,
-0.6131776, 1.179105, -0.1183879, 1, 0, 0, 1, 1,
-0.6119948, -0.41855, -2.852273, 1, 0, 0, 1, 1,
-0.6110553, -0.5557787, -4.868278, 1, 0, 0, 1, 1,
-0.6034793, 0.2586039, 0.1280058, 1, 0, 0, 1, 1,
-0.5995969, 0.6224908, -0.6334586, 0, 0, 0, 1, 1,
-0.5890319, -0.5384799, -1.823978, 0, 0, 0, 1, 1,
-0.586186, -0.02421384, -2.470343, 0, 0, 0, 1, 1,
-0.5859974, 0.6160292, -1.432207, 0, 0, 0, 1, 1,
-0.5829618, -1.492084, -2.529142, 0, 0, 0, 1, 1,
-0.5765398, 1.660256, 0.5383382, 0, 0, 0, 1, 1,
-0.5738817, -0.4586765, -2.760748, 0, 0, 0, 1, 1,
-0.5718838, -0.4293278, -1.383866, 1, 1, 1, 1, 1,
-0.5702918, -0.3750932, -0.4295854, 1, 1, 1, 1, 1,
-0.5675016, -0.5978695, -3.522267, 1, 1, 1, 1, 1,
-0.5668285, -0.2010236, -0.428002, 1, 1, 1, 1, 1,
-0.5663177, 3.092055, 0.2021077, 1, 1, 1, 1, 1,
-0.5660512, 0.4881462, -1.417027, 1, 1, 1, 1, 1,
-0.5652023, 0.07527651, 0.06018121, 1, 1, 1, 1, 1,
-0.5641689, 0.4027127, -1.073837, 1, 1, 1, 1, 1,
-0.5590816, 1.895579, 0.1926456, 1, 1, 1, 1, 1,
-0.5579216, -0.501915, -4.158698, 1, 1, 1, 1, 1,
-0.5519078, -0.4098513, -5.032301, 1, 1, 1, 1, 1,
-0.5465307, -0.5640996, -3.148063, 1, 1, 1, 1, 1,
-0.5446441, 0.7018493, -0.2790357, 1, 1, 1, 1, 1,
-0.5439153, 0.9460108, -0.3805987, 1, 1, 1, 1, 1,
-0.5402361, -0.6003699, -1.139019, 1, 1, 1, 1, 1,
-0.5278154, 0.7132456, -1.097994, 0, 0, 1, 1, 1,
-0.524359, -0.552282, -1.924401, 1, 0, 0, 1, 1,
-0.5206403, 0.1329627, -2.157971, 1, 0, 0, 1, 1,
-0.5180652, 0.552831, -1.672472, 1, 0, 0, 1, 1,
-0.513126, -1.073968, -2.831115, 1, 0, 0, 1, 1,
-0.5130349, 1.610476, 0.08050525, 1, 0, 0, 1, 1,
-0.5067853, 1.225694, -1.271366, 0, 0, 0, 1, 1,
-0.5028231, -0.1127938, -0.9633574, 0, 0, 0, 1, 1,
-0.4990528, 0.2449473, 1.094725, 0, 0, 0, 1, 1,
-0.4903919, -0.8487242, -3.184057, 0, 0, 0, 1, 1,
-0.4897166, -0.5024951, -3.270205, 0, 0, 0, 1, 1,
-0.4883423, -1.138622, -2.176587, 0, 0, 0, 1, 1,
-0.4843203, 0.4712588, -1.090811, 0, 0, 0, 1, 1,
-0.4768502, 1.329803, -0.557856, 1, 1, 1, 1, 1,
-0.4750961, -0.723388, -3.83758, 1, 1, 1, 1, 1,
-0.4726436, 1.051786, -0.6557126, 1, 1, 1, 1, 1,
-0.468731, -2.10909, -3.82734, 1, 1, 1, 1, 1,
-0.4677147, -0.1740397, -2.677923, 1, 1, 1, 1, 1,
-0.4657615, -0.4835947, -2.857523, 1, 1, 1, 1, 1,
-0.462556, -1.566853, -3.185796, 1, 1, 1, 1, 1,
-0.4583067, -0.3704466, -2.339339, 1, 1, 1, 1, 1,
-0.4569188, -0.005565457, -1.71345, 1, 1, 1, 1, 1,
-0.4492386, 0.1192331, -0.4239185, 1, 1, 1, 1, 1,
-0.4473131, 0.9334633, -1.871822, 1, 1, 1, 1, 1,
-0.4387741, -0.3673176, -2.004142, 1, 1, 1, 1, 1,
-0.4344031, -1.385434, -2.431602, 1, 1, 1, 1, 1,
-0.432607, 0.2887603, 0.4205552, 1, 1, 1, 1, 1,
-0.429503, -0.2793936, 0.1385202, 1, 1, 1, 1, 1,
-0.4279841, -1.597347, -2.940071, 0, 0, 1, 1, 1,
-0.4228295, -0.2942759, -2.343928, 1, 0, 0, 1, 1,
-0.4172587, -0.6334578, -1.842508, 1, 0, 0, 1, 1,
-0.4096084, 0.6339166, -0.5835461, 1, 0, 0, 1, 1,
-0.4081956, 0.1211316, -1.753586, 1, 0, 0, 1, 1,
-0.405497, 1.386022, -0.900906, 1, 0, 0, 1, 1,
-0.4037576, -0.1260767, 0.1316984, 0, 0, 0, 1, 1,
-0.4006529, 0.1036035, -1.212546, 0, 0, 0, 1, 1,
-0.3996859, -0.05562871, -1.210461, 0, 0, 0, 1, 1,
-0.3993046, 0.8172028, -1.210953, 0, 0, 0, 1, 1,
-0.3974683, -0.1275645, -1.484047, 0, 0, 0, 1, 1,
-0.3877647, 1.158384, -2.668178, 0, 0, 0, 1, 1,
-0.3860106, 0.5353813, -0.3383703, 0, 0, 0, 1, 1,
-0.3821518, 2.262873, -1.513369, 1, 1, 1, 1, 1,
-0.3758068, -1.631756, -3.962714, 1, 1, 1, 1, 1,
-0.3754456, -0.4959286, -2.716548, 1, 1, 1, 1, 1,
-0.3722034, 0.7325794, -2.15705, 1, 1, 1, 1, 1,
-0.3680324, -0.4404273, -2.867944, 1, 1, 1, 1, 1,
-0.3675734, -0.961606, -2.547332, 1, 1, 1, 1, 1,
-0.3663089, 1.12534, 0.7950848, 1, 1, 1, 1, 1,
-0.3646604, 1.169094, -2.507993, 1, 1, 1, 1, 1,
-0.363946, -2.079002, -1.771171, 1, 1, 1, 1, 1,
-0.361194, 0.9318734, -0.9345769, 1, 1, 1, 1, 1,
-0.3609799, -0.4340515, -2.024705, 1, 1, 1, 1, 1,
-0.3554286, 0.02202395, -2.410751, 1, 1, 1, 1, 1,
-0.354109, 0.3403541, 0.7913327, 1, 1, 1, 1, 1,
-0.3537649, 0.01810104, -2.080909, 1, 1, 1, 1, 1,
-0.3520705, -0.525225, -2.120096, 1, 1, 1, 1, 1,
-0.3456831, 0.7606155, -0.8377716, 0, 0, 1, 1, 1,
-0.3444395, -2.429063, -2.056371, 1, 0, 0, 1, 1,
-0.3436827, -0.9944779, -2.006241, 1, 0, 0, 1, 1,
-0.3417356, 1.54916, 0.7894449, 1, 0, 0, 1, 1,
-0.3413657, 0.09145496, -1.794395, 1, 0, 0, 1, 1,
-0.3347686, 0.008004933, -1.138674, 1, 0, 0, 1, 1,
-0.3343315, -0.7598748, -1.751224, 0, 0, 0, 1, 1,
-0.3318739, -0.4126557, -4.102852, 0, 0, 0, 1, 1,
-0.3296204, -0.5156759, -2.803659, 0, 0, 0, 1, 1,
-0.3266316, 0.3599959, 0.2492383, 0, 0, 0, 1, 1,
-0.326334, -0.007433909, -2.56329, 0, 0, 0, 1, 1,
-0.3232368, 0.4783929, -1.202703, 0, 0, 0, 1, 1,
-0.3128192, 1.449012, 1.410853, 0, 0, 0, 1, 1,
-0.3094241, -0.07680431, -2.450875, 1, 1, 1, 1, 1,
-0.307977, -0.8118513, -3.216253, 1, 1, 1, 1, 1,
-0.3071657, 0.4198543, -0.3616065, 1, 1, 1, 1, 1,
-0.3018661, -1.358946, -2.931557, 1, 1, 1, 1, 1,
-0.2963536, -0.260208, -1.799087, 1, 1, 1, 1, 1,
-0.2905821, -0.2887676, -3.458853, 1, 1, 1, 1, 1,
-0.288702, 0.2169618, -0.1909372, 1, 1, 1, 1, 1,
-0.2801451, 0.06830584, -1.697714, 1, 1, 1, 1, 1,
-0.2774685, -0.6204594, -2.039484, 1, 1, 1, 1, 1,
-0.2751335, 0.2213455, -1.669828, 1, 1, 1, 1, 1,
-0.2711478, -0.1705584, -2.46874, 1, 1, 1, 1, 1,
-0.2707091, 0.8461469, -0.1864385, 1, 1, 1, 1, 1,
-0.2684896, -0.395524, -1.412538, 1, 1, 1, 1, 1,
-0.2670693, -0.137367, -2.144518, 1, 1, 1, 1, 1,
-0.2644745, 0.006488115, -0.2136078, 1, 1, 1, 1, 1,
-0.2618012, 0.5594353, -1.038815, 0, 0, 1, 1, 1,
-0.2607073, 1.213648, -0.06955363, 1, 0, 0, 1, 1,
-0.2595786, -0.1366085, -2.003659, 1, 0, 0, 1, 1,
-0.2575198, -0.04791026, -1.629535, 1, 0, 0, 1, 1,
-0.2554474, -1.709487, -1.513376, 1, 0, 0, 1, 1,
-0.2533152, 0.3373998, -0.7768078, 1, 0, 0, 1, 1,
-0.2525048, 1.261893, -1.460825, 0, 0, 0, 1, 1,
-0.2502325, 1.453907, -0.8727881, 0, 0, 0, 1, 1,
-0.2430679, 0.4200681, 0.3609908, 0, 0, 0, 1, 1,
-0.2415963, -1.588958, -3.010736, 0, 0, 0, 1, 1,
-0.2415363, -0.5872011, -0.9703743, 0, 0, 0, 1, 1,
-0.2406698, -0.5901532, -3.150897, 0, 0, 0, 1, 1,
-0.2372326, 1.873536, -1.118165, 0, 0, 0, 1, 1,
-0.2332627, -0.2517104, -2.918118, 1, 1, 1, 1, 1,
-0.232858, -0.5597479, -3.669347, 1, 1, 1, 1, 1,
-0.2311347, 0.3906119, -1.206384, 1, 1, 1, 1, 1,
-0.2300778, 0.04885471, -1.781919, 1, 1, 1, 1, 1,
-0.2296564, -1.534545, -3.805791, 1, 1, 1, 1, 1,
-0.2282116, -0.7172118, -3.084515, 1, 1, 1, 1, 1,
-0.2253628, 0.8317, -0.860168, 1, 1, 1, 1, 1,
-0.2248092, -1.458485, -2.401347, 1, 1, 1, 1, 1,
-0.2237982, 0.1962763, -1.628794, 1, 1, 1, 1, 1,
-0.2159129, -0.5994087, -3.125819, 1, 1, 1, 1, 1,
-0.2131421, 0.5793552, 1.867288, 1, 1, 1, 1, 1,
-0.2129957, -0.7763187, -3.447293, 1, 1, 1, 1, 1,
-0.2110837, -0.4980431, -2.542743, 1, 1, 1, 1, 1,
-0.2105048, -0.03609869, -1.987375, 1, 1, 1, 1, 1,
-0.2037042, 0.9749589, -1.440547, 1, 1, 1, 1, 1,
-0.1993293, -2.248728, -2.453344, 0, 0, 1, 1, 1,
-0.1990028, -0.3141237, -1.296401, 1, 0, 0, 1, 1,
-0.1935195, -2.658889, -2.414386, 1, 0, 0, 1, 1,
-0.1901408, 0.326861, -0.1900664, 1, 0, 0, 1, 1,
-0.1899215, -0.8150527, -3.294303, 1, 0, 0, 1, 1,
-0.1885107, 1.542276, -0.8321726, 1, 0, 0, 1, 1,
-0.1823449, -1.228023, -3.520882, 0, 0, 0, 1, 1,
-0.1820697, -1.193736, -4.317297, 0, 0, 0, 1, 1,
-0.1801769, -0.2638408, -2.678449, 0, 0, 0, 1, 1,
-0.1780891, 0.875254, 0.408092, 0, 0, 0, 1, 1,
-0.1694213, -0.5038594, -2.27083, 0, 0, 0, 1, 1,
-0.1679969, -0.3754543, -2.305816, 0, 0, 0, 1, 1,
-0.1677453, 0.4539374, 1.08549, 0, 0, 0, 1, 1,
-0.1673597, -0.80971, -2.64799, 1, 1, 1, 1, 1,
-0.1661327, 0.03296477, -1.022361, 1, 1, 1, 1, 1,
-0.1649692, 0.99806, -1.385318, 1, 1, 1, 1, 1,
-0.1625795, -1.216912, -2.75936, 1, 1, 1, 1, 1,
-0.1623752, -0.9561938, -2.943064, 1, 1, 1, 1, 1,
-0.161864, 0.2398284, -0.8939157, 1, 1, 1, 1, 1,
-0.1466637, -1.606633, -3.069248, 1, 1, 1, 1, 1,
-0.1446617, -1.36933, -2.128018, 1, 1, 1, 1, 1,
-0.1445105, 0.6214548, -1.978524, 1, 1, 1, 1, 1,
-0.1435623, 1.334333, -1.152432, 1, 1, 1, 1, 1,
-0.1419952, -0.2456025, -3.2869, 1, 1, 1, 1, 1,
-0.140622, -0.1103936, -2.16328, 1, 1, 1, 1, 1,
-0.1401192, 0.8286605, -0.3027694, 1, 1, 1, 1, 1,
-0.1399462, -0.857404, -3.732988, 1, 1, 1, 1, 1,
-0.1389759, 0.01991499, -2.037965, 1, 1, 1, 1, 1,
-0.1377949, -0.7141725, -2.410613, 0, 0, 1, 1, 1,
-0.1336114, 0.1539404, -0.4352399, 1, 0, 0, 1, 1,
-0.1224012, -1.133188, -2.308745, 1, 0, 0, 1, 1,
-0.1125858, 0.3511172, -0.692432, 1, 0, 0, 1, 1,
-0.1093356, -0.2307396, -1.04187, 1, 0, 0, 1, 1,
-0.1079671, -1.014954, -4.320559, 1, 0, 0, 1, 1,
-0.1037814, -0.9099264, -2.108006, 0, 0, 0, 1, 1,
-0.1023944, 1.605785, -0.8779405, 0, 0, 0, 1, 1,
-0.101422, -1.067192, -4.515323, 0, 0, 0, 1, 1,
-0.09909783, 1.093946, 1.348024, 0, 0, 0, 1, 1,
-0.09818268, -0.5069166, -3.445892, 0, 0, 0, 1, 1,
-0.09698569, -0.3293586, -1.744493, 0, 0, 0, 1, 1,
-0.09686209, 0.6600836, 0.5400867, 0, 0, 0, 1, 1,
-0.09641193, 2.674807, 0.1465644, 1, 1, 1, 1, 1,
-0.09387285, -0.007659105, -1.934286, 1, 1, 1, 1, 1,
-0.09321388, 0.8919588, -0.3233439, 1, 1, 1, 1, 1,
-0.09255613, 0.7145808, -1.236146, 1, 1, 1, 1, 1,
-0.09035996, -1.403518, -4.410038, 1, 1, 1, 1, 1,
-0.08597434, 0.1518516, -1.685305, 1, 1, 1, 1, 1,
-0.08580255, 0.6449649, -0.8254914, 1, 1, 1, 1, 1,
-0.08290028, -0.576345, -3.451416, 1, 1, 1, 1, 1,
-0.08179175, 0.4532635, -1.186587, 1, 1, 1, 1, 1,
-0.07942994, 1.566499, -2.303404, 1, 1, 1, 1, 1,
-0.07732782, 0.7290761, -0.321702, 1, 1, 1, 1, 1,
-0.07457708, 0.2373756, 0.4584151, 1, 1, 1, 1, 1,
-0.07392287, -0.1328204, -1.297699, 1, 1, 1, 1, 1,
-0.07271916, -0.9009148, -2.049046, 1, 1, 1, 1, 1,
-0.06454057, -0.1652458, -1.428344, 1, 1, 1, 1, 1,
-0.06399964, -0.7132651, -2.832962, 0, 0, 1, 1, 1,
-0.06295338, 0.3789409, -0.03648384, 1, 0, 0, 1, 1,
-0.06030584, -0.51838, -1.779588, 1, 0, 0, 1, 1,
-0.05739768, 0.08892898, -0.8499303, 1, 0, 0, 1, 1,
-0.05388063, 0.769442, -2.023623, 1, 0, 0, 1, 1,
-0.05254922, 1.227694, 0.05779524, 1, 0, 0, 1, 1,
-0.04841438, -0.8851951, -3.583826, 0, 0, 0, 1, 1,
-0.04808198, 0.7672024, 0.7053641, 0, 0, 0, 1, 1,
-0.04711518, -0.417388, -2.852761, 0, 0, 0, 1, 1,
-0.04691229, 0.7188833, -0.2724684, 0, 0, 0, 1, 1,
-0.04625089, 0.489745, -0.1632409, 0, 0, 0, 1, 1,
-0.04510364, -0.7030641, -2.756774, 0, 0, 0, 1, 1,
-0.04351904, 0.3849541, -0.163895, 0, 0, 0, 1, 1,
-0.04142405, 0.8501224, 1.312291, 1, 1, 1, 1, 1,
-0.0397863, 1.002405, 0.5987886, 1, 1, 1, 1, 1,
-0.03866046, -0.06084941, -3.153096, 1, 1, 1, 1, 1,
-0.03141672, -0.4862762, -4.465488, 1, 1, 1, 1, 1,
-0.02932258, 1.465484, 1.425919, 1, 1, 1, 1, 1,
-0.02925913, -1.823105, -3.929767, 1, 1, 1, 1, 1,
-0.02665159, 0.08583876, -0.5961785, 1, 1, 1, 1, 1,
-0.02653266, 1.970014, 0.3537853, 1, 1, 1, 1, 1,
-0.02544397, 0.2730195, 0.3425933, 1, 1, 1, 1, 1,
-0.01972385, -0.5888874, -2.141115, 1, 1, 1, 1, 1,
-0.008848392, 1.150708, 1.232659, 1, 1, 1, 1, 1,
-0.00439731, 0.2994652, -0.1107319, 1, 1, 1, 1, 1,
-0.001216694, -0.7453436, -1.873056, 1, 1, 1, 1, 1,
-0.0001820847, 1.223753, -1.689139, 1, 1, 1, 1, 1,
0.004810906, 0.8413312, 0.8827997, 1, 1, 1, 1, 1,
0.005006344, -0.6481964, 3.04214, 0, 0, 1, 1, 1,
0.006055445, -0.5701283, 1.878331, 1, 0, 0, 1, 1,
0.01631352, -0.7582039, 4.319517, 1, 0, 0, 1, 1,
0.01648523, -0.2908579, 3.118107, 1, 0, 0, 1, 1,
0.0182043, 0.1411566, -0.2482714, 1, 0, 0, 1, 1,
0.01841813, -1.159051, 1.777107, 1, 0, 0, 1, 1,
0.01995852, 0.3842941, 0.8821667, 0, 0, 0, 1, 1,
0.02267525, 0.1294501, 0.9988803, 0, 0, 0, 1, 1,
0.02483823, -1.29234, 3.878418, 0, 0, 0, 1, 1,
0.02565692, -1.349218, 2.385707, 0, 0, 0, 1, 1,
0.02753302, -0.3350995, 3.015262, 0, 0, 0, 1, 1,
0.02783522, 1.570707, -0.8726175, 0, 0, 0, 1, 1,
0.03447927, -0.4872526, 3.928816, 0, 0, 0, 1, 1,
0.03588671, 0.4963999, 0.482444, 1, 1, 1, 1, 1,
0.03821569, -1.189562, 2.602981, 1, 1, 1, 1, 1,
0.0405313, 0.4862398, -2.474071, 1, 1, 1, 1, 1,
0.04121272, 0.7716491, -0.07112981, 1, 1, 1, 1, 1,
0.04611591, -0.7594763, 2.17116, 1, 1, 1, 1, 1,
0.04967359, 1.423031, 0.8516093, 1, 1, 1, 1, 1,
0.05465699, -0.2243456, 3.507429, 1, 1, 1, 1, 1,
0.0570241, -0.9949359, 5.056224, 1, 1, 1, 1, 1,
0.05982947, -1.694057, 3.234954, 1, 1, 1, 1, 1,
0.06127442, -1.183962, 5.009725, 1, 1, 1, 1, 1,
0.06345388, -0.8859047, 4.250215, 1, 1, 1, 1, 1,
0.064105, -0.9060985, 1.592566, 1, 1, 1, 1, 1,
0.07190658, 1.549562, 1.192112, 1, 1, 1, 1, 1,
0.07223798, -1.609129, 2.516553, 1, 1, 1, 1, 1,
0.07392327, 0.1363857, 1.293984, 1, 1, 1, 1, 1,
0.08101904, 0.2959406, 1.100175, 0, 0, 1, 1, 1,
0.08122811, 1.138168, 1.629775, 1, 0, 0, 1, 1,
0.08501508, 0.0410018, -0.4884362, 1, 0, 0, 1, 1,
0.08635817, 1.560599, -0.6204554, 1, 0, 0, 1, 1,
0.0870299, 0.3543343, -2.676514, 1, 0, 0, 1, 1,
0.1079488, 1.039958, -0.3424459, 1, 0, 0, 1, 1,
0.1081188, 0.5668473, -0.2702415, 0, 0, 0, 1, 1,
0.1094164, -1.234044, 2.647544, 0, 0, 0, 1, 1,
0.1137058, 2.105385, -0.7950501, 0, 0, 0, 1, 1,
0.1147868, 0.4901276, -1.346301, 0, 0, 0, 1, 1,
0.1153991, -0.4032455, 1.379945, 0, 0, 0, 1, 1,
0.1182979, -0.02961994, 2.076908, 0, 0, 0, 1, 1,
0.1200813, 0.04543605, 2.89458, 0, 0, 0, 1, 1,
0.1208315, 0.4919007, 1.191365, 1, 1, 1, 1, 1,
0.1210326, 0.6077139, 0.4149494, 1, 1, 1, 1, 1,
0.1217084, -0.1946782, 2.353022, 1, 1, 1, 1, 1,
0.1236575, -1.841977, 3.915884, 1, 1, 1, 1, 1,
0.1243911, -0.2669839, 2.058977, 1, 1, 1, 1, 1,
0.1253307, 0.08677348, 0.7453063, 1, 1, 1, 1, 1,
0.1273606, -0.2664918, 2.641461, 1, 1, 1, 1, 1,
0.1276632, 1.271034, 1.163012, 1, 1, 1, 1, 1,
0.1285324, -0.4853754, 4.483365, 1, 1, 1, 1, 1,
0.1307115, -0.5007666, 1.627388, 1, 1, 1, 1, 1,
0.1312759, 0.5032132, -0.1339939, 1, 1, 1, 1, 1,
0.1320076, 1.370807, -0.8832428, 1, 1, 1, 1, 1,
0.1368666, -1.045264, 2.545998, 1, 1, 1, 1, 1,
0.1436716, -0.4089091, 1.5107, 1, 1, 1, 1, 1,
0.1447362, 0.1195547, 2.61359, 1, 1, 1, 1, 1,
0.1480404, -0.960339, 2.838769, 0, 0, 1, 1, 1,
0.1534828, -0.01034737, 0.4677723, 1, 0, 0, 1, 1,
0.1543151, 0.09249305, 0.5903407, 1, 0, 0, 1, 1,
0.1552792, 1.182215, 1.577098, 1, 0, 0, 1, 1,
0.1553998, -1.516057, 1.800797, 1, 0, 0, 1, 1,
0.1589094, 1.16837, 1.016427, 1, 0, 0, 1, 1,
0.159101, -0.3958372, 5.40822, 0, 0, 0, 1, 1,
0.1736789, 0.7890545, 1.678809, 0, 0, 0, 1, 1,
0.1863441, 0.1586366, 0.8080349, 0, 0, 0, 1, 1,
0.1890435, 1.356314, -0.8140262, 0, 0, 0, 1, 1,
0.1926563, 0.7076397, 0.3888417, 0, 0, 0, 1, 1,
0.1987529, 0.1311994, 0.363336, 0, 0, 0, 1, 1,
0.2008108, -0.4066289, 2.956225, 0, 0, 0, 1, 1,
0.2022454, 0.09999281, 0.9172429, 1, 1, 1, 1, 1,
0.2041303, -1.384119, 3.752927, 1, 1, 1, 1, 1,
0.2053848, 1.574849, -0.1072151, 1, 1, 1, 1, 1,
0.206114, 1.781916, -0.3584449, 1, 1, 1, 1, 1,
0.2090889, -1.627382, 2.314656, 1, 1, 1, 1, 1,
0.2116216, -0.632202, 3.431391, 1, 1, 1, 1, 1,
0.2175427, 0.08079675, 1.659655, 1, 1, 1, 1, 1,
0.2181074, 0.9135819, -0.4858468, 1, 1, 1, 1, 1,
0.220261, -0.9803681, 3.386595, 1, 1, 1, 1, 1,
0.2218448, 0.5413823, 2.280862, 1, 1, 1, 1, 1,
0.2225922, -0.3234983, 3.186184, 1, 1, 1, 1, 1,
0.2270757, 0.8666738, 0.2398629, 1, 1, 1, 1, 1,
0.2301429, 1.224311, 0.4228871, 1, 1, 1, 1, 1,
0.2335877, 0.02527096, 1.077731, 1, 1, 1, 1, 1,
0.2353007, 1.214355, 1.365353, 1, 1, 1, 1, 1,
0.2372083, -1.235432, 3.175197, 0, 0, 1, 1, 1,
0.2421615, -1.145764, 3.298377, 1, 0, 0, 1, 1,
0.2423255, 0.006428008, 1.136226, 1, 0, 0, 1, 1,
0.2424584, -0.1328385, 2.475848, 1, 0, 0, 1, 1,
0.2451744, 1.548882, 1.971619, 1, 0, 0, 1, 1,
0.2486873, 0.07136688, 1.41389, 1, 0, 0, 1, 1,
0.2525673, 0.188925, 1.341511, 0, 0, 0, 1, 1,
0.2541224, -0.6622979, 1.121042, 0, 0, 0, 1, 1,
0.2553734, 0.03021923, 1.346611, 0, 0, 0, 1, 1,
0.2596698, 0.2851192, -0.1158689, 0, 0, 0, 1, 1,
0.2610963, 1.163785, 0.02245842, 0, 0, 0, 1, 1,
0.2616405, -1.162288, 5.491513, 0, 0, 0, 1, 1,
0.2625642, 0.663432, 1.640524, 0, 0, 0, 1, 1,
0.2653982, -0.2477804, 2.208469, 1, 1, 1, 1, 1,
0.2695706, 2.311824, 0.2420567, 1, 1, 1, 1, 1,
0.2820777, 0.3223001, 1.090953, 1, 1, 1, 1, 1,
0.2829621, 0.1883626, 1.03379, 1, 1, 1, 1, 1,
0.2830743, -0.3929668, 1.31276, 1, 1, 1, 1, 1,
0.2837435, 0.472341, -0.3850737, 1, 1, 1, 1, 1,
0.2852231, 0.6529728, -0.06795394, 1, 1, 1, 1, 1,
0.2856007, -0.1755138, 3.660813, 1, 1, 1, 1, 1,
0.2862816, 1.144492, 0.05184979, 1, 1, 1, 1, 1,
0.2893812, 0.06939744, 2.048845, 1, 1, 1, 1, 1,
0.2949583, 0.5463943, 1.223223, 1, 1, 1, 1, 1,
0.3072271, -0.1746718, 1.159271, 1, 1, 1, 1, 1,
0.3072751, 0.03478244, 0.9704539, 1, 1, 1, 1, 1,
0.3078298, -1.746628, 2.599125, 1, 1, 1, 1, 1,
0.3081548, 0.6689655, 0.3598373, 1, 1, 1, 1, 1,
0.3084317, -0.02480958, 2.107065, 0, 0, 1, 1, 1,
0.3091584, 1.662407, -0.181675, 1, 0, 0, 1, 1,
0.3095312, 1.57868, -0.5774295, 1, 0, 0, 1, 1,
0.3096097, -1.601828, 0.6822578, 1, 0, 0, 1, 1,
0.3099624, 0.2661597, -0.3155145, 1, 0, 0, 1, 1,
0.3143544, -0.1716357, 1.40116, 1, 0, 0, 1, 1,
0.3167042, -0.19407, 3.733939, 0, 0, 0, 1, 1,
0.3188828, -1.781589, 2.158729, 0, 0, 0, 1, 1,
0.3224819, -1.498931, 2.258401, 0, 0, 0, 1, 1,
0.3229345, 0.8615488, 1.703984, 0, 0, 0, 1, 1,
0.3277371, 2.063044, -1.739525, 0, 0, 0, 1, 1,
0.3292044, 0.5693558, 1.902019, 0, 0, 0, 1, 1,
0.3300392, -2.59122, 1.513211, 0, 0, 0, 1, 1,
0.334142, -0.4157762, 3.626804, 1, 1, 1, 1, 1,
0.3344055, 1.040968, 1.643372, 1, 1, 1, 1, 1,
0.3442419, -2.513781, 3.473637, 1, 1, 1, 1, 1,
0.3524196, -0.7863007, 1.279527, 1, 1, 1, 1, 1,
0.3539967, 0.2325017, -0.2314736, 1, 1, 1, 1, 1,
0.3592821, -1.610514, 3.558721, 1, 1, 1, 1, 1,
0.3686412, -1.216553, 4.422702, 1, 1, 1, 1, 1,
0.3715762, -0.7040116, 2.084106, 1, 1, 1, 1, 1,
0.3732812, -1.203335, 2.452133, 1, 1, 1, 1, 1,
0.373977, -2.008437, 2.00458, 1, 1, 1, 1, 1,
0.3740125, -0.9391869, 2.36092, 1, 1, 1, 1, 1,
0.3742943, -0.3097263, 3.425306, 1, 1, 1, 1, 1,
0.3756037, 0.226079, 0.7049494, 1, 1, 1, 1, 1,
0.3771268, 1.293145, 0.3522093, 1, 1, 1, 1, 1,
0.3781407, -0.3076832, 3.198199, 1, 1, 1, 1, 1,
0.3783035, -0.6089635, 2.348198, 0, 0, 1, 1, 1,
0.38264, 1.417729, 1.424232, 1, 0, 0, 1, 1,
0.388191, -0.6920747, 3.568998, 1, 0, 0, 1, 1,
0.3913707, -2.214513, 1.628832, 1, 0, 0, 1, 1,
0.392399, 0.008033209, 3.011537, 1, 0, 0, 1, 1,
0.3952061, -0.4064291, 1.386175, 1, 0, 0, 1, 1,
0.3954376, 0.3460932, 1.205752, 0, 0, 0, 1, 1,
0.3957411, 2.09674, 0.3652855, 0, 0, 0, 1, 1,
0.4023664, 2.640674, 1.06031, 0, 0, 0, 1, 1,
0.4026255, 0.1193138, 2.193681, 0, 0, 0, 1, 1,
0.4048818, -0.2213763, 4.006861, 0, 0, 0, 1, 1,
0.4090033, -0.4787774, 1.267825, 0, 0, 0, 1, 1,
0.4121917, -2.133122, 2.83158, 0, 0, 0, 1, 1,
0.4126919, -0.7298299, 2.92778, 1, 1, 1, 1, 1,
0.4139267, 0.6819155, 1.819534, 1, 1, 1, 1, 1,
0.4140257, 1.473454, -1.484796, 1, 1, 1, 1, 1,
0.4212528, -0.3064236, 3.57995, 1, 1, 1, 1, 1,
0.4213475, -0.3616837, 3.390396, 1, 1, 1, 1, 1,
0.4214422, -1.039273, 2.158816, 1, 1, 1, 1, 1,
0.4214659, 0.5331065, 0.9945729, 1, 1, 1, 1, 1,
0.4281888, 0.1648359, 1.047161, 1, 1, 1, 1, 1,
0.4293318, 1.277085, -2.054332, 1, 1, 1, 1, 1,
0.4324764, -1.10063, 3.294529, 1, 1, 1, 1, 1,
0.4384617, -0.1825548, 1.158596, 1, 1, 1, 1, 1,
0.4422859, -1.43126, 1.601549, 1, 1, 1, 1, 1,
0.4435427, 0.5122834, 0.546754, 1, 1, 1, 1, 1,
0.444174, 0.682409, -0.4813432, 1, 1, 1, 1, 1,
0.4461334, -0.6454, 3.011746, 1, 1, 1, 1, 1,
0.4531878, -0.6327865, 1.336446, 0, 0, 1, 1, 1,
0.4557444, 0.5209141, -0.3308608, 1, 0, 0, 1, 1,
0.4594169, -2.705374, 4.119812, 1, 0, 0, 1, 1,
0.459417, 0.5006289, 0.3067693, 1, 0, 0, 1, 1,
0.461233, 0.9389256, -0.3311404, 1, 0, 0, 1, 1,
0.4620826, -0.1443498, 0.7004663, 1, 0, 0, 1, 1,
0.4689067, 2.338798, -1.940727, 0, 0, 0, 1, 1,
0.4759423, -0.9106526, 1.974545, 0, 0, 0, 1, 1,
0.4763441, 0.6528894, 0.6975391, 0, 0, 0, 1, 1,
0.4768123, 0.7141774, 0.7868018, 0, 0, 0, 1, 1,
0.4770905, 1.232851, 0.4458602, 0, 0, 0, 1, 1,
0.4781646, -1.110006, 1.582196, 0, 0, 0, 1, 1,
0.4791183, -0.8100567, 3.295075, 0, 0, 0, 1, 1,
0.4922779, -0.1766178, 0.5260786, 1, 1, 1, 1, 1,
0.4991539, -0.6217601, 3.686381, 1, 1, 1, 1, 1,
0.5013902, -0.3321692, 2.482345, 1, 1, 1, 1, 1,
0.5048137, -1.985081, 1.955621, 1, 1, 1, 1, 1,
0.5076621, 0.08173056, 1.333371, 1, 1, 1, 1, 1,
0.5103328, 0.7121913, 1.514625, 1, 1, 1, 1, 1,
0.5115056, -0.07583112, 3.4893, 1, 1, 1, 1, 1,
0.5138221, -1.663561, 3.235428, 1, 1, 1, 1, 1,
0.5169971, -0.5154988, 0.2564657, 1, 1, 1, 1, 1,
0.5173582, 1.394593, 0.6298692, 1, 1, 1, 1, 1,
0.5199713, -0.1524878, 0.2229248, 1, 1, 1, 1, 1,
0.5200468, -0.7629089, 1.704912, 1, 1, 1, 1, 1,
0.5218128, -0.7008824, 2.99389, 1, 1, 1, 1, 1,
0.5234362, -0.4979815, 1.4526, 1, 1, 1, 1, 1,
0.5248219, 1.250225, 0.1381881, 1, 1, 1, 1, 1,
0.5254951, 1.782565, -0.5097263, 0, 0, 1, 1, 1,
0.5274812, 0.8091834, -0.98813, 1, 0, 0, 1, 1,
0.5299814, 1.639547, 0.287556, 1, 0, 0, 1, 1,
0.5312877, 1.226663, 1.158766, 1, 0, 0, 1, 1,
0.5318946, -0.5346816, 1.566781, 1, 0, 0, 1, 1,
0.5364174, -0.2173936, 2.652439, 1, 0, 0, 1, 1,
0.5373155, -0.07782269, 2.766928, 0, 0, 0, 1, 1,
0.5388598, 1.263086, 0.2163141, 0, 0, 0, 1, 1,
0.5438909, -1.734048, 0.8209018, 0, 0, 0, 1, 1,
0.5450194, 0.2205588, 2.152035, 0, 0, 0, 1, 1,
0.546978, -0.5651315, 2.746764, 0, 0, 0, 1, 1,
0.5498607, 1.494549, 0.5896608, 0, 0, 0, 1, 1,
0.5520251, -0.4981596, 3.269005, 0, 0, 0, 1, 1,
0.5542468, 1.219142, -1.144483, 1, 1, 1, 1, 1,
0.5542812, 0.26658, 2.092623, 1, 1, 1, 1, 1,
0.5543966, 0.4478755, 1.219851, 1, 1, 1, 1, 1,
0.56498, 0.4650503, 1.431373, 1, 1, 1, 1, 1,
0.5681382, 0.8745872, 0.3251968, 1, 1, 1, 1, 1,
0.578599, 1.361928, -0.06084055, 1, 1, 1, 1, 1,
0.5865968, 0.4106064, -0.3677289, 1, 1, 1, 1, 1,
0.5872306, 2.816145, -0.1658656, 1, 1, 1, 1, 1,
0.5963352, -0.5025509, 2.554788, 1, 1, 1, 1, 1,
0.6054047, 0.1984412, -0.3617391, 1, 1, 1, 1, 1,
0.6075098, 1.199265, 2.390225, 1, 1, 1, 1, 1,
0.608521, 0.009160106, -0.9989098, 1, 1, 1, 1, 1,
0.6111353, 0.9849768, 1.281753, 1, 1, 1, 1, 1,
0.6158072, 0.5627064, -0.4802948, 1, 1, 1, 1, 1,
0.6161715, 1.063145, 0.7731799, 1, 1, 1, 1, 1,
0.6237535, -1.273467, 0.3135145, 0, 0, 1, 1, 1,
0.6276934, -0.7048905, 3.980269, 1, 0, 0, 1, 1,
0.6366028, 0.6452199, 1.088979, 1, 0, 0, 1, 1,
0.6381791, -0.2343093, 2.484331, 1, 0, 0, 1, 1,
0.6432346, 1.106486, 1.752379, 1, 0, 0, 1, 1,
0.6449335, -0.9427385, 2.955455, 1, 0, 0, 1, 1,
0.6461226, 0.9702535, -0.09737384, 0, 0, 0, 1, 1,
0.6467543, 1.325663, 0.3986866, 0, 0, 0, 1, 1,
0.6489522, 0.7263621, 1.341737, 0, 0, 0, 1, 1,
0.6528954, 1.0023, 1.978777, 0, 0, 0, 1, 1,
0.6603019, -0.7737437, 3.290183, 0, 0, 0, 1, 1,
0.6604314, -0.1353641, 4.886458, 0, 0, 0, 1, 1,
0.6631228, -0.9769022, 2.821012, 0, 0, 0, 1, 1,
0.6692207, 0.06889823, 0.8946129, 1, 1, 1, 1, 1,
0.6737232, -1.153514, 1.32093, 1, 1, 1, 1, 1,
0.674058, -0.6388665, 2.566003, 1, 1, 1, 1, 1,
0.6777306, 0.9698117, 1.392797, 1, 1, 1, 1, 1,
0.6825729, -0.08908053, 3.064552, 1, 1, 1, 1, 1,
0.6922731, 0.07811094, 3.290662, 1, 1, 1, 1, 1,
0.6939084, 2.387457, 0.7526277, 1, 1, 1, 1, 1,
0.6974261, -0.9987844, -0.1011384, 1, 1, 1, 1, 1,
0.6985846, -0.6783414, 1.779182, 1, 1, 1, 1, 1,
0.7009615, 0.09535993, 2.029907, 1, 1, 1, 1, 1,
0.7056968, 0.3662473, 1.500776, 1, 1, 1, 1, 1,
0.7085946, 0.1793211, -0.2433837, 1, 1, 1, 1, 1,
0.7091134, 0.4936984, -1.424782, 1, 1, 1, 1, 1,
0.709517, -2.350871, 1.142197, 1, 1, 1, 1, 1,
0.7112367, -0.9466379, 3.350343, 1, 1, 1, 1, 1,
0.7115958, -1.793522, 1.730202, 0, 0, 1, 1, 1,
0.7218453, -0.6588127, 2.911797, 1, 0, 0, 1, 1,
0.7245213, 0.2734803, 0.4153375, 1, 0, 0, 1, 1,
0.7295746, 0.8716838, -1.026874, 1, 0, 0, 1, 1,
0.7329761, 2.430197, 0.2319621, 1, 0, 0, 1, 1,
0.7338842, 0.2997934, 0.8705169, 1, 0, 0, 1, 1,
0.7354516, 2.140054, 0.9445909, 0, 0, 0, 1, 1,
0.7372229, -1.850692, 4.629365, 0, 0, 0, 1, 1,
0.7380167, -2.098365, 2.956882, 0, 0, 0, 1, 1,
0.73871, 1.521986, -0.9621711, 0, 0, 0, 1, 1,
0.7396983, 0.700904, 2.476937, 0, 0, 0, 1, 1,
0.7429066, 1.032326, 0.9739432, 0, 0, 0, 1, 1,
0.7460368, -1.23815, 2.804464, 0, 0, 0, 1, 1,
0.7464437, 0.04935327, 1.546159, 1, 1, 1, 1, 1,
0.7488993, -2.065482, 1.297487, 1, 1, 1, 1, 1,
0.7576557, -0.6104276, 1.32514, 1, 1, 1, 1, 1,
0.7603113, -0.758807, 4.398809, 1, 1, 1, 1, 1,
0.7635497, 1.896765, 1.702818, 1, 1, 1, 1, 1,
0.7657129, 0.38918, 0.8272389, 1, 1, 1, 1, 1,
0.7669097, 0.4947689, 1.636533, 1, 1, 1, 1, 1,
0.7728025, 1.854423, 1.046457, 1, 1, 1, 1, 1,
0.7802929, -1.923619, 3.743313, 1, 1, 1, 1, 1,
0.7836223, -0.3407675, 2.495286, 1, 1, 1, 1, 1,
0.787503, 0.6352694, 0.6417092, 1, 1, 1, 1, 1,
0.7910069, -0.8840148, 1.69514, 1, 1, 1, 1, 1,
0.7952771, 1.13553, 1.178726, 1, 1, 1, 1, 1,
0.7987703, -0.7280345, 3.689623, 1, 1, 1, 1, 1,
0.8003876, 0.988876, 1.261894, 1, 1, 1, 1, 1,
0.8068407, -0.7413619, 1.869347, 0, 0, 1, 1, 1,
0.8090255, -1.091701, 2.063809, 1, 0, 0, 1, 1,
0.8238586, 0.249975, 2.614036, 1, 0, 0, 1, 1,
0.8365702, -0.6391451, 1.343023, 1, 0, 0, 1, 1,
0.8377253, 0.834335, 0.9750097, 1, 0, 0, 1, 1,
0.840506, 0.07472082, 2.756612, 1, 0, 0, 1, 1,
0.8408673, 0.8698242, 1.72713, 0, 0, 0, 1, 1,
0.8446988, 1.240057, 0.7859797, 0, 0, 0, 1, 1,
0.8448761, 0.4848116, 2.141386, 0, 0, 0, 1, 1,
0.8579603, -0.1982185, 2.541701, 0, 0, 0, 1, 1,
0.873258, -0.9037599, 0.7409637, 0, 0, 0, 1, 1,
0.8748088, 0.629176, 0.9577132, 0, 0, 0, 1, 1,
0.8757225, -0.1119278, 2.864473, 0, 0, 0, 1, 1,
0.8769293, 0.1611509, 0.7387537, 1, 1, 1, 1, 1,
0.8802389, 0.8914447, -0.06940057, 1, 1, 1, 1, 1,
0.8815331, 0.005286347, 1.428178, 1, 1, 1, 1, 1,
0.8869258, -0.8136615, 0.1589897, 1, 1, 1, 1, 1,
0.8877389, -0.1018453, 3.302323, 1, 1, 1, 1, 1,
0.8879106, -0.1305429, 0.3410337, 1, 1, 1, 1, 1,
0.8890916, -1.616649, 2.640509, 1, 1, 1, 1, 1,
0.8916469, 0.1101461, 3.061621, 1, 1, 1, 1, 1,
0.8951543, 0.04706124, 0.7721233, 1, 1, 1, 1, 1,
0.9012173, 1.935689, -0.8399138, 1, 1, 1, 1, 1,
0.9015384, 0.3958161, 1.889219, 1, 1, 1, 1, 1,
0.9087112, 0.7573994, 0.6952599, 1, 1, 1, 1, 1,
0.9089037, -0.8740191, 4.263422, 1, 1, 1, 1, 1,
0.9102585, 1.465461, -1.775666, 1, 1, 1, 1, 1,
0.9114341, -0.1685583, 2.701452, 1, 1, 1, 1, 1,
0.9123924, 0.7261477, -1.971358, 0, 0, 1, 1, 1,
0.9149146, 1.181041, 1.760959, 1, 0, 0, 1, 1,
0.9239864, 0.9472735, 1.818378, 1, 0, 0, 1, 1,
0.9334874, 0.5599806, -0.7434954, 1, 0, 0, 1, 1,
0.942145, 0.4538156, 1.58166, 1, 0, 0, 1, 1,
0.942553, 0.7088227, -0.05228451, 1, 0, 0, 1, 1,
0.9475209, -0.6690934, 1.678851, 0, 0, 0, 1, 1,
0.9514454, 0.7232045, -0.3313806, 0, 0, 0, 1, 1,
0.9517072, -0.2361939, 0.7344272, 0, 0, 0, 1, 1,
0.9548664, 0.2324917, 2.018784, 0, 0, 0, 1, 1,
0.9553489, 0.01870122, 1.929695, 0, 0, 0, 1, 1,
0.9567081, 0.3198688, 1.109162, 0, 0, 0, 1, 1,
0.9635886, 0.4321619, 2.117252, 0, 0, 0, 1, 1,
0.9646062, -0.4174042, 2.831379, 1, 1, 1, 1, 1,
0.9673028, -0.2643821, 2.572818, 1, 1, 1, 1, 1,
0.9700751, -0.6318771, 2.110762, 1, 1, 1, 1, 1,
0.9746164, -0.3883801, 0.8019498, 1, 1, 1, 1, 1,
1.004441, 0.508011, -0.2325074, 1, 1, 1, 1, 1,
1.006924, -1.8844, 4.296688, 1, 1, 1, 1, 1,
1.007987, 0.006380897, 0.01958873, 1, 1, 1, 1, 1,
1.013537, -0.9181685, 4.176542, 1, 1, 1, 1, 1,
1.014115, 0.7704883, 0.1564514, 1, 1, 1, 1, 1,
1.031049, 0.3942654, 1.54141, 1, 1, 1, 1, 1,
1.031769, 0.88351, 2.113712, 1, 1, 1, 1, 1,
1.032947, 1.506077, -0.1955321, 1, 1, 1, 1, 1,
1.040808, -0.9737554, 4.486527, 1, 1, 1, 1, 1,
1.042189, -1.57106, 2.662537, 1, 1, 1, 1, 1,
1.042518, 0.2913996, 0.5501145, 1, 1, 1, 1, 1,
1.04412, 1.701041, 2.275533, 0, 0, 1, 1, 1,
1.046813, 2.216966, 1.60603, 1, 0, 0, 1, 1,
1.048127, -0.5057244, 0.9375688, 1, 0, 0, 1, 1,
1.056424, -0.4349062, 1.815513, 1, 0, 0, 1, 1,
1.058061, -0.01367417, 1.021806, 1, 0, 0, 1, 1,
1.059679, -0.696439, 3.06054, 1, 0, 0, 1, 1,
1.059871, -0.3993225, 2.215364, 0, 0, 0, 1, 1,
1.070143, -0.7693508, 2.253936, 0, 0, 0, 1, 1,
1.073883, 1.680289, 1.139046, 0, 0, 0, 1, 1,
1.075206, -1.429293, 2.245567, 0, 0, 0, 1, 1,
1.081339, 0.2851939, 1.316051, 0, 0, 0, 1, 1,
1.081636, -1.688689, 2.529143, 0, 0, 0, 1, 1,
1.084058, -0.04946913, 1.06986, 0, 0, 0, 1, 1,
1.08642, 0.677913, -0.2337793, 1, 1, 1, 1, 1,
1.091586, 0.1512326, 0.9164279, 1, 1, 1, 1, 1,
1.092009, 1.100435, -1.359836, 1, 1, 1, 1, 1,
1.103234, -0.7102305, 4.049843, 1, 1, 1, 1, 1,
1.109842, 2.539425, -0.2474447, 1, 1, 1, 1, 1,
1.110592, -0.7523395, 2.756509, 1, 1, 1, 1, 1,
1.11322, 0.1218308, 0.85312, 1, 1, 1, 1, 1,
1.114368, -0.5188387, 3.776746, 1, 1, 1, 1, 1,
1.120124, 0.9901399, 1.927727, 1, 1, 1, 1, 1,
1.123834, 1.089377, -0.1005677, 1, 1, 1, 1, 1,
1.124729, -0.1810233, 3.05177, 1, 1, 1, 1, 1,
1.130474, 0.01863548, 1.835638, 1, 1, 1, 1, 1,
1.140261, -0.9852096, 2.245317, 1, 1, 1, 1, 1,
1.142561, 0.1165637, 1.526644, 1, 1, 1, 1, 1,
1.155305, -1.205452, 0.1380632, 1, 1, 1, 1, 1,
1.156855, -0.9646511, 4.136816, 0, 0, 1, 1, 1,
1.167822, 1.36332, 1.167983, 1, 0, 0, 1, 1,
1.174927, 1.372497, 2.013207, 1, 0, 0, 1, 1,
1.182287, -0.853018, 1.816674, 1, 0, 0, 1, 1,
1.18242, -1.302537, 0.7757851, 1, 0, 0, 1, 1,
1.182503, -1.350172, 2.099422, 1, 0, 0, 1, 1,
1.185459, 1.661409, 0.06389623, 0, 0, 0, 1, 1,
1.186868, 1.1634, -0.2419835, 0, 0, 0, 1, 1,
1.190422, 0.8082845, -0.826896, 0, 0, 0, 1, 1,
1.199054, 0.6255785, 2.529907, 0, 0, 0, 1, 1,
1.202415, 1.402685, 2.365545, 0, 0, 0, 1, 1,
1.208476, -0.9981369, 2.374985, 0, 0, 0, 1, 1,
1.213496, -0.742132, 1.825655, 0, 0, 0, 1, 1,
1.219319, 0.1667887, -0.731074, 1, 1, 1, 1, 1,
1.226318, -0.3080564, 0.8556839, 1, 1, 1, 1, 1,
1.228354, -0.3123111, 0.7385067, 1, 1, 1, 1, 1,
1.241661, -0.1598968, 2.165477, 1, 1, 1, 1, 1,
1.242553, 1.159273, 1.95194, 1, 1, 1, 1, 1,
1.24291, -1.587815, 1.926917, 1, 1, 1, 1, 1,
1.250596, 1.449274, -0.6991658, 1, 1, 1, 1, 1,
1.251627, -1.482185, 0.6203635, 1, 1, 1, 1, 1,
1.258813, 0.7572008, 2.116511, 1, 1, 1, 1, 1,
1.268601, -0.01652031, 1.786449, 1, 1, 1, 1, 1,
1.272014, 1.618313, 2.16331, 1, 1, 1, 1, 1,
1.273667, -0.1089108, 1.682146, 1, 1, 1, 1, 1,
1.286379, 1.618986, 0.23473, 1, 1, 1, 1, 1,
1.297821, -0.4271245, 1.02424, 1, 1, 1, 1, 1,
1.303871, -0.1715951, 0.5525851, 1, 1, 1, 1, 1,
1.321003, -0.1607758, 2.855684, 0, 0, 1, 1, 1,
1.321739, -0.4947141, 3.142251, 1, 0, 0, 1, 1,
1.325467, 0.2888868, 2.215258, 1, 0, 0, 1, 1,
1.330143, 0.9885077, 0.8481052, 1, 0, 0, 1, 1,
1.332995, 1.0263, 0.9733366, 1, 0, 0, 1, 1,
1.335896, -1.395981, 3.647212, 1, 0, 0, 1, 1,
1.336322, 0.7841159, 0.03315436, 0, 0, 0, 1, 1,
1.353102, -0.4385467, 2.436017, 0, 0, 0, 1, 1,
1.354564, 2.302361, 1.514476, 0, 0, 0, 1, 1,
1.355211, -0.3268251, 2.224397, 0, 0, 0, 1, 1,
1.35715, -1.432325, 1.291687, 0, 0, 0, 1, 1,
1.360485, -0.7326447, 2.01147, 0, 0, 0, 1, 1,
1.368388, 2.043212, 0.160427, 0, 0, 0, 1, 1,
1.37639, 0.7847468, -1.301888, 1, 1, 1, 1, 1,
1.383588, 0.9302701, 2.263511, 1, 1, 1, 1, 1,
1.391159, 0.8266097, 1.983154, 1, 1, 1, 1, 1,
1.405863, 2.56763, 1.647664, 1, 1, 1, 1, 1,
1.408558, 1.026816, 1.855232, 1, 1, 1, 1, 1,
1.419873, 0.05374615, 0.927652, 1, 1, 1, 1, 1,
1.420757, 0.8561732, 1.245023, 1, 1, 1, 1, 1,
1.423009, -0.3108267, 0.1807829, 1, 1, 1, 1, 1,
1.427838, 0.3632754, 1.386467, 1, 1, 1, 1, 1,
1.440412, -0.392646, 1.626956, 1, 1, 1, 1, 1,
1.441052, -1.333575, 2.339439, 1, 1, 1, 1, 1,
1.445246, -0.7039317, 2.105855, 1, 1, 1, 1, 1,
1.450592, 3.126966, -0.2685305, 1, 1, 1, 1, 1,
1.458984, -1.510741, 2.370538, 1, 1, 1, 1, 1,
1.463045, -0.1394157, 0.03394517, 1, 1, 1, 1, 1,
1.463778, -0.1366963, 2.613259, 0, 0, 1, 1, 1,
1.472326, -0.1043775, 2.71753, 1, 0, 0, 1, 1,
1.477441, -0.20453, 1.11134, 1, 0, 0, 1, 1,
1.478439, -0.9407284, 1.53289, 1, 0, 0, 1, 1,
1.485761, -2.644054, 2.596556, 1, 0, 0, 1, 1,
1.493069, -1.030294, 2.616968, 1, 0, 0, 1, 1,
1.496595, -1.806982, 2.318951, 0, 0, 0, 1, 1,
1.50508, -1.234313, 3.366383, 0, 0, 0, 1, 1,
1.506791, -0.1834335, 2.561913, 0, 0, 0, 1, 1,
1.512865, 0.1903245, 2.123222, 0, 0, 0, 1, 1,
1.52146, 0.01210778, 0.3117886, 0, 0, 0, 1, 1,
1.521881, -1.13692, 0.4732572, 0, 0, 0, 1, 1,
1.528626, -0.7326221, 2.830386, 0, 0, 0, 1, 1,
1.536052, 0.708046, 1.708539, 1, 1, 1, 1, 1,
1.552628, -0.7416579, 2.145583, 1, 1, 1, 1, 1,
1.56883, 0.5319448, -1.265906, 1, 1, 1, 1, 1,
1.575656, 0.484495, 0.7242851, 1, 1, 1, 1, 1,
1.583151, -1.196114, -0.2292598, 1, 1, 1, 1, 1,
1.590072, 0.0712212, 0.2470621, 1, 1, 1, 1, 1,
1.596991, 0.02307193, 1.018939, 1, 1, 1, 1, 1,
1.601162, -0.1149268, 0.5054151, 1, 1, 1, 1, 1,
1.602966, 0.9579992, 0.6167935, 1, 1, 1, 1, 1,
1.613151, 1.871352, 2.428721, 1, 1, 1, 1, 1,
1.623902, -0.3179375, 4.13483, 1, 1, 1, 1, 1,
1.634741, 0.1814613, -0.01368987, 1, 1, 1, 1, 1,
1.648712, -0.1897517, 2.793012, 1, 1, 1, 1, 1,
1.661721, 0.5112725, -1.037714, 1, 1, 1, 1, 1,
1.665612, -0.119861, 1.858838, 1, 1, 1, 1, 1,
1.666233, 0.6661624, 0.3473039, 0, 0, 1, 1, 1,
1.674198, -1.016644, 2.254904, 1, 0, 0, 1, 1,
1.676849, 0.1666744, 1.925552, 1, 0, 0, 1, 1,
1.684882, 1.022133, 1.4593, 1, 0, 0, 1, 1,
1.702283, -0.4965377, 1.113605, 1, 0, 0, 1, 1,
1.706057, 0.6169665, 2.199145, 1, 0, 0, 1, 1,
1.709462, 0.8741633, 1.882604, 0, 0, 0, 1, 1,
1.725971, 0.9334314, -0.8164286, 0, 0, 0, 1, 1,
1.751578, 0.5989511, 2.060038, 0, 0, 0, 1, 1,
1.755286, 0.796429, 2.31892, 0, 0, 0, 1, 1,
1.768087, -0.1166581, 3.232874, 0, 0, 0, 1, 1,
1.775067, -0.5476829, 3.072716, 0, 0, 0, 1, 1,
1.783157, -0.2919304, 0.3749679, 0, 0, 0, 1, 1,
1.788787, -1.907837, 2.430242, 1, 1, 1, 1, 1,
1.788908, 0.8243836, 1.318388, 1, 1, 1, 1, 1,
1.789289, 0.349695, 1.446923, 1, 1, 1, 1, 1,
1.798038, 1.390654, 0.6712015, 1, 1, 1, 1, 1,
1.804351, -0.5333748, 1.513546, 1, 1, 1, 1, 1,
1.810318, -1.25082, 2.002271, 1, 1, 1, 1, 1,
1.842385, 0.344878, 1.036766, 1, 1, 1, 1, 1,
1.928923, 1.869823, 2.349825, 1, 1, 1, 1, 1,
1.944323, 0.3889606, 1.950724, 1, 1, 1, 1, 1,
1.954136, 0.6621698, 1.250793, 1, 1, 1, 1, 1,
1.973046, -1.038046, 2.139734, 1, 1, 1, 1, 1,
1.985145, 1.272155, 1.314253, 1, 1, 1, 1, 1,
2.005505, 0.3248624, 1.77377, 1, 1, 1, 1, 1,
2.041677, 1.098274, 1.338427, 1, 1, 1, 1, 1,
2.044947, -0.8046033, 1.130141, 1, 1, 1, 1, 1,
2.051477, 0.8400097, 1.530421, 0, 0, 1, 1, 1,
2.066694, -0.09135284, 4.055946, 1, 0, 0, 1, 1,
2.07147, -0.05949575, 1.522781, 1, 0, 0, 1, 1,
2.083379, -0.3865891, 2.907746, 1, 0, 0, 1, 1,
2.136072, 0.1218516, 0.7827186, 1, 0, 0, 1, 1,
2.171567, -1.124174, 1.239257, 1, 0, 0, 1, 1,
2.187297, 1.272485, 0.6549523, 0, 0, 0, 1, 1,
2.229272, -0.4447518, 2.186093, 0, 0, 0, 1, 1,
2.266144, -0.06447379, 1.511827, 0, 0, 0, 1, 1,
2.349485, 2.32392, 2.047382, 0, 0, 0, 1, 1,
2.367933, -0.3781923, 1.616794, 0, 0, 0, 1, 1,
2.404507, -0.8681264, 1.721221, 0, 0, 0, 1, 1,
2.432667, 0.8489863, 1.863344, 0, 0, 0, 1, 1,
2.437217, 0.7921679, -0.3254816, 1, 1, 1, 1, 1,
2.551896, 0.3448372, 1.539308, 1, 1, 1, 1, 1,
2.590001, 0.5097633, 0.7707241, 1, 1, 1, 1, 1,
2.606065, -0.6068775, 2.997773, 1, 1, 1, 1, 1,
2.606665, 0.5406082, 1.601296, 1, 1, 1, 1, 1,
2.655603, -1.868469, 2.576289, 1, 1, 1, 1, 1,
3.311717, -2.118928, 3.064143, 1, 1, 1, 1, 1
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
var radius = 9.630656;
var distance = 33.82727;
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
mvMatrix.translate( 0.1337698, -0.4731736, -0.2296057 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82727);
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
